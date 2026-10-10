/-
This file is not the roadmap and is not exhaustive. The roadmap document is
definitive. These signatures, API lemmas and examples suggest Lean forms so
contributors and reviewers can converge on names and statements. All new
constructions and proofs are placeholders; no implementation is claimed.
-/
import Mathlib.NumberTheory.Padics.PadicIntegers
import Mathlib.RingTheory.PowerSeries.Evaluation
import Mathlib.RingTheory.PowerSeries.Substitution
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
namespace TauCetiRoadmap.ColemanUnramified

/- Parameterized notation expands native expressions. It introduces no carrier
or replacement declaration for the staged arithmetic and measure suppliers. -/
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
@[instance_reducible]
def scalarAlgebra (p : ℕ) : Algebra B[O] B[O] := sorry
local notation "ΦAlg[" p "," O "]" => scalarAlgebra O p
local notation "ΦMod[" p "," O "]" =>
  @Algebra.toModule B[O] B[O] _ _ (scalarAlgebra O p)
lemma scalarAlgebra_map (p : ℕ) (f : B[O]) :
    @algebraMap B[O] B[O] _ _ ΦAlg[p,O] f = Φ[p,O] f := sorry
lemma scalarAlgebra_smul (p : ℕ) (a f : B[O]) :
    @SMul.smul B[O] B[O] (@Algebra.toSMul B[O] B[O] _ _ ΦAlg[p,O]) a f =
      Φ[p,O] a * f := sorry
lemma scalarAlgebra_coefficientMap (p : ℕ) [Fact p.Prime]
    [Algebra ℤ_[p] O] (f : PowerSeries ℤ_[p]) :
    PowerSeries.map (algebraMap ℤ_[p] O) (Φ[p,ℤ_[p]] f) =
      Φ[p,O] (PowerSeries.map (algebraMap ℤ_[p] O) f) := sorry
def norm (p : ℕ) : B[O] →* B[O] := sorry
lemma norm_def (p : ℕ) : norm O p = @Algebra.norm B[O] B[O] _ _ ΦAlg[p,O] := sorry
def trace (p : ℕ) : @LinearMap B[O] B[O] _ _ (RingHom.id B[O]) B[O] B[O]
    _ _ ΦMod[p,O] (inferInstance : Module B[O] B[O]) := sorry
lemma trace_def (p : ℕ) : trace O p = @Algebra.trace B[O] B[O] _ _ ΦAlg[p,O] := sorry

namespace Tests
-- scalar_X
example (p : ℕ) : @algebraMap B[O] B[O] _ _ ΦAlg[p,O] PowerSeries.X = Y[O]^p-1 := sorry
-- scalar_constant
example (p : ℕ) (c : O) :
    @algebraMap B[O] B[O] _ _ ΦAlg[p,O] (PowerSeries.C c) = PowerSeries.C c := sorry
-- scalar_identity: a concrete base coefficient ring avoids degenerate characteristic examples.
example : @algebraMap (PowerSeries ℤ_[3]) (PowerSeries ℤ_[3]) _ _
    (scalarAlgebra ℤ_[3] 3) PowerSeries.X ≠ PowerSeries.X := sorry
-- norm_native
example (p : ℕ) : norm O p = @Algebra.norm B[O] B[O] _ _ ΦAlg[p,O] := sorry
end Tests
end ScalarAlgebra

local notation "ΦAlg[" p "," O "]" => scalarAlgebra O p
local notation "ΦMod[" p "," O "]" => @Algebra.toModule B[O] B[O] _ _ (scalarAlgebra O p)

/- These constructors bind their mathematical hypotheses explicitly. A placeholder
body must not let Lean omit completeness or finite-free arguments. -/
def basis (p : ℕ) [Fact p.Prime] (O : Type) [CommRing O] [IsDomain O]
    [Algebra ℤ_[p] O] [Module.Free ℤ_[p] O] [Module.Finite ℤ_[p] O]
    [IsAdicComplete (Ideal.span {(p : O)}) O] :
    @Module.Basis (Fin p) B[O] B[O] _ _ ΦMod[p,O] := sorry

def correctedNorm (p : ℕ) [Fact p.Prime] (O : Type) [CommRing O]
    [Algebra ℤ_[p] O] (σ : O ≃ₐ[ℤ_[p]] O) : B[O]ˣ →* B[O]ˣ := sorry

