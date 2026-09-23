# Mistakes in Wood, *Nonabelian Cohen–Lenstra moments*

Original job ERRATA-PAPER-WOOD-19: Claude Code, session `cc-fb70e5`, 22 September 2026. Independent review REV-ERRATA-PAPER-WOOD-19: Codex, session `codex-a71f92`, 23 September 2026. All eight findings are confirmed, with the qualifications below. Machine-readable findings and verdicts are in `PAPER-WOOD-19.json`; independent arguments and provenance are in [the review](../reviews/REV-ERRATA-PAPER-WOOD-19.md).

## Sources and correction search

Melanie Matchett Wood, with an appendix joint with Philip Matchett Wood, *Duke Mathematical Journal* 168 (2019), 377–427, DOI 10.1215/00127094-2018-0037. The reviewer independently collated all eight locations in [arXiv v2](https://arxiv.org/pdf/1702.04644v2) and the [published PDF at NSF PAR](https://par.nsf.gov/servlets/purl/10152050), including page images. This is targeted reading, not a full rereading of every page.

The arXiv version history, author's publication page, Crossref record and targeted web searches revealed no matching correction on 23 September 2026. “New” in the JSON means no correction located in those bounded searches, not a priority claim or proof that none exists. The Project Euclid landing page did not provide usable text; the published PDF was read via NSF PAR. The original worker's later-paper search was not independently repeated.

The extraction's two observations about Wood (2021), *An algebraic lifting invariant*, concern a different paper and remain outside this errata file. No extraction or roadmap is changed.

## E1 — Bad types: the argument proves a liminf (gap)

Locators: Theorem 1.2, v2 p.2 / published p.379; Theorem 4.8, v2 pp.22–23 / published pp.406–407; bad-case proof, v2 pp.24–25 / published pp.409–410.

The proof retains sufficiently large multidegrees with suitable parities and discards the other contributions as nonnegative. For fixed n, the retained Frobenius-fixed components give a uniform lower bound after normalization, with an error tending to zero as q grows. This proves the asserted lower bound with liminf. It does not establish existence of the printed limit: the discarded contributions are not controlled to that effect.

Replace lim by liminf in the bad-type clauses, or supply a separate limit-existence argument. The fixed positive rigidification factors in §2.1 transfer the lower bound from Ẽ to E. This confirms a proof gap, not a counterexample to existence of the limit. The good-type limits are not refuted.

## E2 — The whole tame group is not pro-prime-to-p (error)

Locator: Definition 3.12, v2 p.13 / published p.394.

The full tame fundamental group of P¹ minus the branch set can have finite quotients whose order is divisible by the characteristic. It is the maximal prime-to-p quotient that has the stated free pro-prime-to-p description. SGA 1, XIII, Corollary 2.12 distinguishes these assertions; it does not deny the existence of inertia generators for the full tame group.

An explicit counterexample, proved in the review, is a tame S3-cover of P¹ in characteristic 3 obtained from translations by an order-3 point and inversion on the elliptic curve y²=x³+x²+1. Its branch set also comes from a quadratic cover, so it fits the setting of the definition.

Use the maximal prime-to-p quotient. The finite targets F and F̃_c used in the invariant have order prime to p, so the relevant maps factor through this quotient. The intended invariant is not invalidated. The original modular-cover example has been replaced by the independently checked elliptic example.

## E3 — Proposition 4.4 needs hypotheses on G′ (error)

Locator: v2 pp.19–20 / published pp.402–403.

For G=C3, G′=⟨σ⟩≅C2 inside G≀C2, and Q=ℚ, the marked field ℚ(√−3) satisfies the right-hand conditions in the first bijection. The left side is empty: a C3-extension of a quadratic field has degree 6 over ℚ and cannot have a Galois closure of order 2. The inverse construction fails because ker(G′→C2) does not project onto G.

Require G′ to be admissible. A weaker sufficient repair is to assume explicitly that σ∈G′ and that ker(G′→C2) projects onto G. The second projection is then also surjective; its two projection kernels have trivial intersection, recovering the asserted normal closure. The allowed inertia conditions give the required unramified relative extension. Admissibility holds in the intended applications.

## E4 — Wrong discriminant slice (misprint)

Locator: proof of Theorem 1.2, v2 p.23 / published p.407.

Replace the subscript q^n of Ẽ in the displayed fixed-multiplier limit by q^(2n), the discriminant slice used in the input theorem and throughout the argument.

## E5 — Group letters and dimension in the imaginary case (misprint)

Locator: v2 p.24 / published p.409.

Replace CHur indexed by G and H₂(G,c) by the corresponding objects for G′. The component dimension is d=Σn_i=2n−1, so its point count is q^(2n−1)+O_n(q^(2n−3/2)), not q^n+O_n(q^(n−1/2)). The next displayed lower bound already uses the correct exponents. The scalar discriminant parameter n is not the multidegree vector.

## E6 — Infinity contributes nothing in the real case (misprint)

Locator: v2 p.25 / published p.409; subsequent correct count on p.410.

In the real case infinity splits, so remove +1 from both discriminant exponents: Nm Disc(M)=q^((Σn_i)|G′|/2), and the quadratic discriminant norm is q^(Σn_i). Each finite inertia group is tame of order 2. Here Σn_i=2n, as in the following count. The imaginary case's +1 remains correct.

## E7 — Conjecture 5.1 cannot allow arbitrary u (error)

Locators: Conjecture 5.1, v2 p.26 / published p.411; Lemma 3.11, v2 p.13 / published p.393.

The homomorphism-valued invariant satisfies I(ρ,1)=1. Thus u=1 and any nonidentity h in A=H₂(G′,c)[|μ_Q|] make the counted stratum empty for every bound, whereas the conjecture predicts average one. The review independently proves that A is nontrivial for a good admissible example over ℚ, G=PSL₂(F5) and G′=G≀C2, without assuming the paper's multiplier table.

A clean sufficient correction is to choose u generating μ_L, where L=Q(μ_(4|G̃′_c|)), or state the conjecture using the Hom-valued invariant. A generator is not always necessary: if u=ζ^a for a generator ζ, evaluation is the a-power map on A, and this map need only be an automorphism. The repaired average-one statement remains conjectural.

Both PDFs print juxtaposition H₂(G′,c)|μ_Q|, not the braces described in the earlier report. Insert torsion brackets H₂(G′,c)[|μ_Q|]. This notation slip is included in E7, not counted again.

## E8 — Order of the trivial semidirect product (misprint)

Locator: Appendix A.1, v2 p.36 / published p.421.

The trivial action of C3 on C2×C2 gives C2×C2×C3, of order 12, not the twice-printed C3×C3×C2, of order 18. The surrounding exclusion remains valid for the imaginary quadratic setting: conjugation acts on the ideal class group by inversion, so each unramified abelian extension is stable under conjugation. This does not assert an analogous statement for arbitrary base fields.
