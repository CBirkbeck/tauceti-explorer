/-
This file is not the roadmap and is not exhaustive. The roadmap document
(research/blueprint/readmes/AbelianSurfacesPotentialModularity.md) is definitive.
The statements below suggest Lean forms, so that contributors and reviewers converge
on names and signatures; they claim no implementation of the theory.

Baseline: Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.

Following the 2026-10-12 shape rule, the file keeps only light definitions with
real bodies over carriers that exist at these pins, and statable checks:
the similitude submonoid of the symplectic form, the
Iwahori indices, the integers of classical weights, the Iwahori multiplicities,
the patching dimension count, the ordinarity criterion for a Frobenius
polynomial, the centre of the Hasse–Weil functional equation and the group orders
behind S_6 ≅ Sp_4(F_2). GSp_4-valued Galois representations, compatible systems,
Hilbert–Siegel varieties, Hida complexes, deformation rings, patched modules and
the lifting and potential modularity theorems have no carriers at the pins; they
are README targets and are not stated here.
-/
import Mathlib.LinearAlgebra.SymplecticGroup
import Mathlib.Algebra.Polynomial.Monic
import Mathlib.Algebra.QuadraticDiscriminant
import Mathlib.Data.Nat.Prime.Defs
import Mathlib.Data.ZMod.Defs
import Mathlib.Data.Fintype.Perm
import Mathlib.Algebra.BigOperators.Group.Finset.Basic

namespace TauCeti.AbelianSurfaces

open Polynomial Matrix

section Similitude

variable (l : Type*) [DecidableEq l] [Fintype l] (R : Type*) [CommRing R]

/-- AP.0: matrices preserving the standard alternating form `J` up to a unit
multiplier; for `l = Fin 2` this is GSp_4(R). -/
def generalSymplecticGroup : Submonoid (Matrix (l ⊕ l) (l ⊕ l) R) where
  carrier := {A | ∃ c : Rˣ, A * J l R * Aᵀ = (c : R) • J l R}
  mul_mem' := sorry
  one_mem' := sorry

/-- AP.0: the symplectic group is the multiplier-one part. -/
theorem symplecticGroup_le_generalSymplecticGroup :
    symplecticGroup l R ≤ generalSymplecticGroup l R := sorry

/-- AP.0: a matrix in the similitude submonoid has a unique multiplier when `J` is
not killed by any nonzero scalar (true over a nontrivial ring). -/
theorem multiplier_unique [Nontrivial R] {A : Matrix (l ⊕ l) (l ⊕ l) R} [Nonempty l]
    {c d : Rˣ} (hc : A * J l R * Aᵀ = (c : R) • J l R)
    (hd : A * J l R * Aᵀ = (d : R) • J l R) : c = d := sorry

end Similitude

/-- The block matrix diag(c, c, 1, 1) of Lemma 10.2.4's cocycle has multiplier c. -/
example (c : ℚˣ) :
    Matrix.fromBlocks ((c : ℚ) • (1 : Matrix (Fin 2) (Fin 2) ℚ)) 0 0 1 ∈
      generalSymplecticGroup (Fin 2) ℚ := sorry

example : J (Fin 2) ℚ ∈ symplecticGroup (Fin 2) ℚ := sorry

/-! AP.1: the spherical Hecke polynomial Q_v(X) of BCGP (2.4.8) is not restated here. It is the
reciprocal monic GSp_4 spin polynomial `SmoothRepresentationsOfLocalGroups.SpinPolynomial.reciprocal`
of TauCetiRoadmap's SmoothRepresentationsOfLocalGroups (SR.4.5), equivalently
`Spherical.gsp4SpinPolynomial` of IntegralHeckeAndGaloisDeterminants, with BCGP's T_{v,1}, T_{v,2}
equal to that roadmap's T₂, T₁. -/

section Levels

/-- AP.1: [GSp_4(O_v) : Iw(v)] = (q+1)^2(q^2+1). -/
def iwahoriIndex (q : ℕ) : ℕ := (q + 1) ^ 2 * (q ^ 2 + 1)

/-- AP.1: [Iw(v) : Iw_1(v)] = (q−1)^3 = #T(k(v)). -/
def proIwahoriIndex (q : ℕ) : ℕ := (q - 1) ^ 3

