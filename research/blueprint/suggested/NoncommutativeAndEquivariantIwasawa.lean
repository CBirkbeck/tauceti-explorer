/-
Suggested.lean — NoncommutativeAndEquivariantIwasawa (noncommutative and equivariant Iwasawa theory)

This file is a prototype, not a library file. It records the signatures, API lemmas and unit tests planned by
`research/blueprint/packets/NoncommutativeAndEquivariantIwasawa.json`, each proved by `sorry`. The mathematics,
hypotheses and sources are in the packet and in `research/blueprint/readmes/NoncommutativeAndEquivariantIwasawa.md`;
node ids are given in the comments.

Checkpoint 1 plans NE.0 (the group-theoretic and ring-theoretic finiteness facts; the completed group algebra itself is
owned by PadicMeasuresIwasawaAlgebras L1) and NE.1 (the canonical Ore set of Coates–Fukaya–Kato–Sujatha–Venjakob, its
localization and torsion categories).

NE.1's Ore argument is prototyped abstractly, for a ring `A` (standing for Λ(G)) that is a left module over a ring `B`
(standing for Λ(H)) through left multiplication. The completed group algebra of a profinite group is not in the pinned
libraries; statements that need it are recorded as comments. Tau Ceti's `TauCeti.IsProP` (pro-p groups) is the intended
pro-p hypothesis; this file imports Mathlib only and spells the condition out.
-/
import Mathlib.RingTheory.OreLocalization.Ring
import Mathlib.RingTheory.OreLocalization.NonZeroDivisors
import Mathlib.RingTheory.Finiteness.Basic
import Mathlib.LinearAlgebra.Quotient.Basic
import Mathlib.RingTheory.PowerSeries.Basic
import Mathlib.Algebra.Polynomial.Basic
import Mathlib.Topology.Algebra.OpenSubgroup
import Mathlib.Topology.Algebra.ClopenNhdofOne
import Mathlib.GroupTheory.PGroup
import Mathlib.GroupTheory.Commutator.Basic
import Mathlib.Data.ZMod.Basic
import Mathlib.Data.Rat.Init

namespace TauCeti.NoncommIwasawa

/-! ## NE.0. Uniform and compact p-adic analytic groups -/

section Groups

variable (p : ℕ) (G : Type*) [Group G] [TopologicalSpace G] [IsTopologicalGroup G]

