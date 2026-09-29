import Mathlib.RingTheory.AdicCompletion.AsTensorProduct
import Mathlib.NumberTheory.NumberField.Units.DirichletTheorem
import Mathlib.NumberTheory.Padics.PadicIntegers
import Mathlib.Algebra.Module.Submodule.Map
import Mathlib.LinearAlgebra.Quotient.Basic
import Mathlib.Topology.Algebra.PontryaginDual

/-!
# Suggested declarations: Selmer groups, continuous integral cohomology and Iwasawa cohomology

This file is a prototype in the form of upstream's `Suggested.lean`. Every proof is `sorry`; the
statements elaborate against Mathlib at the pinned commit. The complete targets, with sources, API
outlines and unit tests, are in the blueprint packet and the roadmap document.

The first two checkpoints cover:
* **L0**: the `p`-adic completion `lim_m Aˣ/(Aˣ)^{p^m}` of a multiplicative group, its comparison
  with `ℤ_p ⊗ A` for finitely generated `A` (global units, `S`-units), and its failure for local
  multiplicative groups and for `Fˣ`; the Kummer statements are recorded as comments, since they
  are stated against Tau Ceti's `TauCeti.kummerMap`, and no Tau Ceti build at the pinned commit was
  available;
* **L2**: the generic Selmer-kernel API over arbitrary coefficient modules (local conditions,
  strict and relaxed modifications, change of conditions, propagation along maps of coefficients,
  the passage `V → T, V → W` by inverse image and image), and the Pontryagin dual with its corank;
* **L1**: orthogonal complements under a bilinear pairing, with the image/preimage rule, and
  **L2**: the dual local conditions of a Selmer structure (second checkpoint).

The Galois-cohomological carriers (`H¹(G_{K,Σ}, M)`, `H¹(K_v, M)`, restriction to decomposition and
inertia groups) are imported from Tau Ceti's ProfiniteCohomology for discrete coefficients and
requested from `ArithmeticGaloisDuality:R02.1` for compact ones; the generic API below takes them as
modules with linear localisation maps.
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

/-- **`L0/completion-finitely-generated`**: for finitely generated `A`,
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

