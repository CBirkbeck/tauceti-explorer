import Mathlib.Algebra.Module.Submodule.Map
import Mathlib.RepresentationTheory.Basic
import TauCeti.RepresentationTheory.Homological.ContCohomology.LowDegree

/-!
This file is not the roadmap and is not exhaustive. The companion roadmap
document is definitive. These statements suggest Lean forms so contributors
and reviewers can converge on names and signatures.

The arithmetic Selmer conditions, G-valued deformation functors and local
analytic carriers are README targets supplied by their respective owners.
Only light definitions over existing carriers and a few milestones appear here.
No implementation of the global lifting theorem is claimed.
-/

namespace TauCeti.GaloisDeformation.Lifting

section RelativeImage

variable {R A B C : Type*} [CommRing R]
  [AddCommGroup A] [Module R A] [AddCommGroup B] [Module R B]
  [AddCommGroup C] [Module R C]

/-- The linear image underlying the relative Selmer image of GG2.4. -/
def relativeImage (red : A →ₗ[R] B) (sel : Submodule R A) : Submodule R B :=
  sel.map red

theorem mem_relativeImage_iff (red : A →ₗ[R] B) (sel : Submodule R A) (b : B) :
    b ∈ relativeImage red sel ↔ ∃ a ∈ sel, red a = b := by
  sorry

theorem relativeImage_id (sel : Submodule R A) :
    relativeImage (LinearMap.id : A →ₗ[R] A) sel = sel := by
  sorry

theorem relativeImage_comp (f : A →ₗ[R] B) (g : B →ₗ[R] C)
    (sel : Submodule R A) :
    relativeImage (g.comp f) sel = relativeImage g (relativeImage f sel) := by
  sorry

example (red : A →ₗ[R] B) : relativeImage red ⊥ = ⊥ := by
  sorry

example (sel : Submodule R A) :
    relativeImage (0 : A →ₗ[R] B) sel = ⊥ := by
  sorry

example (sel : Submodule R A) :
    relativeImage (LinearMap.id : A →ₗ[R] A) sel = sel := by
  sorry

end RelativeImage

section CyclicModule

variable {R Γ V W : Type*} [CommRing R] [Monoid Γ]
  [AddCommGroup V] [Module R V] [AddCommGroup W] [Module R W]

/-- Orbit span. In GG2.2 the scalar ring here is the prime field. -/
def cyclicSpan (ρ : Representation R Γ V) (v : V) : Submodule R V :=
  Submodule.span R (Set.range fun γ => ρ γ v)

theorem mem_cyclicSpan (ρ : Representation R Γ V) (v : V) :
    v ∈ cyclicSpan ρ v := by
  sorry

theorem cyclicSpan_le_iff (ρ : Representation R Γ V) (v : V)
    (U : Submodule R V) :
    cyclicSpan ρ v ≤ U ↔ ∀ γ, ρ γ v ∈ U := by
  sorry

theorem map_cyclicSpan (ρ : Representation R Γ V) (σ : Representation R Γ W)
    (f : V →ₗ[R] W) (hf : ∀ γ v, f (ρ γ v) = σ γ (f v)) (v : V) :
    (cyclicSpan ρ v).map f = cyclicSpan σ (f v) := by
  sorry

example (ρ : Representation R Γ V) : cyclicSpan ρ 0 = ⊥ := by
  sorry

example (v : V) :
    cyclicSpan (Representation.trivial R Γ V) v = Submodule.span R {v} := by
  sorry

example (ρ : Representation R Γ V) (v : V)
    (h : Submodule.span R (Set.range fun γ => ρ γ v) = ⊤) :
    cyclicSpan ρ v = ⊤ := by
  sorry

end CyclicModule

section ContinuousCohomology

variable {Γ V W : Type*} [Monoid Γ] [TopologicalSpace Γ]
  [AddCommGroup V] [TopologicalSpace V] [IsTopologicalAddGroup V]
  [DistribMulAction Γ V] [ContinuousSMul Γ V]
  [AddCommGroup W] [TopologicalSpace W] [IsTopologicalAddGroup W]
  [DistribMulAction Γ W] [ContinuousSMul Γ W]

/-- Additive image on the actual pinned continuous H¹ carrier.
The arithmetic owner must supply the coefficient map and Selmer subgroup. -/
def relativeH1Image
    (red : ContCohomology.H1 Γ V →+ ContCohomology.H1 Γ W)
    (sel : AddSubgroup (ContCohomology.H1 Γ V)) :
    AddSubgroup (ContCohomology.H1 Γ W) :=
  sel.map red

theorem mem_relativeH1Image_iff
    (red : ContCohomology.H1 Γ V →+ ContCohomology.H1 Γ W)
    (sel : AddSubgroup (ContCohomology.H1 Γ V)) (x : ContCohomology.H1 Γ W) :
    x ∈ relativeH1Image red sel ↔ ∃ y ∈ sel, red y = x := by
  sorry

theorem relativeH1Image_id (sel : AddSubgroup (ContCohomology.H1 Γ V)) :
    relativeH1Image (AddMonoidHom.id _) sel = sel := by
  sorry

theorem relativeH1Image_mono
    (red : ContCohomology.H1 Γ V →+ ContCohomology.H1 Γ W)
    {s t : AddSubgroup (ContCohomology.H1 Γ V)} (h : s ≤ t) :
    relativeH1Image red s ≤ relativeH1Image red t := by
  sorry

example (red : ContCohomology.H1 Γ V →+ ContCohomology.H1 Γ W) :
    relativeH1Image red ⊥ = ⊥ := by
  sorry

example (sel : AddSubgroup (ContCohomology.H1 Γ V)) :
    relativeH1Image (0 : ContCohomology.H1 Γ V →+ ContCohomology.H1 Γ W) sel = ⊥ := by
  sorry

example (sel : AddSubgroup (ContCohomology.H1 Γ V)) :
    relativeH1Image (AddMonoidHom.id _) sel = sel := by
  sorry

end ContinuousCohomology

end TauCeti.GaloisDeformation.Lifting
