/-
This file is not the roadmap and is not exhaustive. The roadmap document is definitive.
The statements suggest Lean forms so that contributors and reviewers converge on names
and signatures. They make no implementation claim for the compactification roadmap.

Revision BP-ShimuraCompactifications--C0~2, Codex session codex-g4Y4t6.
Independent review REV-ShimuraCompactifications--C0~2, Codex session codex-SbJxfI:
needs_changes for missing full geometric signatures/API/examples. The corrected
ledger below records mathematical contracts; comments are not typed prototypes.
The file elaborates in the shared pinned build. This checks syntax and types;
all proposed declarations remain unchecked mathematical planning prototypes.

Part C0 covers C0, C1, C2, C2.general, C3, C3.general, C4 and C5.
Native coefficient algebra, uniform affine coefficient change and local arithmetic
fan components have typed signatures below. Global cusp compatibility, torsor
algebras and the analytic/formal/algebraic-space suppliers remain explicitly
unavailable at the pin. The final ledger records the exact outstanding full
contracts. A local specialization is not counted as a completed global node.
No opaque proposition or conclusion-as-field object substitutes for a supplier.

Pins:
  Tau Ceti f790474821cf4256814db967cb154e7af3d0c369
  Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174
-/

import Mathlib.Algebra.MonoidAlgebra.Basic
import Mathlib.RingTheory.Ideal.Quotient.Operations
import Mathlib.Data.ZMod.Basic
import Mathlib.AlgebraicGeometry.Scheme
import Mathlib.AlgebraicGeometry.Pullbacks
import Mathlib.Algebra.Polynomial.AlgebraMap
import Mathlib.RingTheory.Valuation.ValuationRing
import Mathlib.Topology.Compactness.Compact
import TauCeti.Geometry.Toric.Algebraic.Fan.Basic
import TauCeti.Algebra.AlgebraicGroup.SplitTorus.Scheme
import TauCeti.AlgebraicGeometry.IrreducibleOfConnectedDomainStalk

open CategoryTheory AlgebraicGeometry
open scoped CategoryTheory.MonObj

noncomputable section

namespace AddMonoidAlgebra

/-- ShimuraCompactifications:C0/face-projection. The actual additive coefficient restriction acquires an
algebra-homomorphism structure under the explicit face condition. -/
def faceProjection (R : Type*) [CommRing R] {P : Type*} [AddCommMonoid P]
    (F : AddSubmonoid P)
    (hF : ∀ a b : P, a + b ∈ F ↔ a ∈ F ∧ b ∈ F) :
    AddMonoidAlgebra R P →ₐ[R] AddMonoidAlgebra R F := by
  sorry

section FaceAPI

variable (R : Type*) [CommRing R] {P : Type*} [AddCommMonoid P]
variable (F : AddSubmonoid P)
variable (hF : ∀ a b : P, a + b ∈ F ↔ a ∈ F ∧ b ∈ F)

/-- Compatibility with the EXISTING coefficient restriction; no second underlying map. -/
theorem faceProjection_eq_comapDomain (f : AddMonoidAlgebra R P) :
    faceProjection R F hF f =
      AddMonoidAlgebra.comapDomain (fun m : F => (m : P)) Subtype.val_injective f := by
  sorry

theorem faceProjection_single_mem (p : P) (hp : p ∈ F) (r : R) :
    faceProjection R F hF (AddMonoidAlgebra.single p r) =
      AddMonoidAlgebra.single (⟨p, hp⟩ : F) r := by
  sorry

theorem faceProjection_single_not_mem (p : P) (hp : p ∉ F) (r : R) :
    faceProjection R F hF (AddMonoidAlgebra.single p r) = 0 := by
  sorry

/-- ShimuraCompactifications:C0/face-projection-coeff, promoted from the definition's coefficient API. -/
theorem faceProjection_coeff (f : AddMonoidAlgebra R P) (m : F) :
    (faceProjection R F hF f).coeff m = f.coeff (m : P) := by
  sorry

/-- ShimuraCompactifications:C0/face-projection-section. The inclusion is the EXISTING degree-map AlgHom. -/
theorem faceProjection_comp_inclusion :
    (faceProjection R F hF).comp (AddMonoidAlgebra.mapDomainAlgHom R R F.subtype) =
      AlgHom.id R (AddMonoidAlgebra R F) := by
  sorry

/-- ShimuraCompactifications:C0/face-projection-kernel. This is the monomial ideal, NOT its radical. -/
theorem ker_faceProjection :
    RingHom.ker (faceProjection R F hF).toRingHom =
      Ideal.span {f : AddMonoidAlgebra R P |
        ∃ p : P, p ∉ F ∧ f = AddMonoidAlgebra.single p (1 : R)} := by
  sorry

end FaceAPI

/-- ShimuraCompactifications:C0/face-quotient. Instantiate the existing first isomorphism theorem and
transport along `ker_faceProjection` to the specified off-face monomial ideal. -/
def faceQuotientEquiv (R : Type*) [CommRing R] {P : Type*} [AddCommMonoid P]
    (F : AddSubmonoid P)
    (hF : ∀ a b : P, a + b ∈ F ↔ a ∈ F ∧ b ∈ F) :
    (AddMonoidAlgebra R P ⧸
      Ideal.span {f : AddMonoidAlgebra R P |
        ∃ p : P, p ∉ F ∧ f = AddMonoidAlgebra.single p (1 : R)}) ≃ₐ[R]
      AddMonoidAlgebra R F := by
  sorry

section QuotientAPI

variable (R : Type*) [CommRing R] {P : Type*} [AddCommMonoid P]
variable (F : AddSubmonoid P)
variable (hF : ∀ a b : P, a + b ∈ F ↔ a ∈ F ∧ b ∈ F)

theorem faceQuotientEquiv_mk (f : AddMonoidAlgebra R P) :
    faceQuotientEquiv R F hF (Ideal.Quotient.mk _ f) = faceProjection R F hF f := by
  sorry

theorem faceQuotientEquiv_symm_single (m : F) (r : R) :
    (faceQuotientEquiv R F hF).symm (AddMonoidAlgebra.single m r) =
      Ideal.Quotient.mk _ (AddMonoidAlgebra.single (m : P) r) := by
  sorry

theorem faceQuotientEquiv_coeff (f : AddMonoidAlgebra R P) (m : F) :
    (faceQuotientEquiv R F hF (Ideal.Quotient.mk _ f)).coeff m = f.coeff (m : P) := by
  sorry

theorem faceQuotient_mk_eq_iff
    (hF : ∀ a b : P, a + b ∈ F ↔ a ∈ F ∧ b ∈ F)
    (f g : AddMonoidAlgebra R P) :
    let I : Ideal (AddMonoidAlgebra R P) :=
      Ideal.span {x : AddMonoidAlgebra R P |
        ∃ p : P, p ∉ F ∧ x = AddMonoidAlgebra.single p (1 : R)}
    Ideal.Quotient.mk I f = Ideal.Quotient.mk I g ↔
      ∀ m : F, f.coeff (m : P) = g.coeff (m : P) := by
  sorry

end QuotientAPI

section CoefficientChange

variable {R S : Type*} [CommRing R] [CommRing S]
variable {P : Type*} [AddCommMonoid P]
variable (F : AddSubmonoid P)
variable (hF : ∀ a b : P, a + b ∈ F ↔ a ∈ F ∧ b ∈ F)

/-- ShimuraCompactifications:C0/face-projection-coefficient-change. RingHom equality avoids silently
identifying algebra structures over different coefficient rings. -/
theorem faceProjection_coefficient_change (φ : R →+* S) :
    (AddMonoidAlgebra.mapRingHom F φ).comp (faceProjection R F hF).toRingHom =
      (faceProjection S F hF).toRingHom.comp (AddMonoidAlgebra.mapRingHom P φ) := by
  sorry

/-- ShimuraCompactifications:C0/face-kernel-coefficient-change. This is extension, not contraction,
and no flatness or surjectivity of the coefficient map is assumed. -/
theorem ker_faceProjection_map (φ : R →+* S) :
    Ideal.map (AddMonoidAlgebra.mapRingHom P φ)
        (RingHom.ker (faceProjection R F hF).toRingHom) =
      RingHom.ker (faceProjection S F hF).toRingHom := by
  sorry

end CoefficientChange

/- These helpers express elementary face conditions for the tests. They are
actual explicit propositions about existing additive submonoids, not placeholders
for a geometric theorem. They follow from membership in top and Nat.add_eq_zero. -/
private theorem top_face {P : Type*} [AddCommMonoid P] :
    ∀ a b : P, a + b ∈ (⊤ : AddSubmonoid P) ↔
      a ∈ (⊤ : AddSubmonoid P) ∧ b ∈ (⊤ : AddSubmonoid P) := by
  sorry

private theorem nat_zero_face :
    ∀ a b : ℕ, a + b ∈ (⊥ : AddSubmonoid ℕ) ↔
      a ∈ (⊥ : AddSubmonoid ℕ) ∧ b ∈ (⊥ : AddSubmonoid ℕ) := by
  sorry

/-- AddMonoidAlgebra.faceProjection_zero_test -/
example (R : Type*) [CommRing R] {P : Type*} [AddCommMonoid P]
    (F : AddSubmonoid P) (hF : ∀ a b : P, a + b ∈ F ↔ a ∈ F ∧ b ∈ F) :
    faceProjection R F hF 0 = 0 := by
  sorry

/-- AddMonoidAlgebra.faceProjection_positive_test -/
example :
    faceProjection (ZMod 4) (⊥ : AddSubmonoid ℕ) nat_zero_face
      (AddMonoidAlgebra.single 1 (1 : ZMod 4)) = 0 := by
  sorry

/-- AddMonoidAlgebra.faceProjection_nilpotent_test -/
example :
    (faceProjection (ZMod 4) (⊥ : AddSubmonoid ℕ) nat_zero_face
      (AddMonoidAlgebra.single 0 (2 : ZMod 4))).coeff 0 = 2 ∧
      (2 : ZMod 4) ≠ 0 := by
  sorry

/-- AddMonoidAlgebra.faceProjection_laurent_test -/
example :
    (faceProjection ℤ (⊤ : AddSubmonoid ℤ) top_face
      (AddMonoidAlgebra.single (-1) (1 : ℤ))).coeff ⟨-1, by simp⟩ = 1 := by
  sorry

/-- AddMonoidAlgebra.faceQuotient_zero_test -/
example (R : Type*) [CommRing R] {P : Type*} [AddCommMonoid P]
    (F : AddSubmonoid P) (hF : ∀ a b : P, a + b ∈ F ↔ a ∈ F ∧ b ∈ F) :
    faceQuotientEquiv R F hF (Ideal.Quotient.mk _ 0) = 0 := by
  sorry

/-- AddMonoidAlgebra.faceQuotient_positive_test -/
example :
    faceQuotientEquiv (ZMod 4) (⊥ : AddSubmonoid ℕ) nat_zero_face
      (Ideal.Quotient.mk _ (AddMonoidAlgebra.single 1 (1 : ZMod 4))) = 0 := by
  sorry

/-- AddMonoidAlgebra.faceQuotient_nilpotent_test -/
example :
    (faceQuotientEquiv (ZMod 4) (⊥ : AddSubmonoid ℕ) nat_zero_face
      (Ideal.Quotient.mk _ (AddMonoidAlgebra.single 0 (2 : ZMod 4)))).coeff 0 = 2 ∧
      (2 : ZMod 4) ≠ 0 := by
  sorry

/-- AddMonoidAlgebra.faceQuotient_laurent_test -/
example :
    (faceQuotientEquiv ℤ (⊤ : AddSubmonoid ℤ) top_face
      (Ideal.Quotient.mk _ (AddMonoidAlgebra.single (-1) (1 : ℤ)))).coeff
        ⟨-1, by simp⟩ = 1 := by
  sorry

end AddMonoidAlgebra

namespace ShimuraCompactificationBlueprint

/-- Preserved finite-fan specialization. Finite cones are not finite cone orbits. -/
example {N V : Type*} [AddCommGroup N] [AddCommGroup V] [Module ℝ V]
    {i : N →+ V} {Φ Ψ : TauCeti.Toric.Fan i}
    (h : Φ.cones = Ψ.cones) : Φ = Ψ := by
  exact TauCeti.Toric.Fan.ext h

/-- Preserved base-ring split torus. This is not a torus-torsor embedding. -/
example : Grp (Over (Spec (CommRingCat.of ℤ))) :=
  TauCeti.SplitTorus.groupScheme ℤ (Fin 2)

/-- Preserved scheme-only specialization; the PEL model is an algebraic space. -/
example (Z : Scheme) [IsLocallyNoetherian Z] [ConnectedSpace Z]
    (hStalks : ∀ x : Z.carrier, IsDomain (Z.presheaf.stalk x)) :
    IrreducibleSpace Z := by
  exact TauCeti.AlgebraicGeometry.irreducibleSpace_of_connected_of_isDomain_stalk Z hStalks

end ShimuraCompactificationBlueprint


universe u

namespace ShimuraCompactificationBlueprint

/-- Native affine algebra ingredient of C0/arbitrary-ring-toric-charts.
This does not define the dual monoid of a cone, fan gluing or a torsor chart. -/
def monoidAffineChart (R P : Type u) [CommRing R] [AddCommMonoid P] : Scheme :=
  Spec (CommRingCat.of (AddMonoidAlgebra R P))

/-- The existing spectrum reverses the direction of coefficient change. -/
def monoidAffineChartCoefficientMap {R S P : Type u}
    [CommRing R] [CommRing S] [AddCommMonoid P] (φ : R →+* S) :
    monoidAffineChart S P ⟶ monoidAffineChart R P :=
  Spec.map (CommRingCat.ofHom (AddMonoidAlgebra.mapRingHom P φ))

theorem monoidAffineChartCoefficientMap_id (R P : Type u)
    [CommRing R] [AddCommMonoid P] :
    monoidAffineChartCoefficientMap (P := P) (RingHom.id R) =
      𝟙 (monoidAffineChart R P) := by
  sorry

theorem monoidAffineChartCoefficientMap_comp {R S T P : Type u}
    [CommRing R] [CommRing S] [CommRing T] [AddCommMonoid P]
    (φ : R →+* S) (ψ : S →+* T) :
    monoidAffineChartCoefficientMap (P := P) (ψ.comp φ) =
      monoidAffineChartCoefficientMap (P := P) ψ ≫
        monoidAffineChartCoefficientMap (P := P) φ := by
  sorry

/-- C3/refinement-boundary-ideal regression: x=u, y=u*v, hence xy=u^2*v. -/
example :
    (AddMonoidAlgebra.single (1, 0) (1 : ℤ) : AddMonoidAlgebra ℤ (ℕ × ℕ)) *
        AddMonoidAlgebra.single (1, 1) (1 : ℤ) =
      AddMonoidAlgebra.single (2, 1) (1 : ℤ) := by
  sorry

/-- The pulled-back boundary equation differs from the reduced boundary equation uv.
This algebra example detects the exponents; the geometric ideal comparison is omitted. -/
example :
    (AddMonoidAlgebra.single (2, 1) (1 : ℤ) : AddMonoidAlgebra ℤ (ℕ × ℕ)) ≠
      AddMonoidAlgebra.single (1, 1) (1 : ℤ) := by
  sorry

end ShimuraCompactificationBlueprint

/-! ## Uniform affine coefficient change

These signatures cover the affine part of C0/arbitrary-ring-toric-charts. P is
the actual dual monoid supplied by the toric anchor, not a second cone dialect.
Finite-fan gluing and comparison to the newly implemented current complex
realization still require the anchor modules absent at the pinned commit.
-/

namespace Toric

open ShimuraCompactificationBlueprint

variable {R S P : Type u} [CommRing R] [CommRing S] [AddCommMonoid P]

def affineChartStructureMap (R P : Type u) [CommRing R] [AddCommMonoid P] :
    monoidAffineChart R P ⟶ Spec (CommRingCat.of R) :=
  Spec.map (CommRingCat.ofHom (algebraMap R (AddMonoidAlgebra R P)))

/-- API Toric.affineChart_baseChange: the coefficient square is Cartesian for
arbitrary ring maps. No flatness, reducedness or Noetherian hypothesis occurs. -/
theorem affineChart_baseChange (φ : R →+* S) :
    IsPullback (monoidAffineChartCoefficientMap (P := P) φ)
      (affineChartStructureMap S P) (affineChartStructureMap R P)
      (Spec.map (CommRingCat.ofHom φ)) := by
  sorry

/-- The ray algebra is the existing polynomial algebra, with q corresponding to
X. Its off-face quotient retains the whole coefficient ring, not its reduction. -/
-- Toric.affineChart_ray_Z4_test
example :
    (Polynomial.toFinsuppIsoAlg (ZMod 4)) Polynomial.X =
      AddMonoidAlgebra.single 1 (1 : ZMod 4) ∧
    Nonempty ((AddMonoidAlgebra (ZMod 4) ℕ ⧸
      Ideal.span {AddMonoidAlgebra.single 1 (1 : ZMod 4)}) ≃ₐ[ZMod 4] ZMod 4) ∧
    (AddMonoidAlgebra.faceProjection (ZMod 4) (⊥ : AddSubmonoid ℕ)
      (by sorry))
      (AddMonoidAlgebra.single 0 (2 : ZMod 4)) ≠ 0 := by
  sorry

/-- The zero-cone monoid is the whole character GROUP, including inverse
characters. This concrete Laurent test distinguishes a torus from affine space.
The following example compares with the native split-torus scheme. -/
-- Coordinate-algebra regression for the zero-cone comparison below.
example (R : Type u) [CommRing R] :
    (AddMonoidAlgebra.single (-1) (1 : R) : AddMonoidAlgebra R ℤ) *
      AddMonoidAlgebra.single 1 (1 : R) = 1 := by
  sorry

/-- The zero cone gives the actual native split-torus SCHEME. -/
-- Toric.affineChart_zero_test
example (R : Type) [CommRing R] (n : ℕ) :
    Nonempty (monoidAffineChart R (Fin n →₀ ℤ) ≅
      (TauCeti.SplitTorus.groupScheme R (Fin n)).X.left) := by
  sorry

/-- Arbitrary valuation rings, including non-Noetherian ones, use the same
Cartesian square. No finite-generation property of the coefficient ring is used. -/
-- Toric.affineChart_valuation_test
example (A P : Type) [CommRing A] [IsDomain A] [ValuationRing A]
    [AddCommMonoid P] :
    IsPullback (monoidAffineChartCoefficientMap (P := P) (Int.castRingHom A))
      (affineChartStructureMap A P) (affineChartStructureMap ℤ P)
      (Spec.map (CommRingCat.ofHom (Int.castRingHom A))) := by
  sorry

