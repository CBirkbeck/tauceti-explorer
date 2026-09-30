# Red team: One-Parameter Semigroups link map

Codex, session `codex-rtOQ9t`, 2026-09-30; issue #4366. The target author
`cgp-14f035649b9f` and reviewer `codex-7e92bd` are independent of this worker.
Snapshot: `92e9f1a7b9727f6ad1f75232df3c184705b114a8`; fingerprints are in the
companion result.

**One medium finding:** the accepted map omits the positive-definite-kernel
interface between Part C and Optimal Transport 13A. The existing three
directed links and four overlaps remain supported. This report proposes a
scoped overlap, not a new implementation or a merger.

## Finding 1: the OT13A kernel interface is missing

Supplier: `tauceti:TauCetiRoadmap/OneParameterSemigroups#part-c--positive-definite-functions-and-bochners-theorem`.
Consumer: `tauceti:TauCetiRoadmap/OptimalTransport#13a-static-entropic-transport`.

Part C's README, lines 216–217, exports the PD-function/kernel equivalence and
GNS/Kolmogorov decomposition. OT13A item 4, lines 1486–1488, says:

> first build continuous positive-definite and universal-kernel predicates on compact
> spaces, with universality expressed by density of kernel sections in `C(X)`, and the
> signed-Radon-measure energy/separation lemmas used below.

The reviewed `AUDIT-06` record in `data/library-coverage.json`, under Part C's
`duplicates`, explicitly identifies this pair. The map has no such overlap:
its OT examined entry names Layers 10, 11 and 14, and the independent review's
additional close read is 13C, not 13A. A search of all sibling research link
maps found no record of Part C paired with 13A or its parent Layer 13. The
consumer text is byte-identical to the original review's recorded input, so
this is not merely a newly added consumer after that review.

The following actual statements establish the existing reusable root:

