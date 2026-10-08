import Mathlib.NumberTheory.Padics.PadicIntegers
import Mathlib.Algebra.MonoidAlgebra.Basic
import Mathlib.Algebra.Group.Hom.Basic
import Mathlib.LinearAlgebra.Span.Basic
import Mathlib.LinearAlgebra.TensorProduct.Basic
import Mathlib.LinearAlgebra.Dimension.Finrank
import Mathlib.Data.ENat.Lattice
import Mathlib.RingTheory.Ideal.Operations
import Mathlib.LinearAlgebra.Quotient.Basic
import Mathlib.Topology.Instances.Real.Lemmas
import Mathlib.Topology.Compactness.Compact
import Mathlib.Topology.Instances.ZMod
import Mathlib.Topology.Algebra.Group.Basic

/-!
# Suggested interfaces for HeegnerPointEulerSystems, part HE.7s

This file is not the roadmap and is not exhaustive. The roadmap document is
definitive. These forms let contributors and reviewers converge on names and
signatures. This is a blueprint prototype, not a formalisation. Proofs and examples are admitted; the norm-family choice uses the admitted
compact-lift lemma. A successful elaboration checks only the interface shapes.
Mathlib is pinned to 082e2d37e8b0463410cdb532e111cd43d5a66174; no Tau Ceti
module is imported. The packet and reader give the complete arithmetic statements.

The supplier objects missing at this baseline are explicitly omitted conditions:
number fields and their actual CM points, continuous Galois cohomology and Selmer
conditions, the completed arithmetic Iwasawa algebra and its characteristic-ideal
assignment, crystalline characters, perfect Selmer complexes and their determinant
lattices. Parameters below use existing algebraic types for supplied values and maps.
They are not replacement definitions of those theories. No arbitrary Prop-valued
object is introduced. Every production theorem must add the exact arithmetic
identifications and hypotheses printed in its node comment and packet statement.
-/

set_option autoImplicit false
noncomputable section
open scoped TensorProduct
namespace TauCeti.Heegner.Anticyclotomic

-- initial-euler-factor: use σ,σ* as actual group-ring Artin elements. The Boolean
-- chooses the split case; it does not replace the arithmetic splitting condition.
/- HeegnerPointEulerSystems:HE.8/initial-euler-factor
Mathematical statement: For every permitted n, in ℤ_p[G(n)] with G(n)=Gal(K[n]/K), define Φ=(p+1)²−a_p² if p is inert; if p splits define Φ=(p−a_pσ+σ²)(p−a_pσ*+σ*²), with σ,σ* the specified Artin elements. The augmentation is (p+1−a_p)² in the split case, not necessarily a unit. Keep the finite ring-class group, its Artin action and the initial unit index; it differs from Howard’s first-step degree group Δ=(O_K/pO_K)×/(ℤ/pℤ)×.
Hypotheses: E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p. T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used.
The actual arithmetic identifications and hypotheses above are omitted in this prototype. Supplied maps, modules, ideals and indices must be those of the stated arithmetic suppliers; this is an admitted interface, not a formal proof. -/
def initialFactor {R : Type*} [CommRing R] (split : Bool) (p : ℕ)
    (ap σ σstar : R) : R := by
  sorry

theorem initialFactor_inert {R : Type*} [CommRing R] (p : ℕ) (ap σ σstar : R) :
    initialFactor false p ap σ σstar = ((p : R) + 1)^2 - ap^2 := by
  sorry

theorem initialFactor_split {R : Type*} [CommRing R] (p : ℕ) (ap σ σstar : R) :
    initialFactor true p ap σ σstar =
      ((p : R) - ap * σ + σ^2) * ((p : R) - ap * σstar + σstar^2) := by
  sorry

theorem initialFactor_augmentation {R : Type*} [CommRing R] (p : ℕ) (ap : R) :
    initialFactor true p ap 1 1 = ((p : R) + 1 - ap)^2 := by
  sorry

