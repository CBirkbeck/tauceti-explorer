/-
This file is a blueprint prototype, not a claim of formalisation. The admitted declarations
state the proposed library interfaces. Names and signatures may change during implementation.
The whole file has NOT been elaborated: the existing Tau Ceti build is at a different revision.
The marked affine, column and polynomial signatures were checked against pinned Mathlib.
Their earlier proof prototype is preserved at immutable commit3895cfa; its proof receipt
is distinct from this current admitted sketch. The roadmap document is definitive;
this nonexhaustive file suggests names and native signatures, not implementation.
Geometric carriers and the full H² transfer are unresolved supplier inputs; their precise
unrepresented signatures are listed in the packet and handoff, without proxy carriers.
-/
import TauCeti.Algebra.BrauerGroup.BaseChange
import TauCeti.Algebra.BrauerGroup.Division
import TauCeti.Algebra.BrauerGroup.Quaternion
import Mathlib.Analysis.Complex.Polynomial.Basic
import TauCeti.Algebra.CentralSimple.Index
import TauCeti.Algebra.CentralSimple.FiniteSeparable
import Mathlib.GroupTheory.OrderOfElement
import Mathlib.RingTheory.Morita.Matrix
import Mathlib.RingTheory.Ideal.Maps
import Mathlib.Algebra.Azumaya.Matrix
import Mathlib.LinearAlgebra.Matrix.Charpoly.Basic
import Mathlib.Algebra.TrivSqZeroExt.Basic
import Mathlib.Data.ZMod.Basic

import Mathlib.LinearAlgebra.Matrix.Module
import Mathlib.RingTheory.TensorProduct.Basic
import Mathlib.LinearAlgebra.Dimension.Free
import Mathlib.LinearAlgebra.FiniteDimensional.Basic
import Mathlib.LinearAlgebra.Dimension.Constructions
import Mathlib.RingTheory.Finiteness.Basic
import Mathlib.Algebra.Algebra.Tower
import Mathlib.Algebra.Polynomial.Monic
import Mathlib.Tactic.Ring

set_option maxHeartbeats 800000
universe u
namespace SemisimpleAlgebrasPartII
open scoped TensorProduct Quaternion

section FieldArithmetic
variable {K : Type u} [Field K]

theorem indexBrauerCongr {A B : CSA.{u,u} K} (h : IsBrauerEquivalent A B) :
    TauCeti.Algebra.index K A = TauCeti.Algebra.index K B := by
  sorry

noncomputable def classIndex (α : BrauerGroup.{u,u} K) : ℕ := by
  sorry

theorem classIndex_mk (A : CSA.{u,u} K) :
    classIndex (TauCeti.BrauerGroup.mk A) = TauCeti.Algebra.index K A := by
  sorry

theorem classIndex_pos (α : BrauerGroup.{u,u} K) : 0 < classIndex α := by
  sorry

theorem classIndex_eq_one_iff (α : BrauerGroup.{u,u} K) : classIndex α = 1 ↔ α = 1 := by
  sorry

-- Class-index tests: positive matrix size, finite field, division representative, zero boundary.
example (n : ℕ) [NeZero n] :
    classIndex (TauCeti.BrauerGroup.mk (TauCeti.CSA.of K (Matrix (Fin n) (Fin n) K))) = 1 := by
  sorry
example [Finite K] (α : BrauerGroup.{u,u} K) : classIndex α = 1 := by
  sorry
example (D : Type u) [DivisionRing D] [Algebra K D] [Algebra.IsCentral K D]
    [FiniteDimensional K D] :
    classIndex (TauCeti.BrauerGroup.mk (TauCeti.CSA.of K D)) = TauCeti.Algebra.deg K D := by
  sorry
example (α : BrauerGroup.{u,u} K) : classIndex α ≠ 0 := by
  sorry

-- hamilton_period_index: concrete nonsplit class, not an arbitrary representative.
example : classIndex (TauCeti.BrauerGroup.mk (TauCeti.CSA.of ℝ ℍ[ℝ])) = 2 ∧
    orderOf (TauCeti.BrauerGroup.mk (TauCeti.CSA.of ℝ ℍ[ℝ])) = 2 := by
  sorry

