# Review of ERRATA-PAPER-BHARGAVA-SHANKAR-TANIGUCHI-ETAL-20

**Job** REV-ERRATA-PAPER-BHARGAVA-SHANKAR-TANIGUCHI-ETAL-20 (issue #1869) · **Completed** 2026-09-23 by
Claude Code, session `cc-7b31c4`, continuing the checkpoint of Codex `codex-a71f92` of the same day ·
**Verdict: all 7 findings confirmed. The two items the checkpoint left open are now closed.**

Source: Bhargava, Shankar, Taniguchi, Thorne, Tsimerman and Zhao, *Bounds on 2-torsion in class groups of
number fields and integral points on elliptic curves*,
[JAMS **33** (2020), 1087–1099](https://doi.org/10.1090/jams/945); arXiv [1701.02458](https://arxiv.org/abs/1701.02458).

The errata was written by Claude Code session `cc-442dc5`; the first half of this review by Codex
`codex-a71f92`; this completion by `cc-7b31c4`. None of the three is the same agent.

## Where this stood

The checkpoint confirmed E1–E4, E6 and E7 against the preprints and recorded its work in the errata's
companion document. It left three things: **E5 had no verdict**, **E6's correction was a candidate rather
than a limited claim**, and **the published JAMS text had not been collated**. It asked that E5 not be
confirmed until the failing step was identified.

## E5: confirmed as a gap, with the failing step identified

The passage, verbatim in the 18 February 2017 author copy (§4, p. 6, sha256
`bba54fd02aadec75b51f2cdbb312c702c06f44384e45a7ec57832704e4e106ec`) and in arXiv v1 (sha256
`99ee35275ecb42c52cd8bbc615538dbe6094326fb72894e88ef82c0b89286871`), reads:

> First, we handle the case where `K` contains a subfield `F` of index 2. In that case, by genus theory, the
> 2-torsion in the class group of `K` is bounded by the 2-torsion in the class group of `F` multiplied by
> `O(2^t)`, where `t` is the number of ramified primes in `K/F`. Since `2^t` is subpolynomial in `|Disc(K)|`,
> and `|Disc(F)| ≤ |Disc(K)|^{1/2}`, we obtain a bound of `O_ε(|Disc(K)|^{1/4+ε})` in this case, by
> Brauer–Siegel applied to `F` together with genus theory for `K/F`.

**Which step fails.** Genus theory for a quadratic extension `K/F` is the ambiguous class number formula:

```
|Cl(K)^G| = h_F · 2^{t−1} / [E_F : E_F ∩ N(K^×)]  ≤  h_F · 2^{t−1},      G = Gal(K/F).
```

It bounds the **ambiguous classes**, and by the **full** class number of `F`, not by `h_2(F)`. Getting from
there to the 2-torsion costs a second factor: the natural map `Cl(K)[2] → Cl(K)^G`, `c ↦ c·σ(c)`, has kernel
`Cl(K)[2]^G`, so the standard argument yields

```
|Cl(K)[2]| ≤ |Cl(K)[2]^G| · |Cl(K)^G| ≤ |Cl(K)^G|²,
```

and genus theory bounds neither `Cl(K)[2]^G` nor `Cl(K)^G` by `O(2^t)·h_2(F)`. That is the whole of the gap,
and it is the reason no citation is given: no statement in the literature has the one-factor form. The
sharpest general result is Klüners–Wang, Theorem 2.1, `h_2(K) ≤ 4^{e−1}h_2(F)²` — squared.

**Why it is load-bearing rather than cosmetic.** The one-factor form is exactly what lets the printed
argument finish with Brauer–Siegel on `F`: `h_2(F) ≪_ε |Disc F|^{1/2+ε} ≤ |Disc K|^{1/4+ε}`. Squared, that
route returns `|Disc K|^{1/2+ε}` — the trivial bound. So the printed sentence cannot simply be replaced by
the correct one; the argument has to change shape.

**Why the theorem survives.** Use Klüners–Wang in a **strong induction on the degree** instead of
Brauer–Siegel. For `n = [K:Q] = 2m` with `m ≥ 3`, the lower-degree case of Theorem 1.1 gives
`h_2(F) ≪ D_F^{1/2 − 1/(2m) + η}`; squaring and using `D_F² ≤ D_K` and `4^{e−1} ≪_{n,η} D_K^η` gives
exponent `1/2 − 1/n + O(η)`, stronger than the `1/2 − 1/(2n) + ε` the theorem asserts. For `n = 4`,
quadratic genus theory for `F` gives `D_K^ε` outright. So Theorem 1.1 stands, and `affects: the proof` is
right.

**No claim is made that the printed bound is false.** The finding is that it is asserted without proof or
citation and does not follow from what genus theory provides — which is what a `gap` is.

## E6: the correction is now explicitly limited

What is certified: the failure of the field-only bound, by the checkpoint's `f_N = x(x−N)(x+N)` example
against Kane's density theorems; and the elliptic replacement, through the paper's own Theorem 5.2,
`|Sel_2(E)| ≤ 4·4^{ω(|Δ_E|)}h_2(K) ≪_ε |Δ_E|^ε h_2(K)`, with the rank bound that follows.

What is **not** certified, and is now recorded as an open repair rather than a candidate: replacing `Disc(K)`
by a discriminant of the curve in all degrees. It needs an explicit model/discriminant convention and a
hyperelliptic 2-descent theorem covering even degrees. I did not attempt to prove it in that generality.

## The published text

Still not collated, and not for want of trying: the AMS journal PDF endpoint returns 404, and the DOI
resolves to a landing page carrying only the abstract and the reference list — no article text. JSTOR
exposes none, and the MPG record's public file is the preprint. **Every verdict in this list is therefore a
verdict about the two preprint versions named in each locator**, and each `review.reason` says so. That
boundary cannot be removed by any worker without access to the published article; it should not hold the
review open indefinitely, so this completes the job with the boundary stated rather than leaving it
unfinished.

For the register: the findings are confirmed against the author copy of 18 February 2017 and arXiv v1, not
against JAMS 33 (2020), 1087–1099.

## Validation

`python3 scripts/check_errata.py research/blueprint/errata/PAPER-BHARGAVA-SHANKAR-TANIGUCHI-ETAL-20.json`
reports ok and `research/blueprint/intake.py check-files` reports no problems. All seven findings now carry a
`review` verdict with a reason and this job's name. No finding was deleted and none was added; E5's reason
and correction and E6's correction were refined in place, as the checkpoint asked.
