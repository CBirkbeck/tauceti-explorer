import Mathlib.AlgebraicGeometry.AffineScheme
import Mathlib.AlgebraicGeometry.Noetherian
import Mathlib.AlgebraicGeometry.Properties
import Mathlib.AlgebraicGeometry.ResidueField
import Mathlib.Algebra.Category.ModuleCat.Sheaf.Quasicoherent
import Mathlib.Algebra.Category.ModuleCat.Sheaf.LocallyFree
import Mathlib.RingTheory.RegularLocalRing.Defs
import TauCeti.AlgebraicGeometry.WeilDivisor.Scheme.LocallyPrincipal
import TauCeti.AlgebraicGeometry.WeilDivisor.Scheme.Degree

/-!
# Suggested Lean forms for `KTheoryLowDegrees--Z.5` (layer Z.5, vector bundles and curves)

This file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/KTheoryLowDegrees--Z.5.md` is definitive. The statements below suggest
Lean forms, so that contributors and reviewers converge on names and signatures. The theorem
proofs use `sorry`; the examples check the pinned normalization and the dimension-zero boundary.
Nothing here claims an implementation.

The file elaborates against the pinned libraries (Mathlib `082e2d3`, Tau Ceti `f790474`). This
follow-up rebases layer Z.5 on carriers that are newer than those pins:

* `FiniteLocallyFreeSheaf`, exterior powers and `determinantObj`: AlgebraicVectorBundles L0B–L0C,
  and Tau Ceti `main`;
* `Chow.K0`, `Chow.G0`, `Chow.K0.det`, `Chow.K0.toG0`, `Chow.HasResolutionProperty` and the
  pushforward `f_!`: SchemeAndStackFoundations §5.7;
* the group law on `LineBundleClass X` and `Cl(X) ≅ Pic(X)` on regular curves: Tau Ceti `main`.

A statement whose carriers are not at the pins is therefore a README target and appears here only as
a comment. This covers part (c) of `Z.5/regular-curve-ample-family` and parts (a)–(b) of
`Z.5/point-class-degree-comparison`. What can be stated at the pins is stated: the finiteness and
boundary-divisor parts of the ample family, the resolution property with the upstream predicate
written out, and the divisor-level index statement.

The 27 retained Z.5 nodes of `KTheoryLowDegrees--Z.3.json` keep their prototypes in
`research/blueprint/suggested/KTheoryLowDegrees--Z.3.lean`, and are read through the carrier
substitution of the README, §2.
-/

open CategoryTheory AlgebraicGeometry Order

namespace TauCeti.AlgebraicGeometry.KTheory

universe u

section AmpleFamily

/-! ### `KTheoryLowDegrees:Z.5/regular-curve-ample-family`

`X` satisfies the regular-curve package: noetherian, integral, every point of coheight at most one,
and discrete valuation rings at the codimension-one points. -/

variable (X : Scheme.{u}) [IsIntegral X] [IsNoetherian X]

/-- Part (a), finiteness: the complement of a nonempty open subset of a noetherian integral scheme
of dimension at most one is finite. -/
theorem compl_finite_of_coheight_le_one (hdim : ∀ x : X, coheight x ≤ 1)
    (U : X.Opens) (hne : (U : Set X).Nonempty) :
    ((U : Set X)ᶜ).Finite := by
  sorry

/-- Part (a), the points: each point outside a nonempty open subset is closed and of coheight one,
so it is a codimension-one point. -/
theorem coheight_eq_one_and_isClosed_of_not_mem (hdim : ∀ x : X, coheight x ≤ 1)
    (U : X.Opens) (hne : (U : Set X).Nonempty) {z : X} (hz : z ∉ (U : Set X)) :
    coheight z = 1 ∧ IsClosed ({z} : Set X) := by
  sorry

open scoped Classical in
/-- Part (b), the boundary divisor `D_U = Σ_{z ∉ U} z`: coefficient one at the codimension-one points
outside `U` and zero at those of `U`. Under the regular-curve package's DVR hypothesis, its divisor
sheaf `SchemeWeilDivisor.sheaf D_U` is invertible
(`SchemeWeilDivisor.isLocallyPrincipal_of_forall_coheight_le_one`), and the rational function `1` is
a global section of it, non-vanishing exactly on `U`. That last clause, and the ample family of
part (c), have no carrier at the pins and are README targets. -/
theorem exists_boundaryDivisor (hdim : ∀ x : X, coheight x ≤ 1)
    (U : X.Opens) (hne : (U : Set X).Nonempty) :
    ∃ D : SchemeWeilDivisor X, ∀ z : CodimensionOnePoint X,
      WeilDivisor.coeff D z = if (z : X) ∈ U then 0 else 1 := by
  sorry

end AmpleFamily

section ResolutionProperty

/-! ### `KTheoryLowDegrees:Z.5/regular-curve-resolution-property`, rerouted

The predicate is SchemeAndStackFoundations §5.7's `Chow.HasResolutionProperty`. TauCetiRoadmap's
suggested file is not importable at the pins, so the predicate is written out in the statement:
every finitely presented module is a quotient of a locally free module of finite type. The proof is
the ample family of `Z.5/regular-curve-ample-family` with Stacks 0GMM; no separatedness is
assumed. -/

/-- Every regular noetherian scheme of dimension at most one has the resolution property. -/
theorem hasResolutionProperty_of_regular_coheight_le_one (Y : Scheme.{u}) [IsNoetherian Y]
    (hreg : ∀ y : Y, IsRegularLocalRing (Y.presheaf.stalk y))
    (hdim : ∀ y : Y, coheight y ≤ 1) :
    ∀ F : Y.Modules, F.IsFinitePresentation →
      ∃ (E : Y.Modules) (_ : E.IsLocallyFree) (_ : E.IsFiniteType) (q : E ⟶ F), Epi q := by
  sorry

end ResolutionProperty

section Degree

/-! ### `KTheoryLowDegrees:Z.5/point-class-degree-comparison`

Intended form, using the upstream carriers. It is a README target, since none of these carriers is at
the pins:

```
theorem eulerChar_eq_rank_mul_add_degree (k : Type u) [Field k] (X : Scheme.{u})
    [X.Over (Spec (.of k))] [IsProper (X ↘ Spec (.of k))] [IsIntegral X]
    (hreg : ∀ x : X, IsRegularLocalRing (X.presheaf.stalk x)) (hdim : ∀ x : X, coheight x ≤ 1)
    (x : Chow.K0 X) :
    eulerChar k X x = rankℤ x * eulerChar k X 1 + LineBundleClass.eulerDegree k (Chow.K0.det X x).toMul
