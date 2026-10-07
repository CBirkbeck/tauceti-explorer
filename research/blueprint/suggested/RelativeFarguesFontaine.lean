/-
This file is not the roadmap and is not exhaustive. The roadmap document
research/blueprint/readmes/RelativeFarguesFontaine.md is definitive.
These statements suggest Lean forms so that contributors and reviewers converge
on names and signatures. Proposed constructions and proofs use `sorry`; no
implementation is claimed, and all packet implementation statuses are unchecked.

Baseline: Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.

RF0--RF3 and RF4 are assembled under separate sections, preserving their
TauCeti.RelativeFF and TauCeti qualified names and isolating opens and universes.
Native signatures use the imported algebraic/topological carriers. Conditions
requiring the relative perfectoid, v-site, curve, completed-divisor or torsor
interfaces are omitted and identified in local comments/CONTRACT blocks; they
are never represented by arbitrary Prop-valued property fields.

The input parts have unresolved signature/test findings and unfilled mathematical
contracts, listed precisely in handoff/ASM-RelativeFarguesFontaine.md. Their known
false/definition-independent assertions are omitted here with exact specifications;
the existing polynomial Q-congruence is threaded through its native forms. Joining or
elaborating this file does not discharge those findings. CONTRACT prose is not a
native declaration or an elaborated unit test. The actual hypotheses and tests
are those in the reader and packets, which remain the specification.
-/
import Mathlib.RingTheory.WittVector.Basic
import Mathlib.RingTheory.WittVector.Frobenius
import Mathlib.RingTheory.WittVector.Teichmuller
import Mathlib.RingTheory.Perfectoid.FontaineTheta
import Mathlib.RingTheory.Perfectoid.BDeRham
import Mathlib.RingTheory.AdicCompletion.Algebra
import Mathlib.RingTheory.AdicCompletion.RingHom
import Mathlib.RingTheory.DiscreteValuationRing.Basic
import Mathlib.RingTheory.Valuation.Basic
import Mathlib.RingTheory.PowerSeries.Basic
import Mathlib.RingTheory.Polynomial.Basic
import Mathlib.RingTheory.Etale.Basic
import Mathlib.RingTheory.Etale.Field
import Mathlib.RingTheory.GradedAlgebra.Basic
import Mathlib.AlgebraicGeometry.ProjectiveSpectrum.Scheme
import Mathlib.Geometry.RingedSpace.SheafedSpace
import Mathlib.CategoryTheory.Sites.Sheaf
import Mathlib.Data.Sym.Basic
import Mathlib.Topology.Category.TopCat.Basic
import Mathlib.RingTheory.TensorProduct.Basic
import Mathlib.Analysis.Normed.Unbundled.RingSeminorm
import Mathlib.Analysis.SpecialFunctions.Pow.Real
import Mathlib.RingTheory.Localization.Away.Basic
import TauCeti.RingTheory.Huber.Pair
import TauCeti.AlgebraicGeometry.AdicSpace.Spa.Basic
import Mathlib.RingTheory.Flat.Basic
import Mathlib.Algebra.Module.FinitePresentation
import Mathlib.RingTheory.Etale.Finite
import Mathlib.RingTheory.Smooth.AdicCompletion
import Mathlib.RingTheory.Henselian
import Mathlib.RingTheory.PicardGroup
import Mathlib.LinearAlgebra.Dual.Defs
import Mathlib.LinearAlgebra.TensorProduct.Tower

noncomputable section RF0_RF3
open CategoryTheory Opposite AlgebraicGeometry TopologicalSpace
open scoped TensorProduct NNReal
universe u v
namespace TauCeti.RelativeFF

/-! The coefficient context is the complete DVR O_E with uniformizer pi and
residue cardinality q. Those coefficient identifications, and q=p^f, are omitted
until the LocalFields/finite-residue interface is supplied. Ghost formulas are
already meaningful in any coefficient algebra. -/
section Coefficients
variable {OE : Type v} [CommRing OE] (pi : OE) (q : ℕ)
variable (A : Type u) [CommRing A] [Algebra OE A]

def ramifiedGhost (pi : OE) (q : ℕ) (A : Type u) [CommRing A] [Algebra OE A] (n : ℕ) (x : ℕ → A) : A := by sorry

theorem ramifiedGhost_zero (x : ℕ → A) : ramifiedGhost pi q A 0 x = x 0 := by sorry

theorem ramifiedGhost_one (x : ℕ → A) :
    ramifiedGhost pi q A 1 x = x 0 ^ q + algebraMap OE A pi * x 1 := by sorry

theorem ramifiedGhost_natural {B : Type u} [CommRing B] [Algebra OE B]
    (f : A →ₐ[OE] B) (n : ℕ) (x : ℕ → A) :
    ramifiedGhost pi q B n (f ∘ x) = f (ramifiedGhost pi q A n x) := by sorry

def ramifiedWittPolynomials (pi : OE) (q : ℕ) (n : ℕ) : MvPolynomial ℕ OE := by sorry
-- ghost_first
example (x : ℕ → A) : ramifiedGhost pi q A 0 x = x 0 := by sorry
-- ghost_second
example (x : ℕ → A) :
    ramifiedGhost pi q A 1 x = x 0 ^ q + algebraMap OE A pi * x 1 := by sorry
-- ghost_p_typical: p is prime; the Z-algebra is the underlying coefficient action.
example (p : ℕ) [Fact p.Prime] (x : WittVector p A) (n : ℕ) :
    ramifiedGhost (p : ℤ) p A n x.coeff = WittVector.ghostComponent n x := by sorry

/-- Polynomial construction on arbitrary algebras; ghost injectivity is not assumed. -/
def ramifiedWitt (pi : OE) (q : ℕ) (A : Type u) [CommRing A] [Algebra OE A] : Type u := by sorry
instance ramifiedWittArbitraryAlgebras : CommRing (ramifiedWitt pi q A) := by sorry
instance ramifiedWittAlgebra : Algebra OE (ramifiedWitt pi q A) := by sorry

def ramifiedCoeffs : ramifiedWitt pi q A → ℕ → A := by sorry
def ramifiedMk : (ℕ → A) ≃ ramifiedWitt pi q A := by sorry

def ramifiedWitt_map {B : Type u} [CommRing B] [Algebra OE B]
    (f : A →ₐ[OE] B) : ramifiedWitt pi q A →ₐ[OE] ramifiedWitt pi q B := by sorry

theorem ramifiedWitt_ext (x y : ramifiedWitt pi q A)
    (h : ∀ n, ramifiedCoeffs pi q A x n = ramifiedCoeffs pi q A y n) : x = y := by sorry

theorem ramifiedWitt_coeff_mk (x : ℕ → A) (n : ℕ) :
    ramifiedCoeffs pi q A (ramifiedMk pi q A x) n = x n := by sorry

theorem ramifiedWitt_map_coeff {B : Type u} [CommRing B] [Algebra OE B]
    (f : A →ₐ[OE] B) (x : ramifiedWitt pi q A) (n : ℕ) :
    ramifiedCoeffs pi q B (ramifiedWitt_map pi q A f x) n = f (ramifiedCoeffs pi q A x n) := by sorry

theorem ramifiedWitt_map_id (x : ramifiedWitt pi q A) :
    ramifiedWitt_map pi q A (AlgHom.id OE A) x = x := by sorry

theorem ramifiedWitt_map_comp {B C : Type u} [CommRing B] [Algebra OE B]
    [CommRing C] [Algebra OE C] (f : A →ₐ[OE] B) (g : B →ₐ[OE] C)
    (x : ramifiedWitt pi q A) :
    ramifiedWitt_map pi q A (g.comp f) x =
      ramifiedWitt_map pi q B g (ramifiedWitt_map pi q A f x) := by sorry

def ramifiedWitt_ghost_hom (n : ℕ) : ramifiedWitt pi q A →ₐ[OE] A := by sorry

def ramifiedWitt_p_typical (p : ℕ) [Fact p.Prime] :
    ramifiedWitt (p : ℤ) p A ≃+* WittVector p A := by sorry
-- witt_zero_algebra
example : Subsingleton (ramifiedWitt (2 : ℤ) 2 (ZMod 1)) := by sorry
-- witt_ghost_operations
example (n : ℕ) (x y : ramifiedWitt pi q A) :
    ramifiedWitt_ghost_hom pi q A n (x + y) =
      ramifiedWitt_ghost_hom pi q A n x + ramifiedWitt_ghost_hom pi q A n y ∧
    ramifiedWitt_ghost_hom pi q A n (x * y) =
      ramifiedWitt_ghost_hom pi q A n x * ramifiedWitt_ghost_hom pi q A n y := by sorry
-- witt_torsion_not_strict: V([T]) is not a multiple of p over the imperfect residue ring.
example : ∃ x : WittVector 2 (Polynomial (ZMod 2)),
    x.coeff 0 = 0 ∧ x ∉ Ideal.span {(2 : WittVector 2 (Polynomial (ZMod 2)))} := by sorry

/-- The sigma is the O_E-linear q-Frobenius lift; pi is regular in A. -/
theorem ramifiedDworkCriterion (sigma : A →ₐ[OE] A)
    (hpi : ∀ a : A, algebraMap OE A pi * a = 0 → a = 0)
    (hsigma : ∀ a : A, algebraMap OE A pi ∣ sigma a - a ^ q) :
    Function.Injective (fun x : ℕ → A => fun n => ramifiedGhost pi q A n x) ∧
    ∀ y : ℕ → A, (∃ x : ℕ → A, ∀ n, ramifiedGhost pi q A n x = y n) ↔
      ∀ n, algebraMap OE A pi ^ (n + 1) ∣ y (n + 1) - sigma (y n) := by sorry

def uniformizerChange (pi' : OE) (hu : ∃ u : OEˣ, pi' = ↑u * pi) :
    ramifiedWitt pi q A ≃ₐ[OE] ramifiedWitt pi' q A := by sorry

def ramifiedWittUniformizerChange (pi' : OE) (hu : ∃ u : OEˣ, pi' = ↑u * pi) :
    ramifiedWitt pi q A ≃ₐ[OE] ramifiedWitt pi' q A := by sorry

theorem uniformizerChange_ghost (pi' : OE) (hu : ∃ u : OEˣ, pi' = ↑u * pi)
    (n : ℕ) (x : ramifiedWitt pi q A) :
    ramifiedWitt_ghost_hom pi' q A n (uniformizerChange pi q A pi' hu x) =
      ramifiedWitt_ghost_hom pi q A n x := by sorry

