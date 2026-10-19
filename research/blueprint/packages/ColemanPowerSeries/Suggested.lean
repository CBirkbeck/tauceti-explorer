import Mathlib
import TauCeti.RingTheory.Norm.Units
import TauCeti.RingTheory.MvPowerSeries.Substitution

/-!
# ColemanPowerSeries: representative target signatures

The roadmap is README.md. This file records light definitions, theorem signatures
and examples that can be stated against the pinned Mathlib and Tau Ceti APIs; it
is not exhaustive. It distinguishes coefficient-fixed cyclotomic substitution
from coefficient Frobenius, the base-valued determinant norm from its embedded
root product, and actual arithmetic norm limits from power-series fixed units.
The arithmetic interpolation milestone exposes its relative integral basis and
convergent evaluations. Heavy constructions and their APIs remain README targets.
-/

namespace TauCetiRoadmap.ColemanPowerSeries

noncomputable section
set_option autoImplicit false
open scoped BigOperators PowerSeries.WithPiTopology Topology

/-! ## Layer 0: cyclotomic arithmetic towers -/

namespace Unramified

/-- The coefficient-field cyclotomic level inside the chosen ambient field. -/
def coefficientLevel (E Ω : Type) [Field E] [Field Ω] [Algebra E Ω]
    (z : ℕ → Ω) (n : ℕ) : IntermediateField E Ω :=
  IntermediateField.adjoin E {z n}

/-- Compatible roots give inclusions of the actual intermediate fields (Layer 0). -/
theorem coefficientLevel_le_succ (p : ℕ) (E Ω : Type) [Field E] [Field Ω]
    [Algebra E Ω] (z : ℕ → Ω) (hz : ∀ n, z (n+1)^p=z n) (n : ℕ) :
    coefficientLevel E Ω z n ≤ coefficientLevel E Ω z (n+1) := sorry

example (E Ω : Type) [Field E] [Field Ω] [Algebra E Ω] (z : ℕ → Ω) :
    coefficientLevel E Ω z 0 = IntermediateField.adjoin E {z 0} := rfl
example (E Ω : Type) [Field E] [Field Ω] [Algebra E Ω] (z : ℕ → Ω)
    (hz : z 0 = -1) : coefficientLevel E Ω z 0 = ⊥ := sorry

end Unramified

/-! ## Layer 1: determinant operators and twisted interpolation -/

namespace UnramifiedSeries

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
    Y[O] ^p-1 := sorry
example (p : ℕ) (c : O) :
    @algebraMap B[O] B[O] _ _ ΦAlg[p,O] (PowerSeries.C c) = PowerSeries.C c := sorry
example : @algebraMap (PowerSeries ℤ_[3]) (PowerSeries ℤ_[3]) _ _
    (scalarAlgebra ℤ_[3] 3) PowerSeries.X ≠ PowerSeries.X := sorry
example : norm ℤ_[3] 3 (1 + PowerSeries.X) = 1 + PowerSeries.X := sorry
example : norm ℤ_[2] 2 (1 + PowerSeries.X) = -(1 + PowerSeries.X) := sorry
example : trace ℤ_[3] 3 (1 : PowerSeries ℤ_[3]) = 3 := sorry
example : trace ℤ_[3] 3 (1 + PowerSeries.X) = 0 := sorry
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

example (p : ℕ) [Fact p.Prime] (O : Type) [CommRing O] [Algebra ℤ_[p] O]
    (σ : O ≃ₐ[ℤ_[p]] O) : correctedNorm p O σ 1 = 1 := sorry
example (p : ℕ) [Fact p.Prime] (O : Type) [CommRing O] [Algebra ℤ_[p] O]
    (σ : O ≃ₐ[ℤ_[p]] O) (u : B[O]ˣ) :
    u ∈ fixedUnits p O σ ↔ correctedNorm p O σ u = u := sorry
example : (1 : (PowerSeries ℤ_[3])ˣ) ∈ fixedUnits 3 ℤ_[3] (AlgEquiv.refl) := sorry

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

/-- The rank-p cyclotomic expansion has unique coordinates. -/
theorem coordinates_injective : Function.Injective
    (fun a : Fin p → B[O] => ∑ i : Fin p, Y[O] ^i.val * Φ[p,O] (a i)) := sorry
/-- Every integral series admits cyclotomic coordinates. -/
theorem coordinates_surjective : Function.Surjective
    (fun a : Fin p → B[O] => ∑ i : Fin p, Y[O] ^i.val * Φ[p,O] (a i)) := sorry

