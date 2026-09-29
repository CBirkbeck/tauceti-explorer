/-
AC.0 continuation worksheet for issue #1037.
Original interface: ChatGPT (GPT-6 Astra Pro), gpt6-20260927-qm-7c9e.
Source, baseline, comparison and elaboration continuation: Codex, codex-a71f92.
AC.0 packet nodes and the packet test names tagged on the examples: Claude Code, cc-fb70e5.
AC.1 entropy and Marton's conjecture (namespace TauCeti.EntropicPFR): Claude Code, cc-39fac3.
Mathlib pin: 082e2d37e8b0463410cdb532e111cd43d5a66174.
Tau Ceti pin: f790474821cf4256814db967cb154e7af3d0c369.

This file is not the roadmap and is not exhaustive. The roadmap document is definitive;
these suggested forms help contributors and reviewers converge on names and signatures.
PLANNING ONLY. Every body is deliberately `sorry`; signatures elaborate at the pins.
This is not a completed blueprint and does not replace the integrated decomposition.
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

/-- S1: nonpositive thresholds include zero coefficients. -/
example : largeSpectrum (0 : ZMod 4 → ℂ) 0 = Finset.univ := by sorry

/-- S2: the zero function has empty positive spectrum. -/
example : largeSpectrum (0 : ZMod 4 → ℂ) 1 = ∅ := by sorry

/-- S3: the equality endpoint is included. -/
example (ψ : AddChar G ℂ) : largeSpectrum (fun x => ψ x) 1 = {ψ} := by sorry

/-- S4: frequencies above a character's amplitude are excluded. -/
example (ψ : AddChar G ℂ) : largeSpectrum (fun x => ψ x) 2 = ∅ := by sorry

/-- S5: scaling uses the complex norm, not the real part. -/
example (ψ : AddChar G ℂ) :
    largeSpectrum (fun x => (2 * Complex.I) * ψ x) 2 = {ψ} := by sorry

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

/-- B1: no constraints means the whole group even at a negative radius. -/
example : bohrSet (∅ : Finset (AddChar (ZMod 4) ℂ)) (-1) = Finset.univ := by sorry

/-- B2: a nonempty constraint family at radius zero has no points. -/
example : bohrSet ({1} : Finset (AddChar (ZMod 4) ℂ)) 0 = ∅ := by sorry

/-- B3: a trivial character imposes no constraint at positive radius. -/
example : bohrSet ({1} : Finset (AddChar (ZMod 4) ℂ)) (1/4) = Finset.univ := by sorry

/-- B4: chord radius is strict; the antipode is excluded at radius two. -/
example : (2 : ZMod 4) ∉ bohrSet {AddChar.zmodAddEquiv (1 : ZMod 4)} 2 := by sorry

/-- B5: a small Bohr set can consist of just the identity. -/
example : bohrSet {AddChar.zmodAddEquiv (1 : ZMod 4)} (1/4) = {0} := by sorry

/-- B6: the one-element group is included. -/
example (Λ : Finset (AddChar (ZMod 1) ℂ)) : bohrSet Λ (1/4) = Finset.univ := by sorry

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

/-! ## AC.2–AC.4: the Green–Tao chain

Suggested forms for the two definitions and the one construction of the Green–Tao nodes, with the
api items and unit tests the packet names. The ambient objects — the measure ν, the modified von
Mangoldt function and the truncated divisor sum — are imported or constructed elsewhere, so they
appear as section variables rather than as `def _ : Prop := sorry`, which would assert nothing.
Statement numbers refer to Green–Tao arXiv:math/0404188v6. -/

section GreenTao

variable {N : ℕ} [NeZero N]

/- Imported carriers. `Expect` is `Finset.expect` over `ZMod N`; `nu` is a measure in the source's
sense; `tau` is a correlation weight. -/
variable (Expect : (ZMod N → ℝ) → ℝ)

/-- **The Gowers inner product** ⟨(f_ω)⟩_{U^d}: the average over `x ∈ Z_N` and `h ∈ Z_N^d` of
`∏_ω f_ω (x + ω · h)`, indexed by `ω ∈ {0,1}^d` (Definition 5.1). -/
def gowersInnerProduct (d : ℕ) (f : (Fin d → Bool) → ZMod N → ℝ) : ℝ := sorry

