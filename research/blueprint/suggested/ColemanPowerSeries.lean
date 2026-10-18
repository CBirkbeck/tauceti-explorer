/-
This file is not the roadmap and is not exhaustive. The roadmap document is
definitive. These signatures and examples suggest Lean forms so contributors
can converge on names and statements. Light definitions have real bodies. Proofs are
placeholders; no formalisation of the roadmap is claimed. Heavy constructions
and their full APIs and checks are specified in the roadmap document.
-/
import Mathlib.NumberTheory.Padics.PadicIntegers
import Mathlib.RingTheory.PowerSeries.Evaluation
import Mathlib.RingTheory.PowerSeries.Substitution
import Mathlib.RingTheory.PowerSeries.Derivative
import Mathlib.RingTheory.PowerSeries.Inverse
import Mathlib.RingTheory.PowerSeries.Expand
import Mathlib.RingTheory.PowerSeries.WeierstrassPreparation
import Mathlib.Topology.Algebra.Nonarchimedean.AdicTopology
import Mathlib.RingTheory.DiscreteValuationRing.Basic
import Mathlib.RingTheory.Norm.Basic
import Mathlib.RingTheory.Trace.Basic
import Mathlib.LinearAlgebra.Vandermonde
import Mathlib.RingTheory.RootsOfUnity.PrimitiveRoots
import Mathlib.FieldTheory.IsAlgClosed.AlgebraicClosure
import Mathlib.FieldTheory.IntermediateField.Adjoin.Defs
import Mathlib.RingTheory.Localization.FractionRing
import Mathlib.RingTheory.Localization.Integral
import Mathlib.Algebra.Group.Subgroup.Ker
import Mathlib.RingTheory.LocalRing.ResidueField.Basic
import Mathlib.Topology.Algebra.Group.Subgroup
import Mathlib.Topology.Homeomorph.Lemmas
import TauCeti.RingTheory.Norm.Units
import TauCeti.RingTheory.MvPowerSeries.Substitution

noncomputable section
set_option autoImplicit false
open scoped BigOperators PowerSeries.WithPiTopology Topology

namespace ColemanUnramified

/-- The coefficient-field cyclotomic level inside the chosen ambient field. -/
def coefficientLevel (E Ω : Type) [Field E] [Field Ω] [Algebra E Ω]
    (z : ℕ → Ω) (n : ℕ) : IntermediateField E Ω :=
  IntermediateField.adjoin E {z n}

theorem coefficientLevel_le_succ (p : ℕ) (E Ω : Type) [Field E] [Field Ω]
    [Algebra E Ω] (z : ℕ → Ω) (hz : ∀ n, z (n+1)^p=z n) (n : ℕ) :
    coefficientLevel E Ω z n ≤ coefficientLevel E Ω z (n+1) := sorry

example (E Ω : Type) [Field E] [Field Ω] [Algebra E Ω] (z : ℕ → Ω) :
    coefficientLevel E Ω z 0 = IntermediateField.adjoin E {z 0} := rfl
example (E Ω : Type) [Field E] [Field Ω] [Algebra E Ω] (z : ℕ → Ω)
    (hz : z 0 = -1) : coefficientLevel E Ω z 0 = ⊥ := sorry

end ColemanUnramified

namespace TauCetiRoadmap.ColemanUnramified

local notation "B[" O "]" => PowerSeries O
local notation "Y[" O "]" => (1 + PowerSeries.X : PowerSeries O)
set_option quotPrecheck false in
local notation "Φ[" p "," O "]" => RingHom.toMonoidHom
  (AlgHom.toRingHom (PowerSeries.substAlgHom
    (PowerSeries.HasSubst.of_constantCoeff_zero' (by simp :
      PowerSeries.constantCoeff (Y[O] ^ p - 1) = 0))))
local notation "Σ[" σ "]" => PowerSeries.map (AlgHom.toRingHom (AlgEquiv.toAlgHom σ))

section ScalarAlgebra
variable (O : Type) [CommRing O]