/-- The nilpotent coefficient survives in the ACTUAL affine chart algebra. -/
-- Toric.affineChart_nilpotent_test
example :
    (AddMonoidAlgebra.single 0 (2 : ZMod 4) : AddMonoidAlgebra (ZMod 4) ℕ) ≠ 0 ∧
    (AddMonoidAlgebra.single 0 (2 : ZMod 4) : AddMonoidAlgebra (ZMod 4) ℕ) ^ 2 = 0 := by
  sorry

end Toric

/-! ## Native arithmetic cone data

The local carrier below retains the pinned cone and lattice vocabulary. It fixes
both integral and real actions as input and records only explicit incidence,
orbit and compact-intersection predicates. This is the local component of the
packet's cusp-indexed system: rational boundary, adelic reindexing and restriction
compatibility are still supplied by V2, not silently replaced by a single fan.
-/

namespace TauCeti.ShimuraCompactifications.C0

open TauCeti.Toric

variable {N V Γ : Type u} [AddCommGroup N] [NormedAddCommGroup V]
  [NormedSpace ℝ V] [Group Γ]

/-- Fixed integral arithmetic action, with its compatible real extension. -/
structure IntegralConeAction (i : N →+ V) where
  integral : Γ →* (N ≃ₗ[ℤ] N)
  real : Γ →* (V ≃ₗ[ℝ] V)
  compatible : ∀ γ n, real γ (i n) = i (integral γ n)

/-- Finiteness modulo the specified action, expressed by actual representatives.
It does not imply that the set of cones is finite. -/
def ConeOrbitFinite {i : N →+ V} (a : IntegralConeAction (Γ := Γ) i)
    (S : Set (PointedCone ℝ V)) : Prop :=
  ∃ reps : Finset (PointedCone ℝ V), (reps : Set _) ⊆ S ∧
    ∀ σ ∈ S, ∃ τ ∈ reps, ∃ γ : Γ, σ = τ.map (a.real γ).toLinearMap

/-- Compact-intersection finiteness is imposed only inside the positivity domain.
In particular the origin of an infinite fan need not admit such a neighbourhood. -/
def ConeCompactFinite (C : Set V) (S : Set (PointedCone ℝ V)) : Prop :=
  ∀ K : Set V, IsCompact K → K ⊆ C →
    {σ ∈ S | ((σ : Set V) ∩ K).Nonempty}.Finite

/-- Local arithmetic fan at one fixed cusp and level, on the shared cone carrier.
The global cusp/adelic compatibility is not a field with an undefined meaning. -/
structure ArithmeticFan (i : N →+ V) (a : IntegralConeAction (Γ := Γ) i)
    (C Cstar : Set V) where
  lattice : IsIntegralLattice i
  cones : Set (PointedCone ℝ V)
  toric : ∀ σ ∈ cones, IsToricCone i σ
  faces : ∀ σ ∈ cones, ∀ τ, τ.IsFaceOf σ → τ ∈ cones
  intersections : ∀ σ ∈ cones, ∀ τ ∈ cones, (σ ⊓ τ).IsFaceOf σ
  invariant : ∀ γ σ, σ ∈ cones ↔ σ.map (a.real γ).toLinearMap ∈ cones
  finite_orbits : ConeOrbitFinite a cones
  compact_finite : ConeCompactFinite C cones
  support_subset : ∀ σ ∈ cones, (σ : Set V) ⊆ Cstar

namespace ArithmeticFan

variable {i : N →+ V} {a : IntegralConeAction (Γ := Γ) i} {C Cstar : Set V}

/-- API ArithmeticFan.ext, with the lattice, action and domains fixed. -/
theorem ext {F G : ArithmeticFan i a C Cstar} (h : F.cones = G.cones) : F = G := by
  sorry

/-- API ArithmeticFan.toFiniteFan: a genuine finite-cone witness is required. -/
def toFiniteFan (F : ArithmeticFan i a C Cstar) (h : F.cones.Finite) :
    TauCeti.Toric.Fan i := by
  sorry

theorem toFiniteFan_cones (F : ArithmeticFan i a C Cstar) (h : F.cones.Finite) :
    (F.toFiniteFan h).cones = F.cones := by
  sorry

/-- The finite anchor gives a local arithmetic fan after invariance and the
specified support inclusion are supplied. Finiteness of cones makes the compact
and orbit conditions automatic, and does not replace the action input. -/
def ofFiniteFan (Q : TauCeti.Toric.Fan i)
    (hinv : ∀ γ σ, σ ∈ Q.cones ↔ σ.map (a.real γ).toLinearMap ∈ Q.cones)
    (hsupport : ∀ σ ∈ Q.cones, (σ : Set V) ⊆ Cstar) :
    ArithmeticFan i a C Cstar := by
  sorry

theorem ofFiniteFan_cones (Q : TauCeti.Toric.Fan i)
    (hinv : ∀ γ σ, σ ∈ Q.cones ↔ σ.map (a.real γ).toLinearMap ∈ Q.cones)
    (hsupport : ∀ σ ∈ Q.cones, (σ : Set V) ⊆ Cstar) :
    (ofFiniteFan (C := C) Q hinv hsupport).cones = Q.cones := by
  sorry

/-- The literal union of the cones, rather than an opaque completeness condition. -/
def coneSupport (F : ArithmeticFan i a C Cstar) : Set V :=
  ⋃ σ ∈ F.cones, (σ : Set V)

def IsComplete (F : ArithmeticFan i a C Cstar) : Prop := F.coneSupport = Cstar

/-- API ArithmeticFan.support: completeness refers to Cstar, not the ambient space. -/
theorem support (F : ArithmeticFan i a C Cstar) :
    F.IsComplete ↔ ∀ x, x ∈ Cstar ↔ ∃ σ ∈ F.cones, x ∈ σ := by
  sorry

/-- The rank-zero regression does not assume nonemptiness from an empty cone set.
Completeness at Cstar={0} supplies it. -/
-- ArithmeticFan.zero_test
example [Subsingleton V] (F : ArithmeticFan i a C ({0} : Set V))
    (h : F.IsComplete) : F.cones = {⊥} := by
  sorry

/-- Any finite quadrant instance specializes with exactly its original cones.
The statement is uniform over finite fans, including that quadrant. -/
-- ArithmeticFan.finite_test
example (Q : TauCeti.Toric.Fan i)
    (hinv : ∀ γ σ, σ ∈ Q.cones ↔ σ.map (a.real γ).toLinearMap ∈ Q.cones)
    (hsupport : ∀ σ ∈ Q.cones, (σ : Set V) ⊆ Cstar) :
    ((ofFiniteFan (C := C) Q hinv hsupport).toFiniteFan
      (by rw [ofFiniteFan_cones]; exact Q.finite_cones)).cones = Q.cones := by
  sorry

/-- Every cone contains 0. Thus an infinite cone set fails the compact-intersection
condition on the ambient domain, while the local carrier only imposes it on C. -/
-- ArithmeticFan.origin_test
example (F : ArithmeticFan i a C Cstar) (h : F.cones.Infinite) :
    ¬ ConeCompactFinite (Set.univ : Set V) F.cones := by
  sorry

/-- Positive-ray support cannot be confused with ambient completeness. The missing
negative vector is a concrete witness, with no ad hoc completeness proposition. -/
-- ArithmeticFan.support_test
example (F : ArithmeticFan i a C (Set.univ : Set V))
    (l : V →ₗ[ℝ] ℝ) (hpos : ∀ σ ∈ F.cones, ∀ x ∈ σ, 0 ≤ l x)
    (x : V) (hx : l x < 0) : ¬ F.IsComplete := by
  sorry

/-- Explicit cone-containment relation; no desired theorem is stored as data. -/
def Refines (F G : ArithmeticFan i a C Cstar) : Prop :=
  ∀ σ ∈ F.cones, ∃ τ ∈ G.cones, σ ≤ τ

/-- The literal intersection collection on a fixed cusp, action and lattice. -/
def intersectionCones (F G : ArithmeticFan i a C Cstar) : Set (PointedCone ℝ V) :=
  {κ | ∃ σ ∈ F.cones, ∃ τ ∈ G.cones, κ = σ ⊓ τ}

/-- A local common refinement requires the actual finite-overlap/orbit witness.
Two arbitrary actions with finite cone orbits do not supply Pink's reduction
hypotheses. The global Pink 9.22 contract remains in the omission ledger. -/
def commonRefinement (F G : ArithmeticFan i a C Cstar)
    (hoverlap : ConeOrbitFinite a (intersectionCones F G)) :
    ArithmeticFan i a C Cstar := by
  sorry

theorem commonRefinement_cones (F G : ArithmeticFan i a C Cstar)
    (hoverlap : ConeOrbitFinite a (intersectionCones F G)) :
    (commonRefinement F G hoverlap).cones = intersectionCones F G := by
  sorry

/-- API ArithmeticFan.commonRefinement_le, for the local fixed-cusp contract. -/
theorem commonRefinement_le (F G : ArithmeticFan i a C Cstar)
    (hoverlap : ConeOrbitFinite a (intersectionCones F G)) :
    (commonRefinement F G hoverlap).Refines F ∧
      (commonRefinement F G hoverlap).Refines G := by
  sorry

/-- API ArithmeticFan.commonRefinement_universal. -/
theorem commonRefinement_universal (F G H : ArithmeticFan i a C Cstar)
    (hoverlap : ConeOrbitFinite a (intersectionCones F G))
    (hF : H.Refines F) (hG : H.Refines G) :
    H.Refines (commonRefinement F G hoverlap) := by
  sorry

/-- API ArithmeticFan.commonRefinement_support: the support is the intersection. -/
theorem commonRefinement_support (F G : ArithmeticFan i a C Cstar)
    (hoverlap : ConeOrbitFinite a (intersectionCones F G)) :
    (commonRefinement F G hoverlap).coneSupport = F.coneSupport ∩ G.coneSupport := by
  sorry

-- ArithmeticFan.commonRefinement_self_test
example (F : ArithmeticFan i a C Cstar)
    (hoverlap : ConeOrbitFinite a (intersectionCones F F)) :
    (commonRefinement F F hoverlap).cones = F.cones := by
  sorry

/-- If a chosen subdivision's cones are faces of the coarse cones they meet,
intersection produces exactly that subdivision. This is the containment part
of the quadrant-diagonal regression; the explicit lattice instance is outstanding. -/
theorem commonRefinement_of_subdivision (F G : ArithmeticFan i a C Cstar)
    (hoverlap : ConeOrbitFinite a (intersectionCones F G)) (hGF : G.Refines F)
    (hface : ∀ σ ∈ F.cones, ∀ τ ∈ G.cones, (σ ⊓ τ).IsFaceOf τ) :
    (commonRefinement F G hoverlap).cones = G.cones := by
  sorry

end ArithmeticFan
end TauCeti.ShimuraCompactifications.C0

/-!
## Explicit geometric signature omissions

These are full mathematical contracts, not elaborated declarations. The local
ArithmeticFan and uniform affine specializations above cover only the portions
listed in suggestedCoverage. Global cusp, torsor, analytic, formal and space
carrier conditions have not been replaced by arbitrary propositions.

### ShimuraCompactifications:C0

ShimuraCompactifications:C0/relative-torus-embedding — TauCeti.Toric.Relative.torusEmbedding
  construction: Construct T(sigma)=Spec_Z(A_sigma), where A_sigma is the homogeneous O_Z-subalgebra direct-summing L_m over m in P_sigma inside the actual torsor algebra. Its multiplication and unit are inherited from O_T. The construction is functorial under base change and is equivariant for the given split torus. It extends the unchanged finite-complex toric chart, not its lattice or cone carrier.
  Hypotheses: Z is a scheme, or an algebraic space treated on its actual etale atlas. H is a split torus with finite free character lattice M; T to Z is a right H-torsor in the fppf topology. Use the common toric lattice/cone vocabulary and its dual additive monoids. For a rational polyhedral salient closed cone sigma in the real cocharacter space, P_sigma consists of the integral characters nonnegative on sigma. Let L_m be the weight-m subsheaf of the actual pushforward of O_T: right translation by h acts on a local function by multiplication by m(h). Its unit and multiplication maps L_m tensor L_n to L_(m+n) are those of O_T, not arbitrary rigidifications. Lan's cone convention is relatively open; its nonnegative character monoid agrees with that of our closed cone. Strict positivity, when comparing the source ideal notation, is tested on the relative interior, not on the origin. The zero-cone case is treated separately.
  API TauCeti.Toric.Relative.embedding_trivialization (compatibility): A multiplication-compatible trivialization of the torsor identifies T(sigma) with Spec of the existing monoid algebra over that open of Z.
  API TauCeti.Toric.Relative.embedding_baseChange (functoriality): For Zprime to Z, pullback of T(sigma) is canonically the embedding of the pulled-back torsor, compatibly with identity and composition.
  API TauCeti.Toric.Relative.embedding_torusAction (structure): The given H-action extends to T(sigma), and the structural morphism to Z is invariant.
  API TauCeti.Toric.Relative.embedding_zeroCone (compatibility): For the zero cone, P_sigma=M and T(sigma) is canonically the original torsor T.
  API TauCeti.Toric.Relative.embedding_changeTrivialization (relation): If local torsor sections satisfy t_beta=t_alpha g_alpha_beta, the weight-m coordinate functions satisfy q_beta,m=m(g_alpha_beta)^(-1) q_alpha,m. These transitions preserve multiplication, boundary ideals and all face maps.
  API TauCeti.Toric.Relative.embedding_homEquiv (universal-property): For a Z-scheme Y, maps Y→T(sigma) over Z correspond to maps from the pulled-back graded character algebra A_sigma to O_Y; evaluation on homogeneous characters respects its inherited multiplication.
  Example TauCeti.Toric.Relative.embedding_rankOne_test (computation): For a trivial G_m-torsor and its positive ray, the embedding is A1_Z with its usual G_m open.
  Example TauCeti.Toric.Relative.embedding_zeroCone_test (degenerate): The zero-cone embedding is the given torsor, even if that torsor is nontrivial.
  Example TauCeti.Toric.Relative.embedding_lineDual_test (compatibility): For rank one with weight-one function line L, the positive-ray embedding is Spec_Z Sym(L), the total space of L dual under the convention V(E)=Spec Sym(E dual). Do not replace it by the total space of L.
  Example TauCeti.Toric.Relative.embedding_nilpotentBase_test (non-example): For the trivial rank-one torsor over Z/4, the positive-ray coordinate ring is (Z/4)[q], and restriction to q=0 retains the nonzero nilpotent scalar 2.

ShimuraCompactifications:C0/relative-face-open — TauCeti.Toric.Relative.faceOpenImmersion
  theorem: For a face tau of sigma, construct the canonical equivariant open immersion T(tau) to T(sigma). On a multiplication-compatible trivialization it is the monomial localization R[P_sigma] to R[P_tau]; these immersions obey identity and composition and have the expected common-face intersections. This is an ordinary scheme statement, not a morphism between completions at different strata.
  Hypotheses: Z is a scheme, or an algebraic space treated on its actual etale atlas. H is a split torus with finite free character lattice M; T to Z is a right H-torsor in the fppf topology. Use the common toric lattice/cone vocabulary and its dual additive monoids. For a rational polyhedral salient closed cone sigma in the real cocharacter space, P_sigma consists of the integral characters nonnegative on sigma. Let L_m be the weight-m subsheaf of the actual pushforward of O_T: right translation by h acts on a local function by multiplication by m(h). Its unit and multiplication maps L_m tensor L_n to L_(m+n) are those of O_T, not arbitrary rigidifications. Use the common integral supporting-character and face-localization theorem from the toric anchor: choose m in P_sigma exposing tau, so P_tau=P_sigma+N(-m). Lan's cone convention is relatively open; its nonnegative character monoid agrees with that of our closed cone. Strict positivity, when comparing the source ideal notation, is tested on the relative interior, not on the origin. The zero-cone case is treated separately.

ShimuraCompactifications:C0/relative-regular-coordinates — TauCeti.Toric.Relative.regularCoordinateIso
  comparison: If sigma is regular of dimension r in a rank-n cocharacter lattice, a supplied integral basis extending its primitive rays and a multiplication-compatible local torsor trivialization give an algebra isomorphism A_sigma with R[x_1,...,x_r,y_1^(+-1),...,y_(n-r)^(+-1)]. On monomials it is the character-exponent map from the existing dual-monoid identification P_sigma with N^r times Z^(n-r). The associated scheme isomorphism is over the actual local base.
  Hypotheses: Z is a scheme, or an algebraic space treated on its actual etale atlas. H is a split torus with finite free character lattice M; T to Z is a right H-torsor in the fppf topology. Use the common toric lattice/cone vocabulary and its dual additive monoids. For a rational polyhedral salient closed cone sigma in the real cocharacter space, P_sigma consists of the integral characters nonnegative on sigma. Let L_m be the weight-m subsheaf of the actual pushforward of O_T: right translation by h acts on a local function by multiplication by m(h). Its unit and multiplication maps L_m tensor L_n to L_(m+n) are those of O_T, not arbitrary rigidifications. Regularity includes rationality, salience and the primitive-basis condition; it is not merely simpliciality. The ring R can be nonreduced. Lan's cone convention is relatively open; its nonnegative character monoid agrees with that of our closed cone. Strict positivity, when comparing the source ideal notation, is tested on the relative interior, not on the origin. The zero-cone case is treated separately.

ShimuraCompactifications:C0/relative-stratum-quotient — TauCeti.Toric.Relative.stratumQuotientIso
  theorem: For a split torus chart T(sigma), the homogeneous quotient by the sum of L_m over m in P_sigma outside F_sigma=M intersect sigma-perp is canonically Spec_Z of the direct sum of L_m over F_sigma. It is the induced torsor for the split quotient torus with character lattice F_sigma. Its ideal and the quotient construction commute with arbitrary base change. This is the relative scheme-theoretic stratum; identify it with a reduced complement only under the needed reducedness hypotheses.
  Hypotheses: Z is a scheme, or an algebraic space treated on its actual etale atlas. H is a split torus with finite free character lattice M; T to Z is a right H-torsor in the fppf topology. Use the common toric lattice/cone vocabulary and its dual additive monoids. For a rational polyhedral salient closed cone sigma in the real cocharacter space, P_sigma consists of the integral characters nonnegative on sigma. Let L_m be the weight-m subsheaf of the actual pushforward of O_T: right translation by h acts on a local function by multiplication by m(h). Its unit and multiplication maps L_m tensor L_n to L_(m+n) are those of O_T, not arbitrary rigidifications. Lan's cone convention is relatively open; its nonnegative character monoid agrees with that of our closed cone. Strict positivity, when comparing the source ideal notation, is tested on the relative interior, not on the origin. The zero-cone case is treated separately.

