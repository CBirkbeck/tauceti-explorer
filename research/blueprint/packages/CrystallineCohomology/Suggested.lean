import Mathlib

/-!
# CrystallineCohomology: representative target signatures

The roadmap is `README.md` in this directory; this file is not exhaustive. It records the
definitions that can be given real bodies against the pinned Mathlib and Tau Ceti, and the end
theorems and layer milestones whose carriers exist at the pins, proved by `sorry`. The heavy
objects of the roadmap (divided power envelopes as rings, crystalline and log crystalline sites,
crystals, de Rham–Witt complexes of rings, Hyodo–Kato complexes, Dieudonné crystals) are README
targets; the closing comment lists them.

Design choices made explicit here:
- Divided powers are Mathlib's `DividedPowers`: total operations that vanish outside the ideal,
  with integer coefficients `choose` and `uniformBell`. Divided power morphisms are Mathlib's
  `DividedPowers.IsDPMorphism`.
- The augmentation of the divided power algebra is Mathlib's `DividedPowerAlgebra.lift` into the
  zero ideal along the zero map, and the augmentation ideal is its kernel.
- A Dieudonné complex is a cochain complex of abelian groups (`ModuleCat ℤ`, indexed by `ℤ`) with
  a graded endomorphism `F` satisfying `d ∘ F = p • (F ∘ d)`; `F` is not a map of complexes.
- Monoids for log structures are written multiplicatively, as in rings; fine means cancellative
  and finitely generated, and saturation is tested in Mathlib's `Algebra.GrothendieckGroup`.
- `(φ, N)`-modules are built on Mathlib's `WittVector.Isocrystal`, with `N φ = p φ N`.
-/

namespace TauCetiRoadmap.CrystallineCohomology

open Finset

universe u v

/-! ## Layer CR.0: Divided powers and universal thickenings -/

namespace PD

variable {A : Type*} [CommRing A]

/-- An additive divided-power candidate on an ideal `I`: operations `δ_n : A → A` vanishing
outside `I`, with `δ₀ = 1`, `δ₁ = id` on `I`, `δ_n(I) ⊆ I` for `n > 0`, the addition formula and
homogeneity, but neither the multiplication nor the iteration identity (Stacks, Lemma 23.2.4,
hypothesis (a)). Belongs to Layer CR.0. -/
structure AdditivePowers (I : Ideal A) where
  /-- The operations `δ_n`. -/
  dpow : ℕ → A → A
  dpow_null : ∀ {n x}, x ∉ I → dpow n x = 0
  dpow_zero : ∀ {x}, x ∈ I → dpow 0 x = 1
  dpow_one : ∀ {x}, x ∈ I → dpow 1 x = x
  dpow_mem : ∀ {n x}, n ≠ 0 → x ∈ I → dpow n x ∈ I
  dpow_add : ∀ {n x y}, x ∈ I → y ∈ I →
    dpow n (x + y) = (antidiagonal n).sum fun k ↦ dpow k.1 x * dpow k.2 y
  dpow_mul : ∀ {n} {a : A} {x}, x ∈ I → dpow n (a * x) = a ^ n * dpow n x

namespace AdditivePowers

variable {I : Ideal A}

/-- Every divided power structure is an additive candidate with the same operations. -/
def ofDividedPowers (γ : DividedPowers I) : AdditivePowers I where
  dpow := γ.dpow
  dpow_null := γ.dpow_null
  dpow_zero := γ.dpow_zero
  dpow_one := γ.dpow_one
  dpow_mem := γ.dpow_mem
  dpow_add := γ.dpow_add
  dpow_mul := γ.dpow_mul

@[simp]
theorem ofDividedPowers_dpow (γ : DividedPowers I) : (ofDividedPowers γ).dpow = γ.dpow := rfl

/-- The candidate vanishes outside the ideal in degree zero as well. -/
example (δ : AdditivePowers I) {x : A} (hx : x ∉ I) : δ.dpow 0 x = 0 := δ.dpow_null hx

/-- In positive degree the candidate vanishes at zero. -/
example (δ : AdditivePowers I) : δ.dpow 2 0 = 0 := by
  have h := δ.dpow_mul (n := 2) (a := 0) (x := 0) I.zero_mem
  simpa using h

end AdditivePowers

