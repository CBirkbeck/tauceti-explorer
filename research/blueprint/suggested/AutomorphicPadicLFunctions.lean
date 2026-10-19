/-
# Dirichlet p-adic L-functions, Part II: ray-class and automorphic interpolation — representative interfaces

This file is not the roadmap and is not exhaustive. The definitive document is
`AutomorphicPadicLFunctions.md`; these statements suggest Lean forms so that contributors and
reviewers converge on names and signatures. Proofs are admitted; elaboration establishes neither the
mathematics nor an implementation.
Mathlib: 082e2d37e8b0463410cdb532e111cd43d5a66174.
Tau Ceti: f790474821cf4256814db967cb154e7af3d0c369.

Only what is statable over carriers that exist at the pins is prototyped: the p-power ray-class
tower of a number field built from Tau Ceti's `RayClassGroup` and `classMap`, the unit-closure
lemma, the weighted inversion of BSW Definition 9.4 on functions on a commutative group, the refined
eigenvalue and the level normalisation of BSW Theorem 9.10, admissible weights and critical infinity
types for GL₂ over a number field, Euler-factor elements in a group algebra, and the unit-root
condition of Panchishkin unramified representations. Hecke characters of a general number field,
locally analytic distributions on ray-class limits, the cohomology of GL₂ over a number field,
Hilbert and unitary modular forms, CM points and periods, Eisenstein measures and the doubling
method are not at the pins; their declarations are README targets, listed in the register at the
end. No such object is replaced by an arbitrary type or an empty predicate.
-/
import Mathlib.Algebra.MonoidAlgebra.Basic
import Mathlib.Algebra.Polynomial.AlgebraMap
import Mathlib.Algebra.BigOperators.Group.Finset.Basic
import Mathlib.Topology.Algebra.Group.Subgroup
import Mathlib.Topology.Separation.Hausdorff
import Mathlib.NumberTheory.NumberField.Units.DirichletTheorem
import TauCeti.NumberTheory.NumberField.Global.RayClass.Basic
import TauCeti.NumberTheory.NumberField.Global.RayClass.Exact
import TauCeti.NumberTheory.NumberField.Global.RayClass.Finite

noncomputable section

open NumberField

/-! ## L0 — the ray-class tower

### `L0/ray-class-tower`

The level-`m` modulus has finite part `𝔫 · p^m` and every real place in its infinite part; the
tower is the subgroup of compatible families in the product of the finite ray class groups. -/
namespace TauCeti.GlobalNumberFields.RayClassTower

variable {K : Type*} [Field K] [NumberField K]

/-- The finite part `𝔫 · (p)^m` is nonzero. -/
theorem levelFinite_ne_bot (𝔫 : Modulus K) {p : ℕ} (hp : p ≠ 0) (m : ℕ) :
    𝔫.finitePart * Ideal.span {(p : 𝓞 K)} ^ m ≠ ⊥ := sorry

