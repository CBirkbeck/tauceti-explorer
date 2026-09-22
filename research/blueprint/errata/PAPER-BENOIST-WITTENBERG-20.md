# Mistakes in Benoist–Wittenberg, *On the integral Hodge conjecture for real varieties, I*

Job ERRATA-PAPER-BENOIST-WITTENBERG-20. Worker: Claude Code, session `cc-fb70e5`, 22 September 2026. The findings are in `PAPER-BENOIST-WITTENBERG-20.json` beside this file.

**Paper and version read.** Olivier Benoist and Olivier Wittenberg, Inventiones mathematicae 222 (2020), 1–77, DOI 10.1007/s00222-020-00965-8. The version read is the author-hosted copy of the published version, with journal pagination (SHA-256 `daeb43ec…46a9`), as by the extraction. Every passage below was re-read there. arXiv 1801.00872v3 has the same Theorem 3.16.

**Earlier work.** The extraction PAPER-BENOIST-WITTENBERG-20 (partial) found both mistakes. It kept the printed statement of Theorem 3.16(ii) as an unrouted item next to a corrected one.

**Existing corrections.** None was found:
- Wittenberg's publications page lists this paper and its part II without an erratum for part I, although it lists an erratum for another joint paper;
- arXiv v3 is the latest version;
- a web search found nothing.

**Effect.** The applications, to surfaces and higher-dimensional varieties, are unaffected.

## E1. Theorem A(ii) and Theorem 3.16(ii) in dimension one (error; a stated result)

Theorem A allows dimension d ≥ 1, and Theorem 3.16 allows dim X > 0. Part (ii) states that, under the real integral Hodge conjecture for 1-cycles and H²(X, O_X) = 0, X contains a geometrically irreducible curve of even geometric genus if and only if Pic(X)[2^∞] → Pic(X_C)^G[2^∞] is onto.

In dimension one this fails. Take X to be the real elliptic curve E: y² = x³ − x.
- **The hypotheses hold.** H²(E, O_E) = 0, and the Hodge condition for 1-cycles is the trivial degree-zero statement.
- **The left side fails.** The only geometrically irreducible curve in E is E, of genus 1.
- **The right side holds.** E has real points, so Br(R) → Br(E) is injective and Pic(E) → Pic(E_C)^G is an isomorphism.

The proof uses Proposition 3.9, which provides curves of odd geometric genus and, as the introduction says (p. 4), concerns dimension at least two. The statement should assume d ≥ 2. The extraction also records the scope "d ≥ 2 or X(R) = ∅".

## E2. k = 0 in the constant classes ω^{2k} (misprint)

In §2.2 (p. 37), for "k ≥ 0 even", the class ω^{2k} is said to be torsion and to satisfy the topological condition "if (and only if) X(R) = ∅". For k = 0 the class ω⁰ = 1 is not torsion. It is the class of X itself, so it is algebraic and satisfies the topological condition even when X has real points. The passage should read "k > 0 even", for which the statement is as printed.
