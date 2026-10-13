import Mathlib.Algebra.GCDMonoid.Finset
import Mathlib.Data.ZMod.Basic
import Mathlib.LinearAlgebra.Matrix.ToLin
import Mathlib.LinearAlgebra.Matrix.Determinant.Basic
import Mathlib.LinearAlgebra.BilinearForm.Orthogonal
import Mathlib.LinearAlgebra.BilinearForm.DualLattice
import Mathlib.LinearAlgebra.FreeModule.Finite.CardQuotient
import Mathlib.Analysis.InnerProductSpace.Projection.FiniteDimensional
import Mathlib.Algebra.Module.ZLattice.Covolume

/-!
This file is not the roadmap and is not exhaustive. The companion roadmap document is
its definitive specification. These signatures suggest Lean forms so contributors and
reviewers can converge on names and statements; the placeholder proofs do not claim
implementation.

GN.0 follow-up: the accepted parent owns all general metric-lattice theorems. The four
new definitions below are light wrappers over native carriers at the pins. IntVec,
IntLat, integralPerp, columnLattice, pairMatrix and primitiveVector abbreviate native
objects or notation. rationalCast, realCast, realSpan and intrinsicCovolume only express
coordinate casts and native span/map/comap/covolume; they add no lattice theory.
The covolume helper restricts to the real span before taking canonical volume.
-/

noncomputable section
open scoped Matrix
open Matrix Module
namespace TauCeti.ArithmeticLattice

abbrev IntVec (N : ℕ) := Fin N → ℤ
abbrev IntLat (N : ℕ) := Submodule ℤ (IntVec N)

def rationalCast {N : ℕ} : IntVec N →ₗ[ℤ] (Fin N → ℚ) :=
  LinearMap.pi fun i => (Int.castAddHom ℚ).toIntLinearMap.comp (LinearMap.proj i)

def saturation {N : ℕ} (L : IntLat N) : IntLat N :=
  ((Submodule.span ℚ (rationalCast '' (L : Set (IntVec N)))).restrictScalars ℤ).comap
    rationalCast

def exactKernel {N : ℕ} (c : IntVec N) : IntLat N :=
  LinearMap.ker (dotProductBilin ℤ ℤ c)

def congruenceKernel {N : ℕ} (c : IntVec N) (Q : ℕ) : IntLat N :=
  LinearMap.ker ((Int.castAddHom (ZMod Q)).toIntLinearMap.comp (dotProductBilin ℤ ℤ c))

def maximalMinorGCD {N k : ℕ} (C : Matrix (Fin N) (Fin k) ℤ) : ℕ :=
  Finset.univ.gcd fun e : Fin k ↪ Fin N => (C.submatrix e id).det.natAbs

abbrev integralPerp {N : ℕ} (L : IntLat N) : IntLat N :=
  LinearMap.BilinForm.orthogonal (dotProductBilin ℤ ℤ : LinearMap.BilinForm ℤ (IntVec N)) L
abbrev columnLattice {N k : ℕ} (C : Matrix (Fin N) (Fin k) ℤ) : IntLat N :=
  Submodule.span ℤ (Set.range fun j => fun i => C i j)
abbrev pairMatrix {N : ℕ} (c d : IntVec N) : Matrix (Fin N) (Fin 2) ℤ :=
  fun i => ![c i, d i]
abbrev primitiveVector {N : ℕ} (c : IntVec N) : Prop :=
  Finset.univ.gcd (fun i => (c i).natAbs) = 1

def realCast {N : ℕ} : IntVec N →ₗ[ℤ] EuclideanSpace ℝ (Fin N) :=
  ((EuclideanSpace.equiv (Fin N) ℝ).symm.toLinearMap.restrictScalars ℤ).comp
    (LinearMap.pi fun i => (Int.castAddHom ℝ).toIntLinearMap.comp (LinearMap.proj i))
def realSpan {N : ℕ} (L : IntLat N) : Submodule ℝ (EuclideanSpace ℝ (Fin N)) :=
  Submodule.span ℝ (realCast '' (L : Set (IntVec N)))
