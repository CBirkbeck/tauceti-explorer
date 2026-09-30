# RT-RS-27 — red-team report

Codex, session `codex-rtOQ9t`. Refs #5119. Input commit `73a373c104ecaf22e364f5df165fb175c97fcaab`.

Complete audit: **four findings, three high and one medium**. I did not write or review RS-27. Its author was Claude Code `cc-fb70e5`; its reviewer was Claude Code `cc-58621d`.

The two principal new problems are loss of module descent in the narrowed contract and specific moduli applications sitting before their object definitions. The Artin-supplier and general-foundation overlaps were already independently confirmed elsewhere; findings /3 and /4 identify the still-unfixed **RS-27 contract**, credit those earlier findings, and do not claim independent discovery.

## Conservation and ownership checks

| Layer | Conserved/imported scope checked | Result |
|---|---|---|
| R09.1 | MC 0G Grassmannian and invariant equations; SR 2 relative Proj/ampleness; retained P(E), twists, cohomology, smoothness/Plücker, flags, boundedness, semilinear and incidence loci | Conserved. General finite-module P(E) still needs its own retained construction; the rank-one comparison with 0G applies on the locally free case. |
| R09.2 | Finite-source affine Hom from MC 0F; Grassmannians from 0G; projective Hilbert/Quot, universal-family flatness, graph Hom/Isom and Chow/dévissage | Conserved. The dual-number negative example remains explicit. |
| R09.3 | MC finite affine quotients and descent; SR polarized étale descent; general algebraic spaces, Weil restriction and polarized fppf descent | Module-descent export lost (/1); foundation duplication unresolved (/4). |
| R09.4 | MC Ell/R special case; general algebraic stacks and particular moduli applications | Specific application ordering fails (/2); foundational duplicate persists (/4). |
| R09.5 | MC 4C rigidifiers and 9D/9E coarse elliptic moduli; general coarse theorem, normalization, closure and correspondences | Correct general/special comparison, but later object/level applications must move downstream (/2). |
| R09.6 | MC 7B/7D special deformation comparisons; general versal/stabilizer comparison and formal algebraization | Artin theorem supplier remains unassigned (/3). |
| R09.7a | SR 4 Rees blowup, universal property, charts, flat base change; retained controlled transforms/marked ideals/SNC | Conserved; SR arithmetic-surface resolution is not substituted for the characteristic-zero algorithm. |
| A0-extension | SR 2 general locally Noetherian coherent base change; retained finite-presentation/Tor/perfect extension, Picard/Artin, analytification and normalization | Artin theorem ownership must be explicit (/3); application verification belongs to its consumers (/2). |
| R09.7 and R09.7b–d | Unchanged characteristic-zero invariant, termination and compactification stages | No loss found. The source’s limited functoriality is retained. |

The report says seven narrowed layers once, but the JSON correctly contains eight. I treat this as an editorial slip, not a separate finding. The 17 anchor owner records are supported in the stated scope. In particular MC 0C is scoped to affine finite locally free relations and suitable free-action scheme quotients; R09.3 must not infer unrestricted scheme quotients. MC 9A’s coarse/categorical quotients are compared with an fppf relation quotient only in the free case.

## Findings

### RT-RS-27/1 — high / missing

**Where:** research/blueprint/restructure/RS-27.result.json: layers.AlgebraicModuliForArithmeticGeometry:R09.3.keeps and suppliedBy

The narrowed contract loses effective descent for quasi-coherent modules, including coherent modules through etale presentations. Descent of fppf sheaves as algebraic spaces is a different target. Neither the retained polarized-object descent nor the listed anchor exports identifies the general module-descent equivalence. ComplexComparisonPartII C3 still requests this algebraic input from R09.3.

