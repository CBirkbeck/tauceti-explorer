# RT-AREA-algebraicnt-1 — red team of the Algebraic number theory area, part 1 of 2

**Result: two findings, both medium severity. Four heads came back clean, including a declaration-level verification of both archived roadmaps' completion claims, which hold.**

Red team: Claude Code, session `cc-fb70e5`, 24 September 2026. Target: part 1 of 2 of the area *Number fields and class field theory*, seven roadmaps and **61 stages**:

| roadmap | origin | lifecycle | stages | routes | prerequisites | consumers |
|---|---|---|---|---|---|---|
| `…/ClassFieldTheory` | tauceti | active | 15 | 0 | 0 | 6 |
| `…/Chebotarev` | tauceti | active | 14 | 0 | 0 | 4 |
| `ArithmeticGaloisDuality` | campaign | proposed | 8 | 24 | 4 | 26 |
| `HigherLocalFieldsAndHigherClassFieldTheory` | campaign | proposed | 8 | 3 | 3 | 0 |
| `GeometryOfNumbersAndQuadraticArithmetic` | campaign | proposed | 7 | 33 | 2 | 4 |
| `tauceti:Completed/IntegralLattices` | tauceti | **completed** | 5 | 0 | 0 | 0 |
| `tauceti:Completed/EffectiveBounds` | tauceti | **completed** | 4 | 0 | 0 | 0 |

**Eligibility measured, and one disclosure.** Of the papers this session has reviewed, exactly one routes here: `PAPER-NAKAMURA-23` → `ArithmeticGaloisDuality`. I reviewed that extraction but did not write it, this job's target is the area rather than that paper, and **no finding below rests on the Nakamura routing** or on any judgement I made while reviewing it.

Unlike part 2, which had none, this part carries **60 accepted paper routes**, all of kind `source`, and they concentrate hard: `GeometryOfNumbersAndQuadraticArithmetic` 33, `ArithmeticGaloisDuality` 24, `HigherLocalFields…` 3, and **0** to the four tauceti-origin roadmaps. That makes §17's "what the routed papers need that nothing plans" head runnable here, and it produced the second finding.

## Attack 1 — the dependency graph. **Finding 1.**

Two levels, and I establish the field's mechanism before using it as evidence.

**Stage level: no finding.** The area splits exactly by origin. The three campaign roadmaps carry all **38** stage `requires` edges and status `needs_source_decomposition`; the four tauceti roadmaps carry **0** and `unknown`. The same split holds at roadmap level atlas-wide — campaign roadmaps declare a prerequisite in 147 of 151 cases (**97%**), tauceti in 14 of 60 (**23%**). Empty stage edges track a roadmap's **origin, not neglect**, which is why they are not a finding in either part of this area. (This retired an argument in my own part-2 red team; the correction is in PR #2688.)

**The mechanism.** For each campaign roadmap, `prerequisites` equals or contains exactly the set of roadmaps its stages reach by a cross-roadmap `requires` edge. So the field tracks stage edges — and a reuse relation stated only in prose, which never became a stage edge, is invisible in every machine-readable field.

**Finding 1, medium.** `GeometryOfNumbersAndQuadraticArithmetic` opens its summary with:

> "**Reuse QuadraticFormInvariants, GlobalQuadraticForms and AdelicAlgebraicGroups.** General homogeneous-dynamics theorems are separate substantial source developments, not corollaries of Minkowski."

None of the three is recorded anywhere machine-readable. Its `prerequisites` is `['ClassicalArithmeticCompletion', 'GeneralAlgebraicKTheory']` — precisely the two roadmaps it reaches by a stage edge. The three named roadmaps appear in no `requires`, in none of its **15** `stageEdges`, and not on the supplier side either: `GlobalQuadraticForms.consumers` and `QuadraticFormInvariants.consumers` are both `[]`. A fourth relation is missing the same way — several accepted route reasons instruct workers to import `tauceti:Completed/IntegralLattices` ("do not re-plan the completed lattice roadmap"; "IntegralLattices' built rational discriminant/gluing…"), and that roadmap, which this red team verified below is built and sorry-free, also has `consumers: []`.

