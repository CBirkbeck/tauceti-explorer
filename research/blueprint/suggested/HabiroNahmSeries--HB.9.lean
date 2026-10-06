import Mathlib.RingTheory.MvPowerSeries.Expand
import Mathlib.RingTheory.PowerSeries.Basic
import Mathlib.Data.ZMod.Basic

/-!
This file is not the roadmap and is not exhaustive. The definitive document is
research/blueprint/readmes/HabiroNahmSeries--HB.9.md. These statements suggest Lean
forms so contributors and reviewers can converge on names and signatures.

All declarations are planning prototypes, not implementations. Proofs use sorry.
The file uses only the pinned Mathlib; it does not replace unavailable imported
Gaussian, Coleman, completed coefficient or indexed Habiro objects by Prop fields.
The named omissions at the end specify those missing inputs honestly.
-/

noncomputable section

namespace TauCeti.HabiroNahmHB9

open scoped BigOperators

section Transfer
variable {S T : Type*} [CommRing S] [CommRing T] [IsDomain T]

/-- Divisibility at the first power is an explicit hypothesis, not a consequence
of étaleness. This is applied separately to a jointly faithful set of factors. -/
theorem saturation_transfer (ι : S →+* T) (p : S) (hp : ι p ≠ 0)
    (hsat : ∀ a : S, (∃ b : T, ι a = ι p * b) → ∃ c : S, a = p * c)
    (n : ℕ) (a : S) (b : T) (hab : ι a = (ι p) ^ n * b) :
    ∃ c : S, a = p ^ n * c := by
  sorry

-- followup-branch-loss: the full algebra has two square-root factors.
example (z T : ZMod 5) (h : T ^ 2 = z ^ 4) :
    T = z ^ 2 ∨ T = -(z ^ 2) := by
  sorry

example (z : ZMod 5) (hz : z ≠ 0) :
    z ^ 2 - (-(z ^ 2)) ≠ 0 := by
  sorry

example (z : ZMod 5) : (z ^ 2) - z ^ 2 = 0 := by
  sorry
end Transfer

section FirstJet
variable {I L E : Type*} [Fintype I] [Field L] [CharZero L]
    [Field E] [CharZero E]

/-- The finite contraction polynomial for diagonal cubic/quartic vertices.
The covariance is Λ⁻¹, rather than its negative. -/
def gaussianFirstJet (C : I → I → L) (b Q T U : I → L) (c : L) : L :=
  c + (1 / 2 : L) * (∑ i, Q i * C i i)
    + (1 / 2 : L) * (∑ i, ∑ j, b i * b j * C i j)
    + (1 / 2 : L) * (∑ i, ∑ j, T i * b j * C i i * C i j)
    + (1 / 8 : L) * (∑ i, U i * (C i i) ^ 2)
    + (1 / 8 : L) * (∑ i, ∑ j, T i * T j * C i i * C j j * C i j)
    + (1 / 12 : L) * (∑ i, ∑ j, T i * T j * (C i j) ^ 3)

theorem gaussianFirstJet_map (f : L →+* E) (C : I → I → L)
    (b Q T U : I → L) (c : L) :
    f (gaussianFirstJet C b Q T U c) =
      gaussianFirstJet (fun i j => f (C i j)) (fun i => f (b i))
        (fun i => f (Q i)) (fun i => f (T i)) (fun i => f (U i)) (f c) := by
  sorry

theorem gaussianFirstJet_zero_covariance (b Q T U : I → L) (c : L) :
    gaussianFirstJet (fun _ _ => 0) b Q T U c = c := by
  sorry

theorem gaussianFirstJet_integral (O : Subring L)
    (h2 : (2 : L)⁻¹ ∈ O) (h3 : (3 : L)⁻¹ ∈ O)
    (C : I → I → L) (b Q T U : I → L) (c : L)
    (hC : ∀ i j, C i j ∈ O) (hb : ∀ i, b i ∈ O) (hQ : ∀ i, Q i ∈ O)
    (hT : ∀ i, T i ∈ O) (hU : ∀ i, U i ∈ O) (hc : c ∈ O) :
    gaussianFirstJet C b Q T U c ∈ O := by
  sorry