-- complexification_lowers_index: the finite quadratic extension strictly lowers index.
example : classIndex (TauCeti.BrauerGroup.baseChange ℝ ℂ
    (TauCeti.BrauerGroup.mk (TauCeti.CSA.of ℝ ℍ[ℝ]))) = 1 ∧
    classIndex (TauCeti.BrauerGroup.mk (TauCeti.CSA.of ℝ ℍ[ℝ])) = 2 := by
  sorry

noncomputable def splittingDegrees (α : BrauerGroup.{u,u} K) : Set ℕ := by
  sorry

theorem mem_splittingDegrees (α : BrauerGroup.{u,u} K) (d : ℕ) :
    d ∈ splittingDegrees α ↔ ∃ (L : Type u) (_ : Field L) (_ : Algebra K L),
      FiniteDimensional K L ∧ Module.finrank K L = d ∧
        TauCeti.BrauerGroup.baseChange K L α = 1 := by
  sorry

theorem one_mem_splittingDegrees_iff (α : BrauerGroup.{u,u} K) :
    1 ∈ splittingDegrees α ↔ α = 1 := by
  sorry

theorem splittingDegrees_nonempty (α : BrauerGroup.{u,u} K) :
    (splittingDegrees α).Nonempty := by
  sorry

theorem splittingDegrees_positive (α : BrauerGroup.{u,u} K) {d : ℕ}
    (h : d ∈ splittingDegrees α) : 0 < d := by
  sorry

theorem classIndex_mem_splittingDegrees (α : BrauerGroup.{u,u} K) :
    classIndex α ∈ splittingDegrees α := by
  sorry

example : 1 ∈ splittingDegrees (1 : BrauerGroup.{u,u} K) := by
  sorry
example (α : BrauerGroup.{u,u} K) : 0 ∉ splittingDegrees α := by
  sorry
example (α : BrauerGroup.{u,u} K) (h : α ≠ 1) : 1 ∉ splittingDegrees α := by
  sorry
example (L : Type u) [Field L] [Algebra K L] [FiniteDimensional K L]
    (α : BrauerGroup.{u,u} K) (hdeg : Module.finrank K L = 2)
    (hsplit : TauCeti.BrauerGroup.baseChange K L α = 1) : 2 ∈ splittingDegrees α := by
  sorry

-- The left D-action is genuine instance data, not a predicate asserting the target arithmetic.
theorem divisionModuleDimension (D L : Type u) [DivisionRing D] [Field L]
    [Algebra K D] [Algebra.IsCentral K D] [FiniteDimensional K D]
    [Algebra K L] [FiniteDimensional K L]
    (e : (L ⊗[K] D) ≃ₐ[L]
      Matrix (Fin (TauCeti.Algebra.deg K D)) (Fin (TauCeti.Algebra.deg K D)) L) :
    ∃ s : Module D (Fin (TauCeti.Algebra.deg K D) → L),
      letI := s
      IsScalarTower K D (Fin (TauCeti.Algebra.deg K D) → L) ∧
      Module.Finite D (Fin (TauCeti.Algebra.deg K D) → L) ∧
      Module.finrank K (Fin (TauCeti.Algebra.deg K D) → L) =
        (TauCeti.Algebra.deg K D)^2 *
          Module.finrank D (Fin (TauCeti.Algebra.deg K D) → L) := by
  sorry

theorem indexDividesSplittingDegree (L : Type u) [Field L] [Algebra K L]
    [FiniteDimensional K L] (α : BrauerGroup.{u,u} K)
    (h : TauCeti.BrauerGroup.baseChange K L α = 1) :
    classIndex α ∣ Module.finrank K L := by
  sorry

theorem classIndex_baseChange_dvd (L : Type u) [Field L] [Algebra K L]
    (α : BrauerGroup.{u,u} K) :
    classIndex (TauCeti.BrauerGroup.baseChange K L α) ∣ classIndex α := by
  sorry

