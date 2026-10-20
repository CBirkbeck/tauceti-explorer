import Mathlib

/-!
# DrinfeldModulesAndTModules: representative target signatures

The roadmap is `README.md`; this file records definitions and theorem signatures that can be
stated against the pinned Mathlib and Tau Ceti APIs. It is not exhaustive: most targets of the
roadmap (relative families, torsion group schemes, moduli, motives, elliptic sheaves, the field
`C_∞`, the Tannakian category of t-motives) have carriers that do not exist at the pins and are
stated only in the README.

Design choices made explicit here:
* the twisted polynomial ring `R{τ}` is Mathlib's `SkewPolynomial R` for the action of
  `Multiplicative ℕ` by iterates of the `F`-algebra Frobenius `x ↦ x ^ q`
  (`FiniteField.frobeniusAlgHom`), packaged as the type synonym `OrePolynomial F R`;
* a Drinfeld module over a field is a ring map `A →+* L{τ}` that is the identity on `F`, has
  differential `γ` and is not scalar; the rank is a theorem, not a field;
* analytic signatures use a complete nonarchimedean field `K` with an element `θ` of norm `q`;
  the transcendence signatures also assume `K` algebraically closed (README Conventions);
* the semilinear algebra of difference equations is stated for an `F`-linear map
  `f : V →ₗ[F] V` with `f (a • v) = σ a • f v`.
-/

namespace TauCetiRoadmap.DrinfeldModulesAndTModules

open Polynomial
open scoped TensorProduct

noncomputable section

/-! ## Layer DM.0: Drinfeld modules, relative families and Carlitz arithmetic -/

section Ore

variable (F R : Type*) [Field F] [Fintype F] [CommRing R] [Algebra F R]

/-- The action of `Multiplicative ℕ` on an `F`-algebra by iterates of the `q`-Frobenius
`x ↦ x ^ q`, `q = #F`. It is the twisting endomorphism of the twisted polynomial ring `R{τ}`. -/
@[reducible] noncomputable def frobeniusAction : MulSemiringAction (Multiplicative ℕ) R where
  smul n x := ((FiniteField.frobeniusAlgHom F R : R →+* R) ^ (Multiplicative.toAdd n)) x
  one_smul x := by
    change ((FiniteField.frobeniusAlgHom F R : R →+* R) ^ Multiplicative.toAdd
      (1 : Multiplicative ℕ)) x = x
    rw [toAdd_one, pow_zero]
    rfl
  mul_smul m n x := by
    change ((FiniteField.frobeniusAlgHom F R : R →+* R) ^ (Multiplicative.toAdd m +
      Multiplicative.toAdd n)) x = _
    rw [pow_add]
    rfl
  smul_zero n := map_zero _
  smul_add n x y := map_add _ x y
  smul_one n := map_one _
  smul_mul n x y := map_mul _ x y

/-- The twisted polynomial ring `R{τ}`: polynomials in `τ` with `τ c = c ^ q τ`, realized as
Mathlib's `SkewPolynomial R` for `frobeniusAction F R`. -/
def OrePolynomial (F R : Type*) [Field F] [Fintype F] [CommRing R] [Algebra F R] : Type _ :=
  SkewPolynomial R

namespace OrePolynomial

noncomputable instance : Ring (OrePolynomial F R) :=
  letI := frobeniusAction F R
  inferInstanceAs (Ring (SkewPolynomial R))

variable {F R}

/-- The variable `τ`. -/
noncomputable def tau : OrePolynomial F R := (SkewPolynomial.X : SkewPolynomial R)

/-- The constants `R → R{τ}`. -/
noncomputable def C : R →+* OrePolynomial F R :=
  letI := frobeniusAction F R
  (SkewPolynomial.CRingHom : R →+* SkewPolynomial R)

/-- The coefficient of `τ ^ n`. -/
noncomputable def coeff (f : OrePolynomial F R) (n : ℕ) : R :=
  SkewPolynomial.coeff (show SkewPolynomial R from f) n

/-- The `τ`-degree, `0` for the zero polynomial. -/
noncomputable def natDegree (f : OrePolynomial F R) : ℕ :=
  (SkewPolynomial.support (show SkewPolynomial R from f)).sup id

/-- The defining commutation rule `τ c = c ^ q τ` of `R{τ}`. -/
theorem tau_mul_C (c : R) : (tau : OrePolynomial F R) * C c = C (c ^ Fintype.card F) * tau := by
  sorry

