import Mathlib.NumberTheory.NumberField.CMField
import Mathlib.LinearAlgebra.SesquilinearForm.Basic
import Mathlib.NumberTheory.LSeries.PrimesInAP
import Mathlib.NumberTheory.ZetaValues
import Mathlib.NumberTheory.Padics.PadicNumbers
import Mathlib.FieldTheory.IsAlgClosed.AlgebraicClosure
import Mathlib.Data.Set.Card
import Mathlib.Topology.Algebra.OpenSubgroup
import Mathlib.LinearAlgebra.Dimension.Finrank

/-!
# Galois sections and p-adic period mappings — suggested Lean statements

This file is not the roadmap, and it is not exhaustive: the roadmap document
`GaloisSectionsPadicPeriodMaps.md` is definitive. The statements below suggest Lean forms for
the parts of the roadmap whose carriers exist in the pinned Mathlib and Tau Ceti, so that
contributors and reviewers converge on names and signatures. Everything else (Galois sections
of étale fundamental groups, filtered (φ, N, G_v)-modules, period maps, the Lawrence–Venkatesh
loci) is a README target, because its carriers are not at the pins.

Proofs are left as `sorry`; nothing here is claimed to be formalised.
-/

noncomputable section

open NumberField

namespace TauCetiRoadmap.GaloisSectionsPadicPeriodMaps

/-! ## SPM.0: the divisibility input of local injectivity

A compact, totally disconnected Hausdorff abelian group (for instance `A(L)` for an abelian
variety over a finite extension `L/ℚ_p`) has no nonzero element divisible by every positive
integer. This is the step that makes the section map injective over `p`-adic fields
(`SPM.0/local-section-map-injective`). -/

/-- In a profinite abelian group an element divisible by every positive integer is zero. -/
theorem eq_zero_of_forall_divisible {A : Type*} [AddCommGroup A] [TopologicalSpace A]
    [IsTopologicalAddGroup A] [CompactSpace A] [TotallyDisconnectedSpace A] [T2Space A]
    (x : A) (hx : ∀ n : ℕ, 0 < n → ∃ y : A, n • y = x) : x = 0 := by
  sorry

/-! ## SPM.1: symplectic modules

A field specialisation of the roadmap's symplectic module: a finite-dimensional space `V`,
a one-dimensional space `L`, and a perfect alternating pairing `ω : V → V → L`.
The categorical definition over finite algebras stays in the README. -/

/-- A finite-dimensional symplectic space with its one-dimensional similitude line. -/
structure SymplecticModule (A V L : Type*) [Field A] [AddCommGroup V] [Module A V]
    [FiniteDimensional A V] [AddCommGroup L] [Module A L] [FiniteDimensional A L] where
  /-- The pairing. -/
  ω : V →ₗ[A] V →ₗ[A] L
  /-- The pairing is alternating. -/
  isAlt : ω.IsAlt
  /-- The pairing is perfect: `V ≃ Hom_A(V, L)`. -/
  perfect : Function.Bijective ω
  /-- The similitude module is a line, including when `V` has dimension zero. -/
  line_rank : Module.finrank A L = 1

namespace SymplecticModule

variable {A V L : Type*} [Field A] [AddCommGroup V] [Module A V] [FiniteDimensional A V]
  [AddCommGroup L] [Module A L] [FiniteDimensional A L] (S : SymplecticModule A V L)

/-- A submodule on which the pairing vanishes. -/
def IsIsotropic (W : Submodule A V) : Prop :=
  ∀ x ∈ W, ∀ y ∈ W, S.ω x y = 0

/-- A Lagrangian submodule: isotropic and equal to its own orthogonal. -/
def IsLagrangian (W : Submodule A V) : Prop :=
  S.IsIsotropic W ∧ ∀ x : V, (∀ y ∈ W, S.ω x y = 0) → x ∈ W

theorem isIsotropic_bot : S.IsIsotropic ⊥ := by
  intro x hx y _
  rw [Submodule.mem_bot] at hx
  simp [hx]

/-- The orthogonal of a Lagrangian is itself. -/
theorem IsLagrangian.orthogonal_eq {W : Submodule A V} (h : S.IsLagrangian W) (x : V) :
    (∀ y ∈ W, S.ω x y = 0) ↔ x ∈ W :=
  ⟨h.2 x, fun hx y hy => h.1 x hx y hy⟩

end SymplecticModule