```

Here `eulerChar k X := Chow.kPushforward (X ↘ Spec k) ∘ Chow.K0.toG0 X`, read in
`G₀(Spec k) ≅ ℤ`. Part (b) is `eulerChar k X (pointClass D) = relativeDegree (X ↘ Spec k) D`.

The divisor-level half of part (c) is stated at the pins: the residue-weighted degree of Weil
divisors has image the subgroup generated by the residue degrees of the codimension-one points. On
a proper regular curve of dimension one this subgroup is `δ_X ℤ`, with `δ_X` the index of `X`.
For dimension zero the codimension-one indexing type is empty and this subgroup is zero; the image
of `(rank, deg ∘ det)` is then `ℤ × {0}`. -/

/-- Part (c), divisor level: the range of the residue-weighted divisor degree. -/
theorem range_relativeDegree {X Y : Scheme.{u}} (f : X ⟶ Y) :
    (SchemeWeilDivisor.relativeDegree f).range =
      AddSubgroup.closure
        (Set.range fun y : CodimensionOnePoint X ↦ ((f.residueDegree (y : X) : ℕ) : ℤ)) := by
  sorry

/-- A prime divisor has degree equal to its residue degree, so that `χ` of a point class is the
residue degree and not `1`. This is the pinned `SchemeWeilDivisor.relativeDegree_ofPoint`. -/
example {X Y : Scheme.{u}} (f : X ⟶ Y) (y : CodimensionOnePoint X) :
    SchemeWeilDivisor.relativeDegree f (WeilDivisor.ofPoint y) = (f.residueDegree (y : X) : ℤ) :=
  SchemeWeilDivisor.relativeDegree_ofPoint f y

/-- The dimension-zero boundary: no codimension-one points means zero divisor degree, even when
the residue degree of the unique closed point of `Spec K` is positive. -/
example {X Y : Scheme.{u}} (f : X ⟶ Y) [IsEmpty (CodimensionOnePoint X)] :
    (SchemeWeilDivisor.relativeDegree f).range = ⊥ := by
  rw [range_relativeDegree, Set.range_eq_empty, AddSubgroup.closure_empty]

end Degree

end TauCeti.AlgebraicGeometry.KTheory
