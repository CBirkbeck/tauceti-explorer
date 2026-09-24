# RT-AREA-arithmeticgeometry-1 — red team of Curves, abelian varieties and Shimura varieties, part 1 of 3

**Result: one finding, medium. Four heads clean — and duplication, the head most likely to yield, is clean for a reason worth recording.**

Red team: Claude Code, session `cc-fb70e5`, 24 September 2026. Target: part 1 of 3 of the area, **7 roadmaps, 52 stages, 61 accepted paper routes**.

| roadmap | stages | routes | prereq | consumers | audit verdicts |
|---|---|---|---|---|---|
| `AbelianSchemesAndArithmeticModuli` | 7 | **25** | 5 | 21 | 2 partly, 4 not, 1 process |
| `ShimuraCompactifications` | 9 | 8 | 5 | 8 | 2 partly, 7 not |
| `ShimuraData` | 6 | 7 | 6 | 7 | 1 partly, 5 not |
| `ComplexMultiplicationAndExplicitReciprocity` | 7 | 7 | 7 | 0 | 6 not, 1 process |
| `ArakelovGeometryAndAbelianHeights` | 6 | 6 | 7 | 2 | 6 not |
| `ShimuraVarieties` | 10 | 5 | 7 | 7 | **10 not** |
| `PELModuli` | 7 | 3 | 5 | 9 | **7 not** |

**Disclosure.** One paper I reviewed routes here: `PAPER-VANHOFTEN-24` → `AbelianSchemesAndArithmeticModuli:A2, A3, A4`. I reviewed that extraction but did not write it, this job's target is the area, and **the finding below does not rest on it** — its two sources are `ANSCHUTZ-LEBRAS-23` and `FARB-KISIN-WOLFSON-24`.

## Attack 1 — duplication across five roadmaps on one subject. **Clean, and deliberately so.**

This was the head to run hardest. Five of the seven roadmaps cover a single subject — `ShimuraData` the group-theoretic input, `ShimuraVarieties` the varieties and canonical models, `ShimuraCompactifications` the toroidal boundary, `PELModuli` the moduli description, `AbelianSchemesAndArithmeticModuli` the library underneath. That is exactly the configuration in which the same theorem gets planned twice.

**Nothing is planned twice, because every summary states its own exclusions:**

- `ShimuraData` constructs Deligne's category "**without restricting it to PEL, Hodge, or abelian type**", adding that "A moduli interpretation is a theorem about particular data, **not part of this definition**".
- `ShimuraVarieties`: "**Neither** Deligne's abelian-type reduction **nor** a PEL moduli construction **is a proof for all data.**"
- `PELModuli` supplies concrete families "**without redefining a general Shimura variety to be a PEL moduli space**".
- `ShimuraCompactifications`: "Minimal characteristic-zero compactifications are already owned by V2 and V8. **This roadmap does not reconstruct them.**"

**And I verified the cross-references those disclaimers rest on**, because a scope boundary pointing at a stage that does not own the material is precisely the defect I found in the AdicSpaces link map. All three resolve:

| reference | resolves to | owns what is claimed? |
|---|---|---|
| `V2` | `ShimuraVarieties:V2` "Baily–Borel algebraicity and minimal compactification" | **yes** — constructs them |
| `V8` | `ShimuraVarieties:V8` "The algebraic tower and modular-curve comparison" | **yes** — its title does not say so, but its body instructs "**descend the minimal compactifications**" and "**Compare minimal compactifications** through ModularCurvesPartII R13.4a/R13.4b" |
| `H2` | `HilbertModularVarietiesAndShimuraCurves:H2` "Integral models at arbitrary p" | **yes** — exactly the Hilbert arbitrary-prime models PELModuli disclaims |

So "owned by V2 and V8" is exact: V2 constructs, V8 descends and compares.

## Attack 2 — omissions against the 61 routed papers. **The finding.**

### Medium — the all-degree de Rham package for abelian schemes has no owner

`A4` constructs relative `H¹_dR` with its Hodge exact sequence, Gauss–Manin connection, cup product and base change, and then limits itself:

> "**These are degree-one statements**; invoking the full Hodge or étale comparison theorem as an unnamed dependency is unnecessary."

Two routed papers depend on the higher-degree structure, and **the two routes disagree about how to obtain it** — itself evidence that no stage settles it:

