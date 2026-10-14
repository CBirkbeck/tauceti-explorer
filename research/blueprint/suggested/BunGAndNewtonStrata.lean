import Mathlib
import TauCeti.Algebra.AlgebraicGroup.DiagonalizableGroup.Weight

/-!
# BunGAndNewtonStrata: representative target signatures

The roadmap is the accompanying README. This file records light definitions and
representative milestones statable against the pinned Mathlib and Tau Ceti APIs;
it is not exhaustive. Arithmetic Frobenius acts on the right of a representative
`b`; twisted conjugation is `g * b * sigma(g)⁻¹`, and Kottwitz coinvariants are
integral. Numerical GL_n data includes denominator multiplicities. The Witt
specialization has algebraically closed residue field. Geometry over the relative
curve remains in the README until its actual carriers are available.
-/

noncomputable section
namespace TauCetiRoadmap.BunGAndNewtonStrata
universe u v w

/-! ## Layer 0: torsors and isocrystals with reductive structure -/

section TwistedGroup
variable {G : Type u} [Group G]

/-- Arithmetic twisted conjugation of a representative. -/
def twistedConjugate (sigma : G ≃* G) (g b : G) : G := g * b * (sigma g)⁻¹

/-- The equivalence relation for changing a Frobenius trivialization. -/
def sigmaSetoid (sigma : G ≃* G) : Setoid G where
  r b c := ∃ g : G, c = twistedConjugate sigma g b
  iseqv := by sorry

/-- Orbit classes of representatives; this set does not retain automorphisms. -/
def SigmaClass (sigma : G ≃* G) := Quotient (sigmaSetoid sigma)

namespace SigmaClass
/-- The class of a representative. -/
def mk (sigma : G ≃* G) (b : G) : SigmaClass sigma :=
  Quotient.mk (sigmaSetoid sigma) b

/-- Equality in the orbit set is existence of a twisted conjugator. -/
theorem mk_eq_iff (sigma : G ≃* G) (b c : G) :
    mk sigma b = mk sigma c ↔ ∃ g, c = g * b * (sigma g)⁻¹ := by sorry

example (b c : G) : mk (MulEquiv.refl G) b = mk (MulEquiv.refl G) c ↔
    ∃ g, c = g * b * g⁻¹ := by sorry
example {A : Type u} [CommGroup A] (b c : A) :
    mk (MulEquiv.refl A) b = mk (MulEquiv.refl A) c ↔ b = c := by sorry
example : mk (MulEquiv.refl ℚˣ) 1 ≠ mk (MulEquiv.refl ℚˣ) (-1) := by sorry
end SigmaClass

namespace SigmaCentralizer
/-- The point stabilizer, before algebraic representability and descent. -/
def points (sigma : G ≃* G) (b : G) : Subgroup G where
  carrier := {g | g * b = b * sigma g}
  one_mem' := by sorry
  mul_mem' := by sorry
  inv_mem' := by sorry

/-- A representative change conjugates the stabilizer by the same element. -/
theorem conjugate_points (sigma : G ≃* G) (b g h : G) :
    h ∈ points sigma b ↔
      g * h * g⁻¹ ∈ points sigma (twistedConjugate sigma g b) := by sorry

example (sigma : G ≃* G) (g : G) :
    g ∈ points sigma 1 ↔ sigma g = g := by sorry
example : points (MulEquiv.refl G) (1 : G) = ⊤ := by sorry
end SigmaCentralizer

/-- The ordered product of exactly r Frobenius translates. -/
def frobeniusNorm (sigma : G ≃* G) (b : G) : ℕ → G
  | 0 => 1
  | r + 1 => frobeniusNorm sigma b r * ((sigma : G → G)^[r]) b

/-- The positive-period equation underlying decency, without Newton integrality. -/
def decencyEquation (sigma : G ≃* G) (b a : G) (r : ℕ) : Prop :=
  0 < r ∧ frobeniusNorm sigma b r = a