**Evidence:** The member README R09.3 says "Prove effective descent for the sheaves"; its reviewed library-coverage target is "Effective descent for (quasi-coherent) sheaves". ComplexComparisonPartII.json requests from R09.3 "effective descent of coherent sheaves through etale presentations for proper algebraic spaces". RS-27 instead retains "descent of fppf sheaves as algebraic spaces". ModularCurves 0E enumerates effective scheme/object classes; StableReduction Layer 2 descends a polarized scheme through its graded section algebra. Neither cited contract exports general QCoh descent. Stacks 35.5.2, https://stacks.math.columbia.edu/tag/023T (in section 023R, read 2026-09-30), specifies effectivity and full faithfulness for quasi-coherent modules. Pinned Mathlib comonadicExtendScalars, Mathlib/Algebra/Category/ModuleCat/Descent.lean:59, supplies affine module descent, not the omitted scheme/algebraic-space extension. Confirmed RT-AUDIT-01/16 already identifies C3 as a consumer of this R09.3 theorem.

**Repair:** Restore an explicit export: the equivalence between quasi-coherent modules and fpqc descent data, its functorial/base-change coherence, and coherent descent along etale presentations under the applicable finiteness hypotheses. Import the affine module theorem. Keep this export at R09.3 or name its single foundation supplier and add the forwarding edge to R09.3 and C3; do not substitute representability of sheaves of sets. Coordinate its foundation owner with finding /4.

### RT-RS-27/2 — high / error

**Where:** research/blueprint/restructure/RS-27.result.json: R09.4.keeps, R09.5.keeps, A0-extension.keeps; consumer boundaries in AbelianSchemesAndArithmeticModuli and ModularCurvesPartII

The retained specific moduli constructions require objects that the declared downstream consumers have not yet defined. R09.4 promises algebraicity of generalized-elliptic and polarized-abelian moduli, while R09.5 promises their auxiliary level. The graph currently omits the necessary object imports. Adding R13.1 -> R09.4 or A1 -> R09.4 produces a cycle. A0-extension also retains verification in every PEL application even though the application owner M2 consumes the general criterion. Keep general criteria upstream and put these specific applications after their object/level owners.

**Evidence:** RS-27 R09.4.keeps includes "algebraicity of the moduli stacks of generalised elliptic curves and polarised abelian schemes"; R09.5.keeps includes "auxiliary prime-to-characteristic level for abelian schemes and generalised elliptic curves". ModularCurvesPartII README R13.1 defines the generalized elliptic objects and imports R09.5; R13.2 constructs their actual level stacks. AbelianSchemes A0 imports R09.1-R09.6 and explicitly assigns abelian-specific verification to the consuming milestone; A1/A3/A4 supply abelian schemes/polarizations/level structure. Its A6 names PELModuli M1-M5 the sole owner of polarized moduli stacks. Fresh assembly at 73a373c has paths R09.4 -> R09.5 -> ModularCurvesPartII:R13.1 and R09.4 -> AbelianSchemesAndArithmeticModuli:A0 -> A1. Closing either path with the needed object import was checked to produce a directed cycle. Confirmed RT-AUDIT-01/5 separately assigns PEL Artin-input verification to M2/H1.

**Repair:** Narrow R09.4 to general stack/atlas and conditional representability machinery plus compatibility with the already supplied elliptic case; narrow R09.5 to the general coarse/normalization/correspondence criteria and existing elliptic rigidifiers. Assign generalized-elliptic stack algebraicity and auxiliary level to ModularCurvesPartII R13.2/R13.4a after R13.1; polarized-abelian/PEL applications to PELModuli M1/M2/M6 after the abelian object/polarization/level stages, with H1 for Hilbert-Blumenthal verification. Remove "verified in every PEL application" as a producer obligation from A0-extension. Record exact owner/forwarding contracts and preserve these applications rather than delete them. Do not repair by adding the two cycle-forming backward imports.

### RT-RS-27/3 — medium / missing

**Where:** research/blueprint/restructure/RS-27.result.json: R09.6 and A0-extension keeps/suppliedBy, owners and links

The proposal still does not assign R09.6 a supplier for the Artin representability criterion, although A0-extension explicitly owns its proof. Both narrowed keeps retain the theorem and no path links the two stages. This is a missing theorem-owner/import boundary, not a claim that the original R09.6 necessarily demanded a second independent proof. The earlier verified audit correction has not reached this binding restructuring contract.

