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

#check Perfection.teichmuller₀
#check Perfection.mk_teichmuller₀
#check PerfectionMap.id

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

/-! ## Layer CR.3:duality: Trace and Poincaré duality -/

namespace Crystalline

/-- The trace-normalization sign for the Čech differential `δ + (−1)^r d` and cup
sign `(−1)^(s t)` on bidegrees `(r,s)` and `(t,u)`: `h^d = cechTraceSign d • [ω]`. -/
def cechTraceSign (d : ℕ) : ℤ := (-1) ^ (d * (d - 1) / 2)

example : cechTraceSign 0 = 1 := by norm_num [cechTraceSign]
example : cechTraceSign 1 = 1 := by norm_num [cechTraceSign]
example : cechTraceSign 2 = -1 := by norm_num [cechTraceSign]

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
def IsKummerHom {P Q : Type*} [CommMonoid P] [CommMonoid Q] [IsCancelMul P] [IsCancelMul Q] (f : P →* Q) : Prop :=
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

/-- The prelog chart `n ↦ (−1)ⁿ` is not a log ring, including in characteristic two:
`0` and `2` are distinct monoid elements with the same unit image `1`. -/
example (A : Type u) [CommRing A] :
    ¬ (⟨CommMonCat.of (Multiplicative ℕ), powersHom A (-1 : A)⟩ : PrelogRing.{u, 0} A).IsLog := by
  sorry

/-- The collision in the preceding negative control persists in characteristic two. -/
example : (-1 : ZMod 2) ^ 0 = (-1 : ZMod 2) ^ 2 := by norm_num

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

/-- The zero power map fails injectivity on the free monoid, so it is not Kummer. -/
example : ¬ IsKummerHom (powMonoidHom 0 : Multiplicative ℕ →* Multiplicative ℕ) := by
  intro h
  have heq : Multiplicative.ofAdd 0 = Multiplicative.ofAdd 1 := h.1 (by simp)
  have hnat : (0 : ℕ) = 1 := congrArg Multiplicative.toAdd heq
  norm_num at hnat

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

/-- Coefficients of the two-term witness `x ↦ dx` for the signed inclusion
`C[−1] → C̃`: the two negative signs cancel. Raw right wedge fails this equality. -/
example : (1 : ℚ) = (-1) * (-1) ∧ (1 : ℚ) ≠ 1 * (-1) := by norm_num

/-- A rational coefficient witness for the direction `N φ = p φ N` at `p=2`:
`φ(a,b)=(a,2b)`, `N(a,b)=(b,0)`. -/
example (a b : ℚ) :
    let φ : ℚ × ℚ → ℚ × ℚ := fun x ↦ (x.1, 2 * x.2)
    let N : ℚ × ℚ → ℚ × ℚ := fun x ↦ (x.2, 0)
    N (φ (a, b)) = 2 • φ (N (a, b)) := by
  simp

/-- The reversed relation fails on the vector `(0,1)` of the same block. -/
example :
    let φ : ℚ × ℚ → ℚ × ℚ := fun x ↦ (x.1, 2 * x.2)
    let N : ℚ × ℚ → ℚ × ℚ := fun x ↦ (x.2, 0)
    φ (N (0, 1)) ≠ 2 • N (φ (0, 1)) := by
  norm_num

end LogCrystalline

/-!
## Definitions and constructions stated in the README

The sites, coefficient categories, envelopes, completions and cohomology functors below have their
intended signatures and APIs in the README. Their carriers are supplied by the mathematical
constructions there; this file records only the light definitions statable at the pins.


Layer CR.0: Additive divided-power candidates; Divided powers from identities on generators;
Convolution of two divided-power systems; The candidate on the sum of compatible ideals; Divided
powers on a compatible sum of ideals; Extension of divided powers on a principal ideal; The
scalar-extension coefficient formula; The additive candidate on a flat extension; Flat extension
of divided powers; Augmentation of the divided power algebra; Augmentation ideal; Scalar and
augmentation splitting; Divided power filtration; PD-nilpotent divided power ideals and ordinary
nilpotence; Canonical divided powers on the ideal generated by p; Compatibility of divided powers
with a base; Canonical divided powers on the augmentation ideal; Relative divided power polynomial
algebras; Divided powers on a square-zero extension; Universal base-compatible divided power
envelope; Completed PD envelopes and the derived-completion comparison; The crystalline period
ring A_cris of a p-adically complete ring.

