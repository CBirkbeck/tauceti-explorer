# RT-AREA-representations-2 — red team of Representation theory, part 2 of 3

**Result: no findings. Five attack heads, all clean; four promising leads dissolved on inspection, and each is recorded so the clean result is checkable rather than asserted.**

Red team: Claude Code, session `cc-fb70e5`, 24 September 2026. Target: part 2 of the Representation theory area — six Tau Ceti roadmaps, **55 stages**:

| roadmap | stages | subject |
|---|---|---|
| `…/AdoIwasawa` | 10 | Ado–Iwasawa, faithful finite-dimensional Lie representations |
| `…/CharacterTheory` | 10 | character theory of finite groups, character tables |
| `…/InductionRestriction` | 10 | induction, restriction, Mackey theory |
| `…/QuiverRepresentations` | 7 | quivers, path algebras, Gabriel's theorem |
| `…/SchurWeyl` | 10 | symmetric group, Specht modules, Schur–Weyl duality |
| `…/SemisimpleAlgebras` | 8 | Artin–Wedderburn, central simple algebras, Brauer group |

**On eligibility, measured rather than assumed.** An area red team attacks the papers routed to the area as well as its roadmaps, and this session has reviewed **43** papers. I computed the entanglement of every available area red team against that set before choosing: six areas have zero, and the arithmetic-geometry areas reach thirteen. **None of my 43 reviewed papers routes to any of these six roadmaps.** I did verify `RT-AREA-representations-1` in the immediately preceding job; that is the cross-part context §17 asks a part to have, not a conflict, since parts 2 and 3 are different roadmaps.

## Attack 1 — the dependency graph. Clean.

All 55 stages have empty `requires` **and** empty `consumers`, where the sibling part records 25 `requires` edges across its 41 stages. Three checks turn this from a finding into a convention:

- **No prose `Inputs` either.** Unlike `LogicAndDefinabilityInNumberTheory:LD.0–LD.2`, where the model-theory red team rightly found prose Inputs that `requires` did not mirror, these stages declare no stage-level prerequisites in prose at all. There is no mismatch to report.
- **Prerequisites live at roadmap level**, and are present where the mathematics needs them: `CharacterTheory` declares InductionRestriction, SchurWeyl and SemisimpleAlgebras; `QuiverRepresentations` declares RootSystems and SemisimpleAlgebras.
- **Empty `requires` is atlas-normal**: 669 of 1962 stages, 34%.

Stage numbering also looked irregular and is not: `SemisimpleAlgebras`'s apparent "layer-15" between layers 1 and 2 is the slug of **Layer 1.5**, "every simple module is a minimal left ideal", and `InductionRestriction` carries Layers **3a** and **3b**. Deliberate sub-numbering.

## Attack 2 — a lead that dissolved on direction

`InductionRestriction`, `SchurWeyl` and `SemisimpleAlgebras` each cite `CharacterTheory` in their stage prose without declaring it a prerequisite. That reads as three missing prerequisites until one checks which way the arrow points: **CharacterTheory declares all three as its own prerequisites**, so those citations name a *consumer*, not a dependency. Declaring CharacterTheory would invert the dependency and create a cycle.

## Attack 3 — the library boundary. Clean, and worth stating positively.

This is the head that produced the model-theory area's sharpest finding — LD.0 instructing a worker to "Construct ultraproducts and prove the needed Los transfer theorem" when Mathlib supplies both. Classical representation theory is one of Mathlib's strongest areas, so the expected yield here was high. It is zero, because these roadmaps are unusually precise about where the library stops:

