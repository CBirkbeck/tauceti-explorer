# Mistakes in Martin, *A new proof of Chen's theorem for Markoff graphs*

Job ERRATA-PAPER-MARTIN-25. Original worker: Claude Code, session `cc-fb70e5`, 22 September 2026. Independently reviewed by Codex, session `codex-hjdg0j`, job REV-ERRATA-PAPER-MARTIN-25, 23 September 2026. The confirmed findings are in `PAPER-MARTIN-25.json` beside this file: E1 remains in the published version; E2–E3 occur only in the preprint and were already corrected in publication.

**Paper and versions.** Daniel E. Martin, Inventiones mathematicae 241 (2025), 623–626, DOI 10.1007/s00222-025-01346-9 (CC BY 4.0).
- The extraction read the publisher PDF (SHA-256 `3e1f4b7f…097c`).
- The original errata writer could not retrieve that PDF and checked arXiv 2502.15960v1 instead. It carries the same divisibility theorem and averaging argument.

The independent reviewer subsequently read all four pages of the public publisher PDF from a cached download, inspected pp.623–625 as images, and compared the current publisher PDF/HTML through web access. Direct HTTP retrieval on the review date returned a JavaScript challenge. The cached PDF's SHA-256 is `3e1f4b7f99f18b71159463aaf2d9e649e11317272782f9105299a9d72369097c`; it was originally downloaded on 21 September 2026. The freshly downloaded arXiv v1 PDF has SHA-256 `64545305d72b6a3476c980798c8133c4b034341de6145a0782a25b8669fbec7d`. Its corresponding theorem is **Theorem 1.3**, p.2. The mathematical argument agrees, but the published text corrects the two additional preprint slips below.

**Earlier work.** The extraction PAPER-MARTIN-25, by Codex, found the mistake and recorded the corrected scope (items 31–34). The review REV-PAPER-MARTIN-25 re-derived it.

**Existing corrections to E1.** None was found in a fresh search on 23 September 2026:
- a web search for a correction or erratum found nothing;
- arXiv has only v1;
- the author's homepage lists the paper without a correction.

The publisher still prints the unrestricted statement, and its page has no correction link. Crossref supplies no update-to/updated-by fields and an empty relation object. These searches support the limited status “new”; they do not establish discovery priority. E2 and E3 have the published version recorded as their existing correction.

## E1. Theorem 1.4 fails at p = 3 (error; affects a stated result)

**What the paper says.** For the Markoff equation (1.1), x₁² + x₂² + x₃² = 3x₁x₂x₃, and its graph G_p over F_p (vertices the nonzero solutions, edges the Vieta moves), Theorem 1.4 asserts that the number of vertices in every connected component of G_p is divisible by p. No restriction is placed on the prime p. The proof in §2 begins "Fix a prime p > 3".

**Why it is wrong.**
- **p = 3.** The right side of (1.1) vanishes mod 3. Squares in F₃ are 0 or 1, so a nonzero solution must have all three coordinates nonzero. The vertices are therefore the eight triples in {±1}³. The Vieta move x_i ↦ 3x_jx_k − x_i becomes x_i ↦ −x_i, so the moves flip one sign at a time, and G₃ is the 3-cube. It has one component, of size 8, which is not divisible by 3.
- **p = 2.** The statement holds. The nonzero solutions are (1,1,1), (0,1,1), (1,0,1) and (1,1,0), and they form one component of size 4.
- **Why the proof needs p > 3.** It divides by 2 and by 3. The passage to the coefficient-free Markoff equation z₁² + z₂² + z₃² = z₁z₂z₃ (via x = z/3), in which Chen and Eddy et al. work, needs 3 to be invertible.

**Correction.** Every connected component of G_p has size divisible by p for every prime p ≠ 3. The proof gives p > 3, and p = 2 holds by the enumeration above.

**Effect.** The theorem's application is unaffected: connectivity of G_p for all sufficiently large p, and hence strong approximation mod p for Markoff triples for large p. Only the unqualified scope of the divisibility statement is wrong.

**Independent verdict: confirmed.** Exhaustive enumeration, with exactly the paper's vertices and three Vieta moves, gives component sizes 4 at p=2 and 8 at p=3. The reviewer also checked the complete published averaging proof: the coordinate sum is 1, each involution pairs coordinate weights to 1, fixed points have weight 1/2, and summation over a component yields |C| = 3|C|/2 in F_p. Thus excluding only p=3 is sufficient. This finding concerns Martin's coefficient-3 normalization; it is not a counterexample to Chen's differently normalized statement.

## E2. Missing denominator factor in the preprint (already corrected)

On arXiv v1 p.2, the prose immediately before (2.3) omits the factor 3 in the formula for the first coordinate of the transformed neighbour. Definition (2.1), the adjacent display (2.3), and published p.625 all use the correct denominator 3x₂x₃. For p=5, the neighbour (2,1,1) of (1,1,1) has first weight 2/3=4, whereas the misprinted quotient gives 2. **Confirmed: misprint, affects nothing; corrected in the published version.**

## E3. Integer versus positive-integer graph in the preprint (already corrected)

ArXiv v1 p.1 asserts connectedness and the tree property for the graph of integer solutions. The graph of all nonzero integer solutions is disconnected. No coordinate can be zero, and a Vieta move satisfies x_i x′_i = x_j²+x_k² > 0, so it preserves every coordinate's sign. The solutions (1,1,1) and (-1,-1,1) therefore cannot be connected. Published p.623 expressly restricts the tree assertion to positive integer solutions. **Confirmed: error affecting that preprint assertion; corrected in publication.** The finite-field averaging proof does not use this false extension to all integer solutions.

## Not recorded

In §1 the paper quotes the effective connectivity threshold of Eddy–Fuchs–Litman–Martin–Tripeny [7] as 3.489 × 10^392. The reviewer independently read Theorem 1.4 on p.3 of the [authors' PDF](https://www.math.ucdavis.edu/~efuchs/Markoffconnectivity.pdf) and computed its exact primorial product, (863#)(53#)(13#)(7#)(5#)3³2⁵ = 3.448048382677681693… × 10^392. Thus Martin's larger sufficient bound is valid. No finding about [7]'s publisher HTML is certified by this review.
