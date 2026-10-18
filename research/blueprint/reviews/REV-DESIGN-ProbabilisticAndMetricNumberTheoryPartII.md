# Independent review: transfer operators and uniform renewal

**Accepted**, 2026-10-18. Reviewer: Codex, session `codex-K2fHDm`, job `REV-DESIGN-ProbabilisticAndMetricNumberTheoryPartII`, issue #3594. This session did not write the design under review.

The review covers the new roadmap, its packet, reader and suggested Lean file. All 40 nodes have individual verdicts in `packet.review.checked`: 34 verified and six corrected. There are nine definitions, four constructions, 25 theorems, one comparison and one application; 49 API items, 43 tests and 34 planets. Every definition/construction has at least three discriminating tests. No nodes were added or removed. All implementation statuses remain `unchecked`.

This accepts a completed planning pass, not completed formalisation. TO.0–TO.2 remain closed; TO.3–TO.7 remain planned with precise packaging obligations. G1 and the finite-matrix compatibility request are retained rather than concealed by a false baseline declaration.

## Corrections made

1. `TO.3/noncompactness`: the API for Minkowski addition now requires the relatively compact summand to be **nonempty**. With an empty summand the sum is empty, so its noncompactness measure is zero even when the other set is an infinite-dimensional unit ball. Added `noncompact_empty_sum` as a fourth test. This also exposed source finding E11.
2. `TO.7/numeric`: the collocation matrix and interpolation contributions are **nonnegative**, with many zero entries. The method does not produce an entrywise strictly positive matrix. The roadmap description and reader now agree.
3. `TO.2/c0-bounds`: corrected the proof locator from Annals p.800 to p.799. `TO.5/wielandt`: Theorem 41 is on p.795, not p.794. `TO.5/pressure`: the proof spans pp.799–800, in addition to the statement on p.796. `TO.6/pole`: identified Lalley (7.7), p.25 precisely and recorded its defective exact decomposition alongside the already corrected formula.
4. Added independent verdicts to the ten original source findings, three further findings E11–E13, source identifiers, and the seven-entry `sourceVersions` ledger with URLs, reading dates and hashes. Rejected E9's attribution of explicit strict coordinatewise positivity to the source; the boundary-vector convention in the mathematical target remains correct.
5. Corrected the reader's baseline count from 16 to 17, synchronized its API/test/source changes, and replaced its pending-review instruction with the actual outcome.

No baseline citation needed removal or replacement. The suggested file needed no edit.

## Mathematical closure and ownership

The source locators for all nodes were read in the seven public documents recorded in the packet. GMR19 means the published Annals text; GMRv3 means the separately identified arXiv supplement. Liverani's locators use the author preprint's pagination. The records distinguish these versions. Statements and review evidence are in our own words; no source excerpt or sequential source summary is included.

The affine C¹ carrier is justified by its closed segment-identity subspace and derivative uniqueness on the dense interior. The affine-span convention handles the simplex boundary and the zero-dimensional singleton test. Scalar Arzelà–Ascoli, rather than a claim about arbitrary Banach-valued ranges, gives the compact C¹-to-C⁰ inclusion. Chronological word composition and outer-prefix coding use different stated orders. The count is finite below every delay bound, includes the identity, and counts transformations with multiplicity at boundary orbit collisions. Recovering a deleted homogeneous coordinate on generic strictly ordered inputs supplies freeness.

For the derivative estimates, I read GMR19 (5.1)–(5.10), pp.801–802, Table 1 p.804, and the explicit arXiv v3 calculations, §5.3 pp.46–53. Quotient differentiation requires the squared denominators in (5.5) and (5.9). The ordinary column sum in the proof of (5.5) decreases with its coordinate; the exceptional column must be treated separately when the deleted index is 1. Composing the short blocks before bounding gives the contraction constant used by the infinite-branch argument. The n=3 Gauss case is separate.

The function-cone extension is a target here; its finite-vector case belongs to OptimalTransport Layer 13B, item 9. For the normalized section νf=1, derivative-cone order bounds the C¹ norm of differences, so projective contraction gives the claimed strong-norm convergence. Adding a controlled constant moves an arbitrary real C¹ function into the cone, and real/imaginary decomposition gives the complex conclusion. Absolute series and uniform derivative majorants handle the countably many branches. A finite-symbolic theorem is not silently substituted.

