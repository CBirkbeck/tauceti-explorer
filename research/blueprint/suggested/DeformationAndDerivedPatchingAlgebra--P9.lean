import Mathlib.Algebra.Category.ModuleCat.AB
import Mathlib.Algebra.Category.ModuleCat.ChangeOfRings
import Mathlib.Algebra.Homology.DerivedCategory.Linear
import Mathlib.Algebra.Homology.DerivedCategory.HomologySequence
import Mathlib.Algebra.Homology.DerivedCategory.TStructure
import Mathlib.CategoryTheory.Idempotents.Basic
import Mathlib.CategoryTheory.Abelian.Projective.Dimension
import Mathlib.RingTheory.Support
import Mathlib.RingTheory.Length
import Mathlib.RingTheory.RegularLocalRing.Defs
import Mathlib.RingTheory.Regular.RegularSequence
import Mathlib.RingTheory.Localization.AtPrime.Basic
import Mathlib.RingTheory.PowerSeries.Basic
import Mathlib.RingTheory.Ideal.Quotient.Operations

/-!
# Suggested Lean forms for P9: amplitude, depth and component support

This file is not the roadmap and is not exhaustive. The P9 reader document is definitive.
The declarations suggest Lean forms so contributors and reviewers converge on names and
signatures. Every new theorem remains a plan, with its proof omitted.

Pinned Mathlib: 082e2d3; pinned Tau Ceti: f790474.

`Dependency` records actual P7 contracts using the native derived category. Its type-valued
functor adapter is not an implementation. It does not redefine perfectness or derived tensor
as a new P9 target. Generic DG envelopes/tensor and generic Euler theory keep their owners.

Excellence and the complete ACC §6.3.5 ring/action setup do not yet have native supplier
interfaces. They are stated mathematically in the reader and packet. No unknown condition is
represented by an opaque proposition. The derived length signature below isolates the actual
finite-module length identity input; the component-chain signature isolates its concrete
nonvanishing transfer input. These are intermediate lemmas, not replacements for the complete
ACC theorem or its excellence hypotheses. The full native `lengthDefectModuleIdentity`
and `localConditionSupport` forms are omitted until the normalization and action-edge
interfaces below are expressible; the reader states their complete mathematical forms. P7 also owes the T-linear derived-action comparison
for its coefficient spectral sequence; its existing action node assumes strict chain actions.
-/

noncomputable section
open CategoryTheory CategoryTheory.Limits CategoryTheory.Pretriangulated
open scoped ZeroObject TensorProduct
universe u
attribute [local instance] HasDerivedCategory.standard

namespace TauCeti.PatchingSupport

abbrev Der (R : Type u) [CommRing R] := DerivedCategory (ModuleCat.{u} R)
abbrev Cpx (R : Type u) [CommRing R] := CochainComplex (ModuleCat.{u} R) ℤ
abbrev H {R : Type u} [CommRing R] (i : ℤ) (C : Der R) :=
  (DerivedCategory.homologyFunctor (ModuleCat R) i).obj C
abbrev stalk {R : Type u} [CommRing R] (M : ModuleCat.{u} R) (i : ℤ) : Der R :=
  (DerivedCategory.singleFunctor (ModuleCat R) i).obj M

namespace Dependency
/-- Imported P7 finite-projective interval contract. -/
def PerfectInterval {R : Type u} [CommRing R] (C : Der R) (a b : ℤ) : Prop :=
  ∃ P : Cpx R, (∀ i, i < a ∨ b < i → IsZero (P.X i)) ∧
    (∀ i, Module.Finite R (P.X i) ∧ Module.Projective R (P.X i)) ∧
    Nonempty ((DerivedCategory.Q.obj P) ≅ C)
/-- Imported P7 perfect-object contract. -/
def Perfect {R : Type u} [CommRing R] (C : Der R) : Prop :=
  ∃ a b : ℤ, a ≤ b ∧ PerfectInterval C a b
/-- Imported exact additive scalar-extension functor; its P7 specification is derived tensor. -/
def extension {R A : Type u} [CommRing R] [CommRing A] (f : R →+* A) :
    Der R ⥤ Der A := sorry
end Dependency

section Support
variable {R : Type u} [CommRing R]

