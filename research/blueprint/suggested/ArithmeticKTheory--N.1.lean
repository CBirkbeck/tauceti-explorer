import Mathlib
import TauCeti.RingTheory.DedekindDomain.SInteger.ClassGroup

/-!
# Arithmetic K-theory: representative target signatures

The roadmap is `research/blueprint/readmes/ArithmeticKTheory--N.1.md`, with full
contracts in its blueprint packet. This file is not exhaustive. The periodic
rank function uses the native infinite places; its K-theoretic interpretation
starts in degree two. The native S-integer class-group theorem is imported.
-/

namespace TauCetiRoadmap.ArithmeticKTheory

noncomputable section
open NumberField

/-! ## Layer 3: the higher-degree rank convention -/

/-- The Borel rank for degrees n≥2: r₁+r₂ in degree 1 mod 4, r₂ in degree
3 mod 4, and zero in even degree. Its value at n=1 is not the unit rank. -/
def borelRank (F : Type*) [Field F] [NumberField F] (n : ℕ) : ℕ :=
  if n % 4 = 1 then InfinitePlace.nrRealPlaces F + InfinitePlace.nrComplexPlaces F
  else if n % 4 = 3 then InfinitePlace.nrComplexPlaces F else 0

/-- The arithmetic rank has period four in the intended higher-degree range. -/
theorem borelRank_periodic (F : Type*) [Field F] [NumberField F] (n : ℕ) :
    borelRank F (n + 4) = borelRank F n := by
  sorry

example : borelRank ℚ 3 = 0 ∧ borelRank ℚ 5 = 1 ∧ borelRank ℚ 7 = 0 := by
  sorry

example (F : Type*) [Field F] [NumberField F] (j : ℕ) :
    borelRank F (2 * j) = 0 := by
  sorry

/-- The excluded degree-one value makes the scope restriction observable:
K₁(Z) is finite, although this periodic formula returns one. -/
example : borelRank ℚ 1 = 1 := by
  sorry

#check IsDedekindDomain.finite_integer_classGroup

/- Higher K-groups and their localization, Quillen's rank filtration and
function-field finite generation, Tate twists and w-invariants, Tate's theorem,
Keune's twisted Pic/p^m coinvariant injection and arithmetic order certificates
require the genuine supplier carriers. The original GQ82/Keune proof gaps are
recorded in the roadmap; no placeholder K functor or map is assumed here. -/

end

end TauCetiRoadmap.ArithmeticKTheory
