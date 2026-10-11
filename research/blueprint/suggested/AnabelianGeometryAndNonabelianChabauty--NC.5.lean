import Mathlib.LinearAlgebra.Isomorphisms
import Mathlib.LinearAlgebra.TensorProduct.Basic
import Mathlib.LinearAlgebra.TensorProduct.Map
import Mathlib.LinearAlgebra.Dual.Defs
import Mathlib.LinearAlgebra.Prod
import Mathlib.LinearAlgebra.FiniteDimensional.Basic
import Mathlib.LinearAlgebra.Matrix.Determinant.Basic
import Mathlib.Algebra.MvPolynomial.Eval
import Mathlib.Analysis.Analytic.Basic
import Mathlib.NumberTheory.Padics.PadicNumbers
import Mathlib.Data.Set.Finite.Basic

/-!
This file is not the roadmap and is not exhaustive. The roadmap document is definitive.
These statements suggest Lean forms so contributors and reviewers converge on names and
signatures. Proof goals are admitted; elaboration makes no implementation claim.

The native interfaces below use actual modules, quotients, tensor products, matrices,
polynomials and p-adic analytic functions. They do not construct a geometric Picard group,
unipotent path torsor, mixed Galois extension, period functor or p-adic height. The exact
geometric statements and missing signatures are recorded individually below and in the
packet. No missing condition is represented by an opaque proposition or a structure whose
fields assume the desired comparison or finiteness theorem.

The correction set is the NEGATIVE sum of away-from-p heights, for the convention
globalHeight = localHeightAtP + sumAway. A geometric Tate class must come from an actual
rational correspondence; admissibility alone does not supply such a correspondence.
-/

set_option autoImplicit false
set_option warningAsError false

namespace TauCetiRoadmap.AnabelianGeometryAndNonabelianChabauty.NC5

open scoped TensorProduct BigOperators

universe u v w

section Correspondence
variable {k : Type u} [Field k]
variable {C : Type v} [AddCommGroup C] [Module k C]
variable {N : Type w} [AddCommGroup N] [Module k N]

/-- Linear interface for symmetry modulo pullbacks, zero trace and a nonzero class. -/
def IsNiceCorrespondence (P : Submodule k C) (swap : C →ₗ[k] C)
    (trace : C →ₗ[k] k) (cl : C →ₗ[k] N) (Z : C) : Prop :=
  swap Z - Z ∈ P ∧ trace Z = 0 ∧ cl Z ≠ 0

namespace IsNiceCorrespondence
theorem nonzero (P : Submodule k C) (swap : C →ₗ[k] C)
    (trace : C →ₗ[k] k) (cl : C →ₗ[k] N) {Z : C}
    (h : IsNiceCorrespondence P swap trace cl Z) : Z ≠ 0 := by sorry

theorem smul (P : Submodule k C) (swap : C →ₗ[k] C)
    (trace : C →ₗ[k] k) (cl : C →ₗ[k] N) {Z : C}
    (h : IsNiceCorrespondence P swap trace cl Z) (a : k) (ha : a ≠ 0) :
    IsNiceCorrespondence P swap trace cl (a • Z) := by sorry

theorem add_pullback (P : Submodule k C) (swap : C →ₗ[k] C)
    (trace : C →ₗ[k] k) (cl : C →ₗ[k] N)
    (hP : ∀ z ∈ P, swap z - z ∈ P)
    (htrace : P ≤ trace.ker) (hcl : P ≤ cl.ker) {Z d : C}
    (h : IsNiceCorrespondence P swap trace cl Z) (hd : d ∈ P) :
    IsNiceCorrespondence P swap trace cl (Z + d) := by sorry
end IsNiceCorrespondence

-- IsNiceCorrespondence.geometric: omitted Pic(X × X)_Q instantiation, the pullback
-- submodule, diagonal-degree normalization and Kunneth class map. Gap G1.
-- nice_trace_criterion: omitted geometric theorem with absolutely simple Jacobian.

end Correspondence

