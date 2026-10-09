# RT-AREA-algebraicgeometry: fixes, round 2

Fixer: Claude (Claude Code), session `claude-5oyBX2`, 9 October 2026. Issue #5701, job
FIX-RT-AREA-algebraicgeometry~2.

- **Inputs.**
  - Findings: `RT-AREA-algebraicgeometry.result.json`.
  - Verdicts: `RT-AREA-algebraicgeometry.review.json`.
  - Round 1: `RT-AREA-algebraicgeometry.fixes.md`, with its review `reviews/REV-FIX-RT-AREA-algebraicgeometry.md`.
- **Scope.** The 32 confirmed high and medium findings that the issue lists: 1–4, 6–18, 20, 21 and 23–35.
  - Findings 5, 19 and 22 concern Tau Ceti roadmaps only. They are not in this round's list, and round 1 left
    them as maintainer notes.
  - The low findings 36–46 are outside both rounds.
- **Files.** The job's queue entry (`research/blueprint/queue.json`, 9 October) lists eleven finished blueprints
  among its outputs, and the job prompt allows this round to edit them:
  - MotivesAndAlgebraicCycles, AlgebraicModuliForArithmeticGeometry--A0-extension, SchemeAndStackFoundations;
  - PELModuli, ShimuraCompactifications--C0, ShimuraVarieties--V0;
  - AnabelianGeometryAndNonabelianChabauty, AdicCoefficientsAndComparisons,
    NeronModelsAndSemistableAbelianVarieties;
  - GrossZagierAndArithmeticHeights--GZ.0, ShimuraData.

  The issue body, written earlier, lists five of them. The edits stay inside the queue entry's outputs.
- **Independence.** I did none of the following: the red team, its verification, either earlier fix round or its
  review, and the blueprint jobs or reviews of the eleven packets.

## How round 2 was done

Round 1 could edit only the Motives packet; it handed the other findings to the blueprint jobs that would write
the packets. Since then those jobs have finished, so most handoffs have already been carried out. For each
finding and each of the eleven packets it touches, I did the following:

- read the packet's nodes, requests, gaps, coverage and reader at the place the finding names;
- decided whether the fix is already there, still missing, or belongs to a stage or packet that another job owns;
- applied what was missing, in the packet, its reader and, where a node changed, its suggested Lean file.

Three facts settled several findings at once:

- StableReductionPartII (a draft Part II of Tau Ceti's StableReduction) now owns the stack of stable pointed
  curves: its reserved key is `StableReductionPartII:key/moduli-curves`, at MC.0.
- SchemeAndStackFoundations SF.2 now owns coherent duality, through `key/coherent-duality`.
- The accepted AdicCoefficientsAndComparisons packet imports de Jong's alterations from SF.4.

## Finding by finding

"Already applied" means that the packet's own blueprint job carried the finding and the packet meets the fix. I
checked this against the finding's fix text.

| Finding | Finished blueprints checked | Disposition |
|---|---|---|
| /1 | SchemeAndStackFoundations (SF.1); A0-extension (R09.3, R09.4) | **Already applied, recorded here.** SF.1 owns algebraic spaces (nodes `SF.1/representable-diagonal`, `SF.1/etale-atlas`, `SF.1/algebraic-space`), and its coverage keeps the Artin and Deligne–Mumford stack targets. The A0-extension packet requests spaces, sites and diagonals from SF.1, and its R09.3/R09.4 nodes are module descent and gerbes only. The SF packet's `confirmedFindings` entry now says so. Unplanned stack targets go to BP-SchemeAndStackFoundations--SF.1. The R09.3 and R09.4 narrowing goes to BP-AlgebraicModuliForArithmeticGeometry--R09.3 and --R09.4. |
| /2 | A0-extension (A0-extension, R09.6) | **Applied here.** R09.6 coverage now names its approximation targets: G-ring permanence under finite type (Stacks 15.51.10), approximation over henselian G-rings (Stacks 16.13.1–16.13.2) and Artin 1969, Corollary 2.6. It imports G-rings from `SchemeAndStackFoundations:SF.0/g-ring`, a node that exists now, and Popescu's theorem from SF.0, where the paper routes put it. The approximation step has to precede the Artin criterion, but accepted RS-27 (through FIX-RT-RS-27) later added A0-extension → R09.6, noting that no prefix needed splitting off. Planning approximation in R09.6 as a whole would therefore make the two stages depend on each other. The A0-extension packet gets a new `restructure` entry for a prefix R09.6:approximation, ordered SF.0 → R09.6:approximation → A0-extension → R09.6, and the criterion imports only that prefix; the coverage of both stages says so. This keeps the finding's owner and the paper routes at R09.6. The nodes go to BP-…--R09.6 and BP-…--A0-extension-2. |
| /3 | PELModuli (M3); ShimuraCompactifications--C0 (C2); ShimuraVarieties--V0 (V1–V3) | **Consumer side already applied; reader corrected here.** All three packets cite `ComplexComparisonPartII:C0/repair-analytification` or C0, and each records a gap for the missing carrier and requests or proposes its owner. The PEL reader's M3 introduction said the owner was "fixed"; it now states the gap, and the PEL gap entry says so. The owner itself goes to BP-ComplexComparisonPartII, and the consumer edges to BP-PELModuli~2, BP-ShimuraCompactifications--C0~2, BP-ShimuraVarieties--V0~2 and BP-ModularCurvesPartII--R12.1. |
| /4 | MotivesAndAlgebraicCycles (MC.7, consumer) | **Applied here, consumer side.** The Motives gap "The Hodge decomposition of a smooth projective complex variety is planned by no layer" ended with "the maintainer chooses an owner". It now names the owner the finding proposes, a new ComplexComparisonPartII layer after C5, and says that no owner is accepted yet. It also says that BP-ComplexComparisonPartII carries the finding (its gap "Geometric Hodge theory owner") and that HodgeStructuresPartII does not plan it. The layer itself goes to BP-ComplexComparisonPartII. |
| /6 | none (Tau Ceti AlgebraicCurves Layer 12B) | **Maintainer.** No packet in scope plans 12B. See the notes below. |
| /7 | none (FunctionFieldArithmetic FA.5) | **Handed on** to BP-FunctionFieldArithmetic. |
| /8 | SchemeAndStackFoundations (SF.3); AnabelianGeometry (NC.5) | **Already applied, recorded here.** SF.3 coverage keeps the Néron–Severi group and Picard number with AbelianSchemes A2, and no SF.3 node plans them. The Anabelian packet's request to A2 asks for NS(A) = Pic/Pic⁰, the injection into symmetric Hom(A, A^∨), finite generation and ρ(A). NC.5 coverage imports them. The A2 node goes to BP-AbelianSchemesAndArithmeticModuli, and the NC.5 nodes to BP-AnabelianGeometryAndNonabelianChabauty--NC.5. |
| /9, /33 | none (ComplexComparisonPartII C4) | **Handed on** to BP-ComplexComparisonPartII. Its partial packet already requests AlgebraicCurves Layers 12 and 6. |
| /10 | A0-extension (R09.3) | **Partly applied earlier; completed here.** R09.3 coverage already imported ModularCurves 0E and StableReduction Layer 2 descent. It now also imports quotients by finite locally free equivalence relations from ModularCurves 0C, and requires the general quotients to be proved compatible with them. The nodes go to BP-…--R09.3. |
| /11 | SchemeAndStackFoundations (SF.0); A0-extension (R09.3) | **Already applied; recorded and made explicit here.** SF.0 plans no Weil restriction, and its coverage keeps the chain ModularCurves 0F → ReductiveGroupsPartII RG2.0a → R09.3. R09.3's reader already imported the affine 0F case and compared it with RG2.0a. Its coverage now names both affine cases and asks for the compatibility proofs. RG2.0a goes to BP-ReductiveGroupsPartII, and the R09.3 nodes to BP-…--R09.3. |
| /12 | A0-extension (R09.1, R09.3) | **Already applied.** R09.1 imports ModularCurves 0G and StableReduction Layer 2's relative Proj and ampleness. R09.3 imports polarized étale descent from Layer 2 and ModularCurves 0E. The nodes go to BP-…--R09.1 and --R09.3. |
| /13 | none (R09.7a) | **Handed on** to BP-AlgebraicModuliForArithmeticGeometry--R09.7a. The A0-extension packet's R09.7 coverage already imports blow-ups from StableReduction Layer 4. |
| /14 | A0-extension (A0-extension) | **Already applied.** A0-extension imports locally Noetherian proper cohomology and base change in all relative dimensions. It keeps only the non-Noetherian, finite-presentation and Tor-amplitude extension. The nodes go to BP-…--A0-extension-2. |
| /15 | SchemeAndStackFoundations (SF.5) | **Applied here, as a proposal.** SF.5 coverage already named its real inputs. The SF packet now has a rescope entry: replace SF.4 → SF.5 by SF.3 → SF.5 and R09.1 → SF.5, keep StableReduction Layer 4 → SF.5, and delete the RS-25 forwarding links from R11.1, R11.3 and StableReduction Layers 7–9. The SF.5 nodes go to BP-SchemeAndStackFoundations--SF.5. |
| /16 | SchemeAndStackFoundations (SF.4); AdicCoefficientsAndComparisons (L5) | **Applied here.** The SF packet had declined to choose between /16 and RT-AREA-etale/21. It now makes SF.4 the single owner of the schematic alteration theorems, for these reasons: accepted RS-25 keeps them in SF.4; the accepted AdicCoefficients packet already imports them from SF.4 and narrows L5 to its tasks 4–5; and a schematic SF.4 prefix answers etale/21's concern that the alterations not inherit H1/H5. The SF gap, SF.4 coverage and `confirmedFindings`, and the AdicCoefficients gap G-owners and its reader, now agree. One packet outside this job still disagrees: PadicDifferentialEquationsAndRigidCohomology (partial, unreviewed) requests de Jong 4.1 for RD.5 from L5 and proposes L5 as owner. The SF rescope entry adds SF.4 → RD.5, and the retargeting goes to BP-PadicDifferentialEquationsAndRigidCohomology. The alteration nodes go to BP-SchemeAndStackFoundations--SF.4. |
| /17 | SchemeAndStackFoundations (SF.4); A0-extension (R09.4, R09.5) | **Applied here.** The owner is StableReductionPartII: the key at MC.0 and the proper Deligne–Mumford theorem at MC.2. R09.4 already imported it from there, and R09.5 coverage now leaves the coarse space and projective covers to MC.4. In the SF packet, SF.4 imports the stack, and the old boundary "R09.4/R09.5" is corrected. I read de Jong's 2.24 in the source: it fixes n ≥ 3 marked points and every genus g ≥ 0, and gets a projective scheme finite over the stack by normalising in level-ℓ Jacobian covers (projectivity as in Deligne's "Le lemme de Gabber"; Knudsen is the general reference). This cover belongs in MC.4, which plans it only for unpointed curves of genus at least 2 and requires SF.5. So de Jong's range has to be added there, and while SF.4 → SF.5 stands, importing it would close a cycle; the SF gap waits for the /15 rescope. |
| /18 | SchemeAndStackFoundations (SF.2); A0-extension | **Already applied, recorded here.** SF.2 owns coherent duality, with `key/coherent-duality` and its dualizing-complex nodes. A0-extension routes its 22 duality items (from four papers) to that key, and its coverage now names it. |
| /20 | none (Tau Ceti StableReduction Layer 6; supplier AbelianSchemes A3) | **Maintainer.** No packet in scope is the supplier. |
| /21 | NeronModelsAndSemistableAbelianVarieties (R11.2) | **Applied earlier; completed here.** R11.2 already had `kodaira-geometric-configurations`, `kodaira-component-groups` and `wild-kodaira-comparison`, sourced from Tate's table, with requests to StableReduction Layers 4–6 and an upstream note on the EllipticCurves Layer 4 → StableReduction Layer 5 link. The node now also states the component count m, with the values from the table on p. 46 of Tate, LNM 476, which I read: I0 1, I_n n, II 1, III 2, IV 3, I0* 5, I_n* n+5, IV* 7, III* 8, II* 9. Being above the table's characteristic line, the count holds in all residue characteristics, and the node identifies it with the m of EllipticCurves Layer 4. One acceptance test was added. The suggested file's omission comment and the reader follow. |
| /23 | NeronModels (R11.1, R11.3, R11.4 as suppliers) | **Applied here as an upstream note.** The NeronModels packet now records the edges that StableReduction Layer 7's curve–Jacobian criterion needs from R11.1, R11.3, R11.4 and JacobianChallenge Layer D, and the excellent-DVR hypothesis. |
| /24, /25 | none (TropicalAndBerkovichArithmetic TB.2) | **Handed on** to BP-TropicalAndBerkovichArithmetic. |
| /26 | GrossZagierAndArithmeticHeights--GZ.0 (GZ.2) | **Already applied.** GZ.2 imports regular models, the finite intersection pairing, semistable base change and the dual graph from StableReduction Layers 1, 4, 5 and 7, through four requests and node prerequisites. Its own nodes plan what the fix keeps there: the archimedean Green functions, the admissible pairing and measure, Faltings–Hriljac and the gluing of local models. Further rounds go to BP-GrossZagierAndArithmeticHeights--GZ.0~2. |
| /27 | ShimuraData (D1, D3); ShimuraCompactifications--C0 (C1) | **Already applied.** D1 and D3 nodes cite HodgeStructures Milestones L0 and L1, with two requests; C1 cites Milestone L2. Selmer L4 and AbelianSchemes A5 go to their blueprint jobs, and the outgoing atlas edges to the maintainer. |
| /28 | ShimuraVarieties--V0 (V0, V1) | **Already applied as far as a consumer can.** V1/analytic-structure cites C0. The gap "Holomorphic manifold gluing" and V0/V1 coverage name PR279 Milestones 5–7, or an atlas-owned gluing layer. The rest goes to BP-ComplexComparisonPartII and BP-ShimuraVarieties--V0~2. |
| /29, /30, /32, /35 | none (ComplexComparisonPartII) | **Handed on** to BP-ComplexComparisonPartII. For /32 the A0-extension packet's R09.1 coverage now names the requested algebraic targets: O(n) on P^n_A and P(E), H^q(P^n_A, O(m)) with its multiplication maps, and Serre's theorems A and B, absolute and relative (EGA III 2.2.1). Round 1 had left adding /32 to R09.1 to the maintainer. |
| /31 | MotivesAndAlgebraicCycles (MC.2, MC.6, MC.7); SchemeAndStackFoundations (SF.6) | **Applied in round 1; checked.** Motives requests the Betti–de Rham comparison from ComplexComparisonPartII:C5 and keeps only the étale–Betti transport with SF.6. The two prototype defects that the round-1 review reported were fixed later by FIX-RT-AREA-iwasawa-3~3 (#6794), which is awaiting its own review: the untyped period comparison, now `PairDiagram.PeriodComparison`, and the stale reader. The SF.6 part packet imports C5 (its independent review accepted it on 9 October), and the SF packet records it. |
| /34 | ShimuraCompactifications--C0 (C0) | **Already applied.** `C0/arbitrary-ring-toric-charts` is the single arbitrary-ring finite-fan toric scheme, covering non-Noetherian valuation rings. An `owners` entry and an upstream note say that the Binda–Kato–Vezzani Part II imports it. |

## Files changed

- **`packets/SchemeAndStackFoundations.json`** and its reader.
  - `confirmedFindings` gains a `round2` disposition for /1, /8, /11, /15, /16, /17, /18 and /31, and for
    RT-AREA-etale/21. Statuses change from `unimplemented` to `applied`, `applied (packet side)` (where atlas edges
    or paper routes remain with the maintainer), `recorded` or `settled`. The /16, /17 and etale/21 boundaries are
    corrected.
  - The gap "Conflicting confirmed alteration ownership directions" becomes "Alteration owner settled; the moduli
    cover waits for the SF.5 rescope". It now states the owner and the remaining cycle condition.
  - SF.4 coverage names the alteration owner and its inputs.
  - A new `restructure` entry carries the /15 edge changes, together with SF.4 → L5, SF.4 → RD.5, MC.2 → SF.4 and
    MC.4 → SF.4.
  - The reader updates its coverage sections, gap list, findings table (with a status column) and target
    inventory, and adds a section on this round.
- **`packets/AlgebraicModuliForArithmeticGeometry--A0-extension.json`** and its reader.
  - Seven coverage items are extended: the A0-extension stage (/2, /18), R09.1 (/32), R09.3 (/10, /11),
    R09.5 (/17) and R09.6 (/2).
  - A new `restructure` entry proposes the prefix R09.6:approximation (/2).
  - The reader mirrors them and adds a section on this round.
- **`packets/NeronModelsAndSemistableAbelianVarieties.json`**, its reader and its suggested file.
  - `R11.2/kodaira-geometric-configurations` gains the component-count sentence and one acceptance test (/21).
  - A new `upstreamNotes` entry covers StableReduction Layer 7 (/23).
  - The suggested file changes only in that node's omission comment.
- **`packets/MotivesAndAlgebraicCycles.json`** and its reader: the Hodge-decomposition gap now names the owner
  that /4 proposes.
- **`packets/AdicCoefficientsAndComparisons.json`** and its reader: gap G-owners is retitled "Alteration owner
  settled in SF.4; supplier edges pending" and rewritten, and the L5 coverage line follows.
- **`packets/PELModuli.json`** and its reader: the M3 introduction states the carrier gap, the gap entry records
  the change, and the reader's link-proposal bullet now matches the packet's restructure entry (/3).

No node was added or removed, and no prerequisite changed. ShimuraCompactifications--C0, ShimuraVarieties--V0,
AnabelianGeometry, GZ.0 and ShimuraData needed no change. No atlas, link, restructuring, paper or Tau Ceti
document was edited.

## Handed to the jobs that write the blueprints

As the job prompt assigns them; those jobs carry the findings.

- **AbelianSchemes and ComplexComparison.**
  - BP-AbelianSchemesAndArithmeticModuli: /8 and /27.
  - BP-ComplexComparisonPartII: /3, /4, /9, /28, /29, /30, /31, /32, /33 and /35.
- **AlgebraicModuli parts.**
  - --A0-extension-2: /2, /14 and /18.
  - --R09.1: /12.
  - --R09.3: /1, /10, /11 and /12.
  - --R09.4: /1 and /17.
  - --R09.6: /2.
  - --R09.7a: /13.
- **AnabelianGeometry, FunctionField, GrossZagier and ModularCurves.**
  - BP-AnabelianGeometryAndNonabelianChabauty--NC.5: /8.
  - BP-FunctionFieldArithmetic: /7.
  - BP-GrossZagierAndArithmeticHeights--GZ.0~2: /26.
  - BP-ModularCurvesPartII--R12.1: /3.
- **PEL, ReductiveGroups and Selmer.**
  - BP-PELModuli~2: /3.
  - BP-ReductiveGroupsPartII: /11.
  - BP-SelmerIwasawaCohomology: /27.
- **SchemeAndStackFoundations parts.**
  - --SF.0: /11.
  - --SF.1: /1.
  - --SF.2: /18.
  - --SF.3: /8 and /18.
  - --SF.4: /16 and /17.
  - --SF.5: /15.
  - --SF.6: /31.
- **Shimura and Tropical.**
  - BP-ShimuraCompactifications--C0~2: /3, /27 and /34.
  - BP-ShimuraVarieties--V0~2: /3 and /28.
  - BP-TropicalAndBerkovichArithmetic: /24 and /25.

For BP-SchemeAndStackFoundations--SF.4, the owner question is now settled in the packet it extends. The open
point is the order of imports: StableReductionPartII MC.2 now, and MC.4 only after the SF.5 rescope.

Two further jobs touch these findings, though the prompt does not list them:

- BP-AlgebraicModuliForArithmeticGeometry--R09.5: its coverage now leaves the stable-curve coarse space and
  projective covers to StableReductionPartII MC.4 (/17).
- BP-PadicDifferentialEquationsAndRigidCohomology: retarget RD.5's request for de Jong's alterations from
  AdicCoefficients L5 to SF.4, and drop that packet's proposal to make L5 the owner (/16 with RT-AREA-etale/21).

## For the maintainer

Round 1's maintainer notes still stand, except where this round changes them below. They concern atlas edges,
paper routes, AUDIT-01 wording, external records and Tau Ceti documents. This round adds or changes these:

- **/15, /16, /17.** These edge changes are the SF packet's new rescope entry:
  - replace SF.4 → SF.5 by SF.3 → SF.5 and R09.1 → SF.5;
  - delete the forwarding links R11.1, R11.3 and StableReduction Layers 7–9 → SF.5;
  - add SF.4 → AdicCoefficientsAndComparisons L5, SF.4 → PadicDifferentialEquationsAndRigidCohomology RD.5 and
    StableReductionPartII MC.2 → SF.4;
  - add StableReductionPartII MC.4 → SF.4 once SF.4 → SF.5 is gone.

  Checked against the atlas stage edges and `requires` together with the roadmap definitions in
  `research/blueprint/roadmaps/`, these edges are acyclic. The stage-level graph of all research packets,
  reviewed or not, has a longer path from SF.4 through PrismaticCohomology PR.1 to PELModuli M6 and so to
  MC.4. That path should be checked again as those packets are reviewed. Round 1's recommendation of R09.4/R09.5
  as owner for /17 is superseded by the StableReductionPartII key. StableReductionPartII MC.4 also has to extend
  its projective cover to n ≥ 3 marked points in every genus, for de Jong's 2.24.
- **/2.** The A0-extension packet proposes the prefix R09.6:approximation (SF.0 → R09.6:approximation →
  A0-extension → R09.6), superseding RS-27's remark that no prefix is needed; the paper items recorded at R09.6
  for approximation then point at the prefix. Neither A0-extension nor R09.6 reaches SF.0 in the atlas and
  roadmap definitions or in the research-packet graph, so the order is acyclic.
- **/23.** Add R11.1, R11.3, R11.4 and JacobianChallenge Layer D → StableReduction Layer 7, and state the
  criterion with R11.1's excellent-DVR hypothesis. The NeronModels packet records this as an upstream note.
  - In the atlas and roadmap definitions these edges are acyclic.
  - The stage-level research graph has a long path from Layer 7 through R11.6 back to R11.3, so the edge should
    attach to the criterion at node level.
- **/6.** No supplier of projective morphisms is linked into AlgebraicCurves Layer 12. The projective-morphism
  package is StableReduction Layer 2's under RS-25, and both are Tau Ceti roadmaps, so this is for upstream.
- **/20.** The supplier of contract J-E's torsion statement is AbelianSchemes A3 applied to Pic⁰. This goes
  upstream, together with the edge A3 → StableReduction Layer 6. The prompt does not hand /20 to
  BP-AbelianSchemesAndArithmeticModuli, so its A3 side stays a maintainer note.
- **/4.** The superseded SCV/Kähler design (`research/blueprint/roadmaps/SeveralComplexVariablesKahlerGeometry.json`,
  draft) planned compact Kähler Hodge theory at CV.5. Its design job is superseded, so the packets here do not
  cite it. If the maintainer revives it, it is the natural analytic input of the /4 layer.

## Sources read in this round

- **de Jong**, "Smoothness, semi-stability and alterations", Publ. Math. IHÉS 83 (1996).
  - URL: http://www.numdam.org/item/PMIHES_1996__83__51_0.pdf, read 9 October 2026.
  - SHA-256: `9e4e7dab2525e9a0fb0820752434c5a168914873b6118f5a967fcccae257ffb7`.
  - Read for the numbering of 2.20, 2.24, Theorem 4.1, Remark 4.2, Theorem 5.8 and Theorem 6.5, and for the
    construction in 2.24: n ≥ 3 marked points, level-ℓ Jacobian covers and normalisation, with projectivity cited
    from Deligne's "Le lemme de Gabber" and Knudsen as the general reference.
- **Tate**, "Algorithm for determining the type of a singular fiber in an elliptic pencil", LNM 476 (1975).
  - URL: https://wstein.org/Tables/antwerp/tate/tate.pdf, read 9 October 2026.
  - SHA-256: `8650805838f84ad1bc9afa169b1797bd345fb7d9ea4628cdf995c83a10aaccfc`, the same file the NeronModels
    packet cites.
  - Read: the §6 table, printed p. 46, for the component counts and the position of the characteristic line.

## Checks

- `python3 scripts/check_blueprint.py <packet> --index <pinned declarations.tsv>` reports 0 errors and 0 warnings
  for all eleven packets, before and after the edits.
- Every packet keeps its formatting (indent 1 or 2, UTF-8): each file was checked to round-trip exactly through
  the JSON writer before it was edited, so the diffs show only the changes.
- The only Lean change is a comment in `suggested/NeronModelsAndSemistableAbelianVarieties.lean`. `lean-check` on
  that file (Mathlib 082e2d3 with the Tau Ceti build) elaborates it with no errors; the only warnings are the 53
  `declaration uses sorry`.
- `research/blueprint/intake.py check-files` on the fourteen changed files reports no problems.
