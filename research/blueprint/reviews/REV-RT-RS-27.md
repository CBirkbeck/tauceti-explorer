# Independent verification of RT-RS-27

Codex, session `codex-J6LwjP`, 2026-09-30. Refs #5118.
Input checkout: `13a13e0e174271d565d6707674d19a4fb84ae25f`.

All four findings are confirmed: three high, one medium. Their repairs need
the qualifications below. I did none of RS-27 (Claude Code `cc-fb70e5`),
REV-RS-27 (`cc-58621d`) or RT-RS-27 (Codex `codex-rtOQ9t`). This verifies the
four findings; it does not repeat the red team's full family/consumer audit.

## 1. Quasi-coherent module descent was omitted

Confirmed. The original R09.3 text's sheaf-descent promise is disambiguated by
its reviewed AUDIT-01 target, effective descent for quasi-coherent sheaves.
ComplexComparisonPartII's request to R09.3 requires coherent descent through
étale presentations for proper algebraic spaces. The narrowed `keeps` instead
names fppf sheaves represented by algebraic spaces and polarized-object
descent. Neither is the required module-category equivalence.

I read MC 0E's enumerated effective scheme/object cases, 1E's elliptic
application, and SR Layer 2's graded-section-algebra/relative-Proj descent.
These do not provide the omitted general module export. Descent of the
graded algebra in the polarized argument is a use of module descent, not
an explicit replacement for that export.