/-- **`L2/change-of-conditions`**: for `L ≤ L'`, the sequence
`0 → Sel_L → Sel_{L'} → ∏_v L'_v / L_v` is exact (Mazur–Rubin (2.4)). -/
theorem exact_change_of_conditions {L L' : ∀ v, Submodule R (D.loc v)} (h : ∀ v, L v ≤ L' v) :
    ∀ c ∈ (D.withCond L').selmer,
      (c ∈ (D.withCond L).selmer ↔ ∀ v, D.res v c ∈ L v) := sorry

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

/-! ## Kummer statements (signatures against Tau Ceti, recorded as comments)

```
/-- L0/kummer-level-compatibility -/
theorem kummerMap_pow_compat (hp : IsUnit (p : K)) (m : ℕ) (a : Kˣ) :
    powCoeffMap (kummerMap K (p ^ (m + 1)) _ a) = kummerMap K (p ^ m) _ a

/-- L0/kummer-limit-map: κ_∞ : lim_m Kˣ/(Kˣ)^{p^m} → lim_m H¹(G_K, μ_{p^m}), injective -/
def kummerLimit : pCompletion p (Additive Kˣ) →+ lim_m H1 (AbsoluteGaloisGroup K) (KummerCoeff K (p ^ m))

/-- L0/roots-of-unity-mittag-leffler -/
theorem isMittagLeffler_rootsOfUnity : (fun m ↦ rootsOfUnity (p ^ m) K) is Mittag-Leffler

/-- L0/padic-kummer-identification (with ArithmeticGaloisDuality:R02.1's compact H¹) -/
theorem H1_Zp1_equiv : H1cont (AbsoluteGaloisGroup K) (ℤ_p(1)) ≃+ pCompletion p (Additive Kˣ)

/-- L0/s-unit-kummer-identification -/
theorem H1_GS_Zp1_equiv : H1cont (G_{K,S}) (ℤ_p(1)) ≃+ ℤ_[p] ⊗ Additive (𝓞_{K,S})ˣ

/-- API of L0/kummer-limit-map -/
theorem kummerLimit_injective : Function.Injective (kummerLimit K p)
theorem kummerLimit_bijective (h90 : ∀ m, Function.Surjective (kummerMap K (p ^ m) _)) : Bijective (kummerLimit K p)
theorem kummerLimit_res, kummerLimit_cor, kummerLimit_zp_linear

/-- API of L2/unramified-condition (inflation from ProfiniteCohomology Layer 5) -/
theorem unramified_eq_range_inflation : unramified (res I) = range (inflation (G ⧸ I) (M^I))
theorem unramified_equiv_coinvariants : unramified (res I) ≃ M^I ⧸ (Fr - 1) M^I

/-- L2/galois-selmer-group (G_{K,Σ} and localisations from ArithmeticGaloisDuality:R02.3) -/
def galoisSelmer (K Σ M L) : Submodule R (H1 (G_{K,Σ}) M) := (SelmerData.ofGalois K Σ M L).selmer
theorem galoisSelmer_eq_rubin, galoisSelmer_enlarge, galoisSelmer_relax_eq, galoisSelmer_map

/-- API of L2/pontryagin-dual over ℤ_p[[Γ]] -/
theorem dual_involution : (M^∨ as ℤ_p[[Γ]]-module) = restrictScalars ι (M^∨), ι γ = γ⁻¹
theorem dual_selmer : Selmer maps dualise contravariantly

/-- L2/elliptic-selmer-instance (EllipticCurves Layer 7) -/
theorem selmer_pInfty_eq : Sel_{p^∞}(E/F) = galoisSelmer F Σ E[p^∞] (fun v ↦ image of E(F_v) ⊗ ℚ_p/ℤ_p)
```
-/

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
theorem orthogonal_orthogonal [Finite X] [Finite X'] (b : X →ₗ[R] X' →ₗ[R] Y) (hb : IsPerfect b)
    (F : Submodule R X) : orthogonal b.flip (orthogonal b F) = F := sorry

/-- API: `F^⊥ = F'` gives a perfect pairing `(X/F) × F' → Y`. -/
theorem quotientPairing_perfect (b : X →ₗ[R] X' →ₗ[R] Y) (hb : IsPerfect b) (F : Submodule R X) :
    ∃ c : (X ⧸ F) →ₗ[R] (orthogonal b F) →ₗ[R] Y,
      Function.Injective c ∧ ∀ x (y : orthogonal b F), c (F.mkQ x) y = b x y := sorry

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
theorem dualCond_dualCond (D D' : SelmerData R ι) (b : ∀ v, D.loc v →ₗ[R] D'.loc v →ₗ[R] Y)
    (hb : ∀ v, IsPerfect (b v)) [∀ v, Finite (D.loc v)] [∀ v, Finite (D'.loc v)] (v : ι) :
    orthogonal (b v).flip (dualCond D D' b v) = D.cond v := sorry

end SelmerData

end DualStructure

/-! Signatures on the Galois carriers (sketched):

```
/-- L1/lattice-pairing-compatibility -/
theorem localPairing_compat (c : H¹(K, T)) (d : H¹(K, V^*)) : ⟪φ c, d⟫_V = ⟪c, φ^* d⟫_T
/-- L2/unramified-dimension-count (ℓ ≠ p) -/
theorem finrank_unramified : finrank ℚ_p (H¹_ur(K, V)) = finrank ℚ_p (V^{G_K})
/-- L2/finite-unramified-comparison -/
def badPrimeTerm : H¹_f(K, T) ⧸ H¹_ur(K, T) ≃ (W^I ⧸ (W^I)_div)^{Fr=1}
/-- L2/finite-condition-lattice-duality -/
theorem orthogonal_finite : orthogonal (localPairing K T) (H¹_f(K, T)) = H¹_f(K, W^*)
/-- L2/selmer-structure-poitou-tate (Rubin I.7.3) -/
theorem locS_image_orthogonal : orthogonal (Σ_v ⟪,⟫_v) (loc^s (S^Σ(K, W_M))) = loc^f (S_{Σ₀}(K, W^*_M))
theorem card_strict_eq_card_coker (h : S_Σ(K, W^*_M) = 0) : #S_{Σ₀}(K, W^*_M) = #coker loc^s
```
-/

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

/-! ## L4 (checkpoint 4): Tate twists and Greenberg's conjecture -/

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

end TauCeti.Selmer