def fixedUnits (p : ℕ) [Fact p.Prime] (O : Type) [CommRing O]
    [Algebra ℤ_[p] O] (σ : O ≃ₐ[ℤ_[p]] O) : Subgroup B[O]ˣ := sorry

def normLimit (p : ℕ) [Fact p.Prime] (O : Type) [CommRing O] [IsDomain O]
    [Algebra ℤ_[p] O] [Module.Free ℤ_[p] O] [Module.Finite ℤ_[p] O]
    [IsAdicComplete (Ideal.span {(p : O)}) O] [IsDiscreteValuationRing O]
    [UniformSpace O] [IsUniformAddGroup O] [IsTopologicalRing O]
    [IsLinearTopology O O] [CompleteSpace O] [T2Space O] [CompactSpace O]
    (σ : O ≃ₐ[ℤ_[p]] O)
    (hO : IsLocalRing.maximalIdeal O = Ideal.span {(p : O)})
    (hAdic : IsAdic (Ideal.span {(p : O)}))
    (hσ : ∀ c : O, IsLocalRing.residue O (σ c) = IsLocalRing.residue O c ^ p)
    (hσc : Continuous σ) (hσic : Continuous σ.symm) :
    B[O]ˣ →* fixedUnits p O σ := sorry

section Coefficients
variable (p : ℕ) [Fact p.Prime]
variable (O : Type) [CommRing O] [IsDomain O] [Algebra ℤ_[p] O]
variable [hFree : Module.Free ℤ_[p] O] [hFinite : Module.Finite ℤ_[p] O]
variable [hComplete : IsAdicComplete (Ideal.span {(p : O)}) O]
variable [IsDiscreteValuationRing O]
variable [UniformSpace O] [IsUniformAddGroup O] [IsTopologicalRing O]
variable [IsLinearTopology O O] [CompleteSpace O] [T2Space O] [hCompact : CompactSpace O]
variable (hO : IsLocalRing.maximalIdeal O = Ideal.span {(p : O)})
variable (hAdic : IsAdic (Ideal.span {(p : O)}))
variable (σ : O ≃ₐ[ℤ_[p]] O)
variable (hσ : ∀ c : O, IsLocalRing.residue O (σ c) = IsLocalRing.residue O c ^ p)
variable (hσc : Continuous σ) (hσic : Continuous σ.symm)
include hFree hFinite hComplete hO hAdic

lemma coordinates_injective : Function.Injective
    (fun a : Fin p → B[O] => ∑ i : Fin p, Y[O]^i.val * Φ[p,O] (a i)) := sorry
lemma coordinates_surjective : Function.Surjective
    (fun a : Fin p → B[O] => ∑ i : Fin p, Y[O]^i.val * Φ[p,O] (a i)) := sorry

local notation "basisHere" => basis p O
local notation "coord[" f "," i "]" => (@Module.Basis.repr (Fin p) B[O] B[O] _ _ ΦMod[p,O] (basis p O)) f i
lemma basis_apply (i : Fin p) : basisHere i = Y[O]^i.val := sorry
lemma basis_expansion (f : B[O]) : f = ∑ i : Fin p, Y[O]^i.val * Φ[p,O] (coord[f,i]) := sorry
lemma basis_scalar (a f : B[O]) (i : Fin p) :
    coord[Φ[p,O] a * f,i] = a * coord[f,i] := sorry
lemma basis_rank : @Module.finrank B[O] B[O] _ _ ΦMod[p,O] = p := sorry
lemma coordinates_homeomorphism :
    Continuous (fun a : Fin p → B[O] => ∑ i : Fin p, Y[O]^i.val * Φ[p,O] (a i)) ∧
    Continuous (fun f : B[O] => fun i : Fin p => coord[f,i]) := sorry
lemma norm_matrix (f : B[O]) :
    norm O p f = Matrix.det (@Algebra.leftMulMatrix B[O] B[O] _ _ ΦAlg[p,O] (Fin p) _ _ basisHere f) := sorry
