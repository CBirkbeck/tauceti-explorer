/-
This file is not the roadmap and is not exhaustive. The roadmap document is
definitive. These admitted signatures suggest Lean forms so that contributors
and reviewers converge on names and signatures; they claim no implementation.
-/
import Mathlib.AlgebraicGeometry.EllipticCurve.Affine.Point
import Mathlib.AlgebraicGeometry.EllipticCurve.NormalForms
import Mathlib.AlgebraicGeometry.EllipticCurve.Reduction
import Mathlib.NumberTheory.Padics.PadicVal.Basic
import Mathlib.NumberTheory.Padics.PadicIntegers
import Mathlib.NumberTheory.LegendreSymbol.QuadraticReciprocity
import Mathlib.GroupTheory.FiniteAbelian.Basic
import Mathlib.Tactic.NormNum

import TauCeti.AlgebraicGeometry.EllipticCurve.MordellWeil.XSubT
import TauCeti.AlgebraicGeometry.EllipticCurve.MordellWeil.TwoTorsion
import TauCeti.AlgebraicGeometry.EllipticCurve.Affine.Point.VariableChange
import TauCeti.AlgebraicGeometry.EllipticCurve.QuadraticTwist
import TauCeti.AlgebraicGeometry.EllipticCurve.PointCount
import TauCeti.AlgebraicGeometry.EllipticCurve.Affine.FinitePoint
import Mathlib.RingTheory.Polynomial.Quotient

noncomputable section
namespace WeierstrassCurve
variable {R : Type*} [CommRing R]

def legendre (lam : R) : WeierstrassCurve R := ⟨0, -(1+lam), 0, lam, 0⟩
def scaledLegendre (d lam : R) : WeierstrassCurve R := ⟨0, -d*(1+lam), 0, d^2*lam, 0⟩
lemma legendre_equation (lam x y : R) :
    (legendre lam).toAffine.Equation x y ↔ y^2=x*(x-1)*(x-lam) := by sorry
lemma legendre_map {S : Type*} [CommRing S] (f : R →+* S) (lam : R) :
    (legendre lam).map f=legendre (f lam) := by sorry
lemma legendre_ext (lam μ : R) : legendre lam=legendre μ ↔ lam=μ := by sorry
instance legendre_normalForm (lam : R) : (legendre lam).IsCharNeTwoNF := ⟨rfl,rfl⟩
lemma scaledLegendre_equation (d lam x y : R) :
    (scaledLegendre d lam).toAffine.Equation x y ↔ y^2=x*(x-d)*(x-d*lam) := by sorry
lemma scaledLegendre_one (lam : R) : scaledLegendre 1 lam=legendre lam := by sorry
lemma scaledLegendre_map {S : Type*} [CommRing S] (f : R →+* S) (d lam : R) :
    (scaledLegendre d lam).map f=scaledLegendre (f d) (f lam) := by sorry
instance scaledLegendre_normalForm (d lam : R) : (scaledLegendre d lam).IsCharNeTwoNF := ⟨rfl,rfl⟩
lemma legendre_invariants (lam : R) :
    (legendre lam).Δ=16*lam^2*(1-lam)^2 ∧ (legendre lam).c₄=16*(lam^2-lam+1) := by sorry
lemma scaledLegendre_invariants (d lam : R) :
    (scaledLegendre d lam).Δ=16*d^6*lam^2*(1-lam)^2 ∧
    (scaledLegendre d lam).c₄=16*d^2*(lam^2-lam+1) := by sorry

variable {K : Type*} [Field K] [DecidableEq K]
def legendreParameters (lam : K) : Fin 6 → K :=
  ![lam,1/lam,1-lam,1/(1-lam),lam/(lam-1),(lam-1)/lam]
lemma legendreParameters_apply (lam : K) :
    legendreParameters lam=![lam,1/lam,1-lam,1/(1-lam),lam/(lam-1),(lam-1)/lam] := by sorry
lemma legendreParameters_valid (lam : K) (h0 : lam≠0) (h1 : lam≠1) (j : Fin 6) :
    legendreParameters lam j≠0 ∧ legendreParameters lam j≠1 := by sorry
lemma legendreParameters_inverse_pairs (lam : K) (h0 : lam≠0) (h1 : lam≠1) :
    legendreParameters lam 0 * legendreParameters lam 1=1 ∧
    legendreParameters lam 2 * legendreParameters lam 3=1 ∧
    legendreParameters lam 4 * legendreParameters lam 5=1 := by sorry
