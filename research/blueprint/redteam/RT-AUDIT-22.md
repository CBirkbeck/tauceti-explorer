# RT-AUDIT-22 — red team of library audit AUDIT-22

**Result: one finding, low severity. Three of the four attacks came back clean, and the fourth yielded a presentational point rather than an error.**

Red team: Claude Code, session `cc-fb70e5`, 24 September 2026. Target: `AUDIT-22`, the library audit of four roadmaps — `tauceti:TauCetiRoadmap/ProfiniteProPGroups`, `EnhancedDerivedSheaves`, `tauceti:TauCetiRoadmap/DGAInfinity`, `tauceti:TauCetiRoadmap/GrothendieckEulerForms` — accepted by `REV-AUDIT-22` on 17 September 2026 after 281 items checked. Baseline pinned in the audit: **tauceti `f790474`, mathlib `082e2d3`**.

Eligibility: `cc-fb70e5` wrote neither `AUDIT-22` nor `REV-AUDIT-22`.

## Attack 1 — every declaration claim, at the pinned commits. **528 of 528 hold.**

I extracted every `declarations` entry from every target of every layer: **528 claims**, 361 with `library: tauceti` and 167 with `library: mathlib`. Every one carries a name, a library, a file, a line and a fit; none was missing a file or a line.

| | claims | verified | missing file | absent name | drifted line |
|---|---|---|---|---|---|
| tauceti at `f790474` | 361 | **361** | 0 | 0 | 0 |
| mathlib | 167 | **167** | 0 | 0 | 0 |

The tauceti claims were checked by reading each file out of the pinned commit (`git show f790474…:<file>`) and locating the cited name within ±3 lines of the cited line. The mathlib claims were checked the same way with a ±5-line window.

**A caveat the verifier should weigh, stated plainly:** the mathlib tree available to me is `30a58f79`, not the pinned `082e2d3`. Line drift between two mathlib commits would have been expected and excusable. There was none, and no cited name was absent from its cited file — which is a stronger result than the audit needed to survive.

## Attack 2 — the absence claims, in both directions. Clean.

PROTOCOL §17 asks specifically, for an audit, about "targets marked missing that the libraries have, or marked built that they lack". Attack 1 settles the second half. For the first, the sharpest target is `EnhancedDerivedSheaves`'s summary, which opens:

> "Nothing homotopy-coherent in this roadmap exists: neither library has mapping spaces of quasicategories or an API for their equivalences, dg nerves, stable ∞-categories, straightening, presentable ∞-categories, hypercover descent, limits of Postnikov towers or left completion, derived completion, ∞-operads, E∞-algebras, animated rings or spectra."

Read alone that is false — Mathlib has quasicategories. But the summary continues: "Mathlib supplies the named starting points and their 1-categorical shadows: quasicategories with inner fibrations, nerves, quasicategorical internal homs and the homotopy 2-category of quasicategories, Dold–Kan and the simplicial nerve …". Probing the tree agrees with that division exactly — `Quasicategory` in 10 files, `nerve` in 27, `SimplicialCategory` in 6, `Pretriangulated` in 52, and **no** `dgNerve`, **no** `StableCategory`. The line is drawn in the right place. No finding.

## Attack 3 — duplication. Clean, in both the forms §17 names.

- **By target text.** All **280** targets compared pairwise across roadmap boundaries on content-word overlap. **Zero pairs** reach a Jaccard coefficient of 0.33. No two of the four roadmaps state the same target — notable given that `DGAInfinity` layer 7 ("dg and A∞ quotients, Verdier comparison and K₀") and `GrothendieckEulerForms` layer 2 ("split, exact, abelian and triangulated Grothendieck groups") are the kind of neighbouring pair where overlap would be expected.
- **By shared declaration.** Eleven declarations are cited under more than one roadmap. Each is correct reuse of a general library result rather than mathematics planned twice — `CochainComplex.mappingCone`, `DerivedCategory`, `CategoryTheory.Idempotents.Karoubi` and `TauCeti.linearHomComplexEnrichedCategory` shared between `DGAInfinity` and `EnhancedDerivedSheaves`; `TauCeti.TriangulatedK0`, `TauCeti.extEuler` and `MoritaEquivalence` between `DGAInfinity` and `GrothendieckEulerForms`.
- The one that looked like a mis-citation is not. `TauCeti.leftRadical` is cited under both `GrothendieckEulerForms` and, surprisingly, `ProfiniteProPGroups`. The profinite citation sits in the layer titled **"prerequisites: two owned inputs"**, whose target is "Bilinear forms over 𝔽_p: left and right radicals, left and right nondegeneracy agreeing in finite dimension" — exactly what the Demushkin-group layers need. Correct.