ShimuraCompactifications:C0/relative-boundary-coordinates — TauCeti.Toric.Relative.boundaryCoordinateIso
  comparison: In the regular coordinates of relative-regular-coordinates, the scheme-theoretic intersection of the coordinate boundary components indexed by J has ideal (x_j : j in J) and coordinate algebra R[x_i : i outside J, y_1^(+-1),...,y_(n-r)^(+-1)]. Its exact boundary open is the principal open obtained by inverting the product of x_i for i outside J. These identifications are compatible with base change and with the character-unit transition maps.
  Hypotheses: Z is a scheme, or an algebraic space treated on its actual etale atlas. H is a split torus with finite free character lattice M; T to Z is a right H-torsor in the fppf topology. Use the common toric lattice/cone vocabulary and its dual additive monoids. For a rational polyhedral salient closed cone sigma in the real cocharacter space, P_sigma consists of the integral characters nonnegative on sigma. Let L_m be the weight-m subsheaf of the actual pushforward of O_T: right translation by h acts on a local function by multiplication by m(h). Its unit and multiplication maps L_m tensor L_n to L_(m+n) are those of O_T, not arbitrary rigidifications. Use the supplied regular cone basis and actual torsor trivialization, and J a subset of the r boundary-coordinate indices. Lan's cone convention is relatively open; its nonnegative character monoid agrees with that of our closed cone. Strict positivity, when comparing the source ideal notation, is tested on the relative interior, not on the origin. The zero-cone case is treated separately.

ShimuraCompactifications:C0/arithmetic-admissible-fan — TauCeti.ShimuraCompactifications.C0.arithmetic_admissible_fan
  definition: Extend the common fan incidence data by a possibly infinite set of rational polyhedral salient cones, an integral arithmetic action and finitely many cone orbits. For every cusp the support lies in the rational closure C* of its positivity cone; completeness means support=C*. Require local finiteness on compact subsets of the OPEN positivity domain, closure under faces, intersections as common faces, stabilizer invariance, and compatibility under the actual rational boundary restriction and level actions. The finite specialization is the pinned Fan; finite orbit count is never substituted for a finite set of cones.
  Hypotheses: The lattice and PointedCone, IsToricCone and IsFaceOf predicates are the pinned common carriers. Supply integral linear actions preserving the lattice and C*. The arithmetic quotient action is its effective image on the lattice. Global cusp compatibility includes the finite double-coset indexing, not just one fan at one cusp.
  Native local/affine portions are present above; the full contract remains outstanding.
  API ArithmeticFan.ext (extensionality): Local specialization above; full global contract outstanding. Two systems with the same cusp lattices, actions and cone sets agree; proof witnesses do not create a second cone carrier.
  API ArithmeticFan.toFiniteFan (compatibility): Local specialization above; full global contract outstanding. If the cone set is finite, forgetting the action/support data gives the pinned Fan with exactly that cone set.
  API ArithmeticFan.restrict (functoriality): Boundary and level restriction preserve incidence and equivariance; completeness and orbit finiteness are transported only under the established source hypotheses.
  API ArithmeticFan.support (characterisation): Local specialization above; full global contract outstanding. Completeness is the equality of union of cones with the specified rational closure C*, not all ambient vectors.
  Example ArithmeticFan.zero_test (degenerate): Local specialization above; full global contract outstanding. For the rank-zero lattice C*={0}, the complete system has exactly the zero cone.
  Example ArithmeticFan.finite_test (compatibility): Local specialization above; full global contract outstanding. For a finite quadrant fan and trivial action, toFiniteFan has exactly its original cones.
  Example ArithmeticFan.origin_test (non-example): Local specialization above; full global contract outstanding. A genuinely infinite fan with common vertex 0 fails ambient local finiteness at 0 and remains allowed when locally finite on C.
  Example ArithmeticFan.support_test (non-example): Local specialization above; full global contract outstanding. The single positive ray fan in R has support R>=0 and is not a complete fan with prescribed support R.

ShimuraCompactifications:C0/compatible-common-refinement — TauCeti.ShimuraCompactifications.C0.compatible_common_refinement
  construction: For two complete admissible cusp systems and a specified finite family of boundary-compatible integral lattice maps, construct a common admissible refinement by intersections sigma1 intersect phi^-1(sigma2), closing under faces. Preserve support, finite arithmetic orbits and cusp/level compatibility under Pink 9.22 hypotheses. The construction is coarsest for the cone-containment relation; no common refinement is claimed for infinitely many unrelated Hecke maps.
  Hypotheses: Both systems satisfy arithmetic-admissible-fan, and the maps send the source positivity domain into the required target domain. For the relative comparison, use the same cusp support or the inverse-image support appropriate to the specified map.
  Native local/affine portions are present above; the full contract remains outstanding.
  API ArithmeticFan.commonRefinement_le (structure): Local specialization above; full global contract outstanding. Each resulting cone is contained in a cone of both original systems.
  API ArithmeticFan.commonRefinement_universal (universal-property): Local specialization above; full global contract outstanding. A compatible fan refining both systems refines the intersection system.
  API ArithmeticFan.commonRefinement_support (compatibility): Local specialization above; full global contract outstanding. The resulting system has the required common or inverse-image support.
  Example ArithmeticFan.commonRefinement_self_test (degenerate): Local specialization above; full global contract outstanding. The common refinement of a system with itself is the same cone collection.
  Example ArithmeticFan.quadrant_refinement_test (computation): Intersecting the quadrant fan with its subdivision by (1,1) yields the two diagonal cones and their faces.
  Example ArithmeticFan.commonRefinement_level_test (compatibility): A specified level restriction induces the same cone-containment maps on the common refinement.
  Acceptance: Two refinements compare through a third without being literally equal.
  Acceptance: For the quadrant and its diagonal subdivision, the common refinement is the diagonal subdivision.

ShimuraCompactifications:C0/smooth-projective-refinement — TauCeti.ShimuraCompactifications.C0.smooth_projective_refinement
  theorem: Every complete admissible system at neat level has a complete smooth projective admissible refinement, compatible with any specified finite family of fan maps. Projectivity carries an invariant integral piecewise-linear polarization, with domains of linearity exactly the cones. Record Lan's superadditive/concave convention pol(x+y)>=pol(x)+pol(y). If a global no-self-identification condition is required, impose the extra barycentric refinement of Pink 9.20; neatness and smoothness alone prove local normal crossings.
  Hypotheses: The arithmetic system and maps satisfy compatible-common-refinement. Use rational polyhedral positivity cones attached to the actual boundary data. A projective polarization is continuous, positive on nonzero points, homogeneous, arithmetic-invariant and integral on the lattice, with the required cusp restriction compatibility.
  Acceptance: The cone generated by (1,0),(1,2) needs a genuine regular subdivision; simpliciality alone fails.
  Acceptance: A prescribed finite Hecke span admits compatible refinements; an arbitrary universal fixed fan is not asserted.

ShimuraCompactifications:C0/arbitrary-ring-toric-charts — TauCeti.ShimuraCompactifications.C0.arbitrary_ring_toric_charts
  construction: For the shared lattice and dual monoid P_sigma, construct U_sigma,R=Spec R[P_sigma] for every commutative ring R, by base change of Spec Z[P_sigma]. Glue a FINITE fan using the ordinary face localizations to obtain X_Sigma,R, with its split torus action and stratum ideals. All chart, overlap and action maps commute with arbitrary coefficient change, including non-Noetherian valuation rings; this extends the complex anchor rather than constructing its finite complex case again.
  Hypotheses: Sigma is a finite rational polyhedral fan on the common lattice; singular cones are permitted. R is any commutative ring. Arithmetic infinite-fan quotients require their separate finiteness and gluing arguments.
  Native local/affine portions are present above; the full contract remains outstanding.
  API Toric.finiteFan_baseChange (functoriality): Finite-fan gluing commutes with arbitrary base change and the comparisons obey identity and composition.
  API Toric.finiteFan_anchor (compatibility): For a finite complex fan, the new integral realization base changed to C is the anchor realization, not a second complex toric space.
  API Toric.finiteFan_torusAction (structure): The split torus action extends its translation action on the dense open torus.
  API Toric.finiteFan_glue_hom (universal-property): Maps from the finite-fan scheme to a Z-scheme correspond to compatible maps from its affine monoid charts, with agreement on the ordinary face-open overlaps.

ShimuraCompactifications:C0/relative-fan-properness — TauCeti.ShimuraCompactifications.C0.relative_fan_properness
  theorem: An integral lattice map and a compatible equivariant map of split torus torsors with FINITE fans induce the relative toric map over the same base scheme. The inverse-image support criterion implies properness over every base. Conversely, for a NONEMPTY source fan over a NONEMPTY base, properness implies that criterion by testing a geometric fibre. Over the empty base every map is proper and support is not detected. For arithmetic quotients separately require finite-type separated quotient charts and compatible arithmetic support; orbit finiteness alone never makes the infinite unquotiented toric space proper. A nonempty fan contains the zero cone; an empty source fan instead gives a proper empty morphism without detecting the inverse-image support condition.
  Hypotheses: Use finite fans and an actual morphism of torsors equivariant for the torus homomorphism. The base morphism in the relative assertion is the identity; composing with another proper base morphism preserves properness. The arithmetic variant uses the actual separated finite-type quotient model from C2 or C5 and complete compatible cusp systems. The necessary direction requires both a nonempty base and a nonempty source fan. The sufficient direction permits empty bases and empty source fans whenever its support criterion holds.
  Acceptance: A complete P1 fan gives a proper relative P1; a single positive ray gives A1, which is not proper.
  Acceptance: A subdivision with unchanged support gives a proper map.
  Acceptance: Over a nonempty base the empty-source map is proper, but its empty support is not the inverse image of a nonempty target fan support containing zero. Necessity excludes this case; sufficiency still allows the empty base.

### ShimuraCompactifications:C1

ShimuraCompactifications:C1/mixed-boundary-datum — TauCeti.ShimuraCompactifications.C1.mixed_boundary_datum
  definition: Enrich V2's existing rational boundary component by Pink's admissible parabolic Q, the associated connected group P1, its unipotent radical W1, distinguished central weight-minus-two subgroup U1, V1=W1/U1 and pure quotient G1=P1/W1. The boundary domain X1 is the specified homogeneous finite-cover space with h1:S_C→(P1)_C; retain its finite fibers, real descent modulo U1, central weight cocharacter, Cartan-involution/no-compact-Q-factor and center conditions. Ad on Lie P1 has only weights 0,-1,-2 with W_-2=Lie U1, W_-1=Lie W1 and W_0=Lie P1. U1 and W1 are distinct inputs.
  Hypotheses: Fix a pure Shimura datum (G,X), compact open K and its actual arithmetic component quotients from V0. No universal abelian scheme is assumed for this datum. V2 supplies the rational boundary component; D4 supplies the ambient pure Shimura datum and its algebraic morphisms; the parabolic/Lie structure is imported from ReductiveGroups Layer 7. The homogeneous finite cover X1 is not replaced by the image of h1. Mixed Hodge structures, filtrations and strictness are the pinned Hodge carriers and HodgeStructures L2, not new generic definitions.
  API MixedBoundaryDatum.pureQuotient (projection): The quotient P1/W1 with its induced domain is the existing pure boundary datum.
  API MixedBoundaryDatum.weightFiltration (characterisation): The three steps are exactly Lie U1, Lie W1 and Lie P1; V1 identifies with gr_-1.
  API MixedBoundaryDatum.conjugation (functoriality): Rational conjugation transports the groups, domain cover, h1 and filtrations with the V2 boundary label.
  API MixedBoundaryDatum.h_finiteFibers (structure): The map h1 has finite fibers; the definition keeps X1 rather than setting X1=image h1.
  API MixedBoundaryDatum.ext (extensionality): With the ambient datum and homogeneous cover fixed, equality of the algebraic subgroup embeddings P1,W1,U1 and the boundary h1/domain data determines equality of boundary data; axiom proofs add no extra carrier.
  Example MixedBoundaryDatum.siegel2_rank1_test (computation): At a genus-two rank-one cusp, U1 has rank 1 and V1 dimension 2, so W1 has dimension 3.
  Example MixedBoundaryDatum.pure_test (degenerate): When W1=1, U1=1 and the Lie algebra of P1 is entirely weight zero.
  Example MixedBoundaryDatum.hodge_test (compatibility): The induced graded structures are the supplied HodgeStructure on the native weight-graded quotient.
  Example MixedBoundaryDatum.radical_center_test (non-example): Using all W1 as the torus character group gives rank 3 instead of 1 at the genus-two rank-one cusp and fails.
  Acceptance: For the rank-one Siegel cusp of genus 2, dim U1=1 while dim W1=3.
  Acceptance: For a pure datum the unipotent radical is zero and the entire adjoint Lie algebra remains in weight zero.

ShimuraCompactifications:C1/boundary-mixed-hodge-structure — TauCeti.ShimuraCompactifications.C1.boundary_mixed_hodge_structure
  construction: For a rational representation of the boundary group P1 and a chosen invariant integral lattice, construct the native mixed Hodge structure induced by h1, with its genuine rational/complex base changes. If the representation is the restriction of a rational representation of the original group P, Pink 4.12 compares corresponding points x and x1: the Hodge filtration is unchanged while the weight filtration changes. This comparison is not asserted for an arbitrary P1 representation that does not extend to P. For the boundary adjoint representation, the weight steps are Lie U1, Lie W1 and Lie P1, with graded types (-1,-1), {(-1,0),(0,-1)} and {(-1,1),(0,0),(1,-1)}.
  Hypotheses: Use mixed-boundary-datum and the chosen rational/integral representation with genuine rational and complex base-change models. Do not postulate a canonical integral lattice in every rational representation. For Hodge-filtration agreement, fix an ambient rational P representation, restrict it to P1, and use the associated points x and x1 of Pink 4.12. The independent boundary adjoint calculation does not assert that the P1 adjoint representation extends to P.
  API BoundaryMHS.weight_adjoint (characterisation): Its weight steps identify with the three specified Lie subobjects.
  API BoundaryMHS.hodge_boundary_eq (compatibility): For a rational representation of P restricted to P1 and the corresponding x,x1 of Pink 4.12, the original and boundary Hodge filtrations agree on the same complexified representation.
  API BoundaryMHS.map (functoriality): Representation maps are morphisms of the native mixed Hodge structures and are strict by the owner API.
  API BoundaryMHS.native_filtrations (compatibility): The returned native mixed Hodge structure has exactly the h1-induced WQ and F on the specified base-change models; its graded Hodge filtration is the induced quotient filtration of the pinned carrier.
  Example BoundaryMHS.pure_test (degenerate): For a pure boundary group W1=1, W_-1=0 and W_0=Lie P1.
  Example BoundaryMHS.siegel2_test (computation): At a genus-two rank-one cusp, gr_-2 has dimension 1 and gr_-1 dimension 2.
  Example BoundaryMHS.graded_test (compatibility): The graded Hodge filtration is exactly the induced quotient filtration, not an unrelated pure structure.
  Acceptance: The pure quotient has weight zero adjoint Lie algebra.
  Acceptance: The commutator lands in the weight-minus-two piece rather than identifying it with gr_-1.

ShimuraCompactifications:C1/boundary-torsor-tower — TauCeti.ShimuraCompactifications.C1.boundary_torsor_tower
  construction: At a neat boundary level, construct the mixed arithmetic boundary quotient as a torus torsor over an abelian-scheme torsor over a finite cover of the pure boundary Shimura variety. Its torus comes from the arithmetic lattice in U1, and its abelian directions from W1/U1. The commutator determines the Poincare/cubical torsor class. This is the boundary part of mixed Shimura theory; canonical models of the special mixed torsors required for descent are a separate supplier request.
  Hypotheses: Use mixed-boundary-datum, its Hodge structure and the actual arithmetic lattices from K. Assume neatness for the asserted torsor form; at non-neat level retain finite stabilizer quotients. Use the exact central lattice Gamma_U(-1) and the weight-minus-one lattice; they are not interchangeable.
  API BoundaryTorsor.torusCharacters (characterisation): The character lattice is dual to the actual integral U1 lattice.
  API BoundaryTorsor.abelianQuotient (projection): The quotient by the central torus is the constructed abelian torsor over the pure boundary base.
  API BoundaryTorsor.levelChange (functoriality): Specified level changes induce the lattice/torsor maps and commute with rational conjugation.
  Example BoundaryTorsor.siegel2_klingen_test (computation): The genus-two rank-one cusp has torus rank 1 and an elliptic abelian direction.
  Example BoundaryTorsor.siegel2_siegel_test (degenerate): The maximal genus-two cusp has torus rank dim Sym²(Z²)=3 and abelian dimension zero.
  Example BoundaryTorsor.nontrivial_test (non-example): A nontrivial character line gives a nontrivial torus torsor, not a chosen product with G_m.

ShimuraCompactifications:C1/cusp-label — TauCeti.ShimuraCompactifications.C1.cusp_label
  definition: Define an adelic cusp label from the existing rational boundary component/parabolic, its boundary mixed datum and the finite-adelic level representative. Quotient by the actual rational conjugation, boundary arithmetic action and right-K action. A cone label adds a cone in that cusp's common lattice and uses the compatible induced equivalence. Neither a representative nor a connected/irreducible component of its boundary base is identified with the entire equivalence class.
  Hypotheses: Fix a pure Shimura datum (G,X), compact open K and its actual arithmetic component quotients from V0. Cones and lattices are the common toric carriers; the fans are compatible arithmetic-admissible systems from C0. No universal abelian scheme is assumed for this datum. The mixed boundary datum and the finite adelic double-coset description are supplied; use Pink's finite cover X1.
  API CuspLabel.representative_invariant (relation): All elementary rational/level transformations give the same cusp class.
  API CuspLabel.cone_transport (functoriality): The label equivalence transports cones through the specified integral map.
  API CuspLabel.finite (structure): At finite level the cusp classes are finite; complete admissible cone systems have finitely many cone-label orbits.
  API CuspLabel.mk (constructor): A genuine boundary/cusp representative with its finite-adelic level data defines its class in the equivalence quotient.
  API CuspLabel.eq_iff (characterisation): Two representatives have equal cusp labels exactly when they are related by the source's specified rational/level elementary equivalence; no chosen representative is part of a quotient label.
  Example CuspLabel.modular_test (computation): For GL2-type modular data cusp labels reduce to the standard rational-cusp double cosets with their level width.
  Example CuspLabel.representative_test (compatibility): Right multiplication by K gives the identical cusp class.
  Example CuspLabel.component_test (non-example): A cusp base with two connected components has one admissible cusp class but two possible component strata; they are not collapsed.
  Acceptance: Changing a representative by an allowed action does not change the stratum label.
  Acceptance: Labels never force a disconnected boundary base to be irreducible.

