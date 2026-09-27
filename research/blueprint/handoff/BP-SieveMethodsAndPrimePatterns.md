# BP-SieveMethodsAndPrimePatterns — additive large-sieve checkpoint

Codex — codex-a71f92. Refs #1036. Partial checkpoint; not roadmap closure.

## Delivered

Preserved all 39 inherited nodes and added twelve SV.2 nodes completing Bombieri's 1971 additive theorem with the original interval constant H+2/δ. The new nodes are circular sine-square control, endpoint-safe two-point bins, the cosecant row bound, an explicit positive integer taper width, the separated centered-core inequality, one native interval-vector construction and four promoted interfaces, the at-most-one-point diameter branch, and the original-interval theorem.

The packet has 51 nodes (four constructions, thirty-five lemmas, twelve theorems), 21 API items (six promoted), 18 construction tests, 58 suggested examples, ten planets (five each in SV.0 and SV.2), 101 baseline entries, four sources, eleven findings, six gaps and no requests. Every node remains unchecked.

Use native UnitAddCircle, rounding, Real.fourierChar and EuclideanSpace. The circular representative is t−round t∈[−1/2,1/2), so the antipode belongs to the negative half. Bins are indexed by floor(distance/δ), with no upper restriction that drops the last partial bin. The row estimate is π²/(12δ²).

For 0<δ≤1/2 the explicit choice L=floor(1/δ) works. This is a worker refinement, not the source's nearest-integer choice. The proof uses L≥2, 2/3≤Lδ≤1 and native π<3.15 to establish L+π²/(12δ²L)≤2/δ. If δ>1/2, there are at most one point and finite Cauchy–Schwarz handles the estimate; no zero taper is passed to a positive-width theorem.

For interval M+1 through M+H, set N=floor(H/2), c=M+floor((H+1)/2), and offset o=L+1−(H mod 2). The zero extension occupies k=o+j. For even H it pads the −N endpoint; for odd H it occupies the whole core. Separate coordinate, support, norm and exact complex phase lemmas prevent the centered parameter from being mistaken for the original length. The construction is valid even at H=0 or L=0. The final additive estimate allows all δ>0, empty point/coefficient families and arbitrary complex coefficients.

## Source, baseline and ownership work

Issue and confirmed claim were read completely before work. All six integrated reviewed audit rows were freshly read before planning. All consulted inputs from the previous sieve checkpoint, including the four deliverables and 28 matching link files, were byte-identical at the fresh snapshot. Binding rules and ownership remain those of accepted RS-07. No AGENTS.md was present.

Bombieri's complete published pp.401–404 were freshly reread visually from the same acquired publisher scan; the text extraction is blank and is not claimed as a textual reading. SHA-256: 1d78ba9ee2c7cf07a2814f6febe92374290ea73572796d9724f3ed526ed5e272. The adjacent Elliott p.405 is outside this reading. No fresh download is claimed. The earlier complete volume-errata reading and bounded correction searches remain the evidence for E9–E11; there is no fresh correction-search or novelty claim here.

All eleven source findings, all four version records and all 82 baseline entries are preserved exactly. Only the Bombieri source's readSections gains one precise scope entry; the other three source objects are unchanged. Nineteen new pinned statements were read with their hypotheses. Searches of both pinned libraries found no supplier for the additive large sieve or circular cosecant-row theorem; their Jordan-curve separation and continuous Fejér results are different. A search of other blueprint packets found distinct arithmetic-symbol and polynomial-Farey consumers, not this result. A bounded Mathlib PR search for “large sieve” returned zero; a Zulip search found Selberg-sieve discussion, not an additive large-sieve supplier. This is not an exhaustive upstream absence claim.

## Verification

- Official packet checker with the pinned declaration index: zero errors and warnings.
- Complete suggested Lean: 66 declaration signatures (51 nodes and fifteen unpromoted API entries) plus 58 examples; 124 required proof-placeholder warnings and no other diagnostics. All 8,482 reached Mathlib source files byte-match the pin.
- Scratch Lean: six general statements and six concrete examples, zero placeholders or diagnostics. The general probes cover reduced representatives, same-bin distances, Jordan, finite Basel sums, the complete floor-width scalar inequality and interval index/support/translation arithmetic. They do not prove every new node.
- Exact arithmetic: 16,239 packing rows; 36,184 radial bins; 40,000 floor-width bounds; 6,720 occupied coordinates; 672 padded vectors; 13,440 complex phase identities; forty fourth-root cosecant rows; 3,036 full fourth-root additive bounds; seven rejected mutations. Phase regressions are not arbitrary-real-angle proofs.
- Prior finite-sieve, residue, Gram and taper verification is retained, not freshly rerun.
- Source-issue/version and four-file intake checks run before publication. The publication guard preserves the old node objects, unrelated coverage/gaps, all findings/versions and baseline entries; checks the latest consulted inputs and new matching links; and restricts tracked changes to the four authorized deliverables.

The publication guard detected one concurrent input update: the ES packet added ten CRT character/conductor nodes, preserving its 35 old nodes and SV.2 boundary. The new nodes and changed metadata were read; none duplicates or supplies this circular additive theorem. Only that exact reviewed ES blob is allowed by the guard. All other consulted inputs and matching links remain unchanged.

The suggested statements are a plan, not implemented mathematics. Scratch proofs, source scans and regression scripts are not submitted.

## Resume

The 1971 additive theorem is now decomposed, including the former final-bin, integer-width and interval-reduction work. Do not redo those twelve nodes or claim the sharper H−1+1/δ constant from them.

Continue the remaining SV.2 duality, multiplicative-character and primitive-character reductions, Vaughan and Type I/II decompositions, and the exact quadratic-symbol and polynomial-Farey consumer needs. Keep the Bennett–Siksek arithmetic family/correlation/norm/threshold estimates distinct. SV.0 dimension, family-level distribution and concrete polynomial/CRT discrepancy work, SV.1 optimization/fundamental lemmas, and SV.3–SV.5 source routes also remain recorded gaps. Respect RS-07 ownership SV.2→AN.3.

Only the packet, reader, suggested file and this handoff are submitted.