lemma norm_constants (c : O) : norm O p (PowerSeries.C c) = PowerSeries.C (c^p) := sorry
lemma norm_scalar (f : B[O]) : norm O p (Φ[p,O] f) = f^p := sorry
lemma norm_Y : norm O p Y[O] = (-1 : B[O])^(p-1)*Y[O] ∧
    norm O p PowerSeries.X = (-1 : B[O])^(p-1)*PowerSeries.X := sorry
lemma trace_coordinates (f : B[O]) : trace O p f = (p : B[O]) * coord[f,0] := sorry
lemma trace_scalar (a f : B[O]) : trace O p (Φ[p,O] a * f) = a * trace O p f := sorry
lemma trace_powers (m : ℕ) : trace O p (Y[O]^m) =
    if p ∣ m then (p : B[O]) * Y[O]^(m/p) else 0 := sorry

/- ψ is the staged PMIA bounded operator, independently characterized by
continuity and its action on polynomials; it is not defined from the trace. -/
lemma trace_psi (ψ : B[O] →ₗ[O] B[O]) (hψc : Continuous ψ)
    (hψ : ∀ m : ℕ, ψ (Y[O]^m) = if p ∣ m then Y[O]^(m/p) else 0)
    (f : B[O]) : trace O p f = (p : B[O]) * ψ f := sorry
lemma norm_frobenius (f : B[O]) : norm O p (Σ[σ] f) = Σ[σ] (norm O p f) := sorry
lemma phi_reflection (r : ℕ) (f : B[O]) :
    Φ[p,O] f ∈ Ideal.span {(p : B[O])} ^ r ↔ f ∈ Ideal.span {(p : B[O])} ^ r := sorry

include hσ in
lemma norm_residue_frobenius (f : B[O]) :
    norm O p f - Σ[σ] f ∈ Ideal.span {(p : B[O])} := sorry
lemma norm_near_one_gain (r : ℕ) (hr : 1 ≤ r) (f : B[O]) :
    norm O p (1+(p : B[O])^r*f)-1 ∈ Ideal.span {(p : B[O])}^(r+1) := sorry
lemma norm_congruence_gain (r : ℕ) (hr : 1 ≤ r) (f g : B[O]ˣ)
    (hfg : (f : B[O])-(g : B[O]) ∈ Ideal.span {(p : B[O])}^r) :
    norm O p (f : B[O])-norm O p (g : B[O]) ∈ Ideal.span {(p : B[O])}^(r+1) := sorry
lemma norm_preserves_precision (r : ℕ) (f g : B[O])
    (hfg : f-g ∈ Ideal.span {(p : B[O])}^r) :
    norm O p f - norm O p g ∈ Ideal.span {(p : B[O])}^r := sorry
lemma norm_continuous : Continuous (norm O p) ∧ Continuous (trace O p) := sorry

local notation "M" => correctedNorm p O σ
lemma correctedNorm_val (f : B[O]ˣ) : (M f : B[O]) = Σ[σ.symm] (norm O p (f : B[O])) := sorry
lemma correctedNorm_iterate (r : ℕ) (f : B[O]ˣ) :
    ((M^[r]) f : B[O]) = (Σ[σ.symm]^[r]) ((norm O p)^[r] (f : B[O])) := sorry
lemma correctedNorm_fixed (f : B[O]ˣ) : M f = f ↔ norm O p (f : B[O]) = Σ[σ] (f : B[O]) := sorry
include hσc hσic in
-- Independent input to projector fixedness and interpolation compactness.
lemma correctedNorm_continuous : Continuous M := sorry
include hσ in
lemma iteration_precision (a b : ℕ) (hab : b ≤ a) (f : B[O]ˣ) :
    ((M^[a]) f : B[O])-((M^[b]) f : B[O]) ∈ Ideal.span {(p : B[O])}^(b+1) := sorry
include hσ in
lemma iterated_near_one_gain (r m : ℕ) (hr : 1 ≤ r) (f : B[O]ˣ)
    (hf : (f : B[O])-1 ∈ Ideal.span {(p : B[O])}^r) :
    ((norm O p)^[m] (f : B[O]))-1 ∈ Ideal.span {(p : B[O])}^(r+m) ∧
    ((M^[m]) f : B[O])-1 ∈ Ideal.span {(p : B[O])}^(r+m) := sorry

