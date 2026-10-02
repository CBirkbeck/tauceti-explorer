# Verification of RT-PAPER-LI-ZHANG-22-B

Codex, session `codex-5ebb6f`, 2 October 2026. Issue [#4261](https://github.com/CBirkbeck/tauceti-explorer/issues/4261). **All 42 findings confirmed:** 7 high, 19 medium and 16 low. Each finding has its own evidence and corrected repair in [the verdict file](../redteam/RT-PAPER-LI-ZHANG-22-B.review.json). Confirmation includes the qualifications below; it does not accept every sentence of the proposed fixes.

I did none of the extraction, its accepted review or this red team. Their sessions are `cc-fb70e5`, `cc-7b31c4` and `cc-c2c06b`, respectively. The verification follows PROTOCOL §17 and does not change those inputs, the atlas or a blueprint packet.

## Evidence inspected

Repository base: `2b40cf16025787f14a3d388a0ce7ac5a35b62340`. Read all 42 finding objects, all 116 extraction items, all 22 prerequisite entries, all five routes and five sourceIssues, the extraction report and its accepted review. The verdicts check each named statement against the source passage and the relevant owner contract. They are a verification of these findings, not a new whole-paper extraction.

The principal source is [Li–Zhang, arXiv:1908.01701v3](https://arxiv.org/pdf/1908.01701v3), 1 December 2020, 92 PDF pages, SHA-256 `7db1843f90c3e79741f8d58d92b6bb42b0a3b7ae001c8f9419f43b08c2119d49`. Read PDF pages 5, 8–16, 18–45, 51, 56–59, 62–63, 66–70, 72, 74–89. These cover the claimed defects' source passages and their local proof contexts. Rendered and inspected pages 16, 25, 62, 63 and 82 to check the sensitive formulas. The [arXiv version history](https://arxiv.org/abs/1908.01701) confirms v3 is the latest arXiv version.

Additional public primary texts were fetched independently:

| Text | Version and digest | Passages actually read |
| --- | --- | --- |
| [Li–Zhang author-hosted copy](https://www.math.columbia.edu/~chaoli/KRProof.pdf) | 94 PDF pages; `638cc02353153416f43bf6bb440240857001a06553f82c417acbe6cf905c9537` | §3.2 p.17; Lemma 5.3.1; Example 9.1.3; §9.2; revised Conjecture 10.4.1 |
| [Li–Rapoport–Zhang](https://arxiv.org/pdf/2404.02214v2) | v2, 1 May 2026, 73 pages; `4e687dfc505fb8555f0155c486ec849508f7c1af384446ed155c506a894a1bba` | Introduction Theorem 1.0.1; Theorem 14.6.2 and Example 14.6.3, pp.60–61; Proposition 16.1.4 and Corollary 16.1.5, pp.68–69 |
| [Kudla–Rapoport, global theory](https://arxiv.org/pdf/0912.3758v2) | v2; `4184d46227f59875b0aba2178af2fac5baee21aa06ef201aed1d782c69c91d41` | Proposition 10.1 and measures, p.37; Lemma 2.21 and Proposition 2.22, pp.14–15 |
| [Sankaran](https://arxiv.org/pdf/1405.3414v1) | v1, 14 May 2014; `e7b345756971f02379b095a3027cee256f47464442423786f6e16532861a3395` | Proposition 3.1, p.17; Theorem 2.8 and horizontal component, p.5; Theorem 4.13 and its local-factor/Siegel–Weil reduction, pp.33–34 |
| [Zhang's published Appendix B](https://archive.ymsc.tsinghua.edu.cn/pacm_download/21/12000-annals.2021.193.3.5.pdf) | Annals 193 (2021), 863–978, 116 PDF pages; `6f8ac537b4f95cf26ba907dc1d25c1b9d9157a3a4006a311b114a522177d3b45` | Appendix B pp.971–974, PDF pages 109–112; supported groups, filtrations, products, Euler degree and Lemma B.2(i) |
| [Tate, p-divisible groups](https://www.math.purdue.edu/~tongliu/teaching/598/p-divisible.pdf) | Original English chapter scan, printed pp.158–183; `720bf7128d4f048853435b083d18d0d863056c1f991942192a7f00daa7e424aa` | Printed pp.176–182, including completed-field invariants, character/differential maps, Theorem 3 and Theorem 4/Corollary 1 |

All digests are SHA-256 of downloaded PDF bytes. These are selective readings of the supplementary texts, not complete readings. Sankaran's preprint numbers the horizontal theorem **2.8**; Li–Zhang cites the journal's **2.9**. The theorem's own horizontal component has degree one before pullback by the degree-`q+1` auxiliary map.

Searched the paper title with correction/erratum terms, checked both authors' public publication pages ([Li](https://www.math.columbia.edu/~chaoli/index.html), [Zhang](https://math.mit.edu/~wz2113/math/pub.html)), and checked the arXiv histories. No separate correction notice was located. The [AMS landing page](https://www.ams.org/journals/jams/2022-35-03/S0894-0347-2021-00988-5/) was inaccessible through the browser tool; the journal PDF was not compared. The author-hosted copy is separately identified, not asserted identical to the journal. Consequently, newly recorded slips must be scoped to the inspected versions, and no claim that they are previously unknown published errors is justified.

The author-hosted copy already removes the false **raw** density equality in §3.2 and rewrites Conjecture 10.4.1 with the geometric properties later supplied by LRZ. Its Lemma 5.3.1, ordering in Example 9.1.3 and interpolation exponent still exhibit the inspected discrepancies. This matters when recording whether an error is known or version-specific.

## Repairs that need qualification

**/3: raw and normalized density cancellation.** For a self-dual `M` of rank `m` and `L` of rank `n`, set `N=n+m+k`. Raw cancellation has the additional factor

```text
Den(<1>^N,L ⊕ M) = Den(<1>^N,M) · Den(<1>^(N-m),L),
Den(<1>^N,M) = ∏_{i=N-m+1}^N (1-(-q)^(-i)).
```

The rank-one self-dual example at `k=0` disproves the printed raw equality. Dividing by the respective self-dual denominators restores the normalized cancellation, including its derivative. This repair leaves the normalized theorem intact.

**/4: the required open-stratum vanishing.** The hyperplane class on `Y_2` survives removal of the finite `X_0`, contradicting unrestricted Lemma 5.3.1(iii). In the range `j≥d-i`, each remaining stratum of dimension `m>i` enters localization with codimension `d-m`, hence twist `j-d+m≥1`. The stratum eigenvalue calculation then excludes generalized eigenvalue one. That is enough for the use in Theorem 5.3.2. A filtered union of semisimple representations need not be semisimple; the repaired plan must not assert the stronger property without proving it.

**/5 and /7: numerical normalization.** The rank-two example's formulas use `a≥b`, as Sankaran's Proposition 3.1 does. For invariants `(1,2)`, Proposition 3.7.1 gives `(1-X)(1+qX+X²)`; the printed `(a,b)=(0,2)` formula differs by `q²(q+1)X(X-1)`. In §9.2, KR14's actual determinant/Weil factor is `(-q)^(-n)`, consistent with the value and derivative displays immediately after the erroneous interpolation. Both issues alter literal formulas, even where subsequent theorems use the correct normalization.

**/6, /17 and /24: use the actual later geometry.** The needed comparison is between the Euler characteristic on the auxiliary space and that on `Z(x_0)`. Regularity, a proper map that is an isomorphism away from zero-dimensional centers, and the divisor/pullback comparison make the proof on v3 p.72 available to the almost-self-dual semi-global and global arguments. Import those inputs explicitly.

LRZ does **not** prove the full scheme-theoretic inverse-image clause literally printed in v3. Corollary 16.1.5 identifies the exceptional divisor with the **reduced** inverse image. Example 14.6.3 explicitly gives a nonreduced inverse image of multiplicity `q+1` in dimension two. The introductory EGA blow-up description uses an ideal **supported** at the centers, not an assertion that the reduced center ideal is the blow-up ideal. Add Theorem 14.6.2's actual statements and the use-by-use transport; retain the historical conjecture separately. Do not replace the old hypothesis by a false literal equality.

**/9–/11: proof dependencies and library scope.** AL.0 owns local Fourier theory. The pinned integral uses a negative bilinear kernel: for the paper's positive-sign convention choose the negated trace pairing, or the negated character. The declaration supplies neither a canonical self-dual measure nor the full p-adic inversion/lattice theorem. Local Weil operators use MP.2; adelic operators use MP.3/MP.4; sections must be downstream of their principal-series supplier. Tate's *chosen source proof* uses the Hodge–Tate/Galois ingredients read in the original chapter. Supply those downstream of the p-divisible carrier or give an independently justified acyclic earlier proof; no universal claim that every possible proof needs T0 is made.

**/18: formal filtered K-theory.** Published Zhang p.972 proves the rational Adams-filtration formula for regular **schemes**, while leaving its formal extension expected. Li–Zhang uses that formula on a formal RZ space despite its initial qualification. Either prove the exact formal cases required in FormalSupportedIntersections, including the local Cartier/regular-sequence cases, or use the Euler/local-modularity bypass of Corollary 6.4.10 and Remark 6.4.11. That bypass is not a proof of every generic formal filtration assertion. Keep separate the construction of a derived class, its filtration membership, and the fact that an Euler pairing factors through a graded piece.

**/26: cited results need faithful transports.** KR14 Lemma 2.21 is a supersingular-support statement at finitely many nonsplit primes, not the full generalized singleton-Diff statement proposed in the fix. Its refinement and transport to general `F_0` require an argument. Terstiege's original special-fiber statement must likewise be transported through the blow-up before using strict transforms. Record separate input items with their actual hypotheses and version-dependent numbering; the citation alone does not establish the broader interface.

**/36–/38: complete the recorded repairs.** The vertical parts depend on the hyperplane. Over `Q_3(i)`, take `L=<3>³`, `f=e_2+(1+i)e_3`, `L♭=<e_1,f>` and `x=e_3`. There are 28 isotropic lines in the residue hermitian space. Exactly one lies in the first hyperplane and four in `<e_1,e_2>`, giving horizontal derivatives 1 and 4 and vertical derivatives **−5 and −8**. The separate equalities in §8.2 are false; equality of the *differences* remains the valid induction repair.

For the sign repair, `c_1` uses the negative divisor line bundle, so projection against a curve yields `-Int`. Propagate that sign through every reduction, obtaining `(-1)^d` in Lemmas 6.4.6–6.4.7. The homogeneous Fourier conclusions remain valid. For the non-unit integral-norm case in Lemma 6.2.1, use translation by the lattice to reach a unit-norm representative before invoking (5.4.5.5); the missing step cannot be replaced by quoting its unit-norm statement for all integral norms.

**/40–/42: sourceIssue classifications.** The global Eisenstein condition, all-place Diff convention and isogeny degree change literal construction/hypothesis contracts. Their intended corrections may be clear, but marking all of them as affecting nothing would hide that effect. Define `q_v0=#k_{F_0,v0}`; the polarization ratio is `q_v0^4`, hence the isogeny degree is `q_v0²`, with kernel of `O_{F,w0}`-length one. If the undefined symbol were meant to denote the extension residue cardinality instead, its value would already be `q_v0²` in this convention. State the convention explicitly.

## Ownership checks and disposition coverage

Read the actual assembled stage descriptions and the accepted RS-02/RS-04/RS-18/RS-23 decisions rather than relying on the extraction's stale ownership list. Also read the relevant accepted sibling routes and items listed in the verdicts. These suppliers remain plans; no theorem is claimed formalized.

| Findings | Checked correction |
| --- | --- |
| /1–/2 | Import LubinTateFormalModulesAndQuasiCanonicalLifts and FormalSupportedIntersections; keep cycle-specific instances downstream. |
| /3–/7 | Raw density factor, open-stratum range, rank-two ordering, auxiliary-space comparison and negative Whittaker exponent. |
| /8–/10 | Shared doubling Eisenstein series, AL.0 Fourier theory, MP.2 local and MP.3/MP.4 adelic representations; sections downstream. |
| /11–/15 | Acyclic Tate proof contract, one upstream unitary DL variety, shared RZ representability, MP.5/MP.6 Siegel–Weil, shared general arithmetic Chow supplier. |
| /16–/18 | Missing prerequisites, qualified LRZ geometry and explicit formal-(B.3) proof gate. |
| /19–/20 | Special-cycle deformation condition, small-rank Tor/base case and common-factor locus. |
| /21–/23 | Equivariant duality/localization/semi-purity, Terstiege rank-three input, Kummer/NS divisor injectivity. Reuse the common duality item. |
| /24–/26 | Cartier lemma's geometric assumption, inherited dyadic hypothesis, five cited inputs with faithful transports. |
| /27–/29 | VB0 rational slopes versus R07.2 integral comparison; S.7 K/Chow versus SF.5 geometric GRR; EDC.3 étale cycle classes. |
| /30–/35 | Fixed-dimension valuation induction, current ownership/titles, inert-admissibility, common RZ embedding, lattice range and Breuil-S comparison. |
| /36–/39 | False separate vertical equalities, propagation of divisor signs, unit-norm translation gap and six version-scoped notation slips. |
| /40–/42 | Global M8, all-place/base-field conventions and defined isogeny degree. |

The sibling route comparisons include BKO/AGHMP quasi-canonical lifts; Zhang21 formal K-theory/RZ embeddings/arithmetic divisors; EHLS/CFK doubling; Liu-et-al22 unitary DL varieties; Scholze–Weinstein20 and Fargues–Fontaine18 RZ suppliers; Li23/AGHMP Siegel–Weil; Shankar-et-al22 arithmetic Chow; Li–Liu21/22 incoherent derivative expansions; and Feng–Yun–Zhang24's distinct shtuka candidate. The chosen owner for general arithmetic Chow theory needs a Part II or maintainer request extending beyond arithmetic curves, not a false planned status for an absent full interface. Coordinate the cross-paper handoffs in /8, /12 and /15 without editing sibling jobs here.

Read the reviewed `data/library-coverage.json` entries for AL.0 and MP.2 and confirmed the actual baseline repository HEADs: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The positive declaration checked is [VectorFourier.fourierIntegral](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/Fourier/FourierTransform.lean#L82), with its surrounding scalar, character, bilinear-map and measure hypotheses. No broad library-absence claim or complete implementation is inferred from a name search.

Input fingerprints:

```text
RT-PAPER-LI-ZHANG-22-B.result.json
d2be04566d1cc7bf0c9676595f168d44b9e0a6fb1762722f1818012c74e9cd73
PAPER-LI-ZHANG-22-B.result.json
f0699f58e794df256c54a21b62db5e38964bbd21611329df73a5826564d7dea7
PAPER-LI-ZHANG-22-B.md
fbfabdfcf924668a0068ae38f7872dc7a413875823ceee0443f4a7c36fa64057
PAPER-LI-ZHANG-22-B.review.json
263f24e233d225152e0876828f5c85e52ddada53dea4d3206e0abfac8b4849d0
```

## Validation and limits

The six portable arithmetic groups below passed: the raw density factor; rank-two ordering; exhaustive residue-field isotropic-line counts; sign recursion; norm translation; and polarization-degree relation. These checks support explicit examples and formula repairs, not general formalization.

Validation passed: `python3 scripts/check_redteam.py research/blueprint/redteam/RT-PAPER-LI-ZHANG-22-B.review.json` reports **ok**; `python3 research/blueprint/intake.py check-files` on the two issue deliverables reports **2 files, 0 problems**; exact finding-id uniqueness/coverage and severity counts pass; the reproducer extracted from this report passes all six groups. The staged diff is checked before submission.

No Lean file is a deliverable of this verification, and no Lean compilation was run. No build, cache download or language server was started. The original proofs of every prerequisite paper were not reread: /19–/23 and part of /26 verify the omissions against the actual Li–Zhang uses and owner contracts, leaving the source-specific theorem proofs to the fixer/design closure checks. This review does not certify a complete roadmap proof or repair the published text.

The portable reproducer is retained here so the examples remain reviewable after scratch cleanup:

```python
from fractions import Fraction as Q
from itertools import product
from math import prod

# /3: raw self-dual densities at n=m=1, k=0.
for q in (3, 5, 7):
    den1 = 1 + Q(1, q)
    den2 = den1 * (1 - Q(1, q*q))
    assert den1 != den2
    assert den2 / den1 == 1 - Q(1, q*q)
print('/3 raw density counterexample and missing factor: PASS')

# /5: (9.1.3.1), exactly as printed; avoid its removable poles.
def printed(a, b, q, X):
    eps = b % 2
    return ((1-X)*(X*X-(q*q-q)*X+1)**eps + (1-X)/(1-X/q)*(
        q*X*(1-q)*((q*X)**b-(q*X)**eps)/(q*X-1)
        + X*X*(q-X/q)*(X**(2*b)-X**(2*eps))/(X*X-1)
        + (-q**(b+1)*(X-1)+q*X**(b+1)-X**(b+2)/q)
          *(X**(a+1)-X**(b+1))/(X*X-1)))
for q in (3, 5, 7):
    for X in (Q(2), Q(3, 2), Q(2, 3), Q(-2)):
        correct = (1-X)*(1+q*X+X*X)  # Prop.3.7.1 on invariants (1,2).
        assert printed(2, 0, q, X) == correct
        assert printed(0, 2, q, X) - correct == q*q*(q+1)*X*(X-1)
print('/5 rank-two formula and reversed ordering: PASS')

# /36: all projective isotropic lines of F_9^3, i^2=-1.
F = list(product(range(3), repeat=2)); zero=(0,0); one=(1,0)
def add(x,y): return ((x[0]+y[0])%3,(x[1]+y[1])%3)
def mul(x,y): return ((x[0]*y[0]-x[1]*y[1])%3,(x[0]*y[1]+x[1]*y[0])%3)
def norm(x): return (x[0]*x[0]+x[1]*x[1])%3
def inv(x): return next(y for y in F if mul(x,y)==one)
lines=set()
for v in product(F,repeat=3):
    if all(x==zero for x in v): continue
    pivot=next(x for x in v if x!=zero)
    lines.add(tuple(mul(x,inv(pivot)) for x in v))
isotropic={v for v in lines if sum(norm(x) for x in v)%3==0}
v0=(1,1)  # f=e2+(1+i)e3; norm(1+i)=2.
W1={v for v in isotropic if v[2]==mul(v0,v[1])}
W0={v for v in isotropic if v[2]==zero}
assert (len(lines),len(isotropic),len(W1),len(W0))==(91,28,1,4)
total=(1+3)*(1-3**2)+len(isotropic)
assert (total,total-len(W1),total-len(W0))==(-4,-5,-8)
print('/36 isotropic lines / horizontal counts / vertical values: 28 / (1,4) / (-5,-8): PASS')

# /37: projection-formula recursion with the negative divisor line bundle.
for q in (3,5,7):
    c0=1
    for d in range(1,7):
        c0 *= q**(2*d)-1
        c=prod(1-q**(2*i) for i in range(1,d))
        assert c0==(-1)**d*c*(1-q**(2*d))
print('/37 corrected c(0) sign recursion: PASS')

# /38: Q_3(i), <3>^3. u=(e2+(1+4i)e3)/3, lambda=e2.
assert Q(3)*(Q(1,3)**2+(Q(1,3)**2+Q(4,3)**2))==6
assert Q(3)*(Q(4,3)**2+(Q(1,3)**2+Q(4,3)**2))==11
assert 6%3==0 and 11%3!=0
print('/38 integral norm 6 shifts to unit norm 11: PASS')

# /42: polarization degrees at the inert place, q=#k_F0.
for q in (3,5,7):
    polarization_ratio=q**2*q**2
    assert (q**2)**2==polarization_ratio and q**2!=polarization_ratio
print('/42 isogeny degree q^2 from polarization ratio q^4: PASS')
```