section CorrespondenceTests
-- test: nice_nonzero_primitive
example : IsNiceCorrespondence (⊥ : Submodule ℚ (ℚ × ℚ))
    (LinearMap.id : (ℚ × ℚ) →ₗ[ℚ] ℚ × ℚ)
    (LinearMap.fst ℚ ℚ ℚ) (LinearMap.snd ℚ ℚ ℚ) (0, 1) := by sorry
-- test: nice_nonzero_trace
example : ¬ IsNiceCorrespondence (⊥ : Submodule ℚ (ℚ × ℚ))
    (LinearMap.id : (ℚ × ℚ) →ₗ[ℚ] ℚ × ℚ)
    (LinearMap.fst ℚ ℚ ℚ) (LinearMap.snd ℚ ℚ ℚ) (1, 1) := by sorry
-- test: nice_zero_class
example : ¬ IsNiceCorrespondence (⊥ : Submodule ℚ (ℚ × ℚ))
    (LinearMap.id : (ℚ × ℚ) →ₗ[ℚ] ℚ × ℚ)
    (0 : (ℚ × ℚ) →ₗ[ℚ] ℚ) (LinearMap.snd ℚ ℚ ℚ) (1, 0) := by sorry
end CorrespondenceTests

section CentralQuotient
variable {k : Type u} [Field k]
variable {T : Type v} [AddCommGroup T] [Module k T]

namespace DepthTwoHeightQuotient
/-- Central linear quotient only; the geometric central group extension is omitted. -/
abbrev central (q : T →ₗ[k] k) := T ⧸ q.ker

abbrev centralMap (q : T →ₗ[k] k) : T →ₗ[k] central q := q.ker.mkQ

noncomputable def centralEquiv (q : T →ₗ[k] k) (hq : Function.Surjective q) :
    central q ≃ₗ[k] k := q.quotKerEquivOfSurjective hq

theorem centralEquiv_apply (q : T →ₗ[k] k) (hq : Function.Surjective q) (z : T) :
    centralEquiv q hq (centralMap q z) = q z := by sorry

theorem centralMap_eq_zero (q : T →ₗ[k] k) (z : T) :
    centralMap q z = 0 ↔ q z = 0 := by sorry

-- DepthTwoHeightQuotient: geometric constructor omitted.
-- DepthTwoHeightQuotient.geometric, projection, central_exact, commutator:
-- omitted schematic pushout of U_2 by a nonzero Galois-equivariant map
-- coker(cup-dual) → Q_p(1). Requires the NC.2 quotient and NC.3 pushout. Gap G1.
end DepthTwoHeightQuotient

-- test: quotient_coordinate
example : Function.Surjective (LinearMap.fst ℚ ℚ ℚ) ∧
    DepthTwoHeightQuotient.centralMap (LinearMap.fst ℚ ℚ ℚ) (3, 5) =
    DepthTwoHeightQuotient.centralMap (LinearMap.fst ℚ ℚ ℚ) (3, 0) := by sorry
-- test: quotient_zero_map
example (z : ℚ × ℚ) :
    DepthTwoHeightQuotient.centralMap (0 : (ℚ × ℚ) →ₗ[ℚ] ℚ) z = 0 := by sorry
-- test: quotient_retains_nonzero_class
example : DepthTwoHeightQuotient.centralMap (LinearMap.fst ℚ ℚ ℚ) (1, 0) ≠ 0 :=
  by sorry
end CentralQuotient

section TateClass
variable {k : Type u} [Field k]
variable {H : Type v} [AddCommGroup H] [Module k H]

/-- The four de Rham conditions, including the nonzero condition. -/
def IsAdmissibleTateClass (p : k) (phi : H →ₗ[k] H)
    (Fil1 : Submodule k (H ⊗[k] H)) (cup : (H ⊗[k] H) →ₗ[k] k)
    (Z : H ⊗[k] H) : Prop :=
  Z ≠ 0 ∧ TensorProduct.map phi phi Z = p • Z ∧
    Z ∈ Fil1 ∧ cup Z = 0 ∧ TensorProduct.comm k H H Z = -Z