local notation "Fix" => fixedUnits p O σ
lemma mem_fixedUnits (f : B[O]ˣ) : f ∈ Fix ↔ norm O p (f : B[O]) = Σ[σ] (f : B[O]) := sorry
lemma fixedUnits_corrected (f : B[O]ˣ) : f ∈ Fix ↔ M f = f := sorry
lemma fixedUnits_ext (f g : Fix) (hfg : (f.1 : B[O])=(g.1 : B[O])) : f=g := sorry
include hCompact hσc hσic in
lemma unit_space_compact : CompactSpace B[O]ˣ ∧ CompactSpace Fix := sorry

local notation "L" => normLimit p O σ hO hAdic hσ hσc hσic
-- Convergence is in native Units topology: both values and inverse values converge.
lemma normLimit_tendsto (f : B[O]ˣ) :
    Filter.Tendsto (fun r : ℕ => (M^[r]) f) Filter.atTop (𝓝 (L f).1) := sorry
lemma normLimit_precision (f : B[O]ˣ) (r : ℕ) :
    ((L f).1 : B[O])-((M^[r]) f : B[O]) ∈ Ideal.span {(p : B[O])}^(r+1) := sorry
lemma normLimit_retract (f : Fix) : L f.1 = f := sorry
lemma normLimit_continuous : Continuous L := sorry

namespace Tests
-- basis_zero
example (hp : 0 < p) : basisHere ⟨0,hp⟩ = 1 := sorry
-- basis_one_three: specialization of the vector formula at index 1.
example (hp : p=3) (i : Fin p) (hi : i.val=1) : basisHere i = Y[O] := sorry
-- basis_carry
example (i : Fin p) : coord[Y[O]^p,i] = if i.val=0 then Y[O] else 0 := sorry
-- norm_zero
example : norm O p 0 = 0 := sorry
-- norm_constant
example : norm O p (PowerSeries.C (1+p : O)) = PowerSeries.C ((1+p : O)^p) := sorry
-- trace_zero
example : trace O p 0 = 0 := sorry
-- trace_one
example : trace O p 1 = (p : B[O]) := sorry
-- trace_Yp
example : trace O p (Y[O]^p) = (p : B[O])*Y[O] ∧
    trace O p (Y[O]^p) ≠ (p : B[O])*Y[O]^p := sorry
-- corrected_one
example : M 1 = 1 := sorry
-- corrected_teichmuller
example (c : Oˣ) (hc : σ (c : O)=(c : O)^p) :
    M (Units.map PowerSeries.C.toMonoidHom c) = Units.map PowerSeries.C.toMonoidHom c := sorry
-- corrected_native
example (f : B[O]ˣ) :
    M f = Units.map (Σ[σ.symm]).toMonoidHom
      (@TauCeti.Algebra.normUnits B[O] _ B[O] _ ΦAlg[p,O] f) := sorry
-- fixed_one
example : (1 : B[O]ˣ) ∈ Fix := sorry
-- fixed_Y
example (y : B[O]ˣ) (hy : (y : B[O])=(-1 : B[O])^(p-1)*Y[O]) : y ∈ Fix := sorry
-- fixed_teichmuller
example (c : Oˣ) (hc : σ (c : O)=(c : O)^p) (hn : (c : O)^p≠c) :
    Units.map PowerSeries.C.toMonoidHom c ∈ Fix ∧
    norm O p (PowerSeries.C (c : O)) ≠ PowerSeries.C (c : O) := sorry
-- limit_one
example : (L 1).1 = 1 := sorry
-- limit_teichmuller
example (c : Oˣ) (hc : σ (c : O)=(c : O)^p) :
    (L (Units.map PowerSeries.C.toMonoidHom c)).1 = Units.map PowerSeries.C.toMonoidHom c := sorry
-- limit_near_one
example (c : Oˣ) (hc : (c : O)=1+p) : (L (Units.map PowerSeries.C.toMonoidHom c)).1=1 := sorry
end Tests
end Coefficients

