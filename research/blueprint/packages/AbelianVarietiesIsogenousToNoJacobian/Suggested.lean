import Mathlib

/-!
# AbelianVarietiesIsogenousToNoJacobian: representative target signatures

The roadmap is `README.md`; this file is not exhaustive. It records the definitions and theorem
signatures of the roadmap that can be stated against the pinned Mathlib and Tau Ceti: the
linear algebra of period matrices (the Siegel space, the classical reduced domain and its diagonal
comparisons, the fractional-linear period correspondence, the rational and analytic Rosati traces
and the entry estimates), the elementary counting lemmas of the elliptic argument, theta
constants, the Igusa level `Γ(e,2e)`, the Fourier index count, the explicit degree bound, the
genus-four Schottky form on products, and Newton interpolation series.

Design choices made explicit here:
* Matrices are Mathlib matrices; the Siegel space is a set of complex matrices, not a new type,
  and `Sp_{2g}(ℤ)` is Mathlib's `Matrix.symplecticGroup` on `Fin g ⊕ Fin g`.
* The rational representation of an endomorphism enters only through the compatibility
  `κ · (1 τ) = (1 τ) · ρ` with an analytic representation `κ` (MZ20, (21)); no abelian variety,
  moduli space, height or definability notion is defined here. The geometric objects and their
  targets are stated in the README only.
* The rational Rosati square length is `tr(ρ ε ρᵀ εᵀ)` with `ε = fromBlocks 0 (-1) 1 0`, which
  equals twice the real part of the analytic trace (README 5.1).
* Signs follow MZ20: the rational representation has blocks `(a, -b; -c, d)`.
-/

namespace TauCetiRoadmap.AbelianVarietiesIsogenousToNoJacobian

open Matrix Complex

/-- Complex `g × g` matrices. -/
abbrev CMat (g : ℕ) := Matrix (Fin g) (Fin g) ℂ

/-- Real `g × g` matrices. -/
abbrev RMat (g : ℕ) := Matrix (Fin g) (Fin g) ℝ

/-- Real `2 × 2` block matrices with `g × g` blocks, ordered `a, b, c, d`. -/
abbrev RBlocks (g : ℕ) := Matrix (Fin 2) (Fin 2) (RMat g)

/-- Real `2g × 2g` matrices indexed by `Fin g ⊕ Fin g`. -/
abbrev RBig (g : ℕ) := Matrix (Fin g ⊕ Fin g) (Fin g ⊕ Fin g) ℝ

/-- Integer `2g × 2g` matrices indexed by `Fin g ⊕ Fin g`. -/
abbrev ZBig (g : ℕ) := Matrix (Fin g ⊕ Fin g) (Fin g ⊕ Fin g) ℤ

/-! ## Layer 0: Moduli, the Torelli locus and period conventions -/

/-- The Siegel space on an index type `n`: symmetric complex matrices whose imaginary part is
positive definite (README 0.1). The index type is arbitrary so that block-diagonal period
matrices of products live in the same carrier. -/
def SiegelSpace (n : Type*) [Fintype n] : Set (Matrix n n ℂ) :=
  {τ | τᵀ = τ ∧ (τ.map Complex.im).PosDef}

/-- The zero imaginary part is a boundary point, not a point of the Siegel space. -/
example : (0 : CMat 1) ∉ SiegelSpace (Fin 1) := by
  sorry

/-- Positive-definite imaginary part alone does not replace transpose symmetry. -/
example : (!![Complex.I, 1; 0, Complex.I] : CMat 2) ∉ SiegelSpace (Fin 2) := by
  sorry

/-- Minkowski reduction of a real symmetric matrix `y` (README 0.6): positive definite,
`hᵀ y h ≥ y_kk` for every integer vector `h` whose entries from index `k` on are coprime, and
nonnegative entries next to the diagonal. -/
def IsMinkowskiReduced {g : ℕ} (y : RMat g) : Prop :=
  y.PosDef ∧
  (∀ (k : Fin g) (h : Fin g → ℤ), (Finset.univ.filter (fun i => k ≤ i)).gcd h = 1 →
      y k k ≤ ∑ i, ∑ j, (h i : ℝ) * y i j * (h j : ℝ)) ∧
  ∀ i j : Fin g, (j : ℕ) = i + 1 → 0 ≤ y i j

/-- The primitive-vector inequalities retain the ordering of the diagonal. -/
example : IsMinkowskiReduced (!![1, 0; 0, 2] : RMat 2) ∧
    ¬ IsMinkowskiReduced (!![2, 0; 0, 1] : RMat 2) := by
  sorry

/-- A positive form with a negative adjacent entry fails the chosen reduction convention. -/
example : ¬ IsMinkowskiReduced (!![1, -(1 / 4); -(1 / 4), 1] : RMat 2) := by
  sorry

/-- The classical Siegel fundamental domain `F_g` (README 0.6): `τ` in the Siegel space with
Minkowski-reduced imaginary part, real entries bounded by `1/2`, and `|det(cτ+d)| ≥ 1` for every
`(a, b; c, d)` in `Sp_{2g}(ℤ)`. Boundary equalities are kept. -/
def minkowskiDomain (g : ℕ) : Set (CMat g) :=
  {τ | τ ∈ SiegelSpace (Fin g) ∧ IsMinkowskiReduced (τ.map Complex.im) ∧
    (∀ i j, |(τ i j).re| ≤ 1 / 2) ∧
    ∀ γ ∈ symplecticGroup (Fin g) ℤ,
      1 ≤ ‖((γ.toBlocks₂₁).map (Int.cast : ℤ → ℂ) * τ +
        (γ.toBlocks₂₂).map (Int.cast : ℤ → ℂ)).det‖}

