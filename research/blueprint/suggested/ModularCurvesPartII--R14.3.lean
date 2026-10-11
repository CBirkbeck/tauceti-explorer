/-
Suggested.lean — ModularCurvesPartII, part R14.3, stages R14.3–R14.6.

This file is not the roadmap and is not exhaustive. The reader document is definitive.
The statements suggest Lean forms so contributors and reviewers converge on names and
signatures. All proofs here are placeholders; this is no implementation claim.

Pinned baseline: Mathlib 082e2d3 and Tau Ceti f790474. Actual modular curves, their
universal elliptic family, Jacobians, connected-subvariety quotients and geometric
support maps are supplier constructions. Their unavailable signatures are recorded in
the final registry, with the precise mathematical statements and tests. They are never
replaced by unnamed proposition fields or assumptions that simply assert the target.

The elaborated core takes actual support and pullback linear maps as arguments. The
roadmap requires constructing those maps geometrically before applying this core.
The generic symmetric-power action, principal congruence subgroup and trivial-action
H¹/character comparison already exist and are imported rather than reconstructed.
-/
import Mathlib.NumberTheory.ModularForms.CongruenceSubgroups
import Mathlib.RepresentationTheory.Homological.GroupCohomology.LowDegree
import Mathlib.RepresentationTheory.Homological.GroupCohomology.Shapiro
import Mathlib.RingTheory.Ideal.Quotient.Operations
import Mathlib.LinearAlgebra.FreeModule.Finite.Basic
import Mathlib.LinearAlgebra.Dimension.Free
import Mathlib.RingTheory.TensorProduct.Free
import Mathlib.LinearAlgebra.Finsupp.LinearCombination
import Mathlib.GroupTheory.QuotientGroup.Basic
import TauCeti.NumberTheory.ModularForms.CongruenceSubgroups.Basic
import TauCeti.AlgebraicTopology.LocalCoefficient
import TauCeti.RepresentationTheory.SymmetricPower
import TauCeti.AlgebraicGeometry.AbelianVariety.Basic

open CategoryTheory
open scoped MatrixGroups TensorProduct
noncomputable section
namespace TauCeti.ModularCurves

-- R14.3/relative-coefficient-system: monodromy signature after relative H¹ is supplied.
-- k≥2 is required in the roadmap; subtraction below uses k−2.
def weightCoefficients {R : Type} {G M : Type*} [CommRing R] [Group G]
    [AddCommGroup M] [Module R M] (ρ : Representation R G M) (k : ℕ) :
    Representation R G (Sym[R]^(k - 2) M) := ρ.symmetricPower (k - 2)

-- Test weightCoefficients_compat; the geometric fibre tests are in the registry.
example {R : Type} {G M : Type*} [CommRing R] [Group G] [AddCommGroup M] [Module R M]
    (ρ : Representation R G M) (k : ℕ) :
    weightCoefficients ρ k = ρ.symmetricPower (k - 2) := sorry

-- R14.3/parabolic-cohomology: u is the actual support-forgetting map.
section Parabolic
variable {R C H C' H' : Type*} [CommRing R]
    [AddCommGroup C] [Module R C] [AddCommGroup H] [Module R H]
    [AddCommGroup C'] [Module R C'] [AddCommGroup H'] [Module R H']

def parabolicH1 (u : C →ₗ[R] H) : Submodule R H := LinearMap.range u

lemma mem_parabolicH1 (u : C →ₗ[R] H) (x : H) :
    x ∈ parabolicH1 u ↔ ∃ y, u y = x := sorry

def parabolicH1_inclusion (u : C →ₗ[R] H) : parabolicH1 u →ₗ[R] H :=
  (parabolicH1 u).subtype

def parabolicH1_map (u : C →ₗ[R] H) (v : C' →ₗ[R] H')
    (a : C →ₗ[R] C') (b : H →ₗ[R] H') (h : b.comp u = v.comp a) :
    parabolicH1 u →ₗ[R] parabolicH1 v := sorry

