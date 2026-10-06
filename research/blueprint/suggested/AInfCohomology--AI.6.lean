/-
This file is not the roadmap and is not exhaustive. The roadmap document
AInfCohomology--AI.6.md is definitive. These statements suggest Lean forms so
contributors and reviewers can converge on names and signatures.

Baseline: Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.
No declaration here is claimed implemented. Proofs are prototypes only.

PROTOCOL §13: an unavailable condition is omitted, never represented by an
arbitrary carrier, a proposition-valued field, or an assumed comparison.
The final inventory names every geometric declaration/API/test whose actual
supplier types are missing. Compiling this file checks the concrete chart,
monomial, derivation, coefficient and monodromy algebra below. It does not
check those omitted geometric signatures.
-/
import Mathlib.Algebra.MvPolynomial.PDeriv
import Mathlib.Algebra.MvPolynomial.Eval
import Mathlib.RingTheory.Ideal.Quotient.Defs
import Mathlib.RingTheory.AdicCompletion.Algebra
import Mathlib.RingTheory.PowerSeries.Substitution
import Mathlib.RingTheory.WittVector.Frobenius
import Mathlib.Data.Finset.Max
import Mathlib.Data.Fin.VecNotation
import Mathlib.LinearAlgebra.Matrix.Notation
import Mathlib.Data.Matrix.Mul

noncomputable section
namespace TauCeti.AInfBlueprint

namespace Semistable

abbrev ChartVariables (r s : ℕ) := Fin (r + 1) ⊕ (Fin s ⊕ Fin s)

def chartIdeal (R : Type*) [CommRing R] (π : R) (r s : ℕ) :
    Ideal (MvPolynomial (ChartVariables r s) R) :=
  Ideal.span (insert
    ((∏ i : Fin (r + 1), MvPolynomial.X (Sum.inl i)) - MvPolynomial.C π)
    (Set.range fun j : Fin s =>
      MvPolynomial.X (Sum.inr (Sum.inl j)) *
        MvPolynomial.X (Sum.inr (Sum.inr j)) - 1))

abbrev ChartQuotient (R : Type*) [CommRing R] (π : R) (r s : ℕ) :=
  MvPolynomial (ChartVariables r s) R ⧸ chartIdeal R π r s

def chartAdicIdeal (R : Type*) [CommRing R] (p : ℕ) (π : R) (r s : ℕ) :
    Ideal (ChartQuotient R π r s) :=
  Ideal.span ({(p : ChartQuotient R π r s)} : Set (ChartQuotient R π r s))

/-- The actual polynomial chart quotient followed by ordinary p-adic completion. -/
def chartRing (R : Type*) [CommRing R] (p : ℕ) (π : R) (r s : ℕ) : Type _ :=
  AdicCompletion (chartAdicIdeal R p π r s) (ChartQuotient R π r s)

instance (R : Type*) [CommRing R] (p : ℕ) (π : R) (r s : ℕ) :
    CommRing (chartRing R p π r s) := by
  unfold chartRing
  infer_instance

instance (R : Type*) [CommRing R] (p : ℕ) (π : R) (r s : ℕ) :
    Algebra R (chartRing R p π r s) := by
  unfold chartRing
  infer_instance

instance (R : Type*) [CommRing R] (p : ℕ) (π : R) (r s : ℕ) :
    Algebra (ChartQuotient R π r s) (chartRing R p π r s) := by
  unfold chartRing
  infer_instance

namespace chartRing
variable {R : Type*} [CommRing R] (p : ℕ) (π : R) (r s : ℕ)

def coordinate (v : ChartVariables r s) : chartRing R p π r s :=
  algebraMap (ChartQuotient R π r s) (chartRing R p π r s)
    (Ideal.Quotient.mk (chartIdeal R π r s) (MvPolynomial.X v))

lemma branch_relation :
    (∏ i : Fin (r + 1), coordinate p π r s (Sum.inl i)) =
      algebraMap R (chartRing R p π r s) π := by
  sorry

lemma torus_inverse (j : Fin s) :
    coordinate p π r s (Sum.inr (Sum.inl j)) *
      coordinate p π r s (Sum.inr (Sum.inr j)) = 1 := by
  sorry

lemma reduction (n : ℕ) (x : ChartQuotient R π r s) :
    AdicCompletion.evalₐ (chartAdicIdeal R p π r s) n
      (algebraMap (ChartQuotient R π r s) (chartRing R p π r s) x) =
        Ideal.Quotient.mk ((chartAdicIdeal R p π r s) ^ n) x := by
  sorry

/-- The finite quotient part of the chart universal property.
The completed lift continuation needs the imported continuous-ring API. -/
lemma lift {B : Type*} [CommRing B] (f : R →+* B)
    (v : ChartVariables r s → B)
    (hbranch : (∏ i : Fin (r + 1), v (Sum.inl i)) = f π)
    (htorus : ∀ j : Fin s, v (Sum.inr (Sum.inl j)) * v (Sum.inr (Sum.inr j)) = 1) :
    ∃! Φ : ChartQuotient R π r s →+* B,
      Φ.comp (Ideal.Quotient.mk (chartIdeal R π r s)) = MvPolynomial.eval₂Hom f v := by
  sorry

-- Semistable.chartRing.nodal
example : coordinate p π 1 0 (Sum.inl 0) * coordinate p π 1 0 (Sum.inl 1) =
    algebraMap R (chartRing R p π 1 0) π := by
  sorry

-- Semistable.chartRing.unit_coordinate
example : coordinate p π r 1 (Sum.inr (Sum.inl 0)) *
    coordinate p π r 1 (Sum.inr (Sum.inr 0)) = 1 := by
  sorry

-- Semistable.chartRing.point
example :
    (∃ e : ChartQuotient R π 0 0 ≃+* R,
      ∀ x : R, e (algebraMap R (ChartQuotient R π 0 0) x) = x) ∧
    Nonempty (chartRing R p π 0 0 ≃+*
      AdicCompletion (Ideal.span ({(p : R)} : Set R)) R) := by
  sorry
end chartRing

/-- A witness of a zero branch exponent is a property, not a chosen extra index. -/
def monomialExponents (r s : ℕ) :=
  { ab : (Fin (r + 1) → ℕ) × (Fin s → ℤ) // ∃ i, ab.1 i = 0 }

namespace monomialExponents
variable {r s : ℕ}

def minimum (a : Fin (r + 1) → ℕ) : ℕ :=
  (Finset.univ.image a).min' (by
    exact ⟨a 0, Finset.mem_image.mpr ⟨0, Finset.mem_univ 0, rfl⟩⟩)

/-- The removed coefficient exponent is `minimum a` and is retained separately. -/
def normalize (a : Fin (r + 1) → ℕ) : Fin (r + 1) → ℕ :=
  fun i => a i - minimum a

lemma normalized (a : Fin (r + 1) → ℕ) :
    (∃ i, a i = 0) ↔ normalize a = a := by
  sorry

def isIntegral (p m : ℕ) (e : monomialExponents r s) : Prop :=
  (∀ i, p ^ m ∣ e.val.1 i) ∧ (∀ j, (p ^ m : ℤ) ∣ e.val.2 j)

lemma integral (p m : ℕ) (e : monomialExponents r s) :
    isIntegral p m e ↔
      (∀ i, p ^ m ∣ e.val.1 i) ∧ (∀ j, (p ^ m : ℤ) ∣ e.val.2 j) := by
  sorry

-- Semistable.monomialExponents.node
example : normalize ![2, 3] = ![0, 1] ∧ minimum ![2, 3] = 2 := by
  sorry

-- Semistable.monomialExponents.point
example (p m : ℕ) (e : monomialExponents 0 0) : isIntegral p m e := by
  sorry

-- Semistable.monomialExponents.fractional_torus
example : ¬isIntegral 2 1
    (⟨(![0, 2], ![-1]), ⟨0, by simp⟩⟩ : monomialExponents 1 1) := by
  sorry
end monomialExponents

/-- Integer weights for all branch/torus logarithmic directions. -/
def logWeight (r s : ℕ) (i : Fin (r + s)) (v : ChartVariables r s) : ℤ :=
  if i.val < r then
    match v with
    | Sum.inl k => if k.val = i.val + 1 then 1 else if k.val = 0 then -1 else 0
    | Sum.inr _ => 0
  else
    match v with
    | Sum.inl _ => 0
    | Sum.inr (Sum.inl j) => if j.val = i.val - r then 1 else 0
    | Sum.inr (Sum.inr j) => if j.val = i.val - r then -1 else 0

/-- Actual polynomial derivations. The complete étale/PD continuation is omitted. -/
def logDerivations (R : Type*) [CommRing R] (r s : ℕ) (i : Fin (r + s)) :
    Derivation R (MvPolynomial (ChartVariables r s) R)
      (MvPolynomial (ChartVariables r s) R) :=
  ∑ v : ChartVariables r s,
    (MvPolynomial.C ((logWeight r s i v : ℤ) : R) * MvPolynomial.X v) •
      MvPolynomial.pderiv v

namespace logDerivations
variable {R : Type*} [CommRing R] {r s : ℕ} (i : Fin (r + s))

lemma generators (v : ChartVariables r s) :
    logDerivations R r s i (MvPolynomial.X v) =
      MvPolynomial.C ((logWeight r s i v : ℤ) : R) * MvPolynomial.X v := by
  sorry

lemma relations (π : R) :
    logDerivations R r s i
      ((∏ k : Fin (r + 1), MvPolynomial.X (Sum.inl k)) - MvPolynomial.C π) = 0 ∧
    ∀ j : Fin s, logDerivations R r s i
      (MvPolynomial.X (Sum.inr (Sum.inl j)) *
        MvPolynomial.X (Sum.inr (Sum.inr j)) - 1) = 0 := by
  sorry

