import Mathlib
import TauCeti.KnotTheory.Markov

/-!
# Arithmetic quantum topology: representative target signatures

The roadmap is `README.md`; this file records the definitions and theorem signatures that can be
stated against the pinned Mathlib and Tau Ceti, and it is not exhaustive. Framed links, surgery,
quantum groups and their completions, the Habiro ring, ideal triangulations, the extended Bloch
group, state integrals and the Kashaev invariant of a general knot have no carrier at the pins;
their targets are stated in the README only, and the closing comment lists them.

Design choices made explicit here:

* Linking matrices are integer matrices indexed by `Fin m`; admissibility and handle slides are
  stated on them. Geometric framed links are GeometricTopology's and are not represented.
* The representation ring of sl₂ is `Polynomial (LaurentPolynomial ℤ)` in the variable `X = V₁`,
  over the ring `ℤ[v, v⁻¹]` with `T 1 = v`; quantum integers are balanced.
* The q-series of the figure-eight knot are truncated sums, evaluated at a unit `q` of an arbitrary
  commutative ring; no completion is formed.
* Shapes, flattenings and Neumann–Zagier data are complex numbers and matrices; a matrix datum is
  never asserted to come from a triangulation.
* The denominator cocycle is a rational function of a reduced rational number and an element of
  `SL(2, ℤ)`; off its domain the Lean division returns `0`, and every identity carries the domain
  hypotheses.
-/

noncomputable section

open Polynomial LaurentPolynomial Finset
open scoped Matrix

namespace TauCetiRoadmap.ArithmeticQuantumTopology

/-! ## Layer 0: framed links, surgery and the refined Kirby calculus -/

section LinkingMatrices

variable {m : ℕ}

/-- A linking matrix is algebraically split when all off-diagonal entries (the pairwise linking
numbers) vanish. README 0.1. -/
def IsAlgebraicallySplit (A : Matrix (Fin m) (Fin m) ℤ) : Prop :=
  ∀ i j, i ≠ j → A i j = 0

/-- A linking matrix is admissible when it is algebraically split and every framing is `±1`
([HabK] §1, p. 1286). README 0.3. -/
def IsAdmissible (A : Matrix (Fin m) (Fin m) ℤ) : Prop :=
  IsAlgebraicallySplit A ∧ ∀ i, A i i = 1 ∨ A i i = -1

/-- The cokernel of a linking matrix acting on column vectors: the first homology of the surgery
(README 0.2). -/
abbrev LinkingCokernel (A : Matrix (Fin m) (Fin m) ℤ) : Type :=
  (Fin m → ℤ) ⧸ LinearMap.range (Matrix.mulVecLin A)

/-- The matrix of a handle slide of component `i` over component `j` with the adding band:
`Pᵀ A P` with `P = 1 + E_ji`, a Mathlib transvection. README 0.4. -/
def handleSlide (A : Matrix (Fin m) (Fin m) ℤ) (i j : Fin m) : Matrix (Fin m) (Fin m) ℤ :=
  (Matrix.transvection j i 1)ᵀ * A * Matrix.transvection j i 1

/-- An admissible linking matrix is unimodular, so the surgery is an integral homology sphere. -/
theorem isUnit_det_of_isAdmissible {A : Matrix (Fin m) (Fin m) ℤ} (h : IsAdmissible A) :
    IsUnit A.det := by
  sorry

/-- The diagonal entry after a handle slide of `i` over `j ≠ i`, for a symmetric matrix:
`A_ii + A_jj + 2 A_ij`. -/
theorem handleSlide_apply_self {A : Matrix (Fin m) (Fin m) ℤ} (hA : A.IsSymm) {i j : Fin m}
    (hij : i ≠ j) : handleSlide A i j i i = A i i + A j j + 2 * A i j := by
  sorry

/-- A handle slide does not change the isomorphism class of the cokernel, for any square matrix,
symmetric or not, singular or not. -/
theorem linkingCokernel_handleSlide (A : Matrix (Fin m) (Fin m) ℤ) {i j : Fin m} (hij : i ≠ j) :
    Nonempty (LinkingCokernel (handleSlide A i j) ≃ₗ[ℤ] LinkingCokernel A) := by
  sorry

/-- The linking matrix of the `0`-framed Hopf link is not algebraically split. -/
example : ¬ IsAlgebraicallySplit !![(0 : ℤ), 1; 1, 0] := by
  intro h
  have := h 0 1 (by decide)
  simp at this

