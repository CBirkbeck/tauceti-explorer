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
import Mathlib.Algebra.MvPolynomial.PDeriv
import Mathlib.Algebra.MvPolynomial.Eval
import Mathlib.RingTheory.Ideal.Quotient.Defs
import Mathlib.RingTheory.PowerSeries.Substitution
import Mathlib.Data.Finset.Max
import Mathlib.Data.Fin.VecNotation
import Mathlib.LinearAlgebra.Matrix.Notation
import Mathlib.Data.Matrix.Mul
import Mathlib.RingTheory.Ideal.Quotient.Operations
import Mathlib.RingTheory.Derivation.Basic
import Mathlib.RingTheory.Derivation.Lie
import Mathlib.RingTheory.Flat.Basic
import Mathlib.LinearAlgebra.Dimension.Finrank
import Mathlib.LinearAlgebra.Dimension.Free
import Mathlib.RingTheory.AdjoinRoot
import Mathlib.RingTheory.Length
import Mathlib.NumberTheory.Padics.RingHoms

/-!
# Integral A_inf cohomology and Breuil–Kisin–Fargues structures: suggested Lean

ASM-AInfCohomology (Claude, session claude-tRpzqk): the suggested files of the two
parts of the roadmap `AInfCohomology`, joined.

* Part AI.0 (layers AI.0, AI.0:integral, AI.0:period-comparison, AI.1–AI.5):
  `AInfCohomology--AI.0.lean`, written by BP-AInfCohomology--AI.0 and revised by
  REV-AInfCohomology--AI.0.
* Part AI.6 (layers AI.6, AI.7): `AInfCohomology--AI.6.lean`, written by
  BP-AInfCohomology--AI.6 and revised by REV-AInfCohomology--AI.6.

Pins: Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. Both parts import Mathlib only.

