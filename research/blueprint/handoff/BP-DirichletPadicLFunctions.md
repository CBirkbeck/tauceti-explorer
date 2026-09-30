# BP-DirichletPadicLFunctions: Exact smoothing masses and inverse-moment precision

Codex / codex-7e92bd same-worker issue #713 continuation after PR #4743,
merged 376f1bc9720f005266c60dfe3b2aa5b00c563ca0 with head
4654b0105cfdc733fcd2daf3f5d7d1b2ab24579d. Original claim 5854790528,
winning bot 5854791937; no additional claim. Review #390 remains unclaimed.

## Delivered and remaining

Five nodes specify the exact residue masses of the actual smoothing measure and certified finite approximations to its inverse moments. The carry uses the inverse smoothing unit modulo p^m; quotient precision explicitly loses v_p of the nonzero smoothing denominator. All-prime arithmetic includes level zero and dyadic residue masses.

Totals: 537 unchecked nodes (1 definitions, 224 lemmas, 64 constructions, 157 theorems, 91 comparisons), 471 API entries,
840 packet tests (270 on definitions/constructions),
843 typed examples, 24 planets and 484 baseline records.
16 findings, 13 gaps, 9 requests (PadicMeasuresIwasawaAlgebras:L1, PadicMeasuresIwasawaAlgebras:L3, PadicMeasuresIwasawaAlgebras:L3, LocallyAnalyticDistributions:L1, AdicSpacesPartII:F1, AdicSpacesPartII:R2, PadicDifferentialEquationsAndRigidCohomology:RD.0, PadicDifferentialEquationsAndRigidCohomology:RD.4, PadicHodgeTheory:P7:annulus-foundations), zero closed stages.
All16 source findings, sourceVersions, nine requests and13 gaps remain. No new source finding, request or independent verdict is added. The source sign and normalization corrections, including E44–E49, are unchanged.

Exact arithmetic smoothing masses now turn inverse moments into explicit finite sums with a p^(−m) error bound. Admissible quotient precision accounts for the norm of the smoothing denominator. Canonical general K-valued character evaluation and analytic L-value identification remain with the existing PMIA and LAD requests; the conditional evalAt boundary is unchanged. The source-owned Coleman smoothed primitive and higher formulas must be imported, not reconstructed. Pole/residue comparisons, remaining Eisenstein work, all13 gaps and full source extraction remain open; preserve E44–E49 and all earlier findings.

## Reading and validation

Whole published121–123 and140–141 freshly read, with preceding whole137–139 and151–158 reading retained. Whole smoothing-denominator/series and their geometric cancellation, actual finite translation sum, reflection and tame-residue nodes were read. Whole Coleman smoothed-polylog-combination, all APIs/tests and ownership scope were checked: that primitive is already owned and is not reconstructed. Whole PMIA finite coefficient, pairing, mass/refinement and coefficient-extension APIs and signatures were checked. Native telescoping, finite natural sum, ZMod unit/permutation/cardinality, reduction kernel/lower reduction, p-adic norm/ideal criterion and continuous-map norm statements were read at the pin. The twelve complete native proofs cover the nontrivial finite-cycle uniqueness and precision steps.

All 532 predecessor nodes, 482 baseline records, 16 findings, requests and sourceVersions remain whole. This checkpoint adds 5 nodes, 5 named suggested declarations and 8 typed examples. The indexed blueprint, four-file intake, whitespace, preservation, API/test parity and versioned-source checks pass. The graph has 775 reachable nodes, 3695 edges and 654 native leaves and is acyclic. Its stage request leaves are PadicMeasuresIwasawaAlgebras:L1, PadicMeasuresIwasawaAlgebras:L3, PadicMeasuresIwasawaAlgebras:L3, LocallyAnalyticDistributions:L1, AdicSpacesPartII:F1, AdicSpacesPartII:R2, PadicDifferentialEquationsAndRigidCohomology:RD.0, PadicDifferentialEquationsAndRigidCohomology:RD.4, PadicHodgeTheory:P7:annulus-foundations. The five new arithmetic routes reuse exact existing finite-projection, coefficient-extension and inverse-weight declarations, with no new generic construction or supplier request.

The full suggested module elaborates with zero errors and 1638 expected placeholder warnings. Source and artifact audits cover 3600 pinned Mathlib modules, 21 pinned Tau Ceti modules and the verified actual 332-node PMIA artifact. The current 369-node PMIA source preserves the compiled 332-node artifact's source in order; no new supplier declaration is called and no compilation against the current supplier revision is claimed. Source, olean and original compiler-log hashes were rechecked. Existing builds only were used.

Twelve complete native lemmas check finite telescoping and triangular differences, the actual ZMod unit permutation and finite-cycle uniqueness with total mass, carry algebra and mass normalization, reduction-distance and coefficient-map bounds, inverse-power distances, actual AbstractMeasure approximation and quotient precision. The probe elaborates against 2804 pinned Mathlib modules with zero errors, warnings or placeholders. General roadmap declarations remain unchecked.

Exact controls check60 residue grids,3732 recurrence and3732 refinement identities,60 mass totals and72 ordinary moments independently derived from the existing rational smoothing series. They certify72 inverse moments, each repeated at higher level and precision, and30 quotient comparisons. They detect2688 wrong carries,163 wrong signs and25 precision losses, and retain six zero-denominator cases with nonzero numerators. Nine explicit small-modulus cell values are checked. Exact rational masses use the newly derived coefficient formula for the actual arithmetic smoothing measure. Every finite recurrence, mass and refinement is checked, including smoothing parameters larger than the modulus. Ordinary moments independently match the existing rational smoothing-series recurrence followed by iterated Mahler differentiation. Native inverse-power distance, residue-distance and measure approximation bounds certify unit inverse-moment sums modulo p^r at level m>=max(n,1,r). Each negative moment is recomputed at higher level and precision. For a nonzero smoothing denominator with valuation v, level and numerator precision increase to R+v before division; the resulting quotient is certified modulo p^R. Zero denominators are never divided, even when the numerator is nonzero. The calculation identifies actual arithmetic moment quotients, not a constructed scalar analytic L-function; the roadmap statements remain unchecked plans. The largest observed discrepancy is 0.

The62-input capture at376f1bc9720f005266c60dfe3b2aa5b00c563ca0 has no input delta from the predecessor. Existing pinned artifacts and the verified332-node PMIA artifact are reused; the current369-node source, Coleman and LAD are not claimed to compile.

The publication guard at 5ecdcddee08f8e7f0232c96a87e943e3ed93a06a checks 62 inputs, four
predecessor outputs, unchanged issue text, the original winning claim and
unclaimed review #390.
The62-input capture at376f1bc9720f005266c60dfe3b2aa5b00c563ca0 has no input delta from the predecessor. Existing pinned artifacts and the verified332-node PMIA artifact are reused; the current369-node source, Coleman and LAD are not claimed to compile.
Suggested SHA256: `043ca5649e7bed028d86c80a08710a1f73af2109f421a456f7afcef8c40085d0`.
Native probe SHA256: `18236bb12d59398a81b729d5010e71910c3313eb6def22c95f7adc70152e27a7`.

One reusable worktree and one Lean process at a time were used. All compiler
processes have ended. Exactly the four authorized deliverables change.

Retain SmoothedResidueProbe.lean and its compiler/result/source audit, numerical
control code and results, the full suggested compiler/result/source audit,
artifact hashes, graph/preservation/API receipts, captured inputs and guard,
and exact submitted files with remote receipts. Retire scratch after opening
the PR. No private path or source PDF is published.
