import TauCeti.LinearAlgebra.IntegralLattice.Overlattice.Isotropic
import Mathlib.NumberTheory.Padics.Hensel
import Mathlib.Tactic.NormNum
import Mathlib.Tactic.FinCases

/-!
This file is not exhaustive. The independently reviewed packet specifies the contracts.
The reader document must be synchronized with the review before packaging.
The declarations suggest Lean forms so that contributors and reviewers can converge on names
and signatures. Proofs marked `sorry` are future work, including every geometric theorem.

The pinned libraries lack algebraic spaces, a second Betti-number condition and the required
surface/Picard/intersection interfaces. Those geometric declarations, their API lemmas and tests
are explicitly omitted; the packet lists them in prototypeOmissions. In particular there is no
uninterpreted `IsEnriques : Prop`, fake surface record or guessed supplier import here.

The concrete lattice and twist computations below use existing library objects. They support
E3 and E6 and do not assert that a numerical graph is realized by a surface.
-/

/-
Geometric targets whose signatures/API/tests are omitted (see packet prototypeOmissions):
EnriquesSurfacesAndIntegralNonexistence:E0/is-enriques
EnriquesSurfacesAndIntegralNonexistence:E0/pic-tau-length
EnriquesSurfacesAndIntegralNonexistence:E0/geometric-invariants
EnriquesSurfacesAndIntegralNonexistence:E0/numerical-lattice-isometry
EnriquesSurfacesAndIntegralNonexistence:E1/half-fibre
EnriquesSurfacesAndIntegralNonexistence:E1/curves-and-two-sections
EnriquesSurfacesAndIntegralNonexistence:E1/canonical-type-fibration
EnriquesSurfacesAndIntegralNonexistence:E1/fibration-exists
EnriquesSurfacesAndIntegralNonexistence:E1/multiple-fibre-degree
EnriquesSurfacesAndIntegralNonexistence:E1/degree-two-reducibility
EnriquesSurfacesAndIntegralNonexistence:E1/integral-two-section-exists
EnriquesSurfacesAndIntegralNonexistence:E1/classical-criteria
EnriquesSurfacesAndIntegralNonexistence:E1/classical-canonical-bundle
EnriquesSurfacesAndIntegralNonexistence:E1/tame-types-char-two
EnriquesSurfacesAndIntegralNonexistence:E1/ordinary-type
EnriquesSurfacesAndIntegralNonexistence:E1/classical-type
EnriquesSurfacesAndIntegralNonexistence:E1/supersingular-type
EnriquesSurfacesAndIntegralNonexistence:E1/k3-like-cover
EnriquesSurfacesAndIntegralNonexistence:E1/k3-like-cohomology
EnriquesSurfacesAndIntegralNonexistence:E1/conductrix
EnriquesSurfacesAndIntegralNonexistence:E1/quasielliptic-simple-restriction
EnriquesSurfacesAndIntegralNonexistence:E1/multiple-special-restriction
EnriquesSurfacesAndIntegralNonexistence:E1/extra-special-e8
EnriquesSurfacesAndIntegralNonexistence:E1/general-partner-theorem
EnriquesSurfacesAndIntegralNonexistence:E1/nonexceptional-partner
EnriquesSurfacesAndIntegralNonexistence:E2/enriques-family
EnriquesSurfacesAndIntegralNonexistence:E2/relative-picard-scheme
EnriquesSurfacesAndIntegralNonexistence:E2/relative-picard-invariants
EnriquesSurfacesAndIntegralNonexistence:E2/canonical-family
EnriquesSurfacesAndIntegralNonexistence:E2/canonical-obstruction
EnriquesSurfacesAndIntegralNonexistence:E2/injective-h2-cover
EnriquesSurfacesAndIntegralNonexistence:E2/section-cover
EnriquesSurfacesAndIntegralNonexistence:E2/etale-pic-tau-cover
EnriquesSurfacesAndIntegralNonexistence:E2/canonical-twisting
EnriquesSurfacesAndIntegralNonexistence:E2/constant-picard
EnriquesSurfacesAndIntegralNonexistence:E2/constant-picard-covers
EnriquesSurfacesAndIntegralNonexistence:E2/residue-canonical-order
EnriquesSurfacesAndIntegralNonexistence:E2/numerical-line-bundle-descent
EnriquesSurfacesAndIntegralNonexistence:E2/minus-two-curve-descent
EnriquesSurfacesAndIntegralNonexistence:E2/fibration-descent
EnriquesSurfacesAndIntegralNonexistence:E2/rational-tame-double-fibres
EnriquesSurfacesAndIntegralNonexistence:E2/residue-fibration-exists
EnriquesSurfacesAndIntegralNonexistence:E3/num-over-z
EnriquesSurfacesAndIntegralNonexistence:E3/local-projectivity
EnriquesSurfacesAndIntegralNonexistence:E3/local-canonical-cover
EnriquesSurfacesAndIntegralNonexistence:E3/four-global-cover-twists
EnriquesSurfacesAndIntegralNonexistence:E3/dyadic-cover-difference
EnriquesSurfacesAndIntegralNonexistence:E3/remove-ramified-difference
EnriquesSurfacesAndIntegralNonexistence:E3/etale-canonical-is-k3
EnriquesSurfacesAndIntegralNonexistence:E3/four-twist-good-reduction
EnriquesSurfacesAndIntegralNonexistence:E3/split-etale-lattice-extension
EnriquesSurfacesAndIntegralNonexistence:E3/integral-full-picard
EnriquesSurfacesAndIntegralNonexistence:E4/enriques-jacobian
EnriquesSurfacesAndIntegralNonexistence:E4/enriques-jacobian-rational
EnriquesSurfacesAndIntegralNonexistence:E4/jacobian-kodaira-match
EnriquesSurfacesAndIntegralNonexistence:E4/simple-fibre-isomorphism
EnriquesSurfacesAndIntegralNonexistence:E4/nonrational-jacobian-fibres
EnriquesSurfacesAndIntegralNonexistence:E4/jacobian-no-i0-star
EnriquesSurfacesAndIntegralNonexistence:E4/semistable-graph-descent
EnriquesSurfacesAndIntegralNonexistence:E4/one-semistable-or-supersingular
EnriquesSurfacesAndIntegralNonexistence:E4/mordell-weil-descent
EnriquesSurfacesAndIntegralNonexistence:E4/jacobian-enriques-fibre-counts
EnriquesSurfacesAndIntegralNonexistence:E4/jacobian-constant-picard
EnriquesSurfacesAndIntegralNonexistence:E5/elliptic-candidate-reduction
EnriquesSurfacesAndIntegralNonexistence:E5/quasielliptic-component-sum
EnriquesSurfacesAndIntegralNonexistence:E5/quasielliptic-candidates
EnriquesSurfacesAndIntegralNonexistence:E5/forced-multiple-types
EnriquesSurfacesAndIntegralNonexistence:E5/simple-iii-star-restriction
EnriquesSurfacesAndIntegralNonexistence:E5/no-rational-special-two-section
EnriquesSurfacesAndIntegralNonexistence:E5/omitted-configurations-exclusion
EnriquesSurfacesAndIntegralNonexistence:E5/no-i8
EnriquesSurfacesAndIntegralNonexistence:E5/no-ii-star
EnriquesSurfacesAndIntegralNonexistence:E5/no-multiple-i4-star
EnriquesSurfacesAndIntegralNonexistence:E5/no-iv-star
EnriquesSurfacesAndIntegralNonexistence:E5/no-iv
EnriquesSurfacesAndIntegralNonexistence:E5/residual-configurations
EnriquesSurfacesAndIntegralNonexistence:E5/residual-multiplicities
EnriquesSurfacesAndIntegralNonexistence:E5/partner-over-f2
EnriquesSurfacesAndIntegralNonexistence:E6/first-discriminant
EnriquesSurfacesAndIntegralNonexistence:E6/second-discriminant
EnriquesSurfacesAndIntegralNonexistence:E6/generic-pic-zero-quotient
EnriquesSurfacesAndIntegralNonexistence:E6/generating-two-section
EnriquesSurfacesAndIntegralNonexistence:E6/spinor-incidences
EnriquesSurfacesAndIntegralNonexistence:E6/square-zero-calculation
EnriquesSurfacesAndIntegralNonexistence:E6/first-ten-curves-forbidden
EnriquesSurfacesAndIntegralNonexistence:E6/opposite-tip-branch
EnriquesSurfacesAndIntegralNonexistence:E6/second-ten-curves-forbidden
EnriquesSurfacesAndIntegralNonexistence:E6/i4-star-incidence-orbits
EnriquesSurfacesAndIntegralNonexistence:E6/no-i4-star
EnriquesSurfacesAndIntegralNonexistence:E7/no-multiple-iii-star
EnriquesSurfacesAndIntegralNonexistence:E7/iii-star-incidence-orbits
EnriquesSurfacesAndIntegralNonexistence:E7/no-simple-iii-star
EnriquesSurfacesAndIntegralNonexistence:E7/restricted-configurations-impossible
EnriquesSurfacesAndIntegralNonexistence:E8/w2-lifting-criterion
EnriquesSurfacesAndIntegralNonexistence:E8/miniversal-deformation
EnriquesSurfacesAndIntegralNonexistence:E8/exceptional-mod4-impossible
EnriquesSurfacesAndIntegralNonexistence:E8/f2-nonexistence
EnriquesSurfacesAndIntegralNonexistence:E8/integral-nonexistence
EnriquesSurfacesAndIntegralNonexistence:E1/nef-half-fibre
EnriquesSurfacesAndIntegralNonexistence:E1/nef-reduction
EnriquesSurfacesAndIntegralNonexistence:E1/distinct-fibration-intersection
EnriquesSurfacesAndIntegralNonexistence:E1/exceptional-fibration-characterization
EnriquesSurfacesAndIntegralNonexistence:E1/extra-special-is-exceptional
EnriquesSurfacesAndIntegralNonexistence:E2/finite-field-descent-specialization
EnriquesSurfacesAndIntegralNonexistence:E2/genus-one-fibre-descent
EnriquesSurfacesAndIntegralNonexistence:E2/no-i0-star
EnriquesSurfacesAndIntegralNonexistence:E3/finite-field-point-count
EnriquesSurfacesAndIntegralNonexistence:E8/tangent-cohomology
EnriquesSurfacesAndIntegralNonexistence:E8/supersingular-nonlifting
-/

