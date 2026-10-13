import Mathlib
import TauCeti.LinearAlgebra.Matrix.SymplecticMultiplier
import TauCeti.AlgebraicGeometry.AbelianVariety.End.Basic

/-!
# PELModuli: representative target signatures

The roadmap is `README.md`; this file is not exhaustive. It records the definitions and theorem
signatures of the Siegel and PEL moduli roadmap that can be stated against the pinned Mathlib and Tau
Ceti APIs, so that contributors and reviewers converge on names, hypotheses and conventions. The
moduli problems themselves, their stacks, universal families, uniformization, canonical models and
arithmetic interface need carriers (abelian schemes over a base, algebraic stacks, analytic spaces,
Shimura varieties) that are not at the pins; they are README targets only and are listed at the end.

Design choices made explicit here:
* Pairings with values in `ℤ(1)` are written `ℤ`-valued after choosing `√−1`; the principal Siegel Gram
  matrix is `−Matrix.J`, so `ψ(e_i, f_i) = 1`, and the complex structure satisfies `J e_i = f_i`,
  `J f_i = −e_i`, making `ψ(x, J x) > 0` for `x ≠ 0`.
* Positivity of an involution is stated with the unreduced trace `Algebra.trace ℚ B`; the README proves
  it equivalent to positivity for the reduced trace (M0.1, `iff_trace_pos`).
* Similitudes carry their multiplier as data; uniqueness of the multiplier needs flatness and is a
  theorem, not part of the definition (M0.7).
* The determinant polynomial is built from Mathlib's `LinearMap.polyCharpoly`; the determinant
  condition is an equality of polynomials, never of traces (M0.14, M0.18).
* Hecke operators act on the right by precomposition of level markings (M1.13).
-/

namespace TauCetiRoadmap.PELModuli

open scoped TensorProduct

/-! ## Layer M0: Linear algebra and reflex fields -/

section PositiveInvolution

variable (B : Type*) [Ring B] [Algebra ℚ B] [StarRing B] [FiniteDimensional ℚ B]

/-- **Positive involution** (M0.1). A star structure on a finite-dimensional `ℚ`-algebra is positive
when `Tr_{B/ℚ}(x x*) > 0` for every nonzero `x`. Lan, thesis, §1.2.1, p. 45; Milne, *Introduction to
Shimura varieties*, Proposition 8.10 and Definition 8.11, pp. 84–85. The trace is the trace of left
multiplication; positivity for it is equivalent to positivity for the reduced trace. -/
def IsPositiveInvolution : Prop :=
  (∀ (q : ℚ) (x : B), star (q • x) = q • star x) ∧
    ∀ x : B, x ≠ 0 → 0 < LinearMap.trace ℚ B (LinearMap.mulLeft ℚ (x * star x))

/-- **Star-order** (M0.1). A subring of `B` that is stable under the involution, finitely generated
as an abelian group and spans `B` over `ℚ`. -/
structure StarOrder where
  /-- The underlying subring. -/
  toSubring : Subring B
  /-- Stability under the involution. -/
  star_mem : ∀ x ∈ toSubring, star x ∈ toSubring
  /-- Finite generation over `ℤ`. -/
  fg : (Submodule.span ℤ (toSubring : Set B)).FG
  /-- The order spans `B` over `ℚ`. -/
  span_eq_top : Submodule.span ℚ (toSubring : Set B) = ⊤

end PositiveInvolution

/-- The identity is a positive involution of `ℚ` (Check `positiveInvolution_rat`). -/
example : IsPositiveInvolution ℚ := by
  sorry

/-- Transposition is a positive involution of `M_n(ℚ)` (Check `positiveInvolution_transpose`); the
star of `Matrix (Fin n) (Fin n) ℚ` is the conjugate transpose, which is the transpose over `ℚ`. -/
example (n : ℕ) : IsPositiveInvolution (Matrix (Fin n) (Fin n) ℚ) := by
  sorry

/-- The adjugate involution of `M_2(ℚ)` is not positive (Check `not_positiveInvolution_adjugate`):
`x · adj x = det x`, whose trace is `−2` at `x = diag(1, −1)`. -/
example : (Matrix.diagonal ![(1 : ℚ), -1]) * (Matrix.diagonal ![(1 : ℚ), -1]).adjugate =
    (-1 : ℚ) • (1 : Matrix (Fin 2) (Fin 2) ℚ) := by
  sorry

