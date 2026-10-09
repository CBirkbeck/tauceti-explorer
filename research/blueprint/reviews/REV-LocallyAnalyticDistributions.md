# REV-LocallyAnalyticDistributions

**Verdict: accepted as a completed planning pass, with all five stages partial.** Reviewer: Codex, session `codex-cpe72I`, issue #316, 9 October 2026. The input pass was written by Codex session `codex-h73CoC`; this session wrote none of the input. Acceptance does not assert implementation, proof closure, or readiness for an upstream package.

The review checks all 303 nodes and records an individual verdict in `review.checked`: **270 verified, 33 corrected, zero added, zero unverifiable**. All input node IDs survive. There are 14 definitions, 34 constructions, 55 theorems, 165 lemmas and 35 comparisons; 179 API items, 160 definition/construction tests and 18 planets. Every definition/construction has at least three tests. The 14 gaps and nine supplier requests remain explicit. No stage is marked planned or closed.

Current `detail.json` and PROTOCOL section 2 require target-level planning. The issue's older lemma-level instruction is reconciled with that current rule: the inherited finer nodes are retained, while unresolved proof inputs remain in the precise gap/remaining lists. Composite proof sketches are not treated as completed formal proofs. The node budget is already reached; the review corrects the pass rather than starting another expansion.

## Mathematical and source corrections

The following changes account for all 33 corrected-node verdicts.

- `L0/disc-analytic-functions`: the maximum-principle sketch now handles arbitrary real radii by rational approximation. An irrational valuation radius need not admit a rescaling element. The rational case uses reduction after finite coefficient extension. Source: Colmez, Propositions I.4.2–I.4.3, pp. 13–14.
- `L0/locally-analytic-radius`: the indicator nonexample now assumes `h≥1`, in both acceptance and tests; at `h=0` the indicator is constant. Source: Colmez §I.4.2, pp. 14–15.
- `L0/multivariable-fixed-radius`: the constant-one coefficient nonexample now requires a nonempty chart set as well as positive dimension.
- `L1/amice-transform`: a fixed lower bound does not tend to infinity. The inverse sketch now chooses a strictly smaller positive radius and combines its coefficient bound with the factorial estimate to obtain normalized coefficient decay. Source: Colmez Theorem II.2.2, p. 30; Rodrigues Jacinto–Williams Theorem 3.43, p. 25.
- `L2/c-r-functions`: the digit-doubling test explicitly gives the function in terms of base-p digits. `L2/order-r-distributions` fixes the exact dual valuation to the Mahler valuation, rather than the equivalent Taylor-remainder valuation. `L2/amice-velu-vishik` uses the adopted positive transpose derivative in the critical-order counterexample. Sources: Colmez §I.5, pp. 18–25, and §II.3, pp. 32–34.
- `L4/gauss-convergence`: the owner of the consumed evaluation-bound API, `L4/entire-series`, is an explicit prerequisite.
- `L4/cyclic-determinant-identity`: Buzzard Lemma 2.7 is on pp. **15–16**, and the native rectangular determinant identity is now cited. The two finite-image approximations remain separate; no global convergence of truncations of a merely bounded second operator is asserted.
- `L0/strict-sequence-comparison`, `banach-three-space`, `banach-splitting`, `frechet-three-space` and `compact-type-three-space`: Colmez–Nizioł Appendix A contains **Propositions A.1, A.3, A.4 and Remark A.2**, rather than four lemmas. Locators, proof attributions and the source reading register are corrected. The spherical-completeness/separability disjunction, left-heart input and unread cited extension proofs remain explicit.
- `L1/derivative-nonsplitting`: replaced the incorrect proof paraphrase with Kohlhaase's total bounded lattice argument. A split smooth quotient would induce a strict quotient of locally analytic functions onto locally constant functions. Here total means its linear span is dense, rather than metric total boundedness. Following the source, first extend to a complete valued field containing C_p using identity (37). The bounded submodule then contradicts bounded sets lying in one closed finite-dimensional level of the strict LF smooth-function limit. Completed coefficient extension, reflexivity, strict quotient topology, the analytic bounded submodule and that LF theorem remain proof inputs. Source: Proposition 4.2 and Corollary 4.3, pp. 20–21.
- `L2/locally-algebraic-determination`: finite Fourier inversion uses a suitable finite splitting extension **at each residue level**. One finite extension cannot contain all p-power-order characters. `L2/isotropic-anisotropic-distinction` restricts its locally constant wavelet formulas to orders below one; higher orders use locally polynomial wavelets. Source: Loeffler §§2.1–2.3, pp. 2–5, with the version-scoped correction below.
- `L3/mellin-adic-comparison`: upstream AdicSpaces Layer 5 constructs adic spaces and analytic discs but does not provide the asserted rigid/adic equivalence. The node is explicitly conditional on a precise AdicSpaces Part II request for corresponding affinoid sections, restriction and rank-one evaluation. The missing supplier output is recorded in the existing Mellin gap.
- `L4/affinoid-distribution-stage`: the constant-one dual coefficient example explicitly requires an ultrametric field. Its Lean example now includes `IsUltrametricDist K`; the claim is false over the real numbers.
- `L4/representative-product-dependence`: use `a=1` to exhibit an extra geometric zero on the contractible two-term complex. A nonzero nilpotent scalar would not give such a zero.
- Thirteen numerical slope nodes, from `numerical-slope-decomposition` through `frechet-finite-slope` (excluding the slope-free stage-factorization construction), explicitly assume rational `h`. Inclusive endpoints and geometric rank-one fibres are retained. Within these, `exact-slope-rank-local-constancy` separately cites Pilloni Proposition 13.1.3.1 and its proof, pp. 84–85, and Coleman Proposition A5.5/Corollary A5.5.1, printed pp. 441–442. Coleman supplies closed-disc quasi-finite geometry and local finiteness, not the full general-affinoid exact-slope theorem. The remaining general-affinoid/nonreduced proof is a gap.

