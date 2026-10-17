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
without bodies. The two imported Mathlib carriers below are integers and matrices; the
character predicates use actual group homomorphisms. Their arithmetic specialization still
requires the norm, Teichmüller and idele-character suppliers.

Omission manifest (the README gives the complete mathematical targets):
* R22.1: minimal-level data, quaternionic Hecke algebras/modules, framed base change,
  deformation-to-Hecke maps and the KW modular witnesses require the R04/R18/R19 carriers.
* R22.1: allowable field towers and CHT character/field choice are substantial constructions;
  they remain README targets even though raw number fields exist at the pins.
* R22.2: auxiliary levels, branch ideals, coefficient modules, diamonds and integral control
  require the imported quaternionic and local Galois objects.
* R22.3: the structured arithmetic patching datum, finite-level realization and ring/module
  limits are substantial constructions with missing deformation/automorphic actions.
* R22.4: the avoidance pair and its simultaneous special-fibre comparison require those same
  missing carriers. Generic commutative rings are not substitutes for the arithmetic objects.
* R22.5: residual α/β witnesses, strong residual modularity, BCDT coefficient/type modules,
  admitted types and each lifting theorem require Hilbert forms, local Hodge conditions and
  the specified Galois/deformation suppliers. The integer determinant exponents and their
  light character predicates are stated below; this does not construct global characters.
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

namespace KW

/-- Exponent of the norm for a determinant of kind (i). -/
def kindIExponent (k : ℕ) : ℤ := 2 - (k : ℤ)

/-- Exponent of the Teichmüller norm for a determinant of kind (ii). -/
def kindIIExponent (k : ℕ) : ℤ := (k : ℤ) - 2

/-- Norm exponent of kind (iii); its arithmetic use requires residual weight two. -/
def kindIIIExponent (p : ℕ) : ℤ := 1 - (p : ℤ)

variable {U A : Type*} [Group U] [CommGroup A]

/-- The unit-restriction condition, specialized with the actual norm homomorphism. -/
def IsKindI (ψp N : U →* A) (k : ℕ) : Prop :=
  ∀ u, ψp u = N u ^ kindIExponent k

/-- The unit-restriction condition with the actual Teichmüller norm homomorphism. -/
def IsKindII (ψp τN : U →* A) (k : ℕ) : Prop :=
  ∀ u, ψp u = τN u ^ kindIIExponent k

/-- Kind (iii) includes, rather than silently assumes, the residual-weight-two condition. -/
def IsKindIII (ψp N : U →* A) (p k : ℕ) : Prop :=
  k = 2 ∧ ∀ u, ψp u = N u ^ kindIIIExponent p

/-- At weight two both determinant conditions say that the unit restriction is trivial. -/
theorem kindsI_II_at_two (ψp N τN : U →* A) :
    IsKindI ψp N 2 ↔ IsKindII ψp τN 2 := by
  sorry

example : kindIExponent 2 = 0 ∧ kindIIExponent 2 = 0 := by
  norm_num [kindIExponent, kindIIExponent]

example (ψp N τN : U →* A) : IsKindI ψp N 2 ↔ IsKindII ψp τN 2 := by
  sorry

example : kindIIIExponent 3 = -2 ∧ kindIExponent 4 = -2 := by
  norm_num [kindIIIExponent, kindIExponent]

example (ψp N : U →* A) :
    IsKindIII ψp N 3 2 ↔ ∀ u, ψp u = (N u ^ (2 : ℕ))⁻¹ := by
  sorry

-- Changing the weight condition in kind (iii) gives a wrong definition.
example (ψp N : U →* A) : ¬ IsKindIII ψp N 3 4 := by
  simp [IsKindIII]

/-- The odd-primary square-root step of KW Lemma 7.10, before global character extension. -/
theorem exists_sq_mul_eq_of_pPower (p n : ℕ) (hp : Odd p) (ψ ψ' : U →* A)
    (h : (ψ' / ψ) ^ (p ^ n) = 1) :
    ∃ χ : U →* A, χ ^ 2 * ψ = ψ' ∧ χ ^ (p ^ n) = 1 := by
  sorry

end KW

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