**Evidence:** Member README A0-extension: "For the selected Artin route prove the criterion itself". R09.6 permits "a proof or an assigned supplier". RS-27 R09.6 retains "Artin representability with its hypotheses" but lists only ModularCurves 7B/7D as suppliedBy; those are elliptic deformation comparisons, not the general criterion. A0-extension.keeps retains the full Artin criterion. The assembled graph has no path in either direction between these two stages. RT-AUDIT-01.review.json verdict for /6 confirms the missing assignment and RT-AUDIT-01.fixes.md /6 explicitly proposes A0-extension as R09.6 supplier. No RS-27 owner/link implements that correction.

**Repair:** Name A0-extension as the single owner of the chosen Artin criterion; change R09.6.keeps to its applications/comparisons using that theorem, add A0-extension to suppliedBy and add A0-extension -> R09.6 with the exact theorem contract. Retain the existing AdicSpacesPartII F0/R3 imports for formal geometry. If the criterion needs a deformation prefix from R09.6, split that prefix before adding dependencies; do not introduce a mutual whole-layer import. The forward link is acyclic in the current graph.

### RT-RS-27/4 — high / duplicate

**Where:** research/blueprint/restructure/RS-27.result.json: R09.3/R09.4 keeps and owners; existing SF.1 and DiamondsAndVStacks D0 contracts

RS-27 expressly retains general algebraic-space/stack foundations and ordinary stackification at AM while accepted foundation contracts retain the same work at SchemeAndStackFoundations SF.1 and DiamondsAndVStacks D0. Its 17-owner table resolves only anchor overlaps and supplies no owner/import boundary for these live proposed-roadmap overlaps. This is an unresolved, previously confirmed conflict in the accepted RS-27 contract, not a newly discovered duplicate.

**Evidence:** RS-27 R09.3.keeps starts "Algebraic spaces: quotients by etale and fppf equivalence relations"; R09.4.keeps starts "General categories fibred in groupoids, stacks and stackification, representable diagonals, smooth and etale atlases". SF.1 README says "Construct and export" algebraic-space quotients, representable diagonals and atlas independence; accepted RS-25 retains these. DiamondsAndVStacks D0 explicitly constructs ordinary groupoid-valued prestack descent, stackification, 2-fibre products and groupoid quotients; accepted RS-05 retains ordinary stackification. Both layers are live in the fresh atlas. Confirmed RT-AREA-algebraicgeometry/1 and /39 already identify these pairs, and its fixes report recommends SF.1 -> R09.3/R09.4. RS-27 has none of those owners or links. Pinned Mathlib CategoryTheory.Pseudofunctor.IsStack (IsStack.lean:49) is an existing carrier; missing algebraicity/stackification must extend it, not create multiple replacement carriers.

**Repair:** Resolve the cross-family boundary in the proposal: use D0 for the ordinary site-level stackification/groupoid construction and one named foundational owner (the existing area-fix recommendation is SF.1) for algebraic spaces, representable diagonals and atlases. Narrow R09.3/R09.4 to the stated additional comparison, Weil-restriction, moduli-descent and application interfaces; record the owners and named imports/forwarding links. If a different single owner is chosen, coordinate the complementary SF.1/D0 correction explicitly rather than leave both construct-and-export contracts. SF.1 -> R09.3/R09.4 and D0 -> R09.4 are jointly acyclic with finding /3’s proposed link. Apply corrections only through the authorized restructuring/blueprint workflow; no upstream edits.

## Graph and consumer evidence

Fresh assembly gives 2,907 stage records and 8,322 stage edges. Including all edge endpoints gives 2,958 vertices: some pre-existing prerequisite identifiers are external/unmaterialized. The union with all 34 RS-27 links is acyclic with 2,960 vertices. Thirty-two proposal links are present; the two MC 0G → LV.3/LV.7 links remain deferred because the designed MordellLawrenceVenkatesh roadmap is not yet promoted. A topological check including these endpoints passes; this is not a claim that every external dependency is implemented.

