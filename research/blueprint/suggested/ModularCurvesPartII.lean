import Mathlib.AlgebraicGeometry.EllipticCurve.Weierstrass
import Mathlib.AlgebraicGeometry.Noetherian
import Mathlib.AlgebraicGeometry.Normalization
import Mathlib.Analysis.SpecialFunctions.Elliptic.Weierstrass
import Mathlib.Basic.Complex.Basic
import Mathlib.Data.Finset.NatDivisors
import Mathlib.Data.Finset.Prod
import Mathlib.Data.Nat.Totient
import Mathlib.Data.ZMod.Basic
import Mathlib.GroupTheory.GroupAction.Quotient
import Mathlib.GroupTheory.Index
import Mathlib.GroupTheory.QuotientGroup.Basic
import Mathlib.LinearAlgebra.Dimension.Free
import Mathlib.LinearAlgebra.Finsupp.LinearCombination
import Mathlib.LinearAlgebra.FreeModule.Finite.Basic
import Mathlib.LinearAlgebra.Matrix.Determinant.Basic
import Mathlib.LinearAlgebra.Matrix.GeneralLinearGroup.Card
import Mathlib.LinearAlgebra.Matrix.GeneralLinearGroup.Defs
import Mathlib.LinearAlgebra.Matrix.SpecialLinearGroup
import Mathlib.LinearAlgebra.Prod
import Mathlib.NumberTheory.ArithmeticFunction.Misc
import Mathlib.NumberTheory.ModularForms.CongruenceSubgroups
import Mathlib.RepresentationTheory.Homological.GroupCohomology.LowDegree
import Mathlib.RepresentationTheory.Homological.GroupCohomology.Shapiro
import Mathlib.RingTheory.Ideal.Quotient.Operations
import Mathlib.RingTheory.LocalRing.Module
import Mathlib.RingTheory.Polynomial.Cyclotomic.Basic
import Mathlib.RingTheory.TensorProduct.Free
import Mathlib.Tactic.FieldSimp
import Mathlib.Tactic.NormNum
import Mathlib.Tactic.NormNum.Prime
import Mathlib.Tactic.Ring
import TauCeti.AlgebraicGeometry.AbelianVariety.Basic
import TauCeti.AlgebraicGeometry.IrreducibleOfConnectedDomainStalk
import TauCeti.AlgebraicTopology.LocalCoefficient
import TauCeti.LinearAlgebra.SymmetricPower.Basis
import TauCeti.NumberTheory.HeckeRing.GL2.Basic
import TauCeti.NumberTheory.ModularForms.CongruenceSubgroups.Basic
import TauCeti.RepresentationTheory.SymmetricPower

/-!
# Modular curves, following Katz–Mazur, Part II: suggested statements