* [Mathlib `Matrix.PosSemidef`, line 59](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Matrix/PosDef.lean#L59)
  accepts any index type. It tests Hermitian symmetry and finitely supported
  quadratic forms. It does not require a finite space or a monoid.
* [Tau Ceti's matrix interface](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/LinearAlgebra/Matrix/PosSemidef.lean)
  supplies `posSemidef_iff_finite_sum`, constant and rank-one kernels and Schur
  operations. The file explicitly identifies these as Part C prerequisites.
* [The scalar Kolmogorov construction](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Analysis/PositiveDefinite/Kernel/Kolmogorov.lean)
  works over `RCLike`, with arbitrary index type. Read the scalar/operator
  bridge, `KolmogorovSpace`, `kolmogorovFeature`, `inner_kolmogorovFeature`
  and `kolmogorovFeature_dense`. Its completion is Mathlib's `RKHS.OfKernel`,
  whose declaration was also read at the pin. It is not a second RKHS root.

This establishes reuse of the generic kernel layer, **not universality**.
The feature vectors span the constructed Hilbert space densely by construction;
that does not make the kernel sections dense in `C(X)` with its uniform norm.
For example, on a discrete two-point compact space, `k(x,y)=1` is continuous
and PSD: its quadratic form is `|Σc_i|²`. Its sections span only constants,
and the signed measure `δ_a−δ_b` has zero kernel energy although it is nonzero.
Thus continuity plus PSD does not provide the consumer's separation theorem.

The source supports this boundary: [Feydy et al., Theorem 1](https://proceedings.mlr.press/v89/feydy19a/feydy19a.pdf)
(PDF p. 3; read 2026-09-30) assumes a positive universal Gibbs kernel. The
kernel-energy discussion on PDF p. 2 and the main-text proof on pp. 4–5 use
additional measure and convexity arguments. Those pages were read; the
supplementary proofs were not independently audited here.

**Fix:** record an evidence-backed overlap and update the examined entry.
Reuse finite-form positivity and the scalar Kolmogorov interface where needed.
OT13A retains continuous-kernel packaging, universality, signed-Radon-measure
energy/separation and Sinkhorn conclusions. Keep the two-point non-example.
There is no reason to impose a monoid on an arbitrary compact space or to
require Bochner/BCR representation for every Gibbs kernel. No upstream
roadmap expansion is needed to record this existing interface. Medium severity
reflects an omitted ownership/reuse boundary, not a false Sinkhorn theorem or
proof that the residual analytic interfaces are already present.

## Checks of the retained map

Read the complete focal README covering all nine stages, the accepted link map
and review, all nine reviewed audit target/status lists and duplicate records,
and every distinct existing consumer/overlap stage in full: PDE F.26, OT10,
OT11, OT14, Standard Distributions Layer 1 and Dense Graph Limits Layer 8a.
All 15 evidence quotations match both the raw document and the given line range.

| Contract | Check and result |
| --- | --- |
| Part A → PDE F.26 | Real Banach C0 carrier, dense generator domain and unbounded resolvent are abstract inputs; PDE still owes the concrete heat realization and estimates. A growth bound is a separate predicate. |
| Hille–Yosida → PDE F.26 | Read `hilleYosida_generation_iff`: `1≤M`, dense domain, real half-line and every positive resolvent-power estimate. `HasGrowthBound` takes `omega` before `M`. The map correctly marks this existing library work. |
| Part A → OT11 | Read `eq_of_generator_eq`: it compares two actual C0 semigroups with equal full `LinearPMap` generators on the same space. Equality merely on a proposed core, or the existence of an EVI curve, does not supply these hypotheses. |
| PDE rescope | General generation remains with Part A; concrete domains, boundary conditions, heat kernels and smoothing remain PDE work. |
| OT10/OT14 comparison | The linear quadratic-form specialization is legitimate. Factoring `I−τA=τ(τ⁻¹I−A)` gives the required `τ⁻¹` in the proximal-resolvent formula. With `A=−I`, the resolvent is `x/(1+τ)` and the flow is `e^(−t)x`. Nonlinear EVI and RCD carrier comparisons remain separate. |
| Standard Distributions boundary | Read the pinned Fourier convention identity: the Fourier-atom integral at `a` is `charFun μ ((−2π) • a)`. Named constructed laws do not need Bochner existence, and a finite measure need not have moments or a local mgf. |
| Graph reflection positivity | Fixed-label graph gluing with identity involution can be compared with finite quadratic-form positivity after quotient/monoid work. It does not meet the time-space BCR theorem's domain and hypotheses. |

All seven `verifiedLibrary` declarations were freshly read at Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`: `StronglyContinuousSemigroup`,
`hilleYosida_generation_iff`, `eq_of_generator_eq`,
`hausdorff_bernstein_widder_existsUnique`,
`norm_apply_le_map_zero_re_of_star_eq_neg`,
`isClassicalSolution_realOperator` and `isMildSolution_realOperator`.
Read their surrounding parameters and the classical/mild solution definitions.
The last two statements assert existence of orbits, not uniqueness of arbitrary
solution curves. Read `IsContinuousCompletelyMonotoneOnIoi` and
`RepresentsLaplace`: the Bernstein statement requires continuity at zero and
complete monotonicity at positive times, not endpoint smoothness.

Additional adversarial checks reproduce the map's existing safeguards:

* For the identity involution on nonnegative reals, `F(t)=e^t` gives a
  nonnegative rank-one quadratic form but is unbounded. The pinned group bound
  expressly requires `star a=−a`; it cannot be imported into graph gluing.
* For positive-dimensional Euclidean heat flow, a heat-evolved Dirac measure
  and the original Dirac measure are mutually singular at positive times. Their
  difference has total-variation norm two, so this norm does not yield the C0
  realization needed by the OT link.
* The finite measure `Σ_(n≥1) 2^(−n) δ_(2^n)` has infinite first moment. Its
  Laplace transform is continuous at zero but has no finite right derivative
  there. The map and audit already preserve this endpoint distinction.

These safeguards and the stale README corrections already in `remainingWork`
are not counted again as new findings. The Gaussian kernel positivity theorem
`posSemidef_cexp_neg_mul_sq_norm` was also read: it supplies a concrete PSD
example, not compact-space universality by itself.

## Fresh catalogue search and production checks

Screened 211 atlas extracts, nine new roadmap definitions, 143 research packets
and 51 integrated decompositions, including node, gap and request text. Narrow
semigroup/representation queries gave 12 records; the broader positivity,
kernel, GNS and heat queries gave 100. A separate screen of 429 Markdown
roadmap files gave 72 matching lines in seven files. Reserved identifiers were
also screened. These are discovery counts, not a claim to have reviewed all
proofs in every roadmap.

Read OT13A and 13C in full. Dynamic Schrödinger theory needs concrete Brownian
and heat-kernel inputs; it does not newly assert abstract generation. Read the
Compact Groups Layer 1 candidate: averaging a positive Hermitian form and
constructing its Gram operator do not request abstract PD-function
representation. The current Automorphic L-functions ownership passage
explicitly leaves Part C's theory to its owner. Arithmetic height pairings,
definite quadratic forms and positive Gram matrices were screened without
turning shared vocabulary into stage dependencies.

Ran `scripts.build.assemble(require_distances=False)` in memory: 2840 stages,
8007 distinct edges. Every retained directed pair is present and appears in
the consumer's `requires`. Both endpoints of Finding 1 exist, with no direct
edge either way. The recommended overlap adds no directed edge and cannot
introduce a cycle. No generated data was written.

Validation: `check_links.py` on the accepted target reports zero errors and
warnings. `check_redteam.py`, intake `check-files` for the two deliverables and
`git diff --check` pass. No Lean compilation or new library build was needed
or attempted. No exhaustive proof/axiom audit or absence claim about the whole
pinned libraries is made.
