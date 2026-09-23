# Independent review of the Bennett–Siksek errata

Job `REV-ERRATA-PAPER-BENNETT-SIKSEK-20` · Refs #1708. Reviewer: Codex, session `codex-7e92bd`, 23 September 2026. The extraction was written by `codex-a71f92` continuing `chatgpt-0921-b74e`; the original errata and extraction review were written by Claude Code, `cc-fb70e5`. This session did none of that work.

**Verdict: complete after corrections.** Of the nineteen original entries, sixteen are confirmed and three are rejected. Two confirmed entries are substantially narrowed: E11 retains only the conductor/modulus slip, and E18 retains only the zero-sum height typo. Three newly found misprints bring the final total to **nineteen confirmed and three rejected**.

## Sources and coverage

Independently fetched the [published paper](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p02-s.pdf), Annals 191 (2020), 355–392, and [arXiv v1](https://arxiv.org/pdf/1709.01022v1), 4 September 2017. The [author-hosted published copy](https://personal.math.ubc.ca/~bennett/BeSi-Annals-2020.pdf) is byte-identical to the publisher download. The addendum is absent from v1; the other relevant passages were collated individually. The stray f in E21 occurs only in the published version.

- Publisher/author PDF: 38 pages, SHA-256 `3920a7524a37870942fe3591ac858db23cb604f4331bccd2a6dc5f11a1671fbf`.
- arXiv v1: 29 pages, SHA-256 `6998123fab2c8cd4b9da9aa90478461de883222782f879fcfe18d8cd9b91d56f`.

Published passages read include pp.356–357, 360–362, 364, 367, 370–371 and 374–388. Inspected rendered images of pp.357, 361, 364, 371, 374, 378–381, 383–384 and 386–388 where needed to resolve formula typography. This is targeted errata verification, not a claim of a new complete proof audit.

The [Annals page](https://annals.math.princeton.edu/2020/191-2/p02), [Crossref record](https://api.crossref.org/works/10.4007/annals.2020.191.2.2), [arXiv history](https://arxiv.org/abs/1709.01022), [Bennett's publication list](https://personal.math.ubc.ca/~bennett/publ.html) and [Siksek's publication list](https://samirsiksek.github.io/siksek.github.io/index.html) link no correction found in this search. arXiv lists only v1. Title/author/correction searches found no separate erratum; a correction to another paper that cites this one was excluded. These are bounded searches made on 23 September 2026.

Additional primary evidence:

- [Lee Butler, *A proof of the Hermite–Lindemann theorem*](https://people.maths.bris.ac.uk/~malab/PDFs/HL.pdf), dated 28 May 2008, p.3: the real algebraic exponential theorem used to reject E8. PDF SHA-256 `a89f4e8f556f524bf5e338794c283524c493c7536c4fc6204212589abe94e147`.
- [Bennett–Martin–O’Bryant–Rechnitzer](https://arxiv.org/pdf/1802.00085), pp.11 and 13–14: zero symmetry and Proposition 2.5, used to narrow E18. PDF SHA-256 `e51f8b8f63486c2259efe076d367504f08dda0fe9e99dc35bf36de544ffc0601`.
- [Ford–Green–Konyagin–Maynard–Tao, *Long gaps between primes*](https://www.ams.org/journals/jams/2018-31-01/S0894-0347-2017-00876-2/S0894-0347-2017-00876-2.pdf), Lemma 7.1, p.96: the height-dependent Landau–Page region. The displayed lemma was available through the indexed primary-source text; the direct PDF download returned 403.

An accessible Iwaniec–Kowalski PDF contained only front matter. No claim is made to have independently consulted its Theorems 5.25–5.27 or 12.13, or Rahman's original proof. The Roth comparison checks Bennett–Siksek's own displayed (36); the conductor terminology follows directly from the primitive/principal definitions and the paper's application.

## Verdicts

| Entry | Verdict | Independent check and changes |
|---|---|---|
| E1 | Confirmed | Symbolic discriminant gives 16(abc)². Classified as a coefficient misprint. |
| E2 | Confirmed | τ(120)=16 exceeds 14.8922…. Marked the false universal auxiliary assertion as affecting a stated result. |
| E3 | Confirmed | χ₈χ₋₈=χ₋₄; checked the corrected modulus and period in both proof cases. |
| E4 | Confirmed | Actual signed square solution (−3,2,4,3,2); the positive-factor assertion needs odd exponent. |
| E5 | Confirmed | Summed the missing +1 terms, obtaining O(k^(1/3)(log k)^61). |
| E6 | Confirmed gap | Only divisibility is supplied; it already proves the needed gcd inequality. No counterexample under the global hypotheses is asserted. |
| E7 | Confirmed | Exact rational calculation gives ϖ²<1/68<ϖ. |
| E8 | Rejected | The logarithmic endpoint cannot be prime when k is an integer. |
| E9 | Confirmed gap | The cited estimate yields min(c₁,1/2); this is insufficient justification, not a disproof of the stronger estimate by other means. |
| E10 | Confirmed | Conductor 1 annihilates the error term despite the explicit trivial-character case. The stated theorem needs correction. |
| E11 | Confirmed, narrowed | Correct conductor to modulus. The empty principal product r=s already covers M₂=1. |
| E12 | Rejected | The standard p-unit c₄ criterion immediately proves the asserted reduction. |
| E13 | Rejected | A prime cannot equal k^(7/16): its valuation would satisfy 7v=16. |
| E14 | Confirmed | Verified the replacement point and its double symbolically; also corrected the curve name in its membership assertion. |
| E15 | Confirmed | The inner Roth exponent is 9,149,542.78…, exceeding 10⁶ and below 10⁷. |
| E16 | Confirmed gap | Missing height restriction overstates the invoked theorem; the unrestricted claim is not proved false here. |
| E17 | Confirmed | State primitive and nonprincipal; changed reach to the proposition as written. |
| E18 | Confirmed, narrowed | Q should be T. The cited zero-counting input and reflection already handle small zeros. |
| E19 | Confirmed | Repeated word. |
| E20 | Confirmed; added | Restore the original progression's index range in Lemma 4.1. |
| E21 | Confirmed; added | Delete the published formula's stray f. |
| E22 | Confirmed; added | Restore m≤k in the inner-product expansion. |

The [revised errata explanation](../errata/PAPER-BENNETT-SIKSEK-20.md) gives the arguments, including the rejections. Original IDs are preserved. The extraction, its prior review and the generated register remain unchanged.

## Validation

The errata checker, intake `check-files` for the three authorized deliverables, and `git diff --check` pass. Scratch diagnostics verified the two elliptic invariant formulas, the corrected order-four point and doubling identities symbolically, exact constant comparisons, the conductor-product example, and all 2,504 admissible local tuples for primes p<200 with p≡5 mod8. Of those tuples, 2,472 put the printed point off the curve; all corrected points pass. These finite-field checks test the coordinate identity, not every global hypothesis of Lemma 6.6.

No Lean artifact was required or compiled. No formalization claim is made.