-- gaussianFirstJet_linear
example : gaussianFirstJet (I := Fin 1) (L := ℚ) (fun _ _ => 1)
    (fun _ => 1) (fun _ => 0) (fun _ => 0) (fun _ => 0) 0 = 1 / 2 := by
  sorry

-- gaussianFirstJet_cubic
example : gaussianFirstJet (I := Fin 1) (L := ℚ) (fun _ _ => 1)
    (fun _ => 0) (fun _ => 0) (fun _ => 1) (fun _ => 0) 0 = 5 / 24 := by
  sorry

-- gaussianFirstJet_quartic
example : gaussianFirstJet (I := Fin 1) (L := ℚ) (fun _ _ => 1)
    (fun _ => 0) (fun _ => 0) (fun _ => 0) (fun _ => 1) 0 = 1 / 8 := by
  sorry

-- gaussianFirstJet_empty
example (C : Fin 0 → Fin 0 → L) (b Q T U : Fin 0 → L) (c : L) :
    gaussianFirstJet C b Q T U c = c := by
  sorry

-- gaussianFirstJet_mixed: the cubic-linear term contributes 1/2.
example : gaussianFirstJet (I := Fin 1) (L := ℚ) (fun _ _ => 1)
    (fun _ => 1) (fun _ => 0) (fun _ => 1) (fun _ => 0) 0 = 29 / 24 := by
  sorry
end FirstJet

section Auxiliary
variable {I L E : Type*} [Fintype I] [DecidableEq I]
    [Field L] [Field E]

/-- Rescale before expanding. For γ=2 the coefficient scale is q^(2μ),
not q^(4μ). F⁺ and F⁻ are the imported F_A at q^γ and q⁻¹. -/
def auxiliaryProduct (q : Lˣ) (γ : ℕ) (hγ : γ ≠ 0)
    (Fp Fm : MvPowerSeries I L) (μ : Fin γ → I → ℤ) (ν : I → ℤ) :
    MvPowerSeries I L :=
  (∏ i : Fin γ, MvPowerSeries.expand γ hγ
    (MvPowerSeries.rescale (fun j => (q : L) ^ ((γ : ℤ) * μ i j)) Fp)) *
    MvPowerSeries.rescale (fun j => (q : L) ^ (-ν j)) Fm

theorem auxiliaryProduct_constantCoeff (q : Lˣ) (γ : ℕ) (hγ : γ ≠ 0)
    (Fp Fm : MvPowerSeries I L) (μ : Fin γ → I → ℤ) (ν : I → ℤ) :
    MvPowerSeries.constantCoeff (auxiliaryProduct q γ hγ Fp Fm μ ν) =
      (MvPowerSeries.constantCoeff Fp) ^ γ * MvPowerSeries.constantCoeff Fm := by
  sorry

theorem auxiliaryProduct_one (q : Lˣ) (Fp Fm : MvPowerSeries I L)
    (μ : Fin 1 → I → ℤ) (ν : I → ℤ) :
    auxiliaryProduct q 1 (by decide) Fp Fm μ ν =
      MvPowerSeries.rescale (fun j => (q : L) ^ (μ 0 j)) Fp *
        MvPowerSeries.rescale (fun j => (q : L) ^ (-ν j)) Fm := by
  sorry

theorem auxiliaryProduct_covariance (q : Lˣ) (γ : ℕ) (hγ : γ ≠ 0)
    (Fp Fm : MvPowerSeries I L) (μ : Fin γ → I → ℤ) (ν : I → ℤ) (j : I) :
    MvPowerSeries.rescale (fun l => if l = j then (q : L) else 1)
      (auxiliaryProduct q γ hγ Fp Fm μ ν) =
      auxiliaryProduct q γ hγ Fp Fm
        (μ + fun _ => Pi.single j 1) (ν - Pi.single j 1) := by
  sorry

