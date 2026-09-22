# Mistakes in Dasgupta–Kakde, *On the Brumer–Stark conjecture*

Job ERRATA-PAPER-DASGUPTA-KAKDE-23. Worker: Claude Code, session `cc-fb70e5`, 22 September 2026. The finding is in `PAPER-DASGUPTA-KAKDE-23.json` beside this file. The same session wrote the extraction; the independent verification of this file belongs to REV-ERRATA-PAPER-DASGUPTA-KAKDE-23.

**Paper and versions read.** Samit Dasgupta and Mahesh Kakde, Annals of Mathematics 197 (2023), 289–388, DOI 10.4007/annals.2023.197.1.5.
- The extraction read arXiv 2010.00657v3 (5 September 2022), the authors' final version, with its source dated 14 May 2022. The published text is paywalled and could not be compared line by line.
- For this job the passage was also checked in the two versions on the authors' homepages: Kakde's (14 May 2022) and Dasgupta's (February 2022).

**Earlier work.** The extraction PAPER-DASGUPTA-KAKDE-23 read the whole paper (100 pages, including the appendices). It noted one slip, in its item 221. No other mistake was noted, and none was found in re-checking the extraction's notes.

**Existing corrections.** None was found:
- the Annals article page links no erratum;
- arXiv v3 is the latest version;
- neither author's page lists a correction;
- a web search found nothing.

## E1. A stray 𝔱 in Proposition 8.6 (misprint; affects nothing)

Proposition 8.6 gives the normalized constant terms of the weight-k form W_k(ψ_𝔓, 1) at the cusps in C₀(𝔠, 𝔫). As printed in arXiv v3 and in the May 2022 version, the displayed value begins with a factor 𝔱:

c_𝒜(0, W_k(ψ_𝔓, 1)) = 𝔱 · τ(ψ)/N𝔠₀^k · sgn(N(−c)) ψ(𝔠_𝒜) · L(ψ^{−1}, 1 − k)/2^n · ∏_{𝔭|𝔓}(1 − ψ(𝔭)/N𝔭^k) · ∏_{𝔩∈J_𝔱}(1 − ψ(𝔩)) · ∏_{𝔩∈J_𝔱^c}(1 − N𝔩^k).

Here 𝔱 is the auxiliary integral ideal of §8.1, so as a factor it has no meaning. The proof, which applies Proposition 8.4 term by term to Definition 8.2, arrives at the same expression with Σ_{𝔪|𝔱} μ(𝔪) ∏_{𝔩∈J_𝔪^c} N𝔩^k ∏_{𝔩∈J_𝔪} ψ(𝔩) in place of the last two products. That sum equals those products by a Möbius identity, and no factor 𝔱 appears anywhere. Dasgupta's February 2022 version prints the formula without it. The correct value is the displayed expression with the leading 𝔱 deleted.

Nothing downstream is affected. The later comparison of these constant terms with the weight-one ones (Proposition 8.11) uses the value as computed in the proof, without the factor.
