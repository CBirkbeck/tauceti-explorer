/-
This file is not the roadmap and is not exhaustive. The accompanying README is
definitive. These suggested signatures help contributors and reviewers agree on
names and conventions; they do not claim an implementation of the roadmap.

Only the light rational-class interface has carriers at the pinned baseline.
Geometric cycle groups, equivariant realizations, conjecture predicates and
motivic categories remain precisely specified README targets.
-/
import Mathlib
import TauCeti.Geometry.Hodge.Morphism
import TauCeti.Geometry.Hodge.Tate.Basic

noncomputable section

namespace TauCeti.CycleConjectures

open TauCeti.Hodge

universe u v u' v'

variable {V : Type u} {W : Type v}
  [AddCommGroup V] [Module ℚ V]
  [AddCommGroup W] [Module ℂ W] [Module ℚ W] [IsScalarTower ℚ ℂ W]
  {ω : Conjugation W} {n : ℤ}

/-- Rational vectors whose comparison image has type `(p,n-p)`.
For geometric degree `2p`, this is the rational Hodge-class subspace.
The comparison is supplied explicitly, rather than identifying its carriers. -/
def rationalClassesOfType (i : V →ₗ[ℚ] W)
    (hs : HodgeStructureOn W ω n) (p : ℤ) : Submodule ℚ V :=
  ((hs.piece p).restrictScalars ℚ).comap i

/-- Membership is tested on the comparison image: `v` is a rational class of type `(p,n-p)`
exactly when `i v` lies in the Hodge component `H^{p,n-p}`. -/
@[simp]
theorem mem_rationalClassesOfType (i : V →ₗ[ℚ] W) (hs : HodgeStructureOn W ω n) (p : ℤ)
    (v : V) : v ∈ rationalClassesOfType i hs p ↔ i v ∈ hs.piece p :=
  Iff.rfl

/-- In middle bidegree, a conjugation-fixed rational vector is of type `(p,p)`
exactly when its image lies in the `p`-th filtration step. -/
theorem rationalClassesOfType_diagonal_iff (i : V →ₗ[ℚ] W) (p : ℤ)
    (hs : HodgeStructureOn W ω (2 * p))
    (hi : ∀ v, ω.toEquiv (i v) = i v) (v : V) :
    v ∈ rationalClassesOfType i hs p ↔ i v ∈ hs.F p := by
  sorry

/-- A rational map and a Hodge morphism forming a commuting comparison square
carry rational classes of each type to classes of that same type. -/
theorem rationalClassesOfType_map
    {V' : Type u'} {W' : Type v'}
    [AddCommGroup V'] [Module ℚ V']
    [AddCommGroup W'] [Module ℂ W'] [Module ℚ W'] [IsScalarTower ℚ ℂ W']
    {ω' : Conjugation W'}
    (i : V →ₗ[ℚ] W) (i' : V' →ₗ[ℚ] W')
    (hs : HodgeStructureOn W ω n) (hs' : HodgeStructureOn W' ω' n)
    (f : V →ₗ[ℚ] V') (g : W →ₗ[ℂ] W')
    (hg : HodgeStructureOn.IsMorphism hs hs' g)
    (hcomp : ∀ v, i' (f v) = g (i v)) (p : ℤ) :
    (rationalClassesOfType i hs p).map f ≤ rationalClassesOfType i' hs' p := by
  sorry

/-- Off the diagonal bidegree there are no rational classes: if the comparison is injective
with conjugation-fixed image and `n ≠ 2p`, the rational subspace of type `(p,n-p)` is zero,
because a conjugation-fixed vector of type `(p,n-p)` also has type `(n-p,p)`. -/
theorem rationalClassesOfType_wrong_weight (i : V →ₗ[ℚ] W)
    (hs : HodgeStructureOn W ω n) (p : ℤ) (hinj : Function.Injective i)
    (hi : ∀ v, ω.toEquiv (i v) = i v) (hn : n ≠ 2 * p) :
    rationalClassesOfType i hs p = ⊥ := by
  sorry

-- Test `rationalType_tate_unit`: the rational unit has its entire rational line in
-- bidegree (0,0).
example : rationalClassesOfType (Algebra.linearMap ℚ ℂ) (tate 0) 0 = ⊤ := by
  ext q
  simp [rationalClassesOfType, tate_piece]

-- Test `rationalType_tate_wrong_index`: a weight-zero Tate line has no rational vector of
-- bidegree (1,-1).
-- In particular the definition must use the Hodge piece, rather than just F^p
-- with an index shift or an untwisted constant rational subspace.
example : rationalClassesOfType (Algebra.linearMap ℚ ℂ) (tate 0) 1 = ⊥ := by
  ext q
  simp [rationalClassesOfType, tate_piece]

end TauCeti.CycleConjectures
