import Mathlib.Algebra.BigOperators.Group.Finset.Basic
import Mathlib.Algebra.Group.Idempotent
import Mathlib.Algebra.Polynomial.Degree.Defs
import Mathlib.Data.ZMod.Basic
import Mathlib.LinearAlgebra.Matrix.Notation
import Mathlib.Tactic.ComputeDegree

/-!
# Suggested Lean forms: ordinary automorphic forms and ordinary modularity lifting (R21.1–R21.2)

**Standard note.** This file is not the roadmap and it is not exhaustive. The roadmap document
(`OrdinaryAutomorphicFormsAndModularityLifting`) is definitive. The statements below suggest Lean
forms, so that contributors and reviewers converge on names and signatures. Every proof of a new
declaration is `sorry` unless it is a small checked identity; nothing here claims to be formalised.

Pinned baseline: Mathlib `082e2d3`, Tau Ceti `f790474`.

## Conventions

* `F` is totally real of even degree, `D/F` the quaternion algebra ramified exactly at the
  infinite places, `X(U) = D^× \ G^D(A_f) / U` and `H⁰(X(U), R) = X(U) → R`. These objects are
  requested from HilbertModularVarietiesAndShimuraCurves R18.3; here only their finite-set shadow
  (functions on a finite type) is prototyped.
* The ordinary projector is PadicFamilies L0a's `lim T^{n!}`; Skinner–Wiles' exponent
  `p^n (p^m - 1)` gives the same idempotent (`R21.1/projector-exponent-comparison`).
* `Λ′_𝒪` (variables `X_i`, `Y`) is the weight algebra of `T_∞(U, 𝒪)`; `Λ_𝒪` (variables `T_j`, `Y`)
  is the one at a permissible maximal ideal.
-/

namespace TauCeti.OrdinaryModularity

section FiniteSets

variable {X Y R : Type*} [Fintype X] [Fintype Y] [DecidableEq X]

/-- **`R21.1/ordinary-hecke-adjoint-pairing`**: the stabiliser-weighted pairing
`⟨f, g⟩ = Σ c(x)⁻¹ f(x) g(x)` on functions on a finite set. -/
def quaternionicPairing [Field R] (c : X → ℕ) (f g : X → R) : R :=
  ∑ x, ((c x : R))⁻¹ * f x * g x

/-- **`R21.1/ordinary-trace-compatibility`**: the trace along a map of finite sets,
`tr g (x) = Σ_{π y = x} g y`. -/
def traceAlong [AddCommMonoid R] (π : Y → X) (g : Y → R) : X → R :=
  fun x => ∑ y ∈ Finset.univ.filter (fun y => π y = x), g y

/-- Restriction and trace are adjoint for the unweighted pairing:
`Σ_y f(π y) g(y) = Σ_x f(x) (tr g)(x)`. -/
theorem sum_comp_mul_eq_sum_mul_traceAlong [CommSemiring R] (π : Y → X) (f : X → R)
    (g : Y → R) : ∑ y, f (π y) * g y = ∑ x, f x * traceAlong π g x := by
  simp only [traceAlong, Finset.mul_sum]
  rw [← Finset.sum_fiberwise Finset.univ π (fun y => f (π y) * g y)]
  refine Finset.sum_congr rfl fun x _ => Finset.sum_congr rfl fun y hy => ?_
  rw [(Finset.mem_filter.1 hy).2]

omit [DecidableEq X] in
/-- With all stabilisers trivial the weighted pairing is the dot product. -/
theorem quaternionicPairing_one [Field R] (f g : X → R) :
    quaternionicPairing (fun _ => 1) f g = ∑ x, f x * g x := by
  simp [quaternionicPairing]

end FiniteSets

/-!
### R21.1 and R21.2: signatures (comment only)