theorem indexDividesDegreeIndex (L : Type u) [Field L] [Algebra K L]
    [FiniteDimensional K L] (α : BrauerGroup.{u,u} K) :
    classIndex α ∣ Module.finrank K L *
      classIndex (TauCeti.BrauerGroup.baseChange K L α) := by
  sorry

theorem minimumSplittingDegree (α : BrauerGroup.{u,u} K) :
    IsLeast (splittingDegrees α) (classIndex α) := by
  sorry

theorem gcdSplittingDegrees (α : BrauerGroup.{u,u} K) (n : ℕ) :
    (∀ d ∈ splittingDegrees α, n ∣ d) ↔ n ∣ classIndex α := by
  sorry

theorem sameCyclicIndex (α β : BrauerGroup.{u,u} K)
    (h : Subgroup.zpowers α = Subgroup.zpowers β) : classIndex α = classIndex β := by
  sorry

theorem separableSplittingAnnihilates (L : Type u) [Field L] [Algebra K L]
    [FiniteDimensional K L] [Algebra.IsSeparable K L]
    (α : BrauerGroup.{u,u} K) (h : TauCeti.BrauerGroup.baseChange K L α = 1) :
    α ^ Module.finrank K L = 1 := by
  sorry

theorem classPowerIndex (α : BrauerGroup.{u,u} K) : α ^ classIndex α = 1 := by
  sorry

theorem brauerFiniteOrder (α : BrauerGroup.{u,u} K) : IsOfFinOrder α := by
  sorry

theorem periodDividesIndex (α : BrauerGroup.{u,u} K) : orderOf α ∣ classIndex α := by
  sorry

theorem primeToPSplitting (α : BrauerGroup.{u,u} K) (p : ℕ)
    (hp : p.Prime) (h : ¬p ∣ orderOf α) :
    ∃ (L : Type u) (_ : Field L) (_ : Algebra K L),
      FiniteDimensional K L ∧ Algebra.IsSeparable K L ∧
      ¬p ∣ Module.finrank K L ∧ TauCeti.BrauerGroup.baseChange K L α = 1 := by
  sorry

theorem indexPrimeDividesPeriod (α : BrauerGroup.{u,u} K) (p : ℕ)
    (hp : p.Prime) (h : p ∣ classIndex α) : p ∣ orderOf α := by
  sorry

theorem samePrimeDivisors (α : BrauerGroup.{u,u} K) (p : ℕ) (hp : p.Prime) :
    p ∣ orderOf α ↔ p ∣ classIndex α := by
  sorry

end FieldArithmetic

-- BEGIN AFFINE EXTRACTION: exact native Mathlib section, checked separately.
variable {R : Type*} [CommRing R] {M : Type*} [AddCommGroup M] [Module R M]
variable {ι : Type*} [Nonempty ι]
theorem matrixSupport (I : Ideal R) :
    I ≤ Module.annihilator R (ι → M) ↔ I ≤ Module.annihilator R M := by
  sorry

example (I : Ideal R) : I ≤ Module.annihilator R (Fin 2 → M) ↔
    I ≤ Module.annihilator R M := by
  sorry
example : Module.annihilator R (Fin 0 → M) = ⊤ := by
  sorry

example (I : Ideal R) : I ≤ Module.annihilator R (Fin 1 → M) ↔
    I ≤ Module.annihilator R M := by
  sorry
example : (TrivSqZeroExt.inr (1 : ZMod 2) : TrivSqZeroExt (ZMod 2) (ZMod 2)) ≠ 0 := by
  sorry

example : (TrivSqZeroExt.inr (1 : ZMod 2) : TrivSqZeroExt (ZMod 2) (ZMod 2)) ^ 2 = 0 := by
  sorry

example : ¬(2 : ZMod 4) ∈ Module.annihilator (ZMod 4) (ZMod 4) := by
  sorry

example : (2 : ZMod 4) ^ 2 = 0 := by
  sorry
-- END AFFINE EXTRACTION
-- BEGIN COLUMN AND POLYNOMIAL EXTRACTION: canonical admitted native signatures.
open scoped Matrix.Module TensorProduct
noncomputable abbrev divisionColumnModule {K D L : Type*} [Field K] [DivisionRing D]
    [Field L] [Algebra K D] [Algebra K L] (n : ℕ)
    (ρ : D →ₐ[K] Matrix (Fin n) (Fin n) L) : Module D (Fin n → L) := by
  sorry

