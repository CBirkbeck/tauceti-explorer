import Mathlib.Algebra.Group.Commute.Units
import Mathlib.Tactic.NormNum

/-!
# Habiro cohomology foundations, Part II: native suggestion

The README is the specification. This file suggests forms that can be stated
against the pinned libraries; it is not an exhaustive declaration checklist.

The carriers for trace q-Hodge pairs, spectra, their genuine fixed points and
prismatic Nygaard are supplied by other roadmaps and do not exist at the pins.
The four enhanced application targets, their maps, coherence and discriminating
Checks are specified in the README. No stand-in carriers are introduced here.

This native example checks the additional coefficient inversion used by the
number-field trace export. It claims no implementation of that export.
-/

namespace TauCetiRoadmap.HabiroCohomologyFoundationsPartII

-- README 2.2: the trace theorem's inversion of 6 entails both small-prime units.
example {R : Type*} [CommRing R] (h : IsUnit (6 : R)) :
    IsUnit (2 : R) ∧ IsUnit (3 : R) := by
  apply (Commute.all (2 : R) (3 : R)).isUnit_mul_iff.mp
  convert h using 1
  norm_num

end TauCetiRoadmap.HabiroCohomologyFoundationsPartII