def intrinsicCovolume {N : ℕ} (L : IntLat N) : ℝ :=
  let W := realSpan L
  ZLattice.covolume
    (((L.map realCast).comap (W.subtype.restrictScalars ℤ)) : Submodule ℤ W)
    (MeasureTheory.volume : MeasureTheory.Measure W)

/- Concrete arithmetic comparison milestones. -/
lemma mem_saturation {N : ℕ} (L : IntLat N) (x : IntVec N) :
    x ∈ saturation L ↔ rationalCast x ∈
      Submodule.span ℚ (rationalCast '' (L : Set (IntVec N))) := by sorry
lemma saturation_characterisation {N : ℕ} (L : IntLat N) (x : IntVec N) :
    (x ∈ saturation L ↔ ∃ m : ℤ, m ≠ 0 ∧ m • x ∈ L) ∧
    (x ∈ saturation L ↔ realCast x ∈ realSpan L) ∧
    Module.finrank ℤ (saturation L) = Module.finrank ℤ L ∧
    realSpan (saturation L) = realSpan L := by sorry
lemma orthogonal_saturation {N : ℕ} (L : IntLat N) :
    saturation (integralPerp L) = integralPerp L ∧
    integralPerp (integralPerp L) = saturation L ∧
    Module.finrank ℤ (integralPerp L) + Module.finrank ℤ L = N ∧
    realSpan (integralPerp L) = (realSpan L)ᗮ := by sorry
lemma maximalMinorGCD_unimodular {N k : ℕ} (C : Matrix (Fin N) (Fin k) ℤ)
    (U : Matrix (Fin N) (Fin N) ℤ) (hU : IsUnit U.det) :
    maximalMinorGCD (U * C) = maximalMinorGCD C := by sorry
lemma maximalMinorGCD_index {N k : ℕ} (C : Matrix (Fin N) (Fin k) ℤ)
    (hC : LinearIndependent ℚ (fun j => rationalCast (fun i => C i j))) :
    maximalMinorGCD C = (columnLattice C).toAddSubgroup.relIndex
      (saturation (columnLattice C)).toAddSubgroup ∧ 0 < maximalMinorGCD C := by sorry
lemma intersection_covolume {N k : ℕ} (C : Matrix (Fin N) (Fin k) ℤ)
    (hC : LinearIndependent ℚ (fun j => rationalCast (fun i => C i j))) :
    let H := integralPerp (columnLattice C)
    saturation H = H ∧ Module.finrank ℤ H = N - k ∧
    intrinsicCovolume H =
      intrinsicCovolume (columnLattice C) / (maximalMinorGCD C : ℝ) := by sorry
lemma exactKernel_covolume {N : ℕ} (c : IntVec N) (hc : primitiveVector c) :
    intrinsicCovolume (exactKernel c) = ‖realCast c‖ := by sorry
lemma pair_triangularisation {N : ℕ} (hN : 2 ≤ N) (c d : IntVec N)
    (hc : primitiveVector c)
    (hcd : LinearIndependent ℚ (fun j : Fin 2 => rationalCast (fun i => pairMatrix c d i j))) :
    ∃ (T : Matrix (Fin N) (Fin N) ℤ) (f : ℤ), IsUnit T.det ∧
      0 < maximalMinorGCD (pairMatrix c d) ∧
      (∀ j, (c ᵥ* T) j = if j.val = 0 then 1 else 0) ∧
      (∀ j, (d ᵥ* T) j = if j.val = 0 then f else
        if j.val = 1 then (maximalMinorGCD (pairMatrix c d) : ℤ) else 0) := by sorry
lemma two_congruence_covolume {N Q : ℕ} (hN : 2 ≤ N) (hQ : 0 < Q)
    (c d : IntVec N) (hc : primitiveVector c) (hd : primitiveVector d)
    (hcd : LinearIndependent ℚ (fun j : Fin 2 => rationalCast (fun i => pairMatrix c d i j))) :
    let H := congruenceKernel c Q ⊓ congruenceKernel d Q
    Module.finrank ℤ H = N ∧
    H.toAddSubgroup.index = Q^2 / Nat.gcd (maximalMinorGCD (pairMatrix c d)) Q ∧
    intrinsicCovolume H =
      (Q : ℝ)^2 / (Nat.gcd (maximalMinorGCD (pairMatrix c d)) Q : ℝ) := by sorry