/-- Scalars act by substitution by (1+X)^p-1. -/
@[instance_reducible]
def scalarAlgebra (p : ℕ) : Algebra B[O] B[O] :=
  (PowerSeries.substAlgHom
    (PowerSeries.HasSubst.of_constantCoeff_zero' (by simp :
      PowerSeries.constantCoeff (Y[O] ^ p - 1) = 0))).toRingHom.toAlgebra

local notation "ΦAlg[" p "," O "]" => scalarAlgebra O p
local notation "ΦMod[" p "," O "]" =>
  @Algebra.toModule B[O] B[O] _ _ (scalarAlgebra O p)

/-- Base-valued determinant norm for the substitution algebra. -/
def norm (p : ℕ) : B[O] →* B[O] :=
  @Algebra.norm B[O] B[O] _ _ ΦAlg[p,O]

/-- Base-valued trace for the same algebra. -/
def trace (p : ℕ) : @LinearMap B[O] B[O] _ _ (RingHom.id B[O]) B[O] B[O]
    _ _ ΦMod[p,O] (inferInstance : Module B[O] B[O]) :=
  @Algebra.trace B[O] B[O] _ _ ΦAlg[p,O]

example (p : ℕ) : @algebraMap B[O] B[O] _ _ ΦAlg[p,O] PowerSeries.X =
    Y[O]^p-1 := sorry
example (p : ℕ) (c : O) :
    @algebraMap B[O] B[O] _ _ ΦAlg[p,O] (PowerSeries.C c) = PowerSeries.C c := sorry
example : @algebraMap (PowerSeries ℤ_[3]) (PowerSeries ℤ_[3]) _ _
    (scalarAlgebra ℤ_[3] 3) PowerSeries.X ≠ PowerSeries.X := sorry
end ScalarAlgebra

local notation "ΦAlg[" p "," O "]" => scalarAlgebra O p
local notation "ΦMod[" p "," O "]" => @Algebra.toModule B[O] B[O] _ _ (scalarAlgebra O p)

/-- Coefficient Frobenius is undone after taking the norm. -/
def correctedNorm (p : ℕ) [Fact p.Prime] (O : Type) [CommRing O]
    [Algebra ℤ_[p] O] (σ : O ≃ₐ[ℤ_[p]] O) : B[O]ˣ →* B[O]ˣ :=
  (Units.map (Σ[σ.symm]).toMonoidHom).comp (Units.map (norm O p))

/-- The native unit subgroup cut out by N(f)=Σ(f). -/
def fixedUnits (p : ℕ) [Fact p.Prime] (O : Type) [CommRing O]
    [Algebra ℤ_[p] O] (σ : O ≃ₐ[ℤ_[p]] O) : Subgroup B[O]ˣ :=
  MonoidHom.eqLocus (Units.map (norm O p)) (Units.map (Σ[σ]).toMonoidHom)

section Coefficients
variable (p : ℕ) [Fact p.Prime]
variable (O : Type) [CommRing O] [IsDomain O] [Algebra ℤ_[p] O]
variable [hFree : Module.Free ℤ_[p] O] [hFinite : Module.Finite ℤ_[p] O]
variable [hComplete : IsAdicComplete (Ideal.span {(p : O)}) O]
variable [hDVR : IsDiscreteValuationRing O]
variable [UniformSpace O] [hUniform : IsUniformAddGroup O] [hRing : IsTopologicalRing O]
variable [hLinear : IsLinearTopology O O] [hTopComplete : CompleteSpace O]
    [hT2 : T2Space O] [hCompact : CompactSpace O]
variable (hO : IsLocalRing.maximalIdeal O = Ideal.span {(p : O)})
variable (hAdic : IsAdic (Ideal.span {(p : O)}))
variable (σ : O ≃ₐ[ℤ_[p]] O)
variable (hσ : ∀ c : O, IsLocalRing.residue O (σ c) = IsLocalRing.residue O c ^ p)
variable (hσc : Continuous σ) (hσic : Continuous σ.symm)
include hFree hFinite hComplete hO hAdic hDVR hUniform hRing hLinear hTopComplete hT2 hCompact

