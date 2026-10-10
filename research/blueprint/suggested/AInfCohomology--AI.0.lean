import Mathlib.Algebra.Category.ModuleCat.Basic
import Mathlib.Algebra.Category.ModuleCat.Abelian
import Mathlib.Algebra.Category.ModuleCat.ChangeOfRings
import Mathlib.Algebra.Category.ModuleCat.Monoidal.Symmetric
import Mathlib.Algebra.Homology.DerivedCategory.Basic
import Mathlib.Algebra.Homology.Monoidal
import Mathlib.Algebra.Module.FinitePresentation
import Mathlib.Algebra.Module.LocalizedModule.Basic
import Mathlib.RingTheory.WittVector.Frobenius
import Mathlib.RingTheory.WittVector.Teichmuller
import Mathlib.RingTheory.WittVector.Truncated
import Mathlib.RingTheory.Perfectoid.FontaineTheta
import Mathlib.RingTheory.Perfectoid.BDeRham
import Mathlib.RingTheory.AdicCompletion.Basic
import Mathlib.RingTheory.AdicCompletion.Algebra
import Mathlib.Topology.ContinuousMap.Algebra
import Mathlib.RingTheory.Kaehler.Basic
import Mathlib.NumberTheory.Padics.PadicIntegers
import Mathlib.Algebra.Module.Projective
import Mathlib.Algebra.Polynomial.Laurent
import Mathlib.Algebra.Category.ModuleCat.Sheaf
import Mathlib.Algebra.Homology.HomologicalComplex
import Mathlib.Algebra.Polynomial.Basic
import Mathlib.Data.Finsupp.Defs
import Mathlib.RingTheory.PowerSeries.Basic
import Mathlib.RingTheory.Valuation.ValuationRing
import Mathlib.Algebra.Homology.Embedding.TruncLE
import Mathlib.Algebra.Homology.Embedding.TruncGE
import Mathlib.CategoryTheory.Filtered.Basic
import Mathlib.RingTheory.Length
import Mathlib.RingTheory.Etale.Basic
import Mathlib.RingTheory.Localization.AtPrime.Basic
import Mathlib.RingTheory.Spectrum.Prime.Basic
import Mathlib.FieldTheory.IsAlgClosed.Basic
import Mathlib.RingTheory.WittVector.Isocrystal

/-!
# A_inf cohomology: suggested interfaces

BP-AInfCohomology--AI.0~2; Codex, codex-lnF2Fv.
Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.

This file is not the roadmap and is not exhaustive. The accompanying roadmap
is definitive. These statements suggest Lean forms so that contributors and
reviewers converge on names and signatures. Proof placeholders are intentional;
no declaration is claimed implemented or formally proved.

Unavailable conditions are omitted explicitly at the relevant interface. In
particular the ringed pro-etale site, derived completion, derived tensor,
K-flatness, invertible ideal sheaves, coherent E_infinity structures, perfectoid
geometry and continuous Galois conditions are specified in the packet, not
replaced here by opaque propositions or fields asserting the desired theorem.
Affine normalized representatives use actual Mathlib complexes, modules,
localizations, Witt vectors, submodules, sheaves and derived categories.
Named comments immediately preceding examples give the packet's test names.

Conventions: cohomological Z grading; the chosen generator f trivializes the
line factors. The terms below are the NORMALIZED model, not literal submodules
f^i C^i of an unlocalized module in negative degrees.
-/

noncomputable section
open CategoryTheory

universe u v
namespace TauCeti.Decalage
variable {R : Type u} [CommRing R]

/-- Local divisibility submodule. Defined even when f has torsion. -/
def etaTerm (f : R) (C : CochainComplex (ModuleCat.{v} R) ℤ) (i : ℤ) :
    Submodule R (C.X i) where
  carrier := {x | ∃ y : C.X (i + 1), f • y = (C.d i (i + 1)).hom x}
  zero_mem' := by sorry
  add_mem' := by sorry
  smul_mem' := by sorry

theorem etaTerm_mk (f : R) (C : CochainComplex (ModuleCat.{v} R) ℤ) (i : ℤ)
    (x : C.X i) (y : C.X (i + 1))
    (h : f • y = (C.d i (i + 1)).hom x) : x ∈ etaTerm f C i := by
  exact ⟨y, h⟩

def etaTerm_coe (f : R) (C : CochainComplex (ModuleCat.{v} R) ℤ) (i : ℤ) :
    etaTerm f C i →ₗ[R] C.X i := (etaTerm f C i).subtype

theorem etaTerm_ext (f : R) (C : CochainComplex (ModuleCat.{v} R) ℤ) (i : ℤ)
    (x y : etaTerm f C i) (h : (x : C.X i) = (y : C.X i)) : x = y :=
  Subtype.ext h

/-- The witness is unique; its next original differential is zero. -/
def etaDifferential (f : R) (C : CochainComplex (ModuleCat.{v} R) ℤ)
    (hC : ∀ i : ℤ, Function.Injective (fun x : C.X i => f • x)) (i : ℤ) :
    etaTerm f C i →ₗ[R] etaTerm f C (i + 1) := by sorry

/-- Node principal-differential-spec: promoted from the API. -/
theorem etaDifferential_spec (f : R) (C : CochainComplex (ModuleCat.{v} R) ℤ)
    (hC : ∀ i : ℤ, Function.Injective (fun x : C.X i => f • x)) (i : ℤ)
    (x : etaTerm f C i) :
    f • (etaDifferential f C hC i x : C.X (i + 1)) =
      (C.d i (i + 1)).hom (x : C.X i) := by sorry

theorem etaDifferential_unique (f : R) (C : CochainComplex (ModuleCat.{v} R) ℤ)
    (hC : ∀ i : ℤ, Function.Injective (fun x : C.X i => f • x)) (i : ℤ)
    (x : etaTerm f C i) (y : etaTerm f C (i + 1))
    (hy : f • (y : C.X (i + 1)) = (C.d i (i + 1)).hom (x : C.X i)) :
    etaDifferential f C hC i x = y := by sorry

theorem etaDifferential_add (f : R) (C : CochainComplex (ModuleCat.{v} R) ℤ)
    (hC : ∀ i : ℤ, Function.Injective (fun x : C.X i => f • x)) (i : ℤ)
    (x y : etaTerm f C i) :
    etaDifferential f C hC i (x + y) =
      etaDifferential f C hC i x + etaDifferential f C hC i y := by
  exact map_add _ _ _

/-- Node principal-differential-square. -/
theorem etaDifferential_square (f : R) (C : CochainComplex (ModuleCat.{v} R) ℤ)
    (hC : ∀ i : ℤ, Function.Injective (fun x : C.X i => f • x)) (i : ℤ)
    (x : etaTerm f C i) :
    etaDifferential f C hC (i + 1) (etaDifferential f C hC i x) = 0 := by sorry

/-- Reuses the Z-indexed Mathlib constructor, not a second complex type. -/
def etaComplex (f : R) (C : CochainComplex (ModuleCat.{v} R) ℤ)
    (hC : ∀ i : ℤ, Function.Injective (fun x : C.X i => f • x)) :
    CochainComplex (ModuleCat.{v} R) ℤ :=
  CochainComplex.of (fun i => ModuleCat.of R (etaTerm f C i))
    (fun i => ModuleCat.ofHom (etaDifferential f C hC i)) (by
      intro i
      sorry)

theorem etaComplex_term (f : R) (C : CochainComplex (ModuleCat.{v} R) ℤ)
    (hC : ∀ i : ℤ, Function.Injective (fun x : C.X i => f • x)) (i : ℤ) :
    (etaComplex f C hC).X i = ModuleCat.of R (etaTerm f C i) := rfl

theorem etaComplex_d (f : R) (C : CochainComplex (ModuleCat.{v} R) ℤ)
    (hC : ∀ i : ℤ, Function.Injective (fun x : C.X i => f • x)) (i : ℤ) :
    (etaComplex f C hC).d i (i + 1) =
      ModuleCat.ofHom (etaDifferential f C hC i) := by sorry

theorem etaComplex_torsionFree (f : R) (C : CochainComplex (ModuleCat.{v} R) ℤ)
    (hC : ∀ i : ℤ, Function.Injective (fun x : C.X i => f • x)) (i : ℤ) :
    Function.Injective (fun x : (etaComplex f C hC).X i => f • x) := by sorry

/-- Restriction of a chain map; the output square uses target f-injectivity. -/
def etaMap (f : R) (C D : CochainComplex (ModuleCat.{v} R) ℤ)
    (hC : ∀ i : ℤ, Function.Injective (fun x : C.X i => f • x))
    (hD : ∀ i : ℤ, Function.Injective (fun x : D.X i => f • x)) (u : C ⟶ D) :
    etaComplex f C hC ⟶ etaComplex f D hD := by sorry

/-- Node principal-map-component: promoted from the API. -/
theorem etaMap_component (f : R) (C D : CochainComplex (ModuleCat.{v} R) ℤ)
    (hC : ∀ i : ℤ, Function.Injective (fun x : C.X i => f • x))
    (hD : ∀ i : ℤ, Function.Injective (fun x : D.X i => f • x))
    (u : C ⟶ D) (i : ℤ) (x : etaTerm f C i) :
    (((etaMap f C D hC hD u).f i).hom x).val =
      (u.f i).hom (x : C.X i) := by sorry

theorem etaMap_id (f : R) (C : CochainComplex (ModuleCat.{v} R) ℤ)
    (hC : ∀ i : ℤ, Function.Injective (fun x : C.X i => f • x)) :
    etaMap f C C hC hC (𝟙 C) = 𝟙 (etaComplex f C hC) := by sorry

theorem etaMap_comp (f : R) (C D E : CochainComplex (ModuleCat.{v} R) ℤ)
    (hC : ∀ i : ℤ, Function.Injective (fun x : C.X i => f • x))
    (hD : ∀ i : ℤ, Function.Injective (fun x : D.X i => f • x))
    (hE : ∀ i : ℤ, Function.Injective (fun x : E.X i => f • x))
    (u : C ⟶ D) (v : D ⟶ E) :
    etaMap f C E hC hE (u ≫ v) =
      etaMap f C D hC hD u ≫ etaMap f D E hD hE v := by sorry

/-! Literal two-term test fixtures built with Mathlib's complex constructor.
These private fixtures are not proposed replacement library carriers. -/
private def testTerms (R : Type u) [CommRing R] (k i : ℤ) : ModuleCat.{u} R :=
  if i = k ∨ i = k + 1 then ModuleCat.of R R else ModuleCat.of R (Fin 0 → R)

private def testDifferential (k : ℤ) (g : R) (i : ℤ) :
    testTerms R k i ⟶ testTerms R k (i + 1) := by
  classical
  by_cases hi : i = k
  · subst i
    simpa [testTerms] using ModuleCat.ofHom (g • (LinearMap.id : R →ₗ[R] R))
  · exact 0

private def twoTermAt (k : ℤ) (g : R) : CochainComplex (ModuleCat.{u} R) ℤ :=
  CochainComplex.of (testTerms R k) (testDifferential k g) (by intro i; sorry)

private theorem twoTerm_torsionFree (k : ℤ) (f g : R)
    (hf : Function.Injective (fun x : R => f * x)) :
    ∀ i : ℤ, Function.Injective (fun x : (twoTermAt k g).X i => f • x) := by sorry

private def zeroTestComplex (R : Type u) [CommRing R] :
    CochainComplex (ModuleCat.{u} R) ℤ :=
  CochainComplex.of (fun _ => ModuleCat.of R (Fin 0 → R)) (fun _ => 0)
    (by intro i; simp)

private theorem zeroTest_torsionFree (f : R) :
    ∀ i : ℤ, Function.Injective (fun x : (zeroTestComplex R).X i => f • x) := by sorry

/-! principal-term: three tests. -/
-- term_unit
example (C : CochainComplex (ModuleCat.{v} R) ℤ) (i : ℤ) :
    etaTerm (1 : R) C i = ⊤ := by sorry

-- term_zero
example (C : CochainComplex (ModuleCat.{v} R) ℤ) (i : ℤ) :
    etaTerm (0 : R) C i = LinearMap.ker (C.d i (i + 1)).hom := by sorry

-- term_nondivisible
example : (1 : ℤ) ∉ etaTerm (2 : ℤ) (twoTermAt 0 (1 : ℤ)) 0 := by sorry

/-! principal-differential: three tests. -/
-- divided_unit
example (C : CochainComplex (ModuleCat.{v} R) ℤ)
    (hC : ∀ i : ℤ, Function.Injective (fun x : C.X i => (1 : R) • x))
    (i : ℤ) (x : etaTerm (1 : R) C i) :
    (etaDifferential 1 C hC i x : C.X (i + 1)) =
      (C.d i (i + 1)).hom (x : C.X i) := by sorry

-- divided_cycle
example (f : R) (C : CochainComplex (ModuleCat.{v} R) ℤ)
    (hC : ∀ i : ℤ, Function.Injective (fun x : C.X i => f • x))
    (i : ℤ) (x : etaTerm f C i) (hx : (C.d i (i + 1)).hom (x : C.X i) = 0) :
    etaDifferential f C hC i x = 0 := by sorry

-- divided_once
example (hf : Function.Injective (fun z : ℤ => (2 : ℤ) * z))
    (x : etaTerm (2 : ℤ) (twoTermAt 0 (4 : ℤ)) 0)
    (hx : (x : (twoTermAt 0 (4 : ℤ)).X 0) =
      (show (twoTermAt 0 (4 : ℤ)).X 0 from (1 : ℤ))) :
    ((etaDifferential 2 (twoTermAt 0 (4 : ℤ)) (twoTerm_torsionFree 0 2 4 hf) 0 x).val :
      (twoTermAt 0 (4 : ℤ)).X 1) =
      (show (twoTermAt 0 (4 : ℤ)).X 1 from (2 : ℤ)) := by sorry

/-! principal-complex: three tests, including negative degrees. -/
-- complex_two_term
example (f : R) (hf : Function.Injective (fun x : R => f * x)) :
    Nonempty (etaComplex f (twoTermAt 0 (f ^ 2))
      (twoTerm_torsionFree 0 f (f ^ 2) hf) ≅ twoTermAt 0 f) := by sorry

-- complex_negative_degree
example (f : R) (hf : Function.Injective (fun x : R => f * x)) :
    Nonempty (etaComplex f (twoTermAt (-3) (f ^ 2))
      (twoTerm_torsionFree (-3) f (f ^ 2) hf) ≅ twoTermAt (-3) f) := by sorry

-- complex_zero
example (f : R) :
    Nonempty (etaComplex f (zeroTestComplex R) (zeroTest_torsionFree f) ≅
      zeroTestComplex R) := by sorry

/-! principal-map: three tests. -/
-- map_identity
example (hf : Function.Injective (fun z : ℤ => (2 : ℤ) * z)) :
    etaMap 2 (twoTermAt 0 (4 : ℤ)) (twoTermAt 0 (4 : ℤ))
      (twoTerm_torsionFree 0 2 4 hf) (twoTerm_torsionFree 0 2 4 hf)
      (𝟙 (twoTermAt 0 (4 : ℤ))) =
      𝟙 (etaComplex 2 (twoTermAt 0 (4 : ℤ)) (twoTerm_torsionFree 0 2 4 hf)) := by sorry

-- map_zero
example (f : R) (C D : CochainComplex (ModuleCat.{v} R) ℤ)
    (hC : ∀ i : ℤ, Function.Injective (fun x : C.X i => f • x))
    (hD : ∀ i : ℤ, Function.Injective (fun x : D.X i => f • x)) :
    etaMap f C D hC hD (0 : C ⟶ D) = 0 := by sorry

-- map_composition
example (f : R) (C D E : CochainComplex (ModuleCat.{v} R) ℤ)
    (hC : ∀ i : ℤ, Function.Injective (fun x : C.X i => f • x))
    (hD : ∀ i : ℤ, Function.Injective (fun x : D.X i => f • x))
    (hE : ∀ i : ℤ, Function.Injective (fun x : E.X i => f • x))
    (u : C ⟶ D) (v : D ⟶ E) :
    etaMap f C E hC hE (u ≫ v) =
      etaMap f C D hC hD u ≫ etaMap f D E hD hE v := by sorry

/-! The unrelated-completion regression: concrete algebraic parts only.
The identification of the sequence module with DERIVED completion and the
canonical comparison itself require the requested DD.1/E4 interface. -/
theorem finite_shift_injective : Function.Injective
    (fun a : ℕ →₀ Polynomial ℚ =>
      fun n : ℕ => a (n + 1) - Polynomial.X * a n) := by sorry

theorem completed_shift_kernel (a : ℕ → PowerSeries ℚ) :
    (∀ n : ℕ, a (n + 1) - PowerSeries.X * a n = 0) ↔
      ∀ n : ℕ, a n = PowerSeries.X ^ n * a 0 := by sorry

theorem geometric_restricted (a : PowerSeries ℚ) :
    ∀ r : ℕ, ∃ N : ℕ, ∀ n : ℕ, N ≤ n →
      ∀ j : ℕ, j < r → PowerSeries.coeff j (PowerSeries.X ^ n * a) = 0 := by sorry

example (n : ℕ) :
    (PowerSeries.X : PowerSeries ℚ) ^ (n + 1) -
      PowerSeries.X * PowerSeries.X ^ n = 0 := by sorry

example : (fun n : ℕ => (PowerSeries.X : PowerSeries ℚ) ^ n) ≠ 0 := by sorry

/- The counterexample concerns the canonical comparison N→N/N[t].
Do not replace its conclusion by nonisomorphism of the underlying objects. -/


/-! Invertible ideals: principal-chart prototype. Omitted: the ringed site and
I^tensor i. Changing f to u*f is therefore represented by explicit chart maps;
negative powers use the unit u, not an inverse of a nonunit in R. -/
def idealEta (f : R) (C : CochainComplex (ModuleCat.{u} R) ℤ)
    (hC : ∀ i : ℤ, Function.Injective (fun x : C.X i => f • x)) := etaComplex f C hC

theorem idealEta_term (f : R) (C : CochainComplex (ModuleCat.{u} R) ℤ)
    (hC : ∀ i : ℤ, Function.Injective (fun x : C.X i => f • x)) (i : ℤ) :
    (idealEta f C hC).X i = ModuleCat.of R (etaTerm f C i) := by sorry

private def idealGeneratorIso (f : R) (u : Rˣ)
    (C : CochainComplex (ModuleCat.{u} R) ℤ)
    (hC : ∀ i : ℤ, Function.Injective (fun x : C.X i => f • x))
    (hu : ∀ i : ℤ, Function.Injective (fun x : C.X i => (u.val * f) • x)) :
    idealEta f C hC ≅ idealEta (u.val * f) C hu := by sorry

theorem idealEta_changeGenerator (f : R) (u : Rˣ)
    (C : CochainComplex (ModuleCat.{u} R) ℤ)
    (hC : ∀ i : ℤ, Function.Injective (fun x : C.X i => f • x))
    (hu : ∀ i : ℤ, Function.Injective (fun x : C.X i => (u.val * f) • x))
    (i : ℤ) (x : (idealEta f C hC).X i) :
    (((idealGeneratorIso f u C hC hu).hom.f i).hom x).val =
      (u ^ (-i)).val • x.val := by sorry

theorem idealEta_map (f : R) (C D : CochainComplex (ModuleCat.{u} R) ℤ)
    (hC : ∀ i : ℤ, Function.Injective (fun x : C.X i => f • x))
    (hD : ∀ i : ℤ, Function.Injective (fun x : D.X i => f • x)) (a : C ⟶ D)
    (i : ℤ) (x : (idealEta f C hC).X i) :
    (((etaMap f C D hC hD a).f i).hom x).val = (a.f i).hom x.val := by sorry

-- ideal_unit
example (C : CochainComplex (ModuleCat.{u} R) ℤ)
    (hC : ∀ i : ℤ, Function.Injective (fun x : C.X i => (1 : R) • x)) :
    Nonempty (idealEta 1 C hC ≅ C) := by sorry
-- ideal_overlap: the degree i transition is u^(-i); at i=-1 it is u.
example (u v : Rˣ) (i : ℤ) : ((u * v) ^ (-i)).val =
    (v ^ (-i)).val * (u ^ (-i)).val := by sorry
-- ideal_two_term
example (f : R) (hf : Function.Injective (fun x : R => f * x)) :
    Nonempty (idealEta f (twoTermAt 0 (f^2))
      (twoTerm_torsionFree 0 f (f^2) hf) ≅ twoTermAt 0 f) := by sorry

section Derived
variable [HasDerivedCategory (ModuleCat.{u} R)]
/-- Localization construction. Omitted hypothesis on representatives: strongly
K-flat; the ordinary DerivedCategory carrier is already in Mathlib. -/
def derivedEta (f : R) : DerivedCategory (ModuleCat.{u} R) ⥤
    DerivedCategory (ModuleCat.{u} R) := by sorry

theorem derivedEta_objIso (f : R) (C : CochainComplex (ModuleCat.{u} R) ℤ)
    (hC : ∀ i : ℤ, Function.Injective (fun x : C.X i => f • x)) :
    Nonempty ((derivedEta f).obj (DerivedCategory.Q.obj C) ≅
      DerivedCategory.Q.obj (etaComplex f C hC)) := by sorry

private def derivedEtaIso (f : R) (C : CochainComplex (ModuleCat.{u} R) ℤ)
    (hC : ∀ i : ℤ, Function.Injective (fun x : C.X i => f • x)) :
    (derivedEta f).obj (DerivedCategory.Q.obj C) ≅
      DerivedCategory.Q.obj (etaComplex f C hC) := by sorry

theorem derivedEta_naturality (f : R) (C D : CochainComplex (ModuleCat.{u} R) ℤ)
    (hC : ∀ i : ℤ, Function.Injective (fun x : C.X i => f • x))
    (hD : ∀ i : ℤ, Function.Injective (fun x : D.X i => f • x)) (a : C ⟶ D) :
    (derivedEta f).map (DerivedCategory.Q.map a) ≫ (derivedEtaIso f D hD).hom =
      (derivedEtaIso f C hC).hom ≫ DerivedCategory.Q.map (etaMap f C D hC hD a) := by sorry

theorem derivedEta_identityIdeal :
    Nonempty (derivedEta (1 : R) ≅ 𝟭 (DerivedCategory (ModuleCat.{u} R))) := by sorry
end Derived

section IntegerTests
local instance : HasDerivedCategory (ModuleCat.{0} ℤ) := HasDerivedCategory.standard _
-- derived_kills_once: free resolution of (Z/2)[0] in degrees -1,0.
example : Limits.IsZero ((derivedEta (2 : ℤ)).obj
    (DerivedCategory.Q.obj (twoTermAt (-1) (2 : ℤ)))) := by sorry
-- derived_retains_power_torsion: free resolution of (Z/4)[0].
example : Nonempty ((derivedEta (2 : ℤ)).obj
    (DerivedCategory.Q.obj (twoTermAt (-1) (4 : ℤ))) ≅
      DerivedCategory.Q.obj (twoTermAt (-1) (2 : ℤ))) := by sorry
-- derived_nonexact: both end terms die, whereas the middle term survives.
example : ¬ Limits.IsZero ((derivedEta (2 : ℤ)).obj
    (DerivedCategory.Q.obj (twoTermAt (-1) (4 : ℤ)))) := by sorry
end IntegerTests

/-- Affine termwise-flat prototype of the lax product construction. Omitted:
K-flatness, derived tensor and line factors. The target is Mathlib's tensor
complex, with its Koszul signs; it is not a new complex carrier. -/
def etaTensor (f : R) (C D : CochainComplex (ModuleCat.{u} R) ℤ)
    (hC : ∀ i : ℤ, Function.Injective (fun x : C.X i => f • x))
    (hD : ∀ i : ℤ, Function.Injective (fun x : D.X i => f • x))
    (hCD : ∀ i : ℤ, Function.Injective
      (fun x : (HomologicalComplex.tensorObj C D).X i => f • x)) :
    HomologicalComplex.tensorObj (etaComplex f C hC) (etaComplex f D hD) ⟶
      etaComplex f (HomologicalComplex.tensorObj C D) hCD := by sorry

theorem derivedEta_tensorMap (f : R) (C D : CochainComplex (ModuleCat.{u} R) ℤ)
    (hC : ∀ i : ℤ, Function.Injective (fun x : C.X i => f • x))
    (hD : ∀ i : ℤ, Function.Injective (fun x : D.X i => f • x))
    (hCD : ∀ i : ℤ, Function.Injective
      (fun x : (HomologicalComplex.tensorObj C D).X i => f • x))
    (i j : ℤ) (x : (etaComplex f C hC).X i) (y : (etaComplex f D hD).X j) :
    (((etaTensor f C D hC hD hCD).f (i+j)).hom
      ((HomologicalComplex.ιTensorObj (etaComplex f C hC) (etaComplex f D hD)
        i j (i+j) rfl).hom (TensorProduct.tmul R x y))).val =
      (HomologicalComplex.ιTensorObj C D i j (i+j) rfl).hom
        (TensorProduct.tmul R x.val y.val) := by sorry

/-- Naturality at the normalized element level. -/
theorem derivedEta_tensor_naturality (M N M' N' : Type u)
    [AddCommGroup M] [Module R M] [AddCommGroup N] [Module R N]
    [AddCommGroup M'] [Module R M'] [AddCommGroup N'] [Module R N']
    (a : M →ₗ[R] M') (b : N →ₗ[R] N') (x : M) (y : N) :
    TensorProduct.map a b (TensorProduct.tmul R x y) =
      TensorProduct.tmul R (a x) (b y) := by sorry

theorem derivedEta_tensor_coherence (M N P : Type u)
    [AddCommGroup M] [Module R M] [AddCommGroup N] [Module R N]
    [AddCommGroup P] [Module R P] (x : M) (y : N) (z : P) :
    TensorProduct.assoc R M N P (TensorProduct.tmul R (TensorProduct.tmul R x y) z) =
      TensorProduct.tmul R x (TensorProduct.tmul R y z) := by sorry

-- tensor_unit: degree-zero multiplication is the unit constraint.
example (x : R) : TensorProduct.lid R R (TensorProduct.tmul R (1 : R) x) = x := by sorry
-- tensor_sign: two degree-one elements have braiding sign -1.
example (x y : R) : -(TensorProduct.comm R R R (TensorProduct.tmul R x y)) =
    (-1 : R) • TensorProduct.tmul R y x := by sorry
-- tensor_zero
example (x : R) : TensorProduct.tmul R x (0 : R) = 0 := by sorry

/-- Quotient term complex. The f-torsion-free/K-flat representative hypothesis is
required when this ordinary reduction is interpreted as derived reduction. -/
def modComplex (f : R) (C : CochainComplex (ModuleCat.{u} R) ℤ) :
    CochainComplex (ModuleCat.{u} R) ℤ := by sorry

def beta (f : R) (C : CochainComplex (ModuleCat.{u} R) ℤ) (i : ℤ) :
    (modComplex f C).homology i →ₗ[R] (modComplex f C).homology (i + 1) := by sorry

def bockstein (f : R) (C : CochainComplex (ModuleCat.{u} R) ℤ) :
    CochainComplex (ModuleCat.{u} R) ℤ :=
  CochainComplex.of (fun i => (modComplex f C).homology i)
    (fun i => ModuleCat.ofHom (beta f C i)) (by intro i; sorry)

theorem bockstein_term (f : R) (C : CochainComplex (ModuleCat.{u} R) ℤ) (i : ℤ) :
    (bockstein f C).X i = (modComplex f C).homology i := rfl

/-- Helper selecting the actual homology class of a reduced cycle. -/
private def modClass (f : R) (C : CochainComplex (ModuleCat.{u} R) ℤ) (i : ℤ)
    (x : C.X i) (y : C.X (i+1))
    (hxy : (C.d i (i+1)).hom x = f • y) : (modComplex f C).homology i := by sorry

theorem bockstein_lift (f : R) (C : CochainComplex (ModuleCat.{u} R) ℤ)
    (hC : ∀ i : ℤ, Function.Injective (fun x : C.X i => f • x)) (i : ℤ)
    (x : C.X i) (y : C.X (i+1)) (hxy : (C.d i (i+1)).hom x = f • y)
    (hy : (C.d (i+1) (i+1+1)).hom y = 0) :
    beta f C i (modClass f C i x y hxy) =
      modClass f C (i+1) y 0 (by simpa using hy) := by sorry

theorem bockstein_square (f : R) (C : CochainComplex (ModuleCat.{u} R) ℤ) (i : ℤ)
    (x : (modComplex f C).homology i) : beta f C (i+1) (beta f C i x) = 0 := by sorry

-- bockstein_identity: [Z --2→ Z] has beta(1)=1 under the lift convention.
example (x : (twoTermAt 0 (2 : ℤ)).X 0) (y : (twoTermAt 0 (2 : ℤ)).X 1)
    (hx : x = (show (twoTermAt 0 (2 : ℤ)).X 0 from (1 : ℤ)))
    (hy : y = (show (twoTermAt 0 (2 : ℤ)).X 1 from (1 : ℤ)))
    (hxy : ((twoTermAt 0 (2 : ℤ)).d 0 1).hom x = (2 : ℤ) • y)
    (hy0 : ((twoTermAt 0 (2 : ℤ)).d 1 2).hom y = 0) :
    beta 2 (twoTermAt 0 (2 : ℤ)) 0 (modClass 2 _ 0 x y hxy) =
      modClass 2 _ 1 y 0 (by simpa using hy0) := by sorry
-- bockstein_zero
example : beta 2 (twoTermAt 0 (4 : ℤ)) 0 = 0 := by sorry
-- bockstein_shift: the shifted differential has the negative lift.
example (C : CochainComplex (ModuleCat.{u} R) ℤ) (f : R) (i : ℤ)
    (x : C.X i) (y : C.X (i+1)) :
    (C.d i (i+1)).hom x = f • y →
      -((C.d i (i+1)).hom x) = f • (-y) := by sorry

def bocksteinMap (f : R) (C : CochainComplex (ModuleCat.{u} R) ℤ)
    (hC : ∀ i : ℤ, Function.Injective (fun x : C.X i => f • x)) :
    modComplex f (etaComplex f C hC) ⟶ bockstein f C := by sorry

private def modElement (f : R) (C : CochainComplex (ModuleCat.{u} R) ℤ)
    (i : ℤ) (x : C.X i) : (modComplex f C).X i := by sorry

theorem bocksteinMap_component (f : R) (C : CochainComplex (ModuleCat.{u} R) ℤ)
    (hC : ∀ i : ℤ, Function.Injective (fun x : C.X i => f • x)) (i : ℤ)
    (x : etaTerm f C i) (y : C.X (i+1))
    (hxy : (C.d i (i+1)).hom x.val = f • y) :
    ((bocksteinMap f C hC).f i).hom (modElement f (etaComplex f C hC) i x) =
      modClass f C i x.val y hxy := by sorry

