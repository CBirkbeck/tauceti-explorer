# Mistakes in Tsimerman, *The André–Oort conjecture for A_g*

Job ERRATA-PAPER-TSIMERMAN-18. Worker: Claude Code, session `cc-fb70e5`, 22 September 2026. The findings are in `PAPER-TSIMERMAN-18.json` beside this file.

**Paper and version read.** Jacob Tsimerman, Annals of Mathematics 187 (2018), 379–390, DOI 10.4007/annals.2018.187.2.2. The version read is the publisher PDF, and every passage below was re-read there; E1 was also checked on the page image. arXiv 1506.01466v5 (December 2015) was compared: it has the same wording for E2 and E3, while the §5 passage of E1 appears only in the published version.

**Earlier work.** The extraction PAPER-TSIMERMAN-18 (partial) noted all three. It also noted issues in cited papers (Pila–Tsimerman's 2013 lattice lemmas) and in its own earlier attributions; those are not mistakes of this paper and are not recorded here.

**Existing corrections.** None was found:
- the Annals page links no erratum;
- arXiv's last version predates publication;
- a web search found nothing.

**Effect.** None of these touches the main theorem (André–Oort for A_g) or its proof strategy.

## E1. Norms of ideals of the reflex field (misprint)

In the proof of Theorem 5.2 (p. 386), H is defined as the group of classes [I] in Cl(K*), where K* is the reflex field, with t_{K,φ}(I) = (a) and "Norm_{K/Q}(I) = aā". The next paragraph writes Norm_{K/Q}(I) = r_{K,φ}(I) r̄_{K,φ}(I) and |O_K/I|.

Since I is an ideal of K*, these should be N_{K*/Q}(I) and |O_{K*}/I|. The ideal-level identity behind the argument is t_{K,φ}(I)·t̄_{K,φ}(I) = N_{K*/Q}(I)·O_K, for the reflex norm t on ideals rather than the induced map r on class groups. The argument is otherwise unchanged.

## E2. Proposition 2.2 is weaker than its use (gap)

Proposition 2.2 says only that there are *two* elements of S(E, Φ) with no isogeny of degree less than |Disc(E)|^{1/4−o(1)} between them. Theorem 4.2 bounds the field of moduli of an *arbitrary* A ∈ S(E, Φ), but its proof begins "by Proposition 2.2, there are two elements A and B …", so it silently replaces the given A.

The proof of Proposition 2.2 gives the stronger statement actually needed. It fixes an arbitrary A, notes that isogenies from A of degree n correspond to ideals of norm n (at most n^{o(1)} of them), and compares with |S(E, Φ)| ≫ |Disc(E)|^{1/4−o(1)}. So for every A some B is at least that far away. Stating Proposition 2.2 in that form closes the gap.

## E3. "The regulators of E and E₀ are the same" (error; affects nothing)

In §2.2 the lower bound |S(E, Φ)| ≫ |Disc(E)|^{1/4−o(1)} is derived from Brauer–Siegel, the inequality |Disc(E)| ≥ |Disc(E₀)|², and "the fact that the regulators of E and E₀ are the same". For a CM field E of degree 2g with maximal totally real subfield E₀, one has R_E = (2^{g−1}/Q)·R_{E₀}, where Q ∈ {1, 2} is the Hasse unit index. This is an equality only when g = 1, or when g = 2 and Q = 2. The factor depends only on g, so the bound stands.