theorem divisionColumnAction {K D L : Type*} [Field K] [DivisionRing D]
    [Field L] [Algebra K D] [Algebra K L] (n : ℕ)
    (ρ : D →ₐ[K] Matrix (Fin n) (Fin n) L) (a : D) (v : Fin n → L) (i : Fin n) :
    letI := divisionColumnModule n ρ
    (a • v) i = ∑ j, ρ a i j * v j := by
  sorry

theorem divisionColumnTower {K D L : Type*} [Field K] [DivisionRing D]
    [Field L] [Algebra K D] [Algebra K L] (n : ℕ)
    (ρ : D →ₐ[K] Matrix (Fin n) (Fin n) L) :
    let := divisionColumnModule n ρ
    IsScalarTower K D (Fin n → L) := by
  sorry

theorem divisionColumnFinite {K D L : Type*} [Field K] [DivisionRing D]
    [Field L] [Algebra K D] [Algebra K L] [Module.Finite K L] (n : ℕ)
    (ρ : D →ₐ[K] Matrix (Fin n) (Fin n) L) :
    let := divisionColumnModule n ρ
    Module.Finite D (Fin n → L) := by
  sorry

theorem divisionColumnDimension {K D L : Type*} [Field K] [DivisionRing D]
    [Field L] [Algebra K D] [Algebra K L] [Module.Finite K D] [Module.Finite K L]
    (n : ℕ) (ρ : D →ₐ[K] Matrix (Fin n) (Fin n) L) :
    let := divisionColumnModule n ρ
    Module.finrank K (Fin n → L) = Module.finrank K D * Module.finrank D (Fin n → L) := by
  sorry

theorem splittingDegreeDvd {K D L : Type*} [Field K] [DivisionRing D]
    [Field L] [Algebra K D] [Algebra K L] [Module.Finite K D] [Module.Finite K L]
    (n : ℕ) (hn : 0 < n) (hdim : Module.finrank K D = n ^ 2)
    (ρ : D →ₐ[K] Matrix (Fin n) (Fin n) L) : n ∣ Module.finrank K L := by
  sorry

-- column_rank_one
example {K D L : Type*} [Field K] [DivisionRing D] [Field L]
    [Algebra K D] [Algebra K L] (ρ : D →ₐ[K] Matrix (Fin 1) (Fin 1) L)
    (a : D) (v : Fin 1 → L) :
    letI := divisionColumnModule 1 ρ
    (a • v) 0 = ρ a 0 0 * v 0 := by
  sorry

-- column_empty
example {K D L : Type*} [Field K] [DivisionRing D] [Field L]
    [Algebra K D] [Algebra K L] [Module.Finite K L]
    (ρ : D →ₐ[K] Matrix (Fin 0) (Fin 0) L) :
    letI := divisionColumnModule 0 ρ
    Module.Finite D (Fin 0 → L) := by
  sorry

-- column_degree_boundary
example {K D L : Type*} [Field K] [DivisionRing D] [Field L]
    [Algebra K D] [Algebra K L] [Module.Finite K D] [Module.Finite K L]
    (ρ : D →ₐ[K] Matrix (Fin 2) (Fin 2) L)
    (hD : Module.finrank K D = 4) (hL : Module.finrank K L = 3) : False := by
  sorry

example {K D L : Type*} [Field K] [DivisionRing D] [Field L]
    [Algebra K D] [Algebra K L] (ρ : D →ₐ[K] Matrix (Fin 2) (Fin 2) L)
    (a : D) (v : Fin 2 → L) :
    letI := divisionColumnModule 2 ρ
    (a • v) 0 = ρ a 0 0 * v 0 + ρ a 0 1 * v 1 := by
  sorry

example {K : Type*} [Field K] :
    Module.finrank K (Fin 0 → K) = 0 := by
  sorry

abbrev DualNumbers := TrivSqZeroExt (ZMod 2) (ZMod 2)

def epsilon : DualNumbers := by
  sorry

