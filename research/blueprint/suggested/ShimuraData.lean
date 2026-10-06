import Mathlib.FieldTheory.Galois.Basic
import Mathlib.RingTheory.Trace.Basic
import Mathlib.RingTheory.Valuation.Basic
import Mathlib.LinearAlgebra.Matrix.GeneralLinearGroup.Defs
import Mathlib.Topology.Algebra.Group.Basic
import Mathlib.GroupTheory.GroupAction.Quotient
import Mathlib.LinearAlgebra.Matrix.Block
import Mathlib.LinearAlgebra.Matrix.Symmetric
import Mathlib.LinearAlgebra.Matrix.Charpoly.Basic
import Mathlib.Algebra.Lie.Basic
import Mathlib.NumberTheory.Real.Irrational
import Mathlib.Data.Nat.ModEq
import Mathlib.Geometry.Manifold.Complex
import Mathlib.AlgebraicGeometry.Scheme
import TauCeti.Algebra.AlgebraicGroup.DiagonalizableGroup.Weight
import TauCeti.Algebra.AlgebraicGroup.Reductive.Basic
import TauCeti.AlgebraicTopology.LocalCoefficient
import TauCeti.Geometry.Hodge.Decomposition
import TauCeti.Geometry.Hodge.WeilOperator
import TauCeti.Geometry.Hodge.TensorProduct
import TauCeti.Geometry.Hodge.Dual
import TauCeti.Geometry.Hodge.Tate.Twist

/-!
This file is not the roadmap and is not exhaustive. The roadmap document is definitive.
The statements suggest Lean forms so that contributors and reviewers converge on names
and signatures. These are unproved interfaces, not implementation claims.

The complete hypotheses are in the packet. At the pinned libraries there is no common
interface for an algebraic S-map, its rational group, real orbit, quotient charts and
connected adjoint datum. The following sections explicitly omit unavailable conditions,
using actual linear maps, comodules, local coefficient systems, schemes and group maps.
They do not replace those conditions with arbitrary proposition fields.

D0's restriction/scalar-extension identifications are supplied as equivalences. D1 uses
split weight coactions and the existing opposed-filtration carrier. D2 records its tangent
operator, with complex quotient charts absent. D3 records fiber/local-system data and a
filtered derivative; holomorphic bundle gluing and connections are absent. D4 records
full real orbits and point maps; rational algebraicity and SV1–SV3 are absent. Type witnesses
use specified Siegel/derived/connected-adjoint carriers, whose algebraic comparison is
absent. D5 records concrete actions, eigenvalue sets and coordinate calculations; adelic
and algebraic identifications come from suppliers. These omissions must be restored
before any declaration is an implementation of its packet target.

Deligne 1979: type (p,q) means character (-p,-q), μ(z)=h_C(z,1). The diagonal
restriction acts by t^(-n); inverse diagonal weight acts by t^n. h(i) is inverse to
the pinned Weil operator. For the limit t→0 convention, filtration stabilizer is P(μ⁻¹).
-/

noncomputable section
open scoped TensorProduct
open CategoryTheory
namespace TauCeti.Shimura

/- D0: supplied identifications, without reconstructing restriction of scalars. -/
theorem delignePointsTopology {S : Type*} [Group S] [TopologicalSpace S]
    [IsTopologicalGroup S] (e : S ≃ₜ* ℂˣ) : Continuous e ∧ Continuous e.symm := by sorry

theorem deligneLiePoints (x : ℂ) :
    (x * star (1 : ℂ) + (1 : ℂ) * star x).re = 2 * x.re := by sorry

theorem hilbertRealPoints {ι A : Type*} [Fintype ι] [Group A]
    (e : A ≃* (ι → Matrix.GeneralLinearGroup (Fin 2) ℝ)) :
    Function.Bijective e := by sorry

theorem hilbertAdelicPoints {A B : Type*} [Group A] [Group B]
    (e : A ≃* B) : e.toMonoidHom.ker = ⊥ := by sorry