lemma mixed_covolume {N Q : ℕ} (hN : 2 ≤ N) (hQ : 0 < Q)
    (c d : IntVec N) (hc : primitiveVector c) (hd : primitiveVector d)
    (hcd : LinearIndependent ℚ (fun j : Fin 2 => rationalCast (fun i => pairMatrix c d i j))) :
    let H := exactKernel c ⊓ congruenceKernel d Q
    Module.finrank ℤ H = N - 1 ∧
    H.toAddSubgroup.relIndex (exactKernel c).toAddSubgroup =
      Q / Nat.gcd (maximalMinorGCD (pairMatrix c d)) Q ∧
    intrinsicCovolume H = ‖realCast c‖ * (Q : ℝ) /
        (Nat.gcd (maximalMinorGCD (pairMatrix c d)) Q : ℝ) := by sorry
lemma schmidt_dual {N : ℕ} (L : IntLat N) (hL : saturation L = L) :
    let W := (realSpan L)ᗮ
    let D : Submodule ℤ W := ((integralPerp L).map realCast).comap
      (W.subtype.restrictScalars ℤ)
    let P : Submodule ℤ W := (⊤ : IntLat N).map
      ((W.orthogonalProjectionOnto.toLinearMap.restrictScalars ℤ).comp realCast)
    LinearMap.BilinForm.dualSubmodule (innerₗ W) D = P ∧
    DiscreteTopology D ∧ Submodule.span ℝ (D : Set W) = ⊤ ∧
    DiscreteTopology P ∧ Submodule.span ℝ (P : Set W) = ⊤ ∧
    Module.finrank ℤ D = N - Module.finrank ℤ L ∧
    Module.finrank ℤ P = N - Module.finrank ℤ L := by sorry

/- API for coordinate saturation. -/
lemma le_saturation {N : ℕ} (L : IntLat N) : L ≤ saturation L := by sorry
lemma saturation_mono {N : ℕ} {L M : IntLat N} (h : L ≤ M) :
    saturation L ≤ saturation M := by sorry
lemma saturation_idem {N : ℕ} (L : IntLat N) :
    saturation (saturation L) = saturation L := by sorry

-- Unit test: TauCeti.ArithmeticLattice.saturation_even_line
example : saturation (Submodule.span ℤ ({![2, 2]} : Set (IntVec 2))) =
    Submodule.span ℤ ({![1, 1]} : Set (IntVec 2)) := by sorry
-- Unit test: TauCeti.ArithmeticLattice.saturation_zero
example (N : ℕ) : saturation (⊥ : IntLat N) = ⊥ := by sorry
-- Unit test: TauCeti.ArithmeticLattice.saturation_full_index
example :
    let L : IntLat 2 := Submodule.span ℤ {![2, 0], ![0, 2]}
    saturation L = ⊤ ∧ L ≠ ⊤ := by sorry

/- API for exact coefficient kernels. -/
lemma mem_exactKernel {N : ℕ} (c x : IntVec N) :
    x ∈ exactKernel c ↔ c ⬝ᵥ x = 0 := by sorry
lemma exactKernel_zero {N : ℕ} : exactKernel (0 : IntVec N) = ⊤ := by sorry
lemma exactKernel_smul {N : ℕ} (c : IntVec N) (m : ℤ) (hm : m ≠ 0) :
    exactKernel (m • c) = exactKernel c := by sorry
lemma exactKernel_eq_orthogonal {N : ℕ} (c : IntVec N) :
    exactKernel c = integralPerp (Submodule.span ℤ ({c} : Set (IntVec N))) := by sorry

-- Unit test: TauCeti.ArithmeticLattice.exactKernel_diagonal
example : exactKernel (![1, 1] : IntVec 2) =
    Submodule.span ℤ ({![1, -1]} : Set (IntVec 2)) := by sorry
-- Unit test: TauCeti.ArithmeticLattice.exactKernel_nonprimitive
example : exactKernel (![2, 2] : IntVec 2) = exactKernel (![1, 1] : IntVec 2) := by sorry
-- Unit test: TauCeti.ArithmeticLattice.exactKernel_zero_test
example (N : ℕ) : exactKernel (0 : IntVec N) = ⊤ := by sorry

