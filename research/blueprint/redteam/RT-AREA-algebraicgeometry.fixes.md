# RT-AREA-algebraicgeometry: fixes

Fixer: Claude Code, session `cc-c2c06b`, 30 September 2026 (issue #3974, job
FIX-RT-AREA-algebraicgeometry). This continues Codex session codex-5ebb6f's checkpoint (#4652), whose
ledger is `research/blueprint/handoff/FIX-RT-AREA-algebraicgeometry.md`.
- **Findings:** `RT-AREA-algebraicgeometry.result.json`.
- **Verdicts:** `RT-AREA-algebraicgeometry.review.json`. The red team has 46 findings, all confirmed.
  This job covers the 35 high and medium ones (1–35). The eleven low findings (36–46) are not part of it.
  The verifier confirmed each fix without changing it, so every disposition below uses the red team's fix.
- **Independence.** I did none of the red team (cc-39fac3), its verification (cc-7b31c4), the checkpoint
  (codex-5ebb6f) or the MotivesAndAlgebraicCycles blueprint and its review (cc-7b31c4, cc-2aeb03).

## How the findings are handled

An area's findings are about roadmap plans, so PROTOCOL.md section 17 sends them to the roadmaps'
blueprints:
- **Written blueprint.** A finding about a roadmap whose blueprint is written is fixed here, in that
  blueprint. That applies to one: MotivesAndAlgebraicCycles, for finding 31.
- **Unwritten blueprint.** A finding about a roadmap whose blueprint is not written yet is handed to the
  blueprint job that will write it. Its prompt lists the finding, and it fixes it in its packet.
  - I recomputed the assignment from `make_queue.py`'s `route_to_blueprints` against the current queue.
  - A finding naming several roadmaps goes to each of their jobs.
- **Only upstream or atlas records.** Some findings name only upstream Tau Ceti roadmap documents
  (`content/tau-ceti/…`), atlas stage edges, accepted restructurings, AUDIT-01 or other papers' routes.
  No job may edit those files, so each gets a note for the maintainer. Six findings (5, 6, 19, 20, 22, 23)
  concern only upstream Tau Ceti roadmaps, whose blueprint jobs are superseded. They have no carrying job
  at all.

Blueprint jobs and their issues:

| Job | Issue |
|---|---|
| BP-AlgebraicModuliForArithmeticGeometry--A0-extension | #672 |
| BP-AlgebraicModuliForArithmeticGeometry--R09.7a | #673 |
| BP-SchemeAndStackFoundations | #642 |
| BP-ComplexComparisonPartII | #703 |
| BP-ModularCurvesPartII--R12.1 | #773 |
| BP-PELModuli | #963 |
| BP-ShimuraCompactifications--C0 | #990 |
| BP-ShimuraVarieties--V0 | #993 |
| BP-FunctionFieldArithmetic | #732 |
| BP-AbelianSchemesAndArithmeticModuli | #666 |
| BP-AnabelianGeometryAndNonabelianChabauty | #1020 |
| BP-ReductiveGroupsPartII | #982 |
| BP-AdicCoefficientsAndComparisons | #668 |
| BP-NeronModelsAndSemistableAbelianVarieties | #960 |
| BP-TropicalAndBerkovichArithmetic | #1019 |
| BP-GrossZagierAndArithmeticHeights--GZ.0 | #744 |
| BP-SelmerIwasawaCohomology | #988 |
| BP-ShimuraData | #992 |

