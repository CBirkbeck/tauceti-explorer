# Fixes to the Qian paper extraction

Completed 2026-10-01 by Codex, session `codex-rtOQ9t`, for
[issue #5505](https://github.com/CBirkbeck/tauceti-explorer/issues/5505),
`FIX-RT-PAPER-QIAN-23`, against base `b8ce9b4`.
All three findings in `RT-PAPER-QIAN-23.result.json` were confirmed in
`RT-PAPER-QIAN-23.review.json` and are applied here. The fixes await their
independent review. This report is an implementation account, not that review.

Only the issue's three deliverables are changed: this report, the paper
extraction JSON and its reader document. Existing item IDs, classifications,
route memberships, source-issue verdicts and the original extraction review
are preserved. The changes require no new blueprint node, owner or roadmap.

## RT-PAPER-QIAN-23/1: propagate the accepted sign correction

**Fixed.** Items 087–088 now use the E43 correction in their statements and
proof outlines, rather than leaving it solely in the source-issue record.
In geometric Artin reciprocity with $\mathrm{HT}(\varepsilon_l)=\{-1\}$,
consecutive labelled weights starting at $c_\tau$ correspond to constant
automorphic weight $+c_\tau$. For an algebraic Hecke character with Galois
weights $h_\tau$, the character relation is

$$
r_\iota(\phi)\circ\operatorname{Art}_v(x)
=\iota^{-1}\phi_v(x)\prod_\tau\tau(x)^{-h_\tau}.
$$

The Galois side has unit values, so evaluation at a uniformizer gives

$$
\operatorname{val}_l(\iota^{-1}\phi_v(\varpi_v))
=\sum_\tau h_\tau\operatorname{val}_l(\tau(\varpi_v)).
$$

For the central character $h_\tau=nc_\tau$. Since its local character is
$\psi_v^n$, division by $n$ and multiplication by $j$ give the positive
$j c_\tau$ slope. Item 135 now uses $c_\tau$ in this same convention and
explicitly substitutes $c_\tau=\lambda_\tau$ in 087–088. Its note also
explains that a dual parameter would have to be negated before substitution.
Routes 1 and 4 and the reader document carry these contracts.

The semisimplicity qualification in 087, E40–E41, and the valid conclusion
of Lemma 4.3 are retained. Geraghty's original Hecke calculations remain the
existing imported-source boundary S4; fixing the sign does not certify those
unread proofs.

Item 088 has two acceptance specifications. The idèle norm has realization
$\varepsilon_l$, weights $-1$, local value $q_v^{-1}$ and valuation $-f_v$,
so it detects the character sign. Twisting a weight-zero cuspidal representation
with a Steinberg component by $\|\det\|^{-1}$ twists its realization by
$\varepsilon_l^{-1}$ and moves the consecutive starting weight to 1. Its
central slope increases by $nf_v$ and each partial slope by $jf_v$, as the
corrected formulas require. These are mathematical specifications, not Lean tests.

## RT-PAPER-QIAN-23/2: require all roots in the coefficient field

**Fixed.** Both 076 and 078 require all $m$-th roots of every element of
$\mathbf F_{l^s}$ in a fixed algebraic closure, matching the published §4
coefficient-field construction. Item 073 makes the same quantifier explicit.
The proof in 076 now uses the roots of 1 to obtain
$\mu_m(\overline{\mathbf F}_l)\subseteq k(\lambda)$; this gives the precise
hypothesis $m\mid\#k(\lambda)^\times$ for item 014. The statement of 078
checks this call and the auxiliary-prime call, where $l'\equiv1\pmod n$
supplies the roots of unity and item 077 supplies the power-valued character.
The successive avoidance-field construction and determinant identities stay
as before. Route 13 and the reader use the exact all-roots hypothesis.

The negative specification is included in 076 and 078:
$l=3$, $n=m=7$, $s=1$, $N=7381=11^2\cdot61$, $F=\mathbf Q(i)$ and trivial
residual representation. Here $\operatorname{ord}_N(3)=10$, so
$k(\lambda)=\mathbf F_{3^{10}}$ contains $\mathbf F_9$ and has multiplicative
order 59048. Seventh powering is bijective because
$\gcd(7,59048)=1$, so one seventh root exists for every element, yet the
field lacks the nontrivial seventh roots of unity. The additional exclusion
$N\nmid3^5+1=244$ also holds. Thus the weak condition must not pass either
coefficient-field contract.

E5's independent correction is preserved: when $n=l^am$, the distinct
$n$-th roots of unity in characteristic $l$ are precisely $\mu_m$, and the
divisibility requirement is for $m$, not $n$. The case $n=l$, $m=1$ remains
an acceptance specification rejecting the stronger incorrect divisibility.

## RT-PAPER-QIAN-23/3: remove the false monodromy shortcut

**Fixed.** The zero-exponent sufficient condition is removed from item 139
and from 105's alternative justification. The selected-family statement
in 105 identifies the specific character, without treating zero occurrence
as a monodromy hypothesis. Its proof and note use Corollary 3.5 (049) and
coefficient-conjugation compatibility. Item 139 and route 13 retain the
actual maximal-monodromy hypothesis for every conjugate character and the
existing consecutive-Hodge–Tate-weight proof boundary E11. The companion's
conditional theorem and the published potential-automorphy conclusions are
not withdrawn.

New source issue **E50** records the error in Remark 1.2 of the companion
**arXiv:2103.00106v1**, p. 2. It is scoped to that preprint, with its version,
date and hash, rather than attributed to the published main paper. The
independent red-team verification is linked as evidence; no independent fix
review verdict is invented. The previous 49 source records, including the
withdrawn E10 and accepted E43, remain unchanged.

The counterexample is an acceptance specification in 139. For $N=5$ and
$a=(1,2,2,0,0)$, take A'Campo's hypergeometric parameters
$\alpha=(0,3)$ and $\beta=(1,2)$ modulo 5. Definitions 2.1.1–2.1.2 reconstruct
a permutation of $a$ from $-\alpha=(0,2)$ and the complement
$\{0,1,2\}$ of $-\beta$. Proposition 2.1.3 gives rank two. Proposition 2.5.7
gives two Jordan blocks of size one, so infinity monodromy is the identity,
with minimal polynomial $X-1$, whereas maximality requires $(X-1)^2$.
Every coefficient conjugate preserves the distinctness of the two $\alpha$
entries. Reversing the cohomological action convention only dualizes the
identity. This is a check on the source criterion, not a refutation of the
conditional theorem. No broader exponent criterion is introduced.

## Sources rechecked for the fixes

Downloaded public texts and read the specified passages on **2026-10-01**.
The current fix reading is bounded to these passages; the earlier full Qian
readings are documented in the accepted red-team report.

| Source | Passages read for this fix | SHA-256 |
| --- | --- | --- |
| [Qian, published main paper](https://par.nsf.gov/servlets/purl/10388233) | PDF pp.28–30,34–35, corresponding to journal pp.1266–1268,1272–1273; page image of the Lemma 4.3 proof | `77969caa063c52027dc7274ccef679ce11a2382b8e0b5a8565847922a8d7c0d8` |
| [Qian, companion v1](https://arxiv.org/pdf/2103.00106v1) | p.2, including its page image; §4, pp.19–23 | `87c4ee8499f3a615a81307e17d38d6f00ab544da9d22384f213bbc06052722e9` |
| [ACC+, published author copy](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf) | Conventions pp.906–907, central-character weight p.987, ordinary convention p.1028 and Theorem 6.1.1(5)(b), p.1029 | `c5429e4f384384045dbb48502d71547bb21699783c0f77cce27b24e742467f02` |
| [A'Campo, Dwork motives v1](https://arxiv.org/pdf/2407.16481v1) | Definitions 2.0.2–2.1.2 and Propositions 2.1.3–2.1.4, pp.7–8; Lemma 2.5.4 and Proposition 2.5.7 with proof, pp.19–20; page images at 7,8,19 | `39c42cfdc0367dab692cf11f3923c5846e42aed41f931b7d9b84fa1557bb1c63` |

Both Qian arXiv histories, the author's public page, the main paper's DOI
page and bounded exact-title/id correction searches were checked for an
existing correction to Remark 1.2. None was located by those checks; this
does not establish that no correction exists. No author was contacted.

## Validation

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-QIAN-23.result.json`: passed.
- `python3 research/blueprint/intake.py check-files` on the three deliverables: passed.
- The source-issue schema and section 18 version-record checker: passed, including E50.
- Separate structural check: all 145 item dependencies resolve and are acyclic; all 103 missing items are routed exactly once; all 16 route memberships and all item classifications match the base. The 49 pre-existing source issues are unchanged.
- Exact finite-field order/divisibility arithmetic, norm and nonzero Tate-twist slope arithmetic, and the rank-two parameter reconstruction/Jordan-block multiplicities: passed. These finite checks are examples, not general proofs of the extracted theorems.
- `git diff --check`: passed.

No Lean deliverable belongs to this fix, and none was compiled. Library
classifications and evidence were not changed; no library build, cache download
or language server was started. The original extraction's validation history
remains in its existing fields; the fix's separate scope is recorded in `fixes`.
