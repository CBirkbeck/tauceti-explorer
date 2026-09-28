import Mathlib.LinearAlgebra.Matrix.Trace
import Mathlib.LinearAlgebra.Matrix.Determinant.Basic
import Mathlib.LinearAlgebra.Matrix.Notation
import Mathlib.RingTheory.MvPowerSeries.Basic
import Mathlib.LinearAlgebra.Matrix.ToLin

/-!
# Suggested Lean forms: local Galois deformation rings (LocalGaloisDeformationRings, R08.1)

**Standard note.** This file is not the roadmap and it is not exhaustive. The roadmap document
(`LocalGaloisDeformationRings`) is definitive. The statements below suggest Lean forms, so that
contributors and reviewers converge on names and signatures. Every proof of a new declaration is
`sorry`; nothing here claims to be formalised.

Pinned baseline: Mathlib `082e2d3`, Tau Ceti `f790474`. This file imports Mathlib only; the
generic functors (`Lift`, `Def`, `PhiP`, …) are those of the GlobalGaloisDeformations suggested
file, and the local statements that use them are recorded in the comment block below.

The concrete content here is the archimedean ring at `p = 2`: a lift of complex conjugation with
determinant `-1` is a matrix `M = !![a, b; c, -a]` with `a ^ 2 + b * c = 1`.
-/

namespace TauCeti.GaloisDeformation.Local

variable {R : Type*} [CommRing R]

/-- **`R08.1/archimedean-odd-ring-p2`**, first step: an involution of determinant `-1` in
`M₂(R)` has trace `0` (Cayley–Hamilton). -/
theorem trace_eq_zero_of_mul_self_eq_one_of_det (M : Matrix (Fin 2) (Fin 2) R)
    (h : M * M = 1) (hd : M.det = -1) : M.trace = 0 := sorry

/-- The converse: a traceless matrix with `a² + bc = 1` is an involution. -/
theorem traceless_mul_self (a b c : R) (h : a ^ 2 + b * c = 1) :
    !![a, b; c, -a] * !![a, b; c, -a] = 1 := sorry

/-- Its determinant is `-1`. -/
theorem traceless_det (a b c : R) (h : a ^ 2 + b * c = 1) : (!![a, b; c, -a]).det = -1 := sorry

/-- The equation of the odd archimedean ring at `p = 2`, as an element of the power series ring
in the three entries centred at a lift `(a₀, b₀, c₀)` of `ρ̄(c)`. -/
noncomputable def oddArchimedeanEquation (a₀ b₀ c₀ : R) : MvPowerSeries (Fin 3) R :=
  (MvPowerSeries.C a₀ + MvPowerSeries.X 0) ^ 2 +
    (MvPowerSeries.C b₀ + MvPowerSeries.X 1) * (MvPowerSeries.C c₀ + MvPowerSeries.X 2) - 1

/-- **`R08.2/steinberg-condition`**, `n = 2`: the Frobenius relation of Steinberg lifts,
`q (tr ρ(φ))² = (1 + q)² det ρ(φ)`. -/
def SteinbergFrobRelation (q : ℕ) (M : Matrix (Fin 2) (Fin 2) R) : Prop :=
  (q : R) * M.trace ^ 2 = (1 + q) ^ 2 * M.det

/-- For `M = diag(α, qα)` the relation holds. -/
theorem steinbergFrobRelation_diag (q : ℕ) (α : R) :
    SteinbergFrobRelation q !![α, 0; 0, (q : R) * α] := sorry

/-- **`R08.2/minimally-ramified-condition`**, the kernel condition for a single matrix: the
kernels of `(A - 1)^i` have the expected rank (here stated as freeness of rank `r i`). -/
def KernelsHaveRank {m : ℕ} (A : Matrix (Fin m) (Fin m) R) (r : ℕ → ℕ) : Prop :=
  ∀ i, Nonempty (Module.Basis (Fin (r i)) R (LinearMap.ker (Matrix.toLin' ((A - 1) ^ i))))

/-!
## Signatures against the GlobalGaloisDeformations functors (comment only)

```
-- R08.1/local-lifting-ring
theorem Lift.proRepresentable_of_local (K : Type*) [Field K] [IsLocalField K] (ρbar : G_K →* GL (Fin n) 𝔽) :
    (Lift n ρbar).IsProRepresentable (C 𝒪)
-- R08.1/local-tangent-obstruction
theorem krullDim_localLiftingRing_ge (hℓp : ℓ = p) :
    1 + n ^ 2 + n ^ 2 * [K : ℚ_p] ≤ ringKrullDim (R□ ρbar)
-- R08.1/archimedean-odd-ring-p2
theorem oddArchimedeanRing_isDomain : IsDomain (MvPowerSeries (Fin 3) 𝒪 ⧸ Ideal.span {oddArchimedeanEquation a₀ b₀ c₀})
```
-/

end TauCeti.GaloisDeformation.Local

namespace TauCeti.GaloisDeformation.Local.SuggestedTest

open TauCeti.GaloisDeformation.Local

/-- `diag(1, -1)` is an odd involution. -/
example : (!![(1 : ℤ), 0; 0, -1]) * !![(1 : ℤ), 0; 0, -1] = 1 := by
  ext i j; fin_cases i <;> fin_cases j <;> simp

/-- The unipotent `!![1, 1; 0, -1]` over `ℤ` lifts `!![1, 1; 0, 1]` mod 2 and is an involution. -/
example : (!![(1 : ℤ), 1; 0, -1]) * !![(1 : ℤ), 1; 0, -1] = 1 := by
  ext i j; fin_cases i <;> fin_cases j <;> simp

end TauCeti.GaloisDeformation.Local.SuggestedTest