/-- The standard alternating form on `K²`: `ω(x, y) = x₀y₁ − x₁y₀`. -/
def stdForm (K : Type*) [Field K] : (Fin 2 → K) →ₗ[K] (Fin 2 → K) →ₗ[K] K :=
  LinearMap.mk₂ K (fun x y => x 0 * y 1 - x 1 * y 0)
    (fun x x' y => by simp only [Pi.add_apply]; ring)
    (fun c x y => by simp only [Pi.smul_apply, smul_eq_mul]; ring)
    (fun x y y' => by simp only [Pi.add_apply]; ring)
    (fun c x y => by simp only [Pi.smul_apply, smul_eq_mul]; ring)

theorem stdForm_isAlt (K : Type*) [Field K] : (stdForm K).IsAlt := by
  intro x
  simp [stdForm, mul_comm]

theorem stdForm_perfect (K : Type*) [Field K] : Function.Bijective (stdForm K) := by
  sorry

/-- Unit test: the standard symplectic plane, the case `d = 1` (an elliptic curve's `H¹`). -/
example (K : Type*) [Field K] : ∃ S : SymplecticModule K (Fin 2 → K) K, S.ω = stdForm K :=
  ⟨⟨stdForm K, stdForm_isAlt K, stdForm_perfect K, by simp⟩, rfl⟩

/-- Unit test (non-example): the zero form on `K²` is alternating but not perfect. -/
example (K : Type*) [Field K] :
    ¬ Function.Bijective (0 : (Fin 2 → K) →ₗ[K] (Fin 2 → K) →ₗ[K] K) := by
  sorry

/-- Unit test: in the standard plane every line is isotropic. -/
example (K : Type*) [Field K] (S : SymplecticModule K (Fin 2 → K) K) (hS : S.ω = stdForm K)
    (v : Fin 2 → K) : S.IsIsotropic (K ∙ v) := by
  sorry

/-! ## SPM.3: self-conjugate places

A prime `P` of `𝓞 K` is self-conjugate when, for every CM subfield `E ⊆ K`, complex
conjugation of `E` fixes the prime `P ∩ 𝓞 E` (Betts–Stix Definition 2.17). -/

/-- The prime of `𝓞 E` below a prime of `𝓞 K`. -/
abbrev primeBelow {K : Type*} [Field K] [NumberField K] (E : IntermediateField ℚ K)
    (P : Ideal (𝓞 K)) : Ideal (𝓞 E) :=
  P.comap (algebraMap (𝓞 E) (𝓞 K))

/-- Self-conjugate primes (Betts–Stix Definition 2.17). -/
def IsSelfConjugate (K : Type*) [Field K] [NumberField K] (P : Ideal (𝓞 K)) : Prop :=
  ∀ (E : IntermediateField ℚ K) [IsCMField E],
    (primeBelow E P).map (IsCMField.ringOfIntegersComplexConj E) = primeBelow E P

/-- Conjugate primes: restrictions to every CM subfield exchanged by complex conjugation. -/
def AreConjugate (K : Type*) [Field K] [NumberField K] (P Q : Ideal (𝓞 K)) : Prop :=
  ∀ (E : IntermediateField ℚ K) [IsCMField E],
    (primeBelow E P).map (IsCMField.ringOfIntegersComplexConj E) = primeBelow E Q

theorem isSelfConjugate_iff_areConjugate (K : Type*) [Field K] [NumberField K]
    (P : Ideal (𝓞 K)) : IsSelfConjugate K P ↔ AreConjugate K P P :=
  Iff.rfl

/-- Remark 2.18(1): with no CM subfield, every prime is self-conjugate. -/
theorem isSelfConjugate_of_forall_not_isCMField (K : Type*) [Field K] [NumberField K]
    (h : ∀ E : IntermediateField ℚ K, ¬ IsCMField E) (P : Ideal (𝓞 K)) :
    IsSelfConjugate K P := by
  intro E hE
  exact absurd hE (h E)

/-- Unit test: every prime of `ℚ` is self-conjugate (`ℚ` has no CM subfield). -/
example (P : Ideal (𝓞 ℚ)) : IsSelfConjugate ℚ P := by
  sorry

/-! ## SPM.6–SPM.8: numerics of the trichotomy and of the Kodaira–Parshin choice -/

/-- The proportion of points of a finite `G`-set lying in orbits with fewer than four elements
(Betts–Stix, proof of Proposition 6.20). -/
def smallOrbitProportion (G X : Type*) [Group G] [MulAction G X] [Fintype X] : ℚ := by
  classical
  exact ((Finset.univ.filter (fun x : X => Nat.card (MulAction.orbit G x) < 4)).card : ℚ) /
    Fintype.card X

/-- Type (c) for the split algebra of functions on a finite `G`-set (Definition 6.8). -/
def IsTypeC (G X : Type*) [Group G] [MulAction G X] [Fintype X] (d : ℕ) : Prop :=
  (1 : ℚ) / (d + 1) ≤ smallOrbitProportion G X

theorem smallOrbitProportion_le_one (G X : Type*) [Group G] [MulAction G X] [Fintype X] :
    smallOrbitProportion G X ≤ 1 := by
  sorry

/-- Unit test: a regular orbit of size five has no small orbits. -/
example : smallOrbitProportion (Multiplicative (ZMod 5)) (Multiplicative (ZMod 5)) = 0 := by
  sorry

/-- The relative dimension `d_q = (g − 1/2)(q − 1)` of the Kodaira–Parshin family. -/
def kodairaParshinRelDim (g q : ℕ) : ℕ := (2 * g - 1) * ((q - 1) / 2)

/-- Unit test (Remark 1.4): genus three, `q = 23` gives relative dimension 55. -/
example : kodairaParshinRelDim 3 23 = 55 := rfl

/-- Unit test (Remark 1.4): genus three, `q = 11` gives relative dimension 25. -/
example : kodairaParshinRelDim 3 11 = 25 := rfl

/-- The dimension `d(2d + 1) + 1` of `GSp_{2d}` (Proposition 2.16(2)). -/
def gspDim (d : ℕ) : ℕ := d * (2 * d + 1) + 1

/-- The dimension `d(d + 1)/2` of the Lagrangian Grassmannian of a `2d`-dimensional space. -/
def lagrangianGrassmannianDim (d : ℕ) : ℕ := d * (d + 1) / 2

example : gspDim 1 = 4 := rfl

example : lagrangianGrassmannianDim 2 = 3 := rfl

/-- Lemma 6.13, the dimension count: for residue degree `r ≥ 4` the orbits of `Aut^GSp`
modulo scalars (dimension `≤ d(2d + 1)`) are too small to be Zariski dense in the Weil
restriction of the Lagrangian Grassmannian. -/
theorem gsp_orbit_dim_lt (r d : ℕ) (hr : 4 ≤ r) (hd : 1 ≤ d) :
    d * (2 * d + 1) < r * lagrangianGrassmannianDim d := by
  sorry

/-- Condition (1) of Proposition 6.20 on the Kodaira–Parshin parameter `q` at a place with
residue field of size `qv`. -/
def IsGoodParameter (qv q : ℕ) : Prop :=
  ¬ 4 ∣ q - 1 ∧
    ∀ r ∈ (qv * (qv + 1) * (qv ^ 3 - 1)).primeFactors, r ≠ 2 → ¬ r ∣ q - 1

/-- Corollary 6.22, arithmetic part: by Dirichlet's theorem, good parameters exist beyond any
bound. -/
theorem exists_isGoodParameter (qv B : ℕ) (hqv : 2 ≤ qv) :
    ∃ q > B, q.Prime ∧ IsGoodParameter qv q := by
  sorry

/-- The zeta bound used in Proposition 6.20: `ζ(2g) < 9/8` for `g ≥ 2`. -/
theorem zeta_two_mul_lt (g : ℕ) (hg : 2 ≤ g) :
    ∑' n : ℕ, (1 : ℝ) / (n : ℝ) ^ (2 * g) < 9 / 8 := by
  sorry

/-- Proposition 6.20, the final inequality: if `2k ≥ 9n` then
`(9/8) n / k^g < 1/((2g − 1)k + 1)`. -/
theorem typeC_size_bound (g k n : ℕ) (hg : 2 ≤ g) (hn : 1 ≤ n) (hk : 9 * n ≤ 2 * k) :
    (9 : ℝ) / 8 * n / (k : ℝ) ^ g < 1 / ((2 * g - 1 : ℝ) * k + 1) := by
  sorry

/-- Remark 6.21: a `p`-adic field with `p ≥ 5` (here `ℚ_p`) has exactly seven subfields of
degree two or three in its algebraic closure. -/
theorem ncard_quadratic_cubic_subfields (p : ℕ) [Fact p.Prime] (hp : 5 ≤ p) :
    {L : IntermediateField ℚ_[p] (AlgebraicClosure ℚ_[p]) |
      Module.finrank ℚ_[p] L = 2 ∨ Module.finrank ℚ_[p] L = 3}.ncard = 7 := by
  sorry

end TauCetiRoadmap.GaloisSectionsPadicPeriodMaps