The review’s three extra forwarding links are present: SR 2 → R09.2, MC 1E → R09.4, SR 4 → R09.7b. All 30 distinct external consumer stages of AM were read. Twelve packets contain explicit AM requests; these include requests from unpromoted stages, so graph-only inspection would be insufficient. P(E) and Serre/regularity inputs remain at R09.1 for the GAGA and K-theory consumers; the precise Serre statements in their requests must remain part of its blueprint. The blowup and Grassmannian requests still have forwarding supplier paths.

The graph check does not validate the missing mathematical imports. In /2 the required extra object edges would close these paths:

```text
R09.4 → R09.5 → ModularCurvesPartII:R13.1 → R09.4
R09.4 → AbelianSchemesAndArithmeticModuli:A0 → A1 → R09.4
```

These are **synthetic cycles after adding required object imports**, not cycles already encoded in the atlas. Keeping general conditional criteria in AM and performing the applications after R13.1/A1 breaks the semantic circularity. Existing polarized-level constructions should not be recreated upstream.

Reproduction from the audited commit (read-only, no build/cache commands):

```python
import graphlib, json, sys
sys.path.insert(0, "scripts")
from build import assemble
a = assemble(require_distances=False)[0]
p = json.load(open("research/blueprint/restructure/RS-27.result.json"))
g = {s["id"]: set() for s in a["stages"]}
for e in a["stageEdges"] + p["links"]:
    g.setdefault(e["target"], set()).add(e["source"])
    g.setdefault(e["source"], set())
assert len(tuple(graphlib.TopologicalSorter(g).static_order())) == 2960
for source in ("ModularCurvesPartII:R13.1",
               "AbelianSchemesAndArithmeticModuli:A1"):
    test = {k: set(v) for k, v in g.items()}
    test["AlgebraicModuliForArithmeticGeometry:R09.4"].add(source)
    try:
        tuple(graphlib.TopologicalSorter(test).static_order())
    except graphlib.CycleError as err:
        print(err.args[1])
    else:
        raise AssertionError("Expected application cycle")
repairs = [
    ("SchemeAndStackFoundations:SF.1", "AlgebraicModuliForArithmeticGeometry:R09.3"),
    ("SchemeAndStackFoundations:SF.1", "AlgebraicModuliForArithmeticGeometry:R09.4"),
    ("DiamondsAndVStacks:D0", "AlgebraicModuliForArithmeticGeometry:R09.4"),
    ("AlgebraicModuliForArithmeticGeometry:A0-extension",
     "AlgebraicModuliForArithmeticGeometry:R09.6"),
]
for source, target in repairs:
    g[target].add(source)
assert len(tuple(graphlib.TopologicalSorter(g).static_order())) == 2960
```

## Source and library checks

The reviewed library audit was read for all eight changed layers. At Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, I read:

- `Module.Grassmannian` and `Module.Grassmannian.functor` in `Mathlib/RingTheory/Grassmannian.lean`, including the explicit representability TODO. This supports importing the existing quotient functor and planning its scheme realization once.
- `CategoryTheory.Pseudofunctor.IsStack`, `isEquivalence_toDescentData`, and `IsStack.of_isStackFor` in `Mathlib/CategoryTheory/Sites/Descent/IsStack.lean`. These already supply a stack predicate and general descent-equivalence API, not algebraic atlases or stackification.
- Global `comonadicExtendScalars` in `Mathlib/Algebra/Category/ModuleCat/Descent.lean:59`, with assumption `f.FaithfullyFlat` and result `ComonadicLeftAdjoint (extendScalars f)`. This is the affine module input to /1.

Tau Ceti pin `f790474821cf4256814db967cb154e7af3d0c369` is recorded for reproducibility; this report makes no new Tau Ceti declaration or library-absence claim. No Lean file is changed and no Lean compiler, Lake cache or language server was run.