/-- The `(+1)`-framed unknot is admissible; the `0`-framed unknot is not. -/
example : IsAdmissible !![(1 : ℤ)] ∧ ¬ IsAdmissible !![(0 : ℤ)] := by
  refine ⟨⟨fun i j hij => (hij (Subsingleton.elim i j)).elim, fun i => ?_⟩, fun h => ?_⟩
  · fin_cases i; simp
  · rcases h.2 0 with h0 | h0 <;> simp at h0

/-- Sliding one component of the `0`-framed Hopf link over the other gives framing `2`. -/
example : handleSlide !![(0 : ℤ), 1; 1, 0] 0 1 = !![2, 1; 1, 0] := by
  ext a b
  fin_cases a <;> fin_cases b <;>
    simp [handleSlide, Matrix.transvection, Matrix.mul_apply, Fin.sum_univ_two,
      Matrix.single_apply]

end LinkingMatrices

/-! Forgetting framings loses admissibility: the one-strand braid closures with framings `0` and
`1` are Markov equivalent after forgetting framings, while only the second has an admissible
linking matrix (README 0.1, last check). -/
namespace FramingCheck

/-- The one-strand braid closure, its only component framed by `f`. -/
def oneStrand (f : ℤ) : TauCeti.FramedMarkovBraid where
  forgetFraming := ⟨0, 1⟩
  framing := fun _ => f

theorem admissibility_not_descends :
    ¬ ∃ P : TauCeti.MarkovBraid → Prop,
      ∀ f : ℤ, P (oneStrand f).forgetFraming ↔ IsAdmissible !![f] := by
  sorry

example : TauCeti.MarkovEquiv (oneStrand 0).forgetFraming (oneStrand 1).forgetFraming :=
  TauCeti.MarkovEquiv.refl _

end FramingCheck

/-! ## Layer 1: ribbon Hopf algebras, quantum groups and universal invariants -/

section RibbonCategories

universe u v

open CategoryTheory MonoidalCategory

variable (C : Type u) [Category.{v} C] [MonoidalCategory C] [BraidedCategory C] [RigidCategory C]

/-- A ribbon structure on a braided rigid monoidal category: a natural automorphism of the identity
that is trivial on the unit, is the double braiding composed with the tensor of twists on a tensor
product, and commutes with right duals. No symmetry of the braiding is assumed. README 1.1. -/
structure RibbonCategory where
  /-- The twist `θ`. -/
  twist : 𝟭 C ≅ 𝟭 C
  twist_unit : twist.hom.app (𝟙_ C) = 𝟙 (𝟙_ C)
  twist_tensor : ∀ X Y : C,
    twist.hom.app (X ⊗ Y) =
      (twist.hom.app X ⊗ₘ twist.hom.app Y) ≫ (β_ X Y).hom ≫ (β_ Y X).hom
  twist_dual : ∀ X : C, twist.hom.app (Xᘁ) = (twist.hom.app X)ᘁ

variable {C}

/-- The ribbon (graphical) trace of an endomorphism: close the strand with the twist, the braiding
and the right evaluation and coevaluation. -/
def ribbonTrace (r : RibbonCategory C) {X : C} (f : X ⟶ X) : 𝟙_ C ⟶ 𝟙_ C :=
  η_ X (Xᘁ) ≫ ((f ≫ r.twist.hom.app X) ⊗ₘ 𝟙 (Xᘁ)) ≫ (β_ X (Xᘁ)).hom ≫ ε_ X (Xᘁ)

/-- The ribbon trace is multiplicative under tensor products of endomorphisms. -/
theorem ribbonTrace_tensor (r : RibbonCategory C) {X Y : C} (f : X ⟶ X) (g : Y ⟶ Y) :
    ribbonTrace r (f ⊗ₘ g) = ribbonTrace r f ≫ ribbonTrace r g := by
  sorry

end RibbonCategories

/-! ## Layer 2: coloured Jones polynomials and the cyclotomic expansion -/

section RepresentationRing

/-- The balanced quantum integer `[n] = (vⁿ − v⁻ⁿ)/(v − v⁻¹) = Σ_{j<n} v^{n−1−2j}` in `ℤ[v, v⁻¹]`,
with `v = T 1`. -/
def qInt (n : ℕ) : LaurentPolynomial ℤ :=
  ∑ j ∈ range n, T ((n : ℤ) - 1 - 2 * j)

/-- The quantum bracket `{a} = v^a − v^{−a}`. -/
def brace (a : ℤ) : LaurentPolynomial ℤ :=
  T a - T (-a)