lemma frobenius (p : ℕ) (F : R →+* R)
    (f : MvPolynomial (ChartVariables r s) R) :
    logDerivations R r s i
      (MvPolynomial.eval₂Hom (MvPolynomial.C.comp F) (fun v => MvPolynomial.X v ^ p) f) =
    (p : MvPolynomial (ChartVariables r s) R) *
      MvPolynomial.eval₂Hom (MvPolynomial.C.comp F) (fun v => MvPolynomial.X v ^ p)
        (logDerivations R r s i f) := by
  sorry

-- Semistable.logDerivations.node
example (a : ℤ) : logDerivations ℤ 1 0 0
    (MvPolynomial.X (Sum.inl 0) * MvPolynomial.X (Sum.inl 1) - MvPolynomial.C a) = 0 := by
  sorry

-- Semistable.logDerivations.torus
example : logDerivations ℤ 0 1 0
    (MvPolynomial.X (Sum.inr (Sum.inl 0)) *
      MvPolynomial.X (Sum.inr (Sum.inr 0)) - 1) = 0 := by
  sorry

-- Semistable.logDerivations.zero_rank
example : IsEmpty (Fin (0 + 0)) := by
  sorry
end logDerivations
end Semistable

namespace CohomologicalBK
variable {R : Type*} [CommRing R]

/-- The concrete power-series component of the normalization.
The R07.4 coefficient ring is imported; no new period-ring carrier is introduced. -/
def coefficientNormalization (p : ℕ) (hp : p ≠ 0) (F : R →+* R) :
    PowerSeries R →+* PowerSeries R :=
  (PowerSeries.substAlgHom (PowerSeries.HasSubst.X_pow hp)).toRingHom.comp
    (PowerSeries.map F)

def normalizedResidue (F : R →+* R) : PowerSeries R →+* R :=
  F.comp (PowerSeries.constantCoeff (R := R))

namespace coefficientNormalization

lemma frobenius (p : ℕ) (hp : p ≠ 0) (F : R →+* R) (a : R) :
    coefficientNormalization p hp F (PowerSeries.C a) = PowerSeries.C (F a) ∧
    coefficientNormalization p hp F PowerSeries.X = PowerSeries.X ^ p ∧
    ∀ (f : PowerSeries R) (n : ℕ),
      PowerSeries.coeff n (coefficientNormalization p hp F f) =
        if p ∣ n then F (PowerSeries.coeff (n / p) f) else 0 := by
  sorry

lemma crystalline (p : ℕ) (hp : p ≠ 0) (F : R →+* R) (a : R) :
    normalizedResidue F (PowerSeries.C a) = F a ∧
    normalizedResidue F PowerSeries.X = 0 ∧
    (normalizedResidue F).comp (coefficientNormalization p hp F) =
      F.comp (normalizedResidue F) := by
  sorry

-- CohomologicalBK.coefficientNormalization.variable
example : coefficientNormalization 2 (by decide) (RingHom.id ℤ) PowerSeries.X =
    (PowerSeries.X : PowerSeries ℤ) ^ 2 := by
  sorry

-- CohomologicalBK.coefficientNormalization.twisted_constant
example (F : R →+* R) (a : R) : normalizedResidue F (PowerSeries.C a) = F a := by
  sorry

-- CohomologicalBK.coefficientNormalization.constant_identity
example : normalizedResidue (RingHom.id R) = PowerSeries.constantCoeff (R := R) := by
  sorry

-- CohomologicalBK.coefficientNormalization.nonsurjective
example : ¬Function.Surjective
    (coefficientNormalization 2 (by decide) (RingHom.id ℤ)) := by
  sorry
end coefficientNormalization

/-- The exact Mathlib Witt Frobenius is used in the normalized residue. -/
def normalizedWittResidue (p : ℕ) (k : Type*) [CommRing k] [Fact p.Prime] :
    PowerSeries (WittVector p k) →+* WittVector p k :=
  normalizedResidue (WittVector.frobenius : WittVector p k →+* WittVector p k)

-- The scalar-extension length calculation behind the torsion constraint.
example (p a : ℕ) : p ∣ p * a := by
  sorry
end CohomologicalBK

namespace MonodromyTest
/-- This is a concrete algebra test for CR.6's normalization, not a geometric H¹ model. -/
def F (p : ℕ) : Matrix (Fin 2) (Fin 2) ℚ := !![1, 0; 0, p]
def N : Matrix (Fin 2) (Fin 2) ℚ := !![0, 1; 0, 0]

-- Semistable.hyodoKatoInterface: orientation test for Nφ = pφN.
example (p : ℕ) : N * F p = (p : ℚ) • (F p * N) := by
  sorry

example : N ≠ 0 := by
  sorry

example : N * N = 0 := by
  sorry
end MonodromyTest

end TauCeti.AInfBlueprint

/-!
NAMED SIGNATURE INVENTORY — actual supplier types required.

The entries below are mathematical signature specifications, not Lean declarations.
For omitted entries, both the definition/theorem signature and its named API/test
signatures are absent. This is the explicit §13 omission, recorded by G-LEAN-GEOMETRY.
For the four algebraic prototypes, only the geometric continuations marked here
are absent (G-LEAN-CONTINUATIONS). No conclusion is encoded as input data.

AInfCohomology:AI.6/chart-ring
Semistable.chartRing — algebraic
Signature: For a commutative ring R, π∈R and integers r,s≥0, let P=R[T₀,…,Tᵣ,Y₁,Z₁,…,Yₛ,Zₛ]. Let J be generated by ∏Tᵢ−π and YⱼZⱼ−1. The algebraic chart Q=P/J and its ordinary p-adic completion R□=AdicCompletion((p),Q) give the restricted-power-series chart. In CK use R=O_C and π=p^q, q∈Q>0; the torus coordinates are Yⱼ. The construction here is this chart, not a general formal scheme.
Prototype boundary: actual chart quotient/completion, normalized finite exponents, polynomial log derivations or coefficient map as above. The θ/PD/continuous geometric continuation uses supplier types and is omitted.
API Semistable.chartRing.branch_relation [relation]: In the completion, ∏ᵢTᵢ equals the image of π.
API Semistable.chartRing.torus_inverse [simp]: The images of Yⱼ and Zⱼ multiply to 1.
API Semistable.chartRing.reduction [compatibility]: Projection to level n sends a polynomial class to its class in Q/(p)^n, agreeing with AdicCompletion.evalₐ and Ideal.Quotient.mk.
API Semistable.chartRing.lift [universal-property]: A ring map R→B and branch/torus values satisfying the relations induce a unique map Q→B; a compatible family Q→B/I^n induces the corresponding completion map.
example Semistable.chartRing.nodal [computation]: For r=1,s=0, T₀T₁=π in R□.
example Semistable.chartRing.unit_coordinate [computation]: For s=1, Y₁Z₁=1, including after reduction modulo p.
example Semistable.chartRing.point [degenerate]: For r=s=0, Q≃R by T₀↦π, and R□≃AdicCompletion((p),R).
Supplier prerequisites: mathlib:MvPolynomial, mathlib:Ideal.Quotient.mk, mathlib:AdicCompletion, mathlib:AdicCompletion.evalₐ

AInfCohomology:AI.6/divisorial-log
Semistable.divisorialLog — omitted
Signature: For a CK formal model 𝔛, take the associated log structure of O_𝔛,ét∩(O_𝔛,ét[1/p])×→O_𝔛,ét; the base prelog monoid is O_C∖{0}. On a chart it is the pushout of ℕ^{r+1} along the diagonal ℕ→ℕ^{r+1} and 1↦p^q in O_C∖{0}. It is quasi-coherent and integral; the base need not be fine. Its generic-fibre restriction is trivial.
API Semistable.divisorialLog.chart [characterisation]: The associated chart is ℕ^{r+1}⊔_ℕ(O_C∖{0}) with the displayed maps.
API Semistable.divisorialLog.pullback [functoriality]: Strict étale chart pullback agrees with the divisorial log structure, and composes under refinement.
API Semistable.divisorialLog.generic [compatibility]: After p-inversion its associated log structure is the units log structure.
example Semistable.divisorialLog.node [computation]: At the closed node of T₀T₁=p^q the relative characteristic chart has two branch generators modulo the base diagonal.
example Semistable.divisorialLog.smooth [compatibility]: At r=0 the relative log differentials are the ordinary differentials of the torus chart.
example Semistable.divisorialLog.nonfine [non-example]: The base chart O_C∖{0} has value monoid Q≥0 in the CK setup, which is not finitely generated; no fine hypothesis is asserted for this chart.
Supplier prerequisites: AInfCohomology:AI.6/chart-ring, CrystallineCohomology:CR.5:log-algebra

AInfCohomology:AI.6/root-tower
Semistable.rootTower — omitted
Signature: Given R□→R p-adically formally étale, form R_m by base change from the chart adjoining p^m-th roots of every branch and invertible coordinate and imposing ∏Tᵢ^{1/p^m}=p^{q/p^m}. Set R_∞ to the p-adic completion of colim_mR_m. Its generic fibre is a pro-étale cover with group Δ={(ε₀,…,ε_d):∏_{i=0}^rεᵢ=1}≃Z_p^d; R_∞ is integral perfectoid.
API Semistable.rootTower.transition [data]: Level m embeds into level m+1 by sending each root to the p-th power of the next root.
API Semistable.rootTower.action [structure]: The continuous Δ-action scales each compatible root and preserves the branch-product relation.
API Semistable.rootTower.perfectoid [compatibility]: The completed tower uses the shared integral perfectoid carrier, and its associated generic-fibre cover uses the shared pro-étale carrier.
example Semistable.rootTower.node_action [computation]: For T₀T₁=p^q, δ(T₀^{1/p^m})=ζ_{p^m}^{-1}T₀^{1/p^m} and δ(T₁^{1/p^m})=ζ_{p^m}T₁^{1/p^m}.
example Semistable.rootTower.point [degenerate]: For r=s=0 the tower is O_C with trivial Δ.
example Semistable.rootTower.nonflat [non-example]: For the nodal chart at p=2,m=1, the generic root cover has rank 2 but its closed-node special-fibre algebra has basis 1,a,b and length 3 (a²=b²=ab=0); the integral map is not flat.
Supplier prerequisites: AInfCohomology:AI.6/chart-ring, AInfCohomology:AI.3, PerfectoidSpaces:P3

