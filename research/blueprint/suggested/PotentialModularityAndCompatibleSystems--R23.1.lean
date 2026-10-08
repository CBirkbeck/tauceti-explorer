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
import Mathlib.RingTheory.DiscreteValuationRing.Basic
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
universal rings are not available in the required form. Their full theorem names are
reserved in omission comments with node IDs and supplier requirements. No missing hypothesis
is replaced by an arbitrary proposition or an unconditional theorem with a false conclusion.
The algebraic characteristic-zero-point sketches retain the actual DVR, fraction-field,
finite local algebra and local-map hypotheses and reuse the R03.4 supplier.
All 36 API names and 22 test names are accounted for below, including named omissions.
The examples cover only the stated reduced objectwise or arithmetic fragment; the reader
specifies the full geometric and automorphic tests. Compilation results for this revision
are recorded in the handoff; no whole-file compilation is claimed here.
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

/- Omitted declaration: TauCeti.PotentialModularity.divisorClassMap_affineFibration.
Packet node: PotentialModularityAndCompatibleSystems:R23.1/generalized-picard-functor-and-effective-divisor-fibration.
MB II Lemma 3.6, p. 189. Requires the actual effective-divisor scheme, degree component, relative curve and boundary, and Riemann–Roch/base-change hypotheses from SF.3/R09.3; arbitrary sets of divisors have no affine-fibration conclusion.
The complete mathematical contract is in the packet and reader. -/

/- Omitted declaration: TauCeti.PotentialModularity.omegaDivisors_open.
Packet node: PotentialModularityAndCompatibleSystems:R23.1/generalized-picard-functor-and-effective-divisor-fibration.
MB II Lemma 3.3, p. 187. Requires the etale symmetric power and locally split divisor locus constructed from nonempty analytic opens; an arbitrary Omega may be empty.
The complete mathematical contract is in the packet and reader. -/

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
/- Omitted declaration: TauCeti.PotentialModularity.TaylorAuxiliaryData.exists.
Packet node: PotentialModularityAndCompatibleSystems:R23.2/taylor-auxiliary-data-p-L-psi-N-M.
Taylor printed pp. 7–9 and 2006 pp. 776–777. Requires actual global/local fields, CM splitting, coefficient primes, character construction and the simultaneous prime/quadratic/coefficient-field choice. Arbitrary G or D may be trivial.
The complete mathematical contract is in the packet and reader. -/
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
/- Omitted API: TauCeti.PotentialModularity.TaylorAuxiliaryData.split.
Packet node: PotentialModularityAndCompatibleSystems:R23.2/taylor-auxiliary-data-p-L-psi-N-M.
Requires selected l- and p-adic places, L/F genuinely CM quadratic, and the actual
local splitting choices. The reduced structure cannot assert splitting over every Fv. -/
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

/-! Named R23 omissions. The missing supplier contracts are explicit; the complete
mathematical statements remain in the packet and reader. -/

/- Omitted declaration: TauCeti.PotentialModularity.moretBailly.
Packet node: PotentialModularityAndCompatibleSystems:R23.1/moret-bailly-theorem-incomplete-skolem-data-have-integral-points.
MB II Theorem 1.3, p. 181. Requires a full arithmetic/geometric Skolem datum; the reduced structure permits an empty scheme and cannot support existence.
The complete mathematical contract is in the packet and reader. -/

/- Omitted declaration: TauCeti.PotentialModularity.taylorTheoremG.
Packet node: PotentialModularityAndCompatibleSystems:R23.1/taylor-theorem-g-split-completely-points-are-dense.
Taylor Theorem G, printed pp. 4–5. Requires a number field, nonempty smooth geometrically irreducible quasi-projective X and nonempty local opens; an arbitrary scheme has no point-existence conclusion.
The complete mathematical contract is in the packet and reader. -/

/- Omitted declaration: TauCeti.PotentialModularity.chtCharacterExtension.
Packet node: PotentialModularityAndCompatibleSystems:R23.1/cht-character-extension.
CHT Lemma 4.1.1, pp. 116–117. Requires actual local/global Galois groups, finite-order continuous characters, a divisible characteristic-zero character target and reciprocity; arbitrary subgroup characters need not extend.
The complete mathematical contract is in the packet and reader. -/

/- Omitted declaration: TauCeti.PotentialModularity.chtSolublePrescribedCompletions.
Packet node: PotentialModularityAndCompatibleSystems:R23.1/cht-soluble-prescribed-completions.
CHT Lemma 4.1.2, p. 117. Requires selected places, prescribed finite local Galois extensions and their completion isomorphisms. A trivial-field witness would omit the central conclusion.
The complete mathematical contract is in the packet and reader. -/

