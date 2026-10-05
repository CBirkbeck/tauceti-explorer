# BP-K3BlochGroups--V.3 handoff

Agent: Codex. Session: `codex-o0QQ19`. Issue: #6383. Date: 2026-10-05.
The bot confirmed this session's claim in
[its claim reply](https://github.com/CBirkbeck/tauceti-explorer/issues/6383#issuecomment-6004170050).
This is a complete target-level pass, submitted for independent review, rather
than a checkpoint. It does not claim implementation or stage closure.

## Delivered and covered

- [Packet](../packets/K3BlochGroups--V.3.json): scope exactly
  `K3BlochGroups:V.3`, part `V.3`, status `complete`, coverage `planned`.
  Seventeen new nodes: five definitions, four constructions, four theorems,
  three comparisons and one lemma. Thirty-five API items, twenty-seven named
  unit tests, seventeen baseline declarations, two gaps and one request.
  All implementation statuses are unchecked. The accepted base packet is
  imported by node id and unchanged.
- [Reader](../readmes/K3BlochGroups--V.3.md): exact objects, hypotheses,
  comparison maps, kernel/cokernel ledger, proof steps, all APIs/tests,
  sources, ownership, acceptance and closure conditions.
- [Suggested signatures](../suggested/K3BlochGroups--V.3.lean): concrete
  free groups, tensor products, kernel subgroups, subgroup/submodule
  quotients, maps, API signatures and named test examples. The local
  `Imported` namespace represents inherited same-roadmap declarations;
  it creates no additional packet nodes or implementation claims.

The pass supplies Bloch's full-tensor lecture kernel and its comparison
through the relation quotient, Goncharov's integral generic configuration
presentation and rational all-curve presentation, the published CGZ target
and group, published Lemma 2.2 with its exact kernel, the injection into
the older repaired CGZ convention, and coefficient exports. No analytic
dilogarithm, configuration foundation, K₃ comparison or finite Chern-class
construction is duplicated.

The distinctions that must survive assembly are:

1. The raw lecture map has kernel R₅∩ker λ, potentially of infinite order.
   Only its quotient by that kernel is identified with B after inverting 6.
   The exact cokernel is (im λ∩im(1+τ))/λ(R₅).
2. Generic Goncharov B₂ is P, integrally; its boundary is −∂ and its cycle
   kernel is B. The source's wedge is antisymmetric, not automatically the
   ordinary exterior square.
3. The all-curve rational comparison is a surjection with exact kernel
   K_curv=R_curv^ℚ/R_red. For F₃ the curve group is zero and K_curv≅ℚ;
   this is a demonstrated exception to an all-field identification. No
   rational isomorphism is asserted for this
   relation set. The F(t)-only P.4 comparison is a different supplier.
4. `K3BlochGroups:V.3/cgz-bloch-group` still means the inherited older
   repaired exterior convention B_old. The published B_new has a new id,
   `K3BlochGroups:V.3/cgz-published-bloch-group`.
5. For |F|≥4, B→B_new is surjective with exact kernel B∩H killed by 2.
   B_new→B_old is injective with exact 2-torsion cokernel
   B̃/(B+(B̃∩H)). The old comparison is their composite. Both are
   isomorphisms over ℤ[1/2], ℚ and every positive odd modulus. Killing [0]
   as an additional relation can remove 3-torsion; it is not the generic
   Goncharov presentation.

## What remains for closure

There are two precise mathematical gaps, both recorded in the packet.

**Canonical curve geometry.** The supplier is
`tauceti:TauCetiRoadmap/AlgebraicCurves#layer-12-the-dictionary--function-fields--curves-and-the-comparison-contracts`.
For an integral scheme smooth of relative dimension one over Spec F and an
F-rational section, provide the local DVR, its fraction-field identification
with the scheme function field, residue-field identification with F, and
canonical projective evaluation. Its regular values, constants, zeros and
poles must agree with the valuation/residue construction, including the
projective-line coordinate calculations and change of field. V.3 requests
and imports this geometry rather than planning a second curve dictionary.
Connect that interface to `Polylogarithms:P.4/specialization-and-delta` for
the rational degree-two cycle calculation. This supplies the boundary
closure and the projective-line relation inclusion used here.

The prototype deliberately exposes this gap. An evaluation family is a
concrete typed parameter. The quotient and its universal property exist
for any family. The boundary and its APIs take the actual relation
containment R_curv≤ker d; the generic comparison takes R_red≤R_curv;
the cycle comparison takes both. The projective-line test signatures
display concrete evaluation equalities. No arbitrary evaluation family
is asserted to satisfy the canonical dictionary or either containment.
Elaboration does not construct the missing evaluation maps or prove these
geometric conclusions.

**The all-curve kernel.** Goncharov 1995 §1.9 p. 225 calls equality of the
generic and curve relations Conjecture 1.20. Locate and read an applicable
proof for the exact weight-two all-smooth-connected-curves rational
presentation over fields with at least four elements, including its field hypotheses, or keep the comparison
conjectural. The F₃ case is settled by the inversion relation: its curve group is zero
and its rational comparison kernel is ℚ. It must not be treated as an
unresolved isomorphism. The present pass does not assert that the problem is currently
open in the literature; it records that no applicable proof was verified.
A proof only for relations from F(t), or a bounded-torsion assertion about
a rational vector-space kernel, does not close this gap.

These are follow-up requirements after independent acceptance of this pass.
All current target presentations and maps have been planned; continuing
this packet into unrelated geometry or higher polylogarithms would duplicate
the assigned suppliers.

## Confirmed ownership findings and assembly actions

### RT-AREA-ktheory-2/17

Handled in this packet and reader: V.3 owns all Bloch-group conventions,
CGZ P¹ symbols and admissibility, all degenerate relations and both
versioned comparison theorems, including published CGZ Lemma 2.2.
HB.1 is only a consumer. Its finite Chern classes, cyclotomic hypotheses
and CGZ excluded primes stay with HB.1.

The following edits are outside this issue's allowed files and must be
applied by the assembly/maintenance job:

1. In the HB.1 stage description and
   `content/campaign/HabiroNumberFields/README.md`, remove the first two
   convention-planning sentences identified by the finding. Replace them
   with an import of the V.3 convention ledger and the versioned published
   nodes. Add the direct stage edge `K3BlochGroups:V.3` →
   `HabiroNumberFields:HB.1` even where it was already transitive. Keep
   finite Chern constructions and excluded-prime statements in HB.1.
2. In `research/blueprint/plans/HABIRO.md`, the PLAN-HABIRO document,
   correct §4.2's ownership statements and the Bloch–Wigner prerequisite
   row: integral conventions and comparisons belong to V.3; D and its
   analytic identity belong to P.1; analytic descent belongs to P.2.
   Make the corresponding HB.1 requirement/edge consistent.
3. Synchronize the HB.1 reader and suggested signatures. The current
   `HabiroNumberFields:HB.1/bloch-group-conventions` node already says
   that it imports the groups, but its CGZ Definition 1.1/2.1 descriptions
   are version-sensitive and must be corrected if the consumer is moved
   to the published 2023 source. Published Definition 1.1 is the classical
   group, and Definition 2.1 uses Q_neg. Import
   `cgz-published-bloch-group`, `cgz-published-lemma-two-two` and
   `convention-coefficient-exports` by full V.3 ids. The sentence saying
   the integral CGZ map need not be surjective belongs to κ_old, not
   κ_new. Both versions agree modulo odd n, so the finite Chern chain's
   existing number-field/root-of-unity hypotheses can be retained with
   the actual versioned canonical comparison map.

Do not silently change the mathematical meaning of the inherited
`cgz-bloch-group` id, and do not treat unaccepted RS-10 as authority to
move these conventions into HB.1.

### RT-AREA-ktheory-2/27

Handled here by importing the existing P.1 analytic definitions and P.2
descent, without any new analytic node or function. The accepted base
packet's two V.3 analytic ids are already consumer comparisons, and their
meaning is preserved.

The assembly/maintenance job must re-reserve
`K3BlochGroups:V.3/bloch-wigner-dilogarithm` and
`K3BlochGroups:V.3/bloch-wigner-five-term` in
`research/blueprint/reserved-ids.json` as
`Polylogarithms:P.1/bloch-wigner-dilogarithm` and
`Polylogarithms:P.1/bloch-wigner-five-term`, job `BP-Polylogarithms`.
Those P.1 nodes already exist in its packet. P.2 keeps
`Polylogarithms:P.2/bloch-wigner-descent`. Do not delete or re-own the
inherited V.3 consumer-comparison nodes. Make the references for consumers
of D in HabiroNahmSeries HB.3/HB.4, EllipticRegulators ER.2,
ArithmeticQuantumTopology QT.5 and BorelRegulators R.7 point to the P.1
function/identity (and P.2 for quotient descent as needed). Correct
PLAN-HABIRO §4.2 and its shared-prerequisite table to the same ownership.

## Sources and source issues

Read on 2026-10-05:

- Bloch, *Higher Regulators* (2000), §6.1 p. 43 equation (6.1.2), §7.2
  pp. 51–54 and §7.4 pp. 57–60. The publisher endpoint was inaccessible;
  the book supplied these passages. The
  lecture comparison is explicitly derived using inherited algebraic
  relations, rather than attributed to an unread comparison theorem.
- Goncharov, *Geometry of configurations, polylogarithms, and motivic
  cohomology*, published 1995, pp. 202–204, 217–219, 221–225 and 253–255,
  visually checked in the published scan. The author's copy and the
  Gangl-hosted copy have the same printed pages. The searchable MPIM 1991
  preprint was an aid, not the source of published page locators.
- CGZ, *Bloch groups, algebraic K-theory, units, and Nahm's conjecture*,
  published 2023, Definition 1.1 pp. 384–385 and §2.1 pp. 390–392 in
  full. Its acknowledgements and author page were checked for corrections.

All source URLs, editions, section locators, access date and content hashes
are in the packet and reader. No source PDFs, extracted texts or private
library files are committed. No scratch artifacts are required by a
successor. The source still missing for closure is a verified proof of the
specified all-curve comparison; no inaccessible source is silently cited
as supplying that proof.

E101 records the missing |F|≥4 qualification in published CGZ Lemma 2.2,
continuing the base packet's E14 for the older version. E102 records the
missing right-hand rationalization in Goncharov (1.25a) and the rational
reading of its inversion-cycle sentence. E103 records the F₃ exception to
the literal generic/all-curve equality in Conjecture 1.20, with its direct
proof and the source’s arbitrary-field scope. The rational context is explicit
in Corollary 1.19. No linked separate erratum was found for these points;
the search locations are recorded in each entry.

The complete extended relation matrices were independently evaluated for
F₂,F₃,F₅,F₇,F₁₁. The numbers of admissible ordered pairs are respectively
6,13,33,61,141. Integer row/column reduction gives cyclic extended
quotients of orders 3,2,3,4,6. The negative tensor target orders are
1,2,1,2,2; every relation has zero modified boundary. The resulting
published cycle groups have orders 3,1,3,2,3. For F₂ and F₃ the reader
also gives the explicit relation eliminations, so these counterexamples
do not rest only on a matrix computation. These are mathematical evidence
for the proposed examples, not formalized tests.

## Verification and landmarks

- `python3 scripts/check_blueprint.py research/blueprint/packets/K3BlochGroups--V.3.json`
  with the provided pinned declaration index: **0 errors, 0 warnings**.
  The textual index omits generated additive names; the packet cites and
  explains their read multiplicative originals. The suggested file uses
  the generated additive declarations directly.
- `lean-check research/blueprint/suggested/K3BlochGroups--V.3.lean`:
  **exit 0**, at the pinned Mathlib, only proof-placeholder warnings.
  Memory was checked before each invocation and exceeded 20 GB available;
  only one elaboration ran at a time. No build, dependency update, cache
  download or language server was started. Elaboration validates signatures
  with permitted placeholder proofs, not the mathematical claims.
- All thirty-five API names and twenty-seven test labels are present in
  the reader and suggested file. New ids are disjoint from the accepted
  base packet; dependency chains do not add a cycle. JSON and whitespace
  checks pass. Only the four authorized deliverables are changed.

There are zero new planets because the inherited V.3 packet already
assigns six. Its older CGZ planet should have its version named explicitly
at assembly. The packet proposes three sublayers to display tensor
foundations, Bloch/Goncharov comparisons and versioned CGZ comparisons
without exceeding the six-planet limit. No restructuring is applied here.

Resume with independent review of the complete pass. After acceptance,
the two mathematical gaps become a precise continuation and the ownership
actions go to assembly/maintenance within the affected files' permissions.