AInfCohomology:AI.6/monomial-exponents
Semistable.monomialExponents — algebraic
Signature: At root level m, an index consists of a∈ℕ^{r+1}, b∈ℤ^s and a branch j with a_j=0, modulo equality of a and b (the witness j is not extra data). It represents ∏Tᵢ^{aᵢ/p^m}∏Yⱼ^{bⱼ/p^m}. Normalize an arbitrary a by subtracting min_i a_i; the removed factor is p^{q·min(a)/p^m}. The index is integral precisely when p^m divides every a_i and b_j.
Prototype boundary: actual chart quotient/completion, normalized finite exponents, polynomial log derivations or coefficient map as above. The θ/PD/continuous geometric continuation uses supplier types and is omitted.
API Semistable.monomialExponents.normalize [constructor]: Normalization sends a to a−min(a) coordinatewise and records min(a).
API Semistable.monomialExponents.normalized [characterisation]: A branch exponent is normalized iff at least one coordinate is zero; normalize fixes such tuples.
API Semistable.monomialExponents.integral [characterisation]: At level m integrality means simultaneous divisibility by p^m of branch and signed torus numerators.
example Semistable.monomialExponents.node [computation]: normalize(2,3)=(0,1) and the removed minimum is 2.
example Semistable.monomialExponents.point [degenerate]: For r=s=0 the sole normalized branch exponent is 0 and every level has only the integral index.
example Semistable.monomialExponents.fractional_torus [non-example]: At p=2,m=1, branch tuple (0,2) and torus numerator −1 give a nonintegral index; ignoring negative torus exponents would give the wrong answer.
Supplier prerequisites: AInfCohomology:AI.6/chart-ring, mathlib:Finset.max'

AInfCohomology:AI.6/monomial-splitting
Semistable.monomialSplitting — omitted
Signature: The completed monomial expansion yields Δ-equivariant decompositions R_∞=R⊕M_∞ and A_inf(R_∞)=A(R)⊕N_∞, with integral indices in the first summand and nonintegral indices in the second; A(R) is the (p,μ)-complete lift below. These are completed module decompositions, not a direct product of rings.
Supplier prerequisites: AInfCohomology:AI.6/root-tower, AInfCohomology:AI.6/monomial-exponents, AInfCohomology:AI.6/ainf-chart-lift, AInfCohomology:AI.0, AInfCohomology:AI.3

AInfCohomology:AI.6/ainf-chart-lift
Semistable.ainfChartLift — omitted
Signature: Let A(R□)=A_inf{X₀,…,Xᵣ,X_{r+1}^{±1},…,X_d^{±1}}/(∏Xᵢ−[(p^{1/p∞})^q]), completed for (p,μ). Lift the formally étale map R□→R uniquely to a (p,μ)-complete formally étale A(R□)-algebra A(R). It has Frobenius Xᵢ↦Xᵢ^p and the integral Δ-action from the root tower; reduction along θ is R.
API Semistable.ainfChartLift.theta [compatibility]: A(R)⊗̂_{A_inf,θ}O_C≃R, agreeing with the imported θ.
API Semistable.ainfChartLift.frobenius [simp]: φ(Xᵢ)=Xᵢ^p and φ acts by Witt Frobenius on coefficients.
API Semistable.ainfChartLift.etale [universal-property]: Complete formally étale chart lift maps are unique and commute with chart restriction.
example Semistable.ainfChartLift.node [computation]: At r=1, X₀X₁=[(p^{1/p∞})^q] before θ-reduction.
example Semistable.ainfChartLift.point [degenerate]: At R=O_C the lift is A_inf.
example Semistable.ainfChartLift.theta_tilde [non-example]: Under the embedding into A_inf(R_∞), θ̃(Xᵢ) is the chosen p-th root coordinate in R_∞; it is not in general the coordinate tᵢ of R. Thus the θ lift-to-R map cannot be relabelled θ̃.
Supplier prerequisites: AInfCohomology:AI.6/chart-ring, AInfCohomology:AI.6/root-tower, AInfCohomology:AI.0, AInfCohomology:AI.3

AInfCohomology:AI.6/nonintegral-annihilation
Semistable.nonintegralAnnihilation — omitted
Signature: For every i, μ annihilates H^i_cont(Δ,N_∞). Moreover H^i_cont(Δ,A_inf(R_∞)/μ) is p-torsion-free and has no nonzero W(m^♭)-torsion. These are the exact inputs that turn the almost edge comparison into an integral Lη_μ equivalence.
Supplier prerequisites: AInfCohomology:AI.6/monomial-splitting, AInfCohomology:AI.6/monomial-exponents, AInfCohomology:AI.3, AInfCohomology:AI.1

AInfCohomology:AI.6/local-edge
Semistable.localEdge — omitted
Signature: The natural edge map gives Lη_μ RΓ_cont(Δ,A_inf(R_∞))≃Lη_μ RΓ_proét((SpfR)_C^ad,A_inf,X), and the left side is computed by Lη_μ on the integral Koszul complex for A(R). It is natural under the eligible chart maps.
Supplier prerequisites: AInfCohomology:AI.6/nonintegral-annihilation, AInfCohomology:AI.6/root-tower, AInfCohomology:AI.3, AInfCohomology:AI.1/derived-decalage

AInfCohomology:AI.6/aomega
Semistable.aOmega — omitted
Signature: For ν:X_C,proét^ad→𝔛_ét define AΩ_𝔛=Lη_μRν_*A_inf,X in the imported monoidal derived sheaf category. The semistable extension uses the same integral sheaf and décalage as AI.3, now on the CK charts. It is a multiplicative, ξ-derived-complete complex, functorial in eligible semistable model morphisms; RΓ_Ainf(𝔛)=RΓ(𝔛_ét,AΩ_𝔛).
API Semistable.aOmega.local [equivalence]: Restriction to a framed affine is the local-edge Koszul computation, independently of the framing.
API Semistable.aOmega.functorial [functoriality]: Pullback maps along eligible model morphisms preserve products and satisfy identity/composition.
API Semistable.aOmega.complete [structure]: AΩ is derived ξ-complete, with the source completion convention; this is not arbitrary commutation of décalage and completion.
API Semistable.aOmega.smooth [compatibility]: For smooth models the ν/period-sheaf/Lη construction agrees with AI.3 under the same site comparison.
example Semistable.aOmega.point [degenerate]: For SpfO_C the global complex is A_inf concentrated in degree 0.
example Semistable.aOmega.node [computation]: For the node T₀T₁=p^q its local computation uses the rank-one Δ action with opposite weights on T₀,T₁.
example Semistable.aOmega.good_reduction [compatibility]: For a smooth formal torus its local complex is the AI.3 toric AΩ complex with identical coefficient maps.
Supplier prerequisites: AInfCohomology:AI.3, AInfCohomology:AI.1/derived-decalage, AInfCohomology:AI.1/decalage-products, AInfCohomology:AI.1/preservation-derived-completeness, AInfCohomology:AI.6/local-edge, EnhancedDerivedSheaves:E1/presentability-and-derived-tensor

AInfCohomology:AI.6/aomega-frobenius
Semistable.aOmegaFrobenius — omitted
Signature: The period-sheaf Frobenius induces φ_A^*AΩ≃Lη_{ξ̃}AΩ→AΩ. The linearized map becomes an equivalence after inverting ξ̃, and is compatible with products and eligible pullback. It need not be an integral equivalence.
Supplier prerequisites: AInfCohomology:AI.6/aomega, AInfCohomology:AI.0, AInfCohomology:AI.1/derived-decalage, AInfCohomology:AI.1/decalage-products

AInfCohomology:AI.6/hodge-tate-comparison
Semistable.hodgeTateComparison — omitted
Signature: AΩ_𝔛⊗^L_{A_inf,θ̃}O_C≃Lη_{ζ_p−1}Rν_*Ô_X^+. Its cohomology sheaves in degree i are Ω^i_{𝔛/O_C,log}{−i}, with H^0=O_𝔛 and H^1 as the canonical twisted log differential identification; multiplication is exterior product.
Supplier prerequisites: AInfCohomology:AI.6/aomega, AInfCohomology:AI.6/divisorial-log, CrystallineCohomology:CR.5, AInfCohomology:AI.0, AInfCohomology:AI.1

AInfCohomology:AI.6/log-de-rham
Semistable.logDeRhamComparison — omitted
Signature: AΩ_𝔛⊗^L_{A_inf,θ}O_C≃Ω^•_{𝔛/O_C,log} as multiplicative complexes. The differential is the log de Rham differential, obtained from the Bockstein of the θ̃ reduction; on sections it sends f to d_log f. The sheaf equivalence globalizes to RΓ_Ainf⊗^L_{θ}O_C≃RΓ_logdR for qcqs 𝔛, with the source completed sheaf convention.
Supplier prerequisites: AInfCohomology:AI.6/hodge-tate-comparison, AInfCohomology:AI.1/bockstein-reduction, CrystallineCohomology:CR.5, EnhancedDerivedSheaves:E1/presentability-and-derived-tensor

AInfCohomology:AI.6/proper-perfectness
Semistable.properPerfectness — omitted
Signature: If 𝔛 is proper over O_C, RΓ_Ainf(𝔛) is a perfect A_inf-complex. If the special fibre is pure of dimension d it is represented by finite free terms in degrees 0,…,2d. This does not imply that its cohomology modules are free.
Supplier prerequisites: AInfCohomology:AI.6/aomega, AInfCohomology:AI.6/log-de-rham, AInfCohomology:AI.5, CrystallineCohomology:CR.5