/-- P9/cohomological-support. -/
def support (C : Der R) : Set (PrimeSpectrum R) := ⋃ i : ℤ, Module.support R (H i C)
/-- P9/cohomology-annihilator; this is not the annihilator of the derived object. -/
def cohomologyAnnihilator (C : Der R) : Ideal R := ⨅ i : ℤ, Module.annihilator R (H i C)

theorem mem_support (C : Der R) (p : PrimeSpectrum R) :
    p ∈ support C ↔ ∃ i : ℤ, p ∈ Module.support R (H i C) := sorry
theorem support_iso {C D : Der R} (e : C ≅ D) : support C = support D := sorry
theorem support_single (M : ModuleCat.{u} R) (i : ℤ) :
    support (stalk M i) = Module.support R M := sorry
theorem support_shift (C : Der R) (n : ℤ) : support (C⟦n⟧) = support C := sorry

theorem mem_cohomologyAnnihilator (C : Der R) (r : R) :
    r ∈ cohomologyAnnihilator C ↔ ∀ i : ℤ, ∀ x : H i C, r • x = 0 := sorry
theorem cohomologyAnnihilator_iso {C D : Der R} (e : C ≅ D) :
    cohomologyAnnihilator C = cohomologyAnnihilator D := sorry
theorem cohomologyAnnihilator_single (M : ModuleCat.{u} R) (i : ℤ) :
    cohomologyAnnihilator (stalk M i) = Module.annihilator R M := sorry
theorem cohomologyAnnihilator_biprod (C D : Der R) :
    cohomologyAnnihilator (biprod C D) = cohomologyAnnihilator C ⊓ cohomologyAnnihilator D := sorry

-- test: support_zero
example : support (0 : Der R) = ∅ := sorry
-- test: support_single_quotient
example (I : Ideal R) :
    support (stalk (ModuleCat.of R (R ⧸ I)) 0) = PrimeSpectrum.zeroLocus I := sorry
-- test: support_two_stalks
example (M N : ModuleCat.{u} R) :
    support (biprod (stalk M 0) (stalk N 1)) = Module.support R M ∪ Module.support R N := sorry
-- test: cohomologyAnnihilator_zero
example : cohomologyAnnihilator (0 : Der R) = ⊤ := sorry
-- test: cohomologyAnnihilator_quotient
example (I : Ideal R) : cohomologyAnnihilator (stalk (ModuleCat.of R (R ⧸ I)) 0) = I := sorry
-- test: cohomologyAnnihilator_two_quotients
example (I J : Ideal R) :
    cohomologyAnnihilator (biprod (stalk (ModuleCat.of R (R ⧸ I)) 0)
      (stalk (ModuleCat.of R (R ⧸ J)) 1)) = I ⊓ J := sorry

theorem supportEmpty (C : Der R) : support C = ∅ ↔ IsZero C := sorry

theorem supportClosed (C : Der R) (s : Finset ℤ)
    (hbound : ∀ i, i ∉ s → IsZero (H i C))
    (hfinite : ∀ i, Module.Finite R (H i C)) :
    support C = PrimeSpectrum.zeroLocus (cohomologyAnnihilator C) := sorry

theorem supportTriangle (t : Triangle (Der R)) (ht : t ∈ distTriang (Der R)) :
    support t.obj₂ ⊆ support t.obj₁ ∪ support t.obj₃ := sorry

theorem complexNearFaithfulness (C : Der R) (s : Finset ℤ)
    (hbound : ∀ i, i ∉ s → IsZero (H i C))
    (hfinite : ∀ i, Module.Finite R (H i C)) :
    cohomologyAnnihilator C ≤ nilradical R ↔ support C = Set.univ := sorry

/-- P7 derived scalar extension, not ordinary cohomology quotient. -/
theorem supportDerivedBaseChange {A : Type u} [CommRing A] (f : R →+* A) (C : Der R)
    (hC : Dependency.Perfect C) :
    support ((Dependency.extension f).obj C) = (PrimeSpectrum.comap f) ⁻¹' support C := sorry

theorem supportFramingQuotient (C : Der (PowerSeries R)) (hC : Dependency.Perfect C) :
    support ((Dependency.extension (PowerSeries.constantCoeff (R := R))).obj C) =
      (PrimeSpectrum.comap (PowerSeries.constantCoeff (R := R))) ⁻¹' support C := sorry