section SymplecticLattice

variable (O : Type*) [Ring O] [StarRing O]
variable (L : Type*) [AddCommGroup L] [Module O L] [Module.Free ℤ L] [Module.Finite ℤ L]

/-- **Symplectic `O`-lattice** (M0.4). A finite free `ℤ`-module with an `O`-action and an alternating
nondegenerate integral pairing for which `b` and `b*` are adjoint. Lan, §1.2.1, p. 46; Kottwitz, §1,
p. 374. -/
structure SymplecticOLattice where
  /-- The pairing, `ℤ(1)`-valued after the choice of `√−1`. -/
  form : LinearMap.BilinForm ℤ L
  /-- The pairing is alternating. -/
  isAlt : form.IsAlt
  /-- The pairing is nondegenerate (equivalently, nondegenerate after `⊗ ℚ`). -/
  nondegenerate : form.Nondegenerate
  /-- `⟨b x, y⟩ = ⟨x, b* y⟩`. -/
  adjoint : ∀ (b : O) (x y : L), form (b • x) y = form x (star b • y)

namespace SymplecticOLattice

variable {O L}

/-- The **dual index** `[L^# : L]` (M0.4), computed as the absolute value of the Gram determinant in a
chosen `ℤ`-basis; the README proves it is the index of `L` in its dual lattice and independent of the
basis. -/
noncomputable def dualIndex (S : SymplecticOLattice O L) : ℕ :=
  (LinearMap.BilinForm.toMatrix (Module.Free.chooseBasis ℤ L) S.form).det.natAbs

/-- The dual index is positive (nondegeneracy over `ℚ`). -/
theorem dualIndex_pos (S : SymplecticOLattice O L) : 0 < S.dualIndex := by
  sorry

/-- The `ℝ`-bilinear extension of the pairing to `ℝ ⊗ L`. -/
noncomputable def realForm (S : SymplecticOLattice O L) : LinearMap.BilinForm ℝ (ℝ ⊗[ℤ] L) :=
  LinearMap.BilinForm.baseChange ℝ S.form

end SymplecticOLattice

/-- The action of `b ∈ O` on `ℝ ⊗ L`. -/
noncomputable def realAction (b : O) : Module.End ℝ (ℝ ⊗[ℤ] L) :=
  ((DistribSMul.toAddMonoidHom L b).toIntLinearMap).baseChange ℝ

/-- **Integral PEL datum** (M0.5). A symplectic `O`-lattice with an `O ⊗ ℝ`-linear complex structure
`J = h(√−1)` with `J² = −1`, preserving the real pairing, and with `ψ(x, J x) > 0` for `x ≠ 0` (Lan's
Condition 1.2.1.2, pp. 46–47; Definition 1.2.1.3, p. 47). The positive involution on `O ⊗ ℚ` and the
faithfulness used for rationalization are hypotheses of the README targets that use them. -/
structure IntegralPELDatum where
  /-- The symplectic `O`-lattice. -/
  lattice : SymplecticOLattice O L
  /-- The complex structure `h(√−1)` on `ℝ ⊗ L`. -/
  J : Module.End ℝ (ℝ ⊗[ℤ] L)
  /-- `J² = −1`. -/
  J_sq : J * J = -1
  /-- `J` commutes with the action of `O`. -/
  J_comm : ∀ b : O, J * realAction O L b = realAction O L b * J
  /-- `J` preserves the real pairing (equivalently `⟨h(z)x, y⟩ = ⟨x, h(z̄)y⟩`). -/
  J_isometry : ∀ x y, lattice.realForm (J x) (J y) = lattice.realForm x y
  /-- Positivity: `ψ(x, J x) > 0` for `x ≠ 0`. -/
  pos : ∀ x, x ≠ 0 → 0 < lattice.realForm x (J x)

