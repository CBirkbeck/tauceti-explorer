import Mathlib.CategoryTheory.CofilteredSystem
import Mathlib.RingTheory.WittVector.Frobenius

/-!
This file is not the roadmap and is not exhaustive. The companion reader document
is definitive. These statements suggest Lean forms so that contributors and
reviewers can converge on names and signatures.

At the recorded Mathlib and Tau Ceti pins, finite diagrams of types and Witt
Frobenius exist. Spectra, the Steenrod algebra, the spectral Adams resolution and
representation-twisted spectral cohomology do not. Their full targets, APIs and
tests are in the reader. This file introduces no replacement spectral carriers.

PO.3/finite-tower-pro-constant is the end theorem statable at these pins. The
image-equality formulation also covers empty stages and empty inverse limits.
It extends the existing eventual-range and surjective-system lemmas, rather than
redefining Mittag–Leffler systems. The examples at the end check the ordinary
Witt Frobenius convention used by PO.4/spherical-witt.
-/

open CategoryTheory

universe u

namespace PowerOperations

/-- Finite towers with finite limits are constant as pro-sets. The two displayed
conditions express a separating projection and eventual equality of images.
No surjectivity of the original transition maps is assumed.

Nikolaus–Scholze, Lemma III.1.8, Acta Math. 221 (2018), p. 289.
-/
theorem finite_tower_pro_constant (F : ℕᵒᵖ ⥤ Type u)
    [∀ n, Finite (F.obj n)] [Finite F.sections] :
    (∃ n : ℕ, Function.Injective
      (fun s : F.sections => s.val (Opposite.op n))) ∧
    (∀ n : ℕ, ∃ m : ℕ, ∃ h : n ≤ m,
      Set.range (F.map (homOfLE h).op) =
        Set.range (fun s : F.sections => s.val (Opposite.op n))) := by
  sorry

/-- The characteristic-p coefficient formula uses ordinary ring Frobenius. -/
example (p : ℕ) [Fact p.Prime] (R : Type u) [CommRing R] [CharP R p]
    (x : WittVector p R) (n : ℕ) :
    (WittVector.frobenius x).coeff n = x.coeff n ^ p := by
  exact WittVector.coeff_frobenius_charP p x n

/-- For the prime field the Witt Frobenius is the identity, as required by the
spherical Witt prime-field test. This is an existing baseline theorem. -/
example (p : ℕ) [Fact p.Prime] (x : WittVector p (ZMod p)) :
    WittVector.frobenius x = x := by
  exact WittVector.frobenius_zmodp p x

end PowerOperations
