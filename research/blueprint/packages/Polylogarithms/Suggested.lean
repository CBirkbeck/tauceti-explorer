import Mathlib

/-!
# Polylogarithms: representative target signatures

The roadmap is README.md. This file records light definitions and milestone signatures on
the pinned APIs and is not exhaustive. The classical and single-valued polylogarithms and the
Bloch–Wigner function belong to the roadmap PolylogarithmFunctions; they are restated below by
their defining formulas so that the regulator statements typecheck at the pins. Rational cycles
are tested by their universal relations, without constructing a second Bloch-group carrier.
Determinants use selected archimedean embeddings and the discriminant normalization of the
README. The weight-four theorem for the explicit cycles defined here is proved in
Polylogarithms, Part II, and is not stated in this file.
-/

namespace TauCetiRoadmap.Polylogarithms

open scoped Classical TensorProduct BigOperators
open NumberField

universe u

/-! ## The single-valued polylogarithms of PolylogarithmFunctions -/

/-- The natural-index classical polylogarithm `Liₙ`, with the lower boundary value on the cut.
This is PolylogarithmFunctions' function, with its API and Checks there; an implementation uses
that declaration. -/
noncomputable def polylog (n : ℕ) (z : ℂ) : ℂ :=
  if n = 0 then z / (1 - z)
  else if n = 1 then -Complex.log (1 - z)
  else (1 / ((n - 2).factorial : ℂ)) *
    ∫ t : ℝ in (0 : ℝ)..1,
      ((-Real.log t) ^ (n - 2) : ℝ) * (-Complex.log (1 - (t : ℂ) * z)) / (t : ℂ)

/-- Zagier's Bernoulli combination `Lₙ`, using `bernoulli 1 = -1/2`, for `n ≥ 2`; the
PolylogarithmFunctions function restated by its formula. -/
noncomputable def singleValued (n : ℕ) (z : ℂ) : ℝ :=
  let s : ℂ := ∑ k ∈ Finset.range n,
    ((2 : ℂ) ^ k * (bernoulli k : ℂ) / (k.factorial : ℂ)) *
      polylog (n - k) z * (Real.log ‖z‖ : ℂ) ^ k
  if Odd n then s.re else s.im

/-- The Bloch–Wigner function `D = L₂`, restated from PolylogarithmFunctions; the logarithmic
term vanishes at `z = 0` by totalization. -/
noncomputable def blochWigner (z : ℂ) : ℝ :=
  (polylog 2 z).im + Complex.arg (1 - z) * Real.log ‖z‖

/-! ## Explicit symbols, cycles and determinants -/

/-- The rationalized unit vector; zero has no unit and is assigned the zero vector. -/
noncomputable def unitVector {F : Type u} [Field F] (x : F) :
    ℚ ⊗[ℤ] Additive Fˣ :=
  if h : x = 0 then 0 else
    (1 : ℚ) ⊗ₜ[ℤ] Additive.ofMul (Units.mk0 x h)

/-- Functions satisfying precisely the normalized rational five-term presentation. -/
def FiveTermFunction {F : Type u} [Field F] {V : Type u}
    [AddCommGroup V] [Module ℚ V] (b : F → V) : Prop :=
  b 0 = 0 ∧ b 1 = 0 ∧ ∀ x y : F,
    x ≠ 0 → x ≠ 1 → y ≠ 0 → y ≠ 1 → x ≠ y →
    b x - b y + b (y / x) - b ((1 - x⁻¹) / (1 - y⁻¹)) +
      b ((1 - x) / (1 - y)) = 0

/-- One cyclic block of the coordinate 22-term trilogarithm relation. -/
def trilogCyclic {F : Type u} [Field F] {V : Type u} [AddCommGroup V]
    (b : F → V) (a c d : F) : V :=
  let A := d * a - a + 1
  let B := c * d - d + 1
  b A + b (A / (d * a)) + b d + b (B / (A * c)) - b (A / d) +
    b (-B * a / A) - b (B / (A * c * d)) - b 1

