/-
This file is not the roadmap and is not exhaustive. The definitive document is
research/blueprint/readmes/HodgeStructuresPartII--H.8.md. These statements suggest
Lean forms so that contributors and reviewers converge on names and signatures.

The fibre Hodge structures, conjugation, tensor product, kernels and lattice
rounding are the pinned library objects. RealActionOnChart adds real-action data
to the fibre outputs of an imported marked chart. It does not define a global
variation, connection, holomorphic bundle or geometric cohomology theory.

All proofs are placeholders. The final ledger identifies global signatures
which cannot be expressed before the common suppliers exist. No unspecified
geometric hypothesis is encoded as a Prop-valued field. The algebraic and
analytic statements here are explicit local parts, not substitutes for the
omitted geometric theorems.
-/
import TauCeti.Geometry.Hodge.Structure
import TauCeti.Geometry.Hodge.Conjugation
import Mathlib.Algebra.Module.ZLattice.Basic
import Mathlib.Analysis.Calculus.Implicit
import Mathlib.Analysis.Analytic.Uniqueness
import Mathlib.LinearAlgebra.Dimension.Finrank
import Mathlib.LinearAlgebra.Matrix.Notation

noncomputable section
open scoped TensorProduct Topology Classical
open Module

namespace TauCeti.Hodge.RealNL

universe u v w z

section Chart
variable {B : Type u} {V : Type v} [AddCommGroup V] [Module ℝ V]

abbrev Complexification (V : Type v) [AddCommGroup V] [Module ℝ V] := ℂ ⊗[ℝ] V
abbrev coefficientConjugation := complexificationConjugation V

/-- The supplied flat chart's geometric real action. The Hodge structures and
the base involution are input, not a new variation carrier. -/
structure RealActionOnChart (c : B → B)
    (H : B → HodgeStructureOn (Complexification V) (complexificationConjugation V) 2)
    where
  sigma : V ≃ₗ[ℝ] V
  sigma_involutive : Function.Involutive sigma
  base_involutive : Function.Involutive c
  geometric_piece : ∀ b p,
    ((H b).piece p).map (sigma.toLinearMap.baseChange ℂ) = (H (c b)).piece (2 - p)

namespace RealActionOnChart
variable {c : B → B}
variable {H : B → HodgeStructureOn (Complexification V) (complexificationConjugation V) 2}

def geometric (A : RealActionOnChart c H) : Complexification V →ₗ[ℂ] Complexification V :=
  A.sigma.toLinearMap.baseChange ℂ

def combined (A : RealActionOnChart c H) :
    Complexification V →ₛₗ[starRingEnd ℂ] Complexification V :=
  A.geometric.comp (complexificationConjugation V).toEquiv.toLinearMap

theorem geometric_tmul (A : RealActionOnChart c H) (a : ℂ) (v : V) :
    A.geometric (a ⊗ₜ[ℝ] v) = a ⊗ₜ[ℝ] A.sigma v := by
  sorry

theorem combined_tmul (A : RealActionOnChart c H) (a : ℂ) (v : V) :
    A.combined (a ⊗ₜ[ℝ] v) = (starRingEnd ℂ) a ⊗ₜ[ℝ] A.sigma v := by
  sorry

theorem combined_involutive (A : RealActionOnChart c H) :
    Function.Involutive A.combined := by
  sorry

/-- H.8/combined-type; coefficient and geometric conjugations exchange twice. -/
theorem combined_mem_piece (A : RealActionOnChart c H) (b : B) (p : ℤ)
    (x : Complexification V) (hx : x ∈ (H b).piece p) :
    A.combined x ∈ (H (c b)).piece p := by
  sorry

theorem ext (A A' : RealActionOnChart c H) (h : A.sigma = A'.sigma) : A = A' := by
  sorry

-- real_action_geometric_tensor
example (A : RealActionOnChart c H) (v : V) :
    A.geometric (Complex.I ⊗ₜ[ℝ] v) = Complex.I ⊗ₜ[ℝ] A.sigma v := by
  sorry

-- real_action_combined_tensor
example (A : RealActionOnChart c H) (v : V) :
    A.combined (Complex.I ⊗ₜ[ℝ] v) = (-Complex.I) ⊗ₜ[ℝ] A.sigma v := by
  sorry

-- real_action_zero
example [Subsingleton V] (A : RealActionOnChart c H) (x : Complexification V) :
    A.geometric x = x ∧ A.combined x = x := by
  sorry