/- Omitted declaration: TauCeti.PotentialModularity.moretBaillyThreeLocalConditions.
Packet node: PotentialModularityAndCompatibleSystems:R23.1/moret-bailly-three-local-conditions.
Qian Proposition 4.2. Requires number-field geometry and the S1/K_v, S2/K_v^nr and S3/Kbar_v local-open interfaces, plus their split/unramified conclusions.
The complete mathematical contract is in the packet and reader. -/

/- Omitted declaration: TauCeti.PotentialModularity.moretBaillyAbovePreliminaryField.
Packet node: PotentialModularityAndCompatibleSystems:R23.1/moret-bailly-over-a-preliminary-extension.
BLGHT Proposition 6.2, pp. 40–41. Requires finite preliminary/avoidance fields and a smooth geometrically irreducible nonempty variety, all local opens, and the quasi-projective/property adapters for Weil restriction.
The complete mathematical contract is in the packet and reader. -/

/- Omitted declaration: TauCeti.PotentialModularity.surjectiveSpecialisation.
Packet node: PotentialModularityAndCompatibleSystems:R23.1/surjective-specialisation-finite-quotient.
Bianchi Proposition 4.5.1, pp. 48–49. Requires the etale fundamental group, a point-induced specialization map, a geometrically connected finite cover and equivariant local CM data. An arbitrary specialization function cannot force surjectivity.
The complete mathematical contract is in the packet and reader. -/

/- Omitted declaration: TauCeti.PotentialModularity.fixedConstantField.
Packet node: PotentialModularityAndCompatibleSystems:R23.1/function-field-point-with-fixed-constants.
BHKT Proposition 9.2, pp. 77–78. Requires K=F_q(X) with precisely F_q as constants, the corrected Isom curve, nonconstant points and the coprime-degree split places.
The complete mathematical contract is in the packet and reader. -/

/-- Two coprime split-place degrees kill the constant-field extension. -/
example (constantDegree m n : ℕ) (hpos : 0 < constantDegree)
    (hm : constantDegree ∣ m) (hn : constantDegree ∣ n) (hcop : m.Coprime n) :
    constantDegree = 1 := by
  sorry

/- Omitted declaration: TauCeti.PotentialModularity.potentialGlobalGaloisLocalData.
Packet node: PotentialModularityAndCompatibleSystems:R23.1/potential-global-galois-local-data.
BHKT Theorem 9.3/MB90 and Calegari Proposition 3.2. Requires the appropriate global field and actual local Galois data; an arbitrary field need not realize a finite group after finite extension.
The complete mathematical contract is in the packet and reader. -/

/- Omitted declaration: TauCeti.PotentialModularity.kwPotentialResidual.
Packet node: PotentialModularityAndCompatibleSystems:R23.3/kw-ii-theorem-6-1-potential-modularity-of-rho-bar-over-a-controlled-F.
KW II Theorem 6.1, pp. 53–54. Requires the exact odd residual, determinant, local and dyadic hypotheses and both cuspidal modular witnesses, weights and image-preserving local field control.
The complete mathematical contract is in the packet and reader. -/

/- Omitted declaration: TauCeti.PotentialModularity.kwOrdinaryPotentialResidual.
Packet node: PotentialModularityAndCompatibleSystems:R23.3/kw-annals-theorem-2-1-taylor-potential-modularity-with-ordinarity.
KW Annals Theorem 2.1, pp. 234–237. Requires ordinarity and the weight exclusion, the H6 local-moduli input, Hida specialization and cuspidal witnesses.
The complete mathematical contract is in the packet and reader. -/

/- Omitted declaration: TauCeti.PotentialModularity.snowdenPotentialResidual.
Packet node: PotentialModularityAndCompatibleSystems:R23.3/snowden-totally-real-potential-residual-modularity.
Snowden 5.1.1/8.2.1, pp. 15/26. Requires p odd, a continuous odd residual representation, determinant lift, compatible definite types, stable avoidance and modular witnesses; uses the R22.5 odd-prime interface.
The complete mathematical contract is in the packet and reader. -/

/- Omitted declaration: TauCeti.PotentialModularity.bcgpPotentialResidual.
Packet node: PotentialModularityAndCompatibleSystems:R23.3/bcgp-controlled-residual-modularity.
BCGP Proposition 9.1.11, p. 458. Requires the representation over F1 and a q-ordinary weight-zero witness over F1F-prime, splitting above p,q and avoidance selected over F.
The complete mathematical contract is in the packet and reader. -/

