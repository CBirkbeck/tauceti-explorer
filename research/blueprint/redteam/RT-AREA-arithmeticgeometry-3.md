# RT-AREA-arithmeticgeometry-3 — red team of Curves, abelian varieties and Shimura varieties, part 3 of 3

**Result: one finding, high. Twelve roadmaps depend on a 58-stage roadmap through a pull-request number that cannot be resolved from the atlas, and not one of them — nor the roadmap itself — records the dependency.**

Red team: Claude Code, session `cc-fb70e5`, 24 September 2026. Target: part 3 of 3, **5 roadmaps, 111 stages, 4 paper routes**.

| roadmap | stages | routes | prereq | consumers | lifecycle | audit verdicts |
|---|---|---|---|---|---|---|
| `tauceti:…/ModularCurves` | **58** | 0 | **0** | **0** | active | 21 partly, 37 not |
| `ModularCurvesPartII` | 20 | 4 | 9 | 19 | proposed | 1 partly, 18 not, 1 process |
| `tauceti:…/BelyiMaps` | 15 | 0 | 0 | 0 | active | 6 partly, 8 not, 1 process |
| `tauceti:…/EllipticCurves` | 12 | 0 | 0 | 1 | active | 8 partly, 4 not |
| `SmallRamificationAndAbelianVarietyBaseCases` | 6 | 0 | 6 | 1 | proposed | 1 partly, 5 not |

**Eligibility measured:** none of the papers this session has reviewed routes into this part.

**Where the weight of this red team fell, stated plainly.** There are only **4 paper routes across 111 stages**, all into `ModularCurvesPartII`, so the omissions head that carried parts 1 and 2 had almost nothing to work with. I say that rather than present a thin omissions pass as a clean result. The dependency and library-boundary heads carried this job, and the first of them produced the finding.

## Attack 1 — the dependency graph. **The finding.**

### High — twelve roadmaps depend on `ModularCurves`, and nothing records it

`ModularCurves` is a 58-stage `active` roadmap ("Modular curves, following Katz–Mazur"). It declares `consumers: []`. Twelve roadmaps depend on it — and every one refers to it as **`#81`**, a pull-request number that appears **nowhere in the ModularCurves record**.

**Establishing that `#81` is that roadmap, since the whole finding turns on it.** The string appears in neither direction — `ModularCurvesPartII` never names `ModularCurves`, and `ModularCurves` never uses `#81` — so I matched them on content:

| `ModularCurvesPartII` says | `ModularCurves` has |
|---|---|
| "Use **#81's** actual affine Y₁(N), Y_full(N), fixed-pairing Y(N,ζ) and Y(ρ)" | `5a-tate-normal-form-and-y₁n`, `5b-full-ordered-bases-and-fixed-pairing`, `5c-the-twisted-curve-yρ` |
| "**Its Layer 10** compactifies only Y_H" | `layer-10-compactified-coarse-curves-over-ℤ1n-cusps-and-the-shimura-covering` |

and `ShimuraVarieties:V8` pairs the name with the number outright: "M4 and **ModularCurves #81** for the examples", "the dictionary between row-basis actions in **#81** and the adelic convention", "**PR81** Layer 10 supplies only prime N≥5 diamond quotients". The layer numbering, the named curves and the compactification scope all agree. `#81` is `tauceti:TauCetiRoadmap/ModularCurves`.

