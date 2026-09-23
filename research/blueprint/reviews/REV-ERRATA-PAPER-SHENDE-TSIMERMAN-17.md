# Review of ERRATA-PAPER-SHENDE-TSIMERMAN-17

**Job** REV-ERRATA-PAPER-SHENDE-TSIMERMAN-17 (issue #1857) · **Date** 2026-09-23 · Claude Code, session
`cc-7b31c4` · **Verdict: all 28 findings confirmed, none rejected, none amended; three further misprints
added (E29–E31).**

Source: Vivek Shende and Jacob Tsimerman, *Equidistribution in Bun₂(P¹)*,
[Duke Math. J. **166** (2017), no. 18, 3461–3504](https://doi.org/10.1215/00127094-2017-0025);
arXiv [1307.8237](https://arxiv.org/abs/1307.8237).

The errata job was done by Claude Code session `cc-39fac3` (pull request #2240). This review is by a
different session, which did not write those files.

## What I read

**arXiv v1**, which is the version every locator names and the only version there is. I fetched both the
PDF (sha256 `542a52a2a04b65901a6d753266ef5f44aa73a8bde4dfdf7935ae27d489a5cf29`) and the LaTeX e-print
(sha256 `e88384404c9d0d80c19e095cca66b65d3388265fbcd5f9ce3da27711b764db03`) on 23 September 2026, and read
the PDF with a font-aware extraction built from its own `/Differences` and `/ToUnicode` tables so that
displayed formulas could be compared as printed.

Having the source as well as the PDF made two things possible that a reading of either alone would not.
First, I reconstructed the numbering of every statement from the shared `thm` counter — which required
discarding the two environments that are commented out in the source, `cor:wrd` and the first `nash` — and
checked the result against the rendered pages: Proposition 2.15 on p. 10, Proposition 2.16 on p. 11,
Corollary 2.18 and Corollary 2.20 on p. 12, Lemma 3.7 on p. 15, Theorem 3.9 on p. 16, Theorem 3.11 on p. 17,
Theorem 3.12 on p. 18, Lemma 3.21 on p. 26, Lemma 3.22 and Proposition 3.23 on p. 27, Theorem 4.2 on p. 30,
Theorem 4.4 on p. 32. **Every locator in the list is right.** Second, I could see which slips are in the
source and which are artefacts of rendering; all thirty-one are in the source.

**The published version I could not read**, as the errata job also reports: Project Euclid serves a
bot-check page. Nothing here is asserted about the 44-page published text.

**Existing corrections.** Re-checked: Crossref registers no update or erratum against the DOI, and the
`updates:` filter returns nothing; arXiv has no v2; Sawin's later paper (arXiv 1907.04850v2, 30 September
2020, with an appendix by Tsimerman), which proves the Shende–Tsimerman conjecture, acknowledges none of
these points. So `new` is right for all thirty-one.

## Verdicts

All 28 confirmed. Each entry's `review` field says what I checked; the substantive ones are these.

**Counterexamples I reproduced.**

- **E5**, the characteristic-5 failure of Corollary 2.4, is the load-bearing finding: E4 and E12 rest on it.
  I re-derived it. On `y² = x⁵ − x` over `F̄₅`, with `t = x − a` and `b² = a⁵ − a`, one has `y² = b² + t⁵ − t`,
  and expanding `√(1+s)` in characteristic 5 gives `b⁵y ≡ b⁶ − 3b⁴t + 3b²t² − t³` modulo `t⁵`, which is the
  quoted `H`; so `G = b⁵y − H` vanishes to order at least 5 at `P`. Symbolically
  `b¹⁰y² − H² = t⁵(a²⁵ − a − t)`, of divisor `5P + 5τP + Q + τQ − 12∞`; `G` has pole order 6 at infinity and
  `G(τP) = −2b⁶ ≠ 0`, so `div G = 5P + Q − 6∞`. Which of `(a²⁵, ±b²⁵)` is the sixth zero is not forced by
  that computation, so I enumerated: over `F₁₂₅`, for **all 120** admissible pairs `(a, b)` with `a²⁵ ≠ a`,
  `G` vanishes at `(a²⁵, −b²⁵)` and never at `(a²⁵, +b²⁵)`. The entry's formula for `Q` is right as printed.
  Since `x(P) ≠ x(Q)` we have `h⁰(O(P+Q)) = 1`, and `5P + Q` sweeps a one-dimensional family inside `|6∞|`.
- **E2.** `Θ_r` meets `J^{2g−a−b}` only when `r ≡ a + b (mod 2)`, so for the other parity the hypothesis
  `L ∉ Θ_r` is vacuous. With `a = b ≥ 1`, `L = (g−a)κ` and `r = 2a+1`, every effective `D` of degree `g−a`
  has `D + τD ~ (g−a)κ`, so the locus is `Θ_{g−a}` itself; `H^{2g−2a} ≠ 0`, the degree lies in the stated
  range, and `H^{2g+2a}(J) = 0`. Theorem 1.3 as printed is false.
- **E10.** For `p` a Weierstrass point, `D₁ = p`, `D₂ = 2p`, the septuple expression gives 2 while Lemma 2.1
  gives rank 1. I also checked the `g = 3` pair `D₁ = τp + q + τq`, `D₂ = p + τp + τq`: the union is special
  by Lemma 2.13, yet the inequality `deg H₁ + deg H_∩ + deg S ≤ 2(g−1−r)` that the proof of Lemma 3.17 draws
  from the corollary reads `2 ≤ 0`.
- **E8.** With `a = b ≥ 1` and `L = (g−a)κ` the fibre contains `{(D, τD)}`, of dimension `g − a` against an
  expected `g − 2a`; there `dA̲` has rank `g − a`, so the tangent space to the fibre also has dimension
  `g − a` and the fibre is smooth at a point where the union is special.
- **E21.** Over `F₅`, `y² = 2((x⁵ − x)^{2m} + 1)` has no rational point: the right side is the non-square 2 at
  every rational `x`, the degree `10m` is even and the leading coefficient 2 is a non-square, and for `m` not
  divisible by 5 the polynomial is squarefree. Genus `5m − 1`, and `q = 5 > 4`, so the sequence is admissible
  in Theorem 4.2.
- **E15.** For `K = Q_C[1]` on a smooth curve, `χ(K_p) = −1` and `Eu_C ≡ 1`, so `n_C = −1`, while
  `γ¹_C(p) = 1` and `dim H^{−1}(K_p) = 1`: the printed inequality reads `1 ≤ −1`. Sawin's abstract, which
  states its bound "in terms of certain intersection multiplicities of the characteristic cycle",
  independently corroborates the correction.

**Arithmetic I re-ran.** For E18 and E19 the corrected constants matter, because the entries assert that the
paper's final bounds survive. Recomputing `c_{k,r,s}` with the corrected factor `4^{s−b}` and maximising over
every admissible `(g, k, r, s)` with `g ≤ 25`:

| quantity | claimed bound | worst ratio found |
| --- | --- | --- |
| `c_{k,r,s}` | `20^{g−1}` | 0.2 |
| `c_{k,r,s}` | `g²·24^g` (the printed bound) | 0.0017 |
| `4^{g−k−1}·c_{k,r,s}·binom(g, k+1)` | `64^g/32` | 0.25 |

So both the corrected bound and the printed one hold, and the constant 960 of Theorem 3.11 survives, as the
entries say. I also checked the two class facts they turn on: `[2]` acts on `H_{2u}(J)` by `4^u` and `[2]^*`
on `H^{2c}(J)` by `4^c`, and `[Θ_{k+1}]·[Θ_{g−1−k}] = θ^g/((g−k−1)!(k+1)!) = binom(g, k+1)`; and that the
printed factor `2^g` of E19 is smaller than the correct `4^{g−k−1}` exactly when `k < g/2 − 1`.

For E22 I checked the threshold: Weil's `#J(F_q) ≥ (√q − 1)^{2g}` suffices precisely when
`q^{−1/2}(1 − q^{−1/2})^{−2} < 1`, that is `q^{−1/2} < (3 − √5)/2`, hence `q ≥ 7` — the entry's number. The
proposed repair, `log P_C(q^{−1}) = Σ_k (#C(F_{q^k}) − q^k − 1)/(k q^k) = O(log g)` from `#C(F_{q^k}) ≤ 2(q^k+1)`
for small `k` and Weil for large `k`, is correct and does give `#J(F_q) = q^{g+o(g)}`.

**Homological bookkeeping.** For E14 I redid the shift: with `n = g − a − b`, the sequence
`0 → F → Q̄_ℓ[n] → IC_X → 0` gives `H^{k+n}(X) ≅ IH^k(X)` for `k ∉ [−e−1, e]`, so the printed
`H^{i−(g−a−b)}` is the wrong way round; duality then needs `−k` outside the same interval, and `k = e + 1`
fails that, so the argument reaches only `i ≥ n + e + 2`. For E16 I checked the inversion of the double
geometric series, which does produce `−L[A̲^{a,b+2}]` and leaves the constructible-function identity (3)
correct at `L = 1`. For E13 I checked that the printed chain is internally consistent only for the indices
`g − 2a − 2l`, which are not the strata of the lemma, and that with the strata's own indices the second step
is false whenever `a + b > 0`.

**Textual findings.** E6, E9, E11, E17, E23, E24, E25, E27 and E28 I checked directly against the source and
the rendered page; each quotation is exact and each correction is the evident one. E27's local argument at a
ramified place is right, and the source's own preceding sentence — "Note also `O_{l,v}^× ⊂ γ_v GL₂(O_v)γ_v^{−1}`"
— is about precisely the unit group the correction substitutes.

**One entry whose nature deserves a word.** E26 is a completeness finding about a published proof, not a
demonstrated falsehood: Case 1 of Theorem 4.4 is justified by "the proof carries over" from
Einsiedler–Michel–Venkatesh together with a citation that resolves to "E. Lindenstrauss, private
communication". The entry says as much and I confirm it on that footing.

## Three findings added

Two came out of a mechanical audit of the source that the errata job did not run, and one from tracing a
citation.

- **E29.** The proof of Theorem 3.9 begins "By Lemma 3.8", but 3.8 is Proposition 3.8 (its label is
  `lem:bm2`). Misprint, reaches nothing.
- **E30.** On p. 4 the introduction says "the LHS and RHS of **(6)** differ by the traces of the lower
  cohomologies". The display meant is three paragraphs above on the same page and is numbered **(1)**;
  equation (6) is the corresponding display in the proof of Theorem 4.2 on p. 30. Both carry the label
  `eq:pgl2limit` in the source, so the one cross-reference resolves to the later. Misprint, reaches nothing.
- **E31.** Two bibliography entries share the label **[Lin]** — Linnik's book, cited in §1, and
  Lindenstrauss's private communication, cited in Case 1 of Theorem 4.4 — and both citations are printed
  "[Lin]". Misprint, reaches nothing, but it is the reason the status of that step is easy to misread (E26).

For completeness: the audit also flags `\label{eq:pgl2limit}` and `\label{nash}` as duplicated in the
source. The second is harmless, because one of the two is inside a commented-out block; the first is E30.
There are no undefined cross-references and no leftover editing markers.

## What this does to the main results

I agree with the errata's summary and restate its load: **Theorems 1.1 and 4.2 stand**, once the
class-number asymptotic of E22 is supplied, and then for every `q`, not only `q > 4`. **Theorem 1.3 as
printed is false** for one parity (E2) and needs the parity hypothesis; **Theorem 1.5 is proved only in the
restricted range** of Theorem 3.11 (E3); **Theorem 3.9 is proved in characteristic 0, and in characteristic
`p > 2g − 2`**, but the argument for small `p` passes through Corollary 2.20 and so through Corollary 2.4,
which fails there (E5, E12) — and its boundary degree needs a separate argument (E14). **Theorem 3.11's
constant 960 survives** the corrections to Lemma 3.22 and Proposition 3.23 (E18, E19), but its proof uses
Corollary 2.18, which is false (E10), so that route wants repair; the conclusion is in any case now available
from Sawin. **Theorem 4.4's Case 2 is affected only through Theorem 3.9**, while its Case 1 rests on E26.

## Validation

`python3 scripts/check_errata.py research/blueprint/errata/PAPER-SHENDE-TSIMERMAN-17.json` reports ok, and
`research/blueprint/intake.py check-files` reports no problems. All 31 findings carry a `review` verdict with
a reason and this job's name. Only the two errata files and this review change.