/- Omitted declaration: TauCeti.PotentialModularity.taylorOrdinaryPotentialResidual.
Packet node: PotentialModularityAndCompatibleSystems:R23.3/taylor-theorem-1-6-potential-residual-modularity-ordinary-at-l.
Taylor Theorem 1.6, printed p. 15. Requires the stated ordinary local shape, image/determinant hypotheses and the actual cuspidal modular witness.
The complete mathematical contract is in the packet and reader. -/

/- Omitted declaration: TauCeti.PotentialModularity.taylorNiveauTwoPotentialResidual.
Packet node: PotentialModularityAndCompatibleSystems:R23.3/taylor-2006-potential-modularity-when-residually-irreducible-at-l.
Taylor Proposition 4.1. Requires the exact irreducible niveau-two local shape, weight and specified Weil–Deligne inertial characters, and even-degree split-field modular output.
The complete mathematical contract is in the packet and reader. -/

/- Omitted declaration: TauCeti.PotentialModularity.taylorSerreWeightPotentialResidual.
Packet node: PotentialModularityAndCompatibleSystems:R23.3/taylor-2006-theorem-5-7-serre-weight-at-level-one.
Taylor Theorem 5.7, pp. 767–768. Requires l>3, odd irreducible residual and irreducibility at l, and an everywhere-unramified cuspidal witness of Serre weight.
The complete mathematical contract is in the packet and reader. -/

/- Omitted declaration: TauCeti.PotentialModularity.auxiliaryModularityTransfer.
Packet node: PotentialModularityAndCompatibleSystems:R23.3/modularity-of-the-auxiliary-abelian-variety-transfers-to-rho-bar.
Requires the two torsion realizations, the auxiliary induced modularity theorem, the independent lifting theorem including the CM case, and the compatible Hilbert eigenform. A field-only witness is not this conclusion.
The complete mathematical contract is in the packet and reader. -/

/- Omitted declaration: TauCeti.PotentialModularity.quaternionicHeckeGaloisRealisation.
Packet node: PotentialModularityAndCompatibleSystems:R23.3/taylor-2006-lemma-1-3-quaternionic-forms-and-galois-representations.
Taylor Lemma 1.3. Requires the quaternionic Hecke eigensystem and non-Eisenstein hypotheses, not arbitrary trace/determinant functions.
The complete mathematical contract is in the packet and reader. -/

/- Omitted declaration: TauCeti.PotentialModularity.localResidualInertialShape.
Packet node: PotentialModularityAndCompatibleSystems:R23.3/taylor-2006-lemma-1-4-corollary-1-5-local-shape-at-l.
Taylor Lemma 1.4/Corollary 1.5. Requires the finite-flat/torsion Fontaine–Laffaille and full Hilbert crystallinity interfaces, and the precise inertia exponents; splitting only the determinant is insufficient.
The complete mathematical contract is in the packet and reader. -/

/- Omitted declaration: TauCeti.PotentialModularity.weightReductionHeckeSurjection.
Packet node: PotentialModularityAndCompatibleSystems:R23.3/taylor-2006-lemma-5-1-corollary-5-2-weight-reduction.
Taylor 5.1/5.2, pp. 765–766. Requires the actual localized quaternionic Hecke modules, U/V operators and coefficient Symm^i for weight i+2 (E10). Arbitrary rings admit no such surjection.
The complete mathematical contract is in the packet and reader. -/

/- Omitted declaration: TauCeti.PotentialModularity.weightAndLevelPotentialResidual.
Packet node: PotentialModularityAndCompatibleSystems:R23.3/taylor-2006-lemmas-5-4-5-6-weight-and-level.
Taylor 5.4–5.6. Requires the exact conductor/weight changes, niveau-two conditions, split field and cuspidal witness, with l>3 and the separate p=3 import.
The complete mathematical contract is in the packet and reader. -/

/- Omitted declaration: TauCeti.PotentialModularity.potentialModularityGivenLift.
Packet node: PotentialModularityAndCompatibleSystems:R23.4/potential-modularity-of-a-given-lift.
Requires the given continuous p-adic lift and its local types, residual modularity and the independent odd/dyadic lifting theorem, with an automorphic identification of that lift. It does not produce a lift.
The complete mathematical contract is in the packet and reader. -/

/- Omitted declaration: TauCeti.PotentialModularity.controlledExtension.
Packet node: PotentialModularityAndCompatibleSystems:R23.5/control-of-the-extension.
Requires selected places, prescribed local extensions, residual-image and cyclotomic irreducibility control, avoidance, and the admissible R17 soluble descent data.
The complete mathematical contract is in the packet and reader. -/

