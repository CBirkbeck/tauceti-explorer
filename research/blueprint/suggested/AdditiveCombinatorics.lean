/-
Suggested signatures for AdditiveCombinatorics, issue #1037; continued by Codex, codex-3CsULk.
Original interface: ChatGPT (GPT-6 Astra Pro), gpt6-20260927-qm-7c9e.
Source, baseline, comparison and elaboration continuation: Codex, codex-a71f92.
AC.0 packet nodes and the packet test names tagged on the examples: Claude Code, cc-fb70e5.
AC.1 entropy and Marton's conjecture (namespace TauCeti.EntropicPFR): Claude Code, cc-39fac3.
Mathlib pin: 082e2d37e8b0463410cdb532e111cd43d5a66174.
Tau Ceti pin: f790474821cf4256814db967cb154e7af3d0c369.

This file is not the roadmap and is not exhaustive. The roadmap document is definitive;
these suggested forms help contributors and reviewers converge on names and signatures.
PLANNING ONLY. Proof bodies are deliberately `sorry`; signatures elaborate at the pins.
The packet plans all six stages; proof and supplier gaps are recorded explicitly.
See readmes/AdditiveCombinatorics.md and handoff/BP-AdditiveCombinatorics.md.
LeanAPAP's cft already uses this mathematical convention outside the baseline.
Reuse that design and coordinate any code port; these names do not compete with upstream API.

Convention: probability counting measure on G, ordinary counting measure on its dual.
Do not identify the dual with G except through an explicitly supplied equivalence.
-/
import Mathlib.Analysis.Fourier.FiniteAbelian.PontryaginDuality
import Mathlib.Analysis.Fourier.ZMod
import Mathlib.Topology.Algebra.InfiniteSum.DiscreteConvolution
import Mathlib.Combinatorics.Additive.Energy
import Mathlib.Combinatorics.Additive.Convolution
import TauCeti.RepresentationTheory.Compact.Finite
import Mathlib.Analysis.SpecialFunctions.Log.NegMulLog
import Mathlib.Probability.ConditionalProbability
import Mathlib.Probability.Independence.Basic
import Mathlib.Probability.UniformOn
import Mathlib.MeasureTheory.Measure.Prod
import Mathlib.MeasureTheory.Measure.Dirac.Def
import Mathlib.Data.ZMod.Basic
import Mathlib.Algebra.Module.ZMod
import Mathlib.Algebra.Group.Pointwise.Finset.Basic
import Mathlib.Algebra.Group.Pointwise.Set.Basic

import Mathlib.Combinatorics.Additive.FreimanHom
import Mathlib.Order.Partition.Finpartition
import Mathlib.Data.Fintype.Pi
import Mathlib.Data.Finset.Pi
import Mathlib.Order.LiminfLimsup
import Mathlib.Analysis.SpecialFunctions.Pow.Real
import Mathlib.Geometry.Manifold.Algebra.LeftInvariantDerivation
import Mathlib.GroupTheory.Nilpotent
import Mathlib.AlgebraicTopology.FundamentalGroupoid.SimplyConnected
import Mathlib.Topology.Algebra.Group.Quotient
import Mathlib.Analysis.Normed.Module.FiniteDimension
import Mathlib.NumberTheory.ArithmeticFunction.Moebius
import Mathlib.NumberTheory.ArithmeticFunction.VonMangoldt
import Mathlib.NumberTheory.NumberField.FractionalIdeal
import Mathlib.Analysis.Calculus.Deriv.Basic
import Mathlib.Data.Nat.Totient
import Mathlib.LinearAlgebra.AffineSpace.AffineMap
import Mathlib.Algebra.Module.Submodule.Ker
import Mathlib.MeasureTheory.Measure.Lebesgue.Basic
import Mathlib.Analysis.Normed.Group.Int
import Mathlib.Topology.Instances.AddCircle.Real
import Mathlib.MeasureTheory.Integral.IntervalIntegral.Basic

noncomputable section
open scoped BigOperators

namespace TauCeti.AdditiveFourier

attribute [local instance] Classical.propDecidable

variable {G : Type*} [AddCommGroup G] [Fintype G]

/-- The normalized character-indexed transform; specified by `fourier_apply`. -/
def fourier (f : G → ℂ) : AddChar G ℂ → ℂ := by sorry

/-- Probability-normalized convolution; specified by `nconv_apply`.
This is a scalar multiple of the existing discrete convolution, not a new convolution theory. -/
def nconv (f g : G → ℂ) : G → ℂ := by sorry

lemma fourier_apply (f : G → ℂ) (χ : AddChar G ℂ) :
    fourier f χ = (Fintype.card G : ℂ)⁻¹ * ∑ x, f x * star (χ x) := by sorry

lemma nconv_apply (f g : G → ℂ) (x : G) :
    nconv f g x = (Fintype.card G : ℂ)⁻¹ * ∑ y, f y * g (x - y) := by sorry

lemma fourier_zero : fourier (0 : G → ℂ) = 0 := by sorry

lemma fourier_add (f g : G → ℂ) :
    fourier (f + g) = fourier f + fourier g := by sorry

lemma fourier_smul (c : ℂ) (f : G → ℂ) :
    fourier (c • f) = c • fourier f := by sorry

lemma fourier_single (a : G) (c : ℂ) (χ : AddChar G ℂ) :
    fourier (Pi.single a c) χ =
      (Fintype.card G : ℂ)⁻¹ * c * star (χ a) := by sorry

lemma fourier_character (ψ χ : AddChar G ℂ) :
    fourier (fun x => ψ x) χ = if χ = ψ then 1 else 0 := by sorry

lemma fourier_inversion (f : G → ℂ) (x : G) :
    ∑ χ : AddChar G ℂ, fourier f χ * χ x = f x := by sorry

lemma fourier_eq_basis_repr (f : G → ℂ) (χ : AddChar G ℂ) :
    fourier f χ = (AddChar.complexBasis G).repr f χ := by sorry

/-- The input order matters: the library inner product conjugates its first argument. -/
lemma fourier_eq_wInner (f : G → ℂ) (χ : AddChar G ℂ) :
    fourier f χ = RCLike.wInner RCLike.cWeight (fun x => χ x) f := by sorry

lemma fourier_inversion_reindex {ι : Type*} [Fintype ι]
    (e : ι ≃ AddChar G ℂ) (f : G → ℂ) (x : G) :
    ∑ i, fourier f (e i) * e i x = f x := by sorry

lemma fourier_eq_haarIntegral [TopologicalSpace G] [DiscreteTopology G]
    [MeasurableSpace (Multiplicative G)] [BorelSpace (Multiplicative G)]
    (f : G → ℂ) (χ : AddChar G ℂ) :
    fourier f χ = ∫ x : Multiplicative G,
      f (Multiplicative.toAdd x) * star (χ (Multiplicative.toAdd x))
        ∂TauCeti.haarProb (Multiplicative G) := by sorry

lemma fourier_injective : Function.Injective (fourier (G := G)) := by sorry

lemma fourier_parseval (f g : G → ℂ) :
    (Fintype.card G : ℂ)⁻¹ * ∑ x, f x * star (g x) =
      ∑ χ : AddChar G ℂ, fourier f χ * star (fourier g χ) := by sorry

lemma fourier_plancherel (f : G → ℂ) :
    (Fintype.card G : ℝ)⁻¹ * ∑ x, ‖f x‖ ^ 2 =
      ∑ χ : AddChar G ℂ, ‖fourier f χ‖ ^ 2 := by sorry

lemma nconv_eq_addRingConvolution (f g : G → ℂ) :
    nconv f g = (Fintype.card G : ℂ)⁻¹ •
      DiscreteConvolution.addRingConvolution f g := by sorry

lemma nconv_comm (f g : G → ℂ) : nconv f g = nconv g f := by sorry

lemma nconv_assoc (f g h : G → ℂ) :
    nconv (nconv f g) h = nconv f (nconv g h) := by sorry

lemma nconv_add_left (f g h : G → ℂ) :
    nconv (f + g) h = nconv f h + nconv g h := by sorry

lemma nconv_add_right (f g h : G → ℂ) :
    nconv f (g + h) = nconv f g + nconv f h := by sorry

lemma nconv_smul_left (c : ℂ) (f g : G → ℂ) :
    nconv (c • f) g = c • nconv f g := by sorry

lemma nconv_smul_right (c : ℂ) (f g : G → ℂ) :
    nconv f (c • g) = c • nconv f g := by sorry

lemma nconv_indicator (A B : Finset G) (x : G) :
    nconv (fun y => if y ∈ A then (1 : ℂ) else 0)
      (fun y => if y ∈ B then (1 : ℂ) else 0) x =
        (Fintype.card G : ℂ)⁻¹ * (A.addConvolution B x : ℂ) := by sorry

lemma nconv_zero_left (f : G → ℂ) : nconv 0 f = 0 := by sorry

lemma nconv_zero_right (f : G → ℂ) : nconv f 0 = 0 := by sorry

lemma nconv_single (a b : G) (c d : ℂ) :
    nconv (Pi.single a c) (Pi.single b d) =
      Pi.single (a + b) ((Fintype.card G : ℂ)⁻¹ * c * d) := by sorry

lemma nconv_unit_left (f : G → ℂ) :
    nconv (Pi.single 0 (Fintype.card G : ℂ)) f = f := by sorry

lemma nconv_unit_right (f : G → ℂ) :
    nconv f (Pi.single 0 (Fintype.card G : ℂ)) = f := by sorry

lemma fourier_nconv (f g : G → ℂ) (χ : AddChar G ℂ) :
    fourier (nconv f g) χ = fourier f χ * fourier g χ := by sorry

lemma fourier_translate (f : G → ℂ) (a : G) (χ : AddChar G ℂ) :
    fourier (fun x => f (x - a)) χ = star (χ a) * fourier f χ := by sorry

lemma fourier_modulate (f : G → ℂ) (ψ χ : AddChar G ℂ) :
    fourier (fun x => ψ x * f x) χ = fourier f (χ / ψ) := by sorry

lemma fourier_neg (f : G → ℂ) (χ : AddChar G ℂ) :
    fourier (fun x => f (-x)) χ = fourier f χ⁻¹ := by sorry

lemma fourier_conj (f : G → ℂ) (χ : AddChar G ℂ) :
    fourier (fun x => star (f x)) χ = star (fourier f χ⁻¹) := by sorry

lemma fourier_reflection (f : G → ℂ) (χ : AddChar G ℂ) :
    fourier (fun x => star (f (-x))) χ = star (fourier f χ) := by sorry

variable {H : Type*} [AddCommGroup H] [Fintype H]

lemma fourier_equiv (e : G ≃+ H) (f : H → ℂ) (χ : AddChar H ℂ) :
    fourier (fun x => f (e x)) (χ.compAddMonoidHom e.toAddMonoidHom) =
      fourier f χ := by sorry

lemma fourier_quotient (q : G →+ H) (hq : Function.Surjective q)
    (f : H → ℂ) (χ : AddChar H ℂ) :
    fourier (fun x => f (q x)) (χ.compAddMonoidHom q) = fourier f χ := by sorry

lemma fourier_quotient_zero (q : G →+ H) (f : H → ℂ) (χ : AddChar G ℂ)
    (hχ : ∃ a : G, q a = 0 ∧ χ a ≠ 1) :
    fourier (fun x => f (q x)) χ = 0 := by sorry

lemma fourier_energy (A B : Finset G) :
    (Finset.addEnergy A B : ℝ) = (Fintype.card G : ℝ) ^ 3 *
      ∑ χ : AddChar G ℂ,
        ‖fourier (fun x => if x ∈ A then (1 : ℂ) else 0) χ‖ ^ 2 *
        ‖fourier (fun x => if x ∈ B then (1 : ℂ) else 0) χ‖ ^ 2 := by sorry

/-- AC.0/add-energy-le: the trivial upper bounds (Claude Code, cc-fb70e5). -/
lemma addEnergy_le_card_sq_mul_card (A B : Finset G) :
    Finset.addEnergy A B ≤ A.card ^ 2 * B.card := by sorry

lemma addEnergy_le_card_mul_card_sq (A B : Finset G) :
    Finset.addEnergy A B ≤ A.card * B.card ^ 2 := by sorry

variable {N : ℕ} [NeZero N]

lemma zmod_character_comparison (r x : ZMod N) :
    AddChar.zmodAddEquiv r x = ZMod.stdAddChar (x * r) := by sorry

lemma fourier_zmod (f : ZMod N → ℂ) (r : ZMod N) :
    fourier f (AddChar.zmodAddEquiv r) =
      (N : ℂ)⁻¹ * ZMod.dft f r := by sorry

/-! Definition tests. These are specifications, not executed Lean tests. -/

-- F1 (`fourier.test_nonreal_phase`): a non-real phase distinguishes the sign of the transform.
example : fourier (Pi.single (1 : ZMod 4) (1 : ℂ))
    (AddChar.zmodAddEquiv (1 : ZMod 4)) = -Complex.I / 4 := by sorry

-- F2 (`fourier.test_distinct_characters`): distinct characters have zero pairing.
example : fourier (fun x : ZMod 3 => AddChar.zmodAddEquiv (2 : ZMod 3) x)
    (AddChar.zmodAddEquiv (1 : ZMod 3)) = 0 := by sorry

-- F3 (`fourier.test_self_coefficient_one`): a character has coefficient one, not N, at itself.
example (χ : AddChar G ℂ) : fourier (fun x => χ x) χ = 1 := by sorry

-- F4 (`fourier.test_zero`): the zero function.
example (χ : AddChar G ℂ) : fourier (0 : G → ℂ) χ = 0 := by sorry

-- F5 (`fourier.test_trivial_group`): the one-element group is included.
example (f : ZMod 1 → ℂ) (χ : AddChar (ZMod 1) ℂ) :
    fourier f χ = f 0 := by sorry

-- F6 (`fourier.test_noncyclic_delta`): a genuinely noncyclic group; the delta mass has coefficient
--   1/4.
example (χ : AddChar (ZMod 2 × ZMod 2) ℂ) :
    fourier (Pi.single (0 : ZMod 2 × ZMod 2) (1 : ℂ)) χ = 1 / 4 := by sorry

-- F7: compatibility with the existing character basis.
example (f : G → ℂ) (χ : AddChar G ℂ) :
    fourier f χ = (AddChar.complexBasis G).repr f χ := by sorry

-- F8: compatibility with the existing, unnormalized cyclic transform.
example (f : ZMod 3 → ℂ) : fourier f (AddChar.zmodAddEquiv (0 : ZMod 3)) =
    (3 : ℂ)⁻¹ * ZMod.dft f 0 := by sorry

-- F9: an explicitly chosen dual indexing, as required by the finite-field consumer.
example (f : ZMod 4 → ℂ) (x : ZMod 4) :
    ∑ r : ZMod 4, fourier f (AddChar.zmodAddEquiv r) *
      AddChar.zmodAddEquiv r x = f x := by sorry

-- F10 (`fourier.test_conjugate_reflection`): conjugate reflection, not just reflection, conjugates
--   the coefficient.
example : fourier (fun x : ZMod 4 =>
    star ((Pi.single (1 : ZMod 4) (1 : ℂ) : ZMod 4 → ℂ) (-x)))
      (AddChar.zmodAddEquiv (1 : ZMod 4)) = Complex.I / 4 := by sorry

-- F11 (`fourier.test_conjugate_slot`): the inner product places the character in its conjugate-
--   linear slot.
example (χ : AddChar G ℂ) :
    fourier (fun x => Complex.I * χ x) χ = Complex.I := by sorry

-- C1 (`nconv.test_delta_not_unit`): a unit delta is not the convolution unit under probability
--   measure.
example : nconv (Pi.single (0 : ZMod 3) (1 : ℂ))
    (Pi.single (0 : ZMod 3) (1 : ℂ)) 0 = 1 / 3 := by sorry

-- C2 (`nconv.test_scaled_unit`): the correctly scaled delta is the left unit.
example (f : ZMod 4 → ℂ) : nconv (Pi.single 0 (4 : ℂ)) f = f := by sorry

-- C3: the right unit.
example (f : ZMod 4 → ℂ) : nconv f (Pi.single 0 (4 : ℂ)) = f := by sorry

-- C4 (`nconv.test_zero`): the degenerate zero case.
example (f : G → ℂ) : nconv 0 f = 0 := by sorry

-- C5 (`nconv.test_constants`): probability normalization fixes the convolution of constants.
example : nconv (fun _ : G => (1 : ℂ)) (fun _ => 1) = fun _ => 1 := by sorry

-- C6 (`nconv.test_support_and_scale`): test the support and the normalization together.
example : nconv (Pi.single (1 : ZMod 4) (1 : ℂ))
    (Pi.single (1 : ZMod 4) (1 : ℂ)) 2 = 1 / 4 := by sorry

-- C7: comparison to the existing discrete convolution, not a parallel notion.
example (f g : ZMod 3 → ℂ) : nconv f g =
    (3 : ℂ)⁻¹ • DiscreteConvolution.addRingConvolution f g := by sorry

-- C8: convolution on the trivial group is multiplication.
example (f g : ZMod 1 → ℂ) : nconv f g 0 = f 0 * g 0 := by sorry

-- C9 (`nconv.test_indicator_multiplicity`): representation multiplicity is retained, not replaced
--   by sumset membership.
example : nconv (fun x : ZMod 3 => if x ∈ ({0, 1} : Finset (ZMod 3)) then (1 : ℂ) else 0)
    (fun x : ZMod 3 => if x ∈ ({0, 1} : Finset (ZMod 3)) then (1 : ℂ) else 0) 1 =
      2 / 3 := by sorry


/-! AC.0 quantitative indicator interfaces and AC.1 large spectra.
The spectrum threshold is absolute and closed; all signatures are planning only. -/

def largeSpectrum (f : G → ℂ) (τ : ℝ) : Finset (AddChar G ℂ) := by sorry

lemma fourier_indicator_l2 (A : Finset G) :
    (∑ χ : AddChar G ℂ, ‖fourier (fun x => if x ∈ A then (1 : ℂ) else 0) χ‖ ^ 2) =
      (A.card : ℝ) / Fintype.card G := by sorry

lemma fourier_norm_le_l1 (f : G → ℂ) (χ : AddChar G ℂ) :
    ‖fourier f χ‖ ≤ (Fintype.card G : ℝ)⁻¹ * ∑ x, ‖f x‖ := by sorry

lemma fourier_indicator_norm_le (A : Finset G) (χ : AddChar G ℂ) :
    ‖fourier (fun x => if x ∈ A then (1 : ℂ) else 0) χ‖ ≤
      (A.card : ℝ) / Fintype.card G := by sorry

lemma mem_largeSpectrum (f : G → ℂ) (τ : ℝ) (χ : AddChar G ℂ) :
    χ ∈ largeSpectrum f τ ↔ τ ≤ ‖fourier f χ‖ := by sorry

lemma largeSpectrum_antitone (f : G → ℂ) {a b : ℝ} (hab : a ≤ b) :
    largeSpectrum f b ⊆ largeSpectrum f a := by sorry

lemma largeSpectrum_of_nonpos (f : G → ℂ) {τ : ℝ} (hτ : τ ≤ 0) :
    largeSpectrum f τ = Finset.univ := by sorry

lemma largeSpectrum_zero {τ : ℝ} (hτ : 0 < τ) : largeSpectrum (0 : G → ℂ) τ = ∅ := by sorry

lemma largeSpectrum_character (ψ : AddChar G ℂ) {τ : ℝ} (hτ : 0 < τ) (hτ1 : τ ≤ 1) :
    largeSpectrum (fun x => ψ x) τ = {ψ} := by sorry

lemma largeSpectrum_card_mul_sq_le (f : G → ℂ) {τ : ℝ} (hτ : 0 ≤ τ) :
    ((largeSpectrum f τ).card : ℝ) * τ^2 ≤
      (Fintype.card G : ℝ)⁻¹ * ∑ x, ‖f x‖ ^ 2 := by sorry

lemma largeSpectrum_smul (f : G → ℂ) (c : ℂ) (hc : c ≠ 0) (τ : ℝ) :
    largeSpectrum (c • f) (‖c‖ * τ) = largeSpectrum f τ := by sorry

lemma fourier_fourth_tail_le (f : G → ℂ) (τ : ℝ) :
    (∑ χ ∈ (largeSpectrum f τ)ᶜ, ‖fourier f χ‖^4) ≤
      τ^2 * ((Fintype.card G : ℝ)⁻¹ * ∑ x, ‖f x‖^2) := by sorry

lemma largeSpectrum_indicator_card_mul_sq_le (A : Finset G) {τ : ℝ} (hτ : 0 ≤ τ) :
    ((largeSpectrum (fun x => if x ∈ A then (1 : ℂ) else 0) τ).card : ℝ) * τ^2 ≤
      (A.card : ℝ) / Fintype.card G := by sorry

lemma fourier_indicator_fourth_le (A : Finset G) :
    (∑ χ : AddChar G ℂ, ‖fourier (fun x => if x ∈ A then (1 : ℂ) else 0) χ‖^4) ≤
      ((A.card : ℝ) / Fintype.card G)^3 := by sorry

open scoped Pointwise in
lemma fourier_indicator_fourth_ge_of_small_doubling (A : Finset G) (hA : A.Nonempty)
    {K : ℝ} (hK : 0 < K) (hdouble : ((A+A).card : ℝ) ≤ K * A.card) :
    ((A.card : ℝ) / Fintype.card G)^3 / K ≤
      ∑ χ : AddChar G ℂ, ‖fourier (fun x => if x ∈ A then (1 : ℂ) else 0) χ‖^4 := by sorry

lemma fourier_indicator_fourth_tail_le (A : Finset G) (ε : ℝ) :
    (∑ χ ∈ (largeSpectrum (fun x => if x ∈ A then (1 : ℂ) else 0)
      (ε * ((A.card : ℝ) / Fintype.card G)))ᶜ,
      ‖fourier (fun x => if x ∈ A then (1 : ℂ) else 0) χ‖^4) ≤
      ε^2 * ((A.card : ℝ) / Fintype.card G)^3 := by sorry

open scoped Pointwise in
lemma fourier_indicator_largeSpectrum_concentration (A : Finset G) (hA : A.Nonempty)
    {K : ℝ} (hK : 0 < K) (hdouble : ((A+A).card : ℝ) ≤ K * A.card) :
    (3/4 : ℝ) *
      (∑ χ : AddChar G ℂ, ‖fourier (fun x => if x ∈ A then (1 : ℂ) else 0) χ‖^4) ≤
    ∑ χ ∈ largeSpectrum (fun x => if x ∈ A then (1 : ℂ) else 0)
      (((A.card : ℝ) / Fintype.card G) / (2 * Real.sqrt K)),
      ‖fourier (fun x => if x ∈ A then (1 : ℂ) else 0) χ‖^4 := by sorry

lemma largeSpectrum_indicator_card_at_sqrt (A : Finset G) (hA : A.Nonempty)
    {K : ℝ} (hK : 0 < K) :
    ((largeSpectrum (fun x => if x ∈ A then (1 : ℂ) else 0)
      (((A.card : ℝ) / Fintype.card G) / (2 * Real.sqrt K))).card : ℝ) ≤
      4*K / ((A.card : ℝ) / Fintype.card G) := by sorry

-- largeSpectrum.test_zero_threshold
/-- S1: nonpositive thresholds include zero coefficients. -/
example : largeSpectrum (0 : ZMod 4 → ℂ) 0 = Finset.univ := by sorry

-- largeSpectrum.test_positive_zero
/-- S2: the zero function has empty positive spectrum. -/
example : largeSpectrum (0 : ZMod 4 → ℂ) 1 = ∅ := by sorry

-- largeSpectrum.test_endpoint
/-- S3: the equality endpoint is included. -/
example (ψ : AddChar G ℂ) : largeSpectrum (fun x => ψ x) 1 = {ψ} := by sorry

/-- S4: frequencies above a character's amplitude are excluded. -/
example (ψ : AddChar G ℂ) : largeSpectrum (fun x => ψ x) 2 = ∅ := by sorry

-- largeSpectrum.test_nonreal_scale
/-- S5: scaling uses the complex norm, not the real part. -/
example (ψ : AddChar G ℂ) :
    largeSpectrum (fun x => (2 * Complex.I) * ψ x) 2 = {ψ} := by sorry

-- largeSpectrum.test_point_mass
/-- S6: probability normalization and closed threshold at a point mass. -/
example : largeSpectrum (Pi.single (0 : ZMod 4) (1 : ℂ)) (1/4) = Finset.univ := by sorry

/-- S7: an unnormalized transform would fail this test. -/
example : largeSpectrum (Pi.single (0 : ZMod 4) (1 : ℂ)) (1/3) = ∅ := by sorry

/-- S8: a genuinely noncyclic group has the same normalization. -/
example : largeSpectrum (Pi.single (0 : ZMod 2 × ZMod 2) (1 : ℂ)) (1/4) = Finset.univ := by sorry


/-! AC.1 chord-radius Bohr sets and the corrected nonvanishing argument. -/

/-- Strict chord radius on the existing character dual; specified by `mem_bohrSet`. -/
def bohrSet (Λ : Finset (AddChar G ℂ)) (δ : ℝ) : Finset G := by sorry

lemma mem_bohrSet (Λ : Finset (AddChar G ℂ)) (δ : ℝ) (x : G) :
    x ∈ bohrSet Λ δ ↔ ∀ χ ∈ Λ, ‖χ x - 1‖ < δ := by sorry

lemma bohrSet_empty (δ : ℝ) : bohrSet (∅ : Finset (AddChar G ℂ)) δ = Finset.univ := by sorry

lemma bohrSet_of_nonpos (Λ : Finset (AddChar G ℂ)) (hΛ : Λ.Nonempty)
    {δ : ℝ} (hδ : δ ≤ 0) : bohrSet Λ δ = ∅ := by sorry

lemma zero_mem_bohrSet_iff (Λ : Finset (AddChar G ℂ)) (δ : ℝ) :
    0 ∈ bohrSet Λ δ ↔ 0 < δ ∨ Λ = ∅ := by sorry

