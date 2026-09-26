# Handoff: BP-AutomorphicBundles--B5

Issue: #681. Agent: ChatGPT Pro. Session: `cp-20260926-6f2c`.
Date: 26 September 2026.

Claim comment: 5847372912. Bot confirmation: 5847373880. The issue was claimed only after the preceding #987 checkpoint had a PR and after rechecking the higher-priority queue.

## Status: partial blueprint checkpoint

This is the first packet for B5. No existing B5 packet was overwritten. The integrated AutomorphicBundles decomposition was read and had no B5 nodes to preserve. The submission writes only the four issue-authorized paths:

- `research/blueprint/packets/AutomorphicBundles--B5.json`
- `research/blueprint/readmes/AutomorphicBundles--B5.md`
- `research/blueprint/suggested/AutomorphicBundles--B5.lean`
- this handoff.

The packet contains **nine nodes, three construction/definition API outlines with nine unit tests, seven supplier requests and seven gaps**. The scope is only `AutomorphicBundles:B5`. All implementation statuses are unchecked, coverage is partial, and no source error is asserted.

**Do not mark B5 complete.** The main progress is a source-level decomposition of its determinant-Hodge, good-prime PEL Fourier-Jacobi strand. The general Hecke action and several mathematical proof leaves remain open. The suggested file is explicitly incomplete: it contains baseline-name checks, a typed linear diagram-chase lemma and algebraic regression patterns, NOT the full geometric signatures and unit tests. This is an outstanding deliverable, not a claim that comments are elaborated declarations.

## Work performed

Read WORKERS, the blueprint protocol, browser instructions, upstream guide and expansion protocol. Read the AutomorphicBundles atlas, actual campaign README and integrated decomposition. Inspected the B5 library audit and its reviewed correction leads; then read actual pinned code rather than relying on those leads alone.

Pinned definitions/proof read:

- Mathlib `082e2d3`, `Mathlib/NumberTheory/ModularForms/NormTrace.lean`, including `ModularForm.trace`, `CuspForm.trace`, quotient representatives and the unnormalized finite sums.
- Tau Ceti `f790474`, `TauCeti/NumberTheory/ModularForms/HeckeSlash/Nebentypus/Prime/Basic.lean`, including the statement and proof of `HeckeRing.GL2.twistedHeckeSlashSum_diagCosetGamma0_of_prime`. It assumes positive level, a prime coprime to the level, and actual nebentypus membership. No composite-index theorem was inferred from it.

Read actual owner texts: upstream ModularForms; campaign ModularCurvesPartII, AutomorphicBundles, ShimuraCompactifications, AdicSpacesPartII and SchemeAndStackFoundations. The preceding issue also involved detailed reads of upstream StableReduction and JacobianChallenge. Ownership and mathematical inputs are separate: an owner is not an implementation claim.

Read Lan's author-hosted revised book §§7.1.1–7.1.2 as parsed full text, including the module-reduction proof, local expansion construction, cone comparison, full stabilizer invariance, constant term and exact-row proof of coefficient recognition. Read the relevant published errata items 75–77. Inspected the later use of the constant-term theorem in the minimal boundary factorization. Lan's introduction §4.2.7 was used only as an overview; its rendered p. 50 was inspected. Additional source reconnaissance is not counted as proof coverage of unread dependencies.

## Decisions the next worker should preserve