/- Omitted declaration: TauCeti.PotentialModularity.bcgpLocalData.
Packet node: PotentialModularityAndCompatibleSystems:R23.5/bcgp-local-galois-data-without-descent.
Corrected BCGP Proposition 9.1.12, p. 459. Requires number-field local data and finite-group specialization. Its cover is L-prime/K-prime with K-prime=KE-prime; there is no L/K descent.
The complete mathematical contract is in the packet and reader. -/

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
/- Omitted declaration: TauCeti.CompatibleSystems.AuxiliaryField.exists.
Packet node: PotentialModularityAndCompatibleSystems:R24.1/auxiliary-totally-real-field-for-the-finiteness-argument.
KW II 10.1, pp. 90–91. Requires residual-image control, local completion data, and genuine automorphic type-(A)/(B)/(C) witnesses with the dyadic weight guard.
The complete mathematical contract is in the packet and reader. -/
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

/- Omitted declaration: TauCeti.CompatibleSystems.kwGlobalFiniteness.
Packet node: PotentialModularityAndCompatibleSystems:R24.1/kw-ii-theorem-10-1-finiteness-of-the-unframed-global-ring.
KW II Theorem 10.1, pp. 90–92. Requires the exact unframed fixed-determinant KW global ring, its local conditions and residual modularity hypotheses; arbitrary O-algebras are not finite.
The complete mathematical contract is in the packet and reader. -/

/- Omitted declaration: TauCeti.CompatibleSystems.ordinaryGlobalFiniteness.
Packet node: PotentialModularityAndCompatibleSystems:R24.1/ordinary-global-ring-finiteness.
Thorne Theorem 10.2, pp. 56–58. Requires the polarized CM problem, adequate cyclotomic residual image, ordinary automorphic lift, fixed Hodge type and local ordinary rings, and the totally-real GL2 adapter.
The complete mathematical contract is in the packet and reader. -/

/- Omitted declaration: TauCeti.CompatibleSystems.cgRingFiniteness.
Packet node: PotentialModularityAndCompatibleSystems:R24.1/cg-ordinary-ring-finiteness.
CG Theorem 4.8 proof, author PDF pp. 66–68. Requires R_phi with its ordinary R-dagger and Frobenius-eigenvalue problem, and the exact Thorne/local-ring comparison; arbitrary algebras are not finite.
The complete mathematical contract is in the packet and reader. -/

/-- Algebraic extraction imported from R03.4, not a new supplier construction.
Finite local algebras need positive dimension, a DVR and its characteristic-zero fraction field.
The deformation data, continuity/residue adapter and p-adic integer identification are omitted. -/
theorem characteristicZeroPoint (O K R : Type u)
    [CommRing O] [IsDomain O] [IsDiscreteValuationRing O]
    [Field K] [CharZero K] [Algebra O K] [IsFractionRing O K]
    [CommRing R] [IsLocalRing R] [Algebra O R] [Module.Finite O R]
    [IsLocalHom (algebraMap O R)] (hdim : 1 ≤ ringKrullDim R) :
    ∃ E : IntermediateField K (AlgebraicClosure K), Module.Finite K E ∧
      (letI : Algebra O E := ((algebraMap K E).comp (algebraMap O K)).toAlgebra;
       Module.Finite O (integralClosure O E) ∧
         ∃ f : R →ₐ[O] integralClosure O E, IsLocalHom f.toRingHom) := by
  sorry

/-- Algebraic extraction imported from R03.4, not a new supplier construction.
NT applies this to its selected-component ring only after the dimension/finiteness inputs.
The deformation data, continuity/residue adapter and p-adic integer identification are omitted. -/
theorem newtonThornePoint (O K R : Type u)
    [CommRing O] [IsDomain O] [IsDiscreteValuationRing O]
    [Field K] [CharZero K] [Algebra O K] [IsFractionRing O K]
    [CommRing R] [IsLocalRing R] [Algebra O R] [Module.Finite O R]
    [IsLocalHom (algebraMap O R)] (hdim : 1 ≤ ringKrullDim R) :
    ∃ E : IntermediateField K (AlgebraicClosure K), Module.Finite K E ∧
      (letI : Algebra O E := ((algebraMap K E).comp (algebraMap O K)).toAlgebra;
       Module.Finite O (integralClosure O E) ∧
         ∃ f : R →ₐ[O] integralClosure O E, IsLocalHom f.toRingHom) := by
  sorry

/-- R24.2 non-example: a finite nonzero ring can have no characteristic-zero point. -/
example : ¬ Nonempty (ZMod 5 →+* ℚ) := by
  sorry

end TauCeti.CompatibleSystems
