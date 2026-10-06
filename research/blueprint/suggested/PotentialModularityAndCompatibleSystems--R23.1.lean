import TauCeti.AlgebraicGeometry.LineBundle.Class
import Mathlib.AlgebraicGeometry.Modules.Sheaf
import Mathlib.AlgebraicGeometry.Morphisms.Finite
import Mathlib.AlgebraicGeometry.Morphisms.ClosedImmersion
import Mathlib.FieldTheory.LinearDisjoint
import Mathlib.FieldTheory.IsAlgClosed.AlgebraicClosure
import Mathlib.RingTheory.IntegralClosure.IntegralRestrict
import Mathlib.NumberTheory.NumberField.InfinitePlace.TotallyRealComplex
import Mathlib.LinearAlgebra.Matrix.GeneralLinearGroup.Defs
import Mathlib.RingTheory.KrullDimension.Basic
import Mathlib.Tactic

/-!
This file is not the roadmap and is not exhaustive. The roadmap document
`PotentialModularityAndCompatibleSystems--R23.1.md` is definitive. These forms suggest
names and signatures so that contributors and reviewers can converge on an interface.
Every new item is unchecked. Mathlib is pinned at 082e2d3, Tau Ceti at f790474.

Omissions are explicit, rather than arbitrary proposition fields. The all-places/completion
identification, analytic topology, smoothness and geometric irreducibility conditions of
Skolem data must come from the suppliers in the packet. `IntegralPoint` below uses the
normalization/field description; the comparison with an irreducible closed subscheme,
and finiteness of normalization over the arithmetic base, are omitted.

The Picard prototype is the objectwise rigidified quotient, using the existing invertible
sheaves and line-bundle classes. Its group signature and quotient descent are included,
but their relation to tensor/dual operations and relative pullback still needs suppliers.
Relative functoriality, sheafification, degree components,
Cartier divisors and scheme representability are omitted. The divisor arguments expose the
supplier's line bundle and boundary trivialization; they do not define Cartier divisors.

Hilbert eigenforms, automorphic representations, local deformation problems and their
universal rings are not available in the required form. The field-selection and Galois
signatures omit automorphic witnesses and local-type conditions; the finiteness signatures
omit the deformation-problem hypotheses. None is a complete statement of those theorems.
The packet and reader give their complete mathematical statements. In particular a `sorry`
on such a reduced signature must not be interpreted as an unconditional theorem about
an arbitrary ring or representation.

Independent review REV-PotentialModularityAndCompatibleSystems--R23.1 attempted the
complete file with lean-check on 2026-10-06. Elaboration stopped at the first import:
the shared build lacks TauCeti.AlgebraicGeometry.LineBundle.Class.olean. The earlier
author reported checking a Mathlib-only arithmetic fragment; this review did not
reproduce that check and does not certify this file or any fragment as elaborated.
-/

open CategoryTheory AlgebraicGeometry
open TauCeti.AlgebraicGeometry
open scoped TensorProduct
universe u
noncomputable section

namespace TauCeti.PotentialModularity

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

abbrev GL2 (k : Type u) [CommRing k] := Matrix.GeneralLinearGroup (Fin 2) k
abbrev GaloisGroup (F : Type u) [Field F] := AlgebraicClosure F ≃ₐ[F] AlgebraicClosure F

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

namespace TauCeti.CompatibleSystems
open PotentialModularity

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

end TauCeti.CompatibleSystems