/- Coleman Theorem 11 in a receiving ring. The translated constant is generally
nonzero: native HasEval, rather than formal HasSubst, licenses this evaluation.
For the determinant comparison, send each multiplication-matrix entry a to
map ρ (Φ a). Evaluation of the basis expansion gives V A = diagonal(e) V,
where V is the Vandermonde matrix at C(ξ^i)Y. Its determinant is nonzero in
S[[T]]; take determinants and cancel there. No fraction-series topology is used. -/
section RootProduct
variable (p : ℕ) [Fact p.Prime] (O : Type) [CommRing O] [IsDomain O]
variable [Algebra ℤ_[p] O] [Module.Free ℤ_[p] O] [Module.Finite ℤ_[p] O]
variable [IsAdicComplete (Ideal.span {(p : O)}) O]
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
include hρ hξ
lemma norm_root_product (f : B[O]) :
    PowerSeries.map ρ (Φ[p,O] (norm O p f)) =
      ∏ i : Fin p, PowerSeries.eval₂Hom (φ := PowerSeries.C.comp ρ)
        (a := PowerSeries.C (ξ^i.val)*Y[S]-1) hCρ (ht i) f := sorry
end RootProduct

/- Native L0 arithmetic carriers: finite intermediate fields inside one algebraic
closure, their actual integral closures, and the relative norm equalizer. -/
local notation "K[" levels "," n "]" => levels n
local notation "A[" rings "," n "]" => rings n
set_option quotPrecheck false in
local notation "U[" rings "," stepAlgebra "]" => (⨅ n : ℕ,
  MonoidHom.eqLocus
    (MonoidHom.comp (@TauCeti.Algebra.normUnits (A[rings,n]) _ (A[rings,n+1]) _ (stepAlgebra n))
      (Pi.evalMonoidHom (fun n : ℕ => (A[rings,n])ˣ) (n+1)))
    (Pi.evalMonoidHom (fun n : ℕ => (A[rings,n])ˣ) n) :
  Subgroup (∀ n : ℕ, (A[rings,n])ˣ))

/- All hypotheses below are characterized supplier data. Neither the L1 norm
square nor interpolation existence is an input. hWPT is the already-owned
complete-DVR factorization, weakened only by forgetting distinguishedness. -/
def twistedEvaluation (p : ℕ) [Fact p.Prime] (O : Type) [CommRing O] [IsDomain O]
    [Algebra ℤ_[p] O] [Module.Free ℤ_[p] O] [Module.Finite ℤ_[p] O]
    [IsAdicComplete (Ideal.span {(p : O)}) O] [IsDiscreteValuationRing O]
    [UniformSpace O] [IsUniformAddGroup O] [IsTopologicalRing O]
    [IsLinearTopology O O] [CompleteSpace O] [T2Space O] [CompactSpace O]
    (σ : O ≃ₐ[ℤ_[p]] O) (z : ℕ → AlgebraicClosure (FractionRing O))
    (levels : ℕ → IntermediateField (FractionRing O) (AlgebraicClosure (FractionRing O)))
    (rings : ∀ n : ℕ, Subalgebra O (levels n))
    [∀ n : ℕ, WithIdeal (A[rings,n])]
    [∀ n : ℕ, CompleteSpace (A[rings,n])] [∀ n : ℕ, T2Space (A[rings,n])]
    (stepAlgebra : ∀ n : ℕ, Algebra (A[rings,n]) (A[rings,n+1]))
    (units : Subgroup (∀ n : ℕ, (A[rings,n])ˣ))
    [∀ n : ℕ, @Module.Free (A[rings,n]) (A[rings,n+1]) _ _
      (@Algebra.toModule (A[rings,n]) (A[rings,n+1]) _ _ (stepAlgebra n))]
    [∀ n : ℕ, @Module.Finite (A[rings,n]) (A[rings,n+1]) _ _
      (@Algebra.toModule (A[rings,n]) (A[rings,n+1]) _ _ (stepAlgebra n))]
    (π : ∀ n : ℕ, A[rings,n])
    (hc : ∀ n : ℕ, Continuous (algebraMap O (A[rings,n]) : O → A[rings,n]))
    (hπ : ∀ n : ℕ, PowerSeries.HasEval (π n))
    (σn : ∀ n : ℕ, A[rings,n] ≃+* A[rings,n])
    (ε : ∀ n : ℕ, B[O] →+* A[rings,n])
    (hlevels : ∀ n : ℕ, levels n = IntermediateField.adjoin (FractionRing O) {z n})
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
      P.Monic ∧ f = PowerSeries.C ((p : O)^μ) * P.toPowerSeries * (v : B[O])) :
    fixedUnits p O σ →* units := sorry