/-- The pro-p condition (Tau Ceti's `TauCeti.IsProP`): every open normal quotient is a p-group. -/
def IsProPGroup : Prop := ∀ U : OpenNormalSubgroup G, IsPGroup p (G ⧸ (U : Subgroup G))

/-- `NoncommutativeAndEquivariantIwasawa:NE.0/lower-p-series`: P₁ = G and P_{i+1} the closure of
P_i^p [P_i, G]. -/
noncomputable def lowerPSeries (p : ℕ) (G : Type*) [Group G] [TopologicalSpace G] : ℕ → Subgroup G := sorry

theorem lowerPSeries_one : lowerPSeries p G 1 = ⊤ := sorry

theorem lowerPSeries_succ_le (i : ℕ) : lowerPSeries p G (i + 1) ≤ lowerPSeries p G i := sorry

/-- `NoncommutativeAndEquivariantIwasawa:NE.0/uniform-pro-p-group`: finitely generated, powerful, and
|P_i : P_{i+1}| = |G : P₂| for all i ≥ 1. -/
def IsUniform (p : ℕ) (G : Type*) [Group G] [TopologicalSpace G] : Prop := sorry

/-- `NoncommutativeAndEquivariantIwasawa:NE.0/compact-padic-analytic-group`: a profinite group with an open normal
uniform pro-p subgroup (Lazard; Dixon–du Sautoy–Mann–Segal Corollary 8.34). -/
def IsCompactPAdicAnalytic : Prop :=
  CompactSpace G ∧ TotallyDisconnectedSpace G ∧ T2Space G ∧
    ∃ U : OpenNormalSubgroup G, IsProPGroup p (U : Subgroup G) ∧ IsUniform p (U : Subgroup G)

-- Unit tests.
/-- A finite group is compact p-adic analytic (the trivial subgroup is uniform of dimension 0). -/
example [Finite G] [DiscreteTopology G] : IsCompactPAdicAnalytic p G := sorry

end Groups

/-
The completed group algebras Λ(G) = lim Z_p[G/U] and Ω(G) = lim F_p[G/U] are owned by PadicMeasuresIwasawaAlgebras L1.
Once they exist, NE.0 proves (signatures as comments):

theorem IwasawaAlgebra.free_of_open (H' ≤ H open) : Module.Free (Λ H') (Λ H), rank [H : H']        -- iwasawa-free-over-open-subgroup
theorem IwasawaAlgebra.isLocalRing_iff (hG : IsCompactPAdicAnalytic p G) :
    IsLocalRing (Λ G) ↔ IsProPGroup p G                                                          -- iwasawa-local-iff-pro-p
theorem IwasawaAlgebra.gr_equiv_mvPolynomial (hU : IsUniform p U) : gr_J (Ω U) ≃ MvPolynomial (Fin d) (ZMod p)
                                                                                                 -- uniform-graded-polynomial
theorem IwasawaAlgebra.isNoetherianRing (hG : IsCompactPAdicAnalytic p G) :
    IsNoetherianRing (Λ G) ∧ IsNoetherianRing (Λ G)ᵐᵒᵖ                                              -- iwasawa-noetherian
theorem IwasawaAlgebra.finite_of_finite_coinvariants (hJ : IsProPGroup p J) (M compact Λ J-module) :
    Module.Finite (Λ J) M ↔ Finite (M ⧸ 𝔪_J M)                                                      -- compact-nakayama
-/

/-! ## NE.1. The canonical Ore set, abstractly -/

section Canonical

universe u v

variable (A : Type u) (B : Type v) [Ring A] [Ring B] [Module B A] [IsScalarTower B A A]

/-- `NoncommutativeAndEquivariantIwasawa:NE.1/canonical-ore-set`: S = {f | A / A f is finitely generated over B}.
For A = Λ(G) and B = Λ(H) this is the set S of Coates–Fukaya–Kato–Sujatha–Venjakob. -/
def canonicalSet : Set A := {f | Module.Finite B (A ⧸ Submodule.span A ({f} : Set A))}

/-- A module over `A` is `S`-torsion if every element is killed by an element of `S`. -/
def IsSTorsion (S : Set A) (M : Type*) [AddCommGroup M] [Module A M] : Prop :=
  ∀ x : M, ∃ s ∈ S, s • x = 0

/-- The finiteness criterion of CFKSV Proposition 2.3, as a property of the pair (A, B). -/
def HasFiniteTorsionCriterion : Prop :=
  ∀ (M : Type u) [AddCommGroup M] [Module A M] [Module B M] [IsScalarTower B A M],
    Module.Finite A M → (Module.Finite B M ↔ IsSTorsion A (canonicalSet A B) M)

theorem one_mem_canonicalSet [Module.Finite B B] : (1 : A) ∈ canonicalSet A B := sorry

/-- `NoncommutativeAndEquivariantIwasawa:NE.1/canonical-ore-theorem`, multiplicativity: the exact sequence
0 → A s₂ / A s₁ s₂ → A / A s₁ s₂ → A / A s₂ → 0. -/
theorem mul_mem_canonicalSet [IsNoetherianRing B] {s₁ s₂ : A} (h₁ : s₁ ∈ canonicalSet A B)
    (h₂ : s₂ ∈ canonicalSet A B) : s₁ * s₂ ∈ canonicalSet A B := sorry

/-- The canonical submonoid (given `1 ∈ S`). -/
def canonicalSubmonoid [Module.Finite B B] [IsNoetherianRing B] : Submonoid A where
  carrier := canonicalSet A B
  one_mem' := one_mem_canonicalSet A B
  mul_mem' := mul_mem_canonicalSet A B

/-- `NoncommutativeAndEquivariantIwasawa:NE.1/s-torsion-iff-finitely-generated`, the direction that holds for any
pair: a finitely generated S-torsion module is finitely generated over B. -/
theorem finite_of_isSTorsion [IsNoetherianRing B] (M : Type*) [AddCommGroup M] [Module A M] [Module B M]
    [IsScalarTower B A M] [Module.Finite A M] (h : IsSTorsion A (canonicalSet A B) M) : Module.Finite B M := sorry

/-- `NoncommutativeAndEquivariantIwasawa:NE.1/canonical-ore-theorem`, the left Ore condition in Mathlib's
orientation (`t * r = w * s`), from the torsion criterion. -/
theorem exists_ore_left (hcrit : HasFiniteTorsionCriterion A B) {s r : A} (hs : s ∈ canonicalSet A B) :
    ∃ t ∈ canonicalSet A B, ∃ w : A, t * r = w * s := sorry

/-- The elements of S are left non-zero-divisors (in the group case: CFKSV Theorem 2.4, last assertion). -/
def CanonicalNonZeroDivisors : Prop := ∀ s ∈ canonicalSet A B, ∀ x : A, x * s = 0 → x = 0

/-- Mathlib's Ore set structure on the canonical submonoid. -/
noncomputable abbrev oreSet [Module.Finite B B] [IsNoetherianRing B] (hcrit : HasFiniteTorsionCriterion A B)
    (hnzd : CanonicalNonZeroDivisors A B) : OreLocalization.OreSet (canonicalSubmonoid A B) := sorry

/-- `NoncommutativeAndEquivariantIwasawa:NE.1/canonical-localization`: A → A_S is injective. -/
theorem numeratorHom_injective [Module.Finite B B] [IsNoetherianRing B]
    [OreLocalization.OreSet (canonicalSubmonoid A B)] (hnzd : CanonicalNonZeroDivisors A B) :
    Function.Injective (OreLocalization.numeratorRingHom (R := A) (S := canonicalSubmonoid A B)) := sorry

-- Unit tests.
/-- B = A: every quotient is cyclic over A, so S = A (degenerate case; 0 ∈ S shows that the zero-divisor
statement needs the group hypotheses). -/
example : canonicalSet A A = Set.univ := sorry

/-- A = F_p[[T]] = Ω(Z_p), B = F_p (H = 1): S is the set of nonzero power series. -/
example (p : ℕ) [Fact p.Prime] :
    canonicalSet (PowerSeries (ZMod p)) (ZMod p) = {f | f ≠ 0} := sorry

/-- A = ℚ[X], B = ℚ: A / A f is finite-dimensional exactly when f ≠ 0. -/
example : canonicalSet (Polynomial ℚ) ℚ = {f | f ≠ 0} := sorry

end Canonical

/-
Group-level statements (Λ(G) from PadicMeasuresIwasawaAlgebras L1), recorded as comments:

theorem canonicalSet_eq_finite_coinvariants (J ≤ H pro-p open, normal in G) :
    S = {f | Module.Finite ℤ_p (Λ(G/J) ⧸ Λ(G/J) φ_J f)}                                             -- canonical-set-left-criteria (i)
      = {f | Finite (Ω(G/J) ⧸ Ω(G/J) ψ_J f)}                                                          -- (ii)
      = {f | Function.Injective (· * ψ_J f : Ω(G/J) → Ω(G/J))}                                        -- (iii)
theorem canonicalSet_eq_right (…) : S = {f | Module.Finite (Λ H) (Λ G ⧸ f Λ G)}                     -- canonical-set-right-criteria
theorem hasFiniteTorsionCriterion (hG : IsCompactPAdicAnalytic p G) (hΓ : G ⧸ H ≃ ℤ_p) :
    HasFiniteTorsionCriterion (Λ G) (Λ H)                                                              -- s-torsion-iff-finitely-generated
theorem canonicalOreSet (…) : OreSet S ∧ S ⊆ nonZeroDivisors (Λ G)                                  -- canonical-ore-theorem
theorem canonicalSet_eq_regular_mod_primeRadical (…) : S = {f | IsRegular (f mod 𝒩)}                 -- regular-modulo-prime-radical
def saturatedSet := ⋃ n, p^n • S;  Λ_{S*} ≃ Λ_S[1/p]                                                   -- saturated-ore-set
def MH (G) := {M : f.g. Λ(G)-module | IsSTorsion S* M}                                                  -- category-MHG
def SigmaS := {C : perfect complex over Λ(G) | Acyclic (Λ_S ⊗ C)}                                        -- torsion-perfect-complexes
-/

end TauCeti.NoncommIwasawa