theorem auxiliaryProduct_map (f : L →+* E) (q : Lˣ) (γ : ℕ) (hγ : γ ≠ 0)
    (Fp Fm : MvPowerSeries I L) (μ : Fin γ → I → ℤ) (ν : I → ℤ) :
    MvPowerSeries.map f (auxiliaryProduct q γ hγ Fp Fm μ ν) =
      auxiliaryProduct (Units.map f.toMonoidHom q) γ hγ
        (MvPowerSeries.map f Fp) (MvPowerSeries.map f Fm) μ ν := by
  sorry

-- auxiliaryProduct_units
example (q : Lˣ) (γ : ℕ) (hγ : γ ≠ 0) (μ : Fin γ → I → ℤ) (ν : I → ℤ) :
    auxiliaryProduct q γ hγ (1 : MvPowerSeries I L) 1 μ ν = 1 := by
  sorry

-- auxiliaryProduct_gamma_two
example : auxiliaryProduct (I := Fin 1) (Units.mk0 (2 : ℚ) (by decide))
    2 (by decide) (MvPowerSeries.X 0) 1 (fun _ _ => 1) (fun _ => 0) =
    MvPowerSeries.C 16 * (MvPowerSeries.X 0) ^ 4 := by
  sorry

-- auxiliaryProduct_inverse_shift
example : auxiliaryProduct (I := Fin 1) (Units.mk0 (2 : ℚ) (by decide))
    1 (by decide) 1 (MvPowerSeries.X 0) (fun _ _ => 0) (fun _ => 1) =
    MvPowerSeries.C (1 / 2 : ℚ) * MvPowerSeries.X 0 := by
  sorry

-- auxiliaryProduct_two_coordinates
example : auxiliaryProduct (I := Fin 2) (Units.mk0 (2 : ℚ) (by decide))
    1 (by decide) (MvPowerSeries.X 0 + MvPowerSeries.X 1) 1
    (fun _ j => if j = 0 then 1 else -1) (fun _ => 0) =
    MvPowerSeries.C 2 * MvPowerSeries.X 0 +
      MvPowerSeries.C (1 / 2 : ℚ) * MvPowerSeries.X 1 := by
  sorry

-- auxiliaryProduct_covariance_test
example : MvPowerSeries.rescale (fun _ : Fin 1 => (2 : ℚ))
    (auxiliaryProduct (Units.mk0 (2 : ℚ) (by decide)) 2 (by decide)
      (MvPowerSeries.X 0) 1 (fun _ _ => 0) (fun _ => 0)) =
    auxiliaryProduct (Units.mk0 (2 : ℚ) (by decide)) 2 (by decide)
      (MvPowerSeries.X 0) 1 (fun _ _ => 1) (fun _ => 0) := by
  sorry

/-- The positive and negative recurrences are explicit assumptions on the imported
series. No unavailable `NahmSeries` object is represented by theorem fields. -/
theorem auxiliary_product_system (q : Lˣ) (γ : ℕ) (hγ : γ ≠ 0)
    (A : I → I → ℤ) (Fp Fm : MvPowerSeries I L)
    (hp : ∀ j, Fp - MvPowerSeries.rescale
      (fun l => if l = j then (q : L) ^ γ else 1) Fp =
      MvPowerSeries.C ((-1 : L) ^ (A j j) * (q : L) ^ ((γ : ℤ) * A j j)) *
        MvPowerSeries.X j * MvPowerSeries.rescale
          (fun l => (q : L) ^ ((γ : ℤ) * A l j)) Fp)
    (hm : ∀ j, Fm - MvPowerSeries.rescale
      (fun l => if l = j then (q : L)⁻¹ else 1) Fm =
      MvPowerSeries.C ((-1 : L) ^ (A j j) * (q : L) ^ (-A j j)) *
        MvPowerSeries.X j * MvPowerSeries.rescale
          (fun l => (q : L) ^ (-A l j)) Fm)
    (μ : Fin γ → I → ℤ) (ν : I → ℤ) :
    (∀ i j, auxiliaryProduct q γ hγ Fp Fm μ ν -
      auxiliaryProduct q γ hγ Fp Fm (μ + Pi.single i (Pi.single j 1)) ν =
      MvPowerSeries.C ((-1 : L) ^ (A j j) *
        (q : L) ^ ((γ : ℤ) * (A j j + μ i j))) *
        (MvPowerSeries.X j) ^ γ *
          auxiliaryProduct q γ hγ Fp Fm (μ + Pi.single i (fun l => A l j)) ν) ∧
    (∀ j, auxiliaryProduct q γ hγ Fp Fm μ ν -
      auxiliaryProduct q γ hγ Fp Fm μ (ν + Pi.single j 1) =
      MvPowerSeries.C ((-1 : L) ^ (A j j) * (q : L) ^ (-(A j j + ν j))) *
        MvPowerSeries.X j *
          auxiliaryProduct q γ hγ Fp Fm μ (ν + fun l => A l j)) := by
  sorry