/-- CG inequality in the equivalent prime-by-prime dimension form. Nonzero is explicit. -/
theorem codimensionAmplitudeLemma [IsRegularLocalRing R] (C : Der R) (n l : ℕ) (a : ℤ)
    (hdim : ringKrullDim R = (n : WithBot ℕ∞)) (hl : l ≤ n)
    (hC : ¬ IsZero C) (hinterval : Dependency.PerfectInterval C a (a + l)) :
    ∃ p : PrimeSpectrum R, p ∈ support C ∧
      (n - l : WithBot ℕ∞) ≤ ringKrullDim (R ⧸ p.asIdeal) := sorry

/-- A support dimension upper bound equal to the permitted codimension forces concentration. -/
theorem balancedDimensionConcentration [IsRegularLocalRing R] (C : Der R) (n l : ℕ) (a : ℤ)
    (hdim : ringKrullDim R = (n : WithBot ℕ∞)) (hl : l ≤ n)
    (hC : ¬ IsZero C) (hinterval : Dependency.PerfectInterval C a (a + l))
    (hsupport : ∀ p ∈ support C,
      ringKrullDim (R ⧸ p.asIdeal) ≤ (n - l : WithBot ℕ∞)) :
    (∀ i : ℤ, i ≠ a + l → IsZero (H i C)) ∧ ¬ IsZero (H (a + l) C) := sorry

theorem balancedProjectiveDimension [IsRegularLocalRing R] (C : Der R) (n l : ℕ) (a : ℤ)
    (hdim : ringKrullDim R = (n : WithBot ℕ∞)) (hl : l ≤ n)
    (hC : ¬ IsZero C) (hinterval : Dependency.PerfectInterval C a (a + l))
    (hsupport : ∀ p ∈ support C,
      ringKrullDim (R ⧸ p.asIdeal) ≤ (n - l : WithBot ℕ∞)) :
    CategoryTheory.projectiveDimension (H (a + l) C) = (l : WithBot ℕ∞) := sorry

/-- Depth n-l is expressed using the R03.3 regular-sequence convention, not an opaque depth. -/
theorem balancedDepth [IsRegularLocalRing R] (C : Der R) (n l : ℕ) (a : ℤ)
    (hdim : ringKrullDim R = (n : WithBot ℕ∞)) (hl : l ≤ n)
    (hC : ¬ IsZero C) (hinterval : Dependency.PerfectInterval C a (a + l))
    (hsupport : ∀ p ∈ support C,
      ringKrullDim (R ⧸ p.asIdeal) ≤ (n - l : WithBot ℕ∞)) :
    ∃ rs : List R, rs.length = n - l ∧
      (∀ x ∈ rs, x ∈ IsLocalRing.maximalIdeal R) ∧
      RingTheory.Sequence.IsRegular (H (a + l) C) rs := sorry

theorem oneDegreeSpecialization [IsRegularLocalRing R] (C : Der R) (a : ℤ)
    (hC : ¬ IsZero C) (hinterval : Dependency.PerfectInterval C a a) :
    Module.Free R (H a C) ∧ Nonempty (C ≅ stalk (H a C) a) := sorry
/-- General quotient-support interface used by local-condition specialization.
The full ACC localConditionSupport form still needs the native derived-action edge bridge. -/
theorem supportLocalConditionQuotient (I : Ideal R) (C : Der R) (hC : Dependency.Perfect C) :
    support ((Dependency.extension (Ideal.Quotient.mk I)).obj C) =
      (PrimeSpectrum.comap (Ideal.Quotient.mk I)) ⁻¹' support C := sorry
end Support

section Actions
variable {S T : Type u} [CommRing S] [CommRing T] [Algebra S T]

/-- P9/derived-algebra-action: all equations concern actual derived morphisms. -/
structure DerivedAction (C : Der S) where
  toRingHom : T →+* End C
  scalar_eq : ∀ s : S, toRingHom (algebraMap S T s) = s • 𝟙 C

namespace DerivedAction
variable {C : Der S}

theorem ext {ρ σ : DerivedAction (T := T) C}
    (h : ∀ t, ρ.toRingHom t = σ.toRingHom t) : ρ = σ := sorry

