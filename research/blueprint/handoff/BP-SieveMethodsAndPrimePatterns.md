# BP-SieveMethodsAndPrimePatterns — finite Gram-row checkpoint

Refs #1036. Author: Codex; session codex-a71f92. Claim comment 5853992624 was explicitly confirmed by bot comment 5853993469 before work. The whole issue was reread after confirmation. Snapshot base: a6f03b8681c9524e550f8fdfb83974f35fb58923.

## Delivered

Seven new SV.2 nodes supply the finite Gram-row inequality routed as PAPER-BENNETT-SIKSEK-20/45: zero-row detection; the quadratic row estimate; the corrected Selberg defect; the stronger weighted Selberg theorem; a uniform-row bound including the empty family; the nonempty maximum Bombieri–Selberg theorem; and the diagonal/off-diagonal consequence.

The complete packet contains 27 nodes (two constructions, sixteen lemmas, nine theorems), fourteen unchanged API items, nine unchanged construction tests, thirty-three total suggested examples, seven planets (five SV.0 and two SV.2), 63 baseline declarations, four sources, nine source findings, six gaps and no requests. All twenty inherited SV.0 node objects, 41 baseline entries, two sources, eight findings and two version objects are preserved exactly. No implementation status is changed from unchecked.

The family is finitely indexed, possibly empty except in the maximum form, in a real or complex normed inner-product space. No completeness, independence or finite-dimensionality hypothesis is added. The proof uses the existing Matrix.gram and finite inner-product APIs. Row denominators are sums of absolute values, not squares; zero-row quotients are zero; the coefficient is inner(yᵢ,x)/rᵢ in Mathlib's conjugate-linear-first convention. No wrapper carrier or predicate is introduced.

SV.0–SV.2 remain partial; SV.3–SV.5 remain not_read. This is a substantive checkpoint, not complete coverage of the roadmap or the analytic large sieve.

## Source and ownership work

All six reviewed library-audit rows and the complete inherited packet, reader, suggested file and handoff were read. Fifty-eight prior consulted paths were compared to this session's last sieve checkpoint: 56 identical, the same two absences, unchanged matching-link set. Earlier complete RS-07/report/review, AUDIT-07 review, campaign/atlas, upstream EffectiveBounds/ArithmeticDirichletSeries and supplier/consumer readings remain applicable. The ES packet additionally screened here is byte-identical to this session's preceding fully read ES continuation. It develops individual short-character-sum and modulus-block results, not this Gram bound.

Read Bombieri, A note on the large sieve, Acta Arithmetica 18 (1971), pp.401–404 completely from the primary publisher scan. Proposition 1 p.402 and its proof support the seven finite declarations. The main additive theorem and its analytic proof were read but are not decomposed: the exact remaining tapered-vector, Fejér-kernel, separation-sum, taper-choice and interval steps are recorded in SV.2 coverage.

Freshly read Bennett–Siksek §8.2, pp.379–380 in text and rendered pages, including Theorem 7 and (34)–(35). The diagonal/off-diagonal consequence isolates the finite bookkeeping; it does not supply the character-family construction, correlation estimate, von Mangoldt norm asymptotic or large-parameter threshold. No complete-paper reading claim is made in this packet.

E9 is a new, unreviewed misprint finding against the acquired Bombieri version of record. After (4), p.402, the printed coefficient denominator is a global double sum of squared Gram moduli; the proof needs the first-power sum over the fixed row. The singleton f=1,φ₁=2 distinguishes printed coefficient 1/8 and defect 9/16 from corrected coefficient 1/2 and defect zero. The proposition itself is not challenged. The publisher's full volume-18 ERRATA p.450 was acquired and read; it contains no correction to p.402. Bounded title/erratum/misprint searches and the current atlas register found no matching correction. This is not an exhaustive novelty claim or an independent review; no author contact was made.

Read all 22 added baseline statements at the pinned commits, including the complete GramMatrix module, the existing finite orthonormal Bessel theorem, scalar conjugation and real-part/division facts, finite supremum and erase-count APIs. The Bessel theorem is a near miss because it requires orthonormality. Targeted pinned-library, Tau Ceti, packet and upstream PR/Zulip searches found no existing arbitrary Gram-row theorem; the open Bombieri search hit concerned the Riemann xi function, not this result. The suggested file follows native Mathlib interfaces.

RS-07's SV.2→AN.3 ownership direction stays unchanged. The quadratic-symbol bilinear and polynomial Farey consumer estimates remain distinct open work. No reverse AN.3 edge or duplicate ES result is added.

## Verification

- Official blueprint checker with pinned declaration index: zero errors and warnings.
- Source-issue/version checker on an in-memory errata-v1 envelope: zero errors.
- Complete suggested Lean: 27 main signatures, fourteen API signatures and thirty-three examples; exactly 74 required proof-placeholder warnings, no others. All 8,482 reached Mathlib sources byte-match the pin.
- Scratch Lean: all seven general new statements and twelve new examples proved without placeholders or warnings; the same pinned-source verification passed. Scratch proofs are not submitted.
- Exact Gaussian-rational regressions: 3,280 families; 9,432 zero-row checks; 13,120 quadratic estimates; 19,680 each for the defect, weighted, uniform-row and diagonal/off-diagonal bounds; 19,656 nonempty maximum bounds. No floating-point tolerances. Explicit wrong-denominator and conjugation witnesses passed.
- Inherited SV.0 proof and regression records are retained as earlier evidence, not claimed freshly rerun during this continuation.
- Preservation/DAG/file audit checks all twenty inherited node objects and the unchanged baseline/source/finding/version prefixes, matching signatures, all unchecked statuses, acyclicity, and exactly the four authorized tracked files.
- Current-main guard: 59 consulted paths checked, no changed inputs, the same two known absences, no new matching link and no applicable AGENTS file. Preservation/DAG/signature checks pass; exactly the four authorized tracked files differ. The intake file check reports four files and zero problems. Source PDFs, scratch proofs and local paths are not submitted.

## Resume

The finite routed Theorem 7 is supplied. The original Bombieri additive large-sieve argument is the immediate SV.2 reading/decomposition continuation: finitely supported taper vectors in ℓ²; the difference of Fejér kernels; reciprocal-sine-square separation estimates; integer choice of taper length; and the interval translation/parity bookkeeping for the stated constant. Check the pinned Fourier/Fejér and ℓ² APIs before adding nodes. The row bound alone is not this analytic theorem.

Read Kedlaya Chapters 15–16 and Chapter 18 for the multiplicative large sieve, duality, primitive-character reduction, Vaughan identity and Type I/II work. Check the exact quadratic-symbol and polynomial Farey consumers separately. Any imported analytic statement must name its true owner and exact hypotheses.

SV.0 retains the dimension, Rankin, divisor-tail and quantitative Eratosthenes/Brun decomposition, with E7–E8's hypotheses checked. Its labels do not imply a linear cutoff. Polynomial root sets, CRT counts and discrepancy estimates remain application work. SV.1 needs the remaining Selberg optimization and Brun/fundamental-lemma sources; existing diagonalization stays imported. SV.3 needs full Bombieri–Vinogradov quantifiers and actual AN.3 suppliers. SV.4 needs Maynard's original proof. SV.5 needs the separate beta/Chen/affine sources and their different hypotheses. The packet gives the exact coverage checklist.