/-- The norm of a twisted conjugate uses the r-th Frobenius iterate at its endpoint. -/
theorem frobeniusNorm_twisted (sigma : G ≃* G) (b g : G) (r : ℕ) :
    frobeniusNorm sigma (twistedConjugate sigma g b) r =
      g * frobeniusNorm sigma b r * (((sigma : G → G)^[r]) g)⁻¹ := by sorry

example (sigma : G ≃* G) (b : G) : frobeniusNorm sigma b 1 = b := by sorry
example (sigma : G ≃* G) (b : G) :
    frobeniusNorm sigma b 2 = b * sigma b := by sorry
example (sigma : G ≃* G) (b a : G) : ¬ decencyEquation sigma b a 0 := by sorry
example (sigma : G ≃* G) (b a : G) :
    decencyEquation sigma b a 1 ↔ b = a := by sorry
end TwistedGroup

namespace FamilyDescentControls
variable {R K : Type u} [CommRing R] [Field K] [Algebra R K]

/-- A stable over-lattice cannot satisfy a bound excluding its shear coefficient. -/
theorem shear_violates_bound (sigma : K ≃+* K) (a scale : K)
    (hnonintegral : scale * a ∉ Set.range (algebraMap R K)) :
    ¬ ∃ M : Submodule R (Fin 2 → K),
      ![0, 1] ∈ M ∧
      (∀ x ∈ M, ![sigma (x 0) + a * sigma (x 1), sigma (x 1)] ∈ M) ∧
      (∀ x ∈ M, scale * x 0 ∈ Set.range (algebraMap R K)) := by sorry

/-- An ambient linear lift need not preserve the tensors of the norm-one torus.
This does not refute existence of a different lift in the smaller group. -/
theorem ambient_lift_not_tensor_lift :
    (fun x : Fin 2 → ℚ => ![2 * x 0, -(x 0) / 2 + x 1]) ![1, 1] = ![2, 1 / 2] ∧
    Function.Bijective (fun x : Fin 2 → ℚ => ![2 * x 0, -(x 0) / 2 + x 1]) ∧
    ∀ t : ℚˣ,
      (fun x : Fin 2 → ℚ => ![2 * x 0, -(x 0) / 2 + x 1]) ≠
      (fun x : Fin 2 → ℚ => ![(t : ℚ) * x 0, ((t⁻¹ : ℚˣ) : ℚ) * x 1]) := by sorry
end FamilyDescentControls

/-! ## Layer 1: Newton and integral Kottwitz invariants -/

namespace WittRankOne
variable (p : ℕ) [Fact p.Prime] (k : Type u) [Field k] [IsAlgClosed k] [CharP k p]

/-- Frobenius on units of a coefficient ring. -/
def unitFrobenius {K : Type u} [CommRing K] (sigma : K ≃+* K) : Kˣ ≃* Kˣ where
  toFun := Units.map sigma.toMonoidHom
  invFun := Units.map sigma.symm.toMonoidHom
  left_inv := by sorry
  right_inv := by sorry
  map_mul' := by sorry

/-- The actual unramified Witt coefficient field. -/
abbrev Coefficients := FractionRing (WittVector p k)

/-- Arithmetic Frobenius on Witt coefficient units. -/
abbrev sigma := unitFrobenius (WittVector.FractionRing.frobenius p k)

/-- The uniformizer, viewed as a unit of the fraction field. -/
def uniformizer : (Coefficients p k)ˣ :=
  Units.mk0 (p : Coefficients p k) (WittVector.FractionRing.p_nonzero p k)

/-- Rank-one classification normalized by the positive valuation of p. -/
theorem classification :
    ∃ e : SigmaClass (sigma p k) ≃ ℤ,
      ∀ m : ℤ, e (SigmaClass.mk (sigma p k) (uniformizer p k ^ m)) = m := by sorry

example {K : Type u} [CommRing K] (s : K ≃+* K) (x : Kˣ) :
    (unitFrobenius s x : K) = s (x : K) := by sorry
