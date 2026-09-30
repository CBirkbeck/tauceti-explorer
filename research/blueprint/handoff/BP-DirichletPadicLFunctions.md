# BP-DirichletPadicLFunctions: Finite-character moments of integral weighted series

Codex / codex-7e92bd same-worker issue #713 continuation after PR #4764,
merged 7e77e73eba62d4363f3085a9a7434e21958d6cf5 with head
146307e078defa589cfce2adbb5f6f8271c8e671. Original claim 5854790528,
winning bot 5854791937; no additional claim. Review #390 remains unclaimed.

## Delivered and remaining

Eight nodes give exact finite-character coefficient and whole-series specializations, using native DirichletCharacter.mul for the right character. Fixed-character weight congruences retain integral precision, and finite moments allow group level below character level when the character is inserted before projection. The consumed natural-input arithmetic-character API is promoted without duplicating its definition or signature.

Totals: 580 unchecked nodes (1 definitions, 234 lemmas, 69 constructions, 175 theorems, 101 comparisons), 517 API entries,
920 packet tests (295 on definitions/constructions),
923 typed examples, 24 planets and 500 baseline records.
16 findings, 13 gaps, 9 requests (PadicMeasuresIwasawaAlgebras:L1, PadicMeasuresIwasawaAlgebras:L3, PadicMeasuresIwasawaAlgebras:L3, LocallyAnalyticDistributions:L1, AdicSpacesPartII:F1, AdicSpacesPartII:R2, PadicDifferentialEquationsAndRigidCohomology:RD.0, PadicDifferentialEquationsAndRigidCohomology:RD.4, PadicHodgeTheory:P7:annulus-foundations), zero closed stages.
All16 source findings, sourceVersions, nine requests and13 gaps remain. No source finding, request or independent verdict is added. The known invalid geometric expansion in Lemma5.10 is not used.

Finite-character arithmetic tests now specialize the actual weighted integral coefficients and whole positive series, with the character inserted into the native right product, fixed-character weight congruences and finite reduction after twisting. The native twisted-divisor/Euler-deletion comparison and shared primitive-character modular-form specialization still require treatment. The character-pair constant coefficient, denominator qualifications and scalar/analytic specializations remain open. Generic completed-algebra and weight-space geometry stay with their existing owners and requests. All source corrections, analytic pole/residue questions and full source extraction remain open.

## Reading and validation

Whole published RJW143–146 freshly read, including the finite-character test and integral coefficient discussion, and159–161 in predecessor4764. Whole existing L2 arithmetic-character and integral-character constructor/API/test nodes, coefficient inclusion and pointwise-value nodes were read, with their exact suggested signatures. The existing integral coefficient, whole-series and finite-coordinate interfaces are used directly. Native character product, changeLevel, unit and nonunit evaluation and residue cast statements were read at the pins. All63 captured inputs are unchanged.

All 572 predecessor nodes, 499 baseline records, 16 findings, requests and sourceVersions remain whole. This checkpoint adds 8 nodes, 7 named suggested declarations and 13 typed examples. The indexed blueprint, four-file intake, whitespace, preservation, API/test parity and versioned-source checks pass. The graph has 822 reachable nodes, 3938 edges and 673 native leaves and is acyclic. Its stage request leaves are PadicMeasuresIwasawaAlgebras:L1, PadicMeasuresIwasawaAlgebras:L3, PadicMeasuresIwasawaAlgebras:L3, LocallyAnalyticDistributions:L1, AdicSpacesPartII:F1, AdicSpacesPartII:R2, PadicDifferentialEquationsAndRigidCohomology:RD.0, PadicDifferentialEquationsAndRigidCohomology:RD.4, PadicHodgeTheory:P7:annulus-foundations. All eight new routes end in existing native declarations through the exact preserved coefficient and arithmetic-character interfaces. Shared completed-algebra and general character-evaluation requests remain open.

The full suggested module elaborates with zero errors and 1784 expected placeholder warnings. Source and artifact audits cover 3600 pinned Mathlib modules, 21 pinned Tau Ceti modules and the verified actual 332-node PMIA artifact. The current 369-node PMIA source preserves the compiled 332-node artifact's source in order; no new supplier declaration is called and no compilation against the current supplier revision is claimed. Source, olean and original compiler-log hashes were rechecked. Existing builds only were used.

Eleven complete native lemmas check changeLevel on natural units, the actual native character product on all natural inputs including nonunits, the ordered weighted summand, actual finite Dirac evaluation and test twisting, coefficientwise and mapped whole-series equality, integral weighted divisibility, dyadic prime/third coefficients and signed cancellation in the actual coarse group algebra. The probe elaborates against 2808 pinned Mathlib modules with zero errors, warnings or placeholders. General roadmap declarations remain unchecked.

Exact finite arithmetic controls compare finite-character test moments with native product-level arithmetic, whole-truncation weight congruences and finite reduction after twisting, including group levels below the character level. Counterexamples distinguish left from right twisting and show the loss of signed character values when untwisted coordinates are projected too early. Exact integer and modular arithmetic for q-indices0–48, primes2/3/5/7, all ordered base-level pairs from0/1/3/4/5/7, principal and inflated quadratic p-power characters through level exponent3, arithmetic exponents0–4, group levels0–3 and every s≤r. Native lcm-level zero extensions are compared on all natural inputs. Separate tests change character position and reverse the projection/twisting order. The largest observed discrepancy is 0.

The63-input capture at 246b5eaec3f6e1fc91e3719d14cc30ead571588d has an empty predecessor delta. Live GitHub capture and guards use authenticated reads to avoid stale public API cache results. The actual compiled332-node PMIA artifact is reused; no declaration added in the current369-node source is called. The native twisted-divisor module remains source-checked only, without mismatched artifacts or a native build.

The publication guard at f8608e6bf29537ef8735f45fa624ab83c1618118 checks 63 inputs, four
predecessor outputs, unchanged issue text, the original winning claim and
unclaimed review #390.
The63-input capture at 246b5eaec3f6e1fc91e3719d14cc30ead571588d has an empty predecessor delta. Live GitHub capture and guards use authenticated reads to avoid stale public API cache results. The actual compiled332-node PMIA artifact is reused; no declaration added in the current369-node source is called. The native twisted-divisor module remains source-checked only, without mismatched artifacts or a native build.
Suggested SHA256: `133f4dc68625216f8e6c227cec383829fc942483fd188f3a7cacf714780ccfa9`.
Native probe SHA256: `d145cf515b146fc1b283ffa5b9811921250d3076c81550ceaa7f3ccfeb77af17`.

One reusable worktree and one Lean process at a time were used. All compiler
processes have ended. Exactly the four authorized deliverables change.

Retain WildMomentsProbe.lean and its compiler/result/source audit, numerical
control code and results, the full suggested compiler/result/source audit,
artifact hashes, graph/preservation/API receipts, captured inputs and guard,
and exact submitted files with remote receipts. Retire scratch after opening
the PR. No private path or source PDF is published.