/-- The narrow modulus `𝔫 p^m`: finite part `𝔫 · (p)^m` (the tame modulus `𝔫` prime to `p`), all
real places. -/
def levelModulus (𝔫 : Modulus K) {p : ℕ} (hp : p ≠ 0) (m : ℕ) : Modulus K where
  finitePart := 𝔫.finitePart * Ideal.span {(p : 𝓞 K)} ^ m
  finitePart_ne_bot := levelFinite_ne_bot 𝔫 hp m
  infinitePart := (Set.finite_univ (α := {w : InfinitePlace K // w.IsReal})).toFinset

variable (𝔫 : Modulus K) {p : ℕ} (hp : p ≠ 0)

/-- Consecutive levels divide each other. -/
theorem levelModulus_dvd_succ (m : ℕ) : levelModulus 𝔫 hp m ∣ levelModulus 𝔫 hp (m + 1) := sorry

/-- `RayClassTower.limit`: the compatible families `(x_m)` with `classMap x_{m+1} = x_m`, a
subgroup of `∏_m RayClassGroup (𝔫 p^m)`. -/
def limit : Subgroup ((m : ℕ) → RayClassGroup (levelModulus 𝔫 hp m)) where
  carrier := {x | ∀ m, classMap (levelModulus_dvd_succ 𝔫 hp m) (x (m + 1)) = x m}
  mul_mem' := sorry
  one_mem' := sorry
  inv_mem' := sorry

/-- `RayClassTower.proj`: projection to level `m`. -/
def proj (m : ℕ) : limit 𝔫 hp →* RayClassGroup (levelModulus 𝔫 hp m) where
  toFun x := x.1 m
  map_one' := rfl
  map_mul' _ _ := rfl

/-- `RayClassTower.proj_surjective`: every projection is surjective. -/
theorem proj_surjective (m : ℕ) : Function.Surjective (proj 𝔫 hp m) := sorry

/-- `RayClassTower.ext`: elements are determined by their projections. -/
theorem ext {x y : limit 𝔫 hp} (h : ∀ m, proj 𝔫 hp m x = proj 𝔫 hp m y) :
    x = y := sorry

/- Test: degenerate. At `m = 0` the projection lands in the ray class group of `𝔫` with all real
places (for `𝔫 = ⊤` the narrow class group). -/
example (x : limit 𝔫 hp) : proj 𝔫 hp 0 x = x.1 0 := rfl

end TauCeti.GlobalNumberFields.RayClassTower

/-! ### `L0/unit-invariance-closure` -/
namespace TauCeti.RayClassDistribution

/-- Continuous unit invariance extends to the topological closure of the unit subgroup. -/
theorem unitInvariant_closure {G Y : Type*} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    [TopologicalSpace Y] [T2Space Y] (E : Subgroup G) (φ : G → Y) (hφ : Continuous φ)
    (h : ∀ e ∈ E, ∀ z, φ (e * z) = φ z) :
    ∀ e ∈ E.topologicalClosure, ∀ z, φ (e * z) = φ z := sorry

end TauCeti.RayClassDistribution

/-! ## L1 — admissible weights and critical infinity types (`L1/admissible-weight-coefficients`,
`L1/cusp-forms-and-twisted-l-functions`)

`E` is the set of complex embeddings with complex conjugation `c`. -/
namespace TauCeti.GL2F

variable {E : Type*} (c : E → E)

/-- `GL2Weight.IsAdmissible`: `k = c·k ≥ 0` and `k + 2v` is parallel. -/
def IsAdmissible (k v : E → ℤ) : Prop :=
  (∀ σ, k (c σ) = k σ ∧ 0 ≤ k σ) ∧ ∃ w : ℤ, ∀ σ, k σ + 2 * v σ = w

/-- `GL2F.IsCritical`: an infinity type `j + v` is critical for weight `(k, v)` iff `0 ≤ j ≤ k`. -/
def IsCritical (k j : E → ℤ) : Prop := ∀ σ, 0 ≤ j σ ∧ j σ ≤ k σ

/- Test: degenerate. The weight `(0, 0)` is admissible. -/
example : IsAdmissible (E := Fin 2) id 0 0 := ⟨fun _ => ⟨rfl, le_rfl⟩, ⟨0, fun _ => by simp⟩⟩

/- Test: non-example. For a real quadratic field (`c = id`), `k = (2, 0)`, `v = 0` is not
admissible since `k + 2v` is not parallel. -/
example : ¬ IsAdmissible (E := Fin 2) id ![2, 0] 0 := sorry

/- Test: computation. For `k = 2` (one embedding) the critical infinity types are `j ∈ {0, 1, 2}`. -/
example : IsCritical (E := Unit) (fun _ => 2) (fun _ => 1) ∧
    ¬ IsCritical (E := Unit) (fun _ => 2) (fun _ => 3) := sorry

end TauCeti.GL2F

/-! ## L2 — weighted inversion, refined eigenvalues and level normalisation -/
namespace TauCeti.GL2F

/-! ### `L2/inversion-weight-twist` -/
section WeightedInversion
variable {G L : Type*} [CommGroup G] [Field L] (w : G →* Lˣ)

/-- `GL2F.weightedInversion`: `ψ ↦ (z ↦ w(z) ψ(z⁻¹))` (BSW Definition 9.4 with `w = z^{k+v}`). -/
def weightedInversion : (G → L) →ₗ[L] (G → L) where
  toFun ψ z := (w z : L) * ψ z⁻¹
  map_add' _ _ := by funext z; simp [mul_add]
  map_smul' _ _ := by funext z; simp [mul_left_comm]

/-- `GL2F.weightedInversion_apply`. -/
@[simp] theorem weightedInversion_apply (ψ : G → L) (z : G) :
    weightedInversion w ψ z = (w z : L) * ψ z⁻¹ := rfl

/-- `GL2F.weightedInversion_involutive` (for a weight with `w z * w z⁻¹ = 1`). -/
theorem weightedInversion_involutive (ψ : G → L) :
    weightedInversion w (weightedInversion w ψ) = ψ := sorry

/-- `GL2F.weightedInversion_translate`: the translate `(u·)` of the inverted function is the
inversion of `ψ(u ·)`, with the weight factor `w u`. -/
theorem weightedInversion_translate (ψ : G → L) (u z : G) :
    (w u : L) * weightedInversion w ψ (u⁻¹ * z) = weightedInversion w (fun x => ψ (u * x)) z :=
  sorry

/- Test: degenerate. For the trivial weight, the inversion is `ψ ↦ ψ ∘ inv`. -/
example (ψ : G → L) (z : G) : weightedInversion (1 : G →* Lˣ) ψ z = ψ z⁻¹ := by simp

end WeightedInversion

/-! ### `L2/refinement-eigenvalue` and `L2/normalised-evaluation` -/
section Normalisation
variable {P L M : Type*} [Fintype P] [Field L] [AddCommGroup M] [Module L M]

/-- `GL2F.refinedEigenvalue`: `λ_f = ∏_𝔭 λ_𝔭^{n(𝔭)}` for `f = ∏ 𝔭^{n(𝔭)}`. -/
def refinedEigenvalue (α : P → Lˣ) (n : P → ℕ) : Lˣ := ∏ q, α q ^ n q

/-- `GL2F.refinedEigenvalue_one`. -/
@[simp] theorem refinedEigenvalue_one (α : P → Lˣ) : refinedEigenvalue α 0 = 1 := by
  simp [refinedEigenvalue]

/-- `GL2F.refinedEigenvalue_mul`. -/
theorem refinedEigenvalue_mul (α : P → Lˣ) (n n' : P → ℕ) :
    refinedEigenvalue α (n + n') = refinedEigenvalue α n * refinedEigenvalue α n' := sorry

/-- `GL2F.refinedEigenvalue_prime`. -/
theorem refinedEigenvalue_prime [DecidableEq P] (α : P → Lˣ) (n : P → ℕ) (q : P) :
    refinedEigenvalue α (n + Pi.single q 1) = refinedEigenvalue α n * α q := sorry

/-- `GL2F.padicLFunction` in its normalisation form: `μ := λ_f^{-1} μ^f`. -/
def normalised (α : P → Lˣ) (μ : (P → ℕ) → M) (n : P → ℕ) : M :=
  ((refinedEigenvalue α n)⁻¹ : Lˣ) • μ n

/-- `GL2F.padicLFunction_apply`. -/
theorem normalised_apply (α : P → Lˣ) (μ : (P → ℕ) → M) (n : P → ℕ) :
    normalised α μ n = ((refinedEigenvalue α n)⁻¹ : Lˣ) • μ n := rfl

/-- `L2/normalised-evaluation-common-level` (BSW Theorem 9.10): the norm relation at levels
divisible by every prime gives independence of the level among such levels. -/
theorem normalised_commonLevel [DecidableEq P] (α : P → Lˣ) (μ : (P → ℕ) → M)
    (hrel : ∀ n : P → ℕ, (∀ q, 1 ≤ n q) → ∀ q, μ (n + Pi.single q 1) = (α q : L) • μ n)
    (n m : P → ℕ) (hn : ∀ q, 1 ≤ n q) (hm : ∀ q, 1 ≤ m q) :
    normalised α μ n = normalised α μ m := sorry

/- Test: computation. With one prime, `λ = 2` and `μ(n) = 7 · 2^n`, the normalisation is `7` at
every level `n ≥ 1`. -/
example (n : ℕ) (hn : 1 ≤ n) :
    normalised (P := Unit) (fun _ => (Units.mk0 (2 : ℚ) two_ne_zero)) (fun k => (7 : ℚ) * 2 ^ k ())
      (fun _ => n) = 7 := sorry

/- Test: non-example. The level with a missing prime is excluded: a family with `μ(0) = 3` and
`μ(n) = 2^n` for `n ≥ 1` satisfies every relation between admissible levels but normalises to `3`
at level `0` and to `1` at level `1`. -/
example : normalised (P := Unit) (fun _ => (Units.mk0 (2 : ℚ) two_ne_zero))
    (fun k => if k () = 0 then (3 : ℚ) else 2 ^ k ()) (fun _ => 0) ≠
    normalised (P := Unit) (fun _ => (Units.mk0 (2 : ℚ) two_ne_zero))
    (fun k => if k () = 0 then (3 : ℚ) else 2 ^ k ()) (fun _ => 1) := sorry

end Normalisation

end TauCeti.GL2F

/-! ## L0 — Euler-factor elements (`L0/euler-factor-elements`) -/
namespace TauCeti.EulerFactorElement

variable {O G : Type*} [CommRing O] [CommGroup G]

/-- `EulerFactorElement`: `e_w = P_w(c · [γ_w]) ∈ O[G]` with `c` standing for `N(w)⁻¹`. -/
def eulerFactor (P : Polynomial O) (c : O) (γ : G) : MonoidAlgebra O G :=
  Polynomial.aeval (c • MonoidAlgebra.of O G γ) P

/-- `EulerFactorElement.eval`: value at a character `χ : G →* O`. -/
def eval (χ : G →* O) : MonoidAlgebra O G →ₐ[O] O := MonoidAlgebra.lift O O G χ

/-- `EulerFactorElement.eval` on an Euler factor: `χ(e_w) = P_w(c · χ(γ_w))`. -/
theorem eval_eulerFactor (χ : G →* O) (P : Polynomial O) (c : O) (γ : G) :
    eval χ (eulerFactor P c γ) = P.eval (c * χ γ) := sorry

/- Test: degenerate. The constant polynomial `1` gives the unit element. -/
example (c : O) (γ : G) : eulerFactor (1 : Polynomial O) c γ = 1 := by simp [eulerFactor]

/- Test: computation. For `P = 1 − T`, `c = 1/3` and the trivial character over `ℚ`, the value
is `1 − 1/3 = 2/3`. -/
example : eval (G := Multiplicative ℤ) (1 : Multiplicative ℤ →* ℚ)
    (eulerFactor (1 - Polynomial.X) (1 / 3) (Multiplicative.ofAdd 1)) = 2 / 3 := sorry

end TauCeti.EulerFactorElement

/-! ## L4 — the unit-root condition of `L4/panchishkin-unramified`

The Satake polynomial at a place `u` above `p` is `T^n + Σ_s β_s q^{s(s−1)/2} T^{n−s}` with
`β_s` in the valuation ring `O`; with `n = 2r`, `π_v` is Panchishkin unramified when `β_r` is a
unit at every `u`. -/
namespace TauCeti.Panchishkin

variable {O : Type*} [CommRing O] {U : Type*}

/-- `Panchishkin.IsUnramified`: `β_{u,r}` is a unit for every `u` above `v`. -/
def IsUnramified (r : ℕ) (β : U → ℕ → O) : Prop := ∀ u, IsUnit (β u r)

/- Test: degenerate. With no places above `v` the condition is vacuous. -/
example (r : ℕ) (β : Empty → ℕ → O) : IsUnramified r β := fun u => u.elim

/- Test: non-example. For `O = ℤ` and middle coefficient `2` the condition fails (the analogue of
the supersingular case for `n = 2`, where the middle coefficient is divisible by `p`). -/
example : ¬ IsUnramified (O := ℤ) (U := Unit) 1 (fun _ _ => 2) := sorry

end TauCeti.Panchishkin

/-! ## Register of README targets

The packet declarations below are not prototyped here because their carriers are not at the pins
(Hecke characters and locally analytic distributions on ray-class limits of a general number
field, cohomology of GL₂ over a number field, Hilbert and unitary modular forms and their p-adic
versions, CM points and periods, Eisenstein measures, the doubling method, Klingen families and
motives). Their statements, API and unit tests are in the README, under the names listed here;
names already declared above are marked `(above)`.

### L0

* `L0/unit-invariance-closure` (lemma): stated in the README.
* `L0/ray-class-tower` (construction): `RayClassTower.limit` (above), `RayClassTower.proj` (above), `RayClassTower.proj_surjective` (above), `RayClassTower.ext` (above), `RayClassTower.tameChange`, `RayClassTower.isOpen_ker_proj`, `RayClassTower.compactSpace`, `rayClassTower_rat_one`, `rayClassTower_level_zero`, `rayClassTower_tameChange_comp`, `rayClassTower_not_full_units`.
* `L0/ray-class-unit-sequence` (theorem): stated in the README.
* `L0/leopoldt-dimension-formula` (theorem): stated in the README.
* `L0/ray-class-reciprocity` (theorem): stated in the README.
* `L0/hecke-character-avatar` (construction): `HeckeCharacter.pAdicAvatar`, `HeckeCharacter.pAdicAvatar_mul`, `HeckeCharacter.pAdicAvatar_finiteOrder`, `HeckeCharacter.pAdicAvatar_isLocallyAlgebraic`, `HeckeCharacter.pAdicAvatar_frob`, `HeckeCharacter.algebraicAvatar`, `HeckeCharacter.signCharacter`, `pAdicAvatar_trivial`, `pAdicAvatar_norm_rat`, `pAdicAvatar_dirichlet`, `pAdicAvatar_not_complex`.
* `L0/locally-algebraic-characters` (theorem): stated in the README.
* `L0/gauss-sum-and-depleted-l-function` (definition): `HeckeCharacter.gaussSum`, `HeckeCharacter.gaussSum_eq_prod_epsilon`, `HeckeCharacter.gaussSum_twisted_sum`, `HeckeCharacter.depletedLFunction`, `HeckeCharacter.depletedLFunction_eq`, `HeckeCharacter.depletedLFunction_union`, `gaussSum_trivial`, `gaussSum_rat_compat`, `depleted_rat_zeta`, `depleted_not_conductor`.
* `L0/odd-character-l-zero-nonvanishing` (theorem): stated in the README.
* `L0/ray-class-distributions` (definition): `RayClassDistribution` (above), `RayClassDistribution.restrictFibre`, `RayClassDistribution.ofUnitInvariant`, `RayClassDistribution.mellin`, `RayClassDistribution.measure_coe`, `RayClassDistribution.chart_independent`, `rayClassDistribution_rat`, `rayClassDistribution_dirac`, `rayClassDistribution_fibre_count`, `rayClassDistribution_not_units_dual`.
* `L0/evaluation-norm-twist-maps` (construction): `RayClassDistribution.eval` (above), `RayClassDistribution.twist` (above), `RayClassDistribution.eval_twist`, `RayClassDistribution.map`, `RayClassDistribution.eval_map`, `RayClassDistribution.map_twist`, `eval_trivial_total_mass`, `eval_dirac`, `eval_twist_compat`, `eval_map_not_factor`.
* `L0/conditional-evaluation-principle` (theorem): stated in the README.
### L1

* `L1/admissible-weight-coefficients` (definition): `GL2Weight.IsAdmissible` (above), `GL2Weight.coeffModule`, `GL2Weight.coeffModule_dual`, `GL2Weight.coeffModule_baseChange`, `Y1.localSystemOne`, `Y1.localSystemTwo`, `Y1.localSystemOneEquivTwo`, `weight_trivial`, `weight_rank_bianchi`, `weight_rat_compat`, `weight_not_admissible`.
* `L1/cusp-forms-and-twisted-l-functions` (definition): `GL2F.CuspForm`, `GL2F.twistedLFunction`, `GL2F.twistedLFunction_eulerProduct`, `GL2F.completedValue`, `GL2F.IsCritical` (above), `GL2F.twistedLFunction_classical`, `cuspForm_weight_zero_rat`, `criticality_range`, `completedValue_trivial_j`, `criticality_nonexample`.
* `L1/eichler-shimura-harder` (theorem): stated in the README.
* `L1/hida-period-algebraicity` (theorem): stated in the README.
* `L1/period-normalised-symbol` (construction): `GL2F.weylAction`, `GL2F.isotypicPart`, `GL2F.normalisedSymbol`, `GL2F.normalisedSymbol_padic`, `GL2F.normalisedSymbol_period_change`, `isotypic_sum`, `isotypic_imag_quadratic`, `normalisedSymbol_rat`, `isotypic_nonexample`.
* `L1/automorphic-cycles` (construction): `GL2F.automorphicCycle`, `GL2F.cycleEmbedding`, `GL2F.cycleEmbedding_component`, `GL2F.cycleComponentEquiv`, `GL2F.cycleTrace`, `cycle_rat_dimension`, `cycle_count`, `cycle_imag_quadratic`, `cycle_nonexample`.
* `L1/classical-evaluation-maps` (construction): `GL2F.evalComponent`, `GL2F.evalCharacter`, `GL2F.evalCharacter_independent`, `GL2F.evalCharacter_weyl`, `GL2F.evalCharacter_isotypic`, `GL2F.evalCharacterTwo`, `GL2F.evalCharacterTwo_alpha`, `GL2F.evalCharacter_baseChange`, `eval_trivial_character_rat`, `eval_representative_change`, `eval_imag_quadratic`, `eval_wrong_sign`.
* `L1/integral-formula` (theorem): stated in the README.
* `L1/critical-value-formula` (theorem): stated in the README.
* `L1/rational-modular-symbol-comparison` (comparison): stated in the README.
### L2

* `L2/locally-analytic-coefficients` (definition): `GL2F.analyticCoeff`, `GL2F.distCoeff`, `GL2F.specialise`, `GL2F.analyticCoeff_action_apply`, `GL2F.distCoeff_baseChange`, `GL2F.polynomial_le_analytic`, `analyticCoeff_weight_zero`, `analyticCoeff_rat`, `specialise_monomial`, `analyticCoeff_not_gl2`.
* `L2/overconvergent-modular-symbols` (definition): `GL2F.overconvergentSymbols`, `GL2F.specialisationMap`, `GL2F.upOperator`, `GL2F.upOperator_changeUniformiser`, `GL2F.slopeLE`, `GL2F.renormalisedUp`, `ocSymbols_rat`, `upOperator_weight_shift`, `slopeLE_empty_set`, `ocSymbols_not_classical`.
* `L2/up-compactness` (theorem): stated in the README.
* `L2/slope-decomposition` (theorem): stated in the README.
* `L2/negative-slope-vanishing` (lemma): stated in the README.
* `L2/theta-maps-partial-classicality` (construction): `GL2F.thetaMap`, `GL2F.thetaWeight`, `GL2F.partiallyClassicalDist`, `GL2F.bgg_exact`, `GL2F.partialSpecialise_exact`, `GL2F.thetaMap_up`, `theta_rat_weight_zero`, `theta_kills_polynomials`, `partial_empty`, `theta_wrong_order`.
* `L2/control-theorem` (theorem): stated in the README.
* `L2/small-slope-eigenlift` (theorem): stated in the README.
* `L2/overconvergent-evaluation` (construction): `GL2F.ocEvalComponent`, `GL2F.covariantAnalytic`, `GL2F.ocEvalComponent_rep_change`, `GL2F.ocEvalComponent_specialise`, `ocEval_rat`, `ocEval_covariance`, `ocEval_specialise_zero`, `ocEval_rep_dependence`.
* `L2/inversion-weight-twist` (construction): `GL2F.weightedInversion` (above), `GL2F.weightedInversion_apply` (above), `GL2F.weightedInversion_covariant`, `GL2F.weightedInversion_translate` (above), `GL2F.weightedInversion_involutive` (above), `GL2F.weightedInversion_character`, `twist_trivial_weight`, `twist_character_degree`, `twist_constant_one`, `twist_no_inverse_nonexample`.
* `L2/finite-evaluation` (construction): `GL2F.levelDistribution`, `GL2F.levelDistribution_apply`, `GL2F.levelDistribution_reindex`, `GL2F.levelDistribution_avatar`, `finite_empty`, `finite_single`, `finite_rat_compat`, `finite_untwisted_nonexample`.
* `L2/finite-evaluation-representative` (theorem): stated in the README.
* `L2/refinement-eigenvalue` (definition): `GL2F.refinedEigenvalue` (above), `GL2F.refinedEigenvalue_one` (above), `GL2F.refinedEigenvalue_mul` (above), `GL2F.refinedEigenvalue_prime` (above), `GL2F.refinedEigenvalue_eq_eigenvalue`, `eigenvalue_empty`, `eigenvalue_two_primes`, `eigenvalue_rat_compat`, `eigenvalue_zero_rejected`.
* `L2/norm-relation` (theorem): stated in the README.
* `L2/normalised-evaluation` (construction): `GL2F.padicLFunction` (above), `GL2F.padicLFunction_apply` (above), `GL2F.padicLFunction_smul`, `GL2F.padicLFunction_changeUniformiser`, `GL2F.padicLFunctionOf`, `normalise_one_prime`, `normalise_two_incomparable`, `normalise_rat_compat`, `normalise_excluded_zero_level`.
* `L2/normalised-evaluation-common-level` (theorem): stated in the README.
* `L2/classical-overconvergent-compatibility` (theorem): stated in the README.
* `L2/bsw-interpolation` (theorem): stated in the README.
* `L2/bsw-choice-independence` (theorem): stated in the README.
* `L2/growth-uniqueness-totally-real-imaginary-quadratic` (theorem): stated in the README.
* `L2/specialisations-q-hilbert-bianchi` (comparison): stated in the README.
### L3

* `L3/partial-zeta-distributions` (definition): `TotallyRealZeta.lValue`, `TotallyRealZeta.lValue_level`, `TotallyRealZeta.lValue_linear`, `TotallyRealZeta.delta`, `TotallyRealZeta.lValue_rat`, `lValue_rat_trivial`, `lValue_level_independent`, `delta_trivial_c`, `lValue_not_primitive`.
* `L3/hilbert-cusp-combinatorics` (definition): `HilbertCusp`, `HilbertCusp.bIdeal`, `HilbertCusp.cIdeal`, `HilbertCusp.aboveInfty`, `HilbertCusp.aboveZero`, `HilbertModularForm.normalisedCoeff`, `HilbertModularForm.nebentypusDecomposition`, `cusp_rat_infty`, `cusp_c_ideal_infty`, `cusp_zero_trivial_level`, `normalisedCoeff_not_raw`.
* `L3/hilbert-eisenstein-series` (construction): `HilbertEisenstein.G` (above), `HilbertEisenstein.G_qExpansion`, `HilbertEisenstein.G_constantTerm`, `HilbertEisenstein.E` (above), `HilbertEisenstein.E_hecke`, `HilbertEisenstein.E_groupRing`, `HilbertEisenstein.G_linear`, `eisenstein_rat`, `eisenstein_coeff_one`, `eisenstein_parity`, `eisenstein_not_cusp`.
* `L3/eisenstein-constant-terms` (theorem): stated in the README.
* `L3/siegel-klingen-rationality` (theorem): stated in the README.
* `L3/padic-hilbert-modular-forms` (definition): `PadicHilbertForm`, `PadicHilbertForm.qExpansion`, `PadicHilbertForm.ofClassical`, `PadicHilbertForm.qExpansion_ofClassical`, `PadicHilbertForm.baseChange`, `PadicHilbertForm.weightAction`, `padicHilbert_rat`, `padicHilbert_constant`, `padicHilbert_qExp_factor`, `padicHilbert_not_classical`.
* `L3/igusa-irreducibility` (theorem): stated in the README.
* `L3/padic-q-expansion-principle` (theorem): stated in the README.
* `L3/deligne-ribet-measure` (theorem): stated in the README.
* `L3/deligne-ribet-pseudomeasure` (construction): `DeligneRibet.pseudoMeasure`, `DeligneRibet.pseudoMeasure_eq_div`, `DeligneRibet.pseudoMeasure_moment`, `DeligneRibet.padicL`, `DeligneRibet.padicL_interpolation`, `DeligneRibet.padicL_powerSeries`, `DeligneRibet.pseudoMeasure_map`, `dr_rat_kubota_leopoldt`, `dr_moment_trivial`, `dr_pole`, `dr_not_primitive`.
* `L3/deligne-ribet-rational-comparison` (comparison): stated in the README.
* `L3/cm-type-p-ordinary` (definition): `CMType.IsPOrdinary`, `CMType.IsPOrdinary.split`, `CMType.polarisationDatum`, `CMType.IsPOrdinary.conj`, `CMType.IsPOrdinary.induced`, `ordinary_imag_quadratic_split`, `ordinary_imag_quadratic_inert`, `ordinary_conj`, `ordinary_ramified`.
* `L3/cm-points-and-canonical-trivialisations` (construction): `CMPoint`, `CMPoint.padic`, `CMPoint.galoisAction`, `CMPoint.idele_action`, `CMPoint.ordinary`, `cmpoint_imag_quadratic`, `cmpoint_ordinary_split`, `cmpoint_class_number_one`, `cmpoint_inert_nonexample`.
* `L3/cm-periods` (definition): `CMPeriod.complex` (above), `CMPeriod.padic`, `CMPeriod.scale`, `CMPeriod.ratio_canonical`, `CMPeriod.galois`, `period_scale`, `period_gaussian`, `period_independent_of_level`, `period_not_unit_supersingular`.
* `L3/katz-differential-operators` (construction): `KatzTheta.cInfty`, `KatzTheta.padic`, `KatzTheta.padic_comm`, `KatzTheta.padic_leibniz`, `KatzTheta.padic_qExpansion`, `KatzTheta.rat`, `theta_rat_q_expansion`, `theta_weight_shift`, `theta_zero_order`, `theta_not_holomorphic`.
* `L3/katz-cm-algebraicity` (theorem): stated in the README.
* `L3/katz-eisenstein-measure` (construction): `KatzEisensteinMeasure`, `KatzEisensteinMeasure.moment`, `KatzEisensteinMeasure.function_equiv`, `KatzEisensteinMeasure.theta`, `KatzEisensteinMeasure.qExpansion`, `katzEis_rat`, `katzEis_constant_function`, `katzEis_unit_invariance`, `katzEis_not_bounded_by_cusp`.
* `L3/katz-padic-l-function` (theorem): stated in the README.
* `L3/katz-functional-equation` (theorem): stated in the README.
* `L3/katz-hida-tilouine-tame` (theorem): stated in the README.
* `L3/group-ring-eisenstein-families` (construction): `GroupRingHilbertForm.glue`, `GroupRingHilbertForm.specialise`, `GroupRingEisenstein.E` (above), `GroupRingEisenstein.W`, `GroupRingEisenstein.W_integral`, `GroupRingEisenstein.ord_W`, `grEis_trivial_group`, `grEis_specialise`, `grEis_coeff_one`, `grEis_constant_not_integral`.
### L3h

* `L3h/hsieh-setting` (definition): `HsiehDatum`, `HsiehDatum.HypothesisA`, `HsiehDatum.SquarefreeMinus`, `HsiehDatum.criticalCharacters`, `HsiehDatum.padicMultiplier`, `HsiehDatum.HypothesisA_of_minus_one`, `hsieh_trivial_minus`, `hsieh_rat_heegner`, `hsieh_multiplier_unramified`, `hsieh_ordinary_type_not_pi`.
* `L3h/explicit-waldspurger` (theorem): stated in the README.
* `L3h/toric-test-vectors` (construction): `HsiehToric.IsToric`, `HsiehToric.localVector`, `HsiehToric.globalForm`, `HsiehToric.normalisedCoeff`, `HsiehToric.normalisedCoeff_one`, `HsiehToric.mu_local_iff`, `toric_unramified`, `toric_character`, `toric_rat_compat`, `toric_not_newvector`.
* `L3h/anticyclotomic-distribution` (construction): `HsiehMeasure.qExpansionMeasure`, `HsiehMeasure.qExpansionMeasure_moment`, `HsiehMeasure.qExpansionMeasure_unique`, `HsiehMeasure.squareRoot`, `HsiehMeasure.pAdicL`, `HsiehMeasure.twist` (above), `hsieh_measure_trivial_char`, `hsieh_measure_support`, `hsieh_rat_compat`, `hsieh_square_not_root`.
* `L3h/theorem-a` (theorem): stated in the README.
* `L3h/cm-integrality-criterion` (theorem): stated in the README.
* `L3h/theorem-b` (theorem): stated in the README.
* `L3h/theorem-c` (theorem): stated in the README.
* `L3h/bdp-castella-hsieh-specialisation` (comparison): stated in the README.
* `L3h/mod-p-nonvanishing` (theorem): stated in the README.
* `L3h/hida-linear-independence` (theorem): stated in the README.
* `L3h/hida-cm-density` (theorem): stated in the README.
* `L3h/hida-katz-mu-vanishing` (theorem): stated in the README.
* `L3h/hsieh-hecke-nonvanishing` (theorem): stated in the README.
* `L3h/finis-divisibility` (theorem): stated in the README.
### L4

* `L4/ehls-unitary-datum` (definition): `EHLSDatum`, `EHLSDatum.doubling` (above), `EHLSDatum.doubling_shimura`, `EHLSDatum.IsOrdinaryOfType`, `EHLSDatum.negSpace_shimura`, `ehls_torus`, `ehls_split_condition`, `ehls_doubling_isotropic`, `ehls_not_unitary_quasisplit`.
* `L4/ehls-ordinary-forms-hecke` (construction): `EHLS.ordinaryProjector`, `EHLS.ordinaryHeckeAlgebra`, `EHLS.ordinaryHeckeAlgebra_finite_free`, `EHLS.congruenceIdeal`, `EHLS.testVectorLattice`, `EHLS.ordinary_control`, `ehls_projector_idempotent`, `ehls_torus_hecke`, `ehls_congruence_gl2`, `ehls_not_all_components`.
* `L4/ehls-hypotheses` (definition): `EHLS.Gorenstein`, `EHLS.GlobalMultiplicityOne`, `EHLS.Minimality`, `EHLS.Gorenstein_open`, `EHLS.Gorenstein_iff_dual_free`, `ehls_gorenstein_torus`, `ehls_multiplicity_one_split`, `ehls_gorenstein_dual_free`, `ehls_not_automatic`.
* `L4/ehls-differential-operators` (construction): `UnitaryTheta.padic`, `UnitaryTheta.cInfty`, `UnitaryTheta.qExpansion`, `UnitaryTheta.compare`, `UnitaryTheta.torus`, `utheta_torus`, `utheta_zero`, `utheta_weight_shift`, `utheta_not_holomorphic`.
* `L4/ehls-eisenstein-measure` (construction): `EHLS.eisensteinMeasure`, `EHLS.eisensteinMeasure_moment`, `EHLS.eisensteinMeasure_axiomatic`, `EHLS.eisensteinMeasure_restrict`, `ehlsEis_torus`, `ehlsEis_classical_point`, `ehlsEis_zero_character`, `ehlsEis_not_cuspidal`.
* `L4/doubling-global-identity` (theorem): stated in the README.
* `L4/local-zeta-at-p` (theorem): stated in the README.
* `L4/archimedean-zeta-integral` (theorem): stated in the README.
* `L4/ehls-main-theorem` (theorem): stated in the README.
* `L4/dl-siegel-hermitian-varieties` (definition): `SiegelHermitian`, `SiegelHermitian.lineBundle_independent`, `SiegelHermitian.toPEL`, `SiegelHermitian.qExpansion`, `siegelHerm_genus_one`, `siegelHerm_independence`, `siegelHerm_pel_compat`, `siegelHerm_not_pel_itself`.
* `L4/dl-big-cell-sections` (construction): `DL.bigCellSection`, `DL.bigCellSection_invariant`, `DL.bigCellSection_up`, `DL.degeneratePrincipalSeries`, `bigcell_zero_translate`, `bigcell_additivity`, `bigcell_r1`, `bigcell_not_spherical`.
* `L4/dl-eisenstein-family` (theorem): stated in the README.
* `L4/panchishkin-unramified` (definition): `Panchishkin.satakePolynomial`, `Panchishkin.IsUnramified` (above), `Panchishkin.unitRoot`, `Panchishkin.eigenline`, `Panchishkin.unitFactor`, `Panchishkin.matrixCoefficient`, `Panchishkin.unitPrincipalSeries`, `Panchishkin.dual`, `panchishkin_gl2_ordinary`, `panchishkin_unit_root_unique`, `panchishkin_trivial_rank`, `panchishkin_supersingular`.
* `L4/dl-local-doubling-at-p` (theorem): stated in the README.
* `L4/dl-padic-l-function` (theorem): stated in the README.
* `L4/dl-vanishing-order-parity` (theorem): stated in the README.
### L4e

* `L4e/ew-setting` (definition): `EWDatum`, `EWDatum.RegularStabilisation`, `EWDatum.stabilisedEigenvalues`, `EWDatum.Tempered`, `EWDatum.slope`, `ew_torus`, `ew_regular_needed`, `ew_split_condition`, `ew_definite`.
* `L4e/ew-siegel-eisenstein-measure` (construction): `EW.siegelMeasure`, `EW.siegelMeasure_moment`, `EW.siegelSection`, `EW.siegelMeasure_qExpansion`, `ewSieg_zero_rank`, `ewSieg_classical_points`, `ewSieg_two_variables`, `ewSieg_not_klingen`.
* `L4e/ew-pullback-and-local-computations` (theorem): stated in the README.
* `L4e/klingen-family` (construction): `EW.klingenMeasure`, `EW.klingenFamily`, `EW.klingenFamily_specialise`, `EW.klingenFamily_eigen`, `EW.klingenFamily_constantTerm`, `klingen_dense_points`, `klingen_r1`, `klingen_zero_slope`, `klingen_not_siegel`.
* `L4e/ew-padic-l-function` (theorem): stated in the README.
* `L4e/constant-term-divisibility` (theorem): stated in the README.
### L0

* `L0/euler-factor-elements` (construction): `EulerFactorElement` (above), `EulerFactorElement.eval` (above), `EulerFactorElement.imprimitive`, `EulerFactorElement.imprimitive_union`, `EulerFactorElement.unit_iff`, `EulerFactorElement.map`, `euler_trivial_polynomial`, `euler_rat_value`, `euler_compat_al5`, `euler_nonunit`.
### L5

* `L5/normalisation-comparisons` (comparison): stated in the README.
* `L5/evaluation-principle-instances` (comparison): stated in the README.
* `L5/cpr-panchishkin-proposition` (definition): `CPRP.periods` (above), `CPRP.hodgePolygon`, `CPRP.newtonPolygon`, `CPRP.admissibility`, `CPRP.modifiedEulerFactor`, `CPRP.statement`, `CPRP.admissibility_twist`, `CPRP.of_measure`, `cprp_tate_motive`, `cprp_ordinary_h_one`, `cprp_supersingular_h_two`, `cprp_no_constructor`.
-/
