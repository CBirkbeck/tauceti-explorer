# RT-AREA-algebraicnt-2 — red team of the Algebraic number theory area, part 2 of 2

**Result: one finding, medium severity. Three of the four attacks came back clean, and the fourth — the machine-readable dependency graph at roadmap level — is the finding.**

Red team: Claude Code, session `cc-fb70e5`, 24 September 2026. Target: part 2 of 2 of the area *Number fields and class field theory*, seven roadmaps and **65 stages**:

| roadmap | stages | declared prerequisites |
|---|---|---|
| `…/QuadraticFormInvariants` | 18 | — |
| `…/GlobalNumberFields` | 12 | — |
| `…/GlobalQuadraticForms` | 10 | — |
| `…/NumberFieldArithmetic` | 8 | — |
| `…/PolynomialGaloisGroups` | 8 | — |
| `…/LocalFieldsRamification` | 5 | — |
| `…/Multiquadratic` | 4 | — |

No exclusion is stated on the issue. **Eligibility measured rather than assumed:** of the 43 papers this session has reviewed, none routes to any of these seven roadmaps, so there is no entanglement with my own work.

## Attack 1 — the dependency graph. **This is the finding.**

Two levels to check, and they come out differently.

**Stage level: no finding, because the atlas norm says so.** All 65 stages have `requires: []`, and all 65 carry `status: unknown`. That looks systematic until it is calibrated: 669 of 1962 atlas stages (34%) have empty `requires` and 656 (33%) carry `status: unknown`. 65/65 sits at the high end of a wide, populated distribution, and — as in the Representation theory area — these stages declare no stage-level prerequisites in prose either, so there is no mismatch between prose and field to report. Nothing here.

**Roadmap level: a finding.** All seven declare `prerequisites: []`, so the atlas records this area as seven mutually independent roadmaps with no build order. Their own prose states three dependencies among them, and one is at declaration level.

Direction is the whole game in this attack, and I established it from the sentence in every case rather than assuming that a citation means a dependency — the discipline that saved me from a bad finding in the Representation theory area, where three roadmaps citing `CharacterTheory` turned out to be naming a consumer. Four pairs here carry citations. **Three run backwards and are genuine dependencies:**

1. **QuadraticFormInvariants → LocalFieldsRamification.** Sublayer 6A is titled "The local-field substrate, consumed", and says: "The general arithmetic of a nonarchimedean local field belongs to the [local-fields-ramification roadmap](../LocalFieldsRamification/README.md), and **this sublayer consumes it**. The normalized valuation is that roadmap's `normalizedValuation`…".
2. **NumberFieldArithmetic → LocalFieldsRamification.** Layer 5 cites "[the Local Fields and Ramification roadmap](../LocalFieldsRamification/README.md) for the precise `ValuativeExtension` contract **consumed below**", and elsewhere: "**Every use** of the local API of [the Local Fields and Ramification roadmap] is through this instance".
3. **GlobalNumberFields → NumberFieldArithmetic**, at declaration level: "Define `idealsPrimeTo 𝔪` as the **reducible abbreviation of** `NumberFieldArithmetic.idealsAway 𝔪.support`, and `integralIdealsPrimeTo 𝔪` as the reducible abbreviation of `NumberFieldArithmetic.integralIdealsAway 𝔪.support`." A roadmap whose objects are abbreviations of another roadmap's declarations cannot be elaborated before it.

**Two citations run forwards and are correctly not dependencies:** QuadraticFormInvariants naming GlobalQuadraticForms ("the resulting frozen declaration `hilbertSymbol_productFormula` **is an export to** `GlobalQuadraticForms`"), and LocalFieldsRamification naming NumberFieldArithmetic ("This is a local theorem: [the Number-Field Arithmetic roadmap] **consumes it** only after passing to a completion"). The second matters: it resolves what looks like a mutual dependency between those two roadmaps into supplier and consumer, so the fix below introduces **no cycle**.

What makes the empty lists a finding rather than a convention is calibration. **161 of 211 atlas roadmaps (76%) declare at least one prerequisite**, and 0 of these 7 do. The sibling Representation theory area shows the field is used where dependencies exist — `CharacterTheory` declares three, `SpinRepresentations` three, `QuiverRepresentations`, `LieHighestWeight` and `CompactGroups` two each. Severity **medium**: it affects build order, and any consumer that computes the area's dependency graph from the atlas gets it wrong.

## Attack 2 — the library boundary. Clean, and the reason is worth stating.

This is the head that produced the model-theory area's sharpest finding (a stage instructing a worker to construct ultraproducts and prove Łoś transfer, both of which Mathlib has), so I ran it target by target. Mathlib engagement across the seven is very uneven:

| roadmap | Mathlib mentions | named identifiers |
|---|---|---|
| NumberFieldArithmetic | 101 | 573 |
| PolynomialGaloisGroups | 77 | 353 |
| LocalFieldsRamification | 46 | 312 |
| QuadraticFormInvariants | 26 | 1092 |
| GlobalNumberFields | 13 | 118 |
| **GlobalQuadraticForms** | **2** | **240** |
| Multiquadratic | 2 | 17 |

