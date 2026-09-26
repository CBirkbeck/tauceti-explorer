# Handoff: BP-WeilConjectures--WC.0

Issue #1005. Agent: ChatGPT Pro. Session: `cp-20260926-6f2c`.
Date: 26 September 2026. Claim **5848546144**, bot **5848547277**;
confirmation was reread before submission.

## Status: actual partial packet, not a handoff-only repair

This submission creates the four authorized files. No WC.0-part packet existed at claim time. The integrated `data/decompositions/WeilConjectures.json` was read as an input: its existing WC.1/WC.2/WC.3/WC.6 node IDs and source work are not overwritten or re-certified here. It had no finite-spectrum-child nodes to preserve.

The packet’s scope is the issue’s eight exact stage IDs: WC.0–WC.5, WC.5:power-sum-converse, and WC.5:surface-alternative. All twelve new nodes belong to the independent finite-spectrum child. The other seven stages are explicitly not source-decomposed by this checkpoint. Packet status remains `partial`.

Files:

- `research/blueprint/packets/WeilConjectures--WC.0.json`
- `research/blueprint/readmes/WeilConjectures--WC.0.md`
- `research/blueprint/suggested/WeilConjectures--WC.0.lean`
- `research/blueprint/handoff/BP-WeilConjectures--WC.0.md`

## Mathematical work supplied

**12 nodes: 4 lemmas and 8 theorems; 5 planets; 8 pinned baseline declarations.** There are **no new definitions**, so no new definition API or definition-unit-test items. Existing finite functions, sums, matrices and polynomials are used directly. The suggested file has **12 typed theorem signatures and 15 acceptance examples**. These are distinct from compiled tests; every proof is admitted and implementation status remains unchecked.

The core proof recovers c_k β_k^n from d consecutive moments using the pinned Vandermonde matrix and its inverse. It keeps Mathlib’s row-root/column-exponent orientation. Norms yield a fixed bound on (‖β_k‖/R)^n; unbounded real powers prove the converse. The zero-radius case uses a positive window and never divides by R.

The general theorem works over any normed field, without completeness or characteristic zero, provided distinct roots have the specified nonzero weights. Repeated roots are grouped by their total coefficient. The unweighted corollary requires characteristic zero, so multiplicities do not vanish. Eventual bounds starting at an arbitrary N are sufficient. A single moment or an arbitrary finite initial segment is not sufficient.

The same argument proves the norm-form negative-power obstruction routed here as **PAPER-YU-23/120**. It proves a statement stronger than the source’s integral-weight version; that generalization and the alternative matrix proof are explicitly attributed to this worker, not falsely quoted from Yu’s elimination argument.

The remaining nodes give the positive-index generating series as a specified convergent sum, its common polynomial numerator and constant-one denominator, the exact cancellation criterion at a reciprocal root, exclusion of poles in the claimed open disc, and equality of root norms under a supplied reciprocal pairing. No purity theorem or RH-derived geometric point-count result is an input.

## Ownership and baseline

The accepted RS-17 proposal and its review were read, together with the roadmap and stage descriptions. The independent child is allowed to feed the surface argument; it must not import DWP.1/DWP.4 or the RH-based parent WC.5 estimate. All new node prerequisites are internal to this packet or baseline references. There are no new cross-roadmap requests. That does not mean that the seven untouched geometric stages have their supplier obligations discharged.

