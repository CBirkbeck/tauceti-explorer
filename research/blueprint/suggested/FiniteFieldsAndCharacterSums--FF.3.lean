import Mathlib.Algebra.Polynomial.FieldDivision
import Mathlib.Algebra.Polynomial.Monic
import Mathlib.Algebra.Squarefree.Basic
import Mathlib.FieldTheory.Finite.Basic
import Mathlib.FieldTheory.Perfect
import Mathlib.RingTheory.Polynomial.Basic
import Mathlib.RingTheory.UniqueFactorizationDomain.NormalizedFactors
import Mathlib.Data.ZMod.Basic

/-!
This file is not the roadmap and is not exhaustive. The roadmap document is definitive.
These suggested Lean forms help contributors and reviewers converge on names and signatures.
The declarations below are plans, not implementations or certified computations.

The accepted parent packet supplies the factorization, lifting, prime-polynomial and elliptic
point-count targets. This supplement states only new FF.3 declarations. In particular it does
not replace missing general geometric suppliers by proposition-valued dummy structures.
-/

noncomputable section
open Polynomial
open scoped BigOperators

namespace TauCeti.FiniteFieldSums

variable (F : Type*) [Field F] [Fintype F] [DecidableEq F]

/-- Prototype adapter for the PLANNED imported FF.2/monic-polynomials-of-degree carrier.
This is exactly the coefficient-vector body in the parent suggested file, not a new node.
Once the parent's module exists, replace this adapter by its import. The use of this elementary
census does not require the character-sum or cohomological material elsewhere in FF.2. -/
def monicOfDegree (n : ℕ) : Finset F[X] := by
  classical
  exact Finset.univ.image fun v : Fin n → F =>
    X ^ n + ((degreeLTEquiv F n).symm v : F[X])

/-- FF.3/monic-squarefree-polynomial-set. -/
def monicSquarefreeOfDegree (n : ℕ) : Finset F[X] := by
  classical
  exact (monicOfDegree F n).filter Squarefree

theorem mem_monicSquarefreeOfDegree {f : F[X]} {n : ℕ} :
    f ∈ monicSquarefreeOfDegree F n ↔ f.Monic ∧ f.natDegree = n ∧ Squarefree f := by
  sorry

theorem monicSquarefreeOfDegree_subset (n : ℕ) :
    monicSquarefreeOfDegree F n ⊆ monicOfDegree F n := by
  sorry

theorem mem_monicSquarefreeOfDegree_iff_separable {f : F[X]} {n : ℕ} :
    f ∈ monicSquarefreeOfDegree F n ↔ f.Monic ∧ f.natDegree = n ∧ f.Separable := by
  sorry

theorem monicSquarefreeOfDegree_zero : monicSquarefreeOfDegree F 0 = {1} := by
  sorry

theorem monicSquarefreeOfDegree_one :
    monicSquarefreeOfDegree F 1 = monicOfDegree F 1 := by
  sorry

/-- Unit test `monicSquarefree_degree_zero`. -/
example : monicSquarefreeOfDegree F 0 = {1} := by sorry

/-- Unit test `monicSquarefree_quadratics_f2`: split and irreducible squarefree quadratics. -/
example : monicSquarefreeOfDegree (ZMod 2) 2 =
    {X ^ 2 + X, X ^ 2 + X + 1} := by sorry

/-- Unit test `monicSquarefree_repeated_root_f2`: derivative zero is not squarefree. -/
example : (X ^ 2 + 1 : (ZMod 2)[X]) ∉ monicSquarefreeOfDegree (ZMod 2) 2 := by sorry

/-- Unit test `monicSquarefree_separable`: compare with the baseline notion. -/
example {n : ℕ} {f : F[X]} (_hf : f.Monic) (_hn : f.natDegree = n) :
    f ∈ monicSquarefreeOfDegree F n ↔ f.Separable := by sorry

/-- FF.3/unique-monic-squarefree-square-decomposition.
Mathlib already supplies generic existence. This is the monic normalized uniqueness and degree
statement. The squarefree factor and square factor may share irreducible factors. -/
theorem existsUnique_monic_squarefree_square {f : F[X]} (hf : f.Monic) :
    ∃! hm : F[X] × F[X],
      hm.1.Monic ∧ hm.2.Monic ∧ Squarefree hm.1 ∧
      f = hm.1 * hm.2 ^ 2 ∧ f.natDegree = hm.1.natDegree + 2 * hm.2.natDegree := by
  sorry