namespace IsAdmissibleTateClass
theorem nonzero (p : k) (phi : H →ₗ[k] H)
    (Fil1 : Submodule k (H ⊗[k] H)) (cup : (H ⊗[k] H) →ₗ[k] k)
    {Z : H ⊗[k] H} (h : IsAdmissibleTateClass p phi Fil1 cup Z) : Z ≠ 0 := by sorry

theorem smul (p : k) (phi : H →ₗ[k] H)
    (Fil1 : Submodule k (H ⊗[k] H)) (cup : (H ⊗[k] H) →ₗ[k] k)
    {Z : H ⊗[k] H} (h : IsAdmissibleTateClass p phi Fil1 cup Z)
    (a : k) (ha : a ≠ 0) : IsAdmissibleTateClass p phi Fil1 cup (a • Z) := by sorry

theorem not_zero (p : k) (phi : H →ₗ[k] H)
    (Fil1 : Submodule k (H ⊗[k] H)) (cup : (H ⊗[k] H) →ₗ[k] k) :
    ¬ IsAdmissibleTateClass p phi Fil1 cup 0 := by sorry
end IsAdmissibleTateClass

-- nice_class_realization: omitted rational algebraic cycle comparison. Gap G1.
-- The converse is deliberately absent: p-adic admissibility is insufficient.
end TateClass

section TateTests
def testPhi : (ℚ × ℚ) →ₗ[ℚ] ℚ × ℚ where
  toFun z := (z.1, 2 * z.2)
  map_add' := by sorry
  map_smul' := by sorry
def testWedge : (ℚ × ℚ) ⊗[ℚ] (ℚ × ℚ) :=
  (1, 0) ⊗ₜ[ℚ] (0, 1) - (0, 1) ⊗ₜ[ℚ] (1, 0)
-- test: tate_wedge_eigenvalue
example : IsAdmissibleTateClass 2 testPhi (⊤ : Submodule ℚ _)
    (0 : ((ℚ × ℚ) ⊗[ℚ] (ℚ × ℚ)) →ₗ[ℚ] ℚ) testWedge := by sorry
-- test: tate_zero_rejected
example : ¬ IsAdmissibleTateClass 2 testPhi (⊤ : Submodule ℚ _)
    (0 : ((ℚ × ℚ) ⊗[ℚ] (ℚ × ℚ)) →ₗ[ℚ] ℚ) 0 := by sorry
-- test: tate_symmetric_tensor_rejected
example : ¬ IsAdmissibleTateClass 2 testPhi (⊤ : Submodule ℚ _)
    (0 : ((ℚ × ℚ) ⊗[ℚ] (ℚ × ℚ)) →ₗ[ℚ] ℚ)
    ((1, 0) ⊗ₜ[ℚ] (1, 0)) := by sorry
-- test: tate_wrong_frobenius
example : ¬ IsAdmissibleTateClass 2 (LinearMap.id : (ℚ × ℚ) →ₗ[ℚ] ℚ × ℚ)
    (⊤ : Submodule ℚ _)
    (0 : ((ℚ × ℚ) ⊗[ℚ] (ℚ × ℚ)) →ₗ[ℚ] ℚ) testWedge := by sorry
end TateTests

section HeightModule
variable {k : Type u} [Field k]
variable {A T M : Type v} [AddCommGroup A] [Module k A]
    [AddCommGroup T] [Module k T] [AddCommGroup M] [Module k M]

/-- Quotient of the length-two module, killing exactly the kernel in its central grade. -/
abbrev DepthTwoHeightModule (i : T →ₗ[k] A) (q : T →ₗ[k] k) :=
  A ⧸ (q.ker.map i)

namespace DepthTwoHeightModule
abbrev mk (i : T →ₗ[k] A) (q : T →ₗ[k] k) : A →ₗ[k] DepthTwoHeightModule i q :=
  (q.ker.map i).mkQ

theorem relation (i : T →ₗ[k] A) (q : T →ₗ[k] k) (z : T) (hz : q z = 0) :
    mk i q (i z) = 0 := by sorry

def lift (i : T →ₗ[k] A) (q : T →ₗ[k] k) (f : A →ₗ[k] M)
    (hf : q.ker.map i ≤ f.ker) : DepthTwoHeightModule i q →ₗ[k] M :=
  (q.ker.map i).liftQ f hf