/-- The underlying ring homomorphism is induced by native cohomology, not chosen independently. -/
def homologyAction (ρ : DerivedAction (T := T) C) (i : ℤ) :
    T →+* Module.End S (H i C) := sorry

/-- The canonical module instance obtained from the endomorphism action. -/
abbrev cohomologyModule (ρ : DerivedAction (T := T) C) (i : ℤ) : Module T (H i C) :=
  Module.compHom (H i C) (ρ.homologyAction i)

theorem scalar (ρ : DerivedAction (T := T) C) (i : ℤ) (s : S) (x : H i C) :
    (ρ.homologyAction i) (algebraMap S T s) x = s • x := sorry

/-- Transport is along an actual linear additive functor. -/
def transport {A : Type u} [CommRing A] [Algebra S A] (F : Der S ⥤ Der A)
    [F.Additive] [Linear S (Der A)] [F.Linear S] (ρ : DerivedAction (T := T) C) :
    T →+* End (F.obj C) := sorry

def single (M : ModuleCat.{u} S) (α : T →+* Module.End S M)
    (hα : ∀ s : S, ∀ x : M, α (algebraMap S T s) x = s • x) (i : ℤ) :
    DerivedAction (T := T) (stalk M i) := sorry

-- test: derivedAction_scalars
example (ρ : DerivedAction (T := S) C) (i : ℤ) (s : S) (x : H i C) :
    ρ.homologyAction i s x = s • x := sorry
-- test: derivedAction_zero
example : Unique (DerivedAction (T := T) (0 : Der S)) := sorry
-- test: derivedAction_stalk
example (M : ModuleCat.{u} S) (α : T →+* Module.End S M)
    (hα : ∀ s : S, ∀ x : M, α (algebraMap S T s) x = s • x) :
    ∃ e : H 0 (stalk M 0) ≃ₗ[S] M,
      ∀ t x, e ((single M α hα 0).homologyAction 0 t x) = α t (e x) := sorry
end DerivedAction

/-- P9/finite-euler-length. Finiteness is a hypothesis before any use of toNat. -/
def eulerLength (C : Der S) (ρ : DerivedAction (T := T) C) (s : Finset ℤ)
    (_hbound : ∀ i, i ∉ s → IsZero (H i C))
    (_hfinite : ∀ i, letI := ρ.cohomologyModule i; IsFiniteLength T (H i C)) : ℤ :=
  ∑ i ∈ s, letI := ρ.cohomologyModule i
           Int.negOnePow i * ((Module.length T (H i C)).toNat : ℤ)

variable (C : Der S) (ρ : DerivedAction (T := T) C)
variable (s : Finset ℤ) (hb : ∀ i, i ∉ s → IsZero (H i C))
variable (hf : ∀ i, letI := ρ.cohomologyModule i; IsFiniteLength T (H i C))

theorem eulerLength_range (t : Finset ℤ) (ht : ∀ i, i ∉ t → IsZero (H i C)) :
    eulerLength C ρ s hb hf = eulerLength C ρ t ht hf := sorry

theorem eulerLength_iso {D : Der S} (σ : DerivedAction (T := T) D) (e : C ≅ D)
    (he : ∀ x, ρ.toRingHom x ≫ e.hom = e.hom ≫ σ.toRingHom x)
    (t : Finset ℤ) (ht : ∀ i, i ∉ t → IsZero (H i D))
    (hft : ∀ i, letI := σ.cohomologyModule i; IsFiniteLength T (H i D)) :
    eulerLength C ρ s hb hf = eulerLength D σ t ht hft := sorry

/-- T-length on the module is taken through the SAME specified ring homomorphism. -/
theorem eulerLength_single (M : ModuleCat.{u} S) (α : T →+* Module.End S M)
    (hα : ∀ r : S, ∀ x : M, α (algebraMap S T r) x = r • x)
    (i : ℤ) (hbi : ∀ j, j ∉ ({i} : Finset ℤ) → IsZero (H j (stalk M i)))
    (hfi : ∀ j, letI := (DerivedAction.single M α hα i).cohomologyModule j
                IsFiniteLength T (H j (stalk M i))) :
    eulerLength (stalk M i) (DerivedAction.single M α hα i) {i} hbi hfi =
      letI := Module.compHom M α
      Int.negOnePow i * ((Module.length T M).toNat : ℤ) := sorry

