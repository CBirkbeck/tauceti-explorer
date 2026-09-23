# Mistakes in Benoist–Wittenberg, *On the integral Hodge conjecture for real varieties, I*

Job ERRATA-PAPER-BENOIST-WITTENBERG-20. Original worker: Claude Code, session `cc-fb70e5`, 22 September 2026. Independent review: Codex, session `codex-hjdg0j`, job REV-ERRATA-PAPER-BENOIST-WITTENBERG-20, 23 September 2026. The JSON beside this file contains confirmed verdicts for E1–E2 and three additional notation slips found in their surrounding passages.

**Paper and version read.** Olivier Benoist and Olivier Wittenberg, Inventiones mathematicae 222 (2020), 1–77, DOI 10.1007/s00222-020-00965-8. The version read is the author-hosted copy of the published version, with journal pagination (SHA-256 `daeb43ec…46a9`), as by the extraction. Every passage below was re-read there. arXiv 1801.00872v3 has the same Theorem 3.16.

**Earlier work.** The extraction PAPER-BENOIST-WITTENBERG-20 (partial) found both mistakes. It kept the printed statement of Theorem 3.16(ii) as an unrouted item next to a corrected one.

**Existing corrections.** None was found:
- Wittenberg's publications page lists this paper and its part II without an erratum for part I, although it lists an erratum for another joint paper;
- arXiv v3 is the latest version;
- a web search found nothing.

The independent review refreshed these checks on 23 September 2026 using both authors' publication pages, the publisher article page, arXiv's history and Crossref. ArXiv still ends at v3; the authors' linked erratum is for their different paper on intermediate Jacobians, and the publisher bibliography's erratum is for Benedetti–Dedò. No correction for this paper was located. The JSON records the search and full source hashes. The author's journal PDF and latest manuscript versions all retain the five findings; the review did not compare v1/v2. “New” is limited to this search.

**Effect.** The applications, to surfaces and higher-dimensional varieties, are unaffected.

## E1. Theorem A(ii) and Theorem 3.16(ii) in dimension one (error; a stated result)

Theorem A allows dimension d ≥ 1, and Theorem 3.16 allows dim X > 0. Part (ii) states that, under the real integral Hodge conjecture for 1-cycles and H²(X, O_X) = 0, X contains a geometrically irreducible curve of even geometric genus if and only if Pic(X)[2^∞] → Pic(X_C)^G[2^∞] is onto.

In dimension one this fails. Take X to be the smooth projective completion E of y² = x³ − x over R.
- **The hypotheses hold.** H²(E, O_E) = 0, and the Hodge condition for 1-cycles is the trivial degree-zero statement.
- **The left side fails.** The only geometrically irreducible curve in E is E, of genus 1.
- **The right side holds.** E has real points, so Br(R) → Br(E) is injective and Pic(E) → Pic(E_C)^G is an isomorphism.

The proof uses Proposition 3.9, whose second assertion supplies an even-genus curve when X has a real point and dimension at least two. The correction **d ≥ 2 or X(R) = ∅** applies to the even-genus equivalence in part (ii); this finding does not require restricting part (i). When X has no real point, Theorems 3.3 and 3.6 give the equivalence without invoking Proposition 3.9. In dimension one it is precisely Lemma 3.7. Thus the no-real-point alternative is justified, not an unverified extension of the correction.

**Independent verdict: confirmed.** The cubic has discriminant 4 and its projective completion has a real smooth point at infinity, so it is a smooth projective geometrically integral genus-one curve. Its codimension-zero cycle generates H⁰_G(E(C),Z)=Z, verifying the real integral Hodge hypothesis. A real point splits Br(R)→Br(E), so the low-degree Hochschild–Serre sequence gives the asserted Picard isomorphism, including on 2-primary torsion. The genus-one counterexample therefore meets every hypothesis. More precisely, for any smooth proper geometrically integral curve with a real point, the Picard condition always holds and the left side holds exactly when the curve itself has even genus.

## E2. k = 0 in the constant classes ω^{2k} (misprint)

In §2.2 (p.37), the constant-class paragraph includes k=0, asserts torsion and claims that the topological condition is equivalent to having no real point. For X=Spec R and k=0, the class ω⁰=1 generates H⁰_G(pt,Z)=Z. It is not torsion, and as the class of X it satisfies the topological condition despite the real point.

The correction is **k>0 even**. In that range the class is 2-torsion. If X has a real point, §1.2.5 gives its degree-zero restriction component as 1, whereas Definition 1.19 requires that component to vanish since 0<k. If X has no real point, the restriction condition is vacuous. **Independent verdict: confirmed.** The positive-degree argument and the following Example 2.5 are unchanged.

## E3. Domain of the cycle map (misprint; affects nothing)

The paragraph immediately before Theorem 3.16 on p.55 gives Pic(X) as the domain of ϕ=ψ∘cl. The correct domain is CH₁(X), as defined on pp.49,54 and in the diagram at the top of p.55. The map ψ accepts degree 2d−2, twist d−1, whereas divisor classes from Pic(X) have degree 2, twist 1. They agree only for surfaces. The same typo occurs in arXiv v3 p.48. **Confirmed.**

## E4. Equivariant ambient group after (2.1) (misprint; affects nothing)

The explanatory sentence immediately after (2.1), p.37, omits the subscript G in the ambient cohomology group. Restore H^{2k}_G(X(C),Z(k)). The displayed intersection is already correct: its two groups are subgroups of equivariant cohomology, and the topological restriction condition is defined there. Ordinary cohomology enters through the forgetful map for the Hodge condition. ArXiv v3 p.32 has the same omission. **Confirmed.**

## E5. Source of proper push-forward (misprint; affects nothing)

The last sentence of §1.2.6 on p.19 gives H^p(X(R),Z/2) as the source of f_* for f:Y→X. Replace it by H^p(Y(R),Z/2). The target and degree shift remain correct. Equations (1.14), (1.35) and (1.59) all fix the intended source. For the proper fold map from two real points to one, the actual degree-zero push-forward is (Z/2)²→Z/2, summing the two coordinates. The misprinted source has only one coordinate. ArXiv v3 p.17 retains the typo. **Confirmed.**