/-- Functions on the explicit rational weight-three presentation, including the endpoint 0. -/
def TrilogRelationFunction {F : Type u} [Field F] {V : Type u}
    [AddCommGroup V] [Module ℚ V] (b : F → V) : Prop :=
  b 0 = 0 ∧
  (∀ x : F, x ≠ 0 → b x = b x⁻¹) ∧
  (∀ x : F, x ≠ 0 → b x + b (1 - x) + b (1 - x⁻¹) = b 1) ∧
  ∀ a c d : F, a ≠ 0 → c ≠ 0 → d ≠ 0 →
    d * a - a + 1 ≠ 0 → a * c - c + 1 ≠ 0 → c * d - d + 1 ≠ 0 →
    trilogCyclic b a c d + trilogCyclic b c d a + trilogCyclic b d a c +
      b (-a * c * d) = 0

/-- A weight-three cycle is a rational symbol sum whose cobracket vanishes against every
five-term function. This is a predicate on native carriers, equivalent to δ₃c = 0. -/
def IsCycle3 {F : Type u} [Field F] (c : F →₀ ℚ) : Prop :=
  ∀ (V : Type u) [AddCommGroup V] [Module ℚ V] (b : F → V),
    FiveTermFunction b →
      c.sum (fun x a => a • (b x ⊗ₜ[ℚ] unitVector x)) = 0

/-- An explicit raw weight-four cycle: a rational symbol sum whose image `Σ aₓ [x]₃ ⊗ u(x)`
vanishes in the explicit weight-three group tensor the units, tested against every function on
the explicit weight-three presentation without constructing that quotient. -/
def IsCycle4 {F : Type u} [Field F] (c : F →₀ ℚ) : Prop :=
  ∀ (V : Type u) [AddCommGroup V] [Module ℚ V] (b : F → V),
    TrilogRelationFunction b →
      c.sum (fun x a => a • (b x ⊗ₜ[ℚ] unitVector x)) = 0

/-- The period matrix has embeddings as rows and symbol families as columns. -/
noncomputable def periodMatrix {F : Type u} [Field F] {ι : Type*}
    (n : ℕ) (σ : ι → F →+* ℂ) (c : ι → F →₀ ℚ) : Matrix ι ι ℝ :=
  fun i j => (c j).sum (fun x a => (a : ℝ) * singleValued n (σ i x))

/-- π^(n([F:Q]−d)) / √|disc F| times the d by d polylogarithmic determinant. -/
noncomputable def normalizedPeriod {F : Type u} [Field F] [NumberField F]
    {ι : Type*} [Fintype ι] [DecidableEq ι]
    (n : ℕ) (σ : ι → F →+* ℂ) (c : ι → F →₀ ℚ) : ℝ :=
  Real.pi ^ (n * (Module.finrank ℚ F - Fintype.card ι)) /
    Real.sqrt |(NumberField.discr F : ℝ)| * (periodMatrix n σ c).det

/-! ## Headline theorem -/

/-- Weight-three Zagier existence, including the actual rational cycle condition.
Goncharov, Advances 1995, Theorem 1.1; the row equivalence selects every infinite place. -/
theorem zagier_three_exists (F : Type u) [Field F] [NumberField F]
    (e : Fin (InfinitePlace.nrRealPlaces F + InfinitePlace.nrComplexPlaces F) ≃
      InfinitePlace F) :
    ∃ c : Fin (InfinitePlace.nrRealPlaces F + InfinitePlace.nrComplexPlaces F) → F →₀ ℚ,
      (∀ j, IsCycle3 (c j)) ∧ ∃ q : ℚ, q ≠ 0 ∧
        normalizedPeriod 3 (fun i => (e i).embedding) c =
          (q : ℝ) * (NumberField.dedekindZeta F 3).re := by
  sorry

/-! ## Layer 2: volume and certified evaluation -/

/-- Lobachevsky's π-periodic function, defined by its convergent logarithmic integral. -/
noncomputable def lobachevsky (θ : ℝ) : ℝ :=
  -∫ t : ℝ in (0 : ℝ)..θ, Real.log |2 * Real.sin t|

