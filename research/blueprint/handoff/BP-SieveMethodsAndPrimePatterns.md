# BP-SieveMethodsAndPrimePatterns — finite taper checkpoint

Codex — codex-a71f92. Refs #1036. Partial checkpoint; not roadmap closure.

## Delivered

Preserved all 27 prior nodes and added twelve SV.2 nodes: signed integer-difference multiplicities, triangular Fourier identity, finite geometric sine quotient, piecewise/bounded taper weights, a native Euclidean tapered-vector construction, promoted coordinate and core interfaces, signed Gram identity, diagonal mass, off-diagonal estimate, core Fourier pairing, and a conditional large-sieve bound from explicit cosecant row control.

The packet now has 39 nodes (three constructions, twenty-six lemmas, ten theorems), seventeen API items (two promoted), fourteen construction tests, forty-six suggested examples, nine planets (five SV.0, four SV.2), 82 baseline entries, four sources, eleven unreviewed findings, six gaps and no requests. No implementation status changed from unchecked.

Use native Real.fourierChar and EuclideanSpace, not a new character/kernel/vector carrier. The vector has square-root taper weights, the source's negative phase and centered frequencies. Its zero-width value is zero. The conditional theorem requires L>0, core-supported coefficients, distinct phases modulo one and an explicit nonnegative cosecant row bound C; its constant is 2N+L+C/L. It does not assert the full separated-point theorem.

## Source and ownership work

The four incoming deliverables match this session's previous PR #3210 exactly. All six reviewed audit records were freshly read; binding instructions are unchanged. Consulted-input comparison found only the ES packet changed, to this session's merged PR #3222. All 28 matching links were unchanged at initial comparison. Accepted RS-07 and the previous supplier/consumer readings remain applicable.

Bombieri's complete published pp.401–404 and the volume-18 errata were freshly reread from the same previously acquired primary scans. Paper SHA-256: 1d78ba9ee2c7cf07a2814f6febe92374290ea73572796d9724f3ed526ed5e272. A fresh publisher request returned HTTP 403; no fresh-download claim is made. The adjacent Elliott paper is outside this reading scope. Nineteen added Mathlib statements and hypotheses were read at the pin. Tau Ceti's continuous Fejér-ball overlap argument was inspected and is not a supplier of the finite discrete kernel.

E10: p.403 equates a Gram modulus to a signed kernel difference. At N=L=1 and phase difference 1/2, the difference is −1 and the modulus is 1. Taking the absolute value repairs the identity; the ensuing bound retains its factor one.

E11: p.404 bins restricted by (m+1)δ≤1/2 omit the final partial bin and may omit the antipodal endpoint. δ=3/10 and distance 2/5 give an exact witness. The corrected remaining proof must intersect bins with [0,1/2] and count the two oriented half-circles, with the antipodal point counted once.

Both findings affect proof steps, not the main theorem's truth. The full published volume errata correct other pages. Bounded fresh title/erratum/kernel searches and the atlas register found no matching correction; the 1975 almost-prime corrigendum concerns a different paper. Neither finding is independently reviewed; no exhaustive novelty or author-contact claim. E1–E9 and all four version objects are preserved exactly. The Bombieri source object only gains a read-scope entry.

## Verification

- Official packet checker with the pinned declaration index: zero errors or warnings.
- Complete suggested Lean: 39 main signatures, fifteen additional API signatures (the other two API items are promoted main lemmas), and forty-six examples; exactly 100 required proof-placeholder warnings, no other diagnostics. All 8,482 reached Mathlib source files byte-match the pin.
- Scratch Lean: four general helper theorems and eighteen concrete phase/vector/kernel/bin statements, no placeholders or diagnostics. This does not constitute complete Lean proofs of the twelve new nodes.
- Exact rational/Gaussian-rational regressions: 2,201 difference fibers; 5,610 piecewise weights; 110 diagonal masses; 110 coefficientwise Laurent identities; 124 triangular Fourier checks; 93 fourth-root sine quotients; 1,760 signed Gram checks; 1,320 off-diagonal checks; 1,280 conditional row bounds; seven rejected mutations. Fourth-root tests do not prove arbitrary-real-angle identities.
- Prior finite-sieve/residue/Gram verification evidence is retained, not freshly rerun.
- Source-issue/version checker and four-file intake check run before publication. The publication guard preserves 27 prior node objects, 63 baseline entries, nine findings and four version records; checks the current consulted inputs and matching links; and restricts tracked changes to these four deliverables.

## Resume

First finish the genuinely remaining Bombieri steps: corrected circular-separation packing, the bound C≤π²/(12δ²), a positive integer L with L+C/L≤2/δ in the correct parameter range, and exact interval translation/parity/padding. The centered N is not automatically the original interval length. The native squared norm is already the coefficient-square sum; do not duplicate a coefficient-vector carrier.

Then continue the recorded SV.0 dimension/distribution and application-specific CRT/discrepancy work, SV.1 optimization and fundamental lemmas, the remaining SV.2 duality/multiplicative/Vaughan and consumer-specific large sieves, and the unread SV.3–SV.5 source routes. Keep RS-07 ownership SV.2→AN.3, and never treat this conditional finite estimate as an arithmetic character-correlation theorem.

Only the issue's packet, reader, suggested file and this handoff are submitted. No scratch proofs, source files or other roadmap deliverables are included.
