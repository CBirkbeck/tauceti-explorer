# Mistakes in Martin, *A new proof of Chen's theorem for Markoff graphs*

Job ERRATA-PAPER-MARTIN-25. Worker: Claude Code, session `cc-fb70e5`, 22 September 2026. The finding is in `PAPER-MARTIN-25.json` beside this file.

**Paper and versions.** Daniel E. Martin, Inventiones mathematicae 241 (2025), 623–626, DOI 10.1007/s00222-025-01346-9 (CC BY 4.0).
- The extraction read the publisher PDF (SHA-256 `3e1f4b7f…097c`).
- The publisher PDF could not be fetched here, so this job checked the statement against the arXiv source of 2502.15960v1, the only arXiv version. It carries the same theorem, labelled "Special case/corollary of Chen", and the same proof.

**Earlier work.** The extraction PAPER-MARTIN-25, by Codex, found the mistake and recorded the corrected scope (items 31–34). The review REV-PAPER-MARTIN-25 re-derived it.

**Existing corrections.** None was found:
- a web search for a correction or erratum found nothing;
- arXiv has only v1;
- the author's homepage lists the paper without a correction.

## E1. Theorem 1.4 fails at p = 3 (error; affects a stated result)

**What the paper says.** For the Markoff equation (1.1), x₁² + x₂² + x₃² = 3x₁x₂x₃, and its graph G_p over F_p (vertices the nonzero solutions, edges the Vieta moves), Theorem 1.4 asserts that the number of vertices in every connected component of G_p is divisible by p. No restriction is placed on the prime p. The proof in §2 begins "Fix a prime p > 3".

**Why it is wrong.**
- **p = 3.** The right side of (1.1) vanishes mod 3. Squares in F₃ are 0 or 1, so a nonzero solution must have all three coordinates nonzero. The vertices are therefore the eight triples in {±1}³. The Vieta move x_i ↦ 3x_jx_k − x_i becomes x_i ↦ −x_i, so the moves flip one sign at a time, and G₃ is the 3-cube. It has one component, of size 8, which is not divisible by 3.
- **p = 2.** The statement holds. The nonzero solutions are (1,1,1), (0,1,1), (1,0,1) and (1,1,0), and they form one component of size 4.
- **Why the proof needs p > 3.** It divides by 2 and by 3. The passage to the coefficient-free Markoff equation z₁² + z₂² + z₃² = z₁z₂z₃ (via x = z/3), in which Chen and Eddy et al. work, needs 3 to be invertible.

**Correction.** Every connected component of G_p has size divisible by p for every prime p ≠ 3. The proof gives p > 3, and p = 2 holds by the enumeration above.

**Effect.** The theorem's application is unaffected: connectivity of G_p for all sufficiently large p, and hence strong approximation mod p for Markoff triples for large p. Only the unqualified scope of the divisibility statement is wrong.

## Not recorded

In §1 the paper quotes the effective connectivity threshold of Eddy–Fuchs–Litman–Martin–Tripeny [7] as 3.489 × 10^392. The exact primorial product in [7] is 3.448… × 10^392, so Martin's figure is a valid upper bound and not a mistake here. The decimal 3.488… printed in [7]'s publisher HTML is [7]'s own rounding slip, and belongs to that source.
