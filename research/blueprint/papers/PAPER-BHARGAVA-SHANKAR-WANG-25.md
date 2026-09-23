# PAPER-BHARGAVA-SHANKAR-WANG-25: Squarefree values of polynomial discriminants II

Manjul Bhargava, Arul Shankar and Xiaoheng Wang, [Forum of Mathematics, Pi 13 (2025), e17](https://doi.org/10.1017/fmp.2025.9), [arXiv:2207.05592](https://arxiv.org/abs/2207.05592).

Original extraction: Claude Code — cc-fb70e5, issue #1350, PR #1914.
Independent review: Codex — codex-a71f92, issue #1351, 23 September 2026.

Status: **partial; independent verdict revise**. The [result JSON](PAPER-BHARGAVA-SHANKAR-WANG-25.result.json) retains all 75 original item IDs: 1 library, 1 planned, 73 missing; seven routes and eighteen source findings. The [review](../reviews/REV-PAPER-BHARGAVA-SHANKAR-WANG-25.md) gives the item ledger, exact checks and remaining obligations.

## Source and scope

The complete published 57-page article, including all proofs, Appendix A and references, was read. Public PDF: [Cambridge version of record](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/FD680BEF350C0140B682AB604D45F415/S2050508625000095a.pdf/squarefree_values_of_polynomial_discriminants_ii.pdf), CC BY 4.0; review-download SHA-256 `cabacefc16eefd171b1d0958cba20c1a9d3f4f7056e93365fedb5ff166e5e345`. Page 15 was also inspected as a rendered page.

The author's 4 April 2025 prepublication PDF and arXiv v1 were checked at selected locators only. No applicable published correction was found in the publisher's correction metadata, Crossref, arXiv history or the authors' pages. This is a scoped search, not proof that no correction exists. The earlier Ash–Brakenhoff–Zarrabi text was not obtained; the quartic mistake is attributed only to the BSW II text actually read.

## Results and proof boundary

The paper's targets are squarefree-discriminant and maximal-order densities for integral binary n-ic forms ordered by coefficient height, power-saving counts, and lower bounds of order X^{1/2+1/(n−1)} for degree-n S_n fields and associated unramified A_n-extensions of quadratic fields.

The squarefree quartic factor is incorrect as printed: for odd p its corrected factor equals the degree n≥5 factor,
`(1−1/p)²(1+1/p)(1+1/p−1/p²)`.
At p=3 this is 176/243, not 1600/2187. The p=2 quartic factor is 3/8. The old decimal Euler product was not independently recomputed in this review.

The proof strategy uses strong/weak divisibility, the Q-invariant of pairs of symmetric matrices, odd-degree orbit counts, and an even-degree passage from f to xf with a q-invariant. The latter requires singular-matrix counts, main/shallow/deep-cusp estimates and a squarefree sieve. The original extraction's assertion that all main results stand after an easy repair is withdrawn: the defects below expose unfinished proof obligations, not counterexamples to the main field-counting targets.

## Library and ownership

The single library item is the signed integer `NumberField.discr`; the field ordering uses its absolute value. Raw source files were checked at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The univariate `Polynomial.discr` and number-field/basis versions of Stickelberger are nearby inputs, not the general binary-form statements.

AA.3 plans the general Siegel-set supplier. IG.2's qualitative Hilbert irreducibility does **not** already plan the needed quantitative non-S_n box estimate; item 28 is now missing and routed with Kuba's reducible-only count.

| Route | Owner and boundary | Verdict |
|---|---|---|
| 1 | ST.0/ST.1: binary families, local factors, integral invariant theory and orbit parametrizations | reject |
| 2 | ST.2: application-specific cusp and uniform tail estimates, importing GN.4 | reject |
| 3 | ST.3: densities and field/class-group applications | reject |
| 4 | GN.4: generic semialgebraic and skew-lattice estimates; build on upstream lattice-count interfaces | reject |
| 5 | GN.3: precise Minkowski-reduced-basis definition; coalesce Part I | accept in isolation |
| 6 | SV.2: generic multidimensional large sieve | reject |
| 7 | IG.2: reducible count plus the missing quantitative non-S_n extension | reject |

The overall revise verdict activates no route. No new roadmap or Part II is proposed; no Tau Ceti roadmap is re-planned.

## Source findings

E1–E11 were independently checked and narrowed where needed. In particular:

- E1: quartic local factor, confirmed by exhaustive mod-4/mod-9 counts and a general unique-double-root count.
- E2: Proposition 3.6 is a false stated divisibility: the exact n=3 example has discriminant 5 and alleged divisor 2. Only a bounded-real maximal-minor estimate is retained.
- E3: the degree of Δ on W_{n+1} is 2n(n+1). The proposed repair needs a restricted family and logarithmic slack; it does not prove the original unrestricted deep-cusp estimate.
- E4: the displayed degree-four main-body optimization saves 1/21, not 1/16. This is a proof gap, not a counterexample to the stronger bound.
- E5: the cubic sign counterexample is valid under Part II's **unweighted** embedding norm. Its reduction is certified over all integers, not by a finite search. The repair retains both x-reflection and an overall sign; ordinary GL2 equivalence is not established uniformly in even degree.
- E6: even weakly divisible families are empty; this is an explanatory omission, not a substantive missing hypothesis in Theorem 3.7.
- E7–E9: distinguish non-S_n from reducible, supply the n=2 sieve with Δ=0 separated, and complete the coprime-leading-coefficient normalization.
- E10: retain the individually located typos, but remove the alleged missing-odd error. The max/min typo occurs in the proof of Lemma 6.21, not its statement.
- E11: inclusion–exclusion needs good local conditions at p dividing N; extending to a region requires boundary control.

Seven additional findings:

- E12: the last canonical ring-basis coefficient is a_{n−2}θ, not a_{n−1}θ or a_{n−1}.
- E13: the reflected |Q| is |f(0,1)|m/gcd(2,f(0,1)); for x⁴+6y⁴ the value is 3, not 6, while |q| remains 1.
- E14: Proposition 5.2 needs the j=0 constant term to count the origin.
- E15: Proposition 5.5 needs d(γΛ), not d(Λ), for a lower-rank lattice.
- E16: the unrestricted squarefree-modulus sum diverges on Δ=0.
- E17: the quadratic isotropy equation in Lemma 6.23 needs twice the off-diagonal coefficient and the basis must run through e_{n+1}.
- E18: row-contained lattices are not disjoint full-rank strata, and the deep-cusp top-block condition cannot be imposed on every matrix with the same row space.

Every finding records its locator, exact scope, correction search and independent verdict. The original diagnostic claims not rerun by this reviewer are explicitly attributed to the original worker.

## Required revision

Follow the seven `reviewGaps` in the result JSON. Split compound items into declarations; expose the Jacobian/torsor/castling and quantitative sieve suppliers; repair the full-rank restricted deep-cusp argument with honest parameters; and give a valid uniform family/multiplicity proof for the field counts. The primitive-basis sign repair alone is insufficient. The coefficient dilation T·f fixes 1 while multiplying every other displayed basis vector by T, so it is not lattice homothety.

The fifteen prerequisite entries remain as leads, not certificates that their contents have been extracted. In particular, ABZ, the full arithmetic-invariant-theory suppliers, uniform geometric sieve, Eskin–Katznelson, large-sieve sources and Nakagawa's corrected arguments need explicit contracts.

## Checks

Paper schema, stable IDs, unique routing of all 73 missing items, exact diagnostics, repository paper/queue/intake unit tests and submission-scope validation passed. The review contains a reproducible Python-standard-library diagnostic script. No Lean file was written or compiled; none is a deliverable of this review.
