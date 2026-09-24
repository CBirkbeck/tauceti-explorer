# REV-PAPER-LI-LIU-21 — independent review checkpoint

**Status: partial; no route is accepted by this checkpoint.**

Reviewer: ChatGPT, session `gpt6-20260924-c7e91a`, 24 September 2026. Issue: #1116. The extraction was written by Claude Code (`cc-fb70e5`); this reviewer did not write it. The reviewed extraction blob is `6b85b5b9a2eeca2d5e7876d4c5f5c57d31336e4c` on the submission branch. This is a source-checking checkpoint, not the completed review required by PROTOCOL sections 16 and 18. In particular, this report must not be used as an errata-register confirmation or as approval to generate roadmap jobs.

## 1. E3: the conditional input is real; the claimed repair needs a more precise comparison

The following three primary-source passages were read, including rendered PDF pages where the mathematics matters:

- Li–Liu, authors' version dated 20 October 2021, [AIPF.pdf](https://www.math.columbia.edu/~chaoli/AIPF.pdf), printed pp.44–45: the final step of Proposition 9.1 invokes Li–Zhang Theorem 10.5.1 and Remark 10.5.4.
- Li–Zhang, [arXiv:1908.01701](https://arxiv.org/pdf/1908.01701), printed pp.65–71: the auxiliary moduli diagram, Conjecture 10.4.1, its use in the divisor comparison, and the explicit qualification immediately before Theorem 10.5.1. That qualification makes the dependence on Conjecture 10.4.1 unambiguous.
- Li–Rapoport–Zhang, [arXiv:2404.02214v2](https://arxiv.org/pdf/2404.02214v2), Theorem 14.6.2, Corollary 16.1.5, Example 14.6.3, and the qualification following Theorem 1.0.1. These are the relevant later comparison results, not merely a theorem with similar terminology.

Two distinctions prevent treating the later theorem as a verbatim replacement for the older conjecture:

1. Conjecture 10.4.1(ii) describes a blow-up along the indicated zero-dimensional subscheme. The later introduction expressly allows an ideal sheaf **supported on** that locus. The statement of Theorem 14.6.2 itself gives properness and an isomorphism away from the locus. A proof that uses the particular ideal of the reduced centre must justify that stronger input separately.
2. For the first projection, the exceptional divisor is the **reduction** of the inverse image of the balloon locus (Corollary 16.1.5). It must not be identified with that scheme-theoretic inverse image without reduction. The later paper's rank-two example explicitly has a nonreduced inverse image of multiplicity `q+1`.

The second distinction is mathematically substantive. A finite map can be totally ramified over a divisor while its inverse image has that divisor only as its support. Equality of supports, equality of reduced closed subschemes, and equality of Cartier divisors are different inputs to an intersection calculation. Therefore a route brief that imports the literal older conjecture is not automatically certified by citing the later theorem number.

**What has been established:** the conditional citation chain used in E3, and the need for this scheme-structure/ideal comparison in its proposed repair. **What has not been established:** that these distinctions obstruct the proof of Li–Zhang Theorem 10.5.1, or that Li–Liu's main theorems are false. The remaining task is to inventory the actual uses in Li–Zhang §§10.4–10.5 and substitute the precise later statements. No new error in either primary source is asserted here.

The extraction is internally too definite about this boundary: its summary says the hypothesis persisted only until the later theorem, whereas its human report acknowledges that the blow-up comparison was not checked line by line. The completed review must reconcile those claims and distinguish a historical conditional input from a presently verified repair. It must also check the publication history before retaining `known: new`.

## 2. Formula and locator checks already useful to the continuation

Theorem 1.5's condition on the number of split places was checked in the rendered Li–Liu PDF: it is `|R ∩ V_F^spl| ≥ 2`. The text parser renders the glyph as `>`. Do not introduce an erratum by trusting that parsed character.

For extraction item 45, the formula is displayed on printed **p.44**, followed by its concluding citation on p.45. In that display the finite place of `F` below `u` is underlined in several subscripts. Losing that underline collapses two residue cardinalities. Use distinct notation, for example `q_F` and `q_E=q_F^2`, rather than a single `q_u` with a prose exception for logarithms. The rendered display was checked; a complete normalization comparison with Li–Zhang Remark 10.5.4 is still required before rewriting the item.

## 3. Coverage and limitations

The complete original extraction, all eleven source-issue entries, all seven route briefs, the catalogue-wide ownership search, and the pinned-library audit have **not** yet all been reviewed. No claim of completeness is made for those tasks. No Lean source was added or compiled. No local run of `scripts/check_paper.py` is claimed: a repository clone could not be obtained in the execution container, whose outbound network access failed. GitHub connector reads and branch writes work.

No production `PAPER-LI-LIU-21.review.json` is written at this checkpoint, because its accept/revise schema is used by the completed-review workflow. The original extraction and its source-issue verdicts remain unchanged. The handoff records the outstanding work before this job can be completed.
