# REV-EffectiveDiophantineMethods — completed review

Issue: [#535](https://github.com/CBirkbeck/tauceti-explorer/issues/535). Reviewer: Codex, GPT-6, session `codex-G9Euym`, 7 October 2026. This session did not author the Claude `claude-IYaPk6` plan or Codex `codex-hjdg0j` checkpoint being reviewed. The verdict is **needs_changes**. This is a finished independent review, not a checkpoint; a revision worker should address the findings rather than repeat the review from scratch.

The durable report is [REV-EffectiveDiophantineMethods.md](../reviews/REV-EffectiveDiophantineMethods.md). It contains the 13 detailed findings, all 187 node verdicts, all 194 pinned baseline references, the 25-source access/version audit, all 24 source-issue verdicts, all 34 supplier-request checks, ownership/closure findings and the reader synchronization checklist. No scratch artifact is required to understand or resume the work.

## What is done

- Read WORKERS, both protocols, UPSTREAM_GUIDE and the full issue after the bot confirmed this session's claim. Read the full reader and suggested file; read all node fields, APIs, tests, prerequisites, stage targets and supplier interfaces.
- Read JacobianChallenge and Multiquadratic in full for upstream density, plus the actual cited EllipticCurves, AlgebraicCurves and StableReduction layers. Inspect the reviewed library audit and read all 194 baseline declarations at the pinned Mathlib and Tau Ceti commits, including generated additive names and namespace context.
- Independently reproduced 22 source-PDF hashes. Read Matveev's primary text through the web PDF extraction without verifying its byte hash. Fincke–Pohst and Silverman remained inaccessible; those claims are recorded as unverified, not adopted from the input workers' histories.
- Confirmed all 21 original source issues with independent, version-specific reasoning. Added and confirmed E22 (Siksek pairing kernels, confirmed also in the published version pp.769–770), E23 (FPS known-root sign, scoped to preprint/author copy) and E24 (published BDMTV differential index). Correction searches and exact versions are recorded in the packet. The Bruin–Stoll author implementation already takes the target quotient before its kernel; this is not an alleged implementation bug.
- Corrected the nonzero isolating-polynomial requirement, exact-zero Hensel branches, nonnegative exclusion boxes, prime/nonzero discrete-log pivots and all-zero coset branch, successive-root compositum bound, nonempty torsion minima, completed-field logarithm extension, zero-coefficient Strassmann convention, unsupported Hodge pole bound, root precision hypotheses and wrong source-issue attribution.
- Removed the false abstract `abelianIntegral_eq_primitive` signature under PROTOCOL §13, with the precise “Geometric tiny-integral signature” gap and a comment explaining the missing actual geometric/analytic interface. No substitute proposition asserting its conclusion was added.
- Recorded nine additional gaps. Preserved all 187 node IDs, unchecked implementation statuses, seven planned stages and exact existing supplier requests. Recorded the upstream canonical-height convention mismatch in `upstreamNotes`, without editing upstream.
- Added the top-level independent review: **115 verified, 12 corrected, 60 unverifiable, zero added**. “Verified” is a mathematical/conditional outline verdict, not a formal implementation or discharge of suppliers.

## Where the revision should start

1. F1–F4: identify the real CN approximation, prime/completion valuation and descent carriers; implement raw finite checkers and actual finite producers; replace scalar exponent chains with the advertised componentwise boxes. The zero-log deletion and analytic constant validity predicates already exist—do not treat them as missing.
2. F5–F8: use the actual curve/Jacobian geometry for pullbacks and tiny integrals, enforce rank/genus conditions, construct finite-index rank inputs and nonzero annihilators, and restrict sieve verification to the finite chain length. Pass to the free Mordell–Weil quotient and include finite torsion fibres in height searches.
3. F9–F10: consolidate routine ED.5 lemma nodes into API without breaking foreign references; close or retain explicit Kummer, finite Jacobian presentation and effective height gaps. The deep map is translation to Pic^1, not an inverse of the curve embedding.
4. F11–F13: supply the admissible quadratic-field/Gross–Zagier/Kolyvagin passage back to Q, certified analytic derivatives, Hodge product/truncation bounds, C_p root clusters/multiplicity and genuine QC/Frobenius certificate data. The X_s(13) polynomial identity is correct, and its E1 vector is already a p-adic logarithm; the problem is the missing actual certified computations and carrier identifications.
5. Synchronize the reader using the report's seven-item checklist. The review issue did not authorize editing that reader, so it remains unchanged and currently has stronger completion claims than the reviewed packet supports.
6. Reconcile the combined stage projection's cycle before applying the stage-edge proposals. The report gives an explicit cycle and its provenance. The packet's own node DAG is acyclic; the stage-projection cycle is not a finding that every individual theorem dependency is cyclic.

## Validation

The full revised suggested file was checked with `lean-check research/blueprint/suggested/EffectiveDiophantineMethods.lean`: **exit 0, zero errors, 710 warnings, all declaration uses sorry**. Memory was checked first (99 GB available). No language server, library build, update or cache download was started. Nothing is claimed implemented or proved.

`python3 scripts/check_blueprint.py research/blueprint/packets/EffectiveDiophantineMethods.json` reports **zero errors**. Its one warning claims `Finset.mem_filter` is indexed as `Finset.Finset.mem_filter`; the actual pinned source has the correct `Finset.mem_filter`, so this is an index false positive. Do not rename the valid reference to satisfy that warning.

The final inventory is 187 nodes, 358 API entries, 247 tests, 40 planets, 194 baseline declarations, 34 requests, 21 gaps and 24 confirmed source issues. All seven stages remain planned. JSON, audit completeness, allowed-path and whitespace checks precede submission. The review changes only the packet, suggested file, review report and this handoff. Scratch source downloads and logs are removed once the pull request is open, as WORKERS requires.