example : coeff (tau : OrePolynomial F R) 1 = 1 := by
  simp [coeff, tau]

example (c : R) : coeff (C c : OrePolynomial F R) 0 = c := by
  change SkewPolynomial.coeff (SkewPolynomial.C c) 0 = c
  exact SkewPolynomial.coeff_C_zero

example [Nontrivial R] : natDegree (tau : OrePolynomial F R) = 1 := by
  let _ := frobeniusAction F R
  change (SkewPolynomial.X : SkewPolynomial R).support.sup id = 1
  rw [SkewPolynomial.support_X]
  simp

end OrePolynomial

end Ore

/-- A Drinfeld `A`-module over a field `L` with characteristic map `γ`: a ring map
`φ : A → L{τ}`, `a ↦ φ_a`, that is the identity on the constants `F`, has differential
`∂φ_a = γ a`, and is not the scalar map. The rank is the theorem
`DrinfeldModule.exists_rank`, not a field of the structure (README §0.1, §0.3). -/
structure DrinfeldModule (F A L : Type*) [Field F] [Fintype F] [CommRing A] [Algebra F A]
    [Field L] [Algebra F L] (γ : A →ₐ[F] L) where
  /-- The action `a ↦ φ_a`. -/
  toRingHom : A →+* OrePolynomial F L
  map_algebraMap' : ∀ c : F, toRingHom (algebraMap F A c) = OrePolynomial.C (algebraMap F L c)
  coeff_zero' : ∀ a : A, (toRingHom a).coeff 0 = γ a
  exists_ne_C' : ∃ a : A, toRingHom a ≠ OrePolynomial.C (γ a)

namespace DrinfeldModule

variable {F A L : Type*} [Field F] [Fintype F] [CommRing A] [Algebra F A] [Field L]
  [Algebra F L] {γ : A →ₐ[F] L}

instance : CoeFun (DrinfeldModule F A L γ) (fun _ => A → OrePolynomial F L) :=
  ⟨fun φ => φ.toRingHom⟩

/-- The characteristic `ker γ`. -/
def charIdeal (_φ : DrinfeldModule F A L γ) : Ideal A := RingHom.ker γ

/-- Morphisms `φ → ψ`: twisted polynomials `u` with `u φ_a = ψ_a u` for all `a`
(README §0.6). -/
def Hom (φ ψ : DrinfeldModule F A L γ) : AddSubgroup (OrePolynomial F L) where
  carrier := {u | ∀ a : A, u * φ a = ψ a * u}
  add_mem' {u v} hu hv a := by rw [add_mul, mul_add, hu a, hv a]
  zero_mem' a := by rw [zero_mul, mul_zero]
  neg_mem' {u} hu a := by rw [neg_mul, mul_neg, hu a]

/-- An isogeny is a nonzero morphism. -/
def IsIsogeny {φ ψ : DrinfeldModule F A L γ} (u : Hom φ ψ) : Prop := (u : OrePolynomial F L) ≠ 0

example (φ : DrinfeldModule F A L γ) : (0 : OrePolynomial F L) ∈ Hom φ φ := by
  intro a
  simp

example (φ : DrinfeldModule F A L γ) : (1 : OrePolynomial F L) ∈ Hom φ φ := by
  intro a
  simp

example (φ : DrinfeldModule F A L γ) : ¬ IsIsogeny (0 : Hom φ φ) := by
  simp [IsIsogeny]

example (φ : DrinfeldModule F A L γ) :
    IsIsogeny (⟨1, by intro a; simp⟩ : Hom φ φ) := by
  let _ := frobeniusAction F L
  change (1 : SkewPolynomial L) ≠ 0
  exact one_ne_zero

/-- **The rank theorem over the polynomial ring** (README §0.2): for `A = F[X]`, the
`τ`-degree of `φ_a` is `deg_τ φ_X · deg a`. -/
theorem natDegree_eq_rank_mul {γ : F[X] →ₐ[F] L} (φ : DrinfeldModule F F[X] L γ) {a : F[X]}
    (ha : a ≠ 0) : (φ a).natDegree = (φ X).natDegree * a.natDegree := by
  sorry

/-- Rank is positive over the polynomial ring: `φ_X` is not a constant (README §0.4). -/
theorem natDegree_X_pos {γ : F[X] →ₐ[F] L} (φ : DrinfeldModule F F[X] L γ) :
    0 < (φ X).natDegree := by
  sorry

end DrinfeldModule