/-- The base-valued norms of both Y and X retain the sign at p=2. -/
theorem norm_Y : norm O p Y[O] = (-1 : B[O])^(p-1)*Y[O] ∧
    norm O p PowerSeries.X = (-1 : B[O])^(p-1)*PowerSeries.X := sorry

/-- The integral trace of Y^m is p times the bounded averaging operator. -/
theorem trace_powers (m : ℕ) : trace O p (Y[O] ^m) =
    if p ∣ m then (p : B[O]) * Y[O] ^(m/p) else 0 := sorry

include hσ in
/-- The determinant norm reduces to arithmetic p-Frobenius on coefficients. -/
theorem norm_residue_frobenius (f : B[O]) :
    norm O p f - Σ[σ] f ∈ Ideal.span {(p : B[O])} := sorry

/-- Taking the norm gains one digit on principal p-power congruences. -/
theorem norm_near_one_gain (r : ℕ) (hr : 1 ≤ r) (f : B[O]) :
    norm O p (1+(p : B[O])^r*f)-1 ∈ Ideal.span {(p : B[O])}^(r+1) := sorry

include hσ hσc hσic in
/-- Corrected norm iterates agree modulo p^(b+1) after b steps. -/
theorem iteration_precision (a b : ℕ) (hab : b ≤ a) (f : B[O]ˣ) :
    (((correctedNorm p O σ)^[a]) f : B[O]) -
      (((correctedNorm p O σ)^[b]) f : B[O]) ∈ Ideal.span {(p : B[O])}^(b+1) := sorry

include hσ hσc hσic in
/-- Corrected iterates converge to a unique N=Sigma fixed unit. -/
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
/-- Only after coefficient extension and convergent translation does Phi(Nf) become a root product. -/
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

/-- Arithmetic interpolation with the positive coefficient-Frobenius twist. The relative integral basis, field degrees, polynomial unit lifts and nonzero preparation are inputs; norm/evaluation compatibility is a conclusion used in the proof. -/
theorem interpolation_existence (u : units) :
    (∃! f : B[O]ˣ, ∀ n : ℕ, εu[n] f = (σu[n] ^[n]) (u.1 n)) ∧
    (∀ f : B[O]ˣ, (∀ n : ℕ, εu[n] f = (σu[n] ^[n]) (u.1 n)) → f ∈ Fix) := sorry

end Arithmetic
end UnramifiedSeries

/-! ## Layer 2: logarithmic derivative and arithmetic measures -/

namespace Series

/-- The logarithmic derivative in the multiplicative coordinate Y=1+X. -/
def logDeriv {R : Type} [CommRing R] (f : (PowerSeries R)ˣ) : PowerSeries R :=
  (1 + PowerSeries.X) * PowerSeries.derivative R (f : PowerSeries R) *
    ((f⁻¹ : (PowerSeries R)ˣ) : PowerSeries R)

section LogarithmicDerivative
variable {R : Type} [CommRing R]

/-- The weighted formal logarithmic derivative turns products into sums over any commutative ring. -/
theorem logDeriv_mul (f g : (PowerSeries R)ˣ) :
    logDeriv (f*g) = logDeriv f + logDeriv g := sorry

example : logDeriv (1 : (PowerSeries R)ˣ) = 0 := sorry
example (u : Rˣ) : logDeriv (Units.map PowerSeries.C.toMonoidHom u) = 0 := sorry
example (f : (PowerSeries R)ˣ) (hf : (f : PowerSeries R)=1+PowerSeries.X) :
    logDeriv f=1 := sorry
end LogarithmicDerivative

/-! ## Layer 3: the fixed-space boundary

The continuous PMIA operator is characterized independently of determinant trace.
-/
section Boundary
variable (p : ℕ) [Fact p.Prime]
variable (ψ : PowerSeries ℤ_[p] →ₗ[ℤ_[p]] PowerSeries ℤ_[p])
    (hψc : Continuous ψ)
    (hψ : ∀ m : ℕ, ψ ((1+PowerSeries.X)^m) =
      if p ∣ m then (1+PowerSeries.X)^(m/p) else 0)
include hψc hψ

/-- The only obstruction to F-phi(F)=g in the fixed submodule is the constant coefficient of g. -/
theorem psiFixedBoundary_range (g : PowerSeries ℤ_[p]) (hg : ψ g=0) :
    (∃ f : PowerSeries ℤ_[p], ψ f=f ∧
      f - @algebraMap (PowerSeries ℤ_[p]) (PowerSeries ℤ_[p]) _ _
        (UnramifiedSeries.scalarAlgebra ℤ_[p] p) f = g) ↔
      PowerSeries.constantCoeff g=0 := sorry
end Boundary