/-- The colour `V_n = S_n(V₁)` in the representation ring `ℤ[v, v⁻¹][X]`, `X = V₁`, through
Mathlib's Chebyshev polynomials of the second kind (README 2.1). -/
def color (n : ℕ) : Polynomial (LaurentPolynomial ℤ) :=
  Polynomial.Chebyshev.S (LaurentPolynomial ℤ) n

/-- Habiro's cyclotomic colour `P_n = ∏_{i<n} (X − v^{2i+1} − v^{−2i−1})` (README 2.4). -/
def cycloColor (n : ℕ) : Polynomial (LaurentPolynomial ℤ) :=
  ∏ i ∈ range n, (X - Polynomial.C (T (2 * i + 1) + T (-(2 * i + 1))))

/-- Quantum dimension on the representation ring: `X = V₁ ↦ [2] = v + v⁻¹`. -/
def qdim : Polynomial (LaurentPolynomial ℤ) →+* LaurentPolynomial ℤ :=
  Polynomial.eval₂RingHom (RingHom.id _) (T 1 + T (-1))

/-- The quantum dimension of `V_n` is `[n+1]`. -/
theorem qdim_color (n : ℕ) : qdim (color n) = qInt (n + 1) := by
  sorry

/-- Every cyclotomic colour of positive index has quantum dimension zero: its factor `i = 0`
vanishes at `X = v + v⁻¹`. -/
theorem qdim_cycloColor {n : ℕ} (hn : 0 < n) : qdim (cycloColor n) = 0 := by
  sorry

/-- `qdim V₁ = v + v⁻¹`. -/
example : qdim X = T 1 + T (-1) := by
  simp [qdim]

/-- `[2] = v + v⁻¹`, not the classical dimension `2`. -/
example : qInt 2 = T 1 + T (-1) := by
  simp [qInt, Finset.sum_range_succ]

/-- `V₂ = X² − 1`, not `X²` (Clebsch–Gordan `V₁ ⊗ V₁ = V₂ + V₀`). -/
example : color 2 = X ^ 2 - 1 := by
  simp [color, Polynomial.Chebyshev.S_two]

example : cycloColor 1 = X - Polynomial.C (T 1 + T (-1)) := by
  simp [cycloColor]

/-- The coefficient of `a_i(K)` in `J_K(V_n)`: `{n+1+i}_{2i+1}/{1} = [n+1+i] ∏_{j=1}^{2i} {n+1+i−j}`
(README 2.7). -/
def colorExpansionCoeff (n i : ℕ) : LaurentPolynomial ℤ :=
  qInt (n + 1 + i) * ∏ j ∈ range (2 * i), brace ((n : ℤ) + i - j)

/-- The finite colour truncation `T_{K,n,N} = Σ_{i < min(N, n+1)} coeff(n,i) a_i` (README 2.9). -/
def colorTruncation (a : ℕ → LaurentPolynomial ℤ) (n N : ℕ) : LaurentPolynomial ℤ :=
  ∑ i ∈ range (min N (n + 1)), colorExpansionCoeff n i * a i

/-- For the unknot (`a₀ = 1`, all other coefficients `0`) every truncation beyond the colour is
the unknot value `[n+1]`. -/
theorem colorTruncation_unknot (n N : ℕ) (hN : n < N) :
    colorTruncation (fun i => if i = 0 then 1 else 0) n N = qInt (n + 1) := by
  sorry

/-- At `N = 2` the `V₁` value is `[2] + {3}{2}a₁`. -/
example (a : ℕ → LaurentPolynomial ℤ) (h0 : a 0 = 1) :
    colorTruncation a 1 2 = qInt 2 + qInt 3 * (brace 2 * brace 1) * a 1 := by
  simp [colorTruncation, colorExpansionCoeff, Finset.sum_range_succ, Finset.prod_range_succ, h0]

/-- The central elements `σ_n = ∏_{i=1}^n (Y − q^i − 2 − q^{−i})` in the variable `Y = C²`, with
`q = v²` (README 2.5). -/
def casimirSigma (n : ℕ) : Polynomial (LaurentPolynomial ℤ) :=
  ∏ i ∈ range n, (X - Polynomial.C (T (2 * (i + 1)) + 2 + T (-(2 * (i + 1)))))

example : casimirSigma 0 = 1 := by
  simp [casimirSigma]

/-- `σ_i` acts by zero on `V_n` for `i > n`: the Casimir `C` acts on `V_n` by `v^{n+1} + v^{−n−1}`. -/
theorem casimirSigma_eval_color {i n : ℕ} (h : n < i) :
    (casimirSigma i).eval (T (2 * (n + 1)) + 2 + T (-(2 * (n + 1)))) = 0 := by
  sorry

end RepresentationRing

section Kashaev

