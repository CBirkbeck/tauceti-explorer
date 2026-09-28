# BP-PadicMeasuresIwasawaAlgebras — residue restrictions

Agent: Codex — codex-hjdg0j. Date: 28 September2026. Issue #555.
Claim comment5868803497; winning bot5868805530. Base 632e7926cc54f0df9df396a6456d433a7e63710e.
Continuation of merged PR #3298; no preceding node is removed or changed.

## Current checkpoint

348 unchecked nodes: 2 definitions, 45 constructions, 221 lemmas, 50 theorems and 30 comparisons; 236 API items (233 on definitions/constructions), 239 packet tests (166 on definitions/constructions), 250 typed examples, 17 planets and 321 baseline references.
There are eight gaps, zero outgoing requests, fourteen inherited source findings
and zero closed stages. Every node remains unchecked; the file is a plan.

The 16 new nodes specialize the preceding weight map to the native clopen
fibers of integer reduction modulo p^n. They provide the coset criterion,
evaluation and Dirac formulas, orthogonal projectors, finite partition,
depth-zero identity, refinement, mass and finite-coordinate comparisons,
translation covariance, intrinsic-clopen comparison, weak continuity and
coefficient-algebra Amice coefficients. The construction has 13 API entries
and 6 unit tests; translation and Amice add two tests. All consumed API
results are individual nodes. No new planet or external request is added.

The hypotheses include p=2, n=0 and arbitrary normed commutative R, including
the zero ring. Amice coefficients additionally require a continuous ℤ_p
scalar action. Refinement sums rather than averages. Translation pulls a
class a back to a−ρ_n(b). The finite-coordinate atom does not identify the
restricted measure itself with a Dirac atom.

## Checks

- Full suggested file elaborated with Lean 4.34.0-rc2 at the pinned commits:
  zero errors and 730 warnings, all proof placeholders.
  SHA256: e7de212546f181d9563c4a85debcf6ec6bbb9162355dedac5e715fafc2f2cf12.
- Existing builds only. All 8482 reachable Mathlib source
  modules and 2 Tau Ceti source modules were checked
  against their pinned Git blobs. Cached Mathlib sources matched, and the
  existing Tau Ceti build metadata matched source hashes. No native module
  was built, and no Lake project/cache operation or extra Lean probe was used.
- Indexed packet checker:348 nodes, zero errors and zero warnings.
- Four-file intake, source-issue/version validation and whitespace checks
  passed. The internal graph has 695 edges and is acyclic. All new
  declarations, API names and test names agree across packet, reader and Lean.
- All 332 predecessor node objects, 319 baseline records and 14 source findings
  are unchanged. The entire preceding suggested body is an exact prefix.
- 53675 exact finite checks passed on signed atomic measures for
  p=2,3,5 and depths 0–3, including all residue fibers, translations and the
  first five Mahler coefficients. Four wrong-formula controls were rejected.
  These computations do not prove general continuity or arbitrary-measure
  claims; the mathematical proof outlines specify those arguments.
- Publication inputs were compared with main 06b555a41c31ba9854ed15cd79063a56f2acb5ce; all 45 guarded
  paths were unchanged from the claim base.

## Reading and ownership

Freshly read published RJW printed 124–128/PDF25–29 and arXiv v2 PDF20–21,
including the full local restriction toolbox. Hashes match the editions
recorded in sourceVersions. No new source error is asserted. Inherited
findings and version records are retained; this is not a fresh whole-paper
audit. Equation(3-5) remains unproved in the blueprint at general depth.

The campaign, current handoff, reviewed L2 coverage, accepted RS16 boundaries,
all 332 current node statements and the proof records directly consumed by
this addition were read. Thirty-six unchanged structural inputs were compared
with this worker's earlier readings. Unmodified preceding proof records are
preserved without a new independent review claim. Pinned native declarations
were read before use. Open Mathlib PR #23791's clopen restriction has the same
continuous-dual/characteristic-function shape; existing packet weight and
native AbstractMeasure supply it here. The Zulip search also surfaced Borel
measure-space work, which uses a different carrier.

RS16 assigns bounded residue operators to L2. The completed group-algebra
carrier stays with ProfiniteProPGroups Layer9; arithmetic actions, Coleman
trace comparisons and locally analytic extensions keep their existing owners.
No consumer prerequisite points back into this supplier.

## Resume

1. L2: extend the existing order-p root translation and average to all
   p^n-th roots, including the phase ξ^(−b), convergence and unique integral
   descent required for (3-5). Prove multiplication by z^x with its actual
   convergence hypotheses. The new coefficient formula is not this theorem.
   General coefficient lattices, operator comparisons, additive convolution,
   multivariable Amice and the completed-algebra comparison remain.
2. L1: compare the exact unit-coordinate inverse and weak topology with the
   existing Layer9 completedGroupAlgebra via cofinality and quotient maps;
   supply the algebra homeomorphism and its Dirac/projection laws.
3. L0: general profinite bounded clopen data and integral coefficient extension;
   finite-extension lattices, bases and completed tensors. Preserve the weak
   versus norm distinction and the necessary boundedness hypotheses.
4. L3: completed augmentation versus algebraic span, the procyclic principal
   denominator and its regularity, coefficient extensions and qualified
   character-family comparisons. Preserve the distinct dyadic case and the
   obstruction to a character map on the entire total quotient ring.
5. L0a,L4,L5,L6 still need full source decomposition. Keep character-space,
   Iwasawa module, determinant/inverse-limit and order-duality owners from
   RS16. In L5, finite generation alone does not establish Mittag–Leffler;
   use the exact compact Hausdorff inverse-limit hypothesis (inherited E6).

The full packet coverage and eight gap records specify the remaining targets;
no stage has been declared closed.

## Retained evidence

After submission, job scratch retains only these records under
`padic-measures-20260928`: `verification.json`, `suggested-compile.log`,
`lean-import-audit.json`, `source-reads.json`, `finite-checks.json` and
`input-comparison.json`. The persistent repository is reused. Source PDFs and
existing library builds belong to previously recorded shared evidence; no
new source or library snapshot was downloaded for this job.
