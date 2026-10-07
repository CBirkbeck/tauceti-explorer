/-
This file is not the roadmap and is not exhaustive. The definitive roadmap is
research/blueprint/readmes/CrystallineLocalGlobalCompatibilityCM.md. These statements
suggest Lean forms so that contributors and reviewers converge on names and signatures.
Every proof here is a prototype, and no item is claimed implemented.

Baseline: Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. This file imports only Mathlib.
The four CL.0 objects below expose genuine algebraic cores. Their missing arithmetic
specializations and all omitted signatures are indexed at the end of this file and in
GAP-PROTOTYPE-CL-0 through GAP-PROTOTYPE-CL-9. In particular no smooth, automorphic,
crystalline, Barsotti–Tate, or enhanced derived notion is represented by assumed
propositions. Missing notions must be supplied by their actual owning roadmaps.

Fin (n+n) is used for Fin (2*n) through the canonical arithmetic identification.
The block subgroup specializes to O_v and its local uniformizer; its general ring
formula does not assert openness or compactness for an arbitrary commutative ring.
-/
import Mathlib.Logic.Equiv.Fin.Basic
import Mathlib.Data.Fin.Rev
import Mathlib.LinearAlgebra.Matrix.Permutation
import Mathlib.LinearAlgebra.Matrix.GeneralLinearGroup.Defs
import Mathlib.LinearAlgebra.Matrix.Block
import Mathlib.RepresentationTheory.Basic
import Mathlib.RingTheory.LocalRing.MaximalIdeal.Defs
import Mathlib.RingTheory.Ideal.Quotient.Defs
import Mathlib.RingTheory.Filtration
import Mathlib.NumberTheory.Padics.PadicIntegers
import Mathlib.Algebra.Field.ZMod

noncomputable section
namespace CrystallineCM

/- CL.0/weyl-elements: reuse the existing permutation; plan its Siegel interpretation. -/
abbrev WeylElements (n : ℕ) : Equiv.Perm (Fin (n+n)) := finAddFlip

lemma WeylElements_apply (n : ℕ) (i : Fin (n+n)) :
    ((WeylElements n) i).val = if i.val < n then i.val+n else i.val-n := by
  sorry

lemma WeylElements_involutive (n : ℕ) : Function.Involutive (WeylElements n) := by
  sorry

lemma WeylElements_levi_conjugation {R : Type*} [CommRing R] (n : ℕ)
    (A D : Matrix (Fin n) (Fin n) R) :
    (WeylElements n).permMatrix R *
      (Matrix.reindex finSumFinEquiv finSumFinEquiv (Matrix.fromBlocks A 0 0 D)) *
      (WeylElements n).permMatrix R =
      Matrix.reindex finSumFinEquiv finSumFinEquiv (Matrix.fromBlocks D 0 0 A) := by
  sorry

-- CrystallineCM.WeylElements_test_n_one
example : WeylElements 1 0 = 1 ∧ WeylElements 1 1 = 0 := by
  sorry
-- CrystallineCM.WeylElements_test_n_zero
example : WeylElements 0 = Equiv.refl (Fin (0+0)) := by
  sorry
-- CrystallineCM.WeylElements_test_not_reverse
example : WeylElements 2 0 = 2 ∧ WeylElements 2 1 = 3 ∧
    WeylElements 2 2 = 0 ∧ WeylElements 2 3 = 1 ∧
    WeylElements 2 ≠ Fin.revPerm := by
  sorry

/- CL.0/positive-central-cocharacters: exponents on the t Levi blocks. -/
def PositiveCentralCocharacters (t : ℕ) : AddSubmonoid (Fin t → ℤ) where
  carrier := {a | Antitone a}
  zero_mem' := by sorry
  add_mem' := by sorry

lemma PositiveCentralCocharacters_mem_iff (t : ℕ) (a : Fin t → ℤ) :
    a ∈ PositiveCentralCocharacters t ↔ ∀ i j, i ≤ j → a j ≤ a i := by
  sorry

lemma PositiveCentralCocharacters_add (t : ℕ) (a b : Fin t → ℤ)
    (ha : a ∈ PositiveCentralCocharacters t) (hb : b ∈ PositiveCentralCocharacters t)
    {E : Type*} [Field E] (π : E) (hπ : π ≠ 0) :
    a+b ∈ PositiveCentralCocharacters t ∧
      ∀ i, π ^ ((a+b) i) = π ^ (a i) * π ^ (b i) := by
  sorry

lemma PositiveCentralCocharacters_partial (t k : ℕ) (hk : k ≤ t) :
    (fun i : Fin t => if i.val < k then (1 : ℤ) else 0) ∈
      PositiveCentralCocharacters t := by
  sorry

-- CrystallineCM.PositiveCentralCocharacters_test_two_blocks
example : ![(1 : ℤ),0] ∈ PositiveCentralCocharacters 2 ∧
    ![(-1 : ℤ),-2] ∈ PositiveCentralCocharacters 2 ∧
    ![(0 : ℤ),1] ∉ PositiveCentralCocharacters 2 := by
  sorry
-- CrystallineCM.PositiveCentralCocharacters_test_central_scalar
example (t : ℕ) (a : ℤ) : (fun _ : Fin t => a) ∈ PositiveCentralCocharacters t := by
  sorry
-- CrystallineCM.PositiveCentralCocharacters_test_root_pairing
-- Simple-root pairing is a_i-a_(i+1) under the imported GL block-root dictionary.
example (t : ℕ) (a : Fin (t+1) → ℤ) :
    a ∈ PositiveCentralCocharacters (t+1) ↔
      ∀ i : Fin t, 0 ≤ a i.castSucc - a i.succ := by
  sorry

/- CL.0/parahoric-P-v(b,c): entrywise integral block conditions. -/
def ParahoricPVBC {R : Type*} [CommRing R] (n b c : ℕ) (π : R)
    (hbc : b ≤ c) : Subgroup (Matrix.GeneralLinearGroup (Fin (n+n)) R) where
  carrier := {g | ∀ i j : Fin n,
    g (Fin.natAdd n i) (Fin.castAdd n j) ∈ (Ideal.span {π}) ^ c ∧
    g (Fin.castAdd n i) (Fin.castAdd n j) - (if i=j then 1 else 0) ∈
      (Ideal.span {π}) ^ b ∧
    g (Fin.natAdd n i) (Fin.natAdd n j) - (if i=j then 1 else 0) ∈
      (Ideal.span {π}) ^ b}
  one_mem' := by sorry
  mul_mem' := by sorry
  inv_mem' := by sorry

lemma ParahoricPVBC_mem_iff {R : Type*} [CommRing R] (n b c : ℕ) (π : R)
    (hbc : b ≤ c) (g : Matrix.GeneralLinearGroup (Fin (n+n)) R) :
    g ∈ ParahoricPVBC n b c π hbc ↔ ∀ i j : Fin n,
      g (Fin.natAdd n i) (Fin.castAdd n j) ∈ (Ideal.span {π}) ^ c ∧
      g (Fin.castAdd n i) (Fin.castAdd n j) - (if i=j then 1 else 0) ∈
        (Ideal.span {π}) ^ b ∧
      g (Fin.natAdd n i) (Fin.natAdd n j) - (if i=j then 1 else 0) ∈
        (Ideal.span {π}) ^ b := by
  sorry

lemma ParahoricPVBC_antitone_depth {R : Type*} [CommRing R]
    (n b c b' c' : ℕ) (π : R) (hbc : b ≤ c) (hb'c' : b' ≤ c')
    (hb : b ≤ b') (hc : c ≤ c') :
    ParahoricPVBC n b' c' π hb'c' ≤ ParahoricPVBC n b c π hbc := by
  sorry

-- The surjective block-reduction map with this kernel gives the advertised quotient.
lemma ParahoricPVBC_levi_quotient {R : Type*} [CommRing R] [IsLocalRing R]
    (n b c : ℕ) (π : R) (hπ : π ∈ IsLocalRing.maximalIdeal R)
    (hbc : b ≤ c) (hc : 1 ≤ c) :
    ∃ f : ParahoricPVBC n 0 c π (Nat.zero_le c) →*
      (Matrix.GeneralLinearGroup (Fin n) (R ⧸ (Ideal.span {π}) ^ b) ×
       Matrix.GeneralLinearGroup (Fin n) (R ⧸ (Ideal.span {π}) ^ b)),
      Function.Surjective f ∧ ∀ g, f g = 1 ↔ g.val ∈ ParahoricPVBC n b c π hbc := by
  sorry

-- CrystallineCM.ParahoricPVBC_test_b_zero
example {R : Type*} [CommRing R] (n : ℕ) (π : R)
    (g : Matrix.GeneralLinearGroup (Fin (n+n)) R) :
    g ∈ ParahoricPVBC n 0 1 π (by decide) ↔
      ∀ i j : Fin n, g (Fin.natAdd n i) (Fin.castAdd n j) ∈ Ideal.span {π} := by
  sorry
-- CrystallineCM.ParahoricPVBC_test_n_one
example :
    let u := Matrix.GeneralLinearGroup.mkOfDetNeZero
      (!![(1 : ZMod 3),1;0,1]) (by sorry)
    let l := Matrix.GeneralLinearGroup.mkOfDetNeZero
      (!![(1 : ZMod 3),0;1,1]) (by sorry)
    u ∈ ParahoricPVBC 1 1 1 (0 : ZMod 3) (by decide) ∧
    l ∉ ParahoricPVBC 1 1 1 (0 : ZMod 3) (by decide) := by
  sorry
-- CrystallineCM.ParahoricPVBC_test_diagonal_not_unipotent
example :
    let g := Matrix.GeneralLinearGroup.mkOfDetNeZero
      (!![(2 : ZMod 3),0;0,1]) (by sorry)
    g ∈ ParahoricPVBC 1 0 1 (0 : ZMod 3) (by decide) ∧
    g ∉ ParahoricPVBC 1 1 1 (0 : ZMod 3) (by decide) := by
  sorry

/- CL.0/rescaled-actions: rescale an actual representation by an actual character. -/
def RescaledActions {E G V : Type*} [Field E] [Monoid G] [AddCommGroup V] [Module E V]
    (ρ : Representation E G V) (α : G →* Eˣ) : Representation E G V where
  toFun g := ((α g)⁻¹ : Eˣ).val • ρ g
  map_one' := by sorry
  map_mul' := by sorry

lemma RescaledActions_apply {E G V : Type*} [Field E] [Monoid G]
    [AddCommGroup V] [Module E V] (ρ : Representation E G V) (α : G →* Eˣ)
    (g : G) (x : V) : RescaledActions ρ α g x = ((α g)⁻¹ : Eˣ).val • ρ g x := by
  sorry

lemma RescaledActions_one_mul {E G V : Type*} [Field E] [Monoid G]
    [AddCommGroup V] [Module E V] (ρ : Representation E G V) (α : G →* Eˣ)
    (g h : G) : RescaledActions ρ α 1 = 1 ∧
      RescaledActions ρ α (g*h) = RescaledActions ρ α g * RescaledActions ρ α h := by
  sorry

lemma RescaledActions_intertwiner {E G V W : Type*} [Field E] [Monoid G]
    [AddCommGroup V] [Module E V] [AddCommGroup W] [Module E W]
    (ρ : Representation E G V) (σ : Representation E G W) (α : G →* Eˣ)
    (f : V →ₗ[E] W) (hf : ∀ g x, f (ρ g x) = σ g (f x)) :
    ∀ g x, f (RescaledActions ρ α g x) = RescaledActions σ α g (f x) := by
  sorry

-- CrystallineCM.RescaledActions_test_trivial_character
example {E G V : Type*} [Field E] [Monoid G] [AddCommGroup V] [Module E V]
    (ρ : Representation E G V) : RescaledActions ρ (1 : G →* Eˣ) = ρ := by
  sorry

private def scalarRep : Representation ℚ ℚˣ ℚ where
  toFun g := g.val • LinearMap.id
  map_one' := by sorry
  map_mul' := by sorry

-- CrystallineCM.RescaledActions_test_scalar
example (x : ℚ) :
    RescaledActions scalarRep (MonoidHom.id ℚˣ) (Units.mk0 (2 : ℚ) (by sorry)) x = x := by
  sorry
-- CrystallineCM.RescaledActions_test_inverse_required
example :
    let g := Units.mk0 (2 : ℚ) (by sorry)
    RescaledActions scalarRep (MonoidHom.id ℚˣ) g 1 = 1 ∧
      g.val • (scalarRep g 1) = 4 ∧ g.val • (scalarRep g 1) ≠ 1 := by
  sorry

/- CL.6/lem-4-2-5: exact floor/ceiling numerical bound. -/
lemma degree_shift_bound (n D r q : ℕ) (hr : D ≤ 2*r) (hq : n^2*D/2 ≤ q) :
    n^2*D-q ≤ n^2*r := by
  sorry

-- Odd D and odd unitary dimension test the floor, not a mistaken ceiling premise.
example : 3^2*5-22 ≤ 3^2*3 := by
  sorry

