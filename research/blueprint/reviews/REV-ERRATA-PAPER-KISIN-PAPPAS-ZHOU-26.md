# Independent review: REV-ERRATA-PAPER-KISIN-PAPPAS-ZHOU-26

Issue: #1859. Reviewer: Codex — codex-a71f92. Date: 23 September 2026.
Verdict: **complete — confirmed with amendments**.

## Independence and claim

The original errata were written by Claude Code — cc-442dc5. The underlying extraction was a codex-c83e7a checkpoint completed by cc-442dc5. This reviewer wrote neither; using KPZ as a source for the separate KP18 review did not involve writing or reviewing this errata job.

Claim comment 5796327470 was posted at 14:07:18 UTC. The bot confirmed that exact comment in 5796330434 at 14:07:29 UTC, and the whole issue was reread before task work. No higher-priority restructure, naming, paper, fix or errata job was available at selection.

## Evidence and verdicts

The companion errata report supplies exact public URLs, complete SHA-256 hashes, version-specific locators, calculations and repair arguments. The named Cambridge repository PDF was fetched and its full hash matched the original worker's copy. The relevant pages agree with the directly obtained publisher PDF after footer/whitespace normalization; critical formulas were checked on publisher page images. arXiv v3 was read at the corresponding locators, with the garbled Lemma 7.2.8 sentence compared visually. Correction searches were renewed rather than inherited.

| Finding | Verdict | Independent check / amendment |
| --- | --- | --- |
| E1 | Confirmed | Factorization gives local zero divisors; tangent cone and all formal arcs verify that the intended counterexample still works. Removed reliance on inherited P95 provenance. |
| E2 | Confirmed, substantially amended | Explicit divided-power matrices disprove adjacent-weight equivalence, opposite-root pair symmetry and the proof's range assertion. The right lattice inclusion repairs Proposition 4.2.10(2) for general weights. The minuscule squeeze restores k=j=l, not merely k=j; reach changed to the proof. |
| E3 | Confirmed, expanded | Representation weights are characters and λ a cocharacter. Added the malformed p.37 membership, comparing its intact v3 form. |
| E4 | Confirmed, expanded | B root/coroot dual lattices and fundamental-weight pairings; added the spin factor 1/2/range and D dummy-index slips. |
| E5 | Confirmed, amended | Direct linear combination gives (t−s)/2. Corrected the old reason: half-spin hypotheses do involve the last coordinate, but the remaining inequalities do not. |
| E6 | Confirmed | GL₂ λ=μ=(1,0) gives k_α=1, k_(−α)=0; compared the W(−α) lemma and the correctly signed downstream use. Equality with l_(−α) follows from repaired E2. |
| E7 | Confirmed, amended | Real scalar extension, publisher-image damage and intact v3 factorization checked. Removed the unsupported openness explanation; E9 gives its repair. |
| E8 | Confirmed, amended | Smooth-chart x↦u sends x² to u², not zero; the composite to dual numbers kills it. Qualified the old absolute claim, which fails for constant curves. |
| E9 | Added and confirmed | Doubled standard SL₂ representation gives Bil≅M₂ and polarizations in Sym₂ positive definite, not an open subset of all Bil. Repair via rational invariant alternating forms. Read Deligne's original definition and existence input. |
| E10 | Added and confirmed | Pure root directions in a product are indexed by disjoint unions. GL₂×GL₂ minuscule case has two directions, not the singleton Cartesian product. |

All ten have `review.by = REV-ERRATA-PAPER-KISIN-PAPPAS-ZHOU-26`.
Counts: 3 errors, 7 misprints; 2 affect proof steps and 8 affect nothing; 10 new in the bounded correction-search sense. No finding is rejected as a whole, although several inherited explanations/reach claims are expressly corrected.

## Important scope limits

This is a complete review of the listed errata, not a certification of every line of the 89-page paper. The unrestricted numerical identity in Proposition 4.2.10(1) retains an invalid printed argument outside the minuscule-set hypothesis. The review does not claim that identity is false or supply a general replacement proof. The main-theorem application uses the minuscule case, for which the report supplies the repaired squeeze.

The extraction's old handoff describes the general bound in 4.2.10(2) as open. The explicit right-inclusion argument here supersedes that uncertainty; those extraction files are outside this issue and are deliberately unchanged. E9 is a newly identified proof-step error with a local repair, not a claim that Lemma 7.2.8 is false.

The known KP18/P23 corrections discussed by KPZ are not mistakes in KPZ and have not been duplicated. No author notification is authorized or sent.

## Validation

Validation commands and outcomes are recorded in the handoff after the final fresh-base check. They include the errata schema checker, four-file intake check, all 65 relevant regression tests, and an in-memory collector check with this review job marked done only in memory. No generated register or queue is rewritten.

Independent stdlib-only scratch checks verify the divided-power counterexample for p=3,5,7,11, the inverse-action exponent identity, invariant/alternating matrices for the SL₂ example, and source-copy page agreement. These are diagnostic checks alongside the arguments above, not formal proofs.

Lean: not applicable; no Lean file changed or elaborated. Nothing is claimed formalized.