theorem lift_mk (i : T →ₗ[k] A) (q : T →ₗ[k] k) (f : A →ₗ[k] M)
    (hf : q.ker.map i ≤ f.ker) (a : A) : lift i q f hf (mk i q a) = f a := by sorry

-- DepthTwoHeightModule.geometric, grades, action, deRham:
-- omitted Galois representation, faithful U_Z action and connection realization. Gap G1.
end DepthTwoHeightModule

-- test: module_zero_quotient
example (z : ℚ) : DepthTwoHeightModule.mk (LinearMap.id : ℚ →ₗ[ℚ] ℚ)
    (0 : ℚ →ₗ[ℚ] ℚ) z = 0 := by sorry
-- test: module_identity_quotient
example : DepthTwoHeightModule.mk (LinearMap.id : ℚ →ₗ[ℚ] ℚ)
    (LinearMap.id : ℚ →ₗ[ℚ] ℚ) 1 ≠ 0 := by sorry
-- test: module_other_grades_preserved
example : DepthTwoHeightModule.mk (LinearMap.inr ℚ ℚ ℚ)
    (0 : ℚ →ₗ[ℚ] ℚ) (1, 0) ≠ 0 := by sorry
end HeightModule

-- HeightModuleTwist, HeightModuleTwist.neutral, .compose, .classes:
-- omitted contracted product of A_Z with an imported U_Z torsor. Gap G1.
-- test: twist_neutral -- omitted: the neutral right U_Z torsor recovers A_Z(b) as a
-- flag-preserving Galois representation with identity maps on all named grades.
-- test: twist_endpoint -- omitted: at x=b, pi1(A_Z(b,b))=0 and pi2(A_Z(b,b))=c_Z;
-- pi1=0 does not imply c_Z=0.
-- test: twist_nontrivial_center -- omitted: a nonzero class in H1_f(G_p,Q_p(1))
-- acts freely on a nonempty fibre of the two adjacent-extension projections.
-- These test signatures need the actual torsor and mixed-extension categories, G1,G2.
-- twist_two_classes, twist_injective, height_module_comparison, away_height_vanishes,
-- finite_bad_height_image and chow_heegner_class: omitted geometric/Galois signatures.
-- The packet states each theorem, its suppliers and the precise gaps G1--G3.
-- rank_picard_criterion: omitted geometric Chabauty--Kim locus and its dimension theorem.

section Preheight
variable {k : Type u} [Field k]
variable {V : Type v} [AddCommGroup V] [Module k V]

/-- The scalar inside the height-character evaluation, with both negative beta terms. -/
def HeightPrevalue (s1 s2 : V →ₗ[k] V) (alpha : V)
    (betaPhi betaFil : Module.Dual k V) (gammaPhi gammaFil : k) : k :=
  gammaPhi - gammaFil - betaPhi (s1 alpha) - betaFil (s2 alpha)

namespace HeightPrevalue
theorem zero_alpha (s1 s2 : V →ₗ[k] V) (betaPhi betaFil : Module.Dual k V)
    (gammaPhi gammaFil : k) :
    HeightPrevalue s1 s2 0 betaPhi betaFil gammaPhi gammaFil = gammaPhi - gammaFil :=
  by sorry

theorem gamma_add (s1 s2 : V →ₗ[k] V) (alpha : V)
    (betaPhi betaFil : Module.Dual k V) (gammaPhi gammaFil a : k) :
    HeightPrevalue s1 s2 alpha betaPhi betaFil (gammaPhi + a) gammaFil =
    HeightPrevalue s1 s2 alpha betaPhi betaFil gammaPhi gammaFil + a := by sorry

theorem character_smul (chi : k →ₗ[k] k) (a z : k) : chi (a * z) = a * chi z :=
  by sorry

-- HeightPrevalue.local_height: omitted identification with Nekovar's h_p on D_cris(A_Z).
-- Requires G2, chosen Hodge splitting and the nonzero local linear character.
end HeightPrevalue

