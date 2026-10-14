/-
Integral Hecke actions, determinants and interpolation, Part II.
Compact statement sketch at Mathlib 082e2d3 and Tau Ceti f790474.

The reader contains the full seven-layer plan, including the tame and Siegel levels,
integral Hecke maps, factorization algebra, local Langlands and arithmetic determinant
constructions, their APIs and distinguishing tests. Those constructions are not developed
here. The definitions below are light expressions on existing polynomial/matrix carriers;
the theorems are algebraic end milestones for IHR.1, IHR.3, IHR.4 and IHR.7.

Sources: Allen et al., Ann. of Math. 197 (2023), (2.2.8), p. 925; (2.2.11)--(2.2.12),
pp. 926--927; Corollary 2.2.15, p. 930; (2.2.17)--(2.2.19), pp. 930--931;
local determinants in the proof of Proposition 3.1.2, p. 963.
This file checks that the statements elaborate; its open proofs are not formalisation.
-/
import Mathlib.RingTheory.Polynomial.Resultant.Basic
import Mathlib.Algebra.Polynomial.Reverse
import Mathlib.LinearAlgebra.Matrix.Charpoly.Basic
import Mathlib.LinearAlgebra.Charpoly.Basic
import Mathlib.LinearAlgebra.JordanChevalley

open Polynomial
open scoped BigOperators Polynomial

set_option autoImplicit false

namespace TauCeti.RamifiedHecke

noncomputable section

section PolynomialMilestones

variable {R : Type*} [CommRing R] {n : ℕ}

/-- The product expression underlying (2.2.8), in the commutative coefficient ring. -/
def rootPoly (a : Fin n → R) : R[X] := ∏ i, (X - C (a i))

/-- Scale every root by the unit h, retaining monicity at the specified degree d. -/
def scalePoly (d : ℕ) (h : Rˣ) (f : R[X]) : R[X] :=
  C ((h : R) ^ d) * f.comp (C ((h⁻¹ : Rˣ) : R) * X)

/-- The reciprocal normalization; a0 is the actual unit constant coefficient. -/
def reciprocalPoly (a0 : Rˣ) (f : R[X]) : R[X] :=
  C ((a0⁻¹ : Rˣ) : R) * f.reverse

/-- Keep the conjugate-v factor first and both Sylvester sizes explicit. -/
def siegelResultant (n : ℕ) (Pc P : R[X]) : R :=
  Polynomial.resultant Pc P n n

/-- IHR.1 polynomial milestone; degree needs a nontrivial coefficient ring. -/
theorem rootPoly_monic_degree [Nontrivial R] (a : Fin n → R) :
    (rootPoly a).Monic ∧ (rootPoly a).natDegree = n := sorry

/-- IHR.1 coefficient change works even when the target coefficient ring is zero. -/
theorem rootPoly_map {S : Type*} [CommRing S] (f : R →+* S) (a : Fin n → R) :
    (rootPoly a).map f = rootPoly (fun i => f (a i)) := sorry

/-- IHR.1 twisting and IHR.3 norm scaling have the same polynomial expression. -/
theorem scalePoly_roots (h : Rˣ) (a : Fin n → R) :
    scalePoly n h (rootPoly a) = rootPoly (fun i => (h : R) * a i) := sorry

/-- IHR.3 reciprocal polynomial: the unit constant coefficient includes (-1)^n. -/
theorem reciprocalPoly_roots (a : Fin n → Rˣ) :
    reciprocalPoly (((-1 : Rˣ) ^ n) * ∏ i, a i)
        (rootPoly (fun i => (a i : R))) =
      rootPoly (fun i => (((a i)⁻¹ : Rˣ) : R)) := sorry

/-- IHR.3 conjugate-inverse milestone. The outer projection reverses the roots;
    inverse Weil argument cancels inversion but leaves the norm factor h.
    For degree d=2n the arithmetic application takes h=‖σ‖^(d-1). -/
theorem conjugateInverse_scaled (h : Rˣ) (a : Fin n → R) (e : Fin n ≃ Fin n) :
    rootPoly (fun i => (h : R) * a (e i)) = scalePoly n h (rootPoly a) := sorry

/-- IHR.4 functoriality with fixed sizes, including coefficient maps to the zero ring. -/
theorem siegelResultant_map {S : Type*} [CommRing S] (f : R →+* S)
    (Pc P : R[X]) :
    f (siegelResultant n Pc P) = siegelResultant n (Pc.map f) (P.map f) := sorry

