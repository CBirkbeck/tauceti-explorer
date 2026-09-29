import Mathlib.Data.Finset.Powerset
import Mathlib.Data.ZMod.Basic
import Mathlib.LinearAlgebra.Matrix.Trace
import Mathlib.Tactic.IntervalCases

/-!
# Suggested Lean forms: ModularityAndLanglandsExtensions (checkpoint 1: ML.0, ML.2)

**Standard note.** This file is not the roadmap and it is not exhaustive. The roadmap document
(`ModularityAndLanglandsExtensions`) is definitive. Galois representations, automorphic
representations and deformation rings are not in the pinned libraries, so the planned declarations
are sketched in the comment below; the checked examples test the finite combinatorics that the
source's hypotheses rest on.

Pinned baseline: Mathlib `082e2d3`, Tau Ceti `f790474`. Source: Barnet-Lamb–Gee–Geraghty–Taylor,
arXiv:1010.2561v4.

```
-- ML.2/polarized-galois-representation
structure IsPolarized (r : GaloisRep F ℚ̄_[l] n) (μ : GaloisChar F⁺ ℚ̄_[l]) : Prop where
  pairing : ∃ (v : InfinitePlace F⁺) (ε : ℤˣ) (B : BilinForm ℚ̄_[l] (Fin n → ℚ̄_[l])), B.Nondegenerate ∧ …
-- ML.2/adequate-subgroup
structure IsAdequate (H : Subgroup (GL (Fin n) 𝔽̄_[l])) : Prop where
  h1_triv : groupCohomology.H1 (trivialRep H) = 0
  h1_sl : groupCohomology.H1 (slRep H) = 0
  h0_sl : groupCohomology.H0 (slRep H) = 0
  span : Submodule.span 𝔽̄_[l] {g.val | (g : H) (_ : Nat.Coprime (orderOf g) l)} = ⊤
-- ML.2/potentially-diagonalizable
def IsPotentiallyDiagonalizable (ρ : LocalGaloisRep K 𝒪 n) : Prop :=
  ∃ K' : FiniteExtension K, IsCrystalline (ρ.restrict K') ∧ ∃ χ : Fin n → CrystallineChar K' 𝒪,
    Connects (ρ.restrict K') (⨁ i, χ i)
-- ML.2/pd-automorphy-lifting
theorem isAutomorphic_of_pd (h : IsPolarized r μ) (hreg : IsRegularAlgebraic r)
    (hpd : ∀ v ∣ l, IsPotentiallyDiagonalizable (r.restrict v))
    (hirr : (r.reduction.restrict (F⟮ζ_l⟯)).IsIrreducible) (hl : 2 * (d + 1) ≤ l) (hζ : ζ_l ∉ F)
    (haut : r.reduction.IsOrdinarilyAutomorphic ∨ r.reduction.IsPDAutomorphic) :
    IsPDAutomorphic r μ
-- ML.2/potential-automorphy-theorem
theorem potential_automorphy (…) : ∃ F' : CMExtension F, IsGalois F₀ F' ∧ F'.Disjoint Favoid ∧
    ∀ i, IsAutomorphic ((r i).restrict F') ((μ i).restrict F'⁺)
```
-/

namespace TauCeti.PotentialAutomorphy.SuggestedTest

set_option autoImplicit false

/-- `ML.2/multiple-product-l-functions` (Corollary 5.4.4): for `K = {1, 2, 4}` the `2^#K = 8`
partial sums are distinct, so `⊗_k r_{f_k}` is regular. -/
example : ((({1, 2, 4} : Finset ℕ).powerset).image (fun s => s.sum id)).card = 8 := by decide

/-- The non-example `K = {1, 2, 3}`: `1 + 2 = 3`, so only 7 partial sums are distinct. -/
example : ((({1, 2, 3} : Finset ℕ).powerset).image (fun s => s.sum id)).card = 7 := by decide

/-- `ML.2/preliminary-pd-automorphy-lifting`: the regularity condition of Proposition 4.1.1 in rank
two, `HT(r) = {0, 1}`, `HT(r_{l,ı}(π)) = {0, 2}`: the four sums are distinct. -/
example : ((({0, 1} : Finset ℤ) ×ˢ ({0, 2} : Finset ℤ)).image (fun p => p.1 + p.2)).card = 4 := by
  decide

/-- The same condition fails for `HT(r) = HT(r_{l,ı}(π)) = {0, 1}`: `0 + 1 = 1 + 0`. -/
example : ((({0, 1} : Finset ℤ) ×ˢ ({0, 1} : Finset ℤ)).image (fun p => p.1 + p.2)).card = 3 := by
  decide

/-- `ML.2/adequate-subgroup`: when `l ∣ n` the scalar matrices lie in `sl_n`, so `H⁰(H, sl_n) ≠ 0`
and no subgroup is adequate; here `l = n = 3`. -/
example : Matrix.trace (1 : Matrix (Fin 3) (Fin 3) (ZMod 3)) = 0 := by
  rw [Matrix.trace_one]
  decide

/-- `ML.2/polarized-galois-representation`, non-example: the Hodge–Tate multiset `{0, 1, 5}` is not
of the form `{w - h}` for any `w`, so `1 ⊕ ε_l⁻¹ ⊕ ε_l⁻⁵` is not polarizable. -/
example (w : ℤ) : ({0, 1, 5} : Finset ℤ).image (fun h => w - h) ≠ {0, 1, 5} := by
  intro hw
  have h0 : (0 : ℤ) ∈ ({0, 1, 5} : Finset ℤ).image (fun h => w - h) := by
    rw [hw]; decide
  simp only [Finset.mem_image, Finset.mem_insert, Finset.mem_singleton] at h0
  obtain ⟨a, ha, hwa⟩ := h0
  have hw' : w = a := by omega
  subst hw'
  rcases ha with rfl | rfl | rfl <;> revert hw <;> decide

end TauCeti.PotentialAutomorphy.SuggestedTest
