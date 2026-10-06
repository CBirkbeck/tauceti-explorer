/-
This file is not the roadmap and is not exhaustive. The roadmap document
research/blueprint/readmes/HabiroNumberFields--HB.2.md is definitive. These
statements suggest Lean forms so that contributors and reviewers converge
on names and signatures. They claim no implementation.

BP-HabiroNumberFields--HB.2, Codex — codex-in1rju, 2026-10-06.
implementationStatus = unchecked.
Baseline: Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.
Independent review REV-HabiroNumberFields--HB.2, Codex — codex-5w7FQz:
full lean-check stops at the missing PowerClassGroup object file.
The Mathlib-only signatures through kms_oddOrder were checked separately;
the Tau Ceti power-class example and full file remain unelaborated.

This supplement imports the parent packet's 28 HB.2 declarations by id;
it does not reproduce their prototypes. The KMS statement writes the
parent D polynomial's evaluation as a local finite-product expression,
without introducing another dilogarithm definition. The actual Bloch,
K-theory and finite Chern types are absent from the pinned libraries.
Their two comparison signatures are identified below as not stated,
rather than encoded as proposition-valued fields or assumed maps.
-/
import Mathlib.Algebra.BigOperators.Ring.Finset
import Mathlib.RingTheory.RootsOfUnity.PrimitiveRoots
import Mathlib.Basic.Complex.Basic
import Mathlib.Data.ZMod.Basic
import TauCeti.Algebra.Group.PowerClassGroup
import TauCeti.FieldTheory.GaloisCohomology.Kummer

open scoped BigOperators

namespace TauCeti.HabiroNF

/-! ## HabiroNumberFields:HB.2/cyclic-hypergeometric-sum -/

/-- The total finite expression in CGZ §2.5 and GZ Appendix A (56).
The product starts at `ζ * y`, and the sum includes `k = 0`.
Periodicity requires the cyclic hypotheses of `cyclicHypergeom_shift_z`. -/
noncomputable def cyclicHypergeom {K : Type*} [Field K]
    (n : ℕ) (ζ x y z : K) : K := sorry

theorem cyclicHypergeom_eq_sum {K : Type*} [Field K]
    (n : ℕ) (ζ x y z : K) :
    cyclicHypergeom n ζ x y z =
      ∑ k ∈ Finset.range n,
        ((∏ j ∈ Finset.range k, (1 - ζ ^ (j + 1) * y)) /
         (∏ j ∈ Finset.range k, (1 - ζ ^ (j + 1) * x))) * z ^ k := sorry

@[simp] theorem cyclicHypergeom_zero {K : Type*} [Field K] (ζ x y z : K) :
    cyclicHypergeom 0 ζ x y z = 0 := sorry

@[simp] theorem cyclicHypergeom_one {K : Type*} [Field K] (ζ x y z : K) :
    cyclicHypergeom 1 ζ x y z = 1 := sorry

@[simp] theorem cyclicHypergeom_two {K : Type*} [Field K] (ζ x y z : K) :
    cyclicHypergeom 2 ζ x y z = 1 + (1 - ζ * y) / (1 - ζ * x) * z := sorry

theorem cyclicHypergeom_map {K L : Type*} [Field K] [Field L]
    (φ : K →+* L) (n : ℕ) (ζ x y z : K) :
    φ (cyclicHypergeom n ζ x y z) =
      cyclicHypergeom n (φ ζ) (φ x) (φ y) (φ z) := sorry

theorem cyclicHypergeom_diagonal {K : Type*} [Field K]
    (n : ℕ) (ζ x z : K)
    (hx : ∀ k ∈ Finset.range n,
      (∏ j ∈ Finset.range k, (1 - ζ ^ (j + 1) * x)) ≠ 0) :
    cyclicHypergeom n ζ x x z = ∑ k ∈ Finset.range n, z ^ k := sorry

/-- Compatibility with Mathlib's `IsPrimitiveRoot.geom_sum_eq_zero`. -/
theorem cyclicHypergeom_diagonal_root {K : Type*} [Field K]
    {n : ℕ} (hn : 1 < n) (ζ x z : K) (hz : IsPrimitiveRoot z n)
    (hx : ∀ k ∈ Finset.range n,
      (∏ j ∈ Finset.range k, (1 - ζ ^ (j + 1) * x)) ≠ 0) :
    cyclicHypergeom n ζ x x z = 0 := sorry