/-- FF.3/squarefree-square-degree-equivalence. The finite index enforces `2*j ≤ n`.
Both factors are subtypes of actual finite sets, and the target contains every monic polynomial. -/
def squarefreeSquareEquiv (n : ℕ) :
    (Σ j : Fin (n / 2 + 1),
      {h : F[X] // h ∈ monicSquarefreeOfDegree F (n - 2 * j.val)} ×
      {m : F[X] // m ∈ monicOfDegree F j.val}) ≃
    {f : F[X] // f ∈ monicOfDegree F n} := by
  sorry

theorem squarefreeSquareEquiv_apply {n : ℕ} (j : Fin (n / 2 + 1))
    (h : {h : F[X] // h ∈ monicSquarefreeOfDegree F (n - 2 * j.val)})
    (m : {m : F[X] // m ∈ monicOfDegree F j.val}) :
    (squarefreeSquareEquiv F n ⟨j, h, m⟩).val = h.val * m.val ^ 2 := by
  sorry

theorem squarefreeSquareEquiv_symm_degree {n : ℕ}
    (f : {f : F[X] // f ∈ monicOfDegree F n}) :
    ((squarefreeSquareEquiv F n).symm f).1.val =
      ((squarefreeSquareEquiv F n).symm f).2.2.val.natDegree := by
  sorry

theorem squarefreeSquareEquiv_symm_squarefree {n : ℕ}
    (f : {f : F[X] // f ∈ monicOfDegree F n}) :
    Squarefree ((squarefreeSquareEquiv F n).symm f).2.1.val ∧
      ((squarefreeSquareEquiv F n).symm f).2.1.val.natDegree =
        n - 2 * ((squarefreeSquareEquiv F n).symm f).1.val := by
  sorry

theorem squarefreeSquareEquiv_symm_eq {n : ℕ}
    (f : {f : F[X] // f ∈ monicOfDegree F n}) (j : Fin (n / 2 + 1))
    (h : {h : F[X] // h ∈ monicSquarefreeOfDegree F (n - 2 * j.val)})
    (m : {m : F[X] // m ∈ monicOfDegree F j.val}) :
    (squarefreeSquareEquiv F n).symm f = ⟨j, h, m⟩ ↔ f.val = h.val * m.val ^ 2 := by
  sorry

/-- Unit test `squarefreeSquareEquiv_zero`: membership witnesses are inputs, not fake data. -/
example (hh : (1 : F[X]) ∈ monicSquarefreeOfDegree F 0)
    (hm : (1 : F[X]) ∈ monicOfDegree F 0) :
    (squarefreeSquareEquiv F 0 ⟨⟨0, by decide⟩, ⟨1, hh⟩, ⟨1, hm⟩⟩).val = 1 := by sorry

/-- Unit test `squarefreeSquareEquiv_repeated_linear_f2`. -/
example (hh : (1 : (ZMod 2)[X]) ∈ monicSquarefreeOfDegree (ZMod 2) 0)
    (hm : (X + 1 : (ZMod 2)[X]) ∈ monicOfDegree (ZMod 2) 1) :
    (squarefreeSquareEquiv (ZMod 2) 2
      ⟨⟨1, by decide⟩, ⟨1, hh⟩, ⟨X + 1, hm⟩⟩).val = X ^ 2 + 1 := by sorry

/-- Unit test `squarefreeSquareEquiv_shared_factor`: requiring coprimality would lose `X³`. -/
example (hh : (X : (ZMod 2)[X]) ∈ monicSquarefreeOfDegree (ZMod 2) 1)
    (hm : (X : (ZMod 2)[X]) ∈ monicOfDegree (ZMod 2) 1) :
    (squarefreeSquareEquiv (ZMod 2) 3
      ⟨⟨1, by decide⟩, ⟨X, hh⟩, ⟨X, hm⟩⟩).val = X ^ 3 := by sorry

/-- FF.3/monic-squarefree-convolution. -/
theorem card_monic_eq_sum_squarefree (n : ℕ) :
    Fintype.card F ^ n = ∑ j ∈ Finset.range (n / 2 + 1),
      (monicSquarefreeOfDegree F (n - 2 * j)).card * Fintype.card F ^ j := by
  sorry

/-- FF.3/monic-squarefree-count-formula. The degree-one exception is essential. -/
theorem card_monicSquarefreeOfDegree (n : ℕ) :
    (monicSquarefreeOfDegree F n).card =
      if n = 0 then 1 else if n = 1 then Fintype.card F
      else Fintype.card F ^ n - Fintype.card F ^ (n - 1) := by
  sorry

example : (monicSquarefreeOfDegree (ZMod 2) 5).card = 16 := by sorry
example : (monicSquarefreeOfDegree (ZMod 3) 4).card = 54 := by sorry

/-- FF.3/hyperelliptic-presentation-polynomial-set: all nonzero leading coefficients,
both adjacent degrees, and no quotient by change of variables or by curve isomorphism. -/
def hyperellipticPolynomials (g : ℕ) : Finset F[X] := by
  classical
  exact ((Finset.univ : Finset Fˣ).product
    (monicSquarefreeOfDegree F (2 * g + 1) ∪
      monicSquarefreeOfDegree F (2 * g + 2))).image
    fun ah => C (ah.1 : F) * ah.2

theorem mem_hyperellipticPolynomials {g : ℕ} {f : F[X]} :
    f ∈ hyperellipticPolynomials F g ↔
      Squarefree f ∧ (f.natDegree = 2 * g + 1 ∨ f.natDegree = 2 * g + 2) := by
  sorry

theorem hyperellipticPolynomials_leadingCoeff_ne_zero {g : ℕ} {f : F[X]}
    (hf : f ∈ hyperellipticPolynomials F g) : f.leadingCoeff ≠ 0 := by
  sorry

theorem hyperellipticPolynomials_normalize {g : ℕ} {f : F[X]}
    (hf : f ∈ hyperellipticPolynomials F g) :
    normalize f ∈ (monicSquarefreeOfDegree F (2 * g + 1) ∪
      monicSquarefreeOfDegree F (2 * g + 2)) ∧
    f = C f.leadingCoeff * normalize f := by
  sorry

theorem hyperellipticPolynomials_scalar_iff {g : ℕ} {f : F[X]} {a : F} (ha : a ≠ 0) :
    C a * f ∈ hyperellipticPolynomials F g ↔ f ∈ hyperellipticPolynomials F g := by
  sorry

/-- Action laws use the existing polynomial multiplication, not a new action structure. -/
example (f : F[X]) : C (1 : F) * f = f := by sorry
example (a b : F) (f : F[X]) : C (a * b) * f = C a * (C b * f) := by sorry

theorem hyperellipticPolynomials_map (K : Type*) [Field K] [Fintype K] [DecidableEq K]
    (e : F ≃+* K) (g : ℕ) :
    (hyperellipticPolynomials F g).image (Polynomial.map e.toRingHom) =
      hyperellipticPolynomials K g := by
  sorry

/-- Identity and composition are the inherited `Polynomial.map` laws. -/
example (f : F[X]) : Polynomial.map (RingHom.id F) f = f := by sorry
example (K L : Type*) [Field K] [Field L] (e : F ≃+* K) (d : K ≃+* L) (f : F[X]) :
    Polynomial.map (e.trans d).toRingHom f =
      Polynomial.map d.toRingHom (Polynomial.map e.toRingHom f) := by sorry

/-- Unit test `hyperellipticPolynomials_f2_zero`. -/
example : hyperellipticPolynomials (ZMod 2) 0 =
    {X, X + 1, X ^ 2 + X, X ^ 2 + X + 1} := by sorry

/-- Unit test `hyperellipticPolynomials_nonmonic_f3`. -/
example : (C 2 * X : (ZMod 3)[X]) ∈ hyperellipticPolynomials (ZMod 3) 0 := by sorry

/-- Unit test `hyperellipticPolynomials_square_excluded`. -/
example : (X ^ 2 : (ZMod 3)[X]) ∉ hyperellipticPolynomials (ZMod 3) 0 := by sorry

/-- Unit test `hyperellipticPolynomials_zero_excluded`. -/
example (g : ℕ) : (0 : F[X]) ∉ hyperellipticPolynomials F g := by sorry

/-- FF.3/hyperelliptic-presentation-count. -/
theorem card_hyperellipticPolynomials (g : ℕ) :
    (hyperellipticPolynomials F g).card = (Fintype.card F - 1) *
      ((monicSquarefreeOfDegree F (2 * g + 1)).card +
        (monicSquarefreeOfDegree F (2 * g + 2)).card) ∧
    (hyperellipticPolynomials F g).card =
      if g = 0 then Fintype.card F ^ 2 * (Fintype.card F - 1)
      else (Fintype.card F - 1) *
        (Fintype.card F ^ (2 * g + 2) - Fintype.card F ^ (2 * g)) := by
  sorry

example : (hyperellipticPolynomials (ZMod 3) 0).card = 18 := by sorry
example : (hyperellipticPolynomials (ZMod 3) 1).card = 144 := by sorry
example : (hyperellipticPolynomials (ZMod 2) 1).card = 12 := by sorry

/-- FF.3/monic-prescribed-constant-count-boundary. Degree zero is the fiber of the unit `1`. -/
theorem card_monic_prescribed_constant (n : ℕ) (b : F) :
    ((monicOfDegree F n).filter fun f => f.coeff 0 = b).card =
      if n = 0 then (if b = 1 then 1 else 0) else Fintype.card F ^ (n - 1) := by
  sorry

example : ((monicOfDegree (ZMod 3) 0).filter fun f => f.coeff 0 = 1).card = 1 := by sorry
example : ((monicOfDegree (ZMod 3) 0).filter fun f => f.coeff 0 = 0).card = 0 := by sorry
example (b : ZMod 3) :
    ((monicOfDegree (ZMod 3) 1).filter fun f => f.coeff 0 = b).card = 1 := by sorry
example (b : ZMod 3) :
    ((monicOfDegree (ZMod 3) 2).filter fun f => f.coeff 0 = b).card = 3 := by sorry

end TauCeti.FiniteFieldSums