/- CL.3/lem-2-3-18: a quotient of a submodule, with the actual adic quotients. -/
lemma subquotient_mod_p_pow (p : ℕ) [Fact p.Prime]
    {N M : Type*} [AddCommGroup N] [Module ℤ_[p] N] [Module.Finite ℤ_[p] N]
    [AddCommGroup M] [Module ℤ_[p] M] (N' : Submodule ℤ_[p] N)
    (f : N' →ₗ[ℤ_[p]] M) (hf : Function.Surjective f) (m : ℕ) (hm : 1 ≤ m) :
    ∃ m' : ℕ, m ≤ m' ∧
      ∃ T : Submodule ℤ_[p]
        (N ⧸ (((Ideal.span {(p : ℤ_[p])}) ^ m') • (⊤ : Submodule ℤ_[p] N))),
      ∃ g : T →ₗ[ℤ_[p]]
        (M ⧸ (((Ideal.span {(p : ℤ_[p])}) ^ m) • (⊤ : Submodule ℤ_[p] M))),
      Function.Surjective g := by
  sorry

end CrystallineCM

/-
Source-indexed omission catalogue

These are mathematical specifications awaiting genuine supplier carrier types.
The GAP-PROTOTYPE-CL-0 ... CL-9 entries record every omitted signature.
The independent review corrects the conventions, statements, API and tests below;
no omitted statement is an assumed proposition or an implementation claim.

CrystallineLocalGlobalCompatibilityCM:CL.0/lem-2-1-12
OMITTED signature: CrystallineCM.coefficient_evaluation_surjective
Let P_{n,n} ⊂ GL_{2n} be the block upper-triangular parabolic with Levi GL_n × GL_n, so that V_{λ̃_τ} is the evaluation of (Ind_{P_{n,n}}^{GL_{2n}} V_{λ_τ̃} ⊗ V_{−w_{0,n}λ_{τ̃c}})_{/O}. The natural P_{n,n}(O)-equivariant morphism V_{λ̃_τ} → V_{λ_τ̃} ⊗ V_{−w_{0,n}λ_{τ̃c}} given by evaluation of functions at the identity is surjective.
Direct prerequisites: ArithmeticLocallySymmetricSpaces:ALS.1/arithmetic-local-system; PotentialAutomorphyInfrastructure:PA.0/unitary-levi-weight-dictionary; PotentialAutomorphyInfrastructure:PA.0
Source: CN25v3 Lemma 2.1.12, pp.17–18

CrystallineLocalGlobalCompatibilityCM:CL.0/positive-parahoric-monoid
OMITTED signature: CrystallineCM.PositiveParahoricMonoid
Δ̃^Q=⋃_{ν∈X_Q}𝒬ν(ϖ)𝒬⊂G̃(L); Δ^{Q,+}=Δ̃^Q∩G(L), and Δ^Q is obtained by adjoining the inverse of ũ_n to Δ^{Q,+}. The semidirect submonoid acting through P is Δ^{Q,+}⋉U₀. Δ^Q inverts ũ_n, not every positive partial block cocharacter.
Direct prerequisites: CrystallineLocalGlobalCompatibilityCM:CL.0/positive-central-cocharacters; CrystallineLocalGlobalCompatibilityCM:CL.0/parahoric-P-v(b,c)
OMITTED API signature: CrystallineCM.PositiveParahoricMonoid_double_coset — Each g∈𝒬ν(ϖ)𝒬 with ν∈X_Q maps to Δ̃^Q.
OMITTED API signature: CrystallineCM.PositiveParahoricMonoid_levi_intersection — Its intersection with the embedded G(L) is exactly Δ^{Q,+}, with the same multiplication.
OMITTED API signature: CrystallineCM.PositiveParahoricMonoid_localization — A Δ^{Q,+}-action with ũ_n invertible extends uniquely to Δ^Q.
OMITTED example: CrystallineCM.PositiveParahoricMonoid_test_identity — The zero cocharacter gives all of 𝒬, including the identity.
OMITTED example: CrystallineCM.PositiveParahoricMonoid_test_negative_central — ϖ^{-1}1_{2n} belongs because its block-exponent differences are zero.
OMITTED example: CrystallineCM.PositiveParahoricMonoid_test_partial_inverse — For two blocks diag(1_n,ϖ1_n) is not positive although it is invertible in G̃(L); positivity is not the whole group.
Source: CN25v3 §2.1.13, pp.19–20

CrystallineLocalGlobalCompatibilityCM:CL.0/lem-2-1-15
OMITTED signature: CrystallineCM.positive_parahoric_hecke_iso
(1) For ν ∈ X_{Q_{v̄}}, ν(ϖ_{v̄}) is 𝒬_{v̄}-positive: ν(ϖ)(N_Q ∩ 𝒬)ν(ϖ)^{−1} ⊂ N_Q ∩ 𝒬 and ν(ϖ)^{−1}(N̄_Q ∩ 𝒬)ν(ϖ) ⊂ N̄_Q ∩ 𝒬. (2) Δ̃^{Q}_{v̄} is a monoid. (3) [(M_Q ∩ 𝒬)ν(ϖ)(M_Q ∩ 𝒬)] ↦ [𝒬 ν(ϖ) 𝒬] is a ring isomorphism H(M_Q ∩ Δ̃^Q, M_Q ∩ 𝒬) ≅ H(Δ̃^Q, 𝒬), factoring through an isomorphism to H(Δ^{Q,+}, G(F⁺_{v̄}) ∩ 𝒬); in particular H(Δ̃^Q, 𝒬) is commutative.
Direct prerequisites: CrystallineLocalGlobalCompatibilityCM:CL.0/parahoric-P-v(b,c); SmoothRepresentationsOfLocalGroups:SR.4; ArithmeticLocallySymmetricSpaces:ALS.3/hecke-composition; CrystallineLocalGlobalCompatibilityCM:CL.0/positive-parahoric-monoid; CrystallineLocalGlobalCompatibilityCM:CL.0/positive-central-cocharacters
Source: CN25v3 Lemma 2.1.15, p.20; Remark 2.1.16

CrystallineLocalGlobalCompatibilityCM:CL.0/lowest-weight-scaling-character
OMITTED signature: CrystallineCM.LowestWeightScalingCharacter
For the dual Weyl weight λ̃ and Q, define α̃_λ̃:Δ̃^Q→E×, trivial on 𝒬, by α̃_λ̃(ν(ϖ))=∏_τ τ(ϖ)^{⟨ν,w₀^{G̃}λ̃_τ⟩}. Separately define α_λ:Δ^Q→E×, trivial on K_Q, by α_λ(ν(ϖ))=∏_τ τ(ϖ)^{⟨ν,w₀^Gλ̃_τ⟩}, with ν in the actual lower-right/conjugate-dual Levi embedding and w₀^G reversing each n-block. Extend the latter to inverse powers of ũ_n. The two longest Weyl elements differ; equality of α̃ restricted to the Levi and α_λ is not asserted.
Direct prerequisites: CrystallineLocalGlobalCompatibilityCM:CL.0/lem-2-1-15; CrystallineLocalGlobalCompatibilityCM:CL.0/weyl-elements; PotentialAutomorphyInfrastructure:PA.0/unitary-levi-weight-dictionary; CrystallineLocalGlobalCompatibilityCM:CL.0/positive-parahoric-monoid
OMITTED API signature: CrystallineCM.LowestWeightScalingCharacter_compact — α̃(q)=1 for q∈𝒬.
OMITTED API signature: CrystallineCM.LowestWeightScalingCharacter_cocharacter — α̃(ν(ϖ))=∏_τ τ(ϖ)^{⟨ν,w₀λ̃_τ⟩}.
OMITTED API signature: CrystallineCM.LowestWeightScalingCharacter_mul — Each of α̃ and α_λ is multiplicative on its own monoid; the Levi character extends uniquely when ũ_n is inverted. Their relation in coefficient comparison uses the explicit w₀^P block exchange, rather than equality by restriction.
OMITTED example: CrystallineCM.LowestWeightScalingCharacter_test_zero_weight — For λ̃=0, α̃ is the trivial character.
OMITTED example: CrystallineCM.LowestWeightScalingCharacter_test_rank_one — For GL₂, λ̃=(a,b) and ν=(1,0), α̃(ν(ϖ))=ϖ^b at the identity embedding.
OMITTED example: CrystallineCM.LowestWeightScalingCharacter_test_compact_value — A compact parahoric element has α̃=1, agreeing with the original integral lattice action.
OMITTED example: CrystallineCM.LowestWeightScalingCharacter_test_distinct_weyl — For n=2, λ̃=(1,1,0,0) and ν=(1,1,0,0), α̃(ν(ϖ))=1 while α_λ(ν(ϖ))=ϖ² at one embedding. Equality by restriction would fail this allowed Siegel example.
Source: CN25v3 §2.1.13, p.20 (unitary character); CN25v3 §2.1.13, p.21 (Levi character)

CrystallineLocalGlobalCompatibilityCM:CL.0/lem-2-1-17
OMITTED signature: CrystallineCM.rescaled_lattice_stable
For v̄ ∈ S̄ and τ ∈ Hom(F⁺_{v̄},E), the lattice V_{λ̃_τ} is stable under the rescaled action (2.1.7) of O[Δ̃^{Q}_{v̄}].
Direct prerequisites: CrystallineLocalGlobalCompatibilityCM:CL.0/rescaled-actions; CrystallineLocalGlobalCompatibilityCM:CL.0/lem-2-1-12; PotentialAutomorphyInfrastructure:PA.0
Source: CN25v3 Lemma 2.1.17, p.20

CrystallineLocalGlobalCompatibilityCM:CL.0/lem-2-1-21
OMITTED signature: CrystallineCM.residual_central_hecke_eigenvalue
Let m ⊂ T^T(K,λ) be as in thm-2-1-20 with k = k(m), and v a p-adic place of F. Then the Hecke operator U_v has a unique eigenvalue on H^*(X_K, V_λ/ϖ)_m, equal to ε̄_p^{n(n−1)/2}(Art_{F_v}(ϖ_v)) · det ρ̄_m(Art_{F_v}(ϖ_v)).
Direct prerequisites: IntegralHeckeAndGaloisDeterminants:IHG.5; IntegralHeckeAndGaloisDeterminants:IHG.3/gln-satake-coefficients; ArithmeticLocallySymmetricSpaces:ALS.3/hecke-operator-formula; ArithmeticLocallySymmetricSpaces:ALS.3
Source: CN25v3 Lemma 2.1.21, pp.22–23

CrystallineLocalGlobalCompatibilityCM:CL.1/p-ordinary-finite-level
OMITTED signature: CrystallineCM.POrdinaryFiniteLevel
Fix S̄ ⊂ S̄_p and good K̃ with fixed tame level and K̃_{v̄} = P_{v̄}(b,c) (c ≥ b ≥ 0, c ≥ 1) for v̄ ∈ S̄, written K̃(b,c), P_{S̄}(b,c) := ∏_{v̄∈S̄} P_{v̄}(b,c). The P-ordinary part RΓ(X̃_{K̃(b,c)}, V_λ̃)^{ord} is the maximal direct summand of RΓ(X̃_{K̃(b,c)}, V_λ̃) on which all Ũ_{ṽ,n} (v̄ ∈ S̄) act invertibly; it is an object of D⁺(P_{S̄}(0,c)/P_{S̄}(b,c), O) with an action of T̃^T ⊗ (⊗_{v̄∈S̄} H(Δ̃_{v̄}, K̃_{v̄})[Ũ^{−1}_{ṽ,n}]); likewise for ∂X̃_{K̃(b,c)}.
Direct prerequisites: CrystallineLocalGlobalCompatibilityCM:CL.0/parahoric-P-v(b,c); CrystallineLocalGlobalCompatibilityCM:CL.0/rescaled-actions; CrystallineLocalGlobalCompatibilityCM:CL.0/lem-2-1-17; PadicFamilies:L0a/derived-ordinary-idempotent; PadicFamilies:L0a/ordinary-part-complexes; ArithmeticLocallySymmetricSpaces:ALS.1/finite-complex-model
OMITTED API signature: CrystallineCM.POrdinaryFiniteLevel_idempotent — The finite or adic ordinary projector on the arithmetic complex is idempotent and commutes with the tame Hecke and quotient-group actions.
OMITTED API signature: CrystallineCM.POrdinaryFiniteLevel_cohomology — Its cohomology is the maximal summand of H^q on which every chosen Ũ_n acts bijectively.
OMITTED API signature: CrystallineCM.POrdinaryFiniteLevel_pullback — Level pullback maps commuting with Ũ_n restrict to the ordinary summands; its inclusion is a natural split map.
OMITTED example: CrystallineCM.POrdinaryFiniteLevel_test_unit — For U=id the whole arithmetic coefficient complex is ordinary.
OMITTED example: CrystallineCM.POrdinaryFiniteLevel_test_zero — For U=0 the ordinary summand is zero.
OMITTED example: CrystallineCM.POrdinaryFiniteLevel_test_mixed — For diag(1,0) on F₃² in degree zero, the ordinary part is the first coordinate, in agreement with Mathlib Fitting range/ker.
Source: CN25v3 §2.2.1, pp.25–26

CrystallineLocalGlobalCompatibilityCM:CL.1/unipotent-transfer-action
OMITTED signature: CrystallineCM.UnipotentTransferAction
For contracting g∈Δ⁺ and π smooth on Δ⁺⋉U₀, act on Γ(U₀,π) by T_g(v)=Σ_{n∈U₀/gU₀g^{-1}}ngv. This is independent of coset representatives, is integral without averaging denominators, and is multiplicative in g. Derive the same action on RΓ(U₀,π).
Direct prerequisites: SmoothRepresentationsOfLocalGroups:SR.0:abelian-category; tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-10-continuous-cohomology-in-all-degrees; CrystallineLocalGlobalCompatibilityCM:CL.0/parahoric-P-v(b,c)
OMITTED API signature: CrystallineCM.UnipotentTransferAction_independent — Replacing any representative n by an element of its same left coset does not change T_g on U₀-invariants.
OMITTED API signature: CrystallineCM.UnipotentTransferAction_mul — T_{gh}=T_g∘T_h and T_1=id.
OMITTED API signature: CrystallineCM.UnipotentTransferAction_compact — When g normalizes U₀, T_g is the usual g-action because the quotient has one element.
OMITTED example: CrystallineCM.UnipotentTransferAction_test_trivial_u — For U₀=1 the transfer action is the original g-action.
OMITTED example: CrystallineCM.UnipotentTransferAction_test_index_p — For U₀=Z_p,g contracting by p and trivial F_p coefficients, T_g=p·id=0.
OMITTED example: CrystallineCM.UnipotentTransferAction_test_not_raw — In this index-p example raw g=id would incorrectly make it ordinary.
Source: CN25v3 §2.2.2, equation (2.2.1), p.26

CrystallineLocalGlobalCompatibilityCM:CL.1/ordinary-monoid-localization
OMITTED signature: CrystallineCM.OrdinaryMonoidLocalization
For smooth Δ⁺-modules over R_m, ord is the filtered colimit under products of the commuting central operators ũ_n, regarded as a smooth Δ-module. It is exact and preserves the injectives needed to derive compact invariants. Do not replace it by a finite-projector formula for arbitrary smooth infinite modules.
Direct prerequisites: SmoothRepresentationsOfLocalGroups:SR.0:abelian-category; IntegralHeckeAndGaloisDeterminants:IHG.2/ordinary-localization-comparison
OMITTED API signature: CrystallineCM.OrdinaryMonoidLocalization_unit — Every smooth π maps naturally to ord π by the filtered-colimit structure map.
OMITTED API signature: CrystallineCM.OrdinaryMonoidLocalization_universal — Maps from π into a Δ-module extend uniquely through ord π.
OMITTED API signature: CrystallineCM.OrdinaryMonoidLocalization_cohomology — Exact localization satisfies H^j(ord C)=ord H^j(C), with the same operator action.
OMITTED example: CrystallineCM.OrdinaryMonoidLocalization_test_id — Localization under U=id is π itself.
OMITTED example: CrystallineCM.OrdinaryMonoidLocalization_test_nilpotent — If U^r=0, ord π=0 even when π is infinite-dimensional.
OMITTED example: CrystallineCM.OrdinaryMonoidLocalization_test_finite — On a finite module it agrees with the imported finite ordinary projector; for diag(1,0) it is the first coordinate.
Source: CN25v3 §2.2.2, p.26

CrystallineLocalGlobalCompatibilityCM:CL.1/p-ordinary-functors
OMITTED signature: CrystallineCM.POrdinaryFunctors
For π smooth over R_m=O/ϖ^m on Δ̃^{Q,+}, define POrd(π)=ord RΓ(U₀,π) in D⁺_sm(Δ,R_m), where U₀-invariants carry the finite-sum transfer action and ord localizes only the commuting ũ_n operators. Products over selected places give the global local functor. This is a derived functor with a Δ-action; its degree zero is ord Γ(U₀,π).
Direct prerequisites: CrystallineLocalGlobalCompatibilityCM:CL.0/parahoric-P-v(b,c); SmoothRepresentationsOfLocalGroups:SR.0:abelian-category; tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-10-continuous-cohomology-in-all-degrees; IntegralHeckeAndGaloisDeterminants:IHG.2/ordinary-localization-comparison; CrystallineLocalGlobalCompatibilityCM:CL.1/unipotent-transfer-action; CrystallineLocalGlobalCompatibilityCM:CL.1/ordinary-monoid-localization; mathlib:DerivedCategory; CrystallineLocalGlobalCompatibilityCM:CL.0/positive-parahoric-monoid
OMITTED API signature: CrystallineCM.POrdinaryFunctors_degree_zero — H⁰(POrd π)=ord Γ(U₀,π) for π in degree zero.
OMITTED API signature: CrystallineCM.POrdinaryFunctors_derived_action — Each contracting element acts by derived restriction/finite-index transfer, not by its raw representation action.
OMITTED API signature: CrystallineCM.POrdinaryFunctors_comparison — For U₀ trivial, POrd π is ordinary monoid localization of π, with no cohomological shift.
OMITTED example: CrystallineCM.POrdinaryFunctors_test_trivial_u — If U₀=1 it equals the ordinary localization with no shift.
OMITTED example: CrystallineCM.POrdinaryFunctors_test_nilpotent — A nonzero π with transfer U nilpotent has zero POrd; merely taking U₀-invariants gives the wrong functor.
OMITTED example: CrystallineCM.POrdinaryFunctors_test_degree_zero — For π in degree zero H⁰ is ord Γ(U₀,π), while positive cohomology is retained when ordinary transfer permits it.
Source: CN25v3 Definition 2.2.3, pp.26–27

CrystallineLocalGlobalCompatibilityCM:CL.1/lem-2-2-4
OMITTED signature: CrystallineCM.ordinary_commutes_compact_invariants
There is a natural isomorphism ord_b ∘ Γ(K_{S̄}(b),−) ≅ Γ(K_{S̄}(b),−) ∘ ord of functors Mod_sm(Δ⁺_{S̄}, O/ϖ^m) → Mod(Δ_{S̄}/K_{S̄}(b), O/ϖ^m), extending to derived functors ord_b ∘ RΓ(K_{S̄}(b),−) ≅ RΓ(K_{S̄}(b),−) ∘ ord.
Direct prerequisites: CrystallineLocalGlobalCompatibilityCM:CL.1/p-ordinary-functors; PadicFamilies:L0a/ordinary-projector-natural
Source: CN25v3 Lemma 2.2.4, p.27

CrystallineLocalGlobalCompatibilityCM:CL.1/lem-2-2-5
OMITTED signature: CrystallineCM.ordinary_parahoric_invariants
For all c ≥ b ≥ 0 with c ≥ 1 there is a natural isomorphism ord_b ∘ Γ(U⁰_{S̄} ⋊ K_{S̄}(b), −) ≅ ord_b ∘ Γ(P_{S̄}(b,c), −) of functors Mod_sm(Δ̃_{S̄}, O/ϖ^m) → Mod(Δ_{S̄}/K_{S̄}(b), O/ϖ^m).
Direct prerequisites: CrystallineLocalGlobalCompatibilityCM:CL.1/p-ordinary-functors; CrystallineLocalGlobalCompatibilityCM:CL.0/parahoric-P-v(b,c)
Source: CN25v3 Lemma 2.2.5, p.27

CrystallineLocalGlobalCompatibilityCM:CL.1/lem-2-2-6
OMITTED signature: CrystallineCM.derived_ordinary_level_comparison
For π ∈ D⁺_sm(Δ̃_{S̄}, O/ϖ^m) and c ≥ b ≥ 0, c ≥ 1, there is a natural isomorphism RΓ(K_{S̄}(b), ord RΓ(U⁰_{S̄}, π)) ≅ ord_b RΓ(P_{S̄}(b,c), π) in D⁺(Δ_{S̄}/K_{S̄}(b), O/ϖ^m).
Direct prerequisites: CrystallineLocalGlobalCompatibilityCM:CL.1/lem-2-2-4; CrystallineLocalGlobalCompatibilityCM:CL.1/lem-2-2-5; tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-10-continuous-cohomology-in-all-degrees; SmoothRepresentationsOfLocalGroups:SR.0:abelian-category
Source: CN25v3 Lemma 2.2.6, p.28

CrystallineLocalGlobalCompatibilityCM:CL.1/p-ordinary-completed
OMITTED signature: CrystallineCM.POrdinaryCompleted
π(K̃^{S̄}, λ̃, m) := RΓ(K̃^{S̄}, RΓ(𝔛̄_{G̃}, V_λ̃/ϖ^m)) ∈ D⁺_sm(Δ̃_{S̄}, O/ϖ^m) with T̃^T-action (using lem-2-1-8), satisfying RΓ(P_{S̄}(b,c), π(K̃^{S̄},λ̃,m)) ≅ RΓ(X̃_{K̃(b,c)}, V_λ̃/ϖ^m); π^{ord}(K̃^{S̄},λ̃,m) ∈ D⁺_sm(Δ_{S̄}, O/ϖ^m) is its P-ordinary part (Definition 2.2.3), and π^{ord}_∂ the boundary analogue.
Direct prerequisites: CrystallineLocalGlobalCompatibilityCM:CL.1/p-ordinary-functors; ArithmeticLocallySymmetricSpaces:ALS.6; ArithmeticLocallySymmetricSpaces:ALS.3/discrete-topological-comparison
OMITTED API signature: CrystallineCM.POrdinaryCompleted_sections — The underlying completed object is RΓ(K̃^{S̄},RΓ(𝔛̄_{G̃},V/ϖ^m)); its POrd is the object defined by the local functor.
OMITTED API signature: CrystallineCM.POrdinaryCompleted_tame — Tame Hecke correspondences act and commute with the local ordinary operators.
OMITTED API signature: CrystallineCM.POrdinaryCompleted_boundary — Restriction to boundary intertwines the two completed POrd objects and the finite-level recovery maps.
OMITTED example: CrystallineCM.POrdinaryCompleted_test_empty_places — With S̄=∅ no ordinary operators are imposed and the object is the completed tame-level coefficient complex.
OMITTED example: CrystallineCM.POrdinaryCompleted_test_level_recovery — For b=0,c=1, compact Levi invariants recover Siegel-parahoric ordinary finite-level cohomology.
OMITTED example: CrystallineCM.POrdinaryCompleted_test_boundary — Boundary restriction commutes with the same level-recovery square, rather than defining completed boundary cohomology as a quotient of interior cohomology.
Source: CN25v3 §2.2.7, p.28

CrystallineLocalGlobalCompatibilityCM:CL.1/prop-2-2-8
OMITTED signature: CrystallineCM.completed_ordinary_finite_level
For m ≥ 1 and c ≥ b ≥ 0, c ≥ 1, there is a natural T̃^T-equivariant isomorphism RΓ(K_{S̄}(b), π^{ord}(K̃^{S̄},λ̃,m)) ≅ RΓ(X̃_{K̃(b,c)}, V_λ̃/ϖ^m)^{ord} in D⁺(K_{S̄}/K_{S̄}(b), O/ϖ^m).
Direct prerequisites: CrystallineLocalGlobalCompatibilityCM:CL.1/lem-2-2-6; CrystallineLocalGlobalCompatibilityCM:CL.1/p-ordinary-completed; CrystallineLocalGlobalCompatibilityCM:CL.1/p-ordinary-finite-level
Source: CN25v3 Proposition 2.2.8, p.28

CrystallineLocalGlobalCompatibilityCM:CL.1/cor-2-2-9
OMITTED signature: CrystallineCM.ordinary_independence_level
For m ≥ 1 and c ≥ b ≥ 0, c ≥ 1, the natural T̃^T-equivariant morphism RΓ(X̃_{K̃(b,max{1,b})}, V_λ̃/ϖ^m)^{ord} → RΓ(X̃_{K̃(b,c)}, V_λ̃/ϖ^m)^{ord} is an isomorphism in D⁺(K_{S̄}/K_{S̄}(b), O/ϖ^m); the same holds for the Borel–Serre boundary.
Direct prerequisites: CrystallineLocalGlobalCompatibilityCM:CL.1/prop-2-2-8; ArithmeticLocallySymmetricSpaces:ALS.1/level-pullback
Source: CN25v3 Corollary 2.2.9, p.28

CrystallineLocalGlobalCompatibilityCM:CL.1/prop-2-2-10
OMITTED signature: CrystallineCM.completed_boundary_ordinary_finite_level
For m ≥ 1 and c ≥ b ≥ 0, c ≥ 1, RΓ(K_{S̄}(b), π^{ord}_∂(K̃^{S̄},λ̃,m)) ≅ RΓ(∂X̃_{K̃(b,c)}, V_λ̃/ϖ^m)^{ord}, T̃^T-equivariantly, in D⁺(K_{S̄}/K_{S̄}(b), O/ϖ^m).
Direct prerequisites: CrystallineLocalGlobalCompatibilityCM:CL.1/lem-2-2-6; CrystallineLocalGlobalCompatibilityCM:CL.1/p-ordinary-completed; ArithmeticLocallySymmetricSpaces:ALS.4/boundary-triangle
Source: CN25v3 Proposition 2.2.10, p.29

CrystallineLocalGlobalCompatibilityCM:CL.1/parahoric-variant
OMITTED signature: CrystallineCM.ParahoricVariant
For standard Q_{v̄}⊂P_{v̄}, with 𝒬_{v̄} its integral parahoric and K_{v̄}=𝒬_{v̄}∩G(F⁺_{v̄}), define the parahoric P-ordinary invariant functor π↦RΓ(K_{S̄},ord RΓ(U₀_{S̄},π)). It takes values in D⁺(K_{S̄}[ũ_n^{±1}]/K_{S̄},O/ϖ^m) with H(Δ^{Q_{S̄}},K_{S̄}) action. Here ord inverts ũ_n alone; it does not invert every Q-partial Hecke operator.
Direct prerequisites: CrystallineLocalGlobalCompatibilityCM:CL.1/p-ordinary-functors; CrystallineLocalGlobalCompatibilityCM:CL.0/lem-2-1-15; tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-10-continuous-cohomology-in-all-degrees; CrystallineLocalGlobalCompatibilityCM:CL.0/positive-parahoric-monoid
OMITTED API signature: CrystallineCM.ParahoricVariant_invariants — Its value is RΓ(K_Q,ord RΓ(U₀,π)), with ord inverting ũ_n alone.
OMITTED API signature: CrystallineCM.ParahoricVariant_hecke — [K_QνK_Q] acts through finite correspondences even when K_Q is not normal in the monoid.
OMITTED API signature: CrystallineCM.ParahoricVariant_siegel — For Q=P this specializes to the Siegel P-ordinary invariant functor and Lemma 2.2.6 level comparison.
OMITTED example: CrystallineCM.ParahoricVariant_test_siegel — For Q=P the value agrees with Siegel P-ordinary invariants.
OMITTED example: CrystallineCM.ParahoricVariant_test_finite_level — At Q=P,b=0,c=1 its completed-tower value identifies with Siegel-parahoric finite-level ordinary cohomology by Proposition 2.2.8.
OMITTED example: CrystallineCM.ParahoricVariant_test_not_full_qord — In the partition (1,1,1,1), inverting Ũ² alone does not imply Ũ¹ and Ũ³ have unit eigenvalues.
Source: CN25v3 §2.2.11, p.29

CrystallineLocalGlobalCompatibilityCM:CL.1/lem-2-2-12
OMITTED signature: CrystallineCM.ordinary_parahoric_hecke_comparison
For π ∈ D⁺_sm(Δ̃^{Q_S̄}_{S̄}, O/ϖ^m) there is a natural isomorphism RΓ(K_{S̄}, ord RΓ(U⁰_{S̄}, π)) ≅ ord₀ RΓ(𝒬_{S̄}, π) in D⁺_sm(K_{S̄}[ũ^{±1}_{ṽ,n}]/K_{S̄}, O/ϖ^m), under which [K_{v̄} ν(ϖ_{v̄}) K_{v̄}] ∈ H(Δ^{Q_S̄}_{S̄}, K_{S̄}) matches [𝒬_{v̄} ν(ϖ_{v̄}) 𝒬_{v̄}].
Direct prerequisites: CrystallineLocalGlobalCompatibilityCM:CL.1/parahoric-variant; CrystallineLocalGlobalCompatibilityCM:CL.1/lem-2-2-6; ArithmeticLocallySymmetricSpaces:ALS.3/hecke-action-on-invariants
Source: CN25v3 Lemma 2.2.12, pp.29–30

CrystallineLocalGlobalCompatibilityCM:CL.2/lem-2-2-14
OMITTED signature: CrystallineCM.levi_coefficient_tensor
Under the identification of K_{S̄} with the block-diagonal Levi of ∏_{v̄∈S̄} P_{n,n}(O_{F_ṽ}) (via (A_ṽ, A_{ṽc}) ↦ diag((Ψ_n ᵗA^{−1}_{ṽc} Ψ_n)^c, A_ṽ)), V_{λ_S̄} ≅ ⊗_{v̄∈S̄} ⊗_{τ∈Hom(F⁺_{v̄},E),O} V_{−w_{0,n}λ_{τ̃c}} ⊗ V_{λ_τ̃}, with both factors acted on through τ̃.
Direct prerequisites: PotentialAutomorphyInfrastructure:PA.0/unitary-levi-weight-dictionary; ArithmeticLocallySymmetricSpaces:ALS.1/arithmetic-local-system
Source: CN25v3 Lemma 2.2.14, p.30

CrystallineLocalGlobalCompatibilityCM:CL.2/lem-2-2-16
OMITTED signature: CrystallineCM.evaluation_kernel_nilpotent
Let τ ∈ Hom(F⁺_{v̄},E) and K_{λ̃_τ} := ker(V_{λ̃_τ} → V_{λ_τ̃} ⊗ V_{−w_{0,n}λ_{τ̃c}}) be the kernel of evaluation at the identity. For every m ≥ 1, (ũ_{ṽ,n})^m (K_{λ̃_τ}/ϖ^m) = 0 (for the rescaled action).
Direct prerequisites: CrystallineLocalGlobalCompatibilityCM:CL.0/lem-2-1-12; CrystallineLocalGlobalCompatibilityCM:CL.0/rescaled-actions; CrystallineLocalGlobalCompatibilityCM:CL.0/lem-2-1-17; PotentialAutomorphyInfrastructure:PA.0
Source: CN25v3 Lemma 2.2.16, pp.31–32

CrystallineLocalGlobalCompatibilityCM:CL.2/prop-2-2-15
OMITTED signature: CrystallineCM.ordinary_independence_weight
Given dominant λ̃ for G̃ and S̄ ⊆ S̄_p, let λ̃^{S̄} be λ̃ with λ̃_τ replaced by 0 for τ inducing places of S̄, and identify λ̃ with λ via (2.1.4). For every m ≥ 1 there is a natural T̃^T-equivariant isomorphism π^{ord}(K̃^{S̄}, λ̃, m) ≅ π^{ord}(K̃^{S̄}, λ̃^{S̄}, m) ⊗ V_{w₀^P λ_S̄}/ϖ^m in D⁺_sm(Δ^{Q_S̄}_{S̄}, O/ϖ^m).
Direct prerequisites: CrystallineLocalGlobalCompatibilityCM:CL.0/lem-2-1-12; CrystallineLocalGlobalCompatibilityCM:CL.2/lem-2-2-14; CrystallineLocalGlobalCompatibilityCM:CL.2/lem-2-2-16; CrystallineLocalGlobalCompatibilityCM:CL.1/p-ordinary-completed; CrystallineLocalGlobalCompatibilityCM:CL.1/lem-2-2-12; SmoothRepresentationsOfLocalGroups:SR.2
Source: CN25v3 Proposition 2.2.15, p.31

CrystallineLocalGlobalCompatibilityCM:CL.2/prop-2-2-17
OMITTED signature: CrystallineCM.boundary_ordinary_independence_weight
With λ̃^{S̄} as in prop-2-2-15, π^{ord}_∂(K̃^{S̄}, λ̃, m) ≅ π^{ord}_∂(K̃^{S̄}, λ̃^{S̄}, m) ⊗ V_{w₀^Pλ_S̄}/ϖ^m, T̃^T-equivariantly in D⁺_sm(Δ^{Q_S̄}_{S̄}, O/ϖ^m).
Direct prerequisites: CrystallineLocalGlobalCompatibilityCM:CL.2/prop-2-2-15; CrystallineLocalGlobalCompatibilityCM:CL.1/prop-2-2-10
Source: CN25v3 Proposition 2.2.17, p.32

CrystallineLocalGlobalCompatibilityCM:CL.2/dual-p-ordinary
OMITTED signature: CrystallineCM.DualPOrdinary
For v̄ ∈ S̄, ord^∨ and ord^∨₀ are defined using the Hecke action of ũ^{−1}_{ṽ,n} on invariants under Ū¹_{v̄} (the block strictly lower triangular part of the parahoric P_{v̄}) and 𝒬_{v̄}, for representations of the inverse monoid (Δ̃^{Q}_{v̄})^{−1} = ⊔_ν 𝒬 ν(ϖ)^{−1} 𝒬; an independence-of-weight statement for dual coefficients follows the proof of prop-2-2-15 using 0 → V^∨_{w₀^Pλ_S̄} → V^∨_{λ̃_S̄} → K^∨_{λ̃_S̄} → 0 and topological nilpotence of ũ^{−1}_{ṽ,n} on K^∨.
Direct prerequisites: CrystallineLocalGlobalCompatibilityCM:CL.1/parahoric-variant; CrystallineLocalGlobalCompatibilityCM:CL.2/prop-2-2-15; ArithmeticLocallySymmetricSpaces:ALS.5:finite-level-duality/hecke-adjoint-duality
OMITTED API signature: CrystallineCM.DualPOrdinary_inverse_operator — The ordinary transition operator is the double coset ũ_n^{-1} acting on lower-congruence Ū¹-invariants.
OMITTED API signature: CrystallineCM.DualPOrdinary_conjugation — Conjugation by ũ_n^{-1}w₀^P identifies the lower and upper invariants, retaining inverse monoids.
OMITTED API signature: CrystallineCM.DualPOrdinary_dual_pairing — The finite-level coefficient evaluation pairing intertwines [KgK] with [Kg^{-1}K].
OMITTED example: CrystallineCM.DualPOrdinary_test_trivial_weight — At zero weight the inverse-monoid construction still uses Ū¹ and ũ_n^{-1}; it does not change to the upper ordinary functor automatically.
OMITTED example: CrystallineCM.DualPOrdinary_test_lower_congruence — At n=1, Ū¹ consists of (1 0;c 1) with c divisible by the local uniformizer.
OMITTED example: CrystallineCM.DualPOrdinary_test_adjoints — For an invertible double coset the dual pairing sends its adjoint to g^{-1}, as in the ALS Hecke-adjoint declaration.
Source: CN25v3 §2.2.18, pp.32–33

CrystallineLocalGlobalCompatibilityCM:CL.2/lem-2-2-19
OMITTED signature: CrystallineCM.dual_ordinary_parahoric_comparison
For π ∈ D⁺_sm((Δ̃^{Q}_{v̄})^{−1}, O/ϖ^m) there is a natural isomorphism RΓ(K_{v̄}, ord^∨ RΓ(Ū¹_{v̄}, π)) ≅ ord^∨₀ RΓ(𝒬_{v̄}, π) in D⁺_sm(K_{v̄}[ũ^{±1}_{ṽ,n}]/K_{v̄}, O/ϖ^m), matching [K ν(ϖ)^{−1} K] with [𝒬 ν(ϖ)^{−1} 𝒬].
Direct prerequisites: CrystallineLocalGlobalCompatibilityCM:CL.2/dual-p-ordinary; CrystallineLocalGlobalCompatibilityCM:CL.1/lem-2-2-12
Source: CN25v3 Lemma 2.2.19, p.32

CrystallineLocalGlobalCompatibilityCM:CL.3/lem-2-3-2
OMITTED signature: CrystallineCM.relative_bruhat_local_closure
Let L be a p-adic field and G/O_L split connected reductive with split maximal torus T ⊂ B ⊂ P = M ⋉ U; W^P ⊂ W the minimal length representatives of W_P\W and ^PW^P := W^P ∩ (W^P)^{−1}. Then G(L) = ⊔_{w∈^PW^P} P(L)wP(L); the closure of P(L)wP(L) (p-adic topology) is ⊔_{w′≤w} P(L)w′P(L) for the Bruhat order; and P(L)ΩP(L) is open for every upper subset Ω ⊂ ^PW^P.
Direct prerequisites: PotentialAutomorphyInfrastructure:PA.2/relative-bruhat-cells; SmoothRepresentationsOfLocalGroups:SR.2; tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory
Source: CN25v3 §2.3.1, Lemma 2.3.2, p.33

CrystallineLocalGlobalCompatibilityCM:CL.3/induction-filtration-functors
OMITTED signature: CrystallineCM.InductionFiltrationFunctors
For a smooth P(L)-module π, define I_{≥i}(π) as locally constant functions on G_{≥i}=⋃_{ℓ(w)≥i}P(L)wP(L), compactly supported modulo P(L), satisfying f(pg)=pf(g), with right P(L)-translation. This is unnormalized induction on the open Bruhat union. I_{≥0} is Res_P Ind_P^{G̃}. The individual stratum and open-cell functors are separate declarations.
Direct prerequisites: CrystallineLocalGlobalCompatibilityCM:CL.3/lem-2-3-2; SmoothRepresentationsOfLocalGroups:SR.2; SmoothRepresentationsOfLocalGroups:SR.0:abelian-category
OMITTED API signature: CrystallineCM.InductionFiltrationFunctors_zero — I_{≥0}(π)=Res_P Ind_P^{G̃}(π) in unnormalized conventions.
OMITTED API signature: CrystallineCM.InductionFiltrationFunctors_inclusion — Extension by zero gives I_{≥i+1}(π)→I_{≥i}(π).
OMITTED API signature: CrystallineCM.InductionFiltrationFunctors_restriction — Restriction to length-i strata gives I_{≥i}(π)→⊕_{ℓ(w)=i}I_w(π).
OMITTED example: CrystallineCM.InductionFiltrationFunctors_test_zero_index — I_{≥0} equals unnormalized parabolic induction restricted to P.
OMITTED example: CrystallineCM.InductionFiltrationFunctors_test_above_length — If i exceeds the maximum relative Bruhat length, I_{≥i}=0.
OMITTED example: CrystallineCM.InductionFiltrationFunctors_test_rank_one — For GL₂ with Borel P the two Bruhat cells give a nonempty open-cell stage and an identity-cell quotient; reversing ≥ to ≤ would reverse these.
Source: CN25v3 §2.3.1, p.34

CrystallineLocalGlobalCompatibilityCM:CL.3/bruhat-stratum-induction
OMITTED signature: CrystallineCM.BruhatStratumInduction
For w∈^PW^P, I_w(π) consists of locally constant functions f:P(L)wP(L)→π compactly supported modulo left P(L), with f(pg)=pf(g); right P(L) acts by translation. It is one summand of the length-ℓ(w) quotient I_{≥ℓ(w)}/I_{≥ℓ(w)+1}, whose full quotient is the sum over all strata of that length; it retains the local topology.
Direct prerequisites: CrystallineLocalGlobalCompatibilityCM:CL.3/induction-filtration-functors
OMITTED API signature: CrystallineCM.BruhatStratumInduction_equivariance — Each f satisfies f(pg)=pf(g) on its stratum.
OMITTED API signature: CrystallineCM.BruhatStratumInduction_translation — Right translation gives the P(L)-action and is compatible with compact-mod-P support.
OMITTED API signature: CrystallineCM.BruhatStratumInduction_restriction — The length-i quotient of I_{≥i} restricts to the direct sum of the I_w with ℓ(w)=i.
OMITTED example: CrystallineCM.BruhatStratumInduction_test_identity — For w=1 the stratum is P(L), and equivariant functions are determined by their value at 1.
OMITTED example: CrystallineCM.BruhatStratumInduction_test_empty_support — A function with empty support is the zero element.
OMITTED example: CrystallineCM.BruhatStratumInduction_test_unnormalized — For a nontrivial modulus, inserting δ_P^{1/2} into f(pg)=pf(g) changes the object and fails the integral coefficient definition.
Source: CN25v3 §2.3.1, p.34

CrystallineLocalGlobalCompatibilityCM:CL.3/bruhat-open-cell-induction
OMITTED signature: CrystallineCM.BruhatOpenCellInduction
I°_w(π) is the submodule of I_w(π) with support in S°_w=P(L)wM(L)U₀. It has the right-translation action of M(L)⁺⋉U₀ and extends by zero to I_w. For w=w₀^P its derived U₀-invariants evaluate to π^{w₀^P}.
Direct prerequisites: CrystallineLocalGlobalCompatibilityCM:CL.3/bruhat-stratum-induction
OMITTED API signature: CrystallineCM.BruhatOpenCellInduction_extend_zero — Extension by zero gives an injective M⁺⋉U₀-equivariant map I°_w→I_w.
OMITTED API signature: CrystallineCM.BruhatOpenCellInduction_support — An I_w function lies in I°_w exactly when its support is contained in S°_w.
OMITTED API signature: CrystallineCM.BruhatOpenCellInduction_evaluate — At w₀^P, evaluation on U₀-invariants gives the coefficient module with the w₀^P-conjugated Levi action.
OMITTED example: CrystallineCM.BruhatOpenCellInduction_test_identity — S°_1=P(L), so I°_1=I_1.
OMITTED example: CrystallineCM.BruhatOpenCellInduction_test_w0_eval — At w₀^P the evaluated Levi action is conjugated by block exchange, rather than the original action.
OMITTED example: CrystallineCM.BruhatOpenCellInduction_test_nonopen_support — For nonzero trivial coefficients on the longest cell, a nonzero locally constant function with compact support in a compact-open neighborhood in left P(L)-quotient of S_w outside left P(L)-quotient of S°_w is not in I°_w. Single-point support is not assumed to be locally constant.
Source: CN25v3 §2.3.1, p.34; Lemma 2.3.6, pp.36–37

CrystallineLocalGlobalCompatibilityCM:CL.3/prop-2-3-3
OMITTED signature: CrystallineCM.bruhat_filtration_exact
(1) I_{≥0} = Res^{G(L)}_{P(L)} ∘ Ind^{G(L)}_{P(L)}. (2) Each of I_{≥i}, I_w, I°_w is exact. (3) For i ≥ 0 and π ∈ Mod_sm(P(L), O/ϖ^m) there is a functorial exact sequence 0 → I_{≥i+1}(π) → I_{≥i}(π) → ⊕_{ℓ(w)=i} I_w(π) → 0, giving distinguished triangles (2.3.1) in D⁺_sm(P(L), O/ϖ^m).
Direct prerequisites: CrystallineLocalGlobalCompatibilityCM:CL.3/induction-filtration-functors; CrystallineLocalGlobalCompatibilityCM:CL.3/lem-2-3-2; SmoothRepresentationsOfLocalGroups:SR.2; CrystallineLocalGlobalCompatibilityCM:CL.3/bruhat-stratum-induction; CrystallineLocalGlobalCompatibilityCM:CL.3/bruhat-open-cell-induction
Source: CN25v3 Proposition 2.3.3, p.34

CrystallineLocalGlobalCompatibilityCM:CL.3/lem-2-3-5
OMITTED signature: CrystallineCM.bruhat_clopen_approximation
For each i ≥ 0 there are decompositions G_{≥i} = U^m₁ ⊔ U^m₂ into open and closed subsets, indexed by m ≥ 1, left P(L)-invariant and right P(O_L)-invariant, with G_{≥i+1} = ∪_{m≥1} U^m₁.
Direct prerequisites: CrystallineLocalGlobalCompatibilityCM:CL.3/lem-2-3-2; CrystallineLocalGlobalCompatibilityCM:CL.3/induction-filtration-functors
Source: CN25v3 Lemma 2.3.5, pp.35–36

CrystallineLocalGlobalCompatibilityCM:CL.3/prop-2-3-4
OMITTED signature: CrystallineCM.bruhat_cohomology_exact
Let π ∈ D⁺_sm(P(L), O/ϖ^m) and V a finite free O/ϖ^m-module with a smooth representation of an open submonoid Δ⁺ ⊂ M(L) containing an open subgroup K ⊂ M(O_L). For i ≥ 0 and j ∈ Z, 0 → R^jΓ(K ⋉ U₀, V ⊗ I_{≥i+1}(π)) → R^jΓ(K ⋉ U₀, V ⊗ I_{≥i}(π)) → ⊕_{ℓ(w)=i} R^jΓ(K ⋉ U₀, V ⊗ I_w(π)) → 0 is an exact sequence of H(Δ⁺, K)-modules.
Direct prerequisites: CrystallineLocalGlobalCompatibilityCM:CL.3/prop-2-3-3; CrystallineLocalGlobalCompatibilityCM:CL.3/lem-2-3-5; tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-10-continuous-cohomology-in-all-degrees
Source: CN25v3 Proposition 2.3.4, pp.34–35

CrystallineLocalGlobalCompatibilityCM:CL.3/lem-2-3-6
OMITTED signature: CrystallineCM.ordinary_open_cell_comparison
For G = GL_{2n}/L, P the standard parabolic with Levi GL_n × GL_n, ũ_L = diag(ϖ_L,…,ϖ_L,1,…,1) and w₀^P the longest element of ^PW^P: (1) I°_{w₀^P} takes injectives to Γ(U₀,−)-acyclics; (2) for π ∈ D⁺_sm(P(L), O/ϖ^m) there is a natural isomorphism ord RΓ(U₀, I°_{w₀^P}(π)) ≅ ord RΓ(U₀, I_{w₀^P}(π)), ord inverting ũ_L.
Direct prerequisites: CrystallineLocalGlobalCompatibilityCM:CL.3/induction-filtration-functors; CrystallineLocalGlobalCompatibilityCM:CL.1/p-ordinary-functors; CrystallineLocalGlobalCompatibilityCM:CL.3/bruhat-stratum-induction; CrystallineLocalGlobalCompatibilityCM:CL.3/bruhat-open-cell-induction; SmoothRepresentationsOfLocalGroups:SR.0:abelian-category; SmoothRepresentationsOfLocalGroups:SR.2; tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-10-continuous-cohomology-in-all-degrees
Source: CN25v3 Lemma 2.3.6, pp.36–37

CrystallineLocalGlobalCompatibilityCM:CL.3/lem-2-3-7
OMITTED signature: CrystallineCM.open_cell_evaluation_twist
For π ∈ D⁺_sm(P(L), O/ϖ^m) there is a natural isomorphism RΓ(U₀, I°_{w₀^P}(π)) ≅ π^{w₀^P} in D⁺_sm(M(L)⁺, O/ϖ^m), where m ∈ M(L)⁺ acts on π^{w₀^P} through w₀^P m (w₀^P)^{−1}.
Direct prerequisites: CrystallineLocalGlobalCompatibilityCM:CL.3/induction-filtration-functors; CrystallineLocalGlobalCompatibilityCM:CL.0/weyl-elements; SmoothRepresentationsOfLocalGroups:SR.2; tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-10-continuous-cohomology-in-all-degrees; CrystallineLocalGlobalCompatibilityCM:CL.3/bruhat-stratum-induction; CrystallineLocalGlobalCompatibilityCM:CL.3/bruhat-open-cell-induction; CrystallineLocalGlobalCompatibilityCM:CL.3/lem-2-3-6
Source: CN25v3 Lemma 2.3.7, p.37

CrystallineLocalGlobalCompatibilityCM:CL.3/chi-character
OMITTED signature: CrystallineCM.ChiCharacter
χ : M(L) → O^× is χ(m) = Nm_{L/Q_p} det_L(Ad(m)|_{Lie U(L)})^{−1} / |Nm_{L/Q_p} det_L(Ad(m)|_{Lie U(L)})|_p.
Direct prerequisites: PotentialAutomorphyInfrastructure:PA.2/bruhat-orientation-character; PotentialAutomorphyInfrastructure:PA.0/unipotent-exterior-cohomology
OMITTED API signature: CrystallineCM.ChiCharacter_mul — χ(mm′)=χ(m)χ(m′) and χ(1)=1.
OMITTED API signature: CrystallineCM.ChiCharacter_unit_value — The normalization has p-adic valuation zero and therefore lies in Z_p×⊂O×.
OMITTED API signature: CrystallineCM.ChiCharacter_orientation — Its restriction to compact Levi is the inverse determinant on top continuous unipotent cohomology; on the torus it agrees with the appropriate PA.2 orientation character.
OMITTED example: CrystallineCM.ChiCharacter_test_identity — χ(1)=1.
OMITTED example: CrystallineCM.ChiCharacter_test_rank_one_unit — For GL₂ and m=diag(a,d) with a/d∈Z_p×, χ(m)=d/a.
OMITTED example: CrystallineCM.ChiCharacter_test_uniformizer — For L=Q_p and m=diag(p,1), χ(m)=1 because the determinant inverse and absolute-value denominator cancel.
Source: CN25v3 §2.3.1, p.37

CrystallineLocalGlobalCompatibilityCM:CL.3/lem-2-3-8
OMITTED signature: CrystallineCM.ordinary_inflation_orientation_shift
In the abelian Siegel GL_{2n} setting, For π ∈ D⁺_sm(M(L), O/ϖ^m) there is a natural isomorphism ord RΓ(U₀, Inf^{M(L)⁺⋉U₀}_{M(L)⁺} π) ≅ O/ϖ^m(χ) ⊗ π[−rk_{Z_p}U₀] in D⁺_sm(M(L)⁺, O/ϖ^m). Corollary 2.3.10: for π ∈ D⁺_sm(M(L), O/ϖ^m), ord RΓ(U₀, I_id(Inf^{P(L)}_{M(L)} π)) ≅ O/ϖ^m(χ) ⊗ π[−rk_{Z_p}U₀] in D⁺_sm(M(L)⁺, O/ϖ^m), where I_id is the identity Bruhat stratum and I°_id its restriction to M(L)⁺ ⋉ U₀ (Remark 2.3.9).
Direct prerequisites: CrystallineLocalGlobalCompatibilityCM:CL.3/chi-character; CrystallineLocalGlobalCompatibilityCM:CL.1/p-ordinary-functors; PotentialAutomorphyInfrastructure:PA.0/unipotent-exterior-cohomology; tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-10-continuous-cohomology-in-all-degrees
Source: CN25v3 Lemma 2.3.8, pp.37–38; Remark 2.3.9 and Corollary 2.3.10, p.38

CrystallineLocalGlobalCompatibilityCM:CL.3/prop-2-3-11
OMITTED signature: CrystallineCM.ordinary_induction_subquotients
For v̄ ∈ S̄ and Q_{v̄} ⊂ P_{v̄} with K_{v̄} = 𝒬_{v̄} ∩ G(F⁺_{v̄}): let π ∈ D⁺_sm(G(F⁺_{v̄}), O/ϖ^m) and V a finite free O/ϖ^m-module with a smooth Δ^{Q,+}_{v̄}-action, ũ_{ṽ,n} acting trivially, inflated to Δ̃^{Q}_{v̄,P} = Δ^{Q,+}_{v̄} ⋉ U⁰_{v̄}. Then ord₀ R^jΓ(K_{v̄} ⋉ U⁰_{v̄}, Ind^{G̃(F⁺_{v̄})}_{P(F⁺_{v̄})} π ⊗ V) has R^jΓ(K_{v̄}, π^{w₀^P} ⊗ V) and R^{j−rk_{Z_p}U⁰_{v̄}}Γ(K_{v̄}, π ⊗ O/ϖ^m(χ) ⊗ V) as H(Δ^{Q}_{v̄}, K_{v̄})-module subquotients.
Direct prerequisites: CrystallineLocalGlobalCompatibilityCM:CL.3/prop-2-3-4; CrystallineLocalGlobalCompatibilityCM:CL.3/lem-2-3-6; CrystallineLocalGlobalCompatibilityCM:CL.3/lem-2-3-7; CrystallineLocalGlobalCompatibilityCM:CL.3/lem-2-3-8; CrystallineLocalGlobalCompatibilityCM:CL.1/lem-2-2-12
Source: CN25v3 Proposition 2.3.11, p.38

CrystallineLocalGlobalCompatibilityCM:CL.3/cor-2-3-12
OMITTED signature: CrystallineCM.dual_ordinary_induction_subquotient
For π ∈ D⁺_sm(G(F⁺_{v̄}), O/ϖ^m) and V finite free with a smooth (Δ^{Q,+}_{v̄})^{−1}-action, ũ^{−1}_{ṽ,n} trivial, inflated to (Δ̃^{Q}_{v̄,P})^{−1}: ord^∨₀ R^jΓ(K_{v̄} ⋉ Ū¹_{v̄}, Ind^{G̃}_{P} π ⊗ V) has R^jΓ(K_{v̄}, π ⊗ V) as an H((Δ^{Q}_{v̄})^{−1}, K_{v̄})-module subquotient.
Direct prerequisites: CrystallineLocalGlobalCompatibilityCM:CL.3/prop-2-3-11; CrystallineLocalGlobalCompatibilityCM:CL.2/lem-2-2-19; CrystallineLocalGlobalCompatibilityCM:CL.2/dual-p-ordinary
Source: CN25v3 Corollary 2.3.12, p.39

CrystallineLocalGlobalCompatibilityCM:CL.3/lem-2-3-14
OMITTED signature: CrystallineCM.induced_space_cohomology
For G split reductive over O_L, K = G(O_L), K_P = K ∩ P(L), and X a compact Hausdorff space with a continuous P(L)-action on which K_P acts freely: X ×^P G (the quotient of X × G(L) by (x,g)·p = (xp, p^{−1}g)) is K-equivariantly homeomorphic to X ×^{K_P} K, and there is a natural isomorphism RΓ(X ×^P G, O/ϖ^m) ≅ Ind^{G(L)}_{P(L)} RΓ(X, O/ϖ^m) in D⁺_sm(G(L), O/ϖ^m).
Direct prerequisites: ArithmeticLocallySymmetricSpaces:ALS.6; SmoothRepresentationsOfLocalGroups:SR.2; ArithmeticLocallySymmetricSpaces:ALS.3/discrete-topological-comparison
Source: CN25v3 §2.3.13, Lemma 2.3.14, pp.39–40

CrystallineLocalGlobalCompatibilityCM:CL.3/lem-2-3-17
OMITTED signature: CrystallineCM.deep_unipotent_cohomology_split
For the Siegel parabolic of split GL_{2n}/O_L (so U₀≅O_L^{n²} is abelian), Let K = M(O_L) with congruence subgroups K_m = {k ≡ 1 mod ϖ^m_L}, acting on U₀ by conjugation. For every m ≥ 1 there is M = M(m) ≥ m such that RΓ(U₀, O/ϖ^m) ≅ ⊕_{i=0}^{rk_{Z_p}U₀} H^i(U₀, O/ϖ^m)[−i] in D⁺_sm(K_M, O/ϖ^m); each H^i(U₀, O/ϖ^m) is non-zero, with trivial K_M-action. Cohomology is Hom_cts(∧^i_{Z_p}U₀,O/ϖ^m), not ∧^i U₀. No condition p>n² is imposed. The source argument is not exported to arbitrary nonabelian unipotent radicals.
Direct prerequisites: PotentialAutomorphyInfrastructure:PA.0/unipotent-exterior-cohomology; tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-10-continuous-cohomology-in-all-degrees; SmoothRepresentationsOfLocalGroups:SR.0:abelian-category; DeformationAndDerivedPatchingAlgebra:R03.3; SmoothRepresentationsOfLocalGroups:SR.0:derived-extension
Source: CN25v3 §2.3.16, pp.41–42 (Lemma 2.3.17 on p.42)

CrystallineLocalGlobalCompatibilityCM:CL.4/Q-ordinary-hecke
OMITTED signature: CrystallineCM.QOrdinaryHecke
For a standard parabolic Q_{v̄} ⊂ P_{F⁺_{v̄}} corresponding under ι_v to P_{n₁,…,n_t} ⊂ GL_{2n} (a partition of 2n refining (n,n)), ν_k ∈ X_{Q_{v̄}} with ν_k(ϖ) = ι_v^{−1} diag(ϖ_v,…,ϖ_v,1,…,1) (n₁+…+n_k entries ϖ_v) and Ũ^k_v := [𝒬 ν_k(ϖ) 𝒬], so H(Δ̃^{Q}_{v̄}, 𝒬_{v̄}) ≅ Z[Ũ¹_v,…,Ũ^{t−1}_v, (Ũ^t_v)^{±1}]. For dominant λ̃ and a smooth Q̄_p-representation σ of G̃(F⁺_{v̄}), the λ̃-rescaled action on σ^{𝒬} multiplies [𝒬 g 𝒬] by α̃^{Q}(g)^{−1}.
Direct prerequisites: CrystallineLocalGlobalCompatibilityCM:CL.0/lem-2-1-15; CrystallineLocalGlobalCompatibilityCM:CL.0/rescaled-actions; SmoothRepresentationsOfLocalGroups:SR.4; CrystallineLocalGlobalCompatibilityCM:CL.0/positive-parahoric-monoid
OMITTED API signature: CrystallineCM.QOrdinaryHecke_partial_operator — For 1≤k≤t, Ũ^k is the double coset of the first n₁+⋯+n_k diagonal uniformizers.
OMITTED API signature: CrystallineCM.QOrdinaryHecke_polynomial_algebra — The local Hecke algebra is Z[Ũ¹,…,Ũ^{t−1},(Ũ^t)^{±1}], with no inverses of the first t−1 generators before localization.
OMITTED API signature: CrystallineCM.QOrdinaryHecke_rescale — On weight λ̃ coefficients [𝒬g𝒬] is scaled by α̃(g)^{-1}, as in the integral action.
OMITTED example: CrystallineCM.QOrdinaryHecke_test_siegel — For partition (n,n), Ũ¹=Ũ_n and Ũ²=Ũ_{2n}.
OMITTED example: CrystallineCM.QOrdinaryHecke_test_borel — For partition (1,…,1), the generators match all standard Borel partial diagonal Hecke operators.
OMITTED example: CrystallineCM.QOrdinaryHecke_test_central_inverse_only — The unlocalized polynomial algebra contains (Ũ^t)^{-1} but not (Ũ¹)^{-1}; making every generator invertible changes it.
Source: CN25v3 §3.1, p.43

CrystallineLocalGlobalCompatibilityCM:CL.4/q-ordinary-local-subspace
OMITTED signature: CrystallineCM.QOrdinaryLocalSubspace
For an admissible characteristic-zero parahoric invariant space with the λ̃-rescaled commuting Ũ^k operators, the Q-ordinary subspace is the simultaneous sum of generalized eigenspaces for which every Ũ^k-eigenvalue has p-adic valuation zero, after finite coefficient extension. This includes the central invertible Ũ^t operator; P-ordinary only inverts Ũ_n.
Direct prerequisites: CrystallineLocalGlobalCompatibilityCM:CL.4/Q-ordinary-hecke; PadicFamilies:L0a
OMITTED API signature: CrystallineCM.QOrdinaryLocalSubspace_unit_eigenspaces — A simultaneous generalized eigenvector lies in the subspace iff all rescaled eigenvalues have valuation zero.
OMITTED API signature: CrystallineCM.QOrdinaryLocalSubspace_scalar_extension — Formation commutes with finite coefficient extension preserving the p-adic valuation.
OMITTED API signature: CrystallineCM.QOrdinaryLocalSubspace_p_comparison — QOrd is contained in POrd at the same invariant space, and equality is not imposed in a refined partition.
OMITTED example: CrystallineCM.QOrdinaryLocalSubspace_test_all_units — For commuting diagonal scalar operators with all eigenvalues 1, the whole invariant space is QOrd.
OMITTED example: CrystallineCM.QOrdinaryLocalSubspace_test_nonunit — For two scalar operators 1 and p on an E-line, POrd for the first is nonzero but QOrd is zero.
OMITTED example: CrystallineCM.QOrdinaryLocalSubspace_test_zero_space — For zero parahoric invariants the QOrd subspace is zero.
Source: CN25v3 §3.1, after Definition 3.1.1, p.43

CrystallineLocalGlobalCompatibilityCM:CL.4/iota-Q-ordinary
OMITTED signature: CrystallineCM.IotaQOrdinary
A cuspidal automorphic representation π of G̃(𝔸_{F⁺}) is ι-Q_{v̄}-ordinary of weight λ̃ (λ̃ ∈ (Z^{2n}₊)^{Hom(F⁺,Q̄_p)} dominant, ι : Q̄_p ≅ C) if π is ιV^∨_λ̃-cohomological and the λ̃-rescaled operators {Ũ^k_v : 1 ≤ k ≤ t} have a simultaneous eigenvector with p-adic unit eigenvalues in ι^{−1}π^{𝒬}; the Q_{v̄}-ordinary subspace of ι^{−1}π^{𝒬_{v̄}}_{v̄} is the largest H(Δ̃^Q, 𝒬)-submodule on which the rescaled Ũ^k_v have only unit eigenvalues.
Direct prerequisites: CrystallineLocalGlobalCompatibilityCM:CL.4/Q-ordinary-hecke; ArithmeticLocallySymmetricSpaces:ALS.5/automorphic-comparison; CrystallineLocalGlobalCompatibilityCM:CL.4/q-ordinary-local-subspace
OMITTED API signature: CrystallineCM.IotaQOrdinary_witness — Q-ordinarity holds iff π is the specified cohomological representation and its parahoric invariants contain a nonzero vector with simultaneous unit rescaled eigenvalues.
OMITTED API signature: CrystallineCM.IotaQOrdinary_isomorphism — An isomorphism of cuspidal automorphic representations preserving the local component and weight preserves Q-ordinarity.
OMITTED API signature: CrystallineCM.IotaQOrdinary_p_specialization — For Q=P the condition uses the Siegel Ũ_n and central Ũ_{2n} operators; for Q=B it uses all Borel partial products.
OMITTED example: CrystallineCM.IotaQOrdinary_test_no_fixed_vectors — A local component with π^{𝒬}=0 cannot be Q-ordinary regardless of its Galois slopes.
OMITTED example: CrystallineCM.IotaQOrdinary_test_wrong_weight — A unit eigenvector alone does not make π Q-ordinary of a weight for which it is not V^∨-cohomological.
OMITTED example: CrystallineCM.IotaQOrdinary_test_refinement — At Q=B all partial-product unit conditions are imposed, recovering the parent’s Borel definition after the stated normalization.
Source: CN25v3 Definition 3.1.1, p.43

CrystallineLocalGlobalCompatibilityCM:CL.4/lem-3-1-3
OMITTED signature: CrystallineCM.newton_hodge_equality_subrepresentation
Let r : G_{F_v} → GL_m(Q̄_p) be semistable, v₁ ≤ … ≤ v_m the valuations of the eigenvalues of geometric Frobenius on WD(r), and h_{τ,1} < … < h_{τ,m} the τ-Hodge–Tate weights. Then Σ_{i≤j} v_i ≥ (1/e_v) Σ_{i≤j} Σ_τ h_{τ,i} for 0 ≤ j ≤ m (e_v the ramification degree of F_v/Q_p). If Σ_{i≤j} v_{σ(i)} = (1/e_v) Σ_{i≤j} Σ_τ h_{τ,i} for some 1 ≤ j ≤ m − 1 and a permutation σ ∈ S_m, then r ≅ (r₁ ∗; 0 r₂) with r₁ of dimension j, τ-Hodge–Tate weights h_{τ,1} < … < h_{τ,j}, Frobenius slopes v₁ ≤ … ≤ v_j, and v_j < v_{j+1}.
Direct prerequisites: PadicHodgeTheory:R06.2; PadicHodgeTheory:R06.3
Source: CN25v3 Lemma 3.1.3, pp.44–45

CrystallineLocalGlobalCompatibilityCM:CL.4/thm-3-1-2
OMITTED signature: CrystallineCM.q_ordinary_crystalline_blocks
Let π be cuspidal on G̃(𝔸_{F⁺}), ι : Q̄_p ≅ C, v̄ a p-adic place of F⁺ with π ι-Q_{v̄}-ordinary of weight λ̃. Then: (1) r_ι(π)|_{G_{F_v}} is conjugate to a block upper-triangular representation with diagonal blocks r_j(π) : G_{F_v} → GL_{n_j}(Q̄_p) (j = 1,…,t), each crystalline (3.1.1); (2) the Q_{v̄}-ordinary subspace of ι^{−1}π^{𝒬}_{v̄} is one-dimensional; (3) the τ-Hodge–Tate weights of the r_j(π) are obtained by decomposing λ̃_{τ,2n} < λ̃_{τ,2n−1} + 1 < … < λ̃_{τ,1} + 2n − 1 according to (n₁,…,n_t); (4) ∏_{j=1}^k det r_j(π)(Art_{F_v}(u)) = ∏_{i=1}^{n₁+…+n_k} ∏_{τ:F_v↪Q̄_p} τ(u)^{−λ̃_{τ,2n−i+1}−i+1} for u ∈ O^×_{F_v}, and ∏_{j=1}^k det r_j(π)(Art_{F_v}(ϖ_v)) equals ε_p^{Σ_{i=1}^{n₁+…+n_k}(1−i)}(Art_{F_v}(ϖ_v)) times the eigenvalue of Ũ^k_v on the Q_{v̄}-ordinary subspace.
Direct prerequisites: CrystallineLocalGlobalCompatibilityCM:CL.4/iota-Q-ordinary; CrystallineLocalGlobalCompatibilityCM:CL.4/lem-3-1-3; AutomorphicGaloisRepresentationsPartII:AG2.2; AutomorphicGaloisRepresentationsPartII:AG2.5; SmoothRepresentationsOfLocalGroups:SR.2; SmoothRepresentationsOfLocalGroups:SR.4
Source: CN25v3 Theorem 3.1.2, pp.43–44

CrystallineLocalGlobalCompatibilityCM:CL.5/boundary-coefficient-object
OMITTED signature: CrystallineCM.BoundaryCoefficientObject
For S̄⊆S̄_p, dominant λ̃, R_m=O/ϖ^m, put V_{λ̃_S̄}=⊗_{v̄∈S̄,τ}V_{λ̃_τ}. V_U(λ̃_S̄,m) is the equivariant locally constant derived coefficient object on the GL_n adelic tower corresponding to RΓ(U₀_{S̄},V_{λ̃_S̄}/ϖ^m), descended to good X_K through the genuine Levi conjugation action. Its cohomology sheaves vanish outside [0,r], r=n²Σ_{v̄∈S̄}[F⁺_{v̄}:Q_p]. If λ̃_S̄=0, every degree 0,…,r is nonzero and H^j=Hom_cts(∧^j_{Z_p}U₀_{S̄},R_m). Define V_U(λ̃_S̄)=holim_m V_U(λ̃_S̄,m). The printed exact nonvanishing claim for arbitrary λ̃ is not exported without the missing argument recorded in E18.
Direct prerequisites: tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-10-continuous-cohomology-in-all-degrees; ArithmeticLocallySymmetricSpaces:ALS.6; ArithmeticLocallySymmetricSpaces:ALS.1/arithmetic-local-system; CrystallineLocalGlobalCompatibilityCM:CL.3/lem-2-3-17
OMITTED API signature: CrystallineCM.BoundaryCoefficientObject_fiber — Its local derived coefficient fiber is RΓ(U₀,V_{λ̃_S̄}/ϖ^m), with the genuine Levi conjugation action.
OMITTED API signature: CrystallineCM.BoundaryCoefficientObject_descent — Restriction to a good arithmetic level is compatible with the equivariant locally constant coefficient descent.
OMITTED API signature: CrystallineCM.BoundaryCoefficientObject_amplitude — Its cohomology sheaves vanish outside [0,n²Σ_{v̄∈S̄}[F⁺_{v̄}:Q_p]]; exact nonvanishing across this range is asserted here only for zero λ̃ on S̄.
OMITTED example: CrystallineCM.BoundaryCoefficientObject_test_empty_places — For S̄=∅, V_U is the original coefficient in degree zero with no unipotent shift.
OMITTED example: CrystallineCM.BoundaryCoefficientObject_test_zero_weight_rank_one — For n=1,L=Q_p and zero coefficients, H⁰ and H¹ are R_m, all other groups vanish; the Levi action on H¹ is the inverse adjoint character.
OMITTED example: CrystallineCM.BoundaryCoefficientObject_test_exterior_dual — For zero coefficients, the fibers agree with PA.0/unipotent-exterior-cohomology as continuous Hom of exterior powers, not the exterior power of U₀ itself.
Source: CN25v3 §4.1.1, p.53

CrystallineLocalGlobalCompatibilityCM:CL.5/prop-4-1-4
OMITTED signature: CrystallineCM.localized_siegel_stratum
(1) There is a G̃(𝔸_{F⁺,f})-equivariant closed immersion (𝔛_P × G̃(𝔸_{F⁺,f}))/P(𝔸_{F⁺,f}) ↪ ∂𝔛_{G̃} whose complement is a disjoint union of locally closed (𝔛_Q × G̃(𝔸_{F⁺,f}))/Q(𝔸_{F⁺,f}) for standard parabolics Q ⊄ P. (2) Under the assumptions of thm-4-1-3, pullback gives a T̃^T-equivariant isomorphism RΓ(K̃^{S̄₂}, RΓ(∂𝔛_{G̃}, V_λ̃/ϖ^m))_{m̃} ≅ RΓ(K̃^{S̄₂}, RΓ((𝔛_P × G̃(𝔸_{F⁺,f}))/P(𝔸_{F⁺,f}), V_λ̃/ϖ^m))_{m̃}.
Direct prerequisites: PotentialAutomorphyInfrastructure:PA.0; ArithmeticLocallySymmetricSpaces:ALS.2/borel-serre-bordification; ArithmeticLocallySymmetricSpaces:ALS.4/boundary-stratum-cohomology-formula; ArithmeticLocallySymmetricSpaces:ALS.6
Source: CN25v3 Proposition 4.1.4, pp.54–55

CrystallineLocalGlobalCompatibilityCM:CL.5/lem-4-1-5
OMITTED signature: CrystallineCM.siegel_stratum_induction
With λ̃ as in thm-4-1-3, RΓ((𝔛_P × G̃(𝔸_{F⁺,f}))/P(𝔸_{F⁺,f}), V_λ̃/ϖ^m) ≅ Ind^{G̃^{S̄₁}×G̃⁰_{S̄₁}}_{P^{S̄₁}×P⁰_{S̄₁}} RΓ(𝔛_P, V_λ̃/ϖ^m) in D⁺_sm(G̃^{S̄₁} × G̃⁰_{S̄₁}, O/ϖ^m), where G̃^{S̄₁} is the adelic group away from S̄₁ and G̃⁰_{S̄₁} = ∏_{v̄∈S̄₁} G̃(O_{F⁺_{v̄}}).
Direct prerequisites: CrystallineLocalGlobalCompatibilityCM:CL.5/prop-4-1-4; CrystallineLocalGlobalCompatibilityCM:CL.3/lem-2-3-14; SmoothRepresentationsOfLocalGroups:SR.2
Source: CN25v3 Lemma 4.1.5, p.55

CrystallineLocalGlobalCompatibilityCM:CL.5/lem-4-1-6
OMITTED signature: CrystallineCM.parabolic_cohomology_inflation
Pullback along 𝔛_P ↠ 𝔛_G gives a natural isomorphism Inf^{P(𝔸_{F⁺,f})}_{G(𝔸_{F⁺,f})} RΓ(𝔛_G, O/ϖ^m) ≅ RΓ(𝔛_P, O/ϖ^m) in D⁺_sm(P(𝔸_{F⁺,f}), O/ϖ^m).
Direct prerequisites: ArithmeticLocallySymmetricSpaces:ALS.6; ArithmeticLocallySymmetricSpaces:ALS.4/levi-hochschild-serre; ArithmeticLocallySymmetricSpaces:ALS.2/stratum-nilmanifold-fibration
Source: CN25v3 Lemma 4.1.6, pp.55–56

CrystallineLocalGlobalCompatibilityCM:CL.5/lem-4-1-7
OMITTED signature: CrystallineCM.unipotent_coefficient_inflation
With notation as in the proof of thm-4-1-3, Inf^{P^{T\S̄₂}}_{G^{T\S̄₂}} RΓ(K_{T\S̄₂}, RΓ(𝔛_G, V_U(λ̃_{S̄₁}, m))) ≅ RΓ(K_{P,T\S̄₂}, RΓ(𝔛_P, V_λ̃/ϖ^m)) in D⁺_sm(P^{T\S̄₂}, O/ϖ^m).
Direct prerequisites: CrystallineLocalGlobalCompatibilityCM:CL.5/boundary-coefficient-object; CrystallineLocalGlobalCompatibilityCM:CL.5/lem-4-1-6; SmoothRepresentationsOfLocalGroups:SR.0:derived-extension
Source: CN25v3 Lemma 4.1.7, p.56

CrystallineLocalGlobalCompatibilityCM:CL.5/prop-4-1-8
OMITTED signature: CrystallineCM.completed_parabolic_levi_comparison
RΓ(K^{S̄₂}_P, RΓ(𝔛_P, V_λ̃/ϖ^m)) ≅ r^*_G ∘ Inf^{P_{S̄₂}}_{G_{S̄₂}} RΓ(K^{S̄₂}, RΓ(𝔛_G, V_U(λ̃_{S̄₁}, m))), T^T_P-equivariantly in D⁺_sm(P_{S̄₂}, O/ϖ^m).
Direct prerequisites: CrystallineLocalGlobalCompatibilityCM:CL.5/lem-4-1-6; CrystallineLocalGlobalCompatibilityCM:CL.5/lem-4-1-7; ArithmeticLocallySymmetricSpaces:ALS.4/parabolic-hecke-maps
Source: CN25v3 Proposition 4.1.8, pp.56–57

CrystallineLocalGlobalCompatibilityCM:CL.5/thm-4-1-3
OMITTED signature: CrystallineCM.completed_siegel_boundary_summand
Let K̃ ⊂ G̃(𝔸_{F⁺,f}) be good, decomposed with respect to P, with K̃_{U,v̄} = U⁰_{v̄} for v̄ ∈ S̄_p; m ⊂ T^T non-Eisenstein and m̃ := 𝒮^*(m). For a partition S̄_p = S̄₁ ⊔ S̄₂ and dominant λ̃ with λ̃_{v̄} = 0 for v̄ ∈ S̄₂: 𝒮^* ∘ Ind^{G̃_{S̄₂}}_{P_{S̄₂}} RΓ(K^{S̄₂}, RΓ(𝔛_G, V_U(λ̃_{S̄₁}, m)))_m is a T̃^T-equivariant direct summand of RΓ(K̃^{S̄₂}, RΓ(∂𝔛_{G̃}, V_λ̃/ϖ^m))_{m̃} in D⁺_sm(G̃_{S̄₂}, O/ϖ^m).
Direct prerequisites: CrystallineLocalGlobalCompatibilityCM:CL.5/prop-4-1-4; CrystallineLocalGlobalCompatibilityCM:CL.5/lem-4-1-5; CrystallineLocalGlobalCompatibilityCM:CL.5/prop-4-1-8; SmoothRepresentationsOfLocalGroups:SR.2
Source: CN25v3 §4.1.2, Theorem 4.1.3, p.54

CrystallineLocalGlobalCompatibilityCM:CL.5/cor-4-1-9
OMITTED signature: CrystallineCM.integral_levi_boundary_retract
Let K̃ be good, decomposed with respect to P, K̃_{U,v̄} = U⁰_{v̄} for v̄ ∈ S̄_p; m ⊂ T^T non-Eisenstein, m̃ = 𝒮^*(m); S̄_p = S̄₁ ⊔ S̄₂ ⊔ S̄₃; λ̃, λ dominant with λ̃_τ = (−λ_{τ̃c}, λ_τ̃) for τ inducing v̄ ∈ S̄₁ and λ̃_τ = 0 for v̄ ∈ S̄₂ ⊔ S̄₃. Then 𝒮^* ∘ Ind^{G̃_{S̄₃}}_{P_{S̄₃}} RΓ(K^{S̄₃}, RΓ(𝔛_G, V_{λ_{S̄₁}}/ϖ^m ⊗ V_U(λ̃_{S̄₂}, m)))_m is a T̃^T-equivariant direct summand of RΓ(K̃^{S̄₃}, RΓ(∂𝔛_{G̃}, V_λ̃/ϖ^m))_{m̃} in D⁺_sm(G̃_{S̄₃}, O/ϖ^m).
Direct prerequisites: CrystallineLocalGlobalCompatibilityCM:CL.5/thm-4-1-3; CrystallineLocalGlobalCompatibilityCM:CL.2/lem-2-2-14; PotentialAutomorphyInfrastructure:PA.0
Source: CN25v3 Corollary 4.1.9, p.57

CrystallineLocalGlobalCompatibilityCM:CL.6/ord-hecke-algebras-4-2
OMITTED signature: CrystallineCM.OrdHeckeAlgebras42
T^{Q_S̄,S̄-ord} := T^T ⊗ (⊗_{v̄∈S̄} H(Δ^{Q_{v̄}}_{v̄}, K_{v̄})), T^{Q_S̄,S̄-ord}_{w₀^P} := T^T ⊗ (⊗ H((Δ^{Q}_{v̄})^{w₀^P}, K^{w₀^P}_{v̄})) and T̃^{Q_S̄,S̄-ord} := T̃^T ⊗ (⊗ H(Δ̃^{Q}_{v̄}, 𝒬_{v̄})[Ũ^{−1}_{ṽ,n}]); 𝒮^{w₀^P} : T̃^{Q_S̄,S̄-ord} → T^{Q_S̄,S̄-ord}_{w₀^P}, [𝒬 ν(ϖ) 𝒬] ↦ [K^{w₀^P} ν(ϖ)^{w₀^P} K^{w₀^P}], sending Ũ_{ṽ,n} ↦ U_ṽ and Ũ_{ṽ,2n} ↦ U_ṽ U^{−1}_{ṽc}; the duality involutions ι[KgK] = [Kg^{−1}K], ι̃[K̃gK̃] = [K̃g^{−1}K̃] [ACC+18, §2.2.19] with twisted algebras T^{…,ι}_{w₀^P}, T̃^{…,ι̃}, the untwisted T^{Q_S̄,S̄-ord,ι} and 𝒮^ι : [𝒬 ν(ϖ)^{−1} 𝒬] ↦ [K ν(ϖ)^{−1} K].
Direct prerequisites: CrystallineLocalGlobalCompatibilityCM:CL.0/lem-2-1-15; CrystallineLocalGlobalCompatibilityCM:CL.0/weyl-elements; PotentialAutomorphyInfrastructure:PA.2/ordinary-satake-homomorphism; ArithmeticLocallySymmetricSpaces:ALS.5:finite-level-duality/hecke-adjoint-duality; SmoothRepresentationsOfLocalGroups:SR.4
OMITTED API signature: CrystallineCM.OrdHeckeAlgebras42_local_factor — The untwisted GL_n factor is H(Δ^Q,K_Q); the unitary factor localizes H(Δ̃^Q,𝒬) only at Ũ_n.
OMITTED API signature: CrystallineCM.OrdHeckeAlgebras42_twisted_satake — S^{w₀^P} sends Ũ_n to U_ṽ and Ũ_{2n} to U_ṽ U_{ṽc}^{−1}.
OMITTED API signature: CrystallineCM.OrdHeckeAlgebras42_dual_satake — S^ι sends inverse local cosets to inverse Levi cosets, with no additional w₀^P-conjugation in its untwisted target.
OMITTED example: CrystallineCM.OrdHeckeAlgebras42_test_empty — At S̄=∅ they reduce to the tame Hecke algebras and the untwisted Siegel Satake map.
OMITTED example: CrystallineCM.OrdHeckeAlgebras42_test_central_ratio — Ũ_{2n} maps to U_ṽ/U_{ṽc}; replacing division by multiplication fails the determinant dictionary.
OMITTED example: CrystallineCM.OrdHeckeAlgebras42_test_dual_inverse — S^ι(Ũ_n^{-1}) is the inverse appropriate Levi coset; its action agrees with the ALS adjoint involution.
Source: CN25v3 §4.2.1, p.58

CrystallineLocalGlobalCompatibilityCM:CL.6/prop-4-2-2
OMITTED signature: CrystallineCM.middle_degree_hecke_comparison
Let K̃ be good, decomposed with respect to P, K̃_{U,v̄} = U⁰_{v̄} for v̄ ∈ S̄_p; m ⊂ T^T non-Eisenstein, m̃ = 𝒮^*(m) with ρ̄_{m̃} decomposed generic; S̄_p = S̄₁ ⊔ S̄₂ ⊔ S̄₃ with standard parabolics Q_{v̄} ⊂ P_{v̄} for v̄ ∈ S̄₃; λ̃, λ dominant with (1) λ̃_τ = (−w_{0,n}λ_{τ̃c}, λ_τ̃) for τ inducing v̄ ∈ S̄₁, (2) λ̃_τ = 0 for v̄ ∈ S̄₂, (3) K̃_{v̄} = 𝒬_{v̄} and λ̃_τ = (−w_{0,n}λ_{τ̃c}, λ_τ̃) for v̄ ∈ S̄₃. Then 𝒮^{w₀^P} descends to a homomorphism T̃^{Q_{S̄₃},S̄₃-ord}(H^d(X̃_{K̃}, V_λ̃)^{ord}_{m̃}) → T^{Q_{S̄₃},S̄₃-ord}_{w₀^P}(H^d(X_{K^{S̄₃}K^{w₀^P}_{S̄₃}}, V_{λ_{S̄₁}} ⊗ V_U(λ̃_{S̄₂}) ⊗ V_{λ_{S̄₃}})_m) (H^d degree-d hypercohomology), and T̃^{…}(H^d(X̃_{K̃}, V_λ̃)^{ord}_{m̃}) ↪ T̃^{…}(H^d(X̃_{K̃}, V_λ̃[1/p])^{ord}_{m̃}).
Direct prerequisites: CrystallineLocalGlobalCompatibilityCM:CL.5/cor-4-1-9; CrystallineLocalGlobalCompatibilityCM:CL.3/prop-2-3-11; CrystallineLocalGlobalCompatibilityCM:CL.2/prop-2-2-15; CrystallineLocalGlobalCompatibilityCM:CL.1/lem-2-2-12; CrystallineLocalGlobalCompatibilityCM:CL.6/ord-hecke-algebras-4-2; IgusaVarietiesAndTorsionConcentration:IG.7/middle-degree-without-length-hypothesis
Source: CN25v3 Proposition 4.2.2, pp.58–60

CrystallineLocalGlobalCompatibilityCM:CL.6/lem-4-2-3
OMITTED signature: CrystallineCM.dual_levi_coefficient_summand
Let S̄ ⊂ S̄_p and λ̃, λ dominant with λ̃_τ = (λ_τ̃, −w_{0,n}λ_{τ̃c}) for τ inducing v̄ ∈ S̄ (the w₀^P-conjugate of the standard identification). Then for every m ≥ 1, RΓ(U⁰_{S̄}, V^∨_{λ̃_S̄}/ϖ^m) has V^∨_{λ_S̄}/ϖ^m as a K_{S̄}-equivariant direct summand.
Direct prerequisites: CrystallineLocalGlobalCompatibilityCM:CL.0/lem-2-1-12; CrystallineLocalGlobalCompatibilityCM:CL.2/dual-p-ordinary; tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-10-continuous-cohomology-in-all-degrees; PotentialAutomorphyInfrastructure:PA.0; SmoothRepresentationsOfLocalGroups:SR.0:derived-extension
Source: CN25v3 Lemma 4.2.3, p.60

CrystallineLocalGlobalCompatibilityCM:CL.6/prop-4-2-4
OMITTED signature: CrystallineCM.dual_middle_degree_hecke_comparison
Assumptions as in prop-4-2-2 except: ρ̄_{𝒮^*(m^∨)} decomposed generic, and λ̃_τ = (λ_τ̃, −w_{0,n}λ_{τ̃c}) for τ inducing places of S̄₁ and S̄₃ (λ̃_τ = 0 on S̄₂, K̃_{v̄} = 𝒬_{v̄} on S̄₃). Then 𝒮^ι descends to T̃^{Q_{S̄₃},S̄₃-ord,ι̃}(H^d(X̃_{K̃}, V^∨_λ̃)^{ord∨}_{𝒮^*(m^∨)}) → T^{Q_{S̄₃},S̄₃-ord,ι}(H^d(X_K, V^∨_{λ_{S̄₁}} ⊗ V_U(λ̃_{S̄₂}) ⊗ V^∨_{λ_{S̄₃}})_{m^∨}); T̃^{…}(H^d(X̃,V^∨)^{ord∨}) ↪ T̃^{…}(H^d(X̃,V^∨[1/p])^{ord∨}), and by Poincaré duality the rational unitary algebra on the right of this injection is isomorphic to T̃^{Q_{S̄₃},S̄₃-ord}(H^d(X̃_{K̃}, V_λ̃[1/p])^{ord}_{ι̃^*𝒮^*(m^∨)}). Here ρ̄_{ι̃^*𝒮^*(m^∨)} = ρ̄_m(−n) ⊕ ρ̄_m^{∨,c}(1−n).
Direct prerequisites: CrystallineLocalGlobalCompatibilityCM:CL.6/prop-4-2-2; CrystallineLocalGlobalCompatibilityCM:CL.6/lem-4-2-3; CrystallineLocalGlobalCompatibilityCM:CL.3/cor-2-3-12; ArithmeticLocallySymmetricSpaces:ALS.5:finite-level-duality/verdier-poincare-duality
Source: CN25v3 Proposition 4.2.4, p.61

CrystallineLocalGlobalCompatibilityCM:CL.6/hecke-images-A
OMITTED signature: CrystallineCM.HeckeImagesA
A(K,λ,q)=T^{Q^{w₀^P},S̄-ord}_{w₀^P}(H^q(X_K,V_λ)_m), the image subalgebra of the displayed actual cohomological Hecke action. All source notations m, Q and the chosen ordinary localization are fixed; it is not the whole abstract Hecke algebra.
Direct prerequisites: CrystallineLocalGlobalCompatibilityCM:CL.6/ord-hecke-algebras-4-2; mathlib:AlgHom.range; CrystallineLocalGlobalCompatibilityCM:CL.1/p-ordinary-finite-level
OMITTED API signature: CrystallineCM.HeckeImagesA_mem — An endomorphism belongs to A(K,λ,q) iff it is the action of some element of the specified abstract ordinary Hecke algebra.
OMITTED API signature: CrystallineCM.HeckeImagesA_factor — A map out of the abstract algebra factors through A iff it kills the annihilator of the displayed localized cohomology.
OMITTED API signature: CrystallineCM.HeckeImagesA_integral_to_rational — The map to its rational cohomology image is induced by tensoring the actual coefficient complex; injectivity requires the specified middle-degree input and is not unconditional for GL_n.
OMITTED example: CrystallineCM.HeckeImagesA_test_zero_cohomology — For H^q_m=0, A is the zero endomorphism algebra; it is not the nonzero abstract Hecke algebra.
OMITTED example: CrystallineCM.HeckeImagesA_test_scalar_image — If a polynomial Hecke algebra acts by evaluating T at a∈O on an O-line, its image is O and kernel is (T−a).
OMITTED example: CrystallineCM.HeckeImagesA_test_range — For an available module action, A is exactly AlgHom.range, including its image membership statement.
Source: CN25v3 §4.2.1, p.61

CrystallineLocalGlobalCompatibilityCM:CL.6/torsion-hecke-image
OMITTED signature: CrystallineCM.TorsionHeckeImage
A(K,λ,q,m)=image of T^{Q^{w₀^P},S̄-ord}_{w₀^P} in End_O(H^q(X_K,V_λ/ϖ^m)_m). Integral and torsion Hecke operators agree on the image of integral cohomology in torsion cohomology. A map A(K,λ,q)/ϖ^m→A(K,λ,q,m) requires an additional annihilator containment; neither that map nor equality is automatic.
Direct prerequisites: CrystallineLocalGlobalCompatibilityCM:CL.6/hecke-images-A; mathlib:AlgHom.range
OMITTED API signature: CrystallineCM.TorsionHeckeImage_mem — b belongs iff b is the specified ordinary Hecke action on H^q(X_K,V_λ/ϖ^m)_m.
OMITTED API signature: CrystallineCM.TorsionHeckeImage_faithful — Its tautological action on this module is injective as a map of algebras.
OMITTED API signature: CrystallineCM.TorsionHeckeImage_image_reduction — An integral Hecke operator and its induced torsion operator agree on the image of H^q(V_λ)→H^q(V_λ/ϖ^m).
OMITTED example: CrystallineCM.TorsionHeckeImage_test_zero — Zero torsion cohomology gives the zero image algebra.
OMITTED example: CrystallineCM.TorsionHeckeImage_test_scalar_mod — For a scalar O-action on R_m, its torsion image is R_m.
OMITTED example: CrystallineCM.TorsionHeckeImage_test_new_torsion — Torsion H^{q+1}(V) may contribute to H^q(V/ϖ^m); the definition cannot identify the latter image with A(K,λ,q)/ϖ^m without extra hypotheses.
Source: CN25v3 §4.2.1, p.61

CrystallineLocalGlobalCompatibilityCM:CL.6/unitary-middle-hecke-image
OMITTED signature: CrystallineCM.UnitaryMiddleHeckeImage
Ã(K̃,λ̃,S̄)=image of T̃^{Q^{w₀^P},S̄-ord} in End_O(H^d(X̃_{K̃},V_λ̃)^{P-ord}_{m̃}). Under the generic middle-degree injection this is a finite torsion-free O-algebra inside its rational image. Q-unit eigensystems are selected by the maximal ideal, not by redefining POrd.
Direct prerequisites: CrystallineLocalGlobalCompatibilityCM:CL.6/hecke-images-A; CrystallineLocalGlobalCompatibilityCM:CL.6/prop-4-2-2; mathlib:AlgHom.range
OMITTED API signature: CrystallineCM.UnitaryMiddleHeckeImage_mem — b∈Ã iff it is an ordinary abstract Hecke action on the indicated integral unitary H^d.
OMITTED API signature: CrystallineCM.UnitaryMiddleHeckeImage_rational_injective — Under the decomposed-generic middle-degree injection, the natural map Ã→Ã[1/p] is injective.
OMITTED API signature: CrystallineCM.UnitaryMiddleHeckeImage_character — A characteristic-zero algebra character is evaluated on all rescaled partial operators, not only Ũ_n.
OMITTED example: CrystallineCM.UnitaryMiddleHeckeImage_test_zero — Vanishing ordinary H^d gives the zero image.
OMITTED example: CrystallineCM.UnitaryMiddleHeckeImage_test_torsion_free — Under ambient genericity, a nonzero ϖ-torsion Hecke endomorphism is impossible because its action embeds in rational H^d.
OMITTED example: CrystallineCM.UnitaryMiddleHeckeImage_test_characters — Its characteristic-zero characters match the cuspidal Q-ordinary eigensystems in Proposition 4.2.11 when CTG and all-unit hypotheses hold.
Source: CN25v3 §4.2.1, p.61

CrystallineLocalGlobalCompatibilityCM:CL.6/deep-levi-level
OMITTED signature: CrystallineCM.DeepLeviLevel
For e≥1 and S̄⊂S̄_p, K(e,S̄)_v=K_v∩ker(GL_n(O_{F_v})→GL_n(O_{F_v}/ϖ_v^e)) for v above S̄, and K_v elsewhere. The same depth is imposed at both conjugate places. K(e′,S̄)⊂K(e,S̄) for e′≥e.
Direct prerequisites: CrystallineLocalGlobalCompatibilityCM:CL.0/parahoric-P-v(b,c); ArithmeticLocallySymmetricSpaces:ALS.0/standard-level-subgroups
OMITTED API signature: CrystallineCM.DeepLeviLevel_mem — g∈K(e,S̄) iff g∈K and every selected p-component is identity modulo its local ϖ_v^e.
OMITTED API signature: CrystallineCM.DeepLeviLevel_antitone — e′≥e implies K(e′,S̄)⊂K(e,S̄).
OMITTED API signature: CrystallineCM.DeepLeviLevel_empty — K(e,∅)=K.
OMITTED example: CrystallineCM.DeepLeviLevel_test_empty — S̄=∅ leaves K unchanged.
OMITTED example: CrystallineCM.DeepLeviLevel_test_scalar — For GL₁ over Z_p with K=Z_p×, K(e,{v̄})=1+p^e Z_p at each conjugate place.
OMITTED example: CrystallineCM.DeepLeviLevel_test_local_uniformizer — At ramified F_v/Q_p, congruence modulo ϖ_v^e differs from congruence modulo p^e; the local uniformizer is required.
Source: CN25v3 §4.2.1, p.61

CrystallineLocalGlobalCompatibilityCM:CL.6/deep-unitary-level
OMITTED signature: CrystallineCM.DeepUnitaryLevel
K̃(e,S̄)_{v̄}=K̃_{v̄}∩P_{v̄}(e,e) for v̄∈S̄ and K̃_{v̄} elsewhere; equivalently the reduction modulo ϖ_ṽ^e is block unipotent (1_n *;0 1_n), so U₀ remains present. This is deeper than diagonal-level control while retaining the unipotent fiber.
Direct prerequisites: CrystallineLocalGlobalCompatibilityCM:CL.0/parahoric-P-v(b,c)
OMITTED API signature: CrystallineCM.DeepUnitaryLevel_mem — A selected component lies in K̃(e,S̄) iff it lies in the original K̃ and its diagonal blocks reduce to identity and its lower-left block to zero modulo ϖ_ṽ^e.
OMITTED API signature: CrystallineCM.DeepUnitaryLevel_unipotent — U(O_{F⁺_{v̄}})⊂K̃(e,S̄) whenever it was contained in K̃.
OMITTED API signature: CrystallineCM.DeepUnitaryLevel_empty — K̃(e,∅)=K̃.
OMITTED example: CrystallineCM.DeepUnitaryLevel_test_empty — S̄=∅ leaves K̃ unchanged.
OMITTED example: CrystallineCM.DeepUnitaryLevel_test_upper_unipotent — For n=1, (1 1;0 1) belongs at every depth when in K̃.
OMITTED example: CrystallineCM.DeepUnitaryLevel_test_not_principal — The same upper-unipotent matrix need not be identity modulo ϖ^e, so replacing this level by a principal congruence subgroup destroys U₀.
Source: CN25v3 §4.2.1, p.61

CrystallineLocalGlobalCompatibilityCM:CL.6/prop-4-2-6
OMITTED signature: CrystallineCM.torsion_degree_shifting
Let v̄ ≠ v̄′ ∈ S̄_p, S̄₁ = {v̄′}, S̄₃ = {v̄}, S̄₂ the rest; λ ∈ (Zⁿ₊)^{Hom(F,E)}, m ≥ 1, K̃ good. Assume (1) Σ_{v̄″≠v̄,v̄′}[F⁺_{v̄″} : Q_p] ≥ ½[F⁺ : Q]; (2) for each p-adic v̄″ ≠ v̄ (including v̄′), U(O_{F⁺_{v̄″}}) ⊂ K̃_{v̄″} = K̃(m, S̄₁ ∪ S̄₂)_{v̄″}, and K̃_{v̄} = 𝒬^{w₀^P}_{v̄} for the standard parabolic with Levi Q^{w₀^P}_{v̄} ∩ G(F⁺_{v̄}); (3) −λ_{τc,1} − λ_{τ,1} ≥ 0 for τ inducing v̄ or v̄′; (4) m ⊂ T non-Eisenstein with ρ̄_{m̃} decomposed generic. Put λ̃_τ = 0 for τ not inducing v̄, v̄′ and λ̃_τ = (−λ_{τ̃c}, λ_τ̃) otherwise, and K = (K̃^{v̄} ∩ G(𝔸^{v̄}_{F⁺,f})) · (𝒬_{v̄} ∩ G(F⁺_{v̄})). For q ∈ [⌊d/2⌋, d − 1] there are m′ ≥ m (allowed to depend on the input) and N ≥ 1 depending only on n and [F⁺ : Q], an ideal J ⊂ A(K,λ,q,m) with J^N = 0 and a commutative square T̃^{Q^{w₀^P}_{v̄},{v̄}-ord} → Ã(K̃(m′, S̄₂), λ̃, v̄) over 𝒮^{w₀^P} : T̃^{…} → T^{…}_{w₀^P} → A(K,λ,q,m)/J.
Direct prerequisites: CrystallineLocalGlobalCompatibilityCM:CL.6/prop-4-2-2; CrystallineLocalGlobalCompatibilityCM:CL.6/prop-4-2-4; CrystallineLocalGlobalCompatibilityCM:CL.6/lem-4-2-5; CrystallineLocalGlobalCompatibilityCM:CL.3/lem-2-3-17; CrystallineLocalGlobalCompatibilityCM:CL.3/lem-2-3-18; CrystallineLocalGlobalCompatibilityCM:CL.6/hecke-images-A; IntegralHeckeAndGaloisDeterminants:IHG.2/ghost-nilpotence; ArithmeticLocallySymmetricSpaces:ALS.6/finite-cover-hochschild-serre; ArithmeticLocallySymmetricSpaces:ALS.4/gln-boundary-eisenstein; CrystallineLocalGlobalCompatibilityCM:CL.6/torsion-hecke-image; CrystallineLocalGlobalCompatibilityCM:CL.6/unitary-middle-hecke-image; CrystallineLocalGlobalCompatibilityCM:CL.6/deep-levi-level; CrystallineLocalGlobalCompatibilityCM:CL.6/deep-unitary-level
Source: CN25v3 Proposition 4.2.6, pp.62–65

CrystallineLocalGlobalCompatibilityCM:CL.6/hecke-images-dual
OMITTED signature: CrystallineCM.HeckeImagesDual
For S̄_p = S̄₁ ∪ S̄₂ ∪ S̄₃: A^∨(K,λ,q) := T^{Q_{S̄₃},S̄₃-ord,ι}(H^q(X_K, V^∨_λ)_{m^∨}), A^∨(K,λ,q,m) the same with V^∨_λ/ϖ^m, Ã^∨(K̃,λ̃,S̄₃) := T̃^{Q_{S̄₃},S̄₃-ord,ι̃}(H^d(X̃_{K̃}, V^∨_λ̃)^{ord∨}_{𝒮^*m^∨}).
Direct prerequisites: CrystallineLocalGlobalCompatibilityCM:CL.6/hecke-images-A; CrystallineLocalGlobalCompatibilityCM:CL.2/dual-p-ordinary; CrystallineLocalGlobalCompatibilityCM:CL.6/ord-hecke-algebras-4-2
OMITTED API signature: CrystallineCM.HeckeImagesDual_coefficient — A^∨ uses the inverse-coset action on H^q(X_K,V_λ^∨)_{m^∨}, with the integral and mod-ϖ^m variants distinguished.
OMITTED API signature: CrystallineCM.HeckeImagesDual_adjoint — Poincaré pairing identifies dual Hecke operators with the involution g↦g^{-1}.
OMITTED API signature: CrystallineCM.HeckeImagesDual_unitary — Ã^∨ is the image on unitary middle-degree dual POrd, localized at S^*(m^∨).
OMITTED example: CrystallineCM.HeckeImagesDual_test_zero_cohomology — All dual Hecke images vanish on the zero module.
OMITTED example: CrystallineCM.HeckeImagesDual_test_scalar_inverse — A double-coset operator acting by a unit a on a perfect dual pair acts adjointly through its inverse coset, so the relevant scalar is a^{-1} when the group action is one-dimensional.
OMITTED example: CrystallineCM.HeckeImagesDual_test_involution — Applying the coefficient dual and Hecke inversion twice recovers the original action and maximal ideal.
Source: CN25v3 §4.2.1, p.65

CrystallineLocalGlobalCompatibilityCM:CL.6/prop-4-2-8
OMITTED signature: CrystallineCM.dual_torsion_degree_shifting
As prop-4-2-6 with: K̃_{v̄} = 𝒬_{v̄} for the standard parabolic Q_{v̄} ⊂ P_{F⁺_{v̄}}; condition (3) replaced by λ_{τc,n} + λ_{τ,n} ≥ 0 for τ inducing v̄ or v̄′; ρ̄_{𝒮^*(m^∨)} decomposed generic; λ̃_τ = (λ_τ̃, −λ_{τ̃c}) for τ inducing v̄, v̄′; K = K̃ ∩ G(𝔸_{F⁺,f}). Then for q ∈ [⌊d/2⌋, d − 1] there are m′ ≥ m, N (depending only on n, [F⁺ : Q]), J ⊂ A^∨(K,λ,q,m) with J^N = 0 and a commutative square T̃^{Q_{v̄},{v̄}-ord,ι̃} → Ã^∨(K̃(m′,S̄₂), λ̃, v̄) over 𝒮^ι : T̃ → T^{Q_{v̄},{v̄}-ord,ι} → A^∨(K,λ,q,m)/J.
Direct prerequisites: CrystallineLocalGlobalCompatibilityCM:CL.6/prop-4-2-6; CrystallineLocalGlobalCompatibilityCM:CL.6/hecke-images-dual; CrystallineLocalGlobalCompatibilityCM:CL.6/prop-4-2-4
Source: CN25v3 Proposition 4.2.8, pp.65–66

CrystallineLocalGlobalCompatibilityCM:CL.7/prop-4-2-9
OMITTED signature: CrystallineCM.residual_block_determinants
Let v̄ be p-adic, m ⊂ T^{Q^{w₀^P}_{v̄},v̄-ord}_{w₀^P} non-Eisenstein in the support of some H^*(X_K, V_λ), m̃ := (𝒮^{w₀^P})^*(m), v | v̄ with Ũ^k_v ∉ m̃ (1 ≤ k ≤ t). Let π be cuspidal on G̃(𝔸_{F⁺}), ι-Q^{w₀^P}_{v̄}-ordinary of weight λ̃, whose Hecke eigenvalues on (ι^{−1}π^∞)^{K̃, Q^{w₀^P}-ord} come from f : T̃^{Q^{w₀^P}_{v̄}-ord}_{m̃} → Q̄_p; with r_ι(π)|_{G_{F_ṽ}} ≅ (r₁(π) ∗; 0 r₂(π)) as in thm-3-1-2 and r̄_i(π) the semisimplified reductions: det r̄₁(π)(Art_{F_v}(ϖ_v)) = det ρ̄_m(Art_{F_v}(ϖ_v)) and det r̄₂(π)(Art_{F_v}(ϖ_v)) = det(ρ̄_m^{∨,c}(1−2n))(Art_{F_v}(ϖ_v)).
Direct prerequisites: CrystallineLocalGlobalCompatibilityCM:CL.4/thm-3-1-2; CrystallineLocalGlobalCompatibilityCM:CL.0/lem-2-1-21; CrystallineLocalGlobalCompatibilityCM:CL.6/ord-hecke-algebras-4-2
Source: CN25v3 Proposition 4.2.9, pp.66–67

CrystallineLocalGlobalCompatibilityCM:CL.7/prop-4-2-11
OMITTED signature: CrystallineCM.q_ordinary_automorphic_characters
Let m ⊂ T^T be non-Eisenstein, v̄ ∈ S̄_p, Q_{v̄} ⊂ P_{v̄}, m̃ a maximal ideal of T̃^{Q_{v̄},{v̄}-ord} extending 𝒮^*(m), K̃ good with m̃ in the support of H^*(X̃_{K̃}, V_λ̃)^{ord} for a CTG weight λ̃, and Ũ^k_v ∉ m̃ for 1 ≤ k ≤ t; d = n²[F⁺ : Q]. Then H^d(X̃_{K̃}, V_λ̃)^{ord}_{m̃}[1/p] is a semisimple T̃^{Q_{v̄},{v̄}-ord}[1/p]-module, and for every f : T̃^{Q_{v̄},{v̄}-ord}(H^d(X̃_{K̃}, V_λ̃)^{ord}_{m̃}) → Q̄_p and ι there is a cuspidal π of G̃(𝔸_{F⁺}), ι-Q_{v̄}-ordinary of weight λ̃, whose eigenvalues on (ι^{−1}π^∞)^{K̃,Q_{v̄}-ord} give f.
Direct prerequisites: CrystallineLocalGlobalCompatibilityCM:CL.4/thm-3-1-2; PotentialAutomorphyInfrastructure:PA.1/ctg-weight; ArithmeticLocallySymmetricSpaces:ALS.5/automorphic-comparison
Source: CN25v3 Proposition 4.2.11, p.67

CrystallineLocalGlobalCompatibilityCM:CL.7/sub-lemma-1-twist
OMITTED signature: CrystallineCM.local_constituent_separating_twist
In the proof of prop-4-2-13, possibly after enlarging O, there is a continuous character ψ̄ : G_F → k^×, unramified at S_p and with ρ̄_{m̃(ψ)} decomposed generic, such that (1) the irreducible constituents of ρ̄_{m(ψ)}|_{G_{F_ṽ}} are disjoint from those of ρ̄^{∨,c}_{m(ψ)}(1−2n)|_{G_{F_ṽ}}; (2) for every factor i of Ã(ψ)[1/p] = ∏_{i=1}^{r} E (p.69; this r is not the r of n = n₁ + ⋯ + n_r) the irreducible constituents of r̄^i_{1,ψ} coincide with those of ρ̄_{m(ψ)}|_{G_{F_ṽ}}.
Direct prerequisites: CrystallineLocalGlobalCompatibilityCM:CL.7/prop-4-2-9; tauceti:TauCetiRoadmap/ClassFieldTheory#layer-12-separate-arithmetic-global-existence-the-norm-index-and-the-global-correspondence; ArithmeticLocallySymmetricSpaces:ALS.3/character-twist; PotentialAutomorphyInfrastructure:PA.1/genericity-making-character-twist
Source: CN25v3 Sub-lemma 1, pp.70–71

CrystallineLocalGlobalCompatibilityCM:CL.7/prop-4-2-13
OMITTED signature: CrystallineCM.torsion_local_crystalline_block_lift
Assume p splits in an imaginary quadratic subfield of F; K ⊂ GL_n(𝔸_{F,f}) good; v̄ ≠ v̄′ ∈ S̄_p; λ dominant for G; m ≥ 1; Q_{v̄} ⊂ P_{v̄} standard with K_{v̄} = 𝒬_{v̄} ∩ G(F⁺_{v̄}), identified via ι_ṽ with the block parabolic of a partition (n₁,…,n_t) of 2n with n = n₁ + … + n_r; m ⊂ T^{Q_{v̄},{v̄}-ord} maximal in the support of H^*(X_K, V_λ/ϖ^m). Assume (1) Σ_{v̄″≠v̄,v̄′}[F⁺_{v̄″} : Q_p] ≥ ½[F⁺ : Q]; (2) m non-Eisenstein with ρ̄_m decomposed generic; (3) the condition on T of thm-2-1-20; (4) [K_{v̄} ν(ϖ) K_{v̄}] ∉ m for all ν ∈ X_{Q_{v̄}}. Then for each q ∈ [0, d − 1] there are N depending only on n and [F⁺ : Q], J ⊂ T^{Q_{v̄},{v̄}-ord}(H^q(X_K, V_λ/ϖ^m)_m) with J^N = 0, and ρ_m : G_{F,T} → GL_n(T^{…}(H^q(X_K, V_λ/ϖ^m)_m)/J) such that: (1) char ρ_m(Frob_v) = P_v(X) for v ∉ T; (2) for v | v̄, ρ_m|_{G_{F_v}} lifts to ρ̃_v : G_{F_v} → GL_n(Ã) for a finite flat local O-algebra Ã with f : Ã → T^{…}/J; (3) ρ̃_v[1/p] is semistable with labelled Hodge–Tate weights (λ_{τ,n} < … < λ_{τ,1} + n − 1); (4) ρ̃_ṽ[1/p] ≅ upper triangular with diagonal blocks ρ̃_{ṽ,r+1},…,ρ̃_{ṽ,t} and ρ̃_{ṽc}[1/p] ≅ upper triangular with diagonal blocks ρ̃_{ṽc,r},…,ρ̃_{ṽc,1}, each ρ̃_{v,j} : G_{F_v} → GL_{n_j}(Ã[1/p]) crystalline with labelled Hodge–Tate weights increasing from top left to bottom right; (5) for j = r+1,…,t, det ρ̃_{ṽ,j} is Ã-valued with image ψ_j under f, where ∏_{j=r+1}^k ψ_j(Art(u)) = ∏_{i=1}^{n_{r+1}+…+n_k} ∏_τ τ(u)^{−λ_{τ,n−i+1}−i+1} for u ∈ O^×_{F_ṽ} and ∏_{j=r+1}^k ψ_j(Art(ϖ_ṽ)) = ε_p^{Σ_i(1−i)}(Art(ϖ_ṽ)) Ũ^{k−r}_v. The ordered Hodge–Tate list is h_{τ,i}=λ_{τ,n−i+1}+i−1 for 1≤i≤n. The local finite-flat algebra and lift may depend on v, q and m; the nilpotence exponent does not. No globally automorphic lift of the torsion representation is claimed.
Direct prerequisites: CrystallineLocalGlobalCompatibilityCM:CL.6/prop-4-2-6; CrystallineLocalGlobalCompatibilityCM:CL.6/prop-4-2-8; CrystallineLocalGlobalCompatibilityCM:CL.7/prop-4-2-9; CrystallineLocalGlobalCompatibilityCM:CL.7/prop-4-2-11; CrystallineLocalGlobalCompatibilityCM:CL.7/sub-lemma-1-twist; PotentialAutomorphyInfrastructure:PA.1/ctg-one-embedding-perturbation; IntegralHeckeAndGaloisDeterminants:IHG.1; IntegralHeckeAndGaloisDeterminants:IHG.5; LocalGaloisDeformationRings:L7/semistable-ordinary-quotient
Source: CN25v3 Proposition 4.2.13, pp.67–71

CrystallineLocalGlobalCompatibilityCM:CL.7/thm-4-2-15
OMITTED signature: CrystallineCM.integral_local_global_deformation_factorization
Let F be an imaginary CM field containing an imaginary quadratic field, p a prime split in an imaginary quadratic subfield of F, T ⊇ S_p finite with T = T^c and the condition of thm-2-1-20; K ⊂ GL_n(𝔸_{F,f}) good with K_v = GL_n(O_{F_v}) for v ∉ T; v̄ ≠ v̄′ ∈ S̄_p; λ dominant for G; Q_{v̄} ⊂ P_{v̄} in one of the cases (cr-ord) ι_ṽ(Q_{v̄}) the parabolic of the partition (n,1,…,1) of 2n; (ord) ι_ṽ(Q_{v̄}) = B_{2n}; (cr) Q_{v̄} = P_{v̄}; K_{v̄} = 𝒬_{v̄} ∩ G(F⁺_{v̄}); m ⊂ T^{Q_{v̄},{v̄}-ord} maximal in the support of H^*(X_K, V_λ). Assume (1) Σ_{v̄″≠v̄,v̄′}[F⁺_{v̄″} : Q_p] ≥ ½[F⁺ : Q]; (2) m non-Eisenstein with ρ̄_m decomposed generic; (3) [K_{v̄} ν(ϖ) K_{v̄}] ∉ m for ν ∈ X_{Q_{v̄}}. Then there are N ≥ 1 depending only on n and [F⁺ : Q], J ⊂ T^{Q_{v̄},{v̄}-ord}(RΓ(X_K, V_λ)_m) with J^N = 0 and ρ_m : G_{F,T} → GL_n(T^{…}(RΓ(X_K, V_λ)_m)/J), unramified with char ρ_m(Frob_v) = P_v(X) for v ∉ T, such that the induced t_{ρ_m} : R^□_{ρ̄_m} → T^{…}/J satisfies: (cr-ord) its restriction to R^□_{ρ̄_m|G_{F_ṽ}} factors through R^{△,λ_ṽ} and to R^□_{ρ̄_m|G_{F_{ṽc}}} through R^{cris,λ_{ṽc}}; (ord) for v | v̄ it factors through R^{△,λ_v}; (cr) for v | v̄ it factors through R^{cris,λ_v}.
Direct prerequisites: CrystallineLocalGlobalCompatibilityCM:CL.7/prop-4-2-13; IntegralHeckeAndGaloisDeterminants:IHG.5; IntegralHeckeAndGaloisDeterminants:IHG.2/ghost-nilpotence; LocalGaloisDeformationRings:L7/semistable-ordinary-quotient
Source: CN25v3 Theorem 4.2.15, pp.71–72

CrystallineLocalGlobalCompatibilityCM:CL.7/cor-4-2-16
OMITTED signature: CrystallineCM.fixed_determinant_factorization
In the setting of thm-4-2-15, assume p ∤ n and f : T^{Q_{v̄},{v̄}-ord}(RΓ(X_K, V_λ)_m)/J → A with det(f_*(ρ_m)) = ψ for a character ψ : G_{F,T} → O^× crystalline at all places of S_p with τ-labelled Hodge–Tate weights Σ_{i=1}^n λ_{τ,i} + (n − i). Then for v | v̄ the induced map R^{△,λ_v}_{ρ̄_m|G_{F_v}} → A or R^{cris,λ_v}_{ρ̄_m|G_{F_v}} → A factors through the corresponding fixed-determinant ψ lifting ring.
Direct prerequisites: CrystallineLocalGlobalCompatibilityCM:CL.7/thm-4-2-15; LocalGaloisDeformationRings:R08.3/fixed-determinant-pst-rings
Source: CN25v3 Corollary 4.2.16, p.72

CrystallineLocalGlobalCompatibilityCM:CL.7/thm-4-3-1
OMITTED signature: CrystallineCM.unramified_automorphic_crystallinity
Let F be totally real or CM, π a cuspidal automorphic representation of GL_n(𝔸_F), regular algebraic of weight λ, v | p with π^{GL_n(O_{F_v})} ≠ 0 and π^{GL_n(O_{F_{v^c}})} ≠ 0 (v = v^c allowed), ι : Q̄_p ≅ C, and r_ι(π) : G_F → GL_n(Q̄_p) the representation of [HLTT16]. If the semisimplified residual reduction r̄_ι(π) is irreducible and decomposed generic, then r_ι(π)|_{G_{F_v}} and r_ι(π)|_{G_{F_{v^c}}} are crystalline with τ-labelled Hodge–Tate weights λ_{ιτ,n} < … < λ_{ιτ,1} + n − 1 for τ inducing v or v^c respectively.
Direct prerequisites: CrystallineLocalGlobalCompatibilityCM:CL.7/thm-4-2-15; AutomorphicGaloisRepresentationsPartII:AG2.2; PadicHodgeTheory:R06.2; ModularityAndLanglandsExtensions:ML.5; PotentialModularityAndCompatibleSystems:R23.5; PotentialAutomorphyInfrastructure:PA.5/genericity-normal-closure-restriction
Source: CN25v3 §4.3, Theorem 4.3.1, p.73

CrystallineLocalGlobalCompatibilityCM:CL.8/pgl2-cohomology
OMITTED signature: CrystallineCM.Pgl2Cohomology
For F imaginary CM, G = PGL_{2,F}, K = ∏K_v ⊂ PGL₂(Ô_F) (not necessarily neat), S ⊇ S_p with K_v = PGL₂(O_{F_v}) for v ∉ S, R = O or O/ϖ^m and V an R[K_S]-module finite free over R with V/ϖ^r smooth: C•(K,V) := holim_r RΓ(K, RΓ(𝔛_G, V/ϖ^r)) ∈ D⁺(R) and C•(K/K′,V) ∈ D⁺(R[K/K′]) for open normal K′ with K′^S = K^S, with H(G^S,K^S)-actions (T_{v,i} images of GL₂ operators, T_{v,2} = 1, P_v(X)); RΓ(K/K′, C•(K/K′,V)) = C•(K,V); cohomology finitely generated, Hecke algebras T^S_G(C•(K/K′,V)) O-finite, localizations cut out by idempotents e_m.
Direct prerequisites: ArithmeticLocallySymmetricSpaces:ALS.6; ArithmeticLocallySymmetricSpaces:ALS.6/finite-level-descent; ArithmeticLocallySymmetricSpaces:ALS.3/derived-hecke-action
OMITTED API signature: CrystallineCM.Pgl2Cohomology_quotient_descent — For K′⊴K with unchanged tame level, RΓ(K/K′,C•(K/K′,V))≅C•(K,V).
OMITTED API signature: CrystallineCM.Pgl2Cohomology_coefficient — Finite-free coefficient maps induce morphisms compatible with derived reduction and the Hecke action.
OMITTED API signature: CrystallineCM.Pgl2Cohomology_central_operator — T_{v,2}=1 and P_v(X)=X²−T_{v,1}X+q_v on this PGL₂ complex.
OMITTED example: CrystallineCM.Pgl2Cohomology_test_trivial_quotient — When K′=K, the equivariant complex reduces to the ordinary non-neat coefficient complex.
OMITTED example: CrystallineCM.Pgl2Cohomology_test_central_scalar — The scalar GL₂ double coset maps to identity in PGL₂, giving T_{v,2}=1.
OMITTED example: CrystallineCM.Pgl2Cohomology_test_nonneat — A finite p-stabilizer can have unbounded mod-p group cohomology before localization; the definition cannot declare the non-neat complex perfect unconditionally.
Source: CN25v3 §5.5, pp.79–80

CrystallineLocalGlobalCompatibilityCM:CL.9/setup-5-6
OMITTED signature: CrystallineCM.Setup56
Data: F imaginary CM, p odd, ι : Q̄_p ≅ C; S ⊇ S_p finite; R ⊂ S prime to p and S_p = S^cr_p ⊔ S^st_p; π cuspidal on PGL₂(𝔸_F), regular algebraic of weight 0. Hypotheses: (5) every prime below S or ramified in F splits in an imaginary quadratic subfield of F (so S is split over F⁺ and F/F⁺ unramified); (6) for v ∈ S_p there is a p-adic v′ ≠ v̄ of F⁺ with Σ_{v″≠v̄,v′}[F⁺_{v″} : Q_p] > ½[F⁺ : Q], and the residue field of v̄ is bigger than F_p; (7) π_v unramified for v ∉ R ∪ S^st_p; (8) π^{Iw_v}_v ≠ 0 for v ∈ R ∪ S^st_p; (9) for v ∈ S^st_p, π is ι-ordinary of weight 0 at v and r_ι(π)|_{G_{F_v}} is non-crystalline ordinary; (10) ζ_p ∈ F if S = S_p ∪ R; (11) otherwise S − (S_p ∪ R) contains two places of distinct residue characteristics; (12) v ∉ R^c and H²(F_v, ad⁰r̄) = 0 for v ∈ S − (R ∪ S_p); (13) r̄_{π,ι} decomposed generic with r̄|_{G_{F(ζ_p)}} irreducible; (14) r̄_{π,ι}|_{G_{F_v}} trivial for v ∈ S_p ∪ R; (15) if p=5 and the projective image of r̄_{π,ι}(G_{F(ζ₅)}) is conjugate to PSL₂(F₅), the extension of F cut out by the projective image of r̄_{π,ι} does not contain ζ₅.
Direct prerequisites: CrystallineLocalGlobalCompatibilityCM:CL.7/thm-4-2-15; CrystallineLocalGlobalCompatibilityCM:CL.8/pgl2-cohomology; LocalGaloisDeformationRings:R08.4/bt-ring-unique-generalisation; LocalGaloisDeformationRings:L7/snowden-ordinary-ring-trivial-residual
OMITTED API signature: CrystallineCM.Setup56_local_branch — The data remembers the partition S_p^{cr} ⊔ S_p^{st}. PreparedPGL2Level chooses the unitary split-place orientation and its corresponding parabolics.
OMITTED API signature: CrystallineCM.Setup56_auxiliary — It remembers either ζ_p∈F with S=S_p∪R, or two auxiliary places of distinct residue characteristics satisfying H²(ad⁰r̄)=0.
OMITTED API signature: CrystallineCM.Setup56_residual — The residual representation is decomposed generic, irreducible on G_{F(ζ_p)}, locally trivial at S_p∪R, with the exact p=5 exceptional-field condition.
OMITTED example: CrystallineCM.Setup56_test_weak_degree — A complementary degree sum equal to half violates the strict >½ condition in this prepared setup, although it suffices for Theorem 4.2.15.
OMITTED example: CrystallineCM.Setup56_test_two_auxiliary — Two auxiliary places of the same residue characteristic violate condition (11).
OMITTED example: CrystallineCM.Setup56_test_small_residue — A p-place with residue field F_p violates condition (6), even if the residual representation there is trivial.
Source: CN25v3 §5.6, pp.81–82

CrystallineLocalGlobalCompatibilityCM:CL.8/lem-5-5-1
OMITTED signature: CrystallineCM.pgl2_akt_complex_comparison
There are natural Hecke-equivariant quasi-isomorphisms A(K/K′, V) ≅ C•(K/K′, V), where A(K/K′, V) are the complexes of [AKT23, §5.1] built from singular chains of 𝔛̄^{dis}_G.
Direct prerequisites: CrystallineLocalGlobalCompatibilityCM:CL.8/pgl2-cohomology; ArithmeticLocallySymmetricSpaces:ALS.3/discrete-topological-comparison
Source: CN25v3 Lemma 5.5.1, p.80

CrystallineLocalGlobalCompatibilityCM:CL.8/prop-5-5-2
OMITTED signature: CrystallineCM.pgl2_hecke_galois_representation
Suppose p is odd, S = S^c, F contains an imaginary quadratic field and every finite v ∉ S of residue characteristic l has: S contains no l-adic place and l unramified in F, or l splits in an imaginary quadratic subfield of F. Then for every maximal m ⊂ T^S_G(C•(K/K′,V)) there is a continuous semisimple ρ̄_m : G_{F,S} → GL₂(T^S_G(C•(K/K′,V))/m) with det(X − ρ̄_m(Frob_v)) = P_v(X) mod m for v ∉ S; if ρ̄_m is absolutely irreducible there are N depending only on [F : Q], J with J^N = 0 and ρ_m : G_{F,S} → GL₂(T^S_G(C•(K/K′,V))/J) with det(X − ρ_m(Frob_v)) = P_v(X) mod J for v ∉ S; in particular det ρ_m = ε^{−1}_p.
Direct prerequisites: CrystallineLocalGlobalCompatibilityCM:CL.8/pgl2-cohomology; CrystallineLocalGlobalCompatibilityCM:CL.8/lem-5-5-1; IntegralHeckeAndGaloisDeterminants:IHG.5; GlobalGaloisDeformations:R04.2/carayol-trace-theorem
Source: CN25v3 Proposition 5.5.2, pp.80–81

CrystallineLocalGlobalCompatibilityCM:CL.8/prop-5-5-3
OMITTED signature: CrystallineCM.nonneat_localized_perfectness
Let m ⊂ T^S_G(C•(K,V)) be maximal with residue field k; assume V ⊗ k ≅ k with trivial K_S-action, p odd with ρ̄_m absolutely irreducible, and ζ_p ∈ F. Then H^i(C•(K,V))_m = 0 for i > dim_R X_G; in particular C•(K,V)_m is a perfect complex of R-modules.
Direct prerequisites: CrystallineLocalGlobalCompatibilityCM:CL.8/prop-5-5-2; CrystallineLocalGlobalCompatibilityCM:CL.8/lem-5-5-1; ArithmeticLocallySymmetricSpaces:ALS.6
Source: CN25v3 Proposition 5.5.3, p.81

CrystallineLocalGlobalCompatibilityCM:CL.9/prepared-pgl2-level
OMITTED signature: CrystallineCM.PreparedPGL2Level
Under Setup56, define K=∏_v K_v⊂PGL₂(Ô_F): K_v=PGL₂(O_{F_v}) for v∉S or v∈S_p^{cr}, K_v=Iw_v for v∈R∪S_p^{st}, and K_v=Iw_{v,1}, the pro-v Iwahori, for v∈S−(S_p∪R). In the auxiliary-place case K is neat; otherwise ζ_p∈F and localized perfectness uses Proposition 5.5.3. Put T=S∪S^c. For every v̄|p choose ṽ|v̄ in S_p^{st} whenever that set meets {ṽ,ṽ^c}. The unitary parabolic Q_{v̄} has partition (2,1,1) if ṽ is st and ṽ^c is cr, (1,1,1,1) if both are st, and (2,2) if both are cr. Choose the maximal ideal 𝔪 of the corresponding Q-ordinary derived Hecke algebra from π; U_v∉𝔪 for v∈S_p^{st}. Enlarge E so k=k(𝔪) contains every eigenvalue of the residual representation. The selected characteristic-zero representation has dimension two (corrected E15).
Direct prerequisites: CrystallineLocalGlobalCompatibilityCM:CL.9/setup-5-6; CrystallineLocalGlobalCompatibilityCM:CL.8/pgl2-cohomology; CrystallineLocalGlobalCompatibilityCM:CL.8/prop-5-5-3; CrystallineLocalGlobalCompatibilityCM:CL.4/Q-ordinary-hecke; ArithmeticLocallySymmetricSpaces:ALS.0/standard-level-subgroups; ArithmeticLocallySymmetricSpaces:ALS.3; ArithmeticLocallySymmetricSpaces:ALS.5; ArithmeticLocallySymmetricSpaces:ALS.0/neatness-iwahori-criterion
OMITTED API signature: CrystallineCM.PreparedPGL2Level_level_components — Membership is componentwise membership in the specified maximal, Iwahori or pro-v Iwahori subgroup; the auxiliary level is preserved.
OMITTED API signature: CrystallineCM.PreparedPGL2Level_unitary_partitions — The chosen lift ṽ and the cr/st flags determine exactly the displayed three partitions; a lone st branch is placed second in the split Levi dictionary.
OMITTED API signature: CrystallineCM.PreparedPGL2Level_residual_hecke_ideal — The π eigencharacter selects 𝔪; U_v is a unit after localization at every st place, and k contains the residual eigenvalues.
OMITTED API signature: CrystallineCM.PreparedPGL2Level_localized_perfectness — The localized coefficient complex is perfect at this K, using neatness in the auxiliary case and Proposition 5.5.3 with ζ_p∈F otherwise.
OMITTED example: CrystallineCM.PreparedPGL2Level_test_auxiliary_level — At v∈S−(S_p∪R), the selected level is pro-v Iwahori; replacing it by maximal compact loses the specified neatness construction.
OMITTED example: CrystallineCM.PreparedPGL2Level_test_mixed_orientation — With exactly one st place over v̄, choose it as ṽ; the partition is (2,1,1), with the ordinary branch in the lower-right block.
OMITTED example: CrystallineCM.PreparedPGL2Level_test_three_branches — Both st gives the Borel (1,1,1,1); both cr gives Siegel (2,2); exactly one st gives (2,1,1).
OMITTED example: CrystallineCM.PreparedPGL2Level_test_non_neat — For S=S_p∪R there is no auxiliary neatness argument. The ζ_p∈F hypothesis and localized perfectness input are required.
Source: CN25v3 Proof of Proposition 5.6.1, pp.82–83; CN25v3 Unitary parabolic cases and residual Hecke ideal, p.83

CrystallineLocalGlobalCompatibilityCM:CL.9/deformation-problems-S-chi
OMITTED signature: CrystallineCM.DeformationProblemsSChi
For χ = ∏_{v∈R} χ_v, with χ_v:k_v×→O× trivial mod ϖ and inflated to O^×_{F_v}: 𝒮_χ = (ρ̄, ε^{−1}_p, S, {R^{ε^{−1},BT}_v}_{v∈S^cr_p} ∪ {R^△_v}_{v∈S^st_p} ∪ {R^{ε^{−1},χ_v}_v}_{v∈R} ∪ {R^{ε^{−1}}_v}_{v∈S−(S_p∪R)}), with the O[K_S]-module O(χ^{−1}) via Iw_v → O^×, (a b; c d) ↦ χ_v(a/d). The coefficient O(χ^{-1}) uses χ_v(a/d)^{-1} at Iwahori v∈R, trivial outside R; each χ_v factors through the residue field k_v× and is trivial modulo ϖ; a/d is reduced to k_v×.
Direct prerequisites: CrystallineLocalGlobalCompatibilityCM:CL.9/setup-5-6; GlobalGaloisDeformations:R04.3/global-deformation-type; GlobalGaloisDeformations:R04.3/global-framed-ring; LocalGaloisDeformationRings:R08.3/fixed-determinant-pst-rings; LocalGaloisDeformationRings:L7/snowden-ordinary-ring-trivial-residual; CrystallineLocalGlobalCompatibilityCM:CL.9/prepared-pgl2-level; LocalGaloisDeformationRings:R08.4/bt-ring-unique-generalisation
OMITTED API signature: CrystallineCM.DeformationProblemsSChi_p_local — The p-place ring is fixed-determinant BT for S_p^{cr} and semistable-ordinary for S_p^{st}.
OMITTED API signature: CrystallineCM.DeformationProblemsSChi_tame_local — At v∈R choose the fixed-determinant χ_v local type; at the auxiliary smooth places choose the unrestricted fixed-determinant ring.
OMITTED API signature: CrystallineCM.DeformationProblemsSChi_residual_character — Since each χ_v≡1 modϖ, the χ and trivial-character coefficient modules and residual local problems coincide modulo ϖ.
OMITTED example: CrystallineCM.DeformationProblemsSChi_test_chi_one — For χ_v=1 at every v∈R, the coefficient line is the trivial O-module with its trivial Iwahori character.
OMITTED example: CrystallineCM.DeformationProblemsSChi_test_chi_inverse — If χ_v(a/d)=u, then O(χ^{-1}) acts by u^{-1}, not u.
OMITTED example: CrystallineCM.DeformationProblemsSChi_test_mod_p — For χ_v≡1 modϖ, O(χ^{-1})/ϖ is the trivial coefficient line, giving the common residual patching complex.
Source: CN25v3 §5.6, pp.83–84

CrystallineLocalGlobalCompatibilityCM:CL.9/prop-5-6-2
OMITTED signature: CrystallineCM.deformation_to_hecke_surjection
There are N depending only on [F : Q], J ⊂ T^{S,Q_{S̄_p},S̄_p-ord}_G(C•(K, O(χ^{−1}))_m) with J^N = 0 and a continuous surjection f_{𝒮_χ} : R_{𝒮_χ} → T^{S,Q_{S̄_p},S̄_p-ord}_G(C•(K, O(χ^{−1}))_m)/J with char(f_{𝒮_χ} ∘ ρ^{univ}_{𝒮_χ}(Frob_v)) the image of P_v(X) for v ∉ S.
Direct prerequisites: CrystallineLocalGlobalCompatibilityCM:CL.9/deformation-problems-S-chi; CrystallineLocalGlobalCompatibilityCM:CL.8/prop-5-5-2; CrystallineLocalGlobalCompatibilityCM:CL.7/cor-4-2-16; AutomorphicGaloisRepresentationsPartII:AG2.5; GlobalGaloisDeformations:R04.2/carayol-trace-theorem; CrystallineLocalGlobalCompatibilityCM:CL.9/prepared-pgl2-level
Source: CN25v3 Proposition 5.6.2, pp.83–84

CrystallineLocalGlobalCompatibilityCM:CL.9/taylor-wiles-deformation-problem
OMITTED signature: CrystallineCM.TaylorWilesDeformationProblem
S_{χ,Q} is the fixed-determinant problem obtained from S_χ by adjoining the Taylor–Wiles places Q and the unrestricted fixed-determinant local rings R_v^ψ, with ψ=ε_p^{-1}. Fix the ordered distinct residual Frobenius eigenvalues. The corresponding universal unframed global deformation ring R_{S_{χ,Q}} (framing at T gives the separate ring R^T_{S_{χ,Q}}) has the O[Δ_Q]-structure from inertia on the selected lifted eigenline, Δ_Q=∏_{v∈Q}k_v×(p). This follows the unrestricted-ring definition in CN Definition 5.3.5; the selected eigenline specifies the diamond action, rather than replacing the local problem by the unramified quotient.
Direct prerequisites: CrystallineLocalGlobalCompatibilityCM:CL.9/deformation-problems-S-chi; GlobalGaloisDeformations:R04.5/taylor-wiles-datum; GlobalGaloisDeformations:R04.5/taylor-wiles-inertia-action
OMITTED API signature: CrystallineCM.TaylorWilesDeformationProblem_forget — Away from Q the local conditions agree with S_χ. Killing the Δ_Q augmentation ideal enforces unramifiedness at Q and gives a quotient R_{S_{χ,Q}}→R_{S_χ}; allowing Q-ramification does not define an unrestricted forgetting map of deformation functors.
OMITTED API signature: CrystallineCM.TaylorWilesDeformationProblem_diamond — The O[Δ_Q]-action is the universal inertia character on the selected residual Frobenius eigenline.
OMITTED API signature: CrystallineCM.TaylorWilesDeformationProblem_augmentation — Augmenting Δ_Q kills that inertia character and recovers the unramified chosen-eigenline quotient.
OMITTED example: CrystallineCM.TaylorWilesDeformationProblem_test_empty_q — For Q=∅, Δ_Q=1 and the problem reduces to S_χ.
OMITTED example: CrystallineCM.TaylorWilesDeformationProblem_test_two_eigenvalues — Equal residual Frobenius eigenvalues do not give the chosen-eigenline Taylor–Wiles datum.
OMITTED example: CrystallineCM.TaylorWilesDeformationProblem_test_augmentation — After Δ_Q-augmentation the selected inertia character is trivial, matching the finite-cover augmentation in Lemma 5.6.4.
Source: CN25v3 §5.6, p.84

CrystallineLocalGlobalCompatibilityCM:CL.9/prop-5-6-3
OMITTED signature: CrystallineCM.taylor_wiles_deformation_to_hecke_surjection
There are N depending only on [F : Q], J ⊂ T_{χ,Q} with J^N = 0 and a continuous surjective O[Δ_Q]-algebra homomorphism f_{𝒮_{χ,Q}} : R_{𝒮_{χ,Q}} → T_{χ,Q}/J with char(f ∘ ρ^{univ}(Frob_v)) = P_v(X) for v ∉ S ∪ Q, where T_{χ,Q} is the image of T^{S∪Q,…}_G ⊗ O[Δ_Q] in End_{D(O[Δ_Q])}(C•(K₀(Q)/K₁(Q), O(χ^{−1}))_{n_Q}).
Direct prerequisites: CrystallineLocalGlobalCompatibilityCM:CL.9/prop-5-6-2; GlobalGaloisDeformations:R04.5/taylor-wiles-inertia-action; ArithmeticLocallySymmetricSpaces:ALS.6/finite-level-descent; CrystallineLocalGlobalCompatibilityCM:CL.9/taylor-wiles-deformation-problem
Source: CN25v3 Proposition 5.6.3, p.84

CrystallineLocalGlobalCompatibilityCM:CL.9/lem-5-6-4
OMITTED signature: CrystallineCM.taylor_wiles_perfect_dual_augmentation
C_{χ,Q} := RHom_{O[Δ_Q]}(C•(K₀(Q)/K₁(Q), O(χ^{−1}))_{n_Q}, O[Δ_Q]) is a perfect complex of O[Δ_Q]-modules with a canonical isomorphism C_{χ,Q} ⊗^L_{O[Δ_Q]} O ≅ C_χ := RHom_O(C•(K, O(χ^{−1}))_m, O) in D(O).
Direct prerequisites: CrystallineLocalGlobalCompatibilityCM:CL.8/prop-5-5-3; ArithmeticLocallySymmetricSpaces:ALS.6/finite-level-descent; DeformationAndDerivedPatchingAlgebra:P8; CrystallineLocalGlobalCompatibilityCM:CL.9/prepared-pgl2-level
Source: CN25v3 Lemma 5.6.4, pp.84–85

CrystallineLocalGlobalCompatibilityCM:CL.9/akt-tw-primes
OMITTED signature: CrystallineCM.small_image_taylor_wiles_prime_selection
Let F be an imaginary CM field, p odd, and ρ̄ : G_F → GL₂(k) continuous with ρ̄|_{G_{F(ζ_p)}} absolutely irreducible and, if p = 5 and the projective image of ρ̄(G_{F(ζ₅)}) is PSL₂(F₅), the field cut out by the projective image of ρ̄ not containing ζ₅. Then for every N ≥ 1 there is a Taylor–Wiles datum (Q_N, (α_v)_{v∈Q_N}) of level N (Definition 5.3.5) of size q independent of N, killing the relevant dual Selmer group ([AKT23, Prop. A.6]), used with [ACC+18, §6.4] as in the proof of [AKT23, Thm. A.7]. Fix T=S, choose q≥dim_k H¹_{S⊥,S}(ad⁰ρ̄(1)) with g=q−3[F⁺:Q]−1+|S|≥0; then there is a surjection A_S^S[[X₁,…,X_g]]→R_{S_{Q_N}}^S, and the places can have degree one over Q with underlying rational primes split in the chosen imaginary quadratic subfield. The local deformation datum is that of AKT Appendix A.2. The standing local deformation datum is AKT A.2: determinant lifting detρ̄, specified local deformation quotients R_v over Λ_v, Λ=completed tensor of Λ_v, nonempty S⊇S_p, and the finite coefficient field large enough for all residual eigenvalues. Choose F₀ as the CM subfield appearing in A.6 and require F=F⁺F₀.
Direct prerequisites: GlobalGaloisDeformations:R04.5/taylor-wiles-datum; GlobalGaloisDeformations:R04.5/chebotarev-selmer-selection; ArithmeticGaloisRepresentations:R01.4/dickson-classification-and-the-dyadic-refinement; GlobalGaloisDeformations:R04.3/global-framed-ring
Source: AKT22v2 Proposition A.6, p.87; Lemma A.5 and Proposition A.4, p.86; CN25v3 Proof of Proposition 5.6.1, p.85

CrystallineLocalGlobalCompatibilityCM:CL.8/two-system-patching-data
OMITTED signature: CrystallineCM.TwoSystemPatchingData
Let S∞=O[[X₁,…,X_r]] with augmentation a∞=(X₁,…,X_r), C∞ and C′∞ perfect S∞-complexes, and fix an isomorphism C∞⊗ᴸS∞/ϖ≅C′∞⊗ᴸS∞/ϖ. Let T∞⊂End_D(S∞)(C∞) and T′∞⊂End_D(S∞)(C′∞) be finite S∞-algebras whose images coincide in the endomorphism algebra of that residual complex. Let R∞,R′∞ be complete Noetherian local S∞-algebras surjecting onto T∞/I∞,T′∞/I′∞ for nilpotent ideals, and identify R∞/ϖ≅R′∞/ϖ compatibly with S∞ and the actions on the common residual cohomology modulo Ī∞+Ī′∞. Choose q₀∈Z,l₀≥0. Assume dim R∞=dim R′∞=dim S∞−l₀, dim(R∞/ϖ)=dim(R′∞/ϖ)=dim S∞−l₀−1; both R-spectra are equidimensional with characteristic-zero generic points; each special generic point has a unique generic generalization in each R-spectrum. The augmentation fiber C∞⊗ᴸS∞/a∞ has nonzero rational cohomology concentrated in [q₀,q₀+l₀]. Fix a characteristic-zero prime x of T∞/a∞T∞. Support is defined through the finite Hecke action modulo nilpotents; no honest R∞-module chain model is postulated.
Direct prerequisites: mathlib:DerivedCategory; DeformationAndDerivedPatchingAlgebra:P9; DeformationAndDerivedPatchingAlgebra:P8
OMITTED API signature: CrystallineCM.TwoSystemPatchingData_residual_identification — The chosen isomorphism of residual perfect complexes identifies the two finite derived Hecke images and the cohomology actions modulo Ī∞+Ī′∞.
OMITTED API signature: CrystallineCM.TwoSystemPatchingData_support — Support over R∞ is the closed subset induced from the finite T∞ action modulo nilpotents, independent of the chosen nilpotent exponent.
OMITTED API signature: CrystallineCM.TwoSystemPatchingData_specialization_relation — A pair of components C,C_a is related when chosen special generic points have the same unique generic generalization in Spec R′∞ under the fixed residual ring isomorphism.
OMITTED example: CrystallineCM.TwoSystemPatchingData_test_same_system — If both systems and residual identifications coincide, the relation pairs a component with itself and propagation preserves its existing support.
OMITTED example: CrystallineCM.TwoSystemPatchingData_test_crossing_reject — For R=O[[x,y]]/(xy−ϖ²), the special generic points are (ϖ,x) and (ϖ,y), while (ϖ,x,y) is a closed intersection point. The latter cannot be used as a special generic point in the specialization relation, even though it lies on both special components.
OMITTED example: CrystallineCM.TwoSystemPatchingData_test_nilpotents — Replacing an action by a larger nilpotent quotient does not change its closed support, matching the IHG ghost/maximal-ideal interface.
Source: CN25v3 §5.4, Assumption 5.4.1, pp.77–78

CrystallineLocalGlobalCompatibilityCM:CL.8/prop-5-4-2
OMITTED signature: CrystallineCM.two_system_automorphic_component_propagation
Under Assumption 5.4.1, with Supp_{R_∞}(H^*(C_∞)) = Spec T_∞: (1) there is an irreducible component C_a ⊂ Spec R_∞ containing the automorphic point x with C_a ⊂ Spec T_∞; (2) if C_a ⊂ Spec T_∞ is an irreducible component of Spec R_∞ which contains x and C ⊂ Spec R_∞ is an irreducible component such that C ∩ Spec(R_∞/ϖ) and C_a ∩ Spec(R_∞/ϖ) contain generic points x_C, x_a generalizing to the same generic point x′ of Spec R′_∞, then C ⊂ Spec T_∞.
Direct prerequisites: CrystallineLocalGlobalCompatibilityCM:CL.8/two-system-patching-data; DeformationAndDerivedPatchingAlgebra:P9; PotentialAutomorphyInfrastructure:PA.3/arithmetic-derived-support-contract
Source: CN25v3 §5.4, Proposition 5.4.2, pp.78–79

CrystallineLocalGlobalCompatibilityCM:CL.8/cor-5-4-3
OMITTED signature: CrystallineCM.augmented_automorphic_support
Let C be an irreducible component of Spec R_∞ satisfying the hypothesis of prop-5-4-2(2) for some automorphic C_a, x ∈ C and y its contraction to S_∞. Then the support of H^*(C_∞ ⊗^L S_∞/y)_y over Spec R_∞ contains x; if y is one-dimensional of characteristic 0, x lies in the support of H^*(C_∞ ⊗^L S_∞/y)[1/p].
Direct prerequisites: CrystallineLocalGlobalCompatibilityCM:CL.8/prop-5-4-2; DeformationAndDerivedPatchingAlgebra:P9
Source: CN25v3 Corollary 5.4.3, p.79

CrystallineLocalGlobalCompatibilityCM:CL.9/prop-5-6-1
OMITTED signature: CrystallineCM.prepared_barsotti_tate_lifting
With the data and hypotheses (1)–(15), let ρ : G_F → GL₂(Q̄_p) be continuous with (1) ρ̄ ≅ r̄_{π,ι} and det ρ = ε^{−1}_p; (2) ρ|_{G_{F_v}} Barsotti–Tate for v ∈ S^cr_p; (3) r_ι(π)|_{G_{F_v}} ordinary iff ρ|_{G_{F_v}} ordinary, for v ∈ S^cr_p; (4) ρ|_{G_{F_v}} a non-crystalline extension of ε^{−1}_p by the trivial character for v ∈ S^st_p; (5) ρ unramified at v ∉ S; (6) ρ|_{G_{F_v}} unipotently ramified for v ∈ R. Then ρ ≅ r_ι(Π) for a cuspidal Π of PGL₂(𝔸_F) of weight 0.
Direct prerequisites: CrystallineLocalGlobalCompatibilityCM:CL.9/setup-5-6; CrystallineLocalGlobalCompatibilityCM:CL.9/prop-5-6-2; CrystallineLocalGlobalCompatibilityCM:CL.9/prop-5-6-3; CrystallineLocalGlobalCompatibilityCM:CL.9/lem-5-6-4; CrystallineLocalGlobalCompatibilityCM:CL.9/akt-tw-primes; CrystallineLocalGlobalCompatibilityCM:CL.8/prop-5-4-2; CrystallineLocalGlobalCompatibilityCM:CL.8/cor-5-4-3; LocalGaloisDeformationRings:R08.4/bt-ring-unique-generalisation; LocalGaloisDeformationRings:L7/snowden-ordinary-ring-trivial-residual; ArithmeticLocallySymmetricSpaces:ALS.5; DeformationAndDerivedPatchingAlgebra:P8; CrystallineLocalGlobalCompatibilityCM:CL.9/prepared-pgl2-level
Source: CN25v3 Proposition 5.6.1, p.82

CrystallineLocalGlobalCompatibilityCM:CL.9/lem-5-6-5
OMITTED signature: CrystallineCM.determinant_kernel_reducible_except_tetrahedral
Corrected statement (source issue E12): let G be finite, p odd, ρ : G → GL₂(F̄_p) with det ρ of order d > 1, and suppose (tr ρ(g))² = (1 + det ρ(g))² whenever det ρ(g) ≠ 1. Then ρ|_{ker(det ρ)} is reducible, unless d = 3 and the projective image of ρ is A₄; in that case ρ|_{ker(det ρ)} has projective image Z/2 × Z/2 and is absolutely irreducible. (Printed: the conclusion without the exception.)
Direct prerequisites: ArithmeticGaloisRepresentations:R01.4/dickson-classification-and-the-dyadic-refinement
Source: CN25v3 Lemma 5.6.5, pp.85–86

CrystallineLocalGlobalCompatibilityCM:CL.9/proof-thm-5-2
OMITTED signature: CrystallineCM.solvable_preparation_and_descent_qualified
Under the hypotheses of the qualified CL.9/thm-5-2, including d_cyc≠3 or projective image not A₄, Theorem 5.2 follows from prop-5-6-1: choose a finite set V of auxiliary places as in the proof of [AKT23, Thm. A.14]; a solvable Galois CM extension F₀/F in which V splits, π_{F₀} has Iwahori-fixed vectors everywhere, bad places become unipotent with q_w ≡ 1 mod p and trivial ρ̄, every p-adic place of F₀⁺ splits with residue field bigger than F_p and the degree condition holds, potentially crystalline places become crystalline with π unramified (and r_ι(π) crystalline by thm-4-3-1, ordinary iff ρ is), and non-potentially-crystalline places become non-crystalline extensions of ε^{−1}_p by 1; a further composite F₁ with three imaginary quadratic fields; if ζ_p ∉ F, two auxiliary degree-one places v₀, v₀′ from lem-5-6-5 and Chebotarev; then solvable descent [ACC+18, Prop. 6.5.13]. Choose the preparation linearly disjoint from the full residual-plus-cyclotomic field, so both the projective image and d_cyc are preserved and the corrected finite-image criterion applies.
Direct prerequisites: CrystallineLocalGlobalCompatibilityCM:CL.9/prop-5-6-1; CrystallineLocalGlobalCompatibilityCM:CL.7/thm-4-3-1; CrystallineLocalGlobalCompatibilityCM:CL.9/lem-5-6-5; PotentialModularityAndCompatibleSystems:R23.5; ModularityAndLanglandsExtensions:ML.5; PotentialAutomorphyInfrastructure:PA.5/genericity-normal-closure-restriction
Source: CN25v3 End of the proof of Theorem 5.2, pp.85–87

CrystallineLocalGlobalCompatibilityCM:CL.9/thm-5-2
OMITTED signature: CrystallineCM.potentially_barsotti_tate_lifting_qualified
Let F be an imaginary CM field, p an odd prime and ρ : G_F → GL₂(Q̄_p) continuous with: (1) ρ unramified almost everywhere and det ρ = ε_p^{−1}; (2) for each v | p, ρ|_{G_{F_v}} potentially semistable with all labelled Hodge–Tate weights (0,1); (3) ρ̄ decomposed generic and ρ̄|_{G_{F(ζ_p)}} irreducible; (4) if p = 5 and the projective image of ρ̄(G_{F(ζ₅)}) is conjugate to PSL₂(F₅), the extension of F cut out by the projective image of ρ̄ does not contain ζ₅; (5) there are a cuspidal π of PGL₂(𝔸_F) and ι : Q̄_p ≅ C with (a) π regular algebraic of weight 0, (b) for v | p with ρ|_{G_{F_v}} potentially crystalline: r_ι(π)|_{G_{F_v}} is potentially ordinary of weight 0 ([Ger19, §5.2]) iff ρ|_{G_{F_v}} is, and rec_{F_v}(π_v) has monodromy 0, (c) for v | p with ρ|_{G_{F_v}} not potentially crystalline: π is ι-ordinary of weight 0 at v and r_ι(π)|_{G_{F_v}} is not potentially crystalline, (d) ρ̄ ≅ r̄_ι(π). Assume in addition d_cyc=[F(ζ_p):F]≠3 or the projective image of ρ̄(G_F) is not A₄ (the E12 correction required by the supplied proof). Then ρ is automorphic: ρ ≅ r_ι(Π) for a cuspidal Π of PGL₂(𝔸_F), regular algebraic of weight 0.
Direct prerequisites: CrystallineLocalGlobalCompatibilityCM:CL.9/prop-5-6-1; CrystallineLocalGlobalCompatibilityCM:CL.9/proof-thm-5-2; CrystallineLocalGlobalCompatibilityCM:CL.9/lem-5-6-5; ModularityAndLanglandsExtensions:ML.5
Source: CN25v3 §5.1, Theorem 5.2, pp.73–74

-/
