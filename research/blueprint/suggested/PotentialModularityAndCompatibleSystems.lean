import TauCeti.AlgebraicGeometry.LineBundle.Class
import Mathlib.Algebra.Polynomial.Reverse
import Mathlib.AlgebraicGeometry.Modules.Sheaf
import Mathlib.AlgebraicGeometry.Morphisms.ClosedImmersion
import Mathlib.AlgebraicGeometry.Morphisms.Finite
import Mathlib.Analysis.SpecialFunctions.Gamma.Deligne
import Mathlib.Analysis.SpecialFunctions.Pow.Complex
import Mathlib.Data.Finsupp.Basic
import Mathlib.Data.Multiset.Sum
import Mathlib.FieldTheory.AbsoluteGaloisGroup
import Mathlib.FieldTheory.IsAlgClosed.AlgebraicClosure
import Mathlib.FieldTheory.LinearDisjoint
import Mathlib.LinearAlgebra.Charpoly.Basic
import Mathlib.LinearAlgebra.Matrix.GeneralLinearGroup.Defs
import Mathlib.NumberTheory.LSeries.RiemannZeta
import Mathlib.NumberTheory.NumberField.Completion.FinitePlace
import Mathlib.NumberTheory.NumberField.InfinitePlace.TotallyRealComplex
import Mathlib.RepresentationTheory.Induced
import Mathlib.RepresentationTheory.Irreducible
import Mathlib.RepresentationTheory.Semisimple
import Mathlib.RingTheory.AdicCompletion.Basic
import Mathlib.RingTheory.DiscreteValuationRing.Basic
import Mathlib.RingTheory.Flat.Basic
import Mathlib.RingTheory.IntegralClosure.IntegralRestrict
import Mathlib.RingTheory.KrullDimension.Basic
import Mathlib.RingTheory.MvPowerSeries.Inverse
import Mathlib.RingTheory.Regular.RegularSequence
import Mathlib.Tactic

/-!
# Suggested Lean forms: Potential modularity and compatible systems