Hennion's §5, pp.19–22, and Appendix A, pp.43–46, supply the ball-cover and exterior spectral arguments used in `TO.3/itm`. Weak compactness plus the iterated two-norm inequality gives the non-strict bound rχ≤r. The finite generalized eigenspaces and invariant complement are part of this target's proof, with no unplanned contour-projection theory. The weakly power-bounded alternative correctly allows spectral radius strictly below one. A trivial Banach space is handled directly; spectrum nonemptiness is used only in the nontrivial case.

Kloeckner's qualitative theorem and proof, pp.177–178, and §3 pp.185–187 justify the complex Banach implicit-function route to analytic simple eigendata. The normalization and derivative formula agree with the packet. A finite-power norm inequality preserves the strict gap; lower semicontinuity would not suffice. No uncleared Kato volume was used. The Wielandt argument combines the exterior spectral criterion with equality of phases on the closed coding attractor. The boundary fixed rays and their positive logarithmic gaps tending to zero rule out a common lattice coset. The pressure derivative has a quantitative negative delay bound, and the p-series limits give the unique exponent without arithmetic counting.

For renewal, the positive minimum delay gives the uniform exponential bound before any transform or smoothing. It justifies the ordinary Laplace integral and the factor 1/s. The exact resolvent identity, the probability normalizations and the simple eigenvalue crossing give B=hβ/(β|λ′β|). Lalley §8, pp.30–32, supports the compact-frequency symmetric smoothing argument. The uniform bound controls the tails; the regular boundary germ has a bounded derivative on each fixed compact frequency support. Integration by parts therefore gives convergence in the parameter sup norm. The two shifted-kernel inequalities then give the uniform monotone Tauberian conclusion. No uniform strip or high-frequency resolvent bound is assumed.

The Gauss conjugacy transports the C¹ spectrum, while PM.4 supplies its base map, inverse-branch derivative, density transfer, telescoping sum and probability. The raw eigenfunction and probability-normalized density remain distinct. The n=4 matrix/permutation calculation, sorting quotient, and closure of parabolic tails justify the Rauzy comparison. The dimension monotonicity uses the actual zero-prepending word injection. The projective Jacobian has exponent n−1; no Hausdorff-dimension assertion is inferred.

I read the supplying PM.4 packet statements and the accepted `ArithmeticDirichletSeriesPartII:HP.0/laplace` and `HP.3/laplace-theorem` statements. The former uses ordinary integrals; the latter's scalar constants agree at k=0, A=B(x)>0. The uniform adapter still proves the zero-residue case directly. The reviewed library audit for PM.0–PM.5 was checked as well.

I also checked current TauCetiRoadmap main at `0d144d044dacebca17b654695b6f1ad58f159b27` and the current Tau Ceti library at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, without building either. DifferentialGeometry Layer 10 §10.5 already owns finite-dimensional Brouwer. Its native closed-ball statement yields the finite-hull case by Euclidean projection, with dimension zero separate; G1 records only the atlas indexing/import bridge. OperatorTheory's Hilbert/selfadjoint scope and Completed/ContourIntegration's scalar contour scope do not already supply the general Banach targets here. Current compact-operator Fredholm results and bounded C¹ APIs do not duplicate the two-norm criterion or compact-body jet construction.

## Pinned baseline audit

Every entry below was independently read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, including its ambient hypotheses. Tau Ceti's recorded pin remains `f790474821cf4256814db967cb154e7af3d0c369`. The packet records each module.