theorem coordinates_injective : Function.Injective
    (fun a : Fin p → B[O] => ∑ i : Fin p, Y[O]^i.val * Φ[p,O] (a i)) := sorry
theorem coordinates_surjective : Function.Surjective
    (fun a : Fin p → B[O] => ∑ i : Fin p, Y[O]^i.val * Φ[p,O] (a i)) := sorry

theorem norm_Y : norm O p Y[O] = (-1 : B[O])^(p-1)*Y[O] ∧
    norm O p PowerSeries.X = (-1 : B[O])^(p-1)*PowerSeries.X := sorry

theorem trace_powers (m : ℕ) : trace O p (Y[O]^m) =
    if p ∣ m then (p : B[O]) * Y[O]^(m/p) else 0 := sorry

include hσ in
theorem norm_residue_frobenius (f : B[O]) :
    norm O p f - Σ[σ] f ∈ Ideal.span {(p : B[O])} := sorry

theorem norm_near_one_gain (r : ℕ) (hr : 1 ≤ r) (f : B[O]) :
    norm O p (1+(p : B[O])^r*f)-1 ∈ Ideal.span {(p : B[O])}^(r+1) := sorry

include hσ hσc hσic in
theorem iteration_precision (a b : ℕ) (hab : b ≤ a) (f : B[O]ˣ) :
    (((correctedNorm p O σ)^[a]) f : B[O]) -
      (((correctedNorm p O σ)^[b]) f : B[O]) ∈ Ideal.span {(p : B[O])}^(b+1) := sorry

include hσ hσc hσic in
theorem normLimit_tendsto (f : B[O]ˣ) :
    ∃! g : B[O]ˣ, g ∈ fixedUnits p O σ ∧
      Filter.Tendsto (fun r : ℕ => ((correctedNorm p O σ)^[r]) f)
        Filter.atTop (𝓝 g) := sorry

end Coefficients

section RootProduct
variable (p : ℕ) [Fact p.Prime] (O : Type) [CommRing O] [IsDomain O]
variable [Algebra ℤ_[p] O] [hFreeRoot : Module.Free ℤ_[p] O] [hFiniteRoot : Module.Finite ℤ_[p] O]
variable [hCompleteRoot : IsAdicComplete (Ideal.span {(p : O)}) O]
variable [UniformSpace O] [IsUniformAddGroup O] [IsTopologicalRing O]
variable [IsLinearTopology O O]
variable (S : Type) [CommRing S] [IsDomain S] [UniformSpace S]
variable [IsUniformAddGroup S] [IsTopologicalRing S] [IsLinearTopology S S]
variable [CompleteSpace S] [T2Space S] [IsDiscreteValuationRing S]
variable (ρ : O →+* S) (hρ : Function.Injective ρ) (ξ : S)
variable (hξ : IsPrimitiveRoot ξ p)
local instance : TopologicalSpace B[S] := (inferInstance : UniformSpace B[S]).toTopologicalSpace
variable (hCρ : Continuous (PowerSeries.C.comp ρ : O → B[S]))
variable (ht : ∀ i : Fin p, PowerSeries.HasEval (PowerSeries.C (ξ^i.val)*Y[S]-1))
include hρ hξ hFreeRoot hFiniteRoot hCompleteRoot
theorem norm_root_product (f : B[O]) :
    PowerSeries.map ρ (Φ[p,O] (norm O p f)) =
      ∏ i : Fin p, PowerSeries.eval₂Hom (φ := PowerSeries.C.comp ρ)
        (a := PowerSeries.C (ξ^i.val)*Y[S]-1) hCρ (ht i) f := sorry
end RootProduct