**This is not a house style, and the proof is in the same area and the same origin class.** `ArithmeticGaloisDuality` names four upstream owners in prose and says what it will not rebuild —

> "ProfiniteCohomology owns the canonical continuous cohomology object … ClassFieldTheory already owns local Tate duality for finite modules … **Neither is rebuilt here.**"

— and it declares **all four** in `prerequisites`: `ArithmeticGaloisRepresentations`, `SelmerIwasawaCohomology`, `tauceti:TauCetiRoadmap/ClassFieldTheory`, `tauceti:TauCetiRoadmap/ProfiniteCohomology`. The last two have **no stage edge whatever**, so declaring them was a deliberate act, not a by-product. And **all four reciprocate**, each listing `ArithmeticGaloisDuality` in its own `consumers`. Four for four. `HigherLocalFieldsAndHigherClassFieldTheory` passes the same test: it says "Reuse the existing symbol/norm-residue and duality owners" and declares `K2SymbolsBrauer`, `MotivicEtaleKTheory`, `SchemeAndStackFoundations`.

**Why it matters rather than being bookkeeping.** GN.2's instruction is "**Construct and export.** Integrate Witt groups, discriminants, Clifford/Hasse invariants, local classification and Hasse-Minkowski; add integral lattices, genera, spinor genera and quaternionic/hermitian variants". Witt groups, Clifford and Hasse invariants, local classification and Hasse–Minkowski are **exactly** what part 2's `GlobalQuadraticForms` and `QuadraticFormInvariants` plan. One sentence in a summary is all that stands between a worker and building them a second time — in the area's most heavily routed roadmap, holding 33 of 60 routes.

## Attack 2 — what the routed papers need that nothing plans. **Finding 2.**

**Finding 2, medium.** Five accepted extractions route the **normalized Siegel series** and its machinery into `GN.3` and nowhere else — `PAPER-FENG-YUN-ZHANG-24` (11 mentions of "Siegel series"), `LI-ZHANG-22-B` (10), `LI-ZHANG-22` (6), `LI-LIU-22` (3), `HE-LI-SHI-ETAL-23` (1). None was written or reviewed by this session. Their route reasons name the material exactly: "the normalized Siegel series `Den(X, L)` with its **functional equation** and cancellation laws"; "the normalized local Siegel series in odd and even corank, with **Ikeda's functional equations** and the induction formula"; "the **Cho–Yamauchi** weighted lattice count"; "the closed formula of Theorem 7.1 for the modified derivative of primitive densities".

GN.3's own text reads: "*Reduction, mass and theta series.* Construct reduction domains and arithmetic quotients, **local representation densities**, mass formulas and theta-series interfaces." It owns the *density* half and **never names the Siegel series** — nor its functional equation, nor the weighted lattice counts. Nor does anything else: a case-insensitive search for "Siegel series" across **both** roadmap directories returns **0 files**. The nearest neighbour, `GrossZagierAndArithmeticHeights:GZ.7`, only *consumes* the material ("derivatives of local representation densities/Whittaker functions") without owning it.

The libraries lack it too, against the real trees (Mathlib 8556 files, Tau Ceti 5268):

| search | Mathlib | Tau Ceti |
|---|---|---|
| `SiegelSeries` / `siegelSeries` | 0 | 0 |
| `representationDensity` / `localDensity` | 0 | 0 |
| `massFormula` / `genusMass` | 0 | 0 |
| `Whittaker` | 1 | 0 |

GN.3 is also the single most heavily routed stage in the area — **14 of 60 routes** — while carrying five distinct subjects. The fix is a named owner at the granularity the papers route to: split GN.3 and give the normalized Siegel series its own stage, or, given that five papers supply functional equations, corank inductions and derivative formulas, carry it in a Part II downstream of GN.2 feeding GN.3's mass formulas and GZ.7.

## Attack 3 — both archived roadmaps' completion claims. Clean, verified at declaration level.

A roadmap marked complete that the library does not support would outrank anything else here, so I checked rather than trusted — especially as several paper routes tell workers to import this material as already built.

`tauceti:Completed/EffectiveBounds` declares "**Status: declared complete by the maintainers (2026-07-02)** … This roadmap is archived" and names five declarations as landed. **All five are present in Tau Ceti**, both named directories exist, and they contain **no `sorry`**:

| claimed landed | present |
|---|---|
| `abs_discr_le_of_basis_isIntegral` | ✔ |
| `classNumber_le_bound` | ✔ |
| `units_sq_index_le` | ✔ |
| `card_ideal_absNorm_le` | ✔ |
| `ncard_setOf_finiteDimensional_abs_discr_le_le` (the Layer-2 summit) | ✔ |

`tauceti:Completed/IntegralLattices` states a criterion instead of a status — "complete only when the general APIs, all table rows, and the `D₈ ⊂ E₈` isometry have been formalized" — and it is met: `TauCeti/LinearAlgebra/IntegralLattice/` holds **38 files with no `sorry`**, including `RootLattice/D8Plus/Isometry.lean` and `Examples.lean`, with 21 files mentioning a discriminant group and 12 an overlattice. **Both markings are justified.**

**Three leads inside this head dissolved, recorded so a verifier need not repeat them.**

1. EffectiveBounds' stage descriptions read as an *open migration plan* — "the migration candidate", "**Before porting**", "the first **migration targets**", "What **is missing** is the effective side". That looked like a lifecycle contradicting the roadmap's own text. It is retained plan text in an archived roadmap whose document declares completion; no contradiction.
2. Searching `HermiteMinkowski` returned **0** files in both libraries, which looked like the summit being absent. The declaration is named `ncard_setOf_finiteDimensional_abs_discr_le_le` and is present — which is exactly why absence-by-name is not evidence.
3. `GeometricCore` and `index_powMonoidHom_two_le_of_closure` are absent from Tau Ceti, but the document names them as a file and a lemma in the **external erdos migration source**, never as landed targets. Neither is an overclaim.

## Attack 4 — duplication across the two parts. Clean, and it corrects my own part-2 report.

The quadratic-forms pair is the one at risk, and reading it from this side shows no mathematics planned twice: GN.2's distinctive content is the integral and hermitian layer — integral lattices, genera, spinor genera, quaternionic and hermitian variants — which part 2 does not plan, and the shared field theory is what GN's summary tells the worker to reuse. What is missing is only the record of that relation, which is Finding 1.

This does **correct a statement in my own part-2 red team**, where I wrote that the division across the parts is "by object and not by theorem: part 2 is forms over fields, part 1 is lattices over ℤ". GN.2 covers Hasse–Minkowski and Witt groups **over fields**, and GN.6 is Hermitian K-theory and Grothendieck–Witt groups, which is neither half. The accurate statement is that part 1 **reuses** part 2's field theory and adds the integral and hermitian layer.

The library boundary for this material, against the real trees: `QuadraticForm` in 42 Mathlib files and 158 Tau Ceti files; `HasseMinkowski`, `hasseInvariant`, `WittRing`, `WittGroup` **0 in both**; `spinorNorm`/`spinorGenus` 0 in Mathlib and **2** in Tau Ceti — the last independently confirming the premise of the `PAPER-CHENEVIER-TAIBI-20` route, which says its work is "built on Tau Ceti's spinor norm over fields".

## A tooling trap of my own, hit twice

My first library probe pointed at a `.lake/packages/mathlib/Mathlib` path inside the Tau Ceti checkout, **which does not exist there**; the second used a tree holding **one** `.lean` file. Both returned 0 for every search — false cleans that agreed with what I expected to find. Every library number above comes from a full Mathlib checkout (**8556** `.lean` files) and the Tau Ceti library tree (**5268**). Printing the tree's file count beside each result is what caught it, and it is the practice I would ask of the next red team.

## What this red team did not do

I did not re-derive the mathematics of any stage. `Chebotarev` (14 stages) and `ClassFieldTheory` (15) were read for ownership, scope and their `consumers` records, but I did not probe their library boundary stage by stage as I did for the quadratic-form material, so a duplication between them and Mathlib's class-field-theory material would not have been caught here. Omissions were tested against the routed papers and the roadmaps' own targets, not against the wider literature. The 60 route reasons were read in full, but I did not re-verify the locators inside the five Siegel-series papers — the finding rests on what those accepted extractions say they need, and on the atlas and libraries not naming it.