/-- Uses an explicit transported action, with the shift functor fixed. -/
theorem eulerLength_shift (n : ℤ) (σ : DerivedAction (T := T) (C⟦n⟧))
    (hσ : ∀ x, σ.toRingHom x = (shiftFunctor (Der S) n).map (ρ.toRingHom x))
    (t : Finset ℤ) (ht : ∀ i, i ∉ t → IsZero (H i (C⟦n⟧)))
    (hft : ∀ i, letI := σ.cohomologyModule i; IsFiniteLength T (H i (C⟦n⟧))) :
    eulerLength (C⟦n⟧) σ t ht hft = Int.negOnePow n * eulerLength C ρ s hb hf := sorry

theorem eulerLength_biprod (D : Der S) (σ : DerivedAction (T := T) D)
    (τ : DerivedAction (T := T) (biprod C D))
    (hτ : ∀ x, τ.toRingHom x = biprod.map (ρ.toRingHom x) (σ.toRingHom x))
    (hD : ∀ i, i ∉ s → IsZero (H i D))
    (hfD : ∀ i, letI := σ.cohomologyModule i; IsFiniteLength T (H i D))
    (hCD : ∀ i, i ∉ s → IsZero (H i (biprod C D)))
    (hfCD : ∀ i, letI := τ.cohomologyModule i; IsFiniteLength T (H i (biprod C D))) :
    eulerLength (biprod C D) τ s hCD hfCD =
      eulerLength C ρ s hb hf + eulerLength D σ s hD hfD := sorry

-- test: eulerLength_zero
example (ρ₀ : DerivedAction (T := T) (0 : Der S))
    (hb₀ : ∀ i, i ∉ s → IsZero (H i (0 : Der S)))
    (hf₀ : ∀ i, letI := ρ₀.cohomologyModule i; IsFiniteLength T (H i (0 : Der S))) :
    eulerLength 0 ρ₀ s hb₀ hf₀ = 0 := sorry

end Actions

section EulerTests
variable {k : Type u} [Field k]

-- test: eulerLength_field_stalk
example (ρ : DerivedAction (T := k) (stalk (ModuleCat.of k k) 1))
    (hb : ∀ i, i ∉ ({1} : Finset ℤ) → IsZero (H i (stalk (ModuleCat.of k k) 1)))
    (hf : ∀ i, letI := ρ.cohomologyModule i
              IsFiniteLength k (H i (stalk (ModuleCat.of k k) 1))) :
    eulerLength (stalk (ModuleCat.of k k) 1) ρ {1} hb hf = -1 := sorry

-- test: eulerLength_cancellation
example (ρ : DerivedAction (T := k)
    (biprod (stalk (ModuleCat.of k k) 0) (stalk (ModuleCat.of k k) 1)))
    (hb : ∀ i, i ∉ ({0, 1} : Finset ℤ) →
      IsZero (H i (biprod (stalk (ModuleCat.of k k) 0) (stalk (ModuleCat.of k k) 1))))
    (hf : ∀ i, letI := ρ.cohomologyModule i
      IsFiniteLength k (H i (biprod (stalk (ModuleCat.of k k) 0) (stalk (ModuleCat.of k k) 1)))) :
    eulerLength (biprod (stalk (ModuleCat.of k k) 0) (stalk (ModuleCat.of k k) 1))
      ρ {0, 1} hb hf = 0 ∧
      ¬ IsZero (biprod (stalk (ModuleCat.of k k) 0) (stalk (ModuleCat.of k k) 1)) := sorry
end EulerTests

section IdempotentLocalization
variable {S T : Type u} [CommRing S] [CommRing T] [Algebra S T]
variable (C : Der S) (ρ : DerivedAction (T := T) C) (e : T) (he : e * e = e)
variable [IsIdempotentComplete (Der S)]

/-- Native retract interface. For ACC use C=C_q, T=T_q and e=e_p from its finite-algebra
product decomposition. This signature assumes the genuine idempotent-completeness supplier. -/
def genericLocalization (he : e * e = e) :
    Σ D : Der S, {d : (D ⟶ C) × (C ⟶ D) //
      d.1 ≫ d.2 = 𝟙 D ∧ d.2 ≫ d.1 = ρ.toRingHom e} := sorry