Layer CR.1: Schemes with a quasi-coherent PD ideal; Small and big crystalline sites; Morphisms and
comparisons of crystalline sites; The étale crystalline sites; Structure, quotient and PD-ideal
sheaves; Quasi-coherent and finite locally free crystals; Rational crystals and nondegenerate
F-crystals; Universal PD differentials and the PD de Rham complex; Modules with integrable
connection and their de Rham complexes; PD stratifications on a smooth lift; Integrable
topologically quasi-nilpotent connections.

Layer CR.2: Enhanced crystalline direct image and global sections; Crystalline linearization along
a smooth embedding; Linearization in a smooth ambient scheme.

Layer CR.3: The crystalline first Chern class and the hyperplane class; Crystalline cup products;
Semilinear crystalline Frobenius and linearization.

Layer CR.4: Principal p-décalage on torsion-free complexes; Dieudonné complexes; Saturated
Frobenius; Verschiebung and the differential; Morphisms of Dieudonné complexes; Bockstein
reduction of principal p-décalage; Derived p-décalage and completion; Saturation by iterated
décalage; The Verschiebung filtration; Finite Verschiebung quotient complex; Projection to the
finite quotient; Restriction between finite quotients; Frobenius on finite quotients; Verschiebung
on finite quotients; Functorial finite quotients; Completion of a saturated Dieudonné complex;
Strict Dieudonné complexes; Strict Dieudonné towers; Canonical divided powers on the Verschiebung
ideal of W_r(R); Dieudonné algebras and multiplicative quotients; Universal saturated de Rham–Witt
complex; Relative Frobenius–Verschiebung procomplexes; Initial relative de Rham–Witt complex;
Classical de Rham–Witt complex as the initial V-pro-complex; Continuous relative de Rham–Witt
complex; Nygaard filtration and divided Frobenius; Logarithmic Hodge–Witt sheaves.

Layer CR.3:duality: Proper smooth crystalline trace; Finite étale crystalline transfer and trace;
Proper smooth crystalline Gysin maps; Diagonal class and crystalline coevaluation.

Layer CR.5:log-algebra: Prelog rings; Étale log structures; Associated log structures; Inverse
image log structures; Characteristic monoids; Integral monoids; Fine monoids; Saturated monoids;
Log charts; Strict morphisms; Exact morphisms; Integral morphisms; Kummer morphisms; Log fiber
products; Log smooth morphisms; Divisorial log structures; Log regular schemes; Integral
quasi-coherent log schemes; Vertical logarithmic morphisms; Log smoothness by fine models;
Valuation log structures and tilt charts; Log structures on semistable formal charts.

Layer CR.5: Logarithmic differentials; Log de Rham complexes; Absolute semistable residue maps;
Morphisms of Cartier type; Exactification of log immersions; Fine log PD envelopes; Quasi-coherent
log PD envelopes; Exact log PD thickenings; PD smooth log thickenings; Log crystalline sites;
Logarithmic crystals; Log PD stratifications; Integrable logarithmic connections; Logarithmic
quasi-nilpotence; Filtered logarithmic PD de Rham complexes; Derived p-adic log crystalline
cohomology; The induced log structure on A_cris.

Layer CR.6: Standard log Witt bases; Integral Hyodo–Kato complexes; Rational Hyodo–Kato complexes;
Hyodo–Kato Frobenius; Hyodo–Kato monodromy; Normalized logarithms of units; Uniformizer-dependent
Hyodo–Kato maps; Convergent logarithmic embedding complexes; Proper support on open analytic
tubes; Semistable logarithmic Witt models; Witt comparison maps with proper support; Hyodo–Kato
cohomology of Stein curves; Hyodo–Kato cohomology of semistable curve towers.

Layer CR.7: Finite projective crystalline coefficients; Filtered Frobenius coefficients on
semistable models; The crystalline Dieudonné crystal of a Barsotti–Tate group; Relative
crystalline direct images; Relative Gauss–Manin connections.

Layer CR.1 also includes `Crystalline.CrisFppfSite`, `Crystalline.CrisCompatibleSite`,
`Crystalline.CrisCompatibleEtaleSite` and `Crystalline.CrisCompatibleFppfSite`.
Layer CR.6 includes log rigid Hyodo–Kato cohomology; Layer CR.5:log-algebra includes the classical
normalization and tame Kummer comparison used in the logarithmic Abhyankar lemma.
-/

end TauCetiRoadmap.CrystallineCohomology