/-- IHR.4 unit criterion in the nontrivial case, where the sizes are natural degrees. -/
theorem isUnit_siegelResultant_iff [Nontrivial R] (Pc P : R[X])
    (hPc : Pc.Monic) (hP : P.Monic)
    (dPc : Pc.natDegree = n) (dP : P.natDegree = n) :
    IsUnit (siegelResultant n Pc P) ↔ IsCoprime Pc P := sorry

/-- The empty product is the monic rank-zero polynomial, over every ring. -/
example : rootPoly (n := 0) (fun i : Fin 0 => Fin.elim0 i) = (1 : R[X]) := by
  simp [rootPoly]

/-- The local rank-one polynomial. -/
example (a : R) : rootPoly (fun _ : Fin 1 => a) = X - C a := by
  simp [rootPoly]

/-- Ordered resultant: the conjugate root b is first, hence b-a. -/
example (a b : R) : siegelResultant 1 (X - C b) (X - C a) = b - a := sorry

/-- Unit constant coefficients give the inverse roots, with the alternating sign. -/
example (a : Rˣ) : reciprocalPoly (-a) (X - C (a : R)) =
    X - C ((a⁻¹ : Rˣ) : R) := sorry

/-- A normalized GL2 principal series with two trivial inducing characters has
    Frobenius root q^(1/2); the inverse-conjugate argument has root q^(-1/2).
    The root scaling is q^(-1), not an unscaled reciprocal formula in general. -/
example (u : ℚˣ) : scalePoly 2 (u⁻¹ ^ 2) (rootPoly (fun _ : Fin 2 => (u : ℚ))) =
    (X - C ((u⁻¹ : ℚˣ) : ℚ)) ^ 2 := sorry

end PolynomialMilestones

section MatrixMilestones

variable {R W : Type*} [CommRing R] [Group W] {n : ℕ}

/-- The existing matrix carrier of the local diagonal Weil representation.
    Its Chenevier determinant is a reader target using the IHG.0 carrier. -/
def localWeilMatrix (ψ : Fin n → (W →* Rˣ)) (σ : W) : Matrix (Fin n) (Fin n) R :=
  Matrix.diagonal (fun i => ((ψ i σ : Rˣ) : R))

/-- IHR.7 characteristic polynomial of the diagonal representation E_v. -/
theorem localWeilMatrix_charpoly (ψ : Fin n → (W →* Rˣ)) (σ : W) :
    (localWeilMatrix ψ σ).charpoly = rootPoly (fun i => ((ψ i σ : Rˣ) : R)) := sorry

/-- The multiplicativity needed for the diagonal representation is a matrix identity. -/
theorem localWeilMatrix_mul (ψ : Fin n → (W →* Rˣ)) (σ τ : W) :
    localWeilMatrix ψ (σ * τ) = localWeilMatrix ψ σ * localWeilMatrix ψ τ := sorry

/-- IHR.7 determinant twisting is scalar multiplication of the representation. -/
theorem localWeilMatrix_twist (ψ : Fin n → (W →* Rˣ)) (χ : W →* Rˣ) (σ : W) :
    localWeilMatrix (fun i => ψ i * χ) σ = (χ σ : R) • localWeilMatrix ψ σ := sorry

/-- IHR.4 end milestone behind Corollary 2.2.15, after Jordan--Chevalley.
    Coprimality separates the full primary components, not just distinct roots. -/
theorem charpoly_factor_range {K V : Type*} [Field K] [PerfectField K]
    [AddCommGroup V] [Module K V] [FiniteDimensional K V]
    (a s : Module.End K V) (f g : K[X])
    (hs : s.IsSemisimple) (hn : IsNilpotent (a - s)) (hc : Commute a s)
    (hchar : LinearMap.charpoly a = f * g) (hfg : IsCoprime f g) :
    LinearMap.range (aeval a f) = LinearMap.range (aeval s f) := sorry

end MatrixMilestones

/-
Reader-only targets (each fully stated with its API/tests in the reader):
IHR.1: tame levels, torus quotient, integral double-coset inverses and embedding,
       normalized Hecke operators, their Weil characters and Hecke polynomials.
IHR.2: tame principal-series criterion, centre, rec^T and spherical comparison.
IHR.3: Siegel and unitary levels, positive transfer, transferred polynomials and Satake.
IHR.4: ordered-factorization algebra, finite freeness and étale locus, WD/inertia relation.
IHR.5: derived ramified Hecke images, Satake homomorphism, twisting, duality, level change.
IHR.6: classical points, finite-family compact interpolation, compact support and boundary.
IHR.7: auxiliary characters, decomposed unitary level, reductions and determinant descent.
The concrete construction theory belongs to future Tau Ceti implementation work.
-/
end
end TauCeti.RamifiedHecke
