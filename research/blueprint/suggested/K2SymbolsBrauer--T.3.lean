/-
This file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/K2SymbolsBrauer--T.3.md` is definitive. These
statements suggest Lean forms so that contributors and reviewers can converge on
names and signatures. They claim no implementation.

BP-K2SymbolsBrauer--T.3: partial prototype, implementationStatus = unchecked.
Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. Not compiled.

One convention is fixed here and differs from the K-book's: the tame symbol is
`(-1)^(v f * v g)` times the residue of `f ^ v g / g ^ v f`, so that
`∂ u π = residue u` and `∂ π u = (residue u)⁻¹`. The K-book's symbol is the
inverse of this one. Every comparison states the inversion.

Objects other roadmaps own are `variable`s: `K₂` and Milnor K-theory (the
companion T.1 part), the localisation sequence (SchemeKTheoryOperations S.3,
EllipticKTheory E.3), the norm-residue map (MotivicEtaleKTheory M.3), and the
local invariant and Hilbert reciprocity (ClassFieldTheory).
-/
import Mathlib.Algebra.Group.Units.Defs
import Mathlib.Algebra.TrivSqZeroExt.Basic
import Mathlib.AlgebraicGeometry.OrderOfVanishing
import Mathlib.Data.ZMod.Defs
import Mathlib.RingTheory.DedekindDomain.Factorization
import Mathlib.RingTheory.DiscreteValuationRing.Basic
import Mathlib.RingTheory.Ideal.Norm.RelNorm
import Mathlib.RingTheory.Norm.Defs
import Mathlib.RingTheory.Norm.Transitivity
import Mathlib.RingTheory.RamificationInertia.Basic
import Mathlib.RingTheory.Valuation.ValuationSubring

noncomputable section

namespace TauCeti.TameSymbol

variable {F : Type*} [Field F] (v : Valuation F ℤₘ₀)

/-- The companion part owns `K₂` and Milnor K-theory; they appear here as
parameters. -/
variable (K2 : Type → Type) (MilnorK : ℕ → Type → Type)

/-- T.3/tame-symbol. The residue is taken of a unit of the valuation ring: the
unit-part decomposition is what guarantees that. -/
def tameSymbol (f g : Fˣ) : Fˣ := by sorry

/-- The two mixed pairs pin the convention. -/
@[simp] theorem tameSymbol_unit_uniformizer (u π : Fˣ) : True := by sorry

@[simp] theorem tameSymbol_uniformizer_unit (u π : Fˣ) : True := by sorry

@[simp] theorem tameSymbol_units (u w : Fˣ) : True := by sorry

/-- The K-book's symbol is the inverse of this one. -/
theorem tameSymbol_eq_inv_kbook (f g : Fˣ) : True := by sorry

/-- T.3/tame-symbol-uniformizer-independence. -/
theorem tameSymbol_uniformizer_indep : True := by sorry

/-- T.3/tame-symbol-steinberg: bilinear, and trivial on a Steinberg pair, hence a
homomorphism out of `K₂`. -/
theorem tameSymbol_mul_left (f f' g : Fˣ) :
    tameSymbol v (f * f') g = tameSymbol v f g * tameSymbol v f' g := by sorry

theorem tameSymbol_steinberg (f : Fˣ) (h : (f : F) + 1 = 1) : True := by sorry

/-- T.3/ramification-formula. -/
theorem tameSymbol_ramification (e : ℕ) : True := by sorry

/-- T.3/finite-support: the symbol is trivial wherever both valuations vanish. -/
theorem tameSymbol_finite_support : True := by sorry

/-- T.3/higher-milnor-residues: Serre's construction. The relation on the
indeterminate is what makes the map kill the Steinberg elements. -/
def milnorResidue (n : ℕ) : MilnorK n F → MilnorK (n - 1) F := by sorry

def milnorSpecialisation (n : ℕ) (π : Fˣ) : MilnorK n F → MilnorK n F := by sorry

theorem milnorResidue_two : True := by sorry

theorem milnorResidue_surjective (n : ℕ) : True := by sorry

/-- T.3/rigidity. -/
theorem rigidity (n q : ℕ) : True := by sorry

/-- T.3/transfer-and-norm-residue. -/
def milnorTransfer (n : ℕ) : MilnorK n F → MilnorK n F := by sorry

theorem milnorTransfer_transitive : True := by sorry

theorem milnorTransfer_residue : True := by sorry

theorem milnorTransfer_restrict : True := by sorry

/-- T.3/localization-boundary: a comparison, with the sign fixed here. The
sequence itself is owned elsewhere. -/
theorem tameSymbol_eq_localisation_boundary : True := by sorry

/-! ## T.4 -/

/-- T.4/bass-tate-sequence. The place at infinity is deliberately outside the
sum; with it the sequence is not exact. -/
theorem bassTate_exact (n : ℕ) : True := by sorry

/-- T.4/milnor-transfer-transitivity. -/
theorem transfer_of_simple_extension : True := by sorry

/-- T.4/weil-reciprocity. -/
theorem weil_reciprocity : True := by sorry

/-- T.4/valuation-comparison: pinned on affine charts, glued here. -/
theorem ord_eq_place_ord : True := by sorry

/-! ## T.5 -/

/-- T.5/unramified-subgroup: defined before, and independently of, any
localisation theorem. -/
def unramifiedSubgroup : Set (K2 F) := by sorry

theorem mem_unramified_iff (x : K2 F) : True := by sorry

/-- T.5/tame-kernel-sequence: stated here, proved by ArithmeticKTheory N.2. -/
theorem tameKernel_exact : True := by sorry

/-! ## T.6 -/

variable (R : Type*) [CommRing R]

/-- T.6/dennis-stein-symbol, in the modern convention. -/
def dennisStein (r s : R) (h : IsUnit (1 - r * s)) : K2 R := by sorry

theorem dennisStein_symm (r s : R) : True := by sorry

theorem dennisStein_add (r s t : R) : True := by sorry

theorem dennisStein_mul (r s t : R) : True := by sorry

theorem dennisStein_eq_steinberg (r : Rˣ) (s : R) : True := by sorry

/-- T.6/dennis-stein-presentation: for a commutative local ring or a field only. -/
theorem dennisStein_presentation [IsLocalRing R] : True := by sorry

/-- T.6/relative-square-zero: the product term drops out. -/
theorem dennisStein_sqZero : True := by sorry

/-! ## T.7 -/

/-- T.7/symbol-formula: stated here; the map is MotivicEtaleKTheory M.3's. The
twice-twisted coefficient module is missing from both pinned libraries. -/
theorem normResidue_symbol_formula : True := by sorry

/-- T.7/classical-local-symbols. -/
def hilbertSymbol (r s : Fˣ) : ZMod 2 := by sorry

theorem hilbertSymbol_steinberg (r : Fˣ) : True := by sorry

def normResidueSymbol (m : ℕ) (r s : Fˣ) : Fˣ := by sorry

theorem normResidueSymbol_steinberg (m : ℕ) (r : Fˣ) : True := by sorry

theorem moore_theorem : True := by sorry

/-- T.7/comparison-and-reciprocity: the change-of-root rule is this layer's own. -/
theorem change_of_root : True := by sorry

/-- T.5/k2-of-a-finite-field: `K₂(F_q) = 1`, by Matsumoto's presentation and the
counting argument on non-squares. -/
theorem k2_finiteField_trivial (q : ℕ) : True := by sorry

/-- T.5/k2-of-the-integers-and-of-the-rationals: the sign symbol on `ℝ`, the
non-triviality of `{-1,-1}`, Milnor's order-two computation (imported), and the split
sequence for `ℚ`. -/
def signSymbol (r s : ℝˣ) : ZMod 2 := by sorry

theorem signSymbol_steinberg (r : ℝˣ) : True := by sorry

theorem k2_integers_order_two : True := by sorry

theorem k2_rationals_split : True := by sorry

/-- T.5/certified-presentation: generators, relations, generation, completeness. An
upper bound with a surjection is NOT an isomorphism. -/
structure CertifiedPresentation where
  dummy : Unit

theorem certifiedPresentation_not_iso_of_surjective : True := by sorry

/-- T.7/twisted-roots-of-unity: `μ_m^{⊗n}` as a Galois module, the trivialisation
attached to a CHOICE of primitive root, and the change-of-root rule. Neither pinned
library has the twisted module. -/
def rootsOfUnityModule (m : ℕ) : Type := by sorry

def twist (m : ℕ) (n : ℤ) : Type := by sorry

theorem twist_zero (m : ℕ) : True := by sorry

theorem trivialisation_change_of_root (m : ℕ) (n : ℤ) : True := by sorry

theorem cup_mem_twist_two : True := by sorry

/-- T.7/etale-chern-class-and-what-is-imported: stated with its owners, used nowhere
as an unconditional input. -/
theorem etale_chern_class_agreement : True := by sorry

theorem tate_comparison_local_global : True := by sorry

end TauCeti.TameSymbol
