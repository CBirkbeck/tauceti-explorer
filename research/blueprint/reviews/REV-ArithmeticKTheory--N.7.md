# REV-ArithmeticKTheory--N.7 — independent review

Reviewer: Claude Code, session cc-fb70e5 (issue #353; claim comment 5872447442, confirmed by the bot). The blueprint under review
(BP-ArithmeticKTheory--N.7, PR #2881) was written by another session, cc-7b31c4. Date: 2026-09-28.

**Verdict: accepted after corrections.** Of the 15 nodes, 9 were corrected and 6 verified, and none was added. All 21 original baseline
citations are confirmed, and 9 new ones were added. One new source error is recorded. The gaps are unchanged, and they are honest.

## What was checked

- **Source.** Weibel's *The K-book*, the author-hosted PDF of 29 August 2013. Its sha256 `a04f53c9…058845` reproduces the packet's.
  Every node's locator and excerpt was re-found in the text, and every excerpt was re-pulled verbatim.
- **Baseline.** Every citation was checked against the pinned declaration index, and the statements that nodes rely on were read at
  Mathlib 082e2d37 (`Bernoulli.lean` and `NumberField/Cyclotomic/Ideal.lean`). `check_blueprint --index` gives 0 errors and 0 warnings.
- **Closure, API, tests, planets and the suggested file.** Everything below was checked.

## The main correction: the Bernoulli convention

The source uses the **topologists' Bernoulli numbers**: "We use the topologists' Bk …, all of which are positive. Number theorists would
write it as (−1)^(k+1) B_2k", with B₁ = 1/6, B₅ = 5/66 and B₆ = 691/2730 (printed p. 472). The packet declared Mathlib's arithmetic
`bernoulli` (B₁ = −1/2) as the convention and said that every statement names its convention. But it then quoted the source's formulas
without re-indexing them:

- **w-invariant.** w_2k(Q) = den(B_k/4k) gives w₂(Q) = 8 in the arithmetic convention. The node's own test says 24.
- **Kummer's criterion.** "B_k, k ≤ (p−3)/2" should read B₂, B₄, …, B_(p−3).
- **Herbrand–Ribet.** "ℓ | B_k ⇔ eigenspace ℓ−2k" should read "ℓ | B_2k". The source's own example confirms this: 37 | B₃₂ gives index 5.
- **Unit tests.** "the denominator of B₆ is 2730" and "5 | B₅" are false for Mathlib's `bernoulli` (bernoulli 6 = 1/42, bernoulli 5 = 0).

The packet also called Mathlib's `bernoulli'` (B₁ = +½) "the other convention … which parts of the K-theory literature use". That is not
the source's convention: `bernoulli'` differs from `bernoulli` only at index one, whereas the topologists' numbers are re-indexed. And the
conventions node's first excerpt, "B_1 = -1/2, B_2 = 1/6, B_4 = -1/30 …", **is not in the source**.

All of these are corrected in place. The source's numbers are now a named translation, `bernoulliTop k := (−1)^(k+1) · bernoulli (2k)`.
The denominator facts are von Staudt–Clausen, which the pinned Mathlib already proves (`Bernoulli.vonStaudt_clausen`,
`dvd_den_bernoulli`, `not_sq_dvd_den_bernoulli`), so they are cited rather than planned (review item 7). New discriminating tests are
`w_four_rat` (240, not 48), `top_not_primed` and `b_twelve_denominator`.

## Other corrections

- **Iwasawa's criterion** was misquoted as "no p-power torsion in Pic(Z[ζ_p])", which only restates the definition. The source's
  statement concerns Pic(Z[μ_(p^ν)]) for all ν.
- **Kummer's criterion excerpt** dropped "a regular prime" from "a regular prime p does not divide the numerator of any Bk/k", which
  inverted its sense.
- **Birch–Tate status.** The source says Wiles proved the odd part, with no abelian restriction. The packet restricted it to abelian
  fields, which would forbid legitimate uses over other totally real fields.
- **Vandiver.** "Degrees divisible by four" included K₄(Z), which vanishes unconditionally (Rognes); it now reads 4i ≥ 8.
- **Regular-prime torsion.** The torsion is the ℓ-primary part of Z/w_i(Q), and the mod-ℓ module is over Z/ℓ[β^(ℓ−1)]. The Theorem
  10.6 excerpt was not the source's text.
- **Tame-kernel vanishing.** Added the source's own statement, Example 8.3.2 (K_2i(Z[ζ_ℓ]) has no ℓ-torsion), which the packet did
  not cite. The residue-field step now cites Mathlib's `IsCyclotomicExtension.Rat.ramificationIdx_span_zeta_sub_one'`,
  `inertiaDeg_span_zeta_sub_one'` and `eq_span_zeta_sub_one_of_liesOver'`, not the bare definitions `Ideal.ramificationIdx` and
  `Ideal.inertiaDeg`.
- **Locators.** Every page number was wrong. The packet's "PDF p." values matched neither the PDF page nor the printed page (for
  example, VI.2.4 is printed p. 472 / PDF p. 480, not "465"). Locators now read "printed p. N (PDF p. N+8)". Excerpt attributions were
  also fixed (10.4.1 → 10.4.2; the 10.1 paragraph rather than the table note).
- **Tests.** Test kinds were added where they were missing.

## Source issues (PROTOCOL §18)

The packet had no `sourceIssues` key, meaning the sources had not been checked. It now has one finding:

- **ArithmeticKTheory/E1** (error, new): Classical Data 8.1 prints K₁(O_S) = O_S^× ≅ Z^(r2+|S|−1) ⊕ μ(F). The rank should be
  r1 + r2 + |S| − 1. For F = Q and S = {p} the printed formula gives rank 0, but Z[1/p]^× = ±p^Z has rank 1. The book uses the formula
  only in the totally imaginary case (Theorem 8.4), where it is right. The author's errata link (Kbook.errata.pdf) returns 404, and the
  September 2012 chapter file prints the same formula.

`sourceVersions` records both copies.

## Suggested Lean file

The N.7 arithmetic now has real signatures: `bernoulliTop`, `bernoulli_denominator`, `wInvariant_even_rat` with the B_2k form,
`IsRegularPrime p := ¬ p ∣ classNumber (CyclotomicField p ℚ)`, Iwasawa over the tower, `kummer_criterion` over B₂…B_(p−3), and
tests as `example`s. The K-theory statements remain `True` placeholders, as the header explains, because no K-group above K₀ exists in
either library. **Not compiled:** no pinned build exists on the reviewer's machine.

## Node-by-node

| node | verdict | note |
|---|---|---|
| `N.7/bernoulli-conventions` | corrected | corrected: the first excerpt ('B_1 = -1/2, B_2 = 1/6, B_4 = -1/30') is not in the source, which uses the topologists' B_k = \|B_{2k}\|; statement, api, uses, tests re-indexed; bernoulli' is no longer called the source's convention; tests b_six_denominator (false for Mathlib's bernoulli 6 = 1/42) and five_divides_b_five (bernoulli 5 = 0) replaced; denominator facts now cite Mathlib's von Staudt–Clausen. |
| `N.7/w-invariant` | corrected | corrected: the formula w_{2k}(Q) = den(B_k/4k) holds only in the source's indexing; with the packet's declared arithmetic convention it gives w_2(Q) = 8, contradicting the node's own test (24). Re-indexed to B_{2k}; locator page fixed (printed 472, not 465); test kinds added; discriminating test w_four_rat added. |
| `N.7/regular-prime` | corrected | corrected: Iwasawa's criterion was misquoted as 'no p-power torsion' in Pic(Z[ζ_p]) (a restatement of the definition); the source's statement is about Pic(Z[μ_{p^ν}]) for all ν. Excerpt re-pulled verbatim; locator page fixed; test kinds added. |
| `N.7/kummer-criterion` | corrected | corrected: re-indexed to B_2, …, B_{p−3}; the excerpt dropped 'a regular prime' from 'a regular prime p does not divide the numerator of any Bk/k', which inverted its sense; re-pulled verbatim; page fixed. |
| `N.7/eigenspaces-and-herbrand-ribet` | corrected | corrected: re-indexed (l \| B_{2k} ⇔ eigenspace l−2k), which the 37/B_32/index-5 example confirms; second excerpt was a paraphrase attributed to 10.4.1 — replaced by the verbatim text of 10.4.2; pages fixed (532, 530). |
| `N.7/tame-kernel-vanishing-at-a-regular-prime` | corrected | corrected: added the source's own statement (Example 8.3.2, K_{2i}(Z[ζ_ℓ]) has no ℓ-torsion); the residue-field step now cites Mathlib's cyclotomic lemmas (e = p − 1, f = 1, uniqueness of the prime above p) instead of the bare definitions ramificationIdx/inertiaDeg; pages fixed (514, 513, 530). |
| `N.7/regular-prime-torsion-consequences` | corrected | corrected: the torsion is the ℓ-primary part of Z/w_i(Q), and the polynomial ring is on β^{ℓ−1}; the Theorem 10.6 excerpt had 'Z/l[beta] on the Bott element', not the source's text; pages fixed (530, 531, 532). |
| `N.7/vandiver-separation` | corrected | corrected: 'degrees divisible by four' included K_4(Z), which vanishes unconditionally; now 4i ≥ 8. Second locator was the table note (10.1.1) but the text is the paragraph before the table; pages fixed (532, 527). |
| `N.8/certified-example-format` | verified | verified; page fixed (515, not 513); test kinds added. |
| `N.8/k-groups-of-the-integers` | verified | verified against Table 10.1.1; page fixed (528). |
| `N.8/gaussian-and-imaginary-quadratic` | verified | verified (w_2(Q(i)) = 24 rechecked); pages fixed (488, 218). |
| `N.8/s-integer-sequence-for-one-inverted-prime` | verified | verified; the node's unit group Z/2 ⊕ Z is right, but its cited formula K_1(O_S) ≅ Z^{r2+\|S\|−1} ⊕ μ(F) is a source error for fields with real places (sourceIssues E1); pages fixed (513, 236). |
| `N.8/the-rationals-infinite-against-finite` | verified | verified; page fixed (236, not 245). |
| `N.8/real-quadratic-example-and-birch-tate` | verified | verified; pages fixed (515). |
| `N.8/birch-tate-status` | corrected | corrected: the source says the odd part was proved by Wiles (for totally real fields) with no abelian restriction; the packet restricted it to abelian fields, which would forbid legitimate uses; page fixed (515). |

## Questions for the orchestrator

1. **The readme `readmes/ArithmeticKTheory--N.7.md` repeats the convention error**: the w-invariant formula, the Kummer range and the
   Herbrand–Ribet index. It is not a deliverable of this review job, so it was not edited. A follow-up should apply the packet's
   corrected statements to it.
2. **Other packets citing the same file** (the packet's summary says three do) should check their Bernoulli indexing the same way.