/-- Test `minkowskiDomain.i`: `τ = i` lies in `F_1`. -/
example : (Matrix.of fun _ _ => Complex.I : CMat 1) ∈ minkowskiDomain 1 := by
  sorry

/-- Test `minkowskiDomain.smallImaginary`: `τ = i/2` lies in `ℋ_1` but not in `F_1`. -/
example : (Matrix.of fun _ _ => Complex.I / 2 : CMat 1) ∈ SiegelSpace (Fin 1) ∧
    (Matrix.of fun _ _ => Complex.I / 2 : CMat 1) ∉ minkowskiDomain 1 := by
  sorry

/-- The diagonal comparisons of README 0.7–0.8 with constant `δ`: `δ D_y ≤ y ≤ δ⁻¹ D_y`,
`D_y ≥ δ I` in the Loewner order, and real entries bounded by `δ⁻¹`. No ordering of the
diagonal is required. -/
def DiagonalComparison {n : Type*} [Fintype n] [DecidableEq n] (δ : ℝ) (τ : Matrix n n ℂ) :
    Prop :=
  (τ.map Complex.im - δ • diagonal (fun i => (τ i i).im)).PosSemidef ∧
  (δ⁻¹ • diagonal (fun i => (τ i i).im) - τ.map Complex.im).PosSemidef ∧
  (diagonal (fun i => (τ i i).im) - δ • (1 : Matrix n n ℝ)).PosSemidef ∧
  ∀ i j, |(τ i j).re| ≤ δ⁻¹

/-- Test: `τ = iI` satisfies the diagonal comparisons with `δ = 1`. -/
example (g : ℕ) : DiagonalComparison 1 (Complex.I • (1 : CMat g)) := by
  sorry

/-- Test: a nondiagonal imaginary part violates the comparisons with `δ = 1`. -/
example : ¬ DiagonalComparison 1
    (!![Complex.I, Complex.I / 2; Complex.I / 2, Complex.I] : CMat 2) := by
  sorry

/-- README 0.3, numerical part: `3g − 3 < g(g+1)/2` once `g ≥ 4`. -/
theorem torelliDimension_lt (g : ℕ) (hg : 4 ≤ g) : 3 * g - 3 < g * (g + 1) / 2 := by
  sorry

/-- Test `jacobianHypersurface.genusThree`: in genus three the two dimensions agree. -/
example : 3 * 3 - 3 = 3 * (3 + 1) / 2 := by
  sorry

/-- README 0.7 (Igusa): on `F_g` the diagonal comparisons hold with a constant depending only
on `g`, and the diagonal is ordered with `y₁ ≥ √3/2`. -/
theorem igusaDiagonalComparison (g : ℕ) :
    ∃ δ : ℝ, 0 < δ ∧ δ ≤ 1 ∧ ∀ τ ∈ minkowskiDomain g, DiagonalComparison δ τ ∧
      (∀ i : Fin g, Real.sqrt 3 / 2 ≤ (τ i i).im) ∧
      ∀ i j : Fin g, i ≤ j → (τ i i).im ≤ (τ j j).im := by
  sorry

