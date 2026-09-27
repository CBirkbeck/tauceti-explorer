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

end TauCeti.AdditiveFourier
