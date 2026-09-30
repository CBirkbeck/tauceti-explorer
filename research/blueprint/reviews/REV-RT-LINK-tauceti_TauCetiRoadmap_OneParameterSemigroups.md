# Independent verification of the OneParameterSemigroups link-map finding

Codex — codex-5ebb6f · 2026-09-30 · complete · Refs #4365

**One finding confirmed; none rejected.** Record the missing Part C/OptimalTransport 13A kernel interface as an overlap with a precise reuse boundary. The generic positivity and scalar Hilbert-space construction are existing inputs. Compact-space continuity, universality, signed-measure separation and Sinkhorn conclusions remain with OT13A. No directed dependency or roadmap expansion is required by this finding.

## Independence and input

I authored none of the target link map, its review or this red-team result. Their sessions are respectively `cgp-14f035649b9f`, `codex-7e92bd` and `codex-rtOQ9t`, distinct from `codex-5ebb6f`.

Reviewed at explorer commit `561b3632a57c7768d7a0c5ca95403ff068c3393a`:

- `research/blueprint/redteam/RT-LINK-tauceti_TauCetiRoadmap_OneParameterSemigroups.result.json` and its report, read in full.
- The accepted link map's provenance, links, overlaps, remaining-work list and OptimalTransport examined entry, together with its original independent review.
- The focal Part C contract, the consumer OT13A item 4 and both live atlas endpoint records.
- The reviewed `AUDIT-06` Part C target and duplicate records in `data/library-coverage.json`.

The accepted map still has SHA-256 `d948a78f97a63bdc35786f237e0ecf76d3b25645d5622bb27b23ac7f537e69dd`, matching the attacked snapshot. Its three links and four overlaps do not record the OT13A interface. Its OptimalTransport examined entry names Layers 10, 11 and 14. A fresh structured scan of every sibling link map's `links` and `overlaps` found no pair between Part C and OT13A or its parent Layer 13. Both endpoint stage IDs exist. I did not repeat the red team's entire catalogue search or certify unrelated semigroup declarations; the verification concerns its sole finding.

## Finding 1: confirmed

Part C explicitly exports the PD-function/kernel equivalence, pullbacks and GNS/Kolmogorov decomposition ([README, lines 216–217](https://github.com/CBirkbeck/tauceti-explorer/blob/561b3632a57c7768d7a0c5ca95403ff068c3393a/content/tau-ceti/OneParameterSemigroups/README.md#L216)). OT13A item 4 asks first for continuous positive-definite and universal-kernel predicates on compact spaces, with kernel sections dense in `C(X)`, and signed-Radon-measure energy/separation lemmas ([README, line 1486](https://github.com/CBirkbeck/tauceti-explorer/blob/561b3632a57c7768d7a0c5ca95403ff068c3393a/content/tau-ceti/OptimalTransport/README.md#L1486)). The reviewed audit explicitly names that overlap. The omitted record is thus supported by matched contracts, beyond shared terminology.

The pinned declarations were independently opened with their surrounding parameters:

| Declaration | Statement read and implication |
| --- | --- |
| [Mathlib `Matrix.PosSemidef`, line 59](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Matrix/PosDef.lean#L59) | Hermitian kernel on any index type, with nonnegative finitely supported quadratic forms. No finite-index or monoid assumption. |
| [Tau Ceti `posSemidef_iff_finite_sum`, line 119](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/LinearAlgebra/Matrix/PosSemidef.lean#L119) | Equivalent characterization by Hermitian symmetry and finite families, including repeated indices. Read the arbitrary-index matrix interface and its constant/rank-one constructions. |
| [Tau Ceti scalar/operator bridge, line 79](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Analysis/PositiveDefinite/Kernel/Kolmogorov.lean#L79) | Converts scalar PSD kernels over `RCLike` to operator-valued PSD kernels. |
| [Tau Ceti `KolmogorovSpace`, line 126](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Analysis/PositiveDefinite/Kernel/Kolmogorov.lean#L126) | Uses Mathlib's existing `RKHS.OfKernel`, after the scalar/operator bridge. Read this file in full. |
| [Feature map and inner-product identity, lines 133 and 142](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Analysis/PositiveDefinite/Kernel/Kolmogorov.lean#L133) | Canonical vectors have inner products equal to the original scalar kernel. |
| [Dense feature span, line 171](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Analysis/PositiveDefinite/Kernel/Kolmogorov.lean#L171) | Density is in the constructed Hilbert space. It does not quantify over all of `C(X)`. |
| [Mathlib `RKHS.OfKernel`, line 312](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/InnerProductSpace/Reproducing.lean#L312) | Completion of the existing pre-Hilbert construction. Also read `kerFun_dense` at line 189 and the bounded-evaluation uniform-convergence statements preceding it; none gives universality for an arbitrary PSD kernel. |

This establishes the common algebraic positivity root and its scalar realization, without forcing an involutive-monoid structure on an arbitrary compact kernel index. Part C's monoid-function specialization is not the only usable existing API.

The residual boundary is substantive. On the compact discrete two-point space `{a,b}`, take `k(x,y)=1`. Its quadratic form is `|Σ c_i|²`, so it is PSD and continuous. Its kernel sections span only constants, which cannot uniformly approximate a function taking different values at `a` and `b`. The nonzero signed Radon measure `δ_a−δ_b` has zero kernel energy. Dense span in the constructed one-dimensional Hilbert space therefore supplies neither universality in `C(X)` nor separation of signed measures.

The published primary source agrees with that distinction: [Feydy et al., PMLR 89 (2019), PDF pp.2–3](https://proceedings.mlr.press/v89/feydy19a/feydy19a.pdf), read 2026-09-30, defines universality using density in `C(X)` and assumes a positive universal Gibbs kernel in Theorem 1. I read those passages to verify this hypothesis boundary; I did not audit all proofs or supplementary results, and allege no source error.

The proposed fix is correct within those limits: add an evidence-backed overlap and update the examined entry, reuse the existing arbitrary-index positivity/finite-family and scalar Kolmogorov interfaces where consumed, and leave the continuous-kernel packaging, universality, signed-measure energy/separation and Sinkhorn results in OT13A. Retain the constant-kernel non-example. Do not add a blanket Bochner/BCR edge, replace the generic positivity or RKHS carrier, or expand the upstream roadmap. Any later directed dependency needs its own narrow consumed contract and graph check.

## Validation

`check_links.py` on the unchanged accepted map reports zero errors and warnings. The verification JSON passes `check_redteam.py`; the two authorized deliverables pass intake `check-files` and staged whitespace checks. No source map, roadmap, library or generated atlas data was edited. No Lean compiled: no existing compiled environment at the pins was available, and no new build was created.