/-- The figure-eight Kashaev sum `Σ_{j<N} ∏_{k=1}^{j} |1 − ζ^k|²`; at `ζ = e^{2πi/N}` it is the
Kashaev invariant `⟨4₁⟩_N` (README 2.15). -/
def figureEightKashaevSum (ζ : ℂ) (N : ℕ) : ℝ :=
  ∑ j ∈ range N, ∏ k ∈ range j, Complex.normSq (1 - ζ ^ (k + 1))

/-- The Kashaev invariant of the figure-eight knot at order `N`. -/
def figureEightKashaev (N : ℕ) : ℝ :=
  figureEightKashaevSum (Complex.exp (2 * Real.pi * Complex.I / N)) N

/-- The first six values `1, 5, 13, 27, 46 + 2√5, 89`. -/
theorem figureEightKashaev_values :
    figureEightKashaev 1 = 1 ∧ figureEightKashaev 2 = 5 ∧ figureEightKashaev 3 = 13 ∧
      figureEightKashaev 4 = 27 ∧ figureEightKashaev 5 = 46 + 2 * Real.sqrt 5 ∧
      figureEightKashaev 6 = 89 := by
  sorry

/-- At `ζ = −1` and order two the sum is `1 + |1 − (−1)|² = 5`, the determinant of `4₁`. -/
example : figureEightKashaevSum (-1) 2 = 5 := by
  simp [figureEightKashaevSum, Finset.sum_range_succ, Complex.normSq_apply]
  norm_num

end Kashaev

/-! ## Layer 3: the unified invariant of integral homology spheres -/

/-- The divisor `(q² − 1)(q³ − 1)/(q − 1) = (q + 1)(q³ − 1)` of `J_M − 1` (README 3.5). -/
def firstDivisor : Polynomial ℤ := (X + 1) * (X ^ 3 - 1)

/-- Its expansion at `q = 1` starts with `6(q − 1)`. -/
example : firstDivisor.eval 1 = 0 ∧ (derivative firstDivisor).eval 1 = 6 := by
  constructor
  · simp [firstDivisor]
  · simp [firstDivisor, derivative_mul]

/-! ## Layer 4: root evaluations, the Ohtsuki series and general Lie type -/

section KirbyColor

/-- The sl₂ Kirby colour `Ω_r = Σ_{i=0}^{r−2} [i+1] V_i` (README 4.1). -/
def kirbyColor (r : ℕ) : Polynomial (LaurentPolynomial ℤ) :=
  ∑ i ∈ range (r - 1), Polynomial.C (qInt (i + 1)) * color i

/-- At `r = 2` the Kirby colour is `V₀`. -/
example : kirbyColor 2 = 1 := by
  simp [kirbyColor, color, qInt, Polynomial.Chebyshev.S_zero]

/-- At `r = 3` it is `V₀ + [2]V₁`; the top weight `V_{r−1} = V₂` does not occur. -/
example : kirbyColor 3 = 1 + Polynomial.C (qInt 2) * X := by
  simp [kirbyColor, color, Finset.sum_range_succ, Polynomial.Chebyshev.S_zero,
    Polynomial.Chebyshev.S_one, qInt]

end KirbyColor

/-! ## Layer 5: ideal triangulations, flattenings and the extended Bloch class -/

section Shapes

/-- The second edge parameter `z′ = 1/(1 − z)` of an ideal tetrahedron with shape `z` (README 5.1). -/
def shapePrime (z : ℂ) : ℂ := 1 / (1 - z)

/-- The third edge parameter `z″ = 1 − 1/z`. -/
def shapeDoublePrime (z : ℂ) : ℂ := 1 - 1 / z

/-- The product of the three edge parameters is `−1`. -/
theorem shape_mul_shapePrime_mul_shapeDoublePrime {z : ℂ} (h0 : z ≠ 0) (h1 : z ≠ 1) :
    z * shapePrime z * shapeDoublePrime z = -1 := by
  have h1' : (1 : ℂ) - z ≠ 0 := sub_ne_zero.mpr (Ne.symm h1)
  simp only [shapePrime, shapeDoublePrime]
  field_simp
  ring

/-- The log parameters `(w₀, w₁, w₂)` of the point `(z; p, q)` of Neumann's cover (README 5.4). -/
def flattening (z : ℂ) (p q : ℤ) : ℂ × ℂ × ℂ :=
  (Complex.log z + p * Real.pi * Complex.I,
    -Complex.log (1 - z) + q * Real.pi * Complex.I,
    Complex.log (1 - z) - Complex.log z - (p + q) * Real.pi * Complex.I)