This file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/ModularCurvesPartII.md` is definitive. The statements below
suggest Lean names and signatures so that contributors and reviewers converge on them;
proofs left as `sorry` are goals, and nothing here is claimed formalised.

Pinned baseline: Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174,
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.

Only what the pinned libraries can already express is stated: light definitions with real
bodies over existing carriers, the end statements those carriers support, and examples that
detect wrong conventions. Complex analytic spaces, generalized elliptic curves, algebraic
stacks and their coarse spaces, the modular curves over ℤ, their Jacobians, correspondences
and cohomology have no carrier at the pins. They are targets of the roadmap document; their
proposed names are listed at the end of this file. No proposition-valued placeholder or
sorry'd data definition stands in for them. Finite counts and linear maps below are actual
existing carriers: a count of Hermite normal forms is not a modular correspondence, and the
image of an arbitrary linear map is not geometric cohomology.
-/

set_option maxRecDepth 4096

noncomputable section

namespace TauCeti.ModularCurves

open scoped BigOperators

/-! ## R12.1–R13.2: uniformization, the analytic comparison and generalized elliptic curves -/

section UniformizationAndPolygons

/-! R12.1: Mathlib already owns the period pair, ℘ and its differential equation. -/

def latticeWeierstrass (L : PeriodPair) : WeierstrassCurve ℂ where
  a₁ := 0
  a₂ := 0
  a₃ := 0
  a₄ := -L.g₂ / 4
  a₆ := -L.g₃ / 4

theorem latticeWeierstrass_discriminant (L : PeriodPair) :
    (latticeWeierstrass L).Δ = L.g₂ ^ 3 - 27 * L.g₃ ^ 2 := by
  sorry

/-- This is the missing nonsingularity milestone, not a restatement of the ODE. -/
theorem latticeWeierstrass_isElliptic (L : PeriodPair) :
    (latticeWeierstrass L).IsElliptic := by
  sorry

-- The coordinate factor 1/2 is essential for the native five-coefficient model.
-- Packet test: latticeWeierstrass_equation.
example (L : PeriodPair) (z : ℂ) (hz : z ∉ L.lattice) :
    (L.derivWeierstrassP z / 2) ^ 2 =
      L.weierstrassP z ^ 3 - L.g₂ * L.weierstrassP z / 4 - L.g₃ / 4 := by
  sorry

-- Packet test: latticeWeierstrass_square (its g₃ half). The square lattice is stable
-- under multiplication by i, so g₃ = 0; then j = 1728 by the discriminant formula.
example (h : LinearIndependent ℝ ![(1 : ℂ), Complex.I]) :
    (PeriodPair.mk 1 Complex.I h).g₃ = 0 := by
  sorry

-- Packet test: latticeWeierstrass_collapsed_basis. Periods 1 and 2 are real-linearly
-- dependent, so they do not form a `PeriodPair`.
example : ¬ LinearIndependent ℝ ![(1 : ℂ), 2] := by
  intro h
  have := LinearIndependent.pair_iff.mp h 2 (-1) (by norm_num)
  norm_num at this

-- The pole test involves the analytic comparison and remains stated in the README.

/-! R13.1: the split integral one-gon equation, valid also in characteristic two. -/

def splitOneGonEquation : WeierstrassCurve ℤ where
  a₁ := 1
  a₂ := 0
  a₃ := 0
  a₄ := 0
  a₆ := 0

-- Packet test: neronPolygon_one. This is the affine normalization equation.
example (t : ℤ) :
    (t ^ 2 * (t + 1)) ^ 2 + (t * (t + 1)) * (t ^ 2 * (t + 1)) =
      (t * (t + 1)) ^ 3 := by
  ring

-- A light equation record does not assert ellipticity or define the polygon stack.
example : splitOneGonEquation.Δ = 0 := by
  norm_num [splitOneGonEquation, WeierstrassCurve.Δ, WeierstrassCurve.b₂,
    WeierstrassCurve.b₄, WeierstrassCurve.b₆, WeierstrassCurve.b₈]

-- Source issue E107: the discriminant of the level-three normal form y(y + a₁x + a₃) = x³.
example (a₁ a₃ : ℂ) :
    (WeierstrassCurve.mk a₁ 0 a₃ 0 0).Δ = a₃ ^ 3 * (a₁ ^ 3 - 27 * a₃) := by
  simp only [WeierstrassCurve.Δ, WeierstrassCurve.b₂, WeierstrassCurve.b₄,
    WeierstrassCurve.b₆, WeierstrassCurve.b₈]
  ring

/-! R12.5: the all-subgroup Hecke degree at n = 4 is σ₁(4) = 7; the cyclic degree is ψ(4) = 6. -/

-- Packet test: charZeroHecke_degree_four (its all-subgroup half).
example : ArithmeticFunction.sigma 1 4 = 7 := by
  rw [ArithmeticFunction.sigma_one_apply]
  decide

/-! R13.2: use the native cyclotomic degree theorem for primitive-root bases. -/

example : (Polynomial.cyclotomic 6 ℤ).natDegree = 2 := by
  rw [Polynomial.natDegree_cyclotomic]
  decide

/-! R12.4: the final connected-to-irreducible implication already exists. -/

open _root_.AlgebraicGeometry in
example (X : Scheme) [IsLocallyNoetherian X] [ConnectedSpace X]
    (hStalks : ∀ x : X.carrier, IsDomain (X.presheaf.stalk x)) :
    IrreducibleSpace X := by
  exact TauCeti.AlgebraicGeometry.irreducibleSpace_of_connected_of_isDomain_stalk X hStalks

end UniformizationAndPolygons

/-! ## R13.3, R13.4a (first targets), R13.5, R14.1 and R14.2: Tate charts, counts and degrees -/

section TateChartsAndCorrespondences

/-! R13.3: the proper Tate power map fails flatness at a node for m>1. -/

/-- Exponents of the basis of k[x,y]/(xy,x^m,y^m), for m>0.
This finite enumeration is not a construction of a ring or a formal curve. -/
def nodePowerFibreMonomials (m : ℕ) : Finset (ℕ × ℕ) :=
  ((Finset.range m).product (Finset.range m)).filter
    (fun ij => ij.1 = 0 ∨ ij.2 = 0)

/-- The identity power map has node fibre of length one. -/
example : (nodePowerFibreMonomials 1).card = 1 := by decide

/-- The square map has fibre basis 1,x,y: length three, not generic degree two. -/
example : nodePowerFibreMonomials 2 = {(0, 0), (1, 0), (0, 1)} ∧
    (nodePowerFibreMonomials 2).card = 3 := by decide

/-- The cube map has five basis monomials, not generic degree three. -/
example : (nodePowerFibreMonomials 3).card = 5 := by decide

/-! R14.1: degree arithmetic of the disjoint order-p correspondence. -/

/-- Rank of a degeneracy leg for a prime p. Its geometric meaning is in the README. -/
def degeneracyDegree (N p : ℕ) : ℕ := if p ∣ N then p else p + 1

/-- Test `degree_degeneracy_coprime`: N=11, p=2. -/
example : degeneracyDegree 11 2 = 3 := by decide

/-- Test `degree_degeneracy_dvd`: N=10, p=5. -/
example : degeneracyDegree 10 5 = 5 := by decide

/-- Coprime composite acceptance: the index-6 correspondence at level 11. -/
example : degeneracyDegree 11 2 * degeneracyDegree 11 3 = 12 := by decide

/-! R13.4a / R14.1: full and cyclic counts differ at repeated primes. -/

/-- HNF triples (a,d,b), with ad=m and 0≤b<d. Only a finite Nat enumeration. -/
def allSubgroupBranches (m : ℕ) : Finset (ℕ × ℕ × ℕ) :=
  ((Finset.range (m + 1)).product
    ((Finset.range (m + 1)).product (Finset.range (m + 1)))).filter
    (fun t => 0 < t.1 ∧ 0 < t.2.1 ∧ t.1 * t.2.1 = m ∧ t.2.2 < t.2.1)

/-- The cyclic HNF filter; it omits the scalar subgroup E[r] for r>1. -/
def cyclicSubgroupBranches (m : ℕ) : Finset (ℕ × ℕ × ℕ) :=
  (allSubgroupBranches m).filter (fun t => Nat.gcd (Nat.gcd t.1 t.2.1) t.2.2 = 1)

/-- Full-subgroup counting milestone, R14.1/full-and-cyclic-correspondences. -/
theorem allSubgroupBranches_card (m : ℕ) (hm : 0 < m) :
    (allSubgroupBranches m).card = ∑ d ∈ m.divisors, d := by
  sorry

/-- Prime-square cyclic degree milestone: ψ(p²)=p²+p. -/
theorem cyclicSubgroupBranches_primeSquare_card (p : ℕ) (hp : p.Prime) :
    (cyclicSubgroupBranches (p ^ 2)).card = p ^ 2 + p := by
  sorry

/-- Test `fullCyclic_one`: identity degree in both conventions. -/
example : (allSubgroupBranches 1).card = 1 ∧ (cyclicSubgroupBranches 1).card = 1 := by
  decide

/-- Test `fullCyclic_four`: σ₁(4)=7, ψ(4)=6. -/
example : (allSubgroupBranches 4).card = 7 ∧ (cyclicSubgroupBranches 4).card = 6 := by
  decide

/-- The excluded scalar branch is precisely the one detecting the m=4 error. -/
example : (2, 2, 0) ∈ allSubgroupBranches 4 ∧ (2, 2, 0) ∉ cyclicSubgroupBranches 4 := by
  decide

/-- Test `fullCyclic_squarefree`: m=6 gives twelve in both conventions. -/
example : (allSubgroupBranches 6).card = 12 ∧ (cyclicSubgroupBranches 6).card = 12 := by
  decide

/-- Another repeated prime: m=9 has one extra scalar subgroup. -/
example : (allSubgroupBranches 9).card = 13 ∧ (cyclicSubgroupBranches 9).card = 12 := by
  decide

/-- The coprime abstract product is already Tau Ceti's theorem, not a new plan. -/
example (m n : ℕ+) (hcop : Nat.Coprime (m : ℕ) (n : ℕ)) :
    HeckeRing.GL2.heckeT m * HeckeRing.GL2.heckeT n =
      HeckeRing.GL2.heckeT (m * n) :=
  HeckeRing.GL2.heckeT_mul_of_coprime m n hcop

/-! R14.1: component-fixed analytic shadow; field descent is a README target. -/

/-- The analytic Fricke formula on a chosen component. -/
noncomputable def atkinLehnerAnalytic (N z : ℂ) : ℂ := -1 / (N * z)

/-- Test `atkinLehnerAnalytic_involutive`, with essential nonzero hypotheses. -/
theorem atkinLehnerAnalytic_involutive (N z : ℂ) (hN : N ≠ 0) (hz : z ≠ 0) :
    atkinLehnerAnalytic N (atkinLehnerAnalytic N z) = z := by
  unfold atkinLehnerAnalytic
  field_simp

/-- The sign and reciprocal are both detected by this value. -/
example : atkinLehnerAnalytic 1 (2 : ℂ) = -1 / 2 := by
  norm_num [atkinLehnerAnalytic]

/-- The totalized formula at N=0 is zero; it is outside the Fricke domain. -/
example (z : ℂ) : atkinLehnerAnalytic 0 z = 0 := by
  simp [atkinLehnerAnalytic]

/-- Test `diamond_group_order_11`: the effective coarse unit quotient. -/
example : Nat.totient 11 / 2 = 5 := by decide

/-- Test `atkinLehnerExact_twelve`: exact divisors of 12 exclude 2 and 6. -/
example :
    ((12 : ℕ).divisors.filter (fun d => Nat.Coprime d (12 / d))) = {1, 3, 4, 12} := by
  decide

/-! R13.3: arithmetic checks of the corrected d-gon cusp indexing. -/

/-- Test `gammaOneBoundary_five`: two components, not eight, for N=d=5. -/
example : Nat.totient 5 / 2 * Nat.totient (5 / 5) = 2 := by decide

/-- Test `gammaOneBoundary_four`: the 4-gon stratum has degree one. -/
example : Nat.totient 4 / 2 * Nat.totient (4 / 4) = 1 := by decide

/-- Test `gammaOneBoundary_galois`: two degree-two components at N=15,d=5. -/
example : Nat.totient 5 / 2 * Nat.totient (15 / 5) = 4 := by decide

/-! R13.5: the first Baran quartic is smooth at 2 (split-Cartan level 13). -/

/-- Acceptance for the first Baran quartic at 2. On Z=1 the derivative
conditions reduce to g=t^7+t^3+1=0 and X=t^3+1, and F becomes t^10+1.
This Bézout identity rules out a common root over the algebraic closure.
The Z=0 argument is given in the README. -/
theorem baran_mod_two_certificate (R : Type*) [CommRing R] [CharP R 2] (t : R) :
    (t^9 + t^8 + t^7 + t^3 + t^2 + t + 1) * (t^7 + t^3 + 1) +
      (t^6 + t^5 + t^4 + t^2 + t) * (t^10 + 1) = 1 := by
  have h2 : (2 : R) = 0 := CharP.cast_eq_zero R 2
  ring_nf
  simp [h2]

/-! R14.2: the trace–pullback arithmetic is integral, even at ℓ dividing degree.
The norm, polarization, faithful image and Kummer-twisted Tate carrier themselves
remain README targets using the named lower suppliers. -/

/-- Test `albanese_comp_picZero_degeneracy`: same-leg norm–pull has multiplier 3. -/
example : degeneracyDegree 11 2 = 2 + 1 := by decide

end TateChartsAndCorrespondences

/-! ## R13.5: the split-Cartan model at ℓ = 12k + 1 -/

section SplitCartanModel

/-- Ramification index of the extension over which Edixhoven's model of X₀(ℓ²), and its
quotient X_s(ℓ), become semistable: ϖ^(ℓ²−1)=ℓ² (BDMTV Theorem 6.7). -/
def splitCartanRamificationIndex (ℓ : ℕ) : ℕ := (ℓ ^ 2 - 1) / 2

/-- For ℓ=12k+1 this is Edixhoven's exponent 12k(6k+1) (BDMTV Theorem 6.6). -/
theorem splitCartanRamificationIndex_eq (k : ℕ) :
    splitCartanRamificationIndex (12 * k + 1) = 12 * k * (6 * k + 1) := by
  sorry

/-- Level 13: the extension has ramification index 84 (BDMTV Corollary 6.8). -/
example : splitCartanRamificationIndex 13 = 84 := by decide

/-- Arithmetic genus of the semistable fibre of X_s(ℓ), ℓ=12k+1 (BDMTV Theorem 6.7): k horizontal
components of genus 3k, two Ig(ℓ)/C₄ components of genus (k−1)(3k−2)/2, one rational component,
and the dual graph K_(k,3), whose first Betti number is 3k−(k+3)+1. -/
def splitCartanFibreGenus (k : ℕ) : ℕ :=
  k * (3 * k) + 2 * ((k - 1) * (3 * k - 2) / 2) + (3 * k + 1 - (k + 3))

/-- The fibre genus is the genus 6k²−3k of X_s(ℓ). -/
theorem splitCartanFibreGenus_eq (k : ℕ) (hk : 1 ≤ k) :
    splitCartanFibreGenus k = 6 * k ^ 2 - 3 * k := by
  sorry

/-- Level 13: one genus-3 component on the tree K_(1,3) and three rational leaves, so genus 3. -/
example : splitCartanFibreGenus 1 = 3 := by decide

/-- ℓ=37 (k=3): genus 45; dropping the four independent cycles of K_(3,3) would give 41. -/
example : splitCartanFibreGenus 3 = 45 := by decide

end SplitCartanModel

/-! ## R13.4a: level subgroups, cusps and the recognition criterion -/

section CoarseCurves

open Matrix
open scoped MatrixGroups

/-! ## Levels (target `level-subgroups`)

A level structure is the orbit of a frame `φ : (ℤ/n)² ≅ E[n]` under `φ ↦ φ ∘ g`, so that
`(P, Q) • [[a, b], [c, d]] = (aP + cQ, bP + dQ)`. -/

/-- `GL₂(ℤ/n)`. -/
abbrev GL2 (n : ℕ) := GL (Fin 2) (ZMod n)

/-- `Γ₀(N)‾`: lower-left entry zero; the stabiliser of the line through `P`. -/
def levelGamma0 (n : ℕ) : Subgroup (GL2 n) where
  carrier := {g | (g : Matrix (Fin 2) (Fin 2) (ZMod n)) 1 0 = 0}
  one_mem' := by simp
  mul_mem' {a b} ha hb := by
    simp only [Set.mem_ofPred_eq, Units.val_mul, Matrix.mul_apply, Fin.sum_univ_two] at *
    rw [ha, hb]; ring
  inv_mem' {a} ha := by
    simp only [Set.mem_ofPred_eq] at *
    rw [Matrix.coe_units_inv, Matrix.inv_def, Matrix.adjugate_fin_two]
    simp [ha]

/-- `Γ₁(N)‾`: upper-left entry one and lower-left entry zero; the stabiliser of `P`. -/
def levelGamma1 (n : ℕ) : Subgroup (GL2 n) where
  carrier := {g | (g : Matrix (Fin 2) (Fin 2) (ZMod n)) 0 0 = 1 ∧
    (g : Matrix (Fin 2) (Fin 2) (ZMod n)) 1 0 = 0}
  one_mem' := by simp
  mul_mem' {a b} ha hb := by
    simp only [Set.mem_ofPred_eq, Units.val_mul, Matrix.mul_apply, Fin.sum_univ_two] at *
    obtain ⟨ha1, ha2⟩ := ha; obtain ⟨hb1, hb2⟩ := hb
    rw [ha1, ha2, hb1, hb2]; constructor <;> ring
  inv_mem' {a} ha := by
    simp only [Set.mem_ofPred_eq] at *
    obtain ⟨ha1, ha2⟩ := ha
    have hdet : (a : Matrix (Fin 2) (Fin 2) (ZMod n)).det =
        (a : Matrix (Fin 2) (Fin 2) (ZMod n)) 1 1 := by
      rw [Matrix.det_fin_two, ha1, ha2]; ring
    have hu : IsUnit (a : Matrix (Fin 2) (Fin 2) (ZMod n)).det := Matrix.isUnits_det_units a
    rw [Matrix.coe_units_inv, Matrix.inv_def, Matrix.adjugate_fin_two]
    refine ⟨?_, by simp [ha2]⟩
    simp only [Matrix.smul_apply, Matrix.of_apply, Matrix.cons_val', Matrix.cons_val_zero,
      Matrix.cons_val_fin_one, smul_eq_mul]
    rw [← hdet]; exact Ring.inverse_mul_cancel _ hu

/-- `Γ₁^μ(N)‾`: lower row `(0, 1)`; its structures are embeddings `μ_N ↪ E[N]`. -/
def levelGamma1Mu (n : ℕ) : Subgroup (GL2 n) where
  carrier := {g | (g : Matrix (Fin 2) (Fin 2) (ZMod n)) 1 1 = 1 ∧
    (g : Matrix (Fin 2) (Fin 2) (ZMod n)) 1 0 = 0}
  one_mem' := by simp
  mul_mem' {a b} ha hb := by
    simp only [Set.mem_ofPred_eq, Units.val_mul, Matrix.mul_apply, Fin.sum_univ_two] at *
    obtain ⟨ha1, ha2⟩ := ha; obtain ⟨hb1, hb2⟩ := hb
    rw [ha1, ha2, hb1, hb2]; constructor <;> ring
  inv_mem' {a} ha := by
    simp only [Set.mem_ofPred_eq] at *
    obtain ⟨ha1, ha2⟩ := ha
    have hdet : (a : Matrix (Fin 2) (Fin 2) (ZMod n)).det =
        (a : Matrix (Fin 2) (Fin 2) (ZMod n)) 0 0 := by
      rw [Matrix.det_fin_two, ha1, ha2]; ring
    have hu : IsUnit (a : Matrix (Fin 2) (Fin 2) (ZMod n)).det := Matrix.isUnits_det_units a
    rw [Matrix.coe_units_inv, Matrix.inv_def, Matrix.adjugate_fin_two]
    refine ⟨?_, by simp [ha2]⟩
    simp only [Matrix.smul_apply, Matrix.of_apply, Matrix.cons_val', Matrix.cons_val_one,
      Matrix.cons_val_fin_one, smul_eq_mul]
    rw [← hdet]; exact Ring.inverse_mul_cancel _ hu

/-- The split Cartan subgroup `C_s`: diagonal matrices. -/
def splitCartan (n : ℕ) : Subgroup (GL2 n) where
  carrier := {g | (g : Matrix (Fin 2) (Fin 2) (ZMod n)) 0 1 = 0 ∧
    (g : Matrix (Fin 2) (Fin 2) (ZMod n)) 1 0 = 0}
  one_mem' := by simp
  mul_mem' {a b} ha hb := by
    simp only [Set.mem_ofPred_eq, Units.val_mul, Matrix.mul_apply, Fin.sum_univ_two] at *
    obtain ⟨ha1, ha2⟩ := ha; obtain ⟨hb1, hb2⟩ := hb
    rw [ha1, ha2, hb1, hb2]; constructor <;> ring
  inv_mem' {a} ha := by
    simp only [Set.mem_ofPred_eq] at *
    obtain ⟨ha1, ha2⟩ := ha
    rw [Matrix.coe_units_inv, Matrix.inv_def, Matrix.adjugate_fin_two]
    simp [ha1, ha2]

/-- The normaliser `C_s⁺` of the split Cartan subgroup. -/
def splitCartanNormalizer (n : ℕ) : Subgroup (GL2 n) :=
  Subgroup.normalizer (splitCartan n : Set (GL2 n))

/-- The nonsplit Cartan subgroup `{[[a, εb], [b, a]]}` attached to `ε`; it is the image of
`𝔽_{ℓ²}^×` when `n = ℓ` is an odd prime and `ε` is a nonsquare. -/
def nonsplitCartan (n : ℕ) (ε : ZMod n) : Subgroup (GL2 n) where
  carrier := {g | (g : Matrix (Fin 2) (Fin 2) (ZMod n)) 1 1 = (g : Matrix (Fin 2) (Fin 2) (ZMod n)) 0 0 ∧
    (g : Matrix (Fin 2) (Fin 2) (ZMod n)) 0 1 = ε * (g : Matrix (Fin 2) (Fin 2) (ZMod n)) 1 0}
  one_mem' := by simp
  mul_mem' {a b} ha hb := by
    simp only [Set.mem_ofPred_eq, Units.val_mul, Matrix.mul_apply, Fin.sum_univ_two] at *
    obtain ⟨ha1, ha2⟩ := ha; obtain ⟨hb1, hb2⟩ := hb
    rw [ha1, ha2, hb1, hb2]; constructor <;> ring
  inv_mem' {a} ha := by
    simp only [Set.mem_ofPred_eq] at *
    obtain ⟨ha1, ha2⟩ := ha
    rw [Matrix.coe_units_inv, Matrix.inv_def, Matrix.adjugate_fin_two]
    simp only [Matrix.smul_apply, Matrix.of_apply, Matrix.cons_val', Matrix.cons_val_one,
      Matrix.cons_val_zero, Matrix.cons_val_fin_one, smul_eq_mul]
    rw [ha1, ha2]; constructor <;> ring

/-- The normaliser `C_ns⁺` of the nonsplit Cartan subgroup. -/
def nonsplitCartanNormalizer (n : ℕ) (ε : ZMod n) : Subgroup (GL2 n) :=
  Subgroup.normalizer (nonsplitCartan n ε : Set (GL2 n))

/-- The projective index `[GL₂(ℤ/n) : ±H]`, the degree of the coarse `j`-map `X_H → ℙ¹`. -/
noncomputable def projectiveIndex {n : ℕ} (H : Subgroup (GL2 n)) : ℕ :=
  (H ⊔ Subgroup.zpowers (-1)).index

/-- The determinant image `det(H̄) ⊂ (ℤ/n)ˣ`; its fixed field in `ℚ(ζ_n)` is the field of
definition of the components of `X_H`. -/
def levelDet {n : ℕ} (H : Subgroup (GL2 n)) : Subgroup (ZMod n)ˣ :=
  H.map Matrix.GeneralLinearGroup.det

/-- Reduction `SL(2, ℤ) → GL₂(ℤ/N)`. -/
def reduction (N : ℕ) : SL(2, ℤ) →* GL2 N :=
  Matrix.SpecialLinearGroup.toGL.comp (Matrix.SpecialLinearGroup.map (Int.castRingHom (ZMod N)))

/-- Pullback of a level along reduction `GL₂(ℤ/m) → GL₂(ℤ/n)` for `n ∣ m`. -/
def levelPullback {n m : ℕ} (h : n ∣ m) (H : Subgroup (GL2 n)) : Subgroup (GL2 m) :=
  H.comap (Matrix.GeneralLinearGroup.map (ZMod.castHom h (ZMod n)))

/-- The projective index equals the index when `-1 ∈ H̄`, and is half of it otherwise. -/
theorem projectiveIndex_eq_index {n : ℕ} (H : Subgroup (GL2 n)) :
    ((-1 : GL2 n) ∈ H → projectiveIndex H = H.index) ∧
      ((-1 : GL2 n) ∉ H → H.index = 2 * projectiveIndex H) := by
  refine ⟨fun h ↦ ?_, fun _ ↦ sorry⟩
  rw [projectiveIndex, sup_eq_left.mpr ((Subgroup.zpowers_le).mpr h)]

/-- Index and projective index are unchanged by pulling back to a multiple of the level. -/
theorem levelPullback_index {n m : ℕ} [NeZero m] (h : n ∣ m) (H : Subgroup (GL2 n)) :
    (levelPullback h H).index = H.index ∧
      projectiveIndex (levelPullback h H) = projectiveIndex H := sorry

/-- Conjugation preserves the index, the projective index and the determinant image. -/
theorem levelConj {n : ℕ} (g : GL2 n) (H : Subgroup (GL2 n)) :
    (H.map (MulAut.conj g).toMonoidHom).index = H.index ∧
      projectiveIndex (H.map (MulAut.conj g).toMonoidHom) = projectiveIndex H ∧
      levelDet (H.map (MulAut.conj g).toMonoidHom) = levelDet H := sorry

/-- Compatibility with Mathlib's congruence subgroups of `SL(2, ℤ)`. -/
theorem levelGamma0_comap (N : ℕ) :
    (levelGamma0 N).comap (reduction N) = CongruenceSubgroup.Gamma0 N ∧
      (⊥ : Subgroup (GL2 N)).comap (reduction N) = CongruenceSubgroup.Gamma N := sorry

/-- Test `levelGamma1_comap`: the preimage of `Γ₁(N)‾` is Mathlib's `Γ₁(N)`, whose bottom row
is `(0, 1)`; the upper-left condition is forced by the determinant. -/
example (N : ℕ) : (levelGamma1 N).comap (reduction N) = CongruenceSubgroup.Gamma1 N := sorry

/-- Test `levelGamma0_projectiveIndex_prime`. -/
theorem levelGamma0_projectiveIndex_prime (p : ℕ) [Fact p.Prime] :
    projectiveIndex (levelGamma0 p) = p + 1 := sorry

/-- `-1` lies in `Γ₀(N)‾` but not in `Γ₁(5)‾`. -/
example (n : ℕ) : (-1 : GL2 n) ∈ levelGamma0 n := by
  show ((-1 : GL2 n) : Matrix (Fin 2) (Fin 2) (ZMod n)) 1 0 = 0
  simp

example : (-1 : GL2 5) ∉ levelGamma1 5 := by
  rintro ⟨h, -⟩
  rw [Units.val_neg, Units.val_one, Matrix.neg_apply, Matrix.one_apply_eq] at h
  exact absurd h (by decide)

/-- Test `levelGamma1_five_index`: the plain index is twice the coarse degree. -/
example : (levelGamma1 5).index = 24 ∧ projectiveIndex (levelGamma1 5) = 12 := sorry

/-- Test `splitCartanNormalizer_thirteen`: the degrees of `X_s⁺(13)` and `X_ns⁺(13)`
(`2` is a nonsquare modulo `13`). -/
example : projectiveIndex (splitCartanNormalizer 13) = 91 ∧
    projectiveIndex (nonsplitCartanNormalizer 13 2) = 78 := sorry

/-- Test `level_one`: at level one every subgroup is everything. -/
example (H : Subgroup (GL2 1)) : H.index = 1 ∧ projectiveIndex H = 1 := sorry

/-- The determinant image of `Γ₀(N)‾` is everything: the cyclotomic base of `X₀(N)` is `ℤ`
(test `cyclotomicBase_gamma0`, group-theoretic part). -/
theorem levelDet_levelGamma0 (N : ℕ) : levelDet (levelGamma0 N) = ⊤ := sorry

/-- The trivial level has trivial determinant image: the base of `X(N)` is `ℤ[ζ_N]`
(test `cyclotomicBase_full`, group-theoretic part). -/
example (N : ℕ) : levelDet (⊥ : Subgroup (GL2 N)) = ⊥ := Subgroup.map_bot _

/-! ## Cusps away from the level (target `coarse-cusps-away-from-the-level`)

The geometric cusps of `X_H` over a field of characteristic prime to `n` are the double cosets
`⟨±u⟩ \ GL₂(ℤ/n) / H̄`, `u = [[1, 1], [0, 1]]`. -/

/-- The unipotent element `u`, the monodromy of the Tate curve on the frame `(ζ, q^{1/n})`. -/
def unipotent (n : ℕ) : GL2 n :=
  ⟨!![1, 1; 0, 1], !![1, -1; 0, 1], by simp [Matrix.one_fin_two], by simp [Matrix.one_fin_two]⟩

/-- The group `⟨±u⟩`. -/
def cuspGroup (n : ℕ) : Subgroup (GL2 n) := Subgroup.closure {unipotent n, -1}

/-- The cusp double cosets `⟨±u⟩ \ GL₂(ℤ/n) / H̄`. -/
def Cusps {n : ℕ} (H : Subgroup (GL2 n)) : Type :=
  MulAction.orbitRel.Quotient (cuspGroup n) (GL2 n ⧸ H)

/-- `X₀(p)` has two cusps and `X₁(p)` has `p - 1`, for `p ≥ 5` prime. -/
theorem card_cusps_prime (p : ℕ) [Fact p.Prime] (hp : 5 ≤ p) :
    Nat.card (Cusps (levelGamma0 p)) = 2 ∧ Nat.card (Cusps (levelGamma1 p)) = p - 1 := sorry

/-- Test `cartanCurve_cusps` (group-theoretic part): `X_s⁺(ℓ)` has `(ℓ + 1) / 2` cusps and
`X_ns⁺(ℓ)` has `(ℓ - 1) / 2`, for an odd prime `ℓ` and a nonsquare `ε`. -/
theorem cartanCurve_cusps (ℓ : ℕ) [Fact ℓ.Prime] (hℓ : ℓ ≠ 2) (ε : ZMod ℓ)
    (hε : ¬ IsSquare ε) :
    Nat.card (Cusps (splitCartanNormalizer ℓ)) = (ℓ + 1) / 2 ∧
      Nat.card (Cusps (nonsplitCartanNormalizer ℓ ε)) = (ℓ - 1) / 2 := sorry

/-- Level one has the single cusp of `X(1)`. -/
example (n : ℕ) : Nat.card (Cusps (⊤ : Subgroup (GL2 n))) = 1 := sorry

/-! ## Recognising a relative normalization (target `finite-normal-recognition`) -/

open _root_.AlgebraicGeometry CategoryTheory in
/-- If `T` is integral over `J`, locally noetherian and normal, and `Y` is a dense open of `T`,
then `T` is the relative normalization of `J` in `Y`. Density and normality are needed: a spare
component of `T` (so that `Y` is not dense) or a non-normal `T` breaks the conclusion. -/
theorem finiteNormalRecognition {Y J T : Scheme.{0}} (f : Y ⟶ J) [QuasiCompact f]
    [QuasiSeparated f] (u : Y ⟶ T) (g : T ⟶ J) [IsIntegralHom g] [IsOpenImmersion u]
    (h : f = u ≫ g) [IsLocallyNoetherian T]
    (hT : ∀ x : T, IsDomain (T.presheaf.stalk x) ∧ IsIntegrallyClosed (T.presheaf.stalk x))
    (hu : Dense (Set.range u.base)) : IsIso (f.normalizationDesc u g h) := sorry

end CoarseCurves

/-! ## R14.3–R14.6: the algebraic core of the cohomological, Ihara, quotient and Taylor–Wiles targets -/

section CohomologyCore

open CategoryTheory
open scoped MatrixGroups TensorProduct Matrix

-- R14.3/relative-coefficient-system: monodromy signature after relative H¹ is supplied.
-- The geometric carrier is unavailable; this core enforces the weight bound.
def weightCoefficients {R : Type} {G M : Type*} [CommRing R] [Group G]
    [AddCommGroup M] [Module R M] (ρ : Representation R G M) (k : ℕ) (_hk : 2 ≤ k) :
    Representation R G (Sym[R]^(k - 2) M) := ρ.symmetricPower (k - 2)

-- Test weightCoefficients_compat; the geometric fibre tests are in the registry.
example {R : Type} {G M : Type*} [CommRing R] [Group G] [AddCommGroup M] [Module R M]
    (ρ : Representation R G M) (k : ℕ) (hk : 2 ≤ k) :
    weightCoefficients ρ k hk = ρ.symmetricPower (k - 2) := sorry

-- Algebraic parts of weightCoefficients_two and weightCoefficients_three.
example {R : Type} {G M : Type*} [CommRing R] [Group G] [AddCommGroup M] [Module R M]
    (ρ : Representation R G M) (g : G) :
    weightCoefficients ρ 2 (by decide) g = LinearMap.id := sorry
example : Module.finrank ℚ (Sym[ℚ]^0 (Fin 2 → ℚ)) = 1 := sorry
example : Module.finrank ℚ (Sym[ℚ]^1 (Fin 2 → ℚ)) = 2 := sorry
example {R : Type} {G M : Type*} [CommRing R] [Group G] [AddCommGroup M] [Module R M]
    (ρ : Representation R G M) (g : G) (m : Fin 1 → M) :
    weightCoefficients ρ 3 (by decide) g (⨂ₛ[R] i, m i) = ⨂ₛ[R] i, ρ g (m i) := sorry

-- R14.3/parabolic-cohomology: u is the actual support-forgetting map.
section Parabolic
variable {R C H C' H' C'' H'' : Type*} [CommRing R]
    [AddCommGroup C] [Module R C] [AddCommGroup H] [Module R H]
    [AddCommGroup C'] [Module R C'] [AddCommGroup H'] [Module R H']
    [AddCommGroup C''] [Module R C''] [AddCommGroup H''] [Module R H'']

def parabolicH1 (u : C →ₗ[R] H) : Submodule R H := LinearMap.range u

lemma mem_parabolicH1 (u : C →ₗ[R] H) (x : H) :
    x ∈ parabolicH1 u ↔ ∃ y, u y = x := sorry

def parabolicH1_inclusion (u : C →ₗ[R] H) : parabolicH1 u →ₗ[R] H :=
  (parabolicH1 u).subtype

def parabolicH1_map (u : C →ₗ[R] H) (v : C' →ₗ[R] H')
    (a : C →ₗ[R] C') (b : H →ₗ[R] H') (h : b.comp u = v.comp a) :
    parabolicH1 u →ₗ[R] parabolicH1 v :=
  b.restrict fun x hx => by
    obtain ⟨y, rfl⟩ := LinearMap.mem_range.mp (show x ∈ LinearMap.range u from hx)
    exact LinearMap.mem_range.mpr ⟨a y, by simpa using (LinearMap.congr_fun h y).symm⟩

lemma parabolicH1_map_apply (u : C →ₗ[R] H) (v : C' →ₗ[R] H')
    (a : C →ₗ[R] C') (b : H →ₗ[R] H') (h : b.comp u = v.comp a)
    (x : parabolicH1 u) : (parabolicH1_map u v a b h x : H') = b x := sorry

lemma parabolicH1_map_id (u : C →ₗ[R] H) :
    parabolicH1_map u u LinearMap.id LinearMap.id (by simp) = LinearMap.id := sorry
lemma parabolicH1_map_comp (u : C →ₗ[R] H) (v : C' →ₗ[R] H') (w : C'' →ₗ[R] H'')
    (a : C →ₗ[R] C') (b : H →ₗ[R] H') (h : b.comp u = v.comp a)
    (a' : C' →ₗ[R] C'') (b' : H' →ₗ[R] H'') (h' : b'.comp v = w.comp a') :
    (parabolicH1_map v w a' b' h').comp (parabolicH1_map u v a b h) =
      parabolicH1_map u w (a'.comp a) (b'.comp b) (by
        rw [LinearMap.comp_assoc, h, ← LinearMap.comp_assoc, h', LinearMap.comp_assoc]) := sorry

lemma parabolicH1_compact (u : C →ₗ[R] H) (hu : Function.Surjective u) :
    parabolicH1 u = ⊤ := sorry

-- Test parabolicH1_id.
example : parabolicH1 (LinearMap.id : H →ₗ[R] H) = ⊤ := sorry
-- Test parabolicH1_zero.
example : parabolicH1 (0 : C →ₗ[R] H) = ⊥ := sorry
end Parabolic

-- R14.4/degeneracy-cohomology: a,b are the actual geometric pullbacks.
section Degeneracy
variable {R H H' H'' : Type*} [CommRing R]
    [AddCommGroup H] [Module R H] [AddCommGroup H'] [Module R H']
    [AddCommGroup H''] [Module R H'']

def degeneracyH1 (a b : H →ₗ[R] H') : H × H →ₗ[R] H' := a.coprod b

lemma degeneracyH1_apply (a b : H →ₗ[R] H') (x y : H) :
    degeneracyH1 a b (x,y) = a x + b y := sorry
lemma degeneracyH1_fst (a b : H →ₗ[R] H') (x : H) :
    degeneracyH1 a b (x,0) = a x := sorry
lemma degeneracyH1_snd (a b : H →ₗ[R] H') (y : H) :
    degeneracyH1 a b (0,y) = b y := sorry
lemma degeneracyH1_hecke (a b : H →ₗ[R] H') (t : H →ₗ[R] H)
    (t' : H' →ₗ[R] H') (ha : t'.comp a = a.comp t)
    (hb : t'.comp b = b.comp t) (x y : H) :
    t' (degeneracyH1 a b (x,y)) = degeneracyH1 a b (t x,t y) := sorry
lemma degeneracyH1_sign (a b : H →ₗ[R] H') (x y : H) :
    degeneracyH1 a b (x,-y) = a x - b y := sorry

-- Test degeneracyH1_comp.
example (a b : H →ₗ[R] H') (c : H' →ₗ[R] H'') :
    c.comp (degeneracyH1 a b) = degeneracyH1 (c.comp a) (c.comp b) := sorry
-- Test degeneracyH1_zero.
example : degeneracyH1 (0 : H →ₗ[R] H') 0 = 0 := sorry
end Degeneracy
-- Test degeneracyH1_first, specializing the scalar ring to ℤ.
example : degeneracyH1 (LinearMap.id : ℤ →ₗ[ℤ] ℤ) 0 (3,5) = 3 := sorry
-- Test degeneracyH1_diagonal.
example : degeneracyH1 (LinearMap.id : ℤ →ₗ[ℤ] ℤ) LinearMap.id (1,-1) = 0 := sorry

-- R14.4/congruence-classes: actual Γ(N), not an arbitrary finite-index kernel family.
-- Additive Γ(N) changes notation for the source law; the target is the additive field.
def congruenceClasses (N q : ℕ) [NeZero N] [Fact q.Prime] :
    Submodule (ZMod q) (AddMonoidHom (Additive (CongruenceSubgroup.Gamma N)) (ZMod q)) where
  carrier := {ψ | ∃ M : ℕ, 0 < M ∧ N ∣ M ∧
    ∀ γ : CongruenceSubgroup.Gamma N,
      (γ : Matrix.SpecialLinearGroup (Fin 2) ℤ) ∈ CongruenceSubgroup.Gamma M →
      ψ (Additive.ofMul γ) = 0}
  zero_mem' := sorry
  add_mem' := sorry
  smul_mem' := sorry

lemma mem_congruenceClasses (N q : ℕ) [NeZero N] [Fact q.Prime]
    (ψ : AddMonoidHom (Additive (CongruenceSubgroup.Gamma N)) (ZMod q)) :
    ψ ∈ congruenceClasses N q ↔ ∃ M : ℕ, 0 < M ∧ N ∣ M ∧
      ∀ γ : CongruenceSubgroup.Gamma N,
        (γ : Matrix.SpecialLinearGroup (Fin 2) ℤ) ∈ CongruenceSubgroup.Gamma M →
        ψ (Additive.ofMul γ) = 0 := sorry

lemma congruenceClasses_refine (N M M' q : ℕ) [NeZero N] [Fact q.Prime]
    (h : M ∣ M')
    (ψ : AddMonoidHom (Additive (CongruenceSubgroup.Gamma N)) (ZMod q))
    (hψ : ∀ γ : CongruenceSubgroup.Gamma N,
      (γ : Matrix.SpecialLinearGroup (Fin 2) ℤ) ∈ CongruenceSubgroup.Gamma M →
      ψ (Additive.ofMul γ) = 0) :
    ∀ γ : CongruenceSubgroup.Gamma N,
      (γ : Matrix.SpecialLinearGroup (Fin 2) ℤ) ∈ CongruenceSubgroup.Gamma M' →
      ψ (Additive.ofMul γ) = 0 := sorry

-- Test congruenceClasses_zero.
example (N q : ℕ) [NeZero N] [Fact q.Prime] (hN : 0 < N) :
    (0 : AddMonoidHom (Additive (CongruenceSubgroup.Gamma N)) (ZMod q)) ∈
      congruenceClasses N q := sorry
-- Test congruenceClasses_joint; the common level is lcm of witness levels.
example (N q : ℕ) [NeZero N] [Fact q.Prime]
    (ψ φ : AddMonoidHom (Additive (CongruenceSubgroup.Gamma N)) (ZMod q))
    (hψ : ψ ∈ congruenceClasses N q) (hφ : φ ∈ congruenceClasses N q) :
    ψ + φ ∈ congruenceClasses N q := sorry

-- The common-witness part of congruenceClasses_joint, beyond membership closure.
example (N M M' q : ℕ) [NeZero N] [Fact q.Prime]
    (ψ φ : Additive (CongruenceSubgroup.Gamma N) →+ ZMod q)
    (hψ : ∀ γ : CongruenceSubgroup.Gamma N,
      (γ : Matrix.SpecialLinearGroup (Fin 2) ℤ) ∈ CongruenceSubgroup.Gamma M →
      ψ (Additive.ofMul γ) = 0)
    (hφ : ∀ γ : CongruenceSubgroup.Gamma N,
      (γ : Matrix.SpecialLinearGroup (Fin 2) ℤ) ∈ CongruenceSubgroup.Gamma M' →
      φ (Additive.ofMul γ) = 0) :
    ∀ γ : CongruenceSubgroup.Gamma N,
      (γ : Matrix.SpecialLinearGroup (Fin 2) ℤ) ∈ CongruenceSubgroup.Gamma (Nat.lcm M M') →
      (ψ + φ) (Additive.ofMul γ) = 0 := sorry

private def restrictPrincipalCharacter (N D q : ℕ) (hND : N ∣ D)
    (ψ : Additive (CongruenceSubgroup.Gamma N) →+ ZMod q) :
    Additive (CongruenceSubgroup.Gamma D) →+ ZMod q where
  toFun γ := ψ (Additive.ofMul ⟨γ.toMul.val,
    CongruenceSubgroup.Gamma_le_Gamma_of_dvd hND γ.toMul.property⟩)
  map_zero' := sorry
  map_add' := sorry

lemma congruenceClasses_restrict (N D q : ℕ) [NeZero N] [NeZero D] [Fact q.Prime]
    (hND : N ∣ D) (ψ : Additive (CongruenceSubgroup.Gamma N) →+ ZMod q)
    (hψ : ψ ∈ congruenceClasses N q) :
    restrictPrincipalCharacter N D q hND ψ ∈ congruenceClasses D q := sorry

-- The subgroup quotient is the actual finite congruence quotient when N∣M.
lemma congruenceClasses_quotient (N M q : ℕ) [NeZero N] [Fact q.Prime]
    (ψ : Additive (CongruenceSubgroup.Gamma N) →+ ZMod q)
    (hψ : ∀ γ : CongruenceSubgroup.Gamma N,
      (γ : Matrix.SpecialLinearGroup (Fin 2) ℤ) ∈ CongruenceSubgroup.Gamma M →
      ψ (Additive.ofMul γ) = 0)
    [((CongruenceSubgroup.Gamma M).comap (CongruenceSubgroup.Gamma N).subtype).Normal] :
    ∃! φ : Additive (CongruenceSubgroup.Gamma N ⧸
        (CongruenceSubgroup.Gamma M).comap (CongruenceSubgroup.Gamma N).subtype) →+ ZMod q,
      ∀ γ : CongruenceSubgroup.Gamma N,
        φ (Additive.ofMul (QuotientGroup.mk' _ γ)) = ψ (Additive.ofMul γ) := sorry

-- H¹/characters is already present in the baseline.
def congruenceClasses_H1 (N q : ℕ) [Fact q.Prime] :
    groupCohomology.H1 (Rep.trivial (ZMod q) (CongruenceSubgroup.Gamma N) (ZMod q)) ≅
      ModuleCat.of (ZMod q) (Additive (CongruenceSubgroup.Gamma N) →+ ZMod q) :=
  groupCohomology.H1IsoOfIsTrivial _

-- Test congruenceClasses_finiteQuotient: a character killing a deeper kernel is a member.
example (N M q : ℕ) [NeZero N] [Fact q.Prime] (hM : 0 < M) (hNM : N ∣ M)
    (ψ : Additive (CongruenceSubgroup.Gamma N) →+ ZMod q)
    (hψ : ∀ γ : CongruenceSubgroup.Gamma N,
      (γ : Matrix.SpecialLinearGroup (Fin 2) ℤ) ∈ CongruenceSubgroup.Gamma M →
      ψ (Additive.ofMul γ) = 0) : ψ ∈ congruenceClasses N q := sorry

-- Test congruenceClasses_noncongruence. Ordinary Γ(3) has free rank-three abelianization.
example [Fact (Nat.Prime 5)] : congruenceClasses 3 5 = ⊥ := sorry
example [Fact (Nat.Prime 5)] :
    Module.finrank (ZMod 5)
      (groupCohomology.H1 (Rep.trivial (ZMod 5) (CongruenceSubgroup.Gamma 3) (ZMod 5))) = 3 := sorry

-- R14.5/newform-hecke-prime: χ is the supplied eigenvalue character.
def heckePrime {T K : Type*} [CommRing T] [Field K] (χ : T →+* K) : Ideal T :=
  RingHom.ker χ
lemma mem_heckePrime {T K : Type*} [CommRing T] [Field K] (χ : T →+* K) (t : T) :
    t ∈ heckePrime χ ↔ χ t = 0 := sorry
lemma heckePrime_isPrime {T K : Type*} [CommRing T] [Field K] (χ : T →+* K) :
    (heckePrime χ).IsPrime := sorry
lemma heckePrime_conjugate {T K L : Type*} [CommRing T] [Field K] [Field L]
    (χ : T →+* K) (σ : K →+* L) : heckePrime (σ.comp χ) = heckePrime χ := sorry
-- Integral part of heckePrime_quotient; rationalization still uses the supplied coefficient field.
def heckePrime_quotient {T K : Type*} [CommRing T] [Field K] (χ : T →+* K) :
    T ⧸ heckePrime χ ≃+* χ.range := RingHom.quotientKerEquivRange χ
-- Test heckePrime_int.
example : heckePrime (Int.castRingHom ℚ) = ⊥ := sorry
-- Test heckePrime_projection.
example : heckePrime (RingHom.fst ℚ ℚ) =
    { carrier := {x | x.1 = 0}
      zero_mem' := by simp
      add_mem' := by intros; simp_all
      smul_mem' := by intros; simp_all } := sorry
-- Test heckePrime_embedding.
example {T K L : Type*} [CommRing T] [Field K] [Field L]
    (χ : T →+* K) (σ : K →+* L) : heckePrime (σ.comp χ) = heckePrime χ := sorry

-- Algebraic core of R14.5/modular-quotient-dimension. Does not construct A_f.
theorem free_rank_two_quotient {A V : Type*} [CommRing A] [AddCommGroup V]
    [Module A V] [Module.Free A V] [Module.Finite A V] [Nontrivial A]
    (h : Module.finrank A V = 2) (P : Ideal A) [P.IsPrime] :
    Module.Free (A ⧸ P) (TensorProduct A (A ⧸ P) V) ∧
      Module.finrank (A ⧸ P) (TensorProduct A (A ⧸ P) V) = 2 := sorry

-- R14.6/supersingular-character-lattice: S is the geometric intersection set.
def supersingularDegreeZero (S : Type*) : Submodule ℤ (S →₀ ℤ) :=
  LinearMap.ker (Finsupp.linearCombination ℤ (fun _ : S => (1 : ℤ)))
lemma mem_supersingularDegreeZero {S : Type*} (z : S →₀ ℤ) :
    z ∈ supersingularDegreeZero S ↔ z.sum (fun _ n => n) = 0 := sorry

def supersingularDifference {S : Type*} (s t : S) : supersingularDegreeZero S :=
  ⟨Finsupp.single s 1 - Finsupp.single t 1, by sorry⟩
lemma supersingularDifference_diagonal {S : Type*} (s : S) :
    supersingularDifference s s = 0 := sorry
lemma supersingularDegreeZero_ext {S : Type*} (x y : supersingularDegreeZero S)
    (h : ∀ a, (x : S →₀ ℤ) a = (y : S →₀ ℤ) a) : x = y := sorry
-- Test supersingularDegreeZero_singleton.
example : supersingularDegreeZero Unit = ⊥ := sorry
-- Test supersingularDegreeZero_two.
example : ∃ e : supersingularDegreeZero (Fin 2) ≃ₗ[ℤ] ℤ,
    e (supersingularDifference (0 : Fin 2) 1) = 1 := sorry
-- Test supersingularDegreeZero_difference.
example {S : Type*} (s t : S) (h : s ≠ t) :
    supersingularDifference s t ≠ 0 := sorry

-- R14.6/taylor-wiles-cover: ξ is complex conjugation on the supplied cover H¹.
section Minus
variable {O M M' : Type*} [CommRing O] [AddCommGroup M] [Module O M]
    [AddCommGroup M'] [Module O M']

def taylorWilesMinus (ξ : M →ₗ[O] M) : Submodule O M :=
  LinearMap.ker (ξ + LinearMap.id)
lemma mem_taylorWilesMinus (ξ : M →ₗ[O] M) (x : M) :
    x ∈ taylorWilesMinus ξ ↔ ξ x = -x := sorry
-- The actual projector, with an explicit inverse of 2 in O.
def taylorWilesMinus_projector (ξ : M →ₗ[O] M) (u : Oˣ) : M →ₗ[O] M :=
  (↑u⁻¹ : O) • (LinearMap.id - ξ)
lemma taylorWilesMinus_projector_range (ξ : M →ₗ[O] M)
    (hξ : ξ.comp ξ = LinearMap.id) (u : Oˣ) (hu : (u : O) = 2) :
    LinearMap.range (taylorWilesMinus_projector ξ u) = taylorWilesMinus ξ := sorry
lemma taylorWilesMinus_coefficients (ξ : M →ₗ[O] M) (ξ' : M' →ₗ[O] M')
    (f : M →ₗ[O] M') (h : f.comp ξ = ξ'.comp f) (x : M)
    (hx : x ∈ taylorWilesMinus ξ) : f x ∈ taylorWilesMinus ξ' := sorry
lemma taylorWilesMinus_ext (ξ : M →ₗ[O] M) (x y : taylorWilesMinus ξ)
    (h : (x : M) = (y : M)) : x = y := sorry
-- Test taylorWilesMinus_neg.
example : taylorWilesMinus (-LinearMap.id : M →ₗ[O] M) = ⊤ := sorry
end Minus
-- Test taylorWilesMinus_id.
example : taylorWilesMinus (LinearMap.id : ℚ →ₗ[ℚ] ℚ) = ⊥ := sorry
-- Test taylorWilesMinus_swap.
example (x y : ℚ) :
    (x,y) ∈ taylorWilesMinus (LinearEquiv.prodComm ℚ ℚ ℚ).toLinearMap ↔ y = -x := sorry
-- Test taylorWilesMinus_two: characteristic-two failure of the complementary projector.
example : taylorWilesMinus (LinearMap.id : ZMod 2 →ₗ[ZMod 2] ZMod 2) = ⊤ := sorry

-- Existing finite-flat/local-ring freeness: an import, not a new generic theorem.
-- The post-pin TauCeti.Algebra.MonoidAlgebra.LocalRing import is intentionally absent.
example {R M : Type*} [CommRing R] [IsLocalRing R] [AddCommGroup M] [Module R M]
    [Module.Finite R M] [Module.Flat R M] : Module.Free R M :=
  Module.free_of_flat_of_isLocalRing

/-! Additional tests of the R14.3–R14.6 algebraic core. -/

-- Saturation test: multiplication by two has proper image over ℤ.
example : (2 : ℤ) ∈ parabolicH1 (2 • (LinearMap.id : ℤ →ₗ[ℤ] ℤ)) ∧
    (1 : ℤ) ∉ parabolicH1 (2 • (LinearMap.id : ℤ →ₗ[ℤ] ℤ)) := by sorry

-- Reversing the zero and identity legs changes the value.
example : degeneracyH1 (0 : ℤ →ₗ[ℤ] ℤ) LinearMap.id (3, 5) = 5 := by sorry

/-- Correct sign of the norm-matrix determinant in selected-root control. -/
theorem degeneracyNormMatrix_det (a b : ℚ) :
    Matrix.det !![a, b; b, a] = a ^ 2 - b ^ 2 := by sorry

-- Projection to the first factor kills exactly the second factor.
example (x y : ℚ) : (x, y) ∈ heckePrime (RingHom.fst ℚ ℚ) ↔ x = 0 := by sorry

-- A difference of two points is a degree-zero divisor; a single point is not.
example : Finsupp.single (0 : Fin 2) (1 : ℤ) - Finsupp.single 1 1 ∈
    supersingularDegreeZero (Fin 2) := by sorry
example : Finsupp.single (0 : Fin 2) (1 : ℤ) ∉
    supersingularDegreeZero (Fin 2) := by sorry

end CohomologyCore

/-!
## Targets whose carriers are not at the pins

Each item names a target of the roadmap document, followed by the API items and unit tests it
proposes (relative to `TauCeti.ModularCurves`) that are not stated above because their carriers
do not exist at the pins. Their statements, hypotheses and tests are in the roadmap document.

* `R12.1/lattice-weierstrass-model`: `latticeUniformization`, `latticeUniformization_zero`,
  `latticeUniformization_pole`.
* `R12.1/pointed-elliptic-uniformization`: `pointedEllipticUniformization`.
* `R12.1/homothety-and-isogeny-compatibility`: `homothetyAndIsogenyCompatibility`.
* `R12.1/invariant-differentials-and-periods`: `invariantDifferentialsAndPeriods`.
* `R12.1/analytic-algebraic-weil-pairing`: `analyticAlgebraicWeilPairing`.
* `R12.2/marked-torus-family`: `markedTorusFamily`, `markedTorusFamily_level`,
  `markedTorusFamily_pullback`, `markedTorusFamily_changeMarking`,
  `markedTorusFamily_weilPairing`, `markedTorusFamily_T`, `markedTorusFamily_S`,
  `markedTorusFamily_zeroLevel`, `markedTorusFamily_borelDiamond`.
* `R12.2/open-level-uniformization`: `openLevelUniformization`.
* `R12.2/level-map-and-diamond-comparison`: `levelMapAndDiamondComparison`.
* `R12.2/stabilizers-and-small-levels`: `stabilizersAndSmallLevels`.
* `R12.2/projective-prime-level-application`: the statement of the target.
* `R12.3/tate-and-cusp-parameter-agreement`: `tateAndCuspParameterAgreement`.
* `R12.3/compact-modular-uniformization`: `compactModularUniformization`.
* `R12.3/cusp-ramification-and-level-maps`: `cuspRamificationAndLevelMaps`.
* `R12.3/cusp-fields-and-component-labels`: `cuspFieldsAndComponentLabels`.
* `R12.4/geometric-connectedness-field-extension`: `geometricConnectednessFieldExtension`.
* `R12.4/fixed-pairing-geometric-connectedness`: `fixedPairingGeometricConnectedness`.
* `R12.4/twisted-analytic-comparison`: `twistedAnalyticComparison`.
* `R12.4/twisted-geometric-irreducibility`: `twistedGeometricIrreducibility`.
* `R12.5/hodge-line-automorphy`: `hodgeLineAutomorphy`.
* `R12.5/weight-two-regular-differentials`: `weightTwoRegularDifferentials`.
* `R12.5/characteristic-zero-hecke-action`: `charZeroHeckeCorrespondence`,
  `charZeroCyclicCorrespondence`, `charZeroUCorrespondence`, `charZeroHecke_onDifferentials`,
  `charZeroHecke_onHodgePower`, `charZeroHecke_degree`, `charZeroHecke_identity`,
  `charZeroHecke_raw_prime`, `charZeroHecke_bad_prime`.
* `R12.5/hecke-normalization-comparison`: `heckeNormalizationComparison`.
* `R12.5/first-coefficient-hecke-pairing`: `firstCoefficientHeckePairing`,
  `firstCoefficientHeckePairing_bilinear`, `firstCoefficientHeckePairing_Tn`,
  `firstCoefficientHeckePairing_action`, `firstCoefficientHeckePairing_baseChange`,
  `firstCoefficientHeckePairing_identity`, `firstCoefficientHeckePairing_zeroSpace`,
  `firstCoefficientHeckePairing_level11`, `firstCoefficientHeckePairing_badU`.
* `R12.5/perfect-hecke-pairing`: `perfectHeckePairing`.
* `R12.6/canonical-generic-fibre-descent`: `canonicalGenericFibreDescent`.
* `R12.6/gamma-zero-rational-function-field`: `gammaZeroRationalFunctionField`.
* `R12.6/component-fields-and-twisted-descent`: `componentFieldsAndTwistedDescent`.
* `R12.6/complex-conjugation-comparison`: `complexConjugationComparison`.
* `R12.6/generic-base-change-and-level-compatibility`: `genericBaseChangeAndLevelCompatibility`.
* `R13.1/semistable-genus-one-curves-and-neron-polygons`: `SemistableGenusOneCurve`,
  `neronPolygon`, `neronPolygon_smoothLocus`, `neronPolygon_baseChange`,
  `neronPolygon_one_equation`, `neronPolygon_characteristicTwo`, `neronPolygon_three`,
  `semistableGenusOne_nonExample`.
* `R13.1/generalized-elliptic-curve`: `GeneralizedEllipticCurve`,
  `GeneralizedEllipticCurve.smoothGroup`, `GeneralizedEllipticCurve.action`,
  `GeneralizedEllipticCurve.baseChange`, `GeneralizedEllipticCurve.hom`,
  `GeneralizedEllipticCurve.ofEllipticCurve`, `generalizedEllipticCurve_one`,
  `generalizedEllipticCurve_emptyBoundary`, `generalizedEllipticCurve_baseChange`,
  `generalizedEllipticCurve_contraction`.
* `R13.1/neron-polygon-automorphisms`: `neronPolygonAutomorphisms`.
* `R13.1/non-smooth-locus-and-base-change`: `nonSmoothLocusAndBaseChange`.
* `R13.1/deligne-rapoport-structure-criterion`: `deligneRapoportStructureCriterion`.
* `R13.1/contraction-away-from-a-divisor`: `contractGenusOne`,
  `contractGenusOne_retainedSmooth`, `contractGenusOne_baseChange`,
  `contractGenusOne_universal`, `contractGenusOne_subgroup`, `contractGenusOne_smooth`,
  `contractGenusOne_three_to_one`, `contractGenusOne_ample`, `contractGenusOne_empty`.
* `R13.1/finite-subgroup-quotients`: `generalizedEllipticQuotient`,
  `generalizedEllipticQuotient_kernel`, `generalizedEllipticQuotient_universal`,
  `generalizedEllipticQuotient_baseChange`, `generalizedEllipticQuotient_components`,
  `generalizedEllipticQuotient_trivial`, `generalizedEllipticQuotient_multiplicative`,
  `generalizedEllipticQuotient_components`, `generalizedEllipticQuotient_nodeFlatness`.
* `R13.1/drinfeld-structures-and-cyclicity`: `GeneralizedDrinfeldStructure`,
  `GeneralizedDrinfeldStructure.ample`, `GeneralizedCyclicSubgroup.generators`,
  `GeneralizedCyclicSubgroup.standardSubgroup`, `GeneralizedCyclicSubgroup.generators_rank`,
  `GeneralizedDrinfeldStructure.smoothComparison`, `generalizedDrinfeldStructure_mu`,
  `generalizedDrinfeldStructure_p`, `generalizedCyclicSubgroup_two`,
  `generalizedCyclicSubgroup_ordinary`.
* `R13.1/formal-polygon-algebraization`: `formalPolygonAlgebraization`.
* `R13.1/torsion-congruences-and-level-extension`: `torsionCongruencesAndLevelExtension`.
* `R13.1/polygon-count-stacks-and-decontractions`: `polygonCountStack`,
  `polygonCountStack_boundary`, `polygonCountStack_contraction`, `polygonDecontractionStack`,
  `polygonDecontractionStack_universal`, `polygonDecontractionStack_baseChange`,
  `polygonCountStack_one`, `polygonCountStack_badPrime`, `polygonDecontractionStack_identity`,
  `polygonCountStack_relativeInertia`.
* `R13.2/gamma-level-structures`: `GeneralizedFullLevel`, `GeneralizedPointLevel`,
  `GeneralizedNaiveCyclicLevel`, `GeneralizedMixedLevel`, `generalizedLevel_smoothComparison`,
  `generalizedFullLevel_polygonCount`, `generalizedFullLevel_one`,
  `generalizedPointLevel_twoGon`, `generalizedCyclicLevel_ampleness`,
  `generalizedMixedLevel_square`.
* `R13.2/moduli-stacks-are-proper-flat-artin`: `moduliStacksAreProperFlatArtin`.
* `R13.2/coherent-cyclic-decontractions`: `RefinedCyclicLevel`,
  `RefinedCyclicLevel.polygonLabel`, `RefinedCyclicLevel.decontractionSubgroup`,
  `RefinedCyclicLevel.coherence`, `RefinedCyclicLevel.transport`,
  `RefinedCyclicLevel.baseChange`, `refinedCyclicLevel_squarefree`, `refinedCyclicLevel_four`,
  `refinedCyclicLevel_elliptic`, `refinedCyclicLevel_missingLabel`.
* `R13.2/refined-gamma-zero-moduli`: `refinedGammaZeroStack`,
  `refinedGammaZeroStack_normalization`, `naiveToRefinedGammaZero`,
  `refinedGammaZeroStack_chartSquare`, `refinedGammaZeroStack_forget`,
  `refinedGammaZeroStack_squarefree`, `refinedGammaZeroStack_one`,
  `refinedGammaZeroStack_prime`, `refinedGammaZeroStack_four`, `refinedGammaZeroStack_badPrime`.
* `R13.2/fixed-pairing-integral-components`: `fixedPairingIntegralComponents`.
* `R13.2/small-level-and-dm-boundaries`: `smallLevelAndDmBoundaries`.
* `R13.2/agreement-with-katz-mazur-schemes`: `agreementWithKatzMazurSchemes`.
* `R13.2/contraction-maps-between-levels`: `contractionMapsBetweenLevels`.
* `R13.3/generalized-tate-n-gon`: `generalizedTate`, `generalizedTate_special`,
  `generalizedTate_degeneracy`, `generalizedTate_formalGroup`, `generalizedTate_unique`,
  `generalizedTate_one`, `generalizedTate_two_nodes`, `generalizedTate_pole`.
* `R13.3/tate-power-isogeny`: `tatePower`, `tatePower_kernel`, `tatePower_differential`,
  `tatePower_comp`, `tatePower_smooth_flat`, `tatePower_node_fibre_length`, `tatePower_one`,
  `tatePower_char_two`, `tatePower_target_thickness`, `tatePower_node_fibre_two`.
* `R13.3/formal-level-cusp-charts`: `formalLevelChart`, `formalLevelChart_generic`,
  `formalLevelChart_inertia`, `formalLevelChart_completion`, `formalLevelChart_primeComparison`,
  `formalLevelChart_width_one`, `formalLevelChart_prime_import`,
  `formalLevelChart_wild_invariants`.
* `R13.3/gamma-one-integral-boundary`: `gammaOneBoundary_overcount`.
* `R13.3/gamma-one-twisted-tate-chart`: `twistedTateChart`, `twistedTateChart_degeneracy`,
  `twistedTateChart_cyclotomic`, `twistedTateChart_formalModuli`,
  `twistedTateChart_realDescent`, `twistedTateChart_pole`, `twistedTateChart_integral`,
  `twistedTateChart_nowhereScheme`.
* `R13.3/boundary-carriers-and-hodge-evaluation`: the statement of the target.
* `R13.3/gamma-zero-prime-power-cusp-rings`: the statement of the target.
* `R13.4a/level-h-structures`: `LevelStructure`, `LevelStructure.ofFrame`,
  `LevelStructure.ofFrame_eq_iff`, `LevelStructure.baseChange`, `LevelStructure.changeLevel`,
  `LevelStructure.aut_fix_iff`, `levelOpenStack_forget_finiteEtale`, `LevelStructure.conj`,
  `LevelStructure.toKatzMazur`, `LevelStructure.full_group`, `LevelStructure.gamma1_point`,
  `LevelStructure.not_frame`, `LevelStructure.minusOne_gamma1`.
* `R13.4a/finite-normal-recognition`: the statement of the target.
* `R13.4a/deligne-rapoport-level-stack`: `levelStack`, `levelStack.toX1`,
  `levelStack.ellipticOpen`, `levelStack.boundary`, `levelStack.indepLevel`, `levelStack.conj`,
  `levelStack.lift`, `levelStack.lift_unique`, `levelStack_full_group`,
  `levelStack_gamma0_prime_rank`, `levelStack_not_naive`, `levelStack_gamma_compat`.
* `R13.4a/standard-level-stack-identifications`: the statement of the target.
* `R13.4a/integral-coarse-curves`: `integralCoarseCurve`, `integralCoarseCurve_universal`,
  `integralCoarseCurve_normal`, `integralCoarseCurve_j`, `integralCoarseCurve_levelMap`,
  `integralCoarseCurve_levelOne`, `integralCoarseCurve_fullFive`,
  `integralCoarseCurve_noUniversalFamily`.
* `R13.4a/fibrewise-coarse-base-change`: the statement of the target.
* `R13.4a/compactified-coarse-j-line`: the statement of the target.
* `R13.4a/level-stack-geometry`: the statement of the target.
* `R13.4a/coarse-degree-and-cusp-divisor`: the statement of the target.
* `R13.4a/coarse-cusp-regularity`: the statement of the target.
* `R13.4a/coarse-local-structure`: the statement of the target.
* `R13.4a/coarse-cusps-away-from-the-level`: the statement of the target.
* `R13.4a/coarse-cyclotomic-structure`: `cyclotomicBase`, `toCyclotomicBase`,
  `toCyclotomicBase_ellipticOpen`, `toCyclotomicBase_unique`, `toCyclotomicBase_levelMap`,
  `toCyclotomicBase_normaliser`, `toCyclotomicBase_flat`, `toCyclotomicBase_not_connected`,
  `cyclotomicBase_kernelDet`.
* `R13.4a/coarse-level-maps`: `levelMap`, `levelMap_id`, `levelMap_comp`, `levelMap_degree`,
  `levelMap_j`, `conjIso`, `normaliserAction`, `normaliserAction_cyclotomic`,
  `levelMap_flat_of_regular`, `levelMap_gamma1_gamma0_degree`, `levelMap_self`,
  `normaliserAction_minusOne`, `normaliserAction_gamma1_diamond`.
* `R13.4a/coarse-level-quotients`: the statement of the target.
* `R13.4a/affine-open-identification`: the statement of the target.
* `R13.4a/prime-diamond-agreement`: the statement of the target.
* `R13.4a/coarse-normalization-comparisons`: the statement of the target.
* `R13.4a/legal-coarse-base-change`: the statement of the target.
* `R13.4a/modular-polynomial`: `modularPolynomial`, `modularPolynomial_cyclic`,
  `modularPolynomial_degree`, `modularPolynomial_dual`, `modularPolynomial_normalization`,
  `modularPolynomial_one`, `modularPolynomial_four_degree`, `modularPolynomial_nonNormalImage`.
* `R13.4a/projective-scalar-coarse-quotient`: `projectiveLevelCurve`,
  `projectiveLevelCurve_pairingClass`, `projectiveLevelCurve_pglAction`,
  `projectiveLevelCurve_rigidification`, `projectiveLevelCurve_cusp`,
  `projectiveLevelCurve_five`, `projectiveLevelCurve_minusOne`, `projectiveLevelCurve_orbifold`.
* `R13.4a/split-cartan-quotient`: the statement of the target.
* `R13.4a/fixed-pairing-coarse-curve`: `fixedPairingCurve`, `fixedPairingCurve.toBase`,
  `fixedPairingCurve.ellipticOpen`, `fixedPairingCurve.baseChange`, `fullLevel_split`,
  `fixedPairingCurve.galois`, `fixedPairingCurve_one`, `fixedPairingCurve_five_cusps`,
  `fixedPairingCurve_not_full`, `fixedPairingCurve_fine`.
* `R13.4a/twisted-coarse-curve`: `twistedCurve`, `twistedCurve.ellipticOpen`,
  `twistedCurve.frameIso`, `twistedCurve.frameIso_change`, `twistedCurve.baseChange`,
  `twistedCurve_split`, `twistedCurve_point`, `twistedCurve_unpaired`.
* `R13.4a/coarse-base-change-failure`: the statement of the target.
* `R13.4a/cartan-level-curves`: `cartanCurve`, `cartanCurve_degree`, `cartanCurve_moduli`,
  `splitCartanCurve_iso_gammaZero`, `cartanCurve_quotient`,
  `cartanCurve_splitPlus_thirteen_degree`, `cartanCurve_split_two`,
  `cartanCurve_ordered_not_plus`, `cartanCurve_nonsplitPlus_cusps`.
* `R13.4a/coarse-rational-points`: the statement of the target.
* `R13.4a/atkin-lehner-quotient-curves`: `gammaZeroPlus`, `gammaZeroPlus.quotientMap`,
  `gammaZeroPlus.lift`, `gammaZeroPlus.baseChange`, `gammaZeroPlus.symmetricJ`,
  `gammaZeroPlus_square`, `gammaZeroPlus_cusps`, `gammaZeroPlus_noJ`, `gammaZeroPlus_one`.
* `R13.4a/proper-rigidifying-covers`: the statement of the target.
* `R13.4b/generic-component-comparison`: the statement of the target.
* `R13.4b/compactified-map-comparison`: the statement of the target.
* `R13.4b/hecke-normalization-comparison`: the statement of the target.
* `R13.5/igusa-components`: `igusaCover`, `igusaCover_degree`, `igusaCurve`,
  `igusaCurve_effectiveQuotient`, `igusaCurve_localModel`, `igusaCover_firstLevel`,
  `igusaCover_heightZero`, `igusaCover_supersingular`.
* `R13.5/gamma-zero-prime-power-local-model`: the statement of the target.
* `R13.5/corrected-coarse-singular-locus`: the statement of the target.
* `R13.5/tame-regular-resolution`: `modularRegularResolution`,
  `modularRegularResolution_exceptional`, `modularRegularResolution_fibre`,
  `modularRegularResolution_minimal`, `modularRegularResolution_baseChange`,
  `modularRegularResolution_noExtra`, `modularRegularResolution_orderTwo`,
  `modularRegularResolution_notSemistable`.
* `R13.5/one-factor-mixed-level-model`: the statement of the target.
* `R13.5/prime-square-semistable-model`: `primeSquareModel`, `primeSquareModel_vertical`,
  `primeSquareModel_horizontal`, `primeSquareModel_quotient`, `primeSquareModel_stabilize`,
  `primeSquareModel_extensionThirteen`, `primeSquareModel_extraAutomorphisms`,
  `primeSquareModel_generic`, `primeSquareModel_vertical_count`.
* `R13.5/split-cartan-semistable-model`: the statement of the target.
* `R13.5/split-cartan-thirteen-good-reduction`: the statement of the target.
* `R13.6/modular-dual-graphs`: `modularGraph`, `modularGraph_components`, `modularGraph_nodes`,
  `modularGraph_cusps`, `modularGraph_modelComparison`, `modularGraph_twoParallel`,
  `modularGraph_thirteen`, `modularGraph_nonReduced`, `modularGraph_subdivision`.
* `R13.6/modular-character-group-interface`: the statement of the target.
* `R13.6/modular-nearby-cycle-interface`: the statement of the target.
* `R13.6/degeneracy-on-components`: the statement of the target.
* `R14.1/degeneracy-maps-and-hecke-correspondence`: `heckeLevelStack`, `degeneracy1`,
  `degeneracy2`, `degeneracyHodgeMap`, `degeneracy_boundary`, `degeneracy_point_count`.
* `R14.1/diamond-operators`: `diamond`, `diamond_mul`, `diamond_inv`, `diamond_minusOne`,
  `diamond_baseChange`, `diamond_minusOne_hodge`, `diamond_gammaZero`, `diamond_product`.
* `R14.1/atkin-lehner-involution`: `atkinLehner`, `atkinLehner_sq`, `atkinLehner_changeRoot`,
  `atkinLehner_galois`, `atkinLehner_realDescent`, `atkinLehner_sq_eq_id`,
  `atkinLehner_change_root`, `atkinLehner_rationality`.
* `R14.1/exact-divisor-atkin-lehner`: `atkinLehnerExact`, `atkinLehnerExact_mul`,
  `atkinLehnerExact_one`, `atkinLehnerExact_field`, `atkinLehnerExact_model`,
  `atkinLehnerExact_nonexact`, `atkinLehnerExact_one`, `atkinLehnerExact_product`.
* `R14.1/full-and-cyclic-correspondences`: `allSubgroupCorrespondence`,
  `cyclicSubgroupCorrespondence`, `allSubgroupCorrespondence_degree`,
  `cyclicSubgroupCorrespondence_degree`, `correspondenceTateBranch`,
  `allSubgroupCorrespondence_scalarDecomposition`, `fullCyclic_tate`, `fullCyclic_diamond`.
* `R14.1/composition-relations-of-correspondences`: the statement of the target.
* `R14.1/analytic-comparison-of-correspondences`: the statement of the target.
* `R14.1/coherent-hecke-trace`: `coherentHecke`, `coherentHecke_rawTrace`,
  `coherentHecke_baseChange`, `coherentHecke_qExpansion`, `coherentHecke_liftIndependence`,
  `coherentHecke_weight_one`, `coherentHecke_weight_two`, `coherentHecke_bad`,
  `coherentHecke_division`.
* `R14.1/integral-etale-trace`: the statement of the target.
* `R14.1/projective-boundary-hecke-and-degree`: the statement of the target.
* `R14.2/jacobian-and-functoriality`: `modularJacobian`, `modularJacobian_dimension`,
  `jacobianPull`, `jacobianNorm`, `jacobianNorm_pull`, `jacobianNorm_dual`,
  `modularJacobian_baseChange`, `jacobian_genus_zero`, `jacobianNorm_ramification`,
  `jacobianNorm_composition`.
* `R14.2/hecke-operators-on-the-jacobian`: `heckeUpper`, `heckeLower`, `heckeJacobian_dual`,
  `heckeJacobian_cotangent`, `heckeJacobian_extend`, `heckeJacobian_relations`,
  `heckeJacobian_good_norm`, `heckeJacobian_bad`, `heckeJacobian_upperLower`,
  `heckeJacobian_zero`.
* `R14.2/integral-hecke-algebra`: `heckeAlgebraUpper`, `heckeAlgebraUpper_finiteFree`,
  `heckeAlgebraLower_equiv`, `heckeAlgebraUpper_faithful`, `heckeAlgebraUpper_rank`,
  `heckeAlgebra_genus_zero`, `heckeAlgebra_gammaZero_eleven`, `heckeAlgebra_image_kernel`,
  `heckeAlgebra_transpose`.
* `R14.2/weil-pairing-adjointness`: the statement of the target.
* `R14.2/tate-module-with-galois-and-hecke-actions`: `jacobianTateModule`,
  `jacobianTateModule_rank`, `jacobianTateModule_kummer`, `jacobianTateModule_hecke`,
  `jacobianTateModule_faithful`, `jacobianTateModule_unramified`, `jacobianTateModule_zero`,
  `jacobianTateModule_eleven`, `jacobianTateModule_twist`, `jacobianTateModule_fricke`.
* `R14.2/rational-coefficient-pairing`: the statement of the target.
* `R14.2/integral-hecke-realization-comparison`: the statement of the target.
* `R14.3/relative-coefficient-system`: `relativeBettiH1`, `relativeEtaleH1`,
  `weightCoefficients_fibre`, `weightCoefficients_isogeny`, `weightCoefficients_compare`,
  `weightCoefficients_unipotent`.
* `R14.3/parabolic-cohomology`: `parabolicH1_inverseLimit`, `parabolicH1_Gm`,
  `parabolicH1_compact_test`.
* `R14.3/integral-comparison`: the statement of the target.
* `R14.3/weight-two-shimura-isomorphism`: the statement of the target.
* `R14.3/cup-product-petersson`: the statement of the target.
* `R14.3/hecke-twisted-self-adjoint`: the statement of the target.
* `R14.3/weight-two-tate-comparison`: the statement of the target.
* `R14.3/betti-free-rank-two`: the statement of the target.
* `R14.3/boundary-exact-sequence`: the statement of the target.
* `R14.3/geometric-hecke-coefficients`: the statement of the target.
* `R14.3/boundary-non-eisenstein`: the statement of the target.
* `R14.3/localized-freeness`: the statement of the target.
* `R14.3/parabolic-duality`: the statement of the target.
* `R14.3/symbols-geometric-comparison`: the statement of the target.
* `R14.4/modular-amalgam`: the statement of the target.
* `R14.4/congruence-subgroup-property`: the statement of the target.
* `R14.4/lyndon-exact-sequence`: the statement of the target.
* `R14.4/principal-ihara`: the statement of the target.
* `R14.4/congruence-invariance`: the statement of the target.
* `R14.4/enhanced-ihara`: the statement of the target.
* `R14.4/compact-ihara`: the statement of the target.
* `R14.4/taylor-wiles-root-control`: the statement of the target.
* `R14.5/modular-quotient`: `modularQuotient`, `modularQuotient_map`, `modularQuotient_kills`,
  `modularQuotient_lift`, `modularQuotient_baseChange`, `modularQuotient_hecke`,
  `modularQuotientForIdeal`, `modularQuotient_lift_map`, `modularQuotient_hom_ext`,
  `modularQuotient_zeroIdeal`, `modularQuotient_unitIdeal`, `modularQuotient_level11`,
  `modularQuotient_weight`.
* `R14.5/quotient-tate-exact`: the statement of the target.
* `R14.5/modular-quotient-dimension`: the statement of the target.
* `R14.5/modular-quotient-differentials`: the statement of the target.
* `R14.5/trivial-character-J0`: the statement of the target.
* `R14.5/oldform-comparison`: the statement of the target.
* `R14.5/abel-jacobi-composite-nonzero`: the statement of the target.
* `R14.6/neron-hecke-extension`: the statement of the target.
* `R14.6/special-fibre-eichler-shimura`: the statement of the target.
* `R14.6/rational-cusp-abel-jacobi`: `abelJacobiInfty`, `abelJacobiInfty_cusp`,
  `abelJacobiInfty_injective`, `abelJacobi_changeBase`, `abelJacobi_degeneracy`,
  `abelJacobi_hecke`, `abelJacobi_X011`, `abelJacobi_genus0`, `abelJacobi_baseChange_test`,
  `abelJacobi_degeneracy_offset`.
* `R14.6/supersingular-character-lattice`: `supersingularDegreeZero_graph`,
  `supersingularDegreeZero_correspondence`, `supersingularDegreeZero_notComponent`.
* `R14.6/modular-monodromy`: the statement of the target.
* `R14.6/character-degeneracy-sequences`: the statement of the target.
* `R14.6/semistable-tate-interface`: the statement of the target.
* `R14.6/taylor-wiles-cover`: `taylorWilesLevel`, `taylorWilesLevel_quotient`,
  `taylorWilesLevel_conjugation`, `taylorWilesLevel_empty`.
* `R14.6/diamond-group-ring-local`: the statement of the target.
* `R14.6/taylor-wiles-freeness`: the statement of the target.
* `R14.6/augmentation-control`: the statement of the target.
-/

end TauCeti.ModularCurves

end