namespace TauCeti.Enriques

/-- The matrix in basis (C₁,...,C₈,R,F); this is mathematical data, not a new lattice type. -/
def firstGram : Matrix (Fin 10) (Fin 10) ℤ := !![
  -2,1,0,0,0,0,0,0,0,0;
  1,-2,1,0,0,0,0,0,0,0;
  0,1,-2,1,0,0,0,0,0,0;
  0,0,1,-2,1,0,0,0,1,0;
  0,0,0,1,-2,1,0,0,0,0;
  0,0,0,0,1,-2,1,1,0,0;
  0,0,0,0,0,1,-2,0,0,0;
  0,0,0,0,0,1,0,-2,0,0;
  0,0,0,1,0,0,0,0,-2,1;
  0,0,0,0,0,0,0,0,1,0]

/-- The matrix in basis (C₁,...,C₈,F′,F), with D₈(−1) and U blocks. -/
def secondGram : Matrix (Fin 10) (Fin 10) ℤ := !![
  -2,1,0,0,0,0,0,0,0,0;
  1,-2,1,0,0,0,0,0,0,0;
  0,1,-2,1,0,0,0,0,0,0;
  0,0,1,-2,1,0,0,0,0,0;
  0,0,0,1,-2,1,0,0,0,0;
  0,0,0,0,1,-2,1,1,0,0;
  0,0,0,0,0,1,-2,0,0,0;
  0,0,0,0,0,1,0,-2,0,0;
  0,0,0,0,0,0,0,0,0,1;
  0,0,0,0,0,0,0,0,1,0]

