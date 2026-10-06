/-
This file is not the roadmap and is not exhaustive. The roadmap document is
definitive. These statements suggest Lean forms so that contributors and reviewers
can converge on names and signatures. They claim no implementation.

DESIGN-LV~2: baseline-expressible prototype, implementationStatus = unchecked.
Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.
Elaboration is checked with the shared Mathlib build at the pinned commit.
The shared Tau Ceti checkout is newer; this file imports no Tau Ceti modules. Unavailable mathematical interfaces are omitted below, not encoded
as arbitrary propositions or assumed theorem fields. The packet records this gap.
-/
import Mathlib.LinearAlgebra.AffineSpace.AffineEquiv
import Mathlib.AlgebraicGeometry.EllipticCurve.Weierstrass
import Mathlib.RingTheory.AdjoinRoot
import Mathlib.Data.ZMod.Basic

import Mathlib.LinearAlgebra.Transvection.Basic
import Mathlib.LinearAlgebra.BilinearForm.Basic
import Mathlib.LinearAlgebra.FiniteDimensional.Basic
import Mathlib.NumberTheory.NumberField.CMField
import Mathlib.Dynamics.PeriodicPts.Defs
import Mathlib.GroupTheory.Perm.Cycle.Basic
import Mathlib.LinearAlgebra.Prod
import Mathlib.LinearAlgebra.Dual.Defs
import Mathlib.GroupTheory.FreeGroup.Basic
import Mathlib.LinearAlgebra.ExteriorPower.Basis
import Mathlib.RepresentationTheory.Basic
import Mathlib.RingTheory.SimpleModule.Basic
import Mathlib.LinearAlgebra.Trace
import Mathlib.GroupTheory.SemidirectProduct

noncomputable section
open scoped Affine

namespace TauCeti.LawrenceVenkatesh

private instance : Fact (Nat.Prime 3) := ⟨by decide⟩
private instance : Fact (Nat.Prime 5) := ⟨by decide⟩

-- LV.0/affine-group: the permutation image of the existing affine equivalences.
def affineGroup (q : ℕ) [Fact q.Prime] : Subgroup (Equiv.Perm (ZMod q)) where
  carrier := {f | ∃ e : ZMod q ≃ᵃ[ZMod q] ZMod q, e.toEquiv = f}
  one_mem' := by sorry
  mul_mem' := by sorry
  inv_mem' := by sorry

namespace affineGroup
variable {q : ℕ} [Fact q.Prime]

def mk (a : (ZMod q)ˣ) (b : ZMod q) : affineGroup q := by sorry

theorem mk_apply (a : (ZMod q)ˣ) (b x : ZMod q) :
    (mk a b).val x = (a : ZMod q) * x + b := by sorry

theorem mk_inj (a a' : (ZMod q)ˣ) (b b' : ZMod q) :
    mk a b = mk a' b' ↔ a = a' ∧ b = b' := by sorry

def mulEquivAffineEquiv : affineGroup q ≃* (ZMod q ≃ᵃ[ZMod q] ZMod q) := by sorry

def linearPart : affineGroup q →* (ZMod q)ˣ := by sorry

theorem linearPart_mk (a : (ZMod q)ˣ) (b : ZMod q) :
    linearPart (mk a b) = a := by sorry

theorem ker_linearPart (f : affineGroup q) :
    f ∈ linearPart.ker ↔ ∃ b, f = mk 1 b := by sorry

theorem mk_mul_mk (a a' : (ZMod q)ˣ) (b b' : ZMod q) :
    mk a b * mk a' b' = mk (a * a') ((a : ZMod q) * b' + b) := by sorry

theorem inv_mk (a : (ZMod q)ˣ) (b : ZMod q) :
    (mk a b)⁻¹ = mk a⁻¹ (-((a⁻¹ : (ZMod q)ˣ) : ZMod q) * b) := by sorry

theorem card : Nat.card (affineGroup q) = q * (q - 1) := by sorry

theorem stabilizer_zero (f : affineGroup q) :
    f.val 0 = 0 ↔ ∃ a, f = mk a 0 := by sorry