/-- Total-degree induction: the first two equations remove parameter dependence,
and covariance kills each positive-degree coefficient. -/
theorem auxiliary_product_unique (q : Lˣ) (γ : ℕ) (hγ : γ ≠ 0)
    (A : I → I → ℤ)
    (G H : (Fin γ → I → ℤ) → (I → ℤ) → MvPowerSeries I L)
    (hq : ∀ n : ℕ, 0 < n → (q : L) ^ n ≠ 1)
    (hzero : ∀ F ∈ ({G, H} : Set ((Fin γ → I → ℤ) → (I → ℤ) →
      MvPowerSeries I L)), ∀ μ ν, MvPowerSeries.constantCoeff (F μ ν) = 1)
    (hplus : ∀ F ∈ ({G, H} : Set ((Fin γ → I → ℤ) → (I → ℤ) →
      MvPowerSeries I L)), ∀ μ ν i j,
      F μ ν - F (μ + Pi.single i (Pi.single j 1)) ν =
        MvPowerSeries.C ((-1 : L) ^ (A j j) *
          (q : L) ^ ((γ : ℤ) * (A j j + μ i j))) *
          (MvPowerSeries.X j) ^ γ * F (μ + Pi.single i (fun l => A l j)) ν)
    (hminus : ∀ F ∈ ({G, H} : Set ((Fin γ → I → ℤ) → (I → ℤ) →
      MvPowerSeries I L)), ∀ μ ν j,
      F μ ν - F μ (ν + Pi.single j 1) =
        MvPowerSeries.C ((-1 : L) ^ (A j j) * (q : L) ^ (-(A j j + ν j))) *
          MvPowerSeries.X j * F μ (ν + fun l => A l j))
    (hcov : ∀ F ∈ ({G, H} : Set ((Fin γ → I → ℤ) → (I → ℤ) →
      MvPowerSeries I L)), ∀ μ ν j,
      MvPowerSeries.rescale (fun l => if l = j then (q : L) else 1) (F μ ν) =
        F (μ + fun _ => Pi.single j 1) (ν - Pi.single j 1)) :
    G = H := by
  sorry
end Auxiliary

section UnpoweredAuxiliary
variable {I L E : Type*} [Fintype I] [DecidableEq I] [Field L] [Field E]

/-- The original unpowered product, whose common volume cancels.
Its covariance uses q^γ; inserting t^γ would change that volume. -/
def unpoweredAuxiliaryProduct (q : Lˣ) (γ : ℕ)
    (Fp Fm : MvPowerSeries I L) (μ : Fin γ → I → ℤ) (ν : I → ℤ) :
    MvPowerSeries I L :=
  (∏ i : Fin γ, MvPowerSeries.rescale
    (fun j => (q : L) ^ ((γ : ℤ) * μ i j)) Fp) *
    MvPowerSeries.rescale (fun j => (q : L) ^ (-ν j)) Fm

theorem unpoweredAuxiliaryProduct_constantCoeff (q : Lˣ) (γ : ℕ)
    (Fp Fm : MvPowerSeries I L) (μ : Fin γ → I → ℤ) (ν : I → ℤ) :
    MvPowerSeries.constantCoeff (unpoweredAuxiliaryProduct q γ Fp Fm μ ν) =
      (MvPowerSeries.constantCoeff Fp) ^ γ * MvPowerSeries.constantCoeff Fm := by
  sorry