AInfCohomology:AI.6/finite-pd-base-change
Semistable.finitePDBaseChange — omitted
Signature: Write A_cris^(m) for AI.0/CR.0’s p-completed subalgebra adjoining ξ^s/s! for s≤m. For m≥p, on a CK chart the natural map from (Lη_μRΓ_cont(Δ,A_inf(R_∞)))⊗̂^L_{A_inf}A_cris^(m) to Lη_μRΓ_cont(Δ,A_cris^(m)(R_∞)) is an equivalence. The same local edge comparison holds after this finite PD extension.
Supplier prerequisites: AInfCohomology:AI.6/local-edge, AInfCohomology:AI.6/nonintegral-annihilation, AInfCohomology:AI.0, CrystallineCohomology:CR.0, AInfCohomology:AI.1, EnhancedDerivedSheaves:E4/completed-sheaf-tensor, EnhancedDerivedSheaves:E4/completed-colimits

AInfCohomology:AI.6/log-derivations
Semistable.logDerivations — algebraic
Signature: On the chart polynomial ring, for branch direction 1≤i≤r let D_i=X_i∂_i−X₀∂₀; for each torus pair Y_j,Z_j let D_j=Y_j∂_{Y_j}−Z_j∂_{Z_j}. These derivations preserve the chart ideal and commute. They extend continuously to A(R) and the eligible finite PD/log envelopes. The associated log de Rham complex is their Koszul complex, with degree-j Frobenius p^jφ.
Prototype boundary: actual chart quotient/completion, normalized finite exponents, polynomial log derivations or coefficient map as above. The θ/PD/continuous geometric continuation uses supplier types and is omitted.
API Semistable.logDerivations.generators [simp]: D_i(X_i)=X_i, D_i(X₀)=−X₀ and all other branch values are zero; torus direction sends Y to Y and Z to −Z.
API Semistable.logDerivations.relations [relation]: Each D annihilates ∏X_i−a and Y_jZ_j−1, hence descends to the quotient.
API Semistable.logDerivations.frobenius [compatibility]: D_iφ=pφD_i; on the log differential complex the degree-j lift is p^jφ.
example Semistable.logDerivations.node [computation]: On Z[X₀,X₁], (X₁∂₁−X₀∂₀)(X₀X₁−a)=0 for every integer a.
example Semistable.logDerivations.torus [computation]: On Z[Y,Z], (Y∂_Y−Z∂_Z)(YZ−1)=0.
example Semistable.logDerivations.zero_rank [degenerate]: For r=s=0 there are no log directions, and the Koszul complex has only degree 0.
Supplier prerequisites: AInfCohomology:AI.6/ainf-chart-lift, AInfCohomology:AI.6/divisorial-log, mathlib:MvPolynomial.pderiv, CrystallineCohomology:CR.5, AInfCohomology:AI.1

AInfCohomology:AI.6/local-crystalline
Semistable.localCrystalline — omitted
Signature: For m≥p² the exponential identity δ_i=exp(log[ε]·D_i) gives an invertible comparison between η_μK(δ_i−1) on the finite PD chart lift and K(D_i). After completed colimit in m this gives the local A_cris comparison with log crystalline cohomology. The map in degree j intertwines φ with p^jφ on log forms.
Supplier prerequisites: AInfCohomology:AI.6/finite-pd-base-change, AInfCohomology:AI.6/log-derivations, CrystallineCohomology:CR.5, AInfCohomology:AI.1, EnhancedDerivedSheaves:E4/completed-colimits

AInfCohomology:AI.6/all-coordinates
Semistable.allCoordinates — omitted
Signature: For an affine SpfR admitting CK charts, an index (Σ,Λ) consists of a finite set Σ of invertible functions giving a closed immersion into a formal torus, and a nonempty finite family Λ of formally étale semistable chart maps. Refine by adjoining coordinates/charts. After the CK §5.17 localization, any two distinct special-fibre components meet, so nonsmooth charts have the same branch-product valuation. Form the product chart algebra A□_{Σ,Λ}, with diagonal base log elements identified.
API Semistable.allCoordinates.refine [constructor]: Finite union of invertible coordinates and finite union of chart families define a common refinement of eligible indices.
API Semistable.allCoordinates.maps [functoriality]: Refinement gives compatible maps of chart algebras and root covers, satisfying identity/composition.
API Semistable.allCoordinates.single [compatibility]: With one chart and its invertible coordinates, the product presentation reduces to that chart and its root tower.
example Semistable.allCoordinates.two_charts [characterisation]: Two distinct eligible node charts are both refined by the index containing their union.
example Semistable.allCoordinates.no_chart [non-example]: Λ=∅ is excluded; torus coordinates alone do not constitute the logarithmic semistable presentation.
example Semistable.allCoordinates.smooth [compatibility]: For a smooth torus chart the construction specializes to AI.4’s all-coordinates smooth presentation.
Supplier prerequisites: AInfCohomology:AI.6/chart-ring, AInfCohomology:AI.6/divisorial-log, AInfCohomology:AI.3, CrystallineCohomology:CR.5

AInfCohomology:AI.6/log-exactification
Semistable.logExactification — omitted
Signature: Choose λ₀∈Λ and the fine monoid Q from CK §5.25. Use P_{λ₀} from (5.26.1) in the smooth case, or (5.27.2) indexed by the generic points Y of the special fibre in the nonsmooth case. The immersion Spec(R/p)→Spec(A□_{Σ,Λ}) factors as an exact log closed immersion j_{λ₀} into Spec(A□_{Σ,Λ}⊗_{Z[Q]}Z[P_{λ₀}]), followed by a log étale map. The canonical changes λ₀→λ₀′ commute with Frobenius and satisfy the cocycle law.
API Semistable.logExactification.factor [data]: The displayed factorization is exact-closed followed by log étale and commutes with the map to R/p.
API Semistable.logExactification.units [simp]: In the nonsmooth case X_{λ,iλ(y)}=U_{λ,λ₀,y}X_{λ₀,iλ₀(y)} and U_{λ₀,λ₀,y}=1.
API Semistable.logExactification.change [functoriality]: Changing λ₀ uses the displayed ratios and composes by the cocycle law, preserving log charts and Frobenius.
example Semistable.logExactification.single [degenerate]: For a single nonsmooth chart the ratio units are 1 and exactification retains the original chart.
example Semistable.logExactification.node [computation]: For two node charts x′=ax,y′=a⁻¹y with a a unit, the ratio units are a and a⁻¹ and their product is 1.
example Semistable.logExactification.nonexact_pd [non-example]: The uncompleted envelope of the original possibly nonexact log immersion is not invoked with p nonnilpotent; exactification must precede the ordinary PD construction.
Supplier prerequisites: AInfCohomology:AI.6/all-coordinates, CrystallineCohomology:CR.5:log-algebra, CrystallineCohomology:CR.5

AInfCohomology:AI.6/all-coordinates-pd
Semistable.allCoordinatesPD — omitted
Signature: Let D_{jλ₀} be CR.0’s ordinary divided power envelope of the exactified immersion over (Z_p,pZ_p), equivalently over the compatible uncompleted A_cris^0. Its p-adic completion D_{Σ,Λ} is the completed log PD envelope used for R/p. CK §§5.29–5.34 define finite PD subalgebras D_{Σ,Λ}^{(m)} with completed colimit D_{Σ,Λ}, independent of λ₀ and functorial under refinement. No p-torsion-freeness of D is assumed.
API Semistable.allCoordinatesPD.universal [universal-property]: Maps to compatible p-complete log PD thickenings factor uniquely through D_{Σ,Λ} under the source exactness/nilpotence hypotheses.
API Semistable.allCoordinatesPD.refine [functoriality]: Refinement and change of λ₀ commute with PD structure, Frobenius and log derivations.
API Semistable.allCoordinatesPD.finite [characterisation]: D is the p-completed colimit of the specified finite PD subalgebras; termwise completion alone is not substituted for a derived comparison.
example Semistable.allCoordinatesPD.single [compatibility]: For one chart D is the log PD lift used in local-crystalline.
example Semistable.allCoordinatesPD.ratio [computation]: For two node charts differing by a unit a the ratio variable U reduces to a and the two λ₀ constructions are canonically isomorphic.
example Semistable.allCoordinatesPD.point [degenerate]: For SpfO_C the compatible envelope gives A_cris with its imported divided powers.
Supplier prerequisites: AInfCohomology:AI.6/log-exactification, CrystallineCohomology:CR.0, CrystallineCohomology:CR.5, AInfCohomology:AI.6/log-derivations, EnhancedDerivedSheaves:E4/completed-sheaf-tensor, EnhancedDerivedSheaves:E4/completed-colimits

AInfCohomology:AI.6/all-coordinates-aomega
Semistable.allCoordinatesAOmega — omitted
Signature: Take the filtered all-coordinates colimit of the p-completed filtered colimit, m≥p, of η_μK_{A_cris^(m)(R_{Σ,Λ,∞})}(δ_τ−1). In the shared derived enhancement this is a multiplicative model for AΩ_R⊗̂^L_{A_inf}A_cris with coherent refinement maps; CK §5.35 and finite-pd-base-change justify the termwise model.
API Semistable.allCoordinatesAOmega.edge [equivalence]: The comparison with AΩ_R⊗̂^L A_cris is the local edge map, compatible with chart restriction.
API Semistable.allCoordinatesAOmega.refine [functoriality]: Refinement maps commute with cochain differentials and the completed colimit structure.
API Semistable.allCoordinatesAOmega.frobenius [compatibility]: The model’s Frobenius agrees with aomega-frobenius after PD base change.
example Semistable.allCoordinatesAOmega.point [degenerate]: At SpfO_C the complex is A_cris in degree 0.
example Semistable.allCoordinatesAOmega.single [compatibility]: For one node chart the model restricts to η_μ of its local rank-one Δ cochain complex.
example Semistable.allCoordinatesAOmega.refinement [characterisation]: The two chart embeddings into a common refinement induce the same equivalence with the intrinsic AΩ target.
Supplier prerequisites: AInfCohomology:AI.6/all-coordinates, AInfCohomology:AI.6/root-tower, AInfCohomology:AI.6/finite-pd-base-change, AInfCohomology:AI.1, EnhancedDerivedSheaves:E4/completed-colimits, EnhancedDerivedSheaves:E1/presentability-and-derived-tensor