/-- Divided powers from identities on generators (Stacks, Lemma 23.2.4): an additive candidate
whose multiplication and iteration identities hold on a generating set of `I` is a divided power
structure with the same operations. -/
theorem exists_dividedPowers_of_generators {I : Ideal A} (δ : AdditivePowers I) (S : Set A)
    (hS : I = Ideal.span S)
    (hmul : ∀ s ∈ S, ∀ m n : ℕ,
      δ.dpow m s * δ.dpow n s = (m + n).choose m * δ.dpow (m + n) s)
    (hcomp : ∀ s ∈ S, ∀ m n : ℕ, n ≠ 0 →
      δ.dpow m (δ.dpow n s) = Nat.uniformBell m n * δ.dpow (m * n) s) :
    ∃ γ : DividedPowers I, γ.dpow = δ.dpow := by
  sorry

/-- Divided powers on a sum of ideals (Stacks, Lemma 23.2.5): structures `γ` on `I` and `ε` on `J`
extend to a common structure on `I ⊔ J` exactly when they agree on `I ⊓ J`. -/
theorem exists_dividedPowers_sup_iff {I J : Ideal A} (γ : DividedPowers I)
    (ε : DividedPowers J) :
    (∃ θ : DividedPowers (I ⊔ J), (∀ n, ∀ x ∈ I, θ.dpow n x = γ.dpow n x) ∧
      ∀ n, ∀ x ∈ J, θ.dpow n x = ε.dpow n x) ↔
      ∀ n, ∀ x ∈ I ⊓ J, γ.dpow n x = ε.dpow n x := by
  sorry

