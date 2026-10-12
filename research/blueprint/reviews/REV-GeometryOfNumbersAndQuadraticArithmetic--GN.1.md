# Independent review of the GN.1 follow-up

**Accepted.** Claude (Opus 5.5), session `claude-oslQLt`, job `REV-GeometryOfNumbersAndQuadraticArithmetic--GN.1` (issue #9283), 12 October 2026. The blueprint `BP-GeometryOfNumbersAndQuadraticArithmetic--GN.1` was written by session `claude-hNXLjc`; this session took no part in it.

The packet plans the three items that the base packet's GN.1 coverage left open:

- the bridge between this roadmap's real gauge minima and Tau Ceti's norm-valued integral-lattice minima;
- Evertse's Hermite-basis and John-ellipsoid consequences;
- Smith's evaluation polytopes and cofactor adjustment, whose covering step sits in GN.4.

The planning is sound. Every node is right in substance, and the corrections below are local.

## Counts

| | Before | After |
| --- | ---: | ---: |
| Nodes (3 definitions, 2 constructions, 11 theorems, 4 lemmas, 1 comparison) | 21 | 21 |
| Nodes verified / corrected / added / unverifiable | — | 8 / 13 / 0 / 0 |
| API items / unit tests / planets | 48 / 22 / 4 | 48 / 22 / 4 |
| Baseline declarations | 47 | 51 |
| Source issues (confirmed / added) | 2 | 3 (2 / 1) |
| Gaps / requests | 0 / 0 | 0 / 0 |

GN.1 coverage stays `planned`, and its `remaining` list (lemma-level splits; restating the comparison once `IntegralLattice.successiveMinimum` reaches the pin) is precise. The packet status stays `complete`.

## What was checked

- **Sources.** Each source was fetched from the URL the packet records, and every SHA-256 matched:
  - Evertse, dio19-2;
  - Smith, arXiv:2111.12660v2;
  - Peikert, ECCC TR06-148 rev. 1;
  - Ball, MSRI 31;
  - BLPS, author copy;
  - SSTT, arXiv:1909.07473v3;
  - MST, arXiv:2011.08887v1;
  - the TauCetiRoadmap IntegralLattices README at 0d144d0.

  Every node was read at its locator. Formulas whose decorations matter were read on the rendered page. Evertse's Hadamard inequality (Exercise 2.11) prints `≥`, and the strict `>` in the text layer is an extraction artefact. Evertse's Exercise 2.12 bound is a quotient.

  The current Tau Ceti module `IntegralLattice.PosDef.SuccessiveMinima` is not at the pin, nor in the local copy of current Tau Ceti (a91d3aaf). It was read on its published documentation page. `successiveMinimum` takes values in ℕ with a zero-based `Fin` index. `successiveMinimum_le_iff` is exactly the right-hand side of `integral-norm-minima-comparison`.
- **Baseline.** All 47 declarations exist at Mathlib 082e2d3 and Tau Ceti f790474 under the cited names and modules (a Sonnet subagent listed the headers; I read the statements). Each supplies what its nodes use. The `Balanced` and `Absorbent` hypotheses of `gauge_smul` and `gauge_add_le` are now discharged by cited lemmas. `ZLattice.covolume_eq_det` is stated for `ι → ℝ`, so it is now paired with `covolume_comap`. No citation was removed.
- **Base-packet suppliers.** I read every cited node of the accepted base packet:
  - GN.0: `integral-rational-flag`, `covolume-projection`, `projected-adapted-basis`, `prescribed-primitive-basis`, `covolume-dual`, `covolume-square-gram`, `orthonormal-coordinate-hadamard`;
  - GN.1: the `successive-minimum` family, `lattice-determinant-lower-bound`, both halves of Minkowski II, `gauge-linear-equiv`;
  - GN.4: `lattice-gaussian-sum`, `gaussian-lattice-summable`, `gaussian-shift-maximum`, `gaussian-poisson-error`.

  Each supplies the statement used.
- **Mathematics.** I recomputed every proof sketch and every test or check:
  - the Hermite exponent bookkeeping;
  - the A₂ equality cases;
  - the constant comparison (4/3)^{n(n−1)/4}V_n against 2^n for n = 1,…,11;
  - the evaluation-polytope volumes and attained bounds;
  - the cofactor examples;
  - the smoothing estimate e^{−πs²} = 1/(8n), giving R ≤ 1/3;
  - the Poisson step ρ(M+u) ≥ ρ(M)/2;
  - the constants 3n√(log(8n)/π) ≤ 6n log(2n) and 3√2·√(log(8n)/π) ≤ 9 log(2n).
- **Duplication and library audit.** Nothing else plans these notions:
  - no other packet (`CA.3/hermite-basis-of-a-sublattice` is Hermite normal form; the GN.5 and Fincke–Pohst ellipsoids are quadratic forms, not convex bodies);
  - current Tau Ceti, TauCetiRoadmap and Completed have none of John's ellipsoid, Hermite's basis theorem, evaluation polytopes or lattice Gaussian tails;
  - the reviewed audit marks Minkowski II, Hermite's constant and covering radii absent.

  IntegralLattices milestone 2E (Hermite's inequality for `min L`) is a consequence of `hermite-basis`, now recorded as a check, and is not planned here.
- **Consumers.** LogarithmicPotentialTheoryAndAlgebraicIntegers requests R1 and R2 ask GN.1 for exactly `evaluation-polytope-volume`, `evaluation-polytope-minima` and Smith's Theorem 3.2. The last is supplied by `GN.4/smith-cofactor-adjustment`.
- **Routing.** The general BLPS flatness theorem (PAPER-SMITH-24/68) is deliberately not planned. I agree: its only use in the atlas is Smith's cross-polytope, and `l1-covering-transference` covers that with an explicit constant. BLPS's general bound rests on Talagrand's majorizing-measure theorem (their Lemma 2.1), which no roadmap plans.

## Corrections

1. **Squarefree means squarefree over ℚ.** `cofactor-polynomials`, `cofactor-integer-functional`, `real-cofactor-basis` and `smith-cofactor-adjustment` assumed `Q` squarefree in ℤ[z]. Smith's "squarefree integer polynomial" means distinct roots: his Lemma 2.10 produces such polynomials by a discriminant argument and does not control their content. The consumer (Smith Lemma 3.8, LP.5/integer-approximation) needs that generality. Statements, hypotheses and the suggested file now ask for `Squarefree (Q.map (Int.castRingHom ℚ))`, and a check and a Lean example with `Q = 4z − 4` were added.
2. **Sign in `real-cofactor-basis`.** The "equivalently" restatement gave the second vector of a conjugate pair as `√−1(Q_{τi} − Q_i)/√2 = +√2 Im Q_i`. Smith's vector, and the node's own definition, is `√−1(Q_i − Q_{τi})/√2 = −√2 Im Q_i`.
3. **Root order in the `X² + 1` test and check.** "Up to order" was not enough, because the other enumeration of the roots gives `+√2`. The roots are now enumerated `(i, −i)`, as the suggested file already did. The `X² − X + 1` values are `−1/2 ± (√3/2)i`.
4. **`cofactor-integer-functional`.** Its restatement through "the polar of the cross-polytope spanned by ±Q_i" was inexact, since the `Q_i` are complex. It is replaced by the equivalent statement that no nonzero integer `d` has `|Σ_j d_j coeff_j(Q_i)| < 1` for every `i`.
5. **Closure prerequisites.** Added where a step used an unlisted fact:
   - `successive-minimum-partial-product`: the two Minkowski halves, for the API item `successiveMinProd_top_bounds`;
   - `integral-norm-minima-comparison`: `ZLattice.rank`;
   - `basis-from-minima`: `balanced_iff_neg_mem` and `absorbent_nhds_zero`;
   - `hermite-basis`: `lattice-determinant-lower-bound`, with a proof step for the reverse Hadamard bound it states;
   - `hermite-minima-product`: `covolume-square-gram`, for the covolume of a linear image;
   - `evaluation-polytope`: `ZLattice.covolume_comap` and `PiLp.volume_preserving_ofLp`, for covolume 1 in `EuclideanSpace`.
6. **IntegralLattices 2F.** `definite-minima-discriminant` (proof step 4) and the upstream note called 2F's bound `∏λ_i ≤ γ_n^n det L` the Euclidean-ball case of the convex-body theorem. It is sharper: the convex-body theorem gives `(2^n/V_n)² ≥ γ_n^n`. Both texts now say so. The note also records that 2E's Hermite inequality follows from `hermite-basis`.
7. **Locators and uses.**
   - `gaussian-coordinate-tails`: the moment computation is in the proof of Peikert's Theorem 5.1, on p.15.
   - Peikert's read sections run to p.8, where Lemma 2.8 is.
   - `gaussian-directional-tail`'s match now separates Peikert's d-dimensional region from the d = 1 slab.
   - `evaluation-polytope`'s use of Smith's Proposition 3.5: the nodes satisfy Smith's (3.3), and are not maximisers.
8. **Red-team handling.** The third `restructure` entry now proposes what the verdict on RT-AREA-algebraicnt-1/1 prescribes: the stage link IntegralLattices Layer 2 (2F) → GN.1, carried by `integral-norm-minima-comparison`, with assembly deriving the roadmap-level prerequisite and consumer. The other suppliers that finding names concern GN.2 and GN.3. Roadmap metadata is outside this job's files.
9. **Suggested file.** Two changes besides item 1:
   - `ellipsoid_eq_quadratic` now also states the converse that its API item asserts (every positive definite self-adjoint `P` arises);
   - the 4X − 4 example was added.

## Source issues

The packet's ids were renumbered `E1, E2 → E101, E102`, because the base packet already uses `GeometryOfNumbersAndQuadraticArithmetic/E1–E15` and the register showed duplicate ids. All references were updated.

- **E101** (Smith, Prop. 3.4, "least real number"): confirmed.
- **E102** (Smith, proof of Thm 3.2, simplex flatness cited for a cross-polytope): confirmed. The correction now also names the polytope route, BLPS Proposition 2.3 with the second part of Theorem 2.4 (2n vertices), and states the width argument precisely.
- **E103** (new, Ball, p.19): the volume of the perturbed ellipsoid is printed as `v_n/∏μ_j`; it is `v_n/∏μ_j^{1/2}`. Affects nothing. No published correction was found.

## Questions for the orchestrator

- **Planets.** GN.1 will show ten planets: six from the base packet and four from this packet. That exceeds the six a layer allows, unless the sub-layer proposal (second `restructure` entry, GN.1a/GN.1b) is applied or the assembly drops some. The checker counts per packet and does not see this.
- **GN.4 follow-up (#9328).** It must cite the four GN.4 nodes planned here (`gaussian-directional-tail`, `gaussian-coordinate-tails`, `l1-covering-transference`, `smith-cofactor-adjustment`) and not plan them again.
- **LP.5 requests.** R1 and R2 can be pointed at the exact nodes, as the blueprint's handoff says; R2's supplier is a GN.4 node.

## Checks run

- `python3 scripts/check_blueprint.py` on the packet, with the pinned declaration index: 0 errors, 0 warnings.
- `lean-check` of the suggested file (Tau Ceti f790474, Mathlib 082e2d3):
  - original: exit 0, 90 warnings, all "declaration uses `sorry`";
  - corrected: exit 0, 91 warnings, all of that kind (the new example accounts for the extra one).
- Every packet API item, unit test (as a `Test` docstring) and theorem name occurs in the file.
- **Reader.** Its node sections are generated from the packet. A renderer reproduced the original reader byte for byte from the original packet, then re-rendered every node section from the corrected one. The hand-written notes on the sources were updated for E102, the squarefree convention and E103.