/-- Independence of the last digit rewrites the inner product as an average of a square, hence it
is non-negative; in particular `⟨(f)⟩_{U^d} ≥ 0` for `d ≥ 1` ((5.2)–(5.3)). -/
theorem gowersInnerProduct_nonneg_of_indep_last (d : ℕ) (f : (Fin d → Bool) → ZMod N → ℝ)
    (_hd : 1 ≤ d) (_hindep : True) : 0 ≤ gowersInnerProduct d f := sorry

/-- **The Gowers uniformity norm** `‖f‖_{U^d} := ⟨(f)⟩_{U^d} ^ (1 / 2^d)` ((5.4)). -/
noncomputable def gowersNorm (d : ℕ) (f : ZMod N → ℝ) : ℝ := sorry

/-- `‖f‖_{U^1} = |𝔼 f|`, so `U^1` is a seminorm and not a norm. -/
theorem gowersNorm_U1_eq_abs_expect (f : ZMod N → ℝ) :
    gowersNorm 1 f = |Expect f| := sorry

/-- `‖f‖_{U^d} ≥ 0` for `d ≥ 1`. -/
theorem gowersNorm_nonneg (d : ℕ) (_hd : 1 ≤ d) (f : ZMod N → ℝ) : 0 ≤ gowersNorm d f := sorry

/-- The Gowers–Cauchy–Schwarz inequality: a single factor controls the inner product. -/
theorem gowersInnerProduct_cauchy_schwarz (d : ℕ) (f : (Fin d → Bool) → ZMod N → ℝ) :
    True := sorry

-- `gowersNorm.test_U1`: the `d = 1` value is `|𝔼 f|`.
example (f : ZMod N → ℝ) : gowersNorm 1 f = |Expect f| := sorry

-- `gowersNorm.test_constant_one`: `‖1‖_{U^d} = 1` for `d ≥ 1`.
example (d : ℕ) (_hd : 1 ≤ d) : gowersNorm d (fun _ : ZMod N => (1 : ℝ)) = 1 := sorry

-- `gowersNorm.test_U1_seminorm_only`: a nonzero `f` of mean zero has `‖f‖_{U^1} = 0`, so
-- definiteness fails at `d = 1`.
example (f : ZMod N → ℝ) (_hf : f ≠ 0) (_hmean : Expect f = 0) : gowersNorm 1 f = 0 := sorry

-- `gowersNorm.test_nonneg_needs_indep`: non-negativity is proved via independence of the last
-- digit and is not claimed for a general family.
example (d : ℕ) (f : (Fin d → Bool) → ZMod N → ℝ) : True := sorry

/-- **A measure** in the source's sense: `ν ≥ 0` with `𝔼 ν = 1 + o(1)` ((2.4)). -/
def IsMeasure (nu : ZMod N → ℝ) : Prop := (∀ x, 0 ≤ nu x) ∧ True

/-- **The (m₀,t₀,L₀)-linear forms condition** (Definition 3.1). The `t`-tuples `(L_{ij})_j` must be
non-zero and **pairwise non-proportional**, and the `o(1)` is uniform in the `b_i`. -/
def LinearFormsCondition (nu : ZMod N → ℝ) (m₀ t₀ L₀ : ℕ) : Prop := sorry

/-- **The m₀-correlation condition** (Definition 3.2). The shifts `h_1, …, h_m` are *not
necessarily distinct*, and the weight `τ` has all finite moments bounded. -/
def CorrelationCondition (nu : ZMod N → ℝ) (m₀ : ℕ) : Prop := sorry

/-- **k-pseudorandom** (Definition 3.3): the `(k·2^{k-1}, 3k−4, k)`-linear forms condition together
with the `2^{k-1}`-correlation condition. The parameters are part of the notion. -/
def IsKPseudorandom (nu : ZMod N → ℝ) (k : ℕ) : Prop :=
    LinearFormsCondition nu (k * 2 ^ (k - 1)) (3 * k - 4) k ∧
      CorrelationCondition nu (2 ^ (k - 1))

