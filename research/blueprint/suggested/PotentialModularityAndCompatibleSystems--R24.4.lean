import Mathlib.FieldTheory.AbsoluteGaloisGroup
import Mathlib.RepresentationTheory.Irreducible
import Mathlib.LinearAlgebra.Matrix.Determinant.Basic
import Mathlib.LinearAlgebra.Matrix.Notation
import Mathlib.Data.ZMod.Basic

/-!
# Suggested Lean forms: R24.4, the KW lifting import

This file is not the roadmap and is not exhaustive. The reader document
`PotentialModularityAndCompatibleSystems--R24.4.md` is definitive. These statements
suggest Lean forms so contributors and reviewers can converge on names and signatures.
No implementation is claimed. The pins are Mathlib
082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti
f790474821cf4256814db967cb154e7af3d0c369.

R24.4 adds no definitions or lifting theorem. Reuse the accepted R24.3 packet nodes:
* PotentialModularityAndCompatibleSystems:R24.4/alpha-beta-from-residual-modularity
* PotentialModularityAndCompatibleSystems:R24.4/kw-theorem-4-1

Full signatures omitted:
* TauCeti.CompatibleSystems.alpha_beta_from_residual_modularity
  Import GL2ModularityLifting:R22.5/alpha-beta-from-modularity-over-q. The full
  residual lattice/newform comparison and alpha/beta witness carriers are supplied
  arithmetic interfaces. Dyadic alpha is asserted only for residual weight two.
* TauCeti.CompatibleSystems.kw_theorem_4_1
  Import GL2ModularityLifting:R22.5/kw-i-theorem-4-1-odd-prime and
  GL2ModularityLifting:R22.6/kw-i-theorem-4-1-dyadic. The full local Hodge,
  Serre-weight and modularity signatures are not exported at the baseline.
  The README preserves all branch guards and the odd-prime supplier proof gap.

No R24.1 finiteness, R24.2 arithmetic-point or R24.3 lift-existence theorem is an
argument to either consumer. A lift is supplied as input.

The three examples below concern actual matrices over existing coefficient rings.
They check the loss of the determinant sign modulo two. They are not representations
of G_Q, modularity tests, or substitutes for an omitted arithmetic predicate.
-/

namespace TauCeti.CompatibleSystems.KWLiftingImportChecks

-- odd_conjugation_determinant: the characteristic-zero normal form has sign -1.
example : Matrix.det !![(1 : ℚ), 0; 0, -1] = -1 := by
  sorry

-- dyadic_reduced_determinant: that determinant reduces to the even sign.
example : Matrix.det !![(1 : ZMod 2), 0; 0, -1] = 1 := by
  sorry

-- dyadic_reduced_matrix: the full normal-form matrix reduces to the identity.
example : !![(1 : ZMod 2), 0; 0, -1] = (1 : Matrix (Fin 2) (Fin 2) (ZMod 2)) := by
  sorry

end TauCeti.CompatibleSystems.KWLiftingImportChecks