theorem datumMapPoints {A B C D : Type*} [Group A] [Group B] [Group C] [Group D]
    (f : A →* B) (g : C →* D) (e : A ≃* C) (e' : B ≃* D)
    (h : ∀ a, e' (f a) = g (e a)) : e'.toMonoidHom.comp f = g.comp e.toMonoidHom := by sorry

/- D1: no Deligne-torus construction here; RG2.0a supplies it. -/
-- The Hopf splitting π is supplied by RG2.0a; this is the comodule dictionary it feeds.
theorem deligneTorus {W C : Type*} [AddCommGroup W] [Module ℂ W]
    [AddCommGroup C] [Module ℂ C] [Coalgebra ℂ C] [Comodule ℂ C W]
    (π : C →ₗc[ℂ] MonoidAlgebra ℂ (Multiplicative (ℤ×ℤ))) :
    DirectSum.IsInternal (DiagonalizableGroup.weightSpace W π) := by sorry

private def splitCharacter (a b : ℤ) (x : ℂˣ × ℂˣ) : ℂˣ := x.1^a*x.2^b
theorem deligneTorusPoints (z : ℂˣ) (p q : ℤ) :
    splitCharacter (-p) (-q) (z,star z) = z^(-p)*star z^(-q) ∧
    splitCharacter (-p) (-q) (z,1) = z^(-p) := by sorry

theorem weightNormCocharacters (t : ℝˣ) (p q : ℤ) :
    t ^ (-p) * t ^ (-q) = t ^ (-(p+q)) := by sorry

section Grading
variable (V : Type*) [AddCommGroup V] [Module ℝ V]

/-- The grading is real; pure objects use the pinned canonical conjugation. -/
structure GradedRealHodge where
  weight : ℤ → Submodule ℝ V
  internal : DirectSum.IsInternal weight
  finiteSupport : {n | weight n ≠ ⊥}.Finite
  pure : ∀ n, Hodge.HodgeStructureOn (ℂ ⊗[ℝ] weight n)
    (Hodge.complexificationConjugation (weight n)) n

def gradedRealHodge := GradedRealHodge V

lemma gradedWeight (H : gradedRealHodge V) (m n : ℤ) (h : m ≠ n) :
    Disjoint (H.weight m) (H.weight n) := by sorry
lemma gradedPure (H : gradedRealHodge V) (n : ℤ) :
    ∀ p, IsCompl ((H.pure n).F p)
      (((H.pure n).F (n+1-p)).map
        (Hodge.complexificationConjugation (H.weight n)).toEquiv.toLinearMap) := by sorry
lemma gradedSupport (H : gradedRealHodge V) :
    {n | H.weight n ≠ ⊥}.Finite ∧ (⨆ n, H.weight n) = ⊤ := by sorry
end Grading

def tateGrading (m : ℤ) : gradedRealHodge ℝ := sorry

def twoWeightGrading : gradedRealHodge (ℝ × ℝ) := sorry
-- TauCeti.Shimura.tests.gradedZero
example (H : gradedRealHodge (Fin 0 → ℝ)) (n : ℤ) : H.weight n = ⊥ := by sorry
-- TauCeti.Shimura.tests.gradedTwoWeights
example : Module.finrank ℝ (twoWeightGrading.weight 0) = 1 ∧
    Module.finrank ℝ (twoWeightGrading.weight (-2)) = 1 := by sorry
-- TauCeti.Shimura.tests.gradedTate
example : (tateGrading 1).weight (-2) = ⊤ := by sorry

section SplitRepresentation
variable {W C : Type*} [AddCommGroup W] [Module ℂ W] [Module.Finite ℂ W]
    [CommRing C] [Algebra ℂ C] [Coalgebra ℂ C] [Comodule ℂ C W]
    (π : C →ₗc[ℂ] MonoidAlgebra ℂ (Multiplicative (ℤ × ℤ)))

def hodgePiece (p q : ℤ) : Submodule ℂ W :=
  DiagonalizableGroup.weightSpace W π (Multiplicative.ofAdd (-p,-q))
lemma hodgePieceAction (p q : ℤ) (v : W) : v ∈ hodgePiece π p q ↔
    TensorProduct.map LinearMap.id π.toLinearMap (Comodule.coact (R := ℂ) (C := C) (M := W) v) =
      v ⊗ₜ[ℂ] MonoidAlgebra.single (Multiplicative.ofAdd (-p,-q)) 1 := by sorry
-- The descent compatibility equation is supplied, not hidden in a proposition field.
lemma conjHodgePiece (ω : Hodge.Conjugation W)
    (hc : ∀ p q, (hodgePiece π p q).map ω.toEquiv.toLinearMap = hodgePiece π q p)
    (p q : ℤ) : (hodgePiece π p q).map ω.toEquiv.toLinearMap = hodgePiece π q p := by sorry
lemma hodgePieceInternal : DirectSum.IsInternal
    (fun x : ℤ × ℤ => hodgePiece π x.1 x.2) := by sorry
lemma conjugationPieces (ω : Hodge.Conjugation W)
    (hc : ∀ p q, (hodgePiece π p q).map ω.toEquiv.toLinearMap = hodgePiece π q p)
    (p q : ℤ) : (hodgePiece π p q).map ω.toEquiv.toLinearMap = hodgePiece π q p := by sorry
-- TauCeti.Shimura.tests.pieceTrivial
example (h : ∀ a, DiagonalizableGroup.weightSpace W π a =
    if a = 1 then ⊤ else ⊥) : hodgePiece π 0 0 = ⊤ := by sorry
-- TauCeti.Shimura.tests.pieceNorm
example (h : ∀ a, DiagonalizableGroup.weightSpace W π a =
    if a = Multiplicative.ofAdd (1,1) then ⊤ else ⊥) :
    hodgePiece π (-1) (-1) = ⊤ ∧ hodgePiece π 1 1 = ⊥ := by sorry
-- TauCeti.Shimura.tests.pieceStandard
example (h : Module.finrank ℂ (DiagonalizableGroup.weightSpace W π
    (Multiplicative.ofAdd (1,0))) = 1 ∧ Module.finrank ℂ
    (DiagonalizableGroup.weightSpace W π (Multiplicative.ofAdd (0,1))) = 1) :
    Module.finrank ℂ (hodgePiece π (-1) 0) = 1 ∧
    Module.finrank ℂ (hodgePiece π 0 (-1)) = 1 := by sorry
end SplitRepresentation

section PureComparison
variable {W : Type*} [AddCommGroup W] [Module ℂ W]
    (ω : Hodge.Conjugation W) (n : ℤ) (H : ℤ → Submodule ℂ W)
    (hH : Hodge.IsHodgeDecomposition ω n H)
-- The real descent carrier and diagonal weight summand are omitted; this is the pure interface.
def hodgeOfRepresentation : Hodge.HodgeStructureOn W ω n := Hodge.HodgeStructureOn.ofDecomposition hH
lemma hodgeOfRepresentationPiece (p : ℤ) : (hodgeOfRepresentation ω n H hH).piece p = H p := by sorry
lemma hodgeOfRepresentationFiltration (p : ℤ) :
    (hodgeOfRepresentation ω n H hH).F p = ⨆ q, ⨆ (_ : p ≤ q), H q := by sorry
lemma hodgeOfRepresentationOpposed (p : ℤ) : IsCompl
    ((hodgeOfRepresentation ω n H hH).F p)
    (((hodgeOfRepresentation ω n H hH).F (n+1-p)).map ω.toEquiv.toLinearMap) := by sorry
end PureComparison
-- TauCeti.Shimura.tests.pureTateFiltration
example : (Hodge.tate 1).F (-1) = ⊤ ∧ (Hodge.tate 1).F 0 = ⊥ := by sorry
-- TauCeti.Shimura.tests.pureZero
example (ω : Hodge.Conjugation (Fin 0 → ℂ)) (n p : ℤ)
    (H : Hodge.HodgeStructureOn (Fin 0 → ℂ) ω n) : H.F p = ⊥ := by sorry
-- TauCeti.Shimura.tests.pureElliptic
example {W : Type*} [AddCommGroup W] [Module ℂ W] (ω : Hodge.Conjugation W)
    (H : Hodge.HodgeStructureOn W ω (-1)) (h : H.F (-1) = ⊤ ∧ H.F 1 = ⊥) :
    H.piece 0 = H.F 0 := by sorry

section InverseComparison
variable {W : Type*} [AddCommGroup W] [Module ℂ W] [Module.Finite ℂ W]
    {ω : Hodge.Conjugation W} {n : ℤ}
-- Returns the split coaction; real comodule descent is an explicit R1 request.
def representationOfHodge (H : Hodge.HodgeStructureOn W ω n) :
    W →ₗ[ℂ] (W ⊗[ℂ] MonoidAlgebra ℂ (Multiplicative (ℤ × ℤ))) := sorry
lemma representationOfHodgePiece (H : Hodge.HodgeStructureOn W ω n)
    (p : ℤ) (v : W) (hv : v ∈ H.piece p) :
    representationOfHodge H v = v ⊗ₜ[ℂ]
      MonoidAlgebra.single (Multiplicative.ofAdd (-p, -(n-p))) 1 := by sorry
lemma representationOfHodgeReal (H : Hodge.HodgeStructureOn W ω n)
    (p : ℤ) : (H.piece p).map ω.toEquiv.toLinearMap = H.piece (n-p) := by sorry
lemma representationOfHodgePure (H : Hodge.HodgeStructureOn W ω n) :
    Hodge.HodgeStructureOn.ofDecomposition H.isHodgeDecomposition_piece = H := by sorry
lemma comparisonRoundtrip (H : Hodge.HodgeStructureOn W ω n) :
    (Hodge.HodgeStructureOn.decompositionEquiv ω n).symm
      ((Hodge.HodgeStructureOn.decompositionEquiv ω n) H) = H := by sorry
-- Object-level pure equivalence; full graded/comodule categorical equivalence needs R1 descent.
def representationHodgeEquivalence : Hodge.HodgeStructureOn W ω n ≃
    {H : ℤ → Submodule ℂ W // Hodge.IsHodgeDecomposition ω n H} :=
  Hodge.HodgeStructureOn.decompositionEquiv ω n
lemma dualComparison (H : Hodge.HodgeStructureOn W ω n) (p : ℤ) :
    H.dual.F p = (H.F (1-p)).dualAnnihilator := by sorry
lemma tateComparison (H : Hodge.HodgeStructureOn W ω n) (m p : ℤ) :
    (H.tateTwist m).F p = H.F (p+m) := by sorry
lemma weilOperatorSign (H : Hodge.HodgeStructureOn W ω n)
    (hI : W →ₗ[ℂ] W)
    (hh : ∀ p v, v ∈ H.piece p → hI v = Complex.I ^ (n-2*p) • v) :
    hI.comp H.weilOperator = LinearMap.id := by sorry
end InverseComparison
-- TauCeti.Shimura.tests.inverseTrivial
example : representationOfHodge (Hodge.tate 0) 1 =
    (1 : ℂ) ⊗ₜ[ℂ] MonoidAlgebra.single (Multiplicative.ofAdd (0,0)) 1 := by sorry
-- TauCeti.Shimura.tests.inverseTate
example : representationOfHodge (Hodge.tate 1) 1 =
    (1 : ℂ) ⊗ₜ[ℂ] MonoidAlgebra.single (Multiplicative.ofAdd (1,1)) 1 := by sorry
-- TauCeti.Shimura.tests.inverseTwoWeights
example (v w : ℂ) : (representationOfHodge (Hodge.tate 0) v,
    representationOfHodge (Hodge.tate 1) w) =
    (v ⊗ₜ[ℂ] MonoidAlgebra.single (Multiplicative.ofAdd (0,0)) 1,
     w ⊗ₜ[ℂ] MonoidAlgebra.single (Multiplicative.ofAdd (1,1)) 1) := by sorry

lemma tensorComparison {V W : Type*} [AddCommGroup V] [Module ℂ V]
    [AddCommGroup W] [Module ℂ W] {ω : Hodge.Conjugation V} {η : Hodge.Conjugation W}
    {m n : ℤ} (H : Hodge.HodgeStructureOn V ω m) (K : Hodge.HodgeStructureOn W η n)
    (p : ℤ) : (H.tensorProduct K).piece p =
      ⨆ a : ℤ, Submodule.map₂ (TensorProduct.mk ℂ V W) (H.piece a) (K.piece (p-a)) := by sorry
-- Rational descent of a Gm map is omitted; these are its rational grading conclusions.
lemma rationalWeightCriterion {V : Type*} [AddCommGroup V] [Module ℚ V]
    (w : ℤ → Submodule ℚ V) (hw : DirectSum.IsInternal w) : (⨆ n, w n) = ⊤ := by sorry
lemma testObjects : (Hodge.tate 0).piece 0 = ⊤ := by sorry
lemma tateTestObject : (Hodge.tate 1).piece (-1) = ⊤ := by sorry
-- Explicit split homology and adjoint weight actions, with descent omitted.
private def ellipticMu (z : ℂ) : Matrix (Fin 2) (Fin 2) ℂ := Matrix.diagonal ![z,1]
lemma ellipticHomologyObject (z : ℂ) : ellipticMu z *ᵥ ![1,0] = ![z,0] ∧
    ellipticMu z *ᵥ ![0,1] = ![0,1] := by sorry
lemma adjointGl2Object (z : ℂ) (hz : z ≠ 0) :
    ellipticMu z * !![0,1;0,0] * ellipticMu z⁻¹ = z • !![0,1;0,0] ∧
    ellipticMu z * !![0,0;1,0] * ellipticMu z⁻¹ = z⁻¹ • !![0,0;1,0] := by sorry

/- MT: a supplied family of rational algebraic subgroup point sets is used. The Hopf-ideal
intersection and its representing algebraic group are the explicit R0 request. -/
def mumfordTateGroup {G : Type*} [Group G] (rationalSubgroups : Set (Subgroup G))
    (h : ℂˣ →* G) : Subgroup G :=
  sInf {K | K ∈ rationalSubgroups ∧ Set.range h ⊆ K}
lemma mumfordTateMinimal {G : Type*} [Group G] (A : Set (Subgroup G))
    (h : ℂˣ →* G) (K : Subgroup G) (hK : K ∈ A) (hh : Set.range h ⊆ K) :
    mumfordTateGroup A h ≤ K := by sorry
lemma mumfordTateWeight {G : Type*} [Group G] (A : Set (Subgroup G))
    (h : ℂˣ →* G) (t : ℂˣ) : h t ∈ mumfordTateGroup A h := by sorry
lemma mumfordTateIsomorphism {G H : Type*} [Group G] [Group H]
    (e : G ≃* H) (A : Set (Subgroup G)) (h : ℂˣ →* G) :
    (mumfordTateGroup A h).map e.toMonoidHom =
      mumfordTateGroup ((fun K => K.map e.toMonoidHom) '' A) (e.toMonoidHom.comp h) := by sorry
-- TauCeti.Shimura.tests.mtTrivial
example {G : Type*} [Group G] : mumfordTateGroup Set.univ (1 : ℂˣ →* G) = ⊥ := by sorry
-- TauCeti.Shimura.tests.mtTate
example : mumfordTateGroup Set.univ (MonoidHom.id ℂˣ) = ⊤ := by sorry
-- TauCeti.Shimura.tests.mtCmElliptic
example (T : Subgroup (Matrix.GeneralLinearGroup (Fin 2) ℂ)) (hT : T ≠ ⊤)
    (h : ℂˣ →* Matrix.GeneralLinearGroup (Fin 2) ℂ) (hh : h.range = T) :
    mumfordTateGroup Set.univ h ≠ ⊤ := by sorry
-- Uses a supplied ambient rational similitude subgroup; H¹(A) extraction is omitted.
def hodgeGeneric {G : Type*} [Group G] (MT GSp : Subgroup G) : Prop := MT = GSp
lemma hodgeGenericBasis {G H : Type*} [Group G] [Group H]
    (e : G ≃* H) (MT GSp : Subgroup G) : hodgeGeneric MT GSp ↔
      hodgeGeneric (MT.map e.toMonoidHom) (GSp.map e.toMonoidHom) := by sorry
lemma hodgeGenericIsogeny {G : Type*} [Group G] (MT MT' GSp : Subgroup G)
    (h : MT = MT') : hodgeGeneric MT GSp ↔ hodgeGeneric MT' GSp := by sorry
lemma hodgeGenericElliptic {G : Type*} [Group G] (MT T GSp : Subgroup G)
    (h : MT = GSp ∨ MT = T) (hT : T ≠ GSp) : hodgeGeneric MT GSp ↔ MT ≠ T := by sorry
-- TauCeti.Shimura.tests.genericCmFalse
example {G : Type*} [Group G] (T GSp : Subgroup G) (h : T ≠ GSp) : ¬ hodgeGeneric T GSp := by sorry
-- TauCeti.Shimura.tests.genericNonCmElliptic
example {G : Type*} [Group G] (GSp : Subgroup G) : hodgeGeneric GSp GSp := by sorry
-- TauCeti.Shimura.tests.genericProductFalse
example {G : Type*} [Group G] (P GSp : Subgroup G) (h : P < GSp) : ¬ hodgeGeneric P GSp := by sorry

/- D2: linear part of the Hodge complex structure. Closed quotient/complex chart conditions
are omitted, as are Cartan compact-real-form and rational simple-factor interfaces. -/
section Tangent
variable {T : Type*} [AddCommGroup T] [Module ℝ T]
    [FiniteDimensional ℝ T]
    (H : Hodge.HodgeStructureOn (ℂ ⊗[ℝ] T) (Hodge.complexificationConjugation T) 0)

def hodgeTangentOperator : T →ₗ[ℝ] T := sorry
lemma hodgeTangentSquare (h0 : H.piece 0 = ⊥)
    (hother : ∀ p : ℤ, p ≠ -1 → p ≠ 1 → H.piece p = ⊥) :
    (hodgeTangentOperator H).comp (hodgeTangentOperator H) = -LinearMap.id := by sorry
lemma hodgeTangentPositive (v : ℂ ⊗[ℝ] T) (hv : v ∈ H.piece (-1)) :
    TensorProduct.map (LinearMap.id : ℂ →ₗ[ℝ] ℂ) (hodgeTangentOperator H) v = Complex.I • v := by sorry
lemma hodgeTangentEquivariant (a : T ≃ₗ[ℝ] T)
    (ha : ∀ p, (H.piece p).map
      (TensorProduct.map (LinearMap.id : ℂ →ₗ[ℝ] ℂ) a.toLinearMap) = H.piece p) :
    a.toLinearMap.comp (hodgeTangentOperator H) = (hodgeTangentOperator H).comp a.toLinearMap := by sorry
-- TauCeti.Shimura.tests.tangentGl2
example (e : T ≃ₗ[ℝ] ℂ) (h : ∀ v, e (hodgeTangentOperator H v) = Complex.I * e v) :
    ∀ v, e ((hodgeTangentOperator H).comp (hodgeTangentOperator H) v) = -e v := by sorry
-- TauCeti.Shimura.tests.tangentTorus
example [Subsingleton T] : hodgeTangentOperator H = 0 := by sorry
-- TauCeti.Shimura.tests.tangentProduct
example (J K : T →ₗ[ℝ] T) (hJ : J.comp J = -LinearMap.id)
    (hK : K.comp K = -LinearMap.id) :
    (J.prodMap K).comp (J.prodMap K) = -LinearMap.id := by sorry
end Tangent

lemma cartanAdjointCriterion {𝔤 : Type*} [AddCommGroup 𝔤] [Module ℝ 𝔤]
    (B : 𝔤 →ₗ[ℝ] 𝔤 →ₗ[ℝ] ℝ) (θ : 𝔤 ≃ₗ[ℝ] 𝔤) :
    (∀ x, x ≠ 0 → 0 < -B x (θ x)) ↔ (∀ x, x ≠ 0 → B x (θ x) < 0) := by sorry
lemma shimuraCartanInvolution {G : Type*} [Group G] (h : ℂˣ →* G)
    (i : ℂˣ) (hi : i*i = -1) (hz : h (-1) ∈ Subgroup.center G) :
    ∀ g, h i * (h i * g * (h i)⁻¹) * (h i)⁻¹ = g := by sorry
lemma stabilizerH {G : Type*} [Group G] (h : ℂˣ →* G) (g : G) :
    (∀ z, g * h z * g⁻¹ = h z) ↔ g ∈ Subgroup.centralizer (Set.range h) := by sorry
lemma tangentQuotient {𝔤 : Type*} [AddCommGroup 𝔤] [Module ℝ 𝔤]
    (𝔨 : Submodule ℝ 𝔤) (x : 𝔤) :
    Submodule.mkQ 𝔨 x = 0 ↔ x ∈ 𝔨 := by sorry
lemma adjointBracket {𝔤 : Type*} [LieRing 𝔤] [LieAlgebra ℂ 𝔤]
    (F : ℤ → Submodule ℂ 𝔤)
    (hF : ∀ p q x y, x ∈ F p → y ∈ F q → ⁅x,y⁆ ∈ F (p+q))
    (p q : ℤ) (x y : 𝔤) (hx : x ∈ F p) (hy : y ∈ F q) : ⁅x,y⁆ ∈ F (p+q) := by sorry
lemma filtrationLieSubalgebra {𝔤 : Type*} [LieRing 𝔤] [LieAlgebra ℂ 𝔤]
    (F : ℤ → Submodule ℂ 𝔤)
    (hF : ∀ p q x y, x ∈ F p → y ∈ F q → ⁅x,y⁆ ∈ F (p+q)) :
    ∀ x y, x ∈ F 0 → y ∈ F 0 → ⁅x,y⁆ ∈ F 0 := by sorry
-- Integrability target at Lie-algebra level; holomorphic quotient charts are an L4 request.
lemma hodgeIntegrability {𝔤 : Type*} [LieRing 𝔤] [LieAlgebra ℂ 𝔤]
    (𝔭 : LieSubalgebra ℂ 𝔤) : ∀ x y, x ∈ 𝔭 → y ∈ 𝔭 → ⁅x,y⁆ ∈ 𝔭 := by sorry
lemma quotientSeparation {G : Type*} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    (K : Subgroup G) (hK : IsClosed (K : Set G)) : T2Space (G ⧸ K) := by sorry
lemma compactRealFactor {T : Type*} [AddCommGroup T] [Module ℝ T]
    (J : T →ₗ[ℝ] T) (hJ : J.comp J = -LinearMap.id) (htriv : J = 0) :
    ∀ x : T, x = 0 := by sorry
-- Chart and symmetric-space structures are unavailable. These signatures retain the
-- noncompact tangent and uniquely determined holomorphic tangent operator.
lemma hermitianDomainComponents {T : Type*} [AddCommGroup T] [Module ℝ T]
    (J : T →ₗ[ℝ] T) (hJ : J.comp J = -LinearMap.id) : ∀ x, J (J x) = -x := by sorry
lemma uniqueComplexStructure {T : Type*} [AddCommGroup T] [Module ℝ T]
    (J K : T →ₗ[ℝ] T) (h : ∀ v, J v = K v) : J = K := by sorry

/- D3: actual local-system fiber carrier; bundle/connection/holomorphic conditions omitted.
Finite rank and fiber purity are retained. This is not the full VHS definition. -/
structure VariationFibers (B : TopCat) (n : ℤ) where
  localSystem : TauCeti.LocalCoefficientSystem ℝ B
  finite : ∀ b : B, Module.Finite ℝ (localSystem.obj (FundamentalGroupoid.mk b))
  fiber : ∀ b : B, Hodge.HodgeStructureOn
    (ℂ ⊗[ℝ] localSystem.obj (FundamentalGroupoid.mk b))
    (Hodge.complexificationConjugation (localSystem.obj (FundamentalGroupoid.mk b))) n

def variation (B : TopCat) (n : ℤ) := VariationFibers B n

def constantVariation (B : TopCat) {V : Type*} [AddCommGroup V] [Module ℝ V]
    [Module.Finite ℝ V] {n : ℤ}
    (H : Hodge.HodgeStructureOn (ℂ ⊗[ℝ] V) (Hodge.complexificationConjugation V) n) :
    variation B n := sorry

lemma variationFiber {B : TopCat} {n : ℤ} (H : variation B n) (b : B) (p : ℤ) :
    IsCompl ((H.fiber b).F p) (((H.fiber b).F (n+1-p)).map
      (Hodge.complexificationConjugation (H.localSystem.obj (FundamentalGroupoid.mk b))).toEquiv.toLinearMap) := by sorry

def pullbackVariation {B C : TopCat} (f : C(B,C)) {n : ℤ} (H : variation C n) : variation B n := sorry
lemma variationPullback {B C : TopCat} (f : C(B,C)) {n : ℤ} (H : variation C n) :
    (pullbackVariation f H).localSystem = (TauCeti.LocalCoefficientSystem.pullback f).obj H.localSystem := by sorry
lemma variationMorphism {B : TopCat} {n : ℤ} (H K L : variation B n)
    (f : H.localSystem ⟶ K.localSystem) (g : K.localSystem ⟶ L.localSystem)
    (hf : ∀ b p, ∀ x ∈ (H.fiber b).F p,
      TensorProduct.map (LinearMap.id : ℂ →ₗ[ℝ] ℂ) (f.app (FundamentalGroupoid.mk b)).hom x ∈ (K.fiber b).F p)
    (hg : ∀ b p, ∀ x ∈ (K.fiber b).F p,
      TensorProduct.map (LinearMap.id : ℂ →ₗ[ℝ] ℂ) (g.app (FundamentalGroupoid.mk b)).hom x ∈ (L.fiber b).F p) :
    ∀ b p, ∀ x ∈ (H.fiber b).F p,
      TensorProduct.map (LinearMap.id : ℂ →ₗ[ℝ] ℂ) ((f ≫ g).app (FundamentalGroupoid.mk b)).hom x ∈ (L.fiber b).F p := by sorry
-- TauCeti.Shimura.tests.variationConstant
example {B : TopCat} {V : Type*} [AddCommGroup V] [Module ℝ V] [Module.Finite ℝ V]
    {n : ℤ} (H : Hodge.HodgeStructureOn (ℂ ⊗[ℝ] V) (Hodge.complexificationConjugation V) n) :
    (constantVariation B H).localSystem = (TauCeti.LocalCoefficientSystem.constantFunctor B).obj (ModuleCat.of ℝ V) := by sorry
-- Elliptic period-line test; the flat rank-two local system is constant on ℍ.
def ellipticFiltration (τ : ℂ) (p : ℤ) : Submodule ℂ (Fin 2 → ℂ) := sorry
-- TauCeti.Shimura.tests.variationElliptic
example (τ : ℂ) (hτ : 0 < τ.im) : ellipticFiltration τ 1 =
    Submodule.span ℂ {![τ,1]} ∧ ellipticFiltration τ 0 = ⊤ := by sorry
-- TauCeti.Shimura.tests.variationNonHorizontal
example : (![0,0,0,1] : Fin 4 → ℂ) ∉
    Submodule.span ℂ {![1,0,0,0], ![0,1,0,0]} := by sorry

structure IntegralVariationFibers (B : TopCat) (n : ℤ) where
  lattice : TauCeti.LocalCoefficientSystem ℤ B
  free : ∀ b : B, Module.Free ℤ (lattice.obj (FundamentalGroupoid.mk b))
  finite : ∀ b : B, Module.Finite ℤ (lattice.obj (FundamentalGroupoid.mk b))
  fiber : ∀ b : B, Hodge.HodgeStructureOn
    (ℂ ⊗[ℝ] (ℝ ⊗[ℤ] lattice.obj (FundamentalGroupoid.mk b)))
    (Hodge.complexificationConjugation (ℝ ⊗[ℤ] lattice.obj (FundamentalGroupoid.mk b))) n
  pairing : ∀ b : B, lattice.obj (FundamentalGroupoid.mk b) →ₗ[ℤ]
    lattice.obj (FundamentalGroupoid.mk b) →ₗ[ℤ] ℤ
  parallel : ∀ (b c : B) (γ : Path.Homotopic.Quotient b c) x y,
    pairing c (TauCeti.LocalCoefficientSystem.transport lattice γ x)
      (TauCeti.LocalCoefficientSystem.transport lattice γ y) = pairing b x y
-- H1 positivity, rationalization and connection compatibility are omitted, not Prop stubs.
def polarizedIntegralVariation (B : TopCat) (n : ℤ) := IntegralVariationFibers B n
lemma integralVariationRational {B : TopCat} {n : ℤ} (H : polarizedIntegralVariation B n)
    (b : B) : Module.Finite ℚ (ℚ ⊗[ℤ] H.lattice.obj (FundamentalGroupoid.mk b)) := by sorry
lemma integralVariationPairing {B : TopCat} {n : ℤ} (H : polarizedIntegralVariation B n)
    {b c : B} (γ : Path.Homotopic.Quotient b c)
    :
    ∀ x y, H.pairing c (TauCeti.LocalCoefficientSystem.transport H.lattice γ x)
      (TauCeti.LocalCoefficientSystem.transport H.lattice γ y) = H.pairing b x y := by sorry
lemma integralVariationPullback {B C : TopCat} (f : C(B,C)) {n : ℤ}
    (H : polarizedIntegralVariation C n) (b : B) :
    Module.Free ℤ (((TauCeti.LocalCoefficientSystem.pullback f).obj H.lattice).obj
      (FundamentalGroupoid.mk b)) := by sorry
-- TauCeti.Shimura.tests.integralConstantTate
example : (Hodge.tate 1).F (-1) = ⊤ ∧ Module.finrank ℤ ℤ = 1 := by sorry
-- TauCeti.Shimura.tests.integralScaledPairing
example : ¬ IsUnit (2 : ℤ) ∧ ∀ x : ℝ, x ≠ 0 → 0 < 2*x^2 := by sorry
-- TauCeti.Shimura.tests.integralMonodromy
example : ( !![1,1;0,1] : Matrix (Fin 2) (Fin 2) ℤ).det = 1 ∧
    ( !![1,1;0,1] : Matrix (Fin 2) (Fin 2) ℤ).transpose * !![0,1;-1,0] * !![1,1;0,1] = !![0,1;-1,0] ∧
    ( !![1,1;0,1] : Matrix (Fin 2) (Fin 2) ℤ) *ᵥ ![0,1] ≠ ![0,1] := by sorry
lemma flatBundleLocal {B : TopCat} (L : TauCeti.LocalCoefficientSystem ℝ B)
    (b : B) : TauCeti.LocalCoefficientSystem.transport L
      (Path.Homotopic.Quotient.refl b) = LinearEquiv.refl ℝ _ := by sorry

-- Filtered infinitesimal criterion; the connection/Ω¹ realization is absent.
def Horizontal {T V : Type*} [AddCommGroup T] [Module ℂ T] [AddCommGroup V] [Module ℂ V]
    (F : ℤ → Submodule ℂ V) (d : T →ₗ[ℂ] Module.End ℂ V) : Prop :=
  ∀ p t v, v ∈ F p → d t v ∈ F (p-1)
lemma transversalityTangent {T V : Type*} [AddCommGroup T] [Module ℂ T]
    [AddCommGroup V] [Module ℂ V] (F : ℤ → Submodule ℂ V)
    (d : T →ₗ[ℂ] Module.End ℂ V) : Horizontal F d ↔
      ∀ p t, F p ≤ (F (p-1)).comap (d t) := by sorry
-- Constant local system with supplied Hodge fibers; holomorphicity and horizontality omitted.
def homogeneousVariation (B : TopCat) {V : Type*} [AddCommGroup V] [Module ℝ V]
    [Module.Finite ℝ V] (n : ℤ)
    (H : B → Hodge.HodgeStructureOn (ℂ ⊗[ℝ] V) (Hodge.complexificationConjugation V) n) :
    variation B n := sorry
lemma homogeneousFiber (B : TopCat) {V : Type*} [AddCommGroup V] [Module ℝ V]
    [Module.Finite ℝ V] (n : ℤ)
    (H : B → Hodge.HodgeStructureOn (ℂ ⊗[ℝ] V) (Hodge.complexificationConjugation V) n) :
    (homogeneousVariation B n H).localSystem =
      (TauCeti.LocalCoefficientSystem.constantFunctor B).obj (ModuleCat.of ℝ V) := by sorry
lemma homogeneousTransversality {T V : Type*} [AddCommGroup T] [Module ℂ T]
    [AddCommGroup V] [Module ℂ V] (F : ℤ → Submodule ℂ V)
    (d : T →ₗ[ℂ] Module.End ℂ V) (h : ∀ p t v, v ∈ F p → d t v ∈ F (p-1)) :
    Horizontal F d := by sorry
lemma homogeneousTensor {B C : TopCat} (f : C(B,C)) {V : Type*}
    [AddCommGroup V] [Module ℝ V] [Module.Finite ℝ V] (n : ℤ)
    (H : C → Hodge.HodgeStructureOn (ℂ ⊗[ℝ] V) (Hodge.complexificationConjugation V) n) :
    (pullbackVariation f (homogeneousVariation C n H)).localSystem =
      (homogeneousVariation B n (H ∘ f)).localSystem := by sorry
-- TauCeti.Shimura.tests.homogeneousTrivial
example : (Hodge.tate 0).F 0 = ⊤ ∧ (Hodge.tate 0).F 1 = ⊥ := by sorry
-- TauCeti.Shimura.tests.homogeneousSiegel
example (τ : ℂ) (hτ : 0 < τ.im) :
    ellipticFiltration τ 1 = Submodule.span ℂ {![τ,1]} ∧ ellipticFiltration τ 2 = ⊥ := by sorry
-- TauCeti.Shimura.tests.homogeneousTorus
example (F : ℤ → Submodule ℂ ℂ) : Horizontal F (0 : ℂ →ₗ[ℂ] Module.End ℂ ℂ) := by sorry
lemma homogeneousHorizontal {T V : Type*} [AddCommGroup T] [Module ℂ T]
    [AddCommGroup V] [Module ℂ V] (F : ℤ → Submodule ℂ V)
    (d : T →ₗ[ℂ] Module.End ℂ V) (hF : Antitone F)
    (h : ∀ p t v, v ∈ F p → d t v ∈ F (p-1)) : Horizontal F d := by sorry

-- Pointwise filtration stabilizer. Algebraicity/parabolic representability is omitted.
def filtrationParabolic {V : Type*} [AddCommGroup V] [Module ℂ V]
    (F : ℤ → Submodule ℂ V) : Subgroup (V ≃ₗ[ℂ] V) := sorry
lemma filtrationParabolicLie {V : Type*} [AddCommGroup V] [Module ℂ V]
    (F : ℤ → Submodule ℂ V) (a : V ≃ₗ[ℂ] V) : a ∈ filtrationParabolic F ↔
      ∀ p, (F p).map a.toLinearMap = F p := by sorry
lemma filtrationParabolicLevi {V : Type*} [AddCommGroup V] [Module ℂ V]
    (H : ℤ → Submodule ℂ V) (a : V ≃ₗ[ℂ] V)
    (h : ∀ p, (H p).map a.toLinearMap = H p) :
    a ∈ filtrationParabolic (fun p => ⨆ q, ⨆ (_ : p ≤ q), H q) := by sorry
lemma filtrationParabolicConjugate {V : Type*} [AddCommGroup V] [Module ℂ V]
    (F : ℤ → Submodule ℂ V) (a b : V ≃ₗ[ℂ] V) :
    b ∈ filtrationParabolic F ↔ a*b*a⁻¹ ∈ filtrationParabolic (fun p => (F p).map a.toLinearMap) := by sorry
-- TauCeti.Shimura.tests.parabolicGl2
example (a : (Fin 2 → ℂ) ≃ₗ[ℂ] (Fin 2 → ℂ)) :
    a ∈ filtrationParabolic (fun p => if p ≤ 0 then ⊤ else if p = 1 then Submodule.span ℂ {![1,0]} else ⊥) ↔
    ∃ c : ℂ, c ≠ 0 ∧ a ![1,0] = c • ![1,0] := by sorry
-- TauCeti.Shimura.tests.parabolicTorus
example : filtrationParabolic (fun _ : ℤ => (⊤ : Submodule ℂ ℂ)) = ⊤ := by sorry
-- TauCeti.Shimura.tests.parabolicSiegel
example (g : ℕ) (a : ((Fin g → ℂ) × (Fin g → ℂ)) ≃ₗ[ℂ] ((Fin g → ℂ) × (Fin g → ℂ)))
    (L : Submodule ℂ ((Fin g → ℂ) × (Fin g → ℂ))) :
    a ∈ filtrationParabolic (fun p => if p ≤ 0 then ⊤ else if p = 1 then L else ⊥) ↔
      L.map a.toLinearMap = L := by sorry

-- Quotient points only; the scheme, projectivity and reflex descent need R7/SF.
def compactDual (G : Type*) [Group G] (P : Subgroup G) := G ⧸ P
lemma compactDualBasepoint {G : Type*} [Group G] (P : Subgroup G) (g : G) :
    (QuotientGroup.mk g : compactDual G P) = QuotientGroup.mk 1 ↔ g ∈ P := by sorry
lemma compactDualChangePoint {G : Type*} [Group G] (P : Subgroup G) (g : G) :
    Nonempty (compactDual G P ≃ compactDual G (P.map (MulAut.conj g).toMonoidHom)) := by sorry
lemma compactDualTangent {𝔤 : Type*} [AddCommGroup 𝔤] [Module ℂ 𝔤]
    (F : Submodule ℂ 𝔤) : (Submodule.mkQ F).ker = F := by sorry
-- TauCeti.Shimura.tests.dualGl2
example (P : Subgroup ((Fin 2 → ℂ) ≃ₗ[ℂ] (Fin 2 → ℂ)))
    (hP : ∀ a, a ∈ P ↔ (Submodule.span ℂ {![1,0]}).map a.toLinearMap = Submodule.span ℂ {![1,0]}) :
    Nonempty (compactDual _ P ≃ {L : Submodule ℂ (Fin 2 → ℂ) // Module.finrank ℂ L = 1}) := by sorry
-- TauCeti.Shimura.tests.dualTorus
example {G : Type*} [Group G] : Subsingleton (compactDual G ⊤) := by sorry
-- TauCeti.Shimura.tests.dualSiegel
example (P : Subgroup ((Fin 4 → ℂ) ≃ₗ[ℂ] (Fin 4 → ℂ)))
    (L : Submodule ℂ (Fin 4 → ℂ)) (hL : Module.finrank ℂ L = 2)
    (hP : ∀ a, a ∈ P ↔ L.map a.toLinearMap = L) :
    ∃ a : (Fin 4 → ℂ) ≃ₗ[ℂ] (Fin 4 → ℂ),
      (QuotientGroup.mk a : compactDual _ P) ≠ QuotientGroup.mk 1 := by sorry
lemma borelTangent {V : Type*} [AddCommGroup V] [Module ℂ V]
    (F : Submodule ℂ V) (x y : V) : Submodule.mkQ F x = Submodule.mkQ F y ↔ x-y ∈ F := by sorry
lemma borelInjective {X Y : Type*} (f : X → Y)
    (hf : ∀ x y, f x = f y → x = y) : Function.Injective f := by sorry
lemma borelEmbedding {X Y : Type*} [TopologicalSpace X] [TopologicalSpace Y]
    (f : X → Y) (hf : Topology.IsOpenEmbedding f) : Topology.IsEmbedding f := by sorry

-- Supplier G_C action on its actual cocharacter carrier A, not a representative μ field.
def cocharacterClass {G A : Type*} [Group G] [MulAction G A] (μ : A) : Set A := MulAction.orbit G μ
lemma cocharacterClassIndependent {G A : Type*} [Group G] [MulAction G A] (μ : A) (g : G) :
    cocharacterClass (g • μ) = cocharacterClass μ := by sorry
lemma cocharacterClassGalois {G A : Type*} [Group G] [MulAction G A] (μ : A)
    (σ : A ≃ A) (τ : G ≃* G) (h : ∀ g a, σ (g • a) = τ g • σ a) :
    σ '' cocharacterClass μ = cocharacterClass (σ μ) := by sorry
lemma cocharacterClassMap {G H A B : Type*} [Group G] [Group H]
    [MulAction G A] [MulAction H B] (f : G →* H) (φ : A → B)
    (h : ∀ g a, φ (g • a) = f g • φ a) (μ : A) : φ '' cocharacterClass μ ⊆ cocharacterClass (φ μ) := by sorry
-- TauCeti.Shimura.tests.classTorus
example {A : Type*} (μ : A) : @cocharacterClass PUnit A inferInstance inferInstance μ = {μ} := by sorry
-- TauCeti.Shimura.tests.classGl2
example {G A : Type*} [Group G] [MulAction G A] (μ : A) (g : G) : g • μ ∈ cocharacterClass μ := by sorry
-- TauCeti.Shimura.tests.classProduct
example {G H A B : Type*} [Group G] [Group H] [MulAction G A] [MulAction H B]
    (μ : A) (ν : B) : cocharacterClass (G := G×H) (μ,ν) = cocharacterClass μ ×ˢ cocharacterClass ν := by sorry

abbrev Qbar := AlgebraicClosure ℚ
-- A is the supplier conjugacy-class carrier; its Galois action must be the algebraic one.
def reflexField {A : Type*} [MulAction (Qbar ≃ₐ[ℚ] Qbar) A] (c : A) : IntermediateField ℚ Qbar :=
  IntermediateField.fixedField (MulAction.stabilizer (Qbar ≃ₐ[ℚ] Qbar) c)
lemma reflexStabilizer {A : Type*} [MulAction (Qbar ≃ₐ[ℚ] Qbar) A] (c : A) (x : Qbar) :
    x ∈ reflexField c ↔ ∀ σ : Qbar ≃ₐ[ℚ] Qbar, σ • c = c → σ x = x := by sorry
lemma reflexMap {A B : Type*} [MulAction (Qbar ≃ₐ[ℚ] Qbar) A]
    [MulAction (Qbar ≃ₐ[ℚ] Qbar) B] (f : A → B) (c : A)
    (hf : ∀ σ a, f (σ • a) = σ • f a) : reflexField (f c) ≤ reflexField c := by sorry
lemma reflexProduct {A B : Type*} [MulAction (Qbar ≃ₐ[ℚ] Qbar) A]
    [MulAction (Qbar ≃ₐ[ℚ] Qbar) B] (a : A) (b : B)
    (Ka Kb : IntermediateField ℚ Qbar)
    [FiniteDimensional ℚ Ka] [FiniteDimensional ℚ Kb]
    (ha : MulAction.stabilizer (Qbar ≃ₐ[ℚ] Qbar) a = Ka.fixingSubgroup)
    (hb : MulAction.stabilizer (Qbar ≃ₐ[ℚ] Qbar) b = Kb.fixingSubgroup) :
    reflexField (a,b) = reflexField a ⊔ reflexField b := by sorry
-- TauCeti.Shimura.tests.reflexGl2
example {A : Type*} [MulAction (Qbar ≃ₐ[ℚ] Qbar) A] (c : A)
    (h : ∀ σ : Qbar ≃ₐ[ℚ] Qbar, σ • c = c) : reflexField c = ⊥ := by sorry
-- TauCeti.Shimura.tests.reflexCm
example (K : IntermediateField ℚ Qbar) : IntermediateField.fixedField K.fixingSubgroup = K := by sorry
-- TauCeti.Shimura.tests.reflexProductCm
example (K L : IntermediateField ℚ Qbar) : K ≤ K ⊔ L ∧ L ≤ K ⊔ L := by sorry
lemma reflexStabilizerOpen {A : Type*} [MulAction (Qbar ≃ₐ[ℚ] Qbar) A]
    (c : A) (K : IntermediateField ℚ Qbar) [FiniteDimensional ℚ K]
    (hK : K.fixingSubgroup ≤ MulAction.stabilizer (Qbar ≃ₐ[ℚ] Qbar) c) : reflexField c ≤ K := by sorry
lemma reflexFinite {A : Type*} [MulAction (Qbar ≃ₐ[ℚ] Qbar) A]
    (c : A) (K : IntermediateField ℚ Qbar) [FiniteDimensional ℚ K]
    (hK : K.fixingSubgroup ≤ MulAction.stabilizer (Qbar ≃ₐ[ℚ] Qbar) c) :
    FiniteDimensional ℚ (reflexField c) := by sorry
-- Scheme descent and projectivity predicates are not included in the point prototype.
-- A descent datum and its effective projective descent are the R7/SF supplier target.
theorem reflexFlagDescent (X : AlgebraicGeometry.Scheme) (E : IntermediateField ℚ Qbar)
    (structureMap : X ⟶ AlgebraicGeometry.Scheme.Spec.obj (Opposite.op (CommRingCat.of E))) :
    ∃ Y : AlgebraicGeometry.Scheme,
      Nonempty (Y ≅ X) ∧ Nonempty (Y ⟶ AlgebraicGeometry.Scheme.Spec.obj (Opposite.op (CommRingCat.of E))) := by sorry

/- General Kostant combinatorics with supplier Coxeter data. The Coxeter/parabolic hypotheses
on `len` and `M` are omitted from these signatures; minimality itself is explicit. -/
def kostantRepresentatives {W : Type*} [Group W] (M : Subgroup W) (len : W → ℕ) : Set W :=
  {w | ∀ m ∈ M, len w ≤ len (m*w)}
lemma kostantUnique {W : Type*} [Group W] (M : Subgroup W) (len : W → ℕ) (w : W) :
    ∃! u, u ∈ kostantRepresentatives M len ∧ ∃ m ∈ M, w = m*u := by sorry
lemma kostantPositive {W R : Type*} [Group W] [MulAction W R]
    (M : Subgroup W) (len : W → ℕ) (positive leviPositive : Set R) (w : W) :
    w ∈ kostantRepresentatives M len ↔ ∀ α ∈ leviPositive, w⁻¹ • α ∈ positive := by sorry
lemma kostantLengthAdd {W : Type*} [Group W] (M : Subgroup W) (len : W → ℕ)
    (u w : W) (hu : u ∈ M) (hw : w ∈ kostantRepresentatives M len) : len (u*w) = len u + len w := by sorry
-- TauCeti.Shimura.tests.kostantBorel
example {W : Type*} [Group W] (len : W → ℕ) : kostantRepresentatives ⊥ len = Set.univ := by sorry
-- TauCeti.Shimura.tests.kostantWholeGroup
example {W : Type*} [Group W] (len : W → ℕ) (hzero : ∀ w, len w = 0 ↔ w = 1) :
    kostantRepresentatives ⊤ len = {1} := by sorry
private def a2Length (w : Equiv.Perm (Fin 3)) : ℕ :=
  (Finset.univ.filter (fun p : Fin 3 × Fin 3 => p.1 < p.2 ∧ w p.2 < w p.1)).card
-- TauCeti.Shimura.tests.kostantA2Left
example : kostantRepresentatives (Subgroup.closure {Equiv.swap (0 : Fin 3) 1}) a2Length =
    {1, Equiv.swap (1 : Fin 3) 2, Equiv.swap (1 : Fin 3) 2 * Equiv.swap (0 : Fin 3) 1} := by sorry
lemma kostantConeCriterion {W A : Type*} [Group W] [MulAction W A]
    (M : Subgroup W) (len : W → ℕ) (C CM : Set A) (w : W) :
    w ∈ kostantRepresentatives M len ↔ (fun a => w • a) '' C ⊆ CM := by sorry
lemma kostantCones {W A : Type*} [Group W] [MulAction W A]
    (M : Subgroup W) (len : W → ℕ) (C CM : Set A) :
    CM = ⋃ w ∈ kostantRepresentatives M len, (fun a => w • a) '' C := by sorry
lemma kostantInvolution {W : Type*} [Group W] (M : Subgroup W) (len : W → ℕ)
    (wM wG w : W) (hM : wM*wM=1) (hG : wG*wG=1)
    (hw : w ∈ kostantRepresentatives M len) :
    wM*w*wG ∈ kostantRepresentatives M len ∧ wM*(wM*w*wG)*wG = w := by sorry
-- Scheme cells and their base-change-compatible affine isomorphisms are supplied by RG9.
lemma bruhatIntegral {W : Type*} (len : W → ℕ) (cells : W → AlgebraicGeometry.Scheme)
    (affineSpace : ℕ → AlgebraicGeometry.Scheme) (w : W) : Nonempty (cells w ≅ affineSpace (len w)) := by sorry

-- Underlying loci; schematic closures/flatness/base change are absent, explicitly requested.
def schubertFamilies {X W : Type*} [TopologicalSpace X] [Preorder W]
    (cells oppositeCells : W → Set X) (w : W) : Set X × Set X × Set X :=
  (closure (cells w), closure (oppositeCells w), ⋃ v, ⋃ (_ : w ≤ v), cells v)
lemma schubertClosure {X W : Type*} [TopologicalSpace X] [Preorder W]
    (C C' : W → Set X) (w : W) : (schubertFamilies C C' w).1 = ⋃ v, ⋃ (_ : v ≤ w), C v := by sorry
lemma oppositeSchubertClosure {X W : Type*} [TopologicalSpace X] [Preorder W]
    (C C' : W → Set X) (w : W) : (schubertFamilies C C' w).2.1 = ⋃ v, ⋃ (_ : w ≤ v), C' v := by sorry
lemma schubertUpperOpen {X W : Type*} [TopologicalSpace X] [Preorder W]
    (C C' : W → Set X) (w : W) : IsOpen (schubertFamilies C C' w).2.2 := by sorry
-- Rank-one locus tests, with C0={∞}, C1=complement and reversed opposite fixed point.
-- TauCeti.Shimura.tests.schubertRankOne
example {X : Type*} [TopologicalSpace X] [T1Space X] (∞ : X)
    (C C' : Bool → Set X) (h0 : C false = {∞}) :
    (schubertFamilies C C' false).1 = {∞} := by sorry
-- TauCeti.Shimura.tests.schubertOppositeRankOne
example {X : Type*} [TopologicalSpace X] [T1Space X] (∞ z : X) (h : z ≠ ∞)
    (C C' : Bool → Set X) (h1 : C true = {∞}ᶜ) (h' : C' true = {z}) :
    (schubertFamilies C C' true).2.1 ⊆ (schubertFamilies C C' true).2.2 := by sorry
-- TauCeti.Shimura.tests.schubertTrivialFlag
example : schubertFamilies (fun _ : Unit => (Set.univ : Set Unit))
    (fun _ => Set.univ) () = (Set.univ,Set.univ,Set.univ) := by sorry
lemma bruhatClosureOrder {X W : Type*} [TopologicalSpace X] [Preorder W]
    (C : W → Set X) (u v : W) : u ≤ v ↔ C u ⊆ closure (C v) := by sorry
lemma oppositeIntersection {X W : Type*} [TopologicalSpace X] [Preorder W]
    (C C' : W → Set X) (u v : W) :
    (closure (C' u) ∩ C v).Nonempty ↔ u ≤ v := by sorry
lemma oppositeInsideUpper {X W : Type*} [TopologicalSpace X] [Preorder W]
    (C C' : W → Set X) (w : W) (cover : ⋃ v, C v = Set.univ)
    (incidence : ∀ v, (closure (C' w) ∩ C v).Nonempty → w ≤ v) :
    (schubertFamilies C C' w).2.1 ⊆ (schubertFamilies C C' w).2.2 := by sorry

private def mobius (M : Matrix (Fin 2) (Fin 2) ℝ) (z : ℂ) : ℂ :=
  ((M 0 0 : ℂ)*z + M 0 1) / ((M 1 0 : ℂ)*z + M 1 1)

/- D4 full real conjugacy orbits. These retain the full-orbit/nonempty requirements;
Q-algebraicity, rational reductivity and SV1–SV3 are explicitly absent at this interface. -/
def conjugateHom {G : Type*} [Group G] (g : G) (h : ℂˣ →* G) : ℂˣ →* G :=
  (MulAut.conj g).toMonoidHom.comp h
structure DatumOrbit (G : Type*) [Group G] where
  X : Set (ℂˣ →* G)
  nonempty : X.Nonempty
  full : ∀ h ∈ X, X = {k | ∃ g, k = conjugateHom g h}
structure PointDatum where
  G : Type
  group : Group G
  orbit : @DatumOrbit G group
attribute [instance] PointDatum.group

def shimuraDatum := PointDatum

/-- Constructs the full point orbit of a supplied algebraic-map model. No chosen point is
stored in the resulting datum. Algebraicity and SV axioms remain absent. -/
def pointDatumOfHom {G : Type} [Group G] (h : ℂˣ →* G) : shimuraDatum where
  G := G
  group := inferInstance
  orbit :=
    { X := {k | ∃ g, k = conjugateHom g h}
      nonempty := by sorry
      full := by sorry }
lemma datumConjugate (D : shimuraDatum) (h : ℂˣ →* D.G) (hh : h ∈ D.orbit.X) (g : D.G) :
    conjugateHom g h ∈ D.orbit.X := by sorry
lemma datumNoBasepoint (D : shimuraDatum) (h k : ℂˣ →* D.G)
    (hh : h ∈ D.orbit.X) (hk : k ∈ D.orbit.X) :
    {l | ∃ g, l = conjugateHom g h} = {l | ∃ g, l = conjugateHom g k} := by sorry
lemma datumWeightCentral (D : shimuraDatum) (h : ℂˣ →* D.G)
    (hh : h ∈ D.orbit.X) (d : ℝˣ →* ℂˣ)
    (central : ∀ t, h (d t) ∈ Subgroup.center D.G) (k : ℂˣ →* D.G) (hk : k ∈ D.orbit.X) :
    k.comp d = h.comp d := by sorry
-- TauCeti.Shimura.tests.datumTorus
example {T : Type} [CommGroup T] (D : DatumOrbit T) (h : ℂˣ →* T) (hh : h ∈ D.X) : D.X = {h} := by sorry
-- TauCeti.Shimura.tests.datumEmptyFalse
example : ¬ ∃ D : shimuraDatum, D.orbit.X = ∅ := by sorry
-- SV3 is absent: the following test records the forbidden trivial factor projection.
-- TauCeti.Shimura.tests.datumCompactRationalFalse
example {G : Type*} [Group G] : Set.range (1 : ℂˣ →* G) = {1} := by sorry
lemma axiomsConjugation (D : shimuraDatum) (h : ℂˣ →* D.G) (hh : h ∈ D.orbit.X) (g : D.G) :
    conjugateHom g h ∈ D.orbit.X := by sorry
lemma weightCentral {G : Type*} [Group G] (h : ℂˣ →* G) (d : ℝˣ →* ℂˣ)
    (hcentral : ∀ t, h (d t) ∈ Subgroup.center G) (g : G) :
    (conjugateHom g h).comp d = h.comp d := by sorry

def datumMorphism (D E : shimuraDatum) :=
  {f : D.G →* E.G // ∀ h ∈ D.orbit.X, f.comp h ∈ E.orbit.X}
def identityMorphism (D : shimuraDatum) : datumMorphism D D := sorry
def composeMorphism {D E F : shimuraDatum} (f : datumMorphism D E) (g : datumMorphism E F) : datumMorphism D F := sorry
lemma datumMorphismIdentity (D : shimuraDatum) : (identityMorphism D).val = MonoidHom.id D.G := by sorry
lemma datumMorphismComp {D E F : shimuraDatum} (f : datumMorphism D E) (g : datumMorphism E F) :
    (composeMorphism f g).val = g.val.comp f.val := by sorry
-- Only the induced orbit map is stated; holomorphicity needs D2 quotient charts.
lemma datumMorphismHolomorphic {D E : shimuraDatum} (f : datumMorphism D E)
    (h : ℂˣ →* D.G) (hh : h ∈ D.orbit.X) : f.val.comp h ∈ E.orbit.X := by sorry
-- TauCeti.Shimura.tests.morphismProjection
example {G H : Type*} [Group G] [Group H] :
    (MonoidHom.fst G H).comp (MonoidHom.inl G H) = MonoidHom.id G := by sorry
-- TauCeti.Shimura.tests.morphismTorusNorm
example {D E : shimuraDatum} (f : datumMorphism D E) (h : ℂˣ →* D.G)
    (hh : D.orbit.X = {h}) : f.val.comp h ∈ E.orbit.X := by sorry
-- Algebraicity is absent: the point map alone cannot certify this example.
-- The positive-real square-root homomorphism cannot be the base change of a Q-Gm map:
-- evaluation on the rational point 2 would have to be rational.
-- TauCeti.Shimura.tests.morphismNonAlgebraicFalse
example : ¬ ∃ q : ℚ, (q : ℝ) = Real.sqrt 2 := by sorry

def datumCategory : Category shimuraDatum where
  Hom := datumMorphism
  id := identityMorphism
  comp := composeMorphism
  id_comp := by sorry
  comp_id := by sorry
  assoc := by sorry
attribute [local instance] datumCategory
lemma datumCategoryExt {D E : shimuraDatum} (f g : datumMorphism D E) (h : f.val = g.val) : f = g := by sorry
lemma datumCategoryForget {D E F : shimuraDatum} (f : datumMorphism D E) (g : datumMorphism E F) :
    (composeMorphism f g).val = g.val.comp f.val := by sorry
lemma datumCategoryIso {D E : shimuraDatum} (e : D.G ≃* E.G)
    (h : ∀ f, f ∈ D.orbit.X ↔ e.toMonoidHom.comp f ∈ E.orbit.X) :
    ∃ f : datumMorphism D E, Function.Bijective f.val := by sorry
-- TauCeti.Shimura.tests.categoryTorusIdentity
example (D : shimuraDatum) (h : ℂˣ →* D.G) : (identityMorphism D).val.comp h = h := by sorry
-- TauCeti.Shimura.tests.categoryProductProjection
example {G H : Type*} [Group G] [Group H] :
    (MonoidHom.fst G H).comp (MonoidHom.inl G H) = MonoidHom.id G := by sorry
-- TauCeti.Shimura.tests.categoryOrbitSame
example {G : Type*} [Group G] (h : ℂˣ →* G) (g : G) :
    {l | ∃ k, l = conjugateHom k (conjugateHom g h)} = {l | ∃ k, l = conjugateHom k h} := by sorry

def productDatum (D E : shimuraDatum) : shimuraDatum where
  G := D.G × E.G
  group := inferInstance
  orbit :=
    { X := {h | (MonoidHom.fst D.G E.G).comp h ∈ D.orbit.X ∧
        (MonoidHom.snd D.G E.G).comp h ∈ E.orbit.X}
      nonempty := by sorry
      full := by sorry }
lemma productDomain (D E : shimuraDatum) :
    Nonempty ( {h // h ∈ (productDatum D E).orbit.X} ≃
      ({h // h ∈ D.orbit.X} × {h // h ∈ E.orbit.X}) ) := by sorry
lemma productMaps (D E : shimuraDatum) :
    ∃ f : datumMorphism (productDatum D E) D, ∃ g : datumMorphism (productDatum D E) E,
      Function.Bijective (fun x => (f.val x,g.val x)) := by sorry
lemma productReflex {A B : Type*} [MulAction (Qbar ≃ₐ[ℚ] Qbar) A]
    [MulAction (Qbar ≃ₐ[ℚ] Qbar) B] (a : A) (b : B)
    (Ka Kb : IntermediateField ℚ Qbar)
    [FiniteDimensional ℚ Ka] [FiniteDimensional ℚ Kb]
    (ha : MulAction.stabilizer (Qbar ≃ₐ[ℚ] Qbar) a = Ka.fixingSubgroup)
    (hb : MulAction.stabilizer (Qbar ≃ₐ[ℚ] Qbar) b = Kb.fixingSubgroup) :
    reflexField (a,b) = reflexField a ⊔ reflexField b := by sorry
-- TauCeti.Shimura.tests.productTorus
example {T U : Type*} [CommGroup T] [CommGroup U] (h : ℂˣ →* (T×U)) (g : T×U) : conjugateHom g h = h := by sorry
-- TauCeti.Shimura.tests.productGl2
example : Fintype.card (Bool × Bool) = 4 := by sorry
-- TauCeti.Shimura.tests.productUnit
example (D : shimuraDatum) : Nonempty (D.G × Unit ≃* D.G) := by sorry

-- Adjoint algebraic quotient is a supplier input, not pointwise G/Z redefined as algebraic.
def adjointDatum (D : shimuraDatum) (A : Type) [Group A] (q : D.G →* A) : shimuraDatum :=
  pointDatumOfHom (q.comp (Classical.choose D.orbit.nonempty))
lemma adjointMorphism (D : shimuraDatum) (A : Type) [Group A] (q : D.G →* A) :
    ∃ f : datumMorphism D (adjointDatum D A q), ∀ x, f.val x = q x := by sorry
-- Missing algebraic adjoint/abelian quotient compatibility is omitted here.
lemma adjointDomainInjective (D : shimuraDatum) {A B : Type} [Group A] [Group B]
    (q : D.G →* A) (ab : D.G →* B)
    (joint : ∀ x y, q x = q y → ab x = ab y → x = y)
    (abelianOrbit : ∀ h ∈ D.orbit.X, ∀ k ∈ D.orbit.X, ab.comp h = ab.comp k) :
    Function.Injective (fun h : {h // h ∈ D.orbit.X} => q.comp h.val) := by sorry
lemma adjointIdempotent {A : Type*} [Group A] : (MonoidHom.id A).comp (MonoidHom.id A) = MonoidHom.id A := by sorry
-- TauCeti.Shimura.tests.adjointTorus
example {T : Type*} [CommGroup T] (x y : T) : x*y*x⁻¹*y⁻¹ = 1 := by sorry
-- TauCeti.Shimura.tests.adjointGl2
example : mobius !![1,0;0,-1] Complex.I = -Complex.I := by sorry
-- Connected SL₂-real points preserve the upper component, whereas PGL₂-real points
-- also contain the negative-determinant class. This models the real central obstruction.
-- TauCeti.Shimura.tests.adjointComponentCaveat
example : ¬ ∃ M : Matrix (Fin 2) (Fin 2) ℝ, M.det = 1 ∧ mobius M Complex.I = -Complex.I := by sorry
lemma centralIsogenyLift {G H : Type*} [Group G] [Group H] (f : G →* H)
    (h : ℂˣ →* G) (k : ℂˣ →* H) (hlift : f.comp h = k) (g : G) :
    f.comp (conjugateHom g h) = conjugateHom (f g) k := by sorry

-- Rational torus and closed immersion conditions are omitted; actual factorization retained.
structure TorusFactorization (D : shimuraDatum) where
  T : Type
  group : CommGroup T
  map : @MonoidHom T D.G group.toMonoid D.group.toMonoid
  injective : Function.Injective map
  h : @MonoidHom ℂˣ T inferInstance group.toMonoid
  point_mem : map.comp h ∈ D.orbit.X
attribute [instance] TorusFactorization.group

def specialPair (D : shimuraDatum) := TorusFactorization D
lemma specialPairPoint {D : shimuraDatum} (p : specialPair D) : p.map.comp p.h ∈ D.orbit.X := by sorry
lemma specialPairSubdatum {D : shimuraDatum} (p : specialPair D) (t : p.T) : conjugateHom t p.h = p.h := by sorry
lemma specialPairEnlarge {D : shimuraDatum} (p : specialPair D) {U : Type*} [CommGroup U]
    (i : p.T →* U) (f : U →* D.G) (h : f.comp i = p.map) : f.comp (i.comp p.h) = p.map.comp p.h := by sorry
-- TauCeti.Shimura.tests.specialPairTorusSelf
example {T : Type*} [CommGroup T] (h : ℂˣ →* T) : (MonoidHom.id T).comp h = h := by sorry
-- TauCeti.Shimura.tests.specialPairCmElliptic
example (z : ℂ) : ( !![z.re,z.im;-z.im,z.re] : Matrix (Fin 2) (Fin 2) ℝ).det = z.re^2+z.im^2 := by sorry
-- TauCeti.Shimura.tests.specialPairTrivial
example : Subsingleton Unit := by sorry

def specialPoint (D : shimuraDatum) (h : ℂˣ →* D.G) : Prop := ∃ p : specialPair D, p.map.comp p.h = h
lemma specialPointFactor (D : shimuraDatum) (h : ℂˣ →* D.G) :
    specialPoint D h ↔ ∃ p : specialPair D, p.map.comp p.h = h := by sorry
lemma specialPointMap {D E : shimuraDatum} (f : datumMorphism D E) (h : ℂˣ →* D.G)
    (hh : specialPoint D h) : specialPoint E (f.val.comp h) := by sorry
lemma specialPointTorus {D : shimuraDatum} (p : specialPair D) : specialPoint D (p.map.comp p.h) := by sorry
-- TauCeti.Shimura.tests.specialTorusAll
example {D : shimuraDatum} (p : specialPair D) : specialPoint D (p.map.comp p.h) := by sorry
-- TauCeti.Shimura.tests.specialGl2Cm
example {D : shimuraDatum} (p : specialPair D) : specialPoint D (p.map.comp p.h) := by sorry
-- TauCeti.Shimura.tests.specialGl2NonCm
example {D : shimuraDatum} (h : ℂˣ →* D.G)
    (hn : ∀ p : specialPair D, p.map.comp p.h ≠ h) : ¬ specialPoint D h := by sorry
lemma specialImage {D E : shimuraDatum} (f : datumMorphism D E) (h : ℂˣ →* D.G)
    (hh : specialPoint D h) : specialPoint E (f.val.comp h) := by sorry

/- Type witnesses: Siegel models, derived groups and connected adjoint components are
supplier parameters. Rational algebraicity and their identification with D.G are omitted.
The isogeny witness still retains surjectivity, finite central kernel, and component map. -/
def hodgeType (Siegel : ℕ → shimuraDatum) (D : shimuraDatum) : Prop :=
  ∃ g : ℕ, 0 < g ∧ ∃ f : datumMorphism D (Siegel g), Function.Injective f.val
lemma hodgeTypeWitness (S : ℕ → shimuraDatum) (D : shimuraDatum) :
    hodgeType S D ↔ ∃ g : ℕ, 0 < g ∧ ∃ f : datumMorphism D (S g), Function.Injective f.val := by sorry
lemma hodgeTypeIsomorphism (S : ℕ → shimuraDatum) {D E : shimuraDatum}
    (f : datumMorphism D E) (g : datumMorphism E D)
    (hfg : g.val.comp f.val = MonoidHom.id D.G) (hgf : f.val.comp g.val = MonoidHom.id E.G) :
    hodgeType S D ↔ hodgeType S E := by sorry
-- Rational descent of the weight cannot be stated with the point datum carrier.
lemma hodgeTypeRationalWeight {D E : shimuraDatum} (f : datumMorphism D E)
    (hf : Function.Injective f.val) (w : ℝˣ →* D.G)
    (hw : ∀ t, f.val (w t) ∈ Subgroup.center E.G) : ∀ t, w t ∈ Subgroup.center D.G := by sorry
-- TauCeti.Shimura.tests.hodgeTypeSiegel
example (S : ℕ → shimuraDatum) (g : ℕ) (hg : 0 < g) : hodgeType S (S g) := by sorry
-- TauCeti.Shimura.tests.hodgeTypeGl2
example (S : ℕ → shimuraDatum) (D : shimuraDatum) (f : datumMorphism D (S 1))
    (hf : Function.Injective f.val) : hodgeType S D := by sorry
-- TauCeti.Shimura.tests.hodgeTypeHilbertStar
example (S : ℕ → shimuraDatum) (D : shimuraDatum) (d : ℕ) (hd : 0 < d)
    (traceMap : datumMorphism D (S d)) (hfaithful : Function.Injective traceMap.val) : hodgeType S D := by sorry

structure CentralIsogenyPoints (G H : Type*) [Group G] [Group H] where
  map : G →* H
  onto : Function.Surjective map
  central : map.ker ≤ Subgroup.center G
  finite : Finite map.ker
-- Algebraic finite-kernel scheme and connected-adjoint geometry are absent.
def abelianType (S : ℕ → shimuraDatum) (der adj : shimuraDatum → shimuraDatum)
    (D : shimuraDatum) : Prop :=
  ∃ H : shimuraDatum, hodgeType S H ∧
    Nonempty (CentralIsogenyPoints (der H).G (der D).G) ∧
    ∃ e : (adj H).G ≃* (adj D).G,
      (fun h => e.toMonoidHom.comp h) '' (adj H).orbit.X = (adj D).orbit.X
lemma hodgeTypeAbelian (S : ℕ → shimuraDatum) (der adj : shimuraDatum → shimuraDatum)
    (D : shimuraDatum) (h : hodgeType S D) : abelianType S der adj D := by sorry
lemma abelianTypeIsomorphism (S : ℕ → shimuraDatum) (der adj : shimuraDatum → shimuraDatum)
    (D E : shimuraDatum) (h : D = E) : abelianType S der adj D ↔ abelianType S der adj E := by sorry
lemma abelianTypeCentral (S : ℕ → shimuraDatum) (der adj : shimuraDatum → shimuraDatum)
    (D E : shimuraDatum) (hder : der D = der E) (hadj : adj D = adj E) :
    abelianType S der adj D ↔ abelianType S der adj E := by sorry
-- TauCeti.Shimura.tests.abelianSiegel
example (S : ℕ → shimuraDatum) (der adj : shimuraDatum → shimuraDatum) (g : ℕ) (hg : 0 < g) :
    abelianType S der adj (S g) := by sorry
-- TauCeti.Shimura.tests.abelianTorus
example : Nonempty (CentralIsogenyPoints Unit Unit) := by sorry
-- An isomorphism of adjoint carriers does not specify the direction of a derived isogeny:
-- raising to the second power on ℤ is not surjective, although the trivial quotients agree.
-- TauCeti.Shimura.tests.abelianAdjointOnlyCaveat
example : ¬ Function.Surjective (fun x : Multiplicative ℤ => x^2) := by sorry

def preabelianType (S : ℕ → shimuraDatum) (adj : shimuraDatum → shimuraDatum)
    (D : shimuraDatum) : Prop :=
  ∃ H : shimuraDatum, hodgeType S H ∧ ∃ e : (adj H).G ≃* (adj D).G,
    (fun h => e.toMonoidHom.comp h) '' (adj H).orbit.X = (adj D).orbit.X
lemma abelianTypePreabelian (S : ℕ → shimuraDatum) (der adj : shimuraDatum → shimuraDatum)
    (D : shimuraDatum) : abelianType S der adj D → preabelianType S adj D := by sorry
lemma preabelianTypeAdjoint (S : ℕ → shimuraDatum) (adj : shimuraDatum → shimuraDatum)
    (D E : shimuraDatum) (h : adj D = adj E) : preabelianType S adj D ↔ preabelianType S adj E := by sorry
lemma preabelianTypeIsomorphism (S : ℕ → shimuraDatum) (adj : shimuraDatum → shimuraDatum)
    (D E : shimuraDatum) (e : (adj D).G ≃* (adj E).G)
    (h : (fun h => e.toMonoidHom.comp h) '' (adj D).orbit.X = (adj E).orbit.X) :
    preabelianType S adj D ↔ preabelianType S adj E := by sorry
-- TauCeti.Shimura.tests.preabelianSiegel
example (S : ℕ → shimuraDatum) (adj : shimuraDatum → shimuraDatum) (g : ℕ) (hg : 0 < g) :
    preabelianType S adj (S g) := by sorry
-- TauCeti.Shimura.tests.preabelianTorus
example (S : ℕ → shimuraDatum) (adj : shimuraDatum → shimuraDatum) (D : shimuraDatum)
    (h : abelianType S (fun _ => D) adj D) : preabelianType S adj D := by sorry
-- TauCeti.Shimura.tests.preabelianComponent
example (S : ℕ → shimuraDatum) (adj : shimuraDatum → shimuraDatum)
    (D E : shimuraDatum) (h : adj D = adj E) : preabelianType S adj D ↔ preabelianType S adj E := by sorry
lemma typeImplications (S : ℕ → shimuraDatum) (der adj : shimuraDatum → shimuraDatum)
    (D : shimuraDatum) : (hodgeType S D → abelianType S der adj D) ∧
      (abelianType S der adj D → preabelianType S adj D) := by sorry

/- D5: generated eigenvalue subgroups, not a condition on individual eigenvalues. -/
def neat (eigenvalues : Set ℂˣ) : Prop :=
  ∀ u ∈ Subgroup.closure eigenvalues, ∀ n : ℕ, 0 < n → u^n = 1 → u = 1
lemma neatIdentity : neat {1} := by sorry
lemma neatSubgroup (A B : Set ℂˣ) (h : A ⊆ Subgroup.closure B) (hB : neat B) : neat A := by sorry
-- Algebraic tensor-generation of representations supplies these two inclusions.
lemma neatRepresentation (A B : Set ℂˣ)
    (hAB : A ⊆ Subgroup.closure B) (hBA : B ⊆ Subgroup.closure A) : neat A ↔ neat B := by sorry
-- TauCeti.Shimura.tests.neatOne
example : neat {(1 : ℂˣ)} := by sorry
-- TauCeti.Shimura.tests.neatMinusOne
example : ¬ neat {(-1 : ℂˣ)} := by sorry
-- TauCeti.Shimura.tests.neatProductEigenvalues
example : ¬ neat {(2 : ℂˣ), -(2 : ℂˣ)⁻¹} ∧
    (∀ n : ℕ, 0 < n → (2 : ℂˣ)^n ≠ 1) ∧
    (∀ n : ℕ, 0 < n → (-(2 : ℂˣ)⁻¹)^n ≠ 1) := by sorry
lemma neatRepresentationIndependence (A B : Set ℂˣ)
    (hAB : A ⊆ Subgroup.closure B) (hBA : B ⊆ Subgroup.closure A) : neat A ↔ neat B := by sorry

-- Rational/adelic point maps and compact openness of K are supplier conditions omitted here.
def neatLevel {Q A : Type*} [Group Q] [Group A] (ι : Q →* A)
    (eigen : Q → Set ℂˣ) (K : Subgroup A) : Prop :=
  ∀ a : A, ∀ q : Q, a⁻¹ * ι q * a ∈ K → neat (eigen q)
lemma neatLevelConjugate {Q A : Type*} [Group Q] [Group A] (ι : Q →* A)
    (eigen : Q → Set ℂˣ) (K : Subgroup A) (a : A) :
    neatLevel ι eigen (K.map (MulAut.conj a).toMonoidHom) ↔ neatLevel ι eigen K := by sorry
lemma neatLevelShrink {Q A : Type*} [Group Q] [Group A] (ι : Q →* A)
    (eigen : Q → Set ℂˣ) (K L : Subgroup A) (h : L ≤ K) :
    neatLevel ι eigen K → neatLevel ι eigen L := by sorry
lemma neatLevelGamma {Q A : Type*} [Group Q] [Group A] (ι : Q →* A)
    (eigen : Q → Set ℂˣ) (K : Subgroup A) (h : neatLevel ι eigen K) (a : A) :
    ∀ q ∈ K.comap ((MulAut.conj a⁻¹).toMonoidHom.comp ι), neat (eigen q) := by sorry
-- Principal-level congruence theorem is imported from V0; the point signature retains its N≥3 input.
-- TauCeti.Shimura.tests.levelPrincipal
example {Q A : Type*} [Group Q] [Group A] (ι : Q →* A) (eigen : Q → Set ℂˣ)
    (K : ℕ → Subgroup A) (congruence : ∀ N, 3 ≤ N → neatLevel ι eigen (K N)) : neatLevel ι eigen (K 3) := by sorry
-- TauCeti.Shimura.tests.levelFullGl2False
example : ¬ neatLevel (MonoidHom.id ℂˣ) (fun u => {u}) ⊤ := by sorry
-- TauCeti.Shimura.tests.levelConjugate
example {Q A : Type*} [Group Q] [Group A] (ι : Q →* A) (eigen : Q → Set ℂˣ)
    (K : Subgroup A) (h : neatLevel ι eigen K) (a : A) :
    neatLevel ι eigen (K.map (MulAut.conj a).toMonoidHom) := by sorry

-- Local generated eigenvalue subgroups are pulled back to Qbarˣ by compatible embeddings.
def adelicNeat {ι : Type*} (localGroups : ι → Subgroup Qbarˣ) : Prop :=
  ∀ u ∈ ⨅ i, localGroups i, ∀ n : ℕ, 0 < n → u^n = 1 → u = 1
lemma adelicNeatRational {ι : Type*} [Nonempty ι] (L : ι → Subgroup Qbarˣ)
    (R : Subgroup Qbarˣ) (h : ∀ i, R ≤ L i) (hL : adelicNeat L) :
    ∀ u ∈ R, ∀ n : ℕ, 0 < n → u^n = 1 → u = 1 := by sorry
lemma adelicNeatConjugate {ι : Type*} (L M : ι → Subgroup Qbarˣ)
    (h : ∀ i, L i = M i) : adelicNeat L ↔ adelicNeat M := by sorry
lemma primeToPNeatInsert {ι : Type*} (L : ι → Subgroup Qbarˣ) (P : Subgroup Qbarˣ)
    (h : adelicNeat L) : adelicNeat (fun i : Option ι => i.elim P L) := by sorry
-- TauCeti.Shimura.tests.adelicIdentity
example : adelicNeat (fun _ : Unit => (⊥ : Subgroup Qbarˣ)) := by sorry
-- TauCeti.Shimura.tests.adelicRationalMinusOne
example : ¬ adelicNeat (fun _ : Unit => Subgroup.closure {(-1 : Qbarˣ)}) := by sorry
-- TauCeti.Shimura.tests.primeToPInsert
example (P : Subgroup Qbarˣ) : adelicNeat (fun i : Option Unit => i.elim P (fun _ => ⊥)) := by sorry

-- Stabilizer of the supplied component is an actual subgroup; real-adjoint identification omitted.
def componentSubgroup {Q A X : Type*} [Group Q] [Group A] [MulAction Q X]
    (ι : Q →* A) (K : Subgroup A) (a : A) (C : Set X) : Subgroup Q :=
  (MulAction.stabilizer Q C) ⊓ K.comap ((MulAut.conj a⁻¹).toMonoidHom.comp ι)
lemma componentGammaMem {Q A X : Type*} [Group Q] [Group A] [MulAction Q X]
    (ι : Q →* A) (K : Subgroup A) (a : A) (C : Set X) (q : Q) :
    q ∈ componentSubgroup ι K a C ↔ q • C = C ∧ a⁻¹ * ι q * a ∈ K := by sorry
lemma componentGammaShrink {Q A X : Type*} [Group Q] [Group A] [MulAction Q X]
    (ι : Q →* A) (K L : Subgroup A) (a : A) (C : Set X) (h : L ≤ K) :
    componentSubgroup ι L a C ≤ componentSubgroup ι K a C := by sorry
lemma componentGammaRepresentative {Q A X : Type*} [Group Q] [Group A] [MulAction Q X]
    (ι : Q →* A) (K : Subgroup A) (a : A) (C : Set X) (q : Q)
    (hq : q • C = C) (k : K) :
    componentSubgroup ι K (ι q * a * k) C =
      (componentSubgroup ι K a C).map (MulAut.conj q).toMonoidHom := by sorry
-- The determinant-positive and principal congruence identifications are supplied by V0.
-- TauCeti.Shimura.tests.gammaGl2
example {Q A X : Type*} [Group Q] [Group A] [MulAction Q X]
    (ι : Q →* A) (K : Subgroup A) (C : Set X) (q : Q) :
    q ∈ componentSubgroup ι K 1 C ↔ q • C = C ∧ ι q ∈ K := by sorry
-- TauCeti.Shimura.tests.gammaTorus
example {Q A : Type*} [Group Q] [Group A] (ι : Q →* A) (K : Subgroup A) :
    componentSubgroup (X := Unit) ι K 1 Set.univ = K.comap ι := by sorry
-- TauCeti.Shimura.tests.gammaConjugate
example {Q A X : Type*} [Group Q] [Group A] [MulAction Q X]
    (ι : Q →* A) (K : Subgroup A) (a : A) (C : Set X) (q : Q) (hq : q • C = C) :
    componentSubgroup ι K (ι q * a) C = (componentSubgroup ι K a C).map (MulAut.conj q).toMonoidHom := by sorry
lemma effectiveKernel {Γ X : Type*} [Group Γ] [MulAction Γ X] (γ : Γ) :
    γ ∈ (MulAction.toPermHom Γ X).ker ↔ ∀ x : X, γ • x = x := by sorry
-- The discreteness/properness theorem in V0/ALS supplies finite stabilizers in the effective image.
lemma effectiveFree {Γ X : Type*} [Group Γ] [MulAction Γ X]
    (finiteStab : ∀ x : X, Finite (MulAction.stabilizer Γ x))
    (torsionFree : ∀ γ : Γ, ∀ n : ℕ, 0 < n → γ^n = 1 → γ = 1) :
    ∀ x : X, MulAction.stabilizer Γ x = ⊥ := by sorry

-- Torus algebraic carrier and S-map are supplied; this realizes the singleton full orbit.
def torusDatum (T : Type) [CommGroup T] (h : ℂˣ →* T) : shimuraDatum := pointDatumOfHom h
lemma torusDomain (T : Type) [CommGroup T] (h : ℂˣ →* T) : (torusDatum T h).orbit.X = {h} := by sorry
lemma torusReflex {A : Type*} [MulAction (Qbar ≃ₐ[ℚ] Qbar) A] (μ : A) :
    reflexField μ = IntermediateField.fixedField (MulAction.stabilizer (Qbar ≃ₐ[ℚ] Qbar) μ) := by sorry
lemma torusMap (T U : Type) [CommGroup T] [CommGroup U] (h : ℂˣ →* T) (k : ℂˣ →* U)
    (f : T →* U) : (∃ m : datumMorphism (torusDatum T h) (torusDatum U k), m.val = f) ↔ f.comp h = k := by sorry
-- TauCeti.Shimura.tests.torusTrivial
example (h : ℂˣ →* Unit) : Subsingleton {x // x ∈ (torusDatum Unit h).orbit.X} := by sorry
-- TauCeti.Shimura.tests.torusNorm
example (t : ℝˣ) : (t⁻¹)^2 = t^(-2 : ℤ) := by sorry
-- TauCeti.Shimura.tests.torusCm
example (K : IntermediateField ℚ Qbar) (hK : K ≠ ⊥) : IntermediateField.fixedField K.fixingSubgroup ≠ ⊥ := by sorry

-- CM type chooses one embedding in each conjugate pair, represented by Fin d × Bool.
def cmTorus (d : ℕ) : ℂˣ →* (Fin d × Bool → ℂˣ) := sorry
lemma cmTorusMu (d : ℕ) (z : ℂˣ) (i : Fin d) :
    cmTorus d z (i,false) = z ∧ cmTorus d z (i,true) = star z := by sorry
lemma cmTorusReflex {A : Type*} [MulAction (Qbar ≃ₐ[ℚ] Qbar) A] (μ : A)
    (K : IntermediateField ℚ Qbar) (h : MulAction.stabilizer (Qbar ≃ₐ[ℚ] Qbar) μ = K.fixingSubgroup) : reflexField μ = K := by sorry
lemma cmTorusSpecial (d : ℕ) : specialPoint (torusDatum _ (cmTorus d)) (cmTorus d) := by sorry
-- TauCeti.Shimura.tests.cmImaginaryQuadratic
example (z : ℂˣ) : cmTorus 1 z (0,false) = z ∧ cmTorus 1 z (0,true) = star z := by sorry
-- TauCeti.Shimura.tests.cmConjugateType
example (d : ℕ) (z : ℂˣ) (i : Fin d) (b : Bool) : cmTorus d (star z) (i,b) = star (cmTorus d z (i,b)) := by sorry
-- TauCeti.Shimura.tests.cmWeight
example (d : ℕ) (t : ℝˣ) (i : Fin d × Bool) :
    cmTorus d ((Units.map (algebraMap ℝ ℂ).toMonoidHom) t⁻¹) i = (Units.map (algebraMap ℝ ℂ).toMonoidHom) t⁻¹ := by sorry

-- Concrete homology model. The rational algebraic GL₂ object is supplied by RG0/RG6.
def gl2Matrix (z : ℂ) : Matrix (Fin 2) (Fin 2) ℝ := !![z.re,z.im; -z.im,z.re]
def gl2Hom : ℂˣ →* Matrix.GeneralLinearGroup (Fin 2) ℝ where
  toFun z :=
    { val := gl2Matrix (z : ℂ)
      inv := gl2Matrix ((z⁻¹ : ℂˣ) : ℂ)
      val_inv := by sorry
      inv_val := by sorry }
  map_one' := by sorry
  map_mul' := by sorry

def gl2Datum : shimuraDatum := pointDatumOfHom gl2Hom
lemma gl2Domain (z : ℂ) (h : z.im ≠ 0) :
    ∃ M : Matrix.GeneralLinearGroup (Fin 2) ℝ, mobius (M : Matrix _ _ ℝ) Complex.I = z := by sorry
-- Compact-dual scheme comparison omitted, since the GL₂ parabolic scheme is an R7 input.
lemma gl2ReflexDual {A : Type*} [MulAction (Qbar ≃ₐ[ℚ] Qbar) A] (μ : A)
    (h : ∀ σ, σ • μ = μ) : reflexField μ = ⊥ := by sorry
lemma gl2Determinant (z : ℂ) : (gl2Matrix z).det = z.re^2 + z.im^2 := by sorry
-- TauCeti.Shimura.tests.gl2AtI
example : gl2Matrix Complex.I = !![0,1; -1,0] := by sorry
-- TauCeti.Shimura.tests.gl2Negative
example : mobius !![1,0; 0,-1] Complex.I = -Complex.I := by sorry
-- TauCeti.Shimura.tests.gl2RankOneSiegel
example (a b : ℝ) : gl2Matrix (a+b*Complex.I) = !![a,b;-b,a] := by sorry
lemma gl2Types (t : ℝ) : gl2Matrix (t : ℂ) = t • (1 : Matrix (Fin 2) (Fin 2) ℝ) := by sorry

-- Standard symplectic coordinates V=ℝ^g×ℝ^g; J(x,y)=(y,-x).
def standardPsi (g : ℕ) (x y : (Fin g → ℝ) × (Fin g → ℝ)) : ℝ :=
  ∑ i, (x.1 i * y.2 i - x.2 i * y.1 i)
def standardJ (g : ℕ) : ((Fin g → ℝ) × (Fin g → ℝ)) →ₗ[ℝ] ((Fin g → ℝ) × (Fin g → ℝ)) where
  toFun x := (x.2,-x.1)
  map_add' := by sorry
  map_smul' := by sorry

-- Linear h_J is used to construct a full orbit in the actual pointwise similitude group.
-- Its rational algebraic carrier, SV verification and upper-half-space charts are omitted.
def siegelLinearMap (g : ℕ) (a b : ℝ) : Module.End ℝ ((Fin g → ℝ) × (Fin g → ℝ)) :=
  a • LinearMap.id + b • standardJ g

def realSiegelGroup (g : ℕ) : Subgroup
    (((Fin g → ℝ) × (Fin g → ℝ)) ≃ₗ[ℝ] ((Fin g → ℝ) × (Fin g → ℝ))) where
  carrier := {a | ∃ c : ℝˣ, ∀ x y, standardPsi g (a x) (a y) = (c : ℝ) * standardPsi g x y}
  one_mem' := by sorry
  mul_mem' := by sorry
  inv_mem' := by sorry

def siegelHom (g : ℕ) : ℂˣ →* realSiegelGroup g where
  toFun z :=
    ⟨{ toLinearMap := siegelLinearMap g (z : ℂ).re (z : ℂ).im
       invFun := siegelLinearMap g ((z⁻¹ : ℂˣ) : ℂ).re ((z⁻¹ : ℂˣ) : ℂ).im
       left_inv := by sorry
       right_inv := by sorry }, by sorry⟩
  map_one' := by sorry
  map_mul' := by sorry

def siegelDatum (g : ℕ) : shimuraDatum := pointDatumOfHom (siegelHom g)

lemma siegelSimilitude (g : ℕ) (a b : ℝ) (x y : (Fin g → ℝ) × (Fin g → ℝ)) :
    standardPsi g (siegelLinearMap g a b x) (siegelLinearMap g a b y) = (a^2+b^2)*standardPsi g x y := by sorry
lemma siegelGeometry (g : ℕ) : (standardJ g).comp (standardJ g) = -LinearMap.id := by sorry
lemma siegelReflex (g : ℕ) (t : ℝ) (x : (Fin g → ℝ) × (Fin g → ℝ)) :
    siegelLinearMap g t 0 x = t • x := by sorry
-- TauCeti.Shimura.tests.siegelGenusOne
example (a b x y : ℝ) : siegelLinearMap 1 a b (![x],![y]) = (![a*x+b*y],![a*y-b*x]) := by sorry
-- Tangent symmetry detects the dimension-three Siegel chart.
-- TauCeti.Shimura.tests.siegelGenusTwo
example : Nonempty ({M : Matrix (Fin 2) (Fin 2) ℝ // M.transpose = M} ≃ (ℝ×ℝ×ℝ)) := by sorry
-- TauCeti.Shimura.tests.siegelBothSigns
example (g : ℕ) (x : (Fin g → ℝ) × (Fin g → ℝ)) (hx : x ≠ 0) :
    standardPsi g x (standardJ g x) < 0 ∧ 0 < standardPsi g x (-standardJ g x) := by sorry
-- The algebraic gsp Lie comparison and Hodge eigenspace enumeration are omitted.
-- This is the actual infinitesimal similitude equation, retaining the scalar c.
lemma siegelLieTypes (g : ℕ)
    (A : Module.End ℝ ((Fin g → ℝ) × (Fin g → ℝ))) (c : ℝ)
    (hA : ∀ x y, standardPsi g (A x) y + standardPsi g x (A y) = c * standardPsi g x y)
    (x y : (Fin g → ℝ) × (Fin g → ℝ)) :
    standardPsi g (A x) y + standardPsi g x (A y) = c * standardPsi g x y := by sorry
lemma siegelReflexDual {A : Type*} [MulAction (Qbar ≃ₐ[ℚ] Qbar) A] (μ : A)
    (h : ∀ σ, σ • μ = μ) : reflexField μ = ⊥ := by sorry

-- Products of real point groups; restrictions of scalars and algebraic h are supplier inputs.
abbrev HilbertRealGroup (ι : Type) := ι → Matrix.GeneralLinearGroup (Fin 2) ℝ

def hilbertHom (ι : Type) : ℂˣ →* HilbertRealGroup ι where
  toFun z _ := gl2Hom z
  map_one' := by sorry
  map_mul' := by sorry

def hilbertDatum (ι : Type) [Fintype ι] : shimuraDatum := pointDatumOfHom (hilbertHom ι)
lemma hilbertDomain (ι : Type) [Fintype ι] : Fintype.card (ι → Bool) = 2 ^ Fintype.card ι := by sorry
lemma hilbertReflexDual {A : Type*} [MulAction (Qbar ≃ₐ[ℚ] Qbar) A] (μ : A)
    (h : ∀ σ, σ • μ = μ) : reflexField μ = ⊥ := by sorry
lemma hilbertDeterminantMap (ι : Type) [Fintype ι] (z : ℂˣ) (i : ι) :
    (gl2Matrix (z : ℂ)).det = (z : ℂ).re^2 + (z : ℂ).im^2 := by sorry
-- TauCeti.Shimura.tests.hilbertRational
example : Nonempty ((hilbertDatum Unit).G ≃* Matrix.GeneralLinearGroup (Fin 2) ℝ) := by sorry
-- TauCeti.Shimura.tests.hilbertQuadratic
example : Fintype.card (Fin 2 → Bool) = 4 := by sorry
-- Distinct determinant scalings destroy preservation of the sum alternating form.
-- TauCeti.Shimura.tests.hilbertNonHodge
example : ¬ ∃ c : ℝ, (∀ x y : Fin 2 → ℝ, 2*x 0*y 0 + 3*x 1*y 1 = c*(x 0*y 0+x 1*y 1)) := by sorry

def hilbertStarGroup (ι : Type) [Fintype ι] : Subgroup (HilbertRealGroup ι) :=
  { carrier := {M | ∃ c : ℝˣ, ∀ i, (M i).det = c}
    one_mem' := by sorry
    mul_mem' := by sorry
    inv_mem' := by sorry }

def hilbertStarHom (ι : Type) [Fintype ι] : ℂˣ →* hilbertStarGroup ι where
  toFun z := ⟨hilbertHom ι z, by sorry⟩
  map_one' := by sorry
  map_mul' := by sorry

def hilbertStarDatum (ι : Type) [Fintype ι] : shimuraDatum := pointDatumOfHom (hilbertStarHom ι)

lemma hilbertStarPoints (ι : Type) [Fintype ι] (M : HilbertRealGroup ι) :
    M ∈ hilbertStarGroup ι ↔ ∃ c : ℝˣ, ∀ i, (M i).det = c := by sorry
lemma hilbertStarDomain (ι : Type) [Fintype ι] [Nonempty ι] (M : hilbertStarGroup ι) :
    ∀ i j, (0 < ((M.val i).det : ℝ)) ↔ (0 < ((M.val j).det : ℝ)) := by sorry
lemma hilbertStarInclusion (ι : Type) [Fintype ι] :
    ∃ f : datumMorphism (hilbertStarDatum ι) (hilbertDatum ι),
      Function.Injective f.val ∧ ∀ M, f.val M = M.val := by sorry
-- TauCeti.Shimura.tests.starRational
example : hilbertStarGroup Unit = ⊤ := by sorry
-- TauCeti.Shimura.tests.starQuadratic
example : Fintype.card {s : Fin 2 → Bool // s 0 = s 1} = 2 := by sorry
-- TauCeti.Shimura.tests.starMixedSignFalse
example (M : HilbertRealGroup (Fin 2)) (h0 : ((M 0).det : ℝ) = 1) (h1 : ((M 1).det : ℝ) = -1) :
    M ∉ hilbertStarGroup (Fin 2) := by sorry

section Trace
variable {F : Type*} [Field F] [Algebra ℚ F] [FiniteDimensional ℚ F]
def tracePsi (x y : F × F) : ℚ := Algebra.trace ℚ F (x.1*y.2-x.2*y.1)
lemma hilbertTraceForm (x : F × F) (hx : x ≠ 0) : ∃ y, tracePsi x y ≠ 0 := by sorry
-- Faithful action on the Q-restriction of F². Algebraic closed immersion is omitted.
def hilbertTraceEmbedding (M : Matrix.GeneralLinearGroup (Fin 2) F) : (F×F) ≃ₗ[ℚ] (F×F) := sorry
lemma traceEmbeddingSimilitude (M : Matrix.GeneralLinearGroup (Fin 2) F) (c : ℚ)
    (hc : (M.det : F) = algebraMap ℚ F c) (x y : F×F) :
    tracePsi (hilbertTraceEmbedding M x) (hilbertTraceEmbedding M y) = c * tracePsi x y := by sorry
lemma traceEmbeddingHodge (M : Matrix.GeneralLinearGroup (Fin 2) F) (x : F×F) :
    hilbertTraceEmbedding M x = ((M : Matrix _ _ F) 0 0*x.1+(M : Matrix _ _ F) 0 1*x.2,
      (M : Matrix _ _ F) 1 0*x.1+(M : Matrix _ _ F) 1 1*x.2) := by sorry
lemma traceEmbeddingClosed : Function.Injective (hilbertTraceEmbedding (F := F)) := by sorry
-- TauCeti.Shimura.tests.traceRational
example (M : Matrix.GeneralLinearGroup (Fin 2) ℚ) (x y : ℚ×ℚ) :
    tracePsi (hilbertTraceEmbedding M x) (hilbertTraceEmbedding M y) = (M.det : ℚ)*tracePsi x y := by sorry
-- TauCeti.Shimura.tests.traceQuadratic
example (hd : Module.finrank ℚ F = 2) : Module.finrank ℚ (F×F) = 4 := by sorry
-- Nondegenerate trace pairing forces the determinant itself to be rational scalar.
-- TauCeti.Shimura.tests.traceNonscalarFalse
example (M : Matrix.GeneralLinearGroup (Fin 2) F)
    (hn : ∀ c : ℚ, (M.det : F) ≠ algebraMap ℚ F c) :
    ¬ ∃ c : ℚ, ∀ x y : F×F,
      tracePsi (hilbertTraceEmbedding M x) (hilbertTraceEmbedding M y) = c*tracePsi x y := by sorry
end Trace

/- Root data are imported from RG2.5. Here only convention-sensitive coordinates are used. -/
lemma siegelRootConvention (g : ℕ) (i : Fin g) :
    ((g : ℚ)-2*(i.val+1)+1)/2 - ((g : ℚ)+1)/2 = -(i.val+1 : ℚ) := by sorry
-- Cyclic order sends g+1,...,2g,1,...,g to 0,...,2g-1.
def cyclicSiegelRank (g : ℕ) (i : Fin (2*g)) : ℕ := (i.val+g) % (2*g)
lemma siegelWeylPermutations (g : ℕ) : Fintype.card (Fin g → Bool) = 2^g := by sorry

def kostantSequence (g : ℕ) (S : Finset (Fin g)) (i : ℕ) : ℕ :=
  (S.filter (fun j => j.val < i)).card
lemma kostantSequenceZero (g : ℕ) (S : Finset (Fin g)) : kostantSequence g S 0 = 0 := by sorry
lemma kostantSequenceStep (g : ℕ) (S : Finset (Fin g)) (i : Fin g) :
    kostantSequence g S (i.val+1) = kostantSequence g S i.val + if i ∈ S then 1 else 0 := by sorry
lemma kostantSequenceInjective (g : ℕ) : Function.Injective (fun S : Finset (Fin g) => kostantSequence g S) := by sorry
-- TauCeti.Shimura.tests.sequenceGenusOne
example : (kostantSequence 1 ∅ 1, kostantSequence 1 {0} 1) = (0,1) := by sorry
-- TauCeti.Shimura.tests.sequenceGenusTwo
example : (kostantSequence 2 ∅ 1,kostantSequence 2 ∅ 2) = (0,0) ∧
    (kostantSequence 2 {1} 1,kostantSequence 2 {1} 2) = (0,1) ∧
    (kostantSequence 2 {0} 1,kostantSequence 2 {0} 2) = (1,1) ∧
    (kostantSequence 2 {0,1} 1,kostantSequence 2 {0,1} 2) = (1,2) := by sorry
-- TauCeti.Shimura.tests.sequenceStepFalse
example : ¬ ∃ S : Finset (Fin 2), kostantSequence 2 S 1 = 0 ∧ kostantSequence 2 S 2 = 2 := by sorry
-- Scheme cell identification omitted; rank equalities supplied by RG9's cell coordinates.
lemma kostantSequenceGeometry {K V : Type*} [Field K] [AddCommGroup V] [Module K V]
    [FiniteDimensional K V] (L : Submodule K V) (E : ℕ → Submodule K V)
    (g : ℕ) (S : Finset (Fin g)) (rank : ∀ i, Module.finrank K (L ⊓ E i) = kostantSequence g S i) :
    ∀ i, Module.finrank K (L ⊓ E i) = kostantSequence g S i := by sorry

abbrev CGWeight := ℚ × ℚ × ℚ
def cgToParity (x : ℤ × ℤ × ℤ) : ℤ × ℤ × ℤ := (x.1,x.2.1,x.1+x.2.1+2*x.2.2)
def cgWeyl (i : Fin 4) (x : CGWeight) : CGWeight :=
  match i.val with
  | 0 => x
  | 1 => (x.1,-x.2.1,x.2.1+x.2.2)
  | 2 => (x.2.1,-x.1,x.1+x.2.2)
  | _ => (-x.2.1,-x.1,x.1+x.2.1+x.2.2)
lemma gsp4CgRoots (a b c : ℤ) : (cgToParity (a,b,c)).1 + (cgToParity (a,b,c)).2.1 ≡
    (cgToParity (a,b,c)).2.2 [ZMOD 2] := by sorry
lemma gsp4Kostant (a b c : ℚ) : cgWeyl 2 (a,b,c) = (b,-a,a+c) ∧ cgWeyl 3 (a,b,c) = (-b,-a,a+b+c) := by sorry
def cgDominant : Set CGWeight := {x | x.2.1 ≤ x.1 ∧ 0 ≤ x.2.1}
lemma gsp4ConeReversal (i : Fin 4) :
    (fun x : CGWeight => (-x.2.1,-x.1,-x.2.2)) '' (cgWeyl i '' cgDominant) =
      cgWeyl ⟨3-i.val, by omega⟩ '' cgDominant := by sorry

private def cgJ : Matrix (Fin 4) (Fin 4) ℝ :=
  !![0,0,0,1; 0,0,1,0; 0,-1,0,0; -1,0,0,0]
lemma gsp4Centralizer (M : Matrix (Fin 4) (Fin 4) ℝ) (ν : ℝ) (hν : ν ≠ 0)
    (hsp : M.transpose * cgJ * M = ν • cgJ)
    (hcentral : M*cgJ = cgJ*M) : M.transpose*M = ν • (1 : Matrix _ _ ℝ) ∧ 0 < ν := by sorry
-- Block Cayley transform supplies the unitary group identification; Lie-group structure omitted.
lemma gsp4Unitary (A B : Matrix (Fin 2) (Fin 2) ℝ)
    (h1 : A.transpose*A+B.transpose*B=1) (h2 : A.transpose*B=B.transpose*A) :
    (A.map (algebraMap ℝ ℂ) + Complex.I • B.map (algebraMap ℝ ℂ)).conjTranspose *
      (A.map (algebraMap ℝ ℂ) + Complex.I • B.map (algebraMap ℝ ℂ)) = 1 := by sorry

def gsp4CompactCartan : AddSubgroup (ℤ×ℤ×ℤ) :=
  { carrier := {x | x.1+x.2.1 ≡ x.2.2 [ZMOD 2]}
    zero_mem' := by sorry
    add_mem' := by sorry
    neg_mem' := by sorry }
lemma compactCartanRank : Nonempty (gsp4CompactCartan ≃+ (ℤ×ℤ×ℤ)) := by sorry
lemma compactCartanParity (a b c : ℤ) : (a,b,c) ∈ gsp4CompactCartan ↔ a+b ≡ c [ZMOD 2] := by sorry
-- Actual evaluation on the extra kernel element; torus exponential carrier is absent.
lemma compactCartanEmbedding (a b c : ℤ) :
    (-1 : ℂ)^a * (-1 : ℂ)^b * (-1 : ℂ)^c = 1 ↔ (a,b,c) ∈ gsp4CompactCartan := by sorry
-- TauCeti.Shimura.tests.cartanParityTrue
example : (1,0,1) ∈ gsp4CompactCartan ∧ (0,1,1) ∈ gsp4CompactCartan ∧ (0,0,2) ∈ gsp4CompactCartan := by sorry
-- TauCeti.Shimura.tests.cartanParityFalse
example : (1,0,0) ∉ gsp4CompactCartan := by sorry
-- TauCeti.Shimura.tests.cartanRank
example : Function.Bijective (fun x : ℤ×ℤ×ℤ => (⟨(x.1,x.2.1,x.1+x.2.1+2*x.2.2), by sorry⟩ : gsp4CompactCartan)) := by sorry
-- At (π,π;πi), each angle rotation is -I₂ and the scalar exponential is -1.
-- Their products are +I₂: this is the extra kernel coset missed by an even-π lattice.
lemma gsp4ExpKernel : Complex.exp (Real.pi * Complex.I) = -1 ∧
    Complex.exp (Real.pi * Complex.I) * (-1) = 1 := by sorry

private def cayleyInverseMatrix : Matrix (Fin 4) (Fin 4) ℂ :=
  (1/2 : ℂ) • !![1,0,0,Complex.I; 0,1,Complex.I,0; 0,Complex.I,1,0; Complex.I,0,0,1]
def gsp4CayleyBasis : Matrix (Fin 4) (Fin 4) ℂ :=
  !![1,0,0,-Complex.I; 0,1,-Complex.I,0; 0,-Complex.I,1,0; -Complex.I,0,0,1]
lemma cayleyInverse : gsp4CayleyBasis * cayleyInverseMatrix = 1 := by sorry
lemma cayleyHodgeLines : (cgJ.map (algebraMap ℝ ℂ)) * gsp4CayleyBasis =
    gsp4CayleyBasis * Matrix.diagonal ![-Complex.I,-Complex.I,Complex.I,Complex.I] := by sorry
lemma cayleyConjugation (i j : Fin 4) : star (gsp4CayleyBasis i j) =
    Complex.I * gsp4CayleyBasis i ⟨3-j.val, by omega⟩ := by sorry
-- TauCeti.Shimura.tests.cayleyProduct
example : cayleyInverseMatrix * gsp4CayleyBasis = 1 := by sorry
-- TauCeti.Shimura.tests.cayleyColumn
example : (fun i => gsp4CayleyBasis i 0) = ![1,0,0,-Complex.I] := by sorry
-- TauCeti.Shimura.tests.cayleyWrongSign
example : ( !![1,0,0,Complex.I; 0,1,Complex.I,0; 0,-Complex.I,1,0; -Complex.I,0,0,1] : Matrix (Fin 4) (Fin 4) ℂ).det = 0 := by sorry
lemma gsp4CayleyAction (A B : Matrix (Fin 2) (Fin 2) ℝ)
    (S : Matrix (Fin 2) (Fin 2) ℝ) (hS : S = !![0,1;1,0]) :
    cayleyInverseMatrix * (Matrix.reindex finSumFinEquiv finSumFinEquiv
      (Matrix.fromBlocks (S*A*S) (S*B) (-B*S) A)).map (algebraMap ℝ ℂ) * gsp4CayleyBasis =
      Matrix.reindex finSumFinEquiv finSumFinEquiv (Matrix.fromBlocks ((S*A*S).map (algebraMap ℝ ℂ) - Complex.I • (S*B*S).map (algebraMap ℝ ℂ)) 0 0
        (A.map (algebraMap ℝ ℂ) + Complex.I • B.map (algebraMap ℝ ℂ))) := by sorry
-- Root lattice comes from RG2.5. This is half the sum for the corrected lower Borel.
lemma gsp4PilloniConvention :
    ((-1 : ℚ)+(-2)+(-1)+0)/2 = -2 ∧
    ((1 : ℚ)+0+(-1)+(-2))/2 = -1 := by sorry

/- Local valuations use Mathlib's existing AddValuation. The absolutely-unramified
local field, extended normalized valuation and Iw₁ characteristic-polynomial comparison
are LF.0/RG2.3 inputs. The polynomial calculation and generated subgroup bound are retained. -/
lemma localEigenvalueBound {K : Type*} [Field K] (v : AddValuation K (WithTop ℚ))
    (y : K) (a : Fin 4 → K) (ha : ∀ i, (1 : WithTop ℚ) ≤ v (a i))
    (hroot : y^4 + ∑ i : Fin 4, a i * y^i.val = 0) :
    (1/4 : WithTop ℚ) ≤ v y := by sorry
lemma localProductsBound {K : Type*} [Field K] (v : AddValuation K (WithTop ℚ))
    (eigen : Set Kˣ) (heigen : ∀ x ∈ eigen, (1/4 : WithTop ℚ) ≤ v ((x : K)-1)) :
    ∀ x ∈ Subgroup.closure eigen, (1/4 : WithTop ℚ) ≤ v ((x : K)-1) := by sorry
lemma localTorsionGap {K : Type*} [Field K] (v : AddValuation K (WithTop ℚ)) (l : ℕ) (hl : 5 < l)
    (ζ : Kˣ) (hζ : ζ ≠ 1) (n : ℕ) (hn : 0 < n) (htors : ζ^n=1)
    (cyclotomic : v ((ζ : K)-1) ≤ (1/(l-1) : WithTop ℚ)) :
    v ((ζ : K)-1) < (1/4 : WithTop ℚ) := by sorry
lemma iwahoriNeat {K : Type*} [Field K] (v : AddValuation K (WithTop ℚ)) (eigen : Set Kˣ)
    (hbound : ∀ x ∈ Subgroup.closure eigen, (1/4 : WithTop ℚ) ≤ v ((x : K)-1))
    (htors : ∀ x : Kˣ, x ≠ 1 → ∀ n : ℕ, 0 < n → x^n=1 → v ((x : K)-1) < (1/4 : WithTop ℚ)) :
    ∀ x ∈ Subgroup.closure eigen, ∀ n : ℕ, 0 < n → x^n=1 → x=1 := by sorry

-- Rational adelic lattice conjugation and generated eigenvalue identification are omitted.
-- For det M=1 the two eigenvalues are inverses, so this calculation excludes every torsion product.
lemma gl2CongruenceNeat (N : ℕ) (hN : 3 ≤ N) (M B : Matrix (Fin 2) (Fin 2) ℤ)
    (hM : M = 1 + (N : ℤ) • B) (hdet : M.det = 1)
    (λ : ℂ) (hroot : (M.map (algebraMap ℤ ℂ)).charpoly.IsRoot λ)
    (n : ℕ) (hn : 0 < n) (htors : λ^n = 1) : λ = 1 := by sorry

end TauCeti.Shimura
