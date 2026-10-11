import Mathlib.Algebra.Field.ZMod
import Mathlib.Data.ZMod.Basic
import Mathlib.NumberTheory.Padics.PadicNumbers
import Mathlib.FieldTheory.IntermediateField.Adjoin.Basic
import Mathlib.FieldTheory.Minpoly.Basic
import Mathlib.FieldTheory.Galois.Basic
import Mathlib.RingTheory.AdjoinRoot
import Mathlib.LinearAlgebra.Matrix.Trace
import Mathlib.LinearAlgebra.Matrix.GeneralLinearGroup.Defs
import Mathlib.AlgebraicGeometry.EllipticCurve.Weierstrass
import TauCeti.FieldTheory.Galois.AbsoluteGaloisGroup
import TauCeti.RepresentationTheory.Homological.ContCohomology.LowDegree
import TauCeti.RepresentationTheory.Homological.ContCohomology.Functoriality

/-!
This file is not the roadmap and is not exhaustive. The roadmap document is definitive.
The statements suggest Lean forms so that contributors and reviewers converge on names and
signatures. They are specifications, with no implementation claim.

The pinned libraries do not declare the supplier carriers for BCDT Weil types, wild Breuil
modules, finite-flat model filtrations or their category deformation rings. PROTOCOL section 13
requires unavailable conditions to be left out. The omission index at the end gives every affected
node, API and test its exact name and contract; it does not pretend those comments elaborate.
The declarations here are native field, polynomial, matrix and cohomology fragments. A fragment
is explicitly distinguished from the full mathematical target. No proposition placeholder or
abstract substitute framework represents an unavailable arithmetic condition.
-/

noncomputable section
open Polynomial

namespace TauCeti.EllipticCurveModularityWild3Adic

local instance : Fact (Nat.Prime 3) := ⟨by decide⟩
abbrev Q3 := Padic 3
abbrev Q3bar := AlgebraicClosure Q3
abbrev F3 := ZMod 3
abbrev M2 := Matrix (Fin 2) (Fin 2) F3

/-! W3.1: actual intermediate fields. Root equations are hypotheses of the theorems, rather
than hidden in a replacement field structure. The generators lie in the native algebraic closure.
The splitting-field degree statements do not assert a valuation on that closure. -/

def cubicCyclicPolynomial : Polynomial Q3 := X ^ 3 - C 3 * X ^ 2 + C 3

def cubicNonabelianPolynomial : Polynomial Q3 := X ^ 3 - C 3 * X ^ 2 + C 6

noncomputable def cyclicCubicField (π : Q3bar) : IntermediateField Q3 Q3bar :=
  IntermediateField.adjoin Q3 {π}

noncomputable def nonabelianCubicField (π : Q3bar) : IntermediateField Q3 Q3bar :=
  IntermediateField.adjoin Q3 {π}

noncomputable def nonabelianCubicSplittingField (π j : Q3bar) :
    IntermediateField Q3 Q3bar := IntermediateField.adjoin Q3 {π, j}

noncomputable def positiveQuadraticField (α β : Q3bar) : IntermediateField Q3 Q3bar :=
  IntermediateField.adjoin Q3 {α / β}

noncomputable def positiveQuadraticSplittingField (s j α β : Q3bar) :
    IntermediateField Q3 Q3bar := IntermediateField.adjoin Q3 {s, j, α, β}

noncomputable def negativeQuadraticField (α β : Q3bar) : IntermediateField Q3 Q3bar :=
  IntermediateField.adjoin Q3 {(α - 1) / β}

noncomputable def negativeQuadraticSplittingField (s j α β : Q3bar) :
    IntermediateField Q3 Q3bar := IntermediateField.adjoin Q3 {s, j, α, β}

noncomputable def extendedTypeField (α β : Q3bar) : IntermediateField Q3 Q3bar :=
  IntermediateField.adjoin Q3 {α / β}

noncomputable def extendedTypeSplittingField (s j α β : Q3bar) :
    IntermediateField Q3 Q3bar := IntermediateField.adjoin Q3 {s, j, α, β}

/-- W3.1/cubic-cyclic-field: the minpoly part of cyclicCubic_minpoly. -/
theorem cyclicCubic_minpoly (π : Q3bar) (hπ : π ^ 3 - 3 * π ^ 2 + 3 = 0) :
    minpoly Q3 π = cubicCyclicPolynomial ∧
      aeval (π ^ 2 - 2 * π) cubicCyclicPolynomial = 0 ∧
      aeval (3 + π - π ^ 2) cubicCyclicPolynomial = 0 := by
  sorry

/-- Native degree part of cyclicCubic_uniformizer; the valuation assertion is indexed below. -/
theorem cyclicCubic_finrank (π : Q3bar) (hπ : π ^ 3 - 3 * π ^ 2 + 3 = 0) :
    Module.finrank Q3 (cyclicCubicField π) = 3 := by
  sorry

/-- The specified automorphism acts on the actual native cubic field. -/
theorem cyclicCubic_galois (π : Q3bar) (hπ : π ^ 3 - 3 * π ^ 2 + 3 = 0) :
    ∃ σ : (cyclicCubicField π) ≃ₐ[Q3] (cyclicCubicField π),
      orderOf σ = 3 ∧
      (∀ x : cyclicCubicField π, (x : Q3bar) = π →
        ((σ x : cyclicCubicField π) : Q3bar) = π ^ 2 - 2 * π) ∧
      ∀ τ : (cyclicCubicField π) ≃ₐ[Q3] (cyclicCubicField π),
        ∃ n : Fin 3, τ = σ ^ n.val := by
  sorry

-- cyclicCubic_roots
example (π : Q3bar) (hπ : π ^ 3 - 3 * π ^ 2 + 3 = 0) :
    aeval (π ^ 2 - 2 * π) cubicCyclicPolynomial = 0 ∧
      aeval (3 + π - π ^ 2) cubicCyclicPolynomial = 0 := by
  sorry

-- cyclicCubic_order
example (π : Q3bar) (hπ : π ^ 3 - 3 * π ^ 2 + 3 = 0) :
    let f : Q3bar → Q3bar := fun x => x ^ 2 - 2 * x
    f (f (f π)) = π ∧ f π ≠ π := by
  sorry

/-- The native degree assertions in nonabelianCubic_fields. -/
theorem nonabelianCubic_finranks (π j : Q3bar)
    (hπ : π ^ 3 - 3 * π ^ 2 + 6 = 0) (hj : j ^ 2 = -1) :
    Module.finrank Q3 (nonabelianCubicField π) = 3 ∧
      Module.finrank Q3 (nonabelianCubicSplittingField π j) = 6 := by
  sorry

-- nonabelianCubic_polynomial
example (π j : Q3bar) (hπ : π ^ 3 - 3 * π ^ 2 + 6 = 0) (hj : j ^ 2 = -1) :
    aeval ((j * π ^ 2 - π + 3 * (1 - j)) / 2) cubicNonabelianPolynomial = 0 := by
  sorry

/-- The field-degree part of positiveQuadratic_generators, without a valuation placeholder. -/
theorem positiveQuadratic_finrank (s j α β : Q3bar)
    (hs : s ^ 2 = 3) (hj : j ^ 2 = -1)
    (hα : α ^ 3 - 3 * α + 3 = 0) (hβ : β ^ 2 = s) :
    Module.finrank Q3 (positiveQuadraticField α β) = 12 ∧
      Module.finrank Q3 (positiveQuadraticSplittingField s j α β) = 24 := by
  sorry

-- positiveQuadratic_involution: the native generator calculation.
example (β j : Q3bar) (hβ : β ≠ 0) (hj : j ^ 2 = -1) :
    j * (j * β) = -β ∧ -β ≠ β := by
  sorry

/-- Native field-degree part of negativeQuadratic_generators. -/
theorem negativeQuadratic_finrank (s j α β : Q3bar)
    (hs : s ^ 2 = -3) (hj : j ^ 2 = -1)
    (hα : α ^ 3 = 4) (hβ : β ^ 2 = -s) :
    Module.finrank Q3 (negativeQuadraticField α β) = 12 ∧
      Module.finrank Q3 (negativeQuadraticSplittingField s j α β) = 24 := by
  sorry

/-- Native algebraic identity behind negativeQuadratic_wrongUniformizer. -/
theorem negativeQuadratic_shiftedEisenstein (α : Q3bar) (hα : α ^ 3 = 4) :
    (α - 1) ^ 3 + 3 * (α - 1) ^ 2 + 3 * (α - 1) - 3 = 0 := by
  sorry

/-- Native field-degree part of extendedTypeField_generators. -/
theorem extendedTypeField_finrank (i : Fin 3) (s j α β : Q3bar)
    (hs : s ^ 2 = -3) (hj : j ^ 2 = -1)
    (hα : α ^ 3 = 3 * (1 + 3 * (i.val : Q3bar))) (hβ : β ^ 2 = -s) :
    Module.finrank Q3 (extendedTypeField α β) = 12 ∧
      Module.finrank Q3 (extendedTypeSplittingField s j α β) = 24 := by
  sorry

/-- The polynomial relation part of extendedTypeField_uniformizer. -/
theorem extendedTypeField_uniformizerPolynomial (i : Fin 3) (s α β : Q3bar)
    (hs : s ^ 2 = -3) (hα : α ^ 3 = 3 * (1 + 3 * (i.val : Q3bar)))
    (hβ : β ^ 2 = -s) :
    (α / β) ^ 12 = -3 * (1 + 3 * (i.val : Q3bar)) ^ 4 := by
  sorry

-- extendedTypeField_indexTwo: the algebraic equation part.
example (s α β : Q3bar) (hs : s ^ 2 = -3) (hα : α ^ 3 = 21)
    (hβ : β ^ 2 = -s) : (α / β) ^ 12 = -3 * 7 ^ 4 := by
  sorry

/-! W3.2: the entry formulas use native matrix linear maps. These are the cochain-level
fragments, not substitutes for the maps on continuous self-extension classes. -/

def thetaLowerLeft : M2 →ₗ[F3] F3 where
  toFun A := A 1 0
  map_add' _ _ := by sorry
  map_smul' _ _ := by sorry

def thetaOneDiagonal : M2 →ₗ[F3] F3 where
  toFun A := A 1 1
  map_add' _ _ := by sorry
  map_smul' _ _ := by sorry

