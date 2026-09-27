/-!
This file is not the roadmap and is not exhaustive. The roadmap document is definitive.
These signatures suggest Lean forms so contributors and reviewers converge on names and
interfaces. Admitted proofs are planning obligations, not implementation claims.

PARTIAL PROTOTYPE — NOT COMPILED. Mathlib 082e2d3; Tau Ceti f790474.
No period ring, Galois representation equivalence or Iwasawa comparison is postulated.
The tensor linearization is actual defining data of the admitted phi-module; existence
for a representation and its topology are separate obligations.

Fixed-coefficient linearity is not period-ring linearity. R -> S is explicit; in a
self-ring application its algebra map must be Frobenius, not the identity instance.
The scalar-plus psi/trace comparison is imported mathematically from existing owners.
-/
import Mathlib.LinearAlgebra.TensorProduct.Basic
import Mathlib.Algebra.Category.ModuleCat.Abelian
import Mathlib.Algebra.Homology.HomologicalComplex
import Mathlib.Algebra.Homology.Homotopy
import Mathlib.Algebra.Homology.ShortComplex.ModuleCat
import Mathlib.LinearAlgebra.Lagrange
import Mathlib.Data.ZMod.Basic

noncomputable section
open CategoryTheory
open scoped TensorProduct BigOperators
universe u v
namespace TauCeti.PhiGamma

section Linearization
variable {R S : Type u} [CommRing R] [CommRing S] [Algebra R S]
variable {M : Type v} [AddCommGroup M] [Module R M]
variable {N : Type v} [AddCommGroup N] [Module S N] [Module R N]
  [IsScalarTower R S N]