theorem genericLocalization_retract :
    let L := genericLocalization C ρ e he
    L.2.val.1 ≫ L.2.val.2 = 𝟙 L.1 ∧ L.2.val.2 ≫ L.2.val.1 = ρ.toRingHom e := sorry

/-- The concrete range interface; the reader's finite-algebra lemma identifies this range with
H^i(C)_p when e=e_p after localization at q. -/
theorem genericLocalization_homology (i : ℤ) :
    Nonempty ((H i (genericLocalization C ρ e he).1) ≃ₗ[S]
      LinearMap.range ((DerivedCategory.homologyFunctor (ModuleCat S) i).map
        (ρ.toRingHom e)).hom) := sorry

theorem genericLocalization_iso {D : Der S} (σ : DerivedAction (T := T) D)
    (f : C ⟶ D) (hf : ∀ t, ρ.toRingHom t ≫ f = f ≫ σ.toRingHom t) :
    ∃ g : (genericLocalization C ρ e he).1 ⟶ (genericLocalization D σ e he).1,
      g ≫ (genericLocalization D σ e he).2.val.1 =
        (genericLocalization C ρ e he).2.val.1 ≫ f := sorry

theorem genericLocalization_choice (D : Der S) (i : D ⟶ C) (p : C ⟶ D)
    (h₁ : i ≫ p = 𝟙 D) (h₂ : p ≫ i = ρ.toRingHom e) :
    ∃ α : D ≅ (genericLocalization C ρ e he).1,
      α.hom ≫ (genericLocalization C ρ e he).2.val.1 = i ∧
      p ≫ α.hom = (genericLocalization C ρ e he).2.val.2 := sorry

-- test: genericLocalization_zero
example (ρ₀ : DerivedAction (T := T) (0 : Der S)) :
    IsZero (genericLocalization 0 ρ₀ e he).1 := sorry
-- test: genericLocalization_scalar_domain
-- The generic factor for a domain is the unit factor after scalar localization.
example (ρ : DerivedAction (T := T) C) :
    Nonempty ((genericLocalization C ρ 1 (by simp)).1 ≅ C) := sorry
-- test: genericLocalization_product
example {k : Type u} [Field k] [IsIdempotentComplete (Der k)]
    (M N : ModuleCat.{u} k)
    (ρ : DerivedAction (T := k × k) (biprod (stalk M 0) (stalk N 0)))
    (hρ : ρ.toRingHom (1, 0) = biprod.fst ≫ biprod.inl) :
    Nonempty ((genericLocalization (biprod (stalk M 0) (stalk N 0)) ρ (1, 0)
      (by simp)).1 ≅ stalk M 0) := sorry
end IdempotentLocalization

section PatchedConcentration
variable {S T : Type u} [CommRing S] [CommRing T] [Algebra S T]

/-- The finite algebra support bound feeds the regular-base concentration theorem.
P8 supplies the patched object; this theorem only consumes the specified algebraic inputs. -/
theorem balancedPatchedComplex [IsRegularLocalRing S] [Module.Finite S T]
    (C : Der S) (ρ : DerivedAction (T := T) C) (n l : ℕ) (a : ℤ)
    (hdim : ringKrullDim S = (n : WithBot ℕ∞)) (hl : l ≤ n)
    (hC : ¬ IsZero C) (hinterval : Dependency.PerfectInterval C a (a + l))
    (hsupport : ∀ i : ℤ, letI := ρ.cohomologyModule i
      ∀ p ∈ Module.support T (H i C),
        ringKrullDim (T ⧸ p.asIdeal) ≤ (n - l : WithBot ℕ∞)) :
    (∀ i : ℤ, i ≠ a + l → IsZero (H i C)) ∧
    CategoryTheory.projectiveDimension (H (a + l) C) = (l : WithBot ℕ∞) ∧
    ∃ rs : List S, rs.length = n - l ∧
      (∀ x ∈ rs, x ∈ IsLocalRing.maximalIdeal S) ∧
      RingTheory.Sequence.IsRegular (H (a + l) C) rs := sorry
end PatchedConcentration

section LengthLemmas
variable {T : Type u} [CommRing T]