theorem unpoweredAuxiliaryProduct_covariance (q : Lˣ) (γ : ℕ)
    (Fp Fm : MvPowerSeries I L) (μ : Fin γ → I → ℤ) (ν : I → ℤ) (j : I) :
    MvPowerSeries.rescale (fun l => if l = j then (q : L) ^ γ else 1)
      (unpoweredAuxiliaryProduct q γ Fp Fm μ ν) =
      unpoweredAuxiliaryProduct q γ Fp Fm
        (μ + fun _ => Pi.single j 1) (ν - (γ : ℤ) • Pi.single j 1) := by
  sorry

theorem unpoweredAuxiliaryProduct_map (f : L →+* E) (q : Lˣ) (γ : ℕ)
    (Fp Fm : MvPowerSeries I L) (μ : Fin γ → I → ℤ) (ν : I → ℤ) :
    MvPowerSeries.map f (unpoweredAuxiliaryProduct q γ Fp Fm μ ν) =
      unpoweredAuxiliaryProduct (Units.map f.toMonoidHom q) γ
        (MvPowerSeries.map f Fp) (MvPowerSeries.map f Fm) μ ν := by
  sorry

-- unpoweredAuxiliaryProduct_gamma_two: t² distinguishes it from t⁴.
example : unpoweredAuxiliaryProduct (I := Fin 1)
    (Units.mk0 (2 : ℚ) (by decide)) 2
    (MvPowerSeries.X 0) 1 (fun _ _ => 1) (fun _ => 0) =
    MvPowerSeries.C 16 * (MvPowerSeries.X 0) ^ 2 := by
  sorry

-- unpoweredAuxiliaryProduct_units
example (q : Lˣ) (γ : ℕ) (μ : Fin γ → I → ℤ) (ν : I → ℤ) :
    unpoweredAuxiliaryProduct q γ (1 : MvPowerSeries I L) 1 μ ν = 1 := by
  sorry

-- unpoweredAuxiliaryProduct_inverse_shift
example : unpoweredAuxiliaryProduct (I := Fin 1)
    (Units.mk0 (2 : ℚ) (by decide)) 1
    1 (MvPowerSeries.X 0) (fun _ _ => 0) (fun _ => 1) =
    MvPowerSeries.C (1 / 2 : ℚ) * MvPowerSeries.X 0 := by
  sorry

/-- The positive and negative recurrences are explicit assumptions on the imported
series. No unavailable `NahmSeries` object is represented by theorem fields. -/
theorem unpowered_product_system (q : Lˣ) (γ : ℕ) (hγ : γ ≠ 0)
    (A : I → I → ℤ) (Fp Fm : MvPowerSeries I L)
    (hp : ∀ j, Fp - MvPowerSeries.rescale
      (fun l => if l = j then (q : L) ^ γ else 1) Fp =
      MvPowerSeries.C ((-1 : L) ^ (A j j) * (q : L) ^ ((γ : ℤ) * A j j)) *
        MvPowerSeries.X j * MvPowerSeries.rescale
          (fun l => (q : L) ^ ((γ : ℤ) * A l j)) Fp)
    (hm : ∀ j, Fm - MvPowerSeries.rescale
      (fun l => if l = j then (q : L)⁻¹ else 1) Fm =
      MvPowerSeries.C ((-1 : L) ^ (A j j) * (q : L) ^ (-A j j)) *
        MvPowerSeries.X j * MvPowerSeries.rescale
          (fun l => (q : L) ^ (-A l j)) Fm)
    (μ : Fin γ → I → ℤ) (ν : I → ℤ) :
    (∀ i j, unpoweredAuxiliaryProduct q γ Fp Fm μ ν -
      unpoweredAuxiliaryProduct q γ Fp Fm (μ + Pi.single i (Pi.single j 1)) ν =
      MvPowerSeries.C ((-1 : L) ^ (A j j) *
        (q : L) ^ ((γ : ℤ) * (A j j + μ i j))) *
        MvPowerSeries.X j *
          unpoweredAuxiliaryProduct q γ Fp Fm (μ + Pi.single i (fun l => A l j)) ν) ∧
    (∀ j, unpoweredAuxiliaryProduct q γ Fp Fm μ ν -
      unpoweredAuxiliaryProduct q γ Fp Fm μ (ν + Pi.single j 1) =
      MvPowerSeries.C ((-1 : L) ^ (A j j) * (q : L) ^ (-(A j j + ν j))) *
        MvPowerSeries.X j *
          unpoweredAuxiliaryProduct q γ Fp Fm μ (ν + fun l => A l j)) := by
  sorry