AInfCohomology:AI.6/all-coordinates-log-crystalline
Semistable.allCoordinatesLogCrystalline — omitted
Signature: Take the filtered all-coordinates colimit of the p-completed filtered colimit, m≥p, of K_{D_{Σ,Λ}^{(m)}}(D_τ). CR.5’s log PD Poincaré lemma identifies this model with Ru_*O_{𝔛_{O_C/p}/A_cris,logcrys}; the source’s envelope-completion arguments justify the explicit terms. Degree-j Frobenius is p^jφ.
API Semistable.allCoordinatesLogCrystalline.poincare [equivalence]: The model identifies with the imported log crystalline pushforward via the log PD Poincaré morphism.
API Semistable.allCoordinatesLogCrystalline.refine [functoriality]: Envelope refinement gives coherent maps of these complexes and composes with chart restriction.
API Semistable.allCoordinatesLogCrystalline.frobenius [simp]: On degree j forms the map is p^jφ, agreeing with log crystalline Frobenius.
example Semistable.allCoordinatesLogCrystalline.point [degenerate]: At SpfO_C the model is A_cris in degree 0.
example Semistable.allCoordinatesLogCrystalline.node [computation]: For one node chart the degree-one forms have the relation dlogX₀+dlogX₁=0.
example Semistable.allCoordinatesLogCrystalline.smooth [compatibility]: For r=0 the log model identifies with the ordinary smooth crystalline all-coordinates complex of AI.4.
Supplier prerequisites: AInfCohomology:AI.6/all-coordinates-pd, AInfCohomology:AI.6/log-derivations, CrystallineCohomology:CR.5, AInfCohomology:AI.1, EnhancedDerivedSheaves:E4/completed-colimits, EnhancedDerivedSheaves:E1/presentability-and-derived-tensor

AInfCohomology:AI.6/all-coordinates-map
Semistable.allCoordinatesComparisonMap — omitted
Signature: Use the canonical map D_{Σ,Λ}→A_cris(R_{Σ,Λ,∞}) of CK §5.38, including its logarithmic ratio variables, and the exponential comparison to construct the natural multiplicative map from the all-coordinates log crystalline model to the all-coordinates AΩ model. It commutes with φ, refinements and specialization to log de Rham.
API Semistable.allCoordinatesComparisonMap.coefficients [data]: The degree-zero map is the canonical compatible PD/log map D→A_cris(R_∞).
API Semistable.allCoordinatesComparisonMap.frobenius [compatibility]: The comparison intertwines p^jφ on j-forms with the AΩ Frobenius.
API Semistable.allCoordinatesComparisonMap.natural [functoriality]: The map commutes with all-coordinates refinement and with eligible model pullback.
example Semistable.allCoordinatesComparisonMap.point [degenerate]: At SpfO_C the map is the identity of A_cris.
example Semistable.allCoordinatesComparisonMap.node [computation]: In one node direction the comparison is the unit-operator exponential comparison of local-crystalline.
example Semistable.allCoordinatesComparisonMap.de_rham [compatibility]: After A_cris→O_C the induced morphism is the log de Rham specialization, including its differential.
Supplier prerequisites: AInfCohomology:AI.6/all-coordinates-pd, AInfCohomology:AI.6/all-coordinates-aomega, AInfCohomology:AI.6/all-coordinates-log-crystalline, AInfCohomology:AI.6/local-crystalline, CrystallineCohomology:CR.5, CrystallineCohomology:CR.0, EnhancedDerivedSheaves:E4/completed-colimits

AInfCohomology:AI.6/absolute-crystalline
Semistable.absoluteCrystallineComparison — omitted
Signature: The all-coordinates comparison morphism is a quasi-isomorphism and sheafifies to AΩ_𝔛⊗̂^L_{A_inf}A_cris≃Ru_*O_{𝔛_{O_C/p}/A_cris,logcrys}, functorially and multiplicatively, with Frobenius. The tensor is derived p-completed.
Supplier prerequisites: AInfCohomology:AI.6/all-coordinates-map, AInfCohomology:AI.6/local-crystalline, AInfCohomology:AI.6/all-coordinates-log-crystalline, CrystallineCohomology:CR.5, EnhancedDerivedSheaves:E1/presentability-and-derived-tensor, EnhancedDerivedSheaves:E4/completed-sheaf-tensor

AInfCohomology:AI.6/crystalline-de-rham-square
Semistable.crystallineDeRhamSquare — omitted
Signature: After A_cris→O_C, absolute-crystalline agrees with log-de-rham and CR.5’s log crystalline-to-log de Rham comparison. The square commutes as a natural map of multiplicative derived complexes, rather than only an equality of cohomology ranks.
Supplier prerequisites: AInfCohomology:AI.6/absolute-crystalline, AInfCohomology:AI.6/all-coordinates-map, AInfCohomology:AI.6/log-de-rham, CrystallineCohomology:CR.5, AInfCohomology:AI.0

AInfCohomology:AI.6/global-crystalline
Semistable.globalCrystallineComparison — omitted
Signature: For qcqs 𝔛, RΓ_Ainf(𝔛)⊗̂^L A_cris≃RΓ_logcrys(𝔛_{O_C/p}/A_cris) and RΓ_Ainf(𝔛)⊗̂^L_{A_inf}W(k̄)≃RΓ_logcrys(𝔛_{k̄}/W(k̄)). If 𝔛 is proper the ordinary derived tensors suffice, and H^i_logcrys(𝔛_{O_C/p}/A_cris)[1/p] is finite free over A_cris[1/p]. The W(k̄) log base first uses Q≥0→W(k̄); the arithmetic normalization is the next node.
Supplier prerequisites: AInfCohomology:AI.6/absolute-crystalline, AInfCohomology:AI.6/proper-perfectness, CrystallineCohomology:CR.5, CrystallineCohomology:CR.6, AInfCohomology:AI.0, EnhancedDerivedSheaves:E1/presentability-and-derived-tensor, EnhancedDerivedSheaves:E4/completed-sheaf-tensor

AInfCohomology:AI.6/hyodo-kato-interface
Semistable.hyodoKatoInterface — omitted
Signature: For an arithmetic semistable descent 𝔛₀/O_K with perfect residue k₀, the W(k̄) specialization identifies with RΓ_logcrys(𝔛₀,k₀/W(k₀))⊗^L_{W(k₀)}W(k̄), where the arithmetic log base is ℕ→W(k₀), 1↦0. Use CR.6’s change-of-log-base and Hyodo–Kato identifications, Frobenius, monodromy Nφ=pφN and uniformizer-change maps. CK §9’s rational B_st comparison is assembled in CP.4, importing these maps rather than rebuilt here.
Supplier prerequisites: AInfCohomology:AI.6/global-crystalline, CrystallineCohomology:CR.5, CrystallineCohomology:CR.6, AInfCohomology:AI.0

AInfCohomology:AI.6/bdr-comparison-map
Semistable.bdrComparisonMap — omitted
Signature: For proper 𝔛, use CP.3’s canonical B_dR⁺ crystalline/deformation complex RΓ_crys(X_C^ad/B_dR⁺) of its smooth proper generic fibre. The canonical all-coordinates PD/log maps after p-inversion and ξ-completion induce RΓ_logcrys(𝔛_{O_C/p}/A_cris)⊗^L_{A_cris}B_dR⁺→RΓ_crys(X_C^ad/B_dR⁺). Compose with global-crystalline to obtain the A_inf-to-B_dR⁺ map. This is a comparison to CP.3’s object, not its construction.
API Semistable.bdrComparisonMap.reduce [compatibility]: Modulo ξ it agrees with log de Rham-to-generic-fibre de Rham and CP.3’s canonical deformation reduction.
API Semistable.bdrComparisonMap.natural [functoriality]: Eligible proper model maps induce a commutative diagram with the canonical generic deformation maps.
API Semistable.bdrComparisonMap.coefficients [data]: The map is induced by the common A_inf→A_cris→B_dR⁺ coefficient maps, not an arbitrary isomorphism of equal-rank modules.
example Semistable.bdrComparisonMap.point [degenerate]: For SpfO_C the map is the identity of B_dR⁺.
example Semistable.bdrComparisonMap.good_reduction [compatibility]: For a proper smooth model the map agrees with AI.5 and CP.3’s good reduction B_dR⁺ comparison.
example Semistable.bdrComparisonMap.node [compatibility]: On a node chart the logarithmic differential relation maps to dlogT₀+dlogT₁=0 on its smooth generic fibre.
Supplier prerequisites: AInfCohomology:AI.6/global-crystalline, AInfCohomology:AI.6/all-coordinates-map, AInfCohomology:AI.6/crystalline-de-rham-square, CohomologyComparisons:CP.3, AInfCohomology:AI.0:period-comparison, EnhancedDerivedSheaves:E1/presentability-and-derived-tensor