theorem epsilon_ne_zero : epsilon ≠ 0 := by
  sorry

theorem epsilon_sq : epsilon ^ 2 = 0 := by
  sorry

theorem two_epsilon : (2 : DualNumbers) * epsilon = 0 := by
  sorry

open Polynomial

theorem distinctMonicFrobeniusRoots :
    (X : Polynomial DualNumbers) ≠ X + C epsilon ∧
      (X : Polynomial DualNumbers).Monic ∧ (X + C epsilon).Monic ∧
      (X : Polynomial DualNumbers) ^ 2 = (X + C epsilon) ^ 2 := by
  sorry

example : (2 : ℕ) ∣ 6 := by
  sorry

example : ¬ (2 : ℕ) ∣ 3 := by
  sorry
-- END COLUMN AND POLYNOMIAL EXTRACTION
end SemisimpleAlgebrasPartII


/- Native coverage ledger; text entries are not elaborated signatures.
SemisimpleAlgebrasPartII:SA.1/comparison-basechange-units — unrepresented: For a finite separable extension L/K with chosen embedding into Kˢ, the full comparison Additive Br(K)≃H²(G_K,Additive Kˢˣ) commutes with CSA base change and restriction, after the explicit separable-closure units coefficient comparison. This concerns all Brauer classes, not only 2-torsion.
SemisimpleAlgebrasPartII:SA.1/brauer-corestriction — unrepresented: For finite separable L/K, brauerCorestriction_L,K:Br(L)→*Br(K) is the degree-two cohomological transfer transported through the full units-coefficient Brauer comparisons and the chosen separable-closure coefficient identification.
API: brauerCorestriction_res — cor(α_L)=α^[L:K].
API: brauerCorestriction_comp — Corestriction is transitive in finite separable towers.
API: brauerCorestriction_self — Corestriction for K/K is identity.
API: brauerCorestriction_embedding — Compatible changes of chosen closure embedding give the same map.
Tests: identity_extension — For K/K, cor α=α.
Tests: trivial_class — For any finite separable extension cor(1)=1.
Tests: quadratic_restriction — For a separable quadratic extension, cor(res α)=α², which is not generally α.
Tests: inseparable_boundary — An inseparable extension is outside this construction’s input type.
SemisimpleAlgebrasPartII:SA.1/corestriction-restriction-degree — unrepresented: For finite separable L/K and α∈Br(K), cor_L,K(α_L)=α^[L:K].
SemisimpleAlgebrasPartII:SA.2/sheaf-morita — unrepresented: Let X be a scheme, A a sheaf Azumaya O_X-algebra supplied by the shared key, and P a finite locally free generator with specified A≃End_O(P). Construct inverse O_X-linear functors P⊗− and Hom_A(P,−) between QCoh(X) and QCoh_A(X), with explicit unit and counit.
API: sheafMorita_unit — Hom_A(P,P⊗N)≅N naturally.
API: sheafMorita_counit — P⊗Hom_A(P,M)≅M naturally.
API: sheafMorita_restrict — The functors and adjunction data commute with restriction to opens.
API: sheafMorita_matrix — For P=O_X^n, n>0, the affine specialization is the pinned matrix equivalence.
Tests: rank_one — For A=O_X,P=O_X, the equivalence is identity.
Tests: matrix_rank_two — For P=O_X², the forward object is the matrix column module; annihilator agrees with the scalar module.
Tests: disconnected_rank — On a disconnected base with ranks1 and2, apply local positive rank, not one globally constant rank.
Tests: nongenerator — The zero bundle on a nonempty nontrivial base cannot give an equivalence.
SemisimpleAlgebrasPartII:SA.2/coherent-morita — unrepresented: For X locally noetherian, A locally finite over O_X and splitting generator P finite locally free, the sheaf Morita equivalence restricts to coherent modules. More generally the finitely presented QCoh subcategories are preserved when coherence is not available.
SemisimpleAlgebrasPartII:SA.2/sheaf-support-morita — unrepresented: For any scheme X, closed immersion Y defined by I_Y and splitting generator P, I_Y·M=0 iff I_Y·Hom_A(P,M)=0. Equivalently the two actual O_X-annihilator ideal sheaves agree. No reducedness assumption.
SemisimpleAlgebrasPartII:SA.3/splitting-transition-line — unrepresented: For two splitting generators P,Q of a sheaf Azumaya algebra A, the comparison of their inverse Morita functors is tensoring by the invertible sheaf Hom_A(Q,P), with the evaluation isomorphism fixed. Local ranks are positive and equal on each connected component.
SemisimpleAlgebrasPartII:SA.3/charpoly-line-twist — unrepresented: For a finite locally free O_X-module N and O_X-linear endomorphism t, the characteristic polynomial of id_L⊗t on L⊗N equals that of t for every invertible sheaf L, over arbitrary scheme bases.
SemisimpleAlgebrasPartII:SA.3/morita-characteristic-polynomial — unrepresented: Given a sheaf Azumaya algebra A, A-module M and A-linear endomorphism t, suppose its inverse Morita module is finite locally free of rank r on an étale splitting cover. Define the degree-r monic polynomial in O_X[T] locally as charpoly(Hom_A(P,t)). The coefficients are sections on X after the overlap compatibility has been proved.
API: moritaCharpoly_matrix — For A=M_n(R), M=R^n⊗N and t=id⊗u, the value is charpoly u.
API: moritaCharpoly_changeSplitting — Compatible replacement of splitting generator leaves the polynomial unchanged.
API: moritaCharpoly_baseChange — Pullback carries the polynomial to the coefficient pullback for finite locally free inverse modules.
API: moritaCharpoly_degree — On a rank-r locus it is monic of degree r.
Tests: rank_one_scalar — For rank1 inverse module and scalar b, the polynomial is T−b.
Tests: zero_rank — For M=0 the polynomial is 1, of degree0.
Tests: nonreduced_scalar — Over F₂[ε]/ε², rank1 scalar ε has polynomial T−ε, distinct from T although their squares agree.
Tests: line_twist — Replacing P by P⊗L yields the same polynomial, using the specified transition equivalence.
SemisimpleAlgebrasPartII:SA.4/cartier-brauer-comparison — unrepresented: For a smooth characteristic-p scheme in the exact Cartier setup of EG(A.3), the two-step étale boundary Φ:H⁰(Ω¹)→H²(G_m) is additive and natural for morphisms respecting that relative exact sequence. The differential-operator class satisfies [D]=Φ(θ) only through the Cartier-flow supplier’s OV07 comparison.
SemisimpleAlgebrasPartII:SA.4/relative-brauer-equality — unrepresented: Let Z/k be smooth projective, k perfect of characteristic p>0, with a W₂(k)-lift, and V=Z′_a. On T=Spec k[t]/(t−1)^p let m be cotangent scaling and r the projection. The target is [m*D]=[r*D] on V×T, with an equivalence of module categories carrying chosen splitting data when a refinement is established.
SemisimpleAlgebrasPartII:SA.3/finite-pushforward-morita — unrepresented: Let q:V→B be finite, A split by a free generator of positive rank n, and M=P⊗F. Then q_*M≅(q_*F)^⊕n, respecting every commuting function action from V. If q_*M is finite locally free, q_*F is finite locally free and its componentwise rank is rank(q_*M)/n.
SemisimpleAlgebrasPartII:SA.3/spectral-line-trivialization — unrepresented: For a finite morphism q:V→B and invertible sheaf L on V, after passage to a strictly henselian local base at a point of B, L is free on the resulting semilocal finite algebra. With finite-presentation data this trivialization descends to an étale neighbourhood of that point.
SemisimpleAlgebrasPartII:SA.3/finite-pushforward-line-invariant — unrepresented: For finite q:V→B, F with q_*F finite locally free, and an invertible sheaf L on V, tensoring F by L preserves the characteristic polynomial of every universal commuting function action after q_*. The line is on V and need not be a pullback from B.
SemisimpleAlgebrasPartII:SA.3/morita-higgs-overlap — unrepresented: For a finite spectral morphism V→B and two étale splitting generators of A, the characteristic coefficients of the finite locally free inverse Morita pushforwards agree, including their full symmetric differential coefficients.
SemisimpleAlgebrasPartII:SA.3/morita-higgs-invariant — unrepresented: Given a finite spectral morphism V→B, sheaf Azumaya A on V and A-module M, suppose on étale splitting neighbourhoods the inverse Morita pushforward is finite locally free of rank r with the imported integrable coefficient-valued Higgs action. Construct degree-r monic symmetric characteristic coefficients on B by descent of these actual inverse-module coefficients, without choosing a Frobenius root.
API: moritaHiggsInvariant_local — On a splitting chart the descended coefficients equal the universal Higgs determinant of the actual inverse-module pushforward.
API: moritaHiggsInvariant_changeSplitting — A compatible change of splitting generator leaves every symmetric coefficient unchanged.
API: moritaHiggsInvariant_baseChange — Compatible base change preserving the stated local freeness pulls back all coefficients.
API: moritaHiggsInvariant_power — For local matrix rank n the original pushforward has characteristic polynomial equal to the n-th power of the Morita polynomial and rank nr.
Tests: higgs_scalar_rank_one — For one commuting scalar b the polynomial is λ−b; in several coefficient directions retain each linear coefficient.
Tests: higgs_zero_module — The zero module has invariant1 and rank0.
Tests: higgs_spectral_line — An invertible sheaf on the finite spectral cover, even one not pulled back from the base, preserves all pushed-forward coefficients.
Tests: higgs_nonreduced_root — Over the characteristic-two dual numbers, λ and λ+ε have the same square but different coefficients; the action, rather than its square, selects the invariant.
SemisimpleAlgebrasPartII:SA.3/higgs-invariant-local — unrepresented: On a splitting chart the descended coefficients equal the universal Higgs determinant of the actual inverse-module pushforward.
SemisimpleAlgebrasPartII:SA.3/higgs-invariant-change — unrepresented: A compatible change of splitting generator leaves every symmetric coefficient unchanged.
SemisimpleAlgebrasPartII:SA.3/higgs-invariant-basechange — unrepresented: Compatible base change preserving the stated local freeness pulls back all coefficients.
SemisimpleAlgebrasPartII:SA.3/higgs-invariant-power — unrepresented: For local matrix rank n the original pushforward has characteristic polynomial equal to the n-th power of the Morita polynomial and rank nr.
SemisimpleAlgebrasPartII:SA.4/cartier-middle-image — unrepresented: In the supplied relative four-term sequence, the image of dlog identifies with J=(F_*O_Y^×)/O_Y′^× and yields two short exact sequences: 0→O_Y′^×→F_*O_Y^×→J→0 and 0→J→F_*Z¹_Y/S→Ω¹_Y′/S→0.
SemisimpleAlgebrasPartII:SA.4/cartier-boundary-additivity — unrepresented: For the supplied relative exact sequence and Φ=δ₁∘δ₀ through J, Φ(ω₁+ω₂)=Φ(ω₁)+Φ(ω₂) and Φ(0)=0 in H²_ét(O^×), corresponding to tensor-product Brauer classes under the shared comparison.
SemisimpleAlgebrasPartII:SA.4/cartier-boundary-naturality — unrepresented: A supplied morphism of the full relative Cartier exact sequences, including the units and closed-form maps, commutes with Φ. Base change to a nonreduced parameter scheme requires this exact relative diagram; restriction to a reduced fibre alone is insufficient.
SemisimpleAlgebrasPartII:SA.4/relative-class-vanishing-input — unrepresented: In EGAppendixA.2, with perfect characteristic-p k, a smooth projective W₂-liftable Z, V=Z′_a and T=Spec k[t]/(t−1)^p, prove Φ(m*θ−r*θ)=0 on V×T using a valid relative argument. This is a target with the recorded source gap, not an assumed established theorem.
SemisimpleAlgebrasPartII:SA.4/relative-morita-refinement — unrepresented: With a W₂-lift and an actual compatible splitting of m*D⊗(r*D)^op on V×T, construct the O-linear equivalence between their module categories, carrying its chosen evaluation and identity-fibre comparison. Bare equality of Brauer classes does not choose this splitting or coherence.
-/