-- real_action_combined_square
example (A : RealActionOnChart c H) (x : Complexification V) :
    A.combined (A.combined x) = x := by
  sorry
end RealActionOnChart

/-- Coordinates for the fixed part after tensoring with the real Tate sign. -/
def twistedInvariants (sigma : V →ₗ[ℝ] V) : Submodule ℝ V :=
  LinearMap.ker (sigma + LinearMap.id)

/-- H.8/twist-sign, also the characterisation API of twistedInvariants. -/
theorem mem_twistedInvariants (sigma : V →ₗ[ℝ] V) (v : V) :
    v ∈ twistedInvariants sigma ↔ sigma v = -v := by
  sorry

theorem twistedInvariants_id : twistedInvariants (LinearMap.id : V →ₗ[ℝ] V) = ⊥ := by
  sorry

theorem twistedInvariants_neg_id :
    twistedInvariants (-LinearMap.id : V →ₗ[ℝ] V) = ⊤ := by
  sorry

theorem twistedInvariants_map {V' : Type w} [AddCommGroup V'] [Module ℝ V']
    (sigma : V →ₗ[ℝ] V) (sigma' : V' →ₗ[ℝ] V') (f : V →ₗ[ℝ] V')
    (h : f.comp sigma = sigma'.comp f) :
    (twistedInvariants sigma).map f ≤ twistedInvariants sigma' := by
  sorry

def swapPlane : (Fin 2 → ℝ) →ₗ[ℝ] (Fin 2 → ℝ) where
  toFun x := ![x 1, x 0]
  map_add' := by sorry
  map_smul' := by sorry

theorem twistedInvariants_swap (x : Fin 2 → ℝ) :
    x ∈ twistedInvariants swapPlane ↔ x 1 = -x 0 := by
  sorry

-- twisted_identity_line
example : (1 : ℝ) ∉ twistedInvariants (LinearMap.id : ℝ →ₗ[ℝ] ℝ) := by
  sorry

-- twisted_negative_line
example (x : ℝ) : x ∈ twistedInvariants (-LinearMap.id : ℝ →ₗ[ℝ] ℝ) := by
  sorry

-- twisted_swap_plane
example (x : Fin 2 → ℝ) :
    x ∈ twistedInvariants swapPlane ↔ x 1 = -x 0 := by
  sorry

-- twisted_zero_space
example : twistedInvariants (LinearMap.id : (Fin 0 → ℝ) →ₗ[ℝ] (Fin 0 → ℝ)) = ⊤ := by
  sorry

/-- The class and fibre structures are outputs of one supplied flat marking. -/
def transportedHodgeLocus
    (H : B → HodgeStructureOn (Complexification V) (complexificationConjugation V) 2)
    (lambda : V) : Set B := {b | (1 : ℂ) ⊗ₜ[ℝ] lambda ∈ (H b).piece 1}

theorem mem_transportedHodgeLocus
    (H : B → HodgeStructureOn (Complexification V) (complexificationConjugation V) 2)
    (lambda : V) (b : B) :
    b ∈ transportedHodgeLocus H lambda ↔ (1 : ℂ) ⊗ₜ[ℝ] lambda ∈ (H b).piece 1 := by
  sorry

theorem transportedHodgeLocus_zero
    (H : B → HodgeStructureOn (Complexification V) (complexificationConjugation V) 2) :
    transportedHodgeLocus H 0 = Set.univ := by
  sorry

theorem transportedHodgeLocus_constant
    (H : HodgeStructureOn (Complexification V) (complexificationConjugation V) 2)
    (lambda : V) :
    transportedHodgeLocus (fun _ : B => H) lambda =
      if (1 : ℂ) ⊗ₜ[ℝ] lambda ∈ H.piece 1 then Set.univ else ∅ := by
  sorry

theorem transportedHodgeLocus_changeMarking
    {V' : Type w} [AddCommGroup V'] [Module ℝ V']
    (H : B → HodgeStructureOn (Complexification V) (complexificationConjugation V) 2)
    (H' : B → HodgeStructureOn (Complexification V') (complexificationConjugation V') 2)
    (e : V ≃ₗ[ℝ] V')
    (he : ∀ b, ((H b).piece 1).map (e.toLinearMap.baseChange ℂ) = (H' b).piece 1)
    (lambda : V) :
    transportedHodgeLocus H lambda = transportedHodgeLocus H' (e lambda) := by
  sorry

theorem transportedHodgeLocus_F_one
    (H : B → HodgeStructureOn (Complexification V) (complexificationConjugation V) 2)
    (lambda : V) (b : B) :
    b ∈ transportedHodgeLocus H lambda ↔ (1 : ℂ) ⊗ₜ[ℝ] lambda ∈ (H b).F 1 := by
  sorry

-- transported_zero
example (H : B → HodgeStructureOn (Complexification V) (complexificationConjugation V) 2) :
    transportedHodgeLocus H 0 = Set.univ := by
  sorry

-- transported_constant_inside
example (H : HodgeStructureOn (Complexification V) (complexificationConjugation V) 2)
    (lambda : V) (h : (1 : ℂ) ⊗ₜ[ℝ] lambda ∈ H.piece 1) :
    transportedHodgeLocus (fun _ : B => H) lambda = Set.univ := by
  sorry

-- transported_constant_outside
example (H : HodgeStructureOn (Complexification V) (complexificationConjugation V) 2)
    (lambda : V) (h : (1 : ℂ) ⊗ₜ[ℝ] lambda ∉ H.piece 1) :
    transportedHodgeLocus (fun _ : B => H) lambda = ∅ := by
  sorry

-- transported_F_one
example (H : HodgeStructureOn (Complexification V) (complexificationConjugation V) 2)
    (lambda : V) (b : B) :
    b ∈ transportedHodgeLocus H lambda ↔ (1 : ℂ) ⊗ₜ[ℝ] lambda ∈ (H b).F 1 := by
  sorry
end Chart

section Contraction
variable {T : Type u} {D : Type v} {J : Type w} {Q : Type z}
variable [AddCommGroup T] [Module ℂ T] [AddCommGroup D] [Module ℂ D]
variable [AddCommGroup J] [Module ℂ J] [AddCommGroup Q] [Module ℂ Q]

/-- The supplied geometric KS and coherent cup maps determine the contraction.
This construction alone does not identify an arbitrary input map with KS. -/
def contractedKS (KS : T →ₗ[ℂ] D) (cup : D →ₗ[ℂ] (J →ₗ[ℂ] Q))
    (lambda : J) : T →ₗ[ℂ] Q where
  toFun v := cup (KS v) lambda
  map_add' := by sorry
  map_smul' := by sorry

theorem contractedKS_apply (KS : T →ₗ[ℂ] D) (cup : D →ₗ[ℂ] (J →ₗ[ℂ] Q))
    (lambda : J) (v : T) : contractedKS KS cup lambda v = cup (KS v) lambda := by
  sorry

theorem contractedKS_zero_class (KS : T →ₗ[ℂ] D) (cup : D →ₗ[ℂ] (J →ₗ[ℂ] Q)) :
    contractedKS KS cup 0 = 0 := by
  sorry

theorem contractedKS_add_class (KS : T →ₗ[ℂ] D) (cup : D →ₗ[ℂ] (J →ₗ[ℂ] Q))
    (lambda mu : J) :
    contractedKS KS cup (lambda + mu) = contractedKS KS cup lambda + contractedKS KS cup mu := by
  sorry

theorem contractedKS_smul_class (KS : T →ₗ[ℂ] D) (cup : D →ₗ[ℂ] (J →ₗ[ℂ] Q))
    (a : ℂ) (lambda : J) :
    contractedKS KS cup (a • lambda) = a • contractedKS KS cup lambda := by
  sorry

theorem contractedKS_precomp {T' : Type*} [AddCommGroup T'] [Module ℂ T']
    (KS : T →ₗ[ℂ] D) (cup : D →ₗ[ℂ] (J →ₗ[ℂ] Q)) (lambda : J) (f : T' →ₗ[ℂ] T) :
    contractedKS (KS.comp f) cup lambda = (contractedKS KS cup lambda).comp f := by
  sorry

-- contractedKS_scalar_fixture
example : contractedKS (LinearMap.id : ℂ →ₗ[ℂ] ℂ) (LinearMap.mul ℂ ℂ) 3 2 = 6 := by
  sorry

-- contractedKS_zero_fixture
example (lambda : J) (cup : D →ₗ[ℂ] (J →ₗ[ℂ] Q)) :
    contractedKS (0 : T →ₗ[ℂ] D) cup lambda = 0 := by
  sorry

-- contractedKS_precomp_fixture
example : contractedKS ((2 : ℂ) • (LinearMap.id : ℂ →ₗ[ℂ] ℂ))
    (LinearMap.mul ℂ ℂ) 3 1 = 6 := by
  sorry

-- contractedKS_zero_class_fixture
example : ¬Function.Surjective
    (contractedKS (LinearMap.id : ℂ →ₗ[ℂ] ℂ) (LinearMap.mul ℂ ℂ) 0) := by
  sorry
end Contraction

section Cone
variable (V : Type u) [NormedAddCommGroup V] [NormedSpace ℝ V]

/-- Positive scaling is required; convexity and exclusion of zero are not. -/
structure PositiveOpenCone where
  carrier : Set V
  isOpen : IsOpen carrier
  nonempty : carrier.Nonempty
  smul_mem : ∀ (a : ℝ), 0 < a → ∀ v ∈ carrier, a • v ∈ carrier

namespace PositiveOpenCone
variable {V}

theorem smul_iff (O : PositiveOpenCone V) (a : ℝ) (ha : 0 < a) (v : V) :
    a • v ∈ O.carrier ↔ v ∈ O.carrier := by
  sorry

def transport {W : Type v} [NormedAddCommGroup W] [NormedSpace ℝ W]
    (e : V ≃L[ℝ] W) (O : PositiveOpenCone V) : PositiveOpenCone W where
  carrier := e '' O.carrier
  isOpen := by sorry
  nonempty := by sorry
  smul_mem := by sorry

def positiveRay : PositiveOpenCone ℝ where
  carrier := Set.Ioi 0
  isOpen := by sorry
  nonempty := by sorry
  smul_mem := by sorry

def whole (V : Type u) [NormedAddCommGroup V] [NormedSpace ℝ V] : PositiveOpenCone V where
  carrier := Set.univ
  isOpen := by sorry
  nonempty := by sorry
  smul_mem := by sorry

-- cone_positive_ray
example : (1 : ℝ) ∈ positiveRay.carrier ∧ (0 : ℝ) ∉ positiveRay.carrier := by
  sorry

-- cone_zero_dimension
example : (0 : Fin 0 → ℝ) ∈ (whole (Fin 0 → ℝ)).carrier := by
  sorry

-- cone_annulus_failure
example : ¬(∀ a : ℝ, 0 < a → ∀ x ∈ Set.Ioo (1 : ℝ) 2, a • x ∈ Set.Ioo (1 : ℝ) 2) := by
  sorry

-- cone_scaling_inverse
example (O : PositiveOpenCone V) (a : ℝ) (ha : 0 < a) (v : V) :
    a • v ∈ O.carrier ↔ v ∈ O.carrier := by
  sorry
end PositiveOpenCone

/-- Basis form of the full-lattice-coset theorem, including dimension zero. -/
theorem fullLatticeCosetMeetsCone {ι : Type v} [Fintype ι] (b : Basis ι ℝ V)
    (O : PositiveOpenCone V) (n : ℕ) (hn : 0 < n) (a : V) :
    ∃ z : Submodule.span ℤ (Set.range b), a + (n : ℝ) • (z : V) ∈ O.carrier := by
  sorry

-- Rank-one acceptance: every congruence class has a positive representative.
example (n : ℕ) (hn : 0 < n) (a : ℝ) : ∃ z : ℤ, 0 < a + (n : ℝ) * z := by
  sorry
end Cone

section GoodLocus
variable {B : Type u} {V : Type v} {T : Type w} {Q : Type z}
variable [AddCommGroup V] [Module ℝ V] [AddCommGroup T] [Module ℂ T]
variable [AddCommGroup Q] [Module ℂ Q]

/-- J and A are the actual twisted real Hodge subspaces and period-symbol maps
exported by a chart. This definition adds no analytic or geometric assertion. -/
def goodRealLocus (J : B → Submodule ℝ V)
    (A : B → V →ₗ[ℝ] (T →ₗ[ℂ] Q)) : Set B :=
  {b | ∃ lambda ∈ J b, Function.Surjective (A b lambda)}

theorem mem_goodRealLocus (J : B → Submodule ℝ V)
    (A : B → V →ₗ[ℝ] (T →ₗ[ℂ] Q)) (b : B) :
    b ∈ goodRealLocus J A ↔ ∃ lambda ∈ J b, Function.Surjective (A b lambda) := by
  sorry

theorem goodRealLocus_zero_target [Subsingleton Q] (J : B → Submodule ℝ V)
    (A : B → V →ₗ[ℝ] (T →ₗ[ℂ] Q)) : goodRealLocus J A = Set.univ := by
  sorry

theorem goodRealLocus_zero_symbol (J : B → Submodule ℝ V) :
    goodRealLocus J (fun _ => 0 : B → V →ₗ[ℝ] (T →ₗ[ℂ] Q)) =
      if Subsingleton Q then Set.univ else ∅ := by
  sorry

theorem goodRealLocus_baseChange
    {V' T' Q' : Type*} [AddCommGroup V'] [Module ℝ V']
    [AddCommGroup T'] [Module ℂ T'] [AddCommGroup Q'] [Module ℂ Q']
    (J : B → Submodule ℝ V) (J' : B → Submodule ℝ V')
    (A : B → V →ₗ[ℝ] (T →ₗ[ℂ] Q)) (A' : B → V' →ₗ[ℝ] (T' →ₗ[ℂ] Q'))
    (e : V ≃ₗ[ℝ] V') (f : T ≃ₗ[ℂ] T') (g : Q ≃ₗ[ℂ] Q')
    (hJ : ∀ b, (J b).map e.toLinearMap = J' b)
    (hA : ∀ b v t, A' b (e v) (f t) = g (A b v t)) :
    goodRealLocus J A = goodRealLocus J' A' := by
  sorry

def scalarSymbol : ℂ →ₗ[ℝ] (ℂ →ₗ[ℂ] ℂ) :=
  (LinearMap.mul ℂ ℂ).restrictScalars ℝ

-- good_scalar_symbol
example : (PUnit.unit : PUnit) ∈
    goodRealLocus (fun _ : PUnit => (⊤ : Submodule ℝ ℂ)) (fun _ => scalarSymbol) := by
  sorry

-- good_zero_target
example (J : B → Submodule ℝ V) (A : B → V →ₗ[ℝ] (T →ₗ[ℂ] (Fin 0 → ℂ))) :
    goodRealLocus J A = Set.univ := by
  sorry

-- good_zero_class_space
example : goodRealLocus (fun _ : PUnit => (⊥ : Submodule ℝ ℂ))
    (fun _ => scalarSymbol) = ∅ := by
  sorry

-- good_constant_zero_symbol
example [Nontrivial Q] (J : B → Submodule ℝ V) :
    goodRealLocus J (fun _ => 0 : B → V →ₗ[ℝ] (T →ₗ[ℂ] Q)) = ∅ := by
  sorry
end GoodLocus

section LocalTheorems
variable {E : Type u} {F : Type v} [AddCommGroup E] [Module ℝ E]
variable [AddCommGroup F] [Module ℝ F]

theorem fixedLinearSurjective (s : E →ₗ[ℝ] E) (t : F →ₗ[ℝ] F)
    (hs : Function.Involutive s) (ht : Function.Involutive t)
    (L : E →ₗ[ℝ] F) (he : L.comp s = t.comp L) (hL : Function.Surjective L) :
    ∀ y : F, t y = y → ∃ x : E, s x = x ∧ L x = y := by
  sorry

/-- Linear part of the normal-vanishing criterion. Its geometric identifications
and deduction of the three onto hypotheses from sheaf vanishings are in G2. -/
theorem normalComposite_surjective {K : Type w} {Q : Type z}
    [AddCommGroup K] [Module ℝ K] [AddCommGroup Q] [Module ℝ Q]
    (r : E →ₗ[ℝ] F) (delta : F →ₗ[ℝ] K) (boundary : K →ₗ[ℝ] Q)
    (hr : Function.Surjective r) (hd : Function.Surjective delta)
    (hb : Function.Surjective boundary) :
    Function.Surjective (boundary.comp (delta.comp r)) := by
  sorry

theorem vanishingRankCriterion {T C K : Type*}
    [AddCommGroup T] [Module ℂ T] [AddCommGroup C] [Module ℂ C]
    [AddCommGroup K] [Module ℂ K] [FiniteDimensional ℂ C] [FiniteDimensional ℂ K]
    (f : T →ₗ[ℂ] (C × K)) (hC : ∀ v, (f v).1 = 0)
    (hcodim : Module.finrank ℂ (C × K) - Module.finrank ℂ (LinearMap.range f) ≤
      Module.finrank ℂ C) : Function.Surjective (fun v => (f v).2) := by
  sorry

end LocalTheorems

section GraphDerivative
variable {E J Q : Type*} [NormedAddCommGroup E] [NormedSpace ℂ E]
variable [NormedAddCommGroup J] [NormedSpace ℂ J]
variable [NormedAddCommGroup Q] [NormedSpace ℂ Q]

/-- In a graph frame the flat-class obstruction has the negative symbol sign. -/
theorem flatClassObstruction_derivative (A : E → (J →L[ℂ] Q))
    (DA : E →L[ℂ] (J →L[ℂ] Q)) (b : E) (lambda : J)
    (hA : HasFDerivAt A DA b) :
    HasFDerivAt (fun x => -(A x lambda))
      (-(ContinuousLinearMap.apply ℂ Q lambda).comp DA) b := by
  sorry
end GraphDerivative

section AnalyticParts
variable {E F : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [CompleteSpace E]
variable [NormedAddCommGroup F] [NormedSpace ℝ F] [CompleteSpace F]

/-- Concrete local analytic input to Green's evaluation theorem. -/
theorem image_contains_ball_of_surjective_derivative
    (f : E → F) (L : E →L[ℝ] F) (a : E) (U : Set E)
    (hf : HasStrictFDerivAt f L a) (hL : L.range = ⊤)
    (hk : L.ker.ClosedComplemented) (hU : U ∈ nhds a) :
    ∃ epsilon : ℝ, 0 < epsilon ∧ Metric.ball (f a) epsilon ⊆ f '' U := by
  sorry

/-- Scaling saturation plus the local image neighbourhood gives an open cone;
the geometric real evaluation must supply these explicit analytic hypotheses. -/
theorem openCone_of_submersion
    (f : E → F) (L : E →L[ℝ] F) (a : E) (U : Set E)
    (hf : HasStrictFDerivAt f L a) (hL : L.range = ⊤)
    (hk : L.ker.ClosedComplemented) (hU : U ∈ nhds a)
    (hscale : ∀ r : ℝ, 0 < r → ∀ y ∈ f '' U, r • y ∈ f '' U) :
    ∃ O : PositiveOpenCone F, O.carrier ⊆ f '' U := by
  sorry

/-- Finite analytic coefficient engine for the componentwise density proof.
This is not an identification of the coefficients of a geometric Hodge bundle. -/
theorem analyticCoefficientLocus_dense {ι : Type*} [Fintype ι]
    (U : Set E) (hU : IsOpen U) (hconn : IsPreconnected U)
    (coeff : ι → E → ℝ) (ha : ∀ i, AnalyticOnNhd ℝ (coeff i) U)
    (hgood : ∃ b ∈ U, ∃ i, coeff i b ≠ 0) :
    U ⊆ closure {b | b ∈ U ∧ ∃ i, coeff i b ≠ 0} := by
  sorry
end AnalyticParts

/- Global signature omission ledger. All corresponding mathematical targets
remain fully stated in the packet and reader. No global theorem is replaced by
an arbitrary family of vector spaces with an assumed conclusion.

G1: geometricRealVariation; griffithsDerivative; greenEvaluationSubmersion;
constantVanishingSplitting; constantSymbolZero; vanishingRealGreen;
voisinInfinitesimalKernel; voisinKernelCone; voisinProductSurface;
transportedDivisorExport. These need ShimuraData:D3/variation, the H.2 relative
geometric variation and Gauss--Manin, H.3 symbol, and relative geometric Hodge
comparison, with exact common-carrier signatures.

G2: normalBoundaryFactorization and normalVanishingSurjectivity, plus the
geometric KS/Griffiths and Voisin inputs. SF.2/SF.4/SF.5 must provide actual
coherent cohomology, normal/divisor/Atiyah extensions and their natural maps.
normalComposite_surjective states only their elementary linear composition.

G3: realGreenOpenCone and realGoodLocusDensity need smooth real fixed-locus
charts, their tangent identifications and real-analytic Hodge frames.
affineCWBound, affineIntegralVanishing, ordinaryIntegralWeakLefschetzH3 and
ordinaryIntegralWeakLefschetzH2 need the Geometric topology Part II Morse/CW
extension and upstream AlgebraicTopology cellular/duality/Gysin adapters.
image_contains_ball_of_surjective_derivative, openCone_of_submersion and
analyticCoefficientLocus_dense are their explicit local analytic inputs.

G4: the Voisin statements need the exact general nodal, Grassmannian/Bott,
uniform-position, Macaulay multiplication and Jacobian/residue suppliers; no
record containing a theorem-valued field is introduced to hide that gap.

G5: transportedDivisorExport needs the real equivariant integral(1,1) supplier
in MC.7 and a genuine consumer-supplied equivariant integral lift. Twisted
invariant ordinary cohomology alone does not type this missing hypothesis.
-/
end TauCeti.Hodge.RealNL