AInfCohomology:AI.6/bdr-comparison
Semistable.bdrComparison — omitted
Signature: For proper 𝔛, bdr-comparison-map is an equivalence RΓ_Ainf(𝔛)⊗^L_{A_inf}B_dR⁺≃RΓ_crys(X_C^ad/B_dR⁺). In every degree it gives H^i_Ainf(𝔛)⊗_{A_inf}B_dR⁺≃H^i_crys(X_C^ad/B_dR⁺), a finite free B_dR⁺-module. Under reduction by ξ its comparison with generic de Rham agrees with log-de-rham and the source’s generic-fibre comparison.
Supplier prerequisites: AInfCohomology:AI.6/bdr-comparison-map, AInfCohomology:AI.6/proper-perfectness, AInfCohomology:AI.6/log-de-rham, CohomologyComparisons:CP.3, AInfCohomology:AI.5, EnhancedDerivedSheaves:E4/mod-ideal-detection

AInfCohomology:AI.6/etale-comparison
Semistable.etaleComparison — omitted
Signature: For qcqs 𝔛, RΓ_Ainf(𝔛)[1/μ]≃RΓ_ét(X_C^ad,Z_p)⊗^L_{Z_p}A_inf[1/μ], with the source’s derived p-completion where required. For proper 𝔛 the finite complex formula uses the ordinary derived tensor. It is natural, multiplicative and Frobenius compatible. It is generic-fibre p-adic étale cohomology, not special-fibre étale cohomology and not mere p-inversion.
Supplier prerequisites: AInfCohomology:AI.6/aomega, AInfCohomology:AI.6/proper-perfectness, AInfCohomology:AI.3, AInfCohomology:AI.4, AInfCohomology:AI.0, EnhancedDerivedSheaves:E1/presentability-and-derived-tensor, EnhancedDerivedSheaves:E4/completed-sheaf-tensor

AInfCohomology:AI.6/etale-bdr-agreement
Semistable.etaleBdrAgreement — omitted
Signature: After base change to B_dR, the étale map from etale-comparison and the B_dR⁺ map from bdr-comparison agree with CP.3’s étale–de Rham comparison under its canonical generic deformation. For descended 𝔛₀/O_K this agrees with H_dR(X_K/K)⊗_KB_dR and its filtration using the canonical K→B_dR⁺ lift.
Supplier prerequisites: AInfCohomology:AI.6/etale-comparison, AInfCohomology:AI.6/bdr-comparison, AInfCohomology:AI.6/crystalline-de-rham-square, CohomologyComparisons:CP.3

AInfCohomology:AI.6/cohomological-bkf
Semistable.cohomologicalBKF — omitted
Signature: For proper 𝔛, each H^i_Ainf(𝔛) is finitely presented over A_inf and finite free after p-inversion, with the Frobenius isomorphism after ξ̃-inversion required by AI.2. If the special fibre is pure d-dimensional the module is zero outside 0,…,2d. These are finitely presented BKF modules, with possible p-torsion, not automatically finite free BKF lattices.
Supplier prerequisites: AInfCohomology:AI.6/proper-perfectness, AInfCohomology:AI.6/global-crystalline, AInfCohomology:AI.6/aomega-frobenius, AInfCohomology:AI.5, AInfCohomology:AI.2

AInfCohomology:AI.6/degreewise-specializations
Semistable.degreewiseSpecializations — omitted
Signature: For proper 𝔛 and every i, H_A^i⊗_{A_inf}W(C^♭)≃H_ét^i(X_C,Z_p)⊗_{Z_p}W(C^♭). There are natural exact sequences 0→H_A^i⊗_{θ}O_C→H_logdR^i→H_A^{i+1}[ξ]→0 and 0→H_A^i⊗W(k̄)→H_logcrys^i→Tor₁^{A_inf}(H_A^{i+1},W(k̄))→0. The W(k̄) cohomology uses hyodo-kato-interface’s log base normalization.
Supplier prerequisites: AInfCohomology:AI.6/cohomological-bkf, AInfCohomology:AI.6/etale-comparison, AInfCohomology:AI.6/log-de-rham, AInfCohomology:AI.6/global-crystalline, AInfCohomology:AI.6/hyodo-kato-interface, AInfCohomology:AI.5

AInfCohomology:AI.6/freeness-criterion
Semistable.freenessCriterion — omitted
Signature: For proper 𝔛 and fixed i, H_logdR^i(𝔛/O_C) is O_C-free iff H_logcrys^i(𝔛_{k̄}/W(k̄)) is W(k̄)-free. Under either condition H_A^i is A_inf-free and H_ét^i(X_C,Z_p) is Z_p-free. This alone does not remove the adjacent-degree terms from degreewise-specializations.
Supplier prerequisites: AInfCohomology:AI.6/degreewise-specializations, AInfCohomology:AI.6/cohomological-bkf, AInfCohomology:AI.6/rank-equality, AInfCohomology:AI.5

AInfCohomology:AI.6/rank-equality
Semistable.rankEquality — omitted
Signature: For proper 𝔛, the generic ranks of H_A^i, H_ét^i(X_C,Z_p), H_logdR^i and H_logcrys^i over A_inf, Z_p, O_C and W(k̄), respectively, are equal. Rank is computed after the relevant fraction-field or p-inverted free specialization; it does not assert equality of torsion.
Supplier prerequisites: AInfCohomology:AI.6/cohomological-bkf, AInfCohomology:AI.6/etale-comparison, AInfCohomology:AI.6/global-crystalline, AInfCohomology:AI.6/bdr-comparison, AInfCohomology:AI.5

AInfCohomology:AI.6/crystalline-torsion
Semistable.crystallineTorsion — omitted
Signature: For proper 𝔛, all i and n≥1, length_{Z_p}(H_ét^i(Z_p)_tors/p^n)≤length_{W(k̄)}(H_logcrys^i(W(k̄))_tors/p^n), and length_{Z_p}H_ét^i(Z/p^n)≤length_{W(k̄)}H_logcrys^i(W_n(k̄)). These are length inequalities, not a canonical injection or a subquotient assertion.
Supplier prerequisites: AInfCohomology:AI.6/degreewise-specializations, AInfCohomology:AI.6/rank-equality, AInfCohomology:AI.6/cohomological-bkf, AInfCohomology:AI.5

AInfCohomology:AI.6/de-rham-torsion
Semistable.deRhamTorsion — omitted
Signature: For proper 𝔛, all i and n≥1, v_{Z_p}(H_ét^i(Z_p)_tors/p^n)≤v_{O_C}(H_logdR^i(O_C)_tors/p^n), and v_{Z_p}H_ét^i(Z/p^n)≤v_{O_C}H_logdR^i(O_C/p^n). Here v(p)=1 and v(⊕O_C/(a_j))=Σv(a_j); this normalized valuation length is not ordinary O_C-module length. Over O_K it is length_{O_K}/length_{O_K}(O_K/p).
Supplier prerequisites: AInfCohomology:AI.6/degreewise-specializations, AInfCohomology:AI.6/crystalline-torsion, AInfCohomology:AI.5

AInfCohomology:AI.6/model-independent-lattice
Semistable.modelIndependentLattice — omitted
Signature: Let 𝔛₀/O_K be proper, flat, p-adic, with strict étale standard semistable charts ∏t_i=π′ for nonzero nonunits π′ allowed to depend on the chart, and its divisorial log structure. If H_logdR^i(𝔛₀/O_K) and H_logdR^{i+1}(𝔛₀/O_K) are both O_K-free, set T=H_ét^i(X_C,Z_p). AI.2’s G_K-equivariant Fargues module M(T) for (T,H_dR^i(X_K/K)⊗B_dR⁺) identifies with H_A^i(𝔛₀⊗̂O_C), and its invariant θ-lattice L_dR(T) equals H_logdR^i(𝔛₀/O_K) inside H_dR^i(X_K/K). Two models of the same generic fibre satisfying these hypotheses therefore give the same lattice.
Supplier prerequisites: AInfCohomology:AI.6/degreewise-specializations, AInfCohomology:AI.6/freeness-criterion, AInfCohomology:AI.6/bdr-comparison, AInfCohomology:AI.6/etale-bdr-agreement, AInfCohomology:AI.2, CrystallineCohomology:CR.5, CohomologyComparisons:CP.3

AInfCohomology:AI.6/nodal-conic
Semistable.nodalConic — omitted
Signature: For a uniformizer π of O_K, the proper conic 𝔛₀=Proj O_K[X,Y,Z]/(XY−πZ²), p-adically completed, is flat and semistable. Its special fibre is two projective lines meeting at one node; its generic fibre is a smooth rational curve. The log de Rham groups are O_K,0,O_K in degrees 0,1,2 and zero otherwise. Its A_inf groups are A_inf,0,A_inf{−1}, with the corresponding logarithmic/Witt specializations. The degree-0 and degree-2 lattices agree with a smooth P¹ model under a fixed generic-fibre identification, by model-independent-lattice. This nodal genus-zero example has N=0; the separate rank-two monodromy algebra test does not claim to be its H¹.
Supplier prerequisites: AInfCohomology:AI.6/chart-ring, AInfCohomology:AI.6/divisorial-log, AInfCohomology:AI.6/degreewise-specializations, AInfCohomology:AI.6/freeness-criterion, AInfCohomology:AI.6/model-independent-lattice, AInfCohomology:AI.2, CrystallineCohomology:CR.5

