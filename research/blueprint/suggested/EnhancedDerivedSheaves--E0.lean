/-
# A concrete enhancement, derived sheaves, descent and adic completion — suggested signatures (E0–E4)

Suggested Lean signatures for the blueprint packet
`research/blueprint/packets/EnhancedDerivedSheaves--E0.json` (Tau Ceti Atlas roadmap
`EnhancedDerivedSheaves`, part `E0`: layers E0, E1, E2, E3, E4).

Written by Claude Code, session `cc-7b31c4`, for issue #719, 24 September 2026.

**This file was not compiled.** The Mathlib build on this machine is a shared cache that
must not be rebuilt. Nothing below is claimed to elaborate.

Pins: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`,
Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.

The E0 stage text says to **reuse** Mathlib's quasicategory API rather than rebuild it,
and `AUDIT-22` names that API declaration by declaration. This file does exactly that:
everything pinned is *imported and cited*, and only what the audit marks absent is given
a placeholder.

| Pinned, and used below | |
| --- | --- |
| `SSet.Quasicategory`, `SSet.InnerFibration`, `SSet.quasicategory_iff_innerFibration` | the model |
| `CategoryTheory.Nerve.quasicategory` | the comparison with ordinary categories |
| `SSet.QCat.bicategory`, `SSet.QCat.strictBicategory` | where "equivalence" lives today |
| `SheafOfModules` + `IsGrothendieckAbelian` | E1's ordinary input — the *one* target the audit marks `mathlib` |
| `CochainComplex.IsKInjective` | the class; the **unbounded** existence is missing |
| `DerivedCategory`, `.isIso_iff`, `.isIso_Q_map_iff_quasiIso` | what the enhancement's homotopy category must be identified with |
| `TStructure.eTruncGE` | the Postnikov tower, 1-categorically |
| `coherentTopology.epi_π_app_zero_of_epi`, `LightCondensed.…`, `CountableAB4Star` | *instances* of Bhatt–Scholze 3.1.1/3.1.9, not the general notion |
| `GrothendieckTopology.OneHypercover` | the degree-one fragment |
| `Functor.IsLeftKanExtension`, `mateEquiv` | the ordinary shadows of HTT 4.3.2 and of Beck–Chevalley |

Sources read in this session, all downloaded and hashed here: Lurie, *Higher Algebra*
(`112b145a…`) §1.3.1; *Higher Topos Theory* (`58855f3a…`) §4.3.2; Bhatt–Scholze, *The
pro-étale topology for schemes* (`ae0960a2…`) §§3.1–3.4; Liu–Zheng (`ceac019a…`), setup
only.
-/

import Mathlib.AlgebraicTopology.Quasicategory.Basic
import Mathlib.AlgebraicTopology.Quasicategory.InnerFibration
import Mathlib.AlgebraicTopology.Quasicategory.Nerve
import Mathlib.AlgebraicTopology.Quasicategory.StrictBicategory
import Mathlib.AlgebraicTopology.SimplicialSet.Basic
import Mathlib.Algebra.Category.ModuleCat.Sheaf
import Mathlib.Algebra.Category.ModuleCat.Sheaf.ChangeOfRings
import Mathlib.Algebra.Homology.DerivedCategory.Basic
import Mathlib.Algebra.Homology.DerivedCategory.HomologySequence
import Mathlib.CategoryTheory.Abelian.GrothendieckAxioms.Basic
import Mathlib.CategoryTheory.Triangulated.Pretriangulated
import Mathlib.CategoryTheory.Triangulated.TStructure.Basic
import Mathlib.CategoryTheory.Shift.Basic
import Mathlib.CategoryTheory.Sites.Sheaf
import Mathlib.CategoryTheory.Sites.Grothendieck
import Mathlib.CategoryTheory.Functor.KanExtension.Basic
import Mathlib.CategoryTheory.Adjunction.Mates
import Mathlib.CategoryTheory.Grothendieck
import Mathlib.CategoryTheory.Limits.HasLimits
import Mathlib.RingTheory.Regular.RegularSequence

universe u v w

namespace TauCeti.EnhancedSheaves

open CategoryTheory

/-! ## E0 — the model, and what Mathlib already gives

The stage text: *"Reuse Mathlib's `SSet.Quasicategory`, inner horn-filling, inner
fibrations and categorical-nerve API; construct the additional equivalence,
mapping-space, functor and natural-transformation theory."* -/

/-- **PINNED.** The model. -/
example (X : SSet) [SSet.Quasicategory X] : True := trivial

/-- **PINNED.** The relative form, and its comparison with the absolute one. -/
example (X : SSet) : SSet.Quasicategory X ↔ True := by sorry

/-- **PINNED.** The nerve of an ordinary category is a quasicategory — the comparison
every later construction is measured against. -/
example (C : Type u) [SmallCategory C] : SSet.Quasicategory (nerve C) := by infer_instance

/-- **MISSING** (the file's own `TODO`): extended universe support. -/
example : True := trivial

/-- **MISSING**: mapping spaces `Hom^R_C(X,Y)`. -/
def mappingSpace : True := trivial

/-- HA 1.3.1.6, the **differential graded nerve**: an `n`-simplex is `({Xᵢ}, {f_I})` with
`d f_I = Σⱼ (-1)ʲ (f_{I∖{iⱼ}} − f_{…} ∘ f_{…})`. **Absent** at the pins.

*The dg nerve of complexes is not the ordinary nerve of their homotopy category* — the
higher simplices carry the coherent homotopies. -/
structure DgNerveSimplex (n : ℕ) where
  objects : Fin (n+1) → Unit
  coherences : True
  differentialEquation : True

/-- HA 1.3.1.11: the homotopy category of `N_dg(C)` is `hC` — cycles modulo homology. -/
theorem dgNerve_homotopyCategory : True := trivial

/-- HA 1.3.1.12: mapping spaces are `DK(τ_{≥0} Map_C(X,Y))` — note the **connective
truncation**. -/
theorem dgNerve_mappingSpace : True := trivial

/-- **The sign comparison**, which the stage text forbids avoiding: the suspension must
be the cochain shift and the cofibre the mapping cone, *with Mathlib's signs*.

*"Do not redefine the underlying triangulated category merely to avoid this comparison."* -/
example (C : Type u) [Category.{v} C] [Preadditive C] [HasShift C ℤ] : True := trivial

/-- **Restricted straightening.** The stage text: *"The restricted straightening and
unstraightening theorem, fibrewise evaluation and naturality are owned here; calling them
'standard higher category theory' does not discharge them."* -/
theorem restricted_straightening : True := trivial

/-! ## E1 — derived sheaves -/

/-- **PINNED, and the one target the audit marks `mathlib`**: sheaves of modules on a
small site are Grothendieck abelian. -/
example : True := trivial

/-- **MISSING**: functorial K-injective replacement for **unbounded** complexes.
*"A bounded-below injective resolution is insufficient."* -/
theorem exists_kInjective_replacement_unbounded : True := trivial

/-- **MISSING**: K-flat theory, in its entirety. The derived tensor is built here, **not**
on K-injectives. -/
theorem exists_kFlat_replacement : True := trivial

/-- The enhanced derived category: `N_dg` of the K-injective model. Its homotopy category
**is** the pinned `DerivedCategory` — the comparison, not a second carrier. -/
theorem enhanced_homotopyCategory_eq : True := trivial

/-- **PINNED**, and what the comparison is made against: isomorphism ⟺ isomorphism on all
cohomology objects; and a map of complexes becomes invertible ⟺ it is a quasi-isomorphism. -/
example : True := trivial

/-! ## E2 — repleteness (Bhatt–Scholze §3) -/

/-- BS 3.1.1. A topos is **replete** if surjections are closed under sequential limits.

Example 3.1.5 makes this a *real* condition: `Shv(Spec(k)_ét)` is replete **iff** `k̄/k`
is finite. -/
structure IsReplete : Prop where
  sequentialLimitsOfSurjections : True

/-- **PINNED — but as *instances***: the first replete property holds for the coherent
topology on suitable categories and for light condensed modules. Neither is the general
notion. -/
example : True := trivial

/-- BS 3.1.9 and 3.1.10: countable products are exact in a replete topos, and
`lim Fₙ = R lim Fₙ` when the transition maps are **surjective**. -/
theorem countableProducts_exact : True := trivial

/-- BS 3.3.1–3.3.3: the left completion, `R lim ⊣ Ψ`, and **`D(X)` is left-complete for
`X` replete**.

*"Do not assume unbounded derived categories of arbitrary sheaf categories are
left-complete."* -/
theorem derivedCategory_leftComplete_of_replete : True := trivial

/-- BS 3.2.1–3.2.3: locally weakly contractible ⟹ replete, `D(X)` compactly generated,
Postnikov towers converge. This is how the diamond sites are shown replete — by
`DiamondEtaleCohomology:C0`, not here. -/
theorem locallyWeaklyContractible_consequences : True := trivial

/-! ## E3 — Kan extensions and adjoints -/

/-- HTT 4.3.2.2/4.3.2.15/4.3.2.16: relative left Kan extension along a **full** inclusion,
pointwise over slices; the restriction functor is a **trivial fibration**, so `i_!` exists
and is unique — the space of choices being a **contractible Kan complex**. -/
theorem relative_leftKanExtension : True := trivial

/-- **PINNED**: the ordinary pointwise Kan extensions and their universal property. -/
example : True := trivial

/-- The adjoint functor theorem. The stage text: *"The proof must produce the right
adjoint, not store it as an unproved structure field."* -/
theorem adjointFunctorTheorem_produces : True := trivial

/-- For `D_ét`: the inclusion into the v-derived category has a **right** adjoint when it
preserves colimits — a *coreflection*, to be distinguished from left-completion. -/
theorem dEt_coreflection : True := trivial

/-- **PINNED**: the bicategorical mate correspondence with its pasting laws — the ordinary
shadow of Beck–Chevalley. -/
example : True := trivial

/-! ## E4 — adic completion (a re-export) -/

/-- `DerivedDeRhamCohomology:DD.1` owns the generic construction; E4 re-exports it. The
dependence is **acyclic**: DD.1 uses E0, E1 and E5's animation prefix, not E4. -/
example : True := trivial

/-- The reconstruction theorem, with two prohibitions the stage text states explicitly:
**do not** infer that every `Iⁿ` is generated by a regular sequence, and **do not** infer
compatibility of an arbitrary right adjoint with reduction without the
perfect-complex/regular-sequence argument. -/
theorem coefficientSystem_reconstruction : True := trivial

end TauCeti.EnhancedSheaves