def colemanEquiv (p : ℕ) [Fact p.Prime] (O : Type) [CommRing O] [IsDomain O]
    [Algebra ℤ_[p] O] [Module.Free ℤ_[p] O] [Module.Finite ℤ_[p] O]
    [IsAdicComplete (Ideal.span {(p : O)}) O] [IsDiscreteValuationRing O]
    [UniformSpace O] [IsUniformAddGroup O] [IsTopologicalRing O]
    [IsLinearTopology O O] [CompleteSpace O] [T2Space O] [CompactSpace O]
    (σ : O ≃ₐ[ℤ_[p]] O) (z : ℕ → AlgebraicClosure (FractionRing O))
    (levels : ℕ → IntermediateField (FractionRing O) (AlgebraicClosure (FractionRing O)))
    (rings : ∀ n : ℕ, Subalgebra O (levels n))
    [∀ n : ℕ, WithIdeal (A[rings,n])]
    [∀ n : ℕ, CompleteSpace (A[rings,n])] [∀ n : ℕ, T2Space (A[rings,n])]
    (stepAlgebra : ∀ n : ℕ, Algebra (A[rings,n]) (A[rings,n+1]))
    (units : Subgroup (∀ n : ℕ, (A[rings,n])ˣ))
    [∀ n : ℕ, @Module.Free (A[rings,n]) (A[rings,n+1]) _ _
      (@Algebra.toModule (A[rings,n]) (A[rings,n+1]) _ _ (stepAlgebra n))]
    [∀ n : ℕ, @Module.Finite (A[rings,n]) (A[rings,n+1]) _ _
      (@Algebra.toModule (A[rings,n]) (A[rings,n+1]) _ _ (stepAlgebra n))]
    (π : ∀ n : ℕ, A[rings,n])
    (hc : ∀ n : ℕ, Continuous (algebraMap O (A[rings,n]) : O → A[rings,n]))
    (hπ : ∀ n : ℕ, PowerSeries.HasEval (π n))
    (σn : ∀ n : ℕ, A[rings,n] ≃+* A[rings,n])
    (ε : ∀ n : ℕ, B[O] →+* A[rings,n])
    (hlevels : ∀ n : ℕ, levels n = IntermediateField.adjoin (FractionRing O) {z n})
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
      P.Monic ∧ f = PowerSeries.C ((p : O)^μ) * P.toPowerSeries * (v : B[O])) :
    units ≃* fixedUnits p O σ := sorry