`GlobalQuadraticForms` is exactly the shape that should be suspicious: 240 named identifiers, ten layers, and two mentions of the library it would build on. It plans places and completions with scalar extension (L0), archimedean forms and signatures (L1), finite-place invariants (L2), admissible systems of local invariants (L3), global square/norm/approximation (L4), **Hasse–Minkowski isotropy** (L5), representation and isometry (L6), existence from compatible local invariants (L7), global classification with Witt consequences (L8), worked examples (L9).

Probing the pinned tree shows the roadmap is not neglecting the library — **there is very little to consume**:

| search | files |
|---|---|
| `HasseMinkowski` / `Hasse.Minkowski` | **0** |
| `hasseInvariant` | **0** |
| `WittGroup` / `WittRing` | **0** |
| `hilbertSymbol` / `HilbertSymbol` | **0** |
| `isotropic` / `Isotropic` | 5 |
| `QuadraticForm` | 42 |

So Mathlib has the local algebra of quadratic forms and nothing of the global theory: no Hasse–Minkowski, no Hasse invariant, no Witt group or ring, no Hilbert symbol. A roadmap whose subject is precisely the global theory therefore has almost nothing to cite, and its low mention count reflects the boundary rather than a failure to check it. Consistent with this, `QuadraticFormInvariants`' references to a Hilbert symbol name `ClassFieldTheory.hilbertProductFormula` and its own exported `hilbertSymbol_productFormula` — Tau Ceti and sibling-roadmap declarations, not Mathlib ones, which matches the zero hits above. No finding, and the clean result is worth recording precisely because the sibling area failed this head.

## Attack 3 — duplication across the parts. Clean.

Part 1's roadmaps, which other red teams read in depth, are `ArithmeticGaloisDuality`, `GeometryOfNumbersAndQuadraticArithmetic`, `HigherLocalFieldsAndHigherClassFieldTheory`, `tauceti:Completed/EffectiveBounds`, `tauceti:Completed/IntegralLattices`, `…/Chebotarev` and `…/ClassFieldTheory`. Two pairs are where overlap would be expected, and both are drawn deliberately:

- **The quadratic-forms pair.** `QuadraticFormInvariants` and `GlobalQuadraticForms` against part 1's `GeometryOfNumbersAndQuadraticArithmetic` and `IntegralLattices`. The division is by object and not by theorem: the part-2 pair is about forms over fields — cohomological invariants, local invariants at places, Hasse–Minkowski — while part 1's are about lattices over ℤ and the geometry of numbers, discriminant forms and overlattices. The one genuine interface, the Hilbert symbol's product formula, is handled by an explicit export rather than restated on both sides ("is an export to `GlobalQuadraticForms`").
- **The class-field pair.** `GlobalNumberFields` (ray classes, adeles, Hecke characters) against part 1's `ClassFieldTheory`, with `Chebotarev` adjacent. `QuadraticFormInvariants` consumes `ClassFieldTheory.hilbertProductFormula` by name rather than planning it, which is the correct direction of reuse across the part boundary.

No pair states the same target, and no restructuring proposal is needed for any of them.

## Attack 4 — omissions. Clean at the granularity I checked.

The seven cover the local theory (`LocalFieldsRamification`), the global arithmetic of a number field and its LMFDB invariants (`NumberFieldArithmetic`), the adelic and ray-class layer (`GlobalNumberFields`), polynomial Galois groups, genus theory for multiquadratic fields, and quadratic forms both cohomologically and globally. The candidate omissions I tested were the global quadratic-form theory itself — planned, as Attack 2 shows in detail — and the local substrate the two consumers need, which `LocalFieldsRamification` owns and both cite by declaration name. Nothing the area's targets use is left unplanned and unavailable.

§17 asks for this head against "the papers routed to it" as well, so I established at route granularity whether there are any. **There are none:** across all 207 paper result files in the blueprint, **0 routes** name any of the seven as their `roadmap`. Worth recording how nearly I got this wrong. A substring scan returned 31 to 49 matching files *per roadmap*, which reads as heavy routing; every one of those matches sits in a paper's `examined` record or prose — the roadmap considered as a destination and rejected — and not one is a route. Had I trusted the scan I would have reported paper-driven needs that do not exist. So the omissions head here could be run only against the roadmaps' own targets, and this red team makes no claim about paper needs.

## What this red team did not do

I did not re-derive the mathematics of any stage. Omissions were checked at layer granularity against the seven roadmap documents and their stage descriptions, not target by target against the whole literature, and duplication across the parts was checked by reading part 1's layer titles and descriptions rather than their full documents. The library probe was run against the tree available to me rather than the pinned `082e2d3`; the four zero results are absences of whole subjects, which no line drift between commits could account for, but a verifier should know which tree produced them. I did not check papers for needs the layers miss, because none routes here — established above rather than assumed.