end Series

/-! ## Layer 4: local cyclotomic closures and the real quotient -/

namespace Arithmetic

section PrincipalClosure
variable (p : ℕ) [Fact p.Prime]
variable (M : Type) [AddCommGroup M] [TopologicalSpace M] [IsTopologicalAddGroup M]
    [T2Space M] [Module ℤ_[p] M] [ContinuousSMul ℤ_[p] M]

/-- For the arithmetic application in Layer 4, finite integer spans have the same closure as finite p-adic spans. -/
theorem principal_closure_eq_span (r : ℕ) (g : Fin r → M) :
    closure (Set.range (fun a : Fin r → ℤ => ∑ i, a i • g i)) =
      Set.range (fun a : Fin r → ℤ_[p] => ∑ i, a i • g i) := sorry

example (r : ℕ) :
    closure (Set.range (fun a : Fin r → ℤ => ∑ i, a i • (0 : ℤ_[p]))) = {0} := sorry
example : closure (Set.range (fun a : ℤ => a • (1 : ℤ_[p]))) = Set.univ := sorry
end PrincipalClosure

end Arithmetic

/-
The remaining constructions are specified in README.md:
  Unramified.coefficientRelativeIntegralBasis
  UnramifiedSeries.coefficientPsi
  Arithmetic.plusColemanAlgebraEquiv
  Series.cyclotomicSeriesUnit
  Series.phiScalarAlgebra
  Series.phiAssemble
  Series.phiBasis
  Series.colemanNorm
  Series.colemanTrace
  Series.normFixedUnits
  Series.normLimitSeries
  Series.normFixedLogDeriv
  Series.frobeniusSum
  Series.psiFixedBoundary
  Arithmetic.roots
  Arithmetic.level
  Arithmetic.relativeBasis
  Arithmetic.integralZeta
  Arithmetic.integralBasis
  Arithmetic.reduction
  Arithmetic.differenceQuotientEquiv
  Arithmetic.residueFieldEquiv
  Arithmetic.seriesEvaluation
  Arithmetic.integralNorm
  Arithmetic.unitsNorm
  Arithmetic.normCompatibleUnits
  Arithmetic.normLimitResidue
  Arithmetic.principalNormCompatibleUnits
  Arithmetic.normFixedEvaluation
  Arithmetic.colemanEquiv
  Arithmetic.cyclotomicTower
  Arithmetic.rawColeman
  Arithmetic.colemanMap
  Arithmetic.binomialNormFixed
  Arithmetic.tateTower
  Arithmetic.cyclotomicMoment
  Arithmetic.teichTower
  Arithmetic.unitSplit
  Arithmetic.finiteAction
  Arithmetic.towerAction
  Arithmetic.principalModule
  Arithmetic.principalCompletedModule
  Arithmetic.principalColeman
  Arithmetic.globalLocalEmbedding
  Arithmetic.globalLocalUnits
  Arithmetic.realLocalUnits
  Arithmetic.localCyclotomicUnits
  Arithmetic.realLocalCyclotomicUnits
  Arithmetic.principalLocalCyclotomicUnits
  Arithmetic.principalRealLocalCyclotomicUnits
  Arithmetic.realCyclotomicTower
  Arithmetic.adjustedRealTower
  Arithmetic.principalCyclotomicLimit
  Arithmetic.realPrincipalCyclotomicLimit
  Arithmetic.realPrincipalUnitQuotient
  Unramified.baseIntegerEquiv
  Unramified.basePrincipalEquiv
  Unramified.coefficientIntegralBasis
  Unramified.coefficientResidueEquiv
  Unramified.coefficientUnitNorm
  Unramified.coefficientFrobenius
  Unramified.coefficientCyclotomicAction
  Unramified.coefficientUnitLimit
  Unramified.coefficientPrincipalLimit
  Unramified.coefficientTeichSection
  Unramified.coefficientUnitSplit
  Unramified.coefficientLimitActions
  Unramified.signedTateRoot
  Unramified.signedTateTower
  Unramified.semilocalLevel
  Unramified.semilocalUnitLimit
  Unramified.semilocalShuffle
  Unramified.semilocalFrobenius
  Unramified.semilocalPermutationAction
  Unramified.semilocalUnitSplit
  Unramified.semilocalPrincipalLimit
  Unramified.semilocalCoefficientTransport
  Unramified.semilocalNorm
  UnramifiedSeries.basis
  UnramifiedSeries.normLimit
  UnramifiedSeries.twistedEvaluation
  UnramifiedSeries.colemanEquiv
-/

end

end TauCetiRoadmap.ColemanPowerSeries
