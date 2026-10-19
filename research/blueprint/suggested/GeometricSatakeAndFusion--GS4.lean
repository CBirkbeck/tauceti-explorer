import Mathlib.Algebra.Ring.Int.Parity
import Mathlib.Algebra.BigOperators.Group.Finset.Basic
import Mathlib.Algebra.Group.Units.Basic
import Mathlib.Algebra.Group.End
import Mathlib.Algebra.Module.LinearMap.Defs

/-!
# Geometric Satake reconstruction: representative target signatures

This file is not the roadmap and is not exhaustive. The definitive document is
`research/blueprint/readmes/GeometricSatakeAndFusion--GS4.md`. These statements
suggest Lean forms so that contributors and reviewers converge on names and
signatures. They claim no implementation.

Pins: Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.

The geometric Satake category, divisor/Weil realization, relative reconstructed
Hopf object, pinned integral dual group, classifying-stack perfect complexes,
enhanced kernels and Frobenius-descended finite models are README targets.
Their definitions, complete APIs, checks and hypotheses remain there. None is
represented here by an arbitrary category, a replacement proposition, an
assumed equivalence or a data definition with a proof placeholder.

Only three scalar definitions over existing rings, the flat-module saturation
endpoint and the elementary normalization multiplication identity are stated.
The latter checks the corrected semidirect-product formula; it does not claim
the unresolved geometric Drinfeld orientation comparison.
-/

namespace TauCeti.GeometricSatake.GS4

open scoped BigOperators

universe u v w

/-! ## Integral reconstruction: the flat-module endpoint -/

/-- The saturation argument of FS VI.11.3, p.237, needs no finite generation.
The localization hypotheses are written using powers of the element being
inverted, so every carrier in this statement exists at the pins. -/
theorem flatModuleSaturation
    {R : Type u} [CommRing R]
    {M : Type v} [AddCommGroup M] [Module R M]
    {N : Type w} [AddCommGroup N] [Module R N]
    (π : R) (f : M →ₗ[R] N)
    (hM : Function.Injective (fun x : M => π • x))
    (hN : Function.Injective (fun y : N => π • y))
    (hgeneric_inj : ∀ x, f x = 0 → ∃ n : ℕ, (π ^ n) • x = 0)
    (hgeneric_surj : ∀ y, ∃ (n : ℕ) (x : M), (π ^ n) • y = f x)
    (hmod : ∀ (x : M) (y : N), f x = π • y → ∃ z : M, x = π • z) :
    Function.Bijective f := by
  sorry

/-! ## Weil normalization: a multiplication check over actual groups -/

/-- Multiplication by the lifted cocycle intertwines the two products.
This is the algebraic content of Zhu's corrected Lemma5.5.7, pp.76–77;
conjugating the first coordinate instead does not give this identity. -/
theorem normalizationCocycleIso_mul
    {W : Type u} [Group W] {G : Type v} [Group G]
    (σ : W →* MulAut G) (t : W → G)
    (ht : ∀ w v, t (w * v) = t w * σ w (t v))
    (g h : G) (w v : W) :
    (g * (t w * σ w h * (t w)⁻¹)) * t (w * v) =
      (g * t w) * σ w (h * t v) := by
  sorry

/-! ## Classical comparison: explicit scalar conventions -/

/-- The sign of an integer degree, including negative degrees. -/
def paritySign (R : Type u) [CommRing R] (d : ℤ) : R :=
  if Even d then 1 else -1

/-- The half-Tate scalar for geometric Frobenius, with the root a unit. -/
def halfTateFactor {R : Type u} [CommRing R] (r : Rˣ) (d : ℤ) : R :=
  ↑(r ^ (-d))

/-- Alternating stalk trace with the support-parity correction.
The sheaf and its Frobenius descent are specified in the README; the input
here is the resulting finite family of scalar traces. -/
def normalizedStalkTrace {R : Type u} [CommRing R]
    (ε : ℤ) (J : Finset ℤ) (a : ℤ → R) : R :=
  paritySign R ε * ∑ i ∈ J, paritySign R i * a i