/-- The analytic angle formula, before its identification with a geometric volume. -/
theorem blochWigner_lobachevsky (z : ℂ) (hz : 0 < z.im) :
    blochWigner z = lobachevsky (Complex.arg z) +
      lobachevsky (Complex.arg (1 / (1 - z))) +
      lobachevsky (Complex.arg (1 - z⁻¹)) := by
  sorry

/-- The truncated unit-circle Fourier series. -/
noncomputable def circlePartial (N : ℕ) (w : ℂ) : ℝ :=
  ∑ k ∈ Finset.range N, (w ^ (k + 1)).im / ((k + 1 : ℕ) : ℝ) ^ 2

/-- A tail bound uniform on the entire unit circle, including w = 1. -/
theorem circlePartial_error (N : ℕ) (hN : 0 < N) (w : ℂ) (hw : ‖w‖ = 1) :
    |blochWigner w - circlePartial N w| ≤ 1 / (N : ℝ) := by
  sorry

/-- Reduction to three unit-circle points, with all denominators protected. -/
theorem blochWigner_kummer (z : ℂ) (hz0 : z ≠ 0) (hz1 : z ≠ 1) :
    blochWigner z = (1 / 2 : ℝ) *
      (blochWigner (z / star z) +
       blochWigner ((1 - star z) / (1 - z)) +
       blochWigner ((1 - z⁻¹) / star (1 - z⁻¹))) := by
  sorry

example : lobachevsky 0 = 0 := by
  simp [lobachevsky]

example : circlePartial 3 Complex.I = 8 / 9 := by
  norm_num [circlePartial, Finset.sum_range_succ, Complex.I_sq, pow_succ]

/-! ## Layer 3: explicit trilogarithmic cycles -/

/-- The determinant cross-ratio on five ordered vectors; genericity is required by its API. -/
noncomputable def projectedCrossRatio {F : Type*} [Field F]
    (v : Fin 5 → Fin 3 → F) : F :=
  let d (i j k : Fin 5) := Matrix.det (Matrix.of ![v i, v j, v k])
  d 0 1 3 * d 0 2 4 / (d 0 1 4 * d 0 2 3)

/-- The raw triple ratio on six ordered vectors, before its alternating symbol sum. -/
noncomputable def tripleRatio {F : Type*} [Field F]
    (v : Fin 6 → Fin 3 → F) : F :=
  let d (i j k : Fin 6) := Matrix.det (Matrix.of ![v i, v j, v k])
  d 0 1 3 * d 1 2 4 * d 0 2 5 / (d 0 1 4 * d 1 2 5 * d 0 2 3)

/-- G95's triangle parameter for the order (x₁,x₂,x₃,y₁,y₂,y₃).
Its four determinants must be nonzero in the geometric API. -/
noncomputable def triangleParameter {F : Type*} [Field F]
    (v : Fin 6 → Fin 3 → F) : F :=
  let d (i j k : Fin 6) := Matrix.det (Matrix.of ![v i, v j, v k])
  d 5 0 4 * d 5 1 3 / (d 5 0 3 * d 5 1 4)

example : triangleParameter (fun i : Fin 6 =>
    match i.val with
    | 0 => (![0,1,0] : Fin 3 → ℚ)
    | 1 => ![1,0,0]
    | 2 => ![0,0,1]
    | 3 => ![1,1,0]
    | 4 => ![1,0,1]
    | _ => ![0,1,-2]) = 2 := by
  norm_num [triangleParameter, Matrix.det_fin_three, Matrix.of_apply,
    Matrix.cons_val_two, Matrix.vecHead, Matrix.vecTail]

example : triangleParameter (fun i : Fin 6 =>
    match i.val with
    | 0 => (![0,1,0] : Fin 3 → ℚ)
    | 1 => ![1,0,0]
    | 2 => ![0,0,1]
    | 3 => ![1,1,0]
    | 4 => ![1,0,1]
    | _ => ![0,1,-1]) = 1 := by
  norm_num [triangleParameter, Matrix.det_fin_three, Matrix.of_apply,
    Matrix.cons_val_two, Matrix.vecHead, Matrix.vecTail]