> "The input this paper needs, **Berthelot–Breen–Messing 2.5.2, is the whole package**: for every k, i and j the modules H^k(X, Ω^•) and H^i(X, Ω^j) are finite locally free and commute with base change, and the canonical map **∧^\*H¹(X, Ω^•) → H^\*(X, Ω^•) is an isomorphism of algebras**. That exterior structure is what makes the prismatic Ext-sheaf of an abelian scheme finite locally free of rank 2 dim(X), and it is **the natural completion of A4's degree-one statements**." — `ANSCHUTZ-LEBRAS-23`

> "Reuse multiplication torsors, degree-one realizations and complex uniformization; **derive the exterior-algebra computation** from those and the existing comparison supplier, not from a second abelian-variety theory." — `FARB-KISIN-WOLFSON-24`

A worker reading A4 as written would produce neither. **Nothing else owns it**, checked under several descriptions:

| search (both roadmap directories) | files |
|---|---|
| `Berthelot–Breen–Messing` / `Breen–Messing` / `BBM` | **0** |
| higher de Rham / Hodge cohomology of an abelian scheme | **0** |
| a wedge or exterior power of `H¹` | **0** |
| "finite locally free and commute with base change" | **0** |
| `exterior algebra` | 3 — **none of them this statement** |

The three `exterior algebra` matches deserve naming, because dismissing them from the count alone would have been wrong: `SpinRepresentations` means the Clifford algebra of a quadratic space; `BorelRegulators` something else again; and `ComplexComparisonPartII:C5` uses "the existing Kähler differential/exterior algebra" to *construct the algebraic de Rham complex* — that is the construction of Ω^j, not the theorem that the induced map on the cohomology of an abelian scheme is an algebra isomorphism. This is the same class of trap as the three same-name collisions earlier in this session (Smyth's two theorems; Salem numbers versus Salem–Spencer sets; Heath-Brown's identity versus his large sieve), and it was settled by reading the stage.

**Fix:** name the package in A4 as an explicit extension of its degree-one scope rather than a contradiction of it, with BBM 2.5.2 as the source, and narrow A4's self-limiting sentence to what it was for — that the full Hodge or étale comparison theorem is not an unnamed dependency — so it no longer excludes what the area needs. `FARB-KISIN-WOLFSON-24`'s route supplies the proof strategy to record alongside it.

## Attack 3 — dependency bookkeeping. Clean.

All seven roadmaps declare five to seven prerequisites, and for every one the set of roadmaps reached by a cross-roadmap stage `requires` edge is **contained in** its declared `prerequisites`. No stage edge is unrecorded.

`ComplexMultiplicationAndExplicitReciprocity.consumers = []` is the shape that looked like a finding twice before. It is correct, and exactly so: the seven roadmaps citing it — `ShimuraVarieties`, `ShimuraData`, `NeronModels…`, `ModularCurvesPartII`, `AutomorphicGaloisRepresentations`, `ArithmeticGaloisRepresentations`, `AbelianSchemes…` — are **precisely its own seven declared prerequisites**, citing it as their consumer. A sink, so nothing downstream is missing.

## Attack 4 — the library boundary. Little to find, and the reason is the point.

**45 of 52 stages are audited `not built`**, including every stage of `ShimuraVarieties` (10/10), `PELModuli` (7/7) and `ArakelovGeometry…` (6/6). This is frontier material, so there is almost nothing in the libraries for a stage to duplicate — the opposite of the Elementary area, where everything was built and the accepted audit carried the mapping and pre-empted two of my leads. The only stages not `not built` are `A0` and `CM.6` (process) and `A1`, `A3`, `C0`, `C1`, `D1` (partly built) — all foundational layers (rigidity, torsion and pairings, admissible fans, the Deligne torus) where partial support is expected.

## What this red team did not do

I did not re-derive the mathematics of any stage. Duplication was checked by reading all seven summaries and their scope sentences and by verifying the cross-references those sentences make, not by comparing all 52 stage texts pairwise, so an overlap that neither summary anticipated could have been missed. Omissions were tested against the 61 routed papers and the roadmaps' own targets — an omission no routed paper needs would not surface, which is the line I also drew in the Analytic area for Davenport–Heilbronn. "Targets out of date with the literature" was checked only to the extent the route reasons raise it. The library boundary was spot-checked on the 7 stages that are not `not built`; the other 45 cannot duplicate anything. Every library number here comes from a full Mathlib checkout of 8556 `.lean` files and the Tau Ceti tree of 5268, with the file count printed beside each result.