lemma legendreParameters_map {L : Type*} [Field L] [DecidableEq L]
    (f : K →+* L) (lam : K) (j : Fin 6) :
    f (legendreParameters lam j)=legendreParameters (f lam) j := by sorry
lemma legendre_isElliptic_iff (lam : K) (h2 : (2:K)≠0) :
    (legendre lam).IsElliptic ↔ lam≠0 ∧ lam≠1 := by sorry
lemma scaledLegendre_isElliptic_iff (d lam : K) (h2 : (2:K)≠0) :
    (scaledLegendre d lam).IsElliptic ↔ d≠0 ∧ lam≠0 ∧ lam≠1 := by sorry
instance scaledLegendre_elliptic (d lam : K) [NeZero (2:K)] [NeZero d]
    [NeZero lam] [NeZero (lam-1)] : (scaledLegendre d lam).IsElliptic := by sorry
instance legendre_elliptic (lam : K) [NeZero (2:K)] [NeZero lam] [NeZero (lam-1)] :
    (legendre lam).IsElliptic := by sorry
-- The generic instance asks for NeZero (lam-1); instance search does not
-- simplify (-1)-1 to -2. This specialization supports the native mu signature.
instance scaledLegendre_minus_one_elliptic [NeZero (2:K)] :
    (scaledLegendre 1 (-1:K)).IsElliptic := by
  apply (scaledLegendre_isElliptic_iff 1 (-1:K) (NeZero.ne 2)).mpr
  refine ⟨by simp, by simp, ?_⟩
  intro h
  apply NeZero.ne (2:K)
  calc
    (2:K) = 1 - (-1) := by ring
    _ = 0 := by rw [h, sub_self]
lemma legendre_j (lam : K) [(legendre lam).IsElliptic] :
    (legendre lam).j=256*(lam^2-lam+1)^3/(lam^2*(1-lam)^2) := by sorry
lemma scaledLegendre_j (d lam : K) [(scaledLegendre d lam).IsElliptic]
    [(legendre lam).IsElliptic] : (scaledLegendre d lam).j=(legendre lam).j := by sorry
lemma legendreParameters_from_roots (e0 e1 e2 : K)
    (h01 : e0≠e1) (h02 : e0≠e2) (h12 : e1≠e2) :
    legendreParameters ((e2-e0)/(e1-e0)) =
      ![(e2-e0)/(e1-e0),(e1-e0)/(e2-e0),(e2-e1)/(e0-e1),
        (e0-e1)/(e2-e1),(e0-e2)/(e1-e2),(e1-e2)/(e0-e2)] := by sorry
lemma scaledLegendre_normalization (W : WeierstrassCurve K) [W.IsCharNeTwoNF]
    (e0 e1 e2 : K) (h01 : e0≠e1) (h02 : e0≠e2) (h12 : e1≠e2)
    (hf : Polynomial.X^3 + Polynomial.C W.a₂*Polynomial.X^2+
      Polynomial.C W.a₄*Polynomial.X+Polynomial.C W.a₆ =
      (Polynomial.X-Polynomial.C e0)*(Polynomial.X-Polynomial.C e1)*
        (Polynomial.X-Polynomial.C e2)) :
    (VariableChange.mk 1 e0 0 0) • W=
      scaledLegendre (e1-e0) ((e2-e0)/(e1-e0)) := by sorry

private def legendreRoot (d lam : K) : Fin 3 → K := ![0,d,d*lam]
lemma exists_scaledLegendre_of_full_two_torsion (E : WeierstrassCurve ℚ) [E.IsElliptic]
    (hfull : Nat.card (nsmulAddMonoidHom (α := E.toAffine.Point) 2).ker=4) :
    ∃ (C : VariableChange ℚ) (d lam : ℚ), d≠0 ∧ lam≠0 ∧ lam≠1 ∧
      C • E=scaledLegendre d lam := by sorry
def scaledLegendreTwoTorsion (d lam : K) (h2 : (2:K)≠0) (hd : d≠0)
    (h0 : lam≠0) (h1 : lam≠1) (j : Fin 3) : (scaledLegendre d lam).toAffine.Point :=
  Affine.Point.some (legendreRoot d lam j) 0 (by sorry)