example : projectedCrossRatio
    (![![1,1,1], ![1,2,4], ![1,3,9], ![1,5,25], ![1,7,49]] :
      Fin 5 → Fin 3 → ℚ) = 6 / 5 := by
  simp only [projectedCrossRatio]
  simp only [Matrix.det_fin_three, Matrix.of_apply]
  norm_num [Matrix.cons_val_two, Matrix.cons_val_three, Matrix.cons_val_four,
    Matrix.vecHead, Matrix.vecTail]

example : projectedCrossRatio
    (![![1,1,1], ![1,2,4], ![1,3,9], ![1,7,49], ![1,5,25]] :
      Fin 5 → Fin 3 → ℚ) = 5 / 6 := by
  simp only [projectedCrossRatio]
  simp only [Matrix.det_fin_three, Matrix.of_apply]
  norm_num [Matrix.cons_val_two, Matrix.cons_val_three, Matrix.cons_val_four,
    Matrix.vecHead, Matrix.vecTail]

example : tripleRatio (fun i : Fin 6 =>
    match i.val with
    | 0 => (![1,1,1] : Fin 3 → ℚ)
    | 1 => ![1,2,4]
    | 2 => ![1,3,9]
    | 3 => ![1,5,25]
    | 4 => ![1,7,49]
    | _ => ![1,11,121]) = 10 / 9 := by
  norm_num [tripleRatio, Matrix.det_fin_three, Matrix.of_apply, Matrix.cons_val_two,
    Matrix.vecHead, Matrix.vecTail]

example : tripleRatio (fun i : Fin 6 =>
    match i.val with
    | 0 => (![1,0,0] : Fin 3 → ℚ)
    | 1 => ![0,1,0]
    | 2 => ![0,0,1]
    | 3 => ![1,1,1]
    | 4 => ![1,2,3]
    | _ => ![1,3,2]) = 1 := by
  norm_num [tripleRatio, Matrix.det_fin_three, Matrix.of_apply, Matrix.cons_val_two,
    Matrix.vecHead, Matrix.vecTail]

/-- The real single-valued trilogarithm satisfies the explicit weight-three presentation,
including the endpoint form of the three-term relation; it therefore descends to the explicit
group. -/
theorem singleValued_three_relations :
    TrilogRelationFunction (singleValued 3) := by
  sorry

example {F : Type u} [Field F] : unitVector (0 : F) = 0 := by
  simp [unitVector]

example {F : Type u} [Field F] : unitVector (1 : F) = 0 := by
  simp [unitVector, Units.mk0_one]

example : FiveTermFunction (fun _ : ℚ => (0 : ℚ)) := by
  simp [FiveTermFunction]

example : trilogCyclic (fun x : ℚ => x) 1 1 1 = 0 := by
  norm_num [trilogCyclic]

example : ¬TrilogRelationFunction (fun x : ℚ => x) := by
  intro h
  have hi := h.2.1 2 (by norm_num)
  norm_num at hi

example {F : Type u} [Field F] : IsCycle3 (Finsupp.single (1 : F) (1 : ℚ)) := by
  intro V _ _ b hb
  simp [Finsupp.sum_single_index, hb.2.1]

example {F : Type u} [Field F] : IsCycle4 (Finsupp.single (1 : F) (1 : ℚ)) := by
  intro V _ _ b _
  simp [Finsupp.sum_single_index, unitVector]

