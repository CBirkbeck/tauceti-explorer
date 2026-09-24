# Review of PAPER-LIPNOWSKI-TSIMERMAN-18

**Job** REV-PAPER-LIPNOWSKI-TSIMERMAN-18 (issue #1333) · **Date** 24 September 2026 · Claude Code,
session `cc-7b31c4` · **Verdict: accept.** All 13 routes accepted; all 184 items checked; all 22
`sourceIssues` confirmed; two corrections made in place; nothing rejected or deleted.

Paper: Michael Lipnowski and Jacob Tsimerman, *How large is A_g(F_q)?*, Duke Math. J. **167** (2018),
no. 18, 3403–3453 (doi 10.1215/00127094-2018-0029), read in the public arXiv v1
(`arXiv:1511.02212v1`, 6 November 2015), whose recorded hash reproduces byte for byte:
`5ceed8168ce37b75da67699189e7e8730527c31f3339dce979a1a1901243f81a`, 394120 bytes, 38 pages. I read
the e-print LaTeX source as well as the PDF. The published Duke text is still unobtainable here, as the
extraction states, so every locator and every error report is against v1; the corrections of J. Lee,
*On the lower bound of the number of abelian varieties over F_p*, IMRN 2022 (arXiv:2002.04420v3), are
recorded as known where they apply, and I read that paper too.

Extraction by Claude Code, session `cc-442dc5` (PR #2238), continuing `codex-a71f92`, `codex-7e92bd`
and `cgp-20260923-h7q4`; a different session from mine, as the job requires.

## Structure and locators

184 items (121 missing, 33 planned, 30 library) and 13 routes: 12 source, 1 Part II. Every missing item
is routed exactly once, and all twelve source routes name stage ids that resolve in `data/atlas.json`.

**The section numbering is the paper's own, and it is not the obvious one.** The v1 preamble contains
`\setcounter{section}{-1}`, so the introduction is §0 and its results are Theorems 0.1, 0.2 and 0.3;
"Topological explosion" is §1, "Bounding the number of isogeny classes" is §2 with Lemma 2.1 and
Corollary 2.2, "Bounding the number of isomorphism classes" is §3, "Polarizations" is §4 with
Propositions 4.11, 4.14, 4.16, 4.17, and "Speculation" is §5 with Conjecture 5.2. The extraction's
locators use exactly this convention. I recomputed the whole numbering from the source's theorem
counter and checked every numbered locator against it: **all 65 locators naming a Lipnowski–Tsimerman
statement resolve to a statement of the right kind**, and the other 20 numbered locators are citations
into Conrad, Yun, DiPippo–Howe, Scharlau, Waterhouse and Gan–Yu, each correctly attributed as such.

Note for readers of the paper's own prose: the "organized as follows" paragraph of §0 counts sections
from the topological-explosion section, so it calls §2 "section 2" while meaning §3 and so on. The
extraction does not follow that prose numbering, and it is right not to.

## The library citations

Of the 61 library citations, **59 resolve in the pinned declaration index**. The two that do not,
`mathlib:IsAdicComplete.henselianRing` and `mathlib:HenselianRing.is_henselian`, **are present in
Mathlib at 082e2d3**: the first at `Mathlib/RingTheory/Henselian.lean:170`, declared as
`instance (priority := 100) IsAdicComplete.henselianRing`, and the second as the class field
`is_henselian` of `HenselianRing` at line 96 of the same file. The declaration index omits prioritised
instances and class projections, so its silence is not evidence of absence. Both citations are correct
and I have not flagged them.

## The 22 recorded mistakes

All confirmed. Each now carries a `review` verdict saying what I checked. I verified **at their
locators in the source** E1, E4, E5, E6, E9, E10, E11 and E13, verified **E19, E20 and E21 directly
against Lee's paper**, and verified E2, E3, E7, E15, E17 and E18 by recomputing their counterexamples.
The ones worth recording here:

- **E5 (Lemma 2.1, a stated result).** The lemma reads, verbatim, "The number of degree 2g monic
  integer polynomials p(x) all of whose roots have absolute value √q is at most (2g)^g q^{(1/4)g(g+1)}".
  At g = 1, q = 2 the bound is 2√2 ≈ 2.83, while `X² − aX + 2` has all roots of absolute value √2 for
  each of the five integers −2 ≤ a ≤ 2, and `X² − 2` is a sixth. The proof's functional equation
  `q^g f(x) = x^{2g} f(q/x)` already assumes the constant term is `+q^g`, which `X² − q` violates. Both
  halves of the finding are right.
- **E4.** The paper says, verbatim, "*A keen insight of Yun is that #Hilb_R^j ≤ #Hilb_{Z_ℓ[[x]]}^j
  because R is a quotient of the power series ring Z_ℓ[[x]]*". Every quotient of `Z_ℓ[[x]]` has residue
  field `F_ℓ`, while an order in the unramified quadratic extension has residue field `F_{ℓ²}`, so the
  stated reason fails; passing first to the unramified coefficient ring repairs it and keeps the bound.
- **E1.** The displayed step `Σ_{a₁+⋯+a_n ≤ δn} 1 ≤ (nδ)^n/n!` is false: the left side is
  `C(⌊δn⌋+n, n)`, which is 1 against 0 at n = 1, δ = 0 and 2 against 1 at n = 1, δ = 1. The later step
  `(nδ)^n/n! ≤ e^nδ^n` is sound, so the defect is the first inequality alone.
- **E10 and E11.** Remark 4.8 says "*t = reduced trace_{D/Q}*"; for a simple `A` with `End⁰(A) = Q` the
  trace defined two lines above has `t(1) = 2g` while the reduced trace of 1 is 1. And the paper's
  "*The discriminant of the ring extension O_K[w]/O_K equals p sin²θ₀*" is missing a factor 4, since
  `(w − w̄)² = −4p sin²θ`.
- **E13.** The Gan–Yu volume constant carries `(∏_{d=1}^n (d−1)!/(2π)^d)^{[K:Q]}`, and
  `Σ_{d=1}^n log((d−1)!) = Σ_{j<n}(n−j)log j = ½n²log n + O(n²)`, so a printed `[K:Q]n²log n` doubles
  the coefficient. The corrected leading coefficient ½ propagates through the mass asymptotic and the
  orbit count, as the extraction records.
- **E17 and E18.** Recomputed. Over `F₂`, `y² + xy = x³ + x² + 1` has 2 points over `F₂` (only `(0,1)`
  and infinity) and, with `a = 1`, `2² + 1 − (a² − 2p) = 8` over `F₄`: both are 2-groups, so Lemma 5.19
  fails at `p = 2` and holds exactly for odd `p`. And `y² = x³ + 1` over `F₅` has 6 points, so `a = 0`,
  the curve is supersingular, its polynomial is `X² + 5` and `Q(√−5)` has no real place — a Frobenius
  centralizer that *is* a field, which is what E18 needs.
- **E19, E20, E21, checked against Lee.** Lee's §3.1 writes, of the bound quoted from Corollary 3.18:
  "*The bound is written in [LT18] as (2√p)^{4·C(2g,2)}, but it should be corrected to
  (2√p)^{4·C(2g,2)·2}*", and gives the corrected class-number product as `(2√p)^{2g²(1+o(1))}`. His
  Theorem 1.1, attributed to Lipnowski–Tsimerman Theorem 0.1 as corrected, is
  `B(p,g) ≤ 2^{34g²} p^{(69/4)g²(1+o(1))}`, and his Theorem 1.4 is `B(p,g) ≤ p^{(45/4)g²(1+o(1))}`. The
  extraction records all of these exactly, including the theorem numbers, which I recomputed from Lee's
  own counter — a remark shares the theorem numbering, which is why the `45/4` bound is 1.4 and not 1.3.
  So the printed exponent `17/2` is indeed not established, and the extraction is right to say so.

**Three findings rest on evidence I did not reproduce**, and their verdicts say so: E8 (the Poincaré
pullback, whose primary evidence is Conrad's notes — I confirm the standard mathematics, that the
pullback is the Mumford bundle with Néron–Severi class twice that of L, and the correction, but did not
read those notes), E-MILNE68-NEWTON-ABSCISSA (the abscissa of a Newton-polygon vertex is the exponent,
which is not in doubt, but I did not read the page image of Milne 1968), and E2 (the algebra of the
counterexample is decisive on its own, but I did not re-read the v1 orbit-map display as an image).

## The routes

All 13 accepted. The one that carries the weight is route 10, the Part II
`AbelianSchemesAndArithmeticModuliPartIIFiniteFields`. It is justified: **Honda–Tate and Waterhouse are
planned by no stage of the atlas** — I searched all 1968 stage descriptions and neither name occurs —
and the parent's A1–A6 build abelian schemes, duals, polarizations and realizations without any
finite-field classification or counting. Its brief states its final theorems in corrected form, names
Lee's corrections and this paper's `sourceIssues`, and says what it imports. Its area is a galaxy id
and its roadmap id is free. Route 13 is justified the same way: **Lang's theorem is planned nowhere**,
and RG2.3, which builds smooth group schemes with connected special fibres and their reduction maps, is
where it belongs.

## Corrections made in place

1. **The Part II title.** PROTOCOL §15 asks a Part II to reproduce its parent's atlas title exactly. The
   parent's atlas title is `Abelian Schemes And Arithmetic Moduli`; the route read
   "Abelian Schemes **and** Arithmetic Moduli, Part II: finite-field isogeny classes". Corrected to the
   exact form. (Corpus-wide, 415 Part II titles match their parent's atlas title and 36 do not; three
   other extractions use the exact form for this same parent.)
2. **The quotation of Lee in E6.** The `known` field rendered Lee's sentence with the exponent
   `2·C(d,2)`; Lee prints `2·C(2d,2)`. The quotation is now verbatim, with a note that Lee's own
   corrected display uses the square root `(2√p)^{C(d_i,2)}` for a field of degree `d_i`, which is the
   exponent `d(d−1)` this finding records. The correction itself was already right.

## What this review did not do

I did not read the published Duke text, which is unobtainable here; no finding has been checked against
the version of record, and the extraction's `versionNote` and gap G0 already say so. I did not re-read
Yun, Conrad, Milne 1968 or Waterhouse; where a finding rests on one of them its verdict says so. I add
no finding of my own.

## Checks

    python3 scripts/check_paper.py research/blueprint/papers/PAPER-LIPNOWSKI-TSIMERMAN-18.result.json
    python3 research/blueprint/intake.py check-files research/blueprint/papers/PAPER-LIPNOWSKI-TSIMERMAN-18.result.json
    python3 research/blueprint/intake.py check-files research/blueprint/papers/PAPER-LIPNOWSKI-TSIMERMAN-18.review.json

All pass. No roadmap change, no library claim and no Lean work is proposed.
