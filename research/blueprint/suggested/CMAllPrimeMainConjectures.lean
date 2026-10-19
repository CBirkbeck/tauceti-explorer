/-
Copyright (c) 2026 The Tau Ceti Atlas contributors. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Mathlib.Algebra.MonoidAlgebra.Basic
import Mathlib.NumberTheory.Cyclotomic.Basic
import Mathlib.RingTheory.AdjoinRoot

/-!
# Suggested Lean statements for "All-prime CM zeta-element main conjectures"

This file is **not** the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/CMAllPrimeMainConjectures.md` and its packet are definitive. The
statements below suggest Lean forms for the few objects of the roadmap that can be stated with what
the pinned Mathlib already provides, so that contributors and reviewers converge on names and
signatures. Everything heavy — ray towers, Iwasawa cohomology, elliptic units, Kato's realization of
Hecke characters, characteristic ideals over completed group algebras, Kato's zeta elements — is a
README target, because its carriers are not at the pins.

What is here:

* the twisting automorphism `Tw_χ : g ↦ χ(g) g` of a group algebra (layers CZ.0 and CZ.5:
  Johnson-Leung–Kings Lemma 4.7), at finite level. With natural left deck action,
  untwisted-to-twisted cohomology uses `Tw_{χ⁻¹}`, and its inverse uses `Tw_χ`;
* evaluation of the group algebra at a character, and the Euler factor `1 - g⁻¹` whose value at the
  trivial character is zero (the non-unit factor of `printed-equivariant-form-range`);
* the arithmetic predicate deciding when an imaginary quadratic field lies in `Q(μ_{p^∞})`
  (`cm-contained-descent`: Kato 15.14 versus Lemma 15.13), with its characterization stated.
-/

namespace CMAllPrime

open MonoidAlgebra

section Twist

variable {R : Type*} [CommRing R] {G : Type*} [CommGroup G]

/-- The monoid map `g ↦ χ(g) • g` into the group algebra, for a character `χ : G →* Rˣ`. -/
noncomputable def twistHom (χ : G →* Rˣ) : G →* MonoidAlgebra R G where
  toFun g := ((χ g : Rˣ) : R) • of R G g
  map_one' := by simp only [map_one, Units.val_one, one_smul]
  map_mul' g h := by
    simp only [map_mul, Units.val_mul, smul_mul_smul_comm]

/-- The twist `Tw_χ` of the group algebra `R[G]`: the `R`-algebra map with `g ↦ χ(g) g`
(Johnson-Leung–Kings Lemma 4.7 at finite level; `twisted-tower-cohomology` (a)). -/
noncomputable def twist (χ : G →* Rˣ) : MonoidAlgebra R G →ₐ[R] MonoidAlgebra R G :=
  lift R (MonoidAlgebra R G) G (twistHom χ)

theorem twist_of (χ : G →* Rˣ) (g : G) :
    twist χ (of R G g) = ((χ g : Rˣ) : R) • of R G g := by
  simp [twist, twistHom]

/-- Twisting by the trivial character is the identity. -/
theorem twist_one : twist (1 : G →* Rˣ) = AlgHom.id R (MonoidAlgebra R G) := by
  sorry

/-- Twists compose: `Tw_{χψ} = Tw_χ ∘ Tw_ψ`. -/
theorem twist_mul (χ ψ : G →* Rˣ) :
    twist (χ * ψ) = (twist χ).comp (twist ψ) := by
  sorry

/-- Evaluation of `R[G]` at a character `χ`. Its kernel need not be prime for an
arbitrary coefficient ring `R`; no height assertion is made here. -/
noncomputable def charEval (χ : G →* Rˣ) : MonoidAlgebra R G →ₐ[R] R :=
  lift R R G ((Units.coeHom R).comp χ)

theorem charEval_of (χ : G →* Rˣ) (g : G) : charEval χ (of R G g) = ((χ g : Rˣ) : R) := by
  simp [charEval]

/-- Evaluating after twisting by `ψ` is evaluating at `χ ψ`: twisting moves the characters,
which is how `twisted-equivariant-equality` transports primes `q' ↦ Tw(q')`. -/
theorem charEval_comp_twist (χ ψ : G →* Rˣ) :
    (charEval χ).comp (twist ψ) = charEval (χ * ψ) := by
  sorry

/-- The Euler factor `1 - g⁻¹` at a prime `𝔩` with Frobenius `g` (Johnson-Leung–Kings Lemma 4.3,
Corollary 5.3; the factor that Burungale–Tian's printed Theorem 2.1 omits). -/
noncomputable def eulerFactor (g : G) : MonoidAlgebra R G := 1 - of R G g⁻¹

theorem charEval_eulerFactor (χ : G →* Rˣ) (g : G) :
    charEval χ (eulerFactor g) = 1 - (((χ g)⁻¹ : Rˣ) : R) := by
  sorry

/-- On the trivial-character component the Euler factor vanishes, so it is not a unit there:
the counterexample component of `printed-equivariant-form-range` (c). -/
theorem charEval_one_eulerFactor (g : G) :
    charEval (1 : G →* Rˣ) (eulerFactor (R := R) g) = 0 := by
  simp [eulerFactor, charEval]

example (g : G) : ¬ IsUnit (charEval (1 : G →* Rˣ) (eulerFactor (R := R) g)) ∨
    Subsingleton R := by
  rw [charEval_one_eulerFactor]
  by_cases h : Subsingleton R
  · exact Or.inr h
  · left
    have : Nontrivial R := not_subsingleton_iff_nontrivial.mp h
    exact not_isUnit_zero

example (χ : G →* Rˣ) : twist χ (1 : MonoidAlgebra R G) = 1 := map_one _

end Twist

section ContainedCase

/-- `K = Q(√d)` (`d` a negative squarefree integer) lies in `Q(μ_{p^∞})` exactly in these cases:
`p = 2` and `d ∈ {-1, -2}`, or `p ≡ 3 mod 4` and `d = -p`. This decides whether Kato's descent
uses Lemma 15.13 or its variant 15.14 (`cm-contained-descent`). -/
def ContainedInCyclotomicTower (d : ℤ) (p : ℕ) : Prop :=
  (p = 2 ∧ (d = -1 ∨ d = -2)) ∨ (p % 4 = 3 ∧ d = -(p : ℤ))

instance (d : ℤ) (p : ℕ) : Decidable (ContainedInCyclotomicTower d p) := by
  unfold ContainedInCyclotomicTower; infer_instance

/-- The characterization: for `p` prime and `d < 0` squarefree, `Q(√d)` embeds in some
`Q(μ_{p^n})` if and only if `ContainedInCyclotomicTower d p`. -/
theorem containedInCyclotomicTower_iff (d : ℤ) (p : ℕ) (hp : p.Prime) (hd : d < 0)
    (hsq : Squarefree d) :
    (∃ n : ℕ, Nonempty (AdjoinRoot (Polynomial.X ^ 2 - Polynomial.C (d : ℚ)) →ₐ[ℚ]
      CyclotomicField (p ^ n) ℚ)) ↔ ContainedInCyclotomicTower d p := by
  sorry

-- The congruent-number case `K = Q(i)`, `p = 2`, and the cube-sum case `K = Q(√-3)`, `p = 3`,
-- go through Kato 15.14; `K = Q(i)`, `p = 5` goes through Lemma 15.13 directly.
example : ContainedInCyclotomicTower (-1) 2 := by decide
example : ContainedInCyclotomicTower (-3) 3 := by decide
example : ContainedInCyclotomicTower (-7) 7 := by decide
example : ContainedInCyclotomicTower (-2) 2 := by decide
example : ¬ ContainedInCyclotomicTower (-1) 5 := by decide
example : ¬ ContainedInCyclotomicTower (-5) 5 := by decide

end ContainedCase

end CMAllPrime