Primary statements read on 30 September 2026: [Stacks 35.5, especially Proposition 35.5.2](https://stacks.math.columbia.edu/tag/023R) supplies effective quasi-coherent-module descent with full faithfulness; [Stacks 05YF](https://stacks.math.columbia.edu/tag/05YF) supplies restriction of scalars as an algebraic space along a finite locally free morphism. The latter confirms the retained space-valued generality; it does not imply arbitrary scheme representability or preservation of properness.

The earlier verified reports matter to interpreting the result. RS-27 repairs the anchor overlaps described by RT-AREA-algebraicgeometry /10, /12, /13, /14 and /40. It does not implement that report’s /1 and /39 ownership boundaries, or RT-AUDIT-01 /5–6’s producer/application and criterion-supplier boundaries. Its /16 confirms the module-descent supplier/consumer contract used in finding /1. These are cited as prior evidence, not reissued as discoveries.

## Scope and validation

- All 28 family evidence records, the accepted proposal/report and independent review, all 17 owner records, nine layer decisions (eight narrowed), and all 34 links.

- The member README and all 12 stages; target-by-target conservation for R09.1-R09.6, R09.7a and A0-extension, with R09.7/R09.7b-d retained.

- The full relevant anchor blocks: ModularCurves 0C, 0E, 0F, 0G, 1E, 4A, 4C, 7B, 7D, 9A, 9D, 9E; StableReduction Layers 2 and 4 and its moduli boundary. The long anchor documents were read selectively at these blocks, not represented as full-cover audits.

- All 30 distinct external consumer stages in the fresh assembled graph and AM requests in 12 blueprint packets, including designed-but-not-promoted MordellLawrenceVenkatesh, the Chow/GAGA consumers, S.5 blowups and L7 Grassmannians.

- Fresh assemble(require_distances=False) at 73a373c104ecaf22e364f5df165fb175c97fcaab: 2907 stage records, 8322 stage edges, 2958 graph endpoint vertices; all edges plus the two deferred LV links are acyclic (2960 vertices). Of 34 proposal links, 32 are live and two deferred for absent LV stages.

- Synthetic dependency tests reproduced two specific-moduli cycles; the four proposed foundation/Artin repair links were tested jointly and are acyclic. No claim that the currently encoded graph itself contains those cycles.

- Reviewed library coverage for every changed AM layer; pinned Mathlib Module.Grassmannian and its functor, CategoryTheory.Pseudofunctor.IsStack and comonadicExtendScalars read in their source files. No exhaustive new library-absence claim.

- Existing confirmed RT-AREA-algebraicgeometry and RT-AUDIT-01 findings and fixes were compared, distinguishing repairs already implemented by RS-27 from remaining conflicts. No re-review of their authors’ findings is claimed.

- Stacks 023R/023T and 05YF primary statements, read 2026-09-30; finite locally free Weil restriction correctly exports an algebraic space, not an unrestricted scheme or properness theorem.

- The proposal mutates no Tau Ceti roadmap/layer and adds no upstream-to-upstream links; no upstream edits or new upstream findings.


Checks: `check_restructure.py` on the accepted input; `check_redteam.py` on this result; intake `check-files` on both deliverables; staged whitespace check. No upstream-to-upstream link or upstream roadmap is changed. No mathematical source erratum is asserted.

## Input SHA-256 fingerprints

| Input | SHA-256 |
|---|---|

| `research/blueprint/restructure/RS-27.result.json` | `b9139d1012b7d39c1c7f5d630f2d231c3387a3ae247e14966966c6ab9e72bdf2` |

| `research/blueprint/restructure/RS-27.json` | `0015a98ceef6351187d00af34bee6f803a297890414405e58e054571a7bc6179` |

| `research/blueprint/restructure/RS-27.md` | `2be241cf63366dcb5c30a7a8b17e203257258aba6ed88e6f10bfa466f98ec1ed` |

| `research/blueprint/reviews/REV-RS-27.md` | `b46664cb01d7890d66c1351418c95b9f168c8dcfc5bcf367fdfd2f80c0f5fc5d` |

| `content/campaign/AlgebraicModuliForArithmeticGeometry/README.md` | `a137c6fcec0a00edaca46278b6212d97255fa43230f3fef239a13b24793bc3b4` |

| `content/tau-ceti/ModularCurves/README.md` | `18da17ea4e8b66b9cfc2a2227f99b5c5aeae4ecb52afd97cbccd72ed29c2e2e6` |

| `content/tau-ceti/StableReduction/README.md` | `bba0dac4b46eddafe48fa25fdd78b4816147698d0fb8223050d3ea3fb4cdaf73` |