/-- A finite-length endomorphism has equal kernel/cokernel lengths. -/
theorem lengthDefectFiniteLengthZero (M : ModuleCat.{u} T) (hfl : IsFiniteLength T M) (f : T) :
    Module.length T (QuotSMulTop f M) =
      Module.length T (LinearMap.ker (f • (LinearMap.id : M →ₗ[T] M))) := sorry

/-- Finite module identity is stated as an input until the excellent normalization API exists.
This is its mathematically precise integer-valued form, with actual localized modules. -/
theorem derivedLengthSum (f : T) (p : PrimeSpectrum T) (a : ℤ)
    (ha : 0 < a) (hreg : IsSMulRegular T f)
    (hmodule : ∀ M : ModuleCat.{u} T, Module.Finite T M →
      (((Module.length T (QuotSMulTop f M)).toNat : ℤ) -
        ((Module.length T (LinearMap.ker (f • (LinearMap.id : M →ₗ[T] M)))).toNat : ℤ)) =
      a * ((Module.length (Localization.AtPrime p.asIdeal)
        (LocalizedModule p.asIdeal.primeCompl M)).toNat : ℤ))
    (C : Der T) (s : Finset ℤ)
    (hbound : ∀ i, i ∉ s → IsZero (H i C))
    (hfin : ∀ i, Module.Finite T (H i C))
    (hker : ∀ i, IsFiniteLength T
      (LinearMap.ker (f • (LinearMap.id : H i C →ₗ[T] H i C))))
    (hcoker : ∀ i, IsFiniteLength T (QuotSMulTop f (H i C)))
    (hgeneric : ∀ i, IsFiniteLength (Localization.AtPrime p.asIdeal)
      (LocalizedModule p.asIdeal.primeCompl (H i C))) :
    (∑ i ∈ s, Int.negOnePow i *
      (((Module.length T (QuotSMulTop f (H i C))).toNat : ℤ) -
        ((Module.length T (LinearMap.ker (f • (LinearMap.id : H i C →ₗ[T] H i C)))).toNat : ℤ))) =
    a * (∑ i ∈ s, Int.negOnePow i *
      ((Module.length (Localization.AtPrime p.asIdeal)
        (LocalizedModule p.asIdeal.primeCompl (H i C))).toNat : ℤ)) := sorry