example : iwahoriIndex 7 = 3200 := sorry
example : proIwahoriIndex 7 = 216 := sorry

/-- The index is prime to p at Ihara-avoidance and Taylor–Wiles places (q ≡ 1 mod p, p > 2),
as Proposition 7.9.8 needs. -/
theorem iwahoriIndex_coprime {p q : ℕ} (hp : p.Prime) (hp2 : 2 < p) (hq : q % p = 1) :
    Nat.Coprime p (iwahoriIndex q) := sorry

end Levels

section Weights

/-- AP.1: the cyclotomic exponents (θ_{v,1}, θ_{v,2}) = (ε^{(k+l)/2−2}, ε^{(k−l)/2}) of the
classical weight (k, l). -/
def weightExponents (k l : ℤ) : ℤ × ℤ := ((k + l) / 2 - 2, (k - l) / 2)

/-- AP.1: (k, l) is a classical weight for the prime p: k ≥ l ≥ 2, k ≡ l mod 2, and both
exponents are divisible by p − 1 (trivial reduction). -/
def IsClassicalWeight (p : ℕ) (k l : ℤ) : Prop :=
  2 ≤ l ∧ l ≤ k ∧ (k - l) % 2 = 0 ∧
    ((p : ℤ) - 1) ∣ (weightExponents k l).1 ∧ ((p : ℤ) - 1) ∣ (weightExponents k l).2

example : weightExponents 2 2 = (0, 0) := sorry

example (p N : ℕ) :
    weightExponents (3 * N * ((p : ℤ) - 1) + 2) (N * ((p : ℤ) - 1) + 2) =
      (2 * N * ((p : ℤ) - 1), N * ((p : ℤ) - 1)) := sorry

example : ¬ IsClassicalWeight 3 3 3 := sorry

theorem IsClassicalWeight.congruence {p : ℕ} {k l : ℤ} (h : IsClassicalWeight p k l) :
    (k - 2) % (2 * ((p : ℤ) - 1)) = 0 ∨ (k - ((p : ℤ) + 1)) % (2 * ((p : ℤ) - 1)) = 0 := sorry

end Weights

section Multiplicities

/-- AP.4 (Proposition 7.13.5): total Iwahori invariants of a generic L-packet on a component
of Spec R_v^1 with monodromy rank n. -/
def iwahoriMultiplicity : Fin 4 → ℕ
  | 0 => 8
  | 1 => 4
  | 2 => 4
  | 3 => 1

/-- AP.4: d_ρ = ∏_{v∈R} d_{η_v} for the monodromy ranks of ρ at the places of R. -/
def multiplicityOfRanks {ι : Type*} [Fintype ι] (n : ι → Fin 4) : ℕ :=
  ∏ v, iwahoriMultiplicity (n v)

example : iwahoriMultiplicity 3 = 1 := rfl

theorem multiplicityOfRanks_eq {ι : Type*} [Fintype ι] [DecidableEq ι] (n : ι → Fin 4) :
    multiplicityOfRanks n =
      8 ^ (Finset.univ.filter fun v => n v = 0).card *
        4 ^ ((Finset.univ.filter fun v => n v = 1).card +
          (Finset.univ.filter fun v => n v = 2).card) := sorry

/-- Theorem 7.13.6: the eigenspace has dimension 8 d_ρ, the 8 = |W| coming from v₀. -/
def eigenspaceDimension {ι : Type*} [Fintype ι] (n : ι → Fin 4) : ℕ :=
  8 * multiplicityOfRanks n

example : eigenspaceDimension (fun _ : Fin 2 => (3 : Fin 4)) = 8 := sorry

end Multiplicities

section Patching

/-- AP.3: g = 2q − 4[F:Q] + #S − 1, the number of extra variables of R_∞ (§7.11). -/
def patchingVariables (q d s : ℕ) : ℤ := 2 * q - 4 * d + s - 1

/-- AP.3: the relative dimension 2q + 11#S − 1 of S_∞ over Λ_I. -/
def patchingRelDim (q s : ℕ) : ℤ := 2 * q + 11 * s - 1

