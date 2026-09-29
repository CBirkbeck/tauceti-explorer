# REV-PAPER-BERGSTROM-FABER-PAYNE-24: review of the extraction of Bergström–Faber–Payne, *Polynomial point counts and odd cohomology vanishing on moduli spaces of stable curves*

**Verdict: accept.** All five routes are accepted, and all six recorded mistakes are confirmed. The review finds no further mistakes, and nothing in the extraction changed apart from the verdicts.

Reviewer: Claude Code, session `cc-fb70e5`, 29 September 2026. Extraction under review: Claude Code, session `cc-39fac3`, issue #1079 (PR #4271). It has 80 items (2 library, 6 planned, 72 missing), 5 routes and 6 `sourceIssues`, with status `complete`. `cc-fb70e5` appears nowhere in its files.

Source: [arXiv:2206.07759v2](https://arxiv.org/abs/2206.07759), 17 October 2023, posted after the Annals acceptance, with SHA-256 `36beb2d3…` matching the record. The Annals article (199 (2024), 1323–1365) is not openly available, so findings stay scoped to v2, as the extraction says. The arXiv listing shows v2 as the last version (checked 29 September 2026).

## 1. Items, and the computations recomputed

I read all 31 pages. Every numbered proposition, theorem, lemma, corollary, definition and example appears in an item locator; Example 7.8 is covered by "Examples 7.7–7.9". The remarks left out (1.7, 1.8, 2.2, 2.3, 2.5, 7.2, 8.9 and 8.10) are commentary, and the strategy of Remark 8.9 is carried by item `section-10`.

The paper's results are computations, so I recomputed the load-bearing ones independently, in exact arithmetic with SymPy:

- **(6), the automorphism orders.** These are |GL₂(F_q)|·q³ = q⁷ − q⁶ − q⁵ + q⁴ for the cone, 2|PGL₂(F_{q²})| = 2(q⁶ − q²) for the non-split quadric, and 2|PGL₂(F_q)|² for the split quadric.
- **Inverse zeta coefficients.** For P¹, (Q^con)^sm, Q^nsp and Q^spl, they match Example 7.7, (13) and §§8.2–8.3.
- **Proposition 5.1**, by expanding #C(#C−1)(#C−2) in q + 1 − #C, using Lemma 5.2's moments. The page image shows #H_{g,2} = (q+2)q^{2g} − 1, which is the right value; the text layer is ambiguous there.
- **The §10 assemblies for n = 0, 1, 2.** I summed Propositions 8.1–8.7 over the three quadrics, divided by (6), and added #H_{4,n} and Proposition 9.6's boundary. The results reproduce Theorem 1.4 in all degrees ≥ (9+n)/2. For example, n = 0 gives #(M₄ ∖ H₄) = q⁹ + q⁸ − q⁶ + o(q^{9/2}).
- **The Theorem 1.5 subtractions for n = 1, 2, 3.** They reproduce the printed polynomials, with Euler characteristics 2, −2 and −10. They also confirm E3.
- **Remark 8.11's orbit-type formula** for 4-tuples in general position equals (q+1)²q²(q−1)² exactly.

## 2. Statuses: all hold

The library citations resolve at Mathlib 082e2d3:

- `quadraticChar`;
- `quadraticChar_sum_zero`, whose `ringChar F ≠ 2` hypothesis matches the paper's odd-q proof;
- `Matrix.card_GL_field`.

The six planned items hold against the full stage text. SF.2 integrates the point-counting supplier. WC.1 owns the zeta function with its "disjoint-union products, open–closed factorization" and consumes the determinant formula. WC.3 carries purity, and WC.4 "Betti-number comparison in families". Neither library has point counts of stacks, zeta functions of varieties or moduli of curves.

## 3. Routes: all five accepted

1. **New roadmap `MotivicStructuresInModuliOfCurves`.** PAPER-CANNING-LARSON-PAYNE-24 proposed it, with the same id, title and area, and that extraction's review accepted it. DESIGN-MotivicStructuresInModuliOfCurves is pending, and its brief already asks for "the vanishing of the low-degree Borel–Moore homology of M_{g,n} proved by Bergström–Faber–Payne". The 49 moduli-theoretic items belong there.
2. **Source → WC.1, WC.2, WC.4, WC.5, WC.5:power-sum-converse.** Behrend's stack counts, the Vakil–Wood inverse-zeta formula and the Hasse–Weil sieve extend WC.1's zeta interface. The finite-spectrum lemma of van den Bogaart–Edixhoven is exactly WC.5:power-sum-converse.
3. **Source → DWP.8.** The weight spectral sequence of a normal crossings compactification.
4. **Source → FF.1, FF.3.** The character correlation by interpolation, and the squarefree count.
5. **Source → GN.2.** The finite-field classification of quadric surfaces and their automorphism orders.

## 4. Mistakes in the paper: 6 of 6 confirmed

Each was checked on the page images of arXiv v2.

- **E1** (Corollary 3.2). The conclusion should concern M̄_{4,n}: Proposition 3.1 with s = 9 + 2n, plus duality, gives only that.
- **E2** (proof of Proposition 3.1). The display should have o(p^{ms/2}), not o(p^{md/2}).
- **E3** (§10.1). "−11q⁴" should be −11q³. The recomputation above shows the q⁵ and q⁴ coefficients are 0 and the q³ coefficient is 1168 − 1179 = −11.
- **E4** (Remark 2.2). "Proposition 2" should be Proposition 2.1.
- **E5** (§9). "[GK98, Theorem 8.3]" should be 8.13. I checked this in Getzler–Kapranov's arXiv:dg-ga/9408003v2, where Theorem 8.13 is the character formula and §8 has no Theorem 8.3.
- **E6** (bibliography). "arXiv:22111.16061" should be 2211.16061; the arXiv API returns Wong's paper there.

## 5. Checks

`scripts/check_paper.py` passes. The only changes are the six `review` verdicts and the report's section "Corrections by the independent review".
