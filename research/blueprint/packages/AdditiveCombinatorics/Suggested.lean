import Mathlib
import TauCeti.RepresentationTheory.Compact.Haar

/-!
# Additive combinatorics, higher Fourier analysis and primes: representative target signatures

The roadmap is `README.md`. This file records definitions and theorem signatures that can already
be stated against the pinned Mathlib and Tau Ceti; it is not an exhaustive list of the targets of
any layer, and the statements suggest Lean forms so that contributors and reviewers converge on
names and signatures. Every theorem and `example` is proved by `sorry`.

The design choices made explicit here:

* The Fourier transform on a finite abelian group `G` is indexed by `AddChar G ℂ` itself and
  normalised by `|G|⁻¹`: probability measure on `G`, counting measure on the dual. No isomorphism
  `G ≃ AddChar G ℂ` is chosen; on `ZMod N` the transform is compared with `ZMod.dft` through
  Mathlib's `AddChar.zmodAddEquiv`.
* Convolution `nconv` is normalised the same way, so its unit is `|G| • δ₀`.
* Entropy is defined for measures on a finite type through `Real.negMulLog`, and the entropic Ruzsa
  distance is a function of two laws, computed from their product measure.
* Bohr sets come in two conventions: the chord set with `‖χ x - 1‖ < δ` and the phase set with
  `|arg (χ x)| / (2π) < ε χ`; regularity uses non-strict inequalities.
* Gowers cubes conjugate by vertex parity; interval norms are ratios against the indicator of the
  interval, after zero extension into `ZMod (2 ^ d * N + 1)`.
* Degree filtrations are bundled subgroups with `G₀ = G₁ = G`, and polynomial sequences on `ℤ ^ ℓ`
  are defined by iterated derivatives `g (n + h) * (g n)⁻¹`.
* The prime-progression majorants use `primorial w` as the W-trick modulus.

Heavy objects (rational Mal'cev bases, the Mal'cev metric, nilsequences with their complexity,
equidistribution, Green–Tao pseudorandom measure families, Kai's number-field prime weights and
local factors) are README targets and do not appear here, nor do the theorems that need them; the
closing comment lists them.
-/

noncomputable section

open Finset MeasureTheory
open scoped BigOperators ComplexConjugate Pointwise

namespace TauCetiRoadmap.AdditiveCombinatorics

/-! ## Library declarations the roadmap builds on -/

#check @AddChar.complexBasis
#check @AddChar.zmodAddEquiv
#check @ZMod.dft
#check @Finset.addEnergy_univ_left
#check @Finset.le_card_add_mul_addEnergy
#check @Finset.ruzsa_covering_add
#check @Finset.ruzsa_triangle_inequality_sub_sub_sub
#check @Finset.pluennecke_ruzsa_inequality_nsmul_sub_nsmul_add
#check @roth_3ap_theorem_nat
#check @szemeredi_regularity
#check @isBigO_riemannZeta_sub_one_div
#check @ArithmeticFunction.vonMangoldt.continuousOn_LFunctionResidueClassAux
#check @TauCeti.haarProb

/-! ## Layer AC.0: Fourier analysis on finite abelian groups -/

namespace FiniteFourier

variable {G : Type*} [AddCommGroup G] [Fintype G]

/-- The normalised Fourier transform `fourier f χ = |G|⁻¹ ∑ₓ f x · conj (χ x)` (Layer AC.0.1;
Tao, 254A Notes 2, §6). It is indexed by the character group itself. -/
def fourier (f : G → ℂ) (χ : AddChar G ℂ) : ℂ :=
  (Fintype.card G : ℂ)⁻¹ * ∑ x, f x * conj (χ x)

/-- Normalised convolution `nconv f g x = |G|⁻¹ ∑_y f y · g (x - y)` (Layer AC.0.2). -/
def nconv (f g : G → ℂ) (x : G) : ℂ :=
  (Fintype.card G : ℂ)⁻¹ * ∑ y, f y * g (x - y)

/-- Fourier inversion, with no stray factor of `|G|`. -/
theorem fourier_inversion (f : G → ℂ) (x : G) :
    ∑ χ : AddChar G ℂ, fourier f χ * χ x = f x := sorry

/-- The transform is the coordinate in Mathlib's character basis. -/
theorem fourier_eq_basis_repr (f : G → ℂ) (χ : AddChar G ℂ) :
    fourier f χ = (AddChar.complexBasis G).repr f χ := sorry

/-- The transform is Mathlib's weighted inner product with the constant weight, the character in
the conjugated first slot. -/
theorem fourier_eq_wInner (f : G → ℂ) (χ : AddChar G ℂ) :
    fourier f χ = RCLike.wInner RCLike.cWeight (fun x ↦ χ x) f := sorry

/-- The transform is the integral of `f · conj χ` against Tau Ceti's Haar probability measure, on
`G` with the discrete topology: the degree-one case of the Peter–Weyl coefficients. -/
theorem fourier_eq_haarIntegral [TopologicalSpace (Multiplicative G)]
    [DiscreteTopology (Multiplicative G)] [IsTopologicalGroup (Multiplicative G)]
    [MeasurableSpace (Multiplicative G)] [BorelSpace (Multiplicative G)]
    (f : G → ℂ) (χ : AddChar G ℂ) :
    fourier f χ = ∫ x, f x.toAdd * conj (χ x.toAdd) ∂(TauCeti.haarProb (Multiplicative G)) :=
  sorry

/-- On `ZMod N` the transform is `N⁻¹` times Mathlib's discrete Fourier transform. -/
theorem fourier_zmod {N : ℕ} [NeZero N] (f : ZMod N → ℂ) (r : ZMod N) :
    fourier f (AddChar.zmodAddEquiv r) = (N : ℂ)⁻¹ * ZMod.dft f r := sorry

/-- Parseval for the probability measure on `G` and counting measure on its dual (AC.0.3). -/
theorem fourier_parseval (f g : G → ℂ) :
    (Fintype.card G : ℂ)⁻¹ * ∑ x, f x * conj (g x) =
      ∑ χ : AddChar G ℂ, fourier f χ * conj (fourier g χ) := sorry

/-- The convolution identity, with no constant (AC.0.4). -/
theorem fourier_nconv (f g : G → ℂ) (χ : AddChar G ℂ) :
    fourier (nconv f g) χ = fourier f χ * fourier g χ := sorry

/-- The unit of normalised convolution is `|G| • δ₀`. -/
theorem nconv_unit_left [DecidableEq G] (f : G → ℂ) :
    nconv (Pi.single 0 (Fintype.card G : ℂ)) f = f := sorry

/-- Additive energy in Fourier terms (AC.0.5). -/
theorem fourier_energy [DecidableEq G] (A B : Finset G) :
    ((A.addEnergy B : ℕ) : ℝ) = (Fintype.card G : ℝ) ^ 3 *
      ∑ χ : AddChar G ℂ, ‖fourier (Set.indicator (A : Set G) 1) χ‖ ^ 2 *
        ‖fourier (Set.indicator (B : Set G) 1) χ‖ ^ 2 := sorry

/-- The `L²` mass of an indicator's transform is the density (AC.0.6). -/
theorem fourier_indicator_l2 (A : Finset G) :
    ∑ χ : AddChar G ℂ, ‖fourier (Set.indicator (A : Set G) 1) χ‖ ^ 2 =
      (A.card : ℝ) / Fintype.card G := sorry

/-- The transform is bounded by the normalised `L¹` norm (AC.0.7). -/
theorem fourier_norm_le_l1 (f : G → ℂ) (χ : AddChar G ℂ) :
    ‖fourier f χ‖ ≤ (Fintype.card G : ℝ)⁻¹ * ∑ x, ‖f x‖ := sorry

/-- The fourth moment of an indicator's transform is at most the cubed density (AC.0.8). -/
theorem fourier_indicator_fourth_le (A : Finset G) :
    ∑ χ : AddChar G ℂ, ‖fourier (Set.indicator (A : Set G) 1) χ‖ ^ 4 ≤
      ((A.card : ℝ) / Fintype.card G) ^ 3 := sorry