local notation "K[" levels "," n "]" => levels n
local notation "A[" rings "," n "]" => rings n
set_option quotPrecheck false in
local notation "U[" rings "," stepAlgebra "]" => (⨅ n : ℕ,
  MonoidHom.eqLocus
    (MonoidHom.comp (@TauCeti.Algebra.normUnits (A[rings,n]) _ (A[rings,n+1]) _ (stepAlgebra n))
      (Pi.evalMonoidHom (fun n : ℕ => (A[rings,n])ˣ) (n+1)))
    (Pi.evalMonoidHom (fun n : ℕ => (A[rings,n])ˣ) n) :
  Subgroup (∀ n : ℕ, (A[rings,n])ˣ))

section Arithmetic
variable (p : ℕ) [Fact p.Prime] (O : Type) [CommRing O] [IsDomain O]
    [Algebra ℤ_[p] O] [hOFree : Module.Free ℤ_[p] O] [hOFinite : Module.Finite ℤ_[p] O]
    [hOComplete : IsAdicComplete (Ideal.span {(p : O)}) O] [hODVR : IsDiscreteValuationRing O]
    [UniformSpace O] [hOUniform : IsUniformAddGroup O] [hORing : IsTopologicalRing O]
    [hOLinear : IsLinearTopology O O] [hOTopComplete : CompleteSpace O]
    [hOT2 : T2Space O] [hOCompact : CompactSpace O]
    (σ : O ≃ₐ[ℤ_[p]] O) (z : ℕ → AlgebraicClosure (FractionRing O))
    (levels : ℕ → IntermediateField (FractionRing O) (AlgebraicClosure (FractionRing O)))
    (rings : ∀ n : ℕ, Subalgebra O (levels n))
    [∀ n : ℕ, WithIdeal (A[rings,n])]
    [∀ n : ℕ, CompleteSpace (A[rings,n])] [∀ n : ℕ, T2Space (A[rings,n])]
    (stepAlgebra : ∀ n : ℕ, Algebra (A[rings,n]) (A[rings,n+1]))
    (units : Subgroup (∀ n : ℕ, (A[rings,n])ˣ))
    [hLevelFree : ∀ n : ℕ, @Module.Free (A[rings,n]) (A[rings,n+1]) _ _
      (@Algebra.toModule (A[rings,n]) (A[rings,n+1]) _ _ (stepAlgebra n))]
    [hLevelFinite : ∀ n : ℕ, @Module.Finite (A[rings,n]) (A[rings,n+1]) _ _
      (@Algebra.toModule (A[rings,n]) (A[rings,n+1]) _ _ (stepAlgebra n))]
    (π : ∀ n : ℕ, A[rings,n])
    (hc : ∀ n : ℕ, Continuous (algebraMap O (A[rings,n]) : O → A[rings,n]))
    (hπ : ∀ n : ℕ, PowerSeries.HasEval (π n))
    (σn : ∀ n : ℕ, A[rings,n] ≃+* A[rings,n])
    (ε : ∀ n : ℕ, B[O] →+* A[rings,n])