theorem firstGram_symmetric : firstGram.IsSymm := by
  apply Matrix.IsSymm.ext
  intro i j
  fin_cases i <;> fin_cases j <;> decide

theorem secondGram_symmetric : secondGram.IsSymm := by
  apply Matrix.IsSymm.ext
  intro i j
  fin_cases i <;> fin_cases j <;> decide

noncomputable def firstLattice : IntegralLattice (Fin 10 → ℚ) :=
  IntegralLattice.ofGramMatrix (Pi.basisFun ℚ (Fin 10)) firstGram firstGram_symmetric

noncomputable def secondLattice : IntegralLattice (Fin 10 → ℚ) :=
  IntegralLattice.ofGramMatrix (Pi.basisFun ℚ (Fin 10)) secondGram secondGram_symmetric

theorem firstGram_determinant : firstGram.det = -4 := by sorry
theorem secondGram_determinant : secondGram.det = -4 := by sorry

theorem firstLattice_even : firstLattice.IsEven := by sorry
theorem secondLattice_even : secondLattice.IsEven := by sorry

theorem firstLattice_basis_pairing (i j : Fin 10) :
    firstLattice.integralForm
      (IntegralLattice.ofGramMatrix.basis (Pi.basisFun ℚ (Fin 10))
        firstGram firstGram_symmetric i)
      (IntegralLattice.ofGramMatrix.basis (Pi.basisFun ℚ (Fin 10))
        firstGram firstGram_symmetric j) = firstGram i j := by
  exact IntegralLattice.integralForm_ofGramMatrix_apply _ _ _ _ _