/-- The character `χ` has coefficient `1` at `χ`, not `|G|`. -/
example (χ : AddChar G ℂ) : fourier (fun x ↦ χ x) χ = 1 := sorry

/-- The conjugation is in the transform: on `ZMod 4` the point mass at `1` has coefficient `-i/4`
at the character `x ↦ i ^ x`. -/
example : fourier (Pi.single (1 : ZMod 4) (1 : ℂ)) (AddChar.zmodAddEquiv 1) = -Complex.I / 4 :=
  sorry

/-- The point mass is not the convolution unit: on `ZMod 3`, `nconv δ₀ δ₀ 0 = 1/3`. -/
example : nconv (Pi.single (0 : ZMod 3) (1 : ℂ)) (Pi.single 0 1) 0 = 1 / 3 := sorry

/-- Two representations of `1` as a sum from `{0, 1}` in `ZMod 3`. -/
example : nconv (Set.indicator ({0, 1} : Set (ZMod 3)) 1)
    (Set.indicator ({0, 1} : Set (ZMod 3)) 1) 1 = 2 / 3 := sorry

end FiniteFourier

/-- The trivial upper bounds for additive energy, missing from the pinned Mathlib (AC.0.9). -/
theorem addEnergy_le_card_sq_mul_card {α : Type*} [AddCommGroup α] [DecidableEq α]
    (A B : Finset α) :
    A.addEnergy B ≤ A.card ^ 2 * B.card ∧ A.addEnergy B ≤ A.card * B.card ^ 2 := sorry

/-! ## Layer AC.1: additive structure -/

/-! ### Entropy and Marton's conjecture -/

namespace Entropy

/-- The Shannon entropy `∑ₛ -μ{s} log μ{s}` of a measure on a finite type (AC.1.1). -/
def measureEntropy {S : Type*} [Fintype S] [MeasurableSpace S] (μ : Measure S) : ℝ :=
  ∑ s, Real.negMulLog (μ {s}).toReal

variable {Ω : Type*} [MeasurableSpace Ω]
variable {S T U : Type*} [Fintype S] [MeasurableSpace S] [Fintype T] [MeasurableSpace T]
  [Fintype U] [MeasurableSpace U]

/-- The entropy `H[X]` of a random variable: the entropy of its law. -/
def entropy (X : Ω → S) (μ : Measure Ω) : ℝ := measureEntropy (μ.map X)