[Stacks 023T](https://stacks.math.columbia.edu/tag/023T), read 2026-09-30,
states effectivity and full faithfulness for quasi-coherent modules under an
fpqc scheme covering. The C3 algebraic-space extension and the restrictions
to coherent modules still need their own stated hypotheses and comparisons.
Do not identify coherence with finite presentation over arbitrary bases.

The pinned `comonadicExtendScalars` is a narrower existing input: for
commutative rings and a faithfully flat ring homomorphism f, it proves
`ComonadicLeftAdjoint (extendScalars f)`. The file's introduction explicitly
leaves the module-pseudofunctor descent consequence as a TODO. Import that
comonadic theorem and build its descent-data comparison, scheme gluing and
required space extension once. Restore the explicit R09.3/C3 supply, choosing
its foundation owner consistently with finding 4. RT-AUDIT-01/16 is prior
evidence for this exact consumer contract, not a competing new theorem.

## 2. Specific applications occur before their objects

Confirmed. R09.4 retains algebraicity of generalized-elliptic and
polarized-abelian stacks; R09.5 retains their auxiliary levels. R13.1 defines
the generalized elliptic objects, yet imports R09.5. Abelian A1 lies after
A0, which imports R09.1–R09.6. The necessary object imports into R09.4
would close the cycles below. These are missing semantic dependencies:
the currently encoded graph itself is acyclic.

Keep general conditional criteria upstream and perform the actual
generalized-elliptic applications in R13.2/R13.4a and the PEL applications
in M1/M2/M6. The existing elliptic-anchor compatibility stays upstream.
An alternative retaining an AM application requires a separate downstream
node, not a backward import into the whole R09.4 layer. Apply the same
producer/application distinction to the relevant R09.6 and A0-extension
wording; no required application should simply disappear.

One detail of the red team's shorthand needs correction. Polarizations are
defined in **A2**; A3 provides torsion/isogenies/pairings, A4 the realizations
and deformation comparison. The actual PEL level datum is in **M1**, with
rigidification and representability in **M2**. Route through these actual
owners, not an asserted A4 level-structure construction. A6 already assigns
polarized moduli to PELModuli; M6 extends the arbitrary-level export.

A0-extension's obligation to verify the criterion in every PEL application
duplicates M2/H1. The abelian A0 contract explicitly leaves specific checks
to the consuming milestone. RT-AUDIT-01/5 already records this boundary.
This finding concerns the still-retained RS-27 wording.

## 3. Assign the Artin criterion's supplier

Confirmed as a missing supplier boundary. A0-extension explicitly owns the
selected Artin criterion. R09.6 allows either a proof or an assigned supplier,
but RS-27 supplies it only MC 7B/7D, the elliptic completed-local-ring and
universal-deformation comparisons. I read those anchor blocks; they do not
state a general Artin criterion.

Add the exact A0-extension export to R09.6's `suppliedBy`, owner and link
records and make R09.6 consume it. Preserve the AdicSpacesPartII F0/R3
imports for formal geometry. If the criterion needs deformation-theoretic
material currently inside R09.6, separate that prefix first; a mutual import
of the whole layers would be wrong. The proposed forward edge is acyclic
in the checked graph. RT-AUDIT-01/6 and its fixes report already specify
this assignment; RS-27 has not incorporated it. Absence of a graph edge
alone would not establish two mandatory independent proofs.

## 4. Resolve the foundation overlaps

Confirmed. The accepted RS-25 `SF.1` keeps algebraic-space quotients,
representable diagonals and atlas independence. Accepted RS-05 `D0` keeps
ordinary stackification and groupoid quotients. RS-27 nevertheless retains
these constructions in R09.3/R09.4, and its 17 owners resolve only the anchor
overlaps. No foundation owner or forwarding import settles these pairs.

The existing repair recommendation is suitable: D0 owns ordinary site-level
stackification/groupoid constructions; SF.1 owns the coordinated algebraic
space/atlas foundations; AM imports them and retains its extra comparisons
and appropriately placed applications. Keep one carrier and one general
theorem per interface. In particular, pinned `Pseudofunctor.IsStack` already
defines the stack property for category-valued pseudofunctors; fibres are
not required to be groupoids. Its `isEquivalence_toDescentData` and
`IsStack.of_isStackFor` are existing interfaces, not missing foundations.
Algebraic atlases and stackification must extend the chosen existing model.

RT-AREA-algebraicgeometry/1 and /39 already confirm these overlaps, and the
area-fix report recommends SF.1 forwarding for /1. This is an unresolved
binding RS-27 contract, not a new discovery or authorization to edit
upstream Tau Ceti roadmaps. Coordinate that earlier handoff when applying
the fix. A different single owner would require explicit complementary
changes in the other foundation contracts.

## Independent graph check

Fresh `scripts.build.assemble(require_distances=False)` gave 2,907 stages
and 8,322 stage edges. Including every RS-27 link and all edge endpoints
gave 2,960 vertices and an acyclic graph. I reproduced these cycles by
adding one missing object import at a time:

```text
R09.4 → R09.5 → ModularCurvesPartII:R13.1 → R09.4
R09.4 → AbelianSchemesAndArithmeticModuli:A0 → A1 → R09.4
```

There is no path between A0-extension and R09.6 in either direction. Nor
is there a supplier path SF.1→R09.3, SF.1→R09.4 or D0→R09.4. Adding all
four recommended links together, including A0-extension→R09.6, preserves
acyclicity. This tests ordering only; it does not prove their mathematical
contracts or declare unmaterialized endpoints implemented.

Reproduction uses the atlas and proposal links as incoming predecessors:

```python
import graphlib, json, sys
sys.path.insert(0, "scripts")
from build import assemble
atlas = assemble(require_distances=False)[0]
proposal = json.load(open("research/blueprint/restructure/RS-27.result.json"))
graph = {stage["id"]: set() for stage in atlas["stages"]}
for edge in atlas["stageEdges"] + proposal["links"]:
    graph.setdefault(edge["target"], set()).add(edge["source"])
    graph.setdefault(edge["source"], set())
assert len(tuple(graphlib.TopologicalSorter(graph).static_order())) == 2960
```

For the negative tests add R13.1→R09.4 or A1→R09.4 to a fresh copy and
require `CycleError`. For the positive test add the four named foundation/
Artin links together and require topological sorting to succeed.

## Evidence boundaries and validation

I read the four full findings and their cited RS-27 layer/owner/link
records; the affected original AM stages; ComplexComparisonPartII's C3
request; the named MC/SR blocks; the relevant R13, abelian, PEL and H1
stages; SF.1/D0 and their accepted RS-25/RS-05 contracts; and the earlier
audit/area verdicts and relevant fixes. The seven campaign roadmap extracts
read were checked to match the corresponding actual README text.

The reviewed AUDIT-01 entries for R09.3/R09.4/R09.6/A0-extension were read.
I inspected the actual pinned declarations at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174`:

* [ModuleCat/Descent.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Category/ModuleCat/Descent.lean),
  `comonadicExtendScalars`, line 59, including its section hypotheses and TODO.
* [Sites/Descent/IsStack.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Sites/Descent/IsStack.lean),
  `IsStack`, line 49, and the descent-equivalence/constructor lemmas.

Tau Ceti's baseline was verified as
`f790474821cf4256814db967cb154e7af3d0c369`; no new Tau Ceti declaration
or exhaustive library-absence claim is made. I also checked
[Stacks 05YF](https://stacks.math.columbia.edu/tag/05YF), read 2026-09-30:
finite locally free restriction of scalars is represented by an algebraic
space. This supports retaining R09.3's space-valued generality; it does
not replace module descent or imply unrestricted scheme representability.

`check_restructure.py` accepts the unchanged input proposal.
`check_redteam.py` accepts the four-entry review; intake file validation
and the staged whitespace check pass. No Lean files were changed or
compiled; no build, cache download or language server was started.