theorem flattening_sum (z : ℂ) (p q : ℤ) :
    (flattening z p q).1 + (flattening z p q).2.1 + (flattening z p q).2.2 = 0 := by
  simp only [flattening]
  ring

/-- Neumann's logarithmic wedge `ν[z; p, q] = w₀ ∧ w₁` on generators, in `⋀²_ℤ ℂ` (README 5.6). -/
def extendedDehnGen (z : ℂ) (p q : ℤ) : ⋀[ℤ]^2 ℂ :=
  exteriorPower.ιMulti ℤ 2 ![(flattening z p q).1, (flattening z p q).2.1]

/-- The extended Dehn map on the free abelian group on the cover. -/
def extendedDehn : FreeAbelianGroup (ℂ × ℤ × ℤ) →+ ⋀[ℤ]^2 ℂ :=
  FreeAbelianGroup.lift fun x => extendedDehnGen x.1 x.2.1 x.2.2

/-- The transfer element `[z; p, q] + [z; p′, q′] − [z; p, q′] − [z; p′, q]`. -/
def transferElement (z : ℂ) (p q p' q' : ℤ) : FreeAbelianGroup (ℂ × ℤ × ℤ) :=
  FreeAbelianGroup.of (z, p, q) + FreeAbelianGroup.of (z, p', q') -
    FreeAbelianGroup.of (z, p, q') - FreeAbelianGroup.of (z, p', q)

/-- The extended Dehn map kills the transfer relations. -/
theorem extendedDehn_transferElement (z : ℂ) (p q p' q' : ℤ) :
    extendedDehn (transferElement z p q p' q') = 0 := by
  sorry

end Shapes

/-! ## Layer 6: formal and analytic state integrals -/

section NeumannZagier

variable {N : ℕ}

/-- A Neumann–Zagier datum as linear algebra: integer matrices `A, B` with `ABᵀ` symmetric,
a parity vector `ν`, and shapes avoiding `0` and `1` that solve
`∏_j z_j^{A_ij} (1 − 1/z_j)^{B_ij} = (−1)^{ν_i}`. It is not asserted to come from a triangulation
(README 6.1). -/
structure NZDatum (N : ℕ) where
  A : Matrix (Fin N) (Fin N) ℤ
  B : Matrix (Fin N) (Fin N) ℤ
  ν : Fin N → ℤ
  z : Fin N → ℂ
  symm : A * Bᵀ = B * Aᵀ
  z_ne_zero : ∀ j, z j ≠ 0
  z_ne_one : ∀ j, z j ≠ 1
  gluing : ∀ i, ∏ j, z j ^ A i j * (1 - (z j)⁻¹) ^ B i j = (-1) ^ ν i

/-- The Hessian `Λ = −B⁻¹A + diag(1/(1 − z))`. -/
def NZDatum.hessian (d : NZDatum N) : Matrix (Fin N) (Fin N) ℂ :=
  -((d.B.map (Int.cast : ℤ → ℂ))⁻¹ * d.A.map (Int.cast : ℤ → ℂ)) +
    Matrix.diagonal fun j => 1 / (1 - d.z j)

/-- For invertible `B` the Hessian is symmetric. -/
theorem NZDatum.hessian_isSymm (d : NZDatum N) (hB : d.B.det ≠ 0) : d.hessian.IsSymm := by
  sorry

/-- For unimodular `B`, `I − B⁻¹A` is a symmetric integer matrix: the Nahm matrix (README 6.4). -/
theorem NZDatum.nahm_isSymm (d : NZDatum N) (hB : IsUnit d.B.det) :
    (1 - d.B⁻¹ * d.A).IsSymm := by
  sorry

/-- The one-variable datum `A = 0`, `B = 1`, `ν = 1`, `z = 1/2`: `1 − 2 = −1`. -/
def halfDatum : NZDatum 1 where
  A := 0
  B := 1
  ν := fun _ => 1
  z := fun _ => 1 / 2
  symm := by simp
  z_ne_zero := fun _ => by norm_num
  z_ne_one := fun _ => by norm_num
  gluing := fun i => by
    rw [Subsingleton.elim i 0]
    simp [Matrix.one_apply_eq]
    norm_num

/-- Its Hessian is `2`, a matrix computation that does not certify a manifold. -/
example : halfDatum.hessian = !![(2 : ℂ)] := by
  ext i j
  fin_cases i; fin_cases j
  simp [NZDatum.hessian, halfDatum]
  norm_num

