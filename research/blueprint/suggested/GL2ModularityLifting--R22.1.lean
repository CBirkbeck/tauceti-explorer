import Mathlib.Data.ZMod.Basic
import Mathlib.LinearAlgebra.Matrix.Determinant.Basic
import Mathlib.Tactic.NormNum

/-!
# Suggested forms for GL₂ modularity lifting

This file is not the roadmap and is not exhaustive. The companion README is definitive.
These declarations suggest names and signatures; no mathematical implementation is claimed.
Baseline: Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.

WORKERS.md's current shape puts full definitions, hypotheses, APIs, Checks and worked examples
in the README. Only light definitions on existing carriers and relevant statable milestones
belong here. In particular there are no stand-in automorphic carriers or data definitions
without bodies. The two imported Mathlib carriers below are integers and matrices.

Omission manifest (the README gives the complete mathematical targets):
* R22.1: minimal-level data, quaternionic Hecke algebras/modules, framed base change and
  deformation-to-Hecke maps require the R04/R18/R19 carriers. KW II §8 (Lemma 8.1, the
  determinant kinds, Theorems 8.2 and 8.4, Lemma 8.3) and Definition 7.9 are imported from
  SerreWeightAndLevelOptimisation R20.6, and KW II Lemma 7.10 from ArithmeticGaloisDuality
  R02.6; their light definitions belong to those owners, not here.
* R22.1: the CHT soluble field with prescribed completions is a substantial construction; it
  remains a README target even though raw number fields exist at the pins.
* R22.2: auxiliary levels, branch ideals, coefficient modules and diamonds require the imported
  quaternionic and local Galois objects; localized control is HilbertModularVarieties R18.3.
* R22.3: the structured arithmetic patching datum, finite-level realization and ring/module
  limits are substantial constructions with missing deformation/automorphic actions.
* R22.4: the avoidance pair and its simultaneous special-fibre comparison require those same
  missing carriers. Generic commutative rings are not substitutes for the arithmetic objects.
* R22.5: residual α/β witnesses, strong residual modularity, BCDT coefficient/type modules,
  admitted types and each lifting theorem require Hilbert forms, local Hodge conditions and
  the specified Galois/deformation suppliers.
* R22.6: enhanced finite data, dyadic rings/modules, formal tori and action chunks are README
  constructions; their oddness convention has the concrete matrix test below.
* R32.1: all four lifting propositions require genuine modularity and p-adic Hodge predicates;
  no arbitrary proposition parameters replace them. The signed prime is fully statable.
* R32.2: patched weight filtrations, local multiplicities and component-support conclusions
  require the R08/R18/R20/R30/R31 carriers and explicit supplier contracts.
* R32.3–R32.5 are imported from the accepted GL2ModularityLifting--R32.3 part; they are neither
  redeclared nor replanned here.
-/

set_option autoImplicit false

namespace TauCeti.ModularityLifting

/-- The signed integer defining the quadratic cyclotomic subfield for an odd prime. -/
def pStar (p : ℕ) : ℤ := (-1) ^ ((p - 1) / 2) * (p : ℤ)

/-- Arithmetic interface only; the quadratic-field statement is a README target. -/
theorem pStar_eq (p : ℕ) : pStar p = (-1) ^ ((p - 1) / 2) * (p : ℤ) := rfl

/-- The sign does not change the absolute value. -/
theorem pStar_natAbs (p : ℕ) : (pStar p).natAbs = p := by
  sorry

example : pStar 3 = -3 := by norm_num [pStar]
example : pStar 5 = 5 := by norm_num [pStar]
example : pStar 7 = -7 := by norm_num [pStar]
-- The arithmetic expression is total; the quadratic-field theorem assumes an odd prime.
example : pStar 2 = 2 := by norm_num [pStar]

/-- R32.1's oddness bridge on actual matrices: involutivity and odd residual determinant
force odd characteristic-zero determinant over a domain. The residue characteristic matters. -/
theorem odd_determinant_of_odd_reduction
    {R k : Type*} [CommRing R] [IsDomain R] [Field k]
    (φ : R →+* k) (c : Matrix (Fin 2) (Fin 2) R)
    (hc : c * c = 1) (hres : Matrix.det (c.map φ) = -1) (hodd : (2 : k) ≠ 0) :
    Matrix.det c = -1 := by
  sorry

-- Characteristic two cannot detect the determinant sign: the identity passes that test.
example : (-1 : ZMod 2) = 1 := by decide
example : Matrix.det (1 : Matrix (Fin 2) (Fin 2) (ZMod 2)) = -1 := by
  simpa only [Matrix.det_one] using (show (1 : ZMod 2) = -1 by decide)
-- The same test distinguishes signs at every odd residue characteristic.
example : (-1 : ZMod 3) ≠ 1 := by decide

end TauCeti.ModularityLifting