The underlying AUDIT-19 result and accepted `REV-AUDIT-19.md` were checked. They mark this finite-spectrum content as missing and preserve WC.0’s mathematical point-finiteness targets. The eight cited baseline statements and their surrounding hypotheses were read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`:

- Matrix.vandermonde;
- Matrix.det_vandermonde_ne_zero_iff;
- Matrix.eq_zero_of_forall_pow_sum_mul_pow_eq_zero;
- Matrix.mul_nonsing_inv;
- norm_sum_le;
- pow_unbounded_of_one_lt;
- hasSum_geometric_of_norm_lt_one;
- hasSum_sum, as the generated additive declaration of hasProd_prod.

Tau Ceti’s recorded pin is `f790474821cf4256814db967cb154e7af3d0c369`. The reviewed audit and a fresh Tau Ceti power-sum search were used to avoid claiming that its symmetric-polynomial API already proves a norm bound for traces. No new Tau Ceti baseline declaration is asserted by name.

## Sources read, not read, and rendering

**Milne**, Lectures on Étale Cohomology, version 2.21, 22 March 2013: §27, Lemma 27.5 and its proof, printed pp. 155–156. Both pages were checked visually. Only the trace/power-sum and scalar-series passages are used here; the whole course and its geometric theorems are not claimed read or decomposed.

**Yu**, arXiv:1807.04659v5, 18 July 2022: Appendix C, the unnumbered lemma and proof on printed p. 81 and its immediate application. The text layer was read. Repeated attempts to render that page failed, so it is **not** counted as a new visual check. The statement exported here uses explicit norm conditions and nonzero roots rather than relying on potentially lost overbars in the extraction. It has a complete independent argument. The journal version was not collated, and no new source error is alleged. No local PDF bytes were available, so no SHA-256 is fabricated.

The private WC snapshot, complete Deligne references and the other stages’ source proofs have not been audited by this checkpoint. Their exact work is in coverage.

## Checks actually run before submission

A local Python check validated JSON parsing, exact eight-stage scope, unique node IDs, all internal/baseline prerequisite endpoints, acyclicity of the twelve-node graph, implementation status, source excerpt lengths, absence of prohibited private paths and proof placeholders in the packet, presence of all twelve declaration names in the suggested file, and the fifteen acceptance-example markers. These are focused checks, **not an execution of the full repository validator**.

Exact symbolic/rational regression checks passed:

- **1,260** inverse-Vandermonde recovery identities, including zero roots, reordered roots, unequal weights and rational roots;
- **1,260** quantitative moment-window inequalities;
- **9** rational numerator/denominator identities and **72** series coefficients;
- **7** pole-cancellation tests, including a zero coefficient and a zero root;
- a scaled-fourth-roots cancellation pattern and a wrong-transpose countercheck;
- **24** characteristic-p multiplicity-cancellation tests with a nonzero root;
- **16** p-adic negative-power escape tests for p=2,3,5,7, with cancellation and several prescribed starting indices.

An initial test-harness issue with the empty product being a Python integer was corrected to a symbolic integer; the complete suite was rerun successfully. No floating-point experiment is used to establish a theorem. The mathematical proofs are in the packet and document; the finite tests are regression evidence only.

**Not run locally:** the full repository blueprint/declaration-index validators, a combined cross-packet/stage cycle check, or Lean. CI checks must be reported separately when available. **The suggested file is uncompiled.** It has no opaque proposition fields or fabricated scheme/cohomology types; nevertheless import and elaboration errors remain possible until it is compiled at the pins.

## What remains and where to resume

1. Complete the formal **PowerSeries-to-RatFunc comparison** using the same N and D with D(0)=1. This packet proves the analytic HasSum and polynomial identities, but does not yet give that formal carrier-level equality. It is a recorded gap, not silently inferred from notation.
2. Compile the twelve signatures and fifteen examples at the pins, and run the official validators and a combined graph check. Do not equate a passing JSON checker with a Lean proof or source closure.
3. Continue WC.0’s actual geometric point-set and source reconciliation work; refine and preserve the integrated WC.1/WC.2/WC.3 nodes. Handle WC.4’s supplied-family comparison and WC.5’s higher-dimensional counts within RS-17’s residual scope.
4. For the surface route read the SF.5 source proofs and derive the full all-extension intersection estimate before applying the new converse and the WC.2 pairing. Do not shortcut through the RH-based estimate.

The packet has two gap records: the specific formal generating-series comparison, and the still-undecomposed seven-stage scope, with precise per-stage coverage notes. Nothing in this checkpoint upgrades the whole part to mathematically closed.
