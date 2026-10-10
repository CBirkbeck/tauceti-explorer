# BP-DeformationAndDerivedPatchingAlgebra--R03.3

Agent: Codex. Session: codex-EQuxOZ. Issue: #6322. Branch: codex-EQuxOZ-r03-3.
This submission completes one blueprint pass. It is not a checkpoint and claims no implementation.

## Result and coverage

The packet status is **complete**. The sole stage, `DeformationAndDerivedPatchingAlgebra:R03.3`, is **planned**, not closed. All of its targets are now stated as new declarations or exact imports, with dependency endpoints in baseline declarations, supplier nodes, requested contracts or recorded proof gaps. The accepted P7 Hilbert–Samuel and curve strand remains intact in its owning packet; this pass neither edits it nor claims it is proved.

Counts: **57 nodes**: 4 definitions, 49 lemmas, 4 theorems; **13 API items**, **12 definition tests**, **6 planets**, **55 baseline declarations**, **7 gap records**, **4 supplier entries** (three mathematical requests and one upstream import reconciliation). All implementation statuses are unchecked. Two harmless editorial/index source slips are recorded in our own words; they await independent confirmation.

The four deliverables are the R03.3 packet, reader, suggested file and this note. No application, campaign, audit, reserved-id, queue or other packet file changed.

## What this pass establishes as a plan

- Ideal-level regular sequences, minimal-generator invariance, faithful-flat reflection/descent, regular local surjection kernels and changes of regular presentations.
- Native finite free/minimal resolutions, endpoint detection of native pd, residue-field Ext scalar annihilation, minimal-map vanishing on Ext, the pd-one depth drop, strict syzygy equality and the decomposed Auslander–Buchsbaum formula.
- Syzygy depth bounds, finite pd and residue-field pd over regular local rings, and the submodule support-dimension bound used by Calegari–Geraghty.
- Surjective, finite and semilocal depth formulas, exact associated-prime contraction under scalar restriction, finite action images, action depth/support dimensions, module miracle flatness and Kisin's finite projective faithful module theorem.
- Fibre injectivity with flat cokernel, regular-element lifting, tensor and ring depth addition, flat-local CM equivalence, completion depth and finite pd across a regular closed fibre for modules flat over the base.
- Absolute regular-presentation/local-CI/global-local-CI predicates, presentation independence, the regular-source quotient criterion, actual conormal generators, finite-pd conormal injectivity, nested regular ideals, Avramov's flat base/fibre equivalence, localization and maximal-ideal detection, and CI implies CM.
- The missing regular tangent-cone polynomial comparison and regular-local domain statements, retaining the actual P7 maps and their Hilbert–Samuel dependencies.

Zero conventions are explicit: depth(0) is infinity, native support dimension and native pd of zero are bottom. Nonzero hypotheses remain in AB, module miracle flatness, support and faithfulness conclusions. The conormal criterion concerns the actual kernel in a regular local source. The Artinian quotient by the square of a two-variable maximal ideal is a CM non-CI test; the one-variable square quotient is a nonregular CI test.

## Ownership and assembly instructions

SF.0 owns depth, CM/MCM, catenarity, excellence and Cohen structure. This part imports those contracts. SF.0's current review says needs_changes, so these imports are not completed proofs. R03.6 owns maximal-depth component/associated-prime and nearly-faithful conclusions. Full support is stated explicitly when invoking equidimensionality or the localized dimension formula; the module R/(x) over k[[x,y]]/(xy) rules out CM as a substitute for full support.

The P7 node `DeformationAndDerivedPatchingAlgebra:R03.3/free-of-maximal-depth-regular-local` uses the old bundled AB/finite-pd target. The new proof instead uses `SchemeAndStackFoundations:SF.0/free-maximal-depth-regular-local`, whose proof is parameter induction independent of AB. At assembly, redirect the P7 consumer to that independent proof before replacing the old bundled target. Otherwise finite-pd-over-regular-rings and AB can become circular. Do not infer closure merely because these statements appear in both plans.

The P7 ordinary adic Rees quotient, coefficient algebra, homogeneous decomposition/projections, degree-one generator maps and finite generation stay with P7. This part adds injectivity for its polynomial map and the domain consequence. Existing P7 references carry the R03.3 stage prefix; their ids are reused as imports rather than recreated.

Tau Ceti's ModularCurves layer 4D owns completion regularity/dimension, regular localizations, regularity descent and the finite-map ring miracle-flatness contracts. Current TauCetiRoadmap main and current Tau Ceti were read, including the nine roadmaps newer than the atlas snapshot. The current finite-type-field dimension presentation file does not supply general local depth/CI. Hypersurface matrix-factorization targets in StablePeriodicCurve do not supply the missing CI converses. No existing upstream target was replanned.

The suggested file includes exact definition snapshots for SF.0 depth/CM and the minimal P7 Rees quotient/generator map because those proposed modules are not installed in the pinned build. Replace snapshots with imports during assembly. They are not additional packet targets. The remaining aliases and quotient instances use concrete native carriers, maps and actions. There is no simulated Tor-amplitude, derived algebra, excellence or catenarity predicate. Tensor-depth signatures put the S-module factor first to use the native action; tensor symmetry identifies this with the order in the reader.

## Exact remaining inputs