theorem bocksteinMap_chain (f : R) (C : CochainComplex (ModuleCat.{u} R) ℤ)
    (hC : ∀ i : ℤ, Function.Injective (fun x : C.X i => f • x)) (i : ℤ) :
    (bocksteinMap f C hC).f i ≫ (bockstein f C).d i (i+1) =
      (modComplex f (etaComplex f C hC)).d i (i+1) ≫ (bocksteinMap f C hC).f (i+1) := by sorry

private def modComplexMap (f : R) {C D : CochainComplex (ModuleCat.{u} R) ℤ} (a : C ⟶ D) :
    modComplex f C ⟶ modComplex f D := by sorry
private def bocksteinMapHom (f : R) {C D : CochainComplex (ModuleCat.{u} R) ℤ} (a : C ⟶ D) :
    bockstein f C ⟶ bockstein f D := by sorry

theorem bocksteinMap_natural (f : R) (C D : CochainComplex (ModuleCat.{u} R) ℤ)
    (hC : ∀ i : ℤ, Function.Injective (fun x : C.X i => f • x))
    (hD : ∀ i : ℤ, Function.Injective (fun x : D.X i => f • x)) (a : C ⟶ D) :
    modComplexMap f (etaMap f C D hC hD a) ≫ bocksteinMap f D hD =
      bocksteinMap f C hC ≫ bocksteinMapHom f a := by sorry

-- TauCeti.Decalage.bocksteinMap_test_unit
example (C : CochainComplex (ModuleCat.{u} R) ℤ)
    (hC : ∀ i : ℤ, Function.Injective (fun x : C.X i => (1 : R) • x)) :
    QuasiIso (bocksteinMap 1 C hC) := by sorry
-- TauCeti.Decalage.bocksteinMap_test_zero_d
example (f : R) (hf : Function.Injective (fun x : R => f*x)) :
    QuasiIso (bocksteinMap f (twoTermAt 0 (0 : R)) (twoTerm_torsionFree 0 f 0 hf)) := by sorry
-- TauCeti.Decalage.bocksteinMap_test_f2
example (f : R) (hf : Function.Injective (fun x : R => f*x)) :
    QuasiIso (bocksteinMap f (twoTermAt 0 (f^2)) (twoTerm_torsionFree 0 f (f^2) hf)) := by sorry

end TauCeti.Decalage

namespace TauCeti.AInfPlan
variable {A : Type u} [CommRing A]

/-- Packet name for the affine normalized form of the ideal cohomology theorem.
Omitted: ringed-topos descent and the I^tensor i line factors; the chosen
principal generator trivializes them here. -/
theorem decalage_cohomology (f : A) (C : CochainComplex (ModuleCat.{u} A) ℤ)
    (hC : ∀ i : ℤ, Function.Injective (fun x : C.X i => f • x)) (i : ℤ) :
    Nonempty ((TauCeti.Decalage.etaComplex f C hC).homology i ≅ ModuleCat.of A
      ((C.homology i) ⧸ LinearMap.ker
        (f • (LinearMap.id : (C.homology i) →ₗ[A] (C.homology i))))) := by sorry

/-- BMS1 Proposition 6.12 on a termwise f-torsion-free representative.
The two-term flat resolution of A/f computes derived reduction; no K-flatness
of C is required. Omitted: ringed-topos descent and invertible-ideal line factors.
The target retains its Bockstein differential. -/
theorem bockstein_reduction (f : A) (C : CochainComplex (ModuleCat.{u} A) ℤ)
    (hf : Function.Injective (fun x : A => f * x))
    (hC : ∀ i : ℤ, Function.Injective (fun x : C.X i => f • x))
    [HasDerivedCategory (ModuleCat.{u} A)] :
    Nonempty (DerivedCategory.Q.obj
      (TauCeti.Decalage.modComplex f (TauCeti.Decalage.etaComplex f C hC)) ≅
      DerivedCategory.Q.obj (TauCeti.Decalage.bockstein f C)) := by sorry
end TauCeti.AInfPlan

namespace TauCeti.AInf
variable {A O S k : Type u} [CommRing A] [CommRing O] [CommRing S] [CommRing k]

/-- Coefficient prototype on the actual Witt carrier. Omitted: epsilon is the
primitive compatible root system in O_C^flat, and S is that valuation ring. -/
def cyclotomic (p : ℕ) [Fact p.Prime] [CharP S p] [PerfectRing S p]
    (epsilon : S) : WittVector p S × WittVector p S × WittVector p S :=
  let root := (_root_.frobeniusEquiv S p).symm epsilon
  let xi := ∑ j ∈ Finset.range p, (WittVector.teichmuller p root)^j
  (WittVector.teichmuller p epsilon - 1, xi, WittVector.frobenius xi)

theorem cyclotomic_mu (p : ℕ) [Fact p.Prime] [CharP S p] [PerfectRing S p]
    (epsilon : S) : (cyclotomic p epsilon).1 = WittVector.teichmuller p epsilon - 1 := rfl

theorem cyclotomic_factorization (p : ℕ) [Fact p.Prime] [CharP S p] [PerfectRing S p]
    (epsilon : S) : (cyclotomic p epsilon).1 = (cyclotomic p epsilon).2.1 *
      (WittVector.frobeniusEquiv p S).symm (cyclotomic p epsilon).1 := by sorry

theorem cyclotomic_frobenius (p : ℕ) [Fact p.Prime] [CharP S p] [PerfectRing S p]
    (epsilon : S) : (cyclotomic p epsilon).2.2 =
      WittVector.frobenius (cyclotomic p epsilon).2.1 := rfl

/-- Omitted: theta is the shared Fontaine map and epsilon is primitive. -/
theorem cyclotomic_kernel (p : ℕ) [Fact p.Prime] [CharP S p] [PerfectRing S p]
    (epsilon : S) (theta : WittVector p S →+* O) :
    RingHom.ker theta = Ideal.span {(cyclotomic p epsilon).2.1} ∧
      RingHom.ker (theta.comp (WittVector.frobeniusEquiv p S).symm.toRingHom) =
        Ideal.span {(cyclotomic p epsilon).2.2} := by sorry

-- TauCeti.AInf.cyclotomic_test_unit: deliberately outside primitive systems.
example (p : ℕ) [Fact p.Prime] [CharP S p] [PerfectRing S p] :
    (cyclotomic p (1 : S)).1 = 0 := by sorry
-- TauCeti.AInf.cyclotomic_test_theta; omitted primitive/untilt hypotheses.
example (p : ℕ) [Fact p.Prime] [CharP S p] [PerfectRing S p]
    (epsilon : S) (theta : WittVector p S →+* O) :
    theta (cyclotomic p epsilon).1 = 0 ∧ theta (cyclotomic p epsilon).2.2 = p := by sorry
-- TauCeti.AInf.cyclotomic_test_tildeTheta; zeta is epsilon^(1/p) sharp.
example (p : ℕ) [Fact p.Prime] [CharP S p] [PerfectRing S p]
    (epsilon : S) (theta : WittVector p S →+* O) (zeta : O) :
    theta ((WittVector.frobeniusEquiv p S).symm (cyclotomic p epsilon).1) = zeta-1 ∧
      theta ((WittVector.frobeniusEquiv p S).symm (cyclotomic p epsilon).2.2) = 0 := by sorry

/-- Generic composition, specializing to Mathlib's existing fontaineTheta. -/
def tildeTheta (theta : A →+* O) (phi : A ≃+* A) : A →+* O :=
  theta.comp phi.symm.toRingHom

theorem tildeTheta_apply (theta : A →+* O) (phi : A ≃+* A) (x : A) :
    tildeTheta theta phi x = theta (phi.symm x) := rfl

theorem tildeTheta_surjective (theta : A →+* O) (phi : A ≃+* A)
    (h : Function.Surjective theta) : Function.Surjective (tildeTheta theta phi) := by sorry

theorem tildeTheta_ker (theta : A →+* O) (phi : A ≃+* A) (xi : A)
    (h : RingHom.ker theta = Ideal.span {xi}) :
    RingHom.ker (tildeTheta theta phi) = Ideal.span {phi xi} := by sorry

-- TauCeti.AInf.tildeTheta_test_teich: actual Fontaine carrier and untilt.
example (p : ℕ) [Fact p.Prime] [Fact (¬IsUnit (p : O))]
    [IsAdicComplete (Ideal.span {(p : O)}) O] (a : PreTilt O p) :
    tildeTheta (WittVector.fontaineTheta O p) (WittVector.frobeniusEquiv p (PreTilt O p))
      (WittVector.teichmuller p a) =
        (PreTilt.untilt ((_root_.frobeniusEquiv (PreTilt O p) p).symm a)) := by sorry
-- TauCeti.AInf.tildeTheta_test_p
example (p : ℕ) (theta : A →+* O) (phi : A ≃+* A) :
    tildeTheta theta phi (p : A) = (p : O) := by sorry
-- TauCeti.AInf.tildeTheta_test_mu; omitted primitive-root/untilt hypothesis.
example (theta : A →+* O) (phi : A ≃+* A) (mu : A) (zeta : O) :
    tildeTheta theta phi mu = zeta - 1 := by sorry

/-- Omitted: perfectoid S and the Frobenius-limit identification. The returned
map lands in Mathlib's finite Witt ring, not a newly declared coefficient ring. -/
def thetaWitt (p r : ℕ) [Fact p.Prime] (theta : A →+* O) (phi : A ≃+* A) :
    A →+* TruncatedWittVector p r O := by sorry

private def shiftedWitt (p r : ℕ) [Fact p.Prime] (theta : A →+* O) (phi : A ≃+* A) :
    A →+* TruncatedWittVector p r O :=
  (thetaWitt p r theta phi).comp (phi.symm ^ r).toRingHom

/-- First-coordinate identification W_1(O)=O; no new Witt carrier. -/
theorem thetaWitt_level_one (p : ℕ) [Fact p.Prime] (theta : A →+* O)
    (phi : A ≃+* A) (x : A) :
    (thetaWitt p 1 theta phi x).coeff ⟨0, by decide⟩ = theta x ∧
      (shiftedWitt p 1 theta phi x).coeff ⟨0, by decide⟩ = tildeTheta theta phi x := by sorry

theorem thetaWitt_surjective (p r : ℕ) [Fact p.Prime] (theta : A →+* O)
    (phi : A ≃+* A) (hr : 1 ≤ r) :
    Function.Surjective (thetaWitt p r theta phi) ∧
      Function.Surjective (shiftedWitt p r theta phi) := by sorry

/-- Missing finite F,V maps are data, not proposition-valued substitutes. -/
private def finiteF (p r : ℕ) [Fact p.Prime] :
    TruncatedWittVector p (r+1) O →+* TruncatedWittVector p r O := by sorry
private def finiteV (p r : ℕ) [Fact p.Prime] :
    TruncatedWittVector p r O →+ TruncatedWittVector p (r+1) O := by sorry

theorem thetaWitt_F (p r : ℕ) [Fact p.Prime] (theta : A →+* O) (phi : A ≃+* A)
    (x : A) : finiteF p r (shiftedWitt p (r+1) theta phi x) = shiftedWitt p r theta phi x ∧
      finiteF p r (thetaWitt p (r+1) theta phi x) = thetaWitt p r theta phi (phi x) := by sorry

theorem thetaWitt_R (p r : ℕ) [Fact p.Prime] (theta : A →+* O) (phi : A ≃+* A)
    (x : A) : TruncatedWittVector.truncate (Nat.le_succ r) (thetaWitt p (r+1) theta phi x) =
      thetaWitt p r theta phi x ∧
      TruncatedWittVector.truncate (Nat.le_succ r) (shiftedWitt p (r+1) theta phi x) =
        shiftedWitt p r theta phi (phi.symm x) := by sorry

/-- BMS1 Lemma 3.4: lambda lifts V(1); p is not such a lift over O_C.
Omitted: the shared perfectoid finite Witt maps and r ≥ 1. -/
theorem thetaWitt_V (p r : ℕ) [Fact p.Prime] (theta : A →+* O) (phi : A ≃+* A)
    (lambda x : A)
    (hLift : thetaWitt p (r+1) theta phi lambda = finiteV p r 1) :
    finiteV p r (thetaWitt p r theta phi x) =
      thetaWitt p (r+1) theta phi (lambda * phi.symm x) ∧
      finiteV p r (shiftedWitt p r theta phi x) =
        shiftedWitt p (r+1) theta phi ((phi ^ (r+1)) lambda * x) := by sorry

-- TauCeti.AInf.thetaWitt_test_VnotP: first Witt coordinate detects the error.
example (p : ℕ) [Fact p.Prime] [CharZero O] :
    (finiteV p 1 (1 : TruncatedWittVector p 1 O)).coeff ⟨0, by decide⟩ = 0 ∧
      ((p : TruncatedWittVector p 2 O).coeff ⟨0, by decide⟩ = (p : O)) ∧
      finiteV p 1 (1 : TruncatedWittVector p 1 O) ≠ (p : TruncatedWittVector p 2 O) := by sorry

-- TauCeti.AInf.thetaWitt_test_r1
example (p : ℕ) [Fact p.Prime] (theta : A →+* O) (phi : A ≃+* A) (x : A) :
    (thetaWitt p 1 theta phi x).coeff ⟨0, by decide⟩ = theta x := by sorry
-- TauCeti.AInf.thetaWitt_test_teich; omitted perfectoid untilt identification.
example (p r : ℕ) [Fact p.Prime] [CharP S p] [PerfectRing S p]
    (theta : WittVector p S →+* O) (a : S) (sharp : S →* O) :
    thetaWitt p r theta (WittVector.frobeniusEquiv p S) (WittVector.teichmuller p a) =
      WittVector.truncate r (WittVector.teichmuller p (sharp a)) := by sorry
-- TauCeti.AInf.thetaWitt_test_FnotR: nonfixed input, not an artificial F=R.
example (p : ℕ) [Fact p.Prime] (theta : A →+* O) (phi : A ≃+* A) (x : A)
    (h : theta (phi x) ≠ theta x) :
    finiteF p 1 (thetaWitt p 2 theta phi x) ≠
      TruncatedWittVector.truncate (Nat.le_succ 1) (thetaWitt p 2 theta phi x) := by sorry

def xiWitt (phi : A ≃+* A) (xi : A) (r : ℕ) : A :=
  ∏ i ∈ Finset.range r, (phi.symm ^ i) xi
private def shiftedXi (phi : A ≃+* A) (xi : A) (r : ℕ) : A := (phi ^ r) (xiWitt phi xi r)

theorem xiWitt_recursion (phi : A ≃+* A) (xi : A) (r : ℕ) :
    xiWitt phi xi (r+1) = xiWitt phi xi r * (phi.symm ^ r) xi := by sorry

theorem xiWitt_tilde_recursion (phi : A ≃+* A) (xi : A) (r : ℕ) :
    shiftedXi phi xi (r+1) = shiftedXi phi xi r * (phi ^ (r+1)) xi := by sorry

/-- Regularity here is algebraic; the primitive Fontaine kernel supplier
provides hxi for every integral perfectoid base, not just O_C. -/
theorem xiWitt_regular (phi : A ≃+* A) (xi : A) (r : ℕ)
    (hxi : Function.Injective (fun x : A => xi * x)) :
    Function.Injective (fun x : A => xiWitt phi xi r * x) ∧
      Function.Injective (fun x : A => shiftedXi phi xi r * x) := by sorry

/-- Omitted: the shared Fontaine kernel and perfectoid hypotheses. -/
theorem xiWitt_ker_theta (p r : ℕ) [Fact p.Prime] (theta : A →+* O)
    (phi : A ≃+* A) (xi : A) (hr : 1 ≤ r) :
    RingHom.ker (thetaWitt p r theta phi) = Ideal.span {xiWitt phi xi r} := by sorry

theorem xiWitt_ker_tilde (p r : ℕ) [Fact p.Prime] (theta : A →+* O)
    (phi : A ≃+* A) (xi : A) (hr : 1 ≤ r) :
    RingHom.ker (shiftedWitt p r theta phi) = Ideal.span {shiftedXi phi xi r} := by sorry

-- TauCeti.AInf.xiWitt_test_one
example (phi : A ≃+* A) (xi : A) : xiWitt phi xi 1 = xi ∧ shiftedXi phi xi 1 = phi xi := by sorry
-- TauCeti.AInf.xiWitt_test_two
example (phi : A ≃+* A) (xi : A) : xiWitt phi xi 2 = xi * phi.symm xi ∧
    shiftedXi phi xi 2 = phi xi * phi (phi xi) := by sorry
-- TauCeti.AInf.xiWitt_test_orientation
example (phi : A ≃+* A) (xi : A)
    (h : phi xi * phi (phi xi) ≠ xi * phi.symm xi) :
    shiftedXi phi xi 2 ≠ xiWitt phi xi 2 := by sorry

/-- Actual Witt functor on the tilt residue map. -/
def residue (p : ℕ) [Fact p.Prime] (rho : S →+* k) : WittVector p S →+* WittVector p k :=
  WittVector.map rho

theorem residue_teich (p : ℕ) [Fact p.Prime] (rho : S →+* k) (a : S) :
    residue p rho (WittVector.teichmuller p a) = WittVector.teichmuller p (rho a) := by sorry

theorem residue_frobenius (p : ℕ) [Fact p.Prime] (rho : S →+* k) (x : WittVector p S) :
    residue p rho (WittVector.frobenius x) = WittVector.frobenius (residue p rho x) := by sorry

/-- Omitted: rho is the residue map of O_C^flat and epsilon is primitive. -/
theorem residue_periods (p : ℕ) [Fact p.Prime] [CharP S p] [PerfectRing S p]
    (rho : S →+* k) (epsilon : S) : residue p rho (cyclotomic p epsilon).1 = 0 ∧
      residue p rho (cyclotomic p epsilon).2.1 = p ∧
      residue p rho (cyclotomic p epsilon).2.2 = p := by sorry

theorem residue_surjective (p : ℕ) [Fact p.Prime] (rho : S →+* k)
    (h : Function.Surjective rho) : Function.Surjective (residue p rho) := by sorry

-- TauCeti.AInf.residue_test_one
example (p : ℕ) [Fact p.Prime] (rho : S →+* k) : residue p rho 1 = 1 := by sorry
-- TauCeti.AInf.residue_test_mu
example (p : ℕ) [Fact p.Prime] [CharP S p] [PerfectRing S p]
    (rho : S →+* k) (epsilon : S) (h : rho epsilon = 1) :
    residue p rho (cyclotomic p epsilon).1 = 0 := by sorry
-- TauCeti.AInf.residue_test_xi: p is nonzero in the characteristic-zero Witt ring.
example (p : ℕ) [Fact p.Prime] [CharP S p] [PerfectRing S p]
    [CharP k p] [Nontrivial k] (rho : S →+* k) (epsilon : S)
    (h : rho ((_root_.frobeniusEquiv S p).symm epsilon) = 1) :
    residue p rho (cyclotomic p epsilon).2.1 = p ∧ (p : WittVector p k) ≠ 0 := by sorry

/-- Intrinsic inverse-conormal limit line. Omitted: the inverse system of
Fontaine conormal ideals and division by p, specified in the mathematical plan.
The value is a module object, never a Prop carrying its own desired API. -/
def bkTwist (n : ℤ) : ModuleCat.{u} A := by sorry

theorem bkTwist_zero : Nonempty (bkTwist (A := A) 0 ≅ ModuleCat.of A A) := by sorry

theorem bkTwist_add (n m : ℤ) :
    Nonempty (bkTwist (A := A) (n+m) ≅ ModuleCat.of A
      (TensorProduct A (bkTwist (A := A) n) (bkTwist (A := A) m))) := by sorry

theorem bkTwist_dual (n : ℤ) :
    Nonempty (bkTwist (A := A) (-n) ≅ ModuleCat.of A ((bkTwist (A := A) n) →ₗ[A] A)) := by sorry

/-- Chosen cyclotomic trivialization; the supplied unit is the ratio computed
from dlog(epsilon)/mu for a changed primitive system. -/
private def bkBasis (n : ℤ) (u : Aˣ) : bkTwist (A := A) n := by sorry
private def bkPulledBasis (phi : A ≃+* A) :
    (ModuleCat.restrictScalars phi.symm.toRingHom).obj (bkTwist (A := A) 1) := by sorry
private def bkFrob (phi : A ≃+* A) (tildeXi : A) :
    LocalizedModule (Submonoid.powers tildeXi)
      ((ModuleCat.restrictScalars phi.symm.toRingHom).obj (bkTwist (A := A) 1)) →ₗ[Localization.Away tildeXi]
        LocalizedModule (Submonoid.powers tildeXi) (bkTwist (A := A) 1) := by sorry

/-- Omitted: phi/tildeXi are the shared Witt periods and bkBasis is the chosen
cyclotomic basis. This relation pins the reciprocal tilde-xi factor. -/
theorem bkTwist_frobenius (phi : A ≃+* A) (tildeXi : A) :
    algebraMap A (Localization.Away tildeXi) tildeXi •
      bkFrob phi tildeXi (LocalizedModule.mk (bkPulledBasis phi) 1) =
        LocalizedModule.mk (bkBasis 1 (1 : Aˣ)) 1 := by sorry

theorem bkTwist_epsilon_change (n : ℤ) (u v : Aˣ) :
    bkBasis n (u*v) = (u^n).val • bkBasis n v := by sorry

private def dlogVector (mu : A) : bkTwist (A := A) 1 := by sorry

-- TauCeti.AInf.bkTwist_test_zero
example : Nonempty (bkTwist (A := A) 0 ≅ ModuleCat.of A A) := by sorry
-- TauCeti.AInf.bkTwist_test_one: dlog(epsilon) is mu times the chosen basis.
-- The geometric construction of dlogVector is omitted; this relation is not
-- replaced by the false assertion that dlog surjects onto the integral line.
example (mu : A) : dlogVector mu = mu • bkBasis 1 (1 : Aˣ) := by sorry
-- TauCeti.AInf.bkTwist_test_negative
example : Nonempty (bkTwist (A := A) (-1) ≅ ModuleCat.of A ((bkTwist (A := A) 1) →ₗ[A] A)) := by sorry
end TauCeti.AInf

namespace TauCeti.BKF
variable {A : Type u} [CommRing A]

private abbrev phiPull (phi : A ≃+* A) (M : ModuleCat.{u} A) :=
  (ModuleCat.restrictScalars phi.symm.toRingHom).obj M

/-- Genuine data of a BKF object. Omitted: A=A_inf(O_C) and phi is Witt
Frobenius. Finiteness fields are existing classes constituting the definition,
not hypotheses asserting classification, comparison or closure theorems. -/
structure Module (p : ℕ) (phi : A ≃+* A) (xi : A) where
  M : ModuleCat.{u} A
  finitePresentation : _root_.Module.FinitePresentation A M
  pLocalFree : _root_.Module.Free (Localization.Away (p : A))
    (LocalizedModule (Submonoid.powers (p : A)) M)
  pLocalFinite : _root_.Module.Finite (Localization.Away (p : A))
    (LocalizedModule (Submonoid.powers (p : A)) M)
  frobenius : LocalizedModule (Submonoid.powers (phi xi)) (phiPull phi M) ≃ₗ[Localization.Away (phi xi)]
    LocalizedModule (Submonoid.powers (phi xi)) M

attribute [instance] Module.finitePresentation Module.pLocalFree Module.pLocalFinite

private def localizedMap (s : A) {M N : ModuleCat.{u} A} (f : M ⟶ N) :
    LocalizedModule (Submonoid.powers s) M →ₗ[Localization.Away s]
      LocalizedModule (Submonoid.powers s) N := by sorry

structure Hom {p : ℕ} {phi : A ≃+* A} {xi : A} (M N : Module p phi xi) where
  map : M.M ⟶ N.M
  commutes : (localizedMap (phi xi) map).comp M.frobenius.toLinearMap =
    N.frobenius.toLinearMap.comp
      (localizedMap (phi xi) ((ModuleCat.restrictScalars phi.symm.toRingHom).map map))

/-- A linearized presentation already forms part of the data; the semilinear
localization ring equivalence is the missing geometric identification. -/
theorem Module_linearized (p : ℕ) (phi : A ≃+* A) (xi : A) (M : Module p phi xi) :
    Nonempty (LocalizedModule (Submonoid.powers (phi xi)) (phiPull phi M.M) ≃ₗ[Localization.Away (phi xi)]
      LocalizedModule (Submonoid.powers (phi xi)) M.M) := by sorry