/-- Total-degree induction: the first two equations remove parameter dependence,
and q^γ covariance kills each positive-degree coefficient. -/
theorem unpowered_product_unique (q : Lˣ) (γ : ℕ) (hγ : γ ≠ 0)
    (A : I → I → ℤ)
    (G H : (Fin γ → I → ℤ) → (I → ℤ) → MvPowerSeries I L)
    (hq : ∀ n : ℕ, 0 < n → (q : L) ^ n ≠ 1)
    (hzero : ∀ F ∈ ({G, H} : Set ((Fin γ → I → ℤ) → (I → ℤ) →
      MvPowerSeries I L)), ∀ μ ν, MvPowerSeries.constantCoeff (F μ ν) = 1)
    (hplus : ∀ F ∈ ({G, H} : Set ((Fin γ → I → ℤ) → (I → ℤ) →
      MvPowerSeries I L)), ∀ μ ν i j,
      F μ ν - F (μ + Pi.single i (Pi.single j 1)) ν =
        MvPowerSeries.C ((-1 : L) ^ (A j j) *
          (q : L) ^ ((γ : ℤ) * (A j j + μ i j))) *
          MvPowerSeries.X j * F (μ + Pi.single i (fun l => A l j)) ν)
    (hminus : ∀ F ∈ ({G, H} : Set ((Fin γ → I → ℤ) → (I → ℤ) →
      MvPowerSeries I L)), ∀ μ ν j,
      F μ ν - F μ (ν + Pi.single j 1) =
        MvPowerSeries.C ((-1 : L) ^ (A j j) * (q : L) ^ (-(A j j + ν j))) *
          MvPowerSeries.X j * F μ (ν + fun l => A l j))
    (hcov : ∀ F ∈ ({G, H} : Set ((Fin γ → I → ℤ) → (I → ℤ) →
      MvPowerSeries I L)), ∀ μ ν j,
      MvPowerSeries.rescale (fun l => if l = j then (q : L) ^ γ else 1) (F μ ν) =
        F (μ + fun _ => Pi.single j 1) (ν - (γ : ℤ) • Pi.single j 1)) :
    G = H := by
  sorry
end UnpoweredAuxiliary

section PotentialSign
variable {I L : Type*} [Fintype I] [Field L] [CharZero L]

/-- An algebraic consequence of the actual reflection and Nahm logarithm
identities. It does not define a substitute p-adic dilogarithm. -/
theorem coleman_potential_sign (A : I → I → ℤ) (z : I → L)
    (li₂ log : L → L)
    (hreflect : ∀ j, li₂ (z j) + li₂ (1 - z j) =
      -log (z j) * log (1 - z j))
    (hnahm : ∀ j, log (1 - z j) = ∑ i, (A i j : L) * log (z i)) :
    -(∑ j, li₂ (1 - z j)) - (1 / 2 : L) *
      (∑ i, ∑ j, (A i j : L) * log (z i) * log (z j)) =
    ∑ j, (li₂ (z j) + (1 / 2 : L) * log (z j) * log (1 - z j)) := by
  sorry
end PotentialSign

/-!
Named omissions, as required by PROTOCOL §13. These cannot yet be stated against
the pins because their mathematical carriers are imported planning nodes.

