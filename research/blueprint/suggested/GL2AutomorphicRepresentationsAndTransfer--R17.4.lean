import Mathlib.GroupTheory.Perm.Cycle.Type
import Mathlib.GroupTheory.Perm.Fin
import Mathlib.LinearAlgebra.Matrix.GeneralLinearGroup.Defs
import Mathlib.LinearAlgebra.Matrix.Notation
import TauCeti.GroupTheory.Perm.Partition

/-!
# GL₂ automorphic representations and transfer: layer R17.4 (follow-up part)

This file is not the roadmap and is not exhaustive. The companion roadmap document,
`research/blueprint/readmes/GL2AutomorphicRepresentationsAndTransfer--R17.4.md`, is
definitive. The statements here suggest Lean forms so that contributors and reviewers
converge on names and signatures; they claim no implementation, and every proof is `sorry`.

This part continues the R17.3 packet's plan of R17.4. Its new targets are local base change
by restriction of the Langlands parameter, the cubic local lift and its twisted factors, and
non-normal cubic base change at every place. Almost all of them need carriers that the pinned
libraries do not have: Weil groups of local and global fields with reciprocity, Weil–Deligne
parameters, the local Langlands correspondences for GL₂ and GL₃, automorphic representations
of GL₂ and GL₃ over number fields, Rankin–Selberg factors and Hecke characters. Those
statements are listed, grouped by the carriers they need, at the end of this file; they are
README targets and are not declared here over placeholder types.

The one piece that is statable at the pins is the unramified Satake rule of cubic base change
read from a Frobenius permutation: the orbit lengths of a permutation of the three embeddings
are Tau Ceti's `Equiv.Perm.fullCycleType`, which is not redefined.
-/

namespace TauCeti.GL2Transfer

open Equiv Matrix

section CubicSplitting

variable {K : Type*} [CommRing K]

/-- The Satake classes of cubic base change above an unramified place `v` of `F`, for a cubic
field `K/F` on whose three embeddings Frobenius at `v` acts by `g`: one class `A ^ f` for each
orbit of `⟨g⟩`, where the orbit length `f` is the residue degree of the corresponding place of
`K` above `v`. Packet node `R17.4/cubic-splitting-satake`. -/
def cubicBaseChangeSatake (A : GeneralLinearGroup (Fin 2) K) (g : Perm (Fin 3)) :
    Multiset (GeneralLinearGroup (Fin 2) K) :=
  g.fullCycleType.map fun f => A ^ f

/-- The rule depends only on the Frobenius class. -/
lemma cubicBaseChangeSatake_conj (A : GeneralLinearGroup (Fin 2) K) (g h : Perm (Fin 3)) :
    cubicBaseChangeSatake A (h * g * h⁻¹) = cubicBaseChangeSatake A g := by sorry

/-- A completely split place: three places of residue degree one. -/
lemma cubicBaseChangeSatake_one (A : GeneralLinearGroup (Fin 2) K) :
    cubicBaseChangeSatake A 1 = {A, A, A} := by sorry

/-- Splitting type (2,1): Frobenius is a transposition. -/
lemma cubicBaseChangeSatake_swap (A : GeneralLinearGroup (Fin 2) K) :
    cubicBaseChangeSatake A (swap 0 1) = {A ^ 2, A} := by sorry

/-- An inert place: Frobenius is a 3-cycle. -/
lemma cubicBaseChangeSatake_finRotate (A : GeneralLinearGroup (Fin 2) K) :
    cubicBaseChangeSatake A (finRotate 3) = {A ^ 3} := by sorry

/-- There are at most three places of `K` above `v`. -/
lemma cubicBaseChangeSatake_card_le (A : GeneralLinearGroup (Fin 2) K) (g : Perm (Fin 3)) :
    Multiset.card (cubicBaseChangeSatake A g) ≤ 3 := by sorry

/-- Frobenius is even, that is `v` splits in the quadratic resolvent, exactly when the number
of places of `K` above `v` is odd. -/
lemma cubicBaseChangeSatake_sign (A : GeneralLinearGroup (Fin 2) K) (g : Perm (Fin 3)) :
    Perm.sign g = 1 ↔ Odd (Multiset.card (cubicBaseChangeSatake A g)) := by sorry

