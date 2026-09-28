/-
This file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/GeneralAlgebraicKTheory--K.1.md` is definitive. These
statements suggest Lean forms so that contributors and reviewers can converge on
names and signatures. They claim no implementation.

BP-GeneralAlgebraicKTheory--K.1: partial prototype, implementationStatus = unchecked.
Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. Not compiled.

Conventions fixed here.

* The exact-category input is Tau Ceti's `TauCeti.ExactStructure`, which is built
  and sorry-free. Nothing in this file re-defines it.
* Indexing: `KGroup n = π_{n+1} |N (Q A)|`, so `KGroup 0` is the fundamental
  group and the comparison with `TauCeti.ExactK0` is a statement about degree
  zero. The same shift is used for Waldhausen categories:
  `WKGroup n = π_{n+1} |wS. C|`.
* The loop representing `[A]` in `π₁` is `0 ↣ A ↠ 0` — the edge from `0` to `A`
  followed by the edge `0 ↞ A` traversed backwards. Every later comparison uses
  that orientation.
* Saturation, the extension axiom and the cylinder axiom are NOT fields of
  `WaldhausenCategory`. They are separate structures, so that each theorem names
  the ones it uses.

Spaces, spectra and the plus construction are `variable`s: Mathlib has the nerve,
the realisation and homotopy groups, but no K-theory space, no `BGL(A)⁺` and no
spectra. `K₁`, `K₂` and `K₃` do not exist in either library; the low-degree
section states its results against parameters and names their owners.
-/
import Mathlib.Algebra.Algebra.Unitization
import Mathlib.Algebra.Category.ModuleCat.ChangeOfRings
import Mathlib.Algebra.Module.Projective
import Mathlib.AlgebraicTopology.SimplicialSet.Nerve
import Mathlib.AlgebraicTopology.SingularSet
import Mathlib.CategoryTheory.Abelian.SerreClass.Basic
import Mathlib.CategoryTheory.Core
import Mathlib.CategoryTheory.Idempotents.Karoubi
import Mathlib.CategoryTheory.Limits.Filtered
import Mathlib.RingTheory.Finiteness.Projective
import Mathlib.RingTheory.TensorProduct.Finite
import Mathlib.Topology.Homotopy.HomotopyGroup

noncomputable section

namespace TauCeti.HigherK

open CategoryTheory

variable {C : Type*} [Category C]

/-! ## K.1 — the Q-construction -/

/-- K.1/exact-categories-and-Q-construction. Objects are those of `C`; a morphism
is an equivalence class of spans with a deflation on the left and an inflation on
the right, composed by pullback. The exact structure is Tau Ceti's. -/
def QCat (E : ExactStructure C) : Type _ := by sorry

instance (E : ExactStructure C) : Category (QCat E) := by sorry

/-- A morphism is an admissible subobject of the target with a deflation onto the
source. -/
theorem QCat.hom_equiv_subobject (E : ExactStructure C) : True := by sorry

def QCat.inflation (E : ExactStructure C) : True := by sorry

def QCat.deflation (E : ExactStructure C) : True := by sorry

/-- Every morphism is a deflation followed by an inflation, uniquely up to
isomorphism. This is what makes the universal property work. -/
theorem QCat.factor (E : ExactStructure C) : True := by sorry

@[simp] theorem QCat.hom_zero (E : ExactStructure C) : True := by sorry

theorem QCat.isoQ_equiv_iso (E : ExactStructure C) : True := by sorry

theorem QCat.op (E : ExactStructure C) : True := by sorry

/-- K.1/Q-construction-universal-property. A functor out of `Q(A)` is determined
by values on inflations and deflations, subject to the bicartesian condition.
The condition is NOT decorative: without it the assignment is not functorial on
composites. -/
def QCat.lift (E : ExactStructure C) : True := by sorry

theorem QCat.lift_unique (E : ExactStructure C) : True := by sorry

/-- An exact functor induces a functor of `Q`-categories. -/
def QCat.map : True := by sorry

/-! ### The K-theory space and groups -/

/-- Spaces are a parameter: no K-theory space exists at the pins. -/
variable (Space : Type) (realise : SSet → Space) (piGroup : ℕ → Space → Type)

/-- K.1/K-groups-of-exact-categories. `KSpace E = |N (Q E)|`. -/
def KSpace (E : ExactStructure C) : Space := by sorry

/-- `KGroup E n = π_{n+1} (KSpace E)`. Degree zero is the fundamental group. -/
def KGroup (E : ExactStructure C) (n : ℕ) : Type := by sorry

instance (E : ExactStructure C) (n : ℕ) : AddCommGroup (KGroup E n) := by sorry

/-- K.1/pi1-BQ-equals-K0. The inverse map is built from the universal property of
`ExactK0`, NOT by comparing cardinalities — that is the stage text's rule. -/
theorem KGroup.zero_equiv_exactK0 (E : ExactStructure C) : True := by sorry

/-- The class `[A]` is the loop `0 ↣ A ↠ 0`, in that orientation. -/
theorem KGroup.class_eq_loop (E : ExactStructure C) : True := by sorry

def KGroup.map (n : ℕ) : True := by sorry

theorem KGroup.map_of_natIso (n : ℕ) : True := by sorry

/-- K.1/small-models-and-transport: independence of the small model, natural in
exact functors. Tau Ceti has `ExactStructure.transport`, `ExactK0.transportEquiv`
and `ExactK0.mapEquiv` — the degree-zero half. -/
theorem KGroup.transport (n : ℕ) : True := by sorry

theorem KGroup.basepoint_irrelevant : True := by sorry

/-- K.1/elementary-properties-of-K-groups. -/
theorem KGroup.op (n : ℕ) : True := by sorry

theorem KGroup.prod (n : ℕ) : True := by sorry

theorem KGroup.filteredColimit (n : ℕ) : True := by sorry

theorem KSpace.hSpace : True := by sorry

/-! ## K.2:plus — rings and the plus comparison -/

variable (A B : Type*) [Ring A] [Ring B]

/-- K.2:plus/scalar-extension-and-functoriality. Exact with NO flatness
hypothesis: the structure on `Proj_fg` is split, and every additive functor is
exact for split structures (`ExactStructure.isConflationExact_split`). -/
def projBaseChange (f : A →+* B) : True := by sorry

theorem projBaseChange_exact (f : A →+* B) : True := by sorry

theorem projBaseChange_comp : True := by sorry

/-- On ALL finitely generated modules, exactness does need flatness. -/
theorem moduleBaseChange_needs_flat : True := by sorry

/-- K.2:plus/extension-category-and-the-fibration. Objects are the admissible
exact sequences. `S₂` of the S-construction is the same category. -/
def ExtCat (E : ExactStructure C) : Type _ := by sorry

def ExtCat.sub (E : ExactStructure C) : True := by sorry
def ExtCat.total (E : ExactStructure C) : True := by sorry
def ExtCat.quot (E : ExactStructure C) : True := by sorry

theorem ExtCat.fibre_zero (E : ExactStructure C) : True := by sorry

theorem ExtCat.contractible (E : ExactStructure C) : True := by sorry

/-- Split exactness is a hypothesis, not a convenience: for a category with a
non-split exact sequence the comparison category is not even connected. -/
theorem ExtCat.split_needed : True := by sorry

/-- K.2:plus/plus-equals-Q. `BGL(A)⁺` is a parameter: it does not exist at the
pins, and `StableHomotopyKTheory:H.4` owns it. -/
variable (BGLplus : Type* → Space)

theorem plus_eq_Q : True := by sorry

theorem plus_eq_Q_ring : True := by sorry

/-- K.2:plus/cofinality-of-projective-modules. Mathlib has the module-theoretic
half (`Module.Finite.exists_comp_eq_id_of_projective`); the K-theoretic
consequence holds in POSITIVE degrees only. -/
theorem free_cofinal_in_proj : True := by sorry

theorem KGroup.free_eq_proj_of_pos (n : ℕ) (hn : 0 < n) : True := by sorry

theorem K0_free_ne_proj : True := by sorry

/-! ## K.2 — the aggregate, and what it does not say -/

theorem KGroup.ofRing_prod (n : ℕ) : True := by sorry

theorem KGroup.ofRing_colimit (n : ℕ) : True := by sorry

theorem plusComparison_natural : True := by sorry

/-- K.2/no-natural-product-splitting. The product description is of SPACES after
a choice of component representatives. It is not a splitting of infinite-loop
spaces, and the translations between components are not natural. -/
theorem product_description_not_infinite_loop : True := by sorry

/-! ## K.2:low-degree-comparisons — a register -/

/-- The three low-degree groups are parameters: none exists at the pins, and each
is owned elsewhere (`KTheoryLowDegrees:U.6`, `K2SymbolsBrauer:T.1:plus`,
`K3BlochGroups:V.4`). -/
variable (K1 K2 K3 : Type* → Type)

theorem K1_eq_GL_mod_E : True := by sorry

theorem K2_eq_H2_E : True := by sorry

theorem K3_suslin_sequence : True := by sorry

/-- Matsumoto's presentation is a theorem about FIELDS. The other three
identifications are unconditional for their stated ring class; this one is not,
and quoting it for a general ring is the error this statement exists to block. -/
theorem matsumoto_field_only : True := by sorry

theorem symbol_map_not_iso_for_general_ring : True := by sorry

/-! ## K.3 — the fundamental theorems -/

/-- K.3/additivity-for-exact-categories. Holds for exact and for Waldhausen
categories; the source states both at once. -/
theorem additivity : True := by sorry

theorem additivity_filtration : True := by sorry

theorem additivity_alternating : True := by sorry

/-- Flasque categories have contractible K-theory, by additivity. -/
theorem flasque_contractible : True := by sorry

/-- K.3/resolution-theorem. Tau Ceti's `ExactStructure.resolutionEquiv` is the
degree-zero case under the STRONGER hypothesis that every resolving object is
projective. -/
theorem resolution : True := by sorry

theorem K_eq_G_of_regular : True := by sorry

/-- K.3/transfer-maps-and-projection-formula. The hypothesis is finite projective
dimension with FINITELY GENERATED resolving projectives. -/
def transfer (n : ℕ) : True := by sorry

theorem transfer_comp : True := by sorry

theorem projection_formula : True := by sorry

/-- The source's own test: the transfer along `R[s] → R`, `s ↦ 0`, vanishes. -/
theorem transfer_eval_zero : True := by sorry

/-- K.3/devissage-theorem. The subquotient functors need NOT be exact, which is
why additivity for filtrations does not prove this. -/
theorem devissage : True := by sorry

theorem devissage_finite_length : True := by sorry

theorem G_of_nilpotent_ideal : True := by sorry

/-- The Waldhausen analogue is an OPEN PROBLEM in the source; nothing of the kind
may be asserted. -/
theorem devissage_waldhausen_open : True := by sorry

/-- K.3/abelian-localization-theorem. For a Serre subcategory of an ABELIAN
category. Mathlib has `ObjectProperty.IsSerreClass`; the sequence is absent. -/
theorem abelian_localization : True := by sorry

/-- The boundary sends `[α]` to `[coker α] − [ker α]`. The sign is fixed here and
every comparison with tame symbols uses it. -/
theorem localization_boundary : True := by sorry

/-- K.3/cofinality-degree-zero-correction. Positive degrees agree; `K₀` need not.
The idempotent completion is the witness. -/
theorem cofinality : True := by sorry

theorem cofinality_karoubi_changes_K0 : True := by sorry

/-! ## K.4:construction — Waldhausen categories and `S₀` -/

/-- K.4:construction/waldhausen-categories. Cofibrations: (W0) isomorphisms,
(W1) `0 ↣ A`, (W2) pushouts along cofibrations. -/
structure CategoryWithCofibrations (C : Type*) [Category C] where
  cofibrations : Unit
  iso_cofib : Unit
  zero_cofib : Unit
  pushout : Unit

/-- Plus weak equivalences and the GLUEING axiom. Saturation, extension and the
cylinder axiom are deliberately NOT fields. -/
structure WaldhausenCategory (C : Type*) [Category C] extends CategoryWithCofibrations C where
  weakEquivalences : Unit
  glueing : Unit

structure WaldhausenCategory.IsSaturated {C : Type*} [Category C] (W : WaldhausenCategory C) : Prop where
  dummy : Unit

structure WaldhausenCategory.HasExtensionAxiom {C : Type*} [Category C] (W : WaldhausenCategory C) : Prop where
  dummy : Unit

structure WaldhausenCategory.CylinderFunctor {C : Type*} [Category C] (W : WaldhausenCategory C) where
  dummy : Unit

def WaldhausenCategory.K0 {C : Type*} [Category C] (W : WaldhausenCategory C) : Type _ := by sorry

def WaldhausenCategory.ofExact (E : ExactStructure C) : WaldhausenCategory C := by sorry

/-- `K₀` of the UNBOUNDED complexes vanishes by the swindle; boundedness is not
decorative. -/
theorem K0_unbounded_complexes_eq_zero : True := by sorry

/-- K.4:construction/S-construction. Objects: sequences of `n` cofibrations with
compatible chosen subquotients. -/
def SConstruction {C : Type*} [Category C] (W : WaldhausenCategory C) (n : ℕ) : Type _ := by sorry

/-- THE TRAP: cofibrations of `SₙC` are given by a latching condition, not
objectwise. -/
theorem SConstruction.cofibration_iff : True := by sorry

theorem SConstruction.cofibration_not_objectwise : True := by sorry

def SConstruction.face : True := by sorry
def SConstruction.degeneracy : True := by sorry
theorem SConstruction.simplicial : True := by sorry

/-- `S₂C` is the extension category, and its three faces are `q`, `t`, `s`. -/
theorem SConstruction.two_eq_ext : True := by sorry

/-- K.4:construction/K-theory-space-of-a-waldhausen-category.
`K(C) = Ω |wS. C|`, so `π₁ |wS. C| = K₀(C)` fixes the indexing. -/
def WaldhausenCategory.KSpace {C : Type*} [Category C] (W : WaldhausenCategory C) : Space := by sorry

def WaldhausenCategory.KGroup {C : Type*} [Category C] (W : WaldhausenCategory C) (n : ℕ) : Type := by sorry

theorem WaldhausenCategory.pi1_eq_K0 : True := by sorry

theorem WaldhausenCategory.infiniteLoop : True := by sorry

/-- The canonical map `B(wC) → K(C)` is a group completion, NOT an equivalence. -/
theorem WaldhausenCategory.not_equiv_of_wC : True := by sorry

/-- K.4:construction/iS-versus-Q. -/
theorem iS_eq_Q : True := by sorry

/-! ## K.4 — the theorems -/

theorem waldhausen_additivity : True := by sorry

/-- Under the cylinder axiom the cone is null-homotopic and `Σ = −1`. -/
theorem suspension_eq_neg_one : True := by sorry

/-- K.4/delooping-and-the-spectrum. -/
theorem relative_S_fibration : True := by sorry

theorem delooping : True := by sorry

/-- The FIRST structure map is a group completion, not an equivalence. -/
theorem first_map_not_equivalence : True := by sorry

/-- `π₁ |wS.S.f|` is the cokernel of `K₀(B) → K₀(C)` — the first negative group,
and the reason K.6 exists. -/
theorem relative_pi1_eq_coker : True := by sorry

/-- K.4/fibration-theorem. All four hypotheses are named; none may be dropped. -/
theorem waldhausen_fibration : True := by sorry

theorem localization_of_central_set : True := by sorry

/-- `K₀(R) → K₀(S⁻¹R)` is not onto: the connective sequence stops here. -/
theorem K0_localization_not_onto : True := by sorry

/-- K.4/approximation-theorem. -/
theorem approximation : True := by sorry

/-- The cylinder hypothesis is necessary; the source gives the counterexample. -/
theorem approximation_fails_without_cylinder : True := by sorry

theorem K_eq_perfect_complexes : True := by sorry

/-- K.4/gillet-waldhausen. Weak equivalences are QUASI-ISOMORPHISMS computed in
the ambient abelian category — not chain homotopy equivalences. -/
theorem gillet_waldhausen : True := by sorry

theorem gillet_waldhausen_without_closure : True := by sorry

theorem quasi_iso_ne_homotopy_equiv : True := by sorry

/-! ## K.5 — relative and nonunital theories -/

/-- K.5/relative-K-theory. Every relative group, `K₀(f)` included, is abelian —
by the functorial H-space structure, which must be carried. -/
def relativeK (f : A →+* B) : Space := by sorry

def relativeK.group (f : A →+* B) (n : ℕ) : Type := by sorry

instance (f : A →+* B) (n : ℕ) : AddCommGroup (relativeK.group A B f n) := by sorry

theorem relativeK.les (f : A →+* B) : True := by sorry

theorem relativeK.ofPair : True := by sorry

/-- K.5/relative-versus-support. `K(R on S)` is a Waldhausen K-theory, not a
homotopy fibre, and the two are not interchangeable. -/
def supportK : Space := by sorry

theorem supportK_fibration : True := by sorry

theorem supportK_not_fibre_with_zero_divisors : True := by sorry

/-- K.5/nonunital-rings-and-unitisation. `Unitization ℤ I` is Mathlib's, with its
universal property; nothing K-theoretic is built on it at the pins. -/
def nonunitalK : Space := by sorry

theorem nonunitalK.of_unital : True := by sorry

def nonunitalK.compare : True := by sorry

/-- K.5/excision-and-its-failure. Always true for `K₀`. -/
theorem excision_K0 : True := by sorry

/-- For `K₁`: excision ⟺ `I = I²`. -/
theorem excision_K1_iff_idempotent : True := by sorry

/-- THE COUNTEREXAMPLE the stage text asks for: a square-zero ring fails excision
for `K₁`. -/
theorem excision_fails_for_sqZero : True := by sorry

theorem excision_of_hUnital : True := by sorry

end TauCeti.HigherK