/-- The glued structure on `I ⊔ J` is unique. -/
theorem dividedPowers_sup_unique {I J : Ideal A} (γ : DividedPowers I) (ε : DividedPowers J)
    (θ θ' : DividedPowers (I ⊔ J))
    (hθ : (∀ n, ∀ x ∈ I, θ.dpow n x = γ.dpow n x) ∧ ∀ n, ∀ x ∈ J, θ.dpow n x = ε.dpow n x)
    (hθ' : (∀ n, ∀ x ∈ I, θ'.dpow n x = γ.dpow n x) ∧ ∀ n, ∀ x ∈ J, θ'.dpow n x = ε.dpow n x) :
    θ = θ' := by
  sorry

/-- Flat extension of divided powers (Stacks, Lemma 23.4.2): along a flat ring map `A → B`, a
divided power structure on `I` extends uniquely to `IB` so that `A → B` is a divided power
morphism. -/
theorem existsUnique_dividedPowers_map_of_flat {B : Type*} [CommRing B] [Algebra A B]
    [Module.Flat A B] {I : Ideal A} (γ : DividedPowers I) :
    ∃! δ : DividedPowers (I.map (algebraMap A B)),
      DividedPowers.IsDPMorphism γ δ (algebraMap A B) := by
  sorry

/-- Divided powers after localization: `γᴮ_n(x/s) = γ_n(x)/sⁿ`. -/
theorem dpow_localization {B : Type*} [CommRing B] [Algebra A B] (S : Submonoid A)
    [IsLocalization S B] {I : Ideal A} (γ : DividedPowers I)
    (δ : DividedPowers (I.map (algebraMap A B)))
    (hδ : DividedPowers.IsDPMorphism γ δ (algebraMap A B)) (n : ℕ) {x : A} (hx : x ∈ I)
    (s : S) :
    δ.dpow n (IsLocalization.mk' B x s) = IsLocalization.mk' B (γ.dpow n x) (s ^ n) := by
  sorry

/-- The coefficient `c_n`, the image in `A` of `pⁿ/n! ∈ pℤ_(p)`: the factor `p^(n − v_p(n!))`
times the inverse of the prime-to-`p` part of `n!`. In a `ℤ_(p)`-algebra that inverse exists;
`Ring.inverse` returns `0` on non-units, so the formula is only used under that hypothesis. -/
noncomputable def canonicalCoeff (p : ℕ) (A : Type*) [CommRing A] (n : ℕ) : A :=
  (p : A) ^ (n - padicValNat p n.factorial) *
    Ring.inverse ((n.factorial / p ^ padicValNat p n.factorial : ℕ) : A)

example (p : ℕ) (A : Type*) [CommRing A] : canonicalCoeff p A 0 = 1 := by
  simp [canonicalCoeff]

/-- The canonical divided powers on `(p)` in a `ℤ_(p)`-algebra (Stacks, Example 23.2.3), `γ_n(pa) = c_n aⁿ`; the prime
`p = 2` is included and `A` may have `p`-torsion. -/
theorem exists_dividedPowers_span_p (p : ℕ) [Fact p.Prime] (A : Type*) [CommRing A]
    (hA : ∀ n : ℕ, ¬ p ∣ n → IsUnit (n : A)) :
    ∃ γ : DividedPowers (Ideal.span {(p : A)}),
      ∀ (n : ℕ) (a : A), γ.dpow n (p * a) = canonicalCoeff p A n * a ^ n := by
  sorry

/-- Every ring map between `ℤ_(p)`-algebras is a divided power morphism for the canonical
structures on `(p)`. -/
theorem isDPMorphism_canonical (p : ℕ) [Fact p.Prime] {A B : Type*} [CommRing A] [CommRing B]
    (f : A →+* B) (γ : DividedPowers (Ideal.span {(p : A)}))
    (ε : DividedPowers (Ideal.span {(p : B)}))
    (hγ : ∀ (n : ℕ) (a : A), γ.dpow n (p * a) = canonicalCoeff p A n * a ^ n)
    (hε : ∀ (n : ℕ) (b : B), ε.dpow n (p * b) = canonicalCoeff p B n * b ^ n)
    (hA : ∀ n : ℕ, ¬ p ∣ n → IsUnit (n : A)) :
    DividedPowers.IsDPMorphism γ ε f := by
  sorry

/-! ### The divided power algebra and its augmentation ideal -/

section Augmentation

variable (R M : Type*) [CommRing R] [AddCommGroup M] [Module R M]

/-- The augmentation `ε : Γ_R(M) → R`, `dp₀(m) ↦ 1`, `dp_n(m) ↦ 0` for `n > 0`: the lift into the
zero ideal of `R` along the zero map. -/
noncomputable def augmentation : DividedPowerAlgebra R M →ₐ[R] R :=
  DividedPowerAlgebra.lift (dividedPowersBot R) (0 : M →ₗ[R] R) (fun _ ↦ by simp)

/-- The augmentation ideal `Γ_R(M)₊ = ker ε`. -/
noncomputable def augmentationIdeal : Ideal (DividedPowerAlgebra R M) :=
  RingHom.ker (augmentation R M)

/-- The augmentation sends `dp₀(m)` to `1` and `dp_n(m)` to `0` for `n > 0`. -/
example (m : M) : augmentation R M (DividedPowerAlgebra.dp R 0 m) = 1 := by
  sorry

example (n : ℕ) (hn : n ≠ 0) (m : M) : DividedPowerAlgebra.dp R n m ∈ augmentationIdeal R M := by
  sorry

/-- A scalar lies in the augmentation ideal only if it is zero. -/
example (r : R) (hr : algebraMap R (DividedPowerAlgebra R M) r ∈ augmentationIdeal R M) :
    r = 0 := by
  sorry

/-- The canonical divided powers on the augmentation ideal (Stacks, Lemma 23.5.1): the unique
structure with `δ_n(dp₁ m) = dp_n m`. -/
theorem existsUnique_dividedPowers_augmentationIdeal :
    ∃! δ : DividedPowers (augmentationIdeal R M),
      ∀ (n : ℕ) (m : M), δ.dpow n (DividedPowerAlgebra.dp R 1 m) =
        DividedPowerAlgebra.dp R n m := by
  sorry

/-- Degree one does not generate the augmentation ideal in characteristic two: for
`R = ZMod 2` and `M = R`, `dp₂(1)` is not in the ideal generated by the `dp₁(m)`. -/
theorem dp_two_not_mem_span_dp_one :
    DividedPowerAlgebra.dp (ZMod 2) 2 (1 : ZMod 2) ∉
      Ideal.span (Set.range fun m : ZMod 2 ↦ DividedPowerAlgebra.dp (ZMod 2) 1 m) := by
  sorry

end Augmentation

/-! ### The divided power filtration -/

variable {I : Ideal A}

/-- The divided power filtration `Fⁿ_γ I = I^{[n]}`: the ideal generated by the products
`γ_{e₁}(x₁) ⋯ γ_{e_t}(x_t)` with `x_j ∈ I` and `∑ e_j ≥ n`, the empty product included. -/
def pdFiltration (γ : DividedPowers I) (n : ℕ) : Ideal A :=
  Ideal.span {y | ∃ (t : ℕ) (e : Fin t → ℕ) (x : Fin t → A),
    (∀ j, x j ∈ I) ∧ n ≤ ∑ j, e j ∧ y = ∏ j, γ.dpow (e j) (x j)}

/-- `I` is PD nilpotent if some step of its divided power filtration vanishes. -/
def IsPDNilpotent (γ : DividedPowers I) : Prop :=
  ∃ n, n ≠ 0 ∧ pdFiltration γ n = ⊥

theorem pdFiltration_zero (γ : DividedPowers I) : pdFiltration γ 0 = ⊤ := by
  rw [eq_top_iff, ← Ideal.span_singleton_one]
  refine Ideal.span_mono ?_
  rintro _ rfl
  exact ⟨0, Fin.elim0, Fin.elim0, fun j ↦ j.elim0, by simp, by simp⟩

theorem pdFiltration_one (γ : DividedPowers I) : pdFiltration γ 1 = I := by
  sorry

theorem pow_le_pdFiltration (γ : DividedPowers I) (n : ℕ) : I ^ n ≤ pdFiltration γ n := by
  sorry

/-- The zero ideal with its unique divided powers is PD nilpotent. -/
example : IsPDNilpotent (dividedPowersBot A) := by
  sorry

/-- PD nilpotence implies nilpotence of the ideal; the converse fails for `(2) ⊂ ZMod 4`. -/
theorem IsPDNilpotent.isNilpotent {γ : DividedPowers I} (h : IsPDNilpotent γ) :
    IsNilpotent I := by
  sorry

/-! ### Compatibility with a base and divided power envelopes -/

/-- `δ` on `J ⊆ B` is compatible with `γ` on `I ⊆ A` along `φ` (Stacks, Definition 60.4.1): some
divided power structure on `J ⊔ IB` makes `φ` and the identity of `B` divided power morphisms. -/
def IsCompatibleWith {B : Type*} [CommRing B] (φ : A →+* B) (γ : DividedPowers I)
    {J : Ideal B} (δ : DividedPowers J) : Prop :=
  ∃ θ : DividedPowers (J ⊔ I.map φ),
    DividedPowers.IsDPMorphism γ θ φ ∧ DividedPowers.IsDPMorphism δ θ (RingHom.id B)

/-- `(D, J', δ)` with `ι : B → D` is a divided power envelope of `J ⊆ B` relative to `(A, I, γ)`:
`ι(J) ⊆ J'`, `A → D` is a divided power morphism, and every `A`-algebra map `B → C` sending `J` into
a divided power ideal `K` compatible with `γ` factors uniquely through a divided power morphism
`D → C`. -/
structure IsPDEnvelope {B D : Type u} [CommRing B] [CommRing D] [Algebra A B] [Algebra A D]
    (γ : DividedPowers I) (J : Ideal B) {J' : Ideal D} (δ : DividedPowers J') (ι : B →ₐ[A] D) :
    Prop where
  map_le : J.map ι ≤ J'
  isDPMorphism : DividedPowers.IsDPMorphism γ δ (algebraMap A D)
  universal : ∀ (C : Type u) [CommRing C] [Algebra A C] (K : Ideal C) (ε : DividedPowers K),
    DividedPowers.IsDPMorphism γ ε (algebraMap A C) → ∀ g : B →ₐ[A] C, J.map g ≤ K →
      ∃! h : D →ₐ[A] C, DividedPowers.IsDPMorphism δ ε h.toRingHom ∧ h.comp ι = g

/-- Existence of the universal divided power envelope (Stacks, Lemma 60.2.1 and Definition 60.2.2). -/
theorem exists_isPDEnvelope {B : Type u} [CommRing B] [Algebra A B] (γ : DividedPowers I)
    (J : Ideal B) (hJ : I.map (algebraMap A B) ≤ J) :
    ∃ (D : Type u) (_ : CommRing D) (_ : Algebra A D) (J' : Ideal D) (δ : DividedPowers J')
      (ι : B →ₐ[A] D), IsPDEnvelope γ J δ ι := by
  sorry

end PD

/-! ## Layer CR.1: Crystalline sites, structure sheaves and crystals -/

namespace Crystalline

open TensorProduct

/-- A connection on a `B`-module `M` relative to `A`: an additive map `∇ : M → M ⊗_B Ω¹_{B/A}`
with the Leibniz rule `∇(b m) = b ∇m + m ⊗ db`. Integrability and quasi-nilpotence are README
targets (Layer CR.1). -/
structure Connection (A B M : Type*) [CommRing A] [CommRing B] [Algebra A B] [AddCommGroup M]
    [Module B M] where
  /-- The map `∇`. -/
  toFun : M →+ M ⊗[B] Ω[B⁄A]
  leibniz : ∀ (b : B) (m : M),
    toFun (b • m) = b • toFun m + m ⊗ₜ KaehlerDifferential.D A B b

/-- The trivial connection `∇ = d` on `B` itself exists. -/
example (A B : Type*) [CommRing A] [CommRing B] [Algebra A B] :
    Nonempty (Connection A B B) := by
  sorry

end Crystalline

/-! ## Layer CR.4: Ordinary and relative de Rham–Witt complexes -/

namespace Crystalline

open CategoryTheory

/-- A Dieudonné complex (Bhatt–Lurie–Mathew, Definition 2.1.1): a cochain complex of abelian
groups with a graded endomorphism `F` satisfying `d(F x) = p F(d x)`. -/
structure DieudonneComplex (p : ℕ) where
  /-- The underlying cochain complex of abelian groups. -/
  complex : CochainComplex (ModuleCat.{u} ℤ) ℤ
  /-- The Frobenius, degree by degree. -/
  F : ∀ n, Module.End ℤ (complex.X n)
  comm : ∀ n x, (complex.d n (n + 1)).hom (F n x) = p • F (n + 1) ((complex.d n (n + 1)).hom x)

namespace DieudonneComplex

variable {p : ℕ} (M : DieudonneComplex.{u} p)

/-- Saturation (Bhatt–Lurie–Mathew, Definition 2.2.1): `M` is termwise `p`-torsion-free, `F` is
injective, and the image of `F` in degree `n` is `{x | d x ∈ p M^{n+1}}`. -/
def IsSaturated : Prop :=
  (∀ n, Function.Injective (fun x : M.complex.X n ↦ p • x)) ∧
  (∀ n, Function.Injective (M.F n)) ∧
  ∀ n, Set.range (M.F n) =
    {x | ∃ y : M.complex.X (n + 1), (M.complex.d n (n + 1)).hom x = p • y}

/-- On a saturated complex, `p x` lies in the image of `F` for every `x`. -/
theorem IsSaturated.smul_mem_range {M : DieudonneComplex.{u} p} (hM : M.IsSaturated) (n : ℤ)
    (x : M.complex.X n) : p • x ∈ Set.range (M.F n) := by
  rw [hM.2.2 n]
  exact ⟨(M.complex.d n (n + 1)).hom x, by simp⟩

/-- The Verschiebung of a saturated Dieudonné complex: `V x` is the unique `y` with `F y = p x`. -/
noncomputable def verschiebung {M : DieudonneComplex.{u} p} (hM : M.IsSaturated) (n : ℤ)
    (x : M.complex.X n) : M.complex.X n :=
  Classical.choose (hM.smul_mem_range n x)

theorem F_verschiebung {M : DieudonneComplex.{u} p} (hM : M.IsSaturated) (n : ℤ)
    (x : M.complex.X n) : M.F n (verschiebung hM n x) = p • x :=
  Classical.choose_spec (hM.smul_mem_range n x)

theorem verschiebung_F {M : DieudonneComplex.{u} p} (hM : M.IsSaturated) (n : ℤ)
    (x : M.complex.X n) : verschiebung hM n (M.F n x) = p • x := by
  sorry

/-- `F d V = d` on a saturated complex. -/
theorem F_d_verschiebung {M : DieudonneComplex.{u} p} (hM : M.IsSaturated) (n : ℤ)
    (x : M.complex.X n) :
    M.F (n + 1) ((M.complex.d n (n + 1)).hom (verschiebung hM n x)) =
      (M.complex.d n (n + 1)).hom x := by
  sorry

/-- The Verschiebung filtration `N_r M^n = im V^r + im d V^r` (Bhatt–Lurie–Mathew,
Construction 2.5.1), as a subgroup of `M^n`. -/
noncomputable def vFiltration {M : DieudonneComplex.{u} p} (hM : M.IsSaturated) (r : ℕ)
    (n : ℤ) : AddSubgroup (M.complex.X n) :=
  AddSubgroup.closure (Set.range (verschiebung hM n)^[r] ∪
    Set.range fun y : M.complex.X (n - 1) ↦
      (M.complex.d (n - 1) n).hom ((verschiebung hM (n - 1))^[r] y))

theorem vFiltration_zero {M : DieudonneComplex.{u} p} (hM : M.IsSaturated) (n : ℤ) :
    vFiltration hM 0 n = ⊤ := by
  rw [eq_top_iff]
  intro x _
  exact AddSubgroup.subset_closure (Or.inl ⟨x, rfl⟩)

/-- The iterates of `F` on a saturated complex (Bhatt–Lurie–Mathew, Proposition 2.2.5). -/
theorem range_F_iterate {M : DieudonneComplex.{u} p} (hM : M.IsSaturated) (r : ℕ) (n : ℤ) :
    Set.range (M.F n)^[r] =
      {x | ∃ y : M.complex.X (n + 1), (M.complex.d n (n + 1)).hom x = (p ^ r) • y} := by
  sorry

end DieudonneComplex

/-- On a Dieudonné complex with zero differential and `p`-torsion-free terms, saturation is
bijectivity of `F`. -/
example {p : ℕ} (M : DieudonneComplex.{u} p)
    (hp : ∀ n, Function.Injective (fun x : M.complex.X n ↦ p • x))
    (hd : ∀ n, M.complex.d n (n + 1) = 0) :
    M.IsSaturated ↔ ∀ n, Function.Bijective (M.F n) := by
  sorry

end Crystalline

/-! ## Layer CR.5:log-algebra: Logarithmic structures -/

namespace LogCrystalline

open Algebra

/-- A commutative monoid is fine if it is integral (cancellative) and finitely generated. Fine does
not imply saturated. -/
def IsFineMonoid (P : Type*) [CommMonoid P] : Prop :=
  IsCancelMul P ∧ Monoid.FG P

/-- An integral monoid `P` is saturated if `gⁿ ∈ P` with `n > 0` implies `g ∈ P` for every `g` in
the Grothendieck group `P^gp`. -/
def IsSaturatedMonoid (P : Type*) [CommMonoid P] : Prop :=
  IsCancelMul P ∧ ∀ (g : GrothendieckGroup P) (n : ℕ), n ≠ 0 →
    g ^ n ∈ Set.range (GrothendieckGroup.of (M := P)) → g ∈ Set.range (GrothendieckGroup.of (M := P))

/-- A Kummer homomorphism of integral monoids: injective, and every element of the target has a
positive power in the image. -/
def IsKummerHom {P Q : Type*} [CommMonoid P] [CommMonoid Q] (f : P →* Q) : Prop :=
  Function.Injective f ∧ ∀ q : Q, ∃ n : ℕ, n ≠ 0 ∧ q ^ n ∈ Set.range f

/-- A prelog ring: a commutative ring `A`, a commutative monoid `P` and a monoid homomorphism
`α : P → (A, ×)`; elements may map to zero. The monoid is bundled as Mathlib's `CommMonCat`. -/
structure PrelogRing (A : Type u) [CommRing A] where
  /-- The monoid. -/
  P : CommMonCat.{v}
  /-- The structure map. -/
  α : P →* A

/-- A prelog ring is a log ring if `α` restricts to a bijection from `α⁻¹(A^×)` onto `A^×`. -/
def PrelogRing.IsLog {A : Type u} [CommRing A] (L : PrelogRing.{u, v} A) : Prop :=
  Function.Bijective fun m : {m : L.P // IsUnit (L.α m)} ↦ (⟨L.α m, m.2⟩ : {a : A // IsUnit a})

/-- The trivial log structure `A^× → A` is a log ring. -/
example (A : Type u) [CommRing A] :
    (⟨CommMonCat.of Aˣ, Units.coeHom A⟩ : PrelogRing.{u, u} A).IsLog := by
  sorry

/-- The prelog ring `ℕ → A`, `n ↦ aⁿ`, attached to an element `a` (the chart of the log structure
of `a`), is not a log ring when `a` is a unit other than `1` of infinite order. -/
example (A : Type u) [CommRing A] :
    ¬ (⟨CommMonCat.of (Multiplicative ℕ), powersHom A (-1 : A)⟩ : PrelogRing.{u, 0} A).IsLog ∨
      (2 : A) = 0 := by
  sorry

/-- The free monoid on one generator (written `Multiplicative ℕ`) is fine and saturated. -/
example : IsFineMonoid (Multiplicative ℕ) ∧ IsSaturatedMonoid (Multiplicative ℕ) := by
  sorry

/-- The numerical monoid generated by `2` and `3` is fine but not saturated: `t` is not in it
although `t²` is. -/
example : IsFineMonoid (Submonoid.closure
      ({Multiplicative.ofAdd 2, Multiplicative.ofAdd 3} : Set (Multiplicative ℕ))) ∧
    ¬ IsSaturatedMonoid (Submonoid.closure
      ({Multiplicative.ofAdd 2, Multiplicative.ofAdd 3} : Set (Multiplicative ℕ))) := by
  sorry

/-- The `n`-th power map of `ℕ` is Kummer for `n ≠ 0`; Kummer fails for the zero map. -/
example (n : ℕ) (hn : n ≠ 0) : IsKummerHom (powMonoidHom n : Multiplicative ℕ →* Multiplicative ℕ) := by
  sorry

end LogCrystalline

/-! ## Layer CR.6: Hyodo–Kato complexes and semistable structure -/

namespace LogCrystalline

open WittVector
open scoped Isocrystal

variable (p : ℕ) [Fact p.Prime] (k : Type*) [Field k] [CharP k p] [PerfectRing k p]

set_option backward.isDefEq.respectTransparency.types false in
/-- A `(φ, N)`-module over `K₀ = W(k)[1/p]`: an isocrystal with a `K₀`-linear monodromy operator
satisfying `N φ = p φ N`, the relation of the Hyodo–Kato operators. -/
structure PhiNModule (V : Type*) [AddCommGroup V] [Isocrystal p k V] where
  /-- The monodromy operator. -/
  N : V →ₗ[K(p, k)] V
  N_frobenius : ∀ x : V, N (Isocrystal.frobenius p k (V := V) x) =
    (p : K(p, k)) • Isocrystal.frobenius p k (V := V) (N x)

set_option backward.isDefEq.respectTransparency.types false in
/-- Zero monodromy gives a `(φ, N)`-module (the good-reduction case). -/
example (V : Type*) [AddCommGroup V] [Isocrystal p k V] : Nonempty (PhiNModule p k V) :=
  ⟨⟨0, fun x ↦ by simp⟩⟩

/-- Nilpotence of the monodromy (Layer CR.6, *Nilpotence of Hyodo–Kato monodromy*): on a
finite-dimensional `(φ, N)`-module, `N ^ dim = 0`. -/
theorem PhiNModule.N_pow_finrank_eq_zero {V : Type*} [AddCommGroup V] [Isocrystal p k V]
    [FiniteDimensional K(p, k) V] (D : PhiNModule p k V) :
    D.N ^ Module.finrank K(p, k) V = 0 := by
  sorry

end LogCrystalline

/-!
## Targets stated in the README only

The following targets need carriers that do not exist at the pins and are specified in the
README with their intended signatures: the universal divided power envelope as a ring, its
completion and `A_cris` (Layer CR.0); PD schemes, the small, big and étale crystalline sites,
crystals, isocrystals and F-crystals, PD stratifications and quasi-nilpotent connections
(Layer CR.1); `Ru_{X/S,*}`, linearization, the PD Poincaré lemma and the de Rham computation
(Layer CR.2); descent, base change, perfectness, cup products, Künneth, Chern classes, Frobenius
and weak Lefschetz (Layers CR.3 and CR.3:Frobenius-isogeny); saturation as a functor, strict
completion, `W_r(M)`, Dieudonné algebras and the saturated, classical and relative de Rham–Witt
complexes, the crystalline comparison, slope spectral sequence, Nygaard filtration and
logarithmic Hodge–Witt sheaves (Layer CR.4); the crystalline trace and duality (Layer
CR.3:duality); log structures on schemes, charts, log smoothness, divisorial log structures and
log regularity (Layer CR.5:log-algebra); log differentials, log PD envelopes, the log crystalline
site and log crystalline cohomology (Layer CR.5); Hyodo–Kato complexes, the Hyodo–Kato map,
convergent and log rigid complexes (Layer CR.6); crystalline coefficients, the Dieudonné crystal,
Grothendieck–Messing, relative direct images and Gauss–Manin (Layer CR.7).
-/

end TauCetiRoadmap.CrystallineCohomology
