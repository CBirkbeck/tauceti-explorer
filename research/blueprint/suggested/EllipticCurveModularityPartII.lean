/-
This file is not the roadmap and is not exhaustive. The definitive roadmap is
research/blueprint/readmes/EllipticCurveModularityPartII.md. These signatures
suggest Lean forms so contributors and reviewers converge on names and types.
They claim no implementation; every planned proof is sorry and all packet nodes
remain unchecked. Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.

Imported numerical and representation interfaces below belong to their named
suppliers. They are typed data, never Prop-valued fields standing for conclusions.
The EC.6 geometric theorems whose Cartan compactifications or local hypotheses
cannot yet be faithfully stated are documented by node name below, without
fabricating their predicates. Their mathematical statements are in the packet.
-/
import Mathlib.AlgebraicGeometry.EllipticCurve.LFunction
import Mathlib.Analysis.SpecialFunctions.Pow.Real
import Mathlib.FieldTheory.AbsoluteGaloisGroup
import Mathlib.NumberTheory.NumberField.Basic
import Mathlib.LinearAlgebra.Matrix.GeneralLinearGroup.Defs
import Mathlib.NumberTheory.Padics.PadicVal.Basic
import Mathlib.RepresentationTheory.Irreducible
import Mathlib.RingTheory.Ideal.Norm.AbsNorm
import Mathlib.RingTheory.Norm.Transitivity
import TauCeti.AlgebraicGeometry.EllipticCurve.Isogeny.Hom.Add
import TauCeti.NumberTheory.ModularForms.Newforms.Newform

set_option autoImplicit false
noncomputable section
open scoped Classical
open HeckeRing.GL2 (Newform)
open NumberField
namespace TauCeti.EllipticCurve.EffectiveModularity

/-! Imported notation: Γ₀ index and trivial-character newspace. These are
baseline expressions, not new definitions owned by this continuation. -/
abbrev mu (N : ℕ) : ℝ := (CongruenceSubgroup.Gamma0 N).index
abbrev gplus (N : ℕ+) : ℕ :=
  Module.finrank ℂ ((TauCeti.cuspFormsNew (N : ℕ) 2) ⊓
    cuspFormCharSpace (N := (N : ℕ)) 2 (1 : (ZMod (N : ℕ))ˣ →* ℂˣ))
abbrev coeff {N : ℕ} [NeZero N] (f : Newform N 2) (n : ℕ) : ℂ :=
  (UpperHalfPlane.qExpansion 1 f.toCuspForm).coeff n

/-- EC.1/krausF. Real division, the square root, and the doubled dimension. -/
def krausF (N : ℕ+) : ℝ := (Real.sqrt (mu N / 6) + 1) ^ (2 * gplus N)
/-- EC.1/krausG. Full lcm level, not its radical. -/
def krausG (N : ℕ+) : ℝ := (Real.sqrt (mu (Nat.lcm 4 N) / 6) + 1) ^ 2
/-- EC.1/krausH. Both cutoffs are retained. -/
def krausH (N : ℕ+) : ℝ := max (krausF N) (krausG N)

theorem krausF_eq (N : ℕ+) :
    krausF N = (Real.sqrt (mu N / 6) + 1) ^ (2 * gplus N) := by sorry
theorem one_le_krausF (N : ℕ+) : 1 ≤ krausF N := by sorry
theorem krausF_eq_one_of_dim_zero (N : ℕ+) (h : gplus N = 0) :
    krausF N = 1 := by sorry
theorem krausG_eq (N : ℕ+) :
    krausG N = (Real.sqrt (mu (Nat.lcm 4 N) / 6) + 1) ^ 2 := by sorry
theorem one_le_krausG (N : ℕ+) : 1 ≤ krausG N := by sorry
theorem krausG_eq_of_lcm_eq (N M : ℕ+) (h : Nat.lcm 4 N = Nat.lcm 4 M) :
    krausG N = krausG M := by sorry
theorem krausF_le_krausH (N : ℕ+) : krausF N ≤ krausH N := by sorry
theorem krausG_le_krausH (N : ℕ+) : krausG N ≤ krausH N := by sorry
theorem krausH_lt_iff (N : ℕ+) (x : ℝ) :
    krausH N < x ↔ krausF N < x ∧ krausG N < x := by sorry