**The checkpoint's partial blueprint.** The checkpoint's ComplexComparisonPartII packet moved unchanged
to BP-ComplexComparisonPartII (#5147). That job resumes from it. The packet holds partial repairs for:
- 3: C0's nilpotent analytic-space carrier and its gap;
- 9 and 33: C4 imports AlgebraicCurves Layers 12B–12C and 6;
- 28: the PR279 Milestones 5–7 gap;
- 29: C5's Sella additive comparison;
- 30: relative proper GAGA in C3, with the relative C5 obligations;
- 32: C1–C3 request the algebraic half from R09.1 and StableReduction Layer 2;
- 35: SGA 1 XII added as a source.

Its handoff also records the upstream stage prerequisites that were left out only because of a checker
defect. They are to be restored once `check_blueprint.py` accepts `tauceti:TauCetiRoadmap/…` stage ids as
prerequisites.

## Fixed here

### /31 (medium, error): the de Rham–Betti comparison had no edge to its consumers: fixed in MotivesAndAlgebraicCycles; rest handed on

The MotivesAndAlgebraicCycles packet named SF.6 as the owner of the comparison, which is the error the
finding records.
- **Requests.**
  - The ComplexComparisonPartII:C5 request now asks C5, as owner, for two things:
    - (a) the natural isomorphism H_dR(X/C) ≅ H(X(C), C) for smooth projective X, with cup, pullback and
      trace, after base change along each embedding into C;
    - (b) the comparison for pairs (X, Y) over Q that MC.6 needs. C5 plans only the smooth and smooth
      proper cases, so the request asks C5 to extend it or to name the owner of the extension.
  - Its neededBy is now MC.6/period-point, MC.6/period-torsor, MC.7/hodge-class and
    MC.7/cycle-classes-are-hodge.
  - The SchemeAndStackFoundations:SF.6 request keeps only the étale–Betti comparison, which transports
    hard Lefschetz in MC.7/lefschetz-and-hodge-standard-conjectures. It says SF.6 consumes C5's
    comparison and does not own it.
- **Nodes.**
  - MC.6/period-point, MC.6/period-torsor and MC.7/cycle-classes-are-hodge now have
    ComplexComparisonPartII:C5 as a prerequisite in place of SF.6.
  - Their statement and hypotheses now say "request ComplexComparisonPartII:C5".
  - MC.7/lefschetz-and-hodge-standard-conjectures keeps SF.6.
- **Coverage and restructure proposal.** MC.2's and MC.6's `remaining` entries, the SF.2 request's
  cross-reference and the MC.2 narrowing proposal name C5 for the Betti–de Rham comparison.
- **Reader and suggested file.**
  - The reader's list of imports has a new ComplexComparisonPartII:C5 bullet, and its SF.6 bullet is
    narrowed.
  - The reader's MC.2 coverage paragraph and its narrowing proposal name C5.
  - In the suggested Lean file only comments change: the import list, `PeriodData`, its `comparison`
    field and `periodPoint`.
- **Not changed.** No node was added. MC.2's coverage stays `partial`, since no node yet states the
  isomorphism of realisations, as its `remaining` entry says.
- **Handed on.** The C5 side goes to BP-ComplexComparisonPartII and the SF.6 side to
  BP-SchemeAndStackFoundations.

**For the maintainer.**
- Add the atlas edges ComplexComparisonPartII:C5 → SchemeAndStackFoundations:SF.6 and C5 →
  MotivesAndAlgebraicCycles:MC.2. The red team and the verifier checked both acyclic. PS.0 and PS.8
  inherit the comparison through MC.2.
- In AUDIT-01's C5 duplicates list, relabel MC.2 and SF.6 as consumers.

## Handed to blueprint jobs

For each finding: the carrying jobs, then the maintainer-owned part. Every edge named below is one the red
team checked acyclic, jointly with the others.

- **/1 (high, duplicate): two owners of algebraic spaces and stacks.** Carried by A0-extension (#672) and
  SchemeAndStackFoundations (#642).
  - The two jobs must agree on one owner; the recommendation is SF.1. R09.3 then narrows to Weil
    restriction as an algebraic space, the comparison with the ModularCurves quotients and moduli
    descent, and R09.4 to the moduli-stack algebraicity.
  - Maintainer: add the edges SF.1 → R09.3 and SF.1 → R09.4.
- **/2 (high, missing): Artin approximation has no owner.** Carried by A0-extension (#672), whose scope
  holds R09.6.
  - R09.6 should plan G-rings (Stacks 15.51.10), approximation for henselian G-rings (16.13.1–16.13.2)
    and Artin 1969 Corollary 2.6.
  - Maintainer: add the edges SF.0 → R09.6 (Popescu) and R09.6 → A0-extension.
- **/3 (high, missing): the complex analytic-space carrier has no owner.** Carried by ComplexComparisonPartII
  (#703), ModularCurvesPartII--R12.1 (#773), PELModuli (#963), ShimuraCompactifications--C0 (#990) and
  ShimuraVarieties--V0 (#993).
  - ComplexComparisonPartII chooses option (i), a first layer owning the carrier, or option (ii),
    SF.2's PR196 target list.
  - The consumers import from that owner.
  - Maintainer: add the owner's edges to C0, V2, C2, M3 and R12.3, and list these consumers on the PR196
    external record.
- **/4 (high, missing): Hodge–de Rham degeneration has no owner.** Carried by ComplexComparisonPartII
  (#703).
  - It needs a layer after C5 for degeneration, the Hodge decomposition and symmetry, and Deligne 1968
    (5.5).
  - Maintainer: add the edges C5 → new layer, new layer → MC.2 and new layer → PS.0.
  - Maintainer: when PAPER-QIAN-23 is next revised, point its item 130 at the new layer.
  - Maintainer: tell the DegeneratingHodgeStructures design job to import the layer.
- **/7 (medium, missing): F. K. Schmidt's theorem has no owner.** Carried by FunctionFieldArithmetic
  (#732), as a named FA.5 node.
  - Maintainer: add the link FA.5 → FA.4.
  - Maintainer: retarget PAPER-BHARGAVA-SHANKAR-TANIGUCHI-ETAL-20/degree-one-divisor to the new node.
  - Maintainer: note in AUDIT-01's AlgebraicCurves Layer 5 entry that the Rem. 1.6.4 clause is outside
    that roadmap's zeta-free scope.
- **/8 (medium, missing): Néron–Severi group and Picard number.** Carried by AbelianSchemesAndArithmeticModuli
  (#666), as an A2 node; also AnabelianGeometry (#1020) and SchemeAndStackFoundations (#642), as consumer
  and neighbour.
  - The A2 node covers NS(A), [L] ↦ φ_L into the symmetric homomorphisms, finite generation and ρ(A).
  - No new edge is needed.
  - Maintainer: retarget PAPER-BALAKRISHNAN-DOGRA-MULLER-ETAL-19/9 to it. Its fix job, #5018, may not edit
    other routes.
- **/9 and /33 (medium): C4's completion of affine curves.** Carried by ComplexComparisonPartII (#703),
  starting from the checkpoint's partial repair.
  - Maintainer: add the links AlgebraicCurves Layer 12 → C4 and AlgebraicCurves Layer 6 → C4.
- **/10 (medium, duplicate): R09.3's descent classes.** Carried by A0-extension (#672).
  - Maintainer: add the edges ModularCurves 0C → R09.3, 0E → R09.3 and StableReduction Layer 2 → R09.3.
- **/11 (medium, duplicate): Weil restriction planned four times.** Carried by A0-extension (#672),
  ReductiveGroupsPartII (#982) and SchemeAndStackFoundations (#642).
  - Maintainer: add the edges 0F → RG2.0a, 0F → R09.3 and RG2.0a → R09.3.
  - Maintainer: point PAPER-LAWRENCE-SAWIN-25's Weil-restriction item at R09.3, or at RG2.0a, not at SF.0.
- **/12 (medium, duplicate): R09.1 re-plans Grassmannians, Proj and ampleness.** Carried by A0-extension
  (#672), with the StableReduction/HodgeStructures part of the fix applied with it.
  - Maintainer: add the edges ModularCurves 0G → R09.1, StableReduction Layer 2 → R09.1, StableReduction
    Layer 2 → R09.3 and ModularCurves 0E → R09.3.
- **/13 (medium, duplicate): R09.7a re-plans the blowup.** Carried by R09.7a (#673).
  - Maintainer: add the edge StableReduction Layer 4 → R09.7a.
- **/14 (medium, duplicate): cohomology and base change "beyond curves".** Carried by A0-extension
  (#672).
  - Maintainer: add the edges JacobianChallenge Layer C → A0-extension and StableReduction Layer 2 →
    A0-extension.
  - Maintainer: record the owner as JacobianChallenge Layer C when RS-27 is written.
- **/15 (medium, error): SF.5 depends on SF.4.** Carried by SchemeAndStackFoundations (#642).
  - Maintainer: replace SF.4 → SF.5 by SF.3 → SF.5 and R09.1 → SF.5, adding the duality owner's edge
    chosen under /18.
  - Maintainer: delete the RS-25 forwarding links from R11.1, R11.3 and StableReduction Layers 7–9 into
    SF.5, keeping Layer 4 → SF.5.
- **/16 (medium, duplicate): two plans of de Jong's alterations.** Carried by AdicCoefficientsAndComparisons
  (#668) and SchemeAndStackFoundations (#642).
  - SF.4 is to be the single owner, and L5 narrows to its étale-cohomological tasks.
  - Maintainer: add the edge SF.4 → L5.
- **/17 (medium, missing): the stack of stable pointed curves.** Carried by A0-extension (#672) and
  SchemeAndStackFoundations (#642).
  - The stack goes in R09.4 and its scheme covers in R09.5, or in a StableReduction Part II if the
    maintainer prefers.
  - Maintainer: add the edges StableReduction Layers 3, 8 and 9 → R09.4, and R09.4 → SF.4.
- **/18 (medium, duplicate): coherent duality planned by three owners.** Carried by A0-extension (#672)
  and SchemeAndStackFoundations (#642).
  - Plan it once; the recommended owner is SF.2.
  - Maintainer: add the edge SF.2 → A0-extension. If A0-extension is kept as owner instead, add
    A0-extension → SF.5 and move GUO-REINECKE-24/205.
  - Maintainer: re-point the four paper routes and AnalyticStacks AS.1's classical part at the chosen
    owner.
- **/21 (medium, missing): the Kodaira–Néron configurations and Tate's algorithm.** Carried by
  NeronModelsAndSemistableAbelianVarieties (#960), as an R11.2 node. It must first read Tate, LNM 476.
  - Maintainer: add the edges StableReduction Layers 4, 5 and 6 → R11.2.
  - Maintainer: correct the reason of the EllipticCurves Layer 4 → StableReduction Layer 5 link, and report
    the gap upstream.
- **/24 and /25 (medium): TB.2 against StableReduction.** Carried by TropicalAndBerkovichArithmetic
  (#1019).
  - It needs a Bosch–Lütkebohmert 1985 Theorem 7.1 node, or a restriction to discretely valued models.
  - It narrows TB.2 to the metric, the skeleton and the retraction.
  - Maintainer: add the edges StableReduction Layer 1 → TB.2 and StableReduction Layer 2 → TB.2.
- **/26 (medium, duplicate): GZ.2 re-plans the regular models.** Carried by GrossZagierAndArithmeticHeights--GZ.0
  (#744).
  - Maintainer: add the edges StableReduction Layers 1, 4, 5 and 7 → GZ.2.
- **/27 (medium, error): HodgeStructures has no outgoing edges.** Carried by the consumers
  AbelianSchemesAndArithmeticModuli (#666), SelmerIwasawaCohomology (#988), ShimuraCompactifications--C0
  (#990) and ShimuraData (#992). Each names its HodgeStructures import.
  - Maintainer: add the edges Milestone L0 → D1, Milestone L1 → D3, Milestone L0 → L4, Milestone L2 → C1,
    and Milestones L0, L1 and L3 → A5.
  - Maintainer: queue the missing HodgeStructures link-map job.
- **/28 (medium, missing): the PR279 gluing supplier is untracked.** Carried by ComplexComparisonPartII
  (#703) and ShimuraVarieties--V0 (#993).
  - Maintainer: track PR279 Milestones 5–7 as external stages with the edges M5, M6 → AnalyticToricGeometry
    Layer 3, M7 → C0 and PR279 → V1, or plan the open-gluing theorem in an atlas-owned layer.
  - Maintainer: record AnalyticToricGeometry in the external record's `declared_by_areas`.
- **/29 and /30 (medium): C5's constant-coefficient comparison, and the relative Gauss–Manin inputs.**
  Carried by ComplexComparisonPartII (#703), from the checkpoint's partial repairs.
  - Maintainer: add the edge AlgebraicTopology Stage 6 → C5.
  - If a differential-topology owner is chosen for Ehresmann's theorem, add an edge from it into C5.
- **/32 (medium, missing): the algebraic half of GAGA.** Carried by ComplexComparisonPartII (#703).
  - R09.1's named targets (O(n), H^q(P^n, O(m)), Serre's theorems A and B) are in A0-extension's (#672)
    scope. The queue does not hand /32 to that job, because the finding names only C1–C3. So
    ComplexComparisonPartII should file them as a request to R09.1.
  - Maintainer: add /32 to #672's list.
  - Maintainer: add the edges StableReduction Layer 2 → C1, C2 and C3, and R09.1 → C1 and C2.
- **/34 (medium, duplicate): toric schemes over a general base.** Carried by ShimuraCompactifications--C0
  (#990), which states C0's general-base target.
  - Maintainer, when PAPER-BINDA-KATO-VEZZANI-25 is revised: make its item 092 import that target.
  - Maintainer: give the two proposed Part IIs of AnalyticToricGeometry distinct introductions, and
    record the owner.
- **/35 (medium, error): SGA 1 XII is missing from the source anchors.** Carried by ComplexComparisonPartII
  (#703). The checkpoint already cites SGA 1 XII.
  - Maintainer: take into `content/campaign/ComplexComparisonPartII/README.md` the source-anchor sentence
    kept as a diff in that job's handoff.

## Upstream only: notes for the maintainer

No swarm job carries these. Each change is to an upstream Tau Ceti roadmap document or to atlas links.

- **/5 (medium, error): JacobianChallenge Layer A's degree depends on Layer B.**
  - Keep in Layer A only the divisor-side degree (SchemeWeilDivisor.relativeDegree).
  - Move deg L := χ(L) − χ(𝒪_X), the agreement theorem and Pic⁰ X = ker deg into Layer B, stating the
    agreement theorem as Layer B's Riemann–Roch.
  - Add no B → A edge. Instead, name Layer B as co-supplier in the RS-18 owner row "Curve
    line-bundle/divisor/Picard/degree dictionary" and in StableReduction's J-A2 import.
- **/6 (medium, error): AlgebraicCurves Layer 12B's projectivity output has no supplier.**
  - Add the link StableReduction Layer 2 → AlgebraicCurves Layer 12. Its reason: projective morphisms over
    a quasi-compact base, "finite ⇒ projective", "projective ∘ projective is projective" and
    ℙ¹_k = Proj k[X, Y].
  - Or, if R09.1 is preferred as owner, add R09.1 → Layer 12.
  - Record that 12B's prerequisite is this supplier, not Mathlib. The verifier confirmed that Mathlib at
    082e2d3 has no projective morphisms.
- **/19 (medium, error): StableReduction Layer 2 has no incoming edges.**
  - Add the edges JacobianChallenge Layers A, B and C → StableReduction Layer 2, and ModularCurves 0A →
    Layer 2.
  - Record JacobianChallenge Layer C as the owner of proper-flat cohomology and base change,
    semicontinuity and Grauert.
  - Narrow Layer 2 to what Layer C does not state: contractions, the projection formula, Leray maps, the
    nodal R¹f_*𝒪 cases and arithmetic genus.
  - Re-point consumers that cite Layer 2 for cohomology and base change.
  - Queue the missing StableReduction and JacobianChallenge link-map jobs.
- **/20 (medium, error): StableReduction Layer 6 has no incoming edges.**
  - Add the edges JacobianChallenge Layer D, JacobianChallenge Layer E and AbelianSchemesAndArithmeticModuli:A3
    → StableReduction Layer 6.
  - Record that contract J-E's torsion statement comes from A3 applied to Pic⁰_{C/k}, not from Layer E.
- **/22 (medium, missing): Layer 6's numerical conclusion lacks named inputs.**
  - State them as named inputs of StableReduction Layer 6, with hypotheses:
    - the ℓ-torsion bound for Pic of a proper scheme of dimension ≤ 1;
    - the multicross equality criterion over k̄;
    - "Gorenstein multicross ⇒ node";
    - the Gorenstein special fibre of a regular model.
  - Layer 6 must own them, because importing them from R11.4 would close a cycle.
  - Add the K-rational point to the numerical-conclusion statement, and report both points upstream.
- **/23 (medium, error): StableReduction Layer 7 has no incoming edges.**
  - Add the edges R11.1, R11.3, R11.4 and JacobianChallenge Layer D → StableReduction Layer 7.
  - State the curve–Jacobian criterion with R11.1's excellent-DVR hypothesis, or ask R11.1 for Néron models
    over arbitrary DVRs.

## Files changed

- `research/blueprint/packets/MotivesAndAlgebraicCycles.json`: finding 31, as above. The JSON keeps the
  file's formatting (indent 1, UTF-8).
- `research/blueprint/readmes/MotivesAndAlgebraicCycles.md`: the matching reader changes.
- `research/blueprint/suggested/MotivesAndAlgebraicCycles.lean`: comments only.

No roadmap document, atlas file, restructuring, link map, audit or other paper file was edited. Those
changes are the maintainer notes above.

## Checks

- `python3 scripts/check_blueprint.py research/blueprint/packets/MotivesAndAlgebraicCycles.json --index
  <pinned declarations.tsv>`: 0 errors, 0 warnings. The packet has 173 nodes and 14 requests.
- `research/blueprint/intake.py check-files` on the four deliverables: no problems.
- No Lean was compiled; the suggested file's changes are comments.