def thetaOmegaDiagonal : M2 →ₗ[F3] F3 where
  toFun A := A 0 0
  map_add' _ _ := by sorry
  map_smul' _ _ := by sorry

/-- Native matrix part of theta_fixedDeterminant. -/
theorem theta_fixedDeterminant_entries (A : M2) (hA : Matrix.trace A = 0) :
    thetaOneDiagonal A = -thetaOmegaDiagonal A := by
  sorry

-- theta_split: native entry fragment.
example : thetaLowerLeft 0 = 0 ∧ thetaOneDiagonal 0 = 0 ∧ thetaOmegaDiagonal 0 = 0 := by
  sorry

-- theta_upperRight: native entry fragment.
example (b : F3) :
    thetaLowerLeft !![0, b; 0, 0] = 0 ∧
      thetaOneDiagonal !![0, b; 0, 0] = 0 ∧
      thetaOmegaDiagonal !![0, b; 0, 0] = 0 := by
  sorry

-- theta_traceZero: native entry fragment.
example (a b : F3) :
    thetaOneDiagonal !![a, b; 0, -a] = -thetaOmegaDiagonal !![a, b; 0, -a] := by
  sorry

/-- The exact matrix injection in theta-kernel-criterion, on the native trace-zero submodule. -/
def adjointKernelEmbedding : (Fin 2 → F3) →ₗ[F3] M2 where
  toFun v := !![-v 1 / (2 : F3), v 0; 0, v 1 / (2 : F3)]
  map_add' _ _ := by sorry
  map_smul' _ _ := by sorry

theorem adjointKernelEmbedding_trace (v : Fin 2 → F3) :
    Matrix.trace (adjointKernelEmbedding v) = 0 := by
  sorry

theorem adjointKernelEmbedding_range :
    LinearMap.range adjointKernelEmbedding =
      (Matrix.traceLinearMap (Fin 2) F3 F3).ker ⊓ thetaLowerLeft.ker := by
  sorry

/-! W3.3--W3.5: actual polynomial quotient coefficient rings. The following formulas are
normal-form data. No Breuil-equivalence or integral generic-fibre predicate is fabricated. -/

abbrev S9 := AdjoinRoot ((X : Polynomial F3) ^ 9)
abbrev S36 := AdjoinRoot ((X : Polynomial F3) ^ 36)

noncomputable def u9 : S9 := AdjoinRoot.root _
noncomputable def u36 : S36 := AdjoinRoot.root _

def cubicGPolynomial (δ : F3) : Polynomial F3 := X ^ 2 - C δ

def cubicCPiPolynomial (δ : F3) : Polynomial F3 := C δ - X ^ 6

-- cyclicCubic_constant
example : (cubicGPolynomial 1).eval 0 = -1 ∧ (cubicCPiPolynomial 1).eval 0 = 1 := by
  sorry

-- nonabelianCubic_constant
example : (cubicCPiPolynomial (-1)).eval 0 = -1 := by
  sorry

/-- The wild correction data part of extendedTypeField_wildCorrections. -/
def extendedHPolynomial (inverse : Bool) : Polynomial F3 :=
  if inverse then 1 + X ^ 6 else 1 - X ^ 6

def extendedTPolynomial (inverse : Bool) : Polynomial F3 :=
  if inverse then -1 + X ^ 6 else -1 - X ^ 6

-- extendedTypeField_wildSign
example : extendedHPolynomial false = 1 - X ^ 6 ∧
    extendedTPolynomial false = -1 - X ^ 6 := by
  sorry

/-- The four weight pairs themselves, without a surrogate finite-flat model carrier. -/
def extendedWeightPairs : Finset (ℕ × ℕ) := {(2, 6), (6, 10), (2, 10), (6, 6)}

/-- The filtration fragment of extendedModel_filtration for the first three families. -/
def extendedNonexceptionalFiltration (r s t : ℕ) (c : F3) :
    Submodule S36 (Fin 2 → S36) :=
  Submodule.span S36 { ![u36 ^ s, 0], ![(c : S36) * u36 ^ t, u36 ^ r] }

