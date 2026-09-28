import Mathlib.RingTheory.LocalRing.Defs
import Mathlib.LinearAlgebra.FreeModule.Basic
import Mathlib.Algebra.MonoidAlgebra.Defs
import Mathlib.Algebra.Polynomial.Splits
import Mathlib.Tactic.Ring
import Mathlib.Data.ZMod.Basic
import Mathlib.LinearAlgebra.Matrix.Notation
import Mathlib.LinearAlgebra.Matrix.Determinant.Basic
import Mathlib.Tactic.LinearCombination

/-!
# Suggested Lean forms: GL₂ modularity lifting, R22.1–R22.6 (GL2ModularityLifting, part R22.1)

**Standard note.** This file is not the roadmap and it is not exhaustive. The roadmap document
(`GL2ModularityLifting`) is definitive. The statements below suggest Lean forms, so that
contributors and reviewers converge on names and signatures. Nothing here claims to be
formalised.

Pinned baseline: Mathlib `082e2d3`, Tau Ceti `f790474`. This file imports Mathlib only; the
quaternionic forms and Hecke algebras (HilbertModularVarietiesAndShimuraCurves R18.3/R18.6),
Galois representations over Hecke algebras (AutomorphicGaloisRepresentations R19.6) and the
global deformation rings (GlobalGaloisDeformations R04.4–R04.6) are recorded in the comment
block below, not elaborated.

## Signatures (comment only)

```
-- R22.1/minimal-level-data
structure MinimalLevelData (ρbar : GaloisRep F 𝔽 2) where
  D : QuaternionAlgebra F; definite : IsTotallyDefinite D; ramified : RamifiedExactly D (Σ ∪ ∞)
  U : OpenCompactOrNot D; weight : WeightModule U; ψ : HeckeCharacter F 𝒪
  𝔪 : MaximalSpectrum (HeckeAlgebra D U ψ); nonEis : ¬ IsEisenstein 𝔪; residual : residualRep 𝔪 ≅ ρbar
-- R22.1/deformation-to-hecke-map and surjectivity
def defToHecke (d : MinimalLevelData ρbar) : d.kw.unframedRing →ₐ[𝒪] d.heckeAlgebra
theorem defToHecke_trace (v) (hv : v ∉ S) : d.defToHecke (trace (d.kw.univRep (Frob v))) = T v
theorem defToHecke_surjective : Function.Surjective d.defToHecke
-- R22.2/delta-freeness-at-taylor-wiles-level
theorem auxModule_free (Q : TaylorWilesDatum n) : Module.Free 𝒪[Δ Q] (auxModule d Q)
theorem auxModule_coinvariants (Q) : coinvariants (Δ Q) (auxModule d Q) ≃ₗ[𝒪] d.heckeModule
-- R22.5/kw-residual-modularity
-- (α): π unramified above p, of weight k(ρbar); (β): π of conductor dividing v above p, weight 2
def ResidualModularAlpha (ρbar : GaloisRep F 𝔽 2) : Prop
def ResidualModularBeta (ρbar : GaloisRep F 𝔽 2) : Prop
-- R22.5/kw-odd-prime-lifting (KW II Theorem 9.7, p > 2)
theorem kw_lifting_odd (hp : 2 < p) (hF : UnramifiedAt F p)
    (hirr : AbsIrred (ρbar.restrict (F⟮ζ_p⟯)))
    (hα : ResidualModularAlpha ρbar) (hβ : ResidualModularBeta ρbar)
    (ρ : GaloisRep F 𝒪 2) (hlift : ρ.reduce ≅ ρbar) (hodd : TotallyOdd ρ)
    (hp_type : ∀ v ∣ p, KWTypeA ρ v ∨ KWTypeB ρ v ∨ KWTypeC ρ v) : IsModular ρ
-- R22.5/kisin-potentially-bt-lifting (Kisin, Annals (3.5.5))
theorem kisin_pbt (hp : 2 < p) (hsrm : StronglyResiduallyModular ρ)
    (hres : ∀ 𝔭 ∣ p, ¬ PotOrdinary ρ 𝔭 → ResidueField 𝔭 = 𝔽_p)
    (hirr : AbsIrred (ρbar.restrict (F⟮ζ_p⟯)))
    (h5 : p = 5 → ExceptionalPGL2F5Condition ρbar) : IsModular ρ
-- R22.6/dyadic-patched-ring, dyadic-patched-torsor, dyadic-r-equals-t
def dyadicPatchedRing : PatchedRing  -- R′_∞ ↠ R_∞ with a free T-action and d : Sp R′_∞ → T
theorem dyadicDet_smul (λ : T) (x : Sp R′_∞) : d (λ • x) = λ ^ 2 * d x
theorem dyadic_torsor : IsTorsor (T.torsion 2) (Sp R_∞) (Sp R^inv_∞)
theorem dyadic_kernel_twoPowerTorsion : ∀ r ∈ RingHom.ker π, ∃ n, (2 : 𝒪) ^ n • r = 0
-- R22.6/kisin-dyadic-bt-lifting, hypothesis-h
theorem kisin_2adic (hns : ¬ IsSolvable (ρbar.image)) (hmod : IsModular ρbar)
    (hbt : ∀ v ∣ 2, PotBarsottiTate ρ v) (hdet : det ρ = cyclo * ψ) (hψ : TotallyEven ψ)
    (hord : ∀ v ∣ 2, PotOrdinary ρ v → F_v = ℚ_2) : IsModular ρ
theorem hypothesisH (ρ : GaloisRep ℚ 𝒪 2) (hodd : det ρ c = -1) (hns : ¬ IsSolvable (ρbar.image))
    (hmod : IsModular ρbar) (hwt : PotCrystalline ρ 2 ∧ HodgeTate ρ = {0, 1}) : IsModular ρ
```
-/

