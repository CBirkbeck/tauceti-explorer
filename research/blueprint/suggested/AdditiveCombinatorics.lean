/-
AC.0 continuation worksheet for issue #1037.
Original interface: ChatGPT (GPT-6 Astra Pro), gpt6-20260927-qm-7c9e.
Source, baseline, comparison and elaboration continuation: Codex, codex-a71f92.
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

variable {N : ℕ} [NeZero N]

lemma zmod_character_comparison (r x : ZMod N) :
    AddChar.zmodAddEquiv r x = ZMod.stdAddChar (x * r) := by sorry

lemma fourier_zmod (f : ZMod N → ℂ) (r : ZMod N) :
    fourier f (AddChar.zmodAddEquiv r) =
      (N : ℂ)⁻¹ * ZMod.dft f r := by sorry

/-! Definition tests. These are specifications, not executed Lean tests. -/

-- F1: a non-real phase distinguishes the sign of the transform.
example : fourier (Pi.single (1 : ZMod 4) (1 : ℂ))
    (AddChar.zmodAddEquiv (1 : ZMod 4)) = -Complex.I / 4 := by sorry

-- F2: distinct characters have zero pairing.
example : fourier (fun x : ZMod 3 => AddChar.zmodAddEquiv (2 : ZMod 3) x)
    (AddChar.zmodAddEquiv (1 : ZMod 3)) = 0 := by sorry

-- F3: a character has coefficient one, not N, at itself.
example (χ : AddChar G ℂ) : fourier (fun x => χ x) χ = 1 := by sorry

-- F4: the zero function.
example (χ : AddChar G ℂ) : fourier (0 : G → ℂ) χ = 0 := by sorry

-- F5: the one-element group is included.
example (f : ZMod 1 → ℂ) (χ : AddChar (ZMod 1) ℂ) :
    fourier f χ = f 0 := by sorry

-- F6: a genuinely noncyclic group; the delta mass has coefficient 1/4.
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

-- F10: conjugate reflection, not just reflection, conjugates the coefficient.
example : fourier (fun x : ZMod 4 =>
    star ((Pi.single (1 : ZMod 4) (1 : ℂ) : ZMod 4 → ℂ) (-x)))
      (AddChar.zmodAddEquiv (1 : ZMod 4)) = Complex.I / 4 := by sorry

-- F11: the inner product places the character in its conjugate-linear slot.
example (χ : AddChar G ℂ) :
    fourier (fun x => Complex.I * χ x) χ = Complex.I := by sorry

-- C1: a unit delta is not the convolution unit under probability measure.
example : nconv (Pi.single (0 : ZMod 3) (1 : ℂ))
    (Pi.single (0 : ZMod 3) (1 : ℂ)) 0 = 1 / 3 := by sorry

-- C2: the correctly scaled delta is the left unit.
example (f : ZMod 4 → ℂ) : nconv (Pi.single 0 (4 : ℂ)) f = f := by sorry

-- C3: the right unit.
example (f : ZMod 4 → ℂ) : nconv f (Pi.single 0 (4 : ℂ)) = f := by sorry

-- C4: the degenerate zero case.
example (f : G → ℂ) : nconv 0 f = 0 := by sorry

-- C5: probability normalization fixes the convolution of constants.
example : nconv (fun _ : G => (1 : ℂ)) (fun _ => 1) = fun _ => 1 := by sorry

-- C6: test the support and the normalization together.
example : nconv (Pi.single (1 : ZMod 4) (1 : ℂ))
    (Pi.single (1 : ZMod 4) (1 : ℂ)) 2 = 1 / 4 := by sorry

-- C7: comparison to the existing discrete convolution, not a parallel notion.
example (f g : ZMod 3 → ℂ) : nconv f g =
    (3 : ℂ)⁻¹ • DiscreteConvolution.addRingConvolution f g := by sorry

-- C8: convolution on the trivial group is multiplication.
example (f g : ZMod 1 → ℂ) : nconv f g 0 = f 0 * g 0 := by sorry

-- C9: representation multiplicity is retained, not replaced by sumset membership.
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

end TauCeti.AdditiveFourier