/-- The filtration fragment of the exceptional (6,6) forward family. -/
def extendedSixSixFiltration (c c' : F3) : Submodule S36 (Fin 2 → S36) :=
  Submodule.span S36 { ![u36 ^ 6, 0], ![(c : S36) + (c' : S36) * u36 ^ 4, u36 ^ 6] }

-- extendedModel_sixSixUnitCrossTerm: the native filtration distinguishes a unit cross term.
example : ![1, u36 ^ 6] ∈ extendedSixSixFiltration 1 0 := by
  apply Submodule.subset_span
  simp

/-- The exceptional monodromy coefficient fragment of extendedModel_filtration. -/
def extendedSixSixN (c' : F3) : S36 := (c' : S36) * u36 ^ 30

-- extendedModel_sixSixMonodromy: native coefficient fragment.
example : extendedSixSixN 1 = u36 ^ 30 ∧ u36 ^ 30 ≠ 0 := by
  sorry

/-- The parameter map in extended-model-classification is an actual linear map. -/
def extendedSixSixComparison : (Fin 2 → F3) →ₗ[F3] (Fin 2 → F3) where
  toFun v := ![v 0 + v 1, v 0]
  map_add' _ _ := by sorry
  map_smul' _ _ := by sorry

theorem extendedSixSixComparison_formula (c c' : F3) :
    extendedSixSixComparison ![c, c'] = ![c + c', c] := by
  sorry

/-- Native polynomial data for the rank-four obstruction in extended-theta-vanishing. -/
theorem extendedRankFour_ramifiedCoefficient (a c : F3) (hc : c ≠ 0)
    (h : (a : S36) * (c : S36) * u36 ^ 2 ∈ Ideal.span {u36 ^ 6}) : a = 0 := by
  sorry

/-- The Artin coefficient carrier is a native polynomial quotient, not an opaque type. -/
abbrev ArtinThree (n : ℕ) := AdjoinRoot ((X : Polynomial F3) ^ n)

noncomputable def artinT (n : ℕ) : ArtinThree n := AdjoinRoot.root _

abbrev ArtinBreuilCoefficients (n : ℕ) :=
  AdjoinRoot ((X : Polynomial (ArtinThree n)) ^ 36)

noncomputable def artinU (n : ℕ) : ArtinBreuilCoefficients n := AdjoinRoot.root _

/-- The filtration fragment of extendedArtinModel_filtration. Coefficients stay fixed by φ. -/
def extendedArtinFiltration (n r s t : ℕ) (c : F3) :
    Submodule (ArtinBreuilCoefficients n) (Fin 2 → ArtinBreuilCoefficients n) :=
  Submodule.span _
    { ![artinU n ^ s, 0],
      ![(algebraMap (ArtinThree n) (ArtinBreuilCoefficients n)
          ((algebraMap F3 (ArtinThree n) c) + artinT n)) * artinU n ^ t, artinU n ^ r] }

/-- Coefficient-linear u-Frobenius as a native algebra homomorphism. -/
noncomputable def artinUFrobenius (n : ℕ) :
    ArtinBreuilCoefficients n →ₐ[ArtinThree n] ArtinBreuilCoefficients n := by
  sorry

theorem artinUFrobenius_u (n : ℕ) : artinUFrobenius n (artinU n) = artinU n ^ 3 := by
  sorry

theorem artinUFrobenius_coefficients (n : ℕ) (a : ArtinThree n) :
    artinUFrobenius n (algebraMap _ _ a) = algebraMap _ _ a := by
  sorry

-- extendedArtinModel_NOne: native coefficient specialization.
example : artinT 1 = 0 := by
  sorry

-- extendedArtinModel_coefficientFrobenius: native coefficient fragment.
example :
    let T := algebraMap (ArtinThree 2) (ArtinBreuilCoefficients 2) (artinT 2)
    artinUFrobenius 2 T = T ∧ T ^ 3 = 0 ∧ T ≠ 0 := by
  sorry

-- extendedArtinModel_twoTen: the actual filtration exponent is eight.
example (n : ℕ) (c : F3) :
    extendedArtinFiltration n 2 10 8 c =
      Submodule.span _
        { ![artinU n ^ 10, 0],
          ![(algebraMap (ArtinThree n) (ArtinBreuilCoefficients n)
              (algebraMap F3 (ArtinThree n) c + artinT n)) * artinU n ^ 8, artinU n ^ 2] } := by
  sorry

/-! A native additive-group lemma supplies the repaired annihilator step of Corollary 4.6.4.
This does not define a replacement Dieudonné module: it is a lemma about its underlying
finite three-primary additive group once the genuine supplier gives F and its relations. -/

theorem killedByThree_of_frobeniusSquare
    {D : Type*} [AddCommGroup D] (F : D →+ D)
    (hprimary : ∃ n : ℕ, ∀ x : D, (3 ^ n) • x = 0)
    (hF : ∀ x : D, 3 • x = 0 → F x = 0)
    (hFF : ∀ x : D, F (F x) = -(3 • x)) :
    ∀ x : D, 3 • x = 0 := by
  sorry

/-! More native fragments pin the normalization at the missing-carrier boundary. -/

/-- A concrete characteristic-zero order-three matrix for the wild characters. -/
def wildZetaMatrix : Matrix (Fin 2) (Fin 2) Q3 := !![0, -1; 1, -1]

noncomputable def wildZeta : Matrix.GeneralLinearGroup (Fin 2) Q3 :=
  Matrix.GeneralLinearGroup.mkOfDetNeZero wildZetaMatrix (by sorry)

theorem wildZeta_order : orderOf wildZeta = 3 := by
  sorry

-- extendedWildType_uniformizer_square: the native characteristic-zero value fragment.
example :
    ((wildZeta : Matrix (Fin 2) (Fin 2) Q3) -
      (wildZeta⁻¹ : Matrix (Fin 2) (Fin 2) Q3)) ^ 2 =
        (-3 : Q3) • (1 : Matrix (Fin 2) (Fin 2) Q3) := by
  sorry

/-- The actual additive valuation is supplied as a native valuation extending that of Q₃.
No opaque local-field or valuation interface is postulated. -/
theorem cyclicCubic_valuation (v : AddValuation Q3bar (WithTop ℚ))
    (hv : ∀ q : Q3, v (algebraMap Q3 Q3bar q) =
      WithTop.map (fun n : ℤ => (n : ℚ)) (Padic.addValuation q))
    (π : Q3bar) (hπ : π ^ 3 - 3 * π ^ 2 + 3 = 0) :
    v π = ((1 / 3 : ℚ) : WithTop ℚ) := by
  sorry

-- positiveQuadratic_valuation
example (v : AddValuation Q3bar (WithTop ℚ))
    (hv : ∀ q : Q3, v (algebraMap Q3 Q3bar q) =
      WithTop.map (fun n : ℤ => (n : ℚ)) (Padic.addValuation q))
    (s α β : Q3bar) (hs : s ^ 2 = 3)
    (hα : α ^ 3 - 3 * α + 3 = 0) (hβ : β ^ 2 = s) :
    v (α / β) = ((1 / 12 : ℚ) : WithTop ℚ) := by
  sorry

-- negativeQuadratic_wrongUniformizer
example (v : AddValuation Q3bar (WithTop ℚ))
    (hv : ∀ q : Q3, v (algebraMap Q3 Q3bar q) =
      WithTop.map (fun n : ℤ => (n : ℚ)) (Padic.addValuation q))
    (s α β : Q3bar) (hs : s ^ 2 = -3)
    (hα : α ^ 3 = 4) (hβ : β ^ 2 = -s) :
    v (α / β) = ((-1 / 4 : ℚ) : WithTop ℚ) ∧
      v ((α - 1) / β) = ((1 / 12 : ℚ) : WithTop ℚ) := by
  sorry

-- native valuation part of extendedTypeField_uniformizer
example (v : AddValuation Q3bar (WithTop ℚ))
    (hv : ∀ q : Q3, v (algebraMap Q3 Q3bar q) =
      WithTop.map (fun n : ℤ => (n : ℚ)) (Padic.addValuation q))
    (i : Fin 3) (s α β : Q3bar) (hs : s ^ 2 = -3)
    (hα : α ^ 3 = 3 * (1 + 3 * (i.val : Q3bar))) (hβ : β ^ 2 = -s) :
    v (α / β) = ((1 / 12 : ℚ) : WithTop ℚ) := by
  sorry

/-- The existing continuous H¹ carrier needs an actual joint-continuity hypothesis.
This example records that signature and does not re-define continuous cohomology. -/
example {G : Type*} [Group G] [TopologicalSpace G]
    {M : Type*} [AddCommGroup M] [TopologicalSpace M] [IsTopologicalAddGroup M]
    [DistribMulAction G M] [ContinuousSMul G M] :
    (TauCeti.ContCohomology.Z1 G M) →+ TauCeti.ContCohomology.H1 G M :=
  TauCeti.ContCohomology.H1pi G M

end TauCeti.EllipticCurveModularityWild3Adic

/-! Full-contract omission index.

Every entry below is a mathematical specification, not an elaborated declaration.
The names designate the full contracts in the definitive packet. Native declarations above
supply only the explicitly stated field, valuation, coefficient, filtration, matrix or cohomology
fragments. Their existence does not discharge omitted type, model, Ext, modularity or API
conditions. In particular the polynomial filtration alone is not a Breuil module, the matrix
entry maps alone are not Θ on continuous H¹, and the additive annihilator lemma alone
does not identify a category deformation ring.

Supplier boundary: the full types and compact admittance use R08.3/R16.3; finite-flat
models, coefficient filtrations, Dieudonné operators and Ext comparisons use R07.1/R07.4;
category deformation rings use R08.6; paired twists and modularity use their stated modular
curve, elliptic, Tate and classical-lifting suppliers. The packet requests give exact contracts.
Instantiate these names in those native carriers when available. Do not introduce an opaque
replacement structure or proposition-valued arithmetic-condition field.

EllipticCurveModularityWild3Adic:W3.0/cubic-types
Target name: cubicTypes (definition).
Full contract: Fix an order-three matrix ζ in GL₂(Z₃). The Q₃-type τ₁ is the two-dimensional inertia
representation corresponding by arithmetic reciprocity to the character of Z₃× with values −1↦1 and 4↦ζ. The
type τ₋₁ is the representation obtained from the unramified quadratic field Q₃(j), j²=−1, whose unit character
has values 4j↦1, 4↦1 and 1+3j↦ζ. These specify isomorphism classes, not chosen matrices or a finite-image Weil
representation. Extend the inertia classes to Weil representations as in the supplier’s type definition.
API cubicType_exists: The listed unit values extend to the required continuous characters with open kernel.
API cubicType_values: Evaluate τ₁ at −1 and 4, and the inducing character of τ₋₁ at 4j, 4 and 1+3j, with the
values in the statement.
API cubicType_independent_zeta: Replacing ζ by another order-three realization gives an isomorphic inertia
type.
API cubicType_weil_extension: The constructed objects meet the BCDT inertia-type predicate of R08.3; their
associated compact types are the R16.3 objects, with the same arithmetic reciprocity convention.
Test tauOne_four: τ₁(Art₃(4)) has order three.
Test tauMinusOne_four: The inducing character of τ₋₁ is trivial on 4 and nontrivial on 1+3j.
Test tauMinusOne_frobenius: The unramified quadratic conjugation inverts the cubic character.

EllipticCurveModularityWild3Adic:W3.0/ramified-quadratic-types
Target name: ramifiedQuadraticTypes (definition).
Full contract: Let ζ have order three. The type τ₃ restricts to the unit character of Q₃(√3) with −1↦−1, 4↦1
and 1+√3↦ζ. The type τ₋₃ restricts to the unit character of Q₃(√−3) with −1↦−1, 4↦1, 1+3√−3↦1 and 1+√−3↦ζ. Use
the unique two-dimensional Q₃ inertia-type class extending each restriction. These have order-six inducing
characters and include the quadratic action, rather than treating the inducing character as a character of
Q₃×.
API quadraticWildType_exists: The specified character and its rank-two inertia extension exist.
API quadraticWildType_values: All generator values are the ones in the statement; in particular the τ₋₃
character is trivial on 1+3√−3.
API quadraticWildType_unique: An inertia type with the indicated restriction is isomorphic to τ₃ or τ₋₃
respectively.
API quadraticWildType_nativeType: These are instances of the supplier’s BCDT inertia type, with the R16.3
compact type and arithmetic normalization.
Test tauThree_minusOne: The inducing character takes −1 to −1.
Test tauMinusThree_deepUnit: The τ₋₃ character takes 1+3√−3 to 1.
Test tauThree_wildGenerator: The τ₃ character takes 1+√3 to a nontrivial cube root of unity.

EllipticCurveModularityWild3Adic:W3.0/extended-types
Target name: extendedTypes (definition).
Full contract: For i∈Z/3, let K=Q₃(√−3). The extended type τ′ᵢ is the rank-two Weil representation whose
restriction to W_K corresponds under arithmetic reciprocity to the character of K× given by √−3↦ζ−ζ⁻¹, −1↦−1,
4↦1, 1+3√−3↦ζ and 1+√−3↦ζⁱ. Fix the full Weil isomorphism class, including its uniformizer value. Its inertia
restriction has finite image, but the full Weil representation need not have finite image. In particular an
unramified twist of the inertia restriction alone does not specify τ′ᵢ.
API extendedWildType_exists: The indicated character determines the extended rank-two Weil type τ′ᵢ.
API extendedWildType_values: Evaluate the inducing character on all five listed generators.
API extendedWildType_inertia: Restrict τ′ᵢ to inertia to obtain its BCDT inertia type, forgetting only the
Frobenius datum.
API extendedWildType_uniformizer: Among the extensions with the same inertia restriction, the value ζ−ζ⁻¹ at
√−3 singles out this extended type class.
API extendedWildType_compactInvolution: Its extended compact type includes the w₃ action used in simple
admittance and in lifting Theorem 1.4.2.
Test extendedWildType_uniformizer_square: The square of the inducing value at √−3 is −3 in characteristic
zero.
Test extendedWildType_deepUnit: The inducing character takes 1+3√−3 to ζ, not to 1.
Test extendedWildType_unramifiedTwist: Multiplying the uniformizer value by −1 keeps the inertia restriction
but does not give the chosen extended type.
Test extendedWildType_index: At i=0,1,2 the value on 1+√−3 is 1,ζ,ζ² respectively.

EllipticCurveModularityWild3Adic:W3.1/cubic-cyclic-field
Target name: cyclicCubicField (construction).
Full contract: Let π be a root of X³−3X²+3. Put F₁=F′₁=Q₃(π). This is totally ramified cyclic of degree three,
with π a uniformizer, and γ₃(π)=π²−2π generates its Galois group. The remaining root is 3+π−π². The Breuil
coefficients are G(u)=u²−1, cπ=1−u⁶ in F₃[u]/u⁹, and Hγ₃=u−2.
API cyclicCubic_minpoly: The minimal polynomial of π is X³−3X²+3 and the other roots are π²−2π and 3+π−π².
API cyclicCubic_uniformizer: The normalized integer valuation of π is one; [F₁:Q₃]=e=3 and f=1.
API cyclicCubic_galois: The stated γ₃ is an automorphism of exact order three and generates Gal(F₁/Q₃).
API cyclicCubic_breuilData: With the supplier’s N(u)=+u convention, G=u²−1, cπ=1−u⁶ and Hγ₃=u−2.
Test cyclicCubic_roots: Both displayed conjugates satisfy X³−3X²+3=0.
Test cyclicCubic_constant: G(0)=−1 and cπ(0)=1.
Test cyclicCubic_order: γ₃³(π)=π and γ₃(π)≠π.

EllipticCurveModularityWild3Adic:W3.1/cubic-nonabelian-field
Target name: nonabelianCubicSplittingField (construction).
Full contract: Let π³−3π²+6=0, let j²=−1, put F₋₁=Q₃(π) and F′₋₁=F₋₁(j). The cubic F₋₁/Q₃ is totally ramified,
F′₋₁/F₋₁ is unramified quadratic, and Gal(F′₋₁/Q₃) is generated by γ₂ fixing π and negating j and by γ₃ fixing
j and taking π to (jπ²−π+3(1−j))/2. Their orders are two and three, and γ₂γ₃=γ₃²γ₂. The Breuil data are
G=u²−2, cπ=−1−u⁶, Hγ₂=1 and Hγ₃=((j−1)u²+(3−j)u−2)/4.
API nonabelianCubic_fields: The degrees are three and six over Q₃, with common ramification index three and
residue degrees one and two.
API nonabelianCubic_generators: The displayed maps generate Gal(F′₋₁/Q₃) with γ₂²=γ₃³=1 and γ₂γ₃=γ₃²γ₂.
API nonabelianCubic_uniformizer: π is a uniformizer in both F₋₁ and F′₋₁.
API nonabelianCubic_breuilData: The four polynomials in the statement satisfy the supplier’s equations
γ(π)=πHγ(π) and cπ=−φ(G).
Test nonabelianCubic_polynomial: The displayed γ₃(π) satisfies X³−3X²+6=0.
Test nonabelianCubic_conjugation: γ₂ conjugates γ₃ to γ₃⁻¹.
Test nonabelianCubic_constant: cπ(0)=−1 whereas the cyclic cubic has cπ(0)=1.

EllipticCurveModularityWild3Adic:W3.1/positive-quadratic-field
Target name: positiveQuadraticSplittingField (construction).
Full contract: Let s²=3, j²=−1, α³−3α+3=0 and β²=s. Set F′₃=Q₃(s,j,α,β). It has degree 24, e=12 and f=2; over
Q₃(s) it is the abelian extension of degree twelve whose norm subgroup is topologically generated by 3,4,1+3s.
Let q∈1+3Z₃ satisfy q²=−5. Choose γ₃ fixing j and β and sending α to (−2sα²−(3s+q)α+4s)/(2q); γ₂ fixes α,β and
negates j; γ₄ fixes α,j and takes β to jβ. γ₂²=γ₃³=γ₄⁴=1, γ₂γ₃=γ₃γ₂, γ₄γ₂=γ₂γ₄⁻¹ and γ₄γ₃=γ₃²γ₄; γ₄² has order
TWO. The residue field is F₉, γ₂ acts on it by x↦x³, and γ₃,γ₄ act trivially on it. Put π=α/β and
F₃=(F′₃)^{γ₂}=Q₃(π). Then π is a uniformizer. Its Eisenstein polynomial has form u¹²−3G(u), G(0)=1, cπ(0)=−1;
Hγ₂=1, Hγ₄=−j, Hγ₃≡1+u² modulo (3,u⁴). For g,g′ in ⟨γ₂,γ₄⟩ the corrections tg and fg,g′ vanish.
API positiveQuadratic_norms: Its norm subgroup over Q₃(s) is the closure of the subgroup generated by
3,4,1+3s.
API positiveQuadratic_generators: The generators act as stated, satisfy the quartic relations, and γ₄² has
order two.
API positiveQuadratic_uniformizer: π=α/β has Q₃-normalized valuation 1/12 and generates the γ₂-fixed field.
API positiveQuadratic_breuilData: The stated constant terms and H/t/f congruences use the wild Breuil
supplier’s correction operators.
Test positiveQuadratic_valuation: v₃(α/β)=1/3−1/4=1/12.
Test positiveQuadratic_involution: γ₄²(β)=−β≠β and (γ₄²)²=1.
Test positiveQuadratic_constant: G(0)=1 and cπ(0)=−1.

EllipticCurveModularityWild3Adic:W3.1/negative-quadratic-field
Target name: negativeQuadraticSplittingField (construction).
Full contract: Let s²=−3, j²=−1, α³=4 and β²=−s. Set F′₋₃=Q₃(s,j,α,β), with degree 24, e=12, f=2. Over Q₃(s)
its norm subgroup is topologically generated by −3,4,1+3s. The generators γ₂,γ₃,γ₄ respectively fix α,β and
negate j; fix j,β and take α to (−1−s)α/2; fix α,j and take β to jβ. γ₂²=γ₃³=γ₄⁴=1, γ₂γ₃=γ₃γ₂, γ₄γ₂=γ₂γ₄⁻¹ and
γ₄γ₃=γ₃²γ₄; γ₄² has order TWO. The residue field is F₉, γ₂ acts on it by x↦x³, and γ₃,γ₄ act trivially on it.
The uniformizer is π=(α−1)/β, and F₋₃=(F′₋₃)^{γ₂}=Q₃(π). In the Eisenstein presentation u¹²−3G, G(0)=−1 and
cπ(0)=1; Hγ₂=1, Hγ₄=−j and Hγ₃≡1+u² modulo (3,u⁴). Corrections tg,fg,g′ vanish on ⟨γ₂,γ₄⟩. The printed α/β is
not a uniformizer in this field.
API negativeQuadratic_norms: The norm subgroup over Q₃(s) is the closure generated by −3,4,1+3s.
API negativeQuadratic_generators: The three displayed maps satisfy the quartic relations and realize the
residue Frobenius and inertia.
API negativeQuadratic_uniformizer: The corrected π=(α−1)/β has v₃=1/12 and generates the fixed field.
API negativeQuadratic_breuilData: Recalculate Hγ and the Eisenstein constant at the corrected π; they have the
stated signs and congruences.
Test negativeQuadratic_wrongUniformizer: v₃(α/β)=−1/4, whereas v₃((α−1)/β)=1/12.
Test negativeQuadratic_norm: The norm from F′₋₃ to Q₃(s) of (α−1)/β is −3.
Test negativeQuadratic_constant: G(0)=−1 and cπ(0)=1.

EllipticCurveModularityWild3Adic:W3.1/extended-type-fields
Target name: extendedTypeSplittingField (construction).
Full contract: For i∈Z/3 use its integer lift ĩ∈{0,1,2}. Let s²=−3, j²=−1, α³=3(1+3ĩ) and β²=−s. Put
F′ᵢ=Q₃(s,j,α,β), of degree 24 with e=12,f=2. Its norm subgroup over Q₃(s) is topologically generated by
−3,4,1+9s,1+(1−3ĩ)s. The generators act by γ₂(j)=−j, γ₂(α)=α, γ₂(β)=β; γ₃ fixes j,β and takes α to (−1−s)α/2;
γ₄ fixes j,α and takes β to jβ. γ₂²=γ₃³=γ₄⁴=1, γ₂γ₃=γ₃γ₂, γ₄γ₂=γ₂γ₄⁻¹ and γ₄γ₃=γ₃²γ₄; γ₄² has order TWO. The
residue field is F₉, γ₂ acts on it by x↦x³, and γ₃,γ₄ act trivially on it. Put π=α/β and Fᵢ=(F′ᵢ)^{γ₂}=Q₃(π).
Here π¹²=−3(1+3ĩ)⁴, so G=−(1+3ĩ)⁴ and cπ=1 in F₃[u]/u³⁶. Exactly Hγ₃±¹=−(1∓(1+3ĩ)⁻²u⁶)/2, hence modulo
three Hγ₃±¹=1∓u⁶ and modulo (3,u¹²) tγ₃±¹=−1∓u⁶. Hγ₂=1,Hγ₄=−j; corrections on ⟨γ₂,γ₄⟩ vanish and
fγ₃±¹,γ₃±¹,fγ₃±¹,γ₃∓¹ vanish modulo (3,u¹²).
API extendedTypeField_norms: The four norm generators distinguish i=0,1,2 and identify the required splitting
field through local reciprocity.
API extendedTypeField_generators: The maps realize the quartic presentation, with γ₂ the chosen residue
Frobenius; they are not merely abstract generators.
API extendedTypeField_uniformizer: π=α/β is a uniformizer and satisfies π¹²=−3(1+3ĩ)⁴.
API extendedTypeField_wildCorrections: The listed H,t,f solve the wild descent correction equations of BCDT
Theorem 5.6.1; in particular tγ₃ is not zero.
API extendedTypeField_lift: The lift ĩ is the unique integer in {0,1,2} reducing to i.
Test extendedTypeField_indexTwo: At i=2 the defining α equation is α³=21 and π¹²=−3·7⁴.
Test extendedTypeField_wildSign: Hγ₃=1−u⁶ but tγ₃=−1−u⁶ modulo the stated ideals.
Test extendedTypeField_frobenius: γ₂ fixes α,β and acts by cubing on F₉.
Test extendedTypeField_constant: cπ=1 for all three indices.

EllipticCurveModularityWild3Adic:W3.0/simple-admittance-cubic
Target name: simpleAdmittanceCubic (theorem).
Full contract: For a continuous ρ̄:G₃→GL₂(F₃) whose inertia restriction is a très ramifié extension of ω by 1,
both τ₁ and τ₋₁ simply admit ρ̄ in the exact BCDT §1.3 sense: there is a unique admitting Jordan–Hölder
constituent, it occurs with multiplicity one, and that constituent simply admits ρ̄. With σₙ,ₘ=Symⁿ(F₃²)⊗detᵐ,
the reduction for τ₁ has constituents σ₀,₀,σ₂,₀,σ₀,₁,σ₂,₁, the latter two of multiplicity one; the reduction
for τ₋₁ has constituents σ₀,₀,σ₂,₁,σ₀,₁, the latter two of multiplicity one. The très ramifié condition
excludes the peu branch in the n=0 admission rule.

EllipticCurveModularityWild3Adic:W3.0/simple-admittance-quadratic
Target name: simpleAdmittanceQuadratic (theorem).
Full contract: If ρ̄:G₃→GL₂(F₃) is continuous and its inertia restriction is a très ramifié extension of 1 by
ω, both τ₃ and τ₋₃ simply admit ρ̄. Each compact type reduces to exactly σ′₀,₀ and σ′₁,₁ on U₀(3), each with
multiplicity one; σ′ₘ₁,ₘ₂(diag(a,d))=aᵐ¹dᵐ². Apply the très admission rule rather than an unrestricted
occurrence condition.

EllipticCurveModularityWild3Adic:W3.0/simple-admittance-extended
Target name: simpleAdmittanceExtended (theorem).
Full contract: For every i∈Z/3 and continuous ρ̄:G₃→GL₂(F₃) that is a très ramifié extension of 1 by ω AS A
G₃-REPRESENTATION, τ′ᵢ simply admits ρ̄. The constituents of its extended compact type are σ′_{ {0},1}, σ′_{
{1},1}, σ′_{ {0},−1}, σ′_{ {1},−1}; the latter two have multiplicity one. Here σ′_{ {m},a} restricts to σ′ₘ,ₘ
and has w₃-eigenvalue a for w₃=((0,−1),(3,0)). In particular the trivial quotient character of ρ̄ has
Frobenius value 1, selecting a=−1 in BCDT’s rule.

EllipticCurveModularityWild3Adic:W3.2/cubic-category
Target name: cubicCategory (definition).
Full contract: Normalize ρ̄ over F₃ by an unramified twist to a nonsplit très ramifié extension 0→1→V→ω→0. Let
S(V) be the supplier’s category of finite-length Z₃[G₃]-modules admitting a finite filtration with every
successive quotient isomorphic to V. For δ=±1 define Sδ as the full subcategory of S(V) of generic fibres of
finite flat commutative group schemes over O_{F′δ} equipped with ramified descent data relative to F′δ/Q₃. The
groups may be killed by any power of three, not just by three. Descent on the ramified integer ring is the
specified semilinear family [g]:G→gG with its cocycle law; it is not an assertion that G descends by étale
descent to Z₃. Morphisms are those of S(V).
API cubicCategory_mem: Membership means existence of the specified integral finite-flat model with descent and
an equivariant generic-fibre identification.
API cubicCategory_full: Its morphisms are exactly the G₃-equivariant morphisms in S(V).
API cubicCategory_subquotients: Finite products and S(V)-subquotients stay in Sδ.
API cubicCategory_fixedDeterminant: The category condition defines the R08.6 fixed-cyclotomic-determinant
deformation functor, with tangent H¹_{Sδ}(G₃,ad⁰ρ̄).
Test cubicCategory_zero: The zero module belongs to Sδ.
Test cubicCategory_filtration: The split module 1⊕ω is not in Sδ: in dimension two, a V-filtration would force
it to be isomorphic to the nonsplit V.
Test cubicCategory_ramifiedDescent: A ramified integral model with semilinear descent is admissible without
assuming an integral model over Z₃.
Test cubicCategory_higherTorsion: For a type-τδ Barsotti–Tate lift, every finite three-power quotient of its
Tate lattice belongs to Sδ.

EllipticCurveModularityWild3Adic:W3.2/quadratic-category
Target name: quadraticCategory (definition).
Full contract: Normalize ρ̄ over F₃ to a très ramifié extension 0→ω→V→1→0. On the contravariant special-fibre
Dieudonné module of a finite flat O_{F′δ} group with descent, δ=±3, impose the two-sided operator ideal Iδ
generated by F+V_D and [γ₄²]+1. Here V_D is Verschiebung, distinct from the representation V; F V_D=V_D F=3,
and descent acts semilinearly on Witt coefficients. Define Sδ⊂S(V) as the full subcategory of generic fibres
of models annihilated by Iδ. The condition is on the SPECIAL FIBRE and includes all three-power torsion
levels.
API quadraticIdeal_generators: Membership of a model means F+V_D=0 and [γ₄²]=−1 on its Dieudonné module.
API quadraticIdeal_semilinearity: The operator algebra incorporates the Witt Frobenius and the residue action
of descent.
API quadraticCategory_mem: A module belongs exactly when it has an Iδ-annihilated finite-flat descent model.
API quadraticCategory_subquotients: Finite products and S(V)-subquotients preserve the condition.
API quadraticCategory_tangent: The fixed-cyclotomic category deformation ring has tangent H¹_{Sδ}(G₃,ad⁰ρ̄),
on the R08.6 carrier.
Test quadraticIdeal_sign: F²=−3 whenever F+V_D=0 and FV_D=3.
Test quadraticIdeal_involution: A nonzero special-fibre module with γ₄² acting as +1 is excluded, since 2 is
invertible at three.
Test quadraticCategory_zero: The zero model and zero representation satisfy the condition.

EllipticCurveModularityWild3Adic:W3.2/extended-category
Target name: extendedCategory (definition).
Full contract: For i∈Z/3 and ρ̄ a très ramifié extension 0→ω→V→1→0 over F₃ on the FULL G₃, define Iᵢ on
contravariant Dieudonné modules with descent over F′ᵢ by the generators F+V_D, [γ₄²]+1 and
([γ₃]−[γ₃⁻¹])[γ₂]−F. The third operator has the same residue Frobenius-semilinearity as F. Let Sᵢ be the full
subcategory of S(V) of generic fibres of finite-flat descent models annihilated by Iᵢ, with no bound of three
on their torsion exponent. Changing the sign of the chosen √−3 changes the corresponding reciprocity
generators compatibly and leaves this ideal condition unchanged.
API extendedIdeal_generators: Annihilation means F+V_D=0, γ₄²=−1 and F=([γ₃]−[γ₃⁻¹])[γ₂].
API extendedIdeal_signIndependent: Transport of the reciprocal generators under the opposite quadratic square
root gives the same ideal condition.
API extendedCategory_mem: Membership is precisely the existence of an Iᵢ-annihilated integral descent model
with the specified generic fibre.
API extendedCategory_subquotients: The category is full and closed under finite products and
S(V)-subquotients.
API extendedIdeal_dieudonne: The operator identity is on the contravariant Dieudonné module, with γ₂ acting by
the residue Frobenius.
Test extendedIdeal_thirdGenerator: A nonzero Dieudonné module with F≠([γ₃]−[γ₃⁻¹])[γ₂] is excluded even if
F+V_D=0 and γ₄²=−1.
Test extendedIdeal_zero: The zero module is annihilated by Iᵢ.
Test extendedIdeal_frobenius: On a coefficient a∈F₉, both sides of the third identity transform a into a³.

EllipticCurveModularityWild3Adic:W3.2/theta-maps
Target name: thetaMaps (construction).
Full contract: Let χ=ω for the cubic categories and χ=1 for the quadratic or extended categories. Fix a
nonsplit très ramifié representation 0→χω→ρ̄→χ→0 over F₃. Pull back a self-extension along χω→ρ̄ and push out
along ρ̄→χ to obtain Θ₀:Ext¹(ρ̄,ρ̄)→Ext¹(χω,χ)=H¹(G₃,ω). On ker Θ₀ the exact extension diagram defines Θ₁ and
Θω to Ext¹(χ,χ) and Ext¹(χω,χω), then restricts them to H¹(I₃,F₃). For a cocycle φ representing the block
extension ((ρ̄,φρ̄),(0,ρ̄)), Θ₀([φ])=[φ₂₁]; after choosing φ₂₁=0, Θ₁=[φ₂₂]|I₃ and Θω=[φ₁₁]|I₃. The choices
yield well-defined maps on classes. On H¹(G₃,ad⁰ρ̄)∩ker Θ₀ one has Θ₁=−Θω.
API theta_zero: The pullback–pushout composite is a linear map to H¹(G₃,ω).
API theta_diagonal: The two diagonal maps are linear on ker Θ₀ and then restrict to inertia.
API theta_cocycle: The maps have the entry formulas in the statement, using a representative with φ₂₁=0 for
the diagonals.
API theta_fixedDeterminant: Θ₁=−Θω on the trace-zero kernel.
API theta_cohomology: Pullback, pushout and restriction agree with the native continuous-cohomology
coefficient and restriction maps.
Test theta_split: The split self-extension maps to zero under all three comparisons.
Test theta_upperRight: A cocycle with only upper-right entry nonzero has Θ₀=Θ₁=Θω=0.
Test theta_traceZero: For φ₁₁=−φ₂₂ and φ₂₁=0, the two restricted diagonal classes are negatives.

EllipticCurveModularityWild3Adic:W3.2/theta-kernel-criterion
Target name: thetaKernelCriterion (theorem).
Full contract: For ρ̄ and χ as in theta-maps, there is a G₃-equivariant exact sequence 0→ρ̄⊗χ→ad⁰ρ̄→ω→0, with
(x,y)↦((-y/2,x),(0,y/2)) and quotient the lower-left entry. The sequence 0→F₃→H¹(G₃,ω)→H¹(G₃,ρ̄⊗χ)→H¹(I₃,F₃)
is exact, without a surjectivity assertion at its last term. Thus Θ₁ and Θω have the same one-dimensional
kernel on H¹(G₃,ad⁰ρ̄)∩ker Θ₀. If a category tangent H¹_S(G₃,ad⁰ρ̄) has Θ₀=0 and either diagonal comparison
zero, its dimension over F₃ is at most one.

EllipticCurveModularityWild3Adic:W3.2/cubic-point-factorization
Target name: cubicPointFactorization (theorem).
Full contract: For the normalized F₃-representation defining Sδ, δ=±1, the characteristic-zero type quotient
R^{τδ}_{V,Z₃} of the universal local deformation ring is a quotient of R^{ε,Sδ}_{V,Z₃}. Equivalently every
characteristic-zero Barsotti–Tate lift of type τδ, with determinant the 3-adic cyclotomic ε, has every finite
three-power Tate-lattice quotient in Sδ. Prove the claim for all finite coefficient extensions and transfer it
to the intersection-of-point-kernels definition of the type quotient.

EllipticCurveModularityWild3Adic:W3.2/quadratic-point-factorization
Target name: quadraticPointFactorization (theorem).
Full contract: For δ=±3 and the normalized F₃-representation defining Sδ, R^{τδ}_{V,Z₃} is a quotient of
R^{ε,Sδ}_{V,Z₃}. For a Barsotti–Tate type-τδ lift with determinant ε, its special-fibre Dieudonné module over
F′δ satisfies γ₄²=−1 and F+V_D=0; every finite coefficient-lattice quotient consequently lies in Sδ.

EllipticCurveModularityWild3Adic:W3.3/cubic-rank-one-models
Target name: cubicRankOneModels (theorem).
Full contract: For F=Fδ, δ=±1, the integral models of the constant generic group Z/3 are G(3,δ) and G(1,δ),
while the models of μ₃ are G(0,1) and G(2,1). Here M(r,a) has scalar ring S₉=F₃[u]/(u⁹), filtration uʳSe, and
φ₁(uʳe)=ae. Each base change to F′δ has unique ramified descent compatible with the canonical generic-fibre
descent. The Breuil functor is contravariant: an extension of modules reverses the integral group extension.

EllipticCurveModularityWild3Adic:W3.3/cubic-forward-extensions
Target name: cubicForwardExtensions (theorem).
Full contract: Ext¹(M(2,1),M(1,δ)) consists of exactly the modules parametrized by c∈F₃ with basis e₁,eω,
filtration ⟨ue₁,u²eω+ce₁⟩, φ₁(ue₁)=δe₁, φ₁(u²eω+ce₁)=eω, N(e₁)=0 and N(eω)=cu⁶e₁. Each has unique compatible
descent. Their contravariant generic fibres are precisely the peu ramifié extensions 0→ω→ρ→1→0, including the
split class at c=0.

EllipticCurveModularityWild3Adic:W3.3/cubic-local-local-descent
Target name: cubicLocalLocalDescent (theorem).
Full contract: For any totally ramified abelian cubic extension F̃/Q₃ and a local-local finite flat O_F̃ group
killed by three whose generic fibre is an extension of Z/3 by μ₃, that generic fibre is the base change of a
finite Q₃-group scheme. This is descent of the generic fibre, with no assertion of descent to an integral Z₃-
model.

EllipticCurveModularityWild3Adic:W3.3/cubic-residual-model
Target name: cubicResidualModel (theorem).
Full contract: Ext¹(M(1,δ),M(2,1)) has the nine normal forms c+c′u, c,c′∈F₃, with filtration
⟨u²eω,ue₁+(c+c′u)eω⟩ and Frobenius images eω,δe₁. Each has unique compatible descent; its generic
representation is an extension 0→1→ρ→ω→0, peu ramifié exactly when c=0. Frobenius on the special-fibre
Dieudonné module vanishes exactly when c=0. Every descent model of the normalized très ramifié ρ̄ therefore
has this form with c≠0.

EllipticCurveModularityWild3Adic:W3.3/cubic-rank-one-self-extensions
Target name: cubicRankOneSelfExtensions (theorem).
Full contract: The self-extensions of M(1,δ) are parametrized by b+b′u and have filtration ⟨ue,ue′+(b+b′u)e⟩
with Frobenius δe,δe′. Those of M(2,1) are parametrized by (a+a′u)u and have filtration ⟨u²e,u²e′+(a+a′u)ue⟩
with Frobenius e,e′. Each generic extension splits over an unramified extension exactly when its first
parameter is zero. In the nonabelian cubic field, compatible γ₃ descent has respective diagonal powers H³,H⁶
and off-diagonal constants −bH′γ₃(0),−aH′γ₃(0). These signs agree.

EllipticCurveModularityWild3Adic:W3.3/cubic-rank-three-splitting
Target name: cubicRankThreeSplitting (theorem).
Full contract: A cubic finite-flat group killed by three with a three-step filtration by G(1,δ),G(2,1),G(1,δ),
whose lower two-step generic descent is the normalized très extension, has split quotient by its first piece.
Consequently Θ₀ is zero on every self-extension in Sδ, δ=±1.

EllipticCurveModularityWild3Adic:W3.3/cubic-diagonal-vanishing
Target name: cubicDiagonalVanishing (theorem).
Full contract: For S₁, Θω vanishes on H¹_{S₁}(G₃,ad⁰ρ̄). For S₋₁, Θω vanishes on all Ext¹_{S₋₁}(ρ̄,ρ̄). The
fixed-determinant restriction in the first assertion is essential to the argument and is not removed.

EllipticCurveModularityWild3Adic:W3.3/cubic-tangent-bound
Target name: cubicTangentBound (theorem).
Full contract: For the normalized très ramifié residual representation and δ=±1, dim_{F₃} H¹_{Sδ}(G₃,ad⁰ρ̄)≤1.

EllipticCurveModularityWild3Adic:W3.3/cubic-weak-acceptability
Target name: cubicWeakAcceptability (theorem).
Full contract: Let ρ̄:G₃→GL₂(F₃) be continuous with inertia a très ramifié extension 0→1→ρ̄|I₃→ω→0. Both τ₁
and τ₋₁ are weakly acceptable for ρ̄: for each coefficient ring O in the supplier’s convention the
corresponding type quotient is zero or a quotient of O[[X]]. This does not identify it with O[[X]], prove
formal smoothness, or prove nonzero type points.

EllipticCurveModularityWild3Adic:W3.4/degree-twelve-rank-one-descent
Target name: degreeTwelveRankOneDescent (theorem).
Full contract: For each F±3 or Fᵢ, the models of the constant generic group and of μ₃ are M(r,δ) and M(r,1),
respectively, for even r∈{0,2,4,6,8,10,12}; δ=cπ(0), so δ=−1 for F₃ and δ=1 for F₋₃ and Fᵢ. After scalar
extension to F₉ their canonical descent is γ₂(e)=e, γ₄(e)=−(−j)^{r/2}e for the constant character and
+(−j)^{r/2}e for ω, and γ₃^{±1}(e)=H_{γ₃^{±1}}^{−3r/2}e. The special-fibre involution γ₄² acts as −1 exactly
at r=2,6,10. The constant model is r=12, and the multiplicative model is r=0.

EllipticCurveModularityWild3Adic:W3.4/degree-twelve-adapted-bases
Target name: degreeTwelveAdaptedBases (theorem).
Full contract: In any of the degree-twelve families, let a finite-flat descent model killed by three have
generic fibre filtered by 1 and ω, with induced Breuil filtration whose graded pieces are M′_{rⱼ,χⱼ},
rⱼ∈{2,6,10}. Its special-fibre γ₄² is −1, and its F₃[u]/u³⁶ Breuil module has a filtration-adapted basis eⱼ
lying in φ₁(Fil¹), mapping to the standard generator of each graded piece, and consisting of γ₄ eigenvectors
after extension to F₉.

EllipticCurveModularityWild3Adic:W3.4/quadratic-residual-model
Target name: quadraticResidualModel (theorem).
Full contract: For each of F′±3 and the ideal I±3, a normalized très ramifié ρ̄ over F₃ has exactly one
finite-flat descent model up to isomorphism compatible with its specified generic fibre. Its contravariant
Breuil module fits 0→M′_{10,1}→M′(ρ̄)→M′_{2,ω}→0, and special-fibre Frobenius is nonzero.

EllipticCurveModularityWild3Adic:W3.4/quadratic-push-pull-vanishing
Target name: quadraticPushPullVanishing (theorem).
Full contract: For the residual model M′(ρ̄), pullback along M′_{10,1}→M′(ρ̄) and pushout along
M′(ρ̄)→M′_{2,ω} send every self-extension in the wild Breuil descent category to zero in
Ext¹(M′_{10,1},M′_{2,ω}). Consequently Θ₀=0 on Ext¹_{S±3}(ρ̄,ρ̄).

EllipticCurveModularityWild3Adic:W3.4/quadratic-diagonal-vanishing
Target name: quadraticDiagonalVanishing (theorem).
Full contract: The generic-fibre images of Ext¹(M′_{10,1},M′_{10,1}) and Ext¹(M′_{2,ω},M′_{2,ω}) lie in the
unramified one-dimensional lines of H¹(G₃,F₃). Thus Θω=0 on Ext¹_{S±3}(ρ̄,ρ̄).

EllipticCurveModularityWild3Adic:W3.4/quadratic-tangent-bound
Target name: quadraticTangentBound (theorem).
Full contract: For the normalized très ramifié residual representation and δ=±3, dim_{F₃}H¹_{Sδ}(G₃,ad⁰ρ̄)≤1.

EllipticCurveModularityWild3Adic:W3.4/quadratic-weak-acceptability
Target name: quadraticWeakAcceptability (theorem).
Full contract: If ρ̄:G₃→GL₂(F₃) is continuous and its inertia is a très ramifié extension 0→ω→ρ̄|I₃→1→0, both
τ₃ and τ₋₃ are weakly acceptable: their type quotient over O is zero or a quotient of O[[X]], with the
supplier’s fixed determinant and coefficient convention.

EllipticCurveModularityWild3Adic:W3.1/six-local-cases
Target name: sixLocalCases (definition).
Full contract: Use six tags for the normal forms of a continuous representation G₃→GL₂(F₅) with cyclotomic
determinant, after isomorphism and a quadratic twist. Tag 1 means tame at three. Tag 2 is the Q₃× character
with 3↦ζⁱ(ζ−ζ⁻¹), −1↦1,4↦ζ, i∈Z/3. Tag 3 is the Q₃(j)× character with 3↦2,4j↦1,4↦1,1+3j↦ζ. Tags 4 and 5 are
the Q₃(√3)× and Q₃(√−3)× inducing characters with uniformizer ↦ζ−ζ⁻¹ and unit values of τ₃ and τ₋₃
respectively. Tag 6 is the Q₃(√−3)× inducing character with all five values of τ′ᵢ, now in F₂₅×. Interpret a
character valued in F₂₅× as the indicated two-dimensional F₅ representation, with the quadratic extension
action where required. These six tags are not the six possible conductor factors f=1,3,9,27,81,243 from the
introduction: the tame tag encompasses the first three factors, the two cubic tags have factor 81, the two
quadratic tags have factor 27, and the extended tag has factor 243.
API switchingCase_tame: Tag 1 is equivalent to trivial wild inertia image.
API switchingCase_character: For tags 2–6 the full inducing character takes the stated uniformizer and unit
values.
API switchingCase_equiv: Case membership is invariant under conjugacy, with the quadratic twist recorded as
separate data.
API switchingCase_nativeRepresentation: The predicates concern actual continuous G₃ actions on F₅² and
restriction to the actual quadratic Galois subgroup.
Test switchingCase_goodReduction: The 5-torsion of y²=x³−x over Q₃ is in tag 1.
Test switchingCase_extendedNotNegative: The deep unit 1+3√−3 has nontrivial image in tag 6 and trivial image
in tag 5.
Test switchingCase_uniformizer: For tag 2 at i=0, the uniformizer value has square −3=2 in F₅.
Test switchingCase_primeField: A general F̄₅ representation without an F₅-model is outside this definition.

EllipticCurveModularityWild3Adic:W3.1/six-case-classification
Target name: sixCaseClassification (theorem).
Full contract: Every continuous G₃→GL₂(F₅) representation of cyclotomic determinant is, up to conjugacy and a
quadratic twist, in one of the six switching cases. Nontrivial wild inertia is a normal cyclic subgroup of
order three. The normalizer of F₂₅× and the determinant determine the quadratic field and the uniformizer
values in tags 2–6.

EllipticCurveModularityWild3Adic:W3.1/extended-local-frobenius-sign
Target name: extendedLocalFrobeniusSign (theorem).
Full contract: For a minimal equation E:Y²=X³+AX+B over Q₃ with A≡B+3≡0 modulo nine, its 3-torsion is a très
ramifié extension of 1 by ω. In its conductor-243 5-torsion character, the value at √−3 is +(ζ−ζ⁻¹). Thus the
unramified sign is fixed, rather than known only up to ±1.

EllipticCurveModularityWild3Adic:W3.1/local-paired-curves
Target name: localPairedCurves (construction).
Full contract: For a cyclotomic-determinant F₅ representation in any of the six cases, construct E₁/Q₃ and an
equivariant symplectic identification of E₁[5] with that representation (using a chosen compatible alternating
pairing). No mod-three shape is imposed in tag 1. In tags 2–3 choose E₁[3]|I₃ très ramifié of shape (1,*;0,ω);
in tags 4–5 choose it très ramifié of shape (ω,*;0,1). In tag 6 choose E₁[3] on the full G₃ of shape
(ω,*;0,1), très ramifié, and indecomposable over the splitting field of the given F₅ representation. More
strongly, for tag 6 every prescribed full G₃ very ramified F₃ representation of either extension orientation
can be paired with every index i. The symplectic pairing is fixed after selecting the local torsion
identification, and carried into the global twisted modular curve.
API localPairedCurve_exists: For every case and its given local representation, the stated curve and
equivariant 5-torsion identification exist.
API localPairedCurve_threeShape: Its three-torsion has exactly the orientation and very ramifiedness specified
for the selected case.
API localPairedCurve_extendedPairs: For tag 6 and each i, every prescribed très F₃ extension of either
orientation is realized with the exact F₅ character, including uniformizer sign.
API localPairedCurve_pairing: The pulled-back pairing agrees with the Weil pairing under the selected
5-torsion isomorphism.
API localPairedCurve_notSplit: The tag-6 companion can be chosen indecomposable over the actual splitting
field of the F₅ representation.
Test localCurve_caseOne: y²=x³−x has good reduction at three, so its 5-torsion tests tag 1.
Test localCurve_caseTwo: y²=x³−3x+8 has the abelian cubic wild 5-torsion type, hence tag 2 up to the recorded
quadratic twist.
Test localCurve_caseThree: y²=x³−3x+4 has the nonabelian cubic wild 5-torsion type, hence tag 3.
Test localCurve_caseFour: y²=x³+3x+2 has the conductor-exponent-three degree-twelve 5-torsion type with
quadratic field Q₃(√3), hence tag 4 up to the permitted twist.
Test localCurve_caseFive: y²=x³+3x+6 has the conductor-exponent-three degree-twelve 5-torsion type with
quadratic field Q₃(√−3), hence tag 5 up to the permitted twist.
Test localCurve_caseSix: y²=x³+9x−3 is in the conductor-243 congruence family, with très mod-three torsion and
exact positive uniformizer sign in tag 6 for its index.

EllipticCurveModularityWild3Adic:W3.5/extended-models
Target name: extendedModels (construction).
Full contract: In the wild Breuil descent category over F′ᵢ annihilated by Iᵢ, construct the four
families M′_{r,s} of extensions 0→M′_{s,1}→M′→M′_{r,ω}→0 for (r,s)=(2,6),(6,10),(2,10),(6,6). Over
S₃₆=F₃[u]/u³⁶ use basis e₁,e′ω, filtration ⟨uˢe₁,uʳe′ω+h e₁⟩, and Frobenius images e₁,e′ω. For the first
three pairs h=cu²,cu⁶,cu⁸ respectively, N=0, parameters (c,c₁)∈F₃², and γ₃^{±1} acts respectively by
e₁↦e₁,e′ω↦(1±u¹⁸)(e′ω±c₁u⁶e₁); e₁↦(1∓u¹⁸)e₁,e′ω↦e′ω±c₁u⁶e₁; e₁↦(1∓u¹⁸)e₁,e′ω↦(1±u¹⁸)(e′ω±c₁u¹²e₁). The
γ₄ eigenvalues on (e₁,e′ω) are (−j,−j),(j,j),(j,−j). For (6,6), h=c+c′u⁴, N(e′ω)=c′u³⁰e₁, γ₄ has
eigenvalues (−j,j), and γ₃^{±1}(e′ω)=e′ω+(±c∓c′u¹²−c′u³⁰)e₁, fixing e₁. In all cases γ₂ is coefficient
Frobenius on F₉. These are corrected wild descent operators, not ordinary commuting semilinear group
actions.
API extendedModel_exists: For each pair and parameter tuple, the listed data determine an Iᵢ-annihilated
Breuil descent object and its contravariant finite-flat model.
API extendedModel_filtration: Its filtration, Frobenius, N and descent have exactly the displayed
formulas.
API extendedModel_extension: The object is a strict Breuil extension with the stated rank-one subobject
and quotient.
API extendedModel_specialFrobenius: Special-fibre F is zero in the first three families and, in (6,6),
is zero exactly when c=0.
API extendedModel_genericFibre: The contravariant generic fibre is a continuous F₃[G₃] extension of 1 by
ω; coefficient Frobenius acts on F₉, not on the residual parameters.
Test extendedModel_zeroParameters: At zero parameters the extension is split with the indicated
canonical rank-one descent.
Test extendedModel_sixSixMonodromy: At (6,6), c′=1 gives N(e′ω)=u³⁰e₁≠0 in S₃₆.
Test extendedModel_sixSixFrobenius: At (6,6), c=1 gives nonzero special-fibre Frobenius, while the (2,6)
family always has zero special-fibre Frobenius.
Test extendedModel_twoTenCrossTerm: For (2,10) and c₁=1 the γ₃ cross term begins at u¹², not u⁶.
Test extendedModel_deepWildCorrection: The (6,6) inverse descent includes −c′u³⁰ with the same sign for
both γ₃ and γ₃⁻¹.
Test extendedModel_sixSixUnitCrossTerm: At (6,6), c=1 and c′=0 the second filtration generator is
u⁶e′ω+e₁; its e₁ coefficient is a unit and its special-fibre Frobenius is nonzero.

EllipticCurveModularityWild3Adic:W3.5/extended-model-classification
Target name: extendedModelClassification (theorem).
Full contract: Fix the full G₃ très ramifié residual extension 0→ω→ρ̄→1→0 of extended-category. Every
Iᵢ-annihilated descent object killed by three with Q₃ generic fibre isomorphic to this nonsplit ρ̄ is in
one of the four model families. Separately, for all parameter values, including the split class, in each
of those four families generic fibre induces an isomorphism of its Breuil Ext group with H¹(G₃,ω)≅F₃².
In the first three families generic splitting over Fᵢ or F′ᵢ is equivalent to c=0, splitting over Q₃ to
c=c₁=0, and peu ramifié to c₁=0. In (6,6) these criteria are respectively c+c′=0, c=c′=0, and c=0. The
maps from (6,6) to (2,6) or (6,10) along the canonical u⁶ rank-one morphisms send (c,c′) to (c+c′,c).
Hypothesis: The exhaustiveness clause concerns the fixed full G₃ très ramifié ρ̄. The generic-Ext
comparisons within the four families allow all parameters; they do not classify every integral model of
a split generic fibre.
Test extendedClassification_splitCounterexample: M′_{2,1}⊕M′_{2,ω} is an Iᵢ-annihilated model of the
split generic extension and has weight pair (2,2), outside the four selected pairs.

EllipticCurveModularityWild3Adic:W3.5/extended-reverse-extensions
Target name: extendedReverseExtensions (theorem).
Full contract: For (r,s)=(2,6),(6,10),(2,10), Ext¹(M′_{s,1},M′_{r,ω})=0 in the Iᵢ-annihilated Breuil descent
category. For (6,6), generic fibre instead gives an isomorphism Ext¹(M′_{6,1},M′_{6,ω})≅H¹(G₃,ω)≅F₃². The
exceptional reverse family has filtration ⟨u⁶eω,u⁶e′₁+(c+c′u⁴)eω⟩, Frobenius images eω,e′₁, N(e′₁)=c′u³⁰eω, γ₄
eigenvalues (j,−j), γ₂ coefficient Frobenius, and γ₃^{±1}(e′₁)=e′₁+(±c∓c′u¹²−c′u³⁰)eω.

EllipticCurveModularityWild3Adic:W3.5/extended-diagonal-extensions
Target name: extendedDiagonalExtensions (theorem).
Full contract: For r=2 or 10 and χ=1 or ω, generic fibre embeds Ext¹(M′_{r,χ},M′_{r,χ}) into H¹(G₃,F₃) with
image exactly the unramified line. For r=6 it is an isomorphism onto the full two-dimensional H¹(G₃,F₃). At
r=6 the filtration is ⟨u⁶e,u⁶e′+(cu²+c′u⁶)e⟩, Frobenius images are e,e′, N(e′)=−cu²⁴e, and
γ₃^{±1}(e′)=e′+c(±u⁶±u¹⁸−u²⁴±u³⁰)e; γ₃ fixes e. This class is unramified exactly when c=0.

EllipticCurveModularityWild3Adic:W3.5/extended-coefficient-filtration
Target name: extendedCoefficientFiltration (theorem).
Full contract: For any finite field k/F₃, every Iᵢ-annihilated finite-flat descent model with k-action whose
Q₃ fibre is ρ̄⊗F₃ k has a descent-compatible filtration by its ω and 1 generic pieces, with Breuil weights
(rω,r₁) one of (2,6),(6,10),(2,10),(6,6). Its two pieces are free rank-one over k[u]/u³⁶, with Frobenius
coefficients in k×, rather than a collection of independently chosen F₃ weights.

EllipticCurveModularityWild3Adic:W3.5/extended-filtered-categories
Target name: extendedFilteredCategories (definition).
Full contract: Fix a très ramifié ρ̄ over F₃ and i. For each of the four pairs let Gᵢ,(r,s) be the
corresponding residual finite-flat descent model from extended-model-classification, with its specified
generic identification. Define Sᵢ,(r,s) as the full subcategory of S(ρ̄) consisting of generic fibres of Iᵢ-
annihilated models weakly filtered by the singleton {Gᵢ,(r,s)}. Weakly filtered means that at least one
filtration by closed integral descent subobjects has graded models isomorphic to Gᵢ,(r,s). Strongly filtered
means that every generic ρ̄-filtration induces such an integral filtration. The verified rank-one Hom/Ext
comparisons and the supplier’s singleton criterion show that these weak filtrations are strong; the models are
also strongly filtered by their two rank-one pieces. All three-power torsion exponents are allowed.
API extendedFilteredCategory_mem: Membership is equivalent to existence of a weakly Gᵢ,(r,s)-filtered model
with the specified generic fibre.
API extendedFilteredCategory_modelIndependent: Changing basis or using an isomorphic residual model with the
same generic identification gives the same full category.
API extendedFilteredCategory_subquotients: Finite products and S(ρ̄)-subquotients preserve membership.
API extendedFilteredCategory_strong: The verified Hom comparisons and Ext injectivity discharge the supplier
criterion, so every weak singleton filtration is strong.
API extendedFilteredCategory_tangent: Its fixed-cyclotomic deformation ring is the R08.6 category ring and its
tangent is H¹_{Sᵢ,(r,s)}(G₃,ad⁰ρ̄).
Test extendedFilteredCategory_zero: The zero model has the empty filtration and gives a member of every
Sᵢ,(r,s).
Test extendedFilteredCategory_residual: The model Gᵢ,(r,s) belongs through a one-step singleton filtration.
Test extendedFilteredCategory_splitCharacters: The two-dimensional split representation 1⊕ω is not in
Sᵢ,(r,s), since it has no filtration with quotient the nonsplit ρ̄.
Test extendedFilteredCategory_threePower: A strongly filtered model killed by nine is allowed; being killed by
three is not part of membership.

EllipticCurveModularityWild3Adic:W3.5/extended-theta-vanishing
Target name: extendedThetaVanishing (theorem).
Full contract: For all four pairs, Θ₀=0 on Ext¹_{Sᵢ,(r,s)}(ρ̄,ρ̄). For the three nonexceptional pairs, Θ₁=0
when r≠6 and Θω=0 when s≠6. For (6,6), Θω=0. In particular on every fixed-determinant category tangent both
the required lower-left and a diagonal inertia comparison vanish.

EllipticCurveModularityWild3Adic:W3.5/extended-tangent-bound
Target name: extendedTangentBound (theorem).
Full contract: For every i∈Z/3 and each of (2,6),(6,10),(2,10),(6,6), dim_{F₃}H¹_{Sᵢ,(r,s)}(G₃,ad⁰ρ̄)≤1.

EllipticCurveModularityWild3Adic:W3.5/extended-artin-deformations
Target name: extendedArtinDeformations (construction).
Full contract: For (r,s)=(2,6),(6,10),(2,10), take the residual parameters (c,c₁), with c₁≠0 for a très
extension, and t=2,6,8 respectively. For N≥1 put A_N=F₃[T]/(Tᴺ) and construct the rank-two Breuil module over
A_N[u]/u³⁶ with filtration ⟨uˢe₁,uʳe′ω+(c+T)uᵗe₁⟩, φ₁ sending these generators to e₁,e′ω, and N=0. Its
Frobenius is A_N-linear and sends u to u³, fixing T; descent is exactly that of extended-models with the same
c₁. The corresponding finite-flat descent model has special-fibre F=0 and gives a free rank-two A_N generic
representation ρ_N with determinant ω, reducing to ρ̄ at T=0. Choose compatible generic bases for the
reductions A_N→A_M. For N≥2 its reduction modulo T² is the nontrivial deformation ρ₂, not the constant
extension ρ̄⊗A₂.
API extendedArtinModel_exists: For each nonexceptional pair and N≥1 the displayed data give a finite-flat
descent model with A_N-action and F=0.
API extendedArtinModel_filtration: The cross term is (c+T)uᵗ and the Frobenius fixes all elements of A_N.
API extendedArtinModel_reduction: Reduction A_N→A_M sends its generic representation to ρ_M, and the Breuil
exact sequence is induced by multiplication by T^{N−M}.
API extendedArtinModel_genericFree: Generic fibre is A_N² with determinant ω, using the native finite-module
representation notion.
API extendedArtinModel_nontrivial: For N≥2 its A₂ specialization is not equivalent to the constant
deformation.
Test extendedArtinModel_NOne: At N=1, T=0 and the model equals its residual family at (c,c₁).
Test extendedArtinModel_NTwo: At N=2 its generic self-extension is nonzero, despite the special-fibre F=0.
Test extendedArtinModel_coefficientFrobenius: At N=2, φ(T)=T≠T³=0 in A₂; the semilinearity acts only on u and
the residue extension.
Test extendedArtinModel_twoTen: For (2,10), the deformation cross term is (c+T)u⁸.

EllipticCurveModularityWild3Adic:W3.5/extended-characteristic-three-rings
Target name: extendedCharacteristicThreeRings (theorem).
Full contract: For each i and each nonexceptional pair, R^{ε,Sᵢ,(r,s)}_{V,Z₃}≅F₃[[T]] as complete local Z₃-
algebras. In particular the WHOLE ring is killed by three, not only its special fibre. It has no
characteristic-zero points.

EllipticCurveModularityWild3Adic:W3.5/extended-point-factorization
Target name: extendedPointFactorization (theorem).
Full contract: For a full G₃ très ramifié ρ̄ of shape (ω,*;0,1), R^{τ′ᵢ}_{V,Z₃} is a quotient of
R^{ε,Sᵢ,(6,6)}_{V,Z₃}. Every type-τ′ᵢ Barsotti–Tate lift has an Iᵢ-annihilated integral 3-divisible descent
model. Its coefficient-lattice torsion quotients are strongly filtered by one fixed residual model Gᵢ,(r,s);
the three purely characteristic-three rings force (r,s)=(6,6).

EllipticCurveModularityWild3Adic:W3.5/extended-weak-acceptability
Target name: extendedWeakAcceptability (theorem).
Full contract: For every i∈Z/3 and continuous ρ̄:G₃→GL₂(F₃) that on the full G₃ is a très ramifié extension
0→ω→ρ̄→1→0, τ′ᵢ is weakly acceptable: its extended-type quotient over O is zero or a quotient of O[[X]]. Both
the full G₃ hypothesis and the uniformizer datum of τ′ᵢ are retained.

EllipticCurveModularityWild3Adic:W3.6/global-companion
Target name: globalCompanion (construction).
Full contract: Let ρ:G_Q→GL₂(F₅) be continuous with determinant the mod-five cyclotomic character. Choose its
alternating pairing into μ₅ to agree, after an equivariant local identification, with the Weil pairing of the
local companion E₁/Q₃. On the fixed-pairing twist Y_ρ(5), the point (E₁,α) has a nonempty 3-adic open
neighborhood U on which the full G₃-module E_x[3] is isomorphic to E₁[3]. There is (E,β)∈Y_ρ(5)(Q)∩U, where
β:ρ≅E[5] preserves the chosen pairing, and G_Q→Aut(E[3]) is surjective. The curve E has the same full local
three-torsion as E₁. Absolute irreducibility of ρ is not required for this construction.
API globalCompanion_exists: For the selected compatible pairing and nonempty local U there is a rational
noncuspidal pair (E,β) satisfying the three stated conditions.
API globalCompanion_fiveTorsion: β is an F₅[G_Q]-linear isomorphism with the Weil pairing into μ₅.
API globalCompanion_localThreeTorsion: E[3]|G₃ and E₁[3] are isomorphic as continuous full G₃-modules.
API globalCompanion_threeSurjective: The global image on E[3] is all GL₂(F₃).
API globalCompanion_localOpen: Any smaller nonempty open neighborhood inside U admits a companion with these
properties.
Test globalCompanion_tame: In the tame case a rational specialization exists with the prescribed five-torsion
and surjective three-torsion; no very ramified hypothesis is imposed.
Test globalCompanion_extended: In case six the full G₃ extension and its splitting-field nonsplitting property
survive specialization.
Test globalCompanion_cyclotomic: Its mod-three determinant is the cyclotomic character, with nontrivial image
over Q, so containing SL₂(F₃) gives the full GL₂(F₃).
Test globalCompanion_nonCuspidal: The point lies in Y_ρ(5), not at a compactification cusp, and supplies a
smooth elliptic curve.

EllipticCurveModularityWild3Adic:W3.6/six-case-tate-types
Target name: sixCaseTateTypes (theorem).
Full contract: For a global companion E constructed in global-companion, classify ρ_{E,5}|G₃ after the chosen
quadratic twist by six-local-cases. In case one, V₃(E), up to quadratic twist, is ordinary or potentially
Barsotti–Tate of a tame type; its conductor at three has exponent at most two. In cases two through five,
V₃(E) is potentially Barsotti–Tate of type τ₁,τ₋₁,τ₃,τ₋₃ respectively. In case six it is potentially
Barsotti–Tate of the full extended type τ′ᵢ with the same i and the uniformizer sign +1. Its residual three-
torsion has the shape and très ramification prescribed in local-paired-curves; in case six this is a full G₃
assertion.

EllipticCurveModularityWild3Adic:W3.6/wild-lifting-application
Target name: wildLiftingApplication (theorem).
Full contract: Let E/Q be a companion with surjective E[3]. In one of cases two through six of six-case-tate-
types, its three-adic Tate representation is modular by the classical BCDT lifting theorem. All hypotheses are
explicit: continuity, determinant ε₃, oddness, finite ramification, residual modularity, absolute
irreducibility on G_{Q(√−3)}, scalar residual local centralizer, potential Barsotti–Tate type, simple
admittance and weak acceptability. Use BCDT Theorem 1.4.1 for the four inertial types and Theorem 1.4.2 for
τ′ᵢ. No general Serre-modularity theorem is an input.

EllipticCurveModularityWild3Adic:W3.6/global-mod-five
Target name: globalModFive (theorem).
Full contract: Every continuous absolutely irreducible representation ρ:G_Q→GL₂(F₅) with determinant the mod-
five cyclotomic character is modular. Here modularity is the shared residual modular-form predicate, including
the coefficient-field embedding; the theorem is for F₅ itself, not an arbitrary representation defined only
over an algebraic closure of F₅.

EllipticCurveModularityWild3Adic:W3.6/elliptic-modularity
Target name: ellipticModularity (theorem).
Full contract: For every WeierstrassCurve E over Q satisfying the native IsElliptic predicate, E is modular in
the shared elliptic modularity predicate: it has a rational normalized cuspidal weight-two newform of exact
conductor N_E and a nonconstant Q-morphism X₀(N_E)→E sending the distinguished rational cusp to the identity.
This is a second proof of the shared conclusion, obtained through BCDT wild three-adic lifting. The predicate,
conductor normalization and parametrisation construction remain owned by EllipticCurveModularity.

-/
