import Mathlib.Algebra.MvPolynomial.CommRing
import Mathlib.Algebra.MvPolynomial.Eval
import Mathlib.LinearAlgebra.Matrix.Charpoly.Basic
import Mathlib.LinearAlgebra.Matrix.Notation
import Mathlib.Data.ZMod.Basic
import TauCeti.AlgebraicGeometry.AbelianVariety.Basic

/-!
# Siegel and PEL moduli problems, Part II

This file is not the roadmap and is not exhaustive. The definitive specification is
`research/blueprint/readmes/PELModuliPartII.md`. These statements suggest Lean forms
so contributors and reviewers can converge on names and signatures.

Mathlib pin: 082e2d37e8b0463410cdb532e111cd43d5a66174.
Tau Ceti pin: f790474821cf4256814db967cb154e7af3d0c369.

The binding WORKERS.md shape of 2026-10-12 keeps declarations over carriers present
at these pins. Strict polarized formal modules, relative displays, framed formal
schemes and integral abelian-pair stacks are README targets. None is replaced here
by unstructured data or an arbitrary proposition. Their complete statements, API,
tests and supplier requests are in the reader and packet. All implementation
statuses remain unchecked.

U0: principal-hermitian-module, signature-conjugation, relative-comparison-functor,
relative-local-model, relative-framed-comparison. The polynomial checks below only
check the signature convention; they do not construct Mihatsch's functor.
U1: unramified-rz, unramified-smoothness, rank-one-lift, special-hom,
product-embedding, diagonal-graph. Relative heights and dimensions are checked below.
U2: almost-self-dual-rz, almost-self-dual-geometry, split-special-hom,
mixed-framed-space, mixed-generic-projections. The mixed source is the conjugate
rank-one source; the isogeny degree q² and projection degree q+1 are different.
U3: exotic-relative, exotic-symmetrization, exotic-rz, exotic-smoothness,
rank-one-source, exotic-special-hom. The principal rank-one source is separate
from the even-rank category with nonprincipal exotic polarization.
U4: absolute-exotic, banal-display-contraction, exotic-relative-functor,
exotic-relative-equivalence, principal-source-comparison, exotic-framed-comparison.
The absolute-to-relative exotic equivalence assumes the ground field unramified.
U5: kramer-filtration, kramer-rank-one-source, kramer-rz, kramer-local-charts,
kramer-geometry, kramer-special-hom, kramer-dieudonne-space,
kramer-hom-comparison, kramer-framing-sign. Unit-compatible framings are required.
U6: rsz-datum, local-level-data, admissible-cm-type, cm-coefficient-unramified,
sign-condition, eisenstein-condition, auxiliary-cm-generic-comparison.
U7: localized-rsz, localized-smoothness, semiglobal-rsz,
unitary-local-model-diagram, semiglobal-local-types, split-drinfeld-level,
split-integral-geometry, ramified-kramer-model, ramified-global-geometry,
exotic-global-model, exotic-global-smoothness, global-integral-gluing.
U8: mixed-global-moduli, ltxzz-smooth-moduli, smooth-geometry-tangent,
ltxzz-asd-moduli, asd-completed-local-rings, asd-generic-datum,
integral-hecke-system. The chart checks below use actual polynomial rings.
U9: nearby-framing-datum, banal-local-factors, uniformization-morphism,
inert-uniformization, mixed-uniformization, kramer-formal-comparison,
exotic-uniformization, cm-partition-and-product. Their quotient spaces require the
formal representability and descent suppliers, so are stated in the reader.
-/

namespace TauCeti.PEL.Unitary.Checks

universe u

section Signature

variable {R : Type u} [CommRing R]

/-- U0/signature-conjugation: interchange both labeled embeddings and multiplicities. -/
theorem signature_conjugation (a b : R) (r s : ℕ) :
    (Polynomial.X - Polynomial.C a) ^ r * (Polynomial.X - Polynomial.C b) ^ s =
      (Polynomial.X - Polynomial.C b) ^ s * (Polynomial.X - Polynomial.C a) ^ r := by
  sorry

-- Rank-one structural and conjugate Lie characters remain distinct labels.
example (a b : R) :
    (Polynomial.X - Polynomial.C a) ^ 1 * (Polynomial.X - Polynomial.C b) ^ 0 =
      Polynomial.X - Polynomial.C a := by
  sorry

-- U2 mixed source: (1,n−1) + (0,1) = (1,n), here n=2.
example (a b : R) :
    ((Polynomial.X - Polynomial.C a) * (Polynomial.X - Polynomial.C b)) *
        (Polynomial.X - Polynomial.C b) =
      (Polynomial.X - Polynomial.C a) * (Polynomial.X - Polynomial.C b) ^ 2 := by
  sorry

end Signature

-- U0 relative K-height 2n; absolute p-height 2n[K:Q_p]; dimension n.
example : (2 * 3 : ℕ) * 2 = 12 := by decide
-- U1 diagonal: arithmetic dimension n−1 is half the arithmetic ambient dimension.
example : (2 * 4 - 2 : ℕ) = 2 * (4 - 1) := by decide
-- U2 and U8: the local polarization degree equation at q=3.
example : (9 : ℕ) ^ 2 = 9 * 9 := by decide
example : (3 : ℕ) ^ 2 ≠ 9 * 9 := by decide
example : (3 : ℕ) + 1 = 4 := by decide

/-- A literal Lie endomorphism for the determinant-versus-annihilation check. -/
def specialFiberJordan : Matrix (Fin 2) (Fin 2) (ZMod 3) := !![0, 1; 0, 0]

-- U0/U6: characteristic polynomial alone does not imply a zero endomorphism.
example : specialFiberJordan.charpoly = Polynomial.X ^ 2 := by
  sorry

example : specialFiberJordan ≠ 0 := by
  sorry

example : specialFiberJordan * specialFiberJordan = 0 := by
  sorry

-- U8 crossing equation and its special fibre, on existing polynomial carriers.
example {R : Type u} [CommRing R] (π x y : R) :
    MvPolynomial.eval ![x, y]
        ((MvPolynomial.X 0 * MvPolynomial.X 1 - MvPolynomial.C π) :
          MvPolynomial (Fin 2) R) = x * y - π := by
  sorry

example : MvPolynomial.eval ![(0 : ZMod 3), 1]
    ((MvPolynomial.X 0 * MvPolynomial.X 1) : MvPolynomial (Fin 2) (ZMod 3)) = 0 := by
  sorry

example : MvPolynomial.eval ![(1 : ZMod 3), 1]
    ((MvPolynomial.X 0 * MvPolynomial.X 1) : MvPolynomial (Fin 2) (ZMod 3)) ≠ 0 := by
  sorry

-- The existing field-valued carrier is imported directly. This gives no integral
-- abelian-scheme carrier and proves no assertion about the new integral models.
example {k : Type u} [Field k]
    (A : TauCeti.AlgebraicGeometry.AbelianVariety k) :
    AlgebraicGeometry.Smooth A.toOver.hom := by
  infer_instance

end TauCeti.PEL.Unitary.Checks
