/-
This file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/K2SymbolsBrauer--T.1.md` is definitive. These
statements suggest Lean forms so that contributors and reviewers can converge on
names and signatures. They claim no implementation.

BP-K2SymbolsBrauer--T.1: partial prototype, implementationStatus = unchecked.
Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.
No Lean toolchain at those commits was available in this session, so elaboration
has not been established.

A warning the reviewed audit makes and this file respects: every Tau Ceti
declaration whose name contains "Steinberg" is a Frobenius or graph-twisted
endomorphism of a group of Lie type, the Steinberg representation of GL₂ over a
finite field, or the quaternion Steinberg relation. None of them is the group
below, and none is reused here.

Objects another roadmap owns appear as `variable`s: the K-theory space and the
plus construction (GeneralAlgebraicKTheory K.2, StableHomotopyKTheory H.3), and
the indecomposable K₃ (K3BlochGroups V.2).
-/
import Mathlib.Algebra.Group.Commutator
import Mathlib.Algebra.Group.Subgroup.Basic
import Mathlib.Algebra.Group.Units.Defs
import Mathlib.Algebra.RingQuot
import Mathlib.Data.ZMod.Defs
import Mathlib.GroupTheory.GroupExtension.Defs
import Mathlib.GroupTheory.IsPerfect
import Mathlib.GroupTheory.PresentedGroup
import Mathlib.GroupTheory.Subgroup.Center
import Mathlib.LinearAlgebra.Matrix.GeneralLinearGroup.Defs
import Mathlib.LinearAlgebra.Matrix.SpecialLinearGroup
import Mathlib.LinearAlgebra.TensorAlgebra.Basic
import Mathlib.RepresentationTheory.Homological.GroupHomology.LowDegree
import Mathlib.Topology.Homotopy.HomotopyGroup

noncomputable section

namespace TauCeti.Steinberg

/-! ## T.1:classical The Steinberg group -/

variable (R : Type*) [Ring R] (n : ℕ)

/-- The generators `x_ij(r)`, indexed by a pair of distinct indices and a ring
element. The distinctness is data, not a side condition to be forgotten. -/
structure Gen (n : ℕ) (R : Type*) where
  i : Fin n
  j : Fin n
  hij : i ≠ j
  val : R

/-- The Steinberg relations, as words in the free group on the generators. -/
def relations (n : ℕ) (R : Type*) [Ring R] : Set (FreeGroup (Gen n R)) := by sorry

/-- T.1/steinberg-group-finite-rank: `St_n(R)` for `n ≥ 3`. No definition is
given for `n = 2`. -/
def Steinberg (n : ℕ) (hn : 3 ≤ n) (R : Type*) [Ring R] : Type :=
  PresentedGroup (relations n R)

instance (hn : 3 ≤ n) : Group (Steinberg n hn R) := by sorry

def x (hn : 3 ≤ n) {i j : Fin n} (hij : i ≠ j) (r : R) : Steinberg n hn R := by sorry

@[simp] theorem x_zero (hn : 3 ≤ n) {i j : Fin n} (hij : i ≠ j) :
    x R n hn hij 0 = 1 := by sorry

theorem x_add (hn : 3 ≤ n) {i j : Fin n} (hij : i ≠ j) (r s : R) :
    x R n hn hij r * x R n hn hij s = x R n hn hij (r + s) := by sorry

/-- The first commutator relation: disjoint indices commute. -/
theorem commutator_disjoint (hn : 3 ≤ n) {i j k l : Fin n} (hij : i ≠ j) (hkl : k ≠ l)
    (hjk : j ≠ k) (hil : i ≠ l) (r s : R) :
    ⁅x R n hn hij r, x R n hn hkl s⁆ = 1 := by sorry

/-- T.1/elementary-matrices-satisfy: the surjection onto the elementary group. -/
def toElementary (hn : 3 ≤ n) : Steinberg n hn R →* Matrix.GeneralLinearGroup (Fin n) R := by
  sorry

/-- T.1/stabilisation: the stable Steinberg group. -/
def StableSteinberg (R : Type*) [Ring R] : Type := by sorry

instance : Group (StableSteinberg R) := by sorry

def phi : StableSteinberg R →* StableSteinberg R := by sorry

theorem phi_surjective : Function.Surjective (phi R) := by sorry

/-- T.1/k2-definition: classical `K₂`. -/
def K2 (R : Type*) [Ring R] : Subgroup (StableSteinberg R) := (phi R).ker

/-- T.1/k2-is-centre: Steinberg's theorem. -/
theorem K2_eq_center : K2 R = Subgroup.center (StableSteinberg R) := by sorry

instance : CommGroup (K2 R) := by sorry

/-! ### Universal central extensions -/

variable {G X : Type*} [Group G] [Group X]

/-- T.1/central-extension: the centrality predicate the pinned `GroupExtension`
does not carry. -/
def IsCentral (f : X →* G) : Prop := f.ker ≤ Subgroup.center X

/-- T.1/universal-central-extension. -/
def IsUniversalCentralExtension (f : X →* G) : Prop := by sorry

/-- T.1/uce-perfect: both groups are perfect. -/
theorem uce_isPerfect {f : X →* G} (h : IsUniversalCentralExtension f) :
    Group.IsPerfect X ∧ Group.IsPerfect G := by sorry

/-- At most one homomorphism over `G` out of a perfect central extension. -/
theorem uce_hom_unique (hX : Group.IsPerfect X) : True := by sorry

/-- T.1/hopf-formula. -/
theorem hopf_formula : True := by sorry

/-- T.1/recognition-theorem: a central extension is universal exactly when its
first and second homology vanish. -/
theorem recognition {f : X →* G} (hG : Group.IsPerfect G) (hf : IsCentral f) :
    IsUniversalCentralExtension f ↔ True := by sorry

/-- T.1/steinberg-is-uce. -/
theorem steinberg_isUniversal : IsUniversalCentralExtension (phi R) := by sorry

/-- T.1/finite-rank-splitting: for `n ≥ 5`. -/
theorem finite_rank_split (hn : 5 ≤ n) : True := by sorry

/-! ## T.1:plus -/

/-- T.1/k2-h2-elementary: `K₂(R) ≃ H₂(E(R), ℤ)`. -/
def k2EquivH2 : K2 R ≃* K2 R := by sorry

/-- T.1/k2-pi2: and with the second homotopy group of the K-theory space. -/
theorem k2_eq_pi2 : True := by sorry

/-! ## T.2:symbols -/

section Symbols

variable {F : Type*} [Field F]

/-- T.2/star-product: the commutator of lifts of two commuting matrices. -/
def starProduct (A B : Matrix.GeneralLinearGroup (Fin 3) F) (h : A * B = B * A) :
    K2 F := by sorry

/-- The words `w_ij(r)` and `h_ij(r)`. -/
def w (r : Fˣ) : StableSteinberg F := by sorry

def h (r : Fˣ) : StableSteinberg F := by sorry

/-- T.2/steinberg-symbol. -/
def symbol (r s : Fˣ) : K2 F := by sorry

@[simp] theorem symbol_one_left (s : Fˣ) : symbol (1 : Fˣ) s = 1 := by sorry

theorem symbol_mul_left (r r' s : Fˣ) : symbol (r * r') s = symbol r s * symbol r' s := by sorry

/-- T.2/steinberg-identity. -/
theorem symbol_one_sub (r : Fˣ) (h : (1 : F) - r ≠ 0) : True := by sorry

theorem symbol_neg_self (r : Fˣ) : symbol r (-r) = 1 := by sorry

/-- T.2/symbol-consequences: skew-symmetry, and the value of `{a,a}`, which is
`{a,-1}` and is **not** trivial in general. -/
theorem symbol_skew (r s : Fˣ) : symbol r s * symbol s r = 1 := by sorry

theorem symbol_self (r : Fˣ) : symbol r r = symbol r (-1) := by sorry

/-- T.2/matsumoto: the presentation. -/
theorem matsumoto : True := by sorry

/-- T.2/k2-finite-field. -/
theorem k2_finiteField (F : Type*) [Field F] [Fintype F] : Nonempty (K2 F ≃ Unit) := by sorry

end Symbols

/-! ### Milnor K-theory -/

section MilnorK

variable (F : Type*) [Field F]

/-- The homogeneous Steinberg relation inside the tensor algebra. -/
def steinbergRel : TensorAlgebra ℤ (Additive Fˣ) → TensorAlgebra ℤ (Additive Fˣ) → Prop := by
  sorry

/-- T.2/milnor-k-theory: the graded ring. -/
def MilnorK : Type := RingQuot (steinbergRel F)

instance : Ring (MilnorK F) := by sorry

/-- The degree-`n` part. -/
def MilnorK.grade (n : ℕ) : Type := by sorry

/-- The symbol of an `n`-tuple. -/
def MilnorK.symbol {n : ℕ} (x : Fin n → Fˣ) : MilnorK.grade F n := by sorry

theorem MilnorK.symbol_steinberg {n : ℕ} (x : Fin n → Fˣ) (i : Fin n) : True := by sorry

/-- T.2/milnor-alternating. -/
theorem MilnorK.symbol_alternating {n : ℕ} (x : Fin n → Fˣ) (sigma : Equiv.Perm (Fin n)) :
    True := by sorry

/-- T.2/milnor-examples: a finite field has no higher Milnor K-theory. -/
theorem MilnorK.finiteField [Fintype F] (n : ℕ) (hn : 2 ≤ n) : True := by sorry

/- The higher tame symbols and the specialisation maps are **not** in this part:
the roadmap assigns higher Milnor residues, specialisation with a uniformiser and
their product signs to `T.3:localization-comparison`, whose packet owns them. -/

/-- T.2/graded-map: to Quillen K-theory. Its degree-two part is Matsumoto's
isomorphism; no isomorphism is asserted in higher degree. -/
def milnorToQuillen (n : ℕ) : MilnorK.grade F n → MilnorK.grade F n := by sorry

theorem milnorToQuillen_two_bijective : True := by sorry

theorem milnorToQuillen_three_not_bijective : True := by sorry

end MilnorK

end TauCeti.Steinberg