/-- The finite cyclic product `D*_k(x) = ∏_{s=1}^{k−1} (1 − ζ^{−s} x)^s` (README 6.5). -/
def cyclicDilogStar (k : ℕ) (ζ x : ℂ) : ℂ :=
  ∏ s ∈ Finset.Ico 1 k, (1 - (ζ ^ s)⁻¹ * x) ^ s

example (ζ x : ℂ) : cyclicDilogStar 1 ζ x = 1 := by
  simp [cyclicDilogStar]

end NeumannZagier

section Faddeev

/-- The integrand `e^{−2izw}/(4 sinh(bw) sinh(w/b) w)` of Faddeev's quantum dilogarithm. -/
def faddeevIntegrand (b z w : ℂ) : ℂ :=
  Complex.exp (-2 * Complex.I * z * w) / (4 * Complex.sinh (b * w) * Complex.sinh (w / b) * w)

/-- The horizontal line `ℝ + iε` used for `b > 0`, with `ε = (π/2) min(b, 1/b)` below the first
poles `iπb` and `iπ/b` of the integrand and above `w = 0`. -/
def faddeevHeight (b : ℝ) : ℝ := Real.pi / 2 * min b b⁻¹

/-- Faddeev's quantum dilogarithm for `b > 0` on the strip `|Im z| < (b + b⁻¹)/2`, by its contour
integral passing above `w = 0` (README 6.9). Outside the strip the meromorphic continuation of
README 6.10 is meant; this formula is not. -/
def faddeevPhi (b : ℝ) (z : ℂ) : ℂ :=
  Complex.exp (∫ t : ℝ, faddeevIntegrand b z (t + faddeevHeight b * Complex.I))

/-- At `b = 1` the line is `Im w = π/2`, halfway to the first pole `iπ`. -/
example : faddeevHeight 1 = Real.pi / 2 := by
  simp [faddeevHeight]

/-- Self-duality `Φ_b = Φ_{1/b}`. -/
theorem faddeevPhi_inv (b : ℝ) (z : ℂ) : faddeevPhi b⁻¹ z = faddeevPhi b z := by
  sorry

/-- Positive charges of a charged tetrahedron: `a, c > 0` and `b = 1/2 − a − c > 0` (README 6.17). -/
def IsPositiveCharge (a c : ℝ) : Prop :=
  0 < a ∧ 0 < c ∧ 0 < 1 / 2 - a - c

/-- The regular tetrahedron has all three charges `1/6`. -/
example : IsPositiveCharge (1 / 6) (1 / 6) := by
  refine ⟨by norm_num, by norm_num, by norm_num⟩

/-- The level phase `exp(iπℓ/(4ℏ))` of the Andersen–Kashaev state integral (README 6.19). -/
def levelPhase (ℏ ℓ : ℝ) : ℂ :=
  Complex.exp (Real.pi * Complex.I * ℓ / (4 * ℏ))

example (ℏ : ℝ) : levelPhase ℏ 0 = 1 := by
  simp [levelPhase]

/-- A level shift by `8ℏ` does not change the phase. -/
theorem levelPhase_add_eight_mul (ℏ ℓ : ℝ) (hℏ : ℏ ≠ 0) :
    levelPhase ℏ (ℓ + 8 * ℏ) = levelPhase ℏ ℓ := by
  sorry

end Faddeev

/-! ## Layer 7: quantum modularity and the knot examples -/

section DenominatorCocycle

/-- The denominator cocycle `λ_γ(x) = c / (s (c r + d s))` for `x = r/s` in lowest terms, `s > 0`
(README 7.7). When `c r + d s = 0` the Lean value is `0`; that point is outside the domain. -/
def denominatorCocycle (γ : Matrix.SpecialLinearGroup (Fin 2) ℤ) (x : ℚ) : ℚ :=
  (γ 1 0 : ℚ) / (x.den * (γ 1 0 * x.num + γ 1 1 * x.den))

/-- The Möbius action of `SL(2, ℤ)` on rationals off the pole `cx + d = 0`. -/
def mobius (γ : Matrix.SpecialLinearGroup (Fin 2) ℤ) (x : ℚ) : ℚ :=
  (γ 0 0 * x + γ 0 1) / (γ 1 0 * x + γ 1 1)

