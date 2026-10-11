import Mathlib.Algebra.Torsor.Defs
import Mathlib.GroupTheory.Coset.Basic
import Mathlib.GroupTheory.Perm.Fin
import Mathlib.Algebra.Algebra.Pi
import Mathlib.Algebra.Polynomial.Eval.Defs
import Mathlib.Algebra.DualNumber
import Mathlib.AlgebraicGeometry.Scheme
import Mathlib.CategoryTheory.Comma.Over.Basic
import Mathlib.LinearAlgebra.Dual.Lemmas

/-!
This file is not the roadmap and is not exhaustive. The roadmap document is definitive.
These statements suggest Lean forms so contributors and reviewers converge on names and
signatures. All theorem proofs below are admitted; elaboration claims no implementation.

NC.4 imports NC.2 geometric paths, NC.3 continuous nonabelian crystalline/Selmer functors,
L1 Coleman functions and ED.4 analytic zero bounds. Their complete native carriers are
unavailable at the pins. This file gives point, coordinate-algebra, scheme-morphism, set
and linear reductions on actual Mathlib objects. It never replaces a missing geometric
condition by an arbitrary proposition field. The reader and packet state the geometric
hypotheses, and the explicitly omitted signatures below are part of the supplier ledger.

A right U-torsor is a native left torsor for Uᵐᵒᵖ. U/H below is the left-coset carrier gH,
with right multiplication by H, even when H is nonnormal. It is not a quotient group.
Finite depth n means U/Γ_(n+1): Kim's U_(n+1), with n=1 the abelian depth.
-/

open CategoryTheory

namespace TauCeti.ChabautyKim

section TorsorPoints
variable {U P : Type*} [Group U] [Torsor Uᵐᵒᵖ P]

/-- Point reduction of the ratio pφ · u = pH. -/
def admissiblePeriod (H : Subgroup U) (pφ pH : P) : U ⧸ H :=
  QuotientGroup.mk (MulOpposite.unop (pH /ₛ pφ : Uᵐᵒᵖ))

lemma admissiblePeriod_eq_mk (H : Subgroup U) (pφ pH : P) (u : U)
    (hu : MulOpposite.op u • pφ = pH) :
    admissiblePeriod H pφ pH = (QuotientGroup.mk u : U ⧸ H) := by sorry

lemma admissiblePeriod_hodge_change (H : Subgroup U) (pφ pH : P) (h : H) :
    admissiblePeriod H pφ (MulOpposite.op (h : U) • pH) =
      admissiblePeriod H pφ pH := by sorry