theorem cyclicHypergeom_shift_z {K : Type*} [Field K]
    {n : ℕ} (hn : 0 < n) (ζ x y z : K) (hζ : IsPrimitiveRoot ζ n)
    (hx : x ^ n ≠ 1) (hy : y ^ n ≠ 1)
    (hperiod : (1 - y ^ n) * z ^ n = 1 - x ^ n) :
    (1 - z) * cyclicHypergeom n ζ x y z =
      (x - ζ * y * z) * cyclicHypergeom n ζ x y (ζ * z) := sorry

/-- Test `cyclicHypergeom_empty` (degenerate). -/
example {K : Type*} [Field K] (ζ x y z : K) :
    cyclicHypergeom 0 ζ x y z = 0 := sorry

/-- Test `cyclicHypergeom_singleton` (computation). -/
example {K : Type*} [Field K] (ζ x y z : K) :
    cyclicHypergeom 1 ζ x y z = 1 := sorry

/-- Test `cyclicHypergeom_rational_two` (computation).
A product starting at `y` instead of `ζ * y` fails this test. -/
example : cyclicHypergeom 2 (-1 : ℚ) 2 3 5 = 23 / 3 := sorry

/-- Test `cyclicHypergeom_diagonal_three` (compatibility). -/
example (ζ : ℂ) (hζ : IsPrimitiveRoot ζ 3) :
    cyclicHypergeom 3 ζ 0 0 ζ = 0 := sorry

/-! ## HabiroNumberFields:HB.2/kms-odd-order-proof -/

/-- The odd-order KMS identity quoted by CGZ §2.5, with denominators cleared.
`D` is the evaluation of the imported cyclic dilogarithm, not a new object.
The analytic proof uses the corrected Gaussian/product constants and the
explicit eta phase. Integral specialization covers positive characteristic. -/
theorem kms_oddOrder {K : Type*} [Field K] {n : ℕ}
    (hn : 3 ≤ n) (hodd : Odd n) (hunit : IsUnit (n : K))
    (ζ x y z : K) (hζ : IsPrimitiveRoot ζ n)
    (hx0 : x ≠ 0) (hy0 : y ≠ 0) (hz0 : z ≠ 0)
    (hx : x ^ n ≠ 1) (hy : y ^ n ≠ 1) (hxy : x ^ n ≠ y ^ n)
    (hperiod : (1 - y ^ n) * z ^ n = 1 - x ^ n) :
    let D : K → K := fun u => ∏ k ∈ Finset.range n, (1 - ζ ^ k * u) ^ k
    cyclicHypergeom n ζ x y z ^ n * D (1 / x) * D (ζ * y) * D (ζ / z) =
      (ζ * y) ^ (n * (n - 1) / 2) * D 1 * D (ζ * y / x) * D (x / (y * z)) := sorry

/-! ## Actual homology/Bloch and K-theory/Chern comparisons -/

-- eta_bar_bloch_specialization: not stated; needs the actual cyclic group
-- resolution and homology classes, the V.4 refined configuration map,
-- the V.3 Suslin-to-CGZ convention maps, and the parent's eta element.
-- The required statement is equality of the image of the positive
-- alpha_3(t) with eta in B_CGZ(Q(zeta + zeta^-1))/N. The N=3 image is [0],
-- not zero after dropping the correction term. The determinant-one
-- conjugation in the roadmap is a proof component, not a substitute map.

-- eta_chern_signed_evaluation: not stated; needs actual finite-coefficient
-- K-theory, the Bott class with boundary zeta, the early M.8 finite-Chern
-- prefix and the continuous Kummer identification of ProfiniteCohomology
-- Layer 9. For N an odd prime power with the standard positive bar/Bott
-- and Kummer conventions, raw Soule evaluates to [zeta^-1].
-- The independently negated degree-(2,1) Chern map evaluates to [zeta].
-- Identifying CGZ/GSWZ's fixed map with
-- either one is a separate obligation; no normalization is chosen by eta.

/-- Acceptance for the signed evaluation: classes of a primitive cubic
root and its inverse differ. This uses Tau Ceti's actual power-class map;
the unit has value 2 and inverse 4 in F_7. -/
example :
    let ζ : (ZMod 7)ˣ := ⟨2, 4, by decide, by decide⟩
    TauCeti.powerClassHom (ZMod 7)ˣ 3 ζ ≠
      (TauCeti.powerClassHom (ZMod 7)ˣ 3 ζ)⁻¹ := sorry

-- The full regulator conclusion is HabiroNahmSeries:HB.5's assembly:
-- import HB.4/acceptance-andrews-gordon, QM.0's Andrews–Gordon API,
-- QM.1's theta/eta transformations, and HB.2's scalar-from-eta.
-- Export the convention-qualified comparison to HabiroNahmSeries HB.9.
-- No HB.4 theorem is a premise of an HB.2 declaration here.

end TauCeti.HabiroNF