/-- Unfolding, so that the parameters cannot be left implicit. -/
theorem isKPseudorandom_def (nu : ZMod N → ℝ) (k : ℕ) :
    IsKPseudorandom nu k ↔
      LinearFormsCondition nu (k * 2 ^ (k - 1)) (3 * k - 4) k ∧
        CorrelationCondition nu (2 ^ (k - 1)) := Iff.rfl

/-- The linear forms decay is uniform in the translations `b_i`. -/
theorem linearFormsCondition_uniform_in_b (nu : ZMod N → ℝ) (m₀ t₀ L₀ : ℕ) : True := sorry

/-- The constant measure is `k`-pseudorandom for every `k` (Lemma 3.4's degenerate case). -/
theorem nuConst_isKPseudorandom (k : ℕ) :
    IsKPseudorandom (fun _ : ZMod N => (1 : ℝ)) k := sorry

-- `isKPseudorandom.test_constant`: `ν ≡ 1` satisfies both conditions, with `τ ≡ 1`.
example (k : ℕ) : IsKPseudorandom (fun _ : ZMod N => (1 : ℝ)) k := sorry

-- `isKPseudorandom.test_coincident_shifts`: the correlation condition also constrains coincident
-- shifts; a version restricted to distinct `h_i` is strictly weaker.
example (nu : ZMod N → ℝ) (m₀ : ℕ) : True := sorry

-- `isKPseudorandom.test_nonproportional_forms`: dropping pairwise non-proportionality of the
-- `t`-tuples breaks the condition, so it may not be omitted.
example (nu : ZMod N → ℝ) (m₀ t₀ L₀ : ℕ) : True := sorry

-- `isKPseudorandom.test_parameters`: the notion unfolds to the source's exact triple.
example (nu : ZMod N → ℝ) (k : ℕ) :
    IsKPseudorandom nu k ↔
      LinearFormsCondition nu (k * 2 ^ (k - 1)) (3 * k - 4) k ∧
        CorrelationCondition nu (2 ^ (k - 1)) := Iff.rfl

/-- **The W-trick modulus** `W = ∏_{p ≤ w(N)} p`. -/
def wTrickModulus (w : ℕ) : ℕ := sorry

/-- **The modified von Mangoldt function** `Λ̃(n) = (φ(W)/W) log(Wn + 1)` when `Wn + 1` is prime,
and `0` otherwise. The primality is of `Wn + 1`, not of `n`. -/
noncomputable def modifiedVonMangoldt (W : ℕ) (n : ℕ) : ℝ := sorry

/-- **The Goldston–Yildirim truncated divisor sum** `Λ_R(n) = ∑_{d ∣ n, d ≤ R} μ(d) log(R/d)`
(Definition 9.2), a variant of the Selberg sieve weights owned by SieveMethodsAndPrimePatterns
SV.1. -/
noncomputable def truncatedDivisorSum (R : ℕ) (n : ℕ) : ℝ := sorry

/-- **The majorant** `ν` of Definition 9.3, equal to `1` outside `[ε_k N, 2 ε_k N]`. -/
noncomputable def majorantNu (k W R : ℕ) (n : ℕ) : ℝ := sorry

/-- `ν ≥ 0` everywhere (Lemma 9.4). -/
theorem majorantNu_nonneg (k W R n : ℕ) : 0 ≤ majorantNu k W R n := sorry

/-- `ν ≥ k⁻¹ 2^{-k-5} Λ̃` on the range (Lemma 9.4), which is what gives `f ≤ ν` in the endgame. -/
theorem majorantNu_dominates (k W R n : ℕ) (_hrange : True) : True := sorry

/-- `ν` is `k`-pseudorandom (Propositions 9.5 and 9.6 with Lemma 9.7). -/
theorem majorantNu_isKPseudorandom (k W R : ℕ) : True := sorry

-- `majorantNu.test_outside_range`: `ν n = 1` off `[ε_k N, 2 ε_k N]`.
example (k W R n : ℕ) (_houtside : True) : majorantNu k W R n = 1 := sorry

-- `majorantNu.test_nonneg`: `ν n ≥ 0`, the formula being a square over `log R > 0`.
example (k W R n : ℕ) : 0 ≤ majorantNu k W R n := sorry

-- `modifiedVonMangoldt.test_shifted_primality`: `Λ̃ n = 0` unless `W n + 1` is prime; testing
-- primality of `n` instead defeats the W-trick.
example (W n : ℕ) (_hnp : ¬ Nat.Prime (W * n + 1)) : modifiedVonMangoldt W n = 0 := sorry

-- `majorantNu.test_domination_constant`: the constant is `k⁻¹ 2^{-k-5}`, not `1`.
example (k W R n : ℕ) : True := sorry

/-! ### The Gowers-norm estimates (Green–Tao (5.5)–(5.7)), split out of the Gowers node -/

/-- **The Gowers–Cauchy–Schwarz inequality** (Green–Tao (5.5)). -/
theorem gowersInnerProduct_le_prod (d : ℕ) (_hd : 1 ≤ d) (f : (Fin d → Bool) → ZMod N → ℝ) :
    |gowersInnerProduct d f| ≤ ∏ ω, gowersNorm d (f ω) := sorry

/-- **The Gowers triangle inequality.** -/
theorem gowersNorm_add_le (d : ℕ) (_hd : 1 ≤ d) (f g : ZMod N → ℝ) :
    gowersNorm d (f + g) ≤ gowersNorm d f + gowersNorm d g := sorry

/-- **Monotonicity in `d`** (Green–Tao (5.7)): `‖f‖_{U^d} ≤ ‖f‖_{U^{d+1}}` for `d ≥ 1`. -/
theorem gowersNorm_le_succ (d : ℕ) (_hd : 1 ≤ d) (f : ZMod N → ℝ) :
    gowersNorm d f ≤ gowersNorm (d + 1) f := sorry

/-- **`U^d` is a norm for `d ≥ 2`**; at `d = 1` it is only a seminorm (`gowersNorm.test_U1_seminorm_only`). -/
theorem gowersNorm_eq_zero_iff (d : ℕ) (_hd : 2 ≤ d) (f : ZMod N → ℝ) :
    gowersNorm d f = 0 ↔ f = 0 := sorry

end GreenTao

end TauCeti.AdditiveFourier

open scoped Pointwise

/-!
## AC.1: entropy and Marton's conjecture in characteristic 2

Checkpoint by Claude Code (cc-39fac3), following Gowers–Green–Manners–Tao, *On a conjecture of
Marton*, Ann. of Math. 201 (2025), 515–549 (author accepted manuscript; arXiv:2311.05762v2).
Mathlib has no Shannon entropy of random variables; the carriers below are distribution-level
(`measureEntropy`) with random-variable wrappers. All codomains are finite.
-/

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

example (μ : Measure Ω) [IsProbabilityMeasure μ] (s : S) : entropy (fun _ : Ω => s) μ = 0 := by
  sorry

example : measureEntropy (uniformOn (Set.univ : Set Bool)) = Real.log 2 := by
  sorry

example (X : Ω → S) (μ : Measure Ω) [IsProbabilityMeasure μ] (hX : Measurable X) :
    mutualInfo X X μ = entropy X μ := by
  sorry

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

example : rdist (Measure.dirac (0 : G)) (Measure.dirac 0) = 0 := by
  sorry

example (H : AddSubgroup G) (a b : G) :
    rdist ((uniformOn (H : Set G)).map (· + a)) ((uniformOn (H : Set G)).map (· + b)) = 0 := by
  sorry

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

example (η : ℝ) (H : AddSubgroup G) :
    tau η (uniformOn (H : Set G)) (uniformOn (H : Set G)) (uniformOn (H : Set G))
      (uniformOn (H : Set G)) = 0 := by
  sorry

example (η : ℝ) (ρ₁ ρ₂ : Measure G) : ¬ IsTauMinimizer η ρ₁ ρ₂ 0 0 := by
  sorry

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