lemma admissiblePeriod_eq_iff (H : Subgroup U) (pφ pH pH' : P) :
    admissiblePeriod H pφ pH = admissiblePeriod H pφ pH' ↔
      (MulOpposite.unop (pH /ₛ pφ : Uᵐᵒᵖ))⁻¹ *
        MulOpposite.unop (pH' /ₛ pφ : Uᵐᵒᵖ) ∈ H := by sorry

lemma admissiblePeriod_self (H : Subgroup U) (pφ : P) :
    admissiblePeriod H pφ pφ = (QuotientGroup.mk 1 : U ⧸ H) := by sorry

lemma admissiblePeriod_transport {P' : Type*} [Torsor Uᵐᵒᵖ P']
    (H : Subgroup U) (f : P ≃ P')
    (hf : ∀ (g : Uᵐᵒᵖ) (p : P), f (g • p) = g • f p) (pφ pH : P) :
    admissiblePeriod H (f pφ) (f pH) = admissiblePeriod H pφ pH := by sorry

-- admissiblePeriod_identity
example (H : Subgroup U) (g : U) :
    admissiblePeriod H (MulOpposite.op (1 : U)) (MulOpposite.op g) =
      (QuotientGroup.mk g : U ⧸ H) := by sorry

-- admissiblePeriod_right_change
example (H : Subgroup U) (g : U) (h : H) :
    admissiblePeriod H (MulOpposite.op (1 : U)) (MulOpposite.op (g * h)) =
      admissiblePeriod H (MulOpposite.op (1 : U)) (MulOpposite.op g) := by sorry

-- admissiblePeriod_left_change_fails: H=<swap(0,1)> is nonnormal in S₃.
example :
    let h : Equiv.Perm (Fin 3) := Equiv.swap 0 1
    let g : Equiv.Perm (Fin 3) := Equiv.swap 1 2
    let H := Subgroup.closure ({h} : Set (Equiv.Perm (Fin 3)))
    admissiblePeriod H (MulOpposite.op (1 : Equiv.Perm (Fin 3)))
        (MulOpposite.op (h * g)) ≠
      admissiblePeriod H (MulOpposite.op (1 : Equiv.Perm (Fin 3)))
        (MulOpposite.op g) := by sorry

/-- Point-family reduction; the geometric family itself is imported from NC.2. -/
def localAlbanese {Y : Type*} (H : Subgroup U) (P : Y → Type*)
    [∀ y, Torsor Uᵐᵒᵖ (P y)] (pφ pH : ∀ y, P y) : Y → U ⧸ H :=
  fun y => admissiblePeriod H (pφ y) (pH y)

lemma localAlbanese_apply {Y : Type*} (H : Subgroup U) (P : Y → Type*)
    [∀ y, Torsor Uᵐᵒᵖ (P y)] (pφ pH : ∀ y, P y) (y : Y) :
    localAlbanese H P pφ pH y = admissiblePeriod H (pφ y) (pH y) := by sorry

lemma localAlbanese_base {Y : Type*} (H : Subgroup U) (P : Y → Type*)
    [∀ y, Torsor Uᵐᵒᵖ (P y)] (pφ pH : ∀ y, P y) (b : Y) (hb : pH b = pφ b) :
    localAlbanese H P pφ pH b = (QuotientGroup.mk 1 : U ⧸ H) := by sorry

lemma localAlbanese_reindex {Y Z : Type*} (H : Subgroup U) (P : Y → Type*)
    [t : ∀ y, Torsor Uᵐᵒᵖ (P y)] (pφ pH : ∀ y, P y) (f : Z → Y) :
    letI : ∀ z, Torsor Uᵐᵒᵖ ((P ∘ f) z) := fun z => t (f z)
    localAlbanese H (P ∘ f) (fun z => pφ (f z)) (fun z => pH (f z)) =
      localAlbanese H P pφ pH ∘ f := by sorry

lemma localAlbanese_hodge_change {Y : Type*} (H : Subgroup U) (P : Y → Type*)
    [∀ y, Torsor Uᵐᵒᵖ (P y)] (pφ pH : ∀ y, P y) (h : Y → H) :
    localAlbanese H P pφ (fun y => MulOpposite.op (h y : U) • pH y) =
      localAlbanese H P pφ pH := by sorry

-- Point reduction on actual equivariant torsor maps and their induced coset map.
-- The full schematic central-quotient construction is imported, not inferred here.
lemma localAlbanese_tower {V Y : Type*} [Group V] (H : Subgroup U) (J : Subgroup V)
    (P : Y → Type*) (P' : Y → Type*)
    [∀ y, Torsor Uᵐᵒᵖ (P y)] [∀ y, Torsor Vᵐᵒᵖ (P' y)]
    (f : U →* V) (F : ∀ y, P y → P' y) (q : U ⧸ H → V ⧸ J)
    (hq : ∀ u, q (QuotientGroup.mk u) = (QuotientGroup.mk (f u) : V ⧸ J))
    (hF : ∀ y (u : U) (p : P y),
      F y (MulOpposite.op u • p) = MulOpposite.op (f u) • F y p)
    (pφ pH : ∀ y, P y) (pφ' pH' : ∀ y, P' y)
    (hφ : ∀ y, F y (pφ y) = pφ' y) (hH : ∀ y, F y (pH y) = pH' y) :
    q ∘ localAlbanese H P pφ pH = localAlbanese J P' pφ' pH' := by sorry

-- localAlbanese_self_family
example {Y : Type*} (H : Subgroup U) (P : Y → Type*)
    [∀ y, Torsor Uᵐᵒᵖ (P y)] (pφ : ∀ y, P y) :
    localAlbanese H P pφ pφ = fun _ => (QuotientGroup.mk 1 : U ⧸ H) := by sorry

-- localAlbanese_trivial_hodge
example (g : U) :
    localAlbanese (⊥ : Subgroup U) (fun _ : U => Uᵐᵒᵖ)
        (fun _ => MulOpposite.op 1) MulOpposite.op g =
      (QuotientGroup.mk g : U ⧸ (⊥ : Subgroup U)) := by sorry

-- localAlbanese_fibre_change
example {Y : Type*} (H : Subgroup U) (g : Y → U) (h : Y → H) :
    localAlbanese H (fun _ : Y => Uᵐᵒᵖ) (fun _ => MulOpposite.op 1)
        (fun y => MulOpposite.op (g y * h y)) =
      localAlbanese H (fun _ : Y => Uᵐᵒᵖ) (fun _ => MulOpposite.op 1)
        (fun y => MulOpposite.op (g y)) := by sorry
end TorsorPoints

/-!
Omitted geometric targets admissible_classification, iterated_coordinates and
residue_disc_density: full normalized filtered/Frobenius torsors and Coleman/word
geometric evaluation are imported from NC.2/L1, not available as native carriers.
Classification is natural on every commutative K-algebra; density is separately on
every integral K-disc in Q_n, not asserted in its Q_p-Weil restriction. The forward
word element I has period representative I⁻¹γ in the ordered-ratio convention.
-/

section AffinePoints
variable {K A B R R' : Type*} [CommRing K] [CommRing A] [CommRing B]
  [CommRing R] [CommRing R'] [Algebra K A] [Algebra K B]
  [Algebra K R] [Algebra K R']

/-- Coordinate-point reduction of an already represented period morphism. -/
def crystallinePeriodMap (dStar : A →ₐ[K] B) (c : B →ₐ[K] R) : A →ₐ[K] R :=
  c.comp dStar

lemma crystallinePeriodMap_apply (dStar : A →ₐ[K] B) (c : B →ₐ[K] R) (a : A) :
    crystallinePeriodMap dStar c a = c (dStar a) := by sorry

lemma crystallinePeriodMap_coeff (dStar : A →ₐ[K] B) (c : B →ₐ[K] R)
    (α : R →ₐ[K] R') :
    α.comp (crystallinePeriodMap dStar c) = crystallinePeriodMap dStar (α.comp c) :=
  by sorry

lemma crystallinePeriodMap_neutral (dStar : A →ₐ[K] B)
    (εB : B →ₐ[K] K) (εA : A →ₐ[K] K) (hε : εB.comp dStar = εA) :
    crystallinePeriodMap dStar εB = εA := by sorry

lemma crystallinePeriodMap_tower {A' B' : Type*} [CommRing A'] [CommRing B']
    [Algebra K A'] [Algebra K B'] (dStar : A →ₐ[K] B) (dStar' : A' →ₐ[K] B')
    (qA : A' →ₐ[K] A) (qB : B' →ₐ[K] B)
    (h : dStar.comp qA = qB.comp dStar') (c : B →ₐ[K] R) :
    (crystallinePeriodMap dStar c).comp qA =
      crystallinePeriodMap dStar' (c.comp qB) := by sorry

-- The universal point c=id_B is already sufficient to detect equality of d*.
lemma crystallinePeriodMap_ext (dStar dStar' : A →ₐ[K] B)
    (h : crystallinePeriodMap dStar (AlgHom.id K B) =
      crystallinePeriodMap dStar' (AlgHom.id K B)) : dStar = dStar' := by sorry

-- crystallinePeriodMap_identity
example (c : A →ₐ[K] R) : crystallinePeriodMap (AlgHom.id K A) c = c := by sorry

-- crystallinePeriodMap_universal
example (dStar : A →ₐ[K] B) :
    crystallinePeriodMap dStar (AlgHom.id K B) = dStar := by sorry

-- crystallinePeriodMap_dual_numbers: retained infinitesimal point, not its reduction.
example :
    let c : Polynomial ℚ →ₐ[ℚ] DualNumber ℚ := Polynomial.aeval DualNumber.eps
    crystallinePeriodMap (AlgHom.id ℚ (Polynomial ℚ)) c Polynomial.X =
      DualNumber.eps ∧ (DualNumber.eps : DualNumber ℚ) ≠ 0 := by sorry
end AffinePoints

/-!
Omitted localEtaleAlbanese and globalEtaleAlbanese definitions: native continuous G_K
and G_(F,T) path-torsor gauge classes with the B_cr condition and all chosen bad-place
conditions are supplied by NC.2/NC.3; this file does not restate cohomology.

localEtaleAlbanese_path: class of the actual right geometric path from b to x.
localEtaleAlbanese_base: the constant fixed path gives the neutral class.
localEtaleAlbanese_path_change: arbitrary path change preserves its full gauge orbit.
localEtaleAlbanese_tower: genuine central quotient gives the lower-depth class.
Omitted examples localEtaleAlbanese_base_test, localEtaleAlbanese_kummer_test,
localEtaleAlbanese_gauge_test respectively test the fixed identity path, rational
V_pJ Kummer class of AJ_b(x) at depth one, and arbitrary (not just G_K-fixed) gauge a.

globalEtaleAlbanese_path: class of the global geometric path from b to x.
globalEtaleAlbanese_base: neutral if admitted by every chosen local condition.
globalEtaleAlbanese_localize: local class of the same x and same b at the good place.
globalEtaleAlbanese_tower: the corresponding lower-depth global class.
globalEtaleAlbanese_conditions: every localized class meets its exact local subset.
Omitted examples globalEtaleAlbanese_base_test, globalEtaleAlbanese_kummer_test,
globalEtaleAlbanese_local_test test respectively the fixed global identity, rational
Tate-module Kummer class, and its actual local crystalline class. Their full geometric
signatures are omitted rather than replaced by an arbitrary set of accepted points.
-/

section RepresentedMorphisms
variable {Base : AlgebraicGeometry.Scheme}
  {B S L Q S' L' Q' C : Over Base}

/-- Represented Selmer localization followed by a represented crystalline period. -/
def selmerPeriod (loc : S ⟶ L) (D : L ⟶ Q) : S ⟶ Q := loc ≫ D

lemma selmerPeriod_def (loc : S ⟶ L) (D : L ⟶ Q) :
    selmerPeriod loc D = loc ≫ D := by sorry

lemma selmerPeriod_point (loc : S ⟶ L) (D : L ⟶ Q) (s : B ⟶ S) :
    s ≫ selmerPeriod loc D = (s ≫ loc) ≫ D := by sorry

lemma selmerPeriod_precompose (loc : S ⟶ L) (D : L ⟶ Q) (s : B ⟶ S) (f : C ⟶ B) :
    (f ≫ s) ≫ selmerPeriod loc D = f ≫ (s ≫ selmerPeriod loc D) := by sorry

lemma selmerPeriod_tower (loc : S ⟶ L) (D : L ⟶ Q)
    (loc' : S' ⟶ L') (D' : L' ⟶ Q') (qS : S ⟶ S') (qL : L ⟶ L') (qQ : Q ⟶ Q')
    (hloc : loc ≫ qL = qS ≫ loc') (hD : D ≫ qQ = qL ≫ D') :
    selmerPeriod loc D ≫ qQ = qS ≫ selmerPeriod loc' D' := by sorry

lemma selmerPeriod_neutral (loc : S ⟶ L) (D : L ⟶ Q)
    (eS : B ⟶ S) (eL : B ⟶ L) (eQ : B ⟶ Q)
    (hloc : eS ≫ loc = eL) (hD : eL ≫ D = eQ) :
    eS ≫ selmerPeriod loc D = eQ := by sorry

-- selmerPeriod_identity_local
example (loc : S ⟶ L) : selmerPeriod loc (𝟙 L) = loc := by sorry
-- selmerPeriod_identity_global
example (D : L ⟶ Q) : selmerPeriod (𝟙 L) D = D := by sorry
-- selmerPeriod_point_associativity
example (loc : S ⟶ L) (D : L ⟶ Q) (s : B ⟶ S) :
    s ≫ selmerPeriod loc D = (s ≫ loc) ≫ D := by sorry

-- The geometric base is Spec Q_p. Over Base retains the supplied structure maps and
-- their commutativity; composition is between schemes over that same actual base.
end RepresentedMorphisms

section PointLoci
variable {Y X S L Q Sm Lm Qm : Type*}

def crystallineLocus (jet : Y → L) (loc : S → L) : Set Y := jet ⁻¹' Set.range loc

def deRhamLocus (j : Y → Q) (ell : S → Q) : Set Y := j ⁻¹' Set.range ell

-- Z is the supplied rational point subset of the geometric image closure. This
-- definition alone neither computes that closure nor turns it into a rational image.
def closedDeRhamLocus (j : Y → Q) (Z : Set Q) : Set Y := j ⁻¹' Z

lemma crystallineLocus_mem (jet : Y → L) (loc : S → L) (y : Y) :
    y ∈ crystallineLocus jet loc ↔ ∃ s, loc s = jet y := by sorry

lemma deRhamLocus_mem (j : Y → Q) (ell : S → Q) (y : Y) :
    y ∈ deRhamLocus j ell ↔ ∃ s, ell s = j y := by sorry

lemma closedDeRhamLocus_mem (j : Y → Q) (Z : Set Q) (y : Y) :
    y ∈ closedDeRhamLocus j Z ↔ j y ∈ Z := by sorry

lemma kimLoci_inclusions (jet : Y → L) (loc : S → L) (D : L → Q)
    (j : Y → Q) (Z : Set Q) (hj : D ∘ jet = j) (hZ : Set.range (D ∘ loc) ⊆ Z) :
    crystallineLocus jet loc ⊆ deRhamLocus j (D ∘ loc) ∧
      deRhamLocus j (D ∘ loc) ⊆ closedDeRhamLocus j Z := by sorry

lemma deRhamLocus_mono {S' : Type*} (j : Y → Q) (ell : S → Q) (ell' : S' → Q)
    (h : Set.range ell ⊆ Set.range ell') :
    deRhamLocus j ell ⊆ deRhamLocus j ell' := by sorry

lemma kimLoci_ext (jet jet' : Y → L) (j j' : Y → Q) (loc loc' : S → L)
    (ell ell' : S → Q) (Z Z' : Set Q)
    (hjet : jet = jet') (hj : j = j') (hloc : Set.range loc = Set.range loc')
    (hell : Set.range ell = Set.range ell') (hZ : Z = Z') :
    crystallineLocus jet loc = crystallineLocus jet' loc' ∧
      deRhamLocus j ell = deRhamLocus j' ell' ∧
      closedDeRhamLocus j Z = closedDeRhamLocus j' Z' := by sorry

-- kimLoci_identity
example (j : Y → Q) : deRhamLocus j (id : Q → Q) = Set.univ := by sorry
-- kimLoci_empty_source
example (j : Y → Q) (ell : Empty → Q) : deRhamLocus j ell = ∅ := by sorry
-- kimLoci_square_image: the supplied Z=univ is correct for the geometric square map;
-- proving that geometric density is omitted pending the native image-closure bridge.
example :
    (-1 : ℚ) ∉ deRhamLocus id (fun u : ℚ => u ^ 2) ∧
      (-1 : ℚ) ∈ closedDeRhamLocus id (Set.univ : Set ℚ) := by sorry

/-- Point consequence of the global-to-local path square and local period triangle. -/
theorem fundamental_diagram (i : X → Y) (glob : X → S) (loc : S → L)
    (jet : Y → L) (D : L → Q) (j : Y → Q)
    (hglobal : loc ∘ glob = jet ∘ i) (hlocal : D ∘ jet = j) :
    (D ∘ loc) ∘ glob = j ∘ i := by sorry

/-- Witness projection gives the decreasing tower for the point-image loci. -/
theorem locus_compatibilities (j : Y → Q) (ell : S → Q) (jm : Y → Qm)
    (ellm : Sm → Qm) (qS : S → Sm) (qQ : Q → Qm)
    (hj : qQ ∘ j = jm) (hell : qQ ∘ ell = ellm ∘ qS) :
    deRhamLocus j ell ⊆ deRhamLocus jm ellm := by sorry

-- The geometric closed-image projection, condition-change and D-injective variants
-- are stated in the reader; geometric signatures are omitted. The expressible
-- injective-D point consequence is included separately.
lemma crystallineLocus_eq_deRhamLocus (jet : Y → L) (loc : S → L)
    (D : L → Q) (hD : Function.Injective D) :
    crystallineLocus jet loc = deRhamLocus (D ∘ jet) (D ∘ loc) := by sorry

theorem rational_integral_containment (i : X → Y) (glob : X → S)
    (jet : Y → L) (loc : S → L) (D : L → Q) (j : Y → Q) (Z : Set Q)
    (hglobal : loc ∘ glob = jet ∘ i) (hlocal : D ∘ jet = j)
    (hZ : Set.range (D ∘ loc) ⊆ Z) :
    Set.range i ⊆ crystallineLocus jet loc ∧
      crystallineLocus jet loc ⊆ deRhamLocus j (D ∘ loc) ∧
      deRhamLocus j (D ∘ loc) ⊆ closedDeRhamLocus j Z := by sorry

lemma global_finite_of_local_locus_finite (i : X → Y) (C : Set Y)
    (hi : Function.Injective i) (hC : C.Finite) (h : Set.range i ⊆ C) :
    (Set.univ : Set X).Finite := by sorry
end PointLoci

section RegularEvaluation
variable {K A Y Z : Type*} [CommRing K] [CommRing A] [Algebra K A]

/-- Pullback by actual affine K-points, retaining multiplication and constants. -/
def regularAlbanesePullback (j : Y → (A →ₐ[K] K)) : A →ₐ[K] (Y → K) where
  toFun f y := j y f
  map_zero' := by sorry
  map_one' := by sorry
  map_add' := by sorry
  map_mul' := by sorry
  commutes' := by sorry

lemma regularAlbanesePullback_apply (j : Y → (A →ₐ[K] K)) (f : A) (y : Y) :
    regularAlbanesePullback j f y = j y f := by sorry
lemma regularAlbanesePullback_add (j : Y → (A →ₐ[K] K)) (f g : A) :
    regularAlbanesePullback j (f + g) =
      regularAlbanesePullback j f + regularAlbanesePullback j g := by sorry
lemma regularAlbanesePullback_mul (j : Y → (A →ₐ[K] K)) (f g : A) :
    regularAlbanesePullback j (f * g) =
      regularAlbanesePullback j f * regularAlbanesePullback j g := by sorry
lemma regularAlbanesePullback_const (j : Y → (A →ₐ[K] K)) (r : K) :
    regularAlbanesePullback j (algebraMap K A r) = fun _ => r := by sorry
lemma regularAlbanesePullback_reindex (j : Y → (A →ₐ[K] K)) (g : Z → Y) (f : A) :
    regularAlbanesePullback (j ∘ g) f = regularAlbanesePullback j f ∘ g := by sorry

-- This is the affine-coordinate consequence of density, not a predicate pretending
-- to define density of the missing geometric Albanese map.
lemma regularAlbanesePullback_injective_disc (j : Y → (A →ₐ[K] K)) (B : Set Y)
    (hB : ∀ f : A, (∀ y ∈ B, j y f = 0) → f = 0) :
    Function.Injective (fun f : A => fun y : B => regularAlbanesePullback j f y) :=
  by sorry

-- regularAlbanesePullback_affine_coordinate
example (a : ℚ) :
    regularAlbanesePullback (fun x : ℚ => Polynomial.aeval x) Polynomial.X a = a :=
  by sorry
-- regularAlbanesePullback_product_test
example (a : ℚ) :
    regularAlbanesePullback (fun x : ℚ => Polynomial.aeval x)
        (Polynomial.X * (Polynomial.X + 1)) a = a * (a + 1) := by sorry
-- regularAlbanesePullback_unit_test
example :
    regularAlbanesePullback (fun x : ℚ => Polynomial.aeval x) 1 0 = 1 ∧
      regularAlbanesePullback (fun x : ℚ => Polynomial.aeval x) 1 0 ≠ 0 := by sorry
end RegularEvaluation

/-!
Omitted selmer_annihilator: the exact finite-type affine geometric-image dimension
bound, integral-target nonzero equation and reduced image closure need SF.0's native
scheme interfaces. A reduced closed-image equation need not pull back to zero on a
nonreduced source. Omitted dimension_finiteness: this is conditional on the represented
Selmer morphism, a strict same-field dimension bound, and residue_disc_density. It
asserts no existence of a depth satisfying Kim Conjecture 1.

Omitted analytic part of finite_annihilator_locus: L1 gives ordinary disc charts and
Coleman expansions; ED.4 gives Strassmann. Over finite K/Q_p rescale t=πs to obtain a
nonzero restricted series on compact O_K and take a finite union of finite zero sets.
It does not apply to the whole open C_p-disc. Its native finite-set consequence follows.
-/

theorem finite_annihilator_locus {Y Q K : Type*} [Zero K] (j : Y → Q)
    (Z : Set Q) (f : Q → K) (hZ : ∀ q ∈ Z, f q = 0)
    (hf : {y : Y | f (j y) = 0}.Finite) :
    (closedDeRhamLocus j Z).Finite := by sorry

/-!
Omitted depth_one_period: the native proper-curve Hodge–Abel–Jacobi and Kummer bridges
of NC.2/NC.3 identify Q_1 with Lie(J) and the period with log_J(AJ_b(x)). The ordered
ratio has raw coefficient γ_i−I_i; the normalized Lie comparison transports its sign,
so pairing with ω gives the forward Coleman integral. No generalized-Jacobian
boundary contribution is discarded for an open curve. The depth_one_locus linear
consequence uses the existing native annihilator identity below, with explicit
Mordell–Weil/Selmer subspace containment or equality when applicable.
-/

section DepthOneLinear
variable {K V X : Type*} [Field K] [AddCommGroup V] [Module K V]

theorem depth_one_locus (j : X → V) (W : Subspace K V) :
    {x : X | j x ∈ W} =
      {x : X | ∀ ω : Module.Dual K V, ω ∈ W.dualAnnihilator → ω (j x) = 0} :=
  by sorry

lemma classical_locus_subset_selmer (j : X → V) (WMW WS : Subspace K V)
    (h : WMW ≤ WS) : {x : X | j x ∈ WMW} ⊆ {x : X | j x ∈ WS} := by sorry

lemma classical_locus_eq_selmer (j : X → V) (WMW WS : Subspace K V)
    (h : WMW = WS) : {x : X | j x ∈ WMW} = {x : X | j x ∈ WS} := by sorry

example (j : X → V) : {x : X | j x ∈ (⊤ : Subspace K V)} = Set.univ := by sorry
example (j : X → V) : {x : X | j x ∈ (⊥ : Subspace K V)} = {x | j x = 0} := by sorry

-- A Mordell–Weil rank bound alone does not bound the full Selmer period image.
example (j : X → V) (WMW : Subspace K V) :
    {x : X | j x ∈ WMW} ⊆ {x : X | j x ∈ (⊤ : Subspace K V)} := by sorry
end DepthOneLinear

end TauCeti.ChabautyKim
