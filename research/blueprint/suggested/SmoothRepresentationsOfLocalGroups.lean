import Mathlib.Algebra.Algebra.Subalgebra.Basic
import Mathlib.RingTheory.FiniteType
import Mathlib.RingTheory.Noetherian.Basic
import Mathlib.Algebra.Algebra.Rat

/-!
This file is not the roadmap and is not exhaustive. The accompanying roadmap document is
definitive. These statements suggest Lean forms so contributors and reviewers can converge
on names and signatures; they do not claim implementations.

The current TauCetiRoadmap smooth-representation roadmap supplies the existing theory.
The new cosheaf, Schwartz, Bernstein-completion and geometric-action targets need carriers
not present at the pins and are stated precisely in the reader document. Following the
2026-10-12 shape rule, this file contains only the light finite-centre interface on existing
Mathlib carriers and its three examples. It does not redeclare the imported roadmap.

Blueprint pins: Tau Ceti f790474821cf4256814db967cb154e7af3d0c369;
Mathlib 082e2d3 (the commit recorded in the packet).
-/

namespace TauCeti.SmoothPartII

universe u v

/-- The two different finiteness clauses in the level-Hecke-algebra endpoint. -/
def FiniteCentralAlgebra (R : Type u) (H : Type v)
    [CommRing R] [Ring H] [Algebra R H] : Prop :=
  Module.Finite (Subalgebra.center R H) H ∧
    Algebra.FiniteType R (Subalgebra.center R H)

namespace FiniteCentralAlgebra

variable {R : Type u} {H : Type v} [CommRing R] [Ring H] [Algebra R H]

theorem finiteModule (h : FiniteCentralAlgebra R H) :
    Module.Finite (Subalgebra.center R H) H := by
  sorry

theorem finiteTypeCentre (h : FiniteCentralAlgebra R H) :
    Algebra.FiniteType R (Subalgebra.center R H) := by
  sorry

/-- The generic algebraic consequence; the Hecke theorem has its own coefficient hypotheses. -/
theorem noetherian [IsNoetherianRing R] (h : FiniteCentralAlgebra R H) :
    IsNoetherianRing H := by
  sorry

-- FiniteCentralAlgebra.field: the rank-one identity algebra.
example : FiniteCentralAlgebra ℚ ℚ := by
  sorry

-- FiniteCentralAlgebra.polynomial: finite over the centre does not mean finite over ℚ.
example : FiniteCentralAlgebra ℚ (Polynomial ℚ) ∧ ¬ Module.Finite ℚ (Polynomial ℚ) := by
  sorry

-- FiniteCentralAlgebra.rationals: finite type of the centre cannot be omitted.
example : ¬ FiniteCentralAlgebra ℤ ℚ := by
  sorry

end FiniteCentralAlgebra
end TauCeti.SmoothPartII