ShimuraCompactifications:C1/arithmetic-stabilizer — TauCeti.ShimuraCompactifications.C1.arithmetic_stabilizer
  theorem: Construct the cusp normalizer quotient Delta1 and its effective action on U1/lattices. For polyhedral cones sigma,tau in the rational closure, the set of EFFECTIVE arithmetic images gamma for which gamma(sigma) intersects tau in the open positivity cone is finite. Identify the ineffective kernel up to the specified central/arithmetic subgroups. Cone stabilizers act through finite groups; neatness removes the relevant effective finite cone action. Do not assert that the full normalizer is finite or that a merely neat level removes every central kernel.
  Hypotheses: Use Pink 6.18 definitions and the positivity cone from the actual boundary datum. Both cones are in the appropriate rational closure. The finite-overlap conclusion uses the arithmetic reduction input for the homogeneous positivity cone, requested from AA.3/V2.

ShimuraCompactifications:C1/boundary-incidence — TauCeti.ShimuraCompactifications.C1.boundary_incidence
  theorem: Identify the positivity cone C(P1,X1) and its rational closure as the union of the cones of incident rational boundary data. For a pure initial datum the cone is open convex nondegenerate homogeneous self-adjoint in U1(R); general mixed reductions may carry lineality and require the quotient in Pink 4.15. Prove nested-boundary and rational-conjugation formulas on groups, central lattices, torsors and cones, preserving the V2 analytic incidence relation.
  Hypotheses: Fix a pure Shimura datum (G,X), compact open K and its actual arithmetic component quotients from V0. No universal abelian scheme is assumed for this datum. Use the exact embedded central spaces and quotient maps of Pink 4.22–4.25; C* need be neither open nor closed.
  Acceptance: For Siegel maximal cusps C is the positive-definite symmetric cone; C* includes positive-semidefinite forms with rational radical.
  Acceptance: Do not replace C* by the topological closure with irrational-radical boundary points.

### ShimuraCompactifications:C2

ShimuraCompactifications:C2/partial-boundary-charts — TauCeti.ShimuraCompactifications.C2.partial_boundary_charts
  construction: Construct first the ambient analytic torus embedding Y for the C1 boundary datum and its C0 cone system. Its ordinary finite regular split charts are analytifications of the supplied relative toric embeddings, preserving character functions, face opens and orbit strata. The chart used for arithmetic gluing is the controlled open subspace Ubar=Int_Y(closure_Y(U0)) of Pink 6.13, where U0 is the image of the original positive domain X+ in the boundary mixed-domain quotient at the chosen level. U0 is dense and open in Ubar. Retain the actual analytic monoid algebra for nonregular cones and nilpotents in the ambient analytic category; a regular ambient chart does not make Ubar the entire affine chart.
  Hypotheses: Fix a pure Shimura datum (G,X), compact open K and its actual arithmetic component quotients from V0. Cones and lattices are the common toric carriers; the fans are compatible arithmetic-admissible systems from C0. No universal abelian scheme is assumed for this datum. Complex analytic spaces include nilpotents, structure sheaves, open gluing, fibre products and group actions. These are supplied by ComplexComparisonPartII:C0, with its still-open carrier gap exposed. Retain the embedding X+ into the boundary domain and its positivity conditions from C1/boundary-incidence. U0 is the original-domain image, not the whole open torus torsor of Y.
  API PartialBoundaryChart.openTorsor (structure): The boundary torus torsor is an equivariant open subspace of the ambient embedding Y; the original positive-domain image U0 is an equivariant dense open subspace of the controlled chart Ubar.
  API PartialBoundaryChart.faceOpen (functoriality): A face gives the ordinary ambient open immersion obtained by analytifying the relative toric face map. The elementary identifications used in gluing restrict to the controlled positive-domain opens.
  API PartialBoundaryChart.anchor (compatibility): A finite regular trivialized ambient complex chart identifies with the anchor chart, preserving characters and strata. The controlled chart is the specified open subspace inside this identification.
  API PartialBoundaryChart.glue_hom (universal-property): Compatible analytic maps on the controlled opens, agreeing under the restricted elementary-identification cocycle, glue uniquely to the arithmetic partial boundary space. Ambient monoid charts retain the nilpotent-preserving analytic structure.
  Example PartialBoundaryChart.zero_test (degenerate): The ambient zero cone adds no boundary and returns its torus torsor; restricting to the controlled chart returns U0.
  Example PartialBoundaryChart.rankOne_test (computation): At the standard rank-one cusp the ambient ray chart is A1_C with G_m open, but q=exp(2 pi i z), Im(z)>0 gives the controlled chart |q|<1 with punctured-disc interior. Using all of A1_C as the controlled chart fails.
  Example PartialBoundaryChart.nilpotent_test (non-example): For the ambient analytification functor, a nonreduced finite-type base keeps the epsilon class; passing to the reduced manifold fails. This tests the ambient carrier, not nilpotents in the original reduced Shimura domain.
  Acceptance: The ambient zero-cone chart is the original torsor. Its controlled open is U0, rather than necessarily the entire torsor.
  Acceptance: Nilpotent-preserving analytification is required for the ambient functor. At a standard rank-one cusp q=exp(2 pi i z), Im(z)>0 gives U0={0<|q|<1} inside the ambient C*; Ubar={|q|<1} inside the ambient C.

ShimuraCompactifications:C2/quotient-separation — TauCeti.ShimuraCompactifications.C2.quotient_separation
  theorem: The elementary relation on partial boundary charts admits actual local quotient neighbourhoods by the cusp normalizer, has closed graph, and yields a Hausdorff complex analytic quotient with finite effective local stabilizers. Quotient invariant sheaves supply the local analytic structure. Neatness removes the effective finite stabilizer at smooth cone charts; arbitrary level retains the finite quotient, without asserting smoothness.
  Hypotheses: Fix a pure Shimura datum (G,X), compact open K and its actual arithmetic component quotients from V0. Cones and lattices are the common toric carriers; the fans are compatible arithmetic-admissible systems from C0. No universal abelian scheme is assumed for this datum. Use Pink's controlled neighbourhoods V1→V2→V3 in the rational Satake space, with V2/satake-compactness and its local topology/reduction contract. The ineffective center is removed through the specified quotient action; finiteness of the full cusp group is not assumed. The elementary relation is on the controlled positive-domain opens Ubar of partial-boundary-charts, not on every point of the full ambient torus embedding.
  Acceptance: A finite nontrivial stabilizer may give a normal singular quotient.
  Acceptance: Closed graph is a proved input, not an automatic consequence of finite cone orbits.

ShimuraCompactifications:C2/arithmetic-gluing — TauCeti.ShimuraCompactifications.C2.arithmetic_gluing
  construction: Glue the local arithmetic quotient charts by Pink's rational conjugation, adelic-level and nested-boundary transitions to construct the actual analytic toroidal space Sh_K^tor(Sigma). It contains the original Sh_K(C), has the cone/cusp orbit stratification, and agrees with each controlled quotient neighbourhood. The gluing cocycle and effective quotient are part of the construction.
  Hypotheses: Fix a pure Shimura datum (G,X), compact open K and its actual arithmetic component quotients from V0. Cones and lattices are the common toric carriers; the fans are compatible arithmetic-admissible systems from C0. No universal abelian scheme is assumed for this datum. Use the actual analytic-space category, quotient charts and their open transition maps. Completeness is not needed for the local construction; it is needed for compactness. Glue the controlled opens Ubar=Int_Y(closure_Y(U0)) and their restricted elementary identifications from Pink 6.13; the ambient monoid charts alone are not the gluing domains.
  API ToroidalSpace.chart (structure): Each controlled arithmetic quotient neighbourhood embeds as its stated open chart.
  API ToroidalSpace.interior (structure): The original analytic Shimura quotient is the given open subspace.
  API ToroidalSpace.strata (characterisation): The strata are the actual cone-label quotients with the nested-boundary incidence rule.
  API ToroidalSpace.chart_overlap (compatibility): Transition maps on a triple overlap satisfy the cocycle inherited from elementary label actions.
  API ToroidalSpace.descend_hom (universal-property): Compatible invariant maps on the controlled quotient charts, agreeing under all elementary boundary/level identifications, descend uniquely to the glued arithmetic toroidal quotient.
  Example ToroidalSpace.compact_interior_test (degenerate): If the pure Shimura variety has no rational boundary, the toroidal space is the interior.
  Example ToroidalSpace.modular_q_test (computation): A modular cusp of width w gives the usual punctured q-disc plus its q=0 point.
  Example ToroidalSpace.anchor_test (compatibility): A trivialized finite regular chart has the anchor's face-open overlap rather than an unrelated gluing.
  Acceptance: An interior point is not identified with an unrelated cusp representative.
  Acceptance: The construction depends on Sigma through the specified chart system.

ShimuraCompactifications:C2/normal-open-dense — TauCeti.ShimuraCompactifications.C2.normal_open_dense
  theorem: The actual analytic toroidal space is normal and contains Sh_K(C) as an open dense analytic subspace. Nonregular rational saturated monoid charts remain allowed. Normality comes from normal toric chart algebras and finite invariant quotients, not from assuming a smooth compactification exists.
  Hypotheses: Fix a pure Shimura datum (G,X), compact open K and its actual arithmetic component quotients from V0. Cones and lattices are the common toric carriers; the fans are compatible arithmetic-admissible systems from C0. No universal abelian scheme is assumed for this datum. Complex boundary bases are the actual smooth/normal mixed quotient bases; dual monoids are saturated in their character lattices.

ShimuraCompactifications:C2/compactness-properness — TauCeti.ShimuraCompactifications.C2.compactness_properness
  theorem: If the cusp fan system is complete and admissible, the analytic toroidal space is compact. Once algebraized, the resulting algebraic model is proper over its characteristic-zero field. Finite arithmetic orbit control, complete cusp support and the compact minimal/Satake base are all retained.
  Hypotheses: Fix a pure Shimura datum (G,X), compact open K and its actual arithmetic component quotients from V0. Cones and lattices are the common toric carriers; the fans are compatible arithmetic-admissible systems from C0. No universal abelian scheme is assumed for this datum. The system is complete with the required finite cone/cusp orbit conditions. Use the algebraization theorem when asserting algebraic properness.

ShimuraCompactifications:C2/smooth-normal-crossings — TauCeti.ShimuraCompactifications.C2.smooth_normal_crossings
  theorem: At neat level with a smooth admissible fan, the analytic toroidal space is smooth and its boundary is a normal-crossings divisor in the local sense. A global simple/no-self-intersection assertion requires the separate face no-self-identification condition. Compare its regular quotient coordinates with the ordinary coordinate hyperplanes supplied by L4.
  Hypotheses: Fix a pure Shimura datum (G,X), compact open K and its actual arithmetic component quotients from V0. Cones and lattices are the common toric carriers; the fans are compatible arithmetic-admissible systems from C0. No universal abelian scheme is assumed for this datum. K is neat; every cone is regular in the actual central lattice. For the stronger global branch separation impose Pink 7.12(*)/9.20 explicitly.
  Acceptance: Simplicial nonregular cones do not satisfy this smoothness theorem.
  Acceptance: Two locally separate branches can still be globally identified without the extra fan condition.

ShimuraCompactifications:C2/projective-algebraization — TauCeti.ShimuraCompactifications.C2.projective_algebraization
  theorem: A smooth projective admissible fan at neat level gives a projective algebraization of the complete analytic toroidal space, whose ample line comes from the invariant piecewise-linear polarization. For arbitrary level construct the finite quotient algebraic model and its descended ample power. For a general admissible fan without the ample-cover condition construct the algebraic-space algebraization; do not call every proper toroidal algebraic space a projective scheme.
  Hypotheses: Fix a pure Shimura datum (G,X), compact open K and its actual arithmetic component quotients from V0. Cones and lattices are the common toric carriers; the fans are compatible arithmetic-admissible systems from C0. No universal abelian scheme is assumed for this datum. For the projective conclusion use complete projective admissible Sigma. The general algebraic-space conclusion uses the effective analytic/algebraic descent contract and Pink's local ample charts.
  Acceptance: Projectivity records an actual ample line, not only compactness.
  Acceptance: A nonprojective complete fan is not forced into a projective scheme.

ShimuraCompactifications:C2/minimal-boundary-map — TauCeti.ShimuraCompactifications.C2.minimal_boundary_map
  theorem: Construct the continuous analytic comparison from the actual toroidal quotient to the already-owned minimal compactification. On each boundary cone stratum it is the map through the associated pure boundary quotient; its cone-stratum restriction is the specified torus/abelian-torsor quotient map. Preserve the cusp equivalence classes and incidence order; do not assume each entire boundary fibre or stratum is irreducible. Properness is a later consequence of compactness-properness for complete fans and a Hausdorff minimal target; its algebraic form is obtained after projective-algebraization. Neither conclusion is an input to constructing the continuous map.
  Hypotheses: Fix a pure Shimura datum (G,X), compact open K and its actual arithmetic component quotients from V0. Cones and lattices are the common toric carriers; the fans are compatible arithmetic-admissible systems from C0. No universal abelian scheme is assumed for this datum. Use V2's actual Baily–Borel/Satake algebraization and its boundary strata. The source toroidal model is the C2 construction, not a resolution chosen from an existence theorem.
  Acceptance: A cone-label quotient maps to its existing pure boundary stratum.
  Acceptance: The map is independent of the chosen cusp representative.

ShimuraCompactifications:C2/canonical-toroidal-model — TauCeti.ShimuraCompactifications.C2.canonical_toroidal_model
  construction: For a datum class with the actual pure canonical model and the special mixed-boundary canonical torsors supplied, descend the constructed toroidal algebraization to its reflex field E. The canonical model restricts to the supplied pure canonical model and has the specified completed boundary torsor charts. It is a scheme when Pink 12.4's ample-cover condition holds and otherwise an algebraic space as in 12.5. Canonical-model uniqueness on the dense interior determines morphisms after existence; it does not by itself construct boundary descent.
  Hypotheses: Fix a pure Shimura datum (G,X), compact open K and its actual arithmetic component quotients from V0. Cones and lattices are the common toric carriers; the fans are compatible arithmetic-admissible systems from C0. No universal abelian scheme is assumed for this datum. Supply the canonical models of the actual boundary pure data and their special mixed torus/abelian torsors, reflex-field compatibility and dense special mixed points. V8 supplies pure functoriality; its general completion is instantiated only in C2.general. The fan is rational and compatible with the descent actions. Scheme effectivity requires the explicit ample-line-cover hypothesis.
  API ToroidalCanonicalModel.interior (compatibility): Restriction to Sh_K is the actual canonical model over E.
  API ToroidalCanonicalModel.boundaryCompletion (characterisation): Each labelled completed neighbourhood is the specified mixed canonical torsor embedding over E.
  API ToroidalCanonicalModel.descent_cocycle (structure): The Galois descent isomorphisms obey the cocycle and preserve the labelled boundary maps.
  API ToroidalCanonicalModel.unique (extensionality): Two effective descent models with the prescribed complex comparison and mixed boundary canonical identifications have the unique comparison isomorphism compatible with those data, by the specified descent/uniqueness theorem.
  Example ToroidalCanonicalModel.empty_boundary_test (degenerate): For a compact Shimura variety the construction is its original canonical model.
  Example ToroidalCanonicalModel.baseChange_C_test (compatibility): Base change and analytification recover the C2 toroidal quotient with its original charts.
  Example ToroidalCanonicalModel.modular_cusp_test (computation): For a modular cusp the descended completed ring is the cyclotomic cusp ring with its width-normalized q parameter.
  Acceptance: The dense-open pure canonical model agrees with the supplied one.
  Acceptance: An arbitrary formal chart isomorphism is not taken as an ordinary open overlap.

### ShimuraCompactifications:C2.general

ShimuraCompactifications:C2.general/general-toroidal-descent — TauCeti.ShimuraCompactifications.C2_general.general_toroidal_descent
  theorem: Instantiate the C2 descent construction for every pure Shimura datum using V8.general's actual general canonical tower/minimal models and the requested general boundary mixed canonical torsors. Preserve the existing rational boundary, cusp stabilizer and cone labels, together with the algebraic-space versus ample-cover scheme distinction. This adds no universal abelian scheme and no integral model at bad primes.
  Hypotheses: Fix a pure Shimura datum (G,X), compact open K and its actual arithmetic component quotients from V0. Cones and lattices are the common toric carriers; the fans are compatible arithmetic-admissible systems from C0. No universal abelian scheme is assumed for this datum. Use ShimuraVarieties:V8.general/general-tower and general-minimal, plus the special mixed-boundary canonical supplier in exactly the datum class needed by Pink 12.4–12.5.

### ShimuraCompactifications:C3

ShimuraCompactifications:C3/refinement-map — TauCeti.ShimuraCompactifications.C3.refinement_map
  construction: For a compatible refinement Sigma′ of Sigma at fixed datum and level, construct the canonical proper map Sh_K^tor(Sigma′)→Sh_K^tor(Sigma), restricting to the identity on the interior and to the shared ordinary toric refinement maps in each finite regular split chart. Identity and composition are canonical equalities of maps. The C5 integral version uses its actual degeneration-chart atlas and is a separate instantiation of this map contract.
  Hypotheses: Fix a pure Shimura datum (G,X), compact open K and its actual arithmetic component quotients from V0. Cones and lattices are the common toric carriers; the fans are compatible arithmetic-admissible systems from C0. No universal abelian scheme is assumed for this datum. Sigma′ refines Sigma with unchanged cusp support. Use the actual C2 algebraic models, or the C5 integral models, and compatible boundary torsor data.
  API ToroidalRefinement.interior (compatibility): The open restriction is the identity of the original Shimura model.
  API ToroidalRefinement.comp (functoriality): Maps for successive refinements compose to the map for the composite refinement.
  API ToroidalRefinement.proper (structure): The map is proper under the stated support and model hypotheses.
  API ToroidalRefinement.id (simp): The map for the identity refinement is the identity of the actual toroidal model.
  Example ToroidalRefinement.identity_test (degenerate): Refinement by the identical cone system gives the identity map.
  Example ToroidalRefinement.star_test (computation): The (1,1) star subdivision of the quadrant is the blow-up of A² at the origin.
  Example ToroidalRefinement.anchor_test (compatibility): On a finite regular complex chart the map is exactly the supplied L5 monomial map.

