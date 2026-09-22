# PAPER-CHARLES-16 continuation handoff

Codex, session `codex-c83e7a`, 22 September 2026. Refs #1188. Continues merged PR #1669. Status partial; three allowed deliverables, no Lean implementation.

The original worker's 142 IDs and source provenance are preserved. This worker independently read all forty published pages 487–526. The result now contains 153 items (11 library, 14 planned, 128 missing), with 125 missing routed once and /113,/119,/127 still explicitly unrouted. /50 was routed after the G1 continuation by cc-fb70e5. All 44 definitions/constructions have 132 structured API contracts, 132 proposed tests and named consumers. New/expanded lattice dependencies have 31 acyclic edges; this is not a complete dependency decomposition of every inherited theorem.

The lattice interface correction is concrete. The printed Proposition 2.9 requires an initial primitive embedding: the nonprimitive sublattice with Gram diag(8,8) inside <2>⊕U cannot embed primitively there, as reduction modulo 2 proves. Item 38 now states the corrected hypothesis. Item 37 distinguishes genus existence from marked embedding and unmarked sublattice orbits. Item 41 explicitly chooses v=e+f,w=kh+e,l=2w−v in <2d>⊕U; the retraction (x,y,z)↦(z,y−z) proves primitivity and l²=2(4dk²−1) is prime to odd n when n divides k. This suffices for the actual Zarhin consumer. Saturation is not a repair for the literal broader statement.

Original Nikulin text 1.4–1.6,1.13.4,1.14.2 and 1.15.1–5 was read through the publisher web PDF, including the full 1.15.1 proof. Direct PDF download returned 403 and screenshots failed; several OCR formulas remain damaged. No full-paper read or local PDF hash is claimed. Finish deeper genus/strong-approximation/local-classification source decomposition and image checks. The existing Tau Ceti overlattice order equivalence, H-perp/H discriminant isometry and rank-one discriminant formulas are now exact pinned imports.

Resume the remaining proof gates in the previous order:

1. G1 /50: acquire Saint-Donat/Huybrechts and prove the all-characteristic birational linear-series argument with correct numerical powers and the nonreduced-curve separation step. Do not infer birationality from the reduced support alone.
2. G2/G3 /113,/119: supply the literal rational square-class argument or compose LMS 3.5.2's split-prime replacement, quadratic extension, extra congruences and Tate descent. Preserve its stated p≥5 scope until the p=2,3 proof is audited. The pinned auxiliary-prime theorem does not give complete splitting.
3. G4 /127: construct the simultaneous twisted-moduli/H_n deformation with generic Picard rank one and verify nonsuperspecial applicability without assuming Tate.
4. G5: finish the deeper Nikulin sources and clean formula acquisition. The initial primitive-input problem and explicit consumer construction are now resolved; retain the counterexample and corrected scope.
5. G6: acquire/decompose the remaining original prerequisites in the register, especially Fontaine–Messing integral ranges, Mukai/Yoshioka, IHS Torelli, integral KS models and special endomorphisms with the Charles 2013 erratum.

Retain the prior rational Corollary 2.8 multiplier, unpolarized Proposition 3.17 endpoint, separately defined integral twisted span, LMS gerbe sign, determinant trivialization and exact geometric Brauer order. Published Charles numbering is authoritative. Existing LMS/Charles 2013 reads remain attributed to the previous worker; this continuation does not claim to have reread them completely.

Refresh owners before continuing. GN.2/GN.3 own the new lattice interfaces; completed IntegralLattices supplies gluing. MC.7 needs early Lefschetz-(1,1) versus late K3 Tate leaves to avoid a cycle. No new roadmap or change to the prior nine-route architecture was needed.

Validation passed: paper checker, intake on all three named files, counts and preserved IDs, API/tests, four unrouted gates, fresh ownership/concurrency, source hashes and finite lattice/CRT diagnostics. Re-run these after further edits. No Lean compilation or proof-completeness claim follows from those checks.

Continuation log: Claude Code, cc-fb70e5, 22 September 2026. G1 is resolved: item 50 has a complete proof with N=128r+2 and d=256r, and is routed to K3SurfacesAndSymplecticBoundedness. The remaining unrouted items are /113, /119 and /127.