/-- The cocycle relation `λ_{γγ′}(x) = λ_γ(γ′x) + λ_{γ′}(x)` where `γ′x` and `γγ′x` are finite. -/
theorem denominatorCocycle_mul (γ γ' : Matrix.SpecialLinearGroup (Fin 2) ℤ) (x : ℚ)
    (h₁ : (γ' 1 0 : ℚ) * x + γ' 1 1 ≠ 0) (h₂ : ((γ * γ') 1 0 : ℚ) * x + (γ * γ') 1 1 ≠ 0) :
    denominatorCocycle (γ * γ') x = denominatorCocycle γ (mobius γ' x) + denominatorCocycle γ' x := by
  sorry

/-- `S · 1 = −1`. -/
example : mobius ⟨!![0, -1; 1, 0], by simp [Matrix.det_fin_two]⟩ 1 = -1 := by
  simp [mobius]

/-- `γ` and `−γ` give the same value. -/
theorem denominatorCocycle_neg (γ : Matrix.SpecialLinearGroup (Fin 2) ℤ) (x : ℚ) :
    denominatorCocycle (-γ) x = denominatorCocycle γ x := by
  sorry

/-- `λ_T = 0` for `T = (1 1; 0 1)`. -/
example (x : ℚ) : denominatorCocycle ⟨!![1, 1; 0, 1], by simp [Matrix.det_fin_two]⟩ x = 0 := by
  simp [denominatorCocycle]

/-- `λ_S(1) = 1` for `S = (0 −1; 1 0)`. -/
example : denominatorCocycle ⟨!![0, -1; 1, 0], by simp [Matrix.det_fin_two]⟩ 1 = 1 := by
  simp [denominatorCocycle]

end DenominatorCocycle

section MatrixCocycle

variable {n : Type*} [Fintype n] [DecidableEq n]

/-- The conjugated automorphy factor `W_γ(x) = J(γx)⁻¹ j̃_γ(x) J(x)` of a knot matrix `J`
(README 7.13). -/
def knotMatrixCocycle (J : ℚ → Matrix n n ℂ)
    (jt : Matrix.SpecialLinearGroup (Fin 2) ℤ → ℚ → Matrix n n ℂ)
    (γ : Matrix.SpecialLinearGroup (Fin 2) ℤ) (x : ℚ) : Matrix n n ℂ :=
  (J (mobius γ x))⁻¹ * jt γ x * J x

/-- The ordered cocycle law at a point `x` with `γ′x` finite, given that `J(γ′x)` is invertible
and that `j̃` satisfies its cocycle law at `(γ, γ′, x)`. -/
theorem knotMatrixCocycle_mul (J : ℚ → Matrix n n ℂ)
    (jt : Matrix.SpecialLinearGroup (Fin 2) ℤ → ℚ → Matrix n n ℂ)
    (γ γ' : Matrix.SpecialLinearGroup (Fin 2) ℤ) (x : ℚ)
    (h₁ : (γ' 1 0 : ℚ) * x + γ' 1 1 ≠ 0)
    (hJ : IsUnit (J (mobius γ' x)).det)
    (hjt : jt (γ * γ') x = jt γ (mobius γ' x) * jt γ' x) :
    knotMatrixCocycle J jt (γ * γ') x =
      knotMatrixCocycle J jt γ (mobius γ' x) * knotMatrixCocycle J jt γ' x := by
  sorry

/-- With `J = 1` and `j̃ = 1` the cocycle is `1`. -/
example (γ : Matrix.SpecialLinearGroup (Fin 2) ℤ) (x : ℚ) :
    knotMatrixCocycle (n := Fin 2) (fun _ => 1) (fun _ _ => 1) γ x = 1 := by
  simp [knotMatrixCocycle]

end MatrixCocycle

section FigureEightDescendants

variable {R : Type*} [CommRing R]

/-- The truncation `Σ_{n<N} (q;q)_n (q⁻¹;q⁻¹)_n q^{mn}` of the figure-eight descendant `H_m`, at a
unit `q` of a commutative ring (README 7.15). At a root of unity of order `N` the full element
evaluates to this finite sum. -/
def figureEightDescendantTrunc (q : Rˣ) (m : ℤ) (N : ℕ) : R :=
  ∑ n ∈ range N,
    (∏ k ∈ range n, (1 - ((q ^ (k + 1) : Rˣ) : R)) * (1 - ((q ^ (k + 1))⁻¹ : Rˣ))) *
      ((q ^ (m * n) : Rˣ) : R)

/-- The truncated recurrence: `q^{m+1}H_{m+1} + (1 − 2q^m)H_m + q^{m−1}H_{m−1} − 1` lies in the
ideal generated by `(q;q)_N`. -/
theorem figureEightDescendantTrunc_recurrence (q : Rˣ) (m : ℤ) (N : ℕ) :
    ∃ r : R,
      ((q ^ (m + 1) : Rˣ) : R) * figureEightDescendantTrunc q (m + 1) N +
          (1 - 2 * ((q ^ m : Rˣ) : R)) * figureEightDescendantTrunc q m N +
          ((q ^ (m - 1) : Rˣ) : R) * figureEightDescendantTrunc q (m - 1) N - 1 =
        (∏ k ∈ range N, (1 - ((q ^ (k + 1) : Rˣ) : R))) * r := by
  sorry

/-- At `q = −1` (order two) the value is `1 + 4(−1)^m`; for `m = 0` it is `5 = ⟨4₁⟩₂`. -/
example : figureEightDescendantTrunc (-1 : ℤˣ) 0 2 = 5 := by
  simp [figureEightDescendantTrunc, Finset.sum_range_succ]

example : figureEightDescendantTrunc (-1 : ℤˣ) 1 2 = -3 := by
  simp [figureEightDescendantTrunc, Finset.sum_range_succ]

end FigureEightDescendants

/-
Statements not typed at the pins (their carriers are absent; the README states them):

* Layer 0: `linkingNumber`, `linkingMatrix` and `surgery` of a framed link, `homology_surgery`,
  `isIntegralHomologySphere_iff`, `IsKirbyMove`, `IsFennRourkeMove`, `kirbyEquiv`, `kirby_theorem`,
  `kirbyEquiv_iff_fennRourke`, `exists_surgery_presentation`, `IsHosteMove`, `hosteEquiv`, the
  admissible band-slide theorem, the refined Kirby calculus and the existence of admissible
  presentations (no framed link type or surgery manifold at the pins).
* Layer 1: `TopologicalRibbonHopfAlgebra`, `ZeroConvergent`, `Uq`, `Uqev`, `basis_Uq`, the
  completions, `universalR`, `ribbonElement`, the module categories, `BottomTangle`, `closure`,
  `RTFunctor`, `J` and `universalInvariant`, `CoreSubalgebra`, `claspForm`, `twistForm`,
  `DrinfeldJimboDatum`, `DrinfeldJimboAlgebra`, `quantumPBWBasis`, `weightedPBWCore`,
  `integralQuantumCore`, `TiltingModule`, `IsNegligibleMorphism`, `TiltingSemisimplification`
  (no completed tensor products over `ℂ⟦h⟧` and no quantum group at the pins).
* Layer 2: `sl2Color`, `quantumTrace`, `colouredJones`, `reducedJones`, `P_prime`, `P_doublePrime`,
  `P_tildePrime`, `quantumCasimir`, `evenCenterExpansion`, `algebraP` and its completion,
  `cyclotomicTruncation`, `unifiedKashaevInvariant`, `kashaevInvariant`, `kashaevFunction`, and the
  integrality, duality and expansion theorems (they need Layer 1 and the Habiro ring).
* Layer 3: `omega`, the twisting theorem, `unifiedInvariantOfPresentation`, its independence,
  divisibility, multiplicativity and orientation reversal.
* Layer 4: `wrtWithLift`, `wrt`, the evaluation, integrality, Galois and determination theorems,
  the Ohtsuki series and characterisation, `QuantumParityGroup`, `generalIntegralKn`,
  `highestWeightColor`, `StrongKirbyColor`, the general WRT comparison and the general Lie type
  unified invariant.
* Layer 5: `IdealTetrahedron`, `IdealTriangulation`, `IsCompleteHyperbolic`, `gluing_theorem`,
  `mostow_prasad`, `epstein_penner`, `edgeEquation`, `cuspEquation`, `LiftedFiveTerm`,
  `extendedPreBloch`, `extendedBloch`, `StrongFlattening`, `blochElement`, `extendedRogers` (no
  dilogarithm in Mathlib) and the volume and Chern–Simons theorem.
* Layer 6: `NZVertexSeries`, `formalNZStateIntegral` and its invariance (formal Gaussian bracket
  from HabiroNahmSeries), the Habiro-module comparison, the root-refined weights and series,
  `faddeevPhi_divisor` and the functional equations, `positionOp`, `momentumOp`, `sumOp`, the
  operator pentagon, `analyticStateIntegral`, `schwartz_kernel_theorem`, `wavefrontSet`,
  `contract`, `chargedPsi`, `chargedTetrahedronKernel`, the charged pentagon, `akStateIntegral`
  and its invariance.
* Layer 7: `KnotPerturbativeFamily`, the quantum modularity conjectures, the volume conjecture,
  the quadratic relations, the coefficient asymptotics, the matrix refinements, the analytic
  extension of the cocycle, the Bettin–Drappeau theorem and the comparison conjecture of
  Andersen–Kashaev.
-/

end TauCetiRoadmap.ArithmeticQuantumTopology