theorem initialFactor_natural {R R' : Type*} [CommRing R] [CommRing R']
    (f : R →+* R') (split : Bool) (p : ℕ) (ap σ σstar : R) :
    f (initialFactor split p ap σ σstar) =
      initialFactor split p (f ap) (f σ) (f σstar) := by
  sorry

-- initialFactor_split_anomalous
example [Fact (Nat.Prime 5)] : initialFactor true 5 (1 : ℤ_[5]) 1 1 = 25 ∧
    ¬ IsUnit (initialFactor true 5 (1 : ℤ_[5]) 1 1) := by
  sorry
-- initialFactor_inert_value
example : initialFactor false 5 (1 : ℤ) 1 1 = 35 ∧
    initialFactor false 5 (1 : ℤ) 1 1 ≠ initialFactor true 5 (1 : ℤ) 1 1 := by
  sorry
-- initialFactor_reciprocity: compatible involution on the actual group ring.
example {R : Type*} [CommRing R] (ι : R ≃+* R) (p : ℕ) (ap σ σstar : R)
    (hap : ι ap = ap) :
    ι (initialFactor true p ap σ σstar) = initialFactor true p ap (ι σ) (ι σstar) := by
  sorry

-- ordinary-stabilized-point: raw[k] is supplied P[p^k] after compatible maps into
-- the chosen ambient point-completion. initial is the separate corrected P[1].
/- HeegnerPointEulerSystems:HE.8/ordinary-stabilized-point
Mathematical statement: Let α_p∈ℤ_p× be the unit root of X²−a_pX+p and β_p=p/α_p. For k≥1 put P[p^k]_α=P[p^k]−α_p⁻¹P[p^(k−1)] and scale by α_p⁻k. At k=0 use u_K⁻¹(1−α_p⁻¹σ)(1−α_p⁻¹σ*)P[1] in the split case and u_K⁻¹(1−α_p⁻²)P[1] in the inert case. Trace to K_k with the actual smallest d(k) such that K_k⊂K[p^d(k)], including p-primary class-number shifts.
Hypotheses: E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p. T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used. E(K)[p]=0.
The actual arithmetic identifications and hypotheses above are omitted in this prototype. Supplied maps, modules, ideals and indices must be those of the stated arithmetic suppliers; this is an admitted interface, not a formal proof. -/
def stabilizedPoint {R M : Type*} [CommRing R] [AddCommGroup M] [Module R M]
    (α : Rˣ) (raw : ℕ → M) (initial : M) (k : ℕ) : M := by
  sorry

theorem stabilizedPoint_succ {R M : Type*} [CommRing R] [AddCommGroup M] [Module R M]
    (α : Rˣ) (raw : ℕ → M) (initial : M) (k : ℕ) :
    stabilizedPoint α raw initial (k+1) =
      ((↑(α⁻¹) : R)^(k+1)) • (raw (k+1) - (↑(α⁻¹) : R) • raw k) := by
  sorry

theorem stabilizedPoint_map {R M M' : Type*} [CommRing R] [AddCommGroup M]
    [AddCommGroup M'] [Module R M] [Module R M'] (f : M →ₗ[R] M')
    (α : Rˣ) (raw : ℕ → M) (initial : M) (k : ℕ) :
    f (stabilizedPoint α raw initial k) =
      stabilizedPoint α (fun j => f (raw j)) (f initial) k := by
  sorry

theorem stabilizedPoint_change_unit {R M : Type*} [CommRing R] [AddCommGroup M]
    [Module R M] (a α : Rˣ) (raw : ℕ → M) (initial : M) (k : ℕ) :
    stabilizedPoint α (fun j => (a : R) • raw j) ((a : R) • initial) k =
      (a : R) • stabilizedPoint α raw initial k := by
  sorry

theorem stabilizedPoint_initial {R M : Type*} [CommRing R] [AddCommGroup M]
    [Module R M] (α : Rˣ) (raw : ℕ → M) (initial : M) :
    stabilizedPoint α raw initial 0 = initial := by
  sorry

-- stabilizedPoint_zero
example {R M : Type*} [CommRing R] [AddCommGroup M] [Module R M] (α : Rˣ) (k : ℕ) :
    stabilizedPoint α (fun _ => (0 : M)) 0 k = 0 := by
  sorry
-- stabilizedPoint_predecessor
example : stabilizedPoint (Units.mk0 (2 : ℚ) (by sorry))
    (fun k => if k = 0 then (2 : ℚ) else 4) 0 1 = (3/2 : ℚ) := by
  sorry
-- stabilizedPoint_first_level
example {R M : Type*} [CommRing R] [AddCommGroup M] [Module R M]
    (α : Rˣ) (raw : ℕ → M) (corrected : M) :
    stabilizedPoint α raw corrected 0 = corrected := by
  sorry

-- The conductor index I and permitted-edge index J come from the arithmetic
-- supplier. An edge j has source n and target nℓ; it is not an arbitrary prime.
-- L i is the supplier's actual compact inverse-limit group at conductor i.
-- Finite solvability is a concrete hypothesis, to be proved using Howard's
-- common free presentation. No global lift or desired theorem is a Prop field.
section UniversalNormFamily
variable {I J : Type*} {P L : I → Type*}
    [∀ i, AddCommGroup (P i)] [∀ i, AddCommGroup (L i)]
    [∀ i, TopologicalSpace (P i)] [instPT2 : ∀ i, T2Space (P i)]
    [∀ i, TopologicalSpace (L i)] [instLT2 : ∀ i, T2Space (L i)]
    [instLTopAdd : ∀ i, IsTopologicalAddGroup (L i)] [instLCompact : ∀ i, CompactSpace (L i)]
variable (source target : J → I) (Φ : ∀ i, P i →+ P i) (point : ∀ i, P i)
    (π : ∀ i, L i →+ P i) (tr : ∀ j, L (target j) →+ L (source j)) (a : J → ℤ)
    (hπ : ∀ i, Continuous (π i)) (htr : ∀ j, Continuous (tr j))
    (hfinite : ∀ s : Finset I, ∀ t : Finset J, ∃ q : ∀ i, L i,
      (∀ i ∈ s, π i (q i) = Φ i (point i)) ∧
      (∀ j ∈ t, tr j (q (target j)) = a j • q (source j)))

/- HeegnerPointEulerSystems:HE.8/compact-universal-norm-lift
Mathematical statement: For the actual compact Hausdorff inverse-limit groups L[n], fix the continuous bottom projections π[n], prescribed values Φ[n]P[n], permitted conductor edges j, continuous auxiliary traces tr[j] and integer scalars a[j]. If every finite list of bottom equations π[n]q[n]=Φ[n]P[n] and auxiliary equations tr[j]q[target j]=a[j]q[source j] has a common solution, there is a family q satisfying every equation. This packages the arithmetic constraint application of existing compactness; it does not re-plan the generic inverse-limit or Tychonoff theory.
Hypotheses: The indices and actual groups/maps are those of the ordinary Heegner tower; all L[n] are compact Hausdorff topological additive groups, all initial groups P[n] are Hausdorff, and π[n] and tr[j] are continuous. Every finite list of the two kinds of constraints is simultaneously solvable. Howard’s common free presentation and its compatible conductor maps establish this arithmetic input; CGLS uses the actual class-number shifts.
The actual arithmetic identifications are omitted in this prototype. The displayed topology, finite constraint solvability, transition square and raw norm recurrence, where applicable, are retained as explicit hypotheses. -/
include instPT2 instLT2 instLTopAdd instLCompact hπ htr hfinite in
theorem universalNormFamily_exists : ∃ q : ∀ i, L i,
    (∀ i, π i (q i) = Φ i (point i)) ∧
    (∀ j, tr j (q (target j)) = a j • q (source j)) := by
  sorry

/- HeegnerPointEulerSystems:HE.8/universal-norm-heegner-family
Mathematical statement: Under the ordinary Heegner conditions and E(K)[p]=0, construct Q[n] in lim_k H_k[n], the inverse limit of the ℤ_p[Gal(K_k[n]/K)]-modules generated by P[n] and P_j[n]. Its level-zero projection is ΦP[n], and Cor_(K∞[nℓ]/K∞[n])Q[nℓ]=a_ℓQ[n] for every permitted auxiliary ℓ. Choices arise from compactness, not uniqueness. Howard proves this under full G_K image and p∤h_K; CGLS Theorem 4.1.1 gives the weaker construction with the actual class-number conductor shifts, without extending Howard’s divisibility theorem. The construction takes these fixed maps and scalars together with finite solvability; its APIs use the same data. For actual level projections pr[n,k] and transitions cor[n,k], require cor[n,k]∘pr[n,k+1]=pr[n,k]. Differences between two choices with these same bottom and auxiliary constraints have zero bottom projection and obey tr[j](Q[target j]−Q′[target j])=a[j](Q[source j]−Q′[source j]).
Hypotheses: E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p. T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used. E(K)[p]=0. The conductor index I and permitted auxiliary-edge index J, their source/target maps, actual compact Hausdorff inverse-limit groups L[n], initial groups P[n], continuous bottom projections π[n], Artin-factor actions Φ[n], points P[n], continuous auxiliary traces tr[j], and scalars a[j] are fixed before choosing the family. Every finite list of bottom and auxiliary constraints has a simultaneous solution, as established by the common free-presentation argument; no uniqueness or surjectivity of arbitrary projections is assumed.
The actual arithmetic identifications are omitted in this prototype. The displayed topology, finite constraint solvability, transition square and raw norm recurrence, where applicable, are retained as explicit hypotheses. -/
def universalNormFamily : ∀ i, L i :=
  Classical.choose (universalNormFamily_exists source target Φ point π tr a hπ htr hfinite)

theorem universalNormFamily_level_zero (i : I) :
    π i (universalNormFamily source target Φ point π tr a hπ htr hfinite i) =
      Φ i (point i) := by
  sorry

theorem universalNormFamily_trace (j : J) :
    tr j (universalNormFamily source target Φ point π tr a hπ htr hfinite (target j)) =
      a j • universalNormFamily source target Φ point π tr a hπ htr hfinite (source j) := by
  sorry

theorem universalNormFamily_corestriction {M : I → ℕ → Type*}
    [∀ i k, AddCommGroup (M i k)]
    (proj : ∀ i k, L i →+ M i k) (cor : ∀ i k, M i (k+1) →+ M i k)
    (htransition : ∀ i k, (cor i k).comp (proj i (k+1)) = proj i k) (i : I) (k : ℕ) :
    cor i k (proj i (k+1)
      (universalNormFamily source target Φ point π tr a hπ htr hfinite i)) =
      proj i k (universalNormFamily source target Φ point π tr a hπ htr hfinite i) := by
  sorry
end UniversalNormFamily

-- Differences satisfy BOTH homogeneous constraints, for the same fixed data.
theorem universalNormFamily_choice {I J : Type*} {P L : I → Type*}
    [∀ i, AddCommGroup (P i)] [∀ i, AddCommGroup (L i)]
    (source target : J → I) (π : ∀ i, L i →+ P i)
    (tr : ∀ j, L (target j) →+ L (source j)) (a : J → ℤ) (q q' : ∀ i, L i)
    (hbottom : ∀ i, π i (q i) = π i (q' i))
    (hq : ∀ j, tr j (q (target j)) = a j • q (source j))
    (hq' : ∀ j, tr j (q' (target j)) = a j • q' (source j)) :
    (∀ i, π i (q i - q' i) = 0) ∧
    (∀ j, tr j (q (target j) - q' (target j)) = a j • (q (source j) - q' (source j))) := by
  sorry

-- universalNormFamily_bottom: a finite compact example with Φ=5, π=id.
example : universalNormFamily (I := Unit) (P := fun _ => ZMod 7) (L := fun _ => ZMod 7)
    (fun j : Empty => j.elim) (fun j : Empty => j.elim)
    (fun _ => 5 • AddMonoidHom.id (ZMod 7)) (fun _ => 1)
    (fun _ => AddMonoidHom.id (ZMod 7)) (fun j : Empty => j.elim)
    (fun j : Empty => j.elim) (by sorry) (by sorry) (by sorry) () = 5 := by
  sorry

-- universalNormFamily_auxiliary: fixed permitted edge, with its scalar zero.
example {I J : Type*} {P L : I → Type*}
    [∀ i, AddCommGroup (P i)] [∀ i, AddCommGroup (L i)]
    [∀ i, TopologicalSpace (P i)] [∀ i, T2Space (P i)]
    [∀ i, TopologicalSpace (L i)] [∀ i, T2Space (L i)]
    [∀ i, IsTopologicalAddGroup (L i)] [∀ i, CompactSpace (L i)]
    (source target : J → I) (Φ : ∀ i, P i →+ P i) (point : ∀ i, P i)
    (π : ∀ i, L i →+ P i) (tr : ∀ j, L (target j) →+ L (source j)) (a : J → ℤ)
    (hπ : ∀ i, Continuous (π i)) (htr : ∀ j, Continuous (tr j))
    (hfinite : ∀ s : Finset I, ∀ t : Finset J, ∃ q : ∀ i, L i,
      (∀ i ∈ s, π i (q i) = Φ i (point i)) ∧
      (∀ j ∈ t, tr j (q (target j)) = a j • q (source j)))
    (j : J) (ha : a j = 0) :
    tr j (universalNormFamily source target Φ point π tr a hπ htr hfinite (target j)) = 0 := by
  sorry

-- universalNormFamily_nonunique: two actual feasible families in a compact group;
-- π=0, bottom=0, tr=id, a=1, with one self-edge. Their difference obeys both laws.
example : let q : Unit → ZMod 2 := fun _ => 0
    let q' : Unit → ZMod 2 := fun _ => 1
    q ≠ q' ∧
    ((∀ i, (0 : ZMod 2 →+ ZMod 2) (q i) = 0) ∧ (∀ i, q i = (1 : ℤ) • q i)) ∧
    ((∀ i, (0 : ZMod 2 →+ ZMod 2) (q' i) = 0) ∧ (∀ i, q' i = (1 : ℤ) • q' i)) ∧
    ((∀ i, (0 : ZMod 2 →+ ZMod 2) (q i - q' i) = 0) ∧
      (∀ i, q i - q' i = (1 : ℤ) • (q i - q' i))) := by
  sorry

-- universalNormFamily_impossible_bottom: review's π=0, ΦP=1 data fail even
-- the one-bottom finite-solvability obligation, so the constructor cannot take them.
example : ¬ ∃ q : Unit → ZMod 7,
    ∀ i ∈ ({()} : Finset Unit), (0 : ZMod 7 →+ ZMod 7) (q i) = 1 := by
  sorry

-- universalNormFamily_incompatible_auxiliary: the one-bottom/one-edge finite
-- constraints fail for π=id, bottom=1, tr=id and a=0.
example : ¬ ∃ q : Unit → ZMod 7,
    (∀ i ∈ ({()} : Finset Unit), (AddMonoidHom.id (ZMod 7)) (q i) = 1) ∧
    (∀ j ∈ ({()} : Finset Unit), (AddMonoidHom.id (ZMod 7)) (q j) = (0 : ℤ) • q j) := by
  sorry

-- anticyclotomic-heegner-class: L is the actual norm-compatible Kummer limit,
-- C is actual continuous Iwasawa cohomology and shapiro the supplier comparison.
/- HeegnerPointEulerSystems:HE.8/anticyclotomic-heegner-class
Mathematical statement: Apply the integral Kummer map to the stabilized norm-compatible points and the imported Iwasawa–Shapiro comparison to obtain y∞∈H¹_Iw(K∞/K,T)=H¹_cont(K,T⊗Λ(tautological inverse)). The actual tower class lies in the specified ordinary Selmer structure. Its projection to level k is the Kummer class of y_k. There is no assertion that each character specialization is nonzero.
Hypotheses: E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p. T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used. E(K)[p]=0.
The actual arithmetic identifications and hypotheses above are omitted in this prototype. Supplied maps, modules, ideals and indices must be those of the stated arithmetic suppliers; this is an admitted interface, not a formal proof. -/
def heegnerIwasawaClass {L C : Type*} [AddCommGroup L] [AddCommGroup C]
    (shapiro : L ≃+ C) (q : L) : C := by
  sorry

theorem heegnerIwasawaClass_level {L C Ck : Type*} [AddCommGroup L]
    [AddCommGroup C] [AddCommGroup Ck] (e : L ≃+ C) (q : L)
    (proj : C →+ Ck) (level : L →+ Ck) (h : ∀ x, proj (e x) = level x) :
    proj (heegnerIwasawaClass e q) = level q := by
  sorry

theorem heegnerIwasawaClass_scalar {R L C : Type*} [CommRing R]
    [AddCommGroup L] [AddCommGroup C] [Module R L] [Module R C]
    (e : L ≃ₗ[R] C) (a : R) (q : L) :
    heegnerIwasawaClass e.toAddEquiv (a • q) = a • heegnerIwasawaClass e.toAddEquiv q := by
  sorry

theorem heegnerIwasawaClass_restrict {L C L' C' : Type*}
    [AddCommGroup L] [AddCommGroup C] [AddCommGroup L'] [AddCommGroup C']
    (e : L ≃+ C) (e' : L' ≃+ C') (norm : L →+ L') (cor : C →+ C')
    (h : ∀ x, cor (e x) = e' (norm x)) (q : L) :
    cor (heegnerIwasawaClass e q) = heegnerIwasawaClass e' (norm q) := by
  sorry

theorem heegnerIwasawaClass_zero {L C : Type*} [AddCommGroup L] [AddCommGroup C]
    (e : L ≃+ C) : heegnerIwasawaClass e 0 = 0 := by
  sorry

-- heegnerIwasawaClass_trace: level projection is supplied by the actual trace.
example {L C M : Type*} [AddCommGroup L] [AddCommGroup C] [AddCommGroup M]
    (e : L ≃+ C) (q : L) (trace : L →+ M) (proj : C →+ M)
    (h : ∀ x, proj (e x) = trace x) : proj (heegnerIwasawaClass e q) = trace q := by
  sorry
-- heegnerIwasawaClass_isogeny
example : heegnerIwasawaClass (AddEquiv.refl ℤ) (5 * 1) = 5 ∧
    heegnerIwasawaClass (AddEquiv.refl ℤ) (5 * 1) ≠ heegnerIwasawaClass (AddEquiv.refl ℤ) 1 := by
  sorry
-- heegnerIwasawaClass_nonzero_not_all_specializations
example :
    heegnerIwasawaClass (AddEquiv.refl (ℤ × ℤ)) (1, 0) ≠ 0 ∧
    (heegnerIwasawaClass (AddEquiv.refl (ℤ × ℤ)) (1, 0)).2 = 0 := by
  sorry

-- cm-character-stratum: A is the supplied character-value group, generally ℂˣ.
-- π is the preceding quotient, tors embeds G₀, χ₀ is the fixed torsion type.
/- HeegnerPointEulerSystems:HE.8/cm-character-stratum
Mathematical statement: For the imported relative ring-class tower G∞ with finite torsion G₀, define P(n,χ₀) as the finite-order characters of G(n) restricting to χ₀ on G₀ and not factoring through G(n−1). The character satisfies χ₀ω=1 on the embedded A_F×. Conductor is the largest F-ideal in the order, and primitivity is exact level, not merely conductor dividing P^n. Small n before G₀ embeds are excluded.
Hypotheses: F totally real, K/F CM, P a finite prime; n is large enough to identify G₀ in G(n).
The actual arithmetic identifications and hypotheses above are omitted in this prototype. Supplied maps, modules, ideals and indices must be those of the stated arithmetic suppliers; this is an admitted interface, not a formal proof. -/
def cmCharacterStratum {G H G0 A : Type*} [Group G] [Group H] [Group G0] [CommGroup A]
    (π : G →* H) (tors : G0 →* G) (χ0 : G0 →* A) : Set (G →* A) := by
  sorry

theorem cmCharacterStratum_mem {G H G0 A : Type*}
    [Group G] [Group H] [Group G0] [CommGroup A]
    (π : G →* H) (tors : G0 →* G) (χ0 : G0 →* A) (χ : G →* A) :
    χ ∈ cmCharacterStratum π tors χ0 ↔ χ.comp tors = χ0 ∧
      ¬ ∃ ψ : H →* A, ψ.comp π = χ := by
  sorry

theorem cmCharacterStratum_torsion {G H G0 A : Type*}
    [Group G] [Group H] [Group G0] [CommGroup A]
    (π : G →* H) (tors : G0 →* G) (χ0 : G0 →* A) (χ : G →* A)
    (h : χ ∈ cmCharacterStratum π tors χ0) : χ.comp tors = χ0 := by
  sorry

theorem cmCharacterStratum_not_old {G H G0 A : Type*}
    [Group G] [Group H] [Group G0] [CommGroup A]
    (π : G →* H) (tors : G0 →* G) (χ0 : G0 →* A) (ψ : H →* A) :
    ψ.comp π ∉ cmCharacterStratum π tors χ0 := by
  sorry

theorem cmCharacterStratum_transport {G H G0 G' H' G0' A : Type*}
    [Group G] [Group H] [Group G0] [Group G'] [Group H'] [Group G0'] [CommGroup A]
    (π : G →* H) (tors : G0 →* G) (χ0 : G0 →* A)
    (π' : G' →* H') (tors' : G0' →* G') (eG : G ≃* G') (eH : H ≃* H')
    (e0 : G0 ≃* G0') (hπ : ∀ g, π' (eG g) = eH (π g))
    (htors : ∀ g, tors' (e0 g) = eG (tors g)) (χ : G →* A) :
    χ.comp eG.symm.toMonoidHom ∈ cmCharacterStratum π' tors'
      (χ0.comp e0.symm.toMonoidHom) ↔ χ ∈ cmCharacterStratum π tors χ0 := by
  sorry

-- cmCharacterStratum_identity_quotient
example {G G0 A : Type*} [Group G] [Group G0] [CommGroup A]
    (tors : G0 →* G) (χ0 : G0 →* A) :
    cmCharacterStratum (MonoidHom.id G) tors χ0 = ∅ := by
  sorry
-- cmCharacterStratum_wrong_torsion
example {G H G0 A : Type*} [Group G] [Group H] [Group G0] [CommGroup A]
    (π : G →* H) (tors : G0 →* G) (χ0 : G0 →* A) (χ : G →* A)
    (h : χ.comp tors ≠ χ0) : χ ∉ cmCharacterStratum π tors χ0 := by
  sorry
-- cmCharacterStratum_first_nontrivial: use C₂=the units of ℤ, {±1}.
example : (MonoidHom.id ℤˣ) ∈ cmCharacterStratum (1 : ℤˣ →* Unit)
    (1 : Unit →* ℤˣ) (1 : Unit →* ℤˣ) := by
  sorry

-- lambda-heegner-derivative-class: no general derivative definition is recreated.
-- D is the actual ES.3 arithmetic derivative+Kummer map; resInv is the actual
-- continuous-cohomology restriction equivalence, after invariant vanishing.
/- HeegnerPointEulerSystems:HE.8/lambda-heegner-derivative-class
Mathematical statement: For each squarefree allowed n, apply the imported derivative operator to Q[n] (or the normalized ordinary family), sum the finite ring-class torsion orbit, and descend its invariant Kummer class through the actual restriction isomorphism. Obtain κ^Λ_n in the generic Λ-adic Kolyvagin-system coefficient. Preserve the cyclic-Galois tensor and the finite/singular correction maps; the bottom is the specified Heegner Λ-line.
Hypotheses: E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p. T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used. E(K)[p]=0.
The actual arithmetic identifications and hypotheses above are omitted in this prototype. Supplied maps, modules, ideals and indices must be those of the stated arithmetic suppliers; this is an admitted interface, not a formal proof. -/
def lambdaDerivativeClass {L C I : Type*} [AddCommGroup L] [AddCommGroup C]
    [AddCommGroup I] (resInv : C ≃+ I) (D : L →+ I) (q : L) : C := by
  sorry

theorem lambdaDerivativeClass_restrict {L C I : Type*} [AddCommGroup L]
    [AddCommGroup C] [AddCommGroup I] (e : C ≃+ I) (D : L →+ I) (q : L) :
    e (lambdaDerivativeClass e D q) = D q := by
  sorry

theorem lambdaDerivativeClass_generator {R L C I : Type*} [CommRing R]
    [AddCommGroup L] [AddCommGroup C] [AddCommGroup I]
    [Module R L] [Module R C] [Module R I]
    (e : C ≃ₗ[R] I) (D : L →ₗ[R] I) (a : Rˣ) (q : L) :
    lambdaDerivativeClass e.toAddEquiv (((a : R) • D).toAddMonoidHom) q =
      (a : R) • lambdaDerivativeClass e.toAddEquiv D.toAddMonoidHom q := by
  sorry

theorem lambdaDerivativeClass_coefficients {L C I C' I' : Type*}
    [AddCommGroup L] [AddCommGroup C] [AddCommGroup I]
    [AddCommGroup C'] [AddCommGroup I'] (e : C ≃+ I) (e' : C' ≃+ I')
    (D : L →+ I) (D' : L →+ I') (f : C →+ C') (g : I →+ I')
    (he : ∀ c, e' (f c) = g (e c)) (hD : ∀ q, D' q = g (D q)) (q : L) :
    f (lambdaDerivativeClass e D q) = lambdaDerivativeClass e' D' q := by
  sorry

theorem lambdaDerivativeClass_bottom {C : Type*} [AddCommGroup C] (q : C) :
    lambdaDerivativeClass (AddEquiv.refl C) (AddMonoidHom.id C) q = q := by
  sorry

-- lambdaDerivativeClass_empty
example {C : Type*} [AddCommGroup C] (q : C) :
    lambdaDerivativeClass (AddEquiv.refl C) (AddMonoidHom.id C) q = q := by
  sorry
-- lambdaDerivativeClass_zero
example {L C I : Type*} [AddCommGroup L] [AddCommGroup C] [AddCommGroup I]
    (e : C ≃+ I) (D : L →+ I) : lambdaDerivativeClass e D 0 = 0 := by
  sorry
-- lambdaDerivativeClass_restriction_obstruction
example : (0 : ℤ) ≠ 1 ∧ (0 : ℤ →+ ℤ) 0 = (0 : ℤ →+ ℤ) 1 := by
  sorry

-- crystalline-near-trivial-character: ξ is supplied with ξ(γ)=u and infinity
-- type(h,−h). Continuity, crystallinity, congruence and non-torsion are omitted.
/- HeegnerPointEulerSystems:HE.8/crystalline-near-trivial-character
Mathematical statement: Choose γ∈Γ, a p-adic unit u generating the prescribed subgroup, and h with γ^h equal to its Artin image. Let ξ_n(γ)=u^n have infinity type (hn,−hn). For m≥1 define α_m=ξ_(p−1)p^(m−1); these are nontrivial crystalline anticyclotomic characters congruent to1 modulo p^m and approach1. Retain h and the chosen embeddings. No finite-order character is substituted for these crystalline twists.
Hypotheses: E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p. T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used. E(K)[p]=0. p splits as v v̄ in K.
The actual arithmetic identifications and hypotheses above are omitted in this prototype. Supplied maps, modules, ideals and indices must be those of the stated arithmetic suppliers; this is an admitted interface, not a formal proof. -/
def nearTrivialCharacter {G A : Type*} [Group G] [CommGroup A]
    (ξ : G →* A) (p m : ℕ) : G →* A := by
  sorry

theorem nearTrivialCharacter_apply {G A : Type*} [Group G] [CommGroup A]
    (ξ : G →* A) (p m : ℕ) (g : G) :
    nearTrivialCharacter ξ p m g = ξ g ^ ((p-1)*p^(m-1)) := by
  sorry

theorem nearTrivialCharacter_succ {G A : Type*} [Group G] [CommGroup A]
    (ξ : G →* A) (p m : ℕ) (hm : 1 ≤ m) :
    nearTrivialCharacter ξ p (m+1) = nearTrivialCharacter ξ p m ^ p := by
  sorry

theorem nearTrivialCharacter_congruent (p m : ℕ) [Fact p.Prime]
    (ξ : Multiplicative ℤ →* (ℤ_[p])ˣ) (hm : 1 ≤ m) :
    (↑(nearTrivialCharacter ξ p m (Multiplicative.ofAdd 1)) : ℤ_[p]) - 1 ∈
      Ideal.span ({((p : ℤ_[p])^m)} : Set ℤ_[p]) := by
  sorry

theorem nearTrivialCharacter_nontrivial {G A : Type*} [Group G] [CommGroup A]
    (ξ : G →* A) (g : G) (h : ∀ n : ℕ, 0 < n → ξ g ^ n ≠ 1)
    (p m : ℕ) (hp : 1 < p) (hm : 1 ≤ m) : nearTrivialCharacter ξ p m ≠ 1 := by
  sorry

-- nearTrivialCharacter_first
example {G A : Type*} [Group G] [CommGroup A] (ξ : G →* A) :
    nearTrivialCharacter ξ 5 1 = ξ^4 := by
  sorry
-- nearTrivialCharacter_next
example {G A : Type*} [Group G] [CommGroup A] (ξ : G →* A) :
    nearTrivialCharacter ξ 5 2 = ξ^20 := by
  sorry
-- nearTrivialCharacter_torsion_counterexample
example {G A : Type*} [Group G] [CommGroup A] (ξ : G →* A)
    (h : ξ^4 = 1) : nearTrivialCharacter ξ 5 1 = 1 := by
  sorry

-- heegner-divisibility-profile: supplied index is the ES.4 index on actual
-- coefficient classes, with zero↦∞; degree counts auxiliary prime support.
/- HeegnerPointEulerSystems:HE.8/heegner-divisibility-profile
Mathematical statement: For the actual finite Heegner derivative system define M_r=min_(ν(n)=r) ind(κ_n), with values in ℕ∪{∞}; ind is the largest allowed p-divisibility in the coefficient module, and ind(0)=∞. Set M∞=inf_r M_r. Prime restrictions, coefficient ideals I_n and p-optimal parametrization are part of the data. M_0 is the bottom Heegner index and need not equal M∞.
Hypotheses: E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p. T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used. E(K)[p]=0.
The actual arithmetic identifications and hypotheses above are omitted in this prototype. Supplied maps, modules, ideals and indices must be those of the stated arithmetic suppliers; this is an admitted interface, not a formal proof. -/
def heegnerDivisibilityProfile (index : ℕ → ℕ∞) (degree : ℕ → ℕ)
    (allowed : Set ℕ) (r : ℕ) : ℕ∞ := by
  sorry

theorem heegnerDivisibilityProfile_at (index : ℕ → ℕ∞) (degree : ℕ → ℕ)
    (allowed : Set ℕ) (r : ℕ) :
    heegnerDivisibilityProfile index degree allowed r =
      sInf {v | ∃ n ∈ allowed, degree n = r ∧ index n = v} := by
  sorry

theorem heegnerDivisibilityProfile_bottom (index : ℕ → ℕ∞) (degree : ℕ → ℕ)
    (allowed : Set ℕ) (h1 : 1 ∈ allowed) (hdeg : degree 1 = 0)
    (h : ∀ n ∈ allowed, degree n = 0 → n = 1) :
    heegnerDivisibilityProfile index degree allowed 0 = index 1 := by
  sorry

theorem heegnerDivisibilityProfile_top (index : ℕ → ℕ∞) (degree : ℕ → ℕ)
    (allowed : Set ℕ) (r : ℕ) :
    heegnerDivisibilityProfile index degree allowed r = ⊤ ↔
      ∀ n ∈ allowed, degree n = r → index n = ⊤ := by
  sorry

theorem heegnerDivisibilityProfile_rescale (index : ℕ → ℕ∞) (degree : ℕ → ℕ)
    (allowed : Set ℕ) (r t : ℕ) (hne : ∃ n ∈ allowed, degree n = r) :
    heegnerDivisibilityProfile (fun n => (t : ℕ∞) + index n) degree allowed r =
      (t : ℕ∞) + heegnerDivisibilityProfile index degree allowed r := by
  sorry

-- heegnerDivisibilityProfile_zero
example (degree : ℕ → ℕ) (allowed : Set ℕ) (r : ℕ) :
    heegnerDivisibilityProfile (fun _ => ⊤) degree allowed r = ⊤ := by
  sorry
-- heegnerDivisibilityProfile_bottom_vs_infimum
example : heegnerDivisibilityProfile (fun n => if n = 1 then 3 else 1)
    (fun n => if n = 1 then 0 else 1) {1,2} 0 = 3 ∧
    heegnerDivisibilityProfile (fun n => if n = 1 then 3 else 1)
    (fun n => if n = 1 then 0 else 1) {1,2} 1 = 1 := by
  sorry
-- heegnerDivisibilityProfile_sum_not_max
example : heegnerDivisibilityProfile (fun n => if n = 1 then 2 else 5)
    (fun _ => 1) {1,2} 1 = 2 := by
  sorry

-- determinantal-heegner-element: D is the supplier's RATIONAL determinant line;
-- the second module is already the ι-twist and iy is its transported Heegner point.
/- HeegnerPointEulerSystems:HE.8/determinantal-heegner-element
Mathematical statement: Under the source’s rank-one and perfectness assumptions, use the canonical rational isomorphism Q(Λ)⊗det_Λ⁻¹ RΓ̃_f(K,T⊗Λ) ≃ Q(Λ)⊗(S⊗_Λ S^ι). Define z̃∞ as the inverse image of y∞⊗y∞ under this isomorphism. The main conjecture asserts z̃∞ generates the integral determinant lattice, not merely its rationalization.
Hypotheses: E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p. T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used. E(K)[p]=0. p unramified in K; the source’s rational determinant comparison.
The actual arithmetic identifications and hypotheses above are omitted in this prototype. Supplied maps, modules, ideals and indices must be those of the stated arithmetic suppliers; this is an admitted interface, not a formal proof. -/
def determinantalHeegnerElement {R D S Sι : Type*} [CommRing R]
    [AddCommGroup D] [AddCommGroup S] [AddCommGroup Sι]
    [Module R D] [Module R S] [Module R Sι]
    (e : D ≃ₗ[R] (S ⊗[R] Sι)) (y : S) (iy : Sι) : D := by
  sorry

theorem determinantalHeegnerElement_image {R D S Sι : Type*} [CommRing R]
    [AddCommGroup D] [AddCommGroup S] [AddCommGroup Sι]
    [Module R D] [Module R S] [Module R Sι]
    (e : D ≃ₗ[R] (S ⊗[R] Sι)) (y : S) (iy : Sι) :
    e (determinantalHeegnerElement e y iy) = y ⊗ₜ[R] iy := by
  sorry

theorem determinantalHeegnerElement_unique {R D S Sι : Type*} [CommRing R]
    [AddCommGroup D] [AddCommGroup S] [AddCommGroup Sι]
    [Module R D] [Module R S] [Module R Sι]
    (e : D ≃ₗ[R] (S ⊗[R] Sι)) (y : S) (iy : Sι) (z : D)
    (h : e z = y ⊗ₜ[R] iy) : z = determinantalHeegnerElement e y iy := by
  sorry

theorem determinantalHeegnerElement_rescale {R D S Sι : Type*} [CommRing R]
    [AddCommGroup D] [AddCommGroup S] [AddCommGroup Sι]
    [Module R D] [Module R S] [Module R Sι]
    (e : D ≃ₗ[R] (S ⊗[R] Sι)) (y : S) (iy : Sι) (a : R) (ι : R ≃+* R) :
    determinantalHeegnerElement e (a • y) ((ι a) • iy) =
      (a * ι a) • determinantalHeegnerElement e y iy := by
  sorry

theorem determinantalHeegnerElement_baseChange {R D S Sι D' S' Sι' : Type*}
    [CommRing R] [AddCommGroup D] [AddCommGroup S] [AddCommGroup Sι]
    [AddCommGroup D'] [AddCommGroup S'] [AddCommGroup Sι']
    [Module R D] [Module R S] [Module R Sι]
    [Module R D'] [Module R S'] [Module R Sι']
    (e : D ≃ₗ[R] (S ⊗[R] Sι)) (e' : D' ≃ₗ[R] (S' ⊗[R] Sι'))
    (f : D →ₗ[R] D') (g : S →ₗ[R] S') (gi : Sι →ₗ[R] Sι')
    (compat : ∀ y iy, e' (f (e.symm (y ⊗ₜ[R] iy))) = g y ⊗ₜ[R] gi iy)
    (y : S) (iy : Sι) :
    f (determinantalHeegnerElement e y iy) = determinantalHeegnerElement e' (g y) (gi iy) := by
  sorry

-- determinantalHeegnerElement_zero
example {R D S Sι : Type*} [CommRing R] [AddCommGroup D] [AddCommGroup S]
    [AddCommGroup Sι] [Module R D] [Module R S] [Module R Sι]
    (e : D ≃ₗ[R] (S ⊗[R] Sι)) : determinantalHeegnerElement e 0 0 = 0 := by
  sorry
-- determinantalHeegnerElement_scalar_square
example {R D S : Type*} [CommRing R] [AddCommGroup D] [AddCommGroup S]
    [Module R D] [Module R S] (e : D ≃ₗ[R] (S ⊗[R] S)) (y : S) (p : ℕ) :
    determinantalHeegnerElement e ((p : R) • y) ((p : R) • y) =
      ((p : R)^2) • determinantalHeegnerElement e y y := by
  sorry
-- determinantalHeegnerElement_rational_not_basis: test the actual output tensor,
-- identify ℤ ⊗[ℤ] ℤ with ℤ and retain its nonunit coefficient.
example :
    TensorProduct.lid ℤ ℤ
      (determinantalHeegnerElement (LinearEquiv.refl ℤ (ℤ ⊗[ℤ] ℤ)) 5 1) = 5 ∧
    ¬ IsUnit (TensorProduct.lid ℤ ℤ
      (determinantalHeegnerElement (LinearEquiv.refl ℤ (ℤ ⊗[ℤ] ℤ)) 5 1)) := by
  sorry

/- HeegnerPointEulerSystems:HE.8/stabilized-corestriction
Mathematical statement: The stabilized points traced to the anticyclotomic layers satisfy Cor_(K_(k+1)/K_k)y_(k+1)=y_k. The first trace uses the initial correction in ordinary-stabilized-point; a shift d(k) is required when p divides h_K. This construction does not assert Howard Theorem B under the weakened class-number hypothesis.
Hypotheses: E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p. T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used. E(K)[p]=0. Use the actual linear trace maps on the common ambient point-completion and the compatibly included raw points. The unit root α satisfies α²−a_pα+p=0; at positive level cor[k+1](raw[k+2])=a_p raw[k+1]−raw[k] and cor[k+1](raw[k+1])=p raw[k+1]. At the first step cor[0](raw[1])−α⁻¹cor[0](raw[0])=α·initial, with initial the separately corrected point. Identify anticyclotomic traces using the actual d(k).
The actual arithmetic identifications are omitted in this prototype. The displayed topology, finite constraint solvability, transition square and raw norm recurrence, where applicable, are retained as explicit hypotheses. -/
-- The same ambient module contains the compatibly included raw points. At
-- positive levels cor sends the included predecessor to p times that point.
-- The first equation retains the separate initial Euler correction.
theorem stabilized_corestriction {R M : Type*} [CommRing R] [AddCommGroup M]
    [Module R M] (α : Rˣ) (ap : R) (p : ℕ) (raw : ℕ → M) (initial : M)
    (cor : ℕ → M →ₗ[R] M)
    (hroot : (α : R)^2 - ap * (α : R) + (p : R) = 0)
    (hrecurrence : ∀ k, cor (k+1) (raw (k+2)) = ap • raw (k+1) - raw k)
    (hdegree : ∀ k, cor (k+1) (raw (k+1)) = (p : R) • raw (k+1))
    (hfirst : cor 0 (raw 1) - (↑(α⁻¹) : R) • cor 0 (raw 0) = (α : R) • initial)
    (k : ℕ) :
    cor k (stabilizedPoint α raw initial (k+1)) = stabilizedPoint α raw initial k := by
  sorry

/- HeegnerPointEulerSystems:HE.8/cm-generic-root-number
Mathematical statement: For cuspidal parallel-weight-two π over F with finite-order everywhere-unramified central character ω, and prime-to-P conductor N′ coprime to D_(K/F), let S be all real places and the finite inert Q≠P for which ord_Q(N) is odd. For sufficiently ramified compatible ring-class χ, ε(π,χ)=(-1)^|S|. The source’s S_χ equals S at every level if P∤N or P splits in K. Even |S| is definite and odd |S| indefinite.
Hypotheses: π cuspidal parallel weight two; ω finite-order everywhere unramified; N′ and D_(K/F) coprime.
The actual arithmetic identifications and hypotheses above are omitted in this prototype. Supplied maps, modules, ideals and indices must be those of the stated arithmetic suppliers; this is an admitted interface, not a formal proof. -/
theorem cm_generic_root_number {G A : Type*} [Group G] [CommGroup A] (ε : (G →* A) → ℤ)
    (S : Finset ℕ) (strata : ℕ → Set (G →* A)) :
    ∃ n0 : ℕ, ∀ n ≥ n0, ∀ χ ∈ strata n, ε χ = (-1 : ℤ)^S.card := by
  sorry

/- HeegnerPointEulerSystems:HE.8/joint-cm-equidistribution
Mathematical statement: Let F be totally real, K/F CM, and B/F a quaternion algebra split by K and at P, with a fixed K-embedding. Choose a nonempty finite collection 𝒮 of finite sets S of finite places v≠P with B_v split, K_v a field, and |S|+|Ram_f(B)|+[F:ℚ] even; fix the source’s totally definite B_S and compatible local embeddings. Let R⊂Gal(K^ab/K) be nonempty finite and pairwise distinct modulo P-rational elements rec_K(λ), characterized by λ_P∈K×·F_P×. Form the actual simultaneous Red:CM→X(𝒮,R) and component map C with fibre probability measures μ_z. For compact-open G⊂Gal(K^ab/K) with probability Haar dg, a P-isogeny class ℋ, and continuous f:X(𝒮,R)→ℂ, the difference ∫_G f(Red(gx))dg−∫_G∫_(C⁻¹(gx̄))f dμ_(gx̄)dg tends to zero as x escapes compact subsets of ℋ. Here x̄=C(Red(x)); prohibited components are retained.
Hypotheses: B split by K and at P; each auxiliary set satisfies S1–S3 and excludes P, as specified in the statement. R is nonempty and pairwise P-irrational; G is compact open. Artin reciprocity sends uniformizers to geometric Frobenius.
The actual arithmetic identifications and hypotheses above are omitted in this prototype. Supplied maps, modules, ideals and indices must be those of the stated arithmetic suppliers; this is an admitted interface, not a formal proof. -/
theorem joint_cm_equidistribution {X : Type*} (average fibreAverage : ℕ → ℝ) :
    Filter.Tendsto (fun n => average n - fibreAverage n) Filter.atTop (nhds 0) := by
  sorry

/- HeegnerPointEulerSystems:HE.8/joint-cm-orbit-surjectivity
Mathematical statement: At fixed finite level and with the joint CM distribution hypotheses, Red(Gx) equals the fibre C⁻¹(Gx̄) for every x outside a finite subset of its P-isogeny class. The right side retains the component map C and does not assert independent reductions in forbidden components.
Hypotheses: Conditions are included in the statement.
The actual arithmetic identifications and hypotheses above are omitted in this prototype. Supplied maps, modules, ideals and indices must be those of the stated arithmetic suppliers; this is an admitted interface, not a formal proof. -/
theorem joint_cm_orbit_surjectivity {X Y : Type*} (orbit fibre : X → Set Y) :
    Set.Finite {x | orbit x ≠ fibre x} := by
  sorry

/- HeegnerPointEulerSystems:HE.8/indefinite-cm-character-point
Mathematical statement: In CV §4, require (H1) an Eichler order at P in a split B_P, (H2) maximal split level at primes ramifying in K, a P-new nonzero ω-isotypic quotient α:J_H→A, and good CM points x of conductor P^n. For n sufficiently large and fixed admissible χ₀, some χ∈P(n,χ₀) has e_χα(x)≠0 in the Mordell–Weil space tensored with the character field. Weighted traces are non-torsion, not merely nonzero torsion points.
Hypotheses: CV(H1),(H2), P-new quotient and good CM point; χ₀ω=1 on A_F×.
The actual arithmetic identifications and hypotheses above are omitted in this prototype. Supplied maps, modules, ideals and indices must be those of the stated arithmetic suppliers; this is an admitted interface, not a formal proof. -/
theorem indefinite_cm_character_point {G H G0 A M : Type*} [Group G] [Group H] [Group G0]
    [CommGroup A] [AddCommGroup M] (π : G →* H) (tors : G0 →* G)
    (χ0 : G0 →* A) (point : (G →* A) → M) :
    ∃ χ ∈ cmCharacterStratum π tors χ0, point χ ≠ 0 := by
  sorry

/- HeegnerPointEulerSystems:HE.8/definite-cm-character-period
Mathematical statement: For the definite quaternion algebra and CV(H1),(H2), a nonzero P-new vector θ in the Jacquet–Langlands representation of a nonexceptional pair (π,K), and a good CM point x at large conductor, some χ∈P(n,χ₀) has Σ_(σ∈G(n))χ(σ)θ(σx)≠0. Nonexceptionality is π≇π⊗η_(K/F); it cannot be suppressed.
Hypotheses: Definite parity, CV(H1),(H2), nonexceptional π, P-new θ, admissible χ₀ and good CM points.
The actual arithmetic identifications and hypotheses above are omitted in this prototype. Supplied maps, modules, ideals and indices must be those of the stated arithmetic suppliers; this is an admitted interface, not a formal proof. -/
theorem definite_cm_character_period {G H G0 A F : Type*} [Group G] [Group H] [Group G0]
    [CommGroup A] [Field F] (π : G →* H) (tors : G0 →* G)
    (χ0 : G0 →* A) (period : (G →* A) → F) :
    ∃ χ ∈ cmCharacterStratum π tors χ0, period χ ≠ 0 := by
  sorry

/- HeegnerPointEulerSystems:HE.8/definite-rankin-nonvanishing
Mathematical statement: With F,K,π,ω,P,N′,D as in cm-generic-root-number, |S| even and (π,K) nonexceptional, for every sufficiently large n there exists χ∈P(n,χ₀) with L(π,χ,1/2)≠0. This is existence within each fixed-torsion conductor stratum; it is not nonvanishing of all characters.
Hypotheses: Conditions are included in the statement.
The actual arithmetic identifications and hypotheses above are omitted in this prototype. Supplied maps, modules, ideals and indices must be those of the stated arithmetic suppliers; this is an admitted interface, not a formal proof. -/
theorem definite_rankin_nonvanishing {G A F : Type*} [Group G] [CommGroup A] [Field F]
    (strata : ℕ → Set (G →* A)) (L : (G →* A) → F) :
    ∃ n0 : ℕ, ∀ n ≥ n0, ∃ χ ∈ strata n, L χ ≠ 0 := by
  sorry

/- HeegnerPointEulerSystems:HE.8c/cornut-vatsal-nonvanishing-with-its-exact-hypotheses
Mathematical statement: Under the same initial CV data, assume |S| odd, ω=1, and N,D_(K/F),P pairwise coprime. For every sufficiently large n there exists χ∈P(n,χ₀) such that L′(π,χ,1/2)≠0. Use the geometric character-point theorem and the precise generalized Gross–Zagier identity. The definite branch has a separate node.
Hypotheses: ω=1; N,D,P pairwise coprime; |S| odd; χ₀ compatible with central character.
The actual arithmetic identifications and hypotheses above are omitted in this prototype. Supplied maps, modules, ideals and indices must be those of the stated arithmetic suppliers; this is an admitted interface, not a formal proof. -/
theorem cornut_vatsal_indefinite_nonvanishing {G A F : Type*} [Group G]
    [CommGroup A] [Field F] (strata : ℕ → Set (G →* A)) (Lderiv : (G →* A) → F) :
    ∃ n0 : ℕ, ∀ n ≥ n0, ∃ χ ∈ strata n, Lderiv χ ≠ 0 := by
  sorry

/- HeegnerPointEulerSystems:HE.8/cornut-tower-trace-nontorsion
Mathematical statement: In the classical modular Heegner setting with p∤N, the ring-class p-power tower contains a conductor for which the appropriate trace of the modular Heegner point to the anticyclotomic layer is non-torsion. Keep the finite torsion/trace quotient in Cornut’s statement. This does not require the Heegner point of conductor one to be non-torsion and does not say every trace is non-torsion.
Hypotheses: E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p. T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used.
The actual arithmetic identifications and hypotheses above are omitted in this prototype. Supplied maps, modules, ideals and indices must be those of the stated arithmetic suppliers; this is an admitted interface, not a formal proof. -/
theorem cornut_tower_trace_nontorsion {M : Type*} [AddCommGroup M] (trace : ℕ → M) :
    ∃ n : ℕ, ∀ k : ℕ, 0 < k → k • trace n ≠ 0 := by
  sorry

/- HeegnerPointEulerSystems:HE.8/lambda-bottom-class-nontorsion
Mathematical statement: For the actual ordinary Heegner family y∞ under E(K)[p]=0, Λy∞ is free of rank one and y∞ is not Λ-torsion. CGLS gives this nonzero family with the actual class-number conductor shifts. No completed main conjecture, full integral image or p∤h_K assumption is used for this assertion.
Hypotheses: E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p. T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used. E(K)[p]=0.
The actual arithmetic identifications and hypotheses above are omitted in this prototype. Supplied maps, modules, ideals and indices must be those of the stated arithmetic suppliers; this is an admitted interface, not a formal proof. -/
theorem lambda_bottom_class_nontorsion {R S : Type*} [CommRing R] [AddCommGroup S]
    [Module R S] (y : S) : ∀ a : R, a • y = 0 → a = 0 := by
  sorry

/- HeegnerPointEulerSystems:HE.8/lambda-heegner-local-conditions
Mathematical statement: The constructed derivative classes satisfy the transverse condition at ℓ|n, unramified condition away from pNn, and the prescribed propagated condition at bad primes. At v|p the image lies in the ordinary Fil⁺ condition. The proof treats finite decomposition at bad primes and finite ordinary-reduction torsion; it does not replace integral Kummer conditions by rational ones.
Hypotheses: E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p. T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used. Howard’s clean image hypothesis for the direct proof; weaker local verification uses the exact CGLS Theorem 4.1.1 adaptation.
The actual arithmetic identifications and hypotheses above are omitted in this prototype. Supplied maps, modules, ideals and indices must be those of the stated arithmetic suppliers; this is an admitted interface, not a formal proof. -/
theorem lambda_heegner_local_conditions {C Cp CN Caux : Type*} [AddCommGroup C]
    [AddCommGroup Cp] [AddCommGroup CN] [AddCommGroup Caux]
    (locp : C →+ Cp) (locN : C →+ CN) (locaux : C →+ Caux)
    (ordinary : AddSubgroup Cp) (finite : AddSubgroup CN) (transverse : AddSubgroup Caux)
    (κ : ℕ → C) (n : ℕ) : locp (κ n) ∈ ordinary ∧ locN (κ n) ∈ finite ∧
      locaux (κ n) ∈ transverse := by
  sorry

/- HeegnerPointEulerSystems:HE.8/lambda-finite-singular-relation
Mathematical statement: The corrected Λ-adic derivative system satisfies the generic finite/singular comparison at each allowed ℓ. Its arithmetic reduction congruence and the local χ_ℓ identification must commute with localization through the actual Galois change-of-group action. A merely local matrix is not a global G_K-equivariant coefficient endomorphism.
Hypotheses: Conditions are included in the statement.
The actual arithmetic identifications and hypotheses above are omitted in this prototype. Supplied maps, modules, ideals and indices must be those of the stated arithmetic suppliers; this is an admitted interface, not a formal proof. -/
theorem lambda_finite_singular_relation {C F S : Type*} [AddCommGroup C]
    [AddCommGroup F] [AddCommGroup S] (locf : C →+ F) (locs : C →+ S)
    (compare : F ≃+ S) (κ : ℕ → C) (n ℓ : ℕ) :
    compare (locf (κ n)) = locs (κ (n*ℓ)) := by
  sorry

/- HeegnerPointEulerSystems:HE.8/howard-stabilization-unit-comparison
Mathematical statement: Howard’s universal-norm bottom and the ordinary stabilized family generate the same Λ-line: the comparison factor is u_Kα_p²(β_p−1)² when p splits, and u_Kα_p²(β_p²−1) when p is inert. Since β_p∈pℤ_p and u_K is a p-unit in the allowed discriminants, the factor is a unit. This comparison does not make Φ a unit.
Hypotheses: E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p. T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used. E(K)[p]=0.
The actual arithmetic identifications and hypotheses above are omitted in this prototype. Supplied maps, modules, ideals and indices must be those of the stated arithmetic suppliers; this is an admitted interface, not a formal proof. -/
theorem howard_stabilization_unit_comparison {R S : Type*} [CommRing R] [AddCommGroup S]
    [Module R S] (a : Rˣ) (howard ordinary : S) :
    howard = (a : R) • ordinary ∧
      Submodule.span R {howard} = Submodule.span R {ordinary} := by
  sorry

/- HeegnerPointEulerSystems:HE.8/lambda-adic-heegner-kolyvagin-system-and-theorem-B
Mathematical statement: Under Howard’s TheoremA hypotheses, p odd good ordinary, p∤h_K, p,N,D_K pairwise coprime and G_K→GL₂(ℤ_p) surjective, S=H¹_FΛ(K,T⊗Λ) is Λ-torsion-free of rank one, and its discrete dual X is pseudo-isomorphic to Λ⊕M⊕M for a finitely generated torsion Λ-module M with char(M)=char(M)^ι. Moreover char(M) divides char(S/H), H the actual Heegner Λ-line. Equality and integral primitivity are not conclusions.
Hypotheses: E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p. T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used. G_K→GL₂(ℤ_p) surjective; p∤h_K; p,D_K,N pairwise coprime.
The actual arithmetic identifications and hypotheses above are omitted in this prototype. Supplied maps, modules, ideals and indices must be those of the stated arithmetic suppliers; this is an admitted interface, not a formal proof. -/
theorem lambda_adic_heegner_kolyvagin_system_and_theorem_B {R F Sfrac X M : Type*}
    [CommRing R] [Field F] [AddCommGroup Sfrac] [Module F Sfrac]
    [AddCommGroup X] [AddCommGroup M] [Module R X] [Module R M]
    (charM charMi charIndex : Ideal R) : Module.finrank F Sfrac = 1 ∧
    (∃ f : X →ₗ[R] (R × M × M), Finite f.ker ∧ Finite ((R × M × M) ⧸ f.range)) ∧
    charM = charMi ∧ ∃ J : Ideal R, charIndex = charM * J := by
  sorry

/- HeegnerPointEulerSystems:HE.8/weak-torsion-localized-divisibility
Mathematical statement: Under ordinary Heegner conditions and E(K)[p]=0, the CGLS Heegner family exists and the rank-one paired-torsion bound holds over Λ[1/p,1/(γ−1)]. The augmentation inversion can be removed under the source’s extra corank-one condition. The BCS/CGS error-controlled bounds supply stronger assertions in their stated branches; class-number retention alone does not do so.
Hypotheses: E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p. T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used. E(K)[p]=0.
The actual arithmetic identifications and hypotheses above are omitted in this prototype. Supplied maps, modules, ideals and indices must be those of the stated arithmetic suppliers; this is an admitted interface, not a formal proof. -/
theorem weak_torsion_localized_divisibility {R F Sfrac : Type*} [CommRing R]
    [Field F] [AddCommGroup Sfrac] [Module F Sfrac]
    (charM charIndex : Ideal R) : Module.finrank F Sfrac = 1 ∧
      ∃ J : Ideal R, charIndex = charM * J := by
  sorry

/- HeegnerPointEulerSystems:HE.8/near-trivial-heegner-specialization
Mathematical statement: If α≡1 modulo p^m and M(n)≥m, then κ^Λ_n(α)≡C_pκ_n^Heeg modulo p^m. Here C_p=(α_p−1)²(β_p−1)² for split p and C_p=Φ=(p+1)²−a_p² for inert p, in the prescribed normalization. The reduction exists because I_n⊂p^mℤ_p. C_p can be a nonunit; at split p its valuation is twice v_p(#Ẽ(𝔽_p)).
Hypotheses: E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p. T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used. E(K)[p]=0. α is an anticyclotomic twist sufficiently close to1; M(n)≥m.
The actual arithmetic identifications and hypotheses above are omitted in this prototype. Supplied maps, modules, ideals and indices must be those of the stated arithmetic suppliers; this is an admitted interface, not a formal proof. -/
theorem near_trivial_heegner_specialization {R C Cmod : Type*} [CommRing R]
    [AddCommGroup C] [AddCommGroup Cmod] [Module R C] [Module R Cmod]
    (red : C →ₗ[R] Cmod) (κspec κfinite : C) (Cp : R) (Mdepth m : ℕ)
    (hm : m ≤ Mdepth) : red κspec = Cp • red κfinite := by
  sorry

/- HeegnerPointEulerSystems:HE.8/near-trivial-bottom-nonvanishing
Mathematical statement: There is a neighbourhood of1 such that every nontrivial α in it has κ^Heeg_1(α)≠0. This follows from a non-Λ-torsion family and the finite zero set of a nonzero one-variable series. The specialization at α=1 is not included: its nonvanishing is equivalent to the appropriate analytic-rank-one condition.
Hypotheses: E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p. T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used. E(K)[p]=0.
The actual arithmetic identifications and hypotheses above are omitted in this prototype. Supplied maps, modules, ideals and indices must be those of the stated arithmetic suppliers; this is an admitted interface, not a formal proof. -/
theorem near_trivial_bottom_nonvanishing {C : Type*} [AddCommGroup C] (κ : ℕ → C) :
    ∃ m0 : ℕ, ∀ m ≥ m0, κ m ≠ 0 := by
  sorry

/- HeegnerPointEulerSystems:HE.8/optimal-lattice-isogeny-comparison
Mathematical statement: For E₀ optimal on X₀(N), E₁ optimal on X₁(N), and the distinguished E_• with T_f identified integrally with T_pE_•, the prescribed isogeny E₀→E_• is étale at odd p. For sufficiently near-trivial α, I_•(α)C_•(α)=I₀(α)C₀(α), where I is the bottom-class index and C the finite-cokernel local index modulo torsion. Neither factor is individually asserted equal under arbitrary isogeny.
Hypotheses: E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p. T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used. E(K)[p]=0. p splits as v v̄ in K.
The actual arithmetic identifications and hypotheses above are omitted in this prototype. Supplied maps, modules, ideals and indices must be those of the stated arithmetic suppliers; this is an admitted interface, not a formal proof. -/
theorem optimal_lattice_isogeny_comparison (Ibullet Cbullet I0 C0 : ℕ) :
    Ibullet * Cbullet = I0 * C0 := by
  sorry

/- HeegnerPointEulerSystems:HE.8/twisted-logarithm-index-formula
Mathematical statement: With E_• and α sufficiently close to1, L_BDP(α⁻¹)≠0 and κ_1^•(α)≠0, let t_α=length_(ℤ_p^ur)(ℤ_p^ur/L_BDP(α⁻¹)), q_•=#H⁰(ℚ_p,E_•[p∞]), I_•=#(S_α/ℤ_pκ_1^•(α)), and C_•=#coker(loc_v) modulo torsion. Then p^tα q_•=I_•C_•. Use the source’s coefficient extension and square-root BDP normalization.
Hypotheses: E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p. T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used. E(K)[p]=0. p splits as v v̄ in K.
The actual arithmetic identifications and hypotheses above are omitted in this prototype. Supplied maps, modules, ideals and indices must be those of the stated arithmetic suppliers; this is an admitted interface, not a formal proof. -/
theorem twisted_logarithm_index_formula (p t q I C : ℕ) : p^t * q = I * C := by
  sorry

/- HeegnerPointEulerSystems:HE.8/twisted-anticyclotomic-control
Mathematical statement: For m≫0 and α=α_m, a characteristic generator F_E of the strict-at-v, unrestricted-at-v̄ Greenberg dual satisfies #(ℤ_p/F_E(α⁻¹))=#Sha(W_α⁻¹/K)·C_α²·∏_(w|N)c_w^(p)(α⁻¹)·q_E². The finite Sha is the source’s propagated Selmer quotient. The formula is integral and uses all K-primes over N and the finite/torsion local cokernel.
Hypotheses: E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p. T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used. E(K)[p]=0. p splits as v v̄ in K.
The actual arithmetic identifications and hypotheses above are omitted in this prototype. Supplied maps, modules, ideals and indices must be those of the stated arithmetic suppliers; this is an admitted interface, not a formal proof. -/
theorem twisted_anticyclotomic_control (fIndex sha C tam q : ℕ) :
    fIndex = sha * C^2 * tam * q^2 := by
  sorry

/- HeegnerPointEulerSystems:HE.8/near-trivial-tamagawa-stability
Mathematical statement: For α≡1 modulo p^m the twisted local Tamagawa p-factor c_w^(p)(α) is congruent to the untwisted c_w^(p) modulo p^m. For m greater than the total relevant valuations this gives equality of the product of p-parts. Keep w|N over K; under the Heegner hypothesis its untwisted product is the square of the rational Tamagawa p-part.
Hypotheses: E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p. T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used. E(K)[p]=0.
The actual arithmetic identifications and hypotheses above are omitted in this prototype. Supplied maps, modules, ideals and indices must be those of the stated arithmetic suppliers; this is an admitted interface, not a formal proof. -/
theorem near_trivial_tamagawa_stability (twisted untwisted : ℕ) : twisted = untwisted := by
  sorry

/- HeegnerPointEulerSystems:HE.8/arithmetic-rescaled-kolyvagin-bound
Mathematical statement: There exist M and E depending only on T_pE such that, for α≡1 modulo p^m with m≥M and a permitted deep-prime Kolyvagin system κ̃ for T_α with κ̃₁≠0, the dual Selmer group is ℚ_p/ℤ_p⊕M_α⊕M_α and length M_α≤ind(κ̃₁)+E. The constant does not grow with m, the deep-prime set or common p-rescaling. Under the source’s surjectivity hypothesis E=0.
Hypotheses: E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p. T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used. E(K)[p]=0.
The actual arithmetic identifications and hypotheses above are omitted in this prototype. Supplied maps, modules, ideals and indices must be those of the stated arithmetic suppliers; this is an admitted interface, not a formal proof. -/
theorem arithmetic_rescaled_kolyvagin_bound {R Sel DP M : Type*} [CommRing R]
    [AddCommGroup Sel] [AddCommGroup DP] [AddCommGroup M]
    [Module R Sel] [Module R DP] [Module R M] (lengthM index E : ℕ) :
    Nonempty (Sel ≃ₗ[R] (DP × M × M)) ∧ lengthM ≤ index + E := by
  sorry

/- HeegnerPointEulerSystems:HE.8/heegner-exact-sha-length
Mathematical statement: For p>3, a surjective residual representation and the generic self-dual rank-one hypotheses, the specialized actual anticyclotomic Heegner system over a finite DVR R with κ₁≠0 gives length_R Sha(W_α/K)=2(M₀(α)−M∞(α)). No near-triviality is needed in the generic theorem; near-trivial α is used in the arithmetic application. The deep-prime restriction and rigidity hypotheses remain explicit. BCGS states Theorem 2.2.2 for p≥3 through Proposition 2.2.1, but its proof invokes Lemma 2.2.4, stated only for p>3. The p=3 proof extension remains a source gap.
Hypotheses: E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p. T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used. E(K)[p]=0. Residual G_Q representation surjective; R finite DVR; the source’s self-dual/cartesian hypotheses and κ₁≠0. p>3 for the verified proof route.
The actual arithmetic identifications and hypotheses above are omitted in this prototype. Supplied maps, modules, ideals and indices must be those of the stated arithmetic suppliers; this is an admitted interface, not a formal proof. -/
theorem heegner_exact_sha_length (shaLength M0 Minfty : ℕ) :
    Minfty ≤ M0 ∧ shaLength = 2 * (M0 - Minfty) := by
  sorry

/- HeegnerPointEulerSystems:HE.8/integral-main-conjecture-index-square
Mathematical statement: Assume the integral anticyclotomic Greenberg main conjecture in Λ^ur with the BCGS square-root convention. For α_m sufficiently close to1, the p-optimal curve satisfies I₀(α)²=#Sha(W_α⁻¹/K)·∏_(w|N)c_w^(p)(α⁻¹)·q₀⁴. A rational main conjecture supplies only a bounded p-power error; it does not supply this exact equality.
Hypotheses: E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p. T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used. E(K)[p]=0. p splits as v v̄ in K. Integral anticyclotomic Greenberg main conjecture and the p-optimal lattice.
The actual arithmetic identifications and hypotheses above are omitted in this prototype. Supplied maps, modules, ideals and indices must be those of the stated arithmetic suppliers; this is an admitted interface, not a formal proof. -/
theorem integral_main_conjecture_index_square (I sha tam q : ℕ) :
    I^2 = sha * tam * q^4 := by
  sorry

/- HeegnerPointEulerSystems:HE.8/bcgs-conditional-kolyvagin-nonvanishing
Mathematical statement: Under (Heeg),(disc),(tor), p odd good ordinary and split in K, the rational anticyclotomic main conjecture (indeed its required lower divisibility after inverting p) implies κ_n^Heeg≠0 for some squarefree n of allowed Kolyvagin primes. No analytic-rank-one hypothesis is made and κ₁ may vanish.
Hypotheses: E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p. T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used. E(K)[p]=0. p splits as v v̄ in K. Rational anticyclotomic main conjecture, kept as a theorem hypothesis.
The actual arithmetic identifications and hypotheses above are omitted in this prototype. Supplied maps, modules, ideals and indices must be those of the stated arithmetic suppliers; this is an admitted interface, not a formal proof. -/
theorem bcgs_conditional_kolyvagin_nonvanishing {C : Type*} [AddCommGroup C]
    (κ : ℕ → C) (allowed : Set ℕ) : ∃ n ∈ allowed, κ n ≠ 0 := by
  sorry

/- HeegnerPointEulerSystems:HE.8/bcgs-conditional-refined-divisibility
Mathematical statement: Assume p>3, surjective residual G_Q→GL₂(𝔽_p), good ordinary p split in K, (Heeg),(disc),(tor), a p-optimal parametrization, and the integral anticyclotomic main conjecture. Then M∞ of the finite Heegner system is finite and equals Σ_(ℓ|N)v_p(c_ℓ(E/ℚ)). This is half the sum over K-primes; it is neither M₀ nor the order of Sha.
Hypotheses: E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p. T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used. E(K)[p]=0. p splits as v v̄ in K. p>3; residual surjectivity; p-optimal parametrization; integral main conjecture.
The actual arithmetic identifications and hypotheses above are omitted in this prototype. Supplied maps, modules, ideals and indices must be those of the stated arithmetic suppliers; this is an admitted interface, not a formal proof. -/
theorem bcgs_conditional_refined_divisibility (index : ℕ → ℕ∞) (degree : ℕ → ℕ)
    (allowed : Set ℕ) (tamVal : ℕ) :
    (⨅ r : ℕ, heegnerDivisibilityProfile index degree allowed r) = (tamVal : ℕ∞) := by
  sorry

/- HeegnerPointEulerSystems:HE.8/strict-ordinary-selmer-complex
Mathematical statement: For CS coefficients X=T⊗Λ and twists T_α, instantiate the imported Selmer complex as the cone of global cochains mapping to ⊕_(v|p)RΓ(K_v,X/X_v⁺) and ⊕_(v|N)Cone(RΓ_ur→RΓ). Its H¹ is the strict ordinary Selmer lattice S; its H² is related by Poitou–Tate to the all-p ordinary discrete dual X_Gr(A). This rank-one dual is distinct from BCS’s torsion (0,empty) Greenberg module.
Hypotheses: E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p. T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used. E(K)[p]=0. p unramified in K.
The actual arithmetic identifications and hypotheses above are omitted in this prototype. Supplied maps, modules, ideals and indices must be those of the stated arithmetic suppliers; this is an admitted interface, not a formal proof. -/
theorem strict_ordinary_selmer_complex {R H1 S : Type*} [CommRing R]
    [AddCommGroup H1] [AddCommGroup S] [Module R H1] [Module R S] :
    Nonempty (H1 ≃ₗ[R] S) := by
  sorry

/- HeegnerPointEulerSystems:HE.8/determinant-characteristic-ideal-comparison
Mathematical statement: The assertion that z̃∞ is an integral determinant basis is equivalent to char_Λ(S/Λy∞)·char_Λ(S/Λy∞)^ι=char_Λ(X_Gr(A)_tors) for the CS all-p ordinary dual. Writing a square requires the source’s ι-invariance; rational equality cannot certify an integral basis.
Hypotheses: E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p. T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used. E(K)[p]=0.
The actual arithmetic identifications and hypotheses above are omitted in this prototype. Supplied maps, modules, ideals and indices must be those of the stated arithmetic suppliers; this is an admitted interface, not a formal proof. -/
theorem determinant_characteristic_ideal_comparison {R D : Type*} [CommRing R]
    [AddCommGroup D] [Module R D] (z : D) (charIndex charIndexi charX : Ideal R) :
    (Function.Bijective (fun a : R => a • z)) ↔ charIndex * charIndexi = charX := by
  sorry

/- HeegnerPointEulerSystems:HE.8/ordinary-local-specialization-defect
Mathematical statement: For near-trivial nontrivial α, the local finite/ordinary comparison at v|p contributes the p-part of #Ẽ(𝔽_v), identified with the corresponding H⁰(K_v,A_v⁻(α±)). Set L_p=∏_(v|p)#Ẽ(𝔽_v). For split p v_p(Φ)=v_p(L_p)=2v_p(#Ẽ(𝔽_p)); for inert p use #Ẽ(𝔽_(p²))=(p+1)²−a_p². Retain both signs of the twist.
Hypotheses: E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p. T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used. E(K)[p]=0. p unramified in K; α sufficiently near1.
The actual arithmetic identifications and hypotheses above are omitted in this prototype. Supplied maps, modules, ideals and indices must be those of the stated arithmetic suppliers; this is an admitted interface, not a formal proof. -/
theorem ordinary_local_specialization_defect (Φval Lpval : ℕ) : Φval = Lpval := by
  sorry

/- HeegnerPointEulerSystems:HE.8/determinant-specialization-lattice
Mathematical statement: For a continuous α:Γ→ℤ_p× with α≡1 modulo p^m, m≫0 and κ₁,Λ^Heeg(α)≠0, the source proves that both S_(α±1) are free of rank one. Then the specialized rational determinant map to S_α⊗S_α⁻¹ sends the integral determinant lattice, up to a ℤ_p-unit, to L_p²·Tam_E²·#X_BK(T_α*/K) times that tensor lattice. Here X_BK is the finite quotient of the propagated Selmer group in CS; for a general twist it need not be the Bloch–Kato group. Tam_E=∏_(ℓ|N)c_ℓ over ℚ.
Hypotheses: E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p. T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used. E(K)[p]=0. p unramified in K; α continuous with α≡1 modulo p^m; κ₁,Λ^Heeg(α)≠0; m sufficiently large.
The actual arithmetic identifications and hypotheses above are omitted in this prototype. Supplied maps, modules, ideals and indices must be those of the stated arithmetic suppliers; this is an admitted interface, not a formal proof. -/
theorem determinant_specialization_lattice {R P : Type*} [CommRing R]
    [AddCommGroup P] [Module R P] (image full : Submodule R P) (Lp tam sha : ℕ) :
    image = full.map ((((Lp^2 * tam^2 * sha : ℕ) : R)) • (LinearMap.id : P →ₗ[R] P)) := by
  sorry

/- HeegnerPointEulerSystems:HE.8/determinantal-twisted-index-square
Mathematical statement: If z̃∞ generates the integral Selmer determinant and α is sufficiently close to1 but nontrivial, then the square of the Heegner bottom index equals L_p² Tam_E² #X_BK(T_α*/K), up to a ℤ_p-unit (equivalently as p-valuations). The transported Φ comparison and unit normalization remain explicit.
Hypotheses: E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p. T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used. E(K)[p]=0. Integral determinantal main conjecture; p unramified in K.
The actual arithmetic identifications and hypotheses above are omitted in this prototype. Supplied maps, modules, ideals and indices must be those of the stated arithmetic suppliers; this is an admitted interface, not a formal proof. -/
theorem determinantal_twisted_index_square (indexVal Lpval tamVal shaVal : ℕ) :
    2 * indexVal = 2 * Lpval + 2 * tamVal + shaVal := by
  sorry

/- HeegnerPointEulerSystems:HE.8/castella-sano-refined-equivalence
Mathematical statement: For p>3, residual G_Q surjectivity, good ordinary p unramified in K, (Heeg),(disc), and a parametrization whose Manin constant is prime to p, M∞=v_p(Tam_E) holds if and only if the integral determinantal Heegner main conjecture of CS3.2.2 holds. The theorem permits inert p; it does not prove that conjecture at inert p.
Hypotheses: E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p. T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used. E(K)[p]=0. p>3; residual G_Q surjectivity; p unramified in K; p∤Manin constant.
The actual arithmetic identifications and hypotheses above are omitted in this prototype. Supplied maps, modules, ideals and indices must be those of the stated arithmetic suppliers; this is an admitted interface, not a formal proof. -/
theorem castella_sano_refined_equivalence {R D : Type*} [CommRing R]
    [AddCommGroup D] [Module R D] (z : D) (index : ℕ → ℕ∞)
    (degree : ℕ → ℕ) (allowed : Set ℕ) (tamVal : ℕ) :
    ((⨅ r : ℕ, heegnerDivisibilityProfile index degree allowed r) = (tamVal : ℕ∞)) ↔
      Function.Bijective (fun a : R => a • z) := by
  sorry

/- HeegnerPointEulerSystems:HE.8b/bdp-function-convention-comparison
Mathematical statement: After the same coefficient extension and primitive/imprimitive local normalizations, BCS’s single-power anticyclotomic L-function generates the same ideal as (L_BDP^BCGS)² in Λ^ur. Period/unit conventions are compared as ideals, not by arbitrary exact equality of functions. All nonunit Euler factors in changes of local condition remain visible.
Hypotheses: Conditions are included in the statement.
The actual arithmetic identifications and hypotheses above are omitted in this prototype. Supplied maps, modules, ideals and indices must be those of the stated arithmetic suppliers; this is an admitted interface, not a formal proof. -/
theorem bdp_function_convention_comparison {R : Type*} [CommRing R]
    (bcs bdp : R) : Ideal.span {bcs} = Ideal.span {bdp^2} := by
  sorry

/- HeegnerPointEulerSystems:HE.8b/anticyclotomic-formulation-comparison
Mathematical statement: In the classical N⁻=1 split ordinary setting with p>3 and H⁰(G_K,E[p])=0, the integral Heegner-index divisibility char(X_tors) ⊃ char(S/Λy∞)² is equivalent to the corresponding Greenberg/BDP divisibility char(X_(0,empty))Λ^ur ⊃ (L_BDP²), with the reverse divisibilities also equivalent (BCK Theorem 5.2). Retain the coefficient extension, finite local cokernels, ι and nonunit Euler factors. This comparison does not itself prove either divisibility. Separately, CGLS Proposition 4.2.1 proves the analogous comparison after inverting p under E(K)[p]=0 for odd p. The general weak-torsion p=3 integral extension is not certified; an exact integral comparison must be supplied before using that extension.
Hypotheses: E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p. T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used. E(K)[p]=0. p splits as v v̄ in K. For the integral statement p>3; for the rational CGLS variant p is odd and both characteristic ideals are extended to Λ⊗ℚ_p.
The actual arithmetic identifications and hypotheses above are omitted in this prototype. Supplied maps, modules, ideals and indices must be those of the stated arithmetic suppliers; this is an admitted interface, not a formal proof. -/
theorem anticyclotomic_formulation_comparison {R : Type*} [CommRing R]
    (charX charIndex charGreenberg bdpSquare : Ideal R) :
    (charIndex^2 ≤ charX) ↔ (bdpSquare ≤ charGreenberg) := by
  sorry

/- HeegnerPointEulerSystems:HE.8b/auxiliary-quadratic-field-verification
Mathematical statement: For the BCS irreducible branch, choose the auxiliary real quadratic F with p inert, D_F odd and every D_F-prime split in K; for ℓ|N choose ℓ inert in F when ℓ≡−1 modulo p and split otherwise. Retain irreducibility after restricting to G_(FK) and G_(F(ζ_p)), the p=5 exceptional real field exclusion and finite discriminant avoidance. These are the precise hypotheses used by the Hilbert/quartic-CM supplier.
Hypotheses: E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p. T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used. E(K)[p]=0. p splits as v v̄ in K. p>3; E[p] irreducible over G_Q; the source’s auxiliary-field and Fujiwara(H1)–(H3) assumptions.
The actual arithmetic identifications and hypotheses above are omitted in this prototype. Supplied maps, modules, ideals and indices must be those of the stated arithmetic suppliers; this is an admitted interface, not a formal proof. -/
theorem auxiliary_quadratic_field_verification (candidates : Set ℤ) (avoid : Finset ℤ) :
    ∃ d ∈ candidates, d ∉ avoid := by
  sorry

/- HeegnerPointEulerSystems:HE.8b/anticyclotomic-euler-system-divisibility
Mathematical statement: Under p odd ordinary, (Heeg),(disc) and E[p] irreducible over G_K, the actual Heegner family gives rank one and char(X_tors) ⊃ char(S/Λy∞)² after inverting p. In the split case the equivalent Greenberg/BDP bound holds. Under residual G_Q surjectivity the bounds are integral. This is the weak-hypothesis CGS/BCS bound, not Howard B with its hypotheses silently removed.
Hypotheses: E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p. T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used. E[p] irreducible over G_K; integral branch additionally has G_Q residual surjectivity.
The actual arithmetic identifications and hypotheses above are omitted in this prototype. Supplied maps, modules, ideals and indices must be those of the stated arithmetic suppliers; this is an admitted interface, not a formal proof. -/
theorem anticyclotomic_euler_system_divisibility {R : Type*} [CommRing R]
    (charX charIndex : Ideal R) : charIndex^2 ≤ charX := by
  sorry

/- HeegnerPointEulerSystems:HE.8b/anticyclotomic-reverse-product-divisibility
Mathematical statement: For the chosen auxiliary F, the imported Wan/Fujiwara quartic-CM theorem, shared two-variable restriction/factorization, and anticyclotomic projection imply the reverse product divisibility for E/K and E^F/K against their BDP functions. Specialize the Greenberg local conditions exactly as in BCS §5, and obtain individual reverse divisibilities by combining the opposite Euler-system bounds and cancelling nonzero factors. Integral cancellation uses μ=0 and the source’s period/regulator hypotheses.
Hypotheses: E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p. T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used. E(K)[p]=0. p splits as v v̄ in K. p>3; irreducible residual G_Q representation; all auxiliary-field and period hypotheses of the suppliers.
The actual arithmetic identifications and hypotheses above are omitted in this prototype. Supplied maps, modules, ideals and indices must be those of the stated arithmetic suppliers; this is an admitted interface, not a formal proof. -/
theorem anticyclotomic_reverse_product_divisibility {R : Type*} [CommRing R]
    (charX charXF bdp bdpF : Ideal R) : charX * charXF ≤ bdp * bdpF := by
  sorry

/- HeegnerPointEulerSystems:HE.8b/rational-heegner-main-conjecture
Mathematical statement: For p>3 good ordinary, (disc),(Heeg),(spl), and E[p] irreducible over G_Q, S and X have Λ-rank one and char_Λ(X_tors)=char_Λ(S/Λy∞)² in Λ[1/p]. No analytic-rank condition, p∤h_K assumption or residual surjectivity is added; integrality is a different branch.
Hypotheses: E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p. T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used. E(K)[p]=0. p splits as v v̄ in K. p>3; E[p] irreducible over G_Q.
The actual arithmetic identifications and hypotheses above are omitted in this prototype. Supplied maps, modules, ideals and indices must be those of the stated arithmetic suppliers; this is an admitted interface, not a formal proof. -/
theorem rational_heegner_main_conjecture {R F Sfrac Xfrac : Type*}
    [CommRing R] [Field F] [AddCommGroup Sfrac] [AddCommGroup Xfrac]
    [Module F Sfrac] [Module F Xfrac] (charX charIndex : Ideal R) :
    Module.finrank F Sfrac = 1 ∧ Module.finrank F Xfrac = 1 ∧ charX = charIndex^2 := by
  sorry

/- HeegnerPointEulerSystems:HE.8b/integral-heegner-main-conjecture
Mathematical statement: For the same ordinary split setting with p>3 and residual G_Q→GL₂(𝔽_p) surjective, S and X have Λ-rank one and char_Λ(X_tors)=char_Λ(S/Λy∞)² integrally in Λ. The integral period, μ and generic descent hypotheses are those verified in the BCS supplier chain.
Hypotheses: E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p. T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used. E(K)[p]=0. p splits as v v̄ in K. p>3; residual G_Q representation surjective.
The actual arithmetic identifications and hypotheses above are omitted in this prototype. Supplied maps, modules, ideals and indices must be those of the stated arithmetic suppliers; this is an admitted interface, not a formal proof. -/
theorem integral_heegner_main_conjecture {R F Sfrac Xfrac : Type*}
    [CommRing R] [Field F] [AddCommGroup Sfrac] [AddCommGroup Xfrac]
    [Module F Sfrac] [Module F Xfrac] (charX charIndex : Ideal R) :
    Module.finrank F Sfrac = 1 ∧ Module.finrank F Xfrac = 1 ∧ charX = charIndex^2 := by
  sorry

/- HeegnerPointEulerSystems:HE.8b/rational-greenberg-bdp-main-conjecture
Mathematical statement: Under the rational Heegner main-conjecture hypotheses, X_(0,empty) is Λ-torsion and char_Λ(X_(0,empty))Λ^ur=(L_BDP²) in Λ^ur[1/p], where L_BDP is BCGS’s square-root function. This torsion module is not CS’s all-p ordinary rank-one dual.
Hypotheses: E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p. T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used. E(K)[p]=0. p splits as v v̄ in K. p>3; residual irreducibility over G_Q.
The actual arithmetic identifications and hypotheses above are omitted in this prototype. Supplied maps, modules, ideals and indices must be those of the stated arithmetic suppliers; this is an admitted interface, not a formal proof. -/
theorem rational_greenberg_bdp_main_conjecture {R X : Type*} [CommRing R]
    [AddCommGroup X] [Module R X] (charX : Ideal R) (bdp : R) :
    (∀ x : X, ∃ a : R, a ≠ 0 ∧ a • x = 0) ∧ charX = Ideal.span {bdp^2} := by
  sorry

/- HeegnerPointEulerSystems:HE.8b/integral-greenberg-bdp-main-conjecture
Mathematical statement: Under the integral Heegner main-conjecture hypotheses, X_(0,empty) is Λ-torsion and char_Λ(X_(0,empty))Λ^ur=(L_BDP²) integrally. The coefficient ring Λ^ur and p-primary content are retained.
Hypotheses: E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p. T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used. E(K)[p]=0. p splits as v v̄ in K. p>3; residual G_Q surjectivity.
The actual arithmetic identifications and hypotheses above are omitted in this prototype. Supplied maps, modules, ideals and indices must be those of the stated arithmetic suppliers; this is an admitted interface, not a formal proof. -/
theorem integral_greenberg_bdp_main_conjecture {R X : Type*} [CommRing R]
    [AddCommGroup X] [Module R X] (charX : Ideal R) (bdp : R) :
    (∀ x : X, ∃ a : R, a ≠ 0 ∧ a • x = 0) ∧ charX = Ideal.span {bdp^2} := by
  sorry

/- HeegnerPointEulerSystems:HE.8b/eisenstein-main-conjecture-adapter
Mathematical statement: For CGS Theorem C, E/ℚ has a rational p-isogeny with kernel character φ, p∤2N, K satisfies (disc),(Heeg),(spl), and φ|_(G_p)≠1,ω. Its integral Heegner/Greenberg equality, in the agreed coefficient and BDP conventions, supplies BCGS Theorem 1.2.13(i). This is an adapter of the independently supplied theorem, not a duplicate proof or an extension to excluded local characters.
Hypotheses: E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p. T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used. E(K)[p]=0. p splits as v v̄ in K. A rational p-isogeny with kernel character φ and φ|G_p≠1,ω; p∤2N and (disc),(Heeg),(spl). No analytic-rank-one (Sel) hypothesis is added.
The actual arithmetic identifications and hypotheses above are omitted in this prototype. Supplied maps, modules, ideals and indices must be those of the stated arithmetic suppliers; this is an admitted interface, not a formal proof. -/
theorem eisenstein_main_conjecture_adapter {R : Type*} [CommRing R]
    (charX : Ideal R) (bdp : R) : charX = Ideal.span {bdp^2} := by
  sorry

/- HeegnerPointEulerSystems:HE.8b/split-kolyvagin-nonvanishing-branches
Mathematical statement: BCGS finite-system nonvanishing is unconditional in each acquired main-conjecture branch: (i) the requested CGS Eisenstein local-character branch; (ii) p>3 and residual G_Q irreducibility; (iii) p>3 and residual surjectivity. In each case apply the conditional TheoremA with the exact branch hypotheses. No p=3 irreducible branch is inferred from BCS.
Hypotheses: E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p. T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used. E(K)[p]=0. p splits as v v̄ in K.
The actual arithmetic identifications and hypotheses above are omitted in this prototype. Supplied maps, modules, ideals and indices must be those of the stated arithmetic suppliers; this is an admitted interface, not a formal proof. -/
theorem split_kolyvagin_nonvanishing_branches {C : Type*} [AddCommGroup C]
    (κ : ℕ → C) (allowed : Set ℕ) : ∃ n ∈ allowed, κ n ≠ 0 := by
  sorry

/- HeegnerPointEulerSystems:HE.8b/split-refined-kolyvagin-divisibility
Mathematical statement: For p>3 residual G_Q surjective, ordinary split Heegner setting and p-optimal parametrization, M∞=Σ_(ℓ|N)v_p(c_ℓ(E/ℚ)). The integral BCS theorem discharges the conditional TheoremB; rational irreducibility alone does not discharge it.
Hypotheses: E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p. T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used. E(K)[p]=0. p splits as v v̄ in K. p>3; residual surjectivity; p-optimal parametrization.
The actual arithmetic identifications and hypotheses above are omitted in this prototype. Supplied maps, modules, ideals and indices must be those of the stated arithmetic suppliers; this is an admitted interface, not a formal proof. -/
theorem split_refined_kolyvagin_divisibility (index : ℕ → ℕ∞) (degree : ℕ → ℕ)
    (allowed : Set ℕ) (tamVal : ℕ) :
    (⨅ r : ℕ, heegnerDivisibilityProfile index degree allowed r) = (tamVal : ℕ∞) := by
  sorry

/- HeegnerPointEulerSystems:HE.8b/split-determinantal-heegner-main-conjecture
Mathematical statement: In the CS TheoremC setting with p split in K, the integral BCS Heegner main conjecture and determinant/characteristic comparison show z̃∞ generates its integral Selmer determinant. Consequently the refined finite Heegner index equals v_p(Tam_E). For inert p the main-conjecture hypothesis is still unproved by this chain.
Hypotheses: E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p. T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used. E(K)[p]=0. p splits as v v̄ in K. p>3; residual surjectivity; p∤Manin constant.
The actual arithmetic identifications and hypotheses above are omitted in this prototype. Supplied maps, modules, ideals and indices must be those of the stated arithmetic suppliers; this is an admitted interface, not a formal proof. -/
theorem split_determinantal_heegner_main_conjecture {R D : Type*} [CommRing R]
    [AddCommGroup D] [Module R D] (z : D) : Function.Bijective (fun a : R => a • z) := by
  sorry

/- HeegnerPointEulerSystems:HE.8/relative-ring-class-tower-torsion-finite
Mathematical statement: For the CV relative CM tower K[P^∞]/K and an abelian variety A/K, A(K[P^∞])_tors is finite. Choose two good-reduction places of K above distinct residue characteristics and primes Q≠P of F that do not split in K. CV Lemma 2.7 bounds their local extension degrees in the tower; prime-to-residue-characteristic reduction injectivity at these two places bounds all torsion. This is a statement about this tower, not torsion over every abelian extension.
Hypotheses: F totally real, K/F CM, P a fixed finite prime, and the relative ring-class tower and its reciprocity identification of HE.0. A/K an abelian variety; choose two distinct residue characteristics away from P and the bad reduction set.
The actual arithmetic identifications and hypotheses above are omitted in this prototype. Supplied maps, modules, ideals and indices must be those of the stated arithmetic suppliers; this is an admitted interface, not a formal proof. -/
theorem relative_ring_class_tower_torsion_finite {A B : Type*}
    [AddCommGroup A] [Fintype B] (tors : AddSubgroup A)
    (red : tors → B) (hinj : Function.Injective red) : Set.Finite (tors : Set A) := by
  sorry

end TauCeti.Heegner.Anticyclotomic