/-- Conditional entropy `H[X | Y] = ∑_y P(Y = y) H[X | Y = y]`. -/
def condEntropy (X : Ω → S) (Y : Ω → T) (μ : Measure Ω) : ℝ :=
  ∑ y, (μ.map Y {y}).toReal * entropy X (ProbabilityTheory.cond μ (Y ⁻¹' {y}))

/-- Mutual information `I[X : Y] = H[X] + H[Y] - H[X, Y]`. -/
def mutualInfo (X : Ω → S) (Y : Ω → T) (μ : Measure Ω) : ℝ :=
  entropy X μ + entropy Y μ - entropy (fun ω ↦ (X ω, Y ω)) μ

/-- Conditional mutual information `I[X : Y | Z] = ∑_z P(Z = z) I[(X | Z = z) : (Y | Z = z)]`. -/
def condMutualInfo (X : Ω → S) (Y : Ω → T) (Z : Ω → U) (μ : Measure Ω) : ℝ :=
  ∑ z, (μ.map Z {z}).toReal * mutualInfo X Y (ProbabilityTheory.cond μ (Z ⁻¹' {z}))

/-- The chain rule `H[X, Y] = H[X | Y] + H[Y]` ((A.3)). -/
theorem entropy_pair_eq_condEntropy_add [MeasurableSingletonClass S] [MeasurableSingletonClass T]
    (X : Ω → S) (Y : Ω → T) (hX : Measurable X) (hY : Measurable Y) (μ : Measure Ω)
    [IsProbabilityMeasure μ] :
    entropy (fun ω ↦ (X ω, Y ω)) μ = condEntropy X Y μ + entropy Y μ := sorry

/-- Independent random variables have zero mutual information. -/
example [MeasurableSingletonClass S] [MeasurableSingletonClass T]
    (X : Ω → S) (Y : Ω → T) (hX : Measurable X) (hY : Measurable Y) (μ : Measure Ω)
    [IsProbabilityMeasure μ] (h : ProbabilityTheory.IndepFun X Y μ) :
    mutualInfo X Y μ = 0 := sorry

/-- The uniform law on `Bool` has entropy `log 2` (natural logarithm). -/
example : measureEntropy (ProbabilityTheory.uniformOn (Set.univ : Set Bool)) = Real.log 2 :=
  sorry

/-- A point mass has entropy `0`. -/
example (s : S) [MeasurableSingletonClass S] : measureEntropy (Measure.dirac s) = 0 := sorry

variable {G : Type*} [AddCommGroup G] [Fintype G] [MeasurableSpace G]

/-- The entropic Ruzsa distance `d[μ ; ν] = H[X' - Y'] - H[X']/2 - H[Y']/2` for independent
`X' ∼ μ`, `Y' ∼ ν` ((1.1) of Gowers–Green–Manners–Tao; AC.1.2). -/
def rdist (μ ν : Measure G) : ℝ :=
  measureEntropy ((μ.prod ν).map fun p : G × G ↦ p.1 - p.2) - measureEntropy μ / 2 -
    measureEntropy ν / 2

/-- The conditional distance `d[X | Z ; Y | W]` ((A.14)). -/
def condRdist {Ω' : Type*} [MeasurableSpace Ω'] (X : Ω → G) (Z : Ω → S) (μ : Measure Ω)
    (Y : Ω' → G) (W : Ω' → T) (μ' : Measure Ω') : ℝ :=
  ∑ z, ∑ w, (μ.map Z {z}).toReal * (μ'.map W {w}).toReal *
    rdist ((ProbabilityTheory.cond μ (Z ⁻¹' {z})).map X)
      ((ProbabilityTheory.cond μ' (W ⁻¹' {w})).map Y)

/-- The functional `τ[μ₁ ; μ₂] = d[μ₁ ; μ₂] + η d[ρ₁ ; μ₁] + η d[ρ₂ ; μ₂]` ((2.1); AC.1.12). -/
def tau (η : ℝ) (ρ₁ ρ₂ μ₁ μ₂ : Measure G) : ℝ :=
  rdist μ₁ μ₂ + η * rdist ρ₁ μ₁ + η * rdist ρ₂ μ₂

/-- `(μ₁, μ₂)` is a pair of probability measures minimising `τ`. -/
def IsTauMinimizer (η : ℝ) (ρ₁ ρ₂ μ₁ μ₂ : Measure G) : Prop :=
  IsProbabilityMeasure μ₁ ∧ IsProbabilityMeasure μ₂ ∧
    ∀ ν₁ ν₂ : Measure G, IsProbabilityMeasure ν₁ → IsProbabilityMeasure ν₂ →
      tau η ρ₁ ρ₂ μ₁ μ₂ ≤ tau η ρ₁ ρ₂ ν₁ ν₂

/-- The entropic Ruzsa triangle inequality ((A.13); AC.1.3). -/
theorem rdist_triangle [MeasurableSingletonClass G] (μ ν ρ : Measure G) [IsProbabilityMeasure μ]
    [IsProbabilityMeasure ν] [IsProbabilityMeasure ρ] :
    rdist μ ν ≤ rdist μ ρ + rdist ρ ν := sorry

/-- The distance between two point masses at `0` vanishes. -/
example [MeasurableSingletonClass G] : rdist (Measure.dirac (0 : G)) (Measure.dirac 0) = 0 :=
  sorry

/-- Uniform laws on two cosets of one subgroup are at distance `0`. -/
example [MeasurableSingletonClass G] (H : AddSubgroup G) (a b : G) :
    rdist (ProbabilityTheory.uniformOn (a +ᵥ (H : Set G)))
      (ProbabilityTheory.uniformOn (b +ᵥ (H : Set G))) = 0 := sorry

/-- A minimiser of `τ` has distance zero, for `η = 1/9` in characteristic two
(Proposition 2.1; AC.1.16). -/
theorem rdist_eq_zero_of_isTauMinimizer [Module (ZMod 2) G] [MeasurableSingletonClass G]
    (ρ₁ ρ₂ μ₁ μ₂ : Measure G) [IsProbabilityMeasure ρ₁] [IsProbabilityMeasure ρ₂]
    (h : IsTauMinimizer (1 / 9) ρ₁ ρ₂ μ₁ μ₂) : rdist μ₁ μ₂ = 0 := sorry

/-- The entropic polynomial Freiman–Ruzsa theorem (Theorem 1.8; AC.1.17). -/
theorem entropic_pfr [Module (ZMod 2) G] [MeasurableSingletonClass G] (μ₁ μ₂ : Measure G)
    [IsProbabilityMeasure μ₁] [IsProbabilityMeasure μ₂] :
    ∃ H : AddSubgroup G,
      rdist μ₁ (ProbabilityTheory.uniformOn (H : Set G)) +
          rdist μ₂ (ProbabilityTheory.uniformOn (H : Set G)) ≤ 11 * rdist μ₁ μ₂ ∧
        rdist μ₁ (ProbabilityTheory.uniformOn (H : Set G)) ≤ 6 * rdist μ₁ μ₂ ∧
        rdist μ₂ (ProbabilityTheory.uniformOn (H : Set G)) ≤ 6 * rdist μ₁ μ₂ := sorry

end Entropy

/-- Marton's conjecture in characteristic two (Gowers–Green–Manners–Tao, Theorem 1.2; AC.1.18):
a set of doubling at most `K` is covered by at most `2 K ^ 12` cosets of a subgroup of size at
most `|A|`. -/
theorem pfr {G : Type*} [AddCommGroup G] [Module (ZMod 2) G] [Fintype G] [DecidableEq G]
    {A : Finset G} (hA : A.Nonempty) {K : ℝ} (hK : ((A + A).card : ℝ) ≤ K * A.card) :
    ∃ (H : AddSubgroup G) (c : Finset G), (Nat.card H : ℝ) ≤ A.card ∧
      (c.card : ℝ) ≤ 2 * K ^ 12 ∧ (A : Set G) ⊆ (c : Set G) + (H : Set G) := sorry

/-! ### Large spectra, Bohr sets and Freiman's theorem -/

namespace Bohr

open FiniteFourier

variable {G : Type*} [AddCommGroup G] [Fintype G]

/-- The large spectrum `{χ | τ ≤ ‖fourier f χ‖}`, with a closed absolute threshold (AC.1.19). -/
def largeSpectrum (f : G → ℂ) (τ : ℝ) : Set (AddChar G ℂ) := {χ | τ ≤ ‖fourier f χ‖}

/-- The chord Bohr set `{x | ∀ χ ∈ Λ, ‖χ x - 1‖ < δ}` (AC.1.20). -/
def bohrSet (Λ : Finset (AddChar G ℂ)) (δ : ℝ) : Set G := {x | ∀ χ ∈ Λ, ‖χ x - 1‖ < δ}

/-- The phase Bohr set `{x | ∀ χ ∈ Γ, |arg (χ x)| / (2π) < ε χ}` (AC.1.22). -/
def phaseBohrSet (Γ : Finset (AddChar G ℂ)) (ε : AddChar G ℂ → ℝ) : Set G :=
  {x | ∀ χ ∈ Γ, |Complex.arg (χ x)| / (2 * Real.pi) < ε χ}

/-- Regularity of a phase Bohr set, with non-strict volume comparisons (AC.1.22). -/
def IsRegularPhaseBohr (Γ : Finset (AddChar G ℂ)) (ε : AddChar G ℂ → ℝ) : Prop :=
  ∀ η : ℝ, 0 < 1 + η → (Γ.card : ℝ) * |η| ≤ 1 / 100 →
    (1 - 100 * Γ.card * |η|) * ((phaseBohrSet Γ ε).ncard : ℝ) ≤
        ((phaseBohrSet Γ fun χ ↦ (1 + η) * ε χ).ncard : ℝ) ∧
      ((phaseBohrSet Γ fun χ ↦ (1 + η) * ε χ).ncard : ℝ) ≤
        (1 + 100 * Γ.card * |η|) * ((phaseBohrSet Γ ε).ncard : ℝ)

/-- The empty frequency family imposes no condition, even at a negative radius. -/
example : bohrSet (∅ : Finset (AddChar (ZMod 4) ℂ)) (-1) = Set.univ := sorry

/-- The chord condition is strict: at radius `0` a nonempty family gives the empty set. -/
example : bohrSet ({1} : Finset (AddChar (ZMod 4) ℂ)) 0 = ∅ := sorry

/-- The phase condition is strict: `1 ∈ ZMod 4` has phase exactly `1/4` for `x ↦ i ^ x`. -/
example : (1 : ZMod 4) ∉ phaseBohrSet ({AddChar.zmodAddEquiv 1} : Finset (AddChar (ZMod 4) ℂ))
    (fun _ ↦ 1 / 4) := sorry

/-- A character's large spectrum at the threshold `1` is itself. -/
example (ψ : AddChar G ℂ) : largeSpectrum (fun x ↦ ψ x) 1 = {ψ} := sorry

/-- Bogolyubov's lemma in spectral form (Tao, Notes 2, §6; AC.1.21). -/
theorem bohrSet_largeSpectrum_subset_double_sub_double [DecidableEq G] {A : Finset G}
    (hA : A.Nonempty) {K : ℝ} (hK₀ : 0 < K) (hK : ((A + A).card : ℝ) ≤ K * A.card) :
    let ρ : ℝ := A.card / Fintype.card G
    ∃ Λ : Finset (AddChar G ℂ),
      (Λ : Set (AddChar G ℂ)) = largeSpectrum (Set.indicator (A : Set G) 1) (ρ / (2 * √K)) ∧
        (Λ.card : ℝ) ≤ 4 * K / ρ ∧ bohrSet Λ (1 / 4) ⊆ ((A + A - A - A : Finset G) : Set G) :=
  sorry

/-- A phase Bohr set at a regular scale exists between `ε / 2` and `ε` (AC.1.23). -/
theorem exists_isRegularPhaseBohr (Γ : Finset (AddChar G ℂ)) (ε : AddChar G ℂ → ℝ)
    (hε : ∀ χ ∈ Γ, 0 < ε χ) :
    ∃ r ∈ Set.Icc (1 / 2 : ℝ) 1, IsRegularPhaseBohr Γ fun χ ↦ r * ε χ := sorry

end Bohr

/-- A generalised arithmetic progression of rank `d` in an abelian group: a base, `d` steps and
`d` lengths (AC.1.25). -/
structure GeneralizedAP (G : Type*) [AddCommGroup G] (d : ℕ) where
  /-- The base point. -/
  base : G
  /-- The steps. -/
  step : Fin d → G
  /-- The lengths: the `i`-th parameter runs over `0, …, len i`. -/
  len : Fin d → ℕ

namespace GeneralizedAP

variable {G : Type*} [AddCommGroup G] {d : ℕ}

/-- The evaluation `a + ∑ nᵢ vᵢ`. -/
def point (P : GeneralizedAP G d) (n : Fin d → ℕ) : G := P.base + ∑ i, n i • P.step i

/-- The parameter box `∏ᵢ {0, …, Lᵢ}`. -/
def box (P : GeneralizedAP G d) : Finset (Fin d → ℕ) :=
  Fintype.piFinset fun i ↦ Finset.range (P.len i + 1)

/-- The points of the progression. -/
def carrier [DecidableEq G] (P : GeneralizedAP G d) : Finset G := P.box.image P.point

/-- The volume `∏ (Lᵢ + 1)`: a count of parameters, not of points. -/
def volume (P : GeneralizedAP G d) : ℕ := ∏ i, (P.len i + 1)

/-- Properness: evaluation is injective on the parameter box. -/
def IsProper (P : GeneralizedAP G d) : Prop := Set.InjOn P.point P.box

/-- The progression `3, 5, 7` in `ℤ` is proper of volume `3`. -/
example : (⟨3, fun _ ↦ 2, fun _ ↦ 2⟩ : GeneralizedAP ℤ 1).carrier = {3, 5, 7} ∧
    (⟨3, fun _ ↦ 2, fun _ ↦ 2⟩ : GeneralizedAP ℤ 1).IsProper := sorry

/-- A step of order two with length two wraps around in `ZMod 2`: volume three, two points. -/
example : (⟨0, fun _ ↦ 1, fun _ ↦ 2⟩ : GeneralizedAP (ZMod 2) 1).volume = 3 ∧
    ¬ (⟨0, fun _ ↦ 1, fun _ ↦ 2⟩ : GeneralizedAP (ZMod 2) 1).IsProper := sorry

end GeneralizedAP

/-- The Balog–Szemerédi–Gowers theorem with polynomial losses (Tao, Notes 3; AC.1.26). -/
theorem balog_szemeredi_gowers :
    ∃ c > (0 : ℝ), ∃ C ≥ (1 : ℝ), ∀ {G : Type} [AddCommGroup G] [DecidableEq G]
      (A : Finset G) (K : ℝ), A.Nonempty → 1 ≤ K → (A.card : ℝ) ^ 3 / K ≤ A.addEnergy A →
      ∃ A' ⊆ A, c * K ^ (-C) * A.card ≤ A'.card ∧
        ((A' + A').card : ℝ) ≤ c⁻¹ * K ^ C * A'.card := sorry

/-- Freiman's theorem in torsion-free abelian groups (Tao, Notes 2, Theorem 3.1; AC.1.30). -/
theorem freiman_torsion_free (K : ℝ) (hK : 1 ≤ K) :
    ∃ D : ℕ, ∃ C ≥ (1 : ℝ), ∀ {G : Type} [AddCommGroup G] [IsAddTorsionFree G] [DecidableEq G]
      (A : Finset G), A.Nonempty → ((A + A).card : ℝ) ≤ K * A.card →
      ∃ (d : ℕ) (P : GeneralizedAP G d), d ≤ D ∧ P.IsProper ∧ A ⊆ P.carrier ∧
        (P.volume : ℝ) ≤ C * A.card := sorry

/-- Freiman's theorem for groups of bounded exponent (Tao, Notes 2, Theorem 2.1; AC.1.31). -/
theorem freiman_bounded_exponent (r : ℕ) (hr : 0 < r) (K : ℝ) (hK : 1 ≤ K) :
    ∃ C ≥ (1 : ℝ), ∀ {G : Type} [AddCommGroup G] [DecidableEq G], (∀ x : G, r • x = 0) →
      ∀ A : Finset G, A.Nonempty → ((A + A).card : ℝ) ≤ K * A.card →
      ∃ (H : AddSubgroup G) (x : G), (H : Set G).Finite ∧ (A : Set G) ⊆ x +ᵥ (H : Set G) ∧
        (Nat.card H : ℝ) ≤ C * A.card := sorry

/-! ## Layer AC.3: Gowers norms, nilsequences and the inverse theorem -/

namespace Gowers

variable {G : Type*} [AddCommGroup G] [Fintype G]

/-- The vertex `ω · h = ∑ᵢ ωᵢ hᵢ` of a cube. -/
def cubeVertex {d : ℕ} (ω : Fin d → Bool) (h : Fin d → G) : G :=
  ∑ i, if ω i then h i else 0

/-- Conjugate exactly at the vertices with an odd number of ones. -/
def parityConj {d : ℕ} (ω : Fin d → Bool) (z : ℂ) : ℂ :=
  if Even (univ.filter fun i ↦ ω i = true).card then z else conj z

/-- The complex Gowers cube `𝔼_{x,h} ∏_ω C^{|ω|} f_ω (x + ω · h)` (AC.3.1). -/
def gowersInnerProduct (d : ℕ) (f : (Fin d → Bool) → G → ℂ) : ℂ :=
  univ.expect fun x : G ↦ univ.expect fun h : Fin d → G ↦
    ∏ ω : Fin d → Bool, parityConj ω (f ω (x + cubeVertex ω h))

/-- The uniformity norm: the `2 ^ d`-th root of the real part of the diagonal cube. -/
def gowersNorm (d : ℕ) (f : G → ℂ) : ℝ :=
  (gowersInnerProduct d fun _ ↦ f).re ^ ((1 : ℝ) / 2 ^ d)

/-- The Gowers–Cauchy–Schwarz inequality (AC.3.2). -/
theorem gowers_cauchy_schwarz (d : ℕ) (hd : 1 ≤ d) (f : (Fin d → Bool) → G → ℂ) :
    ‖gowersInnerProduct d f‖ ≤ ∏ ω, gowersNorm d (f ω) := sorry

/-- The triangle inequality (AC.3.3). -/
theorem gowersNorm_add_le (d : ℕ) (hd : 1 ≤ d) (f g : G → ℂ) :
    gowersNorm d (f + g) ≤ gowersNorm d f + gowersNorm d g := sorry

/-- Monotonicity in the order (AC.3.4). -/
theorem gowersNorm_mono (d : ℕ) (hd : 1 ≤ d) (f : G → ℂ) :
    gowersNorm d f ≤ gowersNorm (d + 1) f := sorry

/-- `U^d` is a norm for `d ≥ 2` (AC.3.5). -/
theorem gowersNorm_eq_zero_iff (d : ℕ) (hd : 2 ≤ d) (f : G → ℂ) :
    gowersNorm d f = 0 ↔ f = 0 := sorry

/-- `U¹` is the modulus of the mean. -/
theorem gowersNorm_U1 (f : G → ℂ) : gowersNorm 1 f = ‖univ.expect f‖ := sorry

/-- `‖f‖_{U²} ^ 4 = ∑_χ ‖fourier f χ‖ ^ 4` with the normalisation of Layer AC.0. -/
theorem gowersNorm_U2_fourier (f : G → ℂ) :
    gowersNorm 2 f ^ 4 = ∑ χ : AddChar G ℂ, ‖FiniteFourier.fourier f χ‖ ^ 4 := sorry

/-- A mixed cube need not be nonnegative: for constants `1` and `-1` it is `-1`. -/
example : gowersInnerProduct (G := ZMod 2) 1 (fun ω _ ↦ if ω 0 then -1 else 1) = -1 := sorry

/-- On `ZMod 2`, the character `(1, -1)` has `U¹` norm `0` and `U²` norm `1`. -/
example : gowersNorm 1 (fun x : ZMod 2 ↦ if x = 0 then (1 : ℂ) else -1) = 0 ∧
    gowersNorm 2 (fun x : ZMod 2 ↦ if x = 0 then (1 : ℂ) else -1) = 1 := sorry

/-- The interval `[N] = {1, …, N}` as a predicate on residues modulo `2 ^ d * N + 1`. -/
def inInterval (d N : ℕ) (x : ZMod (2 ^ d * N + 1)) : Prop := 1 ≤ x.val ∧ x.val ≤ N

/-- The interval norm `U^d[N](f)`: the `U^d` norm of the zero extension of `f` from `[N]` into
`ZMod (2 ^ d * N + 1)`, divided by that of the indicator of `[N]`; `0` for the empty interval
(AC.3.6). -/
def intervalGowersNorm (d N : ℕ) (f : ℤ → ℂ) : ℝ :=
  open Classical in
  if N = 0 then 0 else
    gowersNorm d (fun x : ZMod (2 ^ d * N + 1) ↦ if inInterval d N x then f x.val else 0) /
      gowersNorm d (fun x : ZMod (2 ^ d * N + 1) ↦ if inInterval d N x then 1 else 0)

/-- The empty interval has norm `0`, whatever the function. -/
example (d : ℕ) : intervalGowersNorm d 0 (fun _ ↦ 1) = 0 := sorry

/-- A single point: the value `2i` has norm `2` in every order `d ≥ 1`. -/
example (d : ℕ) (hd : 1 ≤ d) : intervalGowersNorm d 1 (fun _ ↦ 2 * Complex.I) = 2 := sorry

/-- The ratio does not depend on the admissible modulus. -/
theorem intervalGowersNorm_independent_modulus (d N M : ℕ) [NeZero M] (hM : 2 ^ d * N ≤ M)
    (hN : 1 ≤ N) (f : ℤ → ℂ) :
    open Classical in
    intervalGowersNorm d N f =
      gowersNorm d (fun x : ZMod M ↦ if 1 ≤ x.val ∧ x.val ≤ N then f x.val else 0) /
        gowersNorm d (fun x : ZMod M ↦ if 1 ≤ x.val ∧ x.val ≤ N then 1 else 0) := sorry

end Gowers

namespace Nil

/-- A degree-`s` filtration: subgroups `G_i` with `G₀ = G₁ = G`, `G_{s+1} = 1`, nested, and with
`[G_i, G_j] ≤ G_{i+j}` (Leng–Sah–Sawhney, Definitions 2.3–2.4; AC.3.7). -/
structure DegreeFiltration (G : Type*) [Group G] (s : ℕ) where
  /-- The subgroup `G_i`. -/
  level : ℕ → Subgroup G
  level_zero : level 0 = ⊤
  level_one : level 1 = ⊤
  level_succ_degree : level (s + 1) = ⊥
  antitone : Antitone level
  comm_mem : ∀ i j, ∀ x ∈ level i, ∀ y ∈ level j, x⁻¹ * y⁻¹ * x * y ∈ level (i + j)

/-- A degree-zero filtration forces the group to be trivial. -/
example {G : Type*} [Group G] (F : DegreeFiltration G 0) : Subsingleton G := sorry

/-- A degree-one filtration exists exactly when the group is commutative. -/
theorem DegreeFiltration.degree_one_iff {G : Type*} [Group G] :
    Nonempty (DegreeFiltration G 1) ↔ ∀ x y : G, x * y = y * x := sorry

variable {G : Type*} [Group G] {ℓ : ℕ}

/-- The derivative `∂_h g (n) = g (n + h) * (g n)⁻¹`. -/
def filteredDerivative (h : Fin ℓ → ℤ) (g : (Fin ℓ → ℤ) → G) : (Fin ℓ → ℤ) → G :=
  fun n ↦ g (n + h) * (g n)⁻¹

/-- Iterated derivatives along a list of directions; the empty list returns `g`. -/
def iteratedFilteredDerivative : List (Fin ℓ → ℤ) → ((Fin ℓ → ℤ) → G) → (Fin ℓ → ℤ) → G
  | [], g => g
  | h :: hs, g => filteredDerivative h (iteratedFilteredDerivative hs g)

/-- A sequence is polynomial for a filtration when every `r`-fold derivative lies in `G_r`
(Leng–Sah–Sawhney, Definitions 2.5–2.6; AC.3.8). -/
def IsFilteredPolynomial {s : ℕ} (F : DegreeFiltration G s) (g : (Fin ℓ → ℤ) → G) : Prop :=
  ∀ (hs : List (Fin ℓ → ℤ)) (n : Fin ℓ → ℤ), iteratedFilteredDerivative hs g n ∈ F.level hs.length

/-- Constant sequences are polynomial. -/
example {s : ℕ} (F : DegreeFiltration G s) (c : G) : IsFilteredPolynomial (ℓ := ℓ) F (fun _ ↦ c) :=
  sorry

/-- The orientation of the derivative: for `g n = a ^ n * b`, `∂_h g n = a ^ h`. -/
example (a b : G) (h n : Fin 1 → ℤ) :
    filteredDerivative h (fun m ↦ a ^ m 0 * b) n = a ^ h 0 := sorry

/-- Polynomial sequences form a group under pointwise multiplication (Lazard–Leibman; AC.3.9). -/
theorem IsFilteredPolynomial.mul {s : ℕ} {F : DegreeFiltration G s} {g₁ g₂ : (Fin ℓ → ℤ) → G}
    (h₁ : IsFilteredPolynomial F g₁) (h₂ : IsFilteredPolynomial F g₂) :
    IsFilteredPolynomial F (g₁ * g₂) := sorry

/-- Taylor expansion of a one-variable polynomial sequence, with coefficients multiplied in
increasing degree and integer binomial exponents (AC.3.9). -/
theorem polynomial_sequence_taylor {s : ℕ} (F : DegreeFiltration G s) (g : (Fin 1 → ℤ) → G)
    (hg : IsFilteredPolynomial F g) :
    ∃! c : Fin (s + 1) → G, (∀ i : Fin (s + 1), c i ∈ F.level i) ∧
      ∀ n : Fin 1 → ℤ, g n = (List.ofFn fun i : Fin (s + 1) ↦ c i ^ Ring.choose (n 0) i).prod :=
  sorry

/-- The distance from a real number to the nearest integer. -/
def distToInt (x : ℝ) : ℝ := |x - round x|

/-- The smoothness norm `max_{1 ≤ j ≤ s} N ^ j ‖α_j‖_{ℝ/ℤ}` of the polynomial
`∑_j α_j binom(n, j)`; the constant coefficient is excluded (AC.3.14). -/
def polynomialSmoothness (N s : ℕ) (α : ℕ → ℝ) : ℝ :=
  ⨆ j : Finset.Icc 1 s, (N : ℝ) ^ (j : ℕ) * distToInt (α j)

/-- `P(n) = n/4` has smoothness `N/4`. -/
example (N : ℕ) : polynomialSmoothness N 1 (fun j ↦ if j = 1 then 1 / 4 else 0) = N / 4 := sorry

/-- `P(n) = binom(n, 2) / 2` has smoothness `N ^ 2 / 2` in the binomial basis. -/
example (N : ℕ) (hN : 1 ≤ N) :
    polynomialSmoothness N 2 (fun j ↦ if j = 2 then 1 / 2 else 0) = (N : ℝ) ^ 2 / 2 := sorry

/-- `γ` is `M`-rational for `Γ`: some power `γ ^ r` with `1 ≤ r ≤ M` lies in `Γ` (AC.3.19). -/
def IsRationalElement (Γ : Subgroup G) (M : ℕ) (γ : G) : Prop :=
  ∃ r : ℕ, 1 ≤ r ∧ r ≤ M ∧ γ ^ r ∈ Γ

/-- Pointwise rationality together with a period at most `M` of the cosets: two conditions. -/
def IsRationalPeriodicSequence (Γ : Subgroup G) (M : ℕ) (γ : ℤ → G) : Prop :=
  (∀ n, IsRationalElement Γ M (γ n)) ∧
    ∃ q : ℕ, 1 ≤ q ∧ q ≤ M ∧ ∀ n, (γ (n + q))⁻¹ * γ n ∈ Γ

/-- In `ℝ/ℤ`, `1/3` is `3`-rational but not `2`-rational. -/
example : IsRationalElement (AddSubgroup.toSubgroup (AddSubgroup.zmultiples (1 : ℝ))) 3
      (Multiplicative.ofAdd (1 / 3 : ℝ)) ∧
    ¬ IsRationalElement (AddSubgroup.toSubgroup (AddSubgroup.zmultiples (1 : ℝ))) 2
      (Multiplicative.ofAdd (1 / 3 : ℝ)) := sorry

section Nilmanifold

variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  {H : Type*} [TopologicalSpace H] (I : ModelWithCorners ℝ E H)
  (N : Type*) [Group N] [TopologicalSpace N] [ChartedSpace H N] [LieGroup I ⊤ N]

/-- A degree-`s` filtered nilmanifold: a connected, simply connected nilpotent Lie group with a
degree-`s` filtration by closed connected subgroups and a discrete cocompact subgroup `Γ` that
meets every `G_i` cocompactly; `Γ` need not be normal (AC.3.11). -/
structure FilteredNilmanifold (s : ℕ) where
  /-- The filtration. -/
  filtration : DegreeFiltration N s
  /-- The lattice. -/
  lattice : Subgroup N
  simplyConnected : SimplyConnectedSpace N
  nilpotent : Group.IsNilpotent N
  level_closed : ∀ i, IsClosed (filtration.level i : Set N)
  level_connected : ∀ i, IsConnected (filtration.level i : Set N)
  lattice_discrete : DiscreteTopology lattice
  lattice_cocompact : CompactSpace (N ⧸ lattice)
  level_cocompact : ∀ i, CompactSpace (filtration.level i ⧸ lattice.subgroupOf (filtration.level i))

end Nilmanifold

end Nil

/-! ## Layer AC.2: progressions in dense sets and removal -/

namespace Progressions

/-- The cyclic progression average `𝔼_{x,r} ∏_i f_i (x + i r)`, including `r = 0` (AC.2.1). -/
def cyclicProgressionAverage (N k : ℕ) [NeZero N] (f : Fin k → ZMod N → ℂ) : ℂ :=
  univ.expect fun x : ZMod N ↦ univ.expect fun r : ZMod N ↦
    ∏ i : Fin k, f i (x + ((i : ℕ) : ZMod N) * r)

/-- The interval progression average over `0 ≤ x, r ≤ N` with zero extension from `[N]`,
denominator `(N + 1) ^ 2` (AC.2.1). -/
def intervalProgressionAverage (N k : ℕ) (f : Fin k → ℤ → ℂ) : ℂ :=
  open Classical in
  ((N + 1 : ℂ) ^ 2)⁻¹ * ∑ x ∈ range (N + 1), ∑ r ∈ range (N + 1),
    ∏ i : Fin k, if 1 ≤ x + (i : ℕ) * r ∧ x + (i : ℕ) * r ≤ N then
      f i ((x + (i : ℕ) * r : ℕ) : ℤ) else 0

/-- On `ZMod 5` the indicator of `{0}` has three-term average `1/25`. -/
example : cyclicProgressionAverage 5 3 (fun _ ↦ Pi.single 0 1) = 1 / 25 := sorry

/-- The indicator of `[2]`, three terms: only `x = 1, 2` with `r = 0` count, giving `2/9`. -/
example : intervalProgressionAverage 2 3 (fun _ _ ↦ 1) = 2 / 9 := sorry

/-- The dense generalised von Neumann inequality on `ZMod p` (AC.2.2). -/
theorem dense_generalised_von_neumann (p k : ℕ) [Fact p.Prime] (hk : 2 ≤ k) (hpk : k < p)
    (f : Fin k → ZMod p → ℂ) (hf : ∀ i x, ‖f i x‖ ≤ 1) (i : Fin k) :
    ‖cyclicProgressionAverage p k f‖ ≤ Gowers.gowersNorm (k - 1) (f i) := sorry

/-- Szemerédi's theorem with the Leng–Sah–Sawhney bound, `k ≥ 5` (Theorem 1.1; AC.2.7). -/
theorem quantitative_szemeredi (k : ℕ) (hk : 5 ≤ k) :
    ∃ C ≥ (1 : ℝ), ∃ c ∈ Set.Ioo (0 : ℝ) 1, ∀ N : ℕ, 3 ≤ N → ∀ A ⊆ Finset.Icc 1 N,
      (∀ a d : ℕ, 0 < d → ¬ ∀ i < k, a + i * d ∈ A) →
      (A.card : ℝ) ≤ C * N * Real.exp (-(Real.log (Real.log N)) ^ c) := sorry

/-- The upper natural density `limsup |A ∩ [0, N)| / N`, anchored at `0` (AC.2.8). -/
def upperNaturalDensity (A : Set ℕ) : ℝ :=
  Filter.limsup (fun N : ℕ ↦ ((A ∩ Set.Iio N).ncard : ℝ) / N) Filter.atTop

/-- The even numbers have upper density `1/2`. -/
example : upperNaturalDensity {n | Even n} = 1 / 2 := sorry

/-- A finite set has upper density `0`. -/
example : upperNaturalDensity ({0, 1, 2} : Set ℕ) = 0 := sorry

/-- Szemerédi's theorem in positive upper density (AC.2.9). -/
theorem szemeredi_of_upperNaturalDensity_pos (k : ℕ) (A : Set ℕ) (hA : 0 < upperNaturalDensity A)
    (L : ℕ) : ∃ a d : ℕ, L < a ∧ 0 < d ∧ ∀ i < k, a + i * d ∈ A := sorry

/-- The Varnavides form on `ZMod p` (AC.2.9). -/
theorem szemeredi_varnavides (k : ℕ) (hk : 3 ≤ k) (δ : ℝ) (hδ : 0 < δ) :
    ∃ c > (0 : ℝ), ∃ N₀ : ℕ, ∀ p : ℕ, [Fact p.Prime] → N₀ ≤ p → ∀ f : ZMod p → ℝ,
      (∀ x, 0 ≤ f x ∧ f x ≤ 1) → δ ≤ univ.expect f →
      c ≤ (cyclicProgressionAverage p k fun _ x ↦ (f x : ℂ)).re := sorry

/-- Rahman's explicit threshold for three-term progressions (Bennett–Siksek, Theorem 8;
AC.2.10). -/
theorem rahman_roth_threshold (δ : ℝ) (hδ : 0 < δ) (hδ₁ : δ < 1) (k : ℕ)
    (hk : Real.exp (Real.exp (132 * Real.log 2 / δ)) ≤ k) (J : Finset ℕ) (hJ : J ⊆ range k)
    (hJδ : δ * k ≤ J.card) : ∃ i j, i < j ∧ i ∈ J ∧ j ∈ J ∧ 2 * j - i ∈ J := sorry

/-- The cycle removal lemma for layered graphs: few closed walks advancing one layer at a time
can be destroyed by deleting few arcs (Conlon–Fox, Theorem 4.3; AC.2.11). -/
theorem layered_cycle_removal (m : ℕ) [NeZero m] (hm : 3 ≤ m) (ε : ℝ) (hε : 0 < ε) :
    ∃ δ > (0 : ℝ), ∀ (V : Type) [Fintype V] [DecidableEq V] (E : Fin m → Finset (V × V)),
      ((univ.filter fun v : Fin m → V ↦ ∀ i, (v i, v (i + 1)) ∈ E i).card : ℝ) ≤
        δ * Fintype.card V ^ m →
      ∃ E' : Fin m → Finset (V × V), (∀ i, E' i ⊆ E i ∧
          ((E i \ E' i).card : ℝ) ≤ ε * Fintype.card V ^ 2) ∧
        ∀ v : Fin m → V, ¬ ∀ i, (v i, v (i + 1)) ∈ E' i := sorry

/-- Removal for an ordered product equation in a finite group (Král'–Serra–Vena, Theorem 2;
AC.2.12). -/
theorem ordered_product_removal (m : ℕ) (hm : 2 ≤ m) (ε : ℝ) (hε : 0 < ε) :
    ∃ δ > (0 : ℝ), ∀ (G : Type) [Group G] [Fintype G] [DecidableEq G]
      (A : Fin m → Finset G) (a : G),
      ((univ.filter fun x : Fin m → G ↦ (∀ i, x i ∈ A i) ∧ (List.ofFn x).prod = a).card : ℝ) ≤
        δ * Fintype.card G ^ (m - 1) →
      ∃ A' : Fin m → Finset G, (∀ i, A' i ⊆ A i ∧ ((A i \ A' i).card : ℝ) ≤ ε * Fintype.card G) ∧
        ∀ x : Fin m → G, (∀ i, x i ∈ A' i) → (List.ofFn x).prod ≠ a := sorry

end Progressions

/-! ## Layer AC.4: transference and arithmetic progressions in the primes -/

namespace Transference

open Progressions

variable (k N : ℕ) [NeZero N]

/-- The form `ψ_j (x) = ∑_{i ≠ j} (i - j) x_i` on `(ZMod N) ^ k` (AC.4.6). -/
def apLinearForm (j : Fin k) (x : Fin k → ZMod N) : ZMod N :=
  ∑ i : Fin k, ((((i : ℕ) : ℤ) - ((j : ℕ) : ℤ) : ℤ) : ZMod N) * x i

/-- The `k 2 ^ (k - 1)` indexed forms: pairs `(j, ω)` with `ω j` fixed to `false`. -/
abbrev APFormIndex := {p : Fin k × (Fin k → Bool) // p.2 p.1 = false}

/-- The largest deviation from `1` of a selected product of the doubled forms (AC.4.6). -/
def apLinearFormsError (ν : ZMod N → ℝ) : ℝ :=
  ⨆ S : Finset (APFormIndex k), |univ.expect (fun x₀ : Fin k → ZMod N ↦
    univ.expect fun x₁ : Fin k → ZMod N ↦
      ∏ p ∈ S, ν (apLinearForm k N p.1.1 fun i ↦ if p.1.2 i then x₁ i else x₀ i)) - 1|

/-- The `ε`-linear-forms condition for progressions (Conlon–Fox–Zhao, Definition 4.1). -/
def APLinearFormsCondition (ε : ℝ) (ν : ZMod N → ℝ) : Prop :=
  (∀ x, 0 ≤ ν x) ∧ apLinearFormsError k N ν ≤ ε

/-- At `k = 3` there are twelve indexed forms, not twenty-four. -/
example : Fintype.card (APFormIndex 3) = 12 := sorry

/-- The constant weight `1` has error `0`, and the constant weight `2` does not. -/
example : apLinearFormsError 3 N (fun _ ↦ 1) = 0 ∧ 1 ≤ apLinearFormsError 3 N (fun _ ↦ 2) := sorry

/-- The cut discrepancy of `f` and `g` along `ψ_j`, against products of `[0, 1]`-valued tests,
the `i`-th test not depending on `x_i` (AC.4.7). -/
def arithmeticDiscrepancy (j : Fin k) (f g : ZMod N → ℝ) : ℝ :=
  ⨆ (u : Fin k → (Fin k → ZMod N) → ℝ) (_ : ∀ i x, 0 ≤ u i x ∧ u i x ≤ 1)
    (_ : ∀ i (x y : Fin k → ZMod N), (∀ l, l ≠ i → x l = y l) → u i x = u i y),
    |univ.expect fun x : Fin k → ZMod N ↦ (f (apLinearForm k N j x) - g (apLinearForm k N j x)) *
      ∏ i ∈ univ.erase j, u i x|

/-- `f` and `g` are an `ε`-discrepancy pair along every `ψ_j`. -/
def IsDiscrepancyPair (ε : ℝ) (f g : ZMod N → ℝ) : Prop :=
  ∀ j, arithmeticDiscrepancy k N j f g ≤ ε

/-- For constants the discrepancy is the difference of the constants. -/
example (j : Fin 3) (c d : ℝ) :
    arithmeticDiscrepancy 3 N j (fun _ ↦ c) (fun _ ↦ d) = |c - d| := sorry

/-- The dense model theorem (Conlon–Fox–Zhao, Theorem 5.1; AC.4.8). -/
theorem arithmetic_dense_model (hk : 3 ≤ k) (ε : ℝ) (hε : 0 < ε) :
    ∃ η > (0 : ℝ), ∀ (N : ℕ) [NeZero N], N.Coprime (k - 1).factorial →
      ∀ ν f : ZMod N → ℝ, (∀ x, 0 ≤ ν x) → (∀ j, arithmeticDiscrepancy k N j ν 1 ≤ η) →
      (∀ x, 0 ≤ f x ∧ f x ≤ ν x) → univ.expect f ≤ 1 →
      ∃ g : ZMod N → ℝ, (∀ x, 0 ≤ g x ∧ g x ≤ 1) ∧ IsDiscrepancyPair k N ε f g := sorry

/-- Relative counting (Conlon–Fox–Zhao, Theorem 6.1; AC.4.9). -/
theorem relative_progression_counting (hk : 3 ≤ k) (γ : ℝ) (hγ : 0 < γ) :
    ∃ ε > (0 : ℝ), ∃ η > (0 : ℝ), ∀ (N : ℕ) [NeZero N], N.Coprime (k - 1).factorial →
      ∀ (ν : ZMod N → ℝ) (f g : Fin k → ZMod N → ℝ), APLinearFormsCondition k N η ν →
      (∀ j x, 0 ≤ f j x ∧ f j x ≤ ν x) → (∀ j x, 0 ≤ g j x ∧ g j x ≤ 1) →
      (∀ j, arithmeticDiscrepancy k N j (f j) (g j) ≤ ε) →
      ‖cyclicProgressionAverage N k (fun j x ↦ (f j x : ℂ)) -
          cyclicProgressionAverage N k (fun j x ↦ (g j x : ℂ))‖ ≤ γ := sorry

/-- The linear-forms relative Szemerédi theorem (Conlon–Fox–Zhao, Theorem 7.1; AC.4.10). -/
theorem linear_forms_relative_szemeredi (hk : 3 ≤ k) (δ : ℝ) (hδ : 0 < δ) (hδ₁ : δ ≤ 1) :
    ∃ c > (0 : ℝ), ∀ γ > (0 : ℝ), ∃ η > (0 : ℝ), ∀ (N : ℕ) [NeZero N],
      N.Coprime (k - 1).factorial → ∀ ν f : ZMod N → ℝ, APLinearFormsCondition k N η ν →
      (∀ x, 0 ≤ f x ∧ f x ≤ ν x) → δ ≤ univ.expect f →
      c - γ ≤ (cyclicProgressionAverage N k fun _ x ↦ (f x : ℂ)).re := sorry

end Transference

namespace Majorant

/-- The smooth truncated divisor sum `log R · ∑_{d ∣ n} μ(d) χ(log d / log R)` (AC.4.11). -/
def smoothDivisorSum (χ : ℝ → ℝ) (R : ℝ) (n : ℤ) : ℝ :=
  Real.log R * ∑ d ∈ n.natAbs.divisors,
    (ArithmeticFunction.moebius d : ℝ) * χ (Real.log d / Real.log R)

/-- The sharp Goldston–Yıldırım sum `∑_{d ∣ n, d ≤ R} μ(d) log (R / d)` (AC.4.14). -/
def truncatedDivisorSum (R : ℝ) (n : ℤ) : ℝ :=
  ∑ d ∈ n.natAbs.divisors.filter (fun d : ℕ ↦ (d : ℝ) ≤ R),
    (ArithmeticFunction.moebius d : ℝ) * Real.log (R / d)

/-- The modified prime weight `(φ(W)/W) log (W n + b)` at shifted primes, `0` elsewhere. -/
def modifiedPrimeWeight (W b n : ℕ) : ℝ :=
  if (W * n + b).Prime then (Nat.totient W : ℝ) / W * Real.log (W * n + b) else 0

/-- The smooth W-tricked majorant on the half-window `N/2 ≤ n < N`, and `1` outside it, with
`W = primorial w` and `R = N ^ (1 / (k 2 ^ (k + 3)))` (AC.4.11). -/
def smoothMajorant (k : ℕ) (χ : ℝ → ℝ) (cχ : ℝ) (w b N n : ℕ) : ℝ :=
  let W := primorial w
  let R : ℝ := (N : ℝ) ^ ((1 : ℝ) / (k * 2 ^ (k + 3)))
  if N ≤ 2 * n ∧ n < N then
    (Nat.totient W : ℝ) / W * smoothDivisorSum χ R (W * n + b) ^ 2 / (cχ * Real.log R)
  else 1

/-- The original sharp-cutoff majorant of Green–Tao on the window `ε_k N ≤ n ≤ 2 ε_k N`, and `1`
outside it, with `ε_k = 1 / (2 ^ k (k + 4)!)`, `W = primorial w` and
`R = N ^ (1 / (k 2 ^ (k + 4)))` (AC.4.14). -/
def majorantNu (k w N n : ℕ) : ℝ :=
  let W := primorial w
  let R : ℝ := (N : ℝ) ^ ((1 : ℝ) / (k * 2 ^ (k + 4)))
  let εk : ℝ := 1 / (2 ^ k * (k + 4).factorial)
  if εk * N ≤ n ∧ (n : ℝ) ≤ 2 * εk * N then
    (Nat.totient W : ℝ) / W * truncatedDivisorSum R (W * n + 1) ^ 2 / Real.log R
  else 1

/-- At the representative `0` the original majorant is `1`. -/
example (k w N : ℕ) (hN : 1 ≤ N) : majorantNu k w N 0 = 1 := sorry

/-- The W-trick modulus at `w = 5` is `30`. -/
example : primorial 5 = 30 := sorry

/-- The shift matters: `6 · 1 + 1 = 7` is prime though `1` is not, and `6 · 4 + 1 = 25` is not. -/
example : modifiedPrimeWeight 6 1 1 ≠ 0 ∧ modifiedPrimeWeight 6 1 4 = 0 := sorry

/-- Outside the half-window the majorant is `1`. -/
example (k : ℕ) (χ : ℝ → ℝ) (cχ : ℝ) (w b N n : ℕ) (hn : 2 * n < N) :
    smoothMajorant k χ cχ w b N n = 1 := sorry

/-- At a prime `p > R` the smooth divisor sum is `log R`. -/
theorem smoothDivisorSum_large_prime (χ : ℝ → ℝ) (hχ0 : χ 0 = 1) (hχ : ∀ t, 1 < |t| → χ t = 0)
    (R : ℝ) (hR : 1 < R) (p : ℕ) (hp : p.Prime) (hpR : R < p) :
    smoothDivisorSum χ R p = Real.log R := sorry

end Majorant

/-- The Green–Tao theorem: the primes contain arbitrarily long arithmetic progressions, beyond
every bound (AC.4.15). -/
theorem prime_progressions (k H : ℕ) :
    ∃ a r : ℕ, H < a ∧ 1 ≤ r ∧ ∀ i < k, (a + i * r).Prime := sorry

/-! ## Layer AC.5: Möbius orthogonality and linear patterns in primes -/

namespace PrimePatterns

/-- An integer affine system of `t` forms in `d` variables (AC.5.4). -/
structure AffineSystem (t d : ℕ) where
  /-- The slopes `v_i ∈ ℤ ^ d`. -/
  slope : Fin t → Fin d → ℤ
  /-- The offsets `b_i ∈ ℤ`. -/
  offset : Fin t → ℤ

namespace AffineSystem

variable {t d : ℕ}

/-- The value `ψ_i (x) = b_i + v_i · x`. -/
def eval (Ψ : AffineSystem t d) (i : Fin t) (x : Fin d → ℤ) : ℤ :=
  Ψ.offset i + ∑ j, Ψ.slope i j * x j

/-- Cauchy–Schwarz complexity at most `s`: for each `i` the other forms split into at most `s + 1`
classes, none of whose `ℚ`-spans contains `v_i` (Green–Tao, Definition 1.5). -/
def HasCSComplexity (Ψ : AffineSystem t d) (s : ℕ) : Prop :=
  ∀ i, ∃ cls : Fin t → Fin (s + 1), ∀ c,
    (fun j ↦ (Ψ.slope i j : ℚ)) ∉
      Submodule.span ℚ ((fun l j ↦ (Ψ.slope l j : ℚ)) '' {l | l ≠ i ∧ cls l = c})

/-- The three-term progression system `x, x + r, x + 2r`. -/
def threeAP : AffineSystem 3 2 := ⟨fun i j ↦ if j = 0 then 1 else (i : ℤ), fun _ ↦ 0⟩

/-- The twin system `x, x + 2`. -/
def twins : AffineSystem 2 1 := ⟨fun _ _ ↦ 1, fun i ↦ 2 * (i : ℤ)⟩

/-- Three-term progressions have complexity `1` and not `0`. -/
example : threeAP.HasCSComplexity 1 ∧ ¬ threeAP.HasCSComplexity 0 := sorry

/-- Twins have infinite complexity. -/
example (s : ℕ) : ¬ twins.HasCSComplexity s := sorry

/-- The local factor `β_p = 𝔼_{x mod p} ∏_i (p / (p - 1)) 1[ψ_i(x) ≠ 0 mod p]` (AC.5.5). -/
def integerLocalFactor (Ψ : AffineSystem t d) (p : ℕ) [NeZero p] : ℝ :=
  univ.expect fun x : Fin d → ZMod p ↦ ∏ i, (p : ℝ) / (p - 1) *
    if (Ψ.offset i : ZMod p) + ∑ j, (Ψ.slope i j : ZMod p) * x j ≠ 0 then 1 else 0

/-- The archimedean factor: the volume of `Ω` where every form is positive (AC.5.5). -/
def integerArchimedeanFactor (Ψ : AffineSystem t d) (Ω : Set (Fin d → ℝ)) : ℝ :=
  (MeasureTheory.volume (Ω ∩ {x | ∀ i, 0 < (Ψ.offset i : ℝ) + ∑ j, (Ψ.slope i j : ℝ) * x j})).toReal

/-- The parity obstruction: for `ψ(x) = 2x`, `β₂ = 0`. -/
example : integerLocalFactor (⟨fun _ _ ↦ 2, fun _ ↦ 0⟩ : AffineSystem 1 1) 2 = 0 := sorry

/-- For `ψ(x) = x` every local factor is `1`. -/
example (p : ℕ) [Fact p.Prime] [NeZero p] :
    integerLocalFactor (⟨fun _ _ ↦ 1, fun _ ↦ 0⟩ : AffineSystem 1 1) p = 1 := sorry

end AffineSystem

open AffineSystem in
/-- Finite-complexity linear equations in primes (Green–Tao, Main Theorem; Leng, Theorem 5;
AC.5.14). The slopes are nonzero and pairwise linearly independent over `ℚ`. -/
theorem linear_equations_in_primes (d t : ℕ) (L A : ℝ) (hL : 0 < L) (hA : 0 < A) :
    ∃ C : ℝ, ∀ N : ℕ, 2 ≤ N → ∀ Ψ : AffineSystem t d,
      (∀ i, (fun j ↦ (Ψ.slope i j : ℚ)) ≠ 0) →
      (∀ i i', i ≠ i' → LinearIndependent ℚ
        ![fun j ↦ (Ψ.slope i j : ℚ), fun j ↦ (Ψ.slope i' j : ℚ)]) →
      (∀ i j, |(Ψ.slope i j : ℝ)| ≤ L) → (∀ i, |(Ψ.offset i : ℝ)| ≤ L * N) →
      ∀ Ω : Set (Fin d → ℝ), Convex ℝ Ω → Ω ⊆ Set.pi Set.univ (fun _ ↦ Set.Icc (-(N : ℝ)) N) →
      open Classical in
      |∑ x ∈ Fintype.piFinset (fun _ : Fin d ↦ Finset.Icc (-(N : ℤ)) N) with
            (fun j ↦ (x j : ℝ)) ∈ Ω,
          ∏ i, (ArithmeticFunction.vonMangoldt (Ψ.eval i x).toNat : ℝ) -
        integerArchimedeanFactor Ψ Ω *
          ∏' p : Nat.Primes, @integerLocalFactor t d Ψ p ⟨p.2.ne_zero⟩| ≤
        C * (N : ℝ) ^ d * Real.log N ^ (-A) := sorry

end PrimePatterns

/-!
## Targets stated only in the README

The following targets need carriers that the pinned libraries do not have, or that this file does
not build, and are stated in `README.md`: the transformation rules of `fourier` beyond those above;
the remaining entropy inequalities of Layer AC.1 (Madiman, the entropic Balog–Szemerédi–Gowers
lemma, fibring, the two estimates and the endgame); Ruzsa modelling, progressions in cyclic Bohr
sets, properisation and the Fourier density increment; the box Gowers norm; the nilpotent
exponential and Haar probability on `G/Γ`, rational Mal'cev bases, the Mal'cev metric, bounded
nilsequences, horizontal and vertical characters, equidistribution, the inverse theorems, efficient
equidistribution and orbit factorisation; nilsequence factors, the progression partition, the
factor approximation and the density-increment trichotomy; Green–Tao pseudorandom measures with the
weighted von Neumann and Koopman–von Neumann theorems and the original relative Szemerédi theorem;
the moment estimates of the smooth majorant and its linear-forms condition, the pseudorandomness of
`majorantNu`; the power-sum density lemma and Möbius–nilsequence orthogonality; vector-valued
complexity and the vector-valued von Neumann theorem; Kai's quadratic Hecke uniformity, number-
field prime-model uniformity, number-field and localised local factors, and the number-field and
localised prime-pattern theorems.
-/

end TauCetiRoadmap.AdditiveCombinatorics
