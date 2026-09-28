import Mathlib.LinearAlgebra.Complex.FiniteDimensional
import Mathlib.FieldTheory.Galois.Basic
import TauCeti.Algebra.AlgebraicGroup.GroupAlgebra.Galois.Torus
import TauCeti.Algebra.AlgebraicGroup.GroupAlgebra.Galois.Character
import TauCeti.Algebra.AlgebraicGroup.DiagonalizableGroup.Weight
import TauCeti.Geometry.Hodge.Decomposition
import TauCeti.Geometry.Hodge.WeilOperator
import TauCeti.Geometry.Hodge.Tate.Basic

/-!
# Shimura data — suggested declarations (D1, first checkpoint)

This file is not the roadmap and is not exhaustive. The roadmap document is definitive.
The statements suggest Lean forms so that contributors and reviewers converge on names
and signatures. All proposed results are unproved prototypes at the pinned baseline.

Conventions (Deligne 1979, 1.1.1.1; Milne, *Introduction to Shimura varieties*, §2): the Deligne
torus `S` has `S(ℝ) = ℂˣ`, `S_ℂ ≅ G_m × G_m` with `z ↦ (z, z̄)`; `h(z)` acts on `V^{p,q}` by
`z^{-p} z̄^{-q}`; `w(r) = r⁻¹`; and `h(i)` is the inverse of Tau Ceti's Weil operator.
-/

noncomputable section
namespace TauCeti.Shimura

open scoped TensorProduct

/-- D1/deligne-torus: `ℂ/ℝ` is Galois (no instance in Mathlib at the pin). -/
instance isGalois_real_complex : IsGalois ℝ ℂ := sorry

/-- D1/deligne-torus: the swap representation of `Gal(ℂ/ℝ)` on `ℤ²`. -/
def delignetorusRep : Representation ℤ (ℂ ≃ₐ[ℝ] ℂ) (Fin 2 → ℤ) := sorry

theorem delignetorusRep_conj (m : Fin 2 → ℤ) :
    delignetorusRep Complex.conjAe m = ![m 1, m 0] := by sorry

/-- D1/deligne-torus: the Deligne torus `S`, as the Galois-descended torus. -/
abbrev DeligneTorus : FiniteTypeCommHopfAlgCat.{0, 0} ℝ :=
  GaloisDescent.descendedCoordinateRing delignetorusRep

theorem DeligneTorus.isTorus : torusCommHopfAlgProperty ℝ DeligneTorus :=
  GaloisDescent.torusCommHopfAlgProperty_descendedCoordinateRing delignetorusRep

theorem DeligneTorus.not_split : ¬ splitTorusCommHopfAlgProperty ℝ DeligneTorus := by sorry

/-- D1/deligne-torus-points: `S(ℝ) ≅ ℂˣ` (a group isomorphism for the convolution group of
points; stated here as a bijection). -/
def DeligneTorus.realPointsMulEquiv :
    (GaloisDescent.groupAlgebraInvariants delignetorusRep →ₐ[ℝ] ℝ) ≃ ℂˣ := sorry

/-- D1/deligne-torus-points: `S(ℂ) ≅ ℂˣ × ℂˣ`. -/
def DeligneTorus.complexPointsEquiv :
    (GaloisDescent.groupAlgebraInvariants delignetorusRep →ₐ[ℝ] ℂ) ≃ ℂˣ × ℂˣ := sorry

/-- D1/deligne-torus-points (c): a real point `z` is `(z, z̄)` in `S(ℂ)`. -/
theorem DeligneTorus.complexPointsEquiv_real (x : GaloisDescent.groupAlgebraInvariants
    delignetorusRep →ₐ[ℝ] ℝ) :
    DeligneTorus.complexPointsEquiv ((Algebra.ofId ℝ ℂ).comp x) =
      (DeligneTorus.realPointsMulEquiv x, star (DeligneTorus.realPointsMulEquiv x)) := by sorry

-- D1/weight-norm-cocharacters: `TauCeti.Shimura.descendMap` (Hopf maps of descended coordinate
--   rings from equivariant lattice maps), `DeligneTorus.norm` (character (1, 1)),
--   `DeligneTorus.weight` (cocharacter (−1, −1), `w(r) = r⁻¹`) and
--   `DeligneTorus.hodgeCocharacter` (over ℂ, `(1, 0)`): not stated here; they need the
--   functoriality of `groupAlgebraInvariants` in the lattice, which Tau Ceti does not provide.

section Hodge
variable (V : Type) [AddCommGroup V] [Module ℝ V] [FiniteDimensional ℝ V]
  [TauCeti.Comodule ℝ (GaloisDescent.groupAlgebraInvariants delignetorusRep) V]

/-- D1/hodge-decomposition-of-representation: `V^{p,q}`, the `(-p, -q)`-weight space of
`ℂ ⊗ V` under `S_ℂ ≅ G_m²`. -/
def hodgePiece (p q : ℤ) : Submodule ℂ (ℂ ⊗[ℝ] V) := sorry

theorem conj_hodgePiece (p q : ℤ) :
    (hodgePiece V p q).map
        (TauCeti.Hodge.complexificationConjugation V).toEquiv.toLinearMap =
      hodgePiece V q p := by sorry

/-- The weight-`n` part `V_n`, a real subspace. -/
def weightPart (n : ℤ) : Submodule ℝ V := sorry

theorem isInternal_weightPart : DirectSum.IsInternal (weightPart V) := by sorry

/-- The pure Hodge structure of weight `n` on `ℂ ⊗ V_n`. -/
def hodgeOfRepresentation (n : ℤ) :
    TauCeti.Hodge.HodgeStructureOn (ℂ ⊗[ℝ] weightPart V n)
      (TauCeti.Hodge.complexificationConjugation (weightPart V n)) n := sorry

-- D1/weil-operator-sign: `hodgeOfRepresentation_h_i` — `h(i)` acts on `ℂ ⊗ V_n` as the inverse of
--   `(hodgeOfRepresentation V n).weilOperator`; stated once the action of real points on `V`
--   (`h : S(ℝ) → GL(V)`) is packaged from the comodule.
-- D1/representation-hodge-equivalence: `representationHodgeEquivalence`, the equivalence between
--   comodules over `𝒪(S)` and finite families of pure real Hodge structures; needs Galois descent
--   of comodules (recorded gap).
-- D1/rational-weight-criterion: `weightDefinedOverQ_iff`.

end Hodge

-- D1/test-objects (`TauCeti.Shimura.hodgeOfRepresentation_tests`) and the unit tests (trivial representation of type (0, 0), `Nm^m` of type
-- (−m, −m) matching `TauCeti.Hodge.tate m`, `H₁(E)` of weight −1, and the adjoint of `GL₂` of
-- types (−1, 1), (0, 0), (1, −1)) are stated in the packet; their Lean form needs the explicit
-- comodules, omitted here.

-- TauCeti.Shimura.tests.not_Gm
example : ¬ Nonempty (DeligneTorus ≅
    (FiniteTypeCommHopfAlgCat.of ℝ (MonoidAlgebra ℝ (Multiplicative ℤ)))) := by sorry

end TauCeti.Shimura