**The twelve, with reference counts (39 references in all):** `ModularCurvesPartII` 23, `ShimuraVarieties` 4, `AbelianSchemesAndArithmeticModuli` 3, then one each for `ShimuraCompactifications`, `PerfectoidShimuraVarieties`, `PELModuli`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory`, `EllipticCurveModularity`, `ComplexComparisonPartII`, `ArithmeticGaloisRepresentations`, `AlgebraicModuliForArithmeticGeometry`, `AlgebraicModularFormsAndSerreWeights`. **I checked each one's `prerequisites`: none declares `tauceti:TauCetiRoadmap/ModularCurves`**, though their declared counts run from 1 to 12.

These are genuine consumers of its content, not incidental mentions — `AbelianSchemesAndArithmeticModuli:A5` requires, for genus one, "agreement with **#81's** actual elliptic scheme, differential, and pairing"; `ShimuraVarieties:V8` consumes its Layer 10 and its row-basis dictionary.

**The sharpest case is `ModularCurvesPartII`**, which *is* that roadmap's Part II. It refers to `#81` 23 times, declares nine prerequisites — including two tauceti-origin roadmaps by id, `tauceti:TauCetiRoadmap/JacobianChallenge` and `tauceti:TauCetiRoadmap/ModularForms` — and does not declare its own parent. **A Part II that does not depend on its Part I will be scheduled wrongly by any build-order consumer.** That it declares other tauceti roadmaps by id is what makes the omission stand out rather than look like a convention.

**The calibration is internal to this area and leaves no room for a house-style explanation.** Of the three tauceti-origin `active` roadmaps here:

| roadmap | roadmaps citing it | `consumers` declared |
|---|---|---|
| `EllipticCurves` | 1 (`WeilConjectures`) | **exactly that 1** ✓ |
| `BelyiMaps` | 0 | 0 ✓ |
| `ModularCurves` | **12** | **0** ✗ |

Same origin, same lifecycle, same field, opposite behaviour.

**Why high.** A fifth of the atlas's arithmetic-geometry roadmaps depend on this one, and the dependency is invisible in every machine-readable field. The cause compounds it: an unresolvable handle means inspection will not catch it, which is presumably how twelve dependencies accumulated. The fix has two parts, and **making the reference resolvable matters more than the bookkeeping** — replace `#81`/`PR81` with the roadmap id, keeping the PR number only as provenance, and cite layers by slug.

## Attack 2 — the library boundary. Clean.

Unlike parts 1 and 2 (44–45 of 47–52 stages `not built`), this material is classical and substantially built: **36 of 111 stages are partly built** — `EllipticCurves` 8 of 12, `ModularCurves` 21 of 58, `BelyiMaps` 6 of 15. So this is the one part of the area where "plans what the library already has" was a live risk.

No stage I read instructs construction of something an audit records as built. `ModularCurves` is explicit about its source discipline — "following N. Katz and B. Mazur, *Arithmetic Moduli of Elliptic Curves* … The book is abbreviated KM, and its result numbering is used throughout" — and its Layer 0 is openly a prerequisites layer of scheme-theoretic inputs (relative effective Cartier divisors, finite locally free group schemes and Cartier duality, finite quotients and torsors, finite étale schemes and Galois actions, effective descent and spreading out) rather than a re-derivation of them.

## Attack 3 — bookkeeping of the two campaign roadmaps. Clean apart from the finding.

`ModularCurvesPartII` declares 9 prerequisites and 19 consumers; `SmallRamificationAndAbelianVarietyBaseCases` 6 and 1. For both, the set of roadmaps reached by a cross-roadmap stage `requires` edge is contained in the declared `prerequisites`. No stage edge is unrecorded — the omission in the finding is precisely of a relation that never became a stage edge, which is the same mechanism I established in part 1 of the Algebraic number theory area.

## What this red team did not do

The omissions head is weak here for want of material: 4 routes across 111 stages, so "what the routed papers need that nothing plans" was tested against almost nothing, and an omission the four routes do not raise would not have surfaced. I did not read all 58 `ModularCurves` stages in full — I read its layer structure, its summary and scope, the Layer 5 and Layer 10 content the finding turns on, and the stages the twelve references point at. Duplication was checked against parts 1 and 2, which I read for the two preceding red teams, and within this part by scope; `ModularCurves` and `ModularCurvesPartII` are complementary by construction, Part II being an identification of the algebraic curves with the analytic ones rather than a second construction. I did not verify the audit's partly-built verdicts declaration by declaration. Every library number here comes from a full Mathlib checkout of 8556 `.lean` files and the Tau Ceti tree of 5268, with the file count printed beside each result.
