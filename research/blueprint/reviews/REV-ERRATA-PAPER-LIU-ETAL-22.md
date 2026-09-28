# REV-ERRATA-PAPER-LIU-ETAL-22

Independent review of the mistakes recorded in Yifeng Liu, Yichao Tian, Liang Xiao, Wei Zhang and Xinwen Zhu, *On the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives*, Inventiones mathematicae **228** (2022), 107–375 (doi 10.1007/s00222-021-01088-4; arXiv 1912.11942).

- **Issue:** #2196.
- **Reviewer:** Claude Code, session cc-fb70e5, 28 September 2026.
- **Independence:** this reviewer did not write the files under review. The errata job ERRATA-PAPER-LIU-ETAL-22 was done by cc-39fac3 (PR #3800), the extraction by cc-2aeb03, and the extraction review by cc-d67081.

**Verdict: all 131 findings are confirmed.** None is rejected, none is added and none is changed in place. Each finding carries a `review` object with its own reason in `research/blueprint/errata/PAPER-LIU-ETAL-22.json`. The findings comprise 80 misprints, 30 gaps and 21 errors. Their reach is: 101 reach nothing, 13 reach a proof, and 17 reach a stated result.

## Versions read

- **The published article.** This is the same file the errata worker read (sha256 dd821abd2b06233cb69cdc88de242b689686d5f2ce0c2072128abcd54ec89d97; 269 pages; printed page = PDF page + 106). par.nsf.gov refused connections again, so I used a byte-identical copy already on this machine.
- **arXiv v3.** Downloaded afresh (sha256 84dc7c8369298314bd4e7ece5a45e5e096f39bd376f08c4c489950873c46fe86). I used it where a finding compares versions, notably for E32.
- **Published errata.** A web search on 2026-09-28 found no erratum or corrigendum for the article.

## What I checked

For each finding:
1. I located the quoted text at its locator.
2. Where the text layer garbles superscripts, subscripts or diagram labels, I read the rendered page image. This was needed on pp. 139, 187, 259, 273, 282, 285, 288, 294, 295 and 301.
3. I checked the reason and the correction myself.

Every quotation is printed as recorded. The verdicts that rest on my own derivation, rather than on reading alone, are these:

- **E1 and E23** (Lemma 2.6.4, Proposition 2.6.6). The setting is F⁺ = ℚ(√5), F = F⁺(i), ℓ = 3, R = ℤ₃(1), with S spanned by the Kummer class of u = (1+√5)/2.
  - Every lift of γ = ρ̄₊(c) to Gal(F⁺(i, ζ₃, u^{1/3})/F⁺) has the form cτ^k with cτc = τ⁻¹, so it squares to 1.
  - Hence every Frobenius element w(m) is trivial and G_{S,γ} = {1}, while θ_S⁻¹Hom(S, R̄) is cyclic of order 3.
  - All hypotheses of Proposition 2.6.6 hold, and no abundant tuple exists.
- **E2** (Proposition 2.6.7). The matrix [[λ, 1], [0, λ]] has image of index |k|², but its coordinate projections have index 1 and |k|, so no change of basis diagonalises it.
- **E5** (Construction 3.1.8). Over 𝔽₅ × 𝔽₅, the multiset {(1,2), (2,1), (3,3)} is unitary in the sense of Definition 3.1.3, yet no element squares to 1.
- **E9** (Lemma A.1.4(4)). Over 𝔽₉, x₁⁴ + t·x₂⁴ = 0 with t ∉ 𝔽₃ has four geometric points and none rational, because the fourth powers in 𝔽₉^× are {±1}.
- **E10** (§C.2 at N = 2). H^prim is all of H⁰ of q+1 points, which is 𝟏 ⊕ St and not irreducible.
- **E21** (Lemma 2.3.5(b)). Over k = 𝔽₂₅, End(R̄) ⊗_{𝔽_ℓ} k is the sum of the Frobenius twists. In the counterexample, x ↦ x⁵ gives a nonzero H-map A → R̄, so ker Res_ρ ≠ 0.
- **E27, E28** (Remark 3.1.6, Construction 3.1.10). The degenerate cases ‖v‖ ≡ ±1 in L; and a Hecke character extending η_{F/F⁺}, whose parameter at inert primes is {−1}.
- **E31(i)** (footnote 11). In the D₄ field ℚ(√(−3−√2)) at p = 17: the reflex fields meet in ℚ(√7), (7/17) = −1, and exactly one of the two primes of ℚ(√2) above 17 is inert in F. So the footnote's condition holds but the prime is not very special.
- **E32** (Definition 3.3.2). arXiv v3 defines F_rflx by the composite of the reflex fields, the published version by their intersection. §8 obtains (PI3) only through Frob_𝔭 fixing F⁺_rflx.
- **E35** (Lemma 3.4.12(2)). With p split, an ordinary CM curve E and B = E/E[w₁], the right side is 1 and the left side is 0.
- **E39, E57** (Theorems 4.3.5(2), 5.4.4(2)). The proofs show only unramifiedness. A Zariski-local closed immersion out of a proper irreducible B fails at any non-injective point, and such points occur by pigeonhole for N = 3.
- **E68** (proof of Lemma 5.9.3(6)). Frobenius of 𝔽_p^Φ acts on the relevant module by q^{±1}, with q = #𝔽_p^Φ. For p = 3, q = 81, L = 𝔽₅, p² − 1 is invertible but q − 1 is not.
- **E85** (§6.4). With the printed r(t)v′ = xv + v′ and φtφ⁻¹ = t^p, conjugation gives x(s − p²s′) = 0, which forces x = 0 for ℓ ∤ p² + 1. The printed x(s − p^{−2r}) = 0 is what the swapped relation r(t)v = v + xv′ gives.
- **Degree and index counts** re-derived: E7 (c_{r−j−1}), E14 and E98 (cohomological degrees), E65 (rank r − j for N odd), E74 (ℙ(pr₀*N₀ ⊕ pr₁*N₁) is not trivial), E95 (degree 2n).

## Where I did not re-derive

- **E31(ii)**, the W(B₄) octic field used also in E32: I relied on the recorded computation. E32's gap stands on the change of definition alone.
- **E30:** whether later Kisin–Shin–Zhu work establishes Hypothesis 3.2.10 for N ⩾ 3 and F⁺ ≠ ℚ. At publication the proof rests on a work listed as 'in preparation'.
- **E8:** the nonvanishing of F₋₁H¹ via Theorem 6.3.4(4). The false vanishing claim is settled without it.

## Mistakes the list missed

None found. My reading covered the passages at the 131 locators and their immediate context, not the whole paper.

## Verdicts

| Finding | Kind | Reach | Verdict |
| --- | --- | --- | --- |
| E1 | error | a stated result | confirmed |
| E2 | error | a stated result | confirmed |
| E3 | gap | the proof | confirmed |
| E4 | error | a stated result | confirmed |
| E5 | gap | nothing | confirmed |
| E6 | misprint | nothing | confirmed |
| E7 | misprint | nothing | confirmed |
| E8 | error | a stated result | confirmed |
| E9 | error | a stated result | confirmed |
| E10 | error | a stated result | confirmed |
| E11 | misprint | nothing | confirmed |
| E12 | misprint | nothing | confirmed |
| E13 | gap | the proof | confirmed |
| E14 | misprint | nothing | confirmed |
| E15 | misprint | nothing | confirmed |
| E16 | misprint | nothing | confirmed |
| E17 | gap | nothing | confirmed |
| E18 | misprint | nothing | confirmed |
| E19 | misprint | nothing | confirmed |
| E20 | gap | nothing | confirmed |
| E21 | error | a stated result | confirmed |
| E22 | misprint | nothing | confirmed |
| E23 | error | a stated result | confirmed |
| E24 | error | nothing | confirmed |
| E25 | error | the proof | confirmed |
| E26 | misprint | nothing | confirmed |
| E27 | error | nothing | confirmed |
| E28 | error | nothing | confirmed |
| E29 | gap | nothing | confirmed |
| E30 | gap | a stated result | confirmed |
| E31 | error | nothing | confirmed |
| E32 | gap | the proof | confirmed |
| E33 | misprint | nothing | confirmed |
| E34 | misprint | nothing | confirmed |
| E35 | error | a stated result | confirmed |
| E36 | misprint | nothing | confirmed |
| E37 | gap | nothing | confirmed |
| E38 | misprint | nothing | confirmed |
| E39 | error | a stated result | confirmed |
| E40 | misprint | nothing | confirmed |
| E41 | misprint | nothing | confirmed |
| E42 | misprint | nothing | confirmed |
| E43 | misprint | nothing | confirmed |
| E44 | misprint | nothing | confirmed |
| E45 | gap | nothing | confirmed |
| E46 | misprint | nothing | confirmed |
| E47 | misprint | nothing | confirmed |
| E48 | misprint | nothing | confirmed |
| E49 | misprint | nothing | confirmed |
| E50 | gap | the proof | confirmed |
| E51 | error | a stated result | confirmed |
| E52 | misprint | nothing | confirmed |
| E53 | misprint | nothing | confirmed |
| E54 | misprint | nothing | confirmed |
| E55 | misprint | nothing | confirmed |
| E56 | misprint | nothing | confirmed |
| E57 | gap | nothing | confirmed |
| E58 | misprint | nothing | confirmed |
| E59 | misprint | nothing | confirmed |
| E60 | misprint | nothing | confirmed |
| E61 | gap | nothing | confirmed |
| E62 | misprint | nothing | confirmed |
| E63 | error | the proof | confirmed |
| E64 | misprint | nothing | confirmed |
| E65 | error | a stated result | confirmed |
| E66 | misprint | nothing | confirmed |
| E67 | misprint | nothing | confirmed |
| E68 | error | a stated result | confirmed |
| E69 | gap | nothing | confirmed |
| E70 | misprint | nothing | confirmed |
| E71 | misprint | nothing | confirmed |
| E72 | misprint | nothing | confirmed |
| E73 | misprint | nothing | confirmed |
| E74 | error | a stated result | confirmed |
| E75 | misprint | nothing | confirmed |
| E76 | misprint | nothing | confirmed |
| E77 | gap | nothing | confirmed |
| E78 | gap | nothing | confirmed |
| E79 | gap | nothing | confirmed |
| E80 | misprint | nothing | confirmed |
| E81 | misprint | nothing | confirmed |
| E82 | misprint | nothing | confirmed |
| E83 | misprint | nothing | confirmed |
| E84 | misprint | nothing | confirmed |
| E85 | misprint | nothing | confirmed |
| E86 | misprint | nothing | confirmed |
| E87 | gap | the proof | confirmed |
| E88 | misprint | nothing | confirmed |
| E89 | error | a stated result | confirmed |
| E90 | misprint | nothing | confirmed |
| E91 | misprint | nothing | confirmed |
| E92 | misprint | nothing | confirmed |
| E93 | gap | the proof | confirmed |
| E94 | misprint | nothing | confirmed |
| E95 | misprint | nothing | confirmed |
| E96 | gap | nothing | confirmed |
| E97 | gap | nothing | confirmed |
| E98 | misprint | nothing | confirmed |
| E99 | misprint | nothing | confirmed |
| E100 | gap | nothing | confirmed |
| E101 | gap | the proof | confirmed |
| E102 | gap | the proof | confirmed |
| E103 | misprint | nothing | confirmed |
| E104 | misprint | nothing | confirmed |
| E105 | gap | a stated result | confirmed |
| E106 | gap | the proof | confirmed |
| E107 | misprint | nothing | confirmed |
| E108 | misprint | nothing | confirmed |
| E109 | misprint | nothing | confirmed |
| E110 | misprint | nothing | confirmed |
| E111 | misprint | nothing | confirmed |
| E112 | misprint | nothing | confirmed |
| E113 | gap | the proof | confirmed |
| E114 | misprint | nothing | confirmed |
| E115 | misprint | nothing | confirmed |
| E116 | misprint | nothing | confirmed |
| E117 | misprint | nothing | confirmed |
| E118 | misprint | nothing | confirmed |
| E119 | misprint | nothing | confirmed |
| E120 | misprint | nothing | confirmed |
| E121 | misprint | nothing | confirmed |
| E122 | misprint | nothing | confirmed |
| E123 | gap | nothing | confirmed |
| E124 | gap | the proof | confirmed |
| E125 | gap | nothing | confirmed |
| E126 | misprint | nothing | confirmed |
| E127 | misprint | nothing | confirmed |
| E128 | misprint | nothing | confirmed |
| E129 | misprint | nothing | confirmed |
| E130 | misprint | nothing | confirmed |
| E131 | misprint | nothing | confirmed |

## Checks

- `python3 scripts/check_errata.py research/blueprint/errata/PAPER-LIU-ETAL-22.json` reports no errors.
- The intake's file check (`file_problems`) is clean for the three files.
