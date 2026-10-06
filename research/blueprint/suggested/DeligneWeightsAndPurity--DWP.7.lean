/-
Suggested Lean prototypes for the roadmap "Deligne weights, purity and the Weil bounds"
(DeligneWeightsAndPurity), part DWP.7 (stages DWP.7, DWP.8 and DWP.9).

This file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/DeligneWeightsAndPurity--DWP.7.md` is definitive. The statements
below suggest Lean forms so that contributors and reviewers converge on names and signatures.
Every proof is `sorry`; nothing here is claimed to be formalised (implementationStatus =
unchecked). Pins: Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174, Tau Ceti
f790474821cf4256814db967cb154e7af3d0c369. Only Mathlib is imported.

Names agree with the `api` and `tests` names of the packet
`research/blueprint/packets/DeligneWeightsAndPurity--DWP.7.json`. Unit tests are `example`s
whose docstring begins "Test `<name>`".

What is typed here. The pinned libraries have no constructible ℓ-adic sheaves, no Weil sheaves,
no bounded constructible derived category with Rf_!, f^! and Verdier duality, and no étale
cohomology with Frobenius action (EtaleDualityAndPerverseSheaves EDC.0–EDC.4 and
SchemeAndStackFoundations SF.2 plan them). So the file types only the parts whose carriers
exist: the Frobenius-module (stalk, or Spec 𝔽_q) form of integral sheaves; the p-adic couples of
Weil II (3.3.7) on Mathlib's additive valuations; geometric semisimplicity of a representation
of a Weil group restricted to a subgroup; Lemma (4.1.4) on invariant forms; evenness of the rank
of a nondegenerate alternating form; and the primitive decomposition of a graded operator with
the hard Lefschetz property. No sheaf, complex or cohomology group is replaced by a stand-in.

The following packet declarations need those carriers and are therefore not typed here; their
mathematical statements are in the packet and the reader.

DWP.7 (namespace TauCeti.Weights):
  IsIntegralSheaf, IsIntegralSheaf.comap, IsIntegralSheaf.finite_pushforward,
  IsIntegralSheaf.twist_neg, IsIntegralSheaf.weights_nonneg, IsIntegralSheaf.constant;
  the theorem nodes weights-mixed-sheaves-definitions, devissage-in-the-sheaf-and-the-source,
  devissage-in-the-target, tame-cover-of-a-lisse-sheaf-on-a-curve,
  spreading-out-to-a-tame-relative-curve, purity-of-the-relative-curve-case,
  fundamental-direct-image-theorem-3-3-1, iota-mixed-direct-image-3-3-10,
  deligne-integrality-theorem-sga7-xxi, integral-weight-bounds-3-3-3,
  cohomological-bounds-3-3-2-3-3-6, valuation-triangles-3-3-8,
  hodge-type-triangles-and-proper-smooth-purity-3-3-7-3-3-11.
DWP.8 (namespace TauCeti.Weights):
  IsMixedComplex, HasWeightsLE, HasIotaWeightsLE, isMixedComplex_triangle,
  HasWeightsLE.of_triangle, hasWeightsLE_shift, hasWeightsLE_twist, HasWeightsLE.mono,
  hasWeightsLE_sheaf_iff, hasWeightsLE_iff_eigenvalues, hasWeightsLE_baseExtension,
  HasWeightsLE.isIotaWeightsLE and the tests hasWeightsLE_const_shift_neg,
  hasWeightsLE_const_shift_pos, hasWeightsLE_tate_shift, hasWeightsLE_zero,
  not_isMixedComplex_transcendental, hasWeightsLE_point_iff;
  HasWeightsGE, IsPureComplex, hasWeightsGE_dual, IsPureComplex.dual, HasWeightsGE.of_triangle,
  IsPureComplex.of_triangle, hasWeightsGE_shift_twist, hasWeightsGE_iff_rhom_smooth,
  isPureComplex_iff_lisse, IsPureComplex.directSum and the tests isPureComplex_const_smooth,
  isPureComplex_point_iff, not_isPureComplex_nodal, not_isPureComplex_extensionByZero,
  isPureComplex_zero;
  IsMixedGalois, isMixedGalois_of_unramified, isMixedGalois_iff_filtration,
  isMixedGalois_changeOfTrait, IsMixedGalois.subquotient, IsMixedGalois.tensor,
  IsMixedGalois.invariants and the tests isMixedGalois_trivial, isMixedGalois_tate_curve,
  isMixedGalois_quadratic_twist, isMixedGalois_zero, not_isMixedGalois_transcendental;
  weightClass, weightClass_isInternal, weightClass_stalk, weightClass_map, weightClass_unique,
  weightClass_eq_twist, weightClass_of_integer, weightClass_tensor and the tests
  weightClass_fractional, weightClass_integral, weightClass_depends_on_iota, weightClass_zero,
  weightClass_point;
  weightFiltration, weightFiltration_gr_pure, weightFiltration_unique, weightFiltration_stalk,
  weightFiltration_map, weightFiltration_strict, weightFiltration_tensor, weightFiltration_dual,
  weightFiltration_pullback, weightFiltration_twist, weightFiltration_indep_iota and the tests
  weightFiltration_kummer, weightFiltration_pure, weightFiltration_not_split,
  weightFiltration_point, weightFiltration_strict_example;
  isGeometricallySemisimple_iff_restrict_open, isGeometricallySemisimple_baseExtension,
  IsGeometricallySemisimple.subquotient, IsGeometricallySemisimple.dual,
  maximalGeometricallySemisimpleSubsheaf, isGeometricallySemisimple_iff_reductive (sheaf level);
  ArithmeticModel, PotentiallyHas, PotentiallyHas.mono, ArithmeticModel.restrict,
  PotentiallyHas.pullback, PotentiallyHas.directSum, potentially_baseChange_algClosed and the
  tests potentiallyPure_const_smooth, potentially_of_finite_field, not_potentiallyPure_kummer,
  potentially_zero;
  and every DWP.8 theorem node.
DWP.9 (namespace TauCeti.HardLefschetz):
  lefschetzOperator, lefschetzOperator_pow, lefschetzOperator_smul,
  lefschetzOperator_comm_pullback, lefschetzOperator_galois,
  lefschetzOperator_eq_gysin_restrict, lefschetzOperator_selfAdjoint, lefschetzOperator_pow_top,
  primitivePart, lefschetzPairing, lefschetzPairing_symm and the tests
  lefschetzOperator_projectiveSpace, lefschetzOperator_trivial_bundle,
  lefschetzOperator_degree_zero, lefschetzOperator_point, lefschetzPairing_curve;
  and the theorem nodes hyperplane-factorisation-4-1-2,
  arithmetic-model-of-a-polarised-smooth-projective-variety,
  global-invariant-cycles-for-smooth-hyperplane-sections-4-1-3, hard-lefschetz-4-1-1,
  primitive-decomposition-and-lefschetz-pairings, odd-betti-numbers-are-even-4-1-5,
  hard-lefschetz-for-potentially-pure-complexes-6-2-13, hard-lefschetz-for-pure-lisse-sheaves,
  orthogonal-decomposition-of-a-hyperplane-section-4-3-9.
-/

import Mathlib.RepresentationTheory.Basic
import Mathlib.RepresentationTheory.Invariants
import Mathlib.RingTheory.SimpleModule.Basic
import Mathlib.LinearAlgebra.BilinearForm.Orthogonal
import Mathlib.LinearAlgebra.BilinearForm.Hom
import Mathlib.LinearAlgebra.Charpoly.Basic
import Mathlib.LinearAlgebra.Matrix.ToLin
import Mathlib.LinearAlgebra.TensorProduct.Map
import Mathlib.LinearAlgebra.Quotient.Basic
import Mathlib.LinearAlgebra.Dimension.Finrank
import Mathlib.FieldTheory.IsAlgClosed.AlgebraicClosure
import Mathlib.RingTheory.Valuation.Basic
import Mathlib.RingTheory.IntegralClosure.IsIntegral.Basic
import Mathlib.Algebra.DirectSum.Module
import Mathlib.Order.SupIndep

open Polynomial

noncomputable section

namespace TauCeti.Weights

/-! ## Integral Frobenius modules (`DeligneWeightsAndPurity:DWP.7/integral-sheaf`)

A sheaf on a scheme of finite type over `ℤ[1/ℓ]` is integral when every Frobenius element at
every closed point acts on the stalk with algebraic-integer eigenvalues; on `Spec 𝔽_q` a sheaf is
a Frobenius module and the predicate is `IsIntegralEnd` of the geometric Frobenius. The tests are
stated on rational models of the Frobenius modules. -/

section IntegralEnd

variable {E V : Type*} [Field E] [AddCommGroup V] [Module E V] [FiniteDimensional E V]

/-- `IsIntegralEnd F`: every root of the characteristic polynomial of `F` in an algebraic
closure is integral over `ℤ` (Weil II (3.3.2)). The roots are DWP.0's eigenvalue multiset. -/
def IsIntegralEnd (F : V →ₗ[E] V) : Prop :=
  ∀ α ∈ (F.charpoly.map (algebraMap E (AlgebraicClosure E))).roots, IsIntegral ℤ α

/-- For a rational Frobenius module, integrality is integrality of the characteristic
polynomial's coefficients. -/
theorem isIntegralEnd_iff_charpoly {W : Type*} [AddCommGroup W] [Module ℚ W]
    [FiniteDimensional ℚ W] (F : W →ₗ[ℚ] W) :
    IsIntegralEnd F ↔ ∀ n, ∃ m : ℤ, F.charpoly.coeff n = m := by
  sorry

/-- Integrality is detected on an invariant subspace and the quotient. -/
theorem IsIntegralEnd.of_extension (F : V →ₗ[E] V) (U : Submodule E V)
    (hU : U ≤ U.comap F) :
    IsIntegralEnd F ↔
      IsIntegralEnd (F.restrict (p := U) (q := U) (fun _ hx => hU hx)) ∧
        IsIntegralEnd (U.mapQ U F hU) := by
  sorry

/-- An algebraic number with an integral power is integral, and conversely. -/
theorem IsIntegralEnd.pow (F : V →ₗ[E] V) {r : ℕ} (hr : 0 < r) :
    IsIntegralEnd (F ^ r) ↔ IsIntegralEnd F := by
  sorry

/-- Eigenvalues of a tensor product are products of eigenvalues. -/
theorem IsIntegralEnd.tensor {W : Type*} [AddCommGroup W] [Module E W] [FiniteDimensional E W]
    {F : V →ₗ[E] V} {G : W →ₗ[E] W} (hF : IsIntegralEnd F) (hG : IsIntegralEnd G) :
    IsIntegralEnd (TensorProduct.map F G) := by
  sorry

end IntegralEnd

/-- Test `isIntegralEnd_tate_neg_one`: `ℚ̄_ℓ(−1)` on `Spec 𝔽_q` (here `q = 2`), where `F` acts
by `q`, is integral. -/
example : IsIntegralEnd ((2 : ℚ) • LinearMap.id : ℚ →ₗ[ℚ] ℚ) := by
  sorry

/-- Test `not_isIntegralEnd_tate_one`: `ℚ̄_ℓ(1)` (`F` acts by `q⁻¹`, `q = 2`) is pure of weight
`−2` but not integral. -/
example : ¬ IsIntegralEnd ((2 : ℚ)⁻¹ • LinearMap.id : ℚ →ₗ[ℚ] ℚ) := by
  sorry

/-- Test `not_isIntegralEnd_weight_zero`: the rotation with eigenvalues `(3 ± 4i)/5` (all
complex absolute values `1`, weight `0`) is not integral. -/
example : ¬ IsIntegralEnd (Matrix.toLin' !![(3 / 5 : ℚ), -4 / 5; 4 / 5, 3 / 5]) := by
  sorry

/-- Test `isIntegralEnd_zero`: the zero Frobenius module is integral. -/
example : IsIntegralEnd (0 : (Fin 0 → ℚ) →ₗ[ℚ] (Fin 0 → ℚ)) := by
  sorry

/-- Test `isIntegralEnd_jordan`: the Jordan block `[[2, 1], [0, 2]]` is integral; integrality
reads the characteristic polynomial `(T − 2)²`. -/
example : IsIntegralEnd (Matrix.toLin' !![(2 : ℚ), 1; 0, 2]) := by
  sorry

/-! ## The p-adic couple of a pure number (`DeligneWeightsAndPurity:DWP.7/newton-couples-3-3-7`) -/

section NewtonCouple

variable {K : Type*} [Field K]

/-- The couple `(v(α), v(q^n α⁻¹))` of Weil II (3.3.7), for an additive valuation `v` normalised
by `v q = 1`. -/
def newtonCouple (v : AddValuation K (WithTop ℚ)) (q : K) (n : ℤ) (α : K) :
    WithTop ℚ × WithTop ℚ :=
  (v α, v (q ^ n * α⁻¹))

theorem newtonCouple_fst_add_snd (v : AddValuation K (WithTop ℚ)) {q : K} (hq : v q = 1)
    (n : ℤ) {α : K} (hα : α ≠ 0) :
    (newtonCouple v q n α).1 + (newtonCouple v q n α).2 = ((n : ℚ) : WithTop ℚ) := by
  sorry

theorem newtonCouple_nonneg (v : AddValuation K (WithTop ℚ))
    (hv : ∀ x : K, IsIntegral ℤ x → 0 ≤ v x) (q : K) (n : ℤ) {α : K} (hα : IsIntegral ℤ α)
    (hα' : IsIntegral ℤ (q ^ n * α⁻¹)) :
    0 ≤ (newtonCouple v q n α).1 ∧ 0 ≤ (newtonCouple v q n α).2 := by
  sorry

theorem newtonCouple_swap_conj (v : AddValuation K (WithTop ℚ)) {q : K} (hq : q ≠ 0) (n : ℤ)
    {α : K} (hα : α ≠ 0) :
    newtonCouple v q n (q ^ n * α⁻¹) = (newtonCouple v q n α).swap := by
  sorry

theorem newtonCouple_galois (v : AddValuation K (WithTop ℚ)) (τ : K ≃+* K) {q : K}
    (hq : τ q = q) (n : ℤ) (α : K) :
    newtonCouple (v.comap (τ : K →+* K)) q n α = newtonCouple v q n (τ α) := by
  sorry

theorem newtonCouple_mul (v : AddValuation K (WithTop ℚ)) (q : K) (n m : ℤ) (α β : K) :
    newtonCouple v q (n + m) (α * β) = newtonCouple v q n α + newtonCouple v q m β := by
  sorry

theorem newtonCouple_div_pow (v : AddValuation K (WithTop ℚ)) {q : K} (hq : v q = 1)
    (hq0 : q ≠ 0) (n m : ℤ) (α : K) :
    newtonCouple v q n α =
      newtonCouple v q (n - 2 * m) (α * (q ^ m)⁻¹) + (((m : ℚ) : WithTop ℚ), ((m : ℚ) : WithTop ℚ)) := by
  sorry

end NewtonCouple

/-- Test `newtonCouple_fst_add_snd`: for `v q = 1` and `α ≠ 0`, `r + s = n`. -/
example {K : Type*} [Field K] (v : AddValuation K (WithTop ℚ)) (q α : K) (hq : v q = 1)
    (hα : α ≠ 0) :
    (newtonCouple v q 1 α).1 + (newtonCouple v q 1 α).2 = ((1 : ℚ) : WithTop ℚ) := by
  sorry

/-- Test `newtonCouple_supersingular`: if `α² = −p` and `v p = 1`, the couple of `α` (weight
`1`, `q = p`) is `(1/2, 1/2)`. -/
example {K : Type*} [Field K] (v : AddValuation K (WithTop ℚ)) (p α : K) (hp : v p = 1)
    (hα : α ^ 2 = -p) :
    newtonCouple v p 1 α = (((1 / 2 : ℚ) : WithTop ℚ), ((1 / 2 : ℚ) : WithTop ℚ)) := by
  sorry

/-- Test `newtonCouple_ordinary`: `q = 5`, `α = 1 + 2i` with `v α = 1` at the place over `5`
dividing it: the couple is `(1, 0)`. -/
example {K : Type*} [Field K] (v : AddValuation K (WithTop ℚ)) (α : K) (h5 : v 5 = 1)
    (hα : v α = 1) (hα0 : α ≠ 0) :
    newtonCouple v 5 1 α = (((1 : ℚ) : WithTop ℚ), ((0 : ℚ) : WithTop ℚ)) := by
  sorry

/-- Test `newtonCouple_tate`: `α = q^m` (weight `2m`) has couple `(m, m)`. -/
example {K : Type*} [Field K] (v : AddValuation K (WithTop ℚ)) (q : K) (hq : v q = 1)
    (hq0 : q ≠ 0) (m : ℕ) :
    newtonCouple v q (2 * m) (q ^ m) = (((m : ℚ) : WithTop ℚ), ((m : ℚ) : WithTop ℚ)) := by
  sorry

/-- Test `newtonCouple_nonintegral`: `α = q⁻¹` (weight `−2`) has couple `(−1, −1)`. -/
example {K : Type*} [Field K] (v : AddValuation K (WithTop ℚ)) (q : K) (hq : v q = 1)
    (hq0 : q ≠ 0) :
    newtonCouple v q (-2) q⁻¹ = (((-1 : ℚ) : WithTop ℚ), ((-1 : ℚ) : WithTop ℚ)) := by
  sorry

/-! ## Geometric semisimplicity (`DeligneWeightsAndPurity:DWP.8/geometric-semisimplicity`)

A lisse sheaf on a normal connected `X₀` over `𝔽_q` is a representation `ρ` of the Weil group
`W(X₀, x̄)`; geometric semisimplicity is semisimplicity of its restriction to the geometric
fundamental group `π₁(X, x̄)`. -/

section GeometricSemisimplicity

variable {E W V : Type*} [Field E] [Group W] [AddCommGroup V] [Module E V]

/-- `ρ` restricted to the subgroup `G` (the geometric fundamental group) is semisimple. -/
def IsGeometricallySemisimple (ρ : Representation E W V) (G : Subgroup W) : Prop :=
  IsSemisimpleModule (MonoidAlgebra E G) (Representation.asModule (ρ.comp G.subtype))

/-- The geometric monodromy group `ρ(G)` (Weil II (1.1.15)). -/
def geometricMonodromyGroup (ρ : Representation E W V) (G : Subgroup W) :
    Submonoid (V →ₗ[E] V) :=
  MonoidHom.mrange (ρ.comp G.subtype)

/-- Clifford: a semisimple representation restricts semisimply to a normal subgroup, so
arithmetic semisimplicity implies geometric semisimplicity. -/
theorem IsGeometricallySemisimple.of_isSemisimple [FiniteDimensional E V] (ρ : Representation E W V)
    (G : Subgroup W) [G.Normal] (h : IsSemisimpleModule (MonoidAlgebra E W) ρ.asModule) :
    IsGeometricallySemisimple ρ G := by
  sorry

end GeometricSemisimplicity

/-- Test `isGeometricallySemisimple_jordan`: on `Spec 𝔽_q` (trivial geometric group) the Weil
sheaf on which `F` acts by `[[1, 1], [0, 1]]` is geometrically semisimple but not arithmetically
semisimple. -/
example (ρ : Representation ℚ (Multiplicative ℤ) (Fin 2 → ℚ))
    (hρ : ρ (Multiplicative.ofAdd 1) = Matrix.toLin' !![(1 : ℚ), 1; 0, 1]) :
    IsGeometricallySemisimple ρ ⊥ ∧
      ¬ IsSemisimpleModule (MonoidAlgebra ℚ (Multiplicative ℤ)) ρ.asModule := by
  sorry

/-- Test `not_isGeometricallySemisimple_kummer`: a geometric monodromy group generated by a
nontrivial unipotent element (the Kummer extension of `ℚ̄_ℓ` by `ℚ̄_ℓ(1)` on `𝔾_m`) is not
semisimple. -/
example (ρ : Representation ℚ (Multiplicative ℤ) (Fin 2 → ℚ))
    (hρ : ρ (Multiplicative.ofAdd 1) = Matrix.toLin' !![(1 : ℚ), 1; 0, 1]) :
    ¬ IsGeometricallySemisimple ρ ⊤ := by
  sorry

/-- Test `isGeometricallySemisimple_point`: with trivial geometric group every representation is
geometrically semisimple. -/
example {W V : Type*} [Group W] [AddCommGroup V] [Module ℚ V] (ρ : Representation ℚ W V) :
    IsGeometricallySemisimple ρ ⊥ := by
  sorry

/-- Test `isGeometricallySemisimple_of_semisimple`: semisimple implies semisimple on a normal
subgroup. -/
example {W V : Type*} [Group W] [AddCommGroup V] [Module ℚ V] [FiniteDimensional ℚ V]
    (ρ : Representation ℚ W V) (G : Subgroup W) [G.Normal]
    (h : IsSemisimpleModule (MonoidAlgebra ℚ W) ρ.asModule) : IsGeometricallySemisimple ρ G := by
  sorry

end TauCeti.Weights

namespace TauCeti.HardLefschetz

/-! ## Linear algebra of hard Lefschetz (`DWP.9/invariant-form-on-invariants-4-1-4`,
`DWP.9/alternating-forms-have-even-rank`, `DWP.9/lefschetz-decomposition-of-a-graded-operator`) -/

section InvariantForm

variable {K G V : Type*} [Field K] [Group G] [AddCommGroup V] [Module K V] [FiniteDimensional K V]

/-- Weil II (4.1.4): an invariant nondegenerate bilinear form on a completely reducible
representation is nondegenerate on the invariants. -/
theorem restrict_invariants_nondegenerate (ρ : Representation K G V)
    [IsSemisimpleModule (MonoidAlgebra K G) ρ.asModule] (B : LinearMap.BilinForm K V)
    (hB : ∀ g x y, B (ρ g x) (ρ g y) = B x y) (hnd : B.Nondegenerate) :
    (B.restrict ρ.invariants).Nondegenerate := by
  sorry

end InvariantForm

/-- Acceptance of (4.1.4): without complete reducibility the conclusion fails; for the unipotent
action of `ℤ` on `ℚ²` and `B = det`, the invariant line is isotropic. -/
example (ρ : Representation ℚ (Multiplicative ℤ) (Fin 2 → ℚ))
    (hρ : ρ (Multiplicative.ofAdd 1) = Matrix.toLin' !![(1 : ℚ), 1; 0, 1])
    (B : LinearMap.BilinForm ℚ (Fin 2 → ℚ)) (hB : ∀ x y, B x y = x 0 * y 1 - x 1 * y 0) :
    ¬ (B.restrict ρ.invariants).Nondegenerate := by
  sorry

section EvenRank

variable {K V : Type*} [Field K] [AddCommGroup V] [Module K V] [FiniteDimensional K V]

/-- A finite-dimensional space with a nondegenerate alternating form has even dimension. -/
theorem even_finrank_of_isAlt_of_nondegenerate (B : LinearMap.BilinForm K V) (hA : B.IsAlt)
    (hN : B.Nondegenerate) : Even (Module.finrank K V) := by
  sorry

end EvenRank

section LefschetzDecomposition

variable {K V : Type*} [Field K] [AddCommGroup V] [Module K V] [FiniteDimensional K V]

/-- The primitive part `P^{n−r} = V^{n−r} ∩ ker λ^{r+1}` of a graded operator, indexed by `ℤ`. -/
def primitivePiece (𝒱 : ℤ → Submodule K V) (lam : V →ₗ[K] V) (n : ℤ) (r : ℕ) :
    Submodule K V :=
  𝒱 (n - r) ⊓ LinearMap.ker (lam ^ (r + 1))

/-- Deligne (1968) (1.5)–(1.6): for a grading `V = ⊕ V^j` (`V^j = 0` outside `[0, 2n]`) and a
degree-2 operator `λ` with `λ^r : V^{n−r} ≅ V^{n+r}` for `0 ≤ r ≤ n`, each `V^{n−r}` is the
internal direct sum of the `λ^k P^{n−r−2k}`. -/
theorem iSupIndep_lefschetzDecomposition (𝒱 : ℤ → Submodule K V) (h𝒱 : DirectSum.IsInternal 𝒱)
    (n : ℕ) (hout : ∀ j : ℤ, (j < 0 ∨ 2 * (n : ℤ) < j) → 𝒱 j = ⊥) (lam : V →ₗ[K] V)
    (hlam : ∀ j : ℤ, ∀ x ∈ 𝒱 j, lam x ∈ 𝒱 (j + 2))
    (hHL : ∀ r : ℕ, r ≤ n → Set.BijOn (lam ^ r) (𝒱 ((n : ℤ) - r)) (𝒱 ((n : ℤ) + r)))
    (r : ℕ) (hr : r ≤ n) :
    iSupIndep (fun k : ℕ => (primitivePiece 𝒱 lam n (r + 2 * k)).map (lam ^ k)) ∧
      (⨆ k : ℕ, (primitivePiece 𝒱 lam n (r + 2 * k)).map (lam ^ k)) = 𝒱 ((n : ℤ) - r) := by
  sorry

/-- The dimension count `dim P^{n−r} = dim V^{n−r} − dim V^{n−r−2}`. -/
theorem finrank_primitivePiece (𝒱 : ℤ → Submodule K V) (h𝒱 : DirectSum.IsInternal 𝒱) (n : ℕ)
    (hout : ∀ j : ℤ, (j < 0 ∨ 2 * (n : ℤ) < j) → 𝒱 j = ⊥) (lam : V →ₗ[K] V)
    (hlam : ∀ j : ℤ, ∀ x ∈ 𝒱 j, lam x ∈ 𝒱 (j + 2))
    (hHL : ∀ r : ℕ, r ≤ n → Set.BijOn (lam ^ r) (𝒱 ((n : ℤ) - r)) (𝒱 ((n : ℤ) + r)))
    (r : ℕ) (hr : r ≤ n) :
    (Module.finrank K (primitivePiece 𝒱 lam n r) : ℤ) =
      Module.finrank K (𝒱 ((n : ℤ) - r)) - Module.finrank K (𝒱 ((n : ℤ) - r - 2)) := by
  sorry

/-- The Lefschetz pairings `ψ_r(x, y) = B(λ^r x, y)` are nondegenerate on `V^{n−r}` when `B` is a
nondegenerate form pairing `V^a` with `V^{2n−a}` for which `λ` is self-adjoint. -/
theorem lefschetzPairing_nondegenerate (𝒱 : ℤ → Submodule K V) (h𝒱 : DirectSum.IsInternal 𝒱)
    (n : ℕ) (hout : ∀ j : ℤ, (j < 0 ∨ 2 * (n : ℤ) < j) → 𝒱 j = ⊥) (lam : V →ₗ[K] V)
    (hlam : ∀ j : ℤ, ∀ x ∈ 𝒱 j, lam x ∈ 𝒱 (j + 2))
    (hHL : ∀ r : ℕ, r ≤ n → Set.BijOn (lam ^ r) (𝒱 ((n : ℤ) - r)) (𝒱 ((n : ℤ) + r)))
    (B : LinearMap.BilinForm K V) (hB : B.Nondegenerate)
    (hdeg : ∀ a b : ℤ, a + b ≠ 2 * n → ∀ x ∈ 𝒱 a, ∀ y ∈ 𝒱 b, B x y = 0)
    (hadj : ∀ x y, B (lam x) y = B x (lam y)) (r : ℕ) (hr : r ≤ n) :
    ((B.comp (lam ^ r) LinearMap.id).restrict (𝒱 ((n : ℤ) - r))).Nondegenerate ∧
      ((B.comp (lam ^ r) LinearMap.id).restrict (primitivePiece 𝒱 lam n r)).Nondegenerate := by
  sorry

end LefschetzDecomposition

end TauCeti.HardLefschetz
