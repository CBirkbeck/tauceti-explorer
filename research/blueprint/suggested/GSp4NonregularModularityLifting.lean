import Mathlib.Algebra.Field.ZMod
import Mathlib.LinearAlgebra.Eigenspace.Basic
import Mathlib.Algebra.Group.Idempotent
import Mathlib.Tactic.NormNum

/-!
# Nonregular GSp₄ modularity lifting: representative target signatures

The mathematical roadmap is `../readmes/GSp4NonregularModularityLifting.md`.
This file records light definitions and theorem signatures statable against the
pinned Mathlib APIs. It is not exhaustive. The geometric lifting theorems and their
hypotheses are stated in the roadmap; their carriers require the named suppliers.

The root predicate retains all four factors. The singular root submodule is an
intersection of generalized eigenspaces, rather than a union or an intersection
of simple eigenspaces. The regular-weight predicate keeps the order of the two
Hodge–Tate weights and both walls of the Weyl chamber.
-/

namespace TauCetiRoadmap.GSp4NonregularModularityLifting

set_option autoImplicit false

local instance : Fact (Nat.Prime 11) := ⟨by decide⟩

/-! ## Layer NR0: residual ordinary roots -/

/-- The four exclusions in Calegari–Geraghty, Theorem 1.1(2), published p.802.
Arithmetic applications separately require the two roots to be units. -/
def NondegenerateOrdinaryRoots {k : Type*} [CommRing k] (α β : k) : Prop :=
  (α ^ 2 - 1) * (β ^ 2 - 1) * (α - β) * (α ^ 2 * β ^ 2 - 1) ≠ 0

/-- Over a field the product condition exposes exactly its four factors. -/
theorem nondegenerateOrdinaryRoots_iff {k : Type*} [Field k] (α β : k) :
    NondegenerateOrdinaryRoots α β ↔
      α ^ 2 ≠ 1 ∧ β ^ 2 ≠ 1 ∧ α ≠ β ∧ α ^ 2 * β ^ 2 ≠ 1 := by
  sorry

/-- The root condition is symmetric, although the arithmetic root labels remain ordered. -/
theorem nondegenerateOrdinaryRoots_swap {k : Type*} [Field k] (α β : k) :
    NondegenerateOrdinaryRoots α β ↔ NondegenerateOrdinaryRoots β α := by
  sorry

/-- Extension of the residual coefficient field preserves and reflects all exclusions. -/
theorem nondegenerateOrdinaryRoots_map {k K : Type*} [Field k] [Field K]
    (f : k →+* K) (α β : k) :
    NondegenerateOrdinaryRoots (f α) (f β) ↔ NondegenerateOrdinaryRoots α β := by
  sorry

-- A computed admissible pair and the reciprocal-pair negative control.
example : NondegenerateOrdinaryRoots (2 : ZMod 11) 3 := by
  sorry

example : ¬ NondegenerateOrdinaryRoots (2 : ZMod 11) 6 := by
  sorry

/-! ## Layer NR1: the singular joint root condition -/

/-- The field-valued singular selection for the normalized operators Tₚ,₁ and Qₚ,₂.
This specializes Mathlib's existing generalized eigenspaces to roots α+β and αβ.
The integral factorial projectors and their construction are supplier results. -/
def singularRootSubmodule {k V : Type*} [Field k] [AddCommGroup V] [Module k V]
    (T Q : Module.End k V) (α β : k) : Submodule k V :=
  T.genEigenspace (α + β) ⊤ ⊓ Q.genEigenspace (α * β) ⊤

/-- Both generalized root equations are necessary, possibly with different exponents. -/
theorem singularRootSubmodule_mem {k V : Type*} [Field k] [AddCommGroup V] [Module k V]
    (T Q : Module.End k V) (α β : k) (v : V) :
    v ∈ singularRootSubmodule T Q α β ↔
      (∃ n : ℕ, ((T - (α + β) • 1) ^ n) v = 0) ∧
      (∃ m : ℕ, ((Q - (α * β) • 1) ^ m) v = 0) := by
  sorry

/-- Exchanging the ordinary root labels preserves the singular joint selection. -/
theorem singularRootSubmodule_swap {k V : Type*} [Field k] [AddCommGroup V] [Module k V]
    (T Q : Module.End k V) (α β : k) :
    singularRootSubmodule T Q α β = singularRootSubmodule T Q β α := by
  sorry

-- Both scalar root equations hold, so the selected space is the whole module.
example : singularRootSubmodule (k := ZMod 11) (V := ZMod 11) ((5 : ZMod 11) • (1 : Module.End (ZMod 11) (ZMod 11)))
    ((6 : ZMod 11) • (1 : Module.End (ZMod 11) (ZMod 11))) 2 3 = ⊤ := by
  sorry

-- Satisfying only the first root equation gives zero, not the whole module.
example : singularRootSubmodule (k := ZMod 11) (V := ZMod 11) ((5 : ZMod 11) • (1 : Module.End (ZMod 11) (ZMod 11)))
    ((7 : ZMod 11) • (1 : Module.End (ZMod 11) (ZMod 11))) 2 3 = ⊥ := by
  sorry

/-! ## Layer NR11: regular classical weights -/

/-- Both numerical walls of BCGP25, Definition 7.5.7, arXiv v1 p.176.
The parameter is positive; the existence of algebraic torus characters is separate. -/
def RRegularWeight (R : ℕ) (h₁ h₂ : ℤ) : Prop :=
  1 ≤ R ∧ (R : ℤ) ≤ h₂ - h₁ ∧ (R : ℤ) ≤ 1 - 2 * h₂

/-- On its stated positive domain the predicate has exactly the two numerical inequalities. -/
theorem rRegularWeight_iff (R : ℕ) (hR : 1 ≤ R) (h₁ h₂ : ℤ) :
    RRegularWeight R h₁ h₂ ↔ (R : ℤ) ≤ h₂ - h₁ ∧ (R : ℤ) ≤ 1 - 2 * h₂ := by
  sorry

/-- Decreasing a positive regularity bound preserves the ordered two-wall condition. -/
theorem rRegularWeight_mono {R R' : ℕ} {h₁ h₂ : ℤ}
    (hR' : 1 ≤ R') (hle : R' ≤ R) (h : RRegularWeight R h₁ h₂) :
    RRegularWeight R' h₁ h₂ := by
  sorry

-- Equality on both walls is allowed.
example : RRegularWeight 3 (-4) (-1) := by
  norm_num [RRegularWeight]

-- A large difference alone does not suffice: the second wall fails.
example : ¬ RRegularWeight 3 0 3 := by
  norm_num [RRegularWeight]

/-!
The remaining layers require integral Siegel models and bundles, genuine Hecke
images and their projectors, Galois representations and deformation rings,
coherent homology and diamond modules, and higher-Hida/Coleman objects. Their
full definitions, APIs, examples and conditional lifting statements are in the
roadmap. No carrier for those constructions is introduced here.
-/

end TauCetiRoadmap.GSp4NonregularModularityLifting
