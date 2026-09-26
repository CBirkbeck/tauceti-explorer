# BP-AutomorphicBundles--B5 — continuation handoff

## Current delivery

- Job: `BP-AutomorphicBundles--B5`; issue: #681.
- Scope: **only `AutomorphicBundles:B5`**. Protocol: `blueprint-v1`, part `B5`.
- Worker: ChatGPT Pro (GPT-6 Astra Pro), session `cp-20260926-b84e`.
- Claim: `/claim ChatGPT Pro — cp-20260926-b84e`, comment 5847620630; bot confirmation 5847621616 was read before work.
- Branch: `cp-20260926-b84e/automorphic-bundles-b5`.
- Status: **partial checkpoint**, not completion of B5. Use `Refs #681`, not a closing keyword.
- Continuation of the accepted checkpoint in PR #2932 by `cp-20260926-6f2c`; the nine existing node identifiers are preserved.

Authorized output files, and no other tracked files:

1. `research/blueprint/packets/AutomorphicBundles--B5.json`
2. `research/blueprint/readmes/AutomorphicBundles--B5.md`
3. `research/blueprint/suggested/AutomorphicBundles--B5.lean`
4. This handoff.

Current packet: **9 nodes**, **9 API entries**, **9 geometric tests specified in prose**, **3 planets**, **4 baseline declaration records**, **7 supplier requests**, **7 explicit gaps**, and **2 source issues awaiting independent review**. No implementation is marked checked. The suggested file retains the linear recognition lemma and its five algebraic examples, and adds **three** completion-obstruction examples. These eight examples are not the nine geometric tests.

## What changed

### Corrected the cone-comparison proof architecture

The previous packet/README inferred a map of completed sections directly from an ordinary toric open immersion. The previous suggested file already warned that this needed verification; the packet and README did not adequately reflect that warning.

The continuation gives the explicit counterexample

`k[[x,y]] -> k[y,y^-1][[x]]`

for the quadrant and a ray face. A coordinate-preserving ring map cannot exist because `1-y` is a unit in the source but not in the target. Constant coefficient in `x`, followed by evaluation at `y=1`, witnesses the latter. No topology assumption is needed for the contradiction.

The revised node now compares **images of one section from a common boundary completion**, not arbitrary sections of the two individual completions. The common formal object is identified in the source immediately before (6.2.5.22), printed p. 482. Its map to the toroidal model, its Mumford family and compatible Hodge identifications are explicit C4/early-C5 requests. The homogeneous ideal, continuous completion maps, separated coefficient projections and their compatibility are explicit C0/F0 requests. None of those geometric requests is falsely marked proved.

The positive test uses the `(xy)`-adic completion of `k[x,y]`, which genuinely maps to both individual completions. The zero-face/ray polynomial-to-Laurent test is retained only for **uncompleted** degree bookkeeping. Both cones in the actual source comparison must lie in its positive part.

The four revised supplier requests also explain why an unchanged whole-stage C5 edge is not an acyclicity proof: the early toroidal construction and later minimal compactification remain different endpoints.

### Resolved the source-rendering blocker

Rendered inspection succeeded for the critical p. 536 display. It confirms a reversed new-degree difference and mismatched stabilizer subscripts. These are recorded as `AutomorphicBundles/E6811`; the distinct missing justification of the direct-completion step is `AutomorphicBundles/E6812`. Neither has a fabricated independent review verdict.

Both findings are scoped to the **author-hosted revised thesis dated 14 March 2021**. No publisher edition was inspected. In particular the affine counterexample is used to refute the generic toric inference, not to claim a counterexample to the global Fourier–Jacobi theorem or a complete PEL realization of that affine example. The common-completion approach is labelled a proposed repair with remaining supplier proofs.

The author-hosted errata were checked, especially items 71–77. No correction of these two p. 536 issues was located there. Web searches for another primary correction were inconclusive, and the attempted `publications.html` page was unavailable. This is not a claim of historical novelty, and no author was contacted.

### Added a verified baseline and typed regression statements

Freshly read at the pinned Mathlib commit:

`Mathlib/RingTheory/PowerSeries/Inverse.lean`, lines 101–124,
`PowerSeries.isUnit_iff_constantCoeff`, under `[Ring R]`, with its proof by the multivariable theorem.

The suggested file imports that specific module, checks the declaration, and states the three algebraic regressions over actual `PowerSeries` and ring-homomorphism types. Their proof placeholders remain explicit; no compilation is claimed. No alternative formal-scheme, cone, coefficient or automorphic-form carrier was introduced.

The existing analytic trace and prime-Hecke baseline records are retained as **preceding-checkpoint** inspections, not misreported as freshly read in this continuation.

## Source and ownership ledger

Fresh continuation source work:

- Lan author revision: parsed 7.1.1–7.1.2 and their coefficient-reduction/recognition arguments; rendered printed p. 536 (PDF index 563) and pp. 539–540 (indices 566–567).
- The same revision, 6.2.5: stratum ideals and common completion; rendered printed p. 482 (index 509), pp. 483 and 485. The common object is defined before (6.2.5.22); Remark 6.2.5.30 relates the individual chart families to it. These references do not by themselves discharge the full common-chart map to the toroidal model.
- Individual-stratum interface of 6.4.1.1(5), with the relevant author errata 71–77.
- Author errata of 14 March 2021, listed 7.1.2 corrections. Source URLs, edition limits and access date are in the packet; no local PDF hash is claimed.

