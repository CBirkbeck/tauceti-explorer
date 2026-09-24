# RT-AREA-modeltheory

Red team against the **Model theory** area, whose single roadmap is
`LogicAndDefinabilityInNumberTheory` — *Logic, definability, valued fields and motivic
integration* — seven layers, LD.0 to LD.6.

Two findings, both medium.

## Findings

### 1. Three layers declare a prerequisite that is recorded nowhere and resolves to nothing

LD.0's `**Inputs.**` is `FoundationsAndLibraryIntegration:LI.0`. LD.1's include
`FoundationsAndLibraryIntegration:LI.4`, LD.2's include
`FoundationsAndLibraryIntegration:LI.2`. **None of the three appears in that stage's
`requires` field**, and `FoundationsAndLibraryIntegration` is not in the atlas at all —
absent from `research/blueprint/atlas/index.json`, from the roadmap extracts, and from
`research/blueprint/roadmaps/`.

That the mismatch is a defect and not a convention is clear from the other four layers:
LD.3, LD.4, LD.5 and LD.6 have identical prose Inputs and `requires`. And everything else
in the roadmap resolves — every other stage id, its four roadmap-level prerequisites, and
its consumer `AnalyticNumberTheory`.

The effect is worst at LD.0, the base layer: its only declared input is unresolvable, and
because `requires` is empty the atlas graph shows LD.0 with **no** prerequisites, which is
not what the layer says.

The roadmap is not fictional — `content/campaign/FoundationsAndLibraryIntegration/README.md`
exists, with sections LI.0 "Pinned libraries and declarations" through LI.5. And the gap is
wider than this area: **23 atlas roadmaps cite its stages 41 times** in their stage prose.
So the repair here is an area-level statement of a programme-level problem, and the fix
says so: add the inputs to `requires` once they can be resolved, which needs the roadmap
either given an atlas record or its 41 citations rewritten to name whatever owns that
content.

### 2. LD.0 plans to build what Mathlib already has

LD.0 says: "integrate model-theory foundations from Mathlib where available. **Construct
ultraproducts and prove the needed Łoś transfer theorem**".

At Mathlib `082e2d3`, `Mathlib/ModelTheory/Ultraproducts.lean` is headed
"# Ultraproducts and Łoś's Theorem" and declares `Ultraproduct.setoidPrestructure` (49), the
ultraproduct structure (74), `funMap_cast` (77), `term_realize_cast` (82),
`boundedFormula_realize_cast` (95), `realize_formula_cast` (146) and `sentence_realize`
(154) — the last with the docstring "**Łoś's Theorem**: A sentence is true in an
ultraproduct if and only if the set of structures it is true in is in the ultrafilter" and
the statement `(u : Filter α).Product M ⊨ φ ↔ ∀ᶠ a : α in u, M a ⊨ φ`. The file's own Main
Results section names it. Around it sit 1238 declarations under `FirstOrder.Language`.

A worker following LD.0 as written would rebuild them. The fix is one clause: import
Mathlib's construction and Łoś, and keep for LD.0 what Mathlib does not supply and the
layer already names — the valued-field languages, the interpretation of arithmetic fields,
and the elementary-extension and standard-part interface for nonstandard arithmetic.

This is the **only** clause of the roadmap that is out of date. Everything else the seven
layers plan is genuinely absent from both libraries.

## What held

**The libraries, checked against every notion the layers plan.** Absent at the pin, and so
rightly planned: o-minimal structures and cell decomposition, Ax–Kochen–Ershov and
Denef–Pas, motivic integration, Pila–Wilkie and Pila–Zannier, André–Oort and Zilber–Pink,
MRDP and Hilbert's tenth problem, angular components. Partly present and correctly
described as something to develop: henselianity, where Tau Ceti has `HenselianRing` and
`henselianLocalRing_integer` but not LD.1's elimination results.

*A note on method, since it nearly cost me the finding above.* My first sweep used `\|` as
alternation under `grep -E`, which matches a literal pipe, so every multi-pattern search
returned zero and the libraries looked empty. Re-run correctly, ultraproducts turned out to
be present. Nothing in this report rests on the broken pass.

**The four Part II proposals routed off this roadmap all obey section 15.** Each title is an
exact prefix extension of the parent's atlas title: `HilbertTenthProblemOverRingsOfIntegers`
(PAPER-ALPOGE-BHARGAVA-SHNIDMAN-26), `EffectivePointCountingOnFoliations`
(PAPER-BINYAMINI-22), `FinitelyGeneratedFieldDefinability` (PAPER-DITTMANN-POP-23) and
`LogicAndDefinabilityPartII` (PAPER-MOK-PILA-TSIMERMAN-19). Four Part IIs for one parent is
not duplication — they run in four different directions.

**Nothing in the area is planned twice.** I swept the whole atlas for the eight concepts
this area could plausibly share. Four occur in no other roadmap. The four that do were read,
and none duplicates: `DiophantineApproximationAndTranscendence:DT.5` says it *coordinates*
"unlikely intersections with RP" rather than owning them; `ArithmeticDynamics:DY.6` is
dynamical Mordell–Lang in its own setting; `PotentialAutomorphyInfrastructure:PA.4` fixes a
nonprincipal ultrafilter to run Taylor–Wiles ultrapatching, consuming ultraproducts rather
than building them; and the `IgusaVarieties` and `GeometricTopology` hits are search false
positives.

**Prerequisite structure otherwise.** Every stage-level `requires` entry resolves; the
roadmap's four prerequisites and its consumer exist; 13 stage edges are recorded.

**No restructuring proposal resolves either finding**, though two name the roadmap — RS-08
and RS-25, each only as the *target* of forwarded supplier links into LD.3 and LD.6,
recorded as section 15 forwardings of inherited interfaces. Neither has a `layers` entry for
any stage here, and neither mentions `FoundationsAndLibraryIntegration` or ultraproducts.

## What I did not do

No Lean was compiled and nothing here is formalised. Declarations were read at the pinned
commits, in the source where a finding turned on what a statement says. I read the sixteen
paper routes that reach this area for what they propose, not to re-audit the extractions
themselves.