/-- **Similitude with multiplier** (M0.7). Over a commutative ring `R`, a pair `(g, r)` of an
`O`-linear automorphism of `R ⊗ L` and a unit `r` with `⟨g x, g y⟩ = r ⟨x, y⟩`. The multiplier is data:
over nonflat `R` it is not determined by `g` (Lan's thesis errata, p. 4). -/
def IsSimilitude (S : SymplecticOLattice O L) (R : Type*) [CommRing R]
    (g : (R ⊗[ℤ] L) ≃ₗ[R] (R ⊗[ℤ] L)) (r : Rˣ) : Prop :=
  (∀ (b : O) (x : R ⊗[ℤ] L),
      g (((DistribSMul.toAddMonoidHom L b).toIntLinearMap.baseChange R) x) =
        ((DistribSMul.toAddMonoidHom L b).toIntLinearMap.baseChange R) (g x)) ∧
    ∀ x y, LinearMap.BilinForm.baseChange R S.form (g x) (g y) =
      (r : R) * LinearMap.BilinForm.baseChange R S.form x y

end SymplecticLattice

/-- The genus-one multiplier is the determinant (Check `similitudeGroup_siegel_one`): every
`A ∈ M_2(R)` scales the standard symplectic form by `det A`; this is `GL₂ = GSp₂`. -/
example {R : Type*} [CommRing R] (A : Matrix (Unit ⊕ Unit) (Unit ⊕ Unit) R) :
    A.transpose * Matrix.J Unit R * A = A.det • Matrix.J Unit R :=
  Matrix.transpose_mul_J_mul_eq_det_smul A

/-- Nonflat bases lose the multiplier (Check `similitudeGroup_multiplier_nonflat`): the form `5J`
vanishes over `𝔽₅`, so the identity scales it by both `1` and `2`. -/
example : (5 : ZMod 5) • Matrix.J (Fin 1) (ZMod 5) = 2 * ((5 : ZMod 5) • Matrix.J (Fin 1) (ZMod 5)) := by
  sorry

section BadPrimes

/-- **Bad-prime integer** (M0.10): `n · I_bad · Disc · [L^# : L]`. -/
def badPrimeInteger (n Ibad disc dualIndex : ℕ) : ℕ := n * Ibad * disc * dualIndex

/-- A prime is **good** (M0.10) when it does not divide the bad-prime integer. Each factor is a
separate condition; none follows from `p` being large. -/
def IsGoodPrime (n Ibad disc dualIndex p : ℕ) : Prop :=
  ¬ p ∣ badPrimeInteger n Ibad disc dualIndex

/-- The Siegel datum of type `(1 | 6)` at level one has bad primes `2` and `3`
(Check `goodPrime_type`). -/
example : ¬ IsGoodPrime 1 1 1 36 2 ∧ ¬ IsGoodPrime 1 1 1 36 3 ∧ IsGoodPrime 1 1 1 36 5 := by
  sorry

/-- In type D, `I_bad = 2` makes `2` bad (Check `goodPrime_typeD_two`). -/
example : ¬ IsGoodPrime 1 2 9 1 2 := by
  sorry

end BadPrimes

section Determinant

variable {R : Type*} [CommRing R] {O : Type*} [AddCommGroup O] [Module R O]
variable {ι : Type*} [Fintype ι] [DecidableEq ι]
variable {M : Type*} [AddCommGroup M] [Module R M] [Module.Free R M] [Module.Finite R M]

/-- **Determinant polynomial** `Det_{O|M}` (M0.14). For a linear family `φ : O → End M` and a basis
of `O`, `(−1)^{rank M}` times the constant coefficient of the generic characteristic polynomial
`LinearMap.polyCharpoly`; its value at `x` is `det(φ x)` (Lan, Definition 1.1.2.17, p. 19). -/
noncomputable def detPoly (φ : O →ₗ[R] Module.End R M) (b : Module.Basis ι R O) :
    MvPolynomial ι R :=
  (-1) ^ Module.finrank R M * (LinearMap.polyCharpoly φ b).coeff 0

/-- Evaluating the determinant polynomial at the coordinates of `x` gives `det(φ x)` (`detPoly_eval`;
Check `detPoly_eval_charpoly`, which pins that no further sign appears). -/
theorem detPoly_eval (φ : O →ₗ[R] Module.End R M) (b : Module.Basis ι R O) (x : O) :
    MvPolynomial.eval (b.repr x) (detPoly φ b) = LinearMap.det (φ x) := by
  sorry

/-- **Determinant condition** (M0.18), in its polynomial form: two linear families have the same
determinant polynomial. Over a nonreduced base or in positive characteristic this is strictly stronger
than equality of traces. -/
def SatisfiesDetCondition {M' : Type*} [AddCommGroup M'] [Module R M'] [Module.Free R M']
    [Module.Finite R M'] (φ : O →ₗ[R] Module.End R M) (ψ : O →ₗ[R] Module.End R M')
    (b : Module.Basis ι R O) : Prop :=
  detPoly φ b = detPoly ψ b

end Determinant

/-- Traces do not detect the determinant in characteristic `3` (Check `detPoly_not_trace`): on `k³`
with `i` acting by `±τ(i)`, both trace maps vanish while the determinants of `i` differ. -/
example (k : Type*) [Field k] [CharP k 3] (t : k) (ht : t ^ 2 = -1) :
    (3 : k) * t = 3 * (-t) ∧ t ^ 3 ≠ (-t) ^ 3 := by
  sorry

section CMTypes

variable (K : Type*) [Field K] [NumberField K]

/-- **Generalized CM type** of rank `N` (M0.25): a finitely supported `Ψ : (K →+* ℂ) →₀ ℕ` with
`Ψ(τ) + Ψ(τ̄) = N` for every complex embedding (Liu–Tian–Xiao–Zhang–Zhu, Definition 3.3.1, p. 147). -/
def IsGeneralizedCMType (N : ℕ) (Ψ : (K →+* ℂ) →₀ ℕ) : Prop :=
  ∀ τ : K →+* ℂ, Ψ τ + Ψ (NumberField.ComplexEmbedding.conjugate τ) = N

/-- A CM type is a generalized CM type of rank one. -/
def IsCMType (Φ : (K →+* ℂ) →₀ ℕ) : Prop := IsGeneralizedCMType K 1 Φ

/-- In rank one every coefficient is `0` or `1` (Check `gcmType_cm_rank1`). -/
theorem IsCMType.le_one {Φ : (K →+* ℂ) →₀ ℕ} (h : IsCMType K Φ) (τ : K →+* ℂ) : Φ τ ≤ 1 := by
  sorry

end CMTypes

/-! ## Layer M2: Representability and smooth good models -/

section Neat

/-- **Neat element** (M2.2) of `GL_n(ℚ)`: the subgroup of `ℂ^×` generated by the eigenvalues contains
no nontrivial root of unity. This is Pink's condition for a rational element; the README's adelic
predicate intersects the analogous `p`-adic conditions over all `p ∉ □`. -/
def IsNeatElement {n : ℕ} (g : Matrix (Fin n) (Fin n) ℚ) : Prop :=
  ∀ ζ : ℂˣ, ζ ∈ Subgroup.closure
      {u : ℂˣ | ((g.charpoly).map (algebraMap ℚ ℂ)).IsRoot (u : ℂ)} →
    IsOfFinOrder ζ → ζ = 1

/-- `−1` is not neat (Check `not_isNeat_minus_one`). -/
example : ¬ IsNeatElement (-(1 : Matrix (Fin 2) (Fin 2) ℚ)) := by
  sorry

/-- `diag(2, −2)` is not neat: the ratio of its eigenvalues is `−1`, although each eigenvalue has
infinite order (Check `not_isNeat_generated_ratio`). -/
example : ¬ IsNeatElement (Matrix.diagonal ![(2 : ℚ), -2]) := by
  sorry

end Neat

/-! ## Layer M5: Siegel, Hilbert and unitary examples -/

section Siegel

open Matrix

variable {g : ℕ}

/-- The **Siegel Gram matrix of type `d`** (M5.1): `⟨e_i, f_j⟩ = d_i δ_{ij}`, `⟨e_i, e_j⟩ = ⟨f_i, f_j⟩ = 0`
on `ℤ^{2g}` with basis `e = inl`, `f = inr`. For `d = 1` it is `−Matrix.J`. -/
def siegelGram (d : Fin g → ℤ) : Matrix (Fin g ⊕ Fin g) (Fin g ⊕ Fin g) ℤ :=
  Matrix.fromBlocks 0 (Matrix.diagonal d) (-Matrix.diagonal d) 0

/-- The **Siegel complex structure** (M5.1): `J e_i = f_i`, `J f_i = −e_i`. -/
def siegelJ : Matrix (Fin g ⊕ Fin g) (Fin g ⊕ Fin g) ℝ :=
  Matrix.fromBlocks 0 (-1) 1 0

/-- For the principal type the Gram matrix is `−Matrix.J` (the sign convention of the roadmap). -/
theorem siegelGram_one : siegelGram (fun _ : Fin g => (1 : ℤ)) = -Matrix.J (Fin g) ℤ := by
  sorry

/-- **Dual index of the Siegel datum** (`siegelDatum_dualIndex`): `[L_D^# : L_D] = (d₁⋯d_g)²`. -/
theorem siegelGram_det (d : Fin g → ℤ) : (siegelGram d).det = (∏ i, d i) ^ 2 := by
  sorry

/-- For `g = 2`, `D = (1, 2)` the dual index is `4` (Check `siegelDatum_index_12`). -/
example : (siegelGram ![(1 : ℤ), 2]).det = 4 := by
  sorry

/-- `J² = −1` for the Siegel complex structure. -/
theorem siegelJ_sq : (siegelJ : Matrix (Fin g ⊕ Fin g) (Fin g ⊕ Fin g) ℝ) * siegelJ = -1 := by
  sorry

/-- Positivity in the Siegel convention (Check `IntegralPELDatum.siegel`): with
`ψ = siegelGram 1` and `J = siegelJ`, `ψ(x, J x) = Σ x_i²` is positive for `x ≠ 0`. -/
theorem siegel_pos (x : Fin g ⊕ Fin g → ℝ) (hx : x ≠ 0) :
    0 < x ⬝ᵥ ((siegelGram (fun _ : Fin g => (1 : ℤ))).map (Int.cast : ℤ → ℝ) *ᵥ (siegelJ *ᵥ x)) := by
  sorry

/-- With `J` replaced by `−J` the form is negative definite (Check `IntegralPELDatum.wrong_sign`). -/
theorem siegel_neg (x : Fin g ⊕ Fin g → ℝ) (hx : x ≠ 0) :
    x ⬝ᵥ ((siegelGram (fun _ : Fin g => (1 : ℤ))).map (Int.cast : ℤ → ℝ) *ᵥ ((-siegelJ) *ᵥ x)) < 0 := by
  sorry

end Siegel

section Hilbert

variable (F : Type*) [Field F] [NumberField F]

/-- The **Hilbert trace pairing** (M5.4): `ψ((x₁, x₂), (y₁, y₂)) = Tr_{F/ℚ}(x₁ y₂ − x₂ y₁)` on `F²`; on
`L = O_F ⊕ 𝔡⁻¹` it is integral and perfect. -/
noncomputable def hilbertPairing (x y : F × F) : ℚ :=
  Algebra.trace ℚ F (x.1 * y.2 - x.2 * y.1)

/-- The Hilbert pairing is alternating. -/
theorem hilbertPairing_self (x : F × F) : hilbertPairing F x x = 0 := by
  sorry

/-- The order acts by self-adjoint maps (`* = id`): `ψ(bx, y) = ψ(x, by)`. -/
theorem hilbertPairing_smul (b : F) (x y : F × F) :
    hilbertPairing F (b • x) y = hilbertPairing F x (b • y) := by
  sorry

/-- **Self-duality of the principal Hilbert lattice** (`hilbertExample`): the trace dual of the inverse
different `𝔡⁻¹ = dual(O_F)` is `O_F`, which makes `O_F ⊕ 𝔡⁻¹` self-dual for the trace pairing. -/
example :
    FractionalIdeal.dual ℤ ℚ (FractionalIdeal.dual ℤ ℚ (1 : FractionalIdeal (nonZeroDivisors
      (NumberField.RingOfIntegers F)) F)) = 1 := by
  sorry

end Hilbert

section Unitary

variable (K : Type*) [Field K] [NumberField K] [NumberField.IsCMField K]

/-- The **unitary trace form** (M5.5): `⟨x, y⟩ = Tr_{K/ℚ}(δ H(x, y))` for a hermitian form `H` on `K^n`
and an anti-invariant `δ`; it is alternating and `⟨a x, y⟩ = ⟨x, ā y⟩`. -/
noncomputable def unitaryTraceForm (H : K → K → K) (δ : K) (x y : K) : ℚ :=
  Algebra.trace ℚ K (δ * H x y)

/-- With `δ = 1`, which is not anti-invariant, the trace form of the standard hermitian form on `K` is
not alternating (Check `unitaryDatum_wrong_delta`). -/
theorem unitaryTraceForm_one_not_alternating :
    ∃ x : K, unitaryTraceForm K
      (fun a b => a * NumberField.IsCMField.complexConj K b) 1 x x ≠ 0 := by
  sorry

end Unitary

/-! ## Abelian varieties over a field with an order action -/

section OverField

open TauCeti.AlgebraicGeometry

variable {k : Type*} [Field k]

/-- An **action of an order on an abelian variety** over a field: a ring homomorphism to the
endomorphism ring. Over a general base the relative version, with polarization, Rosati condition and
determinant condition, is the PEL triple of M1.2 (README only). -/
structure OrderAction (O : Type*) [Ring O] (A : AbelianVariety k) where
  /-- The action. -/
  toRingHom : O →+* AbelianVariety.End A

/-- The trivial action of `ℤ` on any abelian variety: every abelian variety is a Siegel-type object
for `O = ℤ`. -/
noncomputable def OrderAction.ofInt (A : AbelianVariety k) : OrderAction ℤ A :=
  ⟨Int.castRingHom _⟩

end OverField

/-!
## Targets stated in the README only

The following targets need carriers that are not at the pins (abelian schemes over a base and their
duals, polarizations over a base, algebraic stacks and spaces, complex analytic spaces, Shimura data
and Shimura varieties, crystalline and étale cohomology, displays) and are specified in `README.md`:
the Albert classification `albertTypes`; `Order.disc` and its maximality theorems; the similitude group
scheme and its structure `similitudeGroupStructure`; Galois cohomology `galoisH1`, `ker1` and their
finiteness and Hasse statements; `hodgeStructureOfDatum`; the Shimura datum `toShimuraDatum`;
signatures; `detPoly_classifies`; the reflex field and `reflexField_eq_shimura`;
`detCondition_splitting`; `selfDualLattice_unique`; `bpsSignatureConstancy`; hermitian and
skew-hermitian spaces, `cmTorus`, `rankOneSkewHermitian_classification`; `CMField.reflexiveClosure`;
`τ`-parts. Layer M1: `QuasiIsogeny`, `BoxPolarization`, `PELTriple`, unitary `O_F`-abelian schemes,
`symplecticIsomSheaf`, `PrincipalLevel`, `IntegralLevel`, `RelativeRationalLevel`, `moduliProblem`,
`ratModuliProblem`, `adelicModuli`, `isoIsogenyComparison`, `changeOfLatticeAndPrimes`,
`effectiveDescent`, `heckeTranslate`, `toSiegel_finite`. Layer M2: `rigidity`, `IsNeat`,
`noAutomorphisms_of_neat`, `isomScheme_finite`, `deformation_prorepresentable`, `formalSmoothness`,
`effectivity`, `representability`, `universal`, `kodairaSpencer`, `properOfDivision`,
`unitaryDeformation`, `dieudonne_coker_length`, `isogenyKernelRanks`, `Display`, `wedhornOrdinary`.
Layer M3: `ker1Classification`, `hasseCases`, `arithmeticQuotient_structure`, `complexPoints`,
`uniformization`, `algebraization`, `typeDComparison`, `hermitianHomOfAbelianSchemes`,
`siegelFineUniformization`. Layer M4: `cmReciprocity`, `twist`, `canonicalModel`,
`canonicalModel_functorial`, `normalizedModel`, `normalizedModel_finite_normal_flat`, `cmModuli`,
`cmModuli_galois`, `torusTrace`. Layer M5: `siegelModuli`, `genusOneComparison`, `hilbertExample`,
`unitaryExamples`, `nonprincipalExample`. Layer M6: `levelForgetting_finiteEtale`,
`arbitraryLevelStack`, `siegelStack`, `polarizedStackFiniteType`, `coarseModuli`, `fieldOfModuli`,
`descentObstruction`, `boundedFieldOfDefinition`, `hodgeLine`, `classifyingMap`,
`finiteFieldFiniteness`, `nonemptyExamples`.
-/

end TauCetiRoadmap.PELModuli
