/-
Suggested Lean file for `RelativeFarguesFontaine`, part RF4 (revision job BP-RelativeFarguesFontaine--RF4~2).

This file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/RelativeFarguesFontaine--RF4.md` is definitive. The statements below
suggest Lean forms, so that contributors and reviewers converge on names and signatures. The proposed theorem proofs
use `sorry`; nothing here is formalised, and every node of the packet keeps
`implementationStatus = "unchecked"`.

Native Lean is given where the pinned Mathlib (082e2d3) has the carriers: exact squares of rings,
glueing data, glueing pairs and the Beauville–Laszlo theorem; the local (affinoid-chart) form of
bounded modifications; generator invariance of localizations; henselian approximation for smooth
affine schemes; and lifting sections of formally smooth algebras over adically complete rings.
The relative comparison with Mathlib's `BDeRhamPlus` still requires the geometric interface.

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
import Mathlib.Algebra.MvPolynomial.Basic
import Mathlib.RingTheory.Ideal.Quotient.Defs

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

/-- Kedlaya–Liu 1.3.8: surjectivity of one comparison for a finite datum gives
surjectivity of the difference and of the other comparison. A finite set of sections
generates both pieces over their respective rings; its R-span is the module M₀. -/
theorem finite_glueing_surjectivity (h : ExactSquare R R₁ R₂ R₁₂)
    (N₁ N₂ N₁₂ : Type u) [AddCommGroup N₁] [Module R₁ N₁] [Module R N₁]
    [IsScalarTower R R₁ N₁] [AddCommGroup N₂] [Module R₂ N₂] [Module R N₂]
    [IsScalarTower R R₂ N₂] [AddCommGroup N₁₂] [Module R₁₂ N₁₂]
    [Module.Finite R₁ N₁] [Module.Finite R₂ N₂]
    (D : GlueingDatum R₁ R₂ R₁₂ N₁ N₂ N₁₂)
    (hsurj : Function.Surjective (D.sectionsCompare (R := R)).1) :
    (∀ z : N₁₂, ∃ a b, D.ψ₁ (1 ⊗ₜ[R₁] a) - D.ψ₂ (1 ⊗ₜ[R₂] b) = z) ∧
      Function.Surjective (D.sectionsCompare (R := R)).2 ∧
      ∃ S : Finset (D.sections (R := R)),
        Submodule.span R₁ {a | ∃ s ∈ S, a = s.val.1} = ⊤ ∧
        Submodule.span R₂ {b | ∃ s ∈ S, b = s.val.2} = ⊤ := by
  sorry

/-- Kedlaya–Liu 1.3.9(a) requires universal comparison surjectivity, but no
maximal-ideal lifting hypothesis. That extra hypothesis enters only projectivity. -/
theorem finiteProjective_glueing_finitePresentation (h : ExactSquare R R₁ R₂ R₁₂)
    (hsurj : ExactSquare.FiniteProjectiveSurjective (R := R) (R₁ := R₁) (R₂ := R₂) (R₁₂ := R₁₂))
    (N₁ N₂ N₁₂ : Type u) [AddCommGroup N₁] [Module R₁ N₁] [Module R N₁]
    [IsScalarTower R R₁ N₁] [AddCommGroup N₂] [Module R₂ N₂] [Module R N₂]
    [IsScalarTower R R₂ N₂] [AddCommGroup N₁₂] [Module R₁₂ N₁₂]
    [Module.Finite R₁ N₁] [Module.Projective R₁ N₁]
    [Module.Finite R₂ N₂] [Module.Projective R₂ N₂]
    (D : GlueingDatum R₁ R₂ R₁₂ N₁ N₂ N₁₂) :
    Module.FinitePresentation R (D.sections (R := R)) ∧
      Function.Bijective (D.sectionsCompare (R := R)).1 ∧
      Function.Bijective (D.sectionsCompare (R := R)).2 := by
  sorry

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

/-- The Hom part of finite étale glueing: a compatible pair of algebra maps
between scalar extensions descends uniquely. Compatibility is checked on 1 ⊗ a;
linearity then checks it on every element of the common scalar extension. -/
theorem finiteEtale_can_fullyFaithful (h : ExactSquare R R₁ R₂ R₁₂)
    (A B : Type u) [CommRing A] [Algebra R A] [Module.Finite R A] [Algebra.Etale R A]
    [CommRing B] [Algebra R B] [Module.Finite R B] [Algebra.Etale R B]
    (f₁ : R₁ ⊗[R] A →ₐ[R₁] R₁ ⊗[R] B) (f₂ : R₂ ⊗[R] A →ₐ[R₂] R₂ ⊗[R] B)
    (hcompat : ∀ a : A,
      (GlueingDatum.can (R := R) (R₁ := R₁) (R₂ := R₂) (R₁₂ := R₁₂) B).ψ₁
          (1 ⊗ₜ[R₁] f₁ (1 ⊗ₜ[R] a)) =
        (GlueingDatum.can (R := R) (R₁ := R₁) (R₂ := R₂) (R₁₂ := R₁₂) B).ψ₂
          (1 ⊗ₜ[R₂] f₂ (1 ⊗ₜ[R] a))) :
    ∃! f : A →ₐ[R] B, ∀ a : A,
      f₁ (1 ⊗ₜ[R] a) = 1 ⊗ₜ[R] f a ∧ f₂ (1 ⊗ₜ[R] a) = 1 ⊗ₜ[R] f a := by
  sorry

end ExactSquare

/-! Morphisms, the sections adjunction, and componentwise operations.
These are signatures over actual module carriers, rather than assumed equivalences. -/
section DatumAPI
variable {R R₁ R₂ R₁₂ : Type u} [CommRing R] [CommRing R₁] [CommRing R₂] [CommRing R₁₂]
  [Algebra R R₁] [Algebra R R₂] [Algebra R R₁₂] [Algebra R₁ R₁₂] [Algebra R₂ R₁₂]
  [IsScalarTower R R₁ R₁₂] [IsScalarTower R R₂ R₁₂]
variable {M₁ M₂ M₁₂ N₁ N₂ N₁₂ P₁ P₂ P₁₂ : Type u}
  [AddCommGroup M₁] [Module R₁ M₁] [AddCommGroup M₂] [Module R₂ M₂]
  [AddCommGroup M₁₂] [Module R₁₂ M₁₂]
  [AddCommGroup N₁] [Module R₁ N₁] [AddCommGroup N₂] [Module R₂ N₂]
  [AddCommGroup N₁₂] [Module R₁₂ N₁₂]
  [AddCommGroup P₁] [Module R₁ P₁] [AddCommGroup P₂] [Module R₂ P₂]
  [AddCommGroup P₁₂] [Module R₁₂ P₁₂]
namespace GlueingDatum
/-- A compatible triple; compatibility is evaluated on pure tensors, which generate. -/
structure Hom (D : GlueingDatum R₁ R₂ R₁₂ M₁ M₂ M₁₂)
    (E : GlueingDatum R₁ R₂ R₁₂ N₁ N₂ N₁₂) where
  map₁ : M₁ →ₗ[R₁] N₁
  map₂ : M₂ →ₗ[R₂] N₂
  map₁₂ : M₁₂ →ₗ[R₁₂] N₁₂
  comm₁ : ∀ a m, map₁₂ (D.ψ₁ (a ⊗ₜ[R₁] m)) = E.ψ₁ (a ⊗ₜ[R₁] map₁ m)
  comm₂ : ∀ a m, map₁₂ (D.ψ₂ (a ⊗ₜ[R₂] m)) = E.ψ₂ (a ⊗ₜ[R₂] map₂ m)
variable {D : GlueingDatum R₁ R₂ R₁₂ M₁ M₂ M₁₂}
  {E : GlueingDatum R₁ R₂ R₁₂ N₁ N₂ N₁₂}
  {F : GlueingDatum R₁ R₂ R₁₂ P₁ P₂ P₁₂}
/-- Extensionality of datum morphisms. -/
theorem Hom.ext {f g : Hom D E} (h₁ : f.map₁ = g.map₁)
    (h₂ : f.map₂ = g.map₂) (h₁₂ : f.map₁₂ = g.map₁₂) : f = g := by sorry
/-- Identity morphism. -/
def Hom.id (D : GlueingDatum R₁ R₂ R₁₂ M₁ M₂ M₁₂) : Hom D D where
  map₁ := LinearMap.id
  map₂ := LinearMap.id
  map₁₂ := LinearMap.id
  comm₁ := by intros; rfl
  comm₂ := by intros; rfl
/-- Composition of compatible triples. -/
def Hom.comp (g : Hom E F) (f : Hom D E) : Hom D F where
  map₁ := g.map₁.comp f.map₁
  map₂ := g.map₂.comp f.map₂
  map₁₂ := g.map₁₂.comp f.map₁₂
  comm₁ := by sorry
  comm₂ := by sorry
theorem Hom.id_comp (f : Hom D E) : (Hom.id E).comp f = f := by sorry
theorem Hom.comp_id (f : Hom D E) : f.comp (Hom.id D) = f := by sorry
theorem Hom.comp_assoc (g : Hom E F) (f : Hom D E)
    {Q₁ Q₂ Q₁₂ : Type u} [AddCommGroup Q₁] [Module R₁ Q₁]
    [AddCommGroup Q₂] [Module R₂ Q₂] [AddCommGroup Q₁₂] [Module R₁₂ Q₁₂]
    {H : GlueingDatum R₁ R₂ R₁₂ Q₁ Q₂ Q₁₂} (h : Hom F H) :
    (h.comp g).comp f = h.comp (g.comp f) := by sorry
variable [Module R M₁] [Module R M₂] [IsScalarTower R R₁ M₁] [IsScalarTower R R₂ M₂]
  [Module R N₁] [Module R N₂] [IsScalarTower R R₁ N₁] [IsScalarTower R R₂ N₂]
  [Module R P₁] [Module R P₂] [IsScalarTower R R₁ P₁] [IsScalarTower R R₂ P₂]
/-- Functoriality of the actual equalizer submodule. -/
def sectionsMap (f : Hom D E) : D.sections (R := R) →ₗ[R] E.sections (R := R) where
  toFun x := ⟨(f.map₁ x.val.1, f.map₂ x.val.2), by sorry⟩
  map_add' := by sorry
  map_smul' := by sorry
theorem sectionsMap_apply (f : Hom D E) (x : D.sections (R := R)) :
    (sectionsMap (R := R) f x).val = (f.map₁ x.val.1, f.map₂ x.val.2) := by sorry
theorem sectionsMap_id : sectionsMap (R := R) (Hom.id D) = LinearMap.id := by sorry
theorem sectionsMap_comp (g : Hom E F) (f : Hom D E) :
    sectionsMap (R := R) (g.comp f) = (sectionsMap (R := R) g).comp (sectionsMap (R := R) f) := by sorry
/-- Extensionality is equality of the two coordinates, not equality of ambient module types. -/
theorem sections_ext (x y : D.sections (R := R))
    (h₁ : x.val.1 = y.val.1) (h₂ : x.val.2 = y.val.2) : x = y := by sorry
/-- Left adjoint on morphisms, built from tensoring the supplied linear map. -/
noncomputable def canMap {N P : Type u} [AddCommGroup N] [Module R N]
    [AddCommGroup P] [Module R P] (f : N →ₗ[R] P) :
    Hom (can (R := R) (R₁ := R₁) (R₂ := R₂) (R₁₂ := R₁₂) N)
      (can (R := R) (R₁ := R₁) (R₂ := R₂) (R₁₂ := R₁₂) P) := by sorry
/-- Pure tensor computation determines the scalar extension on morphisms. -/
theorem canMap_tmul {N P : Type u} [AddCommGroup N] [Module R N]
    [AddCommGroup P] [Module R P] (f : N →ₗ[R] P) (a : R₁) (b : R₂) (c : R₁₂) (n : N) :
    (canMap (R := R) (R₁ := R₁) (R₂ := R₂) (R₁₂ := R₁₂) f).map₁ (a ⊗ₜ[R] n) = a ⊗ₜ[R] f n ∧
    (canMap (R := R) (R₁ := R₁) (R₂ := R₂) (R₁₂ := R₁₂) f).map₂ (b ⊗ₜ[R] n) = b ⊗ₜ[R] f n ∧
    (canMap (R := R) (R₁ := R₁) (R₂ := R₂) (R₁₂ := R₁₂) f).map₁₂ (c ⊗ₜ[R] n) = c ⊗ₜ[R] f n := by sorry
theorem canMap_id (N : Type u) [AddCommGroup N] [Module R N] :
    canMap (R := R) (R₁ := R₁) (R₂ := R₂) (R₁₂ := R₁₂) (LinearMap.id : N →ₗ[R] N) = Hom.id (can (R := R) N) := by sorry
theorem canMap_comp {N P Q : Type u} [AddCommGroup N] [Module R N]
    [AddCommGroup P] [Module R P] [AddCommGroup Q] [Module R Q]
    (g : P →ₗ[R] Q) (f : N →ₗ[R] P) :
    canMap (R := R) (R₁ := R₁) (R₂ := R₂) (R₁₂ := R₁₂) (g.comp f) = (canMap (R := R) g).comp (canMap (R := R) f) := by sorry
/-- The genuine Hom-set adjunction; no adjunction is supplied as a hypothesis. -/
noncomputable def can_sections_adjunction (N : Type u) [AddCommGroup N] [Module R N]
    (D : GlueingDatum R₁ R₂ R₁₂ M₁ M₂ M₁₂) :
    (N →ₗ[R] D.sections (R := R)) ≃ Hom (can (R := R) N) D := by sorry
theorem can_sections_adjunction_tmul (N : Type u) [AddCommGroup N] [Module R N]
    (D : GlueingDatum R₁ R₂ R₁₂ M₁ M₂ M₁₂) (f : N →ₗ[R] D.sections (R := R))
    (a : R₁) (b : R₂) (n : N) :
    ((can_sections_adjunction (R := R) N D) f).map₁ (a ⊗ₜ[R] n) = a • (f n).val.1 ∧
    ((can_sections_adjunction (R := R) N D) f).map₂ (b ⊗ₜ[R] n) = b • (f n).val.2 := by sorry
theorem can_sections_adjunction_symm_apply (N : Type u) [AddCommGroup N] [Module R N]
    (D : GlueingDatum R₁ R₂ R₁₂ M₁ M₂ M₁₂) (f : Hom (can (R := R) N) D) (n : N) :
    ((can_sections_adjunction (R := R) N D).symm f n).val =
      (f.map₁ (1 ⊗ₜ[R] n), f.map₂ (1 ⊗ₜ[R] n)) := by sorry
/-- The adjunction and the unit for flat targets give full faithfulness on
finite projective modules, without any effectivity assumption on other data. -/
theorem can_fullyFaithful_of_flat (h : ExactSquare R R₁ R₂ R₁₂)
    (M N : Type u) [AddCommGroup M] [Module R M] [AddCommGroup N] [Module R N] [Module.Flat R N] :
    Function.Bijective (canMap (R := R) (R₁ := R₁) (R₂ := R₂) (R₁₂ := R₁₂) :
      (M →ₗ[R] N) → Hom (can (R := R) (R₁ := R₁) (R₂ := R₂) (R₁₂ := R₁₂) M)
        (can (R := R) (R₁ := R₁) (R₂ := R₂) (R₁₂ := R₁₂) N)) := by sorry
/-- Componentwise tensor product, with the scalar-extension shuffle isomorphisms. -/
noncomputable def tensor (D : GlueingDatum R₁ R₂ R₁₂ M₁ M₂ M₁₂)
    (E : GlueingDatum R₁ R₂ R₁₂ N₁ N₂ N₁₂) :
    GlueingDatum R₁ R₂ R₁₂ (M₁ ⊗[R₁] N₁) (M₂ ⊗[R₂] N₂) (M₁₂ ⊗[R₁₂] N₁₂) := by sorry
/-- The canonical map exists for all data; bijectivity needs effectivity. -/
noncomputable def sectionsTensor (D : GlueingDatum R₁ R₂ R₁₂ M₁ M₂ M₁₂)
    (E : GlueingDatum R₁ R₂ R₁₂ N₁ N₂ N₁₂) :
    D.sections (R := R) ⊗[R] E.sections (R := R) →ₗ[R] (D.tensor E).sections (R := R) := by sorry
theorem sectionsTensor_tmul (x : D.sections (R := R)) (y : E.sections (R := R)) :
    (sectionsTensor D E (x ⊗ₜ[R] y)).val = (x.val.1 ⊗ₜ[R₁] y.val.1, x.val.2 ⊗ₜ[R₂] y.val.2) := by sorry
/-- Dual data require finite projectivity so dualization commutes with scalar extension. -/
noncomputable def dual (D : GlueingDatum R₁ R₂ R₁₂ M₁ M₂ M₁₂)
    [Module.Finite R₁ M₁] [Module.Projective R₁ M₁]
    [Module.Finite R₂ M₂] [Module.Projective R₂ M₂] :
    GlueingDatum R₁ R₂ R₁₂ (Module.Dual R₁ M₁) (Module.Dual R₂ M₂) (Module.Dual R₁₂ M₁₂) := by sorry
/-- Tensor compatibility for every effective finite projective datum, including
noncanonical transition maps. The two hypotheses are exactly KL 1.3.9(b). -/
theorem sectionsTensor_bijective (h : ExactSquare R R₁ R₂ R₁₂)
    (hsurj : ExactSquare.FiniteProjectiveSurjective (R := R) (R₁ := R₁) (R₂ := R₂) (R₁₂ := R₁₂))
    (hmax : ∀ m : Ideal R, m.IsMaximal →
      (∃ p : Ideal R₁, p.IsPrime ∧ p.comap (algebraMap R R₁) = m) ∨
      (∃ p : Ideal R₂, p.IsPrime ∧ p.comap (algebraMap R R₂) = m))
    [Module.Finite R₁ M₁] [Module.Projective R₁ M₁]
    [Module.Finite R₂ M₂] [Module.Projective R₂ M₂]
    [Module.Finite R₁ N₁] [Module.Projective R₁ N₁]
    [Module.Finite R₂ N₂] [Module.Projective R₂ N₂]
    (D : GlueingDatum R₁ R₂ R₁₂ M₁ M₂ M₁₂) (E : GlueingDatum R₁ R₂ R₁₂ N₁ N₂ N₁₂) :
    Function.Bijective (sectionsTensor (R := R) D E) := by sorry
/-- Dual compatibility for the same effective data; the dual carrier is
Mathlib's actual module of linear functionals. -/
noncomputable def dual_sections (h : ExactSquare R R₁ R₂ R₁₂)
    (hsurj : ExactSquare.FiniteProjectiveSurjective (R := R) (R₁ := R₁) (R₂ := R₂) (R₁₂ := R₁₂))
    (hmax : ∀ m : Ideal R, m.IsMaximal →
      (∃ p : Ideal R₁, p.IsPrime ∧ p.comap (algebraMap R R₁) = m) ∨
      (∃ p : Ideal R₂, p.IsPrime ∧ p.comap (algebraMap R R₂) = m))
    [Module.Finite R₁ M₁] [Module.Projective R₁ M₁]
    [Module.Finite R₂ M₂] [Module.Projective R₂ M₂]
    (D : GlueingDatum R₁ R₂ R₁₂ M₁ M₂ M₁₂) :
    Module.Dual R (D.sections (R := R)) ≃ₗ[R] D.dual.sections (R := R) := by sorry
/-- Tensor compatibility for canonical finite projective data over an exact square. -/
theorem tensor_can_compat (h : ExactSquare R R₁ R₂ R₁₂)
    (N P : Type u) [AddCommGroup N] [Module R N] [Module.Finite R N] [Module.Projective R N]
    [AddCommGroup P] [Module R P] [Module.Finite R P] [Module.Projective R P] :
    Function.Bijective ((sectionsTensor (R := R) (can (R := R) N) (can (R := R) P)).comp
      (TensorProduct.map (canUnit (R₁ := R₁) (R₂ := R₂) (R₁₂ := R₁₂) N)
        (canUnit (R₁ := R₁) (R₂ := R₂) (R₁₂ := R₁₂) P))) := by sorry
/-- Dual compatibility on canonical finite projective data. -/
noncomputable def dual_can_sections (h : ExactSquare R R₁ R₂ R₁₂)
    (N : Type u) [AddCommGroup N] [Module R N] [Module.Finite R N] [Module.Projective R N] :
    Module.Dual R ((can (R := R) (R₁ := R₁) (R₂ := R₂) (R₁₂ := R₁₂) N).sections (R := R)) ≃ₗ[R]
      ((can (R := R) (R₁ := R₁) (R₂ := R₂) (R₁₂ := R₁₂) N).dual).sections (R := R) := by sorry
/-- Naturality of the adjunction in the datum. -/
theorem can_sections_adjunction_natural_right (K : Type u) [AddCommGroup K] [Module R K]
    (f : K →ₗ[R] D.sections (R := R)) (g : Hom D E) :
    (can_sections_adjunction (R := R) K E) ((sectionsMap (R := R) g).comp f) =
      g.comp ((can_sections_adjunction (R := R) K D) f) := by sorry
/-- Naturality of the adjunction in the input module. -/
theorem can_sections_adjunction_natural_left (K L : Type u)
    [AddCommGroup K] [Module R K] [AddCommGroup L] [Module R L]
    (f : L →ₗ[R] K) (g : K →ₗ[R] D.sections (R := R)) :
    (can_sections_adjunction (R := R) L D) (g.comp f) =
      ((can_sections_adjunction (R := R) K D) g).comp
        (canMap (R := R) (R₁ := R₁) (R₂ := R₂) (R₁₂ := R₁₂) f) := by sorry
/-- Base change along a commuting map of the three non-base corners.
The target need not remain exact to construct the datum. -/
noncomputable def baseChange (D : GlueingDatum R₁ R₂ R₁₂ M₁ M₂ M₁₂)
    (S₁ S₂ S₁₂ : Type u) [CommRing S₁] [CommRing S₂] [CommRing S₁₂]
    [Algebra R₁ S₁] [Algebra R₂ S₂] [Algebra R₁₂ S₁₂]
    [Algebra S₁ S₁₂] [Algebra S₂ S₁₂] [Algebra R₁ S₁₂] [Algebra R₂ S₁₂]
    [IsScalarTower R₁ S₁ S₁₂] [IsScalarTower R₂ S₂ S₁₂]
    [IsScalarTower R₁ R₁₂ S₁₂] [IsScalarTower R₂ R₁₂ S₁₂] :
    GlueingDatum S₁ S₂ S₁₂ (S₁ ⊗[R₁] M₁) (S₂ ⊗[R₂] M₂) (S₁₂ ⊗[R₁₂] M₁₂) := by sorry
/-- Compatibility with Can, expressed by the canonical cancellation maps at all corners. -/
theorem baseChange_can (N : Type u) [AddCommGroup N] [Module R N]
    (S₁ S₂ S₁₂ : Type u) [CommRing S₁] [CommRing S₂] [CommRing S₁₂]
    [Algebra R₁ S₁] [Algebra R₂ S₂] [Algebra R₁₂ S₁₂]
    [Algebra S₁ S₁₂] [Algebra S₂ S₁₂] [Algebra R₁ S₁₂] [Algebra R₂ S₁₂]
    [Algebra R S₁] [Algebra R S₂] [Algebra R S₁₂]
    [IsScalarTower R R₁ S₁] [IsScalarTower R R₂ S₂] [IsScalarTower R R₁₂ S₁₂]
    [IsScalarTower R₁ S₁ S₁₂] [IsScalarTower R₂ S₂ S₁₂]
    [IsScalarTower R₁ R₁₂ S₁₂] [IsScalarTower R₂ R₁₂ S₁₂]
    [IsScalarTower R S₁ S₁₂] [IsScalarTower R S₂ S₁₂] :
    let B := (can (R := R) (R₁ := R₁) (R₂ := R₂) (R₁₂ := R₁₂) N).baseChange S₁ S₂ S₁₂
    let C := can (R := R) (R₁ := S₁) (R₂ := S₂) (R₁₂ := S₁₂) N
    ∃ f : Hom B C, Function.Bijective f.map₁ ∧ Function.Bijective f.map₂ ∧ Function.Bijective f.map₁₂ ∧
      (∀ a b n, f.map₁ (a ⊗ₜ[R₁] (b ⊗ₜ[R] n)) = (a * algebraMap R₁ S₁ b) ⊗ₜ[R] n) ∧
      (∀ a b n, f.map₂ (a ⊗ₜ[R₂] (b ⊗ₜ[R] n)) = (a * algebraMap R₂ S₂ b) ⊗ₜ[R] n) ∧
      (∀ a b n, f.map₁₂ (a ⊗ₜ[R₁₂] (b ⊗ₜ[R] n)) = (a * algebraMap R₁₂ S₁₂ b) ⊗ₜ[R] n) := by sorry
end GlueingDatum
end DatumAPI

/-! Concrete twisted Zariski datum: the second overlap identification multiplies by 3. -/
namespace TwistedZariski
abbrev Z₂ := Localization.Away (2 : ℤ)
abbrev Z₃ := Localization.Away (3 : ℤ)
abbrev Z₆ := Localization.Away ((2 : ℤ) * 3)
noncomputable instance : Algebra Z₂ Z₆ :=
  (IsLocalization.Away.awayToAwayRight (S := Z₂) (P := Z₆) (2 : ℤ) 3).toAlgebra
noncomputable instance : Algebra Z₃ Z₆ :=
  (IsLocalization.Away.awayToAwayLeft (S := Z₃) (P := Z₆) (3 : ℤ) 2).toAlgebra
instance : IsScalarTower ℤ Z₂ Z₆ := by sorry
instance : IsScalarTower ℤ Z₃ Z₆ := by sorry
noncomputable def third : Z₃ := IsLocalization.Away.invSelf (3 : ℤ)
/-- Multiplication by 3 on the overlap, with inverse multiplication by 1/3. -/
noncomputable def timesThree : Z₆ ≃ₗ[Z₆] Z₆ where
  toFun a := 3 * a
  invFun a := algebraMap Z₃ Z₆ third * a
  left_inv := by sorry
  right_inv := by sorry
  map_add' := by sorry
  map_smul' := by sorry
noncomputable def datum : GlueingDatum Z₂ Z₃ Z₆ Z₂ Z₃ Z₆ where
  ψ₁ := TensorProduct.AlgebraTensorModule.rid Z₂ Z₆ Z₆
  ψ₂ := (TensorProduct.AlgebraTensorModule.rid Z₃ Z₆ Z₆).trans timesThree
/-- This computation fixes the actual transition and its orientation. -/
theorem transition (a : Z₂) (b : Z₃) :
    datum.ψ₁ (1 ⊗ₜ[Z₂] a) = algebraMap Z₂ Z₆ a ∧
    datum.ψ₂ (1 ⊗ₜ[Z₃] b) = 3 * algebraMap Z₃ Z₆ b := by sorry
/-- The nontrivial section (1,1/3), rather than (3,1), generates over Z. -/
noncomputable def generator : datum.sections (R := ℤ) :=
  ⟨(1, third), by sorry⟩
/-- Every section is uniquely (k,k/3). This tests equalizer sections, not just the square. -/
theorem sections_computation (x : datum.sections (R := ℤ)) :
    ∃! k : ℤ, x.val = (algebraMap ℤ Z₂ k, algebraMap ℤ Z₃ k * third) := by sorry
/-- The concrete equalizer is a free rank-one Z-module. -/
noncomputable def sectionsEquiv : ℤ ≃ₗ[ℤ] datum.sections (R := ℤ) := by sorry
theorem sectionsEquiv_apply (k : ℤ) :
    (sectionsEquiv k).val = (algebraMap ℤ Z₂ k, algebraMap ℤ Z₃ k * third) := by sorry
theorem sectionsEquiv_one : sectionsEquiv 1 = generator := by sorry
/-- `GlueingDatum.sections_zariski_Z`: the computed section module and its generator. -/
example (x : datum.sections (R := ℤ)) :
    (∃! k : ℤ, x.val = (algebraMap ℤ Z₂ k, algebraMap ℤ Z₃ k * third)) ∧
    sectionsEquiv 1 = generator := by sorry
end TwistedZariski

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

/-- `GlueingPair.of_isUnit`: the completion is zero, but localization recovers the whole module. -/
example (f : R) (hf : IsUnit f) :
    Subsingleton (AdicCompletion (Ideal.span {f}) R) ∧
    GlueingPair (AdicCompletion (Ideal.span {f}) R) f ∧
    ∀ (M : Type u) [AddCommGroup M] [Module R M],
      Glueable (AdicCompletion (Ideal.span {f}) R) f M := by sorry

/-- `GlueingPair.noetherian_compat`: completion flatness gives glueability of every module, including torsion. -/
example [IsNoetherianRing R] (f : R) :
    Module.Flat R (AdicCompletion (Ideal.span {f}) R) ∧
    GlueingPair (AdicCompletion (Ideal.span {f}) R) f ∧
    ∀ (M : Type u) [AddCommGroup M] [Module R M],
      Glueable (AdicCompletion (Ideal.span {f}) R) f M := by sorry

/- The smooth-germ non-example has no pinned carrier for the ring of germs of smooth
real functions at 0 with its ideal of flat germs. It remains a mathematical test in the packet.
The polynomial quotient below does have a pinned carrier. -/
namespace StacksCounterexample
variable (k : Type u) [Field k]
abbrev P := MvPolynomial (Option ℕ) k
/-- `none` indexes f and `some n` indexes T_(n+1). -/
noncomputable def relations : Ideal (P k) := Ideal.span {r | r = MvPolynomial.X none * MvPolynomial.X (some 0) ∨
  ∃ n : ℕ, r = MvPolynomial.X none * MvPolynomial.X (some (n + 1)) - MvPolynomial.X (some n)}
abbrev Ring := P k ⧸ relations k
noncomputable def f : Ring k := Ideal.Quotient.mk (relations k) (MvPolynomial.X none)
noncomputable def first : Ring k := Ideal.Quotient.mk (relations k) (MvPolynomial.X (some 0))
/-- Actual torsion in every f-power disappears on completion (Stacks Example 15.92.9). -/
theorem not_glueing_pair :
    first k ≠ 0 ∧ f k * first k = 0 ∧
    algebraMap (Ring k) (AdicCompletion (Ideal.span {f k}) (Ring k)) (first k) = 0 ∧
    ¬ GlueingPair (AdicCompletion (Ideal.span {f k}) (Ring k)) (f k) := by sorry
/-- `GlueingPair.not_stacks_example`: nonzero torsion killed by completion. -/
example : first k ≠ 0 ∧ f k * first k = 0 ∧
    algebraMap (Ring k) (AdicCompletion (Ideal.span {f k}) (Ring k)) (first k) = 0 ∧
    ¬ GlueingPair (AdicCompletion (Ideal.span {f k}) (Ring k)) (f k) := by sorry
end StacksCounterexample

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

/-- Stacks 15.92.10 and 15.92.16: the unit is bijective precisely on the
glueable modules. L is the common localization, with both scalar towers. -/
theorem beauvilleLaszlo_glueable_unit {R' : Type u} [CommRing R'] [Algebra R R'] {f : R}
    (h : GlueingPair R' f) (L : Type u) [CommRing L] [Algebra R L] [Algebra R' L]
    [Algebra (Localization.Away f) L] [IsScalarTower R R' L]
    [IsScalarTower R (Localization.Away f) L] [IsLocalization.Away (algebraMap R R' f) L]
    (M : Type u) [AddCommGroup M] [Module R M] :
    Glueable R' f M ↔ Function.Bijective (GlueingDatum.canUnit (R := R) (R₁ := R')
      (R₂ := Localization.Away f) (R₁₂ := L) M) := by
  sorry

/-- Stacks 15.92.16: every module datum has glueable sections and bijective
canonical comparisons. No flatness, finiteness or projectivity is required. -/
theorem beauvilleLaszlo_sections {R' : Type u} [CommRing R'] [Algebra R R'] {f : R}
    (h : GlueingPair R' f) (L : Type u) [CommRing L] [Algebra R L] [Algebra R' L]
    [Algebra (Localization.Away f) L] [IsScalarTower R R' L]
    [IsScalarTower R (Localization.Away f) L] [IsLocalization.Away (algebraMap R R' f) L]
    (M' M₁ M₁₂ : Type u) [AddCommGroup M'] [Module R' M'] [Module R M']
    [IsScalarTower R R' M'] [AddCommGroup M₁] [Module (Localization.Away f) M₁]
    [Module R M₁] [IsScalarTower R (Localization.Away f) M₁]
    [AddCommGroup M₁₂] [Module L M₁₂]
    (D : GlueingDatum R' (Localization.Away f) L M' M₁ M₁₂) :
    Glueable R' f (D.sections (R := R)) ∧
      Function.Bijective (D.sectionsCompare (R := R)).1 ∧
      Function.Bijective (D.sectionsCompare (R := R)).2 := by
  sorry

/-- The fully faithful part of Stacks 15.92.16, using the actual compatible
triples of linear maps. Together with the preceding unit and counit statements
this specifies the equivalence on all glueable modules. -/
theorem beauvilleLaszlo_can_fullyFaithful {R' : Type u} [CommRing R'] [Algebra R R'] {f : R}
    (h : GlueingPair R' f) (L : Type u) [CommRing L] [Algebra R L] [Algebra R' L]
    [Algebra (Localization.Away f) L] [IsScalarTower R R' L]
    [IsScalarTower R (Localization.Away f) L] [IsLocalization.Away (algebraMap R R' f) L]
    (M N : Type u) [AddCommGroup M] [Module R M] [AddCommGroup N] [Module R N]
    (hM : Glueable R' f M) (hN : Glueable R' f N) :
    Function.Bijective (GlueingDatum.canMap (R := R) (R₁ := R')
      (R₂ := Localization.Away f) (R₁₂ := L) : (M →ₗ[R] N) →
        GlueingDatum.Hom (GlueingDatum.can (R := R) (R₁ := R') (R₂ := Localization.Away f) (R₁₂ := L) M)
          (GlueingDatum.can (R := R) (R₁ := R') (R₂ := Localization.Away f) (R₁₂ := L) N)) := by
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

/-- Generator invariance over actual localization carriers; the relative completion comparison
still needs RF2's geometric ring interface. -/
example {A : Type u} [CommRing A] (z : A) (v : Aˣ) :
    Nonempty (Localization.Away z ≃ₐ[A] Localization.Away ((v : A) * z)) := by sorry


/-! ## RF4:G-torsors — lifting trivialisations over the completed rings (Fargues–Scholze VI.1.7)

A torsor under a smooth group has a formally smooth coordinate algebra over `B⁺`. Since `B⁺` is
`I_S`-adically complete, so Mathlib's `Algebra.FormallySmooth.exists_mkₐ_comp_eq_of_isAdicComplete`
lifts a section modulo `I_S`. -/

/-- Baseline check for `v-descent-and-local-triviality`, lifting step: the pinned Mathlib lemma in the
form the proof uses (not a unit test of a new definition). -/
example {B T : Type u} [CommRing B] [CommRing T] [Algebra B T] [Algebra.FormallySmooth B T]
    (I : Ideal B) [IsAdicComplete I B] (s : T →ₐ[B] B ⧸ I) :
    ∃ s' : T →ₐ[B] B, (Ideal.Quotient.mkₐ B I).comp s' = s :=
  Algebra.FormallySmooth.exists_mkₐ_comp_eq_of_isAdicComplete s

/-- Baseline check: an `I`-adically complete ring is henselian along `I` (Mathlib instance), one henselianity input, which alone does not instantiate Gabber–Ramero 5.4.21. -/
example {B : Type u} [CommRing B] (I : Ideal B) [IsAdicComplete I B] : HenselianRing B I :=
  inferInstance

/-- The affine nonemptiness consequence of GR arXiv v3 Proposition 5.4.21, with I=R.
The completion and localization carriers are genuine. This does not identify a completed
pointed-etale stalk with a geometric divisor fiber; that is a separate RF2 request. -/
theorem henselian_approximation_affine_section {R : Type u} [CommRing R] (t : R)
    (ht : t ∈ nonZeroDivisors R) [HenselianRing R (Ideal.span {t})]
    (A B : Type u) [CommRing A] [CommRing B]
    [Algebra (Localization.Away t) A] [Algebra.Smooth (Localization.Away t) A]
    [Algebra R B] [Algebra (AdicCompletion (Ideal.span {t}) R) B]
    [IsScalarTower R (AdicCompletion (Ideal.span {t}) R) B]
    [IsLocalization.Away (algebraMap R (AdicCompletion (Ideal.span {t}) R) t) B]
    [Algebra (Localization.Away t) B] [IsScalarTower R (Localization.Away t) B]
    (sectionOnCompletion : A →ₐ[Localization.Away t] B) :
    Nonempty (A →ₐ[Localization.Away t] Localization.Away t) := by sorry

/-! ## Prototype register

The following specifications are comments, not Lean declarations or compiled tests.
The native algebra above covers the available module, completion, localization and quotient
carriers. Each remaining interface names its missing carrier below. The full arbitrary-input
comparison is a requested geometric contract. Nothing is replaced by an arbitrary proposition.
-/

/- CONTRACT `RelativeFarguesFontaine:RF4:vector-bundles/glueing-datum-over-exact-square` (definition).
  An exact square of commutative rings is a commuting square R -> R_1, R -> R_2, R_1 -> R_12, R_2 ->
  R_12 such that the sequence of R-modules 0 -> R -> R_1 (+) R_2 -> R_12 -> 0, whose last arrow is
  the difference (r_1, r_2) |-> r_1 - r_2 of the two maps, is exact. A glueing datum over it is a
  triple of modules M_1, M_2, M_12 over R_1, R_2, R_12 with isomorphisms psi_1 : M_1 (x)_{R_1} R_12
  = M_12 and psi_2 : M_2 (x)_{R_2} R_12 = M_12; a morphism of glueing data is a triple of linear
  maps commuting with psi_1 and psi_2. The datum is finite, resp. finite projective, when M_1, M_2,
  M_12 are finite, resp. finite projective, over their rings. Its module of sections is M =
  ker(psi_1 - psi_2 : M_1 (+) M_2 -> M_12), with natural R-linear maps M -> M_i adjoint to M (x)_R
  R_i -> M_i. Every R-module N gives the glueing datum Can(N) = (N (x) R_1, N (x) R_2, N (x) R_12,
  can, can). No topology is involved.
  Native core: ExactSquare, GlueingDatum, GlueingDatum.Hom, GlueingDatum.sections, GlueingDatum.sectionsCompare, GlueingDatum.can, GlueingDatum.canUnit, GlueingDatum.sectionsMap, GlueingDatum.canMap, GlueingDatum.can_sections_adjunction, GlueingDatum.tensor, GlueingDatum.sectionsTensor, GlueingDatum.dual, GlueingDatum.baseChange, TwistedZariski.datum, TwistedZariski.sections_computation, TwistedZariski.sectionsEquiv_one, GlueingDatum.canMap_tmul, GlueingDatum.can_fullyFaithful_of_flat, GlueingDatum.sectionsTensor_bijective, GlueingDatum.dual_sections.
  Morphisms, extensionality, naturality, identity/composition, tensor/dual and corner-base-change
  signatures are native. The baseChange_can signature uses restriction to the old base; the new-base
  form follows by tensor cancellation. The twisted-Z test computes the actual sections (k,k/3).
  API `ExactSquare`: An exact square: four commutative rings, the four ring maps, commutativity, and exactness of 0 -> R
    -> R_1 (+) R_2 -> R_12 -> 0.
  API `ExactSquare.exact`: An element of R_1 (+) R_2 lies in the image of R iff its two images in R_12 agree, R -> R_1 (+) R_2
    is injective, and R_1 (+) R_2 -> R_12 is surjective.
  API `GlueingDatum`: A glueing datum (M_1, M_2, M_12, psi_1, psi_2) over an exact square, with morphisms the compatible
    triples of linear maps.
  API `GlueingDatum.sections`: The module of sections M = ker(psi_1 - psi_2 : M_1 (+) M_2 -> M_12), an R-module, functorial in the
    datum.
  API `GlueingDatum.sectionsCompare`: The natural maps M (x)_R R_i -> M_i (i = 1, 2), compatible with psi_1, psi_2 after base change to
    R_12.
  API `GlueingDatum.can`: The functor Can : R-modules -> glueing data, N |-> (N (x) R_1, N (x) R_2, N (x) R_12, can, can),
    with map_id and map_comp.
  API `GlueingDatum.can_sections_adjunction`: Hom_R(N, sections(D)) = Hom(Can(N), D) naturally in N and D.
  API `GlueingDatum.sections_can_of_flat`: For a flat R-module N the unit N -> sections(Can N) is an isomorphism.
  API `GlueingDatum.tensor`: Tensor product and dual of finite projective glueing data, componentwise, with sections(Can N (x)
    Can N') compatible with N (x) N' for finite projective N, N'.
  API `GlueingDatum.baseChange`: For a map of exact squares (R -> R_1, R_2 -> R_12) -> (R' -> R'_1, R'_2 -> R'_12), base change of
    glueing data, compatible with Can.
  API `ExactSquare.ofGlueingSquare`: Every glueing square of complete Tate rings (AdicSpacesPartII:R3/glueing-square) is an exact square,
    its finite glueing data are glueing data here, and its module of sections is the module of
    sections here.
    OMITTED: The complete Tate glueing-square carrier is a planned R3 interface, not a declaration at the
    pin.
  API `ExactSquare.zariski`: For f, g in R generating the unit ideal, R -> R_f, R_g -> R_fg is an exact square.
  API `GlueingDatum.Hom`: Compatible triples of linear maps, commuting with the two overlap identifications; evaluation on
    pure tensors determines compatibility.
  API `GlueingDatum.Hom.ext`: Two compatible triples agree when their three component linear maps agree.
  API `GlueingDatum.Hom.id`: The componentwise identity is a compatible triple.
  API `GlueingDatum.Hom.comp`: Compatible triples compose componentwise and satisfy identity and associativity laws.
  API `GlueingDatum.sectionsMap`: A compatible triple sends a section (x1,x2) to (f1(x1),f2(x2)); it respects identities and
    composition.
  API `GlueingDatum.sections_ext`: Equality of both coordinates gives equality in the equalizer submodule.
  API `GlueingDatum.canMap`: Tensoring a linear map at the three corners defines its canonical datum morphism, with identity and
    composition laws.
  API `GlueingDatum.sectionsTensor`: The canonical map sections(D) tensor_R sections(E) to sections(D tensor E) sends pure tensors to the
    two component pure tensors. It is an isomorphism for effective finite-projective data, without
    asserting this for arbitrary data.
  API `GlueingDatum.dual`: For finite-projective pieces, form the componentwise dual datum using scalar-extension compatibility
    of duals; for canonical finite-projective data its sections are the dual of the sections.
  API `GlueingDatum.baseChange_can`: Extending the pieces of Can_R(N) along a commuting corner map gives the canonical datum with the new
    corners. Its comparison maps are tensor cancellation on pure tensors. For a map of base rings R
    to S this agrees with Can_S(S tensor_R N) by associativity.
  mathematical test `GlueingDatum.sections_zariski_Z`: For R = Z, f = 2, g = 3, the glueing datum (Z[1/2], Z[1/3], Z[1/6], id, multiplication by 3) has
    module of sections {(k, k/3) : k in Z}, free of rank one with generator (1, 1/3).
  mathematical test `GlueingDatum.sections_identitySquare`: For the identity square R = R_1 = R_2 = R_12 and a datum (M, M, M, id, id), the module of sections
    is the diagonal, isomorphic to M.
  mathematical test `ExactSquare.zariski_sections_can`: For the Zariski square of D(f), D(g) with (f, g) = R and any R-module N, sections(Can N) = N; this
    is gluing of quasicoherent sheaves on Spec R = D(f) u D(g).
  mathematical test `ExactSquare.not_exact_double_localization`: For R = k[x] and R_1 = R_2 = R_12 = k[x, 1/x], the square is not exact: the kernel of the difference
    is the diagonal k[x, 1/x], and sections(Can R) = k[x, 1/x] is not R.
-/

/- CONTRACT `RelativeFarguesFontaine:RF4:vector-bundles/finite-projective-glueing-over-exact-square` (theorem).
  Let R -> R_1, R_2 -> R_12 be an exact square. (i) For a finite glueing datum with module of sections
  M such that M (x)_R R_1 -> M_1 is surjective: psi_1 - psi_2 : M_1 (+) M_2 -> M_12 is surjective, M
  (x)_R R_2 -> M_2 is surjective, and a finitely generated submodule M_0 of M already surjects onto
  M_1 and M_2. (ii) Suppose M (x)_R R_1 -> M_1 is surjective for every finite projective glueing
  datum. Then for every finite projective glueing datum M is finitely presented and M (x)_R R_i ->
  M_i is bijective for i = 1, 2. (iii) If moreover the image of Spec(R_1 (+) R_2) -> Spec(R)
  contains every maximal ideal, M is finite projective; hence Can is an equivalence from finite
  projective R-modules to finite projective glueing data, with quasi-inverse the module of sections.
  Native core: finite_glueing_surjectivity, finiteProjective_glueing_finitePresentation, finiteProjective_glueing_effective, GlueingDatum.can_fullyFaithful_of_flat.
  All three algebraic clauses have native signatures: finite comparison surjectivity and
  simultaneous generators, finite presentation with both comparisons, and projective effectivity.
  The Hom adjunction and flat-target unit give full faithfulness. Packaging this as a category
  equivalence is a routine implementation step; no geometric carrier is needed.
-/

/- CONTRACT `RelativeFarguesFontaine:RF4:vector-bundles/finite-etale-glueing-over-exact-square` (theorem).
  Under the hypotheses of RF4:vector-bundles/finite-projective-glueing-over-exact-square (iii), the
  base change functor FEt(R) -> FEt(R_1) x_{FEt(R_12)} FEt(R_2) from finite etale R-algebras to
  compatible pairs of finite etale algebras is an equivalence of categories.
  Native core: finiteEtale_glueing, finiteEtale_can_fullyFaithful.
  Native signatures give object effectivity with the prescribed transition and unique descent of
  compatible algebra maps. Together they specify the equivalence; no geometric carrier is needed.
-/

/- CONTRACT `RelativeFarguesFontaine:RF4:vector-bundles/glueing-pair` (definition).
  Let R be a ring, f in R, and R -> R' a ring map inducing isomorphisms R/f^n R = R'/f^n R' for all n
  >= 1 (for example R' = R-hat = lim R/f^n R). (R -> R', f) is a glueing pair if 0 -> R -> R' (+)
  R_f -> R'_f -> 0 (last arrow the difference) is exact; equivalently R[f^oo] -> R'[f^oo] is
  bijective, where M[f^oo] is the f-power torsion. (R, f) is a glueing pair if (R -> R-hat, f) is
  one. An R-module M is glueable for (R -> R', f) if 0 -> M -> (M (x)_R R') (+) M_f -> M (x)_R R'_f
  -> 0 is exact, equivalently M[f^oo] -> (M (x)_R R')[f^oo] is bijective. A glueing pair is in
  particular an exact square R -> R', R_f -> R'_f.
  Native core: GlueingPair, GlueingPair.iff_torsion_bijective, GlueingPair.of_nonZeroDivisor, GlueingPair.of_flat, GlueingPair.toExactSquare, GlueingPair.quotient_equiv, GlueingPair.spec_surjective, Glueable, Glueable.iff_torsion, Glueable.of_flat, GlueingPair.iff_exact, StacksCounterexample.not_glueing_pair.
  The unit and noetherian examples state both the pair condition and every-module glueability; the
  noetherian example also states completion flatness. They are prototype assertions, with no claim
  that noetherian completion flatness is already proved in Mathlib.
  API `GlueingPair`: A ring map R -> R' and f in R with R/f^n = R'/f^n for all n and the exact sequence 0 -> R -> R' (+)
    R_f -> R'_f -> 0.
  API `GlueingPair.iff_torsion_bijective`: Assuming the ring map induces R/f^n R = R'/f^n R' for all positive n, (R -> R', f) is a glueing pair
    iff R[f^oo] -> R'[f^oo] is bijective (Stacks 15.92.6).
  API `GlueingPair.of_nonZeroDivisor`: If f is a nonzerodivisor of R then (R -> R-hat, f) is a glueing pair (Stacks 15.92.7).
  API `GlueingPair.of_flat`: If R -> R-hat is flat (for example R noetherian) then (R, f) is a glueing pair (Stacks 15.92.8).
  API `GlueingPair.toExactSquare`: A glueing pair is an exact square R -> R', R_f -> R'_f (RF4:vector-bundles/glueing-datum-over-exact-
    square).
  API `GlueingPair.quotient_equiv`: For a glueing pair (R -> R',f), the canonical map R/f^n R -> R'/f^n R' is an isomorphism for every
    n. In the completion case R'=R-hat these quotient isomorphisms hold without assuming the pair
    condition (Stacks 15.92.1).
  API `GlueingPair.spec_surjective`: Spec(R') u Spec(R_f) -> Spec(R) is surjective (Stacks 15.92.3), the maximal-ideal condition of the
    exact-square glueing theorem.
  API `Glueable`: The predicate: 0 -> M -> (M (x) R') (+) M_f -> M (x) R'_f -> 0 is exact.
  API `Glueable.iff_torsion`: For a glueing pair, M is glueable iff M[f^oo] -> (M (x) R')[f^oo] is injective (Stacks 15.92.10).
  API `Glueable.of_flat`: Flat R-modules are glueable (Stacks 15.92.11).
  mathematical test `GlueingPair.int_p`: For R = Z and f = p, R-hat = Z_p and 0 -> Z -> Z_p (+) Z[1/p] -> Q_p -> 0 is exact; (Z, p) is a
    glueing pair.
  mathematical test `GlueingPair.of_isUnit`: If f is a unit then R-hat = 0, R_f = R, the sequence is 0 -> R -> R -> 0 -> 0, every module is
    glueable and glueing data are R-modules.
  mathematical test `GlueingPair.noetherian_compat`: For R noetherian, Mathlib's AdicCompletion (Ideal.span {f}) R is flat over R, so (R, f) is a glueing
    pair and every R-module is glueable (Stacks 15.92.8, 15.92.11).
  mathematical test `GlueingPair.not_stacks_example`: For R = k[f, T_1, T_2, ...]/(f T_1, f T_2 - T_1, f T_3 - T_2, ...), (R, f) is not a glueing pair:
    T_1 is f-power torsion and nonzero in R but its image in R-hat is f-divisible, hence zero
    (Stacks Example 15.92.9).
  mathematical test `Glueable.not_smooth_germs`: For R the germs of smooth functions at 0 on the real line and f = x, the module R/phi R with phi =
    exp(-1/x^2) is not glueable although f is a nonzerodivisor (Stacks Example 15.92.12).
    OMITTED: No exported carrier for germs of smooth real functions at 0, their flat germ phi and quotient
    module; the algebraic infinite polynomial quotient counterexample is native.
-/

/- CONTRACT `RelativeFarguesFontaine:RF4:vector-bundles/beauville-laszlo-module-gluing` (theorem).
  Let (R -> R', f) be a glueing pair (for instance R' = R-hat, the f-adic completion, with f a
  nonzerodivisor of R). (a) The functor Can : M |-> (M (x)_R R', M_f, can) is an equivalence from
  the category of R-modules glueable for (R -> R', f) to the category of glueing data (M', M_1,
  alpha_1 : (M')_f = M_1 (x)_R R'), with quasi-inverse the module of sections. In particular
  (Scholze-Weinstein 5.2.9) for f a nonzerodivisor, R-modules M on which f is a nonzerodivisor are
  equivalent to triples (M_{R-hat}, M_{R[1/f]}, beta) with f a nonzerodivisor on the R-hat-module
  M_{R-hat} and beta : M_{R-hat}[1/f] = M_{R[1/f]} (x)_R R-hat. (b) An R-module M is flat, resp.
  finite projective, iff M (x)_R R' and M_f are flat, resp. finite projective; hence every finite
  projective glueing datum is Can of a finite projective R-module, unique up to unique isomorphism,
  and R -> R' x R_f is an effective descent morphism for finite projective modules. (c) For a flat M
  the sequence 0 -> M -> (M (x)_R R_f) (+) (M (x)_R R-hat) -> M (x)_R R-hat_f -> 0 is exact. The
  statement is not a case of fpqc descent: R -> R-hat need not be flat when R is not noetherian, and
  no descent datum over R-hat (x)_R R-hat is part of the data.
  Native core: beauvilleLaszlo_effective, beauvilleLaszlo_finiteProjective_iff, beauvilleLaszlo_flat_iff, beauvilleLaszlo_flat_exact, beauvilleLaszlo_glueable_unit, beauvilleLaszlo_sections, beauvilleLaszlo_can_fullyFaithful.
  Native signatures now cover the unit, arbitrary-datum sections and counit, and fully faithful
  Can on all glueable modules, as well as the finite-projective and flat clauses. The common
  localization and scalar towers are explicit. No geometric carrier is needed for this theorem.
-/

/- CONTRACT `RelativeFarguesFontaine:RF4:vector-bundles/modification-of-vector-bundles` (definition).
  Let X-cal be one of Y-curly_S, Y_S, X_S and D a closed Cartier divisor of X-cal attached to a map S
  -> Div^d_(-), with ideal sheaf I_D and E(kD) = E (x) I_D^(-k). For vector bundles E, E' on X-cal,
  a modification of E' at D is a pair (E, beta) with beta : E|_{X-cal minus D} = E'|_{X-cal minus D}
  an isomorphism of vector bundles on the open complement which is meromorphic along D: locally on S
  and X-cal there is some k >= 0 such that beta extends to a morphism E -> E'(kD) and beta^(-1)
  extends to a morphism E' -> E(kD) (through the inclusions E' -> E'(kD), E -> E(kD)). Such a k is a
  bound of the modification. A morphism (E_1, beta_1) -> (E_2, beta_2) is an isomorphism E_1 -> E_2
  whose restriction off D is beta_2^(-1) beta_1; modifications of E' at D form a groupoid Mod_D(E').
  Native core: localModificationsBoundedBy, anonymous ideal-inclusion example (nonunit regular local equation).
  Native cores express only the listed algebraic specializations. The mathematical specifications in
  comments are not native declarations or compiled tests of these objects.
  API `Modification`: A modification of E' at D: a vector bundle E with an isomorphism beta : E|_{X minus D} = E'|_{X
    minus D} meromorphic along D in both directions.
    OMITTED: The sheaf-theoretic curve, Cartier ideal, finite-locally-free bundle and restriction-to-open
    carriers from RF0-RF2 and R3 are not exported at the pinned baseline. The local finite-
    projective submodule model is native but does not construct this groupoid.
  API `Modification.extend`: For a bound k, the unique morphism E -> E'(kD) extending beta, and E' -> E(kD) extending beta^(-1).
    OMITTED: The sheaf-theoretic curve, Cartier ideal, finite-locally-free bundle and restriction-to-open
    carriers from RF0-RF2 and R3 are not exported at the pinned baseline. The local finite-
    projective submodule model is native but does not construct this groupoid.
  API `Modification.refl`: (E', id) is a modification of E' at D with bound 0.
    OMITTED: The sheaf-theoretic curve, Cartier ideal, finite-locally-free bundle and restriction-to-open
    carriers from RF0-RF2 and R3 are not exported at the pinned baseline. The local finite-
    projective submodule model is native but does not construct this groupoid.
  API `Modification.symm`: (E', beta^(-1)) is a modification of E at D with the same bound.
    OMITTED: The sheaf-theoretic curve, Cartier ideal, finite-locally-free bundle and restriction-to-open
    carriers from RF0-RF2 and R3 are not exported at the pinned baseline. The local finite-
    projective submodule model is native but does not construct this groupoid.
  API `Modification.trans`: Modifications bounded by k and l compose to one bounded by k + l.
    OMITTED: The sheaf-theoretic curve, Cartier ideal, finite-locally-free bundle and restriction-to-open
    carriers from RF0-RF2 and R3 are not exported at the pinned baseline. The local finite-
    projective submodule model is native but does not construct this groupoid.
  API `Modification.tensor`: The tensor product of modifications of E'_1 and E'_2 bounded by k and l is a modification of E'_1
    (x) E'_2 bounded by k + l; the dual of a modification bounded by k is bounded by k.
    OMITTED: The sheaf-theoretic curve, Cartier ideal, finite-locally-free bundle and restriction-to-open
    carriers from RF0-RF2 and R3 are not exported at the pinned baseline. The local finite-
    projective submodule model is native but does not construct this groupoid.
  API `Modification.pullback`: For T -> S, pullback of (E, beta) along X-cal_T -> X-cal_S is a modification at D_T; pullback along
    the identity is the identity and pullbacks compose.
    OMITTED: The sheaf-theoretic curve, Cartier ideal, finite-locally-free bundle and restriction-to-open
    carriers from RF0-RF2 and R3 are not exported at the pinned baseline. The local finite-
    projective submodule model is native but does not construct this groupoid.
  API `Modification.ext`: Two morphisms of modifications are equal iff they agree off D; (E_1, beta_1) and (E_2, beta_2) are
    isomorphic iff beta_2^(-1) beta_1 extends to an isomorphism E_1 = E_2.
    OMITTED: The sheaf-theoretic curve, Cartier ideal, finite-locally-free bundle and restriction-to-open
    carriers from RF0-RF2 and R3 are not exported at the pinned baseline. The local finite-
    projective submodule model is native but does not construct this groupoid.
  API `Modification.ofSubbundle`: An injective morphism E -> E' that is an isomorphism off D and whose image contains E'(-kD) defines
    a modification bounded by k.
    OMITTED: The sheaf-theoretic curve, Cartier ideal, finite-locally-free bundle and restriction-to-open
    carriers from RF0-RF2 and R3 are not exported at the pinned baseline. The local finite-
    projective submodule model is native but does not construct this groupoid.
  mathematical test `Modification.ideal_inclusion`: For D nonempty, the inclusion I_D = O(-D) -> O_X-cal restricts to an isomorphism off D and is a
    modification of O at D bounded by 1, not bounded by 0.
    OMITTED: The sheaf-theoretic curve, Cartier ideal, finite-locally-free bundle and restriction-to-open
    carriers from RF0-RF2 and R3 are not exported at the pinned baseline. The local finite-
    projective submodule model is native but does not construct this groupoid.
  mathematical test `Modification.empty_divisor`: For d = 0 (D empty) a modification of E' at D is an isomorphism E = E', and every bound works.
    OMITTED: The sheaf-theoretic curve, Cartier ideal, finite-locally-free bundle and restriction-to-open
    carriers from RF0-RF2 and R3 are not exported at the pinned baseline. The local finite-
    projective submodule model is native but does not construct this groupoid.
  mathematical test `Modification.ff_absolute`: For S = Spa(C^flat) a geometric point and D = infinity on X_FF, modifications of E' at D are exactly
    Fargues-Fontaine's modifications of E' supported at {infinity} (5.6.4.2): bundles E with E|_{X
    minus infinity} = E'|_{X minus infinity}.
    OMITTED: The sheaf-theoretic curve, Cartier ideal, finite-locally-free bundle and restriction-to-open
    carriers from RF0-RF2 and R3 are not exported at the pinned baseline. The local finite-
    projective submodule model is native but does not construct this groupoid.
  mathematical test `Modification.not_iso_off_D`: For a second degree-one divisor D' disjoint from D, the inclusion O -> O(D') is not a modification
    of O(D') at D: it is not an isomorphism on X-cal minus D.
    OMITTED: The sheaf-theoretic curve, Cartier ideal, finite-locally-free bundle and restriction-to-open
    carriers from RF0-RF2 and R3 are not exported at the pinned baseline. The local finite-
    projective submodule model is native but does not construct this groupoid.
-/

/- CONTRACT `RelativeFarguesFontaine:RF4:vector-bundles/meromorphic-modification-at-a-divisor` (theorem).
  Let X-cal be Y-curly_S, Y_S or X_S, D the divisor of a map S -> Div^d_(-), assumed affinoid, and E'
  a vector bundle on X-cal with completion E'-hat_D = Gamma(D, completion of E' along D), a finite
  projective B^+_D(S)-module. Then (E, beta) |-> Xi(E, beta) := beta(E-hat_D) is an equivalence from
  the groupoid Mod_D(E') of modifications of E' at D to the set of B^+_D(S)-lattices in
  E'-hat_D[1/I_D], i.e. finite projective B^+_D(S)-submodules Xi with Xi[1/I_D] = E'-hat_D[1/I_D]. A
  modification is bounded by k iff I_D^k E'-hat_D is contained in Xi and Xi in I_D^(-k) E'-hat_D. In
  particular the restriction E'|_{X-cal minus D} of this globally given reference bundle, a vector
  bundle on the formal neighbourhood (Xi) and an isomorphism on the punctured formal neighbourhood
  (Xi[1/I_D] = E'-hat_D[1/I_D]) determine a vector bundle on X-cal, and this fixed-reference gluing
  functor is fully faithful and essentially surjective. This does not assert effectivity for an
  arbitrary bundle given only off D; that stage target is planned separately by arbitrary-
  complement-formal-patching, with its precise comparison request and gap. Locally: on each sheafy
  affinoid chart U = Spa(A, A^+) meeting D on which I_D = xi A, the ring of completion along D
  intersect U is the xi-adic completion of A and the statement is RF4:vector-bundles/beauville-
  laszlo-module-gluing for the glueing pair (A, xi) combined with finite projective A-modules =
  vector bundles on U.
  No full geometric signature: the relative curve/divisor/bundle or Frobenius-shtuka categories
  occurring in this statement are not available at the pinned baseline; algebraic cores above do not
  supply those carriers.
-/

/- CONTRACT `RelativeFarguesFontaine:RF4:vector-bundles/arbitrary-complement-formal-patching` (theorem).
  Full stage target, conditional on the punctured-formal comparison requested from
  AdicSpacesPartII:R3: let E be any nonarchimedean local field, S an affinoid perfectoid F_q-space,
  X-cal one of curly-Y_S,Y_S,X_S, and D the effective Cartier divisor supplied by RF2, affine
  locally on S. The restriction of a vector bundle on X-cal to X-cal minus D and to its formal
  completion, with the canonical identification on the punctured formal neighbourhood, is an
  equivalence onto compatible triples (E_U,F,alpha), where E_U is an arbitrary vector bundle on the
  complement, F is a finite-locally-free bundle on the formal completion (a finite projective B_D-
  plus module when D is affinoid), and alpha identifies their realizations on that puncture. Arrows
  are the pairs of bundle maps compatible with alpha. No globally extended reference E-prime is part
  of these inputs. The missing supplier must define precisely which analytic/formal puncture is used
  and justify algebraic models for compatible data; this statement is a planning target, not a claim
  that every analytic bundle or morphism on a punctured chart comes from A[1/xi].
  No full geometric signature: the compatible analytic/formal puncture category and its chart
  comparison are the explicit R3 request.
-/

/- CONTRACT `RelativeFarguesFontaine:RF4:vector-bundles/gluing-exactness-tensor-and-base-change` (theorem).
  In the setting of RF4:vector-bundles/meromorphic-modification-at-a-divisor: (a) the lattice functor
  commutes with tensor products, duals and internal Hom: Xi(E_1 (x) E_2) = Xi(E_1) (x) Xi(E_2)
  inside (E'_1 (x) E'_2)-hat_D[1/I_D] and Xi(E^dual) = Xi(E)^dual; (b) it is exact: a sequence of
  modifications 0 -> E_1 -> E -> E_2 -> 0 of a short exact sequence 0 -> E'_1 -> E' -> E'_2 -> 0 is
  exact iff the sequence of lattices 0 -> Xi_1 -> Xi -> Xi_2 -> 0 is exact, and every exact sequence
  of lattices compatible with the completed sequence of the E' glues to an exact sequence of vector
  bundles; (c) it commutes with base change: for a map T -> S of affinoid perfectoid spaces with
  pulled-back divisor D_T, the pullback of (E, beta) corresponds to Xi (x)_{B^+_D(S)} B^+_{D_T}(T),
  compatibly with composition of base changes; (d) on the algebraic side, for a map of glueing pairs
  (R, f) -> (R_2, f_2) (a ring map with f |-> f_2 up to a unit), Can and the module of sections
  commute with base change of finite projective glueing data (coefficient change). The arbitrary-
  input equivalence of arbitrary-complement-formal-patching, once its comparison prerequisite is
  supplied, also commutes with tensor products, duals, short exact sequences and pullback: verify
  this on its chart module triples by the same arguments. This additional clause does not enlarge
  the proved fixed-reference theorem by assumption.
  No full geometric signature: the relative curve/divisor/bundle or Frobenius-shtuka categories
  occurring in this statement are not available at the pinned baseline; algebraic cores above do not
  supply those carriers.
-/

/- CONTRACT `RelativeFarguesFontaine:RF4:vector-bundles/disjoint-and-colliding-legs` (theorem).
  Let D_1, D_2 be divisors attached to S -> Div^{d_1}_(-), S -> Div^{d_2}_(-) and D = D_1 + D_2 the
  divisor attached to their sum in Div^{d_1 + d_2}, so I_D = I_{D_1} I_{D_2}. (a) Disjoint legs: if
  D_1 and D_2 are disjoint then B^+_D(S) = B^+_{D_1}(S) x B^+_{D_2}(S) and B_D(S) = B_{D_1}(S) x
  B_{D_2}(S); a lattice at D is a pair of lattices, and modifications of E' at D are equivalent to
  pairs consisting of a modification (E_1, beta_1) of E' at D_1 and a modification of E_1 at D_2
  (iterated gluing, in either order, canonically independent of the order). (b) Colliding legs: if D
  = m D_1 (all legs equal, m >= 1) then I_D = I_{D_1}^m, B^+_D(S) = B^+_{D_1}(S) and B_D(S) =
  B_{D_1}(S), and a modification is bounded by l at D iff it is bounded by m*l at D_1. A k-bound at
  D_1 implies a ceiling(k/m)-bound at D, while that bound at D implies only an m*ceiling(k/m)-bound
  at D_1. When a least global bound k_min exists, the least bound at D is ceiling(k_min/m). (c) For
  a locally finite family (D_n) of pairwise disjoint degree-one divisors of Y_S (for instance the
  Frobenius translates phi^n(D_0), n >= 1, on Y_{[0,oo)}), modifications of E' with locally finite
  support along the union and meromorphy bounded on each chart (no single global bound imposed) are
  equivalent to families of lattices (Xi_n) at each D_n.
  No full geometric signature: the relative curve/divisor/bundle or Frobenius-shtuka categories
  occurring in this statement are not available at the pinned baseline; algebraic cores above do not
  supply those carriers.
-/

/- CONTRACT `RelativeFarguesFontaine:RF4:vector-bundles/untilt-divisor-complement-affine` (theorem).
  Then (a) the open subscheme Proj(P_R) minus Z is affine; (b) the closed subscheme Z is a Cartier
  divisor contained in an open affine subscheme of Proj(P_R).
  No full geometric signature: the relative curve/divisor/bundle or Frobenius-shtuka categories
  occurring in this statement are not available at the pinned baseline; algebraic cores above do not
  supply those carriers.
-/

/- CONTRACT `RelativeFarguesFontaine:RF4:vector-bundles/relative-period-rings-Be-BdR` (construction).
  Define R_1 = B_e(A) by Spec(R_1) = Proj(P_R) minus Z (affine by RF4:vector-bundles/untilt-divisor-
  complement-affine (a)); R_2 = B^+_dR(A) by Spec(R_2) = the completion of Proj(P_R) along Z (affine
  by (b)); and R_3 = B_dR(A) by Spec(R_3) = Spec(R_1) x_{Proj(P_R)} Spec(R_2). Then R_2 is the
  ker(theta)-adic completion of R-tilde^{int,1}_R and R_3 = R_2[1/z] for any generator z of
  ker(theta); R_2 and R_3 are the rings B^+_D(S), B_D(S) of the degree-one untilt divisor D of
  RF2:untilts, and the triple is a relative version of Fontaine's (B_e, B^+_dR, B_dR).
  Native core: generator-invariance localization example.
  Native cores express only the listed algebraic specializations. The mathematical specifications in
  comments are not native declarations or compiled tests of these objects.
  API `RelativeBe`: R_1 = B_e(A) = O(Proj(P_R) minus Z), a Q_p-algebra functorial in (A, A^+).
    OMITTED: The relative Proj(P_R) curve, its untilt section and formal completion comparison are
    unavailable. Mathlib BDeRhamPlus/BDeRham exist only as the p-typical algebraic carriers;
    they do not define RelativeBe or identify the geometric relative completion.
  API `RelativeBdRPlus`: R_2 = B^+_dR(A), the ring of the completion of Proj(P_R) along Z.
    OMITTED: The relative Proj(P_R) curve, its untilt section and formal completion comparison are
    unavailable. Mathlib BDeRhamPlus/BDeRham exist only as the p-typical algebraic carriers;
    they do not define RelativeBe or identify the geometric relative completion.
  API `RelativeBdR`: R_3 = B_dR(A) = O(Spec R_1 x_{Proj} Spec R_2).
    OMITTED: The relative Proj(P_R) curve, its untilt section and formal completion comparison are
    unavailable. Mathlib BDeRhamPlus/BDeRham exist only as the p-typical algebraic carriers;
    they do not define RelativeBe or identify the geometric relative completion.
  API `RelativeBdR.eq_localization`: R_3 = R_2[1/z] for every generator z of ker(theta), and the localisation does not depend on z.
    OMITTED: The relative Proj(P_R) curve, its untilt section and formal completion comparison are
    unavailable. Mathlib BDeRhamPlus/BDeRham exist only as the p-typical algebraic carriers;
    they do not define RelativeBe or identify the geometric relative completion.
  API `RelativeBdRPlus.equiv_completedRing`: R_2 = B^+_D(S) and R_3 = B_D(S) for the degree-one divisor D of the untilt
    (RelativeFarguesFontaine:RF2:untilts/BdR-completion-and-filtration), compatibly with theta and
    the I_D-adic filtration.
    OMITTED: The relative Proj(P_R) curve, its untilt section and formal completion comparison are
    unavailable. Mathlib BDeRhamPlus/BDeRham exist only as the p-typical algebraic carriers;
    they do not define RelativeBe or identify the geometric relative completion.
  API `RelativeBdRPlus.equiv_mathlib`: In the p-typical case R_2 is canonically isomorphic to Mathlib's BDeRhamPlus A^+ p and R_3 to
    BDeRham A^+ p, through PadicHodgeTheory:R06.1/bdr-plus-of-perfectoid-affinoid-algebras.
    OMITTED: The relative Proj(P_R) curve, its untilt section and formal completion comparison are
    unavailable. Mathlib BDeRhamPlus/BDeRham exist only as the p-typical algebraic carriers;
    they do not define RelativeBe or identify the geometric relative completion.
  API `RelativeBe.restrict`: The restriction maps R_1 -> R_3 and R_2 -> R_3, and the localisation R_2 -> R_3.
    OMITTED: The relative Proj(P_R) curve, its untilt section and formal completion comparison are
    unavailable. Mathlib BDeRhamPlus/BDeRham exist only as the p-typical algebraic carriers;
    they do not define RelativeBe or identify the geometric relative completion.
  API `RelativeBe.map`: A morphism of perfectoid pairs (A, A^+) -> (A', A'^+) induces compatible maps R_i(A) -> R_i(A'),
    with map_id and map_comp.
    OMITTED: The relative Proj(P_R) curve, its untilt section and formal completion comparison are
    unavailable. Mathlib BDeRhamPlus/BDeRham exist only as the p-typical algebraic carriers;
    they do not define RelativeBe or identify the geometric relative completion.
  API `RelativeBe.atGeometricPoint`: For A = C complete algebraically closed, R_1 = B[1/t]^{phi = 1} = B_e for t in P_1 with V^+(t) =
    {infinity}.
    OMITTED: The relative Proj(P_R) curve, its untilt section and formal completion comparison are
    unavailable. Mathlib BDeRhamPlus/BDeRham exist only as the p-typical algebraic carriers;
    they do not define RelativeBe or identify the geometric relative completion.
  mathematical test `RelativeBe.fundamental_exact_sequence`: For A = C and a = 1: ker(R_1 (+) R_2 -> R_3) = Q_p and R_1 (+) R_2 -> R_3 is surjective; this is
    Fontaine's fundamental exact sequence 0 -> Q_p -> B_e -> B_dR/B^+_dR -> 0
    (PadicHodgeTheory:R06.1/fundamental-exact-sequence).
    OMITTED: The relative Proj(P_R) curve, its untilt section and formal completion comparison are
    unavailable. Mathlib BDeRhamPlus/BDeRham exist only as the p-typical algebraic carriers;
    they do not define RelativeBe or identify the geometric relative completion.
  mathematical test `RelativeBdR.localization_unit_invariant`: Replacing the generator z of ker(theta) by uz with u a unit of R_2 gives the same subring R_2[1/z] =
    R_2[1/(uz)] of R_3.
    OMITTED: The relative Proj(P_R) curve, its untilt section and formal completion comparison are
    unavailable. Mathlib BDeRhamPlus/BDeRham exist only as the p-typical algebraic carriers;
    they do not define RelativeBe or identify the geometric relative completion.
  mathematical test `RelativeBdRPlus.mathlib_compat`: For (A, A^+) = (C, O_C) with C/Q_p complete algebraically closed, R_2 is isomorphic to BDeRhamPlus
    O_C p and R_3 to BDeRham O_C p, compatibly with theta.
    OMITTED: The relative Proj(P_R) curve, its untilt section and formal completion comparison are
    unavailable. Mathlib BDeRhamPlus/BDeRham exist only as the p-typical algebraic carriers;
    they do not define RelativeBe or identify the geometric relative completion.
  mathematical test `RelativeBe.not_B_invert_t`: R_1 is not B[1/t]: at A = C the element 1/t of B[1/t] is not phi-invariant (phi(1/t) = p^(-1)
    t^(-1)), so it does not lie in B_e.
    OMITTED: The relative Proj(P_R) curve, its untilt section and formal completion comparison are
    unavailable. Mathlib BDeRhamPlus/BDeRham exist only as the p-typical algebraic carriers;
    they do not define RelativeBe or identify the geometric relative completion.
-/

/- CONTRACT `RelativeFarguesFontaine:RF4:vector-bundles/B-pair-cohomology` (theorem).
  With R_1, R_2, R_3 as in RF4:vector-bundles/relative-period-rings-Be-BdR, for every flat
  quasicoherent sheaf V on Proj(P_R) the cohomology of the complex 0 -> Gamma(Spec R_1, V) (+)
  Gamma(Spec R_2, V) -> Gamma(Spec R_3, V) -> 0, whose arrow is the difference of the two
  restriction maps, is naturally identified with H^i(Proj(P_R), V) (so H^i = 0 for i >= 2). At a
  geometric point (Fargues-Fontaine Proposition 5.3.3) for a vector bundle E with M = Gamma(X minus
  {infinity}, E) and N = E-hat_infinity: H^0(X, E) = M intersect N and H^1(X, E) = N[1/t]/(M + N).
  No full geometric signature: the relative curve/divisor/bundle or Frobenius-shtuka categories
  occurring in this statement are not available at the pinned baseline; algebraic cores above do not
  supply those carriers.
-/

/- CONTRACT `RelativeFarguesFontaine:RF4:vector-bundles/vector-bundles-as-relative-B-pairs` (theorem).
  (b) The morphism Spec(R_1 (+) R_2) -> Proj(P_R) is an effective descent morphism for quasicoherent
  finite locally free sheaves. (c) The category of vector bundles on Proj(P_R) is equivalent to the
  category of triples (V_1, V_2, iota) with V_1 a finite projective R_1 = B_e(A)-module, V_2 a
  finite projective R_2 = B^+_dR(A)-module and iota : V_1 (x)_{R_1} R_3 = V_2 (x)_{R_2} R_3 an
  isomorphism of R_3 = B_dR(A)-modules; the equivalence is compatible with tensor products and short
  exact sequences. By GAGA the same holds for vector bundles on the adic relative curve FF_R = X_S
  (Caraiani-Scholze Theorem 3.5.1). At a geometric point S = Spa(C^flat), where B_e is a principal
  ideal domain, vector bundles on X_FF are triples of finite free modules (Fargues-Fontaine
  Corollaire 5.3.2) and isomorphism classes of rank-n bundles are GL_n(B_e) \ GL_n(B_dR) /
  GL_n(B^+_dR).
  No full geometric signature: the relative curve/divisor/bundle or Frobenius-shtuka categories
  occurring in this statement are not available at the pinned baseline; algebraic cores above do not
  supply those carriers.
-/

/- CONTRACT `RelativeFarguesFontaine:RF4:vector-bundles/lattices-and-modifications-of-trivial-bundles` (comparison).
  (a) For S affinoid perfectoid with an untilt S^sharp over E, D = S^sharp the degree-one divisor of
  X_S, fix a finite free O_E-module T and the reference bundle F = T (x)_{O_E} O_{X_S}. The gluing
  of RF4:vector-bundles/meromorphic-modification-at-a-divisor gives an equivalence between
  B^+_dR(S^sharp)-lattices Xi in T (x)_{O_E} B_dR(S^sharp) and modifications (F', beta^(-1)) of this
  fixed F at D, where beta : F|_{X_S minus D} -> F'|_{X_S minus D} is meromorphic along D. If T
  varies, the output retains T and its identification with the reference bundle; forgetting this
  integral data does not give an equivalence of categories. (b) For S = Spa(C^flat) and E = Q_p,
  using the locally finite family of disjoint divisors phi^n(x_C), n >= 1, of Y_{[0,oo)}: the pairs
  (T, Xi) are equivalent to shtukas over Spa(C^flat) with one leg at phi^(-1)(x_C) (Scholze-
  Weinstein Proposition 12.4.6), and to quadruples (F, F', beta, T) with F trivial and T a Z_p-
  lattice in H^0(X_FF, F) (Theorem 14.1.1, (2) <=> (3)). (c) Minuscule case (Fargues-Fontaine
  8.3.1): lattices with t Xi_0 in Xi in Xi_0, Xi_0 = T (x) B^+_dR, correspond to C-subspaces of T
  (x) C, i.e. to modifications whose cokernel is killed by t.
  No full geometric signature: the relative curve/divisor/bundle or Frobenius-shtuka categories
  occurring in this statement are not available at the pinned baseline; algebraic cores above do not
  supply those carriers.
-/

/- CONTRACT `RelativeFarguesFontaine:RF4:vector-bundles/kedlaya-algebraicity-of-punctured-bundles` (theorem).
  Let R be a perfect Tate Huber ring of characteristic p, R^+ a ring of integral elements, x in R a
  topologically nilpotent unit (so x in R^+), and A = W(R^+) (p-typical Witt vectors). Let X-sch =
  Spec(A) minus V(p, [x]) and Y-ad = Spa(A, A) minus V(p, [x]), the analytic locus. Then pullback
  along the morphism of locally ringed spaces Y-ad -> X-sch is an equivalence Vec(X-sch) = Vec(Y-ad)
  (Kedlaya, Theorem 3.8). If moreover R^+ = o_K for a perfectoid field K of characteristic p, then
  finite free A-modules, vector bundles on Spa(A, A) and vector bundles on Spa(A, A) minus the
  closed point are equivalent (Kedlaya Theorem 3.9; Scholze-Weinstein Theorem 14.2.1), and so are
  vector bundles on Spec(A) minus the closed point (Scholze-Weinstein Lemma 14.2.3). For general R^+
  a vector bundle on Spec(A) minus {p = [x] = 0} need not extend to Spec(A) (Kedlaya Example 3.14).
  No full geometric signature: the relative curve/divisor/bundle or Frobenius-shtuka categories
  occurring in this statement are not available at the pinned baseline; algebraic cores above do not
  supply those carriers.
-/

/- CONTRACT `RelativeFarguesFontaine:RF4:G-torsors/meromorphic-G-modification` (definition).
  Let X-cal be Y_S or X_S, D the divisor of a map S -> Div^d_(-) and P, P' G-bundles on X-cal. A
  modification between P and P' at D is an isomorphism beta : P|_{X-cal minus D} = P'|_{X-cal minus
  D} of exact tensor functors on X-cal minus D such that for every V in Rep_E G the induced
  isomorphism beta_V : P(V)|_{X-cal minus D} = P'(V)|_{X-cal minus D} is meromorphic along D, i.e.
  extends to a morphism P(V) -> P'(V)(kD) for k >> 0 (Fargues-Scholze III.3). Applying this to
  V^dual shows that each beta_V is a modification of vector bundles in the sense of RF4:vector-
  bundles/modification-of-vector-bundles. Modifications between G-bundles at D form a groupoid, and
  G-modifications of a fixed P' at D form a groupoid Mod^G_D(P').
  Native cores express only the listed algebraic specializations. The mathematical specifications in
  comments are not native declarations or compiled tests of these objects.
  API `GModification`: A modification between G-bundles P and P' at D: an isomorphism of exact tensor functors off D,
    meromorphic on every representation.
    OMITTED: The pinned affine group-scheme and faithful-comodule carriers exist, but exact tensor functors
    into bundles on these adic curves, geometric torsors on them and their punctured-completion
    restriction do not. An arbitrary predicate would not encode this interface.
  API `GModification.toModification`: For V in Rep_E G, beta_V is a modification of P'(V) at D (RF4:vector-bundles/modification-of-vector-
    bundles), natural in V and compatible with tensor products and duals.
    OMITTED: The pinned affine group-scheme and faithful-comodule carriers exist, but exact tensor functors
    into bundles on these adic curves, geometric torsors on them and their punctured-completion
    restriction do not. An arbitrary predicate would not encode this interface.
  API `GModification.ofGL`: For G = GL_n, G-modifications are the modifications of the rank-n vector bundles P(std).
    OMITTED: The pinned affine group-scheme and faithful-comodule carriers exist, but exact tensor functors
    into bundles on these adic curves, geometric torsors on them and their punctured-completion
    restriction do not. An arbitrary predicate would not encode this interface.
  API `GModification.refl`: The identity of P is a modification between P and P.
    OMITTED: The pinned affine group-scheme and faithful-comodule carriers exist, but exact tensor functors
    into bundles on these adic curves, geometric torsors on them and their punctured-completion
    restriction do not. An arbitrary predicate would not encode this interface.
  API `GModification.symm`: The inverse of a modification is a modification.
    OMITTED: The pinned affine group-scheme and faithful-comodule carriers exist, but exact tensor functors
    into bundles on these adic curves, geometric torsors on them and their punctured-completion
    restriction do not. An arbitrary predicate would not encode this interface.
  API `GModification.trans`: The composite of modifications at D is a modification at D.
    OMITTED: The pinned affine group-scheme and faithful-comodule carriers exist, but exact tensor functors
    into bundles on these adic curves, geometric torsors on them and their punctured-completion
    restriction do not. An arbitrary predicate would not encode this interface.
  API `GModification.pushforward`: For rho : G -> H, rho_* beta (precomposition with Res : Rep H -> Rep G) is a modification between
    rho_* P and rho_* P'.
    OMITTED: The pinned affine group-scheme and faithful-comodule carriers exist, but exact tensor functors
    into bundles on these adic curves, geometric torsors on them and their punctured-completion
    restriction do not. An arbitrary predicate would not encode this interface.
  API `GModification.pullback`: Pullback along T -> S of affinoid perfectoid spaces, with map_id and map_comp.
    OMITTED: The pinned affine group-scheme and faithful-comodule carriers exist, but exact tensor functors
    into bundles on these adic curves, geometric torsors on them and their punctured-completion
    restriction do not. An arbitrary predicate would not encode this interface.
  API `GModification.ext`: Two modifications between P and P' are equal iff they agree on one faithful representation
    (equivalently off D on all representations).
    OMITTED: The pinned affine group-scheme and faithful-comodule carriers exist, but exact tensor functors
    into bundles on these adic curves, geometric torsors on them and their punctured-completion
    restriction do not. An arbitrary predicate would not encode this interface.
  mathematical test `GModification.gl_eq_modification`: For G = GL_n, the map beta |-> beta_std is a bijection from modifications between P and P' at D to
    modifications of the vector bundles P(std), P'(std) at D.
    OMITTED: The pinned affine group-scheme and faithful-comodule carriers exist, but exact tensor functors
    into bundles on these adic curves, geometric torsors on them and their punctured-completion
    restriction do not. An arbitrary predicate would not encode this interface.
  mathematical test `GModification.gm_geometric_point`: For G = G_m, S = Spa(C^flat) and D = infinity, the modifications of the trivial G_m-bundle at D are
    the line bundles O(-k), k in Z, with the lattice xi^k B^+_dR (xi a uniformiser of B^+_dR).
    OMITTED: The pinned affine group-scheme and faithful-comodule carriers exist, but exact tensor functors
    into bundles on these adic curves, geometric torsors on them and their punctured-completion
    restriction do not. An arbitrary predicate would not encode this interface.
  mathematical test `GModification.identity_degenerate`: For d = 0 (D empty) a modification between P and P' is an isomorphism of G-bundles P = P'.
    OMITTED: The pinned affine group-scheme and faithful-comodule carriers exist, but exact tensor functors
    into bundles on these adic curves, geometric torsors on them and their punctured-completion
    restriction do not. An arbitrary predicate would not encode this interface.
  mathematical test `GModification.not_iso_extension`: Meromorphy is not extension to an isomorphism over D: for G = G_m the inclusion O(-D) -> O is a
    modification between O(-D) and O at D, although it does not extend to an isomorphism of G_m-
    bundles on X-cal.
    OMITTED: The pinned affine group-scheme and faithful-comodule carriers exist, but exact tensor functors
    into bundles on these adic curves, geometric torsors on them and their punctured-completion
    restriction do not. An arbitrary predicate would not encode this interface.
-/

/- CONTRACT `RelativeFarguesFontaine:RF4:G-torsors/tannakian-transfer-of-gluing` (theorem).
  (i) Let G be a linear algebraic group over E, X-cal = Y_S or X_S, D the affinoid divisor of S ->
  Div^d_(-), and P' a G-bundle on X-cal with completion P'-hat_D (the exact tensor functor V |->
  P'(V)-hat_D to finite projective B^+_D(S)-modules). Then P |-> P-hat_D gives an equivalence
  between the groupoid of pairs (P, beta), beta a modification between P and P' at D
  (RF4:G-torsors/meromorphic-G-modification), and the groupoid of pairs (Q, alpha) with Q a G-torsor
  on Spec B^+_D(S) and alpha : Q|_{Spec B_D(S)} = P'-hat_D|_{Spec B_D(S)}. In particular every such
  (Q, alpha) is effective. For d = 1, S over Spd E with untilt S^sharp and P' trivial: G-torsors on
  Spec B^+_dR(R^sharp) with a trivialisation over B_dR(R^sharp) correspond to G-bundles on X_S with
  a modification of the trivial G-bundle at S^sharp (Fargues-Scholze III.3, Scholze-Weinstein
  Proposition 19.1.2). (ii) For G smooth affine over O_E and X-cal = Y-curly_S (or an open subset of
  S x Spa O_E as in Scholze-Weinstein 19.1.2) the same holds, with the O_E-integral Tannakian
  description of torsors. (iii) Conditional on arbitrary-complement-formal-patching and the
  requested BG0 dictionaries, an arbitrary G-bundle on the complement, a formal G-torsor and a
  compatible punctured-formal identification glue uniquely up to isomorphism to a G-bundle on X-cal.
  Apply the linear equivalence to each representation; this is distinct from the proved fixed-
  reference case (i).
  No full geometric signature: the relative curve/divisor/bundle or Frobenius-shtuka categories
  occurring in this statement are not available at the pinned baseline; algebraic cores above do not
  supply those carriers.
-/

/- CONTRACT `RelativeFarguesFontaine:RF4:G-torsors/faithful-representation-criterion` (theorem).
  Let G be a linear algebraic group over E and V in Rep_E G faithful. (a) An isomorphism beta :
  P|_{X-cal minus D} = P'|_{X-cal minus D} of G-bundles is a modification at D iff beta_V is a
  modification of the vector bundles P(V), P'(V) at D (both beta_V and beta_V^(-1) meromorphic). (b)
  Consequently the G-gluing of RF4:G-torsors/tannakian-transfer-of-gluing and its bounds may be
  computed with any faithful representation: if beta_V is bounded by k then for every tensor
  construction W = V^(x a) (x) (V^dual)^(x b) and every subquotient of a direct sum of copies of
  that tensor word, beta_W is bounded by (a + b) k. For a finite sum of tensor words of differing
  bidegrees (a_i,b_i), the bound is max_i(a_i + b_i) k.
  No full geometric signature: the relative curve/divisor/bundle or Frobenius-shtuka categories
  occurring in this statement are not available at the pinned baseline; algebraic cores above do not
  supply those carriers.
-/

/- CONTRACT `RelativeFarguesFontaine:RF4:G-torsors/change-of-structure-group` (theorem).
  Let rho : G -> H be a homomorphism of linear algebraic groups over E (resp. of smooth affine group
  schemes over O_E). (a) Pushforward rho_* (precomposition with the restriction functor Res_rho :
  Rep H -> Rep G) carries G-modifications at D to H-modifications at D, and commutes with the gluing
  of RF4:G-torsors/tannakian-transfer-of-gluing: rho_*(glue(Q, alpha)) = glue(rho_* Q, rho_* alpha),
  compatibly with composition (rho' rho)_* = rho'_* rho_*. (b) Over E, if rho is a closed immersion,
  an isomorphism of G-bundles off D is meromorphic along D iff its pushforward to H is.
  No full geometric signature: the relative curve/divisor/bundle or Frobenius-shtuka categories
  occurring in this statement are not available at the pinned baseline; algebraic cores above do not
  supply those carriers.
-/

/- CONTRACT `RelativeFarguesFontaine:RF4:G-torsors/base-change-and-divisor-compatibility` (theorem).
  (a) For a map f : T -> S of affinoid perfectoid spaces over F_q and D the divisor of S -> Div^d_(-),
  the G-gluing of RF4:G-torsors/tannakian-transfer-of-gluing commutes with pullback: f^* glue(Q,
  alpha) = glue(Q (x)_{B^+_D(S)} B^+_{D_T}(T), alpha_T), compatibly with composition of base
  changes. (b) For D = D_1 + D_2 with D_1, D_2 disjoint, G-torsors on Spec B^+_D(S) with an
  isomorphism over B_D(S) are pairs of such data at D_1 and D_2, and the gluing at D is the iterated
  gluing at D_1 and D_2; for colliding legs D = m D_1 the data at D and at D_1 coincide. (c) For
  arbitrary D_1, D_2, a chain of modifications at D_1 then D_2 has a composite meromorphic at D_1 +
  D_2: representationwise the local equations multiply, and the two finite pole bounds give a bound
  at the sum. This construction commutes with base change. An equivalence with pairs of independent
  lattice data is asserted only on the disjoint locus; on a collision locus the chain retains extra
  intermediate data.
  No full geometric signature: the relative curve/divisor/bundle or Frobenius-shtuka categories
  occurring in this statement are not available at the pinned baseline; algebraic cores above do not
  supply those carriers.
-/

/- CONTRACT `RelativeFarguesFontaine:RF4:G-torsors/v-descent-and-local-triviality` (theorem).
  (a) For S in Perf over F_q, U an open subset of S x Spa O_E (for example of Y-curly_S) and G smooth
  affine over O_E, the functor S' |-> {G-torsors on U x_{S x Spa O_E} (S' x Spa O_E)} is a v-stack
  on Perf_S (Scholze-Weinstein Proposition 19.5.3; Fargues-Scholze's footnote extends it from Z_p to
  O_E). (b) For S -> Div^d_(-) with D_S affinoid, vector bundles and G-bundles over B^+_{Div^d}(S)
  (G reductive over O_E, resp. over E) satisfy v-descent in S, and so do isomorphisms between two of
  them over B_{Div^d}(S). (c) Every G-bundle over B^+_{Div^d_{Y-curly}}(S), G reductive over O_E, is
  trivial etale-locally on S. The quotient presentations Hck = L^+G \ LG / L^+G and Gr = LG / L^+G
  that Fargues-Scholze deduce from (b) and (c) are GeometricSatakeAndFusion:GS0:loop-geometry's and
  are not planned here.
  Native core: henselian_approximation_affine_section, formally-smooth section lifting baseline example.
  No full geometric signature: the relative curve/divisor/bundle or Frobenius-shtuka categories
  occurring in this statement are not available at the pinned baseline; algebraic cores above do not
  supply those carriers.
-/

/- CONTRACT `RelativeFarguesFontaine:RF4:G-torsors/modification-of-G-bundle-by-lattice` (construction).
  Let S be a perfectoid space over Spd E (untilt S^sharp over E, D = S^sharp the degree-one divisor of
  X_S), G a linear algebraic group over E, P a G-bundle on X_S and L a G(B^+_dR)-lattice on the
  G(B_dR)-torsor P|_{B_dR}: a G-torsor Q on Spec B^+_dR(R^sharp), given etale-locally on S, with
  alpha : Q|_{B_dR} = P-hat_D|_{B_dR}. The modification P_L of P by L is the G-bundle on X_S glued
  from (P, Q, alpha) by RF4:G-torsors/tannakian-transfer-of-gluing, with its canonical modification
  P_L|_{X_S minus D} = P|_{X_S minus D}. It is functorial in (P, L), compatible with pullback in S
  and with pushforward along homomorphisms of groups. For P trivial it is the map E from G-torsors
  on Spec B^+_dR trivialised over B_dR to G-bundles on X_S of Caraiani-Scholze Corollary 3.5.2 and
  Fargues-Scholze III.3; identifying its source with Gr_G(S) is GeometricSatakeAndFusion:GS0:loop-
  geometry's, and the resulting Beauville-Laszlo morphism Gr_G -> Bun_G is exported to
  BG2:uniformization, HS0 and HS2.
  Native cores express only the listed algebraic specializations. The mathematical specifications in
  comments are not native declarations or compiled tests of these objects.
  API `modify`: The G-bundle P_L on X_S attached to a G-bundle P and a G(B^+_dR)-lattice L on P|_{B_dR}.
    OMITTED: The geometric G-bundle and relative B_D torsor groupoids and the representationwise gluing
    functor from BG0/RF4 are unavailable. AffineGroupSchemeCat alone is not their carrier.
  API `modify.modification`: The canonical modification P_L|_{X_S minus D} = P|_{X_S minus D}, meromorphic along D.
    OMITTED: The geometric G-bundle and relative B_D torsor groupoids and the representationwise gluing
    functor from BG0/RF4 are unavailable. AffineGroupSchemeCat alone is not their carrier.
  API `modify_tautological`: For the tautological lattice L = P-hat_D, P_L = P with the identity modification.
    OMITTED: The geometric G-bundle and relative B_D torsor groupoids and the representationwise gluing
    functor from BG0/RF4 are unavailable. AffineGroupSchemeCat alone is not their carrier.
  API `modify_comp`: For L a lattice on P|_{B_dR} and L' a lattice on P_L|_{B_dR} = P|_{B_dR}, (P_L)_{L'} = P_{L'}.
    OMITTED: The geometric G-bundle and relative B_D torsor groupoids and the representationwise gluing
    functor from BG0/RF4 are unavailable. AffineGroupSchemeCat alone is not their carrier.
  API `modify.pullback`: For T -> S, (P_L)_T = (P_T)_{L_T}; compatible with composition.
    OMITTED: The geometric G-bundle and relative B_D torsor groupoids and the representationwise gluing
    functor from BG0/RF4 are unavailable. AffineGroupSchemeCat alone is not their carrier.
  API `modify.pushforward`: For rho : G -> H, rho_*(P_L) = (rho_* P)_{rho_* L}.
    OMITTED: The geometric G-bundle and relative B_D torsor groupoids and the representationwise gluing
    functor from BG0/RF4 are unavailable. AffineGroupSchemeCat alone is not their carrier.
  API `modify_gl`: For G = GL_n, P_L is the bundle glued by RF4:vector-bundles/meromorphic-modification-at-a-divisor
    from P(std) and the lattice L(std).
    OMITTED: The geometric G-bundle and relative B_D torsor groupoids and the representationwise gluing
    functor from BG0/RF4 are unavailable. AffineGroupSchemeCat alone is not their carrier.
  API `modify.characterisation`: P_L is the unique G-bundle with a modification to P at D whose completion at D is L
    (RF4:G-torsors/tannakian-transfer-of-gluing).
    OMITTED: The geometric G-bundle and relative B_D torsor groupoids and the representationwise gluing
    functor from BG0/RF4 are unavailable. AffineGroupSchemeCat alone is not their carrier.
  mathematical test `modify_gl_compat`: For G = GL_n and P trivial, P_L is the rank-n vector bundle obtained by gluing the B^+_dR-lattice L
    in B_dR^n to the trivial bundle off D, as in Caraiani-Scholze 3.5.1.
    OMITTED: The geometric G-bundle and relative B_D torsor groupoids and the representationwise gluing
    functor from BG0/RF4 are unavailable. AffineGroupSchemeCat alone is not their carrier.
  mathematical test `modify_gm_degree`: For G = G_m, S = Spa(C^flat), P trivial and L = xi^k B^+_dR, P_L = O(-k), of degree -k.
    OMITTED: The geometric G-bundle and relative B_D torsor groupoids and the representationwise gluing
    functor from BG0/RF4 are unavailable. AffineGroupSchemeCat alone is not their carrier.
  mathematical test `modify_tautological_eq`: For the tautological lattice L = P-hat_D the modification P_L is P, with the identity modification.
    OMITTED: The geometric G-bundle and relative B_D torsor groupoids and the representationwise gluing
    functor from BG0/RF4 are unavailable. AffineGroupSchemeCat alone is not their carrier.
  mathematical test `modify_SL2_nonlattice`: For G = SL_2 and P trivial, the B^+_dR-lattice xi B^+_dR (+) B^+_dR of B_dR^2 has determinant
    lattice xi B^+_dR, so it is not an SL_2(B^+_dR)-lattice of the trivial SL_2-torsor and does not
    define an SL_2-modification, although it defines a GL_2-modification.
    OMITTED: The geometric G-bundle and relative B_D torsor groupoids and the representationwise gluing
    functor from BG0/RF4 are unavailable. AffineGroupSchemeCat alone is not their carrier.
-/

end TauCeti