section CarlitzModule

variable (F : Type*) [Field F] [Fintype F] {L : Type*} [Field L] [Algebra F L]

theorem commute_C_carlitz (θ : L) (c : F) :
    Commute ((OrePolynomial.C : L →+* OrePolynomial F L).comp (algebraMap F L) c)
      (OrePolynomial.C θ + OrePolynomial.tau) := by
  sorry

/-- **The Carlitz module** `C_t = θ + τ` over `F[X]`, for the characteristic map `X ↦ θ`
(README §0.5). -/
def carlitz (θ : L) : DrinfeldModule F F[X] L (Polynomial.aeval θ) where
  toRingHom := Polynomial.eval₂RingHom' ((OrePolynomial.C : L →+* OrePolynomial F L).comp
    (algebraMap F L)) (OrePolynomial.C θ + OrePolynomial.tau) (commute_C_carlitz F θ)
  map_algebraMap' c := by sorry
  coeff_zero' a := by sorry
  exists_ne_C' := by sorry

example (θ : L) : (carlitz F θ) X = OrePolynomial.C θ + OrePolynomial.tau := by
  show (carlitz F θ).toRingHom X = _
  simp [carlitz]

example : (X : F[X]) ∈ DrinfeldModule.charIdeal (carlitz F (0 : L)) := by
  change (Polynomial.aeval (0 : L)) X = 0
  simp

example {θ : L} (hθ : θ ≠ 0) :
    (X : F[X]) ∉ DrinfeldModule.charIdeal (carlitz F θ) := by
  change (Polynomial.aeval θ) X ≠ 0
  simpa using hθ

/-- The Carlitz module has rank one: `deg_τ C_X = 1`. -/
theorem carlitz_rank (θ : L) : ((carlitz F θ) X).natDegree = 1 := by
  sorry

end CarlitzModule

section Carlitz

variable (F : Type*) [Field F] [Fintype F] {R : Type*} [CommRing R] [Algebra F R]

/-- `[i] = θ ^ (q ^ i) - θ` (README §0.11). -/
def carlitzBracket (θ : R) (i : ℕ) : R := θ ^ (Fintype.card F ^ i) - θ

/-- `D_i = ∏_{j < i} (θ ^ (q ^ i) - θ ^ (q ^ j))`, with `D_0 = 1`. -/
def carlitzD (θ : R) (i : ℕ) : R :=
  ∏ j ∈ Finset.range i, (θ ^ (Fintype.card F ^ i) - θ ^ (Fintype.card F ^ j))

/-- `ℓ_i = ∏_{1 ≤ j ≤ i} (θ - θ ^ (q ^ j))`, with `ℓ_0 = 1`. -/
def carlitzEll (θ : R) (i : ℕ) : R :=
  ∏ j ∈ Finset.range i, (θ - θ ^ (Fintype.card F ^ (j + 1)))

example (θ : R) : carlitzBracket F θ 0 = 0 := by
  simp [carlitzBracket]

example (θ : R) : carlitzBracket F θ 1 = θ ^ Fintype.card F - θ := by
  simp [carlitzBracket]

theorem carlitzD_succ (θ : R) (i : ℕ) :
    carlitzD F θ (i + 1) = carlitzBracket F θ (i + 1) * carlitzD F θ i ^ Fintype.card F := by
  sorry

theorem carlitzEll_succ (θ : R) (i : ℕ) :
    carlitzEll F θ (i + 1) = -carlitzBracket F θ (i + 1) * carlitzEll F θ i := by
  sorry

example (θ : R) : carlitzD F θ 0 = 1 ∧ carlitzEll F θ 0 = 1 := by
  simp [carlitzD, carlitzEll]

example (θ : R) : carlitzEll F θ 1 = -(carlitzD F θ 1) := by
  simp [carlitzD, carlitzEll]

end Carlitz


/-! ## Layer DM.2: Analytic uniformization and period conventions -/

/-- The coefficientwise twist of power series by a ring automorphism `σ` of the coefficients; it
fixes the variable (README §2.1). For the inverse `q`-Frobenius of a perfect field this is the
twist `f ↦ f^(-1)` of the difference equations of Layer DM.8. -/
def coefficientTwist {𝒞 : Type*} [CommRing 𝒞] (σ : 𝒞 ≃+* 𝒞) :
    PowerSeries 𝒞 ≃+* PowerSeries 𝒞 where
  toFun := PowerSeries.map σ.toRingHom
  invFun := PowerSeries.map σ.symm.toRingHom
  left_inv f := by ext n; simp
  right_inv f := by ext n; simp
  map_mul' := map_mul _
  map_add' := map_add _