/-- README 0.8: the diagonal comparisons pass to block-diagonal products with the same `δ`;
no ordering of the diagonal is claimed for the product. -/
theorem diagonalComparison_fromBlocks {n m : Type*} [Fintype n] [DecidableEq n] [Fintype m]
    [DecidableEq m] {δ : ℝ} (hδ : 0 < δ) {τ : Matrix n n ℂ} {τ' : Matrix m m ℂ}
    (h : DiagonalComparison δ τ) (h' : DiagonalComparison δ τ') :
    DiagonalComparison δ (fromBlocks τ 0 0 τ') := by
  sorry

/-- README 0.10: the fractional-linear period-matrix correspondence `W_τ(Z)`. Real blocks are
ordered `a, b, c, d` and cast entrywise to `ℂ`; the denominator must be nonsingular. -/
def periodMatrixCorrespondence {g : ℕ} (τ : CMat g) (Z : Set (CMat g)) : Set (RBlocks g) :=
  {X | ((X 1 0).map Complex.ofReal * τ + (X 1 1).map Complex.ofReal).det ≠ 0 ∧
    ((X 0 0).map Complex.ofReal * τ + (X 0 1).map Complex.ofReal) *
      ((X 1 0).map Complex.ofReal * τ + (X 1 1).map Complex.ofReal)⁻¹ ∈ Z}

namespace periodMatrixCorrespondence

theorem mem_iff {g : ℕ} (τ : CMat g) (Z : Set (CMat g)) (X : RBlocks g) :
    X ∈ periodMatrixCorrespondence τ Z ↔
      ((X 1 0).map Complex.ofReal * τ + (X 1 1).map Complex.ofReal).det ≠ 0 ∧
      ((X 0 0).map Complex.ofReal * τ + (X 0 1).map Complex.ofReal) *
        ((X 1 0).map Complex.ofReal * τ + (X 1 1).map Complex.ofReal)⁻¹ ∈ Z := by
  sorry

theorem mono {g : ℕ} (τ : CMat g) {Z Z' : Set (CMat g)} (h : Z ⊆ Z') :
    periodMatrixCorrespondence τ Z ⊆ periodMatrixCorrespondence τ Z' := by
  sorry

theorem inter {g : ℕ} (τ : CMat g) (Z Z' : Set (CMat g)) :
    periodMatrixCorrespondence τ (Z ∩ Z') =
      periodMatrixCorrespondence τ Z ∩ periodMatrixCorrespondence τ Z' := by
  sorry

theorem empty {g : ℕ} (τ : CMat g) : periodMatrixCorrespondence τ ∅ = ∅ := by
  sorry

theorem identity {g : ℕ} (τ : CMat g) (Z : Set (CMat g)) :
    (1 : RBlocks g) ∈ periodMatrixCorrespondence τ Z ↔ τ ∈ Z := by
  sorry

/-- Test `periodMatrixCorrespondence.identityGenusOne`. -/
example : (1 : RBlocks 1) ∈
    periodMatrixCorrespondence (Matrix.of fun _ _ => Complex.I)
      ({Matrix.of fun _ _ => Complex.I} : Set (CMat 1)) := by
  sorry

/-- Test `periodMatrixCorrespondence.singularExcluded`. -/
example {g : ℕ} (hg : 1 ≤ g) (τ : CMat g) :
    (0 : RBlocks g) ∉ periodMatrixCorrespondence τ Set.univ := by
  sorry

end periodMatrixCorrespondence

/-! ## Layer 3: Elliptic matrices and isogeny-class counts -/

/-- README 3.1, matrix form: if `τ, τ'` lie in the closed standard fundamental domain and
`τ' = (aτ + b)/(cτ + d)` for integers with `ad − bc = m > 0`, then every entry is at most
`2 m^{3/2}` in absolute value. The isogeny statement of the README is the case where the matrix
comes from a degree-`m` isogeny. -/
theorem ellipticMatrix_bound (τ τ' : UpperHalfPlane) (hτ : τ ∈ ModularGroup.fd)
    (hτ' : τ' ∈ ModularGroup.fd) (a b c d : ℤ) (m : ℕ) (hm : 0 < m)
    (hdet : a * d - b * c = m)
    (hrel : (τ' : ℂ) = (a * (τ : ℂ) + b) / (c * (τ : ℂ) + d)) :
    (max (max |a| |b|) (max |c| |d|) : ℝ) ≤ 2 * (m : ℝ) ^ ((3 : ℝ) / 2) := by
  sorry

/-- README 3.2: for each `g` there is `C_g` with at most `C_g m^{2g}` finite subgroups of
`(ℚ/ℤ)^{2g}` of order at most `m`. Subgroups are counted, not generating sets. -/
theorem finiteSubgroupCount (g : ℕ) :
    ∃ C : ℝ, 0 < C ∧ ∀ m : ℕ, 1 ≤ m →
      {H : AddSubgroup (Fin (2 * g) → AddCircle (1 : ℚ)) |
          Finite H ∧ Nat.card H ≤ m}.Finite ∧
      (({H : AddSubgroup (Fin (2 * g) → AddCircle (1 : ℚ)) |
          Finite H ∧ Nat.card H ≤ m}.ncard : ℕ) : ℝ) ≤ C * (m : ℝ) ^ (2 * g) := by
  sorry

/-- README 3.2, genus one: the constant `1` suffices, since `∑_{n ≤ m} σ(n) ≤ m²`. -/
theorem finiteSubgroupCount_genusOne (m : ℕ) (hm : 1 ≤ m) :
    {H : AddSubgroup (Fin 2 → AddCircle (1 : ℚ)) |
        Finite H ∧ Nat.card H ≤ m}.ncard ≤ m ^ 2 := by
  sorry

/-! ## Layer 4: Elimination and elliptic real-curve avoidance -/

/-- The degree `ψ(m) = m ∏_{p ∣ m} (1 + 1/p)` of the modular polynomial `Φ_m` in each variable
(README 4.2). -/
noncomputable def dedekindPsi (m : ℕ) : ℚ :=
  (m : ℚ) * ∏ p ∈ m.primeFactors, (1 + 1 / (p : ℚ))

/-- Test: `ψ(6) = 12`. -/
example : dedekindPsi 6 = 12 := by
  sorry

/-- Test: `ψ(p) = p + 1` for a prime `p`, which differs from the full Hecke degree only for
composite `m`. -/
example (p : ℕ) (hp : p.Prime) : dedekindPsi p = p + 1 := by
  sorry

/-- README 4.2: `ψ(m) ≤ σ(m)`. -/
theorem dedekindPsi_le_sigma (m : ℕ) :
    dedekindPsi m ≤ (ArithmeticFunction.sigma 1 m : ℚ) := by
  sorry

/-- README 4.2: `∑_{m ≤ M} ψ(m) ≤ ∑_{d ≤ M} d ⌊M/d⌋ ≤ M²`. -/
theorem sum_dedekindPsi_le (M : ℕ) :
    ∑ m ∈ Finset.Icc 1 M, dedekindPsi m ≤ (M : ℚ) ^ 2 := by
  sorry

/-- README 4.2: `∑_{m ≤ M} ψ(m)² ≪ M³ log M` for `M ≥ 2`. -/
theorem sum_dedekindPsi_sq_le :
    ∃ C : ℝ, 0 < C ∧ ∀ M : ℕ, 2 ≤ M →
      (∑ m ∈ Finset.Icc 1 M, (dedekindPsi m : ℝ) ^ 2) ≤ C * (M : ℝ) ^ 3 * Real.log M := by
  sorry

/-! ## Layer 5: Rosati geometry and controlled period matrices -/

/-- The polarization matrix `ε = (0, −I; I, 0)` (MZ20, (22)); it equals Mathlib's `J`. -/
abbrev epsilon (g : ℕ) : RBig g := fromBlocks 0 (-1) 1 0

/-- The period row `(I τ)` of a period matrix `τ`, as a `g × 2g` complex matrix. -/
def periodRow {g : ℕ} (τ : CMat g) : Matrix (Fin g) (Fin g ⊕ Fin g) ℂ :=
  fromCols 1 τ

/-- `κ` is the analytic representation belonging to the real rational representation `ρ` at `τ`:
`κ (I τ) = (I τ) ρ` (MZ20, (21)). -/
def IsAnalyticRep {g : ℕ} (τ : CMat g) (ρ : RBig g) (κ : CMat g) : Prop :=
  κ * periodRow τ = periodRow τ * ρ.map Complex.ofReal

/-- The rational Rosati square length `ℓ(ρ)² = tr(ρ ε ρᵀ εᵀ)` (README 5.1), using
`ε⁻¹ = εᵀ`. -/
def rosatiSq {g : ℕ} (ρ : RBig g) : ℝ :=
  trace (ρ * epsilon g * ρᵀ * (epsilon g)ᵀ)

/-- Test: `ε` is Mathlib's `J`. -/
example (g : ℕ) : epsilon g = J (Fin g) ℝ := by
  sorry

/-- Test: multiplication by an integer `n` has analytic representation `n I`. -/
example (g : ℕ) (τ : CMat g) (n : ℤ) :
    IsAnalyticRep τ ((n : ℝ) • (1 : RBig g)) ((n : ℂ) • (1 : CMat g)) := by
  sorry

/-- Test `rosatiLength.scalar`: `ℓ([n])² = 2g n²`. -/
example (g : ℕ) (n : ℤ) : rosatiSq ((n : ℝ) • (1 : RBig g)) = 2 * g * (n : ℝ) ^ 2 := by
  sorry

/-- In genus one the inverse of the alternating matrix is its transpose, not itself. -/
example : epsilon 1 * epsilon 1 = -(1 : RBig 1) ∧
    rosatiSq (1 : RBig 1) = 2 := by
  sorry

/-- The zero analytic matrix cannot represent the identity rational matrix at `τ = i`. -/
example : ¬ IsAnalyticRep (Complex.I • (1 : CMat 1)) (1 : RBig 1) 0 := by
  sorry

/-- README 5.1: the rational Rosati trace is twice the real part of the analytic one,
`tr(ρ ε ρᵀ ε⁻¹) = 2 Re tr(κ y κᴴ y⁻¹)` with `y = Im τ`. -/
theorem rationalAnalyticTrace {g : ℕ} {τ : CMat g} (hτ : τ ∈ SiegelSpace (Fin g))
    {ρ : RBig g} {κ : CMat g} (h : IsAnalyticRep τ ρ κ) :
    rosatiSq ρ = 2 * (trace (κ * (τ.map Complex.im).map Complex.ofReal * κᴴ *
      ((τ.map Complex.im).map Complex.ofReal)⁻¹)).re := by
  sorry

/-- README 5.2: submultiplicativity of the Rosati length, in squared form. -/
theorem rosatiSq_mul_le {g : ℕ} {τ : CMat g} (hτ : τ ∈ SiegelSpace (Fin g))
    {ρ ρ' : RBig g} {κ κ' : CMat g} (h : IsAnalyticRep τ ρ κ) (h' : IsAnalyticRep τ ρ' κ') :
    rosatiSq (ρ * ρ') ≤ rosatiSq ρ * rosatiSq ρ' := by
  sorry

/-- README 5.3: `|det ρ| ≤ (ℓ(ρ)²/(2g))^g`, hence `deg v ≤ ℓ(v)^{2g}`. -/
theorem abs_det_le_rosatiSq_pow {g : ℕ} (hg : 1 ≤ g) {τ : CMat g}
    (hτ : τ ∈ SiegelSpace (Fin g)) {ρ : RBig g} {κ : CMat g} (h : IsAnalyticRep τ ρ κ) :
    |ρ.det| ≤ (rosatiSq ρ / (2 * g)) ^ g := by
  sorry

/-- README 5.4, the lower-left entries: under the diagonal comparisons,
`|c_ij| ≤ C(g,δ) ℓ(ρ)/√(y_i y_j)` for the block `−c` of `ρ = (a, −b; −c, d)`. -/
theorem entry_c_bound (g : ℕ) {δ : ℝ} (hδ : 0 < δ) (hδ1 : δ ≤ 1) :
    ∃ C : ℝ, 0 < C ∧ ∀ (τ : CMat g) (ρ : RBig g) (κ : CMat g),
      τ ∈ SiegelSpace (Fin g) → DiagonalComparison δ τ → IsAnalyticRep τ ρ κ →
      ∀ i j, |ρ.toBlocks₂₁ i j| ≤
        C * Real.sqrt (rosatiSq ρ) / Real.sqrt ((τ i i).im * (τ j j).im) := by
  sorry

/-- README 5.5, the upper-left entries: `|a_ij| ≤ C(g,δ) √(y_i/y_j) ℓ(ρ)`. -/
theorem entry_a_bound (g : ℕ) {δ : ℝ} (hδ : 0 < δ) (hδ1 : δ ≤ 1) :
    ∃ C : ℝ, 0 < C ∧ ∀ (τ : CMat g) (ρ : RBig g) (κ : CMat g),
      τ ∈ SiegelSpace (Fin g) → DiagonalComparison δ τ → IsAnalyticRep τ ρ κ →
      ∀ i j, |ρ.toBlocks₁₁ i j| ≤
        C * Real.sqrt ((τ i i).im / (τ j j).im) * Real.sqrt (rosatiSq ρ) := by
  sorry

/-- README 5.6, the lower-right entries: `|d_ij| ≤ C(g,δ) √(y_j/y_i) ℓ(ρ)`. -/
theorem entry_d_bound (g : ℕ) {δ : ℝ} (hδ : 0 < δ) (hδ1 : δ ≤ 1) :
    ∃ C : ℝ, 0 < C ∧ ∀ (τ : CMat g) (ρ : RBig g) (κ : CMat g),
      τ ∈ SiegelSpace (Fin g) → DiagonalComparison δ τ → IsAnalyticRep τ ρ κ →
      ∀ i j, |ρ.toBlocks₂₂ i j| ≤
        C * Real.sqrt ((τ j j).im / (τ i i).im) * Real.sqrt (rosatiSq ρ) := by
  sorry

/-- README 5.7, the upper-right entries: `|b_ij| ≤ C(g,δ) √(y_i y_j) ℓ(ρ)` for the block `−b`. -/
theorem entry_b_bound (g : ℕ) {δ : ℝ} (hδ : 0 < δ) (hδ1 : δ ≤ 1) :
    ∃ C : ℝ, 0 < C ∧ ∀ (τ : CMat g) (ρ : RBig g) (κ : CMat g),
      τ ∈ SiegelSpace (Fin g) → DiagonalComparison δ τ → IsAnalyticRep τ ρ κ →
      ∀ i j, |ρ.toBlocks₁₂ i j| ≤
        C * Real.sqrt ((τ i i).im * (τ j j).im) * Real.sqrt (rosatiSq ρ) := by
  sorry

/-- README 5.12: if the signed block matrix `(a, −b; −c, d)` is nonsingular and
`η (cτ + d) = aτ + b`, then `cτ + d` is invertible and `η = (aτ + b)(cτ + d)⁻¹`; no
polarization-preserving hypothesis is used. -/
theorem denominator_invertible {g : ℕ} (a b c d τ η : CMat g)
    (hdet : (fromBlocks a (-b) (-c) d).det ≠ 0)
    (hrel : η * (c * τ + d) = a * τ + b) :
    (c * τ + d).det ≠ 0 ∧ η = (a * τ + b) * (c * τ + d)⁻¹ := by
  sorry

/-! ## Layer 8: Fourier order, theta coordinates and explicit degree -/

/-- The theta constant `θ_{m,m*}(τ) = ∑_h exp(πi (h+m) τ (h+m)ᵀ + 2πi (h+m) m*ᵀ)` with row-vector
characteristics (README 8.6), on an arbitrary finite index type so that products split. -/
noncomputable def thetaConstant {ι : Type*} [Fintype ι] (m m' : ι → ℝ) (τ : Matrix ι ι ℂ) : ℂ :=
  ∑' h : ι → ℤ, Complex.exp (Real.pi * Complex.I *
      (∑ i, ∑ j, ((h i : ℂ) + m i) * τ i j * ((h j : ℂ) + m j)) +
    2 * Real.pi * Complex.I * ∑ i, ((h i : ℂ) + m i) * m' i)

/-- README 8.6, `thetaConstant.shiftFirst`: integral shifts of the first characteristic. -/
theorem thetaConstant_add_int_left {ι : Type*} [Fintype ι] {τ : Matrix ι ι ℂ}
    (hτ : τ ∈ SiegelSpace ι) (m m' : ι → ℝ) (k : ι → ℤ) :
    thetaConstant (m + fun i => (k i : ℝ)) m' τ = thetaConstant m m' τ := by
  sorry

/-- README 8.6, `thetaConstant.shiftSecond`: integral shifts of the second characteristic
multiply by `exp(2πi m kᵀ)`. -/
theorem thetaConstant_add_int_right {ι : Type*} [Fintype ι] {τ : Matrix ι ι ℂ}
    (hτ : τ ∈ SiegelSpace ι) (m m' : ι → ℝ) (k : ι → ℤ) :
    thetaConstant m (m' + fun i => (k i : ℝ)) τ =
      Complex.exp (2 * Real.pi * Complex.I * ∑ i, (m i : ℂ) * k i) * thetaConstant m m' τ := by
  sorry

/-- Test `thetaConstant.oddElliptic`: in genus one the odd characteristic gives zero. -/
example (τ : Matrix (Fin 1) (Fin 1) ℂ) (hτ : τ ∈ SiegelSpace (Fin 1)) :
    thetaConstant (fun _ => (1 / 2 : ℝ)) (fun _ => (1 / 2 : ℝ)) τ = 0 := by
  sorry

/-- Test `thetaConstant.zeroCharacteristicImaginary`: `θ_{0,0}(i t I)` is a positive real. -/
example {ι : Type*} [Fintype ι] [DecidableEq ι] (t : ℝ) (ht : 0 < t) :
    0 < (thetaConstant 0 0 (((t : ℂ) * Complex.I) • (1 : Matrix ι ι ℂ))).re ∧
      (thetaConstant 0 0 (((t : ℂ) * Complex.I) • (1 : Matrix ι ι ℂ))).im = 0 := by
  sorry

/-- The Igusa level `Γ(e, 2e)` (README 8.6): symplectic integer matrices congruent to `I`
modulo `e` whose blocks satisfy `diag(a bᵀ) ≡ diag(c dᵀ) ≡ 0 (mod 2e)`. -/
def thetaLevel (g : ℕ) (e : ℤ) : Set (ZBig g) :=
  {γ | γ ∈ symplecticGroup (Fin g) ℤ ∧ (∀ i j, e ∣ (γ - 1) i j) ∧
    (∀ i, 2 * e ∣ (γ.toBlocks₁₁ * (γ.toBlocks₁₂)ᵀ) i i) ∧
    ∀ i, 2 * e ∣ (γ.toBlocks₂₁ * (γ.toBlocks₂₂)ᵀ) i i}

/-- Test `thetaLevel.identity`. -/
example (g : ℕ) (e : ℤ) : (1 : ZBig g) ∈ thetaLevel g e := by
  sorry

/-- Test `thetaLevel.ellipticShear`: for `g = 1` and `e ≠ 0` the shear `(1, e; 0, 1)` lies in
`Γ(e)` but not in `Γ(e, 2e)`. -/
example (e : ℤ) (he : e ≠ 0) :
    (fromBlocks 1 (Matrix.of fun _ _ => e) 0 1 : ZBig 1) ∉ thetaLevel 1 e := by
  sorry

/-- README 8.6, `thetaLevel.inclusions`: `Γ(2e) ⊆ Γ(e, 2e)`. -/
theorem principal_subset_thetaLevel (g : ℕ) (e : ℤ) (γ : ZBig g)
    (hγ : γ ∈ symplecticGroup (Fin g) ℤ) (h2e : ∀ i j, 2 * e ∣ (γ - 1) i j) :
    γ ∈ thetaLevel g e := by
  sorry

/-- README 8.6, `thetaLevel.subgroup`: for even `e` the level is closed under products. -/
theorem thetaLevel_mul_mem (g : ℕ) {e : ℤ} (he : Even e) {γ γ' : ZBig g}
    (hγ : γ ∈ thetaLevel g e) (hγ' : γ' ∈ thetaLevel g e) : γ * γ' ∈ thetaLevel g e := by
  sorry

/-- A rational matrix is half-integral when its diagonal is integral and twice every entry is
integral. -/
def IsHalfIntegral {g : ℕ} (M : Matrix (Fin g) (Fin g) ℚ) : Prop :=
  (∀ i, ∃ z : ℤ, M i i = z) ∧ ∀ i j, ∃ z : ℤ, 2 * M i j = z

/-- Test: `diag(1, 1)` with off-diagonal `1/2` is half-integral; the matrix with a diagonal
entry `1/2` is not. -/
example : IsHalfIntegral (!![1, 1 / 2; 1 / 2, 1] : Matrix (Fin 2) (Fin 2) ℚ) ∧
    ¬ IsHalfIntegral (!![1 / 2, 0; 0, 1] : Matrix (Fin 2) (Fin 2) ℚ) := by
  sorry

/-- README 8.8: at most `(4eW + 1)^G` positive-semidefinite symmetric rational `M` with `eM`
half-integral and `tr M ≤ W`, where `G = g(g+1)/2`. -/
theorem fourierIndexCount (g e : ℕ) (he : 1 ≤ e) (W : ℝ) (hW : 0 ≤ W) :
    {M : Matrix (Fin g) (Fin g) ℚ | M.IsSymm ∧ (M.map (Rat.cast : ℚ → ℝ)).PosSemidef ∧
        IsHalfIntegral ((e : ℚ) • M) ∧ ((M.trace : ℚ) : ℝ) ≤ W}.Finite ∧
      (({M : Matrix (Fin g) (Fin g) ℚ | M.IsSymm ∧ (M.map (Rat.cast : ℚ → ℝ)).PosSemidef ∧
        IsHalfIntegral ((e : ℚ) • M) ∧ ((M.trace : ℚ) : ℝ) ≤ W}.ncard : ℕ) : ℝ) ≤
        (4 * e * W + 1) ^ (g * (g + 1) / 2) := by
  sorry

/-- The upper bound `(4/π)^g Γ((g+1)/2)² (3/2)^{(g−1)(g−2)}` for the Minkowski constant `c_g`
(README 8.13; Γ is Euler's gamma function). -/
noncomputable def minkowskiConstantBound (g : ℕ) : ℝ :=
  (4 / Real.pi) ^ g * Real.Gamma (((g : ℝ) + 1) / 2) ^ 2 * (3 / 2 : ℝ) ^ ((g - 1) * (g - 2))

/-- Test: `c₁ ≤ 4/π` since `Γ(1) = 1` and the last factor is `1`. -/
example : minkowskiConstantBound 1 = 4 / Real.pi := by
  sorry

/-- README 8.13, numerical part: `2 (G+1)! ((32g/(π√3)) 512^{2g²} c_g)^G ≤ 2^{16g⁴ − 1}` for
`g ≥ 2` and `G = g(g+1)/2`. -/
theorem thetaNumericalDegree_le (g : ℕ) (hg : 2 ≤ g) :
    2 * ((g * (g + 1) / 2 + 1).factorial : ℝ) *
        ((32 * g / (Real.pi * Real.sqrt 3)) * (512 : ℝ) ^ (2 * g ^ 2) *
          minkowskiConstantBound g) ^ (g * (g + 1) / 2) ≤
      (2 : ℝ) ^ (16 * g ^ 4 - 1) := by
  sorry

/-! ## Layer 10: Arithmetic consequences and the Schottky application -/

/-- The half-integral characteristic attached to `c : ι → Fin 2` (`0 ↦ 0`, `1 ↦ 1/2`). -/
noncomputable def halfChar {ι : Type*} (c : ι → Fin 2) : ι → ℝ := fun i => (c i : ℝ) / 2

/-- Test: the characteristic `1` is `1/2`, the characteristic `0` is `0`. -/
example : halfChar (fun _ : Fin 1 => (1 : Fin 2)) = (fun _ => (1 / 2 : ℝ)) ∧
    halfChar (fun _ : Fin 1 => (0 : Fin 2)) = (fun _ => (0 : ℝ)) := by
  sorry

/-- `U_g = ∑ θ_{m,m*}^{16}` over all half-integral characteristics (README 10.10). -/
noncomputable def schottkyU {ι : Type*} [Fintype ι] [DecidableEq ι] (τ : Matrix ι ι ℂ) : ℂ :=
  ∑ c : ι → Fin 2, ∑ c' : ι → Fin 2, thetaConstant (halfChar c) (halfChar c') τ ^ 16

/-- `V_g = ∑ θ_{m,m*}^8` over all half-integral characteristics (README 10.10). -/
noncomputable def schottkyV {ι : Type*} [Fintype ι] [DecidableEq ι] (τ : Matrix ι ι ℂ) : ℂ :=
  ∑ c : ι → Fin 2, ∑ c' : ι → Fin 2, thetaConstant (halfChar c) (halfChar c') τ ^ 8

/-- The Igusa–Schottky form `F_g = 2^g U_g − V_g²` (README 10.10). -/
noncomputable def schottkyForm {ι : Type*} [Fintype ι] [DecidableEq ι] (τ : Matrix ι ι ℂ) : ℂ :=
  2 ^ Fintype.card ι * schottkyU τ - schottkyV τ ^ 2

/-- README 10.11: theta constants factor on block-diagonal period matrices. -/
theorem thetaConstant_fromBlocks {ι κ : Type*} [Fintype ι] [Fintype κ] {τ : Matrix ι ι ℂ}
    {τ' : Matrix κ κ ℂ} (hτ : τ ∈ SiegelSpace ι) (hτ' : τ' ∈ SiegelSpace κ)
    (m m' : ι → ℝ) (n n' : κ → ℝ) :
    thetaConstant (Sum.elim m n) (Sum.elim m' n') (fromBlocks τ 0 0 τ') =
      thetaConstant m m' τ * thetaConstant n n' τ' := by
  sorry

/-- README 10.10: the Schottky form vanishes identically in genus at most three. -/
theorem schottkyForm_eq_zero_of_card_le_three {ι : Type*} [Fintype ι] [DecidableEq ι]
    (hι : Fintype.card ι ≤ 3) {τ : Matrix ι ι ℂ} (hτ : τ ∈ SiegelSpace ι) :
    schottkyForm τ = 0 := by
  sorry

/-- README 10.12: the genus-four Schottky form vanishes on products of two principally polarized
abelian surfaces. -/
theorem schottkyForm_fromBlocks_two_two {τ τ' : Matrix (Fin 2) (Fin 2) ℂ}
    (hτ : τ ∈ SiegelSpace (Fin 2)) (hτ' : τ' ∈ SiegelSpace (Fin 2)) :
    schottkyForm (fromBlocks τ 0 0 τ') = 0 := by
  sorry

/-- README 10.12: the genus-four Schottky form vanishes on products of an elliptic curve and a
principally polarized abelian threefold. -/
theorem schottkyForm_fromBlocks_one_three {τ : Matrix (Fin 1) (Fin 1) ℂ}
    {τ' : Matrix (Fin 3) (Fin 3) ℂ} (hτ : τ ∈ SiegelSpace (Fin 1))
    (hτ' : τ' ∈ SiegelSpace (Fin 3)) :
    schottkyForm (fromBlocks τ 0 0 τ') = 0 := by
  sorry

/-! ## Layer 11: Newton interpolation within isogeny classes -/

/-- README 11.1: the normalized Newton series `∑ a_n ∏_{m<n} (z − t_m)/(t_n − t_m)`, as the
total sum; its interpolation API needs injective `t` and its analytic API the coefficient
envelope. -/
noncomputable def newtonSeries (t : ℕ → ℝ) (a : ℕ → ℂ) (z : ℂ) : ℂ :=
  ∑' n, a n * ∏ m ∈ Finset.range n, (z - (t m : ℂ)) / ((t n : ℂ) - (t m : ℂ))

namespace newtonSeries

theorem at_parameter (t : ℕ → ℝ) (a : ℕ → ℂ) (ht : Function.Injective t) (k : ℕ) :
    newtonSeries t a (t k) =
      ∑ n ∈ Finset.range (k + 1), a n *
        ∏ m ∈ Finset.range n, ((t k : ℂ) - (t m : ℂ)) / ((t n : ℂ) - (t m : ℂ)) := by
  sorry

theorem finite_support (t : ℕ → ℝ) (a : ℕ → ℂ) (s : Finset ℕ)
    (ha : ∀ n, n ∉ s → a n = 0) (z : ℂ) :
    newtonSeries t a z = ∑ n ∈ s, a n *
      ∏ m ∈ Finset.range n, (z - (t m : ℂ)) / ((t n : ℂ) - (t m : ℂ)) := by
  sorry

theorem summable_at (t : ℕ → ℝ) (a : ℕ → ℂ) (ht : Function.Injective t)
    (henv : ∀ R : ℝ, 0 < R → Summable (fun n => ‖a n‖ *
      ∏ m ∈ Finset.range n, (R + |t m|) / |t n - t m|)) (z : ℂ) :
    Summable (fun n => a n *
      ∏ m ∈ Finset.range n, (z - (t m : ℂ)) / ((t n : ℂ) - (t m : ℂ))) := by
  sorry

theorem holomorphic (t : ℕ → ℝ) (a : ℕ → ℂ) (ht : Function.Injective t)
    (henv : ∀ R : ℝ, 0 < R → Summable (fun n => ‖a n‖ *
      ∏ m ∈ Finset.range n, (R + |t m|) / |t n - t m|)) :
    Differentiable ℂ (newtonSeries t a) := by
  sorry

theorem polynomial_compatibility (t : ℕ → ℝ) (a : ℕ → ℂ) (s : Finset ℕ)
    (ha : ∀ n, n ∉ s → a n = 0) (z : ℂ) :
    newtonSeries t a z = Polynomial.eval z
      (∑ n ∈ s, Polynomial.C (a n) *
        ∏ m ∈ Finset.range n, Polynomial.C (((t n : ℂ) - (t m : ℂ))⁻¹) *
          (Polynomial.X - Polynomial.C (t m : ℂ))) := by
  sorry

/-- Test `newtonSeries.zero_coefficients`. -/
example (t : ℕ → ℝ) (z : ℂ) : newtonSeries t (fun _ => 0) z = 0 := by
  sorry

/-- Test `newtonSeries.constant_coefficients`. -/
example (t : ℕ → ℝ) (c z : ℂ) :
    newtonSeries t (fun n => if n = 0 then c else 0) z = c := by
  sorry

/-- Test `newtonSeries.linear_basis`: `t_n = n + 1`, `a₁ = 1` gives `z − 1`. -/
example (z : ℂ) :
    newtonSeries (fun n => (n : ℝ) + 1) (fun n => if n = 1 then 1 else 0) z = z - 1 := by
  sorry

end newtonSeries

/-- Test `matrixInterpolationImage.energyIdentity`: `I + w wᵀ` is positive definite for every
real `w`, so the imaginary parts of README 11.6 lie in the Siegel space. -/
example {n : Type*} [Fintype n] [DecidableEq n] (w : Matrix n n ℝ) :
    (1 + w * wᵀ).PosDef := by
  sorry

/-!
## Statements not typed at the pins

The README states the following targets, whose carriers the pinned libraries do not provide:
abelian varieties over number fields with their isogenies, Faltings heights and Rosati
involutions, the coarse space `A_g` and its uniformization, Λ-forms and Siegel modular forms,
CM types and L-functions of CM fields, o-minimal structures and definable sets, semialgebraic
sets, Shimura data and weakly special subvarieties, Galois images on Tate modules, and complex
analytic spaces. They are listed by layer.

* Layer 0: `torelliLocus`, `compactTypeClosure`, `jacobianHypersurface`, `coefficientDescent`,
  `LambdaForm`.
* Layer 1: `periodTheorem`, `ellipticIsogenyEstimate`, `isogenyEstimate`, `endomorphismEstimate`,
  `cuspValueLowerBound`, `averagedColmez`, `cmFaltingsHeightBound`, `cmGaloisOrbitLowerBound`,
  `cmBoundedDiscriminantFinite`.
* Layer 2: `OMinimalStructure`, `RanExp`, `algebraicPart`, `DefinableBlock`,
  `DefinableBlockFamily`, `uniformBlockCounting`,
  `definableUniformization`, `ellipticAxLindemann`, `WeaklySpecial`, `axLindemannAg`,
  `weaklySpecial_hodgeGeneric`.
* Layer 3: `ellipticManyClasses`.
* Layer 4: `eliminationPolynomial`, `smallIsogenyCandidates`, `ellipticLargeField`,
  `ellipticDoubleCorrespondence`, `ellipticBlockImages`, `ellipticOrbitCollapse`,
  `ellipticModularCase`, `ellipticAvoidance`, `oneParameterObstruction`, `oneParameterOffset`.
* Layer 5: `entryABounds`, `entryDBounds`, `entryBBounds`, `offDiagonal`,
  `shortIndependentFamily`, `controlledLengthIsogeny`, `periodHeight`.
* Layer 6: `pGenericIsogeny`, `pToAdelic`, `galoisToHodge`, `serreOpenImage`,
  `universalOpenMonodromy`, `endomorphismSpecialization`, `frattiniSpecialization`,
  `genericityGridCount`.
* Layer 7: `fibreFieldBound`, `boundedModelModuli`, `dualSmallIsogenyCorrespondence`,
  `smallIsogenyHypersurfaces`, `candidateCount`, `heightDiscriminant`, `isogenyDegreeHeight`,
  `logThreshold`.
* Layer 8: `fourierOrder`, `orderSuperadditive`, `normForm`, `igusaOrderBound`,
  `finiteLevelOrderBound`, `thetaLinearCombinations`, `thetaCoefficientKernel`,
  `thetaRelationVanishing`, `thetaModel`, `genericProjectionDegree`, `thetaParameter`.
* Layer 9: `correspondenceDefinability`, `galoisPeriodHeight`, `hodgeGenericZeroImages`,
  `orbitDegreeCollapse`, `countingTheorem`.
* Layer 10: `hypersurfaceAvoidance`, `noJacobian`, `manyClasses`, `quadraticApproximation`,
  `avoidFiniteIsogenyClasses`, `denseIndependentSet`, `unirationalCount`, `rationalFourfold`,
  `boundedCmCount`.
* Layer 11: `coefficientEnvelope`, `ellipticPeriodSelection`, `ellipticInterpolationImage`,
  `symplecticDenseSelection`, `matrixInterpolationImage`.
* Layer 12: `arithmeticComparisonCover`, `rationalTorsionCyclotomic`, `fullDegreeBookkeeping`,
  `supplementaryTorsionTarget`.
* Layer 13: `satakeDimensionObstruction`, `closedHypersurfaceAlgebraic`,
  `noGlobalInterpolationHypersurface`, `localHypersurfaceSpec`, `localReplacement`.
-/
end TauCetiRoadmap.AbelianVarietiesIsogenousToNoJacobian
