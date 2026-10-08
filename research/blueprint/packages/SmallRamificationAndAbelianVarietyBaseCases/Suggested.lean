/-
Copyright (c) 2026 Tau Ceti contributors. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Mathlib.NumberTheory.NumberField.Discriminant.Basic
import Mathlib.NumberTheory.NumberField.Discriminant.Different
import Mathlib.NumberTheory.NumberField.InfinitePlace.TotallyRealComplex
import Mathlib.NumberTheory.NumberField.ClassNumber
import Mathlib.NumberTheory.Padics.PadicNumbers
import Mathlib.NumberTheory.Cyclotomic.Basic
import Mathlib.NumberTheory.Cyclotomic.CyclotomicCharacter
import Mathlib.NumberTheory.Harmonic.EulerMascheroni
import Mathlib.NumberTheory.ModularForms.LevelOne.DimensionFormula
import Mathlib.Analysis.SpecialFunctions.Trigonometric.Arctan
import Mathlib.Analysis.SpecialFunctions.Pow.Real
import Mathlib.Analysis.Convolution
import Mathlib.MeasureTheory.Integral.IntegralEqImproper
import Mathlib.FieldTheory.AbsoluteGaloisGroup
import Mathlib.FieldTheory.Galois.Basic
import Mathlib.FieldTheory.IsAlgClosed.AlgebraicClosure
import Mathlib.RingTheory.RootsOfUnity.AlgebraicallyClosed
import Mathlib.RingTheory.Localization.Away.Basic
import Mathlib.LinearAlgebra.Matrix.GeneralLinearGroup.Defs
import Mathlib.GroupTheory.SpecificGroups.Dihedral
import Mathlib.Topology.Algebra.ContinuousMonoidHom
import Mathlib.AlgebraicGeometry.Morphisms.Etale
import Mathlib.AlgebraicGeometry.Morphisms.ClosedImmersion
import Mathlib.CategoryTheory.Limits.Shapes.BinaryProducts.BinaryFan
import TauCeti.Analysis.PositiveDefinite.AddGroup
import TauCeti.NumberTheory.LocalField.UnitFiltration.Basic
import TauCeti.AlgebraicGeometry.AffineGroupScheme.CartierDuality.FiniteLocallyFree
import TauCeti.AlgebraicGeometry.AffineGroupScheme.CartierDuality.BaseChange
import TauCeti.Algebra.AlgebraicGroup.FunctorOfPoints
import TauCeti.Algebra.AlgebraicGroup.ConstantGroup.Scheme
import TauCeti.Algebra.AlgebraicGroup.RootsOfUnity.Scheme
import TauCeti.AlgebraicGeometry.AbelianVariety.Isogeny
import TauCeti.AlgebraicGeometry.AbelianVariety.End.Basic

/-!
# Small ramification and the base cases of Serre's conjecture — suggested declarations

This file is not the roadmap and is not exhaustive. The roadmap document is definitive.
The statements suggest Lean forms so that contributors converge on names and signatures.
All proposed results are unproved prototypes. The mathematical baseline is Mathlib 082e2d3
and Tau Ceti f790474.
The signatures use `sorry` for unproved results and for explicitly identified data interfaces.

Layers covered:

* R25.1 — explicit discriminant bounds: the local root-discriminant exponent and its 2-adic and
  3-adic bounds (with the Borel normal form of wild images and the unit-filtration power maps),
  the root discriminant of a Galois field, Minkowski thresholds, the Odlyzko kernel, the
  positive-definite ratio `cosh(ax)/cosh(x/2)`, the Poitou–Odlyzko bound with its certified
  integrals and thresholds, the degree bounds used by Schoof, and Fontaine's torsion-field bound;
* R25.2 — level-one residual representations, Tate's theorem, Serre's mod-3 theorem and the
  combined base case, through the Dickson-type subgroup lemmas;
* R25.3 — Fontaine's theorem, through finite flat 2-group schemes over `ℤ`;
* R25.4 — Schoof's category `D(p, l)`, the field criterion for its simple objects and the five
  certified cases;
* R25.5 — abelian varieties of GL₂-type, the class-number and dihedral inputs, and the
  terminal-weight exclusions (weight 2, weight `p + 1`, weight 14 at 11, small weights);
* R25.6 — the base-case table.

Objects owned by other roadmaps appear in one of two forms.

Data placeholders (`def … := sorry`), because the pinned libraries cannot yet build them:

* `differentExponent`, `ramificationIndex`, `discriminantExponent`, `inertiaSubgroup`,
  `wildInertiaSubgroup`, `upperRamificationGroup` — Tau Ceti LocalFieldsRamification, Layer 3;
* `serreWeight` — AlgebraicModularFormsAndSerreWeights R15.4.

Concrete stand-ins, stated here against what Mathlib and Tau Ceti contain, for the owners to
adopt or replace:

* `IsCompletionAbove` — Tau Ceti NumberFieldArithmetic, Layers 5–6;
* `IsIrreducibleSubgroup`, `IsAbsolutelyIrreducible` — ArithmeticGaloisRepresentations R01.1
  (irreducible subgroups also R01.4, Dickson);
* `IsOdd` — ArithmeticGaloisRepresentations R01.4;
* `kernelField`, `IsUnramifiedAt`, `IsTameAt`, `inertiaAbove`, `twist` —
  ArithmeticGaloisRepresentations R01.2;
* `order`, `IsKilledBy`, `IsSimpleGroupScheme`, `IsEtaleGroupScheme`, `IsConstantGroupScheme`,
  `IsDiagonalizableGroupScheme`, `zModScheme`, `muScheme`, `IsShortExact`, `Ext1Vanishes`,
  `points`, `galoisAct`, `torsionField` — FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1, on
  Tau Ceti's `FiniteLocallyFreeCommAffineGroupSchemeCat`, `ConstantGroup.groupScheme` and
  `RootsOfUnityGroup.groupScheme`;
* `HasGoodReductionEverywhere` — NeronModelsAndSemistableAbelianVarieties R11.1;
* `numPoints`, `endZeroAlgebra` — AbelianSchemesAndArithmeticModuli A2–A6, on Tau Ceti's
  `AbelianVariety` and `AbelianVariety.End`; isogenies are Tau Ceti's `IsIsogeny`;
* `modCyclotomicCharacter` — Mathlib's `modularCyclotomicCharacter`.

The explicit formula for the discriminant (AnalyticNumberTheory AN.4) and local class field
theory (Tau Ceti ClassFieldTheory, Layer 7) enter only through proofs, so they have no
placeholder here. The `NumberField` instances on `kernelField` and `torsionField` are true claims
proved by `sorry`, not placeholders.

## Declarations whose conditions cannot yet be stated at the pinned baseline

These mathematical declarations are left out of the Lean code, because a condition they need cannot be
stated with the pinned libraries; their intended signatures are recorded here, in pseudo-Lean.