example {𝒞 : Type*} [CommRing 𝒞] (σ : 𝒞 ≃+* 𝒞) :
    coefficientTwist σ PowerSeries.X = PowerSeries.X := by
  simp [coefficientTwist]

example {𝒞 : Type*} [CommRing 𝒞] (σ : 𝒞 ≃+* 𝒞) (c : 𝒞) :
    coefficientTwist σ (PowerSeries.C c) = PowerSeries.C (σ c) := by
  simp [coefficientTwist]

section Analytic

variable (F : Type*) [Field F] [Fintype F]
  {K : Type*} [NontriviallyNormedField K] [IsUltrametricDist K] [CompleteSpace K] [Algebra F K]

/-- The Carlitz exponential `exp_C(z) = Σ_i z ^ (q ^ i) / D_i` (README §2.8). -/
def carlitzExp (θ z : K) : K := ∑' i : ℕ, z ^ (Fintype.card F ^ i) / carlitzD F θ i

/-- The Carlitz logarithm `log_C(z) = Σ_i z ^ (q ^ i) / ℓ_i` (README §2.8). -/
def carlitzLog (θ z : K) : K := ∑' i : ℕ, z ^ (Fintype.card F ^ i) / carlitzEll F θ i

/-- The Carlitz period `π = θ ρ ∏_{i ≥ 1} (1 - θ ^ (1 - q ^ i))⁻¹`, for a chosen root
`ρ ^ (q - 1) = -θ` (README §2.9). -/
def carlitzPeriod (θ ρ : K) : K :=
  θ * ρ * ∏' i : ℕ, (1 - θ / θ ^ (Fintype.card F ^ (i + 1)))⁻¹

example (θ : K) : carlitzExp F θ 0 = 0 := by
  have hq : Fintype.card F ≠ 0 := Fintype.card_ne_zero
  simp [carlitzExp, zero_pow (pow_ne_zero _ hq)]

example (θ : K) : carlitzLog F θ 0 = 0 := by
  have hq : Fintype.card F ≠ 0 := Fintype.card_ne_zero
  simp [carlitzLog, zero_pow (pow_ne_zero _ hq)]

example (θ ρ c : K) : carlitzPeriod F θ (c * ρ) = c * carlitzPeriod F θ ρ := by
  unfold carlitzPeriod
  ring

/-- `exp_C` is entire: its series converges everywhere when `‖θ‖ = q`. -/
theorem carlitzExp_summable (θ : K) (hθ : ‖θ‖ = Fintype.card F) (z : K) :
    Summable fun i : ℕ => z ^ (Fintype.card F ^ i) / carlitzD F θ i := by
  sorry

/-- The Carlitz functional equation `exp_C(θ z) = θ exp_C(z) + exp_C(z) ^ q`. -/
theorem carlitzExp_functionalEquation (θ : K) (hθ : ‖θ‖ = Fintype.card F) (z : K) :
    carlitzExp F θ (θ * z) = θ * carlitzExp F θ z + carlitzExp F θ z ^ Fintype.card F := by
  sorry

/-- The logarithm series converges exactly on the open disc `‖z‖ < q ^ (q / (q - 1))`. -/
theorem carlitzLog_summable_iff (θ : K) (hθ : ‖θ‖ = Fintype.card F) (z : K) :
    (Summable fun i : ℕ => z ^ (Fintype.card F ^ i) / carlitzEll F θ i) ↔
      ‖z‖ < (Fintype.card F : ℝ) ^ ((Fintype.card F : ℝ) / ((Fintype.card F : ℝ) - 1)) := by
  sorry

/-- `log_C` inverts `exp_C` on the disc of convergence. -/
theorem carlitzExp_carlitzLog (θ : K) (hθ : ‖θ‖ = Fintype.card F) {z : K}
    (hz : ‖z‖ < (Fintype.card F : ℝ) ^ ((Fintype.card F : ℝ) / ((Fintype.card F : ℝ) - 1))) :
    carlitzExp F θ (carlitzLog F θ z) = z := by
  sorry