def firstProjection : (ℚ × ℚ) →ₗ[ℚ] ℚ × ℚ where
  toFun z := (z.1, 0)
  map_add' := by sorry
  map_smul' := by sorry
def secondProjection : (ℚ × ℚ) →ₗ[ℚ] ℚ × ℚ where
  toFun z := (0, z.2)
  map_add' := by sorry
  map_smul' := by sorry
-- test: preheight_two_negative_terms
example : HeightPrevalue firstProjection secondProjection (1, 2)
    (2 • LinearMap.fst ℚ ℚ ℚ) (3 • LinearMap.snd ℚ ℚ ℚ) 7 1 = -2 := by sorry
-- test: preheight_zero_alpha
example : HeightPrevalue firstProjection secondProjection (0, 0)
    (2 • LinearMap.fst ℚ ℚ ℚ) (3 • LinearMap.snd ℚ ℚ ℚ) 7 1 = 6 := by sorry
-- test: preheight_central_variation
example : HeightPrevalue firstProjection secondProjection (1, 2)
    (2 • LinearMap.fst ℚ ℚ ℚ) (3 • LinearMap.snd ℚ ℚ ℚ) 8 1 = -1 := by sorry
end Preheight

section HeightCoordinates
variable {k V : Type*} [Field k]
/-- Native fibre coordinate bijection; algebraic/geometric realization remains a gap. -/
def heightCoordinates (F : V → k) (a : k) (ha : a ≠ 0) : (V × k) ≃ (V × k) where
  toFun z := (z.1, a * (z.2 - F z.1))
  invFun z := (z.1, z.2 / a + F z.1)
  left_inv := by sorry
  right_inv := by sorry

-- local_height_coordinates: omitted scheme isomorphism (pi_1,h_p): H^1_f(G_p,U_Z)
-- ≅ H^1_f(G_p,V) × Q_p, using the mixed-extension classifier and a nonzero character.
-- local_height_coordinates: scheme/Galois specialization omitted at G1,G2.
-- heightCoordinates above supplies only the explicitly stated fibre set equivalence.
end HeightCoordinates

section AwayConstants
variable {k : Type u} [Field k]
variable {I : Type v} [Fintype I]

/-- Independent local upper bounds give a sound finite correction set. -/
def AwayHeightConstants (Gamma : I → Set k) : Set k :=
  {a | ∃ t : I → k, (∀ i, t i ∈ Gamma i) ∧ a = -(∑ i, t i)}

namespace AwayHeightConstants
theorem finite (Gamma : I → Set k) (h : ∀ i, (Gamma i).Finite) :
    (AwayHeightConstants Gamma).Finite := by sorry

theorem mem (Gamma : I → Set k) (t : I → k) (h : ∀ i, t i ∈ Gamma i) :
    -(∑ i, t i) ∈ AwayHeightConstants Gamma := by sorry

theorem mono (Gamma Delta : I → Set k) (h : ∀ i, Gamma i ⊆ Delta i) :
    AwayHeightConstants Gamma ⊆ AwayHeightConstants Delta := by sorry

theorem all_zero : AwayHeightConstants (fun _ : I => ({0} : Set k)) = {0} := by sorry

theorem height_sum (Gamma : I → Set k) (t : I → k) (ht : ∀ i, t i ∈ Gamma i)
    (hp globalHeight : k) (h : globalHeight = hp + ∑ i, t i) :
    hp - globalHeight ∈ AwayHeightConstants Gamma := by sorry
end AwayHeightConstants

-- test: away_empty
example : AwayHeightConstants (fun _ : Fin 0 => (∅ : Set ℚ)) = {0} := by sorry
-- test: away_nonzero_one_place
example : AwayHeightConstants (fun _ : Fin 1 => ({2} : Set ℚ)) = {-2} := by sorry
-- test: away_nonzero_two_places
example : AwayHeightConstants (fun i : Fin 2 => ({if i = 0 then 1 else 2} : Set ℚ)) =
    {-3} := by sorry