variable (hlevels : ∀ n : ℕ, levels n = IntermediateField.adjoin (FractionRing O) {z n})
    (hrings : ∀ n : ℕ, rings n = integralClosure O (levels n))
    (hUnits : units=U[rings,stepAlgebra])
    (hε : ∀ n : ℕ, ε n = PowerSeries.eval₂Hom
      (φ := algebraMap O (A[rings,n])) (a := π n) (hc n) (hπ n))
    (hO : IsLocalRing.maximalIdeal O = Ideal.span {(p : O)})
    (hAdic : IsAdic (Ideal.span {(p : O)}))
    (hσ : ∀ c : O, IsLocalRing.residue O (σ c) = IsLocalRing.residue O c ^ p)
    (hσc : Continuous σ) (hσic : Continuous σ.symm)
    (hz : ∀ n : ℕ, IsPrimitiveRoot (z n) (p^(n+1)))
    (hzstep : ∀ n : ℕ, z (n+1)^p = z n)
    (hπroot : ∀ n : ℕ, ((π n : K[levels,n]) : AlgebraicClosure (FractionRing O)) = z n-1)
    (hstep : ∀ (n : ℕ) (a : A[rings,n]),
      ((@algebraMap (A[rings,n]) (A[rings,n+1]) _ _ (stepAlgebra n) a : K[levels,n+1]) :
        AlgebraicClosure (FractionRing O)) = (a : K[levels,n]))
    (hAnAdic : ∀ n : ℕ, IsAdic (Ideal.span {(p : A[rings,n])}))
    (relativeBasis : ∀ n : ℕ, @Module.Basis (Fin p) (A[rings,n]) (A[rings,n+1]) _ _
      (@Algebra.toModule (A[rings,n]) (A[rings,n+1]) _ _ (stepAlgebra n)))
    (hrelativeBasis : ∀ (n : ℕ) (i : Fin p), relativeBasis n i = (1+π (n+1))^i.val)
    (hdegree : ∀ n : ℕ, (minpoly (FractionRing O) (π n : K[levels,n])).natDegree = p^n*(p-1))
    (hσcoeff : ∀ (n : ℕ) (c : O), σn n (algebraMap O (A[rings,n]) c) =
      algebraMap O (A[rings,n]) (σ c))
    (hσroot : ∀ n : ℕ, σn n (π n) = π n)
    (hσnc : ∀ n : ℕ, Continuous (σn n))
    (hσnic : ∀ n : ℕ, Continuous (σn n).symm)
    (hσnorm : ∀ (n : ℕ) (a : A[rings,n+1]),
      @Algebra.norm (A[rings,n]) (A[rings,n+1]) _ _ (stepAlgebra n) (σn (n+1) a) = σn n (@Algebra.norm (A[rings,n]) (A[rings,n+1]) _ _ (stepAlgebra n) a))
    (hpolyLift : ∀ (n : ℕ) (u : (A[rings,n])ˣ), ∃ g : Polynomial O,
      IsUnit g.toPowerSeries ∧
      PowerSeries.eval₂Hom (φ := algebraMap O (A[rings,n])) (a := π n)
        (hc n) (hπ n) g.toPowerSeries = (u : A[rings,n]))
    (hWPT : ∀ f : B[O], f ≠ 0 → ∃ (μ : ℕ) (P : Polynomial O) (v : B[O]ˣ),
      P.Monic ∧ f = PowerSeries.C ((p : O)^μ) * P.toPowerSeries * (v : B[O]))
include hOFree hOFinite hOComplete hODVR hOUniform hORing hOLinear hOTopComplete hOT2 hOCompact hLevelFree hLevelFinite
include hlevels hrings hUnits hε hO hAdic hσ hσc hσic hz hzstep hπroot hstep hAnAdic relativeBasis hrelativeBasis hdegree hσcoeff hσroot hσnc hσnic hσnorm hpolyLift hWPT
local notation "Fix" => fixedUnits p O σ
local notation "M" => correctedNorm p O σ
local notation "ε[" n "]" => ε n
set_option quotPrecheck false in
local notation "εu[" n "]" => Units.map (ε[n]).toMonoidHom
set_option quotPrecheck false in
local notation "σu[" n "]" => Units.map (σn n).toMonoidHom
set_option quotPrecheck false in
local notation "σiu[" n "]" => Units.map (σn n).symm.toMonoidHom
local notation "ν[" n "]" => @TauCeti.Algebra.normUnits (A[rings,n]) _ (A[rings,n+1]) _ (stepAlgebra n)

theorem interpolation_existence (u : units) :
    (∃! f : B[O]ˣ, ∀ n : ℕ, εu[n] f = (σu[n]^[n]) (u.1 n)) ∧
    (∀ f : B[O]ˣ, (∀ n : ℕ, εu[n] f = (σu[n]^[n]) (u.1 n)) → f ∈ Fix) := sorry

end Arithmetic
end TauCetiRoadmap.ColemanUnramified

namespace TauCetiRoadmap.Campaign.ColemanPowerSeries