```
-- R21.1/quaternionic-ordinary-projector (H⁰, T₀(p) from R18.3; projector from PadicFamilies L0a)
def ordinaryProjector (U : Level F) (a : ℕ) (R : Type) [Module 𝒪 R] [Finite R] :
    Module.End 𝒪 (H0 (U.full a) R) := PadicFamilies.ordinaryProjector (T0p U a R)
theorem ordinaryProjector_isIdempotentElem : IsIdempotentElem (ordinaryProjector U a R)
theorem ordinaryProjector_comm_hecke (t : quaternionicHeckeAlgebra U a 𝒪) :
    Commute (ordinaryProjector U a R) (t.toEnd R)
theorem ordinaryProjector_trace (hab : a ≤ b) :
    trace hab ∘ₗ ordinaryProjector U b R = ordinaryProjector U a R ∘ₗ trace hab
-- R21.1/ordinary-part-kills-norm-forms
theorem ordinaryProjector_normForms (ha : 1 ≤ a) (f : normForms U a ℤ) :
    ordinaryProjector U a R (f.toCoeff R) = 0
-- R21.1/quaternionic-nearly-ordinary-hecke-algebra
def nearlyOrdinaryHeckeAlgebra (U a 𝒪) : Subalgebra 𝒪 (Module.End 𝒪 (ordinaryPart U a 𝒪))
def hidaHeckeAlgebra (U 𝒪) : Type := lim_a nearlyOrdinaryHeckeAlgebra U a 𝒪
def hidaHeckeAlgebra.lambdaAlgebra : Algebra (MvPowerSeries (Fin δ ⊕ torusVars F) 𝒪) (hidaHeckeAlgebra U 𝒪)
-- R21.1/ordinary-towers-duality
def mInfinity (U 𝒪) := lim_a (ordinaryPart U a 𝒪)⁺   -- along traces
def hInfinity (U 𝒪) := colim_a ordinaryPart U a (K ⧸ 𝒪)   -- along pullbacks
def mInfinity_equiv_dual : mInfinity U 𝒪 ≃ₗ[hidaHeckeAlgebra U 𝒪] (hInfinity U 𝒪 →ₗ[𝒪] K ⧸ 𝒪)
-- R21.2/nearly-ordinary-representations
def IsVGoodLine (π : CuspidalRep F k) (v : PrimeAbove p) (L : Submodule ℂ (π.localFixed v a)) : Prop
def IsNearlyOrdinary (π : CuspidalRep F k) : Prop := ∀ v : PrimeAbove p, ∃ L, IsVGoodLine π v L
-- R21.2/permissible-maximal-ideal
structure IsPermissible (χ : GaloisCharacter F k) (m : Ideal (hidaHeckeAlgebra U 𝒪)) : Prop where
  isMaximal : m.IsMaximal
  groupRing : m.comap (groupRingHom U 𝒪) = RingHom.ker (charMod (χ * ω⁻¹))
  T0_sub_one_mem : ∀ i, T0 (primeAbove i) - 1 ∈ m
  T_sub_mem : ∀ ℓ ∉ badPrimes U, T ℓ - 1 - teichmuller (χ (Frob ℓ)) ∈ m
-- R21.2/eisenstein-ideal-existence (Deligne–Ribet from AutomorphicPadicLFunctions L3)
theorem exists_isPermissible (h : 0 < valuation π (deligneRibet F (χ * ω) (-1))) :
    ∃ a (m : Ideal (nearlyOrdinaryHeckeAlgebra (levelChi χ) a 𝒪)), IsPermissible χ m
-- R21.2/permissible-localisation-finite
theorem isPermissible.finite (hm : IsPermissible χ m) :
    Module.Finite Λ (Localization.AtPrime m) ∧ Module.IsTorsionFree Λ (Localization.AtPrime m)
-- R21.2/auxiliary-level-freeness
theorem mInfinity_free_aux (hfree : FixedPointFree (U' w)) :
    Module.Free (MvPowerSeries _ 𝒪 ⊗ 𝒪⟦Δ w⟧) (mInfinity (U'' w) 𝒪)
```
-/

end TauCeti.OrdinaryModularity

namespace TauCeti.OrdinaryModularity.SuggestedTest

open Polynomial

/-- `R21.1/projector-exponent-comparison`: a unit `u` of `ℤ/25` satisfies `u^{p(p-1)} = 1` for
`p = 5`, the model for `T₀(p)^{p^n (p^m - 1)} → 1` on the part where `T₀(p)` is a unit. -/
example : (2 : ZMod 25) ^ (5 * 4) = 1 := by decide

/-- `R21.1/ordinary-part-kills-norm-forms`: on norm-factoring forms `T₀(p)` is divisible by `p`,
hence nilpotent on finite coefficients; here `5³ = 0` in `ℤ/125`. -/
example : (5 : ZMod 125) ^ 3 = 0 := by decide

/-- `R21.1/ordinary-level-independence`: `diag(1, ϖ) · (1 0; x 1) = (1 0; ϖx 1) · diag(1, ϖ)`. -/
example {R : Type*} [CommRing R] (ϖ x : R) :
    (!![1, 0; 0, ϖ] : Matrix (Fin 2) (Fin 2) R) * !![1, 0; x, 1] =
      !![1, 0; ϖ * x, 1] * !![1, 0; 0, ϖ] := by
  simp

/-- Source issue `E1`: `(1 + T)^{p^r} - 1` has degree `p^r`, so `Λ_𝒪` has rank `p^{Σ r_j}` over
`Λ′_𝒪`, not `Σ r_j`; here `p = 5`, `r = 1`. -/
example : ((X + 1 : ℤ[X]) ^ 5 - 1).natDegree = 5 := by
  compute_degree!

/-- `R21.2/permissible-maximal-ideal`, the degree-one test: Ramanujan's congruence
`τ(ℓ) ≡ 1 + ℓ^{11} mod 691` at `ℓ = 2, 3` (`τ(2) = -24`, `τ(3) = 252`). -/
example : (-24 : ZMod 691) = 1 + 2 ^ 11 ∧ (252 : ZMod 691) = 1 + 3 ^ 11 := by
  decide

end TauCeti.OrdinaryModularity.SuggestedTest