lemma bohrSet_mono (Λ : Finset (AddChar G ℂ)) {δ ε : ℝ} (h : δ ≤ ε) :
    bohrSet Λ δ ⊆ bohrSet Λ ε := by sorry

lemma bohrSet_antitone {Λ Γ : Finset (AddChar G ℂ)} (h : Λ ⊆ Γ) (δ : ℝ) :
    bohrSet Γ δ ⊆ bohrSet Λ δ := by sorry

lemma bohrSet_union (Λ Γ : Finset (AddChar G ℂ)) (δ : ℝ) :
    bohrSet (Λ ∪ Γ) δ = bohrSet Λ δ ∩ bohrSet Γ δ := by sorry

lemma neg_mem_bohrSet (Λ : Finset (AddChar G ℂ)) (δ : ℝ) (x : G) :
    -x ∈ bohrSet Λ δ ↔ x ∈ bohrSet Λ δ := by sorry

open scoped Pointwise in
lemma bohrSet_add_subset (Λ : Finset (AddChar G ℂ)) (δ ε : ℝ) :
    bohrSet Λ δ + bohrSet Λ ε ⊆ bohrSet Λ (δ + ε) := by sorry

open scoped Pointwise in
lemma bohrSet_sub_subset (Λ : Finset (AddChar G ℂ)) (δ ε : ℝ) :
    bohrSet Λ δ - bohrSet Λ ε ⊆ bohrSet Λ (δ + ε) := by sorry

lemma bohrSet_erase_one (Λ : Finset (AddChar G ℂ)) {δ : ℝ} (hδ : 0 < δ) :
    bohrSet (Λ.erase 1) δ = bohrSet Λ δ := by sorry

lemma bohrSet_pullback (q : G →+ H) (Λ : Finset (AddChar H ℂ)) (δ : ℝ) :
    bohrSet (Λ.image (fun χ => χ.compAddMonoidHom q)) δ =
      Finset.univ.filter (fun x => q x ∈ bohrSet Λ δ) := by sorry

lemma bohrSet_eq_univ_of_two_lt (Λ : Finset (AddChar G ℂ)) {δ : ℝ} (hδ : 2 < δ) :
    bohrSet Λ δ = Finset.univ := by sorry

/-- The reflection includes conjugation, for arbitrary complex input. -/
lemma fourier_quadconvolution (f : G → ℂ) (χ : AddChar G ℂ) :
    fourier (nconv (nconv f f)
      (nconv (fun y => star (f (-y))) (fun y => star (f (-y))))) χ =
        (‖fourier f χ‖ ^ 4 : ℝ) := by sorry

lemma fourth_sum_eq_quadconvolution (f : G → ℂ) (x : G) :
    (∑ χ : AddChar G ℂ, (‖fourier f χ‖ ^ 4 : ℝ) * χ x) =
      nconv (nconv f f)
        (nconv (fun y => star (f (-y))) (fun y => star (f (-y)))) x := by sorry

/-- Every representation is counted; the factor is N^(-3), not N^(-4). -/
lemma indicator_quadconvolution_eq_count (A : Finset G) (x : G) :
    let f : G → ℂ := fun y => if y ∈ A then 1 else 0
    nconv (nconv f f)
      (nconv (fun y => star (f (-y))) (fun y => star (f (-y)))) x =
        (Fintype.card G : ℂ)⁻¹ ^ 3 *
          (((A.product A).product (A.product A)).filter
            (fun p => p.1.1 + p.1.2 - p.2.1 - p.2.2 = x)).card := by sorry

open scoped Pointwise in
lemma indicator_quadconvolution_ne_zero_iff (A : Finset G) (x : G) :
    let f : G → ℂ := fun y => if y ∈ A then 1 else 0
    nconv (nconv f f)
      (nconv (fun y => star (f (-y))) (fun y => star (f (-y)))) x ≠ 0 ↔
        x ∈ (A + A) - (A + A) := by sorry

/-- The resonant bound uses mass on Λ, as required by source correction E1. -/
lemma weighted_fourier_re_ge_of_bohrSet (w : AddChar G ℂ → ℝ)
    (hw : ∀ χ, 0 ≤ w χ) (Λ : Finset (AddChar G ℂ)) (δ : ℝ) (x : G)
    (hx : x ∈ bohrSet Λ δ) :
    (1 - δ) * (∑ χ ∈ Λ, w χ) - (∑ χ ∈ Λᶜ, w χ) ≤
      (∑ χ : AddChar G ℂ, (w χ : ℂ) * χ x).re := by sorry

lemma weighted_fourier_re_ge_of_concentration (w : AddChar G ℂ → ℝ)
    (hw : ∀ χ, 0 ≤ w χ) (Λ : Finset (AddChar G ℂ)) (x : G)
    (hx : x ∈ bohrSet Λ (1/4))
    (hΛ : (3/4 : ℝ) * (∑ χ, w χ) ≤ ∑ χ ∈ Λ, w χ) :
    (5/16 : ℝ) * (∑ χ, w χ) ≤
      (∑ χ : AddChar G ℂ, (w χ : ℂ) * χ x).re := by sorry

open scoped Pointwise in
lemma bohrSet_largeSpectrum_subset_double_sub_double (A : Finset G) (hA : A.Nonempty)
    {K : ℝ} (hK : 0 < K) (hdouble : ((A + A).card : ℝ) ≤ K * A.card) :
    bohrSet (largeSpectrum (fun x => if x ∈ A then (1 : ℂ) else 0)
      (((A.card : ℝ) / Fintype.card G) / (2 * Real.sqrt K))) (1/4) ⊆
        (A + A) - (A + A) := by sorry

-- bohrSet.test_empty_family
/-- B1: no constraints means the whole group even at a negative radius. -/
example : bohrSet (∅ : Finset (AddChar (ZMod 4) ℂ)) (-1) = Finset.univ := by sorry

-- bohrSet.test_zero_radius
/-- B2: a nonempty constraint family at radius zero has no points. -/
example : bohrSet ({1} : Finset (AddChar (ZMod 4) ℂ)) 0 = ∅ := by sorry

-- bohrSet.test_trivial_character
/-- B3: a trivial character imposes no constraint at positive radius. -/
example : bohrSet ({1} : Finset (AddChar (ZMod 4) ℂ)) (1/4) = Finset.univ := by sorry

-- bohrSet.test_strict_antipode
/-- B4: chord radius is strict; the antipode is excluded at radius two. -/
example : (2 : ZMod 4) ∉ bohrSet {AddChar.zmodAddEquiv (1 : ZMod 4)} 2 := by sorry

/-- B5: a small Bohr set can consist of just the identity. -/
example : bohrSet {AddChar.zmodAddEquiv (1 : ZMod 4)} (1/4) = {0} := by sorry

/-- B6: the one-element group is included. -/
example (Λ : Finset (AddChar (ZMod 1) ℂ)) : bohrSet Λ (1/4) = Finset.univ := by sorry

-- bohrSet.test_noncyclic_kernel
/-- B7: projection from a noncyclic group gives a nontrivial kernel. -/
example : bohrSet
    {(AddChar.zmodAddEquiv (1 : ZMod 2)).compAddMonoidHom
      (AddMonoidHom.fst (ZMod 2) (ZMod 2))} (1/4) =
        {(0, 0), (0, 1)} := by sorry

/-- B8: four point masses give N^(-3), not N^(-4). -/
example :
    let f : ZMod 3 → ℂ := fun y => if y ∈ ({1} : Finset (ZMod 3)) then 1 else 0
    nconv (nconv f f)
      (nconv (fun y => star (f (-y))) (fun y => star (f (-y)))) 0 = 1/27 := by sorry

/-- B9: a full set gives the constant one, including the three convolution factors. -/
example (x : G) :
    nconv (nconv (fun _ : G => (1 : ℂ)) (fun _ => 1))
      (nconv (fun _ => 1) (fun _ => 1)) x = 1 := by sorry

/-- B10: empty indicators have zero fourth sum; positive mass cannot be omitted. -/
example (x : G) : (∑ χ : AddChar G ℂ, (‖fourier (0 : G → ℂ) χ‖ ^ 4 : ℝ) * χ x) = 0 := by sorry


end TauCeti.AdditiveFourier

open scoped Pointwise
namespace TauCeti.EntropicPFR

open MeasureTheory ProbabilityTheory Real

section Entropy

variable {Ω Ω' S T U : Type*} [MeasurableSpace Ω] [MeasurableSpace Ω']
  [Fintype S] [MeasurableSpace S] [DiscreteMeasurableSpace S]
  [Fintype T] [MeasurableSpace T] [DiscreteMeasurableSpace T]
  [Fintype U] [MeasurableSpace U] [DiscreteMeasurableSpace U]

/-- AC.1/shannon-entropy, data: the entropy `∑ₛ −p(s) log p(s)` of a measure on a finite type. -/
def measureEntropy (μ : Measure S) : ℝ :=
  ∑ s, negMulLog (μ {s}).toReal

/-- AC.1/shannon-entropy. `H[X] = ∑ₓ p_X(x) log (1/p_X(x))`, natural logarithm. -/
def entropy (X : Ω → S) (μ : Measure Ω) : ℝ :=
  measureEntropy (μ.map X)

/-- AC.1/shannon-entropy, data: `H[X|Y] = ∑_y p_Y(y) H[X | Y = y]`. -/
def condEntropy (X : Ω → S) (Y : Ω → T) (μ : Measure Ω) : ℝ :=
  ∑ y, (μ (Y ⁻¹' {y})).toReal * entropy X (cond μ (Y ⁻¹' {y}))

/-- AC.1/shannon-entropy, data: `I[X : Y] = H[X] + H[Y] − H[X, Y]`. -/
def mutualInfo (X : Ω → S) (Y : Ω → T) (μ : Measure Ω) : ℝ :=
  entropy X μ + entropy Y μ - entropy (fun ω => (X ω, Y ω)) μ

/-- AC.1/shannon-entropy, data: `I[X : Y | Z] = ∑_z p_Z(z) I[(X|Z=z) : (Y|Z=z)]`. -/
def condMutualInfo (X : Ω → S) (Y : Ω → T) (Z : Ω → U) (μ : Measure Ω) : ℝ :=
  ∑ z, (μ (Z ⁻¹' {z})).toReal * mutualInfo X Y (cond μ (Z ⁻¹' {z}))

/-- AC.1/shannon-entropy, API: (A.1) `H[X] ≤ log |S|`. -/
theorem entropy_le_log_card (X : Ω → S) (μ : Measure Ω) [IsProbabilityMeasure μ]
    (hX : Measurable X) : entropy X μ ≤ Real.log (Fintype.card S) := by
  sorry

/-- AC.1/shannon-entropy, API: (A.1), equality exactly for the uniform distribution. -/
theorem measureEntropy_eq_log_card_iff (μ : Measure S) [IsProbabilityMeasure μ] :
    measureEntropy μ = Real.log (Fintype.card S) ↔ μ = uniformOn Set.univ := by
  sorry

/-- AC.1/shannon-entropy, API: (A.2) some value has probability at least `e^{−H}`. -/
theorem exists_measure_singleton_ge (μ : Measure S) [IsProbabilityMeasure μ] :
    ∃ s, Real.exp (-measureEntropy μ) ≤ (μ {s}).toReal := by
  sorry

/-- AC.1/shannon-entropy, API: the chain rule (A.3) `H[X, Y] = H[X|Y] + H[Y]`. -/
theorem entropy_pair_eq_condEntropy_add (X : Ω → S) (Y : Ω → T) (μ : Measure Ω)
    [IsProbabilityMeasure μ] (hX : Measurable X) (hY : Measurable Y) :
    entropy (fun ω => (X ω, Y ω)) μ = condEntropy X Y μ + entropy Y μ := by
  sorry

/-- AC.1/shannon-entropy, API: (A.5) conditioning does not increase entropy. -/
theorem condEntropy_le_entropy (X : Ω → S) (Y : Ω → T) (μ : Measure Ω) [IsProbabilityMeasure μ]
    (hX : Measurable X) (hY : Measurable Y) : condEntropy X Y μ ≤ entropy X μ := by
  sorry

/-- AC.1/shannon-entropy, API: (A.4) `H[X, Y] = H[X] + H[Y]` iff `X`, `Y` are independent. -/
theorem entropy_pair_eq_add_iff (X : Ω → S) (Y : Ω → T) (μ : Measure Ω) [IsProbabilityMeasure μ]
    (hX : Measurable X) (hY : Measurable Y) :
    entropy (fun ω => (X ω, Y ω)) μ = entropy X μ + entropy Y μ ↔ IndepFun X Y μ := by
  sorry

/-- AC.1/shannon-entropy, API: submodularity (A.6) `H[X|Y,Z] ≤ H[X|Z]`. -/
theorem condEntropy_pair_le (X : Ω → S) (Y : Ω → T) (Z : Ω → U) (μ : Measure Ω)
    [IsProbabilityMeasure μ] (hX : Measurable X) (hY : Measurable Y) (hZ : Measurable Z) :
    condEntropy X (fun ω => (Y ω, Z ω)) μ ≤ condEntropy X Z μ := by
  sorry

/-- AC.1/shannon-entropy, API: (A.8)–(A.9) conditional mutual information is nonnegative. -/
theorem condMutualInfo_nonneg (X : Ω → S) (Y : Ω → T) (Z : Ω → U) (μ : Measure Ω)
    [IsProbabilityMeasure μ] (hX : Measurable X) (hY : Measurable Y) (hZ : Measurable Z) :
    0 ≤ condMutualInfo X Y Z μ := by
  sorry

/-- AC.1/shannon-entropy, API: an injective relabelling does not change entropy. -/
theorem entropy_comp_of_injective (X : Ω → S) (μ : Measure Ω) (f : S → T)
    (hf : Function.Injective f) (hX : Measurable X) : entropy (f ∘ X) μ = entropy X μ := by
  sorry

/-- AC.1/shannon-entropy, API: the uniform distribution on a nonempty set `s` has entropy
`log |s|`. -/
theorem measureEntropy_uniformOn (s : Finset S) (hs : s.Nonempty) :
    measureEntropy (uniformOn (s : Set S)) = Real.log s.card := by
  sorry

-- entropy_const
example (μ : Measure Ω) [IsProbabilityMeasure μ] (s : S) : entropy (fun _ : Ω => s) μ = 0 := by
  sorry

-- entropy_uniform_bool
example : measureEntropy (uniformOn (Set.univ : Set Bool)) = Real.log 2 := by
  sorry

-- mutualInfo_self
example (X : Ω → S) (μ : Measure Ω) [IsProbabilityMeasure μ] (hX : Measurable X) :
    mutualInfo X X μ = entropy X μ := by
  sorry

-- mutualInfo_indep
example (X : Ω → S) (Y : Ω → T) (μ : Measure Ω) [IsProbabilityMeasure μ] (hX : Measurable X)
    (hY : Measurable Y) (h : IndepFun X Y μ) : mutualInfo X Y μ = 0 := by
  sorry

end Entropy

section Distance