This file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/AInfCohomology.md` is definitive. The statements here
suggest Lean forms so that contributors and reviewers converge on names and
signatures. Every `sorry` is intentional: no declaration is claimed implemented,
and every node of the roadmap keeps `implementationStatus` "unchecked". A condition
that cannot be stated at the pinned libraries is left out and said to be left out,
never replaced by a proposition-valued field.

The two bodies follow, each with its part's own note, unchanged except that the
anonymous `noncomputable section` each part leaves open is closed at the end of
its body, so that the top-level `open CategoryTheory` and `universe u v` of the
AI.0 part do not reach the AI.6 part. The parts declare in disjoint namespaces
(AI.0: `TauCeti.Decalage`, `TauCeti.AInfPlan`, `TauCeti.AInf`, `TauCeti.BKF`,
`TauCeti.AInfSheaf`, `TauCeti.AOmega`; AI.6: `TauCeti.AInfBlueprint`). At the end
of the AI.0 body, an inventory lists the declarations of the AI.0 packet that the
part file does not type; the AI.6 part's own inventory closes the file.
-/

/-! ## Part AI.0: layers AI.0, AI.0:integral, AI.0:period-comparison, AI.1–AI.5 -/

/-!
# A_inf cohomology: suggested interfaces

BP-AInfCohomology--AI.0; Codex, codex-A12Cq4.
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
extension and crystalline-input suppliers; the output is an actual BKF object. -/
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

/-- Omitted: the analytic modification functor and relative curve carrier. -/
theorem reconstruct_modification (p : ℕ) (phi : A ≃+* A) (xi : A)
    (P : LatticePair (Z := Z) (Bp := Bp) (B := B)) :
    _root_.Module.Free A (reconstruct p phi xi P).M := by sorry

-- TauCeti.BKF.reconstruct_test_standard
example (p : ℕ) (phi : A ≃+* A) (xi : A) :
    Nonempty ((reconstruct p phi xi (standard (Bp := Bp) (B := B) (ModuleCat.of Z Z))).M ≅
      (unit p phi xi).M) := by sorry
-- TauCeti.BKF.reconstruct_test_shift; omitted primitive-root and common-map hypotheses.
example (p : ℕ) (phi : A ≃+* A) (xi : A) (xiDR : Bp)
    (P : LatticePair (Z := Z) (Bp := Bp) (B := B))
    (hT : Nonempty (P.T ≅ ModuleCat.of Z Z))
    (h : P.Xi = scaleLattice P.T ((algebraMap Bp B xiDR)^(-1 : ℤ)) (standardLattice P.T)) :
    Nonempty ((reconstruct p phi xi P).M ≅ (twist p phi xi 1).M) := by sorry
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

theorem wittPre_lambda {S : Type u} [CommRing S] (p : ℕ) [Fact p.Prime]
    (phi : A ≃+* A) (xi : A) (r : ℕ) (K : CochainComplex (ModuleCat.{u} A) ℤ)
    [CommRing ((wittPre phi xi r K).X 0)] :
    preLambda (S := S) p phi xi r K 1 = 1 := by sorry

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

/-- Omitted: CR.4's relative Witt complex and its universal F-V map. W is that
native complex with coefficient restriction, not an opaque predicate. -/
theorem wittImproved_universal_map (mu : A) (phi : A ≃+* A) (xi : A) (r : ℕ)
    (K W : CochainComplex (ModuleCat.{u} A) ℤ)
    (hK : ∀ i : ℤ, Function.Injective (fun x : K.X i => mu • x))
    (lambda0 : W.X 0 ⟶ (wittImproved mu phi xi r K hK).X 0) :
    ∃ a : W ⟶ wittImproved mu phi xi r K hK, a.f 0 = lambda0 := by sorry

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

/-- BMS2 Proposition5.8; BLM Example8.4.7. Omitted: the filtered derived object,
I^i line factors, Beilinson truncation and colimit k→-infinity. F is the native
complex representing that colimit after truncation, not an opaque predicate. -/
theorem filtered_beilinson_description (f : A)
    (K F : CochainComplex (ModuleCat.{u} A) ℤ)
    (hK : ∀ i : ℤ, Function.Injective (fun x : K.X i => f • x))
    [HasDerivedCategory (ModuleCat.{u} A)] :
    Nonempty (DerivedCategory.Q.obj F ≅
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

/-- BMS1 Theorem4.6. Omitted: A=A_inf(O_C), U=Spec(A) minus its closed point,
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


/-! ## Part AI.0: declarations the part file does not type

The review REV-AInfCohomology--AI.0 found that the following node declarations
of the AI.0 part packet have no signature in the part file (its table "Missing
signatures"). They are listed here under the packet's names, with the packet's
statements, so that every name of the packet occurs in this file. They are not
typed by this assembly: typing them (an affine signature where one is faithful,
otherwise a stated omission) is the work of the revision of the AI.0 part. The
API items and unit tests of these nodes are typed or named above.
-/

/-
AInfCohomology:AI.1/decalage-filtered-colimits
TauCeti.AInfPlan.decalage_filtered_colimits — lemma, not typed in this file
Statement: Lη_I commutes with filtered colimits in D(O).
-/

/-
AInfCohomology:AI.1/decalage-truncations
TauCeti.AInfPlan.decalage_truncations — lemma, not typed in this file
Statement: For a≤b in Z together with infinite endpoints, Lη_I(τ^[a,b] C)≅τ^[a,b](Lη_I C),
naturally in C.
-/

/-
AInfCohomology:AI.1/preservation-derived-completeness
TauCeti.AInfPlan.preservation_derived_completeness — lemma, not typed in this file
Statement: If J is a locally finitely generated ideal and C is derived J-complete, then Lη_I C
is derived J-complete.
-/

/-
AInfCohomology:AI.1/completion-at-decalage-ideal
TauCeti.AInfPlan.completion_at_decalage_ideal — comparison, not typed in this file
Statement: For derived I-completion C→Ĉ, the canonical comparison completion_I(Lη_I C)→Lη_I Ĉ is
a quasi-isomorphism.
-/

/-
AInfCohomology:AI.1/completion-limit-model
TauCeti.AInfPlan.completion_limit_model — comparison, not typed in this file
Statement: The canonical map Lη_I Ĉ→Rlim_n Lη_I(C tensor^L O/I^n) is a quasi-isomorphism, where
Ĉ is derived I-completion.
-/

/-
AInfCohomology:AI.1/restricted-sequence-completion
TauCeti.AInfPlan.restricted_sequence_completion — comparison, not typed in this file
Statement: With B,M as above, let A=B[t] act on M by t=F. The derived (x)-completion of M[0] is
concentrated in degree zero and equals N={(a_n) in product Q[[x]] : for each r, all but finitely
many a_n lie in x^r Q[[x]]}. The A-action extends by t(a)_n=a_(n+1)−x a_n.
-/

/-
AInfCohomology:AI.1/unrelated-completion-counterexample
TauCeti.AInfPlan.unrelated_completion_counterexample — application, not typed in this file
Statement: For A=Q[x,t], I=(t), J=(x), and the module M defined above, the canonical map
completion_J(Lη_t M[0])→Lη_t(completion_J M[0]) is not a quasi-isomorphism. On H^0 it is
N→N/N[t], with nonzero kernel generated as Q[[x]]-module by (1,x,x²,...).
-/

/-
AInfCohomology:AI.0/witt-limit-and-mu-kernel
TauCeti.AInfPlan.witt_limit_and_mu_kernel — theorem, not typed in this file
Statement: For O_C, theta_infinity:A_inf→lim_R W_r(O_C)=W(O_C) has kernel (mu), equivalently the
intersection over r≥1 of (xi_r)=(mu/phi^(-r)(mu)) is (mu). Its cokernel is killed by
W(m_C^flat); if C is spherically complete, it induces A_inf/(mu)≅W(O_C). The ideal (mu) is
independent of the compatible primitive roots. Ordinary completeness alone does not imply
surjectivity.
-/

/-
AInfCohomology:AI.0/period-regularity
TauCeti.AInfPlan.period_regularity — theorem, not typed in this file
Statement: The elements p,mu,xi,tilde-xi and their finite Frobenius products are nonzerodivisors
in A_inf(O_C). A_inf is p-adically and (p,xi)-adically complete; A_inf/(xi)=O_C is p-torsion-
free. Record analogous (p,tilde-xi) completeness and regular pairs needed for finite derived
reductions.
-/

/-
AInfCohomology:AI.0/witt-base-change
TauCeti.AInfPlan.witt_base_change — theorem, not typed in this file
Statement: For a map S→S′ of integral perfectoid rings and 1≤j≤r, the canonical maps W_j(S)
tensor^L_(A_inf(S)) A_inf(S′)→W_j(S′) and W_j(S) tensor^L_(W_r(S)) W_r(S′)→W_j(S′) are quasi-
isomorphisms. In the second map W_j(S) is a W_r(S)-module along either iterated Frobenius or
restriction. This is Tor independence for the specified quotients, not flatness of every Witt
map.
-/

/-
AInfCohomology:AI.0/witt-finite-presentation-devissage
TauCeti.AInfPlan.witt_finite_presentation_devissage — lemma, not typed in this file
Statement: If I⊂R is finitely generated and M is an R/I-module, M is finitely presented over R/I
iff it is finitely presented over R.
-/

/-
AInfCohomology:AI.0/no-almost-zero-witt-sections
TauCeti.AInfPlan.no_almost_zero_witt_sections — lemma, not typed in this file
Statement: Every finitely presented W_r(O_C)-module M has no nonzero element killed by W_r(m),
for finite r≥1. In particular this applies to the finitely presented toric cohomology modules;
it is stronger than just the free-module case.
-/

/-
AInfCohomology:AI.0/witt-polynomial-calculation
TauCeti.AInfPlan.witt_polynomial_calculation — lemma, not typed in this file
Statement: For any commutative ring S and finite Witt length r≥1, there are natural inclusions
W_r(S[T_1^(p^r),…,T_d^(p^r)])⊂W_r(S)[U_1,…,U_d]⊂W_r(S[T_1,…,T_d]), where U_i=[T_i], and likewise
for Laurent variables. Taking the union over all p-power roots gives
W_r(S[T_i^(1/p^infinity)])=W_r(S)[U_i^(1/p^infinity)] and the Laurent version. The p-adic
completed versions used in AI.3 follow by completion; this does not identify W_r(S[T]) with
W_r(S)[T].
-/

/-
AInfCohomology:AI.0/witt-almost-ideal
TauCeti.AInfPlan.witt_almost_ideal — lemma, not typed in this file
Statement: For the maximal ideal m⊂O_C, W_r(m)=ker(W_r(O_C)→W_r(k)) is generated by Teichmuller
elements [a], a∈m; it is idempotent and flat over W_r(O_C), by Lemma 10.1 and Corollary 10.2.
Separately, for 0≤j≤r, Ann(V^j(1))=ker(F^j:W_r(O_C)→W_(r-j)(O_C))=(q_(r,j)), where
q_(r,j)=([zeta_(p^j)]−1)/([zeta_(p^r)]−1) is the polynomial quotient supplied by cyclotomic
divisibility, and Ann(q_(r,j))=(V^j(1))=V^j W_(r-j)(O_C), by Corollary 3.18. The first
annihilator/kernel equality and the V-image equality hold for any perfectoid ring by Remark
3.19.
-/

/-
AInfCohomology:AI.0/witt-etale-base-change
TauCeti.AInfPlan.witt_etale_base_change — theorem, not typed in this file
Statement: For any étale map A→B of commutative rings, W_r(A)→W_r(B) is étale. For any map A→A′
with B′=B⊗_A A′, the natural map W_r(A′)⊗_(W_r(A)) W_r(B)→W_r(B′) is an isomorphism. This
coefficient theorem precedes both AI.3 and the CR.4 relative de Rham–Witt comparison.
-/

/-
AInfCohomology:AI.0:integral/completed-cotangent-twist
TauCeti.AInfPlan.completed_cotangent_twist — comparison, not typed in this file
Statement: The derived p-completed cotangent complex of O_C/Z_p is O_C{1}[1], and for an
integral perfectoid O_C-algebra S the derived p-completed relative cotangent complex of S/O_C
vanishes. These use cohomological degree −1, so the twist is the shift by −1 of the completed
complex.
-/

/-
AInfCohomology:AI.0:integral/integral-crystalline-ring-interface
TauCeti.AInfPlan.integral_crystalline_ring_interface — comparison, not typed in this file
Statement: Import the p-completed PD envelope A_crys of (A_inf,ker theta) from CR.0, with its
theta augmentation and Witt residue map. Show the common coefficient maps commute and the
Frobenius extends; no rational period-ring comparison is needed to construct this integral
prefix.
-/

/-
AInfCohomology:AI.1/strongly-k-flat-replacements
TauCeti.AInfPlan.strongly_k_flat_replacements — lemma, not typed in this file
Statement: Every complex of modules on a ringed topos admits a quasi-isomorphism from a K-flat
complex whose terms are flat. Such terms are I-torsion-free for an invertible ideal I; a K-flat
complex alone need not have flat terms.
-/

/-
AInfCohomology:AI.1/valuation-monoidality
TauCeti.AInfPlan.valuation_monoidality — theorem, not typed in this file
Statement: For a valuation ring R and nonzero f, the lax product map Lη_f(C) tensor^L
Lη_f(D)→Lη_f(C tensor^L D) is an equivalence. For a general ring only the lax map is exported.
-/

/-
AInfCohomology:AI.1/truncation-comparison-maps
TauCeti.AInfPlan.truncation_comparison_maps — lemma, not typed in this file
Statement: There is a natural I^m⊗τ≤m C→τ≤m Lη_I C, and, if H^n(C) is I-torsion-free, τ≥n Lη_I
C→I^n⊗τ≥n C. On [n,m] the two composites are multiplication by I^(m−n) under the line
identifications.
-/

/-
AInfCohomology:AI.1/connective-comparison
TauCeti.AInfPlan.connective_comparison — lemma, not typed in this file
Statement: For connective C whose H^0 is I-torsion-free, the lower-truncation map Lη_I C→C is
natural; after inverting I it is an equivalence. An unbounded complex has the localized
comparison, not an unjustified integral map in all degrees.
-/

/-
AInfCohomology:AI.1/decalage-composition
TauCeti.AInfPlan.decalage_composition — comparison, not typed in this file
Statement: For invertible ideals I,J, Lη_I Lη_J C≃Lη_(IJ) C, naturally and compatibly with
products. Locally this is division of the differential successively by generators f and g.
-/

/-
AInfCohomology:AI.1/bockstein-map-injectivity
TauCeti.AInfPlan.bockstein_map_injectivity — lemma, not typed in this file
Statement: The comparison map induces injective cohomology maps; a class mapping to a Bockstein
boundary is a boundary modulo I in η_I C.
-/

/-
AInfCohomology:AI.1/bockstein-map-surjectivity
TauCeti.AInfPlan.bockstein_map_surjectivity — lemma, not typed in this file
Statement: Every Bockstein cocycle class lifts to a cocycle modulo I in η_I C, giving the
surjectivity of the comparison on cohomology.
-/

/-
AInfCohomology:AI.1/flat-and-nonflat-base-change
TauCeti.AInfPlan.flat_and_nonflat_base_change — theorem, not typed in this file
Statement: Lη commutes with flat pullback of ringed topoi. For the nonflat coefficient
reductions used in AΩ, prove the specific comparison by the finite Witt toric calculation and
the Bockstein/Tor criterion; no universal base-change theorem is asserted without its own
hypotheses.
-/

/-
AInfCohomology:AI.1/completed-sum-cohomology
TauCeti.AInfPlan.completed_sum_cohomology — lemma, not typed in this file
Statement: In a replete ringed topos with J locally principal, let C_i be derived J-complete,
H^0(C_i) classically J-complete, and H^0(C_i)[J^infinity]=H^0(C_i)[J^n] for a single n
independent of i. The H^0 of the derived J-completed direct sum is the classical completion
lim_k direct-sum_i H^0(C_i)/J^k. The analogous degree-q statement follows by shifting each C_i
and imposing these hypotheses on H^q.
-/

/-
AInfCohomology:AI.1/koszul-products-and-cohomology
TauCeti.AInfPlan.koszul_products_and_cohomology — theorem, not typed in this file
Statement: For commuting A-algebra automorphisms gamma_i of a possibly noncommutative A-algebra
R, K_R(gamma_i−1) has the source DGA product: x_i x_j=−x_j x_i, x_i²=0, x_i a=gamma_i(a)x_i,
d(x_i)=0 and d(a)=sum_i(gamma_i(a)−a)x_i. It induces the group-cohomology cup product. If
multiplication by g on a complex M is nullhomotopic, 0→H^(n−1)(M)→H^n(M tensor K_R(g))→H^n(M)→0
splits. If all scalar g_i are divisible by g and one is g times a unit,
H^n(K_M(g_1,…,g_m))≅Ann_M(g)^(binom(m−1,n)) ⊕ (M/gM)^(binom(m−1,n−1)).
-/

/-
AInfCohomology:AI.1/continuous-cochains-koszul
TauCeti.AInfPlan.continuous_cochains_koszul — comparison, not typed in this file
Statement: Let Gamma_disc=Z^d with generators gamma_i and Gamma=Z_p^d. If N=lim_k N_k is a
topological abelian group, each N_k a discrete continuous Gamma-module killed by p^k, then
RΓ_cont(Gamma,N)→RΓ(Gamma_disc,N) is a quasi-isomorphism and both are computed by
K_N(gamma_1−1,…,gamma_d−1). The topology on N is the limit topology; this does not identify
cohomology for arbitrary discrete Gamma-modules.
-/

/-
AInfCohomology:AI.1/dieudonne-consumer-contract
TauCeti.AInfPlan.dieudonne_consumer_contract — comparison, not typed in this file
Statement: The generic p-complete Lη_p and Bockstein/filtered interfaces specialize to the η_p
used for saturation and the Beilinson construction of the Nygaard filtration in BLM. CR.4 owns
the strict Dieudonné fixed-point equivalence and the Nygaard filtration itself; AI.1 supplies
the completion-compatible lax functor.
-/

/-
AInfCohomology:AI.2/valuation-special-fiber-bound
TauCeti.AInfPlan.valuation_special_fiber_bound — lemma, not typed in this file
Statement: For E⊂(C^flat)^d an O_C^flat-submodule, dim_k(E⊗k)≤d.
-/

/-
AInfCohomology:AI.2/valuation-lattice-criterion
TauCeti.AInfPlan.valuation_lattice_criterion — lemma, not typed in this file
Statement: If D⊂(C^flat)^d and dim_k(D⊗k)=d, then D is finite free of rank d.
-/

/-
AInfCohomology:AI.2/ainf-module-perfectness
TauCeti.AInfPlan.ainf_module_perfectness — lemma, not typed in this file
Statement: A finitely presented A_inf-module M with M[1/p] finite free is perfect as an A_inf
complex.
-/

/-
AInfCohomology:AI.2/ainf-bounded-torsion
TauCeti.AInfPlan.ainf_bounded_torsion — lemma, not typed in this file
Statement: For such M, M_tor is killed by p^n for some n and is finitely presented and perfect.
-/

/-
AInfCohomology:AI.2/ainf-tor-bounds
TauCeti.AInfPlan.ainf_tor_bounds — lemma, not typed in this file
Statement: Such M has Tor-dimension≤2, Tor_2^(A_inf)(M,W(k))=0; if M has no x-torsion,
Tor_i(M,W(k))=0 for i>0, where x=[varpi^flat] is a topologically nilpotent Teichmuller
parameter.
-/

/-
AInfCohomology:AI.2/punctured-vector-bundle-criterion
TauCeti.AInfPlan.punctured_vector_bundle_criterion — lemma, not typed in this file
Statement: A finitely generated p-torsion-free M with M[1/p] finite projective defines a vector
bundle on U. Consequently every finite projective A_inf[1/p]-module is finite free.
-/

/-
AInfCohomology:AI.2/bkf-valid-operations
TauCeti.AInfPlan.bkf_valid_operations — lemma, not typed in this file
Statement: The finite free BKF subcategory has tensor products, duals and internal Homs with
localized Frobenius; the larger finitely presented BKF category is an exact tensor category with
invertible Tate twist, but is not closed under arbitrary cokernels. The map
A_inf⊗Z_p(1)→A_inf{1} has cokernel modeled by A_inf/(mu), which fails p-local projectivity.
Kernel/cokernel closure is asserted only for the variant with specified compatible crystalline
rigidification discussed after Lemma 4.27.
-/

/-
AInfCohomology:AI.2/fargues-full-faithfulness
TauCeti.AInfPlan.fargues_full_faithfulness — theorem, not typed in this file
Statement: The functor from finite free BKF modules to pairs (T,Xi) is fully faithful. Its early
algebraic intersection proof depends on §4.2 and period maps, independently of the subsequent
proper cohomology theorem.
-/

/-
AInfCohomology:AI.2/bkf-galois-descent
TauCeti.AInfPlan.bkf_galois_descent — theorem, not typed in this file
Statement: For a discretely valued K with C its completed algebraic closure, retain a continuous
semilinear G_K action on the BKF module and compatible continuous action on T and Xi. The
Fargues correspondence respects this descent data; discarding the action does not recover the
K-object.
-/

/-
AInfCohomology:AI.2/minuscule-prismatic-dictionary
TauCeti.AInfPlan.minuscule_prismatic_dictionary — comparison, not typed in this file
Statement: Over a perfectoid ring, admissible prismatic Dieudonné modules evaluated on the
initial prism are precisely minuscule BKF modules. For O_C use (A_inf,tilde-xi) and a finite
free linearized phi whose integral image lies in M with cokernel killed by tilde-xi and finite
projective over O_C. This is a Frobenius-shifted dictionary with the theta prism.
-/

/-
AInfCohomology:AI.3/perfectoid-period-sections
TauCeti.AInfPlan.perfectoid_period_sections — theorem, not typed in this file
Statement: On an affinoid perfectoid Uhat=Spa(R,R+), the completed integral and tilt sections
are R+ and R+flat, and H^0(Uhat,A_inf,X)=W(R+flat). Their higher integral cohomology is almost
zero, not asserted zero. For Uhat×S with S profinite, the integral sections are continuous
S-valued maps with the specified inverse-limit topology. Rational period-sheaf acyclicity is a
subsequent P8:local-rational theorem.
-/

/-
AInfCohomology:AI.3/toric-cohomology
TauCeti.AInfPlan.toric_cohomology — theorem, not typed in this file
Statement: The continuous cohomology of R_infinity decomposes by weights. Integral weights have
the source exterior cohomology, and nonintegral weights have the bounded root-of-unity
annihilation estimates of Proposition 8.9 and Lemma 8.10. After Lη_(zeta_p−1), only the
predicted differential-form part survives.
-/

/-
AInfCohomology:AI.3/witt-toric-cohomology
TauCeti.AInfPlan.witt_toric_cohomology — theorem, not typed in this file
Statement: For finite r, the toric W_r(R_infinity) cohomology has the integral-part and
completed nonintegral weight decomposition in Lemma 9.7, with the annihilators used by
Lη_[zeta_(p^r)]−1. The resulting cohomology modules have no almost-zero elements where Corollary
3.29 is invoked.
-/

/-
AInfCohomology:AI.3/almost-to-honest
TauCeti.AInfPlan.almost_to_honest — lemma, not typed in this file
Statement: Let f∈I be regular in A. If g:C→D induces cohomology maps with I-annihilated
kernel/cokernel, and H^i(C) and H^i(C)/f have no nonzero I-annihilated elements for every i,
then Lη_f g is an equivalence. The assumptions are on C, not an unsupported assertion about all
almost maps.
-/

/-
AInfCohomology:AI.3/ainf-almost-criterion
TauCeti.AInfPlan.ainf_almost_criterion — lemma, not typed in this file
Statement: For g:C→D between derived p-complete A_inf complexes, Lη_mu g is an equivalence if
(i) g mod p is almost an equivalence over O_C^flat, (ii) H^i(Lη_mu g) is injective for every i,
and (iii) intersection_{a∈W(m^flat), a divides mu}(mu/a)H^i(C)=mu H^i(C) for every i. W(m^flat)
is not treated as an idempotent ideal in A_inf.
-/

/-
AInfCohomology:AI.3/toric-almost-purity-comparison
TauCeti.AInfPlan.toric_almost_purity_comparison — comparison, not typed in this file
Statement: Continuous Gamma cochains on the toric perfectoid cover map to pro-finite-étale and
pro-étale cohomology. Almost purity gives the finite-level almost comparisons; the toric
injectivity and no-almost-zero/intersection estimates upgrade them under Lη to honest integral
equivalences.
-/

/-
AInfCohomology:AI.3/framing-independence-and-descent
TauCeti.AInfPlan.framing_independence_and_descent — theorem, not typed in this file
Statement: The toric, profinite-étale and pro-étale AΩ complexes on a small smooth affine map
equivalently to RΓ(mathfrak X,AΩ). Their canonical comparisons imply independence of framing,
étale restriction and descent for general smooth formal schemes.
-/

/-
AInfCohomology:AI.3/aomega-frobenius
TauCeti.AInfPlan.aomega_frobenius — theorem, not typed in this file
Statement: Frobenius gives phi^*AΩ≃Lη_tilde-xi AΩ and thus a map phi^*AΩ→AΩ that becomes an
equivalence after tilde-xi inversion. AΩ is derived (p,xi)-complete; its coherent multiplication
is obtained in the enhancement.
-/

/-
AInfCohomology:AI.3/enhanced-noncommutative-regression
TauCeti.AInfPlan.enhanced_noncommutative_regression — application, not typed in this file
Statement: The E_infinity q-de Rham algebra in characteristic two cannot in general be
represented by a commutative dga: in the source example Sq^0 on the degree-one q-log class is
nonzero. The twisted cochain product is retained; E_infinity enhancement is the multiplicative
target.
-/

/-
AInfCohomology:AI.4/hodge-tate-cotangent
TauCeti.AInfPlan.hodge_tate_cotangent — comparison, not typed in this file
Statement: For small smooth R, the canonical transitivity map induces Lhat_(R/Z_p)[−1]{−1}≃τ≤1
tilde-Omega_R. In degree zero it is R and in degree one Omega^1_(R/O_C),cont{−1}.
-/

/-
AInfCohomology:AI.4/eta-factorization-criterion
TauCeti.AInfPlan.eta_factorization_criterion — lemma, not typed in this file
Statement: If C∈D≤1(A), D∈D≥0(A), H^0(D) is f-torsion-free and f is regular, a map C→D factors
through Lη_f D in at most one way. It factors exactly when H^1(C tensor^L A/f)→H^1(D tensor^L
A/f) is zero, equivalently H^1(C)→H^1(D) factors through fH^1(D).
-/

/-
AInfCohomology:AI.4/hodge-tate-lifting-obstruction
TauCeti.AInfPlan.hodge_tate_lifting_obstruction — comparison, not typed in this file
Statement: Under the cotangent identification, the extension class of τ≤1 tilde-Omega_R is the
obstruction to lifting R to A_inf/(tilde-xi²), with the source twist and normalization. A chosen
lift gives the corresponding splitting; existence of a canonical splitting is not asserted for
every R.
-/

/-
AInfCohomology:AI.4/local-kunneth
TauCeti.AInfPlan.local_kunneth — comparison, not typed in this file
Statement: For two small smooth O_C-algebras R_1,R_2 and their completed tensor product R, the
completed tensor maps for tilde-Omega and AΩ are equivalences; finite Witt reductions satisfy
the compatible source tensor comparison. These are maps of coherent multiplicative objects.
-/

/-
AInfCohomology:AI.4/finite-witt-specialization
TauCeti.AInfPlan.finite_witt_specialization — comparison, not typed in this file
Statement: For r≥1, AΩ tensor^L_(A_inf,tilde-theta_r) W_r(O_C)≃tilde-W_r-
Omega:=L_eta_([zeta_(p^r)]−1) Rnu_* W_r(hat O_X^+), compatibly on framed affines and after sheaf
descent. The subsequent cohomology identification with relative de Rham–Witt is the separate
relative-witt-comparison node; it is not used to prove this early finite reduction.
-/

/-
AInfCohomology:AI.4/torus-witt-realization
TauCeti.AInfPlan.torus_witt_realization — comparison, not typed in this file
Statement: For D=RΓ(Z^d,A_inf[U_i±1/p^infinity]), the improved W_r^n(D) is p-torsion-free and
canonically W_r Omega^n_(O_C[T_i±1]/O_C), compatible with d,F,R,V and multiplication. The
degree-zero lambda has domain W_r(O_C[T_i±1]) and sends [T_i] to U_i^(p^r) in the source
coordinate normalization.
-/

/-
AInfCohomology:AI.4/bounded-pd-coefficients
TauCeti.AInfPlan.bounded_pd_coefficients — lemma, not typed in this file
Statement: Define A_crys^(m) as the p-adic completion of the A_inf-subalgebra of A_crys
generated by xi^j/j! for 0≤j≤m. A_crys is the p-completion of colim_m A_crys^(m). For m≥p²,
tilde-xi_r=p^r times a unit and Lemma 12.2 holds in A_crys^(m); the filtrations ({a | mu*a
belongs to p^s A_crys^(m)})_s and (p^s A_crys^(m))_s are intertwined, and intersection_r
(mu/phi^(-r)(mu))A_crys^(m)=mu A_crys^(m). In particular the bounded quotient by mu is
p-adically separated; the unbounded A_crys/mu is not assumed separated.
-/

/-
AInfCohomology:AI.4/pd-toric-eta-comparison
TauCeti.AInfPlan.pd_toric_eta_comparison — comparison, not typed in this file
Statement: For the toric complex, eta_mu after completed extension to A_crys^(m) compares
equivalently with the extended q-de Rham model for m≥p². The bounded-coefficient annihilation
and injectivity estimates justify this particular exchange; no unrestricted eta/base-change
commutation is used.
-/

/-
AInfCohomology:AI.4/pd-logarithmic-coordinate
TauCeti.AInfPlan.pd_logarithmic_coordinate — lemma, not typed in this file
Statement: In the eligible bounded PD extension, log([epsilon])=log(1+mu) is mu times a unit, so
the q-Koszul operators compare with ordinary logarithmic de Rham operators. The coordinate is
log([epsilon]), not log(mu).
-/

/-
AInfCohomology:AI.4/crystalline-witt-special-fiber
TauCeti.AInfPlan.crystalline_witt_special_fiber — comparison, not typed in this file
Statement: Further derived extension of the absolute A_crys comparison along A_crys→W(k), with
its correct Frobenius scalar map, gives crystalline cohomology of mathfrak X_k. The
identification uses CR.3 base change and relative/absolute Witt comparison; ordinary degreewise
tensor is not substituted.
-/

/-
AInfCohomology:AI.4/blm-crystalline-route
TauCeti.AInfPlan.blm_crystalline_route — comparison, not typed in this file
Statement: The BLM saturated-de-Rham–Witt crystalline comparison for the smooth special fiber
agrees with the AΩ crystalline map, including Frobenius and cup products. AI.1 supplies Lη_p
completion and Bockstein; CR.4 supplies saturated complexes, Cartier/Nygaard theory and their
crystalline equivalence.
-/

/-
AInfCohomology:AI.5/global-de-rham
TauCeti.AInfPlan.global_de_rham — comparison, not typed in this file
Statement: RΓ_Ainf tensor^L_(A_inf,theta) O_C≃RΓ_dR(mathfrak X/O_C), with cup products and
functoriality. Perfect coefficient exchange justifies globalizing the local comparison.
-/

/-
AInfCohomology:AI.5/global-acrys
TauCeti.AInfPlan.global_acrys — comparison, not typed in this file
Statement: RΓ_Ainf completed-tensor^L A_crys≃RΓ_crys(mathfrak X_(O_C/p)/A_crys), compatibly with
Frobenius and products. Bounded divided-power Frobenius diagrams use phi^r-twisted coefficient
subrings A_crys^(m), as corrected in Theorem 14.1.
-/

/-
AInfCohomology:AI.5/global-witt
TauCeti.AInfPlan.global_witt — comparison, not typed in this file
Statement: RΓ_Ainf tensor^L A_inf W(k)≃RΓ_crys(mathfrak X_k/W(k)), using the fixed Witt residue
map. It respects semilinear Frobenius and cup products; torsion remains in the derived object.
-/

/-
AInfCohomology:AI.5/global-etale
TauCeti.AInfPlan.global_etale — comparison, not typed in this file
Statement: RΓ_Ainf[1/mu]≃RΓ_et(X,Z_p) tensor_Z_p A_inf[1/mu] for the analytic generic fiber X;
proper finite étale cohomology allows the final source simplification of completion. The
integral primitive A_inf comparison is requested as an early primitive-comparison extension of
P8:local-rational, independent of its subsequent proper rational suffix.
-/

/-
AInfCohomology:AI.5/rational-crystalline-frobenius
TauCeti.AInfPlan.rational_crystalline_frobenius — lemma, not typed in this file
Statement: Fix a section k→O_C/p. For Y=mathfrak X_(O_C/p) with mathfrak X proper smooth, there
is a canonical phi-equivariant isomorphism H_crys^i(Y/A_crys)[1/p]≅H_crys^i(mathfrak X_k/W(k))
tensor_W(k) A_crys[1/p]. In particular the left side is finite free over A_crys[1/p], hence its
B_crys^+ realization is free as required by Corollary 4.20. This is BMS1 Proposition 13.21,
requested from CR.3 as an early Berthelot–Ogus bridge; it is not a consequence of the existing
rational-frobenius node alone.
-/

/-
AInfCohomology:AI.5/finite-level-length-bound
TauCeti.AInfPlan.finite_level_length_bound — lemma, not typed in this file
Statement: For a finitely presented W_n(O_C^flat)-module M, the generic and residue
specializations have finite length and l(M_eta)=l(M_s)−l(Tor_1(M,W_n(k)))≤l(M_s).
-/

/-
AInfCohomology:AI.5/specialization-rank-and-length
TauCeti.AInfPlan.specialization_rank_and_length — lemma, not typed in this file
Statement: For finitely presented M with M[1/p] finite free, M⊗W(C^flat) and M⊗W(k) have equal
rank; for every n≥1, l((M⊗W(k))/p^n)≥l((M⊗W(C^flat))/p^n).
-/

/-
AInfCohomology:AI.5/derived-witt-cohomology-injection
TauCeti.AInfPlan.derived_witt_cohomology_injection — lemma, not typed in this file
Statement: For C with every H^j(C)[1/p] free, H^i(C)⊗W(k)→H^i(C tensor^L W(k)) is injective and
an isomorphism after p-inversion. It is an integral isomorphism if H^(i+1)(C) has no x-torsion.
-/

/-
AInfCohomology:AI.5/de-rham-crystalline-torsion-equivalence
TauCeti.AInfPlan.de_rham_crystalline_torsion_equivalence — lemma, not typed in this file
Statement: For perfect C over A_inf with every H^j(C)[1/p] free, H^i(C tensor^L W(k)) is
p-torsion-free iff H^i(C tensor^L_(theta) O_C) is p-torsion-free.
-/

/-
AInfCohomology:AI.5/p-local-freeness-from-periods
TauCeti.AInfPlan.p_local_freeness_from_periods — lemma, not typed in this file
Statement: For finitely presented M, if M[1/(p mu)] is finite projective and M⊗B_crys^+ is
finite projective, then M[1/p] is finite free.
-/

/-
AInfCohomology:AI.5/cohomology-finiteness-from-periods
TauCeti.AInfPlan.cohomology_finiteness_from_periods — lemma, not typed in this file
Statement: For perfect C with H^j(C)[1/(p mu)] free and H^j(C tensor^L B_crys^+) free for every
j, every H^j(C) is finitely presented and free after p-inversion. The finite-free and adjacent-
degree conclusions of Corollary 4.17 then apply.
-/

/-
AInfCohomology:AI.5/torsion-and-lattice-export
TauCeti.AInfPlan.torsion_and_lattice_export — application, not typed in this file
Statement: Export the generic length inequality and adjacent-degree recovery maps to CP.5. For
the proper complex they give crystalline torsion-length bounds against generic-fiber étale
torsion and finite-free lattice recovery when the source consecutive crystalline degrees are
torsion-free. CP.5 owns the uniform geometric formulation and examples.
-/

/-
AInfCohomology:AI.0/coherent-quotient
TauCeti.AInfPlan.coherent_quotient — lemma, not typed in this file
Statement: If R is coherent and I⊂R finitely generated, then R/I is coherent.
-/

/-
AInfCohomology:AI.0/coherent-square-zero-extension
TauCeti.AInfPlan.coherent_square_zero_extension — lemma, not typed in this file
Statement: If S→R is surjective with square-zero kernel I, R coherent and I finitely presented
as an R-module, then S is coherent.
-/

/-
AInfCohomology:AI.0/coherence-artin-rees
TauCeti.AInfPlan.coherence_artin_rees — lemma, not typed in this file
Statement: If f is regular in R, (R,f) has the Artin–Rees property on every inclusion of
finitely generated modules, and R[1/f] and R/f are coherent, then R is coherent.
-/

/-
AInfCohomology:AI.0/artin-rees-bounded-isogeny
TauCeti.AInfPlan.artin_rees_bounded_isogeny — lemma, not typed in this file
Statement: For an injection R→S with both f-torsion-free and cokernel killed by f^n, (R,f) has
the Artin–Rees property iff (S,f) does.
-/

end

/-! ## Part AI.6: layers AI.6 and AI.7

The part's own note follows. -/

/-
This file is not the roadmap and is not exhaustive. The roadmap document
AInfCohomology--AI.6.md is definitive. These statements suggest Lean forms so
contributors and reviewers can converge on names and signatures.

Baseline: Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.
No declaration here is claimed implemented. Proofs are prototypes only.

PROTOCOL §13: a condition that cannot yet be stated is left out, never
represented by an arbitrary carrier, a proposition-valued field, or an assumed
comparison. The declarations of this packet about formal schemes, sites,
sheaves and cohomology have no types to be stated against at the pinned
baseline, and no supplier roadmap suggests any yet. They are therefore not
declared here. The inventory at the end of the file names each of them, with
its API items and tests, under the names of the packet.

What elaborating this file checks is the algebra that can be stated today:
the chart ring with its universal property, the monomial indices with their
transition, exact level and Δ-weights, the polynomial logarithmic derivations,
their action on monomials and their descent to the chart quotient, the
uncompleted levels and transition maps of the root tower with the
non-flatness test, the coefficient maps of the Breuil–Kisin normalization
with the θ-squares stated with Mathlib's Fontaine θ, the ramified example
ℤ_p[π]/(π^p − p), and the algebra behind the two arithmetic examples of AI.7.
The two maps g and θ̃_𝔖 are declared by their values on generators and their
uniqueness, under the hypothesis that π is nilpotent modulo p; their
construction is not written.
-/

noncomputable section
namespace TauCeti.AInfBlueprint

namespace Semistable

abbrev ChartVariables (r s : ℕ) := Fin (r + 1) ⊕ (Fin s ⊕ Fin s)

def chartIdeal (R : Type*) [CommRing R] (π : R) (r s : ℕ) :
    Ideal (MvPolynomial (ChartVariables r s) R) :=
  Ideal.span (insert
    ((∏ i : Fin (r + 1), MvPolynomial.X (Sum.inl i)) - MvPolynomial.C π)
    (Set.range fun j : Fin s =>
      MvPolynomial.X (Sum.inr (Sum.inl j)) *
        MvPolynomial.X (Sum.inr (Sum.inr j)) - 1))

abbrev ChartQuotient (R : Type*) [CommRing R] (π : R) (r s : ℕ) :=
  MvPolynomial (ChartVariables r s) R ⧸ chartIdeal R π r s

def chartAdicIdeal (R : Type*) [CommRing R] (p : ℕ) (π : R) (r s : ℕ) :
    Ideal (ChartQuotient R π r s) :=
  Ideal.span ({(p : ChartQuotient R π r s)} : Set (ChartQuotient R π r s))

/-- The actual polynomial chart quotient followed by ordinary p-adic completion. -/
def chartRing (R : Type*) [CommRing R] (p : ℕ) (π : R) (r s : ℕ) : Type _ :=
  AdicCompletion (chartAdicIdeal R p π r s) (ChartQuotient R π r s)

instance (R : Type*) [CommRing R] (p : ℕ) (π : R) (r s : ℕ) :
    CommRing (chartRing R p π r s) := by
  unfold chartRing
  infer_instance

instance (R : Type*) [CommRing R] (p : ℕ) (π : R) (r s : ℕ) :
    Algebra R (chartRing R p π r s) := by
  unfold chartRing
  infer_instance

instance (R : Type*) [CommRing R] (p : ℕ) (π : R) (r s : ℕ) :
    Algebra (ChartQuotient R π r s) (chartRing R p π r s) := by
  unfold chartRing
  infer_instance

namespace chartRing
variable {R : Type*} [CommRing R] (p : ℕ) (π : R) (r s : ℕ)

def coordinate (v : ChartVariables r s) : chartRing R p π r s :=
  algebraMap (ChartQuotient R π r s) (chartRing R p π r s)
    (Ideal.Quotient.mk (chartIdeal R π r s) (MvPolynomial.X v))

lemma branch_relation :
    (∏ i : Fin (r + 1), coordinate p π r s (Sum.inl i)) =
      algebraMap R (chartRing R p π r s) π := by
  have h : Ideal.Quotient.mk (chartIdeal R π r s)
      (∏ i : Fin (r + 1), MvPolynomial.X (Sum.inl i)) =
      Ideal.Quotient.mk _ (MvPolynomial.C π) :=
    Ideal.Quotient.eq.mpr (Ideal.subset_span (Set.mem_insert _ _))
  simp only [coordinate, ← map_prod]
  rw [h]
  rfl

lemma torus_inverse (j : Fin s) :
    coordinate p π r s (Sum.inr (Sum.inl j)) *
      coordinate p π r s (Sum.inr (Sum.inr j)) = 1 := by
  have h : Ideal.Quotient.mk (chartIdeal R π r s)
      (MvPolynomial.X (Sum.inr (Sum.inl j)) * MvPolynomial.X (Sum.inr (Sum.inr j))) = 1 := by
    rw [← map_one (Ideal.Quotient.mk _)]
    exact Ideal.Quotient.eq.mpr (Ideal.subset_span (Set.mem_insert_of_mem _ ⟨j, rfl⟩))
  simp only [coordinate, ← map_mul]
  rw [h, map_one]

lemma reduction (n : ℕ) (x : ChartQuotient R π r s) :
    AdicCompletion.evalₐ (chartAdicIdeal R p π r s) n
      (algebraMap (ChartQuotient R π r s) (chartRing R p π r s) x) =
        Ideal.Quotient.mk ((chartAdicIdeal R p π r s) ^ n) x := by
  exact AdicCompletion.evalₐ_of _ n x

/-- The uncompleted half of the chart universal property: maps out of the polynomial
quotient. The completed half is `liftCompletion`. -/
lemma lift {B : Type*} [CommRing B] (f : R →+* B)
    (v : ChartVariables r s → B)
    (hbranch : (∏ i : Fin (r + 1), v (Sum.inl i)) = f π)
    (htorus : ∀ j : Fin s, v (Sum.inr (Sum.inl j)) * v (Sum.inr (Sum.inr j)) = 1) :
    ∃! Φ : ChartQuotient R π r s →+* B,
      Φ.comp (Ideal.Quotient.mk (chartIdeal R π r s)) = MvPolynomial.eval₂Hom f v := by
  have hker : chartIdeal R π r s ≤ RingHom.ker (MvPolynomial.eval₂Hom f v) := by
    refine Ideal.span_le.mpr ?_
    rintro g (rfl | ⟨j, rfl⟩)
    · simp [hbranch]
    · simp [htorus j]
  refine ⟨Ideal.Quotient.lift _ (MvPolynomial.eval₂Hom f v)
    (fun a ha => RingHom.mem_ker.mp (hker ha)), Ideal.Quotient.lift_comp_mk _ _ _, ?_⟩
  intro Φ hΦ
  apply Ideal.Quotient.ringHom_ext
  rw [hΦ, Ideal.Quotient.lift_comp_mk]

/-- The completed half of the chart universal property. The target `B` is complete and
separated for the ideal generated by the image of `p`. Uniqueness is among all ring
homomorphisms, with no continuity hypothesis: the ideal `(p)` is principal, so the kernel
of the projection of the completion to level `n` is `p ^ n` times the completion, every
element is the image of a polynomial class plus a multiple of `p ^ n`, and `B` is
separated. -/
lemma liftCompletion {B : Type*} [CommRing B]
    [IsAdicComplete (Ideal.span ({(p : B)} : Set B)) B] (f : R →+* B)
    (v : ChartVariables r s → B)
    (hbranch : (∏ i : Fin (r + 1), v (Sum.inl i)) = f π)
    (htorus : ∀ j : Fin s, v (Sum.inr (Sum.inl j)) * v (Sum.inr (Sum.inr j)) = 1) :
    ∃! Φ : chartRing R p π r s →+* B,
      (∀ x : ChartVariables r s, Φ (coordinate p π r s x) = v x) ∧
      ∀ a : R, Φ (algebraMap R (chartRing R p π r s) a) = f a := by
  sorry

/-- The completed half of the chart universal property for a general target: for an ideal
`I` of `B` containing the image of `p`, a compatible family of ring maps from the chart
quotient to `B ⧸ I ^ n` induces a unique ring map from the chart ring to
`AdicCompletion I B`, the limit of the `B ⧸ I ^ n`, compatible with the projections.
Compatibility is asked on the image of the chart quotient only; this determines the map
because the kernel of the projection of the chart ring to level `n` is generated by
`p ^ n`, which goes to `0` in `B ⧸ I ^ n`. -/
lemma liftCompletionOfFamily {B : Type*} [CommRing B] (I : Ideal B) (hp : (p : B) ∈ I)
    (φ : (n : ℕ) → ChartQuotient R π r s →+* B ⧸ I ^ n)
    (hφ : ∀ {m n : ℕ} (hle : m ≤ n), (Ideal.Quotient.factorPow I hle).comp (φ n) = φ m) :
    ∃! Φ : chartRing R p π r s →+* AdicCompletion I B,
      ∀ (n : ℕ) (x : ChartQuotient R π r s),
        AdicCompletion.evalₐ I n
          (Φ (algebraMap (ChartQuotient R π r s) (chartRing R p π r s) x)) = φ n x := by
  sorry

-- Semistable.chartRing.nodal
example : coordinate p π 1 0 (Sum.inl 0) * coordinate p π 1 0 (Sum.inl 1) =
    algebraMap R (chartRing R p π 1 0) π := by
  simpa [Fin.prod_univ_two] using branch_relation p π 1 0

-- Semistable.chartRing.unit_coordinate
example : coordinate p π r 1 (Sum.inr (Sum.inl 0)) *
    coordinate p π r 1 (Sum.inr (Sum.inr 0)) = 1 :=
  torus_inverse p π r 1 0

-- Semistable.chartRing.point
example :
    (∃ e : ChartQuotient R π 0 0 ≃+* R,
      ∀ x : R, e (algebraMap R (ChartQuotient R π 0 0) x) = x) ∧
    Nonempty (chartRing R p π 0 0 ≃+*
      AdicCompletion (Ideal.span ({(p : R)} : Set R)) R) := by
  sorry

-- Semistable.chartRing.restricted
-- For `R = ℤ_p`, `π = p`, `r = 1`, `s = 0`: `1 - T₀` is not a unit of the chart ring.
example (p : ℕ) [Fact p.Prime] :
    ¬IsUnit (1 - coordinate p (p : ℤ_[p]) 1 0 (Sum.inl 0)) := by
  intro hu
  let v : ChartVariables 1 0 → ZMod p := Sum.elim (fun k => if k = 0 then 1 else 0) fun _ => 0
  obtain ⟨φ₁, hφ₁, -⟩ := lift (p : ℤ_[p]) 1 0 (PadicInt.toZMod (p := p)) v
    (by simp [v, Fin.prod_univ_two]) (fun j => j.elim0)
  have hX : φ₁ (Ideal.Quotient.mk _ (MvPolynomial.X (Sum.inl 0))) = 1 := by
    have h := RingHom.congr_fun hφ₁ (MvPolynomial.X (Sum.inl 0))
    simpa [v] using h
  have hp1 : ∀ a ∈ chartAdicIdeal ℤ_[p] p (p : ℤ_[p]) 1 0 ^ 1, φ₁ a = 0 := by
    intro a ha
    rw [pow_one, chartAdicIdeal, Ideal.mem_span_singleton] at ha
    obtain ⟨c, rfl⟩ := ha
    simp
  let Ψ₀ : AdicCompletion (chartAdicIdeal ℤ_[p] p (p : ℤ_[p]) 1 0)
      (ChartQuotient ℤ_[p] (p : ℤ_[p]) 1 0) →+* ZMod p :=
    (Ideal.Quotient.lift _ φ₁ hp1).comp
      (AdicCompletion.evalₐ (chartAdicIdeal ℤ_[p] p (p : ℤ_[p]) 1 0) 1).toRingHom
  let Ψ : chartRing ℤ_[p] p (p : ℤ_[p]) 1 0 →+* ZMod p := Ψ₀
  have hx : (1 : chartRing ℤ_[p] p (p : ℤ_[p]) 1 0) - coordinate p (p : ℤ_[p]) 1 0 (Sum.inl 0) =
      algebraMap (ChartQuotient ℤ_[p] (p : ℤ_[p]) 1 0) (chartRing ℤ_[p] p (p : ℤ_[p]) 1 0)
        (1 - Ideal.Quotient.mk _ (MvPolynomial.X (Sum.inl 0))) := by
    simp [coordinate]
  rw [hx] at hu
  have hΨ : Ψ (algebraMap (ChartQuotient ℤ_[p] (p : ℤ_[p]) 1 0)
      (chartRing ℤ_[p] p (p : ℤ_[p]) 1 0)
      (1 - Ideal.Quotient.mk _ (MvPolynomial.X (Sum.inl 0)))) = 0 := by
    show (Ideal.Quotient.lift _ φ₁ hp1)
      (AdicCompletion.evalₐ (chartAdicIdeal ℤ_[p] p (p : ℤ_[p]) 1 0) 1
        (algebraMap (ChartQuotient ℤ_[p] (p : ℤ_[p]) 1 0) (chartRing ℤ_[p] p (p : ℤ_[p]) 1 0)
          (1 - Ideal.Quotient.mk _ (MvPolynomial.X (Sum.inl 0))))) = 0
    rw [reduction, Ideal.Quotient.lift_mk, map_sub, map_one, hX, sub_self]
  have h0 := hu.map Ψ
  rw [hΨ] at h0
  exact not_isUnit_zero h0

-- Semistable.chartRing.restricted
-- Reduction at level `1` is surjective and its kernel is generated by `p`.
example (p : ℕ) [Fact p.Prime] :
    (∀ y, ∃ x : chartRing ℤ_[p] p (p : ℤ_[p]) 1 0,
      AdicCompletion.evalₐ (chartAdicIdeal ℤ_[p] p (p : ℤ_[p]) 1 0) 1 x = y) ∧
    ∀ x : chartRing ℤ_[p] p (p : ℤ_[p]) 1 0,
      AdicCompletion.evalₐ (chartAdicIdeal ℤ_[p] p (p : ℤ_[p]) 1 0) 1 x = 0 ↔
        x ∈ Ideal.span ({(p : chartRing ℤ_[p] p (p : ℤ_[p]) 1 0)} : Set _) := by
  sorry

-- Semistable.chartRing.restricted
-- The chart ring modulo `p` is `𝔽_p[T₀, T₁] / (T₀ T₁)`, coordinates going to coordinates.
example (p : ℕ) [Fact p.Prime] :
    ∃ e : (chartRing ℤ_[p] p (p : ℤ_[p]) 1 0 ⧸
        Ideal.span ({(p : chartRing ℤ_[p] p (p : ℤ_[p]) 1 0)} : Set _)) ≃+*
        ChartQuotient (ZMod p) (0 : ZMod p) 1 0,
      ∀ v : ChartVariables 1 0,
        e (Ideal.Quotient.mk _ (coordinate p (p : ℤ_[p]) 1 0 v)) =
          Ideal.Quotient.mk _ (MvPolynomial.X v) := by
  sorry

-- Semistable.chartRing.restricted
-- In the completion of the chart quotient along `(p, T₀, T₁)` the element `1 - T₀` is a unit.
example (p : ℕ) [Fact p.Prime] :
    IsUnit (1 - AdicCompletion.of
      (Ideal.span ({(p : ChartQuotient ℤ_[p] (p : ℤ_[p]) 1 0),
        Ideal.Quotient.mk _ (MvPolynomial.X (Sum.inl 0)),
        Ideal.Quotient.mk _ (MvPolynomial.X (Sum.inl 1))} :
          Set (ChartQuotient ℤ_[p] (p : ℤ_[p]) 1 0)))
      (ChartQuotient ℤ_[p] (p : ℤ_[p]) 1 0)
      (Ideal.Quotient.mk _ (MvPolynomial.X (Sum.inl 0)))) := by
  sorry
end chartRing

/-- A witness of a zero branch exponent is a property, not a chosen extra index. -/
def monomialExponents (r s : ℕ) :=
  { ab : (Fin (r + 1) → ℕ) × (Fin s → ℤ) // ∃ i, ab.1 i = 0 }

namespace monomialExponents
variable {r s : ℕ}

def minimum (a : Fin (r + 1) → ℕ) : ℕ :=
  (Finset.univ.image a).min' (by
    exact ⟨a 0, Finset.mem_image.mpr ⟨0, Finset.mem_univ 0, rfl⟩⟩)

/-- The removed coefficient exponent is `minimum a` and is retained separately. -/
def normalize (a : Fin (r + 1) → ℕ) : Fin (r + 1) → ℕ :=
  fun i => a i - minimum a

lemma normalized (a : Fin (r + 1) → ℕ) :
    (∃ i, a i = 0) ↔ normalize a = a := by
  constructor
  · rintro ⟨i, hi⟩
    have hle : minimum a ≤ a i :=
      Finset.min'_le _ _ (Finset.mem_image_of_mem a (Finset.mem_univ i))
    have hmin : minimum a = 0 := by omega
    funext j
    simp [normalize, hmin]
  · intro h
    obtain ⟨i, -, hi⟩ := Finset.mem_image.mp (Finset.min'_mem (Finset.univ.image a)
      ⟨a 0, Finset.mem_image.mpr ⟨0, Finset.mem_univ 0, rfl⟩⟩)
    have hi' : a i = minimum a := hi
    have := congrFun h i
    simp only [normalize] at this
    exact ⟨i, by omega⟩

def isIntegral (p m : ℕ) (e : monomialExponents r s) : Prop :=
  (∀ i, p ^ m ∣ e.val.1 i) ∧ (∀ j, (p ^ m : ℤ) ∣ e.val.2 j)

/-- The level-`m` index with numerators `e` is integral exactly when it is `p ^ m` times
a normalized index: the monomial `∏ Tᵢ^{aᵢ/p^m} ∏ Yⱼ^{bⱼ/p^m}` is then the honest monomial
with exponents `e'`. -/
lemma integral (p m : ℕ) (e : monomialExponents r s) :
    isIntegral p m e ↔
      ∃ e' : monomialExponents r s,
        (∀ i, e.val.1 i = p ^ m * e'.val.1 i) ∧
        (∀ j, e.val.2 j = (p ^ m : ℤ) * e'.val.2 j) := by
  constructor
  · rintro ⟨h₁, h₂⟩
    obtain ⟨i₀, hi₀⟩ := e.property
    exact ⟨⟨(fun i => e.val.1 i / p ^ m, fun j => e.val.2 j / (p ^ m : ℤ)),
        ⟨i₀, by simp [hi₀]⟩⟩,
      fun i => (Nat.mul_div_cancel' (h₁ i)).symm,
      fun j => (Int.mul_ediv_cancel' (h₂ j)).symm⟩
  · rintro ⟨e', h₁, h₂⟩
    exact ⟨fun i => ⟨_, h₁ i⟩, fun j => ⟨_, h₂ j⟩⟩

-- Semistable.monomialExponents.node
example : normalize ![2, 3] = ![0, 1] ∧ minimum ![2, 3] = 2 := by
  have hm : minimum ![2, 3] = 2 := by decide
  refine ⟨?_, hm⟩
  funext i
  fin_cases i <;> simp [normalize, hm]

-- Semistable.monomialExponents.point
example (p m : ℕ) (e : monomialExponents 0 0) : isIntegral p m e := by
  obtain ⟨⟨a, b⟩, i, hi⟩ := e
  refine ⟨fun j => ?_, fun j => j.elim0⟩
  have : j = i := Fin.ext (by omega)
  subst this
  simp only at hi ⊢
  rw [hi]; exact dvd_zero _

-- Semistable.monomialExponents.fractional_torus
example : ¬isIntegral 2 1
    (⟨(![0, 2], ![-1]), ⟨0, by simp⟩⟩ : monomialExponents 1 1) := by
  rintro ⟨_, h⟩
  have := h 0
  norm_num at this

/-- The level-`m` index `e` viewed at level `m + 1`: `(a, b) ↦ (p a, p b)`. A zero branch
exponent stays zero, so the result is again an index. It represents the same monomial
(`rootTower.transition_toMonomial`). -/
def transition (p : ℕ) (e : monomialExponents r s) : monomialExponents r s :=
  ⟨(fun i => p * e.val.1 i, fun j => (p : ℤ) * e.val.2 j),
    e.property.imp fun i hi => by simp [hi]⟩

lemma transition_injective {p : ℕ} (hp : p ≠ 0) :
    Function.Injective (transition (r := r) (s := s) p) := by
  intro e e' h
  have h₁ : ∀ i, p * e.val.1 i = p * e'.val.1 i := fun i =>
    congrFun (congrArg (fun x : monomialExponents r s => x.val.1) h) i
  have h₂ : ∀ j, (p : ℤ) * e.val.2 j = (p : ℤ) * e'.val.2 j := fun j =>
    congrFun (congrArg (fun x : monomialExponents r s => x.val.2) h) j
  apply Subtype.ext
  apply Prod.ext
  · funext i
    exact Nat.eq_of_mul_eq_mul_left (Nat.pos_of_ne_zero hp) (h₁ i)
  · funext j
    exact mul_left_cancel₀ (Int.natCast_ne_zero.mpr hp) (h₂ j)

lemma minimum_smul (p : ℕ) (a : Fin (r + 1) → ℕ) : minimum (p • a) = p * minimum a := by
  have hne : ∀ c : Fin (r + 1) → ℕ, (Finset.univ.image c).Nonempty := fun c =>
    ⟨c 0, Finset.mem_image.mpr ⟨0, Finset.mem_univ 0, rfl⟩⟩
  obtain ⟨i, -, hi⟩ := Finset.mem_image.mp (Finset.min'_mem (Finset.univ.image a) (hne a))
  obtain ⟨j, -, hj⟩ := Finset.mem_image.mp
    (Finset.min'_mem (Finset.univ.image (p • a)) (hne (p • a)))
  have hi' : a i = minimum a := hi
  have hj' : (p • a) j = minimum (p • a) := hj
  have h₁ : minimum (p • a) ≤ (p • a) i :=
    Finset.min'_le _ _ (Finset.mem_image_of_mem _ (Finset.mem_univ i))
  have h₂ : minimum a ≤ a j :=
    Finset.min'_le _ _ (Finset.mem_image_of_mem _ (Finset.mem_univ j))
  have h₃ : (p • a) i = p * a i := by simp
  have h₄ : (p • a) j = p * a j := by simp
  apply le_antisymm
  · rw [← hi', ← h₃]
    exact h₁
  · rw [← hj', h₄]
    exact Nat.mul_le_mul_left p h₂

/-- Scaling by `p` commutes with normalization. -/
lemma normalize_smul (p : ℕ) (a : Fin (r + 1) → ℕ) : normalize (p • a) = p • normalize a := by
  funext i
  simp only [normalize, minimum_smul, Pi.smul_apply, smul_eq_mul, Nat.mul_sub]

/-- Transition preserves integrality: integral at level `m` iff the image is integral at
level `m + 1`. -/
lemma isIntegral_transition {p : ℕ} (hp : p ≠ 0) (m : ℕ) (e : monomialExponents r s) :
    isIntegral p (m + 1) (transition p e) ↔ isIntegral p m e := by
  have hp' : 0 < p := Nat.pos_of_ne_zero hp
  have hpz : (p : ℤ) ≠ 0 := Int.natCast_ne_zero.mpr hp
  constructor
  · rintro ⟨h₁, h₂⟩
    refine ⟨fun i => ?_, fun j => ?_⟩
    · have := h₁ i
      simp only [transition, pow_succ'] at this
      exact (Nat.mul_dvd_mul_iff_left hp').mp this
    · have := h₂ j
      simp only [transition, pow_succ'] at this
      exact (mul_dvd_mul_iff_left hpz).mp this
  · rintro ⟨h₁, h₂⟩
    refine ⟨fun i => ?_, fun j => ?_⟩
    · simp only [transition, pow_succ']
      exact Nat.mul_dvd_mul_left p (h₁ i)
    · simp only [transition, pow_succ']
      exact mul_dvd_mul_left _ (h₂ j)

lemma isIntegral_of_le (p : ℕ) {t t' : ℕ} (h : t' ≤ t) {e : monomialExponents r s}
    (he : isIntegral p t e) : isIntegral p t' e :=
  ⟨fun i => (pow_dvd_pow p h).trans (he.1 i), fun j => (pow_dvd_pow (p : ℤ) h).trans (he.2 j)⟩

open Classical in
/-- The exact level of the level-`m` index `e`: the least `m'` such that `p ^ (m - m')`
divides every branch numerator and every torus numerator. Such an `m'` exists and the
least one is at most `m`, because `m' = m` asks for divisibility by `1` (`level_le`). The
zero index has exact level `0` at every level, since every power of `p` divides `0`. For
`p = 1` every index has exact level `0`. -/
def level (p m : ℕ) (e : monomialExponents r s) : ℕ :=
  Nat.find (⟨m, by simp [isIntegral]⟩ : ∃ m', isIntegral p (m - m') e)

lemma level_spec (p m : ℕ) (e : monomialExponents r s) :
    isIntegral p (m - level p m e) e := by
  classical
  exact Nat.find_spec (⟨m, by simp [isIntegral]⟩ : ∃ m', isIntegral p (m - m') e)

lemma level_min (p m : ℕ) (e : monomialExponents r s) {m' : ℕ}
    (h : isIntegral p (m - m') e) : level p m e ≤ m' := by
  classical
  exact Nat.find_min' _ h

lemma level_le (p m : ℕ) (e : monomialExponents r s) : level p m e ≤ m :=
  level_min p m e (by simp [isIntegral])

/-- The defining property of the exact level. -/
lemma level_le_iff (p m m' : ℕ) (e : monomialExponents r s) :
    level p m e ≤ m' ↔ isIntegral p (m - m') e :=
  ⟨fun h => isIntegral_of_le p (Nat.sub_le_sub_left h m) (level_spec p m e), level_min p m e⟩

/-- An index is integral exactly when its exact level is `0`. -/
lemma isIntegral_iff_level_eq_zero (p m : ℕ) (e : monomialExponents r s) :
    isIntegral p m e ↔ level p m e = 0 := by
  constructor
  · intro h
    exact Nat.le_zero.mp (level_min p m e (by simpa using h))
  · intro h
    have := level_spec p m e
    rw [h] at this
    simpa using this

/-- The exact level is unchanged by transition. -/
lemma level_transition {p : ℕ} (hp : p ≠ 0) (m : ℕ) (e : monomialExponents r s) :
    level p (m + 1) (transition p e) = level p m e := by
  apply le_antisymm
  · apply (level_le_iff p (m + 1) _ _).mpr
    have hL := level_le p m e
    have h : m + 1 - level p m e = (m - level p m e) + 1 := by omega
    rw [h]
    exact (isIntegral_transition hp _ e).mpr (level_spec p m e)
  · apply (level_le_iff p m _ e).mpr
    have hs := level_spec p (m + 1) (transition p e)
    by_cases hL : level p (m + 1) (transition p e) ≤ m
    · have h : m + 1 - level p (m + 1) (transition p e) =
          (m - level p (m + 1) (transition p e)) + 1 := by omega
      rw [h] at hs
      exact (isIntegral_transition hp _ e).mp hs
    · have h : m - level p (m + 1) (transition p e) = 0 := by omega
      rw [h]
      simp [isIntegral]

/-- The integer `Δ`-weights of an index, in units of `1 / p ^ m` at level `m`. The
directions are indexed as for `logWeight`: for `i.val < r` the branch direction pairing
the variable `Sum.inl (i + 1)` against `Sum.inl 0`, with weight `a_{i+1} - a_0`; for
`i.val ≥ r` the torus direction `i.val - r`, with weight `b_{i-r}`. -/
def weight (e : monomialExponents r s) (i : Fin (r + s)) : ℤ :=
  if h : i.val < r then (e.val.1 ⟨i.val + 1, by omega⟩ : ℤ) - (e.val.1 0 : ℤ)
  else e.val.2 ⟨i.val - r, by have := i.isLt; omega⟩

lemma weight_transition (p : ℕ) (e : monomialExponents r s) (i : Fin (r + s)) :
    weight (transition p e) i = p * weight e i := by
  unfold weight
  split_ifs with h
  · simp only [transition]
    push_cast
    ring
  · simp only [transition]

/-- Divisibility of all numerators by `p ^ t` is the same as divisibility of all weights,
because some branch exponent is zero. -/
lemma isIntegral_iff_weight (p t : ℕ) (e : monomialExponents r s) :
    isIntegral p t e ↔ ∀ i : Fin (r + s), (p ^ t : ℤ) ∣ weight e i := by
  have hcast : ∀ n : ℕ, (p ^ t : ℤ) ∣ (n : ℤ) ↔ p ^ t ∣ n := fun n => by
    rw [← Nat.cast_pow, Int.natCast_dvd_natCast]
  constructor
  · rintro ⟨h₁, h₂⟩ i
    unfold weight
    split_ifs with h
    · exact dvd_sub ((hcast _).mpr (h₁ _)) ((hcast _).mpr (h₁ _))
    · exact h₂ _
  · intro hw
    have hb : ∀ j : Fin s, (p ^ t : ℤ) ∣ e.val.2 j := fun j => by
      have h := hw ⟨r + j.val, by omega⟩
      simpa [weight] using h
    have hbr : ∀ k : Fin (r + 1), k.val ≠ 0 →
        (p ^ t : ℤ) ∣ (e.val.1 k : ℤ) - (e.val.1 0 : ℤ) := fun k hk => by
      have hlt : k.val - 1 < r := by have := k.isLt; omega
      have h := hw ⟨k.val - 1, by omega⟩
      have hk' : (⟨k.val - 1 + 1, by omega⟩ : Fin (r + 1)) = k := Fin.ext (by simp; omega)
      simpa [weight, hlt, hk'] using h
    have h₀ : (p ^ t : ℤ) ∣ (e.val.1 0 : ℤ) := by
      obtain ⟨k, hk⟩ := e.property
      by_cases hk0 : k.val = 0
      · have : k = 0 := Fin.ext hk0
        rw [← this, hk]
        simp
      · have h := hbr k hk0
        rw [hk] at h
        simpa using h
    refine ⟨fun k => (hcast _).mp ?_, hb⟩
    by_cases hk0 : k.val = 0
    · have : k = 0 := Fin.ext hk0
      rw [this]
      exact h₀
    · have h := dvd_add (hbr k hk0) h₀
      simpa using h

/-- The exact level is also the least `m'` such that `p ^ (m - m')` divides every weight. -/
lemma level_le_iff_weight (p m m' : ℕ) (e : monomialExponents r s) :
    level p m e ≤ m' ↔ ∀ i : Fin (r + s), (p ^ (m - m') : ℤ) ∣ weight e i :=
  (level_le_iff p m m' e).trans (isIntegral_iff_weight p (m - m') e)

/-- A nonintegral index has a weight not divisible by `p ^ m`. -/
lemma exists_weight_not_dvd (p m : ℕ) (e : monomialExponents r s) (he : ¬isIntegral p m e) :
    ∃ i : Fin (r + s), ¬(p ^ m : ℤ) ∣ weight e i := by
  rw [isIntegral_iff_weight] at he
  exact not_forall.mp he

/-- The polynomial monomial of an index, with numerators taken at level `0`:
`∏ X_k ^ a_k * ∏ Y_j ^ b_j⁺ * Z_j ^ b_j⁻`. A negative torus exponent is carried by the
inverse coordinate `Z_j`, so this is an honest polynomial for every index. -/
def toMonomial (R : Type*) [CommRing R] (e : monomialExponents r s) :
    MvPolynomial (ChartVariables r s) R :=
  (∏ k : Fin (r + 1), MvPolynomial.X (Sum.inl k) ^ e.val.1 k) *
    ∏ j : Fin s, (MvPolynomial.X (Sum.inr (Sum.inl j)) ^ (e.val.2 j).toNat *
      MvPolynomial.X (Sum.inr (Sum.inr j)) ^ (-(e.val.2 j)).toNat)

-- Semistable.monomialExponents.level_weight
-- The level-`1` index `((0,2),(4))` is the transition of `((0,1),(2))`, of exact level `0`.
example :
    transition 2 (⟨(![0, 1], ![2]), ⟨0, by simp⟩⟩ : monomialExponents 1 1) =
      ⟨(![0, 2], ![4]), ⟨0, by simp⟩⟩ ∧
    level 2 1 (⟨(![0, 2], ![4]), ⟨0, by simp⟩⟩ : monomialExponents 1 1) = 0 := by
  refine ⟨?_, ?_⟩
  · apply Subtype.ext
    apply Prod.ext
    · funext i
      fin_cases i <;> rfl
    · funext j
      fin_cases j
      rfl
  · apply (isIntegral_iff_level_eq_zero 2 1 _).mp
    refine ⟨fun i => ?_, fun j => ?_⟩
    · fin_cases i <;> norm_num
    · fin_cases j
      norm_num

-- Semistable.monomialExponents.level_weight
-- The level-`2` index `((0,2),(1))` has exact level `2` and weights `(2,1)`.
example :
    level 2 2 (⟨(![0, 2], ![1]), ⟨0, by simp⟩⟩ : monomialExponents 1 1) = 2 ∧
    weight (⟨(![0, 2], ![1]), ⟨0, by simp⟩⟩ : monomialExponents 1 1) = ![2, 1] := by
  refine ⟨le_antisymm (level_le 2 2 _) ?_, ?_⟩
  · by_contra h
    have h' := (level_le_iff 2 2 1 _).mp (Nat.le_of_lt_succ (not_le.mp h))
    have := h'.2 0
    norm_num at this
  · funext i
    fin_cases i <;> rfl

-- Semistable.monomialExponents.level_weight
-- The level-`1` index `((1,0),(0))` has weights `(-1,0)` and exact level `1`.
example :
    weight (⟨(![1, 0], ![0]), ⟨1, by simp⟩⟩ : monomialExponents 1 1) = ![-1, 0] ∧
    level 2 1 (⟨(![1, 0], ![0]), ⟨1, by simp⟩⟩ : monomialExponents 1 1) = 1 := by
  refine ⟨?_, le_antisymm (level_le 2 1 _) ?_⟩
  · funext i
    fin_cases i <;> rfl
  · by_contra h
    have h' := (isIntegral_iff_level_eq_zero 2 1 _).mpr (Nat.lt_one_iff.mp (not_le.mp h))
    have := h'.1 0
    norm_num at this
end monomialExponents

/-- Integer weights for all branch/torus logarithmic directions. -/
def logWeight (r s : ℕ) (i : Fin (r + s)) (v : ChartVariables r s) : ℤ :=
  if i.val < r then
    match v with
    | Sum.inl k => if k.val = i.val + 1 then 1 else if k.val = 0 then -1 else 0
    | Sum.inr _ => 0
  else
    match v with
    | Sum.inl _ => 0
    | Sum.inr (Sum.inl j) => if j.val = i.val - r then 1 else 0
    | Sum.inr (Sum.inr j) => if j.val = i.val - r then -1 else 0

lemma logWeight_inr_inr {r s : ℕ} (i : Fin (r + s)) (j : Fin s) :
    logWeight r s i (Sum.inr (Sum.inr j)) = -logWeight r s i (Sum.inr (Sum.inl j)) := by
  simp only [logWeight]
  split_ifs <;> simp

/-- Exponents paired with the weights of the direction `i`: a branch direction gives
`a_{i+1} - a_0`, a torus direction gives `b_{i-r}`. -/
lemma logWeight_sum {r s : ℕ} (i : Fin (r + s)) (a : Fin (r + 1) → ℤ) (b : Fin s → ℤ) :
    ∑ k, a k * logWeight r s i (Sum.inl k) +
        ∑ j, b j * logWeight r s i (Sum.inr (Sum.inl j)) =
      if h : i.val < r then a ⟨i.val + 1, by omega⟩ - a 0
      else b ⟨i.val - r, by have := i.isLt; omega⟩ := by
  split_ifs with h
  · have h₂ : ∑ j, b j * logWeight r s i (Sum.inr (Sum.inl j)) = 0 :=
      Finset.sum_eq_zero fun j _ => by simp [logWeight, h]
    have h₁ : ∑ k : Fin r, a k.succ * logWeight r s i (Sum.inl k.succ) =
        a ⟨i.val + 1, by omega⟩ := by
      rw [Finset.sum_eq_single (⟨i.val, h⟩ : Fin r)]
      · simp [logWeight, h]
      · intro k _ hk
        have hne : k.val ≠ i.val := fun hki => hk (Fin.ext hki)
        simp [logWeight, h, hne]
      · simp
    rw [h₂, add_zero, Fin.sum_univ_succ, h₁]
    simp [logWeight, h]
    ring
  · have h₁ : ∑ k, a k * logWeight r s i (Sum.inl k) = 0 :=
      Finset.sum_eq_zero fun k _ => by simp [logWeight, h]
    rw [h₁, zero_add,
      Finset.sum_eq_single (⟨i.val - r, by have := i.isLt; omega⟩ : Fin s)]
    · simp [logWeight, h]
    · intro j _ hj
      have hne : j.val ≠ i.val - r := fun hji => hj (Fin.ext hji)
      simp [logWeight, h, hne]
    · simp

/-- The weights of an index are its exponents paired with `logWeight`. -/
lemma monomialExponents.weight_eq_sum {r s : ℕ} (e : monomialExponents r s)
    (i : Fin (r + s)) :
    monomialExponents.weight e i =
      ∑ k, (e.val.1 k : ℤ) * logWeight r s i (Sum.inl k) +
        ∑ j, e.val.2 j * logWeight r s i (Sum.inr (Sum.inl j)) := by
  rw [logWeight_sum i (fun k => (e.val.1 k : ℤ)) e.val.2]
  rfl

/-- Actual polynomial derivations. The complete étale/PD continuation is omitted. -/
def logDerivations (R : Type*) [CommRing R] (r s : ℕ) (i : Fin (r + s)) :
    Derivation R (MvPolynomial (ChartVariables r s) R)
      (MvPolynomial (ChartVariables r s) R) :=
  ∑ v : ChartVariables r s,
    (MvPolynomial.C ((logWeight r s i v : ℤ) : R) * MvPolynomial.X v) •
      MvPolynomial.pderiv v

namespace logDerivations
variable {R : Type*} [CommRing R] {r s : ℕ} (i : Fin (r + s))

lemma generators (v : ChartVariables r s) :
    logDerivations R r s i (MvPolynomial.X v) =
      MvPolynomial.C ((logWeight r s i v : ℤ) : R) * MvPolynomial.X v := by
  classical
  have h := congrFun (map_sum (Derivation.coeFnAddMonoidHom (R := R)
    (A := MvPolynomial (ChartVariables r s) R) (M := MvPolynomial (ChartVariables r s) R))
    (fun w => (MvPolynomial.C ((logWeight r s i w : ℤ) : R) * MvPolynomial.X w) •
      MvPolynomial.pderiv w) Finset.univ) (MvPolynomial.X v)
  simp only [Derivation.coeFnAddMonoidHom_apply, Finset.sum_apply, Derivation.smul_apply] at h
  rw [logDerivations, h, Finset.sum_eq_single v]
  · simp
  · intro w _ hw
    simp [MvPolynomial.pderiv_X_of_ne (Ne.symm hw)]
  · simp

/-- A product of two eigenvectors of a derivation is an eigenvector for the sum of the
eigenvalues. -/
lemma eigen_mul {A : Type*} [CommRing A] [Algebra R A] (D : Derivation R A A) {x y a b : A}
    (hx : D x = a * x) (hy : D y = b * y) : D (x * y) = (a + b) * (x * y) := by
  rw [D.leibniz, hx, hy, smul_eq_mul, smul_eq_mul]
  ring

lemma eigen_pow {A : Type*} [CommRing A] [Algebra R A] (D : Derivation R A A) {x a : A}
    (hx : D x = a * x) (n : ℕ) : D (x ^ n) = (n * a) * x ^ n := by
  induction n with
  | zero => simp
  | succ n ih =>
    rw [pow_succ, eigen_mul D ih hx]
    push_cast
    ring

lemma eigen_prod {A : Type*} [CommRing A] [Algebra R A] (D : Derivation R A A) {ι : Type*}
    (S : Finset ι) (f c : ι → A) (h : ∀ k ∈ S, D (f k) = c k * f k) :
    D (∏ k ∈ S, f k) = (∑ k ∈ S, c k) * ∏ k ∈ S, f k := by
  classical
  induction S using Finset.induction_on with
  | empty => simp
  | insert k S hk ih =>
    rw [Finset.prod_insert hk, Finset.sum_insert hk,
      eigen_mul D (h k (Finset.mem_insert_self _ _))
        (ih fun j hj => h j (Finset.mem_insert_of_mem hj))]

lemma relations (π : R) :
    logDerivations R r s i
      ((∏ k : Fin (r + 1), MvPolynomial.X (Sum.inl k)) - MvPolynomial.C π) = 0 ∧
    ∀ j : Fin s, logDerivations R r s i
      (MvPolynomial.X (Sum.inr (Sum.inl j)) *
        MvPolynomial.X (Sum.inr (Sum.inr j)) - 1) = 0 := by
  have hsum : ∑ k : Fin (r + 1), logWeight r s i (Sum.inl k) = 0 := by
    have h := logWeight_sum i (fun _ => 1) (fun _ => 0)
    simpa using h
  refine ⟨?_, fun j => ?_⟩
  · rw [map_sub, eigen_prod _ Finset.univ (fun k => MvPolynomial.X (Sum.inl k))
      (fun k => MvPolynomial.C ((logWeight r s i (Sum.inl k) : ℤ) : R))
      (fun k _ => generators i _), MvPolynomial.derivation_C, sub_zero, ← map_sum,
      ← Int.cast_sum, hsum]
    simp
  · rw [map_sub, eigen_mul _ (generators i _) (generators i _), Derivation.map_one_eq_zero,
      sub_zero, logWeight_inr_inr]
    simp

lemma frobenius (p : ℕ) (F : R →+* R)
    (f : MvPolynomial (ChartVariables r s) R) :
    logDerivations R r s i
      (MvPolynomial.eval₂Hom (MvPolynomial.C.comp F) (fun v => MvPolynomial.X v ^ p) f) =
    (p : MvPolynomial (ChartVariables r s) R) *
      MvPolynomial.eval₂Hom (MvPolynomial.C.comp F) (fun v => MvPolynomial.X v ^ p)
        (logDerivations R r s i f) := by
  sorry

/-- Any two of the logarithmic derivations commute: each is diagonal on monomials. -/
lemma commute (j : Fin (r + s)) (f : MvPolynomial (ChartVariables r s) R) :
    logDerivations R r s i (logDerivations R r s j f) =
      logDerivations R r s j (logDerivations R r s i f) := by
  have h : ⁅logDerivations R r s i, logDerivations R r s j⁆ = 0 := by
    apply MvPolynomial.derivation_ext
    intro v
    simp only [Derivation.commutator_apply, generators, Derivation.leibniz,
      MvPolynomial.derivation_C, smul_eq_mul, Derivation.coe_zero, Pi.zero_apply]
    ring
  have h' := congrArg (fun D => D f) h
  simpa [Derivation.commutator_apply, sub_eq_zero] using h'

/-- The logarithmic derivations preserve the chart ideal, for every `π`. -/
lemma mem_chartIdeal (π : R) {f : MvPolynomial (ChartVariables r s) R}
    (hf : f ∈ chartIdeal R π r s) : logDerivations R r s i f ∈ chartIdeal R π r s := by
  unfold chartIdeal at hf ⊢
  induction hf using Submodule.span_induction with
  | mem x hx =>
    rcases hx with rfl | ⟨j, rfl⟩
    · rw [(relations i π).1]
      exact Submodule.zero_mem _
    · rw [(relations i π).2 j]
      exact Submodule.zero_mem _
  | zero => simp
  | add x y _ _ hx hy =>
    rw [map_add]
    exact Submodule.add_mem _ hx hy
  | smul a x hx ih =>
    rw [smul_eq_mul, Derivation.leibniz]
    exact Submodule.add_mem _ (Submodule.smul_mem _ a ih) (Ideal.mul_mem_right _ _ hx)

/-- The derivation induced on the uncompleted chart quotient. -/
def onQuotient (π : R) (i : Fin (r + s)) :
    Derivation R (ChartQuotient R π r s) (ChartQuotient R π r s) :=
  Derivation.liftOfSurjective (f := Ideal.Quotient.mkₐ R (chartIdeal R π r s))
    (Ideal.Quotient.mkₐ_surjective R _) (d := logDerivations R r s i)
    (fun _ hx => Ideal.Quotient.eq_zero_iff_mem.mpr
      (mem_chartIdeal i π (Ideal.Quotient.eq_zero_iff_mem.mp hx)))

lemma onQuotient_mk (π : R) (f : MvPolynomial (ChartVariables r s) R) :
    onQuotient π i (Ideal.Quotient.mk (chartIdeal R π r s) f) =
      Ideal.Quotient.mk (chartIdeal R π r s) (logDerivations R r s i f) := by
  unfold onQuotient
  exact Derivation.liftOfSurjective_apply (f := Ideal.Quotient.mkₐ R (chartIdeal R π r s))
    (Ideal.Quotient.mkₐ_surjective R _) _ f

-- Semistable.logDerivations.node
example (a : ℤ) : logDerivations ℤ 1 0 0
    (MvPolynomial.X (Sum.inl 0) * MvPolynomial.X (Sum.inl 1) - MvPolynomial.C a) = 0 := by
  simp only [map_sub, Derivation.leibniz, generators, MvPolynomial.derivation_C, smul_eq_mul,
    logWeight]
  simp
  ring

-- Semistable.logDerivations.torus
example : logDerivations ℤ 0 1 0
    (MvPolynomial.X (Sum.inr (Sum.inl 0)) *
      MvPolynomial.X (Sum.inr (Sum.inr 0)) - 1) = 0 := by
  simp only [map_sub, Derivation.leibniz, generators, Derivation.map_one_eq_zero, smul_eq_mul,
    logWeight]
  simp
  ring

-- Semistable.logDerivations.zero_rank
example : IsEmpty (Fin (0 + 0)) :=
  inferInstanceAs (IsEmpty (Fin 0))

/-- Each logarithmic derivation multiplies the monomial of an index by the corresponding
weight of the index. -/
lemma apply_toMonomial (e : monomialExponents r s) :
    logDerivations R r s i (monomialExponents.toMonomial R e) =
      monomialExponents.weight e i • monomialExponents.toMonomial R e := by
  have hX : ∀ (v : ChartVariables r s) (n : ℕ),
      logDerivations R r s i (MvPolynomial.X v ^ n) =
        ((n : MvPolynomial (ChartVariables r s) R) *
          MvPolynomial.C ((logWeight r s i v : ℤ) : R)) * MvPolynomial.X v ^ n :=
    fun v n => eigen_pow _ (generators i v) n
  have hP := eigen_prod (logDerivations R r s i) Finset.univ
    (fun k : Fin (r + 1) => MvPolynomial.X (Sum.inl k) ^ e.val.1 k)
    (fun k => (e.val.1 k : MvPolynomial (ChartVariables r s) R) *
      MvPolynomial.C ((logWeight r s i (Sum.inl k) : ℤ) : R))
    (fun k _ => hX _ _)
  have hQ := eigen_prod (logDerivations R r s i) Finset.univ
    (fun j : Fin s => MvPolynomial.X (Sum.inr (Sum.inl j)) ^ (e.val.2 j).toNat *
      MvPolynomial.X (Sum.inr (Sum.inr j)) ^ (-(e.val.2 j)).toNat)
    (fun j => ((e.val.2 j).toNat : MvPolynomial (ChartVariables r s) R) *
        MvPolynomial.C ((logWeight r s i (Sum.inr (Sum.inl j)) : ℤ) : R) +
      ((-(e.val.2 j)).toNat : MvPolynomial (ChartVariables r s) R) *
        MvPolynomial.C ((logWeight r s i (Sum.inr (Sum.inr j)) : ℤ) : R))
    (fun j _ => eigen_mul _ (hX _ _) (hX _ _))
  rw [monomialExponents.toMonomial, eigen_mul _ hP hQ, zsmul_eq_mul,
    monomialExponents.weight_eq_sum]
  congr 1
  simp only [map_intCast, map_neg, logWeight_inr_inr, Int.cast_neg, Int.cast_add,
    Int.cast_sum, Int.cast_mul, Int.cast_natCast]
  congr 1
  refine Finset.sum_congr rfl fun j _ => ?_
  have h := congrArg (Int.cast : ℤ → MvPolynomial (ChartVariables r s) R)
    (Int.toNat_sub_toNat_neg (e.val.2 j))
  push_cast at h
  rw [← h]
  ring

-- Semistable.logDerivations.monomial
example (a b : ℕ) : logDerivations ℤ 1 0 0
    (MvPolynomial.X (Sum.inl 0) ^ a * MvPolynomial.X (Sum.inl 1) ^ b) =
    ((b : ℤ) - a) • (MvPolynomial.X (Sum.inl 0) ^ a * MvPolynomial.X (Sum.inl 1) ^ b) := by
  have h₀ : logDerivations ℤ 1 0 0 (MvPolynomial.X (Sum.inl 0)) =
      (-1) * MvPolynomial.X (Sum.inl 0) := by
    simp [generators, logWeight]
  have h₁ : logDerivations ℤ 1 0 0 (MvPolynomial.X (Sum.inl 1)) =
      1 * MvPolynomial.X (Sum.inl 1) := by
    simp [generators, logWeight]
  rw [eigen_mul _ (eigen_pow _ h₀ a) (eigen_pow _ h₁ b), zsmul_eq_mul]
  push_cast
  ring

-- Semistable.logDerivations.monomial
example : logDerivations ℤ 1 0 0 (MvPolynomial.X (Sum.inl 1)) = MvPolynomial.X (Sum.inl 1) := by
  simp [generators, logWeight]

-- Semistable.logDerivations.monomial
example : logDerivations ℤ 1 0 0 (MvPolynomial.X (Sum.inl 0)) =
    -MvPolynomial.X (Sum.inl 0) := by
  simp [generators, logWeight]
end logDerivations

namespace rootTower

/-- A compatible system of `p`-power roots of `π`: `root m` is a chosen `p ^ m`-th root.
These are the fixed compatible roots of the packet. -/
structure RootSystem (R : Type*) [CommRing R] (p : ℕ) (π : R) where
  root : ℕ → R
  root_zero : root 0 = π
  root_succ : ∀ m, root (m + 1) ^ p = root m

variable {R : Type*} [CommRing R] {p : ℕ} {π : R}

/-- The uncompleted level-`m` chart of the tower: the chart quotient with `π` replaced by
its chosen `p ^ m`-th root. The coordinates of level `m` are the `p ^ m`-th roots of the
coordinates of level `0`. -/
abbrev level (ρ : RootSystem R p π) (r s m : ℕ) := ChartQuotient R (ρ.root m) r s

/-- The `p`-th power substitution sends the level-`m` relations to consequences of the
level-`m + 1` relations. -/
lemma chartIdeal_le_ker (ρ : RootSystem R p π) (r s m : ℕ) :
    chartIdeal R (ρ.root m) r s ≤ RingHom.ker
      ((Ideal.Quotient.mk (chartIdeal R (ρ.root (m + 1)) r s)).comp
        (MvPolynomial.eval₂Hom MvPolynomial.C fun v => MvPolynomial.X v ^ p)) := by
  refine Ideal.span_le.mpr ?_
  rintro g (rfl | ⟨j, rfl⟩)
  · have h : Ideal.Quotient.mk (chartIdeal R (ρ.root (m + 1)) r s)
        (∏ i : Fin (r + 1), MvPolynomial.X (Sum.inl i)) =
        Ideal.Quotient.mk _ (MvPolynomial.C (ρ.root (m + 1))) :=
      Ideal.Quotient.eq.mpr (Ideal.subset_span (Set.mem_insert _ _))
    have h' : Ideal.Quotient.mk (chartIdeal R (ρ.root (m + 1)) r s)
        (MvPolynomial.C (ρ.root m)) =
        Ideal.Quotient.mk _ (MvPolynomial.C (ρ.root (m + 1))) ^ p := by
      rw [← ρ.root_succ m, map_pow, map_pow]
    simp only [SetLike.mem_coe, RingHom.mem_ker, RingHom.comp_apply, map_sub, map_prod,
      MvPolynomial.eval₂Hom_X', MvPolynomial.eval₂Hom_C, map_pow]
    rw [Finset.prod_pow, ← map_prod, h, h', sub_self]
  · have h : Ideal.Quotient.mk (chartIdeal R (ρ.root (m + 1)) r s)
        (MvPolynomial.X (Sum.inr (Sum.inl j)) * MvPolynomial.X (Sum.inr (Sum.inr j))) = 1 := by
      rw [← map_one (Ideal.Quotient.mk _)]
      exact Ideal.Quotient.eq.mpr (Ideal.subset_span (Set.mem_insert_of_mem _ ⟨j, rfl⟩))
    simp only [SetLike.mem_coe, RingHom.mem_ker, RingHom.comp_apply, map_sub, map_mul, map_one,
      MvPolynomial.eval₂Hom_X', map_pow]
    rw [← mul_pow, ← map_mul, h, one_pow, sub_self]

/-- The transition map of the tower: each level-`m` coordinate goes to the `p`-th power
of the corresponding level-`m + 1` coordinate, and coefficients are fixed. -/
def transition (ρ : RootSystem R p π) (r s m : ℕ) : level ρ r s m →+* level ρ r s (m + 1) :=
  Ideal.Quotient.lift (chartIdeal R (ρ.root m) r s)
    ((Ideal.Quotient.mk (chartIdeal R (ρ.root (m + 1)) r s)).comp
      (MvPolynomial.eval₂Hom MvPolynomial.C fun v => MvPolynomial.X v ^ p))
    (fun _ ha => RingHom.mem_ker.mp (chartIdeal_le_ker ρ r s m ha))

lemma transition_coordinate (ρ : RootSystem R p π) (r s m : ℕ) (v : ChartVariables r s) :
    transition ρ r s m (Ideal.Quotient.mk _ (MvPolynomial.X v)) =
      Ideal.Quotient.mk _ (MvPolynomial.X v) ^ p := by
  simp [transition]

lemma transition_algebraMap (ρ : RootSystem R p π) (r s m : ℕ) (a : R) :
    transition ρ r s m (algebraMap R (level ρ r s m) a) =
      algebraMap R (level ρ r s (m + 1)) a := by
  change transition ρ r s m (Ideal.Quotient.mk _ (MvPolynomial.C a)) =
    Ideal.Quotient.mk _ (MvPolynomial.C a)
  simp [transition]

/-- The level-`m` monomial with numerators `e` is the level-`m + 1` monomial with
numerators `p e`: transition of indices represents the same monomial. -/
lemma transition_toMonomial (ρ : RootSystem R p π) (r s m : ℕ) (e : monomialExponents r s) :
    transition ρ r s m (Ideal.Quotient.mk _ (monomialExponents.toMonomial R e)) =
      Ideal.Quotient.mk _
        (monomialExponents.toMonomial R (monomialExponents.transition p e)) := by
  have hnat : ∀ b : ℤ, ((p : ℤ) * b).toNat = p * b.toNat := by
    intro b
    rcases le_total 0 b with hb | hb
    · rw [Int.toNat_mul (Int.natCast_nonneg p) hb, Int.toNat_natCast]
    · rw [Int.toNat_of_nonpos hb, Int.toNat_of_nonpos
        (mul_nonpos_of_nonneg_of_nonpos (Int.natCast_nonneg p) hb), mul_zero]
  simp only [monomialExponents.toMonomial, monomialExponents.transition, map_mul, map_prod,
    map_pow, transition_coordinate, ← pow_mul, ← mul_neg, hnat]

-- Semistable.rootTower.point
example (ρ : RootSystem R p π) (m : ℕ) : Nonempty (level ρ 0 0 m ≃ₐ[R] R) := by
  sorry

-- Semistable.rootTower.nonflat
-- Special fibre at the closed node: `k[S₀, S₁] / (S₀ S₁, S₀², S₁²)` has basis `1, S₀, S₁`.
example (k : Type*) [Field k] :
    Module.finrank k (ChartQuotient k (0 : k) 1 0 ⧸
      Ideal.span ({Ideal.Quotient.mk (chartIdeal k 0 1 0) (MvPolynomial.X (Sum.inl 0)) ^ 2,
        Ideal.Quotient.mk (chartIdeal k 0 1 0) (MvPolynomial.X (Sum.inl 1)) ^ 2} :
          Set (ChartQuotient k (0 : k) 1 0))) = 3 := by
  sorry

-- Semistable.rootTower.nonflat
-- The same algebra as the fibre of the level-`1` chart over the closed node of level `0`.
example (k : Type*) [Field k] (ρ : RootSystem k 2 (0 : k)) :
    Module.finrank k (level ρ 1 0 1 ⧸
      Ideal.map (transition ρ 1 0 0)
        (Ideal.span ({Ideal.Quotient.mk _ (MvPolynomial.X (Sum.inl 0)),
          Ideal.Quotient.mk _ (MvPolynomial.X (Sum.inl 1))} : Set (level ρ 1 0 0)))) = 3 := by
  sorry

-- Semistable.rootTower.nonflat
-- Generic fibre: over a field with `π ≠ 0` the level-`1` chart is free of rank `2`.
example (K : Type*) [Field K] (c : K) (hc : c ≠ 0) (ρ : RootSystem K 2 c) :
    letI : Algebra (level ρ 1 0 0) (level ρ 1 0 1) := (transition ρ 1 0 0).toAlgebra
    Module.Free (level ρ 1 0 0) (level ρ 1 0 1) ∧
      Module.finrank (level ρ 1 0 0) (level ρ 1 0 1) = 2 := by
  sorry

-- Semistable.rootTower.nonflat
-- Over a domain in which `π` is a nonzero nonunit the transition map is not flat.
example (A : Type*) [CommRing A] [IsDomain A] (c : A) (hc₀ : c ≠ 0) (hc : ¬IsUnit c)
    (ρ : RootSystem A 2 c) :
    letI : Algebra (level ρ 1 0 0) (level ρ 1 0 1) := (transition ρ 1 0 0).toAlgebra
    ¬Module.Flat (level ρ 1 0 0) (level ρ 1 0 1) := by
  sorry
end rootTower
end Semistable

namespace CohomologicalBK
variable {R : Type*} [CommRing R]

/-- The concrete power-series component of the normalization.
The R07.4 coefficient ring is imported; no new period-ring carrier is introduced. -/
def coefficientNormalization (p : ℕ) (hp : p ≠ 0) (F : R →+* R) :
    PowerSeries R →+* PowerSeries R :=
  (PowerSeries.substAlgHom (PowerSeries.HasSubst.X_pow hp)).toRingHom.comp
    (PowerSeries.map F)

def normalizedResidue (F : R →+* R) : PowerSeries R →+* R :=
  F.comp (PowerSeries.constantCoeff (R := R))

namespace coefficientNormalization

lemma frobenius (p : ℕ) (hp : p ≠ 0) (F : R →+* R) (a : R) :
    coefficientNormalization p hp F (PowerSeries.C a) = PowerSeries.C (F a) ∧
    coefficientNormalization p hp F PowerSeries.X = PowerSeries.X ^ p ∧
    ∀ (f : PowerSeries R) (n : ℕ),
      PowerSeries.coeff n (coefficientNormalization p hp F f) =
        if p ∣ n then F (PowerSeries.coeff (n / p) f) else 0 := by
  refine ⟨?_, ?_, ?_⟩
  · show (PowerSeries.substAlgHom (PowerSeries.HasSubst.X_pow hp))
      (PowerSeries.map F (PowerSeries.C a)) = _
    rw [PowerSeries.map_C, PowerSeries.coe_substAlgHom, PowerSeries.subst_C]; rfl
  · show (PowerSeries.substAlgHom (PowerSeries.HasSubst.X_pow hp))
      (PowerSeries.map F PowerSeries.X) = _
    rw [PowerSeries.map_X, PowerSeries.substAlgHom_X]
  · intro f n
    show PowerSeries.coeff n ((PowerSeries.substAlgHom (PowerSeries.HasSubst.X_pow hp))
      (PowerSeries.map F f)) = _
    rw [PowerSeries.coe_substAlgHom, PowerSeries.coeff_subst_X_pow hp]
    simp

lemma crystalline (p : ℕ) (hp : p ≠ 0) (F : R →+* R) (a : R) :
    normalizedResidue F (PowerSeries.C a) = F a ∧
    normalizedResidue F PowerSeries.X = 0 ∧
    (normalizedResidue F).comp (coefficientNormalization p hp F) =
      F.comp (normalizedResidue F) := by
  refine ⟨by simp [normalizedResidue], by simp [normalizedResidue], ?_⟩
  ext f
  have h := (frobenius p hp F 0).2.2 f 0
  rw [ite_eq_left (dvd_zero p), Nat.zero_div, PowerSeries.coeff_zero_eq_constantCoeff_apply,
    PowerSeries.coeff_zero_eq_constantCoeff_apply] at h
  simp [normalizedResidue, h]

-- CohomologicalBK.coefficientNormalization.variable
example : coefficientNormalization 2 (by decide) (RingHom.id ℤ) PowerSeries.X =
    (PowerSeries.X : PowerSeries ℤ) ^ 2 :=
  (frobenius 2 (by decide) (RingHom.id ℤ) 0).2.1

-- CohomologicalBK.coefficientNormalization.twisted_constant
example (F : R →+* R) (a : R) : normalizedResidue F (PowerSeries.C a) = F a :=
  (crystalline 1 one_ne_zero F a).1

-- CohomologicalBK.coefficientNormalization.constant_identity
example : normalizedResidue (RingHom.id R) = PowerSeries.constantCoeff (R := R) :=
  RingHom.id_comp _

-- CohomologicalBK.coefficientNormalization.nonsurjective
example : ¬Function.Surjective
    (coefficientNormalization 2 (by decide) (RingHom.id ℤ)) := by
  intro h
  obtain ⟨f, hf⟩ := h PowerSeries.X
  have h₁ := (frobenius 2 (by decide) (RingHom.id ℤ) 0).2.2 f 1
  rw [hf] at h₁
  simp at h₁

/-! The θ-squares. Here `O` plays `O_C`, `WittVector p (PreTilt O p)` is `A_inf`,
`WittVector.fontaineTheta O p` is Fontaine's `θ`, `PowerSeries (WittVector p k)` is `𝔖`,
`ϖ` is `π^♭` and `PreTilt.untilt ϖ` is `π`. The hypothesis `IsNilpotent (PreTilt.coeff 0 ϖ)`
says that `π` is nilpotent modulo `p`, that is, topologically nilpotent. The coefficient
ring `k` is any commutative ring; in the application it is the perfect residue field. -/
section Theta

/-- The map `g : 𝔖 → A_inf` that is `WittVector.map ι` on coefficients and sends `u` to the
Teichmüller lift `[π^♭]`. Its construction evaluates a power series at `[π^♭]`, which
converges for the `(p, [π^♭])`-adic topology of `A_inf`; the pinned Mathlib has no topology
on Witt vectors of a tilt, so the body is not written. Under the nilpotence hypothesis it
exists and is the only ring homomorphism with the two values below (`g_unique`); without
that hypothesis no such homomorphism need exist (for `ϖ = 1` the unit `1 - u` would map
to `0`). When `O` is the ring of integers of a perfectoid field and `π^♭` is topologically
nilpotent it is the unique continuous such map. -/
def g (p : ℕ) [Fact p.Prime] {k : Type*} [CommRing k] (O : Type*) [CommRing O]
    [Fact ¬IsUnit (p : O)] (ι : k →+* PreTilt O p) (ϖ : PreTilt O p)
    (hϖ : IsNilpotent (PreTilt.coeff 0 ϖ)) :
    PowerSeries (WittVector p k) →+* WittVector p (PreTilt O p) :=
  sorry

/-- The map `θ̃_𝔖 : 𝔖 → O` that is the structure map on coefficients and sends `u` to
`π`. Its construction evaluates a power series at `π`, which converges `p`-adically; `O`
carries no topology in the pinned Mathlib, so the body is not written. Under the
nilpotence hypothesis it exists and is the only ring homomorphism with the two values
below (`thetaTilde𝔖_unique`). -/
def thetaTilde𝔖 (p : ℕ) [Fact p.Prime] {k : Type*} [CommRing k] (O : Type*) [CommRing O]
    [Fact ¬IsUnit (p : O)] [IsAdicComplete (Ideal.span ({(p : O)} : Set O)) O]
    [Algebra (WittVector p k) O] (ϖ : PreTilt O p) (hϖ : IsNilpotent (PreTilt.coeff 0 ϖ)) :
    PowerSeries (WittVector p k) →+* O :=
  sorry

variable {p : ℕ} [Fact p.Prime] {k : Type*} [CommRing k]
  {O : Type*} [CommRing O] [Fact ¬IsUnit (p : O)]
  (ι : k →+* PreTilt O p) (ϖ : PreTilt O p) (hϖ : IsNilpotent (PreTilt.coeff 0 ϖ))

lemma g_C (a : WittVector p k) :
    g p O ι ϖ hϖ (PowerSeries.C a) = WittVector.map ι a := by
  sorry

lemma g_X : g p O ι ϖ hϖ PowerSeries.X = WittVector.teichmuller p ϖ := by
  sorry

lemma g_unique (Φ : PowerSeries (WittVector p k) →+* WittVector p (PreTilt O p))
    (hC : ∀ a : WittVector p k, Φ (PowerSeries.C a) = WittVector.map ι a)
    (hX : Φ PowerSeries.X = WittVector.teichmuller p ϖ) : Φ = g p O ι ϖ hϖ := by
  sorry

variable (p O) in
/-- The packet's `f = g ∘ φ_𝔖`: Witt Frobenius on coefficients and `u ↦ [π^♭] ^ p`. -/
def f (ι : k →+* PreTilt O p) (ϖ : PreTilt O p) (hϖ : IsNilpotent (PreTilt.coeff 0 ϖ)) :
    PowerSeries (WittVector p k) →+* WittVector p (PreTilt O p) :=
  (g p O ι ϖ hϖ).comp
    (coefficientNormalization p (Fact.out : p.Prime).ne_zero
      (WittVector.frobenius : WittVector p k →+* WittVector p k))

lemma f_C (a : WittVector p k) :
    f p O ι ϖ hϖ (PowerSeries.C a) = WittVector.map ι (WittVector.frobenius a) := by
  rw [f, RingHom.comp_apply, (frobenius p _ _ a).1, g_C]

lemma f_X : f p O ι ϖ hϖ PowerSeries.X = WittVector.teichmuller p ϖ ^ p := by
  rw [f, RingHom.comp_apply, (frobenius p _ _ (0 : WittVector p k)).2.1, map_pow, g_X]

variable [IsAdicComplete (Ideal.span ({(p : O)} : Set O)) O]

variable (p O) in
/-- `θ̃_A = θ ∘ φ_A⁻¹` on `A_inf`. -/
def thetaTildeA : WittVector p (PreTilt O p) →+* O :=
  (WittVector.fontaineTheta O p).comp
    ((WittVector.frobeniusEquiv p (PreTilt O p)).symm :
      WittVector p (PreTilt O p) →+* WittVector p (PreTilt O p))

/-- `θ̃_A ([π^♭] ^ p) = π`. This holds for every `ϖ`. -/
lemma thetaTildeA_teichmuller_pow :
    thetaTildeA p O (WittVector.teichmuller p ϖ ^ p) = PreTilt.untilt ϖ := by
  have h : WittVector.teichmuller p ϖ ^ p =
      WittVector.frobeniusEquiv p (PreTilt O p) (WittVector.teichmuller p ϖ) := by
    rw [← map_pow]
    simp [WittVector.frobeniusEquiv_apply, WittVector.frobenius_eq_map_frobenius,
      WittVector.map_teichmuller, frobenius_def]
  rw [h]
  simp only [thetaTildeA, RingHom.comp_apply, RingHom.coe_coe, RingEquiv.symm_apply_apply,
    WittVector.fontaineTheta_teichmuller]

/-! The values of the two squares on the generators `C a` and `u`. These use only `g_C`
and `g_X`, so they hold for every ring homomorphism with those two values. -/

lemma thetaTildeA_f_X :
    thetaTildeA p O (f p O ι ϖ hϖ PowerSeries.X) = PreTilt.untilt ϖ := by
  rw [f_X]
  exact thetaTildeA_teichmuller_pow ϖ

lemma fontaineTheta_f_X :
    WittVector.fontaineTheta O p (f p O ι ϖ hϖ PowerSeries.X) = PreTilt.untilt ϖ ^ p := by
  rw [f_X, map_pow, WittVector.fontaineTheta_teichmuller]

variable [Algebra (WittVector p k) O]

lemma thetaTilde𝔖_C (a : WittVector p k) :
    thetaTilde𝔖 p O ϖ hϖ (PowerSeries.C a) = algebraMap (WittVector p k) O a := by
  sorry

lemma thetaTilde𝔖_X :
    thetaTilde𝔖 (k := k) p O ϖ hϖ PowerSeries.X = PreTilt.untilt ϖ := by
  sorry

lemma thetaTilde𝔖_unique (Ψ : PowerSeries (WittVector p k) →+* O)
    (hC : ∀ a : WittVector p k, Ψ (PowerSeries.C a) = algebraMap (WittVector p k) O a)
    (hX : Ψ PowerSeries.X = PreTilt.untilt ϖ) : Ψ = thetaTilde𝔖 p O ϖ hϖ := by
  sorry

variable (p O) in
/-- `θ_𝔖 = θ̃_𝔖 ∘ φ_𝔖`: Witt Frobenius on coefficients and `u ↦ π ^ p`. -/
def theta𝔖 (ϖ : PreTilt O p) (hϖ : IsNilpotent (PreTilt.coeff 0 ϖ)) :
    PowerSeries (WittVector p k) →+* O :=
  (thetaTilde𝔖 p O ϖ hϖ).comp
    (coefficientNormalization p (Fact.out : p.Prime).ne_zero
      (WittVector.frobenius : WittVector p k →+* WittVector p k))

lemma theta𝔖_C (a : WittVector p k) :
    theta𝔖 p O ϖ hϖ (PowerSeries.C a) =
      algebraMap (WittVector p k) O (WittVector.frobenius a) := by
  rw [theta𝔖, RingHom.comp_apply, (frobenius p _ _ a).1, thetaTilde𝔖_C]

lemma theta𝔖_X :
    theta𝔖 (k := k) p O ϖ hϖ PowerSeries.X = PreTilt.untilt ϖ ^ p := by
  rw [theta𝔖, RingHom.comp_apply, (frobenius p _ _ (0 : WittVector p k)).2.1, map_pow,
    thetaTilde𝔖_X]

/-- `θ̃_A (W(ι) (φ a))` is the structure map at `a`. The hypothesis `hι` says that `ι` is
the map on tilts induced by the structure map: `θ ∘ W(ι)` is `W(k) → O`. -/
lemma thetaTildeA_map_frobenius
    (hι : (WittVector.fontaineTheta O p).comp (WittVector.map ι) =
      algebraMap (WittVector p k) O) (a : WittVector p k) :
    thetaTildeA p O (WittVector.map ι (WittVector.frobenius a)) =
      algebraMap (WittVector p k) O a := by
  have h : WittVector.map ι (WittVector.frobenius a) =
      WittVector.frobeniusEquiv p (PreTilt O p) (WittVector.map ι a) := by
    ext n
    simp_rw [WittVector.frobeniusEquiv_apply, WittVector.map_coeff, WittVector.coeff_frobenius,
      MvPolynomial.map_aeval, funext (WittVector.map_coeff ι _),
      RingHom.ext_int _ (algebraMap ℤ (PreTilt O p)), MvPolynomial.aeval_eq_eval₂Hom]
  rw [h, ← hι]
  simp only [thetaTildeA, RingHom.comp_apply, RingHom.coe_coe, RingEquiv.symm_apply_apply]

lemma thetaTildeA_f_C
    (hι : (WittVector.fontaineTheta O p).comp (WittVector.map ι) =
      algebraMap (WittVector p k) O) (a : WittVector p k) :
    thetaTildeA p O (f p O ι ϖ hϖ (PowerSeries.C a)) = algebraMap (WittVector p k) O a := by
  rw [f_C]
  exact thetaTildeA_map_frobenius ι hι a

lemma fontaineTheta_f_C
    (hι : (WittVector.fontaineTheta O p).comp (WittVector.map ι) =
      algebraMap (WittVector p k) O) (a : WittVector p k) :
    WittVector.fontaineTheta O p (f p O ι ϖ hϖ (PowerSeries.C a)) =
      algebraMap (WittVector p k) O (WittVector.frobenius a) := by
  rw [f_C, ← hι]
  rfl

/-- The untwisted square: `θ ∘ g = θ̃_𝔖`. -/
lemma fontaineTheta_comp_g
    (hι : (WittVector.fontaineTheta O p).comp (WittVector.map ι) =
      algebraMap (WittVector p k) O) :
    (WittVector.fontaineTheta O p).comp (g p O ι ϖ hϖ) = thetaTilde𝔖 p O ϖ hϖ :=
  thetaTilde𝔖_unique ϖ hϖ _
    (fun a => by rw [RingHom.comp_apply, g_C, ← hι]; rfl)
    (by rw [RingHom.comp_apply, g_X, WittVector.fontaineTheta_teichmuller])

/-- The two θ-squares: `θ̃_A ∘ f = θ̃_𝔖` and `θ_A ∘ f = θ_𝔖`. -/
lemma theta
    (hι : (WittVector.fontaineTheta O p).comp (WittVector.map ι) =
      algebraMap (WittVector p k) O) :
    (thetaTildeA p O).comp (f p O ι ϖ hϖ) = thetaTilde𝔖 p O ϖ hϖ ∧
    (WittVector.fontaineTheta O p).comp (f p O ι ϖ hϖ) = theta𝔖 p O ϖ hϖ := by
  refine ⟨thetaTilde𝔖_unique ϖ hϖ _ (fun a => thetaTildeA_f_C ι ϖ hϖ hι a)
    (thetaTildeA_f_X ι ϖ hϖ), ?_⟩
  rw [f, ← RingHom.comp_assoc, fontaineTheta_comp_g ι ϖ hϖ hι, theta𝔖]

/-- The membership half of the packet's `eisenstein`: a polynomial over `W(k)` vanishing
at `π` is sent by `g` into `ker θ` and by `f` into `ker θ̃_A`. That these images generate
the kernels is not stated here. -/
lemma eisenstein_mem
    (hι : (WittVector.fontaineTheta O p).comp (WittVector.map ι) =
      algebraMap (WittVector p k) O)
    (E : Polynomial (WittVector p k)) (hE : Polynomial.aeval (PreTilt.untilt ϖ) E = 0) :
    g p O ι ϖ hϖ (E : PowerSeries (WittVector p k)) ∈
      RingHom.ker (WittVector.fontaineTheta O p) ∧
    f p O ι ϖ hϖ (E : PowerSeries (WittVector p k)) ∈ RingHom.ker (thetaTildeA p O) := by
  have h : (thetaTilde𝔖 p O ϖ hϖ).comp Polynomial.coeToPowerSeries.ringHom =
      (Polynomial.aeval (R := WittVector p k) (PreTilt.untilt ϖ)).toRingHom :=
    Polynomial.ringHom_ext (fun a => by simp [thetaTilde𝔖_C]) (by simp [thetaTilde𝔖_X])
  have key : thetaTilde𝔖 p O ϖ hϖ (E : PowerSeries (WittVector p k)) = 0 := by
    have := RingHom.congr_fun h E
    simpa [hE] using this
  have h₁ := RingHom.congr_fun (fontaineTheta_comp_g ι ϖ hϖ hι) (E : PowerSeries (WittVector p k))
  have h₂ := RingHom.congr_fun (theta ι ϖ hϖ hι).1 (E : PowerSeries (WittVector p k))
  rw [RingHom.comp_apply] at h₁ h₂
  exact ⟨by rw [RingHom.mem_ker, h₁, key], by rw [RingHom.mem_ker, h₂, key]⟩

end Theta
end coefficientNormalization

/-- The exact Mathlib Witt Frobenius is used in the normalized residue. -/
def normalizedWittResidue (p : ℕ) (k : Type*) [CommRing k] [Fact p.Prime] :
    PowerSeries (WittVector p k) →+* WittVector p k :=
  normalizedResidue (WittVector.frobenius : WittVector p k →+* WittVector p k)

section RamifiedExample

variable (p : ℕ) [Fact p.Prime]

/-- `ℤ_p[π] / (π ^ p - p)`, the ring of integers of `ℚ_p(p^{1/p})`, with `π` the root. -/
local notation "OK" => AdjoinRoot (Polynomial.X ^ p - Polynomial.C (p : ℤ_[p]) : Polynomial ℤ_[p])

-- The scalar-extension length calculation behind the torsion constraint.
-- In `O_K` one has `π ^ p = p`.
example : (AdjoinRoot.root _ : OK) ^ p = (p : OK) := by
  have h := AdjoinRoot.eval₂_root (Polynomial.X ^ p - Polynomial.C (p : ℤ_[p]) : Polynomial ℤ_[p])
  simpa [sub_eq_zero] using h

-- The scalar-extension length calculation behind the torsion constraint.
-- `O_K / (π ^ n)` has length `n`.
example (n : ℕ) :
    Module.length OK (OK ⧸ Ideal.span ({AdjoinRoot.root _ ^ n} : Set OK)) = n := by
  sorry

-- The scalar-extension length calculation behind the torsion constraint.
-- `ℤ_p / (p ^ a)` extends to `O_K / (p ^ a)`, which has length `p * a`.
example (a : ℕ) :
    Module.length OK (OK ⧸ Ideal.span ({(p : OK) ^ a} : Set OK)) = (p * a : ℕ) := by
  sorry

-- CohomologicalBK.nygaardNonDescent: the algebraic core of its example.
-- For every `c` in `ℤ_p` the element `c + π` is not in the image of `ℤ_p`.
example (c : ℤ_[p]) :
    algebraMap ℤ_[p] OK c + AdjoinRoot.root _ ∉ (algebraMap ℤ_[p] OK).range := by
  sorry

end RamifiedExample
end CohomologicalBK

namespace MonodromyTest
/-- This is a concrete algebra test for CR.6's normalization, not a geometric H¹ model. -/
def F (p : ℕ) : Matrix (Fin 2) (Fin 2) ℚ := !![1, 0; 0, p]
def N : Matrix (Fin 2) (Fin 2) ℚ := !![0, 1; 0, 0]

-- Semistable.hyodoKatoInterface: orientation test for Nφ = pφN.
example (p : ℕ) : N * F p = (p : ℚ) • (F p * N) := by
  ext i j; fin_cases i <;> fin_cases j <;> simp [N, F, Matrix.mul_apply, Fin.sum_univ_two]

example : N ≠ 0 := by
  intro h; have := congrFun (congrFun h 0) 1; simp [N] at this

example : N * N = 0 := by
  ext i j; fin_cases i <;> fin_cases j <;> simp [N, Matrix.mul_apply, Fin.sum_univ_two]
end MonodromyTest

end TauCeti.AInfBlueprint

/-!
NAMED INVENTORY — every declaration of the packet, under the name the packet gives it.

The entries below are mathematical specifications, not Lean declarations. An entry marked
"not typed" has no declaration in this file: its statement, API items and tests need the
formal schemes, sites, sheaves and derived categories of the supplier roadmaps, which have no
types at the pinned baseline. An entry marked "typed above" or "typed in part above" has the
declarations named in its "Typed part" line; an API item or test of such an entry is marked
(typed) when it is a declaration or a labelled example above, and is otherwise only named here.
No conclusion of a theorem is taken as input data anywhere in this file.

AInfCohomology:AI.6/chart-ring
Semistable.chartRing — definition, typed above
Statement: For a commutative ring R, π∈R and integers r,s≥0, let P=R[T₀,…,Tᵣ,Y₁,Z₁,…,Yₛ,Zₛ]. Let J be generated by ∏Tᵢ−π and YⱼZⱼ−1. The algebraic chart Q=P/J and its ordinary p-adic completion R□=AdicCompletion((p),Q) give the restricted-power-series chart. In CK use R=O_C and π=p^q, q∈Q>0; the torus coordinates are Yⱼ. The construction here is this chart, not a general formal scheme.
Typed part: the polynomial chart quotient, its p-adic completion, the coordinates, branch_relation, torus_inverse, reduction, and the universal property in three statements: lift for the quotient Q; liftCompletion for the completion with target any ring that is complete and separated for the ideal generated by p, with uniqueness among all ring homomorphisms; and liftCompletionOfFamily for an ideal I of B containing the image of p and a compatible family of ring maps Q→B/I^n, with target AdicCompletion(I,B) and compatibility with the projections evalₐ. The tests nodal, unit_coordinate and point are typed; for unit_coordinate only the identity in the completion is a statement, its reduction modulo p being an instance of reduction. The test restricted is typed for R=ℤ_p, π=p, r=1, s=0 as four statements: 1−T₀ is not a unit of the chart ring; reduction at level 1 is surjective and its kernel is generated by p; the chart ring modulo p is isomorphic to F_p[T₀,T₁]/(T₀T₁) by an isomorphism sending coordinates to coordinates; and 1−T₀ is a unit in the completion of the chart quotient along (p,T₀,T₁). Absent: the identification with the restricted power series presentation of CK (1.5.1), with its p-torsion-freeness, and the specialization to R=O_C, π=p^q, which use supplier types.
API Semistable.chartRing.branch_relation [relation] (typed): In the completion, ∏ᵢTᵢ equals the image of π.
API Semistable.chartRing.torus_inverse [simp] (typed): The images of Yⱼ and Zⱼ multiply to 1.
API Semistable.chartRing.reduction [compatibility] (typed): Projection to level n sends a polynomial class to its class in Q/(p)^n, agreeing with AdicCompletion.evalₐ and Ideal.Quotient.mk.
API Semistable.chartRing.lift [universal-property] (typed): A ring map R→B and branch/torus values satisfying the relations induce a unique map Q→B. If moreover I⊂B is an ideal containing the image of p, a compatible family of ring maps Q→B/I^n induces a unique ring map from AdicCompletion((p),Q) to lim_n B/I^n compatible with the projections evalₐ.
example Semistable.chartRing.nodal [computation] (typed): For r=1,s=0, T₀T₁=π in R□.
example Semistable.chartRing.unit_coordinate [computation] (typed): For s=1, Y₁Z₁=1, including after reduction modulo p.
example Semistable.chartRing.point [degenerate] (typed): For r=s=0, Q≃R by T₀↦π, and R□≃AdicCompletion((p),R).
example Semistable.chartRing.restricted [non-example] (typed): For R=Z_p, π=p, r=1, s=0: evalₐ at level 1 induces R□/pR□≅F_p[T₀,T₁]/(T₀T₁), and 1−T₀ is not a unit of R□ (its image in F_p[T₀,T₁]/(T₀T₁,T₁)=F_p[T₀] is not a unit). In the completion along (p,T₀,T₁) it would be a unit.
Prerequisites: mathlib:MvPolynomial, mathlib:Ideal.Quotient.mk, mathlib:AdicCompletion, mathlib:AdicCompletion.evalₐ, mathlib:AdicCompletion.evalₐ_of, mathlib:AdicCompletion.liftRingHom, mathlib:IsAdicComplete.liftRingHom, mathlib:AdicCompletion.isAdicComplete

AInfCohomology:AI.6/divisorial-log
Semistable.divisorialLog — construction, not typed
Statement: For a CK formal model 𝔛, take the associated log structure of O_𝔛,ét∩(O_𝔛,ét[1/p])×→O_𝔛,ét; the base prelog monoid is O_C∖{0}. On a chart it is the pushout of ℕ^{r+1} along the diagonal ℕ→ℕ^{r+1} and 1↦p^q in O_C∖{0}. It is quasi-coherent and integral; the base need not be fine. Every local section of the log structure becomes a unit after inverting p.
API Semistable.divisorialLog.chart [characterisation]: The associated chart is ℕ^{r+1}⊔_ℕ(O_C∖{0}) with the displayed maps.
API Semistable.divisorialLog.pullback [functoriality]: Strict étale chart pullback agrees with the divisorial log structure, and composes under refinement.
API Semistable.divisorialLog.generic [compatibility]: Every local section of the log structure is invertible in O_𝔛,ét[1/p]; for the algebraic model U of CK Claim 1.6.1 the locus of triviality of the log structure is U[1/p].
example Semistable.divisorialLog.node [computation]: At the closed node of T₀T₁=p^q the stalk of M/O^× is ℕ²⊔_ℕℚ≥0 (classes e₀, e₁ of T₀, T₁ and the value monoid ℚ≥0 of O_C∖{0}, with e₀+e₁=q), and its quotient by the image of the base monoid ℚ≥0 is ℕ²/ℕ(1,1)≅ℤ via (a,b)↦a−b.
example Semistable.divisorialLog.smooth [compatibility]: At r=0 (t₀=p^q, R□≅O_C{t₁^{±1},…,t_d^{±1}}) the chart monoid is ℕ⊔_ℕ(O_C∖{0})=O_C∖{0}, the map to Spf O_C is strict, and the relative log differentials are the ordinary differentials, free on dt₁/t₁,…,dt_d/t_d.
example Semistable.divisorialLog.nonfine [non-example]: The base chart O_C∖{0} has value monoid Q≥0 in the CK setup, which is not finitely generated; no fine hypothesis is asserted for this chart.
Prerequisites: AInfCohomology:AI.6/chart-ring, CrystallineCohomology:CR.5:log-algebra

AInfCohomology:AI.6/root-tower
Semistable.rootTower — construction, typed in part above
Statement: Given an étale morphism Spf(R)→Spf(R□) of p-adic formal schemes, form R_m by base change from the chart adjoining p^m-th roots of every branch and invertible coordinate and imposing ∏Tᵢ^{1/p^m}=p^{q/p^m}. Set R_∞ to the p-adic completion of colim_mR_m. Its generic fibre is an affinoid perfectoid pro-(finite étale) cover with group Δ={(ε₀,…,ε_d)∈(lim_m μ_{p^m}(O_C))^{d+1}:∏_{i=0}^rεᵢ=1}≃Z_p^d; R_∞ is integral perfectoid.
Typed part: rootTower.RootSystem (a compatible system of p-power roots of π), the uncompleted level-m chart rootTower.level (the chart quotient with π replaced by its p^m-th root), the transition map rootTower.transition with transition_coordinate, transition_algebraMap and transition_toMonomial (the level-m monomial of an index is the level-(m+1) monomial of its transition), the point test, and the nonflat test as four statements: the closed-node fibre has dimension 3 (stated for the explicit algebra and for the fibre of the transition map), the level-1 chart is free of rank 2 over the level-0 chart over a field with π≠0, and the transition map is not flat over a domain in which π is a nonzero nonunit. Absent: the étale base change R□→R, the colimit and its p-adic completion R_∞, the group Δ and its action (action, node_action), generic_finite_etale, and the perfectoid and pro-étale statements (perfectoid), which use supplier types.
API Semistable.rootTower.transition [data] (typed): Level m embeds into level m+1 by sending each root to the p-th power of the next root.
API Semistable.rootTower.action [structure]: The continuous Δ-action scales each compatible root t_j^{1/p^m} by the μ_{p^m}-component of ε_j and preserves the branch-product relation because ε₀⋯εᵣ=1. Δ is topologically freely generated by δᵢ=(ε⁻¹,1,…,1,ε,1,…,1) (entries 0 and i) for 1≤i≤r and δᵢ=(1,…,1,ε,1,…,1) (entry i) for r<i≤d.
API Semistable.rootTower.perfectoid [compatibility]: R_∞ is p-torsion-free, p-adically complete and integral perfectoid (Frobenius R_∞/p^{1/p}→R_∞/p is bijective), and the tower lim Spa(R_m[1/p],R_m) is a finite-étale tower over the adic generic fibre, hence a covering in its pro-étale site, with group Δ.
API Semistable.rootTower.generic_finite_etale [characterisation]: For each m, R□_m[1/p] is the direct sum of R□[1/p]·t₁^{a₁}⋯t_d^{a_d} over a₁,…,a_d∈{0,1/p^m,…,(p^m−1)/p^m}; it is finite étale of degree p^{md} over R□[1/p], and R□_m is the ring of power-bounded elements of R□_m[1/p].
example Semistable.rootTower.node_action [computation]: For T₀T₁=p^q and the generator δ₁=(ε⁻¹,ε) of Δ, δ₁(T₀^{1/p^m})=ζ_{p^m}^{-1}T₀^{1/p^m} and δ₁(T₁^{1/p^m})=ζ_{p^m}T₁^{1/p^m}, where ζ_{p^m} is the p^m-th component of ε.
example Semistable.rootTower.point [degenerate] (typed): For r=s=0 the tower is O_C with trivial Δ.
example Semistable.rootTower.nonflat [non-example] (typed): For the nodal chart at p=2,m=1, the generic root cover has rank 2 but its closed-node special-fibre algebra has basis 1,a,b and length 3 (a²=b²=ab=0); the integral map is not flat.
Prerequisites: AInfCohomology:AI.6/chart-ring, AInfCohomology:AI.6/monomial-exponents, AInfCohomology:AI.3, PerfectoidSpaces:P4/integral-perfectoid-criterion-for-annuli, AdicEtaleGeometry:A1/pro-etale-site-corrected

AInfCohomology:AI.6/monomial-exponents
Semistable.monomialExponents — definition, typed above
Statement: At root level m, an index consists of a∈ℕ^{r+1}, b∈ℤ^s and a branch j with a_j=0, modulo equality of a and b (the witness j is not extra data). It represents ∏Tᵢ^{aᵢ/p^m}∏Yⱼ^{bⱼ/p^m}. Normalize an arbitrary a by subtracting min_i a_i; the removed factor is p^{q·min(a)/p^m}. The index is integral precisely when p^m divides every a_i and b_j. Level-m and level-(m+1) indices are identified by (a,b)↦(pa,pb); the union over m is the index set of CK (3.2.1), namely (Z[1/p]≥0)^{r+1}⊕Z[1/p]^{d−r} with a_j=0 for some branch j (s=d−r).
Typed part: the index type with the zero branch exponent as a property, minimum, normalize, normalized, the divisibility predicate isIntegral, and integral (an index is integral at level m exactly when it is p^m times a normalized index). Typed for transition: the map (a,b)↦(pa,pb) on indices, transition_injective and isIntegral_transition for p≠0, normalize_smul (scaling by p commutes with normalization), and rootTower.transition_toMonomial for the clause that it represents the same monomial. Typed for level: the exact level as the least m′ such that p^{m−m′} divides every numerator, with level_le, level_le_iff, isIntegral_iff_level_eq_zero and, for p≠0, level_transition. Typed for weight: the integer Δ-weights indexed as logWeight, with weight_transition, weight_eq_sum (the weights are the exponents paired with logWeight), isIntegral_iff_weight, level_le_iff_weight and exists_weight_not_dvd, and toMonomial, the polynomial monomial of an index with numerators taken at level 0, a negative torus exponent being carried by the inverse coordinate. The tests node, point, fractional_torus and level_weight are typed. Absent: the monomial ∏Tᵢ^{aᵢ/p^m}∏Yⱼ^{bⱼ/p^m} in the completed tower R_∞ and the removed coefficient p^{q·min(a)/p^m}; the scaling of a monomial by ε^{w_j/p^m} under the generator δ_j of Δ; and the identification of the union over m with the index set of CK (3.2.1). These use the completed tower and Δ.
API Semistable.monomialExponents.normalize [constructor] (typed): Normalization sends a to a−min(a) coordinatewise and records min(a).
API Semistable.monomialExponents.normalized [characterisation] (typed): A branch exponent is normalized iff at least one coordinate is zero; normalize fixes such tuples.
API Semistable.monomialExponents.integral [characterisation] (typed): At level m integrality means simultaneous divisibility by p^m of branch and signed torus numerators.
API Semistable.monomialExponents.transition [functoriality] (typed): (a,b)↦(pa,pb) maps level-m indices to level-(m+1) indices, preserves normalization and integrality, and represents the same monomial.
API Semistable.monomialExponents.level [data] (typed): The exact level of a level-m index is the least m′≤m such that p^{m−m′} divides every a_i and b_j; the index is integral iff its exact level is 0, and the exact level is unchanged by transition.
API Semistable.monomialExponents.weight [data] (typed): The Δ-weights of a level-m index are w_j=a_j−a₀ for 1≤j≤r and w_j=b_j for the torus directions (CK (3.19.3), in units of 1/p^m); the generator δ_j of Δ scales the monomial by ε^{w_j/p^m}. The exact level is also the least m′≤m such that p^{m−m′} divides every w_j; in particular a nonintegral index has a weight not divisible by p^m.
example Semistable.monomialExponents.node [computation] (typed): normalize(2,3)=(0,1) and the removed minimum is 2.
example Semistable.monomialExponents.point [degenerate] (typed): For r=s=0 the sole normalized branch exponent is 0 and every level has only the integral index.
example Semistable.monomialExponents.fractional_torus [non-example] (typed): At p=2,m=1, branch tuple (0,2) and torus numerator −1 give a nonintegral index; ignoring negative torus exponents would give the wrong answer.
example Semistable.monomialExponents.level_weight [computation] (typed): For p=2, r=1, s=1: the level-1 index ((0,2),(4)) is the transition of the level-0 index ((0,1),(2)) and has exact level 0; the level-2 index ((0,2),(1)) has exact level 2 and weights (2,1); the level-1 index ((1,0),(0)) has weights (−1,0) and exact level 1.
Prerequisites: AInfCohomology:AI.6/chart-ring, mathlib:Finset.max'

AInfCohomology:AI.6/monomial-splitting
Semistable.monomialSplitting — theorem, not typed
Statement: The completed monomial expansion yields Δ-equivariant decompositions R_∞=R⊕M_∞ of R-modules and A_inf(R_∞)=A(R)⊕N_∞ of A(R)-modules, with integral indices in the first summand and nonintegral indices in the second; A(R) is the (p,μ)-complete lift of ainf-chart-lift. Modulo ξ the second decomposition reduces to the first, so N_∞/ξ≅M_∞. These are completed module decompositions, not a direct product of rings.
Prerequisites: AInfCohomology:AI.6/root-tower, AInfCohomology:AI.6/monomial-exponents, AInfCohomology:AI.6/ainf-chart-lift, AInfCohomology:AI.0:integral, AInfCohomology:AI.3

AInfCohomology:AI.6/ainf-chart-lift
Semistable.ainfChartLift — construction, not typed
Statement: Let A(R□)=A_inf{X₀,…,Xᵣ,X_{r+1}^{±1},…,X_d^{±1}}/(∏Xᵢ−[(p^{1/p∞})^q]), completed for (p,μ), with the surjection θ:A(R□)→R□, Xᵢ↦tᵢ. Using θ, lift the étale R□/p-algebra R/p uniquely to a (p,μ)-adically complete, formally étale A(R□)-algebra A(R). It has Frobenius Xᵢ↦Xᵢ^p and the integral Δ-action from the root tower, which is trivial modulo μ; reduction along θ is R.
API Semistable.ainfChartLift.theta [compatibility]: A(R)⊗̂_{A_inf,θ}O_C≃R, agreeing with the imported θ.
API Semistable.ainfChartLift.frobenius [simp]: φ(Xᵢ)=Xᵢ^p and φ acts by Witt Frobenius on coefficients.
API Semistable.ainfChartLift.etale [universal-property]: The lift A(R) of the étale R□/p-algebra R/p is unique up to unique isomorphism; for a map R→R′ of étale R□-algebras there is a unique compatible map A(R)→A(R′), and the Frobenius and the Δ-action of A(R) are the unique lifts of those of A(R□).
API Semistable.ainfChartLift.delta_monomial [simp]: (ε₀,…,ε_d)∈Δ sends Xⱼ to [εⱼ]Xⱼ; the action is continuous, A_inf-linear and commutes with φ.
API Semistable.ainfChartLift.delta_trivial_mod_mu [relation]: Δ acts trivially on A(R)/μ; for δ∈Δ the A_inf-linear map (δ−1)/μ:A(R)→A(R) is defined and δ=1+μ·(δ−1)/μ.
example Semistable.ainfChartLift.node [computation]: At r=1, X₀X₁=[(p^{1/p∞})^q] before θ-reduction.
example Semistable.ainfChartLift.point [degenerate]: At R=O_C the lift is A_inf.
example Semistable.ainfChartLift.theta_tilde [non-example]: θ(Xᵢ)=tᵢ, and the reduction map A(R□)→R□ is θ. The formula θ̃=θ∘φ_A⁻¹ of A_inf does not define a map on A(R□): the Frobenius of A(R□) is not surjective, since Xᵢ is not in its image for a torus coordinate, nor for a branch coordinate when r≥1. So the reduction cannot be relabelled θ̃.
example Semistable.ainfChartLift.delta_mod_mu [computation]: On the node chart, for δ₁=(ε⁻¹,ε): δ₁(X₁)−X₁=μ·X₁ and δ₁(X₀)−X₀=([ε]⁻¹−1)·X₀=−[ε]⁻¹·μ·X₀, both divisible by μ; so (δ₁−1)/μ sends X₁ to X₁ and X₀ to −[ε]⁻¹X₀.
Prerequisites: AInfCohomology:AI.6/chart-ring, AInfCohomology:AI.6/root-tower, AInfCohomology:AI.0:integral, AInfCohomology:AI.3

AInfCohomology:AI.6/structure-sheaf-edge
Semistable.structureSheafEdge — theorem, not typed
Statement: Let e: RΓ_cont(Δ,R_∞)→RΓ_proét(X_C^ad,Ô⁺) be the edge map of CK (3.3.1) for the Δ-cover of root-tower; by almost purity the maximal ideal m of O_C kills the cohomology of its cone. An O_C-module has no nonzero m-torsion if no nonzero element is annihilated by all of m. (a) For every i, ζ_p−1 kills H^i_cont(Δ,M_∞); for every b∈O_C, the O_C-modules R_∞/b and H^i_cont(Δ,R_∞/b) have no nonzero m-torsion (CK Proposition 3.8). (b) For every b∈O_C^♭∖{0}, R_∞^♭/b and H^i_cont(Δ,R_∞^♭/b) have no nonzero m^♭-torsion (CK Lemma 3.12). (c) Lη_{ζ_p−1}(e): Lη_{ζ_p−1}RΓ_cont(Δ,R_∞)→Lη_{ζ_p−1}RΓ_proét(X_C^ad,Ô⁺) is an isomorphism (CK Theorem 3.9). (d) The same holds for the edge map e′ of any pro-(finite étale) affinoid perfectoid Δ′-cover Spa(R′_∞[1/p],R′_∞)→X_C^ad that refines the Δ-cover compatibly with a continuous surjection Δ′→Δ of profinite groups (CK Remark 3.10).
Prerequisites: AInfCohomology:AI.6/root-tower, AInfCohomology:AI.6/monomial-exponents, AInfCohomology:AI.6/monomial-splitting, AInfCohomology:AI.3, AInfCohomology:AI.1, AInfCohomology:AI.1/decalage-cohomology

AInfCohomology:AI.6/nonintegral-annihilation
Semistable.nonintegralAnnihilation — theorem, not typed
Statement: For every i∈Z: (a) μ annihilates H^i_cont(Δ,N_∞) (CK Proposition 3.25); equivalently Lη_μ of the Koszul complex of N_∞ on δ₁−1,…,δ_d−1 vanishes. (b) H^i_cont(Δ,A_inf(R_∞)/μ) is p-torsion-free and p-adically complete, the natural maps H^i_cont(Δ,A_inf(R_∞)/μ)⊗_{A_inf}A_inf/p^n→H^i_cont(Δ,A_inf(R_∞)/(μ,p^n)) are isomorphisms for n>0, and H^i_cont(Δ,A_inf(R_∞)/(μ,p^n)) and H^i_cont(Δ,A_inf(R_∞)/μ) have no nonzero W(m^♭)-torsion (CK Proposition 3.19). (c) For n,m≥0, H^i_cont(Δ,N_m/(μ,p^n)) is killed by φ^{−m}(μ) and is a flat A_inf/(φ^{−m}(μ),p^n)-module (CK Corollary 3.23). Part (b) is the input of the integral edge comparison (CK Theorem 3.20); part (a) removes the nonintegral summand.
Prerequisites: AInfCohomology:AI.6/monomial-splitting, AInfCohomology:AI.6/monomial-exponents, AInfCohomology:AI.6/ainf-chart-lift, AInfCohomology:AI.6/structure-sheaf-edge, AInfCohomology:AI.3, AInfCohomology:AI.1, AInfCohomology:AI.1/preservation-derived-completeness

AInfCohomology:AI.6/local-edge
Semistable.localEdge — theorem, not typed
Statement: The edge map e of CK (3.15.1) induces an isomorphism Lη_μ(e): Lη_μRΓ_cont(Δ,A_inf(R_∞))≃Lη_μRΓ_proét((Spf R)_C^ad,A_inf,X) (CK Theorem 3.20). Moreover Lη_μRΓ_cont(Δ,A_inf(R_∞))≅Lη_μRΓ_cont(Δ,A(R)) is represented by the Koszul complex K_{A(R)}((δ₁−1)/μ,…,(δ_d−1)/μ). The comparison is compatible with refinement of the cover: for a continuous surjection Δ′→Δ of profinite groups and a pro-(finite étale) affinoid perfectoid Δ′-cover Spa(R′_∞[1/p],R′_∞) refining the Δ-cover compatibly, the edge map e′ also becomes an isomorphism after Lη_μ, and so does RΓ_cont(Δ,A_inf(R_∞))→RΓ_cont(Δ′,A_inf(R′_∞)) (CK Remark 3.21).
Prerequisites: AInfCohomology:AI.6/nonintegral-annihilation, AInfCohomology:AI.6/root-tower, AInfCohomology:AI.6/monomial-splitting, AInfCohomology:AI.6/ainf-chart-lift, AInfCohomology:AI.3, AInfCohomology:AI.1, AInfCohomology:AI.1/derived-decalage

AInfCohomology:AI.6/aomega
Semistable.aOmega — construction, not typed
Statement: For ν:X_C,proét^ad→𝔛_ét define AΩ_𝔛=Lη_μRν_*A_inf,X∈D^{≥0}(𝔛_ét,A_inf) in the imported monoidal derived sheaf category. The semistable extension uses the same integral sheaf and décalage as AI.3, now on the étale site of 𝔛 and the CK charts; the same formula with the Zariski site as target of ν defines AΩ_{𝔛_Zar}, the object used in BMS1. AΩ_𝔛 is a commutative algebra object of D(𝔛_ét,A_inf), contravariantly functorial for O_C-morphisms of formal schemes as in CK §1.5 and, semilinearly, for isomorphisms lying over a continuous automorphism of O_C (API item semilinear); RΓ_Ainf(𝔛)=RΓ(𝔛_ét,AΩ_𝔛), and AΩ_𝔛⊗^L A_inf[1/μ]≅Rν_*(A_inf,X)⊗^L A_inf[1/μ]. Its presheaf version AΩ^psh=Lη_μRν^psh_*A_inf,X, on the site 𝔛^psh_ét of connected affine étale opens admitting a coordinate map (1.5.1) with isomorphisms as coverings, satisfies φ⁻¹AΩ^psh≅AΩ_𝔛 and RΓ(𝔘,AΩ^psh)≅Lη_μRΓ_proét(𝔘_C^ad,A_inf,X), and is derived ξ-adically and ξ̃-adically complete. Derived ξ-completeness of the sheaf AΩ_𝔛 and AΩ^psh≅Rφ_*AΩ_𝔛 are not asserted here; they are aomega-sheaf-completeness.
API Semistable.aOmega.local [equivalence]: For 𝔘=Spf(R) in 𝔛^psh_ét, RΓ(𝔘,AΩ^psh)≅Lη_μRΓ_proét(𝔘_C^ad,A_inf,X) (CK (4.1.3)), which by local-edge is the Koszul complex K_{A(R)}((δ₁−1)/μ,…,(δ_d−1)/μ); the right side does not involve the framing. That RΓ(𝔘_ét,AΩ_𝔛) is the same complex is aomega-sheaf-completeness.
API Semistable.aOmega.functorial [functoriality]: An O_C-morphism 𝔛′→𝔛 of formal schemes as in CK §1.5 induces a pullback map on AΩ and on RΓ_Ainf, compatible with products and satisfying identity/composition.
API Semistable.aOmega.complete [structure]: AΩ^psh is derived ξ-adically and ξ̃-adically complete (CK §4.1); this is preservation of derived completeness by Lη sectionwise, in the topos of sets, not commutation of décalage and completion. Derived ξ-completeness of the sheaf AΩ_𝔛 is aomega-sheaf-completeness.
API Semistable.aOmega.smooth [compatibility]: For a chart with r=0 the local complex Lη_μRΓ_cont(Δ,A_inf(R_∞)) is the AI.3 toric complex with the same Δ, tower and coefficient maps. The global comparison of the étale-site AΩ_𝔛 with the Zariski-site AΩ_{𝔛_Zar} used in BMS1 is CK Corollary 4.21, in aomega-sheaf-completeness.
API Semistable.aOmega.psh [compatibility]: φ⁻¹(AΩ^psh)≅AΩ_𝔛 for the morphism of topoi φ from 𝔛_ét to 𝔛^psh_ét (CK (4.1.2)).
API Semistable.aOmega.invert_mu [compatibility]: AΩ_𝔛⊗^L_{A_inf}A_inf[1/μ]≅Rν_*(A_inf,X)⊗^L_{A_inf}A_inf[1/μ] (CK (2.2.7)).
API Semistable.aOmega.zariski [data]: AΩ_{𝔛_Zar}=Lη_μRν^Zar_*A_inf,X∈D^{≥0}(𝔛_Zar,A_inf), with ν^Zar the projection to the Zariski site (CK (2.2.4)); it is the object of BMS1. Its comparison with AΩ_𝔛 is aomega-sheaf-completeness.
API Semistable.aOmega.semilinear [functoriality]: Let σ be a continuous automorphism of O_C and g:𝔛′→𝔛 an isomorphism of formal schemes lying over Spf(σ). Then W(σ^♭) is an automorphism of A_inf commuting with φ_A and preserving the ideals (μ), (ξ) and (ξ̃), and pullback of period sheaves along the isomorphism of adic generic fibres induced by g gives a W(σ^♭)-semilinear isomorphism RΓ_Ainf(𝔛)→RΓ_Ainf(𝔛′), compatible with composition. For 𝔛=𝔛₀⊗̂_{O_K}O_C with 𝔛₀ a formal O_K-scheme and σ∈G_K=Gal(K̄/K), taking g=id⊗Spf(σ) gives an A_inf-semilinear action of G_K on each H^i_Ainf(𝔛). CK §8.1 obtains this action from the functoriality of §7.2, which is stated there for O_C-morphisms only.
example Semistable.aOmega.point [degenerate]: For SpfO_C the global complex is A_inf concentrated in degree 0.
example Semistable.aOmega.node [computation]: For the node T₀T₁=p^q (r=d=1), RΓ(𝔘,AΩ^psh) is the two-term complex A(R□)→A(R□) with differential (δ₁−1)/μ, where δ₁ multiplies X₀ by [ε]⁻¹ and X₁ by [ε].
example Semistable.aOmega.good_reduction [compatibility]: For the torus chart R□=O_C{t₁^{±1},…,t_d^{±1}} (r=0), RΓ(𝔘,AΩ^psh) is K_{A(R□)}((δ₁−1)/μ,…,(δ_d−1)/μ) with δᵢ(Xᵢ)=[ε]Xᵢ, the AI.3 toric AΩ complex with identical coefficient maps.
example Semistable.aOmega.decalage_torsion [non-example]: For the torus chart with d=1 and p∤n, the X^n-summand of H¹(𝔘,AΩ^psh) is A_inf/(([ε]^n−1)/μ)=0, whereas the X^n-summand of H¹_cont(Δ,A_inf(R_∞)) is A_inf/([ε]^n−1)=A_inf/μ, which is not killed by W(m^♭): the Teichmüller lift of (p^♭)^{1/p^j} lies in W(m^♭) and, for j large, not in (μ), because modulo p the element μ is ε−1, whose valuation is p/(p−1) times that of p^♭. Since H¹_cont→H¹_proét(𝔘_C^ad,A_inf,X) has kernel killed by W(m^♭), the image of this summand is a nonzero μ-torsion submodule of H¹_proét. So without Lη_μ the first cohomology would have nonzero μ-torsion classes in every monomial degree n prime to p.
Prerequisites: AInfCohomology:AI.3, AInfCohomology:AI.1, AInfCohomology:AI.1/derived-decalage, AInfCohomology:AI.1/decalage-products, AInfCohomology:AI.1/preservation-derived-completeness, AInfCohomology:AI.6/local-edge, EnhancedDerivedSheaves:E1/presentability-and-derived-tensor, EnhancedDerivedSheaves:E5:abstract/algebra-objects, AdicEtaleGeometry:A1

AInfCohomology:AI.6/aomega-frobenius
Semistable.aOmegaFrobenius — theorem, not typed
Statement: The Frobenius automorphism of the period sheaf A_inf,X induces φ_A^*AΩ_𝔛:=AΩ_𝔛⊗^L_{A_inf,φ_A}A_inf≃Lη_{ξ̃}AΩ_𝔛→AΩ_𝔛 in D^{≥0}(𝔛_ét,A_inf) (CK (2.2.5)). The linearized map becomes an isomorphism after inverting ξ̃ (CK (2.2.6)); it need not be an integral equivalence. It is compatible with the pullback maps of aomega. Compatibility with products is not asserted: CK does not state it.
Prerequisites: AInfCohomology:AI.6/aomega, AInfCohomology:AI.0:integral, AInfCohomology:AI.1, AInfCohomology:AI.1/derived-decalage

AInfCohomology:AI.6/hodge-tate-comparison
Semistable.hodgeTateComparison — theorem, not typed
Statement: AΩ_𝔛⊗^L_{A_inf,θ̃}O_C≃Ω̃_𝔛:=Lη_{ζ_p−1}Rν_*Ô_X^+, the décalage being for the ideal sheaf (ζ_p−1)O_𝔛,ét (CK Theorem 4.2). For every i≥0 the O_𝔛,ét-module H^i(Ω̃_𝔛) is locally free, of rank binom(d,i) at a closed point of 𝔛_k̄ where 𝔛_k̄ has dimension d, and H^0(Ω̃_𝔛)=O_𝔛 via ν^♯ (CK Proposition 4.4); for i>0 the cup product induces ∧^iH^1(Ω̃_𝔛)≅H^i(Ω̃_𝔛) (CK Proposition 4.8). The map Ω¹_{𝔛/O_C}{−1}→H^1(Ω̃_𝔛) of CK (4.10.3), an isomorphism over the smooth locus 𝔛^sm, extends uniquely from 𝔛^sm to an isomorphism Ω¹_{𝔛/O_C,log}{−1}≅H^1(Ω̃_𝔛), and this induces Ω^i_{𝔛/O_C,log}{−i}≅H^i(Ω̃_𝔛) for every i≥0, with multiplication corresponding to exterior product (CK Theorem 4.11). Here {1} denotes the tensor product with the free rank-one O_C-module O_C{1}=lim_n Ω¹_{O_C/Z_p}[p^n] (transition maps multiplication by p).
Prerequisites: AInfCohomology:AI.6/aomega, AInfCohomology:AI.6/divisorial-log, AInfCohomology:AI.6/structure-sheaf-edge, AInfCohomology:AI.6/local-edge, AInfCohomology:AI.6/nonintegral-annihilation, CrystallineCohomology:CR.5, AInfCohomology:AI.0:integral, AInfCohomology:AI.1, AInfCohomology:AI.3, AInfCohomology:AI.4, AdicSpacesPartII:R3

AInfCohomology:AI.6/aomega-sheaf-completeness
Semistable.aOmegaSheafCompleteness — theorem, not typed
Statement: (a) If 𝔛 is affine, connected and admits a coordinate map (1.5.1), then for every i the presheaf assigning H^i(𝔛′^ad_C,Ô⁺)/H^i(𝔛′^ad_C,Ô⁺)[ζ_p−1] to an affine étale 𝔛-scheme 𝔛′ is a sheaf (CK Remark 4.5). (b) For every 𝔛 as in CK §1.5, AΩ_𝔛 is derived ξ-adically complete and the adjunction map AΩ^psh→Rφ_*(AΩ_𝔛)≅Rφ_*φ⁻¹(AΩ^psh) is an isomorphism (CK Corollary 4.6). Hence RΓ(𝔘_ét,AΩ_𝔛)≅Lη_μRΓ_proét(𝔘_C^ad,A_inf,X) for every object 𝔘 of 𝔛^psh_ét, and RΓ_Ainf(𝔛) is derived ξ-adically complete. (c) If the coordinate morphisms (1.5.1) exist Zariski locally on 𝔛 (for instance if 𝔛 is smooth over O_C, or Zariski locally arises from a strictly semistable scheme over a discrete valuation ring), then H^i(Ω̃_{𝔛_Zar})≅H^i(Ω̃_𝔛)|_{𝔛_Zar} for every i, the identifications of hodge-tate-comparison and log-de-rham hold for AΩ_{𝔛_Zar}, AΩ_{𝔛_Zar} is derived ξ-adically complete, and RΓ(𝔛_Zar,AΩ_{𝔛_Zar})≅RΓ(𝔛_ét,AΩ_𝔛) (CK Remarks 4.5 and 4.16, Theorems 4.2 and 4.17, Corollary 4.21, Example 4.22).
Prerequisites: AInfCohomology:AI.6/aomega, AInfCohomology:AI.6/hodge-tate-comparison, AInfCohomology:AI.6/log-de-rham, AInfCohomology:AI.3

AInfCohomology:AI.6/log-de-rham
Semistable.logDeRhamComparison — theorem, not typed
Statement: AΩ_𝔛⊗^L_{A_inf,θ}O_C≃Ω^•_{𝔛/O_C,log} in D(𝔛_ét,O_C) (CK Theorem 4.17). Under this identification the term in degree i is Ω^i_{𝔛/O_C,log} and the differential is the log de Rham differential, obtained as the Bockstein of the θ̃-reduction; in degree 0 it is f↦df. Consequently, for every 𝔛 as in CK §1.5, RΓ_Ainf(𝔛)⊗^L_{A_inf,θ}O_C≃RΓ_logdR(𝔛/O_C):=RΓ(𝔛_ét,Ω^•_{𝔛/O_C,log}), with the ordinary derived tensor product (CK Corollary 4.18). Compatibility of these identifications with products, as isomorphisms in D(𝔛_ét,O_C), is not asserted. CK prove only a local form, which crystalline-de-rham-square uses: on the Koszul complexes η_μK_{A_cris^(m)(R_{Σ,Λ,∞})}(δ_τ−1) the specialisation is represented by a map of differential graded algebras to Ω^•_{Spf(R)/O_C,log} that is θ in degree 0 (proof of CK Proposition 5.41, by BMS1 Lemmas 6.13 and 7.5).
Prerequisites: AInfCohomology:AI.6/hodge-tate-comparison, AInfCohomology:AI.6/aomega-frobenius, AInfCohomology:AI.1/bockstein-reduction, AInfCohomology:AI.4, CrystallineCohomology:CR.5, EnhancedDerivedSheaves:E1/presentability-and-derived-tensor

AInfCohomology:AI.6/proper-perfectness
Semistable.properPerfectness — theorem, not typed
Statement: If 𝔛 is proper over O_C, RΓ_Ainf(𝔛) is a perfect A_inf-complex (CK Corollary 4.20). If moreover 𝔛_k̄ has dimension at most d, then H^i_Ainf(𝔛)=0 for i∉[0,2d] (CK Theorem 7.4, under CK §7.1) and RΓ_Ainf(𝔛) is represented by a complex of finite free A_inf-modules in degrees 0,…,2d. This does not imply that its cohomology modules are free.
Prerequisites: AInfCohomology:AI.6/aomega-sheaf-completeness, AInfCohomology:AI.6/log-de-rham, AInfCohomology:AI.5, CrystallineCohomology:CR.5

AInfCohomology:AI.6/finite-level-acris
Semistable.finiteLevelAcris — definition, not typed
Statement: For an integer m≥1 let A_cris^{0,(m)}⊂A_inf[1/p] be the A_inf-subalgebra generated by the elements ξ^s/s! with s≤m, and let A_cris^(m) be its p-adic completion (CK §3.26; it is the ring of BMS1 Lemma 12.8). Thus A_cris^{0,(m)} is contained in the subalgebra A_cris^0 generated by all ξ^n/n!, A_cris^(m)=A_inf for m<p, A_cris^0 is the union of the A_cris^{0,(m)}, and A_cris is the p-adic completion of colim_m A_cris^(m) (CK (5.1.1)). In the local setup of CK §3.1 put A_cris^(m)(R):=A(R)⊗̂_{A_inf}A_cris^(m) and A_cris^(m)(R_∞):=A_inf(R_∞)⊗̂_{A_inf}A_cris^(m), the completions being (p,μ)-adic, equivalently p-adic if m≥p (CK §3.27). The ring A_cris^(m) carries the surjection θ to O_C extending that of A_inf; the three rings carry Frobenius endomorphisms compatible with each other and with varying m; and Δ acts continuously, Frobenius-equivariantly and A_cris^(m)-linearly on A_cris^(m)(R) and A_cris^(m)(R_∞). More generally, for an affinoid perfectoid Spa(R′_∞[1/p],R′_∞) over Spa(C,O_C), such as the R_{Σ,Λ,∞} of all-coordinates, put A_cris^(m)(R′_∞):=A_inf(R′_∞)⊗̂_{A_inf}A_cris^(m), the completion being (p,μ)-adic, equivalently p-adic if m≥p (CK (5.19.3)); it is the completion of the A_inf(R′_∞)-subalgebra A_cris^{0,(m)}(R′_∞)≅A_inf(R′_∞)⊗_{A_inf}A_cris^{0,(m)} of A_inf(R′_∞)[1/p] generated by the ξ^n/n! with n≤m (CK (5.35.1), (5.35.2)), it is p-torsion-free and μ-torsion-free, A_cris^(m)(R′_∞)/μ is p-adically complete (CK §5.19), and the ring homomorphisms A_cris^{0,(m)}(R′_∞)→A_cris^(m)(R′_∞)→A_cris(R′_∞)→B_dR⁺(R′_∞) are injective, where B_dR⁺(R′_∞) is the ξ-adic completion of A_inf(R′_∞)[1/p] (CK Proposition 5.36, (5.36.1)).
API Semistable.finiteLevelAcris.small [compatibility]: For m<p: A_cris^{0,(m)}=A_inf, A_cris^(m)=A_inf, A_cris^(m)(R)=A(R) and A_cris^(m)(R_∞)=A_inf(R_∞).
API Semistable.finiteLevelAcris.topology [characterisation]: For m≥p: μ^p/p!∈A_cris^(m), so the p-adic and (p,μ)-adic topologies of A_cris^(m) agree, and for each n one has A_cris^(m)/p^n=A_cris^(m)/(p^n,μ^{n′}) for n′ large.
API Semistable.finiteLevelAcris.intertwined [relation]: The systems of ideals (p^nA_cris^(m))_n and ({x:μx∈p^nA_cris^(m)})_n are intertwined; equivalently, for every n the map (A_cris^(m)/p^{n′})[μ]→A_cris^(m)/p^n vanishes for n′ large (CK (3.26.2)). The same holds for A_cris^(m)(R□_∞) and A_cris^(m)(R_∞).
API Semistable.finiteLevelAcris.mu_torsion_free [structure]: A_cris^(m) and A_cris^(m)(R_∞) are p-torsion-free and μ-torsion-free, and A_cris^(m)/μ and A_cris^(m)(R_∞)/μ are p-adically complete (CK (3.26.4), (3.27.2)).
API Semistable.finiteLevelAcris.theta [projection]: θ:A_inf→O_C extends to a surjection θ:A_cris^(m)→O_C (CK (3.26.1)), compatibly in m.
API Semistable.finiteLevelAcris.frobenius [structure]: φ_A preserves A_cris^{0,(m)} and induces a Frobenius endomorphism of A_cris^(m) which, through θ, is compatible with the absolute Frobenius of O_C/p; A_cris^(m)(R) and A_cris^(m)(R_∞) carry compatible A_cris^(m)-semilinear Frobenius endomorphisms, compatible as m varies.
API Semistable.finiteLevelAcris.monomials [characterisation]: A_cris^(m)(R□_∞) is the (p,μ)-adically completed direct sum of A_cris^(m)·X^a over the normalized exponents (CK (3.27.1)); A_cris^(m)(R_∞) is (p,μ)-adically formally étale over it, and A_cris^(m)(R) is a direct summand of A_cris^(m)(R_∞) as an A_cris^(m)(R)-module.
API Semistable.finiteLevelAcris.delta_trivial_mod_mu [relation]: Δ acts continuously, Frobenius-equivariantly and A_cris^(m)-linearly on A_cris^(m)(R) and A_cris^(m)(R_∞). For δ∈Δ the endomorphism (δ−1)/μ of A(R) induces an A_cris^(m)-linear endomorphism (δ−1)/μ of A_cris^(m)(R) with δ=1+μ·(δ−1)/μ; hence Δ acts trivially on A_cris^(m)(R)/μ.
API Semistable.finiteLevelAcris.no_almost_torsion [relation]: For m≥p, A_cris^(m)(R_∞)/(μ,p^n) for every n and A_cris^(m)(R_∞)/μ have no nonzero W(m^♭)-torsion (CK Proposition 3.29); for m<p this is CK (3.14.1).
API Semistable.finiteLevelAcris.colimit [compatibility]: A_cris is the p-adic completion of colim_m A_cris^(m), Frobenius-equivariantly and compatibly with the maps θ (CK (5.1.1)).
API Semistable.finiteLevelAcris.injective [characterisation]: For an affinoid perfectoid Spa(R′_∞[1/p],R′_∞) over Spa(C,O_C) and m≥1 the maps A_cris^{0,(m)}(R′_∞)→A_cris^(m)(R′_∞)→A_cris(R′_∞)→B_dR⁺(R′_∞)=(A_inf(R′_∞)[1/p])^ (ξ-adic completion) are injective; in particular none of these rings has nonzero μ-torsion, μ/ξ being a unit of B_dR⁺(R′_∞) (CK Proposition 5.36).
example Semistable.finiteLevelAcris.below_p [degenerate]: For m<p every generator ξ^s/s! with s≤m lies in A_inf, since s! is a unit of Z_p; hence A_cris^{0,(m)}=A_inf.
example Semistable.finiteLevelAcris.first_divided_power [computation]: ξ^p/p! lies in A_cris^{0,(p)} but not in A_inf: A_inf/p=O_C^♭ is a domain in which the image of ξ is nonzero, so ξ^p is not divisible by p in A_inf. Moreover A_cris^{0,(p)}≅A_inf[T]/(p!·T−ξ^p) via T↦ξ^p/p!.
example Semistable.finiteLevelAcris.mu_divided_power [computation]: For m≥p: μ=ξ·φ_A⁻¹(μ) gives μ^p/p!=(ξ^p/p!)·φ_A⁻¹(μ)^p∈A_cris^{0,(m)}, hence μ^p∈p·A_cris^(m).
example Semistable.finiteLevelAcris.frobenius_xi [computation]: For m≥p: ξ̃=φ_A(ξ) is congruent to ξ^p modulo p·A_inf and ξ^p=p!·(ξ^p/p!), so ξ̃/p∈A_cris^{0,(m)} and φ_A(ξ^s/s!)=(p^s/s!)·(ξ̃/p)^s∈A_cris^{0,(m)} for every s.
example Semistable.finiteLevelAcris.mod_p_torsion [computation]: A_cris^(p)/p≅O_C^♭[T]/(ξ̄^p), with ξ̄=(ε^{1/p}−1)^{p−1} the image of ξ; the image μ̄=(ε^{1/p}−1)^p of μ satisfies μ̄^{p−1}=ξ̄^p=0, so A_cris^(p)/p has nonzero μ-torsion (the class of 1 if p=2, of μ̄^{p−2} if p>2), while A_cris^(p) itself is μ-torsion-free.
example Semistable.finiteLevelAcris.small_not_p_adic [non-example]: For m<p the p-adic and (p,μ)-adic topologies of A_cris^(m)=A_inf differ: no power of μ is divisible by p, because the image ε−1 of μ in the domain O_C^♭ is nonzero. So the statements made for m≥p with p-adic completions do not extend to m<p without replacing them by (p,μ)-adic ones.
Prerequisites: CrystallineCohomology:CR.0, AInfCohomology:AI.0:integral, AInfCohomology:AI.6/root-tower, AInfCohomology:AI.6/ainf-chart-lift, AInfCohomology:AI.6/monomial-splitting, AInfCohomology:AI.6/structure-sheaf-edge, AInfCohomology:AI.4

AInfCohomology:AI.6/finite-pd-base-change
Semistable.finitePDBaseChange — theorem, not typed
Statement: Let A_cris^(m), A_cris^(m)(R) and A_cris^(m)(R_∞)=A_inf(R_∞)⊗̂_{A_inf}A_cris^(m) be as in finite-level-acris. For every m≥p: (a) the base change e⊗̂^L A_cris^(m): RΓ_cont(Δ,A_cris^(m)(R_∞))→RΓ_proét(X_C^ad,A_inf,X)⊗̂^L_{A_inf}A_cris^(m) of the edge map (CK (3.28.1)) becomes an isomorphism after Lη_μ (CK Theorem 3.34); (b) the natural map (Lη_μRΓ_cont(Δ,A_inf(R_∞)))⊗̂^L_{A_inf}A_cris^(m)→Lη_μRΓ_cont(Δ,A_cris^(m)(R_∞)) is an isomorphism, and both sides are the Koszul complex K_{A_cris^(m)(R)}((δ₁−1)/μ,…,(δ_d−1)/μ) (proof of CK Proposition 5.6); (c) consequently Lη_μ(RΓ_proét(X_C^ad,A_inf,X))⊗̂^L_{A_inf}A_cris^(m)≃Lη_μ(RΓ_proét(X_C^ad,A_inf,X)⊗̂^L_{A_inf}A_cris^(m)) (CK Proposition 5.6). The target of (a) is a completed tensor product of the cohomology of A_inf,X, not the cohomology of a sheaf of rings A_cris^(m) on the pro-étale site.
Prerequisites: AInfCohomology:AI.6/local-edge, AInfCohomology:AI.6/nonintegral-annihilation, AInfCohomology:AI.6/finite-level-acris, AInfCohomology:AI.6/ainf-chart-lift, AInfCohomology:AI.0:integral, CrystallineCohomology:CR.0, AInfCohomology:AI.1, EnhancedDerivedSheaves:E4/completed-sheaf-tensor, EnhancedDerivedSheaves:E4

AInfCohomology:AI.6/log-derivations
Semistable.logDerivations — construction, typed above
Statement: On the chart polynomial ring, for a branch direction 1≤i≤r let D_i=X_i∂_i−X₀∂₀; for each torus pair Y_j,Z_j let D_j=Y_j∂_{Y_j}−Z_j∂_{Z_j}. These derivations kill ∏X_i−a (a in the coefficient ring) and Y_jZ_j−1, hence preserve the chart ideal, and they commute. On A(R□) they are the (p,μ)-adically continuous extensions of these derivations. On A(R) they are the basis ∂/∂log(X_i), i=1,…,d (d=r+s), dual to the basis dlog X₁,…,dlog X_d of the free A(R)-module Ω¹_{A(R)/A_inf,log} (CK (5.10.1)–(5.10.2)); equivalently, the unique A_inf-derivations of A(R) extending those of A(R□) along the (p,μ)-adically formally étale map A(R□)→A(R). By base change they give A_cris^(m)-derivations of A_cris^(m)(R)=A(R)⊗̂_{A_inf}A_cris^(m) and A_cris-derivations of A_cris(R). The log de Rham complex Ω•_{A(R)/A_inf,log} is their Koszul complex (CK (5.10.3)), with degree-j Frobenius p^jφ. The derivations of the all-coordinates envelopes (CK §5.31) are constructed in all-coordinates-pd, not here.
Typed part: the integer weights logWeight with logWeight_sum, the polynomial derivations, generators, relations, frobenius (Dφ=pφD for φ acting by any coefficient endomorphism and X↦X^p), commute, mem_chartIdeal (the chart ideal is preserved, for every π), the induced derivation onQuotient on the uncompleted chart quotient with onQuotient_mk, and apply_toMonomial (each derivation multiplies the monomial of an index by the corresponding weight of the index). The tests node, torus and monomial are typed; zero_rank is typed as the emptiness of the index type of directions. Absent: dual_basis and everything on A(R□), A(R) and the divided power rings, namely the continuous extensions, the basis dual to dlog X₁,…,dlog X_d of Ω¹_{A(R)/A_inf,log}, the Koszul complex and its degree-j Frobenius p^jφ, which use supplier types.
API Semistable.logDerivations.generators [simp] (typed): D_i(X_i)=X_i, D_i(X₀)=−X₀ and all other branch values are zero; torus direction sends Y to Y and Z to −Z.
API Semistable.logDerivations.relations [relation] (typed): Each D annihilates ∏X_i−a and Y_jZ_j−1, hence descends to the quotient.
API Semistable.logDerivations.frobenius [compatibility] (typed): D_iφ=pφD_i; on the log differential complex the degree-j lift is p^jφ.
API Semistable.logDerivations.dual_basis [characterisation]: On A(R) the derivations ∂/∂log(X_i), i=1,…,d, are the basis dual to dlog X₁,…,dlog X_d of Ω¹_{A(R)/A_inf,log}; they restrict on A(R□) to the continuous extensions of the D_i and commute with each other.
example Semistable.logDerivations.node [computation] (typed): On Z[X₀,X₁], (X₁∂₁−X₀∂₀)(X₀X₁−a)=0 for every integer a.
example Semistable.logDerivations.torus [computation] (typed): On Z[Y,Z], (Y∂_Y−Z∂_Z)(YZ−1)=0.
example Semistable.logDerivations.zero_rank [degenerate] (typed): For r=s=0 there are no log directions, and the Koszul complex has only degree 0.
example Semistable.logDerivations.monomial [computation] (typed): On Z[X₀,X₁], (X₁∂₁−X₀∂₀)(X₀^aX₁^b)=(b−a)X₀^aX₁^b for all a,b≥0; in particular D(X₁)=X₁ and D(X₀)=−X₀, which fixes the normalisation.
Prerequisites: AInfCohomology:AI.6/ainf-chart-lift, AInfCohomology:AI.6/divisorial-log, mathlib:MvPolynomial.pderiv, CrystallineCohomology:CR.5, AInfCohomology:AI.1, CrystallineCohomology:CR.5:log-algebra, CrystallineCohomology:CR.0, AInfCohomology:AI.6/finite-level-acris

AInfCohomology:AI.6/local-crystalline
Semistable.localCrystalline — theorem, not typed
Statement: Let m≥p². On A_cris^(m)(R) each generator δ_i of Δ (i=1,…,d) acts as exp(log([ε])·D_i)=∑_{n≥0}(log([ε]))^n/n!·D_i^n, where D_i=∂/∂log(X_i) is the derivation of log-derivations and log([ε])=μ−μ²/2+μ³/3−…∈A_cris^(m). Hence (δ_i−1)/μ=D_i·U_i, where U_i=∑_{n≥1}(log([ε]))^n/(μ·n!)·D_i^{n−1} is an A_cris^(m)-linear automorphism of A_cris^(m)(R) (CK Lemma 5.15). The maps (id, ∑_{n≥1}(log([ε]))^n/n!·D_i^{n−1}) from [D_i] to [δ_i−1] induce an isomorphism of complexes K_{A_cris^(m)(R)}(D_1,…,D_d)≅η_μK_{A_cris^(m)(R)}(δ_1−1,…,δ_d−1) and a quasi-isomorphism onto η_μK_{A_cris^(m)(R_∞)}(δ_1−1,…,δ_d−1); they intertwine p^jφ in degree j of the source with φ (CK Proposition 5.16). After the termwise colimit over m and termwise p-adic completion this gives a Frobenius-equivariant identification RΓ_logcrys((Spf R)_{O_C/p}/A_cris)≅AΩ_R⊗̂^L_{A_inf}A_cris (CK (5.16.3)), where AΩ_R=Lη_μRΓ_proét((Spf R)_C^ad,A_inf) is the value on Spf R of the presheaf AΩ^psh of CK §4.1.
Prerequisites: AInfCohomology:AI.6/finite-pd-base-change, AInfCohomology:AI.6/log-derivations, CrystallineCohomology:CR.5, AInfCohomology:AI.1, EnhancedDerivedSheaves:E4/completed-colimits, AInfCohomology:AI.6/ainf-chart-lift, AInfCohomology:AI.6/root-tower, AInfCohomology:AI.6/aomega, AInfCohomology:AI.0:integral, CrystallineCohomology:CR.0, AInfCohomology:AI.6/finite-level-acris, AInfCohomology:AI.4

AInfCohomology:AI.6/all-coordinates
Semistable.allCoordinates — definition, not typed
Statement: Let Spf R be an affine nonempty étale open of 𝔛 such that every two irreducible components of Spec(R⊗_{O_C}k̄) meet. An index (Σ,Λ) consists of a finite set Σ, a nonempty finite set Λ, for each λ∈Λ a chart ring R□_λ=O_C{t_{λ,0},…,t_{λ,r_λ},t_{λ,r_λ+1}^{±1},…,t_{λ,d}^{±1}}/(t_{λ,0}⋯t_{λ,r_λ}−p^{q_λ}) with q_λ∈Q_{>0} (the same d for all λ; r_λ and q_λ may vary), and a closed immersion Spf R→Spf O_C{t_σ^{±1}:σ∈Σ}×∏_{λ∈Λ}Spf R□_λ over Spf O_C such that already Spf R→Spf O_C{t_σ^{±1}:σ∈Σ} is a closed immersion and each Spf R→Spf R□_λ is étale (CK §5.17). Indices are refined by enlarging Σ and Λ and form a filtered system. Each irreducible component of Spec(R⊗k̄) is cut out by a unique t_{λ,i} with 0≤i≤r_λ. If R⊗k̄ is not k̄-smooth, then R determines q_λ, so q_λ does not depend on λ; if R⊗k̄ is smooth, q_λ may depend on λ and r_λ>0 is allowed. The product chart algebra is A□_{Σ,Λ}=A(R□_Σ)⊗̂_{A_inf}⊗̂_{λ∈Λ}A(R□_λ), completed (p,μ)-adically (CK (5.22.1)). The root cover R_{Σ,Λ,∞} is the base change to R of the product of the root towers of R□_Σ=O_C{t_σ^{±1}} and of the R□_λ; it is a perfectoid pro-(finite étale) cover of the generic fibre with group Δ_{Σ,Λ}=Δ_Σ×∏_{λ∈Λ}Δ_λ, topologically freely generated by the δ_σ (σ∈Σ) and δ_{λ,i} (λ∈Λ, 1≤i≤d), and it contains each chart tower R_{λ,∞} as a subcover (CK §5.18).
API Semistable.allCoordinates.refine [constructor]: Finite union of invertible coordinates and finite union of chart families define a common refinement of eligible indices.
API Semistable.allCoordinates.maps [functoriality]: For (Σ,Λ)⊂(Σ′,Λ′) the projections give maps A□_{Σ,Λ}→A□_{Σ′,Λ′} and R_{Σ,Λ,∞}→R_{Σ′,Λ′,∞}, compatible with Frobenius and with Δ_{Σ′,Λ′}→Δ_{Σ,Λ}, satisfying identity and composition. For a p-adically formally étale R→R′ with index (Σ′,Λ′), the (Σ,Λ)-objects of R map to the (Σ∪Σ′,Λ∪Λ′)-objects of R′.
API Semistable.allCoordinates.single [compatibility]: For each λ∈Λ the chart tower R_{λ,∞} is a subcover of R_{Σ,Λ,∞}, compatibly with the projection Δ_{Σ,Λ}→Δ_λ. The presentation does not reduce to that chart and its tower: Σ must by itself give a closed immersion, and the group is Δ_Σ×∏_λΔ_λ.
API Semistable.allCoordinates.components [characterisation]: For every λ∈Λ each irreducible component of Spec(R⊗k̄) is cut out by a unique t_{λ,i} with 0≤i≤r_λ.
API Semistable.allCoordinates.valuation [characterisation]: If R⊗k̄ is not smooth, q_λ is the same for all λ∈Λ; if R⊗k̄ is smooth, there is for each λ a unique i_λ with t_{λ,i_λ}∉R^×, and q_λ may depend on λ.
example Semistable.allCoordinates.two_charts [characterisation]: Two distinct eligible node charts are both refined by the index containing their union.
example Semistable.allCoordinates.no_chart [non-example]: Λ=∅ is excluded; torus coordinates alone do not constitute the logarithmic semistable presentation.
example Semistable.allCoordinates.smooth [compatibility]: Let R be smooth with Spf R connected, and let Σ⊂R^× be a finite set as in BMS1 §12.2: it gives a closed embedding into a torus and contains d elements giving an étale framing λ. Then (Σ,{λ}), with r_λ=0, is an index, and the Δ_Σ-cover of the generic fibre obtained by adjoining p-power roots of the elements of Σ is the quotient of R_{Σ,{λ},∞} by Δ_λ. This is a comparison map of presentations, not an identification with the smooth all-coordinates presentation, and it is not a statement of CK.
example Semistable.allCoordinates.smooth_valuations [non-example]: For R=O_C{t^{±1}} and any q∈Q_{>0}, the map t₀↦p^q·t, t₁↦t^{-1} from O_C{t₀,t₁}/(t₀t₁−p^q) is an étale chart with r_λ=1 (the completed localisation at t₁). Two such charts with different q, together with Σ={t}, form an index; so q_λ is not constant on Λ when R⊗k̄ is smooth.
Prerequisites: AInfCohomology:AI.6/chart-ring, AInfCohomology:AI.6/divisorial-log, AInfCohomology:AI.3, CrystallineCohomology:CR.5, AInfCohomology:AI.6/root-tower, AInfCohomology:AI.6/ainf-chart-lift, PerfectoidSpaces:P3

AInfCohomology:AI.6/log-exactification
Semistable.logExactification — construction, not typed
Statement: Fix the unique q∈Q_{>0} with Z·q=∑_{λ∈Λ}Z·q_λ, and give O_C/p and A_inf the fine log structures ℕ→O_C/p, 1↦p^q and ℕ→A_inf, 1↦[(p^{1/p^∞})^q]. Let Q be the fine monoid of CK §5.25, the product of the monoids Q_λ with their diagonal elements identified; it is a chart of A□_{Σ,Λ}. Choose λ₀∈Λ and let P_{λ₀} be the monoid (5.26.1) if R⊗k̄ is smooth, or the monoid (5.27.2), indexed by the generic points Y of the special fibre, if it is not. The fine version of the log closed immersion Spec(R/p)→Spec(A□_{Σ,Λ}) factors Frobenius-equivariantly as an exact log closed immersion j_{λ₀} into Spec(A□_{Σ,Λ}⊗_{Z[Q]}Z[P_{λ₀}]), followed by the log étale projection q_{λ₀} (CK (5.26.5), (5.27.5)). The algebra A□_{Σ,Λ}⊗_{Z[Q]}Z[P_{λ₀}] is the initial A□_{Σ,Λ}-algebra with units satisfying the relations (5.26.3), respectively (5.27.3), and R is an algebra over it. The canonical changes λ₀→λ₀′, isomorphisms over A□_{Σ,Λ} compatible with the maps from Spec(R/p) (CK (5.26.6)–(5.26.7)), commute with Frobenius and satisfy the cocycle law.
API Semistable.logExactification.factor [data]: The displayed factorization is exact-closed followed by log étale and commutes with the map to R/p.
API Semistable.logExactification.units [simp]: Nonsmooth case (CK (5.27.3)): X_{λ,i} is a unit for i∉i_λ(Y); X_{λ,i_λ(y)}=U_{λ,λ₀,y}·X_{λ₀,i_{λ₀}(y)}; U_{λ₀,λ₀,y}=1; and ∏_{y∈Y}U_{λ,λ₀,y}=∏_{i∉i_{λ₀}(Y)}X_{λ₀,i}/∏_{i∉i_λ(Y)}X_{λ,i}. Smooth case (CK (5.26.3)): X_{λ,i}=[((p^{1/p^∞})^q)^{n_{λ,i}}]·V_{λ,i} with units V_{λ,i} and ∏_{0≤i≤r_λ}V_{λ,i}=1, where n_{λ,i_λ}=q_λ/q and n_{λ,i}=0 for i≠i_λ.
API Semistable.logExactification.change [functoriality]: Changing λ₀ uses the displayed ratios and composes by the cocycle law, preserving log charts and Frobenius.
API Semistable.logExactification.algebra [compatibility]: R is an algebra over A□_{Σ,Λ}⊗_{Z[Q]}Z[P_{λ₀}], with V_{λ,i}↦v_{λ,i} in the smooth case and U_{λ,λ₀,y}↦u_{λ,λ₀,y} in the nonsmooth case, compatibly with change of λ₀ (CK (5.26.4), (5.27.4)).
example Semistable.logExactification.single [degenerate]: For Λ={λ₀} in the nonsmooth case the units U_{λ₀,λ₀,y} are 1 and A□_{Σ,Λ}⊗_{Z[Q]}Z[P_{λ₀}] is the localization of A□_{Σ,Λ} inverting X_{λ₀,i} for those i with t_{λ₀,i}∈R^×; it equals A□_{Σ,Λ} exactly when every t_{λ₀,i}, 0≤i≤r_{λ₀}, is a nonunit of R.
example Semistable.logExactification.node [computation]: For two node charts x′=ax, y′=a⁻¹y of the same R with a∈R^× (for instance a∈O_C^×), with branches y₁: x=0 and y₂: y=0, the images in R of the ratio units are u_{λ,λ₀,y₁}=a and u_{λ,λ₀,y₂}=a⁻¹, and the product relation reads U_{λ,λ₀,y₁}·U_{λ,λ₀,y₂}=1.
example Semistable.logExactification.nonexact_pd [non-example]: For the two node charts of the previous test, when the node x=y=0 lies in Spf R the immersion Spec(R/p)→Spec(A□_{Σ,Λ}) is not exact: there is no V∈A□_{Σ,Λ} with X′=V·X (modulo (X,Y,Y′) the element X′ is nonzero), although x′=ax in R. The exactified algebra adjoins exactly the unit U with X′=U·X and Y=U·Y′.
example Semistable.logExactification.smooth [computation]: For R=O_C{t^{±1}}, Σ={t} and Λ={λ₀,λ₁}, where λ₀ has r=0, q_{λ₀}=1 (t_{λ₀,0}=p, t_{λ₀,1}=t) and λ₁ has r=1, q_{λ₁}=1/2 (t_{λ₁,0}=p^{1/2}t, t_{λ₁,1}=t^{-1}): q=1/2, n_{λ₀,0}=2, n_{λ₁,0}=1, n_{λ₁,1}=0, v_{λ₀,0}=1, v_{λ₁,0}=t, v_{λ₁,1}=t^{-1}, and the exactified algebra is A□_{Σ,Λ}[X_{λ₁,1}^{-1}] with V_{λ₁,1}=X_{λ₁,1}, V_{λ₁,0}=X_{λ₁,1}^{-1}, V_{λ₀,0}=1.
Prerequisites: AInfCohomology:AI.6/all-coordinates, CrystallineCohomology:CR.5:log-algebra, CrystallineCohomology:CR.5

AInfCohomology:AI.6/all-coordinates-pd
Semistable.allCoordinatesPD — construction, not typed
Statement: Let D_{jλ₀} be CR.0’s ordinary divided power envelope over (Z_p,pZ_p) of the exact closed immersion j_{λ₀}: Spec(R/p)→Spec(A□_{Σ,Λ}⊗_{Z[Q]}Z[P_{λ₀}]) of log-exactification (CK §5.28); by the universal property of the uncompleted A_cris^0 it is equally the divided power envelope of j_{λ₀,cris} over Spec(O_C/p)→Spec(A_cris^0). Let D_{Σ,Λ}=lim_nD_{Σ,Λ,n}, where D_{Σ,Λ,n} is the log PD envelope of Spec(R/p)→Spec(A□_{Σ,Λ}⊗_{A_inf}A_cris/p^n) over Spec(O_C/p)→Spec(A_cris/p^n) (CK §5.22); it is the completed log PD envelope used for R/p, with an A_cris-semilinear Frobenius, a Δ_{Σ,Λ}-action and a map D_{Σ,Λ}→R. The map q_{λ₀} induces isomorphisms D_{Σ,Λ,n}≅D_{jλ₀}/p^n and D_{Σ,Λ}≅(D_{jλ₀})^∧ (p-adic completion), A_cris-linear and compatible with divided powers, Frobenius, Δ_{Σ,Λ}, the maps to R and change of λ₀ (CK Lemma 5.29). For m≥1 let D^{(m)}_{jλ₀}⊂D_{jλ₀} be the subalgebra generated by the divided powers of degree ≤m of elements of the ideal of j_{λ₀}, and D^{0,(m)}_{Σ,Λ} its image in D_{Σ,Λ}, which is independent of λ₀. For m≥p let D^{(m)}_{Σ,Λ} be the p-adic completion of D^{0,(m)}_{Σ,Λ}; it is an A_cris^(m)-algebra with Frobenius and Δ_{Σ,Λ}-action, and D_{Σ,Λ}≅(colim_{m≥p}D^{(m)}_{Σ,Λ})^∧ over A_cris (CK (5.30.1)). The derivations ∂/∂log(X_τ) of log-derivations (τ=σ∈Σ or τ=(λ,i), 1≤i≤d) extend to divided power derivations of D_{jλ₀} and D_{Σ,Λ} and to A_cris^(m)-derivations of D^{(m)}_{Σ,Λ} (CK §5.31). All of this is functorial under enlarging (Σ,Λ). No p-torsion-freeness of D_{Σ,Λ} is assumed, and D^{(m)}_{Σ,Λ}→D_{Σ,Λ} is not asserted to be injective.
API Semistable.allCoordinatesPD.universal [universal-property]: For each n, D_{Σ,Λ,n}=D_{Σ,Λ}/p^n is the log PD envelope of Spec(R/p)→Spec(A□_{Σ,Λ}⊗_{A_inf}A_cris/p^n) over Spec(O_C/p)→Spec(A_cris/p^n): for a log PD thickening T₀→T over A_cris/p^n with integral quasi-coherent log structure, compatible log maps T₀→Spec(R/p) and T→Spec(A□_{Σ,Λ}⊗_{A_inf}A_cris/p^n) factor uniquely through a log PD map T→Spec(D_{Σ,Λ,n}).
API Semistable.allCoordinatesPD.refine [functoriality]: Refinement and change of λ₀ commute with PD structure, Frobenius and log derivations.
API Semistable.allCoordinatesPD.finite [characterisation]: D_{Σ,Λ}≅(colim_{m≥p}D^{(m)}_{Σ,Λ})^∧ over A_cris (CK (5.30.1)), where D^{(m)}_{Σ,Λ} is the p-adic completion of the subalgebra D^{0,(m)}_{Σ,Λ}⊂D_{Σ,Λ}; D^{(m)}_{Σ,Λ}→D_{Σ,Λ} is not asserted to be injective, and termwise completion alone is not substituted for a derived comparison.
API Semistable.allCoordinatesPD.exact [equivalence]: q_{λ₀} induces D_{Σ,Λ,n}≅D_{jλ₀}/p^n for n>0 and D_{Σ,Λ}≅(D_{jλ₀})^∧, A_cris-linearly and compatibly with divided powers, Frobenius, the Δ_{Σ,Λ}-action, the maps to R/p^n and R, and change of λ₀ (CK Lemma 5.29).
API Semistable.allCoordinatesPD.toR [data]: There is a map D_{Σ,Λ}→R lifting D_{Σ,Λ}→R/p, induced by the factorization Spec(R/p)→Spf R→Spf D_{Σ,Λ} (CK (5.22.3)) and agreeing with D_{jλ₀}→R of CK (5.28.2).
API Semistable.allCoordinatesPD.derivations [structure]: The commuting derivations ∂/∂log(X_τ) act on D_{jλ₀} and D_{Σ,Λ} as divided power derivations (∂(x^{[n]})=x^{[n−1]}∂(x)) and on D^{(m)}_{Σ,Λ}, m≥p, as A_cris^(m)-derivations, compatibly with each other and with those of A□_{Σ,Λ} (CK §5.31).
example Semistable.allCoordinatesPD.single [compatibility]: For each λ∈Λ and m≥p there is a unique map of A_cris^(m)(R□_λ)-algebras A_cris^(m)(R)_λ→D^{(m)}_{Σ,Λ} lifting the identity of R/p (CK (5.39.1)); it is Δ_{Σ,Λ}-equivariant through Δ_{Σ,Λ}→Δ_λ and commutes with ∂/∂log(X_{λ,i}). D_{Σ,Λ} is not identified with the lift A_cris(R)_λ used in local-crystalline.
example Semistable.allCoordinatesPD.ratio [computation]: For two node charts differing by a unit a, under D_{jλ₀}→R the ratio units U_{λ,λ₀,y} map to a and a⁻¹ on the two branches, and the constructions for the two choices of λ₀ are canonically isomorphic (CK (5.28.1)).
example Semistable.allCoordinatesPD.point [degenerate]: For R=O_C and the index Σ=∅, Λ={λ} with d=0, A□_{Σ,Λ}=A_inf and D_{Σ,Λ}=A_cris with its divided powers.
example Semistable.allCoordinatesPD.torus_coordinate [computation]: For R=O_C, Σ={σ} with t_σ↦u∈O_C^× and Λ={λ} with d=0, A□_{Σ,Λ}=A_inf{X_σ^{±1}} and D_{Σ,Λ} is the p-adically completed divided power polynomial algebra over A_cris in the variable X_σ−[u^♭]; in particular D_{Σ,Λ}≠A_cris, and ∂/∂log(X_σ) sends X_σ−[u^♭] to X_σ.
Prerequisites: AInfCohomology:AI.6/log-exactification, CrystallineCohomology:CR.0, CrystallineCohomology:CR.5, AInfCohomology:AI.6/log-derivations, AInfCohomology:AI.6/all-coordinates, AInfCohomology:AI.6/finite-level-acris

AInfCohomology:AI.6/all-coordinates-aomega
Semistable.allCoordinatesAOmega — construction, not typed
Statement: For an index (Σ,Λ) of all-coordinates and m≥p let A_cris^(m)(R_{Σ,Λ,∞})=A_inf(R_{Σ,Λ,∞})⊗̂_{A_inf}A_cris^(m), and form η_μK_{A_cris^(m)(R_{Σ,Λ,∞})}(δ_τ−1), where τ runs over σ∈Σ and (λ,i) with λ∈Λ, 1≤i≤d. Take the filtered all-coordinates colimit of the p-completed filtered colimit, m≥p, of these complexes; the colimits and the completion are termwise (CK (5.21.1)). The result carries an A_cris-semilinear Frobenius. For each (Σ,Λ) and m≥p the edge map of the cover R_{Σ,Λ,∞} identifies the m-th complex, Frobenius-equivariantly, with AΩ_R⊗̂^L_{A_inf}A_cris^(m), where AΩ_R=Lη_μRΓ_proét((Spf R)_C^ad,A_inf) is the value on Spf R of the presheaf AΩ^psh (CK Proposition 5.20). Hence in the shared derived enhancement the model is canonically and Frobenius-equivariantly identified with AΩ_R⊗̂^L_{A_inf}A_cris, compatibly with enlarging (Σ,Λ) and functorially in R for p-adically formally étale maps R→R′ (CK §5.21). The termwise completion agrees with the derived one because A_cris^(m)(R_{Σ,Λ,∞}) is p-torsion free. No multiplicative structure on the model or on this identification is asserted.
API Semistable.allCoordinatesAOmega.edge [equivalence]: For m≥p the edge map of the cover R_{Σ,Λ,∞} induces a Frobenius-equivariant identification of η_μK_{A_cris^(m)(R_{Σ,Λ,∞})}(δ_τ−1) with AΩ_R⊗̂^L_{A_inf}A_cris^(m) (CK (5.20.1)), and of the model with AΩ_R⊗̂^L_{A_inf}A_cris; it is compatible with p-adically formally étale maps R→R′.
API Semistable.allCoordinatesAOmega.refine [functoriality]: Refinement maps commute with cochain differentials and the completed colimit structure.
API Semistable.allCoordinatesAOmega.frobenius [compatibility]: The model’s Frobenius agrees with aomega-frobenius after PD base change.
API Semistable.allCoordinatesAOmega.chart [compatibility]: For λ∈Λ and m≥p the map η_μK_{A_cris^(m)(R_{λ,∞})}((δ_{λ,i}−1)_{1≤i≤d})→η_μK_{A_cris^(m)(R_{Σ,Λ,∞})}(δ_τ−1) induced by the subcover R_{λ,∞} and the projection Δ_{Σ,Λ}→Δ_λ is a quasi-isomorphism (CK Lemma 3.7 and Remark 3.35).
API Semistable.allCoordinatesAOmega.torsion_free [structure]: A_cris^(m)(R_{Σ,Λ,∞}) is p-torsion free and μ-torsion free, and its quotient by μ is p-adically complete (CK §5.19); so η_μ of the Koszul complex computes Lη_μ and the termwise p-adic completion is the derived one.
example Semistable.allCoordinatesAOmega.point [degenerate]: For R=O_C and the index Σ=∅, Λ={λ} with d=0, the group Δ_{Σ,Λ} is trivial, R_{Σ,Λ,∞}=O_C and the complex is A_cris in degree 0.
example Semistable.allCoordinatesAOmega.single [compatibility]: For one node chart λ (d=1) and m≥p, the rank-one complex η_μK_{A_cris^(m)(R_{λ,∞})}(δ_{λ,1}−1) maps quasi-isomorphically to the (Σ,{λ})-term, which is the Koszul complex on the |Σ|+1 operators δ_σ−1, δ_{λ,1}−1; the two are not equal unless Σ=∅.
example Semistable.allCoordinatesAOmega.refinement [characterisation]: The two chart embeddings into a common refinement induce the same equivalence with the intrinsic AΩ target.
example Semistable.allCoordinatesAOmega.torus_point [computation]: For R=O_C, Σ={σ} with t_σ↦u∈O_C^× and Λ={λ} with d=0, the group is Δ_{Σ,Λ}=Δ_σ≅Z_p and the m-th term is η_μ of the two-term complex δ_σ−1 on A_cris^(m)(R_{Σ,Λ,∞}); for m≥p it is quasi-isomorphic to A_cris^(m) in degree 0, although it is not concentrated in degree 0.
Prerequisites: AInfCohomology:AI.6/all-coordinates, AInfCohomology:AI.6/root-tower, AInfCohomology:AI.6/finite-pd-base-change, AInfCohomology:AI.1, EnhancedDerivedSheaves:E4/completed-colimits, EnhancedDerivedSheaves:E1/presentability-and-derived-tensor, AInfCohomology:AI.6/aomega, AInfCohomology:AI.6/aomega-frobenius, AInfCohomology:AI.3, AInfCohomology:AI.0:integral, CrystallineCohomology:CR.0, AInfCohomology:AI.6/finite-level-acris

AInfCohomology:AI.6/all-coordinates-log-crystalline
Semistable.allCoordinatesLogCrystalline — construction, not typed
Statement: For an index (Σ,Λ) and m≥p form the Koszul complex K_{D_{Σ,Λ}^{(m)}}(D_τ) of the derivations D_τ=∂/∂log(X_τ) of all-coordinates-pd, where τ runs over σ∈Σ and (λ,i) with λ∈Λ, 1≤i≤d. Take the filtered all-coordinates colimit of the p-completed filtered colimit, m≥p, of these complexes; the colimits and the completion are termwise (CK (5.32.1)). Degree-j Frobenius is p^jφ. For each (Σ,Λ) the completed colimit over m is K_{D_{Σ,Λ}}(D_τ), the log PD de Rham complex Ω•_{D_{Σ,Λ}/A_cris,log,PD}, which is canonically and Frobenius-equivariantly identified in the derived category with RΓ_logcrys((Spf R)_{O_C/p}/A_cris) (CK Proposition 5.23, (5.31.5)). The identification is compatible with enlarging (Σ,Λ) and functorial in R for p-adically formally étale maps R→R′, and under it the map to RΓ_logdR(Spf R/O_C) is induced by D_{Σ,Λ}→R (CK (5.23.2)). After sheafification on 𝔛_ét the model represents Ru_*O_{𝔛_{O_C/p}/A_cris,logcrys}.
API Semistable.allCoordinatesLogCrystalline.poincare [equivalence]: For each (Σ,Λ), K_{D_{Σ,Λ}}(D_τ)=Ω•_{D_{Σ,Λ}/A_cris,log,PD} is identified with RΓ_logcrys((Spf R)_{O_C/p}/A_cris) by the log PD de Rham comparison for the PD smooth envelope (CK (5.23.1), (5.23.3)); after sheafification the model identifies with the imported log crystalline pushforward Ru_*O.
API Semistable.allCoordinatesLogCrystalline.refine [functoriality]: Envelope refinement gives coherent maps of these complexes and composes with chart restriction.
API Semistable.allCoordinatesLogCrystalline.frobenius [simp]: On degree j forms the map is p^jφ, agreeing with log crystalline Frobenius.
API Semistable.allCoordinatesLogCrystalline.de_rham [compatibility]: Under the identification, the map RΓ_logcrys((Spf R)_{O_C/p}/A_cris)→RΓ_logdR(Spf R/O_C) is the map Ω•_{D_{Σ,Λ}/A_cris,log,PD}→Ω•_{Spf(R)/O_C,log} induced by D_{Σ,Λ}→R (CK (5.23.2)).
example Semistable.allCoordinatesLogCrystalline.point [degenerate]: For R=O_C and the index Σ=∅, Λ={λ} with d=0, the term is A_cris in degree 0.
example Semistable.allCoordinatesLogCrystalline.node [computation]: For one node chart the degree-one forms have the relation dlogX₀+dlogX₁=0.
example Semistable.allCoordinatesLogCrystalline.smooth [compatibility]: If R is smooth and every λ∈Λ has r_λ=0, then the exactification is trivial (Q→P_{λ₀} is an isomorphism), A□_{Σ,Λ} is a (p,μ)-completed torus over A_inf, D_{Σ,Λ} is the p-completed divided power envelope of R/p in it over A_cris, and K_{D_{Σ,Λ}}(D_τ) is its PD de Rham complex in the coordinates X_τ∂/∂X_τ. For Σ as in BMS1 §12.2 the projection to the torus on Σ maps the corresponding complex for Σ alone into it. This is a comparison map, not an identification with the smooth all-coordinates complex, and it is not a statement of CK.
example Semistable.allCoordinatesLogCrystalline.torus_point [computation]: For R=O_C, Σ={σ} with t_σ↦u∈O_C^× and Λ={λ} with d=0, the complex K_{D_{Σ,Λ}}(∂/∂log X_σ) is the two-term complex D_{Σ,Λ}→D_{Σ,Λ} with D_{Σ,Λ} the completed divided power polynomial algebra over A_cris in X_σ−[u^♭]; it is quasi-isomorphic to A_cris in degree 0 but not concentrated in degree 0.
Prerequisites: AInfCohomology:AI.6/all-coordinates-pd, AInfCohomology:AI.6/log-derivations, CrystallineCohomology:CR.5, AInfCohomology:AI.1, EnhancedDerivedSheaves:E1/presentability-and-derived-tensor, AInfCohomology:AI.6/all-coordinates

AInfCohomology:AI.6/all-coordinates-map
Semistable.allCoordinatesComparisonMap — construction, not typed
Statement: Use the canonical map D_{Σ,Λ}→A_cris(R_{Σ,Λ,∞}) of CK §5.38, including its logarithmic ratio variables: it is the p-adic completion of the divided power morphism D_{jλ₀}→A_cris^0(R_{Σ,Λ,∞}) of CK Lemma 5.37, which sends the exactification units to Teichmüller units of A_inf(R_{Σ,Λ,∞}); it does not depend on λ₀, is Δ_{Σ,Λ}- and Frobenius-equivariant, is compatible with D_{Σ,Λ}→R and θ, and restricts to maps D^{(m)}_{Σ,Λ}→A_cris^(m)(R_{Σ,Λ,∞}) for m≥p (CK (5.38.1)–(5.38.3)). For m≥p² the maps (id, ∑_{n≥1}(log([ε]))^n/n!·D_τ^{n−1}), D_τ=∂/∂log(X_τ), define a Frobenius-equivariant morphism K_{D^{(m)}_{Σ,Λ}}(D_τ)→η_μK_{D^{(m)}_{Σ,Λ}}(δ_τ−1), where the target is the subcomplex given by formula (1.7.3) of CK (CK Proposition 5.34). Composing with η_μ of the maps of Koszul complexes induced by (5.38.3), and passing to the termwise colimit over m, the termwise p-adic completion and the filtered colimit over (Σ,Λ), gives the comparison map from the all-coordinates log crystalline model to the all-coordinates AΩ model (CK (5.38.4)). It is a map of complexes that commutes with φ, with refinements and with p-adically formally étale maps R→R′. It is not a map of differential graded algebras, and no multiplicativity is asserted.
API Semistable.allCoordinatesComparisonMap.coefficients [data]: The degree-zero map is the ring map D_{Σ,Λ}→A_cris(R_{Σ,Λ,∞}) of CK (5.38.1), the p-adic completion of the divided power morphism D_{jλ₀}→A_cris^0(R_{Σ,Λ,∞}); it is independent of λ₀, Δ_{Σ,Λ}- and Frobenius-equivariant, compatible with D_{Σ,Λ}→R and θ, and restricts to D^{(m)}_{Σ,Λ}→A_cris^(m)(R_{Σ,Λ,∞}) for m≥p.
API Semistable.allCoordinatesComparisonMap.frobenius [compatibility]: The comparison intertwines p^jφ on j-forms with the AΩ Frobenius.
API Semistable.allCoordinatesComparisonMap.natural [functoriality]: The map commutes with all-coordinates refinement and with p-adically formally étale maps R→R′.
API Semistable.allCoordinatesComparisonMap.units [simp]: Under D_{jλ₀}→A_cris^0(R_{Σ,Λ,∞}) each X_τ maps to the Teichmüller lift [t_τ^♭] of the system of p-power roots of t_τ and, in the nonsmooth case, U_{λ,λ₀,y} maps to [u^♭_{λ,λ₀,y}], where u^♭_{λ,λ₀,y} is the system of units t_{λ,i_λ(y)}^{1/p^m}/t_{λ₀,i_{λ₀}(y)}^{1/p^m} of R_{Σ,Λ,∞} (CK Lemma 5.37).
API Semistable.allCoordinatesComparisonMap.exponential [relation]: For m≥p², δ_τ=∑_{n≥0}(log([ε]))^n/n!·D_τ^n as endomorphisms of D^{(m)}_{Σ,Λ} (CK Lemma 5.33).
example Semistable.allCoordinatesComparisonMap.point [degenerate]: For R=O_C and the index Σ=∅, Λ={λ} with d=0, both models are A_cris in degree 0 and the map is the identity of A_cris.
example Semistable.allCoordinatesComparisonMap.node [computation]: For λ∈Λ and m≥p² the square (5.39.2) commutes: the comparison map precomposed with the map of Koszul complexes induced by A_cris^(m)(R)_λ→D^{(m)}_{Σ,Λ} equals the unit-operator exponential comparison (5.16.2) of local-crystalline followed by the map induced by the subcover R_{λ,∞}⊂R_{Σ,Λ,∞}.
example Semistable.allCoordinatesComparisonMap.de_rham [compatibility]: The square formed by D_{Σ,Λ}→R (CK (5.22.3)), the degree-zero map D_{Σ,Λ}→A_cris(R_{Σ,Λ,∞}), θ: A_cris(R_{Σ,Λ,∞})→R_{Σ,Λ,∞} and R→R_{Σ,Λ,∞} commutes (CK (5.38.2)). The agreement of the whole map with the log de Rham specialization, including its differential, is the content of crystalline-de-rham-square and is not part of this construction.
example Semistable.allCoordinatesComparisonMap.torus_generator [computation]: For σ∈Σ the degree-zero map sends X_σ to [t_σ^♭]∈A_inf(R_{Σ,Λ,∞}), on which δ_σ acts by multiplication by [ε]; correspondingly ∑_{n≥0}(log([ε]))^n/n!·D_σ^n(X_σ)=[ε]·X_σ in D^{(m)}_{Σ,Λ} for m≥p².
Prerequisites: AInfCohomology:AI.6/all-coordinates-pd, AInfCohomology:AI.6/all-coordinates-aomega, AInfCohomology:AI.6/all-coordinates-log-crystalline, AInfCohomology:AI.6/local-crystalline, CrystallineCohomology:CR.0, AInfCohomology:AI.6/all-coordinates, AInfCohomology:AI.6/log-exactification, PerfectoidSpaces:P3, AInfCohomology:AI.0:integral, AInfCohomology:AI.6/finite-level-acris

AInfCohomology:AI.6/absolute-crystalline
Semistable.absoluteCrystallineComparison — theorem, not typed
Statement: The all-coordinates comparison morphism is a quasi-isomorphism: for every index (Σ,Λ) the map (5.38.4) of all-coordinates-map is a quasi-isomorphism (CK Proposition 5.39). It sheafifies to a Frobenius-equivariant isomorphism Ru_*O_{𝔛_{O_C/p}/A_cris,logcrys}≃AΩ_𝔛⊗̂^L_{A_inf}A_cris in the derived category of sheaves of A_cris-modules on 𝔛_ét (CK Theorem 5.4, (5.40.1)), where u is the projection from the log crystalline topos of 𝔛_{O_C/p} over A_cris. The tensor is derived p-completed: AΩ_𝔛⊗̂^L_{A_inf}A_cris=Rlim_n(AΩ_𝔛⊗^L_{A_inf}A_cris/p^n). By construction the isomorphism is compatible with étale localisation on 𝔛. Multiplicativity, and functoriality for morphisms of semistable formal schemes that are not étale, are not asserted.
Prerequisites: AInfCohomology:AI.6/all-coordinates-map, AInfCohomology:AI.6/local-crystalline, AInfCohomology:AI.6/all-coordinates-log-crystalline, CrystallineCohomology:CR.5, EnhancedDerivedSheaves:E1/presentability-and-derived-tensor, EnhancedDerivedSheaves:E4/completed-sheaf-tensor, AInfCohomology:AI.6/aomega, AInfCohomology:AI.6/all-coordinates-aomega, AInfCohomology:AI.6/all-coordinates-pd, AInfCohomology:AI.6/all-coordinates, EnhancedDerivedSheaves:E4, AInfCohomology:AI.6/aomega-sheaf-completeness

AInfCohomology:AI.6/crystalline-de-rham-square
Semistable.crystallineDeRhamSquare — theorem, not typed
Statement: The triangle formed by the isomorphism Ru_*O_{𝔛_{O_C/p}/A_cris,logcrys}→AΩ_𝔛⊗̂^L_{A_inf}A_cris of absolute-crystalline, the de Rham specialization AΩ_𝔛⊗̂^L_{A_inf}A_cris→Ω•_{𝔛/O_C,log} of log-de-rham (CK (4.17.1)) and the map Ru_*O_{𝔛_{O_C/p}/A_cris,logcrys}→Ω•_{𝔛/O_C,log} induced by CR.5’s log crystalline-to-log de Rham comparison Ru_*O⊗̂^L_{A_cris,θ}O_C≅Ω•_{𝔛/O_C,log} commutes in the derived category of sheaves on 𝔛_ét (CK Proposition 5.41). Equivalently, after A_cris→O_C, absolute-crystalline agrees with log-de-rham and CR.5’s comparison. This is an equality of maps of complexes, rather than only an equality of cohomology ranks. On the presheaf complexes of all-coordinates both composites are the unique map of differential graded algebras Ω•_{D_{Σ,Λ}/A_cris,log,PD}→Ω•_{Spf(R)/O_C,log} that is D_{Σ,Λ}→R in degree 0; the comparison isomorphism of absolute-crystalline itself is not asserted to be multiplicative.
Prerequisites: AInfCohomology:AI.6/absolute-crystalline, AInfCohomology:AI.6/all-coordinates-map, AInfCohomology:AI.6/log-de-rham, CrystallineCohomology:CR.5, AInfCohomology:AI.0:integral, AInfCohomology:AI.6/hodge-tate-comparison, AInfCohomology:AI.6/aomega-frobenius, AInfCohomology:AI.6/all-coordinates-aomega, AInfCohomology:AI.6/all-coordinates-log-crystalline, AInfCohomology:AI.6/all-coordinates-pd, AInfCohomology:AI.1/bockstein-reduction, AInfCohomology:AI.1

AInfCohomology:AI.6/global-crystalline
Semistable.globalCrystallineComparison — theorem, not typed
Statement: For qcqs 𝔛 there are Frobenius-equivariant identifications RΓ_Ainf(𝔛)⊗̂^L_{A_inf}A_cris≃RΓ_logcrys(𝔛_{O_C/p}/A_cris) and RΓ_Ainf(𝔛)⊗̂^L_{A_inf}W(k̄)≃RΓ_logcrys(𝔛_{k̄}/W(k̄)), where W(k̄) carries the pullback of the log structure of A_cris, associated to Q≥0→W(k̄), 0≠q↦0, 0↦1. If 𝔛 is proper over O_C the same identifications hold with the ordinary derived tensors, and H^i_logcrys(𝔛_{O_C/p}/A_cris)[1/p] is finite free over A_cris[1/p] for every i (CK Corollary 5.43). The W(k̄) log base first uses Q≥0→W(k̄); the arithmetic normalization is the next node.
Prerequisites: AInfCohomology:AI.6/absolute-crystalline, AInfCohomology:AI.6/proper-perfectness, CrystallineCohomology:CR.5, CrystallineCohomology:CR.6, AInfCohomology:AI.0:integral, EnhancedDerivedSheaves:E1/presentability-and-derived-tensor, EnhancedDerivedSheaves:E4/completed-sheaf-tensor, AInfCohomology:AI.6/aomega, AInfCohomology:AI.6/divisorial-log, EnhancedDerivedSheaves:E4

AInfCohomology:AI.6/hyodo-kato-interface
Semistable.hyodoKatoInterface — theorem, not typed
Statement: Let 𝔛₀ be a proper arithmetic semistable model over O_K, with perfect residue field k₀, and 𝔛=𝔛₀⊗̂_{O_K}O_C. There are Frobenius-equivariant identifications: (i) RΓ_Ainf(𝔛)⊗^L_{A_inf}W(k̄)≃RΓ_logcrys(𝔛_{k̄}/W(k̄)) for the log base Q≥0→W(k̄) (CK (5.43.2)); (ii) RΓ_logcrys(𝔛_{k̄}/W(k̄))≃RΓ_logcrys((𝔛₀)_{k̄}/W(k̄)) for the log base ℕ→W(k̄), 1↦0 (CK Remark 5.44, (5.44.1)), the change of log structure being ℕ→Q≥0, 1↦v(π_K) for a uniformizer π_K of K; (iii) RΓ_logcrys((𝔛₀)_{k̄}/W(k̄))≃RΓ_logcrys((𝔛₀)_{k₀}/W(k₀))⊗^L_{W(k₀)}W(k̄), where the arithmetic log base is ℕ→W(k₀), 1↦0. Identification (iii) is not stated in CK, which has only its consequence (8.8.1) for the Galois invariants of one cohomology group under the freeness hypotheses of Theorem 8.7; it is base change of log crystalline cohomology of a fine, log smooth log scheme of Cartier type along the map of log divided power bases W(k₀)→W(k̄). So the W(k̄) specialization identifies with RΓ_logcrys((𝔛₀)_{k₀}/W(k₀))⊗^L_{W(k₀)}W(k̄). If 𝔛₀ is only quasi-compact and quasi-separated, (i)–(iii) hold with p-completed tensor products throughout. (iv) (CK Proposition 9.2, (9.2.2)) For proper 𝔛₀: RΓ_logcrys((𝔛₀)_{k₀}/W(k₀))⊗^L_{W(k₀)}B_st⁺≃RΓ_logcrys(𝔛_{O_C/p}/A_cris)⊗^L_{A_cris}B_st⁺, compatibly with φ, which acts on both factors on each side, and with N, which is N⊗1+1⊗N on the left and the monodromy of B_st⁺ on the right, with Nφ=pφN; the identification is G_K-equivariant (CK §9.4). The rational comparison with étale cohomology over B_st (CK Theorem 9.5) is not part of this statement.
Prerequisites: AInfCohomology:AI.6/global-crystalline, CrystallineCohomology:CR.5, CrystallineCohomology:CR.6, AInfCohomology:AI.0:integral, AInfCohomology:AI.6/divisorial-log, PadicHodgeTheory:R06.1/semistable-period-ring

AInfCohomology:AI.6/bdr-cohomology-etale-embeddings
Semistable.bdrCohomologyEtaleEmbeddings — theorem, not typed
Statement: Let X be a smooth adic space over C. (1) Étale topology (CK §6.2). The analytic, respectively étale, topology of X has a basis of affinoids Spa(A,A°) that admit a map to a torus Spa(C⟨T_1^{±1},…,T_d^{±1}⟩,O_C⟨T_1^{±1},…,T_d^{±1}⟩) which is a composite of a rational embedding, a finite étale map and a rational embedding, and a finite set Ψ⊂(A°)^× with C⟨(X_u^{±1})_{u∈Ψ}⟩→A, X_u↦u, surjective. For such data put B_dR⁺⟨(X_u^{±1})_{u∈Ψ}⟩=lim_n (B_dR⁺/ξⁿ)⟨(X_u^{±1})_{u∈Ψ}⟩, let s be its surjection onto A, D_Ψ(A)=lim_n B_dR⁺⟨(X_u^{±1})_{u∈Ψ}⟩/(Ker s)ⁿ, let Ω^•_{D_Ψ(A)/B_dR⁺} be the Koszul complex of the commuting derivations ∂/∂log X_u=X_u·∂/∂X_u of D_Ψ(A), and Ω^•_{A/B_dR⁺}=colim_Ψ Ω^•_{D_Ψ(A)/B_dR⁺}. Let RΓ_crys(X/B_dR⁺), respectively RΓ_crys(X_ét/B_dR⁺), be the hypercohomology of the associated complex of sheaves for the analytic, respectively étale, topology; the first agrees with the complex of BMS1 §13 supplied by CP.3. Then both are derived ξ-adically complete (6.2.5); their reductions modulo ξ are canonically and compatibly identified with RΓ(X,Ω^{•,cont}_{X/C})=RΓ_dR(X/C) and RΓ(X_ét,Ω^{•,cont}_{X/C}) (6.2.6); and pullback is an isomorphism RΓ_crys(X/B_dR⁺)≃RΓ_crys(X_ét/B_dR⁺) (6.2.7). (2) Non-unit coordinates (CK §§6.3–6.4). The étale topology of X has a basis of affinoids Spa(A,A°) with the following data: an étale map (6.3.1) to Spa(C⟨T_0,…,T_r,T_{r+1}^{±1},…,T_d^{±1}⟩/(T_0⋯T_r−p^q), O_C⟨T_0,…,T_r,T_{r+1}^{±1},…,T_d^{±1}⟩/(T_0⋯T_r−p^q)) for some d≥r≥0 and q∈Q_{>0}; a finite extension K of W(k̄)[1/p] in C with ring of integers O∋p^q and a finite type O[T_0,…,T_r,T_{r+1}^{±1},…,T_d^{±1}]/(T_0⋯T_r−p^q)-algebra A_0, étale after inverting p, O-flat, normal, with no connected component of Spec A_0 on which p is a unit, such that (6.3.1) is the base change to C of an étale map (6.3.2) from Spa(Â_0[1/p],Â_0) and A_0⊗̂_O O_C≃A° (6.3.3); and finite sets Ψ_0⊂(Â_0)^×, Ξ_0⊂Â_0∩(Â_0[1/p])^× with K⟨(x_u^{±1})_{u∈Ψ_0},(x_a)_{a∈Ξ_0}⟩→Â_0[1/p] surjective (6.3.4). For finite Ψ⊂(A°)^× and Ξ⊂A°∩A^× with C⟨(X_u^{±1})_{u∈Ψ},(X_a)_{a∈Ξ}⟩→A surjective (6.3.5), let D_{Ψ,Ξ,n}(A)=B_dR⁺⟨(X_u^{±1})_{u∈Ψ},(X_a)_{a∈Ξ}⟩/(Ker s)ⁿ, D_{Ψ,Ξ}(A)=lim_n D_{Ψ,Ξ,n}(A), and let Ω^•_{D_{Ψ,Ξ}(A)/B_dR⁺} be the Koszul complex of the derivations ∂/∂log X_a, a∈Ψ∪Ξ. Let B_dR⁺⊗̂_K A_0[1/p]=lim_n(((B_dR⁺/ξⁿ)_0⊗̂_O A_0)[1/p]), where (B_dR⁺/ξⁿ)_0 is the A_inf/ξⁿ-subalgebra of B_dR⁺/ξⁿ generated by the image of O; it has no ξ-torsion, is ξ-adically complete and reduces to A modulo ξ (6.3.6). (a) Lemma 6.3.8: suppose that Ψ, respectively Ξ, contains the images of the T_i for r+1≤i≤d, respectively 1≤i≤r, under a coordinate map (6.3.1), and that Ψ and Ξ are large enough in the sense of CK §6.4, namely: for some choice of (Ψ_0,Ξ_0) as in (6.3.4) such that Ψ_0, respectively Ξ_0, contains the images of the T_i for r+1≤i≤d, respectively 1≤i≤r, under (6.3.2), Ψ contains the image of Ψ_0 in A° and Ξ contains the image of Ξ_0. Then D_{Ψ,Ξ}(A)≃(B_dR⁺⊗̂_K A_0[1/p])[[(X_a−ã)_{a∈(Ψ∪Ξ)∖{T_1,…,T_d}}]] (6.3.9), where ã is a fixed lift of a in lim_n((B_dR⁺/ξⁿ)_0⊗̂_O A_0); in particular D_{Ψ,Ξ}(A) has no nonzero ξ-torsion and is ξ-adically complete. (b) For such Ψ and Ξ, Ω^•_{D_{Ψ,Ξ}(A)/B_dR⁺}/ξ≃Ω^{•,cont}_{A/C} in the derived category, compatibly with enlarging Ψ and Ξ (6.3.10), and for Ψ′⊇Ψ, Ξ′⊇Ξ the map Ω^•_{D_{Ψ,Ξ}(A)/B_dR⁺}→Ω^•_{D_{Ψ′,Ξ′}(A)/B_dR⁺} is a quasi-isomorphism. (c) If Spa(A,A°) also belongs to the basis of (1), the map Ω^•_{A/B_dR⁺}→colim_{Ψ,Ξ}Ω^•_{D_{Ψ,Ξ}(A)/B_dR⁺} is a quasi-isomorphism, functorial in Spa(A,A°) (6.3.11). Such affinoids form a basis of X_ét, so the hypercohomology of the sheafification of Spa(A,A°)↦colim_{Ψ,Ξ}Ω^•_{D_{Ψ,Ξ}(A)/B_dR⁺} is RΓ_crys(X_ét/B_dR⁺)≃RΓ_crys(X/B_dR⁺), and under this identification the maps (6.3.10) recover (6.2.6) ((6.3.12)). No multiplicative structure on these complexes is asserted.
Prerequisites: CohomologyComparisons:CP.3, AInfCohomology:AI.0:period-comparison, PadicHodgeTheory:R06.1/acris-embedding-into-bdr-plus, PadicHodgeTheory:R06.1/bdr-plus-complete-dvr, PadicHodgeTheory:R06.1/algebraic-closure-in-bdr-plus, AdicEtaleGeometry:A1, AdicSpacesPartII:R3

AInfCohomology:AI.6/bdr-comparison-map
Semistable.bdrComparisonMap — construction, not typed
Statement: Let 𝔛 be as in CK §1.5; its adic generic fibre X_C^ad is then smooth over C. Let RΓ_crys(X_C^ad/B_dR⁺) be CP.3’s B_dR⁺-cohomology (BMS1 §13), computed in the étale topology with the rings D_{Ψ,Ξ}(A) of bdr-cohomology-etale-embeddings. For an affine Spf R in 𝔛_ét with all-coordinates data (Σ,Λ) as in CK §5.17, put A=R[1/p], Ξ=⋃_{λ∈Λ}{t_{λ,1},…,t_{λ,r_λ}} and Ψ={t_σ}_{σ∈Σ}∪⋃_{λ∈Λ}{t_{λ,r_λ+1},…,t_{λ,d}}, enlarged by the images of the units Ψ₀ obtained by descending the closed immersion (5.17.2) to a finite extension of W(k̄)[1/p]; the coordinates t_{λ,0} are omitted. CK §6.5 constructs continuous ring maps D_{Σ,Λ}→D_{Ψ,Ξ}(A) over A_cris→B_dR⁺ (6.5.5), independent of the auxiliary chart λ₀, compatible with the maps to R[1/p] and with the logarithmic derivations ∂/∂log X_σ and ∂/∂log X_{λ,i}, 1≤i≤d. The induced maps of Koszul complexes (6.5.6) are compatible with enlarging (Σ,Λ) and (Ψ,Ξ) and with replacing R by a p-adically formally étale R-algebra; after sheafification they give the map (6.5.1) RΓ_logcrys(𝔛_{O_C/p}/A_cris)→RΓ_crys(X_C^ad/B_dR⁺) over A_cris→B_dR⁺, hence a B_dR⁺-linear map RΓ_logcrys(𝔛_{O_C/p}/A_cris)⊗^L_{A_cris}B_dR⁺→RΓ_crys(X_C^ad/B_dR⁺). It sits in the commutative square (6.5.7) with the reduction RΓ_logcrys(𝔛_{O_C/p}/A_cris)→RΓ_logdR(𝔛/O_C) of (5.23.2), the reduction modulo ξ of (6.2.6) and the map RΓ_logdR(𝔛/O_C)→RΓ_dR(X_C^ad/C) to the generic fibre. If 𝔛 is proper, compose with global-crystalline’s RΓ_Ainf(𝔛)⊗^L_{A_inf}A_cris≃RΓ_logcrys(𝔛_{O_C/p}/A_cris) to obtain the A_inf-to-B_dR⁺ map RΓ_Ainf(𝔛)⊗^L_{A_inf}B_dR⁺→RΓ_crys(X_C^ad/B_dR⁺). This is a comparison to CP.3’s object, not its construction. Naturality for arbitrary morphisms of models, Galois equivariance and multiplicativity of the map are not asserted.
API Semistable.bdrComparisonMap.reduce [compatibility]: The square (6.5.7) commutes: (6.5.1) followed by the reduction modulo ξ, RΓ_crys(X_C^ad/B_dR⁺)→RΓ_dR(X_C^ad/C) of (6.2.6), equals the reduction RΓ_logcrys(𝔛_{O_C/p}/A_cris)→RΓ_logdR(𝔛/O_C) of (5.23.2) followed by the map RΓ_logdR(𝔛/O_C)→RΓ_dR(X_C^ad/C) to the generic fibre.
API Semistable.bdrComparisonMap.natural [functoriality]: The local maps (6.5.5) and (6.5.6) are compatible with enlarging (Σ,Λ) and (Ψ,Ξ) and with replacing R by a p-adically formally étale R-algebra R′ with data as in CK §5.17; this is what makes them glue to (6.5.1). Compatibility with arbitrary morphisms of models, and with the semilinear action of Gal(K̄/K) on a model defined over O_K, is not asserted.
API Semistable.bdrComparisonMap.coefficients [data]: The map is induced by the common A_inf→A_cris→B_dR⁺ coefficient maps, not an arbitrary isomorphism of equal-rank modules.
API Semistable.bdrComparisonMap.local [data]: For data (Σ,Λ) on Spf R and (Ψ,Ξ) as in (6.5.2), the map D_{Σ,Λ}→D_{Ψ,Ξ}(R[1/p]) of (6.5.5) is a continuous A_cris-algebra map sending the images of X_σ, X_{λ,i} (1≤i≤d) and X_{λ,0} to X_{t_σ}, X_{t_{λ,i}} and [(p^{1/p^∞})^{q_λ}]/(X_{t_{λ,1}}⋯X_{t_{λ,r_λ}}); it commutes with the maps D_{Σ,Λ}→R and D_{Ψ,Ξ}(R[1/p])→R[1/p] and intertwines ∂/∂log X_σ and ∂/∂log X_{λ,i} with ∂/∂log X_{t_σ} and ∂/∂log X_{t_{λ,i}}.
example Semistable.bdrComparisonMap.point [degenerate]: For 𝔛=Spf O_C (d=0, Σ=∅, one chart with r=0) both sides are concentrated in degree 0: RΓ_logcrys(Spec(O_C/p)/A_cris)=A_cris and RΓ_crys(Spa(C,O_C)/B_dR⁺)=B_dR⁺. The map (6.5.1) is the inclusion A_cris→B_dR⁺ of CK §6.1, and its B_dR⁺-linearisation is the identity of B_dR⁺.
example Semistable.bdrComparisonMap.good_reduction [compatibility]: For 𝔛 proper and smooth over O_C (the log structure is then pulled back from the base, so Ω^j_{𝔛/O_C,log}=Ω^j_{𝔛/O_C}), the reduction modulo ξ of the B_dR⁺-linear map is identified by (5.23.2) and (6.2.6) with the canonical isomorphism RΓ_dR(𝔛/O_C)⊗_{O_C}C≃RΓ_dR(X_C^ad/C); hence the map is an isomorphism, as in BMS1 Proposition 13.23. For the p-adic completion of P¹_{O_C} both sides have cohomology B_dR⁺, 0, B_dR⁺ in degrees 0, 1, 2. Equality with the map of BMS1 Proposition 13.23 is not asserted: BMS1 does not write that map down.
example Semistable.bdrComparisonMap.node [compatibility]: On the chart R□=O_C{t_0,t_1}/(t_0t_1−p^q), with A=R□[1/p]: Ω¹_{R□/O_C,log} is free on dlog t_1=−dlog t_0, Ω^{1,cont}_{A/C} is free on dT_1/T_1=−dT_0/T_0, and the lower arrow of (6.5.7) is in degree 1 the R□-linear map dlog t_1↦dT_1/T_1. So the relation dlog t_0+dlog t_1=0 goes to dT_0/T_0+dT_1/T_1=0, and the arrow becomes an isomorphism after inverting p. On the B_dR⁺ side t_1 is a coordinate in Ξ and t_0 is omitted.
Prerequisites: AInfCohomology:AI.6/global-crystalline, AInfCohomology:AI.6/all-coordinates, AInfCohomology:AI.6/log-exactification, AInfCohomology:AI.6/all-coordinates-pd, AInfCohomology:AI.6/all-coordinates-log-crystalline, AInfCohomology:AI.6/bdr-cohomology-etale-embeddings, CohomologyComparisons:CP.3, AInfCohomology:AI.0:period-comparison, EnhancedDerivedSheaves:E1/presentability-and-derived-tensor, PadicHodgeTheory:R06.1/acris-embedding-into-bdr-plus, PadicHodgeTheory:R06.1/bdr-plus-complete-dvr, PadicHodgeTheory:R06.1/algebraic-closure-in-bdr-plus, AdicEtaleGeometry:A1

AInfCohomology:AI.6/bdr-comparison
Semistable.bdrComparison — theorem, not typed
Statement: For proper 𝔛, bdr-comparison-map is an equivalence RΓ_logcrys(𝔛_{O_C/p}/A_cris)⊗^L_{A_cris}B_dR⁺≃RΓ_crys(X_C^ad/B_dR⁺), and hence RΓ_Ainf(𝔛)⊗^L_{A_inf}B_dR⁺≃RΓ_crys(X_C^ad/B_dR⁺). In every degree it gives H^i_Ainf(𝔛)⊗_{A_inf}B_dR⁺≃H^i_crys(X_C^ad/B_dR⁺), a finite free B_dR⁺-module. Modulo ξ the second equivalence is compatible with the identifications of both sides with RΓ_dR(X_C^ad/C): on the source the log de Rham specialization (4.18.1) of log-de-rham followed by RΓ_logdR(𝔛/O_C)⊗_{O_C}C≃RΓ_dR(X_C^ad/C), on the target the reduction (6.2.6).
Prerequisites: AInfCohomology:AI.6/bdr-comparison-map, AInfCohomology:AI.6/proper-perfectness, AInfCohomology:AI.6/log-de-rham, AInfCohomology:AI.6/global-crystalline, AInfCohomology:AI.6/crystalline-de-rham-square, AInfCohomology:AI.6/bdr-cohomology-etale-embeddings, CohomologyComparisons:CP.3, CrystallineCohomology:CR.5, AInfCohomology:AI.0:period-comparison, AInfCohomology:AI.5, EnhancedDerivedSheaves:E4/mod-ideal-detection, PadicHodgeTheory:R06.1/acris-embedding-into-bdr-plus, PadicHodgeTheory:R06.1/bdr-plus-complete-dvr, PadicHodgeTheory:R06.1/algebraic-closure-in-bdr-plus, AdicSpacesPartII:R3

AInfCohomology:AI.6/etale-comparison
Semistable.etaleComparison — theorem, not typed
Statement: If 𝔛 is proper over O_C, then RΓ_Ainf(𝔛)⊗^L_{A_inf}A_inf[1/μ]≃RΓ_ét(X_C^ad,Z_p)⊗^L_{Z_p}A_inf[1/μ] (CK Theorem 2.3); both tensor products are ordinary derived tensor products. The identification is induced by the map RΓ_ét(X_C^ad,Z_p)⊗^L_{Z_p}A_inf→RΓ_proét(X_C^ad,A_inf,X) coming from the inclusion of Z_p in A_inf,X, whose cone has cohomology killed by W(m^♭), and by AΩ_𝔛⊗^L A_inf[1/μ]≅Rν_*(A_inf,X)⊗^L A_inf[1/μ]; it is compatible with Frobenius, acting through A_inf,X on the left and through A_inf on the right. It is natural for isomorphisms lying over continuous automorphisms of O_C (aomega, API item semilinear); in particular for 𝔛=𝔛₀⊗̂_{O_K}O_C it is G_K-equivariant, G_K acting on the right side through both factors, which CK use in the proof of Theorem 8.7. Compatibility with products is not asserted. For non-proper 𝔛 it fails in general. It is generic-fibre p-adic étale cohomology, not special-fibre étale cohomology and not mere p-inversion.
Prerequisites: AInfCohomology:AI.6/aomega, AInfCohomology:AI.3, AInfCohomology:AI.0:integral, EnhancedDerivedSheaves:E1/presentability-and-derived-tensor, AdicEtaleGeometry:A1

AInfCohomology:AI.6/etale-bdr-agreement
Semistable.etaleBdrAgreement — theorem, not typed
Statement: Let 𝔛 be proper. Let c: RΓ_crys(X_C^ad/B_dR⁺)→RΓ_ét(X_C^ad,Z_p)⊗_{Z_p}B_dR⁺ be the map of BMS1 (proof of Theorem 13.1) supplied by CP.3; it becomes an isomorphism after ⊗_{B_dR⁺}B_dR, the identification (6.7.1), and is not asserted to be an isomorphism over B_dR⁺. Then the diagram of CK Proposition 6.8 commutes: the composite of bdr-comparison-map’s (6.5.1), of c and of the isomorphism RΓ_ét(X_C^ad,Z_p)⊗^L_{Z_p}B_dR⁺≃RΓ_ét(X_C^ad,A_inf,X)⊗^L_{A_inf}B_dR⁺ induced by (2.3.2) equals the composite of the isomorphism RΓ_logcrys(𝔛_{O_C/p}/A_cris)≃RΓ_Ainf(𝔛)⊗^L_{A_inf}A_cris ((5.43.2) of global-crystalline, the global form of absolute-crystalline’s (5.40.1), which is the label in CK’s diagram) and the map to RΓ_ét(X_C^ad,A_inf,X)⊗^L_{A_inf}B_dR⁺ induced by Lη_μ→id (BMS1 Lemma 6.10). Consequently, after base change to B_dR, the identification RΓ_Ainf(𝔛)⊗^L_{A_inf}B_dR≃RΓ_ét(X_C^ad,Z_p)⊗^L_{Z_p}B_dR obtained from etale-comparison equals the one obtained from bdr-comparison and (6.7.1). If moreover X_C^ad≃X₀⊗̂_K C for a proper smooth adic space X₀ over K, with K as in the hypotheses, then under RΓ_crys(X_C^ad/B_dR⁺)≃RΓ_dR(X₀/K)⊗_K B_dR⁺ ((6.2.8), using the canonical K→B_dR⁺) the identification (6.7.1) becomes the de Rham comparison (6.7.2) RΓ_ét(X_C^ad,Z_p)⊗_{Z_p}B_dR≃RΓ_dR(X₀/K)⊗_K B_dR; when C is the completion of K̄ it is Gal(K̄/K)-equivariant, recovers Scholze’s comparison isomorphism and is compatible with filtrations (the valuation filtration of B_dR, the Hodge filtration on RΓ_dR(X₀/K) and the trivial filtration on étale cohomology).
Prerequisites: AInfCohomology:AI.6/etale-comparison, AInfCohomology:AI.6/bdr-comparison, AInfCohomology:AI.6/bdr-comparison-map, AInfCohomology:AI.6/bdr-cohomology-etale-embeddings, AInfCohomology:AI.6/all-coordinates-map, AInfCohomology:AI.6/absolute-crystalline, AInfCohomology:AI.3, CohomologyComparisons:CP.3, AInfCohomology:AI.6/finite-level-acris, AInfCohomology:AI.1, AInfCohomology:AI.0:period-comparison, AInfCohomology:AI.6/global-crystalline

AInfCohomology:AI.6/cohomological-bkf
Semistable.cohomologicalBKF — theorem, not typed
Statement: For proper 𝔛, each H^i_Ainf(𝔛) is finitely presented over A_inf and finite free after p-inversion, with the Frobenius isomorphism after ξ̃-inversion required by AI.2. If 𝔛_k̄ has dimension at most d the module is zero outside 0,…,2d (proper-perfectness; CK Theorem 7.4 assumes pure dimension d). If 𝔛=𝔛₀⊗̂_{O_K}O_C for a formal O_K-scheme 𝔛₀, with K as in CK §8.1, the semilinear action of G_K on H^i_Ainf(𝔛) (aomega, API item semilinear) commutes with the Frobenius isomorphism (CK §8.3). These are finitely presented BKF modules, with possible p-torsion, not automatically finite free BKF lattices.
Prerequisites: AInfCohomology:AI.6/proper-perfectness, AInfCohomology:AI.6/etale-comparison, AInfCohomology:AI.6/global-crystalline, AInfCohomology:AI.6/log-de-rham, AInfCohomology:AI.6/aomega-frobenius, AInfCohomology:AI.5, AInfCohomology:AI.2, AInfCohomology:AI.6/aomega

AInfCohomology:AI.6/degreewise-specializations
Semistable.degreewiseSpecializations — theorem, not typed
Statement: For proper 𝔛 and every i, H_A^i⊗_{A_inf}W(C^♭)≃H_ét^i(X_C,Z_p)⊗_{Z_p}W(C^♭). There are exact sequences 0→H_A^i⊗_{θ}O_C→H_logdR^i→H_A^{i+1}[ξ]→0 and, Frobenius-equivariantly, 0→H_A^i⊗W(k̄)→H_logcrys^i→Tor₁^{A_inf}(H_A^{i+1},W(k̄))→0. Here H_logcrys^i=H_logcrys^i(𝔛_{k̄}/W(k̄)) is taken over W(k̄) with the log structure associated with Q≥0→W(k̄), 0≠q↦0, 0↦1, of CK §5.42, as in global-crystalline; the passage to the ℕ log point is hyodo-kato-interface and is not used here.
Prerequisites: AInfCohomology:AI.6/cohomological-bkf, AInfCohomology:AI.6/etale-comparison, AInfCohomology:AI.6/log-de-rham, AInfCohomology:AI.6/global-crystalline, AInfCohomology:AI.5

AInfCohomology:AI.6/freeness-criterion
Semistable.freenessCriterion — theorem, not typed
Statement: For proper 𝔛 and fixed i, H_logdR^i(𝔛/O_C) is O_C-free iff H_logcrys^i(𝔛_{k̄}/W(k̄)) is W(k̄)-free. Under either condition H_A^i is A_inf-free and H_ét^i(X_C,Z_p) is Z_p-free. This alone does not remove the adjacent-degree terms from degreewise-specializations.
Prerequisites: AInfCohomology:AI.6/degreewise-specializations, AInfCohomology:AI.6/cohomological-bkf, AInfCohomology:AI.6/proper-perfectness, AInfCohomology:AI.6/log-de-rham, AInfCohomology:AI.6/global-crystalline, AInfCohomology:AI.5

AInfCohomology:AI.6/rank-equality
Semistable.rankEquality — theorem, not typed
Statement: For proper 𝔛, the generic ranks of H_A^i, H_ét^i(X_C,Z_p), H_logdR^i and H_logcrys^i over A_inf, Z_p, O_C and W(k̄), respectively, are equal. Rank is computed after the relevant fraction-field or p-inverted free specialization; it does not assert equality of torsion.
Prerequisites: AInfCohomology:AI.6/cohomological-bkf, AInfCohomology:AI.6/etale-comparison, AInfCohomology:AI.6/log-de-rham, AInfCohomology:AI.6/global-crystalline, AInfCohomology:AI.5

AInfCohomology:AI.6/crystalline-torsion
Semistable.crystallineTorsion — theorem, not typed
Statement: For proper 𝔛, all i and n≥0, length_{Z_p}(H_ét^i(Z_p)_tors/p^n)≤length_{W(k̄)}(H_logcrys^i(W(k̄))_tors/p^n), and length_{Z_p}H_ét^i(Z/p^n)≤length_{W(k̄)}H_logcrys^i(W_n(k̄)). These are length inequalities, not a canonical injection or a subquotient assertion.
Prerequisites: AInfCohomology:AI.6/degreewise-specializations, AInfCohomology:AI.6/rank-equality, AInfCohomology:AI.6/cohomological-bkf, AInfCohomology:AI.5

AInfCohomology:AI.6/de-rham-torsion
Semistable.deRhamTorsion — theorem, not typed
Statement: For proper 𝔛, all i and n≥0, v_{Z_p}(H_ét^i(Z_p)_tors/p^n)≤v_{O_C}(H_logdR^i(O_C)_tors/p^n), and v_{Z_p}H_ét^i(Z/p^n)≤v_{O_C}H^i(𝔛_{O_C/p^n},Ω^•_{𝔛_{O_C/p^n}/(O_C/p^n),log}), the logarithmic de Rham cohomology of the reduction of 𝔛 modulo p^n. Here v(p)=1 and v(⊕O_C/(a_j))=Σv(a_j); this normalized valuation length is not ordinary O_C-module length. Over O_K it is length_{O_K}/length_{O_K}(O_K/p).
Prerequisites: AInfCohomology:AI.6/degreewise-specializations, AInfCohomology:AI.6/rank-equality, AInfCohomology:AI.6/cohomological-bkf, AInfCohomology:AI.5

AInfCohomology:AI.6/de-rham-lattice-functor
Semistable.deRhamLatticeFunctor — construction, not typed
Statement: Let K, C and G be as in the hypotheses. (a) A Breuil–Kisin–Fargues G-module is a Breuil–Kisin–Fargues module (M,φ_M) (AI.2) with an A_inf-semilinear G-action on M for which φ_M is G-equivariant; morphisms are the G-equivariant morphisms of Breuil–Kisin–Fargues modules. Its étale realization M_ét=(M⊗_{A_inf}W(C^♭))^{φ_M⊗φ=1} carries the induced Z_p-linear G-action. (b) (CK Proposition 8.4) The functor (M,φ_M)↦(M_ét, M⊗_{A_inf}B_dR⁺) is an equivalence from the category of A_inf-free Breuil–Kisin–Fargues G-modules to the category of pairs (T,Ξ), where T is a finite free Z_p-module with a G-action and Ξ⊂T⊗_{Z_p}B_dR is a G-stable B_dR⁺-lattice. (c) Let T be a finite free Z_p-module with a continuous G-action such that T[1/p] is de Rham, and D_dR(T)=(T⊗_{Z_p}B_dR)^G, so that T⊗_{Z_p}B_dR≃D_dR(T)⊗_K B_dR G-equivariantly. Then D_dR(T)⊗_K B_dR⁺ is a G-stable B_dR⁺-lattice in T⊗_{Z_p}B_dR, and M(T) is the A_inf-free Breuil–Kisin–Fargues G-module corresponding under (b) to the pair (T, D_dR(T)⊗_K B_dR⁺). It depends functorially on T. (d) The de Rham realization M(T)_dR=M(T)⊗_{A_inf,θ}O_C is an O_C-lattice in (M(T)⊗_{A_inf}B_dR⁺)/ξ≃(D_dR(T)⊗_K B_dR⁺)/ξ≃D_dR(T)⊗_K C, and L_dR(T)=(M(T)_dR)^G is an O_K-lattice in the K-vector space D_dR(T), functorial in T. (e) (CK Example 8.6) For X proper and smooth over K, a K-scheme or a rigid space over K viewed as an adic space, put L^i_ét(X)=H^i_ét(X_{K̄},Z_p)/torsion≃H^i_ét(X_C,Z_p)/torsion for i≥0. Then L^i_ét(X)[1/p] is de Rham and D_dR(L^i_ét(X))≃H^i_dR(X/K) by the de Rham comparison (6.7.2), functorially in X ((8.6.1)); L^i_dR(X)=L_dR(L^i_ét(X))⊂H^i_dR(X/K) is an O_K-lattice, functorial in X; and for a finite Galois extension K′/K, L^i_dR(X)=(L^i_dR(X_{K′}))^{Gal(K′/K)} inside H^i_dR(X/K)=(H^i_dR(X_{K′}/K′))^{Gal(K′/K)}. Continuity of the G-action on M(T) and the equality L_dR(T)⊗_{O_K}O_C=M(T)_dR are not asserted.
API Semistable.deRhamLatticeFunctor.equivalence [equivalence]: (M,φ_M)↦(M_ét, M⊗_{A_inf}B_dR⁺) is an equivalence between A_inf-free Breuil–Kisin–Fargues G-modules and pairs (T,Ξ) of a finite free Z_p-module with G-action and a G-stable B_dR⁺-lattice Ξ⊂T⊗_{Z_p}B_dR; morphisms of pairs are the G-equivariant Z_p-linear maps carrying Ξ into Ξ′ (CK Proposition 8.4).
API Semistable.deRhamLatticeFunctor.bkfModule [constructor]: For a finite free Z_p-module T with continuous G-action and T[1/p] de Rham, M(T) is the A_inf-free Breuil–Kisin–Fargues G-module corresponding to the pair (T, D_dR(T)⊗_K B_dR⁺).
API Semistable.deRhamLatticeFunctor.map [functoriality]: A G-equivariant Z_p-linear map f:T→T′ between such lattices induces a morphism M(f):M(T)→M(T′) of Breuil–Kisin–Fargues G-modules, with M(id)=id and M(g∘f)=M(g)∘M(f); its étale realization is f.
API Semistable.deRhamLatticeFunctor.etale_realization [projection]: M(T)_ét=(M(T)⊗_{A_inf}W(C^♭))^{φ⊗φ=1} is identified with T G-equivariantly, and M(T)⊗_{A_inf}A_inf[1/μ]≃T⊗_{Z_p}A_inf[1/μ].
API Semistable.deRhamLatticeFunctor.bdr_lattice [characterisation]: Inside M(T)⊗_{A_inf}B_dR≃T⊗_{Z_p}B_dR one has M(T)⊗_{A_inf}B_dR⁺=D_dR(T)⊗_K B_dR⁺. Conversely an A_inf-free Breuil–Kisin–Fargues G-module M with a G-equivariant isomorphism M_ét≃T under which M⊗_{A_inf}B_dR⁺=D_dR(T)⊗_K B_dR⁺ is isomorphic to M(T) by a unique isomorphism inducing M_ét≃T.
API Semistable.deRhamLatticeFunctor.deRhamRealization [data]: M(T)_dR=M(T)⊗_{A_inf,θ}O_C is a G-stable free O_C-module of rank rank_{Z_p}T and an O_C-lattice in D_dR(T)⊗_K C, through (M(T)⊗_{A_inf}B_dR⁺)/ξ≃(D_dR(T)⊗_K B_dR⁺)/ξ≃D_dR(T)⊗_K C.
API Semistable.deRhamLatticeFunctor.lattice [structure]: L_dR(T)=(M(T)_dR)^G=M(T)_dR∩D_dR(T) is a free O_K-module of rank rank_{Z_p}T with L_dR(T)[1/p]=D_dR(T). CK assert this; the proof (C^G=K, commensurability with L_0⊗_{O_K}O_C, O_C∩K=O_K) is in the proof steps. One has L_dR(T)⊗_{O_K}O_C⊂M(T)_dR, and equality is not asserted.
API Semistable.deRhamLatticeFunctor.lattice_map [functoriality]: For a G-equivariant Z_p-linear map f:T→T′, the K-linear map D_dR(f):D_dR(T)→D_dR(T′) carries L_dR(T) into L_dR(T′).
API Semistable.deRhamLatticeFunctor.finite_extension [compatibility]: For a finite Galois extension K′/K in K̄ and G′=Gal(K̄/K′): M(T|_{G′}) is M(T) with the action restricted to G′, D_dR for G′ is K′⊗_K D_dR(T), and L_dR(T)=(L_dR(T|_{G′}))^{Gal(K′/K)}. CK state this for L^i_dR(X) in Example 8.6; for general T it follows in the same way.
API Semistable.deRhamLatticeFunctor.tate_twist [relation]: M(T(n))≃M(T){n}=M(T)⊗_{A_inf}A_inf{1}^{⊗n} as Breuil–Kisin–Fargues G-modules, and L_dR(T(n))=L_dR(T)·(t^{−n}⊗ε^{⊗n}) inside D_dR(T(n))=D_dR(T)·(t^{−n}⊗ε^{⊗n}), where ε is a basis of Z_p(1) and t=log[ε]; the element t^{−n}⊗ε^{⊗n} does not depend on ε. This is not in CK; it is derived in the proof steps.
API Semistable.deRhamLatticeFunctor.geometric [example]: For X proper and smooth over K and i≥0, L^i_ét(X)=H^i_ét(X_{K̄},Z_p)/torsion is a lattice in a de Rham representation with D_dR(L^i_ét(X))≃H^i_dR(X/K) by (6.7.2), and L^i_dR(X)=L_dR(L^i_ét(X))⊂H^i_dR(X/K); a morphism X→Y over K induces H^i_dR(Y/K)→H^i_dR(X/K) carrying L^i_dR(Y) into L^i_dR(X) (CK Example 8.6).
example Semistable.deRhamLatticeFunctor.trivial [degenerate]: For T=Z_p with trivial action: D_dR(T)=K, the pair is (Z_p,B_dR⁺), M(T)=A_inf with φ the Frobenius of A_inf and the natural G-action, M(T)_dR=O_C⊂C, and L_dR(T)=(O_C)^G=O_K⊂K.
example Semistable.deRhamLatticeFunctor.cyclotomic [computation]: For T=Z_p(1) with basis ε and t=log[ε]: D_dR(T)=K·(t^{−1}⊗ε), the lattice is ξ^{−1}(T⊗_{Z_p}B_dR⁺), M(T)=A_inf{1}=μ^{−1}(A_inf⊗_{Z_p}Z_p(1)), M(T)_dR=O_C·(t^{−1}⊗ε) because θ(t/μ)=1, and L_dR(Z_p(1))=O_K·(t^{−1}⊗ε); dually L_dR(Z_p(−1))=O_K·(t⊗ε^∨). The generator does not depend on the choice of ε. A definition using the lattice T⊗_{Z_p}B_dR⁺ instead of D_dR(T)⊗_K B_dR⁺ would give M=A_inf⊗T and no G-invariants at all.
example Semistable.deRhamLatticeFunctor.ramified_quadratic [computation]: Let π be a uniformizer of K, K′=K(√π) and T=Z_p·e with G acting through the quadratic character η of K′/K. Then D_dR(T)=K·(√π⊗e), D_dR(T)⊗_K B_dR⁺=T⊗_{Z_p}B_dR⁺ because √π is a unit of B_dR⁺, M(T)=A_inf⊗_{Z_p}T with the diagonal action, M(T)_dR=O_C⊗T, and L_dR(T)=O_K·(√π⊗e). So L_dR(T)⊗_{O_K}O_C=√π·M(T)_dR is strictly smaller than M(T)_dR, and L_dR(T)=(O_{K′}⊗T)^{Gal(K′/K)} as the compatibility with K′/K predicts.
example Semistable.deRhamLatticeFunctor.not_de_rham [non-example]: If T[1/p] is not de Rham then dim_K(T⊗_{Z_p}B_dR)^G<rank_{Z_p}T, so D⊗_K B_dR⁺ is a B_dR⁺-lattice of T⊗_{Z_p}B_dR for no K-subspace D of (T⊗_{Z_p}B_dR)^G, and M(T) is not defined. Example: K contains the 2p-th roots of unity, s∈Z_p is not an integer and T=Z_p(χ^s) for the cyclotomic character χ; then χ^{s+n} has infinite image on inertia for every integer n, so (T⊗_{Z_p}B_dR)^G=0 by the theorem of Tate and Sen on the invariants of C(η).
Prerequisites: AInfCohomology:AI.2, CohomologyComparisons:CP.3, AInfCohomology:AI.0:period-comparison, AInfCohomology:AI.0:integral, PadicHodgeTheory:R06.1/acris-embedding-into-bdr-plus, PadicHodgeTheory:R06.1/bdr-plus-complete-dvr, PadicHodgeTheory:R06.1/algebraic-closure-in-bdr-plus, PadicHodgeTheory:R06.1/ax-sen-tate-invariants, PadicHodgeTheory:R06.1/tate-sen-theorem

AInfCohomology:AI.6/model-independent-lattice
Semistable.modelIndependentLattice — theorem, not typed
Statement: Let 𝔛₀/O_K be proper, flat, p-adic, with its divisorial log structure and with an étale cover by affines, each étale over Spf O_K{t_0,…,t_d}/(t_0⋯t_r−π′) for a nonzero nonunit π′∈O_K, where d, r and π′ may depend on the affine. If H_logdR^i(𝔛₀/O_K) and H_logdR^{i+1}(𝔛₀/O_K) are both O_K-free, then T=H_ét^i(X_C,Z_p) is Z_p-free. Let M(T) and L_dR(T) be the Breuil–Kisin–Fargues G_K-module and the O_K-lattice of de-rham-lattice-functor, attached to the pair (T, D_dR(T)⊗_K B_dR⁺⊂T⊗_{Z_p}B_dR), where D_dR(T)=(T⊗_{Z_p}B_dR)^{G_K} is identified with H_dR^i(X_K/K) by the de Rham comparison (6.7.2). Then M(T) identifies with H_A^i(𝔛₀⊗̂O_C) as a Breuil–Kisin–Fargues G_K-module, and L_dR(T)=(M(T)⊗_{A_inf,θ}O_C)^{G_K} equals H_logdR^i(𝔛₀/O_K) inside H_dR^i(X_K/K); in the notation of de-rham-lattice-functor, L^i_dR(X_K)=H_logdR^i(𝔛₀/O_K). Two models of the same generic fibre satisfying these hypotheses therefore give the same lattice.
Prerequisites: AInfCohomology:AI.6/degreewise-specializations, AInfCohomology:AI.6/freeness-criterion, AInfCohomology:AI.6/cohomological-bkf, AInfCohomology:AI.6/etale-comparison, AInfCohomology:AI.6/bdr-comparison, AInfCohomology:AI.6/etale-bdr-agreement, AInfCohomology:AI.6/de-rham-lattice-functor, CrystallineCohomology:CR.5, CohomologyComparisons:CP.3, AInfCohomology:AI.6/aomega, PadicHodgeTheory:R06.1/ax-sen-tate-invariants

AInfCohomology:AI.6/nodal-conic
Semistable.nodalConic — application, not typed
Statement: For a uniformizer π of O_K, the proper conic 𝔛₀=Proj O_K[X,Y,Z]/(XY−πZ²), p-adically completed, is flat and semistable. Its special fibre is two projective lines meeting at one node; its generic fibre is a smooth rational curve. The log de Rham groups are O_K,0,O_K in degrees 0,1,2 and zero otherwise. Its A_inf groups are A_inf,0,A_inf{−1}, with the corresponding logarithmic/Witt specializations. The degree-0 and degree-2 lattices agree with a smooth P¹ model under a fixed generic-fibre identification, by model-independent-lattice. This nodal genus-zero example has N=0; the separate rank-two monodromy algebra test does not claim to be its H¹.
Prerequisites: AInfCohomology:AI.6/chart-ring, AInfCohomology:AI.6/divisorial-log, AInfCohomology:AI.6/degreewise-specializations, AInfCohomology:AI.6/freeness-criterion, AInfCohomology:AI.6/model-independent-lattice, AInfCohomology:AI.6/de-rham-lattice-functor, AInfCohomology:AI.2, CrystallineCohomology:CR.5

AInfCohomology:AI.7/coefficient-normalization
CohomologicalBK.coefficientNormalization — construction, typed above
Statement: On the R07.4 coefficient ring 𝔖=W(k₀)[[u]], distinguish θ̃_𝔖:𝔖→O_K, the W(k₀)-linear map with u↦π, from θ_𝔖=θ̃_𝔖∘φ_𝔖, which acts by φ_W on coefficients and has u↦π^p. Let 𝔖^(−1) be the copy of 𝔖 regarded as an 𝔖-algebra through φ_𝔖, let g:𝔖^(−1)→A_inf be W(k₀)-linear with u↦[π^♭], and f=g∘φ_𝔖=φ_A∘g:𝔖→A_inf, acting by φ_W on coefficients and u↦[π^♭]^p. Then θ̃_A∘f=θ̃_𝔖, θ_A∘f=θ_𝔖, θ_A∘g=θ̃_𝔖, f(E) generates ker θ̃_A=(ξ̃), g(E) generates ker θ_A=(ξ), and the cohomological crystalline map is c=φ_W∘constantCoeff:𝔖→W(k₀), with c∘φ_𝔖=φ_W∘c. These maps use the existing rings, rather than new coefficient constants. Dictionary: R07.4 (bk-coefficient-rings) writes θ_𝔖 for the map u↦π, which is this node’s θ̃_𝔖, and its embedding 𝔖→W(R), u↦[π̃], is this node’s g. PrismaticCohomology PR.7 (breuil-kisin-and-ainf-covers, kisin-functor-comparison) already supplies f as the map of prisms (𝔖,(E))→(A_inf,ker θ̃_A), u↦[π^♭]^p and Frobenius on W(k₀), with f=φ_A∘g. Not in those nodes: the name θ_𝔖 for θ̃_𝔖∘φ_𝔖 with θ_A∘f=θ_𝔖, the map c, and the statement for g(E). The variable u is T in BMS1 and z in BMS2; BMS2 writes θ^(−1) for the map u↦π on 𝔖^(−1).
Typed part: the power-series map with frobenius, the normalized residue with crystalline, the four tests, and the θ-squares, stated with Mathlib's fontaineTheta, PreTilt and PreTilt.untilt: O is any ring that is p-adically complete with p not a unit, A_inf is W(PreTilt O p), 𝔖 is W(k)[[u]] for a commutative ring k with an algebra map W(k)→O and a map ι:k→PreTilt O p such that θ∘W(ι) is that algebra map, and π^♭ is an element ϖ of PreTilt O p whose zeroth component is nilpotent, so that π=untilt ϖ is nilpotent modulo p. The maps g and θ̃_𝔖 are declared with their values on C a and u and their uniqueness (g_C, g_X, g_unique, thetaTilde𝔖_C, thetaTilde𝔖_X, thetaTilde𝔖_unique); their construction, the evaluation of a power series at a topologically nilpotent element, is not written because the pinned Mathlib has no topology on these rings. Typed from these: f, thetaTildeA, theta𝔖, the values of both squares on C a and u, fontaineTheta_comp_g (θ_A∘g=θ̃_𝔖), theta (θ̃_A∘f=θ̃_𝔖 and θ_A∘f=θ_𝔖), and eisenstein_mem (g(E) lies in ker θ and f(E) in ker θ̃_A for a polynomial E over W(k) vanishing at π). Absent: the generation half of eisenstein, that f(E) generates ker θ̃_A and g(E) generates ker θ. It needs O integral perfectoid, so that ker θ is principal and generated by any of its elements that is primitive of degree one, and E the Eisenstein polynomial of π; the pinned Mathlib has no perfectoid rings and lists principality of ker θ as an open item in Mathlib.RingTheory.Perfectoid.BDeRham. Also absent: the second half of the test twisted_constant, on a Teichmüller coefficient of F_{p²}; the identification of O with O_C and of k with the residue field k₀; and the comparison with the conventions of R07.4 and PR.7.
API CohomologicalBK.coefficientNormalization.frobenius [simp] (typed): For any coefficient endomorphism F and p>0, the power-series map is Σa_nu^n↦ΣF(a_n)u^{pn}; it sends C(a) to C(F(a)) and u to u^p.
API CohomologicalBK.coefficientNormalization.theta [compatibility] (typed): θ̃_A∘f=θ̃_𝔖 and θ_A∘f=θ_𝔖 as maps 𝔖→O_C (through O_K⊂O_C), and θ_A∘g=θ̃_𝔖; θ_𝔖(u)=π^p whereas θ̃_𝔖(u)=π.
API CohomologicalBK.coefficientNormalization.crystalline [simp] (typed): The normalized residue map is F∘constantCoeff: C(a)↦F(a), u↦0, and c∘φ_𝔖=φ_W∘c.
API CohomologicalBK.coefficientNormalization.eisenstein [relation]: f(E) generates kerθ̃_A=(ξ̃); g(E) generates kerθ_A=(ξ).
example CohomologicalBK.coefficientNormalization.variable [computation] (typed): At p=2, the map with coefficient identity sends u to u².
example CohomologicalBK.coefficientNormalization.twisted_constant [computation] (typed): For an arbitrary coefficient endomorphism F, the normalized residue of C(a) is F(a); for k₀=F_{p²}, F=φ_W and a=[ζ] with ζ∉F_p this is [ζ^p], which differs from a.
example CohomologicalBK.coefficientNormalization.constant_identity [compatibility] (typed): At F=id, c is exactly Mathlib PowerSeries.constantCoeff.
example CohomologicalBK.coefficientNormalization.nonsurjective [non-example] (typed): Over Z with p=2, the coefficient of u in every image of φ is zero, so u is not an image.
Prerequisites: FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/bk-coefficient-rings, AInfCohomology:AI.0:integral, PrismaticCohomology:PR.7/breuil-kisin-and-ainf-covers, PrismaticCohomology:PR.7/kisin-functor-comparison, mathlib:PowerSeries.map, mathlib:PowerSeries.substAlgHom, mathlib:PowerSeries.constantCoeff, mathlib:WittVector.frobenius, mathlib:PowerSeries, mathlib:WittVector, mathlib:PowerSeries.expand, mathlib:PowerSeries.HasSubst.X_pow, mathlib:PowerSeries.coeff_subst_X_pow, mathlib:PowerSeries.constantCoeff_subst_X_pow, mathlib:PowerSeries.substAlgHom_X, mathlib:WittVector.frobeniusEquiv, mathlib:WittVector.fontaineTheta, mathlib:PreTilt, mathlib:PreTilt.untilt, mathlib:WittVector.teichmuller, mathlib:WittVector.map

AInfCohomology:AI.7/flat-coefficient-extension
CohomologicalBK.flatCoefficientExtension — theorem, not typed
Statement: The normalized map f:𝔖→A_inf is flat (BMS1 Lemma 4.30). It is moreover faithfully flat and topologically free: A_inf is isomorphic as an 𝔖-module to the (p,u)-adic completion of a free 𝔖-module, with 1 part of a topological basis, so that f has an 𝔖-linear retraction. These two properties are asserted in BMS2 Notation 11.1, with a reference to Lemma 4.30 and its proof, and are proved here. In particular M⊗^L_𝔖 A_inf is concentrated in degree 0 for every 𝔖-module M. Detection: a map that becomes zero, respectively an equivalence, after extension along f is zero, respectively an equivalence, in each of three domains: maps of 𝔖-modules with the ordinary tensor product; maps of perfect complexes of 𝔖-modules with the derived tensor product; maps of derived (p,u)-complete complexes with the (p,u)-completed derived tensor product. The same holds for g=φ_A^{-1}∘f. Finally f is p-completely faithfully flat and the p-completed tensor powers of A_inf over 𝔖 are flat over 𝔖 (BMS1 Remark 4.31), so the Čech descent of complete-flat-descent applies to derived p-complete 𝔖-complexes, with the p-completed Čech nerve of f.
Prerequisites: AInfCohomology:AI.7/coefficient-normalization, EnhancedDerivedSheaves:E1/presentability-and-derived-tensor, EnhancedDerivedSheaves:E4/mod-ideal-detection, DerivedDeRhamCohomology:DD.1/complete-flat-descent, FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/bk-coefficient-rings, AInfCohomology:AI.0:integral, mathlib:Module.FaithfullyFlat.zero_iff_lTensor_zero, mathlib:Module.FaithfullyFlat.lTensor_bijective_iff_bijective

AInfCohomology:AI.7/cohomology
CohomologicalBK.cohomology — construction, not typed
Statement: For a smooth p-adic formal scheme 𝔛 over O_K, let (𝔖,(E)) be the bounded non-perfect prism of PrismaticCohomology PR.0 (breuil-kisin-prism) on the ring 𝔖=W(k₀)[[u]] of R07.4, with 𝔖/E≅O_K through θ̃_𝔖, and define RΓ_𝔖(𝔛) to be PR.1’s relative prismatic RΓ_Δ(𝔛/𝔖). On affines write D_𝔖(R)=Δ_{R/𝔖}. It is a derived (p,E)-complete, equivalently (p,u)-complete, commutative algebra object of D(𝔖) with a φ_𝔖-semilinear Frobenius endomorphism. For 𝔛 affine or, more generally, quasi-compact and quasi-separated, the linearization φ_𝔖^*RΓ_𝔖(𝔛)→RΓ_𝔖(𝔛) is an equivalence after E-inversion, with an inverse up to E^i on H^i.
API CohomologicalBK.cohomology.affine [characterisation]: For SpfR, the object is precisely Δ_{R/𝔖} in the shared enhancement.
API CohomologicalBK.cohomology.functorial [functoriality]: Pullback on eligible smooth formal schemes gives contravariant maps preserving products, with identity/composition.
API CohomologicalBK.cohomology.frobenius [structure]: The linearized φ_𝔖^*D→D is the imported prismatic Frobenius and becomes an isomorphism after E-inversion.
API CohomologicalBK.cohomology.global [compatibility]: For every smooth 𝔛, RΓ_𝔖(𝔛)=RΓ(𝔛_ét,Δ_{𝔛/𝔖}), where Δ_{𝔛/𝔖} is PR.1’s étale sheaf with value Δ_{R/𝔖} on an affine open Spf R. No quasi-compactness is needed for this identification; it is needed for completed base change of global sections (ainf-base-change) and for the global Frobenius isogeny.
example CohomologicalBK.cohomology.point [degenerate]: For SpfO_K the complex is 𝔖 in degree 0 with φ_𝔖.
example CohomologicalBK.cohomology.polynomial [compatibility]: For R=O_K⟨t⟩ the Hodge–Tate reduction D_𝔖(R)⊗^L_{𝔖,θ̃_𝔖}O_K has H⁰=R and H¹=Ω¹_{R/O_K}{−1}, and no other cohomology; the reduction along θ_𝔖 is the de Rham complex R→R·dt, t^n↦n·t^{n−1}dt.
example CohomologicalBK.cohomology.torus [compatibility]: For R=O_K⟨t^{±1}⟩: H⁰(D_𝔖(R)⊗^L_{𝔖,θ̃_𝔖}O_K)=R, whereas H⁰(D_𝔖(R)⊗^L_{𝔖,θ_𝔖}O_K)=O_K, the kernel of d:R→R·dlog t, t^n↦n·t^n·dlog t.
Prerequisites: PrismaticCohomology:PR.0/breuil-kisin-prism, PrismaticCohomology:PR.1/relative-prismatic-cohomology, PrismaticCohomology:PR.3/leta-frobenius-factorisation, PrismaticCohomology:PR.3/image-of-frobenius, EnhancedDerivedSheaves:E1/presentability-and-derived-tensor, EnhancedDerivedSheaves:E5:abstract/algebra-objects, AInfCohomology:AI.7/coefficient-normalization, PrismaticCohomology:PR.1/hodge-tate-comparison, PrismaticCohomology:PR.3/de-rham-comparison-general

AInfCohomology:AI.7/twisted-trace
CohomologicalBK.twistedTrace — construction, not typed
Statement: For a p-completely smooth O_K-algebra R, let 𝔖^(−1) be the copy of 𝔖 containing 𝔖 via φ_𝔖 and embedded in A_inf by g. Define D̂_tw(R)=gr⁰TC⁻(R/𝕊[z];Z_p)≃gr⁰TP(R/𝕊[z];Z_p), by unfolding π₀ from the quasiregular semiperfectoid site as in BMS2 §§11.1–11.2; here O_K is an 𝕊[z]-algebra through z↦π. It is a (p,u)-complete E∞-𝔖^(−1)-algebra, the algebra structure coming from π₀TC⁻(O_K/𝕊[z];Z_p)=𝔖^(−1), in which the variable z of 𝕊[z] is the coefficient variable u; its Frobenius linearization is invertible after φ(E)-inversion. RT.6 supplies the relative spectra, filtration, unfolding and coefficient computations.
API CohomologicalBK.twistedTrace.coefficients [compatibility]: For R=O_K, with all spectra relative to 𝕊[z] and p-completed: π_*THH=O_K[b]; π_*TC⁻=𝔖^(−1)[b,v]/(bv−E) with b of degree 2 and v of degree −2; π_*TP=𝔖^(−1)[σ^{±1}] with σ of degree 2; can(b)=Eσ and can(v)=σ^{−1}; the cyclotomic Frobenius π_*TC⁻→π_*TP is φ_𝔖 on 𝔖^(−1), with φ(b)=σ and φ(v)=φ_𝔖(E)σ^{−1}.
API CohomologicalBK.twistedTrace.specializations [equivalence]: BMS2 Corollary 11.12(1)–(3): along g, with the (p,u)-completed tensor product, it is AΩ_{R⊗̂O_C}; along the W(k₀)-linear map u↦π (untwisted coefficients) it is the p-completed de Rham complex of R over O_K; along constantCoeff (identity on W(k₀), u↦0) it is crystalline cohomology of R⊗_{O_K}k₀ over W(k₀).
API CohomologicalBK.twistedTrace.frobenius [structure]: Its linearized Frobenius is invertible after φ(E), matching Corollary 11.12(4).
example CohomologicalBK.twistedTrace.point [degenerate]: For O_K the gr⁰ complex is 𝔖^(−1) in degree 0.
example CohomologicalBK.twistedTrace.bott [computation]: On O_K the cyclotomic map takes the Bott class b to σ, which is invertible in TP; can takes b to Eσ.
example CohomologicalBK.twistedTrace.relative [non-example]: Absolute TC⁻(R;Z_p) is not substituted for the relative theory: the class b∈π₂ and the 𝔖^(−1)-algebra structure of BMS2 Proposition 11.10 belong to TC⁻(−/𝕊[z];Z_p), and the absolute theory appears only after base change, as gr⁰TC⁻(R⊗̂_{O_K}O_{K_∞};Z_p)≃D̂_tw(R)⊗̂^L_{𝔖^(−1)}A_inf(O_{K_∞}) (BMS2 Corollary 11.12(1), Remark 11.9).
Prerequisites: RefinedTraceMethods:RT.6, AInfCohomology:AI.7/coefficient-normalization, AInfCohomology:AI.7/flat-coefficient-extension, EnhancedDerivedSheaves:E1/presentability-and-derived-tensor, EnhancedDerivedSheaves:E5:abstract/algebra-objects

AInfCohomology:AI.7/trace-descent
CohomologicalBK.traceDescent — theorem, not typed
Statement: Let 𝔖 act on TC⁻(R/𝕊[z];Z_p)[1/b] through π₀(TC⁻(O_K/𝕊[z];Z_p)[1/b])=W(k₀)[[z]], the variable z of 𝕊[z] being the coefficient variable u; the cyclotomic Frobenius makes π₀TP(O_K/𝕊[z];Z_p)=𝔖^(−1) an 𝔖-algebra through φ_𝔖. D_𝔖^tr(R)=gr⁰(TC⁻(R/𝕊[z];Z_p)[1/b]), unfolded from the quasiregular semiperfectoid site, has φ_𝔖^*D_𝔖^tr≃D̂_tw, the tensor product being the ordinary one since φ_𝔖 is finite free. The cyclotomic Frobenius extends over b-inversion and z^{1/p}; for p-completed smooth R the resulting map to gr⁰TP is an equivalence. The linearised descent Frobenius φ_𝔖^*D_𝔖^tr→D_𝔖^tr is the composite of φ_𝔖^*D_𝔖^tr≃gr⁰TP(R/𝕊[z];Z_p), the inverse of the canonical equivalence gr⁰TC⁻≃gr⁰TP and the localisation gr⁰TC⁻→gr⁰(TC⁻[1/b])=D_𝔖^tr. Its base change along φ_𝔖 is, under the identification above, the linearised Frobenius of D̂_tw, so that the pair (D̂_tw,φ) descends to D_𝔖^tr with this Frobenius; it is invertible after E-inversion.
Prerequisites: AInfCohomology:AI.7/twisted-trace, RefinedTraceMethods:RT.6, EnhancedDerivedSheaves:E1/presentability-and-derived-tensor, FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/bk-coefficient-rings

AInfCohomology:AI.7/trace-prismatic-agreement
CohomologicalBK.tracePrismaticAgreement — theorem, not typed
Statement: (a) [BS22 Example 1.9(3) and §15.2, with Proposition 15.7] For p-completely smooth R/O_K there is a natural Frobenius-equivariant equivalence D_𝔖^tr(R)≃D_𝔖(R)=Δ_{R/𝔖}. It sheafifies and globalizes for qcqs 𝔛. It is an equivalence of commutative algebra objects; this is not printed in BS22 and follows from the construction, which induces it from ring maps on quasiregular semiperfectoid algebras. (b) [Not in the sources.] That under (a) the A_inf, de Rham and crystalline specialisation equivalences of the trace complex (BMS2 Theorem 11.2(1)–(3)) correspond to those of Δ_{R/𝔖} (BS22 Theorem 1.8(5), (3), (1)) is neither stated nor proved in BS22 or BMS2; it is the open part of this target. BS22 §18’s perfect-prism uniqueness does not give it: that theorem concerns functors defined on all p-completely smooth O_C-algebras, whereas the A_inf-extensions of the Breuil–Kisin functors are defined on smooth O_K-algebras only.
Prerequisites: AInfCohomology:AI.7/cohomology, AInfCohomology:AI.7/trace-descent, AInfCohomology:AI.7/twisted-trace, AInfCohomology:AI.7/flat-coefficient-extension, RefinedTraceMethods:RT.6, PrismaticCohomology:PR.3/leta-frobenius-factorisation, PrismaticCohomology:PR.3/relative-nygaard-filtration, PrismaticCohomology:PR.3/relative-nygaard-graded-pieces, PrismaticCohomology:PR.3/bms2-comparison, PrismaticCohomology:PR.6/ainf-omega-comparison, PrismaticCohomology:PR.6/comparison-uniqueness

AInfCohomology:AI.7/ainf-base-change
CohomologicalBK.ainfBaseChange — theorem, not typed
Statement: For qcqs smooth 𝔛/O_K, RΓ_𝔖(𝔛)⊗̂^L_{𝔖,f}A_inf≃RΓ_Ainf(𝔛⊗̂O_C), where f uses Witt Frobenius and [π^♭]^p and the tensor product is (p,u)-completed. Prismatic base change targets (A_inf,(ξ̃)), and PR.6 identifies its result with φ_A^*Δ_{𝔛_{O_C}/(A_inf,(ξ))}≃AΩ_{𝔛_{O_C}}. The equivalence is Frobenius compatible. That it is an equivalence of E∞-algebras and that the affine equivalences are natural in R, which the gluing over 𝔛 uses, rest on the same two properties of the comparison AΩ_R≃φ_A^*Δ_{R/A_inf} of PR.6/ainf-omega-comparison; BS22 assert both (Theorem 17.2, Remark 17.3), and they are not established here. The passage to the ordinary derived tensor product for proper 𝔛 is in perfect-cohomological-modules.
Prerequisites: AInfCohomology:AI.7/cohomology, AInfCohomology:AI.7/coefficient-normalization, PrismaticCohomology:PR.1/prismatic-base-change, PrismaticCohomology:PR.6/ainf-omega-comparison, PrismaticCohomology:PR.6/theta-theta-tilde-square, AInfCohomology:AI.3, EnhancedDerivedSheaves:E4/completed-sheaf-tensor, EnhancedDerivedSheaves:E4

AInfCohomology:AI.7/de-rham-base-change
CohomologicalBK.deRhamBaseChange — theorem, not typed
Statement: For every smooth p-adic formal scheme 𝔛/O_K, RΓ_𝔖(𝔛)⊗^L_{𝔖,θ_𝔖}O_K≃RΓ_dR(𝔛/O_K), the cohomology of the p-completed de Rham complex, where θ_𝔖=θ̃_𝔖∘φ_𝔖 acts by φ_W on coefficients and u↦π^p; on 𝔛_ét it is an equivalence Δ_{𝔛/𝔖}⊗^L_{𝔖,θ_𝔖}O_K≃Ω^•_{𝔛/O_K} of commutative algebra objects. No completion of the tensor product and no quasi-compactness are needed: O_K is a perfect 𝔖-module through θ_𝔖, because φ_𝔖 is finite free and 𝔖 is regular, so the tensor product preserves derived completeness and commutes with derived global sections. After the p-completed base change O_K→O_C, for qcqs 𝔛, the left side becomes RΓ_Ainf(𝔛⊗̂O_C)⊗^L_{A_inf,θ_A}O_C, by ainf-base-change and θ_A∘f=θ_𝔖, so the statement yields an identification of the θ specialization of AΩ with de Rham cohomology of 𝔛⊗̂O_C. That this identification coincides, as a map, with the θ specialization of AI.5 is not in the sources; it is clause (b) of comparison-diagram-agreement.
Prerequisites: AInfCohomology:AI.7/cohomology, AInfCohomology:AI.7/coefficient-normalization, AInfCohomology:AI.7/ainf-base-change, PrismaticCohomology:PR.3/de-rham-comparison-general, PrismaticCohomology:PR.6/theta-theta-tilde-square, AInfCohomology:AI.5, EnhancedDerivedSheaves:E4/completed-sheaf-tensor, EnhancedDerivedSheaves:E4, FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/bk-coefficient-rings, PrismaticCohomology:PR.3/leta-frobenius-factorisation, PrismaticCohomology:PR.1/prismatic-base-change, PrismaticCohomology:PR.1/hodge-tate-comparison

AInfCohomology:AI.7/crystalline-base-change
CohomologicalBK.crystallineBaseChange — theorem, not typed
Statement: For qcqs smooth 𝔛/O_K, RΓ_𝔖(𝔛)⊗^L_{𝔖,c}W(k₀)≃RΓ_crys(𝔛_{k₀}/W(k₀)), where c=φ_W∘constantCoeff. No completion of the tensor product is needed: through c, W(k₀) is the 𝔖-module 𝔖/u, a perfect complex. This is Frobenius equivariant. The φ_W factor is the crystalline comparison’s Frobenius pullback, not a dispensable coordinate choice. After the p-completed extension W(k₀)→W(k̄) the left side becomes the specialization of RΓ_Ainf(𝔛⊗̂O_C) along A_inf→W(k̄), by ainf-base-change and the identity (A_inf→W(k̄))∘f=(W(k₀)→W(k̄))∘c, so the statement yields an identification of that specialization with crystalline cohomology of 𝔛_{k̄} over W(k̄). That this identification coincides, as a map, with AI.5’s W(k̄) comparison is not in the sources; it is clause (b) of comparison-diagram-agreement.
Prerequisites: AInfCohomology:AI.7/cohomology, AInfCohomology:AI.7/coefficient-normalization, AInfCohomology:AI.7/ainf-base-change, PrismaticCohomology:PR.1/prismatic-base-change, PrismaticCohomology:PR.1/crystalline-comparison, AInfCohomology:AI.5, EnhancedDerivedSheaves:E4/completed-sheaf-tensor, EnhancedDerivedSheaves:E4

AInfCohomology:AI.7/perfect-cohomological-modules
CohomologicalBK.perfectCohomologicalModules — theorem, not typed
Statement: For proper smooth 𝔛/O_K, RΓ_𝔖 is perfect, and every H^i_𝔖 is a finitely generated (equivalently finitely presented, 𝔖 being noetherian) 𝔖-module with an isomorphism (φ_𝔖^*H^i_𝔖)[1/E]≃H^i_𝔖[1/E]. These are the broad cohomological Breuil–Kisin modules of BMS2 Definition 1.1, potentially with p-torsion. They are not assigned the finite-free Kisin-module classification of R07.4. Consequently, for proper 𝔛, the completed tensor product of ainf-base-change is the ordinary derived tensor product, RΓ_𝔖(𝔛)⊗^L_{𝔖,f}A_inf≃RΓ_Ainf(𝔛⊗̂O_C), and the A_inf extension of H^i_𝔖 is H^i_Ainf by flatness.
Prerequisites: AInfCohomology:AI.7/ainf-base-change, AInfCohomology:AI.7/flat-coefficient-extension, AInfCohomology:AI.7/cohomology, PrismaticCohomology:PR.3/de-rham-comparison-general, AInfCohomology:AI.5, FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4, FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/bk-coefficient-rings

AInfCohomology:AI.7/bkf-tensor-functor
CohomologicalBK.bkfTensorFunctor — theorem, not typed
Statement: For the broad category of finitely presented 𝔖-modules M with (φ_𝔖^*M)[1/E]≃M[1/E], extension M↦M⊗_{𝔖,f}A_inf is an exact symmetric monoidal functor to AI.2’s finitely presented BKF modules. R07.4 supplies BMS1 Proposition 4.3 that M[1/p] is free; f(E) generates ξ̃. This identifies the Frobenius structure on H^i_𝔖⊗A_inf with the earlier cohomological BKF module.
Prerequisites: AInfCohomology:AI.7/perfect-cohomological-modules, AInfCohomology:AI.7/flat-coefficient-extension, AInfCohomology:AI.7/coefficient-normalization, AInfCohomology:AI.7/ainf-base-change, FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4, AInfCohomology:AI.2

AInfCohomology:AI.7/twist-compatibility
CohomologicalBK.twistCompatibility — theorem, not typed
Statement: The Breuil–Kisin twist 𝔖{1} of the prism (𝔖,(E)) (PR.3/breuil-kisin-twist; BMS1 Example 4.2) has 𝔖{1}⊗_{𝔖,f}A_inf≃A_inf{1} as BKF objects, compatibly with φ and the G_{K∞} action; tensor powers and dual twists are preserved. This is the first step of the proof of BMS1 Corollary 4.33, whose statement is that Z_p(1) is sent to 𝔖{1} by the functor of BMS1 Theorem 4.4. R07.4 owns that representation classification, and PR.7/etale-realization supplies the corresponding statement that the étale realisation of the twist is Z_p(1); AI.0:integral and AI.2 own the A_inf twist and étale realization.
Prerequisites: AInfCohomology:AI.7/bkf-tensor-functor, AInfCohomology:AI.7/coefficient-normalization, PrismaticCohomology:PR.3/breuil-kisin-twist, PrismaticCohomology:PR.7/etale-realization, FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4, AInfCohomology:AI.0:integral, AInfCohomology:AI.2, PrismaticCohomology:PR.7/kisin-functor-comparison, FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/finite-height-lattices, FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/semistable-finite-height

AInfCohomology:AI.7/frobenius-decalage
CohomologicalBK.frobeniusDecalage — theorem, not typed
Statement: For p-completely smooth R/O_K, the Frobenius factors canonically as φ_𝔖^*D_𝔖(R)≃Lη_E D_𝔖(R)→D_𝔖(R) (BS22 Theorem 15.3). For the trace complex, BMS2 Remark 11.17 gives the factorisation φ_𝔖^*D_𝔖^tr(R)≃Lη_E D_𝔖^tr(R)→D_𝔖^tr(R) from the Beilinson connective cover map from the Nygaard filtration of D̂_tw to the E-adic filtration of D_𝔖^tr. Under trace-prismatic-agreement, which respects the Nygaard filtrations on the Frobenius twists (BS22 Proposition 15.7), the two factorisations correspond. It does not assert a Nygaard filtration on D_𝔖 itself.
Prerequisites: AInfCohomology:AI.7/trace-prismatic-agreement, AInfCohomology:AI.7/twisted-trace, AInfCohomology:AI.7/trace-descent, PrismaticCohomology:PR.3/leta-frobenius-factorisation, AInfCohomology:AI.1, RefinedTraceMethods:RT.6, AInfCohomology:AI.7/flat-coefficient-extension

AInfCohomology:AI.7/nygaard-nondescent
CohomologicalBK.nygaardNonDescent — theorem, typed in part above
Statement: The Nygaard filtration on φ_𝔖^*D_𝔖^tr≃D̂_tw has no functorial descent along φ_𝔖 to a filtration on D_𝔖^tr with the same degree-zero projection D̂_tw(R)→gr⁰≃R. For R=O_K the projection is 𝔖^(−1)→O_K, and a descent of it is a quotient 𝔖/J with φ_𝔖(J)𝔖=(E). There are two cases. (i) If (E) is not of the form φ_𝔖(J)𝔖, which is so whenever p does not divide the degree e of E, in particular for unramified K, no descent exists even for R=O_K. (ii) If (E)=φ_𝔖(J)𝔖, as for K=Q_p(p^{1/p}) with π=p^{1/p} and J=(u−p), then J=ker θ_𝔖, the ring O₀=𝔖/J is identified by θ_𝔖 with the subring W(k₀)[π^p] of O_K, and O_K=O₀⊗_{𝔖,φ_𝔖}𝔖 is free of rank p over O₀. A functorial descent would then canonically descend every smooth formal O_K-scheme to O₀, and a good-reduction elliptic curve with j∈O_K∖O₀ contradicts it.
Typed part: only the algebraic core of the example: in ℤ_p[π]/(π^p−p), for every c in ℤ_p the element c+π is not in the image of ℤ_p. Absent: the Nygaard filtration, the descent statement in its two cases, the identification of 𝔖/J with W(k₀)[π^p] and the elliptic curve, which use supplier types.
Prerequisites: AInfCohomology:AI.7/twisted-trace, AInfCohomology:AI.7/trace-descent, AInfCohomology:AI.7/coefficient-normalization, RefinedTraceMethods:RT.6, FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/bk-coefficient-rings

AInfCohomology:AI.7/choice-transport
CohomologicalBK.choiceTransport — construction, not typed
Statement: For two choices (π,π^♭) and (π′,π′^♭), extend their respective 𝔖-valued complexes along the normalized maps f,f′ to the same A_inf. Define the transport as the first ainf-base-change equivalence followed by the inverse of the second, through the intrinsic AΩ complex. It is Frobenius compatible and satisfies identity/cocycle; being defined through AΩ, it is compatible with products and natural in 𝔛 as far as ainf-base-change is, and it identifies the specialisations of the two extensions along θ_A, θ̃_A and A_inf→W(k̄). Descent of a morphism to either 𝔖 is extra structure for derived objects, not a property: by complete-flat-descent, which applies because f is p-completely faithfully flat, the 𝔖-linear maps between derived p-complete complexes are the points of the totalisation of the mapping spaces of their p-completed base changes to the p-completed Čech nerve of f; for perfect complexes, as for proper 𝔛, these base changes are the ordinary ones. For finitely presented 𝔖-modules, such as the H^i_𝔖 of a proper 𝔛, a morphism of the A_inf-extensions comes from a unique 𝔖-linear morphism exactly when its two pullbacks to the p-completion of A_inf⊗_𝔖A_inf agree. No 𝔖-linear identification of unrelated coefficient rings is asserted. The construction is not in BMS2 or BS22.
API CohomologicalBK.choiceTransport.identity [simp]: Transport for the same choice is the identity under its fixed comparison.
API CohomologicalBK.choiceTransport.cocycle [functoriality]: For three choices transport₍₂₃₎∘transport₍₁₂₎=transport₍₁₃₎.
API CohomologicalBK.choiceTransport.descend [characterisation]: For a fixed f and derived p-complete 𝔖-complexes D, D′, the space of 𝔖-linear maps D→D′ is the totalisation of the mapping spaces between the p-completed base changes of D and D′ to the terms of the p-completed Čech nerve of f (complete-flat-descent); so for derived objects a morphism over A_inf descends only together with coherence data on the higher terms. For finitely presented 𝔖-modules M, M′ a morphism M⊗_𝔖A_inf→M′⊗_𝔖A_inf comes from a unique 𝔖-linear morphism precisely when its two pullbacks to the p-completion of A_inf⊗_𝔖A_inf agree.
example CohomologicalBK.choiceTransport.point [degenerate]: For SpfO_K every extension identifies with A_inf and the transport is its identity.
example CohomologicalBK.choiceTransport.root_change [compatibility]: For the same π and two compatible systems of roots, π′^♭=ε^a·π^♭ with a∈Z_p and ε=(1,ζ_p,ζ_{p²},…), one has f′(u)=[ε]^{ap}·f(u), so f≠f′ when a≠0, while both extensions are identified with the same AΩ; for 𝔛=Spf O_K the transport is the identity of A_inf although the two 𝔖-algebra structures on A_inf differ.
example CohomologicalBK.choiceTransport.different_uniformizers [non-example]: For two uniformizers π≠π′ one has θ̃_A(f(u))=π and θ̃_A(f′(u))=π′, so f(u)≠f′(u): the transport is not 𝔖-linear for the identification of the two copies of W(k₀)[[u]] that sends u to u.
Prerequisites: AInfCohomology:AI.7/ainf-base-change, AInfCohomology:AI.7/flat-coefficient-extension, AInfCohomology:AI.3, AInfCohomology:AI.5, DerivedDeRhamCohomology:DD.1/complete-flat-descent

AInfCohomology:AI.7/comparison-diagram-agreement
CohomologicalBK.comparisonDiagramAgreement — theorem, not typed
Statement: (a) [BS22 Theorem 17.2, Remark 17.3, Lemma 17.4, Theorem 18.2] For p-completely smooth R/O_C, import AΩ_R≃φ_A^*Δ_{R/(A_inf,kerθ)} from PR.6; equivalently AΩ_R is prismatic cohomology of R over the perfect prism (A_inf,(ξ̃)), with A_inf/ξ̃≅O_C through θ̃. Under it the Hodge–Tate structure map η:R→H⁰(AΩ_R⊗^L_{A_inf,θ̃}O_C) of AI.4 agrees with the prismatic one, and the two Hodge–Tate isomorphisms of commutative differential graded algebras between (Ω^*_{R/O_C},d) and the cohomology of the θ̃ reduction with its Bockstein differential correspond; in particular the classes of dt on O_C⟨t⟩ and of dlog t on O_C⟨t^{±1}⟩ correspond. The comparison is the only isomorphism of such functors on p-completely smooth O_C-algebras that is compatible with η. The Breuil–Kisin twists are trivialised by the generator ξ̃, as in the proof of BS22 Theorem 17.2. The uniqueness statement, and the correspondence of the Hodge–Tate isomorphisms as natural isomorphisms of differential graded algebras, use that the comparison is natural in R and symmetric monoidal; BS22 assert both (Theorem 17.2, Remark 17.3) and they are not proved here. For a fixed R the isomorphism and its compatibility with η do not depend on them. (b) [Not in the sources.] It is neither stated nor proved in BS22, BMS1 or BMS2 that under these identifications the θ de Rham, crystalline, étale and B_dR⁺ comparison maps of AI.4–AI.5 correspond to those induced from the prismatic comparisons, nor that the Breuil–Kisin and trace specialisation maps of AI.7 correspond. These agreements are the open part of this target: the stage has to prove them, and no source does. BS22 Theorem 18.2 does not give them: it concerns functors, defined on all p-completely smooth algebras over the perfectoid ring, with values in complexes over a perfect prism, so it applies neither over the non-perfect prism (A_cris,(p)) nor to functors defined only on smooth O_K-algebras. The crystalline agreement is to be checked on the same PD/Koszul generators; uniqueness of the A_inf functor alone is not claimed to prove it.
Prerequisites: PrismaticCohomology:PR.6/ainf-omega-comparison, PrismaticCohomology:PR.6/theta-theta-tilde-square, PrismaticCohomology:PR.6/comparison-uniqueness, PrismaticCohomology:PR.1/crystalline-comparison, PrismaticCohomology:PR.1/prismatic-base-change, AInfCohomology:AI.4, AInfCohomology:AI.5, CohomologyComparisons:CP.3, RefinedTraceMethods:RT.6, EnhancedDerivedSheaves:E1/presentability-and-derived-tensor, AInfCohomology:AI.7/ainf-base-change, AInfCohomology:AI.7/trace-prismatic-agreement, AInfCohomology:AI.7/de-rham-base-change, AInfCohomology:AI.7/crystalline-base-change

AInfCohomology:AI.7/de-rham-torsion-divisibility
CohomologicalBK.deRhamTorsionDivisibility — application, typed in part above
Statement: Let K=Q_p(p^{1/p}) with uniformizer π=p^{1/p} and 𝔛/O_K proper smooth. The map θ_𝔖 has u↦π^p=p and factors through Z_p. Therefore RΓ_dR(𝔛/O_K) is the scalar extension of a perfect Z_p-complex. Each cyclic indecomposable summand of H^i_dR(𝔛/O_K)_tors has O_K-length divisible by p; equivalently it is O_K/(π^{pa}) for some a≥1. The total torsion length is a multiple of p.
Typed part: only the length calculation: for O_K=ℤ_p[π]/(π^p−p), π^p=p, the module O_K/(π^n) has length n and O_K/(p^a) has length p·a. Absent: the factorisation of θ_𝔖 through ℤ_p, the scalar extension of the perfect complex and the structure of the torsion of H^i_dR, which use supplier types.
Prerequisites: AInfCohomology:AI.7/de-rham-base-change, AInfCohomology:AI.7/perfect-cohomological-modules, AInfCohomology:AI.7/coefficient-normalization, AInfCohomology:AI.5, mathlib:Module.equiv_free_prod_directSum, mathlib:Module.equiv_directSum_of_isTorsion
-/

end
