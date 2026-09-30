# Schur–Weyl link fix

Codex, session `codex-rtOQ9t`, 30 September 2026. Refs #5039. Base: `a8f7b419f86116df0a5f520fe34e2c6964612c4c`.

**Complete: the one confirmed finding, /1 (medium), is fixed.** This session previously verified the finding; the fix issue does not require a different fixer. The original link map and its independent acceptance were written by other sessions. The historical review object remains unchanged.

## /1: import the orthogonal action and pairing

Added the verifier-confirmed inferred link from ClassicalGroups Layer 0 to SchurWeyl Layer 9, with the two literal endpoint quotations supplied by the red team. ClassicalGroups owns the orthogonal GL inclusion, restricted standard action and equivariant symmetric pairing. SchurWeyl consumes them to define its diagonal orthogonal action and the form contractions in the Brauer action.

Updated overlap 4 to resolve the previously unverified carrier warning. At the Mathlib pin, `Matrix.orthogonalGroup` uses the fixed trivial star structure and is the standard **bilinear** orthogonal carrier over the complex numbers. It does not inherit complex conjugation. The summary now describes eleven links and distinguishes this targeted fix from the historical 217-roadmap screening ledger. The earlier ten links, other six overlaps, examined entries and acceptance history are unchanged.

No new mathematical supplier or roadmap is needed. The added edge requests the existing ClassicalGroups work; it does not claim the GL inclusion, equivariant pairing or tensor action is already implemented. General forms still require their coordinate/isometry comparison with the standard form. Brauer diagram relations, invariant-theory surjectivity, image-centralizer theorems and the symplectic cap/cup and crossing-sign convention remain their recorded obligations.

## Evidence checked again

I read the complete ClassicalGroups Layer 0 and SchurWeyl Layer 9 descriptions, overlap 4, the original finding and its verification, and the current link-map boundary reasons. The two endpoint quotations still match the source text. The reviewed library-coverage file has no SchurWeyl or ClassicalGroups entries; that absence is not evidence that a declaration is missing.

Read on 30 September 2026 at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`:

- [UnitaryGroup.lean, orthogonal section](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/UnitaryGroup.lean#L283): the local `starRingOfComm` instance precedes `orthogonalGroup`; `Matrix.mem_orthogonalGroup_iff'` states membership as `Aᵀ * A = 1` for a commutative ring.
- [Star/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Star/Basic.lean#L396): `starRingOfComm` is the trivial star structure. Its use at definition time is why the complex specialization has ordinary transpose.

The scalar matrix with entry `i` distinguishes the two groups: its conjugate-transpose product is 1, whereas its transpose product is -1. Resolving this distinction does not validate the symplectic Brauer-action sign conventions or an arbitrary-form comparison.

## Upstream maintainer correction

In the existing [SchurWeyl Layer 9 document](../../../content/tau-ceti/RepresentationTheory/SchurWeyl/README.md), correct the standing warning that identifies the pinned orthogonal carrier with the conjugate-linear unitary group. Reconcile the proposed `complexOrthogonalGroup` name with the existing `Matrix.orthogonalGroup` for the standard symmetric form; a convenience alias need not introduce a second carrier. Also correct the corresponding exclusion of `Matrix.orthogonalGroup` in the double-centralizer bullet. Preserve the explicit form, action and coordinate-comparison hypotheses and the independent symplectic sign repair.

That document is existing Tau Ceti roadmap work, so this link fix records the correction here for its maintainer. It does not rewrite or re-plan the upstream roadmap. There is no unresolved new-owner request in this finding.

## Validation

- `python3 scripts/check_links.py research/blueprint/links/tauceti_TauCetiRoadmap_RepresentationTheory_SchurWeyl.json`: 11 links, 7 overlaps, 217 historical examined entries; zero errors or warnings, including exact quotation and graph-direction checks.
- Read-only production assembly: 2,840 stages and 8,249 edges. Before the change there is no forward or reverse path between these endpoints. Merging the fixed packet in memory adds exactly one edge, to 8,250, populates the target's `requires` and the source's `consumers`, and passes the merger's acyclicity validation. Repeating the merge keeps 8,250 edges.
- Assertions against the base packet verify that the previous ten links, other six overlaps, historical review and examined ledger are unchanged.
- Intake `check-files` and `git diff --check` validate the two deliverables before submission.

No Lean file is required for this link fix; none was compiled. No library build or language server was started.