-- test: away_nonzero_cannot_be_dropped
example : (3 : ℚ) ∉ AwayHeightConstants (fun _ : Fin 1 => ({3} : Set ℚ)) ∧
    (0 : ℚ) ∉ AwayHeightConstants (fun _ : Fin 1 => ({3} : Set ℚ)) := by sorry
end AwayConstants

section Pair
variable {p : ℕ} [Fact p.Prime]
variable {X d : Type*} [Fintype d] {g : ℕ}

def heightJointCoordinates (AJ : X → Fin g → ℚ_[p]) (theta : X → ℚ_[p])
    (x : X) : Option (Fin g) → ℚ_[p]
  | none => theta x
  | some i => AJ x i

/-- Analyticity and polynomial density on EVERY nonempty open subdisc, plus containment. -/
def IsQuadraticChabautyPair (AJ : X → Fin g → ℚ_[p]) (theta : X → ℚ_[p])
    (Upsilon : Set ℚ_[p]) (E : (Fin g → ℚ_[p]) →ₗ[ℚ_[p]] (Fin g → ℚ_[p]))
    (c : Fin g → ℚ_[p])
    (B : (Fin g → ℚ_[p]) →ₗ[ℚ_[p]] (Fin g → ℚ_[p]) →ₗ[ℚ_[p]] ℚ_[p])
    (chart : d → ℚ_[p] → X) (localPoints rationalPoints : Set X) : Prop :=
  Upsilon.Finite ∧ rationalPoints ⊆ localPoints ∧
    localPoints ⊆ ⋃ i : d, chart i '' Metric.closedBall (0 : ℚ_[p]) 1 ∧
    (∀ i, AnalyticOnNhd ℚ_[p] (theta ∘ chart i) (Metric.closedBall 0 1) ∧
      ∀ j : Fin g, AnalyticOnNhd ℚ_[p] (fun t => AJ (chart i t) j)
        (Metric.closedBall 0 1)) ∧
    (∀ (i : d) (a : ℚ_[p]) (r : ℝ), a ∈ Metric.closedBall (0 : ℚ_[p]) 1 →
      0 < r → Metric.ball a r ⊆ Metric.closedBall (0 : ℚ_[p]) 1 →
      ∀ P : MvPolynomial (Option (Fin g)) ℚ_[p],
        (∀ t ∈ Metric.ball a r, MvPolynomial.eval
          (heightJointCoordinates AJ theta (chart i t)) P = 0) → P = 0) ∧
    ∀ x ∈ rationalPoints, theta x - B (AJ x) (E (AJ x) + c) ∈ Upsilon

namespace IsQuadraticChabautyPair
theorem rational_mem (AJ : X → Fin g → ℚ_[p]) (theta : X → ℚ_[p])
    (Upsilon : Set ℚ_[p]) (E : (Fin g → ℚ_[p]) →ₗ[ℚ_[p]] (Fin g → ℚ_[p]))
    (c : Fin g → ℚ_[p])
    (B : (Fin g → ℚ_[p]) →ₗ[ℚ_[p]] (Fin g → ℚ_[p]) →ₗ[ℚ_[p]] ℚ_[p])
    (chart : d → ℚ_[p] → X) (localPoints rationalPoints : Set X)
    (h : IsQuadraticChabautyPair AJ theta Upsilon E c B chart localPoints rationalPoints)
    {x : X} (hx : x ∈ rationalPoints) :
    x ∈ localPoints ∧ theta x - B (AJ x) (E (AJ x) + c) ∈ Upsilon := by sorry