The suggested file's obsolete worklist entry saying entire division was still untyped is also corrected: linear and monic division signatures are present; general entire spectral-resultant transport remains open.

## Baseline and ownership

All **254 inherited baseline declarations** exist at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` or Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Their source statements and citing uses were checked, including implicit field/ring hypotheses, module bounds, arbitrary index sets, polynomial degree bounds and additive declarations generated from the cited multiplicative declarations. All 254 names also resolved in the shared pinned build. No citation was removed or replaced.

The 255th citation is [Matrix.det_one_sub_mul_comm](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Matrix/SchurComplement.lean). It supplies the rectangular identity over arbitrary commutative rings and unequal finite matrix sizes. The gap no longer requests that algebraic identity; analytic transport through finite-free-image approximations and finite-projective determinants remains open.

The five LAD audit rows and RS-16 ownership were checked. Current upstream OperatorTheory and OperatorIdeals were read, including their suggested interfaces. Their general K-linear approximation/compactness results are suppliers in their stated setting. Finite A-generated images over an infinite-dimensional affinoid coefficient algebra do not coincide with finite-dimensional K-images, so the packet's affinoid Fredholm extension is not a duplicate. The ordinary complete-continuity predicate remains owned by AdicSpacesPartII R3; its broader coefficient contract is requested there. Current native restricted-series, bounded Amice, homological-complex and Henkel interfaces are reused.

PMIA owns bounded measures, bounded Amice and scalar character representability. LAD owns unbounded analytic duals, growth, analytic Mellin comparison and distribution coefficient actions. The packet does not infer strong-dual topology from the bounded measure API, infinite dual base-change isomorphisms from finite-dimensional ones, or `(Pr)` for every stage dual. No current upstream roadmap or library file was edited or replanned.

## The six source findings

Each source issue now has an independent `confirmed` verdict with version-scoped reasoning. The relevant seven page images were inspected as well as extracted text. No source passage was copied into these deliverables.

| Finding | Primary passage and check |
| --- | --- |
| E1 | [Coleman published scan](https://kundudeb.github.io/1997_Coleman.pdf), Lemma A3.1, printed p. 432/PDF p. 16, compared with the [author copy](https://math.uchicago.edu/~fcale/Files/Cole2.pdf). In restricted series the geometric series for `1−pT` contradicts the implication; the corrected control requires entireness. |
| E2 | Same published scan, proof of Lemma A3.4, printed p. 433/PDF p. 17. The displayed splitting polynomial substitutes root powers for the needed variable powers; the resulting quotient can be zero and does not give the stated faithful descent argument. |
| E3 | [Loeffler arXiv v3](https://arxiv.org/pdf/1304.4042v3), Definition 2.12/Remark 2.13, pp. 4–5. A locally constant tensor with vector order `(1/2,0)` fails the printed cofinite first-difference condition. The tensor-wavelet repair is version-scoped; an inaccessible published chapter was not used as evidence. |
| E4 | [Pilloni author PDF](https://www.imo.universite-paris-saclay.fr/~vincent.pilloni/complexhidatheorygsp4.pdf), §13.1.1, p. 84. The complementary reciprocal-root test needs valuation **at least −h**; both the printed sign and endpoint are defective. Scalar `U=p, h=1` detects the error. |
| E5 | Same author PDF, proof of Corollary 13.2.4.2, p. 87. Polynomial evaluation at a raising map between different spaces is ill-typed. For `P=XQ` the type-correct extension is `aQ(U_C)f`. |
| E6 | [BCGP arXiv v3](https://arxiv.org/pdf/1812.09269v3), §6.1.1, p. 139. Complementary monic-polynomial root tests must include valuation equal to `h`. |

The source issues' former placeholder descriptions for E4–E6 are replaced with own-word descriptions of the actual formulas. The fresh bounded public search did not locate a relevant correction; this does not assert that no correction exists.

Other primary passages used in checking the contracts include [Colmez](https://webusers.imj-prg.fr/~pierre.colmez/fonctionsdunevariable.pdf), [Serre](https://www.numdam.org/item/PMIHES_1962__12__69_0.pdf), [Buzzard](https://www.ma.imperial.ac.uk/~buzzard/maths/research/papers/eigenvarieties.pdf), [Schneider–Teitelbaum](https://arxiv.org/pdf/math/0102012v1), [Kohlhaase](https://esaga.net/f/jan.kohlhaase/Kohlhaase_Locally_Analytic_Cohomology.pdf), [Colmez–Nizioł](https://webusers.imj-prg.fr/~wieslawa.niziol/CN5.pdf), [Rodrigues Jacinto–Williams](https://arxiv.org/pdf/2309.15692v2), [Urban](https://www.math.columbia.edu/~urban/eurp/eigen.pdf), [Pan](https://arxiv.org/pdf/2209.06366v1) and [BCGP 2025](https://arxiv.org/pdf/2502.20645v1). Exact node locators and input source-version hashes are retained. Unread proofs cited by those papers remain gaps rather than additional verified sources.

## Assigned red-team finding and remaining work

RT-AREA-iwasawa-2/5 is addressed in both the packet and its reader input: bounded projective Banach complexes, compactness through a representative, a representative-dependent finite Fredholm product, numerical slope subcomplexes, finite-perfect windows, equivariant homotopy comparisons, derived base change and Stein/Fréchet interfaces are explicit targets. The raw product is not declared homotopy-invariant. Full analytic solid localization is an external shared Part II input; ordinary operator inversion or a direct union of windows is not substituted for it. Generic Stein geometry stays with its existing owner. The finite-window/perfect distinction prevents calling the entire infinite-rank Banach complex algebraically perfect.

The reader is an input, not an allowed deliverable for #316. Its compact-complex treatment and scope agree with the reviewed plan, but the corrections above must be carried into a regenerated reader during assembly/packaging. In particular, replace the old rigid/adic supplier assertion, nonsplitting proof paraphrase, irrational-radius sketch, slope hypotheses and Coleman attribution. Do not package the unchanged input reader as the corrected review result.

Questions/actions for the orchestrator:

1. Obtain named shared nonarchimedean topology/left-heart/tensor suppliers, including strict LF bounded sets and the unread Ext/nuclear-extension proofs. The proposal currently has no catalogue stage IDs; the packet does not invent them.
2. Request the rigid/adic character-chart comparison and the broader ordinary complete-continuity/Stein norm contracts from AdicSpaces Part II.
3. Continue the precise remaining lists for L0–L4: analytic carriers, uniform family radii, `(Pr)` models, finite-module topology, nonreduced determinant/rank, entire spectral-resultant transport, numerical slope fibres and continuous homotopy comparisons. General-affinoid exact-h local constancy still needs its proof.
4. Reconcile the reader from the corrected packet before an upstream package. Acceptance is of this partial-stage planning pass, not permission to claim those open inputs are complete.

## Validation

`python3 scripts/check_blueprint.py research/blueprint/packets/LocallyAnalyticDistributions.json`: **zero errors, zero warnings**. The complete suggested file passed `lean-check` in the shared pinned build: **exit 0, zero errors, 489 warnings, all uses of `sorry`**. Compilation checks typing only. No native library build was run, and all 303 implementation statuses remain `unchecked`.
