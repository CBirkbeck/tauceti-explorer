import Mathlib.RingTheory.AdicCompletion.AsTensorProduct
import Mathlib.NumberTheory.NumberField.Units.DirichletTheorem
import Mathlib.NumberTheory.Padics.PadicIntegers
import Mathlib.Algebra.Module.Submodule.Map
import Mathlib.LinearAlgebra.Quotient.Basic
import Mathlib.Topology.Algebra.PontryaginDual

import TauCeti.FieldTheory.GaloisCohomology.Kummer
import TauCeti.Geometry.Hodge.Dimension
import TauCeti.Geometry.Hodge.Tate.Basic
import TauCeti.Geometry.Hodge.Tate.Twist
import TauCeti.Geometry.Hodge.Dual
import Mathlib.Analysis.SpecialFunctions.Gamma.Deligne

/-!
# Suggested declarations: Selmer groups and Iwasawa cohomology

This file is not the roadmap and is not exhaustive. The roadmap document is definitive;
these prototypes suggest Lean forms so that contributors and reviewers converge on names
and signatures. Proofs with `sorry` make no implementation claim.

The algebraic localization diagram below is a signature-testing adapter for compact and
rational coefficients. The general discrete Selmer carrier is imported from upstream
EllipticCurves Layer 7; it is not redefined as a competing Galois construction here.
The native Hodge and finite Kummer prototypes import the actual pinned Tau Ceti modules.

Canonical compact cochain, derived Selmer, Iwasawa determinant and period interfaces are
specified in the contracts at the end. Where a required supplier carrier is unavailable,
the corresponding typed declaration is omitted and its precise mathematics and names are
recorded. No empty predicate or placeholder cohomology object substitutes for it.
-/

noncomputable section

open scoped TensorProduct

namespace TauCeti.Selmer

/-! ## L0: `p`-adic completions of multiplicative groups -/

section Completion

variable (p : ℕ) [Fact p.Prime]

/-- **`L0/padic-completion`**: the `p`-adic completion `Â = lim_m A/A^{p^m}` of an abelian group
(written additively), as Mathlib's `AdicCompletion` for the ideal `(p) ⊆ ℤ`. For `A = Fˣ`
(through `Additive`) this is `lim_m Fˣ/(Fˣ)^{p^m}`. -/
abbrev pCompletion (A : Type*) [AddCommGroup A] : Type _ :=
  AdicCompletion (Ideal.span {(p : ℤ)}) A

variable {p}

/-- API: the canonical map `A → Â`. -/
def toPCompletion (A : Type*) [AddCommGroup A] : A →ₗ[ℤ] pCompletion p A :=
  AdicCompletion.of (Ideal.span {(p : ℤ)}) A

/-- API: the kernel of `A → Â` is `⋂_m p^m A`. -/
theorem ker_toPCompletion (A : Type*) [AddCommGroup A] :
    LinearMap.ker (toPCompletion (p := p) A) =
      ⨅ m : ℕ, (Ideal.span {(p : ℤ)} ^ m) • (⊤ : Submodule ℤ A) := sorry

/-- API: functoriality of the completion in `A`. -/
def pCompletionMap {A B : Type*} [AddCommGroup A] [AddCommGroup B] (f : A →ₗ[ℤ] B) :
    pCompletion p A →ₗ[ℤ] pCompletion p B :=
  (AdicCompletion.map (Ideal.span {(p : ℤ)}) f).restrictScalars ℤ

/-- API: `AdicCompletion (p) ℤ ≅ ℤ_p`, so that `Â` is a `ℤ_p`-module. -/
theorem adicCompletion_int_equiv_padicInt :
    Nonempty (AdicCompletion (Ideal.span {(p : ℤ)}) ℤ ≃+* ℤ_[p]) := sorry

/-- **`L0/padic-completion`**: for finitely generated `A`,
`ℤ_p ⊗ A ≅ Â` (from `AdicCompletion.ofTensorProduct_bijective_of_finite_of_isNoetherian`). -/
theorem pCompletion_bijective_of_finite (A : Type*) [AddCommGroup A] [Module.Finite ℤ A] :
    Function.Bijective (AdicCompletion.ofTensorProduct (Ideal.span {(p : ℤ)}) A) := sorry

/-- **`L0/units-completion`**: for a number field `F`, `E_F ⊗ ℤ_p ≅ Ê_F`, and `Ê_F → F̂ˣ` is
injective because a unit that is a `p^m`-th power in `F` is the `p^m`-th power of a unit. -/
theorem units_pCompletion_injective (F : Type*) [Field F] [NumberField F] :
    Function.Injective (pCompletionMap (p := p)
      (MonoidHom.toAdditive (Units.map (algebraMap (NumberField.RingOfIntegers F) F).toMonoidHom) :
        Additive (NumberField.RingOfIntegers F)ˣ →+ Additive Fˣ).toIntLinearMap) :=
  sorry

/-- API of `L0/units-completion`: `p^m`-th roots of units are units. -/
theorem units_pow_of_pow_eq (F : Type*) [Field F] [NumberField F] (m : ℕ)
    (u : (NumberField.RingOfIntegers F)ˣ) (x : Fˣ)
    (hx : x ^ p ^ m = Units.map (algebraMap (NumberField.RingOfIntegers F) F).toMonoidHom u) :
    ∃ v : (NumberField.RingOfIntegers F)ˣ,
      Units.map (algebraMap (NumberField.RingOfIntegers F) F).toMonoidHom v = x := sorry

end Completion

/-! ## L2: Selmer data and Selmer kernels -/

section SelmerKernel

variable {R : Type*} [CommRing R] {ι : Type*}

/-- **`L2/selmer-data`**: global and local modules with localisation maps and local conditions
(Mazur–Rubin, Definitions 1.1 and 2.1). -/
structure SelmerData (R : Type*) [CommRing R] (ι : Type*) where
  /-- The global cohomology module, e.g. `H¹(G_{K,Σ}, M)`. -/
  glob : Type*
  [instAdd : AddCommGroup glob]
  [instMod : Module R glob]
  /-- The local cohomology modules, e.g. `H¹(K_v, M)`. -/
  loc : ι → Type*
  [instAddLoc : ∀ v, AddCommGroup (loc v)]
  [instModLoc : ∀ v, Module R (loc v)]
  /-- The localisation maps. -/
  res : ∀ v, glob →ₗ[R] loc v
  /-- The local conditions. -/
  cond : ∀ v, Submodule R (loc v)

attribute [instance] SelmerData.instAdd SelmerData.instMod SelmerData.instAddLoc
  SelmerData.instModLoc

namespace SelmerData

variable (D : SelmerData R ι)

/-- **`L2/selmer-kernel`**: the Selmer module `{c | res_v c ∈ L_v for all v}`. -/
def selmer : Submodule R D.glob := ⨅ v, (D.cond v).comap (D.res v)

/-- API: membership. -/
theorem mem_selmer (c : D.glob) : c ∈ D.selmer ↔ ∀ v, D.res v c ∈ D.cond v := by
  simp [selmer, Submodule.mem_iInf]

/-- API: the Selmer module is the kernel of the sum of the maps to `H¹(K_v)/L_v`. -/
theorem selmer_eq_ker :
    D.selmer = LinearMap.ker (LinearMap.pi fun v => (D.cond v).mkQ ∘ₗ D.res v) := sorry

/-- The Selmer data with the conditions replaced. -/
def withCond (L : ∀ v, Submodule R (D.loc v)) : SelmerData R ι :=
  { D with cond := L }

