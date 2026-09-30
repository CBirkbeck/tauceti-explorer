# FIX-RT-LINK-tauceti_TauCetiRoadmap_OneParameterSemigroups

Codex · `codex-5ebb6f` · issue #5037 · 2026-09-30 · complete.

## Finding /1 — fixed

Added the omitted overlap between OneParameterSemigroups Part C and
OptimalTransport `#13a-static-entropic-transport`, with recommendation
`rescope`. The evidence quotes Part C's kernel/Kolmogorov exports and
OT13A item 4's continuous-kernel, universality and measure-separation
request at their actual document lines. Updated the OptimalTransport
`examined` entry to include that consumer, and updated the summary from
four to five overlap records. The three directed links are unchanged.

The overlap names the reusable arbitrary-index positivity interface,
finite-family quadratic forms and scalar real/complex Hilbert realization.
It keeps continuous-kernel packaging, density of sections in `C(X)`,
signed-Radon-measure energy and separation, and Sinkhorn theory with OT13A.
It requires no monoid on the compact space and introduces no blanket
Bochner/BCR dependency. Existing Mathlib `RKHS.OfKernel` remains the
completion substrate rather than a second construction target.

The retained non-example makes the boundary explicit. On the discrete
two-point compact space `{a,b}`, the constant kernel `K=1` has quadratic
form `|∑ c_i|² ≥ 0` and is continuous and pointwise strictly positive. Its
kernel sections span only the constant functions, so they are not dense
in `C(X)`. The signed measure `δ_a−δ_b` has total mass zero and kernel
energy zero despite being nonzero. Dense feature span in the kernel's own
Kolmogorov Hilbert space does not remove this counterexample.

This fixes an interface omission. No new mathematical node or roadmap is
needed: the generic root exists, and OT13A already names the additional
consumer obligations. A future directed dependency must specify the
particular consumed contract and pass the normal graph checks. The
upstream README is not changed by this link-map job.

## Evidence rechecked

Read the finding and confirmed verdict; the target hash before editing
was `d948a78f97a63bdc35786f237e0ecf76d3b25645d5622bb27b23ac7f537e69dd`.
Read focal Part C lines 198–249, OT13A item 4 lines 1463–1498, the reviewed
AUDIT-06 Part C entry in `data/library-coverage.json`, and the target's
overlaps, summary, directed endpoint pairs, provenance, review and affected
examined record. Base revision:
`182ee99ce9221908991b1df82141a96a671c7296`.

Freshly read the following pinned declaration statements and their
parameters, then added their signatures and public source links to
`verifiedLibrary`:

| Library | Declaration and locator | Contract |
| --- | --- | --- |
| [Mathlib 082e2d3](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Matrix/PosDef.lean#L59) | `Matrix.PosSemidef`, line 59 | Arbitrary-index Hermitian kernel; nonnegative quadratic forms for finitely supported coefficients. |
| [Tau Ceti f790474](https://github.com/CBirkbeck/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/LinearAlgebra/Matrix/PosSemidef.lean#L119) | `TauCeti.posSemidef_iff_finite_sum`, line 119 | Equivalence with conjugate symmetry and positivity for all finite families, without a monoid or topology on the index. |
| [Tau Ceti scalar bridge](https://github.com/CBirkbeck/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Analysis/PositiveDefinite/Kernel/Kolmogorov.lean#L126) | `Matrix.PosSemidef.KolmogorovSpace`, `kolmogorovFeature`, `inner_kolmogorovFeature`, `kolmogorovFeature_dense`; lines 126, 133, 142, 171 | For `RCLike` scalars, construct the Hilbert realization, recover the kernel as the inner product, and prove dense feature span in that Hilbert space. No `C(X)` universality is asserted. |

Also reopened the public [Feydy et al. paper](https://proceedings.mlr.press/v89/feydy19a/feydy19a.pdf),
PDF pp. 2–3, on 2026-09-30. Its universality condition concerns density of
kernel sections in continuous functions; Theorem 1 assumes a positive
universal Gibbs kernel on a compact metric space. This distinguishes the
consumer's stronger input from generic PSD/minimality. No certification of
the full paper or supplementary proofs is claimed.

Original author provenance and independent-review verdict remain historical
records. The added `fixes` metadata names this job, finding, worker, input
revision and input hash. Unrelated overlaps and existing declaration
records retain their previous contents.

## Validation

- `python3 scripts/check_links.py research/blueprint/links/tauceti_TauCetiRoadmap_OneParameterSemigroups.json`: zero errors and warnings.
- `python3 research/blueprint/intake.py check-files` on the two authorized deliverables: zero problems.
- Parsed JSON; checked the three new quotes against their exact raw source substrings and line locators, and all six declaration line numbers against the pinned files.
- Compared the original three directed links, four overlaps, provenance and review against the input; only the new overlap, affected examined note, summary, new library records and fix metadata change.
- `git diff --check`.

No Lean compiled. This job supplies no Lean file and creates no project,
dependency cache, library build or generated-atlas mutation.