ShimuraCompactifications:C3/level-datum-functoriality — TauCeti.ShimuraCompactifications.C3.level_datum_functoriality
  theorem: Extend a specified level map, rational datum map or Hecke translation to the toroidal models when its induced central lattice maps send every source cone into a target cone. Maps are over the stated reflex-field compositum, preserve labelled boundary strata, and satisfy the source's ordered composition laws. The corresponding normal-level finite quotient is constructed under its exact invariant-fan hypotheses; a level map is not declared etale at the boundary from interior etaleness.
  Hypotheses: Fix a pure Shimura datum (G,X), compact open K and its actual arithmetic component quotients from V0. Cones and lattices are the common toric carriers; the fans are compatible arithmetic-admissible systems from C0. No universal abelian scheme is assumed for this datum. Provide compatible source and target fans for this particular map; use V8's pure finite-level/datum/translation maps and the actual C1 boundary lattice maps.
  Acceptance: The Tate cusp map q↦q^p has boundary ramification even though its generic torus map is etale in characteristic zero.
  Acceptance: A datum map carries the specified reflex-field base change.

ShimuraCompactifications:C3/hecke-span — TauCeti.ShimuraCompactifications.C3.hecke_span
  construction: For a specified Hecke double coset choose compatible fans on its intermediate level and the two endpoints, and construct the ordered toroidal span extending V8's open Hecke span. A common refinement compares any two choices. The construction never claims one fixed fan admits every Hecke operator.
  Hypotheses: Fix a pure Shimura datum (G,X), compact open K and its actual arithmetic component quotients from V0. Cones and lattices are the common toric carriers; the fans are compatible arithmetic-admissible systems from C0. No universal abelian scheme is assumed for this datum. Use the two actual maps at the intersection level K intersect gKg^-1 with the ordered translation convention of V8/hecke-span.
  API ToroidalHeckeSpan.openRestriction (compatibility): The interior span is V8's ordered Hecke span.
  API ToroidalHeckeSpan.commonRefinement (functoriality): Two compatible fan choices compare through a canonical refined span.
  API ToroidalHeckeSpan.boundaryMap (structure): Each arrow maps its cone stratum through the stated cusp/lattice map.
  Example ToroidalHeckeSpan.identity_test (degenerate): The identity double coset gives the identity span after the identity fan choice.
  Example ToroidalHeckeSpan.q_power_test (computation): A rank-one p-isogeny cusp arrow has the prescribed q↦q^p or q′^p=q map, not an etale extension by assumption.
  Example ToroidalHeckeSpan.refinement_test (compatibility): A further intermediate refinement leaves the open Hecke span unchanged.

ShimuraCompactifications:C3/choice-comparison — TauCeti.ShimuraCompactifications.C3.choice_comparison
  theorem: Any two admissible toroidal choices at fixed datum/level admit proper comparison maps from a common compatible refinement. Further common refinements give the same comparison diagrams. Choice independence means these maps and induced sheaf/cohomology identifications; it never means literal equality of all toroidal compactifications.
  Hypotheses: Fix a pure Shimura datum (G,X), compact open K and its actual arithmetic component quotients from V0. Cones and lattices are the common toric carriers; the fans are compatible arithmetic-admissible systems from C0. No universal abelian scheme is assumed for this datum. Both fans satisfy the stated support and compatibility requirements.

ShimuraCompactifications:C3/toric-structure-sheaf-vanishing — TauCeti.ShimuraCompactifications.C3.toric_structure_sheaf_vanishing
  theorem: For a finite rational fan subdivision Sigma′→Sigma with equal support, the proper toric map over any commutative ring R satisfies O→pi_*O as an isomorphism and R^i pi_*O=0 for i>0. State the two assertions independently. The integral monomial Cech proof is universal in R; finite regular complex maps supplied by L5 alone do not contain this cohomological theorem.
  Hypotheses: Use the arbitrary-ring C0 toric realization. Check finite subdivision and support equality; the source need not be asserted smooth for the universal monomial argument. The required integral graded Cech exactness/contractibility lemma is a recorded proof leaf; the source quotation establishes the smooth-refinement applications, and the stronger universal argument must be verified before implementation.

ShimuraCompactifications:C3/refinement-structure-sheaf — TauCeti.ShimuraCompactifications.C3.refinement_structure_sheaf
  theorem: For refinement maps of the actual normal arithmetic toroidal models, O_X→f_*O_X′ is an isomorphism. This degree-zero theorem also holds on the C5 integral models and normalization charts in the exact Lan 2017 setup. It is kept separate from positive-degree vanishing.
  Hypotheses: Use the genuine proper refinement map and the actual ordinary/formal quotient charts. For a changed-level map from the finer level H to the coarser level Hprime, require H normal in Hprime and identify the target functions with the Hprime/H-invariants in the source pushforward. Proposition 7.5 in the inspected author copy reverses these groups; source issue E3 records the correction.
  Acceptance: A strict normal inclusion H in Hprime gives deck group Hprime/H: target functions are its invariants in the finer-level pushforward. Reversing the inclusion or using H/Hprime fails; equal levels recover the ordinary structure-sheaf isomorphism.

ShimuraCompactifications:C3/refinement-higher-structure-sheaf — TauCeti.ShimuraCompactifications.C3.refinement_higher_structure_sheaf
  theorem: For a same-level refinement of the exact C2 or C5 toroidal models, R^i f_*O_X′=0 for every i>0, locally on the target, with the specified coefficient-base-change hypotheses. For Lan 2017 normalized integral models use its projective cone and lattice-collection setup, including the changed-level version only as stated there.
  Hypotheses: The map has the quotient/torsor chart descriptions of the actual construction. Integral coefficient comparisons use the universal toric result or the exact Noetherian/Dedekind reduction of Lan 7.1.1.4. Formal comparison requires proper coherent formal functions; it is not obtained merely by recognizing completed coordinate rings.

ShimuraCompactifications:C3/refinement-boundary-ideal — TauCeti.ShimuraCompactifications.C3.refinement_boundary_ideal
  theorem: For same-level actual toroidal refinements, f_*I_D′=I_D and R^i f_*I_D′=0 for i>0. On a relative toric chart use the strict-positive monomial ideal of the UNION of boundary divisors, distinct from the face ideal of a closed stratum. Over a nonreduced coefficient base this is the base-changed boundary ideal, not its radical. On the good integral models it agrees with the stated reduced Cartier boundary ideal. In general f*I_D is only a subsheaf of I_D′. Changed-level degree-zero statements instead take the finite deck-group invariants under the normal-level hypothesis below.
  Hypotheses: Use the same map/chart/coefficient hypotheses as refinement-higher-structure-sheaf. Cartierty of the boundary twist is asserted only for the stated regular toroidal models. The vanishing concerns the ideal on the source, not a falsely equal pullback ideal. For changed levels in Lan 7.5, the boundary ideal on the coarser Hprime model is the Hprime/H-invariant source pushforward when H is normal in Hprime; use the corrected group direction of E3.
  Acceptance: Blow up (x,y)=(0,0): pullback of (xy) has exceptional order 2 while the new reduced boundary ideal has exceptional order 1.
  Acceptance: For the quadrant the boundary-union ideal is (xy), whereas its closed-stratum ideal is (x,y).
  Acceptance: Changed-level degree-zero identification takes Hprime/H-invariants; it does not identify the entire source boundary-ideal pushforward with the target ideal.

ShimuraCompactifications:C3/coherent-cohomology-invariance — TauCeti.ShimuraCompactifications.C3.coherent_cohomology_invariance
  theorem: For a canonical locally free coefficient E with the supplier comparison f*E=E′, refinement induces isomorphisms H^i(X,E)→H^i(X′,E′) and H^i(X,E tensor I_D)→H^i(X′,E′ tensor I_D′) for every i. Over the good integral base these remain valid for E0 tensor_B M for EVERY B-module M under Lan 7.1.1.4's Dedekind/field and the stated universal-chart hypotheses; M is not silently assumed flat.
  Hypotheses: Canonical/subcanonical bundles and their refined comparison are supplied by AutomorphicBundles:B3/B4, with the requested integral formally-canonical extension. The geometric maps and O/I_D derived comparisons are independently available. For arbitrary modules use the exact coefficient argument: filtered colimits and finite generated module reduction over the Dedekind/field base, or universal integral chart exactness.

ShimuraCompactifications:C3/partial-ordinary-formal-invariance — TauCeti.ShimuraCompactifications.C3.partial_ordinary_formal_invariance
  theorem: Export the O and boundary-ideal derived refinement comparisons locally on each target toroidal chart and on compatible p-adic completions. After the ordinary Igusa owner constructs its actual finite-level/profinite-flat chart towers and quotients, these local comparisons give the independence of canonical and cuspidal coherent cohomology on its partial toroidal compactifications under the specified completed-coefficient and limit hypotheses. No unconstrained inverse-limit/tensor interchange or construction of Igusa varieties is included.
  Hypotheses: Formal bases are the Noetherian p-adic chart models with proper comparison maps. For a profinite-flat or perfectoid limit, require the owner's finite-level descent, completion exactness, inverse-system and completed-tensor theorem. Pilloni's analytic plus-sheaf comparison and completed valuation coefficients belong to AdicSpacesPartII:R3; C3 supplies its algebraic toric input.

ShimuraCompactifications:C3/klingen-correspondence-compactification — TauCeti.ShimuraCompactifications.C3.klingen_correspondence_compactification
  construction: At the analytic Klingen p^n levels constructed by the integral-boundary/adic owners, choose compatible cone systems and compactify the correspondence of (G,H_n,L) from Pilloni 13.2.1. Here L⊂G[p²] is totally isotropic of etale type (Z/p)² direct-sum Z/p² and disjoint from H_n; t1=(G,H_n) and t2=(G/L,([p]^-1(H_n)+L)/L) at level p^(n+1). Extend both arrows through the actual toroidal chart maps. Its asserted positive-degree acyclicity is a separate target.
  Hypotheses: Use exactly the characteristic-zero analytic models/levels of Pilloni 13.2.1. Their integral Klingen/paramodular models are owned by the Part II supplier and are not generalized good-prime C5 models.
  API KlingenToroidalCorrespondence.t1_open (compatibility): The first arrow sends (G,H_n,L) to (G,H_n).
  API KlingenToroidalCorrespondence.t2_open (compatibility): The second arrow is the quotient and inverse-p-image level subgroup stated above.
  API KlingenToroidalCorrespondence.fanComparison (functoriality): Further compatible cone refinements compare the compactified spans.
  Example KlingenToroidalCorrespondence.t1_test (computation): For a triple at level p^n, t1 forgets exactly L and retains H_n.
  Example KlingenToroidalCorrespondence.t2_test (compatibility): The new level subgroup is the image of [p]^-1(H_n)+L in G/L.
  Example KlingenToroidalCorrespondence.empty_test (degenerate): On a base where no eligible L exists, the correspondence fibre is empty rather than an arbitrary chosen subgroup.

ShimuraCompactifications:C3/klingen-correspondence-acyclicity — TauCeti.ShimuraCompactifications.C3.klingen_correspondence_acyclicity
  theorem: For the exact compactified analytic correspondence of klingen-correspondence-compactification, prove (t1)_*O_C→R(t1)_*O_C is a quasi-isomorphism, equivalently R^i(t1)_*O_C=0 for i>0. This is not claimed to follow from properness or from the open map being finite; the boundary chart factorization and analytic-coherent comparison must be supplied.
  Hypotheses: Use the exact source, level, coefficient structure sheaf and analytic comparison setting of Pilloni 13.2.1; integral parahoric vanishing is not inferred.

### ShimuraCompactifications:C3.general

ShimuraCompactifications:C3.general/general-map-descent — TauCeti.ShimuraCompactifications.C3_general.general_map_descent
  theorem: Descend the C3 compatible refinement, level, datum and ordered Hecke maps to the C2.general toroidal canonical models, using V8.general functoriality over the prescribed reflex-field composita. Preserve boundary labels and the common-refinement comparisons, and prove identity/composition after descent. The coefficient vanishing theorems retain their own hypotheses and are not strengthened by this general-data instantiation.
  Hypotheses: Fix a pure Shimura datum (G,X), compact open K and its actual arithmetic component quotients from V0. Cones and lattices are the common toric carriers; the fans are compatible arithmetic-admissible systems from C0. No universal abelian scheme is assumed for this datum. Use the actual general canonical models and the special mixed-boundary descent input, with compatible source/target cone systems for each specified map.

### ShimuraCompactifications:C4

ShimuraCompactifications:C4/semi-abelian-scheme — TauCeti.ShimuraCompactifications.C4.semi_abelian_scheme
  definition: A semi-abelian scheme G over S is a separated smooth commutative group scheme whose geometric fibres are extensions of abelian varieties by tori. Keep the relative dimension and constructible character sheaf of the maximal fibrewise torus. A single global exact sequence by a torus exists under the additional locally constant toric-rank hypothesis; it is not part of the definition for a degenerating family. Smoothness supplies local finite presentation. When an application needs global finite presentation or finite type, retain that additional hypothesis in the application rather than inserting it into Lan's fibrewise definition.
  Hypotheses: Work over the scheme or algebraic-space bases supplied by SF.1, using the existing group-scheme and abelian-scheme carriers. For Lan character/extension theorems retain his locally Noetherian base hypotheses.
  API SemiAbelianScheme.baseChange (functoriality): Every base change preserves the geometric-fibre condition and its smooth group structure, with identity/composition comparisons.
  API SemiAbelianScheme.characterSheaf (projection): Returns the constructible character sheaf with its restriction to each geometric fibre.
  API SemiAbelianScheme.abelianEmbedding (compatibility): An existing abelian scheme gives a semi-abelian scheme with zero character sheaf.
  API SemiAbelianScheme.constantRankExtension (characterisation): Under the locally constant character-rank hypothesis the family is an extension of an abelian scheme by a torus.
  API SemiAbelianScheme.ofGroup (constructor): A genuine separated smooth commutative group scheme with the stated geometric-fibre torus-extension property gives a semi-abelian scheme, without choosing a global torus extension for a rank-jumping family.
  API SemiAbelianScheme.ext (extensionality): On a fixed group-scheme carrier and structure maps, two semi-abelian structures agree because the smooth/separated and geometric-fibre requirements are properties; equality does not require equality of chosen local torus splittings.
  Example SemiAbelianScheme.abelian_test (degenerate): An abelian scheme has toric rank zero.
  Example SemiAbelianScheme.splitTorus_test (compatibility): The pinned rank-r SplitTorus is semi-abelian with character sheaf Z^r and zero abelian quotient.
  Example SemiAbelianScheme.tate_rank_test (computation): The Tate family has generic toric rank zero and boundary toric rank one.
  Example SemiAbelianScheme.additive_test (non-example): G_a is excluded: its geometric fibre is not an extension of an abelian variety by a torus.

ShimuraCompactifications:C4/constructible-character-sheaf — TauCeti.ShimuraCompactifications.C4.constructible_character_sheaf
  theorem: For a semi-abelian scheme G over a locally Noetherian base, construct its etale constructible character sheaf X(G), restricting to the free character lattice of the maximal torus in every geometric fibre. Identify morphisms from a torus T to G with the dual character-sheaf maps in Lan 3.3.1.9, with the exact sheaf direction and specializations retained. On the constant-rank locus this recovers the usual anti-equivalence for tori.
  Hypotheses: Use Lan's constructible etale sheaf setting; no locally constant character lattice is assumed across a rank jump.

ShimuraCompactifications:C4/poincare-extension-classification — TauCeti.ShimuraCompactifications.C4.poincare_extension_classification
  theorem: For an abelian scheme A and an isotrivial torus H with finite-free character sheaf X(H), classify commutative group scheme extensions 0→H→G→A→0 by homomorphisms c:X(H)→A^dual. Lan 3.1.5.1 gives an anti-equivalence of the source categories (and, for fixed A,H, the corresponding classification of extension classes). In Lan's convention the rigidified invertible sheaf for chi corresponds to pushout of the torsor by -chi. Retain this negative-character/inverse-Poincare sign in reconstruction, multiplication, base change and duality; dual abelian schemes and biextensions remain A3/A5 inputs.
  Hypotheses: Use the locally Noetherian base and isotrivial finite-free character data of Lan 4.2.1; do not assert a globally split torus without an etale trivialization.

