/-
Suggested Lean file for `RelativeFarguesFontaine`, part RF4 (job BP-RelativeFarguesFontaine--RF4).

This file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/RelativeFarguesFontaine--RF4.md` is definitive. The statements below
suggest Lean forms, so that contributors and reviewers converge on names and signatures. The proposed theorem proofs
use `sorry`; nothing here is formalised, and every node of the packet keeps
`implementationStatus = "unchecked"`.

Native Lean is given where the pinned Mathlib (082e2d3) has the carriers: exact squares of rings,
glueing data, glueing pairs and the Beauville–Laszlo theorem; the local (affinoid-chart) form of
modifications and lattices; the comparison with Mathlib's `BDeRhamPlus`; and the lifting of sections
of formally smooth algebras over adically complete rings, which is the step "triviality modulo `I_S`
implies triviality" of Fargues–Scholze VI.1.7.

The relative curves `𝒴_S, Y_S, X_S`, the divisors `Div^d`, the rings `B^+_{Div^d}`, perfectoid
spaces and `G`-bundles on adic spaces are not in the pinned libraries, so the declarations that need
them are recorded in `CONTRACT` comment blocks at the end, under the packet's names and with the
packet's statements. A condition that cannot yet be stated is left out; it is never replaced by a
`Prop`-valued placeholder.
-/
import Mathlib.RingTheory.AdicCompletion.Algebra
import Mathlib.RingTheory.Localization.Away.Basic
import Mathlib.RingTheory.Flat.Basic
import Mathlib.Algebra.Module.FinitePresentation
import Mathlib.RingTheory.Etale.Finite
import Mathlib.RingTheory.Perfectoid.BDeRham
import Mathlib.RingTheory.Smooth.AdicCompletion
import Mathlib.RingTheory.Henselian
import Mathlib.RingTheory.PicardGroup
import Mathlib.LinearAlgebra.Dual.Defs
import Mathlib.LinearAlgebra.TensorProduct.Tower

open TensorProduct

universe u

namespace TauCeti

/-! ## RF4:vector-bundles — algebra of exact squares (Kedlaya–Liu 1.3.7–1.3.10) -/

section ExactSquare

variable (R R₁ R₂ R₁₂ : Type u) [CommRing R] [CommRing R₁] [CommRing R₂] [CommRing R₁₂]
  [Algebra R R₁] [Algebra R R₂] [Algebra R R₁₂] [Algebra R₁ R₁₂] [Algebra R₂ R₁₂]
  [IsScalarTower R R₁ R₁₂] [IsScalarTower R R₂ R₁₂]

/-- **Exact square** (Kedlaya–Liu, Definition 1.3.7): a commuting square `R → R₁, R₂ → R₁₂`
with `0 → R → R₁ ⊕ R₂ → R₁₂ → 0` exact, the last arrow being the difference. No topology. -/
structure ExactSquare : Prop where
  /-- `R → R₁ × R₂` is injective. -/
  injective : Function.Injective fun r : R => (algebraMap R R₁ r, algebraMap R R₂ r)
  /-- `ExactSquare.exact`: a pair with equal images in `R₁₂` comes from `R`. -/
  exact : ∀ (a : R₁) (b : R₂), algebraMap R₁ R₁₂ a = algebraMap R₂ R₁₂ b →
    ∃ r : R, algebraMap R R₁ r = a ∧ algebraMap R R₂ r = b
  /-- The difference map `R₁ × R₂ → R₁₂` is surjective. -/
  surjective : ∀ z : R₁₂, ∃ (a : R₁) (b : R₂), algebraMap R₁ R₁₂ a - algebraMap R₂ R₁₂ b = z

variable (M₁ M₂ M₁₂ : Type u) [AddCommGroup M₁] [Module R₁ M₁] [AddCommGroup M₂] [Module R₂ M₂]
  [AddCommGroup M₁₂] [Module R₁₂ M₁₂]

/-- **Glueing datum** over the square (Kedlaya–Liu, Definition 1.3.7): modules `M₁, M₂, M₁₂`
over `R₁, R₂, R₁₂` with identifications `ψ₁, ψ₂` over `R₁₂`. -/
structure GlueingDatum where
  /-- `ψ₁ : M₁ ⊗_{R₁} R₁₂ ≅ M₁₂`. -/
  ψ₁ : R₁₂ ⊗[R₁] M₁ ≃ₗ[R₁₂] M₁₂
  /-- `ψ₂ : M₂ ⊗_{R₂} R₁₂ ≅ M₁₂`. -/
  ψ₂ : R₁₂ ⊗[R₂] M₂ ≃ₗ[R₁₂] M₁₂

namespace GlueingDatum

variable {R₁ R₂ R₁₂ M₁ M₂ M₁₂}

variable {R} [Module R M₁] [Module R M₂]
  [IsScalarTower R R₁ M₁] [IsScalarTower R R₂ M₂]

/-- The module of sections, with restriction of scalars from the two pieces. -/
def sections (D : GlueingDatum R₁ R₂ R₁₂ M₁ M₂ M₁₂) : Submodule R (M₁ × M₂) where
  carrier := {x | D.ψ₁ (1 ⊗ₜ x.1) = D.ψ₂ (1 ⊗ₜ x.2)}
  add_mem' := by
    intro a b ha hb
    simp only [Set.mem_ofPred_eq, Prod.fst_add, Prod.snd_add, TensorProduct.tmul_add, map_add] at *
    rw [ha, hb]
  zero_mem' := by simp
  smul_mem' := by sorry

/-- The two canonical base-change comparison maps. On pure tensors they send
`r ⊗ (m₁,m₂)` to `r • mᵢ`; these are not the additive inclusion of sections into the product. -/
noncomputable def sectionsCompare (D : GlueingDatum R₁ R₂ R₁₂ M₁ M₂ M₁₂) :
    (R₁ ⊗[R] (D.sections (R := R)) →ₗ[R₁] M₁) ×
      (R₂ ⊗[R] (D.sections (R := R)) →ₗ[R₂] M₂) := by
  sorry

/-- Pure tensor computation fixes the canonical comparisons. -/
theorem sectionsCompare_tmul (D : GlueingDatum R₁ R₂ R₁₂ M₁ M₂ M₁₂)
    (x : D.sections (R := R)) (r₁ : R₁) (r₂ : R₂) :
    (D.sectionsCompare (R := R)).1 (r₁ ⊗ₜ[R] x) = r₁ • x.val.1 ∧
      (D.sectionsCompare (R := R)).2 (r₂ ⊗ₜ[R] x) = r₂ • x.val.2 := by
  sorry

end GlueingDatum

variable {R R₁ R₂ R₁₂}

/-- `GlueingDatum.can`: the glueing datum `Can(N) = (N ⊗ R₁, N ⊗ R₂, N ⊗ R₁₂, can, can)` of an
`R`-module `N`. -/
noncomputable def GlueingDatum.can (N : Type u) [AddCommGroup N] [Module R N] :
    GlueingDatum R₁ R₂ R₁₂ (R₁ ⊗[R] N) (R₂ ⊗[R] N) (R₁₂ ⊗[R] N) where
  ψ₁ := TensorProduct.AlgebraTensorModule.cancelBaseChange R R₁ R₁₂ R₁₂ N
  ψ₂ := TensorProduct.AlgebraTensorModule.cancelBaseChange R R₂ R₁₂ R₁₂ N

/-- The unit `N → sections(Can N)`, `n ↦ (1 ⊗ n, 1 ⊗ n)`. -/
noncomputable def GlueingDatum.canUnit (N : Type u) [AddCommGroup N] [Module R N] :
    N →ₗ[R] (GlueingDatum.can (R := R) (R₁ := R₁) (R₂ := R₂) (R₁₂ := R₁₂) N).sections (R := R) where
  toFun n := ⟨((1 : R₁) ⊗ₜ n, (1 : R₂) ⊗ₜ n), by sorry⟩
  map_add' := by sorry
  map_smul' := by sorry

/-- `GlueingDatum.sections_can_of_flat`: for a flat `R`-module `N` over an exact square, the unit
`N → sections(Can N)` is bijective (tensor the exact square with `N`). -/
theorem GlueingDatum.sections_can_of_flat (h : ExactSquare R R₁ R₂ R₁₂) (N : Type u)
    [AddCommGroup N] [Module R N] [Module.Flat R N] :
    Function.Bijective (GlueingDatum.canUnit (R := R) (R₁ := R₁) (R₂ := R₂) (R₁₂ := R₁₂) N) := by
  sorry

/-- `ExactSquare.zariski`: for `f, g` generating the unit ideal, `R → R_f, R_g → R_fg` is an exact
square (stated for the concrete localizations). -/
theorem ExactSquare.zariski {A : Type u} [CommRing A] (f g : A) (hfg : Ideal.span {f, g} = ⊤)
    [Algebra (Localization.Away f) (Localization.Away (f * g))]
    [Algebra (Localization.Away g) (Localization.Away (f * g))]
    [IsScalarTower A (Localization.Away f) (Localization.Away (f * g))]
    [IsScalarTower A (Localization.Away g) (Localization.Away (f * g))] :
    ExactSquare A (Localization.Away f) (Localization.Away g) (Localization.Away (f * g)) := by
  sorry

/-- `ExactSquare.not_exact_double_localization` (non-example): for `k[x]` and the square whose three
other corners are all `k[x, 1/x]`, the kernel of the difference is the diagonal `k[x, 1/x]`, which is
not the image of `k[x]`; so the square is not exact. -/
example (k : Type u) [Field k] :
    ¬ ExactSquare (Polynomial k) (Localization.Away (Polynomial.X : Polynomial k))
      (Localization.Away (Polynomial.X : Polynomial k))
      (Localization.Away (Polynomial.X : Polynomial k)) := by
  sorry

/-- `GlueingDatum.sections_identitySquare` (degenerate): for the identity square and the datum
`(M, M, M, id, id)` the module of sections is the diagonal. -/
example (A M : Type u) [CommRing A] [AddCommGroup M] [Module A M] (x : M × M) :
    x ∈ (⟨TensorProduct.lid A M, TensorProduct.lid A M⟩ : GlueingDatum A A A M M M).sections (R := A) ↔
      x.1 = x.2 := by
  sorry

/-- `ExactSquare.zariski_sections_can` (compatibility): for the Zariski square of `D(f), D(g)` and any
`A`-module `N`, the unit `N → sections(Can N)` is bijective (quasicoherent gluing on `Spec A`). -/
example {A : Type u} [CommRing A] (f g : A) (hfg : Ideal.span {f, g} = ⊤)
    [Algebra (Localization.Away f) (Localization.Away (f * g))]
    [Algebra (Localization.Away g) (Localization.Away (f * g))]
    [IsScalarTower A (Localization.Away f) (Localization.Away (f * g))]
    [IsScalarTower A (Localization.Away g) (Localization.Away (f * g))]
    (N : Type u) [AddCommGroup N] [Module A N] :
    Function.Bijective (GlueingDatum.canUnit (R := A) (R₁ := Localization.Away f)
      (R₂ := Localization.Away g) (R₁₂ := Localization.Away (f * g)) N) := by
  sorry

/-- The universal comparison-surjectivity hypothesis in Kedlaya–Liu 1.3.9.
It quantifies over every finite projective datum and over the tensor comparison map. -/
def ExactSquare.FiniteProjectiveSurjective : Prop :=
  ∀ (N₁ N₂ N₁₂ : Type u) [AddCommGroup N₁] [Module R₁ N₁] [Module R N₁]
    [IsScalarTower R R₁ N₁] [AddCommGroup N₂] [Module R₂ N₂] [Module R N₂]
    [IsScalarTower R R₂ N₂] [AddCommGroup N₁₂] [Module R₁₂ N₁₂]
    [Module.Finite R₁ N₁] [Module.Projective R₁ N₁]
    [Module.Finite R₂ N₂] [Module.Projective R₂ N₂]
    (D : GlueingDatum R₁ R₂ R₁₂ N₁ N₂ N₁₂),
    Function.Surjective (D.sectionsCompare (R := R)).1

/-- **Finite projective glueing** (Kedlaya–Liu 1.3.9): the actual sections module
is finite projective and its canonical comparison maps are bijective. Compatibility with the
transition maps is built into sections and the canonical comparisons. -/
theorem finiteProjective_glueing_effective (h : ExactSquare R R₁ R₂ R₁₂)
    (hsurj : ExactSquare.FiniteProjectiveSurjective (R := R) (R₁ := R₁) (R₂ := R₂) (R₁₂ := R₁₂))
    (hmax : ∀ m : Ideal R, m.IsMaximal →
      (∃ p : Ideal R₁, p.IsPrime ∧ p.comap (algebraMap R R₁) = m) ∨
      (∃ p : Ideal R₂, p.IsPrime ∧ p.comap (algebraMap R R₂) = m))
    (N₁ N₂ N₁₂ : Type u) [AddCommGroup N₁] [Module R₁ N₁] [Module R N₁]
    [IsScalarTower R R₁ N₁] [AddCommGroup N₂] [Module R₂ N₂] [Module R N₂]
    [IsScalarTower R R₂ N₂] [AddCommGroup N₁₂] [Module R₁₂ N₁₂]
    [Module.Finite R₁ N₁] [Module.Projective R₁ N₁]
    [Module.Finite R₂ N₂] [Module.Projective R₂ N₂]
    (D : GlueingDatum R₁ R₂ R₁₂ N₁ N₂ N₁₂) :
    Module.Finite R (D.sections (R := R)) ∧ Module.Projective R (D.sections (R := R)) ∧
      Function.Bijective (D.sectionsCompare (R := R)).1 ∧
      Function.Bijective (D.sectionsCompare (R := R)).2 := by
  sorry

/-- **Finite étale glueing** (Kedlaya–Liu 1.3.10). The same universal surjectivity
and maximal-ideal hypotheses are necessary. The recovered algebra isomorphisms must induce
the supplied transition `e` on every `m : A`. -/
theorem finiteEtale_glueing (h : ExactSquare R R₁ R₂ R₁₂)
    (hsurj : ExactSquare.FiniteProjectiveSurjective (R := R) (R₁ := R₁) (R₂ := R₂) (R₁₂ := R₁₂))
    (hmax : ∀ m : Ideal R, m.IsMaximal →
      (∃ p : Ideal R₁, p.IsPrime ∧ p.comap (algebraMap R R₁) = m) ∨
      (∃ p : Ideal R₂, p.IsPrime ∧ p.comap (algebraMap R R₂) = m))
    (A₁ A₂ : Type u) [CommRing A₁] [Algebra R₁ A₁] [Module.Finite R₁ A₁] [Algebra.Etale R₁ A₁]
    [CommRing A₂] [Algebra R₂ A₂] [Module.Finite R₂ A₂] [Algebra.Etale R₂ A₂]
    (e : R₁₂ ⊗[R₁] A₁ ≃ₐ[R₁₂] R₁₂ ⊗[R₂] A₂) :
    ∃ (A : Type u) (_ : CommRing A) (_ : Algebra R A), Module.Finite R A ∧ Algebra.Etale R A ∧
      ∃ (e₁ : R₁ ⊗[R] A ≃ₐ[R₁] A₁) (e₂ : R₂ ⊗[R] A ≃ₐ[R₂] A₂),
        ∀ m : A, e (1 ⊗ₜ[R₁] e₁ (1 ⊗ₜ[R] m)) = 1 ⊗ₜ[R₂] e₂ (1 ⊗ₜ[R] m) := by
  sorry

end ExactSquare

/-! ## RF4:vector-bundles — glueing pairs and the Beauville–Laszlo theorem (Stacks 15.92) -/

section GlueingPair

variable {R : Type u} [CommRing R]

/-- The `f`-power torsion `M[f^∞]`. -/
def fPowerTorsion (f : R) (M : Type u) [AddCommGroup M] [Module R M] : Set M :=
  {m | ∃ n : ℕ, f ^ n • m = 0}

/-- **Glueing pair** (Stacks, Section 15.92): `R → R'` induces `R/fⁿ ≅ R'/fⁿ` for all `n`, and
`R[f^∞] → R'[f^∞]` is bijective; equivalently `0 → R → R' ⊕ R_f → R'_f → 0` is exact
(`GlueingPair.iff_torsion_bijective`). -/
structure GlueingPair (R' : Type u) [CommRing R'] [Algebra R R'] (f : R) : Prop where
  /-- `R/fⁿ → R'/fⁿ` is surjective. -/
  quotient_surjective : ∀ n : ℕ, ∀ y : R', ∃ x : R,
    y - algebraMap R R' x ∈ Ideal.span {algebraMap R R' f ^ n}
  /-- `R/fⁿ → R'/fⁿ` is injective. -/
  quotient_injective : ∀ n : ℕ,
    (Ideal.span {algebraMap R R' f ^ n}).comap (algebraMap R R') = Ideal.span {f ^ n}
  /-- `R[f^∞] → R'[f^∞]` is bijective. -/
  torsion_bijOn : Set.BijOn (algebraMap R R') (fPowerTorsion f R)
    (fPowerTorsion (algebraMap R R' f) R')

namespace GlueingPair

variable {R' : Type u} [CommRing R'] [Algebra R R'] {f : R}

/-- The defining torsion criterion, under the required quotient isomorphisms. -/
theorem iff_torsion_bijective
    (hq : ∀ n : ℕ, ∀ y : R', ∃ x : R,
      y - algebraMap R R' x ∈ Ideal.span {algebraMap R R' f ^ n})
    (hi : ∀ n : ℕ,
      (Ideal.span {algebraMap R R' f ^ n}).comap (algebraMap R R') = Ideal.span {f ^ n}) :
    GlueingPair R' f ↔ Set.BijOn (algebraMap R R') (fPowerTorsion f R)
      (fPowerTorsion (algebraMap R R' f) R') := by
  sorry

/-- `GlueingPair.iff_exact` (Stacks 15.92.6): given the quotient isomorphisms, the
glueing-pair condition is the exactness of `0 → R → R' ⊕ R_f → R'_f → 0`. -/
theorem iff_exact
    (hq : ∀ n : ℕ, ∀ y : R', ∃ x : R, y - algebraMap R R' x ∈ Ideal.span {algebraMap R R' f ^ n})
    (hi : ∀ n : ℕ,
      (Ideal.span {algebraMap R R' f ^ n}).comap (algebraMap R R') = Ideal.span {f ^ n}) :
    GlueingPair R' f ↔
      (Function.Injective fun r : R =>
          (algebraMap R R' r, algebraMap R (Localization.Away f) r)) ∧
        ∀ (a : R') (b : Localization.Away f),
          algebraMap R' (Localization.Away (algebraMap R R' f)) a =
              Localization.awayMap (algebraMap R R') f b →
            ∃ r : R, algebraMap R R' r = a ∧ algebraMap R (Localization.Away f) r = b := by
  sorry

/-- `GlueingPair.of_nonZeroDivisor` (Stacks 15.92.7): a nonzerodivisor gives a glueing pair with
the `f`-adic completion. -/
theorem of_nonZeroDivisor (hf : f ∈ nonZeroDivisors R) :
    GlueingPair (AdicCompletion (Ideal.span {f}) R) f := by
  sorry

/-- `GlueingPair.of_flat` (Stacks 15.92.8): if the completion is flat, `(R, f)` is a glueing pair. -/
theorem of_flat (hflat : Module.Flat R (AdicCompletion (Ideal.span {f}) R)) :
    GlueingPair (AdicCompletion (Ideal.span {f}) R) f := by
  sorry

/-- `GlueingPair.quotient_equiv`: `R/fⁿ ≅ R'/fⁿ` for a glueing pair.
The completion special case is Stacks 15.92.1. -/
theorem quotient_equiv (h : GlueingPair R' f) (n : ℕ) :
    Function.Bijective (Ideal.quotientMap (Ideal.span {algebraMap R R' f ^ n}) (algebraMap R R')
      (by rw [h.quotient_injective n])) := by
  sorry

/-- `GlueingPair.toExactSquare`: a glueing pair is an exact square `R → R', R_f → R'_f`. -/
theorem toExactSquare (h : GlueingPair R' f)
    [Algebra (Localization.Away f) (Localization.Away (algebraMap R R' f))]
    [Algebra R (Localization.Away (algebraMap R R' f))]
    [IsScalarTower R R' (Localization.Away (algebraMap R R' f))]
    [IsScalarTower R (Localization.Away f) (Localization.Away (algebraMap R R' f))] :
    ExactSquare R R' (Localization.Away f) (Localization.Away (algebraMap R R' f)) := by
  sorry

/-- `GlueingPair.spec_surjective` (Stacks 15.92.3): every prime of `R` comes from `R'` or `R_f`. -/
theorem spec_surjective (h : GlueingPair R' f) (p : Ideal R) (hp : p.IsPrime) :
    (∃ q : Ideal R', q.IsPrime ∧ q.comap (algebraMap R R') = p) ∨ f ∉ p := by
  sorry

end GlueingPair

/-- `Glueable` (Stacks 15.92.10): `0 → M → (M ⊗ R') ⊕ M_f → M ⊗ R'_f → 0` is exact; by
`Glueable.iff_torsion` this is the injectivity of `M[f^∞] → (M ⊗ R')[f^∞]` for a glueing pair. -/
def Glueable (R' : Type u) [CommRing R'] [Algebra R R'] (f : R) (M : Type u) [AddCommGroup M]
    [Module R M] : Prop :=
  Set.InjOn (fun m : M => (1 : R') ⊗ₜ[R] m) (fPowerTorsion f M) ∧
    Set.SurjOn (fun m : M => (1 : R') ⊗ₜ[R] m) (fPowerTorsion f M)
      (fPowerTorsion (algebraMap R R' f) (R' ⊗[R] M))

/-- `Glueable.iff_torsion` (Stacks 15.92.10): for a glueing pair, glueability is injectivity on
`f`-power torsion. -/
theorem Glueable.iff_torsion {R' : Type u} [CommRing R'] [Algebra R R'] {f : R}
    (h : GlueingPair R' f) (M : Type u) [AddCommGroup M] [Module R M] :
    Glueable R' f M ↔ Set.InjOn (fun m : M => (1 : R') ⊗ₜ[R] m) (fPowerTorsion f M) := by
  sorry

/-- `Glueable.of_flat` (Stacks 15.92.11): flat modules are glueable. -/
theorem Glueable.of_flat {R' : Type u} [CommRing R'] [Algebra R R'] {f : R}
    (h : GlueingPair R' f) (M : Type u) [AddCommGroup M] [Module R M] [Module.Flat R M] :
    Glueable R' f M := by
  sorry

/-- `GlueingPair.int_p` (computation): `(ℤ, p)` is a glueing pair with completion `ℤ_p`. -/
example (p : ℕ) [Fact p.Prime] :
    GlueingPair (AdicCompletion (Ideal.span {(p : ℤ)}) ℤ) (p : ℤ) := by
  sorry

/-- `GlueingPair.of_isUnit` (degenerate): for a unit `f` every `R → R'` with `R'/fⁿ = 0`
satisfying the quotient conditions is a glueing pair, and the completion is zero. -/
example (f : R) (hf : IsUnit f) : Subsingleton (AdicCompletion (Ideal.span {f}) R) := by
  sorry

/-- `GlueingPair.noetherian_compat` (compatibility): for noetherian `R`, Mathlib's adic
completion is flat, hence `(R, f)` is a glueing pair and every module is glueable. -/
example [IsNoetherianRing R] (f : R) :
    GlueingPair (AdicCompletion (Ideal.span {f}) R) f := by
  sorry

/- `GlueingPair.not_stacks_example` (non-example, Stacks Example 15.92.9) and
`Glueable.not_smooth_germs` (non-example, Stacks Example 15.92.12) need the rings
`k[f, T₁, T₂, …]/(f T₁, f T₂ − T₁, …)` and germs of smooth functions; they are recorded in the
roadmap document and are not prototyped here. -/

/-- **The Beauville–Laszlo theorem** (`RF4:vector-bundles/beauville-laszlo-module-gluing`),
effectivity for finite projective data (Stacks 15.92.16, 15.92.19; Kedlaya–Liu 1.3.6(b)): a finite
projective `R'`-module, a finite projective `R_f`-module and an identification over `R'_f` come from a
finite projective `R`-module. -/
theorem beauvilleLaszlo_effective {R' : Type u} [CommRing R'] [Algebra R R'] {f : R}
    (h : GlueingPair R' f) (M' M₁ : Type u) [AddCommGroup M'] [Module R' M'] [Module.Finite R' M']
    [Module.Projective R' M'] [AddCommGroup M₁] [Module (Localization.Away f) M₁] [Module R M₁]
    [IsScalarTower R (Localization.Away f) M₁]
    [Module.Finite (Localization.Away f) M₁] [Module.Projective (Localization.Away f) M₁]
    (α : Localization.Away (algebraMap R R' f) ⊗[R'] M' ≃ₗ[Localization.Away (algebraMap R R' f)]
      Localization.Away (algebraMap R R' f) ⊗[R] M₁) :
    ∃ (M : Type u) (_ : AddCommGroup M) (_ : Module R M), Module.Finite R M ∧
      Module.Projective R M ∧
      ∃ (e' : R' ⊗[R] M ≃ₗ[R'] M')
        (e₁ : Localization.Away f ⊗[R] M ≃ₗ[Localization.Away f] M₁),
        ∀ m : M, α (1 ⊗ₜ[R'] e' (1 ⊗ₜ[R] m)) = 1 ⊗ₜ[R] e₁ (1 ⊗ₜ[R] m) := by
  sorry

/-- Beauville–Laszlo, finite projectivity criterion (Stacks 15.92.19; Scholze–Weinstein 5.2.9). -/
theorem beauvilleLaszlo_finiteProjective_iff {R' : Type u} [CommRing R'] [Algebra R R'] {f : R}
    (h : GlueingPair R' f) (M : Type u) [AddCommGroup M] [Module R M] :
    (Module.Finite R M ∧ Module.Projective R M) ↔
      ((Module.Finite R' (R' ⊗[R] M) ∧ Module.Projective R' (R' ⊗[R] M)) ∧
        (Module.Finite (Localization.Away f) (Localization.Away f ⊗[R] M) ∧
          Module.Projective (Localization.Away f) (Localization.Away f ⊗[R] M))) := by
  sorry

/-- Beauville–Laszlo, flatness criterion (Stacks 15.92.18). -/
theorem beauvilleLaszlo_flat_iff {R' : Type u} [CommRing R'] [Algebra R R'] {f : R}
    (h : GlueingPair R' f) (M : Type u) [AddCommGroup M] [Module R M] :
    Module.Flat R M ↔
      (Module.Flat R' (R' ⊗[R] M) ∧ Module.Flat (Localization.Away f) (Localization.Away f ⊗[R] M)) := by
  sorry

/-- The full exact sequence for a flat module over a glueing pair (Stacks 15.92.11).
Specialize to the completion using `GlueingPair.of_nonZeroDivisor` for KL 1.3.6(a).
`L` is the common localization R'[1/f]; all maps and scalar towers are specified explicitly.
The difference map is surjective; every compatible pair comes uniquely from the unit. -/
theorem beauvilleLaszlo_flat_exact {R' : Type u} [CommRing R'] [Algebra R R'] {f : R}
    (h : GlueingPair R' f) (L : Type u) [CommRing L] [Algebra R L] [Algebra R' L]
    [Algebra (Localization.Away f) L] [IsScalarTower R R' L]
    [IsScalarTower R (Localization.Away f) L] [IsLocalization.Away (algebraMap R R' f) L]
    (M : Type u) [AddCommGroup M] [Module R M] [Module.Flat R M] :
    let D := GlueingDatum.can (R := R) (R₁ := R') (R₂ := Localization.Away f) (R₁₂ := L) M
    Function.Bijective (GlueingDatum.canUnit (R := R) (R₁ := R') (R₂ := Localization.Away f)
      (R₁₂ := L) M) ∧ ∀ z, ∃ a b, D.ψ₁ (1 ⊗ₜ a) - D.ψ₂ (1 ⊗ₜ b) = z := by
  sorry

end GlueingPair

/-! ## RF4:vector-bundles — the local form of modifications and lattices

On an affinoid chart `A` around the divisor with local equation `ξ` (a nonzerodivisor), a
modification of a finite projective `A`-module `M'` bounded by `k` is a finite projective submodule
`M` of `M'[1/ξ]` with `ξᵏ M' ⊆ M ⊆ ξ⁻ᵏ M'`; by Beauville–Laszlo these are the lattices in
`M̂'[1/ξ]`. This is the algebraic core of `RF4:vector-bundles/meromorphic-modification-at-a-divisor`. -/

section LocalModification

variable {A : Type u} [CommRing A] (ξ : A)

/-- The `A`-submodules of `Localization.Away ξ ⊗ M'` bounded by `k` around `M'`: the local
modifications of `M'` along `ξ = 0`. -/
def localModificationsBoundedBy (M' : Type u) [AddCommGroup M'] [Module A M'] (k : ℕ) :
    Set (Submodule A (Localization.Away ξ ⊗[A] M')) :=
  {M | Module.Finite A M ∧ Module.Projective A M ∧
       (∀ m : M', (ξ ^ k) • ((1 : Localization.Away ξ) ⊗ₜ[A] m) ∈ M) ∧
       ∀ x ∈ M, ∃ m : M', (ξ ^ k) • x = (1 : Localization.Away ξ) ⊗ₜ[A] m}

/-- `Modification.ideal_inclusion` (computation, local form): the submodule `ξ A` of `A[1/ξ]` is a
modification of `A` bounded by `1` and not by `0`. -/
example (hξ : ξ ∈ nonZeroDivisors A) (hnu : ¬ IsUnit ξ) :
    (Submodule.span A {(algebraMap A (Localization.Away ξ) ξ) ⊗ₜ[A] (1 : A)} ∈
        localModificationsBoundedBy ξ A 1) ∧
      Submodule.span A {(algebraMap A (Localization.Away ξ) ξ) ⊗ₜ[A] (1 : A)} ∉
        localModificationsBoundedBy ξ A 0 := by
  sorry

end LocalModification

/-! ## RF4:vector-bundles — `B_dR` at a geometric point and Mathlib's carriers -/

section BdR

variable (p : ℕ) [Fact p.Prime] (O : Type u) [CommRing O] [Fact ¬ IsUnit (p : O)]
  [IsAdicComplete (Ideal.span {(p : O)}) O]

/- `RelativeBdRPlus.mathlib_compat` / `RelativeBdRPlus.equiv_mathlib`: the ring `R₂ = B^+_dR(A)` of
Kedlaya–Liu 8.9.4 is, in the `p`-typical case, Mathlib's `BDeRhamPlus A⁺ p`, and `R₃ = B_dR(A)` is
`BDeRham A⁺ p`. The Kedlaya–Liu side needs `Proj(P_R)`, which is not in the pinned libraries, so
the comparison is recorded in the CONTRACT block of `relative-period-rings-Be-BdR`; the Mathlib
carriers are `BDeRhamPlus O p` and `BDeRham O p` for `O` as in this section. -/

end BdR

/-! ## RF4:G-torsors — lifting trivialisations over the completed rings (Fargues–Scholze VI.1.7)

The step "triviality of a `G`-torsor over `B⁺` is implied by triviality modulo `I_S`": the
coordinate ring of a torsor under a smooth group is formally smooth over `B⁺`, and `B⁺` is
`I_S`-adically complete, so Mathlib's `Algebra.FormallySmooth.exists_mkₐ_comp_eq_of_isAdicComplete`
lifts a section modulo `I_S`. -/

/-- Baseline check for `v-descent-and-local-triviality`, lifting step: the pinned Mathlib lemma in the
form the proof uses (not a unit test of a new definition). -/
example {B T : Type u} [CommRing B] [CommRing T] [Algebra B T] [Algebra.FormallySmooth B T]
    (I : Ideal B) [IsAdicComplete I B] (s : T →ₐ[B] B ⧸ I) :
    ∃ s' : T →ₐ[B] B, (Ideal.Quotient.mkₐ B I).comp s' = s :=
  Algebra.FormallySmooth.exists_mkₐ_comp_eq_of_isAdicComplete s

/-- Baseline check: an `I`-adically complete ring is henselian along `I` (Mathlib instance), the
hypothesis of Gabber–Ramero 5.4.21. -/
example {B : Type u} [CommRing B] (I : Ideal B) [IsAdicComplete I B] : HenselianRing B I :=
  inferInstance

/-! ## Mathematical contracts and outstanding prototypes

The following full contracts record every packet name. They are prose specifications, not
native lemma signatures or elaborated examples. Missing relative-curve, completed-divisor,
representation-category and G-bundle carriers prevent the geometric signatures. The native
algebra API also remains incomplete (morphisms/adjunction/tensor/base change and concrete
non-examples); the packet review records this explicitly. No contract is counted as a
formalized declaration or as a Lean example checked by the compiler.
-/

/- CONTRACT `RelativeFarguesFontaine:RF4:vector-bundles/glueing-datum-over-exact-square` (definition).
  Statement:
    An exact square of commutative rings is a commuting square R -> R_1, R -> R_2, R_1 -> R_12, R_2
    -> R_12 such that the sequence of R-modules 0 -> R -> R_1 (+) R_2 -> R_12 -> 0, whose last arrow
    is the difference (r_1, r_2) |-> r_1 - r_2 of the two maps, is exact. A glueing datum over it is
    a triple of modules M_1, M_2, M_12 over R_1, R_2, R_12 with isomorphisms psi_1 : M_1 (x)_{R_1}
    R_12 = M_12 and psi_2 : M_2 (x)_{R_2} R_12 = M_12; a morphism of glueing data is a triple of
    linear maps commuting with psi_1 and psi_2. The datum is finite, resp. finite projective, when
    M_1, M_2, M_12 are finite, resp. finite projective, over their rings. Its module of sections is
    M = ker(psi_1 - psi_2 : M_1 (+) M_2 -> M_12), with natural R-linear maps M -> M_i adjoint to M
    (x)_R R_i -> M_i. Every R-module N gives the glueing datum Can(N) = (N (x) R_1, N (x) R_2, N (x)
    R_12, can, can). No topology is involved.
  API ExactSquare (data):
    An exact square: four commutative rings, the four ring maps, commutativity, and exactness of 0
    -> R -> R_1 (+) R_2 -> R_12 -> 0.
  API ExactSquare.exact (characterisation):
    An element of R_1 (+) R_2 lies in the image of R iff its two images in R_12 agree, R -> R_1 (+)
    R_2 is injective, and R_1 (+) R_2 -> R_12 is surjective.
  API GlueingDatum (constructor):
    A glueing datum (M_1, M_2, M_12, psi_1, psi_2) over an exact square, with morphisms the
    compatible triples of linear maps.
  API GlueingDatum.sections (data):
    The module of sections M = ker(psi_1 - psi_2 : M_1 (+) M_2 -> M_12), an R-module, functorial in
    the datum.
  API GlueingDatum.sectionsCompare (projection):
    The natural maps M (x)_R R_i -> M_i (i = 1, 2), compatible with psi_1, psi_2 after base change
    to R_12.
  API GlueingDatum.can (functoriality):
    The functor Can : R-modules -> glueing data, N |-> (N (x) R_1, N (x) R_2, N (x) R_12, can, can),
    with map_id and map_comp.
  API GlueingDatum.can_sections_adjunction (universal-property):
    Hom_R(N, sections(D)) = Hom(Can(N), D) naturally in N and D.
  API GlueingDatum.sections_can_of_flat (characterisation):
    For a flat R-module N the unit N -> sections(Can N) is an isomorphism.
  API GlueingDatum.tensor (structure):
    Tensor product and dual of finite projective glueing data, componentwise, with sections(Can N
    (x) Can N') compatible with N (x) N' for finite projective N, N'.
  API GlueingDatum.baseChange (functoriality):
    For a map of exact squares (R -> R_1, R_2 -> R_12) -> (R' -> R'_1, R'_2 -> R'_12), base change
    of glueing data, compatible with Can.
  API ExactSquare.ofGlueingSquare (compatibility):
    Every glueing square of complete Tate rings (AdicSpacesPartII:R3/glueing-square) is an exact
    square, its finite glueing data are glueing data here, and its module of sections is the module
    of sections here.
  API ExactSquare.zariski (example):
    For f, g in R generating the unit ideal, R -> R_f, R_g -> R_fg is an exact square.
  example GlueingDatum.sections_zariski_Z (computation), mathematical contract only:
    For R = Z, f = 2, g = 3, the glueing datum (Z[1/2], Z[1/3], Z[1/6], id, multiplication by 3) has
    module of sections {(k, k/3) : k in Z}, free of rank one with generator (1, 1/3).
  example GlueingDatum.sections_identitySquare (degenerate), mathematical contract only:
    For the identity square R = R_1 = R_2 = R_12 and a datum (M, M, M, id, id), the module of
    sections is the diagonal, isomorphic to M.
  example ExactSquare.zariski_sections_can (compatibility), mathematical contract only:
    For the Zariski square of D(f), D(g) with (f, g) = R and any R-module N, sections(Can N) = N;
    this is gluing of quasicoherent sheaves on Spec R = D(f) u D(g).
  example ExactSquare.not_exact_double_localization (non-example), mathematical contract only:
    For R = k[x] and R_1 = R_2 = R_12 = k[x, 1/x], the square is not exact: the kernel of the
    difference is the diagonal k[x, 1/x], and sections(Can R) = k[x, 1/x] is not R.
-/

/- CONTRACT `RelativeFarguesFontaine:RF4:vector-bundles/finite-projective-glueing-over-exact-square` (theorem).
  Statement:
    Let R -> R_1, R_2 -> R_12 be an exact square. (i) For a finite glueing datum with module of
    sections M such that M (x)_R R_1 -> M_1 is surjective: psi_1 - psi_2 : M_1 (+) M_2 -> M_12 is
    surjective, M (x)_R R_2 -> M_2 is surjective, and a finitely generated submodule M_0 of M
    already surjects onto M_1 and M_2. (ii) Suppose M (x)_R R_1 -> M_1 is surjective for every
    finite projective glueing datum. Then for every finite projective glueing datum M is finitely
    presented and M (x)_R R_i -> M_i is bijective for i = 1, 2. (iii) If moreover the image of
    Spec(R_1 (+) R_2) -> Spec(R) contains every maximal ideal, M is finite projective; hence Can is
    an equivalence from finite projective R-modules to finite projective glueing data, with quasi-
    inverse the module of sections.
-/

/- CONTRACT `RelativeFarguesFontaine:RF4:vector-bundles/finite-etale-glueing-over-exact-square` (theorem).
  Statement:
    Under the hypotheses of RF4:vector-bundles/finite-projective-glueing-over-exact-square (iii),
    the base change functor FEt(R) -> FEt(R_1) x_{FEt(R_12)} FEt(R_2) from finite etale R-algebras
    to compatible pairs of finite etale algebras is an equivalence of categories.
-/

/- CONTRACT `RelativeFarguesFontaine:RF4:vector-bundles/glueing-pair` (definition).
  Statement:
    Let R be a ring, f in R, and R -> R' a ring map inducing isomorphisms R/f^n R = R'/f^n R' for
    all n >= 1 (for example R' = R-hat = lim R/f^n R). (R -> R', f) is a glueing pair if 0 -> R ->
    R' (+) R_f -> R'_f -> 0 (last arrow the difference) is exact; equivalently R[f^oo] -> R'[f^oo]
    is bijective, where M[f^oo] is the f-power torsion. (R, f) is a glueing pair if (R -> R-hat, f)
    is one. An R-module M is glueable for (R -> R', f) if 0 -> M -> (M (x)_R R') (+) M_f -> M (x)_R
    R'_f -> 0 is exact, equivalently M[f^oo] -> (M (x)_R R')[f^oo] is bijective. A glueing pair is
    in particular an exact square R -> R', R_f -> R'_f.
  API GlueingPair (data):
    A ring map R -> R' and f in R with R/f^n = R'/f^n for all n and the exact sequence 0 -> R -> R'
    (+) R_f -> R'_f -> 0.
  API GlueingPair.iff_torsion_bijective (characterisation):
    Assuming the ring map induces R/f^n R = R'/f^n R' for all positive n, (R -> R', f) is a glueing
    pair iff R[f^oo] -> R'[f^oo] is bijective (Stacks 15.92.6).
  API GlueingPair.of_nonZeroDivisor (constructor):
    If f is a nonzerodivisor of R then (R -> R-hat, f) is a glueing pair (Stacks 15.92.7).
  API GlueingPair.of_flat (constructor):
    If R -> R-hat is flat (for example R noetherian) then (R, f) is a glueing pair (Stacks 15.92.8).
  API GlueingPair.toExactSquare (coercion):
    A glueing pair is an exact square R -> R', R_f -> R'_f (RF4:vector-bundles/glueing-datum-over-
    exact-square).
  API GlueingPair.quotient_equiv (simp):
    For a glueing pair (R -> R',f), the canonical map R/f^n R -> R'/f^n R' is an isomorphism for
    every n. In the completion case R'=R-hat these quotient isomorphisms hold without assuming the
    pair condition (Stacks 15.92.1).
  API GlueingPair.spec_surjective (other):
    Spec(R') u Spec(R_f) -> Spec(R) is surjective (Stacks 15.92.3), the maximal-ideal condition of
    the exact-square glueing theorem.
  API Glueable (data):
    The predicate: 0 -> M -> (M (x) R') (+) M_f -> M (x) R'_f -> 0 is exact.
  API Glueable.iff_torsion (characterisation):
    For a glueing pair, M is glueable iff M[f^oo] -> (M (x) R')[f^oo] is injective (Stacks
    15.92.10).
  API Glueable.of_flat (constructor):
    Flat R-modules are glueable (Stacks 15.92.11).
  example GlueingPair.int_p (computation), mathematical contract only:
    For R = Z and f = p, R-hat = Z_p and 0 -> Z -> Z_p (+) Z[1/p] -> Q_p -> 0 is exact; (Z, p) is a
    glueing pair.
  example GlueingPair.of_isUnit (degenerate), mathematical contract only:
    If f is a unit then R-hat = 0, R_f = R, the sequence is 0 -> R -> R -> 0 -> 0, every module is
    glueable and glueing data are R-modules.
  example GlueingPair.noetherian_compat (compatibility), mathematical contract only:
    For R noetherian, Mathlib's AdicCompletion (Ideal.span {f}) R is flat over R, so (R, f) is a
    glueing pair and every R-module is glueable (Stacks 15.92.8, 15.92.11).
  example GlueingPair.not_stacks_example (non-example), mathematical contract only:
    For R = k[f, T_1, T_2, ...]/(f T_1, f T_2 - T_1, f T_3 - T_2, ...), (R, f) is not a glueing
    pair: T_1 is f-power torsion and nonzero in R but its image in R-hat is f-divisible, hence zero
    (Stacks Example 15.92.9).
  example Glueable.not_smooth_germs (non-example), mathematical contract only:
    For R the germs of smooth functions at 0 on the real line and f = x, the module R/phi R with phi
    = exp(-1/x^2) is not glueable although f is a nonzerodivisor (Stacks Example 15.92.12).
-/

/- CONTRACT `RelativeFarguesFontaine:RF4:vector-bundles/beauville-laszlo-module-gluing` (theorem).
  Statement:
    Let (R -> R', f) be a glueing pair (for instance R' = R-hat, the f-adic completion, with f a
    nonzerodivisor of R). (a) The functor Can : M |-> (M (x)_R R', M_f, can) is an equivalence from
    the category of R-modules glueable for (R -> R', f) to the category of glueing data (M', M_1,
    alpha_1 : (M')_f = M_1 (x)_R R'), with quasi-inverse the module of sections. In particular
    (Scholze-Weinstein 5.2.9) for f a nonzerodivisor, R-modules M on which f is a nonzerodivisor are
    equivalent to triples (M_{R-hat}, M_{R[1/f]}, beta) with f a nonzerodivisor on the R-hat-module
    M_{R-hat} and beta : M_{R-hat}[1/f] = M_{R[1/f]} (x)_R R-hat. (b) An R-module M is flat, resp.
    finite projective, iff M (x)_R R' and M_f are flat, resp. finite projective; hence every finite
    projective glueing datum is Can of a finite projective R-module, unique up to unique
    isomorphism, and R -> R' x R_f is an effective descent morphism for finite projective modules.
    (c) For a flat M the sequence 0 -> M -> (M (x)_R R_f) (+) (M (x)_R R-hat) -> M (x)_R R-hat_f ->
    0 is exact. The statement is not a case of fpqc descent: R -> R-hat need not be flat when R is
    not noetherian, and no descent datum over R-hat (x)_R R-hat is part of the data.
-/

/- CONTRACT `RelativeFarguesFontaine:RF4:vector-bundles/modification-of-vector-bundles` (definition).
  Statement:
    Conventions of this layer: E is a nonarchimedean local field with residue field F_q and
    uniformizer pi; S = Spa(R, R^+) is an affinoid perfectoid space over F_q with pseudouniformizer
    varpi; Y-curly_S = Spa W_{O_E}(R^+) minus V([varpi]), Y_S = Y-curly_S minus V(pi) and X_S = Y_S
    / phi^Z (RF0, RF1). For a map S -> Div^d_(-) the associated closed Cartier divisor D = D_S of
    Y-curly_S, Y_S or X_S has invertible ideal sheaf I_D (RF2:integral-divisors); when D is affinoid
    (always locally on S) B^+_D(S) denotes the global sections of the I_D-adic completion of the
    structure sheaf along D and B_D(S) = B^+_D(S)[1/I_D] (FS's B^+_{Div^d}(S), B_{Div^d}(S); B^+_dR,
    B_dR when d = 1). Let X-cal be one of Y-curly_S, Y_S, X_S and D a closed Cartier divisor of
    X-cal attached to a map S -> Div^d_(-), with ideal sheaf I_D and E(kD) = E (x) I_D^(-k). For
    vector bundles E, E' on X-cal, a modification of E' at D is a pair (E, beta) with beta :
    E|_{X-cal minus D} = E'|_{X-cal minus D} an isomorphism of vector bundles on the open complement
    which is meromorphic along D: locally on S and X-cal there is some k >= 0 such that beta extends
    to a morphism E -> E'(kD) and beta^(-1) extends to a morphism E' -> E(kD) (through the
    inclusions E' -> E'(kD), E -> E(kD)). Such a k is a bound of the modification. A morphism (E_1,
    beta_1) -> (E_2, beta_2) is an isomorphism E_1 -> E_2 whose restriction off D is beta_2^(-1)
    beta_1; modifications of E' at D form a groupoid Mod_D(E').
  API Modification (data):
    A modification of E' at D: a vector bundle E with an isomorphism beta : E|_{X minus D} = E'|_{X
    minus D} meromorphic along D in both directions.
  API Modification.extend (projection):
    For a bound k, the unique morphism E -> E'(kD) extending beta, and E' -> E(kD) extending
    beta^(-1).
  API Modification.refl (constructor):
    (E', id) is a modification of E' at D with bound 0.
  API Modification.symm (constructor):
    (E', beta^(-1)) is a modification of E at D with the same bound.
  API Modification.trans (constructor):
    Modifications bounded by k and l compose to one bounded by k + l.
  API Modification.tensor (structure):
    The tensor product of modifications of E'_1 and E'_2 bounded by k and l is a modification of
    E'_1 (x) E'_2 bounded by k + l; the dual of a modification bounded by k is bounded by k.
  API Modification.pullback (functoriality):
    For T -> S, pullback of (E, beta) along X-cal_T -> X-cal_S is a modification at D_T; pullback
    along the identity is the identity and pullbacks compose.
  API Modification.ext (extensionality):
    Two morphisms of modifications are equal iff they agree off D; (E_1, beta_1) and (E_2, beta_2)
    are isomorphic iff beta_2^(-1) beta_1 extends to an isomorphism E_1 = E_2.
  API Modification.ofSubbundle (constructor):
    An injective morphism E -> E' that is an isomorphism off D and whose image contains E'(-kD)
    defines a modification bounded by k.
  example Modification.ideal_inclusion (computation), mathematical contract only:
    For D nonempty, the inclusion I_D = O(-D) -> O_X-cal restricts to an isomorphism off D and is a
    modification of O at D bounded by 1, not bounded by 0.
  example Modification.empty_divisor (degenerate), mathematical contract only:
    For d = 0 (D empty) a modification of E' at D is an isomorphism E = E', and every bound works.
  example Modification.ff_absolute (compatibility), mathematical contract only:
    For S = Spa(C^flat) a geometric point and D = infinity on X_FF, modifications of E' at D are
    exactly Fargues-Fontaine's modifications of E' supported at {infinity} (5.6.4.2): bundles E with
    E|_{X minus infinity} = E'|_{X minus infinity}.
  example Modification.not_iso_off_D (non-example), mathematical contract only:
    For a second degree-one divisor D' disjoint from D, the inclusion O -> O(D') is not a
    modification of O(D') at D: it is not an isomorphism on X-cal minus D.
-/

/- CONTRACT `RelativeFarguesFontaine:RF4:vector-bundles/meromorphic-modification-at-a-divisor` (theorem).
  Statement:
    Conventions of this layer: E is a nonarchimedean local field with residue field F_q and
    uniformizer pi; S = Spa(R, R^+) is an affinoid perfectoid space over F_q with pseudouniformizer
    varpi; Y-curly_S = Spa W_{O_E}(R^+) minus V([varpi]), Y_S = Y-curly_S minus V(pi) and X_S = Y_S
    / phi^Z (RF0, RF1). For a map S -> Div^d_(-) the associated closed Cartier divisor D = D_S of
    Y-curly_S, Y_S or X_S has invertible ideal sheaf I_D (RF2:integral-divisors); when D is affinoid
    (always locally on S) B^+_D(S) denotes the global sections of the I_D-adic completion of the
    structure sheaf along D and B_D(S) = B^+_D(S)[1/I_D] (FS's B^+_{Div^d}(S), B_{Div^d}(S); B^+_dR,
    B_dR when d = 1). Let X-cal be Y-curly_S, Y_S or X_S, D the divisor of a map S -> Div^d_(-),
    assumed affinoid, and E' a vector bundle on X-cal with completion E'-hat_D = Gamma(D, completion
    of E' along D), a finite projective B^+_D(S)-module. Then (E, beta) |-> Xi(E, beta) :=
    beta(E-hat_D) is an equivalence from the groupoid Mod_D(E') of modifications of E' at D to the
    set of B^+_D(S)-lattices in E'-hat_D[1/I_D], i.e. finite projective B^+_D(S)-submodules Xi with
    Xi[1/I_D] = E'-hat_D[1/I_D]. A modification is bounded by k iff I_D^k E'-hat_D is contained in
    Xi and Xi in I_D^(-k) E'-hat_D. In particular the restriction E'|_{X-cal minus D} of this
    globally given reference bundle, a vector bundle on the formal neighbourhood (Xi) and an
    isomorphism on the punctured formal neighbourhood (Xi[1/I_D] = E'-hat_D[1/I_D]) determine a
    vector bundle on X-cal, and this fixed-reference gluing functor is fully faithful and
    essentially surjective. This does not assert effectivity for an arbitrary bundle given only off
    D; that stage target is recorded separately as a gap. Locally: on each sheafy affinoid chart U =
    Spa(A, A^+) meeting D on which I_D = xi A, the ring of completion along D intersect U is the xi-
    adic completion of A and the statement is RF4:vector-bundles/beauville-laszlo-module-gluing for
    the glueing pair (A, xi) combined with finite projective A-modules = vector bundles on U.
-/

/- CONTRACT `RelativeFarguesFontaine:RF4:vector-bundles/gluing-exactness-tensor-and-base-change` (theorem).
  Statement:
    Conventions of this layer: E is a nonarchimedean local field with residue field F_q and
    uniformizer pi; S = Spa(R, R^+) is an affinoid perfectoid space over F_q with pseudouniformizer
    varpi; Y-curly_S = Spa W_{O_E}(R^+) minus V([varpi]), Y_S = Y-curly_S minus V(pi) and X_S = Y_S
    / phi^Z (RF0, RF1). For a map S -> Div^d_(-) the associated closed Cartier divisor D = D_S of
    Y-curly_S, Y_S or X_S has invertible ideal sheaf I_D (RF2:integral-divisors); when D is affinoid
    (always locally on S) B^+_D(S) denotes the global sections of the I_D-adic completion of the
    structure sheaf along D and B_D(S) = B^+_D(S)[1/I_D] (FS's B^+_{Div^d}(S), B_{Div^d}(S); B^+_dR,
    B_dR when d = 1). In the setting of RF4:vector-bundles/meromorphic-modification-at-a-divisor:
    (a) the lattice functor commutes with tensor products, duals and internal Hom: Xi(E_1 (x) E_2) =
    Xi(E_1) (x) Xi(E_2) inside (E'_1 (x) E'_2)-hat_D[1/I_D] and Xi(E^dual) = Xi(E)^dual; (b) it is
    exact: a sequence of modifications 0 -> E_1 -> E -> E_2 -> 0 of a short exact sequence 0 -> E'_1
    -> E' -> E'_2 -> 0 is exact iff the sequence of lattices 0 -> Xi_1 -> Xi -> Xi_2 -> 0 is exact,
    and every exact sequence of lattices compatible with the completed sequence of the E' glues to
    an exact sequence of vector bundles; (c) it commutes with base change: for a map T -> S of
    affinoid perfectoid spaces with pulled-back divisor D_T, the pullback of (E, beta) corresponds
    to Xi (x)_{B^+_D(S)} B^+_{D_T}(T), compatibly with composition of base changes; (d) on the
    algebraic side, for a map of glueing pairs (R, f) -> (R_2, f_2) (a ring map with f |-> f_2 up to
    a unit), Can and the module of sections commute with base change of finite projective glueing
    data (coefficient change).
-/

/- CONTRACT `RelativeFarguesFontaine:RF4:vector-bundles/disjoint-and-colliding-legs` (theorem).
  Statement:
    Conventions of this layer: E is a nonarchimedean local field with residue field F_q and
    uniformizer pi; S = Spa(R, R^+) is an affinoid perfectoid space over F_q with pseudouniformizer
    varpi; Y-curly_S = Spa W_{O_E}(R^+) minus V([varpi]), Y_S = Y-curly_S minus V(pi) and X_S = Y_S
    / phi^Z (RF0, RF1). For a map S -> Div^d_(-) the associated closed Cartier divisor D = D_S of
    Y-curly_S, Y_S or X_S has invertible ideal sheaf I_D (RF2:integral-divisors); when D is affinoid
    (always locally on S) B^+_D(S) denotes the global sections of the I_D-adic completion of the
    structure sheaf along D and B_D(S) = B^+_D(S)[1/I_D] (FS's B^+_{Div^d}(S), B_{Div^d}(S); B^+_dR,
    B_dR when d = 1). Let D_1, D_2 be divisors attached to S -> Div^{d_1}_(-), S -> Div^{d_2}_(-)
    and D = D_1 + D_2 the divisor attached to their sum in Div^{d_1 + d_2}, so I_D = I_{D_1}
    I_{D_2}. (a) Disjoint legs: if D_1 and D_2 are disjoint then B^+_D(S) = B^+_{D_1}(S) x
    B^+_{D_2}(S) and B_D(S) = B_{D_1}(S) x B_{D_2}(S); a lattice at D is a pair of lattices, and
    modifications of E' at D are equivalent to pairs consisting of a modification (E_1, beta_1) of
    E' at D_1 and a modification of E_1 at D_2 (iterated gluing, in either order, canonically
    independent of the order). (b) Colliding legs: if D = m D_1 (all legs equal, m >= 1) then I_D =
    I_{D_1}^m, B^+_D(S) = B^+_{D_1}(S) and B_D(S) = B_{D_1}(S), and a modification is bounded by l
    at D iff it is bounded by m*l at D_1. A k-bound at D_1 implies a ceiling(k/m)-bound at D, while
    that bound at D implies only an m*ceiling(k/m)-bound at D_1. When a least global bound k_min
    exists, the least bound at D is ceiling(k_min/m). (c) For a locally finite family (D_n) of
    pairwise disjoint degree-one divisors of Y_S (for instance the Frobenius translates phi^n(D_0),
    n >= 1, on Y_{[0,oo)}), modifications of E' with locally finite support along the union and
    meromorphy bounded on each chart (no single global bound imposed) are equivalent to families of
    lattices (Xi_n) at each D_n.
-/

/- CONTRACT `RelativeFarguesFontaine:RF4:vector-bundles/untilt-divisor-complement-affine` (theorem).
  Statement:
    Kedlaya-Liu Hypotheses 8.7.1 and 8.9.1: a >= 1 an integer and q = p^a; (A, A^+) a perfectoid
    adic Banach algebra over Q_p, X = Spa(A, A^+), and (R, R^+) the perfect uniform adic Banach
    algebra over F_p corresponding to it; P_R = sum_{n >= 0} P_{R,n} the graded ring of
    phi^a-invariants (H^0 of O(n)), Proj(P_R) the schematic relative curve, FF_R -> Proj(P_R) the
    comparison morphism (an equivalence on vector bundles, KL 8.7.7), and Z the image of the
    canonical section Spec(A) -> Proj(P_R) given by the untilt A of R. For S = Spa(R, R^+) over F_q
    and E = W(F_q)[1/p] this is the schematic curve X_S^alg = Proj(P) of RF3 and the degree-one
    divisor of the untilt; L_X denotes the line bundle O(Z) (KL Definition 8.8.18, Convention
    8.9.2). Then (a) the open subscheme Proj(P_R) minus Z is affine; (b) the closed subscheme Z is a
    Cartier divisor contained in an open affine subscheme of Proj(P_R).
-/

/- CONTRACT `RelativeFarguesFontaine:RF4:vector-bundles/relative-period-rings-Be-BdR` (construction).
  Statement:
    Kedlaya-Liu Hypotheses 8.7.1 and 8.9.1: a >= 1 an integer and q = p^a; (A, A^+) a perfectoid
    adic Banach algebra over Q_p, X = Spa(A, A^+), and (R, R^+) the perfect uniform adic Banach
    algebra over F_p corresponding to it; P_R = sum_{n >= 0} P_{R,n} the graded ring of
    phi^a-invariants (H^0 of O(n)), Proj(P_R) the schematic relative curve, FF_R -> Proj(P_R) the
    comparison morphism (an equivalence on vector bundles, KL 8.7.7), and Z the image of the
    canonical section Spec(A) -> Proj(P_R) given by the untilt A of R. For S = Spa(R, R^+) over F_q
    and E = W(F_q)[1/p] this is the schematic curve X_S^alg = Proj(P) of RF3 and the degree-one
    divisor of the untilt; L_X denotes the line bundle O(Z) (KL Definition 8.8.18, Convention
    8.9.2). Define R_1 = B_e(A) by Spec(R_1) = Proj(P_R) minus Z (affine by RF4:vector-
    bundles/untilt-divisor-complement-affine (a)); R_2 = B^+_dR(A) by Spec(R_2) = the completion of
    Proj(P_R) along Z (affine by (b)); and R_3 = B_dR(A) by Spec(R_3) = Spec(R_1) x_{Proj(P_R)}
    Spec(R_2). Then R_2 is the ker(theta)-adic completion of R-tilde^{int,1}_R and R_3 = R_2[1/z]
    for any generator z of ker(theta); R_2 and R_3 are the rings B^+_D(S), B_D(S) of the degree-one
    untilt divisor D of RF2:untilts, and the triple is a relative version of Fontaine's (B_e,
    B^+_dR, B_dR).
  API RelativeBe (data):
    R_1 = B_e(A) = O(Proj(P_R) minus Z), a Q_p-algebra functorial in (A, A^+).
  API RelativeBdRPlus (data):
    R_2 = B^+_dR(A), the ring of the completion of Proj(P_R) along Z.
  API RelativeBdR (data):
    R_3 = B_dR(A) = O(Spec R_1 x_{Proj} Spec R_2).
  API RelativeBdR.eq_localization (characterisation):
    R_3 = R_2[1/z] for every generator z of ker(theta), and the localisation does not depend on z.
  API RelativeBdRPlus.equiv_completedRing (compatibility):
    R_2 = B^+_D(S) and R_3 = B_D(S) for the degree-one divisor D of the untilt
    (RelativeFarguesFontaine:RF2:untilts/BdR-completion-and-filtration), compatibly with theta and
    the I_D-adic filtration.
  API RelativeBdRPlus.equiv_mathlib (compatibility):
    In the p-typical case R_2 is canonically isomorphic to Mathlib's BDeRhamPlus A^+ p and R_3 to
    BDeRham A^+ p, through PadicHodgeTheory:R06.1/bdr-plus-of-perfectoid-affinoid-algebras.
  API RelativeBe.restrict (projection):
    The restriction maps R_1 -> R_3 and R_2 -> R_3, and the localisation R_2 -> R_3.
  API RelativeBe.map (functoriality):
    A morphism of perfectoid pairs (A, A^+) -> (A', A'^+) induces compatible maps R_i(A) -> R_i(A'),
    with map_id and map_comp.
  API RelativeBe.atGeometricPoint (example):
    For A = C complete algebraically closed, R_1 = B[1/t]^{phi = 1} = B_e for t in P_1 with V^+(t) =
    {infinity}.
  example RelativeBe.fundamental_exact_sequence (computation), mathematical contract only:
    For A = C and a = 1: ker(R_1 (+) R_2 -> R_3) = Q_p and R_1 (+) R_2 -> R_3 is surjective; this is
    Fontaine's fundamental exact sequence 0 -> Q_p -> B_e -> B_dR/B^+_dR -> 0
    (PadicHodgeTheory:R06.1/fundamental-exact-sequence).
  example RelativeBdR.localization_unit_invariant (degenerate), mathematical contract only:
    Replacing the generator z of ker(theta) by uz with u a unit of R_2 gives the same subring
    R_2[1/z] = R_2[1/(uz)] of R_3.
  example RelativeBdRPlus.mathlib_compat (compatibility), mathematical contract only:
    For (A, A^+) = (C, O_C) with C/Q_p complete algebraically closed, R_2 is isomorphic to
    BDeRhamPlus O_C p and R_3 to BDeRham O_C p, compatibly with theta.
  example RelativeBe.not_B_invert_t (non-example), mathematical contract only:
    R_1 is not B[1/t]: at A = C the element 1/t of B[1/t] is not phi-invariant (phi(1/t) = p^(-1)
    t^(-1)), so it does not lie in B_e.
-/

/- CONTRACT `RelativeFarguesFontaine:RF4:vector-bundles/B-pair-cohomology` (theorem).
  Statement:
    Kedlaya-Liu Hypotheses 8.7.1 and 8.9.1: a >= 1 an integer and q = p^a; (A, A^+) a perfectoid
    adic Banach algebra over Q_p, X = Spa(A, A^+), and (R, R^+) the perfect uniform adic Banach
    algebra over F_p corresponding to it; P_R = sum_{n >= 0} P_{R,n} the graded ring of
    phi^a-invariants (H^0 of O(n)), Proj(P_R) the schematic relative curve, FF_R -> Proj(P_R) the
    comparison morphism (an equivalence on vector bundles, KL 8.7.7), and Z the image of the
    canonical section Spec(A) -> Proj(P_R) given by the untilt A of R. For S = Spa(R, R^+) over F_q
    and E = W(F_q)[1/p] this is the schematic curve X_S^alg = Proj(P) of RF3 and the degree-one
    divisor of the untilt; L_X denotes the line bundle O(Z) (KL Definition 8.8.18, Convention
    8.9.2). With R_1, R_2, R_3 as in RF4:vector-bundles/relative-period-rings-Be-BdR, for every flat
    quasicoherent sheaf V on Proj(P_R) the cohomology of the complex 0 -> Gamma(Spec R_1, V) (+)
    Gamma(Spec R_2, V) -> Gamma(Spec R_3, V) -> 0, whose arrow is the difference of the two
    restriction maps, is naturally identified with H^i(Proj(P_R), V) (so H^i = 0 for i >= 2). At a
    geometric point (Fargues-Fontaine Proposition 5.3.3) for a vector bundle E with M = Gamma(X
    minus {infinity}, E) and N = E-hat_infinity: H^0(X, E) = M intersect N and H^1(X, E) = N[1/t]/(M
    + N).
-/

/- CONTRACT `RelativeFarguesFontaine:RF4:vector-bundles/vector-bundles-as-relative-B-pairs` (theorem).
  Statement:
    Kedlaya-Liu Hypotheses 8.7.1 and 8.9.1: a >= 1 an integer and q = p^a; (A, A^+) a perfectoid
    adic Banach algebra over Q_p, X = Spa(A, A^+), and (R, R^+) the perfect uniform adic Banach
    algebra over F_p corresponding to it; P_R = sum_{n >= 0} P_{R,n} the graded ring of
    phi^a-invariants (H^0 of O(n)), Proj(P_R) the schematic relative curve, FF_R -> Proj(P_R) the
    comparison morphism (an equivalence on vector bundles, KL 8.7.7), and Z the image of the
    canonical section Spec(A) -> Proj(P_R) given by the untilt A of R. For S = Spa(R, R^+) over F_q
    and E = W(F_q)[1/p] this is the schematic curve X_S^alg = Proj(P) of RF3 and the degree-one
    divisor of the untilt; L_X denotes the line bundle O(Z) (KL Definition 8.8.18, Convention
    8.9.2). (b) The morphism Spec(R_1 (+) R_2) -> Proj(P_R) is an effective descent morphism for
    quasicoherent finite locally free sheaves. (c) The category of vector bundles on Proj(P_R) is
    equivalent to the category of triples (V_1, V_2, iota) with V_1 a finite projective R_1 =
    B_e(A)-module, V_2 a finite projective R_2 = B^+_dR(A)-module and iota : V_1 (x)_{R_1} R_3 = V_2
    (x)_{R_2} R_3 an isomorphism of R_3 = B_dR(A)-modules; the equivalence is compatible with tensor
    products and short exact sequences. By GAGA the same holds for vector bundles on the adic
    relative curve FF_R = X_S (Caraiani-Scholze Theorem 3.5.1). At a geometric point S =
    Spa(C^flat), where B_e is a principal ideal domain, vector bundles on X_FF are triples of finite
    free modules (Fargues-Fontaine Corollaire 5.3.2) and isomorphism classes of rank-n bundles are
    GL_n(B_e) \ GL_n(B_dR) / GL_n(B^+_dR).
-/

/- CONTRACT `RelativeFarguesFontaine:RF4:vector-bundles/lattices-and-modifications-of-trivial-bundles` (comparison).
  Statement:
    Conventions of this layer: E is a nonarchimedean local field with residue field F_q and
    uniformizer pi; S = Spa(R, R^+) is an affinoid perfectoid space over F_q with pseudouniformizer
    varpi; Y-curly_S = Spa W_{O_E}(R^+) minus V([varpi]), Y_S = Y-curly_S minus V(pi) and X_S = Y_S
    / phi^Z (RF0, RF1). For a map S -> Div^d_(-) the associated closed Cartier divisor D = D_S of
    Y-curly_S, Y_S or X_S has invertible ideal sheaf I_D (RF2:integral-divisors); when D is affinoid
    (always locally on S) B^+_D(S) denotes the global sections of the I_D-adic completion of the
    structure sheaf along D and B_D(S) = B^+_D(S)[1/I_D] (FS's B^+_{Div^d}(S), B_{Div^d}(S); B^+_dR,
    B_dR when d = 1). (a) For S affinoid perfectoid with an untilt S^sharp over E, D = S^sharp the
    degree-one divisor of X_S, fix a finite free O_E-module T and the reference bundle F = T
    (x)_{O_E} O_{X_S}. The gluing of RF4:vector-bundles/meromorphic-modification-at-a-divisor gives
    an equivalence between B^+_dR(S^sharp)-lattices Xi in T (x)_{O_E} B_dR(S^sharp) and
    modifications (F', beta^(-1)) of this fixed F at D, where beta : F|_{X_S minus D} -> F'|_{X_S
    minus D} is meromorphic along D. If T varies, the output retains T and its identification with
    the reference bundle; forgetting this integral data does not give an equivalence of categories.
    (b) For S = Spa(C^flat) and E = Q_p, using the locally finite family of disjoint divisors
    phi^n(x_C), n >= 1, of Y_{[0,oo)}: the pairs (T, Xi) are equivalent to shtukas over Spa(C^flat)
    with one leg at phi^(-1)(x_C) (Scholze-Weinstein Proposition 12.4.6), and to quadruples (F, F',
    beta, T) with F trivial and T a Z_p-lattice in H^0(X_FF, F) (Theorem 14.1.1, (2) <=> (3)). (c)
    Minuscule case (Fargues-Fontaine 8.3.1): lattices with t Xi_0 in Xi in Xi_0, Xi_0 = T (x)
    B^+_dR, correspond to C-subspaces of T (x) C, i.e. to modifications whose cokernel is killed by
    t.
-/

/- CONTRACT `RelativeFarguesFontaine:RF4:vector-bundles/kedlaya-algebraicity-of-punctured-bundles` (theorem).
  Statement:
    Let R be a perfect Tate Huber ring of characteristic p, R^+ a ring of integral elements, x in R
    a topologically nilpotent unit (so x in R^+), and A = W(R^+) (p-typical Witt vectors). Let X-sch
    = Spec(A) minus V(p, [x]) and Y-ad = Spa(A, A) minus V(p, [x]), the analytic locus. Then
    pullback along the morphism of locally ringed spaces Y-ad -> X-sch is an equivalence Vec(X-sch)
    = Vec(Y-ad) (Kedlaya, Theorem 3.8). If moreover R^+ = o_K for a perfectoid field K of
    characteristic p, then finite free A-modules, vector bundles on Spa(A, A) and vector bundles on
    Spa(A, A) minus the closed point are equivalent (Kedlaya Theorem 3.9; Scholze-Weinstein Theorem
    14.2.1), and so are vector bundles on Spec(A) minus the closed point (Scholze-Weinstein Lemma
    14.2.3). For general R^+ a vector bundle on Spec(A) minus {p = [x] = 0} need not extend to
    Spec(A) (Kedlaya Example 3.14).
-/

/- CONTRACT `RelativeFarguesFontaine:RF4:G-torsors/meromorphic-G-modification` (definition).
  Statement:
    Conventions of this layer: E is a nonarchimedean local field with residue field F_q and
    uniformizer pi; S = Spa(R, R^+) is an affinoid perfectoid space over F_q with pseudouniformizer
    varpi; Y-curly_S = Spa W_{O_E}(R^+) minus V([varpi]), Y_S = Y-curly_S minus V(pi) and X_S = Y_S
    / phi^Z (RF0, RF1). For a map S -> Div^d_(-) the associated closed Cartier divisor D = D_S of
    Y-curly_S, Y_S or X_S has invertible ideal sheaf I_D (RF2:integral-divisors); when D is affinoid
    (always locally on S) B^+_D(S) denotes the global sections of the I_D-adic completion of the
    structure sheaf along D and B_D(S) = B^+_D(S)[1/I_D] (FS's B^+_{Div^d}(S), B_{Div^d}(S); B^+_dR,
    B_dR when d = 1). G-bundles are taken in the Tannakian sense of BunGAndNewtonStrata:BG0: for G a
    linear algebraic group over E (affine of finite type), Rep_E G its finite-dimensional
    representations, a G-bundle on an adic space or scheme X over E is an exact tensor functor Rep_E
    G -> Bun(X); BG0 proves this equivalent to geometric and cohomological torsors on sousperfectoid
    spaces. For G smooth affine over O_E the same with representations on finite free O_E-modules
    (Scholze-Weinstein 19.5). Over an affine scheme Spec(B), Bun means finite projective B-modules.
    The general equivalence of the three descriptions is BG0's and is not proved here (RS-20). Let
    X-cal be Y_S or X_S, D the divisor of a map S -> Div^d_(-) and P, P' G-bundles on X-cal. A
    modification between P and P' at D is an isomorphism beta : P|_{X-cal minus D} = P'|_{X-cal
    minus D} of exact tensor functors on X-cal minus D such that for every V in Rep_E G the induced
    isomorphism beta_V : P(V)|_{X-cal minus D} = P'(V)|_{X-cal minus D} is meromorphic along D, i.e.
    extends to a morphism P(V) -> P'(V)(kD) for k >> 0 (Fargues-Scholze III.3). Applying this to
    V^dual shows that each beta_V is a modification of vector bundles in the sense of RF4:vector-
    bundles/modification-of-vector-bundles. Modifications between G-bundles at D form a groupoid,
    and G-modifications of a fixed P' at D form a groupoid Mod^G_D(P').
  API GModification (data):
    A modification between G-bundles P and P' at D: an isomorphism of exact tensor functors off D,
    meromorphic on every representation.
  API GModification.toModification (projection):
    For V in Rep_E G, beta_V is a modification of P'(V) at D (RF4:vector-bundles/modification-of-
    vector-bundles), natural in V and compatible with tensor products and duals.
  API GModification.ofGL (equivalence):
    For G = GL_n, G-modifications are the modifications of the rank-n vector bundles P(std).
  API GModification.refl (constructor):
    The identity of P is a modification between P and P.
  API GModification.symm (constructor):
    The inverse of a modification is a modification.
  API GModification.trans (constructor):
    The composite of modifications at D is a modification at D.
  API GModification.pushforward (functoriality):
    For rho : G -> H, rho_* beta (precomposition with Res : Rep H -> Rep G) is a modification
    between rho_* P and rho_* P'.
  API GModification.pullback (functoriality):
    Pullback along T -> S of affinoid perfectoid spaces, with map_id and map_comp.
  API GModification.ext (extensionality):
    Two modifications between P and P' are equal iff they agree on one faithful representation
    (equivalently off D on all representations).
  example GModification.gl_eq_modification (compatibility), mathematical contract only:
    For G = GL_n, the map beta |-> beta_std is a bijection from modifications between P and P' at D
    to modifications of the vector bundles P(std), P'(std) at D.
  example GModification.gm_geometric_point (computation), mathematical contract only:
    For G = G_m, S = Spa(C^flat) and D = infinity, the modifications of the trivial G_m-bundle at D
    are the line bundles O(-k), k in Z, with the lattice xi^k B^+_dR (xi a uniformiser of B^+_dR).
  example GModification.identity_degenerate (degenerate), mathematical contract only:
    For d = 0 (D empty) a modification between P and P' is an isomorphism of G-bundles P = P'.
  example GModification.not_iso_extension (non-example), mathematical contract only:
    Meromorphy is not extension to an isomorphism over D: for G = G_m the inclusion O(-D) -> O is a
    modification between O(-D) and O at D, although it does not extend to an isomorphism of G_m-
    bundles on X-cal.
-/

/- CONTRACT `RelativeFarguesFontaine:RF4:G-torsors/tannakian-transfer-of-gluing` (theorem).
  Statement:
    Conventions of this layer: E is a nonarchimedean local field with residue field F_q and
    uniformizer pi; S = Spa(R, R^+) is an affinoid perfectoid space over F_q with pseudouniformizer
    varpi; Y-curly_S = Spa W_{O_E}(R^+) minus V([varpi]), Y_S = Y-curly_S minus V(pi) and X_S = Y_S
    / phi^Z (RF0, RF1). For a map S -> Div^d_(-) the associated closed Cartier divisor D = D_S of
    Y-curly_S, Y_S or X_S has invertible ideal sheaf I_D (RF2:integral-divisors); when D is affinoid
    (always locally on S) B^+_D(S) denotes the global sections of the I_D-adic completion of the
    structure sheaf along D and B_D(S) = B^+_D(S)[1/I_D] (FS's B^+_{Div^d}(S), B_{Div^d}(S); B^+_dR,
    B_dR when d = 1). G-bundles are taken in the Tannakian sense of BunGAndNewtonStrata:BG0: for G a
    linear algebraic group over E (affine of finite type), Rep_E G its finite-dimensional
    representations, a G-bundle on an adic space or scheme X over E is an exact tensor functor Rep_E
    G -> Bun(X); BG0 proves this equivalent to geometric and cohomological torsors on sousperfectoid
    spaces. For G smooth affine over O_E the same with representations on finite free O_E-modules
    (Scholze-Weinstein 19.5). Over an affine scheme Spec(B), Bun means finite projective B-modules.
    The general equivalence of the three descriptions is BG0's and is not proved here (RS-20). (i)
    Let G be a linear algebraic group over E, X-cal = Y_S or X_S, D the affinoid divisor of S ->
    Div^d_(-), and P' a G-bundle on X-cal with completion P'-hat_D (the exact tensor functor V |->
    P'(V)-hat_D to finite projective B^+_D(S)-modules). Then P |-> P-hat_D gives an equivalence
    between the groupoid of pairs (P, beta), beta a modification between P and P' at D
    (RF4:G-torsors/meromorphic-G-modification), and the groupoid of pairs (Q, alpha) with Q a
    G-torsor on Spec B^+_D(S) and alpha : Q|_{Spec B_D(S)} = P'-hat_D|_{Spec B_D(S)}. In particular
    every such (Q, alpha) is effective. For d = 1, S over Spd E with untilt S^sharp and P' trivial:
    G-torsors on Spec B^+_dR(R^sharp) with a trivialisation over B_dR(R^sharp) correspond to
    G-bundles on X_S with a modification of the trivial G-bundle at S^sharp (Fargues-Scholze III.3,
    Scholze-Weinstein Proposition 19.1.2). (ii) For G smooth affine over O_E and X-cal = Y-curly_S
    (or an open subset of S x Spa O_E as in Scholze-Weinstein 19.1.2) the same holds, with the O_E-
    integral Tannakian description of torsors.
-/

/- CONTRACT `RelativeFarguesFontaine:RF4:G-torsors/faithful-representation-criterion` (theorem).
  Statement:
    Conventions of this layer: E is a nonarchimedean local field with residue field F_q and
    uniformizer pi; S = Spa(R, R^+) is an affinoid perfectoid space over F_q with pseudouniformizer
    varpi; Y-curly_S = Spa W_{O_E}(R^+) minus V([varpi]), Y_S = Y-curly_S minus V(pi) and X_S = Y_S
    / phi^Z (RF0, RF1). For a map S -> Div^d_(-) the associated closed Cartier divisor D = D_S of
    Y-curly_S, Y_S or X_S has invertible ideal sheaf I_D (RF2:integral-divisors); when D is affinoid
    (always locally on S) B^+_D(S) denotes the global sections of the I_D-adic completion of the
    structure sheaf along D and B_D(S) = B^+_D(S)[1/I_D] (FS's B^+_{Div^d}(S), B_{Div^d}(S); B^+_dR,
    B_dR when d = 1). G-bundles are taken in the Tannakian sense of BunGAndNewtonStrata:BG0: for G a
    linear algebraic group over E (affine of finite type), Rep_E G its finite-dimensional
    representations, a G-bundle on an adic space or scheme X over E is an exact tensor functor Rep_E
    G -> Bun(X); BG0 proves this equivalent to geometric and cohomological torsors on sousperfectoid
    spaces. For G smooth affine over O_E the same with representations on finite free O_E-modules
    (Scholze-Weinstein 19.5). Over an affine scheme Spec(B), Bun means finite projective B-modules.
    The general equivalence of the three descriptions is BG0's and is not proved here (RS-20). Let G
    be a linear algebraic group over E and V in Rep_E G faithful. (a) An isomorphism beta :
    P|_{X-cal minus D} = P'|_{X-cal minus D} of G-bundles is a modification at D iff beta_V is a
    modification of the vector bundles P(V), P'(V) at D (both beta_V and beta_V^(-1) meromorphic).
    (b) Consequently the G-gluing of RF4:G-torsors/tannakian-transfer-of-gluing and its bounds may
    be computed with any faithful representation: if beta_V is bounded by k then for every tensor
    construction W = V^(x a) (x) (V^dual)^(x b) and every subquotient of a direct sum of copies of
    that tensor word, beta_W is bounded by (a + b) k. For a finite sum of tensor words of differing
    bidegrees (a_i,b_i), the bound is max_i(a_i + b_i) k.
-/

/- CONTRACT `RelativeFarguesFontaine:RF4:G-torsors/change-of-structure-group` (theorem).
  Statement:
    Conventions of this layer: E is a nonarchimedean local field with residue field F_q and
    uniformizer pi; S = Spa(R, R^+) is an affinoid perfectoid space over F_q with pseudouniformizer
    varpi; Y-curly_S = Spa W_{O_E}(R^+) minus V([varpi]), Y_S = Y-curly_S minus V(pi) and X_S = Y_S
    / phi^Z (RF0, RF1). For a map S -> Div^d_(-) the associated closed Cartier divisor D = D_S of
    Y-curly_S, Y_S or X_S has invertible ideal sheaf I_D (RF2:integral-divisors); when D is affinoid
    (always locally on S) B^+_D(S) denotes the global sections of the I_D-adic completion of the
    structure sheaf along D and B_D(S) = B^+_D(S)[1/I_D] (FS's B^+_{Div^d}(S), B_{Div^d}(S); B^+_dR,
    B_dR when d = 1). G-bundles are taken in the Tannakian sense of BunGAndNewtonStrata:BG0: for G a
    linear algebraic group over E (affine of finite type), Rep_E G its finite-dimensional
    representations, a G-bundle on an adic space or scheme X over E is an exact tensor functor Rep_E
    G -> Bun(X); BG0 proves this equivalent to geometric and cohomological torsors on sousperfectoid
    spaces. For G smooth affine over O_E the same with representations on finite free O_E-modules
    (Scholze-Weinstein 19.5). Over an affine scheme Spec(B), Bun means finite projective B-modules.
    The general equivalence of the three descriptions is BG0's and is not proved here (RS-20). Let
    rho : G -> H be a homomorphism of linear algebraic groups over E (resp. of smooth affine group
    schemes over O_E). (a) Pushforward rho_* (precomposition with the restriction functor Res_rho :
    Rep H -> Rep G) carries G-modifications at D to H-modifications at D, and commutes with the
    gluing of RF4:G-torsors/tannakian-transfer-of-gluing: rho_*(glue(Q, alpha)) = glue(rho_* Q,
    rho_* alpha), compatibly with composition (rho' rho)_* = rho'_* rho_*. (b) Over E, if rho is a
    closed immersion, an isomorphism of G-bundles off D is meromorphic along D iff its pushforward
    to H is.
-/

/- CONTRACT `RelativeFarguesFontaine:RF4:G-torsors/base-change-and-divisor-compatibility` (theorem).
  Statement:
    Conventions of this layer: E is a nonarchimedean local field with residue field F_q and
    uniformizer pi; S = Spa(R, R^+) is an affinoid perfectoid space over F_q with pseudouniformizer
    varpi; Y-curly_S = Spa W_{O_E}(R^+) minus V([varpi]), Y_S = Y-curly_S minus V(pi) and X_S = Y_S
    / phi^Z (RF0, RF1). For a map S -> Div^d_(-) the associated closed Cartier divisor D = D_S of
    Y-curly_S, Y_S or X_S has invertible ideal sheaf I_D (RF2:integral-divisors); when D is affinoid
    (always locally on S) B^+_D(S) denotes the global sections of the I_D-adic completion of the
    structure sheaf along D and B_D(S) = B^+_D(S)[1/I_D] (FS's B^+_{Div^d}(S), B_{Div^d}(S); B^+_dR,
    B_dR when d = 1). G-bundles are taken in the Tannakian sense of BunGAndNewtonStrata:BG0: for G a
    linear algebraic group over E (affine of finite type), Rep_E G its finite-dimensional
    representations, a G-bundle on an adic space or scheme X over E is an exact tensor functor Rep_E
    G -> Bun(X); BG0 proves this equivalent to geometric and cohomological torsors on sousperfectoid
    spaces. For G smooth affine over O_E the same with representations on finite free O_E-modules
    (Scholze-Weinstein 19.5). Over an affine scheme Spec(B), Bun means finite projective B-modules.
    The general equivalence of the three descriptions is BG0's and is not proved here (RS-20). (a)
    For a map f : T -> S of affinoid perfectoid spaces over F_q and D the divisor of S -> Div^d_(-),
    the G-gluing of RF4:G-torsors/tannakian-transfer-of-gluing commutes with pullback: f^* glue(Q,
    alpha) = glue(Q (x)_{B^+_D(S)} B^+_{D_T}(T), alpha_T), compatibly with composition of base
    changes. (b) For D = D_1 + D_2 with D_1, D_2 disjoint, G-torsors on Spec B^+_D(S) with an
    isomorphism over B_D(S) are pairs of such data at D_1 and D_2, and the gluing at D is the
    iterated gluing at D_1 and D_2; for colliding legs D = m D_1 the data at D and at D_1 coincide.
    (c) For arbitrary D_1, D_2, a chain of modifications at D_1 then D_2 has a composite meromorphic
    at D_1 + D_2: representationwise the local equations multiply, and the two finite pole bounds
    give a bound at the sum. This construction commutes with base change. An equivalence with pairs
    of independent lattice data is asserted only on the disjoint locus; on a collision locus the
    chain retains extra intermediate data.
-/

/- CONTRACT `RelativeFarguesFontaine:RF4:G-torsors/v-descent-and-local-triviality` (theorem).
  Statement:
    Conventions of this layer: E is a nonarchimedean local field with residue field F_q and
    uniformizer pi; S = Spa(R, R^+) is an affinoid perfectoid space over F_q with pseudouniformizer
    varpi; Y-curly_S = Spa W_{O_E}(R^+) minus V([varpi]), Y_S = Y-curly_S minus V(pi) and X_S = Y_S
    / phi^Z (RF0, RF1). For a map S -> Div^d_(-) the associated closed Cartier divisor D = D_S of
    Y-curly_S, Y_S or X_S has invertible ideal sheaf I_D (RF2:integral-divisors); when D is affinoid
    (always locally on S) B^+_D(S) denotes the global sections of the I_D-adic completion of the
    structure sheaf along D and B_D(S) = B^+_D(S)[1/I_D] (FS's B^+_{Div^d}(S), B_{Div^d}(S); B^+_dR,
    B_dR when d = 1). G-bundles are taken in the Tannakian sense of BunGAndNewtonStrata:BG0: for G a
    linear algebraic group over E (affine of finite type), Rep_E G its finite-dimensional
    representations, a G-bundle on an adic space or scheme X over E is an exact tensor functor Rep_E
    G -> Bun(X); BG0 proves this equivalent to geometric and cohomological torsors on sousperfectoid
    spaces. For G smooth affine over O_E the same with representations on finite free O_E-modules
    (Scholze-Weinstein 19.5). Over an affine scheme Spec(B), Bun means finite projective B-modules.
    The general equivalence of the three descriptions is BG0's and is not proved here (RS-20). (a)
    For S in Perf over F_q, U an open subset of S x Spa O_E (for example of Y-curly_S) and G smooth
    affine over O_E, the functor S' |-> {G-torsors on U x_{S x Spa O_E} (S' x Spa O_E)} is a v-stack
    on Perf_S (Scholze-Weinstein Proposition 19.5.3; Fargues-Scholze's footnote extends it from Z_p
    to O_E). (b) For S -> Div^d_(-) with D_S affinoid, vector bundles and G-bundles over
    B^+_{Div^d}(S) (G reductive over O_E, resp. over E) satisfy v-descent in S, and so do
    isomorphisms between two of them over B_{Div^d}(S). (c) Every G-bundle over
    B^+_{Div^d_{Y-curly}}(S), G reductive over O_E, is trivial etale-locally on S. The quotient
    presentations Hck = L^+G \ LG / L^+G and Gr = LG / L^+G that Fargues-Scholze deduce from (b) and
    (c) are GeometricSatakeAndFusion:GS0:loop-geometry's and are not planned here.
-/

/- CONTRACT `RelativeFarguesFontaine:RF4:G-torsors/modification-of-G-bundle-by-lattice` (construction).
  Statement:
    Conventions of this layer: E is a nonarchimedean local field with residue field F_q and
    uniformizer pi; S = Spa(R, R^+) is an affinoid perfectoid space over F_q with pseudouniformizer
    varpi; Y-curly_S = Spa W_{O_E}(R^+) minus V([varpi]), Y_S = Y-curly_S minus V(pi) and X_S = Y_S
    / phi^Z (RF0, RF1). For a map S -> Div^d_(-) the associated closed Cartier divisor D = D_S of
    Y-curly_S, Y_S or X_S has invertible ideal sheaf I_D (RF2:integral-divisors); when D is affinoid
    (always locally on S) B^+_D(S) denotes the global sections of the I_D-adic completion of the
    structure sheaf along D and B_D(S) = B^+_D(S)[1/I_D] (FS's B^+_{Div^d}(S), B_{Div^d}(S); B^+_dR,
    B_dR when d = 1). G-bundles are taken in the Tannakian sense of BunGAndNewtonStrata:BG0: for G a
    linear algebraic group over E (affine of finite type), Rep_E G its finite-dimensional
    representations, a G-bundle on an adic space or scheme X over E is an exact tensor functor Rep_E
    G -> Bun(X); BG0 proves this equivalent to geometric and cohomological torsors on sousperfectoid
    spaces. For G smooth affine over O_E the same with representations on finite free O_E-modules
    (Scholze-Weinstein 19.5). Over an affine scheme Spec(B), Bun means finite projective B-modules.
    The general equivalence of the three descriptions is BG0's and is not proved here (RS-20). Let S
    be a perfectoid space over Spd E (untilt S^sharp over E, D = S^sharp the degree-one divisor of
    X_S), G a linear algebraic group over E, P a G-bundle on X_S and L a G(B^+_dR)-lattice on the
    G(B_dR)-torsor P|_{B_dR}: a G-torsor Q on Spec B^+_dR(R^sharp), given etale-locally on S, with
    alpha : Q|_{B_dR} = P-hat_D|_{B_dR}. The modification P_L of P by L is the G-bundle on X_S glued
    from (P, Q, alpha) by RF4:G-torsors/tannakian-transfer-of-gluing, with its canonical
    modification P_L|_{X_S minus D} = P|_{X_S minus D}. It is functorial in (P, L), compatible with
    pullback in S and with pushforward along homomorphisms of groups. For P trivial it is the map E
    from G-torsors on Spec B^+_dR trivialised over B_dR to G-bundles on X_S of Caraiani-Scholze
    Corollary 3.5.2 and Fargues-Scholze III.3; identifying its source with Gr_G(S) is
    GeometricSatakeAndFusion:GS0:loop-geometry's, and the resulting Beauville-Laszlo morphism Gr_G
    -> Bun_G is exported to BG2:uniformization, HS0 and HS2.
  API modify (constructor):
    The G-bundle P_L on X_S attached to a G-bundle P and a G(B^+_dR)-lattice L on P|_{B_dR}.
  API modify.modification (projection):
    The canonical modification P_L|_{X_S minus D} = P|_{X_S minus D}, meromorphic along D.
  API modify_tautological (simp):
    For the tautological lattice L = P-hat_D, P_L = P with the identity modification.
  API modify_comp (relation):
    For L a lattice on P|_{B_dR} and L' a lattice on P_L|_{B_dR} = P|_{B_dR}, (P_L)_{L'} = P_{L'}.
  API modify.pullback (functoriality):
    For T -> S, (P_L)_T = (P_T)_{L_T}; compatible with composition.
  API modify.pushforward (functoriality):
    For rho : G -> H, rho_*(P_L) = (rho_* P)_{rho_* L}.
  API modify_gl (compatibility):
    For G = GL_n, P_L is the bundle glued by RF4:vector-bundles/meromorphic-modification-at-a-
    divisor from P(std) and the lattice L(std).
  API modify.characterisation (characterisation):
    P_L is the unique G-bundle with a modification to P at D whose completion at D is L
    (RF4:G-torsors/tannakian-transfer-of-gluing).
  example modify_gl_compat (compatibility), mathematical contract only:
    For G = GL_n and P trivial, P_L is the rank-n vector bundle obtained by gluing the B^+_dR-
    lattice L in B_dR^n to the trivial bundle off D, as in Caraiani-Scholze 3.5.1.
  example modify_gm_degree (computation), mathematical contract only:
    For G = G_m, S = Spa(C^flat), P trivial and L = xi^k B^+_dR, P_L = O(-k), of degree -k.
  example modify_tautological_eq (degenerate), mathematical contract only:
    For the tautological lattice L = P-hat_D the modification P_L is P, with the identity
    modification.
  example modify_SL2_nonlattice (non-example), mathematical contract only:
    For G = SL_2 and P trivial, the B^+_dR-lattice xi B^+_dR (+) B^+_dR of B_dR^2 has determinant
    lattice xi B^+_dR, so it is not an SL_2(B^+_dR)-lattice of the trivial SL_2-torsor and does not
    define an SL_2-modification, although it defines a GL_2-modification.
-/

end TauCeti
