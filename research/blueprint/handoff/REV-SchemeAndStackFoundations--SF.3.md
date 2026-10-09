# Handoff: completed independent SF.3 review

Issue #6285; Codex, session codex-FSF6kP; 9 October 2026. This is a completed
review with verdict **needs_changes**, not an unfinished review checkpoint.
The author of the reviewed input was Claude Code, cc-7c6bac.

## Done

Read the packet, suggested file, reader document, stage specification,
reviewed library audit, cited source locators/proofs, relevant supplier
statements and all three assigned confirmed red-team findings. Confirmed all
56 baseline declarations at Mathlib 082e2d3 and Tau Ceti f790474; all 53
containing file hashes match their pinned raw files. Reproduced all six
original external PDF hashes. Added the public Farkas survey only as a source
of the complex Prym component regression. No restricted-library copy was
needed.

Corrected 21 nodes, verified three, and recorded two as unverifiable pending
the precise closure obligations below. No node was added or removed. The
packet has 26 nodes, 53 API items, 25 tests, six planets, 16 requests and three
gaps. Review status is needs_changes and SF.3 coverage/packet status are
partial. Implementation status remains unchecked throughout.

The suggested file now uses the pinned coherent-cohomology and Euler
characteristic carriers, finite-type quasi-compactness, dimension-one Picard
components/Jacobian, actual constant finrank and locally finite presentation
for the norm, and multiplicative Picard comparisons. A nontrivial-π₁ example
is typed. The final file elaborated using lean-check with only `sorry`
warnings. The blueprint checker reports zero errors and warnings; diff
whitespace check passes.

The complete per-node findings, API/test inventory, source-issue decisions,
supplier checks and validation are in
[the review report](../reviews/REV-SchemeAndStackFoundations--SF.3.md).
Source URLs, versions/hashes, locators and exact remaining gaps are retained
in [the packet](../packets/SchemeAndStackFoundations--SF.3.json). The next
worker does not need the deleted scratch directory.

## Revision required

1. Complete the packet/suggested-file agreement: 33 APIs and 17 tests are
   still comments, three existing examples express weaker assertions, and
   several named theorems are only comments or special cases. Replace the
   admitted Picard-sheaf point type with a carrier connected to the sheaf and
   its Galois-fixed-point dictionary. Give the representing-functor, torsor,
   degree and base-change interfaces for Picard components. Keep the named
   SF.1/JacobianChallenge/TraceFormula suppliers and the pinned library
   carriers; do not disguise unavailable conditions as dummy propositions.
2. Close picard-norm-sequence: specify the kernel-stack objects, maps and
   norm trivializations; prove the duality between the norm component group
   and ker(π*:J→J′), of order two for the connected étale double cover. Keep
   the full kernel's two components, its identity Prym, and the μ₂ scalar
   automorphisms distinct. Yun–Zhang §6.1, Proposition 6.1(1), p.40, is the
   stack source; Farkas §2, pp.5–6, provides the complex test, not the full
   arbitrary-characteristic argument.
3. Close abel-jacobi-differentials: compare the first-order divisor
   deformation at every geometric P with the boundary from O(P)/O to H¹(O)
   and the coherent Serre residue pairing. Use the exact curve duality
   imports, AlgebraicCurves Layer 9 residues and Layer 12E's dictionary;
   that dictionary alone does not assert pairing compatibility. Milne III,
   Proposition 2.2, p.92, leaves the square as an exercise. Checking only the
   differential at the base point is insufficient.

These are mathematical/interface revision requirements. Further decomposition
of routine target-level proofs is not required by this verdict.

## Reader changes outside this review's permissions

The revision issue must include
research/blueprint/readmes/SchemeAndStackFoundations--SF.3.md among its
deliverables. It still presents the original statements and one stale gap.
Apply the packet's corrected statements, hypotheses, proofSteps,
prerequisites, acceptance conditions and coverage node by node. In particular:

- Opening/status and final gap section: describe partial coverage and all
  three current requirements. Remove the alleged missing SF.2 Leray edge.
- Models/affine-or-projective: distinguish normalization from its finiteness;
  use SF.0/nagata-normalization-finite and finite surjective affineness
  descent. Ensure the Lean description includes finite type, not merely
  local finite type.
