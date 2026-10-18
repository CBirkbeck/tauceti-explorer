import Mathlib.Algebra.BigOperators.Group.Finset.Lemmas
import Mathlib.Algebra.BigOperators.Fin
import Mathlib.Data.Fin.VecNotation
import Mathlib.RingTheory.RootsOfUnity.Basic
import TauCeti.Algebra.AlgebraicGroup.RootsOfUnity.Scheme

/-!
This file is not the roadmap and is not exhaustive. The companion roadmap document is
definitive. These statements suggest Lean forms so contributors and reviewers can converge
on names and signatures. They claim no implementation of the geometric targets.

The compact shape required by WORKERS.md keeps only statements over carriers at the pins.
The omission ledger below identifies the geometric declarations that require supplier types.
In particular, no arbitrary predicate stands for an algebraic stack or its morphism properties.

The finite product below is only notation for the existing product of evaluation homomorphisms.
The target `orderedInertia` identifies this product with the actual map of geometric inertia
groups. Its character-theoretic application belongs to GC.3/collision-kernel.
-/

namespace TauCeti.RamifiedClassField

open CategoryTheory
open scoped BigOperators CategoryTheory.MonObj

universe u

variable (B : Type u) [CommRing B]

/-- Coordinate notation for multiplication in the native μ₂-points. -/
noncomputable abbrev orderedInertiaProduct (m : ℕ) :
    (Fin m → rootsOfUnity 2 B) →* rootsOfUnity 2 B :=
  ∏ i : Fin m, Pi.evalMonoidHom (fun _ : Fin m => rootsOfUnity 2 B) i

/-- The coordinate part of `orderedInertia`: discard coordinate zero in the kernel.
The inverse inserts the inverse product in coordinate zero. A permutation transports this
distinguished index; keeping it fixed requires the conjugated action on the other coordinates. -/
theorem orderedInertia_kernel (n : ℕ) :
    ∃ e : (orderedInertiaProduct B (n + 1)).ker ≃* (Fin n → rootsOfUnity 2 B),
      ∀ ζ i, e ζ i = ζ.val i.succ := by
  sorry

/-- Algebra change acts on every coordinate, including nonreduced value algebras. -/
theorem orderedInertia_naturality {C : Type u} [CommRing C]
    (φ : B →+* C) (m : ℕ) (ζ : Fin m → rootsOfUnity 2 B) :
    restrictRootsOfUnity φ 2 (orderedInertiaProduct B m ζ) =
      orderedInertiaProduct C m (fun i => restrictRootsOfUnity φ 2 (ζ i)) := by
  sorry

/-- Multiplication and its kernel are canonical under reindexing all factors. -/
theorem orderedInertia_reindex (m : ℕ) (σ : Fin m ≃ Fin m)
    (ζ : Fin m → rootsOfUnity 2 B) :
    orderedInertiaProduct B m (fun i => ζ (σ i)) = orderedInertiaProduct B m ζ := by
  sorry

-- No branch factor is present at multiplicity zero.
example (ζ : Fin 0 → rootsOfUnity 2 B) : orderedInertiaProduct B 0 ζ = 1 := by
  sorry

-- A single branch preimage has no relative inertia kernel.
example (ζ : Fin 1 → rootsOfUnity 2 B) : orderedInertiaProduct B 1 ζ = ζ 0 := by
  sorry

-- A double collision has a diagonal kernel, even though each factor is tame.
example (ζ : rootsOfUnity 2 B) :
    orderedInertiaProduct B 2 ![ζ, ζ⁻¹] = 1 := by
  sorry

example (ζ : rootsOfUnity 2 B) (hζ : ζ ≠ 1) :
    ¬Function.Injective (orderedInertiaProduct B 2) := by
  sorry

-- Agreement with the existing group-scheme point comparison, not a new μ₂ model.
example (R : Type u) [CommRing R] [Algebra R B] (m : ℕ)
    (p : Fin m →
      ((AlgebraicGeometry.Spec (CommRingCat.of B)).asOver
        (AlgebraicGeometry.Spec (CommRingCat.of R)) ⟶
        (TauCeti.RootsOfUnityGroup.groupScheme R 2).X)) :
    TauCeti.RootsOfUnityGroup.schemePointsMulEquiv (R := R) (A := B) 2
        (List.ofFn p).prod =
      orderedInertiaProduct B m (fun i =>
        TauCeti.RootsOfUnityGroup.schemePointsMulEquiv (R := R) (A := B) 2 (p i)) := by
  sorry

-- The coordinate equation in rootAdditionChart; the geometric quotient map is a README target.
example (f g s t : B) (hs : s ^ 2 = f) (ht : t ^ 2 = g) :
    (s * t) ^ 2 = f * g := by
  sorry

/-!
Geometric omission ledger. Names below are under `TauCeti.RamifiedClassField`.
The README states every object, hypothesis, API and test. The packet records the exact
SF.0/SF.1/SF.3 contracts needed to give these names their geometric types.

Target declarations:
* relativeEvaluationEquivalence
* rootEffectiveOpen_baseChange
* incidenceResidualEquivalence
* evaluationAtlas_differential
* rootNormalCrossingChart
* rootCoarseChart
* rootFullFibre_inertia
* rootAdditionChart
* orderedInertia (only its native coordinate consequences are stated above)
* orderedGeometricFibre
* orderedDivisors_coherence
* refinedAbelJacobiFibre
* rootAbelJacobi_compatibility

Construction APIs and tests:
* relativeEvaluationEquivalence.{object, arrow, inverse, unitCounit, baseChange, splitBranch}
* relativeEvaluationEquivalence.{test_empty_R, test_zero, test_nilpotent, test_arrow}
* incidenceResidualEquivalence.{forward, inverse, universalDivisor, baseChange, nesting}
* incidenceResidualEquivalence.{test_empty, test_degree_one, test_excess, test_double}
* rootAdditionChart.{coefficient, root, equivariance, baseChange, globalCompatibility}
* rootAdditionChart.{test_unit, test_zero, test_signs, test_ordinary}
* refinedAbelJacobiFibre.{section, equation, effectiveOpen, translation, forgetRootSection}
* refinedAbelJacobiFibre.{test_empty_R, test_inconsistent, test_zero, test_degree_zero}

The parent packet's rootSymmetricPower, rootAddition, orderedRootDivisors and
rootAbelJacobi are imports, not replacement definitions in this file. Their inherited
API/tests are restated mathematically in the README. Algebraic-stack equivalences,
relative symmetric schemes, quotient presentations, coarse maps and both Picard-stack
targets need actual supplier carriers. Compiling this file does not discharge that gap.
-/

end TauCeti.RamifiedClassField