/- API for modular coefficient kernels. Q=0 deliberately uses native ZMod 0. -/
lemma mem_congruenceKernel {N : ℕ} (c x : IntVec N) (Q : ℕ) :
    x ∈ congruenceKernel c Q ↔ (Q : ℤ) ∣ c ⬝ᵥ x := by sorry
lemma congruenceKernel_one {N : ℕ} (c : IntVec N) :
    congruenceKernel c 1 = ⊤ := by sorry
lemma congruenceKernel_modulus_zero {N : ℕ} (c : IntVec N) :
    congruenceKernel c 0 = exactKernel c := by sorry
lemma exactKernel_le_congruenceKernel {N : ℕ} (c : IntVec N) (Q : ℕ) :
    exactKernel c ≤ congruenceKernel c Q := by sorry
lemma congruenceKernel_index {N Q : ℕ} (c : IntVec N) (hQ : 0 < Q) :
    (congruenceKernel c Q).toAddSubgroup.index =
      Q / Nat.gcd (Finset.univ.gcd fun i => (c i).natAbs) Q := by sorry

-- Unit test: TauCeti.ArithmeticLattice.congruenceKernel_even_coordinate
example : congruenceKernel (![1, 0] : IntVec 2) 6 =
    Submodule.span ℤ ({![6, 0], ![0, 1]} : Set (IntVec 2)) := by sorry
-- Unit test: TauCeti.ArithmeticLattice.congruenceKernel_zero_vector
example (N Q : ℕ) : congruenceKernel (0 : IntVec N) Q = ⊤ := by sorry
-- Unit test: TauCeti.ArithmeticLattice.congruenceKernel_not_primitive
example :
    let L := congruenceKernel (![1, 0] : IntVec 2) 2
    saturation L = ⊤ ∧ L ≠ ⊤ := by sorry

/- API for the total maximal-minor content. -/
lemma maximalMinorGCD_dvd_minor {N k : ℕ} (C : Matrix (Fin N) (Fin k) ℤ)
    (e : Fin k ↪ Fin N) : maximalMinorGCD C ∣ (C.submatrix e id).det.natAbs := by sorry
lemma dvd_maximalMinorGCD_iff {N k : ℕ} (C : Matrix (Fin N) (Fin k) ℤ) (a : ℕ) :
    a ∣ maximalMinorGCD C ↔ ∀ e : Fin k ↪ Fin N, a ∣ (C.submatrix e id).det.natAbs := by sorry
lemma maximalMinorGCD_empty {N : ℕ} (C : Matrix (Fin N) (Fin 0) ℤ) :
    maximalMinorGCD C = 1 := by sorry
-- The arithmetic-minor-gcd-rank target also supplies this definition's API item.
lemma maximalMinorGCD_zero_iff {N k : ℕ} (C : Matrix (Fin N) (Fin k) ℤ) :
    maximalMinorGCD C = 0 ↔
      ¬ LinearIndependent ℚ (fun j => rationalCast (fun i => C i j)) := by sorry
lemma maximalMinorGCD_mul_right {N k : ℕ} (C : Matrix (Fin N) (Fin k) ℤ)
    (V : Matrix (Fin k) (Fin k) ℤ) :
    maximalMinorGCD (C * V) = maximalMinorGCD C * V.det.natAbs := by sorry

-- Unit test: TauCeti.ArithmeticLattice.maximalMinorGCD_rectangular
example : maximalMinorGCD (!![2, 0; 0, 3; 0, 0] : Matrix (Fin 3) (Fin 2) ℤ) = 6 := by sorry
-- Unit test: TauCeti.ArithmeticLattice.maximalMinorGCD_empty_test
example : maximalMinorGCD (0 : Matrix (Fin 0) (Fin 0) ℤ) = 1 := by sorry
-- Unit test: TauCeti.ArithmeticLattice.maximalMinorGCD_dependent
example : maximalMinorGCD (!![1, 2; 2, 4] : Matrix (Fin 2) (Fin 2) ℤ) = 0 := by sorry

end TauCeti.ArithmeticLattice
