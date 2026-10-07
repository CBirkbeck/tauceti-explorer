import Mathlib.Geometry.Manifold.Algebra.LieGroup
import Mathlib.Geometry.Manifold.ContMDiff.Defs
import Mathlib.Topology.Algebra.Support
import Mathlib.Topology.Algebra.ClopenNhdofOne
import Mathlib.Analysis.SpecialFunctions.Pow.Real
import Mathlib.LinearAlgebra.PiTensorProduct.Basic
import Mathlib.Algebra.Colimit.Module
import Mathlib.RingTheory.MvPolynomial.Basic
import Mathlib.NumberTheory.Padics.PadicIntegers
import Mathlib.LinearAlgebra.Matrix.GeneralLinearGroup.Defs
import Mathlib.RepresentationTheory.Basic
import Mathlib.RingTheory.Ideal.Maps
import Mathlib.GroupTheory.OrderOfElement
import Mathlib.Data.ZMod.Basic

/-!
# Automorphic forms on reductive groups: suggested Lean forms

This file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/AutomorphicFormsOnReductiveGroups.md` is definitive;
these statements suggest Lean forms so contributors and reviewers can converge
on names and signatures. Proofs are `sorry`; no implementation is claimed.

Independent review REV-AutomorphicFormsOnReductiveGroups found that the original
file did not faithfully express most of the packet. The corrected packet and
review report record the necessary reader revision and unresolved correspondence.
This file retains the expressible subset below. It does not satisfy the complete
packet/API/test correspondence requirement, and the review is `needs_changes`.

The shared pinned Mathlib build does not include the pinned Tau Ceti modules.
Objects owned by other roadmaps are not recreated as arbitrary stand-ins. In
particular, this file omits the derived Lie action, genuine (g,K)-pairs, smooth
Fréchet globalizations, rational parabolic quotient measures, automorphic
cohomology and classification, and the full adelic/classical dictionaries until
their supplier types and hypotheses can be stated. None is replaced by an opaque
Prop field. The review's node ledger and omission inventory give the names and
prerequisites to restore.

The retained objects are: smooth/test functions on a Lie-group/local-profinite
product; growth relative to an explicitly given height; algebraic restricted
tensors; local stable lattices; abstract Hecke eigenclass data; and Gross's
rational convention for algebraic modular forms. Their adelic specializations,
unlisted APIs and concrete packet tests remain explicit gaps.
-/

set_option linter.unusedSectionVars false
set_option linter.unusedVariables false

noncomputable section
open scoped Manifold ContDiff Topology TensorProduct
open Set

namespace TauCeti.Automorphic

section Functions

variable {Ginf Gf : Type*} [Group Ginf] [TopologicalSpace Ginf]
  [IsTopologicalGroup Ginf] [Group Gf] [TopologicalSpace Gf]
  [IsTopologicalGroup Gf] [LocallyCompactSpace Gf]
  [TotallyDisconnectedSpace Gf] [T2Space Gf]
  {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
  {H : Type*} [TopologicalSpace H]
  (I : ModelWithCorners ℝ E H) [ChartedSpace H Ginf]

def IsLevelInvariant (f : Ginf × Gf → ℂ) (J : Subgroup Gf) : Prop :=
  ∀ (g : Ginf × Gf) (j : J), f (g.1, g.2 * j) = f g

/-- Compact open level and actual C∞ archimedean slices. -/
def IsSmoothAdelic (f : Ginf × Gf → ℂ) : Prop :=
  (∃ J : Subgroup Gf, IsOpen (J : Set Gf) ∧ IsCompact (J : Set Gf) ∧
    IsLevelInvariant f J) ∧
  ∀ gf : Gf, ContMDiff I 𝓘(ℝ, ℂ) ∞ (fun x : Ginf => f (x, gf))

/-- Local profiniteness is necessary for constants and the subalgebra unit. -/
def SmoothAdelicFunction : Subalgebra ℂ (Ginf × Gf → ℂ) where
  carrier := {f | IsSmoothAdelic I f}
  mul_mem' := sorry
  add_mem' := sorry
  algebraMap_mem' := sorry

theorem SmoothAdelicFunction.exists_level {f : Ginf × Gf → ℂ}
    (hf : f ∈ SmoothAdelicFunction (Gf := Gf) I) :
    ∃ J : Subgroup Gf, IsOpen (J : Set Gf) ∧ IsCompact (J : Set Gf) ∧
      IsLevelInvariant f J := sorry

def rightTranslate (y : Ginf × Gf) (f : Ginf × Gf → ℂ) : Ginf × Gf → ℂ :=
  fun g => f (g * y)

theorem SmoothAdelicFunction.rightTranslate [LieGroup I ∞ Ginf]
    {f : Ginf × Gf → ℂ} (hf : f ∈ SmoothAdelicFunction (Gf := Gf) I)
    (y : Ginf × Gf) : rightTranslate y f ∈ SmoothAdelicFunction (Gf := Gf) I := sorry

theorem SmoothAdelicFunction.iUnion_level (f : Ginf × Gf → ℂ) :
    f ∈ SmoothAdelicFunction (Gf := Gf) I ↔
    ∃ J : Subgroup Gf, IsOpen (J : Set Gf) ∧ IsCompact (J : Set Gf) ∧
      IsLevelInvariant f J ∧
      ∀ gf : Gf, ContMDiff I 𝓘(ℝ, ℂ) ∞ (fun x : Ginf => f (x, gf)) := sorry

-- test: smoothAdelicFunction_const
example (c : ℂ) : (fun _ : Ginf × Gf => c) ∈ SmoothAdelicFunction I := sorry

def TestFunction : Submodule ℂ (Ginf × Gf → ℂ) where
  carrier := {f | IsSmoothAdelic I f ∧ HasCompactSupport f}
  add_mem' := sorry
  zero_mem' := sorry
  smul_mem' := sorry

-- test: testFunction_zero
example : (0 : Ginf × Gf → ℂ) ∈ TestFunction I := sorry

-- Haar convolution, tensor/LF topology and actual GL1 tests are omitted.
-- Arbitrary measures cannot replace Haar measure in the convolution API.
end Functions

section Growth

variable {X : Type*}

/-- AF.0 growth predicate, with a supplied height rather than a new adelic datum.
For height ≥1, requiring C,N≥0 does not change moderate growth. -/
def HasModerateGrowth (height : X → ℝ) (f : X → ℂ) : Prop :=
  ∃ C N : ℝ, 0 ≤ C ∧ 0 ≤ N ∧ ∀ x, ‖f x‖ ≤ C * height x ^ N

theorem HasModerateGrowth.of_height (height height' : X → ℝ)
    (h1 : ∀ x, 1 ≤ height x) (h1' : ∀ x, 1 ≤ height' x)
    (hcomp : ∃ C M : ℝ, 0 < C ∧ 0 ≤ M ∧ ∀ x, height x ≤ C * height' x ^ M)
    {f : X → ℂ} (hf : HasModerateGrowth height f) :
    HasModerateGrowth height' f := sorry

theorem HasModerateGrowth.add (height : X → ℝ) (h1 : ∀ x, 1 ≤ height x)
    {f g : X → ℂ} (hf : HasModerateGrowth height f)
    (hg : HasModerateGrowth height g) : HasModerateGrowth height (f + g) := sorry

theorem HasModerateGrowth.of_bounded (height : X → ℝ) (h1 : ∀ x, 1 ≤ height x)
    {f : X → ℂ} (C : ℝ) (hC : ∀ x, ‖f x‖ ≤ C) :
    HasModerateGrowth height f := sorry

theorem HasModerateGrowth.comp_mul_right {G : Type*} [Group G]
    (height : G → ℝ) (h1 : ∀ x, 1 ≤ height x)
    (hmul : ∀ x y, height (x * y) ≤ height x * height y)
    {f : G → ℂ} (hf : HasModerateGrowth height f) (y : G) :
    HasModerateGrowth height (fun x => f (x * y)) := sorry

-- test: hasModerateGrowth_const
example (height : X → ℝ) (h1 : ∀ x, 1 ≤ height x) (c : ℂ) :
    HasModerateGrowth height (fun _ => c) := sorry

/-- The real archimedean restriction of the GL1 norm-character test.
The full adelic norm character remains to be restored with AA's height. -/
example (s : ℝ) :
    HasModerateGrowth (fun x : ℝˣ => max |(x : ℝ)| |((x⁻¹ : ℝˣ) : ℝ)|)
      (fun x : ℝˣ => ((|(x : ℝ)| ^ s : ℝ) : ℂ)) := sorry

/-- A concrete nonexample for the supplied polynomial height on ℝ. -/
example : ¬HasModerateGrowth (fun x : ℝ => 1 + |x|)
    (fun x : ℝ => (Real.exp x : ℂ)) := sorry

end Growth

section RestrictedTensors

variable {ι : Type*} [DecidableEq ι] (W : ι → Type*)
  [∀ i, AddCommGroup (W i)] [∀ i, Module ℂ (W i)] (φ0 : ∀ i, W i)

/-- Tensor with the distinguished vectors at the newly added indices. -/
def RestrictedTensor.transition (φ0 : ∀ i, W i) (S S' : Finset ι) (h : S ≤ S') :
    PiTensorProduct ℂ (fun i : S => W i) →ₗ[ℂ]
      PiTensorProduct ℂ (fun i : S' => W i) := sorry

theorem RestrictedTensor.transition_tprod (S S' : Finset ι) (h : S ≤ S')
    (v : ∀ i : S, W i) :
    RestrictedTensor.transition W φ0 S S' h (PiTensorProduct.tprod ℂ v) =
      PiTensorProduct.tprod ℂ (fun i : S' =>
        if hi : (i : ι) ∈ S then v ⟨i, hi⟩ else φ0 i) := sorry

theorem RestrictedTensor.transition_self (S : Finset ι) :
    RestrictedTensor.transition W φ0 S S le_rfl = LinearMap.id := sorry

theorem RestrictedTensor.transition_comp (S T U : Finset ι)
    (hST : S ≤ T) (hTU : T ≤ U) :
    (RestrictedTensor.transition W φ0 T U hTU).comp
      (RestrictedTensor.transition W φ0 S T hST) =
      RestrictedTensor.transition W φ0 S U (hST.trans hTU) := sorry

/-- Module colimit, not Mathlib's restricted product of points. -/
def RestrictedTensor : Type _ :=
  Module.DirectLimit (fun S : Finset ι => PiTensorProduct ℂ (fun i : S => W i))
    (RestrictedTensor.transition W φ0)

instance : AddCommGroup (RestrictedTensor W φ0) := by
  unfold RestrictedTensor; infer_instance

instance : Module ℂ (RestrictedTensor W φ0) := by
  unfold RestrictedTensor; infer_instance

def RestrictedTensor.of (S : Finset ι) :
    PiTensorProduct ℂ (fun i : S => W i) →ₗ[ℂ] RestrictedTensor W φ0 :=
  Module.DirectLimit.of ℂ (Finset ι)
    (fun S : Finset ι => PiTensorProduct ℂ (fun i : S => W i))
    (RestrictedTensor.transition W φ0) S

def RestrictedTensor.map {W' : ι → Type*} [∀ i, AddCommGroup (W' i)]
    [∀ i, Module ℂ (W' i)] (φ0' : ∀ i, W' i)
    (B : ∀ i, W i →ₗ[ℂ] W' i) (hB : ∀ i, B i (φ0 i) = φ0' i) :
    RestrictedTensor W φ0 →ₗ[ℂ] RestrictedTensor W' φ0' := sorry

theorem RestrictedTensor.rescale (c : ι → ℂˣ) :
    Nonempty (RestrictedTensor W φ0 ≃ₗ[ℂ]
      RestrictedTensor W (fun i => (c i : ℂ) • φ0 i)) := sorry

-- test: restrictedTensor_finite
example [Fintype ι] :
    Nonempty (RestrictedTensor W φ0 ≃ₗ[ℂ] PiTensorProduct ℂ W) := sorry

-- test: restrictedTensor_polynomial
example : Nonempty (RestrictedTensor (fun _ : ℕ => Polynomial ℂ) (fun _ => 1)
    ≃ₗ[ℂ] MvPolynomial ℕ ℂ) := sorry

-- The non-full-product test and nonunital idempotent-corner algebra structure
-- need their exact carrier/evaluation maps; they are omitted, not weakened.
end RestrictedTensors

/-- Local component of a coefficient lattice. -/
def StableLattice (p : ℕ) [Fact p.Prime] (n : ℕ)
    (J : Subgroup (GL (Fin n) ℚ_[p])) :
    Set (Submodule ℤ_[p] (Fin n → ℚ_[p])) :=
  {L | L.FG ∧ Submodule.span ℚ_[p] (L : Set (Fin n → ℚ_[p])) = ⊤ ∧
    ∀ g ∈ J, ∀ v ∈ L, (g : Matrix (Fin n) (Fin n) ℚ_[p]).mulVec v ∈ L}

namespace StableLattice
variable (p : ℕ) [Fact p.Prime] (n : ℕ)

theorem «exists» (J : Subgroup (GL (Fin n) ℚ_[p]))
    (hJ : IsCompact (J : Set (GL (Fin n) ℚ_[p]))) :
    (StableLattice p n J).Nonempty := sorry

theorem eq_localization (J : Subgroup (GL (Fin n) ℚ_[p]))
    {L L' : Submodule ℤ_[p] (Fin n → ℚ_[p])}
    (hL : L ∈ StableLattice p n J) (hL' : L' ∈ StableLattice p n J) :
    ∃ m : ℕ, (∀ v ∈ L, ((p : ℤ_[p]) ^ m) • v ∈ L') ∧
      ∀ v ∈ L', ((p : ℤ_[p]) ^ m) • v ∈ L := sorry

theorem map (J : Subgroup (GL (Fin n) ℚ_[p])) (g : GL (Fin n) ℚ_[p])
    {L : Submodule ℤ_[p] (Fin n → ℚ_[p])} (hL : L ∈ StableLattice p n J) :
    L.map ((Matrix.toLin' (g : Matrix (Fin n) (Fin n) ℚ_[p])).restrictScalars ℤ_[p]) ∈
      StableLattice p n (J.map (MulAut.conj g).toMonoidHom) := sorry

-- Local scaling part of packet test lattice_not_unique; the concrete Sym²
-- non-homothety and global Chevalley/divided-power tests remain omitted.
example (J : Subgroup (GL (Fin n) ℚ_[p])) {L : Submodule ℤ_[p] (Fin n → ℚ_[p])}
    (hL : L ∈ StableLattice p n J) :
    L.map ((p : ℤ_[p]) • LinearMap.id) ∈ StableLattice p n J := sorry

end StableLattice

/-- Actual abstract eigenclass data. An eigenclass need not determine sys uniquely.
Specialization to integral Betti cohomology requires the ALS supplier. -/
structure TorsionEigenSystem (T : Type*) [CommRing T]
    (H : Type*) [AddCommGroup H] [Module T H]
    (Λ : Type*) [CommRing Λ] [Module Λ H] where
  sys : T →+* Λ
  c : H
  ne_zero : c ≠ 0
  eigen : ∀ t : T, t • c = sys t • c

theorem TorsionEigenSystem.maximalIdeal {T H Λ : Type*}
    [CommRing T] [AddCommGroup H] [Module T H] [Field Λ] [Module Λ H]
    (e : TorsionEigenSystem T H Λ) (hsurj : Function.Surjective e.sys) :
    (RingHom.ker e.sys).IsMaximal := sorry

section AlgebraicModularForms

variable {GQ Gf : Type*} [Group GQ] [Group Gf] (ι : GQ →* Gf)
  {A : Type*} [CommRing A] {M : Type*} [AddCommGroup M] [Module A M]
  (σ : Representation A GQ M)

/-- Gross's rational convention; this is not the p-adic J-coefficient convention. -/
def AlgebraicModularForm (J : Subgroup Gf) : Submodule A (Gf → M) where
  carrier := {f | (∀ (γ : GQ) (g : Gf), f (ι γ * g) = σ γ (f g)) ∧
    ∀ g, ∀ u ∈ J, f (g * u) = f g}
  add_mem' := sorry
  zero_mem' := sorry
  smul_mem' := sorry

/-- The finite set must actually represent the right cosets in JgJ. -/
def AlgebraicModularForm.hecke (J : Subgroup Gf) (g : Gf) (reps : Finset Gf)
    (hreps : ∀ x : Gf,
      (∃ a ∈ J, ∃ b ∈ J, x = a * g * b) ↔
      ∃! c : Gf, c ∈ reps ∧ ∃ u ∈ J, x = c * u) :
    AlgebraicModularForm ι σ J →ₗ[A] AlgebraicModularForm ι σ J := sorry

theorem AlgebraicModularForm.hecke_apply (J : Subgroup Gf) (g : Gf) (reps : Finset Gf)
    (hreps : ∀ x : Gf,
      (∃ a ∈ J, ∃ b ∈ J, x = a * g * b) ↔
      ∃! c : Gf, c ∈ reps ∧ ∃ u ∈ J, x = c * u)
    (f : AlgebraicModularForm ι σ J) (x : Gf) :
    (AlgebraicModularForm.hecke ι σ J g reps hreps f).val x =
      ∑ c ∈ reps, f.val (x * c) := sorry

def AlgebraicModularForm.res {J J' : Subgroup Gf} (h : J' ≤ J) :
    AlgebraicModularForm ι σ J →ₗ[A] AlgebraicModularForm ι σ J' := sorry

@[simp] theorem AlgebraicModularForm.res_apply {J J' : Subgroup Gf} (h : J' ≤ J)
    (f : AlgebraicModularForm ι σ J) (x : Gf) :
    (AlgebraicModularForm.res ι σ h f).val x = f.val x := sorry

theorem AlgebraicModularForm.res_comp {J J' J'' : Subgroup Gf}
    (h : J' ≤ J) (h' : J'' ≤ J') :
    (AlgebraicModularForm.res ι σ h').comp (AlgebraicModularForm.res ι σ h) =
      AlgebraicModularForm.res ι σ (h'.trans h) := sorry

/-- Trace requires representatives of the finite right-coset quotient J/J′. -/
def AlgebraicModularForm.trace {J J' : Subgroup Gf} (h : J' ≤ J) (reps : Finset Gf)
    (hmem : ∀ u ∈ reps, u ∈ J)
    (hreps : ∀ x ∈ J, ∃! u : Gf, u ∈ reps ∧ ∃ v ∈ J', x = u * v) :
    AlgebraicModularForm ι σ J' →ₗ[A] AlgebraicModularForm ι σ J := sorry

theorem AlgebraicModularForm.trace_apply {J J' : Subgroup Gf} (h : J' ≤ J)
    (reps : Finset Gf) (hmem : ∀ u ∈ reps, u ∈ J)
    (hreps : ∀ x ∈ J, ∃! u : Gf, u ∈ reps ∧ ∃ v ∈ J', x = u * v)
    (f : AlgebraicModularForm ι σ J') (x : Gf) :
    (AlgebraicModularForm.trace ι σ h reps hmem hreps f).val x =
      ∑ u ∈ reps, f.val (x * u) := sorry

/-- The degree identity follows from the coset sum; it does not require a free action. -/
theorem AlgebraicModularForm.trace_res {J J' : Subgroup Gf} (h : J' ≤ J)
    (reps : Finset Gf) (hmem : ∀ u ∈ reps, u ∈ J)
    (hreps : ∀ x ∈ J, ∃! u : Gf, u ∈ reps ∧ ∃ v ∈ J', x = u * v) :
    (AlgebraicModularForm.trace ι σ h reps hmem hreps).comp
        (AlgebraicModularForm.res ι σ h) =
      (reps.card : A) • LinearMap.id := sorry

/-- The actual level-coefficient convention. A representation of J alone suffices for
this function module; weighted Hecke operators require a specified extension of that action. -/
def LevelAlgebraicModularForm (J : Subgroup Gf) (σJ : Representation A J M) :
    Submodule A (Gf → M) where
  carrier := {f | (∀ (γ : GQ) (g : Gf), f (ι γ * g) = f g) ∧
    ∀ (g : Gf) (u : J), f (g * u) = σJ u⁻¹ (f g)}
  add_mem' := sorry
  zero_mem' := sorry
  smul_mem' := sorry

/-- Abstract form of f(g)↦g_p⁻¹f(g), for a coefficient whose action really extends to
the p-component of all finite adeles. An arbitrary inertial-type J-action has no such extension. -/
def AlgebraicModularForm.rationalEquiv (J : Subgroup Gf)
    (τ : Representation A Gf M) (hτ : ∀ γ : GQ, τ (ι γ) = σ γ) :
    AlgebraicModularForm ι σ J ≃ₗ[A]
      LevelAlgebraicModularForm ι J (τ.comp J.subtype) := sorry

theorem AlgebraicModularForm.rationalEquiv_apply (J : Subgroup Gf)
    (τ : Representation A Gf M) (hτ : ∀ γ : GQ, τ (ι γ) = σ γ)
    (f : AlgebraicModularForm ι σ J) (g : Gf) :
    (AlgebraicModularForm.rationalEquiv ι σ J τ hτ f).val g = τ g⁻¹ (f.val g) := sorry

theorem AlgebraicModularForm.rationalEquiv_symm_apply (J : Subgroup Gf)
    (τ : Representation A Gf M) (hτ : ∀ γ : GQ, τ (ι γ) = σ γ)
    (f : LevelAlgebraicModularForm ι J (τ.comp J.subtype)) (g : Gf) :
    ((AlgebraicModularForm.rationalEquiv ι σ J τ hτ).symm f).val g = τ g (f.val g) := sorry

def IsSufficientlySmall {Gv : Type*} [Group Gv] (J : Subgroup Gf)
    (proj : Gf →* Gv) : Prop :=
  ∀ g ∈ J, IsOfFinOrder (proj g) → proj g = 1

def fixedSub (J : Subgroup Gf) (t : Gf) : Submodule A M where
  carrier := {m | ∀ γ : GQ,
    ι γ ∈ J.map (MulAut.conj t).toMonoidHom → σ γ m = m}
  add_mem' := sorry
  zero_mem' := sorry
  smul_mem' := sorry

theorem AlgebraicModularForm.equivSum (J : Subgroup Gf) {h : ℕ} (t : Fin h → Gf)
    (hdecomp : ∀ g : Gf, ∃! i : Fin h,
      ∃ γ : GQ, ∃ u ∈ J, g = ι γ * t i * u) :
    Nonempty (AlgebraicModularForm ι σ J ≃ₗ[A]
      ((i : Fin h) → fixedSub ι σ J (t i))) := sorry

-- test: amf_zero
example [Subsingleton M] (J : Subgroup Gf) :
    Subsingleton (AlgebraicModularForm ι σ J) := sorry

-- test: amf_trivial_coeff
example (J : Subgroup Gf) (f : Gf → M)
    (hf : f ∈ AlgebraicModularForm ι (Representation.trivial A GQ M) J)
    (γ : GQ) (g u : Gf) (hu : u ∈ J) : f (ι γ * g * u) = f g := sorry

/-- Extra small-case check: at full level, constants are exactly invariant values. -/
example (m : M) : (fun _ : Gf => m) ∈ AlgebraicModularForm ι σ ⊤ ↔
    ∀ γ : GQ, σ γ m = m := sorry

-- test: amf_not_small_basechange, the C₂ sign coefficient invariant spaces.
-- Integral invariants are zero, while reduction modulo 2 has all of F₂ invariant.
example : (∀ m : ℤ, -m = m ↔ m = 0) ∧ (∀ m : ZMod 2, -m = m) := sorry

-- level-coefficient degenerate case
example [Subsingleton M] (J : Subgroup Gf) (σJ : Representation A J M) :
    Subsingleton (LevelAlgebraicModularForm ι J σJ) := sorry

-- level-coefficient trivial action agrees with scalar double-coset functions
example (J : Subgroup Gf) (f : Gf → M)
    (hf : f ∈ LevelAlgebraicModularForm ι J (Representation.trivial A J M))
    (γ : GQ) (g : Gf) (u : J) : f (ι γ * g * u) = f g := sorry

-- level-coefficient compatibility with the actual rational transport
example (J : Subgroup Gf) (τ : Representation A Gf M)
    (hτ : ∀ γ : GQ, τ (ι γ) = σ γ) (f : AlgebraicModularForm ι σ J) :
    (AlgebraicModularForm.rationalEquiv ι σ J τ hτ).symm
      (AlgebraicModularForm.rationalEquiv ι σ J τ hτ f) = f := sorry

-- Weighted Hecke maps for a J-action extending only to a Hecke semigroup need that
-- semigroup carrier and the coefficient transport. Definite quaternion class-set calculations
-- and the automorphic comparison retain their actual arithmetic supplier inputs.
-- The positive-unit-rank central-character extension is requested from this AF.5 owner:
-- f(γgzu)=ψ(z)u⁻¹f(g), with rational-central and Z_f∩J compatibility, central quotient
-- double cosets and descended effective-stabilizer actions. It is not supplied by the
-- current discrete-centre branch or by finiteness of its unmodified class set.
end AlgebraicModularForms

end TauCeti.Automorphic

/-
Findings /2, /6, /29 and /30: the single AF.1b real-representation proposal
includes Casselman embedding and globalization as well as classification;
globalization consumes its classification/discrete-series reduction. AL keeps
Tate's rank-one factors and imports the AF higher-rank dictionary.
The independent AF.1a cochain owner must supply ALS.4's requested absolute
characteristic-zero complex and Kostant theorem; existing relative cochains
and Mathlib's low-degree absolute cochains do not assert that full output.
An early AF.4 local-weight prefix supplies ALS/AS comparison proofs. The
rationality and torsion-eigenclass suffix imports the actual Betti/Hecke
comparison, retaining its source group hypotheses. These proposed splits
add no native signature and do not certify all stage dependencies acyclic.
-/

/-
AF.1/tempered-square-integrable takes a supplied continuous SF or unitary
Hilbert realization. Its coefficient integrability definition precedes CW.
Existence of the discrete/tempered realizations and comparison with the later
canonical SAF realization remain explicit source/signature gaps. This prevents
classification/globalization from assuming the globalization theorem in its
own initial matrix-coefficient definition.
-/