example {K : Type u} [CommRing K] (x : Kˣ) :
    unitFrobenius (RingEquiv.refl K) x = x := by sorry
example : (uniformizer p k : Coefficients p k) = p := by sorry
example : SigmaClass.mk (sigma p k) 1 ≠
    SigmaClass.mk (sigma p k) (uniformizer p k) := by sorry
example : SigmaClass.mk (sigma p k) (uniformizer p k) ≠
    SigmaClass.mk (sigma p k) (uniformizer p k)⁻¹ := by sorry
end WittRankOne

/-- Numerical GL_n slope data; each denominator divides its multiplicity. -/
structure GLnSlopeData (n : ℕ) where
  slopes : Fin n → ℚ
  descending : Antitone slopes
  kottwitz : ℤ
  total_eq : (∑ i, slopes i) = (kottwitz : ℚ)
  denominatorMultiplicity : ∀ i, (slopes i).den ∣
    (Finset.univ.filter (fun j => slopes j = slopes i)).card

namespace GLnSlopeData
/-- Dominance includes equality of the integral determinant invariant. -/
def dominance {n : ℕ} (x y : GLnSlopeData n) : Prop :=
  x.kottwitz = y.kottwitz ∧ ∀ k : ℕ, k ≤ n →
    (∑ i : Fin n, if i.val < k then x.slopes i else 0) ≤
    (∑ i : Fin n, if i.val < k then y.slopes i else 0)

/-- Basic GL_n data has constant standard-representation slope. -/
def basic {n : ℕ} (x : GLnSlopeData n) : Prop := ∀ i j, x.slopes i = x.slopes j

/-- Numerical acceptability for a prescribed slope bound. -/
def acceptable {n : ℕ} (x mu : GLnSlopeData n) : Prop := dominance x mu

/-- The ordinary numerical class attains the prescribed Hodge slopes. -/
def ordinary {n : ℕ} (x mu : GLnSlopeData n) : Prop :=
  acceptable x mu ∧ x.slopes = mu.slopes

/-- The rank-two basic slope one-half datum. -/
def half : GLnSlopeData 2 where
  slopes := fun _ => 1/2
  descending := by sorry
  kottwitz := 1
  total_eq := by sorry
  denominatorMultiplicity := by sorry

/-- The rank-two ordinary slopes one and zero. -/
def split : GLnSlopeData 2 where
  slopes := fun i => if i = 0 then 1 else 0
  descending := by sorry
  kottwitz := 1
  total_eq := by sorry
  denominatorMultiplicity := by sorry

/-- The slope-zero datum in any rank, including rank zero. -/
def zero (n : ℕ) : GLnSlopeData n where
  slopes := fun _ => 0
  descending := by sorry
  kottwitz := 0
  total_eq := by sorry
  denominatorMultiplicity := by sorry

/-- Dominance is antisymmetric on descending, integral slope data. -/
theorem dominance_antisymm {n : ℕ} (x y : GLnSlopeData n)
    (hxy : dominance x y) (hyx : dominance y x) : x = y := by sorry

example : dominance half split ∧ ¬ dominance split half := by sorry
example : basic half ∧ ¬ basic split := by sorry
example : acceptable half split ∧ ¬ acceptable split half := by sorry
example : ordinary split split ∧ ¬ ordinary half split := by sorry
example : basic (zero 0) ∧ ordinary (zero 0) (zero 0) := by sorry
example : ¬ ∃ x : GLnSlopeData 1, x.slopes 0 = (1/2 : ℚ) := by sorry
end GLnSlopeData

namespace SlopeProtorus
open CategoryTheory
variable (E : Type u) [Field E]

/-- Coordinate Hopf algebra of D(Q), with no finite-type claim. -/
abbrev coordinates : CommHopfAlgCat.{max u 0} E :=
  CommHopfAlgCat.of E (MonoidAlgebra E (Multiplicative ℚ))

