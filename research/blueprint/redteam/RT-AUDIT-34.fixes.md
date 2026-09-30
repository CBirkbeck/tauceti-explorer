# RT-AUDIT-34: fixes

Fixer: Claude Code, session `cc-f805bf`, 30 September 2026 (issue #5047, job FIX-RT-AUDIT-34).
- **Findings and verdicts.** `RT-AUDIT-34.result.json` and `RT-AUDIT-34.review.json`. The red team made 4 findings, all medium (/1–/4), none high or low. The review confirmed all 4 and rejected none; it narrowed /2, /3 and /4.
- **Scope.** All 4 confirmed findings are in scope. The fix applied is the one the review authorises, which overrides the red team's fix text where they differ.
- **Where the changes are.** Everything is in `research/blueprint/audit/AUDIT-34.result.json`; no other file changes. The audit's `review` object is unchanged.
- **Library values and layer verdicts.** None change. R24.2, R24.6, PA.2, PA.5 and R20.1 stay `not built`; every target keeps its library value.
- **Disclosure.** PA.2 and PA.5 are potential-automorphy stages (PotentialAutomorphyInfrastructure).

**Verification.**
- I read every added declaration at Mathlib 082e2d3, at the stated file and line, with its hypotheses. Each resolves in the pinned `declarations.tsv` under the stated full name, file and line.
- The added duplicate layer `IntegralHeckeAndGaloisDeterminants:IHG.1` is an atlas stage.
- Every target that gains citations has at most three declarations.

## RT-AUDIT-34/1 (medium, library-claim): ContRepresentation gives continuous operators only (R24.2)

In PotentialModularityAndCompatibleSystems R24.2, target "The point has residue characteristic zero and the induced representation is continuous with the required residual reduction" (stays `partial`):
- **Note rewritten.** The claim that `ContRepresentation` "is the right ambient notion" is gone. The note now says:
  - `ContRepresentation` (Mathlib/RepresentationTheory/Continuous/Basic.lean:54) is a monoid hom G →* V →L[R] V with no topology on G. It makes each operator ρ(g) continuous, and its module docstring says the action is not assumed continuous. So it does not express continuity of the Galois action in the group variable, which R24.2 asks for.
  - `TopRep` carries a `ContRepresentation` and has the same limitation. It is named in the note, not cited.
  - Neither the continuity condition for the representation carried by a deformation-ring point nor its verification exists, and there is no reduction statement.
- **Citations added, fit related.** Both carry the hypotheses [TopologicalSpace G] and a concrete category V with `HasForget₂ V TopCat`, and neither carries Galois or deformation data:
  - `Action.IsContinuous` (Mathlib/CategoryTheory/Action/Continuous.lean:60), ContinuousSMul G on the underlying space;
  - `ContAction` (Continuous.lean:74), the full subcategory of such actions.

  The target has three declarations.
- **Same wording elsewhere, as the review allows.**
  - PotentialAutomorphyInfrastructure PA.5, target "Compatible systems of Galois representations…": the `ContRepresentation` clause now says it only makes each operator continuous and does not express continuity in the group variable.
  - SerreWeightAndLevelOptimisation summary: the parenthetical now says its operators are continuous but its action is not assumed continuous in the group variable.

  Neither place changes a citation, status or verdict.
- **Unchanged.** `ContRepresentation` stays cited as related. R24.2 stays `not built`.

## RT-AUDIT-34/2 (medium, library-claim): no derived tower-limit API (PA.2)

In PotentialAutomorphyInfrastructure PA.2, target "Positive monoids, normalization, central characters, derived limits and duality/finite-generation bounds for the ordinary construction" (stays `partial`):
- **Note rewritten.** The note no longer says that generic derived-limit machinery exists and only needs instantiating. It credits:
  - the ordinary limit functor `lim`;
  - the generic right-derived-functor framework, from which R^n lim could be formed;
  - generic finite-generation groundwork.

  It then says what is missing at the pins:
  - a derived tower-limit API;
  - a lim¹ vanishing or Mittag-Leffler criterion for modules. Mittag-Leffler occurs only for functors to Type, as `CategoryTheory.Functor.IsMittagLeffler` (CategoryTheory/CofilteredSystem.lean:137), which is named in the note, not cited;
  - the vanishing, control, duality and finite-generation bounds PA.2 asks for.

  The central-characters sentence is kept.
- **Citation kept.** `CategoryTheory.Limits.lim` (Mathlib/CategoryTheory/Limits/HasLimits.lean:541).
- **Citation added.** `CategoryTheory.Functor.rightDerived` (Mathlib/CategoryTheory/Abelian/RightDerived.lean:109, fit related). It is defined for an additive functor, and the note gives the setting: an abelian category with enough injectives. The target has two declarations.
- **Review qualification.** Following the review and the red team, the note does not say that derived functors are absent. The red team's "TC.2 target 3" is one-based (TC.2 target 2 in zero-based indexing). It is only cited as a comparison, and nothing changes there.
- **Unchanged.** PA.2 stays `not built`, and the PotentialAutomorphyInfrastructure summary is unchanged.

## RT-AUDIT-34/3 (medium, library-claim): BDeRhamPlus and BDeRham exist (R24.6)

In PotentialModularityAndCompatibleSystems R24.6, target "A de Rham lifting theorem in place of the missing Weil-Deligne assertion" (stays `absent`):
- **Citations added, fit related.** Both sit beside `fontaineThetaInvertP` (:64), and the target has three declarations:
  - `BDeRhamPlus` (Mathlib/RingTheory/Perfectoid/BDeRham.lean:77);
  - `BDeRham` (BDeRham.lean:90).
- **Note rewritten.** The false "builds only the first step towards B_dR" is gone.
  - **Hypotheses.** The file's hypotheses are stated: R commutative, p prime and not a unit in R, and R p-adically complete.
  - **The two rings.** B_dR^+ is the completion of W(R♭)[1/p] at ker θ. The note corrects the red team, as the review asks: B_dR localises at the images of the single generators a with ker θ = (a), so nothing is inverted when ker θ is not principal. Both rings are zero when p = 0 in R.
  - **Limits of the API.** θ is not extended to B_dR^+, and the DVR property and principality of ker θ are TODOs.
  - **What is missing.** These are period-ring definitions only, not a comparison theorem or representation theory. D_dR, de Rham representations, lifting theorems and Weil-Deligne representations remain absent.
- **Unchanged.** R24.6 stays `not built`.

## RT-AUDIT-34/4 (medium, duplicate): AutomorphicCongruences:L0 is a consumer, not the owner (R20.1)

In SerreWeightAndLevelOptimisation R20.1's duplicates:
- **AutomorphicCongruences:L0: note rewritten.** L0 is now recorded as a consumer overlap, not as an owner. It imports the general congruence ideals and modules from IntegralHeckeAndGaloisDeterminants and applies them to the chosen integral periods and the actual automorphic extension classes. R20.1 requests congruence modules of integral Hecke modules from the same general supplier.
- **IntegralHeckeAndGaloisDeterminants:IHG.1: entry added as general supplier.** The note quotes what IHG.1's text covers: reducibility ideals, extension modules and the lattice constructions used by congruence arguments. It then gives two caveats:
  - IHG.1 does not name congruence modules explicitly;
  - its packet nodes so far cover Cayley-Hamilton algebras only.

  It says that a finer owner node belongs to that roadmap's packet work.
- **Review qualification: not applied.**
  - IHG.5 is not added. Its congruence clause concerns local conditions of extension classes and lattice choices, which R20.1 does not ask for.
  - No packet `requests` entry is added.
- **Maintainer note.** A finer owner node for congruence modules, if wanted, belongs in the IntegralHeckeAndGaloisDeterminants packet, not in R20.1 or L0.
- **Unchanged.** The other three duplicates, R20.1's targets and statuses, and the `not built` verdict.

## Checks

- `python3 research/blueprint/intake.py check-files research/blueprint/audit/AUDIT-34.result.json research/blueprint/redteam/RT-AUDIT-34.fixes.md`: 0 problems.
- New citations, checked against `declarations.tsv`; all resolve:
  - `Action.IsContinuous` (Action/Continuous.lean:60);
  - `ContAction` (Action/Continuous.lean:74);
  - `CategoryTheory.Functor.rightDerived` (Abelian/RightDerived.lean:109);
  - `BDeRhamPlus` (Perfectoid/BDeRham.lean:77);
  - `BDeRham` (Perfectoid/BDeRham.lean:90).
- `CategoryTheory.Functor.IsMittagLeffler` (CofilteredSystem.lean:137) is named in a note only; it also resolves.
- The `review` object is byte-for-byte unchanged, and the JSON keeps its original formatting (indent 1, non-ASCII kept, no trailing newline).
- No target in AUDIT-34 has more than five declarations, before or after this job.