-- krausF_one
example : krausF 1 = 1 := by sorry
-- krausF_eleven
example : krausF 11 = (Real.sqrt 2 + 1) ^ 2 := by sorry
-- krausF_thirtyfive
example : krausF 35 = (Real.sqrt 8 + 1) ^ 6 := by sorry
-- krausG_one
example : krausG 1 = 4 := by sorry
-- krausG_two
example : krausG 2 = 4 := by sorry
-- krausG_eleven
example : krausG 11 = (Real.sqrt 12 + 1) ^ 2 := by sorry
-- krausH_one
example : krausH 1 = 4 := by sorry
-- krausH_two
example : krausH 2 = 4 := by sorry
-- krausH_not_F_eleven
example : krausF 11 < krausH 11 := by sorry

/-- EC.1/martin-bound: sharp inequality and equality classification. -/
theorem martin_bound (N : ℕ+) :
    12 * gplus N ≤ (N : ℕ) + 1 ∧
    (12 * gplus N = (N : ℕ) + 1 ↔
      (N : ℕ) = 35 ∨ ((N : ℕ).Prime ∧ (N : ℕ) % 12 = 11)) := by sorry

/-- EC.2/norm-bound. All embeddings and nonzero norm are essential. -/
theorem norm_bound (K : Type*) [Field K] [NumberField K]
    (x : 𝓞 K) (lam : Ideal (𝓞 K)) [lam.IsPrime]
    (ell : ℕ) (hell : ell.Prime) (hlam : (ell : 𝓞 K) ∈ lam)
    (hx : x ∈ lam) (hne : x ≠ 0) (B : ℝ) (hB : 0 ≤ B)
    (hemb : ∀ s : K →ₐ[ℚ] ℂ, ‖s (x : K)‖ ≤ B) :
    (ell : ℝ) ≤ |(Algebra.norm ℤ x : ℝ)| ∧
      |(Algebra.norm ℤ x : ℝ)| ≤ B ^ Module.finrank ℚ K := by sorry

/-! R01.6 and R20.6 imported interfaces. No local conductor or modularity
carrier is owned here; replace these typed adapters with the supplier exports. -/
abbrev GQ := Field.absoluteGaloisGroup ℚ
abbrev GeometricPoints (E : WeierstrassCurve ℚ) :=
  (E.baseChange (AlgebraicClosure ℚ)).toAffine.Point