/-- The determinants multiply to `det A ^ 3`, the value of the central character `ω ∘ N`. -/
lemma cubicBaseChangeSatake_det (A : GeneralLinearGroup (Fin 2) K) (g : Perm (Fin 3)) :
    ((cubicBaseChangeSatake A g).map fun B => GeneralLinearGroup.det B).prod =
      GeneralLinearGroup.det A ^ 3 := by sorry

-- Test `TauCeti.GL2Transfer.cubic_satake_identity_test` (degenerate).
example (A : GeneralLinearGroup (Fin 2) K) : cubicBaseChangeSatake A 1 = {A, A, A} := by sorry

-- Test `TauCeti.GL2Transfer.cubic_satake_transposition_test` (computation).
example (A : GeneralLinearGroup (Fin 2) K) :
    cubicBaseChangeSatake A (swap 0 1) = {A ^ 2, A} := by sorry

-- Test `TauCeti.GL2Transfer.cubic_satake_cycle_test` (computation).
example (A : GeneralLinearGroup (Fin 2) K) :
    cubicBaseChangeSatake A (finRotate 3) = {A ^ 3} := by sorry

-- Test `TauCeti.GL2Transfer.cubic_satake_cycleType_test` (non-example): the cycle type
-- forgets fixed points, so it loses the three split places at `g = 1`.
example (A : GeneralLinearGroup (Fin 2) K) :
    (1 : Perm (Fin 3)).cycleType.map (fun f => A ^ f) = 0 ∧
      cubicBaseChangeSatake A 1 ≠ 0 := by sorry

-- Test `TauCeti.GL2Transfer.cubic_satake_det_test` (compatibility).
example (A : GeneralLinearGroup (Fin 2) ℚ) (hA : (A : Matrix (Fin 2) (Fin 2) ℚ) = !![2, 0; 0, 3]) :
    (cubicBaseChangeSatake A (swap 0 1)).map
        (fun B => ((GeneralLinearGroup.det B : ℚˣ) : ℚ)) = {36, 6} := by sorry

end CubicSplitting

end TauCeti.GL2Transfer

/-!
## Statements not typed at the pins

Review conventions: R16.3 uses unitary parameters with geometric Artin reciprocity.
Genericity preservation is asserted for unitary infinite-dimensional GL₂ inputs; arbitrary
nonunitary inputs can become one-dimensional. The cubic pair identity uses character
families that are a common real norm twist of unitary data. Arbitrary split families use
Langlands quotients and can be nongeneric. JPSS (14.2) is a global theorem, and its local
characterization uses both the original and contragredient twisted L-functions. The
Steinberg root-number target uses the WD correction checked in source issue E19.

Each block names a packet node, its proposed declaration, the carriers it needs and the API
items and unit tests it owns. The statements are in the packet and in the roadmap document
(section "R17.4 — Local base change and non-normal cubic base change at every place"). None of
them is declared here over placeholder types, `Prop`-valued fields or arbitrary functions.

* `GL2AutomorphicRepresentationsAndTransfer:R17.4/local-base-change`: Local base change by restriction of the Langlands parameter.
  Declaration `TauCeti.GL2Transfer.localBaseChange` (definition).
  Needs: local Weil groups with the restriction W_E ⊂ W_F and reciprocity; Weil–Deligne
  parameters (the R01.2 carrier); the rank-two local Langlands correspondence of R16.3/ET.6
  and AF.1; irreducible admissible representations of GL₂ of a local field.
  API: `localBaseChange_self`, `localBaseChange_tower`, `localBaseChange_galois`,
  `localBaseChange_twist`, `localBaseChange_central`, `localBaseChange_contragredient`,
  `localBaseChange_unramified`, `localBaseChange_principalSeries`,
  `localBaseChange_steinberg`, `localBaseChange_dihedral`, `localBaseChange_cyclic`,
  `localBaseChange_generic`, `localBaseChange_parameter`.
  Tests: `localBaseChange_self_test`, `localBaseChange_steinberg_inert_test`,
  `localBaseChange_steinberg_ramified_test`, `localBaseChange_monodromy_test`,
  `localBaseChange_dihedral_split_test`, `localBaseChange_s3_test`,
  `localBaseChange_nonunitary_test`.

* `GL2AutomorphicRepresentationsAndTransfer:R17.4/gl2-local-converse`: The GL₂ local converse theorem.
  Declaration `TauCeti.GL2Transfer.gl2_local_converse` (theorem).
  Needs: irreducible smooth representations of GL₂ of a nonarchimedean local field with their
  Godement–Jacquet L- and ε-factors (AL.2) and character twists.

