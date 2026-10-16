# BP-ClassicalSerreModularity--R27.4 — completed planning pass

Issue #9928; agent Codex; session codex-uTyLwY; branch codex-uTyLwY-r27-4.
The claim was confirmed by the swarm bot before work began. This is one scoped
blueprint job, ready for independent review, not an implementation or checkpoint.

## Deliverables and status

- [Packet](../packets/ClassicalSerreModularity--R27.4.json): status **complete**;
  scope exactly ClassicalSerreModularity:R27.4; coverage **planned**.
- [Reader](../readmes/ClassicalSerreModularity--R27.4.md): full statements,
  hypotheses, source locators, ownership, proof routes and acceptance checks.
- [Suggested Lean](../suggested/ClassicalSerreModularity--R27.4.lean): compiled
  with the shared pinned build through lean-check; the only warnings were the
  eleven intended proof placeholders. No modularity theorem is implemented.

Counts: **1 theorem node**, **0 definition/construction nodes**, **0 new API
items**, **0 new definition unit tests**, **11 Lean acceptance examples**,
**1 local planet**, **2 imported planets**, **2 baseline declarations**,
**0 gaps**, **2 open supplier requests**. Thus the stage presents three planets
in total. All local implementationStatus entries remain unchecked.

## What this pass establishes

The retained integrated Theorem 3.4 target removes good-dihedrality under D_r.
Its proof records both compatible systems, both characteristic switches, the
prime-field requirement in Lemma 8.2, and the full dyadic conductor inequality.
In particular, the dyadic weight-four type has exponent one from monodromy;
it is allowed for r at least one, and cannot enter the r=0 argument.
Residual reduction is an inequality, while the second lift is minimal relative
to the intermediate residual representation.

Three existing R27.4 target IDs are imported from the R27.3 packet:
auxiliary-characteristic-choice, strong-form-by-minimal-lifts, and theorem-1-2.
Their precise interfaces and proof checks are recorded under imports, not as
duplicate nodes. The reader explains the prime-field auxiliary choice, the
classical exact-weight/exact-conductor refinement, and Theorem 1.2 from D_0.
The mixed-source R27.1 classification node supplies only its dihedral
Lemma 6.2(i) projection. The nondihedral scalar dyadic completion uses the
minimal crystalline lift and exact dyadic KW I Theorem 4.1 interface.

The R26.1 packet has no R27.4 coverage record in this checkout, despite the
job's older continuation instructions. The integrated Theorem 3.4 ID is kept;
the sibling-only IDs stay with their existing owner. No sibling packet,
application code, atlas data or upstream roadmap is changed. No target moves
between roadmaps are proposed.

D_r and good-dihedrality are already owned by R27.2/R27.1. The reader gives
their consumed API and discriminating conductor checks without creating a
second definition. Buzzard's conditional nonscalar criterion, the separate
Q(i)-induced branch, and Wiese's Katz weight-one input remain with R20/R17.
The scalar finite-flat argument concerns the actual scalar character, whose
odd-order inertia is trivial over Q_2; being unramified up to twist would not
suffice. Hasse multiplication is followed by the integral classicality and
eigenvalue-lifting interface; it alone does not assert a characteristic-zero
weight-one lift. Exact p-tame primitive level uses the full coefficient-prime
WD comparison and newvector conductor, in addition to away-p compatibility.

## What remains and where to resume

No further extraction is needed for this scope. The stage stays planned,
rather than closed, until its two requested supplier interfaces are discharged:

1. Existing TauCetiRoadmap Chebotarev Layer 10: the complete-splitting corollary
   for the normal closure of E(i), with finite-prime exclusion. This supplies
   arbitrarily large prime-field coefficient characteristics congruent to one
   modulo four, without assuming E/Q is Galois.
2. AlgebraicModularFormsAndSerreWeights:R15.6: the combined S-type,
   classical-weight, conductor, determinant and residual-realization interface.

Review should check the imported-target clarifications alongside their R27.3
owner, especially the scalar justification and the smallest auxiliary prime
(13, rather than 7, once the modulo-four condition is imposed). Assembly must
retain each ID once and reconcile these proof-interface clarifications in the
owner's presentation. Preserve the existing division of labor: R20 owns
conditional optimization; R27.4 supplies the late scalar classical completion.
R27.5, R27.6 and R33.6 are consumers, not prerequisites. The induction proving
D_0 remains in R27.3. Missing arithmetic carriers in Lean are reader targets;
do not replace them with freely assumed predicates or proof-carrying records.

## Validation and baseline audit

- check_blueprint.py: **0 errors, 0 warnings**.
- lean-check: successful elaboration at Mathlib 082e2d3, with only the eleven
  intended proof-placeholder warnings; the file is below the 5,000-line cap.
- Independent numerical checks verified the positive-conductor valuation
  ranges, monodromy exponent boundary, auxiliary-prime boundary and nonscalar
  characteristic-two Jordan matrix (including its square being the identity).
- Direct prerequisites of the retained node and the three imported targets
  resolve. Traversing their named-node prerequisite closure found no cycle and
  no later ClassicalSerreModularity stage ancestor. Stage/library interfaces
  were treated as boundaries, not expanded indiscriminately to every node.
- The two cited declarations were read at the pins: HeckeRing.GL2.Newform
  (Tau Ceti f790474, Newform.lean, lines 79–106 including inherited hypotheses)
  and padicValNat_dvd_iff_le (Mathlib 082e2d3, PadicVal/Basic.lean,
  lines 466–482, including primality and nonzero hypotheses).
- AUDIT-31 and the current read-only Tau Ceti library/upstream Suggested files
  were checked. Existing analytic newforms, local Galois, determinant and
  Chebotarev interfaces are consumed, not replanned.

## Sources read and source boundaries

The packet records public URLs, exact SHA-256 hashes and the reading date
(16 October 2026). All source descriptions are in the worker's own words.

- Khare–Wintenberger, Serre's modularity conjecture (I), author preprint:
  Theorem 1.2 and conventions, pp. 2–6; Theorems 4.1 and 5.1 and the local
  lifting/system conditions, pp. 6–10; Lemmas 6.1–6.3, pp. 10–12; Theorem 3.4
  proof and Lemma 8.2, section 8.4, pp. 17–18; residual irreducibility
  paragraph in section 10.1, pp. 19–20. The final modularity characterization
  of all systems in Theorem 10.1 is not used as an input.
- Buzzard, On level-lowering for mod 2 representations, MRL 7 (2000):
  definitions and multiplicity-one criterion, pp. 100–102; Theorem 2.8 and
  complete proof, pp. 103–107; Theorems 3.1–3.2 and proofs, pp. 107–109.
- Wiese, Dihedral Galois representations and Katz modular forms,
  Documenta Mathematica 9 (2004): Theorem 1, pp. 123–124; Theorem 9 and proof,
  pp. 130–131; Theorem 10, proof of Theorem 1 and Lemma 11, pp. 131–132.

No source needed to specify this owned target is inaccessible. Proofs in KW II
of the imported lifting and compatible-system suppliers remain with R22/R24;
this pass checked the imported interfaces and does not claim a fresh audit of
those proofs. The existing independently confirmed Buzzard source correction
SerreWeightAndLevelOptimisation/E1 (unramifiedness at the removed prime in
Theorem 2.8) is used, with no duplicate source issue. No new source issue is
asserted. Downloaded source files and scratch notes are not deliverables and
are removed after submission.