/-- **The Carlitz period** generates the kernel of `exp_C` as an `F[θ]`-module. -/
theorem carlitzExp_eq_zero_iff (θ : K) (hθ : ‖θ‖ = Fintype.card F) {ρ : K}
    (hρ : ρ ^ (Fintype.card F - 1) = -θ) (z : K) :
    carlitzExp F θ z = 0 ↔ ∃ a : F[X], z = Polynomial.aeval θ a * carlitzPeriod F θ ρ := by
  sorry

theorem norm_carlitzPeriod (θ : K) (hθ : ‖θ‖ = Fintype.card F) {ρ : K}
    (hρ : ρ ^ (Fintype.card F - 1) = -θ) :
    ‖carlitzPeriod F θ ρ‖ =
      (Fintype.card F : ℝ) ^ ((Fintype.card F : ℝ) / ((Fintype.card F : ℝ) - 1)) := by
  sorry

end Analytic

/-! ## Layer DM.4: Anderson modules, effective motives and dual conventions -/

section TModules

variable (F : Type*) [Field F] [Fintype F] {L : Type*} [Field L] [Algebra F L]

/-- The `n`-dimensional Carlitz tensor power `Φ_t = θ I + N_n + E_{n,1} τ`, with `N_n` the
superdiagonal nilpotent matrix and `E_{n,1}` the bottom-left matrix unit (README §4.7). -/
def carlitzTensor (θ : L) (n : ℕ) : Matrix (Fin n) (Fin n) (OrePolynomial F L) :=
  fun i j => (if i = j then OrePolynomial.C θ else 0) + (if (j : ℕ) = i + 1 then 1 else 0) +
    (if (i : ℕ) + 1 = n ∧ (j : ℕ) = 0 then OrePolynomial.tau else 0)

/-- For `n = 1` the Carlitz tensor power is the Carlitz module `θ + τ`. -/
example (θ : L) : carlitzTensor F θ 1 0 0 = OrePolynomial.C θ + OrePolynomial.tau := by
  simp [carlitzTensor]

/-- For `n = 2` the first row is `(θ, 1)`: the superdiagonal is part of the differential. -/
example (θ : L) : carlitzTensor F θ 2 0 1 = 1 := by
  simp [carlitzTensor]

end TModules

/-! ## Layer DM.6: Euler values, regulators and Taelman class modules -/

section Taelman

variable (F : Type*) [Field F] [Fintype F]

/-- The monic cardinality `|M| = det(T - t_M)` of an `F[X]`-module that is finite-dimensional over
`F` (README §6.1); `#M = q ^ deg |M|`. -/
def finiteModuleCardinality (M : Type*) [AddCommGroup M] [Module F[X] M] [Module F M]
    [IsScalarTower F F[X] M] [Module.Finite F M] [Module.Free F M] : F[X] :=
  LinearMap.charpoly ((LinearMap.lsmul F[X] M (X : F[X])).restrictScalars F)

example (M : Type*) [AddCommGroup M] [Module F[X] M] [Module F M]
    [IsScalarTower F F[X] M] [Module.Finite F M] [Module.Free F M] [Subsingleton M] :
    finiteModuleCardinality F M = 1 := by
  have hz : ((LinearMap.lsmul F[X] M (X : F[X])).restrictScalars F) = 0 :=
    Subsingleton.elim _ _
  simp [finiteModuleCardinality, hz, LinearMap.charpoly_zero, Module.finrank_zero_of_subsingleton]

/-- The cardinality of a cyclic module `F[X]/(a)` with `a` monic is `a` itself. -/
theorem finiteModuleCardinality_quotient (a : F[X]) (ha : a.Monic) [Module.Finite F (F[X] ⧸ Ideal.span {a})]
    [Module.Free F (F[X] ⧸ Ideal.span {a})] :
    finiteModuleCardinality F (F[X] ⧸ Ideal.span {a}) = a := by
  sorry

/-- **Depth-one Carlitz power sums** (README §6.12): for `1 ≤ s ≤ q`, the sum of `a ^ (-s)` over
monic `a` of degree `d` is `ℓ_d ^ (-s)`, in `F(θ)` with `θ = X`. -/
theorem carlitzPowerSum_eq (d s : ℕ) (hs : 1 ≤ s) (hsq : s ≤ Fintype.card F) :
    ∑ᶠ (a : F[X]) (_ : a.Monic ∧ a.natDegree = d), ((algebraMap F[X] (RatFunc F) a)⁻¹) ^ s =
      ((carlitzEll F (RatFunc.X : RatFunc F) d)⁻¹) ^ s := by
  sorry

