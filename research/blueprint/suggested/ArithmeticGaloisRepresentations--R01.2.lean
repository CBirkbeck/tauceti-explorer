/-
This file is not the roadmap and is not exhaustive. The roadmap document
research/blueprint/readmes/ArithmeticGaloisRepresentations--R01.2.md is definitive.
The statements suggest Lean forms so contributors and reviewers converge on names
and signatures. Proofs and data constructions are placeholders; no implementation
is claimed.

The pinned build predates the current LocalFieldsRamification tame-character
implementation and does not contain ClassFieldTheory.WeilGroup. The (W, deg, q)
parameters below are an explicit general linear-algebra interface, to be bound to
that supplier's genuine Weil topology, compact open inertia and arithmetic degree.
No substitute Weil group or unknown Prop-valued placeholder is defined here.
Global completion/place identification and the ℓ-adic monodromy existence theorem
are specified in the definitive document but their missing supplier types are
omitted here. The file states the usable consequences with explicit witnesses.
The carrier and operations refine the same owner in the parent packet; assembly
replaces its bundled signatures, rather than installing a second WD theory.
-/
import Mathlib.FieldTheory.AbsoluteGaloisGroup
import Mathlib.NumberTheory.NumberField.Basic
import Mathlib.RingTheory.Ideal.Pointwise
import Mathlib.RepresentationTheory.Basic
import Mathlib.RepresentationTheory.Semisimple
import Mathlib.RepresentationTheory.Irreducible
import Mathlib.Topology.Algebra.ContinuousMonoidHom
import Mathlib.Topology.Algebra.OpenSubgroup
import Mathlib.NumberTheory.Padics.PadicNumbers
import Mathlib.LinearAlgebra.Trace
import Mathlib.LinearAlgebra.Matrix.ToLin
import Mathlib.LinearAlgebra.Matrix.Notation
import Mathlib.RingTheory.Nilpotent.Exp
import TauCeti.NumberTheory.LocalField.Teichmuller
import TauCeti.LinearAlgebra.JordanChevalley.Commuting

noncomputable section
open scoped TensorProduct NumberField Pointwise
namespace TauCeti
open IsLocalRing ValuativeRel
namespace ArithmeticLocal

/-! The global carrier uses the existing stabilizer and additive inertia. -/
instance (F : Type*) [Field F] :
    MulSemiringAction (Field.absoluteGaloisGroup F) (AlgebraicClosure F) :=
  inferInstanceAs (MulSemiringAction (AlgebraicClosure F ≃ₐ[F] AlgebraicClosure F) _)

section Global
variable (F : Type*) [Field F] [NumberField F]
def decompositionAt (w : Ideal (𝓞 (AlgebraicClosure F))) :
    Subgroup (Field.absoluteGaloisGroup F) :=
  MulAction.stabilizer (Field.absoluteGaloisGroup F) w

def inertiaAt (w : Ideal (𝓞 (AlgebraicClosure F))) :
    Subgroup (Field.absoluteGaloisGroup F) :=
  AddSubgroup.inertia w.toAddSubgroup (Field.absoluteGaloisGroup F)

lemma mem_decompositionAt (w : Ideal (𝓞 (AlgebraicClosure F))) (g : Field.absoluteGaloisGroup F) :
    g ∈ decompositionAt F w ↔ g • w = w := by sorry
lemma mem_inertiaAt (w : Ideal (𝓞 (AlgebraicClosure F))) (g : Field.absoluteGaloisGroup F) :
    g ∈ inertiaAt F w ↔ ∀ x : 𝓞 (AlgebraicClosure F), g • x - x ∈ w := by sorry
lemma inertiaAt_le (w : Ideal (𝓞 (AlgebraicClosure F))) [w.IsMaximal] :
    inertiaAt F w ≤ decompositionAt F w := by sorry
lemma decompositionAt_conj (w : Ideal (𝓞 (AlgebraicClosure F))) (g : Field.absoluteGaloisGroup F) :
    decompositionAt F (g • w) = (decompositionAt F w).map (MulAut.conj g).toMonoidHom := by sorry
lemma inertiaAt_conj (w : Ideal (𝓞 (AlgebraicClosure F))) (g : Field.absoluteGaloisGroup F) :
    inertiaAt F (g • w) = (inertiaAt F w).map (MulAut.conj g).toMonoidHom := by sorry

-- Test: ArithmeticLocal.decompositionAt_stabilizer
example (w : Ideal (𝓞 (AlgebraicClosure F))) :
    decompositionAt F w = MulAction.stabilizer (Field.absoluteGaloisGroup F) w := by sorry
-- Test: ArithmeticLocal.inertiaAt_bottom
example : inertiaAt F (⊥ : Ideal (𝓞 (AlgebraicClosure F))) = ⊥ := by sorry
-- Test: ArithmeticLocal.inertiaAt_gaussian_two
example (L : IntermediateField ℚ (AlgebraicClosure ℚ)) [FiniteDimensional ℚ L] [IsGalois ℚ L]
    (i : AlgebraicClosure ℚ) (hi : i ^ 2 = -1) (hL : L = IntermediateField.adjoin ℚ {i})
    (w : Ideal (𝓞 (AlgebraicClosure ℚ))) [w.IsMaximal]
    (hw : (2 : 𝓞 (AlgebraicClosure ℚ)) ∈ w) :
    Nat.card ((inertiaAt ℚ w).map (AlgEquiv.restrictNormalHom L)) = 2 := by sorry
end Global

section Restriction
variable {G H A M : Type*} [Group G] [Group H] [CommRing A]
    [AddCommGroup M] [Module A M]
/-- Underlying representation of the R01.1 continuous restriction. -/
def restrictAlong (ρ : Representation A G M) (j : H →* G) : Representation A H M := ρ.comp j
lemma restrictAlong_apply (ρ : Representation A G M) (j : H →* G) (h : H) :
    restrictAlong ρ j h = ρ (j h) := by sorry
lemma restrictAlong_continuous [TopologicalSpace G] [TopologicalSpace H] [TopologicalSpace M]
    (ρ : Representation A G M) (j : H →ₜ* G)
    (hρ : Continuous (fun x : G × M => ρ x.1 x.2)) :
    Continuous (fun x : H × M => restrictAlong ρ j.toMonoidHom x.1 x.2) := by sorry
lemma restrictAlong_id (ρ : Representation A G M) : restrictAlong ρ (MonoidHom.id G) = ρ := by sorry
lemma restrictAlong_comp {J : Type*} [Group J] (ρ : Representation A G M)
    (j : H →* G) (k : J →* H) : restrictAlong (restrictAlong ρ j) k = restrictAlong ρ (j.comp k) := by sorry