/-- Balanced extension of the already constructed scalar psi. -/
def psiTensor (r : S →ₗ[R] R) : S ⊗[R] M →ₗ[R] M :=
  TensorProduct.lift
    { toFun := fun s =>
        { toFun := fun m => r s • m
          map_add' := by sorry
          map_smul' := by sorry }
      map_add' := by sorry
      map_smul' := by sorry }
lemma psiTensor_tmul (r : S →ₗ[R] R) (s : S) (m : M) :
    psiTensor r (s ⊗ₜ[R] m) = r s • m := by sorry
lemma psiTensor_one (r : S →ₗ[R] R) (hr : r 1 = 1) (m : M) :
    psiTensor r ((1 : S) ⊗ₜ[R] m) = m := by sorry
lemma psiTensor_zero (r : S →ₗ[R] R) : psiTensor (M := M) r 0 = 0 := by sorry

/-- Source and target can differ at a fixed annular radius. -/
def psiOfLinearization (r : S →ₗ[R] R) (L : S ⊗[R] M ≃ₗ[S] N) : N →ₗ[R] M where
  toFun x := psiTensor r (L.symm x)
  map_add' := by sorry
  map_smul' := by sorry
lemma psiOfLinearization_pure (r : S →ₗ[R] R) (L : S ⊗[R] M ≃ₗ[S] N)
    (s : S) (m : M) : psiOfLinearization r L (L (s ⊗ₜ[R] m)) = r s • m := by sorry
lemma psiOfLinearization_leftInverse (r : S →ₗ[R] R) (hr : r 1 = 1)
    (L : S ⊗[R] M ≃ₗ[S] N) (m : M) :
    psiOfLinearization r L (L ((1 : S) ⊗ₜ[R] m)) = m := by sorry
lemma psiOfLinearization_zero (r : S →ₗ[R] R) (L : S ⊗[R] M ≃ₗ[S] N) :
    psiOfLinearization r L 0 = 0 := by sorry

theorem psiOfLinearization_unique (r : S →ₗ[R] R) (L : S ⊗[R] M ≃ₗ[S] N)
    (q : N →ₗ[R] M) (hq : ∀ s m, q (L (s ⊗ₜ[R] m)) = r s • m) :
    q = psiOfLinearization r L := by sorry

theorem psiOfLinearization_natural
    {M' N' : Type v} [AddCommGroup M'] [Module R M'] [AddCommGroup N']
    [Module S N'] [Module R N'] [IsScalarTower R S N']
    (r : S →ₗ[R] R) (L : S ⊗[R] M ≃ₗ[S] N) (L' : S ⊗[R] M' ≃ₗ[S] N')
    (f : M →ₗ[R] M') (g : N →ₗ[S] N')
    (hg : ∀ s m, g (L (s ⊗ₜ[R] m)) = L' (s ⊗ₜ[R] f m)) (x : N) :
    psiOfLinearization r L' (g x) = f (psiOfLinearization r L x) := by sorry

theorem psiOfLinearization_semilinear
    (r : S →ₗ[R] R) (L : S ⊗[R] M ≃ₗ[S] N)
    (σR : R →+* R) (σS : S →+* S)
    (hσ : ∀ a, σS (algebraMap R S a) = algebraMap R S (σR a))
    (gM : M →ₛₗ[σR] M) (gN : N →ₛₗ[σS] N)
    (hr : ∀ s, r (σS s) = σR (r s))
    (hg : ∀ s m, gN (L (s ⊗ₜ[R] m)) = L (σS s ⊗ₜ[R] gM m)) (x : N) :
    psiOfLinearization r L (gN x) = gM (psiOfLinearization r L x) := by sorry

/-- Coordinate continuity is required, not inferred from algebraic freeness. -/
theorem psiOfLinearization_continuous
    [TopologicalSpace M] [IsTopologicalAddGroup M] [ContinuousConstSMul R M]
    [TopologicalSpace N] {ι : Type*} [Fintype ι]
    (r : S →ₗ[R] R) (L : S ⊗[R] M ≃ₗ[S] N)
    (b : ι → S) (c : ι → N → M) (hc : ∀ i, Continuous (c i))
    (hexp : ∀ x, x = ∑ i, L (b i ⊗ₜ[R] c i x)) :
    Continuous (psiOfLinearization r L) := by sorry

-- TEST tensor_zero
example (r : S →ₗ[R] R) : psiTensor (M := M) r 0 = 0 := by sorry
-- TEST tensor_identity_scalar
example : psiTensor (LinearMap.id : ℚ →ₗ[ℚ] ℚ) ((2 : ℚ) ⊗ₜ[ℚ] (3 : ℚ)) = 6 := by sorry
-- TEST tensor_projection_not_product
example :
    psiTensor (LinearMap.fst ℚ ℚ ℚ) ((0,1) ⊗ₜ[ℚ] (7 : ℚ)) = 0 ∧
    psiTensor (LinearMap.fst ℚ ℚ ℚ) ((1,0) ⊗ₜ[ℚ] (7 : ℚ)) = 7 := by sorry
-- TEST linearized_zero
example (r : S →ₗ[R] R) (L : S ⊗[R] M ≃ₗ[S] N) :
    psiOfLinearization r L 0 = 0 := by sorry
-- TEST linearized_scaled
example (L : ℚ ⊗[ℚ] ℚ ≃ₗ[ℚ] ℚ) (hL : ∀ s m, L (s ⊗ₜ[ℚ] m) = 2*s*m) :
    psiOfLinearization (LinearMap.id : ℚ →ₗ[ℚ] ℚ) L 6 = 3 := by sorry
-- TEST linearized_torsion: not division of a zero reduced trace.
example (L : ℤ ⊗[ℤ] ZMod 5 ≃ₗ[ℤ] ZMod 5)
    (hL : ∀ s m, L (s ⊗ₜ[ℤ] m) = s • m) :
    psiOfLinearization (LinearMap.id : ℤ →ₗ[ℤ] ℤ) L 1 = 1 ∧
      (5 : ZMod 5) * 1 = 0 := by sorry
end Linearization

section RankOne
variable {A : Type*} [CommRing A]
def rankOnePsi (ψ : A →+ A) (a : Aˣ) : A →+ A where
  toFun f := ψ ((↑a⁻¹ : A) * f)
  map_zero' := by sorry
  map_add' := by sorry
lemma rankOnePsi_apply (ψ : A →+ A) (a : Aˣ) (f : A) :
    rankOnePsi ψ a f = ψ ((↑a⁻¹ : A) * f) := by sorry
lemma rankOnePsi_one (ψ : A →+ A) : rankOnePsi ψ 1 = ψ := by sorry
lemma rankOnePsi_zero (ψ : A →+ A) (a : Aˣ) : rankOnePsi ψ a 0 = 0 := by sorry
lemma rankOnePsi_phi (φ : A →+* A) (ψ : A →+ A)
    (h : ∀ f, ψ (φ f) = f) (a : Aˣ) (f : A) :
    rankOnePsi ψ a ((a : A) * φ f) = f := by sorry

theorem rankOnePsi_changeBasis (φ : A →+* A) (ψ : A →+ A)
    (hproj : ∀ c f, ψ (φ c * f) = c * ψ f) (a b : Aˣ) (f : A) :
    rankOnePsi ψ (Units.map φ.toMonoidHom b * a * b⁻¹) ((↑b⁻¹ : A) * f) =
      (↑b⁻¹ : A) * rankOnePsi ψ a f := by sorry

private def pairUnit (a b : ℚˣ) : (ℚ × ℚ)ˣ where
  val := ((a : ℚ), (b : ℚ))
  inv := ((↑a⁻¹ : ℚ), (↑b⁻¹ : ℚ))
  val_inv := by sorry
  inv_val := by sorry
private def swapAdd : (ℚ × ℚ) →+ (ℚ × ℚ) where
  toFun x := (x.2,x.1)
  map_zero' := rfl
  map_add' := by intros; rfl
-- TEST rank_one_half
example : rankOnePsi (AddMonoidHom.id ℚ) (Units.mk0 2 (by decide)) 6 = 3 := by sorry
-- TEST rank_one_negative
example : rankOnePsi (AddMonoidHom.id ℚ) (Units.mk0 (-1) (by decide)) 7 = -7 := by sorry
-- TEST rank_one_no_pullout
example : rankOnePsi swapAdd (pairUnit (Units.mk0 2 (by decide)) (Units.mk0 3 (by decide))) 1 =
    ((1/3 : ℚ), (1/2 : ℚ)) ∧
    rankOnePsi swapAdd (pairUnit (Units.mk0 2 (by decide)) (Units.mk0 3 (by decide))) 1 ≠
      ((1/2 : ℚ), (1/3 : ℚ)) := by sorry
end RankOne

section Operators
variable {C : Type u} [CommRing C] {M : Type v} [AddCommGroup M] [Module C M]

/-- C-linearity, not period-ring linearity. -/
def psiProjection (φ ψ : M →ₗ[C] M) (hψφ : ψ.comp φ = LinearMap.id) :
    M →ₗ[C] LinearMap.ker ψ where
  toFun x := ⟨x - φ (ψ x), by sorry⟩
  map_add' := by sorry
  map_smul' := by sorry
lemma psiProjection_val (φ ψ : M →ₗ[C] M) (hψφ : ψ.comp φ = LinearMap.id) (x : M) :
    (psiProjection φ ψ hψφ x : M) = x - φ (ψ x) := by sorry
lemma psiProjection_phi (φ ψ : M →ₗ[C] M) (hψφ : ψ.comp φ = LinearMap.id) (x : M) :
    psiProjection φ ψ hψφ (φ x) = 0 := by sorry
lemma psiProjection_onKer (φ ψ : M →ₗ[C] M) (hψφ : ψ.comp φ = LinearMap.id)
    (x : LinearMap.ker ψ) : psiProjection φ ψ hψφ x = x := by sorry

theorem psiProjection_uniqueSplit (φ ψ : M →ₗ[C] M) (hψφ : ψ.comp φ = LinearMap.id)
    (x : M) : ∃! mk : M × LinearMap.ker ψ, x = φ mk.1 + (mk.2 : M) := by sorry

def oneSubPhiOnPsiOne (φ ψ : M →ₗ[C] M) (hψφ : ψ.comp φ = LinearMap.id) :
    LinearMap.ker (ψ - LinearMap.id) →ₗ[C] LinearMap.ker ψ where
  toFun x := ⟨x.val - φ x.val, by sorry⟩
  map_add' := by sorry
  map_smul' := by sorry
lemma oneSubPhiOnPsiOne_val (φ ψ : M →ₗ[C] M) (hψφ : ψ.comp φ = LinearMap.id)
    (x : LinearMap.ker (ψ - LinearMap.id)) :
    (oneSubPhiOnPsiOne φ ψ hψφ x : M) = x.val - φ x.val := by sorry
lemma oneSubPhiOnPsiOne_zero (φ ψ : M →ₗ[C] M) (hψφ : ψ.comp φ = LinearMap.id) :
    oneSubPhiOnPsiOne φ ψ hψφ 0 = 0 := by sorry
lemma oneSubPhiOnPsiOne_vanish (φ ψ : M →ₗ[C] M) (hψφ : ψ.comp φ = LinearMap.id)
    (x : LinearMap.ker (ψ - LinearMap.id)) :
    oneSubPhiOnPsiOne φ ψ hψφ x = 0 ↔ φ x.val = x.val := by sorry

private def herrD0 (F G : M →ₗ[C] M) : M →ₗ[C] M × M :=
  (F - LinearMap.id).prod (G - LinearMap.id)
private def herrD1 (F G : M →ₗ[C] M) : M × M →ₗ[C] M :=
  (G - LinearMap.id).comp (LinearMap.fst C M M) -
    (F - LinearMap.id).comp (LinearMap.snd C M M)
lemma herrDifferentials_sq (F G : M →ₗ[C] M) (hFG : F.comp G = G.comp F) :
    (herrD1 F G).comp (herrD0 F G) = 0 := by sorry

private def herrTerm (C : Type u) [CommRing C] (M : Type v) [AddCommGroup M] [Module C M] :
    ℕ → ModuleCat.{v} C
  | 0 => ModuleCat.of C M
  | 1 => ModuleCat.of C (M × M)
  | 2 => ModuleCat.of C M
  | _ => ModuleCat.of C (Fin 0 → M)
private def herrDiff (F G : M →ₗ[C] M) :
    ∀ n : ℕ, herrTerm C M n ⟶ herrTerm C M (n+1)
  | 0 => ModuleCat.ofHom (herrD0 F G)
  | 1 => ModuleCat.ofHom (herrD1 F G)
  | _ => 0

def herrComplex (F G : M →ₗ[C] M) (hFG : F.comp G = G.comp F) :
    CochainComplex (ModuleCat.{v} C) ℕ :=
  CochainComplex.of (herrTerm C M) (herrDiff F G) (by intro n; sorry)
lemma herrComplex_d0 (F G : M →ₗ[C] M) (hFG : F.comp G = G.comp F) (x : M) :
    (herrComplex F G hFG).d 0 1 x = (F x - x, G x - x) := by sorry
lemma herrComplex_d1 (F G : M →ₗ[C] M) (hFG : F.comp G = G.comp F) (a b : M) :
    (herrComplex F G hFG).d 1 2 (a,b) = (G a - a) - (F b - b) := by sorry
lemma herrComplex_above_two (F G : M →ₗ[C] M) (hFG : F.comp G = G.comp F)
    (n : ℕ) (hn : 3 ≤ n) : Subsingleton ((herrComplex F G hFG).X n) := by sorry

variable {M' : Type v} [AddCommGroup M'] [Module C M']
def herrMap (F G : M →ₗ[C] M) (F' G' : M' →ₗ[C] M')
    (hFG : F.comp G = G.comp F) (hFG' : F'.comp G' = G'.comp F')
    (h : M →ₗ[C] M') (hF : h.comp F = F'.comp h) (hG : h.comp G = G'.comp h) :
    herrComplex F G hFG ⟶ herrComplex F' G' hFG' :=
  CochainComplex.ofHom (fun n => match n with
    | 0 => ModuleCat.ofHom h
    | 1 => ModuleCat.ofHom (h.prodMap h)
    | 2 => ModuleCat.ofHom h
    | _ => 0) (by intro n; sorry)
lemma herrMap_f0 (F G : M →ₗ[C] M) (F' G' : M' →ₗ[C] M')
    (hFG : F.comp G = G.comp F) (hFG' : F'.comp G' = G'.comp F')
    (h : M →ₗ[C] M') (hF : h.comp F = F'.comp h) (hG : h.comp G = G'.comp h) (x : M) :
    (herrMap F G F' G' hFG hFG' h hF hG).f 0 x = h x := by sorry
lemma herrMap_f1 (F G : M →ₗ[C] M) (F' G' : M' →ₗ[C] M')
    (hFG : F.comp G = G.comp F) (hFG' : F'.comp G' = G'.comp F')
    (h : M →ₗ[C] M') (hF : h.comp F = F'.comp h) (hG : h.comp G = G'.comp h) (a b : M) :
    (herrMap F G F' G' hFG hFG' h hF hG).f 1 (a,b) = (h a,h b) := by sorry
lemma herrMap_f2 (F G : M →ₗ[C] M) (F' G' : M' →ₗ[C] M')
    (hFG : F.comp G = G.comp F) (hFG' : F'.comp G' = G'.comp F')
    (h : M →ₗ[C] M') (hF : h.comp F = F'.comp h) (hG : h.comp G = G'.comp h) (x : M) :
    (herrMap F G F' G' hFG hFG' h hF hG).f 2 x = h x := by sorry

def phiPsiComparison (φ ψ γ : M →ₗ[C] M)
    (hφγ : φ.comp γ = γ.comp φ) (hψγ : ψ.comp γ = γ.comp ψ)
    (hψφ : ψ.comp φ = LinearMap.id) :
    herrComplex φ γ hφγ ⟶ herrComplex ψ γ hψγ :=
  CochainComplex.ofHom (fun n => match n with
    | 0 => ModuleCat.ofHom LinearMap.id
    | 1 => ModuleCat.ofHom ((-ψ).prodMap LinearMap.id)
    | 2 => ModuleCat.ofHom (-ψ)
    | _ => 0) (by intro n; sorry)

variable (φ ψ γ : M →ₗ[C] M)
variable (hφγ : φ.comp γ = γ.comp φ) (hψγ : ψ.comp γ = γ.comp ψ)
variable (hψφ : ψ.comp φ = LinearMap.id)
lemma phiPsiComparison_f0 (x : M) : (phiPsiComparison φ ψ γ hφγ hψγ hψφ).f 0 x = x := by sorry
lemma phiPsiComparison_f1 (a b : M) :
    (phiPsiComparison φ ψ γ hφγ hψγ hψφ).f 1 (a,b) = (-ψ a,b) := by sorry
lemma phiPsiComparison_f2 (x : M) :
    (phiPsiComparison φ ψ γ hφγ hψγ hψφ).f 2 x = -ψ x := by sorry
lemma phiPsiComparison_surjective (n : ℕ) :
    Function.Surjective ((phiPsiComparison φ ψ γ hφγ hψγ hψφ).f n) := by sorry
lemma phiPsiComparison_kernel :
    (∀ x : M, (phiPsiComparison φ ψ γ hφγ hψγ hψφ).f 0 x = 0 ↔ x = 0) ∧
    (∀ a b : M, (phiPsiComparison φ ψ γ hφγ hψγ hψφ).f 1 (a,b) = 0 ↔ ψ a = 0 ∧ b = 0) ∧
    (∀ x : M, (phiPsiComparison φ ψ γ hφγ hψγ hψφ).f 2 x = 0 ↔ ψ x = 0) ∧
    (∀ k : LinearMap.ker ψ, (herrComplex φ γ hφγ).d 1 2 ((k : M),0) = γ k - k) := by sorry

def kernelResolvent (e : LinearMap.ker ψ ≃ₗ[C] LinearMap.ker ψ) : M →ₗ[C] M :=
  (LinearMap.ker ψ).subtype.comp (e.symm.toLinearMap.comp (psiProjection φ ψ hψφ))
variable (e : LinearMap.ker ψ ≃ₗ[C] LinearMap.ker ψ)
variable (he : ∀ k : LinearMap.ker ψ, (e k : M) = γ k - k)
lemma kernelResolvent_formula (x : M) :
    kernelResolvent φ ψ hψφ e x = (e.symm (psiProjection φ ψ hψφ x) : M) := by sorry
lemma kernelResolvent_mem (x : M) : ψ (kernelResolvent φ ψ hψφ e x) = 0 := by sorry

-- Explicit binders retain hypotheses even when the prototype proof is admitted.
lemma kernelResolvent_spec (φ ψ γ : M →ₗ[C] M)
    (hφγ : φ.comp γ = γ.comp φ) (hψγ : ψ.comp γ = γ.comp ψ)
    (hψφ : ψ.comp φ = LinearMap.id)
    (e : LinearMap.ker ψ ≃ₗ[C] LinearMap.ker ψ)
    (he : ∀ k : LinearMap.ker ψ, (e k : M) = γ k - k) (x : M) :
    γ (kernelResolvent φ ψ hψφ e x) - kernelResolvent φ ψ hψφ e x = x - φ (ψ x) ∧
    kernelResolvent φ ψ hψφ e (γ x - x) = x - φ (ψ x) ∧
    kernelResolvent φ ψ hψφ e (φ x) = 0 ∧
    ψ (kernelResolvent φ ψ hψφ e x) = 0 := by sorry

def herrComparisonSection (φ ψ γ : M →ₗ[C] M)
    (hφγ : φ.comp γ = γ.comp φ) (hψγ : ψ.comp γ = γ.comp ψ)
    (hψφ : ψ.comp φ = LinearMap.id)
    (e : LinearMap.ker ψ ≃ₗ[C] LinearMap.ker ψ)
    (he : ∀ k : LinearMap.ker ψ, (e k : M) = γ k - k) :
    herrComplex ψ γ hψγ ⟶ herrComplex φ γ hφγ :=
  CochainComplex.ofHom (fun n => match n with
    | 0 => ModuleCat.ofHom LinearMap.id
    | 1 => ModuleCat.ofHom
        (((-φ).comp (LinearMap.fst C M M) -
          (kernelResolvent φ ψ hψφ e).comp (LinearMap.snd C M M)).prod (LinearMap.snd C M M))
    | 2 => ModuleCat.ofHom (-φ)
    | _ => 0) (by intro n; sorry)
lemma herrComparisonSection_f0 (x : M) :
    (herrComparisonSection φ ψ γ hφγ hψγ hψφ e he).f 0 x = x := by sorry
lemma herrComparisonSection_f1 (a b : M) :
    (herrComparisonSection φ ψ γ hφγ hψγ hψφ e he).f 1 (a,b) =
      (-φ a - kernelResolvent φ ψ hψφ e b,b) := by sorry
lemma herrComparisonSection_f2 (x : M) :
    (herrComparisonSection φ ψ γ hφγ hψγ hψφ e he).f 2 x = -φ x := by sorry
lemma herrComparisonSection_rightInverse :
    herrComparisonSection φ ψ γ hφγ hψγ hψφ e he ≫
      phiPsiComparison φ ψ γ hφγ hψγ hψφ = 𝟙 (herrComplex ψ γ hψγ) := by sorry

/-- Only the component from degree 2 to degree 1 is nonzero. -/
def herrComparisonHomotopy :
    Homotopy (𝟙 (herrComplex φ γ hφγ))
      (phiPsiComparison φ ψ γ hφγ hψγ hψφ ≫
        herrComparisonSection φ ψ γ hφγ hψγ hψφ e he) where
  hom i j := match i,j with
    | 2,1 => ModuleCat.ofHom ((kernelResolvent φ ψ hψφ e).prod 0)
    | _,_ => 0
  zero := by intros; sorry
  comm := by intro i; sorry
lemma herrComparisonHomotopy_h1 :
    (herrComparisonHomotopy φ ψ γ hφγ hψγ hψφ e he).hom 1 0 = 0 := by sorry
lemma herrComparisonHomotopy_h2 (x : M) :
    (herrComparisonHomotopy φ ψ γ hφγ hψγ hψφ e he).hom 2 1 x =
      (kernelResolvent φ ψ hψφ e x,0) := by sorry
lemma herrComparisonHomotopy_identity (i : ℕ) :
    (𝟙 (herrComplex φ γ hφγ)).f i =
      dNext i (herrComparisonHomotopy φ ψ γ hφγ hψγ hψφ e he).hom +
      prevD i (herrComparisonHomotopy φ ψ γ hφγ hψγ hψφ e he).hom +
      (phiPsiComparison φ ψ γ hφγ hψγ hψφ ≫
        herrComparisonSection φ ψ γ hφγ hψγ hψφ e he).f i := by sorry

def herrComparisonEquiv :
    HomotopyEquiv (herrComplex φ γ hφγ) (herrComplex ψ γ hψγ) where
  hom := phiPsiComparison φ ψ γ hφγ hψγ hψφ
  inv := herrComparisonSection φ ψ γ hφγ hψγ hψφ e he
  homotopyHomInvId := (herrComparisonHomotopy φ ψ γ hφγ hψγ hψφ e he).symm
  homotopyInvHomId := Homotopy.ofEq (herrComparisonSection_rightInverse φ ψ γ hφγ hψγ hψφ e he)
lemma herrComparisonEquiv_hom :
    (herrComparisonEquiv φ ψ γ hφγ hψγ hψφ e he).hom =
      phiPsiComparison φ ψ γ hφγ hψγ hψφ := by sorry
lemma herrComparisonEquiv_inv :
    (herrComparisonEquiv φ ψ γ hφγ hψγ hψφ e he).inv =
      herrComparisonSection φ ψ γ hφγ hψγ hψφ e he := by sorry
lemma herrComparisonEquiv_homology (i : ℕ) :
    ((herrComparisonEquiv φ ψ γ hφγ hψγ hψφ e he).toHomologyIso i).hom =
      HomologicalComplex.homologyMap (phiPsiComparison φ ψ γ hφγ hψγ hψφ) i := by sorry
end Operators

section Generator
variable {C : Type u} [CommRing C] {M : Type v} [AddCommGroup M] [Module C M]
private lemma commutePower (F G : M →ₗ[C] M) (hFG : F.comp G = G.comp F) (n : ℕ) :
    F.comp (G^n) = (G^n).comp F := by sorry

def herrGeneratorMap (F G : M →ₗ[C] M) (hFG : F.comp G = G.comp F) (n : ℕ) :
    herrComplex F G hFG ⟶ herrComplex F (G^n) (commutePower F G hFG n) :=
  CochainComplex.ofHom (fun k => match k with
    | 0 => ModuleCat.ofHom LinearMap.id
    | 1 => ModuleCat.ofHom (LinearMap.id.prodMap (∑ i ∈ Finset.range n, G^i))
    | 2 => ModuleCat.ofHom (∑ i ∈ Finset.range n, G^i)
    | _ => 0) (by intro k; sorry)
lemma herrGeneratorMap_f0 (F G : M →ₗ[C] M) (hFG : F.comp G = G.comp F) (n : ℕ) (x : M) :
    (herrGeneratorMap F G hFG n).f 0 x = x := by sorry
lemma herrGeneratorMap_f1 (F G : M →ₗ[C] M) (hFG : F.comp G = G.comp F) (n : ℕ) (a b : M) :
    (herrGeneratorMap F G hFG n).f 1 (a,b) = (a,(∑ i ∈ Finset.range n, G^i) b) := by sorry
lemma herrGeneratorMap_f2 (F G : M →ₗ[C] M) (hFG : F.comp G = G.comp F) (n : ℕ) (x : M) :
    (herrGeneratorMap F G hFG n).f 2 x = (∑ i ∈ Finset.range n, G^i) x := by sorry

theorem herrGeneratorMap_isIso (F G : M →ₗ[C] M) (hFG : F.comp G = G.comp F) (n : ℕ)
    (hunit : IsUnit (∑ i ∈ Finset.range n, G^i)) : IsIso (herrGeneratorMap F G hFG n) := by sorry
-- TEST generator_one
example (F G : M →ₗ[C] M) (hFG : F.comp G = G.comp F) (a b : M) :
    (herrGeneratorMap F G hFG 1).f 1 (a,b) = (a,b) := by sorry
-- TEST generator_geometric_sum
example : (∑ i ∈ Finset.range 3, ((2 : ℚ) • (LinearMap.id : ℚ →ₗ[ℚ] ℚ))^i) 1 = 7 := by sorry
-- TEST generator_divisible_index
example : (∑ i ∈ Finset.range 3, (LinearMap.id : ZMod 3 →ₗ[ZMod 3] ZMod 3)^i) = 0 ∧
    ¬ IsUnit (∑ i ∈ Finset.range 3, (LinearMap.id : ZMod 3 →ₗ[ZMod 3] ZMod 3)^i) := by sorry
end Generator

section PsiComplex
variable {C : Type u} [CommRing C] {M : Type v} [AddCommGroup M] [Module C M]
private def psiTerm (C : Type u) [CommRing C] (M : Type v) [AddCommGroup M] [Module C M] :
    ℕ → ModuleCat.{v} C
  | 1 => ModuleCat.of C M
  | 2 => ModuleCat.of C M
  | _ => ModuleCat.of C (Fin 0 → M)
private def psiDiff (ψ : M →ₗ[C] M) : ∀ n : ℕ, psiTerm C M n ⟶ psiTerm C M (n+1)
  | 1 => ModuleCat.ofHom (ψ - LinearMap.id)
  | _ => 0

def psiComplex (ψ : M →ₗ[C] M) : CochainComplex (ModuleCat.{v} C) ℕ :=
  CochainComplex.of (psiTerm C M) (psiDiff ψ) (by intro n; sorry)
lemma psiComplex_d12 (ψ : M →ₗ[C] M) (x : M) : (psiComplex ψ).d 1 2 x = ψ x - x := by sorry
lemma psiComplex_X1 (ψ : M →ₗ[C] M) : (psiComplex ψ).X 1 = ModuleCat.of C M := by sorry
lemma psiComplex_X2 (ψ : M →ₗ[C] M) : (psiComplex ψ).X 2 = ModuleCat.of C M := by sorry

variable {M' : Type v} [AddCommGroup M'] [Module C M']
def psiComplexMap (ψ : M →ₗ[C] M) (ψ' : M' →ₗ[C] M')
    (h : M →ₗ[C] M') (hh : h.comp ψ = ψ'.comp h) : psiComplex ψ ⟶ psiComplex ψ' :=
  CochainComplex.ofHom (fun n => match n with
    | 1 => ModuleCat.ofHom h
    | 2 => ModuleCat.ofHom h
    | _ => 0) (by intro n; sorry)
lemma psiComplexMap_f1 (ψ : M →ₗ[C] M) (ψ' : M' →ₗ[C] M')
    (h : M →ₗ[C] M') (hh : h.comp ψ = ψ'.comp h) (x : M) :
    (psiComplexMap ψ ψ' h hh).f 1 x = h x := by sorry
lemma psiComplexMap_f2 (ψ : M →ₗ[C] M) (ψ' : M' →ₗ[C] M')
    (h : M →ₗ[C] M') (hh : h.comp ψ = ψ'.comp h) (x : M) :
    (psiComplexMap ψ ψ' h hh).f 2 x = h x := by sorry
lemma psiComplexMap_id (ψ : M →ₗ[C] M) :
    psiComplexMap ψ ψ LinearMap.id (by simp) = 𝟙 (psiComplex ψ) := by sorry

/-- Native short-complex homology followed by quotient by zero. This is not a
 definition of Galois or Iwasawa cohomology. -/
def psiComplexH1Iso (ψ : M →ₗ[C] M) :
    (psiComplex ψ).homology 1 ≅ ModuleCat.of C (LinearMap.ker (ψ - LinearMap.id)) := by sorry
/-- The native homology map sends the class of x to x modulo the actual range. -/
def psiComplexH2Iso (ψ : M →ₗ[C] M) :
    (psiComplex ψ).homology 2 ≅ ModuleCat.of C (M ⧸ LinearMap.range (ψ - LinearMap.id)) := by sorry

-- TEST psi_complex_identity
example (x : ℚ) : (psiComplex (LinearMap.id : ℚ →ₗ[ℚ] ℚ)).d 1 2 x = 0 := by sorry
-- TEST psi_complex_zero_operator
example (x : ℚ) : (psiComplex (0 : ℚ →ₗ[ℚ] ℚ)).d 1 2 x = -x ∧
    LinearMap.ker (0 - (LinearMap.id : ℚ →ₗ[ℚ] ℚ)) = ⊥ ∧
    LinearMap.range (0 - (LinearMap.id : ℚ →ₗ[ℚ] ℚ)) = ⊤ := by sorry
-- TEST psi_complex_degree_zero
example : Subsingleton ((psiComplex (LinearMap.id : ℚ →ₗ[ℚ] ℚ)).X 0) ∧
    ¬ Subsingleton ((psiComplex (LinearMap.id : ℚ →ₗ[ℚ] ℚ)).X 1) := by sorry
-- TEST psi_map_zero
example (ψ : M →ₗ[C] M) : psiComplexMap ψ ψ 0 (by simp) = 0 := by sorry
-- TEST psi_map_identity
example (ψ : M →ₗ[C] M) : psiComplexMap ψ ψ LinearMap.id (by simp) = 𝟙 (psiComplex ψ) := by sorry
-- TEST psi_map_composition
example :
    (psiComplexMap (LinearMap.id : ℚ →ₗ[ℚ] ℚ) LinearMap.id (2 • LinearMap.id) (by simp) ≫
      psiComplexMap LinearMap.id LinearMap.id (3 • LinearMap.id) (by simp)).f 1 7 = 42 := by sorry
end PsiComplex

/-! Private finite algebra fixtures, not production period-ring operators. -/
namespace Tests
open Polynomial
private def phiP (p : ℕ) : ℚ[X] →ₗ[ℚ] ℚ[X] := (Polynomial.aeval (X^p : ℚ[X])).toLinearMap
private def psiP (p : ℕ) : ℚ[X] →ₗ[ℚ] ℚ[X] where
  toFun f := f.sum fun n a => if p ∣ n then Polynomial.monomial (n / p) a else 0
  map_add' := by sorry
  map_smul' := by sorry
private def gammaP : ℚ[X] →ₗ[ℚ] ℚ[X] := 2 • LinearMap.id
private lemma testLeft (p : ℕ) (hp : 0 < p) : (psiP p).comp (phiP p) = LinearMap.id := by sorry
private lemma testPhiGamma (p : ℕ) : (phiP p).comp gammaP = gammaP.comp (phiP p) := by sorry
private lemma testPsiGamma (p : ℕ) : (psiP p).comp gammaP = gammaP.comp (psiP p) := by sorry
private def testKernelEquiv (p : ℕ) : LinearMap.ker (psiP p) ≃ₗ[ℚ] LinearMap.ker (psiP p) :=
  LinearEquiv.refl ℚ _
private lemma testKernelSpec (p : ℕ) (k : LinearMap.ker (psiP p)) :
    (testKernelEquiv p k : ℚ[X]) = gammaP k - k := by sorry
private def F3 := phiPsiComparison (phiP 3) (psiP 3) gammaP
  (testPhiGamma 3) (testPsiGamma 3) (testLeft 3 (by decide))
private def S3 := herrComparisonSection (phiP 3) (psiP 3) gammaP
  (testPhiGamma 3) (testPsiGamma 3) (testLeft 3 (by decide)) (testKernelEquiv 3) (testKernelSpec 3)
private def H3 := herrComparisonHomotopy (phiP 3) (psiP 3) gammaP
  (testPhiGamma 3) (testPsiGamma 3) (testLeft 3 (by decide)) (testKernelEquiv 3) (testKernelSpec 3)
private def E3 := herrComparisonEquiv (phiP 3) (psiP 3) gammaP
  (testPhiGamma 3) (testPsiGamma 3) (testLeft 3 (by decide)) (testKernelEquiv 3) (testKernelSpec 3)

-- TEST projection_zero_kernel
example (x : ℚ) : psiProjection LinearMap.id LinearMap.id (by ext; rfl) x = 0 := by sorry
-- TEST projection_nonzero_kernel
example : (psiProjection (phiP 3) (psiP 3) (testLeft 3 (by decide)) X : ℚ[X]) = X := by sorry
-- TEST projection_frobenius_image
example : psiProjection (phiP 3) (psiP 3) (testLeft 3 (by decide)) (X^3) = 0 := by sorry
-- TEST one_sub_phi_identity
example : oneSubPhiOnPsiOne (LinearMap.id : ℚ →ₗ[ℚ] ℚ) LinearMap.id (by ext; rfl) = 0 := by sorry
-- TEST one_sub_phi_zero
example : oneSubPhiOnPsiOne (phiP 3) (psiP 3) (testLeft 3 (by decide)) 0 = 0 := by sorry
-- TEST one_sub_phi_not_surjective
example : oneSubPhiOnPsiOne (phiP 2) (psiP 2) (testLeft 2 (by decide)) = 0 ∧
    psiP 2 X = 0 ∧ (X : ℚ[X]) ≠ 0 := by sorry
-- TEST herr_trivial_actions
example :
    (herrComplex (LinearMap.id : ℚ →ₗ[ℚ] ℚ) LinearMap.id (by ext; rfl)).d 0 1 1 = (0,0) ∧
    (herrComplex (LinearMap.id : ℚ →ₗ[ℚ] ℚ) LinearMap.id (by ext; rfl)).d 1 2 (7,11) = 0 := by sorry
-- TEST herr_numeric_sign
example :
    (herrComplex (2 • (LinearMap.id : ℚ →ₗ[ℚ] ℚ)) (3 • LinearMap.id) (by ext; simp)).d 0 1 7 = (7,14) ∧
    (herrComplex (2 • (LinearMap.id : ℚ →ₗ[ℚ] ℚ)) (3 • LinearMap.id) (by ext; simp)).d 1 2 (5,11) = -1 := by sorry
-- TEST herr_wrong_sign
example : (3 * (2-1) - (2-1) + (2 * (3-1) - (3-1)) : ℚ) = 4 ∧
    (3 * (2-1) - (2-1) + (2 * (3-1) - (3-1)) : ℚ) ≠ 0 := by sorry
-- TEST herr_map_identity
example (F G : ℚ →ₗ[ℚ] ℚ) (hFG : F.comp G = G.comp F) :
    herrMap F G F G hFG hFG LinearMap.id (by simp) (by simp) = 𝟙 (herrComplex F G hFG) := by sorry
-- TEST herr_map_zero
example (F G : ℚ →ₗ[ℚ] ℚ) (hFG : F.comp G = G.comp F) :
    herrMap F G F G hFG hFG 0 (by simp) (by simp) = 0 := by sorry
-- TEST herr_map_composition
example :
    (herrMap (LinearMap.id : ℚ →ₗ[ℚ] ℚ) LinearMap.id LinearMap.id LinearMap.id (by ext; rfl)
      (by ext; rfl) (2 • LinearMap.id) (by simp) (by simp) ≫
    herrMap LinearMap.id LinearMap.id LinearMap.id LinearMap.id (by ext; rfl)
      (by ext; rfl) (3 • LinearMap.id) (by simp) (by simp)).f 1 (5,7) = (30,42) := by sorry
-- TEST signed_identity_case
example :
    (phiPsiComparison (LinearMap.id : ℚ →ₗ[ℚ] ℚ) LinearMap.id LinearMap.id
      (by ext; rfl) (by ext; rfl) (by ext; rfl)).f 1 (5,7) = (-5,7) ∧
    (phiPsiComparison (LinearMap.id : ℚ →ₗ[ℚ] ℚ) LinearMap.id LinearMap.id
      (by ext; rfl) (by ext; rfl) (by ext; rfl)).f 2 1 = -1 := by sorry
-- TEST signed_frobenius_monomial
example : F3.f 2 (X^3) = -X := by sorry
-- TEST signed_kernel_monomial
example : F3.f 2 X = 0 ∧ F3.f 1 (X,0) = 0 := by sorry
-- TEST resolvent_zero_kernel
example (e : LinearMap.ker (LinearMap.id : ℚ →ₗ[ℚ] ℚ) ≃ₗ[ℚ]
    LinearMap.ker (LinearMap.id : ℚ →ₗ[ℚ] ℚ)) (x : ℚ) :
    kernelResolvent LinearMap.id LinearMap.id (by ext; rfl) e x = 0 := by sorry
-- TEST resolvent_polynomial
example : kernelResolvent (phiP 3) (psiP 3) (testLeft 3 (by decide)) (testKernelEquiv 3) X = X ∧
    kernelResolvent (phiP 3) (psiP 3) (testLeft 3 (by decide)) (testKernelEquiv 3) (X^3) = 0 := by sorry
-- TEST resolvent_hypothesis_essential
example : ∃ k : LinearMap.ker (psiP 3), (k : ℚ[X]) ≠ 0 ∧
    (LinearMap.id : ℚ[X] →ₗ[ℚ] ℚ[X]) k - k = 0 := by sorry
-- TEST section_zero_kernel
example (e : LinearMap.ker (LinearMap.id : ℚ →ₗ[ℚ] ℚ) ≃ₗ[ℚ]
    LinearMap.ker (LinearMap.id : ℚ →ₗ[ℚ] ℚ))
    (he : ∀ k : LinearMap.ker (LinearMap.id : ℚ →ₗ[ℚ] ℚ), (e k : ℚ) = 2*k-k) :
    (herrComparisonSection LinearMap.id LinearMap.id (2 • (LinearMap.id : ℚ →ₗ[ℚ] ℚ))
      (by simp) (by simp) (by ext; rfl) e he).f 1 (5,7) = (-5,7) := by sorry
-- TEST section_correction
example : S3.f 1 (0,X) = (-X,X) := by sorry
-- TEST section_degree_two
example : S3.f 2 X = -X^3 := by sorry
-- TEST homotopy_zero_kernel
example (e : LinearMap.ker (LinearMap.id : ℚ →ₗ[ℚ] ℚ) ≃ₗ[ℚ]
    LinearMap.ker (LinearMap.id : ℚ →ₗ[ℚ] ℚ))
    (he : ∀ k : LinearMap.ker (LinearMap.id : ℚ →ₗ[ℚ] ℚ), (e k : ℚ) = 2*k-k) :
    (herrComparisonHomotopy LinearMap.id LinearMap.id (2 • (LinearMap.id : ℚ →ₗ[ℚ] ℚ))
      (by simp) (by simp) (by ext; rfl) e he).hom 2 1 = 0 := by sorry
-- TEST homotopy_kernel_monomial
example : H3.hom 2 1 X = (X,0) := by sorry
-- TEST homotopy_image_monomial
example : H3.hom 2 1 (X^3) = 0 := by sorry
-- TEST equivalence_forward_sign
example (e : LinearMap.ker (LinearMap.id : ℚ →ₗ[ℚ] ℚ) ≃ₗ[ℚ]
    LinearMap.ker (LinearMap.id : ℚ →ₗ[ℚ] ℚ))
    (he : ∀ k : LinearMap.ker (LinearMap.id : ℚ →ₗ[ℚ] ℚ), (e k : ℚ) = 2*k-k) :
    (herrComparisonEquiv LinearMap.id LinearMap.id (2 • (LinearMap.id : ℚ →ₗ[ℚ] ℚ))
      (by simp) (by simp) (by ext; rfl) e he).hom.f 2 1 = -1 := by sorry
-- TEST equivalence_inverse_correction
example : E3.inv.f 1 (0,X) = (-X,X) := by sorry
-- TEST equivalence_section_identity
example : E3.hom.f 1 (E3.inv.f 1 (0,X)) = (0,X) := by sorry
end Tests

/-!
Arithmetic continuation: construct actual period-ring maps and topology; prove the
kernel inverse in the admitted source setting; compare with continuous Galois cochains
and the independent derived corestriction tower. Integral p=2 needs derived torsion
descent. No blanket ordinary specialization or lattice-stability claim is made.
-/
end TauCeti.PhiGamma