/-- **Taelman's class formula for the Carlitz module** (README §§6.12–6.13): `ζ_A(1) = log_C(1)`,
the sum over monic `a ∈ F[θ]` of `a⁻¹`. -/
theorem tsum_monic_inv_eq_carlitzLog_one {K : Type*} [NontriviallyNormedField K]
    [IsUltrametricDist K] [CompleteSpace K] [Algebra F K] (θ : K) (hθ : ‖θ‖ = Fintype.card F) :
    ∑' a : {p : F[X] // p.Monic}, (Polynomial.aeval θ (a : F[X]))⁻¹ = carlitzLog F θ 1 := by
  sorry

end Taelman

/-! ## Layer DM.8: Rigid analytic motives, periods and Carlitz logarithms -/

section Semilinear

variable {F L V : Type*} [Field F] [Field L] [Algebra F L] [AddCommGroup V] [Module L V]
  [Module F V] [IsScalarTower F L V]

/-- Exact constants: the fixed field of `σ` is exactly the image of `F`. -/
def HasExactConstants (σ : L ≃ₐ[F] L) : Prop :=
  ∀ a : L, σ a = a ↔ a ∈ Set.range (algebraMap F L)

example : HasExactConstants (AlgEquiv.refl : F ≃ₐ[F] F) := by
  intro a
  simp

example : ¬ HasExactConstants (AlgEquiv.refl : ℂ ≃ₐ[ℝ] ℂ) := by
  intro h
  obtain ⟨a, ha⟩ := (h Complex.I).mp rfl
  have hi := congrArg Complex.im ha
  simp at hi

/-- `f` is `σ`-semilinear: `f (a • v) = σ a • f v`. -/
def IsSemilinear (σ : L ≃ₐ[F] L) (f : V →ₗ[F] V) : Prop :=
  ∀ (a : L) (v : V), f (a • v) = σ a • f v

example (σ : L ≃ₐ[F] L) : IsSemilinear σ σ.toLinearMap := by
  intro a v
  exact map_mul σ a v

example (σ : L ≃ₐ[F] L) :
    IsSemilinear σ (LinearMap.id : L →ₗ[F] L) ↔ σ = AlgEquiv.refl := by
  constructor
  · intro h
    ext a
    have ha := h a 1
    change σ a = a
    simpa only [LinearMap.id_apply, smul_eq_mul, mul_one] using ha.symm
  · rintro rfl
    intro a v
    rfl

/-- The Betti comparison `L ⊗_F V^f → V`, `a ⊗ v ↦ a • v` (README §8.5). -/
def bettiComparison (f : V →ₗ[F] V) : L ⊗[F] (LinearMap.fixedSubmodule f) →ₗ[L] V :=
  (LinearMap.fixedSubmodule f).subtype.liftBaseChange L

example (f : V →ₗ[F] V) (a : L) (v : LinearMap.fixedSubmodule f) :
    bettiComparison f (a ⊗ₜ[F] v) = a • (v : V) := by
  simp [bettiComparison]

/-- **Fixed vectors stay independent** (README §8.4). -/
theorem linearIndependent_of_fixed (σ : L ≃ₐ[F] L) (f : V →ₗ[F] V) (hf : IsSemilinear σ f)
    (hσ : HasExactConstants σ) {ι : Type*} (v : ι → V) (hfix : ∀ i, f (v i) = v i)
    (hv : LinearIndependent F v) : LinearIndependent L v := by
  sorry

/-- The dimension bound `dim_F V^f ≤ dim_L V` (README §8.7). -/
theorem finrank_fixedSubmodule_le [FiniteDimensional L V] (σ : L ≃ₐ[F] L) (f : V →ₗ[F] V)
    (hf : IsSemilinear σ f) (hσ : HasExactConstants σ) :
    Module.finrank F (LinearMap.fixedSubmodule f) ≤ Module.finrank L V := by
  sorry

/-- **The dimension criterion for the Betti comparison** (README §8.8); for the operator `σ` of a
pre-t-motive this is rigid analytic triviality (README §8.15). -/
theorem bettiComparison_bijective_iff [FiniteDimensional L V] (σ : L ≃ₐ[F] L)
    (f : V →ₗ[F] V) (hf : IsSemilinear σ f) (hσ : HasExactConstants σ) :
    Function.Bijective (bettiComparison (L := L) f) ↔
      Module.finrank F (LinearMap.fixedSubmodule f) = Module.finrank L V := by
  sorry

end Semilinear

section Difference