* `GL2AutomorphicRepresentationsAndTransfer:R17.4/lambda-square-product`: Langlands λ-constants: inductivity, square and global product.
  Declaration `TauCeti.GL2Transfer.lambda_square_product` (theorem).
  Needs: Deligne–Langlands ε-factors of Weil and Weil–Deligne representations (R01.2),
  induction along finite extensions, global reciprocity for the finite permutation
  determinant (no infinite global Weil group is needed for the λ-square product).

* `GL2AutomorphicRepresentationsAndTransfer:R17.4/local-cubic-induction`: Local automorphic induction to GL₃ from a cubic étale algebra.
  Declaration `TauCeti.GL2Transfer.localCubicInduction` (definition).
  Needs: the local Langlands correspondence for GL₃ (ET.6, AF.1), induction of characters of
  Weil groups, cubic étale algebras over a local field.
  API: `localCubicInduction_split`, `localCubicInduction_oneTwo`,
  `localCubicInduction_factors`, `localCubicInduction_central`, `localCubicInduction_twist`,
  `localCubicInduction_supercuspidal_iff`, `localCubicInduction_unramified`,
  `localCubicInduction_contragredient`, `localCubicInduction_parameter`.
  Tests: `localCubicInduction_split_test`, `localCubicInduction_unramified_test`,
  `localCubicInduction_central_test`, `localCubicInduction_reducible_test`,
  `localCubicInduction_nonunitary_test`.

* `GL2AutomorphicRepresentationsAndTransfer:R17.4/local-cubic-factor-identity`: Twisted factors of the cubic local lift.
  Declaration `TauCeti.GL2Transfer.local_cubic_factor_identity` (theorem).
  Needs: GL₂ × GL₃ Rankin–Selberg local factors (AL.3), pair-compatible local Langlands
  correspondences (ET.6), λ-constants.

* `GL2AutomorphicRepresentationsAndTransfer:R17.4/local-cubic-explicit-lifts`: Explicit non-Galois cubic local lifts by type.
  Declaration `TauCeti.GL2Transfer.local_cubic_explicit_lifts` (theorem).
  Needs: principal series, Steinberg and dihedral representations of GL₂ of a p-adic field,
  local norm groups and local reciprocity.

* `GL2AutomorphicRepresentationsAndTransfer:R17.4/local-base-change-invariants`: Local invariants under base change.
  Declaration `TauCeti.GL2Transfer.local_base_change_invariants` (theorem).
  Needs: conductor exponents and root numbers of GL₂ representations, ramification
  filtrations, archimedean Langlands parameters.

* `GL2AutomorphicRepresentationsAndTransfer:R17.4/nonnormal-cubic-gl3-induction`: GL₃ automorphic induction from a non-normal cubic field.
  Declaration `TauCeti.GL2Transfer.nonnormal_cubic_gl3_induction` (theorem).
  Needs: cuspidal automorphic representations of GL₃(A_F), Hecke characters of a number field,
  global Weil groups and their all-place induction/Artin functional equation
  (an explicit supplier gap), Jacquet–Piatetski-Shapiro–Shalika Theorem (14.2).

* `GL2AutomorphicRepresentationsAndTransfer:R17.4/nonnormal-cubic-twisted-l-functions`: Twisted L-functions of the non-normal cubic lift.
  Declaration `TauCeti.GL2Transfer.nonnormal_cubic_twisted_l_functions` (theorem).
  Needs: automorphic representations of GL₂(A_F), restricted tensor products over A_K,
  completed GL₂ × GL₃ Rankin–Selberg and Hecke L-functions, global ε-factors.

* `GL2AutomorphicRepresentationsAndTransfer:R17.4/nonnormal-cubic-strong-base-change`: Non-normal cubic base change at every place.
  Declaration `TauCeti.GL2Transfer.nonnormal_cubic_strong_base_change` (theorem).
  Needs: isobaric automorphic representations of GL₂ over number fields, the GL₂ converse
  theorem (R16.5), isobaric strong multiplicity one (AL.3).

* `GL2AutomorphicRepresentationsAndTransfer:R17.4/nonnormal-cubic-cuspidality`: Non-normal cubic cuspidality criterion.
  Declaration `TauCeti.GL2Transfer.nonnormal_cubic_cuspidality` (theorem).
  Needs: isobaric automorphic representations of GL₂ over number fields and their quadratic
  base change.

-/