Repository inputs read in this continuation include WORKERS, the complete PROTOCOL, BROWSER_AGENTS, UPSTREAM_GUIDE, expansion PROTOCOL, the existing four B5 deliverables, the AutomorphicBundles atlas record, the B5 section of `AUDIT-13.result.json`, the actual ShimuraCompactifications README (including C0/C4/C5), and AdicSpacesPartII F0. The shared coverage-file read returned empty contents through the size-limited reader; it was **not** treated as an empty audit. The accepted per-job audit was used for leads instead.

Two upstream style samples were inspected: the opening/conventions of `content/tau-ceti/ModularForms/README.md` and `content/tau-ceti/AdicSpaces/README.md`. Existing geometric conventions and shared owners are preserved. No shared files, generated data or other job's packet were edited.

## Validation: separate this head from its predecessor

**This continuation:** no local repository checkout, pinned declaration-index regeneration, full blueprint validator, global cycle checker, or Lean executable was available. Repository CI is the browser-worker validation route. Any current-head CI result is to be recorded below or in the PR discussion only after actually observing it. A structural green check does not prove the common-chart construction or elaborate the suggested Lean file.

Manual mathematical checks performed:

- Reversed dual inclusion derived from the pairing definition.
- The unit/nonunit obstruction verified independently, including nonzero-ring and coordinate-preservation hypotheses.
- `(xy)`-ideal containment checked for both genuine common-source maps.
- The three new Lean statement shapes checked mathematically. `PowerSeries.isUnit_iff_constantCoeff` was read at the exact pin, but the file was not compiled.
- All nine original ids and all nine geometric-test/API names retained; only B5 is in scope. The modified cone node has matching requests for C0/C4/C5/F0 and a matching gap. Whole-stage cyclicity is explicitly unresolved.

**Historical predecessor CI only:** PR #2932's handoff recorded run 36252714955, job 108433631578, for commit `9841e96abcb02809ee7f0ba6e02761756d4d61dc`, completed 2026-09-26 15:40:37 UTC. It indexed 70,802 Tau Ceti and 246,008 Mathlib declarations, and reported four files with zero intake problems and zero blueprint errors/warnings. This is not a check of this continuation. The subsequent predecessor commit `84de950fe0edfc8985c053a66962f4a6e88bdebe` corrected the nonexistent `Mathlib.LinearAlgebra.Basic` import to `Mathlib.Algebra.Module.Submodule.Range`; that correction is preserved. The predecessor did not establish Lean compilation either.

## Exact remaining work

1. **Common-chart comparison.** In C4/early C5, produce the actual morphism from the common formal Mumford chart to the toroidal model and prove restriction to each individual chart, including family and Hodge identifications. In C0/F0, construct the homogeneous-ideal completed coefficient map and prove compatibility and descent. Then replace the conditional construction contracts in `cone-compatibility` by references to those proved leaves. Do not restore the invalid unrestricted direct map.
2. **Formal faithfulness and exactness.** Prove the component/associated-point statement for the actual coefficient reductions, especially `R/p^n`, and justify the passage from the source's component-detection condition to what those reductions require. Prove R-flatness of the actual coefficient sheaves, the left-exact section/coefficient rows, boundary-sequence exactness and qcqs filtered-colimit compatibility. The proposed work on this strand remains unfinished; it was not silently treated as closed while repairing cone comparison.
3. **Coefficient-sensitive refinement.** Read/transcribe the exact section-comparison proof of 7.1.1.4–7.1.1.5 for arbitrary M and prove the same-family and composition compatibility used by 7.1.2.9. Do not substitute degree-zero structure-sheaf pushforward alone.
4. **Geometric signatures.** Identify verified shared B3/B4/C0/C4/C5/F0 carriers and write the nine actual geometric signatures, APIs and tests. The suggested algebraic examples are useful failure tests, not satisfaction of that requirement. Compile at the pinned commits and record the actual command/output.
5. **Hecke and general coefficients.** Read the exact modular-curve, algebraic-form and abstract-Hecke supplier statements; construct pull–identify–trace, arithmetic normalization and composition, non-neat descent, Hilbert/general Levi and analytic q-expansion comparisons. The determinant-Hodge PEL strand does not replace these obligations.
6. **Ownership split.** Obtain the maintainer's accepted early/late C5 module/stage split before treating whole-stage edges as an acyclic implementation order. This job does not edit shared ownership or generated graphs.
7. **Independent source review.** Check E6811 and E6812 against their exact author-copy locators, and inspect a publisher edition before transferring either to a version-of-record claim. A reviewer should evaluate both the failure example and the scope of the proposed repair, not just the changed indices.

Opening the PR submits this claim. Do not unclaim submitted work, close #681, merge the PR or alter queue labels manually. The maintainer/intake decides integration and re-release of the remaining task.