/-- The slope-q map D(Q) to G_m on coordinate algebras. -/
def character (q : ℚ) :
    MonoidAlgebra E (Multiplicative ℤ) →ₐc[E] MonoidAlgebra E (Multiplicative ℚ) :=
  MonoidAlgebra.mapDomainBialgHom E (AddMonoidHom.toMultiplicative
    { toFun := fun n : ℤ => (n : ℚ) * q
      map_zero' := by sorry
      map_add' := by sorry })

/-- Finite representations have finitely many rational weights and a common denominator. -/
theorem finite_weights_and_denominators
    {H : Type v} [CommRing H] [HopfAlgebra E H]
    (V : Type w) [AddCommGroup V] [Module E V] [TauCeti.Comodule E H V] [Module.Finite E V]
    (nu : H →ₐc[E] MonoidAlgebra E (Multiplicative ℚ)) :
    {q : ℚ | TauCeti.DiagonalizableGroup.weightSpace V
      (nu : H →ₗc[E] MonoidAlgebra E (Multiplicative ℚ)) (Multiplicative.ofAdd q) ≠ ⊥}.Finite ∧
    ∃ n : ℕ, 0 < n ∧ ∀ q : ℚ,
      TauCeti.DiagonalizableGroup.weightSpace V
        (nu : H →ₗc[E] MonoidAlgebra E (Multiplicative ℚ)) (Multiplicative.ofAdd q) ≠ ⊥ →
      ∃ m : ℤ, (n : ℚ) * q = (m : ℚ) := by sorry

example : character E (1/2)
    (MonoidAlgebra.single (Multiplicative.ofAdd (2 : ℤ)) (1 : E)) =
      MonoidAlgebra.single (Multiplicative.ofAdd (1 : ℚ)) (1 : E) := by sorry
example (n : ℤ) : character E 0
    (MonoidAlgebra.single (Multiplicative.ofAdd n) (1 : E)) = 1 := by sorry
example (n : ℤ) : character E (1/2) ≠ character E (n : ℚ) := by sorry
end SlopeProtorus

namespace KottwitzDescent
variable {G : Type u} [Group G] {A : Type v} [AddCommGroup A]

/-- The integral cyclic representation generated by Frobenius. -/
def cyclicRepresentation (tau : A ≃+ A) : Representation ℤ (Multiplicative ℤ) A where
  toFun n := (tau.toIntLinearEquiv ^ n.toAdd).toLinearMap
  map_one' := by sorry
  map_mul' := by sorry

/-- Native integral coinvariants, retaining their torsion. -/
abbrev Target (tau : A ≃+ A) := Representation.Coinvariants (cyclicRepresentation tau)

/-- A Frobenius-equivariant homomorphism, without a reductive classification axiom. -/
structure Data (sigma : G ≃* G) (tau : A ≃+ A) where
  representative : G →* Multiplicative A
  frobenius : ∀ g, (representative (sigma g)).toAdd = tau (representative g).toAdd

/-- Equivariant representative invariants descend uniquely through twisted conjugacy. -/
theorem descent (sigma : G ≃* G) (tau : A ≃+ A) (d : Data sigma tau) :
    ∃! f : SigmaClass sigma → Target tau,
      ∀ b, f (SigmaClass.mk sigma b) =
        Representation.Coinvariants.mk (cyclicRepresentation tau)
          (d.representative b).toAdd := by sorry

/-- Abelian twisted conjugacy is exactly the integral cyclic coinvariant quotient. -/
theorem abelian_classification (tau : A ≃+ A) :
    ∃ e : SigmaClass (AddEquiv.toMultiplicative tau) ≃ Target tau,
      ∀ a : A, e (SigmaClass.mk (AddEquiv.toMultiplicative tau) (Multiplicative.ofAdd a)) =
        Representation.Coinvariants.mk (cyclicRepresentation tau) a := by sorry

example (tau : A ≃+ A) (a : A) :
    cyclicRepresentation tau (Multiplicative.ofAdd 1) a = tau a := by sorry
example (a : A) : cyclicRepresentation (AddEquiv.refl A) (Multiplicative.ofAdd 7) a = a :=
  by sorry
end KottwitzDescent

/-- The affine solution fibre of Frobenius minus identity, with no chosen origin. -/
def ComponentCoset {A : Type u} [AddCommGroup A] (tau : A ≃+ A) (difference : A) : Set A :=
  {x | tau x - x = difference}

namespace ComponentCoset
/-- A nonempty difference fibre is a translate of the fixed subgroup. -/
theorem translate {A : Type u} [AddCommGroup A] (tau : A ≃+ A) (difference x : A)
    (hx : x ∈ ComponentCoset tau difference) :
    ComponentCoset tau difference = {y | ∃ z : A, tau z = z ∧ y = x + z} := by sorry

/-- Sign Frobenius on the integral rank-one lattice. -/
def negation : ℤ ≃+ ℤ where
  toFun := fun x => -x
  invFun := fun x => -x
  left_inv := by sorry
  right_inv := by sorry
  map_add' := by sorry

example : ComponentCoset (AddEquiv.refl ℤ) 0 = Set.univ := by sorry
example : ComponentCoset negation 2 = {(-1 : ℤ)} := by sorry
example : ComponentCoset negation 1 = ∅ := by sorry

/-- Sign coinvariants have two elements; rational averaging would lose their torsion. -/
theorem sign_coinvariants :
    ∃ e : KottwitzDescent.Target negation ≃+ ZMod 2,
      ∀ a : ℤ, e (Representation.Coinvariants.mk
        (KottwitzDescent.cyclicRepresentation negation) a) = (a : ZMod 2) := by sorry

example : Representation.Coinvariants.mk (KottwitzDescent.cyclicRepresentation negation) 0 ≠
    Representation.Coinvariants.mk (KottwitzDescent.cyclicRepresentation negation) 1 := by sorry
example : Representation.Coinvariants.mk (KottwitzDescent.cyclicRepresentation negation) 2 =
    Representation.Coinvariants.mk (KottwitzDescent.cyclicRepresentation negation) 0 := by sorry
end ComponentCoset

/-! ## Layer 2: the bundle stack and uniformization

G-bundles on the relative curve, Bun_G, its geometric classification and topology,
and uniformization remain README targets until the earlier roadmaps supply their
actual geometric carriers.
-/

/-! ## Layer 3: automorphism groups and Newton strata

HN-graded bundles, represented filtered automorphisms, the positive automorphism
kernel, basic strata and flag Newton strata remain README targets. Basicness means
central Newton morphism; it does not force one slope in every representation.
-/

/-! ## Completion of Layer 2: the whole smooth Artin stack

The Isom diagonal, whole-stack smoothness and connected components remain README
targets; the component argument uses the preceding stratum results.
-/

/-! ## Layer 4: filtered charts and specialization

Opposite filtered charts, negative Banach–Colmez towers, their split sections,
contracting actions and Jacobian positivity remain README targets. None is asserted
over an unconstrained replacement for a geometric carrier.
-/

/- The README specifies GBundle, GIsocrystal, DecentRepresentative, Defect,
TorusSpecial, Ordinary, GIsocrystalFamily, AbelianizedClass, CurveEtaleBase, Bun,
HNGraded, FilteredAutomorphism, FullAutomorphism, Semistable, TorusPicard,
FilteredChart, FlagNewton, AlgebraicPiOne, NewtonSpace, HodgeInvariants, Invariants,
Basic, NewtonOrder, Acceptable, RationalNewtonWitness and CentralNewtonOnJ.
Their general reductive or geometric carriers and canonical comparison maps
require the preceding roadmaps. SigmaClass, SigmaCentralizer, SlopeProtorus and
ComponentCoset above record only their explicitly stated native cores.
PureInnerTwist, BasicInnerFormEquivalence and DivisionAlgebraMorita likewise remain
README comparison targets, with no admitted data construction here. -/

end TauCetiRoadmap.BunGAndNewtonStrata