/-- The logarithmic derivative in the multiplicative coordinate Y=1+X. -/
def logDeriv {R : Type} [CommRing R] (f : (PowerSeries R)ˣ) : PowerSeries R :=
  (1 + PowerSeries.X) * PowerSeries.derivative R (f : PowerSeries R) *
    ((f⁻¹ : (PowerSeries R)ˣ) : PowerSeries R)

section LogarithmicDerivative
variable {R : Type} [CommRing R]

theorem logDeriv_mul (f g : (PowerSeries R)ˣ) :
    logDeriv (f*g) = logDeriv f + logDeriv g := sorry

example : logDeriv (1 : (PowerSeries R)ˣ) = 0 := sorry
example (u : Rˣ) : logDeriv (Units.map PowerSeries.C.toMonoidHom u) = 0 := sorry
example (f : (PowerSeries R)ˣ) (hf : (f : PowerSeries R)=1+PowerSeries.X) :
    logDeriv f=1 := sorry
end LogarithmicDerivative

/- The PMIA operator is supplied by its native continuous linear map and its
polynomial characterization. It is independent of the determinant trace. -/
section Boundary
variable (p : ℕ) [Fact p.Prime]
variable (ψ : PowerSeries ℤ_[p] →ₗ[ℤ_[p]] PowerSeries ℤ_[p])
    (hψc : Continuous ψ)
    (hψ : ∀ m : ℕ, ψ ((1+PowerSeries.X)^m) =
      if p ∣ m then (1+PowerSeries.X)^(m/p) else 0)
include hψc hψ

theorem psiFixedBoundary_range (g : PowerSeries ℤ_[p]) (hg : ψ g=0) :
    (∃ f : PowerSeries ℤ_[p], ψ f=f ∧
      f - @algebraMap (PowerSeries ℤ_[p]) (PowerSeries ℤ_[p]) _ _
        (TauCetiRoadmap.ColemanUnramified.scalarAlgebra ℤ_[p] p) f = g) ↔
      PowerSeries.constantCoeff g=0 := sorry
end Boundary

/- A finite-level closure milestone for a finite family in a p-adic module. The
arithmetic reader applies it to the actual local principal-unit module. -/
end TauCetiRoadmap.Campaign.ColemanPowerSeries

namespace ColemanCyclotomic

section PrincipalClosure
variable (p : ℕ) [Fact p.Prime]
variable (M : Type) [AddCommGroup M] [TopologicalSpace M] [IsTopologicalAddGroup M]
    [T2Space M] [Module ℤ_[p] M] [ContinuousSMul ℤ_[p] M]

theorem principal_closure_eq_span (r : ℕ) (g : Fin r → M) :
    closure (Set.range (fun a : Fin r → ℤ => ∑ i, a i • g i)) =
      Set.range (fun a : Fin r → ℤ_[p] => ∑ i, a i • g i) := sorry

example (r : ℕ) :
    closure (Set.range (fun a : Fin r → ℤ => ∑ i, a i • (0 : ℤ_[p]))) = {0} := sorry
example : closure (Set.range (fun a : ℤ => a • (1 : ℤ_[p]))) = Set.univ := sorry
end PrincipalClosure

end ColemanCyclotomic

