import Mathlib.Algebra.Module.LinearMap.Basic
import Mathlib.Algebra.Module.Torsion.Basic

/-!
# Isocrystals, vector bundles and Banach–Colmez spaces, Part II

The companion README is the definitive roadmap. This file records suggested forms,
not an exhaustive checklist. It states only targets whose carriers exist at the pins;
each `sorry` marks a theorem or example requiring proof. The sympathetic, left-heart,
period-ring, reasonable-module and qBC carriers are README targets, not invented
stand-ins in this file. No category or period object is defined by a proof hole.

The first signature checks the cyclotomic twist in AC.1/generalized-invariant-complex
(CN25 Proposition 2.7, author preprint p. 10). The examples check its degenerate cases
and the native scalar-torsion convention in TVS.2/torsion-source-hom-ext.
-/

namespace TauCetiRoadmap.VectorBundlesAndIsocrystalsPartII

section TwistedComplex

variable {R M : Type*} [Field R] [AddCommGroup M] [Module R M]

/-- The two differentials compose to zero with the inverse cyclotomic scalar.
Here `G.comp T = c • T.comp G` is a genuine relation on native linear maps.
It does not assert that the missing generalized-invariant carriers exist. -/
theorem twisted_differential_comp_zero
    (G T : M →ₗ[R] M) (c : R) (hc : c ≠ 0)
    (hGT : G.comp T = c • T.comp G) (x : M) :
    T (G x - x) - (c⁻¹ • G (T x) - T x) = 0 := by
  sorry

/-- With trivial twist the assertion reduces to the commuting-operator identity. -/
example (G T : M →ₗ[R] M) (hGT : G.comp T = T.comp G) (x : M) :
    T (G x - x) - (G (T x) - T x) = 0 := by
  sorry

/-- Zero torsion operator is allowed; this does not require inverting that operator. -/
example (G : M →ₗ[R] M) (c : R) (x : M) :
    (0 : M →ₗ[R] M) (G x - x) -
      (c⁻¹ • G ((0 : M →ₗ[R] M) x) - (0 : M →ₗ[R] M) x) = 0 := by
  sorry

end TwistedComplex

section NativeTorsionChecks

variable {R M : Type*} [CommRing R] [AddCommGroup M] [Module R M]

-- These are compatibility tests of Mathlib's existing carrier, not new definitions.
example (a : R) (x : M) :
    x ∈ Submodule.torsionBy R M a ↔ a • x = 0 := by
  sorry

example : Submodule.torsionBy R M (0 : R) = ⊤ := by
  sorry

example : Submodule.torsionBy R M (1 : R) = ⊥ := by
  sorry

end NativeTorsionChecks

end TauCetiRoadmap.VectorBundlesAndIsocrystalsPartII