theorem uniformizerChange_cocycle (pi' pi'' : OE)
    (h1 : ∃ u : OEˣ, pi' = ↑u * pi) (h2 : ∃ u : OEˣ, pi'' = ↑u * pi')
    (h3 : ∃ u : OEˣ, pi'' = ↑u * pi) :
    (uniformizerChange pi q A pi' h1).trans (uniformizerChange pi' q A pi'' h2) =
      uniformizerChange pi q A pi'' h3 := by sorry

def ramifiedTeich : A →* ramifiedWitt pi q A := by sorry

def ramifiedFrobenius : ramifiedWitt pi q A →ₐ[OE] ramifiedWitt pi q A := by sorry

def ramifiedVerschiebung : ramifiedWitt pi q A →+ ramifiedWitt pi q A := by sorry

def ramifiedTeichFrobeniusVerschiebung : A →* ramifiedWitt pi q A := by sorry

theorem uniformizerChange_teich (pi' : OE) (hu : ∃ u : OEˣ, pi' = ↑u * pi) (a : A) :
    uniformizerChange pi q A pi' hu (ramifiedTeich pi q A a) = ramifiedTeich pi' q A a := by sorry
-- uniformizer_same
example (h : ∃ u : OEˣ, pi = ↑u * pi) (x : ramifiedWitt pi q A) :
    uniformizerChange pi q A pi h x = x := by sorry
-- uniformizer_inverse
example (pi' : OE) (h : ∃ u : OEˣ, pi' = ↑u * pi)
    (h' : ∃ u : OEˣ, pi = ↑u * pi') (x : ramifiedWitt pi q A) :
    uniformizerChange pi' q A pi h' (uniformizerChange pi q A pi' h x) = x := by sorry
-- uniformizer_coordinates: transport V with its unit scalar; it is not coordinatewise identity.
example (u : OEˣ) (h : ∃ w : OEˣ, ↑u * pi = ↑w * pi) (x : ramifiedWitt pi q A) :
    ramifiedVerschiebung (↑u * pi) q A (uniformizerChange pi q A (↑u * pi) h x) =
      algebraMap OE _ (↑u : OE) *
        uniformizerChange pi q A (↑u * pi) h (ramifiedVerschiebung pi q A x) := by sorry

theorem ramifiedFV (x : ramifiedWitt pi q A) :
    ramifiedFrobenius pi q A (ramifiedVerschiebung pi q A x) = algebraMap OE _ pi * x := by sorry

theorem ramifiedVProjection (x y : ramifiedWitt pi q A) :
    ramifiedVerschiebung pi q A (ramifiedFrobenius pi q A x * y) =
      x * ramifiedVerschiebung pi q A y := by sorry

theorem ramifiedVF_residue (hpi : algebraMap OE A pi = 0) (x : ramifiedWitt pi q A) :
    ramifiedVerschiebung pi q A (ramifiedFrobenius pi q A x) = algebraMap OE _ pi * x := by sorry
-- teich_product
example (a b : A) : ramifiedTeich pi q A (a * b) =
    ramifiedTeich pi q A a * ramifiedTeich pi q A b ∧
    ramifiedTeich pi q A 0 = 0 ∧ ramifiedTeich pi q A 1 = 1 := by sorry
-- teich_not_additive
example : WittVector.teichmuller 2 (R := ZMod 2) 1 + WittVector.teichmuller 2 (R := ZMod 2) 1 ≠
    WittVector.teichmuller 2 (R := ZMod 2) (1 + 1) := by sorry
-- fv_not_vf_general
example : ramifiedFrobenius (2 : ℤ) 2 ℤ (ramifiedVerschiebung (2 : ℤ) 2 ℤ 1) = 2 ∧
    ramifiedVerschiebung (2 : ℤ) 2 ℤ (ramifiedFrobenius (2 : ℤ) 2 ℤ 1) ≠ 2 := by sorry

/-- Algebraic finite-truncation fragment of V-adic completeness. -/
def vAdicTruncation (n : ℕ) : Ideal (ramifiedWitt pi q A) := by sorry

theorem ramifiedVAdicExpansion (x : ramifiedWitt pi q A) :
    ∃! a : ℕ → A, ∀ n,
      x - ∑ i ∈ Finset.range n, (ramifiedVerschiebung pi q A)^[i] (ramifiedTeich pi q A (a i))
        ∈ vAdicTruncation pi q A n := by sorry

/- CONTRACT ramifiedWittUniversalProperty:
RelativeFarguesFontaine:RF0/ramified-witt-universal-property
Omitted pending the actual all-E strict-lift/coefficient context. The mixed-characteristic arbitrary-algebra ramifiedWitt carrier cannot also be identified with an equal-characteristic power-series ring. The finite-residue test requires its specified uniformizer, cardinality and completeness.

Target: For every nonarchimedean local E with finite residue F_q and perfect F_q-algebra R, W_OE(R) is the unique π-adically complete π-torsion-free (hence O_E-flat) O_E-algebra with specified reduction W_OE(R)/π≅R. It has unique multiplicative Teichmuller representatives and unique π-adic expansions Σπ^n[r_n]; q-Frobenius lifts r↦r^q. In characteristic zero it is canonically W(R)⊗_(W(F_q))O_E, already complete because O_E is finite free. In equal characteristic it is R[[π]]. Uniqueness is in the category of complete lifts with the fixed residue identification.
Hypothesis: E mixed or equal characteristic; R perfect. Arbitrary-algebra ghost theory above is only claimed in its source range, E characteristic zero.

API strictLift_reduce: W_OE(R)/π≃R, natural in perfect R.
API strictLift_expansion: Each element has exactly one Σπ^n[r_n] expansion.
API strictLift_complete: W_OE(R) is π-adically complete and O_E-flat.
API strictLift_frobenius: φ(Σπ^n[r_n])=Σπ^n[r_n^q].
API strictLift_equalChar: For E=F_q((π)), W_OE(R)≃R[[π]], preserving π and coefficients.
API strictLift_pTypical: For E=Q_p, W_OE(R)≃WittVector p R, preserving [−],φ and reduction.
Test strict_lift_fq (computation): W_OE(F_q)≃O_E.
Test strict_lift_zero (degenerate): W_OE(0)=0.
Test strict_lift_equal_char (compatibility): In equal characteristic [a]+[b]=[a+b] in R[[π]]; the nonadditivity test for mixed characteristic must not be universal.
Test strict_lift_perfect_required (non-example): For R=F_p[t], Frobenius is not bijective and reduction modulo p of W(R) does not recover R.
These specifications are not native declarations or compiled examples.
-/
/-! Finite coefficient extension: f is its residue degree, q'=q^f. The source
formula is u V_pi = (pi/pi') V_pi' u F^(f-1). The coefficient DVR extension and
residue-cardinality interface are omitted; the equation keeps the iterate in
its correct ring. -/
variable (OE' : Type v) [CommRing OE'] [Algebra OE OE'] (pi' : OE') (f : ℕ)
variable [Algebra OE' A] [IsScalarTower OE OE' A]

def coefficientMap : ramifiedWitt pi q A →+* ramifiedWitt pi' (q ^ f) A := by sorry

def ramifiedCoefficientComparison : ramifiedWitt pi q A →+* ramifiedWitt pi' (q ^ f) A := by sorry

theorem coefficientMap_teich (a : A) :
    coefficientMap pi q A OE' pi' f (ramifiedTeich pi q A a) = ramifiedTeich pi' (q ^ f) A a := by sorry

theorem coefficientMap_frobenius (x : ramifiedWitt pi q A) :
    coefficientMap pi q A OE' pi' f ((ramifiedFrobenius pi q A)^[f] x) =
      ramifiedFrobenius pi' (q ^ f) A (coefficientMap pi q A OE' pi' f x) := by sorry

theorem coefficientMap_verschiebung (a : OE') (ha : algebraMap OE OE' pi = a * pi')
    (x : ramifiedWitt pi q A) :
    coefficientMap pi q A OE' pi' f (ramifiedVerschiebung pi q A x) =
      algebraMap OE' _ a * ramifiedVerschiebung pi' (q ^ f) A
        (coefficientMap pi q A OE' pi' f ((ramifiedFrobenius pi q A)^[f - 1] x)) := by sorry
-- coefficient_identity
example (x : ramifiedWitt pi q A) : coefficientMap pi q A OE pi 1 x = x := by sorry
-- coefficient_ghost_one
example (x : ramifiedWitt pi q A) :
    ramifiedWitt_ghost_hom pi' (q ^ f) A 1 (coefficientMap pi q A OE' pi' f x) =
      ramifiedWitt_ghost_hom pi q A f x := by sorry
-- coefficient_unramified_frobenius
example (x : ramifiedWitt pi q A) :
    coefficientMap pi q A OE' pi' f ((ramifiedFrobenius pi q A)^[f] x) =
      ramifiedFrobenius pi' (q ^ f) A (coefficientMap pi q A OE' pi' f x) := by sorry
end Coefficients

section CoefficientDiagonal
variable {OE : Type v} [CommRing OE] (pi : OE) (q : ℕ)
variable (A : Type u) [CommRing A] [Algebra OE A]
-- Delta is a natural map, not a diagonal of coordinate sequences.
def ramifiedDiagonal : ramifiedWitt pi q A →ₐ[OE]
    ramifiedWitt pi q (ramifiedWitt pi q A) := by sorry

def ramifiedWittDiagonal : ramifiedWitt pi q A →ₐ[OE]
    ramifiedWitt pi q (ramifiedWitt pi q A) := by sorry

theorem ramifiedDiagonal_ghost (n : ℕ) (x : ramifiedWitt pi q A) :
    ramifiedWitt_ghost_hom pi q (ramifiedWitt pi q A) n (ramifiedDiagonal pi q A x) =
      (ramifiedFrobenius pi q A)^[n] x := by sorry
-- The specified unramified coefficient action uses Delta; the unramified-extension
-- interface is absent. Its underlying coefficient homomorphism is prototyped.
def unramifiedCoefficientAction (OEun : Type u) [CommRing OEun] :
    OEun →+* ramifiedWitt pi q A := by sorry
-- diagonal_ghost_zero
example (x : ramifiedWitt pi q A) :
    ramifiedWitt_ghost_hom pi q (ramifiedWitt pi q A) 0 (ramifiedDiagonal pi q A x) = x := by sorry
-- diagonal_ghost_one
example (x : ramifiedWitt pi q A) :
    ramifiedWitt_ghost_hom pi q (ramifiedWitt pi q A) 1 (ramifiedDiagonal pi q A x) =
      ramifiedFrobenius pi q A x := by sorry
-- diagonal_unramified_action: specialization A to the finite residue extension.
example (OEun : Type u) [CommRing OEun] :
    Function.Bijective (unramifiedCoefficientAction pi q A OEun) := by sorry
-- OEun is the maximal unramified subextension; it cannot be replaced by OE.
def perfectCoefficientBaseChange (OEun OE' : Type u) [CommRing OEun] [CommRing OE']
    [Algebra OEun OE'] [Algebra OEun (ramifiedWitt pi q A)]
    [Algebra OE' A] (pi' : OE') (f : ℕ)
    (hperfect : Function.Bijective (fun a : A => a ^ (q ^ f))) :
    (ramifiedWitt pi q A ⊗[OEun] OE') ≃+* ramifiedWitt pi' (q ^ f) A := by sorry

variable (Q : Polynomial OE)
def twistedGhost (pi : OE) (q : ℕ) (A : Type u) [CommRing A] [Algebra OE A]
    (Q : Polynomial OE) (n : ℕ) (x : ℕ → A) : A := by sorry

/-- The actual coefficientwise congruence Q ≡ X^q modulo pi. -/
def WittTwistAdmissible (pi : OE) (q : ℕ) (Q : Polynomial OE) : Prop :=
  ∀ n, pi ∣ (Q - Polynomial.X ^ q).coeff n

variable (hQ : WittTwistAdmissible pi q Q)

def twistedWitt (pi : OE) (q : ℕ) (A : Type u) [CommRing A] [Algebra OE A]
    (Q : Polynomial OE) (hQ : WittTwistAdmissible pi q Q) : Type u := by sorry
instance twistedWittRing : CommRing (twistedWitt pi q A Q hQ) := by sorry
instance twistedWittAlgebra : Algebra OE (twistedWitt pi q A Q hQ) := by sorry

def twistedWittEquiv : twistedWitt pi q A Q hQ ≃ₐ[OE] ramifiedWitt pi q A := by sorry

def qTwistedWittFunctor : twistedWitt pi q A Q hQ ≃ₐ[OE] ramifiedWitt pi q A := by sorry
-- twist_first_ghost
example (x : ℕ → A) : twistedGhost pi q A Q 1 x =
    Polynomial.aeval (x 0) Q + algebraMap OE A pi * x 1 := by sorry
-- twist_ordinary
example (n : ℕ) (x : ℕ → A) :
    twistedGhost pi q A (Polynomial.X ^ q) n x = ramifiedGhost pi q A n x := by sorry
-- twist_torsion
example : Nonempty (twistedWitt (2 : ℤ) 2 (ZMod 4) (Polynomial.X ^ 2)
    (by intro n; simp) ≃+* ramifiedWitt (2 : ℤ) 2 (ZMod 4)) := by sorry

def qTeich (Q : Polynomial OE) (hQ : WittTwistAdmissible pi q Q) :
    A → ramifiedWitt pi q A := by sorry

def qTeichmullerLift (Q : Polynomial OE) (hQ : WittTwistAdmissible pi q Q) :
    A → ramifiedWitt pi q A := by sorry

theorem qTeich_ghost (a : A) (n : ℕ) :
    ramifiedWitt_ghost_hom pi q A n (qTeich pi q A Q hQ a) =
      (fun b => Polynomial.aeval b Q)^[n] a := by sorry

theorem qTeich_equation (a : A) :
    Polynomial.aeval (qTeich pi q A Q hQ a) Q =
      qTeich pi q A Q hQ (Polynomial.aeval a Q) := by sorry
-- q_teich_ordinary
example (a : A) : qTeich pi q A (Polynomial.X ^ q)
    (by intro n; simp) a = ramifiedTeich pi q A a := by sorry
-- q_teich_multiplicative_group
example (a : ZMod 2)
    (h : WittTwistAdmissible (2 : ℤ) 2 ((1 + Polynomial.X) ^ 2 - 1)) :
    qTeich (2 : ℤ) 2 (ZMod 2) ((1 + Polynomial.X) ^ 2 - 1) h a =
      ramifiedTeich (2 : ℤ) 2 (ZMod 2) (1 + a) - 1 := by sorry
-- q_teich_not_multiplicative
example (h : WittTwistAdmissible (2 : ℤ) 2 ((1 + Polynomial.X) ^ 2 - 1)) :
    qTeich (2 : ℤ) 2 (ZMod 2) ((1 + Polynomial.X) ^ 2 - 1) h 1 ≠
      qTeich (2 : ℤ) 2 (ZMod 2) ((1 + Polynomial.X) ^ 2 - 1) h 1 *
      qTeich (2 : ℤ) 2 (ZMod 2) ((1 + Polynomial.X) ^ 2 - 1) h 1 := by sorry

/- CONTRACT qTeichmullerLift:
RelativeFarguesFontaine:RF0:integral-Y/q-teichmuller-lift
The Q congruence is threaded through the native construction and ghost/equation API above. Only qTeich_limit is omitted: the perfect residue, its roots, weak completion topology and the actual lifted inverse roots must be supplied; an arbitrary topology is insufficient.

Target: Transport (a,0,…) through the twisted Witt comparison to define [a]_Q∈W_OE(A). Its ghosts are Q_n(a), it satisfies Q([a]_Q)=[Q(a)]_Q, and every element has a unique V_π expansion ΣV_π^n[a_n]_Q. For perfect F_q-algebra A the π expansion is unique and [a]_Q=lim_n Q_n(â_n), for any lifts â_n of a^(q^(−n)). The map is not generally multiplicative.
Hypothesis: Arbitrary O_E-algebra A for the ghosts and V expansion; perfect residue algebra for the π expansion and limit.

API qTeich: Natural lift A→W_OE(A).
API qTeich_ghost: w_n([a]_Q)=Q_n(a).
API qTeich_equation: Q([a]_Q)=[Q(a)]_Q.
API qTeich_limit: For perfect residue A, [a]_Q=lim_n Q_n(â_n).
Test q_teich_ordinary (compatibility): For Q=X^q, [a]_Q=[a].
Test q_teich_multiplicative_group (computation): For E=Q_p and Q=(1+X)^p−1, [a]_Q=[1+a]−1.
Test q_teich_not_multiplicative (non-example): At p=2 and a=b=1 in F_2, [1]_Q=−1, so [ab]_Q≠[a]_Q[b]_Q.
These specifications are not native declarations or compiled examples.
-/
/- CONTRACT lubinTateTeichmullerLift:
RelativeFarguesFontaine:RF0:integral-Y/lubin-tate-teichmuller-lift
Omitted pending the LocalFields Part II formal-group/convergence interface. The source and target laws and scalar actions must be evaluations of the same specified LT law on maximal ideals; independent arbitrary functions cannot substitute for them.

Target: If Q≡πX mod X² and Q≡X^q mod π, its Lubin–Tate formal group satisfies LT_Q([x]_Q,[y]_Q)=[LT_Q(x,y)]_Q when perfect A is complete for (x,y). For a perfect complete valued field F of characteristic p and any Lubin–Tate formal group LT over O_E, the weak limit [x]_LT=lim_n[π^n]_LT([x^(q^(−n))]) gives an injective O_E-module map (m_F,+_LT)→(W_OE(m_F),+_LT). This is a module map for the formal-group law, not for ordinary addition.
Hypothesis: E characteristic zero for this cited arbitrary Witt functor; x,y topologically nilpotent. The general formal power series require the weak topology, not solely π-adic convergence.

API ltTeich: Injective map m_F→W_OE(m_F), with LT laws on source and target.
API ltTeich_add: LT([x]_LT,[y]_LT)=[LT(x,y)]_LT.
API ltTeich_scalar: [a]_LT([x]_LT)=[[a]_LT(x)]_LT for a∈O_E.
API ltTeich_limit: The weak limit of the displayed π iterates is [x]_LT.
Test lt_teich_zero (degenerate): [0]_LT=0.
Test lt_teich_multiplicative (computation): For the multiplicative formal group, [x]_LT=[1+x]−1.
Test lt_teich_injective (compatibility): Reduction of [x]_LT is x, so a nonzero x∈m_F has nonzero lift.
These specifications are not native declarations or compiled examples.
-/
-- The topology is the weak product topology on Teichmuller coefficients;
-- the perfect valued field and finite-residue interfaces are omitted.
theorem coefficientWeakTopology [TopologicalSpace (ramifiedWitt pi q A)] (varpi : A) :
    IsAdicComplete (Ideal.span {algebraMap OE _ pi, ramifiedTeich pi q A varpi})
      (ramifiedWitt pi q A) := by sorry
end CoefficientDiagonal

/-! Integral charts. The perfectoid pair, rational-completion topology and
root-extension coefficient interfaces are omitted. The chart objects use
existing ring, subring, topology and sheafed-space types. -/
section IntegralGeometry
variable (W : Type u) [CommRing W] [TopologicalSpace W] (pi varpi : W)

def integralChartRing (W : Type u) [CommRing W] [TopologicalSpace W] (pi varpi : W) (n : ℕ) : Type u := by sorry
instance integralChartRing_commRing (n : ℕ) : CommRing (integralChartRing W pi varpi n) := by sorry
instance integralChartRing_algebra (n : ℕ) : Algebra W (integralChartRing W pi varpi n) := by sorry
instance integralChartRing_topology (n : ℕ) : TopologicalSpace (integralChartRing W pi varpi n) := by sorry

def integralChartPlus (n : ℕ) : Subring (integralChartRing W pi varpi n) := by sorry

def integralRationalChartRings (W : Type u) [CommRing W] [TopologicalSpace W] (pi varpi : W) (n : ℕ) : SheafedSpace CommRingCat := by sorry
-- The full universal property requires a complete Huber target and rational bounds.
def integralChart_universal (n : ℕ) (B : Type u) [CommRing B] [Algebra W B]
    [TopologicalSpace B] (hvarpi : IsUnit (algebraMap W B varpi)) :
    integralChartRing W pi varpi n →ₐ[W] B := by sorry
-- q-Frobenius and its index transport are supplied by the coefficient data.
def integralChart_frobenius (n m : ℕ) (phi : W →+* W) :
    integralChartRing W pi varpi n →+* integralChartRing W pi varpi m := by sorry
-- chart_special_fibre
example (n : ℕ) : let B := integralChartRing W pi varpi n
    algebraMap W (B ⧸ Ideal.span {algebraMap W B pi}) pi = 0 ∧
      IsUnit (algebraMap W (B ⧸ Ideal.span {algebraMap W B pi}) varpi) := by sorry
-- chart_unit_denominator
example (n : ℕ) : IsUnit (algebraMap W (integralChartRing W pi varpi n) varpi) ∧
    Filter.Tendsto (fun m : ℕ => algebraMap W (integralChartRing W pi varpi n) varpi ^ m)
      Filter.atTop (nhds 0) := by sorry
/- CONTRACT integralRationalChartRings:
RelativeFarguesFontaine:RF0:integral-Y/integral-rational-chart-rings
The native chart carrier and its unit/special-fibre fragments are above. The chart_not_witt_tate test is omitted until the original weak Witt topology and the actual chart comparison are typed. Repeating a chart-unit assertion does not test non-Tate-ness of the original ring.

Target: Put W=W_OE(R^+) with ideal of definition (π,[ϖ]). For n=p^m>0, C_n=W⟨π^n/[ϖ]⟩ is the completed rational ring of definition; B_n=C_n[1/[ϖ]], and B_n^+ is the integral closure of C_n in B_n. The rational subset is |π|^n≤|[ϖ]|≠0. Its Tate unit is [ϖ]; π is allowed to vanish. The completion topology is the rational-localisation topology induced from W, not solely π-adic.
Hypothesis: S=Spa(R,R^+) affinoid perfectoid over F_q; R^+ open integrally closed bounded; ϖ a topologically nilpotent unit of R.

API integralChartRing: B_n=W⟨π^n/[ϖ]⟩[1/[ϖ]], with its completed topology.
API integralChartPlus: Integral closure of C_n in B_n.
API integralChart_universal: Continuous W-maps to complete pairs satisfying the rational bounds factor uniquely through B_n.
API integralChart_frobenius: φ compares n=p^m charts through q-power Teichmuller coefficients.
Test chart_special_fibre (degenerate): π=0 is allowed and [ϖ] is invertible on each chart.
Test chart_unit_denominator (computation): [ϖ] is a topologically nilpotent unit in B_n.
Test chart_not_witt_tate (non-example): W with its (π,[ϖ])-adic topology is not asserted Tate; Tate-ness is obtained after the chart localisation.
These specifications are not native declarations or compiled examples.
-/
-- Integral completed tensor followed by adjoining the entire ratios pi_m/v_m.
def rootChartModel (W : Type u) [CommRing W] [TopologicalSpace W] (pi varpi : W) (p : ℕ) : Type u := by sorry
instance rootChartModel_commRing (p : ℕ) : CommRing (rootChartModel W pi varpi p) := by sorry

def rootExtensionChartModel (W : Type u) [CommRing W] [TopologicalSpace W] (pi varpi : W) (p : ℕ) : Type u := by sorry

-- The actual root-chart residue comparison is specified below.

def rootChartRatio (p : ℕ) : ℕ → rootChartModel W pi varpi p := by sorry

theorem rootChart_roots (p : ℕ) (m : ℕ) :
    rootChartRatio W pi varpi p (m + 1) ^ p = rootChartRatio W pi varpi p m := by sorry
-- The actual coefficient root systems and tilt presentation are specified below.
-- root_boundary_norm
example (B : Type u) [CommRing B] (v : Valuation B ℝ≥0)
    (a b s : B) (h : a = b * s) (hb : v b ≠ 0) (hab : v a = v b) : v s = 1 := by sorry
-- root_special_fibre
example (B : Type u) [CommRing B] (a b s : B) (h : a = b * s)
    (ha : a = 0) (hb : IsUnit b) : s = 0 := by sorry
-- root_wrong_fraction
example (r : ℝ) (hr : 0 < r) (hr1 : r < 1) (p m : ℕ)
    (hp : 1 < p) (hm : 0 < m) : 1 < r ^ (((p : ℝ) ^ m)⁻¹) / r := by sorry
/- CONTRACT rootExtensionChartModel:
RelativeFarguesFontaine:RF0:integral-Y/root-extension-chart-model
The constructed ratio and compatible-power relation are native above. rootChart_reduce and rootChart_tiltCoordinate are omitted until their quotient, coefficient roots and tilt model are identified with this same chart. root_reciprocal must test the actual proposed reciprocal coordinate, rather than noninvertibility of zero in an unrelated ring.

Target: Let E_root∞ be the completion of E(π^(1/p^∞)). On the n=1 chart let π_m=π^(1/p^m), v_m=[ϖ]^(1/p^m), s_m=π_m/v_m. In the completed base extension, set A_0^+=(W⊗̂_OE O_(E_root∞))[s_m:m≥0]^∧_[ϖ], with π_m=v_m s_m and s_(m+1)^p=s_m. Then A=A_0^+[1/[ϖ]], and A^+ is the integral closure of the extended chart plus ring. Reduction gives A_0^+/[ϖ]≃(R^+/ϖ)[t_1^(1/p^∞)]. The quotient in s_m roots the entire ratio π/[ϖ].
Hypothesis: Choose compatible roots; R^+ is perfect, so v_m exists. E_root∞ is distinct from the Lubin–Tate torsion extension used for divisor sections.

API rootChartModel: Completed presentation with π_m=v_ms_m.
API rootChart_reduce: A_0^+/[ϖ]≃(R^+/ϖ)[t_1^(1/p^∞)].
API rootChart_roots: s_(m+1)^p=s_m.
API rootChart_tiltCoordinate: t_1^sharp=π/[ϖ], so |t_1|≤1 on the n=1 chart.
API rootChartRatio: The specified compatible whole-ratio sequence s_m in the completed chart; rootChart_roots applies to this sequence.
Test root_boundary_norm (computation): On the common boundary |s_m|=1.
Test root_special_fibre (degenerate): π=0 maps t_1^sharp to 0 while [ϖ] remains invertible.
Test root_wrong_fraction (non-example): Rooting only the numerator fails the boundary norm at every m>0.
Test root_reciprocal (non-example): [ϖ]/π is undefined on π=0 and cannot be this chart coordinate.
These specifications are not native declarations or compiled examples.
-/
-- The source's chart sheaf theorem, expressed in the existing ringed-space vocabulary.
def chartCoverPerfectoidnessAndSheafiness (W : Type u) [CommRing W] [TopologicalSpace W] (pi varpi : W) (n : ℕ) : SheafedSpace CommRingCat := by sorry

def integralPeriodDomain (W : Type u) [CommRing W] [TopologicalSpace W] (pi varpi : W) : SheafedSpace CommRingCat := by sorry

def curlyYAffinoidDefinition (W : Type u) [CommRing W] [TopologicalSpace W] (pi varpi : W) : SheafedSpace CommRingCat := by sorry

def integralPeriodDomain_independent (varpi' : W) :
    integralPeriodDomain W pi varpi ≅ integralPeriodDomain W pi varpi' := by sorry

def integralPeriodDomain_frobenius :
    integralPeriodDomain W pi varpi ≅ integralPeriodDomain W pi varpi := by sorry
-- Carrier-level rational condition; the spa chart identification is omitted.
theorem integralPeriodDomain_chart (n : ℕ) (v : Valuation W ℝ≥0) :
    (v pi ^ n ≤ v varpi ∧ v varpi ≠ 0) ↔ (v pi ^ n ≤ v varpi ∧ 0 < v varpi) := by sorry
-- integral_equal_char_disc
example (C : Type u) [Field C] (v : Valuation C ℝ≥0) : v 0 < 1 := by sorry
-- integral_zero_fibre
example (v : Valuation W ℝ≥0) (hpi : v pi = 0) (hv : v varpi ≠ 0) :
    v pi ≤ v varpi ∧ v varpi ≠ 0 := by sorry
-- integral_not_generic
example (v : Valuation W ℝ≥0) (hpi : v pi = 0) (hv : v varpi ≠ 0) :
    ¬(v pi ≠ 0 ∧ v varpi ≠ 0) := by sorry
end IntegralGeometry

/-! v-site formulas. C,J must be the imported perfectoid v-site, S the represented
base and SpdOE/SpdE the imported coefficient sheaves. These geometric conditions
are omitted; all objects and morphisms have the existing Sheaf type. -/
section DiamondFormulas
variable {C : Type u} [Category C] (J : GrothendieckTopology C)
variable (S SpdOE SpdE YIntegral YGeneric XCurve : Sheaf J (Type v))
def untiltFunctorOfPoints : YIntegral ≅ Limits.prod S SpdOE := by sorry
-- Open-base compatibility is the pullback statement on the underlying spaces.
theorem gluingForGeneralBase {T B : Type u} [TopologicalSpace T] [TopologicalSpace B]
    (proj : T → B) (U : Set B) (hU : IsOpen U) (hp : Continuous proj) :
    IsOpen (proj ⁻¹' U) := by sorry
-- Frobenius quotient sheaf is the imported quotient on S x SpdE.
def diamondFormulaAndMapToBase (Q : Sheaf J (Type v)) :
    (YGeneric ≅ Limits.prod S SpdE) × (XCurve ≅ Q) := by sorry
end DiamondFormulas

section AnalyticEnds
variable (W : Type u) [CommRing W] [TopologicalSpace W] (p varpi : W)
def wholeAnalyticAinf (W : Type u) [CommRing W] [TopologicalSpace W] (p varpi : W) : SheafedSpace CommRingCat := by sorry

def wholeAnalyticAinfLocus (W : Type u) [CommRing W] [TopologicalSpace W] (p varpi : W) : SheafedSpace CommRingCat := by sorry
-- Underlying valuation condition: complement of simultaneous vanishing.
theorem wholeAnalyticAinf_cover (v : Valuation W ℝ≥0) :
    (v p ≠ 0 ∨ v varpi ≠ 0) ↔
    (v varpi ≤ v p ∧ v p ≠ 0) ∨ (v p ≤ v varpi ∧ v varpi ≠ 0) := by sorry

def wholeAnalyticAinf_overlap (W : Type u) [CommRing W] [TopologicalSpace W] (p varpi : W) : SheafedSpace CommRingCat := by sorry
-- analytic_crystalline_end
example (v : Valuation W ℝ≥0) (h : v varpi = 0) (hp : v p ≠ 0) :
    v p ≠ 0 ∨ v varpi ≠ 0 := by sorry
-- analytic_special_end
example (v : Valuation W ℝ≥0) (h : v p = 0) (hv : v varpi ≠ 0) :
    v p ≠ 0 ∨ v varpi ≠ 0 := by sorry
-- analytic_not_generic_union
example (v : Valuation W ℝ≥0) (h : v varpi = 0) (hp : v p ≠ 0) :
    ¬(v p ≠ 0 ∧ v varpi ≠ 0) := by sorry
-- The specified two-chart presheaf has an ordinary sheaf structure.
def wholeAnalyticAinfSheafiness (W : Type u) [CommRing W] [TopologicalSpace W] (p varpi : W) : SheafedSpace CommRingCat := by sorry
/- CONTRACT puncturedAinfBundleAlgebraicity:
`RelativeFarguesFontaine:RF0:integral-Y/punctured-ainf-bundle-algebraicity` is a
presentation comparison/import, not a second algebraicity theorem. Identify
RF0's Z_S, its punctured algebraic spectrum and their actual pullback with the
objects of the single RF4 owner
`RelativeFarguesFontaine:RF4:vector-bundles/kedlaya-algebraicity-of-punctured-bundles`
by x = varpi. Transport that owner's equivalence. The valued-field extension
retains its field hypotheses. The two vector-bundle categories and the geometric
pullback are unavailable at the baseline; no theorem for an arbitrary functor
is substituted for this import.
-/
end AnalyticEnds

section ClassicalPoints
variable (W Csharp : Type u) [CommRing W] [CommRing Csharp]
-- Marked untilt equation: the point is recorded through its Cartier ideal.
def classicalIntegralPoint (theta : W →+* Csharp) : Ideal W := by sorry

def classicalPointsOfIntegralPeriodDisc (theta : W →+* Csharp) : Ideal W := by sorry
-- Kernel/residue reconstruction of the marked point, not injectivity of a
-- bare assignment from arbitrary unmarked untilts to an abstract isomorphism class.
def classicalIntegralPoint_injective (theta : W →+* Csharp)
    (hsurj : Function.Surjective theta) : (W ⧸ RingHom.ker theta) ≃+* Csharp := by sorry
/- CONTRACT classicalPointsOfIntegralPeriodDisc:
RelativeFarguesFontaine:RF0:integral-Y/classical-points-of-integral-period-disc
The kernel/residue fragments above are retained. The equal-characteristic locus and all three locus tests require the actual classical-point map/marked disc. Polynomial X-a being nonzero does not distinguish Gauss and evaluation kernels.

Target: For C algebraically closed perfectoid over F_q, a point of curly-Y_C is classical precisely when it is the closed Cartier point of an O_E-untilt C^sharp with a specified identification (C^sharp)^flat≃C. The completed residue field and induced theta map recover this marking. In equal characteristic curly-Y_C is an open unit disc and its classical points are a∈C with |a|<1, including a=0.
Hypothesis: Closed points arising from marked untilts; the assertion that all maximal ideals or all closed points have this form is a separate VB2-classification theorem.

API classicalIntegralPoint: The Cartier point attached to a marked O_E-untilt.
API classicalIntegralPoint_injective: The completed residue field and theta recover the marked untilt.
API classicalIntegralPoint_equalChar: Classical points identify with {a∈C:|a|<1}.
Test classical_zero (degenerate): In equal characteristic a=0 is classical on the special fibre.
Test classical_small_nonzero (computation): A nonzero a with |a|<1 gives a generic classical point.
Test classical_gauss_nonexample (non-example): A positive-radius Gauss point is not a classical point.
These specifications are not native declarations or compiled examples.
-/
-- Continuous map of spaces, not a ring map from C into its Witt ring.
def periodDiscTiltMap (D Y : TopCat) : D ⟶ Y := by sorry

def tiltingMapOfPeriodDisc (D Y : TopCat) : D ⟶ Y := by sorry

theorem periodDiscTiltMap_classical (D Y : TopCat) (DiscClass : Set D) (YClass : Set Y) :
    (periodDiscTiltMap D Y) ⁻¹' YClass = DiscClass := by sorry
-- The coefficient context and marked point are omitted; this is its equation.
theorem periodDiscTiltMap_equation (pi a : W) (theta : W →+* Csharp)
    (h : theta pi = theta a) : pi - a ∈ RingHom.ker theta := by sorry
-- tilting_zero
example (pi : W) : Ideal.span {pi - (0 : W)} = Ideal.span {pi} := by sorry
-- tilting_equation
example (pi a : W) (theta : W →+* Csharp) (h : pi - a ∈ RingHom.ker theta) :
    theta pi = theta a := by sorry
-- tilting_not_additive
example : WittVector.teichmuller 2 (R := ZMod 2) 1 + WittVector.teichmuller 2 (R := ZMod 2) 1 ≠
    WittVector.teichmuller 2 (R := ZMod 2) (1 + 1) := by sorry
/- CONTRACT gaussDiscFibre:
RelativeFarguesFontaine:RF0:integral-Y/gauss-disc-fibre
Omitted until the convergent nonzero power series, its actual Gauss norm and completed disc are supplied. An arbitrary function and arbitrary nonnegative bound do not imply the source estimate.

Target: Let x∈D_C(C), 0<ρ<1 with the closed ρ-disc contained in D_C, and x_ρ its Gauss point. After base change to its completed residue field C(x_ρ), the fibre of x_ρ contains the open disc of radius ρ around the tautological point. For power series f, |u−t|<ρ implies |f(u)−f(t)|<|f(x_ρ)| when f is nonzero, so the restricted valuations agree.
Hypothesis: Use a disc genuinely contained in the open unit disc. The printed membership condition x_ρ∈|D_C| already excludes ρ=1; 0<ρ<1 is an explicit equivalent range here, not a source misprint.

These specifications are not native declarations or compiled examples.
-/
-- Source spaces are the actual disc and its specified completed-field base change.
theorem classicalBaseChangeAndNonclassicalFibres (D D' : TopCat)
    (baseChange : D' ⟶ D) (classical : Set D) (classical' : Set D') (x : D) :
    (x ∈ classical ↔ ∃ y : D', y ∈ classical' ∧
      ∀ z : D', baseChange z = x ↔ z = y) := by sorry
-- The groups are Gal(K(x)^sep/K(x)) and I_E, imported from the local-fields owner.
def inertiaAtAPeriodGaussPoint (G I : Type u) [Group G] [Group I] :
    {f : G →* I // Function.Surjective f} := by sorry
end ClassicalPoints

section GenericGeometry
variable (W : Type u) [CommRing W] [TopologicalSpace W] (pi varpi : W)
def genericPeriodDomain (W : Type u) [CommRing W] [TopologicalSpace W] (pi varpi : W) : SheafedSpace CommRingCat := by sorry

def genericPeriodDomain_open :
    genericPeriodDomain W pi varpi ⟶ integralPeriodDomain W pi varpi := by sorry
-- The imported open-immersion interface is omitted; this is the induced map.
def genericPeriodDomain_functorial (W' : Type u) [CommRing W'] [TopologicalSpace W']
    (pi' varpi' : W') (f : W →+* W') :
    genericPeriodDomain W' pi' varpi' ⟶ genericPeriodDomain W pi varpi := by sorry
-- generic_equal_char
example (C : Type u) [Field C] (v : Valuation C ℝ≥0) (a : C) (h : a ≠ 0) : v a ≠ 0 := by sorry
-- generic_special_absent
example (v : Valuation W ℝ≥0) (h : v pi = 0) : ¬(v pi ≠ 0 ∧ v varpi ≠ 0) := by sorry
-- generic_both_invertible
example (v : Valuation W ℝ≥0) (h : v (pi * varpi) ≠ 0) : v pi ≠ 0 ∧ v varpi ≠ 0 := by sorry

def periodRadius (W : Type u) [CommRing W] [TopologicalSpace W] (pi varpi : W) (v : Valuation W ℝ≥0) : ℝ := by sorry

def periodAnnulus (W : Type u) [CommRing W] [TopologicalSpace W] (pi varpi : W) (a b : ℚ) : SheafedSpace CommRingCat := by sorry

def radiusFunctionAndRationalAnnuli (W : Type u) [CommRing W] [TopologicalSpace W] (pi varpi : W) (a b : ℚ) : SheafedSpace CommRingCat := by sorry
-- Rank-one generalization and Frobenius hypotheses are omitted.
theorem periodRadius_frobenius (q : ℕ) (phi : W →+* W) (v : Valuation W ℝ≥0) :
    periodRadius W pi varpi (v.comap phi) = q * periodRadius W pi varpi v := by sorry

def periodAnnulus_restrict (a b c d : ℚ) (h : a ≤ c ∧ c ≤ d ∧ d ≤ b) :
    periodAnnulus W pi varpi c d ⟶ periodAnnulus W pi varpi a b := by sorry

def periodAnnulus_plus (B : Type u) [CommRing B] : Subring B := by sorry
-- radius_scale
example (v : Valuation W ℝ≥0) (a : ℝ)
    (hpi : 0 < (v pi : ℝ) ∧ (v pi : ℝ) < 1)
    (h : (v varpi : ℝ) = (v pi : ℝ) ^ a) : periodRadius W pi varpi v = a := by sorry
-- annulus_equal_ends: carrier fragment of the boundary rational annulus.
example (v : Valuation W ℝ≥0) (n : ℕ) (h : v varpi = v pi ^ n) :
    v pi ^ n ≤ v varpi ∧ v varpi ≤ v pi ^ n := by sorry
-- radius_varpi_power
example (v : Valuation W ℝ≥0) (m : ℕ) :
    periodRadius W pi (varpi ^ m) v = m * periodRadius W pi varpi v := by sorry

-- Analytic quotient supplied by the adic-space owner; no private adic-space type.
def relativeCurve (W : Type u) [CommRing W] [TopologicalSpace W] (pi varpi : W) : SheafedSpace CommRingCat := by sorry

def frobeniusQuotientAndPresentation (W : Type u) [CommRing W] [TopologicalSpace W] (pi varpi : W) : SheafedSpace CommRingCat := by sorry

def relativeCurve_localChart (U : SheafedSpace CommRingCat) : U ⟶ relativeCurve W pi varpi := by sorry

def relativeCurve_fundamental (q : ℚ) : periodAnnulus W pi varpi 1 q ⟶ relativeCurve W pi varpi := by sorry
-- The full presentation glues the radius-1 and radius-q boundaries.
theorem relativeCurve_qcqs : CompactSpace (relativeCurve W pi varpi) := by sorry
-- quotient_frobenius_orbit: actual orbit quotient, rather than an assumed equality.
example (Y : Type u) (r : Setoid Y) (x y : Y) (h : r.r x y) :
    Quotient.mk r x = Quotient.mk r y := by sorry
-- quotient_boundary
example (v : Valuation W ℝ≥0) (phi : W →+* W)
    (h : periodRadius W pi varpi v = 1)
    (hscale : periodRadius W pi varpi (v.comap phi) = 2 * periodRadius W pi varpi v) :
    periodRadius W pi varpi (v.comap phi) = 2 := by sorry
-- quotient_no_special
example (v : Valuation W ℝ≥0) (h : v pi = 0) : v (pi * varpi) = 0 := by sorry
-- Full functoriality is induced from marked-base maps, omitted here.
theorem relativeCurveFunctoriality (f : relativeCurve W pi varpi ⟶ relativeCurve W pi varpi) :
    𝟙 _ ≫ f = f ∧ f ≫ 𝟙 _ = f := by sorry
end GenericGeometry

section CartierEquations
variable (W B : Type u) [CommRing W] [CommRing B]
-- W is W_OE(R+), B is the marked O_E-untilt. The all-E perfectoid marking and
-- primitive-element interface are omitted, while the theta map is an actual hom.
theorem ramifiedPrimitiveUntiltEquation (theta : W →+* B) :
    Function.Surjective theta ∧ ∃ xi : W,
      RingHom.ker theta = Ideal.span {xi} ∧ ∀ a : W, xi * a = 0 → a = 0 := by sorry
-- Closed-image consequence of the source's lower bound. The norm is spectral on
-- the specified complete neighborhood and c=q^(-n)>0; the geometry is omitted.
theorem closedCartierDivisorNormEstimate (W : Type u) [NormedCommRing W] [CompleteSpace W]
    (xi : W) (c : ℝ) (hc : 0 < c) (hbound : ∀ a : W, c * ‖a‖ ≤ ‖xi * a‖) :
    Function.Injective (fun a : W => xi * a) ∧ IsClosed (Set.range (fun a : W => xi * a)) := by sorry
-- Ordinary line-bundle categories and their descent-data category are supplied
-- by the v-descent owner. This is equivalence of actual categories, not an almost
-- conclusion or a private placeholder for a v-stack property.
theorem ordinaryVDescentOfPeriodLineBundles {A B : Type u} [Category A] [Category B]
    (restriction : A ⥤ B) : CategoryTheory.Functor.IsEquivalence restriction := by sorry
end CartierEquations

section SymmetricDivisors
variable {C : Type u} [Category C] (J : GrothendieckTopology C)
variable (Leg : Sheaf J (Type v))
-- Leg is Spd OE, Spd E or the coefficient Frobenius quotient. The underlying
-- quotient sheaf, rather than an action stack, is constructed in the v-site.
def effectiveDivisors (J : GrothendieckTopology C) (Leg : Sheaf J (Type v)) (d : ℕ) : Sheaf J (Type v) := by sorry

def divDModuliVSheaf (J : GrothendieckTopology C) (Leg : Sheaf J (Type v)) (d : ℕ) : Sheaf J (Type v) := by sorry

def effectiveDivisors_zero : effectiveDivisors J Leg 0 ≅ Limits.terminal _ := by sorry
-- Ordered is the actual d-fold product sheaf, whose finite-limit interface is
-- imported; its identification with that product is omitted here.
def effectiveDivisors_orderedCover (d : ℕ) (Ordered : Sheaf J (Type v)) :
    Ordered ⟶ effectiveDivisors J Leg d := by sorry
-- The full statement also asserts Epi for this map; no replacement Prop field.
def effectiveDivisors_generic (IntegralLeg GenericLeg : Sheaf J (Type v)) (d : ℕ) :
    effectiveDivisors J GenericLeg d ⟶ effectiveDivisors J IntegralLeg d := by sorry
-- divisor_degree_zero: section-level symmetric orbit computation.
example (A : Type u) : Subsingleton (Sym A 0) := by sorry
-- divisor_double
example (A : Type u) (a : A) : (Sym.replicate 2 a).val = ({a,a} : Multiset A) := by sorry
/- CONTRACT divDModuliVSheaf:
RelativeFarguesFontaine:RF2:integral-divisors/div-d-moduli-v-sheaf
The sheaf carrier and elementary symmetric-orbit fragments above are retained. divisor_not_stack is omitted until the actual sheaf quotient and the action-stack comparison at a repeated leg are supplied. A fixed ordered pair under swap alone cannot distinguish those constructions.

Target: For d≥0 define the small v-sheaves Div^d_curlyY=(Spd O_E)^d/Σ_d, Div^d_Y=(Spd E)^d/Σ_d and Div^d_X=(Spd E/φ^Z)^d/Σ_d. Each quotient is the sheafification of orbit classes, not the quotient stack. Coincident legs have multiplicity and must not be deleted. At d=0 the sheaf is final and its divisor is empty.
Hypothesis: On Perf_(F_q); coefficient base and Frobenius action are fixed. Formation of Div_X requires the actual RF1 curve quotient, while the integral product definition only needs curly-Y.

API effectiveDivisors: The three symmetric v-sheaf quotients.
API effectiveDivisors_zero: Div^0 is the final sheaf and gives the empty divisor.
API effectiveDivisors_orderedCover: The ordered product→Div^d is an epimorphism of v-sheaves.
API effectiveDivisors_generic: The coefficient-open restriction gives Div^d_Y⊂Div^d_curlyY.
Test divisor_degree_zero (degenerate): Div^0(S) has one element.
Test divisor_double (computation): The ordered tuple (D,D) maps to the multiplicity-two divisor.
Test divisor_not_stack (non-example): A repeated tuple has a Σ_d stabilizer in the action stack, while Div^d is the sheaf of orbit classes.
These specifications are not native declarations or compiled examples.
-/
/- CONTRACT relativeDegreeCriterion:
RelativeFarguesFontaine:RF2:integral-divisors/relative-degree-criterion
Omitted pending the actual primitive-leg-to-Cartier construction and its geometric relative-degree criterion. The symmetric product of an arbitrary ideal-valued function need not be injective; the open early all-E inverse remains a packet gap.

Target: Div^d_curlyY(S), Div^d_Y(S) and Div^d_X(S) identify with relative effective closed Cartier divisors whose pullback to every geometric Spa(C,C^+) has total degree d, counting lengths and repeated points. In the integral case the characteristic-p point is included. For a pre-existing Cartier divisor, this criterion supplies local ordered presentations rather than assuming an ordering in the definition.
Hypothesis: The integral extension of the family factorisation theorem is a recorded proof gap; the generic symmetric-power theorem is Far Proposition 2.18 in the edition read. d=0 is the empty divisor.

These specifications are not native declarations or compiled examples.
-/
-- Bundle/thickening categories are supplied at every n>=1 by ordinary v-descent.
theorem vDescentOfBundlesOnTheDivisor {A B : Type u} [Category A] [Category B]
    (restriction : A ⥤ B) (n : ℕ) (hn : 0 < n) :
    CategoryTheory.Functor.IsEquivalence restriction := by sorry

def divisorAdd (d e : ℕ) :
    Limits.prod (effectiveDivisors J Leg d) (effectiveDivisors J Leg e) ⟶
      effectiveDivisors J Leg (d + e) := by sorry
-- The pointwise model uses the existing Sym concatenation; it is not a second
-- quotient definition. It provides the concrete section laws of divisorAdd.
theorem divisorAdd_assoc {A : Type u} (d e f : ℕ)
    (D : Sym A d) (E : Sym A e) (F : Sym A f) :
    HEq (Sym.append (Sym.append D E) F) (Sym.append D (Sym.append E F)) := by sorry

def additionAndDisjointDivisorLoci (d e : ℕ) :
    Limits.prod (effectiveDivisors J Leg d) (effectiveDivisors J Leg e) ⟶
      effectiveDivisors J Leg (d + e) := by sorry
-- addition_empty
example {A : Type u} (d : ℕ) (D : Sym A d) : HEq (Sym.append D Sym.nil) D := by sorry
-- addition_repeat
example {A : Type u} (a : A) : HEq (Sym.append (Sym.replicate 1 a) (Sym.replicate 1 a))
    (Sym.replicate 2 a) := by sorry
-- addition_no_crt_collision: a square-zero nonzero class prevents a field product.
example : ∃ x : ZMod 4, x ≠ 0 ∧ x ^ 2 = 0 := by sorry
end SymmetricDivisors

section DivisorCompletions
variable (A : Type u) [CommRing A]
-- Local affine forms of the ambient Cartier-ideal inverse limit.
def divisorCompletion (A : Type u) [CommRing A] (I : Ideal A) : Type u := by sorry
instance divisorCompletion_commRing (I : Ideal A) : CommRing (divisorCompletion A I) := by sorry
instance divisorCompletion_algebra (I : Ideal A) : Algebra A (divisorCompletion A I) := by sorry

def completedRingsBPlusAndB (A : Type u) [CommRing A] (I : Ideal A) : Type u := by sorry

def divisorCompletion_generator (xi : A) :
    divisorCompletion A (Ideal.span {xi}) ≃ₐ[A] AdicCompletion (Ideal.span {xi}) A := by sorry

def divisorPuncturedCompletion (A : Type u) [CommRing A] (xi : A) : Type u := by sorry
instance divisorPuncturedCompletion_commRing (xi : A) : CommRing (divisorPuncturedCompletion A xi) := by sorry

def divisorCompletion_changeGenerator (xi : A) (u : Aˣ) :
    divisorCompletion A (Ideal.span {↑u * xi}) ≃ₐ[A] divisorCompletion A (Ideal.span {xi}) := by sorry

def divisorCompletion_residue (I : Ideal A) : divisorCompletion A I →+* A ⧸ I := by sorry

-- Finite generation is essential; the Cartier ideal is locally principal.
theorem divisorCompletion_complete (I : Ideal A) (hI : I.FG) :
    IsAdicComplete (I.map (algebraMap A (divisorCompletion A I))) (divisorCompletion A I) := by sorry
-- completion_empty
example : Subsingleton (divisorCompletion A ⊤) := by sorry
-- completion_double
example (xi : A) : ∀ n : ℕ, (Ideal.span {xi}) ^ (2 * n) = (Ideal.span {xi ^ 2}) ^ n := by sorry
-- completion_special: integral pi-completion survives on the pi=0 divisor.
example (I : Ideal A) [IsAdicComplete I A] : Nonempty (divisorCompletion A I ≃ₐ[A] A) := by sorry
-- completion_unit_change
example (xi : A) (u : Aˣ) (n : ℕ) :
    (Ideal.span {↑u * xi}) ^ n = (Ideal.span {xi}) ^ n := by sorry

theorem productEquationAndAffineness (d : ℕ) (xi : Fin d → A)
    (hregular : ∀ i a, xi i * a = 0 → a = 0) :
    (∀ a, (∏ i, xi i) * a = 0 → a = 0) ∧
      Ideal.span {∏ i, xi i} = ∏ i, Ideal.span {xi i} := by sorry

theorem divisorAdd_ideal (xi eta : A) :
    Ideal.span {xi * eta} = Ideal.span {xi} * Ideal.span {eta} := by sorry

def divisorAdd_disjointCompletion (I K : Ideal A) (h : I + K = ⊤) :
    divisorCompletion A (I * K) ≃+* (divisorCompletion A I × divisorCompletion A K) := by sorry
-- Generic untilt restriction: the coefficient pi is a unit on the divisor.
def primitiveUntiltCorrespondence (B : Type u) [CommRing B]
    (theta : A →+* B) (pi : A) (hpi : IsUnit (theta pi))
    (hsurj : Function.Surjective theta) : (A ⧸ RingHom.ker theta) ≃+* B := by sorry
end DivisorCompletions

/- CONTRACT div1ModuliAndProperness:
RelativeFarguesFontaine:RF2:untilts/div1-moduli-and-properness
Omitted pending the actual coefficient Frobenius action, v-sheaf orbit quotient and base-change functor on the marked sites. Neither Sym(A,1) nor an isomorphism between arbitrary sheaf parameters tests this Div1 formula.

Target: The degree-one Cartier-divisor moduli on Perf_(F_q) is Div^1=Spd E/φ^Z, canonically the d=1 curve-leg quotient. Its points locally on the analytic base come from an E-untilt. After base change to Perf_k, k an algebraic closure of F_q with fixed coefficient embedding, it is Spd Ĕ/φ^Z, where Ĕ=W_OE(k)[1/π]. The two coefficient bases must not be identified before this base change. This node constructs the moduli only; its properness, spatial representability and cohomological smoothness have the accepted VB3:general-BC owner.
Hypothesis: Sheaf quotient, not the diamond of one fixed curve. The legacy node id is preserved while the late property payload is forwarded.

API degreeOneDivisors: Div^1 on Perf_(F_q) with its curve-divisor comparison.
API degreeOneDivisors_localUntilts: Degree-one divisors come from untilts locally on the analytic base.
API degreeOneDivisors_baseChange: On Perf_k, Div^1≃Spd Ĕ/φ^Z.
Test divone_fq_base (compatibility): Over Perf_(F_q) the coefficient object is Spd E.
Test divone_algebraic_closure (computation): After Perf_k base change it is Spd Ĕ/φ^Z.
Test divone_not_fixed_curve (non-example): Div^1 is a moduli v-sheaf over the coefficient base, not X_C^diamond for a fixed C.
These specifications are not native declarations or compiled examples.
-/
section DeRham
variable (A B : Type u) [CommRing A] [CommRing B] (I : Ideal A)
-- The actual input A=W(Aflat+)[1/p], J=ker theta and the checked PreTilt
-- identification must precede the absolute Mathlib comparison. The geometric
-- perfectoid and marking conditions are omitted; the completion is explicit.
def pTypicalAffinoidCompletionComparison : divisorCompletion A I ≃+* AdicCompletion I A := by sorry
-- E is the selected coefficient action on this same untilt; no tensor over E
-- before selecting a factor. Formally-etale uniqueness supplies compatibility.
def coefficientFieldDeRhamComparison (K : Ideal B) :
    divisorCompletion A I ≃+* divisorCompletion B K := by sorry

def BdRCompletionAndFiltration : divisorCompletion A I ≃+* AdicCompletion I A := by sorry
-- Quotient and associated-graded fragment. The full theorem uses tensor powers
-- of I/I^2 and fractional-ideal powers on the punctured completion.
def cartierFiltrationAndBreuilKisinLines (xi : A)
    (hxi : ∀ a : A, xi * a = 0 → a = 0) (n : ℕ) :
    (↥((Ideal.span {xi}) ^ n) ⧸ Submodule.comap
      (((Ideal.span {xi}) ^ n : Ideal A) : Submodule A A).subtype
      ((Ideal.span {xi}) ^ (n+1) : Ideal A)) ≃ₗ[A] A ⧸ Ideal.span {xi} := by sorry
-- The left side is the module quotient of the nth power by the next power;
-- it is not a ring quotient of the nonunital ideal.
-- Algebraic fragment: a regular principal Cartier ideal with field residue.
-- The geometric residue-field identification is a separate source hypothesis.
theorem geometricDivisorCompleteDvr (xi : A)
    (hxi : ∀ a : A, xi * a = 0 → a = 0) [Field (A ⧸ Ideal.span {xi})] :
    ∃ h : IsDomain (divisorCompletion A (Ideal.span {xi})),
      @IsDiscreteValuationRing (divisorCompletion A (Ideal.span {xi})) _ h := by sorry
-- Ring maps on quotient systems induce maps on inverse-limit completion.
def divisorCompletionBaseChange (f : A →+* B) (K : Ideal B) (h : I ≤ K.comap f) :
    divisorCompletion A I →+* divisorCompletion B K := by sorry
end DeRham

/-! Rank-one descent. A is O(Y_S), piUnit is pi after inversion and phi is
coefficient q-Frobenius. The analytic descent interface is omitted; the displayed
operator and eigenspaces are concrete algebraic forms with the source's sign. -/
section Twists
variable (A : Type u) [CommRing A] (piUnit : Aˣ) (phi : A ≃+* A)
def curveTwist (A : Type u) [CommRing A] (piUnit : Aˣ) (phi : A ≃+* A) (n : ℤ) : A →+ A := by sorry

def isocrystalLineBundlesAndSign (A : Type u) [CommRing A] (piUnit : Aˣ) (phi : A ≃+* A) (n : ℤ) : A →+ A := by sorry

def curveTwist_tensor (m n : ℤ) : (A ⊗[A] A) ≃ₗ[A] A := by sorry

def curveTwist_dual (n : ℤ) : Module.Dual A A ≃ₗ[A] A := by sorry

def curveTwist_sections (n : ℤ) :
    {x : A // curveTwist A piUnit phi n x = x} ≃
      {x : A // phi x = (↑(piUnit ^ n) : A) * x} := by sorry

theorem curveTwist_transition (n k l : ℤ) :
    piUnit ^ (-n * (k + l)) = piUnit ^ (-n * k) * piUnit ^ (-n * l) := by sorry
-- twist_zero
example (x : A) : curveTwist A piUnit phi 0 x = phi x := by sorry
-- twist_one_sign
example (x : A) : curveTwist A piUnit phi 1 x = (↑(piUnit⁻¹) : A) * phi x ∧
    (curveTwist A piUnit phi 1 x = x ↔ phi x = (↑piUnit : A) * x) := by sorry
-- twist_negative_sign
example (x : A) : curveTwist A piUnit phi (-1) x = (↑piUnit : A) * phi x := by sorry
-- twist_inverse
example (n : ℤ) : piUnit ^ n * piUnit ^ (-n) = 1 := by sorry
/- CONTRACT lubinTateDivisorSection:
RelativeFarguesFontaine:RF3/lubin-tate-divisor-section
Omitted pending construction of the convergent LT section from its actual logarithm/tower and Cech input. The eigenvalue belongs to that section, not to every function in the ambient ring.

Target: Let E_LT∞ be the completion of the Lubin–Tate torsion tower, and S^sharp an untilt over it. A compatible nonzero torsion parameter X̃ gives a convergent period function f=Σ_(i∈Z)π^i[X̃^(q^(−i))] satisfying φ(f)=πf. Its zero on X_S is exactly the untilt divisor, with multiplicity one. Hence 0→O_X→O_X(1)→O_(S^sharp)→0, with the last map interpreted through the chosen divisor trivialization. Tensoring gives the corresponding consecutive-twist exact sequences.
Hypothesis: The chosen LT tower is distinct from E_root∞. The all-E functional construction uses the LT logarithm; its mixed-characteristic period comparison has the precise SW13 input recorded as a gap.

These specifications are not native declarations or compiled examples.
-/
-- P is the direct sum of the concrete nonnegative eigenspaces above.
def curveSectionAlgebra (A : Type u) [CommRing A] (piUnit : Aˣ) (phi : A ≃+* A) : Type u := by sorry
instance curveSectionAlgebra_commRing : CommRing (curveSectionAlgebra A piUnit phi) := by sorry

def curveSectionGrading (A : Type u) [CommRing A] (piUnit : Aˣ) (phi : A ≃+* A) : ℕ → AddSubgroup (curveSectionAlgebra A piUnit phi) := by sorry
instance curveSectionGrading_gradedRing : GradedRing (curveSectionGrading A piUnit phi) := by sorry

theorem curveSectionAlgebra_mul (m n : ℕ) (x y : A)
    (hx : phi x = (↑(piUnit ^ (m : ℤ)) : A) * x)
    (hy : phi y = (↑(piUnit ^ (n : ℤ)) : A) * y) :
    phi (x * y) = (↑(piUnit ^ ((m + n : ℕ) : ℤ)) : A) * (x * y) := by sorry

def curveProj (A : Type u) [CommRing A] (piUnit : Aˣ) (phi : A ≃+* A) : Scheme := by sorry

def gradedAlgebraAndAlgebraicCurveMap (A : Type u) [CommRing A] (piUnit : Aˣ) (phi : A ≃+* A) : Scheme := by sorry
-- Comparison with the existing Proj construction, never a new Proj definition.
def curveProj_existing : curveProj A piUnit phi ≅
    AlgebraicGeometry.Proj (curveSectionGrading A piUnit phi) := by sorry
-- The algebraic standard-open theorem is already Mathlib projIsoSpec.
-- Analytic chart functions receive a ring map from this ring, supplied below.
def curveProj_chart (g : curveSectionAlgebra A piUnit phi)
    (n : ℕ) (hn : 0 < n) (hg : g ∈ curveSectionGrading A piUnit phi n) :
    ((AlgebraicGeometry.Proj.toLocallyRingedSpace (curveSectionGrading A piUnit phi)).restrict
      (Opens.isOpenEmbedding (ProjectiveSpectrum.basicOpen (curveSectionGrading A piUnit phi) g))) ≅
    Spec.locallyRingedSpaceObj
      (CommRingCat.of (HomogeneousLocalization.Away (curveSectionGrading A piUnit phi) g)) := by sorry
-- graded_zero_degree
example (x : A) : phi x = (↑(piUnit ^ (0 : ℤ)) : A) * x ↔ phi x = x := by sorry
-- graded_product
example (x y : A) (hx : phi x = (↑piUnit : A) * x) (hy : phi y = (↑piUnit : A) * y) :
    phi (x * y) = (↑(piUnit ^ 2) : A) * (x * y) := by sorry
-- proj_not_degree_one_cover: a degree-one-zero grading gives only the empty
-- degree-one open. Positive-degree charts are still permitted by existing Proj.
example (P : Type u) [CommRing P] (G : ℕ → AddSubgroup P)
    (h : G 1 = ⊥) (g : P) (hg : g ∈ G 1) : g = 0 := by sorry
-- The map is defined only over the section-covered open U, not all X_S.
def sectionCoveredProjChartMap (g : curveSectionAlgebra A piUnit phi)
    (B : Type u) [CommRing B] :
    HomogeneousLocalization.Away (curveSectionGrading A piUnit phi) g →+* B := by sorry
end Twists

/-! P-typical relative period rings. The perfect uniform Banach pair and endpoint
completion topologies are imported geometric conditions, omitted here. The
multiplicative seminorm, actual Witt ring and concrete restriction maps remain.
The all-E version also requires the recorded norm-extension interface. -/
/- CONTRACT wittSeminormLambdaMu:
RelativeFarguesFontaine:RF0:annuli/witt-seminorm-lambda-mu
Omitted pending the perfect characteristic-p Banach coefficient datum and its bounded spectra with the actual pointwise topologies. The lambda-mu comparison and continuity are not assertions about every seminorm and every topology.

Target: For a perfect F_p-algebra with a power-multiplicative seminorm α bounded by the trivial norm, define λ(α)(Σp^i[x_i])=max_i p^(−i)α(x_i), and μ(β)(x)=β([x]). They preserve multiplicative seminorms. The maps on their Berkovich spectra are continuous, μλ=id and λμ≥id. The same formulas extend to the relative integral and interval rings with the domination conditions of KL5.1.2.
Hypothesis: The initial ring need not be a field or Banach. The later analytic relative version uses a perfect uniform Banach pair over an analytic field and 0<s≤r.

API wittLambda: Extends a bounded multiplicative seminorm by the coefficient maximum.
API wittMu: Restricts a seminorm along the multiplicative Teichmuller section.
API wittMu_lambda: μ(λ(α))=α.
API wittLambda_mu: λ(μ(β))≥β.
API wittLambda_continuous: The spectrum map is continuous.
Test lambda_teich (computation): λ(α)([x])=α(x).
Test lambda_p (computation): λ(α)(p)=p^−1 for a nonzero seminorm.
Test lambda_mu_not_identity (non-example): For a primitive quotient seminorm killing p−[ϖ], λμ need not kill that element.
These specifications are not native declarations or compiled examples.
-/
section RobbaRings
variable (R : Type u) [CommRing R] (p : ℕ) [Fact p.Prime]
variable (alpha : MulRingSeminorm R)
def relativeRobbaIntegral (R : Type u) [CommRing R] (p : ℕ) [Fact p.Prime] (alpha : MulRingSeminorm R) (r : ℝ) : Subring (WittVector p R) := by sorry

def relativeRobbaInterval (R : Type u) [CommRing R] (p : ℕ) [Fact p.Prime] (alpha : MulRingSeminorm R) (s r : ℝ) : Type u := by sorry
instance relativeRobbaInterval_commRing (s r : ℝ) : CommRing (relativeRobbaInterval R p alpha s r) := by sorry

def relativeRobbaPlus (R : Type u) [CommRing R] (p : ℕ) [Fact p.Prime] (alpha : MulRingSeminorm R) : Type u := by sorry
instance relativeRobbaPlus_commRing : CommRing (relativeRobbaPlus R p alpha) := by sorry

def relativeExtendedRobbaRings (R : Type u) [CommRing R] (p : ℕ) [Fact p.Prime] (alpha : MulRingSeminorm R) (s r : ℝ) : Type u := by sorry

def relativeRobba_restrict (s r s' r' : ℝ)
    (h : s ≤ s' ∧ s' ≤ r' ∧ r' ≤ r) :
    relativeRobbaInterval R p alpha s r →+* relativeRobbaInterval R p alpha s' r' := by sorry

def relativeRobba_frobenius (s r : ℝ) :
    relativeRobbaInterval R p alpha s r →+* relativeRobbaInterval R p alpha (s / p) (r / p) := by sorry
-- robba_teich
example (r : ℝ) (hr : 0 < r) (x : R) :
    WittVector.teichmuller p x ∈ relativeRobbaIntegral R p alpha r := by sorry
/- CONTRACT relativeExtendedRobbaRings:
RelativeFarguesFontaine:RF0:annuli/relative-extended-robba-rings
The basic ring/restriction carriers and Teichmuller-membership fragment are above. The singleton-interval and plus/infinity tests are omitted until the actual completions and competing growth-ring membership maps are typed; max(a,a)=a and a repeated norm inequality do not test them.

Target: For a perfect uniform Banach pair (R,R^+) over an analytic field of characteristic p with spectral norm α, define Ẽ^int=W(R), Ẽ=Ẽ^int[1/p], R̃^(int,r)={Σ_(i≥0)p^i[x_i]:p^(−i)α(x_i)^r→0}, R̃^(bd,r)=R̃^(int,r)[1/p], R̃^r its Frechet completion for λ(α^s), 0<s≤r, and R̃^[s,r] its Banach completion for max(λ(α^s),λ(α^r)). Dropping r takes the union over r>0. Define each plus-input variant by R^+ instead of R. Its integral/bounded variants are W(R^+) and W(R^+)[1/p]; R̃^+ is the completion for all s>0, whereas R̃^∞=∩_rR̃^r is a different ring. Record p-adic, weak, Banach, Frechet and inductive limit topologies separately.
Hypothesis: KL Hypothesis 5.0.1. These are extended relative rings. The paper does not construct the arithmetic relative Robba rings. For all E replace p by π and p-Frobenius by q-Frobenius and prove the stated extension.

API relativeRobbaIntegral: The coefficient-growth subring at r>0.
API relativeRobbaInterval: The complete interval ring at 0<s≤r.
API relativeRobbaPlus: The all-positive-radii completion of W(R^+)[1/p].
API relativeRobba_restrict: Continuous interval restrictions for interval inclusion.
API relativeRobba_frobenius: φ transports [s,r] to [s/q,r/q], with λ_t(φx)=λ_(qt)(x).
Test robba_teich (computation): Every [x] belongs to every integral growth ring.
Test robba_singleton_interval (degenerate): At s=r the interval completion uses a single endpoint norm.
Test robba_plus_infinity (non-example): A Teichmuller element [x] with α(x)>1 belongs to R̃^∞ and fails the R̃^+ growth criterion when R^+=R°; equality of these two rings is false.
These specifications are not native declarations or compiled examples.
-/
-- Convexity of log norms and the unit criterion, with the specified growth rings.
-- Rint and Rbd here are the concrete integral and bounded unions, not new types.
theorem robbaGrowthUnitsAndInvariants (Rbd Robba : Type u) [CommRing Rbd] [CommRing Robba]
    (inclusion : Rbd →+* Robba) (x : Robba) (hx : IsUnit x) :
    ∃ y : Rbd, IsUnit y ∧ inclusion y = x := by sorry
-- The maps are the specified restrictions to a common interval. Norm bounds and
-- extension to every larger outer radius are recorded in the document.
theorem robbaControlledSplittings (s r : ℝ) (hs : 0 < s) (hsr : s ≤ r) (n : ℤ)
    (piUnit : (relativeRobbaInterval R p alpha s r)ˣ)
    (integralMap : relativeRobbaIntegral R p alpha r →+* relativeRobbaInterval R p alpha s r)
    (lambda : ℝ → relativeRobbaInterval R p alpha s r → ℝ)
    (x : relativeRobbaInterval R p alpha s r) :
    ∃ y : relativeRobbaIntegral R p alpha r, ∃ z : relativeRobbaInterval R p alpha s r,
      x = (↑(piUnit ^ n) : relativeRobbaInterval R p alpha s r) * integralMap y + z ∧
      ∀ t : ℝ, r ≤ t → lambda t z ≤
        (p : ℝ) ^ ((1 - (n : ℝ)) * (1 - t / r)) * (lambda r x) ^ (t / r) := by sorry
-- Overlap/window compatibility and its Banach extension hypotheses are omitted;
-- the eigenspaces and restriction are actual functions, not goal assumptions.
def positiveFrobeniusEigenvectorRestriction (A B : Type u) [CommRing A] [CommRing B]
    (phiA : A →+* A) (phiB : B →+* B) (piA : A) (piB : B) (n : ℕ) :
    {x : A // phiA x = piA ^ n * x} ≃ {x : B // phiB x = piB ^ n * x} := by sorry
end RobbaRings

/-! The rational-basis presheaves have twelve variants. The site and geometric
coefficient data are supplied, not encoded by private Prop fields. -/
section PeriodPresheaves
/- CONTRACT relativePeriodPresheaves:
RelativeFarguesFontaine:RF0:annuli/relative-period-presheaves
Omitted pending the perfect Banach coefficient pair, radius data and the actual rational-basis evaluations of each of the twelve variants. TopCat and an index alone do not determine the period presheaf.

Target: On Spa(R,R^+) define the period presheaf for each of the twelve variants Ẽ^int,Ẽ,R̃^(int,r),R̃^(int,+),R̃^int,R̃^(bd,r),R̃^(bd,+),R̃^bd,R̃^[s,r],R̃^r,R̃^+,R̃ by the inverse limit of its values on rational affinoids contained in an open U. Restrictions and base maps are induced by the coefficient maps and completions. The plus-input and positive-radii-completion variants keep their distinct topologies.
Hypothesis: Perfect uniform Banach base as in KL5.0.1; bounds and radii must be adjusted for a bounded coefficient map before taking the union.

API relativePeriodPresheaf: The twelve rational-basis presheaves and their limits on opens.
API relativePeriodPresheaf_restrict: Compatible restriction maps for open inclusion.
API relativePeriodPresheaf_affinoid: Its rational-affinoid value agrees with the relevant period ring after the sheaf theorem.
API relativePeriodPresheaf_phi: Frobenius acts with the indicated radius transport.
Test period_empty (degenerate): The value on the empty open is the terminal zero ring.
Test period_restriction_chain (compatibility): Restriction through two rational subopens equals their composite.
Test period_plus_distinction (non-example): The presheaves R̃^+ and R̃ need not agree on an affinoid with a coefficient of norm greater than one.
These specifications are not native declarations or compiled examples.
-/
/- CONTRACT relativePeriodSheafAndAcyclicity:
RelativeFarguesFontaine:RF0:annuli/relative-period-sheaf-and-acyclicity
The sheaf/acyclicity statement uses the preceding coefficient/radius-dependent presheaves. Omit its native form until those are typed; an arbitrary presheaf cannot replace them.

Target: Every period presheaf of KL5.3.1 is a sheaf. Rational Tate acyclicity is asserted for Ẽ^int,Ẽ,R̃^(int,r),R̃^int,R̃^(bd,r),R̃^bd,R̃^[s,r],R̃^r,R̃, exactly the nine variants of Theorem5.3.3. The Kiehl property is proved for Ẽ^int and R̃^(int,r), and separately for R̃^[s,r]; it is not automatically asserted for all twelve variants.
Hypothesis: Use continuous strict rational covering sequences and the norm assigned to each variant. The plus variants are sheaves without the extra acyclicity claim in this theorem.

These specifications are not native declarations or compiled examples.
-/
-- Stable uniformity/perfectoidness are omitted because their supplier interfaces
-- are missing. The consequence here is the actual ringed-space sheaf structure.
def intervalRingsRelativelyPerfectoid (s r : ℝ) : SheafedSpace CommRingCat := by sorry
end PeriodPresheaves

section AnnularSpectra
variable (R B : Type u) [CommRing R] [CommRing B]
-- B is the interval ring, B+ the completed endpoint-bounded plus ring.
def relativeAnnulusPair : Subring B := by sorry

def intervalAdicPairAndBaseProjection : Subring B := by sorry

def relativeAnnulus_exponent (beta : MulRingSeminorm B) : ℝ := by sorry
-- These are the actual adic spectra of the specified pairs, expressed as TopCat
-- objects because the general adic-space morphism interface is absent.
def relativeAnnulus_toBase (Ann Base : TopCat) : Ann ⟶ Base := by sorry
-- Bounded Teichmuller values define the base valuation ring. The valuation proof
-- uses the source exponent and its complete residue field, omitted here.
def relativeAnnulus_baseValuation (teich : R →* B) (beta : MulRingSeminorm B) : Set R := by sorry
-- annulus_projection_teich
example (teich : R →* B) (beta : MulRingSeminorm B) (x : R) :
    x ∈ relativeAnnulus_baseValuation R B teich beta ↔ beta (teich x) ≤ 1 := by sorry
-- annulus_endpoint
example (s r : ℝ) (h : s ≤ r) : s ∈ Set.Icc s r ∧ r ∈ Set.Icc s r := by sorry
-- annulus_no_additive_teich
example : WittVector.teichmuller 2 (R := ZMod 2) 1 + WittVector.teichmuller 2 (R := ZMod 2) 1 ≠
    WittVector.teichmuller 2 (R := ZMod 2) (1 + 1) := by sorry
-- The rational localization interfaces are omitted; pullback of the actual
-- topological open is the carrier of the rational base-change annulus.
theorem annularRationalBaseChange (Ann Base : TopCat) (proj : Ann ⟶ Base)
    (U : Set Base) (hU : IsOpen U) : IsOpen (proj ⁻¹' U) := by sorry

/- CONTRACT berkovichPeriodDeformation:
RelativeFarguesFontaine:RF0:annuli/berkovich-period-deformation
Omitted pending the bounded spectra, actual lambda/mu maps and their continuous deformation. Its endpoint/fixed-point/mu tests cannot quantify independent arbitrary maps. The disconnected-base test must involve this same deformation.

Target: On M(R̃^(int,r)) the stable-presentation construction defines H(β,u), u∈[0,1], with H(β,0)=β, H(β,1)=λμ(β), μH(β,u)=μ(β), and H(H(β,u),v)=H(β,max(u,v)). It is continuous. On T_R=⋃_(0<s<r)M(R̃^[s,r]) it gives a strong deformation retract to M(R)×(0,∞). The properly discontinuous φ^d action scales the exponent by q=p^d, has compact Hausdorff quotient X_R, and descends the retraction to M(R)×(R_>0/q^Z)≃M(R)×S^1.
Hypothesis: These are Berkovich spaces and their maximal Hausdorff quotient. Neither the deformation nor the circle description asserts an adic ringed-space product.

API periodHomotopy: The jointly continuous H on integral period seminorms.
API periodHomotopy_zero: H(β,0)=β.
API periodHomotopy_one: H(β,1)=λμ(β).
API periodHomotopy_max: H(H(β,u),v)=H(β,max(u,v)).
API periodBerkovichQuotient: The compact quotient and its circle-valued exponent.
Test homotopy_fixed (compatibility): H(λ(α),u)=λ(α) for all u.
Test homotopy_mu (computation): μ remains constant along each homotopy path.
Test circle_disconnected_base (non-example): For a disconnected R, X_R retains the corresponding components; it is not a single circle.
These specifications are not native declarations or compiled examples.
-/
-- Bounded maps between the specified Banach period rings lift spectral surjectivity.
theorem periodSpectrumSurjectivity (f : R →+* B)
    (periodMap : MulRingSeminorm B → MulRingSeminorm R) : Function.Surjective periodMap := by sorry
-- FE categories and the specified reduction/lift functors use the owner interface.
-- At a fixed radius the first category is phi^(-1)-equivariant, not plain FE.
theorem periodRingsFiniteEtaleCompatibility {A C : Type u} [Category A] [Category C]
    (reduction : A ⥤ C) : reduction.IsEquivalence := by sorry
end AnnularSpectra

section GlobalPeriods
variable (S : TopCat)
/- CONTRACT globalPeriodSheavesAndEtaleFunctoriality:
RelativeFarguesFontaine:RF1/global-period-sheaves-and-etale-functoriality
The curve-map/topos carrier fragments below are retained. The global period presheaves and affinoid comparison are omitted with their coefficient/radius-dependent rational-basis input. curve_split_etale must test the actual relative-curve finite-etale functor on a split cover, rather than an unrelated equivalence of underlying sets.

Target: Glue the twelve rational period sheaves over any perfect adic base; their etale sheafifications have the same values on perfect uniform affinoids. The relative-curve functor carries etale, finite etale and faithfully finite etale base morphisms to morphisms with the same property. The projection of underlying topological spaces upgrades to a morphism of etale topoi. This does not supply a structural adic map X_S→S.
Hypothesis: Use the etale comparison for the exact affinoid class; a general nonuniform affinoid is not covered.

API globalRelativePeriodSheaf: The glued period sheaves on a perfect adic base.
API globalRelativePeriodSheaf_affinoid: Affinoid values equal the specified relative period rings.
API relativeCurve_etale: Etale base maps induce etale curve maps.
API relativeCurve_finiteEtale: Finite etale and faithfully finite etale base maps retain those properties.
API relativeCurve_etaleTopos: The underlying projection induces a morphism of etale topoi.
Test global_period_affinoid (compatibility): Restriction to an affinoid recovers the rational period sheaf.
Test curve_split_etale (computation): A disjoint union of two copies of S gives two copies of X_S.
Test curve_etale_not_structural (non-example): The topos projection and continuous projection do not imply an adic structural ring map.
These specifications are not native declarations or compiled examples.
-/
-- Curve maps from etale base maps, with their geometric hypotheses omitted.
def relativeCurve_etale (X Y : SheafedSpace CommRingCat) : X ⟶ Y := by sorry
-- Curve maps from finite-etale base maps, with their geometric hypotheses omitted.
def relativeCurve_finiteEtale (X Y : SheafedSpace CommRingCat) : X ⟶ Y := by sorry
-- Topos inverse image acts on sheaves, preserving finite limits; the site morphism
-- supplied by D0/R3 is omitted. This is an actual functor of sheaf categories.
def relativeCurve_etaleTopos {C D : Type u} [Category C] [Category D]
    (J : GrothendieckTopology C) (K : GrothendieckTopology D) :
    Sheaf J (Type v) ⥤ Sheaf K (Type v) := by sorry
-- The global affine and split-curve tests are specified in the preceding contract.
-- curve_etale_not_structural: a topos functor is its own category datum; no ring
-- homomorphism from the characteristic-p base into a characteristic-zero curve.
example : ¬Nonempty (ZMod 2 →+* ℚ) := by sorry
-- LT tower and its marked tilt are geometric hypotheses omitted from this formula.
def lubinTateDiamondPresentation {C : Type u} [Category C]
    (J : GrothendieckTopology C) (Y SpdF SpdE : Sheaf J (Type v)) :
    Y ≅ Limits.prod SpdF SpdE := by sorry
/- CONTRACT steinExhaustionAndHigherAcyclicity:
RelativeFarguesFontaine:RF0:annuli/stein-exhaustion-and-higher-acyclicity
Omitted pending the actual complete Banach inverse system, compatible limit projections/comparison and higher-cohomology interface. Returning an arbitrary Type is not a statement of Stein comparison or acyclicity.

Target: For affinoid perfectoid S, the generic Y_S admits a countable increasing exhaustion by compact rational annuli. Each annulus is sheafy and O-acyclic. Restriction maps on analytic functions have dense image, and the controlled annular approximations imply lim^1=0 for the countable inverse system. Hence H^i(Y_S,O)=0 for i>0 and O(Y_S) is its Frechet inverse limit. For general S this is applied on affinoid base charts, rather than asserting global acyclicity over a nonaffinoid base.
Hypothesis: Affinoid base and a countable cofinal annular exhaustion. The topological inverse-limit argument uses dense restrictions and complete Banach spaces, not algebraic Mittag–Leffler surjectivity.

These specifications are not native declarations or compiled examples.
-/
-- The two-chart Cech sequence uses a difference map and the pi-adic left ring.
-- Actual chart identifications and Frobenius norm estimates are omitted.
theorem crystallineBoundaryAndCechSectionInput (A B C D : Type u)
    [CommRing A] [CommRing B] [CommRing C] [CommRing D]
    (f : A →+* B) (g : A →+* C) (rB : B →+* D) (rC : C →+* D) :
    Function.Injective (fun a => (f a, g a)) ∧
    Set.range (fun a => (f a, g a)) = {bc | rB bc.1 - rC bc.2 = 0} ∧
    Function.Surjective (fun bc : B × C => rB bc.1 - rC bc.2) := by sorry
-- Imported absolute interval ring, plus ring and all-E comparison inputs.
def annularCoefficientChoiceAndAnchorComparisons (A B : Type u)
    [CommRing A] [CommRing B] : A ≃+* B := by sorry
/- CONTRACT localGenerationOnPeriodAnnuli:
RelativeFarguesFontaine:RF0:annuli/local-generation-on-period-annuli
Omitted pending the actual finite-projective interval module, its residue fibre and rational-neighborhood tensor base change. An arbitrary independent Z-linear map to an unrelated module does not preserve the residue generation conclusion.

Target: Let M be finite projective over R̃^[s,r],0<s≤r. If elements e_1,…,e_n generate its base change to R̃_(H(β))^[s,r] for β∈M(R), then they generate M after a rational localization of the base (R,R^+) encircling β. This is a local neighborhood conclusion and does not assert that M is free or that the same generators work over the whole base.
Hypothesis: Finite projective interval module, a finite proposed generating set and generation over the completed coefficient residue field.

These specifications are not native declarations or compiled examples.
-/
end GlobalPeriods

end TauCeti.RelativeFF

end RF0_RF3

section RF4

open TensorProduct

universe u

namespace TauCeti

/-! ## RF4:vector-bundles — algebra of exact squares (Kedlaya–Liu 1.3.7–1.3.10) -/

section ExactSquare

variable (R R₁ R₂ R₁₂ : Type u) [CommRing R] [CommRing R₁] [CommRing R₂] [CommRing R₁₂]
  [Algebra R R₁] [Algebra R R₂] [Algebra R R₁₂] [Algebra R₁ R₁₂] [Algebra R₂ R₁₂]
  [IsScalarTower R R₁ R₁₂] [IsScalarTower R R₂ R₁₂]

/-- **Exact square** (Kedlaya–Liu, Definition 1.3.7): a commuting square `R → R₁, R₂ → R₁₂`
with `0 → R → R₁ ⊕ R₂ → R₁₂ → 0` exact, the last arrow being the difference. No topology. -/
structure ExactSquare : Prop where
  /-- `R → R₁ × R₂` is injective. -/
  injective : Function.Injective fun r : R => (algebraMap R R₁ r, algebraMap R R₂ r)
  /-- `ExactSquare.exact`: a pair with equal images in `R₁₂` comes from `R`. -/
  exact : ∀ (a : R₁) (b : R₂), algebraMap R₁ R₁₂ a = algebraMap R₂ R₁₂ b →
    ∃ r : R, algebraMap R R₁ r = a ∧ algebraMap R R₂ r = b
  /-- The difference map `R₁ × R₂ → R₁₂` is surjective. -/
  surjective : ∀ z : R₁₂, ∃ (a : R₁) (b : R₂), algebraMap R₁ R₁₂ a - algebraMap R₂ R₁₂ b = z

variable (M₁ M₂ M₁₂ : Type u) [AddCommGroup M₁] [Module R₁ M₁] [AddCommGroup M₂] [Module R₂ M₂]
  [AddCommGroup M₁₂] [Module R₁₂ M₁₂]

/-- **Glueing datum** over the square (Kedlaya–Liu, Definition 1.3.7): modules `M₁, M₂, M₁₂`
over `R₁, R₂, R₁₂` with identifications `ψ₁, ψ₂` over `R₁₂`. -/
structure GlueingDatum where
  /-- `ψ₁ : M₁ ⊗_{R₁} R₁₂ ≅ M₁₂`. -/
  ψ₁ : R₁₂ ⊗[R₁] M₁ ≃ₗ[R₁₂] M₁₂
  /-- `ψ₂ : M₂ ⊗_{R₂} R₁₂ ≅ M₁₂`. -/
  ψ₂ : R₁₂ ⊗[R₂] M₂ ≃ₗ[R₁₂] M₁₂

namespace GlueingDatum

variable {R₁ R₂ R₁₂ M₁ M₂ M₁₂}

variable {R} [Module R M₁] [Module R M₂]
  [IsScalarTower R R₁ M₁] [IsScalarTower R R₂ M₂]

/-- The module of sections, with restriction of scalars from the two pieces. -/
def sections (D : GlueingDatum R₁ R₂ R₁₂ M₁ M₂ M₁₂) : Submodule R (M₁ × M₂) where
  carrier := {x | D.ψ₁ (1 ⊗ₜ x.1) = D.ψ₂ (1 ⊗ₜ x.2)}
  add_mem' := by
    intro a b ha hb
    simp only [Set.mem_ofPred_eq, Prod.fst_add, Prod.snd_add, TensorProduct.tmul_add, map_add] at *
    rw [ha, hb]
  zero_mem' := by simp
  smul_mem' := by sorry

/-- The two canonical base-change comparison maps. On pure tensors they send
`r ⊗ (m₁,m₂)` to `r • mᵢ`; these are not the additive inclusion of sections into the product. -/
noncomputable def sectionsCompare (D : GlueingDatum R₁ R₂ R₁₂ M₁ M₂ M₁₂) :
    (R₁ ⊗[R] (D.sections (R := R)) →ₗ[R₁] M₁) ×
      (R₂ ⊗[R] (D.sections (R := R)) →ₗ[R₂] M₂) := by
  sorry

/-- Pure tensor computation fixes the canonical comparisons. -/
theorem sectionsCompare_tmul (D : GlueingDatum R₁ R₂ R₁₂ M₁ M₂ M₁₂)
    (x : D.sections (R := R)) (r₁ : R₁) (r₂ : R₂) :
    (D.sectionsCompare (R := R)).1 (r₁ ⊗ₜ[R] x) = r₁ • x.val.1 ∧
      (D.sectionsCompare (R := R)).2 (r₂ ⊗ₜ[R] x) = r₂ • x.val.2 := by
  sorry

end GlueingDatum

variable {R R₁ R₂ R₁₂}

/-- `GlueingDatum.can`: the glueing datum `Can(N) = (N ⊗ R₁, N ⊗ R₂, N ⊗ R₁₂, can, can)` of an
`R`-module `N`. -/
noncomputable def GlueingDatum.can (N : Type u) [AddCommGroup N] [Module R N] :
    GlueingDatum R₁ R₂ R₁₂ (R₁ ⊗[R] N) (R₂ ⊗[R] N) (R₁₂ ⊗[R] N) where
  ψ₁ := TensorProduct.AlgebraTensorModule.cancelBaseChange R R₁ R₁₂ R₁₂ N
  ψ₂ := TensorProduct.AlgebraTensorModule.cancelBaseChange R R₂ R₁₂ R₁₂ N

/-- The unit `N → sections(Can N)`, `n ↦ (1 ⊗ n, 1 ⊗ n)`. -/
noncomputable def GlueingDatum.canUnit (N : Type u) [AddCommGroup N] [Module R N] :
    N →ₗ[R] (GlueingDatum.can (R := R) (R₁ := R₁) (R₂ := R₂) (R₁₂ := R₁₂) N).sections (R := R) where
  toFun n := ⟨((1 : R₁) ⊗ₜ n, (1 : R₂) ⊗ₜ n), by sorry⟩
  map_add' := by sorry
  map_smul' := by sorry

/-- `GlueingDatum.sections_can_of_flat`: for a flat `R`-module `N` over an exact square, the unit
`N → sections(Can N)` is bijective (tensor the exact square with `N`). -/
theorem GlueingDatum.sections_can_of_flat (h : ExactSquare R R₁ R₂ R₁₂) (N : Type u)
    [AddCommGroup N] [Module R N] [Module.Flat R N] :
    Function.Bijective (GlueingDatum.canUnit (R := R) (R₁ := R₁) (R₂ := R₂) (R₁₂ := R₁₂) N) := by
  sorry

/-- `ExactSquare.zariski`: for `f, g` generating the unit ideal, `R → R_f, R_g → R_fg` is an exact
square (stated for the concrete localizations). -/
theorem ExactSquare.zariski {A : Type u} [CommRing A] (f g : A) (hfg : Ideal.span {f, g} = ⊤)
    [Algebra (Localization.Away f) (Localization.Away (f * g))]
    [Algebra (Localization.Away g) (Localization.Away (f * g))]
    [IsScalarTower A (Localization.Away f) (Localization.Away (f * g))]
    [IsScalarTower A (Localization.Away g) (Localization.Away (f * g))] :
    ExactSquare A (Localization.Away f) (Localization.Away g) (Localization.Away (f * g)) := by
  sorry

/-- `ExactSquare.not_exact_double_localization` (non-example): for `k[x]` and the square whose three
other corners are all `k[x, 1/x]`, the kernel of the difference is the diagonal `k[x, 1/x]`, which is
not the image of `k[x]`; so the square is not exact. -/
example (k : Type u) [Field k] :
    ¬ ExactSquare (Polynomial k) (Localization.Away (Polynomial.X : Polynomial k))
      (Localization.Away (Polynomial.X : Polynomial k))
      (Localization.Away (Polynomial.X : Polynomial k)) := by
  sorry

/-- `GlueingDatum.sections_identitySquare` (degenerate): for the identity square and the datum
`(M, M, M, id, id)` the module of sections is the diagonal. -/
example (A M : Type u) [CommRing A] [AddCommGroup M] [Module A M] (x : M × M) :
    x ∈ (⟨TensorProduct.lid A M, TensorProduct.lid A M⟩ : GlueingDatum A A A M M M).sections (R := A) ↔
      x.1 = x.2 := by
  sorry

/-- `ExactSquare.zariski_sections_can` (compatibility): for the Zariski square of `D(f), D(g)` and any
`A`-module `N`, the unit `N → sections(Can N)` is bijective (quasicoherent gluing on `Spec A`). -/
example {A : Type u} [CommRing A] (f g : A) (hfg : Ideal.span {f, g} = ⊤)
    [Algebra (Localization.Away f) (Localization.Away (f * g))]
    [Algebra (Localization.Away g) (Localization.Away (f * g))]
    [IsScalarTower A (Localization.Away f) (Localization.Away (f * g))]
    [IsScalarTower A (Localization.Away g) (Localization.Away (f * g))]
    (N : Type u) [AddCommGroup N] [Module A N] :
    Function.Bijective (GlueingDatum.canUnit (R := A) (R₁ := Localization.Away f)
      (R₂ := Localization.Away g) (R₁₂ := Localization.Away (f * g)) N) := by
  sorry

/-- The universal comparison-surjectivity hypothesis in Kedlaya–Liu 1.3.9.
It quantifies over every finite projective datum and over the tensor comparison map. -/
def ExactSquare.FiniteProjectiveSurjective : Prop :=
  ∀ (N₁ N₂ N₁₂ : Type u) [AddCommGroup N₁] [Module R₁ N₁] [Module R N₁]
    [IsScalarTower R R₁ N₁] [AddCommGroup N₂] [Module R₂ N₂] [Module R N₂]
    [IsScalarTower R R₂ N₂] [AddCommGroup N₁₂] [Module R₁₂ N₁₂]
    [Module.Finite R₁ N₁] [Module.Projective R₁ N₁]
    [Module.Finite R₂ N₂] [Module.Projective R₂ N₂]
    (D : GlueingDatum R₁ R₂ R₁₂ N₁ N₂ N₁₂),
    Function.Surjective (D.sectionsCompare (R := R)).1

/-- **Finite projective glueing** (Kedlaya–Liu 1.3.9): the actual sections module
is finite projective and its canonical comparison maps are bijective. Compatibility with the
transition maps is built into sections and the canonical comparisons. -/
theorem finiteProjective_glueing_effective (h : ExactSquare R R₁ R₂ R₁₂)
    (hsurj : ExactSquare.FiniteProjectiveSurjective (R := R) (R₁ := R₁) (R₂ := R₂) (R₁₂ := R₁₂))
    (hmax : ∀ m : Ideal R, m.IsMaximal →
      (∃ p : Ideal R₁, p.IsPrime ∧ p.comap (algebraMap R R₁) = m) ∨
      (∃ p : Ideal R₂, p.IsPrime ∧ p.comap (algebraMap R R₂) = m))
    (N₁ N₂ N₁₂ : Type u) [AddCommGroup N₁] [Module R₁ N₁] [Module R N₁]
    [IsScalarTower R R₁ N₁] [AddCommGroup N₂] [Module R₂ N₂] [Module R N₂]
    [IsScalarTower R R₂ N₂] [AddCommGroup N₁₂] [Module R₁₂ N₁₂]
    [Module.Finite R₁ N₁] [Module.Projective R₁ N₁]
    [Module.Finite R₂ N₂] [Module.Projective R₂ N₂]
    (D : GlueingDatum R₁ R₂ R₁₂ N₁ N₂ N₁₂) :
    Module.Finite R (D.sections (R := R)) ∧ Module.Projective R (D.sections (R := R)) ∧
      Function.Bijective (D.sectionsCompare (R := R)).1 ∧
      Function.Bijective (D.sectionsCompare (R := R)).2 := by
  sorry

/-- **Finite étale glueing** (Kedlaya–Liu 1.3.10). The same universal surjectivity
and maximal-ideal hypotheses are necessary. The recovered algebra isomorphisms must induce
the supplied transition `e` on every `m : A`. -/
theorem finiteEtale_glueing (h : ExactSquare R R₁ R₂ R₁₂)
    (hsurj : ExactSquare.FiniteProjectiveSurjective (R := R) (R₁ := R₁) (R₂ := R₂) (R₁₂ := R₁₂))
    (hmax : ∀ m : Ideal R, m.IsMaximal →
      (∃ p : Ideal R₁, p.IsPrime ∧ p.comap (algebraMap R R₁) = m) ∨
      (∃ p : Ideal R₂, p.IsPrime ∧ p.comap (algebraMap R R₂) = m))
    (A₁ A₂ : Type u) [CommRing A₁] [Algebra R₁ A₁] [Module.Finite R₁ A₁] [Algebra.Etale R₁ A₁]
    [CommRing A₂] [Algebra R₂ A₂] [Module.Finite R₂ A₂] [Algebra.Etale R₂ A₂]
    (e : R₁₂ ⊗[R₁] A₁ ≃ₐ[R₁₂] R₁₂ ⊗[R₂] A₂) :
    ∃ (A : Type u) (_ : CommRing A) (_ : Algebra R A), Module.Finite R A ∧ Algebra.Etale R A ∧
      ∃ (e₁ : R₁ ⊗[R] A ≃ₐ[R₁] A₁) (e₂ : R₂ ⊗[R] A ≃ₐ[R₂] A₂),
        ∀ m : A, e (1 ⊗ₜ[R₁] e₁ (1 ⊗ₜ[R] m)) = 1 ⊗ₜ[R₂] e₂ (1 ⊗ₜ[R] m) := by
  sorry

end ExactSquare

/-! ## RF4:vector-bundles — glueing pairs and the Beauville–Laszlo theorem (Stacks 15.92) -/

section GlueingPair

variable {R : Type u} [CommRing R]

/-- The `f`-power torsion `M[f^∞]`. -/
def fPowerTorsion (f : R) (M : Type u) [AddCommGroup M] [Module R M] : Set M :=
  {m | ∃ n : ℕ, f ^ n • m = 0}

/-- **Glueing pair** (Stacks, Section 15.92): `R → R'` induces `R/fⁿ ≅ R'/fⁿ` for all `n`, and
`R[f^∞] → R'[f^∞]` is bijective; equivalently `0 → R → R' ⊕ R_f → R'_f → 0` is exact
(`GlueingPair.iff_torsion_bijective`). -/
structure GlueingPair (R' : Type u) [CommRing R'] [Algebra R R'] (f : R) : Prop where
  /-- `R/fⁿ → R'/fⁿ` is surjective. -/
  quotient_surjective : ∀ n : ℕ, ∀ y : R', ∃ x : R,
    y - algebraMap R R' x ∈ Ideal.span {algebraMap R R' f ^ n}
  /-- `R/fⁿ → R'/fⁿ` is injective. -/
  quotient_injective : ∀ n : ℕ,
    (Ideal.span {algebraMap R R' f ^ n}).comap (algebraMap R R') = Ideal.span {f ^ n}
  /-- `R[f^∞] → R'[f^∞]` is bijective. -/
  torsion_bijOn : Set.BijOn (algebraMap R R') (fPowerTorsion f R)
    (fPowerTorsion (algebraMap R R' f) R')

namespace GlueingPair

variable {R' : Type u} [CommRing R'] [Algebra R R'] {f : R}

/-- The defining torsion criterion, under the required quotient isomorphisms. -/
theorem iff_torsion_bijective
    (hq : ∀ n : ℕ, ∀ y : R', ∃ x : R,
      y - algebraMap R R' x ∈ Ideal.span {algebraMap R R' f ^ n})
    (hi : ∀ n : ℕ,
      (Ideal.span {algebraMap R R' f ^ n}).comap (algebraMap R R') = Ideal.span {f ^ n}) :
    GlueingPair R' f ↔ Set.BijOn (algebraMap R R') (fPowerTorsion f R)
      (fPowerTorsion (algebraMap R R' f) R') := by
  sorry

/-- `GlueingPair.iff_exact` (Stacks 15.92.6): given the quotient isomorphisms, the
glueing-pair condition is the exactness of `0 → R → R' ⊕ R_f → R'_f → 0`. -/
theorem iff_exact
    (hq : ∀ n : ℕ, ∀ y : R', ∃ x : R, y - algebraMap R R' x ∈ Ideal.span {algebraMap R R' f ^ n})
    (hi : ∀ n : ℕ,
      (Ideal.span {algebraMap R R' f ^ n}).comap (algebraMap R R') = Ideal.span {f ^ n}) :
    GlueingPair R' f ↔
      (Function.Injective fun r : R =>
          (algebraMap R R' r, algebraMap R (Localization.Away f) r)) ∧
        ∀ (a : R') (b : Localization.Away f),
          algebraMap R' (Localization.Away (algebraMap R R' f)) a =
              Localization.awayMap (algebraMap R R') f b →
            ∃ r : R, algebraMap R R' r = a ∧ algebraMap R (Localization.Away f) r = b := by
  sorry

/-- `GlueingPair.of_nonZeroDivisor` (Stacks 15.92.7): a nonzerodivisor gives a glueing pair with
the `f`-adic completion. -/
theorem of_nonZeroDivisor (hf : f ∈ nonZeroDivisors R) :
    GlueingPair (AdicCompletion (Ideal.span {f}) R) f := by
  sorry

/-- `GlueingPair.of_flat` (Stacks 15.92.8): if the completion is flat, `(R, f)` is a glueing pair. -/
theorem of_flat (hflat : Module.Flat R (AdicCompletion (Ideal.span {f}) R)) :
    GlueingPair (AdicCompletion (Ideal.span {f}) R) f := by
  sorry

/-- `GlueingPair.quotient_equiv`: `R/fⁿ ≅ R'/fⁿ` for a glueing pair.
The completion special case is Stacks 15.92.1. -/
theorem quotient_equiv (h : GlueingPair R' f) (n : ℕ) :
    Function.Bijective (Ideal.quotientMap (Ideal.span {algebraMap R R' f ^ n}) (algebraMap R R')
      (by rw [h.quotient_injective n])) := by
  sorry

/-- `GlueingPair.toExactSquare`: a glueing pair is an exact square `R → R', R_f → R'_f`. -/
theorem toExactSquare (h : GlueingPair R' f)
    [Algebra (Localization.Away f) (Localization.Away (algebraMap R R' f))]
    [Algebra R (Localization.Away (algebraMap R R' f))]
    [IsScalarTower R R' (Localization.Away (algebraMap R R' f))]
    [IsScalarTower R (Localization.Away f) (Localization.Away (algebraMap R R' f))] :
    ExactSquare R R' (Localization.Away f) (Localization.Away (algebraMap R R' f)) := by
  sorry

/-- `GlueingPair.spec_surjective` (Stacks 15.92.3): every prime of `R` comes from `R'` or `R_f`. -/
theorem spec_surjective (h : GlueingPair R' f) (p : Ideal R) (hp : p.IsPrime) :
    (∃ q : Ideal R', q.IsPrime ∧ q.comap (algebraMap R R') = p) ∨ f ∉ p := by
  sorry

end GlueingPair

/-- `Glueable` (Stacks 15.92.10): `0 → M → (M ⊗ R') ⊕ M_f → M ⊗ R'_f → 0` is exact; by
`Glueable.iff_torsion` this is the injectivity of `M[f^∞] → (M ⊗ R')[f^∞]` for a glueing pair. -/
def Glueable (R' : Type u) [CommRing R'] [Algebra R R'] (f : R) (M : Type u) [AddCommGroup M]
    [Module R M] : Prop :=
  Set.InjOn (fun m : M => (1 : R') ⊗ₜ[R] m) (fPowerTorsion f M) ∧
    Set.SurjOn (fun m : M => (1 : R') ⊗ₜ[R] m) (fPowerTorsion f M)
      (fPowerTorsion (algebraMap R R' f) (R' ⊗[R] M))

/-- `Glueable.iff_torsion` (Stacks 15.92.10): for a glueing pair, glueability is injectivity on
`f`-power torsion. -/
theorem Glueable.iff_torsion {R' : Type u} [CommRing R'] [Algebra R R'] {f : R}
    (h : GlueingPair R' f) (M : Type u) [AddCommGroup M] [Module R M] :
    Glueable R' f M ↔ Set.InjOn (fun m : M => (1 : R') ⊗ₜ[R] m) (fPowerTorsion f M) := by
  sorry

/-- `Glueable.of_flat` (Stacks 15.92.11): flat modules are glueable. -/
theorem Glueable.of_flat {R' : Type u} [CommRing R'] [Algebra R R'] {f : R}
    (h : GlueingPair R' f) (M : Type u) [AddCommGroup M] [Module R M] [Module.Flat R M] :
    Glueable R' f M := by
  sorry

/-- `GlueingPair.int_p` (computation): `(ℤ, p)` is a glueing pair with completion `ℤ_p`. -/
example (p : ℕ) [Fact p.Prime] :
    GlueingPair (AdicCompletion (Ideal.span {(p : ℤ)}) ℤ) (p : ℤ) := by
  sorry

/-- `GlueingPair.of_isUnit` (degenerate): for a unit `f` every `R → R'` with `R'/fⁿ = 0`
satisfying the quotient conditions is a glueing pair, and the completion is zero. -/
example (f : R) (hf : IsUnit f) : Subsingleton (AdicCompletion (Ideal.span {f}) R) := by
  sorry

/-- `GlueingPair.noetherian_compat` (compatibility): for noetherian `R`, Mathlib's adic
completion is flat, hence `(R, f)` is a glueing pair and every module is glueable. -/
example [IsNoetherianRing R] (f : R) :
    GlueingPair (AdicCompletion (Ideal.span {f}) R) f := by
  sorry

/- `GlueingPair.not_stacks_example` (non-example, Stacks Example 15.92.9) and
`Glueable.not_smooth_germs` (non-example, Stacks Example 15.92.12) need the rings
`k[f, T₁, T₂, …]/(f T₁, f T₂ − T₁, …)` and germs of smooth functions; they are recorded in the
roadmap document and are not prototyped here. -/

/-- **The Beauville–Laszlo theorem** (`RF4:vector-bundles/beauville-laszlo-module-gluing`),
effectivity for finite projective data (Stacks 15.92.16, 15.92.19; Kedlaya–Liu 1.3.6(b)): a finite
projective `R'`-module, a finite projective `R_f`-module and an identification over `R'_f` come from a
finite projective `R`-module. -/
theorem beauvilleLaszlo_effective {R' : Type u} [CommRing R'] [Algebra R R'] {f : R}
    (h : GlueingPair R' f) (M' M₁ : Type u) [AddCommGroup M'] [Module R' M'] [Module.Finite R' M']
    [Module.Projective R' M'] [AddCommGroup M₁] [Module (Localization.Away f) M₁] [Module R M₁]
    [IsScalarTower R (Localization.Away f) M₁]
    [Module.Finite (Localization.Away f) M₁] [Module.Projective (Localization.Away f) M₁]
    (α : Localization.Away (algebraMap R R' f) ⊗[R'] M' ≃ₗ[Localization.Away (algebraMap R R' f)]
      Localization.Away (algebraMap R R' f) ⊗[R] M₁) :
    ∃ (M : Type u) (_ : AddCommGroup M) (_ : Module R M), Module.Finite R M ∧
      Module.Projective R M ∧
      ∃ (e' : R' ⊗[R] M ≃ₗ[R'] M')
        (e₁ : Localization.Away f ⊗[R] M ≃ₗ[Localization.Away f] M₁),
        ∀ m : M, α (1 ⊗ₜ[R'] e' (1 ⊗ₜ[R] m)) = 1 ⊗ₜ[R] e₁ (1 ⊗ₜ[R] m) := by
  sorry

/-- Beauville–Laszlo, finite projectivity criterion (Stacks 15.92.19; Scholze–Weinstein 5.2.9). -/
theorem beauvilleLaszlo_finiteProjective_iff {R' : Type u} [CommRing R'] [Algebra R R'] {f : R}
    (h : GlueingPair R' f) (M : Type u) [AddCommGroup M] [Module R M] :
    (Module.Finite R M ∧ Module.Projective R M) ↔
      ((Module.Finite R' (R' ⊗[R] M) ∧ Module.Projective R' (R' ⊗[R] M)) ∧
        (Module.Finite (Localization.Away f) (Localization.Away f ⊗[R] M) ∧
          Module.Projective (Localization.Away f) (Localization.Away f ⊗[R] M))) := by
  sorry

/-- Beauville–Laszlo, flatness criterion (Stacks 15.92.18). -/
theorem beauvilleLaszlo_flat_iff {R' : Type u} [CommRing R'] [Algebra R R'] {f : R}
    (h : GlueingPair R' f) (M : Type u) [AddCommGroup M] [Module R M] :
    Module.Flat R M ↔
      (Module.Flat R' (R' ⊗[R] M) ∧ Module.Flat (Localization.Away f) (Localization.Away f ⊗[R] M)) := by
  sorry

/-- The full exact sequence for a flat module over a glueing pair (Stacks 15.92.11).
Specialize to the completion using `GlueingPair.of_nonZeroDivisor` for KL 1.3.6(a).
`L` is the common localization R'[1/f]; all maps and scalar towers are specified explicitly.
The difference map is surjective; every compatible pair comes uniquely from the unit. -/
theorem beauvilleLaszlo_flat_exact {R' : Type u} [CommRing R'] [Algebra R R'] {f : R}
    (h : GlueingPair R' f) (L : Type u) [CommRing L] [Algebra R L] [Algebra R' L]
    [Algebra (Localization.Away f) L] [IsScalarTower R R' L]
    [IsScalarTower R (Localization.Away f) L] [IsLocalization.Away (algebraMap R R' f) L]
    (M : Type u) [AddCommGroup M] [Module R M] [Module.Flat R M] :
    let D := GlueingDatum.can (R := R) (R₁ := R') (R₂ := Localization.Away f) (R₁₂ := L) M
    Function.Bijective (GlueingDatum.canUnit (R := R) (R₁ := R') (R₂ := Localization.Away f)
      (R₁₂ := L) M) ∧ ∀ z, ∃ a b, D.ψ₁ (1 ⊗ₜ a) - D.ψ₂ (1 ⊗ₜ b) = z := by
  sorry

end GlueingPair

/-! ## RF4:vector-bundles — the local form of modifications and lattices

On an affinoid chart `A` around the divisor with local equation `ξ` (a nonzerodivisor), a
modification of a finite projective `A`-module `M'` bounded by `k` is a finite projective submodule
`M` of `M'[1/ξ]` with `ξᵏ M' ⊆ M ⊆ ξ⁻ᵏ M'`; by Beauville–Laszlo these are the lattices in
`M̂'[1/ξ]`. This is the algebraic core of `RF4:vector-bundles/meromorphic-modification-at-a-divisor`. -/

section LocalModification

variable {A : Type u} [CommRing A] (ξ : A)

/-- The `A`-submodules of `Localization.Away ξ ⊗ M'` bounded by `k` around `M'`: the local
modifications of `M'` along `ξ = 0`. -/
def localModificationsBoundedBy (M' : Type u) [AddCommGroup M'] [Module A M'] (k : ℕ) :
    Set (Submodule A (Localization.Away ξ ⊗[A] M')) :=
  {M | Module.Finite A M ∧ Module.Projective A M ∧
       (∀ m : M', (ξ ^ k) • ((1 : Localization.Away ξ) ⊗ₜ[A] m) ∈ M) ∧
       ∀ x ∈ M, ∃ m : M', (ξ ^ k) • x = (1 : Localization.Away ξ) ⊗ₜ[A] m}

/-- `Modification.ideal_inclusion` (computation, local form): the submodule `ξ A` of `A[1/ξ]` is a
modification of `A` bounded by `1` and not by `0`. -/
example (hξ : ξ ∈ nonZeroDivisors A) (hnu : ¬ IsUnit ξ) :
    (Submodule.span A {(algebraMap A (Localization.Away ξ) ξ) ⊗ₜ[A] (1 : A)} ∈
        localModificationsBoundedBy ξ A 1) ∧
      Submodule.span A {(algebraMap A (Localization.Away ξ) ξ) ⊗ₜ[A] (1 : A)} ∉
        localModificationsBoundedBy ξ A 0 := by
  sorry

end LocalModification

/-! ## RF4:vector-bundles — `B_dR` at a geometric point and Mathlib's carriers -/

section BdR

variable (p : ℕ) [Fact p.Prime] (O : Type u) [CommRing O] [Fact ¬ IsUnit (p : O)]
  [IsAdicComplete (Ideal.span {(p : O)}) O]

/- `RelativeBdRPlus.mathlib_compat` / `RelativeBdRPlus.equiv_mathlib`: the ring `R₂ = B^+_dR(A)` of
Kedlaya–Liu 8.9.4 is compared, in the `p`-typical case, with Mathlib's `BDeRhamPlus A⁺ p`,
and `R₃ = B_dR(A)` with `BDeRham A⁺ p`, after identifying the marked tilt, theta and divisor ideal.
Mathlib's Proj construction is imported above; the specific relative section algebra `P_R` and
the global analytic/schematic comparison are RF3/VB2 inputs. The comparison is recorded in the CONTRACT block of `relative-period-rings-Be-BdR`; the Mathlib
carriers are `BDeRhamPlus O p` and `BDeRham O p` for `O` as in this section. -/

end BdR

/-! ## RF4:G-torsors — lifting trivialisations over the completed rings (Fargues–Scholze VI.1.7)

The step "triviality of a `G`-torsor over `B⁺` is implied by triviality modulo `I_S`": the
coordinate ring of a torsor under a smooth group is formally smooth over `B⁺`, and `B⁺` is
`I_S`-adically complete, so Mathlib's `Algebra.FormallySmooth.exists_mkₐ_comp_eq_of_isAdicComplete`
lifts a section modulo `I_S`. -/

/-- Baseline check for `v-descent-and-local-triviality`, lifting step: the pinned Mathlib lemma in the
form the proof uses (not a unit test of a new definition). -/
example {B T : Type u} [CommRing B] [CommRing T] [Algebra B T] [Algebra.FormallySmooth B T]
    (I : Ideal B) [IsAdicComplete I B] (s : T →ₐ[B] B ⧸ I) :
    ∃ s' : T →ₐ[B] B, (Ideal.Quotient.mkₐ B I).comp s' = s :=
  Algebra.FormallySmooth.exists_mkₐ_comp_eq_of_isAdicComplete s

/-- Baseline check: an `I`-adically complete ring is henselian along `I` (Mathlib instance), the
hypothesis of Gabber–Ramero 5.4.21. -/
example {B : Type u} [CommRing B] (I : Ideal B) [IsAdicComplete I B] : HenselianRing B I :=
  inferInstance

/-! ## Mathematical contracts and outstanding prototypes

The following full contracts record every packet name. They are prose specifications, not
native lemma signatures or elaborated examples. Missing relative-curve, completed-divisor,
representation-category and G-bundle carriers prevent the geometric signatures. The native
algebra API also remains incomplete (morphisms/adjunction/tensor/base change and concrete
non-examples); the packet review records this explicitly. No contract is counted as a
formalized declaration or as a Lean example checked by the compiler.
-/

/- CONTRACT `RelativeFarguesFontaine:RF4:vector-bundles/glueing-datum-over-exact-square` (definition).
  Statement:
    An exact square of commutative rings is a commuting square R -> R_1, R -> R_2, R_1 -> R_12, R_2
    -> R_12 such that the sequence of R-modules 0 -> R -> R_1 (+) R_2 -> R_12 -> 0, whose last arrow
    is the difference (r_1, r_2) |-> r_1 - r_2 of the two maps, is exact. A glueing datum over it is
    a triple of modules M_1, M_2, M_12 over R_1, R_2, R_12 with isomorphisms psi_1 : M_1 (x)_{R_1}
    R_12 = M_12 and psi_2 : M_2 (x)_{R_2} R_12 = M_12; a morphism of glueing data is a triple of
    linear maps commuting with psi_1 and psi_2. The datum is finite, resp. finite projective, when
    M_1, M_2, M_12 are finite, resp. finite projective, over their rings. Its module of sections is
    M = ker(psi_1 - psi_2 : M_1 (+) M_2 -> M_12), with natural R-linear maps M -> M_i adjoint to M
    (x)_R R_i -> M_i. Every R-module N gives the glueing datum Can(N) = (N (x) R_1, N (x) R_2, N (x)
    R_12, can, can). No topology is involved.
  API ExactSquare (data):
    An exact square: four commutative rings, the four ring maps, commutativity, and exactness of 0
    -> R -> R_1 (+) R_2 -> R_12 -> 0.
  API ExactSquare.exact (characterisation):
    An element of R_1 (+) R_2 lies in the image of R iff its two images in R_12 agree, R -> R_1 (+)
    R_2 is injective, and R_1 (+) R_2 -> R_12 is surjective.
  API GlueingDatum (constructor):
    A glueing datum (M_1, M_2, M_12, psi_1, psi_2) over an exact square, with morphisms the
    compatible triples of linear maps.
  API GlueingDatum.sections (data):
    The module of sections M = ker(psi_1 - psi_2 : M_1 (+) M_2 -> M_12), an R-module, functorial in
    the datum.
  API GlueingDatum.sectionsCompare (projection):
    The natural maps M (x)_R R_i -> M_i (i = 1, 2), compatible with psi_1, psi_2 after base change
    to R_12.
  API GlueingDatum.can (functoriality):
    The functor Can : R-modules -> glueing data, N |-> (N (x) R_1, N (x) R_2, N (x) R_12, can, can),
    with map_id and map_comp.
  API GlueingDatum.can_sections_adjunction (universal-property):
    Hom_R(N, sections(D)) = Hom(Can(N), D) naturally in N and D.
  API GlueingDatum.sections_can_of_flat (characterisation):
    For a flat R-module N the unit N -> sections(Can N) is an isomorphism.
  API GlueingDatum.tensor (structure):
    Tensor product and dual of finite projective glueing data, componentwise, with sections(Can N
    (x) Can N') compatible with N (x) N' for finite projective N, N'.
  API GlueingDatum.baseChange (functoriality):
    For a map of exact squares (R -> R_1, R_2 -> R_12) -> (R' -> R'_1, R'_2 -> R'_12), base change
    of glueing data, compatible with Can.
  API ExactSquare.ofGlueingSquare (compatibility):
    Every glueing square of complete Tate rings (AdicSpacesPartII:R3/glueing-square) is an exact
    square, its finite glueing data are glueing data here, and its module of sections is the module
    of sections here.
  API ExactSquare.zariski (example):
    For f, g in R generating the unit ideal, R -> R_f, R_g -> R_fg is an exact square.
  example GlueingDatum.sections_zariski_Z (computation), mathematical contract only:
    For R = Z, f = 2, g = 3, the glueing datum (Z[1/2], Z[1/3], Z[1/6], id, multiplication by 3) has
    module of sections {(k, k/3) : k in Z}, free of rank one with generator (1, 1/3).
  example GlueingDatum.sections_identitySquare (degenerate), mathematical contract only:
    For the identity square R = R_1 = R_2 = R_12 and a datum (M, M, M, id, id), the module of
    sections is the diagonal, isomorphic to M.
  example ExactSquare.zariski_sections_can (compatibility), mathematical contract only:
    For the Zariski square of D(f), D(g) with (f, g) = R and any R-module N, sections(Can N) = N;
    this is gluing of quasicoherent sheaves on Spec R = D(f) u D(g).
  example ExactSquare.not_exact_double_localization (non-example), mathematical contract only:
    For R = k[x] and R_1 = R_2 = R_12 = k[x, 1/x], the square is not exact: the kernel of the
    difference is the diagonal k[x, 1/x], and sections(Can R) = k[x, 1/x] is not R.
-/

/- CONTRACT `RelativeFarguesFontaine:RF4:vector-bundles/finite-projective-glueing-over-exact-square` (theorem).
  Statement:
    Let R -> R_1, R_2 -> R_12 be an exact square. (i) For a finite glueing datum with module of
    sections M such that M (x)_R R_1 -> M_1 is surjective: psi_1 - psi_2 : M_1 (+) M_2 -> M_12 is
    surjective, M (x)_R R_2 -> M_2 is surjective, and a finitely generated submodule M_0 of M
    already surjects onto M_1 and M_2. (ii) Suppose M (x)_R R_1 -> M_1 is surjective for every
    finite projective glueing datum. Then for every finite projective glueing datum M is finitely
    presented and M (x)_R R_i -> M_i is bijective for i = 1, 2. (iii) If moreover the image of
    Spec(R_1 (+) R_2) -> Spec(R) contains every maximal ideal, M is finite projective; hence Can is
    an equivalence from finite projective R-modules to finite projective glueing data, with quasi-
    inverse the module of sections.
-/

/- CONTRACT `RelativeFarguesFontaine:RF4:vector-bundles/finite-etale-glueing-over-exact-square` (theorem).
  Statement:
    Under the hypotheses of RF4:vector-bundles/finite-projective-glueing-over-exact-square (iii),
    the base change functor FEt(R) -> FEt(R_1) x_{FEt(R_12)} FEt(R_2) from finite etale R-algebras
    to compatible pairs of finite etale algebras is an equivalence of categories.
-/

/- CONTRACT `RelativeFarguesFontaine:RF4:vector-bundles/glueing-pair` (definition).
  Statement:
    Let R be a ring, f in R, and R -> R' a ring map inducing isomorphisms R/f^n R = R'/f^n R' for
    all n >= 1 (for example R' = R-hat = lim R/f^n R). (R -> R', f) is a glueing pair if 0 -> R ->
    R' (+) R_f -> R'_f -> 0 (last arrow the difference) is exact; equivalently R[f^oo] -> R'[f^oo]
    is bijective, where M[f^oo] is the f-power torsion. (R, f) is a glueing pair if (R -> R-hat, f)
    is one. An R-module M is glueable for (R -> R', f) if 0 -> M -> (M (x)_R R') (+) M_f -> M (x)_R
    R'_f -> 0 is exact, equivalently M[f^oo] -> (M (x)_R R')[f^oo] is bijective. A glueing pair is
    in particular an exact square R -> R', R_f -> R'_f.
  API GlueingPair (data):
    A ring map R -> R' and f in R with R/f^n = R'/f^n for all n and the exact sequence 0 -> R -> R'
    (+) R_f -> R'_f -> 0.
  API GlueingPair.iff_torsion_bijective (characterisation):
    Assuming the ring map induces R/f^n R = R'/f^n R' for all positive n, (R -> R', f) is a glueing
    pair iff R[f^oo] -> R'[f^oo] is bijective (Stacks 15.92.6).
  API GlueingPair.of_nonZeroDivisor (constructor):
    If f is a nonzerodivisor of R then (R -> R-hat, f) is a glueing pair (Stacks 15.92.7).
  API GlueingPair.of_flat (constructor):
    If R -> R-hat is flat (for example R noetherian) then (R, f) is a glueing pair (Stacks 15.92.8).
  API GlueingPair.toExactSquare (coercion):
    A glueing pair is an exact square R -> R', R_f -> R'_f (RF4:vector-bundles/glueing-datum-over-
    exact-square).
  API GlueingPair.quotient_equiv (simp):
    For a glueing pair (R -> R',f), the canonical map R/f^n R -> R'/f^n R' is an isomorphism for
    every n. In the completion case R'=R-hat these quotient isomorphisms hold without assuming the
    pair condition (Stacks 15.92.1).
  API GlueingPair.spec_surjective (other):
    Spec(R') u Spec(R_f) -> Spec(R) is surjective (Stacks 15.92.3), the maximal-ideal condition of
    the exact-square glueing theorem.
  API Glueable (data):
    The predicate: 0 -> M -> (M (x) R') (+) M_f -> M (x) R'_f -> 0 is exact.
  API Glueable.iff_torsion (characterisation):
    For a glueing pair, M is glueable iff M[f^oo] -> (M (x) R')[f^oo] is injective (Stacks
    15.92.10).
  API Glueable.of_flat (constructor):
    Flat R-modules are glueable (Stacks 15.92.11).
  example GlueingPair.int_p (computation), mathematical contract only:
    For R = Z and f = p, R-hat = Z_p and 0 -> Z -> Z_p (+) Z[1/p] -> Q_p -> 0 is exact; (Z, p) is a
    glueing pair.
  example GlueingPair.of_isUnit (degenerate), mathematical contract only:
    If f is a unit then R-hat = 0, R_f = R, the sequence is 0 -> R -> R -> 0 -> 0, every module is
    glueable and glueing data are R-modules.
  example GlueingPair.noetherian_compat (compatibility), mathematical contract only:
    For R noetherian, Mathlib's AdicCompletion (Ideal.span {f}) R is flat over R, so (R, f) is a
    glueing pair and every R-module is glueable (Stacks 15.92.8, 15.92.11).
  example GlueingPair.not_stacks_example (non-example), mathematical contract only:
    For R = k[f, T_1, T_2, ...]/(f T_1, f T_2 - T_1, f T_3 - T_2, ...), (R, f) is not a glueing
    pair: T_1 is f-power torsion and nonzero in R but its image in R-hat is f-divisible, hence zero
    (Stacks Example 15.92.9).
  example Glueable.not_smooth_germs (non-example), mathematical contract only:
    For R the germs of smooth functions at 0 on the real line and f = x, the module R/phi R with phi
    = exp(-1/x^2) is not glueable although f is a nonzerodivisor (Stacks Example 15.92.12).
-/

/- CONTRACT `RelativeFarguesFontaine:RF4:vector-bundles/beauville-laszlo-module-gluing` (theorem).
  Statement:
    Let (R -> R', f) be a glueing pair (for instance R' = R-hat, the f-adic completion, with f a
    nonzerodivisor of R). (a) The functor Can : M |-> (M (x)_R R', M_f, can) is an equivalence from
    the category of R-modules glueable for (R -> R', f) to the category of glueing data (M', M_1,
    alpha_1 : (M')_f = M_1 (x)_R R'), with quasi-inverse the module of sections. In particular
    (Scholze-Weinstein 5.2.9) for f a nonzerodivisor, R-modules M on which f is a nonzerodivisor are
    equivalent to triples (M_{R-hat}, M_{R[1/f]}, beta) with f a nonzerodivisor on the R-hat-module
    M_{R-hat} and beta : M_{R-hat}[1/f] = M_{R[1/f]} (x)_R R-hat. (b) An R-module M is flat, resp.
    finite projective, iff M (x)_R R' and M_f are flat, resp. finite projective; hence every finite
    projective glueing datum is Can of a finite projective R-module, unique up to unique
    isomorphism, and R -> R' x R_f is an effective descent morphism for finite projective modules.
    (c) For a flat M the sequence 0 -> M -> (M (x)_R R_f) (+) (M (x)_R R-hat) -> M (x)_R R-hat_f ->
    0 is exact. The statement is not a case of fpqc descent: R -> R-hat need not be flat when R is
    not noetherian, and no descent datum over R-hat (x)_R R-hat is part of the data.
-/

/- CONTRACT `RelativeFarguesFontaine:RF4:vector-bundles/modification-of-vector-bundles` (definition).
  Statement:
    Conventions of this layer: E is a nonarchimedean local field with residue field F_q and
    uniformizer pi; S = Spa(R, R^+) is an affinoid perfectoid space over F_q with pseudouniformizer
    varpi; Y-curly_S = Spa W_{O_E}(R^+) minus V([varpi]), Y_S = Y-curly_S minus V(pi) and X_S = Y_S
    / phi^Z (RF0, RF1). For a map S -> Div^d_(-) the associated closed Cartier divisor D = D_S of
    Y-curly_S, Y_S or X_S has invertible ideal sheaf I_D (RF2:integral-divisors); when D is affinoid
    (always locally on S) B^+_D(S) denotes the global sections of the I_D-adic completion of the
    structure sheaf along D and B_D(S) = B^+_D(S)[1/I_D] (FS's B^+_{Div^d}(S), B_{Div^d}(S); B^+_dR,
    B_dR when d = 1). Let X-cal be one of Y-curly_S, Y_S, X_S and D a closed Cartier divisor of
    X-cal attached to a map S -> Div^d_(-), with ideal sheaf I_D and E(kD) = E (x) I_D^(-k). For
    vector bundles E, E' on X-cal, a modification of E' at D is a pair (E, beta) with beta :
    E|_{X-cal minus D} = E'|_{X-cal minus D} an isomorphism of vector bundles on the open complement
    which is meromorphic along D: locally on S and X-cal there is some k >= 0 such that beta extends
    to a morphism E -> E'(kD) and beta^(-1) extends to a morphism E' -> E(kD) (through the
    inclusions E' -> E'(kD), E -> E(kD)). Such a k is a bound of the modification. A morphism (E_1,
    beta_1) -> (E_2, beta_2) is an isomorphism E_1 -> E_2 whose restriction off D is beta_2^(-1)
    beta_1; modifications of E' at D form a groupoid Mod_D(E').
  API Modification (data):
    A modification of E' at D: a vector bundle E with an isomorphism beta : E|_{X minus D} = E'|_{X
    minus D} meromorphic along D in both directions.
  API Modification.extend (projection):
    For a bound k, the unique morphism E -> E'(kD) extending beta, and E' -> E(kD) extending
    beta^(-1).
  API Modification.refl (constructor):
    (E', id) is a modification of E' at D with bound 0.
  API Modification.symm (constructor):
    (E', beta^(-1)) is a modification of E at D with the same bound.
  API Modification.trans (constructor):
    Modifications bounded by k and l compose to one bounded by k + l.
  API Modification.tensor (structure):
    The tensor product of modifications of E'_1 and E'_2 bounded by k and l is a modification of
    E'_1 (x) E'_2 bounded by k + l; the dual of a modification bounded by k is bounded by k.
  API Modification.pullback (functoriality):
    For T -> S, pullback of (E, beta) along X-cal_T -> X-cal_S is a modification at D_T; pullback
    along the identity is the identity and pullbacks compose.
  API Modification.ext (extensionality):
    Two morphisms of modifications are equal iff they agree off D; (E_1, beta_1) and (E_2, beta_2)
    are isomorphic iff beta_2^(-1) beta_1 extends to an isomorphism E_1 = E_2.
  API Modification.ofSubbundle (constructor):
    An injective morphism E -> E' that is an isomorphism off D and whose image contains E'(-kD)
    defines a modification bounded by k.
  example Modification.ideal_inclusion (computation), mathematical contract only:
    For D nonempty, the inclusion I_D = O(-D) -> O_X-cal restricts to an isomorphism off D and is a
    modification of O at D bounded by 1, not bounded by 0.
  example Modification.empty_divisor (degenerate), mathematical contract only:
    For d = 0 (D empty) a modification of E' at D is an isomorphism E = E', and every bound works.
  example Modification.ff_absolute (compatibility), mathematical contract only:
    For S = Spa(C^flat) a geometric point and D = infinity on X_FF, modifications of E' at D are
    exactly Fargues-Fontaine's modifications of E' supported at {infinity} (5.6.4.2): bundles E with
    E|_{X minus infinity} = E'|_{X minus infinity}.
  example Modification.not_iso_off_D (non-example), mathematical contract only:
    For a second degree-one divisor D' disjoint from D, the inclusion O -> O(D') is not a
    modification of O(D') at D: it is not an isomorphism on X-cal minus D.
-/

/- CONTRACT `RelativeFarguesFontaine:RF4:vector-bundles/meromorphic-modification-at-a-divisor` (theorem).
  Statement:
    Conventions of this layer: E is a nonarchimedean local field with residue field F_q and
    uniformizer pi; S = Spa(R, R^+) is an affinoid perfectoid space over F_q with pseudouniformizer
    varpi; Y-curly_S = Spa W_{O_E}(R^+) minus V([varpi]), Y_S = Y-curly_S minus V(pi) and X_S = Y_S
    / phi^Z (RF0, RF1). For a map S -> Div^d_(-) the associated closed Cartier divisor D = D_S of
    Y-curly_S, Y_S or X_S has invertible ideal sheaf I_D (RF2:integral-divisors); when D is affinoid
    (always locally on S) B^+_D(S) denotes the global sections of the I_D-adic completion of the
    structure sheaf along D and B_D(S) = B^+_D(S)[1/I_D] (FS's B^+_{Div^d}(S), B_{Div^d}(S); B^+_dR,
    B_dR when d = 1). Let X-cal be Y-curly_S, Y_S or X_S, D the divisor of a map S -> Div^d_(-),
    assumed affinoid, and E' a vector bundle on X-cal with completion E'-hat_D = Gamma(D, completion
    of E' along D), a finite projective B^+_D(S)-module. Then (E, beta) |-> Xi(E, beta) :=
    beta(E-hat_D) is an equivalence from the groupoid Mod_D(E') of modifications of E' at D to the
    set of B^+_D(S)-lattices in E'-hat_D[1/I_D], i.e. finite projective B^+_D(S)-submodules Xi with
    Xi[1/I_D] = E'-hat_D[1/I_D]. A modification is bounded by k iff I_D^k E'-hat_D is contained in
    Xi and Xi in I_D^(-k) E'-hat_D. In particular the restriction E'|_{X-cal minus D} of this
    globally given reference bundle, a vector bundle on the formal neighbourhood (Xi) and an
    isomorphism on the punctured formal neighbourhood (Xi[1/I_D] = E'-hat_D[1/I_D]) determine a
    vector bundle on X-cal, and this fixed-reference gluing functor is fully faithful and
    essentially surjective. This does not assert effectivity for an arbitrary bundle given only off
    D; that stage target is recorded separately as a gap. Locally: on each sheafy affinoid chart U =
    Spa(A, A^+) meeting D on which I_D = xi A, the ring of completion along D intersect U is the xi-
    adic completion of A and the statement is RF4:vector-bundles/beauville-laszlo-module-gluing for
    the glueing pair (A, xi) combined with finite projective A-modules = vector bundles on U.
-/

/- CONTRACT `RelativeFarguesFontaine:RF4:vector-bundles/gluing-exactness-tensor-and-base-change` (theorem).
  Statement:
    Conventions of this layer: E is a nonarchimedean local field with residue field F_q and
    uniformizer pi; S = Spa(R, R^+) is an affinoid perfectoid space over F_q with pseudouniformizer
    varpi; Y-curly_S = Spa W_{O_E}(R^+) minus V([varpi]), Y_S = Y-curly_S minus V(pi) and X_S = Y_S
    / phi^Z (RF0, RF1). For a map S -> Div^d_(-) the associated closed Cartier divisor D = D_S of
    Y-curly_S, Y_S or X_S has invertible ideal sheaf I_D (RF2:integral-divisors); when D is affinoid
    (always locally on S) B^+_D(S) denotes the global sections of the I_D-adic completion of the
    structure sheaf along D and B_D(S) = B^+_D(S)[1/I_D] (FS's B^+_{Div^d}(S), B_{Div^d}(S); B^+_dR,
    B_dR when d = 1). In the setting of RF4:vector-bundles/meromorphic-modification-at-a-divisor:
    (a) the lattice functor commutes with tensor products, duals and internal Hom: Xi(E_1 (x) E_2) =
    Xi(E_1) (x) Xi(E_2) inside (E'_1 (x) E'_2)-hat_D[1/I_D] and Xi(E^dual) = Xi(E)^dual; (b) it is
    exact: a sequence of modifications 0 -> E_1 -> E -> E_2 -> 0 of a short exact sequence 0 -> E'_1
    -> E' -> E'_2 -> 0 is exact iff the sequence of lattices 0 -> Xi_1 -> Xi -> Xi_2 -> 0 is exact,
    and every exact sequence of lattices compatible with the completed sequence of the E' glues to
    an exact sequence of vector bundles; (c) it commutes with base change: for a map T -> S of
    affinoid perfectoid spaces with pulled-back divisor D_T, the pullback of (E, beta) corresponds
    to Xi (x)_{B^+_D(S)} B^+_{D_T}(T), compatibly with composition of base changes; (d) on the
    algebraic side, for a map of glueing pairs (R, f) -> (R_2, f_2) (a ring map with f |-> f_2 up to
    a unit), Can and the module of sections commute with base change of finite projective glueing
    data (coefficient change).
-/

/- CONTRACT `RelativeFarguesFontaine:RF4:vector-bundles/disjoint-and-colliding-legs` (theorem).
  Statement:
    Conventions of this layer: E is a nonarchimedean local field with residue field F_q and
    uniformizer pi; S = Spa(R, R^+) is an affinoid perfectoid space over F_q with pseudouniformizer
    varpi; Y-curly_S = Spa W_{O_E}(R^+) minus V([varpi]), Y_S = Y-curly_S minus V(pi) and X_S = Y_S
    / phi^Z (RF0, RF1). For a map S -> Div^d_(-) the associated closed Cartier divisor D = D_S of
    Y-curly_S, Y_S or X_S has invertible ideal sheaf I_D (RF2:integral-divisors); when D is affinoid
    (always locally on S) B^+_D(S) denotes the global sections of the I_D-adic completion of the
    structure sheaf along D and B_D(S) = B^+_D(S)[1/I_D] (FS's B^+_{Div^d}(S), B_{Div^d}(S); B^+_dR,
    B_dR when d = 1). Let D_1, D_2 be divisors attached to S -> Div^{d_1}_(-), S -> Div^{d_2}_(-)
    and D = D_1 + D_2 the divisor attached to their sum in Div^{d_1 + d_2}, so I_D = I_{D_1}
    I_{D_2}. (a) Disjoint legs: if D_1 and D_2 are disjoint then B^+_D(S) = B^+_{D_1}(S) x
    B^+_{D_2}(S) and B_D(S) = B_{D_1}(S) x B_{D_2}(S); a lattice at D is a pair of lattices, and
    modifications of E' at D are equivalent to pairs consisting of a modification (E_1, beta_1) of
    E' at D_1 and a modification of E_1 at D_2 (iterated gluing, in either order, canonically
    independent of the order). (b) Colliding legs: if D = m D_1 (all legs equal, m >= 1) then I_D =
    I_{D_1}^m, B^+_D(S) = B^+_{D_1}(S) and B_D(S) = B_{D_1}(S), and a modification is bounded by l
    at D iff it is bounded by m*l at D_1. A k-bound at D_1 implies a ceiling(k/m)-bound at D, while
    that bound at D implies only an m*ceiling(k/m)-bound at D_1. When a least global bound k_min
    exists, the least bound at D is ceiling(k_min/m). (c) For a locally finite family (D_n) of
    pairwise disjoint degree-one divisors of Y_S (for instance the Frobenius translates phi^n(D_0),
    n >= 1, on Y_{[0,oo)}), modifications of E' with locally finite support along the union and
    meromorphy bounded on each chart (no single global bound imposed) are equivalent to families of
    lattices (Xi_n) at each D_n.
-/

/- CONTRACT `RelativeFarguesFontaine:RF4:vector-bundles/untilt-divisor-complement-affine` (theorem).
  Statement:
    Kedlaya-Liu Hypotheses 8.7.1 and 8.9.1: a >= 1 an integer and q = p^a; (A, A^+) a perfectoid
    adic Banach algebra over Q_p, X = Spa(A, A^+), and (R, R^+) the perfect uniform adic Banach
    algebra over F_p corresponding to it; P_R = sum_{n >= 0} P_{R,n} the graded ring of
    phi^a-invariants (H^0 of O(n)), Proj(P_R) the schematic relative curve, FF_R -> Proj(P_R) the
    comparison morphism (an equivalence on vector bundles, KL 8.7.7), and Z the image of the
    canonical section Spec(A) -> Proj(P_R) given by the untilt A of R. For S = Spa(R, R^+) over F_q
    and E = W(F_q)[1/p] this is the schematic curve X_S^alg = Proj(P) of RF3 and the degree-one
    divisor of the untilt; L_X denotes the line bundle O(Z) (KL Definition 8.8.18, Convention
    8.9.2). Then (a) the open subscheme Proj(P_R) minus Z is affine; (b) the closed subscheme Z is a
    Cartier divisor contained in an open affine subscheme of Proj(P_R).
-/

/- CONTRACT `RelativeFarguesFontaine:RF4:vector-bundles/relative-period-rings-Be-BdR` (construction).
  Statement:
    Kedlaya-Liu Hypotheses 8.7.1 and 8.9.1: a >= 1 an integer and q = p^a; (A, A^+) a perfectoid
    adic Banach algebra over Q_p, X = Spa(A, A^+), and (R, R^+) the perfect uniform adic Banach
    algebra over F_p corresponding to it; P_R = sum_{n >= 0} P_{R,n} the graded ring of
    phi^a-invariants (H^0 of O(n)), Proj(P_R) the schematic relative curve, FF_R -> Proj(P_R) the
    comparison morphism (an equivalence on vector bundles, KL 8.7.7), and Z the image of the
    canonical section Spec(A) -> Proj(P_R) given by the untilt A of R. For S = Spa(R, R^+) over F_q
    and E = W(F_q)[1/p] this is the schematic curve X_S^alg = Proj(P) of RF3 and the degree-one
    divisor of the untilt; L_X denotes the line bundle O(Z) (KL Definition 8.8.18, Convention
    8.9.2). Define R_1 = B_e(A) by Spec(R_1) = Proj(P_R) minus Z (affine by RF4:vector-
    bundles/untilt-divisor-complement-affine (a)); R_2 = B^+_dR(A) by Spec(R_2) = the completion of
    Proj(P_R) along Z (affine by (b)); and R_3 = B_dR(A) by Spec(R_3) = Spec(R_1) x_{Proj(P_R)}
    Spec(R_2). Then R_2 is the ker(theta)-adic completion of R-tilde^{int,1}_R and R_3 = R_2[1/z]
    for any generator z of ker(theta); R_2 and R_3 are the rings B^+_D(S), B_D(S) of the degree-one
    untilt divisor D of RF2:untilts, and the triple is a relative version of Fontaine's (B_e,
    B^+_dR, B_dR).
  API RelativeBe (data):
    R_1 = B_e(A) = O(Proj(P_R) minus Z), a Q_p-algebra functorial in (A, A^+).
  API RelativeBdRPlus (data):
    R_2 = B^+_dR(A), the ring of the completion of Proj(P_R) along Z.
  API RelativeBdR (data):
    R_3 = B_dR(A) = O(Spec R_1 x_{Proj} Spec R_2).
  API RelativeBdR.eq_localization (characterisation):
    R_3 = R_2[1/z] for every generator z of ker(theta), and the localisation does not depend on z.
  API RelativeBdRPlus.equiv_completedRing (compatibility):
    R_2 = B^+_D(S) and R_3 = B_D(S) for the degree-one divisor D of the untilt
    (RelativeFarguesFontaine:RF2:untilts/BdR-completion-and-filtration), compatibly with theta and
    the I_D-adic filtration.
  API RelativeBdRPlus.equiv_mathlib (compatibility):
    In the p-typical case R_2 is canonically isomorphic to Mathlib's BDeRhamPlus A^+ p and R_3 to
    BDeRham A^+ p, through PadicHodgeTheory:R06.1/bdr-plus-of-perfectoid-affinoid-algebras.
  API RelativeBe.restrict (projection):
    The restriction maps R_1 -> R_3 and R_2 -> R_3, and the localisation R_2 -> R_3.
  API RelativeBe.map (functoriality):
    A morphism of perfectoid pairs (A, A^+) -> (A', A'^+) induces compatible maps R_i(A) -> R_i(A'),
    with map_id and map_comp.
  API RelativeBe.atGeometricPoint (example):
    For A = C complete algebraically closed, R_1 = B[1/t]^{phi = 1} = B_e for t in P_1 with V^+(t) =
    {infinity}.
  example RelativeBe.fundamental_exact_sequence (computation), mathematical contract only:
    For A = C and a = 1: ker(R_1 (+) R_2 -> R_3) = Q_p and R_1 (+) R_2 -> R_3 is surjective; this is
    Fontaine's fundamental exact sequence 0 -> Q_p -> B_e -> B_dR/B^+_dR -> 0
    (PadicHodgeTheory:R06.1/fundamental-exact-sequence).
  example RelativeBdR.localization_unit_invariant (degenerate), mathematical contract only:
    Replacing the generator z of ker(theta) by uz with u a unit of R_2 gives the same subring
    R_2[1/z] = R_2[1/(uz)] of R_3.
  example RelativeBdRPlus.mathlib_compat (compatibility), mathematical contract only:
    For (A, A^+) = (C, O_C) with C/Q_p complete algebraically closed, R_2 is isomorphic to
    BDeRhamPlus O_C p and R_3 to BDeRham O_C p, compatibly with theta.
  example RelativeBe.not_B_invert_t (non-example), mathematical contract only:
    R_1 is not B[1/t]: at A = C the element 1/t of B[1/t] is not phi-invariant (phi(1/t) = p^(-1)
    t^(-1)), so it does not lie in B_e.
-/

/- CONTRACT `RelativeFarguesFontaine:RF4:vector-bundles/B-pair-cohomology` (theorem).
  Statement:
    Kedlaya-Liu Hypotheses 8.7.1 and 8.9.1: a >= 1 an integer and q = p^a; (A, A^+) a perfectoid
    adic Banach algebra over Q_p, X = Spa(A, A^+), and (R, R^+) the perfect uniform adic Banach
    algebra over F_p corresponding to it; P_R = sum_{n >= 0} P_{R,n} the graded ring of
    phi^a-invariants (H^0 of O(n)), Proj(P_R) the schematic relative curve, FF_R -> Proj(P_R) the
    comparison morphism (an equivalence on vector bundles, KL 8.7.7), and Z the image of the
    canonical section Spec(A) -> Proj(P_R) given by the untilt A of R. For S = Spa(R, R^+) over F_q
    and E = W(F_q)[1/p] this is the schematic curve X_S^alg = Proj(P) of RF3 and the degree-one
    divisor of the untilt; L_X denotes the line bundle O(Z) (KL Definition 8.8.18, Convention
    8.9.2). With R_1, R_2, R_3 as in RF4:vector-bundles/relative-period-rings-Be-BdR, for every flat
    quasicoherent sheaf V on Proj(P_R) the cohomology of the complex 0 -> Gamma(Spec R_1, V) (+)
    Gamma(Spec R_2, V) -> Gamma(Spec R_3, V) -> 0, whose arrow is the difference of the two
    restriction maps, is naturally identified with H^i(Proj(P_R), V) (so H^i = 0 for i >= 2). At a
    geometric point (Fargues-Fontaine Proposition 5.3.3) for a vector bundle E with M = Gamma(X
    minus {infinity}, E) and N = E-hat_infinity: H^0(X, E) = M intersect N and H^1(X, E) = N[1/t]/(M
    + N).
-/

/- CONTRACT `RelativeFarguesFontaine:RF4:vector-bundles/vector-bundles-as-relative-B-pairs` (theorem).
  Statement:
    Kedlaya-Liu Hypotheses 8.7.1 and 8.9.1: a >= 1 an integer and q = p^a; (A, A^+) a perfectoid
    adic Banach algebra over Q_p, X = Spa(A, A^+), and (R, R^+) the perfect uniform adic Banach
    algebra over F_p corresponding to it; P_R = sum_{n >= 0} P_{R,n} the graded ring of
    phi^a-invariants (H^0 of O(n)), Proj(P_R) the schematic relative curve, FF_R -> Proj(P_R) the
    comparison morphism (an equivalence on vector bundles, KL 8.7.7), and Z the image of the
    canonical section Spec(A) -> Proj(P_R) given by the untilt A of R. For S = Spa(R, R^+) over F_q
    and E = W(F_q)[1/p] this is the schematic curve X_S^alg = Proj(P) of RF3 and the degree-one
    divisor of the untilt; L_X denotes the line bundle O(Z) (KL Definition 8.8.18, Convention
    8.9.2). (b) The morphism Spec(R_1 (+) R_2) -> Proj(P_R) is an effective descent morphism for
    quasicoherent finite locally free sheaves. (c) The category of vector bundles on Proj(P_R) is
    equivalent to the category of triples (V_1, V_2, iota) with V_1 a finite projective R_1 =
    B_e(A)-module, V_2 a finite projective R_2 = B^+_dR(A)-module and iota : V_1 (x)_{R_1} R_3 = V_2
    (x)_{R_2} R_3 an isomorphism of R_3 = B_dR(A)-modules; the equivalence is compatible with tensor
    products and short exact sequences. By GAGA the same holds for vector bundles on the adic
    relative curve FF_R = X_S (Caraiani-Scholze Theorem 3.5.1). At a geometric point S =
    Spa(C^flat), where B_e is a principal ideal domain, vector bundles on X_FF are triples of finite
    free modules (Fargues-Fontaine Corollaire 5.3.2) and isomorphism classes of rank-n bundles are
    GL_n(B_e) \ GL_n(B_dR) / GL_n(B^+_dR).
-/

/- CONTRACT `RelativeFarguesFontaine:RF4:vector-bundles/lattices-and-modifications-of-trivial-bundles` (comparison).
  Statement:
    Conventions of this layer: E is a nonarchimedean local field with residue field F_q and
    uniformizer pi; S = Spa(R, R^+) is an affinoid perfectoid space over F_q with pseudouniformizer
    varpi; Y-curly_S = Spa W_{O_E}(R^+) minus V([varpi]), Y_S = Y-curly_S minus V(pi) and X_S = Y_S
    / phi^Z (RF0, RF1). For a map S -> Div^d_(-) the associated closed Cartier divisor D = D_S of
    Y-curly_S, Y_S or X_S has invertible ideal sheaf I_D (RF2:integral-divisors); when D is affinoid
    (always locally on S) B^+_D(S) denotes the global sections of the I_D-adic completion of the
    structure sheaf along D and B_D(S) = B^+_D(S)[1/I_D] (FS's B^+_{Div^d}(S), B_{Div^d}(S); B^+_dR,
    B_dR when d = 1). (a) For S affinoid perfectoid with an untilt S^sharp over E, D = S^sharp the
    degree-one divisor of X_S, fix a finite free O_E-module T and the reference bundle F = T
    (x)_{O_E} O_{X_S}. The gluing of RF4:vector-bundles/meromorphic-modification-at-a-divisor gives
    an equivalence between B^+_dR(S^sharp)-lattices Xi in T (x)_{O_E} B_dR(S^sharp) and
    modifications (F', beta^(-1)) of this fixed F at D, where beta : F|_{X_S minus D} -> F'|_{X_S
    minus D} is meromorphic along D. If T varies, the output retains T and its identification with
    the reference bundle; forgetting this integral data does not give an equivalence of categories.
    (b) For S = Spa(C^flat) and E = Q_p, using the locally finite family of disjoint divisors
    phi^n(x_C), n >= 1, of Y_{[0,oo)}: the pairs (T, Xi) are equivalent to shtukas over Spa(C^flat)
    with one leg at phi^(-1)(x_C) (Scholze-Weinstein Proposition 12.4.6), and to quadruples (F, F',
    beta, T) with F trivial and T a Z_p-lattice in H^0(X_FF, F) (Theorem 14.1.1, (2) <=> (3)). (c)
    Minuscule case (Fargues-Fontaine 8.3.1): lattices with t Xi_0 in Xi in Xi_0, Xi_0 = T (x)
    B^+_dR, correspond to C-subspaces of T (x) C, i.e. to modifications whose cokernel is killed by
    t.
-/

/- CONTRACT `RelativeFarguesFontaine:RF4:vector-bundles/kedlaya-algebraicity-of-punctured-bundles` (theorem).
  Statement:
    Let R be a perfect Tate Huber ring of characteristic p, R^+ a ring of integral elements, x in R
    a topologically nilpotent unit (so x in R^+), and A = W(R^+) (p-typical Witt vectors). Let X-sch
    = Spec(A) minus V(p, [x]) and Y-ad = Spa(A, A) minus V(p, [x]), the analytic locus. Then
    pullback along the morphism of locally ringed spaces Y-ad -> X-sch is an equivalence Vec(X-sch)
    = Vec(Y-ad) (Kedlaya, Theorem 3.8). If moreover R^+ = o_K for a perfectoid field K of
    characteristic p, then finite free A-modules, vector bundles on Spa(A, A) and vector bundles on
    Spa(A, A) minus the closed point are equivalent (Kedlaya Theorem 3.9; Scholze-Weinstein Theorem
    14.2.1), and so are vector bundles on Spec(A) minus the closed point (Scholze-Weinstein Lemma
    14.2.3). For general R^+ a vector bundle on Spec(A) minus {p = [x] = 0} need not extend to
    Spec(A) (Kedlaya Example 3.14).
-/

/- CONTRACT `RelativeFarguesFontaine:RF4:G-torsors/meromorphic-G-modification` (definition).
  Statement:
    Conventions of this layer: E is a nonarchimedean local field with residue field F_q and
    uniformizer pi; S = Spa(R, R^+) is an affinoid perfectoid space over F_q with pseudouniformizer
    varpi; Y-curly_S = Spa W_{O_E}(R^+) minus V([varpi]), Y_S = Y-curly_S minus V(pi) and X_S = Y_S
    / phi^Z (RF0, RF1). For a map S -> Div^d_(-) the associated closed Cartier divisor D = D_S of
    Y-curly_S, Y_S or X_S has invertible ideal sheaf I_D (RF2:integral-divisors); when D is affinoid
    (always locally on S) B^+_D(S) denotes the global sections of the I_D-adic completion of the
    structure sheaf along D and B_D(S) = B^+_D(S)[1/I_D] (FS's B^+_{Div^d}(S), B_{Div^d}(S); B^+_dR,
    B_dR when d = 1). G-bundles are taken in the Tannakian sense of BunGAndNewtonStrata:BG0: for G a
    linear algebraic group over E (affine of finite type), Rep_E G its finite-dimensional
    representations, a G-bundle on an adic space or scheme X over E is an exact tensor functor Rep_E
    G -> Bun(X); BG0 proves this equivalent to geometric and cohomological torsors on sousperfectoid
    spaces. For G smooth affine over O_E the same with representations on finite free O_E-modules
    (Scholze-Weinstein 19.5). Over an affine scheme Spec(B), Bun means finite projective B-modules.
    The general equivalence of the three descriptions is BG0's and is not proved here (RS-20). Let
    X-cal be Y_S or X_S, D the divisor of a map S -> Div^d_(-) and P, P' G-bundles on X-cal. A
    modification between P and P' at D is an isomorphism beta : P|_{X-cal minus D} = P'|_{X-cal
    minus D} of exact tensor functors on X-cal minus D such that for every V in Rep_E G the induced
    isomorphism beta_V : P(V)|_{X-cal minus D} = P'(V)|_{X-cal minus D} is meromorphic along D, i.e.
    extends to a morphism P(V) -> P'(V)(kD) for k >> 0 (Fargues-Scholze III.3). Applying this to
    V^dual shows that each beta_V is a modification of vector bundles in the sense of RF4:vector-
    bundles/modification-of-vector-bundles. Modifications between G-bundles at D form a groupoid,
    and G-modifications of a fixed P' at D form a groupoid Mod^G_D(P').
  API GModification (data):
    A modification between G-bundles P and P' at D: an isomorphism of exact tensor functors off D,
    meromorphic on every representation.
  API GModification.toModification (projection):
    For V in Rep_E G, beta_V is a modification of P'(V) at D (RF4:vector-bundles/modification-of-
    vector-bundles), natural in V and compatible with tensor products and duals.
  API GModification.ofGL (equivalence):
    For G = GL_n, G-modifications are the modifications of the rank-n vector bundles P(std).
  API GModification.refl (constructor):
    The identity of P is a modification between P and P.
  API GModification.symm (constructor):
    The inverse of a modification is a modification.
  API GModification.trans (constructor):
    The composite of modifications at D is a modification at D.
  API GModification.pushforward (functoriality):
    For rho : G -> H, rho_* beta (precomposition with Res : Rep H -> Rep G) is a modification
    between rho_* P and rho_* P'.
  API GModification.pullback (functoriality):
    Pullback along T -> S of affinoid perfectoid spaces, with map_id and map_comp.
  API GModification.ext (extensionality):
    Two modifications between P and P' are equal iff they agree on one faithful representation
    (equivalently off D on all representations).
  example GModification.gl_eq_modification (compatibility), mathematical contract only:
    For G = GL_n, the map beta |-> beta_std is a bijection from modifications between P and P' at D
    to modifications of the vector bundles P(std), P'(std) at D.
  example GModification.gm_geometric_point (computation), mathematical contract only:
    For G = G_m, S = Spa(C^flat) and D = infinity, the modifications of the trivial G_m-bundle at D
    are the line bundles O(-k), k in Z, with the lattice xi^k B^+_dR (xi a uniformiser of B^+_dR).
  example GModification.identity_degenerate (degenerate), mathematical contract only:
    For d = 0 (D empty) a modification between P and P' is an isomorphism of G-bundles P = P'.
  example GModification.not_iso_extension (non-example), mathematical contract only:
    Meromorphy is not extension to an isomorphism over D: for G = G_m the inclusion O(-D) -> O is a
    modification between O(-D) and O at D, although it does not extend to an isomorphism of G_m-
    bundles on X-cal.
-/

/- CONTRACT `RelativeFarguesFontaine:RF4:G-torsors/tannakian-transfer-of-gluing` (theorem).
  Statement:
    Conventions of this layer: E is a nonarchimedean local field with residue field F_q and
    uniformizer pi; S = Spa(R, R^+) is an affinoid perfectoid space over F_q with pseudouniformizer
    varpi; Y-curly_S = Spa W_{O_E}(R^+) minus V([varpi]), Y_S = Y-curly_S minus V(pi) and X_S = Y_S
    / phi^Z (RF0, RF1). For a map S -> Div^d_(-) the associated closed Cartier divisor D = D_S of
    Y-curly_S, Y_S or X_S has invertible ideal sheaf I_D (RF2:integral-divisors); when D is affinoid
    (always locally on S) B^+_D(S) denotes the global sections of the I_D-adic completion of the
    structure sheaf along D and B_D(S) = B^+_D(S)[1/I_D] (FS's B^+_{Div^d}(S), B_{Div^d}(S); B^+_dR,
    B_dR when d = 1). G-bundles are taken in the Tannakian sense of BunGAndNewtonStrata:BG0: for G a
    linear algebraic group over E (affine of finite type), Rep_E G its finite-dimensional
    representations, a G-bundle on an adic space or scheme X over E is an exact tensor functor Rep_E
    G -> Bun(X); BG0 proves this equivalent to geometric and cohomological torsors on sousperfectoid
    spaces. For G smooth affine over O_E the same with representations on finite free O_E-modules
    (Scholze-Weinstein 19.5). Over an affine scheme Spec(B), Bun means finite projective B-modules.
    The general equivalence of the three descriptions is BG0's and is not proved here (RS-20). (i)
    Let G be a linear algebraic group over E, X-cal = Y_S or X_S, D the affinoid divisor of S ->
    Div^d_(-), and P' a G-bundle on X-cal with completion P'-hat_D (the exact tensor functor V |->
    P'(V)-hat_D to finite projective B^+_D(S)-modules). Then P |-> P-hat_D gives an equivalence
    between the groupoid of pairs (P, beta), beta a modification between P and P' at D
    (RF4:G-torsors/meromorphic-G-modification), and the groupoid of pairs (Q, alpha) with Q a
    G-torsor on Spec B^+_D(S) and alpha : Q|_{Spec B_D(S)} = P'-hat_D|_{Spec B_D(S)}. In particular
    every such (Q, alpha) is effective. For d = 1, S over Spd E with untilt S^sharp and P' trivial:
    G-torsors on Spec B^+_dR(R^sharp) with a trivialisation over B_dR(R^sharp) correspond to
    G-bundles on X_S with a modification of the trivial G-bundle at S^sharp (Fargues-Scholze III.3,
    Scholze-Weinstein Proposition 19.1.2). (ii) For G smooth affine over O_E and X-cal = Y-curly_S
    (or an open subset of S x Spa O_E as in Scholze-Weinstein 19.1.2) the same holds, with the O_E-
    integral Tannakian description of torsors.
-/

/- CONTRACT `RelativeFarguesFontaine:RF4:G-torsors/faithful-representation-criterion` (theorem).
  Statement:
    Conventions of this layer: E is a nonarchimedean local field with residue field F_q and
    uniformizer pi; S = Spa(R, R^+) is an affinoid perfectoid space over F_q with pseudouniformizer
    varpi; Y-curly_S = Spa W_{O_E}(R^+) minus V([varpi]), Y_S = Y-curly_S minus V(pi) and X_S = Y_S
    / phi^Z (RF0, RF1). For a map S -> Div^d_(-) the associated closed Cartier divisor D = D_S of
    Y-curly_S, Y_S or X_S has invertible ideal sheaf I_D (RF2:integral-divisors); when D is affinoid
    (always locally on S) B^+_D(S) denotes the global sections of the I_D-adic completion of the
    structure sheaf along D and B_D(S) = B^+_D(S)[1/I_D] (FS's B^+_{Div^d}(S), B_{Div^d}(S); B^+_dR,
    B_dR when d = 1). G-bundles are taken in the Tannakian sense of BunGAndNewtonStrata:BG0: for G a
    linear algebraic group over E (affine of finite type), Rep_E G its finite-dimensional
    representations, a G-bundle on an adic space or scheme X over E is an exact tensor functor Rep_E
    G -> Bun(X); BG0 proves this equivalent to geometric and cohomological torsors on sousperfectoid
    spaces. For G smooth affine over O_E the same with representations on finite free O_E-modules
    (Scholze-Weinstein 19.5). Over an affine scheme Spec(B), Bun means finite projective B-modules.
    The general equivalence of the three descriptions is BG0's and is not proved here (RS-20). Let G
    be a linear algebraic group over E and V in Rep_E G faithful. (a) An isomorphism beta :
    P|_{X-cal minus D} = P'|_{X-cal minus D} of G-bundles is a modification at D iff beta_V is a
    modification of the vector bundles P(V), P'(V) at D (both beta_V and beta_V^(-1) meromorphic).
    (b) Consequently the G-gluing of RF4:G-torsors/tannakian-transfer-of-gluing and its bounds may
    be computed with any faithful representation: if beta_V is bounded by k then for every tensor
    construction W = V^(x a) (x) (V^dual)^(x b) and every subquotient of a direct sum of copies of
    that tensor word, beta_W is bounded by (a + b) k. For a finite sum of tensor words of differing
    bidegrees (a_i,b_i), the bound is max_i(a_i + b_i) k.
-/

/- CONTRACT `RelativeFarguesFontaine:RF4:G-torsors/change-of-structure-group` (theorem).
  Statement:
    Conventions of this layer: E is a nonarchimedean local field with residue field F_q and
    uniformizer pi; S = Spa(R, R^+) is an affinoid perfectoid space over F_q with pseudouniformizer
    varpi; Y-curly_S = Spa W_{O_E}(R^+) minus V([varpi]), Y_S = Y-curly_S minus V(pi) and X_S = Y_S
    / phi^Z (RF0, RF1). For a map S -> Div^d_(-) the associated closed Cartier divisor D = D_S of
    Y-curly_S, Y_S or X_S has invertible ideal sheaf I_D (RF2:integral-divisors); when D is affinoid
    (always locally on S) B^+_D(S) denotes the global sections of the I_D-adic completion of the
    structure sheaf along D and B_D(S) = B^+_D(S)[1/I_D] (FS's B^+_{Div^d}(S), B_{Div^d}(S); B^+_dR,
    B_dR when d = 1). G-bundles are taken in the Tannakian sense of BunGAndNewtonStrata:BG0: for G a
    linear algebraic group over E (affine of finite type), Rep_E G its finite-dimensional
    representations, a G-bundle on an adic space or scheme X over E is an exact tensor functor Rep_E
    G -> Bun(X); BG0 proves this equivalent to geometric and cohomological torsors on sousperfectoid
    spaces. For G smooth affine over O_E the same with representations on finite free O_E-modules
    (Scholze-Weinstein 19.5). Over an affine scheme Spec(B), Bun means finite projective B-modules.
    The general equivalence of the three descriptions is BG0's and is not proved here (RS-20). Let
    rho : G -> H be a homomorphism of linear algebraic groups over E (resp. of smooth affine group
    schemes over O_E). (a) Pushforward rho_* (precomposition with the restriction functor Res_rho :
    Rep H -> Rep G) carries G-modifications at D to H-modifications at D, and commutes with the
    gluing of RF4:G-torsors/tannakian-transfer-of-gluing: rho_*(glue(Q, alpha)) = glue(rho_* Q,
    rho_* alpha), compatibly with composition (rho' rho)_* = rho'_* rho_*. (b) Over E, if rho is a
    closed immersion, an isomorphism of G-bundles off D is meromorphic along D iff its pushforward
    to H is.
-/

/- CONTRACT `RelativeFarguesFontaine:RF4:G-torsors/base-change-and-divisor-compatibility` (theorem).
  Statement:
    Conventions of this layer: E is a nonarchimedean local field with residue field F_q and
    uniformizer pi; S = Spa(R, R^+) is an affinoid perfectoid space over F_q with pseudouniformizer
    varpi; Y-curly_S = Spa W_{O_E}(R^+) minus V([varpi]), Y_S = Y-curly_S minus V(pi) and X_S = Y_S
    / phi^Z (RF0, RF1). For a map S -> Div^d_(-) the associated closed Cartier divisor D = D_S of
    Y-curly_S, Y_S or X_S has invertible ideal sheaf I_D (RF2:integral-divisors); when D is affinoid
    (always locally on S) B^+_D(S) denotes the global sections of the I_D-adic completion of the
    structure sheaf along D and B_D(S) = B^+_D(S)[1/I_D] (FS's B^+_{Div^d}(S), B_{Div^d}(S); B^+_dR,
    B_dR when d = 1). G-bundles are taken in the Tannakian sense of BunGAndNewtonStrata:BG0: for G a
    linear algebraic group over E (affine of finite type), Rep_E G its finite-dimensional
    representations, a G-bundle on an adic space or scheme X over E is an exact tensor functor Rep_E
    G -> Bun(X); BG0 proves this equivalent to geometric and cohomological torsors on sousperfectoid
    spaces. For G smooth affine over O_E the same with representations on finite free O_E-modules
    (Scholze-Weinstein 19.5). Over an affine scheme Spec(B), Bun means finite projective B-modules.
    The general equivalence of the three descriptions is BG0's and is not proved here (RS-20). (a)
    For a map f : T -> S of affinoid perfectoid spaces over F_q and D the divisor of S -> Div^d_(-),
    the G-gluing of RF4:G-torsors/tannakian-transfer-of-gluing commutes with pullback: f^* glue(Q,
    alpha) = glue(Q (x)_{B^+_D(S)} B^+_{D_T}(T), alpha_T), compatibly with composition of base
    changes. (b) For D = D_1 + D_2 with D_1, D_2 disjoint, G-torsors on Spec B^+_D(S) with an
    isomorphism over B_D(S) are pairs of such data at D_1 and D_2, and the gluing at D is the
    iterated gluing at D_1 and D_2; for colliding legs D = m D_1 the data at D and at D_1 coincide.
    (c) For arbitrary D_1, D_2, a chain of modifications at D_1 then D_2 has a composite meromorphic
    at D_1 + D_2: representationwise the local equations multiply, and the two finite pole bounds
    give a bound at the sum. This construction commutes with base change. An equivalence with pairs
    of independent lattice data is asserted only on the disjoint locus; on a collision locus the
    chain retains extra intermediate data.
-/

/- CONTRACT `RelativeFarguesFontaine:RF4:G-torsors/v-descent-and-local-triviality` (theorem).
  Statement:
    Conventions of this layer: E is a nonarchimedean local field with residue field F_q and
    uniformizer pi; S = Spa(R, R^+) is an affinoid perfectoid space over F_q with pseudouniformizer
    varpi; Y-curly_S = Spa W_{O_E}(R^+) minus V([varpi]), Y_S = Y-curly_S minus V(pi) and X_S = Y_S
    / phi^Z (RF0, RF1). For a map S -> Div^d_(-) the associated closed Cartier divisor D = D_S of
    Y-curly_S, Y_S or X_S has invertible ideal sheaf I_D (RF2:integral-divisors); when D is affinoid
    (always locally on S) B^+_D(S) denotes the global sections of the I_D-adic completion of the
    structure sheaf along D and B_D(S) = B^+_D(S)[1/I_D] (FS's B^+_{Div^d}(S), B_{Div^d}(S); B^+_dR,
    B_dR when d = 1). G-bundles are taken in the Tannakian sense of BunGAndNewtonStrata:BG0: for G a
    linear algebraic group over E (affine of finite type), Rep_E G its finite-dimensional
    representations, a G-bundle on an adic space or scheme X over E is an exact tensor functor Rep_E
    G -> Bun(X); BG0 proves this equivalent to geometric and cohomological torsors on sousperfectoid
    spaces. For G smooth affine over O_E the same with representations on finite free O_E-modules
    (Scholze-Weinstein 19.5). Over an affine scheme Spec(B), Bun means finite projective B-modules.
    The general equivalence of the three descriptions is BG0's and is not proved here (RS-20). (a)
    For S in Perf over F_q, U an open subset of S x Spa O_E (for example of Y-curly_S) and G smooth
    affine over O_E, the functor S' |-> {G-torsors on U x_{S x Spa O_E} (S' x Spa O_E)} is a v-stack
    on Perf_S (Scholze-Weinstein Proposition 19.5.3; Fargues-Scholze's footnote extends it from Z_p
    to O_E). (b) For S -> Div^d_(-) with D_S affinoid, vector bundles and G-bundles over
    B^+_{Div^d}(S) (G reductive over O_E, resp. over E) satisfy v-descent in S, and so do
    isomorphisms between two of them over B_{Div^d}(S). (c) Every G-bundle over
    B^+_{Div^d_{Y-curly}}(S), G reductive over O_E, is trivial etale-locally on S. The quotient
    presentations Hck = L^+G \ LG / L^+G and Gr = LG / L^+G that Fargues-Scholze deduce from (b) and
    (c) are GeometricSatakeAndFusion:GS0:loop-geometry's and are not planned here.
-/

/- CONTRACT `RelativeFarguesFontaine:RF4:G-torsors/modification-of-G-bundle-by-lattice` (construction).
  Statement:
    Conventions of this layer: E is a nonarchimedean local field with residue field F_q and
    uniformizer pi; S = Spa(R, R^+) is an affinoid perfectoid space over F_q with pseudouniformizer
    varpi; Y-curly_S = Spa W_{O_E}(R^+) minus V([varpi]), Y_S = Y-curly_S minus V(pi) and X_S = Y_S
    / phi^Z (RF0, RF1). For a map S -> Div^d_(-) the associated closed Cartier divisor D = D_S of
    Y-curly_S, Y_S or X_S has invertible ideal sheaf I_D (RF2:integral-divisors); when D is affinoid
    (always locally on S) B^+_D(S) denotes the global sections of the I_D-adic completion of the
    structure sheaf along D and B_D(S) = B^+_D(S)[1/I_D] (FS's B^+_{Div^d}(S), B_{Div^d}(S); B^+_dR,
    B_dR when d = 1). G-bundles are taken in the Tannakian sense of BunGAndNewtonStrata:BG0: for G a
    linear algebraic group over E (affine of finite type), Rep_E G its finite-dimensional
    representations, a G-bundle on an adic space or scheme X over E is an exact tensor functor Rep_E
    G -> Bun(X); BG0 proves this equivalent to geometric and cohomological torsors on sousperfectoid
    spaces. For G smooth affine over O_E the same with representations on finite free O_E-modules
    (Scholze-Weinstein 19.5). Over an affine scheme Spec(B), Bun means finite projective B-modules.
    The general equivalence of the three descriptions is BG0's and is not proved here (RS-20). Let S
    be a perfectoid space over Spd E (untilt S^sharp over E, D = S^sharp the degree-one divisor of
    X_S), G a linear algebraic group over E, P a G-bundle on X_S and L a G(B^+_dR)-lattice on the
    G(B_dR)-torsor P|_{B_dR}: a G-torsor Q on Spec B^+_dR(R^sharp), given etale-locally on S, with
    alpha : Q|_{B_dR} = P-hat_D|_{B_dR}. The modification P_L of P by L is the G-bundle on X_S glued
    from (P, Q, alpha) by RF4:G-torsors/tannakian-transfer-of-gluing, with its canonical
    modification P_L|_{X_S minus D} = P|_{X_S minus D}. It is functorial in (P, L), compatible with
    pullback in S and with pushforward along homomorphisms of groups. For P trivial it is the map E
    from G-torsors on Spec B^+_dR trivialised over B_dR to G-bundles on X_S of Caraiani-Scholze
    Corollary 3.5.2 and Fargues-Scholze III.3; identifying its source with Gr_G(S) is
    GeometricSatakeAndFusion:GS0:loop-geometry's, and the resulting Beauville-Laszlo morphism Gr_G
    -> Bun_G is exported to BG2:uniformization, HS0 and HS2.
  API modify (constructor):
    The G-bundle P_L on X_S attached to a G-bundle P and a G(B^+_dR)-lattice L on P|_{B_dR}.
  API modify.modification (projection):
    The canonical modification P_L|_{X_S minus D} = P|_{X_S minus D}, meromorphic along D.
  API modify_tautological (simp):
    For the tautological lattice L = P-hat_D, P_L = P with the identity modification.
  API modify_comp (relation):
    For L a lattice on P|_{B_dR} and L' a lattice on P_L|_{B_dR} = P|_{B_dR}, (P_L)_{L'} = P_{L'}.
  API modify.pullback (functoriality):
    For T -> S, (P_L)_T = (P_T)_{L_T}; compatible with composition.
  API modify.pushforward (functoriality):
    For rho : G -> H, rho_*(P_L) = (rho_* P)_{rho_* L}.
  API modify_gl (compatibility):
    For G = GL_n, P_L is the bundle glued by RF4:vector-bundles/meromorphic-modification-at-a-
    divisor from P(std) and the lattice L(std).
  API modify.characterisation (characterisation):
    P_L is the unique G-bundle with a modification to P at D whose completion at D is L
    (RF4:G-torsors/tannakian-transfer-of-gluing).
  example modify_gl_compat (compatibility), mathematical contract only:
    For G = GL_n and P trivial, P_L is the rank-n vector bundle obtained by gluing the B^+_dR-
    lattice L in B_dR^n to the trivial bundle off D, as in Caraiani-Scholze 3.5.1.
  example modify_gm_degree (computation), mathematical contract only:
    For G = G_m, S = Spa(C^flat), P trivial and L = xi^k B^+_dR, P_L = O(-k), of degree -k.
  example modify_tautological_eq (degenerate), mathematical contract only:
    For the tautological lattice L = P-hat_D the modification P_L is P, with the identity
    modification.
  example modify_SL2_nonlattice (non-example), mathematical contract only:
    For G = SL_2 and P trivial, the B^+_dR-lattice xi B^+_dR (+) B^+_dR of B_dR^2 has determinant
    lattice xi B^+_dR, so it is not an SL_2(B^+_dR)-lattice of the trivial SL_2-torsor and does not
    define an SL_2-modification, although it defines a GL_2-modification.
-/

end TauCeti

end RF4