variable {F L : Type*} [Field F] [Field L] [Algebra F L]

/-- A fundamental matrix of `σ(Ψ) = Φ Ψ`: an invertible `Ψ` with `Ψ.map σ = Φ * Ψ`
(README §8.16). -/
def IsFundamentalMatrix (σ : L →+* L) {r : Type*} [Fintype r] [DecidableEq r]
    (Φ Ψ : Matrix r r L) : Prop :=
  IsUnit Ψ.det ∧ Ψ.map σ = Φ * Ψ

example (σ : L →+* L) {r : Type*} [Fintype r] [DecidableEq r] :
    IsFundamentalMatrix σ (1 : Matrix r r L) 1 := by
  refine ⟨by simp, ?_⟩
  rw [Matrix.map_one σ (map_zero σ) (map_one σ), one_mul]

example (σ : L →+* L) {r : Type*} [Fintype r] [DecidableEq r] [Nonempty r] :
    ¬ IsFundamentalMatrix σ (0 : Matrix r r L) 0 := by
  simp [IsFundamentalMatrix]

/-- The solution space `{v : σ(v) = Φ v}`, an `F`-subspace of `L ^ r` (README §8.25). -/
def solutionSpace (σ : L →ₐ[F] L) {r : Type*} [Fintype r] (Φ : Matrix r r L) :
    Submodule F (r → L) where
  carrier := {v | (fun i => σ (v i)) = Φ.mulVec v}
  add_mem' {v w} hv hw := by
    simp only [Set.mem_ofPred_eq] at hv hw ⊢
    rw [Matrix.mulVec_add, ← hv, ← hw]
    ext i
    simp
  zero_mem' := by
    simp only [Set.mem_ofPred_eq, Matrix.mulVec_zero]
    ext i
    simp
  smul_mem' c v hv := by
    simp only [Set.mem_ofPred_eq] at hv ⊢
    rw [Matrix.mulVec_smul, ← hv]
    ext i
    simp [Algebra.smul_def]

example {r : Type*} [Fintype r] :
    solutionSpace (AlgHom.id F L) (0 : Matrix r r L) = ⊥ := by
  ext v
  change (v = (0 : Matrix r r L).mulVec v) ↔ v = 0
  simp

example {r : Type*} [Fintype r] [DecidableEq r] :
    solutionSpace (AlgHom.id F L) (1 : Matrix r r L) = ⊤ := by
  ext v
  simp [solutionSpace]

/-- The solution ring `K[Ψ_ij, det(Ψ)⁻¹] ⊂ L` of a fundamental matrix (README §8.26). -/
def solutionRing (K : Type*) [Field K] [Algebra K L] {r : Type*} [Fintype r] [DecidableEq r]
    (Ψ : Matrix r r L) : Subalgebra K L :=
  Algebra.adjoin K (Set.range (fun ij : r × r => Ψ ij.1 ij.2) ∪ {(Ψ.det)⁻¹})

example (K : Type*) [Field K] [Algebra K L] {r : Type*} [Fintype r] [DecidableEq r] :
    solutionRing K (1 : Matrix r r L) = ⊥ := by
  apply le_antisymm ?_ bot_le
  rw [solutionRing, Algebra.adjoin_le_iff]
  rintro a (⟨⟨i, j⟩, rfl⟩ | ha)
  · by_cases h : i = j <;> simp [Matrix.one_apply, h]
  · simp only [Set.mem_singleton_iff, Matrix.det_one, inv_one] at ha
    subst a
    exact one_mem _

end Difference

section DegreeSpan

variable {F B ι : Type*} [Field F] [CommRing B] [Algebra F B]

/-- The span `D_d(x)` of monomials of total degree at most `d` in the family `x` (README §8.41). -/
def degreeSpan (x : ι → B) (d : ℕ) : Submodule F B :=
  Submodule.span F {m | ∃ e : ι →₀ ℕ, (e.sum fun _ k => k) ≤ d ∧ m = e.prod fun i k => x i ^ k}

example (x : ι → B) : degreeSpan (F := F) x 0 = Submodule.span F {1} := by
  unfold degreeSpan
  congr 1
  ext m
  constructor
  · rintro ⟨e, he, rfl⟩
    have he0 : e = 0 := by
      apply Finsupp.ext
      intro i
      have hi : e i ≤ e.sum (fun _ k => k) := by
        simpa using Finsupp.single_le_sum e (g := fun _ k => k) (fun _ _ => Nat.zero_le _) i
      simpa using Nat.le_zero.mp (le_trans hi he)
    simp [he0]
  · rintro rfl
    exact ⟨0, by simp, by simp⟩