AInfCohomology:AI.7/coefficient-normalization
CohomologicalBK.coefficientNormalization — algebraic
Signature: On the R07.4 coefficient ring 𝔖, distinguish θ̃_𝔖:W(k₀)[[u]]→O_K, u↦π, from θ_𝔖=θ̃_𝔖∘φ_𝔖. Let g:𝔖^(−1)→A_inf be W(k₀)-linear with u↦[π^♭], and f=g∘φ_𝔖:𝔖→A_inf, acting by φ_W on coefficients and u↦[π^♭]^p. Then θ̃_A∘f=θ̃_𝔖, θ_A∘f=θ_𝔖, f(E) generates (ξ̃), and the cohomological crystalline map is c=φ_W∘constantCoeff:𝔖→W(k₀). These maps use the existing rings, rather than new coefficient constants.
Prototype boundary: actual chart quotient/completion, normalized finite exponents, polynomial log derivations or coefficient map as above. The θ/PD/continuous geometric continuation uses supplier types and is omitted.
API CohomologicalBK.coefficientNormalization.frobenius [simp]: For any coefficient endomorphism F and p>0, the power-series map is Σa_nu^n↦ΣF(a_n)u^{pn}; it sends C(a) to C(F(a)) and u to u^p.
API CohomologicalBK.coefficientNormalization.theta [compatibility]: The two displayed θ-squares commute; θ_𝔖(u)=π^p whereas θ̃_𝔖(u)=π.
API CohomologicalBK.coefficientNormalization.crystalline [simp]: The normalized residue map is F∘constantCoeff: C(a)↦F(a), u↦0, and c∘φ_𝔖=φ_W∘c.
API CohomologicalBK.coefficientNormalization.eisenstein [relation]: f(E) generates kerθ̃_A=(ξ̃); g(E) generates kerθ_A=(ξ).
example CohomologicalBK.coefficientNormalization.variable [computation]: At p=2, the map with coefficient identity sends u to u².
example CohomologicalBK.coefficientNormalization.twisted_constant [computation]: For arbitrary F, the normalized residue of C(a) is F(a), not a.
example CohomologicalBK.coefficientNormalization.constant_identity [compatibility]: At F=id, c is exactly Mathlib PowerSeries.constantCoeff.
example CohomologicalBK.coefficientNormalization.nonsurjective [non-example]: Over Z with p=2, the coefficient of u in every image of φ is zero, so u is not an image.
Supplier prerequisites: FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/bk-coefficient-rings, AInfCohomology:AI.0, mathlib:PowerSeries.map, mathlib:PowerSeries.substAlgHom, mathlib:PowerSeries.constantCoeff, mathlib:WittVector.frobenius

AInfCohomology:AI.7/flat-coefficient-extension
CohomologicalBK.flatCoefficientExtension — omitted
Signature: The normalized map f:𝔖→A_inf is faithfully flat and topologically free as in BMS2 Notation 11.1. In particular M⊗^L_𝔖 A_inf is concentrated in degree 0 for every 𝔖-module M, and equality/equivalence of 𝔖-linear maps can be detected after this extension.
Supplier prerequisites: AInfCohomology:AI.7/coefficient-normalization, FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4, AInfCohomology:AI.5, EnhancedDerivedSheaves:E1

AInfCohomology:AI.7/cohomology
CohomologicalBK.cohomology — omitted
Signature: For smooth p-adic 𝔛/O_K, use the existing bounded nonperfect prism (𝔖,(E)) and define RΓ_𝔖(𝔛) to be PR.1’s relative prismatic RΓ_Δ(𝔛/𝔖). On affines write D_𝔖(R)=Δ_{R/𝔖}. It is a (p,E)-complete, equivalently (p,u)-complete, multiplicative complex with φ_𝔖-semilinear Frobenius whose linearization is an equivalence after E-inversion. The geometric application imports the site, Frobenius and relative cohomology rather than defining them again.
API CohomologicalBK.cohomology.affine [characterisation]: For SpfR, the object is precisely Δ_{R/𝔖} in the shared enhancement.
API CohomologicalBK.cohomology.functorial [functoriality]: Pullback on eligible smooth formal schemes gives contravariant maps preserving products, with identity/composition.
API CohomologicalBK.cohomology.frobenius [structure]: The linearized φ_𝔖^*D→D is the imported prismatic Frobenius and becomes an isomorphism after E-inversion.
API CohomologicalBK.cohomology.global [compatibility]: On qcqs formal schemes the local complex sheafifies and its global sections are PR.1’s relative RΓ_Δ.
example CohomologicalBK.cohomology.point [degenerate]: For SpfO_K the complex is 𝔖 in degree 0 with φ_𝔖.
example CohomologicalBK.cohomology.polynomial [compatibility]: For O_K⟨t⟩ its Hodge–Tate reduction has H⁰=O_K⟨t⟩ and H¹=Ω¹{−1}; the Frobenius-twisted de Rham reduction carries the actual derivative dt.
example CohomologicalBK.cohomology.torus [compatibility]: For O_K⟨t^{±1}⟩ the degree-one de Rham differential is dlogt and its integral coefficients are retained.
Supplier prerequisites: PrismaticCohomology:PR.0/breuil-kisin-prism, PrismaticCohomology:PR.1/relative-prismatic-cohomology, PrismaticCohomology:PR.3/leta-frobenius-factorisation, EnhancedDerivedSheaves:E1/presentability-and-derived-tensor, AInfCohomology:AI.7/coefficient-normalization

AInfCohomology:AI.7/twisted-trace
CohomologicalBK.twistedTrace — omitted
Signature: For a p-completely smooth O_K-algebra R, let 𝔖^(−1) be the copy of 𝔖 containing 𝔖 via φ_𝔖 and embedded in A_inf by g. Define D̂_tw(R)=gr⁰TC⁻(R/𝕊[z];Z_p)≃gr⁰TP(R/𝕊[z];Z_p), by unfolding π₀ from the quasiregular semiperfectoid site as in BMS2 §§11.1–11.2. It is a (p,u)-complete E∞-𝔖^(−1)-algebra; its Frobenius linearization is invertible after φ(E)-inversion. RT.6 supplies the relative spectra, filtration, unfolding and coefficient computations.
API CohomologicalBK.twistedTrace.coefficients [compatibility]: For R=O_K, π_*TC⁻=𝔖^(−1)[b,v]/(bv−E), π_*TP=𝔖^(−1)[σ^{±1}], can(b)=Eσ and cyclotomic φ(b)=σ.
API CohomologicalBK.twistedTrace.specializations [equivalence]: Along g it is AΩ_{R⊗̂O_C}; along u↦π with untwisted coefficients it is completed de Rham; along constantCoeff it is crystalline cohomology.
API CohomologicalBK.twistedTrace.frobenius [structure]: Its linearized Frobenius is invertible after φ(E), matching Corollary 11.12(4).
example CohomologicalBK.twistedTrace.point [degenerate]: For O_K the gr⁰ complex is 𝔖^(−1) in degree 0.
example CohomologicalBK.twistedTrace.bott [computation]: On O_K the cyclotomic map takes the Bott class b to σ, which is invertible in TP; can takes b to Eσ.
example CohomologicalBK.twistedTrace.relative [non-example]: Absolute TC⁻(O_K) is not substituted: its coefficient base lacks the relative 𝔖^(−1) variable and the displayed relative Bott relation.
Supplier prerequisites: RefinedTraceMethods:RT.6, AInfCohomology:AI.7/coefficient-normalization, EnhancedDerivedSheaves:E1/presentability-and-derived-tensor, EnhancedDerivedSheaves:E1

AInfCohomology:AI.7/trace-descent
CohomologicalBK.traceDescent — omitted
Signature: D_𝔖^tr(R)=gr⁰(TC⁻(R/𝕊[z];Z_p)[1/b]), unfolded from the quasiregular semiperfectoid site, has φ_𝔖^*D_𝔖^tr≃D̂_tw. The cyclotomic Frobenius extends over b-inversion and z^{1/p}; for p-completed smooth R the resulting map to gr⁰TP is an equivalence. The descent Frobenius is the composite D̂_tw≃gr⁰TP≃gr⁰TC⁻→gr⁰TC⁻[1/b], and is invertible after E-inversion.
Supplier prerequisites: AInfCohomology:AI.7/twisted-trace, RefinedTraceMethods:RT.6, EnhancedDerivedSheaves:E1/presentability-and-derived-tensor, AInfCohomology:AI.1

AInfCohomology:AI.7/trace-prismatic-agreement
CohomologicalBK.tracePrismaticAgreement — omitted
Signature: For p-completely smooth R/O_K there is a natural Frobenius-equivariant multiplicative equivalence D_𝔖^tr(R)≃D_𝔖(R)=Δ_{R/𝔖}, compatible with the specified A_inf, de Rham and crystalline maps. It sheafifies and globalizes for qcqs 𝔛. The proof uses the relative THH/prismatic bridge of RT.6 and the relative-prismatic Nygaard comparison from PR.3; BS22 §18’s perfect-prism uniqueness is used only after A_inf extension with the Hodge–Tate structure map checked.
Supplier prerequisites: AInfCohomology:AI.7/cohomology, AInfCohomology:AI.7/trace-descent, AInfCohomology:AI.7/flat-coefficient-extension, RefinedTraceMethods:RT.6, PrismaticCohomology:PR.3, PrismaticCohomology:PR.6/ainf-omega-comparison, PrismaticCohomology:PR.6/comparison-uniqueness, EnhancedDerivedSheaves:E1

AInfCohomology:AI.7/ainf-base-change
CohomologicalBK.ainfBaseChange — omitted
Signature: For qcqs smooth 𝔛/O_K, RΓ_𝔖(𝔛)⊗̂^L_{𝔖,f}A_inf≃RΓ_Ainf(𝔛⊗̂O_C), where f uses Witt Frobenius and [π^♭]^p. Prismatic base change targets (A_inf,(ξ̃)), and PR.6 identifies its result with φ_A^*Δ_{𝔛_C/(A_inf,(ξ))}≃AΩ. For proper 𝔛 the ordinary derived tensor suffices; all maps are multiplicative and Frobenius compatible.
Supplier prerequisites: AInfCohomology:AI.7/cohomology, AInfCohomology:AI.7/coefficient-normalization, PrismaticCohomology:PR.1/prismatic-base-change, PrismaticCohomology:PR.6/ainf-omega-comparison, PrismaticCohomology:PR.6/theta-theta-tilde-square, AInfCohomology:AI.5, EnhancedDerivedSheaves:E4/completed-sheaf-tensor