section Arithmetic
variable (p : ℕ) [Fact p.Prime] (O : Type) [CommRing O] [IsDomain O]
    [Algebra ℤ_[p] O] [Module.Free ℤ_[p] O] [Module.Finite ℤ_[p] O]
    [IsAdicComplete (Ideal.span {(p : O)}) O] [IsDiscreteValuationRing O]
    [UniformSpace O] [IsUniformAddGroup O] [IsTopologicalRing O]
    [IsLinearTopology O O] [CompleteSpace O] [T2Space O] [CompactSpace O]
    (σ : O ≃ₐ[ℤ_[p]] O) (z : ℕ → AlgebraicClosure (FractionRing O))
    (levels : ℕ → IntermediateField (FractionRing O) (AlgebraicClosure (FractionRing O)))
    (rings : ∀ n : ℕ, Subalgebra O (levels n))
    [∀ n : ℕ, WithIdeal (A[rings,n])]
    [∀ n : ℕ, CompleteSpace (A[rings,n])] [∀ n : ℕ, T2Space (A[rings,n])]
    (stepAlgebra : ∀ n : ℕ, Algebra (A[rings,n]) (A[rings,n+1]))
    (units : Subgroup (∀ n : ℕ, (A[rings,n])ˣ))
    [∀ n : ℕ, @Module.Free (A[rings,n]) (A[rings,n+1]) _ _
      (@Algebra.toModule (A[rings,n]) (A[rings,n+1]) _ _ (stepAlgebra n))]
    [∀ n : ℕ, @Module.Finite (A[rings,n]) (A[rings,n+1]) _ _
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
local notation "ev" => twistedEvaluation p O σ z levels rings stepAlgebra units π hc hπ σn ε hlevels hrings hUnits hε hO hAdic hσ hσc hσic hz hzstep hπroot hstep hAnAdic relativeBasis hrelativeBasis hdegree hσcoeff hσroot hσnc hσnic hσnorm hpolyLift hWPT
local notation "Col" => colemanEquiv p O σ z levels rings stepAlgebra units π hc hπ σn ε hlevels hrings hUnits hε hO hAdic hσ hσc hσic hz hzstep hπroot hstep hAnAdic relativeBasis hrelativeBasis hdegree hσcoeff hσroot hσnc hσnic hσnorm hpolyLift hWPT

lemma evaluation_frobenius (n : ℕ) (f : B[O]) :
    ε[n] (Σ[σ] f) = σn n (ε[n] f) ∧
    ε[n+1] (Φ[p,O] f) = @algebraMap (A[rings,n]) (A[rings,n+1]) _ _ (stepAlgebra n) (ε[n] f) := sorry
lemma evaluation_matrix (n : ℕ) (f : B[O]) (i j : Fin p) :
    ε[n] (@Algebra.leftMulMatrix B[O] B[O] _ _ ΦAlg[p,O] (Fin p) _ _
      (basis p O) f i j) =
    @Algebra.leftMulMatrix (A[rings,n]) (A[rings,n+1]) _ _ (stepAlgebra n) (Fin p) _ _ (relativeBasis n) (ε[n+1] f) i j := sorry
lemma norm_evaluation (n : ℕ) (f : B[O]) :
    ε[n] (norm O p f) = @Algebra.norm (A[rings,n]) (A[rings,n+1]) _ _ (stepAlgebra n) (ε[n+1] f) := sorry
lemma trace_evaluation (n : ℕ) (f : B[O]) :
    ε[n] (trace O p f) = @Algebra.trace (A[rings,n]) (A[rings,n+1]) _ _ (stepAlgebra n) (ε[n+1] f) := sorry
lemma evaluation_eventually_nonzero (f : B[O]) (hf : f≠0) :
    ∀ᶠ n : ℕ in Filter.atTop, ε[n] f ≠ 0 := sorry
theorem evaluation_separation (f g : B[O]) (hfg : ∀ n : ℕ, ε[n] f = ε[n] g) : f=g := sorry
lemma twistedEvaluation_coordinate (f : Fix) (n : ℕ) :
    (ev f).1 n = (σiu[n]^[n]) (εu[n] f.1) := sorry
lemma twistedEvaluation_continuous : Continuous ev := sorry
lemma twistedEvaluation_injective : Function.Injective ev := sorry
lemma iterated_lift_evaluation (u : units) (m n : ℕ) (hnm : n≤m) (g : B[O]ˣ)
    (hg : εu[m] g = (σu[m]^[m]) (u.1 m)) :
    εu[n] ((M^[m-n]) g) = (σu[n]^[n]) (u.1 n) := sorry
lemma finite_precision_interpolation (u : units) (r : ℕ) :
    ∃ v : B[O]ˣ,
      (∀ n : ℕ, n≤r → ε[n] (v : B[O]) -
        (((σu[n]^[n]) (u.1 n)) : A[rings,n]) ∈ Ideal.span {(p : A[rings,n])}^(r+1)) ∧
      (M v : B[O])-(v : B[O]) ∈ Ideal.span {(p : B[O])}^(r+1) := sorry
theorem interpolation_existence (u : units) :
    (∃! f : B[O]ˣ, ∀ n : ℕ, εu[n] f = (σu[n]^[n]) (u.1 n)) ∧
    (∀ f : B[O]ˣ, (∀ n : ℕ, εu[n] f = (σu[n]^[n]) (u.1 n)) → f ∈ Fix) := sorry
lemma colemanEquiv_interpolation (u : units) (n : ℕ) :
    εu[n] (Col u).1 = (σu[n]^[n]) (u.1 n) := sorry
lemma colemanEquiv_symm : (Col).symm.toMonoidHom = ev := sorry
lemma colemanEquiv_mul (u v : units) : Col (u*v) = Col u * Col v := sorry
lemma colemanEquiv_unique (u : units) (f : B[O]ˣ)
    (hf : ∀ n : ℕ, εu[n] f = (σu[n]^[n]) (u.1 n)) : f=(Col u).1 := sorry
lemma colemanEquiv_continuous : Continuous Col ∧ Continuous (Col).symm := sorry
lemma interpolation_homeomorphism : ∃ e : units ≃ₜ Fix, e.toEquiv=(Col).toEquiv := sorry
lemma interpolation_frobenius_equivariant (u uσ : units)
    (huσ : ∀ n : ℕ, uσ.1 n=σu[n] (u.1 n)) :
    ((Col uσ).1 : B[O])=Σ[σ] ((Col u).1 : B[O]) := sorry

/- Parent declarations are unimplemented roadmap inputs at this pin. The
parameters name their native types and characterizations after the canonical
coefficient and tower identifications; no parent implementation is assumed. -/
lemma base_coefficient_comparison
    (hbaseCoeff : Nonempty (O ≃ₐ[ℤ_[p]] ℤ_[p])) (hσid : σ=AlgEquiv.refl)
    (baseScalar : Algebra B[O] B[O])
    (hbaseScalar : ∀ f : B[O], @algebraMap B[O] B[O] _ _ baseScalar f=Φ[p,O] f)
    (baseNorm : B[O] →* B[O])
    (hbaseNorm : baseNorm = @Algebra.norm B[O] B[O] _ _ baseScalar)
    (baseTrace : B[O] →+ B[O])
    (hbaseTrace : baseTrace = (@Algebra.trace B[O] B[O] _ _ baseScalar).toAddMonoidHom)
    (baseLimit : B[O]ˣ → B[O]ˣ)
    (hbaseLimit : ∀ f : B[O]ˣ, Filter.Tendsto
      (fun r : ℕ => ((Units.map baseNorm)^[r]) f) Filter.atTop (𝓝 (baseLimit f)))
    (baseCol : units → B[O]ˣ)
    (hbaseCol : ∀ (u : units) (n : ℕ), εu[n] (baseCol u)=u.1 n) :
    baseScalar=scalarAlgebra O p ∧ baseNorm=norm O p ∧
      baseTrace=(trace O p).toAddMonoidHom ∧
      correctedNorm p O σ=Units.map baseNorm ∧
      fixedUnits p O σ=MonoidHom.eqLocus (Units.map baseNorm) (MonoidHom.id B[O]ˣ) ∧
      (∀ f : B[O]ˣ, baseLimit f=(normLimit p O σ hO hAdic hσ hσc hσic f).1) ∧
      (∀ u : units, baseCol u=(Col u).1) := sorry

namespace Tests
-- evaluation_one
example (n : ℕ) : (ev 1).1 n=1 := sorry
-- evaluation_Y
example (y : Fix) (hy : (y.1 : B[O])=(-1 : B[O])^(p-1)*Y[O]) (n : ℕ) :
    ((ev y).1 n : A[rings,n]) = (-1 : A[rings,n])^(p-1)*(1+π n) := sorry
-- evaluation_teichmuller
example (c : Oˣ) (hcσ : σ (c : O)=(c : O)^p) (hnc : (c : O)^p≠c)
    (f : Fix) (hf : f.1=Units.map PowerSeries.C.toMonoidHom c) (n : ℕ) :
    (ev f).1 n=(σiu[n]^[n]) (Units.map (algebraMap O (A[rings,n])).toMonoidHom c) ∧
      ν[0] (Units.map (algebraMap O (A[rings,1])).toMonoidHom c) ≠
        Units.map (algebraMap O (A[rings,0])).toMonoidHom c := sorry
-- coleman_one
example : Col 1=1 := sorry
-- coleman_root_tower
example (u : units) (hu : ∀ n : ℕ, (u.1 n : A[rings,n])=(-1 : A[rings,n])^(p-1)*(1+π n)) :
    ((Col u).1 : B[O])=(-1 : B[O])^(p-1)*Y[O] := sorry
-- coleman_teichmuller
example (c : Oˣ) (hcσ : σ (c : O)=(c : O)^p) (u : units)
    (hu : ∀ n : ℕ, u.1 n=
      (σiu[n]^[n]) (Units.map (algebraMap O (A[rings,n])).toMonoidHom c)) :
    ((Col u).1 : B[O])=PowerSeries.C (c : O) := sorry
end Tests
end Arithmetic
end TauCetiRoadmap.ColemanUnramified