/-- AP.3 (7.11.1): (R_∞)' has relative dimension g + 10#S + 4[F:Q] − #I = dim S_∞ − #I. -/
theorem patching_dimension_identity (q d s i : ℕ) :
    patchingVariables q d s + 10 * s + 4 * d - i = patchingRelDim q s - i := sorry

example : patchingVariables 4 1 3 = 6 := sorry
example : patchingRelDim 4 3 = 40 := sorry

end Patching

section Frobenius

/-- AP.6: the Frobenius polynomial X^4 − a₁X^3 + a₂X^2 − q a₁X + q^2 of an abelian surface at
a place of norm q. -/
noncomputable def frobeniusPoly (q : ℕ) (a₁ a₂ : ℤ) : ℤ[X] :=
  X ^ 4 - C a₁ * X ^ 3 + C a₂ * X ^ 2 - C ((q : ℤ) * a₁) * X + C ((q : ℤ) ^ 2)

/-- For E₁ × E₂ the Frobenius polynomial is the product of the two elliptic ones. -/
theorem frobeniusPoly_prod (q : ℕ) (a b : ℤ) :
    (X ^ 2 - C a * X + C (q : ℤ)) * (X ^ 2 - C b * X + C (q : ℤ)) =
      frobeniusPoly q (a + b) (a * b + 2 * q) := sorry

/-- AP.6 (Lemma 9.2.5): at a place above p of good reduction, the surface is ordinary
(p ∤ a₂) and p-distinguished (p ∤ a₁^2 − 4a₂). -/
def IsDistinguishedOrdinary (p : ℕ) (a₁ a₂ : ℤ) : Prop :=
  ¬ (p : ℤ) ∣ a₂ ∧ ¬ (p : ℤ) ∣ a₁ ^ 2 - 4 * a₂

example : IsDistinguishedOrdinary 5 1 2 := sorry
example : ¬ IsDistinguishedOrdinary 5 2 1 := sorry

/-- AP.6 (Lemma 9.2.6, corrected choice of q): Δ_v = a₁^2 − 4a₂ + 8p, the discriminant of
t^2 − a₁t + (a₂ − 2p), whose roots are α + p/α and β + p/β. -/
def switchDiscriminant (p : ℕ) (a₁ a₂ : ℤ) : ℤ := a₁ ^ 2 - 4 * a₂ + 8 * p

theorem switchDiscriminant_eq_discrim (p : ℕ) (a₁ a₂ : ℤ) :
    discrim (1 : ℤ) (-a₁) (a₂ - 2 * p) = switchDiscriminant p a₁ a₂ := sorry

end Frobenius

/-- AP.6 (Corollary 9.3.3, corrected): the completed Hasse–Weil function of a smooth projective
variety of dimension d is symmetric under s ↦ d + 1 − s. -/
def hasseWeilCentre (d : ℕ) : ℕ := d + 1

/-- For a genus two curve the symmetry is s ↦ 2 − s; 3 − s belongs to its Jacobian. -/
example : hasseWeilCentre 1 = 2 := rfl
example : hasseWeilCentre 2 = 3 := rfl

section Groups

/-- AP.7: |S_6| = 720. -/
theorem card_perm_six : Fintype.card (Equiv.Perm (Fin 6)) = 720 := sorry

/-- AP.7: |Sp_4(F_2)| = |S_6|, the order behind S_6 ≅ Sp_4(F_2) through Weierstrass points. -/
theorem card_symplecticGroup_two :
    Nat.card (symplecticGroup (Fin 2) (ZMod 2)) = Nat.card (Equiv.Perm (Fin 6)) := sorry

/-- AP.7: |Sp_4(F_3)| = 51840; its quotient PSp_4(F_3) by ±1 has Schur multiplier of order 2. -/
theorem card_symplecticGroup_three :
    Nat.card (symplecticGroup (Fin 2) (ZMod 3)) = 51840 := sorry

/-- AP.7: the odd-theta cover P → 𝒜_2(3) has degree [S_6 : S_5] = 6. -/
example : Fintype.card (Equiv.Perm (Fin 6)) / Fintype.card (Equiv.Perm (Fin 5)) = 6 := sorry

end Groups

end TauCeti.AbelianSurfaces