1. **Actual coefficients, not scalar sequences.** The coefficient module is defined using sections on the abelian torsor with the character sheaf and boundary Hodge line. A pushforward expression on the lower-dimensional moduli stack still needs its projection/base-change proof. Do not assume it for arbitrary M.
2. **Products and completion are different assertions.** The target permits infinite families. No isomorphism between an unrestricted product and a completed graded algebra, and no realization of every family by a global form, is claimed.
3. **Correct cone direction.** A face inclusion reverses dual-cone inclusion. Restriction inserts zero in newly allowed degrees. The parsed source display needs visual checking, so an apparent display error has not been filed as a source issue.
4. **Full stabilizer invariance matters.** A single cone stabilizer is not the whole cusp stabilizer. Descent of the constant term uses the actual finite-cover quotient. Do not average by a group order that may be zero in the coefficient ring.
5. **Components and torsion coefficients matter.** Coefficient recognition uses injectivity for M/M1. Test the disjoint union of two curves and the coefficients R/p^2, not only a smooth connected complex example.
6. **C5 needs an early/late interface.** Only its early toroidal model and formal charts are inputs here. The later minimal construction consumes the B5 constant-term theorem. This split is recorded as a gap, not silently applied to shared roadmap files.
7. **Keep scope honest.** Naive determinant-Hodge powers are not all arithmetic or Levi-valued weights. The packet is not an all-prime Hilbert or full non-neat Hecke construction.

## Remaining mathematical work, in order

### A. Verify the source transcription and close the early interfaces

Obtain a rendered copy of the revised-book pages 534–540. Screenshot requests for the main PDF repeatedly failed during this session; the parsed text was available. Read the exact proofs behind C0's fan-incidence/support and completed-graded-algebra facts and C4/C5's formal-chart theorem, not just the references in §7.1.2.

Resolve the C5 toroidal/minimal module split with its owner before promoting any whole-stage dependency. B3's section comparison is also needed before minimal compactification: import only its toroidal/refinement portion, not any late theorem that would depend back on the expansion principle.

### B. Formal faithfulness and exactness

Prove the coefficient-reduction argument for the actual smooth proper good-prime model. A projective coefficient module may be reduced by a direct-summand argument; do not declare it free. Verify component detection after base change, and the associated-component input over R/p^n. A statement that a reduced fiber meets a cusp is not by itself the nonreduced coefficient proof.

Verify R-flatness before using left exactness of coefficient sheaves. Do not infer tensor exactness merely from the left exactness of global sections. Do not commute infinite coefficient products with filtered colimits without a theorem. Prove the boundary exact sequence with the chosen M and the joint detection of its restriction by the boundary charts.

### C. Complete the suggested file

Identify verified carriers for B3/B4 coefficients and section modules, C0/C4/C5 cusp data and graded coefficients, and F0 completions. Replace the explicit signature omissions by genuine definitions, API lemma signatures, and the nine geometric tests stated in the packet. Keep the elementary diagram chase as a proof aid only; it does not construct the geometric exact rows or injectivity. Compile against the exact pinned versions when the environment is available.

### D. Continue the rest of B5

Read the exact modular-curve correspondence and q-expansion owners (R14/R15), abstract Hecke action suppliers and general pull-identify-trace source. Construct the geometric action and prove comparison with the existing unnormalized trace and arithmetic slash normalization. Include the characteristic-p/non-neat descent checks, all scalar factors, and the full Hecke composition law. Then extend beyond the determinant-Hodge PEL strand to the required general Levi, Hilbert and ramified examples and the p-adic comparison normalization.

## Validation record

- Both baseline hashes have the required 40-hex form.
- The exact pinned source statements listed above were read.
- The main packet and companion document were manually checked for consistent scope, names, nine nodes, no closed-stage claims and explicit mathematical gaps.
- **No local full repository validator, declaration-index check, global dependency-cycle check, test suite or Lean compilation was run.** The environment did not provide a usable local repository/pinned Lean checkout.
- `scripts/check_blueprint.py` was read to inspect the structural contract; reading it is not running it.
- Required repository command: `python3 scripts/check_blueprint.py research/blueprint/packets/AutomorphicBundles--B5.json`, together with the pinned index and dependency checks. CI results must be recorded separately from the checks above. A structural pass does not close the source-proof or suggested-file gaps.
- Source URLs, editions and access date are in the packet. No local downloaded byte copy or source SHA-256 is claimed. Main-book rendering limits are recorded there as well.

## Resumption

Start with A and B, then C, before treating the Fourier-Jacobi strand as source-decomposed. Preserve the nine node IDs and this document's distinctions. The PR is a checkpoint using `Refs #681`, not an issue-closing submission.