- **SemisimpleAlgebras Layer 2** opens "From `IsSemisimpleRing.exists_ringEquiv_pi_matrix_divisionRing` … pin a `WedderburnPresentation R`", and then says exactly why the library theorem does not finish the job: *"Because Mathlib's theorem is existential, this object carries arbitrary choices and is **not** the source of the invariants."* It then builds the canonical invariants intrinsically.
- **SemisimpleAlgebras Layer 6** says "**Consume** `IsBrauerEquivalent`, `Brauer.CSA_Setoid`, `BrauerGroup`. Build the **`CommGroup` structure** on `BrauerGroup K`". Mathlib's own `Mathlib/Algebra/BrauerGroup/Defs.lean` lists as its **first TODO**: *"Prove that the Brauer group is an abelian group where multiplication is defined as tensor product."* The layer plans precisely the library's open TODO — the sharpest demonstration available that the boundary is in the right place.

Confirmed present in Mathlib: `Maschke`, `IsSemisimpleRing`, Wedderburn–Artin material, `BrauerGroup`. Confirmed absent, and so correctly planned: a Specht-module file (SchurWeyl Layer 3) and a Krull–Schmidt theorem (QuiverRepresentations Layer 2).

## Attack 4 — omissions. Clean.

Brauer characters, block theory, defect groups and decomposition matrices appear **nowhere** in either roadmap directory, which looks like a gap in an area containing a character-theory roadmap. It is not this area's gap:

- The only three roadmaps matching "modular representation" — `SerreWeightAndLevelOptimisation`, `GL2ModularityLifting`, `AlgebraicModularFormsAndSerreWeights` — use the phrase in the *arithmetic* sense of a residual modular representation, and **none declares any of the six as a prerequisite**. Nothing consumes this area needing modular representation theory of finite groups.
- The area is deliberately *ordinary* theory rather than silently incomplete. `CharacterTheory` works under `char ∤ |G|` and over ℂ, proves ordinary character values lie in `ℚ(ζ_e)`, and mentions Brauer only for the **splitting-field theorem**, explicitly flagged "off the critical path". Its other use of "modular" is the modular-reduction step of the **Dixon–Schneider algorithm**, not modular representation theory.

A topic the atlas has not chosen to plan is not the same as a topic this area leaves out, and §17 asks for the latter.

## Attack 5 — duplication across the three parts. Clean.

Against the eleven roadmaps of parts 1 and 3, the highest cross-part vocabulary overlap is **0.286** (AdoIwasawa against LieHighestWeight), below the 0.33 threshold, and these are whole-roadmap scores that shared background vocabulary inflates.

The one pair worth reading rather than scoring is **SchurWeyl Layer 9** — "Schur–Weyl duality for the orthogonal and symplectic groups (the Brauer algebra)" — against part 3's **SpinRepresentations**. They are complementary by explicit design, and SpinRepresentations says so itself:

> "The spin representations are the one part of the finite-dimensional representation theory of the classical groups that **the tensor-power engine cannot reach**. Every irreducible representation of GLₙ and SLₙ is cut out of a tensor power … and so is every irreducible of Spₙ; **for the orthogonal series this is false**."

SpinRepresentations exists *because* the tensor-power engine SchurWeyl builds cannot reach it, and it declares ClassicalGroups, LieHighestWeight and RootSystems as prerequisites. The neighbouring ClassicalGroups/SchurWeyl boundary is pinned in the sources too, ClassicalGroups Layer 2 stating that "`../SchurWeyl` owns the group algebra ℂ[Sₐ], the Young symmetrizer `c_λ`, and Schur–Weyl …".

## Calibration — the `status` field

All 55 stages carry `status: unknown`. Atlas-wide that value covers **656 of 1962** stages (33%), the only other value in use being `needs_source_decomposition`; and the count of stages with empty `requires` (669) is close to the count with status `unknown` (656), consistent with both marking stages not yet decomposed. Within norms.

## What this red team did not do

I did not re-derive the mathematics of any layer, and I did not audit every one of the 55 stages against Mathlib declaration by declaration — the library head was pursued target by target on the layers where Mathlib is strongest and a collision was most likely (Maschke, Wedderburn–Artin, Brauer group, Specht modules, Krull–Schmidt). Duplication was screened at roadmap granularity by vocabulary and then read closely on the two pairs that screening and subject knowledge flagged, not stage by stage across all seventeen roadmaps of the three parts.
