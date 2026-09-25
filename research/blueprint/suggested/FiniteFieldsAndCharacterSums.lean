import Mathlib.Algebra.LinearRecurrence
import Mathlib.Algebra.MvPolynomial.PDeriv
import Mathlib.Algebra.Polynomial.Module.AEval
import Mathlib.Algebra.Squarefree.Basic
import Mathlib.AlgebraicGeometry.EllipticCurve.Affine.Point
import Mathlib.AlgebraicGeometry.EllipticCurve.DivisionPolynomial.Degree
import Mathlib.AlgebraicGeometry.EllipticCurve.NormalForms
import Mathlib.Analysis.Complex.Basic
import Mathlib.Analysis.Fourier.ZMod
import Mathlib.Analysis.SpecialFunctions.Complex.CircleAddChar
import Mathlib.Analysis.SpecialFunctions.Log.Base
import Mathlib.Analysis.SpecialFunctions.Pow.Real
import Mathlib.Combinatorics.SimpleGraph.AdjMatrix
import Mathlib.Data.Nat.Choose.Multinomial
import Mathlib.Data.Nat.Digits.Lemmas
import Mathlib.Data.Nat.Fib.Basic
import Mathlib.Data.ZMod.Basic
import Mathlib.Dynamics.PeriodicPts.Defs
import Mathlib.FieldTheory.AbsoluteGaloisGroup
import Mathlib.FieldTheory.Finite.Extension
import Mathlib.FieldTheory.Finite.GaloisField
import Mathlib.FieldTheory.Finite.Trace
import Mathlib.FieldTheory.Galois.NormalBasis
import Mathlib.FieldTheory.IsAlgClosed.AlgebraicClosure
import Mathlib.FieldTheory.IsAlgClosed.Basic
import Mathlib.FieldTheory.Minpoly.Basic
import Mathlib.FieldTheory.Perfect
import Mathlib.FieldTheory.RatFunc.AsPolynomial
import Mathlib.FieldTheory.RatFunc.Basic
import Mathlib.FieldTheory.RatFunc.Degree
import Mathlib.FieldTheory.Separable
import Mathlib.GroupTheory.GroupAction.Quotient
import Mathlib.GroupTheory.SpecificGroups.Cyclic
import Mathlib.InformationTheory.Hamming
import Mathlib.LinearAlgebra.BilinearForm.Orthogonal
import Mathlib.LinearAlgebra.Determinant
import Mathlib.LinearAlgebra.Dimension.Constructions
import Mathlib.LinearAlgebra.Eigenspace.Basic
import Mathlib.LinearAlgebra.Lagrange
import Mathlib.LinearAlgebra.Matrix.GeneralLinearGroup.Defs
import Mathlib.LinearAlgebra.Matrix.Rank
import Mathlib.LinearAlgebra.Matrix.ToLin
import Mathlib.MeasureTheory.Measure.CharacteristicFunction.Basic
import Mathlib.NumberTheory.ArithmeticFunction.Moebius
import Mathlib.NumberTheory.Cyclotomic.Gal
import Mathlib.NumberTheory.GaussSum
import Mathlib.NumberTheory.JacobiSum.Basic
import Mathlib.NumberTheory.LegendreSymbol.AddCharacter
import Mathlib.NumberTheory.LegendreSymbol.Complex
import Mathlib.NumberTheory.LegendreSymbol.QuadraticChar.Basic
import Mathlib.NumberTheory.MulChar.Basic
import Mathlib.NumberTheory.MulChar.Duality
import Mathlib.NumberTheory.NumberField.Cyclotomic.Ideal
import Mathlib.Probability.Distributions.Uniform
import Mathlib.Probability.ProbabilityMassFunction.Constructions
import Mathlib.Probability.ProductMeasure
import Mathlib.RingTheory.AdicCompletion.Basic
import Mathlib.RingTheory.AdjoinRoot
import Mathlib.RingTheory.Binomial
import Mathlib.RingTheory.Henselian
import Mathlib.RingTheory.KrullDimension.Basic
import Mathlib.RingTheory.LaurentSeries
import Mathlib.RingTheory.MvPolynomial.Homogeneous
import Mathlib.RingTheory.Norm.Basic
import Mathlib.RingTheory.Norm.Defs
import Mathlib.RingTheory.Polynomial.Basic
import Mathlib.RingTheory.Polynomial.Content
import Mathlib.RingTheory.Polynomial.Dickson
import Mathlib.RingTheory.Polynomial.Resultant.Basic
import Mathlib.RingTheory.PowerSeries.Basic
import Mathlib.RingTheory.PowerSeries.Derivative
import Mathlib.RingTheory.Radical.Basic
import Mathlib.RingTheory.RootsOfUnity.Basic
import Mathlib.RingTheory.TensorProduct.Maps
import Mathlib.RingTheory.Trace.Basic
import Mathlib.RingTheory.WittVector.Compare
import Mathlib.RingTheory.WittVector.Teichmuller
import Mathlib.RingTheory.WittVector.Truncated

/-
This file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/FiniteFieldsAndCharacterSums.md` is definitive. These
statements suggest Lean forms so that contributors and reviewers can converge on
names and signatures. They claim no implementation.

BP-FiniteFieldsAndCharacterSums: partial prototype, implementationStatus = unchecked.
Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.
The file imports Mathlib only and elaborates at the Mathlib pin: the only messages are
`declaration uses 'sorry'` warnings. Where a node uses a Tau Ceti declaration or an object
another roadmap owns, the section says so in a docstring and states locally only what the
prototype needs.

One section per layer, FF.0 to FF.5, in the order of the roadmap; later sections use the
declarations of earlier ones. What the pinned libraries already contain -- the classification
of finite fields, Frobenius, trace and norm, normal bases, additive and multiplicative
characters, Gauss and Jacobi sums with their identities, linear recurrences, Hamming distance --
is imported, not restated.
-/

-- ===== FF.0 =====

section FF0File

/-
Suggested Lean for FiniteFieldsAndCharacterSums, layer FF.0 (finite-field constructions).

This file is not the roadmap and is not exhaustive: the roadmap document is definitive. The
statements below suggest Lean forms so that contributors and reviewers converge on names and
signatures. Every proof is `sorry`; nothing here is claimed to be formalised.

Everything is prototyped against Mathlib only. The Tau Ceti declarations the packet cites
(`TauCeti.eq_frobeniusFixedSubfield_of_natCard`, the Frobenius-orbit lemmas of
`TauCeti/FieldTheory/Finite/MinpolyOrbit.lean`) enter only through proofs, so no Tau Ceti
module is imported here.
-/

namespace TauCeti.FiniteFieldSums

section FF0

open Polynomial

/-! ### The Frobenius power residue `X ^ (q ^ k) mod f` -/

section FrobeniusResidue

variable {F : Type*} [Field F] [Fintype F]

/-- The `k`-th Frobenius power residue of `f`: the remainder of `X ^ (q ^ k)` on division by the
monic `f`, computed by `k` successive `q`-th powers modulo `f` (`q = #F`). -/
noncomputable def frobResidue (f : F[X]) : ℕ → F[X]
  | 0 => X %ₘ f
  | k + 1 => (frobResidue f k) ^ Fintype.card F %ₘ f

theorem frobResidue_zero (f : F[X]) : frobResidue f 0 = X %ₘ f := rfl

theorem frobResidue_succ (f : F[X]) (k : ℕ) :
    frobResidue f (k + 1) = (frobResidue f k) ^ Fintype.card F %ₘ f := rfl

theorem frobResidue_eq_modByMonic {f : F[X]} (hf : f.Monic) (k : ℕ) :
    frobResidue f k = X ^ (Fintype.card F ^ k) %ₘ f := by
  sorry

theorem natDegree_frobResidue_lt {f : F[X]} (hf : f.Monic) (hf1 : f ≠ 1) (k : ℕ) :
    (frobResidue f k).natDegree < f.natDegree := by
  sorry

theorem mk_frobResidue {f : F[X]} (hf : f.Monic) (k : ℕ) :
    AdjoinRoot.mk f (frobResidue f k) = AdjoinRoot.root f ^ (Fintype.card F ^ k) := by
  sorry

theorem isCoprime_frobResidue_sub_X_iff {f : F[X]} (hf : f.Monic) (k : ℕ) :
    IsCoprime (frobResidue f k - X) f ↔ IsCoprime (X ^ (Fintype.card F ^ k) - X) f := by
  sorry

theorem dvd_frobResidue_sub_X_iff {f : F[X]} (hf : f.Monic) (k : ℕ) :
    f ∣ frobResidue f k - X ↔ f ∣ X ^ (Fintype.card F ^ k) - X := by
  sorry

/-- Composition rule (Shoup, Exercise 20.1(b)). -/
theorem frobResidue_add {f : F[X]} (hf : f.Monic) (k l : ℕ) :
    frobResidue f (k + l) = (frobResidue f l).comp (frobResidue f k) %ₘ f := by
  sorry

/-- Unit test `TauCeti.FiniteFieldSums.test_frobResidue_F2_quadratic`: over `𝔽₂`, the residue of
`X ^ 2` modulo `X ^ 2 + X + 1` is `X + 1`. -/
example : frobResidue (X ^ 2 + X + 1 : (ZMod 2)[X]) 1 = X + 1 := by
  sorry

/-- Unit test `TauCeti.FiniteFieldSums.test_frobResidue_F2_quadratic_two`: the residue of `X ^ 4`
modulo `X ^ 2 + X + 1` over `𝔽₂` is `X` (the Frobenius of `𝔽₄` has order `2`). -/
example : frobResidue (X ^ 2 + X + 1 : (ZMod 2)[X]) 2 = X := by
  sorry

/-- Unit test `TauCeti.FiniteFieldSums.test_frobResidue_modulus_X`: modulo `f = X` every residue
is `0`. -/
example (k : ℕ) : frobResidue (X : F[X]) k = 0 := by
  sorry

/-- Unit test `TauCeti.FiniteFieldSums.test_frobResidue_ne_pow`: the residue is not the literal
power: modulo `X ^ 2 + X + 1` over `𝔽₂`, the first residue is not `X ^ 2`. -/
example : frobResidue (X ^ 2 + X + 1 : (ZMod 2)[X]) 1 ≠ X ^ 2 := by
  sorry

/-- Unit test `TauCeti.FiniteFieldSums.test_frobResidue_irreducible`: for monic irreducible `f` of
degree `n`, the `n`-th residue is the residue of `X`. -/
example {f : F[X]} (hf : f.Monic) (hirr : Irreducible f) :
    frobResidue f f.natDegree = X %ₘ f := by
  sorry

end FrobeniusResidue

/-! ### Rabin's irreducibility criterion and its certificate -/

section Rabin

variable {F : Type*} [Field F] [Fintype F]

/-- **Rabin's irreducibility criterion** (Shoup, Exercise 20.2(a)). A monic `f` of degree `n > 0`
over a finite field with `q` elements is irreducible iff `f ∣ X ^ (q ^ n) - X` and
`X ^ (q ^ (n / s)) - X` is coprime to `f` for every prime `s ∣ n`. -/
theorem rabin_irreducible_iff {f : F[X]} (hf : f.Monic) (hn : 0 < f.natDegree) :
    Irreducible f ↔
      f ∣ X ^ (Fintype.card F ^ f.natDegree) - X ∧
        ∀ s ∈ f.natDegree.primeFactors,
          IsCoprime (X ^ (Fintype.card F ^ (f.natDegree / s)) - X) f := by
  sorry

/-- The same criterion stated on Frobenius power residues, the form a checker evaluates. -/
theorem rabin_irreducible_iff_frobResidue {f : F[X]} (hf : f.Monic) (hn : 0 < f.natDegree) :
    Irreducible f ↔
      frobResidue f f.natDegree = X %ₘ f ∧
        ∀ s ∈ f.natDegree.primeFactors, IsCoprime (frobResidue f (f.natDegree / s) - X) f := by
  sorry

/-- A Rabin certificate for `f`: Bézout cofactors `(u s, v s)` for each prime `s` dividing
`natDegree f`. Values at other indices are ignored. -/
structure RabinCertificate (f : F[X]) where
  /-- The Bézout cofactors, indexed by primes `s ∣ natDegree f`. -/
  bezout : ℕ → F[X] × F[X]

namespace RabinCertificate

variable [DecidableEq F] {f : F[X]}

/-- The checker: `f` monic of positive degree, `X ^ (q ^ n) ≡ X (mod f)` on residues, and
`u s * (frobResidue f (n / s) - X) + v s * f = 1` for each prime `s ∣ n`. The equality tests are
decidable over a field with decidable equality; an executable refinement on dense coefficient
arrays belongs to `ComputationalNumberTheory:CN.0`. -/
noncomputable def check (c : RabinCertificate f) : Bool :=
  decide (f.leadingCoeff = 1 ∧ 0 < f.natDegree ∧ frobResidue f f.natDegree = X %ₘ f ∧
    ∀ s ∈ f.natDegree.primeFactors,
      (c.bezout s).1 * (frobResidue f (f.natDegree / s) - X) + (c.bezout s).2 * f = 1)

theorem check_iff (c : RabinCertificate f) :
    c.check = true ↔
      (f.Monic ∧ 0 < f.natDegree ∧ frobResidue f f.natDegree = X %ₘ f ∧
        ∀ s ∈ f.natDegree.primeFactors,
          (c.bezout s).1 * (frobResidue f (f.natDegree / s) - X) + (c.bezout s).2 * f = 1) := by
  sorry

/-- Soundness: an accepted certificate proves irreducibility. -/
theorem irreducible_of_check (c : RabinCertificate f) (h : c.check = true) : Irreducible f := by
  sorry

/-- The canonical certificate of an irreducible polynomial: Bézout cofactors from the extended
Euclidean algorithm. -/
noncomputable def ofIrreducible (f : F[X]) : RabinCertificate f where
  bezout s :=
    (EuclideanDomain.gcdA (frobResidue f (f.natDegree / s) - X) f,
      EuclideanDomain.gcdB (frobResidue f (f.natDegree / s) - X) f)

theorem check_ofIrreducible (hf : f.Monic) (hirr : Irreducible f) : (ofIrreducible f).check = true := by
  sorry

/-- Completeness: every monic irreducible polynomial has an accepted certificate. -/
theorem exists_check_of_irreducible (hf : f.Monic) (hirr : Irreducible f) :
    ∃ c : RabinCertificate f, c.check = true :=
  ⟨ofIrreducible f, check_ofIrreducible hf hirr⟩

end RabinCertificate

/-- Unit test `TauCeti.FiniteFieldSums.test_rabinCertificate_F2_quadratic`: `X ^ 2 + X + 1` over
`𝔽₂` with cofactors `(1, 0)` at `s = 2` is accepted (`X ^ 2 - X ≡ 1` modulo `f`). -/
example : (⟨fun _ => (1, 0)⟩ : RabinCertificate (X ^ 2 + X + 1 : (ZMod 2)[X])).check = true := by
  sorry

/-- Unit test `TauCeti.FiniteFieldSums.test_rabinCertificate_constant`: the constant polynomial
`1` has no accepted certificate. -/
example (c : RabinCertificate (1 : F[X])) [DecidableEq F] : c.check = false := by
  sorry

/-- Unit test `TauCeti.FiniteFieldSums.test_rabinCertificate_square_rejected`: the square
`(X ^ 2 + X + 1) ^ 2` over `𝔽₂` is rejected by every certificate (the divisibility check fails). -/
example (c : RabinCertificate ((X ^ 2 + X + 1) ^ 2 : (ZMod 2)[X])) : c.check = false := by
  sorry

/-- Unit test `TauCeti.FiniteFieldSums.test_rabinCertificate_product_rejected`: the product
`(X ^ 2 + X + 1) * (X ^ 3 + X + 1)` of degree `5` over `𝔽₂` satisfies the coprimality condition at
`s = 5` but every certificate is rejected: the coprimality part alone is not a certificate. -/
example (c : RabinCertificate ((X ^ 2 + X + 1) * (X ^ 3 + X + 1) : (ZMod 2)[X])) :
    IsCoprime (X ^ (2 ^ 1) - X) ((X ^ 2 + X + 1) * (X ^ 3 + X + 1) : (ZMod 2)[X]) ∧
      c.check = false := by
  sorry

/-- Unit test `TauCeti.FiniteFieldSums.test_rabinCertificate_compat`: the canonical certificate of
a monic irreducible polynomial is accepted. -/
example [DecidableEq F] {f : F[X]} (hf : f.Monic) (hirr : Irreducible f) :
    (RabinCertificate.ofIrreducible f).check = true :=
  RabinCertificate.check_ofIrreducible hf hirr

end Rabin

/-! ### Certified presentations and comparison isomorphisms -/

section Presentation

variable (F : Type*) [Field F] [Fintype F] [DecidableEq F]

/-- A certified presentation of the finite field `K` over the finite field `F`: a monic `f` with
an accepted Rabin certificate, a root `α ∈ K` of `f`, and `[K : F] = deg f`. -/
structure CertifiedPresentation (K : Type*) [Field K] [Algebra F K] where
  /-- The defining polynomial. -/
  poly : F[X]
  /-- Its Rabin certificate. -/
  cert : RabinCertificate poly
  cert_check : cert.check = true
  /-- The image of `X`. -/
  root : K
  aeval_root : aeval root poly = 0
  finrank_eq : Module.finrank F K = poly.natDegree

namespace CertifiedPresentation

variable {F} {K : Type*} [Field K] [Algebra F K] (P : CertifiedPresentation F K)

theorem monic : P.poly.Monic := by
  sorry

theorem irreducible : Irreducible P.poly :=
  RabinCertificate.irreducible_of_check P.cert P.cert_check

theorem minpoly_root : minpoly F P.root = P.poly := by
  sorry

/-- The power basis `1, α, …, α ^ (n - 1)` of `K`. -/
noncomputable def powerBasis (P : CertifiedPresentation F K) : PowerBasis F K := by
  sorry

/-- The presentation isomorphism `F[X]/(f) ≃ₐ[F] K`, `X ↦ α`, with explicit inverse given by
power-basis coordinates. -/
noncomputable def equiv (P : CertifiedPresentation F K) : AdjoinRoot P.poly ≃ₐ[F] K := by
  sorry

theorem equiv_root : P.equiv (AdjoinRoot.root P.poly) = P.root := by
  sorry

theorem equiv_symm_apply (x : K) :
    P.equiv.symm x = AdjoinRoot.mk P.poly
      (∑ i : Fin P.powerBasis.dim, C (P.powerBasis.basis.repr x i) * X ^ (i : ℕ)) := by
  sorry

theorem card [Fintype K] : Fintype.card K = Fintype.card F ^ P.poly.natDegree := by
  sorry

/-- Frobenius in the presentation: `α ^ q` is the image of the first Frobenius residue. -/
theorem root_pow_card :
    P.root ^ Fintype.card F = aeval P.root (frobResidue P.poly 1) := by
  sorry

theorem trace_root :
    Algebra.trace F K P.root = -P.poly.nextCoeff := by
  sorry

theorem norm_root :
    Algebra.norm F P.root = (-1) ^ P.poly.natDegree * P.poly.coeff 0 := by
  sorry

theorem exists_presentation [Finite K] : Nonempty (CertifiedPresentation F K) := by
  sorry

end CertifiedPresentation

/-- Unit test `TauCeti.FiniteFieldSums.test_certifiedPresentation_F4`: a presentation of
`GaloisField 2 2` by `X ^ 2 + X + 1` sends the class of `X + 1` to `α + 1`. -/
example (P : CertifiedPresentation (ZMod 2) (GaloisField 2 2))
    (hP : P.poly = X ^ 2 + X + 1) :
    P.equiv (AdjoinRoot.mk P.poly (X + 1)) = P.root + 1 := by
  sorry

/-- Unit test `TauCeti.FiniteFieldSums.test_certifiedPresentation_degree_one`: the degree-one
presentation `X - a` of `F` over itself has inverse `x ↦ C x`. -/
example (P : CertifiedPresentation F F) (h : P.poly.natDegree = 1) (x : F) :
    P.equiv.symm x = AdjoinRoot.mk P.poly (C x) := by
  sorry

/-- Unit test `TauCeti.FiniteFieldSums.test_certifiedPresentation_card`: a presentation of
`GaloisField p n` has a defining polynomial of degree `n`. -/
example (p n : ℕ) [Fact p.Prime] (hn : n ≠ 0)
    (P : CertifiedPresentation (ZMod p) (GaloisField p n)) : P.poly.natDegree = n := by
  sorry

/-- Unit test `TauCeti.FiniteFieldSums.test_certifiedPresentation_X4_plus_1`: `X ^ 4 + 1` is
reducible over every prime field (Shoup, Exercise 19.13), so no certificate for it is accepted. -/
example (p : ℕ) [Fact p.Prime] (c : RabinCertificate (X ^ 4 + 1 : (ZMod p)[X])) :
    c.check = false := by
  sorry

/-- Unit test `TauCeti.FiniteFieldSums.test_certifiedPresentation_minpoly`: the root of a
presentation has the defining polynomial as minimal polynomial (so the root generates `K`). -/
example {K : Type*} [Field K] [Algebra F K] (P : CertifiedPresentation F K) :
    minpoly F P.root = P.poly :=
  P.minpoly_root

/-- A root certificate for embedding `F[X]/(f)` into `F[X]/(g)`: `f(b) ≡ 0 (mod g)`. -/
noncomputable def embeddingOfRoot {f g : F[X]} (b : F[X]) (hb : g ∣ f.comp b) :
    AdjoinRoot f →ₐ[F] AdjoinRoot g :=
  AdjoinRoot.liftAlgHom f (Algebra.ofId F (AdjoinRoot g)) (AdjoinRoot.mk g b) (by
    sorry)

theorem embeddingOfRoot_root {f g : F[X]} (b : F[X]) (hb : g ∣ f.comp b) :
    embeddingOfRoot F b hb (AdjoinRoot.root f) = AdjoinRoot.mk g b := by
  sorry

theorem embeddingOfRoot_mk {f g : F[X]} (b : F[X]) (hb : g ∣ f.comp b) (h : F[X]) :
    embeddingOfRoot F b hb (AdjoinRoot.mk f h) = AdjoinRoot.mk g (h.comp b) := by
  sorry

/-- A root certificate exists exactly when the degree divides. -/
theorem exists_root_iff_dvd {f g : F[X]} (hf : Irreducible f) (hg : Irreducible g) :
    (∃ b : F[X], g ∣ f.comp b) ↔ f.natDegree ∣ g.natDegree := by
  sorry

/-- The image of the embedding is the fixed field of the `q ^ m`-power map (`m = deg f`). -/
theorem mem_range_embeddingOfRoot_iff {f g : F[X]} (hf : Irreducible f) (hg : Irreducible g)
    (b : F[X]) (hb : g ∣ f.comp b) (y : AdjoinRoot g) :
    y ∈ (embeddingOfRoot F b hb).range ↔ y ^ (Fintype.card F ^ f.natDegree) = y := by
  sorry

/-- The roots of `f` in `F[X]/(g)` are the Frobenius conjugates of one root. -/
theorem roots_eq_frobenius_orbit {f g : F[X]} (hf : Irreducible f) (hg : Irreducible g)
    (b : F[X]) (hb : g ∣ f.comp b) (c : F[X]) :
    g ∣ f.comp c ↔
      ∃ i < f.natDegree, AdjoinRoot.mk g c = (AdjoinRoot.mk g b) ^ (Fintype.card F ^ i) := by
  sorry

theorem card_algHom_adjoinRoot {f g : F[X]} (hf : Irreducible f) (hg : Irreducible g)
    (hfg : f.natDegree ∣ g.natDegree) :
    haveI := Fact.mk hf; haveI := Fact.mk hg
    Nat.card (AdjoinRoot f →ₐ[F] AdjoinRoot g) = f.natDegree := by
  sorry

/-- Unit test `TauCeti.FiniteFieldSums.test_embeddingOfRoot_F4_F16`: `Y ^ 2 + Y` is a root of
`X ^ 2 + X + 1` modulo `Y ^ 4 + Y + 1` over `𝔽₂`. -/
example : (X ^ 4 + X + 1 : (ZMod 2)[X]) ∣ (X ^ 2 + X + 1 : (ZMod 2)[X]).comp (X ^ 2 + X) := by
  sorry

/-- Unit test `TauCeti.FiniteFieldSums.test_embeddingOfRoot_no_root`: `X ^ 2 + X + 1` has no root
modulo `X ^ 3 + X + 1` over `𝔽₂`, since `2 ∤ 3`. -/
example (b : (ZMod 2)[X]) :
    ¬ (X ^ 3 + X + 1 : (ZMod 2)[X]) ∣ (X ^ 2 + X + 1 : (ZMod 2)[X]).comp b := by
  sorry

/-- Unit test `TauCeti.FiniteFieldSums.test_embeddingOfRoot_identity`: `b = X` with `g = f` gives
the identity. -/
example (f : F[X]) (h : f ∣ f.comp X) (y : AdjoinRoot f) : embeddingOfRoot F X h y = y := by
  sorry

/-- Unit test `TauCeti.FiniteFieldSums.test_embeddingOfRoot_conrad`: over `𝔽₇`, `Y ^ 2 + Y + 2` is
a root of `X ^ 3 + X ^ 2 + 6 X + 5` modulo `Y ^ 3 - 2` (Conrad, Example 3.8). -/
example : (X ^ 3 - 2 : (ZMod 7)[X]) ∣
    (X ^ 3 + X ^ 2 + 6 * X + 5 : (ZMod 7)[X]).comp (X ^ 2 + X + 2) := by
  sorry

/-- A change-of-presentation certificate `(b, c)`: `f(b) ≡ 0 (mod g)`, `g(c) ≡ 0 (mod f)` and
`b(c) ≡ X (mod f)`; it gives mutually inverse isomorphisms `X ↦ b`, `Y ↦ c`. -/
noncomputable def presentationChange {f g : F[X]} (hf : Irreducible f) (hg : Irreducible g)
    (b c : F[X]) (hb : g ∣ f.comp b) (hc : f ∣ g.comp c) (hbc : f ∣ b.comp c - X) :
    AdjoinRoot f ≃ₐ[F] AdjoinRoot g := by
  sorry

theorem presentationChange_root {f g : F[X]} (hf : Irreducible f) (hg : Irreducible g)
    (b c : F[X]) (hb : g ∣ f.comp b) (hc : f ∣ g.comp c) (hbc : f ∣ b.comp c - X) :
    presentationChange F hf hg b c hb hc hbc (AdjoinRoot.root f) = AdjoinRoot.mk g b := by
  sorry

theorem presentationChange_symm_root {f g : F[X]} (hf : Irreducible f) (hg : Irreducible g)
    (b c : F[X]) (hb : g ∣ f.comp b) (hc : f ∣ g.comp c) (hbc : f ∣ b.comp c - X) :
    (presentationChange F hf hg b c hb hc hbc).symm (AdjoinRoot.root g) = AdjoinRoot.mk f c := by
  sorry

/-- The reverse congruence `c(b) ≡ Y (mod g)` follows from the three checked ones. -/
theorem presentationChange_comp_self {f g : F[X]} (hf : Irreducible f) (hg : Irreducible g)
    (b c : F[X]) (hb : g ∣ f.comp b) (hc : f ∣ g.comp c) (hbc : f ∣ b.comp c - X) :
    g ∣ c.comp b - X := by
  sorry

theorem exists_presentationChange {f g : F[X]} (hf : Irreducible f) (hg : Irreducible g)
    (hfg : f.natDegree = g.natDegree) :
    ∃ b c : F[X], g ∣ f.comp b ∧ f ∣ g.comp c ∧ f ∣ b.comp c - X := by
  sorry

/-- Change certificates compose: `(b, c)` from `f` to `g` and `(b', c')` from `g` to `h` give the
composite isomorphism, which sends `X` to `b(b')`. -/
theorem presentationChange_trans {f g h : F[X]} (hf : Irreducible f) (hg : Irreducible g)
    (hh : Irreducible h) (b c b' c' : F[X]) (hb : g ∣ f.comp b) (hc : f ∣ g.comp c)
    (hbc : f ∣ b.comp c - X) (hb' : h ∣ g.comp b') (hc' : g ∣ h.comp c')
    (hbc' : g ∣ b'.comp c' - X) :
    ((presentationChange F hf hg b c hb hc hbc).trans
        (presentationChange F hg hh b' c' hb' hc' hbc')) (AdjoinRoot.root f) =
      AdjoinRoot.mk h (b.comp b') := by
  sorry

/-- Unit test `TauCeti.FiniteFieldSums.test_presentationChange_refl`: `b = c = X` is a certificate
from `f` to itself. -/
example (f : F[X]) : f ∣ f.comp X ∧ f ∣ (X : F[X]).comp X - X := by
  sorry

/-- Unit test `TauCeti.FiniteFieldSums.test_presentationChange_inverse_needed`: over `𝔽₇`, `2 X`
is a root of `X ^ 3 - 2` modulo itself but `(2 X, 2 X)` is not a change certificate, because
`(2 X)(2 X) = 4 X ≢ X`. -/
example : (X ^ 3 - 2 : (ZMod 7)[X]) ∣ (X ^ 3 - 2 : (ZMod 7)[X]).comp (2 * X) ∧
    ¬ (X ^ 3 - 2 : (ZMod 7)[X]) ∣ (2 * X : (ZMod 7)[X]).comp (2 * X) - X := by
  sorry

/-- Unit test `TauCeti.FiniteFieldSums.test_presentationChange_F9`: over `𝔽₃`, `X + 1` is a root
of `X ^ 2 + X + 2` modulo `X ^ 2 + 1`, and `X + 2` is a root of `X ^ 2 + 1` modulo
`X ^ 2 + X + 2`; they are mutually inverse. -/
example : (X ^ 2 + 1 : (ZMod 3)[X]) ∣ (X ^ 2 + X + 2 : (ZMod 3)[X]).comp (X + 1) ∧
    (X ^ 2 + X + 2 : (ZMod 3)[X]) ∣ (X ^ 2 + 1 : (ZMod 3)[X]).comp (X + 2) ∧
    (X ^ 2 + X + 2 : (ZMod 3)[X]) ∣ (X + 1 : (ZMod 3)[X]).comp (X + 2) - X := by
  sorry

/-- Unit test `TauCeti.FiniteFieldSums.test_presentationChange_conrad_F343`: over `𝔽₇`, with
`f = X ^ 3 + X ^ 2 + 6 X + 5` and `g = X ^ 3 - 2`, the pair `b = X ^ 2 + X + 2` (Conrad,
Example 3.8) and `c = X ^ 2 + 2 X + 2` is a change-of-presentation certificate. -/
example : (X ^ 3 - 2 : (ZMod 7)[X]) ∣ (X ^ 3 + X ^ 2 + 6 * X + 5 : (ZMod 7)[X]).comp (X ^ 2 + X + 2) ∧
    (X ^ 3 + X ^ 2 + 6 * X + 5 : (ZMod 7)[X]) ∣ (X ^ 3 - 2 : (ZMod 7)[X]).comp (X ^ 2 + 2 * X + 2) ∧
    (X ^ 3 + X ^ 2 + 6 * X + 5 : (ZMod 7)[X]) ∣
      (X ^ 2 + X + 2 : (ZMod 7)[X]).comp (X ^ 2 + 2 * X + 2) - X := by
  sorry

end Presentation

/-! ### Factorisation over an extension and the tensor product of finite fields -/

section Tensor

variable {F : Type*} [Field F] [Fintype F]

/-- **Factorisation over an extension** (Shoup, Exercise 19.9). A monic irreducible `f` of degree
`k` over `F` splits over an extension `E` of degree `ℓ` into `gcd(k, ℓ)` distinct monic
irreducible factors, each of degree `k / gcd(k, ℓ)`. -/
theorem factorization_over_extension (E : Type*) [Field E] [Algebra F E] [Finite E]
    {f : F[X]} (hf : f.Monic) (hirr : Irreducible f) :
    ∃ s : Finset E[X],
      s.card = Nat.gcd f.natDegree (Module.finrank F E) ∧
      (∀ g ∈ s, g.Monic ∧ Irreducible g ∧
        g.natDegree = f.natDegree / Nat.gcd f.natDegree (Module.finrank F E)) ∧
      ∏ g ∈ s, g = f.map (algebraMap F E) := by
  sorry

open scoped TensorProduct

variable (F) (K L M : Type*) [Field K] [Field L] [Field M] [Algebra F K] [Algebra F L]
  [Algebra F M] [Finite K] [Finite L] [Finite M]

/-- **Tensor product of finite fields.** With `m = [K : F]`, `n = [L : F]`, `d = gcd(m, n)`, `M`
of degree `lcm(m, n)` and embeddings `ιK`, `ιL`, the map
`a ⊗ b ↦ (φ ^ i (ιK a) * ιL b)_{i < d}` (`φ` the `q`-power Frobenius of `M`) is an isomorphism. -/
noncomputable def tensorProductEquiv (ιK : K →ₐ[F] M) (ιL : L →ₐ[F] M)
    (hM : Module.finrank F M = Nat.lcm (Module.finrank F K) (Module.finrank F L)) :
    K ⊗[F] L ≃ₐ[F] (Fin (Nat.gcd (Module.finrank F K) (Module.finrank F L)) → M) := by
  sorry

theorem tensorProductEquiv_tmul (ιK : K →ₐ[F] M) (ιL : L →ₐ[F] M)
    (hM : Module.finrank F M = Nat.lcm (Module.finrank F K) (Module.finrank F L))
    (a : K) (b : L) (i : Fin (Nat.gcd (Module.finrank F K) (Module.finrank F L))) :
    tensorProductEquiv F K L M ιK ιL hM (a ⊗ₜ b) i =
      (ιK a) ^ (Fintype.card F ^ (i : ℕ)) * ιL b := by
  sorry

theorem finrank_tensorProduct_fields :
    Module.finrank F (K ⊗[F] L) = Module.finrank F K * Module.finrank F L := by
  sorry

theorem isField_tensorProduct_iff :
    IsField (K ⊗[F] L) ↔ Nat.Coprime (Module.finrank F K) (Module.finrank F L) := by
  sorry

/-- Existence for every target `M` of degree `lcm(m, n)` (the embeddings exist by
`FiniteField.nonempty_algHom_iff_finrank_dvd`). -/
theorem exists_tensorProductEquiv
    (hM : Module.finrank F M = Nat.lcm (Module.finrank F K) (Module.finrank F L)) :
    Nonempty (K ⊗[F] L ≃ₐ[F]
      (Fin (Nat.gcd (Module.finrank F K) (Module.finrank F L)) → M)) := by
  sorry

/-- The number of minimal idempotents (equivalently, maximal ideals) of `K ⊗[F] L` is
`gcd(m, n)`. -/
theorem card_maximalIdeals_tensorProduct :
    Nat.card {I : Ideal (K ⊗[F] L) // I.IsMaximal} =
      Nat.gcd (Module.finrank F K) (Module.finrank F L) := by
  sorry

/-- Unit test `TauCeti.FiniteFieldSums.test_tensorProduct_F4_F4`: `𝔽₄ ⊗ 𝔽₄ ≅ 𝔽₄ × 𝔽₄`. -/
example : Nonempty (GaloisField 2 2 ⊗[ZMod 2] GaloisField 2 2 ≃ₐ[ZMod 2]
    (Fin 2 → GaloisField 2 2)) := by
  sorry

/-- Unit test `TauCeti.FiniteFieldSums.test_tensorProduct_F4_F8_isField`: `𝔽₄ ⊗ 𝔽₈` is a field
(isomorphic to `𝔽₆₄`). -/
example : IsField (GaloisField 2 2 ⊗[ZMod 2] GaloisField 2 3) := by
  sorry

/-- Unit test `TauCeti.FiniteFieldSums.test_tensorProduct_base`: `K ⊗[F] F ≅ K`. -/
example : Nonempty (K ⊗[F] F ≃ₐ[F] (Fin (Nat.gcd (Module.finrank F K) (Module.finrank F F)) → K)) := by
  sorry

/-- Unit test `TauCeti.FiniteFieldSums.test_tensorProduct_not_field`: `𝔽₄ ⊗ 𝔽₄` is not a field. -/
example : ¬ IsField (GaloisField 2 2 ⊗[ZMod 2] GaloisField 2 2) := by
  sorry

/-- Unit test `TauCeti.FiniteFieldSums.test_tensorProduct_finrank`: the dimensions agree,
`m n = gcd(m, n) · lcm(m, n)`. -/
example : Module.finrank F (K ⊗[F] L) =
    Nat.gcd (Module.finrank F K) (Module.finrank F L) *
      Nat.lcm (Module.finrank F K) (Module.finrank F L) := by
  sorry

end Tensor

/-! ### Normal bases -/

section NormalBasis

variable (K : Type*) {L : Type*} [Field K] [Fintype K] [Field L] [Algebra K L] [Finite L]

/-- The minimal polynomial of `α` under the Frobenius `σ` (Shoup §18.6): the monic generator of
`{g ∈ K[X] : g(σ)(α) = 0}`. -/
noncomputable def frobeniusMinpoly (α : L) : K[X] := by
  sorry

theorem frobeniusMinpoly_monic (α : L) : (frobeniusMinpoly K α).Monic := by
  sorry

theorem aeval_frobeniusMinpoly (α : L) :
    aeval (FiniteField.frobeniusAlgHom K L).toLinearMap (frobeniusMinpoly K α) α = 0 := by
  sorry

theorem frobeniusMinpoly_dvd_iff (α : L) (g : K[X]) :
    frobeniusMinpoly K α ∣ g ↔ aeval (FiniteField.frobeniusAlgHom K L).toLinearMap g α = 0 := by
  sorry

theorem frobeniusMinpoly_dvd_X_pow_sub_one (α : L) :
    frobeniusMinpoly K α ∣ X ^ Module.finrank K L - 1 := by
  sorry

theorem natDegree_frobeniusMinpoly (α : L) :
    (frobeniusMinpoly K α).natDegree =
      Module.finrank K (Submodule.span K
        (Set.range fun i : ℕ => (FiniteField.frobeniusAlgHom K L)^[i] α)) := by
  sorry

theorem frobeniusMinpoly_zero : frobeniusMinpoly K (0 : L) = 1 := by
  sorry

theorem frobeniusMinpoly_algebraMap {a : K} (ha : a ≠ 0) :
    frobeniusMinpoly K (algebraMap K L a) = X - 1 := by
  sorry

/-- Unit test `TauCeti.FiniteFieldSums.test_frobeniusMinpoly_one`: `1` has Frobenius minimal
polynomial `X - 1`. -/
example : frobeniusMinpoly K (1 : L) = X - 1 := by
  sorry

/-- Unit test `TauCeti.FiniteFieldSums.test_frobeniusMinpoly_zero`: `0` has Frobenius minimal
polynomial `1`. -/
example : frobeniusMinpoly K (0 : L) = 1 :=
  frobeniusMinpoly_zero K

/-- Unit test `TauCeti.FiniteFieldSums.test_frobeniusMinpoly_F4`: a root `ω` of `X ^ 2 + X + 1` in
`𝔽₄` has Frobenius minimal polynomial `X ^ 2 - 1` over `𝔽₂`. -/
example (ω : GaloisField 2 2) (hω : ω ^ 2 + ω + 1 = 0) :
    frobeniusMinpoly (ZMod 2) ω = X ^ 2 - 1 := by
  sorry

/-- Unit test `TauCeti.FiniteFieldSums.test_frobeniusMinpoly_ne_minpoly`: the Frobenius minimal
polynomial is not the minimal polynomial: for `ω ∈ 𝔽₄` they are `X ^ 2 - 1` and `X ^ 2 + X + 1`. -/
example (ω : GaloisField 2 2) (hω : ω ^ 2 + ω + 1 = 0) :
    frobeniusMinpoly (ZMod 2) ω ≠ minpoly (ZMod 2) ω := by
  sorry

/-- **Normal elements** (Shoup, Exercise 19.14). `σ^i(α)`, `i < n`, form a basis iff the Frobenius
minimal polynomial of `α` is `X ^ n - 1`. -/
theorem linearIndependent_frobenius_iff (α : L) :
    LinearIndependent K (fun i : Fin (Module.finrank K L) =>
        (FiniteField.frobeniusAlgHom K L)^[i] α) ↔
      frobeniusMinpoly K α = X ^ Module.finrank K L - 1 := by
  sorry

/-- The certificate form: `α` is normal iff `((X^n - 1)/h)(σ)(α) ≠ 0` for every monic irreducible
factor `h` of `X ^ n - 1` (Shoup, Theorem 18.11 and the proof of Theorem 18.12). -/
theorem frobeniusMinpoly_eq_iff_forall_irreducible_factor (α : L) :
    frobeniusMinpoly K α = X ^ Module.finrank K L - 1 ↔
      ∀ h : K[X], h.Monic → Irreducible h → h ∣ X ^ Module.finrank K L - 1 →
        aeval (FiniteField.frobeniusAlgHom K L).toLinearMap
          ((X ^ Module.finrank K L - 1) /ₘ h) α ≠ 0 := by
  sorry

theorem exists_frobeniusMinpoly_eq : ∃ α : L, frobeniusMinpoly K α = X ^ Module.finrank K L - 1 := by
  sorry

/-- The Frobenius normal basis of a normal element. -/
noncomputable def normalBasisOf (α : L)
    (hα : frobeniusMinpoly K α = X ^ Module.finrank K L - 1) :
    Module.Basis (Fin (Module.finrank K L)) K L := by
  sorry

theorem normalBasisOf_apply (α : L) (hα : frobeniusMinpoly K α = X ^ Module.finrank K L - 1)
    (i : Fin (Module.finrank K L)) :
    normalBasisOf K α hα i = (FiniteField.frobeniusAlgHom K L)^[i] α := by
  sorry

/-- In normal-basis coordinates the Frobenius is the cyclic shift. -/
theorem repr_frobenius (α : L) (hα : frobeniusMinpoly K α = X ^ Module.finrank K L - 1)
    (x : L) (i : Fin (Module.finrank K L)) :
    (normalBasisOf K α hα).repr (x ^ Fintype.card K) i =
      (normalBasisOf K α hα).repr x (finRotate _ |>.symm i) := by
  sorry

theorem trace_eq_sum_repr (α : L) (hα : frobeniusMinpoly K α = X ^ Module.finrank K L - 1)
    (x : L) :
    Algebra.trace K L x = (∑ i, (normalBasisOf K α hα).repr x i) * Algebra.trace K L α := by
  sorry

/-- Comparison with Mathlib: `IsGalois.normalBasis K L 1` is a normal element. -/
theorem frobeniusMinpoly_normalBasis_one :
    frobeniusMinpoly K (IsGalois.normalBasis K L 1) = X ^ Module.finrank K L - 1 := by
  sorry

/-- Unit test `TauCeti.FiniteFieldSums.test_normalBasisOf_F4`: in `𝔽₄`, `ω` is normal and the
Frobenius swaps the two basis vectors `ω, ω ^ 2`. -/
example (ω : GaloisField 2 2) (hω : ω ^ 2 + ω + 1 = 0) :
    LinearIndependent (ZMod 2) ![ω, ω ^ 2] := by
  sorry

/-- Unit test `TauCeti.FiniteFieldSums.test_normalBasisOf_degree_one`: over `K` itself every
nonzero element is normal. -/
example {a : K} (ha : a ≠ 0) : frobeniusMinpoly K a = X ^ Module.finrank K K - 1 := by
  sorry

/-- Unit test `TauCeti.FiniteFieldSums.test_normalBasisOf_one_not_normal`: `1 ∈ 𝔽₄` is not normal
over `𝔽₂`. -/
example : frobeniusMinpoly (ZMod 2) (1 : GaloisField 2 2) ≠
    X ^ Module.finrank (ZMod 2) (GaloisField 2 2) - 1 := by
  sorry

/-- Unit test `TauCeti.FiniteFieldSums.test_normalBasisOf_mathlib`: Mathlib's normal basis is a
Galois orbit, hence a Frobenius orbit. -/
example (σ : Gal(L/K)) : IsGalois.normalBasis K L σ = σ (IsGalois.normalBasis K L 1) :=
  IsGalois.normalBasis_apply σ

end NormalBasis

end FF0

end TauCeti.FiniteFieldSums

end FF0File


-- ===== FF.1 =====

section FF1File

/-
Suggested Lean for FiniteFieldsAndCharacterSums, layer FF.1 (characters and elementary sums).

This file is not the roadmap and is not exhaustive: the roadmap document is definitive. The
statements below suggest Lean forms so that contributors and reviewers converge on names and
signatures. Every proof is `sorry`; nothing here is claimed to be formalised.

Prototyped against Mathlib only. Tau Ceti's column orthogonality
`CommGroup.sum_monoidHom_apply_eq_ite` (TauCeti/GroupTheory/FiniteAbelian/CharacterOrthogonality)
and its Frobenius-orbit lemmas (TauCeti/FieldTheory/Finite/MinpolyOrbit) enter only proofs; no
Tau Ceti module is imported. The normalised finite-abelian Fourier transform requested from
`AdditiveCombinatorics:AC.0` is not yet available, so the Fourier-expansion lemma is stated in
its concrete (unnormalised-sum) form.
-/

namespace TauCeti.FiniteFieldSums

section FF1

open Polynomial

/-! ### Trace characters and the canonical additive character -/

section CanonicalAddChar

variable (F : Type*) [CommRing F] [Fintype F] (p : ℕ) [Fact p.Prime] [Algebra (ZMod p) F]

/-- The trace character with root `ζ` (`ζ ^ p = 1`): `x ↦ ζ ^ val (Tr x)`. -/
noncomputable def traceAddChar {R : Type*} [CommMonoid R] (ζ : R) (hζ : ζ ^ p = 1) : AddChar F R :=
  (AddChar.zmodChar p hζ).compAddMonoidHom (Algebra.trace (ZMod p) F).toAddMonoidHom

theorem traceAddChar_apply {R : Type*} [CommMonoid R] (ζ : R) (hζ : ζ ^ p = 1) (x : F) :
    traceAddChar F p ζ hζ x = ζ ^ (Algebra.trace (ZMod p) F x).val := by
  sorry

/-- The canonical additive character `x ↦ exp (2πi Tr(x) / p)`. -/
noncomputable def canonicalAddChar : AddChar F ℂ :=
  (ZMod.stdAddChar (N := p)).compAddMonoidHom (Algebra.trace (ZMod p) F).toAddMonoidHom

theorem canonicalAddChar_apply (x : F) :
    canonicalAddChar F p x = ZMod.stdAddChar (Algebra.trace (ZMod p) F x) := by
  sorry

theorem canonicalAddChar_eq_exp (x : F) (t : ℤ) (ht : (t : ZMod p) = Algebra.trace (ZMod p) F x) :
    canonicalAddChar F p x = Complex.exp (2 * Real.pi * Complex.I * t / p) := by
  sorry

theorem isPrimitive_traceAddChar {K : Type*} [Field K] [Fintype K] [Algebra (ZMod p) K]
    {R : Type*} [CommRing R] [IsDomain R] {ζ : R} (hζ : IsPrimitiveRoot ζ p) :
    (traceAddChar K p ζ hζ.pow_eq_one).IsPrimitive := by
  sorry

theorem isPrimitive_canonicalAddChar {K : Type*} [Field K] [Fintype K] [Algebra (ZMod p) K] :
    (canonicalAddChar K p).IsPrimitive := by
  sorry

/-- Mathlib's `AddChar.FiniteField.primitiveChar` is a trace character. -/
theorem exists_primitiveChar_eq_traceAddChar (K : Type*) [Field K] [Fintype K]
    [Algebra (ZMod (ringChar K)) K] (F' : Type*) [Field F'] (h : ringChar F' ≠ ringChar K) :
    ∃ ζ : CyclotomicField (AddChar.FiniteField.primitiveChar K F' h).n F',
      IsPrimitiveRoot ζ (ringChar K) ∧ ∀ x : K,
        (AddChar.FiniteField.primitiveChar K F' h).char x =
          ζ ^ (Algebra.trace (ZMod (ringChar K)) K x).val := by
  sorry

/-- Over `ℂ`, every embedding of the cyclotomic target turns `primitiveChar` into a shift of the
canonical character. -/
theorem exists_mulShift_eq_comp_primitiveChar (K : Type*) [Field K] [Fintype K]
    [Algebra (ZMod p) K] (h : ringChar ℂ ≠ ringChar K)
    (ι : CyclotomicField (AddChar.FiniteField.primitiveChar K ℂ h).n ℂ →+* ℂ) :
    ∃ a : K, a ≠ 0 ∧
      ι.toMonoidHom.compAddChar (AddChar.FiniteField.primitiveChar K ℂ h).char =
        (canonicalAddChar K p).mulShift a := by
  sorry

theorem canonicalAddChar_frobenius {K : Type*} [Field K] [Fintype K] [Algebra (ZMod p) K] (x : K) :
    canonicalAddChar K p (x ^ p) = canonicalAddChar K p x := by
  sorry

theorem canonicalAddChar_neg (x : F) :
    canonicalAddChar F p (-x) = (starRingEnd ℂ) (canonicalAddChar F p x) := by
  sorry

theorem canonicalAddChar_zmod : canonicalAddChar (ZMod p) p = ZMod.stdAddChar := by
  sorry

/-- Unit test `TauCeti.FiniteFieldSums.test_canonicalAddChar_zmod`: over the prime field the
canonical character is Mathlib's standard character. -/
example : canonicalAddChar (ZMod p) p = ZMod.stdAddChar (N := p) :=
  canonicalAddChar_zmod p

/-- Unit test `TauCeti.FiniteFieldSums.test_canonicalAddChar_F4`: in `𝔽₄`, `ψ(ω) = -1` for a root
`ω` of `X ^ 2 + X + 1`. -/
example (ω : GaloisField 2 2) (hω : ω ^ 2 + ω + 1 = 0) :
    canonicalAddChar (GaloisField 2 2) 2 ω = -1 := by
  sorry

/-- Unit test `TauCeti.FiniteFieldSums.test_canonicalAddChar_one_F4`: in `𝔽₄`, `ψ(1) = 1`. -/
example : canonicalAddChar (GaloisField 2 2) 2 1 = 1 := by
  sorry

/-- Unit test `TauCeti.FiniteFieldSums.test_canonicalAddChar_nontrivial`: the canonical character
is nontrivial. -/
example {K : Type*} [Field K] [Fintype K] [Algebra (ZMod p) K] : canonicalAddChar K p ≠ 1 := by
  sorry

/-- Unit test `TauCeti.FiniteFieldSums.test_canonicalAddChar_sum`: its sum over the field vanishes. -/
example {K : Type*} [Field K] [Fintype K] [Algebra (ZMod p) K] :
    ∑ x : K, canonicalAddChar K p x = 0 := by
  sorry

end CanonicalAddChar

/-- **Additive characters are shifts** (Kowalski, Proposition 1.13): for `ψ` primitive with values
in a domain, `a ↦ ψ.mulShift a` is a bijection. -/
theorem bijective_mulShift_of_isPrimitive {F : Type*} [Field F] [Fintype F] {R : Type*}
    [CommRing R] [IsDomain R] {ψ : AddChar F R} (hψ : ψ.IsPrimitive) :
    Function.Bijective ψ.mulShift := by
  sorry

theorem natCard_addChar_of_isPrimitive {F : Type*} [Field F] [Fintype F] {R : Type*}
    [CommRing R] [IsDomain R] {ψ : AddChar F R} (hψ : ψ.IsPrimitive) :
    Nat.card (AddChar F R) = Fintype.card F := by
  sorry

/-! ### Norm and trace lifts -/

section Lifts

variable {F : Type*} [Field F] [Fintype F] (E : Type*) [Field E] [Fintype E] [Algebra F E]

/-- The norm lift `χ ∘ N_{E/F}`. -/
noncomputable def liftNorm {R : Type*} [CommMonoidWithZero R] (χ : MulChar F R) : MulChar E R := by
  sorry

theorem liftNorm_apply {R : Type*} [CommMonoidWithZero R] (χ : MulChar F R) (x : E) :
    liftNorm E χ x = χ (Algebra.norm F x) := by
  sorry

/-- The norm lift as a monoid homomorphism. -/
noncomputable def liftNormHom (R : Type*) [CommMonoidWithZero R] : MulChar F R →* MulChar E R := by
  sorry

theorem liftNorm_injective {R : Type*} [CommMonoidWithZero R] :
    Function.Injective (liftNorm E (R := R) (F := F)) := by
  sorry

theorem liftNorm_eq_one_iff {R : Type*} [CommMonoidWithZero R] (χ : MulChar F R) :
    liftNorm E χ = 1 ↔ χ = 1 := by
  sorry

theorem orderOf_liftNorm {R : Type*} [CommMonoidWithZero R] (χ : MulChar F R) :
    orderOf (liftNorm E χ) = orderOf χ := by
  sorry

theorem liftNorm_liftNorm {R : Type*} [CommMonoidWithZero R] (E' : Type*) [Field E'] [Fintype E']
    [Algebra E E'] [Algebra F E'] [IsScalarTower F E E'] (χ : MulChar F R) :
    liftNorm E' (liftNorm E χ) = liftNorm E' χ := by
  sorry

theorem liftNorm_algebraMap {R : Type*} [CommMonoidWithZero R] (χ : MulChar F R) (a : F) :
    liftNorm E χ (algebraMap F E a) = χ a ^ Module.finrank F E := by
  sorry

theorem liftNorm_ringHomComp {R R' : Type*} [CommRing R] [CommRing R'] (χ : MulChar F R)
    (f : R →+* R') : liftNorm E (χ.ringHomComp f) = (liftNorm E χ).ringHomComp f := by
  sorry

/-- The trace lift `ψ ∘ Tr_{E/F}`. -/
noncomputable def liftTrace {R : Type*} [CommMonoid R] (ψ : AddChar F R) : AddChar E R :=
  ψ.compAddMonoidHom (Algebra.trace F E).toAddMonoidHom

theorem liftTrace_apply {R : Type*} [CommMonoid R] (ψ : AddChar F R) (x : E) :
    liftTrace E ψ x = ψ (Algebra.trace F E x) := by
  sorry

theorem liftTrace_injective {R : Type*} [CommMonoid R] :
    Function.Injective (liftTrace E (R := R) (F := F)) := by
  sorry

theorem isPrimitive_liftTrace {R : Type*} [CommRing R] [IsDomain R] {ψ : AddChar F R}
    (hψ : ψ ≠ 1) : (liftTrace E ψ).IsPrimitive := by
  sorry

theorem liftTrace_liftTrace {R : Type*} [CommMonoid R] (E' : Type*) [Field E'] [Fintype E']
    [Algebra E E'] [Algebra F E'] [IsScalarTower F E E'] (ψ : AddChar F R) :
    liftTrace E' (liftTrace E ψ) = liftTrace E' ψ := by
  sorry

theorem liftTrace_canonicalAddChar (p : ℕ) [Fact p.Prime] [Algebra (ZMod p) F]
    [Algebra (ZMod p) E] [IsScalarTower (ZMod p) F E] :
    liftTrace E (canonicalAddChar F p) = canonicalAddChar E p := by
  sorry

theorem liftTrace_mulShift {R : Type*} [CommMonoid R] (ψ : AddChar F R) (a : F) :
    liftTrace E (ψ.mulShift a) = (liftTrace E ψ).mulShift (algebraMap F E a) := by
  sorry

theorem liftTrace_algebraMap {R : Type*} [CommMonoid R] (ψ : AddChar F R) (a : F) :
    liftTrace E ψ (algebraMap F E a) = ψ (Module.finrank F E • a) := by
  sorry

/-- Unit test `TauCeti.FiniteFieldSums.test_liftNorm_self`: the lift along `F / F` is `χ`. -/
example {R : Type*} [CommMonoidWithZero R] (χ : MulChar F R) : liftNorm F χ = χ := by
  sorry

/-- Unit test `TauCeti.FiniteFieldSums.test_liftNorm_one`: the lift of the trivial character is
trivial. -/
example {R : Type*} [CommMonoidWithZero R] : liftNorm E (1 : MulChar F R) = 1 := by
  sorry

/-- Unit test `TauCeti.FiniteFieldSums.test_liftNorm_zero`: the lifted trivial character vanishes
at `0`. -/
example {R : Type*} [CommMonoidWithZero R] [Nontrivial R] : liftNorm E (1 : MulChar F R) 0 = 0 := by
  sorry

/-- Unit test `TauCeti.FiniteFieldSums.test_liftNorm_algebraMap`: the lift is not a restriction:
for the quadratic character `η` of `𝔽₃`, `η_{𝔽₉}(-1) = 1` while `η(-1) = -1`. -/
example : liftNorm (GaloisField 3 2) (quadraticChar (ZMod 3)) (-1) = 1 ∧
    quadraticChar (ZMod 3) (-1) = -1 := by
  sorry

/-- Unit test `TauCeti.FiniteFieldSums.test_liftNorm_quadratic`: for `p` odd, the lift of the
Legendre character is the quadratic character. -/
example (p : ℕ) [Fact p.Prime] (hp : p ≠ 2) (K : Type*) [Field K] [Fintype K] [DecidableEq K]
    [Algebra (ZMod p) K] : liftNorm K (quadraticChar (ZMod p)) = quadraticChar K := by
  sorry

/-- Unit test `TauCeti.FiniteFieldSums.test_liftTrace_canonical`: lifting the canonical character
of `𝔽_p` gives the canonical character. -/
example (p n : ℕ) [Fact p.Prime] :
    liftTrace (GaloisField p n) (canonicalAddChar (ZMod p) p) = canonicalAddChar (GaloisField p n) p := by
  sorry

/-- Unit test `TauCeti.FiniteFieldSums.test_liftTrace_self`: the lift along `F / F` is `ψ`. -/
example {R : Type*} [CommMonoid R] (ψ : AddChar F R) : liftTrace F ψ = ψ := by
  sorry

/-- Unit test `TauCeti.FiniteFieldSums.test_liftTrace_nontrivial`: lifts of nontrivial characters
are nontrivial. -/
example {R : Type*} [CommMonoid R] {ψ : AddChar F R} (hψ : ψ ≠ 1) : liftTrace E ψ ≠ 1 := by
  sorry

/-- Unit test `TauCeti.FiniteFieldSums.test_liftTrace_one_F4`: the lift is not an extension:
lifting the standard character of `𝔽₂` to `𝔽₄` gives `1` at `1`, while `ψ(1) = -1`. -/
example : liftTrace (GaloisField 2 2) (ZMod.stdAddChar (N := 2)) 1 = 1 ∧
    ZMod.stdAddChar (N := 2) 1 = -1 := by
  sorry

end Lifts

/-! ### Trivial-character and sign conventions -/

section Conventions

variable {F : Type*} [Field F] [Fintype F] {R : Type*} [CommRing R]

open Classical in
/-- The classical value: `χ` with the trivial character set to `1` at `0`. -/
noncomputable def classicalValue (χ : MulChar F R) (x : F) : R :=
  χ x + if χ = 1 ∧ x = 0 then 1 else 0

theorem classicalValue_of_ne_one {χ : MulChar F R} (hχ : χ ≠ 1) (x : F) :
    classicalValue χ x = χ x := by
  sorry

theorem classicalValue_one [Nontrivial R] (x : F) : classicalValue (1 : MulChar F R) x = 1 := by
  sorry

theorem classicalValue_mul (χ : MulChar F R) (x y : F) :
    classicalValue χ (x * y) = classicalValue χ x * classicalValue χ y := by
  sorry

/-- The Gauss sum with the classical convention. -/
noncomputable def classicalGaussSum (χ : MulChar F R) (ψ : AddChar F R) : R :=
  ∑ x, classicalValue χ x * ψ x

open Classical in
theorem classicalGaussSum_eq (χ : MulChar F R) (ψ : AddChar F R) :
    classicalGaussSum χ ψ = gaussSum χ ψ + if χ = 1 then 1 else 0 := by
  sorry

/-- The Jacobi sum with the classical convention. -/
noncomputable def classicalJacobiSum (χ φ : MulChar F R) : R :=
  ∑ x, classicalValue χ x * classicalValue φ (1 - x)

open Classical in
theorem classicalJacobiSum_eq (χ φ : MulChar F R) :
    classicalJacobiSum χ φ = jacobiSum χ φ + (if χ = 1 then 1 else 0) + (if φ = 1 then 1 else 0) := by
  sorry

theorem classicalJacobiSum_one_one [Nontrivial R] :
    classicalJacobiSum (1 : MulChar F R) 1 = Fintype.card F := by
  sorry

theorem classicalJacobiSum_one_left [IsDomain R] {χ : MulChar F R} (hχ : χ ≠ 1) :
    classicalJacobiSum 1 χ = 0 := by
  sorry

/-- The sign-normalised Gauss sum of Katre and Conrad (1995). -/
def normalizedGaussSum (χ : MulChar F R) (ψ : AddChar F R) : R := -gaussSum χ ψ

theorem normalizedGaussSum_one [IsDomain R] {ψ : AddChar F R} (hψ : ψ ≠ 1) :
    normalizedGaussSum (1 : MulChar F R) ψ = 1 := by
  sorry

/-- Unit test `TauCeti.FiniteFieldSums.test_classicalJacobiSum_one_one`: `J^cl(1, 1) = q` while
Mathlib's `jacobiSum 1 1 = q - 2`. -/
example [Nontrivial R] : classicalJacobiSum (1 : MulChar F R) 1 = Fintype.card F ∧
    jacobiSum (1 : MulChar F R) 1 = Fintype.card F - 2 := by
  sorry

/-- Unit test `TauCeti.FiniteFieldSums.test_classicalJacobiSum_one_nontrivial`:
`J^cl(1, χ) = 0` for `χ ≠ 1`. -/
example [IsDomain R] {χ : MulChar F R} (hχ : χ ≠ 1) : classicalJacobiSum 1 χ = 0 :=
  classicalJacobiSum_one_left hχ

/-- Unit test `TauCeti.FiniteFieldSums.test_classicalGaussSum_one`: `g^cl(1, ψ) = 0` for
`ψ ≠ 1`. -/
example [IsDomain R] {ψ : AddChar F R} (hψ : ψ ≠ 1) : classicalGaussSum (1 : MulChar F R) ψ = 0 := by
  sorry

/-- Unit test `TauCeti.FiniteFieldSums.test_classicalValue_ne_mul_at_zero`: the classical value is
not multiplicative in the character. -/
example [IsDomain R] {χ : MulChar F R} (hχ : χ ≠ 1) :
    classicalValue (χ * χ⁻¹) 0 ≠ classicalValue χ 0 * classicalValue χ⁻¹ 0 := by
  sorry

/-- Unit test `TauCeti.FiniteFieldSums.test_classicalJacobiSum_eq_nontrivial`: the conventions
agree on nontrivial characters. -/
example {χ φ : MulChar F R} (hχ : χ ≠ 1) (hφ : φ ≠ 1) : classicalJacobiSum χ φ = jacobiSum χ φ := by
  sorry

end Conventions

/-! ### Transport, conjugation and absolute values of Gauss sums -/

section Transport

/-- Gauss sums commute with transport of values. -/
theorem gaussSum_ringHomComp {R : Type*} [CommRing R] [Fintype R] {S S' : Type*} [CommRing S]
    [CommRing S'] (χ : MulChar R S) (ψ : AddChar R S) (f : S →+* S') :
    gaussSum (χ.ringHomComp f) (f.toMonoidHom.compAddChar ψ) = f (gaussSum χ ψ) := by
  sorry

/-- The shift identity for a nonzero element of a finite field. -/
theorem gaussSum_mulShift_of_ne_zero {F : Type*} [Field F] [Fintype F] {R : Type*} [CommRing R]
    (χ : MulChar F R) (ψ : AddChar F R) {c : F} (hc : c ≠ 0) :
    gaussSum χ (ψ.mulShift c) = χ⁻¹ c * gaussSum χ ψ := by
  sorry

/-- An embedding of the values sends a Gauss sum with a trace character to a shifted complex Gauss
sum with the canonical character. -/
theorem ringHom_gaussSum_traceAddChar {F : Type*} [Field F] [Fintype F] {p : ℕ} [Fact p.Prime]
    [Algebra (ZMod p) F] {S : Type*} [CommRing S] (χ : MulChar F S) {ζ : S} (hζ : ζ ^ p = 1)
    (φ : S →+* ℂ) (a : ZMod p) (ha : φ ζ = ZMod.stdAddChar a) :
    φ (gaussSum χ (traceAddChar F p ζ hζ)) =
      gaussSum (χ.ringHomComp φ) ((canonicalAddChar F p).mulShift (algebraMap (ZMod p) F a)) := by
  sorry

/-- Galois conjugation (Katre, Proposition 1(h)). -/
theorem gaussSum_galois {F : Type*} [Field F] [Fintype F] {p : ℕ} [Fact p.Prime]
    [Algebra (ZMod p) F] {L : Type*} [Field L] {m : ℕ} (χ : MulChar F L) (hχ : χ ^ m = 1)
    {ζm ζp : L} (hζm : IsPrimitiveRoot ζm m) (hζp : IsPrimitiveRoot ζp p) (σ : L ≃+* L) (b c : ℕ)
    (hσm : σ ζm = ζm ^ b) (hσp : σ ζp = ζp ^ c) (hc : ¬ p ∣ c) :
    σ (gaussSum χ (traceAddChar F p ζp hζp.pow_eq_one)) =
      (χ (c : F))⁻¹ ^ b * gaussSum (χ ^ b) (traceAddChar F p ζp hζp.pow_eq_one) := by
  sorry

/-- The absolute value of a complex Gauss sum of nontrivial characters. -/
theorem norm_gaussSum {F : Type*} [Field F] [Fintype F] {χ : MulChar F ℂ} (hχ : χ ≠ 1)
    {ψ : AddChar F ℂ} (hψ : ψ ≠ 1) : ‖gaussSum χ ψ‖ = Real.sqrt (Fintype.card F) := by
  sorry

/-- The absolute value of a complex Jacobi sum. -/
theorem norm_jacobiSum {F : Type*} [Field F] [Fintype F] {χ φ : MulChar F ℂ} (hχ : χ ≠ 1)
    (hφ : φ ≠ 1) (hχφ : χ * φ ≠ 1) : ‖jacobiSum χ φ‖ = Real.sqrt (Fintype.card F) := by
  sorry

end Transport

/-! ### Column orthogonality, power counts, Fourier expansion, Frobenius, duplication -/

section Sums

variable {F : Type*} [Field F] [Fintype F] [DecidableEq F]

/-- Column orthogonality in `MulChar` form, including the value at `0`. -/
theorem sum_mulChar_apply_eq_ite {R : Type*} [CommRing R] [IsDomain R]
    [HasEnoughRootsOfUnity R (Fintype.card F - 1)] [Fintype (MulChar F R)] (a : F) :
    ∑ χ : MulChar F R, χ a = if a = 1 then ((Fintype.card F - 1 : ℕ) : R) else 0 := by
  sorry

open Classical in
/-- Counting `d`-th roots with classical character values (Kowalski (1.8)). -/
theorem card_pow_eq_eq_sum_classicalValue {R : Type*} [CommRing R] [IsDomain R] [CharZero R]
    [HasEnoughRootsOfUnity R (Fintype.card F - 1)] [Fintype (MulChar F R)] {d : ℕ}
    (hd : d ∣ Fintype.card F - 1) (x : F) :
    (((Finset.univ.filter fun y : F => y ^ d = x).card : ℕ) : R) =
      ∑ χ ∈ Finset.univ.filter (fun χ : MulChar F R => χ ^ d = 1), classicalValue χ x := by
  sorry

/-- The Fourier expansion of a nontrivial multiplicative character. -/
theorem mulChar_eq_fourier_expansion {χ : MulChar F ℂ} (hχ : χ ≠ 1) {ψ : AddChar F ℂ}
    (hψ : ψ ≠ 1) (x : F) :
    χ x = gaussSum χ ψ / Fintype.card F * ∑ a : F, χ⁻¹ (-a) * ψ (a * x) := by
  sorry

/-- Frobenius invariance: `g(χ ^ p, ψ) = g(χ, ψ)` for a Frobenius-invariant `ψ`. -/
theorem gaussSum_pow_char {p : ℕ} [Fact p.Prime] [CharP F p] {R : Type*} [CommRing R]
    (χ : MulChar F R) {ψ : AddChar F R} (hψ : ∀ x, ψ (x ^ p) = ψ x) :
    gaussSum (χ ^ p) ψ = gaussSum χ ψ := by
  sorry

/-- The duplication formula (Kowalski, Proposition 2.17). -/
theorem gaussSum_duplication (hF : ringChar F ≠ 2) (χ : MulChar F ℂ) {ψ : AddChar F ℂ}
    (hψ : ψ ≠ 1) :
    gaussSum (χ ^ 2) ψ * gaussSum ((quadraticChar F).ringHomComp (Int.castRingHom ℂ)) ψ =
      χ 4 * gaussSum χ ψ * gaussSum (χ * (quadraticChar F).ringHomComp (Int.castRingHom ℂ)) ψ := by
  sorry

end Sums

/-! ### The Hasse–Davenport lifting relation -/

section HasseDavenport

open scoped IntermediateField

variable {F : Type*} [Field F] [Fintype F] {R : Type*} [CommRing R]

/-- The Gauss-sum weight `λ(f) = χ((-1)^s f(0)) ψ(-a_{s-1})` on monic polynomials. -/
noncomputable def hdWeight (χ : MulChar F R) (ψ : AddChar F R) (f : F[X]) : R :=
  χ ((-1) ^ f.natDegree * f.coeff 0) * ψ (-f.nextCoeff)

theorem hdWeight_one (χ : MulChar F R) (ψ : AddChar F R) : hdWeight χ ψ 1 = 1 := by
  sorry

theorem hdWeight_mul (χ : MulChar F R) (ψ : AddChar F R) {f g : F[X]} (hf : f.Monic)
    (hg : g.Monic) : hdWeight χ ψ (f * g) = hdWeight χ ψ f * hdWeight χ ψ g := by
  sorry

theorem hdWeight_X_sub_C (χ : MulChar F R) (ψ : AddChar F R) (c : F) :
    hdWeight χ ψ (X - C c) = χ c * ψ c := by
  sorry

theorem hdWeight_X [Nontrivial R] (χ : MulChar F R) (ψ : AddChar F R) : hdWeight χ ψ X = 0 := by
  sorry

theorem hdWeight_pow (χ : MulChar F R) (ψ : AddChar F R) {f : F[X]} (hf : f.Monic) (k : ℕ) :
    hdWeight χ ψ (f ^ k) = hdWeight χ ψ f ^ k := by
  sorry

theorem hdWeight_minpoly (χ : MulChar F R) (ψ : AddChar F R) {E : Type*} [Field E] [Fintype E]
    [Algebra F E] (α : E) :
    hdWeight χ ψ (minpoly F α) =
      χ (Algebra.norm F (IntermediateField.AdjoinSimple.gen F α)) *
        ψ (Algebra.trace F F⟮α⟯ (IntermediateField.AdjoinSimple.gen F α)) := by
  sorry

/-- The monic polynomial `X ^ s + Σ_{i < s} c_i X ^ i`. -/
noncomputable def monicOfCoeffs (s : ℕ) (c : Fin s → F) : F[X] :=
  X ^ s + ∑ i, C (c i) * X ^ (i : ℕ)

/-- The degree-`s` sum `S_s = Σ_{deg f = s} w(f)` over monic polynomials. -/
noncomputable def monicDegreeSum (w : F[X] → R) (s : ℕ) : R :=
  ∑ c : Fin s → F, w (monicOfCoeffs s c)

open Classical in
/-- `N_k = Σ_{d ∣ k} Σ_{deg P = d} d · w(P)^(k/d)` over monic irreducible `P`. -/
noncomputable def primePowerSum (w : F[X] → R) (k : ℕ) : R :=
  ∑ d ∈ k.divisors, ∑ c ∈ (Finset.univ : Finset (Fin d → F)).filter
    (fun c => Irreducible (monicOfCoeffs d c)), d • w (monicOfCoeffs d c) ^ (k / d)

/-- The degree sums of the Gauss-sum weight. -/
theorem monicDegreeSum_hdWeight [IsDomain R] {χ : MulChar F R} {ψ : AddChar F R}
    (h : χ ≠ 1 ∨ ψ ≠ 1) (s : ℕ) :
    monicDegreeSum (hdWeight χ ψ) s =
      if s = 0 then 1 else if s = 1 then gaussSum χ ψ else 0 := by
  sorry

/-- The logarithmic-derivative recurrence for multiplicative weights on monic polynomials. -/
theorem nsmul_monicDegreeSum_eq (w : F[X] → R) (hw1 : w 1 = 1)
    (hw : ∀ f g : F[X], f.Monic → g.Monic → w (f * g) = w f * w g) {s : ℕ} (hs : 1 ≤ s) :
    s • monicDegreeSum w s =
      ∑ k ∈ Finset.Icc 1 s, primePowerSum w k * monicDegreeSum w (s - k) := by
  sorry

/-- The prime-power sum of the Gauss-sum weight is the lifted Gauss sum. -/
theorem primePowerSum_hdWeight_eq_gaussSum (χ : MulChar F R) (ψ : AddChar F R) (E : Type*)
    [Field E] [Fintype E] [Algebra F E] :
    primePowerSum (hdWeight χ ψ) (Module.finrank F E) = gaussSum (liftNorm E χ) (liftTrace E ψ) := by
  sorry

/-- **The Hasse–Davenport lifting relation.** -/
theorem hasseDavenport_lifting [IsDomain R] {χ : MulChar F R} {ψ : AddChar F R}
    (h : χ ≠ 1 ∨ ψ ≠ 1) (E : Type*) [Field E] [Fintype E] [Algebra F E] :
    -gaussSum (liftNorm E χ) (liftTrace E ψ) = (-gaussSum χ ψ) ^ Module.finrank F E := by
  sorry

/-- The Hasse–Davenport relation for Jacobi sums. -/
theorem hasseDavenport_lifting_jacobiSum {K : Type*} [Field K] {χ₁ χ₂ : MulChar F K}
    (hK : ringChar K ≠ ringChar F) (h : χ₁ ≠ 1 ∨ χ₂ ≠ 1) (E : Type*) [Field E] [Fintype E]
    [Algebra F E] :
    -jacobiSum (liftNorm E χ₁) (liftNorm E χ₂) = (-jacobiSum χ₁ χ₂) ^ Module.finrank F E := by
  sorry

/-- Unit test `TauCeti.FiniteFieldSums.test_hdWeight_linear`: `λ(X - c) = χ(c) ψ(c)`. -/
example (χ : MulChar F R) (ψ : AddChar F R) (c : F) : hdWeight χ ψ (X - C c) = χ c * ψ c :=
  hdWeight_X_sub_C χ ψ c

/-- Unit test `TauCeti.FiniteFieldSums.test_hdWeight_one`: `λ(1) = 1`. -/
example (χ : MulChar F R) (ψ : AddChar F R) : hdWeight χ ψ 1 = 1 :=
  hdWeight_one χ ψ

/-- Unit test `TauCeti.FiniteFieldSums.test_hdWeight_X`: `λ(X) = 0` even for the trivial
character. -/
example [Nontrivial R] (ψ : AddChar F R) : hdWeight (1 : MulChar F R) ψ X = 0 :=
  hdWeight_X 1 ψ

/-- Unit test `TauCeti.FiniteFieldSums.test_hdWeight_X2_add_one`: over `𝔽₃`, `λ(X ^ 2 + 1) = 1`. -/
example {S : Type*} [CommRing S] (χ : MulChar (ZMod 3) S) (ψ : AddChar (ZMod 3) S) :
    hdWeight χ ψ (X ^ 2 + 1) = 1 := by
  sorry

/-- Unit test `TauCeti.FiniteFieldSums.test_hdWeight_trivial`: with both characters trivial the
weight detects `f(0) ≠ 0`. -/
example [Nontrivial R] [DecidableEq F] (f : F[X]) :
    hdWeight (1 : MulChar F R) 1 f = if f.coeff 0 = 0 then 0 else 1 := by
  sorry

end HasseDavenport

/-! ### Teichmüller characters and Stickelberger's congruence -/

section Stickelberger

open NumberField

variable {L : Type*} [Field L] [NumberField L] (P : Ideal (𝓞 L)) [P.IsMaximal]
  [Fintype (𝓞 L ⧸ P)]

/-- The Teichmüller character of `P`: the `(q - 1)`-th root of unity reducing to a residue. -/
noncomputable def teichmuller (hμ : ∃ ζ : 𝓞 L, IsPrimitiveRoot ζ (Fintype.card (𝓞 L ⧸ P) - 1)) :
    MulChar (𝓞 L ⧸ P) (𝓞 L) := by
  sorry

variable (hμ : ∃ ζ : 𝓞 L, IsPrimitiveRoot ζ (Fintype.card (𝓞 L ⧸ P) - 1))

theorem teichmuller_mk_sub_mem (x : 𝓞 L) (hx : x ∉ P) :
    teichmuller P hμ (Ideal.Quotient.mk P x) - x ∈ P := by
  sorry

theorem teichmuller_pow_card_sub_one (y : 𝓞 L ⧸ P) (hy : y ≠ 0) :
    teichmuller P hμ y ^ (Fintype.card (𝓞 L ⧸ P) - 1) = 1 := by
  sorry

theorem teichmuller_mk_of_pow_eq_one (ζ : 𝓞 L) (hζ : ζ ^ (Fintype.card (𝓞 L ⧸ P) - 1) = 1) :
    teichmuller P hμ (Ideal.Quotient.mk P ζ) = ζ := by
  sorry

theorem orderOf_teichmuller : orderOf (teichmuller P hμ) = Fintype.card (𝓞 L ⧸ P) - 1 := by
  sorry

theorem exists_eq_teichmuller_zpow (χ : MulChar (𝓞 L ⧸ P) (𝓞 L)) :
    ∃ k : ℕ, χ = teichmuller P hμ ^ k := by
  sorry

theorem teichmuller_zero : teichmuller P hμ 0 = 0 := by
  sorry

/-- Unit test `TauCeti.FiniteFieldSums.test_teichmuller_gaussian`: in `ℚ(i)` modulo a prime `P`
of norm `5` containing `3 - i`, the Teichmüller character sends `3` to `i`. -/
example [IsCyclotomicExtension {4} ℚ L] {i : L} (hi : IsPrimitiveRoot i 4)
    (hP : (3 : 𝓞 L) - hi.toInteger ∈ P) (hq : Fintype.card (𝓞 L ⧸ P) = 5) :
    teichmuller P hμ (Ideal.Quotient.mk P 3) = hi.toInteger := by
  sorry

/-- Unit test `TauCeti.FiniteFieldSums.test_teichmuller_one`: `ω(1) = 1` and `ω(0) = 0`. -/
example : teichmuller P hμ 1 = 1 ∧ teichmuller P hμ 0 = 0 := by
  sorry

/-- Unit test `TauCeti.FiniteFieldSums.test_teichmuller_not_lift`: in the same setting,
`ω(3) = i ≠ 3`. -/
example [IsCyclotomicExtension {4} ℚ L] {i : L} (hi : IsPrimitiveRoot i 4)
    (hP : (3 : 𝓞 L) - hi.toInteger ∈ P) (hq : Fintype.card (𝓞 L ⧸ P) = 5) :
    teichmuller P hμ (Ideal.Quotient.mk P 3) ≠ 3 := by
  sorry

/-- Unit test `TauCeti.FiniteFieldSums.test_teichmuller_root_of_unity`: `ω(y)` reduces to `y`. -/
example (y : 𝓞 L ⧸ P) (hy : y ≠ 0) : Ideal.Quotient.mk P (teichmuller P hμ y) = y := by
  sorry

/-- The prime above `p` in `ℚ(ζ_{mp})`: `v_P(ζ_p - 1) = 1`. -/
theorem span_zeta_sub_one_le_and_not_le_sq {p m : ℕ} [Fact p.Prime] [NeZero m] (hpm : ¬ p ∣ m)
    [IsCyclotomicExtension {m * p} ℚ L] {ζ : L} (hζ : IsPrimitiveRoot ζ p)
    (Q : Ideal (𝓞 L)) [Q.IsPrime] [Q.LiesOver (Ideal.span {(p : ℤ)})] :
    Ideal.span {hζ.toInteger - 1} ≤ Q ∧ ¬ Ideal.span {hζ.toInteger - 1} ≤ Q ^ 2 := by
  sorry

/-- `(ζ_p - 1)^(p - 1) = -p u` with `u ≡ 1` modulo `ζ_p - 1`. -/
theorem zeta_sub_one_pow_eq_neg_mul_unit {p : ℕ} [Fact p.Prime] {ζ : L} (hζ : IsPrimitiveRoot ζ p) :
    ∃ u : 𝓞 L, IsUnit u ∧ (hζ.toInteger - 1) ^ (p - 1) = -(p : 𝓞 L) * u ∧
      u - 1 ∈ Ideal.span {hζ.toInteger - 1} := by
  sorry

variable {p : ℕ} [Fact p.Prime] [Algebra (ZMod p) (𝓞 L ⧸ P)] {ζp : 𝓞 L} (hζp : IsPrimitiveRoot ζp p)

/-- The base case: `g(ω⁻¹) ≡ -(ζ_p - 1) (mod P²)` in Mathlib's sign. -/
theorem gaussSum_teichmuller_inv_congr :
    gaussSum (teichmuller P hμ)⁻¹ (traceAddChar (𝓞 L ⧸ P) p ζp hζp.pow_eq_one) + (ζp - 1) ∈ P ^ 2 := by
  sorry

/-- **Stickelberger's congruence** (Conrad 1995, Theorem 1), with the digit data of `a`. -/
theorem stickelberger_congruence (a : ℕ) (ha : a < Fintype.card (𝓞 L ⧸ P) - 1) :
    ((((Nat.digits p a).map Nat.factorial).prod : ℕ) : 𝓞 L) *
        (-gaussSum ((teichmuller P hμ)⁻¹ ^ a) (traceAddChar (𝓞 L ⧸ P) p ζp hζp.pow_eq_one)) -
      (ζp - 1) ^ (Nat.digits p a).sum ∈ P ^ ((Nat.digits p a).sum + 1) := by
  sorry

/-- The valuation of a Teichmüller Gauss sum is the digit sum (Katre, Proposition 2). -/
theorem count_gaussSum_teichmuller_eq_digitSum (a : ℕ) (ha : a < Fintype.card (𝓞 L ⧸ P) - 1) :
    Multiset.count P (UniqueFactorizationMonoid.normalizedFactors
      (Ideal.span {gaussSum ((teichmuller P hμ)⁻¹ ^ a)
        (traceAddChar (𝓞 L ⧸ P) p ζp hζp.pow_eq_one)})) = (Nat.digits p a).sum := by
  sorry

/-- The prime factorisation of Teichmüller Gauss sums at the conjugates of `P`
(Katre, Proposition 3′, for `m = q - 1`). -/
theorem count_comap_gaussSum_teichmuller (σ : L ≃+* L) (a : ℕ)
    (hσ : ∀ ζ : 𝓞 L, ζ ^ (Fintype.card (𝓞 L ⧸ P) - 1) = 1 →
      NumberField.RingOfIntegers.mapRingEquiv σ ζ = ζ ^ a)
    (hσp : NumberField.RingOfIntegers.mapRingEquiv σ ζp = ζp) (k : ℕ)
    (hk : ¬ (Fintype.card (𝓞 L ⧸ P) - 1) ∣ k) :
    Multiset.count (Ideal.comap (NumberField.RingOfIntegers.mapRingEquiv σ).toRingHom P)
      (UniqueFactorizationMonoid.normalizedFactors (Ideal.span {gaussSum
        ((teichmuller P hμ)⁻¹ ^ k) (traceAddChar (𝓞 L ⧸ P) p ζp hζp.pow_eq_one)})) =
      (Nat.digits p ((k * a) % (Fintype.card (𝓞 L ⧸ P) - 1))).sum := by
  sorry

end Stickelberger

/-! ### Jacobi sums of several characters -/

section MultiJacobi

variable {F : Type*} [CommRing F] [Fintype F] [DecidableEq F] {R : Type*} [CommRing R]

/-- `J(χ_1, …, χ_r) = Σ_{x_1 + ⋯ + x_r = 1} Π χ_i(x_i)`. -/
noncomputable def multiJacobiSum {r : ℕ} (χ : Fin r → MulChar F R) : R :=
  ∑ x ∈ Finset.univ.filter (fun x : Fin r → F => ∑ i, x i = 1), ∏ i, χ i (x i)

/-- The same sum over `x_1 + ⋯ + x_r = 0`. -/
noncomputable def multiJacobiSumZero {r : ℕ} (χ : Fin r → MulChar F R) : R :=
  ∑ x ∈ Finset.univ.filter (fun x : Fin r → F => ∑ i, x i = 0), ∏ i, χ i (x i)

/-- Conrad's normalisation `(-1)^(r-1) J`. -/
noncomputable def normalizedMultiJacobiSum {r : ℕ} (χ : Fin r → MulChar F R) : R :=
  (-1) ^ (r - 1) * multiJacobiSum χ

theorem multiJacobiSum_two (χ φ : MulChar F R) : multiJacobiSum ![χ, φ] = jacobiSum χ φ := by
  sorry

theorem multiJacobiSum_one (χ : MulChar F R) : multiJacobiSum ![χ] = 1 := by
  sorry

theorem multiJacobiSum_perm {r : ℕ} (χ : Fin r → MulChar F R) (σ : Equiv.Perm (Fin r)) :
    multiJacobiSum (χ ∘ σ) = multiJacobiSum χ := by
  sorry

theorem multiJacobiSum_ringHomComp {R' : Type*} [CommRing R'] {r : ℕ} (χ : Fin r → MulChar F R)
    (f : R →+* R') : multiJacobiSum (fun i => (χ i).ringHomComp f) = f (multiJacobiSum χ) := by
  sorry

/-- Products of Gauss sums with nontrivial product character. -/
theorem prod_gaussSum_eq_gaussSum_mul_multiJacobiSum [IsDomain R] {r : ℕ}
    (χ : Fin r → MulChar F R) (hχ : ∏ i, χ i ≠ 1) {ψ : AddChar F R} (hψ : ψ.IsPrimitive) :
    ∏ i, gaussSum (χ i) ψ = gaussSum (∏ i, χ i) ψ * multiJacobiSum χ := by
  sorry

/-- Products of Gauss sums with trivial product character. -/
theorem prod_gaussSum_eq_neg_card_mul_multiJacobiSum [IsDomain R] {r : ℕ}
    (χ : Fin r → MulChar F R) (hχ : ∏ i, χ i = 1) (hne : ∃ i, χ i ≠ 1) {ψ : AddChar F R}
    (hψ : ψ.IsPrimitive) :
    ∏ i, gaussSum (χ i) ψ = -(Fintype.card F : R) * multiJacobiSum χ := by
  sorry

/-- Unit test `TauCeti.FiniteFieldSums.test_multiJacobiSum_two`: `r = 2` is Mathlib's Jacobi
sum. -/
example (χ φ : MulChar F R) : multiJacobiSum ![χ, φ] = jacobiSum χ φ :=
  multiJacobiSum_two χ φ

/-- Unit test `TauCeti.FiniteFieldSums.test_multiJacobiSum_one`: `r = 1` gives `1`. -/
example (χ : MulChar F R) : multiJacobiSum ![χ] = 1 :=
  multiJacobiSum_one χ

/-- Unit test `TauCeti.FiniteFieldSums.test_multiJacobiSum_trivial_three`: three trivial characters
give `q² - 3q + 3`. -/
example : multiJacobiSum ![(1 : MulChar F R), 1, 1] =
    (Fintype.card F : R) ^ 2 - 3 * Fintype.card F + 3 := by
  sorry

/-- Unit test `TauCeti.FiniteFieldSums.test_multiJacobiSum_not_iterated`: over `𝔽₅`, with `χ` of
order `4`, `J(χ, χ⁻¹, χ) ≠ J(χ, χ⁻¹) · J(1, χ)` (they are `-5` and `-1`). -/
example (χ : MulChar (ZMod 5) ℂ) (hχ : orderOf χ = 4) :
    multiJacobiSum ![χ, χ⁻¹, χ] ≠ jacobiSum χ χ⁻¹ * jacobiSum (χ * χ⁻¹) χ := by
  sorry

end MultiJacobi

/-- The integer multinomial `(b; n_1, …, n_t)` as a product of generalised binomials. -/
def intMultinomial {t : ℕ} (b : ℤ) (n : Fin t → ℕ) : ℤ :=
  ∏ i : Fin t, Ring.choose (b - ∑ j ∈ Finset.univ.filter (fun j : Fin t => j < i), (n j : ℤ)) (n i)

/-- (C1): shifting the top by `p ^ d` does not change the multinomial modulo `p`. -/
theorem intMultinomial_add_prime_pow_modEq {p : ℕ} [Fact p.Prime] {t d : ℕ} (b : ℤ)
    (n : Fin t → ℕ) (hn : ∀ i, n i < p ^ d) :
    intMultinomial (b + p ^ d) n ≡ intMultinomial b n [ZMOD p] := by
  sorry

/-- The digit corollary of (C2): `(a; a_0, a_1 p, …) ≡ 1 (mod p)`. -/
theorem multinomial_digits_modEq_one {p : ℕ} [Fact p.Prime] (a : ℕ) :
    (Nat.multinomial Finset.univ (fun i : Fin (Nat.digits p a).length =>
      (Nat.digits p a)[i] * p ^ (i : ℕ))) ≡ 1 [MOD p] := by
  sorry

section StickelbergerJacobi

open NumberField

variable {L : Type*} [Field L] [NumberField L] (P : Ideal (𝓞 L)) [P.IsMaximal]
  [Fintype (𝓞 L ⧸ P)] [DecidableEq (𝓞 L ⧸ P)]
  (hμ : ∃ ζ : 𝓞 L, IsPrimitiveRoot ζ (Fintype.card (𝓞 L ⧸ P) - 1))

/-- The Jacobi-sum congruence (Conrad 1995, Theorem 2). -/
theorem jacobiSum_teichmuller_congr {r : ℕ} (k : Fin r → ℕ)
    (hk : ∀ i, k i < Fintype.card (𝓞 L ⧸ P) - 1) (hpos : ∃ i, 0 < k i) :
    normalizedMultiJacobiSum (fun i => (teichmuller P hμ)⁻¹ ^ k i) -
      (Nat.multinomial Finset.univ k : 𝓞 L) ∈ P := by
  sorry

end StickelbergerJacobi

/-! ### Stickelberger's relation and the Hasse–Davenport product relation -/

section StickelbergerRelation

open NumberField

variable {m p : ℕ} [NeZero m] [Fact p.Prime] {K L : Type*} [Field K] [Field L] [NumberField K]
  [NumberField L] [Algebra K L] [IsCyclotomicExtension {m} ℚ K]
  (℘ : Ideal (𝓞 K)) [℘.IsMaximal] [Fintype (𝓞 K ⧸ ℘)] [Algebra (ZMod p) (𝓞 K ⧸ ℘)]
  (χ : MulChar (𝓞 K ⧸ ℘) (𝓞 K))
  (hχ : ∀ x : 𝓞 K, x ∉ ℘ →
    χ (Ideal.Quotient.mk ℘ x) * x ^ ((Fintype.card (𝓞 K ⧸ ℘) - 1) / m) - 1 ∈ ℘)
  {ζp : 𝓞 L} (hζp : IsPrimitiveRoot ζp p)

/-- The automorphism `σ_a` of `𝓞 K`, `ζ_m ↦ ζ_m ^ a`. -/
noncomputable def sigmaAut (hm : 0 < m) (a : (ZMod m)ˣ) : 𝓞 K ≃+* 𝓞 K :=
  NumberField.RingOfIntegers.mapRingEquiv
    ((IsCyclotomicExtension.autEquivPow K (Polynomial.cyclotomic.irreducible_rat hm)).symm a).toRingEquiv

/-- **Stickelberger's relation** (Katre, Proposition 4(i)): `(g(χ)^m) = ℘^{mθ}` in `ℚ(ζ_m)`. -/
theorem stickelberger_relation (hm : 0 < m) (hpm : ¬ p ∣ m) :
    ∃ γ : 𝓞 K, algebraMap (𝓞 K) (𝓞 L) γ =
        gaussSum (χ.ringHomComp (algebraMap (𝓞 K) (𝓞 L)))
          (traceAddChar (𝓞 K ⧸ ℘) p ζp hζp.pow_eq_one) ^ m ∧
      Ideal.span {γ} = ∏ a : (ZMod m)ˣ,
        (Ideal.comap (sigmaAut (K := K) hm a).toRingHom ℘) ^ ((a : ZMod m).val) := by
  sorry

/-- The prime factorisation of Jacobi sums (Katre, Proposition 4(ii)). -/
theorem jacobiSum_factorisation (hm : 0 < m) (hpm : ¬ p ∣ m) [DecidableEq (𝓞 K ⧸ ℘)] (j k : ℕ)
    (hj : ¬ m ∣ j) (hk : ¬ m ∣ k) (hjk : ¬ m ∣ j + k) :
    Ideal.span {jacobiSum (χ ^ j) (χ ^ k)} = ∏ a : (ZMod m)ˣ,
      (Ideal.comap (sigmaAut (K := K) hm a).toRingHom ℘) ^
        ((j + k) * (a : ZMod m).val / m - j * (a : ZMod m).val / m - k * (a : ZMod m).val / m) := by
  sorry

end StickelbergerRelation

/-- **The Hasse–Davenport product relation** (Conrad, (A.6)). -/
theorem hasseDavenport_product {F : Type*} [Field F] [Fintype F] {n : ℕ}
    (hn : n ∣ Fintype.card F - 1) (lam : MulChar F ℂ) (hlam : orderOf lam = n) (χ : MulChar F ℂ)
    {ψ : AddChar F ℂ} (hψ : ψ ≠ 1) :
    gaussSum (χ ^ n) ψ * ∏ j ∈ Finset.Ico 1 n, gaussSum (lam ^ j) ψ =
      χ (n : F) ^ n * ∏ j ∈ Finset.range n, gaussSum (χ * lam ^ j) ψ := by
  sorry

/-! ### Measures on `ℤ` and their Fourier transforms (BKK) -/

section IntegerMeasure

/-- `μ̂(θ) = Σ_a μ(a) e(aθ)` for a probability mass function on `ℤ`. -/
noncomputable def intMeasureFourier (μ : PMF ℤ) (θ : AddCircle (1 : ℝ)) : ℂ :=
  ∑' a : ℤ, ((μ a).toReal : ℂ) * (AddCircle.toCircle (a • θ) : ℂ)

theorem intMeasureFourier_zero (μ : PMF ℤ) : intMeasureFourier μ 0 = 1 := by
  sorry

theorem norm_intMeasureFourier_le_one (μ : PMF ℤ) (θ : AddCircle (1 : ℝ)) :
    ‖intMeasureFourier μ θ‖ ≤ 1 := by
  sorry

theorem intMeasureFourier_neg (μ : PMF ℤ) (θ : AddCircle (1 : ℝ)) :
    intMeasureFourier μ (-θ) = (starRingEnd ℂ) (intMeasureFourier μ θ) := by
  sorry

theorem intMeasureFourier_translate (μ : PMF ℤ) (b : ℤ) (θ : AddCircle (1 : ℝ)) :
    intMeasureFourier (μ.map (· + b)) θ = (AddCircle.toCircle (b • θ) : ℂ) * intMeasureFourier μ θ := by
  sorry

theorem intMeasureFourier_ratCast (μ : PMF ℤ) (Q : ℕ) [NeZero Q] (k : ℤ) :
    intMeasureFourier μ ((k / Q : ℝ) : AddCircle (1 : ℝ)) =
      ZMod.dft (fun r : ZMod Q => (((μ.map (fun a : ℤ => (a : ZMod Q))) r).toReal : ℂ)) (-(k : ZMod Q)) := by
  sorry

theorem intMeasureFourier_eq_charFun (μ : PMF ℤ) (t : ℝ) :
    intMeasureFourier μ (t : AddCircle (1 : ℝ)) =
      MeasureTheory.charFun (μ.toMeasure.map (fun a : ℤ => (a : ℝ))) (2 * Real.pi * t) := by
  sorry

theorem intMeasureFourier_dirac (b : ℤ) (θ : AddCircle (1 : ℝ)) :
    intMeasureFourier (PMF.pure b) θ = (AddCircle.toCircle (b • θ) : ℂ) := by
  sorry

/-- **A Fourier gap from residue anticoncentration** (BKK, Lemma 3.6). -/
theorem norm_intMeasureFourier_le_of_residue_mass {η : ℝ} (hη : 0 < η) {P : ℕ} (hP : 2 ≤ P)
    (μ : PMF ℤ)
    (h : ∀ p ∈ P.primeFactors, ∀ b : ℤ,
      ∑' a : ℤ, (if a ≡ b [ZMOD p] then (μ a).toReal else 0) ≤ 1 - η)
    (k : ℤ) (hk : ¬ (P : ℤ) ∣ k) :
    ‖intMeasureFourier μ ((k / P : ℝ) : AddCircle (1 : ℝ))‖ ≤ 1 - 4 * η / P ^ 2 := by
  sorry

/-- Unit test `TauCeti.FiniteFieldSums.test_intMeasureFourier_dirac`: `δ_b ↦ e(bθ)`. -/
example (b : ℤ) (θ : AddCircle (1 : ℝ)) :
    intMeasureFourier (PMF.pure b) θ = (AddCircle.toCircle (b • θ) : ℂ) :=
  intMeasureFourier_dirac b θ

/-- Unit test `TauCeti.FiniteFieldSums.test_intMeasureFourier_uniform_half`: the uniform measure on
`{0, 1}` has transform `0` at `1/2`. -/
example : intMeasureFourier (PMF.uniformOfFinset ({0, 1} : Finset ℤ) ⟨0, by simp⟩)
    ((1 / 2 : ℝ) : AddCircle (1 : ℝ)) = 0 := by
  sorry

/-- Unit test `TauCeti.FiniteFieldSums.test_intMeasureFourier_zero`: `μ̂(0) = 1`. -/
example (μ : PMF ℤ) : intMeasureFourier μ 0 = 1 :=
  intMeasureFourier_zero μ

/-- Unit test `TauCeti.FiniteFieldSums.test_intMeasureFourier_conj`: `μ̂(-θ) = conj μ̂(θ)`. -/
example (μ : PMF ℤ) (θ : AddCircle (1 : ℝ)) :
    intMeasureFourier μ (-θ) = (starRingEnd ℂ) (intMeasureFourier μ θ) :=
  intMeasureFourier_neg μ θ

/-- Unit test `TauCeti.FiniteFieldSums.test_intMeasureFourier_not_normalised`: `δ_0` has
transform `1`, not `1/Q`, at rational frequencies. -/
example (Q : ℕ) (hQ : 2 ≤ Q) (k : ℤ) :
    intMeasureFourier (PMF.pure 0) ((k / Q : ℝ) : AddCircle (1 : ℝ)) = 1 ∧ (1 : ℂ) ≠ 1 / Q := by
  sorry

end IntegerMeasure

/-! ### Harmonic analysis on `F((1/T))` (BKK) -/

section LaurentTorus

variable (F : Type*) [Field F] [Fintype F]

/-- `F[T] → F((1/T))`, `T ↦ u⁻¹`, with Laurent series in `u = 1/T`. -/
noncomputable def laurentOfPoly : F[X] →ₐ[F] LaurentSeries F :=
  Polynomial.aeval (HahnSeries.single (-1 : ℤ) (1 : F))

/-- The residue `res X = c_{-1}` (coefficient of `T⁻¹`, i.e. of `u ^ 1`). -/
noncomputable def residueInfty : LaurentSeries F →ₗ[F] F := by
  sorry

theorem residueInfty_apply (X : LaurentSeries F) : residueInfty F X = X.coeff 1 := by
  sorry

theorem residueInfty_laurentOfPoly (A : F[X]) : residueInfty F (laurentOfPoly F A) = 0 := by
  sorry

theorem residueInfty_T_inv : residueInfty F (HahnSeries.single (1 : ℤ) (1 : F)) = 1 := by
  sorry

variable (p : ℕ) [Fact p.Prime] [Algebra (ZMod p) F]

/-- The residue character `ψ_∞(X) = val(Tr(res X))/p mod 1`. -/
noncomputable def residueChar : LaurentSeries F →+ AddCircle (1 : ℝ) :=
  (ZMod.toAddCircle (N := p)).comp
    ((Algebra.trace (ZMod p) F).toAddMonoidHom.comp (residueInfty F).toAddMonoidHom)

theorem residueChar_laurentOfPoly (A : F[X]) : residueChar F p (laurentOfPoly F A) = 0 := by
  sorry

theorem residueChar_toCircle (X : LaurentSeries F) :
    (AddCircle.toCircle (residueChar F p X) : ℂ) = canonicalAddChar F p (residueInfty F X) := by
  sorry

/-- The several-prime character `ψ_ℙ(X) = Σ_p ψ_p(X_p)`. -/
noncomputable def residueCharMulti (S : Finset Nat.Primes)
    (X : ∀ q : S, LaurentSeries (ZMod ((q : Nat.Primes) : ℕ))) : AddCircle (1 : ℝ) := by
  sorry

theorem residueCharMulti_eq_zero_iff (S : Finset Nat.Primes)
    (X : ∀ q : S, LaurentSeries (ZMod ((q : Nat.Primes) : ℕ))) :
    residueCharMulti S X = 0 ↔ ∀ q : S, (X q).coeff 1 = 0 := by
  sorry

open Classical in
/-- **Residue-pairing duality** (BKK (4.1)). -/
theorem sum_residueChar_div_eq_ite {D : F[X]} (hD : D.Monic) (A : F[X]) :
    ∑ c : Fin D.natDegree → F, (AddCircle.toCircle (residueChar F p
      (laurentOfPoly F A * laurentOfPoly F (∑ i, C (c i) * X ^ (i : ℕ)) *
        (laurentOfPoly F D)⁻¹)) : ℂ) =
      if D ∣ A then (Fintype.card F : ℂ) ^ D.natDegree else 0 := by
  sorry

/-- Unit test `TauCeti.FiniteFieldSums.test_residueChar_T_inv`: over `𝔽_p`, `ψ_p(T⁻¹) = 1/p`. -/
example : residueChar (ZMod p) p (HahnSeries.single (1 : ℤ) (1 : ZMod p)) =
    ((1 / p : ℝ) : AddCircle (1 : ℝ)) := by
  sorry

/-- Unit test `TauCeti.FiniteFieldSums.test_residueChar_one`: `ψ(1) = 0`. -/
example : residueChar F p 1 = 0 := by
  sorry

/-- Unit test `TauCeti.FiniteFieldSums.test_residueChar_poly`: `ψ` vanishes on polynomials. -/
example (A : F[X]) : residueChar F p (laurentOfPoly F A) = 0 :=
  residueChar_laurentOfPoly F p A

/-- Unit test `TauCeti.FiniteFieldSums.test_residueInfty_wrong_variable`: `T = u⁻¹` has residue `0`
although its coefficient at `u⁻¹` is `1`. -/
example : residueInfty F (laurentOfPoly F X) = 0 ∧ (laurentOfPoly F X).coeff (-1) = 1 := by
  sorry

/-- Unit test `TauCeti.FiniteFieldSums.test_residueChar_compat`: the character is the canonical
character of the residue. -/
example (X : LaurentSeries F) :
    (AddCircle.toCircle (residueChar F p X) : ℂ) = canonicalAddChar F p (residueInfty F X) :=
  residueChar_toCircle F p X

end LaurentTorus

section NegPowerTorus

variable (F : Type*) [Field F] [Fintype F]

/-- `T_F`: Laurent series with only negative powers of `T` (positive powers of `u`). -/
def negPowerTorus : AddSubgroup (LaurentSeries F) where
  carrier := {Y | ∀ j : ℤ, j ≤ 0 → Y.coeff j = 0}
  zero_mem' := by
    sorry
  add_mem' := by
    sorry
  neg_mem' := by
    sorry

/-- The fractional part `{Y}`. -/
noncomputable def fractionalPart : LaurentSeries F →+ negPowerTorus F := by
  sorry

/-- The polynomial part of `Y`. -/
noncomputable def polynomialPart : LaurentSeries F →+ F[X] := by
  sorry

theorem laurentOfPoly_polynomialPart_add_fractionalPart (Y : LaurentSeries F) :
    laurentOfPoly F (polynomialPart F Y) + (fractionalPart F Y : LaurentSeries F) = Y := by
  sorry

theorem fractionalPart_laurentOfPoly (A : F[X]) : fractionalPart F (laurentOfPoly F A) = 0 := by
  sorry

/-- Coordinates `X ↦ (i ↦ c_{-(i+1)}(X))`. -/
noncomputable def torusCoords : negPowerTorus F ≃+ (ℕ → F) := by
  sorry

/-- `‖Y‖_T = q^{-m}` for the first nonzero fractional coefficient, `0` if none. -/
noncomputable def torusNorm (Y : LaurentSeries F) : ℝ := by
  sorry

theorem torusNorm_T_inv_pow {r : ℕ} (hr : 1 ≤ r) :
    torusNorm F (HahnSeries.single (r : ℤ) (1 : F)) = (Fintype.card F : ℝ) ^ (-(r : ℤ)) := by
  sorry

theorem torusNorm_div {A B : F[X]} (hB : B ≠ 0) (hBA : ¬ B ∣ A) :
    torusNorm F (laurentOfPoly F A * (laurentOfPoly F B)⁻¹) =
      (Fintype.card F : ℝ) ^ (((A % B).natDegree : ℤ) - B.natDegree) := by
  sorry

theorem torusNorm_lt_iff (Y : negPowerTorus F) (m : ℕ) :
    torusNorm F Y < (Fintype.card F : ℝ) ^ (-(m : ℤ)) ↔
      ∀ i ∈ Finset.Icc 1 m, (Y : LaurentSeries F).coeff (i : ℤ) = 0 := by
  sorry

/-- Unit test `TauCeti.FiniteFieldSums.test_torusNorm_poly`: polynomials have norm `0`. -/
example (A : F[X]) : torusNorm F (laurentOfPoly F A) = 0 := by
  sorry

/-- Unit test `TauCeti.FiniteFieldSums.test_torusNorm_T_inv_pow`: `‖T^{-r}‖ = q^{-r}`. -/
example {r : ℕ} (hr : 1 ≤ r) :
    torusNorm F (HahnSeries.single (r : ℤ) (1 : F)) = (Fintype.card F : ℝ) ^ (-(r : ℤ)) :=
  torusNorm_T_inv_pow F hr

/-- Unit test `TauCeti.FiniteFieldSums.test_torusNorm_ball`: the ball of strict radius `q^{-m}`
fixes the first `m` coefficients. -/
example (Y : negPowerTorus F) (m : ℕ) :
    torusNorm F Y < (Fintype.card F : ℝ) ^ (-(m : ℤ)) ↔
      ∀ i ∈ Finset.Icc 1 m, (Y : LaurentSeries F).coeff (i : ℤ) = 0 :=
  torusNorm_lt_iff F Y m

/-- Unit test `TauCeti.FiniteFieldSums.test_negPowerTorus_not_unital`: `1 ∉ T_F`. -/
example : (1 : LaurentSeries F) ∉ negPowerTorus F := by
  sorry

/-- Unit test `TauCeti.FiniteFieldSums.test_torusCoords_T_inv`: `T⁻¹` has coordinates `e_0`. -/
example (h : HahnSeries.single (1 : ℤ) (1 : F) ∈ negPowerTorus F) :
    torusCoords F ⟨HahnSeries.single (1 : ℤ) (1 : F), h⟩ = Pi.single 0 1 := by
  sorry

variable [MeasurableSpace F] [DiscreteMeasurableSpace F]

open MeasureTheory

/-- The Haar probability measure of `T_F`, in coordinates. -/
noncomputable def torusHaar : Measure (ℕ → F) :=
  Measure.infinitePi (fun _ : ℕ => (PMF.uniformOfFintype F).toMeasure)

instance isProbabilityMeasure_torusHaar : IsProbabilityMeasure (torusHaar F) := by
  sorry

theorem torusHaar_cylinder (m : ℕ) (a : ℕ → F) :
    torusHaar F {c | ∀ i < m, c i = a i} = ((Fintype.card F : ENNReal)⁻¹) ^ m := by
  sorry

theorem torusHaar_map_add (y : ℕ → F) : (torusHaar F).map (· + y) = torusHaar F := by
  sorry

theorem torusHaar_coord (i : ℕ) :
    (torusHaar F).map (fun c => c i) = (PMF.uniformOfFintype F).toMeasure := by
  sorry

theorem torusHaar_ball (m : ℕ) :
    torusHaar F {c | ∀ i < m, c i = 0} = ((Fintype.card F : ENNReal)⁻¹) ^ m := by
  sorry

/-- Unit test `TauCeti.FiniteFieldSums.test_torusHaar_univ`: total mass `1`. -/
example : torusHaar F Set.univ = 1 := by
  sorry

/-- Unit test `TauCeti.FiniteFieldSums.test_torusHaar_first_coord_zero`: `{c_{-1} = 0}` has mass
`1/q`. -/
example : torusHaar F {c | c 0 = 0} = (Fintype.card F : ENNReal)⁻¹ := by
  sorry

/-- Unit test `TauCeti.FiniteFieldSums.test_torusHaar_ball`: the ball of radius `q^{-m}` has mass
`q^{-m}`. -/
example (m : ℕ) : torusHaar F {c | ∀ i < m, c i = 0} = ((Fintype.card F : ENNReal)⁻¹) ^ m :=
  torusHaar_ball F m

/-- Unit test `TauCeti.FiniteFieldSums.test_torusHaar_not_counting`: the measure of
`{c_{-1} = 0}` is not `1` (a point mass at `0` would give `1`). -/
example : torusHaar F {c | c 0 = 0} ≠ 1 := by
  sorry

/-- Unit test `TauCeti.FiniteFieldSums.test_torusHaar_translate`: invariance under translation by
`T⁻¹`. -/
example : (torusHaar F).map (· + Pi.single 0 1) = torusHaar F :=
  torusHaar_map_add F _

/-- A reduced fraction `G / H` with `H` monic of degree `ℓ`, `deg G < ℓ`, `G` and `H` coprime. -/
structure ReducedFraction (ℓ : ℕ) where
  /-- The numerator. -/
  num : F[X]
  /-- The monic denominator. -/
  den : F[X]
  den_monic : den.Monic
  den_natDegree : den.natDegree = ℓ
  degree_num_lt : num.degree < ℓ
  isCoprime : IsCoprime num den

namespace ReducedFraction

variable {F}

/-- `G / H` as an element of the torus. -/
noncomputable def toTorus {ℓ : ℕ} (r : ReducedFraction F ℓ) : negPowerTorus F :=
  ⟨laurentOfPoly F r.num * (laurentOfPoly F r.den)⁻¹, by sorry⟩

/-- The unique reduced fraction of denominator degree `0`. -/
noncomputable def zero : ReducedFraction F 0 where
  num := 0
  den := 1
  den_monic := monic_one
  den_natDegree := natDegree_one
  degree_num_lt := by sorry
  isCoprime := isCoprime_zero_left.2 isUnit_one

theorem torusNorm_sub_ge {ℓ : ℕ} (r s : ReducedFraction F ℓ) (hrs : (r.num, r.den) ≠ (s.num, s.den)) :
    (Fintype.card F : ℝ) ^ (-(2 * ℓ : ℤ)) ≤
      torusNorm F ((r.toTorus : LaurentSeries F) - s.toTorus) := by
  sorry

theorem torusNorm_toTorus {ℓ : ℕ} (r : ReducedFraction F ℓ) (hr : r.num ≠ 0) :
    torusNorm F r.toTorus = (Fintype.card F : ℝ) ^ ((r.num.natDegree : ℤ) - ℓ) := by
  sorry

/-- For `T ∤ H`, `T ^ j` is a unit modulo `H`, so multiplication by it permutes reduced residues. -/
theorem mulTPow_bijective {H : F[X]} (hH : ¬ X ∣ H) (j : ℕ) :
    IsUnit (Ideal.Quotient.mk (Ideal.span {H}) (X ^ j : F[X])) := by
  sorry

end ReducedFraction

/-- Unit test `TauCeti.FiniteFieldSums.test_reducedFraction_zero`: degree `0` forces `0 / 1`. -/
example (r : ReducedFraction F 0) : r.num = 0 ∧ r.den = 1 := by
  sorry

/-- Unit test `TauCeti.FiniteFieldSums.test_reducedFraction_T`: `T` is not a unit modulo `T`. -/
example : ¬ IsUnit (Ideal.Quotient.mk (Ideal.span {(X : F[X])}) (X : F[X])) := by
  sorry

/-- Unit test `TauCeti.FiniteFieldSums.test_reducedFraction_linear_sep`: for `a ≠ b`,
`‖1/(T - a) - 1/(T - b)‖ = q^{-2}`. -/
example {a b : F} (hab : a ≠ b) :
    torusNorm F ((laurentOfPoly F (X - C a))⁻¹ - (laurentOfPoly F (X - C b))⁻¹) =
      (Fintype.card F : ℝ) ^ (-2 : ℤ) := by
  sorry

/-- Unit test `TauCeti.FiniteFieldSums.test_reducedFraction_norm`: `‖1/(T - a)‖ = q^{-1}`. -/
example (a : F) : torusNorm F ((laurentOfPoly F (X - C a))⁻¹) = (Fintype.card F : ℝ) ^ (-1 : ℤ) := by
  sorry

variable (p : ℕ) [Fact p.Prime] [Algebra (ZMod p) F]

open Classical in
/-- **Orthogonality on the torus** (BKK §6). -/
theorem integral_residueChar_eq_ite (A : F[X]) :
    ∫ c, (AddCircle.toCircle (residueChar F p
      (laurentOfPoly F A * ((torusCoords F).symm c : LaurentSeries F))) : ℂ) ∂ torusHaar F =
      if A = 0 then 1 else 0 := by
  sorry

/-- **Integrals of functions of finitely many residues** (BKK, Lemma 6.1). -/
theorem integral_prod_residueChar (m : ℕ) (f : Fin m → AddCircle (1 : ℝ) → ℂ) :
    ∫ c, ∏ j : Fin m, f j (residueChar F p
      (laurentOfPoly F (X ^ (j : ℕ)) * ((torusCoords F).symm c : LaurentSeries F))) ∂ torusHaar F =
      ((p : ℂ)⁻¹) ^ m * ∏ j : Fin m, ∑ ξ : ZMod p, f j (ZMod.toAddCircle ξ) := by
  sorry

end NegPowerTorus

end FF1

end TauCeti.FiniteFieldSums

end FF1File


-- ===== FF.2 =====

section FF2File

/-!
# FF.2 — Weil and Deligne bounds (suggested signatures)

Stage `FiniteFieldsAndCharacterSums:FF.2`. Every declaration below is a suggested form; all
proofs are `sorry`. Names are the packet's `api[].name` and `tests[].name`.

What is imported rather than restated: Mathlib's `AddChar`, `MulChar` (which vanishes at `0`,
also for the trivial character), `gaussSum` with `gaussSum_mul_gaussSum_eq_card`, `Algebra.trace`
and `Algebra.norm`, `Polynomial.resultant`, `AdjoinRoot`, `RatFunc`, `Field.absoluteGaloisGroup`,
`PowerSeries`, `frobeniusNumber_pair` and Newton's identities.

What is omitted, and why. The ℓ-adic carriers — constructible sheaves, `R f_!`, `H^i_c`,
Frobenius eigenvalues and weights, the derived category on which the Fourier–Deligne transform
acts — are supplied by `SchemeAndStackFoundations:SF.0`–`SF.2`, `EtaleDualityAndPerverseSheaves:EDC.2`
and `DeligneWeightsAndPurity:DWP.7`, and are not in Mathlib. The nodes whose statements are about
them are therefore not written here: character-sheaf-trace-formula,
homotopy-invariance-of-endomorphism-action, character-sheaf-cohomology-vanishes,
translation-cancellation, lisse-sheaf-extremal-cohomology-on-curve,
swan-conductor-of-artin-schreier-sheaf, h1c-conductor-bound, deligne-bound-for-trace-functions,
deligne-estimate-for-character-sums, affine-concentration-criterion, rank-one-sheaf-l-function,
artin-schreier-sum-on-curve-bound, involution-eigenvalue-pairing, gauss-sum-frobenius-eigenvalue,
deligne-cohomology-of-polynomial-sheaf, deligne-duality-for-polynomial-sheaf,
fourier-deligne-inversion (its trace-level shadow is stated), fourier-input-for-one-modulus,
uniform-lang-weil-estimate and geometric-chebotarev. Places and zeta functions of function fields
(`FunctionFieldArithmetic:FA.5`, Tau Ceti `AlgebraicCurves`) are not in Mathlib either, so
artin-schreier-curve-point-count, kummer-curve-point-count, artin-schreier-zeta-factorization and
kummer-zeta-factorization are not written; their consequences for the L-polynomials (degree and
purity) are. No `Prop`-valued placeholder stands in for any omitted condition. Rank-one lisse sheaves
on open subsets of the line are modelled, as in FKMS Definition 3.1, by their characters of the
absolute Galois group of `F(X)`; the Fourier–Deligne transform appears through its trace-function
dictionary; Lang–Weil and dimension-from-point-counts appear in their affine form.
-/

namespace TauCeti.FiniteFieldSums

section FF2

open Polynomial

noncomputable section

variable {F : Type*} [Field F] [Fintype F] [DecidableEq F]

/-! ## Companion sums over the finite extensions of `F` -/

/-- `S_L(f, ψ) = Σ_{x ∈ L} ψ(Tr_{L/F}(f(x)))`. -/
def additiveCompanionSum (ψ : AddChar F ℂ) (f : F[X]) (L : Type*) [Field L] [Fintype L]
    [Algebra F L] : ℂ :=
  ∑ x : L, ψ (Algebra.trace F L (aeval x f))

section AdditiveCompanion

variable (ψ : AddChar F ℂ) (f : F[X]) (L : Type*) [Field L] [Fintype L] [Algebra F L]

theorem additiveCompanionSum_self : additiveCompanionSum ψ f F = ∑ x : F, ψ (f.eval x) := by
  sorry

theorem additiveCompanionSum_congr {L' : Type*} [Field L'] [Fintype L'] [Algebra F L']
    (e : L ≃ₐ[F] L') : additiveCompanionSum ψ f L = additiveCompanionSum ψ f L' := by
  sorry

theorem additiveCompanionSum_add_C (c : F) :
    additiveCompanionSum ψ (f + C c) L = ψ c ^ Module.finrank F L * additiveCompanionSum ψ f L := by
  sorry

theorem additiveCompanionSum_mulShift (a : F) :
    additiveCompanionSum (ψ.mulShift a) f L = additiveCompanionSum ψ (C a * f) L := by
  sorry

theorem norm_additiveCompanionSum_le : ‖additiveCompanionSum ψ f L‖ ≤ Fintype.card L := by
  sorry

/-- Unit test `additiveCompanionSum_test_zero`: the zero phase gives `|L|`. -/
example : additiveCompanionSum ψ 0 L = Fintype.card L := by sorry

/-- Unit test `additiveCompanionSum_test_X`: a nontrivial character sums to zero on `L`. -/
example (hψ : ψ ≠ 1) : additiveCompanionSum ψ X L = 0 := by sorry

/-- Unit test `additiveCompanionSum_test_const`: a constant phase is summed through the trace,
giving `ψ(c)^[L:F]`, not `ψ(c)`. -/
example (c : F) :
    additiveCompanionSum ψ (C c) L = Fintype.card L * ψ c ^ Module.finrank F L := by sorry

/-- Unit test `additiveCompanionSum_test_trivialChar`: the trivial character gives `|L|`. -/
example : additiveCompanionSum (1 : AddChar F ℂ) f L = Fintype.card L := by sorry

end AdditiveCompanion

/-- `S̃_L(g, χ) = Σ_{x ∈ L} χ(N_{L/F}(g(x)))`. -/
def multiplicativeCompanionSum (χ : MulChar F ℂ) (g : F[X]) (L : Type*) [Field L] [Fintype L]
    [Algebra F L] : ℂ :=
  ∑ x : L, χ (Algebra.norm F (aeval x g))

section MultiplicativeCompanion

variable (χ : MulChar F ℂ) (g : F[X]) (L : Type*) [Field L] [Fintype L] [Algebra F L]

theorem multiplicativeCompanionSum_self :
    multiplicativeCompanionSum χ g F = ∑ x : F, χ (g.eval x) := by
  sorry

theorem multiplicativeCompanionSum_congr {L' : Type*} [Field L'] [Fintype L'] [Algebra F L']
    (e : L ≃ₐ[F] L') : multiplicativeCompanionSum χ g L = multiplicativeCompanionSum χ g L' := by
  sorry

theorem multiplicativeCompanionSum_C_mul (c : F) :
    multiplicativeCompanionSum χ (C c * g) L =
      χ c ^ Module.finrank F L * multiplicativeCompanionSum χ g L := by
  sorry

theorem norm_multiplicativeCompanionSum_le :
    ‖multiplicativeCompanionSum χ g L‖ ≤ Fintype.card L := by
  sorry

/-- Unit test `multiplicativeCompanionSum_test_one`: the constant `1` gives `|L|`. -/
example : multiplicativeCompanionSum χ 1 L = Fintype.card L := by sorry

/-- Unit test `multiplicativeCompanionSum_test_X`: a nontrivial character sums to zero. -/
example (hχ : χ ≠ 1) : multiplicativeCompanionSum χ X L = 0 := by sorry

/-- Unit test `multiplicativeCompanionSum_test_trivialChar`: Mathlib's trivial character vanishes
at `0`, so the count is `|L| - 1`, not `|L|`. -/
example : multiplicativeCompanionSum (1 : MulChar F ℂ) X L = Fintype.card L - 1 := by sorry

end MultiplicativeCompanion

/-! ## L-series of functions on monic polynomials -/

/-- (FF.2/monic-polynomials-of-degree, moved from FF.3 at merge.) The monic polynomials of degree `n` over the finite field `F`, as a finite set: the image of the
coefficient vectors `v : Fin n → F` under `v ↦ X ^ n + ∑ i, v i • X ^ i`. -/
def monicOfDegree (F : Type*) [Field F] [Fintype F] [DecidableEq F] (n : ℕ) : Finset F[X] := by
  classical
  exact Finset.univ.image fun v : Fin n → F => X ^ n + ((degreeLTEquiv F n).symm v : F[X])

theorem mem_monicOfDegree {f : F[X]} {n : ℕ} :
    f ∈ monicOfDegree F n ↔ f.Monic ∧ f.natDegree = n := sorry

theorem card_monicOfDegree (n : ℕ) : (monicOfDegree F n).card = Fintype.card F ^ n := sorry

theorem monicOfDegree_zero : monicOfDegree F 0 = {1} := sorry

/-- Unit test `monicOfDegree_one_zmod_two`: the monic linear polynomials over `𝔽₂` are `X` and
`X + 1`. -/
example : monicOfDegree (ZMod 2) 1 = {X, X + 1} := sorry

/-- Unit test `card_monicOfDegree_zmod_three_two`: there are `9` monic quadratics over `𝔽₃`. -/
example : (monicOfDegree (ZMod 3) 2).card = 9 := sorry

/-- Unit test `C_two_mul_X_not_mem_monicOfDegree`: `2X` over `𝔽₃` has degree one but is not
monic. -/
example : (C 2 * X : (ZMod 3)[X]) ∉ monicOfDegree (ZMod 3) 1 := sorry


/-- `L(Λ; T) = Σ_n (Σ_{h monic, deg h = n} Λ(h)) T^n`. -/
def monicLSeries (Λ : F[X] → ℂ) : PowerSeries ℂ :=
  PowerSeries.mk fun n => ∑ h ∈ monicOfDegree F n, Λ h

section MonicLSeries

variable (Λ : F[X] → ℂ)

theorem monicLSeries_coeff (n : ℕ) :
    PowerSeries.coeff n (monicLSeries Λ) = ∑ h ∈ monicOfDegree F n, Λ h := by sorry

theorem monicLSeries_constantCoeff : PowerSeries.constantCoeff (monicLSeries Λ) = Λ 1 := by sorry

theorem monicLSeries_coeff_one : PowerSeries.coeff 1 (monicLSeries Λ) = ∑ a : F, Λ (X + C a) := by
  sorry

theorem monicLSeries_isPolynomial (N : ℕ)
    (h : ∀ n, N ≤ n → PowerSeries.coeff n (monicLSeries Λ) = 0) :
    ∃ P : ℂ[X], P.natDegree < N ∧ (P : PowerSeries ℂ) = monicLSeries Λ := by sorry

open scoped Classical in
/-- The power sums `W_ν = Σ_{π monic irreducible, deg π ∣ ν} deg π · Λ(π)^{ν/deg π}`. -/
def monicLSeriesPowerSum (ν : ℕ) : ℂ :=
  ∑ e ∈ ν.divisors, ∑ π ∈ (monicOfDegree F e).filter (fun π => Irreducible π),
    (e : ℂ) * Λ π ^ (ν / e)

/-- FF.2/monic-l-series-log-derivative, Euler-product form. -/
theorem monicLSeries_logDeriv (h1 : Λ 1 = 1)
    (hmul : ∀ g h : F[X], g.Monic → h.Monic → Λ (g * h) = Λ g * Λ h) :
    PowerSeries.X * PowerSeries.derivative ℂ (monicLSeries Λ) =
      monicLSeries Λ * PowerSeries.mk (fun ν => if ν = 0 then 0 else monicLSeriesPowerSum Λ ν) := by
  sorry

/-- FF.2/monic-l-series-log-derivative, extension-field form of the power sums. -/
theorem monicLSeriesPowerSum_eq_sum (L : Type*) [Field L] [Fintype L] [Algebra F L]
    (w : L → ℂ)
    (hw : ∀ x : L, w x = Λ (minpoly F x) ^ (Module.finrank F L / (minpoly F x).natDegree)) :
    monicLSeriesPowerSum Λ (Module.finrank F L) = ∑ x : L, w x := by
  sorry

/-- Unit test `monicLSeries_test_one`: `Λ ≡ 1` gives `q^n`, the zeta function of the line. -/
example (n : ℕ) :
    PowerSeries.coeff n (monicLSeries (fun _ : F[X] => (1 : ℂ))) = (Fintype.card F : ℂ) ^ n := by
  sorry

/-- Unit test `monicLSeries_test_units`: `Λ(h) = [h(0) ≠ 0]` gives `q^n - q^{n-1}`. -/
example (n : ℕ) (hn : 1 ≤ n) :
    PowerSeries.coeff n (monicLSeries (fun h : F[X] => if h.eval 0 ≠ 0 then (1 : ℂ) else 0)) =
      (Fintype.card F : ℂ) ^ n - (Fintype.card F : ℂ) ^ (n - 1) := by
  sorry

/-- Unit test `monicLSeries_test_card`: the only monic polynomial of degree `0` is `1`. -/
example : monicOfDegree F 0 = {1} := by sorry

end MonicLSeries

/-! ## Root-sum characters -/

/-- `λ_{f,ψ}(h) = ψ(Tr_{F[X]/(h) / F}(f mod h))`. -/
def rootSumAddChar (ψ : AddChar F ℂ) (f h : F[X]) : ℂ :=
  ψ (Algebra.trace F (AdjoinRoot h) (AdjoinRoot.mk h f))

section RootSumAdd

variable (ψ : AddChar F ℂ) (f : F[X])

theorem rootSumAddChar_one : rootSumAddChar ψ f 1 = 1 := by sorry

theorem rootSumAddChar_mul {g h : F[X]} (hg : g.Monic) (hh : h.Monic) :
    rootSumAddChar ψ f (g * h) = rootSumAddChar ψ f g * rootSumAddChar ψ f h := by sorry

theorem rootSumAddChar_X_sub_C (a : F) : rootSumAddChar ψ f (X - C a) = ψ (f.eval a) := by sorry

theorem rootSumAddChar_eq_sum_roots {K : Type*} [Field K] [Algebra F K] {h : F[X]}
    (hh : h.Monic) (hs : (h.map (algebraMap F K)).Splits) :
    ∃ t : F, algebraMap F K t = ((h.map (algebraMap F K)).roots.map (fun α => aeval α f)).sum ∧
      rootSumAddChar ψ f h = ψ t := by
  sorry

theorem rootSumAddChar_minpoly_pow (L : Type*) [Field L] [Fintype L] [Algebra F L] (x : L) :
    rootSumAddChar ψ f (minpoly F x) ^ (Module.finrank F L / (minpoly F x).natDegree) =
      ψ (Algebra.trace F L (aeval x f)) := by
  sorry

theorem rootSumAddChar_add (g : F[X]) {h : F[X]} (hh : h.Monic) :
    rootSumAddChar ψ (f + g) h = rootSumAddChar ψ f h * rootSumAddChar ψ g h := by sorry

/-- FF.2/root-sum-additive-top-coefficients: for `deg h ≥ deg f = d`, changing the coefficient of
`X^{deg h - d}` by `c` multiplies `λ(h)` by `ψ(-d · lc(f) · c)`. -/
theorem rootSumAddChar_top_coefficient {h : F[X]} (hh : h.Monic)
    (hd : f.natDegree ≤ h.natDegree) (hpos : 0 < f.natDegree) (c : F) :
    rootSumAddChar ψ f (h + C c * X ^ (h.natDegree - f.natDegree)) =
      ψ (-(f.natDegree : F) * f.leadingCoeff * c) * rootSumAddChar ψ f h := by
  sorry

/-- Unit test `rootSumAddChar_test_zero`: the zero phase gives `1` on monic polynomials. -/
example {h : F[X]} (hh : h.Monic) : rootSumAddChar ψ 0 h = 1 := by sorry

/-- Unit test `rootSumAddChar_test_X_quadratic`: for `f = X`, `λ(X² + aX + b) = ψ(-a)`. -/
example (a b : F) : rootSumAddChar ψ X (X ^ 2 + C a * X + C b) = ψ (-a) := by sorry

/-- Unit test `rootSumAddChar_test_const`: a constant phase gives `ψ(c)^{deg h}`. -/
example (c : F) {h : F[X]} (hh : h.Monic) :
    rootSumAddChar ψ (C c) h = ψ c ^ h.natDegree := by sorry

end RootSumAdd

/-- `μ_{g,χ}(h) = χ(Res(h, g))`. -/
def rootSumMulChar (χ : MulChar F ℂ) (g h : F[X]) : ℂ :=
  χ (Polynomial.resultant h g)

section RootSumMul

variable (χ : MulChar F ℂ) (g : F[X])

theorem rootSumMulChar_one : rootSumMulChar χ g 1 = 1 := by sorry

theorem rootSumMulChar_mul {h₁ h₂ : F[X]} (h₁m : h₁.Monic) (h₂m : h₂.Monic) :
    rootSumMulChar χ g (h₁ * h₂) = rootSumMulChar χ g h₁ * rootSumMulChar χ g h₂ := by sorry

theorem rootSumMulChar_X_sub_C (a : F) : rootSumMulChar χ g (X - C a) = χ (g.eval a) := by sorry

theorem rootSumMulChar_eq_prod_roots {K : Type*} [Field K] [Algebra F K] {h : F[X]}
    (hh : h.Monic) (hs : (h.map (algebraMap F K)).Splits) :
    ∃ t : F, algebraMap F K t = ((h.map (algebraMap F K)).roots.map (fun α => aeval α g)).prod ∧
      rootSumMulChar χ g h = χ t := by
  sorry

theorem rootSumMulChar_minpoly_pow (L : Type*) [Field L] [Fintype L] [Algebra F L] (x : L) :
    rootSumMulChar χ g (minpoly F x) ^ (Module.finrank F L / (minpoly F x).natDegree) =
      χ (Algebra.norm F (aeval x g)) := by
  sorry

theorem rootSumMulChar_mul_right (g' : F[X]) {h : F[X]} (hh : h.Monic) :
    rootSumMulChar χ (g * g') h = rootSumMulChar χ g h * rootSumMulChar χ g' h := by sorry

/-- FF.2/root-sum-multiplicative-periodicity: `μ(h)` depends only on `deg h` and on `h` modulo the
radical of `g`. -/
theorem rootSumMulChar_periodic {h₁ h₂ : F[X]} (h₁m : h₁.Monic) (h₂m : h₂.Monic)
    (hdeg : h₁.natDegree = h₂.natDegree)
    (hcong : UniqueFactorizationMonoid.radical g ∣ h₁ - h₂) :
    rootSumMulChar χ g h₁ = rootSumMulChar χ g h₂ := by
  sorry

/-- Unit test `rootSumMulChar_test_one`: `g = 1` gives `1` on monic polynomials. -/
example {h : F[X]} (hh : h.Monic) : rootSumMulChar χ 1 h = 1 := by sorry

/-- Unit test `rootSumMulChar_test_X`: for `g = X`, `μ(h) = χ((-1)^{deg h} h(0))`. -/
example {h : F[X]} (hh : h.Monic) :
    rootSumMulChar χ X h = χ ((-1) ^ h.natDegree * h.eval 0) := by sorry

/-- Unit test `rootSumMulChar_test_trivialChar`: with Mathlib's trivial character, `μ(X) = 0` for
`g = X` (the classical convention would give `1`). -/
example : rootSumMulChar (1 : MulChar F ℂ) X X = 0 := by sorry

end RootSumMul

/-! ## The L-functions of additive and multiplicative sums -/

/-- `L(f, ψ; T)`. -/
def additiveLFunction (ψ : AddChar F ℂ) (f : F[X]) : PowerSeries ℂ :=
  monicLSeries (rootSumAddChar ψ f)

/-- `Z(g, χ; T)`. -/
def multiplicativeLFunction (χ : MulChar F ℂ) (g : F[X]) : PowerSeries ℂ :=
  monicLSeries (rootSumMulChar χ g)

section LFunctions

variable (ψ : AddChar F ℂ) (χ : MulChar F ℂ) (f g : F[X])

theorem additiveLFunction_coeff_one :
    PowerSeries.coeff 1 (additiveLFunction ψ f) = ∑ x : F, ψ (f.eval x) := by sorry

/-- The logarithmic derivative in terms of companion sums over a family `E ν` of extensions of
degree `ν`. -/
theorem additiveLFunction_logDeriv (E : ℕ → Type*) [∀ ν, Field (E ν)] [∀ ν, Fintype (E ν)]
    [∀ ν, Algebra F (E ν)] (hE : ∀ ν, Module.finrank F (E ν) = ν) :
    PowerSeries.X * PowerSeries.derivative ℂ (additiveLFunction ψ f) =
      additiveLFunction ψ f *
        PowerSeries.mk (fun ν => if ν = 0 then 0 else additiveCompanionSum ψ f (E ν)) := by
  sorry

theorem additiveLFunction_add_C (c : F) (n : ℕ) :
    PowerSeries.coeff n (additiveLFunction ψ (f + C c)) =
      ψ c ^ n * PowerSeries.coeff n (additiveLFunction ψ f) := by sorry

theorem additiveLFunction_mulShift (a : F) :
    additiveLFunction (ψ.mulShift a) f = additiveLFunction ψ (C a * f) := by sorry

theorem multiplicativeLFunction_coeff_one :
    PowerSeries.coeff 1 (multiplicativeLFunction χ g) = ∑ x : F, χ (g.eval x) := by sorry

theorem multiplicativeLFunction_logDeriv (E : ℕ → Type*) [∀ ν, Field (E ν)]
    [∀ ν, Fintype (E ν)] [∀ ν, Algebra F (E ν)] (hE : ∀ ν, Module.finrank F (E ν) = ν) :
    PowerSeries.X * PowerSeries.derivative ℂ (multiplicativeLFunction χ g) =
      multiplicativeLFunction χ g *
        PowerSeries.mk (fun ν => if ν = 0 then 0 else multiplicativeCompanionSum χ g (E ν)) := by
  sorry

theorem multiplicativeLFunction_C_mul (c : F) (n : ℕ) :
    PowerSeries.coeff n (multiplicativeLFunction χ (C c * g)) =
      χ c ^ n * PowerSeries.coeff n (multiplicativeLFunction χ g) := by sorry

/-- Unit test `additiveLFunction_test_zero`: `L(0, ψ; T) = 1/(1 - qT)`. -/
example (n : ℕ) :
    PowerSeries.coeff n (additiveLFunction ψ 0) = (Fintype.card F : ℂ) ^ n := by sorry

/-- Unit test `additiveLFunction_test_X`: `L(X, ψ; T) = 1` for `ψ ≠ 1`. -/
example (hψ : ψ ≠ 1) (n : ℕ) (hn : 1 ≤ n) :
    PowerSeries.coeff n (additiveLFunction ψ X) = 0 := by sorry

/-- Unit test `additiveLFunction_test_artinSchreier`: for the primitive character through the
trace to the prime field, `X^p - X` gives `1/(1 - qT)`: not a polynomial although `deg = p`. -/
example (n : ℕ) :
    PowerSeries.coeff n (additiveLFunction (AddChar.FiniteField.primitiveChar_to_Complex F)
      (X ^ ringChar F - X)) = (Fintype.card F : ℂ) ^ n := by
  sorry

/-- Unit test `multiplicativeLFunction_test_one`: `Z(1, χ; T) = 1/(1 - qT)`. -/
example (n : ℕ) :
    PowerSeries.coeff n (multiplicativeLFunction χ 1) = (Fintype.card F : ℂ) ^ n := by sorry

/-- Unit test `multiplicativeLFunction_test_X`: `Z(X, χ; T) = 1` for `χ ≠ 1`. -/
example (hχ : χ ≠ 1) (n : ℕ) (hn : 1 ≤ n) :
    PowerSeries.coeff n (multiplicativeLFunction χ X) = 0 := by sorry

/-- Unit test `multiplicativeLFunction_test_perfectPower`: `g = X^e`, `e = orderOf χ ≥ 2`, is
degenerate: `Z = (1 - T)/(1 - qT)`. -/
example (hχ : 2 ≤ orderOf χ) (n : ℕ) (hn : 1 ≤ n) :
    PowerSeries.coeff n (multiplicativeLFunction χ (X ^ orderOf χ)) =
      (Fintype.card F : ℂ) ^ n - (Fintype.card F : ℂ) ^ (n - 1) := by
  sorry

/-- FF.2/additive-l-function-is-polynomial (Kowalski Proposition 5.9). -/
theorem additiveLFunction_isPolynomial (hψ : ψ ≠ 1) (hd : 0 < f.natDegree)
    (hp : ¬ ringChar F ∣ f.natDegree) (n : ℕ) (hn : f.natDegree ≤ n) :
    PowerSeries.coeff n (additiveLFunction ψ f) = 0 := by
  sorry

/-- FF.2/multiplicative-l-function-is-polynomial (Kowalski Proposition 4.5, Corollary 4.3). -/
theorem multiplicativeLFunction_isPolynomial (hχ : 2 ≤ orderOf χ) (hg : g ≠ 0)
    (hnot : ¬ ∃ (c : AlgebraicClosure F) (k : (AlgebraicClosure F)[X]),
      g.map (algebraMap F (AlgebraicClosure F)) = C c * k ^ orderOf χ)
    (n : ℕ) (hn : Nat.card (g.rootSet (AlgebraicClosure F)) ≤ n) :
    PowerSeries.coeff n (multiplicativeLFunction χ g) = 0 := by
  sorry

/-- FF.2/mixed-l-function-is-polynomial. -/
theorem mixedLFunction_isPolynomial (hψ : ψ ≠ 1) (hd : 0 < f.natDegree)
    (hp : ¬ ringChar F ∣ f.natDegree) (hg : g ≠ 0) (N : ℕ)
    (hN : f.natDegree + Nat.card (g.rootSet (AlgebraicClosure F)) ≤ N) :
    PowerSeries.coeff N (monicLSeries (fun h => rootSumAddChar ψ f h * rootSumMulChar χ g h)) =
      0 := by
  sorry

end LFunctions

/-- FF.2/primitive-ring-gauss-sum-norm: the Gauss sum of a primitive character of
`R = F[X]/(g)` against `ψ₁ = ψ ∘ ℓ_{m-1}` (coefficient of `X^{m-1}` of the reduced representative). -/
theorem gaussSum_mul_gaussSum_primitive_ring (g : F[X]) (hg : g.Monic) (hsq : Squarefree g)
    (hd : 1 ≤ g.natDegree) [Fintype (AdjoinRoot g)] (ψ : AddChar F ℂ) (hψ : ψ ≠ 1)
    (η : MulChar (AdjoinRoot g) ℂ)
    (hprim : ∀ π : F[X], Irreducible π → π ∣ g →
      ∃ r : F[X], IsCoprime r π ∧ g /ₘ π ∣ r - 1 ∧ η (AdjoinRoot.mk g r) ≠ 1) :
    gaussSum η (ψ.compAddMonoidHom
        ((Polynomial.lcoeff F (g.natDegree - 1)).comp (AdjoinRoot.modByMonicHom hg)).toAddMonoidHom) *
      gaussSum η⁻¹ (ψ.compAddMonoidHom
        ((Polynomial.lcoeff F (g.natDegree - 1)).comp
          (AdjoinRoot.modByMonicHom hg)).toAddMonoidHom)⁻¹ =
      (Fintype.card F : ℂ) ^ g.natDegree := by
  sorry

/-- FF.2/multiplicative-l-function-leading-coefficient (Kowalski Corollary 4.9): degree exactly
`m - 1` and leading coefficient of absolute value `q^{(m-1)/2}`. The multiplicity condition on the
irreducible factors is stated through the root multiplicities over `F̄` (equal, `F` being perfect). -/
theorem multiplicativeLFunction_leadingCoeff (χ : MulChar F ℂ) (hχ : 2 ≤ orderOf χ) (g : F[X])
    (hd : 0 < g.natDegree) (hdeg : ¬ orderOf χ ∣ g.natDegree)
    (hmult : ∀ a ∈ g.rootSet (AlgebraicClosure F),
      ¬ orderOf χ ∣ (g.map (algebraMap F (AlgebraicClosure F))).rootMultiplicity a)
    (P : ℂ[X]) (hP : (P : PowerSeries ℂ) = multiplicativeLFunction χ g) :
    P.natDegree = Nat.card (g.rootSet (AlgebraicClosure F)) - 1 ∧
      ‖P.leadingCoeff‖ =
        Real.sqrt (Fintype.card F) ^ (Nat.card (g.rootSet (AlgebraicClosure F)) - 1) := by
  sorry

/-- FF.2/multiplicative-l-function-functional-equation, for `g` squarefree, in coefficient form:
`Z(g, χ; T) = W′ T^{m-1} Z(g, χ⁻¹; (qT)⁻¹)` with `|W′| = q^{(m-1)/2}`. The node gives `W′` explicitly
through the Gauss sum of the primitive character attached to `χ` and `g`; the signature asserts its
existence and absolute value. -/
theorem multiplicativeLFunction_functionalEquation (χ : MulChar F ℂ) (hχ : 2 ≤ orderOf χ)
    (g : F[X]) (hsq : Squarefree g) (hd : 0 < g.natDegree) (hdeg : ¬ orderOf χ ∣ g.natDegree)
    (P P' : ℂ[X]) (hP : (P : PowerSeries ℂ) = multiplicativeLFunction χ g)
    (hP' : (P' : PowerSeries ℂ) = multiplicativeLFunction χ⁻¹ g) :
    ∃ W : ℂ, ‖W‖ = Real.sqrt (Fintype.card F) ^ (g.natDegree - 1) ∧
      ∀ k ≤ g.natDegree - 1,
        P.coeff k * (Fintype.card F : ℂ) ^ (g.natDegree - 1 - k) =
          W * P'.coeff (g.natDegree - 1 - k) := by
  sorry

/-- FF.2/l-function-reciprocal-roots: a polynomial monic L-series has its power sums equal to
minus the power sums of the reciprocal roots (the roots of the reverse polynomial). -/
theorem lFunction_reciprocalRoots (Λ : F[X] → ℂ) (W : ℕ → ℂ)
    (hW : PowerSeries.X * PowerSeries.derivative ℂ (monicLSeries Λ) =
      monicLSeries Λ * PowerSeries.mk W)
    (P : ℂ[X]) (hP : (P : PowerSeries ℂ) = monicLSeries Λ) (h0 : P.coeff 0 = 1)
    (ν : ℕ) (hν : 1 ≤ ν) : W ν = -((P.reverse.roots).map (fun ω => ω ^ ν)).sum := by
  sorry

/-! ## Averaging and point counts -/

/-- FF.2/trace-kernel-artin-schreier (additive Hilbert 90). -/
theorem trace_eq_zero_iff_exists_pow_card_sub (L : Type*) [Field L] [Fintype L] [Algebra F L]
    (z : L) : Algebra.trace F L z = 0 ↔ ∃ y : L, y ^ Fintype.card F - y = z := by
  sorry

/-- FF.2/artin-schreier-point-count-average (Kowalski Lemma 5.1). -/
theorem artinSchreier_pointCount_average (ψ : AddChar F ℂ) (hψ : ψ ≠ 1) (f : F[X])
    (L : Type*) [Field L] [Fintype L] [Algebra F L] [DecidableEq L] :
    ∑ a ∈ (Finset.univ.filter fun a : F => a ≠ 0), additiveCompanionSum ψ (C a * f) L =
      (Fintype.card {xy : L × L // xy.2 ^ Fintype.card F - xy.2 = aeval xy.1 f} : ℂ) -
        Fintype.card L := by
  sorry

open scoped Classical in
/-- FF.2/kummer-point-count-average (Kowalski Lemma 4.16). -/
theorem kummer_pointCount_average (d : ℕ) (hd : d ∣ Fintype.card F - 1) (g : F[X])
    (L : Type*) [Field L] [Fintype L] [Algebra F L] [DecidableEq L] :
    ∑ᶠ (χ : MulChar F ℂ) (_ : χ ≠ 1 ∧ χ ^ d = 1), multiplicativeCompanionSum χ g L =
      (Fintype.card {xy : L × L // xy.2 ^ d = aeval xy.1 g} : ℂ) - Fintype.card L := by
  sorry

/-! ## Stepanov's method (Bombieri's version) -/

/-- The Stepanov ring `F[X][Y]/(P(Y) - g(X))`: the outer polynomial variable is `Y`. -/
abbrev stepanovRing (P g : F[X]) : Type _ :=
  AdjoinRoot (P.map (C : F →+* F[X]) - C g)

namespace stepanovRing

variable (P g : F[X])

/-- The `F[X]`-basis `1, Y, …, Y^{n-1}`. -/
def basis (hP : P.Monic) (hdeg : 1 ≤ P.natDegree) :
    Module.Basis (Fin P.natDegree) F[X] (stepanovRing P g) := sorry

/-- Points of the curve `P(y) = g(x)` with values in `K`. -/
def pointsEquiv (K : Type*) [Field K] [Algebra F K] :
    (stepanovRing P g →ₐ[F] K) ≃ {xy : K × K // aeval xy.2 P = aeval xy.1 g} := sorry

theorem finrank (hP : P.Monic) (hdeg : 1 ≤ P.natDegree) :
    Module.finrank F[X] (stepanovRing P g) = P.natDegree := by sorry

/-- The Frobenius twist `f ↦ f ∘ Fr` (variables raised to the `|F|`-th power, coefficients kept). -/
def frobeniusTwist : stepanovRing P g →ₐ[F] stepanovRing P g := sorry

theorem frobenius_pow (f : stepanovRing P g) :
    frobeniusTwist P g f = f ^ Fintype.card F := by sorry

/-- The Kummer automorphism `Y ↦ ξY` for `P = Y^d`, `ξ^d = 1`. -/
def kummerRotate (d : ℕ) (ξ : F) (hξ : ξ ^ d = 1) :
    stepanovRing (X ^ d) g ≃ₐ[F[X]] stepanovRing (X ^ d) g := sorry

/-- The Artin–Schreier automorphism `Y ↦ Y + a` for `P = Y^q - Y`, `a^q = a`. -/
def artinSchreierShift (q : ℕ) (a : F) (ha : a ^ q = a) :
    stepanovRing (X ^ q - X) g ≃ₐ[F[X]] stepanovRing (X ^ q - X) g := sorry

end stepanovRing

/-- Unit test `stepanovRing_test_finrank`: `F[X][Y]/(Y² - X³ - 1)` has rank `2` over `F[X]`. -/
example [Fact (Nat.Prime 5)] :
    Module.finrank (ZMod 5)[X] (stepanovRing (X ^ 2 : (ZMod 5)[X]) (X ^ 3 + 1)) = 2 := by
  sorry

/-- Unit test `stepanovRing_test_points`: `y² = x³ + 1` has `5` points over `ZMod 5`. -/
example : Fintype.card {xy : ZMod 5 × ZMod 5 // xy.2 ^ 2 = xy.1 ^ 3 + 1} = 5 := by sorry

/-- Unit test `stepanovRing_test_not_coprime`: with `gcd(n, m) = 2` the ring is not a domain. -/
example : ¬ IsDomain (stepanovRing (X ^ 2 : (ZMod 3)[X]) (X ^ 2)) := by sorry

section PoleDegree

variable {P g : F[X]}

/-- The pole degree at infinity, `deg(Σ g_i Y^i) = max (n deg g_i + i m)`. -/
def poleDegree (f : stepanovRing P g) : WithBot ℕ := sorry

theorem poleDegree_X :
    poleDegree (algebraMap F[X] (stepanovRing P g) X) = (P.natDegree : WithBot ℕ) := by sorry

theorem poleDegree_Y :
    poleDegree (AdjoinRoot.root (P.map (C : F →+* F[X]) - C g)) = (g.natDegree : WithBot ℕ) := by
  sorry

theorem poleDegree_C (a : F[X]) (ha : a ≠ 0) :
    poleDegree (algebraMap F[X] (stepanovRing P g) a) =
      ((P.natDegree * a.natDegree : ℕ) : WithBot ℕ) := by sorry

theorem poleDegree_add_le (f₁ f₂ : stepanovRing P g) :
    poleDegree (f₁ + f₂) ≤ max (poleDegree f₁) (poleDegree f₂) := by sorry

/-- FF.2/pole-degree-mul (Kowalski Proposition 4.20(1), Proposition 5.6(1)). -/
theorem poleDegree_mul (hP : P.Monic) (hcop : Nat.Coprime P.natDegree g.natDegree)
    (hn : 1 ≤ P.natDegree) (hm : 1 ≤ g.natDegree) (f₁ f₂ : stepanovRing P g) :
    poleDegree (f₁ * f₂) = poleDegree f₁ + poleDegree f₂ := by sorry

theorem poleDegree_eq_bot_iff (f : stepanovRing P g) : poleDegree f = ⊥ ↔ f = 0 := by sorry

/-- Unit test `poleDegree_test_one`: `deg 1 = 0`. -/
example : poleDegree (1 : stepanovRing P g) = 0 := by sorry

/-- Unit test `poleDegree_test_Y_pow`: `deg Y^n = n m`. -/
example (hP : P.Monic) (hcop : Nat.Coprime P.natDegree g.natDegree) :
    poleDegree ((AdjoinRoot.root (P.map (C : F →+* F[X]) - C g)) ^ P.natDegree) =
      ((P.natDegree * g.natDegree : ℕ) : WithBot ℕ) := by sorry

end PoleDegree

/-- Unit test `poleDegree_test_not_Ydegree`: on `Y² = X³`, `deg Y² = 6`, not the `Y`-degree `2`. -/
example [Fact (Nat.Prime 5)] :
    poleDegree ((AdjoinRoot.root ((X ^ 2 : (ZMod 5)[X]).map (C : ZMod 5 →+* (ZMod 5)[X]) -
      C (X ^ 3)) : stepanovRing (X ^ 2 : (ZMod 5)[X]) (X ^ 3)) ^ 2) = (6 : WithBot ℕ) := by
  sorry

/-- FF.2/coprime-semigroup-representation (Kowalski Lemma 4.25). -/
theorem coprime_semigroup_representation {n m : ℕ} (hcop : Nat.Coprime n m) (hn : 1 ≤ n) (k : ℕ) :
    (∀ δ₁ i₁ δ₂ i₂ : ℕ, i₁ < n → i₂ < n → k = n * δ₁ + i₁ * m → k = n * δ₂ + i₂ * m →
      δ₁ = δ₂ ∧ i₁ = i₂) ∧
    ((n - 1) * (m - 1) ≤ k → ∃ δ i : ℕ, i < n ∧ k = n * δ + i * m) := by
  sorry

/-- The Riemann–Roch space `H(k) = {f : deg f ≤ k}`. -/
def riemannRochSpace (P g : F[X]) (k : ℕ) : Submodule F (stepanovRing P g) := sorry

/-- FF.2/riemann-roch-space-dimension (Kowalski Lemma 4.24, corrected Lemma 5.7). -/
theorem finrank_riemannRochSpace (P g : F[X]) (hP : P.Monic)
    (hcop : Nat.Coprime P.natDegree g.natDegree) (hm : 1 ≤ g.natDegree) (k : ℕ)
    (hk : (P.natDegree - 1) * (g.natDegree - 1) ≤ k) :
    Module.finrank F (riemannRochSpace P g k) + ((P.natDegree - 1) * (g.natDegree - 1)) / 2 =
      k + 1 := by
  sorry

/-- The norm `O(P, g) → F[X]`. -/
def stepanovNorm {P g : F[X]} (f : stepanovRing P g) : F[X] := Algebra.norm F[X] f

section StepanovNorm

variable {P g : F[X]}

theorem stepanovNorm_mul (f₁ f₂ : stepanovRing P g) :
    stepanovNorm (f₁ * f₂) = stepanovNorm f₁ * stepanovNorm f₂ := by sorry

theorem natDegree_stepanovNorm (hP : P.Monic) (hcop : Nat.Coprime P.natDegree g.natDegree)
    {f : stepanovRing P g} (hf : f ≠ 0) :
    ((stepanovNorm f).natDegree : WithBot ℕ) = poleDegree f := by sorry

theorem stepanovNorm_eq_prod_kummer (d : ℕ) (hd : d ∣ Fintype.card F - 1)
    (f : stepanovRing (X ^ d) g) :
    algebraMap F[X] _ (stepanovNorm f) =
      ∏ ξ ∈ (Finset.univ.filter fun ξ : F => ξ ^ d = 1),
        (if h : ξ ^ d = 1 then stepanovRing.kummerRotate g d ξ h f else 1) := by
  sorry

theorem stepanovNorm_eq_prod_artinSchreier (q : ℕ) (f : stepanovRing (X ^ q - X) g) :
    algebraMap F[X] _ (stepanovNorm f) =
      ∏ a ∈ (Finset.univ.filter fun a : F => a ^ q = a),
        (if h : a ^ q = a then stepanovRing.artinSchreierShift g q a h f else 1) := by
  sorry

/-- Unit test `stepanovNorm_test_X`: `N(X) = X^n`. -/
example (hP : P.Monic) :
    stepanovNorm (algebraMap F[X] (stepanovRing P g) X) = X ^ P.natDegree := by sorry

/-- Unit test `stepanovNorm_test_C`: `N(a) = a^n` for a constant `a`. -/
example (hP : P.Monic) (a : F) :
    stepanovNorm (algebraMap F[X] (stepanovRing P g) (C a)) = C a ^ P.natDegree := by sorry

end StepanovNorm

/-- Unit test `stepanovNorm_test_Y_quadratic`: for `P = Y²`, `N(Y) = -g`. -/
example (g : F[X]) :
    stepanovNorm (AdjoinRoot.root ((X ^ 2 : F[X]).map (C : F →+* F[X]) - C g)) = -g := by sorry

/-- The Kummer instance (`P = Y^d`, `d ∣ |F| - 1`, `g` squarefree, `gcd(d, deg g) = 1`) or the
Artin–Schreier instance (`P = Y^q - Y`, `F_q ⊆ F`, `p ∤ deg g`) of the Stepanov ring. -/
def IsStepanovInstance (P g : F[X]) : Prop :=
  1 ≤ g.natDegree ∧
    ((∃ d : ℕ, 2 ≤ d ∧ P = X ^ d ∧ d ∣ Fintype.card F - 1 ∧ Squarefree g ∧
        Nat.Coprime d g.natDegree) ∨
      (∃ q k : ℕ, 1 ≤ k ∧ q = ringChar F ^ k ∧ P = X ^ q - X ∧
        (Finset.univ.filter fun a : F => a ^ q = a).card = q ∧ ¬ ringChar F ∣ g.natDegree))

/-- FF.2/stepanov-zero-count: an `M`-th power vanishing at the points of `S` over `F̄` has pole
degree at least `M · |S|`. -/
theorem stepanov_zero_count {P g : F[X]} (hinst : IsStepanovInstance P g) (M : ℕ)
    (f : stepanovRing P g) (hf : f ≠ 0) (hpow : ∃ h, f = h ^ M)
    (S : Finset (stepanovRing P g →ₐ[F] AlgebraicClosure F)) (hS : ∀ φ ∈ S, φ f = 0) :
    ((M * S.card : ℕ) : WithBot ℕ) ≤ poleDegree f := by
  sorry

/-- FF.2/auxiliary-function-uniqueness (Kowalski Lemma 4.28): `s` is a basis of `H(κ)` with
strictly increasing pole degrees and `|F| = Q`. -/
theorem auxiliaryFunction_uniqueness {P g : F[X]} (hP : P.Monic)
    (hcop : Nat.Coprime P.natDegree g.natDegree) {N : ℕ} (M k κ : ℕ)
    (hM : ∃ a, M = ringChar F ^ a) (hMQ : M ∣ Fintype.card F) (hkM : k * M < Fintype.card F)
    (s : Fin N → stepanovRing P g) (hs : StrictMono fun j => poleDegree (s j))
    (hspan : Submodule.span F (Set.range s) = riemannRochSpace P g κ) :
    (∀ f : Fin N → stepanovRing P g, (∀ j, f j ∈ riemannRochSpace P g k) →
      ∑ j, f j ^ M * s j ^ Fintype.card F = 0 → ∀ j, f j = 0) ∧
    Module.finrank F (Submodule.span F {z : stepanovRing P g | ∃ f₁ ∈ riemannRochSpace P g k,
        ∃ f₂ ∈ riemannRochSpace P g κ, z = f₁ ^ M * f₂ ^ Fintype.card F}) =
      Module.finrank F (riemannRochSpace P g k) * Module.finrank F (riemannRochSpace P g κ) := by
  sorry

/-- FF.2/auxiliary-function-vanishing (Kowalski Lemma 4.29). -/
theorem auxiliaryFunction_vanishing {P g : F[X]} {N : ℕ} (M : ℕ) (hM : ∃ a, M = ringChar F ^ a)
    (hMQ : M ∣ Fintype.card F) (s f : Fin N → stepanovRing P g) (h : ∑ j, f j ^ M * s j = 0) :
    (∀ φ : stepanovRing P g →ₐ[F] F, φ (∑ j, f j ^ M * s j ^ Fintype.card F) = 0) ∧
      ∑ j, f j ^ M * s j ^ Fintype.card F = (∑ j, f j * s j ^ (Fintype.card F / M)) ^ M := by
  sorry

/-- FF.2/auxiliary-function-existence (Kowalski (4.31)), with `k₀ = (n - 1)(m - 1)`, `γ = k₀ / 2`. -/
theorem auxiliaryFunction_existence {P g : F[X]} (hP : P.Monic)
    (hcop : Nat.Coprime P.natDegree g.natDegree) (hm : 1 ≤ g.natDegree) {N : ℕ} (M k κ : ℕ)
    (hM : ∃ a, M = ringChar F ^ a) (hMQ : M ∣ Fintype.card F) (hkM : k * M < Fintype.card F)
    (hk : (P.natDegree - 1) * (g.natDegree - 1) ≤ k)
    (hκ : (P.natDegree - 1) * (g.natDegree - 1) ≤ κ)
    (hineq : ((k : ℤ) * M + κ + 1 - ((P.natDegree - 1) * (g.natDegree - 1) / 2 : ℕ)) <
      ((k : ℤ) + 1 - ((P.natDegree - 1) * (g.natDegree - 1) / 2 : ℕ)) *
        ((κ : ℤ) + 1 - ((P.natDegree - 1) * (g.natDegree - 1) / 2 : ℕ)))
    (s : Fin N → stepanovRing P g) (hs : StrictMono fun j => poleDegree (s j))
    (hspan : Submodule.span F (Set.range s) = riemannRochSpace P g κ) :
    ∃ f : Fin N → stepanovRing P g, (∀ j, f j ∈ riemannRochSpace P g k) ∧ (∃ j, f j ≠ 0) ∧
      ∑ j, f j ^ M * s j = 0 ∧ ∑ j, f j ^ M * s j ^ Fintype.card F ≠ 0 ∧
      poleDegree (∑ j, f j ^ M * s j ^ Fintype.card F) ≤
        ((k * M + Fintype.card F * κ : ℕ) : WithBot ℕ) := by
  sorry

/-- FF.2/stepanov-upper-bound (Kowalski Theorem 4.30, §5.2): for `|F| = Q` an even power of `p`
above `Q₀ = max((γ + 1)⁴, (2k₀)²)`, `#C(F) ≤ Q + (2γ + 1)√Q`. -/
theorem stepanov_upper_bound {P g : F[X]} (hinst : IsStepanovInstance P g)
    (hlt : ∀ q : ℕ, P = X ^ q - X → g.natDegree < q)
    (hQ : ∃ a : ℕ, Fintype.card F = ringChar F ^ (2 * a))
    (hQ₀ : max (((P.natDegree - 1) * (g.natDegree - 1) / 2 + 1) ^ 4)
      ((2 * ((P.natDegree - 1) * (g.natDegree - 1))) ^ 2) < Fintype.card F) :
    (Fintype.card {xy : F × F // P.eval xy.2 = g.eval xy.1} : ℝ) ≤
      Fintype.card F + (2 * (((P.natDegree - 1) * (g.natDegree - 1) / 2 : ℕ) : ℝ) + 1) *
        Real.sqrt (Fintype.card F) := by
  sorry

/-- FF.2/stepanov-bound-kummer-curve (Kowalski Theorem 4.17): a constant depending only on `d` and
`deg g`, for every field with a square number of elements. -/
theorem stepanov_bound_kummer_curve (d m : ℕ) :
    ∃ C : ℝ, ∀ (K : Type) [Field K] [Fintype K] [DecidableEq K], IsSquare (Fintype.card K) →
      d ∣ Fintype.card K - 1 → ∀ g : K[X], g.natDegree = m → 1 ≤ m → Nat.Coprime m d →
      |(Fintype.card {xy : K × K // xy.2 ^ d = g.eval xy.1} : ℝ) - Fintype.card K| ≤
        C * Real.sqrt (Fintype.card K) := by
  sorry

/-- FF.2/stepanov-bound-artin-schreier-curve (Kowalski Theorem 5.2). -/
theorem stepanov_bound_artinSchreier_curve (f : F[X]) (hd : 1 ≤ f.natDegree)
    (hp : ¬ ringChar F ∣ f.natDegree) (hq : f.natDegree < Fintype.card F) :
    ∃ C : ℝ, ∀ (L : Type) [Field L] [Fintype L] [Algebra F L] [DecidableEq L],
      Even (Module.finrank F L) →
      |(Fintype.card {xy : L × L // xy.2 ^ Fintype.card F - xy.2 = aeval xy.1 f} : ℝ) -
          Fintype.card L| ≤ C * Real.sqrt (Fintype.card L) := by
  sorry

/-- FF.2/upper-to-lower-bound-kummer (Kowalski Lemma 4.18). -/
theorem upper_to_lower_bound_kummer (d : ℕ) (hd : d ∣ Fintype.card F - 1) (g : F[X]) (A : ℝ)
    (hA : ∀ ε : F, ε ≠ 0 →
      |(Fintype.card {xy : F × F // xy.2 ^ d = (C ε * g).eval xy.1} : ℝ) - Fintype.card F| ≤ A) :
    (Fintype.card F : ℝ) - (d - 1) * A ≤ Fintype.card {xy : F × F // xy.2 ^ d = g.eval xy.1} := by
  sorry

/-- FF.2/upper-to-lower-bound-artin-schreier (Kowalski Lemma 5.3). -/
theorem upper_to_lower_bound_artinSchreier (q : ℕ) (hq : ∃ k, 1 ≤ k ∧ q = ringChar F ^ k)
    (hcard : (Finset.univ.filter fun a : F => a ^ q = a).card = q) (g : F[X]) (A : ℝ)
    (hA : ∀ α : F,
      |(Fintype.card {xy : F × F // xy.2 ^ q - xy.2 = (g + C α).eval xy.1} : ℝ) -
        Fintype.card F| ≤ A) :
    (Fintype.card F : ℝ) - (q - 1) * A ≤
      Fintype.card {xy : F × F // xy.2 ^ q - xy.2 = g.eval xy.1} := by
  sorry

/-! ## Weil bounds (one variable) -/

section WeilBounds

variable (ψ : AddChar F ℂ) (χ : MulChar F ℂ)

/-- FF.2/additive-l-function-root-bound. -/
theorem additiveLFunction_root_bound (hψ : ψ ≠ 1) (f : F[X]) (hd : 0 < f.natDegree)
    (hp : ¬ ringChar F ∣ f.natDegree) (P : ℂ[X]) (hP : (P : PowerSeries ℂ) = additiveLFunction ψ f) :
    ∀ ω ∈ P.reverse.roots, ‖ω‖ ≤ Real.sqrt (Fintype.card F) := by
  sorry

/-- FF.2/multiplicative-l-function-root-bound-coprime. -/
theorem multiplicativeLFunction_root_bound_coprime (hχ : 2 ≤ orderOf χ) (g : F[X])
    (hd : 0 < g.natDegree) (hcop : Nat.Coprime g.natDegree (orderOf χ)) (P : ℂ[X])
    (hP : (P : PowerSeries ℂ) = multiplicativeLFunction χ g) :
    ∀ ω ∈ P.reverse.roots, ‖ω‖ ≤ Real.sqrt (Fintype.card F) := by
  sorry

/-- FF.2/rank-one-sheaf-root-bound, elementary shadow for polynomial `f`: when the mixed L-series
`Σ_h ψ(Tr f mod h) χ(Res(h, g)) T^{deg h}` is a polynomial, its reciprocal roots are bounded by `√q`.
The node's cohomological statement (for `f` regular on `A¹ ∖ {g = 0}`) is not stated here. -/
theorem mixedLFunction_root_bound (f g : F[X]) (P : ℂ[X])
    (hP : (P : PowerSeries ℂ) =
      monicLSeries (fun h => rootSumAddChar ψ f h * rootSumMulChar χ g h)) :
    ∀ ω ∈ P.reverse.roots, ‖ω‖ ≤ Real.sqrt (Fintype.card F) := by
  sorry

/-- FF.2/weil-bound-additive: Weil's bound `(deg f - 1)√q` for `p ∤ deg f`, over every finite
extension. -/
theorem weil_bound_additive (hψ : ψ ≠ 1) (f : F[X]) (hd : 0 < f.natDegree)
    (hp : ¬ ringChar F ∣ f.natDegree) (L : Type*) [Field L] [Fintype L] [Algebra F L] :
    ‖additiveCompanionSum ψ f L‖ ≤ (f.natDegree - 1 : ℝ) * Real.sqrt (Fintype.card L) := by
  sorry

/-- FF.2/weil-bound-multiplicative-coprime-degree. -/
theorem weil_bound_multiplicative_coprime_degree (hχ : 2 ≤ orderOf χ) (g : F[X])
    (hd : 0 < g.natDegree) (hcop : Nat.Coprime g.natDegree (orderOf χ))
    (L : Type*) [Field L] [Fintype L] [Algebra F L] :
    ‖multiplicativeCompanionSum χ g L‖ ≤
      (Nat.card (g.rootSet (AlgebraicClosure F)) - 1 : ℝ) *
        Real.sqrt (Fintype.card L) := by
  sorry

/-- FF.2/weil-bound-multiplicative: the general case, `g` not a constant times an
`ord χ`-th power over the algebraic closure. -/
theorem weil_bound_multiplicative (hχ : 2 ≤ orderOf χ) (g : F[X]) (hg : g ≠ 0)
    (hnot : ¬ ∃ (c : AlgebraicClosure F) (k : (AlgebraicClosure F)[X]),
      g.map (algebraMap F (AlgebraicClosure F)) = C c * k ^ orderOf χ)
    (L : Type*) [Field L] [Fintype L] [Algebra F L] :
    ‖multiplicativeCompanionSum χ g L‖ ≤
      (Nat.card (g.rootSet (AlgebraicClosure F)) - 1 : ℝ) *
        Real.sqrt (Fintype.card L) := by
  sorry

/-- FF.2/weil-bound-mixed. -/
theorem weil_bound_mixed (hψ : ψ ≠ 1) (f g : F[X]) (hd : 0 < f.natDegree)
    (hp : ¬ ringChar F ∣ f.natDegree) (hg : g ≠ 0) :
    ‖∑ x : F, χ (g.eval x) * ψ (f.eval x)‖ ≤
      (Nat.card (g.rootSet (AlgebraicClosure F)) + f.natDegree - 1 : ℝ) *
        Real.sqrt (Fintype.card F) := by
  sorry

/-- FF.2/additive-l-function-purity (Weil): degree exactly `d - 1` and every reciprocal root has
absolute value `√q`. -/
theorem additiveLFunction_purity (hψ : ψ ≠ 1) (f : F[X]) (hd : 0 < f.natDegree)
    (hp : ¬ ringChar F ∣ f.natDegree) (P : ℂ[X]) (hP : (P : PowerSeries ℂ) = additiveLFunction ψ f) :
    P.natDegree = f.natDegree - 1 ∧
      ∀ ω ∈ P.reverse.roots, ‖ω‖ = Real.sqrt (Fintype.card F) := by
  sorry

/-- FF.2/multiplicative-l-function-purity (Weil), for `g` squarefree of degree prime to `ord χ`. -/
theorem multiplicativeLFunction_purity (hχ : 2 ≤ orderOf χ) (g : F[X]) (hsq : Squarefree g)
    (hd : 0 < g.natDegree) (hcop : Nat.Coprime g.natDegree (orderOf χ)) (P : ℂ[X])
    (hP : (P : PowerSeries ℂ) = multiplicativeLFunction χ g) :
    P.natDegree = g.natDegree - 1 ∧
      ∀ ω ∈ P.reverse.roots, ‖ω‖ = Real.sqrt (Fintype.card F) := by
  sorry

end WeilBounds

/-! ## Artin–Schreier reduction and the degenerate cases -/

/-- The Artin–Schreier reduced form `f*`. -/
def artinSchreierReduced (f : F[X]) : F[X] := sorry

section ArtinSchreier

variable (f : F[X])

theorem artinSchreierReduced_sub :
    ∃ h : F[X], h.coeff 0 = 0 ∧ artinSchreierReduced f - f = h ^ ringChar F - h := by sorry

theorem coeff_artinSchreierReduced (j : ℕ) (hj : 1 ≤ j) (hp : ringChar F ∣ j) :
    (artinSchreierReduced f).coeff j = 0 := by sorry

theorem artinSchreierReduced_unique (f' : F[X])
    (hsub : ∃ h : F[X], h.coeff 0 = 0 ∧ f' - f = h ^ ringChar F - h)
    (hcoeff : ∀ j, 1 ≤ j → ringChar F ∣ j → f'.coeff j = 0) :
    f' = artinSchreierReduced f := by sorry

theorem artinSchreierReduced_eq_self (hf : ∀ j, 1 ≤ j → ringChar F ∣ j → f.coeff j = 0) :
    artinSchreierReduced f = f := by sorry

theorem artinSchreierReduced_add (g : F[X]) :
    artinSchreierReduced (f + g) = artinSchreierReduced f + artinSchreierReduced g := by sorry

theorem natDegree_artinSchreierReduced_le :
    (artinSchreierReduced f).natDegree ≤ f.natDegree := by sorry

/-- Unit test `artinSchreierReduced_test_X_pow_p`: `(X^p)* = X`. -/
example : artinSchreierReduced (X ^ ringChar F : F[X]) = X := by sorry

/-- Unit test `artinSchreierReduced_test_trivial`: `(X^p - X)* = 0`. -/
example : artinSchreierReduced (X ^ ringChar F - X : F[X]) = 0 := by sorry

/-- FF.2/artin-schreier-invariance, for the canonical character through the trace. -/
theorem additiveCompanionSum_add_artinSchreier (h : F[X]) (L : Type*) [Field L] [Fintype L]
    [Algebra F L] :
    additiveCompanionSum (AddChar.FiniteField.primitiveChar_to_Complex F)
        (f + (h ^ ringChar F - h)) L =
      additiveCompanionSum (AddChar.FiniteField.primitiveChar_to_Complex F) f L := by
  sorry

/-- FF.2/artin-schreier-trivial-sum: no cancellation for Artin–Schreier trivial phases. -/
theorem additiveCompanionSum_artinSchreier_trivial (h : F[X]) (c : F) (L : Type*) [Field L]
    [Fintype L] [Algebra F L] :
    additiveCompanionSum (AddChar.FiniteField.primitiveChar_to_Complex F)
        (h ^ ringChar F - h + C c) L =
      Fintype.card L * (AddChar.FiniteField.primitiveChar_to_Complex F c) ^ Module.finrank F L := by
  sorry

/-- FF.2/weil-bound-additive-reduced: the bound with the degree of the reduced form. -/
theorem weil_bound_additive_reduced (L : Type*) [Field L] [Fintype L] [Algebra F L]
    (hf : 0 < (artinSchreierReduced f).natDegree) :
    ‖additiveCompanionSum (AddChar.FiniteField.primitiveChar_to_Complex F) f L‖ ≤
      ((artinSchreierReduced f).natDegree - 1 : ℝ) * Real.sqrt (Fintype.card L) := by
  sorry

end ArtinSchreier

/-- Unit test `artinSchreierReduced_test_char_two`: in characteristic `2`, `X² + X` is reduced to
`0` although it has degree `2`. -/
example : artinSchreierReduced (X ^ 2 + X : (ZMod 2)[X]) = 0 := by sorry

/-- FF.2/multiplicative-perfect-power-sum: for `g = c·h^e`, `e = ord χ`, there is no cancellation. -/
theorem multiplicativeCompanionSum_perfectPower (χ : MulChar F ℂ) (c : F) (hc : c ≠ 0) (h : F[X])
    (hh : h ≠ 0) (L : Type*) [Field L] [Fintype L] [Algebra F L] [DecidableEq L] :
    multiplicativeCompanionSum χ (C c * h ^ orderOf χ) L =
      χ c ^ Module.finrank F L *
        ((Fintype.card L : ℂ) - (Finset.univ.filter fun x : L => aeval x h = 0).card) := by
  sorry

/-! ## Function fields of the Artin–Schreier and Kummer curves -/

/-- `E_f = F(X)[Y]/(Y^q - Y - f)`. -/
abbrev artinSchreierFunctionField (f : F[X]) : Type _ :=
  AdjoinRoot (X ^ Fintype.card F - X - C (algebraMap F[X] (RatFunc F) f))

namespace artinSchreierFunctionField

variable (f : F[X])

theorem finrank (hd : 1 ≤ f.natDegree) (hp : ¬ ringChar F ∣ f.natDegree) :
    Module.finrank (RatFunc F) (artinSchreierFunctionField f) = Fintype.card F := by sorry

/-- The translation `Y ↦ Y + a`. -/
def translate (a : F) :
    artinSchreierFunctionField f ≃ₐ[RatFunc F] artinSchreierFunctionField f := sorry

theorem translate_add (a b : F) :
    translate f (a + b) = (translate f a).trans (translate f b) := by sorry

theorem irreducible (hd : 1 ≤ f.natDegree) (hp : ¬ ringChar F ∣ f.natDegree) :
    Irreducible (X ^ Fintype.card F - X - C (algebraMap F[X] (RatFunc F) f)) := by sorry

end artinSchreierFunctionField

/-- Unit test `artinSchreierFunctionField_test_finrank`: `y² + y = x³` over `ZMod 2` is a quadratic
extension of `F(x)`. -/
example : Module.finrank (RatFunc (ZMod 2))
    (artinSchreierFunctionField (X ^ 3 : (ZMod 2)[X])) = 2 := by sorry

/-- Unit test `artinSchreierFunctionField_test_translate_order`: a nonzero translation has order `p`. -/
example (f : F[X]) (a : F) (ha : a ≠ 0) :
    orderOf (artinSchreierFunctionField.translate f a) = ringChar F := by sorry

/-- Unit test `artinSchreierFunctionField_test_trivial`: for `f = X^q - X` the polynomial has the
root `X`, so it is reducible and the quotient is not a field. -/
example : ¬ Irreducible (X ^ Fintype.card F - X -
    C (algebraMap F[X] (RatFunc F) (X ^ Fintype.card F - X))) := by sorry

/-- `E_g = F(X)[Y]/(Y^d - g)`. -/
abbrev kummerFunctionField (g : F[X]) (d : ℕ) : Type _ :=
  AdjoinRoot (X ^ d - C (algebraMap F[X] (RatFunc F) g))

namespace kummerFunctionField

variable (g : F[X]) (d : ℕ)

theorem finrank (hd : d ∣ Fintype.card F - 1) (hcop : Nat.Coprime d g.natDegree)
    (hg : 1 ≤ g.natDegree) :
    Module.finrank (RatFunc F) (kummerFunctionField g d) = d := by sorry

/-- The rotation `Y ↦ ξY` for `ξ ∈ μ_d(F)`. -/
def rotate (ξ : rootsOfUnity d F) :
    kummerFunctionField g d ≃ₐ[RatFunc F] kummerFunctionField g d := sorry

theorem rotate_mul (ξ η : rootsOfUnity d F) :
    rotate g d (ξ * η) = (rotate g d ξ).trans (rotate g d η) := by sorry

theorem irreducible (hcop : Nat.Coprime d g.natDegree) (hd : 2 ≤ d) (hg : 1 ≤ g.natDegree) :
    Irreducible (X ^ d - C (algebraMap F[X] (RatFunc F) g)) := by sorry

end kummerFunctionField

/-- Unit test `kummerFunctionField_test_finrank`: `y² = x³ + 1` over `ZMod 5`. -/
example [Fact (Nat.Prime 5)] : Module.finrank (RatFunc (ZMod 5))
    (kummerFunctionField (X ^ 3 + 1 : (ZMod 5)[X]) 2) = 2 := by sorry

/-- Unit test `kummerFunctionField_test_rotate_order`: `rotate ξ` has the order of `ξ`. -/
example (g : F[X]) (d : ℕ) (ξ : rootsOfUnity d F) :
    orderOf (kummerFunctionField.rotate g d ξ) = orderOf ξ := by sorry

/-- Unit test `kummerFunctionField_test_reducible`: `Y² - X²` is reducible. -/
example : ¬ Irreducible (X ^ 2 - C (algebraMap F[X] (RatFunc F) (X ^ 2))) := by sorry

/-! ## Rank-one lisse sheaves on open subsets of the line, as Galois characters

FKMS Definition 3.1: a lisse sheaf on `U ⊆ A¹_F` is a continuous representation of the absolute
Galois group of `F(X)` unramified on `U`. The rank-one sheaves `L_ψ(f)` and `L_χ(g)` are the
characters below. The sheaf-theoretic statements about them (compact-support cohomology, trace
formula, weights) are not stated here; their carriers are supplied by `SF.2`, `EDC.0`, `EDC.2`. -/

section CharacterSheaves

variable {K : Type*} [Field K] [Algebra F K] {E : Type*} [Field E]

/-- The Artin–Schreier character `σ ↦ σ(t) - t ∈ F`, `t^q - t = f`. -/
def artinSchreierCharacter (f : K) : Field.absoluteGaloisGroup K →* Multiplicative F := sorry

/-- The Artin–Schreier sheaf `L_ψ(f)` as the character `σ ↦ ψ⁻¹(σ(t) - t)`. -/
def artinSchreierSheaf (ψ : AddChar F E) (f : K) : Field.absoluteGaloisGroup K →* Eˣ := sorry

/-- Restriction of absolute Galois groups along a field embedding over `F` (pull-back of sheaves
along the corresponding morphism of generic points). -/
def absoluteGaloisGroupRestrict {K' : Type*} [Field K'] [Algebra F K'] (φ : K →ₐ[F] K') :
    Field.absoluteGaloisGroup K' →* Field.absoluteGaloisGroup K := sorry

theorem artinSchreierSheaf_add (ψ : AddChar F E) (f g : K) :
    artinSchreierSheaf ψ (f + g) = artinSchreierSheaf ψ f * artinSchreierSheaf ψ g := by sorry

theorem artinSchreierSheaf_neg (ψ : AddChar F E) (f : K) :
    artinSchreierSheaf ψ (-f) = (artinSchreierSheaf ψ f)⁻¹ := by sorry

theorem artinSchreierSheaf_sub_self (ψ : AddChar F E) (h : K) :
    artinSchreierSheaf ψ (h ^ Fintype.card F - h) = 1 := by sorry

theorem artinSchreierSheaf_mulShift (ψ : AddChar F E) (a : F) (f : K) :
    artinSchreierSheaf (ψ.mulShift a) f = artinSchreierSheaf ψ (algebraMap F K a * f) := by sorry

theorem artinSchreierSheaf_map {K' : Type*} [Field K'] [Algebra F K'] (φ : K →ₐ[F] K')
    (ψ : AddChar F E) (f : K) :
    (artinSchreierSheaf ψ f).comp (absoluteGaloisGroupRestrict φ) = artinSchreierSheaf ψ (φ f) := by
  sorry

/-- Unit test `artinSchreierSheaf_test_trivialChar`: `ψ = 1` gives the constant sheaf. -/
example (f : K) : artinSchreierSheaf (1 : AddChar F E) f = 1 := by sorry

/-- Unit test `artinSchreierSheaf_test_artinSchreier`: `L_ψ(h^q - h)` is trivial. -/
example (ψ : AddChar F E) (h : K) : artinSchreierSheaf ψ (h ^ Fintype.card F - h) = 1 := by sorry

/-- The Kummer sheaf `L_χ(g)` as the character `σ ↦ χ⁻¹(σ(t)/t)`, `t^{q-1} = g`. -/
def kummerSheaf (χ : MulChar F E) (g : Kˣ) : Field.absoluteGaloisGroup K →* Eˣ := sorry

theorem kummerSheaf_mul (χ : MulChar F E) (g₁ g₂ : Kˣ) :
    kummerSheaf χ (g₁ * g₂) = kummerSheaf χ g₁ * kummerSheaf χ g₂ := by sorry

theorem kummerSheaf_mul_char (χ χ' : MulChar F E) (g : Kˣ) :
    kummerSheaf (χ * χ') g = kummerSheaf χ g * kummerSheaf χ' g := by sorry

theorem kummerSheaf_pow_orderOf (χ : MulChar F E) (h : Kˣ) :
    kummerSheaf χ (h ^ orderOf χ) = 1 := by sorry

theorem kummerSheaf_map {K' : Type*} [Field K'] [Algebra F K'] (φ : K →ₐ[F] K')
    (χ : MulChar F E) (g : Kˣ) :
    (kummerSheaf χ g).comp (absoluteGaloisGroupRestrict φ) = kummerSheaf χ (Units.map φ g) := by
  sorry

/-- Unit test `kummerSheaf_test_trivialChar`: `χ = 1` gives the constant sheaf. -/
example (g : Kˣ) : kummerSheaf (1 : MulChar F E) g = 1 := by sorry

/-- Unit test `kummerSheaf_test_power`: `L_χ(h^{ord χ})` is trivial. -/
example (χ : MulChar F E) (h : Kˣ) : kummerSheaf χ (h ^ orderOf χ) = 1 := by sorry

end CharacterSheaves

/-- Unit test `artinSchreierSheaf_test_X_nontrivial`: over `F(X)`, `L_ψ(X)` is nontrivial. -/
example (ψ : AddChar F ℂ) (hψ : ψ ≠ 1) :
    artinSchreierSheaf ψ (RatFunc.X : RatFunc F) ≠ 1 := by sorry

/-- Unit test `artinSchreierSheaf_test_no_rational_character`: a nontrivial additive character of
`ZMod 3` needs cube roots of unity; with values in `ℚ` it is trivial. -/
example : ∀ ψ : AddChar (ZMod 3) ℚ, ψ = 1 := by sorry

/-- Unit test `kummerSheaf_test_X_nontrivial`: over `F(X)`, `L_χ(X)` is nontrivial for `χ ≠ 1`. -/
example (χ : MulChar F ℂ) (hχ : χ ≠ 1) :
    kummerSheaf χ (Units.mk0 (RatFunc.X : RatFunc F) RatFunc.X_ne_zero) ≠ 1 := by sorry

/-- The trace function of a rank-one lisse sheaf on an open subset of `A¹_F`: the value of the
character at a geometric Frobenius at the place `X - x` (FKMS Definition 3.5). -/
def traceFunctionRankOne {E : Type*} [Field E]
    (ρ : Field.absoluteGaloisGroup (RatFunc F) →* Eˣ) (x : F) : E := sorry

section TraceFunction

variable {E : Type*} [Field E]

theorem traceFunctionRankOne_mul (ρ₁ ρ₂ : Field.absoluteGaloisGroup (RatFunc F) →* Eˣ) (x : F) :
    traceFunctionRankOne (ρ₁ * ρ₂) x = traceFunctionRankOne ρ₁ x * traceFunctionRankOne ρ₂ x := by
  sorry

theorem traceFunctionRankOne_one (x : F) :
    traceFunctionRankOne (1 : Field.absoluteGaloisGroup (RatFunc F) →* Eˣ) x = 1 := by sorry

theorem traceFunctionRankOne_inv (ρ : Field.absoluteGaloisGroup (RatFunc F) →* Eˣ) (x : F) :
    traceFunctionRankOne ρ⁻¹ x = (traceFunctionRankOne ρ x)⁻¹ := by sorry

theorem traceFunctionRankOne_artinSchreierSheaf (ψ : AddChar F E) (f : F[X]) (x : F) :
    traceFunctionRankOne (artinSchreierSheaf ψ (algebraMap F[X] (RatFunc F) f)) x =
      ψ (f.eval x) := by sorry

theorem traceFunctionRankOne_kummerSheaf (χ : MulChar F E) (g : F[X]) (hg : g ≠ 0) (x : F)
    (hx : g.eval x ≠ 0) :
    traceFunctionRankOne (kummerSheaf χ (Units.mk0 (algebraMap F[X] (RatFunc F) g)
      ((map_ne_zero_iff _ (IsFractionRing.injective F[X] (RatFunc F))).mpr hg))) x =
        χ (g.eval x) := by sorry

/-- Unit test `traceFunctionRankOne_test_one`: the constant sheaf has trace `1`. -/
example (x : F) :
    traceFunctionRankOne (1 : Field.absoluteGaloisGroup (RatFunc F) →* Eˣ) x = 1 := by sorry

/-- Unit test `traceFunctionRankOne_test_artinSchreier_X`: `L_ψ(X)` has trace `ψ(x)`. -/
example (ψ : AddChar F E) (x : F) :
    traceFunctionRankOne (artinSchreierSheaf ψ (RatFunc.X : RatFunc F)) x = ψ x := by sorry

/-- Unit test `traceFunctionRankOne_test_artinSchreier_trivial`: `X^q - X` has constant trace `1`
although it is non-constant. -/
example (ψ : AddChar F E) (x : F) :
    traceFunctionRankOne
      (artinSchreierSheaf ψ (algebraMap F[X] (RatFunc F) (X ^ Fintype.card F - X))) x = 1 := by
  sorry

end TraceFunction

/-- The modified pole order `v*_∞(f) = min_g v_∞(f + g^p - g)` at the place at infinity of `F(X)`. -/
def modifiedPoleOrderInfty (f : RatFunc F) : ℕ := sorry

section ModifiedPoleOrder

variable (f : RatFunc F)

theorem modifiedPoleOrderInfty_add_artinSchreier (g : RatFunc F) :
    modifiedPoleOrderInfty (f + (g ^ ringChar F - g)) = modifiedPoleOrderInfty f := by sorry

theorem modifiedPoleOrderInfty_le : modifiedPoleOrderInfty f ≤ f.intDegree.toNat := by sorry

theorem modifiedPoleOrderInfty_eq_of_not_dvd (hpos : 0 < f.intDegree)
    (hp : ¬ ringChar F ∣ f.intDegree.toNat) : modifiedPoleOrderInfty f = f.intDegree.toNat := by
  sorry

theorem modifiedPoleOrderInfty_polynomial (g : F[X])
    (hg : 0 < (artinSchreierReduced g).natDegree) :
    modifiedPoleOrderInfty (algebraMap F[X] (RatFunc F) g) = (artinSchreierReduced g).natDegree := by
  sorry

/-- Unit test `modifiedPoleOrderInfty_test_X_pow_p`: `v*_∞(X^p) = 1`. -/
example : modifiedPoleOrderInfty ((RatFunc.X : RatFunc F) ^ ringChar F) = 1 := by sorry

/-- Unit test `modifiedPoleOrderInfty_test_artinSchreier`: `v*_∞(X^p - X) = 0`. -/
example : modifiedPoleOrderInfty ((RatFunc.X : RatFunc F) ^ ringChar F - RatFunc.X) = 0 := by sorry

/-- Unit test `modifiedPoleOrderInfty_test_not_poleOrder`: `v*_∞(X^p) ≠ p = v_∞(X^p)`. -/
example : modifiedPoleOrderInfty ((RatFunc.X : RatFunc F) ^ ringChar F) ≠ ringChar F := by sorry

end ModifiedPoleOrder

/-! ## Kloosterman sums -/

/-- `K(ψ; a, b; L) = Σ_{x ∈ L^×} ψ(Tr_{L/F}(a x + b x⁻¹))`. -/
def kloostermanSum (ψ : AddChar F ℂ) (a b : F) (L : Type*) [Field L] [Fintype L] [DecidableEq L]
    [Algebra F L] : ℂ :=
  ∑ x : Lˣ, ψ (Algebra.trace F L (algebraMap F L a * x + algebraMap F L b * (x⁻¹ : Lˣ)))

section Kloosterman

variable (ψ : AddChar F ℂ) (L : Type*) [Field L] [Fintype L] [DecidableEq L] [Algebra F L]

theorem kloostermanSum_comm (a b : F) : kloostermanSum ψ a b L = kloostermanSum ψ b a L := by
  sorry

theorem kloostermanSum_eq_one_mul {a : F} (ha : a ≠ 0) (b : F) :
    kloostermanSum ψ a b L = kloostermanSum ψ 1 (a * b) L := by sorry

theorem kloostermanSum_conj (a b : F) :
    starRingEnd ℂ (kloostermanSum ψ a b L) = kloostermanSum ψ a b L := by sorry

theorem kloostermanSum_zero_right (hψ : ψ ≠ 1) {a : F} (ha : a ≠ 0) :
    kloostermanSum ψ a 0 L = -1 := by sorry

/-- Unit test `kloostermanSum_test_zero_zero`: `K(0, 0) = |L| - 1`. -/
example : kloostermanSum ψ 0 0 L = Fintype.card L - 1 := by sorry

/-- Unit test `kloostermanSum_test_zero_right`: `K(a, 0; F) = -1`. -/
example (hψ : ψ ≠ 1) {a : F} (ha : a ≠ 0) : kloostermanSum ψ a 0 F = -1 := by sorry

/-- FF.2/kloosterman-l-function: two eigenvalues with product `q` (Carlitz). -/
theorem kloostermanSum_eigenvalues (hψ : ψ ≠ 1) {a b : F} (ha : a ≠ 0) (hb : b ≠ 0) :
    ∃ α β : ℂ, α + β = -kloostermanSum ψ a b F ∧ α * β = Fintype.card F ∧
      ∀ (L : Type) [Field L] [Fintype L] [DecidableEq L] [Algebra F L],
        kloostermanSum ψ a b L = -(α ^ Module.finrank F L + β ^ Module.finrank F L) := by
  sorry

/-- FF.2/kloosterman-bound: `|K(a, b; L)| ≤ 2 |L|^{1/2}`. -/
theorem kloosterman_bound (hψ : ψ ≠ 1) {a b : F} (ha : a ≠ 0) (hb : b ≠ 0) :
    ‖kloostermanSum ψ a b L‖ ≤ 2 * Real.sqrt (Fintype.card L) := by sorry

end Kloosterman

/-- Unit test `kloostermanSum_test_F3`: over `ZMod 3`, `K(1, 1) = -1`. -/
example (ψ : AddChar (ZMod 3) ℂ) (hψ : ψ ≠ 1) : kloostermanSum ψ 1 1 (ZMod 3) = -1 := by sorry

/-! ## Several variables -/

/-- FF.2/hypersurface-through-all-rational-points (Sommes trig. Lemme 3.9), in the affine-cone form. -/
theorem hypersurface_through_all_rational_points {r d : ℕ} (hr : 1 ≤ r)
    (H : MvPolynomial (Fin (r + 1)) F) (hH : H.IsHomogeneous d) (hne : H ≠ 0)
    (hvan : ∀ x : Fin (r + 1) → F, MvPolynomial.eval x H = 0) :
    Fintype.card F + 1 ≤ d := by
  sorry

/-- FF.2/elementary-n-variable-bound (Sommes trig. Proposition 3.8). -/
theorem elementary_n_variable_bound {n : ℕ} (P : MvPolynomial (Fin n) F)
    (hP : ¬ ∃ (Q : MvPolynomial (Fin n) F) (c : F), P = Q ^ ringChar F - Q + MvPolynomial.C c) :
    ‖∑ x : Fin n → F, AddChar.FiniteField.primitiveChar_to_Complex F (MvPolynomial.eval x P)‖ ≤
      (P.totalDegree - 1 : ℝ) * (Fintype.card F : ℝ) ^ ((n : ℝ) - 1 / 2) := by
  sorry

/-- FF.2/deligne-n-variable-bound (Weil I Théorème 8.4): `p ∤ d` and the leading form defines a
smooth hypersurface (its partial derivatives have no common nonzero zero over `F̄`). -/
theorem deligne_n_variable_bound {n : ℕ} (ψ : AddChar F ℂ) (hψ : ψ ≠ 1)
    (Q : MvPolynomial (Fin n) F) (hp : ¬ ringChar F ∣ Q.totalDegree)
    (hsmooth : ∀ x : Fin n → AlgebraicClosure F, x ≠ 0 →
      ¬ ∀ i, MvPolynomial.eval x (MvPolynomial.map (algebraMap F (AlgebraicClosure F))
        (MvPolynomial.pderiv i (MvPolynomial.homogeneousComponent Q.totalDegree Q))) = 0) :
    ‖∑ x : Fin n → F, ψ (MvPolynomial.eval x Q)‖ ≤
      ((Q.totalDegree - 1 : ℝ)) ^ n * Real.sqrt (Fintype.card F) ^ n := by
  sorry

/-! ## Lang–Weil, affine form

The nodes are stated for separated schemes of finite type, with the constant
`C_V = Σ_{i<2e} dim H^i_c(V_F̄, ℚ_ℓ)`; schemes over `F` and `H^i_c` come from `SF.0`/`SF.2`. The
signatures below are the affine specialisations (a closed subscheme of `A^N` given by an ideal),
with the constant asserted to exist. The uniform estimate (Ghorpade–Lachaud Theorem 11.1) needs the
degree of a subvariety of projective space, which Mathlib does not define, and is not stated. -/

/-- FF.2/lang-weil-estimate, affine form: `V = V(I) ⊆ A^N` geometrically irreducible of
dimension `e`. -/
theorem langWeil_affine {N e : ℕ} (I : Ideal (MvPolynomial (Fin N) F))
    (hgeom : (Ideal.map (MvPolynomial.map (algebraMap F (AlgebraicClosure F))) I).radical.IsPrime)
    (hdim : ringKrullDim (MvPolynomial (Fin N) F ⧸ I) = e) :
    ∃ C : ℝ, ∀ (L : Type) [Field L] [Fintype L] [Algebra F L],
      |(Nat.card {x : Fin N → L // ∀ p ∈ I, MvPolynomial.aeval x p = 0} : ℝ) -
          (Fintype.card L : ℝ) ^ e| ≤
        C * (Fintype.card L : ℝ) ^ ((e : ℝ) - 1 / 2) := by
  sorry

/-- FF.2/dimension-from-point-counts, affine form: a bound `C |L|^D` over every finite extension
`L` of `F` bounds the dimension by `D`. -/
theorem ringKrullDim_le_of_pointCount_le {N : ℕ} (I : Ideal (MvPolynomial (Fin N) F)) (D : ℕ)
    (C : ℝ) (hC : ∀ (L : Type) [Field L] [Fintype L] [Algebra F L],
      (Nat.card {x : Fin N → L // ∀ p ∈ I, MvPolynomial.aeval x p = 0} : ℝ) ≤
        C * (Fintype.card L : ℝ) ^ D) :
    ringKrullDim (MvPolynomial (Fin N) F ⧸ I) ≤ D := by
  sorry

/-! ## The Fourier–Deligne transform, through its trace-function dictionary

The sheaf-level transform `FT_ψ(K) = R pr₂! (pr₁^* K ⊗ L_ψ(xy))[1]` on `D^b_c(A¹_F, E)` is not
declared: the carrier is supplied by `SF.2`/`EDC.0`. By Laumon's Théorème 1.2.1.2 its trace
function is the finite transform below, with the sign coming from the shift `[1]`. -/

/-- `t ↦ (y ↦ -Σ_x t(x) ψ(xy))`, the trace function of `FT_ψ(K)` in terms of that of `K`. -/
def fourierDeligneTrace (ψ : AddChar F ℂ) (t : F → ℂ) : F → ℂ :=
  fun y => -∑ x : F, t x * ψ (x * y)

section FourierDeligne

variable (ψ : AddChar F ℂ)

theorem fourierDeligneTrace_fourierDeligneTrace (hψ : ψ ≠ 1) (t : F → ℂ) (x : F) :
    fourierDeligneTrace ψ (fourierDeligneTrace ψ t) x = Fintype.card F * t (-x) := by sorry

theorem fourierDeligneTrace_one (hψ : ψ ≠ 1) :
    fourierDeligneTrace ψ 1 = fun y => if y = 0 then -(Fintype.card F : ℂ) else 0 := by sorry

theorem fourierDeligneTrace_single (a y : F) :
    fourierDeligneTrace ψ (Pi.single a 1) y = -ψ (a * y) := by sorry

theorem fourierDeligneTrace_mulShift (a : F) (t : F → ℂ) (y : F) :
    fourierDeligneTrace (ψ.mulShift a) t y = fourierDeligneTrace ψ t (a * y) := by sorry

/-- Unit test `fourierDeligneTrace_test_one`: the constant sheaf transforms to `-q·δ₀`. -/
example (hψ : ψ ≠ 1) (y : F) (hy : y ≠ 0) :
    fourierDeligneTrace ψ 1 0 = -(Fintype.card F : ℂ) ∧ fourierDeligneTrace ψ 1 y = 0 := by sorry

/-- Unit test `fourierDeligneTrace_test_delta`: `δ₀` transforms to the constant `-1`. -/
example (y : F) : fourierDeligneTrace ψ (Pi.single 0 1) y = -1 := by sorry

/-- Unit test `fourierDeligneTrace_test_sign`: the value at `0` is `-q`, not `q`. -/
example (hψ : ψ ≠ 1) : fourierDeligneTrace ψ 1 0 ≠ (Fintype.card F : ℂ) := by sorry

end FourierDeligne

end

end FF2

end TauCeti.FiniteFieldSums

end FF2File


-- ===== FF.3 =====

section FF3File

/-!
# FF.3 Factorization and point counting (suggested Lean forms)

This file is not the roadmap and is not exhaustive. The roadmap document is definitive; these
statements suggest Lean forms so that contributors and reviewers converge on names and signatures.
They claim no implementation.

Conventions pinned here.
* Algorithms are Mathlib functions on `Polynomial F`; executable presentations and their
  refinement lemmas are ComputationalNumberTheory CN.0's.
* A randomized algorithm run for `n` rounds is a `PMF`; "Las Vegas correctness" is a statement
  about the support, the failure probability is the mass of the unfinished outcomes, and the
  expected number of rounds is the sum over `n` of the probability of not having finished after
  `n` rounds.
* Operation counts (in the algebraic cost model of CN.0: unit cost for a ring operation, an
  equality test, an inversion, and a uniform draw from `F`) are stated in the roadmap document
  and are not prototyped here: CN.0 owns the cost model and it cannot be stated at the Mathlib pin.
* Tau Ceti's `WeierstrassCurve.pointCount` and `WeierstrassCurve.frobeniusTrace` are not
  importable in this Mathlib-only file; the point-count section uses `naivePointCount`, which
  equals `pointCount` by `naivePointCount_eq_natCard` and Tau Ceti's `pointCount_def`, and writes
  the trace as `q + 1 - naivePointCount W`. Facts that EllipticCurves layers 2 and 3 own (the
  Frobenius relation on points, the structure of `E[ℓ]`, the Hasse bound) enter as explicit
  hypotheses, each marked in its docstring.
-/

namespace TauCeti.FiniteFieldSums

noncomputable section FF3

open Polynomial

/-- `𝔽₅` and `𝔽₇` appear in the unit tests. -/
local instance ff3FactPrimeFive : Fact (Nat.Prime 5) := ⟨by decide⟩

local instance ff3FactPrimeSeven : Fact (Nat.Prime 7) := ⟨by decide⟩

/-! ### FF.3 A. Counting monic irreducible polynomials (Shoup §19.2; Bary-Soroker–Koukoulopoulos–Kozma
Proposition 8.1 and Lemma 3.2) -/

variable {F : Type*} [Field F] [Fintype F] [DecidableEq F]

-- `monicOfDegree` and its API are declared in the FF.2 section (node FF.2/monic-polynomials-of-degree).

/-- The monic irreducible polynomials of degree `n` over `F`. -/
def monicIrreducibles (F : Type*) [Field F] [Fintype F] [DecidableEq F] (n : ℕ) :
    Finset F[X] := by
  classical
  exact (monicOfDegree F n).filter Irreducible

theorem mem_monicIrreducibles {f : F[X]} {n : ℕ} :
    f ∈ monicIrreducibles F n ↔ f.Monic ∧ Irreducible f ∧ f.natDegree = n := sorry

theorem mem_monicIrreducibles_iff_normalize {f : F[X]} {n : ℕ} :
    f ∈ monicIrreducibles F n ↔ Irreducible f ∧ normalize f = f ∧ f.natDegree = n := sorry

theorem monicIrreducibles_zero : monicIrreducibles F 0 = ∅ := sorry

/-- Unit test `monicIrreducibles_zmod_two_two`: the only irreducible monic quadratic over `𝔽₂` is
`X² + X + 1`. -/
example : monicIrreducibles (ZMod 2) 2 = {X ^ 2 + X + 1} := sorry

/-- Unit test `monicIrreducibles_zmod_two_one`: every monic linear polynomial is irreducible. -/
example : monicIrreducibles (ZMod 2) 1 = {X, X + 1} := sorry

/-- Unit test `X_sq_add_one_not_mem_monicIrreducibles`: `X² + 1 = (X + 1)²` over `𝔽₂`. -/
example : (X ^ 2 + 1 : (ZMod 2)[X]) ∉ monicIrreducibles (ZMod 2) 2 := sorry

/-- **The number `Π_F(n)` of monic irreducible polynomials of degree `n` over `F`** (Shoup's
`Π_F(ℓ)`; Bary-Soroker–Koukoulopoulos–Kozma's `π_p(k)` when `F = 𝔽_p`). -/
def irreducibleCount (F : Type*) [Field F] [Fintype F] [DecidableEq F] (n : ℕ) : ℕ :=
  (monicIrreducibles F n).card

theorem irreducibleCount_eq_natCard (n : ℕ) :
    irreducibleCount F n =
      Nat.card {f : F[X] // f.Monic ∧ Irreducible f ∧ f.natDegree = n} := sorry

theorem irreducibleCount_zero : irreducibleCount F 0 = 0 := sorry

theorem irreducibleCount_one : irreducibleCount F 1 = Fintype.card F := sorry

/-- Unit test `irreducibleCount_zmod_two_four`: there are three irreducible quartics over `𝔽₂`. -/
example : irreducibleCount (ZMod 2) 4 = 3 := sorry

/-- Unit test `irreducibleCount_zmod_three_two`: there are three irreducible monic quadratics over
`𝔽₃`. -/
example : irreducibleCount (ZMod 3) 2 = 3 := sorry

/-- Unit test `irreducibleCount_zmod_three_three`: there are eight irreducible monic cubics over
`𝔽₃`. -/
example : irreducibleCount (ZMod 3) 3 = 8 := sorry

/-- Unit test `irreducibleCount_eq_card_normalizedFactors`: the count agrees with the number of
normalized factors of degree `n` of Mathlib's factorization of `X ^ q ^ n - X`. -/
example (n : ℕ) (hn : n ≠ 0) :
    irreducibleCount F n =
      ((UniqueFactorizationMonoid.normalizedFactors (X ^ Fintype.card F ^ n - X : F[X])).filter
        fun f => f.natDegree = n).card := sorry

/-- **Partition of an extension by minimal polynomials.** For a field `E ⊇ F` of degree `n` and any
condition `C` on polynomials, the elements of `E` whose minimal polynomial satisfies `C` number
`∑_{d ∣ n} d · #{f monic irreducible of degree d with C f}`. -/
theorem card_filter_minpoly_eq_sum (E : Type*) [Field E] [Fintype E] [Algebra F E] {n : ℕ}
    (hn : Module.finrank F E = n) (C : F[X] → Prop) [DecidablePred C] :
    (Finset.univ.filter fun α : E => C (minpoly F α)).card =
      ∑ d ∈ n.divisors, d * ((monicIrreducibles F d).filter C).card := sorry

/-- **Gauss's product formula** (Shoup, Theorem 19.10): `X ^ (q ^ n) - X` is the product of the monic
irreducible polynomials whose degree divides `n`. -/
theorem X_pow_card_pow_sub_X_eq_prod_monicIrreducibles {n : ℕ} (hn : n ≠ 0) :
    (X ^ Fintype.card F ^ n - X : F[X]) = ∏ d ∈ n.divisors, ∏ f ∈ monicIrreducibles F d, f := sorry

/-- **Gauss's count** (Shoup, Theorem 19.11): `q ^ n = ∑_{d ∣ n} d · Π_F(d)`. -/
theorem sum_divisors_mul_irreducibleCount {n : ℕ} (hn : n ≠ 0) :
    ∑ d ∈ n.divisors, d * irreducibleCount F d = Fintype.card F ^ n := sorry

/-- **The Möbius formula** (Shoup, Exercise 19.1): `n · Π_F(n) = ∑_{d ∣ n} μ(d) q ^ (n / d)`. -/
theorem mul_irreducibleCount_eq_sum_moebius {n : ℕ} (hn : n ≠ 0) :
    ((n * irreducibleCount F n : ℕ) : ℤ) =
      ∑ d ∈ n.divisors, ArithmeticFunction.moebius d * (Fintype.card F : ℤ) ^ (n / d) := sorry

/-- **The upper bound** `n · Π_F(n) ≤ q ^ n` (Shoup (19.2); Bary-Soroker–Koukoulopoulos–Kozma,
Proposition 8.1). -/
theorem mul_irreducibleCount_le (n : ℕ) : n * irreducibleCount F n ≤ Fintype.card F ^ n := sorry

/-- **The lower bound of Bary-Soroker–Koukoulopoulos–Kozma, Proposition 8.1, in integer form**:
`q ^ n ≤ n · Π_F(n) + 2 q ^ ⌊n / 2⌋`. -/
theorem card_pow_le_mul_irreducibleCount_add {n : ℕ} (hn : n ≠ 0) :
    Fintype.card F ^ n ≤ n * irreducibleCount F n + 2 * Fintype.card F ^ (n / 2) := sorry

/-- **The prime polynomial theorem** in the form of Bary-Soroker–Koukoulopoulos–Kozma,
Proposition 8.1: `(q ^ n - 2 q ^ (n / 2)) / n ≤ Π_F(n) ≤ q ^ n / n`, with real exponent `n / 2`. -/
theorem prime_polynomial_theorem {n : ℕ} (hn : n ≠ 0) :
    ((Fintype.card F : ℝ) ^ n - 2 * (Fintype.card F : ℝ) ^ ((n : ℝ) / 2)) / n ≤
        irreducibleCount F n ∧
      (irreducibleCount F n : ℝ) ≤ (Fintype.card F : ℝ) ^ n / n := sorry

/-- **Shoup's lower bound** (19.2): `q ^ n ≤ 2 n · Π_F(n)`, so a uniformly random monic polynomial of
degree `n` is irreducible with probability at least `1 / (2n)`. -/
theorem card_pow_le_two_mul_mul_irreducibleCount {n : ℕ} (hn : n ≠ 0) :
    Fintype.card F ^ n ≤ 2 * n * irreducibleCount F n := sorry

/-- The number of monic irreducible polynomials of degree `n` over `F` with constant coefficient `b`. -/
def irreducibleCountWithConstantCoeff (F : Type*) [Field F] [Fintype F] [DecidableEq F] (n : ℕ)
    (b : F) : ℕ := by
  classical
  exact ((monicIrreducibles F n).filter fun f => f.coeff 0 = b).card

theorem sum_irreducibleCountWithConstantCoeff (n : ℕ) :
    ∑ b : F, irreducibleCountWithConstantCoeff F n b = irreducibleCount F n := sorry

theorem irreducibleCountWithConstantCoeff_zero_right {n : ℕ} :
    irreducibleCountWithConstantCoeff F n 0 = if n = 1 then 1 else 0 := sorry

theorem irreducibleCountWithConstantCoeff_one (b : F) :
    irreducibleCountWithConstantCoeff F 1 b = 1 := sorry

/-- Unit test `irreducibleCountWithConstantCoeff_zmod_three_two`: over `𝔽₃` the irreducible monic
quadratics with constant coefficient `2` are `X² + X + 2` and `X² + 2X + 2`. -/
example : irreducibleCountWithConstantCoeff (ZMod 3) 2 2 = 2 := sorry

/-- Unit test `irreducibleCountWithConstantCoeff_zmod_three_two_one`: the only one with constant
coefficient `1` is `X² + 1`. -/
example : irreducibleCountWithConstantCoeff (ZMod 3) 2 1 = 1 := sorry

/-- Unit test `irreducibleCountWithConstantCoeff_zmod_two_three`: both irreducible cubics over `𝔽₂`
have constant coefficient `1`. -/
example : irreducibleCountWithConstantCoeff (ZMod 2) 3 1 = 2 := sorry

/-- Unit test `irreducibleCountWithConstantCoeff_zero_two`: no irreducible quadratic has constant
coefficient `0`. -/
example : irreducibleCountWithConstantCoeff (ZMod 5) 2 0 = 0 := sorry

/-- **The norm of an element from its minimal polynomial.** In an extension `E / F` of finite
fields of degree `n`, `N_{E/F}(α) = (-1) ^ n · P(0) ^ (n / deg P)` for `P` the minimal polynomial. -/
theorem norm_eq_neg_one_pow_mul_coeff_zero_minpoly_pow (E : Type*) [Field E] [Fintype E]
    [Algebra F E] {n : ℕ} (hn : Module.finrank F E = n) (α : E) :
    Algebra.norm F α =
      (-1) ^ n * (minpoly F α).coeff 0 ^ (n / (minpoly F α).natDegree) := sorry

/-- **The norm-fibre identity for constant coefficients**: for `b ≠ 0` and `n ≥ 1`,
`∑_{d ∣ n} d · #{P monic irreducible of degree d : P(0) ^ (n / d) = b} = (q ^ n - 1) / (q - 1)`. -/
theorem sum_divisors_mul_card_coeff_zero_pow_eq {n : ℕ} (hn : n ≠ 0) {b : F} (hb : b ≠ 0) :
    ∑ d ∈ n.divisors,
        d * ((monicIrreducibles F d).filter fun f => f.coeff 0 ^ (n / d) = b).card =
      (Fintype.card F ^ n - 1) / (Fintype.card F - 1) := sorry

/-- **Irreducible polynomials with prescribed constant coefficient, explicit two-sided bound**: for
`b ≠ 0` and `n ≥ 1`,
`(q ^ n - 1) / (q - 1) - 2 q ^ ⌊n / 2⌋ ≤ n · Π_F(n; b) ≤ (q ^ n - 1) / (q - 1)`. -/
theorem mul_irreducibleCountWithConstantCoeff_bounds {n : ℕ} (hn : n ≠ 0) {b : F} (hb : b ≠ 0) :
    ((Fintype.card F ^ n - 1) / (Fintype.card F - 1) : ℤ) - 2 * Fintype.card F ^ (n / 2) ≤
        n * irreducibleCountWithConstantCoeff F n b ∧
      n * irreducibleCountWithConstantCoeff F n b ≤
        (Fintype.card F ^ n - 1) / (Fintype.card F - 1) := sorry

/-- **Bary-Soroker–Koukoulopoulos–Kozma's form (proof of Lemma 3.2, citing Rosen, Theorem 4.8)**,
with the explicit constant `3`: `|n (q - 1) Π_F(n; b) / q ^ n - 1| ≤ 3 q ^ (1 - n / 2)`. -/
theorem abs_irreducibleCountWithConstantCoeff_sub_le {n : ℕ} (hn : n ≠ 0) {b : F} (hb : b ≠ 0) :
    |(n * (Fintype.card F - 1) * irreducibleCountWithConstantCoeff F n b : ℝ) /
          (Fintype.card F : ℝ) ^ n - 1| ≤
      3 * (Fintype.card F : ℝ) ^ (1 - (n : ℝ) / 2) := sorry

/-! ### FF.3 B. Square-free decomposition (Shoup §20.3) -/

/-- **The `p`-th root of a polynomial with zero derivative** (Shoup, Theorem 20.3, formula (20.2)):
over a perfect field of characteristic `p`, `f = g(X ^ p)` and `f = h ^ p` with `h` obtained from
`contract p f` by applying the inverse Frobenius to the coefficients. -/
def pthRootOfDerivZero (p : ℕ) [Fact p.Prime] [CharP F p] (f : F[X]) : F[X] :=
  (contract p f).map ((frobeniusEquiv F p).symm : F →+* F)

theorem pthRootOfDerivZero_pow (p : ℕ) [Fact p.Prime] [CharP F p] {f : F[X]}
    (hf : derivative f = 0) : pthRootOfDerivZero p f ^ p = f := sorry

theorem natDegree_pthRootOfDerivZero (p : ℕ) [Fact p.Prime] [CharP F p] {f : F[X]}
    (hf : derivative f = 0) : (pthRootOfDerivZero p f).natDegree * p = f.natDegree := sorry

theorem pthRootOfDerivZero_monic (p : ℕ) [Fact p.Prime] [CharP F p] {f : F[X]}
    (hf : derivative f = 0) (hm : f.Monic) : (pthRootOfDerivZero p f).Monic := sorry

/-- Unit test `pthRootOfDerivZero_X_pow`: the `p`-th root of `X ^ p` is `X`. -/
example (p : ℕ) [Fact p.Prime] [CharP F p] : pthRootOfDerivZero p (X ^ p : F[X]) = X := sorry

/-- Unit test `pthRootOfDerivZero_X_sq_add_one`: over `𝔽₂`, `X² + 1 = (X + 1)²`. -/
example : pthRootOfDerivZero 2 (X ^ 2 + 1 : (ZMod 2)[X]) = X + 1 := sorry

/-- Unit test `pthRootOfDerivZero_X_not_root`: the derivative hypothesis is needed; `X` has
derivative `1` and the construction does not return a square root of it. -/
example : pthRootOfDerivZero 2 (X : (ZMod 2)[X]) ^ 2 ≠ X := sorry

/-- **The radical of the part with exponents prime to `p`** (Shoup, Theorem 20.4): for monic `f`,
`f / gcd(f, f')` is the product of the distinct irreducible factors of `f` whose multiplicity is not
divisible by the characteristic. -/
theorem div_gcd_derivative_eq_prod {f : F[X]} (hf : f.Monic) :
    f / gcd f (derivative f) =
      ∏ g ∈ (UniqueFactorizationMonoid.normalizedFactors f).toFinset.filter
        (fun g => ¬ ringChar F ∣ (UniqueFactorizationMonoid.normalizedFactors f).count g), g :=
  sorry

/-- **A square-free decomposition** (Shoup, §20.3, with pairwise distinct multiplicities): a list of
pairs `(gᵢ, sᵢ)` with each `gᵢ` monic, nonconstant and square-free, the `gᵢ` pairwise coprime, the
`sᵢ` positive and pairwise distinct, and `f = ∏ gᵢ ^ sᵢ`. -/
structure IsSquarefreeDecomposition (f : F[X]) (L : List (F[X] × ℕ)) : Prop where
  monic : ∀ g ∈ L, g.1.Monic
  natDegree_pos : ∀ g ∈ L, 0 < g.1.natDegree
  squarefree : ∀ g ∈ L, Squarefree g.1
  mult_pos : ∀ g ∈ L, 0 < g.2
  pairwise_isCoprime : L.Pairwise fun a b => IsCoprime a.1 b.1
  mult_nodup : (L.map Prod.snd).Nodup
  prod_pow_eq : (L.map fun g => g.1 ^ g.2).prod = f

omit [Fintype F] [DecidableEq F] in
theorem IsSquarefreeDecomposition.prod_eq {f : F[X]} {L : List (F[X] × ℕ)}
    (h : IsSquarefreeDecomposition f L) : (L.map fun g => g.1 ^ g.2).prod = f :=
  h.prod_pow_eq

theorem isSquarefreeDecomposition_iff {f : F[X]} (hf : f.Monic) {L : List (F[X] × ℕ)} :
    IsSquarefreeDecomposition f L ↔
      (L.map Prod.snd).Nodup ∧ (∀ g ∈ L, 0 < g.2 ∧ g.1 ≠ 1) ∧
        (∀ h ∈ UniqueFactorizationMonoid.normalizedFactors f,
          (UniqueFactorizationMonoid.normalizedFactors f).count h ∈ L.map Prod.snd) ∧
        ∀ g ∈ L, g.1 = ∏ h ∈ (UniqueFactorizationMonoid.normalizedFactors f).toFinset.filter
            (fun h => (UniqueFactorizationMonoid.normalizedFactors f).count h = g.2), h := sorry

theorem IsSquarefreeDecomposition.perm {f : F[X]} {L L' : List (F[X] × ℕ)}
    (h : IsSquarefreeDecomposition f L) (h' : IsSquarefreeDecomposition f L') : L.Perm L' := sorry

theorem isSquarefreeDecomposition_one : IsSquarefreeDecomposition (1 : F[X]) [] := sorry

/-- Unit test `isSquarefreeDecomposition_X_sq_mul_X_add_one`: over `𝔽₂`,
`X² (X + 1)` decomposes as `(X + 1)¹ · X²`. -/
example : IsSquarefreeDecomposition (X ^ 2 * (X + 1) : (ZMod 2)[X]) [(X + 1, 1), (X, 2)] := sorry

/-- Unit test `isSquarefreeDecomposition_one_iff`: the empty list is the only decomposition of
`1`. -/
example (L : List (F[X] × ℕ)) : IsSquarefreeDecomposition (1 : F[X]) L ↔ L = [] := sorry

/-- Unit test `not_isSquarefreeDecomposition_repeated`: `[(X, 1), (X, 1)]` multiplies to `X²` but
is not a square-free decomposition. -/
example : ¬ IsSquarefreeDecomposition (X ^ 2 : (ZMod 2)[X]) [(X, 1), (X, 1)] := sorry

/-- **Algorithm SFD** (Shoup, §20.3): the square-free decomposition computed by repeated
`gcd(f, f')` and `p`-th roots. -/
def squarefreeDecomposition (f : F[X]) : List (F[X] × ℕ) := sorry

/-- **Correctness of Algorithm SFD** (Shoup, Theorem 20.5, correctness part). -/
theorem isSquarefreeDecomposition_squarefreeDecomposition {f : F[X]} (hf : f.Monic) :
    IsSquarefreeDecomposition f (squarefreeDecomposition f) := sorry

theorem squarefreeDecomposition_of_squarefree {f : F[X]} (hf : f.Monic) (hsq : Squarefree f)
    (hdeg : 0 < f.natDegree) : squarefreeDecomposition f = [(f, 1)] := sorry

theorem squarefreeDecomposition_one : squarefreeDecomposition (1 : F[X]) = [] := sorry

theorem length_squarefreeDecomposition_le (f : F[X]) :
    (squarefreeDecomposition f).length ≤ f.natDegree := sorry

/-- Unit test `squarefreeDecomposition_X_sq_mul_X_add_one`: the order of the output is the order of
Algorithm SFD's first pass, multiplicity `1` first. -/
example : squarefreeDecomposition (X ^ 2 * (X + 1) : (ZMod 2)[X]) = [(X + 1, 1), (X, 2)] := sorry

/-- Unit test `squarefreeDecomposition_X_sq_add_one`: the inseparable case, through the `p`-th
root. -/
example : squarefreeDecomposition (X ^ 2 + 1 : (ZMod 2)[X]) = [(X + 1, 2)] := sorry

/-- Unit test `squarefreeDecomposition_X_pow_three`: over `𝔽₃`, `X³` has derivative `0`. -/
example : squarefreeDecomposition (X ^ 3 : (ZMod 3)[X]) = [(X, 3)] := sorry

/-! ### FF.3 C. Distinct-degree factorization, irreducibility testing (Shoup §§20.1, 20.4.1) -/

-- The Rabin irreducibility certificate is FF.0's `RabinCertificate f` (node FF.0/rabin-irreducibility-certificate).

/-- The splitting lemma behind Algorithms IPT and DDF (Shoup, Theorem 19.10 as used in §§20.1 and
20.4.1): if the monic square-free `f` has no irreducible factor of degree less than `k ≥ 1`, then
`gcd(X ^ (q ^ k) - X, f)` is the product of its irreducible factors of degree exactly `k`. -/
theorem gcd_X_pow_card_pow_sub_X_eq_prod {f : F[X]} (hf : f.Monic) (hsq : Squarefree f) {k : ℕ}
    (hk : 1 ≤ k)
    (hmin : ∀ g ∈ UniqueFactorizationMonoid.normalizedFactors f, k ≤ g.natDegree) :
    gcd (X ^ Fintype.card F ^ k - X) f =
      ∏ g ∈ (UniqueFactorizationMonoid.normalizedFactors f).toFinset.filter
        (fun g => g.natDegree = k), g := sorry

/-- **A distinct-degree factorization** (Shoup, §20.4.1): pairs `(gᵢ, kᵢ)` with `gᵢ ≠ 1` monic and
square-free, every irreducible factor of `gᵢ` of degree `kᵢ`, the `kᵢ` strictly increasing, and
`f = ∏ gᵢ`. -/
structure IsDistinctDegreeFactorization (f : F[X]) (L : List (F[X] × ℕ)) : Prop where
  monic : ∀ g ∈ L, g.1.Monic
  ne_one : ∀ g ∈ L, g.1 ≠ 1
  squarefree : ∀ g ∈ L, Squarefree g.1
  natDegree_factor : ∀ g ∈ L, ∀ h ∈ UniqueFactorizationMonoid.normalizedFactors g.1,
    h.natDegree = g.2
  degrees_sorted : (L.map Prod.snd).Pairwise (· < ·)
  prod_eq : (L.map Prod.fst).prod = f

theorem IsDistinctDegreeFactorization.natDegree_eq {f : F[X]} {L : List (F[X] × ℕ)}
    (h : IsDistinctDegreeFactorization f L) {g : F[X] × ℕ} (hg : g ∈ L) :
    g.1.natDegree = g.2 * (UniqueFactorizationMonoid.normalizedFactors g.1).card := sorry

theorem isDistinctDegreeFactorization_iff {f : F[X]} (hf : f.Monic) (hsq : Squarefree f)
    {L : List (F[X] × ℕ)} :
    IsDistinctDegreeFactorization f L ↔
      (L.map Prod.snd).Pairwise (· < ·) ∧
        (∀ h ∈ UniqueFactorizationMonoid.normalizedFactors f, h.natDegree ∈ L.map Prod.snd) ∧
        ∀ g ∈ L, g.1 ≠ 1 ∧ g.1 = ∏ h ∈ (UniqueFactorizationMonoid.normalizedFactors f).toFinset.filter
          (fun h => h.natDegree = g.2), h := sorry

theorem isDistinctDegreeFactorization_one : IsDistinctDegreeFactorization (1 : F[X]) [] := sorry

/-- Unit test `isDistinctDegreeFactorization_X_pow_four_add_X`: over `𝔽₂`,
`X⁴ + X = X (X + 1) (X² + X + 1)` has linear part `X² + X` and quadratic part `X² + X + 1`. -/
example : IsDistinctDegreeFactorization (X ^ 4 + X : (ZMod 2)[X])
    [(X ^ 2 + X, 1), (X ^ 2 + X + 1, 2)] := sorry

/-- Unit test `not_isDistinctDegreeFactorization_trivial`: `[(X⁴ + X, 1)]` is not a distinct-degree
factorization: the block contains a quadratic factor. -/
example : ¬ IsDistinctDegreeFactorization (X ^ 4 + X : (ZMod 2)[X]) [(X ^ 4 + X, 1)] := sorry

/-- Unit test `isDistinctDegreeFactorization_of_irreducible`: an irreducible monic polynomial is its
own single block. -/
example {f : F[X]} (hf : f.Monic) (hirr : Irreducible f) :
    IsDistinctDegreeFactorization f [(f, f.natDegree)] := sorry

/-- **Algorithm DDF** (Shoup, §20.4.1). -/
def distinctDegreeFactorization (f : F[X]) : List (F[X] × ℕ) := sorry

/-- **Correctness of Algorithm DDF** (Shoup, §20.4.1). -/
theorem isDistinctDegreeFactorization_distinctDegreeFactorization {f : F[X]} (hf : f.Monic)
    (hsq : Squarefree f) : IsDistinctDegreeFactorization f (distinctDegreeFactorization f) := sorry

theorem length_distinctDegreeFactorization_le (f : F[X]) :
    (distinctDegreeFactorization f).length ≤ f.natDegree := sorry

theorem distinctDegreeFactorization_of_irreducible {f : F[X]} (hf : f.Monic)
    (hirr : Irreducible f) : distinctDegreeFactorization f = [(f, f.natDegree)] := sorry

theorem distinctDegreeFactorization_one : distinctDegreeFactorization (1 : F[X]) = [] := sorry

/-- Unit test `distinctDegreeFactorization_X_pow_four_add_X`: Algorithm DDF on `X⁴ + X` over
`𝔽₂`. -/
example : distinctDegreeFactorization (X ^ 4 + X : (ZMod 2)[X]) =
    [(X ^ 2 + X, 1), (X ^ 2 + X + 1, 2)] := sorry

/-- Unit test `distinctDegreeFactorization_X_sq_add_X_add_one`: a single quadratic block. -/
example : distinctDegreeFactorization (X ^ 2 + X + 1 : (ZMod 2)[X]) = [(X ^ 2 + X + 1, 2)] := sorry

/-- Unit test `distinctDegreeFactorization_X_pow_five_sub_X_sub_one`: over `𝔽₂`,
`X⁵ - X - 1 = (X² + X + 1)(X³ + X² + 1)`, the factorization of Tau Ceti's worked example. -/
example : distinctDegreeFactorization (X ^ 5 - X - 1 : (ZMod 2)[X]) =
    [(X ^ 2 + X + 1, 2), (X ^ 3 + X ^ 2 + 1, 3)] := sorry

/-- **Algorithm IPT** (Shoup, §20.1): `f` passes when `gcd(X ^ (q ^ k) mod f - X, f) = 1` for every
`1 ≤ k ≤ ⌊deg f / 2⌋`. -/
def irreducibilityTest (f : F[X]) : Bool := by
  classical
  exact decide (∀ k ∈ Finset.Icc 1 (f.natDegree / 2),
    gcd ((X ^ Fintype.card F ^ k) %ₘ f - X) f = 1)

/-- **Correctness of Algorithm IPT** (Shoup, §20.1). -/
theorem irreducibilityTest_eq_true_iff {f : F[X]} (hf : f.Monic) (hdeg : 0 < f.natDegree) :
    irreducibilityTest f = true ↔ Irreducible f := sorry

theorem irreducibilityTest_of_natDegree_le_one {f : F[X]} (hdeg : f.natDegree ≤ 1) :
    irreducibilityTest f = true := sorry

theorem irreducibilityTest_eq_false_of_dvd {f g : F[X]} (hg : g.Monic) (hgdeg : 0 < g.natDegree)
    (hg2 : g.natDegree ≤ f.natDegree / 2) (hdvd : g ∣ f) : irreducibilityTest f = false := sorry

/-- Unit test `irreducibilityTest_X_sq_add_X_add_one`: `X² + X + 1` passes over `𝔽₂`. -/
example : irreducibilityTest (X ^ 2 + X + 1 : (ZMod 2)[X]) = true := sorry

/-- Unit test `irreducibilityTest_X_sq_add_one`: `X² + 1 = (X + 1)²` fails over `𝔽₂`. -/
example : irreducibilityTest (X ^ 2 + 1 : (ZMod 2)[X]) = false := sorry

/-- Unit test `irreducibilityTest_X_pow_five_sub_X_sub_one`: `X⁵ - X - 1` passes over `𝔽₅`, the
statement Tau Ceti proves by hand as `Polynomial.irreducible_X_pow_five_sub_X_sub_one_zmod_five`. -/
example : irreducibilityTest (X ^ 5 - X - 1 : (ZMod 5)[X]) = true := sorry

/-- **Rabin certificate generation**: for each prime `s ∣ deg f`, extended Euclid on
`X ^ (q ^ (deg f / s)) mod f - X` and `f`. -/
def rabinCertificateOf (f : F[X]) : RabinCertificate f := sorry

/-- The generated certificate checks for every monic irreducible `f` (completeness of FF.0's
certificate, made constructive). -/
theorem rabinCertificateOf_check {f : F[X]} (hf : f.Monic) (hirr : Irreducible f) :
    (rabinCertificateOf f).check = true := sorry

theorem rabinCertificateOf_bezout_of_not_prime {f : F[X]} {s : ℕ} (hs : ¬ s.Prime) :
    (rabinCertificateOf f).bezout s = (0, 0) := sorry

theorem rabinCertificateOf_bezout {f : F[X]} (hf : f.Monic) (hirr : Irreducible f) {s : ℕ}
    (hs : s ∈ f.natDegree.primeFactors) :
    ((rabinCertificateOf f).bezout s).1 * ((X ^ Fintype.card F ^ (f.natDegree / s)) %ₘ f - X) +
      ((rabinCertificateOf f).bezout s).2 * f = 1 := sorry

/-- Unit test `rabinCertificateOf_X_sq_add_X_add_one`: for `X² + X + 1` over `𝔽₂` the only prime
divisor of the degree is `2`, and the generated Bézout pair for `X ^ 2 mod f - X = 1` checks. -/
example : (rabinCertificateOf (X ^ 2 + X + 1 : (ZMod 2)[X])).check = true := sorry

/-- Unit test `rabinCertificateOf_reducible_fails`: no certificate checks for the reducible
`X² + 1` over `𝔽₂`. -/
example (c : RabinCertificate (X ^ 2 + 1 : (ZMod 2)[X])) : c.check = false := sorry

/-- Unit test `rabinCertificateOf_linear`: a linear polynomial has no prime divisor of its degree,
so its certificate is empty and checks. -/
example (a : ZMod 3) : (rabinCertificateOf (X + C a)).check = true := sorry

/-! ### FF.3 D. Equal-degree factorization and the Cantor–Zassenhaus algorithm (Shoup §20.4.2–20.4.3)

Randomness model: one round draws a uniform coefficient vector `v : Fin (deg f) → F`, i.e. a
uniform element `a` of `F[X]/(f)`, and uses `a mod h` for every current factor `h`; by the Chinese
remainder theorem the residues are independent and uniform, which is Shoup's model. -/

/-- **The splitting polynomial `M_k`** (Shoup (20.4) and (20.5)): for `q = 2 ^ w` it is
`∑_{j < w k} X ^ (2 ^ j)`, and for odd `q` it is `X ^ ((q ^ k - 1) / 2) - 1`. -/
def edfSplittingPolynomial (F : Type*) [Field F] [Fintype F] (k : ℕ) : F[X] :=
  if ringChar F = 2 then ∑ j ∈ Finset.range (Nat.log 2 (Fintype.card F ^ k)), X ^ 2 ^ j
  else X ^ ((Fintype.card F ^ k - 1) / 2) - 1

theorem edfSplittingPolynomial_of_ringChar_ne_two (hF : ringChar F ≠ 2) (k : ℕ) :
    edfSplittingPolynomial F k = X ^ ((Fintype.card F ^ k - 1) / 2) - 1 := sorry

open Classical in
/-- The number of zeros of `M_k` in a field `E ⊇ F` with `q ^ k` elements: `(q ^ k - 1) / 2` for odd
`q` and `q ^ k / 2` for even `q`. -/
theorem card_aeval_edfSplittingPolynomial_eq_zero (E : Type*) [Field E] [Fintype E] [Algebra F E]
    {k : ℕ} (hk : Module.finrank F E = k) (hk0 : 0 < k) :
    (Finset.univ.filter fun α : E => aeval α (edfSplittingPolynomial F k) = 0).card =
      if ringChar F = 2 then Fintype.card F ^ k / 2 else (Fintype.card F ^ k - 1) / 2 := sorry

theorem aeval_edfSplittingPolynomial_sq_eq_self (E : Type*) [Field E] [Fintype E] [Algebra F E]
    {k : ℕ} (hk : Module.finrank F E = k) (hF : ringChar F = 2) (α : E) :
    aeval α (edfSplittingPolynomial F k) ^ 2 = aeval α (edfSplittingPolynomial F k) := sorry

/-- Unit test `edfSplittingPolynomial_zmod_three_one`: over `𝔽₃`, `M₁ = X - 1`. -/
example : edfSplittingPolynomial (ZMod 3) 1 = X - 1 := sorry

/-- Unit test `edfSplittingPolynomial_zmod_two_two`: over `𝔽₂`, `M₂ = X + X²`, the trace of
`𝔽₄ / 𝔽₂`. -/
example : edfSplittingPolynomial (ZMod 2) 2 = X + X ^ 2 := sorry

/-- Unit test `aeval_edfSplittingPolynomial_eq_quadraticChar`: for odd `q`, `M₁(a) + 1` is Mathlib's
quadratic character of `a ≠ 0`. -/
example (hF : ringChar F ≠ 2) {a : F} (ha : a ≠ 0) :
    aeval a (edfSplittingPolynomial F 1) + 1 = ((quadraticChar F a : ℤ) : F) := sorry

open Classical in
/-- **The gcd with a square-free modulus** (the splitting criterion of Shoup §20.4.2): for monic
square-free `f` and any `g`, `gcd(g mod f, f)` is the product of the irreducible factors of `f`
that divide `g`. -/
theorem gcd_modByMonic_eq_prod_dvd {f : F[X]} (hf : f.Monic) (hsq : Squarefree f) (g : F[X]) :
    gcd (g %ₘ f) f =
      ∏ h ∈ (UniqueFactorizationMonoid.normalizedFactors f).toFinset.filter (· ∣ g), h := sorry

open Classical in
/-- **The pair-separation probability** (Shoup §20.4.2): if `f` is monic square-free with all
irreducible factors of degree `k`, and `f₁ ≠ f₂` are two of them, then for `a` uniform in
`F[X]/(f)` the probability that `M_k(a)` does not separate `f₁` from `f₂` is `1/2` for even `q`
and `(1 + q ^ (-2k)) / 2 ≤ 5/9` for odd `q`. -/
theorem card_not_separated_edf {f f₁ f₂ : F[X]} {k : ℕ} (hf : f.Monic) (hsq : Squarefree f)
    (hdeg : ∀ h ∈ UniqueFactorizationMonoid.normalizedFactors f, h.natDegree = k)
    (h₁ : f₁ ∈ UniqueFactorizationMonoid.normalizedFactors f)
    (h₂ : f₂ ∈ UniqueFactorizationMonoid.normalizedFactors f) (hne : f₁ ≠ f₂) :
    ((Finset.univ.filter fun v : Fin f.natDegree → F =>
        (f₁ ∣ (edfSplittingPolynomial F k).comp ((degreeLTEquiv F f.natDegree).symm v : F[X]) ↔
          f₂ ∣ (edfSplittingPolynomial F k).comp ((degreeLTEquiv F f.natDegree).symm v : F[X]))).card :
        ℚ) / Fintype.card F ^ f.natDegree =
      if ringChar F = 2 then 1 / 2 else (1 + ((Fintype.card F : ℚ) ^ (2 * k))⁻¹) / 2 := sorry

/-- One refinement step of Algorithm EDF with the random residue `a`: every current factor `h` is
replaced by `d` and `h / d` when `d = gcd(M_k(a) mod h, h)` is a proper factor. -/
def edfRefine (k : ℕ) (a : F[X]) (H : Finset F[X]) : Finset F[X] := by
  classical
  exact H.biUnion fun h =>
    let d := gcd ((edfSplittingPolynomial F k).comp a %ₘ h) h
    if d = 1 ∨ d = h then {h} else {d, h / d}

theorem prod_edfRefine {f : F[X]} (hf : f.Monic) (hsq : Squarefree f) (k : ℕ) (a : F[X])
    {H : Finset F[X]} (hH : ∀ h ∈ H, h.Monic) (hprod : H.prod id = f) :
    (edfRefine k a H).prod id = f ∧ ∀ h ∈ edfRefine k a H, h.Monic := sorry

theorem card_edfRefine_le (k : ℕ) (a : F[X]) (H : Finset F[X]) :
    (edfRefine k a H).card ≤ 2 * H.card := sorry

/-- Unit test `edfRefine_X_sq_add_X`: over `𝔽₂`, `M₁ = X` and `gcd(X, X² + X) = X`, so the residue
`X` splits `X² + X`. -/
example : edfRefine 1 (X : (ZMod 2)[X]) {X ^ 2 + X} = {X, X + 1} := sorry

/-- Unit test `edfRefine_empty`: the empty factorization is left alone. -/
example (k : ℕ) (a : F[X]) : edfRefine k a (∅ : Finset F[X]) = ∅ := sorry

/-- **Algorithm EDF run for `n` rounds** (Shoup §20.4.2), as a probability distribution on the
current set of factors. -/
def equalDegreeFactorization (f : F[X]) (k n : ℕ) : PMF (Finset F[X]) :=
  Nat.rec (PMF.pure {f})
    (fun _ μ => μ.bind fun H =>
      (PMF.uniformOfFintype (Fin f.natDegree → F)).map fun v =>
        edfRefine k ((degreeLTEquiv F f.natDegree).symm v : F[X]) H) n

/-- **Las Vegas correctness of EDF** (Shoup §20.4.2): every outcome is a factorization of `f` into
monic factors, and an outcome with `deg f / k` factors is the set of irreducible factors of `f`. -/
theorem equalDegreeFactorization_support {f : F[X]} {k n : ℕ} (hf : f.Monic) (hsq : Squarefree f)
    (hdeg : ∀ h ∈ UniqueFactorizationMonoid.normalizedFactors f, h.natDegree = k)
    {H : Finset F[X]} (hH : H ∈ (equalDegreeFactorization f k n).support) :
    H.prod id = f ∧ (∀ h ∈ H, h.Monic) ∧
      (H.card = f.natDegree / k → H.val = UniqueFactorizationMonoid.normalizedFactors f) := sorry

/-- **Failure probability of EDF**: after `n` rounds the factorization is incomplete with probability
at most `C(r, 2) ρ ^ n`, where `r = deg f / k` and `ρ ≤ 5/9` is the pair-separation failure
probability. -/
theorem equalDegreeFactorization_failure_le {f : F[X]} {k : ℕ} (hf : f.Monic)
    (hsq : Squarefree f)
    (hdeg : ∀ h ∈ UniqueFactorizationMonoid.normalizedFactors f, h.natDegree = k) (n : ℕ) :
    (equalDegreeFactorization f k n).toOuterMeasure {H | H.card < f.natDegree / k} ≤
      ((f.natDegree / k).choose 2 : ENNReal) * (5 / 9 : ENNReal) ^ n := sorry

/-- **Expected number of rounds of EDF, `q` even** (Shoup, proof of Theorem 20.7): `E[L] ≤ 2 log₂ r + 2`. -/
theorem tsum_equalDegreeFactorization_unfinished_le {f : F[X]} {k : ℕ} (hf : f.Monic)
    (hsq : Squarefree f) (hF : ringChar F = 2)
    (hdeg : ∀ h ∈ UniqueFactorizationMonoid.normalizedFactors f, h.natDegree = k) :
    ∑' n, (equalDegreeFactorization f k n).toOuterMeasure {H | H.card < f.natDegree / k} ≤
      ENNReal.ofReal (2 * Real.logb 2 (f.natDegree / k) + 2) := sorry

theorem equalDegreeFactorization_zero (f : F[X]) (k : ℕ) :
    equalDegreeFactorization f k 0 = PMF.pure {f} := sorry

/-- Unit test `equalDegreeFactorization_irreducible`: an irreducible input is never split. -/
example {f : F[X]} (hf : f.Monic) (hirr : Irreducible f) (n : ℕ) :
    equalDegreeFactorization f f.natDegree n = PMF.pure {f} := sorry

/-- Unit test `equalDegreeFactorization_X_sq_add_X`: over `𝔽₂` with `k = 1`, one round splits
`X² + X` exactly when `M₁(a) = a` is not `0` or `1` modulo both factors simultaneously — with
probability `1/2`. -/
example : (equalDegreeFactorization (X ^ 2 + X : (ZMod 2)[X]) 1 1) {X, X + 1} = 1 / 2 := sorry

/-- Unit test `edfRefine_trivial`: a residue `a` with `M_k(a)` divisible by `f` does not split. -/
example {f : F[X]} (k : ℕ) (a : F[X]) (ha : f ∣ (edfSplittingPolynomial F k).comp a) :
    edfRefine k a {f} = {f} := sorry

/-- Unit test `equalDegreeFactorization_card_le`: every outcome has at most `deg f / k` elements. -/
example {f : F[X]} {k n : ℕ} (hf : f.Monic) (hsq : Squarefree f)
    (hdeg : ∀ h ∈ UniqueFactorizationMonoid.normalizedFactors f, h.natDegree = k)
    {H : Finset F[X]} (hH : H ∈ (equalDegreeFactorization f k n).support) :
    H.card ≤ f.natDegree / k := sorry

/-- **The Cantor–Zassenhaus algorithm** (Shoup §20.4): Algorithm SFD, then Algorithm DDF on each
square-free part, then `n` rounds of EDF on each block. The outcome is the multiset of irreducible
factors with multiplicity, or `none` when some block is unfinished. -/
def cantorZassenhaus (f : F[X]) (n : ℕ) : PMF (Option (Multiset F[X])) := sorry

/-- **Las Vegas correctness of Cantor–Zassenhaus**: a completed outcome is Mathlib's factorization. -/
theorem cantorZassenhaus_support {f : F[X]} (hf : f.Monic) {n : ℕ} {m : Multiset F[X]}
    (hm : some m ∈ (cantorZassenhaus f n).support) :
    m = UniqueFactorizationMonoid.normalizedFactors f := sorry

/-- **Failure probability of Cantor–Zassenhaus**: at most `(deg f) ^ 2 (5/9) ^ n`. -/
theorem cantorZassenhaus_none_le {f : F[X]} (hf : f.Monic) (n : ℕ) :
    cantorZassenhaus f n none ≤ (f.natDegree ^ 2 : ENNReal) * (5 / 9 : ENNReal) ^ n := sorry

theorem cantorZassenhaus_zero_of_irreducible {f : F[X]} (hf : f.Monic) (hirr : Irreducible f) :
    cantorZassenhaus f 0 = PMF.pure (some {f}) := sorry

/-- Unit test `cantorZassenhaus_one`: the constant `1` has the empty factorization. -/
example (n : ℕ) : cantorZassenhaus (1 : F[X]) n = PMF.pure (some 0) := sorry

/-- Unit test `cantorZassenhaus_X_sq_mul_X_add_one`: over `𝔽₂` the blocks of `X² (X + 1)` are
linear and single, so the algorithm finishes at once. -/
example (n : ℕ) : cantorZassenhaus (X ^ 2 * (X + 1) : (ZMod 2)[X]) n =
    PMF.pure (some {X, X, X + 1}) := sorry

/-- Unit test `cantorZassenhaus_not_product_only`: the outcome for `X² + X` over `𝔽₂` is never the
unsplit `{X² + X}`. -/
example (n : ℕ) : some {X ^ 2 + X} ∉ (cantorZassenhaus (X ^ 2 + X : (ZMod 2)[X]) n).support := sorry

/-! ### FF.3 E. Berlekamp's algorithm (Shoup §20.5) -/

/-- **The Berlekamp subalgebra** `B = {α ∈ F[X]/(f) : α ^ q = α}` (Shoup §20.5): the equalizer of the
`q`-power Frobenius `F`-algebra endomorphism of `F[X]/(f)` and the identity. -/
def berlekampSubalgebra (f : F[X]) : Subalgebra F (AdjoinRoot f) :=
  AlgHom.equalizer (FiniteField.frobeniusAlgHom F (AdjoinRoot f)) (AlgHom.id F (AdjoinRoot f))

theorem mem_berlekampSubalgebra {f : F[X]} {α : AdjoinRoot f} :
    α ∈ berlekampSubalgebra f ↔ α ^ Fintype.card F = α := sorry

theorem algebraMap_mem_berlekampSubalgebra (f : F[X]) (c : F) :
    algebraMap F (AdjoinRoot f) c ∈ berlekampSubalgebra f := sorry

/-- **Berlekamp's theorem** (Shoup §20.5): for monic square-free `f` with `r` irreducible factors,
the Chinese remainder isomorphism identifies `B` with `F ^ r`; in particular `dim_F B = r`. -/
theorem finrank_berlekampSubalgebra {f : F[X]} (hf : f.Monic) (hsq : Squarefree f) :
    Module.finrank F (berlekampSubalgebra f) =
      (UniqueFactorizationMonoid.normalizedFactors f).card := sorry

/-- **Berlekamp's irreducibility criterion** (Shoup, Exercise 20.12): a monic square-free
nonconstant `f` is irreducible exactly when `B = F`. -/
theorem irreducible_iff_finrank_berlekampSubalgebra_eq_one {f : F[X]} (hf : f.Monic)
    (hsq : Squarefree f) (hdeg : 0 < f.natDegree) :
    Irreducible f ↔ Module.finrank F (berlekampSubalgebra f) = 1 := sorry

/-- Unit test `finrank_berlekampSubalgebra_X_sq_add_X`: over `𝔽₂`, `X² + X = X (X + 1)` has a
two-dimensional Berlekamp subalgebra. -/
example : Module.finrank (ZMod 2) (berlekampSubalgebra (X ^ 2 + X : (ZMod 2)[X])) = 2 := sorry

/-- Unit test `berlekampSubalgebra_eq_bot_of_irreducible`: for irreducible `f`, `B` is the image of
`F`. -/
example {f : F[X]} (hirr : Irreducible f) : berlekampSubalgebra f = ⊥ := sorry

/-- Unit test `finrank_berlekampSubalgebra_X_sq`: square-freeness is needed; over `𝔽₂`, `X²` has two
factors counted with multiplicity but `B = 𝔽₂`. -/
example : Module.finrank (ZMod 2) (berlekampSubalgebra (X ^ 2 : (ZMod 2)[X])) = 1 := sorry

/-- **The Berlekamp matrix** (Shoup, Algorithm B1): row `i` is the coefficient vector of
`X ^ (q i) mod f` minus the `i`-th unit vector, so that its row null space is `B` in the basis
`1, X, …, X ^ (ℓ - 1)`. -/
def berlekampMatrix (f : F[X]) : Matrix (Fin f.natDegree) (Fin f.natDegree) F :=
  fun i j => ((X ^ (Fintype.card F * (i : ℕ))) %ₘ f).coeff j - if i = j then 1 else 0

theorem rank_berlekampMatrix {f : F[X]} (hf : f.Monic) (hsq : Squarefree f) :
    (berlekampMatrix f).rank =
      f.natDegree - (UniqueFactorizationMonoid.normalizedFactors f).card := sorry

theorem vecMul_berlekampMatrix_eq_zero_iff {f : F[X]} (hf : f.Monic) (v : Fin f.natDegree → F) :
    Matrix.vecMul v (berlekampMatrix f) = 0 ↔
      AdjoinRoot.mk f ((degreeLTEquiv F f.natDegree).symm v : F[X]) ∈ berlekampSubalgebra f := sorry

theorem berlekampMatrix_apply (f : F[X]) (i j : Fin f.natDegree) :
    berlekampMatrix f i j =
      ((X ^ (Fintype.card F * (i : ℕ))) %ₘ f).coeff j - if i = j then 1 else 0 := sorry

/-- Unit test `berlekampMatrix_X_sq_add_X`: over `𝔽₂`, `Q = 0` for `X² + X`. -/
example : berlekampMatrix (X ^ 2 + X : (ZMod 2)[X]) = 0 := sorry

/-- Unit test `rank_berlekampMatrix_X_sq_add_X_add_one`: over `𝔽₂`, the matrix of the irreducible
`X² + X + 1` has rank `1`, so `B` is one-dimensional. -/
example : (berlekampMatrix (X ^ 2 + X + 1 : (ZMod 2)[X])).rank = 1 := sorry

/-- Unit test `rank_berlekampMatrix_X_sq`: without square-freeness the rank formula fails: `X²` over
`𝔽₂` gives rank `1`, not `2 - 2`. -/
example : (berlekampMatrix (X ^ 2 : (ZMod 2)[X])).rank = 1 := sorry

/-- **Algorithm B2 run for `n` rounds** (Shoup §20.5): given a basis `β` of `B`, each round draws
`c : ι → F` uniformly and refines every current factor `h` by `gcd(M₁(∑ cᵢ βᵢ) mod h, h)`. -/
def berlekampSplit {f : F[X]} (hf : f.Monic) {ι : Type*} [Fintype ι] [DecidableEq ι]
    (β : Module.Basis ι F (berlekampSubalgebra f)) (n : ℕ) : PMF (Finset F[X]) :=
  Nat.rec (PMF.pure {f})
    (fun _ μ => μ.bind fun H =>
      (PMF.uniformOfFintype (ι → F)).map fun c =>
        edfRefine 1 (AdjoinRoot.modByMonicHom hf ((∑ i, c i • β i : berlekampSubalgebra f) :
          AdjoinRoot f)) H) n

/-- **Las Vegas correctness of Algorithm B2**: every outcome multiplies to `f`, and an outcome with
`r` factors is the set of irreducible factors. -/
theorem berlekampSplit_support {f : F[X]} (hf : f.Monic) (hsq : Squarefree f) {ι : Type*}
    [Fintype ι] [DecidableEq ι] (β : Module.Basis ι F (berlekampSubalgebra f)) {n : ℕ}
    {H : Finset F[X]} (hH : H ∈ (berlekampSplit hf β n).support) :
    H.prod id = f ∧ (H.card = Fintype.card ι → H.val = UniqueFactorizationMonoid.normalizedFactors f) :=
  sorry

/-- **Failure probability of Algorithm B2** (Shoup §20.5: a pair is separated with probability at
least `1/2` for even `q` and at least `4/9` for odd `q`). -/
theorem berlekampSplit_failure_le {f : F[X]} (hf : f.Monic) (hsq : Squarefree f) {ι : Type*}
    [Fintype ι] [DecidableEq ι] (β : Module.Basis ι F (berlekampSubalgebra f)) (n : ℕ) :
    (berlekampSplit hf β n).toOuterMeasure {H | H.card < Fintype.card ι} ≤
      ((Fintype.card ι).choose 2 : ENNReal) * (5 / 9 : ENNReal) ^ n := sorry

theorem berlekampSplit_zero {f : F[X]} (hf : f.Monic) {ι : Type*} [Fintype ι] [DecidableEq ι]
    (β : Module.Basis ι F (berlekampSubalgebra f)) : berlekampSplit hf β 0 = PMF.pure {f} := sorry

/-- Unit test `berlekampSplit_irreducible`: with a one-element basis nothing is ever split. -/
example {f : F[X]} (hf : f.Monic) (hirr : Irreducible f)
    (β : Module.Basis (Fin 1) F (berlekampSubalgebra f)) (n : ℕ) :
    berlekampSplit hf β n = PMF.pure {f} := sorry

/-- Unit test `berlekampSplit_support_card_le`: the number of factors never exceeds `dim B`. -/
example {f : F[X]} (hf : f.Monic) (hsq : Squarefree f) {ι : Type*} [Fintype ι] [DecidableEq ι]
    (β : Module.Basis ι F (berlekampSubalgebra f)) (n : ℕ) (H : Finset F[X])
    (hH : H ∈ (berlekampSplit hf β n).support) : H.card ≤ Fintype.card ι := sorry

/-- Unit test `berlekampSplit_X_sq_add_X`: over `𝔽₂` (`M₁ = X`), one round with the basis
`{1, X}` of `B = 𝔽₂[X]/(X² + X)` splits with probability `1/2`. -/
example (hf : (X ^ 2 + X : (ZMod 2)[X]).Monic)
    (β : Module.Basis (Fin 2) (ZMod 2) (berlekampSubalgebra (X ^ 2 + X : (ZMod 2)[X]))) :
    berlekampSplit hf β 1 {X, X + 1} = 1 / 2 := sorry

/-- **Berlekamp's factoring algorithm** (Shoup, Algorithms B1 and B2, after Algorithm SFD): the
outcome is the multiset of irreducible factors with multiplicity, or `none` if some square-free
part is unfinished after `n` rounds. -/
def berlekampFactor (f : F[X]) (n : ℕ) : PMF (Option (Multiset F[X])) := sorry

/-- **Las Vegas correctness of Berlekamp's algorithm.** -/
theorem berlekampFactor_support {f : F[X]} (hf : f.Monic) {n : ℕ} {m : Multiset F[X]}
    (hm : some m ∈ (berlekampFactor f n).support) :
    m = UniqueFactorizationMonoid.normalizedFactors f := sorry

theorem berlekampFactor_none_le {f : F[X]} (hf : f.Monic) (n : ℕ) :
    berlekampFactor f n none ≤ (f.natDegree ^ 2 : ENNReal) * (5 / 9 : ENNReal) ^ n := sorry

theorem berlekampFactor_of_irreducible {f : F[X]} (hf : f.Monic) (hirr : Irreducible f)
    (n : ℕ) : berlekampFactor f n = PMF.pure (some {f}) := sorry

/-- Unit test `berlekampFactor_one`: the constant `1` has the empty factorization. -/
example (n : ℕ) : berlekampFactor (1 : F[X]) n = PMF.pure (some 0) := sorry

/-- Unit test `berlekampFactor_X_pow_five_sub_X_sub_one_zmod_two`: every completed outcome for
`X⁵ - X - 1` over `𝔽₂` is `{X² + X + 1, X³ + X² + 1}`. -/
example (n : ℕ) (m : Multiset (ZMod 2)[X])
    (hm : some m ∈ (berlekampFactor (X ^ 5 - X - 1 : (ZMod 2)[X]) n).support) :
    m = {X ^ 2 + X + 1, X ^ 3 + X ^ 2 + 1} := sorry

/-- Unit test `berlekampFactor_agrees_cantorZassenhaus`: the completed outcomes of the two
algorithms coincide. -/
example {f : F[X]} (hf : f.Monic) {n : ℕ} {m m' : Multiset F[X]}
    (hm : some m ∈ (berlekampFactor f n).support)
    (hm' : some m' ∈ (cantorZassenhaus f n).support) : m = m' := sorry

/-! ### FF.3 F. Constructing irreducible polynomials (Shoup §20.1, Algorithm RIP) -/

/-- **Algorithm RIP run for `n` attempts**: draw a uniform monic polynomial of degree `ℓ`, test it
with Algorithm IPT, and return the first success, or `none`. -/
def randomIrreducible (F : Type*) [Field F] [Fintype F] [DecidableEq F] (ℓ n : ℕ) :
    PMF (Option F[X]) :=
  Nat.rec (PMF.pure none)
    (fun _ μ => (PMF.uniformOfFintype (Fin ℓ → F)).bind fun v =>
      let f : F[X] := X ^ ℓ + ((degreeLTEquiv F ℓ).symm v : F[X])
      if irreducibilityTest f then PMF.pure (some f) else μ) n

/-- **Las Vegas correctness and output law of Algorithm RIP** (Shoup, Theorem 20.2, output part):
every returned polynomial is monic irreducible of degree `ℓ`, and all of them are equally
likely. -/
theorem randomIrreducible_apply_some {ℓ : ℕ} (hℓ : ℓ ≠ 0) (n : ℕ) {f : F[X]} :
    randomIrreducible F ℓ n (some f) =
      if f ∈ monicIrreducibles F ℓ then
        (1 - (1 - (irreducibleCount F ℓ : ENNReal) / Fintype.card F ^ ℓ) ^ n) /
          irreducibleCount F ℓ
      else 0 := sorry

/-- **The number of attempts of Algorithm RIP is geometric** with success probability
`Π_F(ℓ) / q ^ ℓ ≥ 1 / (2ℓ)`. -/
theorem randomIrreducible_none {ℓ : ℕ} (hℓ : ℓ ≠ 0) (n : ℕ) :
    randomIrreducible F ℓ n none =
      (1 - (irreducibleCount F ℓ : ENNReal) / Fintype.card F ^ ℓ) ^ n := sorry

theorem tsum_randomIrreducible_none_le {ℓ : ℕ} (hℓ : ℓ ≠ 0) :
    ∑' n, randomIrreducible F ℓ n none ≤ 2 * ℓ := sorry

/-- Unit test `randomIrreducible_zero`: with no attempts nothing is returned. -/
example (ℓ : ℕ) : randomIrreducible F ℓ 0 = PMF.pure none := sorry

/-- Unit test `randomIrreducible_one_one`: over `𝔽₂`, every monic linear polynomial is
irreducible, so one attempt succeeds and each of `X`, `X + 1` has probability `1/2`. -/
example : randomIrreducible (ZMod 2) 1 1 (some X) = 1 / 2 := sorry

/-- Unit test `randomIrreducible_two_one`: over `𝔽₂`, one attempt at degree `2` returns
`X² + X + 1` with probability `1/4` and fails with probability `3/4`. -/
example : randomIrreducible (ZMod 2) 2 1 none = 3 / 4 := sorry

/-! ### FF.3 G. Certified factorizations -/

/-- **A factorization certificate**: a leading coefficient and a list of triples
`(gᵢ, eᵢ, cᵢ)` with `cᵢ` a Rabin certificate (FF.0's `RabinCertificate gᵢ`) for `gᵢ`. -/
structure FactorizationCertificate (F : Type*) [Field F] where
  leadingCoeff : F
  factors : List (Σ g : F[X], ℕ × RabinCertificate g)

/-- The checker: the product identity `c ∏ gᵢ ^ eᵢ = f`, positive exponents, pairwise distinct
`gᵢ`, and each Rabin certificate checks. -/
def FactorizationCertificate.check (c : FactorizationCertificate F) (f : F[X]) : Bool := by
  classical
  exact decide (C c.leadingCoeff * (c.factors.map fun t => t.1 ^ t.2.1).prod = f) &&
    decide (∀ t ∈ c.factors, 0 < t.2.1) && decide (c.factors.map Sigma.fst).Nodup &&
    c.factors.all fun t => t.2.2.check

/-- **Soundness**: a checked certificate is the factorization of `f`. -/
theorem FactorizationCertificate.check_sound {c : FactorizationCertificate F} {f : F[X]}
    (h : c.check f = true) :
    c.leadingCoeff = f.leadingCoeff ∧
      (c.factors.map fun t => Multiset.replicate t.2.1 t.1).sum =
        UniqueFactorizationMonoid.normalizedFactors f := sorry

/-- **Completeness**: every nonzero `f` has a checking certificate. -/
theorem FactorizationCertificate.exists_check {f : F[X]} (hf : f ≠ 0) :
    ∃ c : FactorizationCertificate F, c.check f = true := sorry

theorem FactorizationCertificate.check_eq_true_iff_perm {c c' : FactorizationCertificate F}
    {f : F[X]} (h : c.check f = true) (h' : c'.check f = true) :
    (c.factors.map fun t => (t.1, t.2.1)).Perm (c'.factors.map fun t => (t.1, t.2.1)) := sorry

/-- Unit test `factorizationCertificate_X_sq_add_X`: `X² + X = X (X + 1)` over `𝔽₂` with the
generated Rabin certificates checks. -/
example : (FactorizationCertificate.mk (1 : ZMod 2)
    [⟨X, 1, rabinCertificateOf X⟩, ⟨X + 1, 1, rabinCertificateOf (X + 1)⟩]).check (X ^ 2 + X) =
      true := sorry

/-- Unit test `factorizationCertificate_product_only_fails`: a product identity alone is not a
certificate — `[(X² + X, 1, w)]` never checks, whatever `w` is. -/
example (w : RabinCertificate (X ^ 2 + X : (ZMod 2)[X])) :
    (FactorizationCertificate.mk (1 : ZMod 2) [⟨X ^ 2 + X, 1, w⟩]).check (X ^ 2 + X) = false :=
  sorry

/-- Unit test `factorizationCertificate_constant`: a nonzero constant has the empty certificate. -/
example : (FactorizationCertificate.mk (3 : ZMod 5) []).check (C 3) = true := sorry

/-- **Certified factorization by Cantor–Zassenhaus**: the distribution of certificates obtained by
running `cantorZassenhaus` and generating a Rabin certificate for each factor. -/
def certifiedFactorization (f : F[X]) (n : ℕ) : PMF (Option (FactorizationCertificate F)) := sorry

theorem certifiedFactorization_support {f : F[X]} (hf : f ≠ 0) {n : ℕ}
    {c : FactorizationCertificate F} (hc : some c ∈ (certifiedFactorization f n).support) :
    c.check f = true := sorry

theorem certifiedFactorization_none_le {f : F[X]} (hf : f ≠ 0) (n : ℕ) :
    certifiedFactorization f n none ≤ (f.natDegree ^ 2 : ENNReal) * (5 / 9 : ENNReal) ^ n := sorry

theorem certifiedFactorization_constant {c : F} (hc : c ≠ 0) (n : ℕ) :
    certifiedFactorization (C c) n = PMF.pure (some ⟨c, []⟩) := sorry

/-- Unit test `certifiedFactorization_X_sq_add_X_check`: every certificate produced for `X² + X`
over `𝔽₂` checks. -/
example (n : ℕ) (c : FactorizationCertificate (ZMod 2))
    (hc : some c ∈ (certifiedFactorization (X ^ 2 + X : (ZMod 2)[X]) n).support) :
    c.check (X ^ 2 + X) = true := sorry

/-- Unit test `certifiedFactorization_factors_X_sq_add_X`: its factor list is `X`, `X + 1` in some
order. -/
example (n : ℕ) (c : FactorizationCertificate (ZMod 2))
    (hc : some c ∈ (certifiedFactorization (X ^ 2 + X : (ZMod 2)[X]) n).support) :
    (c.factors.map fun t => (t.1, t.2.1)).Perm [(X, 1), (X + 1, 1)] := sorry

/-- Unit test `certifiedFactorization_irreducible`: an irreducible input yields a one-factor
certificate at once. -/
example : certifiedFactorization (X ^ 2 + X + 1 : (ZMod 2)[X]) 0 =
    PMF.pure (some ⟨1, [⟨X ^ 2 + X + 1, 1, rabinCertificateOf (X ^ 2 + X + 1)⟩]⟩) := sorry

/-! ### FF.3 H. Hensel lifting of coprime factorizations (Milne, *Algebraic Number Theory*,
Theorem 7.33, Lemmas 7.34–7.35, Remark 7.36)

`I` is an ideal of a commutative ring `R`; "`g ≡ h mod I`" for polynomials is membership of `g - h`
in `Ideal.map C I`, the polynomials with all coefficients in `I`. -/

section Hensel

variable {R : Type*} [CommRing R] (I : Ideal R)

/-- **Strict coprimality lifts** (Milne, Lemma 7.34, for an ideal inside the Jacobson radical): if
`g` is monic and the reductions of `g` and `h` are coprime in `(R ⧸ I)[X]`, then `g` and `h` are
coprime in `R[X]`, with Bézout coefficients `u g + v h = 1`, `deg v < deg g`. -/
theorem exists_bezout_of_isCoprime_map (hI : I ≤ (⊥ : Ideal R).jacobson) {g h : R[X]}
    (hg : g.Monic)
    (hcop : IsCoprime (g.map (Ideal.Quotient.mk I)) (h.map (Ideal.Quotient.mk I))) :
    ∃ u v : R[X], u * g + v * h = 1 ∧ v.natDegree < g.natDegree := sorry

/-- **Uniqueness of monic lifts** (Milne, Lemma 7.35): two factorizations `g h = g' h'` into monic
polynomials with the same coprime reductions coincide. -/
theorem eq_of_monic_mul_eq_of_map_eq (hI : I ≤ (⊥ : Ideal R).jacobson) {g h g' h' : R[X]}
    (hg : g.Monic) (hh : h.Monic) (hg' : g'.Monic) (hh' : h'.Monic) (hmul : g * h = g' * h')
    (hgg : g.map (Ideal.Quotient.mk I) = g'.map (Ideal.Quotient.mk I))
    (hhh : h.map (Ideal.Quotient.mk I) = h'.map (Ideal.Quotient.mk I))
    (hcop : IsCoprime (g.map (Ideal.Quotient.mk I)) (h.map (Ideal.Quotient.mk I))) :
    g = g' ∧ h = h' := sorry

/-- **One linear Hensel step** (Milne, proof of Theorem 7.33, existence): from `f ≡ g h mod I ^ m`
and `s g + t h ≡ 1 mod I`, with `g` monic, the corrections `δg = (t e) mod g` and
`δh = s e + ((t e) div g) h`, `e = f - g h`, give `f ≡ (g + δg)(h + δh) mod I ^ (m + 1)`. -/
theorem hensel_step {m : ℕ} (hm : 1 ≤ m) {f g h s t : R[X]} (hg : g.Monic)
    (hfgh : f - g * h ∈ Ideal.map C (I ^ m)) (hst : s * g + t * h - 1 ∈ Ideal.map C I) :
    ∃ g' h' : R[X], g'.Monic ∧ g'.natDegree = g.natDegree ∧ g' - g ∈ Ideal.map C (I ^ m) ∧
      h' - h ∈ Ideal.map C (I ^ m) ∧ f - g' * h' ∈ Ideal.map C (I ^ (m + 1)) := sorry

/-- **Hensel lifting of a coprime factorization modulo `I ^ k`** (Milne, Theorem 7.33, existence,
at every finite level). -/
theorem hensel_lifting_of_factorizations {f g₀ h₀ : R[X]} (hf : f.Monic) (hg₀ : g₀.Monic)
    (hh₀ : h₀.Monic) (hfac : f - g₀ * h₀ ∈ Ideal.map C I)
    (hcop : IsCoprime (g₀.map (Ideal.Quotient.mk I)) (h₀.map (Ideal.Quotient.mk I)))
    {k : ℕ} (hk : 1 ≤ k) :
    ∃ g h : R[X], g.Monic ∧ h.Monic ∧ g.natDegree = g₀.natDegree ∧ g - g₀ ∈ Ideal.map C I ∧
      h - h₀ ∈ Ideal.map C I ∧ f - g * h ∈ Ideal.map C (I ^ k) := sorry

/-- **Uniqueness modulo `I ^ k`**: in `(R ⧸ I ^ k)[X]` the monic lift is unique. -/
theorem hensel_lifting_unique_mod_pow {k : ℕ} (hk : 1 ≤ k) {g h g' h' : (R ⧸ I ^ k)[X]}
    (hg : g.Monic) (hh : h.Monic) (hg' : g'.Monic) (hh' : h'.Monic) (hmul : g * h = g' * h')
    (hgg : g.map (Ideal.Quotient.factor (Ideal.pow_le_self (by omega))) =
      g'.map (Ideal.Quotient.factor (Ideal.pow_le_self (by omega))))
    (hhh : h.map (Ideal.Quotient.factor (Ideal.pow_le_self (by omega))) =
      h'.map (Ideal.Quotient.factor (Ideal.pow_le_self (by omega))))
    (hcop : IsCoprime (g.map (Ideal.Quotient.factor (Ideal.pow_le_self (by omega))))
      (h.map (Ideal.Quotient.factor (Ideal.pow_le_self (by omega) : I ^ k ≤ I)))) :
    g = g' ∧ h = h' := sorry

/-- **Hensel lifting over an `I`-adically complete ring** (Milne, Theorem 7.33; `ℤ_p`,
`𝔽_q⟦t⟧`): a monic `f` whose reduction is a product of coprime monic polynomials factors uniquely
as a product of monic lifts. -/
theorem hensel_lifting_of_isAdicComplete [IsAdicComplete I R] {f : R[X]} (hf : f.Monic)
    {g₀ h₀ : (R ⧸ I)[X]} (hg₀ : g₀.Monic) (hh₀ : h₀.Monic)
    (hfac : f.map (Ideal.Quotient.mk I) = g₀ * h₀) (hcop : IsCoprime g₀ h₀) :
    ∃! gh : R[X] × R[X], gh.1.Monic ∧ gh.2.Monic ∧ gh.1.map (Ideal.Quotient.mk I) = g₀ ∧
      gh.2.map (Ideal.Quotient.mk I) = h₀ ∧ f = gh.1 * gh.2 := sorry

/-- **Several coprime factors** (Milne, Remark 7.36): a factorization of the reduction into
pairwise coprime monic polynomials lifts modulo `I ^ k`. -/
theorem hensel_lifting_multifactor {f : R[X]} (hf : f.Monic) {ι : Type*} [Fintype ι]
    {g₀ : ι → R[X]} (hg₀ : ∀ i, (g₀ i).Monic)
    (hfac : f - ∏ i, g₀ i ∈ Ideal.map C I)
    (hcop : Pairwise fun i j =>
      IsCoprime ((g₀ i).map (Ideal.Quotient.mk I)) ((g₀ j).map (Ideal.Quotient.mk I)))
    {k : ℕ} (hk : 1 ≤ k) :
    ∃ g : ι → R[X], (∀ i, (g i).Monic ∧ g i - g₀ i ∈ Ideal.map C I) ∧
      f - ∏ i, g i ∈ Ideal.map C (I ^ k) := sorry

end Hensel

/-- **Hensel lifting modulo `p ^ k`**, the form factoring algorithms over `ℤ` use: a factorization
of `f mod p` into coprime monic polynomials lifts to a unique factorization into monic polynomials
over `ℤ/p^kℤ`. -/
theorem hensel_lifting_zmod_prime_pow (p : ℕ) [Fact p.Prime] {k : ℕ} (hk : 1 ≤ k) {f : ℤ[X]}
    (hf : f.Monic) {g₀ h₀ : (ZMod p)[X]} (hg₀ : g₀.Monic) (hh₀ : h₀.Monic)
    (hfac : f.map (Int.castRingHom (ZMod p)) = g₀ * h₀) (hcop : IsCoprime g₀ h₀) :
    ∃! gh : (ZMod (p ^ k))[X] × (ZMod (p ^ k))[X], gh.1.Monic ∧ gh.2.Monic ∧
      gh.1.map (ZMod.castHom (dvd_pow_self p (by omega)) (ZMod p)) = g₀ ∧
      gh.2.map (ZMod.castHom (dvd_pow_self p (by omega)) (ZMod p)) = h₀ ∧
      f.map (Int.castRingHom (ZMod (p ^ k))) = gh.1 * gh.2 := sorry

/-- **The linear Hensel lifting algorithm**: starting from `(g₀, h₀)` and Bézout coefficients
`(s, t)` modulo `I`, the `m`-th iterate of the step of `hensel_step` (with the explicit corrections
`δg = (t e) mod g`, `δh = s e + ((t e) div g) h`). -/
def henselLift {R : Type*} [CommRing R] (f g₀ h₀ s t : R[X]) : ℕ → R[X] × R[X]
  | 0 => (g₀, h₀)
  | m + 1 =>
    let gh := henselLift f g₀ h₀ s t m
    let e := f - gh.1 * gh.2
    (gh.1 + (t * e) %ₘ gh.1, gh.2 + s * e + ((t * e) /ₘ gh.1) * gh.2)

theorem henselLift_zero {R : Type*} [CommRing R] (f g₀ h₀ s t : R[X]) :
    henselLift f g₀ h₀ s t 0 = (g₀, h₀) := sorry

theorem henselLift_spec {R : Type*} [CommRing R] (I : Ideal R) {f g₀ h₀ s t : R[X]}
    (hg₀ : g₀.Monic) (hfac : f - g₀ * h₀ ∈ Ideal.map C I)
    (hst : s * g₀ + t * h₀ - 1 ∈ Ideal.map C I) (m : ℕ) :
    (henselLift f g₀ h₀ s t m).1.Monic ∧
      (henselLift f g₀ h₀ s t m).1.natDegree = g₀.natDegree ∧
      (henselLift f g₀ h₀ s t m).1 - g₀ ∈ Ideal.map C I ∧
      (henselLift f g₀ h₀ s t m).2 - h₀ ∈ Ideal.map C I ∧
      f - (henselLift f g₀ h₀ s t m).1 * (henselLift f g₀ h₀ s t m).2 ∈
        Ideal.map C (I ^ (m + 1)) := sorry

theorem henselLift_divByMonic {R : Type*} [CommRing R] (I : Ideal R) {f g₀ h₀ s t : R[X]}
    (hf : f.Monic) (hg₀ : g₀.Monic) (hfac : f - g₀ * h₀ ∈ Ideal.map C I)
    (hst : s * g₀ + t * h₀ - 1 ∈ Ideal.map C I) (m : ℕ) :
    (f /ₘ (henselLift f g₀ h₀ s t m).1).Monic ∧
      f - (henselLift f g₀ h₀ s t m).1 * (f /ₘ (henselLift f g₀ h₀ s t m).1) ∈
        Ideal.map C (I ^ (m + 1)) := sorry

theorem henselLift_succ_sub_mem {R : Type*} [CommRing R] (I : Ideal R) {f g₀ h₀ s t : R[X]}
    (hg₀ : g₀.Monic) (hfac : f - g₀ * h₀ ∈ Ideal.map C I)
    (hst : s * g₀ + t * h₀ - 1 ∈ Ideal.map C I) (m : ℕ) :
    (henselLift f g₀ h₀ s t (m + 1)).1 - (henselLift f g₀ h₀ s t m).1 ∈
      Ideal.map C (I ^ (m + 1)) := sorry

/-- Unit test `hensel_lift_X_sq_add_one_mod_twenty_five`: over `ℤ/25`, `X² + 1 = (X - 7)(X + 7)`,
lifting `X² + 1 ≡ (X - 2)(X + 2) mod 5`. -/
example : (X ^ 2 + 1 : (ZMod 25)[X]) = (X - 7) * (X + 7) := sorry

/-- Unit test `hensel_lift_unique_X_sq_add_one`: the monic lift of `X - 2` is forced to be `X - 7`
modulo `25` (uniqueness). -/
example (g h : (ZMod 25)[X]) (hg : g.Monic) (hh : h.Monic) (hgh : g * h = X ^ 2 + 1)
    (hg₀ : g.map (ZMod.castHom (by norm_num : 5 ∣ 25) (ZMod 5)) = X - 2)
    (hh₀ : h.map (ZMod.castHom (by norm_num : 5 ∣ 25) (ZMod 5)) = X + 2) :
    g = X - 7 := sorry

/-- Unit test `henselLift_one_mod_twenty_five`: with `s = 1`, `t = -1` (so that
`s (X - 2) + t (X + 2) = -4 ≡ 1 mod 5`), one step of the algorithm on `X² + 1`, `X - 2`, `X + 2`
over `ℤ` gives a first factor congruent to `X - 7` modulo `25`. -/
example : (henselLift (X ^ 2 + 1 : ℤ[X]) (X - 2) (X + 2) (C 1) (C (-1)) 1).1 - (X - 7) ∈
    Ideal.map C (Ideal.span {(25 : ℤ)}) := sorry

/-- Unit test `not_unique_lift_of_not_coprime`: without coprimality uniqueness fails: over `ℤ/8`,
`X² + 4 = (X - 2)(X - 6)` and both factors reduce to `X` modulo `2`. -/
example : (X ^ 2 + 4 : (ZMod 8)[X]) = (X - 2) * (X - 6) ∧
    (X - 2 : (ZMod 8)[X]) ≠ X - 6 := sorry

/-! ### FF.3 I. Certified point counting (Sutherland, 18.783 Lectures 7–8; Schoof 1995 §5)

Convention: the count is Tau Ceti's `WeierstrassCurve.pointCount` — all affine solutions of the
Weierstrass equation, singular or not, plus the point at infinity — and the trace is
`a_q = q + 1 - pointCount W` (Tau Ceti's `frobeniusTrace`). -/

section PointCount

variable (W : WeierstrassCurve F)

/-- **Naive point count by enumeration**: the number of `(x, y) ∈ F × F` satisfying the Weierstrass
equation, plus one for the point at infinity. -/
def naivePointCount : ℕ := by
  classical
  exact (Finset.univ.filter fun p : F × F => W.toAffine.Equation p.1 p.2).card + 1

/-- Agreement with the definition of Tau Ceti's `WeierstrassCurve.pointCount` (`pointCount_def`). -/
theorem naivePointCount_eq_natCard :
    naivePointCount W = Nat.card {p : F × F // W.toAffine.Equation p.1 p.2} + 1 := sorry

theorem naivePointCount_eq_card_point [W.IsElliptic] :
    naivePointCount W = Nat.card W.toAffine.Point := sorry

theorem naivePointCount_variableChange (C : WeierstrassCurve.VariableChange F) :
    naivePointCount (C • W) = naivePointCount W := sorry

/-- Unit test `naivePointCount_x_cubed_add_x_zmod_three`: `y² = x³ + x` over `𝔽₃` has `4` points. -/
example : naivePointCount (⟨0, 0, 0, 1, 0⟩ : WeierstrassCurve (ZMod 3)) = 4 := sorry

/-- Unit test `naivePointCount_cusp_zmod_five`: the cusp `y² = x³` over `𝔽₅` has `q + 1 = 6` points,
its singular point included. -/
example : naivePointCount (⟨0, 0, 0, 0, 0⟩ : WeierstrassCurve (ZMod 5)) = 6 := sorry

/-- Unit test `naivePointCount_cusp_ne_card_point`: on the cusp the count differs from Mathlib's
nonsingular point type by the singular point. -/
example : naivePointCount (⟨0, 0, 0, 0, 0⟩ : WeierstrassCurve (ZMod 5)) =
    Nat.card (⟨0, 0, 0, 0, 0⟩ : WeierstrassCurve (ZMod 5)).toAffine.Point + 1 := sorry

/-- Unit test `naivePointCount_x_cubed_add_x_add_one_zmod_five`: `y² = x³ + x + 1` over `𝔽₅` has
`9` points. -/
example : naivePointCount (⟨0, 0, 0, 1, 1⟩ : WeierstrassCurve (ZMod 5)) = 9 := sorry

/-- **The cubic `x³ + a₂ x² + a₄ x + a₆`** of a model `y² = f(x)` in characteristic-not-two normal
form (`a₁ = a₃ = 0`). -/
def weierstrassCubic : F[X] := X ^ 3 + C W.a₂ * X ^ 2 + C W.a₄ * X + C W.a₆

theorem four_mul_weierstrassCubic [W.IsCharNeTwoNF] :
    4 * weierstrassCubic W = W.Ψ₂Sq := sorry

theorem equation_iff_weierstrassCubic [W.IsCharNeTwoNF] (x y : F) :
    W.toAffine.Equation x y ↔ y ^ 2 = (weierstrassCubic W).eval x := sorry

theorem natDegree_weierstrassCubic : (weierstrassCubic W).natDegree = 3 := sorry

/-- Unit test `weierstrassCubic_x_cubed_add_x`: for `y² = x³ + x` the cubic is `X³ + X`. -/
example : weierstrassCubic (⟨0, 0, 0, 1, 0⟩ : WeierstrassCurve (ZMod 3)) = X ^ 3 + X := sorry

/-- Unit test `weierstrassCubic_monic`: the cubic is monic. -/
example : (weierstrassCubic W).Monic := sorry

/-- Unit test `weierstrassCubic_ignores_a₁`: the cubic does not see `a₁`, so it describes the curve
only in the normal form `a₁ = a₃ = 0`. -/
example : weierstrassCubic (⟨1, 0, 0, 0, 0⟩ : WeierstrassCurve (ZMod 3)) =
    weierstrassCubic (⟨0, 0, 0, 0, 0⟩ : WeierstrassCurve (ZMod 3)) := sorry

/-- **The point count as a character sum** (Sutherland, 18.783 Lecture 7, equation (1)): in odd
characteristic and normal form, `#W(F) = q + 1 + ∑_x χ(f(x))` with `χ` the quadratic character. -/
theorem naivePointCount_eq_add_sum_quadraticChar (hF : ringChar F ≠ 2) [W.IsCharNeTwoNF] :
    (naivePointCount W : ℤ) =
      Fintype.card F + 1 + ∑ x : F, quadraticChar F ((weierstrassCubic W).eval x) := sorry

/-- **The trace as a character sum**: `a_q = -∑_x χ(f(x))`. -/
theorem card_add_one_sub_naivePointCount_eq (hF : ringChar F ≠ 2) [W.IsCharNeTwoNF] :
    (Fintype.card F + 1 - naivePointCount W : ℤ) =
      -∑ x : F, quadraticChar F ((weierstrassCubic W).eval x) := sorry

/-- **A point-count certificate**: a non-square `c` and, for each `x`, a square root either of
`f(x)` or of `c f(x)`. -/
structure PointCountCertificate (F : Type*) [Field F] where
  nonsquare : F
  root : F → F

/-- The checker: `c ^ ((q - 1) / 2) = -1` (Euler's criterion) and, for every `x`, the root squares to
`f(x)` or to `c f(x)`. -/
def PointCountCertificate.check (c : PointCountCertificate F) : Bool := by
  classical
  exact decide (c.nonsquare ^ ((Fintype.card F - 1) / 2) = -1 ∧
    ∀ x : F, c.root x ^ 2 = (weierstrassCubic W).eval x ∨
      c.root x ^ 2 = c.nonsquare * (weierstrassCubic W).eval x)

/-- The count a certificate asserts: `q + 1 + ∑_x εₓ`, with `εₓ = 0` when `f(x) = 0`, `1` when the
root squares to `f(x) ≠ 0`, and `-1` otherwise. -/
def PointCountCertificate.count (c : PointCountCertificate F) : ℤ := by
  classical
  exact Fintype.card F + 1 + ∑ x : F,
    if c.root x ^ 2 = (weierstrassCubic W).eval x then
      (if (weierstrassCubic W).eval x = 0 then 0 else 1)
    else -1

/-- **Soundness of the point-count certificate.** -/
theorem PointCountCertificate.count_eq_of_check (hF : ringChar F ≠ 2) [W.IsCharNeTwoNF]
    {c : PointCountCertificate F} (h : c.check W = true) : c.count W = naivePointCount W := sorry

/-- **Completeness of the point-count certificate.** -/
theorem PointCountCertificate.exists_check (hF : ringChar F ≠ 2) :
    ∃ c : PointCountCertificate F, c.check W = true := sorry

theorem PointCountCertificate.check_nonsquare {c : PointCountCertificate F}
    (hF : ringChar F ≠ 2) (h : c.check W = true) : ¬ IsSquare c.nonsquare := sorry

/-- Unit test `pointCountCertificate_check_zmod_five`: for `y² = x³ + x + 1` over `𝔽₅`, the
non-square `2` and the roots `1, 1, 1, 1, 2` check. -/
example : (PointCountCertificate.mk (2 : ZMod 5) fun x => if x = 4 then 2 else 1).check
    (⟨0, 0, 0, 1, 1⟩ : WeierstrassCurve (ZMod 5)) = true := sorry

/-- Unit test `pointCountCertificate_count_zmod_five`: that certificate asserts `9` points. -/
example : (PointCountCertificate.mk (2 : ZMod 5) fun x => if x = 4 then 2 else 1).count
    (⟨0, 0, 0, 1, 1⟩ : WeierstrassCurve (ZMod 5)) = 9 := sorry

/-- Unit test `pointCountCertificate_square_fails`: the square `1` is rejected as the non-square. -/
example (r : ZMod 5 → ZMod 5) : (PointCountCertificate.mk (1 : ZMod 5) r).check
    (⟨0, 0, 0, 1, 1⟩ : WeierstrassCurve (ZMod 5)) = false := sorry

/-- Unit test `pointCountCertificate_cusp`: on the cusp over `𝔽₅` a certificate asserts `6`, the
convention that counts the singular point. -/
example : (PointCountCertificate.mk (2 : ZMod 5)
      fun x => if x = 0 then 0 else if x = 3 ∨ x = 4 then 2 else 1).count
    (⟨0, 0, 0, 0, 0⟩ : WeierstrassCurve (ZMod 5)) = 6 := sorry

/-- **The Hasse error bound for a certified count** (the Hasse bound of EllipticCurves layer 3,
`a_q² ≤ 4q`, transported along `naivePointCount = pointCount`). -/
theorem sq_card_add_one_sub_naivePointCount_le [W.IsElliptic] :
    (Fintype.card F + 1 - naivePointCount W : ℤ) ^ 2 ≤ 4 * Fintype.card F := sorry

/-- **The Weil error bound for `y² = f(x)`** (from FF.2's multiplicative Weil bound): for odd `q`
and square-free `f` of degree `d ≥ 1`, `|#{(x, y) : y² = f(x)} - q| ≤ (d - 1) √q`. -/
theorem abs_card_sq_eq_eval_sub_card_le (hF : ringChar F ≠ 2) {f : F[X]} (hsq : Squarefree f)
    (hd : 1 ≤ f.natDegree) :
    |((Finset.univ.filter fun p : F × F => p.2 ^ 2 = f.eval p.1).card : ℝ) - Fintype.card F| ≤
      (f.natDegree - 1) * Real.sqrt (Fintype.card F) := sorry

end PointCount

/-! ### FF.3 J. Schoof's algorithm (Sutherland, 18.783 Lecture 8; Schoof 1995 §5)

Setting: `q` odd, the model in normal form `y² = f(x)`, `K ⊇ F` a field (in the theorems, an
algebraic closure), `π` the `q`-power Frobenius acting on `(W.baseChange K).toAffine.Point`. -/

section Schoof

variable (W : WeierstrassCurve F)

/-- The `q`-power Frobenius on the `K`-points of `W` (Mathlib's `Point.map` along
`FiniteField.frobeniusAlgHom F K`). -/
abbrev frobeniusPointMap (K : Type*) [Field K] [Algebra F K] [DecidableEq K] :
    (W.baseChange K).toAffine.Point →+ (W.baseChange K).toAffine.Point :=
  WeierstrassCurve.Affine.Point.map (W' := W.toAffine) (FiniteField.frobeniusAlgHom F K)

theorem frobeniusPointMap_some (K : Type*) [Field K] [Algebra F K] [DecidableEq K] {x y : K}
    (h : (W.baseChange K).toAffine.Nonsingular x y) :
    ∃ h' : (W.baseChange K).toAffine.Nonsingular (x ^ Fintype.card F) (y ^ Fintype.card F),
      frobeniusPointMap W K (.some x y h) = .some _ _ h' := sorry

theorem frobeniusPointMap_injective (K : Type*) [Field K] [Algebra F K] [DecidableEq K] :
    Function.Injective (frobeniusPointMap W K) := sorry

/-- Unit test `frobeniusPointMap_zero`: the point at infinity is fixed. -/
example (K : Type*) [Field K] [Algebra F K] [DecidableEq K] : frobeniusPointMap W K 0 = 0 := sorry

/-- Unit test `frobeniusPointMap_of_rational`: over `K = F` Frobenius is the identity. -/
example (P : (W.baseChange F).toAffine.Point) : frobeniusPointMap W F P = P := sorry

open Classical in
/-- Unit test `frobeniusPointMap_ne_id`: over `𝔽₉ ⊇ 𝔽₃` Frobenius moves the point `(i, 0)` of
`y² = x³ + x`, `i² = -1`. -/
example : ∃ P : ((⟨0, 0, 0, 1, 0⟩ : WeierstrassCurve (ZMod 3)).baseChange
      (GaloisField 3 2)).toAffine.Point,
    frobeniusPointMap (⟨0, 0, 0, 1, 0⟩ : WeierstrassCurve (ZMod 3)) (GaloisField 3 2) P ≠ P := sorry

/-- **The trace modulo `2`** (Sutherland, Lecture 8 §8.1; Schoof 1995 §5): for odd `q` and an
elliptic model in normal form, `a_q` is even exactly when `f` has a root in `F`, that is when
`gcd(X ^ q - X, f) ≠ 1`. -/
theorem two_dvd_card_add_one_sub_naivePointCount_iff (hF : ringChar F ≠ 2) [W.IsCharNeTwoNF]
    [W.IsElliptic] :
    (2 : ℤ) ∣ (Fintype.card F + 1 - naivePointCount W : ℤ) ↔
      gcd (X ^ Fintype.card F - X) (weierstrassCubic W) ≠ 1 := sorry

/-- **The trace modulo `ℓ` from one torsion point** (Sutherland, Lemma 8.2): if `π² - t π + q = 0` on
all points, `P ≠ 0` is `ℓ`-torsion for a prime `ℓ`, and `π²(P) - c π(P) + q P = 0`, then
`c ≡ t (mod ℓ)`. The Frobenius relation is EllipticCurves layer 3's. -/
theorem modEq_of_frobenius_relation (K : Type*) [Field K] [Algebra F K] [DecidableEq K]
    {ℓ : ℕ} (hℓ : ℓ.Prime) {t c : ℤ}
    (hrel : ∀ P, frobeniusPointMap W K (frobeniusPointMap W K P) - t • frobeniusPointMap W K P +
      (Fintype.card F : ℤ) • P = 0)
    {P : (W.baseChange K).toAffine.Point} (hP : P ≠ 0) (hℓP : (ℓ : ℤ) • P = 0)
    (hc : frobeniusPointMap W K (frobeniusPointMap W K P) - c • frobeniusPointMap W K P +
      (Fintype.card F : ℤ) • P = 0) :
    c ≡ t [ZMOD ℓ] := sorry

/-- **Schoof's representatives**: `none` stands for the zero map and `some (a, b)` for
`(x, y) ↦ (a(x), b(x) y)`, with `a, b ∈ F[X]/(g)` for a factor `g` of the `ℓ`-division
polynomial. -/
abbrev SchoofRep (g : F[X]) : Type _ := Option (AdjoinRoot g × AdjoinRoot g)

/-- `r` represents `α` on the points whose `x`-coordinate is a root of `g`. -/
def SchoofRep.Represents {g : F[X]} (K : Type*) [Field K] [Algebra F K] [DecidableEq K]
    (r : SchoofRep g)
    (α : (W.baseChange K).toAffine.Point → (W.baseChange K).toAffine.Point) : Prop :=
  ∀ (x y : K) (h : (W.baseChange K).toAffine.Nonsingular x y) (hx : aeval x g = 0),
    match r with
    | none => α (.some x y h) = 0
    | some ab =>
      ∃ h' : (W.baseChange K).toAffine.Nonsingular
          (AdjoinRoot.liftAlgHom g (Algebra.ofId F K) x (by simpa [aeval_def] using hx) ab.1)
          (AdjoinRoot.liftAlgHom g (Algebra.ofId F K) x (by simpa [aeval_def] using hx) ab.2 * y),
        α (.some x y h) = .some _ _ h'

/-- The representative `(X ^ q, f ^ ((q - 1) / 2))` of Frobenius (Sutherland, (2) of Lecture 8). -/
def schoofFrobeniusRep (g : F[X]) : SchoofRep g :=
  some (AdjoinRoot.mk g (X ^ Fintype.card F),
    AdjoinRoot.mk g (weierstrassCubic W ^ ((Fintype.card F - 1) / 2)))

/-- The chord rule on representatives: with `r = (b₁ - b₂)(a₁ - a₂)⁻¹`, the sum is
`(r² f - a₂ - a₁ - a₂', r (a₁ - a₃) - b₁)` (Mathlib's `addX`, `addY` with `a₁ = a₃ = 0`). -/
def schoofChordRep {g : F[X]} (p₁ p₂ : AdjoinRoot g × AdjoinRoot g) :
    AdjoinRoot g × AdjoinRoot g :=
  let r := (p₁.2 - p₂.2) * Ring.inverse (p₁.1 - p₂.1)
  let a₃ := r ^ 2 * AdjoinRoot.mk g (weierstrassCubic W) - AdjoinRoot.of g W.a₂ - p₁.1 - p₂.1
  (a₃, r * (p₁.1 - a₃) - p₁.2)

theorem schoofFrobeniusRep_eq_modByMonic {g : F[X]} (hg : g.Monic) :
    schoofFrobeniusRep W g = some (AdjoinRoot.mk g (X ^ Fintype.card F %ₘ g),
      AdjoinRoot.mk g (weierstrassCubic W ^ ((Fintype.card F - 1) / 2) %ₘ g)) := sorry

theorem schoofChordRep_fst {g : F[X]} (p₁ p₂ : AdjoinRoot g × AdjoinRoot g) :
    (schoofChordRep W p₁ p₂).1 =
      ((p₁.2 - p₂.2) * Ring.inverse (p₁.1 - p₂.1)) ^ 2 * AdjoinRoot.mk g (weierstrassCubic W) -
        AdjoinRoot.of g W.a₂ - p₁.1 - p₂.1 := sorry

theorem SchoofRep.represents_none_zero {g : F[X]} (K : Type*) [Field K] [Algebra F K]
    [DecidableEq K] : SchoofRep.Represents W K (none : SchoofRep g) fun _ => 0 := sorry

theorem SchoofRep.represents_id {g : F[X]} (K : Type*) [Field K] [Algebra F K] [DecidableEq K] :
    SchoofRep.Represents W K (some (AdjoinRoot.root g, 1) : SchoofRep g) id := sorry

theorem SchoofRep.represents_frobenius [W.IsCharNeTwoNF] (hF : ringChar F ≠ 2) (g : F[X])
    (K : Type*) [Field K] [Algebra F K] [DecidableEq K] :
    SchoofRep.Represents W K (schoofFrobeniusRep W g) (frobeniusPointMap W K) := sorry

theorem SchoofRep.Represents.add_of_isUnit [W.IsCharNeTwoNF] {g : F[X]} {K : Type*} [Field K]
    [Algebra F K] [DecidableEq K] {p₁ p₂ : AdjoinRoot g × AdjoinRoot g}
    {α₁ α₂ : (W.baseChange K).toAffine.Point → (W.baseChange K).toAffine.Point}
    (h₁ : SchoofRep.Represents W K (some p₁) α₁) (h₂ : SchoofRep.Represents W K (some p₂) α₂)
    (hu : IsUnit (p₁.1 - p₂.1)) :
    SchoofRep.Represents W K (some (schoofChordRep W p₁ p₂)) fun P => α₁ P + α₂ P := sorry

theorem SchoofRep.Represents.add_neg {g : F[X]} {K : Type*} [Field K] [Algebra F K]
    [DecidableEq K] {a b : AdjoinRoot g}
    {α₁ α₂ : (W.baseChange K).toAffine.Point → (W.baseChange K).toAffine.Point}
    (h₁ : SchoofRep.Represents W K (some (a, b)) α₁) (h₂ : SchoofRep.Represents W K (some (a, -b)) α₂)
    [W.IsCharNeTwoNF] :
    SchoofRep.Represents W K (none : SchoofRep g) fun P => α₁ P + α₂ P := sorry

/-- Composition with Frobenius: substituting `X ^ q` into a representative is raising it to the
`q`-th power in `F[X]/(g)`, so `α ∘ π` is represented by `(a ^ q, b ^ q f ^ ((q - 1) / 2))`. -/
theorem SchoofRep.Represents.comp_frobenius [W.IsCharNeTwoNF] (hF : ringChar F ≠ 2) {g : F[X]}
    {K : Type*} [Field K] [Algebra F K] [DecidableEq K] {a b : AdjoinRoot g}
    {α : (W.baseChange K).toAffine.Point → (W.baseChange K).toAffine.Point}
    (h : SchoofRep.Represents W K (some (a, b)) α) :
    SchoofRep.Represents W K
      (some (a ^ Fintype.card F,
        b ^ Fintype.card F * AdjoinRoot.mk g (weierstrassCubic W ^ ((Fintype.card F - 1) / 2))))
      (α ∘ frobeniusPointMap W K) := sorry

/-- Unit test `schoofFrobeniusRep_zmod_three`: for `y² = x³ + x` over `𝔽₃` and `g = X³ + X`, the
Frobenius representative is `(X³ mod g, (X³ + X) mod g) = (-X, 0)`. -/
example : schoofFrobeniusRep (⟨0, 0, 0, 1, 0⟩ : WeierstrassCurve (ZMod 3)) (X ^ 3 + X) =
    some (AdjoinRoot.mk _ (-X), 0) := sorry

/-- Unit test `schoofRep_none_represents_zero_only`: the representative `none` of the zero map does
not represent the identity when some root of `g` is the `x`-coordinate of a point. -/
example (K : Type*) [Field K] [Algebra F K] [DecidableEq K] {g : F[X]} {x y : K}
    (h : (W.baseChange K).toAffine.Nonsingular x y) (hx : aeval x g = 0) :
    ¬ SchoofRep.Represents W K (none : SchoofRep g) id := sorry

/-- Unit test `schoofRep_represents_id_one`: over any `g`, `(X, 1)` represents the identity. -/
example (K : Type*) [Field K] [Algebra F K] [DecidableEq K] :
    SchoofRep.Represents W K (some (AdjoinRoot.root (X ^ 3 + X : F[X]), 1)) id := sorry

/-- Unit test `schoofRep_represents_none_iff`: `none` represents exactly the maps vanishing at the
points whose `x`-coordinate is a root of `g`. -/
example (K : Type*) [Field K] [Algebra F K] [DecidableEq K] {g : F[X]}
    (α : (W.baseChange K).toAffine.Point → (W.baseChange K).toAffine.Point) :
    SchoofRep.Represents W K (none : SchoofRep g) α ↔
      ∀ (x y : K) (h : (W.baseChange K).toAffine.Nonsingular x y), aeval x g = 0 →
        α (.some x y h) = 0 := sorry

/-- Unit test `schoofFrobeniusRep_one`: modulo `g = 1` every representative is `0`. -/
example : schoofFrobeniusRep W (1 : F[X]) = some (0, 0) := sorry

/-- Unit test `schoofFrobeniusRep_ne_id`: for `y² = x³ + x` over `𝔽₃` and `g = X² + 1` the Frobenius
representative is not the identity's `(X, 1)`. -/
example : schoofFrobeniusRep (⟨0, 0, 0, 1, 0⟩ : WeierstrassCurve (ZMod 3)) (X ^ 2 + 1) ≠
    some (AdjoinRoot.root _, 1) := sorry

/-- Unit test `schoofChordRep_comm`: when `a₁ - a₂` is a unit the chord's `x`-coordinate is
symmetric. -/
example {g : F[X]} (p₁ p₂ : AdjoinRoot g × AdjoinRoot g) (hu : IsUnit (p₁.1 - p₂.1)) :
    (schoofChordRep W p₁ p₂).1 = (schoofChordRep W p₂ p₁).1 := sorry

/-- Unit test `schoofChordRep_not_unit`: with `a₁ = a₂` the formula degenerates (`r = 0`) and does not
give the sum; the unit hypothesis is needed. -/
example {g : F[X]} (a b₁ b₂ : AdjoinRoot g) :
    schoofChordRep W (a, b₁) (a, b₂) = (-AdjoinRoot.of g W.a₂ - a - a, -b₁) := sorry

/-- Unit test `schoofChordRep_zero_g`: modulo `g = 1` the chord rule returns `(0, 0)`. -/
example (p₁ p₂ : AdjoinRoot (1 : F[X]) × AdjoinRoot (1 : F[X])) :
    schoofChordRep W p₁ p₂ = (0, 0) := sorry

/-- **The `ℓ`-division polynomial is separable for `ℓ ∤ q`**: a consequence of `#E[ℓ] = ℓ²`
(EllipticCurves layer 2) and `deg preΨ_ℓ = (ℓ² - 1) / 2`. The structure of `E[ℓ]` enters as the
hypothesis `hcard`. -/
theorem separable_preΨ_of_card_torsion (K : Type*) [Field K] [Algebra F K]
    [IsAlgClosed K] [DecidableEq K] [W.IsElliptic] {ℓ : ℕ} (hℓ : ℓ.Prime) (hℓ2 : ℓ ≠ 2)
    (hℓq : (ℓ : F) ≠ 0)
    (hcard : Nat.card {P : (W.baseChange K).toAffine.Point // (ℓ : ℤ) • P = 0} =
      ℓ ^ 2) :
    (W.preΨ ℓ).Separable := sorry

/-- **Algorithm 8.3** (Sutherland, Lecture 8): the trace modulo an odd prime `ℓ ∤ q`, computed in
`F[x, y]/(g(x), y² - f(x))` with `g = preΨ_ℓ`, replacing `g` by a proper factor whenever a
non-invertible denominator occurs; `none` if no `c < ℓ` is found. -/
def schoofTraceModPrime (W : WeierstrassCurve F) (ℓ : ℕ) : Option (ZMod ℓ) := sorry

/-- Unit test `schoofTraceModPrime_x_cubed_add_x_add_one_three`: for `y² = x³ + x + 1` over `𝔽₅`
(`a₅ = -3`) the trace modulo `3` is `0`. -/
example : schoofTraceModPrime (⟨0, 0, 0, 1, 1⟩ : WeierstrassCurve (ZMod 5)) 3 = some 0 := sorry

/-- Unit test `schoofTraceModPrime_x_cubed_add_x_add_one_seven`: and modulo `7` it is `4`. -/
example : schoofTraceModPrime (⟨0, 0, 0, 1, 1⟩ : WeierstrassCurve (ZMod 5)) 7 = some 4 := sorry

/-- Unit test `schoofTraceModPrime_char`: for `ℓ = char F` the degree formula fails — the
`5`-division polynomial over `𝔽₅` has degree `< 12` — which is why the algorithm requires `ℓ ∤ q`. -/
example : ((⟨0, 0, 0, 1, 1⟩ : WeierstrassCurve (ZMod 5)).preΨ 5).natDegree < 12 := sorry

/-- **Soundness of Algorithm 8.3**: a returned value is `a_q mod ℓ`. The Frobenius relation of
EllipticCurves layer 3 enters as the hypothesis `hrel`. -/
theorem schoofTraceModPrime_sound (K : Type*) [Field K] [Algebra F K]
    [IsAlgClosed K] [DecidableEq K] (hF : ringChar F ≠ 2) [W.IsCharNeTwoNF] [W.IsElliptic]
    {ℓ : ℕ} (hℓ : ℓ.Prime) (hℓ2 : ℓ ≠ 2) (hℓq : (ℓ : F) ≠ 0)
    (hrel : ∀ P, frobeniusPointMap W K
        (frobeniusPointMap W K P) -
      (Fintype.card F + 1 - naivePointCount W : ℤ) • frobeniusPointMap W K P +
      (Fintype.card F : ℤ) • P = 0)
    {c : ZMod ℓ} (hc : schoofTraceModPrime W ℓ = some c) :
    c = ((Fintype.card F + 1 - naivePointCount W : ℤ) : ZMod ℓ) := sorry

/-- **Completeness of Algorithm 8.3**: it returns a value, given the separability of `preΨ_ℓ`. -/
theorem schoofTraceModPrime_isSome (K : Type*) [Field K] [Algebra F K]
    [IsAlgClosed K] [DecidableEq K] (hF : ringChar F ≠ 2) [W.IsCharNeTwoNF] [W.IsElliptic]
    {ℓ : ℕ} (hℓ : ℓ.Prime) (hℓ2 : ℓ ≠ 2) (hℓq : (ℓ : F) ≠ 0)
    (hrel : ∀ P, frobeniusPointMap W K
        (frobeniusPointMap W K P) -
      (Fintype.card F + 1 - naivePointCount W : ℤ) • frobeniusPointMap W K P +
      (Fintype.card F : ℤ) • P = 0)
    (hsep : (W.preΨ ℓ).Separable) : (schoofTraceModPrime W ℓ).isSome := sorry

/-- **Reconstruction of the trace from residues** (Sutherland, Algorithm 8.1 step 3): two integers of
square at most `4q` congruent modulo `M` with `M² > 16 q` are equal. -/
theorem eq_of_modEq_of_sq_le {q M : ℕ} {t t' : ℤ} (ht : t ^ 2 ≤ 4 * q) (ht' : t' ^ 2 ≤ 4 * q)
    (hM : 16 * (q : ℤ) < (M : ℤ) ^ 2) (h : t ≡ t' [ZMOD M]) : t = t' := sorry

/-- **Schoof's algorithm** (Sutherland, Algorithm 8.1; Schoof 1995 §5): the trace modulo `2` and
modulo odd primes `ℓ ∤ q` until their product exceeds `4 √q`, the Chinese remainder theorem, and
the symmetric residue; the output is the point count `q + 1 - t`. -/
def schoofPointCount (W : WeierstrassCurve F) : ℤ := sorry

/-- Unit test `schoofPointCount_x_cubed_add_x_add_one_zmod_five`: `y² = x³ + x + 1` over `𝔽₅` has
`9` points. -/
example : schoofPointCount (⟨0, 0, 0, 1, 1⟩ : WeierstrassCurve (ZMod 5)) = 9 := sorry

/-- Unit test `schoofPointCount_zmod_seven`: `y² = x³ + 2x + 3` over `𝔽₇` has `6` points. -/
example : schoofPointCount (⟨0, 0, 0, 2, 3⟩ : WeierstrassCurve (ZMod 7)) = 6 := sorry

/-- Unit test `schoofPointCount_in_hasse_interval`: the output lies in the Hasse interval. -/
example (hF : ringChar F ≠ 2) [W.IsCharNeTwoNF] [W.IsElliptic] :
    (Fintype.card F + 1 - schoofPointCount W) ^ 2 ≤ 4 * Fintype.card F := sorry

/-- **Correctness of Schoof's algorithm**: it returns the point count. The Frobenius relation and
the Hasse bound (EllipticCurves layer 3) and the separability of the division polynomials
(from layer 2) enter as hypotheses. -/
theorem schoofPointCount_eq (K : Type*) [Field K] [Algebra F K]
    [IsAlgClosed K] [DecidableEq K] (hF : ringChar F ≠ 2) [W.IsCharNeTwoNF] [W.IsElliptic]
    (hrel : ∀ P, frobeniusPointMap W K
        (frobeniusPointMap W K P) -
      (Fintype.card F + 1 - naivePointCount W : ℤ) • frobeniusPointMap W K P +
      (Fintype.card F : ℤ) • P = 0)
    (hhasse : (Fintype.card F + 1 - naivePointCount W : ℤ) ^ 2 ≤ 4 * Fintype.card F)
    (hsep : ∀ ℓ : ℕ, ℓ.Prime → ℓ ≠ 2 → (ℓ : F) ≠ 0 → (W.preΨ ℓ).Separable) :
    schoofPointCount W = naivePointCount W := sorry

/-- Under the hypotheses of `schoofPointCount_eq`, the output is the cardinality of Mathlib's point
type. -/
theorem schoofPointCount_eq_card_point (K : Type*) [Field K] [Algebra F K]
    [IsAlgClosed K] [DecidableEq K] (hF : ringChar F ≠ 2) [W.IsCharNeTwoNF] [W.IsElliptic]
    (hrel : ∀ P, frobeniusPointMap W K (frobeniusPointMap W K P) -
      (Fintype.card F + 1 - naivePointCount W : ℤ) • frobeniusPointMap W K P +
      (Fintype.card F : ℤ) • P = 0)
    (hhasse : (Fintype.card F + 1 - naivePointCount W : ℤ) ^ 2 ≤ 4 * Fintype.card F)
    (hsep : ∀ ℓ : ℕ, ℓ.Prime → ℓ ≠ 2 → (ℓ : F) ≠ 0 → (W.preΨ ℓ).Separable) :
    schoofPointCount W = Nat.card W.toAffine.Point := sorry

end Schoof

end FF3

end TauCeti.FiniteFieldSums

end FF3File


-- ===== FF.4 =====

section FF4File

/-!
# Suggested Lean for FiniteFieldsAndCharacterSums, layer FF.4 (finite rings, sequences and codes)

This file is not the roadmap and is not exhaustive: the roadmap document is definitive. The
statements below suggest Lean forms so that contributors and reviewers converge on names and
signatures. Every proof is `sorry`; nothing here claims an implementation.

Tau Ceti is not built in the environment of this file. Codes are `Submodule F (ι → F)`, which is
exactly Tau Ceti's `TauCeti.LinearCode F ι`; the algebraic geometry codes use local `TC…` stand-ins
for Tau Ceti's function-field declarations, listed where they are introduced.
-/

namespace TauCeti.FiniteFieldSums
section FF4

/-! ### Galois rings -/

section GaloisRings

open Polynomial

/-- A monic polynomial over a local ring whose reduction to the residue field is irreducible. -/
def IsBasicIrreducible {R : Type*} [CommRing R] [IsLocalRing R] (f : R[X]) : Prop :=
  f.Monic ∧ Irreducible (f.map (IsLocalRing.residue R))

namespace IsBasicIrreducible

variable {R : Type*} [CommRing R] [IsLocalRing R] {f : R[X]}

theorem monic (hf : IsBasicIrreducible f) : f.Monic := hf.1

theorem irreducible_map (hf : IsBasicIrreducible f) :
    Irreducible (f.map (IsLocalRing.residue R)) := hf.2

theorem natDegree_map (hf : IsBasicIrreducible f) :
    (f.map (IsLocalRing.residue R)).natDegree = f.natDegree := sorry

theorem irreducible (hf : IsBasicIrreducible f) : Irreducible f := sorry

theorem map_ringEquiv {S : Type*} [CommRing S] [IsLocalRing S] (e : R ≃+* S)
    (hf : IsBasicIrreducible f) : IsBasicIrreducible (f.map (e : R →+* S)) := sorry

/-- Unit test `IsBasicIrreducible.x_sq_add_x_add_one_zmod_four`: `X² + X + 1` is basic
irreducible over `ZMod 4`. -/
example [IsLocalRing (ZMod 4)] : IsBasicIrreducible (X ^ 2 + X + 1 : (ZMod 4)[X]) := sorry

/-- Unit test `IsBasicIrreducible.not_x_sq_add_one_zmod_twentyfive`: `X² + 1` over `ZMod 25` is
monic but not basic irreducible. -/
example [IsLocalRing (ZMod 25)] : ¬ IsBasicIrreducible (X ^ 2 + 1 : (ZMod 25)[X]) := sorry

/-- Unit test `IsBasicIrreducible.iff_of_field`: over a field, basic irreducible means monic
irreducible. -/
example {K : Type*} [Field K] (g : K[X]) : IsBasicIrreducible g ↔ g.Monic ∧ Irreducible g := sorry

/-- Unit test `IsBasicIrreducible.x_sub_c`: `X - C a` is basic irreducible. -/
example (a : R) : IsBasicIrreducible (X - C a) := sorry

end IsBasicIrreducible

/-- The Galois ring `GR(p^n, r)`, modelled as the length-`n` truncated Witt vectors over
`GaloisField p r`. -/
abbrev GaloisRing (p : ℕ) [Fact p.Prime] (n r : ℕ) : Type :=
  TruncatedWittVector p n (GaloisField p r)

namespace GaloisRing

variable (p : ℕ) [Fact p.Prime] (n r : ℕ)

instance instFinite : Finite (GaloisRing p n r) := sorry

/-- `GR(p^n, r)` as a `ZMod (p^n)`-algebra (the unique ring map). -/
noncomputable instance algebraZMod : Algebra (ZMod (p ^ n)) (GaloisRing p n r) := sorry

theorem card_eq (hr : r ≠ 0) : Nat.card (GaloisRing p n r) = p ^ (n * r) := sorry

theorem charP (hr : r ≠ 0) : CharP (GaloisRing p n r) (p ^ n) := sorry

/-- `GR(p^n, 1) ≃ ZMod (p^n)`. -/
noncomputable def zmodEquiv : GaloisRing p n 1 ≃+* ZMod (p ^ n) := sorry

/-- `GR(p, r) ≃ F_{p^r}`. -/
noncomputable def oneEquiv : GaloisRing p 1 r ≃+* GaloisField p r := sorry

/-- Reduction `GR(p^n, r) → GR(p^m, r)` for `m ≤ n`. -/
noncomputable def reduction {m : ℕ} (h : m ≤ n) : GaloisRing p n r →+* GaloisRing p m r :=
  TruncatedWittVector.truncate h

/-- The residue map `GR(p^n, r) → F_{p^r}`. -/
noncomputable def residue (hn : 1 ≤ n) : GaloisRing p n r →+* GaloisField p r :=
  (oneEquiv p r).toRingHom.comp (reduction p n r hn)

theorem isLocalRing (hn : 1 ≤ n) (hr : 1 ≤ r) : IsLocalRing (GaloisRing p n r) := sorry

theorem isUnit_iff_coeff_zero_ne_zero (hn : 1 ≤ n) (x : GaloisRing p n r) :
    IsUnit x ↔ TruncatedWittVector.coeff (p := p) (R := GaloisField p r) ⟨0, hn⟩ x ≠ 0 := sorry

theorem ker_residue (hn : 1 ≤ n) :
    RingHom.ker (residue p n r hn) = Ideal.span {(p : GaloisRing p n r)} := sorry

/-- Unit test `GaloisRing.card_two_two_two`: `GR(4, 2)` has sixteen elements. -/
example [Fact (Nat.Prime 2)] : Nat.card (GaloisRing 2 2 2) = 16 := sorry

/-- Unit test `GaloisRing.zmodEquiv_two_two`: `GR(4, 1) ≃ ZMod 4`. -/
example [Fact (Nat.Prime 2)] : Nonempty (GaloisRing 2 2 1 ≃+* ZMod 4) := sorry

/-- Unit test `GaloisRing.one_equiv_galoisField`: `GR(p, r) ≃ F_{p^r}`. -/
example : Nonempty (GaloisRing p 1 r ≃+* GaloisField p r) := ⟨oneEquiv p r⟩

/-- Unit test `GaloisRing.not_isField_two_two_one`: `GR(4, 1)` is not a field. -/
example [Fact (Nat.Prime 2)] : ¬ IsField (GaloisRing 2 2 1) := sorry

/-! Teichmüller section, expansion, units, Frobenius. -/

/-- The Teichmüller section `F_{p^r} →* GR(p^n, r)`. -/
noncomputable def teichmuller : GaloisField p r →* GaloisRing p n r :=
  (WittVector.truncate (p := p) (R := GaloisField p r) n).toMonoidHom.comp
    (WittVector.teichmuller p (R := GaloisField p r))

theorem teichmuller_zero : teichmuller p n r 0 = 0 := sorry

theorem residue_teichmuller (hn : 1 ≤ n) (a : GaloisField p r) :
    residue p n r hn (teichmuller p n r a) = a := sorry

theorem teichmuller_pow_card (a : GaloisField p r) :
    teichmuller p n r a ^ (p ^ r) = teichmuller p n r a := sorry

theorem mem_range_teichmuller_iff (hn : 1 ≤ n) (hr : 1 ≤ r) (x : GaloisRing p n r) :
    x ∈ Set.range (teichmuller p n r) ↔ x ^ (p ^ r) = x := sorry

theorem teichmuller_unique (hn : 1 ≤ n) (σ : GaloisField p r →* GaloisRing p n r)
    (hσ : ∀ a, residue p n r hn (σ a) = a) : σ = teichmuller p n r := sorry

theorem reduction_teichmuller {m : ℕ} (h : m ≤ n) (a : GaloisField p r) :
    reduction p n r h (teichmuller p n r a) = teichmuller p m r a := sorry

/-- Unit test `teichmuller.zmod_nine_two`: under `GR(9, 1) ≃ ZMod 9`, `τ(2) = 8`. -/
example [Fact (Nat.Prime 3)] :
    zmodEquiv 3 2 (teichmuller 3 2 1 ((oneEquiv 3 1) ((zmodEquiv 3 1).symm 2))) = 8 :=
  sorry

/-- Unit test `teichmuller.residue`: the residue of `τ a` is `a`. -/
example (hn : 1 ≤ n) (a : GaloisField p r) : residue p n r hn (teichmuller p n r a) = a :=
  residue_teichmuller p n r hn a

/-- Unit test `teichmuller.not_additive`: `τ` is not additive on `GR(4, 1)`. -/
example [Fact (Nat.Prime 2)] : teichmuller 2 2 1 1 + teichmuller 2 2 1 1 ≠ teichmuller 2 2 1 (1 + 1) :=
  sorry

/-- Unit test `teichmuller.length_one`: for `n = 1`, `τ` is the identification with the field. -/
example (a : GaloisField p r) : oneEquiv p r (teichmuller p 1 r a) = a := sorry

/-- **Teichmüller expansion** in `GR(p^n, r)`. -/
theorem existsUnique_teichmuller_expansion (hn : 1 ≤ n) (hr : 1 ≤ r) (x : GaloisRing p n r) :
    ∃! a : Fin n → GaloisField p r, x = ∑ i, teichmuller p n r (a i) * (p : GaloisRing p n r) ^ (i : ℕ) :=
  sorry

/-- Units of `GR(p^n, r)`: Teichmüller part times principal units, and their number. -/
theorem card_units (hn : 1 ≤ n) (hr : 1 ≤ r) :
    Nat.card (GaloisRing p n r)ˣ = (p ^ r - 1) * p ^ (r * (n - 1)) := sorry

/-- The principal units `1 + p GR(p^n, r)`, the kernel of reduction on units. -/
noncomputable def principalUnits (hn : 1 ≤ n) : Subgroup (GaloisRing p n r)ˣ :=
  (Units.map (residue p n r hn).toMonoidHom).ker

theorem units_mulEquiv (hn : 1 ≤ n) (hr : 1 ≤ r) :
    Nonempty ((GaloisRing p n r)ˣ ≃* (GaloisField p r)ˣ × principalUnits p n r hn) := sorry

/-- Principal units for odd `p`: `1 + p GR(p^n, r) ≃ (ZMod p^{n-1})^r`. -/
theorem principalUnits_addEquiv_of_odd (hp : p ≠ 2) (hn : 1 ≤ n) (hr : 1 ≤ r) :
    Nonempty (Additive (principalUnits p n r hn) ≃+ (Fin r → ZMod (p ^ (n - 1)))) := sorry

/-- Principal units for `p = 2`, `n ≥ 3`. -/
theorem principalUnits_addEquiv_two [Fact (Nat.Prime 2)] (hn : 3 ≤ n) (hr : 1 ≤ r) :
    Nonempty (Additive (principalUnits 2 n r (by omega)) ≃+
      (Fin (r - 1) → ZMod (2 ^ (n - 1))) × ZMod (2 ^ (n - 2)) × ZMod 2) := sorry

/-- The Frobenius automorphism of `GR(p^n, r)`. -/
noncomputable def frobenius : GaloisRing p n r ≃+* GaloisRing p n r := sorry

theorem frobenius_teichmuller (a : GaloisField p r) :
    frobenius p n r (teichmuller p n r a) = teichmuller p n r (a ^ p) := sorry

theorem residue_frobenius (hn : 1 ≤ n) (x : GaloisRing p n r) :
    residue p n r hn (frobenius p n r x) = residue p n r hn x ^ p := sorry

theorem frobenius_pow_r : (frobenius p n r) ^ r = RingEquiv.refl _ := sorry

theorem frobenius_eq_self_iff (x : GaloisRing p n r) :
    frobenius p n r x = x ↔ x ∈ Set.range (algebraMap (ZMod (p ^ n)) (GaloisRing p n r)) := sorry

theorem reduction_frobenius {m : ℕ} (h : m ≤ n) (x : GaloisRing p n r) :
    reduction p n r h (frobenius p n r x) = frobenius p m r (reduction p n r h x) := sorry

/-- Unit test `frobenius.eq_refl_of_r_one`: the Frobenius of `GR(p^n, 1)` is the identity. -/
example : frobenius p n 1 = RingEquiv.refl _ := sorry

/-- Unit test `frobenius.teichmuller`: `σ (τ a) = τ (a ^ p)`. -/
example (a : GaloisField p r) : frobenius p n r (teichmuller p n r a) = teichmuller p n r (a ^ p) :=
  frobenius_teichmuller p n r a

/-- Unit test `frobenius.pow_r`: `σ` has order exactly `2` on `GR(4, 2)`. -/
example [Fact (Nat.Prime 2)] :
    frobenius 2 2 2 ^ 2 = RingEquiv.refl _ ∧ frobenius 2 2 2 ≠ RingEquiv.refl _ := sorry

/-- Unit test `frobenius.ne_pow_p`: on `GR(9, 1)`, `σ` is the identity but cubing is not. -/
example [Fact (Nat.Prime 3)] : ∃ x : GaloisRing 3 2 1, frobenius 3 2 1 x ≠ x ^ 3 := sorry

/-- The automorphism group of `GR(p^n, r)` is cyclic of order `r`, via reduction. -/
theorem ringAut_mulEquiv_galoisField (hn : 1 ≤ n) (hr : 1 ≤ r) :
    Nonempty ((GaloisRing p n r ≃+* GaloisRing p n r) ≃* (GaloisField p r ≃+* GaloisField p r)) :=
  sorry

theorem card_ringAut (hn : 1 ≤ n) (hr : 1 ≤ r) :
    Nat.card (GaloisRing p n r ≃+* GaloisRing p n r) = r := sorry

/-- **Presentation**: `(ZMod p^n)[X]/(f) ≃ GR(p^n, r)` for monic basic irreducible `f` of
degree `r`. -/
theorem nonempty_adjoinRoot_equiv [IsLocalRing (ZMod (p ^ n))] (hn : 1 ≤ n) (f : (ZMod (p ^ n))[X])
    (hf : IsBasicIrreducible f) (hdeg : f.natDegree = r) :
    Nonempty (AdjoinRoot f ≃+* GaloisRing p n r) := sorry

/-- **Uniqueness** of the unramified extension of `ZMod p^n` of degree `r`. -/
theorem nonempty_equiv_of_isLocalRing (hn : 1 ≤ n) (hr : 1 ≤ r) (S : Type*) [CommRing S]
    [Finite S] [IsLocalRing S] [Algebra (ZMod (p ^ n)) S]
    (hinj : Function.Injective (algebraMap (ZMod (p ^ n)) S))
    (hmax : IsLocalRing.maximalIdeal S = Ideal.span {(p : S)})
    (hres : Nat.card (IsLocalRing.ResidueField S) = p ^ r) :
    Nonempty (S ≃+* GaloisRing p n r) := sorry

/-- The ideals of `GR(p^n, r)` are the `(p^i)`, `i ≤ n`. -/
theorem ideal_eq_span_pow (hn : 1 ≤ n) (hr : 1 ≤ r) (I : Ideal (GaloisRing p n r)) :
    ∃ i ≤ n, I = Ideal.span {(p : GaloisRing p n r) ^ i} := sorry

theorem ker_reduction {m : ℕ} (h : m ≤ n) :
    RingHom.ker (reduction p n r h) = Ideal.span {(p : GaloisRing p n r) ^ m} := sorry

/-- The Galois subrings: the fixed subring of `σ^e` is `GR(p^n, e)` for `e ∣ r`. -/
theorem nonempty_fixed_equiv (hn : 1 ≤ n) (e : ℕ) (he : e ∣ r) (he0 : 1 ≤ e) :
    Nonempty ({x : GaloisRing p n r // (frobenius p n r ^ e) x = x} ≃ GaloisRing p n e) := sorry

/-- Not every subring is Galois: `ZMod 4 + 2 GR(4, 2)` has eight elements. -/
theorem card_zmod_add_two_mul [Fact (Nat.Prime 2)] :
    Nat.card {x : GaloisRing 2 2 2 // ∃ a : ZMod (2 ^ 2), ∃ b : GaloisRing 2 2 2,
      x = algebraMap (ZMod (2 ^ 2)) (GaloisRing 2 2 2) a + 2 * b} = 8 := sorry

/-- The trace of `GR(p^n, r)` over `ZMod p^n` is the sum of Galois conjugates. -/
theorem trace_eq_sum_frobenius (hn : 1 ≤ n) (hr : 1 ≤ r) (x : GaloisRing p n r) :
    algebraMap (ZMod (p ^ n)) (GaloisRing p n r) (Algebra.trace (ZMod (p ^ n)) (GaloisRing p n r) x) =
      ∑ k : Fin r, (frobenius p n r ^ (k : ℕ)) x := sorry

theorem trace_surjective (hn : 1 ≤ n) (hr : 1 ≤ r) :
    Function.Surjective (Algebra.trace (ZMod (p ^ n)) (GaloisRing p n r)) := sorry

theorem existsUnique_trace_dual (hn : 1 ≤ n) (hr : 1 ≤ r)
    (L : GaloisRing p n r →ₗ[ZMod (p ^ n)] ZMod (p ^ n)) :
    ∃! b : GaloisRing p n r, ∀ x, L x = Algebra.trace (ZMod (p ^ n)) (GaloisRing p n r) (b * x) :=
  sorry

end GaloisRing

/-- A finite commutative local ring is Henselian. -/
theorem henselianLocalRing_of_finite {R : Type*} [CommRing R] [Finite R] [IsLocalRing R] :
    HenselianLocalRing R := sorry

end GaloisRings

/-! ### Linearized polynomials -/

section Linearized

open Polynomial

/-- A polynomial is `q`-linearized if every exponent in its support is a power of `q`. -/
def _root_.Polynomial.IsLinearized {K : Type*} [CommSemiring K] (q : ℕ) (L : K[X]) : Prop :=
  ∀ n ∈ L.support, ∃ i, n = q ^ i

/-- The `q`-polynomial `∑ aᵢ X^{q^i}` with coefficients `a`. -/
noncomputable def _root_.Polynomial.linearizedOf {K : Type*} [CommSemiring K] (q : ℕ) (a : ℕ →₀ K) :
    K[X] :=
  a.sum fun i c => C c * X ^ (q ^ i)

namespace IsLinearizedAPI

variable {K : Type*} [CommSemiring K] {q : ℕ}

theorem _root_.Polynomial.IsLinearized.X : (X : K[X]).IsLinearized q := sorry

theorem _root_.Polynomial.IsLinearized.X_pow_pow (i : ℕ) : (X ^ (q ^ i) : K[X]).IsLinearized q := sorry

theorem _root_.Polynomial.IsLinearized.add {L M : K[X]} (hL : L.IsLinearized q)
    (hM : M.IsLinearized q) : (L + M).IsLinearized q := sorry

theorem _root_.Polynomial.IsLinearized.C_mul {L : K[X]} (c : K) (hL : L.IsLinearized q) :
    (C c * L).IsLinearized q := sorry

theorem _root_.Polynomial.IsLinearized.eq_linearizedOf (hq : 2 ≤ q) {L : K[X]}
    (hL : L.IsLinearized q) :
    ∃ a : ℕ →₀ K, L = linearizedOf q a ∧ ∀ i, a i = L.coeff (q ^ i) := sorry

theorem _root_.Polynomial.isLinearized_linearizedOf (a : ℕ →₀ K) :
    (linearizedOf q a).IsLinearized q := sorry

/-- Unit test `IsLinearized.X_pow_sub_X`: `X^p - X` is `p`-linearized over `ZMod p`. -/
example (p : ℕ) [Fact p.Prime] : (X ^ p - X : (ZMod p)[X]).IsLinearized p := sorry

/-- Unit test `IsLinearized.not_X_sq_add_one`: `X² + 1` is not `2`-linearized. -/
example : ¬ (X ^ 2 + 1 : (ZMod 2)[X]).IsLinearized 2 := sorry

/-- Unit test `IsLinearized.not_X_cube`: `X³` is not `2`-linearized. -/
example : ¬ (X ^ 3 : (ZMod 2)[X]).IsLinearized 2 := sorry

/-- Unit test `IsLinearized.zero`: `0` is linearized. -/
example : (0 : K[X]).IsLinearized q := sorry

/-- Unit test `IsLinearized.linearizedOf_single`: the single-coefficient `q`-polynomial. -/
example (i : ℕ) (c : K) : linearizedOf q (Finsupp.single i c) = C c * X ^ (q ^ i) := sorry

end IsLinearizedAPI

/-- Evaluation of a `q`-polynomial is `F`-linear (`F` the field with `q` elements). -/
noncomputable def _root_.Polynomial.IsLinearized.toLinearMap {F K E : Type*} [Field F] [Fintype F]
    [Field K] [Algebra F K] [CommRing E] [Algebra K E] [Algebra F E] [IsScalarTower F K E]
    {L : K[X]} (hL : L.IsLinearized (Fintype.card F)) : E →ₗ[F] E := sorry

theorem _root_.Polynomial.IsLinearized.toLinearMap_apply {F K E : Type*} [Field F] [Fintype F]
    [Field K] [Algebra F K] [CommRing E] [Algebra K E] [Algebra F E] [IsScalarTower F K E]
    {L : K[X]} (hL : L.IsLinearized (Fintype.card F)) (x : E) :
    hL.toLinearMap x = aeval x L := sorry

/-- Composition closure of `q`-polynomials in characteristic `p`. -/
theorem _root_.Polynomial.IsLinearized.comp {K : Type*} [CommRing K] {p e : ℕ} [Fact p.Prime]
    [CharP K p] {L M : K[X]} (hL : L.IsLinearized (p ^ e)) (hM : M.IsLinearized (p ^ e)) :
    (L.comp M).IsLinearized (p ^ e) := sorry

/-- The roots of a `q`-polynomial form an `F`-subspace. -/
theorem _root_.Polynomial.IsLinearized.rootSet_eq_ker {F K E : Type*} [Field F] [Fintype F]
    [Field K] [Algebra F K] [Field E] [Algebra K E] [Algebra F E] [IsScalarTower F K E]
    {L : K[X]} (hL : L.IsLinearized (Fintype.card F)) (hL0 : L ≠ 0) :
    L.rootSet E = ((LinearMap.ker (hL.toLinearMap (F := F) (E := E))) : Set E) := sorry

/-- A nonzero `q`-polynomial is separable iff its coefficient of `X` is nonzero. -/
theorem _root_.Polynomial.IsLinearized.separable_iff {K : Type*} [Field K] {p e : ℕ} [Fact p.Prime]
    [CharP K p] (he : 1 ≤ e) {L : K[X]} (hL : L.IsLinearized (p ^ e)) (hL0 : L ≠ 0) :
    L.Separable ↔ L.coeff 1 ≠ 0 := sorry

/-- The subspace polynomial `∏_{u ∈ U} (X - u)` of a finite subspace. -/
noncomputable def subspacePolynomial {F E : Type*} [Field F] [Field E] [Algebra F E]
    (U : Submodule F E) [Fintype U] : E[X] :=
  ∏ u : U, (X - C (u : E))

section Subspace

variable {F E : Type*} [Field F] [Fintype F] [Field E] [Algebra F E]

theorem subspacePolynomial_monic (U : Submodule F E) [Fintype U] : (subspacePolynomial U).Monic :=
  sorry

theorem subspacePolynomial_natDegree (U : Submodule F E) [Fintype U] :
    (subspacePolynomial U).natDegree = Fintype.card F ^ Module.finrank F U := sorry

theorem mem_rootSet_subspacePolynomial (U : Submodule F E) [Fintype U] (x : E) :
    x ∈ (subspacePolynomial U).rootSet E ↔ x ∈ U := sorry

theorem subspacePolynomial_separable (U : Submodule F E) [Fintype U] :
    (subspacePolynomial U).Separable := sorry

theorem subspacePolynomial_injective {U V : Submodule F E} [Fintype U] [Fintype V]
    (h : subspacePolynomial U = subspacePolynomial V) : U = V := sorry

/-- **Subspace polynomials are linearized.** -/
theorem subspacePolynomial_isLinearized (U : Submodule F E) [Fintype U] :
    (subspacePolynomial U).IsLinearized (Fintype.card F) := sorry

/-- Unit test `subspacePolynomial_bot`: the subspace polynomial of `⊥` is `X`. -/
example [Fintype (⊥ : Submodule F E)] : subspacePolynomial (⊥ : Submodule F E) = X := sorry

/-- Unit test `subspacePolynomial_range_algebraMap`: for the image of `F`, it is `X^q - X`. -/
example [Fintype (LinearMap.range (Algebra.linearMap F E))] :
    subspacePolynomial (LinearMap.range (Algebra.linearMap F E)) = X ^ Fintype.card F - X := sorry

/-- Unit test `subspacePolynomial_not_of_nonsubspace`: for a non-subspace `{0, 1, a}` of `F₄` the
product `∏ (X - u)` is not `2`-linearized. -/
example (a : GaloisField 2 2) (ha : a ≠ 0 ∧ a ≠ 1) :
    ¬ (X * (X - 1) * (X - C a) : (GaloisField 2 2)[X]).IsLinearized 2 := sorry

/-- Unit test `subspacePolynomial_natDegree`: the degree is `q ^ dim U`. -/
example (U : Submodule F E) [Fintype U] :
    (subspacePolynomial U).natDegree = Fintype.card F ^ Module.finrank F U :=
  subspacePolynomial_natDegree U

end Subspace

/-- The linearized `q`-associate `∑ aᵢ X^{q^i}` of `∑ aᵢ X^i`. -/
noncomputable def linearizedAssociate {K : Type*} [CommSemiring K] (q : ℕ) : K[X] →+ K[X] where
  toFun l := l.sum fun i a => C a * X ^ (q ^ i)
  map_zero' := sorry
  map_add' := sorry

section Associate

variable {K : Type*} [CommSemiring K]

theorem linearizedAssociate_X_pow (q i : ℕ) : linearizedAssociate q (X ^ i : K[X]) = X ^ (q ^ i) :=
  sorry

theorem linearizedAssociate_injective {q : ℕ} (hq : 2 ≤ q) :
    Function.Injective (linearizedAssociate q : K[X] → K[X]) := sorry

theorem linearizedAssociate_mul {F : Type*} [Field F] [Fintype F] (l m : F[X]) :
    linearizedAssociate (Fintype.card F) (l * m) =
      (linearizedAssociate (Fintype.card F) l).comp (linearizedAssociate (Fintype.card F) m) := sorry

theorem linearizedAssociate_X_pow_sub_one {K : Type*} [CommRing K] (q n : ℕ) :
    linearizedAssociate q (X ^ n - 1 : K[X]) = X ^ (q ^ n) - X := sorry

/-- Unit test `linearizedAssociate_X_sub_one`: the associate of `X - 1` is `X^q - X`. -/
example {K : Type*} [CommRing K] (q : ℕ) : linearizedAssociate q (X - 1 : K[X]) = X ^ q - X := sorry

/-- Unit test `linearizedAssociate_one`: the associate of `1` is `X`. -/
example (q : ℕ) : linearizedAssociate q (1 : K[X]) = X := sorry

/-- Unit test `linearizedAssociate_mul_noncomm`: with coefficients outside `F₂`, composition of
`2`-polynomials does not commute. -/
example (a : GaloisField 2 2) (ha : a ∉ Set.range (algebraMap (ZMod 2) (GaloisField 2 2))) :
    (C a * X).comp (X ^ 2) ≠ (X ^ 2 : (GaloisField 2 2)[X]).comp (C a * X) := sorry

/-- Unit test `linearizedAssociate_isLinearized`: associates are linearized. -/
example (q : ℕ) (l : K[X]) : (linearizedAssociate q l).IsLinearized q := sorry

end Associate

/-- A `q`-polynomial permutes a finite field iff `0` is its only root there. -/
theorem _root_.Polynomial.IsLinearized.bijective_iff {F K : Type*} [Field F] [Fintype F] [Field K]
    [Fintype K] [Algebra F K] {L : K[X]} (hL : L.IsLinearized (Fintype.card F)) :
    Function.Bijective (fun x : K => L.eval x) ↔ ∀ x : K, L.eval x = 0 → x = 0 := sorry

/-- The associate gcd criterion. -/
theorem linearizedAssociate_bijective_iff {F E : Type*} [Field F] [Fintype F] [Field E] [Fintype E]
    [Algebra F E] {m : ℕ} (hm : Module.finrank F E = m) (l : F[X]) (hl : l.natDegree < m) :
    Function.Bijective (fun x : E => aeval x (linearizedAssociate (Fintype.card F) l)) ↔
      IsCoprime l (X ^ m - 1) := sorry

/-- The Dickson matrix `(a_{(j - i) mod m}^{q^i})` of `L = ∑_{i<m} aᵢ X^{q^i}`. -/
def dicksonMatrix {E : Type*} [CommRing E] (q m : ℕ) (a : Fin m → E) : Matrix (Fin m) (Fin m) E :=
  fun i j => a (j - i) ^ (q ^ (i : ℕ))

/-- **Dickson's criterion**: rank and determinant of `x ↦ L(x)` are those of the Dickson matrix. -/
theorem det_toLinearMap_eq_det_dicksonMatrix {F E : Type*} [Field F] [Fintype F] [Field E]
    [Fintype E] [Algebra F E] {m : ℕ} (hm : Module.finrank F E = m) [NeZero m] (a : Fin m → E)
    (hL : (∑ i, C (a i) * X ^ (Fintype.card F ^ (i : ℕ)) : E[X]).IsLinearized (Fintype.card F)) :
    algebraMap F E (LinearMap.det (hL.toLinearMap (F := F) (E := E))) =
      (dicksonMatrix (Fintype.card F) m a).det := sorry

theorem rank_toLinearMap_eq_rank_dicksonMatrix {F E : Type*} [Field F] [Fintype F] [Field E]
    [Fintype E] [Algebra F E] {m : ℕ} (hm : Module.finrank F E = m) [NeZero m] (a : Fin m → E)
    (hL : (∑ i, C (a i) * X ^ (Fintype.card F ^ (i : ℕ)) : E[X]).IsLinearized (Fintype.card F)) :
    Module.finrank F (LinearMap.range (hL.toLinearMap (F := F) (E := E))) =
      (dicksonMatrix (Fintype.card F) m a).rank := sorry

end Linearized

/-! ### Permutation polynomials -/

section Permutation

open Polynomial

/-- `f` permutes the finite field `F`. -/
def IsPermutationPolynomial {F : Type*} [Field F] (f : F[X]) : Prop :=
  Function.Bijective fun x : F => f.eval x

namespace IsPermutationPolynomial

variable {F : Type*} [Field F] [Fintype F]

theorem iff_injective (f : F[X]) :
    IsPermutationPolynomial f ↔ Function.Injective fun x : F => f.eval x := sorry

theorem iff_surjective (f : F[X]) :
    IsPermutationPolynomial f ↔ Function.Surjective fun x : F => f.eval x := sorry

theorem comp {f g : F[X]} (hf : IsPermutationPolynomial f) (hg : IsPermutationPolynomial g) :
    IsPermutationPolynomial (f.comp g) := sorry

theorem linear (a b : F) : IsPermutationPolynomial (C a * X + C b) ↔ a ≠ 0 := sorry

/-- The permutation of `F` defined by a permutation polynomial. -/
noncomputable def toEquiv {f : F[X]} (hf : IsPermutationPolynomial f) : Equiv.Perm F :=
  Equiv.ofBijective _ hf

/-- Unit test `IsPermutationPolynomial.X_cube_add_one_zmod_eleven`. -/
example [Fact (Nat.Prime 11)] : IsPermutationPolynomial (X ^ 3 + 1 : (ZMod 11)[X]) := sorry

/-- Unit test `IsPermutationPolynomial.not_quadratic_zmod_eleven`. -/
example [Fact (Nat.Prime 11)] : ¬ IsPermutationPolynomial (X ^ 2 + 3 * X + 5 : (ZMod 11)[X]) := sorry

/-- Unit test `IsPermutationPolynomial.X`: `X` permutes, a constant does not. -/
example (c : F) (h : 2 ≤ Fintype.card F) :
    IsPermutationPolynomial (X : F[X]) ∧ ¬ IsPermutationPolynomial (C c) := sorry

/-- Unit test `IsPermutationPolynomial.iff_modByMonic`. -/
example (f : F[X]) :
    IsPermutationPolynomial f ↔ IsPermutationPolynomial (f %ₘ (X ^ Fintype.card F - X)) := sorry

end IsPermutationPolynomial

theorem card_permutationPolynomial_degree_lt {F : Type*} [Field F] [Fintype F] [DecidableEq F] :
    Nat.card {f : F[X] // f.natDegree < Fintype.card F ∧ IsPermutationPolynomial f} =
      (Fintype.card F).factorial := sorry

/-- Power sums detect enumerations of a finite field. -/
theorem bijective_iff_sum_pow {F : Type*} [Field F] [Fintype F] (a : Fin (Fintype.card F) → F) :
    Function.Bijective a ↔
      (∀ t < Fintype.card F - 1, ∑ i, a i ^ t = 0) ∧ ∑ i, a i ^ (Fintype.card F - 1) = -1 := sorry

/-- The `X^{q-1}`-coefficient of `g mod (X^q - X)` is `-∑ g(c)`. -/
theorem coeff_modByMonic_X_pow_card_sub_X {F : Type*} [Field F] [Fintype F] (g : F[X]) :
    (g %ₘ (X ^ Fintype.card F - X)).coeff (Fintype.card F - 1) = -∑ c : F, g.eval c := sorry

/-- **Hermite's criterion.** -/
theorem hermite_criterion {F : Type*} [Field F] [Fintype F] {p : ℕ} [CharP F p] (f : F[X]) :
    IsPermutationPolynomial f ↔
      ((f ^ (Fintype.card F - 1)) %ₘ (X ^ Fintype.card F - X)).natDegree = Fintype.card F - 1 ∧
      ∀ t, 1 ≤ t → t ≤ Fintype.card F - 2 → ¬ p ∣ t →
        ((f ^ t) %ₘ (X ^ Fintype.card F - X)).natDegree ≤ Fintype.card F - 2 := sorry

/-- **Hermite's criterion**, one-root form. -/
theorem hermite_criterion_one_root {F : Type*} [Field F] [Fintype F] {p : ℕ} [CharP F p]
    (f : F[X]) :
    IsPermutationPolynomial f ↔
      (∃! x : F, f.eval x = 0) ∧
      ∀ t, 1 ≤ t → t ≤ Fintype.card F - 2 → ¬ p ∣ t →
        ((f ^ t) %ₘ (X ^ Fintype.card F - X)).natDegree ≤ Fintype.card F - 2 := sorry

/-- The character-sum criterion. -/
theorem isPermutationPolynomial_iff_sum_addChar {F : Type*} [Field F] [Fintype F] (f : F[X]) :
    IsPermutationPolynomial f ↔ ∀ ψ : AddChar F ℂ, ψ ≠ 1 → ∑ c : F, ψ (f.eval c) = 0 := sorry

/-- `X^n` permutes `F_q` iff `gcd(n, q - 1) = 1`. -/
theorem isPermutationPolynomial_X_pow_iff {F : Type*} [Field F] [Fintype F] {n : ℕ} (hn : 1 ≤ n) :
    IsPermutationPolynomial (X ^ n : F[X]) ↔ Nat.Coprime n (Fintype.card F - 1) := sorry

/-- No permutation polynomial has degree `n ≥ 2` dividing `q - 1`. -/
theorem not_isPermutationPolynomial_of_natDegree_dvd {F : Type*} [Field F] [Fintype F] (f : F[X])
    (hn : 2 ≤ f.natDegree) (hdvd : f.natDegree ∣ Fintype.card F - 1) : ¬ IsPermutationPolynomial f :=
  sorry

/-- `D_n(x + y, a) = x^n + y^n` when `xy = a`. -/
theorem dickson_eval_add_of_mul_eq {R : Type*} [CommRing R] (a x y : R) (h : x * y = a) (n : ℕ) :
    (dickson 1 a n).eval (x + y) = x ^ n + y ^ n := sorry

/-- The parametrisation of `F_q` by `u + a/u` with `u ∈ F_q^×` or `u^{q+1} = a`. -/
theorem exists_eq_add_div_of_quadratic {F L : Type*} [Field F] [Fintype F] [Field L] [Algebra F L]
    (hL : Module.finrank F L = 2) (a : F) (ha : a ≠ 0) (x : F) :
    ∃ u : L, u ≠ 0 ∧ algebraMap F L x = u + algebraMap F L a / u ∧
      (u ^ (Fintype.card F - 1) = 1 ∨ u ^ (Fintype.card F + 1) = algebraMap F L a) := sorry

/-- **Dickson's theorem.** -/
theorem isPermutationPolynomial_dickson_iff {F : Type*} [Field F] [Fintype F] {a : F} (ha : a ≠ 0)
    {n : ℕ} (hn : 1 ≤ n) :
    IsPermutationPolynomial (dickson 1 a n) ↔ Nat.Coprime n (Fintype.card F ^ 2 - 1) := sorry

end Permutation

/-! ### Linear recurring sequences, m-sequences and correlations -/

section Sequences

open Polynomial

/-- The shift of a sequence. -/
def seqShift {α : Type*} (s : ℕ → α) : ℕ → α := fun n => s (n + 1)

/-- The least period of a sequence (`0` if it is not purely periodic). -/
noncomputable def seqLeastPeriod {α : Type*} (s : ℕ → α) : ℕ :=
  Function.minimalPeriod seqShift s

section Period

variable {α : Type*}

theorem isPeriodicPt_seqShift_iff (s : ℕ → α) (T : ℕ) :
    Function.IsPeriodicPt seqShift T s ↔ ∀ n, s (n + T) = s n := sorry

theorem seqLeastPeriod_dvd_of_periodic {s : ℕ → α} {T : ℕ} (h : ∀ n, s (n + T) = s n) :
    seqLeastPeriod s ∣ T := sorry

theorem periodic_seqLeastPeriod (s : ℕ → α) (n : ℕ) : s (n + seqLeastPeriod s) = s n := sorry

theorem seqLeastPeriod_pos_iff (s : ℕ → α) :
    0 < seqLeastPeriod s ↔ ∃ T > 0, ∀ n, s (n + T) = s n := sorry

theorem seqLeastPeriod_seqShift {s : ℕ → α} (h : 0 < seqLeastPeriod s) :
    seqLeastPeriod (seqShift s) = seqLeastPeriod s := sorry

/-- Unit test `seqLeastPeriod_fibonacci_zmod_two`: the Fibonacci sequence mod `2` has period `3`. -/
example : seqLeastPeriod (fun n => (Nat.fib n : ZMod 2)) = 3 := sorry

/-- Unit test `seqLeastPeriod_const`: constant sequences have period `1`. -/
example (a : α) : seqLeastPeriod (fun _ : ℕ => a) = 1 := sorry

/-- Unit test `seqLeastPeriod_not_purely_periodic`: `1, 0, 0, …` has least period `0`. -/
example : seqLeastPeriod (fun n : ℕ => if n = 0 then (1 : ZMod 2) else 0) = 0 := sorry

/-- Unit test `seqLeastPeriod_eq_minimalPeriod`: compatibility with `Function.minimalPeriod`. -/
example (s : ℕ → α) : seqLeastPeriod s = Function.minimalPeriod seqShift s := rfl

end Period

/-- The order of a polynomial: the multiplicative order of `X` modulo `f`. -/
noncomputable def polyOrder {F : Type*} [Field F] (f : F[X]) : ℕ :=
  orderOf (AdjoinRoot.root f)

section Order

variable {F : Type*} [Field F]

theorem dvd_X_pow_polyOrder_sub_one (f : F[X]) : f ∣ X ^ polyOrder f - 1 := sorry

theorem dvd_X_pow_sub_one_iff_polyOrder_dvd (f : F[X]) (e : ℕ) :
    f ∣ X ^ e - 1 ↔ polyOrder f ∣ e := sorry

theorem polyOrder_pos_iff [Finite F] {f : F[X]} (hf : f ≠ 0) : 0 < polyOrder f ↔ f.coeff 0 ≠ 0 :=
  sorry

theorem polyOrder_dvd_card_pow_sub_one [Fintype F] {f : F[X]} (hf : Irreducible f) :
    polyOrder f ∣ Fintype.card F ^ f.natDegree - 1 := sorry

theorem polyOrder_eq_orderOf {L : Type*} [Field L] [Algebra F L] {f : F[X]} (hf : Irreducible f)
    {α : L} (hα : aeval α f = 0) : polyOrder f = orderOf α := sorry

theorem polyOrder_reverse {f : F[X]} (hf : f.coeff 0 ≠ 0) : polyOrder f.reverse = polyOrder f :=
  sorry

/-- Unit test `polyOrder_X_pow_four_add_X_add_one`. -/
example : polyOrder (X ^ 4 + X + 1 : (ZMod 2)[X]) = 15 := sorry

/-- Unit test `polyOrder_X_sq_add_X_add_one`. -/
example : polyOrder (X ^ 2 + X + 1 : (ZMod 2)[X]) = 3 := sorry

/-- Unit test `polyOrder_X`: `X` is not invertible modulo `X`, so its order is `0`. -/
example : polyOrder (X : F[X]) = 0 := sorry

/-- Unit test `polyOrder_X_add_one_sq`. -/
example : polyOrder ((X + 1) ^ 2 : (ZMod 2)[X]) = 2 := sorry

end Order

/-- Primitive polynomials over a finite field. -/
def IsPrimitivePoly {F : Type*} [Field F] [Fintype F] (f : F[X]) : Prop :=
  f.Monic ∧ Irreducible f ∧ 1 ≤ f.natDegree ∧ polyOrder f = Fintype.card F ^ f.natDegree - 1

section Primitive

variable {F : Type*} [Field F] [Fintype F]

theorem IsPrimitivePoly.irreducible {f : F[X]} (hf : IsPrimitivePoly f) : Irreducible f := hf.2.1

theorem isPrimitivePoly_iff_polyOrder {f : F[X]} (hm : f.Monic) (hd : 1 ≤ f.natDegree)
    (h0 : f.coeff 0 ≠ 0) :
    IsPrimitivePoly f ↔ polyOrder f = Fintype.card F ^ f.natDegree - 1 := sorry

theorem IsPrimitivePoly.root_zpowers {f : F[X]} (hf : IsPrimitivePoly f) :
    ∃ u : (AdjoinRoot f)ˣ, (u : AdjoinRoot f) = AdjoinRoot.root f ∧
      ∀ v : (AdjoinRoot f)ˣ, v ∈ Subgroup.zpowers u := sorry

theorem isPrimitivePoly_minpoly {L : Type*} [Field L] [Fintype L] [Algebra F L] {γ : Lˣ}
    (hγ : ∀ v : Lˣ, v ∈ Subgroup.zpowers γ) : IsPrimitivePoly (minpoly F (γ : L)) := sorry

theorem card_isPrimitivePoly (m : ℕ) (hm : 1 ≤ m) :
    Nat.card {f : F[X] // IsPrimitivePoly f ∧ f.natDegree = m} =
      Nat.totient (Fintype.card F ^ m - 1) / m := sorry

theorem IsPrimitivePoly.reverse {f : F[X]} (hf : IsPrimitivePoly f) :
    IsPrimitivePoly (C (f.coeff 0)⁻¹ * f.reverse) := sorry

/-- Unit test `IsPrimitivePoly.X_pow_four_add_X_add_one`. -/
example : IsPrimitivePoly (X ^ 4 + X + 1 : (ZMod 2)[X]) := sorry

/-- Unit test `IsPrimitivePoly.not_cyclotomic_five`. -/
example : Irreducible (X ^ 4 + X ^ 3 + X ^ 2 + X + 1 : (ZMod 2)[X]) ∧
    ¬ IsPrimitivePoly (X ^ 4 + X ^ 3 + X ^ 2 + X + 1 : (ZMod 2)[X]) := sorry

/-- Unit test `IsPrimitivePoly.X_sub_two_zmod_five`. -/
example [Fact (Nat.Prime 5)] :
    IsPrimitivePoly (X - C 2 : (ZMod 5)[X]) ∧ ¬ IsPrimitivePoly (X - C 4 : (ZMod 5)[X]) := sorry

/-- Unit test `IsPrimitivePoly.content_primitive_not`: Mathlib's content-primitivity differs. -/
example : (X ^ 4 + X ^ 3 + X ^ 2 + X + 1 : (ZMod 2)[X]).IsPrimitive ∧
    ¬ IsPrimitivePoly (X ^ 4 + X ^ 3 + X ^ 2 + X + 1 : (ZMod 2)[X]) := sorry

end Primitive

section Recurrences

variable {F : Type*} [Field F] [Fintype F]

/-- Linear recurring sequences over a finite ring are eventually periodic. -/
theorem LinearRecurrence.eventually_periodic {R : Type*} [CommRing R] [Finite R]
    (E : LinearRecurrence R) {u : ℕ → R} (hu : E.IsSolution u) :
    ∃ k, 0 < seqLeastPeriod (fun n => u (n + k)) := sorry

theorem LinearRecurrence.purely_periodic {R : Type*} [CommRing R] [Finite R] (E : LinearRecurrence R)
    (hpos : 0 < E.order) (h0 : IsUnit (E.coeffs ⟨0, hpos⟩)) {u : ℕ → R} (hu : E.IsSolution u) :
    0 < seqLeastPeriod u := sorry

/-- The period divides the order of the characteristic polynomial. -/
theorem LinearRecurrence.seqLeastPeriod_dvd_polyOrder (E : LinearRecurrence F)
    (h0 : E.charPoly.coeff 0 ≠ 0) {u : ℕ → F} (hu : E.IsSolution u) :
    seqLeastPeriod u ∣ polyOrder E.charPoly := sorry

/-- The impulse response has period exactly the order. -/
theorem LinearRecurrence.seqLeastPeriod_impulse (E : LinearRecurrence F) (hpos : 0 < E.order)
    (h0 : E.charPoly.coeff 0 ≠ 0) :
    seqLeastPeriod (E.mkSol fun i => if (i : ℕ) = 0 then 1 else 0) = polyOrder E.charPoly := sorry

/-- **Trace representation** of solutions with irreducible characteristic polynomial. -/
theorem LinearRecurrence.existsUnique_trace_repr (E : LinearRecurrence F)
    (hirr : Irreducible E.charPoly) {L : Type*} [Field L] [Algebra F L] [FiniteDimensional F L]
    (hdeg : Module.finrank F L = E.order) {β : L} (hβ : aeval β E.charPoly = 0) {u : ℕ → F}
    (hu : E.IsSolution u) : ∃! A : L, ∀ n, u n = Algebra.trace F L (A * β ^ n) := sorry

/-- A nonzero solution with irreducible characteristic polynomial has period equal to the order. -/
theorem LinearRecurrence.seqLeastPeriod_eq_polyOrder (E : LinearRecurrence F)
    (hirr : Irreducible E.charPoly) (hX : E.charPoly ≠ X) {u : ℕ → F} (hu : E.IsSolution u)
    (hu0 : u ≠ 0) : seqLeastPeriod u = polyOrder E.charPoly := sorry

end Recurrences

/-- m-sequences: nonzero solutions of a recurrence with primitive characteristic polynomial. -/
def IsMSequence {F : Type*} [Field F] [Fintype F] (m : ℕ) (u : ℕ → F) : Prop :=
  u ≠ 0 ∧ ∃ E : LinearRecurrence F, E.order = m ∧ IsPrimitivePoly E.charPoly ∧ E.IsSolution u

section MSequence

variable {F : Type*} [Field F] [Fintype F] {m : ℕ} {u : ℕ → F}

theorem IsMSequence.seqLeastPeriod_eq (hu : IsMSequence m u) :
    seqLeastPeriod u = Fintype.card F ^ m - 1 := sorry

theorem IsMSequence.exists_trace (hu : IsMSequence m u) {L : Type*} [Field L] [Fintype L]
    [Algebra F L] (hL : Module.finrank F L = m) :
    ∃ A : L, A ≠ 0 ∧ ∃ α : Lˣ, (∀ v : Lˣ, v ∈ Subgroup.zpowers α) ∧
      ∀ n, u n = Algebra.trace F L (A * (α : L) ^ n) := sorry

theorem IsMSequence.seqShift (hu : IsMSequence m u) : IsMSequence m (seqShift u) := sorry

theorem IsMSequence.decimate (hu : IsMSequence m u) {d : ℕ}
    (hd : Nat.Coprime d (Fintype.card F ^ m - 1)) : IsMSequence m (fun n => u (d * n)) := sorry

theorem IsMSequence.decimate_eq_shift_iff (hu : IsMSequence m u) {d : ℕ}
    (hd : Nat.Coprime d (Fintype.card F ^ m - 1)) :
    (∃ s, ∀ n, u (d * n) = u (n + s)) ↔
      ∃ j, d ≡ Fintype.card F ^ j [MOD Fintype.card F ^ m - 1] := sorry

/-- States of an m-sequence run through all nonzero vectors. -/
theorem IsMSequence.states_bijOn (hu : IsMSequence m u) :
    Set.BijOn (fun n : ℕ => (fun i : Fin m => u (n + i))) (Set.Iio (Fintype.card F ^ m - 1))
      {v : Fin m → F | v ≠ 0} := sorry

/-- Balance of m-sequences. -/
theorem IsMSequence.card_occurrences [DecidableEq F] (hu : IsMSequence m u) (hm : 1 ≤ m) (c : F) :
    ((Finset.range (Fintype.card F ^ m - 1)).filter fun n => u n = c).card =
      if c = 0 then Fintype.card F ^ (m - 1) - 1 else Fintype.card F ^ (m - 1) := sorry

/-- The shift-and-add property. -/
theorem IsMSequence.shift_add (hu : IsMSequence m u) (c : F) (τ : ℕ) :
    (∀ n, u n + c * u (n + τ) = 0) ∨ ∃ s, ∀ n, u n + c * u (n + τ) = u (n + s) := sorry

/-- Unit test `IsMSequence.fibonacci_zmod_two`. -/
example : IsMSequence 2 (fun n => (Nat.fib n : ZMod 2)) := sorry

/-- Unit test `IsMSequence.goresky_klapper_example`: `u(n+4) = u(n+1) + u(n)` over `ZMod 2`. -/
example (u : ℕ → ZMod 2) (h0 : u 0 = 1) (h1 : u 1 = 1) (h2 : u 2 = 1) (h3 : u 3 = 1)
    (hrec : ∀ n, u (n + 4) = u (n + 1) + u n) : IsMSequence 4 u ∧ seqLeastPeriod u = 15 := sorry

/-- Unit test `IsMSequence.not_period_five`. -/
example (u : ℕ → ZMod 2) (h0 : u 0 = 1) (h1 : u 1 = 0) (h2 : u 2 = 0) (h3 : u 3 = 0)
    (hrec : ∀ n, u (n + 4) = u (n + 3) + u (n + 2) + u (n + 1) + u n) : ¬ IsMSequence 4 u := sorry

/-- Unit test `IsMSequence.degree_one`: geometric sequences of generators. -/
example (g : Fˣ) (hg : ∀ v : Fˣ, v ∈ Subgroup.zpowers g) (c : F) (hc : c ≠ 0) :
    IsMSequence 1 (fun n => c * (g : F) ^ n) := sorry

/-- Unit test `IsMSequence.zero`: the zero sequence is not an m-sequence. -/
example : ¬ IsMSequence m (0 : ℕ → F) := fun h => h.1 rfl

end MSequence

/-- Periodic correlation of complex sequences over `T` terms. -/
noncomputable def periodicCorrelation (T : ℕ) (u v : ℕ → ℂ) (τ : ℕ) : ℂ :=
  ∑ i ∈ Finset.range T, u i * (starRingEnd ℂ) (v (i + τ))

/-- Correlation of group-valued sequences with respect to a character. -/
noncomputable def charCorrelation {G : Type*} [AddCommGroup G] (χ : AddChar G ℂ) (T : ℕ)
    (a b : ℕ → G) (τ : ℕ) : ℂ :=
  periodicCorrelation T (fun i => χ (a i)) (fun i => χ (b i)) τ

section Correlation

theorem charCorrelation_eq_sum_sub {G : Type*} [AddCommGroup G] [Finite G] (χ : AddChar G ℂ) (T : ℕ)
    (a b : ℕ → G) (τ : ℕ) :
    charCorrelation χ T a b τ = ∑ i ∈ Finset.range T, χ (a i - b (i + τ)) := sorry

theorem periodicCorrelation_add_period {T : ℕ} {u v : ℕ → ℂ} (hu : ∀ n, u (n + T) = u n)
    (hv : ∀ n, v (n + T) = v n) (τ : ℕ) :
    periodicCorrelation T u v (τ + T) = periodicCorrelation T u v τ := sorry

theorem periodicCorrelation_self_zero {T : ℕ} {u : ℕ → ℂ} (hu : ∀ n, ‖u n‖ = 1) :
    periodicCorrelation T u u 0 = T := sorry

theorem periodicCorrelation_conj {T : ℕ} {u v : ℕ → ℂ} (hu : ∀ n, u (n + T) = u n)
    (hv : ∀ n, v (n + T) = v n) {τ : ℕ} (hτ : τ ≤ T) :
    (starRingEnd ℂ) (periodicCorrelation T u v τ) = periodicCorrelation T v u (T - τ) := sorry

/-- Unit test `periodicCorrelation_const_one`. -/
example (T τ : ℕ) : periodicCorrelation T (fun _ => 1) (fun _ => 1) τ = T := sorry

/-- Unit test `periodicCorrelation_alternating`. -/
example : periodicCorrelation 2 (fun n => (-1 : ℂ) ^ n) (fun n => (-1 : ℂ) ^ n) 1 = -2 := sorry

/-- Unit test `periodicCorrelation_needs_conj`: the conjugate matters. -/
example : periodicCorrelation 1 (fun _ => Complex.I) (fun _ => Complex.I) 0 = 1 ∧
    (∑ i ∈ Finset.range 1, (fun _ => Complex.I) i * (fun _ => Complex.I) i) = -1 := sorry

/-- Unit test `charCorrelation_eq_sum_sub`. -/
example {G : Type*} [AddCommGroup G] [Finite G] (χ : AddChar G ℂ) (T : ℕ) (a b : ℕ → G) (τ : ℕ) :
    charCorrelation χ T a b τ = ∑ i ∈ Finset.range T, χ (a i - b (i + τ)) :=
  charCorrelation_eq_sum_sub χ T a b τ

/-- **Two-level autocorrelation** of m-sequences. -/
theorem IsMSequence.charCorrelation_self {F : Type*} [Field F] [Fintype F] {m : ℕ} {u : ℕ → F}
    (hu : IsMSequence m u) (χ : AddChar F ℂ) (hχ : χ ≠ 1) (τ : ℕ) :
    charCorrelation χ (Fintype.card F ^ m - 1) u u τ =
      if (Fintype.card F ^ m - 1) ∣ τ then ((Fintype.card F ^ m - 1 : ℕ) : ℂ) else -1 := sorry

/-- Cross-correlation of an m-sequence with its decimation as a character sum. -/
theorem charCorrelation_decimation {F L : Type*} [Field F] [Fintype F] [Field L] [Fintype L]
    [Algebra F L] (α : Lˣ) (hα : ∀ v : Lˣ, v ∈ Subgroup.zpowers α) (d : ℕ) (hd : 1 ≤ d)
    (χ : AddChar F ℂ) (t : ℕ) :
    charCorrelation χ (Fintype.card L - 1) (fun n => Algebra.trace F L ((α : L) ^ (d * n)))
      (fun n => Algebra.trace F L ((α : L) ^ n)) t =
      ∑ x : L, χ (Algebra.trace F L (x ^ d - (α : L) ^ t * x)) - 1 := sorry

end Correlation

/-- The Dirichlet sequence of a character with prescribed value `c` at multiples of `p`. -/
noncomputable def dirichletSeq {p : ℕ} (ψ : MulChar (ZMod p) ℂ) (c : ℂ) (n : ℕ) : ℂ :=
  if (n : ZMod p) = 0 then c else ψ n

/-- The Legendre sequence (value `1` at multiples of `p`). -/
noncomputable def legendreSeq (p : ℕ) [Fact p.Prime] (n : ℕ) : ℂ :=
  dirichletSeq ((quadraticChar (ZMod p)).ringHomComp (Int.castRingHom ℂ)) 1 n

section Dirichlet

variable {p : ℕ}

theorem dirichletSeq_add_p (ψ : MulChar (ZMod p) ℂ) (c : ℂ) (n : ℕ) :
    dirichletSeq ψ c (n + p) = dirichletSeq ψ c n := sorry

theorem dirichletSeq_of_not_dvd (ψ : MulChar (ZMod p) ℂ) (c : ℂ) {n : ℕ} (hn : ¬ p ∣ n) :
    dirichletSeq ψ c n = ψ n := sorry

theorem legendreSeq_sq_eq_one [Fact p.Prime] (hp : p ≠ 2) (n : ℕ) : legendreSeq p n ^ 2 = 1 := sorry

/-- Unit test `legendreSeq_three`. -/
example [Fact (Nat.Prime 3)] : legendreSeq 3 0 = 1 ∧ legendreSeq 3 1 = 1 ∧ legendreSeq 3 2 = -1 :=
  sorry

/-- Unit test `legendreSeq_five`. -/
example [Fact (Nat.Prime 5)] : (fun n : Fin 5 => legendreSeq 5 n) = ![1, 1, -1, -1, 1] := sorry

/-- Unit test `dirichletSeq_zero_eq`: with `c = 0` the sequence is the extended character. -/
example (ψ : MulChar (ZMod p) ℂ) (n : ℕ) : dirichletSeq ψ 0 n = ψ n := sorry

/-- Unit test `legendreSeq_ne_quadraticChar`: the Legendre sequence is not the extended
quadratic character at `0`. -/
example [Fact p.Prime] : legendreSeq p 0 = 1 ∧ quadraticChar (ZMod p) 0 = 0 := sorry

/-- Autocorrelation of Dirichlet sequences (Goresky–Klapper Proposition 14.8.1). -/
theorem dirichletSeq_autocorrelation [Fact p.Prime] (ψ : MulChar (ZMod p) ℂ) (hψ : ψ ≠ 1)
    {c : ℂ} (hc : c = 0 ∨ c = 1) {τ : ℕ} (hτ : ¬ p ∣ τ) :
    ∑ x ∈ Finset.range p, dirichletSeq ψ c (x + τ) * (starRingEnd ℂ) (dirichletSeq ψ c x) =
      -1 + c * (ψ τ + (starRingEnd ℂ) (ψ (-(τ : ZMod p)))) := sorry

theorem legendreSeq_autocorrelation [Fact p.Prime] (hp : p ≠ 2) {τ : ℕ} (hτ : ¬ p ∣ τ) :
    periodicCorrelation p (legendreSeq p) (legendreSeq p) τ =
      if p % 4 = 3 then -1 else -1 + 2 * legendreSeq p τ := sorry

end Dirichlet

end Sequences

/-! ### Evaluation codes: Singleton, MDS, Reed–Solomon, BCH

A linear code is a `Submodule F (ι → F)` (Tau Ceti's `TauCeti.LinearCode F ι`, an abbreviation of
exactly this type; Tau Ceti is not built here). -/

section Codes

open Polynomial

variable {F : Type*} [Field F] [DecidableEq F] {ι : Type*} [Fintype ι]

/-- Stand-in for the Euclidean dual `C^⊥` of AlgebraicCodingTheory Layer 2 (dot-product form, no
conjugation). -/
noncomputable def codeDual (C : Submodule F (ι → F)) : Submodule F (ι → F) :=
  LinearMap.BilinForm.orthogonal (dotProductBilin F F) C

/-- **The Singleton bound.** -/
theorem exists_hammingNorm_le_singleton (C : Submodule F (ι → F)) (hk : 1 ≤ Module.finrank F C) :
    ∃ c ∈ C, c ≠ 0 ∧ hammingNorm c + Module.finrank F C ≤ Fintype.card ι + 1 := sorry

/-- Maximum distance separable codes. -/
def IsMDS (C : Submodule F (ι → F)) : Prop :=
  ∀ c ∈ C, c ≠ 0 → Fintype.card ι + 1 ≤ hammingNorm c + Module.finrank F C

section MDS

theorem IsMDS.restrict_bijective {C : Submodule F (ι → F)} (hC : IsMDS C) (S : Finset ι)
    (hS : S.card = Module.finrank F C) :
    Function.Bijective (fun c : C => fun i : S => (c : ι → F) i) := sorry

theorem isMDS_iff_restrict_injective (C : Submodule F (ι → F)) :
    IsMDS C ↔ ∀ S : Finset ι, S.card = Module.finrank F C →
      Function.Injective (fun c : C => fun i : S => (c : ι → F) i) := sorry

theorem IsMDS.exists_weight_eq {C : Submodule F (ι → F)} (hC : IsMDS C) (hne : C ≠ ⊥) :
    ∃ c ∈ C, hammingNorm c + Module.finrank F C = Fintype.card ι + 1 := sorry

theorem IsMDS.map_diagonal {C : Submodule F (ι → F)} (hC : IsMDS C) (v : ι → F)
    (hv : ∀ i, v i ≠ 0) :
    IsMDS (C.map (LinearMap.pi fun i => v i • LinearMap.proj i)) := sorry

/-- Unit test `IsMDS.repetition`. -/
example [Nonempty ι] : IsMDS (Submodule.span F {fun _ : ι => (1 : F)}) := sorry

/-- Unit test `IsMDS.top`. -/
example : IsMDS (⊤ : Submodule F (ι → F)) := sorry

/-- Unit test `IsMDS.bot`. -/
example : IsMDS (⊥ : Submodule F (ι → F)) := sorry

/-- Unit test `IsMDS.not_two_by_two_repetition`. -/
example : ¬ IsMDS (Submodule.span (ZMod 2) {![1, 1, 0, 0], ![0, 0, 1, 1]} :
    Submodule (ZMod 2) (Fin 4 → ZMod 2)) := sorry

end MDS

/-- The Reed–Solomon encoding map `p ↦ (p(αᵢ))ᵢ` on polynomials of degree `< k`. -/
noncomputable def reedSolomonEncode (α : ι → F) (k : ℕ) : degreeLT F k →ₗ[F] (ι → F) :=
  (LinearMap.pi fun i => Polynomial.leval (α i)) ∘ₗ (degreeLT F k).subtype

/-- The Reed–Solomon code `RS(α, k)`. -/
noncomputable def reedSolomon (α : ι → F) (k : ℕ) : Submodule F (ι → F) :=
  LinearMap.range (reedSolomonEncode α k)

section RS

theorem mem_reedSolomon_iff (α : ι → F) (k : ℕ) (c : ι → F) :
    c ∈ reedSolomon α k ↔ ∃ p : F[X], p.degree < k ∧ ∀ i, c i = p.eval (α i) := sorry

theorem reedSolomonEncode_injective {α : ι → F} (hα : Function.Injective α) {k : ℕ}
    (hk : k ≤ Fintype.card ι) : Function.Injective (reedSolomonEncode α k) := sorry

theorem finrank_reedSolomon {α : ι → F} (hα : Function.Injective α) {k : ℕ}
    (hk : k ≤ Fintype.card ι) : Module.finrank F (reedSolomon α k) = k := sorry

set_option linter.unusedSectionVars false in
theorem card_le_card_of_reedSolomon [Fintype F] {α : ι → F} (hα : Function.Injective α) :
    Fintype.card ι ≤ Fintype.card F := Fintype.card_le_of_injective α hα

theorem reedSolomon_mono (α : ι → F) {k k' : ℕ} (h : k ≤ k') : reedSolomon α k ≤ reedSolomon α k' :=
  sorry

theorem reedSolomon_eq_top {α : ι → F} (hα : Function.Injective α) {k : ℕ}
    (hk : Fintype.card ι ≤ k) : reedSolomon α k = ⊤ := sorry

theorem reedSolomon_eq_range_vandermonde (α : ι → F) (k : ℕ) :
    reedSolomon α k =
      LinearMap.range (Matrix.vecMulLinear (Matrix.of fun (j : Fin k) (i : ι) => α i ^ (j : ℕ))) :=
  sorry

/-- **Minimum weight of Reed–Solomon codes.** -/
theorem le_hammingNorm_of_mem_reedSolomon {α : ι → F} (hα : Function.Injective α) {k : ℕ}
    (hk : k ≤ Fintype.card ι) {c : ι → F} (hc : c ∈ reedSolomon α k) (hc0 : c ≠ 0) :
    Fintype.card ι + 1 ≤ hammingNorm c + k := sorry

/-- **Reed–Solomon codes are MDS.** -/
theorem isMDS_reedSolomon {α : ι → F} (hα : Function.Injective α) {k : ℕ} (hk1 : 1 ≤ k)
    (hk : k ≤ Fintype.card ι) :
    IsMDS (reedSolomon α k) ∧ ∃ c ∈ reedSolomon α k, hammingNorm c + k = Fintype.card ι + 1 := sorry

/-- Unit test `reedSolomon_zmod_three_two`. -/
example : Nat.card (reedSolomon (id : ZMod 3 → ZMod 3) 2) = 9 ∧
    (![0, 1, 2] : ZMod 3 → ZMod 3) ∈ reedSolomon (id : ZMod 3 → ZMod 3) 2 := sorry

/-- Unit test `reedSolomon_zero`. -/
example (α : ι → F) : reedSolomon α 0 = ⊥ := sorry

/-- Unit test `reedSolomon_one`. -/
example (α : ι → F) : reedSolomon α 1 = Submodule.span F {fun _ => (1 : F)} := sorry

/-- Unit test `reedSolomon_repeated_points`. -/
example : Module.finrank F (reedSolomon (![0, 0] : Fin 2 → F) 2) = 1 := sorry

end RS

/-- Generalized Reed–Solomon codes `GRS(α, k, v)`. -/
noncomputable def generalizedReedSolomon (α : ι → F) (k : ℕ) (v : ι → F) : Submodule F (ι → F) :=
  (reedSolomon α k).map (LinearMap.pi fun i => v i • LinearMap.proj i)

section GRS

theorem mem_generalizedReedSolomon_iff (α : ι → F) (k : ℕ) (v : ι → F) (c : ι → F) :
    c ∈ generalizedReedSolomon α k v ↔ ∃ p : F[X], p.degree < k ∧ ∀ i, c i = v i * p.eval (α i) :=
  sorry

theorem finrank_generalizedReedSolomon {α : ι → F} (hα : Function.Injective α) {k : ℕ}
    (hk : k ≤ Fintype.card ι) {v : ι → F} (hv : ∀ i, v i ≠ 0) :
    Module.finrank F (generalizedReedSolomon α k v) = k := sorry

theorem isMDS_generalizedReedSolomon {α : ι → F} (hα : Function.Injective α) {k : ℕ}
    (hk : k ≤ Fintype.card ι) {v : ι → F} (hv : ∀ i, v i ≠ 0) :
    IsMDS (generalizedReedSolomon α k v) := sorry

/-- **The dual of a GRS code.** -/
theorem codeDual_generalizedReedSolomon [DecidableEq ι] {α : ι → F} (hα : Function.Injective α)
    {k : ℕ} (hk : k ≤ Fintype.card ι) {v : ι → F} (hv : ∀ i, v i ≠ 0) :
    codeDual (generalizedReedSolomon α k v) =
      generalizedReedSolomon α (Fintype.card ι - k)
        (fun i => (v i * ∏ j ∈ Finset.univ.erase i, (α i - α j))⁻¹) := sorry

/-- **Full-length Reed–Solomon duality.** -/
theorem codeDual_reedSolomon_id [Fintype F] {k : ℕ} (hk : k ≤ Fintype.card F) :
    codeDual (reedSolomon (id : F → F) k) = reedSolomon (id : F → F) (Fintype.card F - k) := sorry

/-- Reed–Solomon codes on `Fˣ` are cut out by power-sum checks. -/
theorem reedSolomon_pow_eq_check [Fintype F] (γ : Fˣ) (hγ : ∀ v : Fˣ, v ∈ Subgroup.zpowers γ)
    {k : ℕ} (hk1 : 1 ≤ k) (hk : k ≤ Fintype.card F - 1) :
    (reedSolomon (fun i : Fin (Fintype.card F - 1) => (γ : F) ^ (i : ℕ)) k : Set _) =
      {c : Fin (Fintype.card F - 1) → F | ∀ l, 1 ≤ l → l ≤ Fintype.card F - 1 - k →
        ∑ i : Fin (Fintype.card F - 1), c i * (γ : F) ^ ((i : ℕ) * l) = 0} := sorry

/-- Unit test `generalizedReedSolomon_one`. -/
example (α : ι → F) (k : ℕ) : generalizedReedSolomon α k 1 = reedSolomon α k := sorry

/-- Unit test `generalizedReedSolomon_zero`. -/
example (α : ι → F) (v : ι → F) : generalizedReedSolomon α 0 v = ⊥ := sorry

/-- Unit test `generalizedReedSolomon_ne_reedSolomon`. -/
example : generalizedReedSolomon (id : ZMod 3 → ZMod 3) 1 ![1, 1, 2] ≠
    reedSolomon (id : ZMod 3 → ZMod 3) 1 := sorry

/-- Unit test `finrank_generalizedReedSolomon_test`. -/
example [Fact (Nat.Prime 5)] :
    Module.finrank (ZMod 5) (generalizedReedSolomon (id : ZMod 5 → ZMod 5) 2 ![1, 2, 3, 4, 1]) = 2 :=
  sorry

end GRS

/-- The subfield subcode `C ∩ F^ι` of a code `C ≤ E^ι`. -/
noncomputable def subfieldSubcode (K : Type*) [Field K] {E : Type*} [Field E] [Algebra K E]
    (C : Submodule E (ι → E)) : Submodule K (ι → K) :=
  (C.restrictScalars K).comap (LinearMap.pi fun i => (Algebra.linearMap K E) ∘ₗ LinearMap.proj i)

section Subfield

variable {K : Type*} [Field K] [DecidableEq K] {E : Type*} [Field E] [DecidableEq E] [Algebra K E]

theorem mem_subfieldSubcode_iff (C : Submodule E (ι → E)) (x : ι → K) :
    x ∈ subfieldSubcode K C ↔ (fun i => algebraMap K E (x i)) ∈ C := sorry

theorem hammingNorm_le_of_mem_subfieldSubcode (C : Submodule E (ι → E)) (x : ι → K) :
    hammingNorm (fun i => algebraMap K E (x i)) = hammingNorm x := sorry

theorem finrank_subfieldSubcode_ge [FiniteDimensional K E] (C : Submodule E (ι → E)) :
    Fintype.card ι ≤ Module.finrank K (subfieldSubcode K C) +
      Module.finrank K E * (Fintype.card ι - Module.finrank E C) := sorry

theorem subfieldSubcode_mono {C D : Submodule E (ι → E)} (h : C ≤ D) :
    subfieldSubcode K C ≤ subfieldSubcode K D := sorry

/-- Unit test `subfieldSubcode_top`. -/
example : subfieldSubcode K (⊤ : Submodule E (ι → E)) = ⊤ := sorry

/-- Unit test `subfieldSubcode_self`. -/
example (C : Submodule K (ι → K)) : subfieldSubcode K C = C := sorry

/-- Unit test `subfieldSubcode_ne_trace_code`. -/
example (γ : GaloisField 2 2) (hγ : γ ∉ Set.range (algebraMap (ZMod 2) (GaloisField 2 2))) :
    subfieldSubcode (ZMod 2) (Submodule.span (GaloisField 2 2) {![1, γ]}) = ⊥ := sorry

/-- Unit test `finrank_subfieldSubcode_rs`. -/
example (γ : (GaloisField 2 2)ˣ) (hγ : ∀ v, v ∈ Subgroup.zpowers γ) :
    Module.finrank (ZMod 2)
      (subfieldSubcode (ZMod 2) (reedSolomon (fun i : Fin 3 => (γ : GaloisField 2 2) ^ (i : ℕ)) 2)) = 1 :=
  sorry

end Subfield

/-- Primitive narrow-sense BCH code of designed distance `δ`. -/
noncomputable def bchCode (K : Type*) [Field K] {E : Type*} [Field E] [Fintype E] [DecidableEq E]
    [Algebra K E] (γ : Eˣ) (δ : ℕ) : Submodule K (Fin (Fintype.card E - 1) → K) :=
  subfieldSubcode K
    (reedSolomon (fun i : Fin (Fintype.card E - 1) => (γ : E) ^ (i : ℕ)) (Fintype.card E - δ))

section BCH

variable {K : Type*} [Field K] [DecidableEq K] {E : Type*} [Field E] [Fintype E] [DecidableEq E]
  [Algebra K E]

theorem mem_bchCode_iff (γ : Eˣ) (hγ : ∀ v, v ∈ Subgroup.zpowers γ) {δ : ℕ} (hδ : 2 ≤ δ)
    (hδN : δ ≤ Fintype.card E - 1) (c : Fin (Fintype.card E - 1) → K) :
    c ∈ bchCode K γ δ ↔ ∀ l, 1 ≤ l → l ≤ δ - 1 →
      ∑ i, algebraMap K E (c i) * (γ : E) ^ ((i : ℕ) * l) = 0 := sorry

theorem bchCode_cyclic (γ : Eˣ) (hγ : ∀ v, v ∈ Subgroup.zpowers γ) {δ : ℕ} (hδ : 2 ≤ δ)
    [NeZero (Fintype.card E - 1)] {c : Fin (Fintype.card E - 1) → K} (hc : c ∈ bchCode K γ δ) :
    (fun i => c (i - 1)) ∈ bchCode K γ δ := sorry

theorem bchCode_antitone (γ : Eˣ) {δ δ' : ℕ} (h : δ ≤ δ') : bchCode K γ δ' ≤ bchCode K γ δ := sorry

/-- **The BCH bound.** -/
theorem le_hammingNorm_of_mem_bchCode (γ : Eˣ) (hγ : ∀ v, v ∈ Subgroup.zpowers γ) {δ : ℕ}
    (hδ : 2 ≤ δ) (hδN : δ ≤ Fintype.card E - 1) {c : Fin (Fintype.card E - 1) → K}
    (hc : c ∈ bchCode K γ δ) (hc0 : c ≠ 0) : δ ≤ hammingNorm c := sorry

/-- Dimension bound for BCH codes. -/
theorem finrank_bchCode_ge [FiniteDimensional K E] (γ : Eˣ) (hγ : ∀ v, v ∈ Subgroup.zpowers γ)
    {δ : ℕ} (hδ : 2 ≤ δ) (hδN : δ ≤ Fintype.card E - 1) :
    Fintype.card E - 1 ≤ Module.finrank K (bchCode K γ δ) + Module.finrank K E * (δ - 1) := sorry

/-- The improved dimension bound for binary BCH codes. -/
theorem finrank_bchCode_binary_ge {E : Type*} [Field E] [Fintype E] [DecidableEq E]
    [Algebra (ZMod 2) E] (γ : Eˣ) (hγ : ∀ v, v ∈ Subgroup.zpowers γ) {δ : ℕ} (hδ : 2 ≤ δ)
    (hδN : δ ≤ Fintype.card E - 1) :
    Fintype.card E - 1 ≤
      Module.finrank (ZMod 2) (bchCode (ZMod 2) γ δ) + Module.finrank (ZMod 2) E * ((δ - 1 + 1) / 2) :=
  sorry

/-- Unit test `bchCode_hamming`: the binary BCH code with `m = 3`, `δ = 3` is the `[7,4,3]` Hamming
code. -/
example [Fintype (GaloisField 2 3)] [DecidableEq (GaloisField 2 3)] (γ : (GaloisField 2 3)ˣ)
    (hγ : ∀ v, v ∈ Subgroup.zpowers γ) :
    Module.finrank (ZMod 2) (bchCode (ZMod 2) γ 3) = 4 ∧
      ∃ c ∈ bchCode (ZMod 2) γ 3, hammingNorm c = 3 := sorry

/-- Unit test `bchCode_fifteen_seven`. -/
example [Fintype (GaloisField 2 4)] [DecidableEq (GaloisField 2 4)] (γ : (GaloisField 2 4)ˣ) (hγ : ∀ v, v ∈ Subgroup.zpowers γ) :
    Module.finrank (ZMod 2) (bchCode (ZMod 2) γ 5) = 7 := sorry

/-- Unit test `bchCode_degree_one`: over `E = K` the BCH code is a Reed–Solomon code. -/
example [Fintype K] (γ : Kˣ) (δ : ℕ) :
    bchCode K γ δ =
      reedSolomon (fun i : Fin (Fintype.card K - 1) => (γ : K) ^ (i : ℕ)) (Fintype.card K - δ) :=
  sorry

/-- Unit test `bchCode_mem_iff_check`. -/
example (γ : Eˣ) (hγ : ∀ v, v ∈ Subgroup.zpowers γ) {δ : ℕ} (hδ : 2 ≤ δ)
    (hδN : δ ≤ Fintype.card E - 1) (c : Fin (Fintype.card E - 1) → K) :
    c ∈ bchCode K γ δ ↔ ∀ l, 1 ≤ l → l ≤ δ - 1 →
      ∑ i, algebraMap K E (c i) * (γ : E) ^ ((i : ℕ) * l) = 0 :=
  mem_bchCode_iff γ hγ hδ hδN c

end BCH

end Codes

/-! ### Algebraic geometry codes

These declarations are stated over Tau Ceti's function-field library (`TauCeti.Place`,
`TauCeti.Divisor`, `TauCeti.riemannRochSpace`, `TauCeti.Place.degree`,
`TauCeti.Place.residueFieldEquivOfDegreeEqOne`, `TauCeti.genus`,
`TauCeti.weilDifferentialFiltration`, `TauCeti.repartitionDualComponent`), which is not built in
the environment of this file. The `TC…` declarations below are local stand-ins with the same roles,
to be replaced by those Tau Ceti declarations: they are the only place where this file needs Tau
Ceti. -/

section AGCodes

open Polynomial

/-- Stand-in for `TauCeti.Place k F`. -/
def TCPlace (k F : Type*) [Field k] [Field F] [Algebra k F] : Type := sorry

/-- Stand-in for `TauCeti.Divisor k F = WeilDivisor (Place k F)`. -/
abbrev TCDivisor (k F : Type*) [Field k] [Field F] [Algebra k F] : Type := TCPlace k F →₀ ℤ

variable {k F : Type*} [Field k] [Field F] [Algebra k F]

/-- Stand-in for `TauCeti.Place.degree`. -/
noncomputable def TCPlace.degree : TCPlace k F → ℕ := sorry

/-- Stand-in for `TauCeti.Place.integers`. -/
noncomputable def TCPlace.integers : TCPlace k F → Subalgebra k F := sorry

/-- Stand-in for `TauCeti.Divisor.degree`. -/
noncomputable def TCDivisor.degree : TCDivisor k F → ℤ := sorry

/-- Stand-in for `TauCeti.riemannRochSpace`. -/
noncomputable def tcRiemannRochSpace : TCDivisor k F → Submodule k F := sorry

/-- Stand-in for `TauCeti.genus k F`. -/
noncomputable def tcGenus (k F : Type*) [Field k] [Field F] [Algebra k F] : ℕ := sorry

/-- Stand-in for the dual of Tau Ceti's repartition space `TauCeti.repartitionSpace k F`. -/
def TCRepartitionDual (k F : Type*) [Field k] [Field F] [Algebra k F] : Type := sorry

noncomputable instance : AddCommGroup (TCRepartitionDual k F) := sorry
noncomputable instance : Module k (TCRepartitionDual k F) := sorry

/-- Stand-in for `TauCeti.weilDifferentialFiltration`. -/
noncomputable def tcWeilDifferentialFiltration : TCDivisor k F → Submodule k (TCRepartitionDual k F) :=
  sorry

/-- Stand-in for `TauCeti.repartitionDualComponent ω P`, a `k`-linear form on `F`, as a linear map
in `ω`. -/
noncomputable def tcLocalComponent (P : TCPlace k F) : TCRepartitionDual k F →ₗ[k] Module.Dual k F :=
  sorry

/-- **Evaluation at a rational place**: `f ↦ f(P)` on the valuation ring of a degree-one place. -/
noncomputable def evalAtRational (P : TCPlace k F) (h : P.degree = 1) : P.integers →ₐ[k] k := sorry

theorem evalAtRational_algebraMap (P : TCPlace k F) (h : P.degree = 1) (c : k) :
    evalAtRational P h (algebraMap k P.integers c) = c := sorry

theorem evalAtRational_eq_zero_iff (P : TCPlace k F) (h : P.degree = 1) (f : P.integers) :
    evalAtRational P h f = 0 ↔ f ∈ RingHom.ker (evalAtRational P h).toRingHom := Iff.rfl

theorem evalAtRational_apply_ker (P : TCPlace k F) (h : P.degree = 1) :
    RingHom.ker (evalAtRational P h).toRingHom ≠ ⊤ := sorry

/-- Unit test `evalAtRational_algebraMap`. -/
example (P : TCPlace k F) (h : P.degree = 1) (c : k) :
    evalAtRational P h (algebraMap k P.integers c) = c := evalAtRational_algebraMap P h c

/-- Unit test `evalAtRational_ker`: the kernel is a proper ideal (the maximal ideal). -/
example (P : TCPlace k F) (h : P.degree = 1) : RingHom.ker (evalAtRational P h).toRingHom ≠ ⊤ :=
  evalAtRational_apply_ker P h

/-- Unit test `evalAtRational_X_ratFunc`: in `k(x)` the value of `x` at the place of `x - a` is
`a` (stated with a stand-in place `P` whose valuation ring contains `x`). -/
example (P : TCPlace k (RatFunc k)) (h : P.degree = 1) (a : k)
    (hx : algebraMap k[X] (RatFunc k) X ∈ P.integers)
    (hP : ∀ f : P.integers, evalAtRational P h f = 0 ↔ (f : RatFunc k) ∈
      Set.range (fun g : RatFunc k => (algebraMap k[X] (RatFunc k) (X - C a)) * g)) :
    evalAtRational P h ⟨algebraMap k[X] (RatFunc k) X, hx⟩ = a := sorry

/-- Unit test `evalAtRational_not_defined_at_pole`: `1/(x - a)` is not in the valuation ring of the
place of `x - a`. -/
example (P : TCPlace k (RatFunc k)) (a : k)
    (hP : ∀ f : RatFunc k, f ∈ P.integers ↔ ∃ g h : k[X], f = algebraMap _ _ g / algebraMap _ _ h ∧
      ¬ (X - C a) ∣ h) :
    (algebraMap k[X] (RatFunc k) (X - C a))⁻¹ ∉ P.integers := sorry

variable {n : ℕ}

/-- The evaluation map `L(G) → k^n`, `f ↦ (f(Pᵢ))ᵢ`, for rational places outside `supp G`. -/
noncomputable def agEvaluationMap (P : Fin n → TCPlace k F) (hP : ∀ i, (P i).degree = 1)
    (G : TCDivisor k F) (hG : ∀ i, G (P i) = 0) : tcRiemannRochSpace G →ₗ[k] (Fin n → k) := sorry

/-- The algebraic geometry evaluation code `C_L(D, G)`. -/
noncomputable def agEvaluationCode (P : Fin n → TCPlace k F) (hP : ∀ i, (P i).degree = 1)
    (G : TCDivisor k F) (hG : ∀ i, G (P i) = 0) : Submodule k (Fin n → k) :=
  LinearMap.range (agEvaluationMap P hP G hG)

/-- The divisor `D = P₁ + ⋯ + Pₙ`. -/
noncomputable def placesDivisor (P : Fin n → TCPlace k F) : TCDivisor k F :=
  ∑ i, Finsupp.single (P i) 1

theorem ker_agEvaluationMap (P : Fin n → TCPlace k F) (hP : ∀ i, (P i).degree = 1)
    (G : TCDivisor k F) (hG : ∀ i, G (P i) = 0) :
    Submodule.map (tcRiemannRochSpace G).subtype (LinearMap.ker (agEvaluationMap P hP G hG)) =
      tcRiemannRochSpace (G - placesDivisor P) := sorry

theorem agEvaluationCode_mono (P : Fin n → TCPlace k F) (hP : ∀ i, (P i).degree = 1)
    {G G' : TCDivisor k F} (hG : ∀ i, G (P i) = 0) (hG' : ∀ i, G' (P i) = 0) (hle : G ≤ G') :
    agEvaluationCode P hP G hG ≤ agEvaluationCode P hP G' hG' := sorry

/-- **Dimension of AG codes.** -/
theorem finrank_agEvaluationCode (P : Fin n → TCPlace k F) (hP : ∀ i, (P i).degree = 1)
    (hinj : Function.Injective P) (G : TCDivisor k F) (hG : ∀ i, G (P i) = 0) :
    (Module.finrank k (agEvaluationCode P hP G hG) : ℤ) =
      Module.finrank k (tcRiemannRochSpace G) -
        Module.finrank k (tcRiemannRochSpace (G - placesDivisor P)) := sorry

theorem finrank_agEvaluationCode_ge (P : Fin n → TCPlace k F) (hP : ∀ i, (P i).degree = 1)
    (hinj : Function.Injective P) (G : TCDivisor k F) (hG : ∀ i, G (P i) = 0)
    (hdeg : G.degree < n) :
    G.degree + 1 - tcGenus k F ≤ (Module.finrank k (agEvaluationCode P hP G hG) : ℤ) := sorry

theorem finrank_agEvaluationCode_eq (P : Fin n → TCPlace k F) (hP : ∀ i, (P i).degree = 1)
    (hinj : Function.Injective P) (G : TCDivisor k F) (hG : ∀ i, G (P i) = 0)
    (hdeg : G.degree < n) (hdeg' : 2 * (tcGenus k F : ℤ) - 2 < G.degree) :
    (Module.finrank k (agEvaluationCode P hP G hG) : ℤ) = G.degree + 1 - tcGenus k F := sorry

/-- **The Goppa bound.** -/
theorem le_hammingNorm_of_mem_agEvaluationCode [DecidableEq k] (P : Fin n → TCPlace k F)
    (hP : ∀ i, (P i).degree = 1) (hinj : Function.Injective P) (G : TCDivisor k F)
    (hG : ∀ i, G (P i) = 0) {c : Fin n → k} (hc : c ∈ agEvaluationCode P hP G hG) (hc0 : c ≠ 0) :
    (n : ℤ) - G.degree ≤ hammingNorm c := sorry

/-- The Singleton defect of an AG code is at most the genus. -/
theorem agEvaluationCode_singleton_defect [DecidableEq k] (P : Fin n → TCPlace k F)
    (hP : ∀ i, (P i).degree = 1) (hinj : Function.Injective P) (G : TCDivisor k F)
    (hG : ∀ i, G (P i) = 0) (hdeg : G.degree < n) {c : Fin n → k}
    (hc : c ∈ agEvaluationCode P hP G hG) (hc0 : c ≠ 0) :
    (n : ℤ) + 1 - tcGenus k F ≤ hammingNorm c + Module.finrank k (agEvaluationCode P hP G hG) :=
  sorry

/-- The residue map `ω ↦ (ω_{Pᵢ}(1))ᵢ` on `Ω_F(G - D)`. -/
noncomputable def agResidueMap (P : Fin n → TCPlace k F) (G : TCDivisor k F) :
    tcWeilDifferentialFiltration (G - placesDivisor P) →ₗ[k] (Fin n → k) :=
  LinearMap.pi fun i => (LinearMap.applyₗ (R := k) (1 : F)) ∘ₗ tcLocalComponent (P i) ∘ₗ
    (tcWeilDifferentialFiltration (G - placesDivisor P)).subtype

/-- The residue code `C_Ω(D, G)`. -/
noncomputable def agResidueCode (P : Fin n → TCPlace k F) (G : TCDivisor k F) :
    Submodule k (Fin n → k) :=
  LinearMap.range (agResidueMap P G)

theorem ker_agResidueMap (P : Fin n → TCPlace k F) (hP : ∀ i, (P i).degree = 1) (G : TCDivisor k F)
    (hG : ∀ i, G (P i) = 0) :
    Submodule.map (tcWeilDifferentialFiltration (G - placesDivisor P)).subtype
      (LinearMap.ker (agResidueMap P G)) = tcWeilDifferentialFiltration G := sorry

theorem agResidueCode_antitone (P : Fin n → TCPlace k F) {G G' : TCDivisor k F} (hle : G ≤ G') :
    agResidueCode P G' ≤ agResidueCode P G := sorry

/-- **Duality of evaluation and residue codes.** -/
theorem agResidueCode_eq_codeDual [DecidableEq k] (P : Fin n → TCPlace k F)
    (hP : ∀ i, (P i).degree = 1) (hinj : Function.Injective P) (G : TCDivisor k F)
    (hG : ∀ i, G (P i) = 0) :
    agResidueCode P G = codeDual (agEvaluationCode P hP G hG) := sorry

/-- Parameters of residue codes. -/
theorem finrank_agResidueCode (P : Fin n → TCPlace k F) (hP : ∀ i, (P i).degree = 1)
    (hinj : Function.Injective P) (G : TCDivisor k F) (hG : ∀ i, G (P i) = 0)
    (hdeg : G.degree < n) (hdeg' : 2 * (tcGenus k F : ℤ) - 2 < G.degree) :
    (Module.finrank k (agResidueCode P G) : ℤ) = n + tcGenus k F - 1 - G.degree := sorry

theorem le_hammingNorm_of_mem_agResidueCode [DecidableEq k] (P : Fin n → TCPlace k F)
    (hP : ∀ i, (P i).degree = 1) (hinj : Function.Injective P) (G : TCDivisor k F)
    (hG : ∀ i, G (P i) = 0) (hdeg' : 2 * (tcGenus k F : ℤ) - 2 < G.degree) {c : Fin n → k}
    (hc : c ∈ agResidueCode P G) (hc0 : c ≠ 0) :
    G.degree - (2 * tcGenus k F - 2) ≤ hammingNorm c := sorry

/-- Unit test `agEvaluationCode_eq_bot_of_degree_neg`. -/
example (P : Fin n → TCPlace k F) (hP : ∀ i, (P i).degree = 1) (G : TCDivisor k F)
    (hG : ∀ i, G (P i) = 0) (hdeg : G.degree < 0) : agEvaluationCode P hP G hG = ⊥ := sorry

/-- Unit test `agEvaluationCode_ratFunc`: over `k(x)` with `G = (k₀ - 1)P∞` the AG code is the
Reed–Solomon code (statement with stand-in places `Q i` of `X - α i` and `Q∞`). -/
example [DecidableEq k] (α : Fin n → k) (hα : Function.Injective α) (k₀ : ℕ) (hk : 1 ≤ k₀)
    (Q : Fin n → TCPlace k (RatFunc k)) (hQ : ∀ i, (Q i).degree = 1) (Qinf : TCPlace k (RatFunc k))
    (hG : ∀ i, ((k₀ - 1 : ℤ) • Finsupp.single Qinf 1 : TCDivisor k (RatFunc k)) (Q i) = 0) :
    agEvaluationCode Q hQ ((k₀ - 1 : ℤ) • Finsupp.single Qinf 1) hG = reedSolomon α k₀ := sorry

/-- Unit test `agEvaluationCode_zero_divisor`: `G = 0` gives the repetition code. -/
example (P : Fin n → TCPlace k F) (hP : ∀ i, (P i).degree = 1) (hG : ∀ i, (0 : TCDivisor k F) (P i) = 0) :
    agEvaluationCode P hP 0 hG = Submodule.span k {fun _ => (1 : k)} := sorry

/-- Unit test `agEvaluationCode_needs_disjoint_support`: with a pole at `P₁` a function of `L(G)`
has no value at `P₁` (stated as: some `f ∈ L(G)` is outside the valuation ring of `P₁`). -/
example (P : Fin n → TCPlace k F) (i : Fin n) (G : TCDivisor k F) (_hGi : 0 < G (P i))
    (hpole : ∃ f ∈ tcRiemannRochSpace G, f ∉ (P i).integers) :
    ∃ f ∈ tcRiemannRochSpace G, f ∉ (P i).integers := hpole

/-- Unit test `agResidueCode_eq_dual`. -/
example [DecidableEq k] (P : Fin n → TCPlace k F) (hP : ∀ i, (P i).degree = 1)
    (hinj : Function.Injective P) (G : TCDivisor k F) (hG : ∀ i, G (P i) = 0) :
    agResidueCode P G = codeDual (agEvaluationCode P hP G hG) :=
  agResidueCode_eq_codeDual P hP hinj G hG

/-- Unit test `agResidueCode_eq_bot_of_large_degree`. -/
example (P : Fin n → TCPlace k F) (G : TCDivisor k F)
    (hdeg : (n : ℤ) + 2 * tcGenus k F - 2 < G.degree) : agResidueCode P G = ⊥ := sorry

/-- Unit test `agResidueCode_ratFunc`: full-length Reed–Solomon duality from residue codes. -/
example [Fintype k] [DecidableEq k] (α : k → k) (hα : Function.Bijective α) (k₀ : ℕ) (hk : 1 ≤ k₀)
    (hk' : k₀ ≤ Fintype.card k) (Q : Fin (Fintype.card k) → TCPlace k (RatFunc k))
    (Qinf : TCPlace k (RatFunc k)) :
    agResidueCode Q ((k₀ - 1 : ℤ) • Finsupp.single Qinf 1) =
      codeDual (reedSolomon (fun i : Fin (Fintype.card k) => α ((Fintype.equivFin k).symm i)) k₀) :=
  sorry

/-- Unit test `agResidueCode_ne_evaluation`: for `k(x)`, `n = 3`, `G = 0` the residue code has
dimension `2` while the evaluation code has dimension `1`. -/
example (P : Fin 3 → TCPlace k (RatFunc k)) (hP : ∀ i, (P i).degree = 1) (hinj : Function.Injective P)
    (hG : ∀ i, (0 : TCDivisor k (RatFunc k)) (P i) = 0) :
    Module.finrank k (agResidueCode P 0) = 2 ∧ Module.finrank k (agEvaluationCode P hP 0 hG) = 1 :=
  sorry

end AGCodes

/-! ### The finite upper half-plane and finite harmonic analysis -/

section UpperHalfPlane

set_option linter.unusedSectionVars false

open Polynomial

/-- Terras's finite upper half-plane: the elements of the quadratic extension `E` not in `F`. -/
def FiniteUpperHalfPlane (F E : Type*) [Field F] [Field E] [Algebra F E] : Type _ :=
  {z : E // z ∉ Set.range (algebraMap F E)}

namespace FiniteUpperHalfPlane

variable {F E : Type*} [Field F] [Fintype F] [Field E] [Algebra F E]

/-- Real part with respect to the basis `(1, s)`. -/
noncomputable def re (s : E) (z : FiniteUpperHalfPlane F E) : F := sorry

/-- Imaginary part with respect to the basis `(1, s)`. -/
noncomputable def im (s : E) (z : FiniteUpperHalfPlane F E) : F := sorry

/-- The point `x + y s` for `y ≠ 0`. -/
noncomputable def mk (s : E) (hs : s ∉ Set.range (algebraMap F E)) (x : F) (y : Fˣ) :
    FiniteUpperHalfPlane F E := sorry

noncomputable def equivProd (s : E) (hs : s ∉ Set.range (algebraMap F E))
    (h2 : Module.finrank F E = 2) : FiniteUpperHalfPlane F E ≃ F × Fˣ := sorry

theorem card (h2 : Module.finrank F E = 2) :
    Nat.card (FiniteUpperHalfPlane F E) = Fintype.card F * (Fintype.card F - 1) := sorry

theorem im_ne_zero (s : E) (hs : s ∉ Set.range (algebraMap F E)) (h2 : Module.finrank F E = 2)
    (z : FiniteUpperHalfPlane F E) : im s z ≠ 0 := sorry

/-- The fractional linear action of `GL(2, F)`. -/
noncomputable instance instMulAction : MulAction (GL (Fin 2) F) (FiniteUpperHalfPlane F E) := sorry

theorem coe_smul (g : GL (Fin 2) F) (z : FiniteUpperHalfPlane F E) :
    ((g • z).1 : E) = (algebraMap F E (g 0 0) * z.1 + algebraMap F E (g 0 1)) /
      (algebraMap F E (g 1 0) * z.1 + algebraMap F E (g 1 1)) := sorry

theorem im_smul (s : E) (g : GL (Fin 2) F) (z : FiniteUpperHalfPlane F E) :
    im s (g • z) = (g : Matrix (Fin 2) (Fin 2) F).det * im s z /
      Algebra.norm F (algebraMap F E (g 1 0) * z.1 + algebraMap F E (g 1 1)) := sorry

theorem smul_scalar (c : Fˣ) (z : FiniteUpperHalfPlane F E) :
    (Matrix.GeneralLinearGroup.mkOfDetNeZero (Matrix.scalar (Fin 2) (c : F))
      (by simp)) • z = z := sorry

/-- Transitivity, stabilizer and the affine model. -/
theorem isPretransitive (h2 : Module.finrank F E = 2) :
    MulAction.IsPretransitive (GL (Fin 2) F) (FiniteUpperHalfPlane F E) := sorry

theorem card_stabilizer (s : FiniteUpperHalfPlane F E) (h2 : Module.finrank F E = 2)
    (hsq : s.1 ^ 2 ∈ Set.range (algebraMap F E)) :
    Nat.card (MulAction.stabilizer (GL (Fin 2) F) s) = Fintype.card F ^ 2 - 1 := sorry

theorem stabilizer_mulEquiv_units (s : FiniteUpperHalfPlane F E) (h2 : Module.finrank F E = 2)
    (hsq : s.1 ^ 2 ∈ Set.range (algebraMap F E)) :
    Nonempty (MulAction.stabilizer (GL (Fin 2) F) s ≃* Eˣ) := sorry

/-- Unit test `card_finiteUpperHalfPlane_three`. -/
example [Fact (Nat.Prime 3)] [Algebra (ZMod 3) (GaloisField 3 2)] :
    Nat.card (FiniteUpperHalfPlane (ZMod 3) (GaloisField 3 2)) = 6 := sorry

/-- Unit test `card_finiteUpperHalfPlane`. -/
example (h2 : Module.finrank F E = 2) :
    Nat.card (FiniteUpperHalfPlane F E) = Fintype.card F * (Fintype.card F - 1) := card h2

/-- Unit test `not_mem_finiteUpperHalfPlane_algebraMap`. -/
example (x : F) : ¬ (algebraMap F E x ∉ Set.range (algebraMap F E)) := fun h => h ⟨x, rfl⟩

/-- Unit test `finiteUpperHalfPlane_equiv`. -/
example (s : E) (hs : s ∉ Set.range (algebraMap F E)) (h2 : Module.finrank F E = 2) :
    Nonempty (FiniteUpperHalfPlane F E ≃ F × Fˣ) := ⟨equivProd s hs h2⟩

/-- Unit test `finiteUpperHalfPlane_smul_translation`. -/
example (z : FiniteUpperHalfPlane F E) :
    ((Matrix.GeneralLinearGroup.mkOfDetNeZero (!![1, 1; 0, 1] : Matrix (Fin 2) (Fin 2) F)
      (by simp [Matrix.det_fin_two]) • z).1 :
      E) = z.1 + 1 := sorry

/-- Unit test `finiteUpperHalfPlane_smul_scalar`. -/
example (c : Fˣ) (z : FiniteUpperHalfPlane F E) :
    (Matrix.GeneralLinearGroup.mkOfDetNeZero (Matrix.scalar (Fin 2) (c : F))
      (by simp)) • z = z := smul_scalar c z

/-- Unit test `finiteUpperHalfPlane_smul_affine`. -/
example (s : FiniteUpperHalfPlane F E) (x : F) (y : Fˣ) :
    ((Matrix.GeneralLinearGroup.mkOfDetNeZero !![(y : F), x; 0, 1] (by simp [Matrix.det_fin_two]) •
      s).1 : E) = algebraMap F E x + algebraMap F E y * s.1 := sorry

/-- Unit test `finiteUpperHalfPlane_action_not_faithful`. -/
example (hq : ringChar F ≠ 2) :
    ∃ g : GL (Fin 2) F, g ≠ 1 ∧ ∀ z : FiniteUpperHalfPlane F E, g • z = z := sorry

/-- Terras's invariant pseudo-distance `N(z - w) / (Im z · Im w)`. -/
noncomputable def terrasDistance (s : E) (z w : FiniteUpperHalfPlane F E) : F :=
  Algebra.norm F (z.1 - w.1) / (im s z * im s w)

theorem terrasDistance_comm (s : E) (z w : FiniteUpperHalfPlane F E) :
    terrasDistance s z w = terrasDistance s w z := sorry

theorem terrasDistance_eq_zero_iff (s : E) (hs : s ∉ Set.range (algebraMap F E))
    (h2 : Module.finrank F E = 2) (z w : FiniteUpperHalfPlane F E) :
    terrasDistance s z w = 0 ↔ z = w := sorry

theorem terrasDistance_s (s : FiniteUpperHalfPlane F E) (δ : F) (hδ : s.1 ^ 2 = algebraMap F E δ)
    (h2 : Module.finrank F E = 2) (x : F) (y : Fˣ) :
    terrasDistance s.1 s (mk s.1 s.2 x y) = (x ^ 2 - δ * ((y : F) - 1) ^ 2) / y := sorry

/-- **Invariance of Terras's distance.** -/
theorem terrasDistance_smul (s : E) (g : GL (Fin 2) F) (z w : FiniteUpperHalfPlane F E) :
    terrasDistance s (g • z) (g • w) = terrasDistance s z w := sorry

/-- **Two-point homogeneity.** -/
theorem terrasDistance_eq_iff_exists_smul (s : E) (hs : s ∉ Set.range (algebraMap F E))
    (h2 : Module.finrank F E = 2) (z w z' w' : FiniteUpperHalfPlane F E) :
    terrasDistance s z w = terrasDistance s z' w' ↔ ∃ g : GL (Fin 2) F, g • z = z' ∧ g • w = w' :=
  sorry

/-- Unit test `terrasDistance_self`. -/
example (s : E) (z : FiniteUpperHalfPlane F E) : terrasDistance s z z = 0 := sorry

/-- Unit test `terrasDistance_s_neg_s`. -/
example (s : FiniteUpperHalfPlane F E) (δ : F) (hδ : s.1 ^ 2 = algebraMap F E δ)
    (hns : -s.1 ∉ Set.range (algebraMap F E)) :
    terrasDistance s.1 s ⟨-s.1, hns⟩ = 4 * δ := sorry

/-- Unit test `terrasDistance_comm`. -/
example (s : E) (z w : FiniteUpperHalfPlane F E) : terrasDistance s z w = terrasDistance s w z :=
  terrasDistance_comm s z w

/-- Unit test `terrasDistance_not_metric`: over `F₃` with `δ = -1`, `d(s, -s) = 2`. -/
example [Fact (Nat.Prime 3)] [Algebra (ZMod 3) (GaloisField 3 2)]
    (s : FiniteUpperHalfPlane (ZMod 3) (GaloisField 3 2)) (hδ : s.1 ^ 2 = -1)
    (hns : -s.1 ∉ Set.range (algebraMap (ZMod 3) (GaloisField 3 2))) :
    terrasDistance s.1 s ⟨-s.1, hns⟩ = 2 := sorry

/-- The Terras graph `X_q(δ, a)`. -/
noncomputable def terrasGraph (s : E) (a : F) : SimpleGraph (FiniteUpperHalfPlane F E) :=
  SimpleGraph.fromRel fun z w => terrasDistance s z w = a

theorem terrasGraph_adj (s : E) (a : F) (z w : FiniteUpperHalfPlane F E) :
    (terrasGraph s a).Adj z w ↔ z ≠ w ∧ terrasDistance s z w = a := sorry

theorem terrasGraph_adj_smul (s : E) (a : F) (g : GL (Fin 2) F) (z w : FiniteUpperHalfPlane F E) :
    (terrasGraph s a).Adj (g • z) (g • w) ↔ (terrasGraph s a).Adj z w := sorry

/-- **The Terras graphs are `(q + 1)`-regular.** -/
theorem terrasGraph_degree [DecidableEq E] (s : FiniteUpperHalfPlane F E) (δ : F)
    (hδ : s.1 ^ 2 = algebraMap F E δ) (h2 : Module.finrank F E = 2) (hq : ringChar F ≠ 2) (a : F)
    (ha0 : a ≠ 0) (ha : a ≠ 4 * δ) (z : FiniteUpperHalfPlane F E) :
    Nat.card {w // (terrasGraph s.1 a).Adj z w} = Fintype.card F + 1 := sorry

/-- Unit test `terrasGraph_zero`. -/
example (s : FiniteUpperHalfPlane F E) (hs2 : Module.finrank F E = 2) :
    terrasGraph (F := F) s.1 0 = ⊥ := sorry

/-- Unit test `terrasGraph_four_delta_matching`. -/
example (s : FiniteUpperHalfPlane F E) (δ : F) (hδ : s.1 ^ 2 = algebraMap F E δ)
    (h2 : Module.finrank F E = 2) (z : FiniteUpperHalfPlane F E) :
    Nat.card {w // (terrasGraph s.1 (4 * δ)).Adj z w} = 1 := sorry

/-- Unit test `terrasGraph_adj_s`. -/
example (s : FiniteUpperHalfPlane F E) (δ : F) (hδ : s.1 ^ 2 = algebraMap F E δ)
    (h2 : Module.finrank F E = 2) (a : F) (x : F) (y : Fˣ) :
    (terrasGraph s.1 a).Adj s (mk s.1 s.2 x y) ↔
      x ^ 2 - δ * ((y : F) - 1) ^ 2 = a * y ∧ (x, (y : F)) ≠ (0, 1) := sorry

/-- Unit test `terrasGraph_not_complete`. -/
example (s : FiniteUpperHalfPlane F E) (δ : F) (hδ : s.1 ^ 2 = algebraMap F E δ)
    (h2 : Module.finrank F E = 2) (hq : 5 ≤ Fintype.card F) (a : F) (ha0 : a ≠ 0)
    (ha : a ≠ 4 * δ) : terrasGraph s.1 a ≠ ⊤ := sorry

open Classical in
/-- Commutation and self-adjointness of the Terras adjacency operators (Gelfand pair). -/
theorem terrasGraph_adjacency_commute [DecidableEq (FiniteUpperHalfPlane F E)] [Fintype (FiniteUpperHalfPlane F E)]
    (s : FiniteUpperHalfPlane F E) (h2 : Module.finrank F E = 2) (a b : F) :
    (terrasGraph s.1 a).adjMatrix ℂ * (terrasGraph s.1 b).adjMatrix ℂ =
      (terrasGraph s.1 b).adjMatrix ℂ * (terrasGraph s.1 a).adjMatrix ℂ := sorry

open Classical in
/-- **The Terras graphs are Ramanujan** (Katz, Li). -/
theorem terrasGraph_ramanujan [DecidableEq (FiniteUpperHalfPlane F E)] [Fintype (FiniteUpperHalfPlane F E)]
    (s : FiniteUpperHalfPlane F E) (δ : F) (hδ : s.1 ^ 2 = algebraMap F E δ)
    (h2 : Module.finrank F E = 2) (a : F) (ha0 : a ≠ 0) (ha : a ≠ 4 * δ) (μ : ℂ)
    (hμ : Module.End.HasEigenvalue (Matrix.toLin' ((terrasGraph s.1 a).adjMatrix ℂ)) μ)
    (hμ1 : μ ≠ Fintype.card F + 1) : ‖μ‖ ≤ 2 * Real.sqrt (Fintype.card F) := sorry

end FiniteUpperHalfPlane

/-- Quadratic character sums of quadratic polynomials. -/
theorem sum_quadraticChar_quadratic {F : Type*} [Field F] [Fintype F] [DecidableEq F]
    (hF : ringChar F ≠ 2) {A B C : F} (hA : A ≠ 0) :
    ∑ y : F, quadraticChar F (A * y ^ 2 + B * y + C) =
      if B ^ 2 - 4 * A * C = 0 then (Fintype.card F - 1 : ℤ) * quadraticChar F A
      else -quadraticChar F A := sorry

end UpperHalfPlane

section Hecke

set_option linter.unusedSectionVars false

variable {G X : Type*} [Group G] [Fintype G] [MulAction G X] [Fintype X]

/-- The Hecke operator of a function `φ` on `G` (bi-invariant under the stabilizer of `x₀`), using
a chosen section `sec : X → G` with `sec x • x₀ = x`; counting measure on `X`. -/
noncomputable def heckeOperator (x₀ : X) (sec : X → G) (φ : G → ℂ) : (X → ℂ) →ₗ[ℂ] (X → ℂ) where
  toFun f x := ∑ y, φ ((sec y)⁻¹ * sec x) * f y
  map_add' := sorry
  map_smul' := sorry

variable (x₀ : X) (sec : X → G)

theorem heckeOperator_apply (φ : G → ℂ) (f : X → ℂ) (x : X) :
    heckeOperator x₀ sec φ f x = ∑ y, φ ((sec y)⁻¹ * sec x) * f y := rfl

/-- The `|K|⁻¹`-normalised convolution of bi-invariant functions. -/
noncomputable def heckeConv [DecidableEq X] (φ ψ : G → ℂ) : G → ℂ := fun g =>
  (Fintype.card (MulAction.stabilizer G x₀) : ℂ)⁻¹ * ∑ h, φ h * ψ (h⁻¹ * g)

theorem heckeOperator_comp [DecidableEq X] (hsec : ∀ x, sec x • x₀ = x) (φ ψ : G → ℂ)
    (hφ : ∀ g, ∀ k ∈ MulAction.stabilizer G x₀, ∀ k' ∈ MulAction.stabilizer G x₀, φ (k * g * k') = φ g)
    (hψ : ∀ g, ∀ k ∈ MulAction.stabilizer G x₀, ∀ k' ∈ MulAction.stabilizer G x₀, ψ (k * g * k') = ψ g) :
    heckeOperator x₀ sec φ ∘ₗ heckeOperator x₀ sec ψ = heckeOperator x₀ sec (heckeConv x₀ ψ φ) :=
  sorry

theorem heckeOperator_adjoint (hsec : ∀ x, sec x • x₀ = x) (φ : G → ℂ)
    (hφ : ∀ g, ∀ k ∈ MulAction.stabilizer G x₀, ∀ k' ∈ MulAction.stabilizer G x₀, φ (k * g * k') = φ g)
    (f f' : X → ℂ) :
    ∑ x, heckeOperator x₀ sec φ f x * (starRingEnd ℂ) (f' x) =
      ∑ x, f x * (starRingEnd ℂ) (heckeOperator x₀ sec (fun g => (starRingEnd ℂ) (φ g⁻¹)) f' x) :=
  sorry

theorem heckeOperator_smul_comm (hsec : ∀ x, sec x • x₀ = x) (φ : G → ℂ)
    (hφ : ∀ g, ∀ k ∈ MulAction.stabilizer G x₀, ∀ k' ∈ MulAction.stabilizer G x₀, φ (k * g * k') = φ g)
    (h : G) (f : X → ℂ) (x : X) :
    heckeOperator x₀ sec φ (fun y => f (h • y)) x = heckeOperator x₀ sec φ f (h • x) := sorry

/-- **Gelfand's trick.** -/
theorem heckeOperator_comm_of_doubleCoset_inv (hsec : ∀ x, sec x • x₀ = x)
    (hG : ∀ g : G, ∃ k ∈ MulAction.stabilizer G x₀, ∃ k' ∈ MulAction.stabilizer G x₀, g⁻¹ = k * g * k')
    (φ ψ : G → ℂ)
    (hφ : ∀ g, ∀ k ∈ MulAction.stabilizer G x₀, ∀ k' ∈ MulAction.stabilizer G x₀, φ (k * g * k') = φ g)
    (hψ : ∀ g, ∀ k ∈ MulAction.stabilizer G x₀, ∀ k' ∈ MulAction.stabilizer G x₀, ψ (k * g * k') = ψ g) :
    heckeOperator x₀ sec φ ∘ₗ heckeOperator x₀ sec ψ = heckeOperator x₀ sec ψ ∘ₗ heckeOperator x₀ sec φ :=
  sorry

/-- Unit test `heckeOperator_indicator_stabilizer`. -/
example [DecidablePred (· ∈ MulAction.stabilizer G x₀)] (hsec : ∀ x, sec x • x₀ = x) :
    heckeOperator x₀ sec (fun g => if g ∈ MulAction.stabilizer G x₀ then 1 else 0) = LinearMap.id :=
  sorry

/-- Unit test `heckeOperator_const`. -/
example (f : X → ℂ) (x : X) : heckeOperator x₀ sec (fun _ => 1) f x = ∑ y, f y := by
  simp [heckeOperator_apply]

/-- Unit test `heckeOperator_equivariant`. -/
example (hsec : ∀ x, sec x • x₀ = x) (φ : G → ℂ)
    (hφ : ∀ g, ∀ k ∈ MulAction.stabilizer G x₀, ∀ k' ∈ MulAction.stabilizer G x₀, φ (k * g * k') = φ g)
    (h : G) (f : X → ℂ) (x : X) :
    heckeOperator x₀ sec φ (fun y => f (h • y)) x = heckeOperator x₀ sec φ f (h • x) :=
  heckeOperator_smul_comm x₀ sec hsec φ hφ h f x

/-- Unit test `heckeOperator_needs_biinvariance`: for `S₃` acting on `Fin 3`, a function that is
not bi-invariant gives an operator depending on the chosen section. -/
example : ∃ (φ : Equiv.Perm (Fin 3) → ℂ) (sec sec' : Fin 3 → Equiv.Perm (Fin 3)),
    (∀ x, sec x • (0 : Fin 3) = x) ∧ (∀ x, sec' x • (0 : Fin 3) = x) ∧
      heckeOperator (0 : Fin 3) sec φ ≠ heckeOperator (0 : Fin 3) sec' φ := sorry

end Hecke

end FF4
end TauCeti.FiniteFieldSums

end FF4File


-- ===== FF.5 =====

section FF5File

/-!
# Suggested Lean for FiniteFieldsAndCharacterSums, layer FF.5 (arithmetic applications)

This file is not the roadmap and is not exhaustive: the roadmap document is definitive. The
statements below suggest Lean forms so that contributors and reviewers converge on names and
signatures. Every proof is `sorry`; nothing here claims an implementation.

The Weil-type estimates imported from FF.2 appear here only in their instantiated forms, with
explicit constants; the section does not depend on the FF.4 section.
-/

namespace TauCeti.FiniteFieldSums
section FF5

/-! ### FF.5: normalisation handoffs and applications -/

section Handoffs

open Polynomial

/-- **Weil's bound modulo `p`** for an integer polynomial of degree `d < p`. -/
theorem norm_sum_stdAddChar_eval_le (f : ℤ[X]) (hd : 1 ≤ f.natDegree) (p : ℕ) [Fact p.Prime]
    (hlead : ¬ (p : ℤ) ∣ f.leadingCoeff) (hp : f.natDegree < p) :
    ‖∑ x : ZMod p, ZMod.stdAddChar ((f.map (Int.castRingHom (ZMod p))).eval x)‖ ≤
      (f.natDegree - 1 : ℝ) * Real.sqrt p := sorry

/-- A uniform explicit constant for all primes. -/
theorem norm_sum_stdAddChar_eval_le_uniform (f : ℤ[X]) (hd : 1 ≤ f.natDegree) (p : ℕ)
    [Fact p.Prime] :
    ‖∑ x : ZMod p, ZMod.stdAddChar ((f.map (Int.castRingHom (ZMod p))).eval x)‖ ≤
      max (f.natDegree - 1 : ℝ) (Real.sqrt (max f.natDegree f.leadingCoeff.natAbs)) * Real.sqrt p :=
  sorry

/-- Legendre-symbol sums of squarefree integer polynomials. -/
theorem abs_sum_quadraticChar_eval_le (g : ℤ[X]) (hn : 1 ≤ g.natDegree) (hdisc : g.discr ≠ 0)
    (p : ℕ) [Fact p.Prime] (hp2 : p ≠ 2) (hp : ¬ (p : ℤ) ∣ g.leadingCoeff * g.discr) :
    |(∑ x : ZMod p, quadraticChar (ZMod p) ((g.map (Int.castRingHom (ZMod p))).eval x) : ℤ)| ≤
      (g.natDegree - 1 : ℝ) * Real.sqrt p := sorry

/-- Kloosterman sums modulo a prime. -/
noncomputable def kloostermanModP (p : ℕ) [Fact p.Prime] (m n : ZMod p) : ℂ :=
  ∑ x : (ZMod p)ˣ, ZMod.stdAddChar (m * (x : ZMod p) + n * ((x⁻¹ : (ZMod p)ˣ) : ZMod p))

section Kloosterman

variable (p : ℕ) [Fact p.Prime]

theorem kloostermanModP_comm (m n : ZMod p) : kloostermanModP p m n = kloostermanModP p n m := sorry

theorem kloostermanModP_mul_left (a : (ZMod p)ˣ) (m n : ZMod p) :
    kloostermanModP p (a * m) n = kloostermanModP p m (a * n) := sorry

theorem kloostermanModP_conj (m n : ZMod p) :
    (starRingEnd ℂ) (kloostermanModP p m n) = kloostermanModP p m n := sorry

theorem kloostermanModP_zero_right {m : ZMod p} (hm : m ≠ 0) : kloostermanModP p m 0 = -1 := sorry

/-- **Weil's bound for Kloosterman sums modulo `p`.** -/
theorem norm_kloostermanModP_le {m n : ZMod p} (hm : m ≠ 0) (hn : n ≠ 0) :
    ‖kloostermanModP p m n‖ ≤ 2 * Real.sqrt p := sorry

/-- Unit test `kloostermanModP_three_one_one`. -/
example [Fact (Nat.Prime 3)] : kloostermanModP 3 1 1 = -1 := sorry

/-- Unit test `kloostermanModP_zero_zero`. -/
example : kloostermanModP p 0 0 = p - 1 := sorry

/-- Unit test `kloostermanModP_comm`. -/
example (m n : ZMod p) : kloostermanModP p m n = kloostermanModP p n m := kloostermanModP_comm p m n

/-- Unit test `kloostermanModP_ne_sum_all`: summing over all of `ZMod p` adds `e(0) = 1`. -/
example (m n : ZMod p) :
    ∑ x : ZMod p, (ZMod.stdAddChar (m * x + n * x⁻¹) : ℂ) = kloostermanModP p m n + 1 := sorry

end Kloosterman

/-- Points on `y² = g(x)`. -/
theorem card_sq_eq_eval {F : Type*} [Field F] [Fintype F] [DecidableEq F] (hF : ringChar F ≠ 2)
    (g : F[X]) :
    (Fintype.card {xy : F × F // xy.2 ^ 2 = g.eval xy.1} : ℤ) =
      Fintype.card F + ∑ x : F, quadraticChar F (g.eval x) := sorry

/-- The Weil error term for `y² = g(x)`. -/
theorem abs_card_sq_eq_eval_sub_le {F : Type*} [Field F] [Fintype F] [DecidableEq F]
    (hF : ringChar F ≠ 2) (g : F[X]) {K : Type*} [Field K] [IsAlgClosed K] [DecidableEq K] [Algebra F K]
    (hsq : ∀ (c : F) (h : K[X]), g.map (algebraMap F K) ≠ C (algebraMap F K c) * h ^ 2) :
    |((Fintype.card {xy : F × F // xy.2 ^ 2 = g.eval xy.1} : ℤ) - Fintype.card F : ℝ)| ≤
      ((g.map (algebraMap F K)).roots.toFinset.card - 1 : ℝ) * Real.sqrt (Fintype.card F) := sorry

/-- Counting lifts of a nonsingular zero modulo `p^m`. -/
theorem card_lifts_of_nonsingular {n : ℕ} (F : MvPolynomial (Fin n) ℤ) (p : ℕ) [Fact p.Prime]
    (m : ℕ) (hm : 1 ≤ m) (x : Fin n → ZMod (p ^ m))
    (hx : MvPolynomial.eval x (MvPolynomial.map (Int.castRingHom _) F) = 0)
    (hgrad : ∃ i, MvPolynomial.eval (fun j => ((x j).val : ZMod p))
      (MvPolynomial.map (Int.castRingHom _) (MvPolynomial.pderiv i F)) ≠ 0) :
    Nat.card {y : Fin n → ZMod (p ^ (m + 1)) //
      (∀ j, ((y j).val : ZMod (p ^ m)) = x j) ∧
        MvPolynomial.eval y (MvPolynomial.map (Int.castRingHom _) F) = 0} = p ^ (n - 1) := sorry

/-- **Local densities at good primes.** -/
theorem card_zeros_mod_prime_pow {n : ℕ} (F : MvPolynomial (Fin n) ℤ) (p : ℕ) [Fact p.Prime]
    (hgood : ∀ x : Fin n → ZMod p, MvPolynomial.eval x (MvPolynomial.map (Int.castRingHom _) F) = 0 →
      ∃ i, MvPolynomial.eval x (MvPolynomial.map (Int.castRingHom _) (MvPolynomial.pderiv i F)) ≠ 0)
    (m : ℕ) (hm : 1 ≤ m) :
    Nat.card {y : Fin n → ZMod (p ^ m) // MvPolynomial.eval y (MvPolynomial.map (Int.castRingHom _) F) = 0} =
      p ^ ((m - 1) * (n - 1)) *
        Nat.card {x : Fin n → ZMod p // MvPolynomial.eval x (MvPolynomial.map (Int.castRingHom _) F) = 0} :=
  sorry

/-- Weil's bound for cross-correlations of m-sequences with their decimations. -/
theorem norm_charCorrelation_decimation_add_one_le {F L : Type*} [Field F] [Fintype F] [Field L]
    [Fintype L] [Algebra F L] (α : Lˣ) (hα : ∀ v : Lˣ, v ∈ Subgroup.zpowers α) {d : ℕ} (hd2 : 2 ≤ d)
    (hdq : d < Fintype.card L) (hdp : ¬ ringChar F ∣ d) (χ : AddChar F ℂ) (hχ : χ ≠ 1) (t : ℕ) :
    ‖(∑ i ∈ Finset.range (Fintype.card L - 1),
        χ (Algebra.trace F L ((α : L) ^ (d * i))) *
          (starRingEnd ℂ) (χ (Algebra.trace F L ((α : L) ^ (i + t))))) + 1‖ ≤
        (d - 1 : ℝ) * Real.sqrt (Fintype.card L) := sorry

end Handoffs

section Cryptographic

open Polynomial

variable {G : Type*} [Group G] [Finite G]

/-- The discrete logarithm to a generator `γ`. -/
noncomputable def dlog (γ : G) (hγ : ∀ x, x ∈ Subgroup.zpowers γ) (α : G) : ZMod (Nat.card G) :=
  Multiplicative.toAdd ((zmodMulEquivOfGenerator hγ rfl).symm α)

theorem zpow_dlog (γ : G) (hγ : ∀ x, x ∈ Subgroup.zpowers γ) (α : G) :
    γ ^ (dlog γ hγ α).val = α := sorry

theorem dlog_pow (γ : G) (hγ : ∀ x, x ∈ Subgroup.zpowers γ) (k : ℕ) :
    dlog γ hγ (γ ^ k) = k := sorry

theorem dlog_mul {G : Type*} [CommGroup G] [Finite G] (γ : G) (hγ : ∀ x, x ∈ Subgroup.zpowers γ)
    (α β : G) : dlog γ hγ (α * β) = dlog γ hγ α + dlog γ hγ β := sorry

theorem dlog_one (γ : G) (hγ : ∀ x, x ∈ Subgroup.zpowers γ) : dlog γ hγ 1 = 0 := sorry

/-- Unit test `dlog_zmod_seven`. -/
example [Fact (Nat.Prime 7)] (hγ : ∀ x : (ZMod 7)ˣ, x ∈ Subgroup.zpowers (ZMod.unitOfCoprime 3 (by norm_num))) :
    dlog (ZMod.unitOfCoprime 3 (by norm_num)) hγ (ZMod.unitOfCoprime 2 (by norm_num)) = 2 := sorry

/-- Unit test `dlog_one`. -/
example (γ : G) (hγ : ∀ x, x ∈ Subgroup.zpowers γ) : dlog γ hγ 1 = 0 := dlog_one γ hγ

/-- Unit test `zpow_dlog`. -/
example (γ : G) (hγ : ∀ x, x ∈ Subgroup.zpowers γ) (α : G) : γ ^ (dlog γ hγ α).val = α :=
  zpow_dlog γ hγ α

/-- Unit test `two_not_generator_zmod_seven`. -/
example : (ZMod.unitOfCoprime 2 (by norm_num) : (ZMod 7)ˣ) ^ 3 = 1 := sorry

/-- **Correctness of Diffie–Hellman.** -/
theorem diffieHellman_correct {M : Type*} [CommMonoid M] (γ : M) (x y : ℕ) :
    (γ ^ y) ^ x = (γ ^ x) ^ y := sorry

/-- **Pohlig–Hellman**, prime-power part. -/
theorem pohligHellman_projection {γ : G} (hγ : ∀ x, x ∈ Subgroup.zpowers γ) (x : ℕ) {q e : ℕ}
    (hqe : q ^ e ∣ Nat.card G) :
    (γ ^ x) ^ (Nat.card G / q ^ e) = (γ ^ (Nat.card G / q ^ e)) ^ x ∧
      orderOf (γ ^ (Nat.card G / q ^ e)) = q ^ e := sorry

/-- **Pohlig–Hellman**, digit recursion in a group of order `q^e`. -/
theorem pohligHellman_digits {γ : G} {q e f : ℕ} (hγ : orderOf γ = q ^ e) (hf : f ≤ e) {u v : ℕ} :
    (γ ^ (q ^ f * v + u)) ^ (q ^ (e - f)) = (γ ^ (q ^ (e - f))) ^ u ∧
      γ ^ (q ^ f * v + u) * (γ ^ u)⁻¹ = (γ ^ (q ^ f)) ^ v := sorry

/-- The binary-digit discrete logarithm on `F_65537ˣ` to the base `3`. -/
def dlogFermat (a : ZMod 65537) : ℕ :=
  (List.range 16).foldl (fun x i =>
    if (a * (3 : ZMod 65537)⁻¹ ^ x) ^ (2 ^ (15 - i)) = 1 then x else x + 2 ^ i) 0

/-- **Correctness without hardness**: the explicit logarithm is correct for every unit. -/
theorem pow_dlogFermat (a : ZMod 65537) (ha : a ≠ 0) : (3 : ZMod 65537) ^ dlogFermat a = a := sorry

theorem three_generates_zmod_65537 [Fact (Nat.Prime 65537)] :
    ∀ x : (ZMod 65537)ˣ, x ∈ Subgroup.zpowers (ZMod.unitOfCoprime 3 (by norm_num)) := sorry

/-- The shares `(P(xᵢ))ᵢ` of Shamir's scheme with `P = s + ∑ cⱼ X^{j+1}`. -/
noncomputable def shamirShares {F : Type*} [Field F] {n t : ℕ} (x : Fin n → F) (s : F)
    (c : Fin (t - 1) → F) : Fin n → F :=
  fun i => (C s + ∑ j, C (c j) * X ^ ((j : ℕ) + 1)).eval (x i)

section Shamir

variable {F : Type*} [Field F] [Fintype F] [DecidableEq F] {n t : ℕ}

theorem shamirShares_add (x : Fin n → F) (s s' : F) (c c' : Fin (t - 1) → F) :
    shamirShares (t := t) x (s + s') (c + c') = shamirShares x s c + shamirShares x s' c' := sorry

/-- Share vectors are Reed–Solomon codewords: evaluations of a polynomial of degree `< t`
(membership in `reedSolomon x t` of section `FF4`). -/
theorem shamirShares_mem_reedSolomon (x : Fin n → F) (s : F) (c : Fin (t - 1) → F) (ht : 1 ≤ t) :
    ∃ P : F[X], P.degree < t ∧ ∀ i, shamirShares (t := t) x s c i = P.eval (x i) := sorry

theorem shamirShares_mul (x : Fin n → F) (s s' : F) (c c' : Fin (t - 1) → F) (ht : 1 ≤ t) :
    ∃ P : F[X], P.natDegree ≤ 2 * t - 2 ∧ P.eval 0 = s * s' ∧
      ∀ i, shamirShares (t := t) x s c i * shamirShares (t := t) x s' c' i = P.eval (x i) := sorry

/-- **Reconstruction** from any `t` shares. -/
theorem shamir_reconstruct (x : Fin n → F) (hx : Function.Injective x) (s : F)
    (c : Fin (t - 1) → F) (S : Finset (Fin n)) (hS : S.card = t) :
    s = ∑ i ∈ S, shamirShares (t := t) x s c i * ∏ j ∈ S.erase i, x j / (x j - x i) := sorry

/-- **Perfect privacy** against `t - 1` players. -/
theorem shamir_card_fiber (x : Fin n → F) (hx : Function.Injective x) (hx0 : ∀ i, x i ≠ 0)
    (S : Finset (Fin n)) (hS : S.card ≤ t - 1) (s : F) (v : S → F) :
    Nat.card {c : Fin (t - 1) → F // ∀ i : S, shamirShares (t := t) x s c i = v i} =
      Fintype.card F ^ (t - 1 - S.card) := sorry

/-- Unit test `shamirShares_zmod_five`. -/
example [Fact (Nat.Prime 5)] : shamirShares (t := 2) (![1, 2, 3] : Fin 3 → ZMod 5) 3 ![1] = ![4, 0, 1] :=
  sorry

/-- Unit test `shamirShares_threshold_one`. -/
example (x : Fin n → F) (s : F) (c : Fin (1 - 1) → F) : shamirShares (t := 1) x s c = fun _ => s :=
  sorry

/-- Unit test `shamirShares_mem_reedSolomon`. -/
example (x : Fin n → F) (s : F) (c : Fin (t - 1) → F) (ht : 1 ≤ t) :
    ∃ P : F[X], P.degree < t ∧ ∀ i, shamirShares (t := t) x s c i = P.eval (x i) :=
  shamirShares_mem_reedSolomon x s c ht

/-- Unit test `shamirShares_zero_label_leaks`: a player labelled `0` would receive the secret. -/
example (x : Fin n → F) (s : F) (c : Fin (t - 1) → F) (i : Fin n) (hi : x i = 0) :
    shamirShares (t := t) x s c i = s := sorry

end Shamir

end Cryptographic

end FF5
end TauCeti.FiniteFieldSums

end FF5File