- Base change: smooth remains smooth under every extension; use the regular
  nonsmooth y²=x^p−t example for inseparable normalization genus drop. Keep
  arithmetic genus and function-field genus separate.
- Riemann–Hurwitz: use the different line-bundle identity, not locally-free
  additivity for a torsion quotient; include separable residue extensions in
  the tame equality criterion.
- Genus zero: separate the odd-degree smooth conic argument from the Bezout
  combination of normal closed points.
- Degree/duality: use component generic lengths and proper birational
  modification (Stacks 0AYW, 0AYU, 0DJ5), and U∨⊗V in the Ext derivation.
  Import SF.2's relative-dualizing-module, cm-serre-duality and
  curve-dualizing-comparison nodes.
- Picard/cohomology/class groups/excision: Čech covers require refinement;
  locally finite support differs from the Noetherian finite-support curve
  carrier; include fields for the cone/cusp tests and require U defined over
  k in the Galois-equivariant restriction statement.
- Picard torsors/Brauer: correct the torsor map's target to Picᵈ×Picᵈ;
  distinguish torsion Br′ from H²; use splitting of Brauer pullback by a
  rational section. Import the existing SF.2 site Leray, étale–Galois,
  Hochschild–Serre, field-Brauer and Tsen nodes. Separate square and quadratic
  discriminants and use QuadraticFormInvariants Layer 7 for the general
  cyclic norm quotient.
- Picard/section stacks: use G_m as a stabilizer group scheme, retain the
  jumping-rank test, and require addition's associativity/commutativity
  coherence. Document missing typed carriers honestly.
- Abel maps: fibres can be empty; a nonempty Brauer–Severi fibre uses a pinned
  line/quotient sign convention; state d≥max(0,2g−1). Include the
  non-effective degree-zero regression and direct obstruction dependency.
- Norm sequence: pullback sends degree d to nd; the full double-cover norm
  kernel has two components, while im(1−σ) on J′ is the identity component.
  A stack kernel includes a norm trivialization with μ₂ automorphisms.
- Differential comparisons: cotangent/tangent duality uses finite dimension;
  all global forms are invariant for the proper abelian variety, not every
  group variety. Use the all-point Abel–Jacobi calculation and p.92 locator.
- Tate comparison: distinguish twisted pullback from untwisted dual norm,
  and arithmetic Tate-module Frobenius from geometric cohomology Frobenius.
  Import TraceFormula Layer 8 and EllAdicRealization at PR196 commit
  4bd72379658126cbe9be935656396f0c9dac4de0.
- Source-issue section: mark E-SF3-1 rejected as a source error; retain its
  roadmap proof obligation. Add confirmed E-SF3-2, scoped to Milne's author
  notes v2.00, with the G_a form t dt counterexample and the properness fix.

## Ownership to preserve

RT-AREA-algebraicgeometry/8 remains at AbelianSchemesAndArithmeticModuli A2
for φ_L/symmetric homomorphisms; NC.5 imports that owner. Finding /18 imports
full coherent duality from SF.2 and derives curve consequences here. General
Keel positivity from RT-AREA-geomlanglands/15 and BS17 route 3 remains SF.5
with its contraction/gluing source gates; G819's Witt-specific relation
comparison remains GS0. Do not edit those owners as part of this review.

Preserve the moved-down field Picard torsors and Brauer obstruction and the
BGW field comparison; relative higher-tier statements import these. The
review report identifies the existing TraceFormula/JacobianChallenge torsion
interface overlap for maintainer coordination, without recreating either
roadmap. No atlas promotion, manual label change, merge or issue closure was
performed by this worker.

## Submission

[PR #7994](https://github.com/CBirkbeck/tauceti-explorer/pull/7994) is open
from the session branch in the worker account's existing fork. The submission
bot marked #6285 state:submitted. GitHub's Swarm submission check is awaiting
maintainer approval of the fork workflow and has started no check jobs. The
worker account has read access to upstream, so it cannot approve that run.
Local intake and blueprint checks passed; the maintainer must approve the
workflow before automatic validation and intake can proceed.