/-- Explicit component graph consequence used at the end of ACC 6.3.8. The reader provides the
ring hypotheses which establish every transfer input below; none is an opaque predicate. -/
theorem supportTransportAvoidingIhara
    {X Y B : Type*} (topX : Set X) (topY : Set Y) (supported : Set X)
    (χ : X → ℤ) (χ' : Y → ℤ) (χbar χbar' : B → ℤ)
    (specializes : X → B → Prop) (specializes' : Y → B → Prop)
    (x' : Y) (hunique : topY = {x'})
    (hseed : ∃ x ∈ topX, χ x ≠ 0)
    (hchoose : ∀ x ∈ topX, ∃ b, specializes x b ∧ specializes' x' b)
    (htransfer : ∀ x ∈ topX, ∀ b, specializes x b → (χ x ≠ 0 ↔ χbar b ≠ 0))
    (htransfer' : ∀ y ∈ topY, ∀ b, specializes' y b → (χ' y ≠ 0 ↔ χbar' b ≠ 0))
    (hcompare : ∀ b, χbar b = χbar' b)
    (hsupport : ∀ x ∈ topX, χ x ≠ 0 → x ∈ supported) :
    topX ⊆ supported := sorry
end LengthLemmas

section CompatibleEulerTriangle
variable {S T : Type u} [CommRing S] [CommRing T] [Algebra S T]

/-- Compatible actions are literal commuting squares, including the connecting morphism. -/
theorem eulerLengthTriangle (t : Triangle (Der S)) (ht : t ∈ distTriang (Der S))
    (ρ₁ : DerivedAction (T := T) t.obj₁) (ρ₂ : DerivedAction (T := T) t.obj₂)
    (ρ₃ : DerivedAction (T := T) t.obj₃)
    (h₁₂ : ∀ x, ρ₁.toRingHom x ≫ t.mor₁ = t.mor₁ ≫ ρ₂.toRingHom x)
    (h₂₃ : ∀ x, ρ₂.toRingHom x ≫ t.mor₂ = t.mor₂ ≫ ρ₃.toRingHom x)
    (h₃₁ : ∀ x, ρ₃.toRingHom x ≫ t.mor₃ =
      t.mor₃ ≫ (shiftFunctor (Der S) (1 : ℤ)).map (ρ₁.toRingHom x))
    (s : Finset ℤ) (hb₁ : ∀ i, i ∉ s → IsZero (H i t.obj₁))
    (hb₂ : ∀ i, i ∉ s → IsZero (H i t.obj₂))
    (hb₃ : ∀ i, i ∉ s → IsZero (H i t.obj₃))
    (hf₁ : ∀ i, letI := ρ₁.cohomologyModule i; IsFiniteLength T (H i t.obj₁))
    (hf₃ : ∀ i, letI := ρ₃.cohomologyModule i; IsFiniteLength T (H i t.obj₃)) :
    ∃ hf₂ : ∀ i, letI := ρ₂.cohomologyModule i; IsFiniteLength T (H i t.obj₂),
      eulerLength t.obj₂ ρ₂ s hb₂ hf₂ =
        eulerLength t.obj₁ ρ₁ s hb₁ hf₁ + eulerLength t.obj₃ ρ₃ s hb₃ hf₃ := sorry

/-- Native finite-algebra version of the derived identity, with the divisor-cone comparison
and module identity as explicit inputs. In ACC, T is already T_m and p is its unique generic.
The source's excellence/localization hypotheses supply hmodule and all finiteness inputs.
The generic summand has these same localized cohomology modules by its homology API. -/
theorem derivedLengthIdentity (C D : Der S)
    (ρ : DerivedAction (T := T) C) (σ : DerivedAction (T := T) D)
    (f : S) (hreg : IsSMulRegular S f) (p : PrimeSpectrum T) (a : ℤ) (ha : 0 < a)
    (g : C ⟶ D) (h : D ⟶ C⟦(1 : ℤ)⟧)
    (htriangle : Triangle.mk (f • 𝟙 C) g h ∈ distTriang (Der S))
    (hg : ∀ x, ρ.toRingHom x ≫ g = g ≫ σ.toRingHom x)
    (hh : ∀ x, σ.toRingHom x ≫ h =
      h ≫ (shiftFunctor (Der S) (1 : ℤ)).map (ρ.toRingHom x))
    (hmodule : ∀ M : ModuleCat.{u} T, Module.Finite T M →
      (((Module.length T (QuotSMulTop (algebraMap S T f) M)).toNat : ℤ) -
        ((Module.length T (LinearMap.ker
          ((algebraMap S T f) • (LinearMap.id : M →ₗ[T] M)))).toNat : ℤ)) =
      a * ((Module.length (Localization.AtPrime p.asIdeal)
        (LocalizedModule p.asIdeal.primeCompl M)).toNat : ℤ))
    (s t : Finset ℤ) (hC : ∀ i, i ∉ s → IsZero (H i C))
    (hD : ∀ i, i ∉ t → IsZero (H i D))
    (hfC : ∀ i, letI := ρ.cohomologyModule i; Module.Finite T (H i C))
    (hfD : ∀ i, letI := σ.cohomologyModule i; IsFiniteLength T (H i D))
    (hker : ∀ i, letI := ρ.cohomologyModule i
      IsFiniteLength T (LinearMap.ker
        ((algebraMap S T f) • (LinearMap.id : H i C →ₗ[T] H i C))))
    (hcoker : ∀ i, letI := ρ.cohomologyModule i
      IsFiniteLength T (QuotSMulTop (algebraMap S T f) (H i C)))
    (hgeneric : ∀ i, letI := ρ.cohomologyModule i
      IsFiniteLength (Localization.AtPrime p.asIdeal)
        (LocalizedModule p.asIdeal.primeCompl (H i C))) :
    eulerLength D σ t hD hfD =
      a * (∑ i ∈ s, letI := ρ.cohomologyModule i
        Int.negOnePow i * ((Module.length (Localization.AtPrime p.asIdeal)
          (LocalizedModule p.asIdeal.primeCompl (H i C))).toNat : ℤ)) := sorry
end CompatibleEulerTriangle

end TauCeti.PatchingSupport