1. **Tate obstruction.** Decompose the finite-variable-per-degree Tate resolution, principal square-zero extension derivation of degree minus two, relation class, divided-power compatibility and nonzero iterated divided-power images in even Tor (Stacks 23.6.9 and 23.7.1–3, tags 09PS–09PU). This closes finite-pd conormal injectivity and hence the nested-ideal and Avramov chains. Neither depth nor conormal freeness proves it.
2. **Polynomial relation growth.** Establish Stacks 10.58.10 for a nonzero homogeneous relation in a finite-variable polynomial ring over the residue field. Compare exact degree-piece dimensions with injective multiplication by the relation; include eventual zero when there is one variable and handle zero variables separately. Then combine it with the inherited Hilbert–Samuel dimension theorem for the regular tangent cone.
3. **SF.0 repair.** Verify the depth/Ext characterization, associated-prime/CM localization contracts and independent maximal-depth freeness survive its needs_changes repair. Reconcile the P7 bundled-AB consumer as above.
4. **Inherited graded induction.** Preserve P7's positive-variable finite graded-module kernel/cokernel induction and corrected degreewise recurrence, including the shifted kernel polynomial and tail cutoff. A special rational-series calculation does not prove the general result.
5. **Inherited Hilbert–Samuel degree and leading coefficient.** Close the ring degree/dimension argument, Artin–Rees top-coefficient invariance, shifted comparison, finite-length case and prime-filtration support maximum. Preserve the cumulative n+1 convention, zero polynomial degree bottom and zero module support bottom.
6. **Inherited localization lengths.** Prove finiteness of the actual top-dimensional localization lengths and the finite multiplicity associativity sum, including localization of prime-filtration factors. Do not replace infinite length by zero through a natural-number conversion.
7. **Inherited formal-curve leaves.** Preserve the finite jets, ideal-power orders, quotient lengths, sharp cutoffs, homogeneous projections and multiplicative tangent-cone comparison already planned by P7. Their unchecked proof bodies remain unchecked.

These seven endpoints are separately recorded in the packet and reader with consumers. No follow-up should discard the inherited four P7 groups while closing the three new proof/supplier groups.

## Requests

- **AdicEtaleGeometry:A3:** local Koszul acyclicity iff native regularity for lists inside the maximal ideal, and the Koszul-complex isomorphism for an invertible generator change. Its existing regular-sequence finite-resolution/conormal result gives only the needed forward implication.
- **R03.1:** formal lifting across complete local surjections with arbitrary residue extension, including the regular-source square with flat vertical map and regular closed fibre of Stacks 15.40.3 (07NN). A separable relative coefficient embedding is too narrow.
- **R03.2:** Noetherianity of the native completed ring, ring completion/quotient comparison, extension of local maps to completions preserving flatness, and finite-algebra/module completion product decompositions. Native completion flatness, finite-module tensor comparison and residue-field comparison are already present and are cited instead of requested.
- **Upstream ModularCurves 4D:** reconcile the existing completion/localization/regularity contracts as imports. This is an assembly entry, not a request to plan them again.

## Verification receipts

- `python3 scripts/check_blueprint.py research/blueprint/packets/DeformationAndDerivedPatchingAlgebra--R03.3.json` passed with **0 errors, 0 warnings**.
- The same checker against the exact pinned declaration index passed with **0 errors, 0 warnings**. Every listed baseline statement and its surrounding hypotheses was read in the pinned source; the index only normalizes names.
- `lean-check research/blueprint/suggested/DeformationAndDerivedPatchingAlgebra--R03.3.lean` passed with **exit 0**, **0 errors**, **82 warnings**, all exclusively declaration proof placeholders. The shared build is Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. Memory was checked before each run; at least 100 GB was available. Checks were sequential and no language server or build/cache command was started.
- A cross-file namespace/name check matched **all 57 declarations and 13 API signatures**; all **12 test names** precede actual example statements and appear in the reader. It also checked the absence of placeholder-valued conditions, duplicate node ids and implementation claims.
- The submission's four paths passed the intake file checks; whitespace checks passed. The local graph check is not independent mathematical review and does not close transitive supplier gaps.

## Sources

Public PDFs were inspected on 10 October 2026: Stacks Commutative Algebra, More on Algebra and Divided Power Algebra; Calegari–Geraghty, *Modularity lifting beyond the Taylor–Wiles method*, section 6, Lemmas 6.1–2; Kisin, *Moduli of finite flat group schemes, and modularity*, Lemma 3.3.4, printed page 1159; Khare–Wintenberger II, section 9.1.2, Proposition 9.2(II)–(III), author pages 82–83. The packet gives exact theorem/tag/page locators, public URLs, access dates and PDF SHA-256 hashes. All statements and source-slip descriptions are in our own words; no source passage or PDF is in the repository.

Diamond's 1997 Taylor–Wiles construction paper was not inspected: the publisher download did not return a readable PDF. No conclusion depends on an unread passage of it; the abstract algebra here is sourced to the public Stacks proofs, Kisin, CG and KW. The cleared-library index was checked; no restricted book was required or copied. The scratch source texts and logs are disposable because this note and the packet retain all needed locators, hashes, work boundaries and verification receipts.

The next worker is the independent reviewer of this completed pass. Mathematical closure requires the seven inputs and the three supplier contracts above, followed by assembly reconciliation; it must not be reported as already achieved.