## Attack 4 — coverage and field consistency, and one lead that dissolved

**Layer coverage is complete.** Every layer heading in all four roadmap documents has an audit entry: ProfiniteProPGroups 12, EnhancedDerivedSheaves 11 (E0–E5 plus the five E5 sub-layers), DGAInfinity 12, GrothendieckEulerForms 8. The document headings with no audit layer are prose sections — scope, conventions, worked examples, references.

**The target-level `library` field is used consistently.** It is a status field taking `mathlib`/`tauceti`/`both`/`partial`/`absent`. Where it names a library, that library supplies the satisfying declarations. `absent` targets that nonetheless carry declarations are not overclaims: those declarations document the nearest existing material, and the notes say so ("`profiniteOrder` is not applied to any concrete group in either library … `Ẑ` itself does not exist"). Three targets name a library while citing only `more general` declarations, and in each the note explains that the library result is strictly stronger and satisfies the target by instantiation — `continuousCohomology` in every degree for any topological representation, `exists_continuous_section` for any closed subgroup of a profinite group, `cartanMap` for any ring.

**The lead that dissolved**, recorded so the next reader need not repeat it. I tabulated all 43 layers by verdict against how many of their targets carry a satisfying declaration, looking for miscalibration. No `partly built` layer lacks one; three `not built` layers have exactly one. That looked at first like an inconsistency — and on a narrower reading, counting only `fit: exact`, it looked like a single violation, which would have been a spurious finding. Reading the three layers shows the audit is not applying a per-target rule at all: it judges whether the **layer's own subject** is built, and in each of the three the satisfied target is itself marked `partial` with a note saying what is missing. The verdicts are defensible. What survives is only the presentational point below.

## The finding

**RT-AUDIT-22/1 — `other`, low severity.** Three layers verdicted `not built` each contain one target that a library result already satisfies by instantiation, so a worker filtering on the machine-readable `verdict` alone cannot tell them apart from the layers where nothing whatever exists, and would miss reusable material.

- `ProfiniteProPGroups#layer-4-free-pro-p-and-pro-c-groups-on-finite-sets`: the target "Structure theorem A ≅ ℤ_p^r × T for topologically finitely generated abelian pro-p groups" cites `Module.equiv_free_prod_directSum` (`Mathlib/Algebra/Module/PID.lean:257`, fit `more general`), with the note that it "applies to ℤ_[p] (a DVR in Mathlib) but states existence only. Missing: uniqueness of r and of the elementary divisors, the pro-p/topological version, and the passage from abelian pro-p groups to ℤ_p-modules."
- `DGAInfinity#layer-8-hochschild-cochains-…-and-formality`: the target "A∞ structures as degree-one square-zero coderivations over any commutative base" cites two **exact** tauceti declarations, `TauCeti.AInfinityAlgebra` (`…/AInfinity/Algebra.lean:54`) and `TauCeti.AInfinity.IsSuspension.comp_self_eq_zero_iff_forall_stasheffSum_eq_zero` (`…/AInfinity/Coderivation.lean:362`), both of which I read at the pin.
- `DGAInfinity#layer-10-k₀perf-euler-and-numerical-forms`: the target "Left and right numerical quotients of K₀(Perf C) by the radicals" cites `TauCeti.LeftNumericalQuotient` (`…/NumericalQuotient/Basic.lean:138`) and `TauCeti.numericalPairing_nondegenerate` (`:317`), fit `more general`.

For contrast, `DGAInfinity#layer-9-smoothness-properness-serre-and-calabi--yau` and `ProfiniteProPGroups#layer-9-the-classification-of-demushkin-groups` have **0 of 5** and **0 of 7** targets with any declarations at all — the case the verdict reads naturally as.

**Fix.** Leave the verdicts; make the reusable material visible at layer level. Add a short "reuse" note on each of the three layers naming the declaration a builder should start from and what it does not give. If the schema is to carry this instead, a distinct verdict value for "subject absent, but a general result instantiates part of one target" would separate these three from the two layers with nothing.

## What this red team did not do

I did not re-derive the mathematics of any target, and I did not attempt to find material the libraries contain that the audit missed *below* layer granularity — that would mean an independent sweep of both libraries against 280 targets, which is a larger job than this one. Coverage was checked at layer granularity against the four roadmap documents, and the absence claims were tested only where the audit makes a sweeping one. The mathlib line checks were made against `30a58f79` rather than the pinned `082e2d3`, as recorded above.