theorem Module_hom {p : ℕ} {phi : A ≃+* A} {xi : A} (M N : Module p phi xi)
    (f : M.M ⟶ N.M) : Nonempty {g : Hom M N // g.map = f} ↔
      (localizedMap (phi xi) f).comp M.frobenius.toLinearMap =
        N.frobenius.toLinearMap.comp
          (localizedMap (phi xi) ((ModuleCat.restrictScalars phi.symm.toRingHom).map f)) := by sorry

theorem Module_ext {p : ℕ} {phi : A ≃+* A} {xi : A} {M N : Module p phi xi}
    (f g : Hom M N) (h : f.map = g.map) : f = g := by sorry

def unit (p : ℕ) (phi : A ≃+* A) (xi : A) : Module p phi xi := by sorry

theorem Module_unit (p : ℕ) (phi : A ≃+* A) (xi : A) :
    (unit p phi xi).M = ModuleCat.of A A := by sorry

def twist (p : ℕ) (phi : A ≃+* A) (xi : A) (n : ℤ) : Module p phi xi := by sorry

theorem Module_twist (p : ℕ) (phi : A ≃+* A) (xi : A) (n : ℤ) :
    Nonempty ((twist p phi xi n).M ≅ TauCeti.AInf.bkTwist n) := by sorry

/-- Coordinates induced by the conormal basis and its Frobenius pullback.
Omitted: the intrinsic Fontaine line and compatible cyclotomic normalization. -/
private def twistSourceCoord (p : ℕ) (phi : A ≃+* A) (xi : A) :
    LocalizedModule (Submonoid.powers (phi xi)) (phiPull phi (twist p phi xi 1).M)
      ≃ₗ[Localization.Away (phi xi)] Localization.Away (phi xi) := by sorry
private def twistTargetCoord (p : ℕ) (phi : A ≃+* A) (xi : A) :
    LocalizedModule (Submonoid.powers (phi xi)) (twist p phi xi 1).M
      ≃ₗ[Localization.Away (phi xi)] Localization.Away (phi xi) := by sorry

theorem Module_twist_frobenius (p : ℕ) (phi : A ≃+* A) (xi : A) :
    twistTargetCoord p phi xi
      ((twist p phi xi 1).frobenius ((twistSourceCoord p phi xi).symm 1)) =
        IsLocalization.Away.invSelf (phi xi) := by sorry

/-- Omitted: eligible perfectoid coefficient change, transported Frobenius,
primitive kernel and the Tor/finite-free checks. -/
theorem Module_base_change {A' : Type u} [CommRing A'] (p : ℕ)
    (phi : A ≃+* A) (phi' : A' ≃+* A') (xi : A) (f : A →+* A')
    (M : Module p phi xi) : ∃ N : Module p phi' (f xi),
      Nonempty (N.M ≅ (ModuleCat.extendScalars f).obj M.M) := by sorry

-- TauCeti.BKF.Module_test_twist: the Frobenius factor is tilde-xi^-1, not 1.
-- Continuous Tate action is omitted; the available algebraic factor is tested.
example (p : ℕ) (phi : A ≃+* A) (xi : A)
    (h : IsLocalization.Away.invSelf (phi xi) ≠ (1 : Localization.Away (phi xi))) :
    twistTargetCoord p phi xi
      ((twist p phi xi 1).frobenius ((twistSourceCoord p phi xi).symm 1)) ≠ 1 := by sorry
-- TauCeti.BKF.Module_test_torsion: allowed BKF torsion object, outside free class.
-- Omitted: A is the mixed-characteristic A_inf base (p,xi regular).
example (p : ℕ) (phi : A ≃+* A) (xi : A) :
    ∃ M : Module p phi xi, Nonempty (M.M ≅ ModuleCat.of A (A ⧸ Ideal.span {(p : A)})) ∧
      ¬ _root_.Module.Free A M.M := by sorry

section Pairs
variable {Z Bp B : Type u} [CommRing Z] [CommRing Bp] [Field B]
  [Algebra Z Bp] [Algebra Z B] [Algebra Bp B] [IsScalarTower Z Bp B]

/-- Pair on existing tensor and submodule carriers. Omitted: Z=Z_p,
Bp=B_dR^+ is the common period DVR and B is its fraction field. -/
structure LatticePair where
  T : ModuleCat.{u} Z
  freeT : _root_.Module.Free Z T
  finiteT : _root_.Module.Finite Z T
  Xi : Submodule Bp (TensorProduct Z B T)
  freeXi : _root_.Module.Free Bp Xi
  finiteXi : _root_.Module.Finite Bp Xi
  spans : Submodule.span B (Xi : Set (TensorProduct Z B T)) = ⊤

attribute [instance] LatticePair.freeT LatticePair.finiteT LatticePair.freeXi LatticePair.finiteXi

structure PairHom (P Q : LatticePair (Z := Z) (Bp := Bp) (B := B)) where
  map : P.T ⟶ Q.T
  preserves : ∀ x ∈ P.Xi, TensorProduct.map (LinearMap.id : B →ₗ[Z] B) map.hom x ∈ Q.Xi

private def standardLattice (T : ModuleCat.{u} Z) : Submodule Bp (TensorProduct Z B T) := by sorry

def standard (T : ModuleCat.{u} Z) [_root_.Module.Free Z T] [_root_.Module.Finite Z T] :
    LatticePair (Z := Z) (Bp := Bp) (B := B) where
  T := T
  freeT := inferInstance
  finiteT := inferInstance
  Xi := standardLattice T
  freeXi := by sorry
  finiteXi := by sorry
  spans := by sorry

theorem LatticePair_standard (T : ModuleCat.{u} Z)
    [_root_.Module.Free Z T] [_root_.Module.Finite Z T] :
    (standard (Bp := Bp) (B := B) T).Xi = standardLattice T := by sorry

theorem LatticePair_hom (P Q : LatticePair (Z := Z) (Bp := Bp) (B := B)) (f : P.T ⟶ Q.T) :
    Nonempty {g : PairHom P Q // g.map = f} ↔
      ∀ x ∈ P.Xi, TensorProduct.map (LinearMap.id : B →ₗ[Z] B) f.hom x ∈ Q.Xi := by sorry

theorem LatticePair_ext {P Q : LatticePair (Z := Z) (Bp := Bp) (B := B)}
    (f g : PairHom P Q) (h : f.map = g.map) : f = g := by sorry

def tensorPair (P Q : LatticePair (Z := Z) (Bp := Bp) (B := B)) :
    LatticePair (Z := Z) (Bp := Bp) (B := B) := by sorry

theorem LatticePair_tensor (P Q : LatticePair (Z := Z) (Bp := Bp) (B := B)) :
    Nonempty ((tensorPair P Q).T ≅ ModuleCat.of Z (TensorProduct Z P.T Q.T)) := by sorry

def dualPair (P : LatticePair (Z := Z) (Bp := Bp) (B := B)) :
    LatticePair (Z := Z) (Bp := Bp) (B := B) := by sorry

theorem LatticePair_dual (P : LatticePair (Z := Z) (Bp := Bp) (B := B)) :
    Nonempty ((dualPair P).T ≅ ModuleCat.of Z (P.T →ₗ[Z] Z)) := by sorry

private def scaleLattice (T : ModuleCat.{u} Z) (c : B)
    (L : Submodule Bp (TensorProduct Z B T)) : Submodule Bp (TensorProduct Z B T) := by sorry

/-- Omitted: Bp is a DVR with nonzero uniformizer xi and B is its fraction field. -/
theorem LatticePair_bounds (xi : Bp) (P : LatticePair (Z := Z) (Bp := Bp) (B := B)) :
    ∃ n : ℕ, scaleLattice P.T ((algebraMap Bp B xi)^n) (standardLattice P.T) ≤ P.Xi ∧
      P.Xi ≤ scaleLattice P.T ((algebraMap Bp B xi)^(-(n : ℤ))) (standardLattice P.T) := by sorry

-- TauCeti.BKF.LatticePair_test_zero
example : ∃ P : LatticePair (Z := Z) (Bp := Bp) (B := B),
    Nonempty (P.T ≅ ModuleCat.of Z (Fin 0 → Z)) ∧ P.Xi = ⊥ := by sorry
-- TauCeti.BKF.LatticePair_test_shift; omitted DVR/fraction-field hypotheses.
example (xi : Bp) (hxi : ¬ IsUnit xi) (hzero : algebraMap Bp B xi ≠ 0) :
    ∃ P : LatticePair (Z := Z) (Bp := Bp) (B := B),
    ∃ e : P.T ≅ ModuleCat.of Z Z,
      P.Xi = scaleLattice P.T ((algebraMap Bp B xi)^(-1 : ℤ)) (standardLattice P.T) ∧
        P.Xi ≠ standardLattice P.T := by sorry
-- TauCeti.BKF.LatticePair_test_nospan
example [Nontrivial Z] :
    Submodule.span B ((⊥ : Submodule Bp (TensorProduct Z B Z)).carrier) ≠ ⊤ := by sorry
end Pairs

section Realization
variable {Z W : Type u} [CommRing Z] [CommRing W]
  [Algebra A W] [Algebra Z W]

/-- Frobenius descent extension to W(C^flat). Omitted: the common coefficient
maps, W=W(C^flat), and Frobenius fixing Z=Z_p; only the resulting Z-linear map
on the actual scalar-extension module is prototyped. -/
private def etaleFrob (p : ℕ) (phi : A ≃+* A) (xi : A) (M : Module p phi xi) :
    TensorProduct A W M.M →ₗ[Z] TensorProduct A W M.M := by sorry

def etale (p : ℕ) (phi : A ≃+* A) (xi : A) (M : Module p phi xi) : ModuleCat.{u} Z :=
  ModuleCat.of Z (LinearMap.ker (etaleFrob (Z := Z) (W := W) p phi xi M - LinearMap.id))

theorem etale_finite (p : ℕ) (phi : A ≃+* A) (xi : A) (M : Module p phi xi) :
    _root_.Module.Finite Z (etale (Z := Z) (W := W) p phi xi M) ∧
      (_root_.Module.Free A M.M → _root_.Module.Free Z (etale (Z := Z) (W := W) p phi xi M)) := by sorry

theorem etale_descent (p : ℕ) (phi : A ≃+* A) (xi : A) (M : Module p phi xi) :
    Nonempty (TensorProduct Z W (etale (Z := Z) (W := W) p phi xi M) ≃ₗ[W]
      TensorProduct A W M.M) := by sorry

/-- BMS1 Lemma 4.26, the mu-inverted equality in the common Witt extension.
Omitted: the common A_inf/W(C^flat) embeddings and cyclotomic mu. -/
theorem etale_mu_comparison [Algebra Z A] (p : ℕ) (phi : A ≃+* A) (xi mu : A)
    (M : Module p phi xi) :
    Nonempty (LocalizedModule (Submonoid.powers mu) M.M ≃ₗ[Localization.Away mu]
      TensorProduct Z (Localization.Away mu) (etale (Z := Z) (W := W) p phi xi M)) := by sorry

/-- Omitted: finite-free M and the common B_dR^+,B_dR extension maps. -/
theorem etale_lattice {Bp B : Type u} [CommRing Bp] [Field B]
    [Algebra Z Bp] [Algebra Z B] [Algebra Bp B] [IsScalarTower Z Bp B]
    (p : ℕ) (phi : A ≃+* A) (xi : A) (M : Module p phi xi) [_root_.Module.Free A M.M] :
    ∃ P : LatticePair (Z := Z) (Bp := Bp) (B := B),
      Nonempty (P.T ≅ etale (Z := Z) (W := W) p phi xi M) := by sorry

/-- Omitted: tensor BKF constructor and common period compatibility. -/
theorem etale_tensor (p : ℕ) (phi : A ≃+* A) (xi : A) (M N : Module p phi xi)
    (P : Module p phi xi) (h : Nonempty (P.M ≅ ModuleCat.of A (TensorProduct A M.M N.M))) :
    Nonempty (etale (Z := Z) (W := W) p phi xi P ≅ ModuleCat.of Z
      (TensorProduct Z (etale (Z := Z) (W := W) p phi xi M)
        (etale (Z := Z) (W := W) p phi xi N))) := by sorry

-- TauCeti.BKF.etale_test_unit
example (p : ℕ) (phi : A ≃+* A) (xi : A) :
    Nonempty (etale (Z := Z) (W := W) p phi xi (unit p phi xi) ≅ ModuleCat.of Z Z) := by sorry
-- TauCeti.BKF.etale_test_twist: omitted continuous Galois action on Z_p(1).
example (p : ℕ) (phi : A ≃+* A) (xi : A) :
    Nonempty (etale (Z := Z) (W := W) p phi xi (twist p phi xi 1) ≅ ModuleCat.of Z Z) := by sorry
-- TauCeti.BKF.etale_test_p_torsion
example (p : ℕ) (phi : A ≃+* A) (xi : A) (M : Module p phi xi)
    (h : Nonempty (M.M ≅ ModuleCat.of A (A ⧸ Ideal.span {(p : A)}))) :
    Nonempty (etale (Z := Z) (W := W) p phi xi M ≅
      ModuleCat.of Z (Z ⧸ Ideal.span {(p : Z)})) := by sorry
end Realization

section Reconstruction
variable {Z Bp B : Type u} [CommRing Z] [CommRing Bp] [Field B]
  [Algebra Z Bp] [Algebra Z B] [Algebra Bp B] [IsScalarTower Z Bp B]

/-- Omitted: common period maps, the analytic one-leg shtuka restriction/
extension inputs now owned in AI.2; the output is an actual BKF object. -/
def reconstruct (p : ℕ) (phi : A ≃+* A) (xi : A)
    (P : LatticePair (Z := Z) (Bp := Bp) (B := B)) : Module p phi xi := by sorry

private def realizationPair (p : ℕ) (phi : A ≃+* A) (xi : A) (M : Module p phi xi) :
    LatticePair (Z := Z) (Bp := Bp) (B := B) := by sorry

theorem reconstruct_pair (p : ℕ) (phi : A ≃+* A) (xi : A)
    (P : LatticePair (Z := Z) (Bp := Bp) (B := B)) :
    ∃ f : PairHom (realizationPair p phi xi (reconstruct p phi xi P)) P,
      IsIso f.map ∧ ∀ x : TensorProduct Z B
        (realizationPair p phi xi (reconstruct p phi xi P)).T,
        x ∈ (realizationPair p phi xi (reconstruct p phi xi P)).Xi ↔
          TensorProduct.map (LinearMap.id : B →ₗ[Z] B) f.map.hom x ∈ P.Xi := by sorry

private def reconstructPairMap (p : ℕ) (phi : A ≃+* A) (xi : A)
    (P : LatticePair (Z := Z) (Bp := Bp) (B := B)) :
    PairHom (realizationPair p phi xi (reconstruct p phi xi P)) P := by sorry

private def realizationHom (p : ℕ) (phi : A ≃+* A) (xi : A) (M N : Module p phi xi)
    (g : Hom M N) : PairHom (realizationPair (Z := Z) (Bp := Bp) (B := B) p phi xi M)
      (realizationPair (Z := Z) (Bp := Bp) (B := B) p phi xi N) := by sorry

theorem reconstruct_morphism (p : ℕ) (phi : A ≃+* A) (xi : A)
    (P Q : LatticePair (Z := Z) (Bp := Bp) (B := B)) (f : PairHom P Q) :
    ∃ g : Hom (reconstruct p phi xi P) (reconstruct p phi xi Q),
      (realizationHom p phi xi _ _ g).map ≫ (reconstructPairMap p phi xi Q).map =
        (reconstructPairMap p phi xi P).map ≫ f.map := by sorry

theorem reconstruct_tensor (p : ℕ) (phi : A ≃+* A) (xi : A)
    (P Q : LatticePair (Z := Z) (Bp := Bp) (B := B)) :
    Nonempty ((reconstruct p phi xi (tensorPair P Q)).M ≅ ModuleCat.of A
      (TensorProduct A (reconstruct p phi xi P).M (reconstruct p phi xi Q).M)) := by sorry

/-- B_dR fiber of the analytic modification. The unavailable analytic sheaf
and the leg phi^(-1)(x_C) are omitted, but its actual lattice is retained. -/
theorem reconstruct_modification (p : ℕ) (phi : A ≃+* A) (xi : A)
    (P : LatticePair (Z := Z) (Bp := Bp) (B := B)) :
    (∀ x : TensorProduct Z B
      (realizationPair p phi xi (reconstruct p phi xi P)).T,
      x ∈ (realizationPair p phi xi (reconstruct p phi xi P)).Xi ↔
        TensorProduct.map (LinearMap.id : B →ₗ[Z] B)
          (reconstructPairMap p phi xi P).map.hom x ∈ P.Xi) ∧
    (∀ y ∈ P.Xi, ∃ x ∈ (realizationPair p phi xi (reconstruct p phi xi P)).Xi,
      TensorProduct.map (LinearMap.id : B →ₗ[Z] B)
        (reconstructPairMap p phi xi P).map.hom x = y) := by sorry

-- TauCeti.BKF.reconstruct_test_standard
example (p : ℕ) (phi : A ≃+* A) (xi : A) :
    Nonempty ((reconstruct p phi xi (standard (Bp := Bp) (B := B) (ModuleCat.of Z Z))).M ≅
      (unit p phi xi).M) := by sorry
-- TauCeti.BKF.reconstruct_test_shift; omitted primitive-root and common-map hypotheses.
example (p : ℕ) (phi : A ≃+* A) (xi : A) (xiDR : Bp)
    (P : LatticePair (Z := Z) (Bp := Bp) (B := B))
    (hT : Nonempty (P.T ≅ ModuleCat.of Z Z))
    (h : P.Xi = scaleLattice P.T ((algebraMap Bp B xiDR)^(-1 : ℤ)) (standardLattice P.T)) :
    ∃ (f : Hom (reconstruct p phi xi P) (twist p phi xi 1))
      (g : Hom (twist p phi xi 1) (reconstruct p phi xi P)),
      f.map ≫ g.map = 𝟙 _ ∧ g.map ≫ f.map = 𝟙 _ := by sorry
-- TauCeti.BKF.reconstruct_test_zero
example (p : ℕ) (phi : A ≃+* A) (xi : A)
    (P : LatticePair (Z := Z) (Bp := Bp) (B := B)) (h : Limits.IsZero P.T) :
    Limits.IsZero (reconstruct p phi xi P).M := by sorry

-- TauCeti.BKF.Module_test_unit: tests the realization and its actual lattice.
-- Omitted: common period coefficients and normalized Fontaine maps.
example {W : Type u} [CommRing W] [Algebra A W] [Algebra Z W]
    (p : ℕ) (phi : A ≃+* A) (xi : A) :
    Nonempty (etale (Z := Z) (W := W) p phi xi (unit p phi xi) ≅ ModuleCat.of Z Z) ∧
      (realizationPair (Z := Z) (Bp := Bp) (B := B) p phi xi (unit p phi xi)).Xi =
        standardLattice (realizationPair (Z := Z) (Bp := Bp) (B := B)
          p phi xi (unit p phi xi)).T := by sorry
end Reconstruction
end TauCeti.BKF

namespace TauCeti.AInfSheaf
variable {Site : Type u} [Category.{u} Site] {J : GrothendieckTopology Site}

/-- Completed integral structure sheaf on the existing site/sheaf carrier.
Omitted: this is the corrected analytic pro-etale site and O=O_X^+. -/
def completedIntegral (p : ℕ) (O : Sheaf J CommRingCat.{u}) : Sheaf J CommRingCat.{u} := by sorry
private def quotientSheaf (p n : ℕ) (O : Sheaf J CommRingCat.{u}) : Sheaf J CommRingCat.{u} := by sorry
private def completedMap (p : ℕ) {O O' : Sheaf J CommRingCat.{u}} (f : O ⟶ O') :
    completedIntegral p O ⟶ completedIntegral p O' := by sorry

theorem completedIntegral_mod_pn (p n : ℕ) (O : Sheaf J CommRingCat.{u}) :
    Nonempty (quotientSheaf p n (completedIntegral p O) ≅ quotientSheaf p n O) := by sorry

/-- Omitted: U is an affinoid perfectoid in the corrected pro-etale basis. -/
theorem completedIntegral_sections (p : ℕ) (O : Sheaf J CommRingCat.{u}) (U : Siteᵒᵖ) :
    Nonempty ((completedIntegral p O).obj.obj U ≃+*
      AdicCompletion (Ideal.span {(p : O.obj.obj U)}) (O.obj.obj U)) := by sorry

private def rationalIntegral (p : ℕ) (O : Sheaf J CommRingCat.{u}) :
    Sheaf J CommRingCat.{u} := by sorry

/-- Omitted: rationalIntegral is the completed rational structure sheaf on the
corrected perfectoid basis. Localization inverts the actual coefficient p. -/
theorem completedIntegral_localization (p : ℕ) (O : Sheaf J CommRingCat.{u})
    (U : Siteᵒᵖ) :
    Nonempty ((rationalIntegral p O).obj.obj U ≃+*
      Localization.Away (p : (completedIntegral p O).obj.obj U)) := by sorry

theorem completedIntegral_pullback (p : ℕ) {O O' O'' : Sheaf J CommRingCat.{u}}
    (f : O ⟶ O') (g : O' ⟶ O'') :
    completedMap p (f ≫ g) = completedMap p f ≫ completedMap p g := by sorry

-- TauCeti.AInfSheaf.completedIntegral_test_point; O_C coefficient identification omitted.
example (p : ℕ) (O : Sheaf J CommRingCat.{u}) (U : Siteᵒᵖ)
    [IsAdicComplete (Ideal.span {(p : O.obj.obj U)}) (O.obj.obj U)] :
    Nonempty ((completedIntegral p O).obj.obj U ≃+* O.obj.obj U) := by sorry
-- TauCeti.AInfSheaf.completedIntegral_test_mod_p
example (p : ℕ) (O : Sheaf J CommRingCat.{u}) :
    Nonempty (quotientSheaf p 1 (completedIntegral p O) ≅ quotientSheaf p 1 O) := by sorry
-- TauCeti.AInfSheaf.completedIntegral_test_profinite: product of points is
-- continuous functions, not arbitrary functions. The site object U identifying
-- S times Spa(C,O_C), and the coefficient identification with O_C, are omitted.
example {O0 P : Type u} [CommRing O0] [TopologicalSpace O0] [IsTopologicalRing O0]
    [TopologicalSpace P] [CompactSpace P] [TotallyDisconnectedSpace P]
    (p : ℕ) (O : Sheaf J CommRingCat.{u}) (U : Siteᵒᵖ) :
    Nonempty ((completedIntegral p O).obj.obj U ≃+* ContinuousMap P O0) := by sorry

/-- Tilt ring sheaf; objectwise inverse Frobenius is sheafified on the same site. -/
def tilt (p : ℕ) [Fact p.Prime] (O : Sheaf J CommRingCat.{u}) : Sheaf J CommRingCat.{u} := by sorry
private def tiltMap (p : ℕ) [Fact p.Prime] {O O' : Sheaf J CommRingCat.{u}} (f : O ⟶ O') :
    tilt p O ⟶ tilt p O' := by sorry

theorem tilt_sections (p : ℕ) [Fact p.Prime] (O : Sheaf J CommRingCat.{u}) (U : Siteᵒᵖ)
    [Fact (¬IsUnit (p : (completedIntegral p O).obj.obj U))] :
    Nonempty ((tilt p O).obj.obj U ≃+* PreTilt ((completedIntegral p O).obj.obj U) p) := by sorry

theorem tilt_frobenius (p : ℕ) [Fact p.Prime] (O : Sheaf J CommRingCat.{u}) (U : Siteᵒᵖ) :
    Function.Bijective (fun x : (tilt p O).obj.obj U => x^p) := by sorry

/-- The untilting map is multiplicative. No additive RingHom is asserted. -/
theorem tilt_untilt {O0 : Type u} [CommRing O0] (p : ℕ) [Fact p.Prime]
    [Fact (¬IsUnit (p : O0))] [IsAdicComplete (Ideal.span {(p : O0)}) O0]
    (x y : PreTilt O0 p) : PreTilt.untilt (x*y) = PreTilt.untilt x * PreTilt.untilt y := by sorry

theorem tilt_pullback (p : ℕ) [Fact p.Prime] {O O' O'' : Sheaf J CommRingCat.{u}}
    (f : O ⟶ O') (g : O' ⟶ O'') : tiltMap p (f ≫ g) = tiltMap p f ≫ tiltMap p g := by sorry

-- TauCeti.AInfSheaf.tilt_test_char_p
example (p : ℕ) [Fact p.Prime] (O : Sheaf J CommRingCat.{u}) (U : Siteᵒᵖ) :
    (p : (tilt p O).obj.obj U) = 0 := by sorry
-- TauCeti.AInfSheaf.tilt_test_zero: the sharp of zero is zero.
example {O0 : Type u} [CommRing O0] (p : ℕ) [Fact p.Prime]
    [Fact (¬IsUnit (p : O0))] [IsAdicComplete (Ideal.span {(p : O0)}) O0] :
    PreTilt.untilt (0 : PreTilt O0 p) = 0 := by sorry
-- TauCeti.AInfSheaf.tilt_test_sharp_add: characteristic-two tilt of a
-- characteristic-zero complete ring gives sharp(1+1)=0, sharp(1)+sharp(1)=2.
example {O0 : Type u} [CommRing O0] [CharZero O0] [Fact (Nat.Prime 2)]
    [Fact (¬IsUnit (2 : O0))] [IsAdicComplete (Ideal.span {(2 : O0)}) O0] :
    PreTilt.untilt (1+1 : PreTilt O0 2) ≠
      PreTilt.untilt (1 : PreTilt O0 2) + PreTilt.untilt (1 : PreTilt O0 2) := by sorry

section AffineDerived
variable {A : Type u} [CommRing A]
/-- Affine representative of derived sections of the derived p-completed Witt
sheaf. Omitted: the ringed pro-etale site, sheafification, W_n of the tilt and
Rlim; K is their actual ModuleCat-valued section complex before completion.
The output is a complex, so no false concentration-in-degree-zero is imposed. -/
def ainf (p : ℕ) (K : CochainComplex (ModuleCat.{u} A) ℤ) :
    CochainComplex (ModuleCat.{u} A) ℤ := by sorry

theorem ainf_mod_pn (p n : ℕ) (K : CochainComplex (ModuleCat.{u} A) ℤ) :
    Nonempty (TauCeti.Decalage.modComplex ((p : A)^n) (ainf p K) ≅
      TauCeti.Decalage.modComplex ((p : A)^n) K) := by sorry

/-- Omitted: K is derived sections on an affinoid perfectoid U and A=W(R^flat).
Only H0 is an ordinary Witt ring; higher cohomology is merely almost zero. -/
theorem ainf_sections_H0 (p : ℕ) (K : CochainComplex (ModuleCat.{u} A) ℤ) :
    Nonempty ((ainf p K).homology 0 ≅ ModuleCat.of A A) := by sorry

/-- Omitted: the derived coefficient extension along shared Fontaine theta and
Kplus represents the completed integral sheaf with restricted scalars. -/
theorem ainf_theta (p : ℕ) (xi : A) (K Kplus : CochainComplex (ModuleCat.{u} A) ℤ) :
    Nonempty (TauCeti.Decalage.modComplex xi (ainf p K) ≅ Kplus) := by sorry

private def phiComplex (phi : A ≃+* A) (K : CochainComplex (ModuleCat.{u} A) ℤ) :
    CochainComplex (ModuleCat.{u} A) ℤ :=
  ((ModuleCat.restrictScalars phi.symm.toRingHom).mapHomologicalComplex (ComplexShape.up ℤ)).obj K

theorem ainf_frobenius (p : ℕ) (phi : A ≃+* A) (K : CochainComplex (ModuleCat.{u} A) ℤ) :
    Nonempty (ainf p (phiComplex phi K) ≅ phiComplex phi (ainf p K)) := by sorry

theorem ainf_complete (p : ℕ) (K : CochainComplex (ModuleCat.{u} A) ℤ) :
    Nonempty (ainf p (ainf p K) ≅ ainf p K) := by sorry

-- TauCeti.AInfSheaf.ainf_test_point; omitted K is the point's ordinary Witt ring.
example (p : ℕ) (K : CochainComplex (ModuleCat.{u} A) ℤ)
    [IsAdicComplete (Ideal.span {(p : A)}) A]
    (h : Nonempty (K.homology 0 ≅ ModuleCat.of A A))
    (hz : ∀ i : ℤ, i ≠ 0 → Limits.IsZero (K.homology i)) :
    Nonempty ((ainf p K).homology 0 ≅ ModuleCat.of A A) := by sorry
-- TauCeti.AInfSheaf.ainf_test_higher: a derived object need not be discrete;
-- omitted K is derived p-complete, so its degree-one class survives completion.
example (p : ℕ) (K : CochainComplex (ModuleCat.{u} A) ℤ)
    (h : ¬ Limits.IsZero (K.homology 1)) :
    ¬ Limits.IsZero ((ainf p K).homology 1) := by sorry
-- TauCeti.AInfSheaf.ainf_test_level_one
example (O : Type u) [CommRing O] (p : ℕ) [Fact p.Prime]
    [Fact (¬IsUnit (p : O))] [IsAdicComplete (Ideal.span {(p : O)}) O]
    (a : PreTilt O p) :
    (TauCeti.AInf.thetaWitt p 1 (WittVector.fontaineTheta O p)
      (WittVector.frobeniusEquiv p (PreTilt O p)) (WittVector.teichmuller p a)).coeff
        ⟨0, by decide⟩ = PreTilt.untilt a := by sorry
end AffineDerived
end TauCeti.AInfSheaf

namespace TauCeti.AOmega
variable {A : Type u} [CommRing A]
/-- Principal-chart representative of L_eta_mu Rnu_* A_inf. Omitted: the
ringed topoi morphism nu, derived p-completion, enhanced algebra and K-flat
replacement. K is the chosen mu-torsion-free representative of that pushforward. -/
def «local» (mu : A) (K : CochainComplex (ModuleCat.{u} A) ℤ)
    (hK : ∀ i : ℤ, Function.Injective (fun x : K.X i => mu • x)) :=
  TauCeti.Decalage.etaComplex mu K hK

theorem local_definition (mu : A) (K : CochainComplex (ModuleCat.{u} A) ℤ)
    (hK : ∀ i : ℤ, Function.Injective (fun x : K.X i => mu • x)) :
    «local» mu K hK = TauCeti.Decalage.etaComplex mu K hK := rfl

theorem local_roots (mu : A) (u : Aˣ) (K : CochainComplex (ModuleCat.{u} A) ℤ)
    (hK : ∀ i : ℤ, Function.Injective (fun x : K.X i => mu • x))
    (hu : ∀ i : ℤ, Function.Injective (fun x : K.X i => (u.val*mu) • x)) :
    Nonempty («local» mu K hK ≅ «local» (u.val*mu) K hu) := by sorry

def localMap (mu : A) (K L : CochainComplex (ModuleCat.{u} A) ℤ)
    (hK : ∀ i : ℤ, Function.Injective (fun x : K.X i => mu • x))
    (hL : ∀ i : ℤ, Function.Injective (fun x : L.X i => mu • x)) (f : K ⟶ L) :
    «local» mu K hK ⟶ «local» mu L hL := TauCeti.Decalage.etaMap mu K L hK hL f

theorem local_restriction (mu : A) (K L : CochainComplex (ModuleCat.{u} A) ℤ)
    (hK : ∀ i : ℤ, Function.Injective (fun x : K.X i => mu • x))
    (hL : ∀ i : ℤ, Function.Injective (fun x : L.X i => mu • x)) (f : K ⟶ L) :
    localMap mu K L hK hL f = TauCeti.Decalage.etaMap mu K L hK hL f := rfl

/-- Omitted: coherent E_infinity multiplication and K-flat derived tensor. -/
private def localCup (mu : A) (K : CochainComplex (ModuleCat.{u} A) ℤ)
    (hK : ∀ i : ℤ, Function.Injective (fun x : K.X i => mu • x))
    (hKK : ∀ i : ℤ, Function.Injective (fun x : (HomologicalComplex.tensorObj K K).X i => mu • x))
    (m : HomologicalComplex.tensorObj K K ⟶ K) :
    HomologicalComplex.tensorObj («local» mu K hK) («local» mu K hK) ⟶ «local» mu K hK :=
  TauCeti.Decalage.etaTensor mu K K hK hK hKK ≫
    TauCeti.Decalage.etaMap mu (HomologicalComplex.tensorObj K K) K hKK hK m

theorem local_multiplication (mu : A) (K : CochainComplex (ModuleCat.{u} A) ℤ)
    (hK : ∀ i : ℤ, Function.Injective (fun x : K.X i => mu • x))
    (hKK : ∀ i : ℤ, Function.Injective (fun x : (HomologicalComplex.tensorObj K K).X i => mu • x))
    (m : HomologicalComplex.tensorObj K K ⟶ K) :
    localCup mu K hK hKK m = TauCeti.Decalage.etaTensor mu K K hK hK hKK ≫
      TauCeti.Decalage.etaMap mu (HomologicalComplex.tensorObj K K) K hKK hK m := by sorry

/-- Omitted: K is the smooth-formal-scheme pushforward, Witt Frobenius identifies
phi^*K with K, and the period identity phi(mu)=tilde-xi*mu. -/
theorem local_frobenius (mu tildeXi : A) (phi : A ≃+* A)
    (K : CochainComplex (ModuleCat.{u} A) ℤ)
    (hK : ∀ i : ℤ, Function.Injective (fun x : K.X i => mu • x))
    (hEta : ∀ i : ℤ, Function.Injective (fun x : («local» mu K hK).X i => tildeXi • x)) :
    Nonempty (TauCeti.AInfSheaf.phiComplex phi («local» mu K hK) ≅
      TauCeti.Decalage.etaComplex tildeXi («local» mu K hK) hEta) := by sorry

/-- Omitted: derived p-completeness of K and the source completion-preservation
hypotheses. No ordinary-completion claim is made for arbitrary complexes. -/
theorem local_complete (p : ℕ) (mu : A) (K : CochainComplex (ModuleCat.{u} A) ℤ)
    (hK : ∀ i : ℤ, Function.Injective (fun x : K.X i => mu • x)) :
    Nonempty (TauCeti.AInfSheaf.ainf p («local» mu K hK) ≅ «local» mu K hK) := by sorry

-- TauCeti.AOmega.local_test_point; K is the point's A_inf in degree zero.
example (mu : A) (K : CochainComplex (ModuleCat.{u} A) ℤ)
    (hK : ∀ i : ℤ, Function.Injective (fun x : K.X i => mu • x))
    (h : Nonempty (K.homology 0 ≅ ModuleCat.of A A))
    (hz : ∀ i : ℤ, i ≠ 0 → Limits.IsZero (K.homology i)) :
    Nonempty ((«local» mu K hK).homology 0 ≅ ModuleCat.of A A) := by sorry
-- TauCeti.AOmega.local_test_torus; omitted actual toric K and its q-Koszul map.
example (mu : A) (K Q : CochainComplex (ModuleCat.{u} A) ℤ)
    (hK : ∀ i : ℤ, Function.Injective (fun x : K.X i => mu • x)) :
    Nonempty («local» mu K hK ≅ Q) := by sorry
-- TauCeti.AOmega.local_test_framings; omitted K,L are two framings of same chart.
example (mu : A) (K L : CochainComplex (ModuleCat.{u} A) ℤ)
    (hK : ∀ i : ℤ, Function.Injective (fun x : K.X i => mu • x))
    (hL : ∀ i : ℤ, Function.Injective (fun x : L.X i => mu • x)) :
    Nonempty («local» mu K hK ≅ «local» mu L hL) := by sorry

/-- Algebraic part of the perfectoid toric tower in d coordinates; completed
geometric tensor, perfectoidness and the adic universal cover are omitted.
The actual monoid algebra records exponents Z[1/p], not just integral powers. -/
def toricCover (p d : ℕ) : CommRingCat.{u} :=
  CommRingCat.of (AddMonoidAlgebra A (Fin d → Localization.Away (p : ℤ)))

private def toricAction (p d : ℕ)
    (chi : Multiplicative (Fin d → Localization.Away (p : ℤ)) →* Aˣ) :
    AddMonoidAlgebra A (Fin d → Localization.Away (p : ℤ)) ≃ₐ[A]
      AddMonoidAlgebra A (Fin d → Localization.Away (p : ℤ)) := by sorry

theorem toricCover_action (p d : ℕ)
    (chi : Multiplicative (Fin d → Localization.Away (p : ℤ)) →* Aˣ)
    (a : Fin d → Localization.Away (p : ℤ)) :
    toricAction p d chi (AddMonoidAlgebra.single a (1 : A)) =
      AddMonoidAlgebra.single a (chi (Multiplicative.ofAdd a)).val := by sorry

/-- Omitted: p-completed tower is perfectoid. This prototype only records the
p-th-root surjectivity on monomial exponents, not surjectivity on coefficients. -/
theorem toricCover_perfectoid (p : ℕ) [Fact p.Prime] :
    Function.Surjective (fun x : Localization.Away (p : ℤ) => (p : ℤ) • x) := by sorry

private def toricIntegralMap (p : ℕ) :
    AddMonoidAlgebra A (Fin 1 → ℤ) →ₐ[A]
      AddMonoidAlgebra A (Fin 1 → Localization.Away (p : ℤ)) := by sorry

theorem toricCover_integral_part (p : ℕ) (a : Fin 1 → ℤ) (c : A) :
    toricIntegralMap p (AddMonoidAlgebra.single a c) =
      AddMonoidAlgebra.single (fun i => (a i : Localization.Away (p : ℤ))) c := by sorry

theorem toricCover_transition (p : ℕ) (n : ℕ) :
    (p : Localization.Away (p : ℤ))^n * (p : Localization.Away (p : ℤ)) =
      (p : Localization.Away (p : ℤ))^(n+1) := by sorry

-- TauCeti.AOmega.toricCover_test_d0: the zero-coordinate tower is A.
example : Nonempty ((toricCover (A := A) 2 0) ≃+* A) := by sorry
-- TauCeti.AOmega.toricCover_test_d1: a genuinely fractional exponent exists.
-- The compatible root character is supplied; its geometric construction is omitted.
example (p n : ℕ) (a : Localization.Away (p : ℤ))
    (chi : Multiplicative (Fin 1 → Localization.Away (p : ℤ)) →* Aˣ)
    (zeta : Aˣ) (ha : (p^n : ℤ) • a = 1)
    (hzeta : chi (Multiplicative.ofAdd (fun _ : Fin 1 => a)) = zeta) :
    toricAction p 1 chi (AddMonoidAlgebra.single (fun _ : Fin 1 => a) (1 : A)) =
      AddMonoidAlgebra.single (fun _ : Fin 1 => a) zeta.val := by sorry
-- TauCeti.AOmega.toricCover_test_continuity: omitted the p-adic completed tower
-- topology and its continuous Z_p(1) action. Finite roots still obey the
-- p-power transition; no discrete topology on the infinite action is asserted.
example (p n : ℕ) (zeta : A) (h : zeta^(p^(n+1)) = 1) :
    (zeta^p)^(p^n) = 1 := by sorry
end TauCeti.AOmega

namespace TauCeti.AOmega
variable {A : Type u} [CommRing A]

/-- No division by q-1: this definition works at q=1 and for negative exponents. -/
def qInteger (q : Aˣ) (n : ℤ) : A :=
  if 0 ≤ n then ∑ j ∈ Finset.range n.toNat, q.val^j
  else -(q ^ n).val * ∑ j ∈ Finset.range (-n).toNat, q.val^j

private def qGamma (q : Aˣ) : LaurentPolynomial A ≃ₐ[A] LaurentPolynomial A := by sorry

def qDerivative (q : Aˣ) : LaurentPolynomial A →ₗ[A] LaurentPolynomial A := by sorry

private def twoTermLinear (M : ModuleCat.{u} A) (d : M ⟶ M) :
    CochainComplex (ModuleCat.{u} A) ℤ := by sorry

/-- One-variable Laurent q-de Rham representative, with differential relative
 to dlog T. Omitted: framing, (p,q-1)-completion and higher tensor factors.
The complex carrier is native; products require the twisted q-Leibniz rule. -/
def qModel (q : Aˣ) : CochainComplex (ModuleCat.{u} A) ℤ :=
  twoTermLinear (ModuleCat.of A (LaurentPolynomial A)) (ModuleCat.ofHom (qDerivative q))

theorem qModel_monomial (q : Aˣ) (n : ℤ) :
    qDerivative q (LaurentPolynomial.T n) = qInteger q n • LaurentPolynomial.T n := by sorry

theorem qModel_product (q : Aˣ) (a b : LaurentPolynomial A) :
    qDerivative q (a*b) = qDerivative q a * qGamma q b + a * qDerivative q b := by sorry

private def framedQComplex (q : Aˣ) (d : ℕ) : CochainComplex (ModuleCat.{u} A) ℤ := by sorry

/-- Actual tensor carrier for a split multi-coordinate framing; omitted:
completed tensor and the framed comparison with the multi-variable model. -/
theorem qModel_tensor (q : Aˣ) : Nonempty
    (framedQComplex q 2 ≅ HomologicalComplex.tensorObj (qModel q) (qModel q)) := by sorry

/-- Omitted: K is the continuous cochain complex of the one-dimensional toric
cover, and q=[epsilon]; the proposed isomorphism is not arbitrary framing data. -/
theorem qModel_comparison (q : Aˣ) (mu : A) (K : CochainComplex (ModuleCat.{u} A) ℤ)
    (hK : ∀ i : ℤ, Function.Injective (fun x : K.X i => mu • x)) :
    Nonempty (qModel q ≅ «local» mu K hK) := by sorry

theorem qModel_q_one (n : ℤ) :
    qDerivative (1 : Aˣ) (LaurentPolynomial.T n) = (n : A) • LaurentPolynomial.T n := by sorry

-- TauCeti.AOmega.qModel_test_T
example (q : Aˣ) : qDerivative q (LaurentPolynomial.T (1 : ℤ)) = LaurentPolynomial.T 1 := by sorry
-- TauCeti.AOmega.qModel_test_T2
example (q : Aˣ) : qDerivative q (LaurentPolynomial.T (2 : ℤ)) =
    (1+q.val) • LaurentPolynomial.T 2 := by sorry
-- TauCeti.AOmega.qModel_test_noncommutative: omega*T=q*T*omega, in the
-- degree-one coefficient module; both sides live in the actual Laurent ring.
example [Nontrivial A] (q : Aˣ) (h : q.val ≠ 1) :
    qGamma q (LaurentPolynomial.T (1 : ℤ)) ≠ LaurentPolynomial.T 1 := by sorry

private def finiteXi (phi : A ≃+* A) (xi : A) (r : ℕ) :=
  (phi^r) (TauCeti.AInf.xiWitt phi xi r)

/-- Underlying complex of the first F-V construction. Omitted: both D and
D/xi are connective, commutative enhanced D, invertible semilinear phi_D, the special normalized
Fontaine generator, and multiplication on cohomology. Odd squares may persist. -/
def wittPre (phi : A ≃+* A) (xi : A) (r : ℕ)
    (K : CochainComplex (ModuleCat.{u} A) ℤ) : CochainComplex (ModuleCat.{u} A) ℤ :=
  TauCeti.Decalage.bockstein (finiteXi phi xi r) K

theorem wittPre_term (phi : A ≃+* A) (xi : A) (r : ℕ)
    (K : CochainComplex (ModuleCat.{u} A) ℤ) (i : ℤ) :
    (wittPre phi xi r K).X i = (TauCeti.Decalage.modComplex (finiteXi phi xi r) K).homology i := rfl

theorem wittPre_d (phi : A ≃+* A) (xi : A) (r : ℕ)
    (K : CochainComplex (ModuleCat.{u} A) ℤ) (i : ℤ) :
    (wittPre phi xi r K).d i (i+1) =
      ModuleCat.ofHom (TauCeti.Decalage.beta (finiteXi phi xi r) K i) := by sorry

private def preF (phi : A ≃+* A) (xi : A) (r : ℕ)
    (K : CochainComplex (ModuleCat.{u} A) ℤ) (i : ℤ) :
    (wittPre phi xi (r+1) K).X i →ₗ[A] (wittPre phi xi r K).X i := by sorry
private def preV (phi : A ≃+* A) (xi : A) (r : ℕ)
    (K : CochainComplex (ModuleCat.{u} A) ℤ) (i : ℤ) :
    (wittPre phi xi r K).X i →ₗ[A] (wittPre phi xi (r+1) K).X i := by sorry
private def preRawR (phi : A ≃+* A) (xi : A) (r : ℕ)
    (K : CochainComplex (ModuleCat.{u} A) ℤ) (i : ℤ) :
    (wittPre phi xi (r+1) K).X i →ₛₗ[phi.symm.toRingHom] (wittPre phi xi r K).X i := by sorry

private def preR (phi : A ≃+* A) (xi : A) (r : ℕ)
    (K : CochainComplex (ModuleCat.{u} A) ℤ) (i : ℤ) :
    (wittPre phi xi (r+1) K).X i →ₛₗ[phi.symm.toRingHom] (wittPre phi xi r K).X i :=
  xi^i.toNat • preRawR phi xi r K i

/-- Omitted source hypotheses from wittPre, including theta_r(xi)=V(1).
Restriction is theta-tilde_r(xi)^i times phi_D^-1, not the raw R'. -/
theorem wittPre_FVR (p : ℕ) (phi : A ≃+* A) (xi : A) (r : ℕ)
    (K : CochainComplex (ModuleCat.{u} A) ℤ) (i : ℤ) (x : (wittPre phi xi r K).X i) :
    preF phi xi r K i (preV phi xi r K i x) = (p : A) • x ∧
      preF phi xi r K (i+1) (((wittPre phi xi (r+1) K).d i (i+1)).hom (preV phi xi r K i x)) =
        ((wittPre phi xi r K).d i (i+1)).hom x := by sorry

/-- Omitted: the source multiplication on H0, represented here by a ring
structure, and coefficient compatibility. Lambda is a unital ring map. -/
private def preLambda {S : Type u} [CommRing S] (p : ℕ) [Fact p.Prime]
    (phi : A ≃+* A) (xi : A) (r : ℕ) (K : CochainComplex (ModuleCat.{u} A) ℤ)
    [CommRing ((wittPre phi xi r K).X 0)] :
    TruncatedWittVector p r S →+* (wittPre phi xi r K).X 0 := by sorry

/-! The CR.4 relative de Rham--Witt source, restricted along the normalized
finite Fontaine coefficient map. Its missing construction is represented by
data on native complexes, not by an arbitrary complex with a certificate.
The products and operations below are the source operations, not new owners. -/
private def relativeWittSource (p : ℕ) (S B : Type u) [CommRing S] [CommRing B]
    [Algebra S B] (r : ℕ) : CochainComplex (ModuleCat.{u} A) ℤ := by sorry
private def relativeWittLambda (p : ℕ) [Fact p.Prime] (S B : Type u)
    [CommRing S] [CommRing B] [Algebra S B] (r : ℕ) :
    TruncatedWittVector p r B → (relativeWittSource (A := A) p S B r).X 0 := by sorry
private def relativeWittF (p : ℕ) (S B : Type u) [CommRing S] [CommRing B]
    [Algebra S B] (r : ℕ) (i : ℤ) :
    (relativeWittSource (A := A) p S B (r+1)).X i →
      (relativeWittSource (A := A) p S B r).X i := by sorry
private def relativeWittV (p : ℕ) (S B : Type u) [CommRing S] [CommRing B]
    [Algebra S B] (r : ℕ) (i : ℤ) :
    (relativeWittSource (A := A) p S B r).X i →
      (relativeWittSource (A := A) p S B (r+1)).X i := by sorry
private def relativeWittR (p : ℕ) (S B : Type u) [CommRing S] [CommRing B]
    [Algebra S B] (r : ℕ) (i : ℤ) :
    (relativeWittSource (A := A) p S B (r+1)).X i →
      (relativeWittSource (A := A) p S B r).X i := by sorry
private def relativeWittProduct (p : ℕ) (S B : Type u) [CommRing S] [CommRing B]
    [Algebra S B] (r : ℕ) (i j : ℤ) :
    (relativeWittSource (A := A) p S B r).X i →
      (relativeWittSource (A := A) p S B r).X j →
        (relativeWittSource (A := A) p S B r).X (i+j) := by sorry
private def preProduct (phi : A ≃+* A) (xi : A) (K : CochainComplex (ModuleCat.{u} A) ℤ)
    (r : ℕ) (i j : ℤ) : (wittPre phi xi r K).X i → (wittPre phi xi r K).X j →
      (wittPre phi xi r K).X (i+j) := by sorry
private def preOne (phi : A ≃+* A) (xi : A) (K : CochainComplex (ModuleCat.{u} A) ℤ)
    (r : ℕ) : (wittPre phi xi r K).X 0 := by sorry
private def preBaseCoefficient (p : ℕ) [Fact p.Prime] (S : Type u) [CommRing S]
    (phi : A ≃+* A) (xi : A) (K : CochainComplex (ModuleCat.{u} A) ℤ) (r : ℕ) :
    TruncatedWittVector p r S → (wittPre phi xi r K).X 0 := by sorry
private def relativeWittCoefficient (p r : ℕ) [Fact p.Prime] (S B : Type u)
    [CommRing S] [CommRing B] [Algebra S B] :
    TruncatedWittVector p r S →+* TruncatedWittVector p r B := by sorry

/-- Explicit laws for the coefficient ring maps and their F,V,R compatibility. -/
private def wittCoefficientLaws (p : ℕ) [Fact p.Prime] (S B : Type u)
    [CommRing S] [CommRing B] [Algebra S B] (phi : A ≃+* A) (xi : A)
    (K : CochainComplex (ModuleCat.{u} A) ℤ)
    (lambda : ∀ r, TruncatedWittVector p r B → (wittPre phi xi r K).X 0) : Prop :=
  (∀ r, 1 ≤ r → lambda r 1 = preOne phi xi K r) ∧
  (∀ r, 1 ≤ r → ∀ x y, lambda r (x+y) = lambda r x + lambda r y) ∧
  (∀ r, 1 ≤ r → ∀ x y, lambda r (x*y) = preProduct phi xi K r 0 0 (lambda r x) (lambda r y)) ∧
  (∀ r, 1 ≤ r → ∀ s : TruncatedWittVector p r S,
    lambda r (relativeWittCoefficient p r S B s) = preBaseCoefficient p S phi xi K r s) ∧
  (∀ r, 1 ≤ r → ∀ z, preF phi xi r K 0 (lambda (r+1) z) = lambda r (TauCeti.AInf.finiteF p r z)) ∧
  (∀ r, 1 ≤ r → ∀ z, preV phi xi r K 0 (lambda r z) = lambda (r+1) (TauCeti.AInf.finiteV p r z)) ∧
  (∀ r, 1 ≤ r → ∀ z, preR phi xi r K 0 (lambda (r+1) z) =
    lambda r (TruncatedWittVector.truncate (Nat.le_succ r) z))

/-- A family of DGA maps over the specified coefficient maps, with F,V,R.
The conditions are equations on the actual source and target, not opaque flags. -/
private def compatibleWittFamily (p : ℕ) [Fact p.Prime] (S B : Type u)
    [CommRing S] [CommRing B] [Algebra S B] (phi : A ≃+* A) (xi : A)
    (K : CochainComplex (ModuleCat.{u} A) ℤ)
    (lambda : ∀ r, TruncatedWittVector p r B → (wittPre phi xi r K).X 0)
    (a : ∀ r : ℕ, 1 ≤ r → (relativeWittSource p S B r ⟶ wittPre phi xi r K)) : Prop :=
  (∀ r hr z, ((a r hr).f 0).hom (relativeWittLambda p S B r z) = lambda r z) ∧
  (∀ r hr i z, ((a r hr).f i).hom (relativeWittF p S B r i z) =
    preF phi xi r K i (((a (r+1) (by omega)).f i).hom z)) ∧
  (∀ r hr i z, ((a (r+1) (by omega)).f i).hom (relativeWittV p S B r i z) =
    preV phi xi r K i (((a r hr).f i).hom z)) ∧
  (∀ r hr i z, ((a r hr).f i).hom (relativeWittR p S B r i z) =
    preR phi xi r K i (((a (r+1) (by omega)).f i).hom z)) ∧
  (∀ r hr i j x y, ((a r hr).f (i+j)).hom (relativeWittProduct p S B r i j x y) =
    preProduct phi xi K r i j (((a r hr).f i).hom x) (((a r hr).f j).hom y))

/-- BMS1 §11.1, pp. 86–87. The precomplex requires the Teichmuller rule and
vanishing odd squares in addition to coefficient F,V,R laws. Omitted: enhanced
D and D/xi are connective, invertible semilinear phi_D, and normalization.
These unavailable source hypotheses are not assumed as comparison conclusions. -/
theorem wittPre_lambda {S B : Type u} [CommRing S] [CommRing B] [Algebra S B]
    (p : ℕ) [Fact p.Prime] (phi : A ≃+* A) (xi : A)
    (K : CochainComplex (ModuleCat.{u} A) ℤ)
    (lambda : ∀ r, TruncatedWittVector p r B → (wittPre phi xi r K).X 0)
    (hLambda : wittCoefficientLaws p S B phi xi K lambda)
    (hTeich : ∀ r, 1 ≤ r → ∀ b : B,
      preF phi xi r K 1 (((wittPre phi xi (r+1) K).d 0 1).hom
        (lambda (r+1) (WittVector.truncate (r+1) (WittVector.teichmuller p b)))) =
      preProduct phi xi K r 0 1
        (lambda r (WittVector.truncate r (WittVector.teichmuller p (b^(p-1)))))
        (((wittPre phi xi r K).d 0 1).hom
          (lambda r (WittVector.truncate r (WittVector.teichmuller p b)))))
    (hOdd : ∀ r, 1 ≤ r → ∀ i : ℤ, Odd i → ∀ x : (wittPre phi xi r K).X i,
      preProduct phi xi K r i i x x = 0) :
    ∃! a : ∀ r : ℕ, 1 ≤ r → (relativeWittSource p S B r ⟶ wittPre phi xi r K),
      compatibleWittFamily p S B phi xi K lambda a := by sorry

-- TauCeti.AOmega.wittPre_test_degree_zero: at degree zero R=R', with no factor.
example (phi : A ≃+* A) (xi : A) (r : ℕ)
    (K : CochainComplex (ModuleCat.{u} A) ℤ) :
    preR phi xi r K 0 = preRawR phi xi r K 0 := by sorry
-- TauCeti.AOmega.wittPre_test_point; omitted K represents A_inf of a point.
example (phi : A ≃+* A) (xi : A) (r : ℕ) (K : CochainComplex (ModuleCat.{u} A) ℤ) :
    Nonempty ((wittPre phi xi r K).X 0 ≅ ModuleCat.of A (A ⧸ Ideal.span {finiteXi phi xi r})) := by sorry
-- TauCeti.AOmega.wittPre_test_torsion: numerical analogue of a discarded weight.
-- Omitted: the toric coefficient identification. Ordinary pre-reduction retains
-- nonzero torsion in [Z --2→ Z], while eta_2 makes this fixture acyclic.
example : ∃ x : (wittPre (RingEquiv.refl ℤ) 2 1
    (TauCeti.Decalage.twoTermAt 0 (2 : ℤ))).X 0, x ≠ 0 ∧ (2 : ℤ) • x = 0 := by sorry

/-- Improved underlying complex. Its full F-V algebra structure additionally
requires Assumption11.4: p-torsion-freeness at every positive finite Witt level. -/
def wittImproved (mu : A) (phi : A ≃+* A) (xi : A) (r : ℕ)
    (K : CochainComplex (ModuleCat.{u} A) ℤ)
    (hK : ∀ i : ℤ, Function.Injective (fun x : K.X i => mu • x)) :
    CochainComplex (ModuleCat.{u} A) ℤ :=
  wittPre phi xi r (TauCeti.Decalage.etaComplex mu K hK)

theorem wittImproved_term (mu : A) (phi : A ≃+* A) (xi : A) (r : ℕ)
    (K : CochainComplex (ModuleCat.{u} A) ℤ)
    (hK : ∀ i : ℤ, Function.Injective (fun x : K.X i => mu • x)) (i : ℤ) :
    (wittImproved mu phi xi r K hK).X i =
      (TauCeti.Decalage.modComplex (finiteXi phi xi r) (TauCeti.Decalage.etaComplex mu K hK)).homology i := rfl

/-- Omitted: connective comparison L_eta_mu D→D (H0 mu-torsion-free), the
period normalization and Assumption11.4 ensuring injectivity. -/
def improvedInclusion (mu : A) (phi : A ≃+* A) (xi : A) (r : ℕ)
    (K : CochainComplex (ModuleCat.{u} A) ℤ)
    (hK : ∀ i : ℤ, Function.Injective (fun x : K.X i => mu • x)) :
    wittImproved mu phi xi r K hK ⟶ wittPre phi xi r K := by sorry

theorem wittImproved_inclusion (p : ℕ) (mu : A) (phi : A ≃+* A) (xi : A) (r : ℕ)
    (K : CochainComplex (ModuleCat.{u} A) ℤ)
    (hK : ∀ i : ℤ, Function.Injective (fun x : K.X i => mu • x))
    (hp : ∀ j : ℕ, 1 ≤ j → ∀ i : ℤ, 0 ≤ i → Function.Injective
      (fun x : (wittImproved mu phi xi j K hK).X i => (p : A) • x)) (i : ℤ) :
    Function.Injective ((improvedInclusion mu phi xi r K hK).f i).hom := by sorry

/-- Omitted: p is the period prime, the full enhanced algebra product and the
period hypotheses. The formula here is the genuine F-V identity on components. -/
theorem wittImproved_FVR (p : ℕ) (mu : A) (phi : A ≃+* A) (xi : A) (r : ℕ)
    (K : CochainComplex (ModuleCat.{u} A) ℤ)
    (hK : ∀ i : ℤ, Function.Injective (fun x : K.X i => mu • x)) (i : ℤ)
    (x : (wittImproved mu phi xi r K hK).X i) :
    preF phi xi r (TauCeti.Decalage.etaComplex mu K hK) i
      (preV phi xi r (TauCeti.Decalage.etaComplex mu K hK) i x) = (p : A) • x := by sorry

private def improvedR (mu : A) (phi : A ≃+* A) (xi : A) (r : ℕ)
    (K : CochainComplex (ModuleCat.{u} A) ℤ)
    (hK : ∀ i : ℤ, Function.Injective (fun x : K.X i => mu • x)) (i : ℤ) :
    (wittImproved mu phi xi (r+1) K hK).X i →ₛₗ[phi.symm.toRingHom]
      (wittImproved mu phi xi r K hK).X i := by sorry

/-- Omitted Assumption11.4 at every level, used for model independence. -/
theorem wittImproved_restriction (mu : A) (phi : A ≃+* A) (xi : A) (r : ℕ)
    (K : CochainComplex (ModuleCat.{u} A) ℤ)
    (hK : ∀ i : ℤ, Function.Injective (fun x : K.X i => mu • x)) (i : ℤ)
    (x : (wittImproved mu phi xi (r+1) K hK).X i) :
    improvedR mu phi xi r K hK (i+1) (((wittImproved mu phi xi (r+1) K hK).d i (i+1)).hom x) =
      ((wittImproved mu phi xi r K hK).d i (i+1)).hom (improvedR mu phi xi r K hK i x) := by sorry

/-- BMS1 Proposition 11.5, pp. 88–89. Assumption 11.4 at all positive levels
forces the Teichmuller rule and odd-square vanishing. The conclusion is the
unique relative de Rham--Witt DGA map, including lambda, products and F,V,R.
Omitted: the enhanced commutative algebra, both connectivity conditions,
primitive roots, H^0(D) mu-torsion-freeness and the normalized period scalars. -/
theorem wittImproved_universal_map {S B : Type u} [CommRing S] [CommRing B] [Algebra S B]
    (p : ℕ) [Fact p.Prime] (mu : A) (phi : A ≃+* A) (xi : A)
    (K : CochainComplex (ModuleCat.{u} A) ℤ)
    (hK : ∀ i : ℤ, Function.Injective (fun x : K.X i => mu • x))
    (hp : ∀ r, 1 ≤ r → ∀ i : ℤ, 0 ≤ i → Function.Injective
      (fun x : (wittImproved mu phi xi r K hK).X i => (p : A) • x))
    (lambda : ∀ r, TruncatedWittVector p r B → (wittImproved mu phi xi r K hK).X 0)
    (hLambda : wittCoefficientLaws p S B phi xi
      (TauCeti.Decalage.etaComplex mu K hK) lambda) :
    ∃! a : ∀ r : ℕ, 1 ≤ r → (relativeWittSource p S B r ⟶ wittImproved mu phi xi r K hK),
      compatibleWittFamily p S B phi xi (TauCeti.Decalage.etaComplex mu K hK) lambda a := by sorry

-- TauCeti.AOmega.wittImproved_test_point; omitted K is a point's coefficient complex.
example (mu : A) (phi : A ≃+* A) (xi : A) (r : ℕ)
    (K : CochainComplex (ModuleCat.{u} A) ℤ)
    (hK : ∀ i : ℤ, Function.Injective (fun x : K.X i => mu • x)) :
    Nonempty ((wittImproved mu phi xi r K hK).X 0 ≅ ModuleCat.of A (A ⧸ Ideal.span {finiteXi phi xi r})) := by sorry
-- TauCeti.AOmega.wittImproved_test_weight: primitive fractional toric weights
-- vanish under eta; omitted K is precisely such an acyclic fractional summand.
example (mu : A) (phi : A ≃+* A) (xi : A) (r : ℕ)
    (K : CochainComplex (ModuleCat.{u} A) ℤ)
    (hK : ∀ i : ℤ, Function.Injective (fun x : K.X i => mu • x)) :
    ∀ i : ℤ, Limits.IsZero ((wittImproved mu phi xi r K hK).X i) := by sorry
-- TauCeti.AOmega.wittImproved_test_r1: at length one the actual differential
-- is still the Bockstein, rather than the zero differential of a graded module.
example (mu : A) (phi : A ≃+* A) (xi : A)
    (K : CochainComplex (ModuleCat.{u} A) ℤ)
    (hK : ∀ i : ℤ, Function.Injective (fun x : K.X i => mu • x)) :
    (wittImproved mu phi xi 1 K hK).d 0 1 = ModuleCat.ofHom
      (TauCeti.Decalage.beta (finiteXi phi xi 1) (TauCeti.Decalage.etaComplex mu K hK) 0) := by sorry
end TauCeti.AOmega

namespace TauCeti.AInfPlan
variable {A B : Type u} [CommRing A] [CommRing B] [Algebra A B]

/-- Affine K-flat representative of derived coefficient extension. The source
and target are actual cochain complexes; K-flatness is unavailable and omitted. -/
def baseChangeComplex (K : CochainComplex (ModuleCat.{u} A) ℤ) :
    CochainComplex (ModuleCat.{u} B) ℤ := by sorry

/-- Proposed defining term API, not a replacement for ModuleCat or TensorProduct. -/
theorem baseChangeComplex_term (K : CochainComplex (ModuleCat.{u} A) ℤ) (i : ℤ) :
    Nonempty ((baseChangeComplex (B := B) K).X i ≅ ModuleCat.of B (TensorProduct A B (K.X i))) := by sorry
end TauCeti.AInfPlan

namespace TauCeti.AOmega
variable {A : Type u} [CommRing A]

/-- Affine representative of RΓ(mathfrak X,AΩ). Omitted: smooth proper formal
mathfrak X/O_C and the derived global section construction. K is its global
section model before derived p-completion. No freeness of individual H^i is
placed in the definition. -/
def proper (p : ℕ) (K : CochainComplex (ModuleCat.{u} A) ℤ) := TauCeti.AInfSheaf.ainf p K

def properHi (p : ℕ) (K : CochainComplex (ModuleCat.{u} A) ℤ) (i : ℤ) : ModuleCat.{u} A :=
  (proper p K).homology i

theorem proper_cohomology (p : ℕ) (K : CochainComplex (ModuleCat.{u} A) ℤ) (i : ℤ) :
    properHi p K i = (proper p K).homology i := rfl

private def properMap (p : ℕ) {K L : CochainComplex (ModuleCat.{u} A) ℤ} (f : K ⟶ L) :
    proper p K ⟶ proper p L := by sorry

theorem proper_pullback (p : ℕ) {K L M : CochainComplex (ModuleCat.{u} A) ℤ}
    (f : K ⟶ L) (g : L ⟶ M) : properMap p (f ≫ g) = properMap p f ≫ properMap p g := by sorry

private def properTensorMap (p : ℕ) (K L : CochainComplex (ModuleCat.{u} A) ℤ) :
    HomologicalComplex.tensorObj (proper p K) (proper p L) ⟶
      proper p (HomologicalComplex.tensorObj K L) := by sorry

private def properCup (p : ℕ) (K : CochainComplex (ModuleCat.{u} A) ℤ)
    (m : HomologicalComplex.tensorObj K K ⟶ K) :
    HomologicalComplex.tensorObj (proper p K) (proper p K) ⟶ proper p K :=
  properTensorMap p K K ≫ properMap p m

/-- Omitted: coherent enhanced cup products from the smooth formal scheme. -/
theorem proper_cup (p : ℕ) (K : CochainComplex (ModuleCat.{u} A) ℤ)
    (m : HomologicalComplex.tensorObj K K ⟶ K) :
    properCup p K m = properTensorMap p K K ≫ properMap p m := by sorry

private def properFrobenius (p : ℕ) (phi : A ≃+* A) (K : CochainComplex (ModuleCat.{u} A) ℤ) :
    TauCeti.AInfSheaf.phiComplex phi (proper p K) ⟶ proper p K := by sorry

private def localizedComplexMap (s : A) {K L : CochainComplex (ModuleCat.{u} A) ℤ}
    (a : K ⟶ L) :
    TauCeti.AInfPlan.baseChangeComplex (B := Localization.Away s) K ⟶
      TauCeti.AInfPlan.baseChangeComplex (B := Localization.Away s) L := by sorry

/-- Omitted: the integral Frobenius on AΩ and semilinear coefficient geometry. -/
theorem proper_frobenius (p : ℕ) (phi : A ≃+* A) (xi : A)
    (K : CochainComplex (ModuleCat.{u} A) ℤ) :
    IsIso (localizedComplexMap (phi xi) (properFrobenius p phi K)) := by sorry

/-- Omitted: proper perfectness and K-flat models of derived tensor/global-section
exchange; the coefficient map is specified by the actual Algebra instance. -/
theorem proper_base_change {B : Type u} [CommRing B] [Algebra A B]
    (p : ℕ) (K : CochainComplex (ModuleCat.{u} A) ℤ) :
    Nonempty (TauCeti.AInfPlan.baseChangeComplex (B := B) (proper p K) ≅
      proper p (TauCeti.AInfPlan.baseChangeComplex (B := B) K)) := by sorry

-- TauCeti.AOmega.proper_test_point; omitted K represents Spf(O_C).
example (p : ℕ) (K : CochainComplex (ModuleCat.{u} A) ℤ) :
    Nonempty (properHi p K 0 ≅ ModuleCat.of A A) ∧
      ∀ i : ℤ, i ≠ 0 → Limits.IsZero (properHi p K i) := by sorry
-- TauCeti.AOmega.proper_test_projective_line; omitted K represents P^1/O_C.
example (p : ℕ) (K : CochainComplex (ModuleCat.{u} A) ℤ) :
    Nonempty (properHi p K 0 ≅ ModuleCat.of A A) ∧
      Limits.IsZero (properHi p K 1) ∧
      Nonempty (properHi p K 2 ≅ TauCeti.AInf.bkTwist (-1)) := by sorry
-- TauCeti.AOmega.proper_test_torsion: a bounded finite free complex may have
-- torsion cohomology. This numerical test isolates the false inference and
-- does not assert that this two-term complex is the cohomology of a scheme.
example (p : ℕ) [Fact p.Prime] :
    ¬ Module.Free ℤ_[p] ((TauCeti.Decalage.twoTermAt 0 (p : ℤ_[p])).homology 1) := by sorry
end TauCeti.AOmega

namespace TauCeti.AInfPlan
variable {A : Type u} [CommRing A]

/-! Named theorems. Each prototype uses existing carriers. Comments identify
specific missing source conditions/objects; the packet and reader give the
complete statements. Source conditions that have baseline forms are retained. -/

/-- BMS1 Proposition3.24. Omitted: O is O_C or O_C^flat, the nondiscrete
valuation ring from the perfectoid-field supplier; no general coherence claim. -/
theorem witt_coherence {O : Type u} [CommRing O] (p r : ℕ) [Fact p.Prime]
    (hr : 1 ≤ r) (n m : ℕ)
    (f : (Fin n → TruncatedWittVector p r O) →ₗ[TruncatedWittVector p r O]
      (Fin m → TruncatedWittVector p r O)) :
    Module.Finite (TruncatedWittVector p r O) (LinearMap.ker f) := by sorry

/-- Zavyalov Theorem3.3.3. Omitted: O=O_C, T=Z_p(1), primitive zeta_p and the
Fontaine dlog construction. The image is (zeta_p-1)O_C{1}, not the whole line. -/
theorem fontaine_dlog {Z O : Type u} [CommRing Z] [CommRing O]
    [Algebra Z O] [Algebra A O] (T : ModuleCat.{u} Z) (zeta : O)
    (dlog : TensorProduct Z O T →ₗ[O] TensorProduct A O (TauCeti.AInf.bkTwist (A := A) 1)) :
    Function.Injective dlog ∧ LinearMap.range dlog =
      LinearMap.range ((zeta-1) • (LinearMap.id :
        TensorProduct A O (TauCeti.AInf.bkTwist (A := A) 1) →ₗ[O]
          TensorProduct A O (TauCeti.AInf.bkTwist (A := A) 1))) := by sorry

/-- The common map uses Mathlib's period carriers. Omitted: topology, principal
kernel, period DVR identification and the A_crys/B_crys compatibility square,
which remain with R06.1. No second rational period ring is defined. -/
local instance periodRing {O : Type u} [CommRing O] (p : ℕ)
    [Fact p.Prime] [Fact (¬IsUnit (p : O))]
    [IsAdicComplete (Ideal.span {(p : O)}) O] : CommRing (BDeRham O p) := by
  unfold BDeRham
  infer_instance

theorem common_rational_period_maps {O : Type u} [CommRing O] (p : ℕ)
    [Fact p.Prime] [Fact (¬IsUnit (p : O))]
    [IsAdicComplete (Ideal.span {(p : O)}) O] :
    Nonempty (BDeRhamPlus O p →+* BDeRham O p) := by sorry

private def beilinsonAdicUnderlying (f : A)
    (K : CochainComplex (ModuleCat.{u} A) ℤ) :
    CochainComplex (ModuleCat.{u} A) ℤ := by sorry

/-- BMS2 Proposition5.8, pp.32–33; BLM Example8.4.7, p.106.
beilinsonAdicUnderlying is the underlying colimit k→-infinity of the Beilinson
connective cover of the specific f-adic filtration on K. Omitted: the filtered
derived carrier and line powers; the target is not an arbitrary complex. -/
theorem filtered_beilinson_description (f : A)
    (hf : Function.Injective (fun x : A => f*x))
    (K : CochainComplex (ModuleCat.{u} A) ℤ)
    (hK : ∀ i : ℤ, Function.Injective (fun x : K.X i => f • x))
    [HasDerivedCategory (ModuleCat.{u} A)] :
    Nonempty (DerivedCategory.Q.obj (beilinsonAdicUnderlying f K) ≅
      DerivedCategory.Q.obj (TauCeti.Decalage.etaComplex f K hK)) := by sorry

/-- Scalar Koszul test of Lemma7.9 in two factors; a genuine tensor complex
with differential signs, not a Boolean encoding of the formula. The missing
commuting-endomorphism Koszul carrier is requested from DD.1. -/
theorem koszul_decalage_calculation (f : A)
    (hf : Function.Injective (fun x : A => f*x))
    (hTensor : ∀ i : ℤ, Function.Injective (fun x :
      (HomologicalComplex.tensorObj (TauCeti.Decalage.twoTermAt 0 (f^2))
        (TauCeti.Decalage.twoTermAt 0 (f^3))).X i => f • x)) :
    Nonempty (TauCeti.Decalage.etaComplex f
      (HomologicalComplex.tensorObj (TauCeti.Decalage.twoTermAt 0 (f^2))
        (TauCeti.Decalage.twoTermAt 0 (f^3))) hTensor ≅
      HomologicalComplex.tensorObj (TauCeti.Decalage.twoTermAt 0 f)
        (TauCeti.Decalage.twoTermAt 0 (f^2))) := by sorry

/-- BMS1 Lemma4.6, p.35. Omitted: A=A_inf(O_C), U=Spec(A) minus its closed point,
E is an algebraic vector bundle on U, and M=Gamma(U,E). Geometry and the
restriction comparison come from the existing supplier, not a new curve. -/
theorem punctured_spectrum_triviality (M : ModuleCat.{u} A) :
    Module.Free A M ∧ Module.Finite A M := by sorry

/-- BMS1 Proposition4.13. Omitted: A=A_inf, x=[varpi^flat] and the perfect
finite-resolution properties of kernel/cokernel (no baseline perfect-module
predicate). The four-term exact sequence is represented by kernel and cokernel
of M→N; both annihilator bounds remain explicit. -/
theorem ainf_module_structure (p : ℕ) (x : A) (M : ModuleCat.{u} A)
    [Module.FinitePresentation A M]
    [Module.Projective (Localization.Away (p : A)) (LocalizedModule (Submonoid.powers (p : A)) M)] :
    ∃ (N : ModuleCat.{u} A) (_ : Module.Free A N) (_ : Module.Finite A N)
      (f : M →ₗ[A] N) (n : ℕ),
      (∀ z : LinearMap.ker f, (p : A)^n • z = 0) ∧
        ∀ z : N ⧸ LinearMap.range f, ∀ a ∈ (Ideal.span {(p : A),x})^n, a • z = 0 := by sorry

/-- BMS1 Theorem4.28 / SW14.1.1: native Hom-type equivalence, finite-free
objects only. Omitted: common period coefficient identifications and analytic
reconstruction input. Essential surjectivity is reconstruct_pair above. -/
theorem fargues_classification {Z Bp B : Type u} [CommRing Z] [CommRing Bp] [Field B]
    [Algebra Z Bp] [Algebra Z B] [Algebra Bp B] [IsScalarTower Z Bp B]
    (p : ℕ) (phi : A ≃+* A) (xi : A) (M N : TauCeti.BKF.Module p phi xi)
    [Module.Free A M.M] [Module.Free A N.M] :
    Nonempty (TauCeti.BKF.Hom M N ≃ TauCeti.BKF.PairHom
      (TauCeti.BKF.realizationPair (Z := Z) (Bp := Bp) (B := B) p phi xi M)
      (TauCeti.BKF.realizationPair (Z := Z) (Bp := Bp) (B := B) p phi xi N)) := by sorry

/-- Restriction of the scalar-extended BKF morphism to Frobenius invariants.
Omitted: compatibility of the common coefficient maps and extended Frobenius. -/
private def minusculeEtaleMap {Z W : Type u} [CommRing Z] [CommRing W]
    [Algebra A W] [Algebra Z W] (p : ℕ) (phi : A ≃+* A) (xi : A)
    (M N : TauCeti.BKF.Module p phi xi) (f : TauCeti.BKF.Hom M N) :
    TauCeti.BKF.etale (Z := Z) (W := W) p phi xi M ⟶
      TauCeti.BKF.etale (Z := Z) (W := W) p phi xi N := by sorry

/-- ALB Proposition4.3.5 (published4.47), faithfulness of the minuscule triple.
Omitted: minuscule integral linearization, continuous etale realization,
identification R=A_crys, and B_crys comparison alpha. Both displayed maps use
the actual source and target modules. The crystalline component is scalar
extension of the given BKF morphism. -/
theorem minuscule_crystalline_triple {Z W R : Type u}
    [CommRing Z] [CommRing W] [CommRing R] [Algebra A W] [Algebra Z W]
    (p : ℕ) (phi : A ≃+* A) (xi : A) (crys : A →+* R)
    (M N : TauCeti.BKF.Module p phi xi)
    [Module.Free A M.M] [Module.Free A N.M] :
    Function.Injective (fun f : TauCeti.BKF.Hom M N =>
      (minusculeEtaleMap (Z := Z) (W := W) p phi xi M N f,
        (ModuleCat.extendScalars crys).map f.map)) := by sorry

/-- Hodge--Tate uses tilde-theta, hence tilde-xi, and degree i has twist {-i}.
Omitted: the smooth formal scheme, completed coefficient extension and the
Kaehler exterior-power identification of H (over O_C with restricted scalars). -/
theorem hodge_tate (mu tildeXi : A)
    (K : CochainComplex (ModuleCat.{u} A) ℤ)
    (hK : ∀ i : ℤ, Function.Injective (fun x : K.X i => mu • x))
    (i : ℤ) (H : ModuleCat.{u} A) :
    Nonempty ((TauCeti.Decalage.modComplex tildeXi (TauCeti.AOmega.local mu K hK)).homology i ≅ H) := by sorry

/-- BMS1 Theorem11.1; CR.4 supplies W, its continuous relative Witt complex,
products, F,V,R and coefficient maps. Omitted: toric/descent geometry and the
Assumption11.4 torsion-freeness proof. -/
theorem relative_witt_comparison (mu xi : A) (phi : A ≃+* A) (r : ℕ) (hr : 1 ≤ r)
    (K W : CochainComplex (ModuleCat.{u} A) ℤ)
    (hK : ∀ i : ℤ, Function.Injective (fun x : K.X i => mu • x))
    [HasDerivedCategory (ModuleCat.{u} A)] :
    Nonempty (DerivedCategory.Q.obj W ≅
      DerivedCategory.Q.obj (TauCeti.AOmega.wittImproved mu phi xi r K hK)) := by sorry

/-- De Rham uses theta and xi. Omitted: formally smooth R, D its completed
Kaehler de Rham complex, and the enhancement needed for Bockstein products. -/
theorem de_rham (mu xi : A) (K D : CochainComplex (ModuleCat.{u} A) ℤ)
    (hK : ∀ i : ℤ, Function.Injective (fun x : K.X i => mu • x))
    [HasDerivedCategory (ModuleCat.{u} A)] :
    Nonempty (DerivedCategory.Q.obj (TauCeti.Decalage.modComplex xi (TauCeti.AOmega.local mu K hK)) ≅
      DerivedCategory.Q.obj D) := by sorry

/-- BMS1 Theorem12.1: A_crys completed derived base change. Omitted: A_crys is
CR.0's actual Fontaine PD envelope, R is a small formally smooth algebra, Ccrys
is CR.2's absolute all-coordinate crystalline complex, and derived p-completion
/K-flatness of coefficient extension. -/
theorem absolute_crystalline_comparison {Ac : Type u} [CommRing Ac] [Algebra A Ac]
    (p : ℕ) (mu : A) (K : CochainComplex (ModuleCat.{u} A) ℤ)
    (hK : ∀ i : ℤ, Function.Injective (fun x : K.X i => mu • x))
    (Ccrys : CochainComplex (ModuleCat.{u} Ac) ℤ)
    [HasDerivedCategory (ModuleCat.{u} Ac)] :
    Nonempty (DerivedCategory.Q.obj (TauCeti.AInfSheaf.ainf p
      (baseChangeComplex (B := Ac) (TauCeti.AOmega.local mu K hK))) ≅
        DerivedCategory.Q.obj Ccrys) := by sorry

/-- BMS1 Theorem 14.1(iv), the local mu-inverted pro-etale sheaf comparison.
Omitted: the analytic generic fiber and nu; E is the affine representative
of (Rnu_* A_inf,X)[1/mu], retaining the derived p-completed period sheaf.
The proper Z_p-cohomology comparison additionally requires Theorem 5.7. -/
theorem mu_inverted_etale (p : ℕ) (mu : A) (K : CochainComplex (ModuleCat.{u} A) ℤ)
    (hK : ∀ i : ℤ, Function.Injective (fun x : K.X i => mu • x))
    (E : CochainComplex (ModuleCat.{u} (Localization.Away mu)) ℤ)
    [HasDerivedCategory (ModuleCat.{u} (Localization.Away mu))] :
    Nonempty (DerivedCategory.Q.obj (TauCeti.AInfSheaf.ainf p
      (baseChangeComplex (B := Localization.Away mu) (TauCeti.AOmega.local mu K hK))) ≅
        DerivedCategory.Q.obj E) := by sorry

/-- BMS1 Theorem14.3(i). Omitted: K=RΓ of AΩ for a smooth proper formal scheme
and derived p-completion hypotheses. Perfectness is expressed by an actual
bounded finite-projective complex rather than a field asserting the theorem. -/
theorem proper_perfectness (p : ℕ) (K : CochainComplex (ModuleCat.{u} A) ℤ)
    [HasDerivedCategory (ModuleCat.{u} A)] :
    ∃ C : CochainComplex (ModuleCat.{u} A) ℤ,
      Nonempty (DerivedCategory.Q.obj (TauCeti.AOmega.proper p K) ≅ DerivedCategory.Q.obj C) ∧
      (∃ a b : ℤ, ∀ i : ℤ, (i < a ∨ b < i) → Limits.IsZero (C.X i)) ∧
      ∀ i : ℤ, Module.Finite A (C.X i) ∧ Module.Projective A (C.X i) := by sorry

/-- BMS1 Corollary4.17. Omitted: A=A_inf, C is perfect and W is the residue Witt
ring. Every p-local cohomology is free; the source degree-i Witt reduction is
p-torsion-free. This yields finite freeness in degree i without dropping the
adjacent-degree hypotheses of the separate integral base-change statement. -/
theorem adjacent_degree_freeness {W : Type u} [CommRing W] [Algebra A W]
    (p : ℕ) (C : CochainComplex (ModuleCat.{u} A) ℤ) (i : ℤ)
    (hfree : ∀ j : ℤ, Module.Free (Localization.Away (p : A))
      (LocalizedModule (Submonoid.powers (p : A)) (C.homology j)))
    (htf : Function.Injective (fun x : (baseChangeComplex (B := W) C).homology i => (p : W) • x)) :
    Module.Free A (C.homology i) ∧ Module.Finite A (C.homology i) := by sorry

/-- BMS1 Theorem14.3. Omitted: K is the smooth proper AΩ global-section model,
phi/xi the common periods and the rational crystalline Frobenius input; the
finite-presentation/p-local-free proofs are conclusions via the BKF data. -/
theorem global_bkf (p : ℕ) (phi : A ≃+* A) (xi : A)
    (K : CochainComplex (ModuleCat.{u} A) ℤ) (i : ℤ) :
    ∃ M : TauCeti.BKF.Module p phi xi,
      Nonempty (M.M ≅ TauCeti.AOmega.properHi p K i) := by sorry
end TauCeti.AInfPlan

namespace TauCeti.AInf
variable {A Z W O : Type u} [CommRing A] [CommRing Z] [CommRing W] [CommRing O]
  [Algebra A W] [Algebra Z W] [Algebra A O]
/-- Omitted: Z=Z_p, W=W(C^flat), T is the continuous Tate module Z_p(1),
O=O_C via tilde-theta, and L is the intrinsic Fontaine line O_C{1}. The existing
module and tensor carriers express both coefficient comparisons. -/
theorem bkTwist_etale (p : ℕ) (phi : A ≃+* A) (xi : A)
    (T : ModuleCat.{u} Z) (L : ModuleCat.{u} O) :
    Nonempty (TauCeti.BKF.etale (Z := Z) (W := W) p phi xi (TauCeti.BKF.twist p phi xi 1) ≅ T) ∧
      Nonempty (TensorProduct A O (bkTwist (A := A) 1) ≃ₗ[O] L) := by sorry
end TauCeti.AInf

namespace TauCeti.Decalage
variable {R : Type u} [CommRing R]

theorem etaCycles (f : R) (C : CochainComplex (ModuleCat.{u} R) ℤ)
    (hC : ∀ i : ℤ, Function.Injective (fun x : C.X i => f • x)) (i : ℤ) (x : etaTerm f C i) :
    ((etaComplex f C hC).d i (i+1)).hom x = 0 ↔ (C.d i (i+1)).hom x.val = 0 := by sorry

theorem etaBoundaries (f : R) (C : CochainComplex (ModuleCat.{u} R) ℤ)
    (hC : ∀ i : ℤ, Function.Injective (fun x : C.X i => f • x)) (i : ℤ) (x : etaTerm f C i) :
    x ∈ LinearMap.range ((etaComplex f C hC).d (i-1) i).hom ↔
      ∃ y : C.X (i-1), (C.d (i-1) i).hom y = f • x.val := by sorry

private def killed (f : R) (M : ModuleCat.{u} R) : Submodule R M :=
  LinearMap.ker (f • (LinearMap.id : M →ₗ[R] M))

theorem etaCohomologyIso (f : R) (C : CochainComplex (ModuleCat.{u} R) ℤ)
    (hC : ∀ i : ℤ, Function.Injective (fun x : C.X i => f • x)) (i : ℤ) :
    Nonempty ((etaComplex f C hC).homology i ≅ ModuleCat.of R
      ((C.homology i) ⧸ killed f (C.homology i))) := by sorry

theorem eta_preservesQuasiIso (f : R) (C D : CochainComplex (ModuleCat.{u} R) ℤ)
    (hC : ∀ i : ℤ, Function.Injective (fun x : C.X i => f • x))
    (hD : ∀ i : ℤ, Function.Injective (fun x : D.X i => f • x)) (a : C ⟶ D) [QuasiIso a] :
    QuasiIso (etaMap f C D hC hD a) := by sorry
end TauCeti.Decalage

namespace TauCeti.AInfPlan
variable {A : Type u} [CommRing A]

/-! The private constructions below stand for the stated DD.1/E1 supplier
operations on existing complexes. They are data-valued signature prototypes,
not new roadmap nodes or certificates that comparisons hold. -/
private abbrev Complex (A : Type u) [CommRing A] := CochainComplex (ModuleCat.{u} A) ℤ
private def acyclic (K : Complex A) : Prop := ∀ i : ℤ, Limits.IsZero (K.homology i)
private def connective (K : Complex A) : Prop := ∀ i : ℤ, i < 0 → Limits.IsZero (K.homology i)
private def boundedPerfect (K : Complex A) : Prop :=
  ∃ (P : Complex A) (a b : ℤ) (q : P ⟶ K), QuasiIso q ∧
    (∀ i, i < a ∨ b < i → Limits.IsZero (P.X i)) ∧
    (∀ i, Module.Finite A (P.X i) ∧ Module.Projective A (P.X i))
private def tensorDerived (K L : Complex A) : Complex A := by sorry
private def completion (I : Ideal A) : Complex A ⥤ Complex A := by sorry
private def completionUnit (I : Ideal A) : 𝟭 (Complex A) ⟶ completion I := by sorry
private def derivedComplete (I : Ideal A) (K : Complex A) : Prop :=
  QuasiIso ((completionUnit I).app K)
private def derivedReduction (f : A) (K : Complex A) : Complex A := by sorry
private def derivedLimit (K : ℕ → Complex A) : Complex A := by sorry
private def truncInterval (a b : ℤ) (K : Complex A) : Complex A := by sorry
private def goodLE (n : ℤ) (K : Complex A) : Complex A := by sorry
private def goodGE (n : ℤ) (K : Complex A) : Complex A := by sorry
private def etaRepresentative (f : A) (K : Complex A) : Complex A := by sorry
private def etaRepresentativeMap (f : A) {K L : Complex A} (q : K ⟶ L) :
    etaRepresentative f K ⟶ etaRepresentative f L := by sorry
private def completeEtaComparison (f : A) (K : Complex A) :
    (completion (Ideal.span {f})).obj (etaRepresentative f K) ⟶
      etaRepresentative f ((completion (Ideal.span {f})).obj K) := by sorry
private def etaLimitComparison (f : A) (K : Complex A) :
    etaRepresentative f ((completion (Ideal.span {f})).obj K) ⟶
      derivedLimit (fun n => etaRepresentative f (derivedReduction (f^(n+1)) K)) := by sorry

section DerivedSignatures
variable [HasDerivedCategory (ModuleCat.{u} A)]

/-- BMS1 Corollary 6.5, p.50: affine filtered-colimit form. The ringed site and
line powers are omitted. Existence of the indicated colimits stays explicit. -/
theorem decalage_filtered_colimits {J : Type u} [Category J] [IsFiltered J]
    (f : A) (hf : Function.Injective (fun x : A => f*x))
    (F : J ⥤ DerivedCategory (ModuleCat.{u} A))
    [Limits.HasColimit F] [Limits.HasColimit (F ⋙ TauCeti.Decalage.derivedEta f)] :
    Nonempty ((TauCeti.Decalage.derivedEta f).obj (Limits.colimit F) ≅
      Limits.colimit (F ⋙ TauCeti.Decalage.derivedEta f)) := by sorry

/-- BMS1 Corollary 6.5, p.50, finite endpoints. Infinite endpoints are the separate
one-sided good truncations; no stupid truncation is intended. -/
theorem decalage_truncations (f : A) (hf : Function.Injective (fun x : A => f*x))
    (a b : ℤ) (K : Complex A) :
    Nonempty (DerivedCategory.Q.obj (etaRepresentative f (truncInterval a b K)) ≅
      DerivedCategory.Q.obj (truncInterval a b (etaRepresentative f K))) ∧
    Nonempty (DerivedCategory.Q.obj (etaRepresentative f (goodLE b K)) ≅
      DerivedCategory.Q.obj (goodLE b (etaRepresentative f K))) ∧
    Nonempty (DerivedCategory.Q.obj (etaRepresentative f (goodGE a K)) ≅
      DerivedCategory.Q.obj (goodGE a (etaRepresentative f K))) := by sorry
end DerivedSignatures

/-- BMS1 Lemma 6.19, p.55. Completion is derived completion, and J may differ from
(f). This preservation assertion does not assert commutation with J-completion. -/
theorem preservation_derived_completeness (f : A)
    (hf : Function.Injective (fun x : A => f*x)) (J : Ideal A) (hJ : J.FG)
    (K : Complex A) (hK : derivedComplete J K) :
    derivedComplete J (etaRepresentative f K) := by sorry

/-- BMS1 Lemma 6.20, p.55: it is the canonical comparison at the décalage ideal. -/
theorem completion_at_decalage_ideal (f : A)
    (hf : Function.Injective (fun x : A => f*x)) (K : Complex A) :
    QuasiIso (completeEtaComparison f K) := by sorry

/-- BMS1 Lemma 6.20, p.55: compatible reductions, not an arbitrary inverse system. -/
theorem completion_limit_model (f : A)
    (hf : Function.Injective (fun x : A => f*x)) (K : Complex A) :
    QuasiIso (etaLimitComparison f K) := by sorry

/-- Restricted sequences are a submodule of the product, not its direct sum. -/
private def restrictedSequences : Submodule (Polynomial ℚ) (ℕ → PowerSeries ℚ) := by sorry
private def sequenceShift : restrictedSequences →ₗ[Polynomial ℚ] restrictedSequences := by sorry
private instance sequenceModule : Module (Polynomial (Polynomial ℚ)) restrictedSequences := by sorry
private def restrictedComplex : Complex (Polynomial (Polynomial ℚ)) := by
  letI := sequenceModule
  exact (HomologicalComplex.single (ModuleCat.{0} (Polynomial (Polynomial ℚ)))
    (ComplexShape.up ℤ) 0).obj
    (ModuleCat.of (Polynomial (Polynomial ℚ)) restrictedSequences)
private instance polynomialSequenceModule : Module (Polynomial (Polynomial ℚ))
    (ℕ →₀ Polynomial ℚ) := by sorry
private def polynomialSequenceComplex : Complex (Polynomial (Polynomial ℚ)) := by
  letI := polynomialSequenceModule
  exact (HomologicalComplex.single (ModuleCat.{0} (Polynomial (Polynomial ℚ)))
    (ComplexShape.up ℤ) 0).obj
    (ModuleCat.of (Polynomial (Polynomial ℚ)) (ℕ →₀ Polynomial ℚ))
private def sequenceComparison : restrictedComplex ⟶
    etaRepresentative (Polynomial.X : Polynomial (Polynomial ℚ)) restrictedComplex := by sorry

/-- BMS1 warning following Lemma 6.19, p.55; explicit affine regression. Omitted: the two explicit scalar actions on these native
modules. The source t-action is a_(n+1)-x*a_n; it is not the zero action. -/
theorem restricted_sequence_completion [HasDerivedCategory
    (ModuleCat.{0} (Polynomial (Polynomial ℚ)))] :
    Nonempty (DerivedCategory.Q.obj
      ((completion (Ideal.span {Polynomial.C (Polynomial.X : Polynomial ℚ)})).obj
        polynomialSequenceComplex) ≅ DerivedCategory.Q.obj restrictedComplex) ∧
    (∀ s : ℕ → PowerSeries ℚ, s ∈ restrictedSequences ↔
      ∀ r : ℕ, ∃ N : ℕ, ∀ n, N ≤ n →
        ∃ b : PowerSeries ℚ, s n = PowerSeries.X^r * b) := by sorry

/-- BMS1 Example 6.5: the canonical map, not nonisomorphism of abstract objects.
The omitted action/comparison construction is fixed above and in the packet. -/
theorem unrelated_completion_counterexample : ¬ QuasiIso sequenceComparison ∧
    (∃ s : restrictedSequences, (∀ n, s.val n = PowerSeries.X^n) ∧
      sequenceShift s = 0 ∧ s ≠ 0) := by sorry

/-- BMS1 Lemma 6.1, affine form. K-flatness is stated by its actual tensor test.
The sheafwise construction and smallness choice are omitted. -/
theorem strongly_k_flat_replacements (K : Complex A) :
    ∃ (P : Complex A) (q : P ⟶ K), QuasiIso q ∧
      (∀ i : ℤ, Module.Flat A (P.X i)) ∧
      (∀ T : Complex A, acyclic T → acyclic (HomologicalComplex.tensorObj P T)) := by sorry

/-- BMS1 Proposition 6.8, valuation case; other rings retain only the lax map. -/
theorem valuation_monoidality [IsDomain A] [ValuationRing A] (f : A) (hf : f ≠ 0)
    (K L : Complex A)
    (hK : ∀ i, Function.Injective (fun x : K.X i => f • x))
    (hL : ∀ i, Function.Injective (fun x : L.X i => f • x))
    (hKL : ∀ i, Function.Injective
      (fun x : (HomologicalComplex.tensorObj K L).X i => f • x)) :
    QuasiIso (TauCeti.Decalage.etaTensor f K L hK hL hKL) := by sorry

private def upperComparison (f : A) (m : ℤ) (K : Complex A) :
    goodLE m K ⟶ goodLE m (etaRepresentative f K) := by sorry
private def lowerComparison (f : A) (n : ℤ) (K : Complex A) :
    goodGE n (etaRepresentative f K) ⟶ goodGE n K := by sorry
private def intervalUpper (f : A) (n m : ℤ) (K : Complex A) :
    truncInterval n m K ⟶ truncInterval n m (etaRepresentative f K) := by sorry
private def intervalLower (f : A) (n m : ℤ) (K : Complex A) :
    truncInterval n m (etaRepresentative f K) ⟶ truncInterval n m K := by sorry
private def scalarChain (a : A) (K : Complex A) : K ⟶ K := by sorry

/-- BMS1 Lemmas 6.9–6.10, generator-trivialized line factors. The maps are the
source truncation comparisons, not arbitrary choices of maps. -/
theorem truncation_comparison_maps (f : A)
    (hf : Function.Injective (fun x : A => f*x)) (n m : ℤ) (hnm : n ≤ m)
    (K : Complex A) (hHn : Function.Injective (fun x : K.homology n => f • x)) :
    intervalUpper f n m K ≫ intervalLower f n m K =
      scalarChain (f^(m-n).toNat) (truncInterval n m K) ∧
    intervalLower f n m K ≫ intervalUpper f n m K =
      scalarChain (f^(m-n).toNat) (truncInterval n m (etaRepresentative f K)) := by sorry

private def connectiveComparison (f : A) (K : Complex A) : etaRepresentative f K ⟶ K := by sorry
private def localizeMap (f : A) {K L : Complex A} (q : K ⟶ L) :
    baseChangeComplex (B := Localization.Away f) K ⟶
      baseChangeComplex (B := Localization.Away f) L := by sorry

/-- BMS1 Lemma 6.10. Connectivity and H^0 regularity permit the integral map. -/
theorem connective_comparison (f : A) (hf : Function.Injective (fun x : A => f*x))
    (K : Complex A) (hK : connective K)
    (hH0 : Function.Injective (fun x : K.homology 0 => f • x)) :
    QuasiIso (localizeMap f (connectiveComparison f K)) := by sorry

/-- BMS1 Lemma 6.11: principal affine composition, with both regularities. -/
theorem decalage_composition [HasDerivedCategory (ModuleCat.{u} A)]
    (f g : A) (hf : Function.Injective (fun x : A => f*x))
    (hg : Function.Injective (fun x : A => g*x)) :
    Nonempty (TauCeti.Decalage.derivedEta (f*g) ≅
      TauCeti.Decalage.derivedEta g ⋙ TauCeti.Decalage.derivedEta f) := by sorry

/-- The two directions of BMS1 Proposition 6.12 are separately inspectable. -/
theorem bockstein_map_injectivity (f : A)
    (hf : Function.Injective (fun x : A => f*x)) (K : Complex A)
    (hK : ∀ i, Function.Injective (fun x : K.X i => f • x)) (i : ℤ) :
    Function.Injective (HomologicalComplex.homologyMap
      (TauCeti.Decalage.bocksteinMap f K hK) i).hom := by sorry

theorem bockstein_map_surjectivity (f : A)
    (hf : Function.Injective (fun x : A => f*x)) (K : Complex A)
    (hK : ∀ i, Function.Injective (fun x : K.X i => f • x)) (i : ℤ) :
    Function.Surjective (HomologicalComplex.homologyMap
      (TauCeti.Decalage.bocksteinMap f K hK) i).hom := by sorry

/-- BMS1 Lemma 6.14, flat coefficient extension. The nonflat finite-Witt
comparison is the separate finite_witt_specialization signature below. -/
theorem flat_and_nonflat_base_change {B : Type u} [CommRing B] [Algebra A B]
    [Module.Flat A B] [HasDerivedCategory (ModuleCat.{u} B)] (f : A)
    (hf : Function.Injective (fun x : A => f*x)) (K : Complex A) :
    Nonempty (DerivedCategory.Q.obj (baseChangeComplex (B := B) (etaRepresentative f K)) ≅
      DerivedCategory.Q.obj (etaRepresentative (algebraMap A B f)
        (baseChangeComplex (B := B) K))) := by sorry

private def directSumComplex {ι : Type u} (K : ι → Complex A) : Complex A := by sorry
private def sumReductionLimit {ι : Type u} (H : ι → ModuleCat.{u} A) (f : A) :
    ModuleCat.{u} A := by sorry

/-- BMS1 Lemmas 6.17–6.18. The right side is lim_k ⊕_i H_i/f^k,
not a product of the completions. Repleteness of the ringed site is omitted. -/
theorem completed_sum_cohomology {ι : Type u} (f : A) (K : ι → Complex A)
    (hK : ∀ i, derivedComplete (Ideal.span {f}) (K i))
    (hH : ∀ i, IsAdicComplete (Ideal.span {f}) ((K i).homology 0))
    (n : ℕ) (hbound : ∀ i, ∀ x : (K i).homology 0,
      (∃ m : ℕ, f^m • x = 0) → f^n • x = 0) :
    Nonempty (((completion (Ideal.span {f})).obj (directSumComplex K)).homology 0 ≅
      sumReductionLimit (fun i => (K i).homology 0) f) := by sorry

/-- CR.4 consumes the completed eta_p/Bockstein comparison of BLM §§2.2–2.4.
No saturation or strict-Dieudonné equivalence is constructed here. -/
theorem dieudonne_consumer_contract (p : ℕ) [Fact p.Prime]
    (K : Complex A) (hp : Function.Injective (fun x : A => (p : A)*x))
    (hK : ∀ i, Function.Injective (fun x : K.X i => (p : A) • x)) :
    derivedComplete (Ideal.span {(p : A)})
      ((completion (Ideal.span {(p : A)})).obj (etaRepresentative (p : A) K)) ∧
    QuasiIso (TauCeti.Decalage.bocksteinMap (p : A) K hK) := by sorry
end TauCeti.AInfPlan

namespace TauCeti.AInfPlan
variable {A : Type u} [CommRing A]

private def coherent (R : Type u) [CommRing R] : Prop :=
  ∀ I : Ideal R, I.FG → Module.FinitePresentation R I
private def artinReesAt (R : Type u) [CommRing R] (f : R) : Prop :=
  ∀ M : ModuleCat.{u} R, Module.Finite R M → ∀ N : Submodule R M, N.FG →
    ∀ n : ℕ, ∃ k : ℕ, ∀ x : N,
      (∃ y : M, f^k • y = x.val) → ∃ z : N, f^n • z = x

/-- BMS1 Lemma 3.25(i), with both scalar actions and their agreement visible. -/
theorem witt_finite_presentation_devissage (I : Ideal A) (hI : I.FG)
    (M : Type u) [AddCommGroup M] [Module (A ⧸ I) M] [Module A M]
    [IsScalarTower A (A ⧸ I) M] :
    Module.FinitePresentation (A ⧸ I) M ↔ Module.FinitePresentation A M := by sorry

/-- BMS1 Lemma 3.25(ii). Coherence is expressed by its finite-ideal criterion. -/
theorem coherent_quotient (hA : coherent A) (I : Ideal A) (hI : I.FG) :
    coherent (A ⧸ I) := by sorry

/-- BMS1 Lemma 3.26. The kernel carries the quotient-ring action because I²=0;
compatibility is an explicit scalar equation, not an unnamed certificate. -/
theorem coherent_square_zero_extension {S : Type u} [CommRing S]
    (q : S →+* A) (hq : Function.Surjective q) (hA : coherent A)
    (hI : RingHom.ker q * RingHom.ker q = ⊥)
    [Module A (RingHom.ker q)]
    (haction : ∀ s : S, ∀ x : RingHom.ker q, q s • x = s • x)
    [Module.FinitePresentation A (RingHom.ker q)] : coherent S := by sorry

/-- BMS1 Lemma 3.27; no Noetherian hypothesis is substituted for Artin–Rees. -/
theorem coherence_artin_rees (f : A) (hf : Function.Injective (fun x : A => f*x))
    (hAR : artinReesAt A f) (hlocal : coherent (Localization.Away f))
    (hquot : coherent (A ⧸ Ideal.span {f})) : coherent A := by sorry

/-- BMS1 Lemma 3.28. The single exponent bounds the cokernel of A→S. -/
theorem artin_rees_bounded_isogeny {S : Type u} [CommRing S] [Algebra A S]
    (hinj : Function.Injective (algebraMap A S)) (f : A)
    (hA : Function.Injective (fun x : A => f*x))
    (hS : Function.Injective (fun x : S => algebraMap A S f * x))
    (n : ℕ) (hbound : ∀ y : S, ∃ x : A,
      (algebraMap A S f)^n * y = algebraMap A S x) :
    artinReesAt A f ↔ artinReesAt S (algebraMap A S f) := by sorry

private def finiteWittMap {S T : Type u} [CommRing S] [CommRing T]
    (p r : ℕ) [Fact p.Prime] (q : S →+* T) :
    TruncatedWittVector p r S →+* TruncatedWittVector p r T := by sorry
private def finiteWittIdeal {O : Type u} [CommRing O] (p r : ℕ) [Fact p.Prime]
    (m : Ideal O) : Ideal (TruncatedWittVector p r O) := by sorry
private def infiniteWittIdeal {S : Type u} [CommRing S] (p : ℕ) [Fact p.Prime]
    (m : Ideal S) : Ideal (WittVector p S) := by sorry
private def thetaInfinity {O : Type u} [CommRing O] (p : ℕ) [Fact p.Prime]
    (theta : A →+* O) (phi : A ≃+* A) : A →+* WittVector p O := by sorry

/-- BMS1 Lemma 3.23. Omitted: O is the integers of the mixed-characteristic
perfectoid field, A=W(O^flat), and the compatible cyclotomic choice defines mu.
Surjectivity requires spherical completeness and is deliberately separate. -/
theorem witt_limit_and_mu_kernel {S O : Type u} [CommRing S] [CommRing O]
    (p : ℕ) [Fact p.Prime] [CharP S p] [PerfectRing S p]
    (theta : WittVector p S →+* O) (phi : WittVector p S ≃+* WittVector p S)
    (mu xi : WittVector p S) (m : Ideal S) :
    RingHom.ker (thetaInfinity p theta phi) = Ideal.span {mu} ∧
    (⨅ r : ℕ, Ideal.span {TauCeti.AInf.xiWitt phi xi (r+1)}) = Ideal.span {mu} ∧
    (∀ a ∈ infiniteWittIdeal p m, ∀ w : WittVector p O,
      ∃ z : WittVector p S, thetaInfinity p theta phi z = thetaInfinity p theta phi a * w) := by sorry

/-- BMS1 §3.3 and Proposition 3.17. Omitted: the cyclotomic perfectoid-field
construction of these elements. Generic (p,[varpi])-adic geometry is imported
from upstream AdicSpaces Layer 6, not constructed again here. -/
theorem period_regularity (p : ℕ) [Fact p.Prime] (phi : A ≃+* A) (mu xi : A) :
    Function.Injective (fun x : A => (p : A)*x) ∧
    Function.Injective (fun x : A => mu*x) ∧
    (∀ r : ℕ, Function.Injective (fun x : A => TauCeti.AInf.xiWitt phi xi (r+1)*x)) ∧
    (∀ r : ℕ, Function.Injective (fun x : A ⧸ Ideal.span {(p : A)} =>
      Ideal.Quotient.mk _ (TauCeti.AInf.xiWitt phi xi (r+1)) * x)) ∧
    IsAdicComplete (Ideal.span {(p : A),xi}) A ∧ IsAdicComplete (Ideal.span {(p : A)}) A := by sorry

private def singleModule (M : ModuleCat.{u} A) : Complex A :=
  (HomologicalComplex.single (ModuleCat.{u} A) (ComplexShape.up ℤ) 0).obj M
private def derivedBaseChange {B : Type u} [CommRing B] [Algebra A B]
    (K : Complex A) : Complex B := by sorry
private def ordinaryBaseChange {B : Type u} [CommRing B] [Algebra A B]
    (M : ModuleCat.{u} A) : ModuleCat.{u} B := ModuleCat.of B (TensorProduct A B M)

/-- BMS1 Lemma 3.13, quotient presentation of the general-perfectoid comparison.
Regularity of the image of a kernel generator suffices for this Tor-independence;
there is no O_C period-regularity or blanket flatness hypothesis here. -/
theorem witt_base_change {B : Type u} [CommRing B] [Algebra A B]
    [HasDerivedCategory (ModuleCat.{u} B)] (xi : A)
    (hxi : Function.Injective (fun x : A => xi*x))
    (himage : Function.Injective (fun x : B => algebraMap A B xi * x)) :
    Nonempty (DerivedCategory.Q.obj
      (derivedBaseChange (B := B) (singleModule (ModuleCat.of A (A ⧸ Ideal.span {xi})))) ≅
      DerivedCategory.Q.obj (singleModule (ModuleCat.of B (B ⧸ Ideal.span {algebraMap A B xi})))) := by sorry

/-- BMS1 Corollary 3.29. Omitted: O is the nondiscrete perfectoid-field integers,
m its maximal ideal. Finite presentation is retained and almost zero means
annihilation by the actual finite-Witt ideal. -/
theorem no_almost_zero_witt_sections {O : Type u} [CommRing O]
    (p r : ℕ) [Fact p.Prime] (hr : 1 ≤ r) (m : Ideal O)
    (M : ModuleCat.{u} (TruncatedWittVector p r O))
    [Module.FinitePresentation (TruncatedWittVector p r O) M]
    (x : M) (hx : ∀ a ∈ finiteWittIdeal p r m, a • x = 0) : x = 0 := by sorry

private def wittPolynomialMap {S : Type u} [CommRing S]
    (p r d : ℕ) [Fact p.Prime] :
    MvPolynomial (Fin d) (TruncatedWittVector p r S) →+*
      TruncatedWittVector p r (MvPolynomial (Fin d) S) := by sorry
private def wittPolynomialPowerMap {S : Type u} [CommRing S]
    (p r d : ℕ) [Fact p.Prime] :
    TruncatedWittVector p r (MvPolynomial (Fin d) S) →+*
      TruncatedWittVector p r (MvPolynomial (Fin d) S) := by sorry
private def wittLaurentMap {S : Type u} [CommRing S]
    (p r d : ℕ) [Fact p.Prime] :
    AddMonoidAlgebra (TruncatedWittVector p r S) (Fin d → ℤ) →+*
      TruncatedWittVector p r (AddMonoidAlgebra S (Fin d → ℤ)) := by sorry
private def wittLaurentPowerMap {S : Type u} [CommRing S]
    (p r d : ℕ) [Fact p.Prime] :
    TruncatedWittVector p r (AddMonoidAlgebra S (Fin d → ℤ)) →+*
      TruncatedWittVector p r (AddMonoidAlgebra S (Fin d → ℤ)) := by sorry
private def wittRootMap {S : Type u} [CommRing S]
    (p r d : ℕ) [Fact p.Prime] :
    AddMonoidAlgebra (TruncatedWittVector p r S) (Fin d → Localization.Away (p : ℤ)) →+*
      TruncatedWittVector p r (AddMonoidAlgebra S (Fin d → Localization.Away (p : ℤ))) := by sorry

/-- BMS1 Lemma 9.8, p.74. The first and third maps send U_i to [T_i];
the power maps send T_i to T_i^(p^r). Both finite polynomial/Laurent inclusions
and the equality after adjoining every p-power root are retained. The native
ring-map factories stand for these coordinate maps, not arbitrary maps. -/
theorem witt_polynomial_calculation {S : Type u} [CommRing S]
    (p r d : ℕ) [Fact p.Prime] (hr : 1 ≤ r) :
    Function.Injective (wittPolynomialMap (S := S) p r d) ∧
    (wittPolynomialPowerMap (S := S) p r d).range ≤
      (wittPolynomialMap (S := S) p r d).range ∧
    Function.Injective (wittLaurentMap (S := S) p r d) ∧
    (wittLaurentPowerMap (S := S) p r d).range ≤
      (wittLaurentMap (S := S) p r d).range ∧
    Function.Bijective (wittRootMap (S := S) p r d) ∧
    (∀ a : Fin d → Localization.Away (p : ℤ), wittRootMap (S := S) p r d (AddMonoidAlgebra.single a 1) =
      WittVector.truncate r (WittVector.teichmuller p
        (AddMonoidAlgebra.single a (1 : S)))) := by sorry

/-- BMS1 Corollary 10.2, finite Witt almost setting. Omitted: perfectoid
valuation hypotheses, m maximal and nondiscrete. No idempotence assertion is
made for the infinite ideal W(m^flat) in A_inf. -/
theorem witt_almost_ideal {O : Type u} [CommRing O]
    (p r : ℕ) [Fact p.Prime] (hr : 1 ≤ r) (m : Ideal O) :
    finiteWittIdeal p r m * finiteWittIdeal p r m = finiteWittIdeal p r m ∧
    Module.Flat (TruncatedWittVector p r O) (finiteWittIdeal p r m) ∧
    (∀ w : TruncatedWittVector p r O,
      w ∈ finiteWittIdeal p r m ↔ ∀ i : Fin r, w.coeff i ∈ m) := by sorry

/-- BMS1 §10.1: the generic étale/base-change statement with the available
Algebra.Etale hypothesis. The finite-Witt algebra structures are induced by
the displayed base-ring maps. -/
theorem witt_etale_base_change {S T U : Type u} [CommRing S] [CommRing T] [CommRing U]
    [Algebra S T] [Algebra.Etale S T] [Algebra S U] (p r : ℕ) [Fact p.Prime] (hr : 1 ≤ r)
    [Algebra (TruncatedWittVector p r S) (TruncatedWittVector p r T)]
    [Algebra (TruncatedWittVector p r S) (TruncatedWittVector p r U)] :
    Nonempty ((TensorProduct (TruncatedWittVector p r S)
      (TruncatedWittVector p r T) (TruncatedWittVector p r U)) ≃+*
      TruncatedWittVector p r (TensorProduct S T U)) := by sorry

private def completedCotangent {R : Type v} {S : Type u} [CommRing R] [CommRing S] [Algebra R S]
    (p : ℕ) : Complex S := by sorry
private def lineInDegree (M : ModuleCat.{u} A) (i : ℤ) : Complex A := by sorry

/-- Zavyalov Theorem 3.3.3 proof, pp.35–36. Omitted: O=O_C and
S an integral perfectoid O-algebra. These are full completed cotangent complexes,
not ordinary Kaehler differentials. Degree -1 is the source cohomological [1]. -/
theorem completed_cotangent_twist {O S : Type u} [CommRing O] [CommRing S]
    (p : ℕ) [Fact p.Prime] [Algebra ℤ_[p] O] [Algebra O S] [Algebra A O]
    [HasDerivedCategory (ModuleCat.{u} O)] :
    Nonempty (DerivedCategory.Q.obj (completedCotangent (R := ℤ_[p]) (S := O) p) ≅
      DerivedCategory.Q.obj (lineInDegree
        (ModuleCat.of O (TensorProduct A O (TauCeti.AInf.bkTwist (A := A) 1))) (-1))) ∧
    acyclic (completedCotangent (R := O) (S := S) p) := by sorry

/-- The CR.0 regular-principal PD envelope is imported data. Omitted: its
universal PD structure and identification with A_inf[xi^j/j!] completed at p.
This specializes that supplier; it does not plan another PD envelope. -/
theorem integral_crystalline_ring_interface {C : Type u} [CommRing C] [Algebra A C]
    (p : ℕ) [Fact p.Prime] (xi : A)
    (hxi : Function.Injective (fun x : A ⧸ Ideal.span {(p : A)} =>
      Ideal.Quotient.mk _ xi * x)) :
    Function.Injective (fun x : C => (p : C)*x) ∧
    IsAdicComplete (Ideal.span {(p : C)}) C ∧
    derivedComplete (Ideal.span {(p : C)}) (singleModule (ModuleCat.of C C)) := by sorry
end TauCeti.AInfPlan

namespace TauCeti.AInfPlan
variable {A : Type u} [CommRing A]

/-- BMS1 Lemma 4.7, p. 35. E need not be finitely generated. The geometric
coefficient identification O=O_C^flat, F=C^flat, k its residue field is omitted. -/
theorem valuation_special_fiber_bound {O F k : Type u} [CommRing O] [IsDomain O]
    [ValuationRing O] [Field F] [Field k] [Algebra O F] [IsFractionRing O F]
    [Algebra O k] (d : ℕ) (E : Submodule O (Fin d → F)) :
    Module.rank k (TensorProduct O k E) ≤ (d : Cardinal) := by sorry

/-- BMS1 Lemma 4.8, p. 35. O=O_C^flat and k is its residue field; the rank-one
nondiscrete valuation topology is omitted, not generalized to every valuation. -/
theorem valuation_lattice_criterion {O F k : Type u} [CommRing O] [IsDomain O]
    [ValuationRing O] [Field F] [IsAlgClosed F] [Field k]
    [Algebra O F] [IsFractionRing O F] [Algebra O k] (d : ℕ)
    (D : Submodule O (Fin d → F)) (hd : Module.rank k (TensorProduct O k D) = d) :
    Nonempty (D ≃ₗ[O] (Fin d → O)) := by sorry

/-- BMS1 Lemma 4.9(i), pp. 35–36. Omitted: A=A_inf(O_C) and its perfectoid
coefficient geometry. The finite-presentation and p-local freeness remain. -/
theorem ainf_module_perfectness (p : ℕ) (M : ModuleCat.{u} A)
    [Module.FinitePresentation A M]
    [Module.Free (Localization.Away (p : A)) (LocalizedModule (Submonoid.powers (p : A)) M)] :
    boundedPerfect (singleModule M) := by sorry

private def pPowerTorsion (p : ℕ) (M : ModuleCat.{u} A) : Submodule A M := by sorry

/-- BMS1 Lemma 4.9(ii), pp. 35–36. Torsion is bounded, finitely presented and
perfect; the identification with all A_inf-torsion uses the omitted geometry. -/
theorem ainf_bounded_torsion (p : ℕ) (M : ModuleCat.{u} A)
    [Module.FinitePresentation A M]
    [Module.Free (Localization.Away (p : A)) (LocalizedModule (Submonoid.powers (p : A)) M)] :
    (∀ x : M, x ∈ pPowerTorsion p M ↔ ∃ n : ℕ, (p : A)^n • x = 0) ∧
    (∃ n : ℕ, ∀ x : pPowerTorsion p M, (p : A)^n • x = 0) ∧
    Module.FinitePresentation A (pPowerTorsion p M) ∧
    boundedPerfect (singleModule (ModuleCat.of A (pPowerTorsion p M))) := by sorry

/-- BMS1 Lemma 4.9(iii), pp. 35–36. H^(-i) of the native derived tensor is
Tor_i. W=W(k) and x=[varpi^flat] are the omitted coefficient identifications. -/
theorem ainf_tor_bounds {W : Type u} [CommRing W] [Algebra A W]
    (p : ℕ) (x : A) (M : ModuleCat.{u} A) [Module.FinitePresentation A M]
    [Module.Free (Localization.Away (p : A)) (LocalizedModule (Submonoid.powers (p : A)) M)] :
    (∀ N : ModuleCat.{u} A, ∀ i : ℕ, 2 < i →
      Limits.IsZero ((tensorDerived (singleModule M) (singleModule N)).homology (-(i : ℤ)))) ∧
    Limits.IsZero ((derivedBaseChange (B := W) (singleModule M)).homology (-2)) ∧
    (Function.Injective (fun z : M => x • z) → ∀ i : ℕ, 0 < i →
      Limits.IsZero ((derivedBaseChange (B := W) (singleModule M)).homology (-(i : ℤ)))) := by sorry

/-- BMS1 Lemma 4.10 and Corollary 4.12, pp. 36–37. Omitted: A=A_inf(O_C)
and its closed point. The chart is localization at the prime (p), not a
completed D(x) chart. These local freeness tests express the vector bundle. -/
theorem punctured_vector_bundle_criterion [IsLocalRing A] (p : ℕ)
    (hp : (Ideal.span {(p : A)}).IsPrime) (M : ModuleCat.{u} A)
    [Module.Finite A M]
    (hM : Function.Injective (fun x : M => (p : A) • x))
    [Module.Projective (Localization.Away (p : A)) (LocalizedModule (Submonoid.powers (p : A)) M)] :
    (∀ (q : Ideal A) (hq : q.IsPrime), q ≠ IsLocalRing.maximalIdeal A →
      letI := hq
      Module.Free (Localization.AtPrime q) (LocalizedModule q.primeCompl M)) ∧
    (∀ N : ModuleCat.{u} (Localization.Away (p : A)),
      Module.Finite (Localization.Away (p : A)) N →
      Module.Projective (Localization.Away (p : A)) N →
      Module.Free (Localization.Away (p : A)) N) := by sorry

/-- BMS1 Examples 4.23–4.24 and Remark 4.25, pp. 41–42. Tensor and dual here
are in the finite free subcategory. Omitted: the geometric A_inf, mu and the
compatible crystalline rigidification needed for the separate abelian variant. -/
theorem bkf_valid_operations (p : ℕ) (phi : A ≃+* A) (xi mu : A)
    (M N : TauCeti.BKF.Module p phi xi) [Module.Free A M.M] [Module.Free A N.M] :
    (∃ T : TauCeti.BKF.Module p phi xi,
      Nonempty (T.M ≃ₗ[A] TensorProduct A M.M N.M)) ∧
    (∃ D : TauCeti.BKF.Module p phi xi, Nonempty (D.M ≃ₗ[A] (M.M →ₗ[A] A))) ∧
    (∃ H : TauCeti.BKF.Module p phi xi, Nonempty (H.M ≃ₗ[A] (M.M →ₗ[A] N.M))) ∧
    ¬ Module.Projective (Localization.Away (p : A))
      (LocalizedModule (Submonoid.powers (p : A)) (A ⧸ Ideal.span {mu})) := by sorry

/-- BMS1 Remark 4.29, p. 43. The actual realization Hom map is bijective;
this early intersection proof does not import proper cohomology or reconstruction.
Omitted: common period coefficients and C algebraically closed. -/
theorem fargues_full_faithfulness {Z Bp B : Type u} [CommRing Z] [CommRing Bp] [Field B]
    [Algebra Z Bp] [Algebra Z B] [Algebra Bp B] [IsScalarTower Z Bp B]
    (p : ℕ) (phi : A ≃+* A) (xi : A) (M N : TauCeti.BKF.Module p phi xi)
    [Module.Free A M.M] [Module.Free A N.M] :
    Function.Bijective (TauCeti.BKF.realizationHom (Z := Z) (Bp := Bp) (B := B) p phi xi M N) := by sorry

/-- Native prismatic-complex representatives supplied by the Dieudonne owner.
The geometric crystal and descent conditions are unavailable and omitted. -/
private def prismaticEvaluation (p : ℕ) (phi : A ≃+* A) (xi : A)
    (D : Complex A) : TauCeti.BKF.Module p phi xi := by sorry
private def prismaticRealization (p : ℕ) (phi : A ≃+* A) (xi : A)
    (M : TauCeti.BKF.Module p phi xi) : Complex A := by sorry

/-- ALB Definition 4.1.24 and §4.3. Omitted: the perfectoid initial prism and
admissible prismatic crystal. Integral linearization and its minuscule cokernel
are retained; the theta prism is shifted to (A_inf,phi(xi)). -/
theorem minuscule_prismatic_dictionary (p : ℕ) (phi : A ≃+* A) (xi : A)
    (M : TauCeti.BKF.Module p phi xi) [Module.Free A M.M]
    (F : TauCeti.BKF.phiPull phi M.M →ₗ[A] M.M)
    (hF : TauCeti.BKF.localizedMap (phi xi) (ModuleCat.ofHom F) = M.frobenius.toLinearMap)
    (Q : ModuleCat.{u} (A ⧸ Ideal.span {phi xi}))
    [Module.Finite (A ⧸ Ideal.span {phi xi}) Q]
    [Module.Projective (A ⧸ Ideal.span {phi xi}) Q]
    (hQ : Nonempty ((M.M ⧸ LinearMap.range F) ≃ₗ[A]
      (ModuleCat.restrictScalars (Ideal.Quotient.mk (Ideal.span {phi xi}))).obj Q))
    [HasDerivedCategory (ModuleCat.{u} A)] :
    (∃ (f : TauCeti.BKF.Hom (prismaticEvaluation p phi xi (prismaticRealization p phi xi M)) M)
      (g : TauCeti.BKF.Hom M (prismaticEvaluation p phi xi (prismaticRealization p phi xi M))),
      f.map ≫ g.map = 𝟙 _ ∧ g.map ≫ f.map = 𝟙 _) ∧
    (∀ D : Complex A, Nonempty (DerivedCategory.Q.obj D ≅
      DerivedCategory.Q.obj (prismaticRealization p phi xi (prismaticEvaluation p phi xi D)))) := by sorry

/- The coefficient action on B is part of the reconstructed action's input.
Its agreement with the action on A and preservation of Bp use the common
period-ring maps supplied by R06.1; these geometric identifications are omitted. -/
private def reconstructedAction {G Z Bp B : Type u} [Group G] [CommRing Z] [CommRing Bp]
    [Field B] [Algebra Z Bp] [Algebra Z B] [Algebra Bp B] [IsScalarTower Z Bp B]
    (p : ℕ) (phi : A ≃+* A) (xi : A) (sigma : G →* (A ≃+* A))
    (P : TauCeti.BKF.LatticePair (Z := Z) (Bp := Bp) (B := B))
    (rho : G →* (P.T ≃ₗ[Z] P.T)) (rhoB : G →* (B ≃ₐ[Z] B)) (g : G) :
    (TauCeti.BKF.reconstruct p phi xi P).M →ₛₗ[(sigma g).toRingHom]
      (TauCeti.BKF.reconstruct p phi xi P).M := by sorry

private def reconstructedEtaleAction {G Z Bp B : Type u} [Group G] [CommRing Z] [CommRing Bp]
    [Field B] [Algebra Z Bp] [Algebra Z B] [Algebra Bp B] [IsScalarTower Z Bp B]
    (p : ℕ) (phi : A ≃+* A) (xi : A) (sigma : G →* (A ≃+* A))
    (P : TauCeti.BKF.LatticePair (Z := Z) (Bp := Bp) (B := B))
    (rho : G →* (P.T ≃ₗ[Z] P.T)) (rhoB : G →* (B ≃ₐ[Z] B)) (g : G) :
    (TauCeti.BKF.realizationPair (Z := Z) (Bp := Bp) (B := B) p phi xi (TauCeti.BKF.reconstruct p phi xi P)).T →ₗ[Z]
      (TauCeti.BKF.realizationPair (Z := Z) (Bp := Bp) (B := B) p phi xi (TauCeti.BKF.reconstruct p phi xi P)).T := by sorry

/-- Induced actions on the localized source/target of the BKF linearization. -/
private def localizedGaloisAction (p : ℕ) (phi : A ≃+* A) (xi : A)
    (M : TauCeti.BKF.Module p phi xi) (s : A ≃+* A) (a : M.M →ₛₗ[s.toRingHom] M.M) :
    LocalizedModule (Submonoid.powers (phi xi)) M.M →
      LocalizedModule (Submonoid.powers (phi xi)) M.M := by sorry
private def pulledGaloisAction (p : ℕ) (phi : A ≃+* A) (xi : A)
    (M : TauCeti.BKF.Module p phi xi) (s : A ≃+* A) (a : M.M →ₛₗ[s.toRingHom] M.M) :
    LocalizedModule (Submonoid.powers (phi xi)) (TauCeti.BKF.phiPull phi M.M) →
      LocalizedModule (Submonoid.powers (phi xi)) (TauCeti.BKF.phiPull phi M.M) := by sorry

/-- BMS1 §4.4, pp.43–46. Omitted: K and its absolute Galois group, common
period topologies/maps and the continuous coefficient action. The conclusion
retains the specified pair action on T, commutation with the actual BKF
Frobenius, the group laws and continuity of the transported semilinear action. -/
theorem bkf_galois_descent {G Z Bp B : Type u} [Group G] [TopologicalSpace G]
    [CommRing Z] [CommRing Bp] [Field B] [Algebra Z Bp] [Algebra Z B]
    [Algebra Bp B] [IsScalarTower Z Bp B]
    (p : ℕ) (phi : A ≃+* A) (xi : A) (sigma : G →* (A ≃+* A))
    (hphi : ∀ g a, sigma g (phi a) = phi (sigma g a))
    (hxi : ∀ g, ∃ v : Aˣ, sigma g (phi xi) = v * phi xi)
    (P : TauCeti.BKF.LatticePair (Z := Z) (Bp := Bp) (B := B))
    (rho : G →* (P.T ≃ₗ[Z] P.T)) (rhoB : G →* (B ≃ₐ[Z] B))
    (hXi : ∀ g x, x ∈ P.Xi →
      TensorProduct.map (rhoB g).toLinearMap (rho g).toLinearMap x ∈ P.Xi)
    [TopologicalSpace P.T] [TopologicalSpace (TauCeti.BKF.reconstruct p phi xi P).M]
    (hcont : Continuous (fun gx : G × P.T => rho gx.1 gx.2)) :
    (∀ x, reconstructedAction p phi xi sigma P rho rhoB 1 x = x) ∧
    (∀ g h x, reconstructedAction p phi xi sigma P rho rhoB (g*h) x =
      reconstructedAction p phi xi sigma P rho rhoB g
        (reconstructedAction p phi xi sigma P rho rhoB h x)) ∧
    (∀ g x, (TauCeti.BKF.reconstructPairMap p phi xi P).map.hom
        (reconstructedEtaleAction p phi xi sigma P rho rhoB g x) =
      rho g ((TauCeti.BKF.reconstructPairMap p phi xi P).map.hom x)) ∧
    (∀ g x, localizedGaloisAction p phi xi (TauCeti.BKF.reconstruct p phi xi P) (sigma g)
        (reconstructedAction p phi xi sigma P rho rhoB g)
        ((TauCeti.BKF.reconstruct p phi xi P).frobenius x) =
      (TauCeti.BKF.reconstruct p phi xi P).frobenius
        (pulledGaloisAction p phi xi (TauCeti.BKF.reconstruct p phi xi P) (sigma g)
          (reconstructedAction p phi xi sigma P rho rhoB g) x)) ∧
    Continuous (fun gx : G × (TauCeti.BKF.reconstruct p phi xi P).M =>
      reconstructedAction p phi xi sigma P rho rhoB gx.1 gx.2) := by sorry
end TauCeti.AInfPlan

namespace TauCeti.AInfPlan
variable {A : Type u} [CommRing A]

/-! DD.1 owns the general commuting-endomorphism Koszul construction. These
native data prototypes identify that supplier's carrier for the AI applications. -/
private def endomorphismKoszul (M : ModuleCat.{u} A) (d : ℕ)
    (f : Fin d → Module.End A M) : Complex A := by sorry
private def actionKoszul {R : Type u} [Ring R] [Algebra A R]
    (d : ℕ) (gamma : Fin d → R ≃ₐ[A] R) : Complex A := by sorry
private def actionProduct {R : Type u} [Ring R] [Algebra A R]
    (d : ℕ) (gamma : Fin d → R ≃ₐ[A] R) (i j : ℤ) :
    (actionKoszul d gamma).X i → (actionKoszul d gamma).X j →
      (actionKoszul d gamma).X (i+j) := by sorry
private def actionCoefficient {R : Type u} [Ring R] [Algebra A R]
    (d : ℕ) (gamma : Fin d → R ≃ₐ[A] R) : R →ₗ[A] (actionKoszul d gamma).X 0 := by sorry
private def actionGenerator {R : Type u} [Ring R] [Algebra A R]
    (d : ℕ) (gamma : Fin d → R ≃ₐ[A] R) : Fin d → (actionKoszul d gamma).X 1 := by sorry

/-- BMS1 Lemmas 7.5 and 7.10, pp. 57–60. The product is twisted even for
commutative R. Omitted: its coherent identification with the group-cochain cup
product; the algebraic product, specified homotopy and scalar formula remain. -/
theorem koszul_products_and_cohomology {R : Type u} [Ring R] [Algebra A R]
    (d : ℕ) (gamma : Fin d → R ≃ₐ[A] R) (hcomm : ∀ i j, Commute (gamma i) (gamma j))
    (m : ℕ) (hm : 1 ≤ m) (M : ModuleCat.{u} A) (g : A) (gs : Fin m → A)
    (hdiv : ∀ i, g ∣ gs i) (hunit : ∃ i, ∃ u : Aˣ, gs i = g*u) :
    (∀ i j, actionProduct d gamma 1 1 (actionGenerator d gamma i) (actionGenerator d gamma j) =
      -actionProduct d gamma 1 1 (actionGenerator d gamma j) (actionGenerator d gamma i)) ∧
    (∀ i, actionProduct d gamma 1 1 (actionGenerator d gamma i) (actionGenerator d gamma i) = 0) ∧
    (∀ i, ((actionKoszul d gamma).d 1 2).hom (actionGenerator d gamma i) = 0) ∧
    (∀ i a, actionProduct d gamma 1 0 (actionGenerator d gamma i) (actionCoefficient d gamma a) =
      actionProduct d gamma 0 1 (actionCoefficient d gamma (gamma i a)) (actionGenerator d gamma i)) ∧
    (∀ a, ((actionKoszul d gamma).d 0 1).hom (actionCoefficient d gamma a) =
      ∑ i : Fin d, actionProduct d gamma 0 1
        (actionCoefficient d gamma (gamma i a - a)) (actionGenerator d gamma i)) ∧
    (∀ K : Complex A, Nonempty (Homotopy (scalarChain g K) 0) → ∀ n : ℤ,
      Nonempty ((HomologicalComplex.tensorObj K (TauCeti.Decalage.twoTermAt 0 g)).homology n ≃ₗ[A]
        (K.homology (n-1) × K.homology n))) ∧
    (∀ n : ℕ, Nonempty ((endomorphismKoszul M m
        (fun i => gs i • (LinearMap.id : M →ₗ[A] M))).homology n ≃ₗ[A]
      ((Fin (Nat.choose (m-1) n) → LinearMap.ker (g • (LinearMap.id : M →ₗ[A] M))) ×
       (Fin (if n = 0 then 0 else Nat.choose (m-1) (n-1)) →
         M ⧸ LinearMap.range (g • (LinearMap.id : M →ₗ[A] M)))))) := by sorry

private def inverseLimitModule (N : ℕ → ModuleCat.{u} A)
    (t : ∀ k, N (k+1) →ₗ[A] N k) : Submodule A (∀ k, N k) := by sorry
private def continuousCochains (p d : ℕ) [Fact p.Prime] (N : ModuleCat.{u} A)
    (rho : Multiplicative (Fin d → ℤ_[p]) →* Module.End A N) : Complex A := by sorry
private def discreteCochains (p d : ℕ) [Fact p.Prime] (N : ModuleCat.{u} A)
    (rho : Multiplicative (Fin d → ℤ_[p]) →* Module.End A N) : Complex A := by sorry
private def continuousDiscreteComparison (p d : ℕ) [Fact p.Prime] (N : ModuleCat.{u} A)
    (rho : Multiplicative (Fin d → ℤ_[p]) →* Module.End A N) :
    continuousCochains p d N rho ⟶ discreteCochains p d N rho := by sorry

/-- BMS1 Lemma 7.3, p. 56. Omitted: the completed continuous-cochain
functor and its forgetful bridge. The topology on N is explicitly the inverse-limit
topology of discrete p-power-torsion modules. Surjective transitions can be
obtained by replacing the reductions by the images of N, as in the proof. -/
theorem continuous_cochains_koszul (p d : ℕ) [Fact p.Prime] (N : ModuleCat.{u} A)
    [TopologicalSpace N] (Nk : ℕ → ModuleCat.{u} A)
    [∀ k, TopologicalSpace (Nk k)] [∀ k, DiscreteTopology (Nk k)]
    (t : ∀ k, Nk (k+1) →ₗ[A] Nk k)
    (e : N ≃ₗ[A] inverseLimitModule Nk t)
    (he : Continuous e) (heInv : Continuous e.symm)
    (hkill : ∀ k, 1 ≤ k → ∀ x : Nk k, (p : A)^k • x = 0)
    (rho : Multiplicative (Fin d → ℤ_[p]) →* Module.End A N)
    (hcont : Continuous (fun gx : Multiplicative (Fin d → ℤ_[p]) × N => rho gx.1 gx.2))
    (rhoK : ∀ k, Multiplicative (Fin d → ℤ_[p]) →* Module.End A (Nk k))
    (hcontK : ∀ k, Continuous
      (fun gx : Multiplicative (Fin d → ℤ_[p]) × Nk k => rhoK k gx.1 gx.2))
    (ht : ∀ k g x, t k (rhoK (k+1) g x) = rhoK k g (t k x))
    (hequiv : ∀ k g x, (e (rho g x)).val k = rhoK k g ((e x).val k))
    [HasDerivedCategory (ModuleCat.{u} A)] :
    QuasiIso (continuousDiscreteComparison p d N rho) ∧
    Nonempty (DerivedCategory.Q.obj (continuousCochains p d N rho) ≅
      DerivedCategory.Q.obj (endomorphismKoszul N d
        (fun i => rho (Multiplicative.ofAdd (Pi.single i 1)) - 1))) := by sorry
end TauCeti.AInfPlan

namespace TauCeti.AInfPlan
variable {A : Type u} [CommRing A]

private def noAlmostElements (I : Ideal A) (M : ModuleCat.{u} A) : Prop :=
  ∀ x : M, (∀ a ∈ I, a • x = 0) → x = 0
private def principalQuotient (f : A) (M : ModuleCat.{u} A) : ModuleCat.{u} A :=
  ModuleCat.of A (M ⧸ LinearMap.range (f • (LinearMap.id : M →ₗ[A] M)))
private def annihilated (I : Ideal A) (M : ModuleCat.{u} A) : Prop := ∀ a ∈ I, ∀ x : M, a • x = 0
private def reductionMap (f : A) {K L : Complex A} (q : K ⟶ L) :
    derivedReduction f K ⟶ derivedReduction f L := by sorry
private def mappingCone {K L : Complex A} (q : K ⟶ L) : Complex A := by sorry

/-- BMS1 Lemma 8.11, p. 64. No-almost-zero conditions are on the source
cohomology and its quotient by f; they cannot be dropped for arbitrary almost maps. -/
theorem almost_to_honest (I : Ideal A) (f : A) (hfI : f ∈ I)
    (hf : Function.Injective (fun x : A => f*x)) (C D : Complex A) (g : C ⟶ D)
    (hker : ∀ i, annihilated I (ModuleCat.of A (LinearMap.ker
      (HomologicalComplex.homologyMap g i).hom)))
    (hcoker : ∀ i, annihilated I (ModuleCat.of A (D.homology i ⧸ LinearMap.range
      (HomologicalComplex.homologyMap g i).hom)))
    (hC : ∀ i, noAlmostElements I (C.homology i))
    (hCf : ∀ i, noAlmostElements I (principalQuotient f (C.homology i))) :
    QuasiIso (etaRepresentativeMap f g) := by sorry

/-- BMS1 Lemma 9.12, pp. 75–76. I=W(m^flat), whose infinite-level
idempotence is not assumed. The mod-p almost cone, injectivity, intersection
condition and derived completeness are each independent hypotheses. -/
theorem ainf_almost_criterion (p : ℕ) (mu : A) (I : Ideal A)
    (C D : Complex A) (g : C ⟶ D)
    (hC : derivedComplete (Ideal.span {(p : A)}) C)
    (hD : derivedComplete (Ideal.span {(p : A)}) D)
    (hmod : ∀ i, annihilated I ((mappingCone (reductionMap (p : A) g)).homology i))
    (hinj : ∀ i, Function.Injective (HomologicalComplex.homologyMap (etaRepresentativeMap mu g) i).hom)
    (hint : ∀ i x, (∀ a ∈ I, ∀ b : A, a*b = mu → ∃ y : C.homology i, b • y = x) ↔
      ∃ y : C.homology i, mu • y = x) :
    QuasiIso (etaRepresentativeMap mu g) := by sorry

section PerfectoidSections
variable {Site : Type u} [Category.{u} Site] {J : GrothendieckTopology Site}
private def integralSectionComplex (p : ℕ) (O : Sheaf J CommRingCat.{u})
    (U : Siteᵒᵖ) (Rplus : Type u) [CommRing Rplus] : Complex Rplus := by sorry
private def tiltSectionComplex (p : ℕ) [Fact p.Prime] (O : Sheaf J CommRingCat.{u})
    (U : Siteᵒᵖ) (Rflat : Type u) [CommRing Rflat] : Complex Rflat := by sorry
private def wittSectionComplex (p : ℕ) [Fact p.Prime] (O : Sheaf J CommRingCat.{u})
    (U : Siteᵒᵖ) (Rflat : Type u) [CommRing Rflat] : Complex (WittVector p Rflat) := by sorry

/-- BMS1 Lemma 5.6, pp. 47–48; Scholze Theorem 6.5 and Corollary 6.6.
Omitted: corrected pro-etale site, U an affinoid perfectoid over the perfectoid
base, Rplus/Rflat its actual coefficients, and the base almost ideals.
Higher integral sections are almost zero; rational period acyclicity is a
separate supplier theorem. Profinite products use continuous functions. -/
theorem perfectoid_period_sections (p : ℕ) [Fact p.Prime]
    (O : Sheaf J CommRingCat.{u}) (U US : Siteᵒᵖ)
    (Rplus Rflat S : Type u) [CommRing Rplus] [CommRing Rflat]
    [TopologicalSpace Rplus] [IsTopologicalRing Rplus]
    [TopologicalSpace S] [CompactSpace S] [T2Space S] [TotallyDisconnectedSpace S]
    (m : Ideal Rplus) (mflat : Ideal Rflat) :
    Nonempty ((TauCeti.AInfSheaf.completedIntegral p O).obj.obj U ≃+* Rplus) ∧
    Nonempty ((TauCeti.AInfSheaf.tilt p O).obj.obj U ≃+* Rflat) ∧
    Nonempty ((wittSectionComplex p O U Rflat).homology 0 ≅
      ModuleCat.of (WittVector p Rflat) (WittVector p Rflat)) ∧
    (∀ i : ℤ, 0 < i → annihilated m ((integralSectionComplex p O U Rplus).homology i)) ∧
    (∀ i : ℤ, 0 < i → annihilated mflat ((tiltSectionComplex p O U Rflat).homology i)) ∧
    (∀ i : ℤ, 0 < i → annihilated (infiniteWittIdeal p mflat)
      ((wittSectionComplex p O U Rflat).homology i)) ∧
    Nonempty ((TauCeti.AInfSheaf.completedIntegral p O).obj.obj US ≃+* ContinuousMap S Rplus) := by sorry
end PerfectoidSections

private def toricIntegralCochains (p d : ℕ) (R : Type u) [CommRing R] [Algebra A R] : Complex A := by sorry
private def toricCoverCochains (p d : ℕ) (R : Type u) [CommRing R] [Algebra A R] : Complex A := by sorry
private def toricIntegralComparison (p d : ℕ) (R : Type u) [CommRing R] [Algebra A R] :
    toricIntegralCochains (A := A) p d R ⟶ toricCoverCochains (A := A) p d R := by sorry

/-- BMS1 Proposition 8.9 and Lemma 8.10, pp. 63–64. Omitted: small smooth
R/O, the framing, root tower and completed weight decomposition. Integral
weights split off; the cokernel is killed by zeta_p-1, not asserted zero. -/
theorem toric_cohomology (p d : ℕ) (R : Type u) [CommRing R] [Algebra A R]
    (zeta : A) (m : Ideal A) :
    (∀ i : ℕ, ∃ s : (toricCoverCochains (A := A) p d R).homology i ⟶ (toricIntegralCochains (A := A) p d R).homology i,
      HomologicalComplex.homologyMap (toricIntegralComparison (A := A) p d R) i ≫ s = 𝟙 _) ∧
    (∀ i : ℕ, annihilated (Ideal.span {zeta-1}) (ModuleCat.of A
      ((toricCoverCochains (A := A) p d R).homology i ⧸ LinearMap.range
        (HomologicalComplex.homologyMap (toricIntegralComparison (A := A) p d R) i).hom))) ∧
    (∀ i : ℤ, noAlmostElements m ((toricCoverCochains (A := A) p d R).homology i) ∧
      noAlmostElements m (principalQuotient (zeta-1) ((toricCoverCochains (A := A) p d R).homology i))) ∧
    (∀ i : ℕ, Nonempty ((etaRepresentative (zeta-1) (toricCoverCochains (A := A) p d R)).homology i ≃ₗ[A]
      (Fin (Nat.choose d i) → R))) := by sorry

private def finiteWittToricCochains {O R : Type u} [CommRing O] [CommRing R] [Algebra O R]
    (p r d : ℕ) [Fact p.Prime] : Complex (TruncatedWittVector p r O) := by sorry

/-- BMS1 Lemma 9.7, pp. 73–74. Omitted: framed smooth R/O and its actual
completed finite Witt weights. Perfect coefficient complexes retain all
no-almost-zero and mod-f conditions needed by Lemma 8.11. -/
theorem witt_toric_cohomology {O R : Type u} [CommRing O] [CommRing R] [Algebra O R]
    (p r d : ℕ) [Fact p.Prime] (hr : 1 ≤ r) (zeta : O) (m : Ideal O) :
    (∀ i : ℤ, Function.Injective (fun x :
      (etaRepresentative (WittVector.truncate r (WittVector.teichmuller p zeta)-1)
        (finiteWittToricCochains (O := O) (R := R) p r d)).homology i =>
      (p : TruncatedWittVector p r O) • x)) ∧
    (∀ E : Complex (TruncatedWittVector p r O), boundedPerfect E → ∀ i : ℤ,
      noAlmostElements (finiteWittIdeal p r m)
        ((tensorDerived (finiteWittToricCochains (O := O) (R := R) p r d) E).homology i) ∧
      noAlmostElements (finiteWittIdeal p r m) (principalQuotient
        (WittVector.truncate r (WittVector.teichmuller p zeta)-1)
        ((tensorDerived (finiteWittToricCochains (O := O) (R := R) p r d) E).homology i))) := by sorry

private def toricAinfCochains (p d : ℕ) (R : Type u) [CommRing R] : Complex A := by sorry
private def proetaleAinfSections (p : ℕ) (R : Type u) [CommRing R] : Complex A := by sorry
private def toricProetaleComparison (p d : ℕ) (R : Type u) [CommRing R] :
    toricAinfCochains (A := A) p d R ⟶ proetaleAinfSections p R := by sorry

/-- BMS1 Theorem 9.4(ii–iii), pp. 70–71. Omitted: corrected site, framed
small smooth R and the almost-purity supplier. This is the honest integral
eta comparison, justified by the separate almost criteria, not arbitrary
almost descent or rational B_dR acyclicity. -/
theorem toric_almost_purity_comparison (p d : ℕ) (mu : A) (R : Type u) [CommRing R] :
    QuasiIso (etaRepresentativeMap mu (toricProetaleComparison p d R)) := by sorry

private def framedAomega (p : ℕ) (mu : A) (R : Type u) [CommRing R]
    (d : ℕ) (frame : AddMonoidAlgebra A (Fin d → ℤ) →+* R) : Complex A := by sorry
private def framedAomegaComparison (p : ℕ) (mu : A) (R : Type u) [CommRing R]
    (d : ℕ) (frame : AddMonoidAlgebra A (Fin d → ℤ) →+* R) :
    framedAomega p mu R d frame ⟶ etaRepresentative mu (proetaleAinfSections p R) := by sorry

/-- BMS1 Theorem 9.4(iii), Lemmas 9.9 and 9.13–9.15, pp. 74–79. The actual
canonical comparisons from two framings are quasi-isomorphisms, giving
independence through the common sheaf object. Omitted: formal etaleness of
the frames and ringed-topos descent; ordinary ring maps do not suffice. -/
theorem framing_independence_and_descent (p : ℕ) (mu : A) (R : Type u) [CommRing R]
    (d e : ℕ) (f : AddMonoidAlgebra A (Fin d → ℤ) →+* R)
    (g : AddMonoidAlgebra A (Fin e → ℤ) →+* R) :
    QuasiIso (framedAomegaComparison p mu R d f) ∧
    QuasiIso (framedAomegaComparison p mu R e g) := by sorry

private def aomegaFrobeniusComparison (mu xi : A) (phi : A ≃+* A) (K : Complex A)
    (F : TauCeti.AInfSheaf.phiComplex phi K ≅ K) :
    TauCeti.AInfSheaf.phiComplex phi (etaRepresentative mu K) ⟶
      etaRepresentative (phi xi) (etaRepresentative mu K) := by sorry

/-- BMS1 §9 and Theorem 14.1, pp. 117–118. Omitted: K=Rnu_*A_inf,X on a
smooth formal scheme and its coherent product. The period identity, derived
completeness and Frobenius on K are retained in the affine signature. -/
theorem aomega_frobenius (p : ℕ) (mu xi : A) (phi : A ≃+* A)
    (hperiod : phi mu = mu * phi xi)
    (hmu : Function.Injective (fun x : A => mu*x))
    (hxi : Function.Injective (fun x : A => xi*x)) (K : Complex A)
    (F : TauCeti.AInfSheaf.phiComplex phi K ≅ K)
    (hcomplete : derivedComplete (Ideal.span {(p : A),xi}) K) :
    QuasiIso (aomegaFrobeniusComparison mu xi phi K F) ∧
    derivedComplete (Ideal.span {(p : A),xi}) (etaRepresentative mu K) := by sorry

private def characteristicTwoQ : (LaurentPolynomial (ZMod 2))ˣ := by sorry
private def characteristicTwoModel := TauCeti.AOmega.qModel characteristicTwoQ
private def qLogClass : characteristicTwoModel.homology 1 := by sorry
private def steenrodSquareZero : characteristicTwoModel.homology 1 → characteristicTwoModel.homology 1 := by sorry

/-- BMS1 Remark 7.8, pp. 58–59. Sq^0 is the operation of the coherent
E_infinity model supplied by E5; an arbitrary strict commutative DGA has
vanishing Sq^0 on this degree-one class. That operation is unavailable and
omitted as data, while its concrete nonvanishing test remains. -/
theorem enhanced_noncommutative_regression :
    qLogClass ≠ 0 ∧ steenrodSquareZero qLogClass ≠ 0 := by sorry
end TauCeti.AInfPlan

namespace TauCeti.AInfPlan
variable {A : Type u} [CommRing A]

private def tildeOmegaComplex (p : ℕ) (O R : Type u) [CommRing O] [CommRing R]
    [Algebra O R] : Complex R := by sorry
private def continuousDifferentials (p : ℕ) (O R : Type u) [CommRing O] [CommRing R]
    [Algebra O R] : ModuleCat.{u} R := by sorry
private def twistComplex (O : Type u) [CommRing O] {R : Type u} [CommRing R]
    [Algebra O R] (n : ℤ) (K : Complex R) : Complex R := by sorry
private def shiftedComplex (n : ℤ) (K : Complex A) : Complex A := by sorry
private def sumTwoComplexes (K L : Complex A) : Complex A := by sorry

/-- BMS1 Proposition 8.15, pp. 66–67. Omitted: small smooth R/O, p-completed
cotangent construction and the canonical transitivity map. The shift [-1]
and intrinsic {-1} line remain, so this is a two-degree extension, not a
chosen splitting of Hodge--Tate cohomology. -/
theorem hodge_tate_cotangent {O R : Type u} [CommRing O] [CommRing R]
    (p : ℕ) [Fact p.Prime] [Algebra ℤ_[p] O] [Algebra ℤ_[p] R] [Algebra O R]
    [IsScalarTower ℤ_[p] O R] [HasDerivedCategory (ModuleCat.{u} R)] :
    Nonempty (DerivedCategory.Q.obj (goodLE 1 (tildeOmegaComplex p O R)) ≅
      DerivedCategory.Q.obj (twistComplex O (-1)
        (shiftedComplex (-1) (completedCotangent (R := ℤ_[p]) (S := R) p)))) ∧
    Nonempty ((tildeOmegaComplex p O R).homology 0 ≃ₗ[R] R) ∧
    Nonempty ((tildeOmegaComplex p O R).homology 1 ≃ₗ[R]
      TensorProduct R (TensorProduct O R (TauCeti.AInf.bkTwist (A := O) (-1)))
        (continuousDifferentials p O R)) := by sorry

/-- BMS1 Lemma 8.16, pp. 66–68. Unique factorization in the derived category;
the vanishing condition uses derived reduction. Connectivity of D, the upper
bound on C and f-regularity on H^0(D) are all explicit. -/
theorem eta_factorization_criterion (f : A) (hf : Function.Injective (fun x : A => f*x))
    (C D : Complex A) (a : C ⟶ D) (hC : ∀ i : ℤ, 1 < i → Limits.IsZero (C.homology i))
    (hD : connective D) (hH0 : Function.Injective (fun x : D.homology 0 => f • x))
    [HasDerivedCategory (ModuleCat.{u} A)] :
    (∃! b : DerivedCategory.Q.obj C ⟶ DerivedCategory.Q.obj (etaRepresentative f D),
      b ≫ DerivedCategory.Q.map (connectiveComparison f D) = DerivedCategory.Q.map a) ↔
    HomologicalComplex.homologyMap (reductionMap f a) 1 = 0 := by sorry

private def hodgeTateExtensionClass (p : ℕ) (O R : Type u) [CommRing O] [CommRing R]
    [Algebra O R] [HasDerivedCategory (ModuleCat.{u} R)] :
    DerivedCategory.Q.obj (shiftedComplex (-1) (twistComplex O (-1)
      (singleModule (continuousDifferentials p O R)))) ⟶
      DerivedCategory.Q.obj (shiftedComplex 1 (singleModule (ModuleCat.of R R))) := by sorry
private def squareZeroLiftingObstruction (p : ℕ) (O R : Type u) [CommRing O] [CommRing R]
    [Algebra O R] [HasDerivedCategory (ModuleCat.{u} R)] :
    DerivedCategory.Q.obj (shiftedComplex (-1) (twistComplex O (-1)
      (singleModule (continuousDifferentials p O R)))) ⟶
      DerivedCategory.Q.obj (shiftedComplex 1 (singleModule (ModuleCat.of R R))) := by sorry

/-- BMS1 Remark 8.4, pp. 61–62. Omitted: the square-zero tilde-theta thickening
and the global formal-scheme cotangent obstruction. The actual Ext^2 morphism
is identified; its vanishing, not arbitrary choice of a splitting, gives the
split two-degree object. For schemes this vanishing is equivalent to a lift. -/
theorem hodge_tate_lifting_obstruction (p : ℕ) (O R : Type u) [CommRing O] [CommRing R]
    [Algebra O R] [HasDerivedCategory (ModuleCat.{u} R)] :
    hodgeTateExtensionClass p O R = squareZeroLiftingObstruction p O R ∧
    (squareZeroLiftingObstruction p O R = 0 ↔
      Nonempty (DerivedCategory.Q.obj (goodLE 1 (tildeOmegaComplex p O R)) ≅
        DerivedCategory.Q.obj (sumTwoComplexes (singleModule (ModuleCat.of R R))
          (shiftedComplex (-1) (twistComplex O (-1)
            (singleModule (continuousDifferentials p O R))))))) := by sorry

private def localKunnethMap (p : ℕ) (mu : A) (R S : Type u) [CommRing R] [CommRing S]
    [Algebra A R] [Algebra A S] :
    (completion (Ideal.span {(p : A)})).obj
      (tensorDerived (etaRepresentative mu (proetaleAinfSections p R))
        (etaRepresentative mu (proetaleAinfSections p S))) ⟶
    etaRepresentative mu (proetaleAinfSections p (TensorProduct A R S)) := by sorry

/-- BMS1 Proposition 8.14 and Lemmas 9.16, 9.18, pp. 65–66, 78–79.
Omitted: the small smooth O-algebras, completed geometric product and coherent
multiplication; native coefficient algebras and canonical completed tensor
map remain. This does not assert eta/base-change for unrelated ideals. -/
theorem local_kunneth (p : ℕ) (mu : A) (R S : Type u) [CommRing R] [CommRing S]
    [Algebra A R] [Algebra A S] : QuasiIso (localKunnethMap p mu R S) := by sorry

private def finiteWittSheafComplex {O R : Type u} [CommRing O] [CommRing R]
    (p r : ℕ) [Fact p.Prime] : Complex (TruncatedWittVector p r O) := by sorry
private def extensionAlong {B : Type u} [CommRing B] (f : A →+* B) (K : Complex A) : Complex B := by
  letI := f.toAlgebra
  exact derivedBaseChange K
private def finiteWittSpecializationMap {O R : Type u} [CommRing O] [CommRing R]
    (p r : ℕ) [Fact p.Prime] (mu : A) (thetaR : A →+* TruncatedWittVector p r O)
    (zeta : O) : extensionAlong thetaR (etaRepresentative mu (proetaleAinfSections p R)) ⟶
      etaRepresentative (WittVector.truncate r (WittVector.teichmuller p zeta)-1)
        (finiteWittSheafComplex (O := O) (R := R) p r) := by sorry

/-- BMS1 Theorem 9.2(ii) and Theorem 9.4(i–iii), pp. 70–72.
Omitted: smooth formal R/O, tilde-theta_r, primitive zeta_(p^r), and sheaf
finite-level descent. This early nonflat base change precedes relative Witt
identification; no de Rham--Witt comparison is a hypothesis here. -/
theorem finite_witt_specialization {O R : Type u} [CommRing O] [CommRing R]
    (p r : ℕ) [Fact p.Prime] (hr : 1 ≤ r) (mu : A)
    (thetaR : A →+* TruncatedWittVector p r O) (zeta : O) :
    QuasiIso (finiteWittSpecializationMap (R := R) p r mu thetaR zeta) := by sorry

private def torusWittLambda {O : Type u} [CommRing O] (p r d : ℕ) [Fact p.Prime]
    (mu xi : A) (phi : A ≃+* A) (K : Complex A)
    (hK : ∀ i, Function.Injective (fun x : K.X i => mu • x)) :
    TruncatedWittVector p r (AddMonoidAlgebra O (Fin d → ℤ)) →
      (TauCeti.AOmega.wittImproved mu phi xi r K hK).X 0 := by sorry
private def torusU (p r d : ℕ) (mu xi : A) (phi : A ≃+* A) (K : Complex A)
    (hK : ∀ i, Function.Injective (fun x : K.X i => mu • x))
    (i : Fin d) : (TauCeti.AOmega.wittImproved mu phi xi r K hK).X 0 := by sorry

/-- BMS1 Proposition 11.8 and Lemmas 11.9–11.16, pp. 91–95. Omitted: D the
uncompleted torus cochains, the source U-coordinates and universal Witt map.
The source is W_r(O[T_i±1]), not W_r(O)[T_i±1]; the improved target is p-torsion-free. -/
theorem torus_witt_realization {O : Type u} [CommRing O]
    (p r d : ℕ) [Fact p.Prime] (hr : 1 ≤ r) (mu xi : A) (phi : A ≃+* A)
    (K : Complex A) (hK : ∀ i, Function.Injective (fun x : K.X i => mu • x))
    [CommRing ((TauCeti.AOmega.wittImproved mu phi xi r K hK).X 0)] :
    (∀ i : ℤ, 0 ≤ i → Function.Injective
      (fun x : (TauCeti.AOmega.wittImproved mu phi xi r K hK).X i => (p : A) • x)) ∧
    (∀ i : ℤ, 0 ≤ i → Nonempty ((TauCeti.AOmega.wittImproved mu phi xi r K hK).X i ≅
      (TauCeti.AOmega.relativeWittSource (A := A) p O (AddMonoidAlgebra O (Fin d → ℤ)) r).X i)) ∧
    (∀ i : Fin d, torusWittLambda (O := O) p r d mu xi phi K hK
      (WittVector.truncate r (WittVector.teichmuller p
        (AddMonoidAlgebra.single (Pi.single i (1 : ℤ)) (1 : O)))) =
      (torusU p r d mu xi phi K hK i)^(p^r)) := by sorry

private def boundedPDSubalgebra {C : Type u} [CommRing C] [Algebra A C]
    (m : ℕ) (dividedPowers : ℕ → C) : Subalgebra A C :=
  Algebra.adjoin A (Set.range (fun j : Fin (m+1) => dividedPowers j))
private def boundedPDRing {C : Type u} [CommRing C] [Algebra A C]
    (p m : ℕ) (dividedPowers : ℕ → C) : CommRingCat.{u} :=
  CommRingCat.of (AdicCompletion (Ideal.span {(p : boundedPDSubalgebra (A := A) m dividedPowers)})
    (boundedPDSubalgebra (A := A) m dividedPowers))
private instance boundedPDAlgebra {C : Type u} [CommRing C] [Algebra A C]
    (p m : ℕ) (dividedPowers : ℕ → C) : Algebra A (boundedPDRing (A := A) p m dividedPowers) := by sorry

/-- BMS1 Lemma 12.8(i–iii), pp. 100–101. C=A_crys, dividedPowers(j)=xi^j/j!,
and the shared cyclotomic periods are omitted. The actual subalgebra completion,
m≥p², finite tilde-xi unit formula, topology estimate and intersection remain. -/
theorem bounded_pd_coefficients {C : Type u} [CommRing C] [Algebra A C]
    (p m : ℕ) (hm : p^2 ≤ m) (mu xi : A) (phi : A ≃+* A) (dp : ℕ → C) :
    (∀ r : ℕ, 1 ≤ r → ∃ v : (boundedPDRing (A := A) p m dp)ˣ,
      algebraMap A (boundedPDRing (A := A) p m dp) ((phi^r) (TauCeti.AInf.xiWitt phi xi r)) =
        (p : boundedPDRing (A := A) p m dp)^r * v.val) ∧
    (∀ n : ℕ, ∃ k : ℕ, ∀ a : boundedPDRing (A := A) p m dp,
      (∃ b, algebraMap A (boundedPDRing (A := A) p m dp) mu * a = (p : boundedPDRing (A := A) p m dp)^k * b) →
      ∃ b, a = (p : boundedPDRing (A := A) p m dp)^n * b) ∧
    (∀ a : boundedPDRing (A := A) p m dp,
      (∀ r : ℕ, 1 ≤ r → ∃ b, a = algebraMap A (boundedPDRing (A := A) p m dp)
        (TauCeti.AInf.xiWitt phi xi r) * b) ↔
      ∃ b, a = algebraMap A (boundedPDRing (A := A) p m dp) mu * b) := by sorry

private def pdToricEtaMap {C R : Type u} [CommRing C] [CommRing R] [Algebra A C]
    (p m d : ℕ) (mu : A) (dp : ℕ → C) :
    (completion (Ideal.span {(p : boundedPDRing (A := A) p m dp)})).obj
      (derivedBaseChange (B := boundedPDRing (A := A) p m dp)
        (etaRepresentative mu (toricAinfCochains p d R))) ⟶
    etaRepresentative (algebraMap A (boundedPDRing (A := A) p m dp) mu)
      ((completion (Ideal.span {(p : boundedPDRing (A := A) p m dp)})).obj
        (derivedBaseChange (B := boundedPDRing (A := A) p m dp)
          (toricAinfCochains (A := A) p d R))) := by sorry

/-- BMS1 Lemma 12.8(iv–v), pp. 100–104. Omitted: the framed smooth algebra,
normalized bounded PD coefficients and all-coordinate factorization. Only the
specific canonical toric map is asserted, with m≥p². -/
theorem pd_toric_eta_comparison {C R : Type u} [CommRing C] [CommRing R] [Algebra A C]
    (p m d : ℕ) (hm : p^2 ≤ m) (mu : A) (dp : ℕ → C) :
    QuasiIso (pdToricEtaMap (R := R) p m d mu dp) := by sorry

private def pdLogarithm {C : Type u} [CommRing C] [Algebra A C]
    (p m : ℕ) (mu : A) (dp : ℕ → C) : boundedPDRing (A := A) p m dp := by sorry

/-- BMS1 Lemma 12.2(iii), Lemma 12.8(i), Corollary 12.7, pp. 97, 99–100.
Omitted: the convergent log(1+mu) PD series and geometric period hypotheses;
the coordinate is log([epsilon]) and its quotient by mu is a unit. -/
theorem pd_logarithmic_coordinate {C : Type u} [CommRing C] [Algebra A C]
    (p m : ℕ) (hm : p^2 ≤ m) (mu : A) (dp : ℕ → C) :
    ∃ v : (boundedPDRing (A := A) p m dp)ˣ,
      pdLogarithm p m mu dp = algebraMap A (boundedPDRing (A := A) p m dp) mu * v.val := by sorry

private def absoluteCrysComplex {C R : Type u} [CommRing C] [CommRing R]
    (p : ℕ) : Complex C := by sorry
private def specialFiberCrysComplex {W R : Type u} [CommRing W] [CommRing R]
    (p : ℕ) : Complex W := by sorry
private def crystallineWittMap {C W R : Type u} [CommRing C] [CommRing W] [CommRing R]
    (p : ℕ) (f : C →+* W) : extensionAlong f (absoluteCrysComplex (R := R) p) ⟶
      specialFiberCrysComplex (R := R) p := by sorry

/-- BMS1 Theorem 14.1(iii), pp. 117–118. Omitted: the smooth formal scheme,
absolute PD site, common A_crys→W(k) map with its Frobenius orientation and
crystalline derived base change. No ordinary degreewise tensor replacement. -/
theorem crystalline_witt_special_fiber {C W R : Type u} [CommRing C] [CommRing W] [CommRing R]
    (p : ℕ) (f : C →+* W) : QuasiIso (crystallineWittMap (R := R) p f) := by sorry

private def saturatedWittCrysComplex {W R : Type u} [CommRing W] [CommRing R]
    (p : ℕ) : Complex W := by sorry
private def blmComparisonMap {W R : Type u} [CommRing W] [CommRing R]
    (p : ℕ) : saturatedWittCrysComplex (W := W) (R := R) p ⟶ specialFiberCrysComplex (W := W) (R := R) p := by sorry
private def aomegaToSaturatedWitt {W R : Type u} [CommRing W] [CommRing R]
    (p : ℕ) : specialFiberCrysComplex (W := W) (R := R) p ⟶ saturatedWittCrysComplex (W := W) (R := R) p := by sorry

/-- BLM §§10.3–10.4 and Theorems 10.2.1, 10.4.4. Omitted: smooth special fiber,
the CR.4 saturated source and its coherent product/Frobenius. This names the
actual map agreement which the owner request still needs to establish. -/
theorem blm_crystalline_route {W R : Type u} [CommRing W] [CommRing R]
    (p : ℕ) [HasDerivedCategory (ModuleCat.{u} W)] :
    QuasiIso (blmComparisonMap (W := W) (R := R) p) ∧
    DerivedCategory.Q.map (aomegaToSaturatedWitt (W := W) (R := R) p) ≫
      DerivedCategory.Q.map (blmComparisonMap p) = 𝟙 _ := by sorry
end TauCeti.AInfPlan

namespace TauCeti.AInfPlan
variable {A : Type u} [CommRing A]

private def properDeRhamComplex {O : Type u} [CommRing O]
    (p : ℕ) (theta : A →+* O) (K : Complex A) : Complex O := by sorry
private def properCrystallineComplex {C : Type u} [CommRing C]
    (p : ℕ) (f : A →+* C) (K : Complex A) : Complex C := by sorry
private def properEtaleComplex (p : ℕ) [Fact p.Prime] (K : Complex A) :
    CochainComplex (ModuleCat.{u} ℤ_[p]) ℤ := by sorry
private def etaleScalarExtension {Z : Type v} {B : Type u} [CommRing Z] [CommRing B]
    (f : Z →+* B) (K : CochainComplex (ModuleCat.{u} Z) ℤ) : Complex B := by sorry

/-- BMS1 Theorem 14.3(ii), pp. 119–120. Omitted: K=RΓ(AΩ) for a proper
smooth formal scheme, theta the Fontaine map, completed differential target,
and coherent products. The actual derived coefficient extension is retained. -/
theorem global_de_rham {O : Type u} [CommRing O] (p : ℕ) (theta : A →+* O)
    (K : Complex A) [HasDerivedCategory (ModuleCat.{u} O)] :
    Nonempty (DerivedCategory.Q.obj (extensionAlong theta (TauCeti.AOmega.proper p K)) ≅
      DerivedCategory.Q.obj (properDeRhamComplex p theta K)) := by sorry

/-- BMS1 Theorem 14.3(iii), pp. 119–120. Omitted: proper smooth geometry,
C=A_crys with its PD structure, Frobenius-twisted bounded stages and coherent
Frobenius/products. The displayed completion is derived p-completion. -/
theorem global_acrys {C : Type u} [CommRing C] (p : ℕ) (f : A →+* C)
    (K : Complex A) [HasDerivedCategory (ModuleCat.{u} C)] :
    Nonempty (DerivedCategory.Q.obj ((completion (Ideal.span {(p : C)})).obj
      (extensionAlong f (TauCeti.AOmega.proper p K))) ≅
      DerivedCategory.Q.obj (properCrystallineComplex p f K)) := by sorry

/-- BMS1 Theorem 14.3(iii), pp. 119–120. Omitted: proper smooth geometry,
W=W(k), the fixed Witt residue map and semilinear Frobenius. Torsion remains
in the derived object, rather than an ordinary degreewise tensor. -/
theorem global_witt {W : Type u} [CommRing W] (p : ℕ) (residue : A →+* W)
    (K : Complex A) [HasDerivedCategory (ModuleCat.{u} W)] :
    Nonempty (DerivedCategory.Q.obj (extensionAlong residue (TauCeti.AOmega.proper p K)) ≅
      DerivedCategory.Q.obj (properCrystallineComplex p residue K)) := by sorry

/-- BMS1 Theorem 5.7 and Theorem 14.3(iv), pp. 48–49, 119–120. Omitted:
proper smooth geometry, actual generic-fiber etale complex and the early
primitive comparison. A local pro-etale comparison alone does not prove this.
The scalar map is Z_p→A_inf[1/mu], with proper finiteness for completion exchange. -/
theorem global_etale (p : ℕ) [Fact p.Prime] (mu : A)
    (coeff : ℤ_[p] →+* Localization.Away mu) (K : Complex A)
    [HasDerivedCategory (ModuleCat.{u} (Localization.Away mu))] :
    Nonempty (DerivedCategory.Q.obj (extensionAlong (algebraMap A (Localization.Away mu))
      (TauCeti.AOmega.proper p K)) ≅ DerivedCategory.Q.obj
        (etaleScalarExtension coeff (properEtaleComplex p K))) := by sorry

private def crystallineSectionChange {W C : Type u} [CommRing W] [CommRing C] [Algebra W C]
    (p : ℕ) (sectionMap : W →+* C) (f : A →+* C) (residue : A →+* W)
    (K : Complex A) (i : ℤ) :
    LocalizedModule (Submonoid.powers (p : C)) ((properCrystallineComplex p f K).homology i) →ₗ[Localization.Away (p : C)]
      TensorProduct W (Localization.Away (p : C)) ((properCrystallineComplex p residue K).homology i) := by sorry

/-- BMS1 Proposition 13.21, p. 116. Omitted: C=A_crys, W=W(k), the specified
section k→O_C/p, its induced W(k)→A_crys map, proper smooth geometry and
Frobenius compatibility. This exact non-Noetherian bridge remains a CR.3
request; a general Noetherian isogeny theorem does not supply it. -/
theorem rational_crystalline_frobenius {W C : Type u} [CommRing W] [CommRing C]
    [Algebra W C] (p : ℕ) (sectionMap : W →+* C)
    (hsection : sectionMap = algebraMap W C) (f : A →+* C) (residue : A →+* W)
    (K : Complex A) (i : ℤ) :
    Function.Bijective (crystallineSectionChange p sectionMap f residue K i) ∧
    Module.Free (Localization.Away (p : C))
      (LocalizedModule (Submonoid.powers (p : C)) ((properCrystallineComplex p f K).homology i)) ∧
    Module.Finite (Localization.Away (p : C))
      (LocalizedModule (Submonoid.powers (p : C)) ((properCrystallineComplex p f K).homology i)) := by sorry

/-- BMS1 Lemma 4.14, pp. 37–38. Omitted: O=O_C^flat, F=C^flat, k the residue
field and the canonical finite Witt scalar maps. The length equality is written
without truncated subtraction, and includes Tor_1 of derived specialization. -/
theorem finite_level_length_bound {O F k : Type u} [CommRing O] [Field F] [Field k]
    (p n : ℕ) [Fact p.Prime] (hn : 1 ≤ n)
    [Algebra (TruncatedWittVector p n O) (TruncatedWittVector p n F)]
    [Algebra (TruncatedWittVector p n O) (TruncatedWittVector p n k)]
    (M : ModuleCat.{u} (TruncatedWittVector p n O))
    [Module.FinitePresentation (TruncatedWittVector p n O) M] :
    Module.length (TruncatedWittVector p n F) (TensorProduct (TruncatedWittVector p n O)
      (TruncatedWittVector p n F) M) < ⊤ ∧
    Module.length (TruncatedWittVector p n k) (TensorProduct (TruncatedWittVector p n O)
      (TruncatedWittVector p n k) M) < ⊤ ∧
    Module.length (TruncatedWittVector p n k) (TensorProduct (TruncatedWittVector p n O)
      (TruncatedWittVector p n k) M) =
      Module.length (TruncatedWittVector p n F) (TensorProduct (TruncatedWittVector p n O)
        (TruncatedWittVector p n F) M) +
      Module.length (TruncatedWittVector p n k)
        ((derivedBaseChange (B := TruncatedWittVector p n k) (singleModule M)).homology (-1)) := by sorry

/-- BMS1 Corollary 4.15, p. 38. Omitted: Weta=W(C^flat), Ws=W(k) and their
canonical maps. These are ordinary scalar extensions of the actual module M. -/
theorem specialization_rank_and_length {Weta Ws : Type u} [CommRing Weta] [CommRing Ws]
    [Algebra A Weta] [Algebra A Ws] (p : ℕ) (M : ModuleCat.{u} A)
    [Module.FinitePresentation A M]
    [Module.Free (Localization.Away (p : A)) (LocalizedModule (Submonoid.powers (p : A)) M)] :
    Module.rank Weta (TensorProduct A Weta M) = Module.rank Ws (TensorProduct A Ws M) ∧
    (∀ n : ℕ, 1 ≤ n → Module.length Weta (principalQuotient ((p : Weta)^n)
      (ModuleCat.of Weta (TensorProduct A Weta M))) ≤
      Module.length Ws (principalQuotient ((p : Ws)^n) (ModuleCat.of Ws (TensorProduct A Ws M)))) := by sorry

private def cohomologyBaseChangeMap {W : Type u} [CommRing W] [Algebra A W]
    (C : Complex A) (i : ℤ) : TensorProduct A W (C.homology i) →ₗ[W]
      (derivedBaseChange (B := W) C).homology i := by sorry
private def localizedLinearMap {R : Type u} [CommRing R] (f : R)
    {M N : ModuleCat.{u} R} (g : M →ₗ[R] N) :
    LocalizedModule (Submonoid.powers f) M →ₗ[Localization.Away f]
      LocalizedModule (Submonoid.powers f) N := by sorry

/-- BMS1 Lemma 4.16, pp. 38–39. Omitted: A=A_inf, W=W(k) and x=[varpi^flat].
Unbounded C is allowed; all p-local cohomologies are free. The canonical
integral map is injective, becomes bijective after p-inversion, and is already
bijective when the adjacent cohomology has no x-torsion. -/
theorem derived_witt_cohomology_injection {W : Type u} [CommRing W] [Algebra A W]
    (p : ℕ) (x : A) (C : Complex A) (i : ℤ)
    (hfree : ∀ j : ℤ, Module.Free (Localization.Away (p : A))
      (LocalizedModule (Submonoid.powers (p : A)) (C.homology j))) :
    Function.Injective (cohomologyBaseChangeMap (W := W) C i) ∧
    Function.Bijective (localizedLinearMap (p : W)
      (M := ModuleCat.of W (TensorProduct A W (C.homology i)))
      (N := (derivedBaseChange (B := W) C).homology i) (cohomologyBaseChangeMap C i)) ∧
    (Function.Injective (fun z : C.homology (i+1) => x • z) →
      Function.Bijective (cohomologyBaseChangeMap (W := W) C i)) := by sorry

/-- BMS1 Lemma 4.18, p. 39. Omitted: mixed-characteristic cyclotomic A_inf,
W=W(k), O=O_C and theta; both actual derived specializations are retained. -/
theorem de_rham_crystalline_torsion_equivalence {W O : Type u} [CommRing W] [CommRing O]
    [Algebra A W] [Algebra A O] (p : ℕ) (C : Complex A) (hC : boundedPerfect C) (i : ℤ)
    (hfree : ∀ j : ℤ, Module.Free (Localization.Away (p : A))
      (LocalizedModule (Submonoid.powers (p : A)) (C.homology j))) :
    Function.Injective (fun z : (derivedBaseChange (B := W) C).homology i => (p : W) • z) ↔
      Function.Injective (fun z : (derivedBaseChange (B := O) C).homology i => (p : O) • z) := by sorry

/-- BMS1 Lemma 4.19, pp. 39–40. Omitted: cyclotomic A_inf and B=B_crys^+
with the common period maps. Projectivity in both actual period realizations
is a hypothesis; p-local freeness is the conclusion. -/
theorem p_local_freeness_from_periods {B : Type u} [CommRing B] [Algebra A B]
    (p : ℕ) (mu : A) (M : ModuleCat.{u} A) [Module.FinitePresentation A M]
    [Module.Projective (Localization.Away ((p : A)*mu))
      (LocalizedModule (Submonoid.powers ((p : A)*mu)) M)]
    [Module.Projective B (TensorProduct A B M)] :
    Module.Free (Localization.Away (p : A)) (LocalizedModule (Submonoid.powers (p : A)) M) ∧
    Module.Finite (Localization.Away (p : A)) (LocalizedModule (Submonoid.powers (p : A)) M) := by sorry

/-- BMS1 Corollary 4.20, p. 40. Omitted: B=B_crys^+ and the normalized maps.
Perfectness and both free period hypotheses are explicit; finiteness alone
cannot replace either freeness hypothesis. -/
theorem cohomology_finiteness_from_periods {B : Type u} [CommRing B] [Algebra A B]
    (p : ℕ) (mu : A) (C : Complex A) (hC : boundedPerfect C)
    (het : ∀ j : ℤ, Module.Free (Localization.Away ((p : A)*mu))
      (LocalizedModule (Submonoid.powers ((p : A)*mu)) (C.homology j)))
    (hcr : ∀ j : ℤ, Module.Free B ((derivedBaseChange (B := B) C).homology j)) :
    ∀ j : ℤ, Module.FinitePresentation A (C.homology j) ∧
      Module.Free (Localization.Away (p : A))
        (LocalizedModule (Submonoid.powers (p : A)) (C.homology j)) := by sorry

/-- BMS1 §14, Theorems 14.5–14.6, pp. 120–122. Omitted: Weta/Ws the proper
etale/crystalline period realizations. This exports the generic length estimate
and actual consecutive-degree lattice recovery map; CP.5 owns geometric
uniform formulations and examples. -/
theorem torsion_and_lattice_export {Weta Ws : Type u} [CommRing Weta] [CommRing Ws]
    [Algebra A Weta] [Algebra A Ws] (p : ℕ) (C : Complex A) (hC : boundedPerfect C) (i : ℤ)
    (hfree : ∀ j : ℤ, Module.Free (Localization.Away (p : A))
      (LocalizedModule (Submonoid.powers (p : A)) (C.homology j)))
    (hi : Function.Injective (fun z : (derivedBaseChange (B := Ws) C).homology i => (p : Ws) • z))
    (hi1 : Function.Injective (fun z : (derivedBaseChange (B := Ws) C).homology (i+1) => (p : Ws) • z)) :
    Module.Free A (C.homology i) ∧ Module.Finite A (C.homology i) ∧
    Function.Bijective (cohomologyBaseChangeMap (W := Ws) C i) ∧
    (∀ n : ℕ, 1 ≤ n → Module.length Weta (principalQuotient ((p : Weta)^n)
      (ModuleCat.of Weta (TensorProduct A Weta (C.homology i)))) ≤
      Module.length Ws (principalQuotient ((p : Ws)^n)
        (ModuleCat.of Ws (TensorProduct A Ws (C.homology i))))) := by sorry
end TauCeti.AInfPlan

namespace TauCeti.AInfPlan
variable {A : Type u} [CommRing A]

local instance {R : Type u} [CommRing R] (sigma : R ≃+* R) :
    RingHomInvPair sigma.toRingHom sigma.symm.toRingHom :=
  RingHomInvPair.of_ringEquiv sigma
local instance {R : Type u} [CommRing R] (sigma : R ≃+* R) :
    RingHomInvPair sigma.symm.toRingHom sigma.toRingHom :=
  RingHomInvPair.of_ringEquiv sigma.symm

/-- SW Lemma 5.2.9, p. 38, finite-projective slice of the full module
patching equivalence. No Noetherian or flat-completion assumption is added.
C is the actual f-adic completion. B and D are the indicated localizations;
the scalar towers specify the common overlap. -/
theorem linear_module_patching (f : A)
    (hf : Function.Injective (fun a : A => f * a))
    {B D : Type u} [CommRing B] [CommRing D]
    [Algebra A B] [IsLocalization (Submonoid.powers f) B]
    [Algebra (AdicCompletion (Ideal.span {f}) A) D] [Algebra B D] [Algebra A D]
    [IsScalarTower A (AdicCompletion (Ideal.span {f}) A) D] [IsScalarTower A B D]
    [IsLocalization (Submonoid.powers
      (algebraMap A (AdicCompletion (Ideal.span {f}) A) f)) D]
    (N : ModuleCat.{u} (AdicCompletion (Ideal.span {f}) A))
    (M : ModuleCat.{u} B)
    [Module.Finite (AdicCompletion (Ideal.span {f}) A) N]
    [Module.Projective (AdicCompletion (Ideal.span {f}) A) N]
    [Module.Finite B M] [Module.Projective B M]
    (beta : TensorProduct (AdicCompletion (Ideal.span {f}) A) D N ≃ₗ[D]
      TensorProduct B D M) :
    ∃ (P : ModuleCat.{u} A) (_ : Module.Finite A P) (_ : Module.Projective A P)
      (eC : TensorProduct A (AdicCompletion (Ideal.span {f}) A) P ≃ₗ[
        AdicCompletion (Ideal.span {f}) A] N)
      (eB : TensorProduct A B P ≃ₗ[B] M),
      ∀ x : P,
        beta (TensorProduct.tmul (AdicCompletion (Ideal.span {f}) A) (1 : D)
          (eC (TensorProduct.tmul A 1 x))) =
        TensorProduct.tmul B (1 : D) (eB (TensorProduct.tmul A 1 x)) := by sorry

/-- The actual fixed submodule. Omitted coefficient identification: Z=Z_p,
R=W(F) or the integral extended Robba ring. The Frobenius fixes Z explicitly. -/
private def frobeniusFixed {Z R : Type u} [CommRing Z] [CommRing R] [Algebra Z R]
    (sigma : R ≃+* R) (M : ModuleCat.{u} R) [Module Z M] [IsScalarTower Z R M] (F : M ≃ₛₗ[sigma.toRingHom] M)
    (hZ : ∀ z : Z, sigma (algebraMap Z R z) = algebraMap Z R z) : Submodule Z M where
  carrier := {x | F x = x}
  zero_mem' := by sorry
  add_mem' := by sorry
  smul_mem' := by sorry

/-- Canonical scalar-extension map r tensor x |-> r*x. -/
private def frobeniusDescentMap {Z R : Type u} [CommRing Z] [CommRing R] [Algebra Z R]
    (sigma : R ≃+* R) (M : ModuleCat.{u} R) [Module Z M] [IsScalarTower Z R M] (F : M ≃ₛₗ[sigma.toRingHom] M)
    (hZ : ∀ z : Z, sigma (algebraMap Z R z) = algebraMap Z R z) :
    TensorProduct Z R (frobeniusFixed sigma M F hZ) →ₗ[R] M := by sorry

/-- BMS1 Lemma 4.26 proof, pp. 41–42; SW Theorem 12.3.4, p. 104.
Omitted: R=W(F) for an algebraically closed perfect characteristic-p field,
sigma=Witt Frobenius and Z=Z_p with its canonical coefficient map.
The finite, finite-free and torsion-sensitive reconstruction uses fixed points,
not rational isocrystal classification. -/
theorem integral_frobenius_descent {Z R : Type u} [CommRing Z] [CommRing R]
    [Algebra Z R] (sigma : R ≃+* R) (M : ModuleCat.{u} R) [Module Z M] [IsScalarTower Z R M] [Module.Finite R M]
    (F : M ≃ₛₗ[sigma.toRingHom] M)
    (hZ : ∀ z : Z, sigma (algebraMap Z R z) = algebraMap Z R z) :
    Module.Finite Z (frobeniusFixed sigma M F hZ) ∧
      Function.Bijective (frobeniusDescentMap sigma M F hZ) ∧
      (Module.Free R M → Module.Free Z (frobeniusFixed sigma M F hZ)) := by sorry

/-- SW Theorem 12.3.4 and Proposition 12.3.5, p. 104.
Omitted: R is the integral extended Robba coefficient ring on the shared Y,
sigma its Frobenius, Z=Z_p, and the sheafification/no-leg-shtuka equivalence.
This is its affine invariant/scalar-extension comparison, for finite-free
modules; it does not reconstruct the already planned adic space Y. -/
theorem integral_robba_frobenius_descent {Z R : Type u} [CommRing Z] [CommRing R]
    [Algebra Z R] (sigma : R ≃+* R) (M : ModuleCat.{u} R) [Module Z M] [IsScalarTower Z R M]
    [Module.Finite R M] [Module.Free R M] (F : M ≃ₛₗ[sigma.toRingHom] M)
    (hZ : ∀ z : Z, sigma (algebraMap Z R z) = algebraMap Z R z) :
    Module.Finite Z (frobeniusFixed sigma M F hZ) ∧
      Module.Free Z (frobeniusFixed sigma M F hZ) ∧
      Function.Bijective (frobeniusDescentMap sigma M F hZ) := by sorry

/-- SW Theorem 13.4.1, p. 111, affine trivialization form.
Omitted: B is the ring of sections on the analytic interval Y_[r,infinity),
E is obtained from the phi-vector bundle, and its localization/descent data.
The embedding W(k)[1/p] -> B comes from a specified residue-field section.
The source is the existing Mathlib isocrystal carrier, not a new isocrystal. -/
theorem annulus_isocrystal_classification (p : ℕ) [Fact p.Prime]
    (k : Type u) [Field k] [CharP k p] [PerfectRing k p] [IsAlgClosed k]
    {B : Type u} [CommRing B] [Algebra (FractionRing (WittVector p k)) B]
    (sigma : B ≃+* B) (E : ModuleCat.{u} B)
    [Module.Finite B E] [Module.Projective B E] (F : E ≃ₛₗ[sigma.toRingHom] E)
    (hmap : ∀ a : FractionRing (WittVector p k),
      sigma (algebraMap (FractionRing (WittVector p k)) B a) =
        algebraMap (FractionRing (WittVector p k)) B
          (WittVector.FractionRing.frobenius p k a)) :
    ∃ (V : ModuleCat.{u} (FractionRing (WittVector p k)))
      (IV : WittVector.Isocrystal p k V)
      (_ : IV.toModule = inferInstanceAs (Module (FractionRing (WittVector p k)) V))
      (_ : Module.Finite (FractionRing (WittVector p k)) V)
      (e : TensorProduct (FractionRing (WittVector p k)) B V ≃ₗ[B] E),
      ∀ (b : B) (v : V),
        F (e (TensorProduct.tmul (FractionRing (WittVector p k)) b v)) =
          e (TensorProduct.tmul (FractionRing (WittVector p k)) (sigma b)
            (IV.frob.toEquiv v)) := by sorry

/-- SW Theorem 13.2.1, pp. 109–111, affine essential-surjectivity slice.
Omitted: B and D are the compatible analytic section rings on Y_[r,infinity]
and Y_[r,infinity), r>=0, with sheaf descent. The extension is across infinity;
it is not restriction from Y_[0,infinity) to Y_(0,infinity).
The full equivalence and uniqueness are stated in the packet. -/
theorem frobenius_extension_infinity {B D : Type u} [CommRing B] [CommRing D]
    [Algebra B D] (sigmaB : B ≃+* B) (sigmaD : D ≃+* D)
    (hmap : ∀ b : B, sigmaD (algebraMap B D b) = algebraMap B D (sigmaB b))
    (E : ModuleCat.{u} D) [Module.Finite D E] [Module.Projective D E]
    (FE : E ≃ₛₗ[sigmaD.toRingHom] E) :
    ∃ (M : ModuleCat.{u} B) (_ : Module.Finite B M) (_ : Module.Projective B M)
      (FM : M ≃ₛₗ[sigmaB.toRingHom] M) (e : TensorProduct B D M ≃ₗ[D] E),
      ∀ (d : D) (m : M),
        FE (e (TensorProduct.tmul B d m)) =
          e (TensorProduct.tmul B (sigmaD d) (FM m)) := by sorry

/-- Associated module sheaf on the already supplied analytic Y, with its
structure sheaf suppressed by the affine coefficient prototype. -/
private def associatedYSheaf {C : Type u} [Category C]
    (J : GrothendieckTopology C) (M : ModuleCat.{u} A) : Sheaf J (ModuleCat.{u} A) := by sorry

/-- SW Theorem 14.2.1, pp. 116–117, essential-surjectivity slice.
Omitted: J is the site of the shared analytic Y, the structure sheaf O_Y,
and E is locally finite free over O_Y. Full faithfulness uses the two-open
patching equalizer, as in the packet; algebraic punctured Spec is separate. -/
theorem analytic_vector_bundle_extension {C : Type u} [Category C]
    (J : GrothendieckTopology C) (E : Sheaf J (ModuleCat.{u} A)) :
    ∃ (M : ModuleCat.{u} A) (_ : Module.Finite A M) (_ : Module.Free A M),
      Nonempty (associatedYSheaf J M ≅ E) := by sorry
end TauCeti.AInfPlan