lemma restrictAlong_change (ρ : Representation A G M) (j : H →* G) (g : G) (h : H) :
    ρ g ∘ₗ restrictAlong ρ (((MulAut.conj g⁻¹).toMonoidHom).comp j) h =
      restrictAlong ρ j h ∘ₗ ρ g := by sorry
-- Test: ArithmeticLocal.restrictAlong_trivial
example (j : H →* G) : restrictAlong (Representation.trivial A G M) j =
    Representation.trivial A H M := by sorry
-- Test: ArithmeticLocal.restrictAlong_agrees_comp
example (ρ : Representation A G M) (j : H →* G) : restrictAlong ρ j = ρ.comp j := by sorry
-- Test: ArithmeticLocal.restrictAlong_conjugate_not_equal
example (ρ : Representation A G M) (j : H →* G) (g : G) (h : H)
    (hne : ρ (g⁻¹ * j h * g) ≠ ρ (j h)) :
    restrictAlong ρ (((MulAut.conj g⁻¹).toMonoidHom).comp j) ≠ restrictAlong ρ j := by sorry
end Restriction

section Residual
variable (U : Type*) [Field U] [ValuativeRel U] [TopologicalSpace U]
    [IsNonarchimedeanLocalField U]
variable {I k : Type*} [Group I] [Field k]
/-- The supplied finite Kummer component, read in the residue field of an
unramified extension U, and then in a specified coefficient field. -/
def residualFundamental (θ : I →* rootsOfUnity (Nat.card 𝓀[U] - 1) 𝒪[U])
    (ι : 𝓀[U] →+* k) : I →* kˣ :=
  (Units.map ι.toMonoidHom).comp ((rootsOfUnityEquivResidueFieldUnits U).toMonoidHom.comp θ)
lemma residualFundamental_apply (θ : I →* rootsOfUnity (Nat.card 𝓀[U] - 1) 𝒪[U])
    (ι : 𝓀[U] →+* k) (σ : I) :
    (residualFundamental U θ ι σ : k) =
      ι (residue 𝒪[U] ((θ σ : 𝒪[U]ˣ) : 𝒪[U])) := by sorry
lemma residualFundamental_order (θ : I →* rootsOfUnity (Nat.card 𝓀[U] - 1) 𝒪[U])
    (ι : 𝓀[U] →+* k) (σ : I) :
    residualFundamental U θ ι σ ^ (Nat.card 𝓀[U] - 1) = 1 := by sorry
lemma residualFundamental_surjective (θ : I →* rootsOfUnity (Nat.card 𝓀[U] - 1) 𝒪[U])
    (hθ : Function.Surjective θ) : Function.Surjective (residualFundamental U θ (RingHom.id _)) := by sorry
lemma residualFundamental_kernel (θ : I →* rootsOfUnity (Nat.card 𝓀[U] - 1) 𝒪[U])
    (ι : 𝓀[U] →+* k) : (residualFundamental U θ ι).ker = θ.ker := by sorry
-- Test: ArithmeticLocal.residualFundamental_identity
example (θ : I →* rootsOfUnity (Nat.card 𝓀[U] - 1) 𝒪[U]) :
    residualFundamental U θ (RingHom.id _) = (rootsOfUnityEquivResidueFieldUnits U).toMonoidHom.comp θ := by sorry
-- Test: ArithmeticLocal.residualFundamental_one
example (ι : 𝓀[U] →+* k) : residualFundamental U (1 : I →* rootsOfUnity (Nat.card 𝓀[U] - 1) 𝒪[U]) ι = 1 := by sorry
-- Test: ArithmeticLocal.residualFundamental_teichmuller
example (ι : 𝓀[U] →+* k) (a : 𝓀[U]ˣ)
    (θ : I →* rootsOfUnity (Nat.card 𝓀[U] - 1) 𝒪[U]) (σ : I)
    (hθ : (θ σ : 𝒪[U]ˣ) = teichmuller U a) :
    residualFundamental U θ ι σ = Units.map ι.toMonoidHom a := by sorry
end Residual

section Level
variable {I k : Type*} [Group I] [Field k]
/-- Least positive degree of a finite field containing the image. -/
def tameLevel (p : ℕ) (χ : I →* kˣ) : ℕ :=
  sInf {n : ℕ | 0 < n ∧ ∀ σ, χ σ ^ (p ^ n - 1) = 1}
lemma tameLevel_pos (p : ℕ) [Fact p.Prime] [CharP k p] (χ : I →* kˣ)
    (hχ : (Set.range χ).Finite) : 0 < tameLevel p χ := by sorry
lemma tameLevel_dvd_iff (p : ℕ) [Fact p.Prime] [CharP k p] (χ : I →* kˣ)
    (hχ : (Set.range χ).Finite) (n : ℕ) (hn : 0 < n) :
    tameLevel p χ ∣ n ↔ ∀ σ, χ σ ^ (p ^ n - 1) = 1 := by sorry
lemma tameLevel_frobenius (p : ℕ) [Fact p.Prime] [CharP k p] (χ : I →* kˣ)
    (hχ : (Set.range χ).Finite) : tameLevel p (χ ^ p) = tameLevel p χ := by sorry
lemma tameLevel_one_iff (p : ℕ) [Fact p.Prime] [CharP k p] (χ : I →* kˣ)
    (hχ : (Set.range χ).Finite) : tameLevel p χ = 1 ↔ χ ^ p = χ := by sorry
-- Test: ArithmeticLocal.tameLevel_trivial
example (p : ℕ) [Fact p.Prime] [CharP k p] : tameLevel p (1 : I →* kˣ) = 1 := by sorry
-- Test: ArithmeticLocal.tameLevel_two
example (p : ℕ) [Fact p.Prime] [CharP k p] (χ : I →* kˣ)
    (hχ : (Set.range χ).Finite) (σ : I) (hσ : orderOf (χ σ) = p ^ 2 - 1)
    (hb : ∀ τ, χ τ ^ (p ^ 2 - 1) = 1) : tameLevel p χ = 2 := by sorry
-- Test: ArithmeticLocal.tameLevel_one_from_extension
example (p : ℕ) [Fact p.Prime] [CharP k p] (χ : I →* kˣ)
    (hχ : (Set.range χ).Finite) (hF : χ ^ p = χ) : tameLevel p χ = 1 := by sorry

/-- Arithmetic target: norm relation, on supplied compatible finite components. -/
theorem fundamental_level_two_norm (p : ℕ) [Fact p.Prime] [CharP k p]
    (θ₁ θ₂ : I →* kˣ) (hcompat : θ₂ ^ (p + 1) = θ₁) :
    θ₂ * θ₂ ^ p = θ₁ := by sorry