/-
Further constructions are specified in full in the roadmap document. They are
README targets, rather than placeholder data definitions at the library pins:
  TauCetiRoadmap.Campaign.ColemanPowerSeries.cyclotomicSeriesUnit
  TauCetiRoadmap.Campaign.ColemanPowerSeries.phiScalarAlgebra
  TauCetiRoadmap.Campaign.ColemanPowerSeries.phiAssemble
  TauCetiRoadmap.Campaign.ColemanPowerSeries.phiBasis
  TauCetiRoadmap.Campaign.ColemanPowerSeries.colemanNorm
  TauCetiRoadmap.Campaign.ColemanPowerSeries.colemanTrace
  TauCetiRoadmap.Campaign.ColemanPowerSeries.normFixedUnits
  TauCetiRoadmap.Campaign.ColemanPowerSeries.normLimitSeries
  TauCetiRoadmap.Campaign.ColemanPowerSeries.normFixedLogDeriv
  TauCetiRoadmap.Campaign.ColemanPowerSeries.frobeniusSum
  TauCetiRoadmap.Campaign.ColemanPowerSeries.psiFixedBoundary
  ColemanCyclotomic.roots
  ColemanCyclotomic.level
  ColemanCyclotomic.relativeBasis
  ColemanCyclotomic.integralZeta
  ColemanCyclotomic.integralBasis
  ColemanCyclotomic.reduction
  ColemanCyclotomic.differenceQuotientEquiv
  ColemanCyclotomic.residueFieldEquiv
  ColemanCyclotomic.seriesEvaluation
  ColemanCyclotomic.integralNorm
  ColemanCyclotomic.unitsNorm
  ColemanCyclotomic.normCompatibleUnits
  ColemanCyclotomic.normLimitResidue
  ColemanCyclotomic.principalNormCompatibleUnits
  ColemanCyclotomic.normFixedEvaluation
  ColemanCyclotomic.colemanEquiv
  ColemanCyclotomic.cyclotomicTower
  ColemanCyclotomic.rawColeman
  ColemanCyclotomic.colemanMap
  ColemanCyclotomic.binomialNormFixed
  ColemanCyclotomic.tateTower
  ColemanCyclotomic.cyclotomicMoment
  ColemanCyclotomic.teichTower
  ColemanCyclotomic.unitSplit
  ColemanCyclotomic.finiteAction
  ColemanCyclotomic.towerAction
  ColemanCyclotomic.principalModule
  ColemanCyclotomic.principalCompletedModule
  ColemanCyclotomic.principalColeman
  ColemanCyclotomic.globalLocalEmbedding
  ColemanCyclotomic.globalLocalUnits
  ColemanCyclotomic.realLocalUnits
  ColemanCyclotomic.localCyclotomicUnits
  ColemanCyclotomic.realLocalCyclotomicUnits
  ColemanCyclotomic.principalLocalCyclotomicUnits
  ColemanCyclotomic.principalRealLocalCyclotomicUnits
  ColemanCyclotomic.realCyclotomicTower
  ColemanCyclotomic.adjustedRealTower
  ColemanCyclotomic.principalCyclotomicLimit
  ColemanCyclotomic.realPrincipalCyclotomicLimit
  ColemanCyclotomic.realPrincipalUnitQuotient
  ColemanUnramified.baseIntegerEquiv
  ColemanUnramified.basePrincipalEquiv
  ColemanUnramified.coefficientIntegralBasis
  ColemanUnramified.coefficientResidueEquiv
  ColemanUnramified.coefficientUnitNorm
  ColemanUnramified.coefficientFrobenius
  ColemanUnramified.coefficientCyclotomicAction
  ColemanUnramified.coefficientUnitLimit
  ColemanUnramified.coefficientPrincipalLimit
  ColemanUnramified.coefficientTeichSection
  ColemanUnramified.coefficientUnitSplit
  ColemanUnramified.coefficientLimitActions
  ColemanUnramified.signedTateRoot
  ColemanUnramified.signedTateTower
  ColemanUnramified.semilocalLevel
  ColemanUnramified.semilocalUnitLimit
  ColemanUnramified.semilocalShuffle
  ColemanUnramified.semilocalFrobenius
  ColemanUnramified.semilocalPermutationAction
  ColemanUnramified.semilocalUnitSplit
  ColemanUnramified.semilocalPrincipalLimit
  ColemanUnramified.semilocalCoefficientTransport
  ColemanUnramified.semilocalNorm
  TauCetiRoadmap.ColemanUnramified.basis
  TauCetiRoadmap.ColemanUnramified.normLimit
  TauCetiRoadmap.ColemanUnramified.twistedEvaluation
  TauCetiRoadmap.ColemanUnramified.colemanEquiv
-/