namespace TauCeti.ModularityLifting.SuggestedTest

/-- `R22.2/auxiliary-hecke-algebra`: the Hecke polynomial at `v ∈ Q` factors as `(X − A)(X − B)` with
`A + B = T_v`, `AB = N(v)ψ(π_v)`; the factorisation identity itself. -/
example {R : Type*} [CommRing R] (A B x : R) : (x - A) * (x - B) = x ^ 2 - (A + B) * x + A * B := by
  ring

/-- `R22.2/dyadic-twists-of-forms`: a character of order two squares to one, so `χ(Nm z) = 1` on
`(𝔸_F^∞)^×` whenever `Nm z = z²` there. -/
example {M : Type*} [CommGroup M] (χ z : M) (h : χ ^ 2 = 1) : (χ * z) ^ 2 = z ^ 2 := by
  rw [mul_pow, h, one_mul]

/-- `R22.3/patched-support`: the dimension count `1 + d + (h + j − d) = 1 + h + j` for the power
series ring over the local ring (with `d ≤ h + j`). -/
example (d h j : ℕ) (hd : d ≤ h + j) : 1 + d + (h + j - d) = 1 + h + j := by omega

/-- `R22.5/solvable-base-change-reduction`: `ℚ(√6) ⊗ ℚ_3 = ℚ_3(√−3)` because `6/(−3) = −2`
is a square modulo 3. -/
example : IsSquare (-2 : ZMod 3) := ⟨1, by decide⟩

/-- `R22.6/dyadic-oddness`: `diag(1, −1)` has determinant `−1` (the lift is odd) but reduces to the
identity modulo 2. -/
example : (!![1, 0; 0, -1] : Matrix (Fin 2) (Fin 2) ℤ).det = -1 := by
  simp [Matrix.det_fin_two]

example : (!![1, 0; 0, -1] : Matrix (Fin 2) (Fin 2) ℤ).map (Int.cast : ℤ → ZMod 2) = 1 := by
  ext i j
  fin_cases i <;> fin_cases j <;> decide

/-- `R22.6/dyadic-patched-torsor` (Lemma 9.5): removing the `t` torus directions from
`dim R′_∞ = h + j + t + 1` leaves `h + j + 1`. -/
example (h j t : ℕ) : h + j + t + 1 - t = h + j + 1 := by omega

/-- `R22.6/dyadic-patched-torsor`: `T[2](𝒪) ≅ (±1)^t` has `2^t` elements. -/
example (t : ℕ) : Fintype.card (Fin t → ZMod 2) = 2 ^ t := by
  simp [ZMod.card]

/-- `R22.6/hypothesis-h`: with `χ(c) = −1` and `det ρ(c) = −1`, the character `ψ = det ρ · χ⁻¹` is
even. -/
example {R : Type*} [CommRing R] (ψc : R) (h : (-1) * ψc = -1) : ψc = 1 := by
  linear_combination -h

end TauCeti.ModularityLifting.SuggestedTest