lemma parabolicH1_map_apply (u : C →ₗ[R] H) (v : C' →ₗ[R] H')
    (a : C →ₗ[R] C') (b : H →ₗ[R] H') (h : b.comp u = v.comp a)
    (x : parabolicH1 u) : (parabolicH1_map u v a b h x : H') = b x := sorry

lemma parabolicH1_compact (u : C →ₗ[R] H) (hu : Function.Surjective u) :
    parabolicH1 u = ⊤ := sorry

-- Test parabolicH1_id.
example : parabolicH1 (LinearMap.id : H →ₗ[R] H) = ⊤ := sorry
-- Test parabolicH1_zero.
example : parabolicH1 (0 : C →ₗ[R] H) = ⊥ := sorry
end Parabolic

-- R14.4/degeneracy-cohomology: a,b are the actual geometric pullbacks.
section Degeneracy
variable {R H H' H'' : Type*} [CommRing R]
    [AddCommGroup H] [Module R H] [AddCommGroup H'] [Module R H']
    [AddCommGroup H''] [Module R H'']

def degeneracyH1 (a b : H →ₗ[R] H') : H × H →ₗ[R] H' := a.coprod b

lemma degeneracyH1_apply (a b : H →ₗ[R] H') (x y : H) :
    degeneracyH1 a b (x,y) = a x + b y := sorry
lemma degeneracyH1_fst (a b : H →ₗ[R] H') (x : H) :
    degeneracyH1 a b (x,0) = a x := sorry
lemma degeneracyH1_snd (a b : H →ₗ[R] H') (y : H) :
    degeneracyH1 a b (0,y) = b y := sorry
lemma degeneracyH1_hecke (a b : H →ₗ[R] H') (t : H →ₗ[R] H)
    (t' : H' →ₗ[R] H') (ha : t'.comp a = a.comp t)
    (hb : t'.comp b = b.comp t) (x y : H) :
    t' (degeneracyH1 a b (x,y)) = degeneracyH1 a b (t x,t y) := sorry
lemma degeneracyH1_sign (a b : H →ₗ[R] H') (x y : H) :
    degeneracyH1 a b (x,-y) = a x - b y := sorry

-- Test degeneracyH1_comp.
example (a b : H →ₗ[R] H') (c : H' →ₗ[R] H'') :
    c.comp (degeneracyH1 a b) = degeneracyH1 (c.comp a) (c.comp b) := sorry
-- Test degeneracyH1_zero.
example : degeneracyH1 (0 : H →ₗ[R] H') 0 = 0 := sorry
end Degeneracy
-- Test degeneracyH1_first, specializing the scalar ring to ℤ.
example : degeneracyH1 (LinearMap.id : ℤ →ₗ[ℤ] ℤ) 0 (3,5) = 3 := sorry
-- Test degeneracyH1_diagonal.
example : degeneracyH1 (LinearMap.id : ℤ →ₗ[ℤ] ℤ) LinearMap.id (1,-1) = 0 := sorry

-- R14.4/congruence-classes: actual Γ(N), not an arbitrary finite-index kernel family.
-- Additive Γ(N) changes notation for the source law; the target is the additive field.
def congruenceClasses (N q : ℕ) [NeZero N] [Fact q.Prime] :
    Submodule (ZMod q) (AddMonoidHom (Additive (CongruenceSubgroup.Gamma N)) (ZMod q)) where
  carrier := {ψ | ∃ M : ℕ, 0 < M ∧ N ∣ M ∧
    ∀ γ : CongruenceSubgroup.Gamma N,
      (γ : Matrix.SpecialLinearGroup (Fin 2) ℤ) ∈ CongruenceSubgroup.Gamma M →
      ψ (Additive.ofMul γ) = 0}
  zero_mem' := sorry
  add_mem' := sorry
  smul_mem' := sorry

lemma mem_congruenceClasses (N q : ℕ) [NeZero N] [Fact q.Prime]
    (ψ : AddMonoidHom (Additive (CongruenceSubgroup.Gamma N)) (ZMod q)) :
    ψ ∈ congruenceClasses N q ↔ ∃ M : ℕ, 0 < M ∧ N ∣ M ∧
      ∀ γ : CongruenceSubgroup.Gamma N,
        (γ : Matrix.SpecialLinearGroup (Fin 2) ℤ) ∈ CongruenceSubgroup.Gamma M →
        ψ (Additive.ofMul γ) = 0 := sorry

lemma congruenceClasses_refine (N M M' q : ℕ) [NeZero N] [Fact q.Prime]
    (h : M ∣ M')
    (ψ : AddMonoidHom (Additive (CongruenceSubgroup.Gamma N)) (ZMod q))
    (hψ : ∀ γ : CongruenceSubgroup.Gamma N,
      (γ : Matrix.SpecialLinearGroup (Fin 2) ℤ) ∈ CongruenceSubgroup.Gamma M →
      ψ (Additive.ofMul γ) = 0) :
    ∀ γ : CongruenceSubgroup.Gamma N,
      (γ : Matrix.SpecialLinearGroup (Fin 2) ℤ) ∈ CongruenceSubgroup.Gamma M' →
      ψ (Additive.ofMul γ) = 0 := sorry

-- Test congruenceClasses_zero.
example (N q : ℕ) [NeZero N] [Fact q.Prime] (hN : 0 < N) :
    (0 : AddMonoidHom (Additive (CongruenceSubgroup.Gamma N)) (ZMod q)) ∈
      congruenceClasses N q := sorry
-- Test congruenceClasses_joint; the common level is lcm of witness levels.
example (N q : ℕ) [NeZero N] [Fact q.Prime]
    (ψ φ : AddMonoidHom (Additive (CongruenceSubgroup.Gamma N)) (ZMod q))
    (hψ : ψ ∈ congruenceClasses N q) (hφ : φ ∈ congruenceClasses N q) :
    ψ + φ ∈ congruenceClasses N q := sorry

private def restrictPrincipalCharacter (N D q : ℕ) (hND : N ∣ D)
    (ψ : Additive (CongruenceSubgroup.Gamma N) →+ ZMod q) :
    Additive (CongruenceSubgroup.Gamma D) →+ ZMod q where
  toFun γ := ψ (Additive.ofMul ⟨γ.toMul.val,
    CongruenceSubgroup.Gamma_le_Gamma_of_dvd hND γ.toMul.property⟩)
  map_zero' := sorry
  map_add' := sorry

lemma congruenceClasses_restrict (N D q : ℕ) [NeZero N] [NeZero D] [Fact q.Prime]
    (hND : N ∣ D) (ψ : Additive (CongruenceSubgroup.Gamma N) →+ ZMod q)
    (hψ : ψ ∈ congruenceClasses N q) :
    restrictPrincipalCharacter N D q hND ψ ∈ congruenceClasses D q := sorry

-- The subgroup quotient is the actual finite congruence quotient when N∣M.
lemma congruenceClasses_quotient (N M q : ℕ) [NeZero N] [Fact q.Prime]
    (ψ : Additive (CongruenceSubgroup.Gamma N) →+ ZMod q)
    (hψ : ∀ γ : CongruenceSubgroup.Gamma N,
      (γ : Matrix.SpecialLinearGroup (Fin 2) ℤ) ∈ CongruenceSubgroup.Gamma M →
      ψ (Additive.ofMul γ) = 0)
    [((CongruenceSubgroup.Gamma M).comap (CongruenceSubgroup.Gamma N).subtype).Normal] :
    ∃! φ : Additive (CongruenceSubgroup.Gamma N ⧸
        (CongruenceSubgroup.Gamma M).comap (CongruenceSubgroup.Gamma N).subtype) →+ ZMod q,
      ∀ γ : CongruenceSubgroup.Gamma N,
        φ (Additive.ofMul (QuotientGroup.mk' _ γ)) = ψ (Additive.ofMul γ) := sorry

-- H¹/characters is already present in the baseline.
def congruenceClasses_H1 (N q : ℕ) [Fact q.Prime] :
    groupCohomology.H1 (Rep.trivial (ZMod q) (CongruenceSubgroup.Gamma N) (ZMod q)) ≅
      ModuleCat.of (ZMod q) (Additive (CongruenceSubgroup.Gamma N) →+ ZMod q) :=
  groupCohomology.H1IsoOfIsTrivial _

-- Test congruenceClasses_finiteQuotient: a character killing a deeper kernel is a member.
example (N M q : ℕ) [NeZero N] [Fact q.Prime] (hM : 0 < M) (hNM : N ∣ M)
    (ψ : Additive (CongruenceSubgroup.Gamma N) →+ ZMod q)
    (hψ : ∀ γ : CongruenceSubgroup.Gamma N,
      (γ : Matrix.SpecialLinearGroup (Fin 2) ℤ) ∈ CongruenceSubgroup.Gamma M →
      ψ (Additive.ofMul γ) = 0) : ψ ∈ congruenceClasses N q := sorry

-- Test congruenceClasses_noncongruence. Ordinary Γ(3) has free rank-three abelianization.
example [Fact (Nat.Prime 5)] : congruenceClasses 3 5 = ⊥ := sorry

-- R14.5/newform-hecke-prime: χ is the supplied eigenvalue character.
def heckePrime {T K : Type*} [CommRing T] [Field K] (χ : T →+* K) : Ideal T :=
  RingHom.ker χ
lemma mem_heckePrime {T K : Type*} [CommRing T] [Field K] (χ : T →+* K) (t : T) :
    t ∈ heckePrime χ ↔ χ t = 0 := sorry
lemma heckePrime_isPrime {T K : Type*} [CommRing T] [Field K] (χ : T →+* K) :
    (heckePrime χ).IsPrime := sorry
lemma heckePrime_conjugate {T K L : Type*} [CommRing T] [Field K] [Field L]
    (χ : T →+* K) (σ : K →+* L) : heckePrime (σ.comp χ) = heckePrime χ := sorry
-- Test heckePrime_int.
example : heckePrime (Int.castRingHom ℚ) = ⊥ := sorry
-- Test heckePrime_projection.
example : heckePrime (RingHom.fst ℚ ℚ) =
    { carrier := {x | x.1 = 0}
      zero_mem' := by simp
      add_mem' := by intros; simp_all
      smul_mem' := by intros; simp_all } := sorry
-- Test heckePrime_embedding.
example {T K L : Type*} [CommRing T] [Field K] [Field L]
    (χ : T →+* K) (σ : K →+* L) : heckePrime (σ.comp χ) = heckePrime χ := sorry

-- Algebraic core of R14.5/modular-quotient-dimension. Does not construct A_f.
theorem free_rank_two_quotient {A V : Type*} [CommRing A] [AddCommGroup V]
    [Module A V] [Module.Free A V] [Module.Finite A V] [Nontrivial A]
    (h : Module.finrank A V = 2) (P : Ideal A) [P.IsPrime] :
    Module.Free (A ⧸ P) (TensorProduct A (A ⧸ P) V) ∧
      Module.finrank (A ⧸ P) (TensorProduct A (A ⧸ P) V) = 2 := sorry

-- R14.6/supersingular-character-lattice: S is the geometric intersection set.
def supersingularDegreeZero (S : Type*) : Submodule ℤ (S →₀ ℤ) :=
  LinearMap.ker (Finsupp.linearCombination ℤ (fun _ : S => (1 : ℤ)))
lemma mem_supersingularDegreeZero {S : Type*} (z : S →₀ ℤ) :
    z ∈ supersingularDegreeZero S ↔ z.sum (fun _ n => n) = 0 := sorry

def supersingularDifference {S : Type*} (s t : S) : supersingularDegreeZero S :=
  ⟨Finsupp.single s 1 - Finsupp.single t 1, by sorry⟩
lemma supersingularDifference_diagonal {S : Type*} (s : S) :
    supersingularDifference s s = 0 := sorry
-- Test supersingularDegreeZero_singleton.
example : supersingularDegreeZero Unit = ⊥ := sorry
-- Test supersingularDegreeZero_two.
example : ∃ e : supersingularDegreeZero (Fin 2) ≃ₗ[ℤ] ℤ,
    e (supersingularDifference (0 : Fin 2) 1) = 1 := sorry
-- Test supersingularDegreeZero_difference.
example {S : Type*} (s t : S) (h : s ≠ t) :
    supersingularDifference s t ≠ 0 := sorry

-- R14.6/taylor-wiles-cover: ξ is complex conjugation on the supplied cover H¹.
section Minus
variable {O M M' : Type*} [CommRing O] [AddCommGroup M] [Module O M]
    [AddCommGroup M'] [Module O M']

def taylorWilesMinus (ξ : M →ₗ[O] M) : Submodule O M :=
  LinearMap.ker (ξ + LinearMap.id)
lemma mem_taylorWilesMinus (ξ : M →ₗ[O] M) (x : M) :
    x ∈ taylorWilesMinus ξ ↔ ξ x = -x := sorry
-- The actual projector, with an explicit inverse of 2 in O.
def taylorWilesMinus_projector (ξ : M →ₗ[O] M) (u : Oˣ) : M →ₗ[O] M :=
  (↑u⁻¹ : O) • (LinearMap.id - ξ)
lemma taylorWilesMinus_projector_range (ξ : M →ₗ[O] M)
    (hξ : ξ.comp ξ = LinearMap.id) (u : Oˣ) (hu : (u : O) = 2) :
    LinearMap.range (taylorWilesMinus_projector ξ u) = taylorWilesMinus ξ := sorry
lemma taylorWilesMinus_coefficients (ξ : M →ₗ[O] M) (ξ' : M' →ₗ[O] M')
    (f : M →ₗ[O] M') (h : f.comp ξ = ξ'.comp f) (x : M)
    (hx : x ∈ taylorWilesMinus ξ) : f x ∈ taylorWilesMinus ξ' := sorry
-- Test taylorWilesMinus_neg.
example : taylorWilesMinus (-LinearMap.id : M →ₗ[O] M) = ⊤ := sorry
end Minus
-- Test taylorWilesMinus_id.
example : taylorWilesMinus (LinearMap.id : ℚ →ₗ[ℚ] ℚ) = ⊥ := sorry
-- Test taylorWilesMinus_swap.
example (x y : ℚ) :
    (x,y) ∈ taylorWilesMinus (LinearEquiv.prodComm ℚ ℚ ℚ).toLinearMap ↔ y = -x := sorry
-- Test taylorWilesMinus_two: characteristic-two failure of the complementary projector.
example : taylorWilesMinus (LinearMap.id : ZMod 2 →ₗ[ZMod 2] ZMod 2) = ⊤ := sorry


/-
Declaration registry and deferred geometric signatures

The following are mathematical signatures, APIs and tests awaiting supplier carriers
or the proof-interface refinements stated in the roadmap. Names also prototyped above
are identified explicitly. No commented signature is an elaborated declaration, and
no hypothesis is replaced by a field whose content merely asserts the desired result.
In particular the typed image/character/lattice cores above are not constructions of
the modular curve, its universal family, its geometric maps or its Jacobian.

ModularCurvesPartII:R14.3/weight-two-shimura-isomorphism
Theorem: For N ≥ 5, the Hodge decomposition gives S₂(Γ₁(N), ℂ) ⊕ S̄₂(Γ₁(N), ℂ) ≅ H¹(X₁(N)^an, ℤ) ⊗ ℂ, and it identifies ⟨n⟩ ⊕ ⟨n⟩̄ with ⟨n⟩^*, T_p ⊕ T̄_p with T_p^* = (π₁^{(p)})_* ∘ (π₂^{(p)})^* and w_N ⊕ w̄_N with w^*_{e^{2πi/N}}, where π₁^{(p)}, π₂^{(p)} : X₁(N, p) → X₁(N) are the degeneracy maps and (π₁^{(p)})_* is the trace.
Hypotheses: N ≥ 5 (for N < 5 both sides vanish); the Betti-side integral structure is Tau Ceti ModularForms Layer 8's modular-symbol lattice, whose comparison with H¹(X₁(N)^an, ℤ) is part of this stage.
Proposed theorem name: TauCeti.ModularCurves.weight_two_shimura_isomorphism (deferred full statement above).
Sources: RIBET-STEIN-SERRE-LECTURES, Appendix by B. Conrad, p. 64 (printed page; PDF page 68); RIBET-STEIN-SERRE-LECTURES, Appendix by B. Conrad, p. 65 (printed page; PDF page 69)

ModularCurvesPartII:R14.3/cup-product-petersson
Theorem: With H²(X₁(N)^an, ℤ) ≅ ℤ by the i-orientation, the cup product pairing on H¹(X₁(N)^an, ℤ) and the non-normalised Petersson product satisfy (Sh(f₁ + ḡ₁), Sh(f₂ + ḡ₂)) = 4π(⟨f₁, g₂⟩ − ⟨f₂, g₁⟩).
Hypotheses: The cup-product pairing is perfect; the Petersson integral converges by exponential decay at the cusps.
Proposed theorem name: TauCeti.ModularCurves.cup_product_petersson (deferred full statement above).
Sources: RIBET-STEIN-SERRE-LECTURES, Appendix by B. Conrad, p. 66 (printed page; PDF page 70)

ModularCurvesPartII:R14.3/hecke-twisted-self-adjoint
Lemma: With [x, y] = (x, w^*_ζ y) for ζ = e^{2πi/N}, every T ∈ T₁(N) is self-adjoint on H¹(X₁(N)^an, ℤ); for (·,·) the adjoint of T_p^* (p ∤ N) is ⟨p⁻¹⟩^* T_p^* and that of ⟨n⟩^* is ⟨n⁻¹⟩^*. The same holds for any primitive N-th root ζ.
Hypotheses: T₁(N) ⊂ End_ℤ H¹(X₁(N)^an, ℤ) generated by the T_p^* and ⟨n⟩^*; commutative and finite flat over ℤ (Tau Ceti ModularForms Layer 8 owns the integral Hecke algebra).
Proposed lemma name: TauCeti.ModularCurves.hecke_twisted_self_adjoint (deferred full statement above).
Sources: RIBET-STEIN-SERRE-LECTURES, Appendix by B. Conrad, p. 66 (printed page; PDF page 70)

ModularCurvesPartII:R14.3/betti-free-rank-two
Theorem: H¹(X₁(N)^an, ℚ) is free of rank 2 over ℚ ⊗ T₁(N), and Hom_ℚ(ℚ ⊗ T₁(N), ℚ) is free of rank 1 (ℚ ⊗ T₁(N) is Gorenstein). Consequently V_ℓ(N) = ℚ_ℓ ⊗ T_ℓ(J₁(N)) is free of rank 2 over ℚ_ℓ ⊗ T₁(N) for either Hecke action.
Hypotheses: Characteristic zero coefficients; integral freeness is not claimed (it can fail at Eisenstein maximal ideals).
Proposed theorem name: TauCeti.ModularCurves.betti_free_rank_two (deferred full statement above).
Sources: RIBET-STEIN-SERRE-LECTURES, Appendix by B. Conrad, p. 69 (printed page; PDF page 73); RIBET-STEIN-SERRE-LECTURES, Appendix by B. Conrad, p. 70 (printed page; PDF page 74)

ModularCurvesPartII:R14.3/relative-coefficient-system
Construction: For the universal elliptic curve f:E→Y₁(N), N≥5, construct L_B=R¹f_an,*ℤ and L_{ℓ,n}=R¹f_et,*ℤ/ℓⁿ, with ℓ invertible on the base. Their geometric fibres are H¹ of the elliptic fibre, locally free of rank two. For r=k−2≥0 set L_r=Sym^r L, of rank r+1. The coefficient maps along an isogeny are induced by its pullback on relative H¹; integral lattices and duals are retained before any inversion of ℓ.
Hypotheses: A universal elliptic curve from R13.2; k≥2, n≥1, ℓ prime; finite étale statements require ℓ invertible. For coarse levels lacking a fine universal family, use a supplied fine cover with its descent data; descent invariants are not exact if the deck-group order is not invertible.
TauCeti.ModularCurves.relativeBettiH1 [deferred signature]: The rank-two Betti local system of the supplied universal elliptic family.
TauCeti.ModularCurves.relativeEtaleH1 [deferred signature]: The finite ℤ/ℓⁿ relative degree-one étale local system.
TauCeti.ModularCurves.weightCoefficients [typed core above; geometric specialization still required]: Sym^{k−2} of the relative H¹ local system, using the existing representation symmetric-power functor.
TauCeti.ModularCurves.weightCoefficients_fibre [deferred signature]: Its fibre at y is Sym^{k−2} H¹(E_y,A), naturally in y and the coefficient ring A.
TauCeti.ModularCurves.weightCoefficients_isogeny [deferred signature]: The coefficient morphism is Sym^{k−2} of the isogeny pullback; identity and composite isogenies give identity and composite maps.
TauCeti.ModularCurves.weightCoefficients_compare [deferred signature]: Artin comparison identifies the finite Betti and étale systems and their isogeny maps.
example weightCoefficients_two [degenerate; deferred until its stated geometric carrier or comparison exists]: At k=2, Sym⁰ L is the constant rank-one system.
example weightCoefficients_three [computation; deferred until its stated geometric carrier or comparison exists]: At k=3, a fibre is L_y and has rank two.
example weightCoefficients_compat [compatibility; typed above]: On every monodromy representation ρ, the action is exactly Representation.symmetricPower ρ (k−2).
example weightCoefficients_unipotent [non-example; deferred until its stated geometric carrier or comparison exists]: At k=3 a cusp loop with fibre matrix [[1,w],[0,1]], w nonzero, acts nontrivially over ℤ; the coefficient system is not constant.
Sources: DELIGNE-355, §§3.9–3.11, pp. 154–156; §3.16, pp. 157–158

ModularCurvesPartII:R14.3/parabolic-cohomology
Construction: For j:Y→X the supplied compactification and the geometric L_r with A=O, O/πⁿ or K=Frac(O), define H¹_par(Y,L_r)=im(H¹_c(Y,L_r)→H¹(Y,L_r)). Define finite étale analogues first and take compatible inverse limits for the O-adic realization, with O a finite extension of ℤ_ℓ. For constant weight-two coefficients, H¹_par(Y,A)=im(H¹(X,A)→H¹(Y,A)); for these smooth curves the latter map is injective. Twisted coefficients use j_*L_r and the local boundary sequence, not extension by zero identified with direct image.
Hypotheses: N≥5 or a supplied torsion-free fine cover; j and its finite cusp set D=X\Y are fixed. Adic notation denotes the inverse-limit lattice, not merely tensoring rational Deligne cohomology.
TauCeti.ModularCurves.parabolicH1 [typed core above; geometric specialization still required]: The image submodule of the actual support-forgetting map u:H¹_c→H¹.
TauCeti.ModularCurves.mem_parabolicH1 [typed core above; geometric specialization still required]: x lies in parabolicH1 u exactly when x=u(y) for a compact-support class y.
TauCeti.ModularCurves.parabolicH1_inclusion [typed core above; geometric specialization still required]: The canonical injection into ordinary H¹.
TauCeti.ModularCurves.parabolicH1_map [typed core above; geometric specialization still required]: For a commuting square b∘u=v∘a, b induces a map of the images; identity and composition are respected.
TauCeti.ModularCurves.parabolicH1_compact [typed core above; geometric specialization still required]: For proper Y=X, the support map is an isomorphism and parabolic H¹ is ordinary H¹.
TauCeti.ModularCurves.parabolicH1_inverseLimit [deferred signature]: Under the finite generation and transition hypotheses of integral-comparison, the finite-level parabolic system recovers the specified O-lattice.
example parabolicH1_id [degenerate; typed above]: The image of the identity support map is the entire module.
example parabolicH1_zero [computation; typed above]: A zero support map has zero parabolic image.
example parabolicH1_Gm [non-example; deferred until its stated geometric carrier or comparison exists]: For Y=G_m(C), constant ℤ coefficients, ordinary H¹≅ℤ but parabolic H¹=0.
example parabolicH1_compact_test [compatibility; deferred until its stated geometric carrier or comparison exists]: For the compact curve X₀(11), parabolic constant ℤ H¹ has rank two.
Sources: DELIGNE-355, Definition 3.9, pp. 154–155; (3.20), pp. 159–160

ModularCurvesPartII:R14.3/boundary-exact-sequence
Theorem: For a smooth open complex or étale curve with finite puncture set D, the support-forgetting map fits into the cohomology sequence of j_!L→Rj_*L→i_*i^*Rj_*L. In degree one, H¹_par is ker(H¹(Y,L)→⊕_{c∈D}H¹(I_c,L_c)); the neighboring H⁰ and H²_c terms are retained. For trivial A coefficients on a connected curve with s cusps, 0→H¹(X,A)→H¹(Y,A)→A^D→A→0 is exact, where the last map sums residues (and the étale terms carry the residue Tate twist).
Hypotheses: ℓ is invertible for étale coefficients; local punctured-disc/tame inertia comparison is part of the supplier request. The displayed constant-coefficient residue sequence ending A→0 assumes D is nonempty. If D is empty, retain H²(X,A) and use the identity support map; there is no final residue-surjection claim.
Proposed theorem name: TauCeti.ModularCurves.boundary_exact_sequence (deferred full statement above).
Sources: DELIGNE-355, Definition 3.9 and (3.20), pp. 154–155, 159–160

ModularCurvesPartII:R14.3/integral-comparison
Comparison: For the supplied smooth finite-type modular curves over Q̄, a chosen embedding Q̄↪C, and finite locally constant ℤ/ℓⁿ coefficients from the universal family, Artin comparison gives H^i_et(Y,L_{r,ℓ,n})≅H^i_B(Y_an,L_{r,B}/ℓⁿ), with compact-support analogues and their support maps. These identify finite parabolic images. After proving the required inverse-limit exactness and finite generation, they give the adic comparison; for r=0 this also identifies the actual compact-curve lattice with Mathlib’s pro-étale EllAdicCohomology in degree one. Pullback, trace, cup product and level maps commute with comparison.
Hypotheses: The comparison includes local-system coefficients and compact support, not merely constant rational cohomology. Derived-limit obstructions must be eliminated by finite coefficient Mittag–Leffler systems; reduction modulo π commutes only under the torsion hypotheses of localized-freeness.
Proposed comparison name: TauCeti.ModularCurves.integral_comparison (deferred full statement above).
Sources: DELIGNE-355, Definition 3.9 and discussion of W_ℓ, pp. 154–156; Corollary 4.2, p. 161

ModularCurvesPartII:R14.3/geometric-hecke-coefficients
Theorem: For a good prime q∤Nℓ and the actual isogeny correspondence Y₁(N,q) with maps q₁,q₂ and its universal isogeny, T_q on H¹_par(Y,L_r) is trace along q₁ after pullback along q₂ and the induced coefficient map. Its comparison with the classical weight k=r+2 operator uses Deligne’s normalization, including the q^{r+1} term in the good-prime Hecke polynomial. Diamond and prime-to-level degeneracy maps preserve the parabolic image; functorial traces satisfy the projection formula and trace∘pullback=degree.
Hypotheses: Both direction and scalar normalization are fixed by the universal isogeny, not by an arbitrary action on an unnamed cohomology module.
Proposed theorem name: TauCeti.ModularCurves.geometric_hecke_coefficients (deferred full statement above).
Sources: DELIGNE-355, Propositions 3.18–3.19 and (3.20), pp. 158–160

ModularCurvesPartII:R14.3/parabolic-duality
Theorem: The elliptic cup product L⊗L→A(−1) induces Sym^r L⊗Sym^r L→A(−r). For A=K it is perfect. For finite or integral coefficients assume r! is a unit (in particular ℓ>r); then the symmetrized tensor pairing is perfect with the chosen normalization. On parabolic H¹ it induces a pairing into A(−r−1), alternating for even r and symmetric for odd r. The rational pairing is nondegenerate; integral/finite perfection is exported only in the localized setting of localized-freeness, where boundary and coefficient-reduction obstructions vanish. Pullback and trace are adjoint.
Hypotheses: A complete DVR O of residue characteristic ℓ; finite coefficients O/πⁿ; integral conclusion additionally needs finite freeness and boundary conditions. At ℓ≤r no integral perfectness is inferred from Deligne’s rational statement; a different divided-power lattice would require its own comparison.
Proposed theorem name: TauCeti.ModularCurves.parabolic_duality (deferred full statement above).
Sources: DELIGNE-355, (3.20), pp. 159–160

ModularCurvesPartII:R14.3/boundary-non-eisenstein
Theorem: For weight-two constant coefficients at a torsion-free congruence level and an anemic Hecke maximal ideal m of residue characteristic ℓ≥3, call m non-Eisenstein if its good-prime eigenvalues are not ψ₁(q)+qψ₂(q) with ψ₁,ψ₂ finite congruence characters and diamond product ψ₁ψ₂. The cusp boundary modules and H⁰(Y,O/π) have only those Eisenstein eigensystems. Thus they vanish after localization at m, and H¹_c→H¹ identifies its localized image with ordinary localized H¹. For Sym^r coefficients the same implication is a separate requested calculation, not an assertion from the weight-two source.
Hypotheses: Anemic operators exclude level and residue-characteristic primes; fine level removes stabilizer torsion. In weight two this definition is an algebraic Hecke condition; the identification with residual Galois irreducibility is a consequence in R19, not a prerequisite here.
Proposed theorem name: TauCeti.ModularCurves.boundary_non_eisenstein (deferred full statement above).
Sources: TAYLOR-WILES, Proof of Proposition 1 and preceding localization setup, author pp. 6–8

ModularCurvesPartII:R14.3/localized-freeness
Theorem: For a torsion-free congruence modular curve Y and a finite free O-local system L, H¹(Y,L) is O-finite. If H⁰(Y,L/π)_m=0, the localized group H¹(Y,L)_m is O-torsion-free, hence O-free; if in addition the boundary sequence localizes to zero, it equals H¹_par(Y,L)_m, and reduction gives H¹_par(Y,L)_m/πⁿ≅H¹_par(Y,L/πⁿ)_m. Constant weight-two coefficients satisfy these conditions at the non-Eisenstein ideals of boundary-non-eisenstein. Higher-weight claims retain the displayed vanishing conditions until the separate boundary gap is resolved.
Hypotheses: O is a complete DVR finite over ℤ_ℓ; anemic localization is a direct summand of the completed O-finite Hecke module. Use a finite graph deformation retract of the noncompact torsion-free quotient; its two-term cochain complex has finite free terms.
Proposed theorem name: TauCeti.ModularCurves.localized_freeness (deferred full statement above).
Sources: TAYLOR-WILES, Proof of Proposition 1, author pp. 7–8; DELIGNE-355, Definition 3.9 and (3.20), pp. 154–155, 159–160

ModularCurvesPartII:R14.3/symbols-geometric-comparison
Comparison: For the supplied torsion-free congruence quotient, identify the homological modular-symbol module of ModularForms Layer 8 with relative H₁(X_an,D;Sym^r lattice) using its Manin presentation, with the appropriate coefficient dual when pairing against L_r. The boundary map corresponds to restriction to cusp divisors. The cuspidal kernel modulo torsion pairs with H¹_par; rationally, and integrally under the torsion and perfectness hypotheses already displayed, this gives its dual cohomological lattice. The period map of ModularForms is integration against this homology and acts on symbols by transpose, not by an identification of forms with symbols.
Hypotheses: The symbol lattice is the existing coinvariants of Div⁰(P¹(Q))⊗Sym^r(ℤ²), not a second definition of that object. Integral conclusions use the local coefficient dual and saturation; the whole symbol module contains boundary and may contain torsion.
Proposed comparison name: TauCeti.ModularCurves.symbols_geometric_comparison (deferred full statement above).
Sources: DELIGNE-355, §3.11, p. 156 and (3.20), pp. 159–160; RIBET-STEIN-SERRE-LECTURES, Theorems 5.1–5.2, pp. 65–66

ModularCurvesPartII:R14.3/weight-two-tate-comparison
Comparison: For J=Pic⁰(X₁(N)/Q), the canonical comparison identifies T_ℓJ with H¹_et(X₁(N)_Q̄,ℤ_ℓ(1)) and with the dual of untwisted H¹, using the principal polarization; equivalently T_ℓJ is integral first homology after Betti comparison. The comparison is functorial for Picard and Albanese actions, which are adjoint rather than identical. After tensoring Q_ℓ it transports the rational rank-two computation to V_ℓJ for both Hecke conventions.
Hypotheses: This comparison precedes rank-two freeness. The initial Tate carrier and functoriality from R14.2 must not depend on betti-free-rank-two.
Proposed comparison name: TauCeti.ModularCurves.weight_two_tate_comparison (deferred full statement above).
Sources: RIBET-STEIN-SERRE-LECTURES, §5.1, (5.4) and Theorem 5.8, pp. 68–69; Corollary 5.9, pp. 69–70

ModularCurvesPartII:R14.4/degeneracy-cohomology
Construction: For Γ=Γ₁(N) and p prime with p∤N, put Γ′=Γ₁(N)∩Γ₀(p); both maps δ₁,δ_p:X_Γ′→X_Γ come from the moduli correspondence. With the specified isogeny coefficient maps, define d_p(x,y)=δ₁^*x+δ_p^*y on the compact, ordinary, compact-support or parabolic cohomology groups where those maps are defined. On ordinary group characters the kernel equation is equally expressed by D_p(ψ,φ)=ψ|_{Γ′}−φ∘(g↦AgA⁻¹), A=diag(p,1), after negating the second summand. This sign change is recorded, not treated as a change of level.
Hypotheses: Mixed Γ₁(N)∩Γ₀(p) is not Γ₁(Np). Coefficients O or O/πⁿ; constant coefficients for the integral compact Ihara result, Sym^r only with explicitly checked coefficient maps.
TauCeti.ModularCurves.degeneracyH1 [typed core above; geometric specialization still required]: For the actual pullbacks a,b:H→H′, degeneracyH1 a b sends (x,y) to a(x)+b(y).
TauCeti.ModularCurves.degeneracyH1_apply [typed core above; geometric specialization still required]: Evaluation on a pair is the sum of its two geometric images.
TauCeti.ModularCurves.degeneracyH1_fst [typed core above; geometric specialization still required]: The first source inclusion composes to a.
TauCeti.ModularCurves.degeneracyH1_snd [typed core above; geometric specialization still required]: The second source inclusion composes to b.
TauCeti.ModularCurves.degeneracyH1_hecke [typed core above; geometric specialization still required]: If a and b intertwine the same anemic operators, their coprod intertwines the product action.
TauCeti.ModularCurves.degeneracyH1_sign [typed core above; geometric specialization still required]: Negating the second source converts the sum convention into the ordinary restriction-difference convention.
example degeneracyH1_first [computation; typed above]: With a=id and b=0 on O, (3,5) maps to 3.
example degeneracyH1_diagonal [non-example; typed above]: With a=b=id on O, (1,−1) is in the kernel; injection is a geometric theorem, not a generic property of coprods.
example degeneracyH1_zero [degenerate; typed above]: Two zero maps give the zero map.
example degeneracyH1_comp [compatibility; typed above]: Postcomposing by c gives degeneracyH1 (c∘a) (c∘b).
Sources: RIBET-1984, §3, p. 507; §4, pp. 510–513; CDT-2025, §4.6, Lemma 4.6.2, p. 33

ModularCurvesPartII:R14.4/modular-amalgam
Theorem: For N≥3 and prime p∤N, let Γ_N(R)=ker(SL₂(R)→SL₂(ℤ/N)) for R=ℤ[1/p], and Γ(N)=Γ_N(ℤ). The natural inclusions and conjugation by A=diag(p,1) identify Γ_N(ℤ[1/p]) with Γ(N)*_{Γ(N)∩Γ₀(p)}A⁻¹Γ(N)A. The associated SL₂(Q_p) lattice tree has a fundamental edge with these vertex and edge stabilizers; the action preserves vertex type. The central quotient or signed Γ(N) variant must be changed consistently throughout the presentation.
Hypotheses: p and N are coprime; A is invertible over ℤ[1/p] and conjugates preserve reduction level because p is a unit modulo N. The tree vertices are homothety classes of rank-two ℤ_p lattices; adjacent representatives have quotient of order p.
Proposed theorem name: TauCeti.ModularCurves.modular_amalgam (deferred full statement above).
Sources: SERRE-TREES, II §1.4, Theorem 3 and Corollary 2, p. 110; CDT-2025, §4.4, pp. 27–28; proof of Lemma 4.6.2, pp. 33–34

ModularCurvesPartII:R14.4/congruence-subgroup-property
Theorem: For a prime p every finite-index subgroup H of SL₂(ℤ[1/p]) contains ker(SL₂(ℤ[1/p])→SL₂(ℤ/m)) for some positive m coprime to p. The same conclusion, intersected with Γ_N(ℤ[1/p]), holds for every finite-index subgroup of that principal-level group. This is the split real S-arithmetic specialization of Serre’s congruence kernel theorem, with S={∞,p}; it is not a statement about all finite-index subgroups of SL₂(ℤ).
Hypotheses: Serre’s condition |S|≥2 and the real-place alternative both hold. The proof uses the specific S-arithmetic congruence kernel theorem; its deeper central-extension input is recorded as a gap rather than imported from an unrelated profinite-power roadmap.
Proposed theorem name: TauCeti.ModularCurves.congruence_subgroup_property (deferred full statement above).
Sources: SERRE-CSP, §2.6, Theorem 2 and Corollary 3, pp. 498–500; CDT-2025, Proof of Lemma 4.6.2, p. 34

ModularCurvesPartII:R14.4/lyndon-exact-sequence
Theorem: For the actual amalgam G=G₁*_{H}G₂ of modular-amalgam and a G-module M, there is a natural exact sequence …→H^i(G,M)→H^i(G₁,M)⊕H^i(G₂,M)→H^i(H,M)→H^{i+1}(G,M)→…, with the middle map the difference of restrictions along the two embeddings. At i=0 it begins with invariants. The same sequence is equivariant for double-coset maps that preserve the diagram, using restriction and transfer with the displayed coefficient actions.
Hypotheses: M is an actual representation of the amalgam; the two restricted modules on H are identified through that representation. The degree of the first displayed group is i, not i−1.
Proposed theorem name: TauCeti.ModularCurves.lyndon_exact_sequence (deferred full statement above).
Sources: SERRE-TREES, II §2.8, Proposition 13 and example, pp. 168–170; CALEGARI-GERAGHTY, Lemma 9.6, pp. 89–90 (author preprint); Springer-layout author copy PDF pp. 122–123

ModularCurvesPartII:R14.4/congruence-classes
Definition: For Γ(N)⊂SL₂(ℤ), N≥3, and a prime q, identify ordinary H¹(Γ(N),F_q) with Hom(Γ(N),F_q) for the trivial additive action. Define H¹_cong as the subspace of characters ψ for which Γ(M)⊂ker ψ for some positive M divisible by N. Equivalently it is the directed union of the pullbacks of characters of finite congruence quotients Γ(N)/Γ(M). It is not defined as all ordinary cohomology or as the parabolic subspace.
Hypotheses: All principal kernels are taken in SL₂(ℤ), consistently with the chosen signed/central quotient convention.
TauCeti.ModularCurves.congruenceClasses [typed core above; geometric specialization still required]: For the directed family Γ(M) inside Γ(N), the submodule of additive characters killing one of these kernels.
TauCeti.ModularCurves.mem_congruenceClasses [typed core above; geometric specialization still required]: Membership is equivalent to vanishing on some Γ(M), N|M.
TauCeti.ModularCurves.congruenceClasses_refine [typed core above; geometric specialization still required]: A character killing Γ(M) also kills Γ(M′) whenever M|M′.
TauCeti.ModularCurves.congruenceClasses_quotient [typed core above; geometric specialization still required]: A character killing Γ(M) descends uniquely to Γ(N)/Γ(M).
TauCeti.ModularCurves.congruenceClasses_restrict [typed core above; geometric specialization still required]: Restriction to a deeper principal subgroup preserves congruence classes.
TauCeti.ModularCurves.congruenceClasses_H1 [typed core above; geometric specialization still required]: The classifying map is the actual trivial-action H¹/character isomorphism.
example congruenceClasses_zero [degenerate; typed above]: The zero character kills every deeper principal subgroup.
example congruenceClasses_finiteQuotient [compatibility; typed above]: Pulling back a character of Γ(N)/Γ(M) gives a member.
example congruenceClasses_joint [characterisation; typed above]: If ψ kills Γ(M₁) and φ kills Γ(M₂), ψ+φ kills Γ(lcm(M₁,M₂)).
example congruenceClasses_noncongruence [non-example; typed above]: At Γ(3) with F₅ coefficients the congruence subspace is zero, whereas ordinary H¹ has dimension three. A nonzero ordinary character is therefore not a congruence class. Use the pro-3 level factor and the perfectness/abelianization of the other SL₂(Z_p) factors, as in CDT §4.5, to check the finite congruence quotients.
Sources: CDT-2025, §4.5, definition of H¹_cong, pp. 29–30; Lemma 4.6.2, p. 33

ModularCurvesPartII:R14.4/principal-ihara
Theorem: For N≥3 and primes p,q with p∤N, the kernel of D_p:H¹(Γ(N),F_q)²→H¹(Γ(N)∩Γ₀(p),F_q), D_p(ψ,φ)(g)=ψ(g)−φ(AgA⁻¹), is contained in H¹_cong(Γ(N),F_q)². There is no requirement q≠p in this ordinary character theorem, and no unconditional injectivity assertion.
Hypotheses: Trivial F_q coefficients; ordinary group cohomology, not compact cohomology or an arbitrary Sym^r system.
Proposed theorem name: TauCeti.ModularCurves.principal_ihara (deferred full statement above).
Sources: CDT-2025, Lemma 4.6.2 with proof, pp. 33–34

ModularCurvesPartII:R14.4/enhanced-ihara
Theorem: With N,p,q as in principal-ihara, the kernel of the same restriction difference into H¹(Γ(N)∩Γ₁(p),F_q) is also contained in H¹_cong(Γ(N),F_q)². The congruence-invariance criterion used here says that if every conjugation difference for a character of a principal subgroup is congruence, then the character itself is congruence, as in CDT Corollary 4.5.3 with the SL₂(Z/N)-action induced by ambient SL₂(ℤ) conjugations.
Hypotheses: This is still trivial-coefficient ordinary H¹ and still a kernel bound, not automatic injectivity.
Proposed theorem name: TauCeti.ModularCurves.enhanced_ihara (deferred full statement above).
Sources: CDT-2025, Corollary 4.5.3, p. 29; Lemma 4.6.3, p. 34

ModularCurvesPartII:R14.4/compact-ihara
Theorem: For N≥5 and prime p∤N, let X′ be the compact curve of Γ₁(N)∩Γ₀(p). The map δ₁^*+δ_p^*:H¹(X₁(N),F_ℓ)²→H¹(X′,F_ℓ) is injective for every prime ℓ. Equivalently the sum of the two Jacobian pullbacks J₁(N)²→Jac(X′) has trivial kernel (Ribet Corollary 4.2). The corresponding integral H¹ map has torsion-free cokernel; after O-extension it is saturated and remains injective modulo πⁿ. For Γ₀(N), Ribet Theorem 4.3 gives kernel the anti-diagonal Shimura subgroup, not unconditional injectivity; localization away from its Eisenstein support removes that kernel.
Hypotheses: Weight two means constant coefficients. The compact curves are smooth in characteristic zero, so no ℓ∤N hypothesis is added to this Betti statement. The Γ₀ version needs a supplied Shimura subgroup and its Eisenstein Hecke action; small levels and stabilizers use their actual compact curves.
Proposed theorem name: TauCeti.ModularCurves.compact_ihara (deferred full statement above).
Sources: RIBET-1984, Theorem 4.1, Corollary 4.2 and Theorem 4.3, pp. 510–513

ModularCurvesPartII:R14.4/taylor-wiles-root-control
Theorem: For constant coefficients O/πⁿ, odd residue characteristic ℓ, torsion-free modular level Γ with p∤Nℓ, and a localized cyclotomic-determinant residual eigensystem at which p≡1 mod ℓ and T_p has residual roots α,β with αβ=1 and α≠β, the two degeneracy images identify H^i(Y,O/πⁿ)_m² with the sum of the two selected old-root factors in H^i(Y₀(p),O/πⁿ). Localization additionally at U_p−α identifies its factor with one copy of H^i(Y,O/πⁿ)_m. The operator normalization is the one in CG Lemma 9.6; in the general character setting the off-diagonal diamonds must be restored and checked, not suppressed.
Hypotheses: α,β∉{1,−1} follows from odd ℓ and αβ=1, α≠β. The full anemic localized target is not asserted to have no additional U_p=±1 factors; those are killed in the selected U_p²−1 localization.
Proposed theorem name: TauCeti.ModularCurves.taylor_wiles_root_control (deferred full statement above).
Sources: CALEGARI-GERAGHTY, Lemma 9.6 and Remarks 9.7–9.8, pp. 88–90; author Springer-layout copy PDF pp. 120–123

ModularCurvesPartII:R14.5/newform-hecke-prime
Definition: For a normalized cuspidal newform f of weight exactly two and primitive level N, import its coefficient field K_f from ModularForms Layers 8/8G. The geometric Hecke action gives the eigenvalue character λ_f:T₁(N)→K_f. Set p_f=ker λ_f; it is a minimal prime and (T₁(N)/p_f)⊗Q≅K_f. Coefficient fields, integrality of eigenvalues and the notion of newform are imports, not definitions of this layer.
Hypotheses: f a normalised newform of weight 2 and level exactly N (Tau Ceti ModularForms Layer 4).
TauCeti.ModularCurves.heckePrime [typed core above; geometric specialization still required]: Kernel ideal of the imported geometric eigenvalue character λ_f.
TauCeti.ModularCurves.mem_heckePrime [typed core above; geometric specialization still required]: t∈p_f iff λ_f(t)=0.
TauCeti.ModularCurves.heckePrime_isPrime [typed core above; geometric specialization still required]: The character lands in a field, so p_f is prime.
TauCeti.ModularCurves.heckePrime_quotient [deferred signature]: The rationalized quotient is K_f; the integral quotient is the eigenvalue order, not necessarily the maximal order.
TauCeti.ModularCurves.heckePrime_conjugate [typed core above; geometric specialization still required]: Postcomposing λ_f with a field embedding does not change its kernel.
example heckePrime_int [computation; typed above]: The kernel of ℤ→ℚ is zero.
example heckePrime_projection [characterisation; typed above]: For the first projection ℚ×ℚ→ℚ, the kernel is {0}×ℚ.
example heckePrime_embedding [compatibility; typed above]: An injective field embedding on the target preserves the kernel.
Sources: RIBET-STEIN-SERRE-LECTURES, Appendix by B. Conrad, p. 73 (printed page; PDF page 77); RIBET-STEIN-SERRE-LECTURES, Appendix by B. Conrad, p. 73 (printed page; PDF page 77)

ModularCurvesPartII:R14.5/modular-quotient
Construction: With the Picard Hecke action on J₁(N), let B_f be the connected abelian subvariety generated by all images t(J₁(N)), t∈p_f. Define A_f=J₁(N)/B_f over Q with its surjective quotient map q_f. It has good reduction outside N and an action of the order T₁(N)/p_f; the K_f action is in End⁰(A_f). This is a quotient by an actual abelian subvariety, not a pointwise module quotient or an assumed Galois representation.
Hypotheses: N ≥ 5 (for N < 5, S₂(Γ₁(N)) = 0). Convention: Conrad takes the Picard ( )^* action of T₁(N) on Pic⁰; Ribet–Stein take the quotient by the image of the annihilator of f in T; the two give isogenous quotients.
TauCeti.ModularCurves.modularQuotient [deferred signature]: The actual abelian variety J₁(N)/B_f, with the chosen Picard convention.
TauCeti.ModularCurves.modularQuotient_map [deferred signature]: The surjective Q-homomorphism q_f:J₁(N)→A_f with connected kernel B_f.
TauCeti.ModularCurves.modularQuotient_kills [deferred signature]: q_f∘t=0 for every t∈p_f.
TauCeti.ModularCurves.modularQuotient_lift [deferred signature]: A homomorphism h:J₁(N)→B killing all p_f images descends uniquely through q_f.
TauCeti.ModularCurves.modularQuotient_baseChange [deferred signature]: Formation and the quotient map commute with field extension.
TauCeti.ModularCurves.modularQuotient_hecke [deferred signature]: The quotient order acts faithfully in characteristic zero; the induced rational action is K_f in End⁰(A_f).
example modularQuotient_zeroIdeal [degenerate; deferred until its stated geometric carrier or comparison exists]: The quotient attached to the zero ideal of an acting algebra is the supplied Jacobian itself.
example modularQuotient_unitIdeal [degenerate; deferred until its stated geometric carrier or comparison exists]: The quotient for the unit ideal is the zero abelian variety; this tests the image-generated-kernel convention.
example modularQuotient_level11 [computation; deferred until its stated geometric carrier or comparison exists]: For the rational weight-two newform of level 11 and trivial character, the J₀(11) quotient has dimension one.
example modularQuotient_weight [non-example; deferred until its stated geometric carrier or comparison exists]: No Jacobian quotient is defined for a weight-12 level-one newform by this constructor.
Sources: RIBET-STEIN-SERRE-LECTURES, Appendix by B. Conrad, p. 73 (printed page; PDF page 77); RIBET-STEIN-SERRE-LECTURES, Appendix by B. Conrad, p. 73 (printed page; PDF page 77); RIBET-STEIN-SERRE-LECTURES, Chapter 2, §2.3.1.2, p. 29 (printed; PDF page 33)

ModularCurvesPartII:R14.5/quotient-tate-exact
Comparison: For the actual quotient q_f:J₁(N)→A_f, the induced map identifies V_ℓ(A_f) with V_ℓ(J₁(N))/p_fV_ℓ(J₁(N)) as a module over Q_ℓ⊗T₁(N), with the chosen Picard convention. Generic exactness of rational Tate modules for abelian-subvariety quotients is imported; integral exactness is not inferred by tensoring this rational statement.
Hypotheses: ℓ prime; base characteristic zero. B_f is the actual connected image-generated kernel from modular-quotient.
Proposed comparison name: TauCeti.ModularCurves.quotient_tate_exact (deferred full statement above).
Sources: RIBET-STEIN-SERRE-LECTURES, Appendix by B. Conrad, p. 73 (printed page; PDF page 77); RIBET-STEIN-SERRE-LECTURES, Appendix by B. Conrad, p. 73 (printed page; PDF page 77)

ModularCurvesPartII:R14.5/modular-quotient-dimension
Theorem: dim A_f = [K_f : ℚ], and V_ℓ(A_f) = V_ℓ(J₁(N))/p_f V_ℓ(J₁(N)) is free of rank 2 over ℚ_ℓ ⊗_ℚ K_f. In particular A_f ≠ 0 and dim V_ℓ(A_f) = 2[K_f : ℚ].
Hypotheses: The Frobenius characteristic polynomial on V_ℓ(A_f) is AutomorphicGaloisRepresentations R19.1/R19.6's statement, not a defining property of A_f.
Proposed theorem name: TauCeti.ModularCurves.modular_quotient_dimension (deferred full statement above).
Sources: RIBET-STEIN-SERRE-LECTURES, Appendix by B. Conrad, p. 73 (printed page; PDF page 77); RIBET-STEIN-SERRE-LECTURES, Chapter 2, §2.3.1, p. 28 (printed; PDF page 32)

ModularCurvesPartII:R14.5/modular-quotient-differentials
Theorem: Pullback along J₁(N) → A_f identifies H⁰(A_f, Ω¹) ⊗ ℂ with the span of the Galois conjugates f^σ (σ : K_f ↪ ℂ) in S₂(Γ₁(N), ℂ) = Cot₀(J₁(N)_ℂ), when T₁(N) acts on J₁(N) through the Albanese action (T_p)_*, whose cotangent action is the classical one; with the Picard action T_p^* the image is w_ζ of that span.
Hypotheses: Conrad's warning: the Picard action on Cot₀ is the Petersson adjoint of the classical action; w_ζ conjugates one action into the other.
Proposed theorem name: TauCeti.ModularCurves.modular_quotient_differentials (deferred full statement above).
Sources: RIBET-STEIN-SERRE-LECTURES, Appendix by B. Conrad, p. 68 (printed page; PDF page 72)

ModularCurvesPartII:R14.5/trivial-character-J0
Comparison: If χ_f is trivial, let p_f⁰ ⊂ T₀(N) be the kernel of the eigenvalue map on the Hecke algebra of J₀(N). Then A_f⁰ := J₀(N)/p_f⁰J₀(N) is an abelian variety over ℚ of dimension [K_f : ℚ], and the map J₀(N) → J₁(N) (pullback along X₁(N) → X₀(N)) induces an isogeny A_f⁰ → A_f compatible with the K_f-actions.
Hypotheses: The pullback J₀(N) → J₁(N) is Hecke-equivariant with finite kernel.
Proposed comparison name: TauCeti.ModularCurves.trivial_character_J0 (deferred full statement above).
Sources: RIBET-STEIN-SERRE-LECTURES, Chapter 2, §2.3.1.2, p. 29 (printed; PDF page 33)

ModularCurvesPartII:R14.5/oldform-comparison
Theorem: Let f have primitive level N and weight two, and let N|M. For the anemic Hecke algebra at level M, the rational abelian factor attached to the Galois orbit of f is isogenous over Q to A_f^{τ(M/N)}, where τ counts positive divisors. The degeneracy images for d|M/N give that factor up to isogeny. This uses the complete fixed-character oldspace and cross-level multiplicity-one theorem imported from ModularForms Layers 4/5; an eigenvector at raised level can be a linear combination of these images. The simple isogeny factor A_f is attached to the primitive eigensystem, whereas the full raised-level anemic quotient has the stated larger dimension.
Hypotheses: The anemic operators exclude primes dividing M. Character transport is the fixed character of f pulled to modulus M; do not count a different character’s oldspace.
Proposed theorem name: TauCeti.ModularCurves.oldform_comparison (deferred full statement above).
Sources: RIBET-STEIN-SERRE-LECTURES, §3.6, p. 40; Corollary 5.9, pp. 69–70; Theorem 5.14, p. 73

ModularCurvesPartII:R14.5/abel-jacobi-composite-nonzero
Theorem: For any supplied rational base point c∈X₁(N)(Q), the composite q_f∘AJ_c:X₁(N)→A_f is nonconstant and sends c to zero. The same assertion holds for a supplied point of X₀(N) and its trivial-character quotient. The argument uses A_f≠0 and the generation of the Jacobian by AJ_c; it does not require the rational-cusp construction of R14.6.
Hypotheses: A_f ≠ 0; the Abel–Jacobi map and its universal property are Tau Ceti JacobianChallenge Layer F.
Proposed theorem name: TauCeti.ModularCurves.abel_jacobi_composite_nonzero (deferred full statement above).
Sources: RIBET-STEIN-SERRE-LECTURES, Appendix by B. Conrad, p. 74 (printed page; PDF page 78)

ModularCurvesPartII:R14.6/neron-hecke-extension
Application: Apply R14.2’s existing Néron extension of the actual modular Hecke endomorphisms. At p∤N, reduce them on the good abelian fibre J_p; at semistable primes use the induced torus, character and component-group maps of R11.6. The degeneracy morphisms of curves need not extend across their correspondence prime in the same form; the Jacobian endomorphism is what is reduced.
Hypotheses: Pic⁰_{X₁(N)/ℤ[1/N]} is an abelian scheme, hence the Néron model of its generic fibre.
Proposed application name: TauCeti.ModularCurves.neron_hecke_extension (deferred full statement above).
Sources: RIBET-STEIN-SERRE-LECTURES, Appendix by B. Conrad, p. 72 (printed page; PDF page 76)

ModularCurvesPartII:R14.6/special-fibre-eichler-shimura
Theorem: For p∤N and J_p=Pic⁰(X₁(N)_Fp), let F be the p-power Frobenius endomorphism and V its Verschiebung, so FV=VF=[p]. In End_Fp(J_p), the Albanese Hecke operator satisfies (T_p)_*=F+⟨p⟩_*V. Over F̄_p, for a chosen primitive Nth root ζ, w_ζ⁻¹Fw_ζ=⟨p⟩_*⁻¹F. This is the weight-two special-fibre relation exported to R19.1; identification of a selected eigencomponent’s Galois characteristic polynomial is the consumer’s theorem.
Hypotheses: p prime, p∤N; the supplied proper curve and its Jacobian have good reduction. V is the actual Verschiebung, identified with the polarization dual of F; w_ζ is only required over the field containing ζ.
Proposed theorem name: TauCeti.ModularCurves.special_fibre_eichler_shimura (deferred full statement above).
Sources: RIBET-STEIN-SERRE-LECTURES, Theorem 5.16 and proof, pp. 74–77

ModularCurvesPartII:R14.6/rational-cusp-abel-jacobi
Construction: Use the supplied rational cusp ∞ of X₀(N), and a specified rational cusp c of the chosen X₁(N) point-of-exact-order moduli model (Conrad uses 0), to specialize the imported AJ construction: AJ_c(x)=[x−c]. It is over Q, sends c to zero and is a closed immersion when the genus is positive. For a degeneracy morphism α:X′→X and rational cusp c′, α_*AJ_{c′}(x)=AJ_c(α(x))+[α(c′)−c]. Hecke compatibility is on degree-zero divisors; without a base-point correction this is not an equality of point maps.
Hypotheses: Rationality is proved for the chosen cusp and moduli model; the cusp named ∞ on X₁(N) is not assumed rational in every model.
TauCeti.ModularCurves.abelJacobiInfty [deferred signature]: The imported AJ for X₀(N), based at its supplied rational cusp ∞.
TauCeti.ModularCurves.abelJacobiInfty_cusp [deferred signature]: AJ_∞(∞)=0.
TauCeti.ModularCurves.abelJacobiInfty_injective [deferred signature]: AJ_∞ is a closed immersion for genus at least one; no immersion conclusion for genus zero.
TauCeti.ModularCurves.abelJacobi_changeBase [deferred signature]: AJ_b(x)=AJ_c(x)−AJ_c(b).
TauCeti.ModularCurves.abelJacobi_degeneracy [deferred signature]: α_*AJ_{c′}(x)=AJ_c(αx)+[αc′−c].
TauCeti.ModularCurves.abelJacobi_hecke [deferred signature]: On degree-zero divisors D, the induced endomorphism sends [D] to [T(D)] using the chosen Picard/Albanese convention.
example abelJacobi_X011 [computation; deferred until its stated geometric carrier or comparison exists]: For the genus-one curve X₀(11), AJ_∞ is an isomorphism with its Jacobian.
example abelJacobi_genus0 [degenerate; deferred until its stated geometric carrier or comparison exists]: For X₀(1), the Jacobian and AJ image are zero; the curve map is not injective.
example abelJacobi_baseChange_test [compatibility; deferred until its stated geometric carrier or comparison exists]: For any supplied rational cusp b, AJ_b(b)=0 and AJ_b(x)=AJ_∞(x)−AJ_∞(b).
example abelJacobi_degeneracy_offset [non-example; deferred until its stated geometric carrier or comparison exists]: If [αc′−c]≠0, the uncorrected identity α_*AJ_{c′}=AJ_c∘α fails already at c′.
Sources: RIBET-STEIN-SERRE-LECTURES, Appendix by B. Conrad, p. 74 (printed page; PDF page 78)

ModularCurvesPartII:R14.6/supersingular-character-lattice
Construction: For the mixed level Γ₁(M)∩Γ₀(p), M≥5 and p∤M, use R13.5’s split geometric semistable fibre: its two smooth components are the two copies of X₁(M)_F̄p and they meet at the finite supersingular level-point set S. Orient every edge from the first component to the second. The toric character group is canonically Z[S]⁰=ker(Σ:Z[S]→Z), compatibly with good-prime Hecke correspondences, diamonds and geometric Frobenius (including the action on orientations). Thickness is retained in the monodromy pairing rather than in this unweighted boundary map.
Hypotheses: The two-component description is a supplied theorem for the mixed Γ₀(p) model, not a claim about X₁(Mp). If a regular model introduces subdivisions, compare graph homology by contraction; the stable thickness data must be preserved.
TauCeti.ModularCurves.supersingularDegreeZero [typed core above; geometric specialization still required]: The kernel of total sum on the free abelian module on the supplied finite set S.
TauCeti.ModularCurves.mem_supersingularDegreeZero [typed core above; geometric specialization still required]: A combination belongs exactly when its coefficients sum to zero.
TauCeti.ModularCurves.supersingularDifference [typed core above; geometric specialization still required]: For s,t∈S, the generator [s]−[t].
TauCeti.ModularCurves.supersingularDifference_diagonal [typed core above; geometric specialization still required]: The difference with equal endpoints is zero.
TauCeti.ModularCurves.supersingularDegreeZero_graph [deferred signature]: For the supplied two-component fibre, this kernel is the actual integral H₁ graph lattice and torus character group.
TauCeti.ModularCurves.supersingularDegreeZero_correspondence [deferred signature]: A supplied geometric graph correspondence induces its character map via incidence chains; no division by an edge multiplicity is used.
example supersingularDegreeZero_singleton [degenerate; typed above]: With one supersingular edge the kernel is zero.
example supersingularDegreeZero_two [computation; typed above]: With two edges the kernel is generated by (1,−1) and is free of rank one.
example supersingularDegreeZero_difference [characterisation; typed above]: For distinct s,t, [s]−[t] is a nonzero degree-zero element.
example supersingularDegreeZero_notComponent [non-example; deferred until its stated geometric carrier or comparison exists]: The one-loop lattice with edge thickness h has character rank one for every h, although its component cokernel has order h.
Sources: RIBET-STEIN-SERRE-LECTURES, §3.9, pp. 44–46; §3.10.2, p. 48

ModularCurvesPartII:R14.6/modular-monodromy
Comparison: For the actual semistable modular Jacobian at p and its supplied regular or weighted stable dual graph, transport R11.4’s integral monodromy map μ:X*(J^∨)→Hom(X*(J),Z). The sequence 0→X*(J^∨)→Hom(X*(J),Z)→Φ_J(F̄p)→0 is exact. Under the principal polarization and graph identification, μ is the edge pairing Σ_e h_e a_e b_e, with positive thickness h_e; a regular semistable model uses h_e=1. It is perfect over Q but need not be unimodular over Z. The ℓ-primary component group is its tensor cokernel, including ℓ dividing the determinant.
Hypotheses: Use the actual model; the component sequence is geometric over F̄p with descent action retained.
Proposed comparison name: TauCeti.ModularCurves.modular_monodromy (deferred full statement above).
Sources: RIBET-STEIN-SERRE-LECTURES, §3.9, pp. 44–46; §3.10.2, p. 48

ModularCurvesPartII:R14.6/character-degeneracy-sequences
Theorem: Every supplied degeneracy homomorphism of semistable modular Jacobians induces the contravariant character map and the compatible monodromy/component diagram of R11.6. For a supplied exact sequence of special-fibre tori 0→T₁→T→T₂→0, the resulting character sequence 0→X*(T₂)→X*(T)→X*(T₁)→0 is integral and Hecke-equivariant. An old/new abelian isogeny decomposition alone does not provide this exact torus sequence: the concrete modular integral kernel, cokernel and saturation must be computed from the graph maps. The pivot character sequence 0→X_p(J_pq(K))→X_q(J(K,pq))→X_q(J(K,q))²→0 of Ribet–Stein (3.2) requires its quaternionic/Cerednik–Drinfeld input and remains an explicitly recorded ownership/source gap in this part.
Hypotheses: All tori and maps in an exactness assertion are specified geometric objects; if only an isogeny is known, retain its finite lattice error. J_pq(K) in the pivot sequence is a Shimura-curve Jacobian, not a modular-curve Jacobian of level pq.
Proposed theorem name: TauCeti.ModularCurves.character_degeneracy_sequences (deferred full statement above).
Sources: RIBET-STEIN-SERRE-LECTURES, §3.10.2, equation (3.2), p. 48

ModularCurvesPartII:R14.6/semistable-tate-interface
Application: For an actual semistable modular Jacobian J over Q_p and ℓ≠p, import the saturated filtration T_ℓ(J)_t⊂T_ℓ(J)_f⊂T_ℓ(J), with T_t≅Hom(X*(J),Z_ℓ(1)), T_f=T_ℓ(J)^{I_p}, and T_f/T_t the Tate module of the abelian part of the special fibre. The ranks are t,t+2a,2(t+a), respectively. Identify the inertia/monodromy map with the modular monodromy pairing and the induced Hecke maps. This is the actual integral input for R20’s ramification arguments; the p-adic semistable representation case belongs to p-adic comparison owners.
Hypotheses: ℓ≠p and actual semistable reduction; no claim T_f=T^{I_p} at ℓ=p.
Proposed application name: TauCeti.ModularCurves.semistable_tate_interface (deferred full statement above).
Sources: RIBET-STEIN-SERRE-LECTURES, §3.9, pp. 45–46; §3.10.3, pp. 48–49

ModularCurvesPartII:R14.6/taylor-wiles-cover
Construction: Fix odd residue characteristic ℓ and a finite set Q of primes q∤Nℓ with q≡1 mod ℓ. Let H_q be the prime-to-ℓ subgroup of (Z/q)× and Δ_q=(Z/q)×/H_q, Δ_Q=∏Δ_q. At q, Γ̄_Q has Γ₀(q) level and Γ_Q is the inverse image of H_q under the diamond quotient. Retain the fixed base level at N, and intersect both groups with the same auxiliary Γ₁(R), with R≥5 a prime coprime to Nℓ∏Q, to remove stabilizers. Then Γ_Q⊲Γ̄_Q with quotient Δ_Q, and Y_Q→Ȳ_Q is an actual finite étale analytic cover with that deck group. Complex conjugation ξ=diag(−1,1) normalizes both groups and acts trivially on Δ_Q. For the actual H¹(Y_Q,O), define M_Q^- as the kernel of ξ+1, and then take the specified anemic and selected U_q-root localization.
Hypotheses: O complete DVR finite over Z_ℓ; all auxiliary cover data and level maps are fixed. The open cover is unramified; its compactification can ramify at cusps and is not assumed étale there. Selected residual roots are distinct, and the cyclotomic-determinant specialization uses q≡1 and α_qβ_q=1.
TauCeti.ModularCurves.taylorWilesLevel [deferred signature]: The congruence subgroup Γ_Q and its cover of the specified Γ̄_Q quotient.
TauCeti.ModularCurves.taylorWilesLevel_quotient [deferred signature]: Γ̄_Q/Γ_Q≅Δ_Q, with the actual diamond action.
TauCeti.ModularCurves.taylorWilesLevel_conjugation [deferred signature]: ξ fixes Δ_Q and commutes with its action on H¹.
TauCeti.ModularCurves.taylorWilesMinus [typed core above; geometric specialization still required]: The ξ=−1 submodule of the actual cover H¹, before the specified commuting Hecke localization.
TauCeti.ModularCurves.mem_taylorWilesMinus [typed core above; geometric specialization still required]: x lies in M^- iff ξx=−x.
TauCeti.ModularCurves.taylorWilesMinus_projector [typed core above; geometric specialization still required]: Since 2 is a unit, (1−ξ)/2 projects to the minus submodule.
TauCeti.ModularCurves.taylorWilesMinus_coefficients [typed core above; geometric specialization still required]: Coefficient change and deck/Hecke-equivariant morphisms commute with minus projection under the proved base-change hypotheses.
example taylorWilesMinus_id [degenerate; typed above]: If ξ=id and 2 is invertible, the minus module is zero.
example taylorWilesMinus_neg [characterisation; typed above]: If ξ=−id, the minus module is the whole module.
example taylorWilesMinus_swap [computation; typed above]: For ξ(x,y)=(y,x) on O², the minus submodule is {(a,−a):a∈O}.
example taylorWilesLevel_empty [degenerate; deferred until its stated geometric carrier or comparison exists]: For Q empty the diamond quotient is trivial and the selected cover is the base cover.
example taylorWilesMinus_two [non-example; typed above]: In characteristic two the kernel of ξ+1 need not be a complementary direct summand; the projector statement requires 2 invertible.
Sources: TAYLOR-WILES, Definition of Δ_Q, Γ_Q, Γ̄_Q and auxiliary R, author pp. 4–7; Proposition 1, pp. 7–8

ModularCurvesPartII:R14.6/taylor-wiles-freeness
Theorem: For the actual cover and O of taylor-wiles-cover, H¹(Y_Q,O)^− is finite free over O[Δ_Q], with rank equal to rank_O H¹(Ȳ_Q,O)^−. Each commuting completed anemic/selected-root Hecke localization is an O[Δ_Q]-direct summand and is therefore also finite free. At the non-Eisenstein ideals of R14.3, boundary removal identifies this with the compact cuspidal module. Reduction modulo πⁿ yields a finite free (O/πⁿ)[Δ_Q]-module of the same rank. The plus eigenspace and Hecke-rank-one multiplicity claims are not conclusions of Proposition 1.
Hypotheses: Odd ℓ; Δ_Q is an abelian ℓ-group; the congruence group Γ̄_Q is torsion-free and free of finite rank. The finite-level identification with cohomology modulo πⁿ uses localized-freeness or the minus-cochain computation, not merely a claim that rational invariants commute with integral reduction.
Proposed theorem name: TauCeti.ModularCurves.taylor_wiles_freeness (deferred full statement above).
Sources: TAYLOR-WILES, Proposition 1 and proof, author pp. 7–8

ModularCurvesPartII:R14.6/augmentation-control
Theorem: Let I_Q be the augmentation ideal of O[Δ_Q]. For the minus modules of the actual covers, M_Q^−/I_QM_Q^- identifies with H¹(Ȳ_Q,O)^−, via Shapiro’s induced-coefficient complex and its augmentation. At the cyclotomic-determinant Taylor–Wiles roots of taylor-wiles-root-control, successive root selection at q∈Q identifies the localized base-side module with the fixed-level localized module. All maps commute with anemic Hecke operators and reduction modulo πⁿ. A finite free O[Δ_Q] module M satisfies rank_O(M/I_QM)=rank_{O[Δ_Q]}M; this numerical fact is used only after the actual geometric specialization map has been proved.
Hypotheses: The same auxiliary R-level is retained at both ends. Removing R requires a separate checked level-control argument and its source hypotheses. Distinct residual roots, q∤Nℓ and odd ℓ; no repeated-root specialization.
Proposed theorem name: TauCeti.ModularCurves.augmentation_control (deferred full statement above).
Sources: TAYLOR-WILES, Proof of Proposition 1, author pp. 7–8; CALEGARI-GERAGHTY, Lemma 9.6, pp. 88–90

ModularCurvesPartII:R14.6/diamond-group-ring-local
Theorem: For O a complete DVR of residue characteristic ℓ and Δ a finite abelian ℓ-group, O[Δ] is a commutative local ring. Its maximal ideal is generated by the maximal ideal of O and every [δ]−1. Every finite projective O[Δ]-module is free. These are the precise algebra facts used in the finite-level Taylor–Wiles minus-module argument.
Hypotheses: Δ is the finite diamond group of taylor-wiles-cover; the assertion is not made for a finite group of order prime to ℓ.
Proposed theorem name: TauCeti.ModularCurves.diamond_group_ring_local (deferred full statement above).
Sources: TAYLOR-WILES, Proof of Proposition 1, author pp. 7–8

ModularCurvesPartII:R14.4/congruence-invariance
Theorem: For N≥3, prime q and η∈H¹(Γ(N),F_q), let SL₂(Z/N) act by the conjugations of ambient SL₂(Z). If gη−η belongs to H¹_cong(Γ(N),F_q) for every g∈SL₂(Z/N), then η itself belongs to H¹_cong. Equivalently, the direct limit of ordinary H¹ over principal levels, with restriction transition maps, has no SL₂(Ẑ)-invariants. This direct-limit character input is the specific prerequisite of enhanced-ihara, rather than a completion of the completed-cohomology roadmap.
Hypotheses: The action factors through the finite quotient because inner conjugation acts trivially on trivial-coefficient H¹. The coefficient prime may be 2 or 3; the proof retains the exceptional small-prime calculations.
Proposed theorem name: TauCeti.ModularCurves.congruence_invariance (deferred full statement above).
Sources: CDT-2025, Theorem 4.5.2 and Corollary 4.5.3, p. 29; Lemmas 4.5.4–4.5.11 and proof, pp. 30–32; published §§4.5–4.6, pp. 661–666

-/

end TauCeti.ModularCurves