* followup-regularisation-jet / regularisation_jet:
  The actual fgiFactor and the Gaussian weight completion are from
  HabiroNahmSeries:HB.8/fgi-collection. Correct the pole to
  Li₂(θ^m)/(m²h)+Li₁(θ^m)w/(mh)+Li₀(θ^m)w²/(2h), with the constant-log sign
  fixed in E64. These are identities of the imported logarithmic expansion,
  not signatures for an invented function. B₁ and B₂ keep their Mathlib meanings.

* followup-refined-linear-integrality / refined_linear_integrality:
  For the principal-part-free refined Ω piece, normalize by its nonzero
  individual constant, then coeff 1 = ζ_m⁻¹ * gaussianFirstJet C b Q T₃ U₄ c
  in the full local coefficient algebra, with c including N/24 and the finite
  Pochhammer jet. The exact data are in the packet and reader. Missing carriers:
  corrected fgiRefined, S_p^(m), the Kummer torsor and B_p[ζ_m]. A possibly zero
  sum of constants is never inverted. E64/E65 must be reconciled at all orders
  by the HB.8 owner before this is used with identification.

* followup-modified-potential-formula / modified_potential_formula:
  W_p = p Σℓ₂(y_j) + p Σβ_jℓ₁(y_j) − pηᵗAη/2
        − Σ_j Σ_(r≥2) p^(r−1)β_j^r Li_(2−r)(y_j^p)/r! ∈ pS_p.
  Missing carriers are the actual completed coefficient algebra and its lifted
  Frobenius, and integralModifiedPolylog from ColemanIntegration L2. No general
  logarithm on S_p units is postulated; η is the log of φ(z)/z^p in 1+pS_p.

* followup-regulator-specialisation / regulator_specialisation:
  specOne(W_p)=φ_p(D_p ξ)/p−pD_p ξ, with ξ=Σ[z_j]. The exact main theorem uses
  actual Coleman functions, K₃/Bloch classes, Frobenius and specOne. These are
  imported HB.3/HB.6/HB.8/HB.9 and requested D.1/D.3/D.4 objects. The preceding
  typed lemma supplies its algebraic sign reduction, without pretending that
  an arbitrary function is the Coleman dilogarithm.

* followup-integral-gluing-contract / integral_product_gluing:
  The actual unpowered Gaussian auxiliary product is required to have integral coefficients in
  S^(m)[1/Δ][[x]] and satisfies the HB.6 coefficient-Frobenius root gluing on
  all components. The family is identified using unpowered_product_unique;
  integrality and the faithful coefficient model are separate recorded gaps.

* followup-kummer-orientation-contract / gaussian_constant_kummer_comparison:
  Match the full corrected U_m(1) with the fixed ε_m=c_ζ², including the inverse
  cyclic prefactor, monomials and k-sum. Missing carriers are HB.2's actual
  Kummer quotient/torsor and signed finite Chern comparison. Do not choose the
  sign by imposing the desired answer as a field of a structure.

* followup-etale-module-contract / etale_habiro_membership:
  Extend the existing HB.7 indexed module to B=R[T]/(δT²−1) and full finite
  products, prove actual Kummer descent, and consume its effective global descent.
  No private HabiroModule is defined here. The imported theorem names
  frobeniusCongruence and moduleMembership remain at their accepted owner IDs.
  They are omitted as Lean signatures until the actual completed S and indexed
  H_(B,ξ)|_Δ objects exist. Theorems 4 and 5 retain every hypothesis in the reader.

* followup-descendant-pullback-contract / descendant_etale_pullback:
  Use t_j^(1/m)=q^ν_j, hence t_j=q^(mν_j), and the unique formal étale lift at
  the selected t=1 point. Its logarithmic derivative is Λ⁻¹(mν/ζ_m).
  Missing carriers are HB.8's actual formal étale coefficient algebra, its
  completed lift and the indexed-module pullback/gluing. The ν=0, m=2 ν=1 and
  m=1 ν=−1 acceptance computations are mathematical tests in the reader;
  this node is a comparison, not a replacement descendant definition.

All definition/construction API names and all thirteen named tests of this packet
appear above with real finite-sum/power-series carriers. The unavailable named
results have these explicit omissions instead of dummy Prop-valued fields.
-/

end TauCeti.HabiroNahmHB9