end DegreeSpan

section CarlitzTranscendence

open IntermediateField

variable (F : Type*) [Field F] [Fintype F]
  {K : Type*} [NontriviallyNormedField K] [IsUltrametricDist K] [CompleteSpace K] [IsAlgClosed K]
  [Algebra F K]

/-- **Transcendence of the Carlitz period** over the algebraic closure of `F(θ)` (README §8.47). -/
theorem transcendental_carlitzPeriod (θ : K) (hθ : ‖θ‖ = Fintype.card F) {ρ : K}
    (hρ : ρ ^ (Fintype.card F - 1) = -θ) :
    Transcendental (algebraicClosure F⟮θ⟯ K) (carlitzPeriod F θ ρ) := by
  sorry

/-- **Algebraic independence of Carlitz logarithms** (Papanikolas; README §8.51): elements whose
Carlitz exponentials are algebraic over `F(θ)` and which are linearly independent over `F(θ)` are
algebraically independent over its algebraic closure. -/
theorem algebraicIndependent_carlitzLog (θ : K) (hθ : ‖θ‖ = Fintype.card F) {r : ℕ}
    (lam : Fin r → K) (halg : ∀ i, IsAlgebraic F⟮θ⟯ (carlitzExp F θ (lam i)))
    (hlin : LinearIndependent F⟮θ⟯ lam) :
    AlgebraicIndependent (algebraicClosure F⟮θ⟯ K) lam := by
  sorry

end CarlitzTranscendence


/-! ## README definitions without a declaration here

Their carriers (relative families, group schemes, moduli, motives, `C_∞`, the rigid analytic
rings of difference equations, Tannakian categories) are not available at the pins; the README
states them with their API and checks.

* DM.0: `DrinfeldModule.rank` (§0.4), `DrinfeldKernel` (§0.8), `RelativeDrinfeldModule` (§0.9).
* DM.2: `CInfty` (§2.2), `ALattice` (§2.3), `ALattice.exp` (§2.4), `ALattice.drinfeldModule` (§2.5),
  `carlitzOmega` (§2.10).
* DM.4: `TModule` (§4.1), `EffectiveAMotive` (§4.2), `TModule.motive` (§4.3),
  `EffectiveTMotive.IsPure` (§4.5), `TModule.IsUniformizable` (§4.6), `EffectiveDualTMotive` (§4.8),
  `oreStar` (§4.9), `PreTMotive` (§4.12).
* DM.1: `FiniteShtuka` (§1.1), `FiniteShtuka.drinfeldGroup` (§1.1), `DrinfeldModule.idealTorsion`
  (§1.4), `DrinfeldModule.tateModule` (§1.8), `DrinfeldModule.tateGaloisAction` (§1.9),
  `LocalShtuka` (§1.10).
* DM.3: `DrinfeldLevel` (§3.1), `DrinfeldModuli` (§3.3), `GeneralizedDrinfeldModule` (§3.4),
  `DrinfeldReciprocalScheme` (§3.5), `DrinfeldModularForm` (§3.8), `DrinfeldHecke` (§3.9).
* DM.5: `AMotive.rationalTate` (§5.1), `DrinfeldModule.tateHomMap` (§5.2), `TatePeriodRing` (§5.5).
* DM.6: `TaelmanModel` (§6.2), `FiniteFieldNuclearDet` (§6.3), `TaelmanModel.lValue` (§6.5),
  `TaelmanModel.units` (§6.6), `TaelmanModel.classModule` (§6.7), `latticeCovolume` (§6.8),
  `InfinitelyTangent` (§6.9).
* DM.7: `EllipticSheaf` (§7.1), `NormalizedEllipticSheaf` (§7.2), `DrinfeldModule.ellipticSheaf`
  (§7.3), `EllipticSheaf.shtukaDatum` (§7.5).
* DM.8: `IsArithmeticEntire` (§8.10), `IsRigidAnalyticallyTrivial` (§8.15), `tensorGenerated`
  (§8.21), `IsAdmissibleTower` (§8.24), `comparisonAlgebra` (§8.27), `carlitzLogDeformation`
  (§8.44), `logPhi` (§8.45), `logPsi` (§8.45).
-/

end

end TauCetiRoadmap.DrinfeldModulesAndTModules