theorem commutator_eq (a a' : (ZMod q)ˣ) (b b' : ZMod q) :
    mk a b * mk a' b' * (mk a b)⁻¹ * (mk a' b')⁻¹ =
      mk 1 (b * (1 - (a' : ZMod q)) - b' * (1 - (a : ZMod q))) := by sorry

theorem example_three : affineGroup 3 = ⊤ := by sorry

-- affineGroup.reviewTest1: (2,1)(3,4)=(1,4) in Aff(5).
example (a a' : (ZMod 5)ˣ) (ha : (a : ZMod 5) = 2)
    (ha' : (a' : ZMod 5) = 3) : mk a 1 * mk a' 4 = mk 1 4 := by sorry

-- affineGroup.reviewTest2: identity and inverse, including the translation term.
example (a : (ZMod q)ˣ) (b : ZMod q) :
    mk (1 : (ZMod q)ˣ) 0 = 1 ∧
    (mk a b)⁻¹ = mk a⁻¹ (-((a⁻¹ : (ZMod q)ˣ) : ZMod q) * b) := by sorry

-- affineGroup.reviewTest3: the faithful action is the whole six-element S₃.
example : affineGroup 3 = ⊤ ∧ Nat.card (affineGroup 3) = 6 := by sorry
end affineGroup

-- LV.6/legendre-family: reuse the existing Weierstrass carrier over any ring.
def legendreCurve {R : Type*} [CommRing R] (t : R) : WeierstrassCurve R where
  a₁ := 0
  a₂ := -(1 + t)
  a₃ := 0
  a₄ := t
  a₆ := 0

theorem legendreCurve.discriminant {R : Type*} [CommRing R] (t : R) :
    (legendreCurve t).Δ = 16 * t ^ 2 * (t - 1) ^ 2 := by sorry

theorem legendreCurve.isElliptic {R : Type*} [CommRing R] (t : R)
    (h₂ : IsUnit (2 : R)) (ht : IsUnit t) (ht₁ : IsUnit (t - 1)) :
    (legendreCurve t).IsElliptic := by sorry

theorem legendreCurve.j_eq {K : Type*} [Field K] (t : K)
    [(legendreCurve t).IsElliptic] :
    (legendreCurve t).j = 256 * (t ^ 2 - t + 1) ^ 3 / (t ^ 2 * (t - 1) ^ 2) := by sorry

theorem legendreCurve.j_one_seven_two_eight
    [(legendreCurve (-1 : ℚ)).IsElliptic]
    [(legendreCurve (2 : ℚ)).IsElliptic]
    [(legendreCurve (1 / 2 : ℚ)).IsElliptic] :
    (legendreCurve (-1 : ℚ)).j = 1728 ∧ (legendreCurve (2 : ℚ)).j = 1728 ∧
    (legendreCurve (1 / 2 : ℚ)).j = 1728 := by sorry

-- legendreCurve.reviewTest1: the actual coefficients determine both invariants.
example (t : ℚ) [(legendreCurve t).IsElliptic] :
    (legendreCurve t).Δ = 16 * t ^ 2 * (t - 1) ^ 2 ∧
    (legendreCurve t).j = 256 * (t ^ 2 - t + 1) ^ 3 / (t ^ 2 * (t - 1) ^ 2) := by sorry

-- legendreCurve.reviewTest2: the two roots give distinct rational components.
-- The scheme-theoretic disjoint-family identification awaits legendreVariant.
example : Nonempty (AdjoinRoot (Polynomial.X ^ 2 - Polynomial.C (4 : ℚ)) ≃ₐ[ℚ]
    (ℚ × ℚ)) := by sorry

-- legendreCurve.reviewTest3: the excluded singular parameters.
example : (legendreCurve (0 : ℚ)).Δ = 0 ∧ (legendreCurve (1 : ℚ)).Δ = 0 ∧
    ¬ (legendreCurve (0 : ℚ)).IsElliptic ∧
    ¬ (legendreCurve (1 : ℚ)).IsElliptic := by sorry


-- LV.0: the carrier is explicit, and semilinearity is over E, not over F.
section Centralizer
variable {F E V : Type*} [Field F] [Field E] [Algebra F E]
  [AddCommGroup V] [Module E V] [Module F V] [IsScalarTower F E V]
variable (σ : E ≃+* E) (hσ : ∀ a : F, σ (algebraMap F E a) = algebraMap F E a)
  (φ : V →ₛₗ[σ.toRingHom] V)

def semilinearCentralizer (σ : E ≃+* E)
    (_hσ : ∀ a : F, σ (algebraMap F E a) = algebraMap F E a)
    (φ : V →ₛₗ[σ.toRingHom] V) : Subalgebra F (Module.End E V) where
  carrier := {f | ∀ v, f (φ v) = φ (f v)}
  mul_mem' := by sorry
  add_mem' := by sorry
  algebraMap_mem' := by sorry

theorem mem_semilinearCentralizer (f : Module.End E V) :
    f ∈ semilinearCentralizer σ hσ φ ↔ ∀ v, f (φ v) = φ (f v) := by sorry

theorem semilinearCentralizer_le_pow (m : ℕ) (f : Module.End E V)
    (hf : f ∈ semilinearCentralizer σ hσ φ) :
    ∀ v, f ((φ : V → V)^[m] v) = (φ : V → V)^[m] (f v) := by sorry

def units_semilinearCentralizer (u : (semilinearCentralizer σ hσ φ)ˣ) :
    V ≃ₗ[E] V := by sorry

theorem units_semilinearCentralizer_apply (u : (semilinearCentralizer σ hσ φ)ˣ) (v : V) :
    units_semilinearCentralizer σ hσ φ u v = u.val.val v := by sorry

theorem semilinearCentralizer_fixedScalar (a : F) :
    algebraMap F (Module.End E V) a ∈ semilinearCentralizer σ hσ φ := by sorry

theorem semilinearCentralizer_conj (e : V ≃ₗ[E] V) (ψ : V →ₛₗ[σ.toRingHom] V)
    (h : ∀ v, ψ (e v) = e (φ v)) (f : Module.End E V) :
    f ∈ semilinearCentralizer σ hσ φ ↔
      e.toLinearMap ∘ₗ f ∘ₗ e.symm.toLinearMap ∈ semilinearCentralizer σ hσ ψ := by sorry

theorem semilinearCentralizer_linear (φ : Module.End E V) :
    semilinearCentralizer (F := F) (RingEquiv.refl E) (fun _ => rfl) φ =
      { carrier := {f | f * φ = φ * f}
        mul_mem' := by sorry
        add_mem' := by sorry
        algebraMap_mem' := by sorry } := by sorry

-- semilinearCentralizer.reviewTest1: scalar semilinear action on E.
def scalarSemilinear : E →ₛₗ[σ.toRingHom] E where
  toFun := σ
  map_add' := σ.map_add
  map_smul' := by sorry

example (a : E) :
    LinearMap.mulLeft E a ∈ semilinearCentralizer σ hσ (scalarSemilinear σ) ↔ σ a = a := by sorry

-- semilinearCentralizer.zeroTest: an additional zero-space test.
example [Subsingleton V] :
    semilinearCentralizer σ hσ φ = ⊤ ∧
    Module.finrank F (semilinearCentralizer σ hσ φ) = 0 := by sorry

-- semilinearCentralizer.diagonalTest: distinct diagonal eigenvalues constrain off-diagonals.
def diagonalEnd : Module.End ℚ (ℚ × ℚ) :=
  { toFun := fun v => (v.1, 2 * v.2)
    map_add' := by sorry
    map_smul' := by sorry }
example (f : Module.End ℚ (ℚ × ℚ)) :
    f ∈ semilinearCentralizer (F := ℚ) (RingEquiv.refl ℚ) (fun _ => rfl) diagonalEnd ↔
      (f (1,0)).2 = 0 ∧ (f (0,1)).1 = 0 := by sorry
end Centralizer

-- semilinearCentralizer.reviewTest2: the identity on E² commutes with every matrix.
example {E : Type*} [Field E] :
    semilinearCentralizer (F := E) (RingEquiv.refl E) (fun _ => rfl)
      (LinearMap.id : Module.End E (E × E)) = ⊤ := by sorry

-- LV.0: reuse the existing arbitrary-module transvection.
section Transvection
variable {K V : Type*} [Field K] [AddCommGroup V] [Module K V]
  (B : LinearMap.BilinForm K V) (hB : ∀ x, B x x = 0)

def symplecticTransvection (B : LinearMap.BilinForm K V) (_hB : ∀ x, B x x = 0) (v : V) (r : K) : V ≃ₗ[K] V :=
  LinearEquiv.transvection (f := r • B v) (v := v) (by sorry)

theorem symplecticTransvection_apply (v x : V) (r : K) :
    symplecticTransvection B hB v r x = x + (r * B v x) • v := by sorry

theorem symplecticTransvection_preserves (v x y : V) (r : K) :
    B (symplecticTransvection B hB v r x) (symplecticTransvection B hB v r y) = B x y := by sorry

theorem symplecticTransvection_add (v : V) (r s : K) :
    (symplecticTransvection B hB v s).trans (symplecticTransvection B hB v r) =
      symplecticTransvection B hB v (r+s) ∧
      symplecticTransvection B hB v 0 = LinearEquiv.refl K V ∧
      (symplecticTransvection B hB v r).symm = symplecticTransvection B hB v (-r) := by sorry

theorem symplecticTransvection_smul (v : V) (r c : K) :
    symplecticTransvection B hB (c • v) r = symplecticTransvection B hB v (r*c^2) := by sorry

theorem conj_symplecticTransvection (e : V ≃ₗ[K] V)
    (he : ∀ x y, B (e x) (e y) = B x y) (v : V) (r : K) :
    e.symm.trans ((symplecticTransvection B hB v r).trans e) =
      symplecticTransvection B hB (e v) r := by sorry

theorem isUnipotent_symplecticTransvection (v : V) (r : K) :
    ((symplecticTransvection B hB v r).toLinearMap - LinearMap.id).comp
      ((symplecticTransvection B hB v r).toLinearMap - LinearMap.id) = 0 := by sorry

theorem fixedPoints_symplecticTransvection_apply (v : V) (hv : v ≠ 0) (r : K) (hr : r ≠ 0) (x : V) :
    symplecticTransvection B hB v r x = x ↔ B v x = 0 := by sorry

theorem fixedPoints_symplecticTransvection [FiniteDimensional K V]
    (hnd : ∀ z, (∀ w, B z w = 0) → z = 0)
    (v : V) (hv : v ≠ 0) (r : K) (hr : r ≠ 0) :
    LinearMap.ker ((symplecticTransvection B hB v r).toLinearMap - LinearMap.id) = (B v).ker ∧
      Module.finrank K (B v).ker + 1 = Module.finrank K V ∧
      LinearMap.range ((symplecticTransvection B hB v r).toLinearMap - LinearMap.id) =
        Submodule.span K {v} := by sorry

theorem symplecticTransvection_eq_transvection (v : V) (r : K) :
    (symplecticTransvection B hB v r).toLinearMap = LinearMap.transvection (r • B v) v := by sorry

-- Concrete rank-two tests retain the order B(v,x).
def planeForm : LinearMap.BilinForm ℚ (ℚ × ℚ) where
  toFun v :=
    { toFun := fun x => v.1*x.2 - v.2*x.1
      map_add' := by sorry
      map_smul' := by sorry }
  map_add' := by sorry
  map_smul' := by sorry
theorem planeForm_alt : ∀ v, planeForm v v = 0 := by sorry

theorem symplecticTransvection_sl2 (r : ℚ) (x : ℚ × ℚ) :
    symplecticTransvection planeForm planeForm_alt (1,0) r x = (x.1+r*x.2,x.2) := by sorry

-- symplecticTransvection.reviewTest1
example :
    symplecticTransvection planeForm planeForm_alt (1,0) 2 (0,1) = (2,1) ∧
    symplecticTransvection planeForm planeForm_alt (1,0) 2 (1,0) = (1,0) := by sorry
-- symplecticTransvection.reviewTest2
example (v x : ℚ × ℚ) (r : ℚ) :
    symplecticTransvection planeForm planeForm_alt 0 r x = x ∧
    symplecticTransvection planeForm planeForm_alt v 0 x = x := by sorry
-- symplecticTransvection.reviewTest3: inverse uses the negative parameter.
example (v : V) (r : K) :
    (symplecticTransvection B hB v r).toLinearMap = LinearMap.transvection (r • B v) v ∧
    (symplecticTransvection B hB v r).symm = symplecticTransvection B hB v (-r) := by sorry
end Transvection

-- LV.1: an actual subfield, using Mathlib's existing CM predicate.
section CM
variable (K : Type*) [Field K] [NumberField K]
def largestCMSubfield : Subfield K :=
  sSup {L : Subfield K | NumberField.IsCMField L ∨ NumberField.IsTotallyReal L}

def largestTotallyRealSubfield : Subfield K := NumberField.maximalRealSubfield K

theorem largestTotallyRealSubfield_eq_maximalRealSubfield :
    largestTotallyRealSubfield K = NumberField.maximalRealSubfield K := by sorry

-- The class of CM-or-totally-real subfields is closed under compositum.
theorem largestCMSubfield_cm_or_real :
    NumberField.IsCMField (largestCMSubfield K) ∨
    NumberField.IsTotallyReal (largestCMSubfield K) := by sorry

theorem le_largestCMSubfield_iff (L : Subfield K) :
    L ≤ largestCMSubfield K ↔ NumberField.IsCMField L ∨ NumberField.IsTotallyReal L := by sorry

theorem isCMField_largestCMSubfield_iff :
    NumberField.IsCMField (largestCMSubfield K) ↔
      ∃ L : Subfield K, NumberField.IsCMField L := by sorry

theorem largestCMSubfield_map {K' : Type*} [Field K'] [NumberField K'] (e : K ≃+* K') :
    (largestCMSubfield K).map e.toRingHom = largestCMSubfield K' := by sorry

-- largestCMSubfield.reviewTest1: includes every imaginary quadratic field.
example [NumberField.IsCMField K] : largestCMSubfield K = ⊤ := by sorry
-- largestCMSubfield.reviewTest2: includes ℚ(√2).
example [NumberField.IsTotallyReal K] :
    largestCMSubfield K = ⊤ ∧ largestTotallyRealSubfield K = ⊤ := by sorry
-- largestCMSubfield.reviewTest3: the real cube-root field is not totally real.
example (hdeg : Module.finrank ℚ K = 3) (hreal : ¬ NumberField.IsTotallyReal K) :
    largestCMSubfield K = ⊥ := by sorry
end CM

-- LV.7: the permutation core, before the arithmetic Frobenius adapter.
section Size
variable {E : Type*} [Fintype E] [Nonempty E]
def sizeV (f : Equiv.Perm E) : ℚ :=
  (Nat.card {x : E // Function.minimalPeriod f x < 8} : ℚ) / Fintype.card E

theorem sizeV_mem_Icc (f : Equiv.Perm E) : 0 ≤ sizeV f ∧ sizeV f ≤ 1 := by sorry

theorem sizeV_indep (f : Equiv.Perm E) (e : Equiv.Perm E) :
    sizeV (e * f * e⁻¹) = sizeV f := by sorry

theorem sizeV_le_of_fibres {E' : Type*} [Fintype E'] [Nonempty E']
    (f : Equiv.Perm E) (f' : Equiv.Perm E') (π : E → E')
    (he : ∀ x, π (f x) = f' (π x)) (c : ℕ) (hc : 0 < c)
    (hcard : ∀ y, Nat.card {x // π x = y} = c) : sizeV f ≤ sizeV f' := by sorry

theorem sizeV_cycle (f : Equiv.Perm E) (h : ∀ x, Function.minimalPeriod f x = Fintype.card E) :
    sizeV f = if Fintype.card E < 8 then 1 else 0 := by sorry

def cyclicShift (n : ℕ) [NeZero n] : Equiv.Perm (ZMod n) where
  toFun := fun x => x+1
  invFun := fun x => x-1
  left_inv := by sorry
  right_inv := by sorry

-- sizeV.reviewTest1: strict boundary at eight.
example : sizeV (cyclicShift 7) = 1 ∧ sizeV (cyclicShift 8) = 0 := by sorry
-- sizeV.reviewTest2: eight-cycles contribute no points; a fixed point contributes one.
def fixedPlusEight : Equiv.Perm (Unit ⊕ ZMod 8) := Equiv.sumCongr (Equiv.refl Unit) (cyclicShift 8)
example : sizeV fixedPlusEight = 1/9 := by sorry
-- sizeV.identityTest: an additional identity check.
example (e : Equiv.Perm E) : sizeV (1 : Equiv.Perm E) = 1 ∧ sizeV (e*e⁻¹) = 1 := by sorry
-- sizeV.reviewTest3: an eight-cycle maps equivariantly to a singleton.
example : sizeV (cyclicShift 8) ≤ sizeV (1 : Equiv.Perm Unit) := by sorry
end Size

-- LV.9: a genuine linear kernel; topology supplies p and the transfer later.
section Primitive
variable {K Z Y : Type*} [Field K] [AddCommGroup Z] [Module K Z]
  [AddCommGroup Y] [Module K Y]
def primitiveHomology (p : Z →ₗ[K] Y) : Submodule K Z := p.ker

def primitiveProjection (p : Z →ₗ[K] Y) (t : Y →ₗ[K] Z) (q : K) : Module.End K Z :=
  LinearMap.id - q⁻¹ • (t ∘ₗ p)

theorem primitiveProjection_mem (p : Z →ₗ[K] Y) (t : Y →ₗ[K] Z) (q : K)
    (hq : q ≠ 0) (hpt : p ∘ₗ t = q • LinearMap.id) (z : Z) :
    primitiveProjection p t q z ∈ primitiveHomology p := by sorry

theorem isCompl_primitiveHomology (p : Z →ₗ[K] Y) (t : Y →ₗ[K] Z) (q : K)
    (hq : q ≠ 0) (hpt : p ∘ₗ t = q • LinearMap.id) :
    IsCompl (primitiveHomology p) t.range := by sorry

theorem primitiveHomology_eq_orthogonal (p : Z →ₗ[K] Y) (t : Y →ₗ[K] Z)
    (BZ : LinearMap.BilinForm K Z) (BY : LinearMap.BilinForm K Y)
    (hBY : ∀ y, (∀ y', BY y y' = 0) → y = 0)
    (hproj : ∀ z y, BZ z (t y) = BY (p z) y) :
    ∀ z, z ∈ primitiveHomology p ↔ ∀ y, BZ z (t y) = 0 := by sorry

theorem primitiveHomology.finrank [FiniteDimensional K Z] [FiniteDimensional K Y]
    (p : Z →ₗ[K] Y) (hp : Function.Surjective p) :
    Module.finrank K (primitiveHomology p) = Module.finrank K Z - Module.finrank K Y := by sorry

-- primitiveHomology.reviewTest1: the identity cover has zero primitive part.
example : primitiveHomology (LinearMap.id : Y →ₗ[K] Y) = ⊥ ∧
    primitiveProjection (LinearMap.id : Y →ₗ[K] Y) LinearMap.id (1 : K) = 0 := by sorry
-- primitiveHomology.normalizationTest: the transfer normalization cannot be omitted.
example (q : K) (hq : q ≠ 0) :
    primitiveProjection (LinearMap.id : Y →ₗ[K] Y) (q • LinearMap.id) q = 0 := by sorry
-- primitiveHomology.rankTest: linear ranks ten and four give six.
example [FiniteDimensional K Z] [FiniteDimensional K Y] (p : Z →ₗ[K] Y)
    (hp : Function.Surjective p) (hZ : Module.finrank K Z = 10) (hY : Module.finrank K Y = 4) :
    Module.finrank K (primitiveHomology p) = 6 := by sorry
end Primitive

-- LV.1: finite exhaustive separated decreasing filtrations with integer jumps.
-- Bounds certify finiteness; they do not contain a Hodge-weight theorem.
structure FiniteFiltration (K V : Type*) [Field K] [AddCommGroup V] [Module K V] where
  step : ℤ → Submodule K V
  antitone : Antitone step
  lower : ℤ
  upper : ℤ
  bounds : lower ≤ upper
  lower_full : ∀ j ≤ lower, step j = ⊤
  upper_zero : ∀ j, upper < j → step j = ⊥

namespace FiniteFiltration
variable {K V : Type*} [Field K] [AddCommGroup V] [Module K V]

def tH [FiniteDimensional K V] (F : FiniteFiltration K V) : ℚ :=
  ∑ j ∈ Finset.Icc F.lower F.upper,
    (j : ℚ) * ((Module.finrank K (F.step j) : ℚ) - Module.finrank K (F.step (j+1)))

def shift (F : FiniteFiltration K V) (n : ℤ) : FiniteFiltration K V where
  step j := F.step (j-n)
  antitone := by sorry
  lower := F.lower+n
  upper := F.upper+n
  bounds := by sorry
  lower_full := by sorry
  upper_zero := by sorry

def directSum {W : Type*} [AddCommGroup W] [Module K W]
    (F : FiniteFiltration K V) (G : FiniteFiltration K W) : FiniteFiltration K (V × W) where
  step j := (F.step j).prod (G.step j)
  antitone := by sorry
  lower := min F.lower G.lower
  upper := max F.upper G.upper
  bounds := by sorry
  lower_full := by sorry
  upper_zero := by sorry

def onSubmodule (F : FiniteFiltration K V) (W : Submodule K V) : FiniteFiltration K W where
  step j := (F.step j).comap W.subtype
  antitone := by sorry
  lower := F.lower
  upper := F.upper
  bounds := F.bounds
  lower_full := by sorry
  upper_zero := by sorry

def onQuotient (F : FiniteFiltration K V) (W : Submodule K V) : FiniteFiltration K (V ⧸ W) where
  step j := (F.step j).map W.mkQ
  antitone := by sorry
  lower := F.lower
  upper := F.upper
  bounds := F.bounds
  lower_full := by sorry
  upper_zero := by sorry

end FiniteFiltration

section FiltrationWeight
variable {K V : Type*} [Field K] [AddCommGroup V] [Module K V] [FiniteDimensional K V]

def filtrationWeight (F : FiniteFiltration K V) : ℚ := F.tH / Module.finrank K V

theorem filtrationWeight_eq (F : FiniteFiltration K V) (h : 0 < Module.finrank K V) :
    filtrationWeight F * Module.finrank K V = F.tH := by sorry

theorem filtrationWeight_indep_bounds (F G : FiniteFiltration K V) (h : F.step = G.step) :
    filtrationWeight F = filtrationWeight G := by sorry

theorem filtrationWeight_directSum {W : Type*} [AddCommGroup W] [Module K W]
    [FiniteDimensional K W] (F : FiniteFiltration K V) (G : FiniteFiltration K W)
    (hV : 0 < Module.finrank K V) (hW : 0 < Module.finrank K W) :
    filtrationWeight (F.directSum G) =
      (Module.finrank K V * filtrationWeight F + Module.finrank K W * filtrationWeight G) /
        (Module.finrank K V + Module.finrank K W) := by sorry

theorem filtrationWeight_sub_quotient (F : FiniteFiltration K V) (W : Submodule K V) :
    F.tH = (F.onSubmodule W).tH + (F.onQuotient W).tH := by sorry

theorem filtrationWeight_twist (F : FiniteFiltration K V) (n : ℤ) (h : 0 < Module.finrank K V) :
    filtrationWeight (F.shift n) = filtrationWeight F + n := by sorry

def lineFiltration (k : ℤ) : FiniteFiltration ℚ ℚ where
  step j := if j ≤ k then ⊤ else ⊥
  antitone := by sorry
  lower := k
  upper := k
  bounds := le_refl k
  lower_full := by sorry
  upper_zero := by sorry

theorem filtrationWeight_line (k : ℤ) : filtrationWeight (lineFiltration k) = k := by sorry

def twoStepFiltration (L : Submodule K V) : FiniteFiltration K V where
  step j := if j ≤ 0 then ⊤ else if j = 1 then L else ⊥
  antitone := by sorry
  lower := 0
  upper := 1
  bounds := by decide
  lower_full := by sorry
  upper_zero := by sorry

theorem filtrationWeight_example (L : Submodule K V) (h : 0 < Module.finrank K V) :
    filtrationWeight (twoStepFiltration L) =
      (Module.finrank K L : ℚ) / Module.finrank K V := by sorry

-- filtrationWeight.reviewTest1
example : filtrationWeight ((lineFiltration 0).directSum (lineFiltration 1)) = 1/2 := by sorry
-- filtrationWeight.reviewTest2
example : filtrationWeight (lineFiltration 0) = 0 := by sorry
-- filtrationWeight.reviewTest3: negative jumps survive the definition.
example : filtrationWeight (lineFiltration (-1)) = -1 ∧
    filtrationWeight ((lineFiltration (-1)).directSum (lineFiltration 1)) = 0 := by sorry
end FiltrationWeight

-- LV.8: abstract group carrier; continuity is the separately requested adapter.
def singlyRamifiedSurjections (Γ G : Type*) [Group Γ] [Group G] (c : Set Γ) :=
  {φ : Γ →* G // Function.Surjective φ ∧ ∀ x ∈ c, φ x ≠ 1}

namespace singlyRamifiedSurjections
variable {Γ G : Type*} [Group Γ] [Group G] {c : Set Γ}

def targetConjugate (g : G) (φ : singlyRamifiedSurjections Γ G c) :
    singlyRamifiedSurjections Γ G c :=
  ⟨{ toFun := fun x => g * φ.val x * g⁻¹
     map_one' := by sorry
     map_mul' := by sorry }, by sorry⟩

def actLeft (hc : ∀ a b, b ∈ c → a*b*a⁻¹ ∈ c) (γ : Γ)
    (φ : singlyRamifiedSurjections Γ G c) : singlyRamifiedSurjections Γ G c :=
  ⟨{ toFun := fun x => φ.val (γ⁻¹*x*γ)
     map_one' := by sorry
     map_mul' := by sorry }, by sorry⟩

def actRight (h : G) (φ : singlyRamifiedSurjections Γ G c) :
    singlyRamifiedSurjections Γ G c := targetConjugate h⁻¹ φ

theorem actions_commute (hc : ∀ a b, b ∈ c → a*b*a⁻¹ ∈ c)
    (γ : Γ) (h : G) (φ : singlyRamifiedSurjections Γ G c) :
    actLeft hc γ (actRight h φ) = actRight h (actLeft hc γ φ) := by sorry

def conjugacySetoid : Setoid (singlyRamifiedSurjections Γ G c) where
  r φ ψ := ∃ g : G, targetConjugate g φ = ψ
  iseqv := by sorry

def quotient := Quotient (conjugacySetoid (Γ := Γ) (G := G) (c := c))

theorem target_stabilizer_eq (φ : singlyRamifiedSurjections Γ G c) (g : G) :
    targetConjugate g φ = φ ↔ ∀ h : G, g*h=h*g := by sorry

theorem stabilizer_eq (hc : ∀ a b, b ∈ c → a*b*a⁻¹ ∈ c)
    (hcentre : ∀ g : G, (∀ h, g*h=h*g) → g=1)
    (φ : singlyRamifiedSurjections Γ G c) (γ : Γ) (h : G) :
    actRight h (actLeft hc γ φ) = φ ↔ h⁻¹ = φ.val γ := by sorry

def comapEquiv {Γ' : Type*} [Group Γ'] (e : Γ' ≃* Γ) (φ : singlyRamifiedSurjections Γ G c) :
    singlyRamifiedSurjections Γ' G (e ⁻¹' c) := ⟨φ.val.comp e.toMonoidHom, by sorry⟩

-- Descent is exactly the kernel hypothesis, not merely an isomorphism of groups.
def comap {Γ' : Type*} [Group Γ'] (f : Γ' →* Γ) (hf : Function.Surjective f)
    (hfactor : ∀ φ : singlyRamifiedSurjections Γ' G (f ⁻¹' c),
      ∀ x ∈ f.ker, φ.val x = 1) :
    singlyRamifiedSurjections Γ G c ≃ singlyRamifiedSurjections Γ' G (f ⁻¹' c) := by sorry

theorem quotient_mk_actLeft (hc : ∀ a b, b ∈ c → a*b*a⁻¹ ∈ c)
    (γ : Γ) (φ : singlyRamifiedSurjections Γ G c) :
    Quotient.mk conjugacySetoid (actLeft hc γ φ) = Quotient.mk conjugacySetoid φ := by sorry

def peripheralGenusTwo : FreeGroup (Fin 4) :=
  let a := FreeGroup.of (0 : Fin 4)
  let b := FreeGroup.of (1 : Fin 4)
  let d := FreeGroup.of (2 : Fin 4)
  let e := FreeGroup.of (3 : Fin 4)
  (a*b*a⁻¹*b⁻¹) * (d*e*d⁻¹*e⁻¹)

def peripheralClass : Set (FreeGroup (Fin 4)) :=
  {x | ∃ a, x = a*peripheralGenusTwo*a⁻¹}

theorem aff3 :
    Nat.card (singlyRamifiedSurjections (FreeGroup (Fin 4)) (affineGroup 3) peripheralClass) = 810 ∧
    Nat.card (quotient (Γ := FreeGroup (Fin 4)) (G := affineGroup 3) (c := peripheralClass)) = 135 := by sorry

-- singlyRamifiedSurjections.reviewTest1
example :
    Nat.card (singlyRamifiedSurjections (FreeGroup (Fin 4)) (affineGroup 3) peripheralClass) = 810 ∧
    Nat.card (quotient (Γ := FreeGroup (Fin 4)) (G := affineGroup 3) (c := peripheralClass)) = 135 := by sorry
-- singlyRamifiedSurjections.reviewTest2
example : IsEmpty (singlyRamifiedSurjections Γ G ({1} : Set Γ)) := by sorry
-- singlyRamifiedSurjections.reviewTest3: centrelessness is required for a free action.
example (φ : singlyRamifiedSurjections Γ G c) (z : G) (hz : z ≠ 1)
    (hc : ∀ h : G, z*h=h*z) : actRight z φ = φ := by sorry
end singlyRamifiedSurjections

theorem generatingPairs_mod_six :
    Nat.card {v : Fin 2 → ZMod 6 // AddSubgroup.closure (Set.range v) = ⊤} = 24 := by sorry

section MoreCentralizer
variable {F E V : Type*} [Field F] [Field E] [Algebra F E]
  [AddCommGroup V] [Module E V] [Module F V] [IsScalarTower F E V]
theorem semilinearCentralizer_identity :
    semilinearCentralizer (F := F) (RingEquiv.refl E) (fun _ => rfl)
      (LinearMap.id : Module.End E V) = ⊤ := by sorry

def complexConjugation : ℂ ≃+* ℂ := Complex.conjAe.toRingEquiv
theorem complexConjugation_real (a : ℝ) :
    complexConjugation (algebraMap ℝ ℂ a) = algebraMap ℝ ℂ a := by sorry
-- semilinearCentralizer.reviewTest3: a genuinely semilinear non-example.
example :
    LinearMap.mulLeft ℂ Complex.I ∉
      semilinearCentralizer complexConjugation complexConjugation_real (scalarSemilinear complexConjugation) ∧
    LinearMap.mulLeft ℂ 1 ∈
      semilinearCentralizer complexConjugation complexConjugation_real (scalarSemilinear complexConjugation) := by sorry
end MoreCentralizer

section MoreTransvection
variable {K V : Type*} [Field K] [AddCommGroup V] [Module K V] [FiniteDimensional K V]
theorem eq_symplecticTransvection_of_codim_one
    (B : LinearMap.BilinForm K V) (hB : ∀ x, B x x = 0)
    (hnd : ∀ x, (∀ y, B x y = 0) → x = 0)
    (v : V) (hv : v ≠ 0) (e : V ≃ₗ[K] V)
    (he : ∀ x y, B (e x) (e y) = B x y)
    (hfix : ∀ x, e x = x ↔ B v x = 0) :
    ∃ r : K, r ≠ 0 ∧ e = symplecticTransvection B hB v r := by sorry
end MoreTransvection

namespace FiniteFiltration
variable {K V : Type*} [Field K] [AddCommGroup V] [Module K V]
def restrictScalars {L : Type*} [Field L] [Algebra K L] [Module L V]
    [IsScalarTower K L V] (F : FiniteFiltration L V) : FiniteFiltration K V where
  step j := (F.step j).restrictScalars K
  antitone := by sorry
  lower := F.lower
  upper := F.upper
  bounds := F.bounds
  lower_full := by sorry
  upper_zero := by sorry

open scoped BigOperators
def determinant [FiniteDimensional K V] (F : FiniteFiltration K V) :
    FiniteFiltration K (⋀[K]^(Module.finrank K V) V) where
  step j := Submodule.span K {z | ∃ (v : Fin (Module.finrank K V) → V)
      (w : Fin (Module.finrank K V) → ℤ),
      (∀ i, v i ∈ F.step (w i)) ∧ j ≤ ∑ i, w i ∧ z = exteriorPower.ιMulti K _ v}
  antitone := by sorry
  lower := (Module.finrank K V : ℤ) * F.lower
  upper := (Module.finrank K V : ℤ) * F.upper
  bounds := by sorry
  lower_full := by sorry
  upper_zero := by sorry
end FiniteFiltration

section MoreFiltration
variable {K L V : Type*} [Field K] [Field L] [Algebra K L]
  [AddCommGroup V] [Module K V] [Module L V] [IsScalarTower K L V]
  [FiniteDimensional K L] [FiniteDimensional L V] [FiniteDimensional K V]
theorem filtrationWeight_restrictScalars (F : FiniteFiltration L V) :
    (F.restrictScalars (K := K)).tH = (Module.finrank K L : ℚ) * F.tH ∧
      filtrationWeight (F.restrictScalars (K := K)) = filtrationWeight F := by sorry

theorem filtrationWeight_det {k W : Type*} [Field k] [AddCommGroup W] [Module k W]
    [FiniteDimensional k W] (F : FiniteFiltration k W) :
    F.determinant.tH = F.tH := by sorry
end MoreFiltration

section MorePrimitive
variable {K Y : Type*} [Field K] [AddCommGroup Y] [Module K Y]
def doublePush : Y × Y →ₗ[K] Y where
  toFun z := z.1+z.2
  map_add' := by sorry
  map_smul' := by sorry
def doubleTransfer : Y →ₗ[K] (Y × Y) where
  toFun y := (y,y)
  map_add' := by sorry
  map_smul' := by sorry
-- primitiveHomology.reviewTest2: the trivial disconnected double cover.
example (B : LinearMap.BilinForm K Y) (z : Y × Y) (x y : Y) :
    (z ∈ primitiveHomology (doublePush (K := K)) ↔ z.2 = -z.1) ∧
    B x y + B (-x) (-y) = 2*B x y := by sorry

theorem primitiveHomology.equivariant {Z : Type*} [AddCommGroup Z] [Module K Z]
    (p : Z →ₗ[K] Y) (eZ : Z ≃ₗ[K] Z) (eY : Y ≃ₗ[K] Y)
    (h : ∀ z, p (eZ z) = eY (p z)) (z : Z) :
    z ∈ primitiveHomology p ↔ eZ z ∈ primitiveHomology p := by sorry

theorem primitiveHomology.symplectic {Z : Type*} [AddCommGroup Z] [Module K Z]
    (p : Z →ₗ[K] Y) (t : Y →ₗ[K] Z) (q : K) (hq : q ≠ 0)
    (hpt : p ∘ₗ t = q • LinearMap.id)
    (BZ : LinearMap.BilinForm K Z) (BY : LinearMap.BilinForm K Y)
    (hnd : ∀ z, (∀ w, BZ z w = 0) → z = 0)
    (hAlt : ∀ z, BZ z z = 0)
    (hproj : ∀ z y, BZ z (t y) = BY (p z) y) :
    (∀ z ∈ primitiveHomology p, BZ z z = 0) ∧
      ∀ z ∈ primitiveHomology p, (∀ w ∈ primitiveHomology p, BZ z w = 0) → z = 0 := by sorry
-- primitiveHomology.reviewTest3: the genus-two Aff(3) ranks and normalized transfer.
example {Z : Type*} [AddCommGroup Z] [Module ℚ Z] [FiniteDimensional ℚ Z]
    {Y : Type*} [AddCommGroup Y] [Module ℚ Y] [FiniteDimensional ℚ Y]
    (p : Z →ₗ[ℚ] Y) (t : Y →ₗ[ℚ] Z)
    (hpt : p ∘ₗ t = 3 • LinearMap.id)
    (hZ : Module.finrank ℚ Z = 10) (hY : Module.finrank ℚ Y = 4) :
    Module.finrank ℚ (primitiveHomology p) = 6 ∧
      primitiveProjection p t 3 ∘ₗ t = 0 := by sorry

def sumPush (I : Type*) [Fintype I] : (I → Y) →ₗ[K] Y where
  toFun z := ∑ i, z i
  map_add' := by sorry
  map_smul' := by sorry

theorem primitiveHomology.trivialCover (I : Type*) [Fintype I] (z : I → Y) :
    z ∈ primitiveHomology (sumPush (K := K) I) ↔ ∑ i, z i = 0 := by sorry

end MorePrimitive

-- Generic trace criterion, on the existing group-algebra module carrier.
theorem traceDeterminesSemisimple
    {k Γ V W : Type*} [Field k] [CharZero k] [Group Γ]
    [AddCommGroup V] [Module k V] [FiniteDimensional k V]
    [AddCommGroup W] [Module k W] [FiniteDimensional k W]
    (ρ : Representation k Γ V) (τ : Representation k Γ W)
    [IsSemisimpleModule (MonoidAlgebra k Γ) ρ.asModule]
    [IsSemisimpleModule (MonoidAlgebra k Γ) τ.asModule]
    (htrace : ∀ g, LinearMap.trace k V (ρ g) = LinearMap.trace k W (τ g)) :
    ∃ e : V ≃ₗ[k] W, ∀ g v, e (ρ g v) = τ g (e v) := by sorry

-- The rank bound is part of the statement; the rank-one counterexample is real.
theorem primitiveIntegralLift (r N : ℕ) (hr : 2 ≤ r) (hN : 0 < N)
    (f : (Fin r → ℤ) →+ ZMod N) (hf : Function.Surjective f) :
    ∃ ℓ : (Fin r → ℤ) →+ ℤ, Function.Surjective ℓ ∧ ∀ v, (ℓ v : ZMod N) = f v := by sorry

theorem signedPrimitiveSpanning (r : ℕ) (hr : 2 ≤ r)
    (repr : (Fin r → ℤ) → (Fin r → ℤ))
    (h : ∀ v, AddSubgroup.closure (Set.range v) = ⊤ → repr v = v ∨ repr v = -v) :
    Submodule.span ℚ {x : Fin r → ℚ | ∃ v w : Fin r → ℤ,
      AddSubgroup.closure (Set.range v) = ⊤ ∧
      AddSubgroup.closure (Set.range w) = ⊤ ∧
      x = fun i => (repr v i : ℚ) - (repr w i : ℚ)} = ⊤ := by sorry

theorem primitiveIntersectionAvoidance (r : ℕ) (hr : 2 ≤ r)
    (ℓ₁ ℓ₂ : (Fin r → ℚ) →ₗ[ℚ] ℚ) (h₁ : ℓ₁ ≠ 0) (h₂ : ℓ₂ ≠ 0) (B : ℚ) :
    ∃ v : Fin r → ℤ, AddSubgroup.closure (Set.range v) = ⊤ ∧
      B < |ℓ₁ (fun i => (v i : ℚ))| ∧ B < |ℓ₂ (fun i => (v i : ℚ))| := by sorry

namespace affineGroup
variable {q : ℕ} [Fact q.Prime]
def unitsLinearAction : (ZMod q)ˣ →* MulAut (Multiplicative (ZMod q)) := by sorry
theorem unitsLinearAction_apply (a : (ZMod q)ˣ) (x : Multiplicative (ZMod q)) :
    (unitsLinearAction a x).toAdd = (a : ZMod q) * x.toAdd := by sorry

def mulEquivSemidirect : affineGroup q ≃*
    (Multiplicative (ZMod q) ⋊[unitsLinearAction] (ZMod q)ˣ) := by sorry

theorem mulEquivSemidirect_mk (a : (ZMod q)ˣ) (b : ZMod q) :
    mulEquivSemidirect (mk a b) = ⟨Multiplicative.ofAdd b, a⟩ := by sorry

theorem isPretransitive (x y : ZMod q) : ∃ g : affineGroup q, g.val x = y := by sorry

-- Sharp two-transitivity is stronger than ordinary transitivity above.
theorem existsUnique_pair (x₁ x₂ y₁ y₂ : ZMod q)
    (hx : x₁ ≠ x₂) (hy : y₁ ≠ y₂) :
    ∃! g : affineGroup q, g.val x₁ = y₁ ∧ g.val x₂ = y₂ := by sorry
end affineGroup

section MoreCM
variable (K : Type*) [Field K] [NumberField K]
theorem finrank_largestCMSubfield_dvd :
    Module.finrank ℚ (largestCMSubfield K) ∣ Module.finrank ℚ K := by sorry

theorem finrank_largestCMSubfield_div :
    Module.finrank ℚ (largestCMSubfield K) = Module.finrank ℚ (largestTotallyRealSubfield K) ∨
    Module.finrank ℚ (largestCMSubfield K) = 2 * Module.finrank ℚ (largestTotallyRealSubfield K) := by sorry
end MoreCM

end TauCeti.LawrenceVenkatesh

/-
Signature omission ledger (DESIGN-LV~2, audited by REV-DESIGN-LV~2).
LV.0/affine-group: linearPart, ker_linearPart, stabilizer_zero, commutator_eq
and mulEquivAffineEquiv state partial comparisons. Surjectivity, translation
and stabilizer group equivalences, index/coset action, derived subgroup equality
(q ≥ 3), and evaluation/linear-part compatibility remain as specified in the
packet gap. Ordinary transitivity and sharp two-transitivity have separate signatures.

The omitted LV.3 monodromy and period-map interfaces use backward transport
on the opposite of Mathlib's fundamental group, with the left deck action by
prepending loops. The underlying forward local-system representation is on
the ordinary fundamental group; the image subgroup is the same.
The following entries are mathematical targets in the packet. They are omitted
from executable Lean until their named owner interfaces exist. These comments
are not declarations and do not certify the missing definitions or conditions.

MordellLawrenceVenkatesh:LV.0/semilinear-centralizer
Fixed-field module descent and the full unit-group/tensor-descent comparisons (LV.0 semilinear bound); no theorem result is included as a structure field.
Gap: Suggested signatures — semilinear-centralizer
Omitted: semilinearCentralizer_scalar
Partial adapters: semilinearCentralizer, units_semilinearCentralizer, semilinearCentralizer_linear

MordellLawrenceVenkatesh:LV.0/symplectic-transvection
The pinned Tau isometry-group coercion and the full codimension-one/dual-hyperplane and arbitrary-field SL₂ comparisons for the explicit Mathlib linear-equivalence core.
Gap: Suggested signatures — symplectic-transvection
Partial adapters: symplecticTransvection, eq_symplecticTransvection_of_codim_one, symplecticTransvection_sl2

MordellLawrenceVenkatesh:LV.1/largest-cm-subfield
The absolute-closure embedding/orbit interface for H, and an explicit cyclotomic-field carrier connected to NumberField.IsCMField, including the real-subfield tower.
Gap: Suggested signatures — largest-cm-subfield
Omitted: embeddings_eq_on_largestCMSubfield_iff, largestCMSubfield_cyclotomic
Partial adapters: isCMField_largestCMSubfield_iff

MordellLawrenceVenkatesh:LV.1/friendly-place
Finite places with unramified Galois closure, restriction to E_K and E_K⁺, inertness/splitting, and the Frobenius/complex-conjugation orbit criterion of LV Definition 2.7. This needs the ClassFieldTheory/Chebotarev and ArithmeticGalois place interfaces.
Gap: Suggested signatures — friendly-place
Omitted: IsFriendly, IsFriendly.isUnramified, isFriendly_iff_of_not_hasCMSubfield, isFriendly_iff_exists_decomposition, isFriendly_of_frobenius, isFriendly_map, isFriendly_rat, IsFriendly.reviewTest1, IsFriendly.reviewTest2, IsFriendly.reviewTest3

MordellLawrenceVenkatesh:LV.2/abelian-by-finite-family
A diagram of schemes with finite étale base, polarized AbelianScheme over that base, relative dimension and finite-étale fibre-algebra comparisons; requires SF.2/SF.3 and AbelianSchemes R12.1 exact APIs.
Gap: Suggested signatures — abelian-by-finite-family
Omitted: AbelianByFiniteFamily, AbelianByFiniteFamily.relDim, AbelianByFiniteFamily.total, AbelianByFiniteFamily.baseChange, AbelianByFiniteFamily.fibreAlgebra, AbelianByFiniteFamily.fibre, AbelianByFiniteFamily.ofAbelianScheme, AbelianByFiniteFamily.restrictScalars, AbelianByFiniteFamily.reviewTest1, AbelianByFiniteFamily.reviewTest2, AbelianByFiniteFamily.reviewTest3

MordellLawrenceVenkatesh:LV.2/good-model
Spread-out polarized abelian-by-finite diagrams over O_S, generic-fibre isomorphisms and good-reduction specializations; requires request LV-import-28 and integral point/base-change interfaces.
Gap: Suggested signatures — good-model
Omitted: IsGoodModel, IsGoodModel.baseChange, IsGoodModel.integralPoints, IsGoodModel.fibre_goodReduction, IsGoodModel.deRham_locallyFree, IsGoodModel.of_polarizedAbelianScheme, IsGoodModel.reviewTest1, IsGoodModel.reviewTest2, IsGoodModel.reviewTest3

MordellLawrenceVenkatesh:LV.2/de-rham-bundle
Relative H¹_dR as a locally free O_Y-module with the finite étale algebra action, Hodge subbundle, polarization pairing, integrable connection and fibre/base-change comparisons; requires CohomologyComparisons R17.1–R17.4.
Gap: Suggested signatures — de-rham-bundle
Omitted: deRhamBundle, deRhamBundle.hodge, deRhamBundle.pairing, deRhamBundle.gaussManin, deRhamBundle.fibreEquiv, deRhamBundle.fibreDecomp, deRhamBundle.baseChange, deRhamBundle.eq_gaussManin_total, deRhamBundle.legendre, deRhamBundle.reviewTest1, deRhamBundle.reviewTest2, deRhamBundle.reviewTest3

MordellLawrenceVenkatesh:LV.2/residue-disk
Integral points reducing to a fixed smooth special-fibre point, analytic parameter equivalences, finite cover by disks and finite-étale product decomposition over K_v; requires formal/completed-local and p-adic analytic owner APIs.
Gap: Suggested signatures — residue-disk
Omitted: residueDisk, residueDisk.coords, residueDisk.coords_germ, residueDisk.mem_iff, residueDisk.coords_change, residueDisk.finiteEtale, residueDisk.cover, residueDisk.affineLine, residueDisk.reviewTest1, residueDisk.reviewTest2, residueDisk.reviewTest3

MordellLawrenceVenkatesh:LV.2/gauss-manin-transport-padic
Horizontal analytic parallel transport on a full residue disk with integrability, convergence, inverse, algebra action and pairing; requires the connection/analytic formalism and the LV convergence result.
Gap: Suggested signatures — gauss-manin-transport-padic
Omitted: gaussManinTransport, gaussManinTransport_self, gaussManinTransport_trans, gaussManinTransport_algebra, gaussManinTransport_pairing, gaussManinTransport_matrix, gaussManinTransport_indep, gaussManinTransport_pairs, gaussManinTransport_constant, gaussManinTransport.reviewTest1, gaussManinTransport.reviewTest2, gaussManinTransport.reviewTest3

MordellLawrenceVenkatesh:LV.2/gauss-manin-transport-complex
Complex analytic parallel transport and Riemann–Hilbert comparison with the rational/Betti local system, continued on the universal cover; requires ComplexComparisonPartII and owner local-system APIs.
Gap: Suggested signatures — gauss-manin-transport-complex
Omitted: gaussManinTransportComplex, gaussManinTransportComplex_eq_parallel, gaussManinTransportComplex_series, gaussManinTransportComplex_trans, gaussManinTransportComplex_pairing, gaussManinTransportComplex_monodromy, gaussManinTransportComplex_legendre, gaussManinTransportComplex.reviewTest1, gaussManinTransportComplex.reviewTest2, gaussManinTransportComplex.reviewTest3

MordellLawrenceVenkatesh:LV.2/crystalline-frobenius-on-fibres
Actual crystalline H¹ of the special fibre, its invertible semilinear Frobenius and crystalline–de Rham/parallel-transport comparison, including similitude pairing; requires CrystallineCohomology R14.4 and p-adic cohomology comparisons.
Gap: Suggested signatures — crystalline-frobenius-on-fibres
Omitted: crystallineFrobenius, crystallineFrobenius_semilinear, crystallineFrobenius_bijective, crystallineFrobenius_transport, crystallineFrobenius_factor, crystallineFrobenius_pairing, crystallineFrobenius_example, crystallineFrobenius.reviewTest1, crystallineFrobenius.reviewTest2, crystallineFrobenius.reviewTest3

MordellLawrenceVenkatesh:LV.3/lagrangian-grassmannian
The representing Grassmannian scheme, tautological subbundle, closed isotropy section, symmetric graph charts, Plücker embedding and symplectic group action; Mathlib supplies the functor, not this representing-scheme package.
Gap: Suggested signatures — lagrangian-grassmannian
Omitted: LagrangianGrassmannian, LagrangianGrassmannian.functor, LagrangianGrassmannian.mem_points_iff, LagrangianGrassmannian.chart, LagrangianGrassmannian.chart_cover, LagrangianGrassmannian.plucker, LagrangianGrassmannian.action, LagrangianGrassmannian.baseChange, LagrangianGrassmannian.dimOne, LagrangianGrassmannian.reviewTest1, LagrangianGrassmannian.reviewTest2, LagrangianGrassmannian.reviewTest3

MordellLawrenceVenkatesh:LV.3/lagrangian-period-variety
Finite-étale componentwise-rank Grassmannian, trace pairing, E-stable isotropic closed locus and semilinear algebraic-group action; the full stable locus is not the fixed-rank Weil restriction (LV-import-30 and LV-import-50).
Gap: Suggested signatures — lagrangian-period-variety
Omitted: periodVariety, periodVariety.mem_iff, periodVariety.mem_points_iff_free, periodVariety.traceForm, periodVariety.baseChange, periodVariety.prodEquiv, periodVariety.semilinearAction, periodVariety.plucker, periodVariety.stableGrassmannian, periodVariety.dimOne, periodVariety.reviewTest1, periodVariety.reviewTest2, periodVariety.reviewTest3

MordellLawrenceVenkatesh:LV.3/algebraic-monodromy-group
Betti local-system monodromy, algebraic subgroup closure and its de Rham tensor/algebra normalizer comparison; requires LV-import-01/32 and the actual comparison isomorphisms.
Gap: Suggested signatures — algebraic-monodromy-group
Omitted: monodromyRep, algebraicMonodromyGroup, HasFullMonodromy, algebraicMonodromyGroup_le_normalizer, hasFullMonodromy_iff_basepoint, algebraicMonodromyGroup_deRham, HasFullMonodromy.orbit_eq, hasFullMonodromy_legendre, monodromyRep.reviewTest1, monodromyRep.reviewTest2, monodromyRep.reviewTest3, monodromyRep.reviewTest4

MordellLawrenceVenkatesh:LV.3/padic-period-map
Analytic Grassmannian-valued map obtained from the actual Hodge subbundle and horizontal transport, with the E-linear/isotropic and rebase comparisons.
Gap: Suggested signatures — padic-period-map
Omitted: padicPeriodMap, padicPeriodMap_base, padicPeriodMap_mem, padicPeriodMap_transport, padicPeriodMap_rebase, padicPeriodMap_constant, padicPeriodMap.reviewTest1, padicPeriodMap.reviewTest2, padicPeriodMap.reviewTest3

MordellLawrenceVenkatesh:LV.3/complex-period-map
Holomorphic lifted Grassmannian map on the universal cover, with rational monodromy equivariance and the local power-series comparison to the p-adic map.
Gap: Suggested signatures — complex-period-map
Omitted: complexPeriodMap, complexPeriodMap.lift, complexPeriodMap.lift_base, complexPeriodMap.lift_equivariant, complexPeriodMap.lift_holomorphic, complexPeriodMap.lift_eq, complexPeriodMap.mem, complexPeriodMap.legendre, complexPeriodMap.reviewTest1, complexPeriodMap.reviewTest2, complexPeriodMap.reviewTest3

MordellLawrenceVenkatesh:LV.5/surface
Bare compact oriented topological two-manifold-with-boundary and its punctured interior complement, with collars and tame cutting; requires GeometricTopology Part II. Genus, homology and classification are separate results.
Gap: Suggested signatures — surface
Omitted: Surface, Surface.numPunctures, Surface.cut, Surface.examples, Surface.reviewTest1, Surface.reviewTest2, Surface.reviewTest3

MordellLawrenceVenkatesh:LV.5/mapping-class-group
Ambient-isotopy quotient of orientation-preserving homeomorphisms fixing boundary and preserving marked points, plus forgetful, homology, curve and covering actions; requires GeometricTopology Part II.
Gap: Suggested signatures — mapping-class-group
Omitted: MappingClassGroup, MappingClassGroup.marked, MappingClassGroup.homologyRep, MappingClassGroup.actCurves, MappingClassGroup.actCovers, MappingClassGroup.forget, MappingClassGroup.examples, MappingClassGroup.reviewTest1, MappingClassGroup.reviewTest2, MappingClassGroup.reviewTest3

MordellLawrenceVenkatesh:LV.5/dehn-twist
Annulus collar construction and isotopy independence, supported multitwists, boundary behaviour and intersection-form convention; requires the surface/isotopy/collar interface.
Gap: Suggested signatures — dehn-twist
Omitted: dehnTwist, dehnTwist_conj, dehnTwist_commute, dehnTwist_eq_one, dehnTwist_support, multitwist, dehnTwist_torus, dehnTwist.reviewTest1, dehnTwist.reviewTest2, dehnTwist.reviewTest3

MordellLawrenceVenkatesh:LV.5/point-push
Isotopy extension of a marked point, endpoint mapping class and its based-loop action with Mathlib multiplication; the exact Birman sequence requires centrelessness/isotopy-control gaps.
Gap: Suggested signatures — point-push
Omitted: pointPush, pointPush_apply, forget_pointPush, pointPush_action, pointPush_homology, pointPush_torus, pointPush.reviewTest1, pointPush.reviewTest2, pointPush.reviewTest3

MordellLawrenceVenkatesh:LV.5/simple-closed-curve
Oriented smooth/tame embedding and its ambient-isotopy quotient, homology orientation, complement separation and collar-cutting data; requires the smoothing/isotopy comparison.
Gap: Suggested signatures — simple-closed-curve
Omitted: SimpleClosedCurve, SimpleClosedCurve.homologyClass, SimpleClosedCurve.IsSeparating, SimpleClosedCurve.reverse, SimpleClosedCurve.map, SimpleClosedCurve.cut, SimpleClosedCurve.reviewTest1, SimpleClosedCurve.reviewTest2, SimpleClosedCurve.reviewTest3

MordellLawrenceVenkatesh:LV.6/legendre-family
Finite-étale parameter-cover scheme u↦u^m and relative Legendre abelian scheme, compared with the concrete Weierstrass/AdjoinRoot cores.
Gap: Suggested signatures — legendre-family
Omitted: legendreVariant, legendreVariant.isGoodModel, legendreVariant.fibreAlgebra, legendreVariant.analytic
Partial adapters: legendreCurve, legendreCurve.reviewTest2

MordellLawrenceVenkatesh:LV.7/size-v
Unramified finite G_K-set and Frobenius-place adapter, followed by finite-étale geometric-point and completed-field-degree comparisons (LV-import-49).
Gap: Suggested signatures — size-v
Omitted: sizeV_scheme, sizeV_eq_places
Partial adapters: sizeV, sizeV_indep

MordellLawrenceVenkatesh:LV.8/singly-ramified-surjections
Profinite continuous homomorphism and quotient-factorization comparisons for the abstract-group carrier; the centreless stabilizer convention is already stated.
Gap: Suggested signatures — singly-ramified-surjections
Partial adapters: singlyRamifiedSurjections, singlyRamifiedSurjections.comap

MordellLawrenceVenkatesh:LV.8/hurwitz-cover-complex
Actual finite analytic covering of the base with surjection-class fibres and universal branched covering family, including local z↦z^q models, from the exact Riemann-existence/configuration interfaces.
Gap: Suggested signatures — hurwitz-cover-complex
Omitted: hurwitzComplex, hurwitzComplex.fibre, hurwitzComplex.torsor, hurwitzComplex.localForm, hurwitzComplex.relativeCurve, hurwitzComplex.configuration, hurwitzComplex.aff3, hurwitzComplex.reviewTest1, hurwitzComplex.reviewTest2, hurwitzComplex.reviewTest3

MordellLawrenceVenkatesh:LV.8/reduced-prym
Relative identity component of the norm-kernel on Jacobians, its polarization and H¹ projector comparison, requiring LV-import-63 and the generic-projector gap.
Gap: Suggested signatures — reduced-prym
Omitted: reducedPrym, reducedPrym.isAbelianScheme, reducedPrym.polarization, reducedPrym.fibre, reducedPrym.baseChange, reducedPrym.dim, reducedPrym.example, reducedPrym.reviewTest1, reducedPrym.reviewTest2, reducedPrym.reviewTest3

MordellLawrenceVenkatesh:LV.8/kodaira-parshin-family
Finite étale Hurwitz scheme and smooth proper branched-curve diagram, followed by the reduced-Prym abelian scheme, spreading model and primitive-homology comparison.
Gap: Suggested signatures — kodaira-parshin-family
Omitted: kodairaParshinCurves, kodairaParshin, kodairaParshin.relDim, kodairaParshin.exists_goodModel, kodairaParshin.fibreEquiv, kodairaParshin.fibreHomology, kodairaParshin.example, kodairaParshinCurves.reviewTest1, kodairaParshinCurves.reviewTest2, kodairaParshinCurves.reviewTest3

MordellLawrenceVenkatesh:LV.9/affine-cover
Covering-space classification with a labelled Aff(q) monodromy representation, compactification at a single puncture and ramification/genus comparisons; not a structure containing these theorems as assumptions.
Gap: Suggested signatures — affine-cover
Omitted: AffineCover, AffineCover.cov, AffineCover.iso_iff, AffineCover.cycleType, SinglyRamified, SinglyRamified.genus, SinglyRamified.finite, SinglyRamified.modAction, SinglyRamified.example, AffineCover.reviewTest1, AffineCover.reviewTest2, AffineCover.reviewTest3

MordellLawrenceVenkatesh:LV.9/primitive-homology
Singular H₁ pushforward and rational branched transfer with the projection formula, surface pairing and genus computation; linear-map kernels alone do not supply these identities.
Gap: Suggested signatures — primitive-homology
Omitted: transfer
Partial adapters: primitiveHomology, isCompl_primitiveHomology, primitiveHomology_eq_orthogonal, primitiveHomology.symplectic, primitiveHomology.equivariant, primitiveHomology.finrank, primitiveHomology.trivialCover

MordellLawrenceVenkatesh:LV.9/lifted-monodromy
Unique lift of a mapping class preserving a covering class, its rational H₁ representation and compatibility with transfer, products and the lifted Dehn multitwist.
Gap: Suggested signatures — lifted-monodromy
Omitted: liftMappingClass, liftMappingClass_unique, monodromyMap, stabilizerAll, pushSubgroup, monodromyMap.prod, monodromyMap_push_transfer, monodromyMap_twist, monodromyMap.example, liftMappingClass.reviewTest1, liftMappingClass.reviewTest2, liftMappingClass.reviewTest3

MordellLawrenceVenkatesh:LV.9/liftable-curve
Actual embedded curve, monodromy linear part, unique degree-one lift and primitive class; its computation is now the separate liftable-curve-transvection theorem.
Gap: Suggested signatures — liftable-curve
Omitted: IsLiftable, IsLiftable.nonseparating, IsLiftable.liftPlus, IsLiftable.primitiveClass, IsLiftable.mon_twist, IsLiftable.inner_eq, IsLiftable.example, IsLiftable.reviewTest1, IsLiftable.reviewTest2, IsLiftable.reviewTest3

Named theorem interfaces — LV.0:
MordellLawrenceVenkatesh:LV.0/galois-tensor-splitting, MordellLawrenceVenkatesh:LV.0/semilinear-centralizer-finrank, MordellLawrenceVenkatesh:LV.0/semilinear-centralizer-unramified, MordellLawrenceVenkatesh:LV.0/affine-group-cycle-type, MordellLawrenceVenkatesh:LV.0/affine-group-centralizer, MordellLawrenceVenkatesh:LV.0/commutator-product-map, MordellLawrenceVenkatesh:LV.0/generating-tuples-card, MordellLawrenceVenkatesh:LV.0/isotropic-subgroup-card, MordellLawrenceVenkatesh:LV.0/minimal-subrepresentation-half, MordellLawrenceVenkatesh:LV.0/zariski-closure-transvection-powers, MordellLawrenceVenkatesh:LV.0/transvection-pair-closure, MordellLawrenceVenkatesh:LV.0/transvection-graph-closure, MordellLawrenceVenkatesh:LV.0/lie-algebra-goursat, MordellLawrenceVenkatesh:LV.0/symplectic-pair-lemma, MordellLawrenceVenkatesh:LV.0/symplectic-goursat, MordellLawrenceVenkatesh:LV.0/galois-module-splitting, MordellLawrenceVenkatesh:LV.0/two-factor-lie-goursat, MordellLawrenceVenkatesh:LV.0/ideals-of-simple-products

Named theorem interfaces — LV.1:
MordellLawrenceVenkatesh:LV.1/weil-polynomials-finite, MordellLawrenceVenkatesh:LV.1/frobenius-test-set, MordellLawrenceVenkatesh:LV.1/faltings-finiteness, MordellLawrenceVenkatesh:LV.1/cm-or-totally-real-criterion, MordellLawrenceVenkatesh:LV.1/infinity-type-factorization, MordellLawrenceVenkatesh:LV.1/friendly-exponent-half, MordellLawrenceVenkatesh:LV.1/de-rham-character-locally-algebraic, MordellLawrenceVenkatesh:LV.1/pure-character-conjugation-relation, MordellLawrenceVenkatesh:LV.1/pure-character-friendly, MordellLawrenceVenkatesh:LV.1/hodge-weight-pure-representation, MordellLawrenceVenkatesh:LV.1/de-rham-of-induced, MordellLawrenceVenkatesh:LV.1/hodge-weight-sum-over-places, MordellLawrenceVenkatesh:LV.1/abelian-variety-cohomology-properties

Named theorem interfaces — LV.2:
MordellLawrenceVenkatesh:LV.2/good-model-exists, MordellLawrenceVenkatesh:LV.2/formal-horizontal-sections, MordellLawrenceVenkatesh:LV.2/horizontal-sections-padic-convergence, MordellLawrenceVenkatesh:LV.2/horizontal-sections-complex-convergence

Named theorem interfaces — LV.3:
MordellLawrenceVenkatesh:LV.3/lagrangian-symplectic-basis, MordellLawrenceVenkatesh:LV.3/isotropic-dimension, MordellLawrenceVenkatesh:LV.3/lagrangian-transitivity, MordellLawrenceVenkatesh:LV.3/lagrangian-transverse-chart, MordellLawrenceVenkatesh:LV.3/arnold-chart-cover, MordellLawrenceVenkatesh:LV.3/lagrangian-grassmannian-geometry, MordellLawrenceVenkatesh:LV.3/lagrangian-period-variety-splitting, MordellLawrenceVenkatesh:LV.3/period-maps-common-series, MordellLawrenceVenkatesh:LV.3/complex-period-closure-contains-orbit, MordellLawrenceVenkatesh:LV.3/convergent-series-vanishing, MordellLawrenceVenkatesh:LV.3/power-series-zariski-closure, MordellLawrenceVenkatesh:LV.3/padic-period-image-dense, MordellLawrenceVenkatesh:LV.3/strassmann, MordellLawrenceVenkatesh:LV.3/padic-period-preimage-finite

Named theorem interfaces — LV.4:
MordellLawrenceVenkatesh:LV.4/fibre-representation-crystalline, MordellLawrenceVenkatesh:LV.4/fibre-filtered-phi-transport, MordellLawrenceVenkatesh:LV.4/filtered-phi-orbit, MordellLawrenceVenkatesh:LV.4/finiteness-criterion, MordellLawrenceVenkatesh:LV.4/proposition-3-4

Named theorem interfaces — LV.5:
MordellLawrenceVenkatesh:LV.5/surface-classification, MordellLawrenceVenkatesh:LV.5/change-of-coordinates, MordellLawrenceVenkatesh:LV.5/dehn-twist-homology, MordellLawrenceVenkatesh:LV.5/primitive-classes-simple, MordellLawrenceVenkatesh:LV.5/birman-exact-sequence, MordellLawrenceVenkatesh:LV.5/capping-surjective, MordellLawrenceVenkatesh:LV.5/symplectic-representation-surjective, MordellLawrenceVenkatesh:LV.5/fadell-neuwirth-sequence, MordellLawrenceVenkatesh:LV.5/covering-dehn-twist-lift, MordellLawrenceVenkatesh:LV.5/configuration-family-monodromy, MordellLawrenceVenkatesh:LV.5/surface-homology

Named theorem interfaces — LV.6:
MordellLawrenceVenkatesh:LV.6/s-unit-reductions, MordellLawrenceVenkatesh:LV.6/kummer-cyclic-field, MordellLawrenceVenkatesh:LV.6/inert-auxiliary-place, MordellLawrenceVenkatesh:LV.6/legendre-monodromy, MordellLawrenceVenkatesh:LV.6/closed-subgroup-with-factor-unipotents, MordellLawrenceVenkatesh:LV.6/variant-family-full-monodromy, MordellLawrenceVenkatesh:LV.6/legendre-generic-simplicity, MordellLawrenceVenkatesh:LV.6/s-unit-residue-disk-finite, MordellLawrenceVenkatesh:LV.6/s-unit-theorem

Named theorem interfaces — LV.7:
MordellLawrenceVenkatesh:LV.7/frobenius-orbits-places, MordellLawrenceVenkatesh:LV.7/lagrangian-general-position, MordellLawrenceVenkatesh:LV.7/frobenius-stable-lagrangian-avoidance, MordellLawrenceVenkatesh:LV.7/generic-simplicity-sublemma, MordellLawrenceVenkatesh:LV.7/generic-simplicity-family, MordellLawrenceVenkatesh:LV.7/representations-vary, MordellLawrenceVenkatesh:LV.7/proposition-5-3

Named theorem interfaces — LV.8:
MordellLawrenceVenkatesh:LV.8/curve-topological-genus, MordellLawrenceVenkatesh:LV.8/surjection-action-extension, MordellLawrenceVenkatesh:LV.8/hurwitz-descent, MordellLawrenceVenkatesh:LV.8/hurwitz-space, MordellLawrenceVenkatesh:LV.8/affine-group-idempotents, MordellLawrenceVenkatesh:LV.8/reduced-prym-homology, MordellLawrenceVenkatesh:LV.8/kodaira-parshin-fibre-map

Named theorem interfaces — LV.9:
MordellLawrenceVenkatesh:LV.9/preimage-classes-independent, MordellLawrenceVenkatesh:LV.9/twist-rank-detects-cycle-type, MordellLawrenceVenkatesh:LV.9/liftable-curve-transvection, MordellLawrenceVenkatesh:LV.9/boundary-fixing-symplectic-surjective, MordellLawrenceVenkatesh:LV.9/affine-cover-normal-form, MordellLawrenceVenkatesh:LV.9/normal-form-curves, MordellLawrenceVenkatesh:LV.9/primitive-homology-decomposition

Named theorem interfaces — LV.10:
MordellLawrenceVenkatesh:LV.10/push-monodromy-noncentral, MordellLawrenceVenkatesh:LV.10/covers-distinguished-by-curve, MordellLawrenceVenkatesh:LV.10/liftable-curve-system, MordellLawrenceVenkatesh:LV.10/lifted-monodromy-dense-factor, MordellLawrenceVenkatesh:LV.10/lifted-monodromy-dense-product, MordellLawrenceVenkatesh:LV.10/normal-subgroups-of-symplectic-products, MordellLawrenceVenkatesh:LV.10/push-monodromy-dense, MordellLawrenceVenkatesh:LV.10/kodaira-parshin-full-monodromy

Named theorem interfaces — LV.11:
MordellLawrenceVenkatesh:LV.11/admissible-prime, MordellLawrenceVenkatesh:LV.11/friendly-auxiliary-place, MordellLawrenceVenkatesh:LV.11/weil-pairing-frobenius, MordellLawrenceVenkatesh:LV.11/small-orbit-count, MordellLawrenceVenkatesh:LV.11/size-bound, MordellLawrenceVenkatesh:LV.11/faltings-theorem
-/

/- Surface-homology API omitted under Named theorem interfaces — LV.5:
Surface.genus, Surface.numBoundary, Surface.eulerChar_eq, Surface.intersectionForm, Surface.intersectionForm_perfect
-/