Standard note: this file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/PotentialModularityAndCompatibleSystems.md` is definitive. The forms
below suggest names and signatures, so that contributors and reviewers converge on an interface;
every proof is `sorry`, and nothing here is implemented. Pins: Mathlib
082e2d37e8b0463410cdb532e111cd43d5a66174, Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.

The file joins the suggested files of the roadmap's two parts.
* `TauCeti.PotentialModularity`: R23.1–R23.5, field selection and potential modularity, with the
  unit tests of those layers beside their declarations. R23.6 has no declarations of its own.
* `TauCeti.CompatibleSystems`: R24.1–R24.2, finiteness and characteristic-zero points, with their
  tests; then R24.3–R24.6, prescribed lifts and compatible systems, including the operations
  sub-layer of R24.5.
* `TauCeti.CompatibleSystems.Tests`: the unit tests of R24.3–R24.6.
* A closing catalogue lists every name of R24.3–R24.6 with its packet statement, saying which
  declarations above are fragments and which full signatures are omitted.
`GaloisGroup F` is Mathlib's `Field.absoluteGaloisGroup F` throughout.

Omissions are explicit; no missing condition is encoded by an arbitrary `Prop` field or a dummy
predicate. Where the libraries lack an object a full statement needs, the declaration keeps only
the conditions that can be stated, and its docstring says what is left out. Such a reduced
signature is not a theorem about arbitrary rings or representations: a `sorry` on it must be
read together with the omitted hypotheses in the roadmap document.
* R23.1. The all-places and completion identifications, analytic topology, smoothness and
  geometric irreducibility of Skolem data come from the suppliers. `IntegralPoint` uses the
  normalisation description; its comparison with an irreducible closed subscheme, finite over
  the base, is omitted. The Picard prototype is the objectwise rigidified quotient over Tau Ceti's
  invertible sheaves and line-bundle classes; its group law's relation to tensor and dual,
  relative pullback, sheafification, degree components, Cartier divisors and representability
  are omitted.
* R23.2–R24.2. Hilbert eigenforms, automorphic representations, local deformation problems and
  their universal rings are not available in the form needed. The field-selection and Galois
  signatures omit automorphic witnesses and local-type conditions, and the finiteness signatures
  omit the deformation-problem hypotheses.
* R24.3–R24.6. The libraries have absolute Galois groups with the Krull topology, finite primes,
  completions, representations, semisimplicity, duals, induction and characteristic polynomials;
  they lack local inertia and Frobenius, Weil–Deligne parameters, labelled Hodge–Tate data,
  deformation and automorphic objects, Dirichlet density and reductive integral models. The
  family structures are therefore carrier fragments: they omit the unramified, Frobenius and
  p-adic Hodge conditions and KW's Weil–Deligne data. Coefficient fields are models supplied at
  the primes of the coefficient number field. `IsPure` takes the residue cardinality as an
  argument; identifying it with the norm is an omitted supplier condition. The polarization
  fragment states the perfect pairings and their equations with the CM conjugation maps
  supplied; identifying those maps with the CM extension, and linking multiplier characters to
  members of the multiplier system, are omitted.
For a test whose object is missing, the example states only the indicated algebraic or
numerical fragment, and the comment above it gives the full intended assertion.
-/

open CategoryTheory AlgebraicGeometry
open TauCeti.AlgebraicGeometry
open scoped TensorProduct
universe u
noncomputable section

namespace TauCeti.PotentialModularity

/-! ## R23.1: Moret–Bailly's theorem (Skolem data, the rigidified Picard functor) -/

abbrev Point (A : Type u) [CommRing A] (X : Scheme.{u}) := Spec (.of A) ⟶ X

/-- Auxiliary packaging of actual field/algebra/finite-dimensional data. -/
structure FiniteExtension (K : Type u) [Field K] where
  carrier : Type u
  [field : Field carrier]
  [algebra : Algebra K carrier]
  [finite : FiniteDimensional K carrier]

attribute [instance] FiniteExtension.field FiniteExtension.algebra FiniteExtension.finite

/-- Splitting after scalar extension to L, not equality of completions with L. -/
abbrev SplitOver (K E L : Type u) [Field K] [Field E] [Field L]
    [Algebra K E] [Algebra K L] :=
  Nonempty ((L ⊗[K] E) ≃ₐ[L] (Fin (Module.finrank K E) → L))

/-- R23.1/skolem-datum-and-integral-point. The unavailable conditions are listed above. -/
structure SkolemDatum (R K : Type u) [CommRing R] [Field K] [Algebra R K]
    (V : Type u) (L : V → Type u) [∀ v, Field (L v)] [∀ v, Algebra K (L v)] where
  X : Scheme.{u}
  f : X ⟶ Spec (.of R)
  sigma : Finset V
  closedPlaces : Set V
  disjoint : ∀ v ∈ sigma, v ∉ closedPlaces
  Ω : ∀ v, Set (Point (L v) X)
  topology : ∀ v, TopologicalSpace (Point (L v) X)
  open_Ω : ∀ v ∈ sigma, @IsOpen _ (topology v) (Ω v)
  nonempty_Ω : ∀ v ∈ sigma, (Ω v).Nonempty

variable {R K V : Type u} [CommRing R] [Field K] [Algebra R K]
  {L : V → Type u} [∀ v, Field (L v)] [∀ v, Algebra K (L v)]

def SkolemDatum.IsComplete (S : SkolemDatum R K V L) : Prop :=
  ∀ v, v ∈ S.sigma ∨ v ∈ S.closedPlaces

/-- The concrete generic-extension criterion of MB II Remark 1.5. -/
def SkolemDatum.FieldPoint (S : SkolemDatum R K V L) (E : FiniteExtension K)
    [Algebra R E.carrier] [IsScalarTower R K E.carrier]
    (x : Point (integralClosure R E.carrier) S.X) : Prop :=
  (x ≫ S.f = Spec.map (CommRingCat.ofHom (algebraMap R (integralClosure R E.carrier)))) ∧
  (∀ v ∈ S.sigma, SplitOver K E.carrier (L v)) ∧
  (∀ v ∈ S.sigma, ∀ e : E.carrier →ₐ[K] L v,
    Spec.map (CommRingCat.ofHom
      (e.toRingHom.comp (algebraMap (integralClosure R E.carrier) E.carrier))) ≫ x ∈ S.Ω v)

structure SkolemDatum.IntegralPoint (S : SkolemDatum R K V L) where
  E : FiniteExtension K
  [algebraR : Algebra R E.carrier]
  [tower : IsScalarTower R K E.carrier]
  x : Point (integralClosure R E.carrier) S.X
  valid : S.FieldPoint E x

attribute [instance] SkolemDatum.IntegralPoint.algebraR SkolemDatum.IntegralPoint.tower

lemma SkolemDatum.fieldPoint_split (S : SkolemDatum R K V L) (E : FiniteExtension K)
    [Algebra R E.carrier] [IsScalarTower R K E.carrier]
    (x : Point (integralClosure R E.carrier) S.X) (hx : S.FieldPoint E x)
    (v : V) (hv : v ∈ S.sigma) : SplitOver K E.carrier (L v) := by
  sorry

lemma SkolemDatum.fieldPoint_local (S : SkolemDatum R K V L) (E : FiniteExtension K)
    [Algebra R E.carrier] [IsScalarTower R K E.carrier]
    (x : Point (integralClosure R E.carrier) S.X) (hx : S.FieldPoint E x)
    (v : V) (hv : v ∈ S.sigma) (e : E.carrier →ₐ[K] L v) :
    Spec.map (CommRingCat.ofHom
      (e.toRingHom.comp (algebraMap (integralClosure R E.carrier) E.carrier))) ≫ x ∈ S.Ω v := by
  sorry

lemma SkolemDatum.isComplete_congr (S T : SkolemDatum R K V L)
    (hs : S.sigma = T.sigma) (hc : S.closedPlaces = T.closedPlaces) :
    S.IsComplete ↔ T.IsComplete := by
  sorry

/-- Map normalized field points. The geometric closed-image comparison remains omitted. -/
def SkolemDatum.mapPoint (S T : SkolemDatum R K V L) (f : S.X ⟶ T.X)
    (hf : f ≫ T.f = S.f) (hs : S.sigma = T.sigma)
    (hΩ : ∀ v ∈ S.sigma, ∀ y ∈ S.Ω v, y ≫ f ∈ T.Ω v)
    (x : S.IntegralPoint) : T.IntegralPoint := by
  sorry

/-- Generic criterion; its equivalence to the geometric closed-subscheme definition is omitted. -/
lemma SkolemDatum.integralPoint_iff (S : SkolemDatum R K V L) (E : FiniteExtension K)
    [Algebra R E.carrier] [IsScalarTower R K E.carrier]
    (x : Point (integralClosure R E.carrier) S.X) :
    S.FieldPoint E x ↔
      (x ≫ S.f = Spec.map (CommRingCat.ofHom (algebraMap R (integralClosure R E.carrier)))) ∧
      (∀ v ∈ S.sigma, SplitOver K E.carrier (L v)) ∧
      (∀ v ∈ S.sigma, ∀ e : E.carrier →ₐ[K] L v,
        Spec.map (CommRingCat.ofHom
          (e.toRingHom.comp (algebraMap (integralClosure R E.carrier) E.carrier))) ≫ x ∈ S.Ω v) := by
  sorry

/-- The algebra equivalence is over L; requiring factors L over K_v is stronger. -/
lemma SkolemDatum.split_iff_algEquiv (E : FiniteExtension K) (v : V) :
    SplitOver K E.carrier (L v) ↔
      Nonempty (((L v) ⊗[K] E.carrier) ≃ₐ[L v]
        (Fin (Module.finrank K E.carrier) → L v)) := by
  sorry

/-- Local-data part of enlargement. Removing T from the arithmetic base and taking closure
are omitted: the new base ring is a localization of R, rather than this unchanged parameter. -/
def SkolemDatum.enlargeSigma [DecidableEq V] (S : SkolemDatum R K V L) (T : Finset V)
    (Ω' : ∀ v, Set (Point (L v) S.X))
    (ho : ∀ v ∈ S.sigma ∪ T, @IsOpen _ (S.topology v) (Ω' v))
    (hn : ∀ v ∈ S.sigma ∪ T, (Ω' v).Nonempty) :
    {S' : SkolemDatum R K V L //
      S'.sigma = S.sigma ∪ T ∧ S'.closedPlaces = S.closedPlaces \ (T : Set V)} := by
  sorry

/- Unit tests: full geometric interpretations are specified in the reader. -/
/-- skolem_complete_Z: completeness on Q's places, and the conjugate-norm obstruction. -/
example (L : Option Nat.Primes → Type) [∀ v, Field (L v)] [∀ v, Algebra ℚ (L v)]
    (S : SkolemDatum ℤ ℚ (Option Nat.Primes) L)
    (hs : S.sigma = {none}) (hc : S.closedPlaces = {v | v ≠ none}) :
    S.IsComplete ∧
    (∀ (n : ℕ) (hn : 0 < n) (z : Fin n → ℂ),
      (∏ i, ‖z i‖) = 1 → ¬ (∀ i, ‖z i‖ < 1)) := by
  sorry

/-- skolem_incomplete_Z_half: remove 2 from the closed places, keep infinity in sigma. -/
example (L : Option Nat.Primes → Type) [∀ v, Field (L v)] [∀ v, Algebra ℚ (L v)]
    (S : SkolemDatum ℤ ℚ (Option Nat.Primes) L)
    (hs : S.sigma = {none})
    (hc : S.closedPlaces = {v | ∃ p : Nat.Primes, p.val ≠ 2 ∧ v = some p}) :
    ¬ S.IsComplete := by
  sorry

/-- skolem_trivial_X: the generic extension K works even for nontrivial L/K. -/
example (F : Type u) [Field F] [Algebra K F] : SplitOver K K F := by
  sorry

/-- skolem_open_required: a singleton in a nondiscrete local analytic curve is inadmissible.
This is the local analytic test, after choosing a coordinate in Q_p or R. -/
example (x : ℝ) : ¬ IsOpen ({x} : Set ℝ) := by
  sorry

/-- skolem_fieldPoint_local: the object imposes the condition at every embedding. -/
example (S : SkolemDatum R K V L) (x : S.IntegralPoint)
    (v : V) (hv : v ∈ S.sigma) (e : x.E.carrier →ₐ[K] L v) :
    Spec.map (CommRingCat.ofHom
      (e.toRingHom.comp (algebraMap (integralClosure R x.E.carrier) x.E.carrier))) ≫ x.x ∈ S.Ω v := by
  sorry

/-- R23.1/generalized-picard-functor-and-effective-divisor-fibration. -/
structure Rigidified (X Z : Scheme.{u}) (i : Z ⟶ X) where
  line : InvertibleSheaf X
  trivialization : (Scheme.Modules.pullback i).obj line.obj ≅ (InvertibleSheaf.trivial Z).obj

def rigidifiedSetoid (X Z : Scheme.{u}) (i : Z ⟶ X) : Setoid (Rigidified X Z i) where
  r A B := Nonempty {e : A.line.obj ≅ B.line.obj //
    (Scheme.Modules.pullback i).map e.hom ≫ B.trivialization.hom = A.trivialization.hom}
  iseqv := by sorry

def generalizedPicard (X Z : Scheme.{u}) (i : Z ⟶ X) : Type _ :=
  Quotient (rigidifiedSetoid X Z i)

lemma generalizedPicard_mk_eq_iff (X Z : Scheme.{u}) (i : Z ⟶ X)
    (A B : Rigidified X Z i) :
    (Quotient.mk _ A : generalizedPicard X Z i) = Quotient.mk _ B ↔
      Nonempty {e : A.line.obj ≅ B.line.obj //
        (Scheme.Modules.pullback i).map e.hom ≫ B.trivialization.hom = A.trivialization.hom} := by
  sorry

def generalizedPicard_lift (X Z : Scheme.{u}) (i : Z ⟶ X) (T : Type*)
    (f : Rigidified X Z i → T)
    (hf : ∀ A B, (rigidifiedSetoid X Z i).r A B → f A = f B) :
    generalizedPicard X Z i → T := Quotient.lift f hf

lemma generalizedPicard_lift_mk (X Z : Scheme.{u}) (i : Z ⟶ X) (T : Type*)
    (f : Rigidified X Z i → T)
    (hf : ∀ A B, (rigidifiedSetoid X Z i).r A B → f A = f B)
    (A : Rigidified X Z i) :
    generalizedPicard_lift X Z i T f hf (Quotient.mk _ A) = f A := by
  sorry

/-- Objectwise group signature. Tensor/dual compatibility and the relative group sheaf
are not supplied by this signature; the packet requests their precise construction. -/
noncomputable instance generalizedPicard_group (X Z : Scheme.{u}) (i : Z ⟶ X) :
    CommGroup (generalizedPicard X Z i) := by
  sorry

/-- Quotient descent of the supplier's actual rigidified pullback. Its construction
from a Cartesian square and the identity/composition laws remain omitted. -/
def generalizedPicard_pullback (X Z Y W : Scheme.{u}) (i : Z ⟶ X) (j : W ⟶ Y)
    (pull : Rigidified X Z i → Rigidified Y W j)
    (hp : ∀ A B, (rigidifiedSetoid X Z i).r A B →
      (rigidifiedSetoid Y W j).r (pull A) (pull B)) :
    generalizedPicard X Z i → generalizedPicard Y W j := Quotient.map pull hp

/-- Forgetting is well-defined on rigidified isomorphism classes, into the pinned class type. -/
def generalizedPicard_forget (X Z : Scheme.{u}) (i : Z ⟶ X) :
    generalizedPicard X Z i → LineBundleClass X :=
  Quotient.lift (fun A ↦ LineBundleClass.mk A.line) (by sorry)

/-- Exactness at PG on objectwise points. Full sheaf exactness, including the last arrow's
local surjectivity, is omitted and requires the relative/fppf supplier. -/
lemma generalizedPicard_exact (X Z : Scheme.{u}) (i : Z ⟶ X)
    (P : generalizedPicard X Z i) :
    generalizedPicard_forget X Z i P = LineBundleClass.mk (InvertibleSheaf.trivial X) ↔
      ∃ α : (Scheme.Modules.pullback i).obj (InvertibleSheaf.trivial X).obj ≅
          (InvertibleSheaf.trivial Z).obj,
        P = Quotient.mk _ (Rigidified.mk (InvertibleSheaf.trivial X) α) := by
  sorry

/-- The supplier identifies D with degree-d effective divisors disjoint from Z. -/
def divisorClassMap (X Z : Scheme.{u}) (i : Z ⟶ X) (D : Type u)
    (lineOfDivisor : D → InvertibleSheaf X)
    (boundarySection : ∀ d, (Scheme.Modules.pullback i).obj (lineOfDivisor d).obj ≅
      (InvertibleSheaf.trivial Z).obj) : D → generalizedPicard X Z i :=
  fun d ↦ Quotient.mk _ ⟨lineOfDivisor d, boundarySection d⟩

/-- Pointwise fibre shape of the affine fibration. Divisor representation, degree components
and the scheme-local triviality assertion are omitted, as stated in the standard note. -/
lemma divisorClassMap_affineFibration (k : Type u) [Field k]
    (X Z : Scheme.{u}) (i : Z ⟶ X) (D : Type u)
    (lineOfDivisor : D → InvertibleSheaf X)
    (boundarySection : ∀ d, (Scheme.Modules.pullback i).obj (lineOfDivisor d).obj ≅
      (InvertibleSheaf.trivial Z).obj)
    (degree g z : ℕ) (hz : 0 < z) (hd : 2 * g + z - 1 ≤ degree)
    (P : generalizedPicard X Z i) :
    Nonempty ({d // divisorClassMap X Z i D lineOfDivisor boundarySection d = P} ≃
      (Fin (degree + 1 - g - z) → k)) := by
  sorry

/-- D is the supplier's etale symmetric power; Omega is the split-divisor locus.
Its actual construction from local points is omitted. -/
lemma omegaDivisors_open (D : Type u) [TopologicalSpace D] (Omega : Set D)
    (degree localDegree : ℕ) (hdiv : localDegree ∣ degree) :
    IsOpen Omega ∧ Omega.Nonempty := by
  sorry

/-- pg_affine_line: monic degree-d polynomials have d free coefficients. -/
example (d : ℕ) : Module.finrank ℚ (Fin d → ℚ) = d ∧ d + 1 - 0 - 1 = d := by
  sorry

/-- pg_multiplicative: the two-boundary-point torus modulo the diagonal is G_m;
together with the affine-fibre dimension this tests the boundary contribution. -/
example (a b : ℂˣ × ℂˣ) (d : ℕ) (hd : 1 ≤ d) :
    (a.1 / a.2 = b.1 / b.2 ↔ ∃ c : ℂˣ, a = (c * b.1, c * b.2)) ∧
      d + 1 - 0 - 2 = d - 1 := by
  sorry

/-- pg_small_degree: the degree-one genus-one case is outside the fibration range. -/
example : ¬ (2 * 1 + 1 - 1 ≤ 1) := by
  sorry

/-- pg_trivial_Z: the rigidified quotient agrees with existing line-bundle classes. -/
example (X Z : Scheme.{u}) [IsEmpty Z] (i : Z ⟶ X) :
    Function.Bijective (generalizedPicard_forget X Z i) := by
  sorry

/-- pg_rigidified_iso: compatible isomorphisms, rather than literal representatives. -/
example (X Z : Scheme.{u}) (i : Z ⟶ X) (A B : Rigidified X Z i)
    (h : (rigidifiedSetoid X Z i).r A B) :
    (Quotient.mk _ A : generalizedPicard X Z i) = Quotient.mk _ B := by
  sorry

/-- pg_boundary_matters: an unrigidified isomorphism alone does not equate the classes. -/
example (X Z : Scheme.{u}) (i : Z ⟶ X) (A B : Rigidified X Z i)
    (h : ∀ e : A.line.obj ≅ B.line.obj,
      (Scheme.Modules.pullback i).map e.hom ≫ B.trivialization.hom ≠ A.trivialization.hom) :
    (Quotient.mk _ A : generalizedPicard X Z i) ≠ Quotient.mk _ B := by
  sorry

/-- pg_forget_representative: use the existing line-bundle class, preserving its universe. -/
example (X Z : Scheme.{u}) (i : Z ⟶ X) (A : Rigidified X Z i) :
    generalizedPicard_forget X Z i (Quotient.mk _ A) = LineBundleClass.mk A.line := by
  sorry

/-! ## R23.2: Taylor's auxiliary data -/

abbrev GL2 (k : Type u) [CommRing k] := Matrix.GeneralLinearGroup (Fin 2) k
/-- The absolute Galois group, Mathlib's `Field.absoluteGaloisGroup`, shared by both parts. -/
abbrev GaloisGroup (F : Type u) [Field F] := Field.absoluteGaloisGroup F

/-- R23.2/taylor-auxiliary-data-p-L-psi-N-M: typed character/field portion.
The relation of H to L, local completions, CM structure, places of N and the automorphic
induction construction are omitted. N and M are coefficient number fields over Q;
they are not intermediate extensions of the totally real base F. Their relation to N_0,
and the maximal-real-subfield assertion for M, remain omitted.
The induced representation is exposed as data. -/
structure TaylorAuxiliaryData (F Ω G D k : Type u)
    [Field F] [Field Ω] [Algebra F Ω] [Group G] [Group D] [Field k]
    (cyclotomic : G →* kˣ) where
  l : ℕ
  residual_prime : l.Prime
  p : ℕ
  prime : p.Prime
  ne_l : p ≠ l
  L : IntermediateField F Ω
  cyclotomicField : IntermediateField F Ω
  notCyclotomic : ¬ L ≤ cyclotomicField
  N : FiniteExtension ℚ
  M : FiniteExtension ℚ
  realCoefficientEmbedding : M.carrier →+* N.carrier
  H : Subgroup G
  index_two : H.index = 2
  psi : H →* kˣ
  psiConjugate : H →* kˣ
  conjugation : H ≃* H
  conjugation_involutive : Function.Involutive conjugation
  conjugate_eq : psiConjugate = psi.comp conjugation.toMonoidHom
  /-- The full selected local decomposition group. Distinction on inertia is stronger
  and is false when the two distinct local characters are both unramified. -/
  decomposition : D →* H
  distinguished : psi.comp decomposition ≠ psiConjugate.comp decomposition
  induced : G →* GL2 k
  determinant : Matrix.GeneralLinearGroup.det.comp induced = cyclotomic

namespace TaylorAuxiliaryData
variable {F Ω G D k : Type u} [Field F] [Field Ω] [Algebra F Ω]
    [Group G] [Group D] [Field k] {cyclotomic : G →* kˣ}
/-- Existence omits Taylor's standing hypotheses and local-character construction. -/
theorem «exists» : Nonempty (TaylorAuxiliaryData F Ω G D k cyclotomic) := by
  sorry
lemma det_ind (A : TaylorAuxiliaryData F Ω G D k cyclotomic) :
    Matrix.GeneralLinearGroup.det.comp A.induced = cyclotomic := by
  sorry
lemma psi_ne_conj (A : TaylorAuxiliaryData F Ω G D k cyclotomic) :
    A.psi.comp A.decomposition ≠ A.psiConjugate.comp A.decomposition := by
  sorry
lemma prime_ne_l (A : TaylorAuxiliaryData F Ω G D k cyclotomic) : A.p ≠ A.l := by
  sorry
lemma conj_conj (A : TaylorAuxiliaryData F Ω G D k cyclotomic) :
    A.psiConjugate.comp A.conjugation.toMonoidHom = A.psi := by
  sorry
lemma det_ind_apply (A : TaylorAuxiliaryData F Ω G D k cyclotomic) (g : G) :
    Matrix.GeneralLinearGroup.det (A.induced g) = cyclotomic g := by
  sorry
/-- Generic algebra form of splitting; completion and CM hypotheses are omitted. -/
lemma split (A : TaylorAuxiliaryData F Ω G D k cyclotomic)
    (Fv : Type u) [Field Fv] [Algebra F Fv] : SplitOver F A.L Fv := by
  sorry
end TaylorAuxiliaryData

/-- taylorAux_N0_l5: discriminant/local unramifiedness arithmetic. -/
example : (1 : ℤ) - 4 * 5 = -19 ∧ ¬ (5 : ℤ) ∣ (1 - 4 * 5) := by
  sorry
/-- taylorAux_det_needed: the auxiliary object cannot have an incompatible determinant. -/
example (F Ω G D k : Type u) [Field F] [Field Ω] [Algebra F Ω]
    [Group G] [Group D] [Field k] (epsilon : G →* kˣ)
    (A : TaylorAuxiliaryData F Ω G D k epsilon)
    (h : Matrix.GeneralLinearGroup.det.comp A.induced ≠ epsilon) : False := by
  sorry
/-- taylorAux_alpha_norm: the algebraic determinant of diag(alpha,alpha^c).
At w|p this is not the p-adic cyclotomic value on a Frobenius lift. -/
example (alpha : ℂ) (p : ℕ) (h : alpha * star alpha = p) :
    Matrix.det !![alpha, 0; 0, star alpha] = p := by
  sorry
/-- taylorAux_not_in_cyclotomic: the auxiliary object excludes cyclotomic containment.
The relation of cyclotomicField to F(zeta_p) remains an omitted arithmetic condition. -/
example (F Ω G D k : Type u) [Field F] [Field Ω] [Algebra F Ω]
    [Group G] [Group D] [Field k] (epsilon : G →* kˣ)
    (A : TaylorAuxiliaryData F Ω G D k epsilon)
    (h : A.L ≤ A.cyclotomicField) : False := by
  sorry

/-- taylorAux_local_decomposition: a distinguishing element of the full local group. -/
example (F Ω G D k : Type u) [Field F] [Field Ω] [Algebra F Ω]
    [Group G] [Group D] [Field k] (epsilon : G →* kˣ)
    (A : TaylorAuxiliaryData F Ω G D k epsilon) :
    ∃ g : D, A.psi (A.decomposition g) ≠ A.psiConjugate (A.decomposition g) := by
  sorry

/-- taylorAux_beta_norm: for l=5, f=1 the norm is 5, not auxiliary p≠5 (E9). -/
example (a : ℂ) (ha : a ^ 2 - a + 5 = 0)
    (hc : star a = 1 - a) (p : ℕ) (hp : p ≠ 5) :
    a * star a = 5 ∧ a * star a ≠ p := by
  sorry

/-! ## R23.1–R23.5: the named field-selection and potential-modularity theorems -/

/-! Reduced signatures for the named R23 theorems. All missing conditions/witnesses are
listed in the standard note and beside each signature. These schemas do not assert automorphy. -/

/-- MB II 1.3; arithmetic/global/geometric hypotheses of the datum are omitted. -/
theorem moretBailly (S : SkolemDatum R K V L) (h : ¬ S.IsComplete) :
    Nonempty S.IntegralPoint := by
  sorry

/-- Taylor Theorem G: this is the point-existence portion; the smooth geometric hypotheses,
local nonemptiness and containment in the maximal S-split field are omitted. -/
theorem taylorTheoremG (X : Scheme.{u}) : ∃ E : FiniteExtension K, Nonempty (Point E.carrier X) := by
  sorry

/-- CHT 4.1.1: continuous finite-order global extension. Here the specified local subgroups
are displayed; global/local reciprocity, continuity and auxiliary ramification are omitted. -/
theorem chtCharacterExtension (G k : Type u) [Group G] [Field k]
    (S : Type u) (H : S → Subgroup G) (chi : ∀ v, H v →* kˣ) :
    ∃ psi : G →* kˣ, ∀ v, psi.comp (H v).subtype = chi v := by
  sorry

/-- CHT 4.1.2: the finite soluble Galois extension and avoidance portion.
The exact isomorphisms of local completions are omitted. -/
theorem chtSolublePrescribedCompletions (Ω : Type u) [Field Ω] [Algebra K Ω]
    (D : IntermediateField K Ω) : ∃ E : IntermediateField K Ω,
    FiniteDimensional K E ∧ IsGalois K E ∧
      Group.IsSolvable (E ≃ₐ[K] E) ∧ E.LinearDisjoint D := by
  sorry

/-- Qian Prop. 4.2: local conditions are split over K_v (S1), unramified (S2),
and Galois-invariant over Kbar_v (S3); these three ambient fields must remain distinct.
Below only avoidance and point existence are expressible without the place supplier. -/
theorem moretBaillyThreeLocalConditions (Ω : Type u) [Field Ω] [Algebra K Ω]
    (D : IntermediateField K Ω) (X : Scheme.{u}) :
    ∃ E : IntermediateField K Ω, FiniteDimensional K E ∧ IsGalois K E ∧
      E.LinearDisjoint D ∧ Nonempty (Point E X) := by
  sorry

/-- BLGHT Prop. 6.2: preliminary-field inclusion and disjointness.
Its three local conditions and restriction-of-scalars identification are omitted. -/
theorem moretBaillyAbovePreliminaryField (Ω : Type u) [Field Ω] [Algebra K Ω]
    (M D : IntermediateField K Ω) (h : M.LinearDisjoint D) (X : Scheme.{u}) :
    ∃ E : IntermediateField K Ω, M ≤ E ∧ FiniteDimensional K E ∧ IsGalois K E ∧
      E.LinearDisjoint D ∧ Nonempty (Point E X) := by
  sorry

/-- Bianchi Prop. 4.5.1: surjectivity of the specialized finite quotient.
The etale fundamental group, point-induced map, CM/Q-Galois field and local data are omitted. -/
theorem surjectiveSpecialisation (A H : Type u) [Group A] [Group H] [Finite H]
    (X : Scheme.{u}) (f : A →* H) (hf : Function.Surjective f)
    (specialise : ∀ E : FiniteExtension K, Point E.carrier X → GaloisGroup E.carrier →* A) :
    ∃ E : FiniteExtension K, ∃ P : Point E.carrier X,
      Function.Surjective (f.comp (specialise E P)) := by
  sorry

/-- BHKT Prop. 9.2: numerical constant-field obstruction.
The chosen point, arithmetic Galois extension and Isom-torsor conclusion are omitted. -/
theorem fixedConstantField (Fq : Type u) [Field Fq] [Finite Fq] [Algebra Fq K]
    (X : Scheme.{u}) : ∃ E : FiniteExtension K, ∃ inst : Algebra Fq E.carrier,
      letI := inst
      Nonempty (Point E.carrier X) ∧
        (∀ e : E.carrier, IsAlgebraic Fq e → ∃ c : Fq, algebraMap Fq E.carrier c = e) := by
  sorry

/-- Two coprime split-place degrees kill the constant-field extension. -/
example (constantDegree m n : ℕ) (hpos : 0 < constantDegree)
    (hm : constantDegree ∣ m) (hn : constantDegree ∣ n) (hcop : m.Coprime n) :
    constantDegree = 1 := by
  sorry

/-- BHKT Thm. 9.3 / Calegari Prop. 3.2: finite-group realization after extension.
Local completions, their embedded decomposition groups and number-field avoidance are omitted. -/
theorem potentialGlobalGaloisLocalData (H : Type u) [Group H] [Finite H] :
    ∃ E : FiniteExtension K, ∃ M : FiniteExtension E.carrier,
      Nonempty ((M.carrier ≃ₐ[E.carrier] M.carrier) ≃* H) := by
  sorry

/-- KW II 6.1: controlled totally real Galois extension preserving residual image.
Both cuspidal witnesses, weights, local types, parity and dyadic hypotheses are omitted. -/
theorem kwPotentialResidual (k : Type u) [Field k] (rho : GaloisGroup ℚ →* GL2 k) :
    ∃ E : FiniteExtension ℚ, NumberField.IsTotallyReal E.carrier ∧
      IsGalois ℚ E.carrier ∧ ∃ restriction : GaloisGroup E.carrier →* GaloisGroup ℚ,
        Set.range (rho.comp restriction) = Set.range rho := by
  sorry

/-- KW Annals 2.1 has extra ordinarity and k≠p; witness/weight conditions are omitted. -/
theorem kwOrdinaryPotentialResidual (k : Type u) [Field k] (rho : GaloisGroup ℚ →* GL2 k) :
    ∃ E : FiniteExtension ℚ, NumberField.IsTotallyReal E.carrier ∧ IsGalois ℚ E.carrier := by
  sorry

/-- Snowden 5.1.1/8.2.1: any continuous odd residual representation over totally real F.
The stable avoidance field, split places, type compatibility and automorphic witnesses are omitted. -/
theorem snowdenPotentialResidual (F k : Type u) [Field F] [NumberField F]
    [NumberField.IsTotallyReal F] [Field k] (rho : GaloisGroup F →* GL2 k) :
    ∃ E : FiniteExtension F, NumberField.IsTotallyReal E.carrier ∧ IsGalois F E.carrier := by
  sorry

/-- BCGP 9.1.11: field part over F with the representation defined over F1.
The q-ordinary weight-zero automorphic witness and split p,q conditions are omitted. -/
theorem bcgpPotentialResidual (F Ω k : Type u) [Field F] [NumberField F]
    [NumberField.IsTotallyReal F] [Field Ω] [Algebra F Ω] [Field k]
    (F1 D : IntermediateField F Ω) (rho : GaloisGroup F1 →* GL2 k) :
    ∃ E : IntermediateField F Ω, FiniteDimensional F E ∧ IsGalois F E ∧
      NumberField.IsTotallyReal E ∧ E.LinearDisjoint (F1 ⊔ D : IntermediateField F Ω) := by
  sorry

/-- Taylor 2002 Theorem 1.6: field portion only; ordinary local shape, soluble-image
branch, determinant convention and cuspidal witness are omitted. -/
theorem taylorOrdinaryPotentialResidual (F k : Type u) [Field F] [NumberField F]
    [NumberField.IsTotallyReal F] [Field k] (rho : GaloisGroup F →* GL2 k) :
    ∃ E : FiniteExtension F, NumberField.IsTotallyReal E.carrier := by
  sorry

/-- Taylor 2006 Prop. 4.1: field portion only. The irreducible niveau-two local shape,
weight two and specified WD inertial characters are omitted. -/
theorem taylorNiveauTwoPotentialResidual (k : Type u) [Field k]
    (rho : GaloisGroup ℚ →* GL2 k) :
    ∃ E : FiniteExtension ℚ, NumberField.IsTotallyReal E.carrier ∧ IsGalois ℚ E.carrier := by
  sorry

/-- Taylor 2006 Theorem 5.7: field portion only; Serre weight, even degree, split l
and the everywhere-unramified cuspidal representation are omitted. -/
theorem taylorSerreWeightPotentialResidual (k : Type u) [Field k]
    (rho : GaloisGroup ℚ →* GL2 k) :
    ∃ E : FiniteExtension ℚ, NumberField.IsTotallyReal E.carrier ∧ IsGalois ℚ E.carrier := by
  sorry

/-- R23.3 auxiliary-prime transfer: extension portion only. The Tate representations,
auxiliary induction, lifting theorem and compatible Hilbert eigenform are omitted.
This signature has no global-lift-existence conclusion or hypothesis. -/
theorem auxiliaryModularityTransfer (F k : Type u) [Field F] [NumberField F]
    [NumberField.IsTotallyReal F] [Field k] (rho : GaloisGroup F →* GL2 k) :
    ∃ E : FiniteExtension F, NumberField.IsTotallyReal E.carrier := by
  sorry

/-- Taylor 2006 Lemma 1.3 Galois realization portion. The Hecke algebra is T,
Frobenius elements are given by frob; quaternionic/automorphic hypotheses omitted. -/
theorem quaternionicHeckeGaloisRealisation (G T W : Type u) [Group G] [CommRing T]
    (frob : W → G) (heckeTrace : W → T) (determinant : G →* Tˣ) :
    ∃ rho : G →* GL2 T,
      (∀ w, Matrix.trace (rho (frob w)).val = heckeTrace w) ∧
      Matrix.GeneralLinearGroup.det.comp rho = determinant := by
  sorry

/-- Taylor 2006 Lemma 1.4/Cor. 1.5: residual inertial character portion only;
Fontaine–Laffaille objects, exact exponents and local hypotheses omitted. -/
theorem localResidualInertialShape (I k : Type u) [Group I] [Field k]
    (rho : I →* GL2 k) : ∃ chi1 chi2 : I →* kˣ,
      ∀ i, (Matrix.GeneralLinearGroup.det (rho i)) = chi1 i * chi2 i := by
  sorry

/-- Taylor 2006 Lemma 5.1/Cor. 5.2: quotient Hecke-algebra map; the spaces,
localization, U/V operators and level/weight hypotheses omitted. -/
theorem weightReductionHeckeSurjection (Tsource Ttarget : Type u)
    [CommRing Tsource] [CommRing Ttarget] :
    ∃ f : Tsource →+* Ttarget, Function.Surjective f := by
  sorry

/-- Taylor 2006 Lemmas 5.4–5.6: field portion only; the conductor and weight changes,
level-one condition and the l>3/niveau-two hypotheses omitted. -/
theorem weightAndLevelPotentialResidual (k : Type u) [Field k]
    (rho : GaloisGroup ℚ →* GL2 k) :
    ∃ E : FiniteExtension ℚ, NumberField.IsTotallyReal E.carrier ∧ IsGalois ℚ E.carrier := by
  sorry

/-- R23.4: a lift is an input; the characteristic-zero automorphic witness and all lifting
hypotheses are omitted. It is not used to produce a lift in R24.2. -/
theorem potentialModularityGivenLift (k O : Type u) [Field k] [CommRing O]
    (red : O →+* k) (rho : GaloisGroup ℚ →* GL2 O) (rbar : GaloisGroup ℚ →* GL2 k)
    (hred : (Matrix.GeneralLinearGroup.map red).comp rho = rbar) :
    ∃ E : FiniteExtension ℚ, NumberField.IsTotallyReal E.carrier ∧ IsGalois ℚ E.carrier := by
  sorry

/-- R23.5: the field-control portion; local conditions and soluble-descent hypotheses omitted. -/
theorem controlledExtension (Ω : Type u) [Field Ω] [Algebra ℚ Ω]
    (D : IntermediateField ℚ Ω) : ∃ E : IntermediateField ℚ Ω,
    FiniteDimensional ℚ E ∧ IsGalois ℚ E ∧ NumberField.IsTotallyReal E ∧ E.LinearDisjoint D := by
  sorry

/-- Corrected BCGP 9.1.12: L' is over K'=KE', with no L/K descent conclusion.
Local completions and real conjugation classes are omitted. -/
theorem bcgpLocalData (F Ω H : Type u) [Field F] [Field Ω] [Algebra F Ω]
    [Group H] [Finite H] (E' D : IntermediateField F Ω) (h : E'.LinearDisjoint D) :
    ∃ E : IntermediateField F Ω, FiniteDimensional F E ∧ IsGalois F E ∧
      E.LinearDisjoint (E' ⊔ D : IntermediateField F Ω) ∧ ∃ M : FiniteExtension (E ⊔ E' : IntermediateField F Ω),
        Nonempty ((M.carrier ≃ₐ[(E ⊔ E' : IntermediateField F Ω)] M.carrier) ≃* H) := by
  sorry

end TauCeti.PotentialModularity

noncomputable section
open scoped NumberField Polynomial
open IsDedekindDomain
namespace TauCeti.CompatibleSystems
open TauCeti.PotentialModularity (GaloisGroup GL2 FiniteExtension)

abbrev PrimeIndex (F : Type) [Field F] [NumberField F] := HeightOneSpectrum (𝓞 F)

/-! ## R24.1–R24.2: finiteness of global deformation rings and characteristic-zero points -/

/-- R24.1 auxiliary field. The missing automorphic witnesses are omitted; piA and piBC
expose only their Galois realizations, not automorphic representations. Local conditions,
residual-image preservation and the relation of the absolute restriction map to F are omitted. -/
structure AuxiliaryField (k O : Type u) [Field k] [CommRing O] (p weight : ℕ) where
  F : FiniteExtension ℚ
  totallyReal : NumberField.IsTotallyReal F.carrier
  characteristicA : (p ≠ 2 ∨ weight = 2) → GaloisGroup F.carrier →* GL2 O
  characteristicBC : GaloisGroup F.carrier →* GL2 O
  tau : GaloisGroup F.carrier →* GL2 k
  unramifiedGroups : Type u
  [groups : Group unramifiedGroups]
  inertia : unramifiedGroups →* GaloisGroup F.carrier
  killed : tau.comp inertia = 1

attribute [instance] AuxiliaryField.groups

namespace AuxiliaryField
variable {k O : Type u} [Field k] [CommRing O] {p weight : ℕ}

/-- Arithmetic guard for the type-(A) accessor; automorphic/local-type data are omitted. -/
def HasTypeA (_A : AuxiliaryField k O p weight) : Prop := p ≠ 2 ∨ weight = 2

def piA (A : AuxiliaryField k O p weight) (h : A.HasTypeA) :
    GaloisGroup A.F.carrier →* GL2 O := A.characteristicA h
def piBC (A : AuxiliaryField k O p weight) : GaloisGroup A.F.carrier →* GL2 O :=
  A.characteristicBC
lemma piA_iff (A : AuxiliaryField k O p weight) : A.HasTypeA ↔ p ≠ 2 ∨ weight = 2 := by
  sorry
lemma piBC_eq (A : AuxiliaryField k O p weight) : A.piBC = A.characteristicBC := by
  sorry
lemma tau_unramified (A : AuxiliaryField k O p weight) : A.tau.comp A.inertia = 1 := by
  sorry
/-- KW hypotheses and construction of the automorphic witnesses are omitted. -/
theorem «exists» : Nonempty (AuxiliaryField k O p weight) := by
  sorry
end AuxiliaryField

/-- aux_dyadic_weight_four: the k=4 dyadic case uses beta/type C, not alpha. -/
example (k O : Type u) [Field k] [CommRing O] (A : AuxiliaryField k O 2 4) :
    ¬ A.HasTypeA ∧ A.piBC = A.characteristicBC := by
  sorry
/-- aux_unramified_at_p: over an unramified extension of degree divisible by the finite
Frobenius order the unramified residual representation becomes trivial. -/
example (k O : Type u) [Field k] [CommRing O] (p weight : ℕ)
    (A : AuxiliaryField k O p weight) (frob : GaloisGroup A.F.carrier)
    (n : ℕ) (h : orderOf (A.tau frob) ∣ n) : A.tau (frob ^ n) = 1 := by
  sorry
/-- aux_not_cm: Q(i) cannot be totally real. -/
example (k O : Type u) [Field k] [CommRing O] (p weight : ℕ)
    (A : AuxiliaryField k O p weight) (i : A.F.carrier) (h : i * i = -1) : False := by
  sorry
/-- aux_tame_killing: the local cubic tame extension at 7 has roots of unity in Q_7. -/
example (k O : Type u) [Field k] [CommRing O] (p weight : ℕ)
    (A : AuxiliaryField k O p weight) (z : A.unramifiedGroups) :
    A.tau (A.inertia z) = 1 ∧ (3 : ℕ) ∣ 7 - 1 := by
  sorry

/-- KW II 10.1: R must be the unframed fixed-determinant ring with the exact KW local
conditions and residual hypotheses. Its construction and these hypotheses are omitted. -/
theorem kwGlobalFiniteness (O R : Type u) [CommRing O] [CommRing R] [Algebra O R] :
    Module.Finite O R := by
  sorry

/-- Thorne 10.2 GL2 totally-real specialization: polarized CM adapter, ordinary lift,
adequacy, fixed Hodge type and ordinary local-ring hypotheses are omitted. -/
theorem ordinaryGlobalFiniteness (O R : Type u) [CommRing O] [CommRing R] [Algebra O R] :
    Module.Finite O R := by
  sorry

/-- CG 4.8's R_phi (including the modified Frobenius eigenvalue problem).
Its modular/ordinary deformation hypotheses and comparison are omitted. -/
theorem cgRingFiniteness (O Rphi : Type u) [CommRing O] [CommRing Rphi] [Algebra O Rphi] :
    Module.Finite O Rphi := by
  sorry

/-- R24.2 algebraic extraction, using an actual integral closure as target.
O must be a complete DVR of mixed characteristic with finite residue field; R must be a
complete local O-algebra, and the map must be local/continuous. Those conditions and the
identification with a finite p-adic field's integers are omitted. Dimension is retained. -/
theorem characteristicZeroPoint (O K R : Type u) [CommRing O] [Field K] [Algebra O K]
    [CommRing R] [Algebra O R] (hfin : Module.Finite O R) (hdim : 1 ≤ ringKrullDim R) :
    ∃ E : FiniteExtension K, ∃ inst : Algebra O E.carrier,
      letI := inst
      Nonempty (R →ₐ[O] integralClosure O E.carrier) := by
  sorry

/-- NT §3: same extraction on the ring cut out by the chosen local components.
BG19's dimension bound and the deformation/component hypotheses are omitted. -/
theorem newtonThornePoint (O K R : Type u) [CommRing O] [Field K] [Algebra O K]
    [CommRing R] [Algebra O R] (hfin : Module.Finite O R) (hdim : 1 ≤ ringKrullDim R) :
    ∃ E : FiniteExtension K, ∃ inst : Algebra O E.carrier,
      letI := inst
      Nonempty (R →ₐ[O] integralClosure O E.carrier) := by
  sorry

/-- R24.2 non-example: a finite nonzero ring can have no characteristic-zero point. -/
example : ¬ Nonempty (ZMod 5 →+* ℚ) := by
  sorry

/-! ## R24.3–R24.6: prescribed lifts, the KW interface and compatible systems -/

/-- Imported Böckle algebra interface: the complete-intersection predicate and characteristic-zero
point conclusion are omitted, while actual flatness and regular sequences are expressible.
The owner is DeformationAndDerivedPatchingAlgebra R03.3; this signature does not re-plan its proof. -/
theorem finite_presentation_complete_intersection
    {O R : Type} [CommRing O] [IsDomain O] [IsDiscreteValuationRing O]
    [IsAdicComplete (IsLocalRing.maximalIdeal O) O]
    [CommRing R] [Nontrivial R] [Algebra O R] [Module.Finite O R]
    {n m : ℕ} (hmn : m ≤ n) (π : O)
    (hπ : Ideal.span ({π} : Set O) = IsLocalRing.maximalIdeal O)
    (f : Fin m → MvPowerSeries (Fin n) O)
    (hf : ∀ i, f i ∈ IsLocalRing.maximalIdeal (MvPowerSeries (Fin n) O))
    (e : R ≃ₐ[O] (MvPowerSeries (Fin n) O ⧸ Ideal.span (Set.range f))) :
    m = n ∧ Module.Flat O R ∧ RingTheory.Sequence.IsRegular (MvPowerSeries (Fin n) O)
      (algebraMap O (MvPowerSeries (Fin n) O) π :: List.ofFn f) := by
  sorry

/-- Only the numerical auxiliary data; residual representations, characters, local conditions,
and deformation points of the full `RequiredLiftType` are omitted. -/
inductive RequiredLiftType (p k : ℕ) where
  | minimalCrystalline (dyadic : p = 2 → k = 2)
  | weightTwo
  | levelOne (q i : ℕ) (prime : q.Prime) (odd : q ≠ 2) (divides : p ∣ q - 1)
      (range : 0 < i ∧ i ≤ q - 2) (dyadic : p = 2 → Even i)
  | levelTwo (q i j : ℕ) (prime : q.Prime) (ne : q ≠ p) (divides : p ∣ q + 1)
      (range : j < i ∧ i ≤ q - 1)
      (order : ∃ r : ℕ, (q ^ 2 - 1) / Nat.gcd (q ^ 2 - 1) (i + q * j) = p ^ r)
      (dyadic : p = 2 → Even (i + j))

/-- Actual representations, polynomials and Hodge metadata. The arithmetic comparison conditions
of a weak system are omitted, as listed above. In particular `H` is metadata here, not a proof of
any Hodge–Tate comparison. -/
structure WeaklyCompatibleSystem (F M : Type) [Field F] [NumberField F] [Field M] [NumberField M]
    (K : PrimeIndex M → Type) [∀ lam, Field (K lam)] [∀ lam, TopologicalSpace (K lam)] (n : ℕ) where
  coefficientEmbedding : ∀ lam, M →+* K lam
  S : Finset (PrimeIndex F)
  Q : PrimeIndex F → M[X]
  monic : ∀ v, v ∉ S → (Q v).Monic
  degree : ∀ v, v ∉ S → (Q v).natDegree = n
  member : ∀ lam, Representation (K lam) (GaloisGroup F) (Fin n → K lam)
  semisimple : ∀ lam, (member lam).IsSemisimpleRepresentation
  continuousAction : ∀ lam, Continuous (fun gv : GaloisGroup F × (Fin n → K lam) =>
    member lam gv.1 gv.2)
  H : (F →+* AlgebraicClosure M) → Multiset ℤ
  hodgeCard : ∀ τ, (H τ).card = n

section Families
variable {F M : Type} [Field F] [NumberField F] [Field M] [NumberField M]
variable {K : PrimeIndex M → Type} [∀ lam, Field (K lam)] [∀ lam, TopologicalSpace (K lam)]
variable {n : ℕ}

def WeaklyCompatibleSystem.rank (_ : WeaklyCompatibleSystem F M K n) : ℕ := n

def WeaklyCompatibleSystem.enlargeRamificationSet (R : WeaklyCompatibleSystem F M K n)
    (S' : Finset (PrimeIndex F)) (h : R.S ⊆ S') : WeaklyCompatibleSystem F M K n := by
  sorry

def WeaklyCompatibleSystem.IsRegular (R : WeaklyCompatibleSystem F M K n) : Prop :=
  ∀ τ, (R.H τ).Nodup

def WeaklyCompatibleSystem.IsExtremelyRegular (R : WeaklyCompatibleSystem F M K n) : Prop :=
  R.IsRegular ∧ ∃ τ, ∀ A B : Multiset ℤ, A ≤ R.H τ → B ≤ R.H τ →
    A.card = B.card → A.sum = B.sum → A = B

/-- The actual polynomial-root and conjugate-multiset conditions. The input `q` is to be identified
with residue cardinality by the arithmetic supplier. -/
def WeaklyCompatibleSystem.IsPure (R : WeaklyCompatibleSystem F M K n)
    (q : PrimeIndex F → ℕ) (w : ℤ) : Prop :=
  (∀ v, v ∉ R.S → ∀ α : AlgebraicClosure M,
    ((R.Q v).map (algebraMap M (AlgebraicClosure M))).IsRoot α →
    ∀ σ : AlgebraicClosure M →+* ℂ, ‖σ α‖ ^ 2 = (q v : ℝ) ^ w) ∧
  (∀ (σ : AlgebraicClosure M →+* ℂ) (c : AlgebraicClosure M ≃+* AlgebraicClosure M),
    (∀ x, σ (c x) = star (σ x)) → ∀ τ : F →+* AlgebraicClosure M,
    R.H (c.toRingHom.comp τ) = (R.H τ).map (fun h => w - h))

/-- KW carrier fragment: full local WD data and comparison predicates are omitted. -/
structure CompatibleSystem (F M : Type) [Field F] [NumberField F] [Field M] [NumberField M]
    (K : PrimeIndex M → Type) [∀ lam, Field (K lam)] [∀ lam, TopologicalSpace (K lam)]
    extends WeaklyCompatibleSystem F M K 2 where
  upperWeight : ℤ
  lowerWeight : ℤ
  orderedWeights : lowerWeight ≤ upperWeight
  constantH : ∀ τ, H τ = {lowerWeight, upperWeight}

def CompatibleSystem.IsRegular (R : CompatibleSystem F M K) : Prop :=
  R.upperWeight ≠ R.lowerWeight

/-- The projection is only between carrier fragments. The full API additionally requires every
member to be de Rham with these Hodge numbers and crystalline outside a common finite set. -/
def WeaklyCompatibleSystem.ofCompatibleSystem (R : CompatibleSystem F M K) :
    WeaklyCompatibleSystem F M K 2 := R.toWeaklyCompatibleSystem

/-- The two weakenings have the same carrier fragment. The determinant Hodge condition and,
for the very weak variant, the density-one full Hodge/crystalline condition are omitted. -/
abbrev ExtremelyWeaklyCompatibleSystem := WeaklyCompatibleSystem F M K n
abbrev VeryWeaklyCompatibleSystem := WeaklyCompatibleSystem F M K n

def WeaklyCompatibleSystem.toVeryWeak (R : WeaklyCompatibleSystem F M K n) :
    VeryWeaklyCompatibleSystem (F := F) (M := M) (K := K) (n := n) := R

def VeryWeaklyCompatibleSystem.toExtremelyWeak
    (R : VeryWeaklyCompatibleSystem (F := F) (M := M) (K := K) (n := n)) :
    ExtremelyWeaklyCompatibleSystem (F := F) (M := M) (K := K) (n := n) := R

/-- Metadata sum; the equality to the determinant's labeled Hodge number is omitted. -/
def ExtremelyWeaklyCompatibleSystem.hodgeSum
    (R : ExtremelyWeaklyCompatibleSystem (F := F) (M := M) (K := K) (n := n))
    (τ : F →+* AlgebraicClosure M) : ℤ := (R.H τ).sum

/-- Linear algebra signatures on carrier fragments. Full compatibility and semisimplification
are the missing arithmetic supplier obligations described in the packet. -/
def directSum (R : WeaklyCompatibleSystem F M K n)
    {m : ℕ} (T : WeaklyCompatibleSystem F M K m) : WeaklyCompatibleSystem F M K (n + m) := by
  sorry

def tensor (R : WeaklyCompatibleSystem F M K n)
    {m : ℕ} (T : WeaklyCompatibleSystem F M K m) : WeaklyCompatibleSystem F M K (n * m) := by
  sorry

def dual (R : WeaklyCompatibleSystem F M K n) : WeaklyCompatibleSystem F M K n := by
  sorry

def symmetricPower (k : ℕ) (R : WeaklyCompatibleSystem F M K n) :
    WeaklyCompatibleSystem F M K (Nat.choose (n + k - 1) k) := by
  sorry

def exteriorPower (k : ℕ) (R : WeaklyCompatibleSystem F M K n) :
    WeaklyCompatibleSystem F M K (Nat.choose n k) := by
  sorry

/-- Twisting is rank-preserving tensor with a character; WD and Hodge comparisons are omitted. -/
def twist (R : WeaklyCompatibleSystem F M K n)
    (χ : WeaklyCompatibleSystem F M K 1) : WeaklyCompatibleSystem F M K n := by
  sorry

theorem directSum_pure [DecidableEq (PrimeIndex F)] (R : WeaklyCompatibleSystem F M K n)
    {m : ℕ} (T : WeaklyCompatibleSystem F M K m) (q : PrimeIndex F → ℕ) (w : ℤ)
    (hR : R.IsPure q w) (hT : T.IsPure q w)
    (hQ : ∀ v, (directSum R T).Q v = R.Q v * T.Q v)
    (hS : (directSum R T).S = R.S ∪ T.S)
    (hH : ∀ τ, (directSum R T).H τ = R.H τ + T.H τ) :
    (directSum R T).IsPure q w := by
  sorry

/-- Definitional memberwise algebraic representations already use Mathlib's induction;
continuity and finite-index arithmetic induction are separate supplier assertions. -/
example {G H V : Type} [Group G] [Group H] [AddCommGroup V] [Module M V]
    (j : G →* H) (ρ : Representation M G V) :
    Representation M H (Representation.IndV j ρ) := by
  sorry

end Families

/-- A coefficient-level perfect-pairing fragment of the imported G7 polarization witness.
The omitted CM arithmetic identification is not replaced by a sign token. -/
structure PolarizedSystem (F Fplus M : Type) [Field F] [NumberField F]
    [Field Fplus] [NumberField Fplus] [Field M] [NumberField M]
    (K : PrimeIndex M → Type) [∀ lam, Field (K lam)] [∀ lam, TopologicalSpace (K lam)] (n : ℕ)
    (j : GaloisGroup F →* GaloisGroup Fplus)
    (c : (Fplus →+* ℝ) → GaloisGroup Fplus)
    (conjAction : (Fplus →+* ℝ) → MulAut (GaloisGroup F)) where
  system : WeaklyCompatibleSystem F M K n
  multiplier : WeaklyCompatibleSystem Fplus M K 1
  multiplierCharacter : ∀ lam, GaloisGroup Fplus →* (K lam)ˣ
  pairing : ∀ lam, (Fplus →+* ℝ) →
    (Fin n → K lam) ≃ₗ[K lam] Module.Dual (K lam) (Fin n → K lam)
  sign : ∀ lam, (Fplus →+* ℝ) → K lam
  signUnit : ∀ lam v, sign lam v = 1 ∨ sign lam v = -1
  symmetry : ∀ lam v x y, pairing lam v x y = sign lam v * pairing lam v y x
  covariance : ∀ lam v g x y,
    pairing lam v (system.member lam g x) (system.member lam (conjAction v g) y) =
      (multiplierCharacter lam (j g) : K lam) * pairing lam v x y
  cmSign : ∀ lam v, sign lam v = -(multiplierCharacter lam (c v) : K lam)

namespace PolarizedSystem
variable {F Fplus M : Type} [Field F] [NumberField F] [Field Fplus] [NumberField Fplus]
variable [Field M] [NumberField M] {K : PrimeIndex M → Type}
variable [∀ lam, Field (K lam)] [∀ lam, TopologicalSpace (K lam)] {n : ℕ}
variable {j : GaloisGroup F →* GaloisGroup Fplus}
variable {c : (Fplus →+* ℝ) → GaloisGroup Fplus}
variable {a : (Fplus →+* ℝ) → MulAut (GaloisGroup F)}

def IsTotallyOdd (P : PolarizedSystem F Fplus M K n j c a) : Prop :=
  ∀ lam v, P.sign lam v = 1

/-- The equivariant perfect-duality equation; construction of the categorical representation
isomorphism uses the supplier G7 API. -/
theorem conjugateDual (P : PolarizedSystem F Fplus M K n j c a) (lam) (v) (g) (x y) :
    P.pairing lam v (P.system.member lam g x) (P.system.member lam (a v g) y) =
      (P.multiplierCharacter lam (j g) : K lam) * P.pairing lam v x y := by
  sorry
/-- Pairing-level tensor signature: δ is the supplied CM quadratic character. Its arithmetic
realization and link to a rank-one family are omitted; both required group identities are stated. -/
def tensor (P : PolarizedSystem F Fplus M K n j c a)
    {m : ℕ} (Q : PolarizedSystem F Fplus M K m j c a)
    (δ : ∀ lam, GaloisGroup Fplus →* (K lam)ˣ)
    (hδc : ∀ lam v, δ lam (c v) = -1)
    (hδj : ∀ lam g, δ lam (j g) = 1) : PolarizedSystem F Fplus M K (n * m) j c a := by
  sorry

def dual (P : PolarizedSystem F Fplus M K n j c a) :
    PolarizedSystem F Fplus M K n j c a := by
  sorry

/-- χ and its extension of the norm character are actual unit-valued homomorphisms. The omitted
arithmetic conditions identify χ with a character system and the norm with its common coefficients. -/
def twist (P : PolarizedSystem F Fplus M K n j c a)
    (χ : ∀ lam, GaloisGroup F →* (K lam)ˣ)
    (norm : ∀ lam, GaloisGroup Fplus →* (K lam)ˣ)
    (hnorm : ∀ lam v g, norm lam (j g) = χ lam g * χ lam (a v g))
    (hreal : ∀ lam v, norm lam (c v) = 1) : PolarizedSystem F Fplus M K n j c a := by
  sorry

/-- Positive-degree signature. At degree zero use the CM polarized unit with multiplier δ.
The symmetric/exterior power pairings and Hodge comparisons are supplied by their owners. -/
def power (exterior : Bool) (k : ℕ) (hk : 0 < k)
    (P : PolarizedSystem F Fplus M K n j c a)
    (δ : ∀ lam, GaloisGroup Fplus →* (K lam)ˣ)
    (hδc : ∀ lam v, δ lam (c v) = -1)
    (hδj : ∀ lam g, δ lam (j g) = 1) :
    PolarizedSystem F Fplus M K
      (if exterior then Nat.choose n k else Nat.choose (n + k - 1) k) j c a := by
  sorry

theorem tensor_isTotallyOdd (P : PolarizedSystem F Fplus M K n j c a)
    {m : ℕ} (Q : PolarizedSystem F Fplus M K m j c a)
    (δ : ∀ lam, GaloisGroup Fplus →* (K lam)ˣ)
    (hδc : ∀ lam v, δ lam (c v) = -1)
    (hδj : ∀ lam g, δ lam (j g) = 1)
    (hP : P.IsTotallyOdd) (hQ : Q.IsTotallyOdd) :
    (P.tensor Q δ hδc hδj).IsTotallyOdd := by
  sorry

end PolarizedSystem

/-- The free additive lattice after the supplier identifies irreducible isomorphism classes `ι`.
Tensor multiplication, the arithmetic category and its identification with this lattice are omitted.
This fragment does not assert a representation-ring structure on arbitrary `ι`. -/
structure RepRing (ι : Type) where
  multiplicity : ι →₀ ℤ

namespace RepRing
variable {ι : Type}
def pairing (A B : RepRing ι) : ℤ := A.multiplicity.sum (fun i a => a * B.multiplicity i)

def trace {k : Type} [Field k] (character : ι → k) (A : RepRing ι) : k :=
  A.multiplicity.sum (fun i a => (a : k) * character i)

/-- Positive irreducible dimensions rule out the negative basis class. -/
theorem eq_irreducible_of_pairing_eq_one (d : ι → ℕ) (hd : ∀ i, 0 < d i)
    (A : RepRing ι) (hpos : 0 < A.multiplicity.sum (fun i a => a * (d i : ℤ)))
    (hnorm : pairing A A = 1) : ∃ i, A = ⟨Finsupp.single i 1⟩ := by
  sorry
/-- Euler-product value after a supplied irreducible-factor identification; analytic and
arithmetic induction assertions are omitted. -/
def partialLFunction (A : RepRing ι) (L : ι → ℂ) : ℂ :=
  A.multiplicity.prod (fun i a => L i ^ a)
end RepRing

/-- Euler product of the good-polynomial fragment. The arithmetic meaning of `q` and the
Frobenius comparison are supplier obligations, not assumptions hidden in this definition. -/
def partialLFunction {F M : Type} [Field F] [NumberField F] [Field M] [NumberField M]
    {K : PrimeIndex M → Type} [∀ lam, Field (K lam)] [∀ lam, TopologicalSpace (K lam)]
    {n : ℕ} (R : WeaklyCompatibleSystem F M K n) (σ : M →+* ℂ)
    (q : PrimeIndex F → ℕ) (s : ℂ) : ℂ := by
  classical
  exact ∏' v, if v ∈ R.S then 1 else
    (q v : ℂ) ^ ((n : ℂ) * s) / ((R.Q v).map σ).eval ((q v : ℂ) ^ s)

/-- Integer real-place multiplicities; arithmetic purity supplies the parity conditions. -/
def archimedeanD (n : ℕ) (w detc : ℤ) : ℤ × ℤ :=
  if Even n then ((n : ℤ) / 2, (n : ℤ) / 2)
  else (((n : ℤ) + (if Even (w / 2) then (1 : ℤ) else -1) * detc) / 2,
    ((n : ℤ) - (if Even (w / 2) then (1 : ℤ) else -1) * detc) / 2)

/-- Real/complex Γ formulas for the supplied Hodge multisets and real multiplicities.
The identification with the chosen infinite place and its sign is omitted. -/
def archimedeanGammaFactor (realPlace : Bool) (H Hbar : Multiset ℤ) (w : ℤ)
    (dplus dminus : ℕ) (s : ℂ) : ℂ := by
  classical
  let central := Complex.Gammaℂ (s - (w : ℂ) / 2)
  let shifts := fun (A : Multiset ℤ) =>
    ((A.filter (fun h => 2 * h < w)).map
      (fun (h : ℤ) => Complex.Gammaℂ (s - (h : ℂ)) / central)).prod
  exact if realPlace then
    Complex.Gammaℝ (s - (w : ℂ) / 2) ^ dplus *
      Complex.Gammaℝ (s + 1 - (w : ℂ) / 2) ^ dminus * shifts H
    else central ^ H.card * shifts H * shifts Hbar

/-- BLGGT archimedean root number exponent; the source hypotheses make it an integer. -/
def archimedeanEpsilon (realPlace : Bool) (H Hbar : Multiset ℤ) (w : ℤ)
    (dminus : ℕ) : ℂ := by
  classical
  let magnitude := fun (A : Multiset ℤ) =>
    (A.map (fun (h : ℤ) => |(h : ℝ) - (w : ℝ) / 2|)).sum
  exact Complex.I ^ ((if realPlace then (dminus : ℝ) + magnitude H
    else magnitude H + magnitude Hbar) : ℂ)

section Artin
variable {F M : Type} [Field F] [NumberField F] [Field M] [NumberField M]
variable {K : PrimeIndex M → Type} [∀ lam, Field (K lam)] [∀ lam, TopologicalSpace (K lam)]
variable {n : ℕ} {Γ : Type} [Group Γ] [Finite Γ] [TopologicalSpace Γ] [DiscreteTopology Γ]

/-- Fragment of finite-quotient assembly. `frob` and `S` are supplied prime data: identifying them
with Frobenius classes and a ramification set is explicitly omitted. -/
def artinSystem (quotient : GaloisGroup F →* Γ) (continuousQuotient : Continuous quotient)
    (a : Representation M Γ (Fin n → M)) (embedding : ∀ lam, M →+* K lam)
    (frob : PrimeIndex F → Γ) (S : Finset (PrimeIndex F)) : WeaklyCompatibleSystem F M K n := by
  sorry

theorem artinSystem_hodge (quotient : GaloisGroup F →* Γ) (hq : Continuous quotient)
    (a : Representation M Γ (Fin n → M)) (embedding : ∀ lam, M →+* K lam)
    (frob : PrimeIndex F → Γ) (S : Finset (PrimeIndex F)) (τ) :
    (artinSystem quotient hq a embedding frob S).H τ = Multiset.replicate n 0 := by
  sorry

theorem artinSystem_charpoly (quotient : GaloisGroup F →* Γ) (hq : Continuous quotient)
    (a : Representation M Γ (Fin n → M)) (embedding : ∀ lam, M →+* K lam)
    (frob : PrimeIndex F → Γ) (S : Finset (PrimeIndex F)) (v) :
    (artinSystem quotient hq a embedding frob S).Q v = (a (frob v)).charpoly := by
  sorry

/-- Weight-zero polynomial/metadata purity; local WD purity is omitted. -/
theorem artinSystem_pure (quotient : GaloisGroup F →* Γ) (hq : Continuous quotient)
    (a : Representation M Γ (Fin n → M)) (embedding : ∀ lam, M →+* K lam)
    (frob : PrimeIndex F → Γ) (S : Finset (PrimeIndex F)) (q : PrimeIndex F → ℕ) :
    (artinSystem quotient hq a embedding frob S).IsPure q 0 := by
  sorry
end Artin

/-- Member-level normalized reciprocal formula; system WD/Hodge comparisons are omitted. -/
theorem dual_charpoly {k G V : Type} [Field k] [Group G] [AddCommGroup V] [Module k V]
    [FiniteDimensional k V] (ρ : Representation k G V) (g : G) :
    (ρ.dual g).charpoly = Polynomial.C ((((ρ g).charpoly).coeff 0)⁻¹) *
      (ρ g).charpoly.reverse := by
  sorry

/-- The residue-degree root computation of induced purity; canonical Hodge transport and
arithmetic local induction are omitted. -/
theorem induced_character_purity (α β : ℂ) (q : ℝ) (hq : 0 < q)
    (f : ℕ) (hf : f ≠ 0) (w : ℤ) (hβ : β ^ f = α)
    (hα : ‖α‖ ^ 2 = (q ^ f) ^ w) : ‖β‖ ^ 2 = q ^ w := by
  sorry

/-- Root-of-unity twist computation; the system and Hodge comparisons are omitted. -/
theorem artin_twist_purity (ζ α : ℂ) (q : ℝ) (w : ℤ) (hζ : ‖ζ‖ = 1)
    (hα : ‖α‖ ^ 2 = q ^ w) : ‖ζ * α‖ ^ 2 = q ^ w := by
  sorry

end TauCeti.CompatibleSystems

namespace TauCeti.CompatibleSystems.Tests
open TauCeti.PotentialModularity (GaloisGroup)
/-! Each labeled example is a signature only. A carrier/arithmetic test whose full statement is
unavailable is identified as a fragment; the full intended assertion remains in its comment. -/

/- type3_parity_p2 — p = 2, q = 5: χ′ = ω₅ has i = 1 odd and is excluded; ω₅² (i = 2) is allowed -/
-- Baseline-expressible portion; the arithmetic system identification is omitted where needed.
example : ¬ Even (1 : ℕ) ∧ Even (2 : ℕ) := by
  sorry

/- type4_level_two_exists — p = 2: q = 7 has v₂(8) = 3 ≥ 2, so level-2 characters of 2-power order exist; q = 5 has v₂(6) = 1 and none exist -/
-- Baseline-expressible portion; the arithmetic system identification is omitted where needed.
example : 7 + 1 = 2 ^ 3 ∧ 2 ∣ 5 + 1 ∧ ¬ 4 ∣ 5 + 1 := by
  sorry

/- type2_steinberg — k(ρ̄) = p + 1: the inertial parameter is (id, N ≠ 0), a Steinberg type -/
-- Baseline-expressible portion; the arithmetic system identification is omitted where needed.
example : let N : Matrix (Fin 2) (Fin 2) ℚ := !![0, 1; 0, 0]; N ≠ 0 ∧ N * N = 0 := by
  sorry

/- type3_needs_p_divides — p=3, q=5: 3∤4=q−1, so type (3) is unavailable. For a geometric regular lift with q∥N(ρ̄), the imported R08.6 automatic-minimality criterion applies at q when p∤q−1. -/
-- Baseline-expressible portion; the arithmetic system identification is omitted where needed.
example : ¬ 3 ∣ 5 - 1 := by
  sorry

/- newform_is_strict — Import the Δ eigenform family from R19.3: weights (11,0), regular and strict after the complete coefficient-prime theorem from R19.5. -/
-- OMITTED example: its arithmetic object is not exported at the pinned baseline.
-- See the supplier requests and the final omission catalogue; no surrogate proposition is introduced.

/- weight_one_irregular — a weight-one newform gives an irregular system, a = b = 0 -/
-- Baseline-expressible portion; the arithmetic system identification is omitted where needed.
example : ¬ ({0, 0} : Multiset ℤ).Nodup := by
  sorry

/- almost_strict_not_strict — The almost-strict contract permits no WD conclusion at q=ℓ with reducible residual member and ramified r_q. This is a logical nonimplication of the contract, not a claim that the particular geometrically constructed systems fail strictness. -/
-- Baseline-expressible portion; the arithmetic system identification is omitted where needed.
example : ∃ comparison : Fin 2 → Bool, comparison 0 = true ∧ comparison 1 = false := by
  sorry

/- hodge_tate_weights_convention — weight a + 1 when b = 0: a newform of weight k gives (a, b) = (k − 1, 0) -/
-- Baseline-expressible portion; the arithmetic system identification is omitted where needed.
example (k : ℤ) : (k - 1) + 1 = k := by
  sorry

/- twist_cyclotomic — Twisting by ε shifts each BLGGT Hodge number by −1 and pure weight by −2. -/
-- Baseline-expressible portion; the arithmetic system identification is omitted where needed.
example : ({0, 11} : Multiset ℤ).map (fun h => h - 1) = {-1, 10} ∧ (11 : ℤ) - 2 = 9 := by
  sorry

/- restrict_trivial_extension — For F′=F restriction returns the same members, Q and H. -/
-- Baseline-expressible portion; the arithmetic system identification is omitted where needed.
example {G V k : Type} [Group G] [CommRing k] [AddCommGroup V] [Module k V]
    (ρ : Representation k G V) : ρ.comp (MonoidHom.id G) = ρ := by
  sorry

/- induce_quadratic_trivial — Induce the trivial character across a quadratic extension: rank 2, H={0,0}, polynomial (X−1)² at split good primes and X²−1 at inert good primes. -/
-- Baseline-expressible portion; the arithmetic system identification is omitted where needed.
example : (Polynomial.X - 1 : ℚ[X]) ^ 2 = Polynomial.X ^ 2 - 2 * Polynomial.X + 1 ∧
    (Polynomial.X - 1 : ℚ[X]) * (Polynomial.X + 1) = Polynomial.X ^ 2 - 1 := by
  sorry

/- induced_regular_nonexample — The induced quadratic trivial character is a sum of trivial and quadratic characters and is not regular; generic induction is not an irreducibility theorem. -/
-- Baseline-expressible portion; the arithmetic system identification is omitted where needed.
example : ¬ ({0, 0} : Multiset ℤ).Nodup := by
  sorry

/- brauer_trivial_F — F = ℚ: 1_G = Ind 1, and ρ_ι = ρ_{π,ι} is the system of π itself -/
-- Baseline-expressible portion; the arithmetic system identification is omitted where needed.
example {G V k : Type} [Group G] [CommRing k] [AddCommGroup V] [Module k V]
    (ρ : Representation k G V) :
    Nonempty (CategoryTheory.Iso (Rep.ind (MonoidHom.id G) (Rep.of ρ)) (Rep.of ρ)) := by
  sorry

/- brauer_quadratic_coefficients — G = ℤ/2: the regular character (2, 0) minus the sign character (1, −1) is the trivial character (1, 1), i.e. 1_G = Ind_1^G 1 − ε -/
-- Baseline-expressible portion; the arithmetic system identification is omitted where needed.
example : ((2 : ℤ) - 1, (0 : ℤ) - (-1)) = (1, 1) := by
  sorry

/- brauer_virtual_nonexample — the virtual character 3·1 − ε of ℤ/2 has degree 2 but value 4 at the generator, more than its degree, so it is not a character: degree 2 alone does not make a virtual representation true -/
-- Baseline-expressible portion; the arithmetic system identification is omitted where needed.
example : ((3 : ℤ) - 1, (3 : ℤ) - (-1)) = (2, 4) ∧ (2 : ℤ) < 4 := by
  sorry

/- brauer_trace_agreement — For the geometric/dual family of a non-CM elliptic curve E/ℚ with F=ℚ, the construction returns the given automorphic cohomological family (or its KW-normalized dual) memberwise up to isomorphism. -/
-- OMITTED example: its arithmetic object is not exported at the pinned baseline.
-- See the supplier requests and the final omission catalogue; no surrogate proposition is introduced.

/- wcs_cyclotomic — With geometric Frobenius and HT(ε_ℓ)=−1, ε has rank 1, S=∅, Q_p(X)=X−p⁻¹, H={−1} and weight −2. X−p would be the arithmetic-Frobenius polynomial. -/
-- Baseline-expressible portion; the arithmetic system identification is omitted where needed.
example (p : ℚ) (hp : 1 < p) :
    Polynomial.X - Polynomial.C p⁻¹ ≠ (Polynomial.X - Polynomial.C p : ℚ[X]) := by
  sorry

/- wcs_newform_delta — Use the cohomological member of the Δ family in BLGGT convention: rank 2, H={0,11}, Q_p(X)=X²−τ(p)X+p¹¹; Q₂=X²+24X+2048. The KW arithmetic member is its contragredient, with their HT(ε)=+1 convention. -/
-- Baseline-expressible portion; the arithmetic system identification is omitted where needed.
example : let Q : ℚ[X] := Polynomial.X ^ 2 + 24 * Polynomial.X + 2048;
    Q.natDegree = 2 ∧ ({0, 11} : Multiset ℤ).Nodup := by
  sorry

/- wcs_not_just_traces — Two systems with the same Q_v are isomorphic member by member only up to conjugation; the carrier stores the r_λ themselves. -/
-- Baseline-expressible portion; the arithmetic system identification is omitted where needed.
example : let A : Matrix (Fin 2) (Fin 2) ℚ := !![1, 0; 0, 2];
    let B : Matrix (Fin 2) (Fin 2) ℚ := !![2, 0; 0, 1]; A ≠ B ∧ A.charpoly = B.charpoly := by
  sorry

/- wcs_S_enlarge — Enlarging S gives an equivalent system (fewer polynomials, same representations). -/
-- Baseline-expressible portion; the arithmetic system identification is omitted where needed.
example {F M : Type} [Field F] [NumberField F] [Field M] [NumberField M]
    {K : PrimeIndex M → Type} [∀ lam, Field (K lam)] [∀ lam, TopologicalSpace (K lam)]
    {n : ℕ} (R : WeaklyCompatibleSystem F M K n) (S' : Finset (PrimeIndex F)) (h : R.S ⊆ S') :
    (R.enlargeRamificationSet S' h).member = R.member ∧
      (R.enlargeRamificationSet S' h).H = R.H ∧ (R.enlargeRamificationSet S' h).S = S' := by
  sorry

/- pred_newform — A newform of weight k ≥ 2 is regular, strictly pure of weight k − 1, irreducible and automorphic. -/
-- Baseline-expressible portion; the arithmetic system identification is omitted where needed.
example (k : ℤ) (hk : 2 ≤ k) : ({0, k - 1} : Multiset ℤ).Nodup := by
  sorry

/- pred_regular_fails — ε ⊕ ε is not regular (H = {−1, −1}). -/
-- Baseline-expressible portion; the arithmetic system identification is omitted where needed.
example : ¬ ({-1, -1} : Multiset ℤ).Nodup := by
  sorry

/- pred_odd_purity — For n odd and v real, purity forces w even (BLGGT p. 53). -/
-- Baseline-expressible portion; the arithmetic system identification is omitted where needed.
example (w h : ℤ) (hconj : h = w - h) : Even w := by
  sorry

/- pred_strict_vs_almost_strict — BLGGT strict compatibility only compares λ∤v and is implied by KW almost-strictness away from coefficient primes when the family is weakly compatible; it does not assert KW all-place strictness at v|ℓ. An unconstrained exceptional coefficient prime is a counterexample to inference from the contract. -/
-- Baseline-expressible portion; the arithmetic system identification is omitted where needed.
example : ¬ ((∀ slot : Fin 2, slot ≠ 1 → slot = 0) → ∀ slot : Fin 2, slot = 0) := by
  sorry

/- dual_rank_two — X²−aX+b with b≠0 becomes X²−(a/b)X+1/b. -/
-- Baseline-expressible portion; the arithmetic system identification is omitted where needed.
example {K : Type} [Field K] (α β : K) (hα : α ≠ 0) (hβ : β ≠ 0) :
    α⁻¹ + β⁻¹ = (α + β) / (α * β) ∧ α⁻¹ * β⁻¹ = 1 / (α * β) := by
  sorry

/- sym2_distinct — For h₁≠h₂, {2h₁,h₁+h₂,2h₂} is distinct, so Sym² of regular rank two stays regular. -/
-- Baseline-expressible portion; the arithmetic system identification is omitted where needed.
example (h₁ h₂ : ℤ) (h : h₁ ≠ h₂) :
    ({2 * h₁, h₁ + h₂, 2 * h₂} : Multiset ℤ).Nodup := by
  sorry

/- tensor_collision — H={0,1} and H′={0,−1} give tensor H={0,−1,1,0}, which is not regular. -/
-- Baseline-expressible portion; the arithmetic system identification is omitted where needed.
example : ¬ ({0, -1, 1, 0} : Multiset ℤ).Nodup := by
  sorry

/- direct_sum_mixed_weights — 1⊕ε has geometric-Frobenius roots 1,p⁻¹ and weights 0,−2, so is not pure of one weight. -/
-- Baseline-expressible portion; the arithmetic system identification is omitted where needed.
example : ¬ ∃ w : ℤ, (1 : ℝ) ^ 2 = (2 : ℝ) ^ w ∧ (2 : ℝ)⁻¹ ^ 2 = (2 : ℝ) ^ w := by
  sorry

/- exterior_above_rank — ∧³ of a rank-two system is the rank-zero system with Q_v=1 and H empty. -/
-- Baseline-expressible portion; the arithmetic system identification is omitted where needed.
example : Nat.choose 2 3 = 0 ∧ (1 : ℚ[X]).natDegree = 0 ∧ (0 : Multiset ℤ).card = 0 := by
  sorry

/- trivial_character — F = ℚ, n = 1, r_λ trivial: w = 0, d+ = 1, d− = 0, H = {0} has no h < 0, so L_∞ = Γ_ℝ(s) and ε_∞ = 1; Λ(ı1, s) = Γ_ℝ(s)ζ(s) is completedRiemannZeta, and Λ(1 − s) = Λ(s) is the functional equation with ε = 1 (suggested file). -/
-- Baseline-expressible portion; the arithmetic system identification is omitted where needed.
example {s : ℂ} (hs : s ≠ 0) (hΓ : Complex.Gammaℝ s ≠ 0) :
    completedRiemannZeta s = Complex.Gammaℝ s * riemannZeta s ∧
      completedRiemannZeta (1 - s) = completedRiemannZeta s := by
  sorry

/- gamma_duplication — Γ_ℂ(s) = Γ_ℝ(s)Γ_ℝ(s + 1) is Mathlib's Complex.Gammaℝ_mul_Gammaℝ_add_one (suggested file). -/
-- Baseline-expressible portion; the arithmetic system identification is omitted where needed.
example (s : ℂ) : Complex.Gammaℂ s = Complex.Gammaℝ s * Complex.Gammaℝ (s + 1) := by
  sorry

/- cyclotomic_character — F = ℚ, r_λ = ε_l in BLGGT's conventions (Frob_v geometric, HT_τ(ε_l) = {−1}): Q_p(X) = X − p^{−1}, weight −2, L^S(ıε_l, s) = ζ^S(s + 1); d+ = (1 + (−1)(−1))/2 = 1, d− = 0, so L_∞ = Γ_ℝ(s + 1) and ε_∞ = i^{0 + |−1 + 1|} = 1 (suggested file). -/
-- Baseline-expressible portion; the arithmetic system identification is omitted where needed.
example {K : Type} [Field K] (p x : K) (hp : p ≠ 0) (hx : x ≠ 0) (h : x - p⁻¹ ≠ 0) :
    x / (x - p⁻¹) = 1 / (1 - p⁻¹ * x⁻¹) := by
  sorry

/- elliptic_curve_gamma_factor — F = ℚ, ℛ = H¹ of an elliptic curve: n = 2, w = 1, H = {0, 1}, d± = 1, so L_∞ = Γ_ℝ(s − 1/2)Γ_ℝ(s + 1/2)·Γ_ℂ(s)/Γ_ℂ(s − 1/2) = Γ_ℂ(s) and ε_∞ = i^{1 + 1/2 + 1/2} = −1 (suggested file). v1's Hodge factor is undefined here (w odd). -/
-- Baseline-expressible portion; the arithmetic system identification is omitted where needed.
example (s : ℂ) (h : Complex.Gammaℂ (s - 1 / 2) ≠ 0) :
    Complex.Gammaℝ (s - 1 / 2) * Complex.Gammaℝ (s + 1 / 2) *
      (Complex.Gammaℂ s / Complex.Gammaℂ (s - 1 / 2)) = Complex.Gammaℂ s ∧ Complex.I ^ (2 : ℕ) = -1 := by
  sorry

/- pairing_norm — A = 2[V₁] − [V₂] with V₁ ≇ V₂ irreducible: (A, A) = 4 + 1 = 5, and dim A = 2 dim V₁ − dim V₂ may be negative. -/
-- Baseline-expressible portion; the arithmetic system identification is omitted where needed.
example : RepRing.pairing (RepRing.mk (Finsupp.single (0 : Fin 2) 2 - Finsupp.single 1 1))
    (RepRing.mk (Finsupp.single (0 : Fin 2) 2 - Finsupp.single 1 1)) = 5 := by
  sorry

/- trivial_class — [1] is the unit, with (1, 1) = 1 and dim 1 = 1. -/
-- Baseline-expressible portion; the arithmetic system identification is omitted where needed.
example : RepRing.pairing (RepRing.mk (Finsupp.single (0 : Fin 1) 1)) (RepRing.mk (Finsupp.single (0 : Fin 1) 1)) = 1 := by
  sorry

/- induced_dimension — dim ind_{F′/F}[1] = [F′ : F], and (ind[1], [1]) = 1 by Frobenius reciprocity. -/
-- Baseline-expressible portion; the arithmetic system identification is omitted where needed.
example {G H k : Type} [Group G] [Group H] [Finite G] [Finite H] [Field k]
    (j : G →* H) (hj : Function.Injective j) :
    Module.finrank k (Representation.IndV j (Representation.trivial k G k)) = j.range.index := by
  sorry

/- virtual_not_genuine — For the virtual C₂ class A=3·1−ε, dim A=2 but (A,A)=10; rank two alone fails genuineness. Norm-one plus positive dimension is the criterion actually used. -/
-- Baseline-expressible portion; the arithmetic system identification is omitted where needed.
example : RepRing.pairing (RepRing.mk (Finsupp.single (0 : Fin 2) 3 - Finsupp.single 1 1))
    (RepRing.mk (Finsupp.single (0 : Fin 2) 3 - Finsupp.single 1 1)) = 10 := by
  sorry

/- torus_case — CM-type systems: G⁰_l a torus, H_l = Z_l, and Γ^H_l = Γ^Z_l. -/
-- OMITTED example: its arithmetic object is not exported at the pinned baseline.
-- See the supplier requests and the final omission catalogue; no surrogate proposition is introduced.

/- gl2_case — For a non-CM elliptic curve over ℚ: G⁰_ℓ=GL₂, G^sc_ℓ=SL₂, Z_ℓ=𝔾_m, C_ℓ=𝔾_m via det. The kernel of SL₂→PGL₂ has order 2, so 2 divides a uniform A(2); no universal choice A(2)=2 is asserted. -/
-- OMITTED example: its arithmetic object is not exported at the pinned baseline.
-- See the supplier requests and the final omission catalogue; no surrogate proposition is introduced.

/- finite_image — An Artin representation: G⁰_l = 1, so F⁰ is the field cut out by r_l and all other groups are trivial. -/
-- OMITTED example: its arithmetic object is not exported at the pinned baseline.
-- See the supplier requests and the final omission catalogue; no surrogate proposition is introduced.

/- theta_bound_depends_on_system — A(n) and B(n) depend only on n, but C(ℛ) and D(ℛ) of Lemma 5.2.1 cannot be chosen independently of ℛ: for ℛ = ε^k over ℚ (n = 1), θ_l is x ↦ x^{±k}, so its exponent has absolute value |k|. -/
-- OMITTED example: its arithmetic object is not exported at the pinned baseline.
-- See the supplier requests and the final omission catalogue; no surrogate proposition is introduced.

/- polarized_cm_unit — The trivial rank-one system on G_F has a symmetric pairing and CM multiplier δ_F/F⁺, with μ(c_v)=−1; multiplier 1 has the wrong BLGGT sign. -/
-- Baseline-expressible portion; the arithmetic system identification is omitted where needed.
example : (-( -1 : ℚ)) = 1 ∧ (-(1 : ℚ)) ≠ 1 := by
  sorry

/- polarized_rank_two — For the cohomological elliptic family over a CM field, use the rank-two duality pairing with the properly normalized multiplier and its real-place sign; total oddness is tested on the actual conjugate pairing, not only det on G_F. -/
-- Baseline-expressible portion; the arithmetic system identification is omitted where needed.
example : let J : Matrix (Fin 2) (Fin 2) ℚ := !![0, 1; -1, 0];
    let C : Matrix (Fin 2) (Fin 2) ℚ := !![1, 0; 0, -1];
    (J * C).transpose = J * C ∧ Matrix.det (J * C) = -1 ∧ (-(-1 : ℚ)) = 1 := by
  sorry

/- polarized_multiplier_wrong — Changing μ(c_v) while retaining the same pairing reverses the required CM equation ε_v=−μ(c_v). -/
-- Baseline-expressible portion; the arithmetic system identification is omitted where needed.
example : (-(1 : ℚ)) = -1 ∧ (-(-1 : ℚ)) = 1 ∧ (1 : ℚ) ≠ -1 := by
  sorry

/- polarized_forget_pairing — Forget the chosen G7 pairing to obtain r^c≅r∨⊗μ; the converse requires a correctly signed perfect pairing, not a Prop-valued token. -/
-- Baseline-expressible portion; the arithmetic system identification is omitted where needed.
example {F Fplus M : Type} [Field F] [NumberField F] [Field Fplus] [NumberField Fplus]
    [Field M] [NumberField M] {K : PrimeIndex M → Type}
    [∀ lam, Field (K lam)] [∀ lam, TopologicalSpace (K lam)] {n : ℕ}
    {j : GaloisGroup F →* GaloisGroup Fplus} {c : (Fplus →+* ℝ) → GaloisGroup Fplus}
    {a : (Fplus →+* ℝ) → MulAut (GaloisGroup F)}
    (P : PolarizedSystem F Fplus M K n j c a) (lam) (v) :
    Function.Bijective (P.pairing lam v) := by
  sorry

/- polarized_tensor_sign — ε=ε′=+1, μ(c)=μ′(c)=−1: uncorrected product has μμ′(c)=+1; corrected μμ′δ(c)=−1. -/
-- Baseline-expressible portion; the arithmetic system identification is omitted where needed.
example : (-1 : ℚ) * (-1) = 1 ∧ (-1 : ℚ) * (-1) * (-1) = -1 := by
  sorry

/- polarized_dual_sign — Inverse of a −1 multiplier at c is −1, matching the unchanged +1 sign. -/
-- Baseline-expressible portion; the arithmetic system identification is omitted where needed.
example : (-1 : ℚ)⁻¹ = -1 := by
  sorry

/- polarized_unit_tensor — The polarized CM unit has μ=δ; tensoring it with (ℛ,μ) gives μδδ=μ. -/
-- Baseline-expressible portion; the arithmetic system identification is omitted where needed.
example {K : Type} [Field K] (μ δ : K) (hδ : δ * δ = 1) : μ * δ * δ = μ := by
  sorry

/- polarized_sum_mismatch — A block sum of pairings with signs +1 and −1 is neither symmetric nor alternating; there is no common sign without changing the inputs. -/
-- Baseline-expressible portion; the arithmetic system identification is omitted where needed.
example : let B : Matrix (Fin 3) (Fin 3) ℚ := !![1, 0, 0; 0, 0, 1; 0, -1, 0];
    B.transpose ≠ B ∧ B.transpose ≠ -B := by
  sorry

/- character_trivial — χ=1 gives Q_v=X−1, H={0}, weight 0. -/
-- Baseline-expressible portion; the arithmetic system identification is omitted where needed.
example : (Polynomial.X - 1 : ℚ[X]).natDegree = 1 ∧ (1 : ℝ) ^ 2 = (2 : ℝ) ^ (0 : ℤ) := by
  sorry

/- character_cyclotomic — The algebraic idele norm ||·||_F gives the cyclotomic family in the geometric Artin convention: H={−1}, Q_p=X−p⁻¹, pure weight −2. -/
-- Baseline-expressible portion; the arithmetic system identification is omitted where needed.
example (p : ℝ) (hp : 0 < p) : (p⁻¹) ^ 2 = p ^ (-2 : ℤ) := by
  sorry

/- character_finite_order — A finite-order Hecke character has H={0}, all good roots roots of unity, and weight 0. -/
-- Baseline-expressible portion; the arithmetic system identification is omitted where needed.
example (z : ℂ) (n : ℕ) (hn : n ≠ 0) (hz : z ^ n = 1) : ‖z‖ = 1 := by
  sorry

/- character_non_algebraic — An arbitrary continuous character with nonintegral infinity exponent has no type-A₀ algebraic realization theorem and is not accepted by this constructor. -/
-- Baseline-expressible portion; the arithmetic system identification is omitted where needed.
example : ¬ ∃ a : ℤ, (a : ℝ) = 1 / 2 := by
  sorry

/- artin_trivial — The trivial rank-one quotient gives Q_v=X−1 and H={0}. -/
-- Baseline-expressible portion; the arithmetic system identification is omitted where needed.
example : (Polynomial.X - 1 : ℚ[X]).Monic ∧ ({0} : Multiset ℤ).card = 1 := by
  sorry

/- artin_quadratic — For a quadratic character, good Q_v is X−1 at split primes, X+1 at inert primes. -/
-- Baseline-expressible portion; the arithmetic system identification is omitted where needed.
example : (Polynomial.X - 1 : ℚ[X]).eval 1 = 0 ∧ (Polynomial.X + 1 : ℚ[X]).eval (-1) = 0 := by
  sorry

/- artin_rank_two_irregular — Any rank-two Artin family has H={0,0}, so it is not regular, even when its finite-group representation is irreducible. -/
-- Baseline-expressible portion; the arithmetic system identification is omitted where needed.
example : ¬ ({0, 0} : Multiset ℤ).Nodup := by
  sorry

/- artin_roots_unity — Finite-order matrices have eigenvalues roots of unity under every complex embedding; their absolute value is 1. -/
-- Baseline-expressible portion; the arithmetic system identification is omitted where needed.
example (z : ℂ) (n : ℕ) (hn : n ≠ 0) (hz : z ^ n = 1) : ‖z‖ = 1 := by
  sorry

/- weakening_rank_one — A rank-one H_τ={a} is determined by its determinant Hodge sum a. -/
-- Baseline-expressible portion; the arithmetic system identification is omitted where needed.
example (a : ℤ) : ({a} : Multiset ℤ).sum = a := by
  sorry

/- weakening_higher_rank_metadata — Rank-two H={0,2} and H′={1,1} have the same determinant sum 2; the determinant condition distinguishes neither the Hodge multiset itself nor regularity. -/
-- Baseline-expressible portion; the arithmetic system identification is omitted where needed.
example : ({0, 2} : Multiset ℤ).sum = ({1, 1} : Multiset ℤ).sum ∧
    ({0, 2} : Multiset ℤ).Nodup ∧ ¬ ({1, 1} : Multiset ℤ).Nodup := by
  sorry

/- weakening_hodge_purity_not_sum — For a rank-two weight-zero Artin family, H_τ={−1,1}, H_cτ={0,0} have both determinant sums zero, but H_cτ≠−H_τ; arbitrary extremely weak metadata do not imply Hodge purity. -/
-- Baseline-expressible portion; the arithmetic system identification is omitted where needed.
example : ({-1, 1} : Multiset ℤ).sum = ({0, 0} : Multiset ℤ).sum ∧
    ({0, 0} : Multiset ℤ) ≠ ({-1, 1} : Multiset ℤ).map (fun h => -h) := by
  sorry

/- weakening_transitive — The composite weak→very weak→extremely weak map preserves each r_λ, Q_v and H_τ. -/
-- Baseline-expressible portion; the arithmetic system identification is omitted where needed.
example {F M : Type} [Field F] [NumberField F] [Field M] [NumberField M]
    {K : PrimeIndex M → Type} [∀ lam, Field (K lam)] [∀ lam, TopologicalSpace (K lam)]
    {n : ℕ} (R : WeaklyCompatibleSystem F M K n) :
    R.toVeryWeak.toExtremelyWeak.member = R.member ∧ R.toVeryWeak.toExtremelyWeak.H = R.H := by
  sorry

end TauCeti.CompatibleSystems.Tests

/-!
## Planned names and arithmetic omissions

Every name below is the exact packet name. ACTIVE FRAGMENT refers to the declaration above;
it retains only the baseline-expressible conditions. OMITTED FULL SIGNATURE has no surrogate
declaration: the missing arithmetic object or predicate is left out. The full statement in the
reader/packet remains definitive. A name in this catalogue is not a proof or implementation.

### Böckle's presentation of a global deformation ring (Proposition 1 of the appendix)
Packet node: PotentialModularityAndCompatibleSystems:R24.3/bockle-presentation

* TauCeti.CompatibleSystems.bockle_presentation — OMITTED FULL SIGNATURE
  Let ρ̄ : G_ℚ → GL₂(k) be odd and absolutely irreducible, X a set of local deformation conditions, unramified outside a finite set S, and d ∈ {0, 1}, Ad_X = Ad⁰ρ̄ if X fixes the determinant (d = 0) and Ad_X = Adρ̄ otherwise (d = 1). Suppose (a) for ℓ ∈ S ∖ {p, ∞} the local ring R_{X,ℓ} is a complete intersection, flat over ℤ_p, of relative dimension h⁰(G_ℓ, Ad_X) − Δ_ℓ, and (b) R_{X,p} is a complete intersection, flat over ℤ_p, of relative dimension h⁰(G_p, Ad_X) + 1 + d − Δ_p. Then with Δ = ΣΔ_ℓ, R_X ≅ 𝒪⟦x₁, …, x_{n+d}⟧/(f₁, …, f_{n+Δ}) for some n. In particular, when Δ ≤ 0 (for instance minimal conditions, where Δ_ℓ = 0) the ring has at most as many relations as variables (Böckle's Corollary 1; KW Annals Proposition 3.4: W⟦X₁, …, X_r⟧/(f₁, …, f_s) with r ≥ s).

Supplier routes: GlobalGaloisDeformations:R04.3/local-to-global-presentation; GlobalGaloisDeformations:R04.3/relative-tangent-space; LocalGaloisDeformationRings:R08.6/kw-local-conditions

### Finite plus few relations gives a finite flat complete intersection (Böckle's Lemma 2)
Packet node: PotentialModularityAndCompatibleSystems:R24.3/finite-presentation-complete-intersection

* TauCeti.CompatibleSystems.finite_presentation_complete_intersection — ACTIVE FRAGMENT
  Let 𝒪 be a complete DVR, π a uniformizer, A=𝒪[[x₁,…,x_n]], and f₁,…,f_m∈m_A with m≤n. Let R=A/(f₁,…,f_m) be nonzero, complete noetherian local, with its residue field identified with that of 𝒪, and finite as an 𝒪-module. Then m=n, (π,f₁,…,f_n) is A-regular, R is finite flat and a complete intersection over 𝒪, and R[1/π]≠0. A characteristic-zero integral point over a finite coefficient extension is obtained by the R24.2 point interface. This is the imported algebra behind Böckle Lemma 2, not a consequence of merely naming regular sequences and flatness.

Supplier routes: mathlib:RingTheory.Sequence.IsRegular; mathlib:IsLocalRing; mathlib:ringKrullDim; mathlib:Module.Flat; DeformationAndDerivedPatchingAlgebra:R03.3/regular-local-cohen-macaulay; PotentialModularityAndCompatibleSystems:R24.2

### Böckle's Theorem 1: an auxiliary R_Q ≅ T_Q gives the minimal R_∅ ≅ T_∅
Packet node: PotentialModularityAndCompatibleSystems:R24.3/bockle-minimal-r-equals-t

* TauCeti.CompatibleSystems.bockle_minimal_r_equals_t — OMITTED FULL SIGNATURE
  In the setting of Khare's Inventiones 154 (2003) paper, suppose that for some auxiliary set of primes Q the map R_Q → T_Q is an isomorphism of finite flat W(k)-algebras. Then the canonical map R_∅ → T_∅ of minimal rings is an isomorphism. This is NOT an unconditional lift-existence theorem: the presentation comes from GlobalGaloisDeformations R04 and the auxiliary R_Q ≅ T_Q from GL2ModularityLifting R22.

Supplier routes: PotentialModularityAndCompatibleSystems:R24.3/bockle-presentation; PotentialModularityAndCompatibleSystems:R24.3/finite-presentation-complete-intersection; GL2ModularityLifting:R22.3/minimal-ring-finite; AutomorphicGaloisRepresentations:R19.4/hecke-versus-langlands-normalization-and-local-global-compatibility

### Minimally ramified lifts (Khare–Wintenberger, Annals, Theorem 3.3)
Packet node: PotentialModularityAndCompatibleSystems:R24.3/kw-annals-minimal-lifts

* TauCeti.CompatibleSystems.kw_annals_minimal_lifts — OMITTED FULL SIGNATURE
  Let ρ̄ : G_ℚ → GL₂(𝔽) be of S-type with p > 2, ρ̄|_{ℚ(µ_p)} absolutely irreducible, 2 ≤ k(ρ̄) ≤ p + 1 and k(ρ̄) ≠ p. Then ρ̄ has a lift that is minimally ramified at every prime; when k(ρ̄) = p + 1 it may be chosen of crystalline type (Hodge–Tate weights (0, p)) or of semistable type (weight 2). Proof: the minimal deformation ring R^univ has a presentation with r ≥ s (Böckle, Proposition 3.4), is finite over W (Proposition 3.8: Lemma 3.6 reduces finiteness to finiteness of the universal mod-p image, which follows from Taylor's potential modularity and Fujiwara's R = T over a totally real F), hence is finite flat and a complete intersection (Theorem 3.7), so it has a point in characteristic zero. This is the method suggested in the Remark in §5.2 of Khare–Ramakrishna, Finiteness of Selmer groups and deformation rings (Invent. Math. 154 (2003) 179–198, KW Annals' [27]; not Khare's paper with Böckle's appendix, which is [26]), which the subsequent KW II Theorem 5.1 generalises.

Supplier routes: PotentialModularityAndCompatibleSystems:R24.3/bockle-presentation; PotentialModularityAndCompatibleSystems:R24.3/finite-presentation-complete-intersection; LocalGaloisDeformationRings:R08.6/export-endpoint-weight; GL2ModularityLifting:R22.3/minimal-ring-finite; PotentialModularityAndCompatibleSystems:R24.1

### Lifts of required type (KW I Theorem 5.1 (1)–(4))
Packet node: PotentialModularityAndCompatibleSystems:R24.3/required-lift-types

* TauCeti.CompatibleSystems.RequiredLiftType — ACTIVE FRAGMENT
  the case (1)–(4) with its auxiliary data (q, χ′) and the fixed character ψ
* TauCeti.CompatibleSystems.RequiredLiftType.localCondition — OMITTED FULL SIGNATURE
  the local condition X_v of LocalGaloisDeformationRings R08.6 at each v ∈ S
* TauCeti.CompatibleSystems.RequiredLiftType.ring — OMITTED FULL SIGNATURE
  the ring R̄^ψ_S of GlobalGaloisDeformations R04.6 for these conditions
* TauCeti.CompatibleSystems.RequiredLiftType.points_iff — OMITTED FULL SIGNATURE
  𝒪′-points of the ring ↔ lifts of the required type
* TauCeti.CompatibleSystems.RequiredLiftType.det — OMITTED FULL SIGNATURE
  every lift of the type has determinant ψχ_p

Supplier routes: LocalGaloisDeformationRings:R08.6/kw-local-conditions; GlobalGaloisDeformations:R04.6/kw-deformation-data; GlobalGaloisDeformations:R04.6/factorization-through-local-conditions; AlgebraicModularFormsAndSerreWeights:R15.6; ArithmeticGaloisRepresentations:R01.1; ArithmeticGaloisRepresentations:R01.2

* test type3_parity_p2 — EXAMPLE FRAGMENT
* test type4_level_two_exists — EXAMPLE FRAGMENT
* test type2_steinberg — EXAMPLE FRAGMENT
* test type3_needs_p_divides — EXAMPLE FRAGMENT

### KW I Theorem 5.1(1): minimal crystalline lifts
Packet node: PotentialModularityAndCompatibleSystems:R24.3/theorem-5-1-part-1-minimal-crystalline

* TauCeti.CompatibleSystems.theorem_5_1_part_1_minimal_crystalline — OMITTED FULL SIGNATURE
  Under KW I Theorem 5.1's hypotheses on ρ̄, and k(ρ̄) = 2 if p = 2, ρ̄ has a lift of required type (1): minimally ramified at every prime ≠ p and crystalline of weight k(ρ̄) at p.

Supplier routes: PotentialModularityAndCompatibleSystems:R24.3/required-lift-types; LocalGaloisDeformationRings:R08.6/local-nonemptiness; GlobalGaloisDeformations:R04.3/global-dimension-lower-bound; GlobalGaloisDeformations:R04.6/factorization-through-local-conditions; PotentialModularityAndCompatibleSystems:R24.1; PotentialModularityAndCompatibleSystems:R24.2

### KW I Theorem 5.1(2): minimal weight-two lifts
Packet node: PotentialModularityAndCompatibleSystems:R24.3/theorem-5-1-part-2-weight-two

* TauCeti.CompatibleSystems.theorem_5_1_part_2_weight_two — OMITTED FULL SIGNATURE
  Under KW I Theorem 5.1's hypotheses, ρ̄ has a lift of required type (2): weight 2, minimally ramified at ℓ ≠ p, with inertial Weil–Deligne parameter (ω^{k(ρ̄)−2} ⊕ 1, 0) at p, or (id, N ≠ 0) when k(ρ̄) = p + 1 (k(ρ̄) = 4 at p = 2).

Supplier routes: PotentialModularityAndCompatibleSystems:R24.3/required-lift-types; LocalGaloisDeformationRings:R08.6/local-nonemptiness; GlobalGaloisDeformations:R04.3/global-dimension-lower-bound; GlobalGaloisDeformations:R04.6/factorization-through-local-conditions; PotentialModularityAndCompatibleSystems:R24.1; PotentialModularityAndCompatibleSystems:R24.2

### KW I Theorem 5.1(3): a prescribed level-one type at q
Packet node: PotentialModularityAndCompatibleSystems:R24.3/theorem-5-1-part-3-level-one-type-at-q

* TauCeti.CompatibleSystems.theorem_5_1_part_3_level_one_type_at_q — OMITTED FULL SIGNATURE
  Under KW I Theorem 5.1's hypotheses, with q ∥ N(ρ̄) odd, p | q − 1 and χ′ = ω_q^i (i even if p = 2) lifting χ, ρ̄ has a lift of required type (3). If the residual representation ρ̄_q of the resulting system is irreducible, it has Serre weight i + 2 or q + 1 − i up to twist (R24.5/kw-theorem-5-1-systems).

Supplier routes: PotentialModularityAndCompatibleSystems:R24.3/required-lift-types; LocalGaloisDeformationRings:R08.6/local-nonemptiness; GlobalGaloisDeformations:R04.3/global-dimension-lower-bound; GlobalGaloisDeformations:R04.6/factorization-through-local-conditions; PotentialModularityAndCompatibleSystems:R24.1; PotentialModularityAndCompatibleSystems:R24.2; LocalGaloisDeformationRings:R08.6/export-away-from-p

### KW I Theorem 5.1(4): a prescribed level-two type at q
Packet node: PotentialModularityAndCompatibleSystems:R24.3/theorem-5-1-part-4-level-two-type-at-q

* TauCeti.CompatibleSystems.theorem_5_1_part_4_level_two_type_at_q — OMITTED FULL SIGNATURE
  Under KW I Theorem 5.1's hypotheses, with ρ̄|_{D_q} ≅ (χ_p ∗; 0 1) up to unramified twist and p | q + 1, and a level-2 character χ′ = ω_{q,2}^iω_{q,2}^{qj} of p-power order (i + j even if p = 2), ρ̄ has a lift of required type (4). This is the construction that inserts a good dihedral prime (ClassicalSerreModularity R27.1).

Supplier routes: PotentialModularityAndCompatibleSystems:R24.3/required-lift-types; LocalGaloisDeformationRings:R08.6/local-nonemptiness; GlobalGaloisDeformations:R04.3/global-dimension-lower-bound; GlobalGaloisDeformations:R04.6/factorization-through-local-conditions; PotentialModularityAndCompatibleSystems:R24.1; PotentialModularityAndCompatibleSystems:R24.2; LocalGaloisDeformationRings:R08.6/export-away-from-p

### Where the lifts of KW I Theorem 5.1 are used
Packet node: PotentialModularityAndCompatibleSystems:R24.3/theorem-5-1-application-table

* TauCeti.CompatibleSystems.theorem_5_1_application_table — OMITTED FULL SIGNATURE
  The applications, with the type used: KW I §8.1 (Theorem 3.1, killing ramification): (1). §8.2 (Theorem 3.2): mod 3 — (2) then (4) with χ′ = ω_{3,2}²; mod 5 — (2) then (3) with χ′ = ω₅², and then, for the residual member ρ̄′₅, (2) if 3 | N(ρ̄′₅) and (1) otherwise; inductive step — (2) then (3) with χ′ = ω_P^i for the i of §7, and then, for ρ̄′_P, (2) if p | N(ρ̄′_P) and (1) otherwise. §8.3 (Corollary 8.1): (1). §8.4 (Theorem 3.4): (2) then (4) at the good dihedral prime q. §9 (Theorem 9.1): (2), and (4) with the order-3 type at 2. KW Annals Theorem 3.3 is the minimal case (1) for k(ρ̄) ≠ p. The modern route uses Dieulefait–Pacetti Theorem 1.9: its cases (1)–(3) are the dyadic and odd-prime instances of KW I Theorem 5.1 (1) and (2), and its case (4), weight-two lifts with prescribed inertial types away from p, is due to Gee and Snowden (R24.3/modern-prescribed-type-lifts).

Supplier routes: PotentialModularityAndCompatibleSystems:R24.3/theorem-5-1-part-1-minimal-crystalline; PotentialModularityAndCompatibleSystems:R24.3/theorem-5-1-part-2-weight-two; PotentialModularityAndCompatibleSystems:R24.3/theorem-5-1-part-3-level-one-type-at-q; PotentialModularityAndCompatibleSystems:R24.3/theorem-5-1-part-4-level-two-type-at-q; PotentialModularityAndCompatibleSystems:R24.3/kw-annals-minimal-lifts

### Weight-two lifts with prescribed types (Snowden Theorem 7.2.1; Gee)
Packet node: PotentialModularityAndCompatibleSystems:R24.3/modern-prescribed-type-lifts

* TauCeti.CompatibleSystems.modern_prescribed_type_lifts — OMITTED FULL SIGNATURE
  Let p be an odd prime (Snowden's standing convention, §1.4), F totally real and ρ̄ : G_F → GL₂(𝔽̄_p) odd with (A1) ρ̄|_{G_{F(ζ_p)}} absolutely irreducible and (A2) if p = 5 and the projective image is PGL₂(𝔽₅) then [F(ζ₅) : F] = 4. For a lifting problem P = (Σ, ψ, t, {τ_v}) — Σ containing the ramified places and those above p, ψ of finite order with det ρ̄ = ψ̄χ̄_p, a definite type t(v) and an inertial type τ_v at each v ∈ Σ — there are finitely many solutions (weight-two lifts with these data), and a solution exists iff a local solution exists (Theorem 7.2.1). If t is a definite type function on Σ′ ⊆ Σ compatible with ρ̄, then ρ̄ has a weight-two lift unramified outside Σ with determinant ψχ_p and type t on Σ′ (Theorem 7.6.1). Over F = ℚ, (A2) is automatic, and this gives Dieulefait–Pacetti Theorem 1.9(4) (crystalline at p if k(ρ̄) = 2, Steinberg if k(ρ̄) = p + 1). It is used only by the modern route.

Supplier routes: LocalGaloisDeformationRings:R08.6; PotentialModularityAndCompatibleSystems:R24.1; PotentialModularityAndCompatibleSystems:R24.2; LocalGaloisDeformationRings:R08.6/local-nonemptiness

### From "ρ̄ modular" to the residual hypotheses (α) and (β)
Packet node: PotentialModularityAndCompatibleSystems:R24.4/alpha-beta-from-residual-modularity

* TauCeti.CompatibleSystems.alpha_beta_from_residual_modularity — OMITTED FULL SIGNATURE
  Let ρ̄ : G_ℚ → GL₂(𝔽) be of S-type and modular, with KW I Theorem 4.1's image hypotheses. Then ρ̄ arises from S_{k(ρ̄)}(Γ₁(N)) for some N prime to p and from S₂(Γ₁(Np)) (weight part of Serre's conjecture: Gross's Theorem 13.10, Coleman–Voloch, and Gross's Propositions 8.13 and 8.18); so after an allowable base change F/ℚ (solvable, totally real, unramified or split at p as required), ρ̄|_{G_F} satisfies (α) and (β) for p > 2, and (α) when p = k(ρ̄) = 2 and (β) for p = 2.

Supplier routes: GL2ModularityLifting:R22.5/kw-residual-modularity; SerreWeightAndLevelOptimisation:R20.6; AlgebraicModularFormsAndSerreWeights:R15.4; GL2AutomorphicRepresentationsAndTransfer:R17.4; GL2ModularityLifting:R22.5/solvable-base-change-reduction

### KW I Theorem 4.1: modularity lifting over ℚ
Packet node: PotentialModularityAndCompatibleSystems:R24.4/kw-theorem-4-1

* TauCeti.CompatibleSystems.kw_theorem_4_1 — OMITTED FULL SIGNATURE
  Let ρ̄ : G_ℚ → GL₂(𝔽) be modular, with non-solvable image if p = 2 and ρ̄|_{ℚ(µ_p)} absolutely irreducible if p > 2. (1) (p = 2) An odd, finitely ramified 2-adic lift ρ that is crystalline of weight 2 at 2, or semistable of weight 2 at 2 (only when k(ρ̄) = 4), is modular. (2) (p > 2) A finitely ramified p-adic lift that is (i) crystalline of weight k with 2 ≤ k ≤ p + 1, or (ii) potentially semistable of weight 2 at p, is modular. Proof: (α), (β) from R24.4/alpha-beta-from-residual-modularity; after an allowable base change F/ℚ, ρ|_{G_F} satisfies the lifting data (A), (B) or (C) and Theorem 9.7 (GL2ModularityLifting R22.5 for p > 2, R22.6 for p = 2) makes it modular; solvable descent (Langlands) returns to ℚ.

Supplier routes: PotentialModularityAndCompatibleSystems:R24.4/alpha-beta-from-residual-modularity; GL2ModularityLifting:R22.5/kw-odd-prime-lifting; GL2ModularityLifting:R22.6/kw-dyadic-lifting; GL2ModularityLifting:R22.5/solvable-base-change-reduction; GL2AutomorphicRepresentationsAndTransfer:R17.4

### Compatible systems: strict, almost strict, and plain
Packet node: PotentialModularityAndCompatibleSystems:R24.5/compatible-system

* TauCeti.CompatibleSystems.CompatibleSystem — ACTIVE FRAGMENT
  E, the family ρ_ι, the Weil–Deligne data r_𝔮 and the weights (a, b)
* TauCeti.CompatibleSystems.CompatibleSystem.IsStrict — OMITTED FULL SIGNATURE
  compatibility with r_𝔮 at every 𝔮, including 𝔮 above ℓ
* TauCeti.CompatibleSystems.CompatibleSystem.IsAlmostStrict — OMITTED FULL SIGNATURE
  the two conditions at 𝔮 | ℓ (irreducible residual, or ℓ ≠ 2 and r_𝔮 unramified)
* TauCeti.CompatibleSystems.CompatibleSystem.IsRegular — ACTIVE FRAGMENT
  a ≠ b
* TauCeti.CompatibleSystems.CompatibleSystem.IsStrict.isAlmostStrict — OMITTED FULL SIGNATURE
  strict ⇒ almost strict ⇒ compatible
* TauCeti.CompatibleSystems.CompatibleSystem.enlargeCoefficients — OMITTED FULL SIGNATURE
  Extend E to a finite number-field extension E′ and reindex embeddings; preserve the same members and local data after extension. Eigenform constructors are imported from R19.3 and are not defined here.

Supplier routes: PadicHodgeTheory:R06.3/weil-deligne-parameter; ArithmeticGaloisRepresentations:R01.2; ArithmeticGaloisRepresentations:R01.5; ArithmeticGaloisRepresentations:R01.1; mathlib:Representation; mathlib:Field.absoluteGaloisGroup

* test newform_is_strict — OMITTED FULL SIGNATURE
* test weight_one_irregular — EXAMPLE FRAGMENT
* test almost_strict_not_strict — EXAMPLE FRAGMENT
* test hodge_tate_weights_convention — EXAMPLE FRAGMENT

### Twisting, restriction and induction of compatible systems
Packet node: PotentialModularityAndCompatibleSystems:R24.5/system-operations

* TauCeti.CompatibleSystems.twist — ACTIVE FRAGMENT
  Memberwise tensor with a strict character system; local WD tensor and Hodge shifts.
* TauCeti.CompatibleSystems.restrict — OMITTED FULL SIGNATURE
  Restrict to G_F′; Q roots raised to residue degrees and H_τ pulled back.
* TauCeti.CompatibleSystems.induce — OMITTED FULL SIGNATURE
  For finite F′/F induce each member, rank multiplied by [F′:F], enlarge S by ramified primes, local WD induction and Hodge multiset union.
* TauCeti.CompatibleSystems.restrict_charpoly — OMITTED FULL SIGNATURE
  At w|v outside S, roots of Q_w are α^[k(w):k(v)] for roots α of Q_v.
* TauCeti.CompatibleSystems.induce_rank — OMITTED FULL SIGNATURE
  Rank Ind_F′^F ℛ=[F′:F] rank ℛ; induction need not preserve regularity or irreducibility.

Supplier routes: PotentialModularityAndCompatibleSystems:R24.5/compatible-system; PadicHodgeTheory:R06.3/weil-deligne-parameter; ArithmeticGaloisRepresentations:R01.2; ArithmeticGaloisRepresentations:R01.5; ArithmeticGaloisRepresentations:R01.1; ArithmeticGaloisRepresentations:G7; mathlib:Representation.ind; mathlib:Representation.dual

* test twist_cyclotomic — EXAMPLE FRAGMENT
* test restrict_trivial_extension — EXAMPLE FRAGMENT
* test induce_quadratic_trivial — EXAMPLE FRAGMENT
* test induced_regular_nonexample — EXAMPLE FRAGMENT

### The compatible system through a potentially modular lift, by Brauer induction
Packet node: PotentialModularityAndCompatibleSystems:R24.5/brauer-induction-system

* TauCeti.CompatibleSystems.brauerSystem — OMITTED FULL SIGNATURE
  ρ_ι = Σ n_i Ind(χ_i ⊗ ρ_{π_i,ι}) from the Brauer data and the base-changed π_i
* TauCeti.CompatibleSystems.brauerSystem_isTrue — OMITTED FULL SIGNATURE
  The virtual class has dimension 2 and norm-one pairing, hence is the class of a genuine absolutely irreducible member.
* TauCeti.CompatibleSystems.brauerSystem_trace — OMITTED FULL SIGNATURE
  After mapping the common algebraic trace into both coefficient fields, all good Frobenius characteristic polynomials agree with the given p-member; no direct equality between ℓ-adic and p-adic values is asserted.
* TauCeti.CompatibleSystems.brauerSystem_unique — OMITTED FULL SIGNATURE
  Uniqueness memberwise up to representation isomorphism after a common coefficient extension; no canonical basis, lattice or conjugating matrix is asserted.
* TauCeti.CompatibleSystems.brauerSystem_restrict — OMITTED FULL SIGNATURE
  restriction to G_{F′} with F/F′ solvable is automorphic

Supplier routes: PotentialModularityAndCompatibleSystems:R24.5/compatible-system; PotentialModularityAndCompatibleSystems:R24.5/system-operations; GL2AutomorphicRepresentationsAndTransfer:R17.4; PotentialModularityAndCompatibleSystems:R23.4; ArithmeticGaloisRepresentations:R01.5; PotentialModularityAndCompatibleSystems:R24.5/galois-grothendieck-ring; AutomorphicGaloisRepresentations:R19.3; AutomorphicGaloisRepresentations:R19.4; GL2AutomorphicRepresentationsAndTransfer:R17.6; tauceti:TauCetiRoadmap/RepresentationTheory/InductionRestriction#layer-6-the-virtual-character-ring-artin-and-brauer-induction

* test brauer_trivial_F — EXAMPLE FRAGMENT
* test brauer_quadratic_coefficients — EXAMPLE FRAGMENT
* test brauer_virtual_nonexample — EXAMPLE FRAGMENT
* test brauer_trace_agreement — OMITTED FULL SIGNATURE

### The Brauer system is almost strictly compatible
Packet node: PotentialModularityAndCompatibleSystems:R24.5/almost-strict-compatibility

* TauCeti.CompatibleSystems.almost_strict_compatibility — OMITTED FULL SIGNATURE
  The system (ρ_ι) of R24.5/brauer-induction-system is almost strictly compatible. For a prime q, let F(q) ⊆ F be the decomposition field at a prime Q | q, π_q the local component at Q of the form attached to ρ|_{G_{F(q)}}, and r_q its Frobenius-semisimple Weil–Deligne parameter. (a) For q ≠ ℓ, the Weil–Deligne parameter of ρ_ι|_{D_q} is r_q (Carayol, Taylor). (b) For q = ℓ ≠ 2 with r_q unramified, it is r_q and ρ_ι|_{D_q} is crystalline (Breuil, Berger). (c) For q = ℓ with ρ̄_ι irreducible, it is r_q (Kisin's potentially semistable deformation rings, after moving to a field F′ linearly disjoint from the kernel of ρ̄_ι). Strict compatibility would follow from Kisin's result without the irreducibility hypothesis; KW II correct an earlier claim of strictness on this point. This records exactly the 2009 KW proof. Its residual-irreducibility restriction is not a present-day impossibility: the strict result below uses Skinner’s full theorem in place of that restricted coefficient-prime input.

Supplier routes: PotentialModularityAndCompatibleSystems:R24.5/brauer-induction-system; AutomorphicGaloisRepresentations:R19.5/potential-semistability-and-compatibility-at-the-coefficient-prime; PotentialModularityAndCompatibleSystems:R24.5/compatible-system; AutomorphicGaloisRepresentations:R19.3; AutomorphicGaloisRepresentations:R19.4; PotentialModularityAndCompatibleSystems:R23.5; AutomorphicGaloisRepresentations:R19.5

### KW I Theorem 5.1: almost strictly compatible systems through prescribed lifts
Packet node: PotentialModularityAndCompatibleSystems:R24.5/kw-theorem-5-1-systems

* TauCeti.CompatibleSystems.kw_theorem_5_1_systems — OMITTED FULL SIGNATURE
  Let ρ̄ satisfy KW I Theorem 5.1's hypotheses. For each i ∈ {1, 2, 3, 4} (with the conditions of that type) there are a number field E and an E-rational almost strictly compatible, irreducible, odd system (ρ_ι) lifting ρ̄ whose p-adic member is a lift of required type (i). In case (3), if the residual representation ρ̄_q is irreducible it has Serre weight i + 2 or q + 1 − i up to twist; in case (4), if q is odd and ρ̄_q is irreducible, its weight is q + 1 − (i − j) or i − j when i > j + 1, and q when i = j + 1 (Savitt, Corollary 6.15 and Remark 6.17). With the imported Skinner theorem the same constructed system is strictly compatible; the almost-strict conclusion is the source-faithful KW variant. Good Frobenius polynomials lie in one finite coefficient field and the geometric normalized family is pure by strict-brauer-system.

Supplier routes: PotentialModularityAndCompatibleSystems:R24.3/theorem-5-1-part-1-minimal-crystalline; PotentialModularityAndCompatibleSystems:R24.3/theorem-5-1-part-2-weight-two; PotentialModularityAndCompatibleSystems:R24.3/theorem-5-1-part-3-level-one-type-at-q; PotentialModularityAndCompatibleSystems:R24.3/theorem-5-1-part-4-level-two-type-at-q; PotentialModularityAndCompatibleSystems:R24.5/brauer-induction-system; PotentialModularityAndCompatibleSystems:R24.5/almost-strict-compatibility; AlgebraicModularFormsAndSerreWeights:R15.4; PotentialModularityAndCompatibleSystems:R24.5/strict-brauer-system

### Dieulefait: a given lift lies in an almost strictly compatible system (DP Theorem 1.11)
Packet node: PotentialModularityAndCompatibleSystems:R24.5/dieulefait-families

* TauCeti.CompatibleSystems.dieulefait_families — OMITTED FULL SIGNATURE
  Dieulefait–Pacetti Theorem 1.11 states: let ρ : G_ℚ → GL₂(K_λ) be odd, irreducible, continuous, finitely ramified and de Rham at p with Hodge–Tate weights {0, k − 1}, k > 1, with ρ̄|_{G_{ℚ(ζ_p)}} absolutely irreducible (non-solvable image if p = 2); then ρ is part of a rank-2 almost strictly compatible system in the sense of DP Definition 1.10 (condition (6) relaxed only at residually reducible coefficient primes with ramified WD_p(ℛ), or p = 2; every member de Rham at its coefficient prime). This packet plans it for the lifts in the scope of R23.4: after a twist ρ̄ satisfies KW I Theorem 5.1's hypotheses, and ρ is of type (A), (B) or (C) at p (for p = 2: crystalline of weight 2, or semistable of weight 2 when ρ̄ is not finite at 2). These include the minimal crystalline lifts of DP Theorem 1.9(1)–(3) and the weight-two lifts of DP Theorem 1.9(4) that are crystalline or Steinberg at p, or of KW type (B). Proof: potential modularity of the given lift (R23.4) over a totally real Galois F, then the Brauer system and its almost strict compatibility (R24.5). In this scope strict-brauer-system upgrades the family to KW strict compatibility, which also gives DP's de Rham condition at every member. The rest of DP's statement is a recorded gap: weight-two lifts of DP Theorem 1.9(4) whose type at p is potentially Barsotti–Tate of another inertial type need potential modularity through a potentially Barsotti–Tate lifting theorem over totally real fields, and general de Rham lifts (k > p + 1, or potentially semistable of weight > 2) need potential modularity of arbitrary regular de Rham lifts. Neither is supplied by R23.4, and DP's citation [Die04, Theorem 1.1] does not cover them (source issue PotentialModularityAndCompatibleSystems/E5).

Supplier routes: PotentialModularityAndCompatibleSystems:R23.4; PotentialModularityAndCompatibleSystems:R24.5/brauer-induction-system; PotentialModularityAndCompatibleSystems:R24.5/almost-strict-compatibility; PotentialModularityAndCompatibleSystems:R24.5/strict-brauer-system

### Residual members of a compatible system
Packet node: PotentialModularityAndCompatibleSystems:R24.6/residual-members

* TauCeti.CompatibleSystems.residual_members — OMITTED FULL SIGNATURE
  Let (ρ_ι) be an E-rational almost strictly compatible, irreducible, odd two-dimensional system of G_ℚ with weights (a, b), and ρ̄_ι the semisimplified reductions. (i) det ρ̄_ι is the reduction of det ρ_ι, and ρ̄_ι is odd. (ii) ρ̄_ι is absolutely irreducible for every ι above all but finitely many primes ℓ (KW I, proof of Theorem 10.1, which uses that the conductor of ρ_ι is bounded independently of ι and that the Hodge–Tate weights are fixed; KW I §8.4 uses it). If moreover a ≠ b, then for all but finitely many ℓ also ρ̄_ι|_{G_{ℚ(ζ_ℓ)}} is absolutely irreducible: for ℓ outside the ramification set with ℓ > 2(a − b) + 1, (v) gives k(ρ̄_ι) = a − b + 1 up to twist, while KW I Lemma 6.2(ii) would force a − b + 1 ∈ {(ℓ + 1)/2, (ℓ + 3)/2} if the restriction were reducible. For regular weakly compatible systems of any rank over any number field, R24.5/residual-irreducibility-density-one gives the restriction statement for every irreducible constituent, but only on a Dirichlet-density-one set of ℓ. (iii) For q ≠ ℓ, the Artin conductor of ρ̄_ι at q divides that of r_q, so N(ρ̄_ι) divides the prime-to-ℓ conductor of the system; the prime divisors of N(ρ̄_ι) are among the ramified primes of the system other than ℓ. (iv) If ρ(I_q) is finite of order prime to ℓ (for instance a dihedral group of order 2t^a with ℓ∤2t), reduction is injective on it, so ρ̄_ι|_{I_q} has the same shape. (v) If ℓ is outside the ramification set, ℓ ≠ 2 and 0≤a−b≤ℓ−2, then ρ_ι is crystalline at ℓ and k(ρ̄_ι) = a − b + 1 up to twist (Fontaine–Laffaille).

Supplier routes: PotentialModularityAndCompatibleSystems:R24.5/compatible-system; ArithmeticGaloisRepresentations:R01.3; ArithmeticGaloisRepresentations:R01.4; PadicHodgeTheory:R06.4/fontaine-laffaille-rational-consequences; AlgebraicModularFormsAndSerreWeights:R15.4; PotentialModularityAndCompatibleSystems:R24.5/residual-irreducibility-density-one; PotentialModularityAndCompatibleSystems:R24.5/strict-brauer-system; ArithmeticGaloisRepresentations:R01.1; ArithmeticGaloisRepresentations:R01.5

### What an almost strict system says at its own coefficient prime
Packet node: PotentialModularityAndCompatibleSystems:R24.6/local-compatibility-at-the-coefficient-prime

* TauCeti.CompatibleSystems.local_compatibility_at_the_coefficient_prime — OMITTED FULL SIGNATURE
  For an arbitrary KW almost-strict system and ι above ℓ, the definition gives full WD comparison at q=ℓ if the residual member is irreducible; if ℓ≠2 and r_ℓ is unramified it gives crystallinity and the prescribed Hodge weights. In the other cases its contract alone gives neither de Rham nor WD comparison. For the specific motivic Hilbert/Brauer systems constructed here, strict-brauer-system instead gives de Rham/potential semistability and full WD comparison at every coefficient prime, even for reducible residual members and ℓ=2; unramified r_ℓ then implies crystalline. These assertions are local input lemmas. Application of residually reducible de Rham modularity lifting belongs to GL2ModularityLifting R32.6 and is imported there.

Supplier routes: PotentialModularityAndCompatibleSystems:R24.5/compatible-system; PotentialModularityAndCompatibleSystems:R24.5/almost-strict-compatibility; PotentialModularityAndCompatibleSystems:R24.5/strict-brauer-system; AutomorphicGaloisRepresentations:R19.5; PadicHodgeTheory:R06.3/weil-deligne-descent

### Linked systems and modularity transfer
Packet node: PotentialModularityAndCompatibleSystems:R24.6/linked-systems-modularity-transfer

* TauCeti.CompatibleSystems.linked_systems_modularity_transfer — OMITTED FULL SIGNATURE
  If one member of a compatible rank-two family is the member attached to a newform f, all members are attached to f after common coefficient extension, by equality of good Frobenius characteristic polynomials and Chebotarev–Brauer–Nesbitt recognition. Two families are linked at λ when their chosen semisimplified residual members are isomorphic. Given this link to a modular family, the classical congruence transfer is the application of the imported KW I Theorem 4.1 interface when its local and residual-image hypotheses hold. Modern transfer, especially ramified coefficient-prime residually reducible de Rham transfer, is an import from GL2ModularityLifting R32.6, not a new theorem here.

Supplier routes: PotentialModularityAndCompatibleSystems:R24.5/compatible-system; ArithmeticGaloisRepresentations:R01.5; PotentialModularityAndCompatibleSystems:R24.4/kw-theorem-4-1; AutomorphicGaloisRepresentations:R19.3; GL2ModularityLifting:R32.6/transfer-residually-reducible; GL2ModularityLifting:R32.6/transfer-dyadic; GL2ModularityLifting:R32.6/transfer-residually-irreducible-odd

### Rank-n weakly compatible systems of l-adic representations
Packet node: PotentialModularityAndCompatibleSystems:R24.5/weakly-compatible-system-rank-n

* TauCeti.CompatibleSystems.WeaklyCompatibleSystem — ACTIVE FRAGMENT
  (M, S, Q_v, r_λ, H_τ) with the compatibility conditions.
* TauCeti.CompatibleSystems.WeaklyCompatibleSystem.rank — ACTIVE FRAGMENT
  The rank n.
* TauCeti.CompatibleSystems.WeaklyCompatibleSystem.charpoly_frob — OMITTED FULL SIGNATURE
  For v ∉ S, v ∤ l: r_λ unramified at v with charpoly r_λ(Frob_v) = Q_v.
* TauCeti.CompatibleSystems.WeaklyCompatibleSystem.deRham — OMITTED FULL SIGNATURE
  r_λ|_{G_{F_v}} de Rham for v | l, crystalline for v ∉ S.
* TauCeti.CompatibleSystems.WeaklyCompatibleSystem.ofCompatibleSystem — ACTIVE FRAGMENT
  Convert a rank-two KW system only with additional hypotheses: every coefficient member is de Rham of the common weights at every place above ℓ and crystalline outside an enlarged fixed finite S. Plain or almost strict compatibility alone does not imply these.
* TauCeti.CompatibleSystems.WeaklyCompatibleSystem.enlargeRamificationSet — ACTIVE FRAGMENT
  For finite S⊆S′, keep every r_λ and H_τ, restrict Q_v to v∉S′, obtaining a weakly compatible system.

Supplier routes: ArithmeticGaloisRepresentations:R01.1; ArithmeticGaloisRepresentations:R01.5; PadicHodgeTheory:R06.2; PadicHodgeTheory:R06.3/weil-deligne-parameter; mathlib:Representation; mathlib:Field.absoluteGaloisGroup; mathlib:LinearMap.charpoly; mathlib:NumberField.FinitePlace; mathlib:NumberField.FinitePlace.embedding

* test wcs_cyclotomic — EXAMPLE FRAGMENT
* test wcs_newform_delta — EXAMPLE FRAGMENT
* test wcs_not_just_traces — EXAMPLE FRAGMENT
* test wcs_S_enlarge — EXAMPLE FRAGMENT

### Predicates on weakly compatible systems: regular, strictly compatible, pure, self-dual, irreducible, automorphic
Packet node: PotentialModularityAndCompatibleSystems:R24.5/compatible-system-predicates

* TauCeti.CompatibleSystems.WeaklyCompatibleSystem.IsRegular — ACTIVE FRAGMENT
  Distinct Hodge–Tate numbers for every τ.
* TauCeti.CompatibleSystems.WeaklyCompatibleSystem.IsExtremelyRegular — ACTIVE FRAGMENT
  Regular, and some H_τ has no distinct equal-cardinality submultisets with the same sum.
* TauCeti.CompatibleSystems.WeaklyCompatibleSystem.IsStrictlyCompatible — OMITTED FULL SIGNATURE
  A Weil–Deligne representation WD_v(ℛ) matching every r_λ at v, λ ∤ residue characteristic of v.
* TauCeti.CompatibleSystems.WeaklyCompatibleSystem.IsPure — ACTIVE FRAGMENT
  Weight-w purity of the Q_v and the symmetry H_{cτ} = w − H_τ.
* TauCeti.CompatibleSystems.WeaklyCompatibleSystem.IsEssentiallySelfDual — OMITTED FULL SIGNATURE
  Essential conjugate self-duality with a character system of G_{F⁺}, and its totally odd version.
* TauCeti.CompatibleSystems.WeaklyCompatibleSystem.IsIrreducible — OMITTED FULL SIGNATURE
  Irreducible for λ above a density-one set of primes.
* TauCeti.CompatibleSystems.WeaklyCompatibleSystem.IsAutomorphic — OMITTED FULL SIGNATURE
  Frobenius polynomials of a regular algebraic cuspidal π.

Supplier routes: PotentialModularityAndCompatibleSystems:R24.5/weakly-compatible-system-rank-n; PadicHodgeTheory:R06.3/weil-deligne-parameter; ArithmeticGaloisRepresentations:G7; PotentialModularityAndCompatibleSystems:R24.5/polarized-system

* test pred_newform — EXAMPLE FRAGMENT
* test pred_regular_fails — EXAMPLE FRAGMENT
* test pred_odd_purity — EXAMPLE FRAGMENT
* test pred_strict_vs_almost_strict — EXAMPLE FRAGMENT

### Linear-algebra operations on weakly compatible systems and what they preserve
Packet node: PotentialModularityAndCompatibleSystems:R24.5/linear-algebra-operations-on-systems

* TauCeti.CompatibleSystems.directSum — ACTIVE FRAGMENT
  Members r⊕s; Q_v=Q_r Q_s; H disjoint union; common pure weight required for purity.
* TauCeti.CompatibleSystems.tensor — ACTIVE FRAGMENT
  Members (r⊗s)^ss; roots αβ; H all pairwise sums; pure weight w+w′.
* TauCeti.CompatibleSystems.dual — ACTIVE FRAGMENT
  Members r∨; normalized reciprocal Q_v; H=−H; pure weight −w.
* TauCeti.CompatibleSystems.symmetricPower — ACTIVE FRAGMENT
  Sym^k members and repeated k-fold weight sums; rank binomial(n+k−1,k).
* TauCeti.CompatibleSystems.exteriorPower — ACTIVE FRAGMENT
  ∧^k members and distinct k-fold weight sums; rank binomial(n,k), zero if k>n.
* TauCeti.CompatibleSystems.dual_charpoly — ACTIVE FRAGMENT
  The normalized reciprocal polynomial is monic of rank n; for rank 2, X²−aX+b becomes X²−(a/b)X+1/b.
* TauCeti.CompatibleSystems.directSum_pure — ACTIVE FRAGMENT
  Pure systems of the same weight w have pure direct sum of weight w; differing weights invalidate the conclusion.

Supplier routes: PotentialModularityAndCompatibleSystems:R24.5/compatible-system-predicates; PotentialModularityAndCompatibleSystems:R24.5/system-operations; PadicHodgeTheory:R06.3/weil-deligne-parameter; ArithmeticGaloisRepresentations:R01.5; ArithmeticGaloisRepresentations:G7; PotentialModularityAndCompatibleSystems:R24.5/weakly-compatible-system-rank-n; PadicHodgeTheory:R06.2

* test dual_rank_two — EXAMPLE FRAGMENT
* test sym2_distinct — EXAMPLE FRAGMENT
* test tensor_collision — EXAMPLE FRAGMENT
* test direct_sum_mixed_weights — EXAMPLE FRAGMENT
* test exterior_above_rank — EXAMPLE FRAGMENT

### Reducibility of rank-2 systems over ℚ does not depend on λ
Packet node: PotentialModularityAndCompatibleSystems:R24.5/rank-two-reducibility-independent-of-lambda

* TauCeti.CompatibleSystems.rank_two_reducibility_independent_of_lambda — OMITTED FULL SIGNATURE
  For a rank-two weakly compatible system over ℚ in Taylor’s §6 sense, absolute reducibility of one characteristic-zero member implies absolute reducibility of every member. The two Hodge–Tate characters at that member fit into algebraic Hecke-character systems by Serre; their direct sum has the same good Frobenius polynomials, so recognition identifies every other member. This is independence of characteristic-zero reducibility, not independence of residual reducibility.

Supplier routes: PotentialModularityAndCompatibleSystems:R24.5/weakly-compatible-system-rank-n; PotentialModularityAndCompatibleSystems:R24.5/compatible-system-predicates; ArithmeticGaloisRepresentations:R01.5; PotentialModularityAndCompatibleSystems:R24.5/character-system; PotentialModularityAndCompatibleSystems:R24.5/weakened-compatible-data

### L-functions, Γ-factors and ε-factors of a compatible system
Packet node: PotentialModularityAndCompatibleSystems:R24.5/system-l-functions

* TauCeti.CompatibleSystems.partialLFunction — ACTIVE FRAGMENT
  L^S(ıℛ, s) as an Euler product.
* TauCeti.CompatibleSystems.lFunction — OMITTED FULL SIGNATURE
  L(ıℛ, s) for strictly compatible ℛ.
* TauCeti.CompatibleSystems.archimedeanGammaFactor — ACTIVE FRAGMENT
  L_v(ıℛ, s) at complex and real v in BLGGT v4's form, through Complex.Gammaℝ and Complex.Gammaℂ.
* TauCeti.CompatibleSystems.archimedeanEpsilon — ACTIVE FRAGMENT
  ε_v(ıℛ, ψ_v, s) = i^{Σ|h − w/2|} (complex v) or i^{d− + Σ|h − w/2|} (real v).
* TauCeti.CompatibleSystems.archimedeanD — ACTIVE FRAGMENT
  d± at a real place: n/2, or (n ± (−1)^{w/2}det ℛ(c_v))/2 for n odd.
* TauCeti.CompatibleSystems.completedLFunction — OMITTED FULL SIGNATURE
  Λ(ıℛ, s) and ε(ıℛ, s).
* TauCeti.CompatibleSystems.partialLFunction_converges — OMITTED FULL SIGNATURE
  Convergence on Re s > 1 + w/2 for pure ℛ.
* TauCeti.CompatibleSystems.partialLFunction_eq_of_lambda — OMITTED FULL SIGNATURE
  L^S(ıℛ, s) = L^S(ı̃r_λ, s) when S contains the places above l.

Supplier routes: PotentialModularityAndCompatibleSystems:R24.5/weakly-compatible-system-rank-n; PotentialModularityAndCompatibleSystems:R24.5/compatible-system-predicates; PadicHodgeTheory:R06.3/weil-deligne-parameter; EndoscopicTransferAndUnitaryTraceComparison:ET.6; mathlib:Complex.Gammaℝ; mathlib:Complex.Gammaℂ; mathlib:Complex.Gammaℝ_mul_Gammaℝ_add_one

* test trivial_character — EXAMPLE FRAGMENT
* test gamma_duplication — EXAMPLE FRAGMENT
* test cyclotomic_character — EXAMPLE FRAGMENT
* test elliptic_curve_gamma_factor — EXAMPLE FRAGMENT

### The Grothendieck ring of semisimple ℓ-adic representations
Packet node: PotentialModularityAndCompatibleSystems:R24.5/galois-grothendieck-ring

* TauCeti.CompatibleSystems.RepRing — ACTIVE FRAGMENT
  Rep_{F,l} with ⊗ as multiplication.
* TauCeti.CompatibleSystems.RepRing.trace — ACTIVE FRAGMENT
  tr σ : Rep_{F,l} → ℚ̄_l, a ring homomorphism.
* TauCeti.CompatibleSystems.RepRing.pairing — ACTIVE FRAGMENT
  (A, B) = dim Hom, extended bilinearly.
* TauCeti.CompatibleSystems.RepRing.eq_irreducible_of_pairing_eq_one — ACTIVE FRAGMENT
  Positive dimension and (A,A)=1 imply A is the class of one genuine irreducible; expand A in the irreducible basis and use Σn_i²=1.
* TauCeti.CompatibleSystems.RepRing.res — OMITTED FULL SIGNATURE
  Restriction, a ring homomorphism.
* TauCeti.CompatibleSystems.RepRing.ind — OMITTED FULL SIGNATURE
  Induction with trace formula, projection formula, Frobenius reciprocity and Mackey.
* TauCeti.CompatibleSystems.RepRing.brauer — OMITTED FULL SIGNATURE
  A = Σ n_i ind([ı^{−1}ψ_i] res A).
* TauCeti.CompatibleSystems.RepRing.partialLFunction — ACTIVE FRAGMENT
  L^S(ıA, s) = ∏ L^S(ıV_i, s)^{n_i}, additive and inductive.

Supplier routes: PotentialModularityAndCompatibleSystems:R24.5/system-l-functions; PotentialModularityAndCompatibleSystems:R24.5/system-operations; PotentialModularityAndCompatibleSystems:R24.5/linear-algebra-operations-on-systems; ArithmeticGaloisRepresentations:R01.5; ArithmeticGaloisRepresentations:R01.1; ArithmeticGaloisRepresentations:G7; mathlib:Rep.indResAdjunction; tauceti:TauCetiRoadmap/RepresentationTheory/InductionRestriction#layer-6-the-virtual-character-ring-artin-and-brauer-induction

* test pairing_norm — EXAMPLE FRAGMENT
* test trivial_class — EXAMPLE FRAGMENT
* test induced_dimension — EXAMPLE FRAGMENT
* test virtual_not_genuine — EXAMPLE FRAGMENT

### Residual irreducibility over F(ζ_l) for a density-one set of primes
Packet node: PotentialModularityAndCompatibleSystems:R24.5/residual-irreducibility-density-one

* TauCeti.CompatibleSystems.residual_irreducibility_density_one — OMITTED FULL SIGNATURE
  Let ℛ be a regular weakly compatible system of l-adic representations of G_F defined over M (BLGGT Proposition 5.2.2). For a subrepresentation s of r_λ write s̄ for the semisimplification of its reduction and l for the rational prime below λ. There is a set L of rational primes of Dirichlet density 1 such that if s is an irreducible subrepresentation of r_λ with λ above an element of L, then s̄|_{G_{F(ζ_l)}} is irreducible.

Supplier routes: PotentialModularityAndCompatibleSystems:R24.5/compatible-system-predicates; PotentialModularityAndCompatibleSystems:R24.5/weakly-compatible-system-rank-n; PotentialModularityAndCompatibleSystems:R24.5/monodromy-component-field; PotentialModularityAndCompatibleSystems:R24.5/larsen-good-primes

### Constituents of an essentially conjugate self-dual system
Packet node: PotentialModularityAndCompatibleSystems:R24.5/constituents-essentially-self-dual

* TauCeti.CompatibleSystems.constituents_essentially_self_dual — OMITTED FULL SIGNATURE
  Let F be an imaginary CM field, (ℛ,ℳ) a pure, extremely regular polarized weakly compatible system, F′/F a finite extension and s an irreducible subrepresentation of r_λ|G_F′. There is a CM field F″ with F⊆F″⊆F′ such that s is invariant under G_F″ and (s, μ_λ|G_F″⁺) is a polarized representation; it is totally odd when (ℛ,ℳ) is. The field is a CM descent field, not an arbitrary totally-real intermediate field. Purity and extreme regularity force the selected Hodge subset to be stable under the polarized duality.

Supplier routes: PotentialModularityAndCompatibleSystems:R24.5/compatible-system-predicates; PotentialModularityAndCompatibleSystems:R24.5/linear-algebra-operations-on-systems; PotentialModularityAndCompatibleSystems:R24.5/polarized-system

### The algebraic groups attached to a rational compatible system (BLGGT v4 §5.2)
Packet node: PotentialModularityAndCompatibleSystems:R24.5/larsen-rational-system-groups

* TauCeti.CompatibleSystems.LarsenData.G — OMITTED FULL SIGNATURE
  G_l, the Zariski closure of the image, with G⁰_l, Z_l, G^der_l, G^ad_l, C_l, G^sc_l, H_l.
* TauCeti.CompatibleSystems.LarsenData.componentField — OMITTED FULL SIGNATURE
  F⁰/F with Gal(F⁰/F) ≅ Γ_l/Γ⁰_l for every l.
* TauCeti.CompatibleSystems.LarsenData.gammaH — OMITTED FULL SIGNATURE
  Γ^H_l ⊆ H_l(Q_l), the preimage of Γ⁰⁰_l.
* TauCeti.CompatibleSystems.LarsenData.A — OMITTED FULL SIGNATURE
  A(n): #ker(G^sc_l → G^ad_l) | A(n), uniformly in ℛ and l.
* TauCeti.CompatibleSystems.LarsenData.theta — OMITTED FULL SIGNATURE
  θ_l : S_{F⁰,l} → C_l.

Supplier routes: PotentialModularityAndCompatibleSystems:R24.5/weakly-compatible-system-rank-n; PotentialModularityAndCompatibleSystems:R24.5/monodromy-component-field; ArithmeticGaloisRepresentations:G7

* test torus_case — OMITTED FULL SIGNATURE
* test gl2_case — OMITTED FULL SIGNATURE
* test finite_image — OMITTED FULL SIGNATURE
* test theta_bound_depends_on_system — OMITTED FULL SIGNATURE

### Serre's θ_l with bounds uniform in l (BLGGT v4 Lemma 5.2.1)
Packet node: PotentialModularityAndCompatibleSystems:R24.5/serre-theta-uniform-bounds

* TauCeti.CompatibleSystems.serre_theta_uniform_bounds — OMITTED FULL SIGNATURE
  (1) θ_l : S_{F⁰,l} → C_l is surjective. (2) If l ∉ S then θ_l = (r_l mod G^der_l) ∘ Art_{F⁰} on all of O_{F⁰,l}^×. (3) There is C(ℛ), independent of l, such that for every weight µ ∈ X*(Z_l) of Z_l on V_l, (A(n)µ) ∘ θ_l = Σ_σ m_{µ,σ}σ with |m_{µ,σ}| < C(ℛ). (4) There is D(ℛ) with #(X*(S_{F⁰,l})/θ_l*X*(C_l))_tor ≤ D(ℛ).

Supplier routes: PotentialModularityAndCompatibleSystems:R24.5/larsen-rational-system-groups

### Density-one sets of good primes for a rational system (BLGGT v4 Proposition 5.2.2, after Larsen)
Packet node: PotentialModularityAndCompatibleSystems:R24.5/larsen-good-primes

* TauCeti.CompatibleSystems.larsen_good_primes — OMITTED FULL SIGNATURE
  There is a set L of rational primes of Dirichlet density 1 such that for l ∈ L: (1) G⁰_l, hence Z_l, C_l, G^sc_l and H_l, are unramified (tori Z̃_l, C̃_l over ℤ_l); (2) there is a semisimple group scheme G̃^sc_l/ℤ_l with generic fibre G^sc_l and Γ^H_l = G̃^sc_l(ℤ_l) × Γ^Z_l (put H̃_l = G̃^sc_l × Z̃_l); (3) [Z̃_l(ℤ_l) : Γ^Z_l] is bounded independently of l; (4) the conjugation action of Γ_l on H_l extends uniquely to H̃_l, making V_l an H̃_l ⋊ Γ_l-module; (5) V_l contains an H̃_l ⋊ Γ_l-invariant ℤ_l-lattice; (6) there is an unramified M_λ/Q_l of bounded degree over which the G^sc_l-irreducible subquotients of V_l ⊗ Q̄_l are defined; for V_l ⊗ M_λ = ⊕V_{λ,i} (isotypic parts) and any H̃_l-invariant O_{M_λ}-lattice Λ, Λ = ⊕(Λ ∩ V_{λ,i}), and all irreducible G̃^sc_l(ℤ_l)-subquotients of Λ ∩ V_{λ,i} are absolutely irreducible, isomorphic to ρ̄_i, of dimension that of an irreducible constituent of V_{λ,i}, with ρ̄_i ≅ ρ̄_j only if i = j.

Supplier routes: PotentialModularityAndCompatibleSystems:R24.5/larsen-rational-system-groups; PotentialModularityAndCompatibleSystems:R24.5/serre-theta-uniform-bounds

### Strict compatibility of the Brauer system
Packet node: PotentialModularityAndCompatibleSystems:R24.5/strict-brauer-system

* TauCeti.CompatibleSystems.strict_brauer_system — OMITTED FULL SIGNATURE
  For the rank-two Brauer system of R24.5/brauer-induction-system arising from holomorphic cuspidal Hilbert modular forms of motivic weights k_τ≥2, the members are geometric of the same Hodge–Tate weights and WD(ρ_ι|D_q)^Fss is the fixed r_q at every finite q, including q=ℓ and reducible residual members. Hence it is KW strictly compatible. For q=ℓ unramified r_q, every member is crystalline of the common weights (a de Rham representation is crystalline iff inertia acts trivially on its WD parameter and N = 0, PadicHodgeTheory R06.3). If the Hilbert modular families are pure of weight w in the geometric convention, the descended system is pure of weight w; local strict purity is transported through the same local comparison and local–global purity supplier.

Supplier routes: PotentialModularityAndCompatibleSystems:R24.5/brauer-induction-system; AutomorphicGaloisRepresentations:R19.5; AutomorphicGaloisRepresentations:R19.4; WeightsInEtaleCohomology:R34.6; PadicHodgeTheory:R06.3/weil-deligne-descent

### The common component field of a compatible system
Packet node: PotentialModularityAndCompatibleSystems:R24.5/monodromy-component-field

* TauCeti.CompatibleSystems.monodromy_component_field — OMITTED FULL SIGNATURE
  Let ℛ be a weakly compatible system of G_F. With G_λ the Zariski closure of r_λ(G_F), there is one finite Galois F¹/F inducing Gal(F¹/F)≅G_λ/G_λ⁰ for every λ. If ℛ is regular, every irreducible subrepresentation under any open subgroup has multiplicity one, and after a single finite coefficient-field extension every such subrepresentation is defined over M_λ with a stable O_{M,λ}-lattice. No canonical lattice is selected.

Supplier routes: PotentialModularityAndCompatibleSystems:R24.5/weakly-compatible-system-rank-n; ArithmeticGaloisRepresentations:G7; ArithmeticGaloisRepresentations:R01.5

### Polarized weakly compatible systems
Packet node: PotentialModularityAndCompatibleSystems:R24.5/polarized-system

* TauCeti.CompatibleSystems.PolarizedSystem — ACTIVE FRAGMENT
  Pair ℛ,ℳ with an actual polarization witness at every λ.
* TauCeti.CompatibleSystems.PolarizedSystem.multiplier — ACTIVE FRAGMENT
  The rank-one character system ℳ of G_F⁺, including μ(c_v).
* TauCeti.CompatibleSystems.PolarizedSystem.pairing — ACTIVE FRAGMENT
  The perfect representation-level pairing from G7, for each λ and real place v.
* TauCeti.CompatibleSystems.PolarizedSystem.IsTotallyOdd — ACTIVE FRAGMENT
  All pairing signs ε_v are +1; for CM this requires μ(c_v)=−1.
* TauCeti.CompatibleSystems.PolarizedSystem.conjugateDual — ACTIVE FRAGMENT
  Each r_λ^c is isomorphic to r_λ∨⊗μ_λ|G_F, with the specified pairing.

Supplier routes: PotentialModularityAndCompatibleSystems:R24.5/weakly-compatible-system-rank-n; ArithmeticGaloisRepresentations:G7

* test polarized_cm_unit — EXAMPLE FRAGMENT
* test polarized_rank_two — EXAMPLE FRAGMENT
* test polarized_multiplier_wrong — EXAMPLE FRAGMENT
* test polarized_forget_pairing — EXAMPLE FRAGMENT

### Operations on polarized systems
Packet node: PotentialModularityAndCompatibleSystems:R24.5/polarized-operations

* TauCeti.CompatibleSystems.PolarizedSystem.tensor — ACTIVE FRAGMENT
  Tensor pairings and multiplier μμ′δ; signs multiply.
* TauCeti.CompatibleSystems.PolarizedSystem.dual — ACTIVE FRAGMENT
  Dual perfect pairings and inverse multiplier.
* TauCeti.CompatibleSystems.PolarizedSystem.twist — ACTIVE FRAGMENT
  Twist by χ with norm-character multiplier correction.
* TauCeti.CompatibleSystems.PolarizedSystem.power — ACTIVE FRAGMENT
  Symmetric/exterior k-th pairing with μ^kδ^(k−1) and ε^k.
* TauCeti.CompatibleSystems.PolarizedSystem.tensor_isTotallyOdd — ACTIVE FRAGMENT
  Two totally odd CM systems yield a totally odd normalized tensor system.

Supplier routes: PotentialModularityAndCompatibleSystems:R24.5/polarized-system; PotentialModularityAndCompatibleSystems:R24.5/linear-algebra-operations-on-systems; ArithmeticGaloisRepresentations:G7

* test polarized_tensor_sign — EXAMPLE FRAGMENT
* test polarized_dual_sign — EXAMPLE FRAGMENT
* test polarized_unit_tensor — EXAMPLE FRAGMENT
* test polarized_sum_mismatch — EXAMPLE FRAGMENT

### Compatible systems of algebraic Hecke characters
Packet node: PotentialModularityAndCompatibleSystems:R24.5/character-system

* TauCeti.CompatibleSystems.characterSystem — OMITTED FULL SIGNATURE
  Assemble the common-field rank-one family from the owner’s algebraic Hecke character realizations.
* TauCeti.CompatibleSystems.characterSystem_hodge — OMITTED FULL SIGNATURE
  H_τ={a_τ} for connected-infinity exponent −a_τ.
* TauCeti.CompatibleSystems.characterSystem_frob — OMITTED FULL SIGNATURE
  The common linear polynomial matches the geometric Frobenius value with the chosen Artin convention.
* TauCeti.CompatibleSystems.characterSystem_unique — OMITTED FULL SIGNATURE
  Unique up to memberwise representation isomorphism from good Frobenius polynomials.

Supplier routes: tauceti:TauCetiRoadmap/GlobalNumberFields#layer-9-hecke-and-ray-class-characters; tauceti:TauCetiRoadmap/GlobalNumberFields#layer-10-archimedean-characters-infinity-types-and-cyclotomic-arithmetic; PotentialModularityAndCompatibleSystems:R24.5/weakly-compatible-system-rank-n; ArithmeticGaloisRepresentations:R01.1; tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity

* test character_trivial — EXAMPLE FRAGMENT
* test character_cyclotomic — EXAMPLE FRAGMENT
* test character_finite_order — EXAMPLE FRAGMENT
* test character_non_algebraic — EXAMPLE FRAGMENT

### Purity of character systems
Packet node: PotentialModularityAndCompatibleSystems:R24.5/rank-one-purity

* TauCeti.CompatibleSystems.rank_one_purity — OMITTED FULL SIGNATURE
  Every rank-one weakly compatible system is pure of an integer weight w. More generally the same conclusion holds for rank-one extremely weak data of ACC+ §7.1: actual semisimple members with common linear good Frobenius polynomials and the determinant Hodge condition at every λ. Algebraic character classification gives one integer w with a_{cτ}+a_τ=w and |ιr(Frob_v)|²=q_v^w for every good v and complex embedding. The algebraic Hecke-character realization supplies pure local WD parameters as well. This does not assert purity for arbitrary continuous nonalgebraic character data.

Supplier routes: PotentialModularityAndCompatibleSystems:R24.5/character-system; PotentialModularityAndCompatibleSystems:R24.5/compatible-system-predicates; PotentialModularityAndCompatibleSystems:R24.5/weakened-compatible-data; tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity

### Purity of systems induced from characters
Packet node: PotentialModularityAndCompatibleSystems:R24.5/induced-character-purity

* TauCeti.CompatibleSystems.induced_character_purity — ACTIVE FRAGMENT
  For a finite extension F′/F and a pure rank-one character system ℭ/F′ of weight w, Ind_F′^F ℭ with canonical induced Hodge multiset H_τ=⊔_{σ|τ}H_σ is a pure system of weight w after adjoining ramified primes to S. This also applies to induction of rank-one extremely weak character data when H is the transported character Hodge data. At a good v the eigenvalues in each residue-degree-f block satisfy β^f=α_w with |ια_w|²=q_w^w=(q_v^f)^w, hence |ιβ|²=q_v^w. It is not a regularity or irreducibility theorem. No purity claim is made for arbitrary freely chosen higher-rank Hodge metadata with only the correct determinant sum.

Supplier routes: PotentialModularityAndCompatibleSystems:R24.5/rank-one-purity; PotentialModularityAndCompatibleSystems:R24.5/system-operations; PotentialModularityAndCompatibleSystems:R24.5/weakened-compatible-data

### Compatible systems of Artin representations
Packet node: PotentialModularityAndCompatibleSystems:R24.5/artin-system

* TauCeti.CompatibleSystems.artinSystem — ACTIVE FRAGMENT
  Extend the given finite-quotient number-field representation to every coefficient place.
* TauCeti.CompatibleSystems.artinSystem_hodge — ACTIVE FRAGMENT
  H_τ is n copies of zero.
* TauCeti.CompatibleSystems.artinSystem_charpoly — ACTIVE FRAGMENT
  Q_v is the characteristic polynomial of the finite quotient Frobenius element.
* TauCeti.CompatibleSystems.artinSystem_pure — ACTIVE FRAGMENT
  The Artin family is pure of weight 0 with finite-monodromy local WD data.

Supplier routes: PotentialModularityAndCompatibleSystems:R24.5/weakly-compatible-system-rank-n; ArithmeticGaloisRepresentations:R01.1; ArithmeticGaloisRepresentations:G7; PadicHodgeTheory:R06.2; mathlib:Representation; mathlib:LinearMap.charpoly

* test artin_trivial — EXAMPLE FRAGMENT
* test artin_quadratic — EXAMPLE FRAGMENT
* test artin_rank_two_irregular — EXAMPLE FRAGMENT
* test artin_roots_unity — EXAMPLE FRAGMENT

### Purity of Artin systems up to twist
Packet node: PotentialModularityAndCompatibleSystems:R24.5/artin-twist-purity

* TauCeti.CompatibleSystems.artin_twist_purity — ACTIVE FRAGMENT
  If ℛ=𝒜⊗ℭ where 𝒜 is a rank-n Artin system and ℭ a rank-one algebraic character system of weight w, with H_τ the canonical n copies of the character Hodge number, then ℛ is pure of weight w. Every good eigenvalue is ζα with ζ a root of unity and α the character Frobenius value. For rank-two extremely weak systems that are Artin up to twist in the ACC+ sense, use the actual character twist and canonical Hodge data (or a very weak realization) to obtain this statement; merely choosing arbitrary higher-rank Hodge multisets of the same determinant sum does not imply Hodge purity.

Supplier routes: PotentialModularityAndCompatibleSystems:R24.5/artin-system; PotentialModularityAndCompatibleSystems:R24.5/rank-one-purity; PotentialModularityAndCompatibleSystems:R24.5/linear-algebra-operations-on-systems; PotentialModularityAndCompatibleSystems:R24.5/weakened-compatible-data

### Very weak and extremely weak compatible data
Packet node: PotentialModularityAndCompatibleSystems:R24.5/weakened-compatible-data

* TauCeti.CompatibleSystems.ExtremelyWeaklyCompatibleSystem — ACTIVE FRAGMENT
  The common Q, members and H with determinant-Hodge condition only.
* TauCeti.CompatibleSystems.VeryWeaklyCompatibleSystem — ACTIVE FRAGMENT
  Extremely weak data with density-one crystallinity and full labeled Hodge comparisons.
* TauCeti.CompatibleSystems.WeaklyCompatibleSystem.toVeryWeak — ACTIVE FRAGMENT
  Forget the all-λ de Rham/full Hodge requirement to the density-one one.
* TauCeti.CompatibleSystems.VeryWeaklyCompatibleSystem.toExtremelyWeak — ACTIVE FRAGMENT
  Forget the density-one full-member condition, retaining determinant Hodge comparison.
* TauCeti.CompatibleSystems.ExtremelyWeaklyCompatibleSystem.hodgeSum — ACTIVE FRAGMENT
  At every λ, the determinant labeled Hodge number equals Σ H_τ.

Supplier routes: PotentialModularityAndCompatibleSystems:R24.5/weakly-compatible-system-rank-n; ArithmeticGaloisRepresentations:R01.1; PadicHodgeTheory:R06.2

* test weakening_rank_one — EXAMPLE FRAGMENT
* test weakening_higher_rank_metadata — EXAMPLE FRAGMENT
* test weakening_hodge_purity_not_sum — EXAMPLE FRAGMENT
* test weakening_transitive — EXAMPLE FRAGMENT

No `def _ : Prop := sorry` or unstatable-condition field is introduced.
-/
