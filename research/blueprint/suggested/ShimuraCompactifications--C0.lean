/-
This file is not the roadmap and is not exhaustive. The roadmap document is definitive.
The statements suggest Lean forms so that contributors and reviewers converge on names
and signatures. They make no implementation claim for the compactification roadmap.

Part C0 covers ShimuraCompactifications C0, C1, C2, C2.general, C3, C3.general, C4, C5.
The seven coefficient-algebra nodes below use actual pinned Mathlib carriers. In particular
AddMonoidAlgebra has a `coeff` field; it is not treated as an unrelated function type.
The underlying coefficient restriction, degree inclusion and coefficient maps are reused.
New bodies are deliberately `sorry`. THIS FILE HAS NOT BEEN COMPILED.

The five relative geometric nodes and the five retained C5 nodes still need genuine
pinned-compatible torsor/relative-Spec/PEL interfaces. Their omission is listed at the end,
not replaced by opaque propositions or arbitrary schemes with the conclusion as a field.

Pins:
  Tau Ceti f790474821cf4256814db967cb154e7af3d0c369
  Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174
-/

import Mathlib.Algebra.MonoidAlgebra.Basic
import Mathlib.RingTheory.Ideal.Quotient.Operations
import Mathlib.Data.ZMod.Basic
import TauCeti.Geometry.Toric.Algebraic.Fan.Basic
import TauCeti.Algebra.AlgebraicGroup.SplitTorus.Scheme
import TauCeti.AlgebraicGeometry.IrreducibleOfConnectedDomainStalk

open CategoryTheory AlgebraicGeometry
open scoped CategoryTheory.MonObj

noncomputable section

namespace AddMonoidAlgebra

/-- C0/face-projection. The actual additive coefficient restriction acquires an
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

/-- C0/face-projection-coeff, promoted from the definition's coefficient API. -/
theorem faceProjection_coeff (f : AddMonoidAlgebra R P) (m : F) :
    (faceProjection R F hF f).coeff m = f.coeff (m : P) := by
  sorry

/-- C0/face-projection-section. The inclusion is the EXISTING degree-map AlgHom. -/
theorem faceProjection_comp_inclusion :
    (faceProjection R F hF).comp (AddMonoidAlgebra.mapDomainAlgHom R R F.subtype) =
      AlgHom.id R (AddMonoidAlgebra R F) := by
  sorry

/-- C0/face-projection-kernel. This is the monomial ideal, NOT its radical. -/
theorem ker_faceProjection :
    RingHom.ker (faceProjection R F hF).toRingHom =
      Ideal.span {f : AddMonoidAlgebra R P |
        ∃ p : P, p ∉ F ∧ f = AddMonoidAlgebra.single p (1 : R)} := by
  sorry

end FaceAPI

/-- C0/face-quotient. Instantiate the existing first isomorphism theorem and
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

/-- C0/face-projection-coefficient-change. RingHom equality avoids silently
identifying algebra structures over different coefficient rings. -/
theorem faceProjection_coefficient_change (φ : R →+* S) :
    (AddMonoidAlgebra.mapRingHom F φ).comp (faceProjection R F hF).toRingHom =
      (faceProjection S F hF).toRingHom.comp (AddMonoidAlgebra.mapRingHom P φ) := by
  sorry

/-- C0/face-kernel-coefficient-change. This is extension, not contraction,
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

/-!
## Explicit geometric signature omissions

These are NOT elaborated declarations. The packet and reader are definitive.
Use actual SF.0/SF.1 sheaf, relative-Spec and torsor carriers, and the anchor's
common lattice/cone/dual-monoid vocabulary before writing these signatures.

C0/relative-torus-embedding — TauCeti.Toric.Relative.torusEmbedding
  Spec_Z of the subalgebra formed by the P_sigma-character lines inside the
  actual torsor algebra. Its multiplication is inherited, not independently chosen.
  APIs still to type:
  * TauCeti.Toric.Relative.embedding_trivialization
  * TauCeti.Toric.Relative.embedding_baseChange
  * TauCeti.Toric.Relative.embedding_torusAction
  * TauCeti.Toric.Relative.embedding_zeroCone
  * TauCeti.Toric.Relative.embedding_changeTrivialization
  Tests still to type as geometric examples:
  * TauCeti.Toric.Relative.embedding_rankOne_test
  * TauCeti.Toric.Relative.embedding_zeroCone_test
  * TauCeti.Toric.Relative.embedding_lineDual_test
  * TauCeti.Toric.Relative.embedding_nilpotentBase_test
  Keep right-translation weight functions and Spec Sym(L) = V(L dual).

C0/relative-face-open — TauCeti.Toric.Relative.faceOpenImmersion
  Ordinary localization at a character line, glued through its unit transitions.
  No map between completions at different strata is inferred.

C0/relative-regular-coordinates — TauCeti.Toric.Relative.regularCoordinateIso
  Apply the existing monoid-algebra congruence to the anchor's intrinsic
  dual-monoid equivalence after a supplied primitive integral basis and torsor
  trivialization. Split tori only; simplicial is not regular.

C0/relative-stratum-quotient — TauCeti.Toric.Relative.stratumQuotientIso
  Descend the actual face ideal and quotient, retaining nonreduced base coefficients.
  Prove the pushout-torsor comparison with its multiplication and base-change maps.

C0/relative-boundary-coordinates — TauCeti.Toric.Relative.boundaryCoordinateIso
  Quotient by the selected polynomial variables, then invert the complementary
  boundary monomial for the exact open. This identifies an actual scheme-theoretic
  intersection, not its reduction. The monomial localization is universally
  schematically dense; descent to the PEL model needs its ordinary labelled charts.

Retained C5 signature obligations, with the packet's unchanged exact hypotheses:
  C5/neat-boundary-intersection-smooth
  C5/neat-boundary-open-fiberwise-dense
  C5/neat-stratum-closure-component
  C5/neat-stratum-closure-proper
  C5/neat-strata-detect-geometric-components

The last consumes an SF.2 algebraic-space detector after proper coherent cohomology.
There is no import of B5 into early C5, nor of C4 into the generic C0 construction.
No signature here represents the PEL algebraization or effective quotient as complete.
-/