end Level
end ArithmeticLocal

/-! The actual carrier: no topology on Ω is needed for a smooth Weil representation. -/
structure WeilDeligneRep (W : Type*) [Group W] [TopologicalSpace W] [IsTopologicalGroup W]
    (deg : W →* Multiplicative ℤ) (q : ℕ) (Ω V : Type*) [Field Ω] [CharZero Ω]
    [AddCommGroup V] [Module Ω V] [FiniteDimensional Ω V] where
  r : Representation Ω W V
  open_inertia_kernel : IsOpen {σ : deg.ker | r σ = 1}
  N : Module.End Ω V
  nilpotent : IsNilpotent N
  relation : ∀ w, r w ∘ₗ N = (q : Ω) ^ (deg w).toAdd • (N ∘ₗ r w)

namespace WeilDeligneRep
section Basic
variable {W Ω V V' V'' : Type*} [Group W] [TopologicalSpace W] [IsTopologicalGroup W]
    {deg : W →* Multiplicative ℤ} {q : ℕ} [Field Ω] [CharZero Ω]
    [AddCommGroup V] [Module Ω V] [FiniteDimensional Ω V]
    [AddCommGroup V'] [Module Ω V'] [FiniteDimensional Ω V']
    [AddCommGroup V''] [Module Ω V''] [FiniteDimensional Ω V'']
variable (D : WeilDeligneRep W deg q Ω V)
lemma relation_arith (Φ : W) (hΦ : (deg Φ).toAdd = 1) :
    D.r Φ ∘ₗ D.N = (q : Ω) • (D.N ∘ₗ D.r Φ) := by sorry
lemma relation_geom (F : W) (hF : (deg F).toAdd = -1) :
    D.r F ∘ₗ D.N = (q : Ω)⁻¹ • (D.N ∘ₗ D.r F) := by sorry
lemma relation_inertia (σ : deg.ker) : D.r σ ∘ₗ D.N = D.N ∘ₗ D.r σ := by sorry
lemma finite_inertia_image [CompactSpace deg.ker] : (Set.range (fun σ : deg.ker => D.r σ)).Finite := by sorry
lemma ext {D₁ D₂ : WeilDeligneRep W deg q Ω V} (hr : D₁.r = D₂.r) (hN : D₁.N = D₂.N) :
    D₁ = D₂ := by sorry
/-- The zero-monodromy inclusion of a smooth representation. -/
def ofSmooth (r : Representation Ω W V) (hr : IsOpen {σ : deg.ker | r σ = 1}) :
    WeilDeligneRep W deg q Ω V := ⟨r, hr, 0, by sorry, by sorry⟩
lemma ofSmooth_N (r : Representation Ω W V) (hr : IsOpen {σ : deg.ker | r σ = 1}) :
    (ofSmooth (deg := deg) (q := q) r hr).N = 0 := by sorry
-- Test: WeilDeligneRep.zero_monodromy
example : (ofSmooth (Representation.trivial Ω W V) (by sorry) : WeilDeligneRep W deg q Ω V).N = 0 := by sorry
-- Test: WeilDeligneRep.arithmetic_sign
example (Φ : W) (hΦ : (deg Φ).toAdd = 1) (hq : 1 < q) (hN : D.N ≠ 0) :
    D.r Φ ∘ₗ D.N ≠ (q : Ω)⁻¹ • (D.N ∘ₗ D.r Φ) := by sorry
-- Test: WeilDeligneRep.smooth_not_unramified
example (r : Representation Ω W V) (hr : IsOpen {σ : deg.ker | r σ = 1})
    (σ : deg.ker) (hσ : r σ ≠ 1) : (ofSmooth (deg := deg) (q := q) r hr).r σ ≠ 1 := by sorry

structure Hom (D : WeilDeligneRep W deg q Ω V) (D' : WeilDeligneRep W deg q Ω V') where
  toLinearMap : V →ₗ[Ω] V'
  equivariant : ∀ w, toLinearMap ∘ₗ D.r w = D'.r w ∘ₗ toLinearMap
  monodromy : toLinearMap ∘ₗ D.N = D'.N ∘ₗ toLinearMap

namespace Hom
def id (D : WeilDeligneRep W deg q Ω V) : Hom D D := ⟨LinearMap.id, by sorry, by sorry⟩
def comp {D : WeilDeligneRep W deg q Ω V} {D' : WeilDeligneRep W deg q Ω V'}
    {D'' : WeilDeligneRep W deg q Ω V''} (g : Hom D' D'') (f : Hom D D') : Hom D D'' :=
  ⟨g.toLinearMap ∘ₗ f.toLinearMap, by sorry, by sorry⟩
lemma ext {D : WeilDeligneRep W deg q Ω V} {D' : WeilDeligneRep W deg q Ω V'}
    {f g : Hom D D'} (h : f.toLinearMap = g.toLinearMap) : f = g := by sorry
lemma comp_apply {D : WeilDeligneRep W deg q Ω V} {D' : WeilDeligneRep W deg q Ω V'}
    {D'' : WeilDeligneRep W deg q Ω V''} (g : Hom D' D'') (f : Hom D D') (v : V) :
    (comp g f).toLinearMap v = g.toLinearMap (f.toLinearMap v) := by sorry
lemma comp_id {D : WeilDeligneRep W deg q Ω V} {D' : WeilDeligneRep W deg q Ω V'}
    (f : Hom D D') : comp f (id D) = f := by sorry
lemma id_comp {D : WeilDeligneRep W deg q Ω V} {D' : WeilDeligneRep W deg q Ω V'}
    (f : Hom D D') : comp (id D') f = f := by sorry
-- Test: WeilDeligneRep.Hom.id_value
example (v : V) : (id D).toLinearMap v = v := by sorry
-- Test: WeilDeligneRep.Hom.zero
example (D' : WeilDeligneRep W deg q Ω V') :
    ∃ f : Hom D D', f.toLinearMap = 0 := by sorry
-- Test: WeilDeligneRep.Hom.requires_monodromy
example (D' : WeilDeligneRep W deg q Ω V) (hN : D.N ≠ D'.N) :
    ¬ ∃ f : Hom D D', f.toLinearMap = LinearMap.id := by sorry
end Hom

/-- Isomorphism carrier, part of the morphism API. -/
structure Iso (D : WeilDeligneRep W deg q Ω V) (D' : WeilDeligneRep W deg q Ω V') where
  toLinearEquiv : V ≃ₗ[Ω] V'
  equivariant : ∀ w, toLinearEquiv.toLinearMap ∘ₗ D.r w = D'.r w ∘ₗ toLinearEquiv.toLinearMap
  monodromy : toLinearEquiv.toLinearMap ∘ₗ D.N = D'.N ∘ₗ toLinearEquiv.toLinearMap

/-- Direct sum on a product of the underlying finite-dimensional spaces. -/
def sum (D : WeilDeligneRep W deg q Ω V) (D' : WeilDeligneRep W deg q Ω V') : WeilDeligneRep W deg q Ω (V × V') := by sorry
lemma sum_r (D' : WeilDeligneRep W deg q Ω V') (w : W) (v : V) (v' : V') :
    (D.sum D').r w (v,v') = (D.r w v, D'.r w v') := by sorry
lemma sum_N (D' : WeilDeligneRep W deg q Ω V') (v : V) (v' : V') :
    (D.sum D').N (v,v') = (D.N v, D'.N v') := by sorry
lemma sum_inclusion (D' : WeilDeligneRep W deg q Ω V') :
    ∃ f : Hom D (D.sum D'), ∀ v, f.toLinearMap v = (v,0) := by sorry
lemma sum_projection (D' : WeilDeligneRep W deg q Ω V') :
    ∃ f : Hom (D.sum D') D, ∀ v v', f.toLinearMap (v,v') = v := by sorry
-- Test: WeilDeligneRep.sum_rank
example (D' : WeilDeligneRep W deg q Ω V') :
    Module.finrank Ω (V × V') = Module.finrank Ω V + Module.finrank Ω V' := by sorry
-- Test: WeilDeligneRep.sum_kernel
example (D' : WeilDeligneRep W deg q Ω V') (v : V) (v' : V') :
    (D.sum D').N (v,v') = 0 ↔ D.N v = 0 ∧ D'.N v' = 0 := by sorry
-- Test: WeilDeligneRep.sum_zero
example (D' : WeilDeligneRep W deg q Ω V') (hN : D.N = 0) (hN' : D'.N = 0) :
    (D.sum D').N = 0 := by sorry

def tensor (D : WeilDeligneRep W deg q Ω V) (D' : WeilDeligneRep W deg q Ω V') : WeilDeligneRep W deg q Ω (V ⊗[Ω] V') := by sorry
lemma tensor_r (D' : WeilDeligneRep W deg q Ω V') : (D.tensor D').r = D.r.tprod D'.r := by sorry
lemma tensor_N (D' : WeilDeligneRep W deg q Ω V') (v : V) (v' : V') :
    (D.tensor D').N (v ⊗ₜ[Ω] v') = D.N v ⊗ₜ[Ω] v' + v ⊗ₜ[Ω] D'.N v' := by sorry
lemma tensor_map (D' : WeilDeligneRep W deg q Ω V') (D'' : WeilDeligneRep W deg q Ω V'')
    (f : Hom D' D'') : ∃ g : Hom (D.tensor D') (D.tensor D''),
    ∀ v v', g.toLinearMap (v ⊗ₜ[Ω] v') = v ⊗ₜ[Ω] f.toLinearMap v' := by sorry
lemma tensor_nilpotent_bound (D' : WeilDeligneRep W deg q Ω V') (a b : ℕ)
    (ha : D.N ^ a = 0) (hb : D'.N ^ b = 0) (hab : 0 < a ∧ 0 < b) :
    (D.tensor D').N ^ (a + b - 1) = 0 := by sorry
-- Test: WeilDeligneRep.tensor_rank
example (D' : WeilDeligneRep W deg q Ω V') :
    Module.finrank Ω (V ⊗[Ω] V') = Module.finrank Ω V * Module.finrank Ω V' := by sorry
-- Test: WeilDeligneRep.tensor_zero_N
example (D' : WeilDeligneRep W deg q Ω V') (h : D.N = 0) (h' : D'.N = 0) :
    (D.tensor D').N = 0 := by sorry
-- Test: WeilDeligneRep.tensor_both_summands
example (D' : WeilDeligneRep W deg q Ω V') (v : V) (v' : V')
    (h : D.N v ⊗ₜ[Ω] v' ≠ 0) :
    (D.tensor D').N (v ⊗ₜ[Ω] v') ≠ v ⊗ₜ[Ω] D'.N v' := by sorry

def dual (D : WeilDeligneRep W deg q Ω V) : WeilDeligneRep W deg q Ω (Module.Dual Ω V) := by sorry
lemma dual_r : D.dual.r = D.r.dual := by sorry
lemma dual_N (f : Module.Dual Ω V) (v : V) : D.dual.N f v = - f (D.N v) := by sorry
lemma dual_map (D' : WeilDeligneRep W deg q Ω V') (f : Hom D D') :
    ∃ g : Hom D'.dual D.dual, ∀ l v, g.toLinearMap l v = l (f.toLinearMap v) := by sorry
lemma dual_rank : Module.finrank Ω (Module.Dual Ω V) = Module.finrank Ω V := by sorry
-- Test: WeilDeligneRep.dual_zero_N
example (h : D.N = 0) : D.dual.N = 0 := by sorry
-- Test: WeilDeligneRep.dual_negative_sign
example (f : Module.Dual Ω V) (v : V) (h : f (D.N v) ≠ 0) :
    D.dual.N f v ≠ f (D.N v) := by sorry
-- Test: WeilDeligneRep.dual_pairing
example (w : W) (f : Module.Dual Ω V) (v : V) :
    D.dual.r w f (D.r w v) = f v := by sorry
end Basic

section FiniteSum
variable {W Ω : Type*} [Group W] [TopologicalSpace W] [IsTopologicalGroup W]
    {deg : W →* Multiplicative ℤ} {q : ℕ} [Field Ω] [CharZero Ω]
def sumFamily {m : ℕ} {V : Fin m → Type*} [∀ i, AddCommGroup (V i)]
    [∀ i, Module Ω (V i)] [∀ i, FiniteDimensional Ω (V i)]
    (D : ∀ i, WeilDeligneRep W deg q Ω (V i)) :
    WeilDeligneRep W deg q Ω (∀ i, V i) := by sorry
lemma sumFamily_r {m : ℕ} {V : Fin m → Type*} [∀ i, AddCommGroup (V i)]
    [∀ i, Module Ω (V i)] [∀ i, FiniteDimensional Ω (V i)]
    (D : ∀ i, WeilDeligneRep W deg q Ω (V i)) (w : W) (v : ∀ i, V i) (i : Fin m) :
    (sumFamily D).r w v i = (D i).r w (v i) := by sorry
lemma sumFamily_N {m : ℕ} {V : Fin m → Type*} [∀ i, AddCommGroup (V i)]
    [∀ i, Module Ω (V i)] [∀ i, FiniteDimensional Ω (V i)]
    (D : ∀ i, WeilDeligneRep W deg q Ω (V i)) (v : ∀ i, V i) (i : Fin m) :
    (sumFamily D).N v i = (D i).N (v i) := by sorry
end FiniteSum

section Special
variable {W Ω : Type*} [Group W] [TopologicalSpace W] [IsTopologicalGroup W]
    (deg : W →* Multiplicative ℤ) (q : ℕ) [Field Ω] [CharZero Ω]
/-- Unnormalised special representation, avoiding a square root of q. -/
def special (n : ℕ) : WeilDeligneRep W deg q Ω (Fin n → Ω) := by sorry
lemma special_r (n : ℕ) (w : W) (v : Fin n → Ω) (i : Fin n) :
    (special (Ω := Ω) deg q n).r w v i = (q : Ω) ^ ((deg w).toAdd * (i.val : ℤ)) * v i := by sorry
lemma special_N (n : ℕ) (v : Fin n → Ω) (i : Fin n) :
    (special (Ω := Ω) deg q n).N v i =
      if h : 0 < i.val then v ⟨i.val - 1, by omega⟩ else 0 := by sorry
lemma special_nilpotence (n : ℕ) : (special (Ω := Ω) deg q n).N ^ n = 0 := by sorry
lemma special_kernel (n : ℕ) (hn : 0 < n) :
    Module.finrank Ω (LinearMap.ker (special (Ω := Ω) deg q n).N) = 1 := by sorry
lemma special_inertia (n : ℕ) (σ : deg.ker) : (special (Ω := Ω) deg q n).r σ = 1 := by sorry
-- Test: WeilDeligneRep.special_zero
example : (special (Ω := Ω) deg q 0).N = 0 := by sorry
-- Test: WeilDeligneRep.special_one
example (w : W) : (special (Ω := Ω) deg q 1).r w = 1 ∧ (special (Ω := Ω) deg q 1).N = 0 := by sorry
-- Test: WeilDeligneRep.special_two
example : (special (Ω := Ω) deg q 2).N (fun i => if i.val = 0 then 1 else 0) =
    (fun i => if i.val = 1 then 1 else 0) := by sorry
end Special

section Frobenius
variable {W Ω V : Type*} [Group W] [TopologicalSpace W] [IsTopologicalGroup W]
    {deg : W →* Multiplicative ℤ} {q : ℕ} [Field Ω] [CharZero Ω]
    [AddCommGroup V] [Module Ω V] [FiniteDimensional Ω V]
variable (D : WeilDeligneRep W deg q Ω V)
/-- Concrete predicate: semisimple Weil action at every nonzero degree. -/
def IsFrobeniusSemisimple (D : WeilDeligneRep W deg q Ω V) : Prop := ∀ w : W, (deg w).toAdd ≠ 0 → Module.End.IsSemisimple (D.r w)
lemma isFrobeniusSemisimple_iff_arith [CompactSpace deg.ker]
    (Φ : W) (hΦ : (deg Φ).toAdd = 1) :
    D.IsFrobeniusSemisimple ↔ Module.End.IsSemisimple (D.r Φ) := by sorry
lemma isFrobeniusSemisimple_iff_weil_semisimple [CompactSpace deg.ker]
    (hdeg : Function.Surjective deg) :
    D.IsFrobeniusSemisimple ↔ D.r.IsSemisimpleRepresentation := by sorry
lemma isFrobeniusSemisimple_iso {D' : WeilDeligneRep W deg q Ω V}
    (f : Iso D D') : D.IsFrobeniusSemisimple ↔ D'.IsFrobeniusSemisimple := by sorry
lemma isFrobeniusSemisimple_special (hq : 1 < q) (n : ℕ) :
    (special (Ω := Ω) deg q n).IsFrobeniusSemisimple := by sorry
-- Test: WeilDeligneRep.fss_special_nonzero_N
example (hq : 1 < q) : (special (Ω := Ω) deg q 2).IsFrobeniusSemisimple ∧
    (special (Ω := Ω) deg q 2).N ≠ 0 := by sorry
-- Test: WeilDeligneRep.fss_trivial
example : (ofSmooth (deg := deg) (q := q) (Representation.trivial Ω W V) (by sorry)).IsFrobeniusSemisimple := by sorry
-- Test: WeilDeligneRep.fss_excludes_unipotent_frobenius
example (Φ : W) (hΦ : (deg Φ).toAdd = 1) (h : ¬ Module.End.IsSemisimple (D.r Φ)) :
    ¬ D.IsFrobeniusSemisimple := by sorry

/-- Canonical Jordan factor of the arithmetic Frobenius. -/
def frobeniusUnit (Φ : W) : LinearMap.GeneralLinearGroup Ω V :=
  ⟨D.r Φ, D.r Φ⁻¹, by sorry, by sorry⟩
/-- The Weil action is changed, while monodromy is retained. -/
def frobeniusSemisimplify (D : WeilDeligneRep W deg q Ω V) (Φ : W) (hΦ : (deg Φ).toAdd = 1)
    (hI : CompactSpace deg.ker) (hq : 1 < q) : WeilDeligneRep W deg q Ω V := by sorry
lemma frobeniusSemisimplify_r (Φ : W) (hΦ : (deg Φ).toAdd = 1)
    (hI : CompactSpace deg.ker) (hq : 1 < q) (w : W) :
    (D.frobeniusSemisimplify Φ hΦ hI hq).r w =
      D.r w * ((LinearMap.GeneralLinearGroup.unipotentPart (D.frobeniusUnit Φ)) ^
        (-(deg w).toAdd) : LinearMap.GeneralLinearGroup Ω V) := by sorry
lemma frobeniusSemisimplify_N (Φ : W) (hΦ : (deg Φ).toAdd = 1)
    (hI : CompactSpace deg.ker) (hq : 1 < q) : (D.frobeniusSemisimplify Φ hΦ hI hq).N = D.N := by sorry
lemma frobeniusSemisimplify_fss (Φ : W) (hΦ : (deg Φ).toAdd = 1)
    (hI : CompactSpace deg.ker) (hq : 1 < q) :
    (D.frobeniusSemisimplify Φ hΦ hI hq).IsFrobeniusSemisimple := by sorry
lemma frobeniusSemisimplify_independent (Φ Ψ : W) (hΦ : (deg Φ).toAdd = 1)
    (hΨ : (deg Ψ).toAdd = 1) (hI : CompactSpace deg.ker) (hq : 1 < q) :
    D.frobeniusSemisimplify Φ hΦ hI hq = D.frobeniusSemisimplify Ψ hΨ hI hq := by sorry
lemma frobeniusSemisimplify_id (Φ : W) (hΦ : (deg Φ).toAdd = 1)
    (hI : CompactSpace deg.ker) (hq : 1 < q) (hD : D.IsFrobeniusSemisimple) :
    D.frobeniusSemisimplify Φ hΦ hI hq = D := by sorry
-- Test: WeilDeligneRep.fss_preserves_special
example (Φ : W) (hΦ : (deg Φ).toAdd = 1) (hI : CompactSpace deg.ker) (hq : 1 < q) :
    (special (Ω := Ω) deg q 2).frobeniusSemisimplify Φ hΦ hI hq = special deg q 2 := by sorry
-- Test: WeilDeligneRep.fss_inertia_unchanged
example (Φ : W) (hΦ : (deg Φ).toAdd = 1) (hI : CompactSpace deg.ker) (hq : 1 < q) (σ : deg.ker) :
    (D.frobeniusSemisimplify Φ hΦ hI hq).r σ = D.r σ := by sorry
-- Test: WeilDeligneRep.fss_uses_jordan
example (Φ : W) (hΦ : (deg Φ).toAdd = 1) (hI : CompactSpace deg.ker) (hq : 1 < q) :
    (D.frobeniusSemisimplify Φ hΦ hI hq).r Φ =
      (LinearMap.GeneralLinearGroup.semisimplePart (D.frobeniusUnit Φ) : Module.End Ω V) := by sorry

/-- A chosen representative on the original space. Only its isomorphism class
is canonical; this construction does not assert a semisimplification functor. -/
def categoricalSemisimplify (D : WeilDeligneRep W deg q Ω V) : WeilDeligneRep W deg q Ω V := by sorry
lemma categoricalSemisimplify_N : D.categoricalSemisimplify.N = 0 := by sorry
lemma categoricalSemisimplify_r : D.categoricalSemisimplify.r.IsSemisimpleRepresentation := by sorry
lemma categoricalSemisimplify_trace (w : W) :
    LinearMap.trace Ω V (D.categoricalSemisimplify.r w) = LinearMap.trace Ω V (D.r w) := by sorry
lemma categoricalSemisimplify_unique {S : WeilDeligneRep W deg q Ω V}
    (hN : S.N = 0) (hr : S.r.IsSemisimpleRepresentation)
    (htr : ∀ w, LinearMap.trace Ω V (S.r w) = LinearMap.trace Ω V (D.r w)) :
    Nonempty (Iso D.categoricalSemisimplify S) := by sorry
-- Test: WeilDeligneRep.ss_special_kills_N
example : (special (Ω := Ω) deg q 2).categoricalSemisimplify.N = 0 := by sorry
-- Test: WeilDeligneRep.ss_trivial
example : Nonempty (Iso (ofSmooth (deg := deg) (q := q) (Representation.trivial Ω W V) (by sorry)).categoricalSemisimplify
    (ofSmooth (deg := deg) (q := q) (Representation.trivial Ω W V) (by sorry))) := by sorry
-- Test: WeilDeligneRep.ss_not_fss_on_special
example (Φ : W) (hΦ : (deg Φ).toAdd = 1) (hI : CompactSpace deg.ker) (hq : 1 < q) :
    ¬ Nonempty (Iso ((special (Ω := Ω) deg q 2).frobeniusSemisimplify Φ hΦ hI hq)
      (special (Ω := Ω) deg q 2).categoricalSemisimplify) := by sorry
end Frobenius
end WeilDeligneRep

namespace ArithmeticLocal
section Monodromy
variable {W E V : Type*} [Group W] [TopologicalSpace W] [IsTopologicalGroup W]
    {deg : W →* Multiplicative ℤ} {q ℓ : ℕ} [Fact ℓ.Prime]
    [Field E] [CharZero E] [Algebra (ℚ_[ℓ]) E] [Algebra ℚ E]
    [AddCommGroup V] [Module E V] [Module ℚ V] [IsScalarTower ℚ E V] [FiniteDimensional E V]
variable (ρ : Representation E W V) (t : deg.ker →* Multiplicative (ℚ_[ℓ]))
/-- Grothendieck's theorem supplies this fully spelled out witness for a genuine
local field, ℓ ≠ p, a finite ℓ-adic coefficient field and a continuous action. -/
def monodromyOperator
    (h : ∃! N : Module.End E V, IsNilpotent N ∧ ∃ J : OpenSubgroup deg.ker,
      ∀ σ : J, ρ σ = IsNilpotent.exp ((algebraMap (ℚ_[ℓ]) E (t σ).toAdd) • N)) :
    Module.End E V := Classical.choose h.exists
lemma monodromyOperator_nilpotent
    (h : ∃! N : Module.End E V, IsNilpotent N ∧ ∃ J : OpenSubgroup deg.ker,
      ∀ σ : J, ρ σ = IsNilpotent.exp ((algebraMap (ℚ_[ℓ]) E (t σ).toAdd) • N)) :
    IsNilpotent (monodromyOperator ρ t h) := by sorry
lemma monodromyOperator_spec
    (h : ∃! N : Module.End E V, IsNilpotent N ∧ ∃ J : OpenSubgroup deg.ker,
      ∀ σ : J, ρ σ = IsNilpotent.exp ((algebraMap (ℚ_[ℓ]) E (t σ).toAdd) • N)) :
    ∃ J : OpenSubgroup deg.ker, ∀ σ : J,
      ρ σ = IsNilpotent.exp ((algebraMap (ℚ_[ℓ]) E (t σ).toAdd) • monodromyOperator ρ t h) := by sorry
lemma monodromyOperator_unique
    (h : ∃! N : Module.End E V, IsNilpotent N ∧ ∃ J : OpenSubgroup deg.ker,
      ∀ σ : J, ρ σ = IsNilpotent.exp ((algebraMap (ℚ_[ℓ]) E (t σ).toAdd) • N))
    (N : Module.End E V) (hN : IsNilpotent N)
    (J : OpenSubgroup deg.ker) (hJ : ∀ σ : J,
      ρ σ = IsNilpotent.exp ((algebraMap (ℚ_[ℓ]) E (t σ).toAdd) • N)) :
    N = monodromyOperator ρ t h := by sorry
-- Test: ArithmeticLocal.monodromyOperator_zero
example (h : ∃! N : Module.End E V, IsNilpotent N ∧ ∃ J : OpenSubgroup deg.ker,
      ∀ σ : J, ρ σ = IsNilpotent.exp ((algebraMap (ℚ_[ℓ]) E (t σ).toAdd) • N))
    (hρ : ∀ σ : deg.ker, ρ σ = 1) : monodromyOperator ρ t h = 0 := by sorry
-- Test: ArithmeticLocal.monodromyOperator_exp_generator
example (h : ∃! N : Module.End E V, IsNilpotent N ∧ ∃ J : OpenSubgroup deg.ker,
      ∀ σ : J, ρ σ = IsNilpotent.exp ((algebraMap (ℚ_[ℓ]) E (t σ).toAdd) • N))
    (N : Module.End E V) (hN : IsNilpotent N)
    (hρ : ∀ σ : deg.ker, ρ σ = IsNilpotent.exp ((algebraMap (ℚ_[ℓ]) E (t σ).toAdd) • N)) :
    monodromyOperator ρ t h = N := by sorry
-- Test: ArithmeticLocal.monodromyOperator_witness_independent
example (h h' : ∃! N : Module.End E V, IsNilpotent N ∧ ∃ J : OpenSubgroup deg.ker,
      ∀ σ : J, ρ σ = IsNilpotent.exp ((algebraMap (ℚ_[ℓ]) E (t σ).toAdd) • N)) :
    monodromyOperator ρ t h = monodromyOperator ρ t h' := by sorry

lemma monodromyOperator_scale (a : (ℚ_[ℓ])ˣ) (t' : deg.ker →* Multiplicative (ℚ_[ℓ]))
    (ht' : ∀ σ, (t' σ).toAdd = (a : ℚ_[ℓ]) * (t σ).toAdd)
    (h : ∃! N : Module.End E V, IsNilpotent N ∧ ∃ J : OpenSubgroup deg.ker,
      ∀ σ : J, ρ σ = IsNilpotent.exp ((algebraMap (ℚ_[ℓ]) E (t σ).toAdd) • N))
    (h' : ∃! N : Module.End E V, IsNilpotent N ∧ ∃ J : OpenSubgroup deg.ker,
      ∀ σ : J, ρ σ = IsNilpotent.exp ((algebraMap (ℚ_[ℓ]) E (t' σ).toAdd) • N)) :
    monodromyOperator ρ t' h' = algebraMap (ℚ_[ℓ]) E (a : ℚ_[ℓ])⁻¹ •
      monodromyOperator ρ t h := by sorry

/-- Data form of the corrected Weil action. hN supplies the unique operator from
Grothendieck; ho states its consequence that correction has an open inertia kernel.
The genuine local-field binding proves both hypotheses. -/
def ofEllAdic (F : W) (hF : (deg F).toAdd = -1) (N : Module.End E V)
    (hN : IsNilpotent N)
    (hconj : ∀ w, ρ w ∘ₗ N = (q : E) ^ (deg w).toAdd • (N ∘ₗ ρ w))
    (ht : ∀ w (σ : deg.ker), t ⟨w * σ * w⁻¹, by sorry⟩ =
      Multiplicative.ofAdd ((q : ℚ_[ℓ]) ^ (deg w).toAdd * (t σ).toAdd))
    (ho : IsOpen {σ : deg.ker | ρ σ * IsNilpotent.exp (-algebraMap (ℚ_[ℓ]) E (t σ).toAdd • N) = 1}) :
    WeilDeligneRep W deg q E V := by sorry
lemma ofEllAdic_r (F : W) (hF : (deg F).toAdd = -1) (N : Module.End E V)
    (hN : IsNilpotent N)
    (hc : ∀ w, ρ w ∘ₗ N = (q : E) ^ (deg w).toAdd • (N ∘ₗ ρ w))
    (ht : ∀ w (σ : deg.ker), t ⟨w * σ * w⁻¹, by sorry⟩ =
      Multiplicative.ofAdd ((q : ℚ_[ℓ]) ^ (deg w).toAdd * (t σ).toAdd))
    (ho : IsOpen {σ : deg.ker | ρ σ * IsNilpotent.exp (-algebraMap (ℚ_[ℓ]) E (t σ).toAdd • N) = 1})
    (n : ℤ) (σ : deg.ker) :
    (ofEllAdic ρ t F hF N hN hc ht ho).r (F ^ n * σ) =
      ρ (F ^ n * σ) * IsNilpotent.exp (-algebraMap (ℚ_[ℓ]) E (t σ).toAdd • N) := by sorry
lemma ofEllAdic_N (F : W) (hF : (deg F).toAdd = -1) (N : Module.End E V)
    (hN : IsNilpotent N)
    (hc : ∀ w, ρ w ∘ₗ N = (q : E) ^ (deg w).toAdd • (N ∘ₗ ρ w))
    (ht : ∀ w (σ : deg.ker), t ⟨w * σ * w⁻¹, by sorry⟩ =
      Multiplicative.ofAdd ((q : ℚ_[ℓ]) ^ (deg w).toAdd * (t σ).toAdd))
    (ho : IsOpen {σ : deg.ker | ρ σ * IsNilpotent.exp (-algebraMap (ℚ_[ℓ]) E (t σ).toAdd • N) = 1}) :
    (ofEllAdic ρ t F hF N hN hc ht ho).N = N := by sorry
variable (F : W) (hF : (deg F).toAdd = -1) (N : Module.End E V)
    (hN : IsNilpotent N)
    (hc : ∀ w, ρ w ∘ₗ N = (q : E) ^ (deg w).toAdd • (N ∘ₗ ρ w))
    (ht : ∀ w (σ : deg.ker), t ⟨w * σ * w⁻¹, by sorry⟩ =
      Multiplicative.ofAdd ((q : ℚ_[ℓ]) ^ (deg w).toAdd * (t σ).toAdd))
    (ho : IsOpen {σ : deg.ker | ρ σ * IsNilpotent.exp (-algebraMap (ℚ_[ℓ]) E (t σ).toAdd • N) = 1})
lemma ofEllAdic_smooth (hz : N = 0) :
    (ofEllAdic ρ t F hF N hN hc ht ho).r = ρ := by sorry
-- Test: ArithmeticLocal.ofEllAdic_frobenius
example : (ofEllAdic ρ t F hF N hN hc ht ho).r F = ρ F := by sorry
-- Test: ArithmeticLocal.ofEllAdic_cancels_inertia
example (σ : deg.ker) (hσ : ρ σ = IsNilpotent.exp (algebraMap (ℚ_[ℓ]) E (t σ).toAdd • N)) :
    (ofEllAdic ρ t F hF N hN hc ht ho).r σ = 1 := by sorry
-- Test: ArithmeticLocal.ofEllAdic_zero_operator
example (hz : N = 0) : (ofEllAdic ρ t F hF N hN hc ht ho).N = 0 ∧
    (ofEllAdic ρ t F hF N hN hc ht ho).r = ρ := by sorry

/-- Geometric F' = F τ; the exact conjugator fixes the sign and side of τ. -/
theorem changeFrobenius_iso (hq : 1 < q) (τ : deg.ker) :
    ∃ f : WeilDeligneRep.Iso (ofEllAdic ρ t F hF N hN hc ht ho)
      (ofEllAdic ρ t (F * τ) (by sorry) N hN hc ht ho),
      f.toLinearEquiv.toLinearMap =
        IsNilpotent.exp ((((q : E) - 1)⁻¹ * algebraMap (ℚ_[ℓ]) E (t τ).toAdd) • N) := by sorry
end Monodromy
end ArithmeticLocal
namespace WeilDeligneRep
section Classification
variable {W Ω V : Type*} [Group W] [TopologicalSpace W] [IsTopologicalGroup W]
    {deg : W →* Multiplicative ℤ} {q : ℕ} [Field Ω] [CharZero Ω]
    [AddCommGroup V] [Module Ω V] [FiniteDimensional Ω V]
/-- Rescaling N preserves the isomorphism class; the isomorphism is not canonical. -/
theorem rescale_iso (D : WeilDeligneRep W deg q Ω V) (hI : CompactSpace deg.ker)
    (hq : 1 < q) (hdeg : Function.Surjective deg) (a : Ωˣ) :
    ∃ f : V ≃ₗ[Ω] V,
      (∀ w, f.toLinearMap ∘ₗ D.r w = D.r w ∘ₗ f.toLinearMap) ∧
      f.toLinearMap ∘ₗ D.N = (a : Ω) • (D.N ∘ₗ f.toLinearMap) := by sorry

/-- Target-level prototype for the indecomposable classification. The idempotent
condition is the concrete finite-length criterion for indecomposability. -/
theorem indecomposable_special [IsAlgClosed Ω] (D : WeilDeligneRep W deg q Ω V)
    (hI : CompactSpace deg.ker) (hq : 1 < q) (hdeg : Function.Surjective deg)
    (hD : D.IsFrobeniusSemisimple) (hV : 0 < Module.finrank Ω V)
    (hind : ∀ f : Hom D D, f.toLinearMap ∘ₗ f.toLinearMap = f.toLinearMap →
      f.toLinearMap = 0 ∨ f.toLinearMap = LinearMap.id) :
    ∃ (d n : ℕ) (r₀ : Representation Ω W (Fin d → Ω)),
      0 < d ∧ 0 < n ∧ r₀.IsIrreducible ∧
      ∃ hr : IsOpen {σ : deg.ker | r₀ σ = 1},
        Nonempty (Iso D ((ofSmooth (deg := deg) (q := q) r₀ hr).tensor (special deg q n))) := by sorry

theorem special_block_unique [IsAlgClosed Ω] (hI : CompactSpace deg.ker)
    (hq : 1 < q) (hdeg : Function.Surjective deg) (d d' n n' : ℕ)
    (r₀ : Representation Ω W (Fin d → Ω)) (r₁ : Representation Ω W (Fin d' → Ω))
    (h₀ : r₀.IsIrreducible) (h₁ : r₁.IsIrreducible) (hn : 0 < n) (hn' : 0 < n')
    (hr₀ : IsOpen {σ : deg.ker | r₀ σ = 1}) (hr₁ : IsOpen {σ : deg.ker | r₁ σ = 1})
    (h : Nonempty (Iso ((ofSmooth (deg := deg) (q := q) r₀ hr₀).tensor (special deg q n))
      ((ofSmooth (deg := deg) (q := q) r₁ hr₁).tensor (special deg q n')))) :
    n = n' ∧ Nonempty (Representation.Equiv r₀ r₁) := by sorry

theorem decomposition_special_blocks [IsAlgClosed Ω] (D : WeilDeligneRep W deg q Ω V)
    (hI : CompactSpace deg.ker) (hq : 1 < q) (hdeg : Function.Surjective deg)
    (hD : D.IsFrobeniusSemisimple) :
    ∃ (m : ℕ) (d n : Fin m → ℕ) (r : ∀ i, Representation Ω W (Fin (d i) → Ω))
      (hr : ∀ i, IsOpen {σ : deg.ker | r i σ = 1}),
      (∀ i, 0 < d i ∧ 0 < n i ∧ (r i).IsIrreducible) ∧
      Nonempty (Iso D (sumFamily (fun i =>
        (ofSmooth (deg := deg) (q := q) (r i) (hr i)).tensor (special deg q (n i))))) := by sorry

/-- The special object separates the two semisimplifications even though the
original Weil action is already semisimple. -/
theorem special_three_objects (Φ : W) (hΦ : (deg Φ).toAdd = 1)
    (hI : CompactSpace deg.ker) (hq : 1 < q) :
    (special (Ω := Ω) deg q 2).frobeniusSemisimplify Φ hΦ hI hq = special deg q 2 ∧
    ¬ Nonempty (Iso (special (Ω := Ω) deg q 2)
      (special (Ω := Ω) deg q 2).categoricalSemisimplify) := by sorry
theorem unramified_unipotent_three_objects (D : WeilDeligneRep W deg q Ω V)
    (Φ : W) (hΦ : (deg Φ).toAdd = 1) (hI : CompactSpace deg.ker) (hq : 1 < q)
    (hN : D.N = 0) (hin : ∀ σ : deg.ker, D.r σ = 1)
    (huni : IsNilpotent (D.r Φ - 1)) (hne : D.r Φ ≠ 1) :
    ¬ D.IsFrobeniusSemisimple ∧
      (D.frobeniusSemisimplify Φ hΦ hI hq).r = Representation.trivial Ω W V ∧
      Nonempty (Iso D.categoricalSemisimplify
        (ofSmooth (deg := deg) (q := q) (Representation.trivial Ω W V) (by sorry))) := by sorry

-- Concrete nontrivial unramified Jordan example on Ω²; degree Φ=1 is supplied.
example (Φ : W) (hΦ : (deg Φ).toAdd = 1) :
    ∃ D : WeilDeligneRep W deg q Ω (Fin 2 → Ω), D.N = 0 ∧
      (∀ w v, D.r w v = fun i => if i.val = 0 then
        v 0 + ((deg w).toAdd : Ω) * v 1 else v 1) ∧ D.r Φ ≠ 1 := by sorry
end Classification
end WeilDeligneRep
end TauCeti