lemma scaledLegendreTwoTorsion_coordinates (d lam : K) (h2 : (2:K)≠0)
    (hd : d≠0) (h0 : lam≠0) (h1 : lam≠1) (j : Fin 3) :
    scaledLegendreTwoTorsion d lam h2 hd h0 h1 j=
      Affine.Point.some (legendreRoot d lam j) 0 (by sorry) := by sorry
lemma scaledLegendreTwoTorsion_double (d lam : K) (h2 : (2:K)≠0)
    (hd : d≠0) (h0 : lam≠0) (h1 : lam≠1) (j : Fin 3) :
    2 • scaledLegendreTwoTorsion d lam h2 hd h0 h1 j=0 := by sorry
lemma scaledLegendreTwoTorsion_injective (d lam : K) (h2 : (2:K)≠0)
    (hd : d≠0) (h0 : lam≠0) (h1 : lam≠1) :
    Function.Injective (scaledLegendreTwoTorsion d lam h2 hd h0 h1) ∧
    ∀ j, scaledLegendreTwoTorsion d lam h2 hd h0 h1 j≠0 := by sorry
lemma scaledLegendreTwoTorsion_exhausts (d lam : K) (h2 : (2:K)≠0)
    (hd : d≠0) (h0 : lam≠0) (h1 : lam≠1) (P : (scaledLegendre d lam).toAffine.Point) :
    2 • P=0 ↔ P=0 ∨ ∃ j, P=scaledLegendreTwoTorsion d lam h2 hd h0 h1 j := by sorry

lemma legendre_j_valuation (p : ℕ) [Fact p.Prime] (hp : p≠2) (lam : ℚ)
    (h0 : lam≠0) (h1 : lam≠1) :
    let J := 256*(lam^2-lam+1)^3/(lam^2*(1-lam)^2)
    (padicValRat p lam<0 → padicValRat p (1-lam)=padicValRat p lam ∧
      padicValRat p J=2*padicValRat p lam) ∧
    (0<padicValRat p lam → padicValRat p (1-lam)=0 ∧
      padicValRat p J= -2*padicValRat p lam) ∧
    (0<padicValRat p (1-lam) → padicValRat p lam=0 ∧
      padicValRat p J= -2*padicValRat p (1-lam)) ∧
    (0≤padicValRat p J → padicValRat p lam=0 ∧ padicValRat p (1-lam)=0) := by sorry

lemma legendre_units_of_good_reduction (p : ℕ) [Fact p.Prime] (hp : p≠2)
    (d lam : ℚ) (hd : d≠0) (h0 : lam≠0) (h1 : lam≠1)
    (hgood : HasGoodReduction (PadicInt p)
      (((scaledLegendre d lam).map (Rat.castHom (Padic p))).minimal (PadicInt p))) :
    padicValRat p lam=0 ∧ padicValRat p (1-lam)=0 := by sorry
lemma legendre_good_reduction_of_units (p : ℕ) [Fact p.Prime] (hp : p≠2)
    (lam : ℚ) (h0 : lam≠0) (h1 : lam≠1)
    (hu : padicValRat p lam=0) (hv : padicValRat p (1-lam)=0) :
    HasGoodReduction (PadicInt p)
      (((legendre lam).map (Rat.castHom (Padic p))).minimal (PadicInt p)) := by sorry

def twistHalvingPoint (t v i : K) (h2 : (2:K)≠0) (ht : t≠0) (hv : v≠0)
    (hi : i^2= -1) (hc : 2*t^2+2*v^2=1) :
    (scaledLegendre 2 (2*t^2)).toAffine.Point :=
  Affine.Point.some (4*t^2+4*i*t*v) (8*i*t*v*(t+i*v)) (by sorry)
lemma twistHalvingPoint_coordinates (t v i : K) (h2 : (2:K)≠0) (ht : t≠0)
    (hv : v≠0) (hi : i^2= -1) (hc : 2*t^2+2*v^2=1) :
    twistHalvingPoint t v i h2 ht hv hi hc=
      Affine.Point.some (4*t^2+4*i*t*v) (8*i*t*v*(t+i*v)) (by sorry) := by sorry
lemma twistHalvingPoint_double (t v i : K) (h2 : (2:K)≠0) (ht : t≠0)
    (hv : v≠0) (hi : i^2= -1) (hc : 2*t^2+2*v^2=1) :
    2 • twistHalvingPoint t v i h2 ht hv hi hc=
      Affine.Point.some (4*t^2) 0 (by sorry) := by sorry