ShimuraCompactifications:C4/polarized-degeneration-data — TauCeti.ShimuraCompactifications.C4.polarized_degeneration_data
  definition: In the relative setting R,I,S,eta, define the polarized degeneration datum DD_pol of Lan Definition 4.4.6 (using the entries and positivity from 4.2.1.13): an abelian scheme A with polarization lambda_A, isotrivial finite-free sheaves X,Y, an injective phi:Y→X with finite cokernel, maps c:X→A^dual and c^dual:Y→A satisfying lambda_A c^dual=c phi, and a bilinear rigidified trivialization tau of the pullback of the INVERSE Poincare biextension on the generic fibre. Require its cubical/symmetry relations and the I-adic positivity condition: diagonal trivializations yield sections vanishing along I for nonzero y. The period lattice lives on the generic fibre; it is not silently an everywhere-defined map Y→G over S. Its associated generic polarized 1-motive is the complex [Y to G_eta], where G is the torus extension determined by c and the lift of c^dual is the period map determined by tau. This names the degeneration datum already being constructed, not a second generic motivic theory. This polarized tuple omits the additional ample-line and Y-action fields L^sharp and psi of DD_ample; when Mumford reconstruction uses them, derive the auxiliary data as in Remark 4.4.7, keeping track that its displayed choice induces 2 lambda_A.
  Hypotheses: Let R be a Noetherian normal domain, complete for a radical ideal I, S=Spec R and eta=Spec Frac R. Use the isotrivial torus hypothesis and the cubical rigidifications of Lan 4.1 and 4.2.1.1; this relative setting is stronger and more general in its base than the complete-DVR local R11.3 specialization. Retain Lan's ampleness/polarization, positivity and base-change conditions. Use the same local lattice and Raynaud carriers as R11.3 when R is a complete DVR.
  API PolarizedDegenerationData.extension (projection): Returns the actual torus extension of A determined by c.
  API PolarizedDegenerationData.baseChange (functoriality): Admissible complete base changes preserving the ideal and positivity transport all data and rigidifications.
  API PolarizedDegenerationData.localRaynaud (compatibility): For a complete DVR, identifies the datum with the R11.3 polarized Raynaud/lattice input.
  API PolarizedDegenerationData.period_pairing (relation): The period trivialization is bilinear and symmetric with the prescribed phi and inverse-Poincare convention.
  API PolarizedDegenerationData.genericOneMotive (projection): Returns [Y to G_eta] with the actual tau-defined period map and polarization comparison lambda_A c^dual=c phi; it is compatible with admissible base change.
  API PolarizedDegenerationData.iso_iff (extensionality): Structure-preserving isomorphisms of the abelian scheme and the character/period sheaves identify two DD_pol objects precisely when lambda_A,phi,c,c^dual and the rigidified tau commute with those isomorphisms and retain the same positivity data.
  API PolarizedDegenerationData.toAmple (constructor): Remark 4.4.7 derives auxiliary DD_ample data from DD_pol: M=(Id,lambda_A)^*P_A, L^sharp=pi^*M and psi=(Id_Y,phi)^*tau, with the displayed 2phi and induced 2lambda_A retained. This auxiliary construction is not an equality of the two categories.
  Example PolarizedDegenerationData.rankZero_test (degenerate): X=Y=0 gives A with its existing polarization.
  Example PolarizedDegenerationData.tate_test (computation): For X=Y=Z and period q, positivity is v(q)>0 and reconstruction gives the Tate degeneration.
  Example PolarizedDegenerationData.local_test (compatibility): The complete-DVR specialization retains the same character and period lattices as R11.3.
  Example PolarizedDegenerationData.negative_test (non-example): Period q^-1 for v(q)>0 fails the diagonal positivity condition.

ShimuraCompactifications:C4/mumford-quotient — TauCeti.ShimuraCompactifications.C4.mumford_quotient
  construction: From positive polarized degeneration data and a compatible rational polyhedral decomposition, construct the relatively complete torus model, its formal period-lattice quotient and ample descent line. Algebraize the projective formal quotient over the complete base to obtain the semi-abelian degeneration and its generic polarized abelian scheme. The finite-index subgroup Y0 used to make an intermediate ample quotient is comparison data; the final construction descends the full lattice action.
  Hypotheses: Let R be a Noetherian normal domain, complete for a radical ideal I, S=Spec R and eta=Spec Frac R. Use the isotrivial torus hypothesis and the cubical rigidifications of Lan 4.1 and 4.2.1.1; this relative setting is stronger and more general in its base than the complete-DVR local R11.3 specialization. Choose the compatible polarization and fan, preserving the cubical identities and I-adic positivity. Formal schemes and effectivity are imported from their owners, not reconstructed by ad hoc inverse limits.
  API MumfordDegeneration.genericFibre (compatibility): The generic fibre is the polarized abelian scheme uniformized by the specified Raynaud extension and period lattice.
  API MumfordDegeneration.formalCompletion (characterisation): The completion is the constructed formal period quotient with its descended ample line.
  API MumfordDegeneration.fanComparison (functoriality): Compatible subdivisions induce the canonical comparison maps, agreeing on the generic fibre.
  Example MumfordDegeneration.rankZero_test (degenerate): The zero-period-lattice datum returns the original abelian scheme.
  Example MumfordDegeneration.tate_test (computation): The rank-one period q gives G_m/q^Z on the generic analytic fibre.
  Example MumfordDegeneration.refinement_test (compatibility): Changing to a compatible subdivision changes the model by its toroidal comparison, preserving the generic uniformization.
  Acceptance: Torus rank zero returns A.
  Acceptance: A positive rank-one datum gives the Tate family and its proper formal quotient.

ShimuraCompactifications:C4/degeneration-effectivity — TauCeti.ShimuraCompactifications.C4.degeneration_effectivity
  theorem: Under Lan's complete normal-base and positivity hypotheses, the functor extracting polarized degeneration data from semi-abelian degenerations with polarized abelian generic fibre is an equivalence with the groupoid DD_pol(R,I) of Definition 4.4.6. Prove full faithfulness and essential surjectivity separately, retaining the auxiliary cubical line construction and the structure-preserving isomorphisms used as morphisms in the polarized categories. The complete-DVR local specialization is imported from R11.3; this target is its relative effectivity extension.
  Hypotheses: Let R be a Noetherian normal domain, complete for a radical ideal I, S=Spec R and eta=Spec Frac R. Use the isotrivial torus hypothesis and the cubical rigidifications of Lan 4.1 and 4.2.1.1; this relative setting is stronger and more general in its base than the complete-DVR local R11.3 specialization. Use exactly the degeneration categories and polarization requirements of Lan 4.4.1–4.4.16. An arbitrary singular complete ring outside this normal-domain setting is not covered. For the polarized equivalence the morphisms are structure-preserving isomorphisms in DEG_pol and DD_pol. This is not an equivalence of categories with all generic homomorphisms as arrows.