abbrev FullRationalTwo (E : WeierstrassCurve ℚ) [E.IsElliptic] : Prop :=
  Nat.card {P : E.toAffine.Point // (2 : ℕ) • P = 0} = 4
abbrev RationalTwoPoint (E : WeierstrassCurve ℚ) [E.IsElliptic] : Prop :=
  ∃ P : E.toAffine.Point, P ≠ 0 ∧ (2 : ℕ) • P = 0
abbrev GeometricEnd (E : WeierstrassCurve ℚ) :=
  TauCeti.Isogeny.Hom (E.baseChange (AlgebraicClosure ℚ)).toAffine
    (E.baseChange (AlgebraicClosure ℚ)).toAffine
/-- EllipticCurves Layer 1: every geometric endomorphism is integer multiplication. -/
abbrev NonCM (E : WeierstrassCurve ℚ) [E.IsElliptic] : Prop :=
  ∀ f : GeometricEnd E, ∃ n : ℤ, f = n • (1 : GeometricEnd E)
/-- Parent R29.1 notation, using the actual point action. -/
abbrev RationalCyclic (E : WeierstrassCurve ℚ) [E.IsElliptic] (n : ℕ) : Prop :=
  ∃ C : AddSubgroup (GeometricPoints E), IsAddCyclic C ∧ Finite C ∧
    Nat.card C = n ∧ ∀ s : GQ,
      C.map (WeierstrassCurve.Affine.Point.map (W' := E.toAffine) s.toAlgHom) = C

namespace Imported
/-- R01.6: the geometric p-torsion carrier; actual points, not free data. -/
abbrev Torsion (E : WeierstrassCurve ℚ) [E.IsElliptic] (p : ℕ) :=
  {P : GeometricPoints E // p • P = 0}
instance (E : WeierstrassCurve ℚ) [E.IsElliptic] (p : ℕ) : AddCommGroup (Torsion E p) := by sorry
instance (E : WeierstrassCurve ℚ) [E.IsElliptic] (p : ℕ) : Module (ZMod p) (Torsion E p) := by sorry
/-- R01.6: induced continuous point action. -/
def residualRep (E : WeierstrassCurve ℚ) [E.IsElliptic] (p : ℕ) :
    Representation (ZMod p) GQ (Torsion E p) := by sorry
/-- R01.6: after choosing a basis of the two-dimensional torsion module. -/
def residualMatrix (E : WeierstrassCurve ℚ) [E.IsElliptic] (p : ℕ) [Fact p.Prime] :
    GQ →* GL (Fin 2) (ZMod p) := by sorry
/-- R01.6: positive Artin conductor of E. -/
def conductor (E : WeierstrassCurve ℚ) [E.IsElliptic] : ℕ+ := by sorry
/-- R01.6: prime-to-p residual conductor, not R20.6's quotient level. -/
def residualConductor (E : WeierstrassCurve ℚ) [E.IsElliptic] (p : ℕ) : ℕ+ := by sorry
/-- R15.4: source-scoped Serre weight of the residual representation. -/
def serreWeight (E : WeierstrassCurve ℚ) [E.IsElliptic] (p : ℕ) : ℕ := by sorry
/-- R20.6/reduced-level-of-elliptic-curve. -/
def reducedLevel (E : WeierstrassCurve ℚ) [E.IsElliptic] (p : ℕ) : ℕ+ := by sorry
/-- EllipticCurves Layer 4.5a: minimal discriminant over Q. -/
def minimalDiscriminant (E : WeierstrassCurve ℚ) [E.IsElliptic] : ℤ := by sorry
/-- R01.4: a representative normalizer of a nonsplit Cartan. -/
def nonsplitNormalizer (p : ℕ) : Subgroup (GL (Fin 2) (ZMod p)) := by sorry
end Imported
open Imported
abbrev ResiduallyIsomorphic (E F : WeierstrassCurve ℚ) [E.IsElliptic] [F.IsElliptic] (p : ℕ) : Prop :=
  Nonempty ((residualRep E p).Equiv (residualRep F p))
abbrev IntoNonsplit (E : WeierstrassCurve ℚ) [E.IsElliptic] (p : ℕ) [Fact p.Prime] : Prop :=
  ∃ g : GL (Fin 2) (ZMod p), ∀ s : GQ,
    g * residualMatrix E p s * g⁻¹ ∈ nonsplitNormalizer p

/-- EC.2/removed-prime-bound. Reduced level and discriminant adapter are imported. -/
theorem removed_prime_bound (E : WeierstrassCurve ℚ) [E.IsElliptic]
    (ell p : ℕ) [Fact ell.Prime] [Fact p.Prime] (hell : 3 ≤ ell)
    (hirr : (residualRep E ell).IsIrreducible) (hne : p ≠ ell)
    (hM : p ∣ (conductor E : ℕ)) (hM2 : ¬p ^ 2 ∣ (conductor E : ℕ))
    (hdisc : ell ∣ padicValNat p (minimalDiscriminant E).natAbs) :
    (ell : ℝ) ≤ Real.rpow (Real.sqrt p + 1)
      (((reducedLevel E ell : ℕ) + 1 : ℝ) / 6) := by sorry

/-- EC.3/finite-rationality: includes coefficients at bad primes. -/
theorem finite_rationality (N : ℕ+) (f : Newform N 2) (hchar : f.χ = 1)
    (hsmall : ∀ q : ℕ, q.Prime → (q : ℝ) ≤ mu N / 6 →
      ∃ a : ℤ, coeff f q = a) : ∀ n : ℕ, ∃ a : ℤ, coeff f n = a := by sorry

/-- EC.3/small-prime-integrality. The exact residual-newform isomorphism
requires extension of E[ell] to the residue field. It cannot yet be stated with
this uncompleted supplier adapter, so this theorem is not seeded. Its proof and
full hypotheses are definitive in the packet. Likewise EC.3/rational-newform-curve
needs the modular-quotient/Tate-module comparison to state residual realization.
Their names are small_prime_integrality and rational_newform_curve. -/

/-- EC.3/kraus-rational. -/
theorem kraus_rational (E : WeierstrassCurve ℚ) [E.IsElliptic]
    (ell : ℕ) [Fact ell.Prime] (hell : 5 ≤ ell)
    (hirr : (residualRep E ell).IsIrreducible) (hw : serreWeight E ell = 2)
    (hbound : krausF (residualConductor E ell) < ell) :
    ∃ (F : WeierstrassCurve ℚ) (hF : F.IsElliptic),
      letI := hF
      conductor F = residualConductor E ell ∧ ResiduallyIsomorphic E F ell := by sorry

/-- EC.4/finite-mod-four. E.LFunction supplies the actual good-prime coefficient. -/
theorem finite_mod_four (E : WeierstrassCurve ℚ) [E.IsElliptic] :
    (∀ q : ℕ, q.Prime → ¬q ∣ 2 * (conductor E : ℕ) →
      (q : ℝ) ≤ mu (Nat.lcm 4 (conductor E)) / 6 →
      (4 : ℤ) ∣ (q : ℤ) + 1 - E.LFunction q) ↔
    (∀ q : ℕ, q.Prime → ¬q ∣ 2 * (conductor E : ℕ) →
      (4 : ℤ) ∣ (q : ℤ) + 1 - E.LFunction q) := by sorry

/-- EC.4/small-trace-transfer. -/
theorem small_trace_transfer (E F : WeierstrassCurve ℚ) [E.IsElliptic] [F.IsElliptic]
    (ell : ℕ) [Fact ell.Prime] (hell : 5 ≤ ell) (hfull : FullRationalTwo E)
    (hirr : (residualRep E ell).IsIrreducible) (hw : serreWeight E ell = 2)
    (hN : conductor F = residualConductor E ell) (hiso : ResiduallyIsomorphic E F ell)
    (hbound : krausG (conductor F) < ell)
    (q : ℕ) (hq : q.Prime) (hgood : ¬q ∣ 2 * (conductor F : ℕ))
    (hsmall : (q : ℝ) ≤ mu (Nat.lcm 4 (conductor F)) / 6) :
    ¬q ∣ (conductor E : ℕ) ∧ E.LFunction q = F.LFunction q ∧
      (4 : ℤ) ∣ (q : ℤ) + 1 - F.LFunction q := by sorry

/-- EC.4/two-isogeny-repair. The seed states the resulting curve and odd
residual comparison. The degree-one-or-two isogeny is specified in the packet. -/
theorem two_isogeny_repair (E : WeierstrassCurve ℚ) [E.IsElliptic]
    (hcounts : ∀ᶠ q : ℕ in Filter.atTop, q.Prime → ¬q ∣ 2 * (conductor E : ℕ) →
      (4 : ℤ) ∣ (q : ℤ) + 1 - E.LFunction q)
    (ell : ℕ) [Fact ell.Prime] (hodd : ell ≠ 2) :
    ∃ (F : WeierstrassCurve ℚ) (hF : F.IsElliptic),
      letI := hF
      FullRationalTwo F ∧ conductor F = conductor E ∧ ResiduallyIsomorphic E F ell := by sorry

/-- EC.4/kraus-full-two. -/
theorem kraus_full_two (E : WeierstrassCurve ℚ) [E.IsElliptic]
    (ell : ℕ) [Fact ell.Prime] (hell : 5 ≤ ell) (hfull : FullRationalTwo E)
    (hirr : (residualRep E ell).IsIrreducible) (hw : serreWeight E ell = 2)
    (hbound : krausH (residualConductor E ell) < ell) :
    ∃ (F : WeierstrassCurve ℚ) (hF : F.IsElliptic),
      letI := hF
      conductor F = residualConductor E ell ∧ FullRationalTwo F ∧
        ResiduallyIsomorphic E F ell := by sorry

/-- EC.4/quotient-conductor-adapter: the local weight hypothesis remains explicit. -/
theorem quotient_conductor_adapter (E : WeierstrassCurve ℚ) [E.IsElliptic]
    (ell : ℕ) [Fact ell.Prime] (hell : 5 ≤ ell)
    (hgood : ¬ell ∣ (conductor E : ℕ)) :
    residualConductor E ell = reducedLevel E ell := by sorry

/-- EC.5/mazur-prime-isogenies. -/
theorem mazur_prime_isogenies (E : WeierstrassCurve ℚ) [E.IsElliptic]
    (r : ℕ) (hr : r.Prime) (hC : RationalCyclic E r) :
    r ∈ ({2,3,5,7,11,13,17,19,37,43,67,163} : Finset ℕ) := by sorry
/-- The non-CM part of the same packet node. -/
theorem mazur_prime_isogenies_nonCM (E : WeierstrassCurve ℚ) [E.IsElliptic]
    (hcm : NonCM E) (r : ℕ) (hr : r.Prime) (hC : RationalCyclic E r) :
    r ∈ ({2,3,5,7,11,13,17,37} : Finset ℕ) := by sorry
/-- EC.5/two-torsion-isogeny-exclusions. -/
theorem two_torsion_isogeny_exclusions (E : WeierstrassCurve ℚ) [E.IsElliptic]
    (ell : ℕ) (hell : ell.Prime) :
    (11 ≤ ell → ¬RationalCyclic E (2 * ell)) ∧
      (7 ≤ ell → ¬RationalCyclic E (4 * ell)) := by sorry
/-- EC.5/two-torsion-kernel-transport, one-point clause. The full-two clause
needs a quotient isogeny interface and is recorded in the packet. -/
theorem two_torsion_kernel_transport (E : WeierstrassCurve ℚ) [E.IsElliptic]
    (ell : ℕ) (hell : ell.Prime) (hodd : ell ≠ 2)
    (h2 : RationalTwoPoint E) (hC : RationalCyclic E ell) :
    RationalCyclic E (2 * ell) := by sorry
/-- EC.5/irreducible-full-two. Absolute irreducibility is the R01.4 export. -/
theorem irreducible_full_two (E : WeierstrassCurve ℚ) [E.IsElliptic]
    (ell : ℕ) [Fact ell.Prime] (hell : 7 ≤ ell) (h2 : FullRationalTwo E) :
    (residualRep E ell).IsIrreducible := by sorry
/-- EC.5/irreducible-one-two. -/
theorem irreducible_one_two (E : WeierstrassCurve ℚ) [E.IsElliptic]
    (ell : ℕ) [Fact ell.Prime] (hell : 11 ≤ ell) (h2 : RationalTwoPoint E) :
    (residualRep E ell).IsIrreducible := by sorry

/-- EC.6/nonsplit-potential-good. j-integrality is equivalent to potentially
good reduction by the local elliptic supplier; the seed uses the actual denominator. -/
theorem nonsplit_potential_good (E : WeierstrassCurve ℚ) [E.IsElliptic]
    (p : ℕ) [Fact p.Prime] (hp : 5 ≤ p) (hns : IntoNonsplit E p) :
    ¬p ∣ E.j.den ∧ ∀ q : ℕ, q.Prime → q % p ≠ 1 → q % p ≠ p - 1 → ¬q ∣ E.j.den := by sorry

/-! EC.6/chen-correspondence (chen_correspondence), EC.6/rank-zero-quotient
(rank_zero_quotient), EC.6/cuspidal-formal-immersion (cuspidal_formal_immersion)
and EC.6/j-prime-integrality (j_prime_integrality) are not seeded: the Cartan-level
compactification, the correct connected p-new quotient, and the integral local
hypotheses are source gaps. No theorem is encoded as an arbitrary Prop field. -/

/-- EC.6/j-integrality. -/
theorem j_integrality (E : WeierstrassCurve ℚ) [E.IsElliptic]
    (hcm : NonCM E) (r p : ℕ) [Fact p.Prime]
    (hr : r ∈ ({2,3,5,7,13} : Finset ℕ)) (hp : p ∉ ({2,3,5,7,13} : Finset ℕ))
    (hC : RationalCyclic E r) (hns : IntoNonsplit E p) :
    ∃ a : ℤ, (a : ℚ) = E.j := by sorry

/-- EC.6/integral-isogeny-j-values: modular j-map identification is a supplier
certificate. This seed isolates the exact rational-polynomial divisibility step. -/
theorem integral_isogeny_j_values (f : Polynomial ℤ) (hf : f.Monic)
    (hdeg : 2 ≤ f.natDegree) (t : ℚ) (ht : t ≠ 0)
    (hint : ∃ a : ℤ, Polynomial.eval t (f.map (Int.castRingHom ℚ)) / t = a) :
    ∃ a : ℤ, t = a ∧ a ≠ 0 ∧ a ∣ f.coeff 0 := by sorry

/-- EC.6/large-proper-image. -/
theorem large_proper_image (E : WeierstrassCurve ℚ) [E.IsElliptic]
    (hcm : NonCM E) (p : ℕ) [Fact p.Prime] (hp : 37 < p)
    (hproper : ¬Function.Surjective (residualMatrix E p)) : IntoNonsplit E p := by sorry

/-! EC.6/surjectivity-twist (surjectivity_twist) needs the supplier's quadratic
character/torsion matrix comparison. EC.6/finite-image-certificates
(finite_image_certificates) needs the finite datasets and complete arithmetic
certificates. Their signatures are omitted instead of assuming these outputs. -/

/-- EC.6/lemos-surjectivity. The geometric non-CM hypothesis is retained. -/
theorem lemos_surjectivity (E : WeierstrassCurve ℚ) [E.IsElliptic]
    (hcm : NonCM E) (hC : ∃ n : ℕ, 1 < n ∧ RationalCyclic E n)
    (p : ℕ) [Fact p.Prime] (hp : 37 < p) :
    Function.Surjective (residualMatrix E p) := by sorry

end TauCeti.EllipticCurve.EffectiveModularity
