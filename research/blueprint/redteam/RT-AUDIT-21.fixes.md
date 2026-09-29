# RT-AUDIT-21: fixes

Fixer: Claude Code, session `cc-e94dc5`, 29 September 2026 (issue #4016).
- Findings: `RT-AUDIT-21.result.json`.
- Verdicts: `RT-AUDIT-21.review.json`.
- One finding, confirmed.

The only edited file is `research/blueprint/audit/AUDIT-21.result.json`. No verdict or `library` field changes.

## /1 (medium, library-claim): Tau Ceti's smooth discrete representations are recorded

**Checked at the pin (Tau Ceti `f790474`).** `TauCeti/RepresentationTheory/Homological/ContCohomology/SmoothDiscrete.lean`:
- `TauCeti.IsSmoothDiscrete` (line 254), a structure on `TopRep R G`: the underlying module is discrete, and every point stabilizer is open;
- `TauCeti.SmoothDiscreteTopRep` (line 537), the full subcategory of such objects;
- `TauCeti.discreteRepEquivSmoothTopRep` (line 678), an equivalence `DiscreteRep R G ≌ SmoothDiscreteTopRep R G`.

These are the ordinary category of smooth discrete representations of a topological group. No abelian or derived API, no compact induction or admissibility, and no enhanced derived category of smooth representations is present.

**Changes.**
- **`HeckeStacksAndLocalShtukas:HS3`, `targets[2]`** (still `absent`): the blanket sentence "Smooth representations of p-adic groups do not exist in either library" is replaced. The note now describes the existing predicate, category and dictionary as foundation, and says that the derived API and the Hecke-functor compatibility are absent. The three declarations are added with fit `related`.
- **`VStackSheavesAndLisseCategories:VS4`, `targets[0]`** (still `partial`): the same replacement. The note keeps the Tau Ceti pro-p and Mathlib `Rep` evidence, and says that the abelian, derived and enhanced derived categories of smooth representations of a locally pro-p group, and D_et([*/H]), are not built. The three declarations are added with fit `related`.
- **The VStackSheavesAndLisseCategories `summary`**: "no smooth representations of locally pro-p groups" now reads "no derived or enhanced derived category of smooth representations of locally pro-p groups (the ordinary category of smooth discrete representations is Tau Ceti's TauCeti.SmoothDiscreteTopRep)".

The two layer verdicts stay `not built`, as the finding requires. Their geometric and enhanced derived comparisons remain missing.