| Declaration | Convention or hypothesis checked |
| --- | --- |
| `spectralRadius` | Native ℝ≥0∞ value and quasispectrum convention; finite real bounds require coercion. |
| `spectrum.gelfand_formula` | Complex Banach algebra; roots of power nnnorms converge in ℝ≥0∞. |
| `spectrum.nonempty` | Requires a nontrivial complex Banach algebra. |
| `spectrum.hasFDerivAt_resolvent` | Derivative in the algebra element at fixed resolvent scalar, with two resolvent factors. |
| `Real.summable_one_div_nat_rpow` | Precisely 1<p; native zero-index convention is removed by a finite shift. |
| `Complex.summable_one_div_nat_cpow` | Precisely 1<Re s. |
| `BoundedContinuousFunction.arzela_ascoli` | Compact domain, equicontinuity and one compact range set; scalar bounded ranges suffice here. |
| `ImplicitFunctionData.differentiableAt_implicitFunction` | Strict derivative data at the base point; nearby differentiability uses local uniqueness at nearby points. |
| `DifferentiableOn.analyticOnNhd` | Open complex domain and Banach-valued codomain. |
| `MeasureTheory.ProbabilityMeasure.continuous_integral_continuousMap` | Compact domain with measurable opens; real continuous test functions. |
| `isCompact_setOfPred_probabilityMeasure_mass_eq_compl_isCompact_le` | Compact Kₙ and bounds tending to zero; constant Kₙ=Δ with zero bounds gives all probabilities. |
| `MeasureTheory.FiniteMeasure.ext_of_forall_integral_eq` | Borel/closed outer approximation and all bounded continuous real tests; compact metric Δ qualifies. |
| `mellin` | Integrand u^(s−1)f(u) over u>0, giving the parameter −s after u=exp t. |
| `MellinConvergent` | Integrability predicate, separate from the totalized integral. |
| `MeasureTheory.integral_tsum` | Strong measurability and summable integrals of norms. |
| `MeasureTheory.tendsto_integral_filter_of_dominated_convergence` | Countably generated filter, a.e. convergence, eventual strong measurability and integrable norm majorant. |
| `Real.tendsto_integral_exp_smul_cocompact` | Banach-valued Fourier integral with native exp(−2πivw) normalization; the roadmap states its angular conversion. |

## Source findings and verification

The packet and reader contain all thirteen verdicts with precise locators. E1–E8 and E10 are confirmed; E9 is rejected for overstating what the source says. E11 is Hennion Proposition 5.1(v), p.19: nonemptiness is missing from the statement but explicitly used in the proof. E12 is Lalley Proposition 7.2, (7.7), p.25: the same full-remainder double counting as GMR19. E13 is the two lower-semicontinuity references on Lalley p.25: strict upper bounds need upper semicontinuity or the finite-power argument already in the plan. These three findings are marked as added by this review.

The bounded correction search included the Annals record, arXiv history, Magee's publications, the Numdam record, Lalley's author page and title/author errata queries. No separate correction was located; the arXiv index range is already corrected in Annals. This is not a claim of novelty.

Checks completed:

- `python3 scripts/check_blueprint.py research/blueprint/packets/ProbabilisticAndMetricNumberTheoryPartII.json`: **0 errors, 0 warnings**.
- `python3 scripts/check_sorry_data.py research/blueprint/suggested/ProbabilisticAndMetricNumberTheoryPartII.lean`: passed. The file has 169 lines and no sorry-bodied data.
- `lean-check research/blueprint/suggested/ProbabilisticAndMetricNumberTheoryPartII.lean`: **exit 0**, 24 warnings, all `declaration uses sorry`; no other warning or error. This checks statements, not their proofs.
- Source-issue schema and `sourceVersions` checks: passed. Packet/reader and roadmap-stage statement synchronization checked.
- Exact rational forward differentiation: **10,080 inequalities on 315 points**, n=4,…,8, covering all ten formulas, simplex faces and the shared core/cusp boundary. These finite checks supplement the source algebra, not replace its proof.
- Independent collocation: all six values reproduce to eight decimals. For m=16/B=100 the matrix has dimension 153 and at most 37 stored entries per row; m=32/B=300 has dimension 561 and at most 59. Convergence took 20–21 iterations under the stated tolerance. The values remain diagnostics without spectral enclosures.
- `git diff --check`: passed.

For the orchestrator: carry G1's existing DifferentialGeometry owner into the package dependency index and reconcile the OptimalTransport finite-positive-matrix specialization. These are the only retained planning obligations; no new mathematical owner or second claim is requested.