ShimuraCompactifications:C4/formal-universal-degeneration — TauCeti.ShimuraCompactifications.C4.formal_universal_degeneration
  construction: For the PEL cusp label, construct the universal positive degeneration datum over the formal completion of its relative torus embedding and apply the relative effectivity equivalence. Obtain the formal semi-abelian family with its polarization, torus characters, abelian quotient and generic PEL family, compatible with admissible faces and changes of cusp representative.
  Hypotheses: Fix the PEL datum, its order, lattice, pairing and reflex field F0 from M1. Let B=Spec(O_F0,(S)) for a set S of good primes in Lan 1.4.1.1: no prime divides the level integer n, Ibad or Disc[L# : L]. Retain the order/unramifiedness, polarization-defect and quaternionic p=2 restrictions of M2; H has the specified prime-to-S level. No bad-prime smoothness is inferred. Complete along the specified positive monomial degeneration ideal; use the exact cusp base and formal chart rather than the completion of the entire boundary without isolating its stratum.
  API UniversalDegeneration.character (projection): The toric character sheaf is the cusp label's specified X.
  API UniversalDegeneration.genericPEL (compatibility): Its generic restriction identifies with the given PEL family and polarization.
  API UniversalDegeneration.faceRestriction (functoriality): Allowed face and representative maps preserve the universal degeneration datum and its reconstruction.
  Example UniversalDegeneration.rankZero_test (degenerate): At zero toric rank the family is the lower-dimensional universal abelian family.
  Example UniversalDegeneration.tate_test (computation): For a modular cusp the universal period is q and the invariant fibre differential is du/u.
  Example UniversalDegeneration.representative_test (compatibility): Equivalent cusp representatives induce isomorphic families through the prescribed descent map.

ShimuraCompactifications:C4/homomorphism-extension — TauCeti.ShimuraCompactifications.C4.homomorphism_extension
  theorem: Let S be a locally Noetherian normal scheme, U a dense open and G,H semi-abelian schemes over S. Restriction Hom_S(G,H)→Hom_U(G_U,H_U) is bijective: every generic-open homomorphism extends uniquely. State the same result over the algebraic-space bases by effective etale descent. Smoothness of an unrelated open moduli space does not supply this extension theorem.
  Hypotheses: Retain normality of S, dense U and the semi-abelian family hypotheses of Lan 3.3.1.5 / Faltings–Chai I.2.7.

ShimuraCompactifications:C4/endomorphism-extension — TauCeti.ShimuraCompactifications.C4.endomorphism_extension
  theorem: Extend the generic O-action on the universal semi-abelian family uniquely across the normal boundary base. The extension remains a ring action and preserves the specified polarization/Rosati relations because these identities hold densely. Keep polarization morphisms and their duality in the actual degeneration category; no nonexistent dual semi-abelian scheme is presumed.
  Hypotheses: Fix the PEL datum, its order, lattice, pairing and reflex field F0 from M1. Let B=Spec(O_F0,(S)) for a set S of good primes in Lan 1.4.1.1: no prime divides the level integer n, Ibad or Disc[L# : L]. Retain the order/unramifiedness, polarization-defect and quaternionic p=2 restrictions of M2; H has the specified prime-to-S level. No bad-prime smoothness is inferred. Use the family from formal-universal-degeneration and its admissible algebraizations; its endomorphism identities are checked on the common dense generic restriction.

ShimuraCompactifications:C4/boundary-level-comparison — TauCeti.ShimuraCompactifications.C4.boundary_level_comparison
  theorem: Compare the prescribed prime-to-S level data on the generic PEL family with the degeneration lattice/torus data on a cusp chart and extend the allowed finite-etale tame part. At p-power level retain the actual higher-level normalization and its ramified monomial map. An etale level torsor on the open locus need not extend etale over the boundary; do not replace a q↦q^p cusp map by an etale cover.
  Hypotheses: Fix the PEL datum, its order, lattice, pairing and reflex field F0 from M1. Let B=Spec(O_F0,(S)) for a set S of good primes in Lan 1.4.1.1: no prime divides the level integer n, Ibad or Disc[L# : L]. Retain the order/unramifiedness, polarization-defect and quaternionic p=2 restrictions of M2; H has the specified prime-to-S level. No bad-prime smoothness is inferred. For p-level comparison use a fixed normalization model with its actual generic level map; the formal degeneration statement alone does not identify that model with a parahoric moduli problem.

ShimuraCompactifications:C4/extended-isogeny-kernel — TauCeti.ShimuraCompactifications.C4.extended_isogeny_kernel
  theorem: For the semi-abelian boundary families and the isogenies in Boxer–Pilloni Lemma 4.2.2, extend the isogeny and a chosen inverse up to multiplication. Prove the asserted quasi-finite flat morphism and kernel properties under those exact degeneration hypotheses. The kernel can fail to be finite and its order can jump at the boundary; it is not a finite locally free group of constant rank over the whole base.
  Hypotheses: Use the source's normal boundary base, compatible family and generic p-power isogeny. Extension is supplied by homomorphism-extension; quasi-finiteness/flatness require the further semi-abelian degeneration argument.

ShimuraCompactifications:C4/tate-degeneration-comparison — TauCeti.ShimuraCompactifications.C4.tate_degeneration_comparison
  theorem: Restrict the relative polarized construction to toric rank one and identify it with the Tate curve/generalized elliptic degeneration and n-gon objects imported from R13.1–R13.3. Compare periods, polarization, invariant relative differential du/u, torsion and the actual base-parameter maps under the two standard p-isogenies. Keep the generic torsion exact sequence and special-fibre rank loss visible.
  Hypotheses: Use the dimension-one generalized elliptic curve and Tate n-gon suppliers; those objects are not constructed again here. For a Tate parameter q with positive valuation, distinguish u↦u^p and identity-on-u quotient maps and their corresponding period/base changes.

ShimuraCompactifications:C4/tate-log-kodaira-spencer — TauCeti.ShimuraCompactifications.C4.tate_log_kodaira_spencer
  theorem: For the imported Tate family, its polarization and invariant Hodge line E, compute the Kodaira–Spencer comparison E^tensor2→Omega^1_base(log boundary) with the source's normalization: (du/u)^tensor2 maps to dq/q up to the explicitly fixed sign/unit convention. Under q↦q^p the base logarithmic differential pulls back to p dq/q. This is a Kodaira–Spencer isomorphism between the stated bundles, not an equality between the relative fibre differential sheaf and the base differential sheaf.
  Hypotheses: Use the normalized polarization and Tate parameter of R13.1–R13.3 and the logarithmic Kodaira–Spencer supplier; retain characteristic and level conditions where p is not invertible.

ShimuraCompactifications:C4/semiabelian-tate-module — TauCeti.ShimuraCompactifications.C4.semiabelian_tate_module
  construction: For a semi-abelian variety J over a characteristic-zero field k in an exact sequence 0→T→J→A→0, form the full profinite Tate module TJ=inverse-limit_n J[n](kbar), indexed by positive integers under divisibility with transition [n/m] from n-torsion to m-torsion for m dividing n. Import the general compact coefficient carrier and prove the continuous G_k-equivariant exact sequence 0→TT→TJ→TA→0. Primewise restriction gives the same exact sequence of Z_l-modules; for split T=G_m^r, TT=Zhat(1)^r. The generalized Jacobian and its anabelian application remain consumer constructions.
  Hypotheses: Characteristic zero, a chosen algebraic closure and the actual torus extension J. Each torsion group is taken on geometric points with its finite discrete topology; compact inverse-limit exactness is imported from R02.1. The transition maps are multiplication n/m, not inclusions of torsion sets. No extension of this all-prime characteristic-zero statement to a rank-jumping family is asserted.
  API SemiAbelianTateModule.exact (structure): The maps induced by T→J→A give the continuous exact full Tate sequence.
  API SemiAbelianTateModule.primewise (compatibility): The l-primary factor is the usual inverse limit of J[l^n], compatible with the exact sequence.
  API SemiAbelianTateModule.map (functoriality): Homomorphisms of torus extensions induce continuous equivariant maps, preserving identity and composition.
  API SemiAbelianTateModule.splitTorus (characterisation): For G_m^r the module is Zhat(1)^r with the cyclotomic Galois action.
  API SemiAbelianTateModule.torsionProjection (projection): The full module maps continuously to each J[n] in the divisibility-indexed system; for n|m the transition is multiplication by m/n, and these maps agree with the imported primewise comparison.
  Example SemiAbelianTateModule.Gm_test (computation): For J=G_m, the full Tate module is Zhat(1), not the trivial-action Zhat.
  Example SemiAbelianTateModule.abelian_test (degenerate): For T=0 the construction is the supplied abelian full Tate module TA.
  Example SemiAbelianTateModule.product_test (compatibility): For J=T×A the exact sequence splits as TT×TA with the supplied actions.
  Example SemiAbelianTateModule.transitions_test (non-example): An inclusion J[m]→J[n] when m divides n has the wrong direction and does not define this inverse system.
  Acceptance: The full sequence is continuous, exact and Galois-equivariant.
  Acceptance: The transition direction and split-torus Tate twist are explicit.

### ShimuraCompactifications:C5

ShimuraCompactifications:C5/good-algebraic-model — TauCeti.ShimuraCompactifications.C5.good_algebraic_model
  construction: For each chosen complete cone/cusp degeneration chart, construct Lan's ordinary good algebraic model with its extended PEL semi-abelian family and the prescribed formal identification. Retain both ring embeddings i_nat,i_alg:R_alg→R^hat, where R^hat is the completion of the strict local toric-chart ring at the selected geometric point along its stratum ideal; they need not agree. The model must be a strata-preserving etale finite-type neighbourhood of the toric chart with the specified dense interior, rather than a formal model declared to be algebraic.
  Hypotheses: Fix the PEL datum, its order, lattice, pairing and reflex field F0 from M1. Let B=Spec(O_F0,(S)) for a set S of good primes in Lan 1.4.1.1: no prime divides the level integer n, Ibad or Disc[L# : L]. Retain the order/unramifiedness, polarization-defect and quaternionic p=2 restrictions of M2; H has the specified prime-to-S level. No bad-prime smoothness is inferred. Use Lan 6.3.2.5 including its normal base, comparison of natural and algebraic embeddings, and the approximation hypotheses corrected by the author's errata. The cone is nondegenerate and smooth, as in Definition 6.3.2.5. Retain conditions (3a),(3b) for the PEL/degeneration comparisons under the two R_alg embeddings and (3c) for the logarithmic Kodaira–Spencer isomorphism; these embeddings are not merely maps of a common fraction field.
  API GoodCuspModel.formalComparison (equivalence): Completion at the specified boundary ideal identifies with the given universal formal chart, preserving PEL data.
  API GoodCuspModel.openPEL (compatibility): The dense open maps etale to the M2 PEL space with its actual universal family.
  API GoodCuspModel.embeddings (projection): Returns the two actual maps R_alg→R^hat separately, together with conditions (3a),(3b) for the PEL/degeneration structures and (3c) for logarithmic Kodaira–Spencer.
  Example GoodCuspModel.rankZero_test (degenerate): A zero-rank chart recovers an etale chart of the open M2 space.
  Example GoodCuspModel.tate_test (computation): The rank-one completion has the actual q-adic Tate degeneration.
  Example GoodCuspModel.twoEmbeddings_test (non-example): Forcing i_nat=i_alg as part of the definition rejects the source's permitted approximation models.

ShimuraCompactifications:C5/etale-chart-relation — TauCeti.ShimuraCompactifications.C5.etale_chart_relation
  theorem: Let U_H be the finite disjoint union of the chosen smooth good algebraic models and the open PEL atlas, and let U_H[0] be its interior. Form R_H[0]=U_H[0]×_(M_H)U_H[0], representing interior PEL-family identifications. Define R_H as the relative normalization of U_H×_B U_H in R_H[0], as in the paragraph following Lan Remark 6.3.3.12. Extend the tautological interior family isomorphism to R_H; prove both projections R_H→U_H etale and verify the diagonal, symmetry and composition of Corollary 6.3.3.14. This construction uses normalization of the interior relation, not the entire unrestricted isomorphism functor of all boundary families.
  Hypotheses: Fix the PEL datum, its order, lattice, pairing and reflex field F0 from M1. Let B=Spec(O_F0,(S)) for a set S of good primes in Lan 1.4.1.1: no prime divides the level integer n, Ibad or Disc[L# : L]. Retain the order/unramifiedness, polarization-defect and quaternionic p=2 restrictions of M2; H has the specified prime-to-S level. No bad-prime smoothness is inferred. Use Lan's selected charts and equivalence-class labels; charts with unrelated function-field embeddings cannot simply be identified pointwise. Use the smooth compatible cone collection of Definition 6.3.3.4 and the selected etale models of Definition 6.3.2.5. The normalizations and overlap laws use the exact source embeddings and component labels.
  Acceptance: Both projections are etale.
  Acceptance: The cocycle is an ordinary algebraic-space relation, not a stipulated formal quotient.

ShimuraCompactifications:C5/integral-toroidal-space — TauCeti.ShimuraCompactifications.C5.integral_toroidal_space
  construction: For the smooth compatible collection Sigma of Lan Definition 6.3.3.4, form M_H,Sigma^tor=[U_H/R_H] over the stated good base B with its descended semi-abelian PEL family and cusp/cone stratification. The quotient is a finite-type separated smooth algebraic stack; it is an algebraic space at neat level. Complete fans give properness through valuative-properness. Projective choices give a scheme through ample descent. Keep finite stabilizer quotients at non-neat level before taking any coarse space; this theorem does not assert smoothness of that coarse space. The ordinary construction here does not cover arbitrary nonsmooth fans; the normalized projective construction is separate.
  Hypotheses: Fix the PEL datum, its order, lattice, pairing and reflex field F0 from M1. Let B=Spec(O_F0,(S)) for a set S of good primes in Lan 1.4.1.1: no prime divides the level integer n, Ibad or Disc[L# : L]. Retain the order/unramifiedness, polarization-defect and quaternionic p=2 restrictions of M2; H has the specified prime-to-S level. No bad-prime smoothness is inferred. Sigma is the complete compatible collection of SMOOTH admissible cone decompositions in Definition 6.3.3.4, satisfying Condition 6.2.5.25 and the surjection compatibility in Condition 6.3.3.2. Retain Lan's standing PEL conditions, including Condition 1.4.3.10 and Convention 6.2.1.1. The neat no-self-intersection assertion uses the source's actual compatibility condition, rather than neatness alone on an arbitrary fan.
  API IntegralToroidalModel.openImmersion (projection): The interior is an open immersion of the actual good-prime PEL moduli space.
  API IntegralToroidalModel.universalSemiAbelian (projection): Returns the descended universal semi-abelian family with polarization and O-action.
  API IntegralToroidalModel.chart (characterisation): The chosen good algebraic models are its etale boundary atlas with the prescribed family identifications.
  API IntegralToroidalModel.genericComparison (compatibility): Characteristic-zero base change agrees with the C2 canonical toroidal model for the same PEL datum and fan.
  API IntegralToroidalModel.descend_hom (universal-property): For the neat effective etale quotient, maps to an algebraic space correspond to maps from U_H compatible with its ACTUAL normalized relation R_H and its two projections. Retain quotient-stack descent at non-neat level.
  Example IntegralToroidalModel.interior_test (compatibility): Restricting the atlas and family to the interior returns the M2 moduli object.
  Example IntegralToroidalModel.modular_test (computation): At a dimension-one cusp the completion carries the imported Tate generalized elliptic degeneration.
  Example IntegralToroidalModel.badPrime_test (non-example): Removing a prime dividing the level from the good-prime restriction does not produce a smooth model by this construction.
  Acceptance: The open subspace is the actual M2 algebraic space.
  Acceptance: The family restricts to its universal abelian family and becomes semi-abelian at the boundary.

ShimuraCompactifications:C5/formal-completion — TauCeti.ShimuraCompactifications.C5.formal_completion
  theorem: For each cusp/cone equivalence class, identify the completion of its appropriate open stratum neighbourhood in M_H,Sigma^tor with the specified universal formal torus-embedding chart modulo its actual stabilizer. Remove closures of the other strata as in Lan 6.4.1.1(5) before completing. Preserve the family, Hodge bundles, O-action and level data. Do not infer a map between completions along different centers from an unrelated chart inclusion.
  Hypotheses: Fix the PEL datum, its order, lattice, pairing and reflex field F0 from M1. Let B=Spec(O_F0,(S)) for a set S of good primes in Lan 1.4.1.1: no prime divides the level integer n, Ibad or Disc[L# : L]. Retain the order/unramifiedness, polarization-defect and quaternionic p=2 restrictions of M2; H has the specified prime-to-S level. No bad-prime smoothness is inferred. Use the same smooth compatible Sigma as integral-toroidal-space, and the exact stratum neighbourhood with its ordinary scheme-theoretic ideal. At non-neat level retain the source stack and stabilizer quotient; singular higher-level normalizations require their separate formal comparison.

ShimuraCompactifications:C5/valuative-properness — TauCeti.ShimuraCompactifications.C5.valuative_properness
  theorem: For the complete smooth compatible cusp system of the ordinary construction and good-prime PEL data, M_H,Sigma^tor is proper over B. Prove separatedness and the valuative extension/uniqueness for the actual finite-type algebraic space. After the allowed finite DVR base extension, semistable reduction and the degeneration period pairing determine a cone chart; completeness supplies the extension and the separated relation plus the source's valuative descent argument supply uniqueness/descent.
  Hypotheses: Fix the PEL datum, its order, lattice, pairing and reflex field F0 from M1. Let B=Spec(O_F0,(S)) for a set S of good primes in Lan 1.4.1.1: no prime divides the level integer n, Ibad or Disc[L# : L]. Retain the order/unramifiedness, polarization-defect and quaternionic p=2 restrictions of M2; H has the specified prime-to-S level. No bad-prime smoothness is inferred. Sigma is the complete smooth compatible collection used in integral-toroidal-space; use the precise admissible valuation criterion and the semistable-reduction theorem of R11.3. The non-neat conclusion is properness of the source stack; the neat conclusion is properness of its algebraic space.
  Acceptance: Every allowed DVR test has existence and uniqueness.
  Acceptance: An incomplete fan is excluded.

ShimuraCompactifications:C5/neat-boundary-intersection-smooth — ShimuraCompactification.neat_boundary_intersection_smooth
  lemma: Every D_J is smooth over B. Empty intersections are allowed; no claim is made that a nonempty intersection is connected.
  Hypotheses: Work on the actual good-prime PEL toroidal algebraic space X=M_H,Sigma^tor of Lan 6.3.3.15, over the indicated regular Noetherian arithmetic base B=Spec R. H is neat; Sigma satisfies 6.3.3.4, including 6.2.5.25. Retain 1.4.3.10 and the good-prime/level hypotheses of 1.4.1.2 and M2. The source construction and its ordinary etale chart/stratification theorem are required inputs, not implemented objects or arbitrary smooth resolutions. D_i are the finitely many irreducible components of the reduced boundary. For a subset J of their index set, D_J is their scheme-theoretic intersection (D_empty=X), and D_J^o=D_J minus the union of D_i with i outside J. These are subspaces of the actual X, not new boundary carriers.

ShimuraCompactifications:C5/neat-boundary-open-fiberwise-dense — ShimuraCompactification.neat_boundary_open_fiberwise_dense
  lemma: For every geometric point b of B and every J, the open (D_J^o)_b is dense in (D_J)_b. In particular, it meets each nonempty geometric-fiber component of each open-and-closed subspace of D_J.
  Hypotheses: Work on the actual good-prime PEL toroidal algebraic space X=M_H,Sigma^tor of Lan 6.3.3.15, over the indicated regular Noetherian arithmetic base B=Spec R. H is neat; Sigma satisfies 6.3.3.4, including 6.2.5.25. Retain 1.4.3.10 and the good-prime/level hypotheses of 1.4.1.2 and M2. The source construction and its ordinary etale chart/stratification theorem are required inputs, not implemented objects or arbitrary smooth resolutions. D_i are the finitely many irreducible components of the reduced boundary. For a subset J of their index set, D_J is their scheme-theoretic intersection (D_empty=X), and D_J^o=D_J minus the union of D_i with i outside J. These are subspaces of the actual X, not new boundary carriers.

ShimuraCompactifications:C5/neat-stratum-closure-component — ShimuraCompactification.neat_stratum_closure_component
  theorem: For every nonempty irreducible component Z of a labelled stratum, let J consist of the global boundary components containing Z. There is a unique connected component W of D_J with Z = W intersect D_J^o. Consequently the reduced closure of Z in X is W.
  Hypotheses: Work on the actual good-prime PEL toroidal algebraic space X=M_H,Sigma^tor of Lan 6.3.3.15, over the indicated regular Noetherian arithmetic base B=Spec R. H is neat; Sigma satisfies 6.3.3.4, including 6.2.5.25. Retain 1.4.3.10 and the good-prime/level hypotheses of 1.4.1.2 and M2. The source construction and its ordinary etale chart/stratification theorem are required inputs, not implemented objects or arbitrary smooth resolutions. D_i are the finitely many irreducible components of the reduced boundary. For a subset J of their index set, D_J is their scheme-theoretic intersection (D_empty=X), and D_J^o=D_J minus the union of D_i with i outside J. These are subspaces of the actual X, not new boundary carriers.

ShimuraCompactifications:C5/neat-stratum-closure-proper — ShimuraCompactification.neat_stratum_closure_proper
  lemma: The reduced closure W of each nonempty stratum component Z is proper over B. Together with the preceding nodes it is smooth over B, and Z_b is dense in W_b for every geometric point b.
  Hypotheses: Work on the actual good-prime PEL toroidal algebraic space X=M_H,Sigma^tor of Lan 6.3.3.15, over the indicated regular Noetherian arithmetic base B=Spec R. H is neat; Sigma satisfies 6.3.3.4, including 6.2.5.25. Retain 1.4.3.10 and the good-prime/level hypotheses of 1.4.1.2 and M2. The source construction and its ordinary etale chart/stratification theorem are required inputs, not implemented objects or arbitrary smooth resolutions. D_i are the finitely many irreducible components of the reduced boundary. For a subset J of their index set, D_J is their scheme-theoretic intersection (D_empty=X), and D_J^o=D_J minus the union of D_i with i outside J. These are subspaces of the actual X, not new boundary carriers.

ShimuraCompactifications:C5/neat-strata-detect-geometric-components — ShimuraCompactification.neat_strata_detect_geometric_components
  theorem: For a finite family of nonempty labelled strata of the actual neat model X, assume their union meets every irreducible component of X. Then for every geometric point b of B, their base changes meet every irreducible component of X_b. This supplies the residue-component hypothesis required by the B5 prime-quotient expansion argument at neat level.
  Hypotheses: Work on the actual good-prime PEL toroidal algebraic space X=M_H,Sigma^tor of Lan 6.3.3.15, over the indicated regular Noetherian arithmetic base B=Spec R. H is neat; Sigma satisfies 6.3.3.4, including 6.2.5.25. Retain 1.4.3.10 and the good-prime/level hypotheses of 1.4.1.2 and M2. The source construction and its ordinary etale chart/stratification theorem are required inputs, not implemented objects or arbitrary smooth resolutions. D_i are the finitely many irreducible components of the reduced boundary. For a subset J of their index set, D_J is their scheme-theoretic intersection (D_empty=X), and D_J^o=D_J minus the union of D_i with i outside J. These are subspaces of the actual X, not new boundary carriers.

ShimuraCompactifications:C5/nonneat-boundary-descent — TauCeti.ShimuraCompactifications.C5.nonneat_boundary_descent
  theorem: At non-neat good level, construct the toroidal quotient stack and its coarse boundary using the actual finite stabilizer actions. Descend the ordinary stratum ideals and chart incidences, keeping branch normalization and possible self-identifications. Transfer the neat component-detection conclusion only after proving every geometric component is covered by the chosen proper branch/level cover and its stratified descent. Coarse quotient smoothness and global simple normal crossings are not asserted.
  Hypotheses: Fix the PEL datum, its order, lattice, pairing and reflex field F0 from M1. Let B=Spec(O_F0,(S)) for a set S of good primes in Lan 1.4.1.1: no prime divides the level integer n, Ibad or Disc[L# : L]. Retain the order/unramifiedness, polarization-defect and quaternionic p=2 restrictions of M2; H has the specified prime-to-S level. No bad-prime smoothness is inferred. Use a specified neat normal subgroup and compatible cone system, the quotient stack and actual finite stabilizers; keep residue-characteristic restrictions on coarse-space exactness.

ShimuraCompactifications:C5/log-kodaira-spencer — TauCeti.ShimuraCompactifications.C5.log_kodaira_spencer
  theorem: On a neat smooth good-prime integral toroidal model, construct the logarithmic Kodaira–Spencer comparison with the PEL relation quotient of the tensor of invariant differentials, as in Lan 6.4.1.1(4). In the principally polarized Siegel case it is Sym² E ≅ Omega^1_M/B(log D), where E=e^*Omega^1_G/M is the invariant Hodge bundle of the universal semi-abelian family and D is the reduced toroidal boundary. Require the stated smooth chart and polarization conditions; do not replace a general PEL quotient by Sym² E.
  Hypotheses: Fix the PEL datum, its order, lattice, pairing and reflex field F0 from M1. Let B=Spec(O_F0,(S)) for a set S of good primes in Lan 1.4.1.1: no prime divides the level integer n, Ibad or Disc[L# : L]. Retain the order/unramifiedness, polarization-defect and quaternionic p=2 restrictions of M2; H has the specified prime-to-S level. No bad-prime smoothness is inferred. The level is neat, Sigma smooth, and the required no-self-identification condition is imposed when a global boundary divisor presentation is used.

ShimuraCompactifications:C5/hodge-semiampleness — TauCeti.ShimuraCompactifications.C5.hodge_semiampleness
  theorem: For the good-prime integral toroidal PEL compactification, a positive tensor power of omega=det E is generated by global sections relative to B. This is semiampleness on the toroidal model; omega can have degree zero on boundary contraction fibres and is not assumed ample there. Retain the source's polarized PEL hypotheses and their finite-level descent.
  Hypotheses: Fix the PEL datum, its order, lattice, pairing and reflex field F0 from M1. Let B=Spec(O_F0,(S)) for a set S of good primes in Lan 1.4.1.1: no prime divides the level integer n, Ibad or Disc[L# : L]. Retain the order/unramifiedness, polarization-defect and quaternionic p=2 restrictions of M2; H has the specified prime-to-S level. No bad-prime smoothness is inferred. Use the proper toroidal model and its universal polarized degeneration. For a coarse non-neat model first prove descent of a positive power.

ShimuraCompactifications:C5/graded-section-finite-generation — TauCeti.ShimuraCompactifications.C5.graded_section_finite_generation
  theorem: For the proper good-base toroidal model with semiample omega, prove that S=direct-sum_(k>=0) H^0(M^tor,omega^k) is a finitely generated B-algebra. Apply Lan Corollary 7.2.2.6 with a generated positive power and its preliminary Stein target, which must be flat over B. Establish that flatness before applying the corollary or constructing the minimal Proj. Import the foundations Proj and Stein-factor results. Retain the stated flat-base-change comparisons; no arbitrary integral base-change theorem follows from finite generation. Constant-term inputs enter only in the subsequent identification of the strata of Proj.
  Hypotheses: Fix the PEL datum, its order, lattice, pairing and reflex field F0 from M1. Let B=Spec(O_F0,(S)) for a set S of good primes in Lan 1.4.1.1: no prime divides the level integer n, Ibad or Disc[L# : L]. Retain the order/unramifiedness, polarization-defect and quaternionic p=2 restrictions of M2; H has the specified prime-to-S level. No bad-prime smoothness is inferred. Use the relatively generated positive power and the proper algebraic-space coherent finiteness theorem. Generic finite generation alone does not imply an integral finite-type section algebra. The preliminary Stein target for the generated positive power is flat over the Dedekind good base B, as required by Corollary 7.2.2.6. Use the smooth/flat toroidal source to show that its coherent Stein algebra is torsion-free over B, hence flat; this is independent of the later minimal-space construction.
  Acceptance: All nonnegative degrees occur, with a finite Veronese argument.
  Acceptance: The result is over the good arithmetic base, not only over its fraction field.
  Acceptance: The preliminary Stein target is proved flat before the finite-generation corollary is applied; the later minimal compactification is not used to justify that hypothesis.

ShimuraCompactifications:C5/integral-minimal-space — TauCeti.ShimuraCompactifications.C5.integral_minimal_space
  construction: Construct M_H^min=Proj_B S from the Hodge section algebra, with its proper map pi:M_H,Sigma^tor→M_H^min and its canonical open PEL immersion. Prove projectivity, normality and the stated flatness over the good base, identify the minimal boundary strata through constant terms, and prove independence of Sigma and agreement with the characteristic-zero minimal model. The map contracts the toroidal boundary directions; it is not a toric chart isomorphism. In its Stein-factor construction retain the canonical isomorphism O_(M_H^min)≅pi_*O_(M_H,Sigma^tor); special-fibre and formal transfers require their own base-change comparison.
  Hypotheses: Fix the PEL datum, its order, lattice, pairing and reflex field F0 from M1. Let B=Spec(O_F0,(S)) for a set S of good primes in Lan 1.4.1.1: no prime divides the level integer n, Ibad or Disc[L# : L]. Retain the order/unramifiedness, polarization-defect and quaternionic p=2 restrictions of M2; H has the specified prime-to-S level. No bad-prime smoothness is inferred. Use Lan's PEL compactification hypotheses, the semiample Hodge line and the exact constant-term/positivity inputs from B5. The first construction of the proper toroidal source does not import B5.
  API IntegralMinimalModel.fromToroidal (projection): The Hodge morphism has the specified restriction to the interior and boundary contraction.
  API IntegralMinimalModel.fanIndependent (characterisation): The target and open immersion are canonically independent of the chosen compatible complete fan.
  API IntegralMinimalModel.genericComparison (compatibility): Fraction-field base change gives the existing minimal Shimura variety for the same PEL datum.
  API IntegralMinimalModel.levelMap (functoriality): Specified compatible level maps descend through the Hodge section algebra and obey composition.
  API IntegralMinimalModel.structureSheaf (structure): For the algebraic Stein-factor contraction pi, O_min→pi_*O_tor is a canonical isomorphism. Completion or special-fibre comparison is a separate theorem with its own properness, coefficient and base-change hypotheses.
  Example IntegralMinimalModel.interior_test (compatibility): The composition of the open immersion with the toroidal-to-minimal map is the canonical PEL open immersion.
  Example IntegralMinimalModel.modular_test (computation): In dimension one the cusp contraction agrees with the imported compactified modular curve.
  Example IntegralMinimalModel.fan_test (degenerate): Replacing Sigma by a compatible refinement preserves the minimal target and its open immersion.

ShimuraCompactifications:C5/minimal-hodge-ampleness — TauCeti.ShimuraCompactifications.C5.minimal_hodge_ampleness
  theorem: A specified positive power of the Hodge line descends to an ample invertible sheaf on the neat integral minimal compactification, whose pullback to the toroidal model is that power of omega. On coarse finite-level quotients record the descended Q-line/positive tensor power and stabilizer restrictions. For the Siegel coarse minimal variety this supplies the ample Hodge Q-line used by Yuan; it does not assert ampleness of omega on the toroidal source.
  Hypotheses: Fix the PEL datum, its order, lattice, pairing and reflex field F0 from M1. Let B=Spec(O_F0,(S)) for a set S of good primes in Lan 1.4.1.1: no prime divides the level integer n, Ibad or Disc[L# : L]. Retain the order/unramifiedness, polarization-defect and quaternionic p=2 restrictions of M2; H has the specified prime-to-S level. No bad-prime smoothness is inferred. For a coarse quotient prove descent through an auxiliary sufficiently fine level and use the source's stabilizer/characteristic restrictions.

ShimuraCompactifications:C5/open-quasiprojectivity — TauCeti.ShimuraCompactifications.C5.open_quasiprojectivity
  theorem: Deduce that the neat good-prime PEL moduli algebraic space of M2 is a quasi-projective scheme over B, using its canonical open immersion in the projective minimal compactification. This is Lan revised-book Corollary 7.2.3.10. Export the resulting arithmetic moduli realization and Hodge line to the height/finiteness owners with all good-prime conditions; their bad-prime correction estimates are not supplied by this theorem.
  Hypotheses: Fix the PEL datum, its order, lattice, pairing and reflex field F0 from M1. Let B=Spec(O_F0,(S)) for a set S of good primes in Lan 1.4.1.1: no prime divides the level integer n, Ibad or Disc[L# : L]. Retain the order/unramifiedness, polarization-defect and quaternionic p=2 restrictions of M2; H has the specified prime-to-S level. No bad-prime smoothness is inferred. Use the actual M2 algebraic space and its open immersion; do not assume scheme/quasi-projective representability in M2 to prove C5.

ShimuraCompactifications:C5/higher-level-toroidal-normalization — TauCeti.ShimuraCompactifications.C5.higher_level_toroidal_normalization
  construction: For the fixed good-prime base-level toroidal model and SAME-fan finite generic higher-level cover of M4, take relative normalization in the generic function algebra. Its map to the base toroidal model is finite over the excellent base and its interior is M4's normalization. Pull back the good-level universal semi-abelian family; its higher p-level structure is specified on the generic fibre, not automatically over the special fibre. The changed-lattice boundary description and identification with the normalized toroidal charts require the exact source comparison. This is the Siegel normalization lane described in BPS 5.1–5.2, extended to other PEL data only when that comparison is supplied. It is not automatically the parahoric moduli model or Lan's full ramified projective-fan construction.
  Hypotheses: Let p be a GOOD prime for the base PEL datum and v|p. Take a neat prime-to-p level K^p, base p-level K_p^0=G(Z_p), and K_p contained in K_p^0 open. The base model is the ordinary good-level toroidal model over O_(F0,v); the higher level itself may have p-power index. Import the generic finite etale cover and its interior normalization from M4. Do not impose the base model's prime-to-p-level restriction on K_p. Fix the chosen good-level fan and its inverse-image cones in the changed higher-level character lattices. This is normalization of that SAME fan model in the finite generic function algebra over an excellent base. A compatible refinement of the fan instead gives a proper modification, not a finite normalization map to the old fan. General projective compatible nonsmooth fans at ramified primes use projective-normalized-blowup below, with different input models.
  API NormalizedToroidalModel.finiteMap (projection): For the SAME-fan relative normalization, the structural map to the chosen good-level toroidal model is finite. A subsequent fan refinement is a separate proper modification.
  API NormalizedToroidalModel.openNormalization (compatibility): Its interior is canonically the M4 normalization, before any parahoric moduli identification.
  API NormalizedToroidalModel.chartIntegralClosure (characterisation): When the exact changed-lattice/completed-chart comparison is supplied, the normalization chart identifies with its specified integral closure, torsor units and saturated character monoids; no arbitrary fan modification is inferred finite.
  API NormalizedToroidalModel.refinement (functoriality): Compatible further fan refinements give proper comparison maps agreeing on the same generic higher-level cover; this functoriality is separate from finiteness of the fixed-fan normalization map.
  API NormalizedToroidalModel.desc (universal-property): A normal flat algebraic space over the good-level toroidal model with the specified generic lift to the finite higher-level cover factors uniquely through its relative normalization, using the exact generic-compatibility and normalization descent hypotheses.
  Example NormalizedToroidalModel.identity_test (degenerate): The identity generic cover of a normal base model returns that model.
  Example NormalizedToroidalModel.tate_ramification_test (computation): A cusp cover q=t^p is finite but ramified at t=0 and can have inseparable special behavior.
  Example NormalizedToroidalModel.open_test (compatibility): Restricting to the interior agrees with the M4 normalization carrier.
  Example NormalizedToroidalModel.smoothness_test (non-example): A higher-level normalized chart is not declared smooth merely because its good-level target is smooth.

ShimuraCompactifications:C5/normalized-chart-finiteness — TauCeti.ShimuraCompactifications.C5.normalized_chart_finiteness
  theorem: For the projective normalized-blowup model, prove the completed boundary chart identification of Lan 2017 Theorem 6.1(3)–(4), with the actual torus-torsor base and changed lattices. For the SAME-fan higher-level normalization, prove the separate finite integral-closure map and compare its completed charts with that source model when the input models agree. Export precisely these finite-type, normality and chart properties to the tower owner. A map induced by an arbitrary fan subdivision is proper and can have positive-dimensional fibres; it is not asserted finite.
  Hypotheses: Retain separately the exact good-prime SAME-fan hypotheses of higher-level-toroidal-normalization and the projective compatible, possibly nonsmooth/ramified hypotheses of projective-normalized-blowup. Their model identification is a recorded gap. No all-prime general Hodge-type model is included.

ShimuraCompactifications:C5/integral-coefficient-extension — TauCeti.ShimuraCompactifications.C5.integral_coefficient_extension
  application: Instantiate B3/B4 canonical coefficient extensions on the actual good-prime and normalized toroidal models. The canonical extension has the prescribed character-line Fourier–Jacobi completion; its subcanonical extension is the canonical sheaf tensor the ordinary boundary ideal, not an incorrectly identified pullback line on every refinement. Identify the formally canonical/subcanonical conditions of Lan 2017 Definition 8.5, including its finite exhaustive coefficient filtration with finite R-module graded pieces.
  Hypotheses: Use the exact coefficient sheaf and finite-module filtration required by Definition 8.5, not an arbitrary boundary sheaf. Integral/normalized coefficients are requested from B3/B4 rather than inferred from their characteristic-zero construction.

ShimuraCompactifications:C5/normalized-koecher — TauCeti.ShimuraCompactifications.C5.normalized_koecher
  theorem: Let O tensor_Z Q be simple, R any O_F0,(p)-algebra, and E a quasi-coherent formally canonical coefficient sheaf on the normalized toroidal model in Lan 2017 Definition 8.5. For every open U_min of its minimal compactification, restriction Gamma(U_tor,E)→Gamma(U,E) is bijective, except when both dim(M_H)=1 and U_min minus U is nonempty. This includes the source's mod pi^n coefficients satisfying the formal hypothesis and BPS normalization model. It does not establish the model's separate identification with X_Iw.
  Hypotheses: Use the projective normalized model and the exact Definition 8.5 completed character-line form plus finite filtration. Retain the simple-algebra hypothesis and the dimension-one exception.

ShimuraCompactifications:C5/siegel-koecher-arbitrary-coefficients — TauCeti.ShimuraCompactifications.C5.siegel_koecher_arbitrary_coefficients
  theorem: For the neat good-prime genus-two Siegel model, E of rank two and integers a>=b, set omega(a,b)=Sym^(a-b) E tensor (det E)^b using the B3/B4 coefficient construction. For EVERY O-module M, restriction H^0(X,omega(a,b) tensor_O M)→H^0(Y,omega(a,b) tensor_O M) is bijective. Derive the arbitrary-module assertion through finite modules and filtered colimits, preserving torsion; the result is independent of the chosen compatible toroidal model.
  Hypotheses: Use the precise smooth proper good-prime genus-two setup of Calegari–Geraghty 5.2. For higher normalized models instead invoke normalized-koecher with its exact coefficient hypotheses.

ShimuraCompactifications:C5/ordinary-koecher — TauCeti.ShimuraCompactifications.C5.ordinary_koecher
  theorem: For the exact ordinary minimal open and its toroidal inverse image in Pilloni 11.1.1, prove restriction of sections of the stated canonical coefficient sheaf to the open ordinary locus is bijective, retaining its integral/mod p setting. Prove the formal coefficient condition and special-fibre extension theorem on that open. The characteristic-zero whole-space Koecher assertion alone does not imply this ordinary mod p statement, and it is not exported to an unidentified arbitrary parahoric model.
  Hypotheses: Use the specified good-prime ordinary geometry and finite-level coefficient construction. Establish normality/S2 and the codimension or Fourier–Jacobi extension inputs on the relevant special-fibre/formal model.

ShimuraCompactifications:C5/hilbert-siegel-boundary-codimension — TauCeti.ShimuraCompactifications.C5.hilbert_siegel_boundary_codimension
  theorem: For the exact genus-two Hilbert–Siegel minimal compactification over a totally real field of degree d in BCGP 8.2, the open has dimension 3d and every maximal nonempty boundary stratum has dimension at most d, hence boundary codimension at least 2d>=2. Preserve the inequality under the specified finite normalizations and on the normal formal model needed in the source. A toroidal boundary is a divisor; this codimension assertion concerns the minimal target.
  Hypotheses: Use the source's normal characteristic-zero/minimal and normal formal setup; arbitrary bad-prime special-fibre codimension/S2 is not assumed from it.

ShimuraCompactifications:C5/formal-hilbert-siegel-koecher — TauCeti.ShimuraCompactifications.C5.formal_hilbert_siegel_koecher
  theorem: In BCGP 8.2, on the NORMAL formal minimal scheme and for its stated invertible sheaf and toroidal pullback, extend H0 sections uniquely across the codimension-at-least-two minimal boundary. Prove the formal Hartogs statement with its precise normality/local-finiteness hypotheses and compare the toroidal pushforward of the line. This does not imply equality of arbitrary higher cohomology or all torsion coefficient sections.
  Hypotheses: Use the exact normal formal model, line bundle and finite-level comparison of the source; special-fibre S2/normality cannot be replaced by normality of a generic fibre. Supply O_formal-min≅pi_hat_*O_formal-tor for the ACTUAL formal contraction in BCGP, and a projection formula for its specified invertible sheaf. The good-level algebraic Stein equality in integral-minimal-space must be transported to this normalized/ordinary formal model; neither generic-fibre equality nor the fan-refinement theorem proves that transport.

ShimuraCompactifications:C5/prime-Q-subgroup-extension — TauCeti.ShimuraCompactifications.C5.prime_Q_subgroup_extension
  theorem: For the Calegari–Geraghty K0(Q) Siegel toroidal model with Q a prime invertible on the arithmetic base, extend the specified open cyclic subgroup H⊂A[Q] AS A FINITE FLAT GROUP SCHEME over the compactification, as in Pilloni 2012 4.1.2. The extension is finite etale of rank Q and is the group used for the generator Isom cover. No closed inclusion of this extended group into the identity-component semi-abelian family is asserted: the source states a finite-flat group extension, and boundary torsion can lose rank. Retain the generic inclusion only on the open locus.
  Hypotheses: Use the fixed K0(Q) model, compatible fans and subgroup with the source's extension construction; Q is invertible on the entire base.

ShimuraCompactifications:C5/prime-Q-generator-cover — TauCeti.ShimuraCompactifications.C5.prime_Q_generator_cover
  construction: On the specified compactified K0(Q) model, define X_K1(Q)=Isom_X(Z/Q,H) for the extended finite-etale cyclic rank-Q level group. It is a finite-etale torsor under Delta=(Z/Q)^×, restricts to the specified K1(Q) level cover on the open, and inherits the pulled-back universal family and coefficient sheaves. The proof uses Q invertible and the actual extended finite group; it requires no inclusion of H into the semi-abelian identity component over the boundary.
  Hypotheses: Use prime-Q-subgroup-extension, with Q prime and invertible on the base, and the constant cyclic group scheme Z/Q.
  API PrimeQGeneratorCover.torsor (structure): Multiplication of a generator by Delta gives a simply transitive action on each geometric fibre.
  API PrimeQGeneratorCover.openLevel (compatibility): The interior is the stated K1(Q)→K0(Q) level map.
  API PrimeQGeneratorCover.baseChange (functoriality): The Isom cover and its action commute with base change, with identity/composition comparisons.
  API PrimeQGeneratorCover.isomSections (characterisation): Sections of the cover over T correspond to group-scheme isomorphisms (Z/QZ)_T→H_T; an arbitrary point of H or the zero section is not a generator.
  Example PrimeQGeneratorCover.Q3_test (computation): For Q=3 and constant H=Z/3 there are two generators, permuted freely by (Z/3)^×.
  Example PrimeQGeneratorCover.Q2_test (degenerate): For Q=2 the generator cover has degree one.
  Example PrimeQGeneratorCover.open_test (compatibility): Restriction to the open gives the original level cover.
  Example PrimeQGeneratorCover.noninvertible_test (non-example): A p-kernel with rank loss at a characteristic-p boundary cannot be inserted as H to deduce a finite-etale cover.

ShimuraCompactifications:C5/siegel-canonical-bundle — TauCeti.ShimuraCompactifications.C5.siegel_canonical_bundle
  theorem: For a neat smooth genus-two Siegel toroidal threefold X/B with boundary D and invariant Hodge bundle E of rank two, det Omega^1_X/B(log D)=(det E)^3 and the relative dualizing line is (det E)^3 tensor O_X(-D). Derive this from the logarithmic Kodaira–Spencer isomorphism and the local normal-crossings coordinate formula; D is the actual boundary divisor. These are smooth-model bundle identities, not automatic dualizing formulas for singular p-level normalizations.
  Hypotheses: Fix the PEL datum, its order, lattice, pairing and reflex field F0 from M1. Let B=Spec(O_F0,(S)) for a set S of good primes in Lan 1.4.1.1: no prime divides the level integer n, Ibad or Disc[L# : L]. Retain the order/unramifiedness, polarization-defect and quaternionic p=2 restrictions of M2; H has the specified prime-to-S level. No bad-prime smoothness is inferred. Use relative dimension three, principal Siegel polarization, smooth cone system and the specified boundary normal-crossings hypotheses.

ShimuraCompactifications:C5/good-boundary-cohomology-export — TauCeti.ShimuraCompactifications.C5.good_boundary_cohomology_export
  application: Export the exact good-prime toroidal family, smooth proper model, open Siegel moduli locus and normal-crossings boundary with the hyperspecial/tame level conditions used in BCGP 2025 Theorem 1.8.29. The cohomology owner must supply Lan–Stroh nearby-cycle/open comparison and duality to obtain the stated unramified cohomology conclusion. Smoothness of the nonproper open alone is not a proof of unramifiedness.
  Hypotheses: At ell distinct from p use the theorem's hyperspecial ell-level, prime-to-ell auxiliary level and exact automorphic coefficient system; export only the model satisfying those hypotheses.

ShimuraCompactifications:C5/projective-normalized-blowup — TauCeti.ShimuraCompactifications.C5.projective_normalized_blowup
  construction: For Lan 2017's integral PEL/lattice-collection setting at a prime p, construct the projective toroidal model for a compatible PROJECTIVE cone system Sigma, without imposing smoothness or good reduction at p. Choose its compatible polarization function pol and a smooth refinement over the characteristic-zero reflex field. Push the pol-weighted boundary ideal to the minimal model, take its schematic closure J_tilde_(H,dpol) in the supplied p-integral minimal model, and form the normalization of its blow-up. For sufficiently divisible d the resulting models stabilize to the normal projective flat scheme M_tilde_(H,Sigma)^tor of Theorem 6.1, with the stated formal torus-torsor charts and tautological degenerating families indexed by the auxiliary lattice collection. This is a normalized blow-up of a minimal model; it is not defined as a finite cover of a fixed good-level toroidal model.
  Hypotheses: Use the integral PEL datum (O,*,L,pairing,h0) and Condition 1.4.3.10 as in Lan 2017 Section 2. Let H be open compact in G(Zhat) with NEAT image H^p away from p, and retain the collection (g_j,L_j,pairing_j) indexed by J as in the source's reference [18], Section 2. Work over S_tilde_0=Spec(O_(F0,(p))). Sigma is complete admissible and compatible as in Definition 2.1/Condition 6.2.5.25, and projective as in Definitions 2.5 and 2.7. A compatible invariant polarization function is supplied; individual cones need not be smooth. The ramified normalized interior, minimal model and auxiliary lattice families of [18], Propositions 6.1 and 6.4 are requested from M4. The currently inspected M4 nodes cover only the good-prime normalization case, so this wider supplier interface is an explicit gap.
  API ProjectiveToroidalModel.toMinimal (projection): Returns the canonical proper map to the supplied normalized minimal model, with the source's boundary stratum images.
  API ProjectiveToroidalModel.completion (characterisation): The completed neighbourhood of the labelled stratum is the formal torus-torsor chart of Theorem 6.1(3)–(4), with its actual normal flat torsor base and all indexed families.
  API ProjectiveToroidalModel.auxiliaryIndependent (extensionality): For sufficiently divisible d, the comparison identifies models for different d and polarization functions inducing the same Sigma; retain the fixed PEL lattice-collection data.
  API ProjectiveToroidalModel.refinement (functoriality): Compatible projective refinements induce canonical proper maps with identity/composition, as in Theorem 6.1(2) and Proposition 7.1.
  API ProjectiveToroidalModel.valuativeExtension (universal-property): For an irreducible Noetherian normal S over the local reflex base carrying the specified indexed degenerating families and generic level map, the map extends uniquely when, at each geometric point, ALL dominating complete-DVR valuation pairings lie in one corresponding cone, exactly as in Theorem 6.1(6).
  Example ProjectiveToroidalModel.rankZero_test (degenerate): When there is no boundary and the minimal model is already the proper interior, the ideal is the unit ideal and its normalized blow-up returns that normal model.
  Example ProjectiveToroidalModel.blowup_test (non-example): The normalized blow-up of (x,y) in a regular two-dimensional affine chart has exceptional P1 and a positive-dimensional fibre; declaring every normalized blow-up a finite normalization fails this local construction test.
  Example ProjectiveToroidalModel.stabilization_test (compatibility): Two sufficiently divisible d giving the same source Sigma yield the canonical comparison preserving the labelled completed chart and each auxiliary family.

-/