AInfCohomology:AI.7/de-rham-base-change
CohomologicalBK.deRhamBaseChange — omitted
Signature: For qcqs smooth 𝔛/O_K, RΓ_𝔖(𝔛)⊗̂^L_{𝔖,θ_𝔖}O_K≃RΓ_dR(𝔛/O_K), where θ_𝔖=θ̃_𝔖∘φ_𝔖 acts by φ_W on coefficients and u↦π^p. Properness removes the extra completion. Under A_inf extension this is exactly AI.5’s θ specialization, including its differential and cup product.
Supplier prerequisites: AInfCohomology:AI.7/cohomology, AInfCohomology:AI.7/coefficient-normalization, PrismaticCohomology:PR.3/de-rham-comparison-general, PrismaticCohomology:PR.6/theta-theta-tilde-square, AInfCohomology:AI.5, EnhancedDerivedSheaves:E4/completed-sheaf-tensor

AInfCohomology:AI.7/crystalline-base-change
CohomologicalBK.crystallineBaseChange — omitted
Signature: For qcqs smooth 𝔛/O_K, RΓ_𝔖(𝔛)⊗̂^L_{𝔖,c}W(k₀)≃RΓ_crys(𝔛_{k₀}/W(k₀)), where c=φ_W∘constantCoeff. Properness removes the extra completion. This is Frobenius equivariant and agrees with AI.5’s W(k̄) comparison after W(k₀)→W(k̄). The φ_W factor is the crystalline comparison’s Frobenius pullback, not a dispensable coordinate choice.
Supplier prerequisites: AInfCohomology:AI.7/cohomology, AInfCohomology:AI.7/coefficient-normalization, PrismaticCohomology:PR.1/prismatic-base-change, PrismaticCohomology:PR.1/crystalline-comparison, AInfCohomology:AI.7/trace-prismatic-agreement, AInfCohomology:AI.5, EnhancedDerivedSheaves:E4/completed-sheaf-tensor

AInfCohomology:AI.7/perfect-cohomological-modules
CohomologicalBK.perfectCohomologicalModules — omitted
Signature: For proper smooth 𝔛/O_K, RΓ_𝔖 is perfect, and every H^i_𝔖 is a finitely generated 𝔖-module with an isomorphism (φ_𝔖^*H^i_𝔖)[1/E]≃H^i_𝔖[1/E]. These are the broad cohomological Breuil–Kisin modules of BMS2 Definition 1.1, potentially with p-torsion. They are not assigned the finite-free Kisin-module classification of R07.4. Their A_inf extension is H^i_Ainf by flatness.
Supplier prerequisites: AInfCohomology:AI.7/ainf-base-change, AInfCohomology:AI.7/flat-coefficient-extension, AInfCohomology:AI.7/cohomology, AInfCohomology:AI.5, FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4, EnhancedDerivedSheaves:E1

AInfCohomology:AI.7/bkf-tensor-functor
CohomologicalBK.bkfTensorFunctor — omitted
Signature: For the broad category of finitely presented 𝔖-modules M with (φ_𝔖^*M)[1/E]≃M[1/E], extension M↦M⊗_{𝔖,f}A_inf is an exact symmetric monoidal functor to AI.2’s finitely presented BKF modules. R07.4 supplies BMS1 Proposition 4.3 that M[1/p] is free; f(E) generates ξ̃. This identifies the Frobenius structure on H^i_𝔖⊗A_inf with the earlier cohomological BKF module.
Supplier prerequisites: AInfCohomology:AI.7/perfect-cohomological-modules, AInfCohomology:AI.7/flat-coefficient-extension, AInfCohomology:AI.7/coefficient-normalization, FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4, AInfCohomology:AI.2

AInfCohomology:AI.7/twist-compatibility
CohomologicalBK.twistCompatibility — omitted
Signature: The imported 𝔖{1} has 𝔖{1}⊗_{𝔖,f}A_inf≃A_inf{1} as BKF objects, compatibly with φ and the G_{K∞} action; tensor powers and dual twists are preserved. R07.4 owns the representation classification identifying Z_p(1) with 𝔖{1}; AI.0/AI.2 own the A_inf twist and étale realization.
Supplier prerequisites: AInfCohomology:AI.7/bkf-tensor-functor, FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4, AInfCohomology:AI.0, AInfCohomology:AI.2

AInfCohomology:AI.7/frobenius-decalage
CohomologicalBK.frobeniusDecalage — omitted
Signature: For p-completely smooth R/O_K, the Frobenius factors canonically as φ_𝔖^*D_𝔖(R)≃Lη_E D_𝔖(R)→D_𝔖(R). Under trace-prismatic-agreement this is BMS2 Remark 11.17’s Beilinson connective cover map from the Nygaard filtration of D̂_tw to the E-adic filtration of D_𝔖. It does not assert a Nygaard filtration on D_𝔖 itself.
Supplier prerequisites: AInfCohomology:AI.7/trace-prismatic-agreement, AInfCohomology:AI.7/twisted-trace, PrismaticCohomology:PR.3/leta-frobenius-factorisation, AInfCohomology:AI.1, RefinedTraceMethods:RT.6, AInfCohomology:AI.7/flat-coefficient-extension

AInfCohomology:AI.7/nygaard-nondescent
CohomologicalBK.nygaardNonDescent — omitted
Signature: The Nygaard filtration on φ_𝔖^*D_𝔖≃D̂_tw has no functorial descent along φ_𝔖 to a filtration on D_𝔖 with the same degree-zero projection. Such a descent would canonically descend every smooth formal O_K-scheme to W(k₀)[π^p]. A good reduction elliptic curve with j∈O_K∖W(k₀)[π^p] contradicts it.
Supplier prerequisites: AInfCohomology:AI.7/twisted-trace, AInfCohomology:AI.7/trace-descent, AInfCohomology:AI.7/coefficient-normalization, RefinedTraceMethods:RT.6

AInfCohomology:AI.7/choice-transport
CohomologicalBK.choiceTransport — omitted
Signature: For two choices (π,π^♭) and (π′,π′^♭), extend their respective 𝔖-valued complexes along the normalized maps f,f′ to the same A_inf. Define the transport as the first ainf-base-change equivalence followed by the inverse of the second, through the intrinsic AΩ complex. It preserves products, Frobenius and the comparison diagram, and satisfies identity/cocycle. An A_inf morphism descends to either 𝔖 only when it respects that map’s faithful-flat Čech descent datum; no 𝔖-linear identification of unrelated coefficient rings is asserted.
API CohomologicalBK.choiceTransport.identity [simp]: Transport for the same choice is the identity under its fixed comparison.
API CohomologicalBK.choiceTransport.cocycle [functoriality]: For three choices transport₍₂₃₎∘transport₍₁₂₎=transport₍₁₃₎.
API CohomologicalBK.choiceTransport.descend [characterisation]: For a fixed f, a morphism between the extended objects comes from 𝔖 precisely when it commutes with the induced faithful-flat Čech descent datum.
example CohomologicalBK.choiceTransport.point [degenerate]: For SpfO_K every extension identifies with A_inf and the transport is its identity.
example CohomologicalBK.choiceTransport.root_change [compatibility]: Replacing π^♭ by another compatible system gives the same intrinsic AΩ after the displayed common extension and its canonical transport.
example CohomologicalBK.choiceTransport.different_uniformizers [non-example]: Transport does not identify the two source variables in 𝔖 without a coefficient map; f(u) and f′(u) need not agree.
Supplier prerequisites: AInfCohomology:AI.7/ainf-base-change, AInfCohomology:AI.7/flat-coefficient-extension, AInfCohomology:AI.3, AInfCohomology:AI.5, EnhancedDerivedSheaves:E1

AInfCohomology:AI.7/comparison-diagram-agreement
CohomologicalBK.comparisonDiagramAgreement — omitted
Signature: For p-completely smooth R/O_C, import AΩ_R≃φ_A^*Δ_{R/(A_inf,kerθ)} from PR.6. The induced θ̃ Hodge–Tate map agrees with the actual map R→H⁰ and its log-free polynomial/torus Kummer differential maps; the Bockstein gives the same θ de Rham map as AI.4. The crystalline, étale and B_dR⁺ maps of AI.4–AI.5 and the Breuil–Kisin/trace maps agree under these identified functors and common coefficient maps. The crystalline agreement is checked on the same PD/Koszul generators; uniqueness of the A_inf functor alone is not claimed to prove it.
Supplier prerequisites: PrismaticCohomology:PR.6/ainf-omega-comparison, PrismaticCohomology:PR.6/theta-theta-tilde-square, PrismaticCohomology:PR.6/comparison-uniqueness, PrismaticCohomology:PR.1/crystalline-comparison, PrismaticCohomology:PR.1/prismatic-base-change, AInfCohomology:AI.4, AInfCohomology:AI.5, CohomologyComparisons:CP.3, RefinedTraceMethods:RT.6, EnhancedDerivedSheaves:E1/presentability-and-derived-tensor

AInfCohomology:AI.7/de-rham-torsion-divisibility
CohomologicalBK.deRhamTorsionDivisibility — omitted
Signature: Let K=Q_p(p^{1/p}) with uniformizer π=p^{1/p} and 𝔛/O_K proper smooth. The map θ_𝔖 has u↦π^p=p and factors through Z_p. Therefore RΓ_dR(𝔛/O_K) is the scalar extension of a perfect Z_p-complex. Each cyclic indecomposable summand of H^i_dR(𝔛/O_K)_tors has O_K-length divisible by p; equivalently it is O_K/(π^{pa}) for some a≥1. The total torsion length is a multiple of p.
Supplier prerequisites: AInfCohomology:AI.7/de-rham-base-change, AInfCohomology:AI.7/perfect-cohomological-modules, AInfCohomology:AI.7/coefficient-normalization, AInfCohomology:AI.5

-/