theorem weaken_constants (AJ : X → Fin g → ℚ_[p]) (theta : X → ℚ_[p])
    (Upsilon : Set ℚ_[p]) (E : (Fin g → ℚ_[p]) →ₗ[ℚ_[p]] (Fin g → ℚ_[p]))
    (c : Fin g → ℚ_[p])
    (B : (Fin g → ℚ_[p]) →ₗ[ℚ_[p]] (Fin g → ℚ_[p]) →ₗ[ℚ_[p]] ℚ_[p])
    (chart : d → ℚ_[p] → X) (localPoints rationalPoints : Set X)
    (h : IsQuadraticChabautyPair AJ theta Upsilon E c B chart localPoints rationalPoints)
    (Upsilon' : Set ℚ_[p]) (hsub : Upsilon ⊆ Upsilon') (hfin : Upsilon'.Finite) :
    IsQuadraticChabautyPair AJ theta Upsilon' E c B chart localPoints rationalPoints :=
  by sorry

theorem non_graph (AJ : X → Fin g → ℚ_[p]) (theta : X → ℚ_[p])
    (Upsilon : Set ℚ_[p]) (E : (Fin g → ℚ_[p]) →ₗ[ℚ_[p]] (Fin g → ℚ_[p]))
    (c : Fin g → ℚ_[p])
    (B : (Fin g → ℚ_[p]) →ₗ[ℚ_[p]] (Fin g → ℚ_[p]) →ₗ[ℚ_[p]] ℚ_[p])
    (chart : d → ℚ_[p] → X) (localPoints rationalPoints : Set X)
    (h : IsQuadraticChabautyPair AJ theta Upsilon E c B chart localPoints rationalPoints)
    (i : d) (a : ℚ_[p]) (r : ℝ) (ha : a ∈ Metric.closedBall (0 : ℚ_[p]) 1)
    (hr : 0 < r) (hball : Metric.ball a r ⊆ Metric.closedBall (0 : ℚ_[p]) 1)
    (Q : MvPolynomial (Fin g) ℚ_[p]) :
    ¬ ∀ t ∈ Metric.ball a r, theta (chart i t) = MvPolynomial.eval (AJ (chart i t)) Q :=
  by sorry

-- IsQuadraticChabautyPair.geometric, .joint_dense, .height_construction:
-- omitted Abel--Jacobi/height specialization, not assumed as fields of fake geometry.
-- pair_of_heights and pair_finite_locus: omitted geometric source theorem / NC.4 finiteness.
end IsQuadraticChabautyPair

-- test: pair_identity_height
-- A genus-zero INTERFACE test only; it makes no geometric genus-zero QC claim.
example : IsQuadraticChabautyPair (fun _ : ℚ_[p] => (0 : Fin 0 → ℚ_[p]))
    (fun x => x) ({0} : Set ℚ_[p]) 0 0 0
    (fun _ : Fin 1 => fun t => t) (Metric.closedBall 0 1) {0} := by sorry
-- test: pair_constant_abel_jacobi_rejected
example : ¬ IsQuadraticChabautyPair (fun _ : ℚ_[p] => (0 : Fin 1 → ℚ_[p]))
    (fun x => x) ({0} : Set ℚ_[p]) 0 0 0
    (fun _ : Fin 1 => fun t => t) (Metric.closedBall 0 1) {0} := by sorry
-- test: pair_wrong_correction_rejected
example : ¬ IsQuadraticChabautyPair (fun _ : ℚ_[p] => (0 : Fin 0 → ℚ_[p]))
    (fun x => x) ({1} : Set ℚ_[p]) 0 0 0
    (fun _ : Fin 1 => fun t => t) (Metric.closedBall 0 1) {0} := by sorry
end Pair

section Determinant
variable {k : Type u} [Field k]
variable {X : Type v} {m : ℕ}

/-- First column consists of height values with their specified local corrections. -/
def HeightDeterminantMatrix (psi : X → Fin m → k) (theta : X → k)
    (anchors : Fin m → X) (alpha : k) (anchorAlpha : Fin m → k) (x : X) :
    Matrix (Option (Fin m)) (Option (Fin m)) k
  | none, none => theta x - alpha
  | none, some j => psi x j
  | some i, none => theta (anchors i) - anchorAlpha i
  | some i, some j => psi (anchors i) j

noncomputable def HeightDeterminant (psi : X → Fin m → k) (theta : X → k)
    (anchors : Fin m → X) (alpha : k) (anchorAlpha : Fin m → k) (x : X) : k :=
  (HeightDeterminantMatrix psi theta anchors alpha anchorAlpha x).det

namespace HeightDeterminant
theorem matrix_first (psi : X → Fin m → k) (theta : X → k)
    (anchors : Fin m → X) (alpha : k) (anchorAlpha : Fin m → k) (x : X) :
    HeightDeterminantMatrix psi theta anchors alpha anchorAlpha x none none =
      theta x - alpha := by sorry

theorem duplicate_row (psi : X → Fin m → k) (theta : X → k)
    (anchors : Fin m → X) (alpha : k) (anchorAlpha : Fin m → k)
    (i : Fin m) (h : alpha = anchorAlpha i) :
    HeightDeterminant psi theta anchors alpha anchorAlpha (anchors i) = 0 := by sorry

theorem equation (psi : X → Fin m → k) (theta : X → k)
    (anchors : Fin m → X) (alpha : k) (anchorAlpha : Fin m → k)
    (L : (Fin m → k) →ₗ[k] k)
    (hanchors : ∀ i, theta (anchors i) - anchorAlpha i = L (psi (anchors i)))
    (hbasis : Matrix.det (fun i j => psi (anchors i) j) ≠ 0)
    (x : X) :
    HeightDeterminant psi theta anchors alpha anchorAlpha x = 0 ↔
      theta x - L (psi x) = alpha := by sorry
end HeightDeterminant

-- test: determinant_empty_features
example : HeightDeterminant (fun _ : ℚ => (0 : Fin 0 → ℚ)) (fun x => x)
    (fun i : Fin 0 => Fin.elim0 i) 2 0 7 = 5 := by sorry
-- test: determinant_nonzero_corrections
example : HeightDeterminant (fun x : ℚ => fun _ : Fin 1 => x) (fun x => x + 5)
    (fun _ : Fin 1 => 4) 2 (fun _ => -1) 2 = 0 := by sorry
-- test: determinant_basis_cannot_be_omitted
example : HeightDeterminant (fun _ : ℚ => (0 : Fin 1 → ℚ)) (fun x => x)
    (fun _ : Fin 1 => 0) 0 0 7 = 0 := by sorry
-- determinant_height_equivalence: geometric finiteness specialization omitted at G1.
-- Its native algebraic part is HeightDeterminant.equation, with an invertible anchor matrix.
end Determinant

-- equivariant_height_balanced_tensor: omitted finite etale K-action on the actual
-- height modules. Balanced tensor dimension and Q_p-valued K-balanced bilinearity
-- are required; a Q_p-valued form is not declared K-linear without such a module.
-- potential_good_height_constants: omitted potential-unramified height theorem, G2.

section Choices
variable {k V : Type*} [Field k] [AddCommGroup V] [Module k V]

theorem splitting_residual (theta : k) (B D : V →ₗ[k] V →ₗ[k] k) (x y : V) :
    (theta + D x y) - (B + D) x y = theta - B x y := by sorry

theorem character_scale (a theta globalHeight : k) (ha : a ≠ 0) (Upsilon : Set k) :
    a * theta - a * globalHeight ∈ (fun z => a * z) '' Upsilon ↔
    theta - globalHeight ∈ Upsilon := by sorry

-- test: zero_character_loses_obstruction
example : (0 : ℚ) * 7 - 0 * 2 ∈ (fun z : ℚ => 0 * z) '' ({0} : Set ℚ) ∧
    (7 : ℚ) - 2 ∉ ({0} : Set ℚ) := by sorry

-- choices_independence: the geometric theorem applies both identities to the shared
-- generic height variation theorem, scaling all local correction sets as well. G2.
end Choices

-- The concrete X_s(13) model and computation already belong to ED.6:
-- EffectiveDiophantineMethods:ED.6/xs13-plane-model, /xs13-rank-three,
-- /xs13-tate-classes, /xs13-equivariant-height-matrices, /xs13-first-chart-points,
-- /xs13-second-chart-points, /xs13-p0-disc and /xs13-rational-points.
-- They are illustrated in the reader and imported-target register, not defined again.
-- NC.5 supplies their generic pair, mixed-extension height and determinant inputs.
-- Correct U1.m line358 to use betafil2 in the Z2 feature and replay its certificates;
-- no numerical execution or rational-point completeness replay is claimed here.

end TauCetiRoadmap.AnabelianGeometryAndNonabelianChabauty.NC5