example : IsCycle4 (Finsupp.single (2 : ℚ) (1 : ℚ) + Finsupp.single (2⁻¹ : ℚ) 1) := by
  intro V _ _ b hb
  have hinv : b 2 = b 2⁻¹ := hb.2.1 2 (by norm_num)
  have hunit : Units.mk0 (2⁻¹ : ℚ) (by norm_num) = (Units.mk0 (2 : ℚ) (by norm_num))⁻¹ := by
    ext; simp
  have hu : unitVector (2⁻¹ : ℚ) = -unitVector (2 : ℚ) := by
    simp [unitVector, hunit, TensorProduct.tmul_neg]
  rw [Finsupp.sum_add_index' (by simp) (by intros; simp [add_smul])]
  simp [Finsupp.sum_single_index, ← hinv, hu, TensorProduct.tmul_neg]

/-! ## Layer 4: determinants, explicit cycles and lifting -/

/-- For a presentation square, a cycle lifts precisely when its boundary can be
cancelled by an element of the presentation kernel. This does not assume kernel surjectivity. -/
theorem cycleLift_iff {C D E J : Type*}
    [AddCommGroup C] [Module ℚ C] [AddCommGroup D] [Module ℚ D]
    [AddCommGroup E] [Module ℚ E] [AddCommGroup J] [Module ℚ J]
    (p : C →ₗ[ℚ] D) (a : C →ₗ[ℚ] E) (b : D →ₗ[ℚ] J) (q : E →ₗ[ℚ] J)
    (hsquare : q.comp a = b.comp p) (y : D) (hy : b y = 0)
    (x : C) (hx : p x = y) :
    (∃ z : C, p z = y ∧ a z = 0) ↔ ∃ k : C, p k = 0 ∧ a k = a x := by
  sorry

/-- If the comparison map on the target of the first differentials is injective, every
inductive cycle comes from an explicit one. In weight three it is the identification of the
two presentations of `B₂` tensored with the units, so every inductive weight-three cycle lifts. -/
theorem cycleLift_of_injective {C D E J : Type*}
    [AddCommGroup C] [Module ℚ C] [AddCommGroup D] [Module ℚ D]
    [AddCommGroup E] [Module ℚ E] [AddCommGroup J] [Module ℚ J]
    (p : C →ₗ[ℚ] D) (a : C →ₗ[ℚ] E) (b : D →ₗ[ℚ] J) (q : E →ₗ[ℚ] J)
    (hsquare : q.comp a = b.comp p) (hp : Function.Surjective p)
    (hq : Function.Injective q) (y : D) (hy : b y = 0) :
    ∃ x : C, p x = y ∧ a x = 0 := by
  sorry

/-- Even weights use no rows over a totally real field; the determinant is 1, not 0. -/
theorem normalizedPeriod_empty (F : Type u) [Field F] [NumberField F]
    (σ : Fin 0 → F →+* ℂ) (c : Fin 0 → F →₀ ℚ) (n : ℕ) :
    normalizedPeriod n σ c =
      Real.pi ^ (n * Module.finrank ℚ F) / Real.sqrt |(NumberField.discr F : ℝ)| := by
  sorry

example : periodMatrix 3 (fun _ : Fin 1 => (Rat.castHom ℂ))
    (fun _ => Finsupp.single (1 : ℚ) (2 : ℚ)) 0 0 = 2 * singleValued 3 1 := by
  simp [periodMatrix]

example (σ : Fin 0 → ℚ →+* ℂ) (c : Fin 0 → ℚ →₀ ℚ) :
    normalizedPeriod 4 σ c = Real.pi ^ 4 := by
  norm_num [normalizedPeriod, NumberField.discr_rat]

/-- Over a totally real field an even weight has no rows, and the empty determinant is a
nonzero rational multiple of `ζ_F(n)`: Borel's even-weight rationality, through
BorelRegulators. -/
theorem zagierExistence_totallyRealEven (F : Type u) [Field F] [NumberField F]
    [NumberField.IsTotallyReal F] (n : ℕ) (hn : 2 ≤ n) (heven : Even n)
    (σ : Fin 0 → F →+* ℂ) (c : Fin 0 → F →₀ ℚ) :
    ∃ q : ℚ, q ≠ 0 ∧
      normalizedPeriod n σ c = (q : ℝ) * (NumberField.dedekindZeta F n).re := by
  sorry

/-! ## Layer 5: curve regulator formulas -/

/-- The point-cycle family t ↦ [t]+[-t], retaining integral multiplicities at collision. -/
noncomputable def collidingPointCycle {F : Type*} [Field F] (t : F) : F →₀ ℕ :=
  Finsupp.single t 1 + Finsupp.single (-t) 1

example : collidingPointCycle (0 : ℚ) = Finsupp.single 0 2 := by
  simp [collidingPointCycle, ← Finsupp.single_add]

example : collidingPointCycle (1 : ℚ) 1 = 1 := by
  norm_num [collidingPointCycle]

/-- Evaluation of the real curve-regulator one-form on a tangent vector, from its jets. -/
noncomputable def etaJet (f g df dg : ℂ) : ℝ :=
  Real.log ‖f‖ * (dg / g).im - Real.log ‖g‖ * (df / f).im

/-- Steinberg symbols map to exact Bloch–Wigner forms. -/
theorem etaJet_steinberg (z : ℂ) (hz0 : z ≠ 0) (hz1 : z ≠ 1) (v : ℂ) :
    etaJet z (1 - z) v (-v) = fderiv ℝ blochWigner z v := by
  sorry

example : etaJet 1 1 0 0 = 0 := by
  simp [etaJet]

example : etaJet 2 Complex.I 0 (-1) = Real.log 2 := by
  norm_num [etaJet, Complex.norm_def]

/-! ## Layer 6: differential and regulator diagnostics -/

/-- The exact real derivative, including the radial logarithmic correction. -/
theorem singleValued_three_differential (z : ℂ) (hz0 : z ≠ 0) (hz1 : z ≠ 1) :
    DifferentiableAt ℝ (singleValued 3) z ∧ ∀ v : ℂ,
      fderiv ℝ (singleValued 3) z v =
        -blochWigner z * (v / z).im + (Real.log ‖z‖ / 3) *
          (Real.log ‖1 - z‖ * (v / z).re -
            Real.log ‖z‖ * (v / (z - 1)).re) := by
  sorry

/-- A concrete negative control for dropping the radial logarithmic correction. -/
theorem singleValued_three_derivative_half (v : ℂ) :
    fderiv ℝ (singleValued 3) (1 / 2 : ℂ) v =
      (4 / 3 : ℝ) * (Real.log 2) ^ 2 * v.re := by
  sorry

/-
README targets whose carriers require further construction:
Bloch–Wigner descent, embedding regulators and the Borel comparison; the upper-half-space
metric adapter, ideal regions, compact truncations, cusp estimates and ideal tetrahedron volume;
rational unit-circle arithmetic certificates; explicit Bloch groups and geometric trilogarithm
presentations, with the quotient forms isCycle3_iff_delta_eq_zero and
isCycle4_iff_mem_explicitRawCycleFour of the cycle predicates; the Bigrassmannian, Gale
duality and its signed configuration maps; stableK_hurewiczPrimitive and rankFiltrationK,
primitive K-theory comparisons, transfers and regulator-image containment; weight-two rational-function rigidity and the explicit-to-inductive
comparison; inductive higher Bloch groups, specialization and their complexes;
the three distinct Zagier assertions, the explicit raw weight-four cycles and their inductive
classes, the cycle obstruction and the weight-three lift; weight-four polynomial residues and
the stated homotopy conjecture; compact test-form LF topology, currents, LF and normalization
adapters for cycle integrals; relative Chow families with arbitrary Noetherian
characteristic-zero base change, tautological multiplicity-bearing incidence cycles and their
faces, logarithmic Green forms; logarithmic r and Wang forms, normal-variety residues and
current identities; Deligne and support complexes, cubical/simplicial/mixed regulators and the
universalRegulator_supportCone and the universal Beilinson comparison; Chow parameter forms
via resolved smooth test families and Arakelov cones; curve complexes, Chow dilogarithms and reciprocity homotopies; weight-three
curve Chern comparison, generalized elliptic trilogarithms and their Fourier pairing; the
completed-unit Leopoldt adapter and the full p-adic embedding regulator matrix; the
trilogarithm derivative values singleValued_three_derivative_two and
singleValued_three_derivative_negOne, and the endpoint statement
singleValued_three_derivative_one.
-/

end TauCetiRoadmap.Polylogarithms