lemma twistHalvingPoint_order (t v i : K) (h2 : (2:K)≠0) (ht : t≠0)
    (hv : v≠0) (hi : i^2= -1) (hc : 2*t^2+2*v^2=1) :
    addOrderOf (twistHalvingPoint t v i h2 ht hv hi hc)=4 := by sorry
lemma twistHalvingPoint_map {L : Type*} [Field L] [DecidableEq L] [Algebra K L]
    (t v i : K) (h2 : (2:K)≠0) (ht : t≠0) (hv : v≠0)
    (hi : i^2= -1) (hc : 2*t^2+2*v^2=1) :
    let W := (scaledLegendre 2 (2*t^2)).toAffine
    let eK : W.Point ≃+ (W.baseChange K).Point :=
      AddEquiv.cast (M := fun V : Affine K ↦ V.Point) (by sorry)
    let eL : (W.baseChange L).Point ≃+
        (scaledLegendre 2 (2*(algebraMap K L t)^2)).toAffine.Point :=
      AddEquiv.cast (M := fun V : Affine L ↦ V.Point) (by sorry)
    eL (Affine.Point.map (W' := W) (Algebra.ofId K L)
      (eK (twistHalvingPoint t v i h2 ht hv hi hc))) =
        twistHalvingPoint (algebraMap K L t) (algebraMap K L v) (algebraMap K L i)
          (by sorry) (by sorry) (by sorry) (by sorry) (by sorry) := by sorry

def minusOneOrderFour (i : K) (h2 : (2:K)≠0) (hi : i^2= -1) :
    (legendre (-1:K)).toAffine.Point :=
  Affine.Point.some i (1-i) (by sorry)
lemma minusOneOrderFour_coordinates (i : K) (h2 : (2:K)≠0) (hi : i^2= -1) :
    minusOneOrderFour i h2 hi=Affine.Point.some i (1-i) (by sorry) := by sorry
lemma minusOneOrderFour_double (i : K) (h2 : (2:K)≠0) (hi : i^2= -1) :
    2 • minusOneOrderFour i h2 hi=Affine.Point.some 0 0 (by sorry) := by sorry
lemma minusOneOrderFour_order (i : K) (h2 : (2:K)≠0) (hi : i^2= -1) :
    addOrderOf (minusOneOrderFour i h2 hi)=4 := by sorry
lemma legendre_two_by_four_subgroup (p : ℕ) [Fact p.Prime] (hp : p%4=3)
    (η : ZMod p) (h0 : η≠0) (h1 : η≠1) (hm : η≠ -1) :
    ∃ f : (ZMod 2 × ZMod 4) →+ (legendre (η^2)).toAffine.Point,
      Function.Injective f := by sorry
lemma legendre_minus_one_no_order_eight (p : ℕ) [Fact p.Prime] (hp : p%8=5) :
    ∀ P : (legendre (-1:ZMod p)).toAffine.Point, addOrderOf P≠8 := by sorry

/- Definition/construction unit tests, with packet names as labels. -/
-- WeierstrassCurve.legendre_test_minus_one
example : (legendre (-1:ℚ)).a₂=0 ∧ (legendre (-1:ℚ)).a₄= -1 := by sorry
-- WeierstrassCurve.legendre_test_two
example : (legendre (2:ℚ)).Δ=64 := by sorry
-- WeierstrassCurve.legendre_test_half
example : (legendre (1/2:ℚ)).Δ=1 := by sorry
-- WeierstrassCurve.legendre_test_zero
example : ¬(legendre (0:ℚ)).IsElliptic := by sorry
-- WeierstrassCurve.scaledLegendre_test_one
example : scaledLegendre 1 (1/2:ℚ)=legendre (1/2:ℚ) := by sorry
-- WeierstrassCurve.scaledLegendre_test_two_half
example : (scaledLegendre 2 (1/2:ℚ)).a₂= -3 ∧
    (scaledLegendre 2 (1/2:ℚ)).a₄=2 ∧ (scaledLegendre 2 (1/2:ℚ)).Δ=64 := by sorry
-- WeierstrassCurve.scaledLegendre_test_zero
example (lam : R) : scaledLegendre 0 lam=⟨0,0,0,0,0⟩ ∧ (scaledLegendre 0 lam).Δ=0 := by sorry
-- WeierstrassCurve.legendreParameters_test_minus_one
example : legendreParameters (-1:ℚ)=![-1,-1,2,1/2,1/2,2] := by sorry
-- WeierstrassCurve.legendreParameters_test_two
example : legendreParameters (2:ℚ)=![2,1/2,-1,-1,2,1/2] := by sorry
-- WeierstrassCurve.legendreParameters_test_half
example : legendreParameters (1/2:ℚ)=![1/2,2,1/2,2,-1,-1] := by sorry
-- WeierstrassCurve.legendreParameters_test_generic
example : legendreParameters (3:ℚ)=![3,1/3,-2,-1/2,3/2,2/3] := by sorry
-- WeierstrassCurve.scaledLegendreTwoTorsion_test_minus_one
example : ∀ j : Fin 3, scaledLegendreTwoTorsion 1 (-1:ℚ) (by norm_num)
    (by norm_num) (by norm_num) (by norm_num) j=
    Affine.Point.some (![0,1,-1] j) 0 (by sorry) := by sorry
-- WeierstrassCurve.scaledLegendreTwoTorsion_test_two_half
example : ∀ j : Fin 3, scaledLegendreTwoTorsion 2 (1/2:ℚ) (by norm_num)
    (by norm_num) (by norm_num) (by norm_num) j=
    Affine.Point.some (![0,2,1] j) 0 (by sorry) := by sorry
-- WeierstrassCurve.scaledLegendreTwoTorsion_test_sum
example :
    scaledLegendreTwoTorsion 1 (3:ℚ) (by norm_num) (by norm_num) (by norm_num) (by norm_num) 0 +
    scaledLegendreTwoTorsion 1 (3:ℚ) (by norm_num) (by norm_num) (by norm_num) (by norm_num) 1 +
    scaledLegendreTwoTorsion 1 (3:ℚ) (by norm_num) (by norm_num) (by norm_num) (by norm_num) 2 = 0 ∧
    ∀ j, 2 • scaledLegendreTwoTorsion 1 (3:ℚ) (by norm_num) (by norm_num)
      (by norm_num) (by norm_num) j=0 := by sorry
private instance : Fact (Nat.Prime 5) := ⟨by decide⟩
-- WeierstrassCurve.minusOneOrderFour_test_five_i_two
example : minusOneOrderFour (2:ZMod 5) (by decide) (by decide)=
    Affine.Point.some 2 4 (by sorry) := by sorry
-- WeierstrassCurve.minusOneOrderFour_test_five_i_three
example : minusOneOrderFour (3:ZMod 5) (by decide) (by decide)=
    Affine.Point.some 3 3 (by sorry) := by sorry
-- WeierstrassCurve.minusOneOrderFour_test_double
example : 2 • minusOneOrderFour (2:ZMod 5) (by decide) (by decide)=
    Affine.Point.some 0 0 (by sorry) ∧
    2 • minusOneOrderFour (2:ZMod 5) (by decide) (by decide)≠0 := by sorry
-- WeierstrassCurve.twistHalvingPoint_test_five
example : twistHalvingPoint (2:ZMod 5) 2 3 (by decide) (by decide) (by decide)
    (by decide) (by decide)=Affine.Point.some 4 3 (by sorry) := by sorry
-- WeierstrassCurve.twistHalvingPoint_test_other_i
example : twistHalvingPoint (2:ZMod 5) 2 2 (by decide) (by decide) (by decide)
    (by decide) (by decide)=Affine.Point.some 3 4 (by sorry) := by sorry
-- WeierstrassCurve.twistHalvingPoint_test_double
example : 2 • twistHalvingPoint (2:ZMod 5) 2 3 (by decide) (by decide) (by decide)
    (by decide) (by decide)=Affine.Point.some 1 0 (by sorry) := by sorry
-- WeierstrassCurve.twistHalvingPoint_test_printed
example : ¬(scaledLegendre 2 (3:ZMod 5)).toAffine.Equation 4 4 := by sorry
end WeierstrassCurve

/- Native Tau Ceti portion: source-shaped signatures; not elaborated because
no existing compiled Tau Ceti build at f790474 was available for this job.
The Mathlib portion above is elaborated separately at its recorded pin. -/
namespace WeierstrassCurve
open scoped Polynomial
variable {K : Type*} [Field K] [DecidableEq K]
private abbrev Sq (K : Type*) [Field K] :=
  Kˣ ⧸ (powMonoidHom 2 : Kˣ →* Kˣ).range
private abbrev sc (a : K) (ha : a≠0) : Sq K := (Units.mk0 a ha : Sq K)

def scaledLegendreCrt (d lam : K) (h2 : (2:K)≠0) (hd : d≠0)
    (h0 : lam≠0) (h1 : lam≠1) :
    (scaledLegendre d lam).toAffine.A ≃+* K × K × K := by sorry
lemma scaledLegendreCrt_mk (d lam : K) (h2 : (2:K)≠0) (hd : d≠0)
    (h0 : lam≠0) (h1 : lam≠1) (f : K[X]) :
    scaledLegendreCrt d lam h2 hd h0 h1
      (AdjoinRoot.mk (scaledLegendre d lam).toAffine.f f) =
        (f.eval 0,f.eval d,f.eval (d*lam)) := by sorry
lemma scaledLegendreCrt_ext (d lam : K) (h2 : (2:K)≠0) (hd : d≠0)
    (h0 : lam≠0) (h1 : lam≠1) (a b : (scaledLegendre d lam).toAffine.A) :
    a=b ↔
      (scaledLegendreCrt d lam h2 hd h0 h1 a).1=(scaledLegendreCrt d lam h2 hd h0 h1 b).1 ∧
      (scaledLegendreCrt d lam h2 hd h0 h1 a).2.1=(scaledLegendreCrt d lam h2 hd h0 h1 b).2.1 ∧
      (scaledLegendreCrt d lam h2 hd h0 h1 a).2.2=(scaledLegendreCrt d lam h2 hd h0 h1 b).2.2 := by sorry
lemma scaledLegendreCrt_root (d lam : K) (h2 : (2:K)≠0) (hd : d≠0)
    (h0 : lam≠0) (h1 : lam≠1) :
    scaledLegendreCrt d lam h2 hd h0 h1 (AdjoinRoot.root (scaledLegendre d lam).toAffine.f)=
      (0,d,d*lam) := by sorry
lemma scaledLegendreCrt_unit_iff (d lam : K) (h2 : (2:K)≠0) (hd : d≠0)
    (h0 : lam≠0) (h1 : lam≠1) (a : (scaledLegendre d lam).toAffine.A) :
    IsUnit a ↔ (scaledLegendreCrt d lam h2 hd h0 h1 a).1≠0 ∧
      (scaledLegendreCrt d lam h2 hd h0 h1 a).2.1≠0 ∧
      (scaledLegendreCrt d lam h2 hd h0 h1 a).2.2≠0 := by sorry
def scaledLegendreSquareclassEquiv (d lam : K) (h2 : (2:K)≠0) (hd : d≠0)
    (h0 : lam≠0) (h1 : lam≠1) :
    (scaledLegendre d lam).toAffine.M ≃* Sq K × Sq K × Sq K := by sorry
lemma scaledLegendreSquareclassEquiv_unit (d lam : K) (h2 : (2:K)≠0)
    (hd : d≠0) (h0 : lam≠0) (h1 : lam≠1) (u : (scaledLegendre d lam).toAffine.Aˣ) :
    scaledLegendreSquareclassEquiv d lam h2 hd h0 h1 (u : (scaledLegendre d lam).toAffine.M)=
      (sc (scaledLegendreCrt d lam h2 hd h0 h1 u.val).1 (by sorry),
       sc (scaledLegendreCrt d lam h2 hd h0 h1 u.val).2.1 (by sorry),
       sc (scaledLegendreCrt d lam h2 hd h0 h1 u.val).2.2 (by sorry)) := by sorry
lemma scaledLegendreSquareclassEquiv_one (d lam : K) (h2 : (2:K)≠0)
    (hd : d≠0) (h0 : lam≠0) (h1 : lam≠1) :
    scaledLegendreSquareclassEquiv d lam h2 hd h0 h1 1=(1,1,1) := by sorry
lemma scaledLegendreSquareclassEquiv_eq_one (d lam : K) (h2 : (2:K)≠0)
    (hd : d≠0) (h0 : lam≠0) (h1 : lam≠1) (m : (scaledLegendre d lam).toAffine.M) :
    m=1 ↔ (scaledLegendreSquareclassEquiv d lam h2 hd h0 h1 m).1=1 ∧
      (scaledLegendreSquareclassEquiv d lam h2 hd h0 h1 m).2.1=1 ∧
      (scaledLegendreSquareclassEquiv d lam h2 hd h0 h1 m).2.2=1 := by sorry
lemma scaledLegendreSquareclassEquiv_mul (d lam : K) (h2 : (2:K)≠0)
    (hd : d≠0) (h0 : lam≠0) (h1 : lam≠1) (a b : (scaledLegendre d lam).toAffine.M) :
    scaledLegendreSquareclassEquiv d lam h2 hd h0 h1 (a*b)=
      scaledLegendreSquareclassEquiv d lam h2 hd h0 h1 a *
      scaledLegendreSquareclassEquiv d lam h2 hd h0 h1 b := by sorry
lemma scaledLegendre_eq_quadraticTwistOf (d lam : K) (h2 : (2:K)≠0) :
    scaledLegendre d lam=(legendre lam).quadraticTwistOf 0 (-d/4) := by sorry

section NativeDescent
variable (d lam : K) [NeZero (2:K)] [NeZero d] [NeZero lam] [NeZero (lam-1)]
private theorem lam_ne_one : lam≠1 := by
  exact sub_ne_zero.mp (NeZero.ne (lam-1))
lemma scaledLegendre_descent_off_roots (x y : K)
    (hns : (scaledLegendre d lam).toAffine.Nonsingular x y)
    (hx0 : x≠0) (hxd : x≠d) (hxdl : x≠d*lam) :
    scaledLegendreSquareclassEquiv d lam (NeZero.ne 2) (NeZero.ne d)
      (NeZero.ne lam) (lam_ne_one lam)
      (Affine.μ (W := (scaledLegendre d lam).toAffine)
        (Multiplicative.ofAdd (Affine.Point.some x y hns))) =
      (sc x hx0,sc (x-d) (sub_ne_zero.mpr hxd),sc (x-d*lam) (sub_ne_zero.mpr hxdl)) := by sorry
lemma scaledLegendre_descent_at_roots :
    ∀ j : Fin 3,
      let P := scaledLegendreTwoTorsion d lam (NeZero.ne 2) (NeZero.ne d)
        (NeZero.ne lam) (lam_ne_one lam) j
      scaledLegendreSquareclassEquiv d lam (NeZero.ne 2) (NeZero.ne d)
        (NeZero.ne lam) (lam_ne_one lam)
        (Affine.μ (W := (scaledLegendre d lam).toAffine) (Multiplicative.ofAdd P)) =
        ![(sc (d^2*lam) (by sorry),sc (-d) (by sorry),sc (-d*lam) (by sorry)),
          (sc d (by sorry),sc (d^2*(1-lam)) (by sorry),sc (d*(1-lam)) (by sorry)),
          (sc (d*lam) (by sorry),sc (d*(lam-1)) (by sorry),
            sc (d^2*lam*(lam-1)) (by sorry))] j := by sorry
lemma scaledLegendre_descent_product (P : (scaledLegendre d lam).toAffine.Point) :
    let z := scaledLegendreSquareclassEquiv d lam (NeZero.ne 2) (NeZero.ne d)
      (NeZero.ne lam) (lam_ne_one lam)
      (Affine.μ (W := (scaledLegendre d lam).toAffine) (Multiplicative.ofAdd P))
    z.1*z.2.1*z.2.2=1 := by sorry
lemma scaledLegendre_halving_iff_squares (x y : K)
    (hns : (scaledLegendre d lam).toAffine.Nonsingular x y) :
    (∃ Q : (scaledLegendre d lam).toAffine.Point, 2 • Q=Affine.Point.some x y hns) ↔
      IsSquare x ∧ IsSquare (x-d) ∧ IsSquare (x-d*lam) := by sorry
end NativeDescent

lemma minusOneOrderFour_first_descent (i : K) [NeZero (2:K)] (hi : i^2= -1) :
    (scaledLegendreSquareclassEquiv 1 (-1:K) (NeZero.ne 2) (by simp)
      (by simp) (by sorry)
      (Affine.μ (W := (scaledLegendre 1 (-1:K)).toAffine)
        (Multiplicative.ofAdd (by
          simpa only [scaledLegendre_one] using minusOneOrderFour i (NeZero.ne 2) hi)))).1 =
      sc i (by sorry) := by sorry
lemma twistHalvingPoint_third_descent (t v i : K) [NeZero (2:K)]
    [NeZero (2*t^2)] [NeZero (2*t^2-1)]
    (ht : t≠0) (hv : v≠0) (hi : i^2= -1) (hc : 2*t^2+2*v^2=1) :
    (scaledLegendreSquareclassEquiv 2 (2*t^2) (NeZero.ne 2) (NeZero.ne 2)
      (NeZero.ne (2*t^2)) (by sorry)
      (Affine.μ (W := (scaledLegendre 2 (2*t^2)).toAffine)
        (Multiplicative.ofAdd (twistHalvingPoint t v i (NeZero.ne 2) ht hv hi hc)))).2.2 =
      sc (4*i*t*v) (by sorry) := by sorry
lemma legendre_minus_one_point_count_v_two (p : ℕ) [Fact p.Prime] (hp : p%8=5) :
    padicValNat 2 (legendre (-1:ZMod p)).pointCount=3 ∧
      8 ∣ (legendre (-1:ZMod p)).pointCount ∧
      ¬16 ∣ (legendre (-1:ZMod p)).pointCount := by sorry
lemma scaledLegendre_minus_one_trace_zero (p : ℕ) [Fact p.Prime] (hp : p%4=3)
    (u : ZMod p) (hu : u≠0) :
    (scaledLegendre u (-1:ZMod p)).pointCount=p+1 ∧
      (scaledLegendre u (-1:ZMod p)).frobeniusTrace=0 := by sorry
lemma scaledLegendre_frobeniusTrace (p : ℕ) [Fact p.Prime] (hp : p≠2)
    (d lam : ZMod p) (hd : d≠0) (h0 : lam≠0) (h1 : lam≠1) :
    (scaledLegendre d lam).frobeniusTrace =
      quadraticChar (ZMod p) d * (legendre lam).frobeniusTrace := by sorry

-- WeierstrassCurve.scaledLegendreCrt_test_minus_one
example : scaledLegendreCrt 1 (-1:ℚ) (by norm_num) (by norm_num) (by norm_num) (by norm_num)
    (AdjoinRoot.root (scaledLegendre 1 (-1:ℚ)).toAffine.f)=(0,1,-1) := by sorry
-- WeierstrassCurve.scaledLegendreCrt_test_two_half
example : scaledLegendreCrt 2 (1/2:ℚ) (by norm_num) (by norm_num) (by norm_num) (by norm_num)
    (AdjoinRoot.root (scaledLegendre 2 (1/2:ℚ)).toAffine.f)=(0,2,1) := by sorry
-- WeierstrassCurve.scaledLegendreCrt_test_nonunit
example : ¬IsUnit (AdjoinRoot.root (scaledLegendre 1 (3:ℚ)).toAffine.f) := by sorry
-- WeierstrassCurve.scaledLegendreSquareclassEquiv_test_one
example : scaledLegendreSquareclassEquiv 1 (-1:ℚ) (by norm_num) (by norm_num)
    (by norm_num) (by norm_num) 1=(1,1,1) := by sorry
-- WeierstrassCurve.scaledLegendreSquareclassEquiv_test_constant_square
example :
    let u : (scaledLegendre 1 (2:ℚ)).toAffine.Aˣ :=
      (by sorry : IsUnit (algebraMap ℚ (scaledLegendre 1 (2:ℚ)).toAffine.A 4)).unit
    scaledLegendreSquareclassEquiv 1 (2:ℚ) (by norm_num) (by norm_num)
      (by norm_num) (by norm_num) (u : (scaledLegendre 1 (2:ℚ)).toAffine.M)=(1,1,1) := by sorry
-- WeierstrassCurve.scaledLegendreSquareclassEquiv_test_constant_nonsquare
example :
    let u : (scaledLegendre 1 (1/2:ℚ)).toAffine.Aˣ :=
      (by sorry : IsUnit (algebraMap ℚ (scaledLegendre 1 (1/2:ℚ)).toAffine.A 2)).unit
    scaledLegendreSquareclassEquiv 1 (1/2:ℚ) (by norm_num) (by norm_num)
      (by norm_num) (by norm_num) (u : (scaledLegendre 1 (1/2:ℚ)).toAffine.M)=
      (sc 2 (by norm_num),sc 2 (by norm_num),sc 2 (by norm_num)) ∧
      (sc (2:ℚ) (by norm_num))≠1 := by sorry

/- Cannot yet state in native Lean, deliberately omitted:
WeierstrassCurve.legendre_character_odd_support and
WeierstrassCurve.legendre_character_odd_conductor_dvd. CA.1's construction of
the primitive character of a rational squareclass has no implemented native
declaration at the pin; the actual elliptic conductor comparison is requested
from R01.3. These are not replaced by a Prop-valued stand-in or by a definition
of someone else's character/conductor. The exact statements are in LG.1. -/
end WeierstrassCurve