theorem secondLattice_basis_pairing (i j : Fin 10) :
    secondLattice.integralForm
      (IntegralLattice.ofGramMatrix.basis (Pi.basisFun ℚ (Fin 10))
        secondGram secondGram_symmetric i)
      (IntegralLattice.ofGramMatrix.basis (Pi.basisFun ℚ (Fin 10))
        secondGram secondGram_symmetric j) = secondGram i j := by
  exact IntegralLattice.integralForm_ofGramMatrix_apply _ _ _ _ _

-- firstGram tests: the R-to-C₄ edge, R-to-F degree and isotropic F distinguish the model.
-- test_first_r_c4
example : firstGram 8 3 = 1 := by decide
-- test_first_r_f
example : firstGram 8 9 = 1 := by decide
-- test_first_f_square
example : firstGram 9 9 = 0 := by decide
-- secondGram tests: a U block, no C₄-to-F′ edge, and the D₈ fork distinguish it from N₁.
-- test_second_u
example : secondGram 8 8 = 0 ∧ secondGram 8 9 = 1 := by decide
-- test_second_orthogonal
example : secondGram 8 3 = 0 := by decide
-- test_second_fork
example : secondGram 5 6 = 1 ∧ secondGram 5 7 = 1 := by decide

-- The native discriminant form is a HALF-norm modulo Z, not a full norm modulo 2Z.
example (x : firstLattice.dualCarrier) :
    firstLattice.discriminantQuadraticMap firstLattice_even (Submodule.Quotient.mk x) =
      ((firstLattice.form x x / 2 : ℚ) : AddCircle (1 : ℚ)) := by
  exact IntegralLattice.discriminantQuadraticMap_mk _ _ _
example : ((-2 / 2 : ℚ) : AddCircle (1 : ℚ)) = 0 := by sorry
example : ((-1 / 2 : ℚ) : AddCircle (1 : ℚ)) ≠ 0 := by sorry

/-- Representatives of Q₂ˣ/(Q₂ˣ)², expressed first as rational numbers. -/
def dyadicRepresentative (e a b : Fin 2) : ℚ := (-1) ^ e.val * 2 ^ a.val * 5 ^ b.val

/-- Four global twists, all units in Z[1/2]; the exponent of 5 is deliberately absent. -/
def globalTwist (e a : Fin 2) : ℚ := (-1) ^ e.val * 2 ^ a.val

theorem dyadicRepresentative_nonzero (e a b : Fin 2) : dyadicRepresentative e a b ≠ 0 := by sorry
theorem dyadicRepresentative_decomposition (e a b : Fin 2) :
    dyadicRepresentative e a b = globalTwist e a * 5 ^ b.val := by sorry
theorem globalTwist_nonzero (e a : Fin 2) : globalTwist e a ≠ 0 := by sorry

theorem globalTwist_removes_ramified_part (e a b : Fin 2) :
    dyadicRepresentative e a b * globalTwist e a = 5 ^ b.val * (2 ^ a.val : ℚ) ^ 2 := by sorry

-- This adapter specializes the imported local-field unit filtration; it is not new local-field theory.
theorem dyadic_square_classes (x : ℚ_[2]) (hx : x ≠ 0) :
    ∃! t : Fin 2 × Fin 2 × Fin 2,
      IsSquare (x / (dyadicRepresentative t.1 t.2.1 t.2.2 : ℚ_[2])) := by sorry

-- Representatives: the three independent classes and the mixed class all survive.
-- test_dyadic_minus_one
example : dyadicRepresentative 1 0 0 = -1 := by norm_num [dyadicRepresentative]
-- test_dyadic_two
example : dyadicRepresentative 0 1 0 = 2 := by norm_num [dyadicRepresentative]
-- test_dyadic_five
example : dyadicRepresentative 0 0 1 = 5 := by norm_num [dyadicRepresentative]
-- test_dyadic_mixed
example : dyadicRepresentative 1 1 1 = -10 := by norm_num [dyadicRepresentative]
-- Global twists: omitting 2 or adding a global 5 twist would fail these.
-- test_global_one
example : globalTwist 0 0 = 1 := by norm_num [globalTwist]
-- test_global_sign
example : globalTwist 1 0 = -1 := by norm_num [globalTwist]
-- test_global_two
example : globalTwist 0 1 = 2 ∧ globalTwist 1 1 = -2 := by norm_num [globalTwist]

end TauCeti.Enriques