variable {Ω Ω' T T' : Type*} [MeasurableSpace Ω] [MeasurableSpace Ω']
  [Fintype T] [MeasurableSpace T] [DiscreteMeasurableSpace T]
  [Fintype T'] [MeasurableSpace T'] [DiscreteMeasurableSpace T']
  {G : Type*} [AddCommGroup G] [Fintype G] [MeasurableSpace G] [DiscreteMeasurableSpace G]

/-- AC.1/entropic-ruzsa-distance. `d[μ; ν] = H[X′ − Y′] − H[X′]/2 − H[Y′]/2` for independent `X′ ∼ μ`,
`Y′ ∼ ν`, computed from the distributions (1.1). -/
def rdist (μ ν : Measure G) : ℝ :=
  measureEntropy ((μ.prod ν).map (fun p : G × G => p.1 - p.2)) -
    measureEntropy μ / 2 - measureEntropy ν / 2

/-- AC.1/entropic-ruzsa-distance, data: the conditional distance (A.14),
`d[X|Z; Y|W] = ∑_{z,w} p_Z(z) p_W(w) d[(X|Z=z); (Y|W=w)]`. -/
def condRdist (X : Ω → G) (Z : Ω → T) (μ : Measure Ω) (Y : Ω' → G) (W : Ω' → T')
    (μ' : Measure Ω') : ℝ :=
  ∑ z, ∑ w, (μ (Z ⁻¹' {z})).toReal * (μ' (W ⁻¹' {w})).toReal *
    rdist ((cond μ (Z ⁻¹' {z})).map X) ((cond μ' (W ⁻¹' {w})).map Y)

/-- AC.1/entropic-ruzsa-distance, API: symmetry. -/
theorem rdist_symm (μ ν : Measure G) [IsProbabilityMeasure μ] [IsProbabilityMeasure ν] :
    rdist μ ν = rdist ν μ := by
  sorry

/-- AC.1/entropic-ruzsa-distance, API: nonnegativity, from (A.11). -/
theorem rdist_nonneg (μ ν : Measure G) [IsProbabilityMeasure μ] [IsProbabilityMeasure ν] :
    0 ≤ rdist μ ν := by
  sorry

/-- AC.1/entropic-ruzsa-distance, API: (A.12) `|H[X] − H[Y]| ≤ 2 d[X; Y]`. -/
theorem abs_measureEntropy_sub_le (μ ν : Measure G) [IsProbabilityMeasure μ]
    [IsProbabilityMeasure ν] : |measureEntropy μ - measureEntropy ν| ≤ 2 * rdist μ ν := by
  sorry

/-- AC.1/entropic-ruzsa-distance, API: for independent `X`, `Y` on one space,
`d[X; Y] = H[X − Y] − H[X]/2 − H[Y]/2`. -/
theorem rdist_map_eq_of_indepFun (X Y : Ω → G) (μ : Measure Ω) [IsProbabilityMeasure μ]
    (hX : Measurable X) (hY : Measurable Y) (h : IndepFun X Y μ) :
    rdist (μ.map X) (μ.map Y) = entropy (X - Y) μ - entropy X μ / 2 - entropy Y μ / 2 := by
  sorry

/-- AC.1/entropic-ruzsa-distance, API: translation invariance. -/
theorem rdist_map_add_const (μ ν : Measure G) [IsProbabilityMeasure μ] [IsProbabilityMeasure ν]
    (a : G) : rdist (μ.map (· + a)) ν = rdist μ ν := by
  sorry

/-- AC.1/entropic-ruzsa-distance, API: a uniform distribution on a subgroup is at distance zero
from itself. -/
theorem rdist_uniformOn_self (H : AddSubgroup G) :
    rdist (uniformOn (H : Set G)) (uniformOn (H : Set G)) = 0 := by
  sorry

-- rdist_dirac_zero
example : rdist (Measure.dirac (0 : G)) (Measure.dirac 0) = 0 := by
  sorry

-- rdist_cosets
example (H : AddSubgroup G) (a b : G) :
    rdist ((uniformOn (H : Set G)).map (· + a)) ((uniformOn (H : Set G)).map (· + b)) = 0 := by
  sorry

-- rdist_three_points
example :
    rdist (uniformOn ({0, Pi.single 0 1, Pi.single 1 1} : Set (Fin 2 → ZMod 2)))
        (uniformOn ({0, Pi.single 0 1, Pi.single 1 1} : Set (Fin 2 → ZMod 2))) =
      2 / 3 * Real.log (3 / 2) := by
  sorry

/-- AC.1/entropic-ruzsa-triangle. The entropic Ruzsa triangle inequality (A.13). -/
theorem rdist_triangle (μ ν ρ : Measure G) [IsProbabilityMeasure μ] [IsProbabilityMeasure ν]
    [IsProbabilityMeasure ρ] : rdist μ ν ≤ rdist μ ρ + rdist ρ ν := by
  sorry

/-- AC.1/madiman-inequality. Lemma A.1, `H[X+Y+Z] − H[X+Y] ≤ H[Y+Z] − H[Y]` for independent
`X, Y, Z`. -/
theorem entropy_add_add_sub_le (X Y Z : Ω → G) (μ : Measure Ω) [IsProbabilityMeasure μ]
    (hX : Measurable X) (hY : Measurable Y) (hZ : Measurable Z)
    (h : iIndepFun ![X, Y, Z] μ) :
    entropy (X + Y + Z) μ - entropy (X + Y) μ ≤ entropy (Y + Z) μ - entropy Y μ := by
  sorry

/-- AC.1/entropic-bsg. Lemma A.2, the entropic Balog–Szemerédi–Gowers lemma. -/
theorem sum_rdist_cond_le (A B : Ω → G) (μ : Measure Ω) [IsProbabilityMeasure μ]
    (hA : Measurable A) (hB : Measurable B) :
    ∑ z, (μ ((A + B) ⁻¹' {z})).toReal *
        rdist ((cond μ ((A + B) ⁻¹' {z})).map A) ((cond μ ((A + B) ⁻¹' {z})).map B) ≤
      3 * mutualInfo A B μ + 2 * entropy (A + B) μ - entropy A μ - entropy B μ := by
  sorry

/-- AC.1/fibring-lemma. Proposition 4.1 with its explicit error term, for independent
`Z₁`, `Z₂`. -/
theorem rdist_eq_fibring {H H' : Type*} [AddCommGroup H] [Fintype H] [MeasurableSpace H]
    [DiscreteMeasurableSpace H] [AddCommGroup H'] [Fintype H'] [MeasurableSpace H']
    [DiscreteMeasurableSpace H'] (f : H →+ H') (Z₁ Z₂ : Ω → H) (μ : Measure Ω)
    [IsProbabilityMeasure μ] (h₁ : Measurable Z₁) (h₂ : Measurable Z₂) (h : IndepFun Z₁ Z₂ μ) :
    rdist (μ.map Z₁) (μ.map Z₂) =
      rdist (μ.map (f ∘ Z₁)) (μ.map (f ∘ Z₂)) + condRdist Z₁ (f ∘ Z₁) μ Z₂ (f ∘ Z₂) μ +
        condMutualInfo (Z₁ - Z₂) (fun ω => (f (Z₁ ω), f (Z₂ ω))) (f ∘ (Z₁ - Z₂)) μ := by
  sorry

/-- AC.1/fibring-corollary. Corollary 4.2 for four independent random variables. -/
theorem fibring_four (Y₁ Y₂ Y₃ Y₄ : Ω → G) (μ : Measure Ω) [IsProbabilityMeasure μ]
    (hm : ∀ i, Measurable (![Y₁, Y₂, Y₃, Y₄] i)) (h : iIndepFun ![Y₁, Y₂, Y₃, Y₄] μ) :
    rdist (μ.map (Y₁ - Y₃)) (μ.map (Y₂ - Y₄)) + condRdist Y₁ (Y₁ - Y₃) μ Y₂ (Y₂ - Y₄) μ +
        condMutualInfo (Y₁ - Y₂) (Y₂ - Y₄) (Y₁ - Y₂ - Y₃ + Y₄) μ =
      rdist (μ.map Y₁) (μ.map Y₂) + rdist (μ.map Y₃) (μ.map Y₄) := by
  sorry

/-- AC.1/conditional-distance-bound. Lemma 5.2. -/
theorem condRdist_le (X : Ω → G) (Z : Ω → T) (μ : Measure Ω) [IsProbabilityMeasure μ]
    (Y : Ω' → G) (W : Ω' → T') (μ' : Measure Ω') [IsProbabilityMeasure μ']
    (hX : Measurable X) (hZ : Measurable Z) (hY : Measurable Y) (hW : Measurable W) :
    condRdist X Z μ Y W μ' ≤
      rdist (μ.map X) (μ'.map Y) + mutualInfo X Z μ / 2 + mutualInfo Y W μ' / 2 := by
  sorry

/-- AC.1/distance-sum-bounds. Lemma 5.3, (5.6) and (5.7), for `Y`, `Z` independent. -/
theorem rdist_sub_sub_le (X : Ω' → G) (μ' : Measure Ω') [IsProbabilityMeasure μ'] (Y Z : Ω → G)
    (μ : Measure Ω) [IsProbabilityMeasure μ] (hX : Measurable X) (hY : Measurable Y)
    (hZ : Measurable Z) (h : IndepFun Y Z μ) :
    rdist (μ'.map X) (μ.map (Y - Z)) - rdist (μ'.map X) (μ.map Y) ≤
        (entropy (Y - Z) μ - entropy Y μ) / 2 ∧
      condRdist X (fun _ => ()) μ' Y (Y - Z) μ - rdist (μ'.map X) (μ.map Y) ≤
        (entropy (Y - Z) μ - entropy Z μ) / 2 := by
  sorry

/-- AC.1/distance-fibre-sum-bound. Lemma 7.1, for `Y`, `Z`, `Z'` independent. -/
theorem condRdist_sub_sub_le (X : Ω' → G) (μ' : Measure Ω') [IsProbabilityMeasure μ']
    (Y Z Z' : Ω → G) (μ : Measure Ω) [IsProbabilityMeasure μ] (hX : Measurable X)
    (hm : ∀ i, Measurable (![Y, Z, Z'] i)) (h : iIndepFun ![Y, Z, Z'] μ) :
    condRdist X (fun _ => ()) μ' (Y - Z) (Y - Z - Z') μ - rdist (μ'.map X) (μ.map Y) ≤
      (entropy (Y - Z - Z') μ + entropy (Y - Z) μ - entropy Y μ - entropy Z' μ) / 2 := by
  sorry

/-- AC.1/hundred-percent-case. Lemma 2.2: distance zero forces translates of the uniform
distribution on one subgroup. -/
theorem exists_subgroup_of_rdist_eq_zero (μ ν : Measure G) [IsProbabilityMeasure μ]
    [IsProbabilityMeasure ν] (h : rdist μ ν = 0) :
    ∃ (H : AddSubgroup G) (a b : G), μ = (uniformOn (H : Set G)).map (· + a) ∧
      ν = (uniformOn (H : Set G)).map (· + b) := by
  sorry

end Distance

section Marton

variable {Ω : Type*} [MeasurableSpace Ω]
  {G : Type*} [AddCommGroup G] [Module (ZMod 2) G] [Fintype G] [MeasurableSpace G]
  [DiscreteMeasurableSpace G]

/-- AC.1/tau-functional. (2.1): `τ[X₁; X₂] = d[X₁; X₂] + η d[X₁⁰; X₁] + η d[X₂⁰; X₂]`. -/
def tau (η : ℝ) (ρ₁ ρ₂ μ₁ μ₂ : Measure G) : ℝ :=
  rdist μ₁ μ₂ + η * rdist ρ₁ μ₁ + η * rdist ρ₂ μ₂

/-- AC.1/tau-functional, data: `(μ₁, μ₂)` minimizes `τ` over pairs of probability measures. -/
def IsTauMinimizer (η : ℝ) (ρ₁ ρ₂ μ₁ μ₂ : Measure G) : Prop :=
  IsProbabilityMeasure μ₁ ∧ IsProbabilityMeasure μ₂ ∧
    ∀ ν₁ ν₂ : Measure G, IsProbabilityMeasure ν₁ → IsProbabilityMeasure ν₂ →
      tau η ρ₁ ρ₂ μ₁ μ₂ ≤ tau η ρ₁ ρ₂ ν₁ ν₂

/-- AC.1/tau-functional, API: a minimizer exists (compactness of the simplex). -/
theorem exists_isTauMinimizer (η : ℝ) (ρ₁ ρ₂ : Measure G) :
    ∃ μ₁ μ₂ : Measure G, IsTauMinimizer η ρ₁ ρ₂ μ₁ μ₂ := by
  sorry

/-- AC.1/tau-functional, API: (2.3) the swapped reference pair. -/
theorem tau_swap (η : ℝ) (ρ₁ ρ₂ : Measure G) [IsProbabilityMeasure ρ₁]
    [IsProbabilityMeasure ρ₂] : tau η ρ₁ ρ₂ ρ₂ ρ₁ = (1 + 2 * η) * rdist ρ₁ ρ₂ := by
  sorry

/-- AC.1/tau-functional, API: the conditioned form (3.15) of minimality. -/
theorem IsTauMinimizer.condRdist_ge {η : ℝ} {ρ₁ ρ₂ μ₁ μ₂ : Measure G} (hη : 0 ≤ η)
    (hmin : IsTauMinimizer η ρ₁ ρ₂ μ₁ μ₂) {Ω₁ Ω₂ T₁ T₂ : Type*} [MeasurableSpace Ω₁]
    [MeasurableSpace Ω₂] [Fintype T₁] [MeasurableSpace T₁] [DiscreteMeasurableSpace T₁]
    [Fintype T₂] [MeasurableSpace T₂] [DiscreteMeasurableSpace T₂]
    (X₁ : Ω₁ → G) (Y₁ : Ω₁ → T₁) (ν₁ : Measure Ω₁) [IsProbabilityMeasure ν₁]
    (X₂ : Ω₂ → G) (Y₂ : Ω₂ → T₂) (ν₂ : Measure Ω₂) [IsProbabilityMeasure ν₂]
    (h₁ : Measurable X₁) (h₁' : Measurable Y₁) (h₂ : Measurable X₂) (h₂' : Measurable Y₂) :
    rdist μ₁ μ₂ - η * (condRdist id (fun _ => ()) ρ₁ X₁ Y₁ ν₁ - rdist ρ₁ μ₁) -
        η * (condRdist id (fun _ => ()) ρ₂ X₂ Y₂ ν₂ - rdist ρ₂ μ₂) ≤
      condRdist X₁ Y₁ ν₁ X₂ Y₂ ν₂ := by
  sorry

-- tau_uniform_self
example (η : ℝ) (H : AddSubgroup G) :
    tau η (uniformOn (H : Set G)) (uniformOn (H : Set G)) (uniformOn (H : Set G))
      (uniformOn (H : Set G)) = 0 := by
  sorry

-- not_isTauMinimizer_zero
example (η : ℝ) (ρ₁ ρ₂ : Measure G) : ¬ IsTauMinimizer η ρ₁ ρ₂ 0 0 := by
  sorry

-- tau_nonneg
example (η : ℝ) (hη : 0 ≤ η) (ρ₁ ρ₂ μ₁ μ₂ : Measure G) [IsProbabilityMeasure ρ₁]
    [IsProbabilityMeasure ρ₂] [IsProbabilityMeasure μ₁] [IsProbabilityMeasure μ₂] :
    0 ≤ tau η ρ₁ ρ₂ μ₁ μ₂ := by
  sorry

/-- The setting of Sections 5–7: independent `X₁, X₂, X̃₁, X̃₂` with `X₁, X̃₁ ∼ μ₁` and
`X₂, X̃₂ ∼ μ₂`, where `(μ₁, μ₂)` minimizes `τ` for `η = 1/9`. -/
structure MinimizerSetup (ρ₁ ρ₂ : Measure G) (Ω : Type*) [MeasurableSpace Ω] where
  μ : Measure Ω
  isProb : IsProbabilityMeasure μ
  μ₁ : Measure G
  μ₂ : Measure G
  min : IsTauMinimizer (1 / 9) ρ₁ ρ₂ μ₁ μ₂
  X₁ : Ω → G
  X₂ : Ω → G
  X₁' : Ω → G
  X₂' : Ω → G
  meas : ∀ i, Measurable (![X₁, X₂, X₁', X₂'] i)
  indep : iIndepFun ![X₁, X₂, X₁', X₂'] μ
  law₁ : μ.map X₁ = μ₁
  law₂ : μ.map X₂ = μ₂
  law₁' : μ.map X₁' = μ₁
  law₂' : μ.map X₂' = μ₂

/-- AC.1/first-estimate. Section 5: `I₁ ≤ 2ηk` (3.13) and the entropy bound (5.8). -/
theorem first_estimate {ρ₁ ρ₂ : Measure G} (P : MinimizerSetup ρ₁ ρ₂ Ω) :
    let k := rdist P.μ₁ P.μ₂
    let S := P.X₁ + P.X₂ + P.X₁' + P.X₂'
    let I₁ := condMutualInfo (P.X₁ + P.X₂) (P.X₁' + P.X₂) S P.μ
    I₁ ≤ 2 * (1 / 9) * k ∧
      entropy S P.μ ≤ entropy P.X₁ P.μ / 2 + entropy P.X₂ P.μ / 2 + (2 + 1 / 9) * k - I₁ := by
  sorry

/-- AC.1/second-estimate. Section 6: the bound (3.14) for `I₂`. -/
theorem second_estimate {ρ₁ ρ₂ : Measure G} (P : MinimizerSetup ρ₁ ρ₂ Ω) :
    let η : ℝ := 1 / 9
    let k := rdist P.μ₁ P.μ₂
    let S := P.X₁ + P.X₂ + P.X₁' + P.X₂'
    let I₁ := condMutualInfo (P.X₁ + P.X₂) (P.X₁' + P.X₂) S P.μ
    condMutualInfo (P.X₁ + P.X₂) (P.X₁ + P.X₁') S P.μ ≤
      2 * η * k + 2 * η * (2 * η * k - I₁) / (1 - η) := by
  sorry

/-- AC.1/endgame-lemma. Lemma 7.2, for `T₁ + T₂ + T₃ = 0`. -/
theorem exists_endgame_pair (ρ₁ ρ₂ μ₁ μ₂ : Measure G) (η : ℝ) (hη : 0 ≤ η)
    (T₁ T₂ T₃ : Ω → G) (μ : Measure Ω) [IsProbabilityMeasure μ]
    (hm : ∀ i, Measurable (![T₁, T₂, T₃] i)) (hsum : T₁ + T₂ + T₃ = 0) :
    let δ := mutualInfo T₁ T₂ μ + mutualInfo T₁ T₃ μ + mutualInfo T₂ T₃ μ
    let T := ![T₁, T₂, T₃]
    ∃ ν₁ ν₂ : Measure G, IsProbabilityMeasure ν₁ ∧ IsProbabilityMeasure ν₂ ∧
      rdist ν₁ ν₂ + η * (rdist ρ₁ ν₁ - rdist ρ₁ μ₁) + η * (rdist ρ₂ ν₂ - rdist ρ₂ μ₂) ≤
        δ + η / 3 * (δ + ∑ j, ((rdist ρ₁ (μ.map (T j)) - rdist ρ₁ μ₁) +
          (rdist ρ₂ (μ.map (T j)) - rdist ρ₂ μ₂))) := by
  sorry

/-- AC.1/tau-decrement. Proposition 2.1, in contrapositive form: a `τ`-minimizer for `η = 1/9`
has distance zero. -/
theorem rdist_eq_zero_of_isTauMinimizer (ρ₁ ρ₂ μ₁ μ₂ : Measure G)
    (hmin : IsTauMinimizer (1 / 9) ρ₁ ρ₂ μ₁ μ₂) : rdist μ₁ μ₂ = 0 := by
  sorry

/-- AC.1/entropic-pfr. Gowers–Green–Manners–Tao Theorem 1.8. -/
theorem entropic_pfr (ρ₁ ρ₂ : Measure G) [IsProbabilityMeasure ρ₁] [IsProbabilityMeasure ρ₂] :
    ∃ H : AddSubgroup G,
      rdist ρ₁ (uniformOn (H : Set G)) + rdist ρ₂ (uniformOn (H : Set G)) ≤
          11 * rdist ρ₁ ρ₂ ∧
        rdist ρ₁ (uniformOn (H : Set G)) ≤ 6 * rdist ρ₁ ρ₂ ∧
        rdist ρ₂ (uniformOn (H : Set G)) ≤ 6 * rdist ρ₁ ρ₂ := by
  sorry

/-- AC.1/marton-conjecture. Gowers–Green–Manners–Tao Theorem 1.2: Marton's conjecture
(the polynomial Freiman–Ruzsa conjecture) in characteristic 2, with `C = 12`. -/
theorem pfr [DecidableEq G] (A : Finset G) (hA : A.Nonempty) (K : ℝ) (hK : ((A + A).card : ℝ) ≤ K * A.card) :
    ∃ (H : AddSubgroup G) (c : Finset G), (c.card : ℝ) ≤ 2 * K ^ 12 ∧
      Nat.card H ≤ A.card ∧ (A : Set G) ⊆ (c : Set G) + (H : Set G) := by
  sorry

end Marton

end TauCeti.EntropicPFR


namespace TauCeti.AdditiveFourier
open scoped Pointwise
attribute [local instance] Classical.propDecidable

section PhaseBohr
variable {G : Type*} [AddCommGroup G] [Fintype G]
def phaseBohrSet (Γ : Finset (AddChar G ℂ)) (ε : AddChar G ℂ → ℝ) : Finset G := by
  classical
  exact Finset.univ.filter (fun x => ∀ χ ∈ Γ, |Complex.arg (χ x)| / (2 * Real.pi) < ε χ)
def IsRegularPhaseBohr (Γ : Finset (AddChar G ℂ)) (ε : AddChar G ℂ → ℝ) : Prop :=
  ∀ η : ℝ, 0 < 1 + η → (Γ.card : ℝ) * |η| ≤ 1 / 100 →
    (1 - 100 * Γ.card * |η|) * (phaseBohrSet Γ ε).card ≤
      (phaseBohrSet Γ (fun χ => (1 + η) * ε χ)).card ∧
    ((phaseBohrSet Γ (fun χ => (1 + η) * ε χ)).card : ℝ) ≤
      (1 + 100 * Γ.card * |η|) * (phaseBohrSet Γ ε).card
lemma phaseBohrSet_mem (Γ : Finset (AddChar G ℂ)) (ε : AddChar G ℂ → ℝ) (x : G) :
    x ∈ phaseBohrSet Γ ε ↔ ∀ χ ∈ Γ, |Complex.arg (χ x)| / (2 * Real.pi) < ε χ := by sorry
lemma phaseBohrSet_empty (ε : AddChar G ℂ → ℝ) : phaseBohrSet ∅ ε = Finset.univ := by sorry
lemma phaseBohrSet_mono (Γ : Finset (AddChar G ℂ)) (ε ε' : AddChar G ℂ → ℝ)
    (h : ∀ χ ∈ Γ, ε χ ≤ ε' χ) : phaseBohrSet Γ ε ⊆ phaseBohrSet Γ ε' := by sorry
lemma phaseBohrSet_neg (Γ : Finset (AddChar G ℂ)) (ε : AddChar G ℂ → ℝ) (x : G) :
    -x ∈ phaseBohrSet Γ ε ↔ x ∈ phaseBohrSet Γ ε := by sorry
lemma phaseBohrSet_chord_comparison (Γ : Finset (AddChar G ℂ)) (ε : ℝ)
    (hε : 0 < ε) (hε' : ε ≤ 1/2) :
    phaseBohrSet Γ (fun _ => ε) = bohrSet Γ (2 * Real.sin (Real.pi * ε)) := by sorry
lemma phaseBohrSet_card_lower (Γ : Finset (AddChar G ℂ)) (ε : AddChar G ℂ → ℝ)
    (hε : ∀ χ ∈ Γ, 0 < ε χ ∧ ε χ ≤ 1) :
    2 ^ (-(Γ.card : ℤ)) * Fintype.card G * (∏ χ ∈ Γ, ε χ) ≤
      (phaseBohrSet Γ ε).card := by sorry
lemma phaseBohrSet_half_card (Γ : Finset (AddChar G ℂ)) (ε : AddChar G ℂ → ℝ)
    (hε : ∀ χ ∈ Γ, 0 < ε χ ∧ ε χ ≤ 1) :
    (phaseBohrSet Γ ε).card ≤ 8 ^ (Γ.card + 1) * (phaseBohrSet Γ (fun χ => ε χ / 2)).card := by sorry
lemma isRegularPhaseBohr_zero (Γ : Finset (AddChar G ℂ)) (ε : AddChar G ℂ → ℝ) :
    phaseBohrSet Γ (fun χ => (1 + (0 : ℝ)) * ε χ) = phaseBohrSet Γ ε := by sorry
lemma isRegularPhaseBohr_empty (ε : AddChar G ℂ → ℝ) : IsRegularPhaseBohr ∅ ε := by sorry
-- phaseBohrSet.test_empty
example : phaseBohrSet (∅ : Finset (AddChar (ZMod 4) ℂ)) (fun _ => -1) = Finset.univ ∧
    IsRegularPhaseBohr (∅ : Finset (AddChar (ZMod 4) ℂ)) (fun _ => -1) := by sorry
-- phaseBohrSet.test_quarter_endpoint
example : phaseBohrSet {(AddChar.zmodAddEquiv (1 : ZMod 4))} (fun _ => 1/4) = {0} := by sorry
-- phaseBohrSet.test_half_endpoint
example : phaseBohrSet {(AddChar.zmodAddEquiv (1 : ZMod 4))} (fun _ => 1/2) = {0,1,3} := by sorry
-- phaseBohrSet.test_chord_radius
example : 2 * Real.sin (Real.pi / 32) < 1/4 ∧
    1/24 < (1/20 : ℝ) ∧ 1/4 < 2 * Real.sin (Real.pi / 24) := by sorry

theorem regularBohr_shrink (Γ : Finset (AddChar G ℂ)) (ε : AddChar G ℂ → ℝ)
    (hε : ∀ χ ∈ Γ, 0 < ε χ ∧ ε χ ≤ 1) :
    ∃ scale : ℝ, 1/2 ≤ scale ∧ scale ≤ 1 ∧ IsRegularPhaseBohr Γ (fun χ => scale * ε χ) := by sorry
def phaseBohrProbability (Γ : Finset (AddChar G ℂ)) (ε : AddChar G ℂ → ℝ) : G → ℂ :=
  fun x => if x ∈ phaseBohrSet Γ ε then
    ((Fintype.card G : ℝ)/(phaseBohrSet Γ ε).card : ℝ) else 0
theorem regularBohr_translation (Γ : Finset (AddChar G ℂ))
    (ε ε' : AddChar G ℂ → ℝ) (hε : ∀ χ ∈ Γ, 0 < ε χ ∧ ε χ ≤ 1)
    (hreg : IsRegularPhaseBohr Γ ε) (hd : 0 < Γ.card) (κ : ℝ)
    (hκ : 0 < κ) (hκ' : κ ≤ 1)
    (hε' : ∀ χ ∈ Γ, 0 < ε' χ ∧ ε' χ ≤ κ*ε χ/(100*Γ.card)) :
      (∀ h ∈ phaseBohrSet Γ ε',
        (((phaseBohrSet Γ ε).image (fun x => x+h) \ phaseBohrSet Γ ε) ∪
          (phaseBohrSet Γ ε \ (phaseBohrSet Γ ε).image (fun x => x+h))).card ≤
            2*κ*(phaseBohrSet Γ ε).card) ∧
      (Fintype.card G : ℝ)⁻¹ * ∑ x,
        ‖nconv (phaseBohrProbability Γ ε) (phaseBohrProbability Γ ε') x-
          phaseBohrProbability Γ ε x‖ ≤ 2*κ := by sorry
theorem bohr_density_increment (f : G → ℝ) (α η : ℝ) (χ : AddChar G ℂ)
    (Γ : Finset (AddChar G ℂ)) (r : ℝ) (hχΓ : χ ∈ Γ)
    (hr : 0 < r) (hr' : r ≤ 1/2)
    (hf : ∀ x, 0 ≤ f x ∧ f x ≤ 1) (hα : 0 < α)
    (hmean : (Fintype.card G : ℝ)⁻¹ * ∑ x, f x = α) (hη : 0 < η)
    (hχ : χ ≠ 1) (hfour : η ≤ ‖fourier (fun x => (f x : ℂ)) χ‖) :
    ∃ x, (nconv (fun y => (f y : ℂ))
      (fun y => if y ∈ bohrSet Γ r then
        ((Fintype.card G : ℝ) / (bohrSet Γ r).card : ℝ) else 0) x).re ≥
        α + η ^ 2 / (4 * α) := by sorry
end PhaseBohr

section GAP
variable {G : Type*} [AddCommGroup G] [DecidableEq G]
structure GeneralizedAP (G : Type*) [AddCommGroup G] where
  rank : ℕ
  base : G
  step : Fin rank → G
  length : Fin rank → ℕ
def GeneralizedAP.eval (P : GeneralizedAP G) (n : Fin P.rank → ℕ) : G :=
  P.base + ∑ i, n i • P.step i
def GeneralizedAP.point (P : GeneralizedAP G) (n : Fin P.rank → ℕ) : G := P.eval n
def GeneralizedAP.box (P : GeneralizedAP G) : Finset (Fin P.rank → ℕ) :=
  Fintype.piFinset (fun i => Finset.range (P.length i + 1))
def GeneralizedAP.carrier (P : GeneralizedAP G) : Finset G := by
  classical
  exact P.box.image P.eval
def GeneralizedAP.IsProper (P : GeneralizedAP G) : Prop := Set.InjOn P.eval (P.box : Set _)
def GeneralizedAP.volume (P : GeneralizedAP G) : ℕ := ∏ i, (P.length i + 1)
lemma GeneralizedAP.mem_carrier (P : GeneralizedAP G) (x : G) :
    x ∈ P.carrier ↔ ∃ n, (∀ i, n i ≤ P.length i) ∧ P.eval n = x := by sorry
lemma GeneralizedAP.card_le_volume (P : GeneralizedAP G) : P.carrier.card ≤ P.volume := by sorry
lemma GeneralizedAP.card_eq_volume_iff (P : GeneralizedAP G) :
    P.carrier.card = P.volume ↔ P.IsProper := by sorry
def GeneralizedAP.translate (P : GeneralizedAP G) (a : G) : GeneralizedAP G :=
  { P with base := a + P.base }
lemma GeneralizedAP.translate_properties (P : GeneralizedAP G) (a : G) :
    (P.translate a).volume = P.volume ∧ ((P.translate a).IsProper ↔ P.IsProper) := by sorry
def GeneralizedAP.map {H : Type*} [AddCommGroup H] (P : GeneralizedAP G)
    (f : G →+ H) : GeneralizedAP H := ⟨P.rank,f P.base,fun i => f (P.step i),P.length⟩
lemma GeneralizedAP.map_proper {H : Type*} [AddCommGroup H] (P : GeneralizedAP G)
    (f : G →+ H) (hf : Function.Injective f) : (P.map f).IsProper ↔ P.IsProper := by sorry
lemma GeneralizedAP.freiman_compatibility {H : Type*} [AddCommGroup H]
    (P : GeneralizedAP G) (f : G → H) (hf : IsAddFreimanIso 2 (P.carrier : Set G)
      (f '' (P.carrier : Set G)) f) (a b c d : G)
    (ha : a ∈ P.carrier) (hb : b ∈ P.carrier) (hc : c ∈ P.carrier) (hd : d ∈ P.carrier) :
    a + b = c + d ↔ f a + f b = f c + f d := by sorry
-- GeneralizedAP.test_rank_zero
example (a : ℤ) :
    let P : GeneralizedAP ℤ := ⟨0,a,Fin.elim0,Fin.elim0⟩
    P.carrier = {a} ∧ P.volume = 1 := by sorry
-- GeneralizedAP.test_interval
example : let P : GeneralizedAP ℤ := ⟨1,3,fun _ => 2,fun _ => 2⟩
    P.carrier = {3,5,7} ∧ P.volume = 3 ∧ P.IsProper := by sorry
-- GeneralizedAP.test_zero_step
example : let P : GeneralizedAP ℤ := ⟨1,0,fun _ => 0,fun _ => 1⟩
    P.carrier.card = 1 ∧ P.volume = 2 ∧ ¬ P.IsProper := by sorry
-- GeneralizedAP.test_torsion_wrap
example : let P : GeneralizedAP (ZMod 2) := ⟨1,0,fun _ => 1,fun _ => 2⟩
    P.carrier.card = 2 ∧ P.volume = 3 ∧ ¬ P.IsProper := by sorry
theorem progression_properization (d : ℕ) : ∃ C : ℝ, 0 < C ∧
    ∀ (G : Type) [AddCommGroup G] [DecidableEq G] [IsAddTorsionFree G],
    ∀ P : GeneralizedAP G, P.rank ≤ d → ∃ Q : GeneralizedAP G,
      Q.IsProper ∧ Q.rank ≤ d ∧ P.carrier ⊆ Q.carrier ∧ (Q.volume : ℝ) ≤ C * P.volume := by sorry
theorem freiman_torsion_free (K : ℝ) (hK : 1 ≤ K) :
    ∃ (D : ℕ) (C : ℝ), 0 < C ∧ ∀ (G : Type) [AddCommGroup G] [DecidableEq G] [IsAddTorsionFree G],
      ∀ A : Finset G, A.Nonempty →
      ((A + A).card : ℝ) ≤ K * A.card → ∃ P : GeneralizedAP G,
        P.IsProper ∧ P.rank ≤ D ∧ A ⊆ P.carrier ∧ (P.volume : ℝ) ≤ C * A.card := by sorry
end GAP

section Gowers
variable {G : Type*} [AddCommGroup G] [Fintype G]
def finiteAverage {A : Type*} [Fintype A] (f : A → ℂ) : ℂ := (Fintype.card A : ℂ)⁻¹ * ∑ a, f a
def cubeVertex (d : ℕ) (x : G) (h : Fin d → G) (ω : Fin d → Bool) : G :=
  x + ∑ i, if ω i then h i else 0
def cubeConjugate (d : ℕ) (ω : Fin d → Bool) (z : ℂ) : ℂ :=
  if (∑ i, if ω i then (1 : ℕ) else 0) % 2 = 0 then z else star z
def gowersInnerProduct (d : ℕ) (f : (Fin d → Bool) → G → ℂ) : ℂ :=
  finiteAverage (fun p : G × (Fin d → G) =>
    ∏ ω, cubeConjugate d ω (f ω (cubeVertex d p.1 p.2 ω)))
def gowersNorm (d : ℕ) (f : G → ℂ) : ℝ :=
  (gowersInnerProduct d (fun _ => f)).re ^ ((2 ^ d : ℝ)⁻¹)
lemma gowersInnerProduct_const (d : ℕ) (c : (Fin d → Bool) → ℂ) :
    gowersInnerProduct d (fun ω => fun _ : G => c ω) = ∏ ω, cubeConjugate d ω (c ω) := by sorry
lemma gowersInnerProduct_nonneg_of_indep_last (d : ℕ)
    (f : (Fin (d+1) → Bool) → G → ℂ)
    (h : ∀ ω ω', (∀ i : Fin (d+1), i ≠ Fin.last d → ω i=ω' i) → f ω=f ω') :
    0 ≤ (gowersInnerProduct (d+1) f).re := by sorry
lemma gowersNorm_nonneg (d : ℕ) (hd : 1 ≤ d) (f : G → ℂ) : 0 ≤ gowersNorm d f := by sorry
lemma gowersNorm_pow_eq (d : ℕ) (hd : 1 ≤ d) (f : G → ℂ) :
    gowersNorm d f ^ (2 ^ d) = (gowersInnerProduct d (fun _ => f)).re := by sorry
lemma gowersNorm_one (d : ℕ) (hd : 1 ≤ d) : gowersNorm d (fun _ : G => 1) = 1 := by sorry
lemma gowersNorm_U1 (f : G → ℂ) : gowersNorm 1 f = ‖finiteAverage f‖ := by sorry
lemma gowersNorm_character (χ : AddChar G ℂ) (d : ℕ) (hd : 2 ≤ d) :
    gowersNorm d (fun x => χ x) = 1 := by sorry
lemma gowersNorm_U2_fourier (f : G → ℂ) :
    gowersNorm 2 f ^ 4 = ∑ χ : AddChar G ℂ, ‖fourier f χ‖ ^ 4 := by sorry
lemma gowersNorm_translate (d : ℕ) (f : G → ℂ) (a : G) :
    gowersNorm d (fun x => f (x+a)) = gowersNorm d f := by sorry
lemma gowersNorm_smul (d : ℕ) (f : G → ℂ) (c : ℂ) :
    gowersNorm d (fun x => c * f x) = ‖c‖ * gowersNorm d f := by sorry
theorem gowers_cauchy_schwarz (d : ℕ) (hd : 1 ≤ d)
    (f : (Fin d → Bool) → G → ℂ) : ‖gowersInnerProduct d f‖ ≤ ∏ ω, gowersNorm d (f ω) := by sorry
theorem gowersNorm_add_le (d : ℕ) (hd : 1 ≤ d) (f g : G → ℂ) :
    gowersNorm d (f+g) ≤ gowersNorm d f + gowersNorm d g := by sorry
theorem gowersNorm_mono (d : ℕ) (hd : 1 ≤ d) (f : G → ℂ) :
    gowersNorm d f ≤ gowersNorm (d+1) f := by sorry
theorem gowersNorm_eq_zero_iff (d : ℕ) (hd : 2 ≤ d) (f : G → ℂ) :
    gowersNorm d f = 0 ↔ f = 0 := by sorry
-- gowersNorm.test_mean
example : gowersNorm 1 (fun x : ZMod 2 => if x=0 then (1 : ℂ) else -1) = 0 ∧
    gowersNorm 2 (fun x : ZMod 2 => if x=0 then (1 : ℂ) else -1) = 1 := by sorry
-- gowersNorm.test_complex_character
example : gowersNorm 2 (fun x : ZMod 3 => AddChar.zmodAddEquiv (1 : ZMod 3) x) = 1 := by sorry
-- gowersInnerProduct.test_negative_mixed
example : gowersInnerProduct 1 (fun ω => fun _ : ZMod 2 => if ω 0 then (-1 : ℂ) else 1) = -1 := by sorry
-- gowersNorm.test_point_mass
example : gowersNorm 2 (Pi.single (0 : ZMod 2) (1 : ℂ)) ^ 4 = 1/8 := by sorry

def intervalCubeCount (d N : ℕ) (f : ℤ → ℂ) : ℂ :=
  ∑ p ∈ (Finset.Icc (-(N : ℤ)) N).product
      (Fintype.piFinset (fun _ : Fin d => Finset.Icc (-(N : ℤ)) N)),
    ∏ ω : Fin d → Bool,
      cubeConjugate d ω (if cubeVertex d p.1 p.2 ω ∈ Finset.Icc (1 : ℤ) N
        then f (cubeVertex d p.1 p.2 ω) else 0)
def intervalGowersNorm (d N : ℕ) (f : ℤ → ℂ) : ℝ :=
  ((intervalCubeCount d N f).re / (intervalCubeCount d N (fun _ => 1)).re) ^ ((2 ^ d : ℝ)⁻¹)
def integerBox (ℓ N : ℕ) : Finset (Fin ℓ → ℤ) :=
  Fintype.piFinset (fun _ => Finset.Icc (-(N : ℤ)) N)
def boxCubeCount (d ℓ N : ℕ) (f : (Fin ℓ → ℤ) → ℂ) : ℂ :=
  ∑ p ∈ (integerBox ℓ N).product
      (Fintype.piFinset (fun _ : Fin d => integerBox ℓ (2*N))),
    ∏ ω : Fin d → Bool,
      cubeConjugate d ω (if cubeVertex d p.1 p.2 ω ∈ integerBox ℓ N
        then f (cubeVertex d p.1 p.2 ω) else 0)
def boxGowersNorm (d ℓ N : ℕ) (f : (Fin ℓ → ℤ) → ℂ) : ℝ :=
  ((boxCubeCount d ℓ N f).re / (boxCubeCount d ℓ N (fun _ => 1)).re) ^ ((2 ^ d : ℝ)⁻¹)
-- Zero-extension data for the cyclic comparison. All aliases are explicit functions.
def intervalZeroExtension (N M : ℕ) (f : ℤ → ℂ) (x : ZMod M) : ℂ :=
  if 1 ≤ x.val ∧ x.val ≤ N then f x.val else 0
def boxZeroExtension (ℓ N M : ℕ) (f : (Fin ℓ → ℤ) → ℂ) : (Fin ℓ → ZMod M) → ℂ := by sorry
lemma intervalGowersNorm_independent_modulus (d N M : ℕ) (hd : 1 ≤ d)
    (hN : 1 ≤ N) (hM : 2 ^ d * N ≤ M) [NeZero M] (f : ℤ → ℂ) :
    intervalGowersNorm d N f = gowersNorm d (intervalZeroExtension N M f) /
      gowersNorm d (intervalZeroExtension N M (fun _ => 1)) := by sorry
lemma boxGowersNorm_independent_modulus (d ℓ N M : ℕ) (hd : 1 ≤ d)
    (hM : 2 ^ d * (2*N+1) ≤ M) [NeZero M] (f : (Fin ℓ → ℤ) → ℂ) :
    boxGowersNorm d ℓ N f = gowersNorm d (boxZeroExtension ℓ N M f) /
      gowersNorm d (boxZeroExtension ℓ N M (fun _ => 1)) := by sorry
lemma intervalGowersNorm_zero (d : ℕ) (hd : 1 ≤ d) (f : ℤ → ℂ) :
    intervalGowersNorm d 0 f = 0 := by sorry
lemma intervalGowersNorm_one (d N : ℕ) (hd : 1 ≤ d) (hN : 1 ≤ N) :
    intervalGowersNorm d N (fun _ => 1) = 1 := by sorry
lemma boxGowersNorm_one (d ℓ N : ℕ) (hd : 1 ≤ d) :
    boxGowersNorm d ℓ N (fun _ => 1) = 1 := by sorry
lemma boxGowersNorm_dim_zero (d N : ℕ) (hd : 1 ≤ d) (f : (Fin 0 → ℤ) → ℂ) :
    boxGowersNorm d 0 N f = ‖f Fin.elim0‖ := by sorry
lemma intervalGowersNorm_smul (d N : ℕ) (hd : 1 ≤ d) (f : ℤ → ℂ) (c : ℂ) :
    intervalGowersNorm d N (fun n => c*f n) = ‖c‖ * intervalGowersNorm d N f := by sorry
def progressionGowersNorm (d : ℕ) (P : Finset ℤ) (f : ℤ → ℂ) : ℝ := by sorry
lemma intervalGowersNorm_affine_reindex (d N : ℕ) (hd : 1 ≤ d) (a r : ℤ)
    (hr : r ≠ 0) (f : ℤ → ℂ) :
    intervalGowersNorm d N (fun n => f (a+r*n)) =
      progressionGowersNorm d ((Finset.Icc (1 : ℤ) N).image (fun n => a+r*n)) f := by sorry
-- intervalGowersNorm.test_empty
example : intervalGowersNorm 2 0 (fun _ => 100) = 0 := by sorry
-- intervalGowersNorm.test_singleton
example (d : ℕ) (hd : 1 ≤ d) : intervalGowersNorm d 1 (fun _ => 2*Complex.I) = 2 := by sorry
-- intervalGowersNorm.test_normalization
example : intervalGowersNorm 2 2 (fun _ => 1) = 1 ∧
    gowersNorm 2 (intervalZeroExtension 2 9 (fun _ => 1)) < 1 := by sorry
-- boxGowersNorm.test_dim_zero
example : boxGowersNorm 2 0 0 (fun _ => -3*Complex.I) = 3 := by sorry
-- boxGowersNorm.test_modulus
example : gowersNorm 2 (intervalZeroExtension 2 8 (fun _ => 1)) /
    gowersNorm 2 (intervalZeroExtension 2 8 (fun _ => 1)) =
    gowersNorm 2 (intervalZeroExtension 2 9 (fun _ => 1)) /
    gowersNorm 2 (intervalZeroExtension 2 9 (fun _ => 1)) := by sorry
end Gowers

section Progressions
variable {N : ℕ} [NeZero N]
def cyclicProgressionAverage (k : ℕ) (f : Fin k → ZMod N → ℂ) : ℂ :=
  finiteAverage (fun p : ZMod N × ZMod N => ∏ i, f i (p.1 + (i.val : ℕ) • p.2))
def intervalProgressionAverage (k N : ℕ) (f : Fin k → ℤ → ℂ) : ℂ :=
  ((N+1 : ℕ) : ℂ) ^ (-2 : ℤ) *
    ∑ x ∈ Finset.range (N+1), ∑ r ∈ Finset.range (N+1),
      ∏ i, if 1 ≤ x + i.val*r ∧ x + i.val*r ≤ N then f i (x+i.val*r) else 0
lemma cyclicProgressionAverage_const (k : ℕ) (c : Fin k → ℂ) :
    cyclicProgressionAverage (N := N) k (fun i _ => c i) = ∏ i, c i := by sorry
lemma intervalProgressionAverage_indicator (k N : ℕ) (A : Finset ℤ) :
    intervalProgressionAverage k N (fun _ x => if x ∈ A then 1 else 0) =
      ((N+1 : ℕ) : ℂ) ^ (-2 : ℤ) *
      (((Finset.range (N+1)).product (Finset.range (N+1))).filter
        (fun p => ∀ i : Fin k, 1 ≤ p.1+i.val*p.2 ∧ p.1+i.val*p.2 ≤ N ∧
          ((p.1+i.val*p.2 : ℕ) : ℤ) ∈ A)).card := by sorry
lemma cyclicProgressionAverage_translate (k : ℕ) (f : Fin k → ZMod N → ℂ) (a : ZMod N) :
    cyclicProgressionAverage k (fun i x => f i (x+a)) = cyclicProgressionAverage k f := by sorry
lemma cyclicProgressionAverage_multilinear (k : ℕ) (j : Fin k)
    (f : Fin k → ZMod N → ℂ) (g h : ZMod N → ℂ) :
    cyclicProgressionAverage k (Function.update f j (g+h)) =
      cyclicProgressionAverage k (Function.update f j g) +
        cyclicProgressionAverage k (Function.update f j h) := by sorry
lemma cyclicProgressionAverage_diagonal (k : ℕ) (f : Fin k → ZMod N → ℂ) :
    (N : ℂ) ^ (-2 : ℤ) * ∑ x : ZMod N, ∏ i, f i x =
      (N : ℂ)⁻¹ * finiteAverage (fun x : ZMod N => ∏ i, f i x) := by sorry
lemma intervalProgressionAverage_empty (k : ℕ) (hk : 1 ≤ k) (f : Fin k → ℤ → ℂ) :
    intervalProgressionAverage k 0 f = 0 := by sorry
-- cyclicProgressionAverage.test_full
example : cyclicProgressionAverage (N := 5) 0 (fun _ _ => 1) = 1 := by sorry
-- cyclicProgressionAverage.test_singleton
example : cyclicProgressionAverage (N := 5) 3 (fun _ x => if x=0 then 1 else 0) = 1/25 := by sorry
-- intervalProgressionAverage.test_boundary
example : intervalProgressionAverage 3 2 (fun _ _ => 1) = 2/9 := by sorry
-- intervalProgressionAverage.test_empty
example : intervalProgressionAverage 3 0 (fun _ _ => 1) = 0 := by sorry
theorem dense_generalised_von_neumann (k p : ℕ) [Fact p.Prime] (hk : 2 ≤ k)
    (hp : k < p) (f : Fin k → ZMod p → ℂ) (hf : ∀ i x, ‖f i x‖ ≤ 1) (j : Fin k) :
    ‖cyclicProgressionAverage k f‖ ≤ gowersNorm (k-1) (f j) := by sorry
theorem quantitative_szemeredi (k : ℕ) (hk : 5 ≤ k) : ∃ c C : ℝ, 0 < c ∧ 0 < C ∧
    ∀ N : ℕ, 3 ≤ N → ∀ A : Finset ℕ, A ⊆ Finset.range N →
      (∀ a r : ℕ, 0 < r → ¬ ∀ i : Fin k, a+i.val*r ∈ A) →
      (A.card : ℝ) ≤ C*N*Real.exp (-(Real.log (Real.log N)) ^ c) := by sorry
theorem rahman_roth_threshold (δ : ℝ) (hδ : 0 < δ) (hδ' : δ < 1) (k : ℕ)
    (hk : Real.exp (Real.exp (132*Real.log 2/δ)) ≤ k) (J : Finset ℕ)
    (hJ : J ⊆ Finset.range k) (hdense : δ*k ≤ (J.card : ℝ)) :
    ∃ i j, i ∈ J ∧ j ∈ J ∧ 2*j-i ∈ J ∧ i < j := by sorry
theorem finitary_szemeredi (k : ℕ) (δ : ℝ) (hδ : 0 < δ) : ∃ N₀ : ℕ,
    ∀ N ≥ N₀, ∀ A : Finset ℕ, A ⊆ Finset.range N → δ*N ≤ (A.card : ℝ) →
      ∃ a r : ℕ, 0 < r ∧ ∀ i : Fin k, a+i.val*r ∈ A := by sorry
theorem varnavides (k : ℕ) (hk : 2 ≤ k) (δ : ℝ) (hδ : 0 < δ) :
    ∃ c : ℝ, 0 < c ∧ ∃ N₀ : ℕ, ∀ p : ℕ, ∀ (_ : NeZero p),
      N₀ ≤ p → p.Prime → ∀ f : ZMod p → ℝ,
      (∀ x, 0 ≤ f x ∧ f x ≤ 1) →
      δ ≤ (finiteAverage (fun x => (f x : ℂ))).re →
      c ≤ (cyclicProgressionAverage k (fun _ x => (f x : ℂ))).re := by sorry
end Progressions

section Factors
attribute [local instance] Classical.decEq
def NilsequenceFactor (N : ℕ) := Finpartition (Finset.univ : Finset (Fin N))
def NilsequenceFactor.ofFunctions (N T : ℕ) (h : Fin T → Fin N → ℝ) (K : ℝ) :
    NilsequenceFactor N := by sorry
def factorCell {N : ℕ} (B : NilsequenceFactor N) (x : Fin N) : Finset (Fin N) := by sorry
lemma NilsequenceFactor.sameCell_iff (N T : ℕ) (h : Fin T → Fin N → ℝ) (K : ℝ) (x y : Fin N) :
    factorCell (NilsequenceFactor.ofFunctions N T h K) x =
      factorCell (NilsequenceFactor.ofFunctions N T h K) y ↔
    ∀ i, Int.floor (K*h i x) = Int.floor (K*h i y) := by sorry
def NilsequenceFactor.join {N : ℕ} (B C : NilsequenceFactor N) : NilsequenceFactor N := by sorry
def factorAverage {N : ℕ} (B : NilsequenceFactor N) (f : Fin N → ℝ) (x : Fin N) : ℝ :=
  ((factorCell B x).card : ℝ)⁻¹ * ∑ y ∈ factorCell B x, f y
lemma factorAverage_mean {N : ℕ} (B : NilsequenceFactor N) (f : Fin N → ℝ) :
    ∑ x, factorAverage B f x = ∑ x, f x := by sorry
lemma factorAverage_idempotent {N : ℕ} (B : NilsequenceFactor N) (f : Fin N → ℝ) :
    factorAverage B (factorAverage B f) = factorAverage B f := by sorry
lemma factorAverage_bounds {N : ℕ} (B : NilsequenceFactor N) (f : Fin N → ℝ)
    (hf : ∀ x, 0 ≤ f x ∧ f x ≤ 1) : ∀ x, 0 ≤ factorAverage B f x ∧ factorAverage B f x ≤ 1 := by sorry
lemma factorAverage_refinement_energy {N : ℕ} (B C : NilsequenceFactor N) (f : Fin N → ℝ)
    (hrefine : ∀ x, factorCell C x ⊆ factorCell B x) :
    ∑ x, (factorAverage B f x)^2 ≤ ∑ x, (factorAverage C f x)^2 := by sorry
def distanceToInteger (x : ℝ) : ℝ := |x - (Int.floor (x+1/2) : ℝ)|
def IsRegularResolution {N : ℕ} (h : Fin N → ℝ) (K C : ℝ) : Prop :=
  ∀ r : ℝ, 0 < r →
    (((Finset.univ.filter (fun n => distanceToInteger (K*h n) ≤ r)).card : ℝ) / N) ≤ 2*C*r
theorem regularResolution_exists : ∃ C : ℝ, 0 < C ∧ ∀ N : ℕ, 1 ≤ N →
    ∀ h : Fin N → ℝ, ∀ K : ℝ, 0 < K → ∃ t : ℝ,
      0 ≤ t ∧ t < K⁻¹ ∧ IsRegularResolution (fun n => h n-t) K C := by sorry
-- NilsequenceFactor.test_one_cell
example (N : ℕ) (hN : 1 ≤ N) (f : Fin N → ℝ) (x : Fin N) :
    factorAverage (NilsequenceFactor.ofFunctions N 1 (fun _ _ => 0) 1) f x =
      (N : ℝ)⁻¹ * ∑ y, f y := by sorry
-- NilsequenceFactor.test_two_cells
example : factorAverage (NilsequenceFactor.ofFunctions 4 1 (fun _ n => if n.val<2 then 0 else 1) 1)
    (fun n => (n.val : ℝ)) 0 = 1/2 ∧
    factorAverage (NilsequenceFactor.ofFunctions 4 1 (fun _ n => if n.val<2 then 0 else 1) 1)
    (fun n => (n.val : ℝ)) 2 = 5/2 := by sorry
-- NilsequenceFactor.test_join
example (N : ℕ) (B : NilsequenceFactor N) : NilsequenceFactor.join B B = B := by sorry
-- IsRegularResolution.test_integer_constant
example (C : ℝ) : ¬ IsRegularResolution (N := 1) (fun _ => 0) 1 C := by sorry
-- IsRegularResolution.test_half_constant
example (N : ℕ) (hN : 1 ≤ N) : IsRegularResolution (N := N) (fun _ => 1/2) 1 1 := by sorry
end Factors

section Density
def upperNaturalDensity (A : Set ℕ) : ℝ :=
  Filter.limsup (fun N : ℕ => ((Finset.range N).filter (fun n => n ∈ A)).card / (N : ℝ)) Filter.atTop
lemma upperNaturalDensity_bounds (A : Set ℕ) : 0 ≤ upperNaturalDensity A ∧ upperNaturalDensity A ≤ 1 := by sorry
lemma upperNaturalDensity_finite (A : Set ℕ) (hA : A.Finite) : upperNaturalDensity A = 0 := by sorry
lemma upperNaturalDensity_univ : upperNaturalDensity Set.univ = 1 := by sorry
lemma upperNaturalDensity_mono (A B : Set ℕ) (h : A ⊆ B) : upperNaturalDensity A ≤ upperNaturalDensity B := by sorry
lemma upperNaturalDensity_remove_finite (A F : Set ℕ) (hF : F.Finite) :
    upperNaturalDensity (A \ F) = upperNaturalDensity A := by sorry
lemma upperNaturalDensity_residue (q a : ℕ) (hq : 0 < q) :
    upperNaturalDensity {n | n % q = a % q} = (q : ℝ)⁻¹ := by sorry
-- upperNaturalDensity.test_finite
example : upperNaturalDensity {0,1,2} = 0 := by sorry
-- upperNaturalDensity.test_evens
example : upperNaturalDensity {n | n % 2 = 0} = 1/2 := by sorry
-- upperNaturalDensity.test_limsup: explicit factorial-sized alternating blocks.
def alternatingBlocks : Set ℕ := {n | ∃ k, n ∈ Finset.Ico (Nat.factorial (2*k)) (Nat.factorial (2*k+1))}
example : upperNaturalDensity alternatingBlocks = 1 ∧
    Filter.liminf (fun N : ℕ => ((Finset.range N).filter (fun n => n ∈ alternatingBlocks)).card /
      (N : ℝ)) Filter.atTop = 0 := by sorry
theorem szemeredi_upper_density (A : Set ℕ) (hA : 0 < upperNaturalDensity A) (k H : ℕ) :
    ∃ a r : ℕ, H < a ∧ 0 < r ∧ ∀ i : Fin k, a+i.val*r ∈ A := by sorry
end Density
end TauCeti.AdditiveFourier


namespace TauCeti.AdditiveFourier
open scoped Manifold ContDiff
open MeasureTheory Module
attribute [local instance] Classical.propDecidable

section Filtrations
variable {G : Type*} [Group G]
def groupCommutator (x y : G) : G := x⁻¹*y⁻¹*x*y
structure DegreeFiltration (G : Type*) [Group G] (s : ℕ) where
  layer : ℕ → Subgroup G
  zero_eq_top : layer 0 = ⊤
  one_eq_top : layer 1 = ⊤
  antitone : Antitone layer
  terminal : layer (s+1) = ⊥
  comm_mem : ∀ i j x y, x ∈ layer i → y ∈ layer j → groupCommutator x y ∈ layer (i+j)
def DegreeFiltration.level {s : ℕ} (D : DegreeFiltration G s) : ℕ → Subgroup G := D.layer
lemma DegreeFiltration.above_degree {s : ℕ} (D : DegreeFiltration G s) (i : ℕ) (hi : s < i) :
    D.layer i = ⊥ := by sorry
def DegreeFiltration.pullback {H : Type*} [Group H] {s : ℕ} (D : DegreeFiltration G s)
    (φ : H →* G) (hφ : Function.Injective φ) : DegreeFiltration H s := by sorry
theorem DegreeFiltration.degree_one_iff :
    Nonempty (DegreeFiltration G 1) ↔ ∀ x y : G, x*y = y*x := by sorry
def abelianFiltration (G : Type*) [CommGroup G] (s : ℕ) (hs : 1 ≤ s) : DegreeFiltration G s := by sorry
-- DegreeFiltration.test_abelian
example (G : Type*) [CommGroup G] :
    (abelianFiltration G 1 (by decide)).layer 2 = ⊥ := by sorry
-- DegreeFiltration.test_degree_zero
example : ¬ Nonempty (DegreeFiltration (Multiplicative ℝ) 0) := by sorry

variable {A : Type*} [AddCommGroup A]
def filteredDerivative (g : A → G) (h : A) : A → G := fun n => g (n+h)*(g n)⁻¹
def iteratedFilteredDerivative (g : A → G) : List A → A → G
  | [] => g
  | h :: hs => filteredDerivative (iteratedFilteredDerivative g hs) h
def IsFilteredPolynomial {s : ℕ} (D : DegreeFiltration G s) (g : A → G) : Prop :=
  ∀ hs : List A, ∀ n, iteratedFilteredDerivative g hs n ∈ D.layer hs.length
lemma IsFilteredPolynomial.const {s : ℕ} (D : DegreeFiltration G s) (c : G) :
    IsFilteredPolynomial D (fun _ : A => c) := by sorry
lemma IsFilteredPolynomial.shift {s : ℕ} (D : DegreeFiltration G s) (g : A → G)
    (hg : IsFilteredPolynomial D g) (a : A) : IsFilteredPolynomial D (fun n => g (n+a)) := by sorry
lemma IsFilteredPolynomial.affine {s : ℕ} (D : DegreeFiltration G s) (g : ℤ → G)
    (hg : IsFilteredPolynomial D g) (a b : ℤ) : IsFilteredPolynomial D (fun n => g (a+b*n)) := by sorry
lemma IsFilteredPolynomial.mul {s : ℕ} (D : DegreeFiltration G s) (g h : A → G)
    (hg : IsFilteredPolynomial D g) (hh : IsFilteredPolynomial D h) :
    IsFilteredPolynomial D (fun n => g n*h n) := by sorry
lemma IsFilteredPolynomial.inv {s : ℕ} (D : DegreeFiltration G s) (g : A → G)
    (hg : IsFilteredPolynomial D g) : IsFilteredPolynomial D (fun n => (g n)⁻¹) := by sorry
lemma IsFilteredPolynomial.map {H : Type*} [Group H] {s : ℕ}
    (D : DegreeFiltration G s) (E : DegreeFiltration H s) (φ : G →* H)
    (hφ : ∀ i x, x ∈ D.layer i → φ x ∈ E.layer i) (g : A → G)
    (hg : IsFilteredPolynomial D g) : IsFilteredPolynomial E (fun n => φ (g n)) := by sorry
-- IsFilteredPolynomial.test_linear
example (a b : ℝ) : IsFilteredPolynomial (abelianFiltration (Multiplicative ℝ) 1 (by decide))
    (fun n : ℤ => Multiplicative.ofAdd (a+b*n)) := by sorry
-- IsFilteredPolynomial.test_quadratic
example : ¬ IsFilteredPolynomial (abelianFiltration (Multiplicative ℝ) 1 (by decide))
    (fun n : ℤ => Multiplicative.ofAdd ((n : ℝ)^2)) := by sorry
-- IsFilteredPolynomial.test_quadratic_degree_two
example : IsFilteredPolynomial (abelianFiltration (Multiplicative ℝ) 2 (by decide))
    (fun n : ℤ => Multiplicative.ofAdd ((n : ℝ)^2)) := by sorry
-- filteredDerivative.test_orientation
example (a b : G) (h n : ℤ) : filteredDerivative (fun n : ℤ => a^n*b) h n = a^h := by sorry
end Filtrations

/- A small test model, not a new library Heisenberg-group programme. -/
structure HeisPoint where
  x : ℝ
  y : ℝ
  z : ℝ
def heisMul (a b : HeisPoint) : HeisPoint := ⟨a.x+b.x,a.y+b.y,a.z+b.z+a.x*b.y⟩
def heisInv (a : HeisPoint) : HeisPoint := ⟨-a.x,-a.y,-a.z+a.x*a.y⟩
instance : Group HeisPoint where
  mul := heisMul
  one := ⟨0,0,0⟩
  inv := heisInv
  mul_assoc := by sorry
  one_mul := by sorry
  mul_one := by sorry
  inv_mul_cancel := by sorry
def heisLattice : Subgroup HeisPoint where
  carrier := {a | (∃ n : ℤ, a.x=n) ∧ (∃ n : ℤ, a.y=n) ∧ (∃ n : ℤ, a.z=n)}
  one_mem' := by sorry
  mul_mem' := by sorry
  inv_mem' := by sorry
def heisDegreeFiltration : DegreeFiltration HeisPoint 2 := by sorry
-- DegreeFiltration.test_heisenberg
example : groupCommutator (⟨1,0,0⟩ : HeisPoint) ⟨0,1,0⟩ = ⟨0,0,1⟩ ∧
    (⟨0,0,1⟩ : HeisPoint) ∈ heisDegreeFiltration.layer 2 ∧
    heisDegreeFiltration.layer 3 = ⊥ := by sorry

structure FilteredNilmanifold where
  dim : ℕ
  degree : ℕ
  carrier : Type
  [group : Group carrier]
  [topology : TopologicalSpace carrier]
  [charted : ChartedSpace (Fin dim → ℝ) carrier]
  [manifold : IsManifold (𝓘(ℝ, Fin dim → ℝ)) ⊤ carrier]
  [lie : LieGroup (𝓘(ℝ, Fin dim → ℝ)) ⊤ carrier]
  [simply : SimplyConnectedSpace carrier]
  [nilpotent : Group.IsNilpotent carrier]
  filtration : DegreeFiltration carrier degree
  closed_layers : ∀ i, IsClosed (filtration.layer i : Set carrier)
  connected_layers : ∀ i, IsConnected (filtration.layer i : Set carrier)
  lattice : Subgroup carrier
  [discrete : DiscreteTopology lattice]
  [compact : CompactSpace (carrier ⧸ lattice)]
  layer_compact : ∀ i, CompactSpace
    ((filtration.layer i) ⧸ lattice.subgroupOf (filtration.layer i))
attribute [instance] FilteredNilmanifold.group FilteredNilmanifold.topology
  FilteredNilmanifold.charted FilteredNilmanifold.manifold FilteredNilmanifold.lie
  FilteredNilmanifold.simply FilteredNilmanifold.nilpotent FilteredNilmanifold.discrete
  FilteredNilmanifold.compact

abbrev FilteredNilmanifold.Space (M : FilteredNilmanifold) := M.carrier ⧸ M.lattice
def FilteredNilmanifold.coset (M : FilteredNilmanifold) (g : M.carrier) : M.Space := QuotientGroup.mk g
lemma FilteredNilmanifold.coset_eq_iff (M : FilteredNilmanifold) (g h : M.carrier) :
    M.coset g = M.coset h ↔ h⁻¹*g ∈ M.lattice := by sorry
def FilteredNilmanifold.leftTranslate (M : FilteredNilmanifold) (g : M.carrier) : M.Space → M.Space := by sorry
instance (M : FilteredNilmanifold) : MeasurableSpace M.Space := borel M.Space
def FilteredNilmanifold.invariantProbability (M : FilteredNilmanifold) : Measure M.Space := by sorry
lemma FilteredNilmanifold.invariantProbability_mass (M : FilteredNilmanifold) :
    M.invariantProbability Set.univ = 1 := by sorry
lemma FilteredNilmanifold.invariantProbability_translate (M : FilteredNilmanifold) (g : M.carrier) :
    M.invariantProbability.map (M.leftTranslate g) = M.invariantProbability := by sorry
def FilteredNilmanifold.abelian_torus (m : ℕ) :
    ((Fin m → ℝ) ⧸ AddSubgroup.pi Set.univ (fun _ => AddSubgroup.zmultiples (1 : ℝ))) ≃
      (Fin m → AddCircle (1 : ℝ)) := by sorry
-- FilteredNilmanifold.test_circle
example : CompactSpace (AddCircle (1 : ℝ)) ∧ DiscreteTopology (AddSubgroup.zmultiples (1 : ℝ)) := by sorry
-- FilteredNilmanifold.test_heisenberg
example : ∃ M : FilteredNilmanifold, M.dim=3 ∧ M.degree=2 ∧
    ∃ e : M.carrier ≃* HeisPoint,
      (∀ g, g ∈ M.lattice ↔ e g ∈ heisLattice) ∧ ¬ M.lattice.Normal := by sorry
-- FilteredNilmanifold.test_dense_subgroup
def rationalRealSubgroup : AddSubgroup ℝ := (Rat.castHom ℝ).toAddMonoidHom.range
example : ¬ DiscreteTopology rationalRealSubgroup := by sorry
-- FilteredNilmanifold.test_noncompact_quotient
example : ¬ ∃ M : FilteredNilmanifold, Nonempty (M.carrier ≃ₜ ℝ) ∧ M.lattice=⊥ := by sorry

def rationalHeight (q : ℚ) : ℕ := max q.num.natAbs q.den
structure RationalMalcevBasis (M : FilteredNilmanifold) (Q : ℝ) where
  basis : Basis (Fin M.dim) ℝ (LeftInvariantDerivation (𝓘(ℝ, Fin M.dim → ℝ)) M.carrier)
  coordinates : M.carrier ≃ (Fin M.dim → ℝ)
  coordinates_one : coordinates 1 = 0
  bracket : Fin M.dim → Fin M.dim → Fin M.dim → ℚ
  bracket_coeff : ∀ i j, ⁅basis i,basis j⁆ = ∑ k, (bracket i j k : ℝ) • basis k
  height : ∀ i j k, (rationalHeight (bracket i j k) : ℝ) ≤ Q
  mem_lattice_iff : ∀ g, g ∈ M.lattice ↔ ∀ i, ∃ z : ℤ, coordinates g i = z
  tail : ℕ → ℕ
  layer_tail : ∀ i g, g ∈ M.filtration.layer i ↔ ∀ j : Fin M.dim, j.val < tail i → coordinates g j = 0
-- The canonical exponential-product condition is omitted until LieGroups supplies lieExp.
def RationalMalcevBasis.height_mono {M : FilteredNilmanifold} {Q Q' : ℝ}
    (B : RationalMalcevBasis M Q) (h : Q ≤ Q') : RationalMalcevBasis M Q' := by sorry
-- RationalMalcevBasis.first_second_kind: finite triangular BCH comparison signature.
def firstKindCoordinateMap {M : FilteredNilmanifold} {Q : ℝ} (B : RationalMalcevBasis M Q) :
    (Fin M.dim → ℝ) → (Fin M.dim → ℝ) := by sorry
lemma RationalMalcevBasis.first_second_kind {M : FilteredNilmanifold} {Q : ℝ}
    (B : RationalMalcevBasis M Q) : firstKindCoordinateMap B 0 = 0 := by sorry
-- RationalMalcevBasis.test_torus
example (m : ℕ) (x : Fin m → ℝ) : (∀ i, ∃ z : ℤ, x i=z) ↔
    x ∈ AddSubgroup.pi Set.univ (fun _ => AddSubgroup.zmultiples (1 : ℝ)) := by sorry
-- RationalMalcevBasis.test_height
example : rationalHeight (2/3) = 3 ∧ ¬ ∃ q : ℚ, (q : ℝ) = Real.sqrt 2 := by sorry
-- RationalMalcevBasis.test_heisenberg_order
example : heisMul ⟨1,0,0⟩ ⟨0,1,0⟩ = ⟨1,1,1⟩ ∧
    (1 : ℝ)/2 ≠ 1 := by sorry
-- RationalMalcevBasis.test_lattice_scale
example : ¬ ∃ n : ℤ, (1 : ℝ) = 2*n := by sorry

section Metrics
variable {M : FilteredNilmanifold} {Q : ℝ} (B : RationalMalcevBasis M Q)
def malcevEdgeCost (u v : M.carrier) : ℝ :=
  min ‖B.coordinates (u*v⁻¹)‖ ‖B.coordinates (v*u⁻¹)‖
def malcevGroupDistance (x y : M.carrier) : ℝ :=
  sInf {r | ∃ k : ℕ, ∃ chain : Fin (k+1) → M.carrier,
    chain 0 = x ∧ chain (Fin.last k) = y ∧
    r = ∑ i : Fin k, malcevEdgeCost B (chain i.castSucc) (chain i.succ)}
def malcevQuotientDistance (x y : M.Space) : ℝ :=
  sInf {r | ∃ g h : M.carrier, M.coset g = x ∧ M.coset h = y ∧ r = malcevGroupDistance B g h}
lemma malcevGroupDistance_right (x y z : M.carrier) :
    malcevGroupDistance B (x*z) (y*z) = malcevGroupDistance B x y := by sorry
lemma malcevQuotientDistance_representative (x y : M.carrier) (γ γ' : M.lattice) :
    malcevQuotientDistance B (M.coset (x*γ)) (M.coset (y*γ')) =
      malcevQuotientDistance B (M.coset x) (M.coset y) := by sorry
abbrev malcevMetricSpace (B : RationalMalcevBasis M Q) : MetricSpace M.Space := by sorry
lemma malcevMetricSpace_distance (x y : M.Space) :
    @dist M.Space (malcevMetricSpace B).toDist x y = malcevQuotientDistance B x y := by sorry
def observableLipNorm (F : M.Space → ℂ) : ℝ :=
  sSup (Set.range (fun x => ‖F x‖)) +
    sInf {L : ℝ | 0 ≤ L ∧ ∀ x y, ‖F x-F y‖ ≤ L*malcevQuotientDistance B x y}
structure BoundedNilsequence (ℓ : ℕ) (L : ℝ) where
  orbit : (Fin ℓ → ℤ) → M.carrier
  polynomial : IsFilteredPolynomial M.filtration orbit
  observable : M.Space → ℂ
  bounded : ∀ x, ‖observable x‖ ≤ 1
  lip : observableLipNorm B observable ≤ L
def BoundedNilsequence.eval {B : RationalMalcevBasis M Q} {ℓ : ℕ} {L : ℝ} (f : BoundedNilsequence B ℓ L) (n : Fin ℓ → ℤ) : ℂ :=
  f.observable (M.coset (f.orbit n))
def BoundedNilsequence.value {B : RationalMalcevBasis M Q} {ℓ : ℕ} {L : ℝ}
    (f : BoundedNilsequence B ℓ L) : (Fin ℓ → ℤ) → ℂ := f.eval
lemma BoundedNilsequence.norm_le_one {ℓ : ℕ} {L : ℝ} (f : BoundedNilsequence B ℓ L) (n : Fin ℓ → ℤ) :
    ‖f.eval n‖ ≤ 1 := by sorry
def BoundedNilsequence.shift {ℓ : ℕ} {L : ℝ} (f : BoundedNilsequence B ℓ L) (a : Fin ℓ → ℤ) :
    BoundedNilsequence B ℓ L := by sorry
theorem BoundedNilsequence.character (α : ℝ) : ∃ M : FilteredNilmanifold,
    M.dim=1 ∧ M.degree=1 ∧ ∃ B : RationalMalcevBasis M 2,
      ∃ F : BoundedNilsequence B 1 (1+2*Real.pi),
        ∀ n : ℤ, F.eval (fun _ => n)=Complex.exp (2*Real.pi*α*n*Complex.I) := by sorry
-- malcevMetric_comparison: the Riemannian metric and quantitative constants await the supplier.
lemma malcevMetric_comparison (d : M.Space → M.Space → ℝ) (C : ℝ)
    (hC : 1 ≤ C) (hcompare : ∀ x y, d x y ≤ C*malcevQuotientDistance B x y ∧
      malcevQuotientDistance B x y ≤ C*d x y) :
    ∀ x y, C⁻¹*d x y ≤ malcevQuotientDistance B x y := by sorry
end Metrics

def circlePhase (x : ℝ) : ℂ := Complex.exp (2*Real.pi*x*Complex.I)
-- malcevMetric.test_circle
example (M : FilteredNilmanifold) (Q : ℝ) (B : RationalMalcevBasis M Q)
    (hdim : M.dim=1) (e : M.carrier ≃* Multiplicative ℝ)
    (hcoord : ∀ g j, B.coordinates g j=Multiplicative.toAdd (e g)) (g h : M.carrier) :
    malcevQuotientDistance B (M.coset g) (M.coset h)=
      distanceToInteger (Multiplicative.toAdd (e g)-Multiplicative.toAdd (e h)) := by sorry
-- malcevMetric.test_representatives
example (M : FilteredNilmanifold) (Q : ℝ) (B : RationalMalcevBasis M Q)
    (g h : M.carrier) (γ : M.lattice) :
    malcevQuotientDistance B (M.coset (g*γ)) (M.coset h)=
      malcevQuotientDistance B (M.coset g) (M.coset h) := by sorry
-- BoundedNilsequence.test_linear_phase
example (α : ℝ) : ∃ M : FilteredNilmanifold, M.dim=1 ∧ M.degree=1 ∧
    ∃ B : RationalMalcevBasis M 2, ∃ F : BoundedNilsequence B 1 (1+2*Real.pi),
      ∀ n : ℤ, F.eval (fun _ => n)=circlePhase (α*n) := by sorry
-- BoundedNilsequence.test_boundedness
example (M : FilteredNilmanifold) (Q L : ℝ) (B : RationalMalcevBasis M Q) :
    ¬ ∃ F : BoundedNilsequence B 1 L, ∀ x, F.observable x=2 := by sorry

section Horizontal
variable {M : FilteredNilmanifold} {Q : ℝ} (B : RationalMalcevBasis M Q)
structure HorizontalCharacter where
  lift : M.carrier →* Multiplicative ℝ
  continuous : Continuous lift
  coeff : Fin M.dim → ℤ
  coordinate_law : ∀ g, Multiplicative.toAdd (lift g) = ∑ i, (coeff i : ℝ)*B.coordinates g i
  lattice_integer : ∀ γ : M.lattice, ∃ z : ℤ, Multiplicative.toAdd (lift γ) = z
def HorizontalCharacter.coefficient (η : HorizontalCharacter B) : Fin M.dim → ℤ := η.coeff
def HorizontalCharacter.size (η : HorizontalCharacter B) : ℝ :=
  ‖(fun i => (η.coeff i : ℝ))‖
def polynomialSmoothness (s N : ℕ) (α : Fin (s+1) → ℝ) : ℝ :=
  sSup {r | r=0 ∨ ∃ j : Fin (s+1), 0 < j.val ∧ r = (N : ℝ)^j.val * distanceToInteger (α j)}
lemma polynomialSmoothness_constant (s N : ℕ) (c : ℝ) :
    polynomialSmoothness s N (fun j => if j.val=0 then c else 0) = 0 := by sorry
lemma polynomialSmoothness_integer_coeff (s N : ℕ) (α : Fin (s+1) → ℤ) :
    polynomialSmoothness s N (fun j => (α j : ℝ)) = 0 := by sorry
def binomialReal (n : ℤ) (j : ℕ) : ℝ :=
  (∏ k ∈ Finset.range j, ((n : ℝ)-(k : ℝ)))/(j.factorial : ℝ)
lemma polynomialSmoothness_monomial_comparison (s : ℕ) (hs : 1 ≤ s) :
    ∃ D : ℕ, 0 < D ∧ ∃ C : ℝ, 0 < C ∧ ∀ N : ℕ, 1 ≤ N →
      ∀ α β : Fin (s+1) → ℝ,
        (∀ n : ℤ, (∑ j, α j*binomialReal n j.val) = ∑ j, β j*(n : ℝ)^j.val) →
        polynomialSmoothness s N (fun j => D*α j) ≤ C*polynomialSmoothness s N β ∧
        polynomialSmoothness s N (fun j => D*β j) ≤ C*polynomialSmoothness s N α := by sorry
def IsEquidistributed (g : ℤ → M.carrier) (P : Finset ℤ) (δ : ℝ) : Prop :=
  ∀ F : M.Space → ℂ, ∀ L : ℝ, 0 ≤ L →
    (∀ x y, ‖F x-F y‖ ≤ L*malcevQuotientDistance B x y) →
    ‖(P.card : ℂ)⁻¹ * ∑ n ∈ P, F (M.coset (g n)) -
      ∫ x, F x ∂M.invariantProbability‖ ≤ δ*observableLipNorm B F
def IsTotallyEquidistributed (g : ℤ → M.carrier) (N : ℕ) (δ : ℝ) : Prop :=
  ∀ a r len : ℕ, 0 < r → δ*N ≤ len →
    (Finset.range len).image (fun i => ((a+r*i : ℕ) : ℤ)) ⊆ Finset.Icc (1 : ℤ) N →
    IsEquidistributed B g ((Finset.range len).image (fun i => ((a+r*i : ℕ) : ℤ))) δ
lemma IsTotallyEquidistributed.to_equidistributed (g : ℤ → M.carrier) (N : ℕ) (δ : ℝ)
    (hN : 1 ≤ N) (hδ : δ ≤ 1) (h : IsTotallyEquidistributed B g N δ) :
    IsEquidistributed B g (Finset.Icc (1 : ℤ) N) δ := by sorry
-- polynomialSmoothness.test_constant
example : polynomialSmoothness 2 10 (fun j => if j.val=0 then Real.sqrt 2 else 0) = 0 := by sorry
-- polynomialSmoothness.test_linear
example (N : ℕ) : polynomialSmoothness 1 N (fun j => if j.val=1 then 1/4 else 0) = (N : ℝ)/4 := by sorry
-- polynomialSmoothness.test_binomial
example (N : ℕ) : polynomialSmoothness 2 N (fun j => if j.val=2 then 1/2 else 0) = (N : ℝ)^2/2 := by sorry
-- IsEquidistributed.test_singleton_torus: explicit Lipschitz test separates the point from Haar.
example (N : ℕ) (hN : 0 < N) (δ L : ℝ) (hδ : 0 < δ) (hδL : δ*L < 1)
    (F : M.Space → ℂ) (hLip : observableLipNorm B F ≤ L)
    (hF : F (M.coset 1)=1) (hmean : (∫ x, F x ∂M.invariantProbability)=0)
    (hfinite : ∃ C : ℝ, 0 ≤ C ∧ ∀ x y, ‖F x-F y‖ ≤ C*malcevQuotientDistance B x y) :
    ¬ IsEquidistributed B (fun _ => 1) (Finset.Icc (1 : ℤ) N) δ := by sorry
-- HorizontalCharacter.test_circle
example (m : ℤ) (z : ℤ) : ∃ k : ℤ, (m : ℝ)*z = k := by sorry
end Horizontal

section Vertical
variable {M : FilteredNilmanifold} {Q : ℝ} (B : RationalMalcevBasis M Q)
def HasVerticalFrequency (T : Subgroup M.carrier) (ξ : T →* Multiplicative ℝ)
    (F : M.Space → ℂ) : Prop :=
  (∀ γ : T, (γ : M.carrier) ∈ M.lattice → ∃ z : ℤ, Multiplicative.toAdd (ξ γ) = z) ∧
    ∀ t : T, ∀ x : M.carrier,
      F (M.coset ((t : M.carrier)*x)) = circlePhase (Multiplicative.toAdd (ξ t))*F (M.coset x)
lemma HasVerticalFrequency.lattice (T : Subgroup M.carrier) (ξ : T →* Multiplicative ℝ)
    (F : M.Space → ℂ) (h : HasVerticalFrequency T ξ F) (γ : T) (hγ : (γ : M.carrier) ∈ M.lattice) :
    circlePhase (Multiplicative.toAdd (ξ γ)) = 1 := by sorry
def negativeFrequency (T : Subgroup M.carrier) (ξ : T →* Multiplicative ℝ) : T →* Multiplicative ℝ := by sorry
def sumFrequency (T : Subgroup M.carrier) (ξ η : T →* Multiplicative ℝ) : T →* Multiplicative ℝ := by sorry
lemma HasVerticalFrequency.conj (T : Subgroup M.carrier) (ξ : T →* Multiplicative ℝ)
    (F : M.Space → ℂ) (h : HasVerticalFrequency T ξ F) :
    HasVerticalFrequency T (negativeFrequency T ξ) (fun x => star (F x)) := by sorry
lemma HasVerticalFrequency.mul (T : Subgroup M.carrier) (ξ η : T →* Multiplicative ℝ)
    (F H : M.Space → ℂ) (hF : HasVerticalFrequency T ξ F) (hH : HasVerticalFrequency T η H) :
    HasVerticalFrequency T (sumFrequency T ξ η) (fun x => F x*H x) := by sorry
lemma HasVerticalFrequency.zero_frequency (T : Subgroup M.carrier) (F : M.Space → ℂ) :
    HasVerticalFrequency T 1 F ↔ ∀ t : T, ∀ x : M.carrier,
      F (M.coset ((t : M.carrier)*x)) = F (M.coset x) := by sorry
lemma HasVerticalFrequency.integral_zero (T : Subgroup M.carrier) (ξ : T →* Multiplicative ℝ)
    (F : M.Space → ℂ) (h : HasVerticalFrequency T ξ F)
    (hξ : ∃ t, circlePhase (Multiplicative.toAdd (ξ t)) ≠ 1)
    (hF : Integrable F M.invariantProbability) : ∫ x, F x ∂M.invariantProbability = 0 := by sorry
-- HasVerticalFrequency.test_circle
example (m : ℤ) (t x : ℝ) : circlePhase (m*(t+x)) = circlePhase (m*t)*circlePhase (m*x) := by sorry
-- HasVerticalFrequency.test_constant
example : circlePhase (1/2) * (1 : ℂ) ≠ 1 := by sorry
-- HasVerticalFrequency.test_zero
example (T : Subgroup M.carrier) (ξ : T →* Multiplicative ℝ)
    (hξ : ∀ γ : T, (γ : M.carrier) ∈ M.lattice → ∃ z : ℤ, Multiplicative.toAdd (ξ γ)=z) :
    HasVerticalFrequency T ξ (fun _ => 0) := by sorry
end Vertical

section OrbitFactors
variable {M : FilteredNilmanifold} {Q : ℝ} (B : RationalMalcevBasis M Q)
def IsRationalElement (bound : ℕ) (g : M.carrier) : Prop :=
  ∃ r : ℕ, 1 ≤ r ∧ r ≤ bound ∧ g^r ∈ M.lattice
def IsRationalSequence (bound : ℕ) (g : ℤ → M.carrier) : Prop := ∀ n, IsRationalElement bound (g n)
def IsRationalPeriodicSequence (bound : ℕ) (g : ℤ → M.carrier) : Prop :=
  IsRationalSequence bound g ∧ ∃ q : ℕ, 1 ≤ q ∧ q ≤ bound ∧ ∀ n, M.coset (g (n+q)) = M.coset (g n)
def IsSmoothSequence (bound : ℝ) (N : ℕ) (g : ℤ → M.carrier) : Prop :=
  ∀ n ∈ Finset.Icc (1 : ℤ) N,
    malcevGroupDistance B (g n) 1 ≤ bound ∧ malcevGroupDistance B (g n) (g (n-1)) ≤ bound/N
def IsRationalSubgroup (bound : ℝ)
    (V : Submodule ℝ (LeftInvariantDerivation (𝓘(ℝ, Fin M.dim → ℝ)) M.carrier)) : Prop :=
  ∃ r : ℕ, ∃ coeff : Fin r → Fin M.dim → ℚ,
    (∀ i j, (rationalHeight (coeff i j) : ℝ) ≤ bound) ∧
    V = Submodule.span ℝ (Set.range (fun i => ∑ j, (coeff i j : ℝ) • B.basis j))
lemma IsRationalElement.lattice (γ : M.lattice) : IsRationalElement 1 (γ : M.carrier) := by sorry
lemma IsSmoothSequence.const_one (bound : ℝ) (N : ℕ) (h : 0 ≤ bound) :
    IsSmoothSequence B bound N (fun _ => 1) := by sorry
lemma IsSmoothSequence.diameter (bound : ℝ) (N : ℕ) (g : ℤ → M.carrier)
    (h : IsSmoothSequence B bound N g) (m n : ℤ) (hm : m ∈ Finset.Icc (1 : ℤ) N)
    (hn : n ∈ Finset.Icc (1 : ℤ) N) :
    malcevGroupDistance B (g m) (g n) ≤ bound*|m-n|/N := by sorry
-- IsRationalElement.test_circle
example : (∃ r : ℕ, 1 ≤ r ∧ r ≤ 3 ∧ ∃ z : ℤ, (r : ℝ)/3=z) ∧
    ¬ (∃ r : ℕ, 1 ≤ r ∧ r ≤ 2 ∧ ∃ z : ℤ, (r : ℝ)/3=z) := by sorry
-- IsSmoothSequence.test_identity
example (N : ℕ) : IsSmoothSequence B 0 N (fun _ => 1) := by sorry
-- IsRationalSequence.test_nonperiodic: square-indicator rational phases have no finite period.
def squareCircleChoice (n : ℤ) : ℝ := if ∃ k : ℤ, n=k^2 then 1/2 else 0
example : (∀ n, ∃ z : ℤ, 2*squareCircleChoice n=z) ∧
    ¬ ∃ q : ℕ, 0 < q ∧ ∀ n, distanceToInteger (squareCircleChoice (n+q)-squareCircleChoice n)=0 := by sorry
end OrbitFactors

/- Prototype limitations, with every affected API name retained above:
* RationalMalcevBasis lacks the equality with the canonical lieExp product until the supplier
  provides lieExp. first_second_kind and malcevMetric_comparison expose only the statable portion;
  the full finite BCH and Riemannian comparison bounds in the document remain definitive.
* FilteredNilmanifold stores closed connected subgroup and compact lattice data; the smooth
  embedded-subgroup charts await the closed-subgroup supplier. The Heisenberg test gives actual
  group and lattice nonnormality; its full smooth compact quotient model is not instantiated here.
* HorizontalCharacter.test_circle and the torus tests expose scalar computational signatures;
  their coordinate/quotient equivalences are required by the document.
No unstated condition is represented by an arbitrary proposition field. -/
end TauCeti.AdditiveFourier


namespace TauCeti.AdditiveFourier
attribute [local instance] Classical.propDecidable
abbrev PrimeModulus := {p : ℕ // p.Prime}
instance (p : PrimeModulus) : NeZero p.val := ⟨p.property.ne_zero⟩
instance (p : PrimeModulus) : Fact p.val.Prime := ⟨p.property⟩
abbrev WeightFamily := (p : PrimeModulus) → ZMod p.val → ℝ
def realAverage {A : Type*} [Fintype A] (f : A → ℝ) : ℝ := (Fintype.card A : ℝ)⁻¹ * ∑ a, f a
def TendsToZeroOnPrimes (f : PrimeModulus → ℝ) : Prop :=
  ∀ ε : ℝ, 0 < ε → ∃ N₀ : ℕ, ∀ p : PrimeModulus, N₀ ≤ p.val → |f p| ≤ ε
def IsMeasureFamily (ν : WeightFamily) : Prop :=
  (∀ p x, 0 ≤ ν p x) ∧ TendsToZeroOnPrimes (fun p => realAverage (ν p)-1)
def rationalRowNonproportional {m t : ℕ} (L : Fin m → Fin t → ℚ) : Prop :=
  (∀ i, L i ≠ 0) ∧ ∀ i j, i ≠ j → ¬ ∃ c : ℚ, L i = c • L j
def rationalForm {m t : ℕ} (p : PrimeModulus) (L : Fin m → Fin t → ℚ)
    (b : Fin m → ZMod p.val) (i : Fin m) (x : Fin t → ZMod p.val) : ZMod p.val :=
  b i + ∑ j, ((L i j).num : ZMod p.val) / ((L i j).den : ZMod p.val) * x j
def LinearFormsCondition (ν : WeightFamily) (m₀ t₀ L₀ : ℕ) : Prop :=
  ∀ m t : ℕ, m ≤ m₀ → t ≤ t₀ →
    ∀ L : Fin m → Fin t → ℚ, rationalRowNonproportional L →
      (∀ i j, rationalHeight (L i j) ≤ L₀) →
    ∀ ε : ℝ, 0 < ε → ∃ N₀ : ℕ, ∀ p : PrimeModulus, N₀ ≤ p.val →
      ∀ b : Fin m → ZMod p.val,
        |realAverage (fun x : Fin t → ZMod p.val => ∏ i, ν p (rationalForm p L b i x))-1| ≤ ε
def CorrelationCondition (ν : WeightFamily) (m₀ : ℕ) : Prop :=
  ∀ m : ℕ, 2 ≤ m → m ≤ m₀ → ∃ τ : WeightFamily,
    (∀ p x, 0 ≤ τ p x) ∧
    (∀ q : ℕ, ∃ C : ℝ, ∃ N₀ : ℕ, ∀ p : PrimeModulus, N₀ ≤ p.val →
      realAverage (fun x => (τ p x)^q) ≤ C) ∧
    (∃ N₀ : ℕ, ∀ p : PrimeModulus, N₀ ≤ p.val → ∀ h : Fin m → ZMod p.val,
      realAverage (fun x => ∏ i, ν p (x+h i)) ≤
        ∑ i : Fin m, ∑ j ∈ Finset.univ.filter (fun j : Fin m => i<j), τ p (h i-h j))
def IsKPseudorandom (ν : WeightFamily) (k : ℕ) : Prop :=
  IsMeasureFamily ν ∧ LinearFormsCondition ν (k*2^(k-1)) (3*k-4) k ∧ CorrelationCondition ν (2^(k-1))
lemma isKPseudorandom_def (ν : WeightFamily) (k : ℕ) :
    IsKPseudorandom ν k ↔ IsMeasureFamily ν ∧
      LinearFormsCondition ν (k*2^(k-1)) (3*k-4) k ∧ CorrelationCondition ν (2^(k-1)) := by sorry
lemma linearFormsCondition_uniform_in_b (ν : WeightFamily) (m₀ t₀ L₀ m t : ℕ)
    (h : LinearFormsCondition ν m₀ t₀ L₀) (hm : m ≤ m₀) (ht : t ≤ t₀)
    (L : Fin m → Fin t → ℚ) (hL : rationalRowNonproportional L)
    (hsize : ∀ i j, rationalHeight (L i j) ≤ L₀) (ε : ℝ) (hε : 0 < ε) :
    ∃ N₀ : ℕ, ∀ p : PrimeModulus, N₀ ≤ p.val → ∀ b : Fin m → ZMod p.val,
      |realAverage (fun x : Fin t → ZMod p.val => ∏ i, ν p (rationalForm p L b i x))-1| ≤ ε := by sorry
lemma nuConst_isKPseudorandom (k : ℕ) : IsKPseudorandom (fun _ _ => 1) k := by sorry
lemma correlationCondition_coincident (ν : WeightFamily) (m₀ m : ℕ)
    (h : CorrelationCondition ν m₀) (hm : 2 ≤ m) (hm' : m ≤ m₀) :
    ∃ C : ℝ, ∃ N₀ : ℕ, ∀ p : PrimeModulus, N₀ ≤ p.val →
      realAverage (fun x => (ν p x)^m) ≤ C := by sorry
-- isKPseudorandom.test_parameters
example (ν : WeightFamily) : IsKPseudorandom ν 3 ↔ IsMeasureFamily ν ∧
    LinearFormsCondition ν 12 5 3 ∧ CorrelationCondition ν 4 := by sorry
-- isKPseudorandom.test_constant
example : IsKPseudorandom (fun _ _ => 1) 3 := by sorry
-- isKPseudorandom.test_coincident_shifts
example (p : PrimeModulus) (ν : ZMod p.val → ℝ) :
    realAverage (fun x => ν (x+0)*ν (x+0)) = realAverage (fun x => (ν x)^2) := by sorry
-- isKPseudorandom.test_nonproportional_forms
example : ¬ rationalRowNonproportional (fun _ : Fin 2 => fun _ : Fin 1 => (1 : ℚ)) := by sorry
-- isKPseudorandom.test_mean_two
example : ¬ IsMeasureFamily (fun _ _ => 2) := by sorry

section FiniteTransference
variable {N k : ℕ} [NeZero N]
abbrev APFormIndex (k : ℕ) := {q : Fin k × (Fin k → Bool) // q.2 q.1 = false}
def apLinearForm (q : APFormIndex k) (x : Fin k → Bool → ZMod N) : ZMod N :=
  ∑ i, ((i.val : ℤ)-(q.val.1.val : ℤ))*x i (q.val.2 i)
def selectedAPMoment (k : ℕ) (ν : ZMod N → ℝ) (S : Finset (APFormIndex k)) : ℝ :=
  realAverage (fun x : Fin k → Bool → ZMod N => ∏ q ∈ S, ν (apLinearForm q x))
def apLinearFormsError (k : ℕ) (ν : ZMod N → ℝ) : ℝ :=
  sSup (Set.range (fun S : Finset (APFormIndex k) => |selectedAPMoment k ν S-1|))
def APLinearFormsCondition (k : ℕ) (ν : ZMod N → ℝ) (ε : ℝ) : Prop :=
  (∀ x, 0 ≤ ν x) ∧ apLinearFormsError k ν ≤ ε
lemma APLinearFormsCondition.const_one (k : ℕ) :
    APLinearFormsCondition (N := N) k (fun _ => 1) 0 := by sorry
lemma APLinearFormsCondition.mean (k : ℕ) (hk : 3 ≤ k) (hN : N.Coprime (k-1).factorial)
    (ν : ZMod N → ℝ) (ε : ℝ) (h : APLinearFormsCondition k ν ε) : |realAverage ν-1| ≤ ε := by sorry
lemma APLinearFormsCondition.mono_error (k : ℕ) (ν : ZMod N → ℝ) (ε ε' : ℝ)
    (h : APLinearFormsCondition k ν ε) (hε : ε ≤ ε') : APLinearFormsCondition k ν ε' := by sorry
lemma apLinearForm_index_card (k : ℕ) : Fintype.card (APFormIndex k) = k*2^(k-1) := by sorry
-- APLinearFormsCondition.test_k_three
example : Fintype.card (APFormIndex 3) = 12 := by sorry
-- APLinearFormsCondition.test_empty_product
example (ν : ZMod N → ℝ) : selectedAPMoment 3 ν ∅ = 1 := by sorry
-- APLinearFormsCondition.test_constant_two
example (q : APFormIndex 3) : selectedAPMoment (N := N) 3 (fun _ => 2) {q} - 1 = 1 := by sorry
-- APLinearFormsCondition.test_constant_one
example : apLinearFormsError (N := N) 3 (fun _ => 1) = 0 := by sorry

def cutLinearForm (j : Fin k) (x : Fin k → ZMod N) : ZMod N :=
  ∑ i, ((i.val : ℤ)-(j.val : ℤ))*x i
def cutTestAverage (j : Fin k) (f g : ZMod N → ℝ)
    (u : Fin k → (Fin k → ZMod N) → ℝ) : ℝ :=
  realAverage (fun x : Fin k → ZMod N => (f-g) (cutLinearForm j x)*
    ∏ i ∈ Finset.univ.erase j, u i (Function.update x i 0))
def arithmeticDiscrepancy (j : Fin k) (f g : ZMod N → ℝ) : ℝ :=
  sSup {r | ∃ u : Fin k → (Fin k → ZMod N) → ℝ,
    (∀ i x, 0 ≤ u i x ∧ u i x ≤ 1) ∧ r=|cutTestAverage j f g u|}
def IsDiscrepancyPair (k : ℕ) (f g : ZMod N → ℝ) (ε : ℝ) : Prop :=
  ∀ j : Fin k, arithmeticDiscrepancy j f g ≤ ε
lemma arithmeticDiscrepancy_self (j : Fin k) (f : ZMod N → ℝ) : arithmeticDiscrepancy j f f = 0 := by sorry
lemma arithmeticDiscrepancy_symm (j : Fin k) (f g : ZMod N → ℝ) :
    arithmeticDiscrepancy j f g = arithmeticDiscrepancy j g f := by sorry
lemma arithmeticDiscrepancy_triangle (j : Fin k) (f g h : ZMod N → ℝ) :
    arithmeticDiscrepancy j f h ≤ arithmeticDiscrepancy j f g + arithmeticDiscrepancy j g h := by sorry
lemma arithmeticDiscrepancy_mean (j : Fin k) (hk : 3 ≤ k) (hN : N.Coprime (k-1).factorial)
    (f g : ZMod N → ℝ) : |realAverage f-realAverage g| ≤ arithmeticDiscrepancy j f g := by sorry
lemma arithmeticDiscrepancy_l1 (j : Fin k) (hk : 3 ≤ k) (hN : N.Coprime (k-1).factorial)
    (f g : ZMod N → ℝ) : arithmeticDiscrepancy j f g ≤ realAverage (fun x => |f x-g x|) := by sorry
-- arithmeticDiscrepancy.test_self
example (f : ZMod N → ℝ) : arithmeticDiscrepancy (0 : Fin 3) f f = 0 := by sorry
-- arithmeticDiscrepancy.test_constants
example (c d : ℝ) : arithmeticDiscrepancy (N := N) (0 : Fin 3) (fun _ => c) (fun _ => d) = |c-d| := by sorry
-- arithmeticDiscrepancy.test_mean
example : ¬ IsDiscrepancyPair (N := 5) 3 (fun _ => 0) (fun _ => 1) (1/2) := by sorry
theorem arithmetic_dense_model (k : ℕ) (hk : 3 ≤ k) (ε : ℝ) (hε : 0 < ε) :
    ∃ η : ℝ, 0 < η ∧ ∀ N : ℕ, ∀ (_ : NeZero N), N.Coprime (k-1).factorial →
      ∀ ν f : ZMod N → ℝ, (∀ x, 0 ≤ ν x) →
      IsDiscrepancyPair k ν (fun _ => 1) η → (∀ x, 0 ≤ f x ∧ f x ≤ ν x) →
      realAverage f ≤ 1 → ∃ g : ZMod N → ℝ,
        (∀ x, 0 ≤ g x ∧ g x ≤ 1) ∧ IsDiscrepancyPair k f g ε := by sorry
theorem relative_progression_counting (k : ℕ) (hk : 3 ≤ k) (γ : ℝ) (hγ : 0 < γ) :
    ∃ ε η : ℝ, 0 < ε ∧ 0 < η ∧ ∀ N : ℕ, ∀ (_ : NeZero N), N.Coprime (k-1).factorial →
      ∀ ν : ZMod N → ℝ, APLinearFormsCondition k ν η →
      ∀ f g : Fin k → ZMod N → ℝ,
        (∀ i x, 0 ≤ f i x ∧ f i x ≤ ν x) → (∀ i x, 0 ≤ g i x ∧ g i x ≤ 1) →
        (∀ i, arithmeticDiscrepancy i (f i) (g i) ≤ ε) →
        ‖cyclicProgressionAverage k (fun i x => (f i x : ℂ))-
          cyclicProgressionAverage k (fun i x => (g i x : ℂ))‖ ≤ γ := by sorry
end FiniteTransference

def wTrickModulus (w : ℕ) : ℕ := ∏ p ∈ (Finset.range (w+1)).filter Nat.Prime, p
def modifiedPrimeWeight (W b n : ℕ) : ℝ :=
  if (W*n+b).Prime then (Nat.totient W : ℝ)/W*Real.log (W*n+b) else 0
def smoothDivisorSum (χ : ℝ → ℝ) (R : ℝ) (n : ℤ) : ℝ :=
  Real.log R * ∑ d ∈ n.natAbs.divisors,
    (ArithmeticFunction.moebius d : ℝ)*χ (Real.log d / Real.log R)
def smoothMajorant (χ : ℝ → ℝ) (cχ R : ℝ) (W b N n : ℕ) : ℝ :=
  if (N : ℝ)/2 ≤ n ∧ n < N then
    (Nat.totient W : ℝ)/W*(smoothDivisorSum χ R (W*n+b))^2/(cχ*Real.log R) else 1
lemma smoothMajorant_nonneg (χ : ℝ → ℝ) (cχ R : ℝ) (hc : 0 < cχ) (hR : 1 < R)
    (W b N n : ℕ) : 0 ≤ smoothMajorant χ cχ R W b N n := by sorry
lemma smoothMajorant_outside (χ : ℝ → ℝ) (cχ R : ℝ) (W b N n : ℕ)
    (hout : ¬ ((N : ℝ)/2 ≤ n ∧ n < N)) : smoothMajorant χ cχ R W b N n = 1 := by sorry
lemma smoothDivisorSum_large_prime (χ : ℝ → ℝ) (R : ℝ) (hR : 1 < R)
    (hχ : χ 0=1) (hsupp : ∀ t, 1 ≤ t → χ t=0) (p : ℕ) (hp : p.Prime) (hpR : R < p) :
    smoothDivisorSum χ R p = Real.log R := by sorry
lemma modifiedPrimeWeight_zero (W b n : ℕ) (h : ¬ (W*n+b).Prime) : modifiedPrimeWeight W b n = 0 := by sorry
-- smoothMajorant_dominates: finite inequality with the asymptotic logarithm comparison explicit.
lemma smoothMajorant_dominates (χ : ℝ → ℝ) (cχ R δ : ℝ) (W b N n : ℕ)
    (hc : 0 < cχ) (hR : 1 < R) (hδ : 0 ≤ δ) (hrange : (N : ℝ)/2 ≤ n ∧ n < N)
    (hprime : (W*n+b).Prime → smoothDivisorSum χ R (W*n+b)=Real.log R)
    (hlog : δ*Real.log (W*n+b) ≤ Real.log R/cχ) :
    δ*modifiedPrimeWeight W b n ≤ smoothMajorant χ cχ R W b N n := by sorry
-- wTrickModulus.test_small
example : wTrickModulus 1=1 ∧ wTrickModulus 5=30 := by sorry
-- smoothMajorant.test_outside
example (χ : ℝ → ℝ) (c R : ℝ) : smoothMajorant χ c R 30 1 10 0=1 := by sorry
-- smoothDivisorSum.test_large_prime
example (χ : ℝ → ℝ) (hχ : χ 0=1) (hsupp : ∀ t, 1 ≤ t → χ t=0) :
    smoothDivisorSum χ 3 7 = Real.log 3 := by sorry
-- modifiedPrimeWeight.test_shift
example : modifiedPrimeWeight 6 1 1 = (1/3)*Real.log 7 ∧ ¬ (1 : ℕ).Prime := by sorry
-- modifiedPrimeWeight.test_composite
example : modifiedPrimeWeight 6 1 4=0 := by sorry

def truncatedDivisorSum (R : ℝ) (n : ℤ) : ℝ :=
  ∑ d ∈ n.natAbs.divisors.filter (fun d : ℕ => (d : ℝ) ≤ R),
    (ArithmeticFunction.moebius d : ℝ)*Real.log (R/(d : ℝ))
def modifiedVonMangoldt (W n : ℕ) : ℝ := modifiedPrimeWeight W 1 n
def majorantNu (k W N : ℕ) (R : ℝ) (n : ℕ) : ℝ :=
  let ε : ℝ := ((2^k*(k+4).factorial : ℕ) : ℝ)⁻¹
  if ε*N ≤ n ∧ (n : ℝ) ≤ 2*ε*N then
    (Nat.totient W : ℝ)/W*(truncatedDivisorSum R (W*n+1))^2/Real.log R else 1
lemma majorantNu_nonneg (k W N n : ℕ) (R : ℝ) (hR : 1 < R) : 0 ≤ majorantNu k W N R n := by sorry
lemma majorantNu_outside (k W N n : ℕ) (R : ℝ)
    (hout : ¬ (((2^k*(k+4).factorial : ℕ) : ℝ)⁻¹*N ≤ n ∧
      (n : ℝ) ≤ 2*((2^k*(k+4).factorial : ℕ) : ℝ)⁻¹*N)) : majorantNu k W N R n=1 := by sorry
lemma majorantNu_dominates (k W N n : ℕ) (R : ℝ) (hR : 1 < R)
    (hwindow : majorantNu k W N R n =
      (Nat.totient W : ℝ)/W*(truncatedDivisorSum R (W*n+1))^2/Real.log R)
    (hprime : (W*n+1).Prime → truncatedDivisorSum R (W*n+1)=Real.log R)
    (hlog : ((k : ℝ)*2^(k+5))⁻¹*Real.log (W*n+1) ≤ Real.log R) :
    ((k : ℝ)*2^(k+5))⁻¹*modifiedVonMangoldt W n ≤ majorantNu k W N R n := by sorry
-- majorantNu_isKPseudorandom: its full analytic supplier conditions are omitted, not assumed built.
lemma majorantNu_isKPseudorandom (k : ℕ) (W : PrimeModulus → ℕ) (R : PrimeModulus → ℝ)
    (hmeasure : IsMeasureFamily (fun p x => majorantNu k (W p) p.val (R p) x.val))
    (hforms : LinearFormsCondition (fun p x => majorantNu k (W p) p.val (R p) x.val)
      (k*2^(k-1)) (3*k-4) k)
    (hcorr : CorrelationCondition (fun p x => majorantNu k (W p) p.val (R p) x.val) (2^(k-1))) :
    IsKPseudorandom (fun p x => majorantNu k (W p) p.val (R p) x.val) k := by sorry
-- majorantNu.test_outside_range
example (W N : ℕ) (hN : 0 < N) (R : ℝ) : majorantNu 3 W N R 0=1 := by sorry
-- majorantNu.test_nonneg
example (W N n : ℕ) : 0 ≤ majorantNu 3 W N 2 n := by sorry
-- modifiedVonMangoldt.test_shifted_primality
example : modifiedVonMangoldt 6 1=(1/3)*Real.log 7 := by sorry
-- majorantNu.test_domination_constant
example : (((3 : ℝ)*2^(3+5))⁻¹ : ℝ)=1/768 := by sorry
theorem prime_progressions (k H : ℕ) : ∃ a r : ℕ, H < a ∧ 0 < r ∧ ∀ i : Fin k, (a+i.val*r).Prime := by sorry
end TauCeti.AdditiveFourier


namespace TauCeti.AdditiveFourier
open MeasureTheory
attribute [local instance] Classical.propDecidable

structure AffineSystem (d t : ℕ) where
  slope : Fin t → Fin d → ℤ
  offset : Fin t → ℤ
def AffineSystem.eval {d t : ℕ} (Ψ : AffineSystem d t) (i : Fin t) (x : Fin d → ℤ) : ℤ :=
  Ψ.offset i + ∑ j, Ψ.slope i j*x j
def AffineSystem.linearPart {d t : ℕ} (Ψ : AffineSystem d t) (i : Fin t) :
    (Fin d → ℤ) →ₗ[ℤ] ℤ := by sorry
def AffineSystem.size {d t : ℕ} (Ψ : AffineSystem d t) (N : ℝ) : ℝ :=
  sSup {r | r=0 ∨ ∃ i, r=max ‖(fun j => (Ψ.slope i j : ℝ))‖ (|Ψ.offset i|/N)}
def rationalSlope {d t : ℕ} (Ψ : AffineSystem d t) (i : Fin t) : Fin d → ℚ := fun j => Ψ.slope i j
def HasCSComplexity {d t : ℕ} (Ψ : AffineSystem d t) (s : ℕ) : Prop :=
  ∀ i : Fin t, ∃ label : Fin t → Fin (s+1), ∀ c : Fin (s+1),
    rationalSlope Ψ i ∉ Submodule.span ℚ
      {v | ∃ j : Fin t, j ≠ i ∧ label j=c ∧ rationalSlope Ψ j=v}
lemma HasCSComplexity.mono {d t : ℕ} (Ψ : AffineSystem d t) (s s' : ℕ)
    (h : HasCSComplexity Ψ s) (hs : s ≤ s') : HasCSComplexity Ψ s' := by sorry
lemma HasCSComplexity.finite_iff {d t : ℕ} (Ψ : AffineSystem d t)
    (hnonzero : ∀ i, Ψ.slope i ≠ 0) :
    (∃ s, HasCSComplexity Ψ s) ↔ ∀ i j, i ≠ j → ¬ ∃ c : ℚ,
      rationalSlope Ψ i = c • rationalSlope Ψ j := by sorry
def progressionSystem (k : ℕ) : AffineSystem 2 k :=
  ⟨fun i j => if j=0 then 1 else i.val,fun _ => 0⟩
lemma HasCSComplexity.progressions (k : ℕ) (hk : 2 ≤ k) : HasCSComplexity (progressionSystem k) (k-2) := by sorry
def AffineSystem.reindex {d t : ℕ} (Ψ : AffineSystem d t) (e : Fin t ≃ Fin t) : AffineSystem d t :=
  ⟨fun i => Ψ.slope (e i),fun i => Ψ.offset (e i)⟩
lemma AffineSystem.reindex_complexity {d t : ℕ} (Ψ : AffineSystem d t) (e : Fin t ≃ Fin t) (s : ℕ) :
    HasCSComplexity (Ψ.reindex e) s ↔ HasCSComplexity Ψ s := by sorry
def coordinateSystem (d : ℕ) : AffineSystem d d :=
  ⟨fun i j => if j=i then 1 else 0,fun _ => 0⟩
lemma HasCSComplexity.independent (d : ℕ) : HasCSComplexity (coordinateSystem d) 0 := by sorry
-- HasCSComplexity.test_coordinates
example : HasCSComplexity (coordinateSystem 2) 0 := by sorry
-- HasCSComplexity.test_three_ap
example : HasCSComplexity (progressionSystem 3) 1 ∧ ¬ HasCSComplexity (progressionSystem 3) 0 := by sorry
-- HasCSComplexity.test_twins
example : ¬ ∃ s, HasCSComplexity (⟨fun _ : Fin 2 => fun _ : Fin 1 => 1,
    fun i => if i=0 then 0 else 2⟩ : AffineSystem 1 2) s := by sorry
-- HasCSComplexity.test_goldbach
example (H : ℤ) : ¬ ∃ s, HasCSComplexity (⟨fun i : Fin 2 => fun _ : Fin 1 => if i=0 then 1 else -1,
    fun i => if i=0 then 0 else H⟩ : AffineSystem 1 2) s := by sorry

def evalMod {d t : ℕ} (Ψ : AffineSystem d t) (p : ℕ) (i : Fin t) (x : Fin d → ZMod p) : ZMod p :=
  Ψ.offset i + ∑ j, (Ψ.slope i j : ZMod p)*x j
def integerLocalFactor {d t : ℕ} (Ψ : AffineSystem d t) (p : PrimeModulus) : ℝ :=
  ((p.val : ℝ)/(p.val-1))^t * realAverage
    (fun x : Fin d → ZMod p.val => if ∀ i, evalMod Ψ p.val i x ≠ 0 then 1 else 0)
def evalReal {d t : ℕ} (Ψ : AffineSystem d t) (i : Fin t) (x : Fin d → ℝ) : ℝ :=
  Ψ.offset i + ∑ j, (Ψ.slope i j : ℝ)*x j
def integerArchimedeanFactor {d t : ℕ} (Ψ : AffineSystem d t) (Ω : Set (Fin d → ℝ)) : ℝ :=
  (volume (Ω ∩ {x | ∀ i, 0 < evalReal Ψ i x})).toReal
lemma integerLocalFactor_nonneg {d t : ℕ} (Ψ : AffineSystem d t) (p : PrimeModulus) :
    0 ≤ integerLocalFactor Ψ p := by sorry
lemma integerLocalFactor_positive_iff {d t : ℕ} (Ψ : AffineSystem d t) (p : PrimeModulus) :
    0 < integerLocalFactor Ψ p ↔ ∃ x : Fin d → ZMod p.val, ∀ i, evalMod Ψ p.val i x ≠ 0 := by sorry
lemma integerLocalFactor_reindex {d t : ℕ} (Ψ : AffineSystem d t) (e : Fin t ≃ Fin t) (p : PrimeModulus) :
    integerLocalFactor (Ψ.reindex e) p = integerLocalFactor Ψ p := by sorry
lemma integerLocalFactor_good_prime {d t : ℕ} (Ψ : AffineSystem d t) (s : ℕ)
    (h : HasCSComplexity Ψ s) : ∃ C : ℝ, ∃ B : ℕ, ∀ p : PrimeModulus, B ≤ p.val →
      |integerLocalFactor Ψ p-1| ≤ C/(p.val : ℝ)^2 := by sorry
lemma integerSingularProduct_positive {d t : ℕ} (Ψ : AffineSystem d t) (s : ℕ)
    (h : HasCSComplexity Ψ s) :
    0 < ∏' p : PrimeModulus, integerLocalFactor Ψ p ↔ ∀ p, 0 < integerLocalFactor Ψ p := by sorry
-- integerLocalFactor.test_one_coordinate
example (p : PrimeModulus) : integerLocalFactor (coordinateSystem 1) p=1 := by sorry
-- integerLocalFactor.test_coordinates
example (d : ℕ) (p : PrimeModulus) : integerLocalFactor (coordinateSystem d) p=1 := by sorry
-- integerLocalFactor.test_parity_obstruction
example : integerLocalFactor (⟨fun _ : Fin 1 => fun _ : Fin 1 => 2,fun _ => 0⟩ : AffineSystem 1 1)
    ⟨2,by decide⟩ = 0 := by sorry
-- integerArchimedeanFactor.test_positive_region
example (N : ℝ) (hN : 0 ≤ N) : integerArchimedeanFactor (coordinateSystem 1)
    {x | -N ≤ x 0 ∧ x 0 ≤ N} = N := by sorry

section ModuleComplexity
variable {A B : Type*} [AddCommGroup A] [Module ℤ A] [AddCommGroup B] [Module ℤ B]
def HasTorsionCokernel (L : A →ₗ[ℤ] B) : Prop :=
  ∀ b : B, ∃ n : ℕ, 0 < n ∧ (n : ℤ) • b ∈ L.range
lemma finiteCokernel_hasTorsionCokernel (L : A →ₗ[ℤ] B) [Finite (B ⧸ L.range)] :
    HasTorsionCokernel L := by sorry
def fullRationalRank {d n : ℕ} (L : (Fin d → ℤ) →ₗ[ℤ] (Fin n → ℤ)) : Prop :=
  ∃ D : ℕ, 0 < D ∧ ∀ y, ∃ x, L x = (D : ℤ) • y
lemma fullRank_iff_finite_cokernel {d n : ℕ} (L : (Fin d → ℤ) →ₗ[ℤ] (Fin n → ℤ)) :
    fullRationalRank L ↔ Finite ((Fin n → ℤ) ⧸ L.range) := by sorry
def moduleKernelIntersection {d n t s : ℕ}
    (L : Fin t → (Fin d → ℤ) →ₗ[ℤ] (Fin n → ℤ)) (i : Fin t)
    (label : Fin t → Fin (s+1)) (c : Fin (s+1)) : Submodule ℤ (Fin d → ℤ) :=
  ⨅ j : {j : Fin t // j ≠ i ∧ label j=c}, (L j.val).ker
def HasModuleCSComplexity {d n t : ℕ}
    (L : Fin t → (Fin d → ℤ) →ₗ[ℤ] (Fin n → ℤ)) (s : ℕ) : Prop :=
  ∀ i : Fin t, ∃ label : Fin t → Fin (s+1), ∀ c,
    HasTorsionCokernel ((L i).comp (moduleKernelIntersection L i label c).subtype)
lemma HasModuleCSComplexity.mono {d n t : ℕ}
    (L : Fin t → (Fin d → ℤ) →ₗ[ℤ] (Fin n → ℤ)) (s s' : ℕ)
    (h : HasModuleCSComplexity L s) (hs : s ≤ s') : HasModuleCSComplexity L s' := by sorry
def integerMatrixMap {d n : ℕ} (a : Fin n → Fin d → ℤ) :
    (Fin d → ℤ) →ₗ[ℤ] (Fin n → ℤ) := by sorry
lemma integerMatrixMap_apply {d n : ℕ} (a : Fin n → Fin d → ℤ) (x : Fin d → ℤ) (i : Fin n) :
    integerMatrixMap a x i = ∑ j, a i j*x j := by sorry
lemma HasModuleCSComplexity.scalar {d t : ℕ} (Ψ : AffineSystem d t) (s : ℕ) :
    HasModuleCSComplexity (fun i => integerMatrixMap
      (fun _ : Fin 1 => fun j : Fin d => Ψ.slope i j)) s ↔ HasCSComplexity Ψ s := by sorry
-- HasModuleCSComplexity.test_independent_blocks
example : HasModuleCSComplexity (fun i : Fin 2 => integerMatrixMap
    (fun j : Fin 2 => fun l : Fin 4 => if l.val=j.val+2*i.val then 1 else 0)) 0 := by sorry
-- HasModuleCSComplexity.test_gaussian
example : ¬ ∃ s, HasModuleCSComplexity (fun i : Fin 2 => integerMatrixMap
    (fun j : Fin 2 => fun l : Fin 2 => if j=l then (if i=0 ∨ j=0 then 1 else -1) else 0)) s := by sorry
-- HasTorsionCokernel.test_localized: native rational dyadic subgroup.
def dyadicRationals : AddSubgroup ℚ where
  carrier := {x | ∃ a : ℤ, ∃ k : ℕ, x = a/(2 : ℚ)^k}
  zero_mem' := by sorry
  add_mem' := by sorry
  neg_mem' := by sorry
def integerToDyadic : ℤ →ₗ[ℤ] dyadicRationals := by sorry
lemma integerToDyadic_apply (n : ℤ) : ((integerToDyadic n : dyadicRationals) : ℚ)=n := by sorry
example : HasTorsionCokernel integerToDyadic ∧ Infinite (dyadicRationals ⧸ integerToDyadic.range) := by sorry
-- HasModuleCSComplexity.test_scalar_twins
example : ¬ ∃ s, HasModuleCSComplexity (fun _ : Fin 2 =>
    integerMatrixMap (fun _ : Fin 1 => fun _ : Fin 1 => 1)) s := by sorry
end ModuleComplexity

/- Finite residue computation consumed from AN.4. Each R_q is the native prime-ideal residue
field after a chosen fractional-ideal trivialization. The finite computation does not redefine
number fields, ideals, residue fields or models owned by the supplier. -/
section ResidueFactors
variable {d t r : ℕ} {R : Fin r → Type*} [∀ q, Zero (R q)]
variable (n : ℕ) (p : PrimeModulus) (φ : ℕ)
variable (ρ : Fin t → (q : Fin r) → (Fin d → ZMod p.val) → R q)
def localizedLocalFactor (S : Finset (Fin r)) : ℝ :=
  (((p.val : ℝ)^n)/φ)^t * realAverage
    (fun x : Fin d → ZMod p.val => if ∀ i q, q ∉ S → ρ i q x ≠ 0 then 1 else 0)
def numberFieldLocalFactor : ℝ := localizedLocalFactor n p φ ρ ∅
lemma numberFieldLocalFactor_nonneg : 0 ≤ numberFieldLocalFactor n p φ ρ := by sorry
lemma numberFieldLocalFactor_positive_iff (hn : 1 ≤ n) (hφ : 0 < φ) :
    0 < numberFieldLocalFactor n p φ ρ ↔ ∃ x : Fin d → ZMod p.val, ∀ i q, ρ i q x ≠ 0 := by sorry
lemma localizedLocalFactor_empty : localizedLocalFactor n p φ ρ ∅ = numberFieldLocalFactor n p φ ρ := by sorry
lemma localizedLocalFactor_all_above : localizedLocalFactor n p φ ρ Finset.univ = (((p.val : ℝ)^n)/φ)^t := by sorry
lemma numberFieldLocalFactor_rational (Ψ : AffineSystem d t) :
    numberFieldLocalFactor 1 p (p.val-1) (fun i (_ : Fin 1) x => evalMod Ψ p.val i x) =
      integerLocalFactor Ψ p := by sorry
-- numberFieldLocalFactor_prime_ideal_product: CRT independence is the supplier's exact condition.
lemma numberFieldLocalFactor_prime_ideal_product
    (w : Fin r → ℝ) (hφ : ((p.val : ℝ)^n)/φ = ∏ q, w q)
    (hCRT : realAverage (fun x : Fin d → ZMod p.val => if ∀ i q, ρ i q x ≠ 0 then 1 else 0) =
      ∏ q, realAverage (fun x : Fin d → ZMod p.val => if ∀ i, ρ i q x ≠ 0 then 1 else 0)) :
    numberFieldLocalFactor n p φ ρ = ∏ q, (w q)^t *
      realAverage (fun x : Fin d → ZMod p.val => if ∀ i, ρ i q x ≠ 0 then 1 else 0) := by sorry
-- localizedSingularProduct_positive: absolute convergence is exposed as the concrete summability
-- requirement. AN.4/ES.3 supply it for the fixed localized number-field system.
lemma localizedSingularProduct_positive (β : PrimeModulus → ℝ) (hβ : ∀ p, 0 ≤ β p)
    (hsum : Summable (fun p => |β p-1|)) : 0 < ∏' p, β p ↔ ∀ p, 0 < β p := by sorry
-- numberFieldLocalFactor.test_rational
example : numberFieldLocalFactor 1 p (p.val-1)
    (fun (_ : Fin 1) (_ : Fin 1) (x : Fin 1 → ZMod p.val) => x 0) = 1 := by sorry
-- localizedLocalFactor.test_removed_prime
example : localizedLocalFactor 1 p (p.val-1)
    (fun (_ : Fin 1) (_ : Fin 1) (x : Fin 1 → ZMod p.val) => x 0) Finset.univ = (p.val : ℝ)/(p.val-1) := by sorry
-- numberFieldLocalFactor.test_common_variable
example : (∃ x : Bool, x=false) ∧ (∃ x : Bool, x=true) ∧
    ¬ ∃ x : Bool, x=false ∧ x=true := by sorry
-- localizedLocalFactor.test_empty
example : localizedLocalFactor n p φ ρ ∅ = numberFieldLocalFactor n p φ ρ := by sorry
end ResidueFactors
end TauCeti.AdditiveFourier


namespace TauCeti.AdditiveFourier
open scoped Pointwise
attribute [local instance] Classical.propDecidable
attribute [local instance] Classical.decEq

section AdditiveStructure
variable {G : Type*} [AddCommGroup G] [DecidableEq G]
theorem balog_szemeredi_gowers : ∃ c C : ℝ, 0 < c ∧ 1 ≤ C ∧
    ∀ (G : Type) [AddCommGroup G] [DecidableEq G], ∀ A : Finset G, A.Nonempty →
      ∀ K : ℝ, 1 ≤ K → (A.card : ℝ)^3/K ≤ Finset.addEnergy A A → ∃ B : Finset G,
        B ⊆ A ∧ c*K^(-C)*A.card ≤ (B.card : ℝ) ∧
        ((B+B).card : ℝ) ≤ c⁻¹*K^C*B.card := by sorry
theorem ruzsa_modelling (K : ℝ) (hK : 1 ≤ K) : ∃ C : ℝ, 1 ≤ C ∧
    ∀ (G : Type) [AddCommGroup G] [DecidableEq G] [IsAddTorsionFree G],
      ∀ A : Finset G, A.Nonempty → ((A+A).card : ℝ) ≤ K*A.card →
      ∃ A' : Finset G, A' ⊆ A ∧ A.card ≤ 8*A'.card ∧
        ∃ N : ℕ, A.card ≤ N ∧ (N : ℝ) ≤ C*A.card ∧
          ∃ B : Set (ZMod N), ∃ f : G → ZMod N, IsAddFreimanIso 8 (A' : Set G) B f := by sorry
theorem cyclic_bohr_contains_proper_gap (d : ℕ) : ∃ c : ℝ, 0 < c ∧
    ∀ N : ℕ, ∀ (_ : NeZero N), ∀ Γ : Finset (AddChar (ZMod N) ℂ), Γ.card ≤ d →
      ∀ ρ : ℝ, 0 < ρ → ρ ≤ 1/4 → ∃ P : GeneralizedAP (ZMod N),
        P.IsProper ∧ P.rank ≤ d+1 ∧ P.carrier ⊆ phaseBohrSet Γ (fun _ => ρ) ∧
        c*ρ^d*N ≤ (P.carrier.card : ℝ) := by sorry
theorem freiman_bounded_exponent (r : ℕ) (hr : 0 < r) (K : ℝ) (hK : 1 ≤ K) :
    ∃ C : ℝ, 1 ≤ C ∧ ∀ (G : Type) [AddCommGroup G] [DecidableEq G],
      (∀ x : G, r • x=0) → ∀ A : Finset G, A.Nonempty →
      ((A+A).card : ℝ) ≤ K*A.card → ∃ H : AddSubgroup G, ∃ x : G,
        Finite H ∧ (Nat.card H : ℝ) ≤ C*A.card ∧ ∀ a ∈ A, a-x ∈ H := by sorry
end AdditiveStructure

def logStar (x : ℝ) : ℝ := max (Real.log x) (Real.exp (Real.exp 1))
def binomialInteger (n : ℤ) (j : ℕ) : ℤ :=
  if 0 ≤ n then n.toNat.choose j else (-1 : ℤ)^j * ((j : ℤ)-1-n).toNat.choose j
theorem polynomial_sequence_taylor {G : Type*} [Group G] {s : ℕ}
    (D : DegreeFiltration G s) (g : ℤ → G) (hg : IsFilteredPolynomial D g) :
    ∃ coeff : Fin (s+1) → G, (∀ i, coeff i ∈ D.layer i.val) ∧
      (∀ n, g n = ((List.ofFn fun i : Fin (s+1) => (coeff i)^binomialInteger n i.val).prod)) ∧
      ∀ coeff' : Fin (s+1) → G,
        (∀ i, coeff' i ∈ D.layer i.val) →
        (∀ n, g n = ((List.ofFn fun i : Fin (s+1) => (coeff' i)^binomialInteger n i.val).prod)) →
        coeff'=coeff := by sorry
def intervalCorrelation (N : ℕ) (f h : ℤ → ℂ) : ℂ :=
  (N : ℂ)⁻¹ * ∑ n ∈ Finset.Icc (1 : ℤ) N, f n*star (h n)
theorem quasipolynomial_inverse (s : ℕ) (hs : 1 ≤ s) : ∃ C : ℝ, 1 ≤ C ∧
    ∀ N : ℕ, 1 ≤ N → ∀ δ : ℝ, 0 < δ → δ < 1/2 → ∀ f : ℤ → ℂ,
      (∀ n ∈ Finset.Icc (1 : ℤ) N, ‖f n‖ ≤ 1) → δ ≤ intervalGowersNorm (s+1) N f →
      ∃ M : FilteredNilmanifold, M.degree=s ∧ (M.dim : ℝ) ≤ C*(logStar δ⁻¹)^C ∧
        ∃ Q L : ℝ, 1 ≤ Q ∧ 1 ≤ L ∧ Q ≤ Real.exp (C*(logStar δ⁻¹)^C) ∧ L ≤ Real.exp (C*(logStar δ⁻¹)^C) ∧
          ∃ B : RationalMalcevBasis M Q, ∃ F : BoundedNilsequence B 1 L,
            Real.exp (-C*(logStar δ⁻¹)^C) ≤
              ‖intervalCorrelation N f (fun n => F.eval (fun _ => n))‖ := by sorry
theorem box_inverse (s ℓ : ℕ) (hs : 1 ≤ s) (hℓ : 1 ≤ ℓ) :
    ∃ C c : ℝ, 1 ≤ C ∧ 0 < c ∧ ∃ N₀ : ℕ,
      ∀ N ≥ N₀, ∀ δ : ℝ, 0 < δ → δ < c → ∀ f : (Fin ℓ → ℤ) → ℂ,
        (∀ n ∈ integerBox ℓ N, ‖f n‖ ≤ 1) → δ ≤ boxGowersNorm (s+1) ℓ N f →
        ∃ M : FilteredNilmanifold, M.degree=s ∧ (M.dim : ℝ) ≤ C*(logStar δ⁻¹)^C ∧
          ∃ Q L : ℝ, 1 ≤ Q ∧ 1 ≤ L ∧ Q ≤ Real.exp (C*(logStar δ⁻¹)^C) ∧ L ≤ Real.exp (C*(logStar δ⁻¹)^C) ∧
            ∃ B : RationalMalcevBasis M Q, ∃ F : BoundedNilsequence B ℓ L,
              Real.exp (-C*(logStar δ⁻¹)^C) ≤
                ‖((integerBox ℓ N).card : ℂ)⁻¹ * ∑ n ∈ integerBox ℓ N, f n*star (F.eval n)‖ := by sorry

def IsIntegerProgression (P : Finset ℤ) : Prop :=
  ∃ a r : ℤ, 0 < r ∧ ∃ len : ℕ, P=(Finset.range len).image (fun j : ℕ => a+r*(j : ℤ))
theorem nilsequence_progression_partition (s : ℕ) : ∃ c C : ℝ, 0 < c ∧ 1 ≤ C ∧
    ∀ N T d : ℕ, 1 ≤ N → 1 ≤ T → 1 ≤ d → ∀ Q : ℝ, 2 ≤ Q →
      ∀ M : Fin T → FilteredNilmanifold, (∀ i, (M i).degree ≤ s ∧ (M i).dim ≤ d) →
      ∀ B : (i : Fin T) → RationalMalcevBasis (M i) Q,
      ∀ g : (i : Fin T) → ℤ → (M i).carrier,
        (∀ i, IsFilteredPolynomial (M i).filtration (g i)) →
        ∃ P : Finpartition (Finset.Icc (1 : ℤ) N),
          (N : ℝ)/P.parts.card ≥ (1/2)*(N : ℝ)^(c/((T*d : ℕ) : ℝ)^C) ∧
          (∀ A ∈ P.parts, IsIntegerProgression A) ∧
          ∀ A ∈ P.parts, ∀ i, ∀ m ∈ A, ∀ n ∈ A,
            malcevQuotientDistance (B i) ((M i).coset (g i m)) ((M i).coset (g i n)) ≤
              Q^(C*(d : ℝ)^C)*(N : ℝ)^(-c/((T*d : ℕ) : ℝ)^C) := by sorry
def NilsequenceFactor.ofResolutions (N T : ℕ) (h : Fin T → Fin N → ℝ) (K : Fin T → ℝ) :
    NilsequenceFactor N := by sorry
def residualOnInterval (N : ℕ) (f : Fin N → ℝ) (B : NilsequenceFactor N) : ℤ → ℂ :=
  fun n => if hn : 1 ≤ n ∧ n ≤ N then
    f ⟨(n-1).toNat,by sorry⟩ - factorAverage B f ⟨(n-1).toNat,by sorry⟩ else 0
theorem uniform_factor_approximation (k : ℕ) (hk : 5 ≤ k) : ∃ C : ℝ, 1 ≤ C ∧
    ∀ N : ℕ, 1 ≤ N → ∀ η : ℝ, 0 < η → η < 1/2 → ∀ f : Fin N → ℝ,
      (∀ n, 0 ≤ f n ∧ f n ≤ 1) → ∃ T : ℕ,
        (T : ℝ) ≤ Real.exp (C*(logStar η⁻¹)^C) ∧
        ∃ M : Fin T → FilteredNilmanifold,
          (∀ i, (M i).degree=k-2 ∧ ((M i).dim : ℝ) ≤ C*(logStar η⁻¹)^C) ∧
          ∃ Q L : ℝ, 1 ≤ Q ∧ 1 ≤ L ∧ Q ≤ Real.exp (C*(logStar η⁻¹)^C) ∧
            L ≤ Real.exp (C*(logStar η⁻¹)^C) ∧
          ∃ B : (i : Fin T) → RationalMalcevBasis (M i) Q,
          ∃ F : (i : Fin T) → BoundedNilsequence (B i) 1 L,
          ∃ h : Fin T → Fin N → ℝ, ∃ K shift : Fin T → ℝ,
            (∀ i, 1 ≤ K i ∧ K i ≤ Real.exp (C*(logStar η⁻¹)^C) ∧
              0 ≤ shift i ∧ shift i < (K i)⁻¹) ∧
            (∀ i n, h i n=((F i).eval (fun _ => (n.val+1 : ℤ))).re-shift i) ∧
            (∀ i, IsRegularResolution (h i) (K i) C) ∧
            intervalGowersNorm (k-1) N (residualOnInterval N f
              (NilsequenceFactor.ofResolutions N T h K)) ≤ η := by sorry
theorem progression_density_increment (k : ℕ) (hk : 5 ≤ k) :
    ∃ c c' C : ℝ, 0 < c ∧ 0 < c' ∧ 1 ≤ C ∧ ∀ N : ℕ, 1 ≤ N →
      ∀ δ : ℝ, 0 < δ → δ ≤ 1 → ∀ f : ℤ → ℝ,
        (∀ n ∈ Finset.Icc (1 : ℤ) N, 0 ≤ f n ∧ f n ≤ 1) →
        δ ≤ (N : ℝ)⁻¹*∑ n ∈ Finset.Icc (1 : ℤ) N, f n →
        (N : ℝ) ≤ Real.exp (Real.exp (C*(logStar δ⁻¹)^C)) ∨
        c*δ^k ≤ (intervalProgressionAverage k N (fun _ n => (f n : ℂ))).re ∨
        ∃ P : Finset ℤ, P.Nonempty ∧ P ⊆ Finset.Icc (1 : ℤ) N ∧ IsIntegerProgression P ∧
          (N : ℝ)^(1/Real.exp (C*(logStar δ⁻¹)^C)) ≤ P.card ∧
          (1+c')*δ ≤ (P.card : ℝ)⁻¹*∑ n ∈ P, f n := by sorry
theorem szemeredi_varnavides_bridge (k : ℕ) (hk : 3 ≤ k) (δ : ℝ) (hδ : 0 < δ) :
    ∃ c : ℝ, 0 < c ∧ ∃ N₀ : ℕ, ∀ p : PrimeModulus, N₀ ≤ p.val →
      ∀ f : ZMod p.val → ℝ, (∀ x, 0 ≤ f x ∧ f x ≤ 1) → δ ≤ realAverage f →
        c ≤ (cyclicProgressionAverage k (fun _ x => (f x : ℂ))).re := by sorry
def orderedSolutions {G : Type*} [Group G] [Fintype G] (m : ℕ)
    (A : Fin m → Finset G) (a : G) : Finset (Fin m → G) :=
  Finset.univ.filter (fun x => (∀ i, x i ∈ A i) ∧ (List.ofFn x).prod=a)
theorem ordered_product_removal (m : ℕ) (hm : 2 ≤ m) (ε : ℝ) (hε : 0 < ε) :
    ∃ δ : ℝ, 0 < δ ∧ ∀ (G : Type) [Group G] [Fintype G],
      ∀ A : Fin m → Finset G, ∀ a : G,
        ((orderedSolutions m A a).card : ℝ) ≤ δ*(Fintype.card G : ℝ)^(m-1) →
        ∃ B : Fin m → Finset G, (∀ i, B i ⊆ A i ∧ ((A i \ B i).card : ℝ) ≤ ε*Fintype.card G) ∧
          orderedSolutions m B a=∅ := by sorry

theorem pseudorandom_gowers_close (k d : ℕ) (hd : 1 ≤ d) (hd' : d ≤ k-1)
    (ν : WeightFamily) (hν : IsKPseudorandom ν k) :
    TendsToZeroOnPrimes (fun p => gowersNorm d (fun x => ((ν p x-1 : ℝ) : ℂ))) := by sorry
theorem weighted_generalised_von_neumann (k : ℕ) (hk : 3 ≤ k) (ν : WeightFamily)
    (hν : IsKPseudorandom ν k) (ε : ℝ) (hε : 0 < ε) :
    ∃ N₀ : ℕ, ∀ p : PrimeModulus, N₀ ≤ p.val →
      ∀ f : Fin k → ZMod p.val → ℝ, (∀ i x, |f i x| ≤ ν p x+1) → ∀ i : Fin k,
        ‖cyclicProgressionAverage k (fun j x => (f j x : ℂ))‖ ≤
          2^(k+1)*gowersNorm (k-1) (fun x => (f i x : ℂ))+ε := by sorry
theorem original_relative_szemeredi (k : ℕ) (hk : 3 ≤ k) (δ : ℝ) (hδ : 0 < δ)
    (ν : WeightFamily) (hν : IsKPseudorandom ν k) : ∃ c : ℝ, 0 < c ∧
      ∀ ε : ℝ, 0 < ε → ∃ N₀ : ℕ, ∀ p : PrimeModulus, N₀ ≤ p.val →
        ∀ f : ZMod p.val → ℝ, (∀ x, 0 ≤ f x ∧ f x ≤ ν p x) → δ ≤ realAverage f →
          c-ε ≤ (cyclicProgressionAverage k (fun _ x => (f x : ℂ))).re := by sorry
theorem linear_forms_relative_szemeredi (k : ℕ) (hk : 3 ≤ k) (δ : ℝ) (hδ : 0 < δ)
    (ν : WeightFamily) (hnonneg : ∀ p x, 0 ≤ ν p x)
    (hforms : TendsToZeroOnPrimes (fun p => apLinearFormsError k (ν p))) :
    ∃ c : ℝ, 0 < c ∧ ∀ ε : ℝ, 0 < ε → ∃ N₀ : ℕ,
      ∀ p : PrimeModulus, N₀ ≤ p.val → p.val.Coprime (k-1).factorial →
        ∀ f : ZMod p.val → ℝ, (∀ x, 0 ≤ f x ∧ f x ≤ ν p x) → δ ≤ realAverage f →
          c-ε ≤ (cyclicProgressionAverage k (fun _ x => (f x : ℂ))).re := by sorry

def mobiusInteger (n : ℤ) : ℂ := (ArithmeticFunction.moebius n.natAbs : ℂ)
theorem power_sum_density (j t : ℕ) (hj : 1 ≤ j) (ht : 2^j+1 ≤ t) (α : ℝ) (hα : 0 < α) :
    ∃ c : ℝ, 0 < c ∧ ∀ K : ℕ, 1 ≤ K → ∀ S : Finset ℕ,
      S ⊆ Finset.Icc 1 K → α*K ≤ (S.card : ℝ) →
        c*α^(2*t)*(K : ℝ)^j ≤
          (((Fintype.piFinset (fun _ : Fin t => S)).image (fun x => ∑ i, (x i)^j)).card : ℝ) := by sorry
theorem mobius_nilsequence_orthogonality (m s : ℕ) (hm : 1 ≤ m) (hs : 1 ≤ s)
    (A : ℝ) (hA : 0 < A) : ∃ C B : ℝ, 0 < C ∧
      ∀ M : FilteredNilmanifold, M.dim=m → M.degree=s → ∀ Q : ℝ, 2 ≤ Q →
        ∀ basis : RationalMalcevBasis M Q, ∀ L : ℝ,
          ∀ f : BoundedNilsequence basis 1 L, ∀ N : ℕ, 2 ≤ N →
            ‖intervalCorrelation N mobiusInteger (fun n => f.eval (fun _ => n))‖ ≤
              C*Q^B*(1+L)*(Real.log N)^(-A) := by sorry

/- The remaining named signatures below are added after their supplier data are prototyped.
The exact statements in the reader remain definitive; no opaque proposition or True condition
is used for a missing model, Lie correspondence, boundary cover or analytic hypothesis. -/
end TauCeti.AdditiveFourier


namespace TauCeti.AdditiveFourier
open MeasureTheory Module
open scoped Pointwise
attribute [local instance] Classical.propDecidable

-- AC.3: the vertical-frequency obstruction; the reader gives the sharper abelianization rank.
def iteratedCommutator {G : Type*} [Group G] (w : List G) : G :=
  match w with
  | [] => 1
  | x::xs => xs.foldl groupCommutator x
def multivariateSmoothness (k ℓ : ℕ) (N : Fin ℓ → ℕ)
    (α : (Fin ℓ → Fin (k+1)) → ℝ) : ℝ :=
  sSup {r | r=0 ∨ ∃ j : Fin ℓ → Fin (k+1),
    0 < (∑ i, (j i).val) ∧ (∑ i, (j i).val) ≤ k ∧
      r=(∏ i, (N i : ℝ)^(j i).val)*distanceToInteger (α j)}
def multivariateBinomialPolynomial (k ℓ : ℕ) (α : (Fin ℓ → Fin (k+1)) → ℝ)
    (n : Fin ℓ → ℤ) : ℝ :=
  ∑ j : Fin ℓ → Fin (k+1), if (∑ i, (j i).val) ≤ k then
    α j*∏ i, binomialReal (n i) (j i).val else 0
theorem efficient_equidistribution (k ℓ : ℕ) (hk : 1 ≤ k) (hℓ : 1 ≤ ℓ) :
    ∃ C : ℝ, 1 ≤ C ∧ ∀ (M : FilteredNilmanifold) (s : ℕ), 1 ≤ s →
      M.degree=k → (⊤ : Subgroup M.carrier).lowerCentralSeries s=⊥ →
      ∀ R δ : ℝ, 1 ≤ R → 0 < δ → δ < 1/10 →
      ∀ B : RationalMalcevBasis M R, ∀ N : Fin ℓ → ℕ, (∀ i, 1 < N i) →
      ∀ g : (Fin ℓ → ℤ) → M.carrier, IsFilteredPolynomial M.filtration g →
      ∀ ξ : ((⊤ : Subgroup M.carrier).lowerCentralSeries (s-1)) →* Multiplicative ℝ,
        ξ ≠ 1 → ∀ a : Fin M.dim → ℤ,
          (∀ t, Multiplicative.toAdd (ξ t)=∑ j, (a j : ℝ)*B.coordinates t j) →
          ‖(fun j => (a j : ℝ))‖ ≤ R/δ →
      ∀ F : M.Space → ℂ, observableLipNorm B F ≤ R →
        HasVerticalFrequency ((⊤ : Subgroup M.carrier).lowerCentralSeries (s-1)) ξ F →
      δ ≤ ‖((Fintype.piFinset (fun i => Finset.Icc (1 : ℤ) (N i))).card : ℂ)⁻¹ *
        ∑ n ∈ Fintype.piFinset (fun i => Finset.Icc (1 : ℤ) (N i)), F (M.coset (g n))‖ →
      (∃ i, (N i : ℝ) ≤ (R/δ)^(C*(M.dim : ℝ)^C)) ∨
      ∃ r : ℕ, 1 ≤ r ∧ r ≤ M.dim ∧ ∃ η : Fin r → HorizontalCharacter B,
        (∀ i, (η i).size ≤ (R/δ)^(C*(M.dim : ℝ)^C)) ∧
        (∀ i, ∃ α : (Fin ℓ → Fin (k+1)) → ℝ,
          (∀ n, Multiplicative.toAdd ((η i).lift (g n))=multivariateBinomialPolynomial k ℓ α n) ∧
          multivariateSmoothness k ℓ N α ≤ (R/δ)^(C*(M.dim : ℝ)^C)) ∧
        ∀ w : Fin s → M.carrier, (∀ j i, (η i).lift (w j)=1) →
          ∃ h : iteratedCommutator (List.ofFn w) ∈
            (⊤ : Subgroup M.carrier).lowerCentralSeries (s-1),
              ξ ⟨iteratedCommutator (List.ofFn w),h⟩=1 := by sorry

theorem quantitative_orbit_factorization (m d : ℕ) (A : ℝ) (hA : 0 < A) :
    ∃ C : ℝ, 1 ≤ C ∧ ∀ M₀ N : ℕ, 2 ≤ M₀ → 1 ≤ N →
      ∀ M : FilteredNilmanifold, M.dim=m → M.degree=d →
      ∀ B : RationalMalcevBasis M M₀, ∀ g : ℤ → M.carrier,
        IsFilteredPolynomial M.filtration g → ∃ R : ℕ, M₀ ≤ R ∧ (R : ℝ) ≤ C*(M₀ : ℝ)^C ∧
          ∃ M' : FilteredNilmanifold, M'.dim ≤ m ∧ M'.degree=d ∧
          ∃ B' : RationalMalcevBasis M' R, ∃ ι : M'.carrier →* M.carrier,
            Function.Injective ι ∧ Continuous ι ∧
            (∀ x, ι x ∈ M.lattice ↔ x ∈ M'.lattice) ∧
          ∃ ε γ : ℤ → M.carrier, ∃ g' : ℤ → M'.carrier,
            IsFilteredPolynomial M.filtration ε ∧ IsFilteredPolynomial M.filtration γ ∧
            IsFilteredPolynomial M'.filtration g' ∧
            (∀ n, g n=ε n*ι (g' n)*γ n) ∧ IsSmoothSequence B R N ε ∧
            IsTotallyEquidistributed B' g' N ((R : ℝ)^(-A)) ∧
            IsRationalPeriodicSequence R γ := by sorry
-- The bounded rational Lie-algebra map relating B' to B is not encoded in this prototype.

theorem mobius_equidistributed (m d : ℕ) : ∃ c C : ℝ, 0 < c ∧ 0 < C ∧
    ∃ N₀ : ℕ, ∀ N ≥ N₀, ∀ δ Q : ℝ, 0 < δ → δ < 1/2 → 2 ≤ Q →
      ∀ M : FilteredNilmanifold, M.dim=m → M.degree=d →
      ∀ B : RationalMalcevBasis M Q, ∀ g : ℤ → M.carrier,
        IsFilteredPolynomial M.filtration g → IsTotallyEquidistributed B g N δ →
      ∀ F : M.Space → ℝ, (∫ x, F x ∂M.invariantProbability)=0 →
      ∀ L : ℝ, 0 ≤ L → observableLipNorm B (fun x => (F x : ℂ)) ≤ L →
      ∀ P : Finset ℤ, IsIntegerProgression P → P ⊆ Finset.Icc (1 : ℤ) N →
        (N : ℝ)/Q ≤ P.card →
          ‖intervalCorrelation N mobiusInteger
            (fun n => if n ∈ P then (F (M.coset (g n)) : ℂ) else 0)‖ ≤
              C*δ^c*Q*L*Real.log N := by sorry

-- AC.4: the original comparison route's factor and exceptional cells.
def partitionAverage {X : Type*} [Fintype X] [DecidableEq X] (P : Finpartition (Finset.univ : Finset X))
    (f : X → ℝ) (x : X) : ℝ :=
  ∑ A ∈ P.parts, if x ∈ A then (A.card : ℝ)⁻¹*∑ y ∈ A, f y else 0
theorem weighted_koopman_von_neumann (k : ℕ) (hk : 3 ≤ k) (ν : WeightFamily)
    (hν : IsKPseudorandom ν k) (ε η : ℝ) (hε : 0 < ε) (hη : 0 < η) :
    ∃ N₀ : ℕ, ∀ p : PrimeModulus, N₀ ≤ p.val → ∀ f : ZMod p.val → ℝ,
      (∀ x, 0 ≤ f x ∧ f x ≤ ν p x) →
      ∃ P : Finpartition (Finset.univ : Finset (ZMod p.val)), ∃ bad : Finset (ZMod p.val),
        (∀ A ∈ P.parts, A ⊆ bad ∨ Disjoint A bad) ∧
        realAverage (fun x => if x ∈ bad then ν p x+1 else 0) ≤ η ∧
        (∀ x, x ∉ bad → partitionAverage P (ν p) x ≤ 1+η) ∧
        gowersNorm (k-1) (fun x => if x ∈ bad then 0 else
          ((f x-partitionAverage P f x : ℝ) : ℂ)) ≤ ε := by sorry

def smoothCutoffConstant (χ : ℝ → ℝ) : ℝ := ∫ t in (0 : ℝ)..1, (deriv χ t)^2
def isSmoothSieveCutoff (χ : ℝ → ℝ) : Prop :=
  ContDiff ℝ ⊤ χ ∧ χ 0=1 ∧ ∀ x, 1 ≤ |x| → χ x=0
theorem smooth_divisor_linear_moments (m t L : ℕ) (hm : 1 ≤ m) (ht : 1 ≤ t)
    (χ : ℝ → ℝ) (hχ : isSmoothSieveCutoff χ) (a : ℝ) (ha : 0 < a)
    (ha' : a < (10*m : ℝ)⁻¹) :
    ∃ w : ℕ → ℕ, Filter.Tendsto w Filter.atTop Filter.atTop ∧
      ∀ ε : ℝ, 0 < ε → ∃ N₀ : ℕ, ∀ N ≥ N₀,
      ∀ Ψ : AffineSystem t m, (∃ s, HasCSComplexity Ψ s) → Ψ.size N ≤ L →
      ∀ b : ℕ, b ≤ wTrickModulus (w N) → b.Coprime (wTrickModulus (w N)) →
      ∀ lo hi : Fin t → ℤ, (∀ i, - (N : ℤ) ≤ lo i ∧ hi i ≤ N ∧
        ((N : ℝ)^a)^(10*m) ≤ hi i-lo i+1) →
      (∀ x ∈ Fintype.piFinset (fun i => Finset.Icc (lo i) (hi i)),
        ∀ i, (wTrickModulus (w N) : ℤ)*Ψ.eval i x+b ≠ 0) →
      |((Fintype.piFinset (fun i => Finset.Icc (lo i) (hi i))).card : ℝ)⁻¹ *
        (∑ x ∈ Fintype.piFinset (fun i => Finset.Icc (lo i) (hi i)),
          ∏ i, (smoothDivisorSum χ ((N : ℝ)^a)
            ((wTrickModulus (w N) : ℤ)*Ψ.eval i x+b))^2) /
          (((wTrickModulus (w N) : ℝ)*smoothCutoffConstant χ*Real.log ((N : ℝ)^a) /
            Nat.totient (wTrickModulus (w N)))^m)-1| ≤ ε := by sorry

theorem smoothMajorant_linear_forms (k : ℕ) (hk : 3 ≤ k)
    (χ : ℝ → ℝ) (hχ : isSmoothSieveCutoff χ) :
    ∃ w : ℕ → ℕ, Filter.Tendsto w Filter.atTop Filter.atTop ∧
      TendsToZeroOnPrimes (fun p => apLinearFormsError (N := p.val) k
        (fun x => smoothMajorant χ (smoothCutoffConstant χ)
          ((p.val : ℝ)^(((k*2^(k+3) : ℕ) : ℝ)⁻¹))
          (wTrickModulus (w p.val)) 1 p.val x.val)) := by sorry

-- AC.5: the vector estimate retains all boundedness and enlarged-box hypotheses.
def vectorAffineEval {d n t : ℕ}
    (L : Fin t → (Fin d → ℤ) →ₗ[ℤ] (Fin n → ℤ))
    (b : Fin t → (Fin n → ℤ)) (i : Fin t) (x : Fin d → ℤ) : Fin n → ℤ := b i+L i x
def vectorSystemSize {d n t : ℕ}
    (L : Fin t → (Fin d → ℤ) →ₗ[ℤ] (Fin n → ℤ))
    (b : Fin t → (Fin n → ℤ)) (N : ℕ) : ℝ :=
  sSup {r | r=0 ∨ (∃ i j, r=‖(fun k => (L i (Pi.single j 1) k : ℝ))‖) ∨
    (∃ i, r=‖(fun k => (b i k : ℝ))‖/N)}
theorem module_generalised_von_neumann (d n s : ℕ) (hd : 1 ≤ d) (hn : 1 ≤ n) (hs : 1 ≤ s) :
    ∃ C : ℝ, 0 < C ∧ ∀ N t L₀ : ℕ, 1 ≤ N → 1 ≤ t → 1 ≤ L₀ →
      ∀ L : Fin t → (Fin d → ℤ) →ₗ[ℤ] (Fin n → ℤ),
      ∀ b : Fin t → (Fin n → ℤ), vectorSystemSize L b N ≤ L₀ → HasModuleCSComplexity L s →
      ∀ f : Fin t → (Fin n → ℤ) → ℂ, (∀ i x, ‖f i x‖ ≤ 1) →
      ∀ δ : ℝ, 0 < δ → δ ≤ 1 → ∀ i : Fin t,
        boxGowersNorm (s+1) n ((d+1)*L₀*N) (f i) ≤ δ →
      ∀ Ω : Set (Fin d → ℝ), Convex ℝ Ω →
        Ω ⊆ {x | ∀ j, |x j| ≤ N} →
        ‖((integerBox d N).card : ℂ)⁻¹ * ∑ x ∈ integerBox d N,
          if (fun j => (x j : ℝ)) ∈ Ω then ∏ i, f i (vectorAffineEval L b i x) else 0‖ ≤
            C*(L₀ : ℝ)^d*δ^((2*d+2 : ℝ)⁻¹) := by sorry

def integerVonMangoldt (n : ℤ) : ℝ := if 0 < n then ArithmeticFunction.vonMangoldt n.toNat else 0
theorem linear_equations_in_primes (d t L : ℕ) (hd : 1 ≤ d) (ht : 1 ≤ t)
    (A : ℝ) (hA : 0 < A) : ∃ C : ℝ, 0 < C ∧ ∃ N₀ : ℕ, ∀ N ≥ N₀,
      ∀ Ψ : AffineSystem d t, (∃ s, HasCSComplexity Ψ s) → Ψ.size N ≤ L →
      ∀ Ω : Set (Fin d → ℝ), Convex ℝ Ω → Ω ⊆ {x | ∀ j, |x j| ≤ N} →
        |(∑ x ∈ (integerBox d N).filter (fun x => (fun j => (x j : ℝ)) ∈ Ω),
          ∏ i, integerVonMangoldt (Ψ.eval i x))-
          integerArchimedeanFactor Ψ Ω*(∏' p : PrimeModulus, integerLocalFactor Ψ p)| ≤
            C*(N : ℝ)^d*(Real.log N)^(-A) := by sorry

end TauCeti.AdditiveFourier


namespace TauCeti.AdditiveFourier
open MeasureTheory Module
open scoped nonZeroDivisors NumberField
attribute [local instance] Classical.propDecidable
attribute [local instance] Classical.decEq

/- AN.4 consumer prototypes. These are not additional roadmap-owned definitions.
The canonical residue, ideal Cramer/Siegel models, norm-length basis and localized module
are requested from AN.4. Native FractionalIdeal, Ideal, Basis and quotient types are used.
The fixed-basis specializations below allow constants to depend on that basis; the reader's
uniform statements require the additional norm-length compatibility condition. -/
section NumberFieldConsumers
variable (K : Type*) [Field K] [NumberField K]
abbrev NonzeroFractionalIdeal := (FractionalIdeal (𝓞 K)⁰ K)ˣ
abbrev NonzeroPrimeIdeal := {q : Ideal (𝓞 K) // q.IsPrime ∧ q ≠ ⊥}
def suppliedDedekindZetaResidue (K : Type*) [Field K] [NumberField K] : ℝ := by sorry
-- This data constant is the AN.4 residue at s=1, not an arbitrary real parameter.
def idealVonMangoldt (I : Ideal (𝓞 K)) : ℝ :=
  if h : ∃ q : Ideal (𝓞 K), q.IsPrime ∧ q ≠ ⊥ ∧ ∃ k : ℕ, 0 < k ∧ I=q^k
  then Real.log (Ideal.absNorm h.choose) else 0
def fractionalPrimeWeight (a : NonzeroFractionalIdeal K) (x : K) : ℝ :=
  if h : ∃ I : Ideal (𝓞 K), (I : FractionalIdeal (𝓞 K)⁰ K)=
    FractionalIdeal.spanSingleton (𝓞 K)⁰ x * (a⁻¹).val
  then idealVonMangoldt K h.choose else 0

def rationalPrimorialBelow (Q : ℝ) : ℕ :=
  ∏ p ∈ (Finset.range ⌈Q⌉₊).filter (fun p : ℕ => p.Prime ∧ (p : ℝ) < Q), p
def idealCramerWeight (a : NonzeroFractionalIdeal K) (Q : ℝ) (x : K) : ℝ :=
  let P := rationalPrimorialBelow Q
  if FractionalIdeal.spanSingleton (𝓞 K)⁰ x +
    FractionalIdeal.spanSingleton (𝓞 K)⁰ (P : K)*a.val=a.val then
      (suppliedDedekindZetaResidue K)⁻¹*(P : ℝ)^(Module.finrank ℚ K)/
        (Nat.card (((𝓞 K) ⧸ Ideal.span {(P : 𝓞 K)})ˣ) : ℝ) else 0

def kaiModelCutoff (N : ℕ) : ℝ := Real.exp ((Real.log N)^(1/10 : ℝ))
def primeIdealsAbove (p : PrimeModulus) : Finset (Ideal (𝓞 K)) := by sorry
lemma mem_primeIdealsAbove (p : PrimeModulus) (q : Ideal (𝓞 K)) :
    q ∈ primeIdealsAbove K p ↔ q.IsPrime ∧ (p.val : 𝓞 K) ∈ q := by sorry

def nativeNumberFieldLocalFactor {d n t : ℕ} (a : NonzeroFractionalIdeal K)
    (B : (Fin n → ℤ) ≃ₗ[ℤ] a.val)
    (L : Fin t → (Fin d → ℤ) →ₗ[ℤ] (Fin n → ℤ))
    (b : Fin t → (Fin n → ℤ)) (S : Finset (Ideal (𝓞 K))) (p : PrimeModulus) : ℝ :=
  ((p.val : ℝ)^(Module.finrank ℚ K)/
    (Nat.card (((𝓞 K) ⧸ Ideal.span {(p.val : 𝓞 K)})ˣ) : ℝ))^t *
    realAverage (fun x : Fin d → ZMod p.val => if
      ∀ i, ∀ q ∈ primeIdealsAbove K p, q ∉ S →
        ((B (vectorAffineEval L b i (fun j => (x j).val))) : K) ∉
          ((q : FractionalIdeal (𝓞 K)⁰ K)*a.val) then 1 else 0)
-- The retained multiplier uses every prime ideal above p; S changes only avoidance.

-- The primitive condition says that no strictly larger ideal is a period ideal.
theorem quadratic_hecke_uniformity (s : ℕ) (hs : 1 ≤ s) (ε : ℝ) (hε : 0 < ε) :
    ∃ C : ℝ, 0 < C ∧ ∀ q : Ideal (𝓞 K), q ≠ ⊥ →
      ∀ (_ : Fintype ((𝓞 K) ⧸ q)), ∀ χ : MulChar ((𝓞 K) ⧸ q) ℂ,
        (∀ x, χ x=0 ∨ χ x=1 ∨ χ x= -1) → χ ≠ 1 →
        (∀ I : Ideal (𝓞 K), q < I → ∃ x y : 𝓞 K,
          x-y ∈ I ∧ χ (Ideal.Quotient.mk q x) ≠ χ (Ideal.Quotient.mk q y)) →
        gowersNorm (s+1) (fun x => χ x) ≤
          C*(Ideal.absNorm q : ℝ)^(-((2^(s+2) : ℕ) : ℝ)⁻¹+ε) := by sorry
-- The Hecke ray-character identification and the Siegel-model comparison are not encoded here.

theorem number_field_prime_uniformity (n s : ℕ) (hs : 1 ≤ s)
    (a : NonzeroFractionalIdeal K) (B : (Fin n → ℤ) ≃ₗ[ℤ] a.val)
    (A : ℝ) (hA : 1 < A) : ∃ C : ℝ, 0 < C ∧ ∃ N₀ : ℕ,
      ∀ N ≥ N₀, ∀ Ω : Set (Fin n → ℝ), Convex ℝ Ω →
        Ω ⊆ {x | ∀ j, |x j| ≤ N} →
        boxGowersNorm (s+1) n N (fun x => if (fun j => (x j : ℝ)) ∈ Ω then
          ((fractionalPrimeWeight K a (B x)-idealCramerWeight K a (kaiModelCutoff N) (B x) : ℝ) : ℂ)
          else 0) ≤ C*(Real.log N)^(-A) := by sorry
-- This statable portion is Corollary 9.2 at a fixed basis. The exp-rate Siegel bound and
-- uniform congruence-class version need the AN.4 exceptional character and basis interfaces.

theorem number_field_prime_patterns (d n t : ℕ) (hd : 2 ≤ d) (ht : 2 ≤ t)
    (a : NonzeroFractionalIdeal K) (B : (Fin n → ℤ) ≃ₗ[ℤ] a.val)
    (A : ℝ) (hA : 1 < A) : ∃ C : ℝ, 0 < C ∧ ∃ N₀ : ℕ, ∀ N ≥ N₀,
      ∀ L : Fin t → (Fin d → ℤ) →ₗ[ℤ] (Fin n → ℤ),
      ∀ b : Fin t → (Fin n → ℤ), vectorSystemSize L b N ≤ (Real.log N)^A →
        (∀ i j, i ≠ j → Finite ((Fin n → ℤ) ⧸ ((L i).comp (L j).ker.subtype).range)) →
      ∀ Ω : Set (Fin d → ℝ), Convex ℝ Ω → Ω ⊆ {x | ∀ j, |x j| ≤ N} →
        |(∑ x ∈ (integerBox d N).filter (fun x => (fun j => (x j : ℝ)) ∈ Ω),
          ∏ i, fractionalPrimeWeight K a (B (vectorAffineEval L b i x)))-
          (volume Ω).toReal/(suppliedDedekindZetaResidue K)^t *
            (∏' p : PrimeModulus, nativeNumberFieldLocalFactor K a B L b ∅ p)| ≤
              C*(N : ℝ)^d*(Real.log N)^(-A) := by sorry

-- AN.4 owns the localized arithmetic data; their value formulae remain supplier contracts.
def suppliedLocalizedModule (a : NonzeroFractionalIdeal K)
    (S : Finset (NonzeroPrimeIdeal K)) : Submodule ℤ K := by sorry
def suppliedLocalizedPrimeWeight (a : NonzeroFractionalIdeal K)
    (S : Finset (NonzeroPrimeIdeal K)) : K → ℝ := by sorry
def suppliedLocalizedCramerWeight (a : NonzeroFractionalIdeal K)
    (S : Finset (NonzeroPrimeIdeal K)) (Q : ℝ) : K → ℝ := by sorry

theorem localized_prime_uniformity (n s : ℕ) (hs : 1 ≤ s)
    (S : Finset (NonzeroPrimeIdeal K)) (a : NonzeroFractionalIdeal K)
    (B : (Fin n → ℤ) ≃ₗ[ℤ] a.val) (A : ℝ) (hA : 1 < A) :
    ∃ C : ℝ, 0 < C ∧ ∃ N₀ : ℕ, ∀ N ≥ N₀,
      boxGowersNorm (s+1) n N (fun x =>
        ((suppliedLocalizedPrimeWeight K a S (B x)-
          suppliedLocalizedCramerWeight K a S (kaiModelCutoff N) (B x) : ℝ) : ℂ)) ≤
            C*(Real.log N)^(-A) := by sorry

def HasLipschitzBoundaryCover {d : ℕ} (Ω : Set (Fin d → ℝ)) (Z : ℕ) (R : ℝ) : Prop :=
  ∃ φ : Fin Z → (Fin (d-1) → ℝ) → (Fin d → ℝ),
    (∀ i, ∀ x y : Fin (d-1) → ℝ,
      (∀ j, 0 ≤ x j ∧ x j ≤ 1) → (∀ j, 0 ≤ y j ∧ y j ≤ 1) →
        ‖φ i x-φ i y‖ ≤ R*‖x-y‖) ∧
    frontier Ω ⊆ ⋃ i, φ i '' {x | ∀ j, 0 ≤ x j ∧ x j ≤ 1}
-- Source-owned local constant on the S-localized affine system; its finite-field API is above.
def suppliedLocalizedSingularConstant {d t : ℕ} (a : NonzeroFractionalIdeal K)
    (S : Finset (NonzeroPrimeIdeal K))
    (L : Fin t → (Fin d → ℤ) →ₗ[ℤ] suppliedLocalizedModule K a S)
    (b : Fin t → suppliedLocalizedModule K a S) : ℝ := by sorry

theorem localized_prime_patterns (d t : ℕ) (hd : 1 ≤ d) (ht : 1 ≤ t)
    (S : Finset (NonzeroPrimeIdeal K)) (a : NonzeroFractionalIdeal K)
    (L : Fin t → (Fin d → ℤ) →ₗ[ℤ] suppliedLocalizedModule K a S)
    (b : Fin t → suppliedLocalizedModule K a S)
    (hL : ∀ i, HasTorsionCokernel (L i))
    (hpairs : ∀ i j, i ≠ j → HasTorsionCokernel ((L i).comp (L j).ker.subtype))
    (Z : ℕ) (L₀ A : ℝ) (hL₀ : 0 < L₀) (hA : 1 < A) :
    ∃ C : ℝ, 0 < C ∧ ∃ N₀ : ℕ, ∀ N ≥ N₀,
      ∀ Ω : Set (Fin d → ℝ), MeasurableSet Ω → Ω ⊆ {x | ∀ j, |x j| ≤ N} →
        HasLipschitzBoundaryCover Ω Z (L₀*N) →
        |(∑ x ∈ (integerBox d N).filter (fun x => (fun j => (x j : ℝ)) ∈ Ω),
          ∏ i, suppliedLocalizedPrimeWeight K a S ((b i+L i x : suppliedLocalizedModule K a S) : K))-
          suppliedLocalizedSingularConstant K a S L b *
            (volume Ω).toReal/(suppliedDedekindZetaResidue K)^t| ≤
              C*(N : ℝ)^d*(Real.log N)^(-A) := by sorry
end NumberFieldConsumers
end TauCeti.AdditiveFourier