* Semistable reduction (NeronModelsAndSemistableAbelianVarieties R11.1/R11.3: Néron models or
  the Tate module) is missing, so `IsSemistableGoodOutside l A` ("good reduction at every prime
  `≠ l`, semistable reduction at `l`") cannot be stated. This removes:
  - `torsion_mem_semistableCategory (l p : ℕ) [Fact l.Prime] [Fact p.Prime] (hlp : l ≠ p)
    (A : AbelianVariety ℚ) (hA : IsSemistableGoodOutside l A) (n : ℕ) (hn : 1 ≤ n) :
    SemistableCategory p l 𝒜[p ^ n] ∧ order 𝒜[p ^ n] = p ^ (2 * dim A * n)`, which also needs the
    abelian scheme `𝒜` over `ℤ[1/l]` and its torsion subgroup schemes;
  - `no_semistable_of_simple_and_ext (l p : ℕ) [Fact l.Prime] [Fact p.Prime] (hlp : l ≠ p)
    (hsimple : ∀ G, SemistableCategory p l G → IsSimpleGroupScheme G → order G ≠ 1 →
      Nonempty (G ≅ zModScheme _ p) ∨ Nonempty (G ≅ muScheme _ p))
    (hext : Ext1Vanishes (muScheme _ p) (zModScheme _ p))
    (A : AbelianVariety ℚ) (hA : IsSemistableGoodOutside l A) : A.dim = 0` (Schoof, Prop. 3.1);
  - `no_semistable_abelianVariety_one_prime (l : ℕ) (hl : l ∈ ({2, 3, 5, 7, 13} : Finset ℕ))
    (A : AbelianVariety ℚ) (hA : IsSemistableGoodOutside l A) : A.dim = 0` (Schoof, Thm 1.1).
* The rational Tate module `V_p(A)` with its `G_F`- and `End⁰(A)`-actions
  (AbelianSchemesAndArithmeticModuli A6) is missing, so the λ-adic representations of a GL₂-type
  abelian variety cannot be built. This removes:
  - `IsGL2Type.lambdaAdicRep (h : IsGL2Type A K) (v : HeightOneSpectrum (𝓞 K)) :
    ContinuousMonoidHom (Field.absoluteGaloisGroup F) (GL (Fin 2) (v.adicCompletion K))`;
  - `IsGL2Type.finrank_lambdaAdicRep : finrank (v.adicCompletion K) V_v(A) = 2`;
  - `IsGL2Type.free_tateModule : Module.Free (K ⊗[ℚ] ℚ_[p]) V_p(A) ∧
    finrank (K ⊗[ℚ] ℚ_[p]) V_p(A) = 2`;
  - `ComesFromGL2Type (p : ℕ) (ρ : ContinuousMonoidHom (Field.absoluteGaloisGroup F)
    (GL (Fin 2) (PadicAlgCl p))) : Prop := ∃ K A (h : IsGL2Type A K) v
    (j : v.adicCompletion K →+* PadicAlgCl p), ρ is GL₂-conjugate to j ∘ h.lambdaAdicRep v`;
  - the half of `IsGL2Type.baseChange` asserting `V_v(A_{F'}) ≅ V_v(A)|G_{F'}`;
  - `comesFromGL2Type_of_restrict (ρ) (hρ : irreducible) (F'/F finite)
    (h' : ρ|G_{F'} irreducible) (hF' : ComesFromGL2Type p (ρ|G_{F'})) : ComesFromGL2Type p ρ`
    (Snowden, Lemma 9.4.4).
* p-adic Hodge theory (de Rham, crystalline and semistable representations, Hodge–Tate
  weights, Weil–Deligne types: PotentialModularityAndCompatibleSystems R24,
  AutomorphicGaloisRepresentations R19) is missing. This removes:
  - `comesFromGL2Type_of_weightTwo (p : ℕ) [Fact p.Prime] (hp : p ≠ 2) (ρ : G_ℚ → GL₂(ℚ̄_p))
    (hρ : continuous, finitely ramified, odd, de Rham with Hodge–Tate weights {0, -1})
    (hA1 : SatisfiesA1Residual p ρ̄) : ComesFromGL2Type p ρ` (Snowden, Prop. 9.4.1);
  - `reduction_of_comesFromGL2Type`: for `A` of GL₂(K)-type realising `ρ`: unramified at `ℓ ≠ p`
    gives good reduction at `ℓ`, unipotent Weil–Deligne monodromy gives semistable reduction,
    crystalline at `p` gives good reduction at `p`, semistable of Steinberg type gives
    multiplicative reduction (the Steinberg twist has unramified semisimple part), and
    `A.dim = finrank ℚ K ≥ 1`;
  - `no_levelOne_crystalline_of_reducible_terminal ((p, k) ∈ {(3, 2), (3, 4), (5, 6), (7, 8),
    (13, 14)}) (ρ : G_ℚ → GL₂(ℚ̄_p)) (hρ : odd, irreducible, unramified outside p, crystalline at
    p with Hodge–Tate weights {0, k − 1}) (hred : ρ̄ reducible) : False`;
  - `paso_six`: for an almost strictly compatible system `{ρ_ℓ}` with empty ramification set and
    `ρ̄₅` irreducible, `k(ρ̄₅) ∈ {2, 4}` gives a modular 3-adic member and `k(ρ̄₅) = 6` does not
    occur (DP23, Paso 6).
-/

noncomputable section

open NumberField NumberField.InfinitePlace Module Polynomial MeasureTheory Set Filter Topology
open CategoryTheory CategoryTheory.Limits AlgebraicGeometry
open scoped Real TensorProduct CategoryTheory.MonObj

namespace TauCeti.SmallRamification

/-! ## Imported local invariants (data placeholders; LocalFieldsRamification, Layer 3) -/

/-- LocalFieldsRamification Layer 3 (placeholder): the different exponent
`d(E/K) = v_E(𝔡_{E/K})` of a finite extension `E/K` of `p`-adic fields. -/
def differentExponent (K E : Type*) [Field K] [Field E] [Algebra K E] [FiniteDimensional K E] :
    ℕ := sorry

/-- LocalFieldsRamification Layer 3 (placeholder): the ramification index `e(E/K) ≥ 1`. -/
def ramificationIndex (K E : Type*) [Field K] [Field E] [Algebra K E] [FiniteDimensional K E] :
    ℕ := sorry

/-- LocalFieldsRamification Layer 3 (placeholder): the discriminant exponent
`v_K(disc(E/K)) = f(E/K) · d(E/K)`. -/
def discriminantExponent (K E : Type*) [Field K] [Field E] [Algebra K E]
    [FiniteDimensional K E] : ℕ := sorry

/-- LocalFieldsRamification Layer 3 (placeholder): the inertia subgroup `G_0` of `Gal(E/K)`. -/
def inertiaSubgroup (K E : Type*) [Field K] [Field E] [Algebra K E] [FiniteDimensional K E] :
    Subgroup (E ≃ₐ[K] E) := sorry

/-- LocalFieldsRamification Layer 3 (placeholder): the wild inertia subgroup `G_1`, the
`p`-Sylow subgroup of the inertia subgroup. -/
def wildInertiaSubgroup (K E : Type*) [Field K] [Field E] [Algebra K E]
    [FiniteDimensional K E] : Subgroup (E ≃ₐ[K] E) := sorry

/-- LocalFieldsRamification Layer 3 (placeholder): the upper-numbering ramification group
`G^u` of `Gal(E/K)`. -/
def upperRamificationGroup (K E : Type*) [Field K] [Field E] [Algebra K E]
    [FiniteDimensional K E] (u : ℚ) : Subgroup (E ≃ₐ[K] E) := sorry

/-! ## R25.1 — the local root-discriminant exponent -/

section Local

variable (p : ℕ) [Fact p.Prime] (E : Type*) [Field E] [Algebra ℚ_[p] E]
  [FiniteDimensional ℚ_[p] E]

/-- `δ(E) = d(E/ℚ_p)/e(E/ℚ_p)`, the different normalised by `v_p(p) = 1` (Jones's mean slope). -/
def localRootDiscrExp : ℚ :=
  (differentExponent ℚ_[p] E : ℚ) / ramificationIndex ℚ_[p] E

theorem localRootDiscrExp_eq_discriminantExponent_div :
    localRootDiscrExp p E = (discriminantExponent ℚ_[p] E : ℚ) / finrank ℚ_[p] E := sorry

/-- The upper-numbering form: a sum over the jumps `u ≥ 0` of the upper filtration (the summand
vanishes away from the jumps, where `G^{u+} = G^u`). The right limit is the supremum of
the groups at `v > u`, since the filtration decreases and is locally constant to the right. -/
theorem localRootDiscrExp_eq_sum_upper [IsGalois ℚ_[p] E] :
    localRootDiscrExp p E =
      ∑ᶠ (u : ℚ) (_ : 0 ≤ u),
        (1 / (Nat.card ((⨆ (v : ℚ) (_ : u < v), upperRamificationGroup ℚ_[p] E v :
            Subgroup (E ≃ₐ[ℚ_[p]] E))) : ℚ) -
          1 / (Nat.card (upperRamificationGroup ℚ_[p] E u) : ℚ)) * (u + 1) := sorry

theorem localRootDiscrExp_eq_zero_iff :
    localRootDiscrExp p E = 0 ↔ ramificationIndex ℚ_[p] E = 1 := sorry

theorem localRootDiscrExp_of_tame (h : ¬ p ∣ ramificationIndex ℚ_[p] E) :
    localRootDiscrExp p E = 1 - 1 / (ramificationIndex ℚ_[p] E : ℚ) := sorry

theorem localRootDiscrExp_of_isUnramified (E' : Type*) [Field E'] [Algebra ℚ_[p] E']
    [FiniteDimensional ℚ_[p] E'] [Algebra E E'] [IsScalarTower ℚ_[p] E E']
    [FiniteDimensional E E'] (h : ramificationIndex E E' = 1) :
    localRootDiscrExp p E' = localRootDiscrExp p E := sorry

theorem localRootDiscrExp_congr (E' : Type*) [Field E'] [Algebra ℚ_[p] E']
    [FiniteDimensional ℚ_[p] E'] (e : E ≃ₐ[ℚ_[p]] E') :
    localRootDiscrExp p E' = localRootDiscrExp p E := sorry

theorem localRootDiscrExp_tower (E' : Type*) [Field E'] [Algebra ℚ_[p] E']
    [FiniteDimensional ℚ_[p] E'] [Algebra E E'] [IsScalarTower ℚ_[p] E E']
    [FiniteDimensional E E'] :
    localRootDiscrExp p E' =
        localRootDiscrExp p E + (differentExponent E E' : ℚ) / ramificationIndex ℚ_[p] E' ∧
      localRootDiscrExp p E ≤ localRootDiscrExp p E' := sorry

end Local

/-- `localRootDiscrExp_two_adic_i` (computation): `δ(ℚ₂(√−1)) = 1`. -/
example (E : Type*) [Field E] [Algebra ℚ_[2] E] [FiniteDimensional ℚ_[2] E]
    [IsSplittingField ℚ_[2] E (X ^ 2 + 1)] : localRootDiscrExp 2 E = 1 := sorry

/-- `localRootDiscrExp_two_adic_sqrt_two` (computation): `δ(ℚ₂(√2)) = 3/2`; the undivided
different exponent and the discriminant exponent are both `3`. -/
example (E : Type*) [Field E] [Algebra ℚ_[2] E] [FiniteDimensional ℚ_[2] E]
    [IsSplittingField ℚ_[2] E (X ^ 2 - 2)] : localRootDiscrExp 2 E = 3 / 2 := sorry

/-- `localRootDiscrExp_two_adic_zeta_twelve` (computation): `δ(ℚ₂(ζ₁₂)) = 1`, with `e = f = 2`;
this separates `e` from `[E : ℚ₂]`. -/
example (E : Type*) [Field E] [Algebra ℚ_[2] E] [FiniteDimensional ℚ_[2] E]
    [IsCyclotomicExtension {12} ℚ_[2] E] : localRootDiscrExp 2 E = 1 := sorry

/-- `localRootDiscrExp_three_adic_pure_cubic` (computation): `δ(ℚ₃(ζ₃, ∛3)) = 11/6`. -/
example (E : Type*) [Field E] [Algebra ℚ_[3] E] [FiniteDimensional ℚ_[3] E]
    [IsSplittingField ℚ_[3] E (X ^ 3 - 3)] : localRootDiscrExp 3 E = 11 / 6 := sorry

/-- `localRootDiscrExp_self` (degenerate): `δ(ℚ_p) = 0`, and `δ = 0` for the unramified
quadratic extension `ℚ_p(ζ_{p²−1})`. -/
example (p : ℕ) [Fact p.Prime] : localRootDiscrExp p ℚ_[p] = 0 ∧
    ∀ (E : Type) [Field E] [Algebra ℚ_[p] E] [FiniteDimensional ℚ_[p] E]
      [IsCyclotomicExtension {p ^ 2 - 1} ℚ_[p] E], localRootDiscrExp p E = 0 := sorry

/-! ## R25.1 — the root discriminant of a Galois field -/

/-- NumberFieldArithmetic Layers 5–6 (stand-in): `E` is the completion of `K` at a prime above
`p`, in the form "there is an embedding `K → E` whose image generates `E` over `ℚ_p`". -/
def IsCompletionAbove (K : Type*) [Field K] (p : ℕ) [Fact p.Prime] (E : Type*) [Field E]
    [Algebra ℚ_[p] E] : Prop :=
  ∃ φ : K →+* E, IntermediateField.adjoin ℚ_[p] (Set.range φ) = ⊤

/-- The local form: `v_p(|d_K|) = [K : ℚ] · δ(K_𝔭)` for `K/ℚ` Galois. -/
theorem padicValInt_discr_eq_finrank_mul_localRootDiscrExp (K : Type*) [Field K]
    [NumberField K] [IsGalois ℚ K] (p : ℕ) [Fact p.Prime] (E : Type*) [Field E]
    [Algebra ℚ_[p] E] [FiniteDimensional ℚ_[p] E] (hE : IsCompletionAbove K p E) :
    (padicValInt p (discr K) : ℚ) = finrank ℚ K * localRootDiscrExp p E := sorry

/-- `rd_K = ∏_{p ∣ d_K} p^{δ(K_𝔭)}` for `K/ℚ` Galois, where `δ p` is the exponent at any
completion above `p` (it does not depend on the completion). -/
theorem rootDiscr_eq_prod_rpow_localRootDiscrExp (K : Type*) [Field K] [NumberField K]
    [IsGalois ℚ K] (δ : ℕ → ℚ)
    (hδ : ∀ (p : ℕ) [Fact p.Prime] (E : Type) [Field E] [Algebra ℚ_[p] E]
      [FiniteDimensional ℚ_[p] E], IsCompletionAbove K p E → δ p = localRootDiscrExp p E) :
    rootDiscr K = ∏ p ∈ (discr K).natAbs.primeFactors, (p : ℝ) ^ (δ p : ℝ) := sorry

/-- The one-prime case: if `K/ℚ` is Galois and unramified outside `p`, `rd_K = p^{δ(K_𝔭)}`. -/
theorem rootDiscr_eq_rpow_localRootDiscrExp_of_unramifiedOutside (K : Type*) [Field K]
    [NumberField K] [IsGalois ℚ K] (p : ℕ) [Fact p.Prime]
    (hK : ∀ ℓ : ℕ, ℓ.Prime → ℓ ≠ p → ¬ (ℓ : ℤ) ∣ discr K)
    (E : Type*) [Field E] [Algebra ℚ_[p] E] [FiniteDimensional ℚ_[p] E]
    (hE : IsCompletionAbove K p E) :
    rootDiscr K = (p : ℝ) ^ (localRootDiscrExp p E : ℝ) := sorry

/-! ## R25.1 — local images in residual characteristic `2` and `3` -/

/-- Local abelian quotients of order prime to `p`: for `E/K` Galois with `K/ℚ_p` finite with
residue field of `q = p ^ f` elements (`f = [K : ℚ_p]/e(K/ℚ_p)`), `ψ` kills the wild inertia,
the image of the inertia is cyclic, and its elements have order dividing `q − 1`. -/
theorem orderOf_map_inertia_dvd_card_residueField_sub_one (p : ℕ) [Fact p.Prime]
    (K : Type*) [Field K] [Algebra ℚ_[p] K] [FiniteDimensional ℚ_[p] K]
    (E : Type*) [Field E] [Algebra K E] [FiniteDimensional K E] [IsGalois K E]
    {B : Type*} [CommGroup B] [Finite B] (hB : Nat.Coprime (Nat.card B) p)
    (ψ : (E ≃ₐ[K] E) →* B) :
    (∀ σ ∈ wildInertiaSubgroup K E, ψ σ = 1) ∧ IsCyclic ((inertiaSubgroup K E).map ψ) ∧
      ∀ σ ∈ inertiaSubgroup K E,
        orderOf (ψ σ) ∣ p ^ (finrank ℚ_[p] K / ramificationIndex ℚ_[p] K) - 1 := sorry

/-- Wild local images of mod-`p` representations are Borel: after conjugation in `GL₂(F̄)` the
image is upper triangular, the wild inertia is unipotent of exponent `p`, and `I = P` if
`p = 2`. -/
theorem exists_upperTriangular_of_wildInertia_ne_bot (p : ℕ) [Fact p.Prime] {F : Type*}
    [Field F] [Fintype F] [CharP F p] (E : Type*) [Field E] [Algebra ℚ_[p] E]
    [FiniteDimensional ℚ_[p] E] [IsGalois ℚ_[p] E] (emb : (E ≃ₐ[ℚ_[p]] E) →* GL (Fin 2) F)
    (hemb : Function.Injective emb) (hP : wildInertiaSubgroup ℚ_[p] E ≠ ⊥) :
    ∃ g : GL (Fin 2) (AlgebraicClosure F),
      let M : (E ≃ₐ[ℚ_[p]] E) → Matrix (Fin 2) (Fin 2) (AlgebraicClosure F) := fun σ =>
        ((g * Matrix.GeneralLinearGroup.map (algebraMap F (AlgebraicClosure F)) (emb σ) * g⁻¹ :
          GL (Fin 2) (AlgebraicClosure F)) : Matrix (Fin 2) (Fin 2) (AlgebraicClosure F))
      (∀ σ, M σ 1 0 = 0) ∧
        (∀ σ ∈ wildInertiaSubgroup ℚ_[p] E, M σ 0 0 = 1 ∧ M σ 1 1 = 1 ∧ σ ^ p = 1) ∧
        (p = 2 → inertiaSubgroup ℚ_[p] E = wildInertiaSubgroup ℚ_[p] E) := sorry

/-- Part (a) of the unit-filtration lemma: over an unramified extension of `ℚ₂`,
`U^{(3)} ⊆ (U^{(1)})²`. The compatibility of the valuative structure of `E` with its
`ℚ₂`-algebra structure is expressed by continuity of the algebra map. -/
theorem principalUnits_pow_subset (E : Type*) [Field E] [ValuativeRel E] [TopologicalSpace E]
    [IsNonarchimedeanLocalField E] [Algebra ℚ_[2] E] [FiniteDimensional ℚ_[2] E]
    (hcont : Continuous (algebraMap ℚ_[2] E)) (hE : ramificationIndex ℚ_[2] E = 1) :
    TauCeti.unitFiltration E 3 ≤ (TauCeti.unitFiltration E 1).map (powMonoidHom 2) := sorry

/-- Part (b): over an unramified extension of `ℚ₃`, `U^{(2)} ⊆ (U^{(1)})³`. -/
theorem unitFiltration_two_le_map_pow_three (E : Type*) [Field E] [ValuativeRel E]
    [TopologicalSpace E] [IsNonarchimedeanLocalField E] [Algebra ℚ_[3] E]
    [FiniteDimensional ℚ_[3] E] (hcont : Continuous (algebraMap ℚ_[3] E))
    (hE : ramificationIndex ℚ_[3] E = 1) :
    TauCeti.unitFiltration E 2 ≤ (TauCeti.unitFiltration E 1).map (powMonoidHom 3) := sorry

/-- Part (c): if `e(E/ℚ₃) = 2` then `(U^{(1)})³ ⊆ U^{(3)}` and `U^{(4)} ⊆ (U^{(1)})³`. -/
theorem unitFiltration_pow_three_of_ramificationIndex_eq_two (E : Type*) [Field E]
    [ValuativeRel E] [TopologicalSpace E] [IsNonarchimedeanLocalField E] [Algebra ℚ_[3] E]
    [FiniteDimensional ℚ_[3] E] (hcont : Continuous (algebraMap ℚ_[3] E))
    (hE : ramificationIndex ℚ_[3] E = 2) :
    (TauCeti.unitFiltration E 1).map (powMonoidHom 3) ≤ TauCeti.unitFiltration E 3 ∧
      TauCeti.unitFiltration E 4 ≤ (TauCeti.unitFiltration E 1).map (powMonoidHom 3) := sorry

/-- Tate's 2-adic bound, sharpened: `δ(E) ≤ 2` for a field cut out by a mod-2 representation. -/
theorem localRootDiscrExp_le_two_of_char_two (E : Type*) [Field E] [Algebra ℚ_[2] E]
    [FiniteDimensional ℚ_[2] E] [IsGalois ℚ_[2] E] {F : Type*} [Field F] [Fintype F]
    [CharP F 2] (emb : (E ≃ₐ[ℚ_[2]] E) →* GL (Fin 2) F) (hemb : Function.Injective emb) :
    localRootDiscrExp 2 E ≤ 2 := sorry

/-- The dihedral refinement: `δ ≤ 3/2` when the wild inertia has order at most `2`. -/
theorem localRootDiscrExp_le_three_halves_of_char_two (E : Type*) [Field E]
    [Algebra ℚ_[2] E] [FiniteDimensional ℚ_[2] E] [IsGalois ℚ_[2] E] {F : Type*} [Field F]
    [Fintype F] [CharP F 2] (emb : (E ≃ₐ[ℚ_[2]] E) →* GL (Fin 2) F)
    (hemb : Function.Injective emb) (hP : Nat.card (wildInertiaSubgroup ℚ_[2] E) ≤ 2) :
    localRootDiscrExp 2 E ≤ 3 / 2 := sorry

/-- The 3-adic bound `δ ≤ 13/6 − 1/|P|` for wild `E`. -/
theorem localRootDiscrExp_le_of_char_three (E : Type*) [Field E] [Algebra ℚ_[3] E]
    [FiniteDimensional ℚ_[3] E] [IsGalois ℚ_[3] E] {F : Type*} [Field F] [Fintype F]
    [CharP F 3] (emb : (E ≃ₐ[ℚ_[3]] E) →* GL (Fin 2) F) (hemb : Function.Injective emb)
    (hP : wildInertiaSubgroup ℚ_[3] E ≠ ⊥) :
    localRootDiscrExp 3 E ≤
      13 / 6 - 1 / (Nat.card (wildInertiaSubgroup ℚ_[3] E) : ℚ) := sorry

/-! ## R25.1 — global lower bounds -/

section Minkowski

variable (K : Type*) [Field K] [NumberField K]

theorem two_lt_rootDiscr (h : 3 ≤ finrank ℚ K) : 2 < rootDiscr K := sorry

theorem three_lt_rootDiscr (h : 6 ≤ finrank ℚ K) : 3 < rootDiscr K := sorry

theorem four_lt_rootDiscr (h : 12 ≤ finrank ℚ K) : 4 < rootDiscr K := sorry

end Minkowski

/-- The kernel `g(x) = (1 − |x|) cos πx + sin π|x| / π` on `[−1, 1]`, zero outside. -/
def odlyzkoKernel (x : ℝ) : ℝ :=
  if |x| ≤ 1 then (1 - |x|) * Real.cos (π * x) + Real.sin (π * |x|) / π else 0

theorem odlyzkoKernel_eq_two_mul_convolution :
    odlyzkoKernel = 2 • MeasureTheory.convolution
      (Set.indicator (Set.Icc (-(1 / 2)) (1 / 2)) fun y => Real.cos (π * y))
      (Set.indicator (Set.Icc (-(1 / 2)) (1 / 2)) fun y => Real.cos (π * y))
      (ContinuousLinearMap.mul ℝ ℝ) volume := sorry

theorem odlyzkoKernel_nonneg (x : ℝ) : 0 ≤ odlyzkoKernel x := sorry

@[simp] theorem odlyzkoKernel_zero : odlyzkoKernel 0 = 1 := sorry

@[simp] theorem odlyzkoKernel_neg (x : ℝ) : odlyzkoKernel (-x) = odlyzkoKernel x := sorry

theorem odlyzkoKernel_eq_zero_of_one_le_abs {x : ℝ} (hx : 1 ≤ |x|) :
    odlyzkoKernel x = 0 := sorry

theorem isPositiveDefiniteSub_odlyzkoKernel :
    TauCeti.IsPositiveDefiniteSub fun x : ℝ => (odlyzkoKernel x : ℂ) := sorry

theorem contDiff_odlyzkoKernel : ContDiff ℝ 1 odlyzkoKernel := sorry

theorem integral_odlyzkoKernel_Ioi : (∫ x in Ioi (0 : ℝ), odlyzkoKernel x) = 4 / π ^ 2 := sorry

/-- `odlyzkoKernel_zero` (computation): `g(0) = 1`, the normalisation `F(0) = 1`. -/
example : odlyzkoKernel 0 = 1 := odlyzkoKernel_zero

/-- `odlyzkoKernel_half` (computation): `g(1/2) = 1/π`. -/
example : odlyzkoKernel (1 / 2) = 1 / π := sorry

/-- `odlyzkoKernel_three_quarters_pos` (non-example): `g(3/4) > 0`; the variant without the
sine term is negative there. -/
example : 0 < odlyzkoKernel (3 / 4) := sorry

/-- `odlyzkoKernel_one` (degenerate): the support is `[−1, 1]`. -/
example : odlyzkoKernel 1 = 0 ∧ odlyzkoKernel 2 = 0 := sorry

/-- `integral_odlyzkoKernel_Ioi` (computation): `∫₀^∞ g = 4/π²`; the variant with `sin π|x|` in
place of `sin π|x| / π` integrates to `2/π² + 2/π`. -/
example : (∫ x in Ioi (0 : ℝ), odlyzkoKernel x) = 4 / π ^ 2 := integral_odlyzkoKernel_Ioi

/-- `odlyzkoKernel_neg_half` (non-example): `g(−1/2) = 1/π`; the variant with `sin πx / π` is
not even and gives `−1/π`. -/
example : odlyzkoKernel (-(1 / 2)) = 1 / π := sorry

/-- `x ↦ cosh(ax)/cosh(x/2)` is positive definite for `|a| ≤ 1/2`. -/
theorem isPositiveDefiniteSub_cosh_div_cosh {a : ℝ} (ha : |a| ≤ 1 / 2) :
    TauCeti.IsPositiveDefiniteSub fun x : ℝ =>
      ((Real.cosh (a * x) / Real.cosh (x / 2) : ℝ) : ℂ) := sorry

/-- Positivity of `F = f/cosh(x/2)` on the critical strip. -/
theorem re_poitouTransform_nonneg (f : ℝ → ℝ) (hf_even : ∀ x, f (-x) = f x)
    (hf_cont : Continuous f) (hf_supp : HasCompactSupport f) (hf_nonneg : ∀ x, 0 ≤ f x)
    (hf_pd : TauCeti.IsPositiveDefiniteSub fun x => (f x : ℂ)) {s : ℂ}
    (hs₀ : 0 ≤ s.re) (hs₁ : s.re ≤ 1) :
    0 ≤ (∫ x : ℝ, ((f x / Real.cosh (x / 2) : ℝ) : ℂ) * Complex.exp ((s - 1 / 2) * x)).re :=
  sorry

/-- The test function `F_b(x) = g(x/b)/cosh(x/2)`. -/
def poitouTestFunction (b x : ℝ) : ℝ := odlyzkoKernel (x / b) / Real.cosh (x / 2)

/-- `P(n, r₁, b) = r₁π/2 + n(γ + log 8π) − n·I₁(b) − r₁·I₂(b) − 16b/π²`: the explicit-formula
lower bound with the zero and prime sums removed. Every integral is parenthesised. -/
def poitouLowerBound (n r₁ : ℕ) (b : ℝ) : ℝ :=
  r₁ * π / 2 + n * (Real.eulerMascheroniConstant + Real.log (8 * π))
    - n * (∫ x in Ioi (0 : ℝ), (1 - poitouTestFunction b x) / (2 * Real.sinh (x / 2)))
    - r₁ * (∫ x in Ioi (0 : ℝ), (1 - poitouTestFunction b x) / (2 * Real.cosh (x / 2)))
    - 16 * b / π ^ 2

theorem integrableOn_poitouIntegrand_sinh {b : ℝ} (hb : 0 < b) :
    IntegrableOn (fun x => (1 - poitouTestFunction b x) / (2 * Real.sinh (x / 2))) (Ioi 0) ∧
      IntegrableOn (fun x => (1 - poitouTestFunction b x) / (2 * Real.cosh (x / 2)))
        (Ioi 0) := sorry

/-- The pole term `16b/π²` is `4 ∫₀^∞ F_b(x) cosh(x/2) dx`. -/
theorem poitouLowerBound_eq_explicit (n r₁ : ℕ) {b : ℝ} (hb : 0 < b) :
    poitouLowerBound n r₁ b =
      r₁ * π / 2 + n * (Real.eulerMascheroniConstant + Real.log (8 * π))
        - n * (∫ x in Ioi (0 : ℝ), (1 - poitouTestFunction b x) / (2 * Real.sinh (x / 2)))
        - r₁ * (∫ x in Ioi (0 : ℝ), (1 - poitouTestFunction b x) / (2 * Real.cosh (x / 2)))
        - 4 * (∫ x in Ioi (0 : ℝ), poitouTestFunction b x * Real.cosh (x / 2)) := sorry

theorem poitouIntegral_sinh_eq {b : ℝ} (hb : 0 < b) :
    (∫ x in Ioi (0 : ℝ), (1 - poitouTestFunction b x) / (2 * Real.sinh (x / 2))) =
      (∫ x in (0 : ℝ)..b, (1 - poitouTestFunction b x) / (2 * Real.sinh (x / 2)))
        - Real.log (Real.tanh (b / 4)) := sorry

theorem poitouLowerBound_div_mono {b : ℝ} (hb : 0 < b) {n m : ℕ} (hn : 0 < n)
    (hnm : n ≤ m) : poitouLowerBound n 0 b / n ≤ poitouLowerBound m 0 b / m := sorry

/-- Certified upper bounds `I₁(13/2) < 1.04` and `I₁(8) < 0.94`. -/
theorem poitouIntegral_sinh_lt :
    (∫ x in Ioi (0 : ℝ), (1 - poitouTestFunction (13 / 2) x) / (2 * Real.sinh (x / 2))) <
        1.04 ∧
      (∫ x in Ioi (0 : ℝ), (1 - poitouTestFunction 8 x) / (2 * Real.sinh (x / 2))) < 0.94 :=
  sorry

/-- `poitouLowerBound_rat_nonpos` (computation): for `ℚ` the bound is nonpositive at
`b ∈ {1/2, 1, 2}` (numerically `−0.051`, `−0.083`, `−0.883`). -/
example : ∀ b ∈ ({1 / 2, 1, 2} : Set ℝ), poitouLowerBound 1 1 b ≤ 0 := sorry

/-- `poitouLowerBound_sqrt_neg_three` (computation): `ℚ(√−3)` has `|d| = 3`; the reversed pole
sign would violate this. -/
example : poitouLowerBound 2 0 1 ≤ Real.log 3 := sorry

/-- `poitouLowerBound_sqrt_five` (computation): `ℚ(√5)` has `|d| = 5`; this checks the `r₁`
terms. -/
example : poitouLowerBound 2 2 (3 / 2) ≤ Real.log 5 := sorry

/-- `poitouLowerBound_div_mono` (degenerate): at fixed `b > 0` the normalised bound tends to
`γ + log 8π − I₁(b)`, which lies below `log(4πe^γ)`. -/
example {b : ℝ} (hb : 0 < b) :
    Tendsto (fun n : ℕ => poitouLowerBound n 0 b / n) atTop
      (𝓝 (Real.eulerMascheroniConstant + Real.log (8 * π) -
        (∫ x in Ioi (0 : ℝ), (1 - poitouTestFunction b x) / (2 * Real.sinh (x / 2))))) ∧
    Real.eulerMascheroniConstant + Real.log (8 * π) -
        (∫ x in Ioi (0 : ℝ), (1 - poitouTestFunction b x) / (2 * Real.sinh (x / 2))) <
      Real.log (4 * π * Real.exp Real.eulerMascheroniConstant) := sorry

/-- `poitouLowerBound_one_one_one_bounds` (computation): `−0.09 < P(1, 1, 1) < −0.08`; the
variants with `log 4π` or without `r₁π/2` fail the lower bound. -/
example : -0.09 < poitouLowerBound 1 1 1 ∧ poitouLowerBound 1 1 1 < -0.08 := sorry

/-- The Odlyzko–Poitou unconditional bound. -/
theorem poitouLowerBound_le_log_abs_discr (K : Type*) [Field K] [NumberField K] {b : ℝ}
    (hb : 0 < b) :
    poitouLowerBound (finrank ℚ K) (nrRealPlaces K) b ≤ Real.log |(discr K : ℝ)| := sorry

theorem ten_lt_rootDiscr_of_isTotallyComplex (K : Type*) [Field K] [NumberField K]
    [IsTotallyComplex K] (h : 24 ≤ finrank ℚ K) : 10 < rootDiscr K := sorry

theorem twelve_lt_rootDiscr_of_isTotallyComplex (K : Type*) [Field K] [NumberField K]
    [IsTotallyComplex K] (h : 36 ≤ finrank ℚ K) : 12 < rootDiscr K := sorry

/-- The certified degree bounds (a)–(j) for totally complex fields used by Schoof's cases. -/
theorem finrank_le_of_rootDiscr_lt_of_isTotallyComplex (K : Type*) [Field K] [NumberField K]
    [IsTotallyComplex K] :
    (rootDiscr K < 8.25 → finrank ℚ K ≤ 14) ∧ (rootDiscr K < 6.93 → finrank ℚ K ≤ 10) ∧
      (rootDiscr K < 8.95 → finrank ℚ K ≤ 19) ∧ (rootDiscr K < 19.02 → finrank ℚ K ≤ 287) ∧
      (rootDiscr K < 14.43 → finrank ℚ K ≤ 59) ∧ (rootDiscr K ≤ 5.72 → finrank ℚ K ≤ 8) ∧
      (rootDiscr K ≤ 4.48 → finrank ℚ K ≤ 5) ∧ (rootDiscr K ≤ 13.19 → finrank ℚ K ≤ 43) ∧
      (rootDiscr K ≤ 16.83 → finrank ℚ K ≤ 119) ∧ (rootDiscr K ≤ 10.199 → finrank ℚ K ≤ 23) :=
  sorry

/-! ## R25.2 — residual representations and the Tate–Serre base case -/

/-- An element of `G_ℚ` as an automorphism of `ℚ̄`. -/
abbrev galAut (σ : Field.absoluteGaloisGroup ℚ) : AlgebraicClosure ℚ ≃ₐ[ℚ] AlgebraicClosure ℚ :=
  σ

/-- A residual representation: a continuous homomorphism `G_ℚ → GL₂(F)`. -/
abbrev ResidualRep (F : Type*) [Field F] [TopologicalSpace F] :=
  ContinuousMonoidHom (Field.absoluteGaloisGroup ℚ) (GL (Fin 2) F)

/-- R01.1/R01.4 (stand-in): a subgroup of `GL₂(K)` with no common eigenline in `K²`. -/
def IsIrreducibleSubgroup {K : Type*} [Field K] (G : Subgroup (GL (Fin 2) K)) : Prop :=
  ∀ v : Fin 2 → K, v ≠ 0 → ∃ g ∈ G, ∀ c : K, (g : Matrix (Fin 2) (Fin 2) K).mulVec v ≠ c • v

/-- The subfield `ℚ(ζ_n)` of `ℚ̄`. -/
def cyclotomicSubfield (n : ℕ) : IntermediateField ℚ (AlgebraicClosure ℚ) :=
  IntermediateField.adjoin ℚ {x | x ^ n = 1}

/-- R01.2 (stand-in): the union of the inertia groups of the primes of `ℚ̄` above `ℓ`; `σ` is in
the inertia group of `P` when `σ x − x ∈ P` for every algebraic integer `x`. -/
def inertiaAbove (ℓ : ℕ) : Set (Field.absoluteGaloisGroup ℚ) :=
  {σ | ∃ P : Ideal (integralClosure ℤ (AlgebraicClosure ℚ)), P.IsMaximal ∧
    (ℓ : integralClosure ℤ (AlgebraicClosure ℚ)) ∈ P ∧
    ∀ x : integralClosure ℤ (AlgebraicClosure ℚ), ∃ y ∈ P,
      (y : AlgebraicClosure ℚ) = galAut σ x - x}

/-- The mod-`p` cyclotomic character `ω : G_ℚ → 𝔽_p^× ⊆ F^×` (Mathlib's
`modularCyclotomicCharacter`). -/
def modCyclotomicCharacter (p : ℕ) [Fact p.Prime] (F : Type*) [Field F] [CharP F p] :
    Field.absoluteGaloisGroup ℚ →* Fˣ :=
  (Units.map (ZMod.castHom (dvd_refl p) F).toMonoidHom).comp
    ((modularCyclotomicCharacter (AlgebraicClosure ℚ) (n := p)
      (HasEnoughRootsOfUnity.natCard_rootsOfUnity _ _)).comp
      { toFun := fun σ => (galAut σ).toRingEquiv
        map_one' := rfl
        map_mul' := fun _ _ => rfl })

section Residual

variable {F : Type*} [Field F] [Fintype F] [TopologicalSpace F] [DiscreteTopology F]

/-- The image of a subgroup `H ⊆ G_ℚ` in `GL₂(F̄)`. -/
def imageOver (ρ : ResidualRep F) (H : Subgroup (Field.absoluteGaloisGroup ℚ)) :
    Subgroup (GL (Fin 2) (AlgebraicClosure F)) :=
  H.map ((Matrix.GeneralLinearGroup.map (algebraMap F (AlgebraicClosure F))).comp
    ρ.toMonoidHom)

/-- R01.1 (stand-in): `ρ` is irreducible after extending scalars to `F̄`. -/
def IsAbsolutelyIrreducible (ρ : ResidualRep F) : Prop :=
  IsIrreducibleSubgroup (imageOver ρ ⊤)

/-- R01.4 (stand-in): `det ρ(c) = −1` for every `c ∈ G_ℚ` acting as complex conjugation under
some embedding `ℚ̄ → ℂ`. -/
def IsOdd (ρ : ResidualRep F) : Prop :=
  ∀ (j : AlgebraicClosure ℚ →+* ℂ) (c : Field.absoluteGaloisGroup ℚ),
    (∀ x, j (galAut c x) = starRingEnd ℂ (j x)) →
      ((ρ c : GL (Fin 2) F) : Matrix (Fin 2) (Fin 2) F).det = -1

/-- R01.2 (stand-in): the kernel field `ℚ̄^{ker ρ}`. -/
def kernelField (ρ : ResidualRep F) : IntermediateField ℚ (AlgebraicClosure ℚ) :=
  IntermediateField.fixedField ρ.toMonoidHom.ker

/-- The kernel field is a number field (`ker ρ` is open). A true claim, proved by `sorry`. -/
instance numberField_kernelField (ρ : ResidualRep F) : NumberField (kernelField ρ) := sorry

/-- R01.2 (stand-in): `ρ` is unramified at `ℓ` when `ℓ` does not divide the discriminant of the
kernel field. -/
def IsUnramifiedAt (ℓ : ℕ) (ρ : ResidualRep F) : Prop :=
  ¬ (ℓ : ℤ) ∣ discr (kernelField ρ)

/-- R01.2 (stand-in): `ρ` is trivial on wild inertia at `p`, that is, the kernel field is tamely
ramified at `p`. -/
def IsTameAt (p : ℕ) (ρ : ResidualRep F) : Prop :=
  ∀ P : Ideal (𝓞 (kernelField ρ)), P.IsPrime → (p : 𝓞 (kernelField ρ)) ∈ P →
    ¬ p ∣ P.ramificationIdx ℤ

/-- Extension of scalars along a field embedding `F → F'`. -/
def ResidualRep.map {F' : Type*} [Field F'] [TopologicalSpace F'] (f : F →+* F')
    (ρ : ResidualRep F) : ResidualRep F' where
  toMonoidHom := (Matrix.GeneralLinearGroup.map f).comp ρ.toMonoidHom
  continuous_toFun := sorry

/-- R01.2 (stand-in): the twist `ρ ⊗ χ` by a character `χ : G_ℚ → F^×`. -/
def twist (ρ : ResidualRep F) (χ : Field.absoluteGaloisGroup ℚ →* Fˣ) : ResidualRep F where
  toFun σ := Units.map (algebraMap F (Matrix (Fin 2) (Fin 2) F)).toMonoidHom (χ σ) * ρ σ
  map_one' := sorry
  map_mul' := sorry
  continuous_toFun := sorry

/-- Level one: absolutely irreducible, odd, and unramified outside `p`. -/
def IsLevelOneResidual (p : ℕ) (ρ : ResidualRep F) : Prop :=
  IsAbsolutelyIrreducible ρ ∧ IsOdd ρ ∧ ∀ ℓ : ℕ, ℓ.Prime → ℓ ≠ p → IsUnramifiedAt ℓ ρ

/-- The kernel-field form: unramified outside `p` means every prime above `ℓ ≠ p` has
ramification index `1` in the kernel field. -/
theorem isLevelOneResidual_iff_kernelField (p : ℕ) (ρ : ResidualRep F) :
    IsLevelOneResidual p ρ ↔
      (∀ ℓ : ℕ, ℓ.Prime → ℓ ≠ p → ∀ P : Ideal (𝓞 (kernelField ρ)), P.IsPrime →
        (ℓ : 𝓞 (kernelField ρ)) ∈ P → P.ramificationIdx ℤ = 1) ∧
      IsAbsolutelyIrreducible ρ ∧ IsOdd ρ := sorry

theorem IsLevelOneResidual.map {F' : Type*} [Field F'] [Fintype F'] [TopologicalSpace F']
    [DiscreteTopology F'] (f : F →+* F') {p : ℕ} (ρ : ResidualRep F) :
    IsLevelOneResidual p (ρ.map f) ↔ IsLevelOneResidual p ρ := sorry

theorem IsLevelOneResidual.conj {p : ℕ} {ρ ρ' : ResidualRep F} (g : GL (Fin 2) F)
    (hconj : ∀ σ, ρ' σ = g * ρ σ * g⁻¹) (hρ : IsLevelOneResidual p ρ) :
    IsLevelOneResidual p ρ' := sorry

theorem isOdd_of_ringChar_two (h : ringChar F = 2) (ρ : ResidualRep F) : IsOdd ρ := sorry

/-- For `p` odd the kernel field of a level-one residual representation is totally complex. -/
theorem IsLevelOneResidual.isTotallyComplex {p : ℕ} (hp : p.Prime) (hp2 : p ≠ 2) [CharP F p]
    {ρ : ResidualRep F} (hρ : IsLevelOneResidual p ρ) : IsTotallyComplex (kernelField ρ) :=
  sorry

/-- `not_isLevelOneResidual_one_add_omega` (non-example): `ρ̄ = 1 ⊕ ω̄` in characteristic `3` is
odd and unramified outside `3` but not absolutely irreducible. -/
example [CharP F 3] : ∃ ρ : ResidualRep F, IsOdd ρ ∧
    (∀ ℓ : ℕ, ℓ.Prime → ℓ ≠ 3 → IsUnramifiedAt ℓ ρ) ∧ ¬ IsLevelOneResidual 3 ρ := sorry

/-- `not_isLevelOneResidual_X0_eleven_two_torsion` (non-example): the action on `E[2]` for
`E : y² + y = x³ − x² − 10x − 20` is absolutely irreducible (image `S₃`) and ramified at `11`. -/
example [CharP F 2] : ∃ ρ : ResidualRep F, IsAbsolutelyIrreducible ρ ∧
    ¬ IsUnramifiedAt 11 ρ ∧ ¬ IsLevelOneResidual 2 ρ := sorry

/-- `isOdd_of_ringChar_two` (degenerate): in characteristic `2` every `ρ̄` is odd. -/
example [CharP F 2] (ρ : ResidualRep F) : IsOdd ρ := isOdd_of_ringChar_two (ringChar.eq F 2) ρ

/-- `IsLevelOneResidual.map` (compatibility): extending `𝔽₂ ⊆ 𝔽₄` does not change the
predicate. -/
example {F' : Type*} [Field F'] [Fintype F'] [TopologicalSpace F'] [DiscreteTopology F']
    (_hF : Fintype.card F = 2) (_hF' : Fintype.card F' = 4) (f : F →+* F') (ρ : ResidualRep F) :
    IsLevelOneResidual 2 (ρ.map f) ↔ IsLevelOneResidual 2 ρ := IsLevelOneResidual.map f ρ

/-- `not_isAbsolutelyIrreducible_cyclic_cubic_mod_two` (non-example): `G_ℚ ↠ Gal(ℚ(ζ₉)⁺/ℚ)`
followed by `(0 1; 1 1)` is irreducible over `𝔽₂` but not absolutely irreducible. -/
example (hF : Fintype.card F = 2) : ∃ ρ : ResidualRep F,
    IsIrreducibleSubgroup ρ.toMonoidHom.range ∧ ¬ IsAbsolutelyIrreducible ρ := sorry

theorem det_eq_one_of_char_two [CharP F 2] (ρ : ResidualRep F)
    (hρ : ∀ ℓ : ℕ, ℓ.Prime → ℓ ≠ 2 → IsUnramifiedAt ℓ ρ) (σ : Field.absoluteGaloisGroup ℚ) :
    ((ρ σ : GL (Fin 2) F) : Matrix (Fin 2) (Fin 2) F).det = 1 := sorry

theorem not_isAbsolutelyIrreducible_of_tame {p : ℕ} (hp : p = 2 ∨ p = 3) [CharP F p]
    (ρ : ResidualRep F) (hρ : ∀ ℓ : ℕ, ℓ.Prime → ℓ ≠ p → IsUnramifiedAt ℓ ρ)
    (htame : IsTameAt p ρ) : ¬ IsAbsolutelyIrreducible ρ := sorry

/-- Tate's theorem (oddness is automatic in characteristic `2` and is not assumed). -/
theorem tate_no_levelOne_char_two [CharP F 2] (ρ : ResidualRep F)
    (hρ : ∀ ℓ : ℕ, ℓ.Prime → ℓ ≠ 2 → IsUnramifiedAt ℓ ρ) : ¬ IsAbsolutelyIrreducible ρ :=
  sorry

/-- Serre's mod-3 theorem. -/
theorem serre_no_levelOne_char_three [CharP F 3] (ρ : ResidualRep F) :
    ¬ IsLevelOneResidual 3 ρ := sorry

/-- The Tate–Serre base case (DP23, Theorem 1.1). -/
theorem not_isLevelOneResidual_of_le_three {p : ℕ} (hp : p = 2 ∨ p = 3) [CharP F p]
    (ρ : ResidualRep F) : ¬ IsLevelOneResidual p ρ := sorry

end Residual

/-- Irreducible finite subgroups of `SL₂(F̄₂)`: dihedral of order `2r`, `r ≥ 3` odd, with
self-normalising subgroups of order `2`, or of order `q(q² − 1) ≥ 60` with `q = 2^j ≥ 4`. -/
theorem dihedral_or_SL2_of_irreducible_char_two
    (G : Subgroup (GL (Fin 2) (AlgebraicClosure (ZMod 2)))) [Finite G]
    (hdet : ∀ g ∈ G, (g : Matrix (Fin 2) (Fin 2) (AlgebraicClosure (ZMod 2))).det = 1)
    (hG : IsIrreducibleSubgroup G) :
    (∃ r : ℕ, Odd r ∧ 3 ≤ r ∧ Nonempty (G ≃* DihedralGroup r) ∧
        ∀ Q : Subgroup G, Nat.card Q = 2 → Subgroup.normalizer (Q : Set G) = Q) ∨
      ∃ j : ℕ, 2 ≤ j ∧ Nat.card G = 2 ^ j * (2 ^ (2 * j) - 1) := sorry

/-- Irreducible finite subgroups of `GL₂(F̄₃)` with `3 ∣ |G|`. -/
theorem twentyFour_dvd_card_of_irreducible_char_three
    (G : Subgroup (GL (Fin 2) (AlgebraicClosure (ZMod 3)))) [Finite G]
    (hG : IsIrreducibleSubgroup G) (h3 : 3 ∣ Nat.card G) :
    (-1 : GL (Fin 2) (AlgebraicClosure (ZMod 3))) ∈ G ∧ 24 ∣ Nat.card G ∧
      (padicValNat 3 (Nat.card G) = 1 ∨ 720 ≤ Nat.card G) := sorry

/-! ## Finite flat group schemes (stand-ins for R07.1, on Tau Ceti's category) -/

section GroupSchemes

/-- Finite flat commutative group schemes over `R` (Tau Ceti). -/
abbrev FFGroupSchemeOver (R : Type) [CommRing R] :=
  TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat (CommRingCat.of R)

/-- Finite flat commutative group schemes over `ℤ`. -/
abbrev FFGroupScheme := FFGroupSchemeOver ℤ

/-- Finite flat commutative group schemes over `ℤ[1/l]`. -/
abbrev FFGroupSchemeAway (l : ℕ) := FFGroupSchemeOver (Localization.Away (l : ℤ))

/-- `ℤ[1/l] → ℚ`; with Mathlib's instances it also makes `ℚ̄` a `ℤ[1/l]`-algebra. -/
instance algebraAwayRat (l : ℕ) [NeZero l] : Algebra (Localization.Away (l : ℤ)) ℚ :=
  (IsLocalization.Away.lift (l : ℤ) (g := Int.castRingHom ℚ)
    (isUnit_iff_ne_zero.mpr (by simpa using NeZero.ne l))).toAlgebra

variable {R : Type} [CommRing R]

/-- The coordinate Hopf algebra of `G` (Tau Ceti). -/
abbrev coordinateRing (G : FFGroupSchemeOver R) :
    TauCeti.FiniteLocallyFreeBicommutativeHopfAlgCat R :=
  TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat.coordinateHopfAlgebra R G

/-- The order of `G`: the rank of its coordinate algebra. -/
def order (G : FFGroupSchemeOver R) : ℕ := Module.finrank R (coordinateRing G)

/-- `G` is killed by `n`: the `n`-th convolution power of the identity of the coordinate Hopf
algebra is the counit. -/
def IsKilledBy (G : FFGroupSchemeOver R) (n : ℕ) : Prop :=
  WithConv.toConv (AlgHom.id R (coordinateRing G)) ^ n = 1

/-- The underlying morphism of schemes. -/
abbrev schemeHom {G H : FFGroupSchemeOver R} (f : G ⟶ H) :
    G.obj.obj.X.left ⟶ H.obj.obj.X.left :=
  f.hom.hom.hom.hom.left

/-- No closed flat subgroup schemes other than `0` and `G`. -/
def IsSimpleGroupScheme (G : FFGroupSchemeOver R) : Prop :=
  ∀ (M : FFGroupSchemeOver R) (i : M ⟶ G), IsClosedImmersion (schemeHom i) →
    order M = 1 ∨ IsIso i

/-- `G` is étale over the base. -/
def IsEtaleGroupScheme (G : FFGroupSchemeOver R) : Prop := Etale G.obj.obj.X.hom

/-- `G` is constant: isomorphic to Tau Ceti's constant group scheme of a finite abelian group. -/
def IsConstantGroupScheme (G : FFGroupSchemeOver R) : Prop :=
  ∃ (Γ : Type) (_ : CommGroup Γ) (_ : Finite Γ),
    Nonempty (G.obj.obj ≅ TauCeti.ConstantGroup.groupScheme R Γ)

/-- `G` is diagonalizable: its Cartier dual is constant. -/
def IsDiagonalizableGroupScheme (G : FFGroupSchemeOver R) : Prop :=
  IsConstantGroupScheme (TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat.cartierDual R G)

/-- The constant group scheme `ℤ/nℤ` over `R` (the membership proofs are true claims). -/
def zModScheme (R : Type) [CommRing R] (n : ℕ) [NeZero n] : FFGroupSchemeOver R :=
  ⟨⟨TauCeti.ConstantGroup.groupScheme R (Multiplicative (ZMod n)), sorry⟩, sorry⟩

/-- The group scheme `μ_n` over `R` (the membership proofs are true claims). -/
def muScheme (R : Type) [CommRing R] (n : ℕ) [NeZero n] : FFGroupSchemeOver R :=
  ⟨⟨TauCeti.RootsOfUnityGroup.groupScheme R n, sorry⟩, sorry⟩

/-- `0 → M → G → C → 0` is exact: `M` is the scheme-theoretic kernel of `q`, and `q` is
faithfully flat. -/
def IsShortExact {M G C : FFGroupSchemeOver R} (i : M ⟶ G) (q : G ⟶ C) : Prop :=
  IsPullback i.hom.hom.hom.hom (CartesianMonoidalCategory.toUnit M.obj.obj.X)
      q.hom.hom.hom.hom η[C.obj.obj.X] ∧
    Flat (schemeHom q) ∧ Surjective (schemeHom q)

/-- Every extension `0 → B → E → A → 0` splits. -/
def Ext1Vanishes (A B : FFGroupSchemeOver R) : Prop :=
  ∀ (E : FFGroupSchemeOver R) (i : B ⟶ E) (q : E ⟶ A), IsShortExact i q →
    ∃ s : A ⟶ E, s ≫ q = 𝟙 A

/-- `G` has a filtration whose successive quotients are isomorphic to `A`. -/
inductive IsIteratedExtensionOf (A : FFGroupSchemeOver R) : FFGroupSchemeOver R → Prop
  | trivial (G : FFGroupSchemeOver R) : order G = 1 → IsIteratedExtensionOf A G
  | extension {M G C : FFGroupSchemeOver R} (i : M ⟶ G) (q : G ⟶ C) :
      IsShortExact i q → IsIteratedExtensionOf A M → Nonempty (C ≅ A) →
        IsIteratedExtensionOf A G

variable [Algebra R ℚ]

/-- The points `G(ℚ̄)`, a commutative group under convolution (Tau Ceti). -/
abbrev points (G : FFGroupSchemeOver R) :=
  WithConv (coordinateRing G →ₐ[R] AlgebraicClosure ℚ)

/-- The action of `G_ℚ` on `G(ℚ̄)`. -/
def galoisAct (G : FFGroupSchemeOver R) (σ : Field.absoluteGaloisGroup ℚ) (x : points G) :
    points G :=
  WithConv.toConv (((galAut σ).toAlgHom.restrictScalars R).comp x.ofConv)

/-- The field `ℚ(G(ℚ̄))` generated by the coordinates of the points of `G`. -/
def torsionField (G : FFGroupSchemeOver R) : IntermediateField ℚ (AlgebraicClosure ℚ) :=
  IntermediateField.adjoin ℚ
    {x | ∃ f : coordinateRing G →ₐ[R] AlgebraicClosure ℚ, x ∈ Set.range f}

/-- The points generate a number field. A true claim, proved by `sorry`. -/
instance numberField_torsionField (G : FFGroupSchemeOver R) : NumberField (torsionField G) :=
  sorry

end GroupSchemes

/-! ## R25.1 — the torsion-field bound -/

/-- Fontaine's bound over `ℤ` (the case `N = 1`): `rd_L < p^{1 + 1/(p − 1)}` for the field of
points of a finite flat group scheme killed by `p`. -/
theorem rootDiscr_torsionField_lt (p : ℕ) [Fact p.Prime] (G : FFGroupScheme)
    (hG : IsKilledBy G p) :
    rootDiscr (torsionField G) < (p : ℝ) ^ ((1 : ℝ) + 1 / ((p : ℝ) - 1)) := sorry

/-- Part (i) over `ℤ[1/N]`: `δ(L_λ) < 1 + 1/(p − 1)` at every prime `λ` of `L = ℚ(G(ℚ̄))`
above `p`. (Part (ii), with the tame factors at `ℓ ∣ N`, is not stated.) -/
theorem localRootDiscrExp_torsionField_lt (p N : ℕ) [Fact p.Prime] [NeZero N]
    (hpN : p.Coprime N) (G : FFGroupSchemeAway N) (hG : IsKilledBy G p) (E : Type*) [Field E]
    [Algebra ℚ_[p] E] [FiniteDimensional ℚ_[p] E] (hE : IsCompletionAbove (torsionField G) p E) :
    localRootDiscrExp p E < 1 + 1 / ((p : ℚ) - 1) := sorry

/-! ## R25.3 — Fontaine's theorem -/

section Fontaine

open TauCeti.AlgebraicGeometry

/-- R11.1 (stand-in): `A` extends to an abelian scheme over `ℤ`, i.e. a smooth proper group
scheme over `ℤ` with generic fibre `A`; equivalently, good reduction at every prime. -/
def HasGoodReductionEverywhere (A : AbelianVariety ℚ) : Prop :=
  ∃ (X : Over (Spec (.of ℤ))) (_ : GrpObj X), IsProper X.hom ∧ Smooth X.hom ∧
    Nonempty ((Over.pullback (Spec.map (CommRingCat.ofHom (algebraMap ℤ ℚ)))).obj X ≅
      A.toOver)

theorem isConstant_of_etale_over_int (G : FFGroupScheme) (hG : IsEtaleGroupScheme G) :
    IsConstantGroupScheme G := sorry

theorem isPGroup_two_of_rootDiscr_lt_four (L : IntermediateField ℚ (AlgebraicClosure ℚ))
    [NumberField L] [IsGalois ℚ L]
    (hL : ∀ ℓ : ℕ, ℓ.Prime → ℓ ≠ 2 → ¬ (ℓ : ℤ) ∣ discr L)
    (hrd : rootDiscr L < 4) : ∃ k : ℕ, finrank ℚ L = 2 ^ k := sorry

/-- The nonzero simple finite flat 2-group schemes over `ℤ` are `ℤ/2ℤ` and `μ₂`. -/
theorem simple_two_groupScheme_over_int (G : FFGroupScheme) (h2 : ∃ k, order G = 2 ^ k)
    (h0 : order G ≠ 1) (hG : IsSimpleGroupScheme G) :
    Nonempty (G ≅ zModScheme ℤ 2) ∨ Nonempty (G ≅ muScheme ℤ 2) := sorry

/-- Every extension `0 → ℤ/2ℤ → E → μ₂ → 0` over `ℤ` splits. -/
theorem ext_muTwo_zModTwo_eq_zero : Ext1Vanishes (muScheme ℤ 2) (zModScheme ℤ 2) := sorry

theorem exists_diagonalizable_constant_filtration (G : FFGroupScheme)
    (h2 : ∃ k, order G = 2 ^ k) :
    ∃ (M C : FFGroupScheme) (i : M ⟶ G) (q : G ⟶ C), IsShortExact i q ∧
      IsDiagonalizableGroupScheme M ∧ IsConstantGroupScheme C ∧
      order M * order C = order G := sorry

/-- A6 (stand-in): the number of `k`-rational points of `A`. -/
def numPoints {k : Type} [Field k] (A : AbelianVariety k) : ℕ :=
  Nat.card (Over.mk (𝟙 (Spec (.of k))) ⟶ A.toOver)

theorem card_points_eq_of_isogeny {k : Type} [Field k] [Fintype k] {A B : AbelianVariety k}
    (f : A ⟶ B) (hf : AbelianVariety.IsIsogeny f) : numPoints A = numPoints B := sorry

/-- Fontaine's theorem. -/
theorem dim_eq_zero_of_goodReduction_everywhere (A : AbelianVariety ℚ)
    (hA : HasGoodReductionEverywhere A) : A.dim = 0 := sorry

end Fontaine

/-! ## R25.4 — Schoof's category `D(p, l)` and the field criterion -/

section Schoof

/-- Schoof's category `D(p, l)`: finite flat `p`-group schemes over `ℤ[1/l]` on whose points
every inertia element above `l` satisfies `(σ − 1)² = 0`. -/
def SemistableCategory (p l : ℕ) [NeZero l] : ObjectProperty (FFGroupSchemeAway l) := fun G =>
  (∃ k, order G = p ^ k) ∧
    ∀ σ ∈ inertiaAbove l, ∀ x : points G,
      galoisAct G σ (galoisAct G σ x) * (galoisAct G σ x)⁻¹ ^ 2 * x = 1

variable {p l : ℕ} [Fact p.Prime] [Fact l.Prime]

theorem SemistableCategory.subobject {M G C : FFGroupSchemeAway l} (i : M ⟶ G) (q : G ⟶ C)
    (h : IsShortExact i q) (hG : SemistableCategory p l G) :
    SemistableCategory p l M ∧ SemistableCategory p l C := sorry

theorem SemistableCategory.prod {G G' P : FFGroupSchemeAway l} (π₁ : P ⟶ G) (π₂ : P ⟶ G')
    (hP : IsLimit (BinaryFan.mk π₁ π₂)) (hG : SemistableCategory p l G)
    (hG' : SemistableCategory p l G') : SemistableCategory p l P := sorry

theorem SemistableCategory.cartierDual {G : FFGroupSchemeAway l}
    (hG : SemistableCategory p l G) :
    SemistableCategory p l
      (TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat.cartierDual _ G) := sorry

theorem SemistableCategory.inertia_pow {G : FFGroupSchemeAway l} (hG : SemistableCategory p l G)
    {k : ℕ} (hk : IsKilledBy G (p ^ k)) :
    ∀ σ ∈ inertiaAbove l, ∀ x : points G, galoisAct G (σ ^ p ^ k) x = x := sorry

theorem SemistableCategory.of_extension {G₂ G G₁ : FFGroupSchemeAway l} (i : G₂ ⟶ G)
    (q : G ⟶ G₁) (h : IsShortExact i q) (hord : ∃ k, order G = p ^ k)
    (h₁ : ∀ σ ∈ inertiaAbove l, ∀ x : points G₁, galoisAct G₁ σ x = x)
    (h₂ : ∀ σ ∈ inertiaAbove l, ∀ x : points G₂, galoisAct G₂ σ x = x) :
    SemistableCategory p l G := sorry

/-- `zModP_mem_semistableCategory` (degenerate): `ℤ/pℤ` and `μ_p` are objects of `D(p, l)`. -/
example : SemistableCategory p l (zModScheme _ p) ∧ SemistableCategory p l (muScheme _ p) :=
  sorry

/-- `katzMazur_mem_semistableCategory` (computation): every extension of `ℤ/pℤ` by `μ_p` over
`ℤ[1/l]`, in particular the Katz–Mazur `G_ε`, is in `D`: inertia acts by `(1 x; 0 1)`. -/
example (G : FFGroupSchemeAway l) (i : muScheme _ p ⟶ G) (q : G ⟶ zModScheme _ p)
    (h : IsShortExact i q) : SemistableCategory p l G := sorry

/-- `not_mem_semistableCategory_quadratic_twist` (non-example): the étale group scheme over
`ℤ[1/7]` of order `3` on which `Gal(ℚ(√−7)/ℚ)` acts by `−1` is not in `D(3, 7)`. -/
example [Fact (Nat.Prime 7)] : ∃ G : FFGroupSchemeAway 7, IsEtaleGroupScheme G ∧ order G = 3 ∧
    ¬ SemistableCategory 3 7 G := sorry

/-- `X0_eleven_two_torsion_mem` (computation): `J₀(11)[2]` is a simple object of `D(2, 11)` of
order `4`, so the simple-object criterion fails at `l = 11`. -/
example [Fact (Nat.Prime 11)] : ∃ G : FFGroupSchemeAway 11, SemistableCategory 2 11 G ∧
    IsSimpleGroupScheme G ∧ order G = 4 := sorry

/-- Étale `p`-group schemes over `ℤ[1/l]` that are iterated extensions of `ℤ/pℤ`: `G_ℚ` acts on
their points through `Gal(ℚ(ζ_l)/ℚ)`, so they become constant over `ℤ[1/l, ζ_l]`. -/
theorem isConstant_baseChange_cyclotomic (hpl : p ≠ l) (C : FFGroupSchemeAway l)
    (hC : IsEtaleGroupScheme C) (hfilt : IsIteratedExtensionOf (zModScheme _ p) C) :
    (∀ σ : Field.absoluteGaloisGroup ℚ, galAut σ ∈ (cyclotomicSubfield l).fixingSubgroup →
        ∀ x : points C, galoisAct C σ x = x) ∧
      IsConstantGroupScheme
        ((TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat.baseChangeFunctor
          (Localization.Away (l : ℤ))
          (Algebra.adjoin (Localization.Away (l : ℤ))
            {ζ : AlgebraicClosure ℚ | ζ ^ l = 1})).obj C) := sorry

/-- Dually, an iterated extension of `μ_p` over `ℤ[1/l]` becomes diagonalizable over
`ℤ[1/l, ζ_l]`, since its Cartier dual is of the first kind. -/
theorem isDiagonalizable_baseChange_cyclotomic (hpl : p ≠ l) (D : FFGroupSchemeAway l)
    (hfilt : IsIteratedExtensionOf (muScheme _ p) D) :
    IsDiagonalizableGroupScheme
      ((TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat.baseChangeFunctor
        (Localization.Away (l : ℤ))
        (Algebra.adjoin (Localization.Away (l : ℤ))
          {ζ : AlgebraicClosure ℚ | ζ ^ l = 1})).obj D) := sorry

/-- `Ext¹_{ℤ[1/l]}(μ_p, ℤ/pℤ) = 0` for `p ∈ {2, 3}`, `l ≠ p`, unless `l ≡ ±1 (mod 8)` when
`p = 2`, or `l ≡ ±1 (mod 9)` when `p = 3`; in particular for `(l, p) = (2, 3), (3, 2), (5, 2),
(7, 3), (13, 2)`. (The one-dimensional exceptional case is not stated.) -/
theorem ext_muP_zModP_eq_zero (hp : p = 2 ∨ p = 3) (hlp : l ≠ p)
    (hl : if p = 2 then l % 8 ≠ 1 ∧ l % 8 ≠ 7 else l % 9 ≠ 1 ∧ l % 9 ≠ 8) :
    Ext1Vanishes (muScheme (Localization.Away (l : ℤ)) p)
      (zModScheme (Localization.Away (l : ℤ)) p) := sorry

end Schoof

/-- Schoof's field criterion for `(l, p)`: with `F` the degree-`p` subfield of `ℚ(ζ_l)` if
`p ∣ l − 1` and `F = ℚ` otherwise, and `M = F(ζ_{2p}, l^{1/p})`, every finite Galois `L ⊇ M`
unramified over `M` outside `p` with `v_p(δ_L) < 1 + 1/(p − 1)` has `[L : ℚ(ζ_p)]` a power of
`p`. Unramifiedness of `L/M` at a prime is "inertia meets `G_M` inside `G_L`". -/
def FieldCriterion (l p : ℕ) : Prop :=
  ∀ (F M L : IntermediateField ℚ (AlgebraicClosure ℚ)) [NumberField L],
    (if p ∣ l - 1 then F ≤ cyclotomicSubfield l ∧ finrank ℚ F = p else F = ⊥) →
    M = F ⊔ cyclotomicSubfield (2 * p) ⊔
      IntermediateField.adjoin ℚ {x | x ^ p = (l : AlgebraicClosure ℚ)} →
    IsGalois ℚ L → M ≤ L →
    (∀ q : ℕ, q.Prime → q ≠ p → ∀ σ ∈ inertiaAbove q,
      galAut σ ∈ M.fixingSubgroup → galAut σ ∈ L.fixingSubgroup) →
    (padicValInt p (discr L) : ℝ) / finrank ℚ L < 1 + 1 / ((p : ℝ) - 1) →
    ∃ k : ℕ, finrank ℚ L = (p - 1) * p ^ k

/-- Schoof's Proposition 5.1: the field criterion forces the simple objects of `D(p, l)` to be
`ℤ/pℤ` and `μ_p`. -/
theorem simple_eq_of_fieldCriterion (l p : ℕ) [Fact l.Prime] [Fact p.Prime] (hlp : l ≠ p)
    (h : FieldCriterion l p) (G : FFGroupSchemeAway l) (hG : SemistableCategory p l G)
    (hs : IsSimpleGroupScheme G) (h0 : order G ≠ 1) :
    Nonempty (G ≅ zModScheme _ p) ∨ Nonempty (G ≅ muScheme _ p) := sorry

/-- Class number one for `ℚ(ζ₃, ∛2)`, `ℚ(ζ₁₂)`, `ℚ(i, √5)` and `ℚ(i, √13)`. -/
theorem classNumber_eq_one_small_fields :
    (∀ (K : Type) [Field K] [NumberField K] [IsSplittingField ℚ K (X ^ 3 - 2 : ℚ[X])],
        classNumber K = 1) ∧
      (∀ (K : Type) [Field K] [NumberField K] [IsCyclotomicExtension {12} ℚ K],
        classNumber K = 1) ∧
      (∀ (K : Type) [Field K] [NumberField K]
        [IsSplittingField ℚ K ((X ^ 2 + 1) * (X ^ 2 - 5) : ℚ[X])], classNumber K = 1) ∧
      (∀ (K : Type) [Field K] [NumberField K]
        [IsSplittingField ℚ K ((X ^ 2 + 1) * (X ^ 2 - 13) : ℚ[X])], classNumber K = 1) :=
  sorry

/-- `(l, p) = (2, 3)`: `M = ℚ(ζ₃, ∛2)` and every admissible `L` equals `M`. -/
theorem fieldCriterion_two_three : FieldCriterion 2 3 := sorry

/-- `(l, p) = (3, 2)`: `M = ℚ(ζ₁₂)` and every admissible `L` has degree `4` or `8`. -/
theorem fieldCriterion_three_two : FieldCriterion 3 2 := sorry

/-- `(l, p) = (5, 2)`: `M = ℚ(i, √5)` and every admissible `L` has degree `4`, `8` or `16`. -/
theorem fieldCriterion_five_two : FieldCriterion 5 2 := sorry

/-- `(l, p) = (7, 3)`: `M = ℚ(ζ₃, ζ₇ + ζ₇⁻¹, ∛7)`, of degree `18`. -/
theorem fieldCriterion_seven_three : FieldCriterion 7 3 := sorry

/-- `(l, p) = (13, 2)`: `M = ℚ(i, √13)`. -/
theorem fieldCriterion_thirteen_two : FieldCriterion 13 2 := sorry

/-! ## R25.5 — GL₂-type abelian varieties and the terminal weights -/

section Terminal

open TauCeti.AlgebraicGeometry

/-- A6 (stand-in): `End⁰(A) = ℚ ⊗ End(A)`, on Tau Ceti's `AbelianVariety.End`. -/
abbrev endZeroAlgebra {F : Type} [Field F] (A : AbelianVariety F) : Type :=
  ℚ ⊗[ℤ] A.End

/-- `A/F` is of GL₂(K)-type: `K` acts on `A` up to isogeny with `[K : ℚ] = dim A`
(Tau Ceti's `dim` takes values in `WithBot ℕ∞`). -/
def IsGL2Type {F : Type} [Field F] [NumberField F] (A : AbelianVariety F) (K : Type) [Field K]
    [NumberField K] : Prop :=
  Nonempty (K →+* endZeroAlgebra A) ∧ (finrank ℚ K : WithBot ℕ∞) = A.dim

/-- The GL₂(K)-type structure transfers along an isogeny. -/
theorem IsGL2Type.isogeny {F : Type} [Field F] [NumberField F] {A B : AbelianVariety F}
    {K : Type} [Field K] [NumberField K] (f : A ⟶ B) (hf : AbelianVariety.IsIsogeny f)
    (h : IsGL2Type A K) : IsGL2Type B K := sorry

/-- Base change to a finite extension `F'/F` keeps the GL₂(K)-type (the statement about `V_λ`
is in the header block). -/
theorem IsGL2Type.baseChange {F : Type} [Field F] [NumberField F] {A : AbelianVariety F}
    {K : Type} [Field K] [NumberField K] (h : IsGL2Type A K) (F' : Type) [Field F']
    [NumberField F'] [Algebra F F'] : IsGL2Type (A.baseChange F') K := sorry

/-- `isGL2Type_ellipticCurve` (computation): an elliptic curve over `ℚ` is of GL₂(ℚ)-type. -/
example (A : AbelianVariety ℚ) (hA : A.dim = 1) : IsGL2Type A ℚ := sorry

/-- `isGL2Type_J0_23` (computation): `J₀(23)`, of dimension `2` with `ℚ(√5)` acting through Hecke
operators, is of GL₂(ℚ(√5))-type. -/
example (K : Type) [Field K] [NumberField K] [IsSplittingField ℚ K (X ^ 2 - 5 : ℚ[X])] :
    ∃ A : AbelianVariety ℚ, A.dim = 2 ∧ IsGL2Type A K := sorry

/-- `not_isGL2Type_prod_rat` (non-example): a surface such as `E × E` is not of GL₂(ℚ)-type. -/
example (A : AbelianVariety ℚ) (hA : A.dim = 2) : ¬ IsGL2Type A ℚ := sorry

/-- `isGL2Type_zero` (degenerate): the zero abelian variety is of GL₂-type for no number field. -/
example (A : AbelianVariety ℚ) (hA : A.dim = 0) (K : Type) [Field K] [NumberField K] :
    ¬ IsGL2Type A K := sorry

/-- Class number one for `ℚ(√−p)`, `p ∈ {3, 7, 11, 19, 43, 67, 163}`. -/
theorem classNumber_sqrt_neg_prime_eq_one :
    ∀ p ∈ ({3, 7, 11, 19, 43, 67, 163} : Finset ℕ), ∀ (K : Type) [Field K] [NumberField K]
      [IsSplittingField ℚ K (X ^ 2 + C (p : ℚ))], classNumber K = 1 := sorry

/-- R15.4 (placeholder): Serre's weight `k(ρ̄)` of `ρ̄` itself, not normalised by a twist. -/
def serreWeight {F : Type*} [Field F] [Fintype F] [TopologicalSpace F] (ρ : ResidualRep F) :
    ℕ := sorry

variable {F : Type*} [Field F] [Fintype F] [TopologicalSpace F] [DiscreteTopology F]

/-- Snowden's (A1) for a residual representation: absolutely irreducible on `G_{ℚ(ζ_p)}`. -/
def SatisfiesA1Residual (p : ℕ) (ρ : ResidualRep F) : Prop :=
  IsIrreducibleSubgroup (imageOver ρ (cyclotomicSubfield p).fixingSubgroup)

/-- Wintenberger: (A1) holds for a level-one `ρ̄` when `p ≡ 1 (mod 4)`, or `p` is one of the
seven primes with `h(ℚ(√−p)) = 1`, or no twist of `ρ̄` has weight `(p + 1)/2`. -/
theorem levelOne_dihedral_classification (p : ℕ) [Fact p.Prime] (hp2 : p ≠ 2) [CharP F p]
    (ρ : ResidualRep F) (hρ : IsLevelOneResidual p ρ)
    (h : p % 4 = 1 ∨ p ∈ ({3, 7, 11, 19, 43, 67, 163} : Finset ℕ) ∨
      ∀ i : ℕ, 2 * serreWeight (twist ρ (modCyclotomicCharacter p F ^ i)) ≠ p + 1) :
    SatisfiesA1Residual p ρ := sorry

/-- No level-one residual representation of Serre weight `2`. -/
theorem not_levelOne_weight_two (p : ℕ) [Fact p.Prime] [CharP F p] (ρ : ResidualRep F)
    (hρ : IsLevelOneResidual p ρ) : serreWeight ρ ≠ 2 := sorry

/-- No level-one representation of weight `p + 1` for `p ∈ {5, 7, 13}` (Schoof). -/
theorem not_levelOne_weight_succ_of_schoofPrime (p : ℕ) (hp : p ∈ ({5, 7, 13} : Finset ℕ))
    [CharP F p] (ρ : ResidualRep F) (hρ : IsLevelOneResidual p ρ) : serreWeight ρ ≠ p + 1 :=
  sorry

/-- At `p = 11`, weight `14` is a twist of weight `2` except for one local type: either
`k(ρ̄ ⊗ ω⁻¹) = 2` (cases (a)–(c)), or `k(ρ̄ ⊗ ω⁻¹) = 22` and `k(ρ̄ ⊗ ω⁻²) = 10` (case (d), which
no node of R25 excludes). The case split on `ρ̄|I₁₁` needs inertia types and is not stated. -/
theorem weight_fourteen_eleven_twist [Fact (Nat.Prime 11)] [CharP F 11] (ρ : ResidualRep F)
    (hρ : IsLevelOneResidual 11 ρ) (hk : serreWeight ρ = 14) :
    serreWeight (twist ρ (modCyclotomicCharacter 11 F)⁻¹) = 2 ∨
      (serreWeight (twist ρ (modCyclotomicCharacter 11 F)⁻¹) = 22 ∧
        serreWeight (twist ρ ((modCyclotomicCharacter 11 F)⁻¹ ^ 2)) = 10) := sorry

/-- Khare–Wintenberger: no level-one representation with `2 ≤ k(ρ̄) ≤ 8`, or with `k(ρ̄) = 14`
and `p ≠ 11`. -/
theorem not_levelOne_small_weight (p : ℕ) [Fact p.Prime] [CharP F p] (ρ : ResidualRep F)
    (hρ : IsLevelOneResidual p ρ) :
    ¬ (2 ≤ serreWeight ρ ∧ serreWeight ρ ≤ 8) ∧ (p ≠ 11 → serreWeight ρ ≠ 14) := sorry

open scoped MatrixGroups in
/-- Check: the terminal weights `2, 4, 6, 8` carry no level-one cusp forms (Mathlib). -/
example (k : ℤ) (hk : k < 12) : Module.rank ℂ (CuspForm 𝒮ℒ k) = 0 :=
  CuspForm.rank_eq_zero_of_weight_lt_twelve hk

open scoped MatrixGroups in
/-- Check: `S₁₄(SL₂(ℤ)) = 0`, through `S₁₄ ≅ M₂ = 0`. -/
example : Module.rank ℂ (CuspForm 𝒮ℒ 14) = 0 := sorry

end Terminal

/-! ## R25.6 — the base-case table -/

/-- One row of the base-case table. The theorem a row asserts is `BaseCaseRow.statement`, the
name of its proving declaration (not a `Prop`-valued field); `baseCases_holds` states the rows
whose statements can be written at the baseline. -/
structure BaseCaseRow where
  /-- The residual characteristics covered (empty for the abelian-variety rows). -/
  characteristics : Set ℕ
  /-- The Serre weights covered in each characteristic. -/
  weights : ℕ → Set ℕ
  /-- Whether the row is a level-one (conductor-one) statement. -/
  levelOne : Bool
  /-- Whether the row assumes oddness. -/
  oddness : Bool
  /-- The allowed bad primes, for the abelian-variety rows. -/
  badPrimes : Option (Finset ℕ)
  imageCondition : String
  coefficientCondition : String
  supplier : String
  consumer : String
  localCheck : String
  /-- The proving declaration. -/
  statement : Lean.Name

/-- The nine rows. The degenerate branches (soluble image: R17.5, R17.6; residually reducible:
R21.5; failure of (A1) away from level one: R27.1, R33.2) are recorded in the roadmap document. -/
def baseCases : List BaseCaseRow :=
  [ { characteristics := {2}, weights := fun _ => Set.univ, levelOne := true, oddness := false,
      badPrimes := none, imageCondition := "any", coefficientCondition := "finite, char 2",
      supplier := "R25.2/tate-theorem", consumer := "R26 (initial characteristic); DP23 Thm 1.1",
      localCheck := "none", statement := `TauCeti.SmallRamification.tate_no_levelOne_char_two },
    { characteristics := {3}, weights := fun _ => Set.univ, levelOne := true, oddness := true,
      badPrimes := none, imageCondition := "any", coefficientCondition := "finite, char 3",
      supplier := "R25.2/serre-mod-three-theorem", consumer := "R26; R33.4 (3-adic members)",
      localCheck := "none",
      statement := `TauCeti.SmallRamification.serre_no_levelOne_char_three },
    { characteristics := ∅, weights := fun _ => ∅, levelOne := true, oddness := false,
      badPrimes := some ∅, imageCondition := "abelian variety over ℚ",
      coefficientCondition := "every dimension", supplier := "R25.3/fontaine-theorem",
      consumer := "R26.5 (weight 2 at level one)", localCheck := "good reduction everywhere",
      statement := `TauCeti.SmallRamification.dim_eq_zero_of_goodReduction_everywhere },
    { characteristics := ∅, weights := fun _ => ∅, levelOne := false, oddness := false,
      badPrimes := some {2, 3, 5, 7, 13}, imageCondition := "semistable abelian variety over ℚ",
      coefficientCondition := "every dimension", supplier := "R25.4/schoof-theorem",
      consumer := "R26.5 (weights p + 1, p ∈ {5, 7, 13}); R33.4 (l = 5)",
      localCheck := "semistable at l",
      statement := `TauCeti.SmallRamification.no_semistable_abelianVariety_one_prime },
    { characteristics := {p | p.Prime}, weights := fun _ => {2}, levelOne := true,
      oddness := true, badPrimes := none, imageCondition := "absolutely irreducible",
      coefficientCondition := "finite", supplier := "R25.5/weight-two-level-one-excluded",
      consumer := "R26.5", localCheck := "Serre weight at p",
      statement := `TauCeti.SmallRamification.not_levelOne_weight_two },
    { characteristics := {5, 7, 13}, weights := fun p => {p + 1}, levelOne := true,
      oddness := true, badPrimes := none, imageCondition := "absolutely irreducible",
      coefficientCondition := "finite",
      supplier := "R25.5/weight-p-plus-one-excluded-at-schoof-primes", consumer := "R26.5",
      localCheck := "Serre weight at p",
      statement := `TauCeti.SmallRamification.not_levelOne_weight_succ_of_schoofPrime },
    { characteristics := {3, 5, 7, 13}, weights := fun p => if p = 3 then {2, 4} else {p + 1},
      levelOne := true, oddness := true, badPrimes := none,
      imageCondition := "residually reducible", coefficientCondition := "crystalline p-adic",
      supplier := "R25.5/ordinary-reducible-terminal-weights", consumer := "R33.4 (p = 3); R26.5",
      localCheck := "ordinary and p-distinguished at p",
      statement := `TauCeti.SmallRamification.no_levelOne_crystalline_of_reducible_terminal },
    { characteristics := {p | p.Prime},
      weights := fun p => Set.Icc 2 8 ∪ (if p = 11 then ∅ else {14}), levelOne := true,
      oddness := true, badPrimes := none, imageCondition := "absolutely irreducible",
      coefficientCondition := "finite", supplier := "R25.5/small-weight-level-one-exclusion",
      consumer := "R26.5", localCheck := "Serre weight of ρ̄ itself",
      statement := `TauCeti.SmallRamification.not_levelOne_small_weight },
    { characteristics := {5}, weights := fun _ => {2, 4, 6}, levelOne := true, oddness := true,
      badPrimes := none, imageCondition := "irreducible, (A1)",
      coefficientCondition := "almost strictly compatible system",
      supplier := "R25.5/paso-six-terminal-cases", consumer := "R33.4",
      localCheck := "minimal crystalline lift at 5",
      statement := `TauCeti.SmallRamification.paso_six } ]

/-- The Schoof row's prime set is exactly `{2, 3, 5, 7, 13}`. -/
theorem baseCases_schoof_primes :
    ∃ r ∈ baseCases, r.supplier = "R25.4/schoof-theorem" ∧ r.badPrimes = some {2, 3, 5, 7, 13} :=
  sorry

/-- `baseCases_schoof_primes` (computation): the Schoof row's prime set is `{2, 3, 5, 7, 13}`;
`11` is not in it, which a table with "all primes at most 13" would get wrong (`J₀(11)`). -/
example : ∀ r ∈ baseCases, r.supplier = "R25.4/schoof-theorem" →
    r.badPrimes = some {2, 3, 5, 7, 13} ∧ ∀ s, r.badPrimes = some s → 11 ∉ s := sorry

/-- `baseCases_tate_no_oddness` (degenerate): the `p = 2` row carries no oddness hypothesis. -/
example : ∀ r ∈ baseCases, r.characteristics = {2} → r.oddness = false := sorry

/-- `baseCases_weight_list` (non-example): no level-one row covers weight `12` at `p = 11`
(`Δ` gives an irreducible level-one `ρ̄` of weight `12` mod `11`). -/
example : ∀ r ∈ baseCases, r.levelOne = true → 11 ∈ r.characteristics → 12 ∉ r.weights 11 :=
  sorry

/-- `baseCases_fontaine_schoof_distinct` (computation): the Fontaine row and the Schoof row are
distinct rows with distinct suppliers. -/
example : ∃ r₁ ∈ baseCases, ∃ r₂ ∈ baseCases, r₁.badPrimes = some ∅ ∧
    r₂.badPrimes = some {2, 3, 5, 7, 13} ∧ r₁.supplier ≠ r₂.supplier := sorry

/-- `baseCases_weight_fourteen_excludes_eleven` (non-example): no level-one row contains
`(p, k) = (11, 14)`. -/
example : ∀ r ∈ baseCases, r.levelOne = true → 11 ∈ r.characteristics → 14 ∉ r.weights 11 :=
  sorry

open TauCeti.AlgebraicGeometry in
/-- Every row of the table holds: the conjunction of the row statements that can be written at
the baseline (rows 1, 2, 3, 5, 6 and 8). Rows 4, 7 and 9 need the declarations listed in the
header block. -/
theorem baseCases_holds :
    (∀ (F : Type) [Field F] [Fintype F] [TopologicalSpace F] [DiscreteTopology F] [CharP F 2]
        (ρ : ResidualRep F), (∀ ℓ : ℕ, ℓ.Prime → ℓ ≠ 2 → IsUnramifiedAt ℓ ρ) →
          ¬ IsAbsolutelyIrreducible ρ) ∧
      (∀ (F : Type) [Field F] [Fintype F] [TopologicalSpace F] [DiscreteTopology F] [CharP F 3]
        (ρ : ResidualRep F), ¬ IsLevelOneResidual 3 ρ) ∧
      (∀ A : AbelianVariety ℚ, HasGoodReductionEverywhere A → A.dim = 0) ∧
      (∀ (p : ℕ) [Fact p.Prime] (F : Type) [Field F] [Fintype F] [TopologicalSpace F]
        [DiscreteTopology F] [CharP F p] (ρ : ResidualRep F), IsLevelOneResidual p ρ →
          serreWeight ρ ≠ 2 ∧ (p ∈ ({5, 7, 13} : Finset ℕ) → serreWeight ρ ≠ p + 1) ∧
          ¬ (2 ≤ serreWeight ρ ∧ serreWeight ρ ≤ 8) ∧ (p ≠ 11 → serreWeight ρ ≠ 14)) :=
  sorry

end TauCeti.SmallRamification
