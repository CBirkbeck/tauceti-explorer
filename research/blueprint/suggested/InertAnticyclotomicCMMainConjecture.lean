import Mathlib.LinearAlgebra.Basis.Defs
import Mathlib.RingTheory.Ideal.Span

/-!
# Inert anticyclotomic CM main conjecture: the coordinate facet

Pins: Tau Ceti f790474821cf4256814db967cb154e7af3d0c369;
Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174.

The full arithmetic targets and their hypotheses are in the companion reader:
IC.0--IC.1, Gross datum, towers and signed Selmer conditions;
IC.2, primitive class and Rubin's integral coordinate;
IC.3--IC.4, elliptic units, global duality and the integral main conjecture;
IC.5--IC.6, finite control and CM rank bounds.

The pins do not supply the carriers for those arithmetic endpoints. They remain
reader targets, with explicit proof/source gaps. Here `A` and `M` are existing
Mathlib carriers; a future specialization takes A = Lambda_R and M = the actual
free signed line. Nothing in this file assumes a characteristic-ideal equality
or represents a heavy arithmetic construction by an unimplemented definition.

The only new definition is the real coordinate of a vector in an already based
rank-one module. These statements isolate the basis normalization used in
IC.2/rubin-lfunction. They do not establish the primitive-lattice comparison
IC.4/primitive-lattice-comparison.
-/

noncomputable section

open Module

namespace TauCeti.InertAnticyclotomicCM

variable {A M : Type*} [CommRing A] [AddCommGroup M] [Module A M]

/-- Coordinate in an existing rank-one based module; the IC.2 light facet. -/
def rankOneCoordinate (b : Basis Unit A M) (x : M) : A := b.repr x ()

/-- The actual vector, rather than a prescribed scalar, determines the coordinate. -/
theorem coordinate_reconstruct (b : Basis Unit A M) (x : M) :
    x = rankOneCoordinate b x • b () := by
  sorry

/-- Exact change of coordinate when the integral basis is multiplied by a unit. -/
theorem coordinate_basisChange (b b' : Basis Unit A M) (u : Aˣ)
    (hb : b' () = (u : A) • b ()) (x : M) :
    rankOneCoordinate b' x = (↑(u⁻¹) : A) * rankOneCoordinate b x := by
  sorry

/-- The integral principal ideal is independent of the signed basis. -/
theorem coordinate_ideal_basisChange (b b' : Basis Unit A M) (u : Aˣ)
    (hb : b' () = (u : A) • b ()) (x : M) :
    Ideal.span ({rankOneCoordinate b' x} : Set A) =
      Ideal.span ({rankOneCoordinate b x} : Set A) := by
  sorry

/-- Rescaling a normalized class by an integral unit preserves its coordinate ideal. -/
theorem coordinate_ideal_unit_smul (b : Basis Unit A M) (u : Aˣ) (x : M) :
    Ideal.span ({rankOneCoordinate b ((u : A) • x)} : Set A) =
      Ideal.span ({rankOneCoordinate b x} : Set A) := by
  sorry

-- Zero vector: no nonvanishing is built into the definition.
example (b : Basis Unit A M) : rankOneCoordinate b 0 = 0 := by
  simp [rankOneCoordinate]

-- A genuine basis vector has unit coordinate.
example (b : Basis Unit A M) : rankOneCoordinate b (b ()) = 1 := by
  simp [rankOneCoordinate]

-- A nonunit scalar survives in the integral coordinate, rather than being inverted.
example (b : Basis Unit A M) (a : A) :
    rankOneCoordinate b (a • b ()) = a := by
  simp [rankOneCoordinate]

end TauCeti.InertAnticyclotomicCM