/-- API: monotonicity in the local conditions. -/
theorem selmer_mono {L L' : ∀ v, Submodule R (D.loc v)} (h : ∀ v, L v ≤ L' v) :
    (D.withCond L).selmer ≤ (D.withCond L').selmer := sorry

/-- API: the relaxed condition at a set `B` of places (`H¹` there). -/
def relax (B : Set ι) [DecidablePred (· ∈ B)] : SelmerData R ι :=
  D.withCond fun v => if v ∈ B then ⊤ else D.cond v

/-- API: the strict condition at a set `A` of places (`0` there). -/
def strict (A : Set ι) [DecidablePred (· ∈ A)] : SelmerData R ι :=
  D.withCond fun v => if v ∈ A then ⊥ else D.cond v

/-- API: strict ≤ given ≤ relaxed. -/
theorem selmer_strict_le_le_relax (S : Set ι) [DecidablePred (· ∈ S)] :
    (D.strict S).selmer ≤ D.selmer ∧ D.selmer ≤ (D.relax S).selmer := sorry

/-- The local quotient map from the larger Selmer condition to L'_v/L_v. -/
def changeConditionMap {L L' : ∀ v, Submodule R (D.loc v)} (_h : ∀ v, L v ≤ L' v) :
    (D.withCond L').selmer →ₗ[R]
      (∀ v, (L' v) ⧸ (L v).comap (L' v).subtype) where
  toFun c v := ((L v).comap (L' v).subtype).mkQ
    ⟨D.res v c.val, ((D.withCond L').mem_selmer c.val).mp c.property v⟩
  map_add' := by sorry
  map_smul' := by sorry

/-- L2/change-of-conditions: exactness at the larger Selmer module;
there is no claim of surjectivity onto the local quotient. -/
theorem exact_change_of_conditions {L L' : ∀ v, Submodule R (D.loc v)}
    (h : ∀ v, L v ≤ L' v) :
    LinearMap.ker (D.changeConditionMap h) =
      ((D.withCond L).selmer).comap ((D.withCond L').selmer).subtype := sorry

/-- **`L2/selmer-functoriality`**: a map of Selmer data (compatible global and local maps sending
conditions into conditions) induces a map of Selmer modules. -/
theorem map_selmer_le (D' : SelmerData R ι) (f : D.glob →ₗ[R] D'.glob)
    (fv : ∀ v, D.loc v →ₗ[R] D'.loc v) (hcomm : ∀ v c, fv v (D.res v c) = D'.res v (f c))
    (hcond : ∀ v, (D.cond v).map (fv v) ≤ D'.cond v) :
    D.selmer.map f ≤ D'.selmer := sorry

end SelmerData

/-- **`L2/condition-propagation`**: propagate a local condition along a coefficient map `g` on
local cohomology: forwards by image (quotients `T ↠ T/IT`, `V → W`) and backwards by inverse image
(submodules `T[I] ↪ T`, `T → V`) (Mazur–Rubin Definition 1.1; Rubin Definition I.3.4). -/
def propagateImage {X Y : Type*} [AddCommGroup X] [Module R X] [AddCommGroup Y] [Module R Y]
    (g : X →ₗ[R] Y) (L : Submodule R X) : Submodule R Y := L.map g

/-- The backward propagation by inverse image. -/
def propagatePreimage {X Y : Type*} [AddCommGroup X] [Module R X] [AddCommGroup Y] [Module R Y]
    (g : X →ₗ[R] Y) (L : Submodule R Y) : Submodule R X := L.comap g

/-- API: propagating the relaxed condition forwards along a surjection gives the relaxed one. -/
theorem propagateImage_top {X Y : Type*} [AddCommGroup X] [Module R X] [AddCommGroup Y]
    [Module R Y] (g : X →ₗ[R] Y) (hg : Function.Surjective g) :
    propagateImage g (⊤ : Submodule R X) = ⊤ := sorry

/-- API: propagating the strict condition backwards gives the kernel. -/
theorem propagatePreimage_bot {X Y : Type*} [AddCommGroup X] [Module R X] [AddCommGroup Y]
    [Module R Y] (g : X →ₗ[R] Y) :
    propagatePreimage g (⊥ : Submodule R Y) = LinearMap.ker g := sorry

/-- API: a Galois connection, `image ≤ L ↔ L₀ ≤ preimage`. -/
theorem propagate_gc {X Y : Type*} [AddCommGroup X] [Module R X] [AddCommGroup Y] [Module R Y]
    (g : X →ₗ[R] Y) (L₀ : Submodule R X) (L : Submodule R Y) :
    propagateImage g L₀ ≤ L ↔ L₀ ≤ propagatePreimage g L := Submodule.map_le_iff_le_comap

/-- **`L2/lattice-passage`**: from a condition `L_V ⊆ H¹(K_v, V)`, Rubin's `H¹_f(K_v, T)` and
`H¹_f(K_v, W)` are the inverse image and image under `H¹(T) → H¹(V) → H¹(W)`; the singular quotient
`H¹(T)/H¹_f(T)` is torsion-free, i.e. the condition on `T` is saturated. -/
theorem saturated_preimage {X Y : Type*} [AddCommGroup X] [Module ℤ X] [AddCommGroup Y]
    [Module ℚ Y] [Module ℤ Y] (g : X →ₗ[ℤ] Y) (LV : Submodule ℤ Y) (n : ℤ) (hn : n ≠ 0) (x : X)
    (hx : n • x ∈ propagatePreimage g LV) (hLV : ∀ y : Y, n • y ∈ LV → y ∈ LV) :
    x ∈ propagatePreimage g LV := sorry

end SelmerKernel

/-! ## L2: the unramified and Greenberg conditions (generic group-theoretic form)

`G` is a decomposition group, `I ⊆ G` its inertia subgroup, and `resI : H¹(G, M) → H¹(I, M)` and
`resQ : H¹(G, M) → H¹(I, M/F⁺M)` are the restriction maps supplied by Tau Ceti's ProfiniteCohomology
for discrete `M` (and by `ArithmeticGaloisDuality:R02.1` for compact `M`). -/

section Conditions

variable {R : Type*} [CommRing R] {H HI HQ : Type*} [AddCommGroup H] [Module R H]
  [AddCommGroup HI] [Module R HI] [AddCommGroup HQ] [Module R HQ]

/-- **`L2/unramified-condition`**: `H¹_ur = ker(H¹(G, M) → H¹(I, M))` (Rubin Definition I.3.1). -/
def unramified (resI : H →ₗ[R] HI) : Submodule R H := LinearMap.ker resI

/-- **`L2/greenberg-condition`**: `ker(H¹(G, M) → H¹(I, M/F⁺M))` for a `G`-stable submodule
`F⁺M`; stability is required under the decomposition group only. -/
def greenberg (resQ : H →ₗ[R] HQ) : Submodule R H := LinearMap.ker resQ

/-- API: with `F⁺M = 0` the Greenberg condition is the unramified one. -/
theorem greenberg_zero (resI : H →ₗ[R] HI) : greenberg resI = unramified resI := rfl

/-- API: with `F⁺M = M` (so `H¹(I, M/F⁺M) = 0`) the Greenberg condition is relaxed. -/
theorem greenberg_top (resQ : H →ₗ[R] HQ) [Subsingleton HQ] : greenberg resQ = ⊤ := sorry

/-- API: `H¹_ur ⊆ H¹_Gr` when `resQ` factors through `resI`. -/
theorem unramified_le_greenberg (resI : H →ₗ[R] HI) (resQ : H →ₗ[R] HQ) (π : HI →ₗ[R] HQ)
    (hπ : π ∘ₗ resI = resQ) : unramified resI ≤ greenberg resQ := sorry

end Conditions

/-! ## L2: Pontryagin duals and coranks -/

section Dual

/-- **`L2/pontryagin-dual`**: `M^∨ = Hom_cont(M, ℚ_p/ℤ_p)`, here through Mathlib's
`PontryaginDual` (continuous characters into the circle) for a discrete `p`-primary `M`. -/
abbrev dual (M : Type*) [TopologicalSpace M] [CommGroup M] : Type _ := PontryaginDual M

/-- API: the contragredient action `(g • f)(x) = f(g⁻¹ • x)`. -/
def contragredient {G M : Type*} [Group G] [TopologicalSpace M] [CommGroup M]
    [MulDistribMulAction G M] (hcont : ∀ g : G, Continuous fun x : M => g • x) (g : G)
    (f : PontryaginDual M) : PontryaginDual M :=
  ContinuousMonoidHom.comp f ⟨MulDistribMulAction.toMonoidHom M g⁻¹, hcont g⁻¹⟩

/-- API: the contragredient action is a left action. -/
theorem contragredient_mul {G M : Type*} [Group G] [TopologicalSpace M] [CommGroup M]
    [MulDistribMulAction G M] (hcont : ∀ g : G, Continuous fun x : M => g • x) (g h : G)
    (f : PontryaginDual M) :
    contragredient hcont (g * h) f = contragredient hcont g (contragredient hcont h f) := sorry

/-- **`L2/corank`**: the `ℤ_p`-corank `dim_{ℚ_p}(M^∨ ⊗ ℚ_p)` of a cofinitely generated discrete
`ℤ_p`-module, stated for its compact dual `N = M^∨` as a `ℤ_p`-module. -/
def corank (p : ℕ) [Fact p.Prime] (N : Type*) [AddCommGroup N] [Module ℤ_[p] N] : ℕ :=
  Module.finrank ℚ_[p] (ℚ_[p] ⊗[ℤ_[p]] N)

/-- API: finite modules have corank zero. -/
theorem corank_finite (p : ℕ) [Fact p.Prime] (N : Type*) [AddCommGroup N] [Module ℤ_[p] N]
    [Finite N] : corank p N = 0 := sorry

/-- API: additivity in short exact sequences of finitely generated modules. -/
theorem corank_add (p : ℕ) [Fact p.Prime] {N N' N'' : Type*} [AddCommGroup N] [Module ℤ_[p] N]
    [AddCommGroup N'] [Module ℤ_[p] N'] [AddCommGroup N''] [Module ℤ_[p] N''] [Module.Finite ℤ_[p] N']
    (f : N →ₗ[ℤ_[p]] N') (g : N' →ₗ[ℤ_[p]] N'') (hf : Function.Injective f)
    (hg : Function.Surjective g) (hfg : Function.Exact f g) :
    corank p N' = corank p N + corank p N'' := sorry

/-- API: `ℤ_p^r`, the dual of `(ℚ_p/ℤ_p)^r`, has corank `r`. -/
theorem corank_pi_padicInt (p : ℕ) [Fact p.Prime] (r : ℕ) : corank p (Fin r → ℤ_[p]) = r := sorry

end Dual


/-! ## L1: orthogonal complements (the parametric pairing lemmas)

These are stated for an arbitrary bilinear pairing; the local Tate pairings of Rubin's Theorem 4.1
(`H¹(K, T) × H¹(K, W^*) → D` and its variants) are imported from `ArithmeticGaloisDuality:R02.4`. -/

section Orthogonal

variable {R : Type*} [CommRing R] {X X' Y : Type*} [AddCommGroup X] [Module R X]
  [AddCommGroup X'] [Module R X'] [AddCommGroup Y] [Module R Y]

/-- **`L1/orthogonal-complement`**: `F^⊥ = {x' | b(F, x') = 0}` (Mazur–Rubin, Definition 1.6). -/
def orthogonal (b : X →ₗ[R] X' →ₗ[R] Y) (F : Submodule R X) : Submodule R X' :=
  ⨅ x ∈ F, LinearMap.ker (b x)

/-- API: membership. -/
theorem mem_orthogonal (b : X →ₗ[R] X' →ₗ[R] Y) (F : Submodule R X) (x' : X') :
    x' ∈ orthogonal b F ↔ ∀ x ∈ F, b x x' = 0 := by
  simp [orthogonal, Submodule.mem_iInf]

/-- API: `F ↦ F^⊥` is antitone. -/
theorem orthogonal_antitone (b : X →ₗ[R] X' →ₗ[R] Y) : Antitone (orthogonal b) := sorry

/-- API: strict ↦ relaxed. -/
theorem orthogonal_bot (b : X →ₗ[R] X' →ₗ[R] Y) : orthogonal b ⊥ = ⊤ := sorry

/-- A perfect pairing: both curried maps are bijective. -/
def IsPerfect (b : X →ₗ[R] X' →ₗ[R] Y) : Prop :=
  Function.Bijective b ∧ Function.Bijective b.flip

/-- API: relaxed ↦ strict, for a perfect pairing. -/
theorem orthogonal_top (b : X →ₗ[R] X' →ₗ[R] Y) (hb : IsPerfect b) : orthogonal b ⊤ = ⊥ := sorry

/-- API: the image rule for adjoint maps, `(π F)^⊥ = ι^{-1}(F^⊥)`. -/
theorem orthogonal_map_eq_comap {Z Z' : Type*} [AddCommGroup Z] [Module R Z] [AddCommGroup Z']
    [Module R Z'] (b : X →ₗ[R] X' →ₗ[R] Y) (bZ : Z →ₗ[R] Z' →ₗ[R] Y) (π : X →ₗ[R] Z)
    (ι : Z' →ₗ[R] X') (hadj : ∀ x z', bZ (π x) z' = b x (ι z')) (F : Submodule R X) :
    orthogonal bZ (F.map π) = (orthogonal b F).comap ι := by
  ext z'
  simp [mem_orthogonal, hadj]

/-- API: double orthogonal, for a perfect pairing of finite modules. -/
theorem orthogonal_orthogonal {n : ℕ} [NeZero n] {A B : Type*}
    [AddCommGroup A] [Module (ZMod n) A] [AddCommGroup B] [Module (ZMod n) B]
    [Finite A] [Finite B] (b : A →ₗ[ZMod n] B →ₗ[ZMod n] ZMod n)
    (hb : IsPerfect b) (F : Submodule (ZMod n) A) :
    orthogonal b.flip (orthogonal b F) = F := sorry

/-- The finite character-dual quotient pairing is perfect, not merely injective. -/
theorem quotientPairing_perfect {n : ℕ} [NeZero n] {A B : Type*}
    [AddCommGroup A] [Module (ZMod n) A] [AddCommGroup B] [Module (ZMod n) B]
    [Finite A] [Finite B] (b : A →ₗ[ZMod n] B →ₗ[ZMod n] ZMod n)
    (hb : IsPerfect b) (F : Submodule (ZMod n) A) :
    ∃ c : (A ⧸ F) →ₗ[ZMod n] (orthogonal b F) →ₗ[ZMod n] ZMod n,
      IsPerfect c ∧ ∀ x (y : orthogonal b F), c (F.mkQ x) y = b x y := sorry

end Orthogonal

/-- API (`card_mul_card_orthogonal`): over `ℤ/n`, a perfect pairing into `ℤ/n` of finite modules
satisfies `#F · #F^⊥ = #X`. -/
theorem card_mul_card_orthogonal {n : ℕ} [NeZero n] {X X' : Type*} [AddCommGroup X]
    [Module (ZMod n) X] [AddCommGroup X'] [Module (ZMod n) X'] [Finite X] [Finite X']
    (b : X →ₗ[ZMod n] X' →ₗ[ZMod n] ZMod n) (hb : IsPerfect b) (F : Submodule (ZMod n) X) :
    Nat.card F * Nat.card (orthogonal b F) = Nat.card X := sorry

/-! ## L2: dual Selmer structures (Mazur–Rubin, Definitions 2.1 and 2.5) -/

section DualStructure

variable {R : Type*} [CommRing R] {ι : Type*} {Y : Type*} [AddCommGroup Y] [Module R Y]

namespace SelmerData

/-- **`L2/dual-selmer-structure`**: the dual local conditions on `D'` (e.g. the data for `T^*`)
under local pairings `b v : H¹(K_v, T) × H¹(K_v, T^*) → Y`. -/
def dualCond (D D' : SelmerData R ι) (b : ∀ v, D.loc v →ₗ[R] D'.loc v →ₗ[R] Y) :
    ∀ v, Submodule R (D'.loc v) :=
  fun v => orthogonal (b v) (D.cond v)

/-- The dual Selmer data: the same global module and localisations as `D'`, with the dual
conditions. -/
def dualOf (D D' : SelmerData R ι) (b : ∀ v, D.loc v →ₗ[R] D'.loc v →ₗ[R] Y) : SelmerData R ι :=
  D'.withCond (dualCond D D' b)

/-- API (`dual_modify`): relaxing at `B` dualises to making the dual strict at `B`. -/
theorem dualCond_relax (D D' : SelmerData R ι) (b : ∀ v, D.loc v →ₗ[R] D'.loc v →ₗ[R] Y)
    (hb : ∀ v, IsPerfect (b v)) (B : Set ι) [DecidablePred (· ∈ B)] (v : ι) (hv : v ∈ B) :
    dualCond (D.relax B) D' b v = ⊥ := sorry

/-- API (`dual_dual`): dualising twice returns the conditions, for finite local modules. -/
theorem dualCond_dualCond {n : ℕ} [NeZero n] (D D' : SelmerData (ZMod n) ι)
    (b : ∀ v, D.loc v →ₗ[ZMod n] D'.loc v →ₗ[ZMod n] ZMod n)
    (hb : ∀ v, IsPerfect (b v)) [∀ v, Finite (D.loc v)] [∀ v, Finite (D'.loc v)] (v : ι) :
    orthogonal (b v).flip (dualCond D D' b v) = D.cond v := sorry

end SelmerData

end DualStructure


/-! ## Unit tests -/

namespace SuggestedTest

variable (p : ℕ) [Fact p.Prime]

/-- A finite group of order prime to `p` has trivial `p`-completion (here `ℤ/2`, `p = 3`). -/
example [Fact (Nat.Prime 3)] : Subsingleton (pCompletion 3 (ZMod 2)) := sorry

/-- `ℤ̂ = ℤ_p` (the completion of `ℤ` itself). -/
example : Function.Bijective (AdicCompletion.ofTensorProduct (Ideal.span {(p : ℤ)}) ℤ) := sorry

/-- A `p`-divisible group has trivial completion: `ℚ̂ = 0`. -/
example : Subsingleton (pCompletion p ℚ) := sorry

/-- The completion of a free group of infinite rank is not the tensor product: `ℤ_p ⊗ ℤ^(ℕ) → ℤ^(ℕ)^`
is not surjective. -/
example : ¬ Function.Surjective (AdicCompletion.ofTensorProduct (Ideal.span {(p : ℤ)}) (ℕ →₀ ℤ)) :=
  sorry

/-- The completion of `ℤ_ℓ` for `ℓ ≠ p` vanishes although `ℤ_p ⊗_ℤ ℤ_ℓ ≠ 0` (the local non-example). -/
example [Fact (Nat.Prime 2)] [Fact (Nat.Prime 3)] : Subsingleton (pCompletion 3 ℤ_[2]) := sorry

/-- Strict ≤ relaxed on the trivial Selmer data. -/
example {R ι : Type*} [CommRing R] (D : SelmerData R ι) (S : Set ι) [DecidablePred (· ∈ S)] :
    (D.strict S).selmer ≤ (D.relax S).selmer := sorry

/-- All conditions relaxed: the Selmer module is everything. -/
example {R ι : Type*} [CommRing R] (D : SelmerData R ι) :
    (D.withCond fun _ => ⊤).selmer = ⊤ := sorry

/-- All conditions strict: the Selmer module is the intersection of the kernels. -/
example {R ι : Type*} [CommRing R] (D : SelmerData R ι) :
    (D.withCond fun _ => ⊥).selmer = ⨅ v, LinearMap.ker (D.res v) := sorry

/-- No places: the Selmer module is the whole global module. -/
example {R : Type*} [CommRing R] (D : SelmerData R Empty) : D.selmer = ⊤ := sorry

/-- Unramified vs Greenberg: with `F⁺ = 0` they agree. -/
example {R H HI : Type*} [CommRing R] [AddCommGroup H] [Module R H] [AddCommGroup HI]
    [Module R HI] (resI : H →ₗ[R] HI) : greenberg resI = unramified resI := rfl

/-- The corank of `ℤ_p` (the dual of `ℚ_p/ℤ_p`) is one. -/
example : corank p ℤ_[p] = 1 := sorry

/-- The corank of a finite module is zero: `ℤ_p/(p)`. -/
example : corank p (ℤ_[p] ⧸ Ideal.span {(p : ℤ_[p])}) = 0 := sorry

/-- The corank of `ℤ_p²` is two. -/
example : corank p (Fin 2 → ℤ_[p]) = 2 := sorry

/-- Duality: the orthogonal of the strict condition is relaxed. -/
example {R X X' Y : Type*} [CommRing R] [AddCommGroup X] [Module R X] [AddCommGroup X']
    [Module R X'] [AddCommGroup Y] [Module R Y] (b : X →ₗ[R] X' →ₗ[R] Y) :
    orthogonal b ⊥ = ⊤ := orthogonal_bot b

/-- Non-example: for the zero pairing every condition has orthogonal everything. -/
example {R X X' Y : Type*} [CommRing R] [AddCommGroup X] [Module R X] [AddCommGroup X']
    [Module R X'] [AddCommGroup Y] [Module R Y] (F : Submodule R X) :
    orthogonal (0 : X →ₗ[R] X' →ₗ[R] Y) F = ⊤ := by
  ext x'
  simp [mem_orthogonal]

/-- The standard pairing on `ℤ/p` is perfect, so `(ℤ/p)^⊥ = 0`. -/
example (p : ℕ) [Fact p.Prime] :
    orthogonal (LinearMap.mul (ZMod p) (ZMod p)) ⊤ = ⊥ := sorry

/-- `L3/iwasawa-cohomology` (H⁰ vanishing): along norms that multiply by `p` at each step, a norm-compatible
system in a torsion-free group vanishes; here, if `x = p^n y_n` for all `n` in `ℤ`, then `x = 0`. -/
example (x : ℤ) (h : ∀ n : ℕ, ∃ y : ℤ, x = 3 ^ n * y) : x = 0 := by
  obtain ⟨y, hy⟩ := h x.natAbs
  refine Int.eq_zero_of_dvd_of_natAbs_lt_natAbs ⟨y, hy⟩ ?_
  rw [Int.natAbs_pow]
  exact Nat.lt_pow_self (by norm_num)

/-- `L3/iwasawa-twist`: the twist automorphism `σ ↦ κ(σ)^{-k} σ` composed with the augmentation sends `σ_c` to
`c^{-k}`; for `k = 1`, `c = 2` in `ℚ`: `2^{-1} · 1 = 1/2`. -/
example : ((2 : ℚ) ^ (-1 : ℤ)) * 1 = 1 / 2 := by norm_num

end SuggestedTest

/-! ## L4: Tate twists and Greenberg's conjecture -/

namespace L4Test

/-- `L4/criticality`: `r_{ℚ_p(n)} = 1` exactly for odd positive `n` (the pole of `Γ((s − n)/2)` at `s = 1`). -/
def rTwist (n : ℤ) : ℕ := if n % 2 = 1 ∧ 1 ≤ n then 1 else 0

/-- `L4/criticality`: `ℚ_p(n)` is critical when `r_{ℚ_p(n)} = r_{ℚ_p(1−n)} = 0`. -/
def criticalTwist (n : ℤ) : Prop := rTwist n = 0 ∧ rTwist (1 - n) = 0

instance (n : ℤ) : Decidable (criticalTwist n) := by unfold criticalTwist; infer_instance

/-- `L4/criticality` (parity table, RJW Remark 13.23): for `−6 ≤ n ≤ 6`, `ℚ_p(n)` is critical iff `n` is even
and positive or odd and negative. -/
example : ∀ n ∈ Finset.Icc (-6 : ℤ) 6,
    criticalTwist n ↔ ((n % 2 = 0 ∧ 2 ≤ n) ∨ (n % 2 = 1 ∧ n ≤ -1)) := by decide

/-- `L4/criticality` (non-example): `ℚ_p` itself is not critical, since `r_{ℚ_p(1)} = 1`. -/
example : ¬ criticalTwist 0 := by decide

end L4Test

/-! ## L0: the invariants-to-coinvariants criterion (Liu et al. 2.1.2)

This is the algebraic endomorphism form; applying it to a continuous topological
procyclic generator uses the supplier identification of invariants/coinvariants.
-/
section WeakSemisimplicity
variable {R M : Type*} [CommRing R] [AddCommGroup M] [Module R M]

def invariantCoinvariantMap (σ : M →ₗ[R] M) :
    LinearMap.ker (σ - LinearMap.id) →ₗ[R] M ⧸ LinearMap.range (σ - LinearMap.id) :=
  (LinearMap.range (σ - LinearMap.id)).mkQ.comp (LinearMap.ker (σ - LinearMap.id)).subtype

def IsWeaklySemisimple (σ : M →ₗ[R] M) : Prop := Function.Bijective (invariantCoinvariantMap σ)

theorem weaklySemisimple_iff_split (σ : M →ₗ[R] M) :
    IsWeaklySemisimple σ ↔ IsCompl (LinearMap.ker (σ - LinearMap.id))
      (LinearMap.range (σ - LinearMap.id)) := sorry

theorem weaklySemisimple_congr {N : Type*} [AddCommGroup N] [Module R N]
    (σ : M →ₗ[R] M) (τ : N →ₗ[R] N) (e : M ≃ₗ[R] N)
    (h : e.toLinearMap.comp σ = τ.comp e.toLinearMap) :
    IsWeaklySemisimple σ ↔ IsWeaklySemisimple τ := sorry

theorem weaklySemisimple_sum {N : Type*} [AddCommGroup N] [Module R N]
    (σ : M →ₗ[R] M) (τ : N →ₗ[R] N) :
    IsWeaklySemisimple (σ.prodMap τ) ↔ IsWeaklySemisimple σ ∧ IsWeaklySemisimple τ := sorry
end WeakSemisimplicity

namespace Tests
/-- Tests.weak_ss_trivial: the canonical map is the identity on the invariant module. -/
example {M : Type*} [AddCommGroup M] [Module ℚ M] :
    IsWeaklySemisimple (LinearMap.id : M →ₗ[ℚ] M) := sorry

def jordan (a : ℚ) : (ℚ × ℚ) →ₗ[ℚ] (ℚ × ℚ) where
  toFun x := (a * x.1 + x.2, a * x.2)
  map_add' := by intros; ext <;> simp <;> ring
  map_smul' := by intros; ext <;> simp <;> ring

/-- Tests.weak_ss_unipotent: invariants map to zero in coinvariants. -/
example : ¬ IsWeaklySemisimple (jordan 1) := sorry
/-- Tests.weak_ss_other_jordan: a Jordan block away from eigenvalue one is allowed. -/
example : IsWeaklySemisimple (jordan 2) := sorry
end Tests

/-! ## L4: an actual filtered Frobenius carrier

The ring W and its Frobenius automorphism are parameters in this prototype. The
unramified Witt-ring identification and its Galois realization are required by
the full Fontaine–Laffaille comparison target, and are not replaced by a predicate.
-/
structure FontaineLaffailleModule (W : Type*) [CommRing W] (p : ℕ) (σ : W ≃+* W)
    (M : Type*) [AddCommGroup M] [Module W M] [Module.Finite W M] where
  F : ℤ → Submodule W M
  antitone : Antitone F
  exhaustive : ∃ a, F a = ⊤
  separated : ∃ b, F b = ⊥
  φ : ∀ i, F i →ₛₗ[σ.toRingHom] M
  divided : ∀ (i : ℤ) (x : F (i + 1)),
    φ i ⟨x, antitone (by omega) x.property⟩ = p • φ (i + 1) x
  generation : Submodule.span W (⋃ i, Set.range (φ i)) = ⊤

def fontaineLaffaille_interval {W M : Type*} [CommRing W] [AddCommGroup M] [Module W M] [Module.Finite W M]
    {p : ℕ} {σ : W ≃+* W} (D : FontaineLaffailleModule W p σ M) (a b : ℤ) : Prop :=
  D.F a = ⊤ ∧ D.F (b + 1) = ⊥

structure FontaineLaffailleHom {W M N : Type*} [CommRing W]
    [AddCommGroup M] [Module W M] [AddCommGroup N] [Module W N]
    [Module.Finite W M] [Module.Finite W N] {p : ℕ} {σ : W ≃+* W} (D : FontaineLaffailleModule W p σ M)
    (D' : FontaineLaffailleModule W p σ N) where
  map : M →ₗ[W] N
  filtration : ∀ i, (D.F i).map map ≤ D'.F i
  frobenius : ∀ i (x : D.F i),
    map (D.φ i x) = D'.φ i ⟨map x, filtration i (Submodule.mem_map_of_mem x.property)⟩

/-- Direct sum of genuine filtered Frobenius objects; the interval is checked separately. -/
def fontaineLaffaille_sum {W M N : Type*} [CommRing W]
    [AddCommGroup M] [Module W M] [Module.Finite W M]
    [AddCommGroup N] [Module W N] [Module.Finite W N]
    {p : ℕ} {σ : W ≃+* W} (D : FontaineLaffailleModule W p σ M)
    (D' : FontaineLaffailleModule W p σ N) : FontaineLaffailleModule W p σ (M × N) where
  F i := (D.F i).prod (D'.F i)
  antitone := by sorry
  exhaustive := by sorry
  separated := by sorry
  φ := by sorry
  divided := by sorry
  generation := by sorry

namespace Tests
/-- Tests.fl_zero: zero modules admit the zero filtration in every interval. -/
example (a b : ℤ) : ∃ D : FontaineLaffailleModule ℤ 3 (RingEquiv.refl ℤ) (Fin 0 → ℤ),
    fontaineLaffaille_interval D a b := sorry
/-- Tests.fl_rank_one: divided Frobenius generation includes the unit weight-zero object. -/
example : ∃ D : FontaineLaffailleModule ℤ 3 (RingEquiv.refl ℤ) ℤ,
    fontaineLaffaille_interval D 0 0 ∧ ∀ x : D.F 0, D.φ 0 x = x := sorry
/-- Omitting Frobenius generation would wrongly admit this nonzero object. -/
example (D : FontaineLaffailleModule ℤ 3 (RingEquiv.refl ℤ) ℤ) :
    ¬ (∀ i (x : D.F i), D.φ i x = 0) := sorry
end Tests

/-! ## L4: archimedean realization on the pinned Hodge carrier

The coefficient conjugation is antilinear; F∞ is complex-linear. The actual
opposed filtration and Hodge-number API come from TauCeti.Geometry.Hodge.
-/
structure ArchimedeanRealization (W : Type*) [AddCommGroup W] [Module ℂ W] [FiniteDimensional ℂ W]
    (ω : TauCeti.Hodge.Conjugation W) (w : ℤ) where
  hodge : TauCeti.Hodge.HodgeStructureOn W ω w
  FInfty : W ≃ₗ[ℂ] W
  involutive : Function.Involutive FInfty
  commute : ∀ x, FInfty (ω.toEquiv x) = ω.toEquiv (FInfty x)
  exchange : ∀ a, (hodge.piece a).map FInfty.toLinearMap = hodge.piece (w - a)

variable {W : Type*} [AddCommGroup W] [Module ℂ W] [FiniteDimensional ℂ W]
  {ω : TauCeti.Hodge.Conjugation W} {w : ℤ}

/-- Product conjugation used by the finite direct-sum realization. -/
def productConjugation {U : Type*} [AddCommGroup U] [Module ℂ U]
    (ω : TauCeti.Hodge.Conjugation W) (ω' : TauCeti.Hodge.Conjugation U) :
    TauCeti.Hodge.Conjugation (W × U) where
  toEquiv := {
    toFun := fun x => (ω.toEquiv x.1, ω'.toEquiv x.2)
    invFun := fun x => (ω.toEquiv.symm x.1, ω'.toEquiv.symm x.2)
    left_inv := by sorry
    right_inv := by sorry
    map_add' := by sorry
    map_smul' := by sorry }
  involutive := by sorry

/-- Direct sum on the opposed-filtration carrier, extended by the two Betti involutions. -/
def archRealization_sum {U : Type*} [AddCommGroup U] [Module ℂ U] [FiniteDimensional ℂ U]
    {ω' : TauCeti.Hodge.Conjugation U} (A : ArchimedeanRealization W ω w)
    (B : ArchimedeanRealization U ω' w) :
    ArchimedeanRealization (W × U) (productConjugation ω ω') w where
  hodge := {
    F := fun a => (A.hodge.F a).prod (B.hodge.F a)
    F_antitone := by sorry
    F_top := by sorry
    opposed := by sorry }
  FInfty := A.FInfty.prodCongr B.FInfty
  involutive := by sorry
  commute := by sorry
  exchange := by sorry

/-- The underlying Hodge dual and Tate shift are existing library constructions. -/
def archRealization_tateDual (A : ArchimedeanRealization W ω w) :
    ArchimedeanRealization (Module.Dual ℂ W) ω.dual (2-w) where
  hodge := by
    have h : -w - 2 * (-1) = 2-w := by ring
    exact h ▸ A.hodge.dual.tateTwist (-1)
  FInfty := LinearEquiv.ofInvolutive (-A.FInfty.dualMap.toLinearMap) (by sorry)
  involutive := by sorry
  commute := by sorry
  exchange := by sorry

def archRealization_hodgeCarrier (A : ArchimedeanRealization W ω w) := A.hodge

def archRealization_diagonalMultiplicity (A : ArchimedeanRealization W ω w) (a : ℤ)
    (ε : Fin 2) : ℕ :=
  Module.finrank ℂ ((A.hodge.piece a ⊓ LinearMap.ker
    (A.FInfty.toLinearMap - ((-1 : ℂ) ^ (a + ε.val)) • LinearMap.id)) : Submodule ℂ W)

inductive ShiftedGamma where
  | real (shift : ℤ)
  | complex (shift : ℤ)
  deriving DecidableEq

def hodgeGammaFactors (A : ArchimedeanRealization W ω w) : List (ShiftedGamma × ℕ) := by
  classical
  exact A.hodge.finite_setOf_hodgeNumber_ne_zero.toFinset.toList.flatMap fun a =>
    if a < w - a then [(.complex (-a), A.hodge.hodgeNumber a)]
    else if 2 * a = w then
      [(.real (-a), archRealization_diagonalMultiplicity A a 0),
       (.real (1 - a), archRealization_diagonalMultiplicity A a 1)]
    else []

def complexHodgeGammaFactors (H : TauCeti.Hodge.HodgeStructureOn W ω w) :
    List (ShiftedGamma × ℕ) := by
  classical
  exact H.finite_setOf_hodgeNumber_ne_zero.toFinset.toList.map fun a =>
    (.complex (-min a (w-a)), H.hodgeNumber a)

def hodgeGammaFactor (factors : List (ShiftedGamma × ℕ)) (s : ℂ) : ℂ :=
  (factors.map fun f =>
    (match f.1 with
     | .real a => Complex.Gammaℝ (s + (a : ℂ))
     | .complex a => Complex.Gammaℂ (s + (a : ℂ))) ^ f.2).prod

def gammaPoleOrder (factors : List (ShiftedGamma × ℕ)) (m : ℤ) : ℕ :=
  (factors.map fun f =>
    match f.1 with
    | .real a => if m + a ≤ 0 ∧ (m+a) % 2 = 0 then f.2 else 0
    | .complex a => if m+a ≤ 0 then f.2 else 0).sum

theorem gammaFactor_sum (f g : List (ShiftedGamma × ℕ)) (s : ℂ) :
    hodgeGammaFactor (f ++ g) s = hodgeGammaFactor f s * hodgeGammaFactor g s := sorry

theorem gammaPoleOrder_sum (f g : List (ShiftedGamma × ℕ)) (m : ℤ) :
    gammaPoleOrder (f ++ g) m = gammaPoleOrder f m + gammaPoleOrder g m := sorry

/-- The existing lattice conjugation on the native Tate line. -/
abbrev standardConjugation : TauCeti.Hodge.Conjugation ℂ :=
  TauCeti.Hodge.latticeConjugation TauCeti.Hodge.isBaseChange_tateLatticeMap

/-- RJW's L-function convention uses the existing Hodge Tate object with index -n.
Only the weight transport is new; the filtration, opposedness and conjugation are native. -/
def tateHodge (n : ℤ) : TauCeti.Hodge.HodgeStructureOn ℂ standardConjugation (2*n) := by
  have h : -2 * (-n) = 2*n := by ring
  exact h ▸ (TauCeti.Hodge.tate (-n))

/-- Complex-linear multiplication by (-1)^n is the real Betti involution. -/
def tateArchimedean (n : ℤ) : ArchimedeanRealization ℂ standardConjugation (2*n) where
  hodge := tateHodge n
  FInfty := LinearEquiv.ofInvolutive
    (((-1 : ℂ) ^ n) • (LinearMap.id : ℂ →ₗ[ℂ] ℂ)) (by sorry)
  involutive := by sorry
  commute := by sorry
  exchange := by sorry

theorem tateHodge_number (n a : ℤ) : (tateHodge n).hodgeNumber a = if a=n then 1 else 0 := sorry

theorem gamma_tate_factor (n : ℤ) (s : ℂ) :
    hodgeGammaFactor (hodgeGammaFactors (tateArchimedean n)) s = Complex.Gammaℝ (s-n) := sorry

def poleOrderAtOne (A : ArchimedeanRealization W ω w) : ℕ := gammaPoleOrder (hodgeGammaFactors A) 1

/-- Criticality is computed from a realization and its native Tate dual. -/
def IsGreenbergCritical (A : ArchimedeanRealization W ω w) : Prop :=
  poleOrderAtOne A = 0 ∧ poleOrderAtOne (archRealization_tateDual A) = 0

/-- Archimedean Gamma factor computed from the actual carrier. -/
def gammaFactor (A : ArchimedeanRealization W ω w) (s : ℂ) : ℂ :=
  hodgeGammaFactor (hodgeGammaFactors A) s

theorem poleOrderAtOne_tateTwist (n : ℤ) :
    poleOrderAtOne (tateArchimedean n) = if n % 2 = 1 ∧ 1 ≤ n then 1 else 0 := sorry

theorem isGreenbergCritical_tateTwist_iff (n : ℤ) :
    IsGreenbergCritical (tateArchimedean n) ↔
      ((n % 2 = 0 ∧ 2 ≤ n) ∨ (n % 2 = 1 ∧ n ≤ -1)) := sorry

namespace Tests
/-- twist_two and twist_minus_one, on the carrier and its computed Tate dual. -/
example : IsGreenbergCritical (tateArchimedean 2) ∧
    IsGreenbergCritical (tateArchimedean (-1)) := sorry
/-- twist_zero: no arbitrary dual Gamma list can change this failure. -/
example : ¬ IsGreenbergCritical (tateArchimedean 0) := sorry
/-- twist_one: the pole at one is read from the Tate realization. -/
example : poleOrderAtOne (tateArchimedean 1) = 1 := sorry
/-- Tests.arch_tate_convention: the actual carrier has the chosen (n,n) type. -/
example (n : ℤ) : (tateArchimedean n).hodge.hodgeNumber n = 1 := sorry
/-- Tests.gamma_zero: empty factors give the unit, even at totalized Gamma poles. -/
example (s : ℂ) : hodgeGammaFactor [] s = 1 ∧ gammaPoleOrder [] 0 = 0 := by simp [hodgeGammaFactor, gammaPoleOrder]
/-- Tests.gamma_tate: the result follows from the carrier, not a supplied Gamma function. -/
example (n : ℤ) (s : ℂ) :
    hodgeGammaFactor (hodgeGammaFactors (tateArchimedean n)) s = Complex.Gammaℝ (s-n) := sorry
/-- Tests.gamma_real_sign: changing the real sign changes the pole at zero. -/
example : gammaPoleOrder [(.real 0, 1)] 0 = 1 ∧ gammaPoleOrder [(.real 1, 1)] 0 = 0 := by decide
/-- Tests.gamma_elliptic: a conjugate off-diagonal pair is counted once at a real place. -/
example (A : ArchimedeanRealization W ω 1)
    (h : ∀ a, A.hodge.hodgeNumber a = if a=0 ∨ a=1 then 1 else 0) (s : ℂ) :
    hodgeGammaFactor (hodgeGammaFactors A) s = Complex.Gammaℂ s := sorry
/-- The totalized Gamma value at a pole is zero, while its pole order is positive. -/
example : Complex.Gammaℝ 0 = 0 ∧ gammaPoleOrder [(.real 0, 1)] 0 = 1 := sorry
end Tests

/-- Change the real Betti sign on the same native opposed filtration. -/
def oppositeRealSign (A : ArchimedeanRealization W ω w) :
    ArchimedeanRealization W ω w where
  hodge := A.hodge
  FInfty := LinearEquiv.ofInvolutive (-A.FInfty.toLinearMap) (by sorry)
  involutive := by sorry
  commute := by sorry
  exchange := by sorry

namespace Tests
/-- TauCeti.Selmer.Tests.arch_zero: this tests the actual carrier, not an empty input list. -/
example [Subsingleton W] (A : ArchimedeanRealization W ω w) (a : ℤ) (ε : Fin 2) :
    A.hodge.hodgeNumber a = 0 ∧ archRealization_diagonalMultiplicity A a ε = 0 := sorry
/-- TauCeti.Selmer.Tests.arch_real_involution and Tests.gamma_real_sign:
identical Hodge filtrations with different Betti involutions have different pole orders. -/
example : (oppositeRealSign (tateArchimedean 0)).hodge = (tateArchimedean 0).hodge ∧
    gammaPoleOrder (hodgeGammaFactors (tateArchimedean 0)) 0 = 1 ∧
    gammaPoleOrder (hodgeGammaFactors (oppositeRealSign (tateArchimedean 0))) 0 = 0 := sorry
/-- Tests.gamma_zero: zero carrier yields no factors with positive multiplicity. -/
example [Subsingleton W] (A : ArchimedeanRealization W ω w) (s : ℂ) :
    hodgeGammaFactor (hodgeGammaFactors A) s = 1 ∧
      gammaPoleOrder (hodgeGammaFactors A) 0 = 0 := sorry
end Tests

/-! ## L0: tests against the pinned Kummer map -/
namespace Tests
example (K : Type*) [Field K] (n : ℕ) (hn : IsUnit (n : K)) :
    TauCeti.kummerMap K n hn 1 = 1 := map_one _
example (K : Type*) [Field K] (n : ℕ) (hn : IsUnit (n : K)) (a : Kˣ) :
    TauCeti.kummerMap K n hn (a ^ n) = 1 := sorry
example (K : Type*) [Field K] (n : ℕ) (hn : IsUnit (n : K)) (a : Kˣ) :
    TauCeti.kummerClassMap K n hn (TauCeti.powerClassHom Kˣ n a) =
      TauCeti.kummerMap K n hn a := TauCeti.kummerClassMap_powerClassHom K n hn a
end Tests

end TauCeti.Selmer
/-! ## Complete target and signature contracts

The canonical continuous-cochain, local Tate pairing, completed group algebra,
perfect determinant and period realization interfaces requested in the reader
are not present as a combined carrier in the pinned library. A typed signature
that depends on them is omitted until that interface exists (PROTOCOL §13).
Its exact statement, hypotheses, proposed API names and tests are recorded here.
These contracts are not declarations, implementations or replacement axioms.

The typed algebraic localization diagrams above test maps and conditions. They
do not assert that an arbitrary diagram is canonical Galois cohomology. The
finite-pairing prototypes use perfect ZMod duality where required; compact
arithmetic duality additionally needs the supplier topologies. The filtered
Frobenius prototype includes actual semilinear maps and generation, but leaves
Witt Frobenius/realization and the enlarged torsion category to the full targets.
The archimedean carrier, dual and Tate shift use native Hodge structures.

All names below are the names of the packet, including the inherited short test
names (in the TauCeti.Selmer suggested-test namespace). Their mathematical
statements are the contracts of the corresponding examples, not vacuous tests
of a user-supplied proposition. Native examples above illustrate the subset
whose objects can already be typed without the outstanding supplier interfaces.

### Layer L0

#### SelmerIwasawaCohomology:L0/padic-completion: Comparison of the multiplicative completion with Mathlib adic completion

construction contract: Import Mathlib AdicCompletion (p) A and its canonical map and functoriality. Identify its quotients with A/p^m A, or Aˣ/(Aˣ)^(p^m) in multiplicative notation, and identify AdicCompletion (p) ℤ with ℤ_p. Transport its module and inverse-limit topology through these identifications. The finitely generated tensor comparison is the existing ofTensorProduct theorem, not a new completion construction.

Hypotheses: p prime; no finiteness on A for the definition. Rubin's Definition I.6.2 double-dual completion agrees with this Â for finitely generated A and whenever every A/p^mA is finite; Example I.2.1 uses the inverse limit, which is the object used here.

Prerequisites: mathlib:AdicCompletion, mathlib:AdicCompletion.of, mathlib:AdicCompletion.map, mathlib:AdicCompletion.ofTensorProduct, mathlib:AdicCompletion.ofTensorProduct_bijective_of_finite_of_isNoetherian, mathlib:PadicInt, mathlib:PadicInt.toZModPow

Source: RUBIN-ES, Chapter I, §2, Example 2.1, printed p. 3 (PDF p. 13); RUBIN-ES, Chapter I, §6.2, Definition 6.2, printed p. 14 (PDF p. 24)

API TauCeti.Selmer.toPCompletion (constructor): The canonical map A → Â.

API TauCeti.Selmer.ker_toPCompletion (characterisation): ker(A → Â) = ⋂_m p^mA.

API TauCeti.Selmer.pCompletionMap (functoriality): A homomorphism A → B induces Â → B̂, with identity and composition laws.

API TauCeti.Selmer.adicCompletion_int_equiv_padicInt (equivalence): AdicCompletion(p)ℤ ≅ ℤ_p, making Â a ℤ_p-module.

API TauCeti.Selmer.pCompletion_bijective_of_finite (compatibility): For finitely generated A, ℤ_p ⊗ A → Â is bijective (Mathlib's ofTensorProduct).

Example pCompletion_prime_to_p (degenerate): A finite group of order prime to p has Â = 0 (ℤ/2 with p = 3).

Example pCompletion_int (computation): ℤ̂ = ℤ_p: ℤ_p ⊗ ℤ → ℤ̂ is bijective.

Example pCompletion_rat (degenerate): ℚ is p-divisible, so ℚ̂ = 0.

Example pCompletion_free_infinite (non-example): For A = ℤ^(ℕ), ℤ_p ⊗ A → Â is not surjective (∑ p^i e_i is not a finite sum).

Example pCompletion_Zl (non-example): For ℓ ≠ p, ℤ_ℓ is p-divisible, so its completion is 0 although ℤ_p ⊗_ℤ ℤ_ℓ ≠ 0.

#### SelmerIwasawaCohomology:L0/units-completion: Completion of global units

lemma contract: For a number field F, the unit group E_F = 𝓞_F^× is finitely generated, so ℤ_p ⊗ E_F ≅ Ê_F; and the map Ê_F → (F^×)^ induced by E_F ⊆ F^× is injective, because E_F ∩ (F^×)^{p^m} = E_F^{p^m}: a p^m-th root in F of a unit is a unit.

Hypotheses: F a number field, p prime, m ≥ 0.

Prerequisites: SelmerIwasawaCohomology:L0/padic-completion, mathlib:NumberField.Units.exist_unique_eq_mul_prod, mathlib:IsIntegral.of_pow, mathlib:NumberField.RingOfIntegers

Source: RUBIN-ES, Chapter I, §6.2, Definition 6.2, printed p. 14 (PDF p. 24)

#### SelmerIwasawaCohomology:L0/s-units-completion: Completion of S-units

lemma contract: For a number field F and a finite set S of places containing the archimedean ones, 𝓞_{F,S}^× is finitely generated, so ℤ_p ⊗ 𝓞_{F,S}^× ≅ (𝓞_{F,S}^×)^, and (𝓞_{F,S}^×)^ → (F^×)^ is injective.

Hypotheses: S finite, containing the archimedean places.

Prerequisites: SelmerIwasawaCohomology:L0/padic-completion, SelmerIwasawaCohomology:L0/units-completion, tauceti:TauCetiRoadmap/GlobalNumberFields#layer-6-additive-strong-approximation-and-ideles

Source: RUBIN-ES, Chapter I, §6.2, Definition 6.2, printed p. 14 (PDF p. 24)

#### SelmerIwasawaCohomology:L0/local-completion: Local completion and algebraic tensor comparison

lemma contract: Import the local multiplicative completion A(K) and its p-adic module from Tau Ceti LocalGaloisGroups Layer 7. Identify it with the L0 Mathlib completion through their common quotient tower. For K/ℚ_ℓ finite the canonical Kˣ⊗ℤℤ_p→A(K) is surjective and not injective: valuation contributes ℤ_p; principal units contribute their p-adic completion, not their algebraic tensor product. For ℓ=p the noninjectivity includes a⊗1−1⊗a in ℤ_p⊗ℤℤ_p with a∉ℚ; for ℓ≠p the nonzero tensor of the pro-ℓ unit factor is killed by completion.

Hypotheses: K/ℚ_ℓ finite, ℓ any prime (ℓ = p allowed).

Prerequisites: SelmerIwasawaCohomology:L0/padic-completion, tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-1-units-the-filtration-and-the-multiplicative-group

Source: RJW-PADIC-L, §10.5, (10.8), printed p. 53 (arXiv v2)

#### SelmerIwasawaCohomology:L0/local-power-class-finite: Profinite topology on the local Kummer comparison

comparison contract: Use the current Tau Ceti theorem finiteIndex_range_powMonoidHom for K/ℚ_ℓ finite and n≥1, and the current kummerIso, to put the finite discrete topology on Kˣ/(Kˣ)^(p^m) and H¹(K,μ_(p^m)). Their compatible Kummer isomorphisms induce a homeomorphism of inverse limits. This node plans the comparison of topologies, not the already implemented power-class finiteness.

Hypotheses: K/ℚ_ℓ finite; n ≥ 1.

Prerequisites: tauceti:TauCeti.powerClassQuotient, tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-1-units-the-filtration-and-the-multiplicative-group, tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-9-the-galois-interface-hilbert-90-and-kummer-theory

Source: RUBIN-ES, Appendix B, §2, Proposition 2.7, printed p. 153 (PDF p. 163)

#### SelmerIwasawaCohomology:L0/kummer-level-compatibility: Kummer maps along the μ_{p^m} tower

lemma contract: Let K be a field with p invertible in K and m ≥ 0. The p-th power map μ_{p^{m+1}} → μ_{p^m} carries the Kummer class κ_{p^{m+1}}(a) ∈ H^1(G_K, μ_{p^{m+1}}) to κ_{p^m}(a) for every a ∈ K^×.

Hypotheses: p invertible in K (Tau Ceti's hypothesis IsUnit (n : K)).

Prerequisites: tauceti:TauCeti.kummerMap, tauceti:TauCeti.kummerShortExact, tauceti:TauCeti.kummerMap_apply, tauceti:TauCeti.ContCohomology.DiscreteShortExact.explicitDelta0_coeffMap

Source: RUBIN-ES, Chapter I, §2, Example 2.1, printed p. 3 (PDF p. 13); RJW-PADIC-L, §10.5, display (10.7), printed p. 52 (arXiv v2)

#### SelmerIwasawaCohomology:L0/kummer-limit-map: The limit Kummer map

construction contract: For a field K with p invertible, κ_∞ : lim_m K^×/(K^×)^{p^m} → lim_m H^1(G_K, μ_{p^m}) is the limit of the Kummer class maps (TauCeti.kummerClassMap) along the tower of kummer-level-compatibility. It is injective, and bijective once the finite-level Kummer maps are surjective (Hilbert 90, ProfiniteCohomology Layer 9).

Hypotheses: p invertible in K.

Prerequisites: SelmerIwasawaCohomology:L0/kummer-level-compatibility, SelmerIwasawaCohomology:L0/padic-completion, tauceti:TauCeti.kummerClassMap, tauceti:TauCeti.kummerClassMap_injective, tauceti:TauCeti.powerClassQuotient, tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-9-the-galois-interface-hilbert-90-and-kummer-theory

Source: RJW-PADIC-L, §10.5, display (10.7), printed p. 52 (arXiv v2)

API TauCeti.Selmer.kummerLimit_injective (characterisation): κ_∞ is injective.

API TauCeti.Selmer.kummerLimit_bijective (equivalence): κ_∞ is bijective given Hilbert 90 at every level.

API TauCeti.Selmer.kummerLimit_res (functoriality): For finite separable L/K with an embedding, κ_∞ commutes with restriction and the inclusion Kˣ → Lˣ.

API TauCeti.Selmer.kummerLimit_cor (compatibility): κ_∞ carries the norm N_{L/K} to corestriction.

API TauCeti.Selmer.kummerLimit_zp_linear (structure): κ_∞ is ℤ_p-linear.

Example kummerLimit_sepClosed (degenerate): K separably closed: both sides are 0.

Example kummerLimit_real (computation): K = ℝ, p = 2: ℝ^×/(ℝ^×)^{2^m} = ℤ/2 = H^1(ℤ/2, μ_{2^m}), so both limits are ℤ/2.

Example kummerLimit_finite_field (computation): K = 𝔽_q: both sides are the p-part of 𝔽_q^× (Ẑ-cohomology H^1 = μ_{p^m}/(Fr − 1)).

Example kummerLimit_rational (non-example): K = ℚ: the limit is not ℤ_p ⊗ ℚ^× (padic-completion, pCompletion_free_infinite).

#### SelmerIwasawaCohomology:L0/roots-of-unity-mittag-leffler: The system μ_{p^m}(K) is Mittag-Leffler

lemma contract: For any field K, the inverse system m ↦ μ_{p^m}(K) = H^0(G_K, μ_{p^m}) with the p-th power maps consists of finite groups (at most p^m elements), so it is Mittag-Leffler and lim^1_m H^0(G_K, μ_{p^m}) = 0.

Hypotheses: K any field with p invertible.

Prerequisites: mathlib:card_rootsOfUnity, mathlib:rootsOfUnity, mathlib:CategoryTheory.Functor.isMittagLeffler_of_exists_finite_range, ArithmeticGaloisDuality:R02.1/mittag-leffler-lim-one

Source: RUBIN-ES, Appendix B, §2, Proposition 2.3, printed p. 152 (PDF p. 162)

#### SelmerIwasawaCohomology:L0/padic-kummer-identification: The p-adic Kummer identification

theorem contract: For a field K with p invertible, H^1(G_K, ℤ_p(1)) ≅ lim_m K^×/(K^×)^{p^m} = (K^×)^, where ℤ_p(1) = lim μ_{p^m} is a compact coefficient module and H^1 is continuous-cochain cohomology (ArithmeticGaloisDuality:R02.1). The map is H^1(G_K, ℤ_p(1)) → lim_m H^1(G_K, μ_{p^m}), an isomorphism because the Milnor term lim^1 H^0(G_K, μ_{p^m}) vanishes, followed by κ_∞^{−1}. It is an algebraic isomorphism for every K; when every K^×/(K^×)^{p^m} is finite (local fields) both sides are profinite and it is a homeomorphism. It is compatible with restriction and with corestriction versus the norm for finite separable extensions.

Hypotheses: p invertible in K. No finite generation of K^× is assumed; the target is the completion, not K^× ⊗ ℤ_p.

Prerequisites: SelmerIwasawaCohomology:L0/kummer-limit-map, SelmerIwasawaCohomology:L0/roots-of-unity-mittag-leffler, SelmerIwasawaCohomology:L0/local-power-class-finite, ArithmeticGaloisDuality:R02.1/milnor-sequence, ArithmeticGaloisDuality:R02.1/carrier-comparison

Source: RUBIN-ES, Chapter I, §2, Example 2.1, printed p. 3 (PDF p. 13); RUBIN-ES, Appendix B, §2, Proposition 2.3, printed p. 152 (PDF p. 162); RJW-PADIC-L, §10.5, display (10.7), printed p. 52 (arXiv v2)

#### SelmerIwasawaCohomology:L0/s-unit-kummer-identification: The Kummer identification for S-units

theorem contract: Let F be a number field and S a finite set of places containing those above p and ∞. Then H^1(G_{F,S}, ℤ_p(1)) ≅ ℤ_p ⊗ 𝓞_{F,S}^×, compatibly with restriction to finite extensions inside F_S and with corestriction versus the norm.

Hypotheses: S ⊇ {v | p∞}, so μ_{p^m} is a G_{F,S}-module and p is an S-unit.

Prerequisites: SelmerIwasawaCohomology:L0/roots-of-unity-mittag-leffler, SelmerIwasawaCohomology:L0/s-units-completion, ArithmeticGaloisDuality:R02.1/milnor-sequence, ArithmeticGaloisDuality:R02.3/s-unit-kummer-sequence

Source: BURUNGALE-TIAN-26, Footnote 3 to Theorem 2.1, p. 4, and §2.2.3 (arXiv v2); RUBIN-ES, Appendix B, §2, Proposition 2.3, printed p. 152 (PDF p. 162)

#### SelmerIwasawaCohomology:L0/inverse-limit-hypotheses: Which inverse-limit hypotheses hold

lemma contract: For every field K with char K≠p, the μ_(p^m)(K) tower is finite and hence Mittag–Leffler. The H¹(K,μ_(p^m)) tower is Mittag–Leffler for every such K as well: under finite-level Kummer its transitions are the surjections Kˣ/(Kˣ)^(p^(m+1))→Kˣ/(Kˣ)^(p^m). Thus both H¹(K,ℤ_p(1)) and H²(K,ℤ_p(1)) have their ordinary inverse-limit descriptions. For G_(F,S), S⊇{p,∞}, finite H¹ gives Mittag–Leffler separately. Infinite cardinality of the full number-field H¹ does not obstruct Mittag–Leffler; surjectivity proves it.

Hypotheses: p invertible; F a number field; S finite.

Prerequisites: SelmerIwasawaCohomology:L0/roots-of-unity-mittag-leffler, SelmerIwasawaCohomology:L0/local-power-class-finite, SelmerIwasawaCohomology:L0/s-unit-kummer-identification, ArithmeticGaloisDuality:R02.1/milnor-sequence, SelmerIwasawaCohomology:L0/kummer-level-compatibility, ArithmeticGaloisDuality:R02.1/mittag-leffler-lim-one

Source: RUBIN-ES, Appendix B, §2, Proposition 2.3, printed p. 152 (PDF p. 162); RUBIN-ES, Appendix B, §2, Proposition 2.7, printed p. 153 (PDF p. 163)

#### SelmerIwasawaCohomology:L0/kummer-cup-shapiro: Cup products and Shapiro under p-adic Kummer

comparison contract: The p-adic Kummer equivalence intertwines restriction with extension of scalars, corestriction with the field norm, and cup product with the inverse limit of the finite μ_(p^m) cup products. For a finite separable extension L/K, Shapiro followed by evaluation at the identity identifies the induced Kummer class with its L-class; composing the induced-coefficient trace with Shapiro is norm/corestriction. In particular cor(κ_L(a)∪res x)=κ_K(N_(L/K)a)∪x. The cup target is H²(K,ℤ_p(1)⊗ℤ_p M), not H²(K,M) without a twist.

Hypotheses: char K≠p; L/K finite separable; M finite or compact finite free, with the continuous tensor product and coefficient comparison supplied by ArithmeticGaloisDuality.

Prerequisites: SelmerIwasawaCohomology:L0/padic-kummer-identification, ArithmeticGaloisDuality:R02.1/cochains-inverse-limit, tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-7-coinduced-modules-and-shapiros-lemma, tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-12-the-graded-cup-product-in-all-degrees

Source: RUBIN-ES, Appendix B §§4–5, pp. 155–158; Chapter I Example 2.1, p. 3

Example TauCeti.Selmer.Tests.kummer_degree_one (degenerate): For L=K, Shapiro and the norm are the identity.

Example TauCeti.Selmer.Tests.kummer_projection (compatibility): For x=κ_K(b), the formula has the Tate-twist-two cup target.

Example TauCeti.Selmer.Tests.kummer_norm_not_res (non-example): For a base-field a, κ_K(N a)=[L:K]κ_K(a), so replacing corestriction by restriction fails.

#### SelmerIwasawaCohomology:L0/weak-semisimplicity: Weak semisimplicity at the invariant eigenvalue

definition contract: For a finite-type ℤ_p-module or finite-dimensional ℚ_p-space M with continuous action of a procyclic group Γ=Ẑ, let can:M^Γ→M_Γ be inclusion followed by quotient. M is weakly semisimple when can is an isomorphism. With a topological generator σ, this is the direct decomposition M=ker(σ−1)⊕im(σ−1); it is weaker than semisimplicity of every eigenvalue. Supply the same definition after restriction of an O-action to ℤ_p.

Hypotheses: Γ procyclic; continuity in the natural p-adic topology; finite type for integral modules.

Prerequisites: ArithmeticGaloisDuality:R02.2/finite-index-descent

Source: LIU-ETAL-22, Definition 2.1.2, p. 121

API TauCeti.Selmer.IsWeaklySemisimple (constructor): can:M^Γ→M_Γ is bijective.

API TauCeti.Selmer.weaklySemisimple_iff_split (characterisation): Equivalent to ker(σ−1)⊕im(σ−1)=M.

API TauCeti.Selmer.weaklySemisimple_congr (equivalence): An equivariant module equivalence preserves the condition.

API TauCeti.Selmer.weaklySemisimple_sum (compatibility): Finite direct sums are weakly semisimple iff every summand is.

Example TauCeti.Selmer.Tests.weak_ss_trivial (degenerate): The trivial action is weakly semisimple, with can=id.

Example TauCeti.Selmer.Tests.weak_ss_unipotent (non-example): The linear invariants-to-coinvariants criterion fails for σ=[[1,1],[0,1]] on ℚ²; its invariant line maps to zero. The same computation holds over ℚ_p² with the continuous procyclic unipotent action.

Example TauCeti.Selmer.Tests.weak_ss_other_jordan (computation): The linear criterion holds for σ=[[2,1],[0,2]] on ℚ² because σ−1 is invertible, although σ is not semisimple. The same computation applies over ℚ_p for p odd.

#### SelmerIwasawaCohomology:L0/procyclic-integral-criteria: Procyclic invariants and integral lifting

lemma contract: For finite-type integral M with procyclic Γ: M_Γ=0 implies M^Γ=0; surjectivity of can:M^Γ→M_Γ implies bijectivity. Weak semisimplicity is preserved by equivariant subquotients and finite sums. If M is a free O-lattice, M/λM is weakly semisimple and dim_E(M⊗E)^Γ≥dim_k(M/λM)^Γ, then equality holds and M is weakly semisimple.

Hypotheses: O the integers of E/ℚ_p; λ a uniformizer; M free for the last assertion.

Prerequisites: SelmerIwasawaCohomology:L0/weak-semisimplicity

Source: LIU-ETAL-22, Lemmas 2.1.3–2.1.5, pp. 121–123

Example TauCeti.Selmer.Tests.procyclic_1_plus_p (non-example): M=ℤ_p with σ=1+p has rational invariants zero and residual invariants one, so the dimension hypothesis fails and can is not bijective.

Example TauCeti.Selmer.Tests.procyclic_unipotent_reduction (non-example): The residual unipotent two-dimensional action fails the weak-semisimplicity hypothesis.

Example TauCeti.Selmer.Tests.procyclic_trivial_rank (computation): The trivial free rank-r action satisfies both dimensions r and can=id.

### Layer L1

#### SelmerIwasawaCohomology:L1/orthogonal-complement: Orthogonal complements of local conditions

construction contract: Let O be the ring of integers of a finite extension Φ of ℚ_p, D = Φ/O, and b : X × X′ → Y a bilinear pairing of O-modules (Y = Φ, O/MO or D). For an O-submodule F ⊆ X, F^⊥ = {x′ ∈ X′ : b(F, x′) = 0}. Applied to the local Tate pairings H¹(K, A) × H¹(K, A^*) → Y for A = V, W_M, T and A^* = V^*, W^*_M, W^* (Rubin, Theorem 4.1), F^⊥ is the dual local condition F^* of Mazur–Rubin, Definition 1.6.

Hypotheses: b bilinear; perfectness, where used, is a hypothesis of the lemma that uses it.

Prerequisites: mathlib:PontryaginDual, mathlib:Submodule.map_le_iff_le_comap

Source: RUBIN-ES, Chapter I, §4, Theorem 4.1, printed p. 8 (PDF p. 18); MAZUR-RUBIN-16, §1, Definition 1.6, p. 5 (arXiv v1)

API TauCeti.Selmer.orthogonal (constructor): F ↦ F^⊥ for a bilinear pairing of O-modules.

API TauCeti.Selmer.orthogonal_antitone (functoriality): F ≤ G ⇒ G^⊥ ≤ F^⊥.

API TauCeti.Selmer.orthogonal_top (simp): For a perfect pairing, X^⊥ = 0: relaxed ↦ strict.

API TauCeti.Selmer.orthogonal_bot (simp): 0^⊥ = X′: strict ↦ relaxed.

API TauCeti.Selmer.orthogonal_orthogonal (characterisation): F^⊥⊥ = F for perfect pairings of finite modules, of Φ-spaces, and of finitely generated O-modules against cofinitely generated ones.

API TauCeti.Selmer.orthogonal_map_eq_comap (compatibility): (π F)^⊥ = ι^{−1}(F^⊥) for adjoint π, ι.

API TauCeti.Selmer.orthogonal_comap_eq_map (compatibility): (π^{−1} G)^⊥ = ι(G^⊥) for adjoint π, ι and perfect pairings.

API TauCeti.Selmer.card_mul_card_orthogonal (relation): #F · #F^⊥ = #X for finite X, b perfect.

API TauCeti.Selmer.quotientPairing_perfect (relation): For a perfect pairing in the finite, finite-dimensional or compact/discrete dual categories above, F^⊥=F′ induces a perfect pairing (X/F)×F′→Y, with the quotient and dual topologies retained.

Example relax_strict (computation): For a perfect pairing, X^⊥ = 0 and 0^⊥ = X′.

Example zmod_p (computation): The standard pairing ℤ/p × ℤ/p → ℤ/p: 0^⊥ = ℤ/p and (ℤ/p)^⊥ = 0; the pairing on (ℤ/p)² with F the first axis gives F^⊥ the second axis.

Example local_example (computation): K = ℚ_ℓ with ℓ ≠ p and ℓ ≢ 1 (mod p): H¹(K, ℤ/p) ≅ ℤ/p is all unramified, and its orthogonal complement in H¹(K, μ_p) = K^×/K^{×p} ≅ ℤ/p is 0, which is H¹_ur(K, μ_p) = 𝒪_K^×/𝒪_K^{×p}.

Example zero_pairing (non-example): For the zero pairing F^⊥ = X′ for every F, so F^⊥⊥ = X ≠ F whenever F ≠ X.

#### SelmerIwasawaCohomology:L1/lattice-pairing-compatibility: Compatibility of the local pairings for T, V, W and W_M

lemma contract: Let K be a finite extension of ℚ_ℓ, ℝ or ℂ and T a p-adic representation of G_K. The local Tate pairings of Rubin's Theorem 4.1 are compatible with the coefficient maps: for c ∈ H¹(K, T) and d ∈ H¹(K, V^*), ⟨φ(c), d⟩ = ⟨c, φ^*(d)⟩ in D, where φ : H¹(K, T) → H¹(K, V) and φ^* : H¹(K, V^*) → H¹(K, W^*); and for c ∈ H¹(K, T), d ∈ H¹(K, W^*_M), ⟨π_M(c), d⟩_M = ⟨c, ι_M(d)⟩ in O/MO ⊆ D, where π_M : T ↠ W_M = M^{−1}T/T and ι_M : W^*_M ↪ W^*.

Hypotheses: The pairings of Rubin's Theorem 4.1, perfect by ArithmeticGaloisDuality's local duality.

Prerequisites: ArithmeticGaloisDuality:R02.4, ArithmeticGaloisDuality:R02.1/continuous-section-long-exact, tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-12-the-graded-cup-product-in-all-degrees

Source: RUBIN-ES, Chapter I, §4, proof of Proposition 4.3, printed p. 9 (PDF p. 19)

#### SelmerIwasawaCohomology:L1/derived-local-complements: Local conditions and derived orthogonal complements

construction contract: Given actual local cochain complexes C_X,C_Y with the supplier perfect degree-two cup duality and maps U_X^+→C_X, U_Y^+→C_Y, include a chosen nullhomotopy of their cup product as orthogonality data. Put U_Y^−=Cone(U_Y^+→C_Y). The adjoint U_X^+→RHom(U_Y^−,J)[−2] defines Err_v as its cone. Derived complementarity means Err_v is acyclic; H¹-annihilation alone does not imply it. For complementary finite-free coefficient subcomplexes X^+,Y^+ under X⊗Y→J(1), the coefficient adjoint X/X^+→D_J(Y^+)(1) gives the vanishing criterion.

Hypotheses: Bounded local conditions and coefficient finiteness/cofiniteness satisfying Nekovář 6.2.5; p=2 real places use the supplier modified complexes, or exclude real places. J is the chosen injective or dualizing coefficient complex.

Prerequisites: ArithmeticGaloisDuality:D7/derived-local-duality, SelmerIwasawaCohomology:L1/orthogonal-complement

Source: NEKOVAR-SC, §§6.2.1–6.2.7, pp. 137–140; §6.7, pp. 151–154

API TauCeti.Selmer.LocalConditionMorphism (constructor): A morphism U^+→C on the actual continuous cochain carrier.

API TauCeti.Selmer.localMinus (constructor): The cone of U^+→C.

API TauCeti.Selmer.localDualError (constructor): Cone of the cup-adjoint U_X^+→D(U_Y^−)[−2].

API TauCeti.Selmer.derivedComplement_iff (characterisation): Derived complementarity iff the error cone is acyclic.

API TauCeti.Selmer.localDualError_congr (functoriality): Compatible quasi-isomorphisms and nullhomotopies give equivalent error cones.

Example TauCeti.Selmer.Tests.derived_strict_relaxed (degenerate): The zero and identity local-condition maps are derived complements under perfect local duality.

Example TauCeti.Selmer.Tests.derived_h0_matters (non-example): Adding a nonzero degree-zero complex with zero map to U^+ leaves its H¹ image unchanged but changes the error cone.

Example TauCeti.Selmer.Tests.derived_nonperfect_pairing (non-example): For a zero coefficient pairing on nonzero modules, H¹ cup annihilation does not produce complementary derived local conditions.

#### SelmerIwasawaCohomology:L1/derived-selmer-duality: Duality for a global mapping fibre with local conditions

theorem contract: Let F_X=Fib(C_global(X)⊕⊕U_X,v^+→⊕C_v(X)), and F_Y similarly, with the arrow res−i and pairings/nullhomotopies as in derived-local-complements. Transport the ArithmeticGaloisDuality D7 global compact-support duality to a map F_X→D_J(F_Y)[−3]. Its error triangle has third vertex ⊕_v Err_v. It is an isomorphism if the local adjoints are quasi-isomorphisms, and otherwise the error cone remains in the statement. This L1 theorem is parametric in local-condition maps; L2 instantiates it, avoiding an L1→L2 dependency.

Hypotheses: Finite S; bounded complexes; the supplier global-duality coefficient hypotheses and modified real-place convention. Chain-level orthogonality data, not just orthogonal H¹ subspaces.

Prerequisites: SelmerIwasawaCohomology:L1/derived-local-complements, ArithmeticGaloisDuality:D7/derived-global-duality, ArithmeticGaloisDuality:D7/compact-support-cochains

Source: NEKOVAR-SC, Proposition 6.3.4, pp. 142–143

Example TauCeti.Selmer.Tests.selmer_duality_shift (compatibility): Over a field, complementary conditions pair H^i(F_X) with H^(3−i)(F_Y), rather than degree 2−i.

Example TauCeti.Selmer.Tests.selmer_duality_errors (non-example): A nonacyclic Err_v is retained even if the H¹ local conditions annihilate each other.

Example TauCeti.Selmer.Tests.selmer_duality_real_two (non-example): At p=2 with a real place, the unmodified compact-support complex is not an allowed substitution.

#### SelmerIwasawaCohomology:L1/ordinary-annihilator-correction: Strict ordinary and inertia ordinary annihilators

theorem contract: For a perfect Tate-dual pairing M×M^*(1) and saturated G_v-stable M^+⊂M, put M^−=M/M^+ and (M^*(1))^+=ann(M^+). The strict ordinary condition is im H¹(G_v,M^+) = ker(H¹(G_v,M)→H¹(G_v,M^−)); its dual is the corresponding strict ordinary condition for the dual coefficient filtration, whenever derived coefficient complements and their exact cohomology hypotheses hold. The inertia ordinary condition ker(H¹(G_v,M)→H¹(I_v,M^−)) contains it, with quotient exactly im[H¹(G_v,M)→H¹(G_v,M^−)]∩H¹_ur(G_v,M^−). Thus its annihilator is a subcondition of the strict dual, cut out by pairing with this correction. Equality requires this correction to vanish.

Hypotheses: The quotient and dual lattice must be saturated/finite free in the compact case. Perfect local Tate pairings are imported; no assumed universal equality between strict and inertia ordinary conditions. In this derived-pairing notation M^*(1) is the coefficient-appropriate untwisted linear dual followed by the Tate twist; for a lattice paired with a discrete module the target is E/O. Rubin’s separate star notation already includes its Tate twist.

Prerequisites: SelmerIwasawaCohomology:L1/derived-local-complements, ArithmeticGaloisDuality:R02.1/continuous-section-long-exact, ArithmeticGaloisDuality:R02.2/compact-five-term

Source: NEKOVAR-SC, §6.7.1–6.7.6, pp. 151–153; §8.9.6–8.9.7, pp. 240–244

Example TauCeti.Selmer.Tests.ordinary_full (degenerate): M^+=M gives the relaxed condition and strict dual.

Example TauCeti.Selmer.Tests.ordinary_zero (non-example): M^+=0 gives strict zero but inertia unramified; these differ when H¹_ur(M)≠0.

Example TauCeti.Selmer.Tests.ordinary_exceptional_trivial (non-example): For M^− trivial rational at p, H¹_ur(M^−) has dimension one, so it cannot be dropped.

#### SelmerIwasawaCohomology:L1/nonsingular-pairing: Nonsingular torsion classes away from p

theorem contract: For K/ℚ_ℓ finite with ℓ≠p and a finite O-torsion G_K-module R, define H¹_ns as the kernel of the singular map H¹(K,R)→H¹(I_K,R)^(Fr=1). This is H¹_ur and the map is surjective, by residue cohomological dimension one. The cup pairing H¹_ns(K,R)×H¹_ns(K,R^∨(1))→E/O vanishes. This assertion is annihilation, not exact complementarity for arbitrary ramified R; exactness for unramified finite modules comes from the supplier theorem.

Hypotheses: Finite torsion R; Tate dual is Hom_O(R,E/O)(1).

Prerequisites: ArithmeticGaloisDuality:R02.2/hochschild-serre-spectral-sequence, ArithmeticGaloisDuality:R02.4/unramified-exact-annihilators

Source: LIU-ETAL-22, Definition 2.2.2 and Lemma 2.2.3, p. 124

### Layer L2

#### SelmerIwasawaCohomology:L2/selmer-data: Compact/rational compact and rational extensions of the upstream Selmer structure

construction contract: Extend the general discrete Selmer interface imported from Tau Ceti EllipticCurves Layer 7 to compact lattice T and rational V cohomology, and compare coefficient propagation on A=V/T with that interface. Selmer data over a commutative ring R indexed by a set of places ι: a global R-module H (for example H^1(G_{K,Σ}, M)), local R-modules H_v (for example H^1(K_v, M)), R-linear localisation maps res_v : H → H_v, and local conditions L_v ⊆ H_v (R-submodules). Modifications replace the conditions: relaxed (L_v = H_v) on a set of places, strict (L_v = 0) on a set of places.

Hypotheses: The data are module-theoretic, so the same API serves discrete (Tau Ceti), compact and rational coefficients (ArithmeticGaloisDuality:R02.1). Tau Ceti EllipticCurves Layer 7 supplies the general discrete Selmer structure and kernel. This node plans its compact/rational extension and the comparison with A=V/T, not a second discrete definition.

Prerequisites: mathlib:Submodule.map_le_iff_le_comap, tauceti:TauCetiRoadmap/EllipticCurves#layer-7-selmer-groups-and-sha-aec-x4

Source: MAZUR-RUBIN-16, §1, Definition 1.1, p. 4 (arXiv v1); MAZUR-RUBIN-16, §2, Definition 2.1, p. 6 (arXiv v1)

API TauCeti.Selmer.SelmerData.withCond (constructor): Replace the local conditions.

API TauCeti.Selmer.SelmerData.relax (constructor): Relaxed condition H_v at the places of a set B.

API TauCeti.Selmer.SelmerData.strict (constructor): Strict condition 0 at the places of a set A.

API TauCeti.Selmer.SelmerData.selmer_strict_le_le_relax (relation): Sel_strict ≤ Sel ≤ Sel_relaxed.

Example selmer_all_relaxed (degenerate): All conditions relaxed: the Selmer module is H.

Example selmer_all_strict (computation): All conditions strict: the Selmer module is ⋂_v ker res_v.

Example selmer_no_places (degenerate): No places: the Selmer module is H.

Example selmer_strict_le_relax (computation): Strict ≤ relaxed.

#### SelmerIwasawaCohomology:L2/selmer-kernel: Compact/rational compact/rational Selmer kernel and discrete comparison

construction contract: Extend the general discrete Selmer interface imported from Tau Ceti EllipticCurves Layer 7 to compact lattice T and rational V cohomology, and compare coefficient propagation on A=V/T with that interface. For Selmer data D, Sel(D) = {c ∈ H : res_v(c) ∈ L_v for all v} = ker(H → ∏_v H_v/L_v).

Hypotheses: For infinitely many places the product is the right target; in the Galois instance only finitely many conditions are nontrivial (Rubin's remark after Definition 5.1). Tau Ceti EllipticCurves Layer 7 supplies the general discrete Selmer structure and kernel. This node plans its compact/rational extension and the comparison with A=V/T, not a second discrete definition.

Prerequisites: SelmerIwasawaCohomology:L2/selmer-data, tauceti:TauCetiRoadmap/EllipticCurves#layer-7-selmer-groups-and-sha-aec-x4

Source: MAZUR-RUBIN-16, §2, Definition 2.1, p. 6 (arXiv v1); RUBIN-ES, Chapter I, §5, Definition 5.1, printed pp. 11–12 (PDF pp. 21–22)

API TauCeti.Selmer.SelmerData.mem_selmer (characterisation): c ∈ Sel iff res_v c ∈ L_v for all v.

API TauCeti.Selmer.SelmerData.selmer_eq_ker (equivalence): Sel = ker(H → ∏_v H_v/L_v).

API TauCeti.Selmer.SelmerData.selmer_mono (relation): Monotone in the local conditions.

Example selmer_kernel_relaxed (degenerate): Relaxed everywhere gives H.

Example selmer_kernel_strict (computation): Strict everywhere gives ⋂ ker res_v.

Example selmer_kernel_empty (degenerate): An empty index set gives H.

#### SelmerIwasawaCohomology:L2/change-of-conditions: Change of local conditions

lemma contract: If L_v ≤ L'_v for all v, then Sel_L ⊆ Sel_{L'} and the sequence 0 → Sel_L → Sel_{L'} → ∏_v L'_v/L_v is exact.

Hypotheses: Same global module and localisation maps for both conditions.

Prerequisites: SelmerIwasawaCohomology:L2/selmer-kernel

Source: MAZUR-RUBIN-16, §2, Definition 2.3 and display (2.4), pp. 6–7 (arXiv v1)

#### SelmerIwasawaCohomology:L2/selmer-functoriality: Functoriality of Selmer modules

lemma contract: A map of Selmer data (R-linear f : H → H', f_v : H_v → H'_v with f_v ∘ res_v = res'_v ∘ f and f_v(L_v) ⊆ L'_v) maps Sel(D) into Sel(D').

Hypotheses: Compatibility squares and inclusion of conditions.

Prerequisites: SelmerIwasawaCohomology:L2/selmer-kernel

Source: RUBIN-ES, Chapter I, §5, Lemma 5.4, printed p. 12 (PDF p. 22)

#### SelmerIwasawaCohomology:L2/condition-propagation: Propagating local conditions

construction contract: Along a coefficient map inducing g : H^1(K_v, X) → H^1(K_v, Y), a condition L ⊆ H^1(K_v, X) propagates forwards to g(L) (quotients T ↠ T/IT, V → W), and a condition L' ⊆ H^1(K_v, Y) propagates backwards to g^{−1}(L') (submodules T[I] ↪ T, T → V). The two form a Galois connection.

Hypotheses: Any R-linear g.

Prerequisites: mathlib:Submodule.map_le_iff_le_comap

Source: MAZUR-RUBIN-16, §1, Definition 1.1, p. 4 (arXiv v1)

API TauCeti.Selmer.propagateImage (constructor): Forward propagation g(L).

API TauCeti.Selmer.propagatePreimage (constructor): Backward propagation g^{−1}(L').

API TauCeti.Selmer.propagate_gc (universal-property): g(L) ≤ L' ↔ L ≤ g^{−1}(L').

API TauCeti.Selmer.propagateImage_top (simp): The relaxed condition propagates forwards along a surjection to the relaxed one.

API TauCeti.Selmer.propagatePreimage_bot (simp): The strict condition propagates backwards to ker g.

Example propagate_top_surjective (computation): Forward propagation of ⊤ along a surjection is ⊤.

Example propagate_bot_preimage (computation): Backward propagation of ⊥ is the kernel.

Example propagate_comp (compatibility): Propagation along g ∘ h is propagation along h then g.

#### SelmerIwasawaCohomology:L2/lattice-passage: From V to T and W; saturation

lemma contract: Given L_V ⊆ H^1(K_v, V), put L_T = inverse image under H^1(K_v, T) → H^1(K_v, V) and L_W = image under H^1(K_v, V) → H^1(K_v, W) (Rubin's H^1_f(K_v, T), H^1_f(K_v, W)). Then H^1(K_v, T)/L_T is torsion-free (L_T is saturated) and L_W is divisible.

Hypotheses: T a finitely generated free ℤ_p- or O-module with continuous action, V = T[1/p], W = V/T; L_V a ℚ_p-subspace.

Prerequisites: SelmerIwasawaCohomology:L2/condition-propagation, ArithmeticGaloisDuality:R02.1/lattice-torsion-sequence

Source: RUBIN-ES, Chapter I, §3.2, Definition 3.4, printed p. 5 (PDF p. 15); RUBIN-ES, Chapter I, §3.2, proof of Lemma 3.5, printed p. 6 (PDF p. 16)

#### SelmerIwasawaCohomology:L2/unramified-condition: The unramified condition

construction contract: For a decomposition group G_v with inertia subgroup I_v and a G_v-module B, H^1_ur(K_v, B) = ker(H^1(G_v, B) → H^1(I_v, B)). By inflation–restriction it is the image of H^1(G_v/I_v, B^{I_v}), and for procyclic G_v/I_v generated by Fr it is B^{I_v}/(Fr − 1)B^{I_v}.

Hypotheses: B discrete, a finitely generated ℤ_p-module, or a finite-dimensional ℚ_p-space (Rubin Lemma I.3.2).

Prerequisites: SelmerIwasawaCohomology:L2/selmer-data, ArithmeticGaloisDuality:R02.2/compact-five-term, tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-5-exact-sequences

Source: RUBIN-ES, Chapter I, §3.1, Definition 3.1, printed p. 4 (PDF p. 14); RUBIN-ES, Chapter I, §3.1, Lemma 3.2(i), printed p. 4 (PDF p. 14)

API TauCeti.Selmer.unramified (constructor): ker(res to inertia).

API TauCeti.Selmer.unramified_eq_range_inflation (characterisation): = image of inflation from G_v/I_v.

API TauCeti.Selmer.unramified_equiv_coinvariants (equivalence): ≅ B^{I}/(Fr − 1)B^{I}.

API TauCeti.Selmer.greenberg_zero (compatibility): The Greenberg condition with F^+ = 0.

Example unramified_trivial_Zp (computation): B = ℤ/p with trivial action over ℚ_ℓ: H^1_ur = Hom(Gal(K^ur/K), ℤ/p) = ℤ/p.

Example unramified_divisible_W (computation): For unramified T, H^1_f(K, W) = H^1_ur(K, W) (Rubin Lemma 3.5(iv)).

Example unramified_non_example (non-example): For ramified B the inclusion H^1_ur(K, T) ⊆ H^1_f(K, T) can be strict, with quotient (W^I/(W^I)_div)^{Fr=1} (Rubin Lemma 3.5(iii)).

#### SelmerIwasawaCohomology:L2/greenberg-condition: Greenberg's local condition

construction contract: For a decomposition group G_v at p with inertia I_v and a G_v-stable submodule F^+M ⊆ M, L^Gr_v = ker(H^1(G_v, M) → H^1(I_v, M/F^+M)). F^+M need only be stable under G_v, not under the global Galois group.

Hypotheses: F^+ stable under G_v; for W = V/T use the image F^+W of F^+V.

Prerequisites: SelmerIwasawaCohomology:L2/unramified-condition, SelmerIwasawaCohomology:L2/selmer-data

Source: RJW-PADIC-L, §13.5.1, Definition 13.19(1), p. 70 (arXiv v2)

API TauCeti.Selmer.greenberg (constructor): ker(H^1(G_v, M) → H^1(I_v, M/F^+M)).

API TauCeti.Selmer.greenberg_zero (simp): F^+ = 0 gives the unramified condition.

API TauCeti.Selmer.greenberg_top (simp): F^+ = M gives the relaxed condition.

API TauCeti.Selmer.unramified_le_greenberg (relation): H^1_ur ⊆ L^Gr.

Example greenberg_F_zero (degenerate): F^+ = 0: L^Gr = H^1_ur.

Example greenberg_F_top (degenerate): F^+ = M: L^Gr = H^1.

Example greenberg_decomposition_only (non-example): For an ordinary elliptic curve, the ordinary line of V_pE is G_{ℚ_p}-stable but not G_ℚ-stable; the condition is still defined.

#### SelmerIwasawaCohomology:L2/galois-selmer-group: Compact/rational galois-cohomological Selmer groups

construction contract: Extend the general discrete Selmer interface imported from Tau Ceti EllipticCurves Layer 7 to compact lattice T and rational V cohomology, and compare coefficient propagation on A=V/T with that interface. For a number field K, a finite set Σ of places containing those above p∞ and the ramified primes, and a coefficient module M (discrete, compact or rational), Sel_L(K, M) is the Selmer module of the data H = H^1(G_{K,Σ}, M), H_v = H^1(K_v, M), res_v the localisation (restriction to a decomposition group), with local conditions L_v for v ∈ Σ. It equals the classes of H^1(K, M) that are unramified outside Σ and satisfy L_v at Σ (Rubin Lemma I.5.3).

Hypotheses: Σ ⊇ {v | p∞} ∪ {ramified primes}; the conditions at v ∉ Σ are unramified. Tau Ceti EllipticCurves Layer 7 supplies the general discrete Selmer structure and kernel. This node plans its compact/rational extension and the comparison with A=V/T, not a second discrete definition.

Prerequisites: SelmerIwasawaCohomology:L2/selmer-kernel, SelmerIwasawaCohomology:L2/unramified-condition, ArithmeticGaloisDuality:R02.3/restricted-ramification-group, ArithmeticGaloisDuality:R02.3/localisation-maps, ArithmeticGaloisDuality:R02.1/carrier-comparison, tauceti:TauCetiRoadmap/EllipticCurves#layer-7-selmer-groups-and-sha-aec-x4

Source: MAZUR-RUBIN-16, §2, Definition 2.1, p. 6 (arXiv v1); RUBIN-ES, Chapter I, §5, Lemma 5.3, printed p. 12 (PDF p. 22)

API TauCeti.Selmer.galoisSelmer_eq_rubin (equivalence): Sel_L(K, M) = {c ∈ H^1(K, M) : c_v ∈ L_v (v ∈ Σ), c_v unramified (v ∉ Σ)}.

API TauCeti.Selmer.galoisSelmer_enlarge (compatibility): Enlarging Σ with unramified conditions leaves Sel unchanged.

API TauCeti.Selmer.galoisSelmer_relax_eq (simp): Relaxed at every v ∈ Σ: Sel = H^1(G_{K,Σ}, M).

API TauCeti.Selmer.galoisSelmer_map (functoriality): Maps of coefficient modules with compatible conditions induce maps.

Example galoisSelmer_relaxed (degenerate): Relaxed on Σ: H^1(G_{K,Σ}, M).

Example galoisSelmer_mu_p (computation): With coefficients μ_p and relaxed conditions on Σ={v|p∞}, the Selmer group is H¹(G_(K,Σ),μ_p), fitting into the S-unit/p and Pic[p] Kummer sequence. Requiring unramifiedness also at p cuts this group down.

Example galoisSelmer_strict_zero (computation): Strict on Σ for M with H^1(G_{K,Σ}, M) = 0 gives 0.

#### SelmerIwasawaCohomology:L2/pontryagin-dual: Pontryagin duals with the contragredient action

construction contract: For a discrete p-primary module M with a continuous G-action, M^∨ = Hom_cont(M, ℚ_p/ℤ_p) (Mathlib's PontryaginDual for the circle, restricted to p-primary M) with the contragredient action (g·f)(x) = f(g^{−1}x). Over a group ring ℤ_p[[Γ]] the dual is a module through the involution γ ↦ γ^{−1}.

Hypotheses: M discrete p-primary; G acts continuously.

Prerequisites: mathlib:PontryaginDual, mathlib:ContinuousMonoidHom.comp, mathlib:MulDistribMulAction.toMonoidHom

Source: BURUNGALE-TIAN-26, §1.0.1 and §3.1, pp. 1 and 6 (arXiv v2)

API TauCeti.Selmer.contragredient (constructor): (g·f)(x) = f(g^{−1}x).

API TauCeti.Selmer.contragredient_mul (structure): The contragredient action is a left action.

API TauCeti.Selmer.dual_involution (compatibility): As a ℤ_p[[Γ]]-module, M^∨ is the dual twisted by the involution γ ↦ γ^{−1}.

API TauCeti.Selmer.dual_selmer (functoriality): Selmer maps dualise contravariantly.

Example dual_QpZp (computation): (ℚ_p/ℤ_p)^∨ = ℤ_p.

Example dual_finite (degenerate): A finite module has a finite dual of the same order.

Example dual_trivial_action (degenerate): Trivial action dualises to trivial action.

#### SelmerIwasawaCohomology:L2/corank: Coranks

construction contract: For a cofinitely generated discrete ℤ_p-module M, corank_{ℤ_p} M = dim_{ℚ_p}(M^∨ ⊗_{ℤ_p} ℚ_p).

Hypotheses: M cofinitely generated, so M^∨ is a finitely generated ℤ_p-module.

Prerequisites: SelmerIwasawaCohomology:L2/pontryagin-dual, mathlib:Module.finrank

Source: BURUNGALE-TIAN-26, §1.0.1, the exact sequence and (1.1), p. 1 (arXiv v2)

API TauCeti.Selmer.corank (constructor): dim_{ℚ_p}(M^∨ ⊗ ℚ_p).

API TauCeti.Selmer.corank_finite (simp): Finite modules have corank 0.

API TauCeti.Selmer.corank_add (relation): Additive in short exact sequences.

API TauCeti.Selmer.corank_pi_padicInt (simp): ℤ_p^r, the dual of (ℚ_p/ℤ_p)^r, has corank r.

Example corank_Zp (computation): The dual ℤ_p of ℚ_p/ℤ_p has corank 1.

Example corank_finite_zero (degenerate): ℤ_p/(p) has corank 0.

Example corank_Zp2 (computation): ℤ_p² has corank 2.

#### SelmerIwasawaCohomology:L2/elliptic-selmer-instance: The p^∞-Selmer group of an elliptic curve

comparison contract: For an elliptic curve E over a number field F and a prime p, Sel_{p^∞}(E/F) is the Galois Selmer group of M = E[p^∞] with local conditions the images of E(F_v) ⊗ ℚ_p/ℤ_p under the local Kummer maps; equivalently ker(H^1(F, E[p^∞]) → ∏_v H^1(F_v, E)[p^∞]), and the direct limit of the Sel_{p^m}. It sits in 0 → E(F) ⊗ ℚ_p/ℤ_p → Sel_{p^∞}(E/F) → Ш(E/F)[p^∞] → 0.

Hypotheses: E/F elliptic; the finite-level Selmer groups and local Kummer maps come from Tau Ceti EllipticCurves Layer 7. Tau Ceti EllipticCurves Layer 7 supplies the general discrete Selmer structure and kernel. This node plans its compact/rational extension and the comparison with A=V/T, not a second discrete definition.

Prerequisites: SelmerIwasawaCohomology:L2/galois-selmer-group, SelmerIwasawaCohomology:L2/corank, tauceti:TauCetiRoadmap/EllipticCurves#layer-7-selmer-groups-and-sha-aec-x4

Source: BURUNGALE-TIAN-26, §1.0.1, the exact sequence and (1.1), p. 1 (arXiv v2)

#### SelmerIwasawaCohomology:L2/dual-selmer-structure: Dual Selmer structures

construction contract: Extend the upstream discrete structure by orthogonal local conditions on the compact/rational adapters and their dual coefficient diagrams. A Selmer structure F on T (Mazur–Rubin, Definition 2.1) is a finite set Σ(F) of places containing the archimedean places, the places above p and the primes where T is ramified, with a local condition H¹_F(K_q, T) for each q ∈ Σ(F); its Selmer module H¹_F(K, T) is the kernel of H¹(K_{Σ(F)}/K, T) → ⊕_{q∈Σ(F)} H¹(K_q, T)/H¹_F(K_q, T). The dual Selmer structure F^* on T^* = Hom(T, μ_{p^∞}) has Σ(F^*) = Σ(F) and H¹_{F^*}(K_q, T^*) = H¹_F(K_q, T)^⊥ under the local Tate pairing (Mazur–Rubin, Definition 2.5).

Hypotheses: T finitely generated over O with continuous G_K-action, unramified outside a finite set.

Prerequisites: SelmerIwasawaCohomology:L1/orthogonal-complement, SelmerIwasawaCohomology:L1/lattice-pairing-compatibility, SelmerIwasawaCohomology:L2/galois-selmer-group, SelmerIwasawaCohomology:L2/selmer-data

Source: MAZUR-RUBIN-16, §2, Definition 2.1, p. 6 (arXiv v1); MAZUR-RUBIN-16, §2, Definition 2.5, p. 7 (arXiv v1)

API TauCeti.Selmer.SelmerStructure (constructor): Σ(F) with local conditions at each q ∈ Σ(F).

API TauCeti.Selmer.SelmerStructure.selmerModule (projection): H¹_F(K, T) as galois-selmer-group for these data.

API TauCeti.Selmer.SelmerStructure.dual (constructor): F^* on T^*.

API TauCeti.Selmer.SelmerStructure.dual_dual (characterisation): F^{**} = F.

API TauCeti.Selmer.SelmerStructure.dual_modify (compatibility): (F^b_a)^* = (F^*)^a_b: strict at a ↔ relaxed at a (Mazur–Rubin, Definition 2.3).

API TauCeti.Selmer.SelmerStructure.dual_induced (compatibility): The structure induced on T/IT is dual to the one induced on T^*[I].

API TauCeti.Selmer.SelmerStructure.rubin_dual (example): Rubin's S^Σ(K, W_M) and S_Σ(K, W^*_M) are the Selmer modules of dual structures (finite-condition-lattice-duality).

Example relaxed_dual_strict (computation): The structure relaxed at every q ∈ Σ has dual strict at every q ∈ Σ; the dual Selmer module is Ш¹_Σ(K, T^*) (ArithmeticGaloisDuality R02.4/restricted-product-cohomology).

Example finite_selfdual (computation): For T unramified at q ∤ p, the finite condition at q is its own dual.

Example archimedean (computation): At a real place H¹(ℝ, W_M) = 0 for p odd, so every archimedean condition is 0 = its dual; for p = 2 it can be nonzero (Rubin, Remark 3.7).

Example enlarged_sigma (non-example): Adding a place q ∉ Σ(F) to Σ(F^*) with the relaxed condition does not give the dual structure: the dual keeps the finite condition at q.

#### SelmerIwasawaCohomology:L2/unramified-dimension-count: Dimensions of unramified classes

lemma contract: Let K/ℚ_ℓ be finite with ℓ ≠ p and V a finite-dimensional ℚ_p[G_K]-module. Then dim H¹_ur(K, V) = dim V^{G_K}, and dim H¹(K, V)/H¹_ur(K, V) = dim H²(K, V).

Hypotheses: ℓ ≠ p.

Prerequisites: SelmerIwasawaCohomology:L2/unramified-condition, ArithmeticGaloisDuality:R02.2/hochschild-serre-spectral-sequence

Source: RUBIN-ES, Chapter I, §3.1, Corollary 3.3, printed p. 5 (PDF p. 15)

#### SelmerIwasawaCohomology:L2/finite-unramified-comparison: Finite against unramified classes at bad primes

lemma contract: Let K/ℚ_ℓ be finite with ℓ ≠ p, H¹_f(K, V) = H¹_ur(K, V), and H¹_f(K, T), H¹_f(K, W), H¹_f(K, W_M) as in lattice-passage. Put 𝒲 = W^I/(W^I)_div, a finite module. (i) H¹_f(K, W) = H¹_ur(K, W)_div. (ii) H¹_ur(K, T) ⊆ H¹_f(K, T) with finite index, and H¹_s(K, T) is torsion-free. (iii) H¹_ur(K, W)/H¹_f(K, W) ≅ 𝒲/(Fr − 1)𝒲 and H¹_f(K, T)/H¹_ur(K, T) ≅ 𝒲^{Fr=1}. (iv) If T is unramified, H¹_f = H¹_ur for T and W. Moreover H¹_f(K, W_M) is the image of H¹_f(K, T), and equals H¹_ur(K, W_M) when T is unramified. At an archimedean place H¹_f(K, W) = 0, H¹_f(K, T) = H¹(K, T) and H¹_f(K, W_M) = W^{G_K}/M W^{G_K}, all zero unless K = ℝ and p = 2.

Hypotheses: ℓ ≠ p for (i)–(iv); T a lattice.

Prerequisites: SelmerIwasawaCohomology:L2/lattice-passage, SelmerIwasawaCohomology:L2/unramified-condition, ArithmeticGaloisDuality:R02.1/continuous-section-long-exact, ArithmeticGaloisDuality:R02.1/lattice-torsion-sequence

Source: RUBIN-ES, Chapter I, §3.2, Lemma 3.5, printed p. 6 (PDF p. 16); RUBIN-ES, Chapter I, §3.2, Remark 3.7, printed p. 7 (PDF p. 17)

#### SelmerIwasawaCohomology:L2/finite-condition-rational-duality: Local duality for the finite condition on V

theorem contract: If K is archimedean, or nonarchimedean of residue characteristic ℓ ≠ p, then H¹_f(K, V) and H¹_f(K, V^*) are exact orthogonal complements under the local Tate pairing.

Hypotheses: ℓ ≠ p or K archimedean.

Prerequisites: SelmerIwasawaCohomology:L2/unramified-dimension-count, SelmerIwasawaCohomology:L1/orthogonal-complement, ArithmeticGaloisDuality:R02.4

Source: RUBIN-ES, Chapter I, §4, Proposition 4.2, printed p. 9 (PDF p. 19)

#### SelmerIwasawaCohomology:L2/finite-condition-lattice-duality: Local duality for the finite conditions on T and W_M

theorem contract: Suppose K is archimedean, or nonarchimedean of residue characteristic ℓ ≠ p, or nonarchimedean with ℓ = p and H¹_f(K, V), H¹_f(K, V^*) chosen to be orthogonal complements. Then H¹_f(K, T) and H¹_f(K, W^*) are exact orthogonal complements, and so are H¹_f(K, W_M) and H¹_f(K, W^*_M) for every nonzero M ∈ O. In particular, for T unramified and ℓ ≠ p, the unramified conditions on T and T^* are exact annihilators (Mazur–Rubin, Proposition 1.7(i)).

Hypotheses: The case ℓ = p needs the chosen orthogonal pair H¹_f(K, V), H¹_f(K, V^*).

Prerequisites: SelmerIwasawaCohomology:L2/finite-condition-rational-duality, SelmerIwasawaCohomology:L1/orthogonal-complement, SelmerIwasawaCohomology:L1/lattice-pairing-compatibility, SelmerIwasawaCohomology:L2/finite-unramified-comparison, SelmerIwasawaCohomology:L2/lattice-passage, ArithmeticGaloisDuality:R02.4/unramified-exact-annihilators

Source: RUBIN-ES, Chapter I, §4, Proposition 4.3, printed p. 9 (PDF p. 19); MAZUR-RUBIN-16, §1, Proposition 1.7, p. 5 (arXiv v1)

#### SelmerIwasawaCohomology:L2/selmer-limits: Selmer groups of T and W as limits

lemma contract: For a finite set Σ of places: (i) S^Σ(K, T) = lim_M S^Σ(K, W_M) and S_Σ(K, T) = lim_M S_Σ(K, W_M); (ii) S^Σ(K, W) = colim_M S^Σ(K, W_M) and S_Σ(K, W) = colim_M S_Σ(K, W_M); the finite and singular parts of the local cohomology commute with these limits. The map ι_M : H¹(K, W_M) → H¹(K, W) induces a surjection S^Σ(K, W_M) ↠ S^Σ(K, W)[M], which can fail for S_Σ. S^Σ(K, W_M) is finite, S^Σ(K, T) is finitely generated over O, and the Pontryagin dual of S^Σ(K, W) is finitely generated over O.

Hypotheses: Σ finite; T a lattice unramified outside a finite set.

Prerequisites: SelmerIwasawaCohomology:L2/galois-selmer-group, SelmerIwasawaCohomology:L2/lattice-passage, SelmerIwasawaCohomology:L2/finite-unramified-comparison, ArithmeticGaloisDuality:R02.1/tate-inverse-limit, ArithmeticGaloisDuality:R02.3/h1-finite, mathlib:PontryaginDual

Source: RUBIN-ES, Chapter I, §5, Proposition 5.6, printed p. 12 (PDF p. 22); RUBIN-ES, Chapter I, §5, Remark 5.5, printed p. 12 (PDF p. 22)

#### SelmerIwasawaCohomology:L2/selmer-structure-poitou-tate: Poitou–Tate for Selmer groups

theorem contract: Let K be a number field, T a p-adic representation of G_K ramified at finitely many primes, with H¹_f(K_v, V) and H¹_f(K_v, V^*) orthogonal complements at the places above p; let M ∈ O be nonzero and Σ_0 ⊆ Σ finite sets of places. (i) 0 → S^{Σ_0}(K, W_M) → S^Σ(K, W_M) → ⊕_{v∈Σ−Σ_0} H¹_s(K_v, W_M) and 0 → S_Σ(K, W^*_M) → S_{Σ_0}(K, W^*_M) → ⊕_{v∈Σ−Σ_0} H¹_f(K_v, W^*_M) are exact. (ii) The images loc^s(S^Σ(K, W_M)) and loc^f(S_{Σ_0}(K, W^*_M)) are exact orthogonal complements under Σ_{v∈Σ−Σ_0}⟨ , ⟩_v. (iii) S_{Σ_0}(K, W^*_M)/S_Σ(K, W^*_M) ≅ Hom_O(coker(loc^s_{Σ,Σ_0}), O/MO); in particular |S_{Σ_0}(K, W^*_M)| = |coker(loc^s_{Σ,Σ_0})| when S_Σ(K, W^*_M) = 0.

Hypotheses: Orthogonal finite conditions at the places above p; Σ_0 ⊆ Σ finite.

Prerequisites: SelmerIwasawaCohomology:L2/finite-condition-lattice-duality, SelmerIwasawaCohomology:L2/dual-selmer-structure, SelmerIwasawaCohomology:L2/galois-selmer-group, SelmerIwasawaCohomology:L2/change-of-conditions, SelmerIwasawaCohomology:L1/orthogonal-complement, ArithmeticGaloisDuality:R02.4/poitou-tate, ArithmeticGaloisDuality:R02.4/restricted-product-cohomology

Source: RUBIN-ES, Chapter I, §7, Theorem 7.3, printed p. 17 (PDF p. 27)

#### SelmerIwasawaCohomology:L2/selmer-poitou-tate-limit: Poitou–Tate for the Selmer group of W^*

theorem contract: With Σ_p the places above p: S(K, W^*)/S_{Σ_p}(K, W^*) ≅ Hom_O(coker(loc^s_{Σ_p}), D), where loc^s_{Σ_p} : S^{Σ_p}(K, T) → ∏_{v|p} H¹_s(K_v, T).

Hypotheses: As in selmer-structure-poitou-tate.

Prerequisites: SelmerIwasawaCohomology:L2/selmer-structure-poitou-tate, SelmerIwasawaCohomology:L2/selmer-limits, ArithmeticGaloisDuality:R02.1/lim-one-six-term, ArithmeticGaloisDuality:R02.1/mittag-leffler-lim-one, mathlib:PontryaginDual

Source: RUBIN-ES, Chapter I, §7, Corollary 7.5, printed p. 19 (PDF p. 29)

#### SelmerIwasawaCohomology:L2/selmer-complex: Selmer complex as a mapping fibre

construction contract: For a finite set S and a bounded compact/rational/discrete coefficient complex X on the canonical continuous carrier, a complex local condition consists of actual maps i_v^+:U_v^+→C_cont(G_v,X). Define RΓ_f(F,S,X;U^+) as Cone(C_cont(G_(F,S),X)⊕⊕_v U_v^+ --res−i-->⊕_v C_cont(G_v,X))[−1]. Supply the triangles RΓ_f→RΓ_global→⊕U_v^− and RΓ_c→RΓ_f→⊕U_v^+. Strict uses U^+=0 and relaxed uses i=id. Submodules of H¹ are not by themselves a unique choice of U^+.

Hypotheses: Actual continuous complexes and localization maps are supplier objects; finite S; use modified real local complexes at p=2 where required.

Prerequisites: ArithmeticGaloisDuality:D7/compact-support-cochains, SelmerIwasawaCohomology:L1/derived-local-complements, ArithmeticGaloisDuality:R02.1/carrier-comparison

Source: NEKOVAR-SC, Definitions 6.1.1–6.1.2 and triangles 6.1.3, pp. 135–136

API TauCeti.Selmer.selmerComplex (constructor): Cone(res−i)[−1] on canonical continuous complexes.

API TauCeti.Selmer.selmerComplex_globalTriangle (structure): RΓ_f→RΓ_global→⊕Cone(i_v^+) is an exact triangle.

API TauCeti.Selmer.selmerComplex_compactTriangle (structure): RΓ_c→RΓ_f→⊕U_v^+ is an exact triangle.

API TauCeti.Selmer.selmerComplex_map (functoriality): Coefficient/field/local-condition maps and homotopies induce a fibre map, with identity and composition.

API TauCeti.Selmer.selmerComplex_quasiIso (equivalence): Compatible quasi-isomorphic conditions give equivalent Selmer complexes.

Example TauCeti.Selmer.Tests.selmer_complex_relaxed (degenerate): If every i_v=id, RΓ_f is quasi-isomorphic to RΓ_global.

Example TauCeti.Selmer.Tests.selmer_complex_strict (compatibility): If every U_v^+=0, RΓ_f is compact-support cohomology with the same real-place convention.

Example TauCeti.Selmer.Tests.selmer_complex_empty (degenerate): For S empty, the fibre is the global complex, without an extra shift.

Example TauCeti.Selmer.Tests.selmer_complex_same_h1 (non-example): Two local conditions with equal H¹ image can give different Selmer H¹ because their H⁰ differs.

#### SelmerIwasawaCohomology:L2/selmer-complex-h1: The H⁰ correction before the classical Selmer kernel

theorem contract: Assume H¹(U_v^+)→H¹(C_v) is injective. With L_v its image, the fibre LES gives 0→J→H¹(RΓ_f)→Sel_L→0, where J=coker[H⁰(C_global)⊕⊕H⁰(U_v^+) --res−i-->⊕H⁰(C_v)]. The right map forgets the uniquely determined local H¹ lifts. Hence H¹(RΓ_f)=Sel_L when this H⁰ arrow is onto; a sufficient hypothesis is H⁰(i_v^+) bijective for every v. Without H¹-injectivity, retain ker(⊕H¹(U_v^+)→⊕H¹(C_v)) in the kernel calculation.

Hypotheses: Use the fibre of selmer-complex; no unconditional identification of fibre H¹ with the classical kernel.

Prerequisites: SelmerIwasawaCohomology:L2/selmer-complex, SelmerIwasawaCohomology:L2/selmer-kernel

Source: NEKOVAR-SC, §6.1.4, pp. 136–137

Example TauCeti.Selmer.Tests.selmer_h0_boundary (non-example): For global complex 0, one local complex k[0] and strict condition, Sel=0 while H¹(fibre)=k.

Example TauCeti.Selmer.Tests.selmer_h1_local_kernel (non-example): For a nonzero U^+ in degree one mapping to zero, the extra local H¹ survives; H¹i injectivity fails.

Example TauCeti.Selmer.Tests.selmer_h0_surjective (compatibility): Bijective local H⁰ and injective local H¹ give the classical kernel.

#### SelmerIwasawaCohomology:L2/condition-change-triangle: Primitive, imprimitive and strict condition-change triangles

theorem contract: For local-condition maps U^+→U′^+ commuting with their maps to C_v, let D_v=Cone(U_v^+→U′_v^+). There is a triangle RΓ_f(U)→RΓ_f(U′)→⊕D_v. At H¹-submodule level L⊆L′ it gives 0→Sel_L→Sel_L′→⊕_v L′_v/L_v, exact at the first three terms, with the remaining cokernel governed by the fibre H² map and H⁰ corrections. Relaxation at Σ replaces U_v^+ by C_v and D_v by U_v^−; strict modification uses zero. Surjectivity of the displayed localization to local quotients is a separate theorem, never part of the definition of imprimitive Selmer.

Hypotheses: Finite changed set; maps/homotopies on actual complexes. Kernel-level conclusion uses selmer-complex-h1 or its correction.

Prerequisites: SelmerIwasawaCohomology:L2/selmer-complex, SelmerIwasawaCohomology:L2/selmer-complex-h1, SelmerIwasawaCohomology:L2/change-of-conditions

Source: NEKOVAR-SC, §6.1, pp. 135–137; §7.8, pp. 187–192

Example TauCeti.Selmer.Tests.change_identical (degenerate): Identical conditions have acyclic difference and equivalent fibres.

Example TauCeti.Selmer.Tests.change_not_surjective (non-example): With global module 0 and one nonzero local quotient, Sel_L′→L′/L is not onto.

Example TauCeti.Selmer.Tests.change_one_prime (compatibility): Relaxing one place retains exactly its U_v^−, including its degree-zero terms.

#### SelmerIwasawaCohomology:L2/lattice-change-cone: Lattice changes with global and local errors

theorem contract: For stable lattices T⊂T′⊂V with finite Q=T′/T and compatible local-condition complexes, the cone of RΓ_f(T)→RΓ_f(T′) is the fibre of the global coefficient cone RΓ(Q) and the local-condition cones mapping to the local RΓ(Q). If the local conditions form exact triangles with their Q-condition, this is RΓ_f(Q); otherwise retain their discrepancy cones. For this fibre C_Q, the exact fragment H⁰_f(T′)→H⁰(C_Q)→H¹_f(T)→H¹_f(T′)→H¹(C_Q)→H²_f(T) controls the kernel and cokernel. The discrete map A=V/T→A′=V/T′ has kernel Q and has the corresponding exact triangle in the other order. Rationalization identifies both lattice complexes with the same V-complex, but finite integral errors need not vanish.

Hypotheses: Continuous coefficient exact sequences and compatible local maps; Q finite. Saturated propagation of rational conditions does not imply local exactness on every finite quotient.

Prerequisites: SelmerIwasawaCohomology:L2/selmer-complex, SelmerIwasawaCohomology:L2/condition-propagation, ArithmeticGaloisDuality:R02.1/lattice-torsion-sequence

Source: NEKOVAR-SC, §6.1.3, pp. 136–137; §8.10, pp. 249–251; RUBIN-ES, Chapter I, Lemma 5.4 and Remark 5.5, pp. 11–12

Example TauCeti.Selmer.Tests.lattice_equal (degenerate): T=T′ gives Q=0 and an equivalence.

Example TauCeti.Selmer.Tests.lattice_scaling (non-example): T′=p^−1T has nonzero finite Q; integral H⁰ and H² errors cannot be removed by rational equality.

Example TauCeti.Selmer.Tests.lattice_tamagawa (non-example): At a bad Tamagawa prime, the raw inertia condition on Q need not equal the condition propagated from V.

#### SelmerIwasawaCohomology:L2/restriction-injective-descent: Selmer vanishing descends under injective restriction

theorem contract: For a finite extension F′/F and a Selmer structure stable under restriction at every place, restriction maps Sel_F(M) to Sel_F′(M). If p∤[F′:F] for a p-primary O-module M, cor∘res=[F′:F] makes it injective. Alternatively, if M^(G_L)=0 for the Galois closure L/F of F′, inflation–restriction gives injectivity to L, hence to F′. Therefore Sel_F′(M)=0 implies Sel_F(M)=0 under either hypothesis. For M=ad⁰(r)⊗E/O, vanishing of (ad⁰ r̄)^(G_L) implies vanishing of M^(G_L) by taking the lowest nonzero λ-primary torsion level.

Hypotheses: The local conditions must be preserved by restriction. The prime-to-p or invariant-vanishing condition is essential; arbitrary finite extensions do not suffice.

Prerequisites: SelmerIwasawaCohomology:L2/selmer-functoriality, ArithmeticGaloisDuality:R02.2/finite-index-descent, ArithmeticGaloisDuality:R02.2/compact-five-term

Source: CG-APPENDIX-20, Remark after Theorem 1.2, preprint p. 3 (published Appendix A, p. 882)

Example TauCeti.Selmer.Tests.descent_degree_one (degenerate): The identity extension preserves the Selmer group and restriction is injective.

Example TauCeti.Selmer.Tests.descent_p_quotient (non-example): A nonzero Hom(Gal(L/F),ℤ/p) class restricts to zero when Gal(L/F)=ℤ/p and the coefficient action is trivial.

Example TauCeti.Selmer.Tests.descent_residual (compatibility): For p-degree extensions, the residual-invariant criterion may still give injectivity.

### Layer L3

#### SelmerIwasawaCohomology:L3/iwasawa-cohomology: Iwasawa cohomology

construction contract: Let R be a complete local noetherian ring with finite residue field of characteristic p, G a profinite group, H a closed normal subgroup, Γ = G/H, 𝒰 the open subgroups U ⊇ H, and M an ind-admissible R[G]-module; M_U = M ⊗_R R[G/U]. RΓ_Iw(G, H; M) is the complex lim_U C^•_cont(G, M_U) of R̄-modules, R̄ = R⟦Γ⟧, and H^i_Iw(G, H; M) its cohomology. There is a spectral sequence E₂^{ij} = lim^{(i)}_{U,cor} H^j_cont(U, M) ⇒ H^{i+j}_Iw(G, H; M); if M is of finite type over R and G satisfies (F) (finite cohomology of finite modules on open subgroups), then H^j_Iw(G, H; M) = lim_{U,cor} H^j_cont(U, M). If moreover 𝒰 has a cofinal chain and p^∞ divides the pro-finite order of Γ, then H⁰_Iw(G, H; M) = 0.

Hypotheses: R complete local noetherian; M of finite type over R for the corestriction-limit description; condition (F), which G_{K,S} and local Galois groups satisfy (ArithmeticGaloisDuality R02.4/global-finiteness).

Prerequisites: SelmerIwasawaCohomology:L2/galois-selmer-group, ArithmeticGaloisDuality:R02.1/mittag-leffler-lim-one, ArithmeticGaloisDuality:R02.1/tate-inverse-limit, ArithmeticGaloisDuality:R02.4/global-finiteness

Source: NEKOVAR-SC, Chapter 8, 8.3.4–8.3.5, p. 203 (Numdam PDF p. 212); RUBIN-ES, Appendix B, §3, Lemmas 3.1–3.2, printed p. 154 (PDF p. 164)

API TauCeti.Selmer.iwasawaComplex (constructor): RΓ_Iw(G, H; M) = lim_U C^•_cont(G, M_U).

API TauCeti.Selmer.iwasawaCohomology (constructor): H^i_Iw(G, H; M), an R⟦Γ⟧-module.

API TauCeti.Selmer.iwasawaCohomology_equiv_limit (equivalence): Under (F): H^j_Iw(G, H; M) ≅ lim_{U,cor} H^j_cont(U, M) (Nekovář 8.3.5(ii)).

API TauCeti.Selmer.iwasawaCohomology_zero_eq_bot (simp): H⁰_Iw(G, H; M) = 0 when p^∞ divides #Γ (8.3.5(iii); Rubin B.3.2).

API TauCeti.Selmer.iwasawaCohomology_one_equiv (equivalence): lim_F H¹(F, T) = lim_n H¹(F_n, T/p^nT) along a tower (Rubin, Lemma B.3.1).

API TauCeti.Selmer.iwasawaCohomology_map (functoriality): Natural in M and exact on distinguished triangles.

Example finite_gamma (computation): Γ = 1: H^i_Iw(G, G; M) = H^i_cont(G, M).

Example h0_vanishes (computation): Cyclotomic ℤ_p-extension, M=ℤ_p with trivial action: every finite-level H⁰ is ℤ_p, while corestriction multiplies by p along consecutive levels and H⁰_Iw=0. Replacing these transitions by restrictions gives ℤ_p instead.

Example kato_convention (compatibility): Burungale–Tian §2.2.3: Kato's H^q(T) = lim_n H^q(ℤ[ζ_{p^n}, 1/p], T) with corestrictions is this construction for G = G_{ℚ,S}, S = {p, ∞} ∪ {bad primes}, once Kato's étale convention (j_*) is matched with Galois cohomology of G_{ℚ,S}.

Example restriction_limit_nonexample (non-example): With restriction instead of corestriction transitions, lim H⁰(F_n, ℚ_p/ℤ_p) = ℚ_p/ℤ_p ≠ 0: the transition maps are part of the definition.

#### SelmerIwasawaCohomology:L3/iwasawa-shapiro: Shapiro's lemma for Iwasawa cohomology

theorem contract: With 𝓕_Γ(M) = lim_U M_U: for M of finite type over R there are canonical R̄[G]-isomorphisms 𝓕_Γ(M) ≅ (M ⊗_R R̄) ⟨−1⟩ and 𝓕_Γ(M)^ι ≅ (M ⊗_R R̄^ι)⟨−1⟩ ≅ (M ⊗_R R̄)⟨1⟩, where ⟨n⟩ twists the G-action by χ_Γ^n, χ_Γ : G → Γ ⊂ R̄^× the tautological character, and ι is the involution γ ↦ γ^{−1}; 𝓕_Γ(M) is of finite type over R̄. The canonical morphism C^•_cont(G, 𝓕_Γ(M)) → lim_U C^•_cont(G, M_U) is an isomorphism, so RΓ_cont(G, 𝓕_Γ(M)) ≅ RΓ_Iw(G, H; M).

Hypotheses: M ind-admissible of finite type over R; Γ abelian, Γ ≅ Γ₀ × Δ with Γ₀ ≅ ℤ_p^r and Δ finite.

Prerequisites: SelmerIwasawaCohomology:L3/iwasawa-cohomology, ArithmeticGaloisDuality:R02.1/carrier-comparison, PadicMeasuresIwasawaAlgebras:L1

Source: NEKOVAR-SC, Chapter 8, Proposition 8.4.4.1, p. 206 (Numdam PDF p. 215); NEKOVAR-SC, Chapter 8, Proposition 8.4.4.2, p. 207 (Numdam PDF p. 216)

#### SelmerIwasawaCohomology:L3/iwasawa-descent: Descent and control for Iwasawa cohomology

theorem contract: (i) For M supported at the maximal ideal there is the Hochschild–Serre spectral sequence E₂^{ij} = H^i_cont(Γ, H^j_cont(H, M)) ⇒ H^{i+j}_cont(G, M). (ii) If Γ ≅ ℤ_p^r, then RΓ_Iw(G, H; T) ⊗^L_{R̄} R ≅ RΓ_cont(G, T), with a homological spectral sequence E²_{ij} = H_{i,cont}(Γ, H^{−j}_Iw(G, H; T)) ⇒ H^{−i−j}_cont(G, T), each term of finite type over R when G satisfies (F). If Γ ≅ ℤ_p it degenerates into 0 → H^j_Iw(G, H; T)_Γ → H^j_cont(G, T) → H^{j+1}_Iw(G, H; T)^Γ → 0; and if cd_p(G) = e < ∞ and τ_{≤n}T ≅ T, then H^{e+n}_Iw(G, H; T)_Γ ≅ H^{e+n}_cont(G, T). (iii) For a closed Γ′ ≅ ℤ_p^{r′} in Γ with preimage H′, RΓ_Iw(G, H; T) ⊗^L R⟦Γ/Γ′⟧ ≅ RΓ_Iw(G, H′; T), with the analogous spectral sequence and, for Γ′ ≅ ℤ_p, the analogous short exact sequences.

Hypotheses: Γ ≅ ℤ_p^r (or Γ′ ≅ ℤ_p^{r′}); T a bounded-below complex of finite type over R.

Prerequisites: SelmerIwasawaCohomology:L3/iwasawa-shapiro, ArithmeticGaloisDuality:R02.2/hochschild-serre-spectral-sequence, ArithmeticGaloisDuality:R02.2/first-quadrant-spectral-sequence, PadicMeasuresIwasawaAlgebras:L1

Source: NEKOVAR-SC, Chapter 8, Proposition 8.4.8.1, p. 214 (Numdam PDF p. 223); NEKOVAR-SC, Chapter 8, Corollary 8.4.8.2 and Proposition 8.4.8.3, p. 215 (Numdam PDF p. 224)

#### SelmerIwasawaCohomology:L3/iwasawa-torsion-criterion: A criterion for torsion Iwasawa cohomology

theorem contract: Assume Γ ≅ ℤ_p^r, G satisfies (F) and cd_p(G) < ∞. Let 𝔭 ∈ Spec(R) and 𝔭̄ ∈ Spec(R̄) its preimage under the augmentation R̄ → R. If T ∈ D^b of finite type over R has RΓ_cont(G, T)_𝔭 ≅ 0, then RΓ_cont(G, 𝓕_Γ(T))_𝔭̄ ≅ 0.

Hypotheses: The vanishing of the specialised complex at 𝔭 is a hypothesis.

Prerequisites: SelmerIwasawaCohomology:L3/iwasawa-descent, SelmerIwasawaCohomology:L3/iwasawa-shapiro

Source: NEKOVAR-SC, Chapter 8, Proposition 8.4.8.5, p. 216 (Numdam PDF p. 225)

#### SelmerIwasawaCohomology:L3/universal-norms-unramified: Universal norms are unramified away from p

theorem contract: Let T be finitely generated over ℤ_p. (i) If K/ℚ_ℓ is finite with ℓ ≠ p and K_∞ its unramified ℤ_p-extension, every norm-compatible {c_F} ∈ lim H¹(F, T) has c_F ∈ H¹_ur(F, T). (ii) If K is a number field, K_∞/K abelian with Gal(K_∞/K) ≅ ℤ_p^d, and λ ∤ p a prime of F whose decomposition group in Gal(K_∞/K) is infinite, then (c_F)_λ ∈ H¹_ur(F_λ, T). (iii) If S contains the primes where T is ramified, those above p, those with finite decomposition group in Gal(K_∞/K) and the infinite places, then lim_F H¹(F, T) = lim_F H¹(K_S/F, T).

Hypotheses: ℓ ≠ p in (i); d ≥ 1.

Prerequisites: SelmerIwasawaCohomology:L3/iwasawa-cohomology, SelmerIwasawaCohomology:L2/unramified-condition, ArithmeticGaloisDuality:R02.3/restricted-ramification-group

Source: RUBIN-ES, Appendix B, §3, Proposition 3.3, printed p. 154 (PDF p. 164)

#### SelmerIwasawaCohomology:L3/semilocal-cohomology: Semilocal cohomology and descent of local classes

theorem contract: Let K be a number field, q a prime of K, F/K finite and S the primes of F above q, with decomposition groups D_Q = g_Q^{−1} D g_Q. For a discrete G_K-module T and a D-submodule T′, H^i(F, Ind_D^{G_K}(T′)) ≅ ⊕_{Q∈S} H^i(F_Q, T′_Q); in particular H^i(G_F, Ind_D(T)) ≅ ⊕_Q H^i(F_Q, T) and H^i(G_F, Ind_D(T^I)) ≅ ⊕_Q H^i(F_Q, T^{I_Q}). For F/K finite Galois and T finitely generated over ℤ_p, restriction gives H¹(K_q, T) ≅ (⊕_{Q|q} H¹(F_Q, T))^{Gal(F/K)} if [F : K] is prime to p, and H¹(K_q, V) ≅ (⊕_{Q|q} H¹(F_Q, V))^{Gal(F/K)} always.

Hypotheses: T discrete for the induction statements; finitely generated over ℤ_p for the descent.

Prerequisites: SelmerIwasawaCohomology:L3/iwasawa-cohomology, ArithmeticGaloisDuality:R02.2/finite-index-descent

Source: RUBIN-ES, Appendix B, §5, Proposition 5.1, printed p. 157 (PDF p. 167)

#### SelmerIwasawaCohomology:L3/iwasawa-twist: Twisting Iwasawa cohomology

theorem contract: For the cyclotomic Γ = Gal(ℚ(ζ_{p^∞})/ℚ) with compatible roots (ζ_{p^n}) fixed, κ the cyclotomic character and k ∈ ℤ, cup product with the norm-compatible system (ζ_{p^n}^{⊗k})_n gives a ℤ_p-linear isomorphism φ_k : H^q_Iw(T) ≅ H^q_Iw(T(k)) with φ_k(λx) = Tw_k(λ)φ_k(x), where Tw_k is the ring automorphism of Λ = 𝒪⟦Γ⟧ with Tw_k(σ) = κ(σ)^{−k}σ. Composing with the specialisation of iwasawa-descent at the augmentation gives H¹_Iw(V) → H¹(ℤ[1/p], T(k)) ⊗ ℚ, which factors through the localisation at ker(Λ → 𝒪, σ_c ↦ c^{−k}).

Hypotheses: Cyclotomic tower; compatible roots of unity fixed (they trivialise ℤ_p(1) over the tower).

Prerequisites: SelmerIwasawaCohomology:L3/iwasawa-cohomology, SelmerIwasawaCohomology:L3/iwasawa-descent, ArithmeticGaloisDuality:R02.2/hochschild-serre-spectral-sequence, PadicMeasuresIwasawaAlgebras:L1

Source: BURUNGALE-TIAN-26, §3, (3.2), p. 6 (arXiv v2)

#### SelmerIwasawaCohomology:L3/infinite-selmer-complex: Iwasawa Selmer complex and completed action

construction contract: For Γ=Gal(F∞/F)≅ℤ_p^d, Λ=O[[Γ]], define the infinite compact Selmer complex as Rlim_n RΓ_f(F_n,T;U_n), with corestriction, and the discrete complex as colim_n RΓ_f(F_n,A;U_n), with restriction. Choose actual local maps, transition maps and their coherent comparison homotopies. Shapiro identifies the compact complex with the finite-S fibre for T_Λ=Λ⊗̂_O T on which g acts by [g]^−1⊗g. At a place v use the induced semilocal Λ-module from its decomposition subgroup Γ_v. The completed action is continuous, and the compact/discrete actions are paired contragrediently. F∞,v is never treated as a locally compact local field.

Hypotheses: Finite S containing p, infinite places and coefficient ramification; finitely generated compatible local coefficient complexes. Nekovář condition (U): added non-p places are unramified in the tower, or their ramification errors are retained.

Prerequisites: SelmerIwasawaCohomology:L2/selmer-complex, SelmerIwasawaCohomology:L3/iwasawa-shapiro, SelmerIwasawaCohomology:L3/semilocal-cohomology, PadicMeasuresIwasawaAlgebras:L1

Source: NEKOVAR-SC, §8.5.6, p. 220; §§8.6 and 8.8, pp. 221–237

API TauCeti.Selmer.iwasawaSelmerComplex (constructor): The corestriction derived inverse limit of the finite-level fibres.

API TauCeti.Selmer.discreteInfiniteSelmerComplex (constructor): The restriction colimit of the discrete finite-level fibres.

API TauCeti.Selmer.iwasawaSelmerComplex_shapiro (equivalence): Equivalent to the induced-coefficient finite-S fibre.

API TauCeti.Selmer.iwasawaSelmerComplex_action (instance): Continuous Λ-action with inverse action on the induced factor.

API TauCeti.Selmer.iwasawaSelmerComplex_semilocal (compatibility): Induction from Γ_v represents the sum over all places above v.

Example TauCeti.Selmer.Tests.iw_fibre_degree_zero (degenerate): A constant tower of relaxed conditions reduces to global Iwasawa cohomology.

Example TauCeti.Selmer.Tests.iw_inverse_action (non-example): Under a generator γ, evaluation on an induced function translates by γ^−1; direct γ-translation gives the wrong Shapiro map.

Example TauCeti.Selmer.Tests.iw_semilocal_split (non-example): If Γ_v=1, the finite-level local sum has [Γ:Γ_n] summands; one local factor is incorrect.

#### SelmerIwasawaCohomology:L3/derived-control: Derived specialization and control spectral sequence

theorem contract: For compatible induced local conditions with derived base-change equivalences, RΓ_f,Iw⊗^L_Λ Λ_n≃RΓ_f(F_n,T), where Λ_n=O[Γ/Γ_n]. The spectral sequence Tor_i^Λ(H^j_f,Iw,Λ_n)⇒H^(j−i)_f(F_n,T) has its natural edge maps. For Γ=ℤ_p and Λ_n=Λ/(γ^(p^n)−1), this yields 0→H^j_f,Iw/(γ^(p^n)−1)→H^j_f(F_n,T)→H^(j+1)_f,Iw[γ^(p^n)−1]→0. Local conditions without derived base change contribute the correction complex of correction-complex. No unconditional specialization isomorphism is asserted.

Hypotheses: Bounded cohomology and supplier derived-completion/base-change hypotheses. Local maps, not only their H¹ images, must commute with derived specialization.

Prerequisites: SelmerIwasawaCohomology:L3/infinite-selmer-complex, ArithmeticGaloisDuality:R02.1/cochains-inverse-limit, PadicMeasuresIwasawaAlgebras:L5

Source: NEKOVAR-SC, §8.10, especially §§8.10.1–8.10.5, pp. 249–251

Example TauCeti.Selmer.Tests.control_torsion (non-example): A complex with only H²=Λ/(γ−1) contributes O to finite-level H¹.

Example TauCeti.Selmer.Tests.control_flat (compatibility): A complex with only a Λ-free H¹ specializes without a Tor error.

Example TauCeti.Selmer.Tests.control_rank_two (non-example): For Γ=ℤ_p², higher Tor can survive; a universal short exact sequence is false.

#### SelmerIwasawaCohomology:L3/kernel-control: Classical restriction control with invariants and localization errors

theorem contract: Put H_n=H¹(G_(F_n,S),A), H∞=H¹(G_(F∞,S),A), and Q_n=⊕H¹(F_n,w,A)/L_n,w. Inflation–restriction gives ker(H_n→H∞^Γ_n)=H¹(Γ_n,A^G_(F∞,S)); its cokernel is the appropriate subgroup of H²(Γ_n,A^G_(F∞,S)). Compute local restriction by the same sequence for Γ_n,w and by the maps of inertia quotients. Let I_n=im(H_n→Q_n) and I∞,n=im(H∞^Γ_n→Q∞^Γ_n). Snake on 0→Sel→H→I→0 gives 0→ker SelRes→ker HRes→ker(I_n→I∞,n)→coker SelRes→coker HRes→coker(I_n→I∞,n)→0. Identify I-errors through the Q-errors and localization cokernels C=Q/I. Only when localization is onto at both levels may I be replaced by Q. Thus the control criterion is vanishing or boundedness of these explicitly computed invariant, inertia and C-errors. The bottom short exact row uses I∞,n; it is generally smaller than (im(H∞→Q∞))^Γ_n. Its comparison with that larger group has the H¹(Γ_n,Sel∞) error.

Hypotheses: A is discrete p-primary; local conditions are restriction-compatible; use invariants of the exact infinite-level sequence, including H¹(Γ_n,Sel∞) when comparing its image with I∞^Γ_n. The superscript invariants does not preserve right exactness.

Prerequisites: SelmerIwasawaCohomology:L2/selmer-functoriality, SelmerIwasawaCohomology:L2/condition-change-triangle, ArithmeticGaloisDuality:R02.2/compact-five-term, SelmerIwasawaCohomology:L3/derived-control

Source: NEKOVAR-SC, §§8.10.1–8.10.5, pp. 249–251; RUBIN-ES, Appendix B §3, pp. 153–155

Example TauCeti.Selmer.Tests.control_zero_invariants (non-example): A^G∞=0 kills the global five-term kernel but does not by itself kill every local-condition error.

Example TauCeti.Selmer.Tests.control_nononto_localization (non-example): If H=0 and Q≠0, localization is not onto and replacing I by Q in the snake sequence is invalid.

Example TauCeti.Selmer.Tests.control_exceptional (non-example): A trivial ordinary quotient at p can have a nonzero unramified control term even when generic specialization is exact.

#### SelmerIwasawaCohomology:L3/correction-complex: Local specialization correction complex

construction contract: For a specialization Λ→R and a specified local condition i:U^+→C_v,Iw with specialized finite-level condition i_R:U_R^+→C_v,R, define E_v(R)=Cone(U^+⊗^L_ΛR→U_R^+) using the actual comparison map. When ambient global/local cochains satisfy derived base change, the cone of RΓ_f,Iw⊗^L R→RΓ_f,R is ⊕E_v(R), with the orientation determined by the condition-change triangle. Its LES records all local correction groups. An exceptional eigenvalue or finite-slope condition is encoded by the provided local map; this node constructs no higher-tier (φ,Γ)-module regulator.

Hypotheses: A specified coherent specialization map on U^+ and ambient cochains; finite changed set.

Prerequisites: SelmerIwasawaCohomology:L2/condition-change-triangle, SelmerIwasawaCohomology:L3/derived-control

Source: NEKOVAR-SC, §6.1, pp. 135–137; §8.10, pp. 249–251

API TauCeti.Selmer.localSpecializationError (constructor): Cone of the local-condition specialization map.

API TauCeti.Selmer.localSpecializationError_acyclic_iff (characterisation): Acyclic iff the specified local comparison is a quasi-isomorphism.

API TauCeti.Selmer.selmerSpecialization_errorTriangle (structure): The fibre comparison has the direct sum of these errors as its cone.

API TauCeti.Selmer.localSpecializationError_map (functoriality): Coherent specialization maps induce maps of error triangles.

Example TauCeti.Selmer.Tests.specialization_error_identity (degenerate): Identity comparison has acyclic error.

Example TauCeti.Selmer.Tests.specialization_error_h0 (non-example): A failed degree-zero comparison contributes to the control LES even if local H¹ images agree.

Example TauCeti.Selmer.Tests.specialization_error_tor (non-example): Nonflat U^+ must be derived-tensored; ordinary tensor can delete a Tor correction.

#### SelmerIwasawaCohomology:L3/iwasawa-selmer-duality: Iwasawa duality with the involution and local errors

theorem contract: For perfect coefficient duals T and T^*(1), transport L1 duality to induced coefficients. For Γ≅ℤ_p^d and the regular local ring Λ=O[[Γ]], use coefficient duality with Λ placed in degree zero and obtain RΓ_f,Iw(T)→RHom_Λ(RΓ_f,Iw(T^*(1)),Λ)^ι[−3], where ι(γ)=γ^−1. Its cone is the sum of the induced local complement errors. With elementary coefficient complements at p and the precise unramified conditions elsewhere, calculate which errors vanish and which survive (including Tamagawa terms); derived duality is an equivalence only after those errors vanish. This is compatible with finite-level specialization, global degree-three duality and local degree-two pairings.

Hypotheses: Perfectness/dualizing coefficient hypotheses of Nekovář §8.9 and the imported AGD duality; tower condition (U). Modified real terms at p=2. A height-one disappearance of an error is weaker than its integral acyclicity. Here the compact dual T^*(1) means Hom_O(T,O)(1); it is distinct from Rubin’s discrete T^*=Hom_O(T,E/O)(1). Λ is the degree-zero coefficient dualizing module in this normalization; using an absolute dualizing complex shifted by dim Λ requires the compensating shift. The displayed shift is the arithmetic degree-three normalization.

Prerequisites: SelmerIwasawaCohomology:L1/derived-selmer-duality, SelmerIwasawaCohomology:L3/infinite-selmer-complex, SelmerIwasawaCohomology:L2/pontryagin-dual, PadicMeasuresIwasawaAlgebras:L5

Source: NEKOVAR-SC, §8.5.6, p. 220; §§8.9.6–8.9.7, pp. 240–244

Example TauCeti.Selmer.Tests.iw_duality_inverse (non-example): A γ-eigencharacter c is paired with c^−1, rather than c.

Example TauCeti.Selmer.Tests.iw_duality_tamagawa (non-example): A nontrivial local Tamagawa error prevents an integral quasi-isomorphism.

Example TauCeti.Selmer.Tests.iw_duality_height_one (non-example): A finite Λ-error disappears at height one but must remain in the integral triangle.

#### SelmerIwasawaCohomology:L3/iwasawa-finiteness-euler: Finite generation, amplitude and local Euler ranks

theorem contract: For the cyclotomic ℤ_p-extension, p odd, finite S and finite free T, global Iwasawa cohomology is finitely generated over Λ and concentrated in degrees one and two under the standard global H⁰-vanishing hypothesis; with real p=2 terms state the corrected amplitude. Its rank difference is rank_Λ H¹_Iw−rank_Λ H²_Iw=Σ_(v real) rank_O T^(c_v=−1)+Σ_(v complex) rank_O T. At a p-adic place K, rank_Λ H¹_Iw(K,T)=[K:ℚ_p]rank_O T and H²_Iw(K,T) is torsion. Global H² torsion is an additional weak-Leopoldt assertion. For arbitrary ℤ_p^d extensions the conclusion is finite generation/perfectness only with the supplier finite-resolution and local conditions, not a universal cyclotomic rank formula.

Hypotheses: Canonical compact cochains; cyclotomic tower for the displayed rank formulas. At p=2 use AGD modified compact support or invert 2.

Prerequisites: SelmerIwasawaCohomology:L3/iwasawa-shapiro, ArithmeticGaloisDuality:R02.4/global-finiteness, ArithmeticGaloisDuality:D7/compact-support-euler-characteristic, PadicMeasuresIwasawaAlgebras:L1

Source: KATO-04, Theorem 12.2, pp. 220–221; §13.8, pp. 227–229

#### SelmerIwasawaCohomology:L3/selmer-determinant: Determinant line and its height-one characteristic divisor

construction contract: For a perfect Λ-Selmer complex C, define its arithmetic determinant line 𝔇(C)=(det_Λ C)⁻¹ using the PMIA L5 determinant functor. If C⊗Frac(Λ) is acyclic, the canonical fraction-field trivialization identifies 𝔇(C) with a fractional invertible lattice whose height-one valuation is Σ_i(−1)^i length_(Λ_𝔭) H^i(C)_𝔭. Thus for cohomology only in degrees one and two its divisor is char H²/char H¹. The inverse determinant is essential for this sign convention. If generic cohomology has positive rank, determinant is a line without a canonical scalar trivialization; a regulator/leading-term trivialization is separate input. Base change and duality induce the determinant comparisons only for the corresponding perfect derived complexes.

Hypotheses: Λ Noetherian normal domain, C perfect, torsion cohomology for the scalar divisor statement. For nonregular multi-variable coefficients request the precise perfectness rather than infer it from finite generation.

Prerequisites: SelmerIwasawaCohomology:L3/infinite-selmer-complex, PadicMeasuresIwasawaAlgebras:L5, PadicMeasuresIwasawaAlgebras:L4/characteristic-ideal

Source: NEKOVAR-SC, §8.9, pp. 238–244; §8.10, pp. 249–251; KATO-04, §12.2, pp. 220–221

API TauCeti.Selmer.selmerDeterminant (constructor): The arithmetic line (det_Λ C)⁻¹ of a perfect Selmer complex, with the stated cohomological sign.

API TauCeti.Selmer.selmerDeterminant_triangle (compatibility): Exact triangles give multiplicative line equivalences.

API TauCeti.Selmer.selmerDeterminant_torsionDivisor (characterisation): The signed height-one cohomology lengths give the divisor.

API TauCeti.Selmer.selmerDeterminant_baseChange (functoriality): Derived base change gives the corresponding line equivalence.

Example TauCeti.Selmer.Tests.det_acyclic (degenerate): An acyclic perfect complex has the unit line and zero divisor.

Example TauCeti.Selmer.Tests.det_two_degrees (non-example): For H¹=Λ/(a), H²=Λ/(b), the divisor is (b)/(a), so reversing the cohomological sign fails.

Example TauCeti.Selmer.Tests.det_positive_rank (non-example): A free nonzero H¹ prevents a canonical torsion scalar trivialization.

#### SelmerIwasawaCohomology:L3/etale-iwasawa-comparison: Étale j-star and continuous cohomology comparison

comparison contract: Put X=Spec O_F[1/p], U=X minus the finite non-p ramification set, j:U→X, and let T be a lisse lattice on U. Import the arithmetic K(π,1) identification RΓ_et(U,T)≅RΓ_cont(G_(F,S),T), with integral coefficients defined by derived inverse limits. At finite coefficient level the Leray edge sequence is 0→H¹_et(X,j_*T)→H¹(G_(F,S),T)→⊕_(v∈S,v∤p) H¹(I_v,T)^(Fr_v=1); the lattice version retains the coefficient-limit H⁰ corrections unless their Mittag–Leffler hypotheses hold. Thus j_* imposes unramified H¹ at the omitted non-p primes and no finite condition at p. In a cyclotomic norm tower whose decomposition subgroup at every such non-p prime is infinite, universal norm classes are unramified there, and inverse-corestriction H¹_et(X_n,j_*T) identifies with H¹_Iw(G_(F,S),T), under these coefficient-limit hypotheses. This assertion is in degree one: higher R^q j_* inertia terms obstruct a general j_*/Rj_* complex equivalence.

Hypotheses: Finite S and finite ramification of T. Derived inverse-limit comparison and the actual residue extension at each omitted prime. Import the arithmetic K(π,1) comparison for p-primary lisse coefficients on Spec O_F[1/S] with p inverted (and the modified real convention), not merely the equivalence of finite étale covers with π₁-sets.

Prerequisites: SelmerIwasawaCohomology:L3/iwasawa-shapiro, ArithmeticGaloisDuality:R02.1/carrier-comparison, SchemeAndStackFoundations:SF.6, SelmerIwasawaCohomology:L3/universal-norms-unramified

Source: KATO-04, §§8.2 and 8.5, pp. 180–184; §12.2, pp. 220–221; RUBIN-ES, Appendix B, Proposition 5.1, printed p. 157 (PDF p. 167)

#### SelmerIwasawaCohomology:L3/rational-specialization: Lattice independence, twists and degree-one specialization

theorem contract: The rationalized Iwasawa complex and its rational specializations depend only on V: finite lattice quotients disappear after inverting p. A Tate twist by k is semilinear for Tw_k(γ)=χ_cyc(γ)^−kγ on the Λ factor; specialization for V(k) is at the kernel of γ↦χ_cyc(γ)^−k with the convention of iwasawa-twist. For Γ=ℤ_p, the degree-one specialization sequence retains H²_Iw[𝔮]. If the specialized H² vanishes and the localized complex has amplitude ≤2, derived control and Nakayama kill H²_Iw,𝔮 and hence that Tor correction. The finite-level H² calculation itself retains H³_Iw[𝔮] until the amplitude theorem removes it.

Hypotheses: Rational coefficients at specialization; a specified character convention; the vanishing assertion and amplitude are separate inputs.

Prerequisites: SelmerIwasawaCohomology:L2/lattice-change-cone, SelmerIwasawaCohomology:L3/iwasawa-twist, SelmerIwasawaCohomology:L3/derived-control, SelmerIwasawaCohomology:L3/iwasawa-finiteness-euler

Source: BURUNGALE-TIAN-26, Version 2, §2, p. 4; §3, pp. 5–6, equation (3.1)

#### SelmerIwasawaCohomology:L3/local-cofree-euler: Local cofreedom and an away-p Euler factor

theorem contract: In the CGLS anticyclotomic setting K imaginary quadratic, p odd split, Γ≅ℤ_p and Λ=ℤ_p[[Γ]], let M_θ=ℤ_p(θ)⊗Λ^∨ with action θ⊗Ψ^−1. At w∤p with finite-index decomposition subgroup, H¹(K_w,M_θ)^∨ is torsion with characteristic ideal generated by P_w(ℓ^−1γ_w), P_w(X)=det(1−Fr_w X|V_θ^I_w), using arithmetic Frobenius γ_w; its μ-invariant is zero. At w|p, θ|G_w≠1,ω implies H⁰=H²=0, restriction H¹→H¹(I_w)^G_w/I_w is an isomorphism, and H¹ is Λ-cofree rank one. For an elliptic curve satisfying Lemma 1.3.1’s good-reduction and E(K_w)[p]=0 hypotheses, the corresponding local H¹ is cofree rank two. These are the stated cases, not every representation at every place.

Hypotheses: CGLS §1.1’s finite character and anticyclotomic tower. The mod-p trivial and cyclotomic characters are explicitly excluded in the at-p character case. θ is the Teichmüller lift of a character G_K→𝔽_pˣ with conductor supported on split primes, as in CGLS §1.1. For the non-p formula w lies above a rational split prime ℓ; then Norm(w)=ℓ and its decomposition subgroup has finite index. The elliptic specialization uses E/ℚ with the stated good ordinary p-reduction.

Prerequisites: SelmerIwasawaCohomology:L3/semilocal-cohomology, ArithmeticGaloisDuality:R02.4/poitou-tate, PadicMeasuresIwasawaAlgebras:L4/characteristic-ideal

Source: CGLS-22, §1.1, Lemma 1.1.2 and Proposition 1.1.3, pp. 6–7; Lemma 1.3.1, p. 10

Example TauCeti.Selmer.Tests.local_cofree_trivial (non-example): The trivial residual character can have H⁰ and is excluded.

Example TauCeti.Selmer.Tests.local_cofree_cyclotomic (non-example): The cyclotomic residual character can have dual H⁰ and is excluded.

Example TauCeti.Selmer.Tests.local_euler_frobenius (non-example): Replacing arithmetic γ_w by its inverse without changing conventions changes the displayed Euler polynomial.

#### SelmerIwasawaCohomology:L3/greenberg-structure-hypotheses: Checkable hypotheses for ordinary Selmer structure

definition contract: For Λ=O[[T]], D=T₀⊗_ΛΛ^∨ with T₀ finite free and D* = Hom(D,μ_(p∞)), record RFX (T₀ reflexive), LOC2_v (D*/H⁰(F_v,D*) reflexive), LOC1_η (H⁰(F_η,D*)=0 at one finite η), LEO (ker[H²(global,D)→⊕H²(local,D)] Λ-cotorsion), CRK (corank H¹global=corank Sel+corank Q), and almost divisibility of the chosen local conditions (multiplication by each height-one parameter is onto except for finitely many height-one primes). Record additionally Greenberg’s alternative (a), (b) or (c): residual exclusion of μ_p as subquotient; cofree D with exclusion as quotient; or a finite η with dual H⁰ zero and Q_η divisible/coreflexive as required by the theorem. These are explicit propositions on modules and maps, not inferred from residual irreducibility alone.

Hypotheses: Finite S; p odd for the applications here; finitely generated compact duals. In dimension two, pseudo-null finitely generated modules are finite O-torsion. Higher-dimensional pseudo-null is not synonymous with finite. The residual module in alternatives (a),(b) is D[𝔪_Λ] as a G_(F,S)-module, and μ_p has its mod-p cyclotomic action. In alternative (c), η is finite and H⁰(F_η,D*)=0; the localization-surjectivity theorem requires divisible Q_η, while the no-pseudo-null theorem requires coreflexive Q_η.

Prerequisites: SelmerIwasawaCohomology:L2/pontryagin-dual, SelmerIwasawaCohomology:L2/corank, PadicMeasuresIwasawaAlgebras:L4

Source: GREENBERG-STRUCTURE, §2, pp. 5–11; §4.1, pp. 19–20

API TauCeti.Selmer.GreenbergStructureHypotheses (constructor): The listed module and localization predicates, with the chosen alternative.

API TauCeti.Selmer.almostDivisible_dual (characterisation): Equivalent to the compact dual having no nonzero pseudo-null submodule.

API TauCeti.Selmer.greenbergHypotheses_imprimitive (compatibility): Tracks exactly which LOC1 and local divisibility hypotheses are supplied by relaxing a finite place.

Example TauCeti.Selmer.Tests.greenberg_zero (degenerate): The zero representation satisfies the zero-rank, local and localization predicates.

Example TauCeti.Selmer.Tests.greenberg_residual_not_leo (non-example): A residual irreducibility proof supplies the residual exclusion for rank at least two, but supplies neither LEO nor CRK.

Example TauCeti.Selmer.Tests.greenberg_dimension (non-example): Over O[[T₁,T₂]], Λ/(T₁,T₂) is pseudo-null and can be infinite; the finite equivalence must be restricted to dimension two.

#### SelmerIwasawaCohomology:L3/localization-surjective: Surjectivity of global ordinary localization

theorem contract: Under Greenberg Proposition 2.6.3’s hypotheses D Λ-divisible, LEO, CRK and one of alternatives (a), (b), (c) recorded above (with Q_η divisible in (c)), the map H¹(G_(F,S),D)→Q=⊕H¹(F_v,D)/L_v is onto. Thus primitive/imprimitive change of conditions has the asserted right exact local-quotient map only under these hypotheses. For ordinary elliptic curves in the cyclotomic tower, p odd, good ordinary reduction, E(F)[p]=0 and cotorsion Selmer imply the hypotheses by §4.4’s local/Euler computation. For general ordinary representations these hypotheses remain explicit.

Hypotheses: The exact Proposition 2.6.3 alternative is part of the input. Residual irreducibility of rank at least two rules out a μ_p subquotient but does not replace LEO or CRK.

Prerequisites: SelmerIwasawaCohomology:L3/greenberg-structure-hypotheses, SelmerIwasawaCohomology:L2/selmer-structure-poitou-tate, SelmerIwasawaCohomology:L3/iwasawa-finiteness-euler

Source: GREENBERG-STRUCTURE, Proposition 2.6.3, p. 11; §4.4, pp. 24–25

Example TauCeti.Selmer.Tests.localization_cotorsion_not_zero (non-example): A cotorsion localization cokernel alone need not vanish.

Example TauCeti.Selmer.Tests.localization_imprimitive (compatibility): After relaxing Σ, the surjective map gives Sel^Σ/Sel≅⊕_(v∈Σ)Q_v.

Example TauCeti.Selmer.Tests.localization_residual_rank_one (non-example): An irreducible residual rank-one cyclotomic character contains μ_p and does not satisfy alternative (a).

#### SelmerIwasawaCohomology:L3/selmer-no-pseudonull: No pseudo-null submodule of the ordinary Selmer dual

theorem contract: Assume RFX, LEO, LOC2 at every place, LOC1 at one finite place, local-condition almost divisibility, CRK and one of Greenberg Proposition 4.1.1’s alternatives, using coreflexive Q_η in its third alternative. Then Sel is almost divisible, and X=Sel^∨ has no nonzero pseudo-null Λ-submodule. For Λ=O[[T]] this means no nonzero finite submodule. Proposition 4.2.1 supplies the imprimitive version when the relaxed set contains a suitable finite LOC1 place. The cyclotomic ordinary elliptic case of §4.4 follows under p odd, E(F)[p]=0, good ordinary p-reduction and cotorsion Selmer. CGLS Corollary 1.4.3 concerns its stated imprimitive anticyclotomic Selmer dual and is not a universal primitive assertion.

Hypotheses: Finite generated X; retain all Greenberg local/global hypotheses and distinguish the primitive and imprimitive conditions.

Prerequisites: SelmerIwasawaCohomology:L3/greenberg-structure-hypotheses, SelmerIwasawaCohomology:L3/localization-surjective, PadicMeasuresIwasawaAlgebras:L4

Source: GREENBERG-STRUCTURE, Propositions 4.1.1 and 4.2.1, pp. 19–21; §§4.3–4.4, pp. 21–25

Example TauCeti.Selmer.Tests.selmer_finite_counterexample (non-example): The module Λ/(p,T) is torsion but has a nonzero finite submodule; torsion does not suffice.

Example TauCeti.Selmer.Tests.selmer_primitive_distinction (non-example): The imprimitive theorem cannot be transferred to a primitive dual without controlling its local quotient.

Example TauCeti.Selmer.Tests.selmer_elliptic_cyclotomic (compatibility): The stated elliptic cyclotomic hypotheses imply the no-finite-submodule conclusion.

#### SelmerIwasawaCohomology:L3/selmer-fitting-characteristic: Fitting equals characteristic under the structure criterion

theorem contract: Let Λ=O[[T]] with O a complete DVR and X a finitely generated torsion Λ-module with no nonzero finite submodule. Then depth_Λ X≥1 and pd_Λ X≤1. A finite free resolution 0→Λ^r→Λ^r→X→0 gives Fitt_Λ X=(det A)=char_Λ X as ideals. Apply this to the ordinary Selmer dual only after selmer-no-pseudonull and cotorsion establish the hypotheses. For modules with finite submodules or higher-dimensional Λ, equality is not asserted. This criterion is supplied to ModularIwasawaMainConjectures L1 and RankZeroOneBSD BSD.6/BSD.6a/BSD.7a.

Hypotheses: Λ regular local of dimension two; X finitely generated torsion. The zero module uses the unit ideal convention.

Prerequisites: SelmerIwasawaCohomology:L3/selmer-no-pseudonull, PadicMeasuresIwasawaAlgebras:L6/quadratic-presentation, PadicMeasuresIwasawaAlgebras:L6/fitting-quadratic, PadicMeasuresIwasawaAlgebras:L4/characteristic-ideal

Source: GREENBERG-STRUCTURE, §1, pp. 1–4; Theorem 4.1.1, pp. 19–20 (arithmetic no-pseudo-null input)

Example TauCeti.Selmer.Tests.fitting_cyclic (compatibility): For X=Λ/(f), f nonzero, both ideals equal (f).

Example TauCeti.Selmer.Tests.fitting_finite (non-example): For X=Λ/(p,T), char X=Λ but Fitt X=(p,T); the no-finite-submodule hypothesis is necessary.

Example TauCeti.Selmer.Tests.fitting_zero (degenerate): For X=0, both ideals are Λ.

### Layer L4

#### SelmerIwasawaCohomology:L4/local-units-iwasawa-cohomology: Local units and the cyclotomic Euler system in Iwasawa cohomology

lemma contract: For K_n=ℚ_p(μ_(p^n)), the completion K̂_n^×≃H¹(K_n,ℤ_p(1)) intertwines norms with corestriction and gives lim_n K̂_n^×≃H¹_Iw(ℚ_p,ℤ_p(1)). Principal-unit inclusions give U∞→H¹_Iw. Every specified norm-compatible unit sequence maps to its compatible local Kummer sequence. For an external cyclotomic-unit Euler system, localization of its norm identities must retain the Frobenius operator on the field/class, rather than replace it by the scalar coefficient action. This is the cohomological reinterpretation of RJW §10.5; constructing those Euler-system classes is an output consumer’s task.

Hypotheses: p odd; D ≥ 1 prime to p; completions as in SelmerIwasawaCohomology L0.

Prerequisites: SelmerIwasawaCohomology:L0/padic-kummer-identification, SelmerIwasawaCohomology:L0/local-completion, SelmerIwasawaCohomology:L3/iwasawa-cohomology

Source: RJW-PADIC-L, §10.5, (10.5)–(10.8) and Definition 10.16, pp. 52–53 (arXiv v2); published pp. 170–172

#### SelmerIwasawaCohomology:L4/tate-twist-greenberg-selmer: Greenberg Selmer groups of Tate twists

theorem contract: Give V_n = ℚ_p(n) the filtration Fil^iℚ_p(n) = ℚ_p(n) for i ≤ n and 0 for i > n. Then L^Gr_{v_p} = H^1(K_∞^+, W_n) for n ≥ 1 and L^Gr_{v_p} = H^1_ur(K_∞^+, W_n) for n ≤ 0. Inflation–restriction gives H^1(F, W_n) = Hom_{cts,{±1}}(G_{F_∞}, W_n), and hence H^1_{L^Gr}(F, W_n) = Hom_cts(X_∞^{c=(−1)^n}, W_n) for n ≥ 1 and Hom_cts(Y_∞^{c=(−1)^n}, W_n) for n ≤ 0. Since (X_∞)^{c=1} ≅ X_∞^+, for even n > 0, H^1_{L^Gr}(F, W_n) = Hom_cts(X_∞^+, W_n), whose Pontryagin dual is X_∞^+(−n), the module X_∞^+ with its Λ(Γ^+)-action twisted by χ^{−n} (RJW §13.5.2, Example 13.22).

Hypotheses: p odd; F_∞ = ℚ(μ_{p^∞}), F = F_∞^+ = ℚ(μ_{p^∞})^+, Gal(F_∞/F) = {1, c}; K_∞^+ = ⋃_n ℚ_p(μ_{p^n})^+ denotes the local tower, with cohomology defined by finite-level restriction colimits; χ is the cyclotomic character, T_n = ℤ_p(n), V_n = ℚ_p(n), W_n = (ℚ_p/ℤ_p)(n); X_∞ = Gal(M_∞/F_∞) and Y_∞ = Gal(L_∞/F_∞) for the maximal abelian pro-p extensions unramified outside p and everywhere unramified, with X_∞^+ = Gal(M_∞^+/F_∞^+) (arithmetic-tower-data).

Prerequisites: SelmerIwasawaCohomology:L2/greenberg-condition, SelmerIwasawaCohomology:L2/unramified-condition, SelmerIwasawaCohomology:L2/galois-selmer-group, SelmerIwasawaCohomology:L2/pontryagin-dual, SelmerIwasawaCohomology:L2/selmer-kernel, SelmerIwasawaCohomology:L4/arithmetic-tower-data

Source: RJW-PADIC-L, §13.5.2, pp. 70–71 (arXiv v2); published pp. 196–197

#### SelmerIwasawaCohomology:L4/criticality: The Gamma factor, r_V and criticality

definition contract: For explicit archimedean realization data attached to L(V,s), define r_V=gammaPoleOrder(V,1) from hodge-gamma-factor. Define Greenberg criticality by r_V=r_(V*(1))=0, using the Tate-dual Hodge types and real signs from archimedean-realization. For ℚ_p(n), r_V is one exactly for positive odd n, and the dual is ℚ_p(1−n); consequently the critical integers are positive even n or negative odd n. At n=0 the dual factor has a pole, so n=0 is not critical. Criticality is a computed predicate, not a supplied Boolean or Gamma factor.

Hypotheses: A finite-dimensional Hodge realization and its comparison to the chosen L-function convention, together with the compatible Tate-dual realization.

Prerequisites: SelmerIwasawaCohomology:L4/hodge-gamma-factor, SelmerIwasawaCohomology:L4/archimedean-realization

Source: RJW-PADIC-L, §13.5.3, pp. 71–72 (arXiv v2), with Remark 13.23; published pp. 197–198

API TauCeti.Selmer.gammaFactor (data): L_∞(V,s) computed from the explicit Hodge/sign realization by hodge-gamma-factor, in the chosen L-function convention.

API TauCeti.Selmer.poleOrderAtOne (constructor): r_V, the order of the pole of L_∞(V, s) at s = 1.

API TauCeti.Selmer.tateDual (constructor): V^∨ = Hom_cts(V, ℚ_p(1)).

API TauCeti.Selmer.IsGreenbergCritical (constructor): r_V = 0 and r_{V^∨} = 0.

API TauCeti.Selmer.poleOrderAtOne_tateTwist (simp): r_{ℚ_p(n)} = 1 if n is odd and positive, 0 otherwise.

API TauCeti.Selmer.isGreenbergCritical_tateTwist_iff (characterisation): ℚ_p(n) is critical iff n is even and positive or odd and negative.

Example twist_two (computation): n = 2: r_V = r_{V^∨} = 0, so ℚ_p(2) is critical.

Example twist_zero (non-example): n = 0: r_{ℚ_p(1)} = 1, so ℚ_p is not critical, although Theorem 13.8 is its main conjecture (Remark 13.23).

Example twist_one (non-example): n = 1: r_{ℚ_p(1)} = 1 (the pole of Γ(s/2 − 1/2) at s = 1).

Example twist_minus_one (computation): n = −1: critical (odd and negative).

Example parity_table (computation): For −6 ≤ n ≤ 6, criticality agrees with the parity rule (suggested file).

#### SelmerIwasawaCohomology:L4/greenberg-main-conjecture: The Iwasawa–Greenberg main conjecture (as a proposition)

definition contract: For a p-ordinary G_ℚ-representation V with saturated G_{ℚ_p}-stable filtration, stable global lattice T and A=V/T, explicit archimedean realization and a specified analytic p-adic L-function L_p(V) in Frac Λ(Γ^+), state Greenberg’s proposition: corank_Λ Sel_Gr(F∞^+,A)=r_V; and, if V is critical, its torsion dual has characteristic ideal (L_p(V)). If L_p(V) is only a fraction, equality is an equality of fractional ideals with the integral characteristic ideal, and hence asserts integrality of that ideal. The datum carries the normalization/interpolation hypothesis appropriate to V; no general existence theorem is asserted. Positive corank leads to a determinant/leading-term proposition with a regulator trivialization, not this rank-zero characteristic-ideal equation.

Hypotheses: V p-ordinary at p (Greenberg filtration, stable under G_{ℚ_p}; see E2); L_p(V) is supplied data.

Prerequisites: SelmerIwasawaCohomology:L2/greenberg-condition, SelmerIwasawaCohomology:L2/galois-selmer-group, SelmerIwasawaCohomology:L2/corank, SelmerIwasawaCohomology:L2/pontryagin-dual, SelmerIwasawaCohomology:L4/criticality, PadicMeasuresIwasawaAlgebras:L4/characteristic-ideal, PadicMeasuresIwasawaAlgebras:L4/character-decomposition

Source: RJW-PADIC-L, §13.5.3, Conjecture 13.21, p. 71 (arXiv v2); published p. 197

API TauCeti.Selmer.PadicLFunctionDatum (structure): An element L_p(V) of Frac Λ(Γ^+), recorded as data with its conjectural interpolation.

API TauCeti.Selmer.GreenbergCorankConjecture (constructor): Proposition (i): corank_{Λ(Γ^+)} H^1_{L^Gr}(F, W) = r_V.

API TauCeti.Selmer.GreenbergCharIdealConjecture (constructor): Proposition (ii): r_V = r_{V^∨} = 0 → char(H^1_{L^Gr}(F, W)^∨) = (L_p(V)).

API TauCeti.Selmer.GreenbergMainConjecture (constructor): The conjunction of (i) and (ii).

API TauCeti.Selmer.greenbergCharIdealConjecture_of_not_critical (relation): (ii) holds vacuously when V is not critical.

Example even_twist (computation): V = ℚ_p(n), n even > 0: (ii) is the twisted Iwasawa main conjecture (greenberg-conjecture-tate-twists).

Example trivial_rep (non-example): V = ℚ_p: r_{V^∨} = 1, so (ii) says nothing, although Theorem 13.8 is proved (Remark 13.23).

Example not_a_theorem (non-example): At the torsion ideal-comparison interface over Λ=O[[T]], X=Λ/(f) with f≠0 has characteristic ideal (f). The predicate with supplied element f is true, whereas the predicate with pf is false, since p is a nonunit. A unit multiple of f preserves the predicate. Thus supplying an element does not make the ideal assertion automatic.

Example lattice_independence (non-example): Changing the lattice preserves rationalized Iwasawa cohomology and corank. Its integral finite-coefficient tower errors need not be finite Λ-modules; a Λ/(p) error changes a height-one characteristic divisor. Do not assert integral characteristic-ideal independence without a proved error cancellation.

#### SelmerIwasawaCohomology:L4/greenberg-conjecture-tate-twists: Equivalence of the critical Tate-twist main-conjecture propositions

theorem contract: For n positive even, the Tate Selmer dictionary identifies its compact dual with X∞^+(−n). The specified analytic element is the corresponding nth twist of Kubota–Leopoldt. By the characteristic-ideal twist automorphism, Greenberg’s rank-zero ideal proposition for ℚ_p(n) is equivalent to the cyclotomic main-conjecture proposition char X∞^+=(the normalized zeta element). This node proves the equivalence of propositions, not the cyclotomic main-conjecture theorem. Its corank assertion is equivalent to torsion of X∞^+. The n=0 case remains excluded by criticality of the Tate dual.

Hypotheses: p odd; F_∞ = ℚ(μ_{p^∞}), F = F_∞^+ = ℚ(μ_{p^∞})^+, Gal(F_∞/F) = {1, c}; K_∞^+ denotes the finite-level local tower; χ is the cyclotomic character, T_n = ℤ_p(n), V_n = ℚ_p(n), W_n = (ℚ_p/ℤ_p)(n); X_∞ = Gal(M_∞/F_∞) and Y_∞ = Gal(L_∞/F_∞) for the maximal abelian pro-p extensions unramified outside p and everywhere unramified, with X_∞^+ = Gal(M_∞^+/F_∞^+) (arithmetic-tower-data).

Prerequisites: SelmerIwasawaCohomology:L4/tate-twist-greenberg-selmer, SelmerIwasawaCohomology:L4/criticality, SelmerIwasawaCohomology:L4/greenberg-main-conjecture, PadicMeasuresIwasawaAlgebras:L4/characteristic-ideal, PadicMeasuresIwasawaAlgebras:L4/characteristic-ideal-api-7

Source: RJW-PADIC-L, §13.5.3, Example 13.22 and Remark 13.23, pp. 71–72 (arXiv v2); published pp. 197–198

#### SelmerIwasawaCohomology:L4/bloch-kato-condition: The Bloch–Kato local condition on T and W

construction contract: For finite K/ℚ_p define H¹_f(K,V)=ker[H¹(K,V)→H¹(K,V⊗B_cris)] on the canonical continuous cochain carrier, with the period topology. Define the T-condition by inverse image and the A=V/T condition by image. Away from p use the unramified rational condition and its propagated lattice/discrete conditions; the raw unramified condition on a finite quotient may differ. Give coefficient, restriction and duality compatibility. For de Rham V, the fundamental sequences give the exponential/finiteness exact fragments; for crystalline V, 0→H⁰(K,V)→D_cris(V)→D_cris(V)⊕D_dR(V)/Fil⁰→H¹_f(K,V)→0, with x↦((1−φ)x,x mod Fil⁰). Thus dim H¹_f=dim(D_dR/Fil⁰)+dim H⁰. Values on ℚ_p and ℚ_p(1) are respectively unramified classes and Kummer completed-unit classes.

Hypotheses: Finite K/ℚ_p and finite-dimensional continuous V with stable lattice T; finite-condition definition makes sense generally, the realization exact sequence is asserted with crystalline/de Rham hypotheses as specified.

Prerequisites: SelmerIwasawaCohomology:L4/period-realization, SelmerIwasawaCohomology:L4/period-fundamental-sequences, SelmerIwasawaCohomology:L2/condition-propagation, SelmerIwasawaCohomology:L0/padic-kummer-identification, ArithmeticGaloisDuality:R02.1

Source: BLOCH-KATO-90, §3.7, Proposition 3.8, Corollary 3.8.4 and Example 3.9, pp. 352–359; RJW-PADIC-L, Definition 13.19(2), preprint p. 70

API TauCeti.Selmer.blochKatoCondition (constructor): L^BK_v on W as the image of H^1_f(F_v, V).

API TauCeti.Selmer.blochKatoCondition_T (constructor): The preimage on T.

API TauCeti.Selmer.blochKatoStructure (constructor): The structure uses finite period conditions at p, unramified rational conditions away from p, and their image/preimage propagation on A/T. Raw finite-coefficient unramified conditions may differ.

API TauCeti.Selmer.blochKatoCondition_eq_propagate (compatibility): Agreement with L2/condition-propagation applied to H^1_f.

Example trivial_coefficients (computation): V = ℚ_p: H^1_f(F_v, ℚ_p) = H^1_ur(F_v, ℚ_p), so L^BK is the image of the unramified classes.

Example tate_twist_one (computation): V = ℚ_p(1): H^1_f(F_v, ℚ_p(1)) is the image of 𝒪_{F_v}^× ⊗ ℚ_p under Kummer (Bloch–Kato), so L^BK on W is the image of the units.

Example not_greenberg_in_general (non-example): The Bloch–Kato and Greenberg conditions differ by exceptional factors in general; only their coincidence in special cases is recorded (Remark 13.20).

#### SelmerIwasawaCohomology:L4/cp-period-comparison: The completed algebraic closure and existing de Rham period rings

comparison contract: Let C_p be the completion of an algebraic closure of ℚ_p with its unique extended valuation, with continuous G_K-action for each finite K/ℚ_p. Import its perfectoid tilt and A_inf=W(O_Cp^♭) and θ from PerfectoidSpaces P1. Identify Mathlib BDeRhamPlus/BDeRham with completion of A_inf[1/p] at ker θ and its localization. Give the canonical quotient B_dR^+→C_p, its complete DVR structure, and the canonical topology defined as the inverse limit of the p-adic quotient topologies (not the discrete topology on the quotients). For a compatible primitive roots-of-unity sequence ε, t=log[ε] is a uniformizer, g(t)=χ(g)t, Fil^i B_dR=t^i B_dR^+, and gr^i B_dR≃C_p(i).

Hypotheses: Finite K/ℚ_p; algebraic closure valuation/completion imported from the local-field supplier. The ring definition is already Mathlib baseline; only these comparisons and structures are new.

Prerequisites: PerfectoidSpaces:P1/fontaine-theta-and-primitive-kernel, PerfectoidSpaces:P1/fontaine-theta-comparison-with-mathlib, PerfectoidSpaces:P1/completed-colimit-of-perfectoid-tate-rings, PerfectoidSpaces:P3/finite-extensions-of-perfectoid-fields, tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-1-units-the-filtration-and-the-multiplicative-group

Source: FONTAINE-94, §§1.5.1–1.5.7, pp. 71–74

Example TauCeti.Selmer.Tests.period_residue (compatibility): B_dR^+/(t)≃C_p; replacing ker θ completion by p-adic completion fails.

Example TauCeti.Selmer.Tests.period_tate_action (non-example): g(t)=χ(g)t, so gr¹ is C_p(1), with positive Tate twist.

Example TauCeti.Selmer.Tests.period_topology (non-example): The G_K action is continuous for the canonical inverse-limit topology; the t-adic topology with discrete C_p quotients is not a substitute.

#### SelmerIwasawaCohomology:L4/crystalline-period-ring: Crystalline period ring and its structures

construction contract: Inside A_inf[1/p], form the subring generated by A_inf and ξ^n/n!, n≥1, for a primitive generator ξ of ker θ. Its separated p-adic completion is A_cris. Define B_cris^+=A_cris[1/p], B_cris=B_cris^+[1/t]. The ring is independent of ξ and the generator of ℤ_p(1); give the Galois action, Frobenius φ extending Witt Frobenius, φ(t)=pt, θ and the injective map B_cris→B_dR. For K with residue field k, K₀=Frac W(k) embeds, φ is σ-semilinear there and commutes with G_K. The induced filtration is the intersection with Fil^i B_dR. This is the minimal period construction owned here; no geometric crystalline comparison theorem is included.

Hypotheses: C_p, t, A_inf, θ from cp-period-comparison; canonical divided powers on (p). Mathlib already has divided powers and adic completion, but a universal divided-power envelope is not assumed available.

Prerequisites: SelmerIwasawaCohomology:L4/cp-period-comparison, PerfectoidSpaces:P1/witt-vectors-of-perfect-plus-ring

Source: FONTAINE-94, Theorem 2.2.1 and proof, pp. 76–77; §§2.3.1–2.3.4, pp. 78–79; §4.1, pp. 83–84; Theorem 4.2.4, p. 86, proof §4.3, pp. 87–89

API TauCeti.Selmer.aCris (constructor): Separated p-adic completion of the explicit PD-generated A_inf-subalgebra.

API TauCeti.Selmer.bCris (constructor): Invert p and the logarithmic Tate period.

API TauCeti.Selmer.aCris_pdUniversal (universal-property): Initial among p-adically complete PD-thickenings of O_Cp with compatible PD on (p).

API TauCeti.Selmer.bCris_toBDR (coercion): Injective Galois-compatible period map.

API TauCeti.Selmer.bCris_frobenius (structure): σ-semilinear Frobenius, commuting with G_K and sending t to pt.

API TauCeti.Selmer.bCris_generatorIndependent (equivalence): Changing ξ or a primitive Tate generator gives the canonical same ring.

Example TauCeti.Selmer.Tests.cris_tate (computation): The logarithmic period is nonzero and φ(t)=pt, not t.

Example TauCeti.Selmer.Tests.cris_theta (non-example): θ(t)=0 before t is inverted; θ cannot extend as a unital map B_cris→C_p.

Example TauCeti.Selmer.Tests.cris_embedding (compatibility): The period map to B_dR is injective and respects G_K; a free formal PD variable does not satisfy this comparison.

#### SelmerIwasawaCohomology:L4/period-fundamental-sequences: Fundamental period sequences with continuous sections

theorem contract: The following G_K-equivariant sequences are exact: 0→ℚ_p→B_cris^(φ=1)⊕B_dR^+→B_dR→0, with diagonal first map and difference last map; and 0→ℚ_p→B_cris⊕B_dR^+→B_cris⊕B_dR→0 with (x,y)↦((1−φ)x,x−y). Tensoring with a finite-dimensional continuous V gives the continuous-cohomology LES because the quotient maps admit continuous nonequivariant sections on the canonical topologies. Supply the boundary map D_dR(V)/Fil⁰→H¹(K,V) and its compatibility with coefficient/twist maps. A merely algebraically exact sequence is not enough for this LES.

Hypotheses: Canonical period topologies; finite-dimensional V; the AGD cochain interface extended to these topological coefficients with continuous-section exactness.

Prerequisites: SelmerIwasawaCohomology:L4/crystalline-period-ring, ArithmeticGaloisDuality:R02.1/continuous-section-long-exact, ArithmeticGaloisDuality:R02.1

Source: BLOCH-KATO-90, Proposition 1.17, Lemma 1.17.3 and Remark 1.18, pp. 340–341

#### SelmerIwasawaCohomology:L4/period-realization: Crystalline and de Rham realization data

definition contract: For a finite-dimensional continuous G_K-representation V define D_cris(V)=(V⊗B_cris)^G_K over K₀ and D_dR(V)=(V⊗B_dR)^G_K over K, with inherited Frobenius and filtration. Define crystalline and de Rham by equality of their dimension with dim_ℚp V, together with the canonical comparison-map isomorphism formulation. Crystalline implies de Rham. Hodge–Tate weight −1 is the convention for ℚ_p(1). This p-adic realization is independent of the archimedean Hodge carrier.

Hypotheses: Finite K/ℚ_p; continuous period tensor action and its invariants. Include the coefficient extension for E/ℚ_p by scalar restriction, not an unspecified Frobenius-linear E-action.

Prerequisites: SelmerIwasawaCohomology:L4/crystalline-period-ring, SelmerIwasawaCohomology:L4/period-fixed-fields

Source: NIZIOL-93, §2, pp. 748–751; BLOCH-KATO-90, §1, pp. 337–340

API TauCeti.Selmer.dCris (constructor): Period tensor invariants over K₀.

API TauCeti.Selmer.dDeRham (constructor): Period tensor invariants over K with filtration.

API TauCeti.Selmer.IsCrystalline (constructor): The canonical B_cris comparison map is an isomorphism.

API TauCeti.Selmer.IsDeRham (constructor): The canonical B_dR comparison map is an isomorphism.

API TauCeti.Selmer.crystalline_iff_dim (characterisation): Dimension equality characterizes crystalline representations.

API TauCeti.Selmer.crystalline_isDeRham (relation): Crystalline implies de Rham via the canonical embedding.

Example TauCeti.Selmer.Tests.realization_zero (degenerate): The zero representation is crystalline and de Rham with zero realization.

Example TauCeti.Selmer.Tests.realization_tate (computation): D_cris(ℚ_p(n)) is generated by t^−n, Frobenius p^−n and filtration jump −n.

Example TauCeti.Selmer.Tests.realization_scalar (non-example): For ramified K, D_cris is a K₀-space while D_dR is a K-space; identifying their scalar rings is wrong.

#### SelmerIwasawaCohomology:L4/period-fixed-fields: Period fixed fields and dimension bounds

theorem contract: For finite K/ℚ_p, (B_dR^+)^G_K=B_dR^G_K=K and B_cris^G_K=K₀. The invariant comparison maps for finite-dimensional V are injective, yielding dim_K D_dR(V)≤dim_ℚp V and dim_K₀ D_cris(V)≤dim_ℚp V. For B_dR use its filtration and the Tate C_p(i) cohomology calculation; for B_cris use the divided-power expansions and Frobenius structure. These are minimal period facts moved down to L4.

Hypotheses: Finite K; canonical topologies and embeddings. The fixed-field theorem for C_p and its twisted cohomology is a separate local-field supplier request.

Prerequisites: SelmerIwasawaCohomology:L4/cp-period-comparison, SelmerIwasawaCohomology:L4/crystalline-period-ring, tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-1-units-the-filtration-and-the-multiplicative-group

Source: FONTAINE-94, §1.5.7, p. 74; §4.1, pp. 83–84; FONTAINE-REP-94, Proposition 1.4.2, pp. 123–124; Proposition 5.1.2 and Lemma 5.1.3, pp. 155–156; NIZIOL-93, §2, pp. 749–750

#### SelmerIwasawaCohomology:L4/fontaine-laffaille-data: Small-weight filtered Frobenius modules

definition contract: For K₀/ℚ_p finite unramified, W=O_K₀ and p>2, an integral Fontaine–Laffaille object has a finite W-module M, an exhaustive separated decreasing filtration Fil^i M and σ-semilinear maps φ_i:Fil^i M→M satisfying φ_i|Fil^(i+1)=p φ_(i+1), with Σ_i im φ_i=M. In the free case each filtration step is a direct summand. Restrict to a weight interval [a,b] of width ≤p−2, and form morphisms preserving the filtration and all φ_i. Use the covariant convention of Nizioł §2; translating Fontaine–Laffaille’s contravariant Hom realization requires a dual. For torsion exactness use the abelian enlarged category with separate filtration modules and their inclusion maps, not an assertion that the entire category of all filtered modules is abelian.

Hypotheses: K₀ unramified; small weights; integral and torsion coefficient variants distinguished. The Tate representation ℤ_p(1) has weight −1.

Prerequisites: SelmerIwasawaCohomology:L4/crystalline-period-ring

Source: FONTAINE-LAFFAILLE-82, §§0.4–0.6, pp. 550–551; §1.11, pp. 558–559; §§7.12–7.15, pp. 593–594; NIZIOL-93, §2, pp. 750–751

API TauCeti.Selmer.FontaineLaffailleModule (constructor): Finite filtered W-module with compatible generating divided Frobenius maps.

API TauCeti.Selmer.FontaineLaffailleHom (constructor): Filtration- and Frobenius-preserving linear maps.

API TauCeti.Selmer.fontaineLaffaille_sum (structure): Direct sums and their divided Frobenius maps.

API TauCeti.Selmer.fontaineLaffaille_interval (characterisation): The explicit interval support predicate.

API TauCeti.Selmer.fontaineLaffaille_dual (functoriality): Dual/twist shifts the interval according to the weight convention.

Example TauCeti.Selmer.Tests.fl_zero (degenerate): The zero module with zero filtration is an object in every allowed interval.

Example TauCeti.Selmer.Tests.fl_rank_one (non-example): The rank-one weight-zero object has Fil⁰=M, Fil¹=0 and unit Frobenius; omitting generation would admit φ₀=0.

Example TauCeti.Selmer.Tests.fl_range (non-example): A tensor product with combined width >p−2 is not covered by the small-weight comparison theorem.

#### SelmerIwasawaCohomology:L4/fontaine-laffaille-comparison: Small-weight crystalline realization and extension exactness

theorem contract: On the small-weight category over an unramified p-adic field, the covariant period realization gives an exact fully faithful functor to finite ℤ_p-Galois modules whose essential image is the torsion crystalline representations of the specified interval. For free objects pass to the inverse limit of the mod-p^m realizations; the resulting free lattice has the same rank and its rationalization is crystalline. The reverse functor is the filtered Frobenius module inside the crystalline tensor invariants, and the two maps are canonical inverse comparisons. Tensor/dual compatibility holds only when the combined interval remains in the permitted range.

Hypotheses: p>2; interval width ≤p−2; Nizioł’s covariant normalization. Endpoint width p−1 needs extra nilpotence/unipotence hypotheses and is outside this target.

Prerequisites: SelmerIwasawaCohomology:L4/fontaine-laffaille-data, SelmerIwasawaCohomology:L4/period-realization

Source: FONTAINE-LAFFAILLE-82, Theorem 3.3 and proof §§3.5–3.10, pp. 562–564; Theorem 6.1, pp. 581–583; Propositions 7.15 and 7.17, pp. 593–594; Theorem 8.4 and Remark 8.5, pp. 595–596; NIZIOL-93, §2, pp. 750–751

#### SelmerIwasawaCohomology:L4/torsion-crystalline-condition: Integral crystalline modules and nonsingular extensions

definition contract: For unramified K/ℚ_p, call a finite ℤ_p-module R crystalline in [a,b] if it is a quotient R″/R′ of stable lattices in a crystalline rational representation with weights in [a,b]. A finite-type integral module is crystalline if every R/p^mR is so; for O-coefficients apply the underlying ℤ_p-module functor. If a≤0≤b, define H¹_ns(K,R) as extension classes 0→R→R_s→ℤ_p→0 whose middle term is crystalline in that interval. The extension set is an O-submodule. It is not defined by a nonexistent tensor R⊗B_cris, which would be zero for finite p-torsion R.

Hypotheses: K unramified and coefficient weight conventions fixed; weights of ℚ_p(1) are −1. Scalar restriction precedes the crystalline test.

Prerequisites: SelmerIwasawaCohomology:L4/period-realization, SelmerIwasawaCohomology:L4/fontaine-laffaille-comparison, ArithmeticGaloisDuality:R02.1/continuous-section-long-exact

Source: LIU-ETAL-22, Definitions 2.2.4–2.2.5, pp. 124–125

API TauCeti.Selmer.IsTorsionCrystalline (constructor): Stable-lattice quotient with bounded crystalline weights.

API TauCeti.Selmer.IsIntegralCrystalline (constructor): All finite p-power reductions satisfy the torsion predicate.

API TauCeti.Selmer.crystallineNonsingular (constructor): Submodule of cohomology represented by crystalline extensions.

API TauCeti.Selmer.crystallineNonsingular_map (functoriality): Compatible coefficient maps induce the extension-class map.

API TauCeti.Selmer.crystallineNonsingular_scalarRestriction (compatibility): O-coefficient predicate agrees with the underlying ℤ_p predicate.

Example TauCeti.Selmer.Tests.torsion_crys_zero (degenerate): Zero is crystalline and has zero nonsingular extension group.

Example TauCeti.Selmer.Tests.torsion_crys_tate (computation): ℤ/p^m(1) is crystalline in any permitted interval containing −1.

Example TauCeti.Selmer.Tests.torsion_crys_not_tensor (non-example): R⊗ℚ_p B_cris=0 for finite R; using that as the definition would declare every extension finite and lose the crystalline condition.

#### SelmerIwasawaCohomology:L4/integral-finite-comparison: Crystalline extensions and the integral finite preimage

theorem contract: Let R be a finite free O-lattice over unramified K/ℚ_p, R[1/p] crystalline with weights [a,b], a≤0≤b and b−a≤p−2. Then H¹_ns(K,R) is exactly the preimage of H¹_f(K,R[1/p]) under H¹(K,R)→H¹(K,R[1/p]). The key lifting criterion is Breuil Proposition 6: a stable free lattice is rationally crystalline in the permitted interval when all its finite p-power reductions are torsion crystalline in that interval. Apply it to the middle term of the extension; width bounds and unramifiedness remain hypotheses.

Hypotheses: The extension has a free middle term; all finite reductions must be tested. No such equivalence is asserted for arbitrary weights or ramified K.

Prerequisites: SelmerIwasawaCohomology:L4/torsion-crystalline-condition, SelmerIwasawaCohomology:L4/bloch-kato-condition, SelmerIwasawaCohomology:L4/fontaine-laffaille-comparison

Source: BREUIL-99, §2.3, Proposition 6 and Remark 8, p. 465; LIU-ETAL-22, Lemma 2.2.6, p. 125

#### SelmerIwasawaCohomology:L4/torsion-crystalline-duality: Finite crystalline annihilators and the inverse different

theorem contract: For unramified K/ℚ_p and finite crystalline R with weights a<0≤b and b−a≤(p−2)/2, the nonsingular groups for underlying ℤ_p coefficients are exact annihilators under the finite local Tate pairing. For O-coefficients and the O-linear dual R*=Hom_O(R,E/O), the pairing of H¹_ns(K,R) with H¹_ns(K,R*(1)) takes values in d_(E/ℚp)^−1/O. Thus it vanishes when the different is the unit ideal; it need not vanish in E/O for ramified E. Do not replace this statement with exact O-linear annihilators without a separate hypothesis.

Hypotheses: Finite R; the half-width bound allows the tensor-product crystalline calculation; dual interval is [−b−1,−a−1].

Prerequisites: SelmerIwasawaCohomology:L4/fontaine-laffaille-comparison, SelmerIwasawaCohomology:L4/torsion-crystalline-condition, SelmerIwasawaCohomology:L1/lattice-pairing-compatibility, ArithmeticGaloisDuality:R02.4/global-euler-characteristic

Source: NIZIOL-93, Proposition 6.2 and proof, pp. 764–765; LIU-ETAL-22, Lemma 2.2.7, p. 125

Example TauCeti.Selmer.Tests.different_unramified (compatibility): For unramified E/ℚ_p the inverse different is O and the value is zero.

Example TauCeti.Selmer.Tests.different_ramified (non-example): For E=ℚ_p(√p), p odd, d is nonunit and d^−1/O is nonzero; trace-zero values need not be zero.

Example TauCeti.Selmer.Tests.different_width (non-example): Width p−2 is insufficient for the product proof; the half-width bound is essential.

#### SelmerIwasawaCohomology:L4/ordinary-finite-comparison: Finite versus ordinary local conditions with explicit exceptional terms

comparison contract: For a de Rham ordinary V with saturated G_K-stable V^+ and V^−, compare L_f=H¹_f(K,V), L_str=im H¹(K,V^+) and L_Gr=ker[H¹(K,V)→H¹(I_K,V^−)]. Use the coefficient LES, the finite-period exact sequence and L1 ordinary-annihilator-correction to calculate L_str/(L_str∩L_f), L_f/(L_str∩L_f), and L_Gr/L_str=im H¹(K,V)→H¹(K,V^−) ∩ H¹_ur(K,V^−). The first two are measured by the kernel/cokernel of the induced finite-period maps and the H⁰ coefficient boundary; the third is the displayed unramified quotient. Under the separate vanishings H¹_f(K,V^+)=H¹(K,V^+), H¹_f(K,V^−)=0 and exactness of the finite-extension sequence, L_f=L_str; under zero unramified intersection L_str=L_Gr. Verify these conditions in each arithmetic example, retaining φ=1, Fil⁰ and H⁰ factors when they fail.

Hypotheses: Finite K/ℚ_p; de Rham coefficient sequence and compatible finite-period complexes. No universal equality of Bloch–Kato and Greenberg conditions is assumed. Infinite-level comparison uses the limits and correction-complex, not a period ring at an infinite local field.

Prerequisites: SelmerIwasawaCohomology:L4/bloch-kato-condition, SelmerIwasawaCohomology:L4/period-fundamental-sequences, SelmerIwasawaCohomology:L1/ordinary-annihilator-correction, SelmerIwasawaCohomology:L2/lattice-change-cone, SelmerIwasawaCohomology:L3/correction-complex

Source: BLOCH-KATO-90, §3.7–3.8, pp. 352–359; RJW-PADIC-L, Remark 13.20, preprint p. 70; NEKOVAR-SC, §6.7, pp. 151–154

Example TauCeti.Selmer.Tests.ordinary_trivial (non-example): For V=ℚ_p, V^+=0, L_str=0 but L_f=L_Gr=H¹_ur is one dimensional.

Example TauCeti.Selmer.Tests.ordinary_tate_one (non-example): For V=ℚ_p(1), V^+=V, L_str=L_Gr=H¹, while L_f consists of unit Kummer classes and omits the valuation line.

Example TauCeti.Selmer.Tests.ordinary_good_elliptic (compatibility): In the good ordinary elliptic case, the nonexceptional unit-root eigenvalue and local Euler dimensions eliminate the finite/strict defect.

#### SelmerIwasawaCohomology:L4/archimedean-realization: Archimedean realization on the existing Hodge carrier

definition contract: At a real place, extend the existing TauCeti.Hodge.HodgeStructureOn(W,ω,w), finite-dimensional over ℂ, by a ℂ-linear involution F∞ commuting with the antilinear coefficient conjugation ω and taking H^(a,w−a) to H^(w−a,a). These involutions are different data. On a diagonal piece H^(a,a), let h_a^ε be the dimension of the F∞=(-1)^(a+ε) eigenspace, ε=0,1. At a complex place use the Hodge numbers without real eigenspaces. Require an explicit comparison specifying which Hodge realization defines L(V,s); in RJW’s Tate convention V=ℚ_p(n) has archimedean type (n,n), F∞=(-1)^n and L(V,s)=ζ(s−n). The usual cohomological Tate Hodge convention must be dualized to this L-function convention.

Hypotheses: Finite-dimensional pure Hodge realization on the actual opposed-filtration carrier. No conversion from a p-adic representation to Hodge data without comparison data.

Prerequisites: SelmerIwasawaCohomology:L2/pontryagin-dual, tauceti:TauCeti.Hodge.HodgeStructureOn.dual, tauceti:TauCeti.Hodge.HodgeStructureOn.finrank_dual_piece, tauceti:TauCeti.Hodge.HodgeStructureOn.tateTwist, tauceti:TauCeti.Hodge.tate, tauceti:TauCeti.Hodge.tate_hodgeNumber

Source: DELIGNE-79, §5.2–5.3 and Table 5.3, pp. 328–329; RJW-PADIC-L, §13.5.3, preprint pp. 71–72

API TauCeti.Selmer.ArchimedeanRealization (constructor): Existing HodgeStructureOn plus the real involution and its compatibility.

API TauCeti.Selmer.archRealization_diagonalMultiplicity (projection): The (-1)^(a+ε) eigenspace dimension on H^(a,a).

API TauCeti.Selmer.archRealization_sum (structure): Direct sum with both conjugations and summed multiplicities.

API TauCeti.Selmer.archRealization_tateDual (functoriality): The L-function Tate-dual types and involution.

API TauCeti.Selmer.archRealization_hodgeCarrier (coercion): Projection to the existing opposed-filtration Hodge structure.

Example TauCeti.Selmer.Tests.arch_zero (degenerate): Zero Hodge structure gives zero diagonal and off-diagonal multiplicities.

Example TauCeti.Selmer.Tests.arch_real_involution (non-example): Two weight-zero rank-one structures with the same Hodge filtration and opposite F∞ give different real Gamma factors.

Example TauCeti.Selmer.Tests.arch_tate_convention (compatibility): For ℚ_p(n) in the RJW convention, the type is (n,n) and F∞=(-1)^n; using type (−n,−n) without changing L(V,s) gives the wrong criticality.

#### SelmerIwasawaCohomology:L4/hodge-gamma-factor: Gamma factor and its integer pole order

construction contract: For a real place, each off-diagonal pair (a,b),(b,a), a<b, contributes Γ_ℂ(s−a) raised to h^(a,b), and the diagonal sign ε contributes Γ_ℝ(s+ε−a) raised to h_a^ε. For a complex place each type (a,b) contributes Γ_ℂ(s−min(a,b)) with its multiplicity. Here Γ_ℝ(s)=π^(−s/2)Γ(s/2), Γ_ℂ(s)=2(2π)^−sΓ(s), already Mathlib definitions. Finite support makes the product finite. At an integer m the pole order is the sum of multiplicities of complex factors with m−min(a,b)≤0 and real factors with m+ε−a a nonpositive even integer. Compare this combinatorial order with the meromorphic continuation, using the analytic reciprocal Gamma function. Mathlib’s totalized values are zero at Gamma poles, so nonzero value is not the definition of a meromorphic pole.

Hypotheses: ArchimedeanRealization and finite support; diagonal eigenspaces in the real case. Products and pole orders include every archimedean place.

Prerequisites: SelmerIwasawaCohomology:L4/archimedean-realization

Source: DELIGNE-79, §5.3 and Table 5.3, p. 329; RJW-PADIC-L, §13.5.3, preprint p. 71

API TauCeti.Selmer.hodgeGammaFactors (constructor): Finite multiset of shifted real and complex Gamma factors.

API TauCeti.Selmer.hodgeGammaFactor (constructor): Product of the existing Mathlib Gamma factors off their pole set.

API TauCeti.Selmer.gammaPoleOrder (projection): Weighted integer pole count for the derived multiset.

API TauCeti.Selmer.gammaFactor_sum (compatibility): Direct sum multiplies factors and adds pole orders.

API TauCeti.Selmer.gammaPoleOrder_analytic (characterisation): Pole count equals the meromorphic order, using reciprocal Gamma at totalized zeros.

Example TauCeti.Selmer.Tests.gamma_zero (degenerate): Zero realization gives product 1 and pole order 0.

Example TauCeti.Selmer.Tests.gamma_tate (computation): The Tate type (n,n), sign (-1)^n gives Γ_ℝ(s−n).

Example TauCeti.Selmer.Tests.gamma_real_sign (non-example): Weight-zero real sign + gives Γ_ℝ(s), sign − gives Γ_ℝ(s+1); their pole orders at 0 differ.

Example TauCeti.Selmer.Tests.gamma_elliptic (compatibility): A real weight-one structure with h^(0,1)=h^(1,0)=1 gives Γ_ℂ(s), counted once rather than twice.

#### SelmerIwasawaCohomology:L4/positive-rank-leading-term: Positive-rank determinant formulation as a separate proposition

definition contract: Specify O a complete DVR with fraction field E, a perfect integral Selmer complex C, a specialization χ, a parameter u at χ, a series f(u)∈E[[u]], and r=dim_E H¹(C⊗^L_χ E)>0. A supplied nondegenerate regulator, with its normalization, must induce an actual line equivalence θ_reg:𝔇(C⊗^L_χ O)⊗E≃E; for each retained perfect local correction E_v supply the corresponding line trivialization. Let J be the product of θ_reg(𝔇(C⊗^L_χ O)) and the local-error fractional lattices, with the inverse-determinant convention of L3. Define the proposed leading-term assertion by f_k=0 for k<r, f_r≠0 and O·f_r=J. Record the regulator construction as input, not an unconstrained asserted equality. Specialization rank r is distinct from generic Λ-corank. This is an explicitly proposed arithmetic schema, not a claim that RJW Conjecture 13.21(ii) states it or that a non-torsion module has a characteristic ideal.

Hypotheses: Perfectness, specialization, chosen parameter, analytic series and actual regulator/line maps. All determinant factors are defined before the assertion. No existence of these analytic/regulator data is asserted.

Prerequisites: SelmerIwasawaCohomology:L3/selmer-determinant, SelmerIwasawaCohomology:L3/correction-complex, SelmerIwasawaCohomology:L4/greenberg-main-conjecture

Source: RJW-PADIC-L, Conjecture 13.21(ii) and Remark 13.24, preprint pp. 71–72; NEKOVAR-SC, §§8.9–8.10, pp. 238–251

API TauCeti.Selmer.LeadingTermData (constructor): Actual perfect complex, parameterized analytic series, specialized rank and regulator line equivalences.

API TauCeti.Selmer.LeadingTermStatement (constructor): Coefficients below r vanish, coefficient r is nonzero and its principal fractional lattice equals the defined determinant product.

API TauCeti.Selmer.leadingTerm_changeTrivialization (compatibility): Scaling the regulator equivalence by a∈Eˣ scales J by a; an O-unit leaves its fractional ideal unchanged.

API TauCeti.Selmer.leadingTerm_reparameterize (compatibility): For u′=a u plus higher terms, a∈Oˣ, the leading coefficient scales by a^−r and its fractional lattice is unchanged.

Example TauCeti.Selmer.Tests.leading_rank_zero (compatibility): For generically acyclic C the regulator input reduces to the L3 torsion determinant convention.

Example TauCeti.Selmer.Tests.leading_zero_regulator (non-example): A degenerate regulator cannot give a determinant trivialization.

Example TauCeti.Selmer.Tests.leading_local_factor (non-example): Deleting a nonunit local-error determinant changes the leading-term lattice.

#### SelmerIwasawaCohomology:L4/arithmetic-tower-data: Class groups, p-ramified Galois groups and unit towers

construction contract: For F_n=ℚ(μ_(p^n)), p odd, define Y_n as the p-primary ideal class group, identified by global reciprocity with the everywhere-unramified maximal abelian pro-p Galois group. Define X_n as the maximal abelian pro-p Galois group unramified outside p, equivalently the p-completed idèle class quotient with the local unit groups away from p killed. Let U_n,1 be principal units at p and E_n,1 the closed image of the global units in U_n,1 (intersecting with principal units). Define U∞,1,E∞,1,Y∞ by norm limits and X∞ as the corresponding p-ramified Galois group over F∞; prove its comparison with the finite-level norm/transfer system, retaining decomposition/splitting terms until the cyclotomic ramification hypotheses remove them. For complex conjugation c, use e±=(1±c)/2 to form the plus/minus parts and identify X∞^+,Y∞^+ with the groups over the real tower. A chosen closed norm-compatible unit submodule C∞,1^+⊆E∞,1^+ is parameter data here; constructing cyclotomic Euler systems belongs to its consumer.

Hypotheses: Cyclotomic tower and p odd; closed unit images rather than algebraic unit images; global Artin reciprocity normalized with arithmetic Frobenius.

Prerequisites: tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity, SelmerIwasawaCohomology:L0/units-completion, SelmerIwasawaCohomology:L3/semilocal-cohomology

Source: RJW-PADIC-L, §13.2 and Definition 13.12, preprint pp. 65–67; Proposition 13.13 and Corollary 13.14, pp. 67–68

API TauCeti.Selmer.pRamifiedModule (constructor): The maximal abelian pro-p group unramified outside p with its continuous tower action.

API TauCeti.Selmer.unramifiedModule (constructor): The class-group norm limit and its unramified Galois comparison.

API TauCeti.Selmer.closedGlobalUnitTower (constructor): Norm limit of the closed global-unit images in principal units.

API TauCeti.Selmer.arithmeticPlusMinus (structure): The e± decomposition for p odd.

API TauCeti.Selmer.arithmeticTower_reciprocity (equivalence): Global reciprocity identifies the stated idèle and Galois quotients, compatibly with norms.

Example TauCeti.Selmer.Tests.tower_closed_units (non-example): A dense proper algebraic unit subgroup has the same closed image; replacing closure by raw image changes the compact quotient.

Example TauCeti.Selmer.Tests.tower_plus_minus (degenerate): For c=1 the minus part is zero and the plus part is the whole module.

Example TauCeti.Selmer.Tests.tower_two (non-example): At p=2, division by 2 is unavailable and the e± integral direct sum is not an allowed construction.

#### SelmerIwasawaCohomology:L4/unit-class-exact-sequence: The closed-unit and class-group exact sequence

theorem contract: In the cyclotomic plus tower with the objects of arithmetic-tower-data, 0→E∞,1^+→U∞,1^+→X∞^+→Y∞^+→0 is exact. For any closed Λ-submodule C∞,1^+⊆E∞,1^+, quotienting gives 0→E∞,1^+/C∞,1^+→U∞,1^+/C∞,1^+→X∞^+→Y∞^+→0. In particular ker(X∞^+→Y∞^+)≃U∞,1^+/E∞,1^+, with the quotient in that direction. The inverse-limit surjectivity is proved from the compatible compact finite-level exact sequences, by compact inverse-limit exactness or finite-quotient limits and their derived coefficient comparison. No Mittag–Leffler assertion for the full lattice tower is made; surjectivity is not automatic for arbitrary noncompact towers. The image E_n,1 is a closure; equality with the abstract completed unit lattice requires the separate Leopoldt assertion.

Hypotheses: p odd; actual finite-level reciprocity maps and cyclotomic ramification; C closed and contained in E. This comparison constructs no cyclotomic units.

Prerequisites: SelmerIwasawaCohomology:L4/arithmetic-tower-data, SelmerIwasawaCohomology:L0/roots-of-unity-mittag-leffler, ArithmeticGaloisDuality:R02.1/mittag-leffler-lim-one

Source: RJW-PADIC-L, Proposition 13.13 and Corollary 13.14, preprint pp. 67–68 (published pp. 195–196)

Example TauCeti.Selmer.Tests.unit_sequence_c_zero (degenerate): C=0 gives the original unit/class-group sequence.

Example TauCeti.Selmer.Tests.unit_sequence_c_e (compatibility): C=E gives 0→0→U/E→X→Y→0.

Example TauCeti.Selmer.Tests.unit_sequence_direction (non-example): E⊆U, so U/E is defined while E/U is not; this rejects the reversed printed quotient.

#### SelmerIwasawaCohomology:L4/leopoldt-selmer: Leopoldt and the strict-at-p Tate Selmer group

theorem contract: For a number field F and W*=ℚ_p/ℤ_p(1), choose the Selmer condition strict at every p-adic place and the propagated finite condition away from p. The resulting Selmer group is finite iff the p-adic unit localization map O_F^×⊗ℤ_p→⊕_(v|p) completed O_Fv^× has rank r₁+r₂−1 (Leopoldt). For a finite character χ of prime-to-p order, the corresponding χ-component is finite when Leopoldt holds for its splitting field; use the character idempotent only under the prime-to-p hypothesis. This is a statement/equivalence, not a proof of Leopoldt for all number fields.

Hypotheses: Finite F; p-primary coefficient and local conditions specified. The strict p condition cannot be replaced by relaxed or the full finite unit condition.

Prerequisites: SelmerIwasawaCohomology:L0/s-unit-kummer-identification, SelmerIwasawaCohomology:L4/unit-class-exact-sequence, SelmerIwasawaCohomology:L2/selmer-kernel

Source: RUBIN-ES, Corollary I.6.4, p. 16; Remark II.2.7, p. 25

Example TauCeti.Selmer.Tests.leopoldt_q (computation): For ℚ the unit rank is zero and the strict Selmer group is finite.

Example TauCeti.Selmer.Tests.leopoldt_wrong_local (non-example): Relaxing p admits local unit Kummer classes and no longer expresses the same rank-defect kernel.

Example TauCeti.Selmer.Tests.leopoldt_character_degree (non-example): If p divides the character group order, its integral averaging idempotent is unavailable.

#### SelmerIwasawaCohomology:L4/global-finite-reduction: Global finite Selmer reductions and conjugation

theorem contract: Define Sel_f(F,T) as the preimage of the rational finite Selmer group and Sel_(f,T)(F,T/λ^m) as the image of Sel_f(F,T) in finite coefficient cohomology; distinguish this global image from the Selmer kernel formed from independently propagated local conditions. For a free O-submodule S of Sel_f(F,T) whose image modulo torsion is saturated, its image S(m) is free over O/λ^m of the same rank. Its localizations lie in the nonsingular condition at unramified non-p places and at unramified p places in the small crystalline range. If c restricts to an automorphism of F, conjugation gives Sel_f(F,V)≃Sel_f(F,V^c), carrying each place to its conjugate.

Hypotheses: Stable free lattice T; m≥1; the saturation condition is on the image in Sel_f/torsion, not merely a submodule of the torsion group. The local crystalline hypothesis is the one in integral-finite-comparison.

Prerequisites: SelmerIwasawaCohomology:L4/bloch-kato-condition, SelmerIwasawaCohomology:L4/integral-finite-comparison, SelmerIwasawaCohomology:L2/lattice-passage, SelmerIwasawaCohomology:L2/finite-unramified-comparison

Source: LIU-ETAL-22, Definitions 2.4.1–2.4.2 and Lemma 2.4.3, p. 129; Lemma 2.4.5 and Proposition 2.4.6(1), p. 130

#### SelmerIwasawaCohomology:L4/uniform-away-p-bound: Uniform local annihilation for pure weight minus one

theorem contract: Let T be free over O with V=T[1/p], V^c≃V*(1) and V pure of weight −1 at every non-p finite place, in the ArithmeticGaloisRepresentations Weil–Deligne convention. For each finite set Σ there is an m_Σ depending only on T,Σ such that for every saturated S of global-finite-reduction and every m>m_Σ, all non-p finite localizations of λ^(m_Σ)S(m) at w∈Σ are zero. At such w, purity for V and its Tate dual gives H⁰=H²=0 and the away-p Euler characteristic gives H¹(K_w,V)=0. Thus integral H¹ and torsion H² are killed by λ^m_w; the coefficient LES kills finite H¹ by λ^(2m_w). Set m_Σ=max_(w∈Σ,w∤p∞)2m_w.

Hypotheses: Conjugate Tate self-duality and local purity are both required. No assertion at p or archimedean places.

Prerequisites: SelmerIwasawaCohomology:L4/global-finite-reduction, ArithmeticGaloisRepresentations:R01.2/purity-of-weil-deligne-representations, ArithmeticGaloisDuality:R02.4, SelmerIwasawaCohomology:L1/lattice-pairing-compatibility

Source: LIU-ETAL-22, Proposition 2.4.6(2) and proof, pp. 130–131

#### SelmerIwasawaCohomology:L4/elliptic-finite-kummer: Elliptic Bloch–Kato and classical Selmer vanishing

comparison contract: For E/F and V=V_p E, identify H¹_f(F_v,V) with E(F_v)⊗ℚ_p under Kummer at every finite place; at v∤p this space is zero, and the propagated finite condition on E[p∞] is zero; finite E[p^m] Kummer conditions can still retain Tamagawa contributions. Globally the rational finite Selmer group is (lim_m Sel_(p^m)(E/F), with multiplication-by-p coefficient transitions)⊗ℤpℚ_p, equivalently T_p Sel_(p∞)(E/F)⊗ℤpℚ_p, and H¹_f(F,V)=0 iff the classical p∞ Selmer group is finite (equivalently its ℤ_p-corank is zero). The Weil pairing gives V*(1)≃V, so its Tate-dual finite Selmer group vanishes under the same hypothesis. No finiteness of the full Tate–Shafarevich group is inferred.

Hypotheses: Stable Tate module and upstream finite-level Kummer/Selmer exact sequences. At p the p-adic comparison for the elliptic Kummer map is part of this target, after the minimal period foundations.

Prerequisites: SelmerIwasawaCohomology:L2/elliptic-selmer-instance, SelmerIwasawaCohomology:L4/bloch-kato-condition, SelmerIwasawaCohomology:L2/selmer-limits, tauceti:TauCetiRoadmap/EllipticCurves#layer-7-selmer-groups-and-sha-aec-x4

Source: BLOCH-KATO-90, Example 3.11, pp. 359–361; BURUNGALE-TIAN-26, §3.1, preprint pp. 5–6; SKINNER-20, §2.2.1, preprint p. 8

Example TauCeti.Selmer.Tests.elliptic_away_p (non-example): Rational local finite cohomology is zero away from p, but finite p-torsion Kummer images need not be zero.

Example TauCeti.Selmer.Tests.elliptic_dual (compatibility): The Weil pairing identifies the Tate dual with V, so both rational finite Selmer vanishings are obtained together.

Example TauCeti.Selmer.Tests.elliptic_sha (non-example): Corank zero implies finiteness of the p-primary Selmer group, not the full Sha group at every prime.

Example TauCeti.Selmer.Tests.elliptic_discrete_tensor (non-example): The torsion discrete Sel_(p∞) tensor ℚ_p is zero regardless of corank, so it cannot be the rational finite Selmer group.

#### SelmerIwasawaCohomology:L4/artin-adjoint-finiteness: Finite-image adjoint Selmer finiteness with descent errors

theorem contract: Let ρ be a finite-image characteristic-zero representation over E with stable lattice, L/F its finite Galois splitting field, and A=ad⁰(ρ)⊗E/O. The finite-condition Selmer group Sel_f(F,A) is finite. Restriction maps it into the everywhere-unramified Hom of the finite p-class group of L with A; the restriction kernel is a subgroup of H¹(Gal(L/F),A), which is finite. This proves finiteness even when p divides [L:F]. A canonical quotient of the class group is not asserted: the actual target is a Galois-equivariant Hom group with finite group-cohomology errors. Under prime-to-p degree and compatible unramified propagated conditions, restriction/invariants give the sharper class-group-Hom identification.

Hypotheses: Finite-image ρ; finite-dimensional ad⁰ and propagated rational finite conditions. Odd irreducible rank-two Artin over ℚ is the source’s worked case; modularity is not needed for the finiteness argument.

Prerequisites: SelmerIwasawaCohomology:L4/bloch-kato-condition, SelmerIwasawaCohomology:L2/restriction-injective-descent, ArithmeticGaloisDuality:R02.2/finite-index-descent, tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity

Source: CG-APPENDIX-20, §2, preprint p. 4 (published Appendix A §A.2, pp. 883–884)

#### SelmerIwasawaCohomology:L4/ordinary-selmer-parity: Ordinary modular Selmer parity over ℚ and quadratic fields

theorem contract: Let f be a cuspidal newform over ℚ of even weight k with trivial nebentypus, λ|p and p odd, ordinary at λ. Put V=V_λ(f)(k/2) in Nekovář’s self-dual convention. For F=ℚ or any quadratic extension of ℚ, dim_(E_λ) H¹_f(F,V) is congruent modulo two to the central analytic order of the base-change L-function. Equivalently its root number is (−1)^(dim H¹_f). In particular one-dimensional finite Selmer over ℚ forces sign −1; odd dimension over an imaginary quadratic field gives the analogous sign required by Skinner. This uses Nekovář Theorem 12.2.3 with base F₀=ℚ, trivial character χ and alternative (1), since [ℚ:ℚ] is odd; the quadratic extension is the permitted 2-abelian extension. No parity theorem for every ordinary representation is asserted.

Hypotheses: An actual modular Galois representation with its self-dual twist and functional equation; p odd and λ-ordinary. The analytic order is finite.

Prerequisites: SelmerIwasawaCohomology:L4/bloch-kato-condition, SelmerIwasawaCohomology:L1/derived-selmer-duality, SelmerIwasawaCohomology:L2/restriction-injective-descent

Source: NEKOVAR-SC, Theorem 12.2.3 and Remark 12.2.4, pp. 421–422; §§12.10.1–12.10.2, pp. 521–522; §§12.10.8–12.10.9, pp. 526–528

Example TauCeti.Selmer.Tests.parity_one (computation): A one-dimensional ordinary modular finite Selmer group forces root number −1.

Example TauCeti.Selmer.Tests.parity_two (computation): Even finite Selmer dimension gives root number +1, without implying rank zero.

Example TauCeti.Selmer.Tests.parity_nonordinary (non-example): A nonordinary λ is outside this theorem, even when the representation is self-dual.

#### SelmerIwasawaCohomology:L4/congruent-two-parity: Two-primary Selmer parity for congruent-number twists

theorem contract: For positive squarefree n let E_n be the smooth elliptic curve n y²=x³−x, equivalently y²=x³−n²x. Then corank_(ℤ₂) Sel_(2∞)(E_n/ℚ) is even for n≡1,2,3 (mod 8) and odd for n≡5,6,7 (mod 8). The other residues are excluded by squarefreeness. This is corank of the infinite Selmer group, not dim_F₂ Sel₂, nor the Mordell–Weil rank without controlling divisible Sha. Match the two models by (X,Y)=(nx,n²y) and identify their Kummer maps. Source route: the p=2 case of Dokchitser–Dokchitser Theorem 4.19 is explicitly attributed there to Monsky; its full proof is a recorded source/refinement gap. The elementary local root-number calculation supplies the congruent-number residue table.

Hypotheses: n>0 squarefree; characteristic zero; the infinite 2-primary Selmer group and corank use the upstream elliptic carrier. No density assertion or Smith distribution theorem is part of this node.

Prerequisites: tauceti:TauCetiRoadmap/EllipticCurves#layer-7-selmer-groups-and-sha-aec-x4, SelmerIwasawaCohomology:L4/elliptic-finite-kummer

Source: DOKCHITSER-10, Theorem 4.19 (= Theorem 1.4), pp. 593–594, p=2 attribution to reference [26]; BURUNGALE-TIAN-26, §3, preprint pp. 6–7

Example TauCeti.Selmer.Tests.congruent_parity_one (computation): n=1 has even 2∞-Selmer corank, while its two-torsion contributes to the finite Sel₂ dimension.

Example TauCeti.Selmer.Tests.congruent_parity_five (computation): n=5 has odd 2∞-Selmer corank.

Example TauCeti.Selmer.Tests.congruent_parity_squarefree (non-example): n≡0,4 mod 8 is not a positive squarefree input.

-/