/-- The degree-zero sign is the multiplicative unit. -/
theorem paritySign_zero (R : Type u) [CommRing R] :
    paritySign R 0 = 1 := by
  sorry

/-- The support correction multiplies under tensor products. -/
theorem paritySign_add (R : Type u) [CommRing R] (a b : ℤ) :
    paritySign R (a + b) = paritySign R a * paritySign R b := by
  sorry

/-- Half-Tate degrees add by multiplying their scalars. -/
theorem halfTateFactor_add {R : Type u} [CommRing R] (r : Rˣ) (a b : ℤ) :
    halfTateFactor r (a + b) = halfTateFactor r a * halfTateFactor r b := by
  sorry

/-- A single nonzero stalk degree retains both signs. -/
theorem normalizedStalkTrace_singleton {R : Type u} [CommRing R]
    (ε i : ℤ) (a : ℤ → R) :
    normalizedStalkTrace ε {i} a = paritySign R ε * paritySign R i * a i := by
  sorry

/-- Additivity for a fixed support parity. -/
theorem normalizedStalkTrace_add {R : Type u} [CommRing R]
    (ε : ℤ) (J : Finset ℤ) (a b : ℤ → R) :
    normalizedStalkTrace ε J (fun i => a i + b i) =
      normalizedStalkTrace ε J a + normalizedStalkTrace ε J b := by
  sorry

/-- A scalar change in Frobenius descent scales the function. -/
theorem normalizedStalkTrace_scale {R : Type u} [CommRing R]
    (ε : ℤ) (J : Finset ℤ) (a : ℤ → R) (c : R) :
    normalizedStalkTrace ε J (fun i => c * a i) =
      c * normalizedStalkTrace ε J a := by
  sorry

-- test_parity_zero
example : paritySign ℤ 0 = 1 := by decide

-- test_parity_one
example : paritySign ℤ 1 = -1 := by decide

-- test_parity_negative
example : paritySign ℤ (-1) = -1 := by decide

-- test_halfTate_zero
example {R : Type u} [CommRing R] (r : Rˣ) : halfTateFactor r 0 = 1 := by
  sorry

-- test_halfTate_one
example {R : Type u} [CommRing R] (r : Rˣ) : halfTateFactor r 1 = ↑(r⁻¹) := by
  sorry

-- test_halfTate_negative
example {R : Type u} [CommRing R] (r : Rˣ) : halfTateFactor r (-1) = ↑r := by
  sorry

-- test_trace_empty
example {R : Type u} [CommRing R] (ε : ℤ) (a : ℤ → R) :
    normalizedStalkTrace ε ∅ a = 0 := by
  sorry

-- test_trace_IC: the perverse and support signs cancel even in odd dimension.
example {R : Type u} [CommRing R] (r : Rˣ) (d : ℤ) :
    normalizedStalkTrace d {-d} (fun _ => halfTateFactor r d) = halfTateFactor r d := by
  sorry

-- test_trace_twoDegrees
example : normalizedStalkTrace 1 {0, 1}
    (fun i => if i = 0 then (2 : ℤ) else 3) = 1 := by decide

-- test_trace_unit
example {R : Type u} [CommRing R] :
    normalizedStalkTrace 0 {0} (fun _ => (1 : R)) = 1 := by
  sorry

/-!
The remaining target signatures and their checks stay in the README:
* the 24 imported GS4 contracts, including every inherited definition's API;
* bounded standard filtrations, relative coequalizers and adic finite pieces;
* rational recognition, minuscule tensor invariants and the characteristic-two repair;
* integral model recovery, geometric pinning and normalization cocycle isomorphism;
* Levi, product, adjoint-isomorphism and Weil-restriction naturality;
* the all-prime perfect-kernel extension and its exact supplier hypotheses;
* finite-model trace transport, twisted Frobenius characters and the spherical square.
These require the actual geometric or stable carriers, absent at the pins.
The scalar formulas above do not stand in for those constructions.
-/

end TauCeti.GeometricSatake.GS4
