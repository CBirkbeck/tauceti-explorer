/-
This file is not the roadmap and is not exhaustive. The roadmap document
(research/blueprint/readmes/EffectiveDiophantineMethods.md) is definitive. These statements suggest
Lean forms so that contributors and reviewers converge on names and signatures; they do not
constitute an implementation. General proofs use `sorry`; nine finite raw-checker
regressions are proved by exact decision.

Effective Diophantine methods and certified rational points, layers ED.0–ED.6. Each layer is a
section of its own. Objects the pinned libraries have are used directly (number fields, p-adic
numbers, power series, lattices, Weierstrass curves and their points, quotient groups). Objects they
lack (Jacobians of curves of higher genus, Coleman integrals, the quadratic Chabauty heights) are
abstract inputs: an additive group with the homomorphisms and the properties the statement needs.
The elliptic canonical height, quotient by torsion, regulator and local descent map are
imported from Tau Ceti. Abstract supporting algebra is explicitly distinguished from the
geometric application signatures omitted under PROTOCOL §13; see the omission register below.
-/
import TauCeti.AlgebraicGeometry.EllipticCurve.CanonicalHeight
import TauCeti.AlgebraicGeometry.EllipticCurve.MordellWeil.PointModTorsion
import TauCeti.AlgebraicGeometry.EllipticCurve.MordellWeil.Regulator
import TauCeti.AlgebraicGeometry.EllipticCurve.MordellWeil.LocalCondition
import Mathlib.Data.Finset.Pi
import Mathlib.RingTheory.Ideal.Quotient.Operations
import Mathlib.Order.Interval.Basic
import Mathlib.NumberTheory.Padics.Hensel
import Mathlib.NumberTheory.Padics.RingHoms
import Mathlib.NumberTheory.Padics.PadicVal.Basic
import Mathlib.NumberTheory.Height.NumberField
import Mathlib.NumberTheory.NumberField.InfinitePlace.Basic
import Mathlib.NumberTheory.NumberField.InfinitePlace.Embeddings
import Mathlib.RingTheory.PowerBasis
import Mathlib.RingTheory.DedekindDomain.AdicValuation
import Mathlib.RingTheory.Polynomial.Content
import Mathlib.RingTheory.Algebraic.Denominator
import Mathlib.Analysis.Polynomial.MahlerMeasure
import Mathlib.LinearAlgebra.Matrix.Charpoly.Basic
import Mathlib.LinearAlgebra.Matrix.ToLin
import Mathlib.LinearAlgebra.Projectivization.Basic
import Mathlib.Analysis.InnerProductSpace.GramSchmidtOrtho
import Mathlib.Analysis.InnerProductSpace.PiL2
import Mathlib.Algebra.Order.Round
import Mathlib.Analysis.SpecialFunctions.Log.Basic
import Mathlib.Analysis.SpecialFunctions.Pow.Real
import Mathlib.Algebra.Polynomial.Homogenize
import Mathlib.Algebra.MvPolynomial.Eval
import Mathlib.RingTheory.Polynomial.IntegralNormalization
import Mathlib.NumberTheory.DiophantineApproximation.Basic
import Mathlib.Algebra.ContinuedFractions.Computation.TerminatesIffRat
import Mathlib.Analysis.Polynomial.CauchyBound
import Mathlib.NumberTheory.NumberField.Units.DirichletTheorem
import Mathlib.NumberTheory.NumberField.Units.Regulator
import Mathlib.NumberTheory.Padics.PadicNumbers
import Mathlib.Analysis.SpecialFunctions.Complex.Log
import Mathlib.Analysis.Complex.ExponentialBounds
import Mathlib.Analysis.Real.Pi.Bounds
import Mathlib.Analysis.SpecialFunctions.Log.Base
import Mathlib.Analysis.Matrix.Normed
import Mathlib.Analysis.Normed.Unbundled.SpectralNorm
import Mathlib.Analysis.SpecificLimits.Normed
import Mathlib.Data.ZMod.Units
import Mathlib.GroupTheory.OrderOfElement
import Mathlib.RingTheory.Ideal.Operations
import Mathlib.AlgebraicGeometry.EllipticCurve.Affine.Point
import Mathlib.AlgebraicGeometry.EllipticCurve.NormalForms
import Mathlib.GroupTheory.Index
import Mathlib.GroupTheory.Torsion
import Mathlib.GroupTheory.QuotientGroup.Defs
import Mathlib.LinearAlgebra.Dimension.Finrank
import Mathlib.LinearAlgebra.Matrix.Determinant.Basic
import Mathlib.LinearAlgebra.Matrix.PosDef
import Mathlib.LinearAlgebra.LinearIndependent.Defs
import Mathlib.Analysis.SpecialFunctions.Gamma.Basic
import Mathlib.Algebra.Polynomial.Eval.Defs
import Mathlib.RingTheory.Polynomial.Resultant.Basic
import Mathlib.Order.Filter.AtTopBot.Basic
import Mathlib.Topology.Instances.Real.Lemmas
import Mathlib.NumberTheory.Padics.PadicIntegers
import Mathlib.RingTheory.PowerSeries.Restricted
import Mathlib.RingTheory.PowerSeries.GaussNorm
import Mathlib.Topology.MetricSpace.Ultra.Basic
import Mathlib.RingTheory.PowerSeries.Derivative
import Mathlib.LinearAlgebra.Dual.Lemmas
import Mathlib.LinearAlgebra.Matrix.Rank
import Mathlib.Data.Finset.Card
import Mathlib.Topology.Algebra.InfiniteSum.Basic
import Mathlib.Algebra.Polynomial.Roots
import Mathlib.Algebra.Squarefree.Basic
import Mathlib.Data.Set.Card
import Mathlib.Tactic.NormNum.Prime
import Mathlib.RingTheory.MvPowerSeries.Basic
import Mathlib.Algebra.Polynomial.Reverse
import Mathlib.GroupTheory.FiniteAbelian.Basic
import Mathlib.Data.Int.GCD
import Mathlib.Data.Finset.Union
import Mathlib.Data.ZMod.Basic
import Mathlib.GroupTheory.Exponent
import Mathlib.LinearAlgebra.QuadraticForm.Basic
import Mathlib.Analysis.Real.Sqrt
import Mathlib.Algebra.BigOperators.Group.Finset.Basic
import Mathlib.Data.Finset.Basic
import Mathlib.Data.Set.Finite.Basic
import Mathlib.LinearAlgebra.Matrix.Trace
import Mathlib.Data.Matrix.Block
import Mathlib.LinearAlgebra.Matrix.Notation
import Mathlib.Algebra.MvPolynomial.PDeriv
import Mathlib.RingTheory.MvPolynomial.Homogeneous
import Mathlib.RingTheory.LaurentSeries
import Mathlib.RingTheory.Derivation.Basic
import Mathlib.RingTheory.PowerSeries.Basic
import Mathlib.AlgebraicGeometry.EllipticCurve.Affine.Basic
import Mathlib.RingTheory.Adjoin.Basic
import Mathlib.RingTheory.Henselian
import Mathlib.FieldTheory.IsAlgClosed.AlgebraicClosure
import Mathlib.NumberTheory.NumberField.ClassNumber
import Mathlib.NumberTheory.NumberField.Discriminant.Defs

noncomputable section

/-! ## ED.0 and ED.1 -/

section PartED01

/-
This file is not the roadmap and is not exhaustive. The roadmap document is
definitive. These statements suggest Lean forms so contributors and reviewers
can converge on names and signatures. They do not constitute implementation.

ED.0 (certified algebraic numbers and local precision) and ED.1 (lattice
reduction and integer relations). Objects of other roadmaps that are not in the
pinned libraries are restated only through the Mathlib notions they denote:
* ComputationalNumberTheory CN.0 `AlgebraicRootCertificate`: the box and the
  unique-root proof are stored directly in `ArchimedeanEmbeddingCertificate`;
* CN.0 `PadicApproximation`: a p-adic enclosure is a rational centre and an
  absolute precision, i.e. the denotation of that record;
ED.0 uses no interval or ball arithmetic of CN.4 and evaluates no analytic function:
all its enclosures come from exact rational arithmetic on CN.0 data.
* GeometryOfNumbersAndQuadraticArithmetic GN.5 `IsLLLReduced`: only its
  consequence (de Weger (3.12)) on Mathlib's `gramSchmidt` is used here;
* DiophantineApproximationAndTranscendence DT.0 (Mahler measure and height).
-/


open Polynomial Matrix

attribute [local instance] Classical.propDecidable

namespace TauCeti.EffectiveDiophantine.ED0

/-! ### ED.0/certified-enclosure -/

/-- A rational interval enclosing a real number (ED.0/certified-enclosure (i)). -/
structure RealEnclosure (t : ℝ) where
  interval : NonemptyInterval ℚ
  lower_le : ((interval.fst : ℚ) : ℝ) ≤ t
  le_upper : t ≤ ((interval.snd : ℚ) : ℝ)

namespace RealEnclosure

variable {t : ℝ}

/-- The rational error bound `u - l`. -/
def width (e : RealEnclosure t) : ℚ := sorry

theorem width_nonneg (e : RealEnclosure t) : 0 ≤ e.width := sorry

theorem abs_sub_le (e : RealEnclosure t) (q : ℚ) (hl : e.interval.fst ≤ q)
    (hu : q ≤ e.interval.snd) : |t - (q : ℝ)| ≤ (e.width : ℝ) := sorry

/-- The degenerate enclosure `[q, q]`. -/
def ofRat (q : ℚ) : RealEnclosure (q : ℝ) := sorry

/-- Enlarging the interval keeps an enclosure. -/
def widen (e : RealEnclosure t) (J : NonemptyInterval ℚ) (h₁ : J.fst ≤ e.interval.fst)
    (h₂ : e.interval.snd ≤ J.snd) : RealEnclosure t := sorry

end RealEnclosure

/-- A rational box enclosing a complex number (ED.0/certified-enclosure (ii)). -/
structure ComplexEnclosure (z : ℂ) where
  re : NonemptyInterval ℚ
  im : NonemptyInterval ℚ
  re_mem : ((re.fst : ℚ) : ℝ) ≤ z.re ∧ z.re ≤ ((re.snd : ℚ) : ℝ)
  im_mem : ((im.fst : ℚ) : ℝ) ≤ z.im ∧ z.im ≤ ((im.snd : ℚ) : ℝ)

namespace ComplexEnclosure

variable {z : ℂ}

/-- Membership in the box `{w : Re w ∈ R, Im w ∈ I}`. -/
theorem mem_box (e : ComplexEnclosure z) :
    z ∈ {w : ℂ | ((e.re.fst : ℚ) : ℝ) ≤ w.re ∧ w.re ≤ ((e.re.snd : ℚ) : ℝ) ∧
      ((e.im.fst : ℚ) : ℝ) ≤ w.im ∧ w.im ≤ ((e.im.snd : ℚ) : ℝ)} := sorry

theorem normSq_le (e : ComplexEnclosure z) :
    Complex.normSq z ≤ ((max (e.re.fst ^ 2) (e.re.snd ^ 2) +
      max (e.im.fst ^ 2) (e.im.snd ^ 2) : ℚ) : ℝ) := sorry

/-- A box with imaginary interval `[0, 0]` gives a real enclosure of the real part. -/
def toRealEnclosure (e : ComplexEnclosure z) (h : e.im.fst = 0 ∧ e.im.snd = 0) :
    RealEnclosure z.re := sorry

end ComplexEnclosure

/-- A p-adic ball enclosing `x` (ED.0/certified-enclosure (iii)); its canonical CN.0
`PadicApproximation` record denotes the same ball. -/
structure PadicEnclosure (p : ℕ) [Fact p.Prime] (x : ℚ_[p]) where
  centre : ℚ
  precision : ℤ
  mem : ‖x - (centre : ℚ_[p])‖ ≤ (p : ℝ) ^ (-precision)

namespace PadicEnclosure

variable {p : ℕ} [Fact p.Prime]

def ofRat (q : ℚ) (N : ℤ) : PadicEnclosure p (q : ℚ_[p]) := sorry

/-- Compatibility with CN.0: the canonical `PadicApproximation` record of `(centre, precision)`
denotes the closed ball below, which contains `x`. -/
theorem centre_ball_mem {x : ℚ_[p]} (e : PadicEnclosure p x) :
    x ∈ Metric.closedBall (e.centre : ℚ_[p]) ((p : ℝ) ^ (-e.precision)) := sorry

end PadicEnclosure

-- realEnclosure_sqrt_two: [141/100, 142/100] encloses √2 with width 1/100 ≤ 2^(-6).
example : ∃ e : RealEnclosure (Real.sqrt 2), e.interval.fst = 141 / 100 ∧
    e.interval.snd = 142 / 100 ∧ e.width = 1 / 100 ∧ e.width ≤ (2 : ℚ) ^ (-6 : ℤ) ∧
    ¬ e.width ≤ (2 : ℚ) ^ (-7 : ℤ) := sorry

-- realEnclosure_ofRat_width: the degenerate enclosure has width 0.
example (q : ℚ) : (RealEnclosure.ofRat q).width = 0 := sorry

-- complexEnclosure_I: ([0, 0], [1, 1]) encloses i.
example : ∃ e : ComplexEnclosure Complex.I, e.re.fst = 0 ∧ e.re.snd = 0 ∧
    e.im.fst = 1 ∧ e.im.snd = 1 := sorry

-- padicEnclosure_nine: a zero-centred ball at p = 3, precision 2, encloses 9 ≠ 0.
example [Fact (Nat.Prime 3)] : ∃ e : PadicEnclosure 3 (9 : ℚ_[3]), e.centre = 0 ∧
    e.precision = 2 := sorry

-- realEnclosure_overlap: one interval encloses both 1 and 2.
example : ∃ (e₁ : RealEnclosure 1) (e₂ : RealEnclosure 2), e₁.interval = e₂.interval := sorry

-- Supporting ball equality for padicEnclosure_normalize_five (the CN.0 record test is omitted): at p = 3 the balls (5, 1) and (2, 1) coincide
-- (the canonical CN.0 record of (5, 1) is (N, v, s) = (1, 0, 2)).
example [Fact (Nat.Prime 3)] (x : ℚ_[3]) :
    (∃ e : PadicEnclosure 3 x, e.centre = 5 ∧ e.precision = 1) ↔
      ∃ e : PadicEnclosure 3 x, e.centre = 2 ∧ e.precision = 1 := sorry

/-! ### ED.0/isolating-interval-refinement -/

/-- A rational interval containing exactly one real root of a nonzero `g`. -/
structure RealRootIsolation (g : ℚ[X]) where
  polynomial_ne_zero : g ≠ 0
  interval : NonemptyInterval ℚ
  existsUnique_root : ∃! u : ℝ, aeval u g = 0 ∧
    ((interval.fst : ℚ) : ℝ) ≤ u ∧ u ≤ ((interval.snd : ℚ) : ℝ)

namespace RealRootIsolation

variable {g : ℚ[X]} (I : RealRootIsolation g)

/-- The isolated real root. -/
def root (I : RealRootIsolation g) : ℝ := sorry

theorem root_spec : aeval I.root g = 0 ∧
    ((I.interval.fst : ℚ) : ℝ) ≤ I.root ∧ I.root ≤ ((I.interval.snd : ℚ) : ℝ) := sorry

theorem root_unique (u : ℝ) (hu : aeval u g = 0)
    (hl : ((I.interval.fst : ℚ) : ℝ) ≤ u) (hr : u ≤ ((I.interval.snd : ℚ) : ℝ)) :
    u = I.root := sorry

/-- Exact bisection of the squarefree part, `n` steps. -/
def refine (I : RealRootIsolation g) (n : ℕ) : RealRootIsolation g := sorry

@[simp] theorem refine_root (n : ℕ) : (I.refine n).root = I.root := sorry

theorem refine_width (n : ℕ) :
    (I.refine n).interval.snd - (I.refine n).interval.fst ≤
      (2 : ℚ) ^ (-(n : ℤ)) * (I.interval.snd - I.interval.fst) := sorry

/-- An isolating interval is an enclosure of its root. -/
def toEnclosure : RealEnclosure I.root := sorry

/-- A CN.0 certificate `(h, R, I)` whose root is real gives the isolation `(h, R)`. -/
def ofRealCertificate (h : ℚ[X]) (R J : NonemptyInterval ℚ)
    (h_ne_zero : h ≠ 0)
    (hunique : ∃! z : ℂ, aeval z h = 0 ∧ ((R.fst : ℚ) : ℝ) ≤ z.re ∧ z.re ≤ ((R.snd : ℚ) : ℝ) ∧
      ((J.fst : ℚ) : ℝ) ≤ z.im ∧ z.im ≤ ((J.snd : ℚ) : ℝ))
    (hreal : hunique.exists.choose.im = 0) : RealRootIsolation h := sorry

end RealRootIsolation

-- refine_sqrt_two: for X² - 2 and [1, 2], three bisections give [11/8, 3/2].
example (I : RealRootIsolation (X ^ 2 - C 2 : ℚ[X])) (h₁ : I.interval.fst = 1)
    (h₂ : I.interval.snd = 2) :
    (I.refine 3).interval.fst = 11 / 8 ∧ (I.refine 3).interval.snd = 3 / 2 := sorry

-- refine_exact_rational: a degenerate isolation stays degenerate.
example (q : ℚ) (I : RealRootIsolation (X - C q)) (h : I.interval.fst = q ∧ I.interval.snd = q)
    (n : ℕ) : (I.refine n).interval.fst = q ∧ (I.refine n).interval.snd = q := sorry

-- refine_midpoint_root: for X - 1/2 and [0, 1] the first midpoint is the root.
example (I : RealRootIsolation (X - C (1 / 2) : ℚ[X])) (h₁ : I.interval.fst = 0)
    (h₂ : I.interval.snd = 1) :
    (I.refine 1).interval.fst = 1 / 2 ∧ (I.refine 1).interval.snd = 1 / 2 := sorry

-- isolation_two_roots: [-2, 2] does not isolate a root of X² - 2.
example : ¬ ∃ I : RealRootIsolation (X ^ 2 - C 2 : ℚ[X]), I.interval.fst = -2 ∧
    I.interval.snd = 2 := sorry

-- isolation_zero_polynomial: even a singleton interval cannot certify the zero polynomial.
example : IsEmpty (RealRootIsolation (0 : ℚ[X])) := sorry

-- refine_toEnclosure: the refined enclosure has width at most 2^(-n) · width(I).
example {g : ℚ[X]} (I : RealRootIsolation g) (n : ℕ) :
    (I.refine n).toEnclosure.width ≤ (2 : ℚ) ^ (-(n : ℤ)) * (I.interval.snd - I.interval.fst) :=
  sorry

/-! ### ED.0/archimedean-embedding-certificate -/

variable {K : Type*} [Field K] [NumberField K]

/-- An isolating box for one complex root of the minimal polynomial of the power-basis
generator (a CN.0 `AlgebraicRootCertificate` for that polynomial). -/
structure ArchimedeanEmbeddingCertificate (pb : PowerBasis ℚ K) where
  re : NonemptyInterval ℚ
  im : NonemptyInterval ℚ
  existsUnique_root : ∃! z : ℂ, aeval z (minpoly ℚ pb.gen) = 0 ∧
    ((re.fst : ℚ) : ℝ) ≤ z.re ∧ z.re ≤ ((re.snd : ℚ) : ℝ) ∧
    ((im.fst : ℚ) : ℝ) ≤ z.im ∧ z.im ≤ ((im.snd : ℚ) : ℝ)

namespace ArchimedeanEmbeddingCertificate

variable {pb : PowerBasis ℚ K} (c : ArchimedeanEmbeddingCertificate pb)

/-- The unique root in the box. -/
def root (c : ArchimedeanEmbeddingCertificate pb) : ℂ := sorry

/-- `PowerBasis.lift pb c.root` as a ring homomorphism. -/
def embedding (c : ArchimedeanEmbeddingCertificate pb) : K →+* ℂ := sorry

@[simp] theorem embedding_gen : c.embedding pb.gen = c.root := sorry

theorem eq_embedding_of_mem (σ : K →+* ℂ)
    (h : ((c.re.fst : ℚ) : ℝ) ≤ (σ pb.gen).re ∧ (σ pb.gen).re ≤ ((c.re.snd : ℚ) : ℝ) ∧
      ((c.im.fst : ℚ) : ℝ) ≤ (σ pb.gen).im ∧ (σ pb.gen).im ≤ ((c.im.snd : ℚ) : ℝ)) :
    σ = c.embedding := sorry

theorem exists_of_embedding (σ : K →+* ℂ) :
    ∃ c : ArchimedeanEmbeddingCertificate pb, c.embedding = σ := sorry

theorem isReal_of_symmetric (h : c.im.fst = -c.im.snd) :
    NumberField.ComplexEmbedding.IsReal c.embedding := sorry

theorem infinitePlace_apply (α : K) :
    NumberField.InfinitePlace.mk c.embedding α = ‖c.embedding α‖ := sorry

/-- The evaluation error bound: `w = w₁ + w₂ i` is a box centre with `|Re(z - w)|, |Im(z - w)| ≤ r`
and `M = |w₁| + |w₂| + 2r`. -/
theorem norm_sub_eval_le (α : K) (w₁ w₂ r : ℚ)
    (hre : |c.root.re - (w₁ : ℝ)| ≤ (r : ℝ)) (him : |c.root.im - (w₂ : ℝ)| ≤ (r : ℝ)) :
    ‖c.embedding α - ∑ j : Fin pb.dim,
        ((pb.basis.repr α j : ℚ) : ℂ) * ((w₁ : ℂ) + (w₂ : ℂ) * Complex.I) ^ (j : ℕ)‖ ≤
      2 * (r : ℝ) * ∑ j : Fin pb.dim, ((j : ℕ) : ℝ) * |((pb.basis.repr α j : ℚ) : ℝ)| *
        (|(w₁ : ℝ)| + |(w₂ : ℝ)| + 2 * r) ^ ((j : ℕ) - 1) := sorry

/-- A certificate with the same root and box widths at most `2^(-n)` (bisection of the real
isolating intervals of `Re z` and `Im z`). -/
def refine (c : ArchimedeanEmbeddingCertificate pb) (n : ℕ) :
    ArchimedeanEmbeddingCertificate pb := sorry

theorem refine_root (n : ℕ) : (c.refine n).root = c.root := sorry

/-- `[K : ℚ]` certificates with pairwise disjoint boxes contain every embedding. -/
theorem complete_of_disjoint (cs : Fin (Module.finrank ℚ K) → ArchimedeanEmbeddingCertificate pb)
    (hdisj : ∀ i j, i ≠ j → (cs i).re.snd < (cs j).re.fst ∨ (cs j).re.snd < (cs i).re.fst ∨
      (cs i).im.snd < (cs j).im.fst ∨ (cs j).im.snd < (cs i).im.fst)
    (σ : K →+* ℂ) : ∃ i, (cs i).embedding = σ := sorry

/-- An enclosure of `σ_c(α)` of absolute precision `n`, from a refined certificate. -/
def evalEnclosure (α : K) (n : ℕ) : ComplexEnclosure (c.embedding α) := sorry

theorem evalEnclosure_width (α : K) (n : ℕ) :
    (c.evalEnclosure α n).re.snd - (c.evalEnclosure α n).re.fst ≤ (2 : ℚ) ^ (-(n : ℤ)) ∧
      (c.evalEnclosure α n).im.snd - (c.evalEnclosure α n).im.fst ≤ (2 : ℚ) ^ (-(n : ℤ)) :=
  sorry

end ArchimedeanEmbeddingCertificate

-- archimedean_sqrt_two: for X² - 2 and the box [1, 2] × [0, 0], σ_c(θ) = √2.
example (pb : PowerBasis ℚ K) (h : minpoly ℚ pb.gen = X ^ 2 - C 2)
    (c : ArchimedeanEmbeddingCertificate pb) (h₁ : c.re.fst = 1) (h₂ : c.re.snd = 2)
    (h₃ : c.im.fst = 0) (h₄ : c.im.snd = 0) :
    c.embedding pb.gen = (Real.sqrt 2 : ℂ) ∧
      c.embedding (1 + pb.gen) = 1 + (Real.sqrt 2 : ℂ) := sorry

-- archimedean_sqrt_two_real: the same certificate gives a real embedding.
example (pb : PowerBasis ℚ K) (h : minpoly ℚ pb.gen = X ^ 2 - C 2)
    (c : ArchimedeanEmbeddingCertificate pb) (h₁ : c.re.fst = 1) (h₂ : c.re.snd = 2)
    (h₃ : c.im.fst = 0) (h₄ : c.im.snd = 0) :
    NumberField.ComplexEmbedding.IsReal c.embedding := sorry

-- archimedean_degree_one: for minpoly X - 1 the box [1, 1] × [0, 0] is a certificate,
-- and every certificate fixes ℚ.
example (pb : PowerBasis ℚ K) (h : minpoly ℚ pb.gen = X - C 1) :
    (∃ c : ArchimedeanEmbeddingCertificate pb, c.re.fst = 1 ∧ c.re.snd = 1 ∧
      c.im.fst = 0 ∧ c.im.snd = 0) ∧
    ∀ (c : ArchimedeanEmbeddingCertificate pb) (q : ℚ),
      c.embedding (algebraMap ℚ K q) = (q : ℂ) := sorry

-- archimedean_ambiguous_box: [-2, 2] × [0, 0] isolates no root of X² - 2.
example (pb : PowerBasis ℚ K) (h : minpoly ℚ pb.gen = X ^ 2 - C 2) :
    ¬ ∃ c : ArchimedeanEmbeddingCertificate pb, c.re.fst = -2 ∧ c.re.snd = 2 ∧
      c.im.fst = 0 ∧ c.im.snd = 0 := sorry

-- archimedean_conjugate_place: for X² + 1 the boxes around i and -i give one place.
example (pb : PowerBasis ℚ K) (h : minpoly ℚ pb.gen = X ^ 2 + 1)
    (c c' : ArchimedeanEmbeddingCertificate pb) (h₁ : c.im.fst = 1) (h₂ : c'.im.snd = -1) :
    NumberField.InfinitePlace.mk c.embedding = NumberField.InfinitePlace.mk c'.embedding :=
  sorry

/-! ### ED.0/hensel-root-distance -/

/-- Hensel's lemma with the exact distance from any point of the Hensel disc to the root. -/
theorem norm_sub_eq_of_hensel {p : ℕ} [Fact p.Prime] {R : Type*} [CommSemiring R]
    [Algebra R ℤ_[p]] {F : R[X]} {a b z : ℤ_[p]}
    (hnorm : ‖F.aeval a‖ < ‖F.derivative.aeval a‖ ^ 2) (hz : F.aeval z = 0)
    (hza : ‖z - a‖ < ‖F.derivative.aeval a‖) (hb : ‖b - a‖ < ‖F.derivative.aeval a‖) :
    ‖F.derivative.aeval b‖ = ‖F.derivative.aeval a‖ ∧
      ‖z - b‖ = ‖F.aeval b‖ / ‖F.derivative.aeval a‖ := sorry

/-! ### ED.0/padic-embedding-certificate -/

/-- An integer `a` satisfying Hensel's condition for the monic integer minimal polynomial `f`
of the power-basis generator. -/
structure PadicEmbeddingCertificate (p : ℕ) [Fact p.Prime] (pb : PowerBasis ℚ K) (f : ℤ[X]) where
  minpoly_eq : minpoly ℚ pb.gen = f.map (Int.castRingHom ℚ)
  a : ℤ
  hensel : ‖(f.map (Int.castRingHom ℤ_[p])).eval (a : ℤ_[p])‖ <
    ‖(f.map (Int.castRingHom ℤ_[p])).derivative.eval (a : ℤ_[p])‖ ^ 2

namespace PadicEmbeddingCertificate

variable {p : ℕ} [Fact p.Prime] {pb : PowerBasis ℚ K} {f : ℤ[X]}
variable (c : PadicEmbeddingCertificate p pb f)

/-- The Hensel root `z` with `‖z - a‖ < ‖f'(a)‖`. -/
def root (c : PadicEmbeddingCertificate p pb f) : ℤ_[p] := sorry

/-- `PowerBasis.lift pb c.root`. -/
def embedding (c : PadicEmbeddingCertificate p pb f) : K →+* ℚ_[p] := sorry

@[simp] theorem embedding_gen : c.embedding pb.gen = (c.root : ℚ_[p]) := sorry

theorem eq_embedding_of_near (σ : K →+* ℚ_[p])
    (h : ‖σ pb.gen - (c.a : ℚ_[p])‖ <
      ‖(f.map (Int.castRingHom ℤ_[p])).derivative.eval (c.a : ℤ_[p])‖) :
    σ = c.embedding := sorry

theorem root_sub_mem (b : ℤ) (N : ℤ)
    (hb : ‖((b - c.a : ℤ) : ℤ_[p])‖ <
      ‖(f.map (Int.castRingHom ℤ_[p])).derivative.eval (c.a : ℤ_[p])‖)
    (hN : ‖(f.map (Int.castRingHom ℤ_[p])).eval (b : ℤ_[p])‖ ≤
      (p : ℝ) ^ (-N) * ‖(f.map (Int.castRingHom ℤ_[p])).derivative.eval (c.a : ℤ_[p])‖) :
    ‖(c.root : ℚ_[p]) - (b : ℚ_[p])‖ ≤ (p : ℝ) ^ (-N) := sorry

/-- A p-adic enclosure of `σ_a(α)` of absolute precision at least `n`. -/
def evalEnclosure (α : K) (n : ℤ) : ED0.PadicEnclosure p (c.embedding α) := sorry

theorem evalEnclosure_precision (α : K) (n : ℤ) : n ≤ (c.evalEnclosure α n).precision := sorry

theorem ne_of_far (c' : PadicEmbeddingCertificate p pb f)
    (h : max ‖(f.map (Int.castRingHom ℤ_[p])).derivative.eval (c.a : ℤ_[p])‖
        ‖(f.map (Int.castRingHom ℤ_[p])).derivative.eval (c'.a : ℤ_[p])‖ ≤
      ‖((c.a - c'.a : ℤ) : ℤ_[p])‖) :
    c.embedding ≠ c'.embedding := sorry

theorem embedding_algebraMap (q : ℚ) : c.embedding (algebraMap ℚ K q) = (q : ℚ_[p]) := sorry

end PadicEmbeddingCertificate

-- padic_sqrt_two_seven: for X² - 2, p = 7, a = 3, the root is ≡ 10 (mod 49).
example [Fact (Nat.Prime 7)] (pb : PowerBasis ℚ K)
    (c : PadicEmbeddingCertificate 7 pb (X ^ 2 - C 2)) (ha : c.a = 3) :
    ‖(c.root : ℚ_[7]) - 10‖ ≤ (7 : ℝ) ^ (-(2 : ℤ)) := sorry

-- padic_sqrt_two_two_roots: a = 3 and a = 4 give different embeddings ℚ(√2) → ℚ_7.
example [Fact (Nat.Prime 7)] (pb : PowerBasis ℚ K)
    (c c' : PadicEmbeddingCertificate 7 pb (X ^ 2 - C 2)) (ha : c.a = 3) (ha' : c'.a = 4) :
    c.embedding ≠ c'.embedding := sorry

-- padic_degree_one: for X - 1 the certificate a = 1 has root 1.
example {p : ℕ} [Fact p.Prime] (pb : PowerBasis ℚ K)
    (c : PadicEmbeddingCertificate p pb (X - C 1)) (ha : c.a = 1) : c.root = 1 := sorry

-- padic_no_root_five: X² - 2 has no Hensel certificate at p = 5.
example [Fact (Nat.Prime 5)] (pb : PowerBasis ℚ K) :
    IsEmpty (PadicEmbeddingCertificate 5 pb (X ^ 2 - C 2)) := sorry

-- padic_embedding_rat: σ_a restricted to ℚ is the canonical map.
example {p : ℕ} [Fact p.Prime] (pb : PowerBasis ℚ K) {f : ℤ[X]}
    (c : PadicEmbeddingCertificate p pb f) :
    c.embedding.comp (algebraMap ℚ K) = algebraMap ℚ ℚ_[p] := sorry

/-! ### ED.0/certified-nonvanishing -/

/-- A box excluding `0` around `σ_c(α)` proves `α ≠ 0`. -/
theorem ne_zero_of_enclosure {pb : PowerBasis ℚ K} (c : ArchimedeanEmbeddingCertificate pb)
    (α : K) (e : ComplexEnclosure (c.embedding α))
    (h : 0 < e.re.fst ∨ e.re.snd < 0 ∨ 0 < e.im.fst ∨ e.im.snd < 0) : α ≠ 0 := sorry

/-- The exact zero test in power-basis coordinates. -/
theorem eq_zero_iff_repr (pb : PowerBasis ℚ K) (α : K) :
    α = 0 ↔ ∀ j, pb.basis.repr α j = 0 := sorry

theorem ne_zero_of_padicEnclosure {p : ℕ} [Fact p.Prime] {pb : PowerBasis ℚ K} {f : ℤ[X]}
    (c : PadicEmbeddingCertificate p pb f) (α : K) (e : PadicEnclosure p (c.embedding α))
    (h₀ : e.centre ≠ 0) (hv : padicValRat p e.centre < e.precision) : α ≠ 0 := sorry

/-- Completeness of the exclusion test. -/
theorem excludes_zero_of_precision {pb : PowerBasis ℚ K} (c : ArchimedeanEmbeddingCertificate pb)
    (α : K) (n : ℕ) (e : ComplexEnclosure (c.embedding α))
    (hw : e.re.snd - e.re.fst ≤ (2 : ℚ) ^ (-(n : ℤ)) ∧ e.im.snd - e.im.fst ≤ (2 : ℚ) ^ (-(n : ℤ)))
    (hlarge : 2 * (4 : ℝ) ^ (-(n : ℤ)) < Complex.normSq (c.embedding α)) :
    0 < e.re.fst ∨ e.re.snd < 0 ∨ 0 < e.im.fst ∨ e.im.snd < 0 := sorry

/-- Numerical agreement proves nothing: a nonzero number with an enclosure containing 0. -/
theorem exists_enclosure_zero_mem (n : ℕ) :
    ∃ e : RealEnclosure ((2 : ℝ) ^ (-(n : ℤ) - 1)), e.interval.fst = 0 ∧
      e.width = (2 : ℚ) ^ (-(n : ℤ)) := sorry

/-! ### ED.0/valuation-certificate -/

/-- A p-adic enclosure of `σ_a(α)` whose precision exceeds the valuation of its centre. -/
structure ValuationCertificate {p : ℕ} [Fact p.Prime] {pb : PowerBasis ℚ K} {f : ℤ[X]}
    (c : PadicEmbeddingCertificate p pb f) (α : K) where
  enclosure : PadicEnclosure p (c.embedding α)
  centre_ne_zero : enclosure.centre ≠ 0
  valuation_lt : padicValRat p enclosure.centre < enclosure.precision

namespace ValuationCertificate

variable {p : ℕ} [Fact p.Prime] {pb : PowerBasis ℚ K} {f : ℤ[X]}
variable {c : PadicEmbeddingCertificate p pb f} {α β : K}

theorem valuation_eq (v : ValuationCertificate c α) :
    (c.embedding α).valuation = padicValRat p v.enclosure.centre := sorry

theorem ne_zero (v : ValuationCertificate c α) : α ≠ 0 := sorry

theorem exists_of_ne_zero (hα : α ≠ 0) (N : ℤ) (hN : (c.embedding α).valuation < N) :
    ∃ v : ValuationCertificate c α, v.enclosure.precision = N := sorry

/-- The degree-one prime `{x ∈ 𝓞 K : ‖σ_a x‖ < 1}`. -/
def prime (c : PadicEmbeddingCertificate p pb f) :
    IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers K) := sorry

theorem adicValuation_eq (c : PadicEmbeddingCertificate p pb f) (hα : α ≠ 0) :
    (prime c).valuation K α = WithZero.exp (-(c.embedding α).valuation) := sorry

/-- Valuation certificates multiply: `(c c', min (v + N') (N + v'))`. -/
def mul (v : ValuationCertificate c α) (w : ValuationCertificate c β) :
    ValuationCertificate c (α * β) := sorry

end ValuationCertificate

-- valuation_rat_eighteen: for ℚ (minpoly X - 1, a = 1) and p = 3, valuation of 18 is 2.
example [Fact (Nat.Prime 3)] (pb : PowerBasis ℚ ℚ)
    (c : PadicEmbeddingCertificate 3 pb (X - C 1)) :
    ∃ v : ValuationCertificate c 18, v.enclosure.centre = 18 ∧ v.enclosure.precision = 3 ∧
      (c.embedding 18).valuation = padicValRat 3 v.enclosure.centre ∧ padicValRat 3 18 = 2 :=
  sorry

-- valuation_sqrt_two_seven: v_7(σ_a(θ - 3)) = 1 for X² - 2, a = 3.
example [Fact (Nat.Prime 7)] (pb : PowerBasis ℚ K)
    (c : PadicEmbeddingCertificate 7 pb (X ^ 2 - C 2)) (ha : c.a = 3) :
    (c.embedding (pb.gen - 3)).valuation = 1 := sorry

-- valuation_unit: the enclosure (1, 1) of σ_a(1) certifies valuation 0.
example {p : ℕ} [Fact p.Prime] {pb : PowerBasis ℚ K} {f : ℤ[X]}
    (c : PadicEmbeddingCertificate p pb f) :
    ∃ v : ValuationCertificate c 1, v.enclosure.centre = 1 ∧ v.enclosure.precision = 1 ∧
      padicValRat p v.enclosure.centre = 0 := sorry

-- valuation_zero_centre: at p = 7 the enclosure (0, 2) of 49 is not a valuation certificate
-- although 49 ≠ 0: its centre is 0.
example [Fact (Nat.Prime 7)] {pb : PowerBasis ℚ K} {f : ℤ[X]}
    (c : PadicEmbeddingCertificate 7 pb f) :
    (49 : K) ≠ 0 ∧ ∃ e : PadicEnclosure 7 (c.embedding 49), e.centre = 0 ∧ e.precision = 2 ∧
      ∀ v : ValuationCertificate c 49, v.enclosure ≠ e := sorry

/-! ### ED.0/height-enclosure -/

/-- A rational enclosure of Mathlib's relative height `mulHeight₁ x` of absolute precision `n`. -/
def heightEnclosure (pb : PowerBasis ℚ K) (x : K) (n : ℕ) :
    RealEnclosure (Height.mulHeight₁ x) := sorry

theorem heightEnclosure_width (pb : PowerBasis ℚ K) (x : K) (n : ℕ) :
    (heightEnclosure pb x n).width ≤ (2 : ℚ) ^ (-(n : ℤ)) := sorry

theorem charpoly_leftMul_basis_independent {ι ι' : Type*} [Fintype ι] [DecidableEq ι]
    [Fintype ι'] [DecidableEq ι'] (b : Module.Basis ι ℚ K) (b' : Module.Basis ι' ℚ K) (x : K) :
    (Algebra.leftMulMatrix b x).charpoly = (Algebra.leftMulMatrix b' x).charpoly := sorry
theorem charpoly_leftMul_arbitrary (pb : PowerBasis ℚ K) (x : K) :
    (Algebra.leftMulMatrix pb.basis x).charpoly =
      minpoly ℚ x ^ (Module.finrank ℚ K / (minpoly ℚ x).natDegree) := sorry

/-- `mulHeight₁ x` is the Mahler measure of the primitive integral multiple of the
characteristic polynomial of `x` (via DT.0/height-comparisons). -/
theorem mulHeight₁_eq_mahlerMeasure_charpoly (pb : PowerBasis ℚ K) (x : K) :
    ∃ P : ℤ[X], P.IsPrimitive ∧ 0 < P.leadingCoeff ∧
      (∃ q : ℚ, q ≠ 0 ∧ P.map (Int.castRingHom ℚ) =
        C q * (Algebra.leftMulMatrix pb.basis x).charpoly) ∧
      Height.mulHeight₁ x = (P.map (Int.castRingHom ℂ)).mahlerMeasure := sorry

/-- The non-archimedean part of the height is the leading coefficient of the primitive
characteristic polynomial; the archimedean part is read from the embeddings. -/
theorem mulHeight₁_eq_leadingCoeff_mul_prod_embeddings (pb : PowerBasis ℚ K) (x : K) :
    ∃ P : ℤ[X], P.IsPrimitive ∧ 0 < P.leadingCoeff ∧
      (∃ q : ℚ, q ≠ 0 ∧ P.map (Int.castRingHom ℚ) =
        C q * (Algebra.leftMulMatrix pb.basis x).charpoly) ∧
      Height.mulHeight₁ x = (P.leadingCoeff : ℝ) * ∏ σ : K →+* ℂ, max 1 ‖σ x‖ := sorry

theorem heightEnclosure_rat (pb : PowerBasis ℚ ℚ) (x : ℚ) (n : ℕ) :
    (heightEnclosure pb x n).interval.fst ≤ (max x.num.natAbs x.den : ℕ) ∧
      ((max x.num.natAbs x.den : ℕ) : ℚ) ≤ (heightEnclosure pb x n).interval.snd := sorry

-- height_half: for x = 1/2 ∈ ℚ, P_x = 2X − 1 and mulHeight₁ x = 2; every enclosure contains 2.
example (pb : PowerBasis ℚ ℚ) (n : ℕ) : Height.mulHeight₁ (1 / 2 : ℚ) = 2 ∧
    ((2 * X - 1 : ℤ[X]).map (Int.castRingHom ℂ)).mahlerMeasure = 2 ∧
    (heightEnclosure pb (1 / 2) n).interval.fst ≤ 2 ∧
      2 ≤ (heightEnclosure pb (1 / 2) n).interval.snd := sorry

-- height_sqrt_two: mulHeight₁ √2 = 2 in ℚ(√2).
example (pb : PowerBasis ℚ K) (h : minpoly ℚ pb.gen = X ^ 2 - C 2) :
    Height.mulHeight₁ pb.gen = 2 := sorry

-- height_zero: mulHeight₁ 0 = 1 and every enclosure of it contains 1.
example (pb : PowerBasis ℚ K) (n : ℕ) : Height.mulHeight₁ (0 : K) = 1 ∧
    (heightEnclosure pb 0 n).interval.fst ≤ 1 ∧ 1 ≤ (heightEnclosure pb 0 n).interval.snd :=
  sorry

-- height_golden: mulHeight₁ φ = (1 + √5)/2 for minpoly X² - X - 1.
example (pb : PowerBasis ℚ K) (h : minpoly ℚ pb.gen = X ^ 2 - X - 1) :
    Height.mulHeight₁ pb.gen = (1 + Real.sqrt 5) / 2 := sorry

-- height_relative_not_absolute: in ℚ(√2) the relative height of √2 is 2, the absolute one √2.
example (pb : PowerBasis ℚ K) (h : minpoly ℚ pb.gen = X ^ 2 - C 2) :
    Height.mulHeight₁ pb.gen = 2 ∧ NumberField.absMulHeight₁ pb.gen = Real.sqrt 2 := sorry

/-! ### ED.0/bounded-height-enumeration -/

/-- The pair `(S_<, S_≈)`: certainly below `D`, and within `τ` of `D`. -/
def boundedHeightPoints (pb : PowerBasis ℚ K) (hint : IsIntegral ℤ pb.gen) (D τ : ℚ) :
    Finset K × Finset K := sorry

theorem mem_boundedHeightPoints_of_mulHeight₁_le (pb : PowerBasis ℚ K)
    (hint : IsIntegral ℤ pb.gen) {D τ : ℚ} (hD : 1 ≤ D) (hτ : 0 < τ) (x : K)
    (hx : Height.mulHeight₁ x ≤ D) :
    x ∈ (boundedHeightPoints pb hint D τ).1 ∪ (boundedHeightPoints pb hint D τ).2 := sorry

theorem mulHeight₁_lt_of_mem_lt (pb : PowerBasis ℚ K) (hint : IsIntegral ℤ pb.gen)
    {D τ : ℚ} (x : K) (hx : x ∈ (boundedHeightPoints pb hint D τ).1) :
    Height.mulHeight₁ x < D := sorry

theorem abs_mulHeight₁_sub_lt_of_mem_near (pb : PowerBasis ℚ K) (hint : IsIntegral ℤ pb.gen)
    {D τ : ℚ} (hτ : 0 < τ) (x : K) (hx : x ∈ (boundedHeightPoints pb hint D τ).2) :
    |Height.mulHeight₁ x - D| < τ := sorry

/-- The finite set `T ⊆ ℙ¹(K)`: `[x : 1]` for listed `x`, and `[1 : 0]`. -/
def boundedHeightProjectivePoints (pb : PowerBasis ℚ K) (hint : IsIntegral ℤ pb.gen)
    (D τ : ℚ) : Finset (Projectivization K (Fin 2 → K)) := sorry

theorem mem_boundedHeightProjectivePoints (pb : PowerBasis ℚ K) (hint : IsIntegral ℤ pb.gen)
    {D τ : ℚ} (hD : 1 ≤ D) (hτ : 0 < τ) (P : Projectivization K (Fin 2 → K))
    (hP : Height.logHeight P.rep ≤ Real.log D) :
    P ∈ boundedHeightProjectivePoints pb hint D τ := sorry

theorem boundedHeightPoints_superset (pb : PowerBasis ℚ K) (hint : IsIntegral ℤ pb.gen)
    {D τ : ℚ} (hD : 1 ≤ D) (hτ : 0 < τ) :
    (NumberField.finite_setOfPred_mulHeight₁_le K D).toFinset ⊆
      (boundedHeightPoints pb hint D τ).1 ∪ (boundedHeightPoints pb hint D τ).2 := sorry

-- bounded_height_rat_two: for ℚ, D = 2, τ = 1/2 the lists are {0, ±1} and {±2, ±1/2}.
example (pb : PowerBasis ℚ ℚ) (hint : IsIntegral ℤ pb.gen) :
    (boundedHeightPoints pb hint 2 (1 / 2)).1 = {0, 1, -1} ∧
      (boundedHeightPoints pb hint 2 (1 / 2)).2 = {2, -2, 1 / 2, -1 / 2} := sorry

-- bounded_height_gaussian_one: for ℚ(i), D = 1: S_< = ∅ and S_≈ = {0, ±1, ±i}.
example (pb : PowerBasis ℚ K) (hint : IsIntegral ℤ pb.gen) (h : minpoly ℚ pb.gen = X ^ 2 + 1)
    (τ : ℚ) (hτ : 0 < τ) (hτ' : τ ≤ 1) :
    (boundedHeightPoints pb hint 1 τ).1 = ∅ ∧
      (boundedHeightPoints pb hint 1 τ).2 = {0, 1, -1, pb.gen, -pb.gen} := sorry

-- bounded_height_integral_only: 1/2 is listed for ℚ, D = 2, but is not integral.
example (pb : PowerBasis ℚ ℚ) (hint : IsIntegral ℤ pb.gen) :
    (1 / 2 : ℚ) ∈ (boundedHeightPoints pb hint 2 (1 / 2)).2 ∧ ¬ IsIntegral ℤ (1 / 2 : ℚ) :=
  sorry

-- bounded_height_infinity: [1 : 0] is always listed.
example (pb : PowerBasis ℚ K) (hint : IsIntegral ℤ pb.gen) {D τ : ℚ} (hD : 1 ≤ D)
    (hτ : 0 < τ) (h : (![1, 0] : Fin 2 → K) ≠ 0) :
    Projectivization.mk K ![1, 0] h ∈ boundedHeightProjectivePoints pb hint D τ := sorry

-- bounded_height_superset: for ℚ and D = 3 the 15 elements of height ≤ 3 are listed.
example (pb : PowerBasis ℚ ℚ) (hint : IsIntegral ℤ pb.gen) :
    {x : ℚ | Height.mulHeight₁ x ≤ 3}.ncard = 15 ∧
      {x : ℚ | Height.mulHeight₁ x ≤ 3} ⊆
        ↑((boundedHeightPoints pb hint 3 (1 / 2)).1 ∪ (boundedHeightPoints pb hint 3 (1 / 2)).2) :=
  sorry

end TauCeti.EffectiveDiophantine.ED0

namespace TauCeti.EffectiveDiophantine.ED1

variable {k : ℕ}

/-! ### ED.1/linear-form-lattice

Unknowns are indexed by `Fin (k + 1)`; the last index `Fin.last k` carries the form. -/

/-- The integer matrix `A`: `diag(W_1, …, W_k)` above, `(φ_1, …, φ_{k+1})` as last row. -/
def linearFormMatrix (W φ : Fin (k + 1) → ℤ) : Matrix (Fin (k + 1)) (Fin (k + 1)) ℤ :=
  fun i j => if i = Fin.last k then φ j else if i = j then W i else 0

theorem linearFormMatrix_mulVec (W φ x : Fin (k + 1) → ℤ) :
    linearFormMatrix W φ *ᵥ x =
      fun i => if i = Fin.last k then ∑ j, x j * φ j else W i * x i := sorry

theorem linearFormMatrix_det (W φ : Fin (k + 1) → ℤ) :
    (linearFormMatrix W φ).det = (∏ i : Fin k, W i.castSucc) * φ (Fin.last k) := sorry

/-- The approximation lattice `Γ = A ℤ^(k+1)`. -/
def linearFormLattice (W φ : Fin (k + 1) → ℤ) : AddSubgroup (Fin (k + 1) → ℤ) := sorry

theorem mem_linearFormLattice (W φ : Fin (k + 1) → ℤ) (hW : ∀ i, W i ≠ 0)
    (v : Fin (k + 1) → ℤ) :
    v ∈ linearFormLattice W φ ↔ (∀ i : Fin k, W i.castSucc ∣ v i.castSucc) ∧
      φ (Fin.last k) ∣ v (Fin.last k) - ∑ i : Fin k, v i.castSucc / W i.castSucc * φ i.castSucc :=
  sorry

theorem linearFormMatrix_mulVec_injective (W φ : Fin (k + 1) → ℤ) (hW : ∀ i, W i ≠ 0)
    (hφ : φ (Fin.last k) ≠ 0) : Function.Injective (linearFormMatrix W φ).mulVec := sorry

theorem normSq_linearFormMatrix_mulVec (W φ x : Fin (k + 1) → ℤ) :
    ∑ i, ((linearFormMatrix W φ *ᵥ x) i) ^ 2 =
      ∑ i : Fin k, (W i.castSucc * x i.castSucc) ^ 2 + (∑ j, x j * φ j) ^ 2 := sorry

theorem abs_linearForm_sub_le (C : ℝ) (θ : Fin (k + 1) → ℝ) (φ : Fin (k + 1) → ℤ)
    (hφ : ∀ i, |(φ i : ℝ) - C * θ i| ≤ 1) (x : Fin (k + 1) → ℤ) :
    |(∑ j, (x j : ℝ) * φ j) - C * ∑ j, (x j : ℝ) * θ j| ≤ ∑ j, |(x j : ℝ)| := sorry

/-- The inhomogeneous target `y = (0, …, 0, -ψ)`. -/
def linearFormTarget (ψ : ℤ) : Fin (k + 1) → ℤ :=
  fun i => if i = Fin.last k then -ψ else 0

theorem normSq_linearFormMatrix_mulVec_sub_target (W φ x : Fin (k + 1) → ℤ) (ψ : ℤ) :
    ∑ i, ((linearFormMatrix W φ *ᵥ x - linearFormTarget (k := k) ψ : Fin (k + 1) → ℤ) i) ^ 2 =
      ∑ i : Fin k, (W i.castSucc * x i.castSucc) ^ 2 + (∑ j, x j * φ j + ψ) ^ 2 := sorry

/-- `round (C · midpoint)` of a real enclosure. -/
def roundOfEnclosure (C : ℚ) {θ : ℝ} (e : ED0.RealEnclosure θ) : ℤ := sorry

theorem roundOfEnclosure_spec (C : ℚ) (hC : 0 < C) {θ : ℝ} (e : ED0.RealEnclosure θ)
    (hw : C * e.width ≤ 1) : |(roundOfEnclosure C e : ℝ) - (C : ℝ) * θ| ≤ 1 := sorry

theorem linearFormMatrix_gram_integral (W φ : Fin (k + 1) → ℤ) (i j : Fin (k + 1)) :
    ∑ l, ((linearFormMatrix W φ l i : ℤ) : ℝ) * ((linearFormMatrix W φ l j : ℤ) : ℝ) =
      (((linearFormMatrix W φ)ᵀ * linearFormMatrix W φ) i j : ℝ) := sorry

-- lfl_two_dim: W₁ = 1, φ = (3, 7): A = [[1, 0], [3, 7]], det 7, (1, 3) ∈ Γ, (0, 1) ∉ Γ.
example : linearFormMatrix (k := 1) ![1, 0] ![3, 7] = !![1, 0; 3, 7] ∧
    (linearFormMatrix (k := 1) ![1, 0] ![3, 7]).det = 7 ∧
    ![1, 3] ∈ linearFormLattice (k := 1) ![1, 0] ![3, 7] ∧
    ![0, 1] ∉ linearFormLattice (k := 1) ![1, 0] ![3, 7] := sorry

-- lfl_unimodular: unit weights and φ_last = 1 give Γ = ℤ^(k+1).
example (W φ : Fin (k + 1) → ℤ) (hW : ∀ i, W i = 1) (hφ : φ (Fin.last k) = 1) :
    linearFormLattice W φ = ⊤ := sorry

-- lfl_log_rounding: θ = (log 2, log 3), C = 10^8: from enclosures of width 10^(−9) the
-- rounding gives φ = (69314718, 109861229).
example (e₂ : ED0.RealEnclosure (Real.log 2)) (e₃ : ED0.RealEnclosure (Real.log 3))
    (h₂ : e₂.width ≤ 1 / 10 ^ 9) (h₃ : e₃.width ≤ 1 / 10 ^ 9) :
    roundOfEnclosure (10 ^ 8) e₂ = 69314718 ∧ roundOfEnclosure (10 ^ 8) e₃ = 109861229 := sorry

-- lfl_singular: φ_last = 0 gives a singular matrix.
example (W φ : Fin (k + 1) → ℤ) :
    (linearFormMatrix W (Function.update φ (Fin.last k) 0)).det = 0 := sorry

-- lfl_mem_iff: for W₁ = 1, φ = (3, 7): v ∈ Γ iff 7 ∣ v₂ - 3 v₁.
example (v : Fin 2 → ℤ) :
    v ∈ linearFormLattice (k := 1) ![1, 0] ![3, 7] ↔ (7 : ℤ) ∣ v 1 - 3 * v 0 := sorry

/-! ### ED.1/reduced-basis-distance-lower-bound -/

section Reduced

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E] {n : ℕ}

/-- de Weger, Lemma 3.5 (zero-based): the distance from `y = ∑ sᵢ cᵢ` to the lattice. -/
theorem sq_norm_sub_ge_of_reduced (c : Fin (n + 1) → E) (hc : LinearIndependent ℝ c)
    (hgs : ∀ i, (2 : ℝ) ^ (-(n : ℤ)) * ‖c 0‖ ^ 2 ≤ ‖InnerProductSpace.gramSchmidt ℝ c i‖ ^ 2)
    (s : Fin (n + 1) → ℝ) (i₀ : Fin (n + 1)) (hi₀ : s i₀ ∉ Set.range ((↑) : ℤ → ℝ))
    (hmax : ∀ i, i₀ < i → s i ∈ Set.range ((↑) : ℤ → ℝ))
    (v : E) (hv : v ∈ Submodule.span ℤ (Set.range c)) :
    (2 : ℝ) ^ (-(n : ℤ)) * (min (Int.fract (s i₀)) (1 - Int.fract (s i₀))) ^ 2 * ‖c 0‖ ^ 2 ≤
      ‖v - ∑ i, s i • c i‖ ^ 2 := sorry

/-- de Weger, Lemma 3.4: the homogeneous case. -/
theorem sq_norm_ge_of_reduced (c : Fin (n + 1) → E) (hc : LinearIndependent ℝ c)
    (hgs : ∀ i, (2 : ℝ) ^ (-(n : ℤ)) * ‖c 0‖ ^ 2 ≤ ‖InnerProductSpace.gramSchmidt ℝ c i‖ ^ 2)
    (v : E) (hv : v ∈ Submodule.span ℤ (Set.range c)) (hv0 : v ≠ 0) :
    (2 : ℝ) ^ (-(n : ℤ)) * ‖c 0‖ ^ 2 ≤ ‖v‖ ^ 2 := sorry

/-- de Weger, Lemma 3.6 (zero-based): the variant for a nearly integral tail. -/
theorem norm_sub_ge_of_reduced_variant (c : Fin (n + 1) → E) (hc : LinearIndependent ℝ c)
    (hgs : ∀ i, (2 : ℝ) ^ (-(n : ℤ)) * ‖c 0‖ ^ 2 ≤ ‖InnerProductSpace.gramSchmidt ℝ c i‖ ^ 2)
    (s : Fin (n + 1) → ℝ) (i₀ : Fin (n + 1)) (δ₁ δ₂ M : ℝ) (hδ₂ : 0 < δ₂)
    (htail : ∀ i, i₀ < i → min (Int.fract (s i)) (1 - Int.fract (s i)) ≤ δ₁)
    (hhead : δ₂ ≤ min (Int.fract (s i₀)) (1 - Int.fract (s i₀)))
    (hM : ∀ i, i₀ < i → ‖c i‖ ≤ M) (v : E) (hv : v ∈ Submodule.span ℤ (Set.range c)) :
    Real.sqrt ((2 : ℝ) ^ (-(n : ℤ))) * δ₂ * ‖c 0‖ - ((n - i₀.val : ℕ) : ℝ) * δ₁ * M ≤
      ‖v - ∑ i, s i • c i‖ := sorry

end Reduced

/-! ### ED.1/homogeneous-reduction and ED.1/inhomogeneous-reduction -/

theorem mul_abs_linearForm_ge_of_norm_ge (W φ : Fin (k + 1) → ℤ) (C : ℝ) (hC : 0 < C)
    (θ : Fin (k + 1) → ℝ) (hφ : ∀ i, |(φ i : ℝ) - C * θ i| ≤ 1)
    (hφn : φ (Fin.last k) ≠ 0) (hW : ∀ i, W i ≠ 0) (X : Fin (k + 1) → ℝ) (μ L : ℝ)
    (hμ : 0 < μ) (hL0 : 0 ≤ L)
    (hL : ∑ i : Fin k, ((W i.castSucc : ℝ) * X i.castSucc) ^ 2 + (∑ i, X i + μ) ^ 2 ≤ L ^ 2)
    (hΓ : ∀ v ∈ linearFormLattice W φ, v ≠ 0 → L ^ 2 ≤ ∑ i, ((v i : ℤ) : ℝ) ^ 2)
    (x : Fin (k + 1) → ℤ) (hx0 : x ≠ 0) (hx : ∀ i, |(x i : ℝ)| ≤ X i) :
    μ ≤ C * |∑ i, (x i : ℝ) * θ i| := sorry

theorem mul_abs_inhomogeneousForm_ge_of_dist_ge (W φ : Fin (k + 1) → ℤ) (ψ : ℤ) (C : ℝ)
    (hC : 0 < C) (θ : Fin (k + 1) → ℝ) (β : ℝ) (hφ : ∀ i, |(φ i : ℝ) - C * θ i| ≤ 1)
    (hψ : |(ψ : ℝ) - C * β| ≤ 1) (hφn : φ (Fin.last k) ≠ 0) (hW : ∀ i, W i ≠ 0)
    (X : Fin (k + 1) → ℝ) (μ L : ℝ) (hμ : 0 < μ) (hL0 : 0 ≤ L)
    (hL : ∑ i : Fin k, ((W i.castSucc : ℝ) * X i.castSucc) ^ 2 + (1 + ∑ i, X i + μ) ^ 2 ≤ L ^ 2)
    (hΓ : ∀ v ∈ linearFormLattice W φ,
      L ^ 2 ≤ ∑ i, (((v - linearFormTarget (k := k) ψ : Fin (k + 1) → ℤ) i : ℤ) : ℝ) ^ 2)
    (x : Fin (k + 1) → ℤ) (hx : ∀ i, |(x i : ℝ)| ≤ X i) :
    μ ≤ C * |β + ∑ i, (x i : ℝ) * θ i| := sorry

/-! ### ED.1/padic-linear-form-lattice -/

section Padic

variable {p : ℕ} [Fact p.Prime]

/-- `A_m`: `diag(W_1, …, W_k)` above, `W_{k+1} (β_1^(m), …, β_k^(m), p^m)` as last row. -/
def padicLatticeMatrix (m : ℕ) (W : Fin (k + 1) → ℤ) (β : Fin k → ℤ_[p]) :
    Matrix (Fin (k + 1)) (Fin (k + 1)) ℤ := sorry

theorem padicLatticeMatrix_last (m : ℕ) (W : Fin (k + 1) → ℤ) (β : Fin k → ℤ_[p]) (j : Fin k) :
    padicLatticeMatrix m W β (Fin.last k) j.castSucc =
      W (Fin.last k) * (PadicInt.appr (β j) m : ℤ) := sorry

/-- `Γ_m = A_m ℤ^(k+1)`. -/
def padicLattice (m : ℕ) (W : Fin (k + 1) → ℤ) (β : Fin k → ℤ_[p]) :
    AddSubgroup (Fin (k + 1) → ℤ) := sorry

/-- The target `y_m = (0, …, 0, -W_{k+1} β_0^(m))`. -/
def padicLatticeTarget (m : ℕ) (W : Fin (k + 1) → ℤ) (β₀ : ℤ_[p]) : Fin (k + 1) → ℤ := sorry

/-- `Λ'(b) = b_{k+1} - β_0 - ∑ b_j β_j`. -/
def padicLinearForm (β₀ : ℤ_[p]) (β : Fin k → ℤ_[p]) (b : Fin (k + 1) → ℤ) : ℤ_[p] := sorry

theorem padicLinearForm_eq (β₀ : ℤ_[p]) (β : Fin k → ℤ_[p]) (b : Fin (k + 1) → ℤ) :
    padicLinearForm β₀ β b = (b (Fin.last k) : ℤ_[p]) - β₀ -
      ∑ j : Fin k, (b j.castSucc : ℤ_[p]) * β j := sorry

/-- Tzanakis–de Weger 1992, Lemma 14 (de Weger, Lemmas 3.13 and 3.15 with the sign of `y`
corrected). -/
theorem mem_padicLattice_iff (m : ℕ) (W : Fin (k + 1) → ℤ) (hW : ∀ j, 0 < W j)
    (β₀ : ℤ_[p]) (β : Fin k → ℤ_[p]) (b : Fin (k + 1) → ℤ) :
    (p : ℤ_[p]) ^ m ∣ padicLinearForm β₀ β b ↔
      (fun j => W j * b j) + padicLatticeTarget m W β₀ ∈ padicLattice m W β := sorry

theorem padicLatticeMatrix_det (m : ℕ) (W : Fin (k + 1) → ℤ) (β : Fin k → ℤ_[p]) :
    (padicLatticeMatrix m W β).det = (p : ℤ) ^ m * ∏ j, W j := sorry

theorem padicLattice_antitone (m : ℕ) (W : Fin (k + 1) → ℤ) (β : Fin k → ℤ_[p]) :
    padicLattice (m + 1) W β ≤ padicLattice m W β := sorry

/-- The residue of an enclosure's centre modulo `p^m`. -/
def apprOfEnclosure {β : ℤ_[p]} (e : ED0.PadicEnclosure p (β : ℚ_[p])) (m : ℕ) : ℕ := sorry

theorem apprOfEnclosure_eq {β : ℤ_[p]} (e : ED0.PadicEnclosure p (β : ℚ_[p])) (m : ℕ)
    (hm : (m : ℤ) ≤ e.precision) (hc : 0 ≤ padicValRat p e.centre) :
    apprOfEnclosure e m = PadicInt.appr β m := sorry

-- plfl_three: p = 3, m = 1, W = (1, 1), β₁ = 0, β₀ = 1, b = (0, 1).
example [Fact (Nat.Prime 3)] :
    padicLinearForm (k := 1) (1 : ℤ_[3]) ![0] ![0, 1] = 0 ∧
      (fun j => (![1, 1] : Fin 2 → ℤ) j * (![0, 1] : Fin 2 → ℤ) j) +
          padicLatticeTarget 1 ![1, 1] (1 : ℤ_[3]) = 0 := sorry

-- plfl_sign: the translate by +(0, 1) characterises b₂ ≡ 2 (mod 3), not 3 ∣ Λ'(b).
example [Fact (Nat.Prime 3)] :
    ¬ ∀ b : Fin 2 → ℤ, ((3 : ℤ_[3]) ∣ padicLinearForm (k := 1) (1 : ℤ_[3]) ![0] b ↔
      b + ![0, 1] ∈ padicLattice 1 ![1, 1] (![0] : Fin 1 → ℤ_[3])) := sorry

-- plfl_m_zero: m = 0 makes every b admissible.
example (W : Fin (k + 1) → ℤ) (hW : ∀ j, 0 < W j) (β₀ : ℤ_[p]) (β : Fin k → ℤ_[p])
    (b : Fin (k + 1) → ℤ) :
    (fun j => W j * b j) + padicLatticeTarget 0 W β₀ ∈ padicLattice 0 W β := sorry

-- plfl_one_dim: for k = 0 the condition is b ≡ appr β₀ m (mod p^m).
example (m : ℕ) (W : Fin 1 → ℤ) (hW : 0 < W 0) (β₀ : ℤ_[p]) (b : Fin 1 → ℤ) :
    (p : ℤ_[p]) ^ m ∣ padicLinearForm β₀ (Fin.elim0) b ↔
      ((p : ℤ) ^ m ∣ b 0 - (PadicInt.appr β₀ m : ℤ)) := sorry

/-! ### ED.1/padic-reduction -/

theorem not_dvd_padicLinearForm_of_dist_ge (m : ℕ) (W : Fin (k + 1) → ℤ) (hW : ∀ j, 0 < W j)
    (β₀ : ℤ_[p]) (β : Fin k → ℤ_[p]) (X : Fin (k + 1) → ℝ) (L : ℝ)
    (hL : ∑ j, ((W j : ℝ) * X j) ^ 2 < L ^ 2)
    (hΓ : ∀ v ∈ padicLattice m W β, (padicLatticeTarget m W β₀ = 0 → v ≠ 0) →
      L ^ 2 ≤ ∑ i, (((v - padicLatticeTarget m W β₀) i : ℤ) : ℝ) ^ 2)
    (b : Fin (k + 1) → ℤ) (hb : ∀ j, |(b j : ℝ)| ≤ X j)
    (hb0 : padicLatticeTarget m W β₀ = 0 → b ≠ 0) :
    ¬ (p : ℤ_[p]) ^ m ∣ padicLinearForm β₀ β b := sorry

end Padic

/-! ### ED.1/short-vector-enumeration -/

section FinckePohst

variable {n : ℕ}

/-- The coefficients `q_ij` of Fincke–Pohst's quadratic completion (2.3). -/
def quadraticCompletion (G : Matrix (Fin n) (Fin n) ℚ) : Matrix (Fin n) (Fin n) ℚ := sorry

theorem quadraticCompletion_spec (G : Matrix (Fin n) (Fin n) ℚ) (hG : G.IsSymm)
    (hpiv : ∀ i, quadraticCompletion G i i ≠ 0) (x : Fin n → ℚ) :
    x ⬝ᵥ (G *ᵥ x) = ∑ i, quadraticCompletion G i i *
      (x i + ∑ j ∈ Finset.Ioi i, quadraticCompletion G i j * x j) ^ 2 := sorry

theorem quadraticCompletion_pivot_pos_iff (G : Matrix (Fin n) (Fin n) ℚ) (hG : G.IsSymm) :
    (∀ i, 0 < quadraticCompletion G i i) ↔ ∀ x : Fin n → ℚ, x ≠ 0 → 0 < x ⬝ᵥ (G *ᵥ x) := sorry

/-- The Fincke–Pohst set of integer vectors `x` with `(x - t)ᵀ G (x - t) ≤ R`. -/
def fpEnumeration (G : Matrix (Fin n) (Fin n) ℚ) (t : Fin n → ℚ) (R : ℚ) :
    Finset (Fin n → ℤ) := sorry

theorem fpEnumeration_neg (G : Matrix (Fin n) (Fin n) ℚ) (R : ℚ) (x : Fin n → ℤ)
    (hx : x ∈ fpEnumeration G 0 R) : -x ∈ fpEnumeration G 0 R := sorry

theorem fpEnumeration_of_neg (G : Matrix (Fin n) (Fin n) ℚ) (t : Fin n → ℚ) {R : ℚ}
    (hR : R < 0) : fpEnumeration G t R = ∅ := sorry

theorem fpEnumeration_mono (G : Matrix (Fin n) (Fin n) ℚ) (t : Fin n → ℚ) {R R' : ℚ}
    (h : R ≤ R') : fpEnumeration G t R ⊆ fpEnumeration G t R' := sorry

/-! ### ED.1/short-vector-enumeration-complete -/

theorem mem_fpEnumeration_iff (G : Matrix (Fin n) (Fin n) ℚ) (hG : G.IsSymm)
    (hpos : ∀ i, 0 < quadraticCompletion G i i) (t : Fin n → ℚ) (R : ℚ) (x : Fin n → ℤ) :
    x ∈ fpEnumeration G t R ↔
      (fun i => (x i : ℚ) - t i) ⬝ᵥ (G *ᵥ fun i => (x i : ℚ) - t i) ≤ R := sorry

-- fp_identity_one: G = I₂, t = 0, R = 1 gives five vectors.
example : fpEnumeration (1 : Matrix (Fin 2) (Fin 2) ℚ) 0 1 =
    {0, ![1, 0], ![-1, 0], ![0, 1], ![0, -1]} := sorry

-- fp_hexagonal: G = [[2, 1], [1, 2]], R = 2 gives seven vectors.
example : fpEnumeration !![(2 : ℚ), 1; 1, 2] 0 2 =
    {0, ![1, 0], ![-1, 0], ![0, 1], ![0, -1], ![1, -1], ![-1, 1]} := sorry

-- fp_centre_half: n = 1, t = 1/2, R = 1/4 gives {0, 1}.
example : fpEnumeration (1 : Matrix (Fin 1) (Fin 1) ℚ) (fun _ => 1 / 2) (1 / 4) =
    {![0], ![1]} := sorry

-- fp_negative_bound: R = -1 gives the empty set.
example (G : Matrix (Fin n) (Fin n) ℚ) (t : Fin n → ℚ) : fpEnumeration G t (-1) = ∅ := sorry

-- fp_box_non_example: (1, 1) lies in the box |xᵢ| ≤ 1 but not in the output.
example : ![(1 : ℤ), 1] ∉ fpEnumeration !![(2 : ℚ), 1; 1, 2] 0 2 := sorry

end FinckePohst

/-! ### ED.1/short-vector-reduction -/

theorem mem_fpEnumeration_or_lt_mul_abs (W φ : Fin (k + 1) → ℤ) (ψ : ℤ) (C : ℝ) (hC : 0 < C)
    (θ : Fin (k + 1) → ℝ) (β : ℝ) (hφ : ∀ i, |(φ i : ℝ) - C * θ i| ≤ 1)
    (ε : ℚ) (hψ : |(ψ : ℝ) - C * β| ≤ ε) (hφn : φ (Fin.last k) ≠ 0) (hW : ∀ i, W i ≠ 0)
    (X : Fin (k + 1) → ℚ) (K₀ : ℚ) (hK₀ : ε + ∑ i, X i ≤ K₀) (t : Fin (k + 1) → ℚ)
    (ht : (linearFormMatrix W φ).map (Int.cast : ℤ → ℚ) *ᵥ t =
      fun i => ((linearFormTarget ψ i : ℤ) : ℚ))
    (x : Fin (k + 1) → ℤ) (hx : ∀ i, |(x i : ℚ)| ≤ X i) :
    x ∈ fpEnumeration (((linearFormMatrix W φ).map (Int.cast : ℤ → ℚ))ᵀ *
        (linearFormMatrix W φ).map (Int.cast : ℤ → ℚ)) t
        (∑ i : Fin k, (W i.castSucc * X i.castSucc) ^ 2 + K₀ ^ 2) ∨
      (K₀ : ℝ) - ε - ∑ i, |(x i : ℝ)| < C * |β + ∑ i, (x i : ℝ) * θ i| := sorry

/-! ### ED.1/exclusion-certificate -/

/-- The columns of an integer matrix as vectors of Euclidean space. -/
def columnVectors {n : ℕ} (A : Matrix (Fin n) (Fin n) ℤ) : Fin n → EuclideanSpace ℝ (Fin n) :=
  sorry

/-- A certified lower bound for the distance from `y` to `A ℤ^(n+1)`: an LLL witness
(GN.5's reduced basis `A U`, reducedness used through de Weger (3.12)), its homogeneous
form, or a Fincke–Pohst enumeration witness. -/
inductive DistanceWitness {n : ℕ} (A : Matrix (Fin (n + 1)) (Fin (n + 1)) ℤ)
    (y : Fin (n + 1) → ℤ) : Type
  | lll (U V : Matrix (Fin (n + 1)) (Fin (n + 1)) ℤ) (hUV : U * V = 1) (hVU : V * U = 1)
      (hgs : ∀ i, (2 : ℝ) ^ (-(n : ℤ)) * ‖columnVectors (A * U) 0‖ ^ 2 ≤
        ‖InnerProductSpace.gramSchmidt ℝ (columnVectors (A * U)) i‖ ^ 2)
      (s : Fin (n + 1) → ℚ) (hs : (A * U).map (Int.cast : ℤ → ℚ) *ᵥ s = fun i => (y i : ℚ))
      (i₀ : Fin (n + 1)) (hi₀ : (s i₀).den ≠ 1) (hmax : ∀ i, i₀ < i → (s i).den = 1)
  | lllHomogeneous (U V : Matrix (Fin (n + 1)) (Fin (n + 1)) ℤ) (hUV : U * V = 1)
      (hVU : V * U = 1)
      (hgs : ∀ i, (2 : ℝ) ^ (-(n : ℤ)) * ‖columnVectors (A * U) 0‖ ^ 2 ≤
        ‖InnerProductSpace.gramSchmidt ℝ (columnVectors (A * U)) i‖ ^ 2) (hy : y = 0)
  | enumeration (R : ℚ) (hR : 0 ≤ R)
      (E : Finset (Fin (n + 1) → ℤ))
      (complete : ∀ x : Fin (n + 1) → ℤ,
        (∑ i, (((A *ᵥ x - y) i : ℤ) : ℚ) ^ 2) < R → x ∈ E)

namespace DistanceWitness

variable {n : ℕ} {A : Matrix (Fin (n + 1)) (Fin (n + 1)) ℤ} {y : Fin (n + 1) → ℤ}

/-- The certified rational lower bound `L²`. -/
def bound (w : DistanceWitness A y) : ℚ := sorry

theorem sound (w : DistanceWitness A y) (hA : A.det ≠ 0) (x : Fin (n + 1) → ℤ)
    (hx : y = 0 → x ≠ 0) :
    (w.bound : ℝ) ≤ ∑ i, (((A *ᵥ x - y) i : ℤ) : ℝ) ^ 2 := sorry

/-- An LLL witness from GN.5's exact LLL output (the reduced basis `A U` and `U⁻¹ = V`). -/
def ofLLL (hA : A.det ≠ 0) (U V : Matrix (Fin (n + 1)) (Fin (n + 1)) ℤ)
    (hUV : U * V = 1) (hVU : V * U = 1)
    (hgs : ∀ i, (2 : ℝ) ^ (-(n : ℤ)) * ‖columnVectors (A * U) 0‖ ^ 2 ≤
      ‖InnerProductSpace.gramSchmidt ℝ (columnVectors (A * U)) i‖ ^ 2)
    (hy : y ∉ Set.range (A *ᵥ ·)) : DistanceWitness A y := sorry

end DistanceWitness

attribute [-instance] Classical.propDecidable

/-- Raw exhaustive distance check. `D` bounds coordinates of all vectors at distance
below `B`; the rational inverse-matrix row tests certify this bound. No proof fields. -/
structure RawDistanceCertificate (n : ℕ) where
  A : Matrix (Fin n) (Fin n) ℤ
  y : Fin n → ℤ
  inverse : Matrix (Fin n) (Fin n) ℚ
  B : ℚ
  lower : ℚ
  D : ℕ

namespace RawDistanceCertificate
def box (n D : ℕ) : Finset (Fin n → ℤ) :=
  Fintype.piFinset (fun _ => Finset.Icc (-(D : ℤ)) D)
def normSq {n : ℕ} (A : Matrix (Fin n) (Fin n) ℤ) (y x : Fin n → ℤ) : ℚ :=
  ∑ i, (((A *ᵥ x - y) i : ℤ) : ℚ) ^ 2
def check {n : ℕ} (c : RawDistanceCertificate n) : Bool :=
  decide (c.A.map (Int.cast : ℤ → ℚ) * c.inverse = 1 ∧
    c.inverse * c.A.map (Int.cast : ℤ → ℚ) = 1 ∧
    0 < c.B ∧ 0 ≤ c.lower ∧ c.lower ≤ c.B ^ 2 ∧
    (∀ i, ∑ j, |c.inverse i j| * (|(c.y j : ℚ)| + c.B) ≤ c.D) ∧
    ∀ x ∈ box n c.D, (c.y = 0 → x ≠ 0) → c.lower ≤ normSq c.A c.y x)
theorem sound {n : ℕ} (c : RawDistanceCertificate n) (hc : c.check = true)
    (x : Fin n → ℤ) (hx : c.y = 0 → x ≠ 0) : c.lower ≤ normSq c.A c.y x := sorry
/-- Slow complete producer: compute a rational inverse and a coordinate cap from its row
norms, enumerate the whole cube, and take the minimum of B² and eligible squared distances. -/
def ofMatrix {n : ℕ} (A : Matrix (Fin n) (Fin n) ℤ) (hA : A.det ≠ 0)
    (y : Fin n → ℤ) (B : ℚ) (hB : 0 < B) : RawDistanceCertificate n := sorry
theorem ofMatrix_check {n : ℕ} (A : Matrix (Fin n) (Fin n) ℤ) (hA : A.det ≠ 0)
    (y : Fin n → ℤ) (B : ℚ) (hB : 0 < B) :
    (ofMatrix A hA y B hB).check = true ∧ (ofMatrix A hA y B hB).A = A ∧
      (ofMatrix A hA y B hB).y = y := sorry
end RawDistanceCertificate

/-- Raw real exclusion fields. Intervals are supplier outputs; their membership in the
actual logarithms is a separate arithmetic input to soundness, never decided on ℝ. -/
structure RawRealExclusionCertificate (k : ℕ) where
  C : ℚ
  W : Fin (k + 1) → ℤ
  φ : Fin (k + 1) → ℤ
  ψ : ℤ
  homogeneous : Bool
  lo : Fin (k + 1) → ℚ
  hi : Fin (k + 1) → ℚ
  betaLo : ℚ
  betaHi : ℚ
  X : Fin (k + 1) → ℚ
  margin : ℚ
  distance : RawDistanceCertificate (k + 1)

namespace RawRealExclusionCertificate
def check {k : ℕ} (c : RawRealExclusionCertificate k) : Bool :=
  decide (0 < c.C ∧ (∀ i, 0 < c.W i ∧ 0 ≤ c.X i ∧ c.lo i ≤ c.hi i ∧
      |(c.φ i : ℚ) - c.C * c.lo i| ≤ 1 ∧ |(c.φ i : ℚ) - c.C * c.hi i| ≤ 1) ∧
    c.betaLo ≤ c.betaHi ∧ |(c.ψ : ℚ) - c.C * c.betaLo| ≤ 1 ∧
    |(c.ψ : ℚ) - c.C * c.betaHi| ≤ 1 ∧ c.φ (Fin.last k) ≠ 0 ∧ 0 < c.margin ∧
    (c.homogeneous = true → c.betaLo = 0 ∧ c.betaHi = 0 ∧ c.ψ = 0) ∧
    c.distance.A = linearFormMatrix c.W c.φ ∧ c.distance.y = linearFormTarget c.ψ ∧
    c.distance.check = true ∧
    ∑ i : Fin k, (c.W i.castSucc * c.X i.castSucc) ^ 2 +
      ((if c.homogeneous then 0 else 1) + ∑ i, c.X i + c.margin) ^ 2 ≤ c.distance.lower)
theorem sound {k : ℕ} (c : RawRealExclusionCertificate k) (hc : c.check = true)
    (θ : Fin (k + 1) → ℝ) (β : ℝ)
    (hθ : ∀ i, (c.lo i : ℝ) ≤ θ i ∧ θ i ≤ c.hi i)
    (hβ : (c.betaLo : ℝ) ≤ β ∧ β ≤ c.betaHi)
    (x : Fin (k + 1) → ℤ) (hx : ∀ i, |(x i : ℚ)| ≤ c.X i) (h0 : c.ψ = 0 → x ≠ 0) :
    (c.margin : ℝ) ≤ (c.C : ℝ) * |β + ∑ i, (x i : ℝ) * θ i| := sorry
/-- Supplier adapter from certified CN.4 intervals and an ED.1 distance replay. Return the
raw data only when its finite rounding and separation checks pass. -/
def ofEnclosures {k : ℕ} (C : ℚ) (W : Fin (k + 1) → ℤ)
    (θ : Fin (k + 1) → ℝ) (β : ℝ) (eθ : ∀ i, ED0.RealEnclosure (θ i))
    (eβ : ED0.RealEnclosure β) (X : Fin (k + 1) → ℚ) (margin radius : ℚ) :
    Option (RawRealExclusionCertificate k) := sorry
theorem ofEnclosures_check {k : ℕ} (C : ℚ) (W : Fin (k + 1) → ℤ)
    (θ : Fin (k + 1) → ℝ) (β : ℝ) (eθ : ∀ i, ED0.RealEnclosure (θ i))
    (eβ : ED0.RealEnclosure β) (X : Fin (k + 1) → ℚ) (margin radius : ℚ)
    (c : RawRealExclusionCertificate k)
    (hc : ofEnclosures C W θ β eθ eβ X margin radius = some c) :
    c.check = true ∧ (∀ i, (c.lo i : ℝ) ≤ θ i ∧ θ i ≤ c.hi i) ∧
      (c.betaLo : ℝ) ≤ β ∧ β ≤ c.betaHi := sorry
end RawRealExclusionCertificate

-- raw_distance_one: the integer lattice has squared nonzero distance at least one.
example : (RawDistanceCertificate.mk (n := 1) 1 0 1 1 1 1).check = true := by native_decide
-- raw_distance_bad_inverse: a forged inverse is rejected.
example : (RawDistanceCertificate.mk (n := 1) 1 0 0 1 1 1).check = false := by native_decide
-- raw_distance_integral_target: no positive bound for an integral, nonzero target.
example : (RawDistanceCertificate.mk (n := 1) 1 ![1] 1 1 1 2).check = false := by native_decide

-- raw_real_ten: a full rational check with θ=10 and homogeneous β=0.
example : (RawRealExclusionCertificate.mk (k := 0) 1 ![1] ![10] 0 true
    ![10] ![10] 0 0 ![1] 1
    (RawDistanceCertificate.mk ![![10]] 0 ![![1/10]] 2 4 1)).check = true := by native_decide
-- raw_real_bad_endpoint: an endpoint with excessive rounding error is rejected.
example : (RawRealExclusionCertificate.mk (k := 0) 1 ![1] ![10] 0 true
    ![10] ![12] 0 0 ![1] 1
    (RawDistanceCertificate.mk ![![10]] 0 ![![1/10]] 2 4 1)).check = false := by native_decide
-- raw_real_bad_distance: the enclosure check replays the inverse check too.
example : (RawRealExclusionCertificate.mk (k := 0) 1 ![1] ![10] 0 true
    ![10] ![10] 0 0 ![1] 1
    (RawDistanceCertificate.mk ![![10]] 0 0 2 4 1)).check = false := by native_decide

attribute [local instance] Classical.propDecidable

/-- A real lattice exclusion certificate for `β + ∑ xᵢ θᵢ` (homogeneous when
`homogeneous = true`, then `β = 0` and `ψ = 0`). -/
structure RealExclusionCertificate (k : ℕ) (C : ℚ) (θ : Fin (k + 1) → ℝ) (β : ℝ) where
  W : Fin (k + 1) → ℤ
  φ : Fin (k + 1) → ℤ
  ψ : ℤ
  homogeneous : Bool
  hW : ∀ i, 0 < W i
  hφ : ∀ i, |(φ i : ℝ) - C * θ i| ≤ 1
  hψ : |(ψ : ℝ) - C * β| ≤ 1
  hφn : φ (Fin.last k) ≠ 0
  hhom : homogeneous = true → β = 0 ∧ ψ = 0
  X : Fin (k + 1) → ℚ
  hX : ∀ i, 0 ≤ X i
  μ : ℚ
  hμ : 0 < μ
  witness : DistanceWitness (linearFormMatrix W φ) (linearFormTarget ψ)
  inequality : ∑ i : Fin k, (W i.castSucc * X i.castSucc) ^ 2 +
      ((if homogeneous then 0 else 1) + ∑ i, X i + μ) ^ 2 ≤ witness.bound

/-- A p-adic lattice exclusion certificate for `Λ'(b) = b_{k+1} - β₀ - ∑ b_j β_j`. -/
structure PadicExclusionCertificate (k : ℕ) (p : ℕ) [Fact p.Prime] (β₀ : ℤ_[p])
    (β : Fin k → ℤ_[p]) where
  m : ℕ
  W : Fin (k + 1) → ℤ
  hW : ∀ j, 0 < W j
  X : Fin (k + 1) → ℚ
  hX : ∀ j, 0 ≤ X j
  witness : DistanceWitness (padicLatticeMatrix m W β) (padicLatticeTarget m W β₀)
  inequality : ∑ j, (W j * X j) ^ 2 < witness.bound

/-- Supporting evaluation on already validated data. The raw checker below is the
finite verifier; this helper alone does not validate the real enclosure hypotheses. -/
def RealExclusionCertificate.check {C : ℚ} {θ : Fin (k + 1) → ℝ} {β : ℝ}
    (c : RealExclusionCertificate k C θ β) : Bool := sorry

-- exclusion_log23: the computed homogeneous certificate for (log 2, log 3), C = 10^8.
example : ∃ c : RealExclusionCertificate 1 (10 ^ 8) ![Real.log 2, Real.log 3] 0,
    c.φ = ![69314718, 109861229] ∧ c.X = ![1000, 1000] ∧ c.μ = 1000 ∧
      c.homogeneous = true := sorry

-- exclusion_trivial_box: X_i = 0 for all i: the homogeneous region is empty and any witness
-- with L² ≥ μ² certifies it.
example {C : ℚ} {θ : Fin (k + 1) → ℝ} (W φ : Fin (k + 1) → ℤ) (hW : ∀ i, 0 < W i)
    (hφ : ∀ i, |(φ i : ℝ) - C * θ i| ≤ 1) (hφn : φ (Fin.last k) ≠ 0) (μ : ℚ) (hμ : 0 < μ)
    (w : DistanceWitness (linearFormMatrix W φ) (linearFormTarget 0)) (hw : μ ^ 2 ≤ w.bound) :
    ∃ c : RealExclusionCertificate k C θ 0, c.W = W ∧ c.φ = φ ∧ c.ψ = 0 ∧
      c.homogeneous = true ∧ c.X = 0 ∧ c.μ = μ ∧ c.witness.bound = w.bound ∧
      ∀ x : Fin (k + 1) → ℤ, (∀ i, |(x i : ℚ)| ≤ c.X i) → x = 0 := sorry

-- exclusion_integral_target: if y ∈ Γ every witness has bound ≤ 0.
example {n : ℕ} (A : Matrix (Fin (n + 1)) (Fin (n + 1)) ℤ) (hA : A.det ≠ 0)
    (y x : Fin (n + 1) → ℤ) (hy : A *ᵥ x = y) (hy0 : y ≠ 0) (w : DistanceWitness A y) :
    w.bound ≤ 0 := sorry

-- exclusion_padic_one_dim: p = 3, m = 2, β₀ = 5, X = 3, enumeration witness R = 15.
example [Fact (Nat.Prime 3)] :
    ∃ c : PadicExclusionCertificate 0 3 (5 : ℤ_[3]) Fin.elim0,
      c.m = 2 ∧ c.W = 1 ∧ c.X = ![3] ∧ c.witness.bound = 15 := sorry

/-! ### ED.1/exclusion-certificate-sound -/

/-- The stage acceptance: a checked certificate excludes the whole box. -/
theorem RealExclusionCertificate.sound {C : ℚ} {θ : Fin (k + 1) → ℝ} {β : ℝ}
    (c : RealExclusionCertificate k C θ β) (hC : 0 < C) (x : Fin (k + 1) → ℤ)
    (hx : ∀ i, |(x i : ℚ)| ≤ c.X i) (h0 : c.ψ = 0 → x ≠ 0) :
    (c.μ : ℝ) ≤ (C : ℝ) * |β + ∑ i, (x i : ℝ) * θ i| := sorry

theorem PadicExclusionCertificate.sound {p : ℕ} [Fact p.Prime] {β₀ : ℤ_[p]}
    {β : Fin k → ℤ_[p]} (c : PadicExclusionCertificate k p β₀ β) (b : Fin (k + 1) → ℤ)
    (hb : ∀ j, |(b j : ℚ)| ≤ c.X j) (h0 : padicLatticeTarget c.m c.W β₀ = 0 → b ≠ 0) :
    ¬ (p : ℤ_[p]) ^ c.m ∣ padicLinearForm β₀ β b := sorry

end TauCeti.EffectiveDiophantine.ED1

end PartED01

/-! ## ED.2 -/

section PartED2

/-
This file is not the roadmap and is not exhaustive. The roadmap document is
definitive. These statements suggest Lean forms so contributors and reviewers
can converge on names and signatures. They do not constitute implementation.

ED.2 (linear forms in logarithms and S-unit equations): certified evaluation of
the imported Matveev and Yu bounds (DiophantineApproximationAndTranscendence DT.3),
exact p-adic discrete-logarithm lattices, exponent reduction chains over the ED.1
reduction certificates, and certificates with soundness theorems for Thue
(Tzanakis–de Weger 1989), Thue–Mahler (Tzanakis–de Weger 1992) and S-unit
equations over ℚ (de Weger 1989, Chapter 6).

Objects of other stages are used through the Mathlib notions they denote:
* CN.4 `complexBoxSet` is `ratBoxSet` below (a pair of rational intervals);
* ED.0 enclosures and embedding certificates (`TauCeti.EffectiveDiophantine.ED0`)
  are not imported; their outputs enter as rational data with stated properties;
* ED.1 reduction certificates enter only through the inequalities they prove,
  which appear as the step implications of `WeightedExponentReductionChain`;
* DT.3 (Matveev, Yu) and DT.4 (Thue, S-unit, Thue–Mahler bounds) are cited in
  comments; their constants are certified here by rational inequalities.
Validity of the certificates is a conjunction of genuine conditions (structures
of type `Prop` with stated fields), never a placeholder.
-/


open Polynomial

attribute [local instance] Classical.propDecidable

namespace TauCeti.EffectiveDiophantine

/-! ### ED.2/logarithm-enclosure -/

/-- A closed rational box in `ℂ`: real-part interval and imaginary-part interval. -/
abbrev RatBox := NonemptyInterval ℚ × NonemptyInterval ℚ

/-- The points of a rational box (CN.4 `complexBoxSet`). -/
def ratBoxSet (B : RatBox) : Set ℂ :=
  {z | ((B.1.fst : ℚ) : ℝ) ≤ z.re ∧ z.re ≤ ((B.1.snd : ℚ) : ℝ) ∧
    ((B.2.fst : ℚ) : ℝ) ≤ z.im ∧ z.im ≤ ((B.2.snd : ℚ) : ℝ)}

/-- The degenerate box of a point with rational coordinates. -/
def pointBox (a b : ℚ) : RatBox := (NonemptyInterval.pure a, NonemptyInterval.pure b)

/-- Membership of a real number in a rational interval. -/
def InInterval (t : ℝ) (J : NonemptyInterval ℚ) : Prop :=
  ((J.fst : ℚ) : ℝ) ≤ t ∧ t ≤ ((J.snd : ℚ) : ℝ)

/-- Certified enclosure of `Real.log ‖z‖` on a box; `none` exactly when `0` lies in the box. -/
def logAbsEnclosure (B : RatBox) (P : ℕ) : Option (NonemptyInterval ℚ) := sorry

/-- Certified enclosure of `Complex.arg z` on a box; `none` exactly when the box meets
the closed half-line `(-∞, 0]`. -/
def argEnclosure (B : RatBox) (P : ℕ) : Option (NonemptyInterval ℚ) := sorry

theorem log_norm_mem_logAbsEnclosure {B : RatBox} {P : ℕ} {z : ℂ} {J : NonemptyInterval ℚ}
    (hz : z ∈ ratBoxSet B) (h : logAbsEnclosure B P = some J) :
    InInterval (Real.log ‖z‖) J := sorry

theorem arg_mem_argEnclosure {B : RatBox} {P : ℕ} {z : ℂ} {J : NonemptyInterval ℚ}
    (hz : z ∈ ratBoxSet B) (h : argEnclosure B P = some J) :
    InInterval (Complex.arg z) J := sorry

theorem logAbsEnclosure_width_le {B : RatBox} {P : ℕ} {J : NonemptyInterval ℚ} (w ρ : ℚ)
    (hρ : 0 < ρ) (hdiam : ∀ z ∈ ratBoxSet B, ∀ z' ∈ ratBoxSet B, ‖z - z'‖ ≤ w)
    (hnorm : ∀ z ∈ ratBoxSet B, (ρ : ℝ) ≤ ‖z‖) (h : logAbsEnclosure B P = some J) :
    J.snd - J.fst ≤ w / ρ + 3 * (2 : ℚ) ^ (-(P : ℤ)) := sorry

theorem logAbsEnclosure_ofRat (q : ℚ) (hq : 0 < q) (P : ℕ) :
    ∃ J, logAbsEnclosure (pointBox q 0) P = some J ∧ InInterval (Real.log q) J ∧
      J.snd - J.fst ≤ 2 * (2 : ℚ) ^ (-(P : ℤ)) := sorry

-- logAbsEnclosure_two: the enclosure of log 2 at precision 30 lies in [0.6931471, 0.6931472].
example : ∃ J, logAbsEnclosure (pointBox 2 0) 30 = some J ∧
    (0.6931471 : ℚ) ≤ J.fst ∧ J.snd ≤ 0.6931472 := sorry

-- logAbsEnclosure_one: the enclosure at the point 1 contains 0 and is narrow.
example (P : ℕ) : ∃ J, logAbsEnclosure (pointBox 1 0) P = some J ∧ J.fst ≤ 0 ∧ 0 ≤ J.snd ∧
    J.snd - J.fst ≤ 2 * (2 : ℚ) ^ (-(P : ℤ)) := sorry

-- argEnclosure_neg_one: the point −1 lies on the branch cut, so no enclosure is returned.
example (P : ℕ) : argEnclosure (pointBox (-1) 0) P = none := sorry

-- logAbsEnclosure_zero_box: a box containing 0 has no logarithm enclosure.
example (P : ℕ) :
    logAbsEnclosure (⟨(-1, 1), by norm_num⟩, ⟨(-1, 1), by norm_num⟩) P = none := sorry

-- arg_i: the enclosure at the point i contains Complex.arg I = π / 2.
example (P : ℕ) (J : NonemptyInterval ℚ) (h : argEnclosure (pointBox 0 1) P = some J) :
    InInterval (Real.pi / 2) J := sorry

/-! ### ED.2/certified-linear-form-constant -/

/-- The rational upper bound `2.7182818286` for `exp 1` (`Real.exp_one_lt_d9`). -/
def eUpper : ℚ := 27182818286 / 10 ^ 10

/-- The rational majorant `Ĉ(n)` of Matveev's `C₁(n, κ)` for `κ = 1, 2`, with `s ≥ √n`. -/
def matveevCHat (n : ℕ) (s : ℚ) : ℚ :=
  max (min (eUpper * n / 2 * 30 ^ (n + 3) * (n : ℚ) ^ 3 * s) (2 ^ (6 * n + 20)))
    (min (1 / 2 * (eUpper * n / 2) ^ 2 * 30 ^ (n + 3) * (n : ℚ) ^ 3 * s) (2 ^ (6 * n + 20)))

/-- A certificate for Matveev's constant (Matveev 2000, Corollary 2.3, imported through
DT.3/matveev-corollary-linear-form-bound): rational data and exact rational checks. -/
structure MatveevConstantCertificate (n D : ℕ) where
  A : Fin n → ℚ
  s : ℚ
  ℓ : ℚ
  c : ℚ
  one_le_n : 1 ≤ n
  one_le_D : 1 ≤ D
  A_ge : ∀ j, (16 / 100 : ℚ) ≤ A j
  s_nonneg : 0 ≤ s
  n_le_sq : (n : ℚ) ≤ s ^ 2
  log_le : Real.log D ≤ ℓ
  c_ge : matveevCHat n s * (D : ℚ) ^ 2 * (1 + ℓ) * ∏ j, A j ≤ c

namespace MatveevConstantCertificate

variable {n D : ℕ}

/-- The certified constant `c` (Tzanakis–de Weger's `C₇`, with `C₈ = 1`). -/
def matveevBound (C : MatveevConstantCertificate n D) : ℚ := C.c

/-- Admissibility for a family of algebraic numbers and nonzero logarithms. -/
def Admissible (C : MatveevConstantCertificate n D) {K : Type*} [Field K] [NumberField K]
    (σ : K →+* ℂ) (α : Fin n → K) (lg : Fin n → ℂ) : Prop :=
  Module.finrank ℚ K ≤ D ∧ (∀ j, α j ≠ 0) ∧ (∀ j, lg j ≠ 0 ∧ Complex.exp (lg j) = σ (α j)) ∧
    ∀ j, (D : ℝ) * NumberField.absLogHeight₁ (α j) ≤ C.A j ∧ ‖lg j‖ ≤ C.A j

theorem matveevC1_le (n : ℕ) (s : ℚ) (hs : 0 ≤ s) (hn : (n : ℚ) ≤ s ^ 2) (κ : ℕ)
    (hκ : κ = 1 ∨ κ = 2) :
    min ((κ : ℝ)⁻¹ * (Real.exp 1 * n / 2) ^ κ * 30 ^ (n + 3) * (n : ℝ) ^ (7 / 2 : ℝ))
      (2 ^ (6 * n + 20)) ≤ (matveevCHat n s : ℝ) := sorry

theorem admissible_of_le_degree (C : MatveevConstantCertificate n D) {D' : ℕ} (hD : D ≤ D')
    {K : Type*} [Field K] [NumberField K] (σ : K →+* ℂ) (α : Fin n → K) (lg : Fin n → ℂ)
    (h : C.Admissible σ α lg) :
    ∃ C' : MatveevConstantCertificate n D', C'.Admissible σ α lg := sorry

/-- The certificate built from height and logarithm bounds at a requested precision. -/
def ofHeightBounds (h lgUp : Fin n → ℚ) (s ℓ : ℚ) (hs : 0 ≤ s) (hn : (n : ℚ) ≤ s ^ 2)
    (hn₁ : 1 ≤ n) (hD : 1 ≤ D) (hℓ : Real.log D ≤ ℓ) (P : ℕ) : MatveevConstantCertificate n D :=
  sorry

/-- ED.2/certified-linear-form-lower-bound: `log |Λ| > −c (1 + log B*)` for `Λ ≠ 0`. -/
theorem log_abs_linearForm_gt (C : MatveevConstantCertificate n D) {K : Type*} [Field K]
    [NumberField K] (σ : K →+* ℂ) (α : Fin n → K) (lg : Fin n → ℂ) (hC : C.Admissible σ α lg)
    (b : Fin n → ℤ) (hΛ : ∑ j, (b j : ℂ) * lg j ≠ 0) :
    -((C.c : ℝ) * (1 + Real.log ((Finset.univ.sup fun j => (b j).natAbs : ℕ) : ℝ))) <
      Real.log ‖∑ j, (b j : ℂ) * lg j‖ := sorry

end MatveevConstantCertificate

-- matveev_two_logs: (A = (7/10, 11/10), D = 1) c = 8·10⁸ is admissible, c = 7·10⁸ is not.
example : (∃ C : MatveevConstantCertificate 2 1, C.A = ![7 / 10, 11 / 10] ∧ C.c = 8 * 10 ^ 8) ∧
    ¬ ∃ C : MatveevConstantCertificate 2 1, C.A = ![7 / 10, 11 / 10] ∧ C.c = 7 * 10 ^ 8 := sorry

-- matveev_one_log: Ĉ(1) is the κ = 1 value e⁺/2 · 30⁴.
example : matveevCHat 1 1 = eUpper / 2 * 30 ^ 4 := sorry

-- matveev_small_A: no certificate has A₁ below Matveev's floor 0.16.
example : ¬ ∃ C : MatveevConstantCertificate 1 1, C.A 0 = 1 / 10 := sorry

-- matveev_kappa: for n ≥ 2 the κ = 2 value dominates.
example (n : ℕ) (hn : 2 ≤ n) (s : ℚ) (hs : 0 ≤ s) :
    matveevCHat n s =
      min (1 / 2 * (eUpper * n / 2) ^ 2 * 30 ^ (n + 3) * (n : ℚ) ^ 3 * s) (2 ^ (6 * n + 20)) :=
  sorry

/-! ### ED.2/certified-padic-linear-form-constant -/

/-- Yu's `Φ` (Yu 1994, §0.1) for degree `d`, prime `p`, residue degree `f` and heights `h`. -/
def yuPhi (n d p f : ℕ) (h : Fin n → ℝ) : ℝ :=
  22000 * (19 / 2 * (n + 1) * d / Real.sqrt (Real.log p)) ^ (2 * (n + 1)) * ((p : ℝ) ^ f - 1) *
    (∏ j, h j) * Real.log (10 * n * d * max (⨆ j, h j) 1)

/-- A certificate for Yu's constant (imported through DT.3/yu-explicit-p-adic-bound). -/
structure YuConstantCertificate (n d p : ℕ) where
  h : Fin n → ℚ
  logpLower : ℚ
  L : ℚ
  Φ : ℚ
  two_le : 2 ≤ n
  one_le_d : 1 ≤ d
  prime : p.Prime
  logpLower_pos : 0 < logpLower
  logpLower_le : (logpLower : ℝ) ≤ Real.log p
  logpLower_le_h : ∀ j, logpLower ≤ h j
  log_le : ∀ j, Real.log (10 * n * d * max (h j : ℝ) 1) ≤ L
  Φ_ge : 22000 * (19 / 2 * (n + 1) * d) ^ (2 * (n + 1)) * (logpLower⁻¹) ^ (n + 1) *
    ((p : ℚ) ^ d - 1) * (∏ j, h j) * L ≤ Φ

namespace YuConstantCertificate

variable {n d p : ℕ}

/-- The certified constant `Φ⁺`. -/
def yuBound (C : YuConstantCertificate n d p) : ℚ := C.Φ

/-- Admissibility for a family of nonzero algebraic numbers of a number field. -/
def Admissible (C : YuConstantCertificate n d p) {K : Type*} [Field K] [NumberField K]
    (σ : K →+* ℂ) (α : Fin n → K) : Prop :=
  Module.finrank ℚ K ≤ d ∧ (∀ j, α j ≠ 0) ∧
    ∀ j, NumberField.absLogHeight₁ (α j) ≤ C.h j ∧ ‖Complex.log (σ (α j))‖ ≤ 10 * C.h j ∧
      Real.log p ≤ C.h j

theorem yuPhi_le (C : YuConstantCertificate n d p) (d₀ f : ℕ) (hd₀ : 1 ≤ d₀) (hd : d₀ ≤ d)
    (hf : f ≤ d₀) (hp : 2 ≤ p) : yuPhi n d₀ p f (fun j => (C.h j : ℝ)) ≤ C.Φ := sorry

/-- The certificate built from height and logarithm bounds at a requested precision. -/
def ofHeightBounds (hUp lgUp : Fin n → ℚ) (ℓp : ℚ) (hℓp : Real.log p ≤ ℓp) (hn : 2 ≤ n)
    (hd : 1 ≤ d) (hp : p.Prime) (P : ℕ) : YuConstantCertificate n d p := sorry

/-- ED.2/certified-padic-lower-bound, for an embedding `ι` into a finite extension `L` of `ℚ_p`;
the valuation `v_p(x) = −log_p |x|` (normalised by `v_p(p) = 1`) is computed from the spectral
norm, the unique extension of the `p`-adic norm to `L`. -/
theorem padicValuation_lt [Fact p.Prime] (C : YuConstantCertificate n d p) {K : Type*} [Field K]
    [NumberField K] (σ : K →+* ℂ) {L : Type*} [Field L] [Algebra ℚ_[p] L]
    [FiniteDimensional ℚ_[p] L] (ι : K →+* L) (α : Fin n → K) (hC : C.Admissible σ α)
    (b : Fin n → ℤ) (hb : b ≠ 0) (hne : ∏ j, α j ^ b j ≠ 1) :
    -Real.logb p (spectralNorm ℚ_[p] L (ι (∏ j, α j ^ b j) - 1)) <
      C.Φ * Real.log (d * max ((Finset.univ.sup fun j => (b j).natAbs : ℕ) : ℝ) 3) := sorry

end YuConstantCertificate

-- yu_rational_two_primes: for p = 5, α = (2, 3), d = 1, Φ⁺ = 10¹⁴ is too small.
example : ¬ ∃ C : YuConstantCertificate 2 1 5, C.Φ = 10 ^ 14 := sorry

-- yu_degree_one: for d = 1 the residue factor is p − 1: every certificate dominates Yu's Φ with
-- f = 1, and some certificate stays below the value with d = f = 2 (factor p² − 1).
example : (∀ C : YuConstantCertificate 2 1 5, yuPhi 2 1 5 1 (fun j => (C.h j : ℝ)) ≤ C.Φ) ∧
    ∃ C : YuConstantCertificate 2 1 5, (C.Φ : ℝ) < yuPhi 2 2 5 2 (fun j => (C.h j : ℝ)) := sorry

-- yu_unit_requirement: at p = 5 a certificate with h₁ = 7/10 (≥ log 2) is not admissible for
-- α₁ = 2, since h₁ ≥ log 5 fails.
example (C : YuConstantCertificate 2 1 5) (α : Fin 2 → ℚ) (hα : α 0 = 2) (hh : C.h 0 = 7 / 10) :
    ¬ C.Admissible (Rat.castHom ℂ) α := sorry

-- yu_compat_rat: the rational form |α^b − 1|_p ≥ (eB)^(−C) with C = 2Φ⁺ log p.
example [Fact (Nat.Prime 5)] (C : YuConstantCertificate 2 1 5) (a : Fin 2 → ℚ)
    (hC : C.Admissible (Rat.castHom ℂ) a)
    (ha : ∀ j, padicValRat 5 (a j) = 0) (b : Fin 2 → ℤ) (hne : ∏ j, a j ^ b j ≠ 1) :
    (Real.exp 1 * max 1 ((Finset.univ.sup fun j => (b j).natAbs : ℕ) : ℝ)) ^
        (-(2 * (C.Φ : ℝ) * Real.log 5)) ≤ (padicNorm 5 (∏ j, a j ^ b j - 1) : ℝ) := sorry

/-! ### ED.2/padic-discrete-logarithm-certificate -/

/-- A discrete-logarithm certificate for `p`-adic units `γ₀, …, γₙ` given by residues
(natural numbers prime to `p`), checked by modular exponentiation in `ZMod (p ^ t)`. -/
structure PadicDiscreteLogCertificate (p n : ℕ) (γ : Fin (n + 1) → ℕ) where
  prime : p.Prime
  t : ℕ
  e : ℕ
  g : ℕ
  M : ℕ
  ℓ : Fin (n + 1) → ℕ
  ell_lt : ∀ i, ℓ i < p ^ M
  e_pos : 0 < e
  one_le_M : 1 ≤ M
  g_mod : (g : ZMod p) = 1
  g_pow : (g : ZMod (p ^ t)) ^ (p ^ M) = 1
  g_pow_ne : (g : ZMod (p ^ t)) ^ (p ^ (M - 1)) ≠ 1
  congr : ∀ i, (γ i : ZMod (p ^ t)) ^ e = (g : ZMod (p ^ t)) ^ ℓ i

namespace PadicDiscreteLogCertificate

variable {p n : ℕ} {γ : Fin (n + 1) → ℕ}

/-- The congruence lattice `{b | Σ bᵢ ℓᵢ ≡ 0 (mod p^M)}`. -/
def lattice (C : PadicDiscreteLogCertificate p n γ) : AddSubgroup (Fin n → ℤ) := sorry

theorem mem_coset_of_congr (C : PadicDiscreteLogCertificate p n γ)
    (u : Fin (n + 1) → (ZMod (p ^ C.t))ˣ) (hu : ∀ i, (u i : ZMod (p ^ C.t)) = γ i)
    (ζ : (ZMod (p ^ C.t))ˣ) (hζ : ζ ^ C.e = 1) (b : Fin n → ℤ)
    (h : ζ * u 0 * ∏ i : Fin n, u i.succ ^ b i = 1) :
    ((p : ℤ) ^ C.M) ∣ (C.ℓ 0 : ℤ) + ∑ i : Fin n, b i * C.ℓ i.succ := sorry

theorem mem_of_padicValRat_le [Fact p.Prime] (C : PadicDiscreteLogCertificate p n γ)
    (he : Even C.e) (s : ℚ) (hs : s = 1 ∨ s = -1) (b : Fin n → ℤ)
    (h : (C.t : ℤ) ≤ padicValRat p (s * γ 0 * ∏ i : Fin n, ((γ i.succ : ℚ)) ^ b i - 1)) :
    ((p : ℤ) ^ C.M) ∣ (C.ℓ 0 : ℤ) + ∑ i : Fin n, b i * C.ℓ i.succ := sorry

/-- The standard certificate for odd `p` (`g = 1 + p`, `t = M + 1`, `e = p − 1`). -/
def standard [Fact p.Prime] (hp : p ≠ 2) (M : ℕ) (hM : 1 ≤ M)
    (hγ : ∀ i, Nat.Coprime (γ i) p) : PadicDiscreteLogCertificate p n γ := sorry

/-- The standard certificate for `p = 2` (`g = 5`, `t = M + 2`, `e = 2`). -/
def standardTwo (M : ℕ) (hM : 1 ≤ M) (hγ : ∀ i, Odd (γ i)) :
    PadicDiscreteLogCertificate 2 n γ := sorry

theorem orderOf_one_add_prime [Fact p.Prime] (hp : p ≠ 2) (M : ℕ) :
    orderOf ((1 + p : ℕ) : ZMod (p ^ (M + 1))) = p ^ M := sorry

theorem orderOf_five (M : ℕ) : orderOf ((5 : ℕ) : ZMod (2 ^ (M + 2))) = 2 ^ M := sorry

end PadicDiscreteLogCertificate

-- discreteLog_five_two: 2⁴ is a power of 6 modulo 125, and 6 has order 25.
example : ∃ C : PadicDiscreteLogCertificate 5 1 ![1, 2], C.t = 3 ∧ C.e = 4 ∧ C.g = 6 ∧ C.M = 2 ∧
    C.ℓ 1 < 25 := sorry

-- discreteLog_sign: the sign is absorbed by the exponent e = 4.
example {n : ℕ} {γ : Fin (n + 1) → ℕ} (C : PadicDiscreteLogCertificate 5 n γ) (he : C.e = 4)
    (u : Fin (n + 1) → (ZMod (5 ^ C.t))ˣ) (hu : ∀ i, (u i : ZMod (5 ^ C.t)) = γ i)
    (b : Fin n → ℤ) (h : (-1 : (ZMod (5 ^ C.t))ˣ) * u 0 * ∏ i : Fin n, u i.succ ^ b i = 1) :
    ((5 : ℤ) ^ C.M) ∣ (C.ℓ 0 : ℤ) + ∑ i : Fin n, b i * C.ℓ i.succ := sorry

-- discreteLog_order_fail: 26 has order 5 modulo 125, so it is not a generator of level 2.
example {n : ℕ} {γ : Fin (n + 1) → ℕ} :
    ¬ ∃ C : PadicDiscreteLogCertificate 5 n γ, C.t = 3 ∧ C.g = 26 ∧ C.M = 2 := sorry

-- discreteLog_trivial: if every ℓᵢ is divisible by p^M the lattice is everything.
example {p n : ℕ} {γ : Fin (n + 1) → ℕ} (C : PadicDiscreteLogCertificate p n γ)
    (h : ∀ i : Fin n, ((p : ℤ) ^ C.M) ∣ (C.ℓ i.succ : ℤ)) : C.lattice = ⊤ := sorry

-- discreteLog_compat_two: 5 has order 8 modulo 32.
example : orderOf (5 : ZMod 32) = 8 ∧
    ∃ C : PadicDiscreteLogCertificate 2 0 ![1], C.t = 5 ∧ C.e = 2 ∧ C.g = 5 ∧ C.M = 3 := sorry

-- discreteLog_composite_nonexample: 19 has order 2 modulo 36, which cannot justify
-- divisibility by 6. The certificate requires p to be prime.
example : IsEmpty (PadicDiscreteLogCertificate 6 1 ![1, 19]) := sorry

-- discreteLog_zero_coefficient: use the nonzero coefficient 5 as pivot at p = 5.
-- The zero constant and zero second coefficient do not make the coset empty.
example (b : Fin 2 → ℤ) :
    ((25 : ℤ) ∣ 0 + b 0 * 5 + b 1 * 0) ↔ (5 : ℤ) ∣ b 0 := sorry

/-! ### Componentwise exponent boxes (ED.2/exponent-reduction-chain).
The weighted scalar chain below is a convenience specialization, not the per-prime representation. -/

def InExponentBox {q : ℕ} (a : Fin q → ℤ) (X : Fin q → ℚ) : Prop :=
  ∀ i, |(a i : ℚ)| ≤ X i

structure ExponentReductionChain {q : ℕ} (𝒮 : Set (Fin q → ℤ)) where
  k : ℕ
  X : Fin (k + 1) → Fin q → ℚ
  nonnegative : ∀ j i, 0 ≤ X j i
  antitone : ∀ i, Antitone (fun j => X j i)
  E : Fin k → Finset (Fin q → ℤ)
  step : ∀ j : Fin k, ∀ a ∈ 𝒮, InExponentBox a (X j.castSucc) →
    InExponentBox a (X j.succ) ∨ a ∈ E j

namespace ExponentReductionChain
variable {q : ℕ} {𝒮 : Set (Fin q → ℤ)}
def final (R : ExponentReductionChain 𝒮) : Fin q → ℚ := R.X (Fin.last R.k)
theorem sound (R : ExponentReductionChain 𝒮) (a : Fin q → ℤ) (ha : a ∈ 𝒮)
    (h0 : InExponentBox a (R.X 0)) : InExponentBox a R.final ∨ ∃ j, a ∈ R.E j := sorry
def nil (X₀ : Fin q → ℚ) (hX₀ : ∀ i, 0 ≤ X₀ i) : ExponentReductionChain 𝒮 := sorry
def append (R : ExponentReductionChain 𝒮) (X' : Fin q → ℚ) (E' : Finset (Fin q → ℤ))
    (hnonneg : ∀ i, 0 ≤ X' i) (hdecrease : ∀ i, X' i ≤ R.final i)
    (hstep : ∀ a ∈ 𝒮, InExponentBox a R.final → InExponentBox a X' ∨ a ∈ E') :
    ExponentReductionChain 𝒮 := sorry
end ExponentReductionChain

-- box_chain_nil: no coordinate changes without steps.
example {q : ℕ} (𝒮 : Set (Fin q → ℤ)) (X₀ : Fin q → ℚ) (hX₀ : ∀ i, 0 ≤ X₀ i) :
    (ExponentReductionChain.nil (𝒮 := 𝒮) X₀ hX₀).final = X₀ := sorry
-- box_chain_per_prime: lowering only the first coordinate preserves the second bound.
example (R : ExponentReductionChain ({![(2 : ℤ), 9]} : Set (Fin 2 → ℤ)))
    (h0 : R.X 0 = ![100, 10]) (hf : R.final = ![2, 10]) (hE : ∀ j, R.E j = ∅) :
    InExponentBox ![(2 : ℤ), 9] R.final := sorry
-- box_chain_missing_exception: the second coordinate cannot be silently lowered to five.
example : ¬ ∃ R : ExponentReductionChain ({![(2 : ℤ), 9]} : Set (Fin 2 → ℤ)),
    R.X 0 = ![100, 10] ∧ R.final = ![2, 5] ∧ ∀ j, R.E j = ∅ := sorry

/-! ### ED.2/exponent-reduction-chain -/

/-- Height `max |aᵢ|` of an exponent vector, as a rational. -/
def expHeight {q : ℕ} (a : Fin q → ℤ) : ℚ := ((Finset.univ.sup fun i => (a i).natAbs : ℕ) : ℚ)

/-- Weighted height `max |aᵢ| / wᵢ` of an exponent vector (weights `wᵢ ≥ 1`), as a rational. -/
def weightedHeight {q : ℕ} (w : Fin q → ℕ) (a : Fin q → ℤ) : ℚ :=
  ((Finset.univ.sup fun i => ((a i).natAbs : NNRat) / w i : NNRat) : ℚ)

/-- An exponent reduction chain: decreasing bounds, exceptional sets, and for every step the
implication established by an ED.1 reduction or enumeration certificate. -/
structure WeightedExponentReductionChain {q : ℕ} (w : Fin q → ℕ) (𝒮 : Set (Fin q → ℤ)) where
  k : ℕ
  X : Fin (k + 1) → ℚ
  E : Fin k → Finset (Fin q → ℤ)
  antitone : Antitone X
  step : ∀ (j : Fin k), ∀ a ∈ 𝒮, weightedHeight w a ≤ X j.castSucc →
    weightedHeight w a ≤ X j.succ ∨ a ∈ E j

namespace WeightedExponentReductionChain

variable {q : ℕ} {w : Fin q → ℕ} {𝒮 : Set (Fin q → ℤ)}

/-- The last bound of the chain. -/
def final (R : WeightedExponentReductionChain w 𝒮) : ℚ := R.X (Fin.last R.k)

theorem sound (R : WeightedExponentReductionChain w 𝒮) (a : Fin q → ℤ) (ha : a ∈ 𝒮)
    (h0 : weightedHeight w a ≤ R.X 0) : weightedHeight w a ≤ R.final ∨ ∃ j, a ∈ R.E j := sorry

/-- The chain without steps. -/
def nil (X₀ : ℚ) : WeightedExponentReductionChain w 𝒮 := sorry

/-- Adding one certified step. -/
def append (R : WeightedExponentReductionChain w 𝒮) (X' : ℚ) (E' : Finset (Fin q → ℤ))
    (hX : X' ≤ R.final)
    (hstep : ∀ a ∈ 𝒮, weightedHeight w a ≤ R.final → weightedHeight w a ≤ X' ∨ a ∈ E') :
    WeightedExponentReductionChain w 𝒮 := sorry

end WeightedExponentReductionChain

-- chain_nil: the empty chain ends at its initial bound.
example {q : ℕ} (w : Fin q → ℕ) (𝒮 : Set (Fin q → ℤ)) (X₀ : ℚ) :
    (WeightedExponentReductionChain.nil (w := w) (𝒮 := 𝒮) X₀).final = X₀ := sorry

-- chain_two_steps: bounds 10⁴⁰ ≥ 600 ≥ 70 without exceptions give height ≤ 70.
example {q : ℕ} (w : Fin q → ℕ) (𝒮 : Set (Fin q → ℤ)) (R : WeightedExponentReductionChain w 𝒮)
    (h0 : R.X 0 = 10 ^ 40) (hf : R.final = 70) (hE : ∀ j, R.E j = ∅) (a : Fin q → ℤ) (ha : a ∈ 𝒮)
    (hb : weightedHeight w a ≤ 10 ^ 40) : weightedHeight w a ≤ 70 := sorry

-- chain_enumeration_step: a vector of height 9 beyond the final bound 5 is an exception.
example (R : WeightedExponentReductionChain (fun _ => 1) ({![(9 : ℤ)]} : Set (Fin 1 → ℤ)))
    (h0 : 9 ≤ R.X 0) (hf : R.final = 5) : ∃ j, ![(9 : ℤ)] ∈ R.E j := sorry

-- chain_missing_certificate: decreasing bounds alone do not form a chain.
example : ¬ ∃ R : WeightedExponentReductionChain (fun _ => 1) ({![(100 : ℤ)]} : Set (Fin 1 → ℤ)),
    R.X 0 = 1000 ∧ R.final = 10 ∧ ∀ j, R.E j = ∅ := sorry

-- chain_unit_weights: with unit weights the weighted height is max |aᵢ|.
example {q : ℕ} (a : Fin q → ℤ) : weightedHeight (fun _ => 1) a = expHeight a := sorry

/-! ### ED.2/thue-equation -/

/-- The binary form `F = homogenize g (deg g)` evaluated at `(x, y)`. -/
def thueForm (g : ℤ[X]) (x y : ℤ) : ℤ := MvPolynomial.eval ![x, y] (g.homogenize g.natDegree)

/-- The solution set of the Thue equation `F(x, y) = m`. -/
def thueSolutions (g : ℤ[X]) (m : ℤ) : Set (ℤ × ℤ) := {p | thueForm g p.1 p.2 = m}

theorem thueForm_one (g : ℤ[X]) (x : ℤ) : thueForm g x 1 = g.eval x := sorry

theorem thueForm_zero (g : ℤ[X]) (x : ℤ) : thueForm g x 0 = g.leadingCoeff * x ^ g.natDegree :=
  sorry

theorem thueForm_smul (g : ℤ[X]) (t x y : ℤ) :
    thueForm g (t * x) (t * y) = t ^ g.natDegree * thueForm g x y := sorry

/-- A Thue equation: an irreducible form of degree at least three and `m ≠ 0`. -/
structure ThueEquation where
  g : ℤ[X]
  m : ℤ
  three_le_natDegree : 3 ≤ g.natDegree
  irreducible : Irreducible (g.map (Int.castRingHom ℚ))
  m_ne_zero : m ≠ 0

theorem ThueEquation.finite_solutions (E : ThueEquation) : (thueSolutions E.g E.m).Finite :=
  sorry

-- thueForm_cubic: X³ − 2 gives x³ − 2y³, with the solutions (1, 0) and (−1, −1) of m = 1.
example (x y : ℤ) : thueForm (X ^ 3 - C 2) x y = x ^ 3 - 2 * y ^ 3 ∧
    ((1 : ℤ), (0 : ℤ)) ∈ thueSolutions (X ^ 3 - C 2) 1 ∧
    ((-1 : ℤ), (-1 : ℤ)) ∈ thueSolutions (X ^ 3 - C 2) 1 := sorry

-- thueSolutions_scaling: solutions need not be primitive.
example : ((2 : ℤ), (0 : ℤ)) ∈ thueSolutions (X ^ 3 - C 2) 8 := sorry

-- thue_pell_nonexample: degree two gives infinitely many solutions.
example : (thueSolutions (X ^ 2 - C 2) 1).Infinite := sorry

-- thue_reducible_nonexample: a reducible form gives infinitely many solutions.
example : (thueSolutions ((X - C 1) ^ 3) 1).Infinite := sorry

-- thueForm_homogenize: agreement with the explicit sum of Polynomial.homogenize.
example (g : ℤ[X]) (x y : ℤ) : thueForm g x y =
    ∑ k ∈ Finset.range (g.natDegree + 1), g.coeff k * x ^ k * y ^ (g.natDegree - k) := sorry

/-! ### ED.2/thue-factor-covering -/

open NumberField in
/-- A factor covering: units generating the unit group with `±1`, and representatives `M`
such that `f₀(X − Yξ)` is `f₀μ` times a unit for every solution. -/
structure ThueFactorCovering (g : ℤ[X]) (m : ℤ) (K : Type*) [Field K] [NumberField K]
    (ξ : K) where
  r : ℕ
  rank_eq : r = Units.rank K
  ε : Fin r → (𝓞 K)ˣ
  M : Finset K
  representatives_ne_zero : ∀ μ ∈ M, μ ≠ 0
  units_generate : ∀ u : (𝓞 K)ˣ, ∃ a : Fin r → ℤ, u = ∏ i, ε i ^ a i ∨ u = -∏ i, ε i ^ a i
  covers : ∀ x y : ℤ, thueForm g x y = m → ∃ μ ∈ M, ∃ η : (𝓞 K)ˣ,
    (g.leadingCoeff : K) * (x - y * ξ) = g.leadingCoeff * μ * ((η : 𝓞 K) : K)

namespace ThueFactorCovering

open NumberField

variable {g : ℤ[X]} {m : ℤ} {K : Type*} [Field K] [NumberField K] {ξ : K}

theorem exists_repr (cov : ThueFactorCovering g m K ξ) (hg : g.leadingCoeff ≠ 0) (x y : ℤ)
    (h : thueForm g x y = m) : ∃ μ ∈ cov.M, ∃ a : Fin cov.r → ℤ, ∃ s : K, (s = 1 ∨ s = -1) ∧
      ((x : K) - y * ξ) = s * μ * ∏ i, (((cov.ε i : (𝓞 K)ˣ) : 𝓞 K) : K) ^ a i := sorry

/-- Full generation by exactly rank(K) units gives independent logarithmic coordinates. -/
theorem isMaxRank (cov : ThueFactorCovering g m K ξ) :
    Units.IsMaxRank (fun i : Fin (Units.rank K) => cov.ε (Fin.cast cov.rank_eq.symm i)) := sorry

/-- The covering from bounded divisor representatives (DT.4/divisors-up-to-units). -/
def ofDivisorRepresentatives (hg : Irreducible (g.map (Int.castRingHom ℚ)))
    (hdegree : 3 ≤ g.natDegree) (hm : m ≠ 0) (hξ : aeval ξ g = 0)
    (hfield : Module.finrank ℚ K = g.natDegree)
    (r : ℕ) (hr : r = Units.rank K) (u : Fin r → (𝓞 K)ˣ)
    (hu : ∀ v : (𝓞 K)ˣ, ∃ a : Fin r → ℤ, v = ∏ i, u i ^ a i ∨ v = -∏ i, u i ^ a i)
    (D : Finset (𝓞 K)) (hDzero : ∀ δ ∈ D, δ ≠ 0)
    (hD : ∀ z : 𝓞 K, z ∣ (g.leadingCoeff : 𝓞 K) ^ (g.natDegree - 1) * m →
      z ≠ 0 → ∃ δ ∈ D, Associated z δ) : ThueFactorCovering g m K ξ := sorry

/-- Unit generation from CN.2's regulator certificate. -/
def ofRegulatorBound (ε : Fin (Units.rank K) → (𝓞 K)ˣ) (M : Finset K) (hmax : Units.IsMaxRank ε)
    (hM : ∀ μ ∈ M, μ ≠ 0)
    (hreg : Units.regOfFamily ε < 2 * Units.regulator K)
    (htors : ∀ ζ ∈ Units.torsion K, ζ = 1 ∨ ζ = -1)
    (hcov : ∀ x y : ℤ, thueForm g x y = m → ∃ μ ∈ M, ∃ η : (𝓞 K)ˣ,
      (g.leadingCoeff : K) * (x - y * ξ) = g.leadingCoeff * μ * ((η : 𝓞 K) : K)) :
    ThueFactorCovering g m K ξ := sorry

/-- Enlarging the list of representatives. -/
def mono (cov : ThueFactorCovering g m K ξ) (M' : Finset K) (h : cov.M ⊆ M') (hM' : ∀ μ ∈ M', μ ≠ 0) :
    ThueFactorCovering g m K ξ := sorry

end ThueFactorCovering

open NumberField in
-- covering_unit_norm: for x³ − 2y³ = 1 the list {1} is a covering.
example (K : Type*) [Field K] [NumberField K] (ξ : K) (hξ : ξ ^ 3 = 2)
    (hdeg : Module.finrank ℚ K = 3) :
    ∃ cov : ThueFactorCovering (X ^ 3 - C 2) 1 K ξ, cov.M = {1} := sorry

open NumberField in
-- covering_zero_representative: a zero representative is rejected even if redundant.
example {g : ℤ[X]} {m : ℤ} {K : Type*} [Field K] [NumberField K] {ξ : K}
    (cov : ThueFactorCovering g m K ξ) : (0 : K) ∉ cov.M := sorry

open NumberField in
-- covering_missing_rep: for m = 2 the list {1} misses the solution (0, −1).
example (K : Type*) [Field K] [NumberField K] (ξ : K) (hξ : ξ ^ 3 = 2)
    (hdeg : Module.finrank ℚ K = 3) :
    ¬ ∃ cov : ThueFactorCovering (X ^ 3 - C 2) 2 K ξ, cov.M = {1} := sorry

open NumberField in
-- covering_units_index: the square of the fundamental unit does not generate the units.
example (K : Type*) [Field K] [NumberField K] (ξ : K) (hξ : ξ ^ 3 = 2)
    (hdeg : Module.finrank ℚ K = 3) (ε : (𝓞 K)ˣ) (hε : ((ε : 𝓞 K) : K) = (ξ - 1) ^ 2) :
    ¬ ∃ cov : ThueFactorCovering (X ^ 3 - C 2) 1 K ξ, ∀ i, cov.ε i = ε := sorry

open NumberField in
-- covering_degenerate: for a monic g and m = 1 the list {1} covers once units generate.
example (g : ℤ[X]) (hg : g.Monic) (K : Type*) [Field K] [NumberField K] (ξ : K)
    (hξ : aeval ξ g = 0) (hfield : Module.finrank ℚ K = g.natDegree)
    (r : ℕ) (hr : r = Units.rank K) (ε : Fin r → (𝓞 K)ˣ)
    (hU : ∀ u : (𝓞 K)ˣ, ∃ a : Fin r → ℤ, u = ∏ i, ε i ^ a i ∨ u = -∏ i, ε i ^ a i) :
    ∃ cov : ThueFactorCovering g 1 K ξ, cov.M = {1} ∨ cov.M = {1, -1} := sorry

open NumberField in
-- covering_compat_fundSystem: (U) for fundSystem is Mathlib's Dirichlet unit theorem.
example (g : ℤ[X]) (m : ℤ) (K : Type*) [Field K] [NumberField K] (ξ : K)
    (htors : ∀ ζ ∈ Units.torsion K, ζ = 1 ∨ ζ = -1) (M : Finset K)
    (hM : ∀ μ ∈ M, μ ≠ 0)
    (hcov : ∀ x y : ℤ, thueForm g x y = m → ∃ μ ∈ M, ∃ η : (𝓞 K)ˣ,
      (g.leadingCoeff : K) * (x - y * ξ) = g.leadingCoeff * μ * ((η : 𝓞 K) : K)) :
    ∃ cov : ThueFactorCovering g m K ξ, cov.r = Units.rank K ∧ cov.M = M ∧
      ∀ i, ∃ j, cov.ε i = Units.fundSystem K j := sorry

open NumberField in
-- covering_redundant_units: generation by a redundant family cannot support exponent bounds.
example {g : ℤ[X]} {m : ℤ} {K : Type*} [Field K] [NumberField K] {ξ : K}
    (hrank : Units.rank K = 1) (cov : ThueFactorCovering g m K ξ) : cov.r ≠ 2 := by
  rw [cov.rank_eq, hrank]
  decide

/-! ### ED.2/thue-analytic-constants -/

/-- Tzanakis–de Weger's `C₁ = 2^(n−1)|m| / min |g′(ξ)|` over the real roots. -/
def ThueConstants.C₁ (g : ℤ[X]) (m : ℤ) : ℝ := sorry

/-- Tzanakis–de Weger's `C₂ = ½ min |ξ⁽ⁱ⁾ − ξ⁽ʲ⁾|`. -/
def ThueConstants.C₂ (g : ℤ[X]) : ℝ := sorry

/-- Tzanakis–de Weger's `C₃ = max |ξ⁽ⁱ¹⁾ − ξ⁽ⁱ²⁾| / |ξ⁽ⁱ¹⁾ − ξ⁽ⁱ³⁾|` over pairwise distinct roots. -/
def ThueConstants.C₃ (g : ℤ[X]) : ℝ := sorry

/-- Tzanakis–de Weger's threshold `Y₀` (equal to `1` when every root is real). -/
def ThueConstants.realY₀ (g : ℤ[X]) (m : ℤ) : ℝ := sorry

/-- Certified rational constants of the method (lower-case fields are certified bounds). -/
structure ThueConstants (g : ℤ[X]) (m : ℤ) where
  c₁ : ℚ
  c₂ : ℚ
  c₃ : ℚ
  c₄ : ℚ
  c₅ : ℚ
  c₆ : ℚ
  μm : ℚ
  μp : ℚ
  Y₀ : ℕ
  Y₁ : ℕ
  Y₁s : ℕ
  Y₂ : ℕ
  c₁_ge : ThueConstants.C₁ g m ≤ c₁
  c₂_pos : 0 < c₂
  c₂_le : (c₂ : ℝ) ≤ ThueConstants.C₂ g
  c₃_ge : ThueConstants.C₃ g ≤ c₃
  c₆_ge : (1.39 : ℚ) * c₁ * c₃ * c₄ ^ g.natDegree / c₂ ≤ c₆
  Y₀_ge : ThueConstants.realY₀ g m ≤ Y₀
  Y₀_le_Y₁ : Y₀ ≤ Y₁
  Y₁_ge : 4 * c₁ ≤ (Y₁ : ℚ) ^ (g.natDegree - 2)
  Y₁_le_Y₁s : Y₁ ≤ Y₁s
  Y₁s_ge : 2 * c₁ * c₃ / c₂ ≤ (Y₁s : ℚ) ^ g.natDegree
  Y₁s_le_Y₂ : Y₁s ≤ Y₂
  Y₂_ge_m : 2 ^ g.natDegree * |(m : ℚ)| ≤ (Y₂ : ℚ) ^ g.natDegree
  Y₂_ge_μ : μp / c₂ ≤ Y₂

namespace ThueConstants

/-- The certificate computed from root boxes at a precision (or failure). -/
def ofBoxes (g : ℤ[X]) (m : ℤ) (P : ℕ) : Option (ThueConstants g m) := sorry

attribute [local instance] Matrix.linftyOpNormedRing in
/-- The certified bound `‖V‖_∞ / (1 − ρ)` for `N[U⁻¹]` (maximal absolute row sum) obtained
from an approximate inverse `V` with `‖1 − V·U‖_∞ ≤ ρ`. -/
def invNormBound {r : ℕ} (V : Matrix (Fin r) (Fin r) ℝ) (ρ : ℝ) : ℝ := ‖V‖ / (1 - ρ)

attribute [local instance] Matrix.linftyOpNormedRing in
theorem inv_norm_le {r : ℕ} (U V : Matrix (Fin (r + 1)) (Fin (r + 1)) ℝ) (ρ : ℝ) (hρ : ρ < 1)
    (h : ‖1 - V * U‖ ≤ ρ) : IsUnit U ∧ ‖U⁻¹‖ ≤ invNormBound V ρ := sorry

/-- Weakening the constants in the directions in which the lemmas use them. -/
def mono {g : ℤ[X]} {m : ℤ} (T : ThueConstants g m) (c₁' : ℚ) (h : T.c₁ ≤ c₁')
    (hY₁ : 4 * c₁' ≤ (T.Y₁ : ℚ) ^ (g.natDegree - 2))
    (hY₁s : 2 * c₁' * T.c₃ / T.c₂ ≤ (T.Y₁s : ℚ) ^ g.natDegree)
    (hc₆ : (1.39 : ℚ) * c₁' * T.c₃ * T.c₄ ^ g.natDegree / T.c₂ ≤ T.c₆) :
    ThueConstants g m := sorry

end ThueConstants

-- thueConstants_cubic: C₁ ≈ 0.83995 for x³ − 2y³ = 1.
example : (0.8399 : ℝ) < ThueConstants.C₁ (X ^ 3 - C 2) 1 ∧
    ThueConstants.C₁ (X ^ 3 - C 2) 1 < 0.84 := sorry

-- thueConstants_totally_complex: for X⁴ + X + 1 every solution has |Y| ≤ Y₀.
example (T : ThueConstants (X ^ 4 + X + 1) 1) :
    ∀ p ∈ thueSolutions (X ^ 4 + X + 1) 1, |p.2| ≤ T.Y₀ := sorry

-- thueConstants_orientation: with the exact inverse (ρ = 0) the bound for U_I = ((2, 1), (0, 1))
-- (rows = embeddings) is 1, while the transposed convention gives 3/2.
example : ThueConstants.invNormBound (!![(2 : ℝ), 1; 0, 1])⁻¹ 0 = 1 ∧
    ThueConstants.invNormBound (Matrix.transpose !![(2 : ℝ), 1; 0, 1])⁻¹ 0 = 3 / 2 := sorry

attribute [local instance] Matrix.linftyOpNormedRing in
-- thueConstants_inverse_bound: for U = (2) and V = (1/2), ρ = 0 is admissible and the bound
-- ‖V‖/(1 − ρ) = 1/2 equals ‖U⁻¹‖.
example : ‖1 - !![(1 / 2 : ℝ)] * !![(2 : ℝ)]‖ ≤ 0 ∧
    ThueConstants.invNormBound !![(1 / 2 : ℝ)] 0 = ‖(!![(2 : ℝ)])⁻¹‖ ∧
    ‖(!![(2 : ℝ)])⁻¹‖ = 1 / 2 := sorry

/-! ### ED.2/thue-root-approximation, thue-linear-form, thue-exponent-bound,
thue-initial-bound, thue-reduced-bound, thue-convergent-search -/

/-- Lemma 1.1: large solutions approximate a real root, and `X/Y` is a convergent. -/
theorem thue_exists_close_real_root (E : ThueEquation) (T : ThueConstants E.g E.m) (x y : ℤ)
    (h : thueForm E.g x y = E.m) (hy : (T.Y₀ : ℤ) < |y|) :
    ∃ ξ : ℝ, aeval ξ E.g = 0 ∧ |(x : ℝ) - y * ξ| * |(y : ℝ)| ^ (E.g.natDegree - 1) ≤ T.c₁ ∧
      ((T.Y₁ : ℤ) < |y| → ∃ k, ((x : ℚ) / y) = ξ.convergent k) := sorry

/-- Lemma 1.2 with (1.2)–(1.4): `z ≠ 1` (so `Λ ≠ 0`) and `|Λ| = ‖log z‖` is small, where
`Λ = log |z|` (real case) or `Λ = −i Log z` (complex case). -/
theorem thue_linearForm_small {K : Type*} [Field K] [NumberField K] (E : ThueEquation) (ξ : K)
    (hξ : aeval ξ E.g = 0) (T : ThueConstants E.g E.m) (σ τ υ : K →+* ℂ)
    (hστ : σ ξ ≠ τ ξ) (hτυ : τ ξ ≠ υ ξ) (hσυ : σ ξ ≠ υ ξ) (x y : ℤ)
    (hxy : thueForm E.g x y = E.m) (hy : (T.Y₁s : ℤ) < |y|)
    (hσ : ‖σ ((x : K) - y * ξ)‖ * |(y : ℝ)| ^ (E.g.natDegree - 1) ≤ T.c₁) :
    let z := (σ ξ - τ ξ) / (σ ξ - υ ξ) * (υ ((x : K) - y * ξ) / τ ((x : K) - y * ξ))
    z ≠ 1 ∧ ‖Complex.log z‖ * |(y : ℝ)| ^ E.g.natDegree < 1.39 * T.c₁ * T.c₃ / T.c₂ := sorry

open NumberField in
/-- Tzanakis–de Weger's `C₄ = (½ + max |ξ⁽ⁱ⁾ − ξ⁽ʲ⁾|)/μ₋` for a factor covering. -/
def ThueConstants.C₄ {g : ℤ[X]} {m : ℤ} {K : Type*} [Field K] [NumberField K] {ξ : K}
    (cov : ThueFactorCovering g m K ξ) : ℝ := sorry

open NumberField in
/-- Tzanakis–de Weger's `C₅ = min((n − 1) min_I N[U_I⁻¹], max_{i₀} N[U_{I(i₀)}⁻¹])`, with
`U_I` having the entry `log |εᵢ^(h_l)|` in row `l` and column `i`. -/
def ThueConstants.C₅ {g : ℤ[X]} {m : ℤ} {K : Type*} [Field K] [NumberField K] {ξ : K}
    (cov : ThueFactorCovering g m K ξ) : ℝ := sorry

open NumberField in
/-- `μ₊ = max |μ⁽ⁱ⁾|` over the embeddings and `μ ∈ M`. -/
def ThueConstants.μPlus {g : ℤ[X]} {m : ℤ} {K : Type*} [Field K] [NumberField K] {ξ : K}
    (cov : ThueFactorCovering g m K ξ) : ℝ := sorry

open NumberField in
/-- Lemmas 2.1–2.2: the exponents are at most `c₅ log(c₄|Y|)`. -/
theorem thue_exponent_le_log {K : Type*} [Field K] [NumberField K] (E : ThueEquation) (ξ : K)
    (hξ : aeval ξ E.g = 0) (hK : Module.finrank ℚ K = E.g.natDegree)
    (T : ThueConstants E.g E.m) (cov : ThueFactorCovering E.g E.m K ξ)
    (hc₄ : ThueConstants.C₄ cov ≤ T.c₄) (hc₅ : ThueConstants.C₅ cov ≤ T.c₅)
    (hμ : ThueConstants.μPlus cov ≤ T.μp) (x y : ℤ)
    (h : thueForm E.g x y = E.m) (hy : (T.Y₂ : ℤ) < |y|) (μ : K) (hμ : μ ∈ cov.M)
    (a : Fin cov.r → ℤ) (s : K) (hs : s = 1 ∨ s = -1)
    (hrep : ((x : K) - y * ξ) = s * μ * ∏ i, (((cov.ε i : (𝓞 K)ˣ) : 𝓞 K) : K) ^ a i) :
    ((Finset.univ.sup fun i => (a i).natAbs : ℕ) : ℝ) < T.c₅ * Real.log (T.c₄ * |(y : ℝ)|) :=
  sorry

/-- Lemmas 2.3–2.4 with Matveev's bound: the combination of the upper bound of Lemma 2.2 and
the certified lower bound gives `A ≤ K₃` (DT.4/log-linear-inequality-bound). -/
theorem thue_exponent_lt_initialBound (n : ℕ) (hn : 0 < n) (c₅ c₆ c₇ c₈ K₃ : ℝ) (hc₅ : 0 < c₅)
    (hc₇ : 0 < c₇) (A : ℕ) (Λ : ℝ) (hΛ : Λ ≠ 0) (hup : |Λ| < c₆ * Real.exp (-(n / c₅) * A))
    (hlow : 1 ≤ A → Real.exp (-(c₇ * (c₈ + Real.log A))) < |Λ|)
    (hK : max 1 (2 * (c₅ / n * (Real.log c₆ + c₇ * c₈)) +
      2 * (c₅ * c₇ / n) * (Real.log (2 * (c₅ * c₇ / n)) - 1)) ≤ K₃) : (A : ℝ) ≤ K₃ := sorry

/-- Pethő's bound: small exponents give small `|Y|`. -/
theorem thue_abs_y_le_of_reduction (x y : ℤ) (ξ₁ ξ₂ : ℂ) (hne : ξ₁ ≠ ξ₂) (μp E₁ E₂ : ℝ) (A : ℕ)
    (h₁ : ‖(x : ℂ) - y * ξ₁‖ ≤ μp * E₁ ^ A) (h₂ : ‖(x : ℂ) - y * ξ₂‖ ≤ μp * E₂ ^ A) :
    |(y : ℝ)| ≤ μp * (E₁ ^ A + E₂ ^ A) / ‖ξ₁ - ξ₂‖ := sorry

/-- The continued-fraction search for `Y₁ < |Y| ≤ C`. -/
theorem thue_eq_convergent_mul (E : ThueEquation) (Y₁ C : ℕ) (ξ : ℝ) (hξ : aeval ξ E.g = 0)
    (ξt : ℚ) (hξt : |(ξt : ℝ) - ξ| < 1 / (6 * (C : ℝ) ^ 2)) (x y : ℤ)
    (hxy : thueForm E.g x y = E.m) (hy₁ : (Y₁ : ℤ) < |y|) (hyC : |y| ≤ C)
    (hclose : |(x : ℝ) / y - ξ| ≤ 1 / (4 * (y : ℝ) ^ 2)) :
    ∃ k : ℕ, ∃ Z : ℤ, Z ≠ 0 ∧ Z ^ E.g.natDegree ∣ E.m ∧
      x = Z * ((ξt : ℝ).convergent k).num ∧ y = Z * ((ξt : ℝ).convergent k).den := sorry

/-! ### ED.2/thue-small-solutions -/

/-- The polynomial `F(X, y) − m` over `ℚ`. -/
def thueSlice (g : ℤ[X]) (m y : ℤ) : ℚ[X] :=
  ∑ k ∈ Finset.range (g.natDegree + 1),
    Polynomial.C ((g.coeff k : ℚ) * (y : ℚ) ^ (g.natDegree - k)) * Polynomial.X ^ k -
    Polynomial.C (m : ℚ)

/-- The solutions with `|y| ≤ Y₁`, enumerated within the Cauchy bound. -/
def thueSmallSolutions (g : ℤ[X]) (m : ℤ) (Y₁ : ℕ) : Finset (ℤ × ℤ) := sorry

theorem mem_thueSmallSolutions (E : ThueEquation) (Y₁ : ℕ) (p : ℤ × ℤ) :
    p ∈ thueSmallSolutions E.g E.m Y₁ ↔ p ∈ thueSolutions E.g E.m ∧ |p.2| ≤ Y₁ := sorry

theorem thueSmallSolutions_mono (g : ℤ[X]) (m : ℤ) {Y Y' : ℕ} (h : Y ≤ Y') :
    thueSmallSolutions g m Y ⊆ thueSmallSolutions g m Y' := sorry

theorem abs_lt_cauchyBound_of_thue (E : ThueEquation) (x y : ℤ) (h : thueForm E.g x y = E.m) :
    ‖(x : ℚ)‖₊ < (thueSlice E.g E.m y).cauchyBound := sorry

-- thueSmall_cubic: the solutions of x³ − 2y³ = 1 with |y| ≤ 1.
example : thueSmallSolutions (X ^ 3 - C 2) 1 1 = {(1, 0), (-1, -1)} := sorry

-- thueSmall_zero: Y₁ = 0 for x³ − 2y³ = 8.
example : thueSmallSolutions (X ^ 3 - C 2) 8 0 = {(2, 0)} := sorry

-- thueSmall_bound_nonexample: |x| ≤ |m| is not a valid search bound.
example : ((5 : ℤ), (4 : ℤ)) ∈ thueSolutions (X ^ 3 - C 2) (-3) ∧ ¬ (|(5 : ℤ)| ≤ |(-3 : ℤ)|) :=
  sorry

-- thueSmall_compat: agreement with the set of solutions cut at |y| ≤ Y₁.
example (E : ThueEquation) (Y₁ : ℕ) :
    ((thueSmallSolutions E.g E.m Y₁ : Finset (ℤ × ℤ)) : Set (ℤ × ℤ)) =
      thueSolutions E.g E.m ∩ {p | |p.2| ≤ Y₁} := sorry

/-! ### ED.2/thue-certificate and ED.2/thue-certified-solution-set -/

open NumberField in
/-- The exponent vectors `𝒮_{i₀,μ}` of ED.2/thue-reduced-bound for the representative `μ` and
the embedding `σ` (the real index `i₀`): the `a` with `X − Yξ = ±μ∏εᵢ^aᵢ` for a solution with
`|Y| > Y₂` for which `σ` minimises `|X − Yξ^{(i)}|`. -/
def thueExponentSet {g : ℤ[X]} {m : ℤ} {K : Type*} [Field K] [NumberField K] {ξ : K}
    (cov : ThueFactorCovering g m K ξ) (Y₂ : ℕ) (μ : K) (σ : K →+* ℂ) : Set (Fin cov.r → ℤ) :=
  {a | ∃ x y : ℤ, thueForm g x y = m ∧ (Y₂ : ℤ) < |y| ∧
    (∀ τ : K →+* ℂ, ‖σ ((x : K) - y * ξ)‖ ≤ ‖τ ((x : K) - y * ξ)‖) ∧
    ∃ s : K, (s = 1 ∨ s = -1) ∧
      (x : K) - y * ξ = s * μ * ∏ i, (((cov.ε i : (𝓞 K)ˣ) : 𝓞 K) : K) ^ a i}

open NumberField in
/-- The reduction data of one case `(σ, μ)` of a Thue certificate (ED.2/thue-initial-bound,
ED.2/thue-reduced-bound): the indices `(j, k)` as embeddings `τ, υ`, a Matveev certificate for
the `r + 2` logarithms `log δ_μ, log(εᵢ^{(k)}/εᵢ^{(j)}), log(−1)` of ED.2/thue-linear-form (d)
with degree bound `n(n − 1)(n − 2)`, the rationals `Ĉ₈`, `ℓ⁺(ĉ₆)`, `ℓ⁺(2b)`, `K₃`, and an
exponent reduction chain for `𝒮_{i₀,μ}` (unit weights). -/
structure ThueReductionCase {g : ℤ[X]} {m : ℤ} {K : Type*} [Field K] [NumberField K] {ξ : K}
    (cov : ThueFactorCovering g m K ξ) (T : ThueConstants g m) (μ : K) (σ : K →+* ℂ) where
  τ : K →+* ℂ
  υ : K →+* ℂ
  matveev : MatveevConstantCertificate (cov.r + 2)
    (g.natDegree * (g.natDegree - 1) * (g.natDegree - 2))
  c₈ : ℚ
  logC₆ : ℚ
  log2b : ℚ
  K₃ : ℚ
  chain : WeightedExponentReductionChain (fun _ => 1) (thueExponentSet cov T.Y₂ μ σ)

namespace ThueReductionCase

open NumberField

variable {g : ℤ[X]} {m : ℤ} {K : Type*} [Field K] [NumberField K] {ξ : K}
  {cov : ThueFactorCovering g m K ξ} {T : ThueConstants g m} {μ : K} {σ : K →+* ℂ}

/-- The checks of one case: distinct conjugates, the admissibility of the Matveev certificate
through the height bounds `h(δ_μ) ≤ 4h(ξ) + 2 log 2 + 2h(μ)`, `h(εᵢ^{(k)}/εᵢ^{(j)}) ≤ 2h(εᵢ)`,
`h(−1) = 0` and the logarithm enclosures, the enclosures `Ĉ₈ ≥ 1 + log(r + 2)`,
`ℓ⁺(ĉ₆) ≥ log ĉ₆`, `ℓ⁺(2b) ≥ log 2b`, the inequality `K₃ ≥ max(1, 2a + 2b(ℓ⁺(2b) − 1))` with
`a = (ĉ₅/n)(ℓ⁺(ĉ₆) + C₇Ĉ₈)`, `b = ĉ₅C₇/n`, and the start `X₀ ≥ (r + 2)K₃/2` of the chain. -/
structure Valid (R : ThueReductionCase cov T μ σ) : Prop where
  distinct : σ ξ ≠ R.τ ξ ∧ R.τ ξ ≠ R.υ ξ ∧ σ ξ ≠ R.υ ξ
  height_δ : ((g.natDegree * (g.natDegree - 1) * (g.natDegree - 2) : ℕ) : ℝ) *
    (4 * absLogHeight₁ ξ + 2 * Real.log 2 + 2 * absLogHeight₁ μ) ≤ R.matveev.A 0
  height_ε : ∀ i : Fin cov.r, ((g.natDegree * (g.natDegree - 1) * (g.natDegree - 2) : ℕ) : ℝ) *
    (2 * absLogHeight₁ (((cov.ε i : (𝓞 K)ˣ) : 𝓞 K) : K)) ≤ R.matveev.A i.succ.castSucc
  log_δ : ‖Complex.log ((σ ξ - R.τ ξ) / (σ ξ - R.υ ξ) * (R.υ μ / R.τ μ))‖ ≤ R.matveev.A 0
  log_ε : ∀ i : Fin cov.r, ‖Complex.log (R.υ (((cov.ε i : (𝓞 K)ˣ) : 𝓞 K) : K) /
    R.τ (((cov.ε i : (𝓞 K)ˣ) : 𝓞 K) : K))‖ ≤ R.matveev.A i.succ.castSucc
  log_neg_one : Real.pi ≤ R.matveev.A (Fin.last _)
  c₈_ge : 1 + Real.log (cov.r + 2) ≤ R.c₈
  logC₆_ge : Real.log T.c₆ ≤ R.logC₆
  log2b_ge : Real.log (2 * (T.c₅ * R.matveev.c / g.natDegree)) ≤ R.log2b
  K₃_ge : max 1 (2 * (T.c₅ / g.natDegree * (R.logC₆ + R.matveev.c * R.c₈)) +
    2 * (T.c₅ * R.matveev.c / g.natDegree) * (R.log2b - 1)) ≤ R.K₃
  chain_start : R.K₃ * (cov.r + 2) / 2 ≤ R.chain.X 0

end ThueReductionCase

open NumberField in
/-- The data used when `s ≥ 1`: a factor covering (its conditions (U), (M) are fields of
`ThueFactorCovering`, hypotheses of soundness rather than checks), the cases, the reduced
exponent bound `A_red`, two embeddings `l₁, l₂` and the rational bounds `Ê_{l₁}, Ê_{l₂}`. -/
structure ThueReductionData (E : ThueEquation) (K : Type*) [Field K] [NumberField K] (ξ : K)
    (T : ThueConstants E.g E.m) where
  covering : ThueFactorCovering E.g E.m K ξ
  cases : ∀ μ ∈ covering.M, ∀ σ : K →+* ℂ, ThueReductionCase covering T μ σ
  Ared : ℕ
  l₁ : K →+* ℂ
  l₂ : K →+* ℂ
  Ê₁ : ℚ
  Ê₂ : ℚ

namespace ThueReductionData

open NumberField

variable {E : ThueEquation} {K : Type*} [Field K] [NumberField K] {ξ : K} {T : ThueConstants E.g E.m}

/-- The checks of the reduction data for the search bound `C`: the covering constants are
dominated (`ĉ₄ ≥ C₄`, `ĉ₅ ≥ C₅`, `μ̂₊ ≥ μ₊`), every case is valid, every chain ends below
`A_red`, `Ê_l ≥ ∏ᵢ max(|εᵢ^{(l)}|, |εᵢ^{(l)}|⁻¹)`, and Pethő's bound
`μ̂₊(Ê_{l₁}^{A_red} + Ê_{l₂}^{A_red}) / (2ĉ₂) ≤ C` (with `2ĉ₂ ≤ |ξ^{(l₁)} − ξ^{(l₂)}|`). -/
structure Valid (D : ThueReductionData E K ξ T) (C : ℕ) : Prop where
  c₄_ge : ThueConstants.C₄ D.covering ≤ T.c₄
  c₅_ge : ThueConstants.C₅ D.covering ≤ T.c₅
  μp_ge : ThueConstants.μPlus D.covering ≤ T.μp
  cases_valid : ∀ μ (hμ : μ ∈ D.covering.M) σ, (D.cases μ hμ σ).Valid
  Ared_ge : ∀ μ (hμ : μ ∈ D.covering.M) σ, (D.cases μ hμ σ).chain.final ≤ D.Ared
  l_ne : D.l₁ ξ ≠ D.l₂ ξ
  Ê₁_ge : ∏ i, max ‖D.l₁ (((D.covering.ε i : (𝓞 K)ˣ) : 𝓞 K) : K)‖
    ‖D.l₁ (((D.covering.ε i : (𝓞 K)ˣ) : 𝓞 K) : K)‖⁻¹ ≤ D.Ê₁
  Ê₂_ge : ∏ i, max ‖D.l₂ (((D.covering.ε i : (𝓞 K)ˣ) : 𝓞 K) : K)‖
    ‖D.l₂ (((D.covering.ε i : (𝓞 K)ˣ) : 𝓞 K) : K)‖⁻¹ ≤ D.Ê₂
  petho : T.μp * (D.Ê₁ ^ D.Ared + D.Ê₂ ^ D.Ared) ≤ 2 * T.c₂ * C

end ThueReductionData

/-- The data of a Thue certificate: constants, the reduction data when `s ≥ 1`, the search
bound `C`, rational approximations of the real roots and the claimed list `L`. -/
structure ThueCertificate (E : ThueEquation) (K : Type*) [Field K] [NumberField K] (ξ : K) where
  constants : ThueConstants E.g E.m
  reduction : Option (ThueReductionData E K ξ constants)
  searchBound : ℕ
  rootApprox : Finset ℚ
  solutions : Finset (ℤ × ℤ)

namespace ThueCertificate

open NumberField

variable {E : ThueEquation} {K : Type*} [Field K] [NumberField K] {ξ : K}

/-- Validity: the exact checks of the certificate. `L` passes the exact test and contains the
small solutions, the convergent candidates and the candidates of the exceptional exponent
vectors; when a real root exists the reduction data are present and valid for `C`. -/
structure Valid (c : ThueCertificate E K ξ) : Prop where
  solutions_pass : ∀ p ∈ c.solutions, thueForm E.g p.1 p.2 = E.m
  small_subset : thueSmallSolutions E.g E.m c.constants.Y₁ ⊆ c.solutions
  rootApprox_close : ∀ ξr : ℝ, aeval ξr E.g = 0 →
    ∃ ξt ∈ c.rootApprox, |(ξt : ℝ) - ξr| < 1 / (6 * (c.searchBound : ℝ) ^ 2)
  convergents_subset : ∀ ξt ∈ c.rootApprox, ∀ k : ℕ, ∀ Z : ℤ, Z ≠ 0 →
    Z ^ E.g.natDegree ∣ E.m → ((ξt : ℝ).convergent k).den ≤ c.searchBound →
    thueForm E.g (Z * ((ξt : ℝ).convergent k).num) (Z * ((ξt : ℝ).convergent k).den) = E.m →
    (Z * ((ξt : ℝ).convergent k).num, Z * ((ξt : ℝ).convergent k).den) ∈ c.solutions
  searchBound_ge : c.constants.Y₂ ≤ c.searchBound
  reduction_isSome : (∃ ξr : ℝ, aeval ξr E.g = 0) → c.reduction.isSome
  reduction_valid : ∀ D ∈ c.reduction, D.Valid c.searchBound
  exceptional_subset : ∀ D ∈ c.reduction, ∀ μ (hμ : μ ∈ D.covering.M) σ j,
    ∀ a ∈ (D.cases μ hμ σ).chain.E j, ∀ x y : ℤ, ∀ s : K, (s = 1 ∨ s = -1) →
      (x : K) - y * ξ = s * μ * ∏ i, (((D.covering.ε i : (𝓞 K)ˣ) : 𝓞 K) : K) ^ a i →
      thueForm E.g x y = E.m → (x, y) ∈ c.solutions

theorem solutions_subset (c : ThueCertificate E K ξ) (hc : c.Valid) :
    (c.solutions : Set (ℤ × ℤ)) ⊆ thueSolutions E.g E.m := sorry

/-- ED.2/thue-certified-solution-set: the classes `|Y| ≤ Ŷ₁` (enumerated),
`Ŷ₁ < |Y| ≤ C` (convergents), `C < |Y|` with `A ≤ K₃` (reduction chains and Pethő's bound) and
`A > K₃` (Matveev through the case certificates) exhaust the solutions. -/
theorem solutions_eq (c : ThueCertificate E K ξ) (hc : c.Valid) (hξ : aeval ξ E.g = 0)
    (hK : Module.finrank ℚ K = E.g.natDegree) :
    thueSolutions E.g E.m = c.solutions := sorry

end ThueCertificate

-- thueCert_contains_known_solutions (supporting conditional soundness): a valid certificate for x³ − 2y³ = 1 lists (1, 0) and (−1, −1).
example (E : ThueEquation) (hE : E.g = X ^ 3 - C 2) (hm : E.m = 1) (K : Type*) [Field K]
    [NumberField K] (ξ : K) (hξ : aeval ξ E.g = 0) (hK : Module.finrank ℚ K = E.g.natDegree)
    (c : ThueCertificate E K ξ) (hc : c.Valid) :
    ((1 : ℤ), (0 : ℤ)) ∈ c.solutions ∧ ((-1 : ℤ), (-1 : ℤ)) ∈ c.solutions :=
  sorry

-- thueCert_totally_complex: OMITTED (§13), pending replayable raw certificate data.

-- thueCert_bad_box: validity requires the root approximations, whatever the list.
example (E : ThueEquation) (K : Type*) [Field K] [NumberField K] (ξ : K)
    (c : ThueCertificate E K ξ) (ξr : ℝ) (hξr : aeval ξr E.g = 0)
    (hbad : ∀ ξt ∈ c.rootApprox, 1 / (6 * (c.searchBound : ℝ) ^ 2) ≤ |(ξt : ℝ) - ξr|) :
    ¬ c.Valid := sorry

-- thueCert_extra_pair: (2, 1) cannot be listed for x³ − 2y³ = 1.
example (E : ThueEquation) (hE : E.g = X ^ 3 - C 2) (hm : E.m = 1) (K : Type*) [Field K]
    [NumberField K] (ξ : K) (c : ThueCertificate E K ξ)
    (h : ((2 : ℤ), (1 : ℤ)) ∈ c.solutions) : ¬ c.Valid := sorry

-- thueCert_compat: equality of the Finset coerced to Set with Mathlib-style solution set.
example (E : ThueEquation) (K : Type*) [Field K] [NumberField K] (ξ : K)
    (hξ : aeval ξ E.g = 0) (hK : Module.finrank ℚ K = E.g.natDegree)
    (c : ThueCertificate E K ξ) (hc : c.Valid) (p : ℤ × ℤ) :
    p ∈ c.solutions ↔ thueForm E.g p.1 p.2 = E.m := sorry

/-! ### ED.2/thue-mahler-equation -/

/-- Normalised solutions of `F(X, Y) = c·∏ pᵢ^zᵢ` with `gcd(X, Y) = gcd(Y, f₀) = 1`. -/
def thueMahlerSolutions (g : ℤ[X]) (c : ℤ) {v : ℕ} (p : Fin v → ℕ) :
    Set (ℤ × ℤ × (Fin v → ℕ)) :=
  {s | IsCoprime s.1 s.2.1 ∧ IsCoprime s.2.1 g.leadingCoeff ∧
    thueForm g s.1 s.2.1 = c * ∏ i, (p i : ℤ) ^ s.2.2 i}

theorem mem_thueMahlerSolutions (g : ℤ[X]) (c : ℤ) {v : ℕ} (p : Fin v → ℕ) (x y : ℤ)
    (z : Fin v → ℕ) : (x, y, z) ∈ thueMahlerSolutions g c p ↔ IsCoprime x y ∧
      IsCoprime y g.leadingCoeff ∧ thueForm g x y = c * ∏ i, (p i : ℤ) ^ z i := sorry

theorem thueMahlerSolutions_monic (g : ℤ[X]) (c : ℤ) {v : ℕ} (p : Fin v → ℕ) (x y : ℤ)
    (z : Fin v → ℕ) (hg : g.leadingCoeff ≠ 0) : (x, y, z) ∈ thueMahlerSolutions g c p ↔
      IsCoprime (g.leadingCoeff * x) y ∧ thueForm (integralNormalization g) (g.leadingCoeff * x) y =
        g.leadingCoeff ^ (g.natDegree - 1) * c * ∏ i, (p i : ℤ) ^ z i := sorry

/-- A Thue–Mahler equation. -/
structure ThueMahlerEquation where
  g : ℤ[X]
  c : ℤ
  v : ℕ
  p : Fin v → ℕ
  three_le_natDegree : 3 ≤ g.natDegree
  irreducible : Irreducible (g.map (Int.castRingHom ℚ))
  c_ne_zero : c ≠ 0
  prime : ∀ i, (p i).Prime
  injective : Function.Injective p
  coprime : ∀ i, ¬ (p i : ℤ) ∣ c

theorem thueMahlerSolutions_finite (E : ThueMahlerEquation) :
    (thueMahlerSolutions E.g E.c E.p).Finite := sorry

-- thueMahler_cubic: (1, 0, 0), (−1, −1, 0) and (3, 1, 2) for x³ − 2y³ = 5^z.
example : ((1 : ℤ), (0 : ℤ), ![0]) ∈ thueMahlerSolutions (X ^ 3 - C 2) 1 ![5] ∧
    ((-1 : ℤ), (-1 : ℤ), ![0]) ∈ thueMahlerSolutions (X ^ 3 - C 2) 1 ![5] ∧
    ((3 : ℤ), (1 : ℤ), ![2]) ∈ thueMahlerSolutions (X ^ 3 - C 2) 1 ![5] := sorry

-- thueMahler_noncoprime: (5, 0, 3) is excluded by coprimality.
example : ((5 : ℤ), (0 : ℤ), ![3]) ∉ thueMahlerSolutions (X ^ 3 - C 2) 1 ![5] := sorry

-- thueMahler_v_zero_compat: with no primes, the coprime solutions of the Thue equation.
example (g : ℤ[X]) (c x y : ℤ) : (x, y, (Fin.elim0 : Fin 0 → ℕ)) ∈ thueMahlerSolutions g c
    (Fin.elim0 : Fin 0 → ℕ) ↔ IsCoprime x y ∧ IsCoprime y g.leadingCoeff ∧
      (x, y) ∈ thueSolutions g c := sorry

-- thueMahler_nonprimitive_zero_primes: (2,0) solves F=8, but is excluded by normalization.
example : ((2 : ℤ), (0 : ℤ)) ∈ thueSolutions (X ^ 3 - C 2) 8 ∧
    ((2 : ℤ), (0 : ℤ), (Fin.elim0 : Fin 0 → ℕ)) ∉
      thueMahlerSolutions (X ^ 3 - C 2) 8 (Fin.elim0 : Fin 0 → ℕ) := sorry

-- thueMahler_sign: c = −1 is a separate instance containing (1, 1, 0).
example : ((1 : ℤ), (1 : ℤ), ![0]) ∈ thueMahlerSolutions (X ^ 3 - C 2) (-1) ![5] := sorry

/-! ### ED.2/prime-ideal-removing-lemma -/

open NumberField in
/-- Third corollary of the Prime Ideal Removing Lemma: if `p` does not divide the
discriminant of `θ` (the minimal polynomial is squarefree modulo `p`), at most one prime
above `p` divides `x − yθ` for coprime `x, y`. -/
theorem prime_ideal_removing {K : Type*} [Field K] [NumberField K] (θ : 𝓞 K) (p : ℕ)
    (hdeg : (minpoly ℤ θ).natDegree = Module.finrank ℚ K)
    (hp : p.Prime) (hsep : Squarefree ((minpoly ℤ θ).map (Int.castRingHom (ZMod p))))
    (x y : ℤ) (hxy : IsCoprime x y) :
    {P : Ideal (𝓞 K) | P.IsPrime ∧ P ≠ ⊥ ∧ (p : 𝓞 K) ∈ P ∧ ((x : 𝓞 K) - y * θ) ∈ P}.Subsingleton :=
  sorry

/-! ### ED.2/thue-mahler-s-unit-covering -/

/-- One case `(α, π, h, s′, t′)` of the covering. -/
structure ThueMahlerCase (K : Type*) (v : ℕ) where
  α : K
  π : Fin v → K
  h : Fin v → ℕ
  s : Fin v → ℕ
  t : Fin v → ℕ

open NumberField in
/-- A Thue–Mahler S-unit covering (TdW (10)–(11)): (U) every unit is a root of unity times a
product of the `εᵢ` (roots of unity other than `±1` are absorbed into the `α` in (C)). -/
structure ThueMahlerCovering (E : ThueMahlerEquation) (K : Type*) [Field K] [NumberField K]
    (θ : K) where
  r : ℕ
  rank_eq : r = Units.rank K
  ε : Fin r → (𝓞 K)ˣ
  cases : List (ThueMahlerCase K E.v)
  α_ne_zero : ∀ cs ∈ cases, cs.α ≠ 0
  π_ne_zero : ∀ cs ∈ cases, ∀ i, cs.π i ≠ 0
  case_wellformed : ∀ cs ∈ cases, ∀ i,
    (cs.h i = 0 ∧ cs.π i = 1 ∧ cs.s i = 0) ∨ (0 < cs.h i ∧ cs.s i < cs.h i)
  units_generate : ∀ u : (𝓞 K)ˣ, ∃ ζ ∈ Units.torsion K, ∃ a : Fin r → ℤ, u = ζ * ∏ i, ε i ^ a i
  covers : ∀ s ∈ thueMahlerSolutions E.g E.c E.p, ∃ cs ∈ cases, ∃ a : Fin r → ℤ,
    ∃ n : Fin E.v → ℕ, ∃ σ : K, (σ = 1 ∨ σ = -1) ∧
      ((E.g.leadingCoeff * s.1 : ℤ) : K) - (s.2.1 : K) * θ =
        σ * cs.α * (∏ i, (((ε i : (𝓞 K)ˣ) : 𝓞 K) : K) ^ a i) * ∏ i, cs.π i ^ n i ∧
      ∀ i, s.2.2 i = n i * cs.h i + cs.s i + cs.t i

namespace ThueMahlerCovering

open NumberField

variable {E : ThueMahlerEquation} {K : Type*} [Field K] [NumberField K] {θ : K}

theorem exists_repr (cov : ThueMahlerCovering E K θ) (s : ℤ × ℤ × (Fin E.v → ℕ))
    (hs : s ∈ thueMahlerSolutions E.g E.c E.p) : ∃ cs ∈ cov.cases, ∃ a : Fin cov.r → ℤ,
      ∃ n : Fin E.v → ℕ, ∃ σ : K, (σ = 1 ∨ σ = -1) ∧
        ((E.g.leadingCoeff * s.1 : ℤ) : K) - (s.2.1 : K) * θ =
          σ * cs.α * (∏ i, (((cov.ε i : (𝓞 K)ˣ) : 𝓞 K) : K) ^ a i) * ∏ i, cs.π i ^ n i ∧
        ∀ i, s.2.2 i = n i * cs.h i + cs.s i + cs.t i := sorry

/-- The covering from ideal factorisations, principal generators and a unit certificate. -/
def semanticCoveringOfUnits (hθ : aeval θ (integralNormalization E.g) = 0) (r : ℕ)
    (hr : r = Units.rank K)
    (ε : Fin r → (𝓞 K)ˣ)
    (hU : ∀ u : (𝓞 K)ˣ, ∃ ζ ∈ Units.torsion K, ∃ a : Fin r → ℤ, u = ζ * ∏ i, ε i ^ a i) :
    ThueMahlerCovering E K θ := sorry

/-- With no primes, the cases of a covering give the representatives of a Thue covering. -/
theorem toThue (cov : ThueMahlerCovering E K θ) (hv : E.v = 0) :
    ∀ s ∈ thueMahlerSolutions E.g E.c E.p, ∃ cs ∈ cov.cases, ∃ a : Fin cov.r → ℤ,
      ∃ σ : K, (σ = 1 ∨ σ = -1) ∧ ((E.g.leadingCoeff * s.1 : ℤ) : K) - (s.2.1 : K) * θ =
        σ * cs.α * ∏ i, (((cov.ε i : (𝓞 K)ˣ) : 𝓞 K) : K) ^ a i := sorry

end ThueMahlerCovering

open NumberField in
-- tmCovering_example_cases: TdW's example has a covering with five cases.
example (E : ThueMahlerEquation) (hE : E.g = X ^ 3 - 23 * X ^ 2 + 5 * X + 24)
    (hc : E.c = 1 ∨ E.c = -1) (hv : E.v = 4) (hp : ∀ i, E.p i ∈ ({2, 3, 5, 7} : Finset ℕ))
    (K : Type*) [Field K] [NumberField K] (hK : Module.finrank ℚ K = 3) (θ : K)
    (hθ : aeval θ E.g = 0) :
    ∃ cov : ThueMahlerCovering E K θ, cov.cases.length = 5 := sorry

open NumberField in
-- tmCovering_no_degree_one: normalize the dummy exponent to zero when πᵢ=1,hᵢ=0.
example (E : ThueMahlerEquation) (K : Type*) [Field K] [NumberField K] (θ : K)
    (cov : ThueMahlerCovering E K θ) (i : Fin E.v) (hπ : ∀ cs ∈ cov.cases, cs.π i = 1)
    (hh : ∀ cs ∈ cov.cases, cs.h i = 0)
    (s : ℤ × ℤ × (Fin E.v → ℕ)) (hs : s ∈ thueMahlerSolutions E.g E.c E.p) :
    ∃ cs ∈ cov.cases, ∃ a : Fin cov.r → ℤ, ∃ n : Fin E.v → ℕ, ∃ σ : K,
      n i = 0 ∧ (σ = 1 ∨ σ = -1) ∧
      ((E.g.leadingCoeff * s.1 : ℤ) : K) - (s.2.1 : K) * θ =
        σ * cs.α * (∏ j, (((cov.ε j : (𝓞 K)ˣ) : 𝓞 K) : K) ^ a j) * ∏ j, cs.π j ^ n j ∧
      ∀ j, s.2.2 j = n j * cs.h j + cs.s j + cs.t j := sorry

open NumberField in
-- tmCovering_missing_case: dropping a needed case breaks the covering.
example (E : ThueMahlerEquation) (K : Type*) [Field K] [NumberField K] (θ : K)
    (cov : ThueMahlerCovering E K θ) (s : ℤ × ℤ × (Fin E.v → ℕ))
    (hs : s ∈ thueMahlerSolutions E.g E.c E.p)
    (hmiss : ∀ cs ∈ cov.cases.tail, ∀ a : Fin cov.r → ℤ, ∀ n : Fin E.v → ℕ,
      ((E.g.leadingCoeff * s.1 : ℤ) : K) - (s.2.1 : K) * θ ≠
        cs.α * (∏ i, (((cov.ε i : (𝓞 K)ˣ) : 𝓞 K) : K) ^ a i) * ∏ i, cs.π i ^ n i) :
    cov.cases ≠ cov.cases.tail := sorry

open NumberField in
-- tmCovering_compat_units: (U) for fundSystem is Mathlib's Dirichlet unit theorem.
example (E : ThueMahlerEquation) (K : Type*) [Field K] [NumberField K] (θ : K)
    (cases : List (ThueMahlerCase K E.v))
    (hα : ∀ cs ∈ cases, cs.α ≠ 0) (hπ : ∀ cs ∈ cases, ∀ i, cs.π i ≠ 0)
    (hcases : ∀ cs ∈ cases, ∀ i,
      (cs.h i = 0 ∧ cs.π i = 1 ∧ cs.s i = 0) ∨ (0 < cs.h i ∧ cs.s i < cs.h i))
    (hcov : ∀ s ∈ thueMahlerSolutions E.g E.c E.p, ∃ cs ∈ cases,
      ∃ a : Fin (Units.rank K) → ℤ, ∃ n : Fin E.v → ℕ, ∃ σ : K, (σ = 1 ∨ σ = -1) ∧
        ((E.g.leadingCoeff * s.1 : ℤ) : K) - (s.2.1 : K) * θ =
          σ * cs.α * (∏ i, (((Units.fundSystem K i : (𝓞 K)ˣ) : 𝓞 K) : K) ^ a i) *
            ∏ i, cs.π i ^ n i ∧
        ∀ i, s.2.2 i = n i * cs.h i + cs.s i + cs.t i) :
    ∃ cov : ThueMahlerCovering E K θ, cov.cases = cases ∧ cov.r = Units.rank K := sorry

open NumberField in
-- tmCovering_redundant_units: no redundant unit coordinates in an exponent bound.
example {E : ThueMahlerEquation} {K : Type*} [Field K] [NumberField K] {θ : K}
    (hrank : Units.rank K = 1) (cov : ThueMahlerCovering E K θ) : cov.r ≠ 2 := by
  rw [cov.rank_eq, hrank]
  decide

/-! ### ED.2/thue-mahler-initial-bounds, thue-mahler-reduced-bounds, auxiliary-prime-sieve -/

/-- TdW Theorem 10 in abstract form: `N ≤ c₁₃(log H + c₁₄)`, `A < c₁₈ + c₁₇N` or the
Case 3 bound `H ≤ c₂₃ + c₂₄ log H` give `H ≤ K₀`. -/
theorem thueMahler_exponents_le_initialBound (N A : ℕ) (c₁₃ c₁₄ c₁₇ c₁₈ c₂₃ c₂₄ K₀ : ℝ)
    (hc : 0 < c₁₃ ∧ 0 ≤ c₁₇ ∧ 0 < c₂₄) (hN : (N : ℝ) ≤ c₁₃ * (Real.log (max N A) + c₁₄))
    (hA : (A : ℝ) < c₁₈ + c₁₇ * N ∨ (max N A : ℝ) ≤ c₂₃ + c₂₄ * Real.log (max N A))
    (hK : ∀ H : ℝ, 1 ≤ H → (H ≤ c₁₃ * (Real.log H + c₁₄) ∨ H ≤ c₁₈ + c₁₇ * (c₁₃ * (Real.log H +
      c₁₄)) ∨ H ≤ c₂₃ + c₂₄ * Real.log H) → H ≤ K₀) : ((max N A : ℕ) : ℝ) ≤ max 1 K₀ := sorry

/-- The p-adic reduction step: a solution whose `p_l`-adic order is at least `t` lies in the
target coset of a discrete-logarithm certificate; ED.1 excludes the coset from the box. -/
theorem thueMahler_exponents_le_reducedBound {p n : ℕ} {γ : Fin (n + 1) → ℕ}
    (C : PadicDiscreteLogCertificate p n γ) (X : ℕ)
    (hexcl : ∀ b : Fin n → ℤ, (∀ i, (b i).natAbs ≤ X) →
      ¬ ((p : ℤ) ^ C.M) ∣ (C.ℓ 0 : ℤ) + ∑ i : Fin n, b i * C.ℓ i.succ)
    (u : Fin (n + 1) → (ZMod (p ^ C.t))ˣ) (hu : ∀ i, (u i : ZMod (p ^ C.t)) = γ i)
    (ζ : (ZMod (p ^ C.t))ˣ) (hζ : ζ ^ C.e = 1) (b : Fin n → ℤ) (hb : ∀ i, (b i).natAbs ≤ X) :
    ζ * u 0 * ∏ i : Fin n, u i.succ ^ b i ≠ 1 := sorry

/-- The sieve congruence (38): Siegel's identity modulo three degree-one primes above `q`. -/
theorem thueMahler_sieve_congr {q : ℕ} (x y m₁ m₂ m₃ A₁ A₂ A₃ P₁ P₂ P₃ : ZMod q)
    (h₁ : x - y * m₁ = A₁ * P₁) (h₂ : x - y * m₂ = A₂ * P₂) (h₃ : x - y * m₃ = A₃ * P₃) :
    (m₂ - m₃) * A₁ * P₁ + (m₃ - m₁) * A₂ * P₂ = (m₂ - m₁) * A₃ * P₃ := sorry

/-! ### ED.2/thue-mahler-certificate and ED.2/thue-mahler-certified-solution-set -/

open NumberField in
/-- The exponent vectors `(n, a) ∈ ℤ^{v + r}` of the normalised solutions in the case `cs`
of the covering (TdW (10)–(11)). -/
def thueMahlerExponentSet {E : ThueMahlerEquation} {K : Type*} [Field K] [NumberField K] {θ : K}
    (cov : ThueMahlerCovering E K θ) (cs : ThueMahlerCase K E.v) : Set (Fin (E.v + cov.r) → ℤ) :=
  {e | ∃ s ∈ thueMahlerSolutions E.g E.c E.p, ∃ a : Fin cov.r → ℤ, ∃ n : Fin E.v → ℕ,
    ∃ σ : K, (σ = 1 ∨ σ = -1) ∧
      ((E.g.leadingCoeff * s.1 : ℤ) : K) - (s.2.1 : K) * θ =
        σ * cs.α * (∏ i, (((cov.ε i : (𝓞 K)ˣ) : 𝓞 K) : K) ^ a i) * ∏ i, cs.π i ^ n i ∧
      (∀ i, s.2.2 i = n i * cs.h i + cs.s i + cs.t i) ∧
      e = Fin.append (fun i => (n i : ℤ)) a}

open NumberField in
/-- The data of a Thue–Mahler certificate: an S-unit covering (its conditions (U), (C) are
fields of `ThueMahlerCovering`), weights, the initial bound `K₀`, for every case an exponent
reduction chain and the residual box `(N_i)_i, A_fin`, and the claimed list. -/
structure ThueMahlerCertificate (E : ThueMahlerEquation) (K : Type*) [Field K] [NumberField K]
    (θ : K) where
  covering : ThueMahlerCovering E K θ
  w : Fin (E.v + covering.r) → ℕ
  K₀ : ℚ
  chain : ∀ j : Fin covering.cases.length,
    WeightedExponentReductionChain w (thueMahlerExponentSet covering (covering.cases.get j))
  residualBox : Fin covering.cases.length → (Fin E.v → ℕ) × ℕ
  solutions : Finset (ℤ × ℤ × (Fin E.v → ℕ))

namespace ThueMahlerCertificate

open NumberField

variable {E : ThueMahlerEquation} {K : Type*} [Field K] [NumberField K] {θ : K}

/-- The exact test of a tuple `(n, a)` of the case `j`: if `±α∏εᵢ^aᵢ∏πᵢ^nᵢ = f₀x − yθ` with
`(x, y, (nᵢhᵢ + s′ᵢ + t′ᵢ)ᵢ)` a normalised solution, that triple is listed. -/
def Tested (c : ThueMahlerCertificate E K θ) (j : Fin c.covering.cases.length)
    (n : Fin E.v → ℕ) (a : Fin c.covering.r → ℤ) : Prop :=
  ∀ σ ∈ ({1, -1} : Finset K), ∀ x y : ℤ,
    ((E.g.leadingCoeff * x : ℤ) : K) - (y : K) * θ = σ * (c.covering.cases.get j).α *
      (∏ i, (((c.covering.ε i : (𝓞 K)ˣ) : 𝓞 K) : K) ^ a i) *
        ∏ i, (c.covering.cases.get j).π i ^ n i →
    (x, y, fun i => n i * (c.covering.cases.get j).h i + (c.covering.cases.get j).s i +
      (c.covering.cases.get j).t i) ∈ thueMahlerSolutions E.g E.c E.p →
    (x, y, fun i => n i * (c.covering.cases.get j).h i + (c.covering.cases.get j).s i +
      (c.covering.cases.get j).t i) ∈ c.solutions

/-- Validity: the weights are positive; `K₀` bounds the weighted exponent height of every case
(ED.2/thue-mahler-initial-bounds) and starts every chain; every chain ends inside its residual
box; every tuple of every residual box and every exceptional tuple passes the exact test
(bounded quantifiers over `Finset.range` and `Finset.Icc`); listed triples are solutions. -/
structure Valid (c : ThueMahlerCertificate E K θ) : Prop where
  one_le_w : ∀ i, 1 ≤ c.w i
  initial_bound : ∀ j, ∀ e ∈ thueMahlerExponentSet c.covering (c.covering.cases.get j),
    weightedHeight c.w e ≤ c.K₀
  chain_start : ∀ j, c.K₀ ≤ (c.chain j).X 0
  final_n : ∀ j i, (c.chain j).final * c.w (Fin.castAdd c.covering.r i) ≤ (c.residualBox j).1 i
  final_a : ∀ j i, (c.chain j).final * c.w (Fin.natAdd E.v i) ≤ (c.residualBox j).2
  residual_tested : ∀ j, ∀ n : Fin E.v → ℕ, (∀ i, n i ∈ Finset.range ((c.residualBox j).1 i + 1)) →
    ∀ a : Fin c.covering.r → ℤ,
      (∀ i, a i ∈ Finset.Icc (-((c.residualBox j).2 : ℤ)) (c.residualBox j).2) → c.Tested j n a
  exceptional_tested : ∀ j k, ∀ e ∈ (c.chain j).E k,
    c.Tested j (fun i => (e (Fin.castAdd c.covering.r i)).toNat) (fun i => e (Fin.natAdd E.v i))
  solutions_pass : ∀ s ∈ c.solutions, s ∈ thueMahlerSolutions E.g E.c E.p

theorem solutions_subset (c : ThueMahlerCertificate E K θ) (hc : c.Valid) :
    (c.solutions : Set (ℤ × ℤ × (Fin E.v → ℕ))) ⊆ thueMahlerSolutions E.g E.c E.p := sorry

/-- ED.2/thue-mahler-certified-solution-set. -/
theorem solutions_eq (c : ThueMahlerCertificate E K θ) (hc : c.Valid)
    (hθ : aeval θ (integralNormalization E.g) = 0) (hK : Module.finrank ℚ K = E.g.natDegree) :
    thueMahlerSolutions E.g E.c E.p = c.solutions := sorry

end ThueMahlerCertificate

-- tmCert_contains_known_solution (supporting conditional soundness): a valid certificate for x³ − 2y³ = 5^z lists (3, 1, 2).
example (E : ThueMahlerEquation) (hE : E.g = X ^ 3 - C 2) (hc : E.c = 1) (hv : E.v = 1)
    (hp : ∀ i, E.p i = 5) (K : Type*) [Field K] [NumberField K] (θ : K)
    (hθ : aeval θ (integralNormalization E.g) = 0) (hK : Module.finrank ℚ K = E.g.natDegree)
    (c : ThueMahlerCertificate E K θ) (hval : c.Valid) :
    ∃ s ∈ c.solutions, s.1 = 3 ∧ s.2.1 = 1 ∧ ∀ i, s.2.2 i = 2 := sorry

-- tmCert_wrong_z: a certificate listing (3, 1, 1) for x³ − 2y³ = 5^z is invalid.
example (E : ThueMahlerEquation) (hE : E.g = X ^ 3 - C 2) (hc : E.c = 1)
    (hp : ∀ i, E.p i = 5) (K : Type*) [Field K] [NumberField K] (θ : K)
    (c : ThueMahlerCertificate E K θ) (z : Fin E.v → ℕ) (hz : ∀ i, z i = 1)
    (h : ((3 : ℤ), (1 : ℤ), z) ∈ c.solutions) : ¬ c.Valid := sorry

-- tmCert_unsieved_tuple: validity fails when a solution escapes the list.
example (E : ThueMahlerEquation) (K : Type*) [Field K] [NumberField K] (θ : K)
    (hθ : aeval θ (integralNormalization E.g) = 0) (hK : Module.finrank ℚ K = E.g.natDegree)
    (c : ThueMahlerCertificate E K θ) (s : ℤ × ℤ × (Fin E.v → ℕ))
    (hs : s ∈ thueMahlerSolutions E.g E.c E.p) (hnot : s ∉ c.solutions) : ¬ c.Valid := sorry

-- tmCert_no_primes: for v = 0 the certificate certifies coprime solutions of F = c.
example (E : ThueMahlerEquation) (hv : E.v = 0) (K : Type*) [Field K] [NumberField K] (θ : K)
    (c : ThueMahlerCertificate E K θ) (hval : c.Valid)
    (s : ℤ × ℤ × (Fin E.v → ℕ)) (hs : s ∈ c.solutions) : thueForm E.g s.1 s.2.1 = E.c := sorry

-- tmCert_compat: solutions_subset with solutions_eq gives equality of the coerced Finset.
example (E : ThueMahlerEquation) (K : Type*) [Field K] [NumberField K] (θ : K)
    (hθ : aeval θ (integralNormalization E.g) = 0) (hK : Module.finrank ℚ K = E.g.natDegree)
    (c : ThueMahlerCertificate E K θ) (hval : c.Valid) :
    (c.solutions : Set (ℤ × ℤ × (Fin E.v → ℕ))) = thueMahlerSolutions E.g E.c E.p := sorry

/-! ### ED.2/s-unit-equation -/

/-- Solutions of `x + y = 1` in rational `S`-units. -/
def sUnitSolutions (S : Finset ℕ) : Set (ℚ × ℚ) :=
  {p | p.1 ≠ 0 ∧ p.2 ≠ 0 ∧
    (∀ q : ℕ, q.Prime → q ∉ S → padicValRat q p.1 = 0 ∧ padicValRat q p.2 = 0) ∧
    p.1 + p.2 = 1}

theorem mem_sUnitSolutions (S : Finset ℕ) (x y : ℚ) : (x, y) ∈ sUnitSolutions S ↔
    x ≠ 0 ∧ y ≠ 0 ∧ (∀ q : ℕ, q.Prime → q ∉ S → padicValRat q x = 0 ∧ padicValRat q y = 0) ∧
      x + y = 1 := Iff.rfl

theorem sUnitSolutions_swap (S : Finset ℕ) (x y : ℚ) (h : (x, y) ∈ sUnitSolutions S) :
    (y, x) ∈ sUnitSolutions S ∧ (1 / x, -y / x) ∈ sUnitSolutions S := sorry

/-- The exponent height `max_p max(|v_p(x)|, |v_p(y)|)`. -/
def sUnitExponentHeight (S : Finset ℕ) (p : ℚ × ℚ) : ℕ :=
  S.sup fun q => max (padicValRat q p.1).natAbs (padicValRat q p.2).natAbs

theorem sUnitSolutions_finite (S : Finset ℕ) (hS : ∀ q ∈ S, q.Prime) :
    (sUnitSolutions S).Finite := sorry

-- sUnit_two_three: some solutions for S = {2, 3}.
example : ((3 : ℚ), (-2 : ℚ)) ∈ sUnitSolutions {2, 3} ∧
    ((1 / 2 : ℚ), (1 / 2 : ℚ)) ∈ sUnitSolutions {2, 3} ∧
    ((4 / 3 : ℚ), (-1 / 3 : ℚ)) ∈ sUnitSolutions {2, 3} := sorry

-- sUnit_empty: no solutions without primes.
example : sUnitSolutions ∅ = ∅ := sorry

-- sUnit_nonunit: 5 − 4 = 1 is not an S-unit solution for S = {2, 3}.
example : ((5 : ℚ), (-4 : ℚ)) ∉ sUnitSolutions {2, 3} := sorry

-- sUnit_compat_coprime: (9/8, −1/8) corresponds to (u, v, w) = (9, −1, 8).
example : ((9 / 8 : ℚ), (-1 / 8 : ℚ)) ∈ sUnitSolutions {2, 3} ∧ (9 / 8 : ℚ).num = 9 ∧
    (9 / 8 : ℚ).den = 8 ∧ (-1 / 8 : ℚ).num = -1 := sorry

/-! ### ED.2/s-unit-initial-bounds, s-unit-padic-reduction -/

/-- The initial bound from certified Yu constants (via DT.4/s-unit-equation-exponent-bound). -/
theorem sUnit_padicValRat_le_initialBound (S : Finset ℕ) (hS : ∀ q ∈ S, q.Prime)
    (hcard : 2 ≤ S.card) (C : ∀ p ∈ S, YuConstantCertificate S.card 1 p)
    (hC : ∀ p (hp : p ∈ S), ∃ α : Fin S.card → ℚ, (C p hp).Admissible (Rat.castHom ℂ) α ∧
      (-1 : ℚ) ∈ Set.range α ∧ ∀ q ∈ S.erase p, (q : ℚ) ∈ Set.range α) (X₀ : ℝ)
    (hX₀ : ∀ p (hp : p ∈ S), max 1 (2 * (11 / 10 * ((C p hp).Φ : ℝ) * Real.log p) / Real.log 2 *
      Real.log (2 * (11 / 10 * ((C p hp).Φ : ℝ) * Real.log p) / Real.log 2)) ≤ X₀)
    (x y : ℚ) (h : (x, y) ∈ sUnitSolutions S) (p : ℕ) :
    ((padicValRat p x).natAbs : ℝ) ≤ X₀ ∧ ((padicValRat p y).natAbs : ℝ) ≤ X₀ := sorry

/-- The p-adic reduction step: large `v_p(w)` forces the exponent vector into the lattice. -/
theorem sUnit_padicValRat_le_of_lattice {p n : ℕ} [Fact p.Prime] {γ : Fin (n + 1) → ℕ}
    (C : PadicDiscreteLogCertificate p n γ) (he : Even C.e) (hγ0 : γ 0 = 1) (u v w : ℤ)
    (huvw : u + v = w) (hv : ¬ (p : ℤ) ∣ v) (b : Fin n → ℤ) (s : ℚ) (hs : s = 1 ∨ s = -1)
    (hb : -(u : ℚ) / v = s * ∏ i : Fin n, ((γ i.succ : ℚ)) ^ b i)
    (hw : (C.t : ℤ) ≤ padicValRat p w) :
    ((p : ℤ) ^ C.M) ∣ ∑ i : Fin n, b i * C.ℓ i.succ := sorry

/-! ### ED.2/s-unit-certificate and ED.2/s-unit-certified-solution-set -/

/-- The primes of `S` in increasing order, indexed by `Fin S.card`. -/
def sUnitPrime (S : Finset ℕ) (i : Fin S.card) : ℕ := S.orderEmbOfFin rfl i

/-- The exponent vectors `(max(|v_p(x)|, |v_p(y)|))_{p ∈ S}` of the solutions, the set `𝒮` of
the exponent reduction chain of an S-unit certificate. -/
def sUnitExponentSet (S : Finset ℕ) : Set (Fin S.card → ℤ) :=
  {a | ∃ p ∈ sUnitSolutions S, ∀ i, a i =
    (max (padicValRat (sUnitPrime S i) p.1).natAbs (padicValRat (sUnitPrime S i) p.2).natAbs : ℕ)}

/-- The data of an S-unit certificate: Yu certificates (when `|S| ≥ 2`), the initial bound
`X₀`, weights and an exponent reduction chain for `sUnitExponentSet S`, the final per-prime
bounds, the exceptional solutions found by enumeration and the claimed list. -/
structure SUnitCertificate (S : Finset ℕ) where
  yu : 2 ≤ S.card → ∀ p ∈ S, YuConstantCertificate S.card 1 p
  X₀ : ℚ
  w : Fin S.card → ℕ
  chain : ExponentReductionChain (sUnitExponentSet S)
  finalBound : ℕ → ℕ
  exceptional : Finset (ℚ × ℚ)
  solutions : Finset (ℚ × ℚ)

namespace SUnitCertificate

variable {S : Finset ℕ}

/-- Validity: the Yu certificates are admissible for `(−1, (q)_{q ∈ S ∖ {p}})` and `X₀`
dominates the bound of ED.2/s-unit-initial-bounds (or `1` when `|S| ≤ 1`), the chain starts at
`X₀` and ends below the final bounds, every element `x = ±∏ pᵢ^eᵢ` of the final box (and of the
boxes of the exceptional vectors) with `(x, 1 − x)` a solution is listed, and the listed pairs
pass the exact test. All quantifiers over boxes are bounded. -/
structure Valid (c : SUnitCertificate S) : Prop where
  yu_admissible : ∀ (h : 2 ≤ S.card) (p : ℕ) (hp : p ∈ S), ∃ α : Fin S.card → ℚ,
    (c.yu h p hp).Admissible (Rat.castHom ℂ) α ∧
      (-1 : ℚ) ∈ Set.range α ∧ ∀ q ∈ S.erase p, (q : ℚ) ∈ Set.range α
  X₀_ge_yu : ∀ (h : 2 ≤ S.card) (p : ℕ) (hp : p ∈ S),
    max 1 (2 * (11 / 10 * ((c.yu h p hp).Φ : ℝ) * Real.log p) / Real.log 2 *
      Real.log (2 * (11 / 10 * ((c.yu h p hp).Φ : ℝ) * Real.log p) / Real.log 2)) ≤ c.X₀
  one_le_X₀ : 1 ≤ c.X₀
  one_le_w : ∀ i, 1 ≤ c.w i
  chain_start : ∀ i, c.X₀ ≤ c.chain.X 0 i
  finalBound_ge : ∀ i, c.chain.final i ≤ c.finalBound (sUnitPrime S i)
  solutions_pass : ∀ p ∈ c.solutions, p ∈ sUnitSolutions S
  box_subset : ∀ e : Fin S.card → ℤ, (∀ i, e i ∈ Finset.Icc (-(c.finalBound (sUnitPrime S i) : ℤ))
      (c.finalBound (sUnitPrime S i))) → ∀ s ∈ ({1, -1} : Finset ℚ),
    (s * ∏ i, (sUnitPrime S i : ℚ) ^ e i, 1 - s * ∏ i, (sUnitPrime S i : ℚ) ^ e i) ∈
      sUnitSolutions S →
    (s * ∏ i, (sUnitPrime S i : ℚ) ^ e i, 1 - s * ∏ i, (sUnitPrime S i : ℚ) ^ e i) ∈ c.solutions
  exceptional_complete : ∀ j, ∀ a ∈ c.chain.E j, ∀ e : Fin S.card → ℤ,
    (∀ i, e i ∈ Finset.Icc (-a i) (a i)) → ∀ s ∈ ({1, -1} : Finset ℚ),
    (s * ∏ i, (sUnitPrime S i : ℚ) ^ e i, 1 - s * ∏ i, (sUnitPrime S i : ℚ) ^ e i) ∈
      sUnitSolutions S →
    (s * ∏ i, (sUnitPrime S i : ℚ) ^ e i, 1 - s * ∏ i, (sUnitPrime S i : ℚ) ^ e i) ∈
      c.exceptional
  exceptional_subset : ∀ p ∈ c.exceptional, p ∈ sUnitSolutions S → p ∈ c.solutions

theorem solutions_subset (c : SUnitCertificate S) (hc : c.Valid) :
    (c.solutions : Set (ℚ × ℚ)) ⊆ sUnitSolutions S := sorry

/-- ED.2/s-unit-certified-solution-set: the initial bound (Yu), the chain and the exhaustive
enumeration of the final and exceptional boxes give every solution. -/
theorem solutions_eq (c : SUnitCertificate S) (hS : ∀ q ∈ S, q.Prime) (hc : c.Valid) :
    sUnitSolutions S = c.solutions := sorry

end SUnitCertificate

-- sUnitCert_two: for S = {2} (f(2) = 1) a valid certificate lists exactly
-- {(2, −1), (−1, 2), (1/2, 1/2)}.
example : ∃ c : SUnitCertificate {2}, c.Valid ∧ c.finalBound 2 = 1 ∧
    c.solutions = {((2 : ℚ), (-1 : ℚ)), ((-1 : ℚ), (2 : ℚ)), ((1 / 2 : ℚ), (1 / 2 : ℚ))} :=
  sorry

-- sUnitCert_empty: for S = ∅ a valid certificate lists nothing.
example (c : SUnitCertificate ∅) (hc : c.Valid) : c.solutions = ∅ := sorry

-- sUnitCert_missing: f(3) = 1 cannot be a valid final bound for S = {2, 3} when the
-- exceptional list omits (9/8, −1/8).
example (c : SUnitCertificate {2, 3}) (hf : c.finalBound 3 = 1)
    (hex : ((9 / 8 : ℚ), (-1 / 8 : ℚ)) ∉ c.exceptional) : ¬ c.Valid := sorry

-- sUnitCert_compat: the certified set is finite, as DT.4 predicts.
example (S : Finset ℕ) (hS : ∀ q ∈ S, q.Prime) (c : SUnitCertificate S) (hc : c.Valid) :
    sUnitSolutions S = c.solutions ∧ (sUnitSolutions S).Finite := sorry

end TauCeti.EffectiveDiophantine

end PartED2

/-! ## ED.3 -/

section PartED3

/-
ED.3 — Descent, rank bounds and saturation (EffectiveDiophantineMethods).

This file is not the roadmap and is not exhaustive. The roadmap document is definitive. These
statements suggest Lean forms so that contributors and reviewers converge on names and signatures.
Every proof and every data body is `sorry`; nothing here is an implementation.

The shared build has full Mathlib but not Tau Ceti's elliptic-curve modules, so the Tau Ceti
objects are taken as abstract inputs pinned by their defining properties:
* the x − T descent map `WeierstrassCurve.Affine.μ : Multiplicative W.Point →* W.M` appears as
  `μ : Multiplicative A →* M` with `A` the points and `M` the square classes;
* the canonical height `WeierstrassCurve.Affine.Point.canonicalHeight` appears as a function `ĥ`
  with the hypothesis `hĥ` that it is the limit of `naiveHeight (2ⁿ • P) / (2 * 4ⁿ)`, where
  `naiveHeight P = Height.logHeight P.xRep` exactly as in Tau Ceti (normalisation of (O)); the
  Néron–Tate pairing is `(ĥ (P + Q) - ĥ P - ĥ Q) / 2`, so `⟨P, P⟩ = ĥ P`;
* Jacobians of curves of genus ≥ 2 appear as finitely generated abelian groups `J`.
-/


open scoped Classical
open Filter Topology Polynomial

namespace TauCeti.EffectiveDiophantine.ED3

/-! ### ED.3/local-quotient-cardinality -/

/-- `[E(ℚ_p) : 2E(ℚ_p)] = |2|_p⁻¹ · #E(ℚ_p)[2]`. -/
theorem index_two_nsmul_padic (p : ℕ) [Fact p.Prime] (W : WeierstrassCurve ℚ_[p]) [W.IsElliptic] :
    (nsmulAddMonoidHom (α := W.toAffine.Point) 2).range.index =
      (if p = 2 then 2 else 1) * Nat.card (nsmulAddMonoidHom (α := W.toAffine.Point) 2).ker := by
  sorry

/-- `2 · [E(ℝ) : 2E(ℝ)] = #E(ℝ)[2]`. -/
theorem two_mul_index_two_nsmul_real (W : WeierstrassCurve ℝ) [W.IsElliptic] :
    2 * (nsmulAddMonoidHom (α := W.toAffine.Point) 2).range.index =
      Nat.card (nsmulAddMonoidHom (α := W.toAffine.Point) 2).ker := by
  sorry

/-! ### ED.3/local-descent-image

Abstract local setup: `A = E(K_v)`, `M = (W⁄K_v).M`, `μ` the local x − T map. -/

section LocalImage

variable {A M : Type*} [AddCommGroup A] [CommGroup M]

/-- A certified local image: square-class coordinates `coord : M ≃* (ℤ/2)ⁿ` and finitely many
local points (in the source, points with rational abscissa certified by valuations). -/
structure CertifiedLocalImage (μ : Multiplicative A →* M) (n : ℕ) where
  /-- The certified isomorphism of square classes with `(ℤ/2)ⁿ`. -/
  coord : M ≃* Multiplicative (Fin n → ZMod 2)
  /-- Number of certified points. -/
  k : ℕ
  /-- The certified local points. -/
  points : Fin k → A

namespace CertifiedLocalImage

variable {μ : Multiplicative A →* M} {n : ℕ}

/-- The subgroup `H_v` generated by the images of the certified points. -/
def span (C : CertifiedLocalImage μ n) : Subgroup M := sorry

theorem span_le_range (C : CertifiedLocalImage μ n) : C.span ≤ μ.range := by
  sorry

/-- ED.3/local-image-completeness: the size check completes the local image. -/
theorem span_eq_range_of_card [Finite M] (C : CertifiedLocalImage μ n)
    (hker : μ.ker = (nsmulAddMonoidHom (α := A) 2).range.toSubgroup)
    (hcard : Nat.card C.span = (nsmulAddMonoidHom (α := A) 2).range.index) :
    C.span = μ.range := by
  sorry

theorem card_span (C : CertifiedLocalImage μ n) :
    Nat.card C.span = 2 ^ Module.finrank (ZMod 2) (Submodule.span (ZMod 2)
      (Set.range fun i ↦ Multiplicative.toAdd (C.coord (μ (Multiplicative.ofAdd (C.points i)))))) := by
  sorry

/-- Compatibility with Tau Ceti's `localCondition = (range μ_v).comap localRes`. -/
theorem localCondition_eq_comap {M₀ : Type*} [CommGroup M₀] (res : M₀ →* M)
    (C : CertifiedLocalImage μ n) (hC : C.span = μ.range) :
    μ.range.comap res = C.span.comap res := by
  sorry

end CertifiedLocalImage

-- certifiedLocalImage_real_three_roots: for y² = x³ − x at ∞ with abscissae −1/2 and 2 the span
-- has 2 elements and equals the real local image.
example (μ : Multiplicative A →* M) [Finite M] (C : CertifiedLocalImage μ 3)
    (hker : μ.ker = (nsmulAddMonoidHom (α := A) 2).range.toSubgroup)
    (hidx : (nsmulAddMonoidHom (α := A) 2).range.index = 2) (hC : Nat.card C.span = 2) :
    C.span = μ.range := by
  sorry

-- certifiedLocalImage_empty: with no points the span is trivial.
example (μ : Multiplicative A →* M) (n : ℕ) (e : M ≃* Multiplicative (Fin n → ZMod 2)) :
    (CertifiedLocalImage.mk (μ := μ) e 0 Fin.elim0).span = ⊥ := by
  sorry

-- certifiedLocalImage_odd_good_prime: at an odd good prime a complete span has order #E(ℚ_p)[2].
example (μ : Multiplicative A →* M) [Finite M] (C : CertifiedLocalImage μ 6)
    (hker : μ.ker = (nsmulAddMonoidHom (α := A) 2).range.toSubgroup)
    (hidx : (nsmulAddMonoidHom (α := A) 2).range.index = 4) (hC : C.span = μ.range) :
    Nat.card C.span = 4 := by
  sorry

-- certifiedLocalImage_incomplete: one point spans at most 2 elements, fewer than the 8 required
-- at p = 2 for y² = x³ − x, so such a certificate is not complete.
example (μ : Multiplicative A →* M) [Finite M] (C : CertifiedLocalImage μ 9) (hk : C.k = 1)
    (hidx : (nsmulAddMonoidHom (α := A) 2).range.index = 8)
    (hker : μ.ker = (nsmulAddMonoidHom (α := A) 2).range.toSubgroup) :
    C.span ≠ μ.range := by
  sorry

/-! ### ED.3/good-place-local-image -/

/-- At an odd good prime the local image is the subgroup `U` of unramified classes with square
norm (Tau Ceti `selmerGroupA` over `ℤ_p` meet `ker normM`). -/
theorem localCondition_eq_unramified_of_good (μ : Multiplicative A →* M)
    (hker : μ.ker = (nsmulAddMonoidHom (α := A) 2).range.toSubgroup)
    (U : Subgroup M) [Finite U] (hle : μ.range ≤ U)
    (hcard : Nat.card U = Nat.card (nsmulAddMonoidHom (α := A) 2).ker)
    (hidx : (nsmulAddMonoidHom (α := A) 2).range.index =
      Nat.card (nsmulAddMonoidHom (α := A) 2).ker) :
    μ.range = U := by
  sorry

/-! Genuine elliptic carrier adapter. The coordinate isomorphism is a finite-local-factor
supplier input, not a substitute for μ. Its construction from valuations/residue units is
the exact omitted factory recorded in the packet. -/
section EllipticLocalImage
variable (p : ℕ) [Fact p.Prime] (W : WeierstrassCurve.Affine ℚ_[p])
    [DecidableEq ℚ_[p]] [W.IsElliptic] [W.IsCharNeTwoNF]
def ellipticLocalImage {n : ℕ}
    (coord : W.M ≃* Multiplicative (Fin n → ZMod 2))
    (points : List W.Point) : CertifiedLocalImage W.μ n := sorry
theorem ellipticLocalImage_span {n : ℕ}
    (coord : W.M ≃* Multiplicative (Fin n → ZMod 2)) (points : List W.Point) :
    (ellipticLocalImage p W coord points).span =
      Subgroup.closure (W.μ '' (Multiplicative.ofAdd '' (points.toFinset : Set W.Point))) := sorry
end EllipticLocalImage

end LocalImage

/-! ### ED.3/two-selmer-certificate

Global setup: `A = E(ℚ)`, `M = W.M`, `μ`, the norm `N = normM`, the places `ι` of `ℚ` (all
primes and `∞`; the certificate's `places` is `S ∪ {∞}`) with local points `Av v`, local square
classes `Mv v`, local maps `μv v` and restrictions `res v = localRes`. -/

section Selmer

variable {A M Q : Type*} [AddCommGroup A] [CommGroup M] [CommGroup Q]
  {ι : Type*} {Av Mv : ι → Type*} [∀ v, AddCommGroup (Av v)] [∀ v, CommGroup (Mv v)]

/-- A certified 2-Selmer computation. -/
structure TwoSelmerCertificate (μ : Multiplicative A →* M) (N : M →* Q)
    (μv : ∀ v, Multiplicative (Av v) →* Mv v) (res : ∀ v, M →* Mv v) where
  /-- The places of `S ∪ {∞}` carrying local data. -/
  places : Finset ι
  /-- `A(S,2)`, the classes unramified outside `S`. -/
  AS : Subgroup M
  /-- `A(S,2)` consists of square classes: it has exponent 2 (as Tau Ceti's `W.M` does). -/
  sq_eq_one : ∀ m ∈ AS, m ^ 2 = 1
  /-- `range μ ≤ A(S,2)` (Tau Ceti `range_μ_le_selmerGroupA`). -/
  range_le_AS : μ.range ≤ AS
  /-- Length of the certified basis of `A(S,2) ∩ ker N`. -/
  t : ℕ
  /-- The certified basis (S-units and class-group lifts, CN.2). -/
  gens : Fin t → M
  closure_gens : Subgroup.closure (Set.range gens) = AS ⊓ N.ker
  /-- Coordinates of the local square classes. -/
  dim : ι → ℕ
  /-- The complete certified local images. -/
  loc : ∀ v, CertifiedLocalImage (μv v) (dim v)
  complete : ∀ v ∈ places, (loc v).span = (μv v).range

namespace TwoSelmerCertificate

variable {μ : Multiplicative A →* M} {N : M →* Q} {μv : ∀ v, Multiplicative (Av v) →* Mv v}
  {res : ∀ v, M →* Mv v}

/-- The certified Selmer group. -/
def selmer (C : TwoSelmerCertificate μ N μv res) : Subgroup M := sorry

/-- An explicit basis of the Selmer group. -/
def basis (C : TwoSelmerCertificate μ N μv res) : List M := sorry

theorem card_selmer (C : TwoSelmerCertificate μ N μv res) :
    Nat.card C.selmer = 2 ^ C.basis.length := by
  sorry

theorem mem_selmer_iff (C : TwoSelmerCertificate μ N μv res) (m : M) :
    m ∈ C.selmer ↔ m ∈ C.AS ∧ N m = 1 ∧ ∀ v ∈ C.places, res v m ∈ (C.loc v).span := by
  sorry

theorem range_μ_le (C : TwoSelmerCertificate μ N μv res) (hN : μ.range ≤ N.ker)
    (hloc : ∀ v ∈ C.places, ∀ P : A, res v (μ (Multiplicative.ofAdd P)) ∈ (μv v).range) :
    μ.range ≤ C.selmer := by
  sorry

/-- ED.3/two-selmer-certificate-sound: equality with the classical 2-Selmer group, given as the
subgroup `sel` cut out by the norm condition and the local conditions at all places (Tau Ceti
`selmerGroup₂`). `hgood` is good-place-local-image (outside `S ∪ {∞}` the local condition holds on
`A(S,2) ∩ ker N`); `hunram` is Tau Ceti `mem_selmerGroupA_of_forall_localRes`. -/
theorem selmer_eq_selmerGroup₂ (C : TwoSelmerCertificate μ N μv res)
    (hgood : ∀ v ∉ C.places, ∀ m ∈ C.AS ⊓ N.ker, res v m ∈ (μv v).range)
    (hunram : ∀ m, N m = 1 → (∀ v, res v m ∈ (μv v).range) → m ∈ C.AS) (sel : Subgroup M)
    (hsel : ∀ m, m ∈ sel ↔ N m = 1 ∧ ∀ v, res v m ∈ (μv v).range) :
    C.selmer = sel := by
  sorry

theorem selmer_mono (C D : TwoSelmerCertificate μ N μv res) (hAS : C.AS ≤ D.AS)
    (hpl : C.places ⊆ D.places) (hgood : ∀ m ∈ C.selmer, ∀ v ∈ D.places, res v m ∈ (D.loc v).span) :
    C.selmer ≤ D.selmer := by
  sorry

end TwoSelmerCertificate

-- twoSelmer_basis_length_two: abstract cardinality from a supplied two-element basis.
-- The actual twoSelmer_x3_minus_x factory test is omitted in the register below.
example (μ : Multiplicative A →* M) (N : M →* Q) (μv : ∀ v, Multiplicative (Av v) →* Mv v)
    (res : ∀ v, M →* Mv v) (C : TwoSelmerCertificate μ N μv res) (h : C.basis.length = 2) :
    Nat.card C.selmer = 4 := by
  sorry

-- twoSelmer_no_places: without local conditions the group is A(S,2) ∩ ker N (order 2⁴ for
-- y² = x³ − x), which contains the Selmer group.
example (μ : Multiplicative A →* M) (N : M →* Q) (μv : ∀ v, Multiplicative (Av v) →* Mv v)
    (res : ∀ v, M →* Mv v) (C : TwoSelmerCertificate μ N μv res) :
    C.selmer ≤ C.AS ⊓ N.ker := by
  sorry

-- twoSelmer_eq_tauceti: the certified group is Tau Ceti's `selmerGroup₂ (𝓞 ℚ) (fun _ : Unit ↦ ℝ)`.
example (μ : Multiplicative A →* M) (N : M →* Q) (μv : ∀ v, Multiplicative (Av v) →* Mv v)
    (res : ∀ v, M →* Mv v) (C : TwoSelmerCertificate μ N μv res)
    (hgood : ∀ v ∉ C.places, ∀ m ∈ C.AS ⊓ N.ker, res v m ∈ (μv v).range)
    (hunram : ∀ m, N m = 1 → (∀ v, res v m ∈ (μv v).range) → m ∈ C.AS) (sel : Subgroup M)
    (hsel : ∀ m, m ∈ sel ↔ N m = 1 ∧ ∀ v, res v m ∈ (μv v).range) :
    C.selmer = sel :=
  TwoSelmerCertificate.selmer_eq_selmerGroup₂ C hgood hunram sel hsel

-- twoSelmer_not_image: the Selmer group need not be the image of μ (571a1: n₂ = 4, n₁ = 1).
example [Finite M] (μ : Multiplicative A →* M) (N : M →* Q)
    (μv : ∀ v, Multiplicative (Av v) →* Mv v) (res : ∀ v, M →* Mv v)
    (C : TwoSelmerCertificate μ N μv res) (h1 : Nat.card μ.range = 1) (h4 : C.basis.length = 2) :
    μ.range ≠ C.selmer := by
  sorry

/-! ### ED.3/rank-upper-bound -/

/-- `2 ^ rank E(ℚ) · #E(ℚ)[2] ≤ #Sel(C)`. -/
theorem rank_le_of_twoSelmerCertificate [AddGroup.FG A] (μ : Multiplicative A →* M) (N : M →* Q)
    (μv : ∀ v, Multiplicative (Av v) →* Mv v) (res : ∀ v, M →* Mv v)
    (hker : μ.ker = (nsmulAddMonoidHom (α := A) 2).range.toSubgroup)
    (C : TwoSelmerCertificate μ N μv res) (hle : μ.range ≤ C.selmer) :
    2 ^ Module.finrank ℤ A * Nat.card (nsmulAddMonoidHom (α := A) 2).ker ≤ 2 ^ C.basis.length := by
  sorry

end Selmer

/-! ### ED.3/quartic-local-solubility

Places of `ℚ` are `Option ℕ`: `none` is `∞`, `some p` the prime `p`. -/

section Quartic

/-- A rational place is infinity or a prime, never a composite or 0/1. -/
def IsRationalPlace (v : Option ℕ) : Prop := v = none ∨ ∃ p, v = some p ∧ p.Prime

/-- The recursive `ℤ_p` test (Birch–Swinnerton-Dyer Lemmas 6 and 7) with explicit fuel. -/
def zpSoluble (g : ℤ[X]) (p : ℕ) (xk : ℤ) (k fuel : ℕ) : Bool := sorry

/-- The certified local solubility test for `y² = g(x)`. -/
def quarticLocallySoluble (g : ℤ[X]) (v : Option ℕ) : Bool := sorry

/-- The reversed quartic `x⁴ g(1/x)`. -/
def reverseQuartic (g : ℤ[X]) : ℤ[X] :=
  ∑ i ∈ Finset.range 5, C (g.coeff (4 - i)) * X ^ i

/-- ED.3/quartic-local-solubility-correct. -/
theorem quarticLocallySoluble_iff (g : ℤ[X]) (hg : g.natDegree = 4) (hd : g.discr ≠ 0) :
    (quarticLocallySoluble g none = true ↔
      (∃ x y : ℝ, y ^ 2 = g.eval₂ (Int.castRingHom ℝ) x) ∨ 0 < g.leadingCoeff) ∧
    ∀ (p : ℕ) [Fact p.Prime], quarticLocallySoluble g (some p) = true ↔
      (∃ x y : ℚ_[p], y ^ 2 = g.eval₂ (Int.castRingHom ℚ_[p]) x) ∨
        IsSquare ((g.leadingCoeff : ℤ) : ℚ_[p]) := by
  sorry

theorem quarticLocallySoluble_reverse (g : ℤ[X]) (hg : g.natDegree = 4)
    (hd : g.discr ≠ 0) (hzero : g.coeff 0 ≠ 0) (v : Option ℕ) (hv : IsRationalPlace v) :
    quarticLocallySoluble (reverseQuartic g) v = quarticLocallySoluble g v := by
  sorry

theorem quarticLocallySoluble_scale (g : ℤ[X]) (hg : g.natDegree = 4) (hd : g.discr ≠ 0)
    (u : ℤ) (hu : u ≠ 0) (v : Option ℕ) (hv : IsRationalPlace v) :
    quarticLocallySoluble (C (u ^ 2) * g) v = quarticLocallySoluble g v := by
  sorry

theorem zpSoluble_fuel (g : ℤ[X]) (hg : g.natDegree = 4) (hd : g.discr ≠ 0)
    (p : ℕ) [Fact p.Prime] (xk : ℤ) (k fuel : ℕ)
    (hfuel : padicValInt p g.discr + 2 ≤ fuel) :
    zpSoluble g p xk k fuel = zpSoluble g p xk k (fuel + 1) := by
  sorry

theorem quarticLocallySoluble_of_good (g : ℤ[X]) (hg : g.natDegree = 4) (p : ℕ) [Fact p.Prime]
    (hp : p ≠ 2) (hpd : ¬ (p : ℤ) ∣ g.discr) :
    quarticLocallySoluble g (some p) = true := by
  sorry

-- quartic_lind_reichardt_two: the Lind–Reichardt quartic is soluble at 2 and at 17.
example : quarticLocallySoluble (C 2 * X ^ 4 - C 34) (some 2) = true ∧
    quarticLocallySoluble (C 2 * X ^ 4 - C 34) (some 17) = true := by
  sorry

-- quartic_negative_definite: the complete real/good-odd-prime regression.
example : quarticLocallySoluble (-(X ^ 4) - 1) none = false ∧
    ∀ (p : ℕ) [Fact p.Prime], p ≠ 2 → ¬ (p : ℤ) ∣ (-(X ^ 4) - 1 : ℤ[X]).discr →
      quarticLocallySoluble (-(X ^ 4) - 1) (some p) = true := by
  sorry

-- quartic_square_leading: a nonzero square leading coefficient gives solubility everywhere.
example (g : ℤ[X]) (hg : g.natDegree = 4) (a : ℤ) (ha : a ≠ 0) (hlead : g.leadingCoeff = a ^ 2)
    (v : Option ℕ) (hv : IsRationalPlace v) : quarticLocallySoluble g v = true := by
  sorry

-- quartic_not_mod_p_only: y² ≡ 3x⁴ + 3 (mod 3) is soluble but there is no ℚ₃-point.
example : quarticLocallySoluble (C 3 * X ^ 4 + C 3) (some 3) = false := by
  sorry

-- quartic_reverse_zero_constant: reversal preserves the five coefficient positions.
example : reverseQuartic (X ^ 4 + X : ℤ[X]) = X ^ 3 + 1 ∧
    reverseQuartic (X ^ 3 + 1 : ℤ[X]) = X ^ 4 + X := by
  sorry

end Quartic

/-! ### ED.3/two-isogeny-descent-map -/

section TwoIsogeny

/-- `y² = x(x² + cx + d)`. -/
def twoIsogenyCurve (c d : ℤ) : WeierstrassCurve ℚ := ⟨0, c, 0, d, 0⟩

/-- The 2-isogeny `φ : E → E′`, `(x, y) ↦ (y²/x², y(x² − d)/x²)`. -/
def twoIsogeny (c d : ℤ) :
    (twoIsogenyCurve c d).toAffine.Point →+ (twoIsogenyCurve (-2 * c) (c ^ 2 - 4 * d)).toAffine.Point :=
  sorry

/-- The dual isogeny `φ′ : E′ → E`, `(x, y) ↦ (y²/(4x²), y(x² − d′)/(8x²))`. -/
def twoIsogenyDual (c d : ℤ) :
    (twoIsogenyCurve (-2 * c) (c ^ 2 - 4 * d)).toAffine.Point →+ (twoIsogenyCurve c d).toAffine.Point :=
  sorry

/-- The square classes `ℚˣ/ℚˣ²`, written additively. -/
abbrev RatSquareClasses : Type := Additive (ℚˣ ⧸ (powMonoidHom 2 : ℚˣ →* ℚˣ).range)

/-- The descent map `α : E(ℚ) → ℚˣ/ℚˣ²`: `O ↦ 1`, `(0,0) ↦ d`, `(x, y) ↦ x` for `x ≠ 0`. -/
def twoIsogenyDescentMap (c d : ℤ) : (twoIsogenyCurve c d).toAffine.Point →+ RatSquareClasses :=
  sorry

theorem twoIsogenyDescentMap_some (c d : ℤ) {x y : ℚ}
    (h : (twoIsogenyCurve c d).toAffine.Nonsingular x y) (hx : x ≠ 0) :
    twoIsogenyDescentMap c d (.some x y h) = Additive.ofMul (QuotientGroup.mk (Units.mk0 x hx)) := by
  sorry

theorem twoIsogenyDescentMap_zero_zero (c d : ℤ) (hd : (d : ℚ) ≠ 0)
    (h : (twoIsogenyCurve c d).toAffine.Nonsingular 0 0) :
    twoIsogenyDescentMap c d (.some 0 0 h) =
      Additive.ofMul (QuotientGroup.mk (Units.mk0 (d : ℚ) hd)) := by
  sorry

theorem ker_twoIsogenyDescentMap (c d : ℤ) (hd : d ≠ 0) (hd' : c ^ 2 - 4 * d ≠ 0) :
    (twoIsogenyDescentMap c d).ker = (twoIsogenyDual c d).range := by
  sorry

theorem twoIsogenyDescentMap_mem_selmer (c d : ℤ) (hd : d ≠ 0) (hd' : c ^ 2 - 4 * d ≠ 0)
    (P : (twoIsogenyCurve c d).toAffine.Point) :
    ∃ d₁ : ℤ, ∃ h₁ : (d₁ : ℚ) ≠ 0, Squarefree d₁ ∧ d₁ ∣ d ∧
      twoIsogenyDescentMap c d P = Additive.ofMul (QuotientGroup.mk (Units.mk0 (d₁ : ℚ) h₁)) ∧
      ∀ v, quarticLocallySoluble (C d₁ * X ^ 4 + C c * X ^ 2 + C (d / d₁)) v = true := by
  sorry

theorem twoIsogeny_comp (c d : ℤ) (hd : d ≠ 0) (hd' : c ^ 2 - 4 * d ≠ 0) :
    (twoIsogenyDual c d).comp (twoIsogeny c d) = nsmulAddMonoidHom 2 := by
  sorry

-- twoIsogeny_E24: for c = −1, d = 1 the φ′-Selmer group is {1} (n₂ = 1) and the φ-Selmer group is
-- {±1, ±3} (n₂′ = 4); since the rank is 0 the images have the same orders, n₁ = 1 and n₁′ = 4.
example : Nat.card (twoIsogenyDescentMap (-1) 1).range = 1 ∧
    Nat.card (twoIsogenyDescentMap 2 (-3)).range = 4 := by
  sorry

-- twoIsogeny_identity: α(O) = 1.
example (c d : ℤ) : twoIsogenyDescentMap c d 0 = 0 := by
  sorry

-- twoIsogeny_x_nonzero: α(x, y) is trivial iff x is a rational square.
example (c d : ℤ) {x y : ℚ} (h : (twoIsogenyCurve c d).toAffine.Nonsingular x y) (hx : x ≠ 0) :
    twoIsogenyDescentMap c d (.some x y h) = 0 ↔ IsSquare x := by
  sorry

-- twoIsogeny_not_x_coordinate_at_zero: for y² = x³ − 68x, α(0,0) is the class of −17, not 1.
example (h : (twoIsogenyCurve 0 (-68)).toAffine.Nonsingular 0 0) :
    twoIsogenyDescentMap 0 (-68) (.some 0 0 h) ≠ 0 := by
  sorry

/-! ### ED.3/two-isogeny-rank-bound -/

/-- `2 ^ (rank + 2) = n₁ · n₁′`. -/
theorem rank_eq_of_twoIsogeny (c d : ℤ) (hd : d ≠ 0) (hd' : c ^ 2 - 4 * d ≠ 0) :
    2 ^ (Module.finrank ℤ (twoIsogenyCurve c d).toAffine.Point + 2) =
      Nat.card (twoIsogenyDescentMap c d).range *
        Nat.card (twoIsogenyDescentMap (-2 * c) (c ^ 2 - 4 * d)).range := by
  sorry

end TwoIsogeny

/-- The saturation `{a | ∃ n ≥ 1, n • a ∈ G}` (API item of ED.3/p-saturated). -/
def saturation {A : Type*} [AddCommGroup A] (G : AddSubgroup A) : AddSubgroup A := sorry

/-! ### Heights (ED.3/explicit-height-difference-bound, canonical-height-enclosure,
regulator-lower-bound, height-lower-bound-by-search, index-bound) -/

section Heights

variable {K : Type*} [Field K] [NumberField K]

-- General-number-field Silverman μ and comparison: source verified; weighted interface omitted below.

/-- Accessible rational bound: half of Cremona III, Proposition 3.5.1, p.77.
The general-number-field Silverman statement is verified in the omission register; its weighted Lean interface remains omitted. -/
def cremonaMu (W : WeierstrassCurve ℚ) : ℝ :=
  ((Real.log |(W.Δ : ℝ)| + Real.log (max 1 |(W.j : ℝ)|)) / 6 +
    Real.log (max 1 |((W.b₂ : ℝ) / 12)|) + Real.log (if W.b₂ = 0 then 1 else 2)) / 2

theorem canonicalHeight_sub_half_naiveHeight_mem (W : WeierstrassCurve ℚ) [W.IsElliptic]
    (h₁ : IsIntegral ℤ W.a₁) (h₂ : IsIntegral ℤ W.a₂) (h₃ : IsIntegral ℤ W.a₃)
    (h₄ : IsIntegral ℤ W.a₄) (h₆ : IsIntegral ℤ W.a₆) (P : W.toAffine.Point) :
    -(NumberField.absLogHeight₁ W.j / 24 + cremonaMu W + 961 / 1000) ≤
      P.canonicalHeight - P.naiveHeight / 2 ∧
    P.canonicalHeight - P.naiveHeight / 2 ≤ cremonaMu W + 107 / 100 := sorry

variable (W : WeierstrassCurve ℚ) [W.IsElliptic]

/-- The certified enclosure `[ℓ, u] ∋ ĥ(P)` computed from `2ⁿ • P`. -/
def canonicalHeightEnclosure (P : W.toAffine.Point) (n : ℕ) : ℚ × ℚ := sorry

/-- The enclosure of `⟨P, Q⟩ = (ĥ(P + Q) − ĥ P − ĥ Q)/2` from three height enclosures. -/
def pairingEnclosure (P Q : W.toAffine.Point) (n : ℕ) : ℚ × ℚ := sorry

local notation "ĥ" => WeierstrassCurve.Affine.Point.canonicalHeight (W := W.toAffine)

theorem canonicalHeight_mem_canonicalHeightEnclosure (h₁ : IsIntegral ℤ W.a₁)
    (h₂ : IsIntegral ℤ W.a₂) (h₃ : IsIntegral ℤ W.a₃) (h₄ : IsIntegral ℤ W.a₄)
    (h₆ : IsIntegral ℤ W.a₆) (P : W.toAffine.Point) (n : ℕ) :
    ((canonicalHeightEnclosure W P n).1 : ℝ) ≤ ĥ P ∧ ĥ P ≤ (canonicalHeightEnclosure W P n).2 := by
  sorry

theorem canonicalHeightEnclosure_width_le (P : W.toAffine.Point) (n : ℕ) :
    ∃ B : ℚ, ∀ m ≥ n, (canonicalHeightEnclosure W P m).2 - (canonicalHeightEnclosure W P m).1 ≤
      B / 4 ^ m := by
  sorry

theorem neronTatePairing_mem_pairingEnclosure (h₁ : IsIntegral ℤ W.a₁)
    (h₂ : IsIntegral ℤ W.a₂) (h₃ : IsIntegral ℤ W.a₃) (h₄ : IsIntegral ℤ W.a₄)
    (h₆ : IsIntegral ℤ W.a₆) (P Q : W.toAffine.Point) (n : ℕ) :
    ((pairingEnclosure W P Q n).1 : ℝ) ≤ (ĥ (P + Q) - ĥ P - ĥ Q) / 2 ∧
      (ĥ (P + Q) - ĥ P - ĥ Q) / 2 ≤ (pairingEnclosure W P Q n).2 := by
  sorry

theorem canonicalHeightEnclosure_zero (n : ℕ) : canonicalHeightEnclosure W 0 n = (0, 0) := by
  sorry

theorem canonicalHeightEnclosure_neg (P : W.toAffine.Point) (n : ℕ) :
    canonicalHeightEnclosure W (-P) n = canonicalHeightEnclosure W P n := by
  sorry

/-- ED.3/regulator-lower-bound: a positive certified determinant proves independence modulo
torsion and bounds the Gram determinant from below. -/
theorem linearIndependent_of_det_enclosure_pos {r : ℕ} (P : Fin r → W.toAffine.Point)
    (I : Matrix (Fin r) (Fin r) (ℚ × ℚ))
    (hI : ∀ i j, ((I i j).1 : ℝ) ≤ (ĥ (P i + P j) - ĥ (P i) - ĥ (P j)) / 2 ∧
      (ĥ (P i + P j) - ĥ (P i) - ĥ (P j)) / 2 ≤ (I i j).2)
    (δ : ℚ) (hδ : 0 < δ)
    (hdet : ∀ G : Matrix (Fin r) (Fin r) ℝ, (∀ i j, ((I i j).1 : ℝ) ≤ G i j ∧ G i j ≤ (I i j).2) →
      (δ : ℝ) ≤ G.det) :
    LinearIndependent ℤ (fun i ↦ (Submodule.Quotient.mk (P i) :
        WeierstrassCurve.Affine.PointModTorsion W.toAffine)) ∧
      (δ : ℝ) ≤ (Matrix.of fun i j ↦ (ĥ (P i + P j) - ĥ (P i) - ĥ (P j)) / 2).det := by
  sorry

/-- ED.3/height-lower-bound-by-search. -/
theorem le_canonicalHeight_of_search (B c lam : ℝ) (L : Finset W.toAffine.Point)
    (hL : ∀ P : W.toAffine.Point, Height.logHeight P.xRep ≤ B → P ∈ L)
    (hc : ∀ P : W.toAffine.Point, Height.logHeight P.xRep / 2 - c ≤ ĥ P)
    (hB : lam ≤ B / 2 - c) (hfound : ∀ P ∈ L, ¬ IsOfFinAddOrder P → lam ≤ ĥ P) :
    ∀ Q : W.toAffine.Point, ¬ IsOfFinAddOrder Q → lam ≤ ĥ Q := by
  sorry

/-- The Hermite property of a constant `γ` in dimension `r`. -/
theorem minkowski_hermite_bound (r : ℕ) (hr : 0 < r) (G : Matrix (Fin r) (Fin r) ℝ)
    (hG : G.PosDef) :
    ∃ x : Fin r → ℤ, x ≠ 0 ∧
      dotProduct (fun i ↦ (x i : ℝ)) (G.mulVec fun i ↦ (x i : ℝ)) ≤
        (4 / Real.pi) * Real.Gamma (r / 2 + 1) ^ ((2 : ℝ) / r) * G.det ^ ((1 : ℝ) / r) := by
  sorry

/-- ED.3/index-bound: `[L̄ : L] ≤ R^{1/2} (γ/λ)^{r/2}`, with `L̄` the saturation of the span
of the `P i` modulo torsion and `γ` any constant with the Hermite property. -/
theorem saturationIndex_le {r : ℕ} (hr : 0 < r) (P : Fin r → W.toAffine.Point)
    (lam γ : ℝ) (hlam : 0 < lam)
    (hlow : ∀ Q : W.toAffine.Point, ¬ IsOfFinAddOrder Q → lam ≤ ĥ Q)
    (hγ : ∀ G : Matrix (Fin r) (Fin r) ℝ, G.PosDef → ∃ x : Fin r → ℤ, x ≠ 0 ∧
      dotProduct (fun i ↦ (x i : ℝ)) (G.mulVec fun i ↦ (x i : ℝ)) ≤ γ * G.det ^ ((1 : ℝ) / r))
    (hind : LinearIndependent ℤ (fun i ↦ (Submodule.Quotient.mk (P i) :
        WeierstrassCurve.Affine.PointModTorsion W.toAffine))) :
    let L : AddSubgroup W.toAffine.Point :=
      AddSubgroup.closure (Set.range P) ⊔ AddCommGroup.torsion W.toAffine.Point
    (L.relIndex (saturation L) : ℝ) ≤
      Real.sqrt ((Matrix.of fun i j ↦ (ĥ (P i + P j) - ĥ (P i) - ĥ (P j)) / 2).det) *
        (γ / lam) ^ ((r : ℝ) / 2) := by
  sorry

end Heights

/-- Enclosure tests on `y² = x³ + 1`. -/
def curveX3Plus1 : WeierstrassCurve ℚ := ⟨0, 0, 0, 0, 1⟩

section HeightTests

variable [curveX3Plus1.IsElliptic]
local notation "ĥ" => WeierstrassCurve.Affine.Point.canonicalHeight (W := curveX3Plus1.toAffine)

-- enclosure_torsion: for the point (−1, 0) of order 2 the enclosure is [0, 0] for n ≥ 1.
example (h : curveX3Plus1.toAffine.Nonsingular (-1) 0) (n : ℕ) (hn : 1 ≤ n) :
    canonicalHeightEnclosure curveX3Plus1 (.some (-1) 0 h) n = (0, 0) := by
  sorry

-- enclosure_origin: the enclosure of O is [0, 0].
example (n : ℕ) : canonicalHeightEnclosure curveX3Plus1 0 n = (0, 0) :=
  canonicalHeightEnclosure_zero curveX3Plus1 n

-- enclosure_contains_tauceti: the enclosure contains Tau Ceti's normalisation `ĥ`, the limit of
-- `naiveHeight (2ⁿ • P) / (2 · 4ⁿ)`.
example (P : curveX3Plus1.toAffine.Point) (n : ℕ) :
    ((canonicalHeightEnclosure curveX3Plus1 P n).1 : ℝ) ≤ ĥ P ∧
      ĥ P ≤ (canonicalHeightEnclosure curveX3Plus1 P n).2 :=
  canonicalHeight_mem_canonicalHeightEnclosure curveX3Plus1 isIntegral_zero isIntegral_zero
    isIntegral_zero isIntegral_zero isIntegral_one P n

-- enclosure_not_naive: (2, 3) is torsion, so ĥ = 0 while naiveHeight/2 = (log 2)/2 > 0; the
-- n = 0 enclosure contains 0.
example (h : curveX3Plus1.toAffine.Nonsingular 2 3) :
    ((canonicalHeightEnclosure curveX3Plus1 (.some 2 3 h) 0).1 : ℝ) ≤ 0 ∧
      (0 : ℝ) ≤ (canonicalHeightEnclosure curveX3Plus1 (.some 2 3 h) 0).2 ∧
      ĥ (.some 2 3 h) ≠ Height.logHeight (WeierstrassCurve.Affine.Point.some 2 3 h).xRep / 2 := by
  sorry

end HeightTests

/-! ### ED.3/p-saturated -/

section Saturation

variable {A : Type*} [AddCommGroup A]

/-- `G` is `p`-saturated in `A`: `p • a ∈ G → a ∈ G`. -/
def IsPSaturated (G : AddSubgroup A) (p : ℕ) : Prop :=
  ∀ a : A, p • a ∈ G → a ∈ G

theorem isPSaturated_iff (G : AddSubgroup A) (p : ℕ) :
    IsPSaturated G p ↔
      (∀ a : A, p • a = 0 → a ∈ G) ∧ ∀ a : A, p • a ∈ G → ∃ g ∈ G, p • g = p • a := by
  sorry

theorem isPSaturated_iff_not_dvd_index (G : AddSubgroup A) [G.FiniteIndex] (p : ℕ)
    (hp : p.Prime) : IsPSaturated G p ↔ ¬ p ∣ G.index := by
  sorry

@[simp] theorem isPSaturated_top (p : ℕ) : IsPSaturated (⊤ : AddSubgroup A) p := by
  sorry

theorem IsPSaturated.inf {G H : AddSubgroup A} {p : ℕ} (hG : IsPSaturated G p)
    (hH : IsPSaturated H p) : IsPSaturated (G ⊓ H) p := by
  sorry

theorem index_eq_one_of_forall_isPSaturated (G : AddSubgroup A) [G.FiniteIndex] (N : ℕ)
    (hN : G.index ≤ N) (h : ∀ p : ℕ, p.Prime → p ≤ N → IsPSaturated G p) : G = ⊤ := by
  sorry


-- isPSaturated_six_int: 6ℤ is 5-saturated but not 2- or 3-saturated.
example : IsPSaturated (AddSubgroup.zmultiples (6 : ℤ)) 5 ∧
    ¬ IsPSaturated (AddSubgroup.zmultiples (6 : ℤ)) 2 ∧
    ¬ IsPSaturated (AddSubgroup.zmultiples (6 : ℤ)) 3 := by
  sorry

-- isPSaturated_top_any: ⊤ is p-saturated for every p.
example (p : ℕ) : IsPSaturated (⊤ : AddSubgroup ℤ) p := isPSaturated_top p

-- isPSaturated_index_coprime: for 6ℤ ≤ ℤ, p-saturated ↔ p ∤ 6.
example (p : ℕ) (hp : p.Prime) : IsPSaturated (AddSubgroup.zmultiples (6 : ℤ)) p ↔ ¬ p ∣ 6 := by
  sorry

-- isPSaturated_torsion_missing: ℤ × 0 in ℤ × ℤ/2 has G ∩ 2A = 2G but misses A[2].
example : ¬ IsPSaturated (AddSubgroup.zmultiples ((1, 0) : ℤ × ZMod 2)) 2 := by
  sorry

/-! ### ED.3/saturation-certificate -/

theorem isPSaturated_of_injective_reductions (G : AddSubgroup A) (p : ℕ) (hp : p.Prime)
    {ι : Type*} (C : ι → Type*) [∀ i, AddCommGroup (C i)] (hC : ∀ i (c : C i), p • c = 0)
    (ψ : ∀ i, A →+ C i)
    (hinj : ∀ g ∈ G, (∀ i, ψ i g = 0) → ∃ g' ∈ G, g = p • g')
    (htors : ∀ a : A, p • a = 0 → a ∈ G) :
    IsPSaturated G p := by
  sorry

/-! ### ED.3/reduction-rank-lower-bound -/

theorem le_finrank_of_reduction_image [AddGroup.FG A] (G : AddSubgroup A) (ℓ : ℕ) [Fact ℓ.Prime]
    {C : Type*} [AddCommGroup C] [Module (ZMod ℓ) C] (ψ : A →+ C) (k t : ℕ)
    (hk : k ≤ Module.finrank (ZMod ℓ) (Submodule.span (ZMod ℓ) (ψ '' (G : Set A))))
    (ht : Nat.card (nsmulAddMonoidHom (α := A) ℓ).ker = ℓ ^ t) :
    k ≤ Module.finrank ℤ G + t := by
  sorry

/-! ### ED.3/torsion-by-reduction -/

theorem torsion_eq_of_reduction_bounds {ι : Type*} (q : ι → ℕ) (hq : ∀ i, (q i).Prime)
    (B : ι → Type*) [∀ i, AddCommGroup (B i)] [∀ i, Finite (B i)] (ρ : ∀ i, A →+ B i)
    (hρ : ∀ i (a : A), IsOfFinAddOrder a → Nat.Coprime (addOrderOf a) (q i) → ρ i a = 0 → a = 0)
    (T₀ : AddSubgroup A) [Finite T₀] (hT₀ : T₀ ≤ AddCommGroup.torsion A)
    (hbound : ∀ ℓ : ℕ, ℓ.Prime → ∃ i, q i ≠ ℓ ∧
      (Nat.card (B i)).factorization ℓ ≤ (Nat.card T₀).factorization ℓ) :
    T₀ = AddCommGroup.torsion A := by
  sorry

/-! Bounded-height coordinate enumeration, including every torsion fibre.
RP.1 owns the Jacobian free quotient and Néron–Tate form; ED consumes its coordinates. -/
section HeightCoordinates
variable {A T : Type*} [AddCommGroup A] [AddCommGroup T] [Fintype T] {r : ℕ}
def heightCoordinatePoints (e : A ≃+ (Fin r → ℤ) × T) (D : ℕ) : Finset A :=
  (Fintype.piFinset (fun _ : Fin r => Finset.Icc (-(D : ℤ)) D) ×ˢ Finset.univ).map
    e.symm.toEquiv.toEmbedding
theorem mem_heightCoordinatePoints (e : A ≃+ (Fin r → ℤ) × T) (D : ℕ) (P : A) :
    P ∈ heightCoordinatePoints e D ↔ ∀ i, |(e P).1 i| ≤ D := sorry
theorem heightCoordinatePoints_complete (e : A ≃+ (Fin r → ℤ) × T)
    (height : A → ℝ) (lam B : ℝ) (hlam : 0 < lam) (D : ℕ)
    (hform : ∀ P, lam * ∑ i, ((e P).1 i : ℝ) ^ 2 ≤ height P)
    (hD : B < lam * ((D : ℝ) + 1) ^ 2) (P : A) (hP : height P ≤ B) :
    P ∈ heightCoordinatePoints e D := sorry
-- heightCoordinates_rank_zero: all points are the finite torsion fibre.
example (e : A ≃+ (Fin 0 → ℤ) × T) (P : A) : P ∈ heightCoordinatePoints e 0 := sorry
-- heightCoordinates_torsion_fibres: both torsion representatives are included.
example : (heightCoordinatePoints (AddEquiv.refl ((Fin 1 → ℤ) × ZMod 2)) 0).card = 2 := sorry
-- heightCoordinates_kernel_nonexample: the zero form on ℤ has infinite bounded set.
example : ¬ Set.Finite {x : ℤ | (0 : ℝ) ≤ 1} := sorry
end HeightCoordinates

/-! ### ED.3/finite-index-subgroup-certificate -/

/-- A certified subgroup of finite index, prime to the primes of `primes`. -/
structure FiniteIndexSubgroupCertificate (A : Type*) [AddCommGroup A] (primes : Finset ℕ) where
  s : ℕ
  gens : Fin s → A
  r : ℕ
  /-- Algebraic rank upper bound (descent); a conditional bound is never a field. -/
  rank_le : Module.finrank ℤ A ≤ r
  le_rank : r ≤ Module.finrank ℤ (AddSubgroup.closure (Set.range gens))
  torsion : Finset A
  mem_torsion : ∀ a, a ∈ torsion ↔ IsOfFinAddOrder a
  saturated : ∀ p ∈ primes, IsPSaturated (AddSubgroup.closure (Set.range gens)) p

namespace FiniteIndexSubgroupCertificate

variable {primes : Finset ℕ}

def subgroup (C : FiniteIndexSubgroupCertificate A primes) : AddSubgroup A :=
  AddSubgroup.closure (Set.range C.gens)

theorem finrank_eq [AddGroup.FG A] (C : FiniteIndexSubgroupCertificate A primes) :
    Module.finrank ℤ A = C.r := by
  sorry

theorem finiteIndex [AddGroup.FG A] (C : FiniteIndexSubgroupCertificate A primes) :
    C.subgroup.FiniteIndex := by
  sorry

theorem coprime_index [AddGroup.FG A] (C : FiniteIndexSubgroupCertificate A primes) (p : ℕ)
    (hp : p ∈ primes) (hpp : p.Prime) : Nat.Coprime C.subgroup.index p := by
  sorry

theorem torsion_eq (C : FiniteIndexSubgroupCertificate A primes) :
    (C.torsion : Set A) = AddCommGroup.torsion A := by
  sorry

theorem coprime_index_prod [AddGroup.FG A] (C : FiniteIndexSubgroupCertificate A primes) (N : ℕ)
    (hN : ∀ p : ℕ, p.Prime → p ∣ N → p ∈ primes) : Nat.Coprime C.subgroup.index N := by
  sorry

/-- A Mordell–Weil basis gives a certificate for every set of primes. -/
def ofMordellWeilBasis [AddGroup.FG A] (s : ℕ) (gens : Fin s → A)
    (htop : AddSubgroup.closure (Set.range gens) = ⊤) (primes : Finset ℕ) :
    FiniteIndexSubgroupCertificate A primes :=
  sorry

end FiniteIndexSubgroupCertificate

-- finiteIndexCert_fps: one generator, r = 1, primes = {3} gives 3 ∤ [J(ℚ) : G].
example [AddGroup.FG A] (C : FiniteIndexSubgroupCertificate A {3}) (hs : C.s = 1)
    (hr : C.r = 1) : Module.finrank ℤ A = 1 ∧ Nat.Coprime C.subgroup.index 3 := by
  sorry

-- finiteIndexCert_rank_zero: if r = 0 and the generators are the torsion, G = A.
example [AddGroup.FG A] (primes : Finset ℕ) (C : FiniteIndexSubgroupCertificate A primes)
    (hr : C.r = 0) (hgen : ∀ a, IsOfFinAddOrder a → a ∈ C.subgroup) : C.subgroup = ⊤ := by
  sorry

-- finiteIndexCert_index_one: saturation at every prime ≤ N with index ≤ N gives G = A.
example [AddGroup.FG A] (primes : Finset ℕ) (C : FiniteIndexSubgroupCertificate A primes)
    (N : ℕ) (hN : C.subgroup.index ≤ N) (hprimes : ∀ p : ℕ, p.Prime → p ≤ N → p ∈ primes) :
    C.subgroup = ⊤ := by
  sorry

-- finiteIndexCert_independent_points_only: independent points without a rank upper bound give no
-- certificate: in ℤ², the independent point (1, 0) generates a rank-1 subgroup of infinite index, and
-- no certificate has it as its subgroup.
example (C : FiniteIndexSubgroupCertificate (ℤ × ℤ) ∅) :
    C.subgroup ≠ AddSubgroup.closure (Set.range ![((1 : ℤ), (0 : ℤ))]) := by
  sorry

/-! ### ED.3/mordell-weil-basis-certificate -/

theorem eq_top_of_mordellWeilBasisCertificate [AddGroup.FG A] (G : AddSubgroup A)
    (htors : AddCommGroup.torsion A ≤ G) (r : ℕ) (hup : Module.finrank ℤ A ≤ r)
    (hlow : r ≤ Module.finrank ℤ G) (N : ℕ) (hN : ∀ _ : G.FiniteIndex, G.index ≤ N)
    (hsat : ∀ p : ℕ, p.Prime → p ≤ N → IsPSaturated G p) : G = ⊤ := by
  sorry

/-! ### ED.3/genus-two-descent-rank-bound

`J = J(ℚ)` (abstract), `M` the square classes `L^×/(L^{×2} ℚ^×)`, `xT` the x − T map. -/

theorem finrank_jacobian_le_of_xMinusT [AddGroup.FG A] {M : Type*} [CommGroup M]
    (xT : Multiplicative A →* M) (H' : Subgroup M) [Finite H'] (hrange : xT.range ≤ H')
    (δ : ℕ) (hδ : (nsmulAddMonoidHom (α := A) 2).range.toSubgroup.relIndex xT.ker = δ)
    (h2 : (nsmulAddMonoidHom (α := A) 2).range.toSubgroup ≤ xT.ker) :
    2 ^ Module.finrank ℤ A * Nat.card (nsmulAddMonoidHom (α := A) 2).ker ≤ Nat.card H' * δ := by
  sorry

end Saturation

/-! ### Applications -/

section Applications

/-- ED.3/lind-reichardt-torsor: `v² = 2u⁴ − 34` is everywhere locally soluble, has no rational
point, and the class of `2` lies outside `α(E(ℚ))` for `y² = x³ − 68x`. -/
theorem lindReichardt_selmer_not_image :
    (∀ v, quarticLocallySoluble (C 2 * X ^ 4 - C 34) v = true) ∧
      (¬ ∃ u w : ℚ, w ^ 2 = 2 * u ^ 4 - 34) ∧
      Additive.ofMul (QuotientGroup.mk (Units.mk0 (2 : ℚ) two_ne_zero) :
          ℚˣ ⧸ (powMonoidHom 2 : ℚˣ →* ℚˣ).range) ∉ (twoIsogenyDescentMap 0 (-68)).range := by
  sorry

/-- ED.3/fermigier-rank-thirteen: the certified upper bound. -/
theorem fermigier_rank_le_thirteen :
    Module.finrank ℤ (twoIsogenyCurve 36861504658225 1807580157674409809510400).toAffine.Point
      ≤ 13 := by
  sorry

/-- ED.3/rank-zero-curves: the affine rational points of E24 are `(0,0), (1,±1)`. -/
theorem rankZero_points_eq :
    ∀ x y : ℚ, (⟨0, -1, 0, 1, 0⟩ : WeierstrassCurve ℚ).toAffine.Equation x y ↔
      (x, y) ∈ ({(0, 0), (1, 1), (1, -1)} : Set (ℚ × ℚ)) := by
  sorry

/-- ED.3/rank-zero-curves for E40, E15, E17 and Morton's curve (affine points). -/
theorem rankZero_points_eq_E40 :
    ∀ x y : ℚ, (⟨0, 0, 0, -2, 1⟩ : WeierstrassCurve ℚ).toAffine.Equation x y ↔
      (x, y) ∈ ({(0, 1), (0, -1), (1, 0)} : Set (ℚ × ℚ)) := by
  sorry

theorem rankZero_points_eq_E15 :
    ∀ x y : ℚ, (⟨1, 1, 1, 0, 0⟩ : WeierstrassCurve ℚ).toAffine.Equation x y ↔
      (x, y) ∈ ({(0, 0), (-1, 0), (0, -1)} : Set (ℚ × ℚ)) := by
  sorry

theorem rankZero_points_eq_E17 :
    ∀ x y : ℚ, (⟨1, -1, 1, -1, 0⟩ : WeierstrassCurve ℚ).toAffine.Equation x y ↔
      (x, y) ∈ ({(0, 0), (1, -1), (0, -1)} : Set (ℚ × ℚ)) := by
  sorry

theorem rankZero_points_eq_morton :
    ∀ x y : ℚ, y ^ 2 = 4 * x ^ 3 - 11 * x ^ 2 + 8 * x ↔
      (x, y) ∈ ({(0, 0), (1, 1), (1, -1), (2, 2), (2, -2)} : Set (ℚ × ℚ)) := by
  sorry

/-- ED.3/fps-genus-two-mordell-weil, on the abstract group `J = J(ℚ)` of `C₀(5)` with
`D = [∞⁺ − ∞⁻]` and the reduction `ρ₃ : J(ℚ) → J(𝔽₃) ≅ ℤ/9`. -/
theorem fps_C05_certificate (J : Type*) [AddCommGroup J] [AddGroup.FG J] (D : J)
    (htors : ∀ a : J, IsOfFinAddOrder a → a = 0) (hD : D ≠ 0)
    (hrank : Module.finrank ℤ J ≤ 1) (ρ₃ : J →+ ZMod 9) (hρ : ρ₃ D = 1) :
    ∃ C : FiniteIndexSubgroupCertificate J {3}, C.subgroup = AddSubgroup.zmultiples D := by
  sorry

/-- ED.3/poonen-genus-two-mordell-weil: torsion-free, rank ≥ 1, and `D ∉ 3J(ℚ)`; the rank upper
bound is an explicit hypothesis (the corrected descent is a recorded gap). -/
theorem poonen_C32_partial_certificate (J : Type*) [AddCommGroup J] [AddGroup.FG J] (D : J)
    (htors : ∀ a : J, IsOfFinAddOrder a → a = 0) (hD : D ≠ 0) (ρ₃ : J →+ ZMod 27)
    (hρ : ρ₃ D = 1) :
    1 ≤ Module.finrank ℤ J ∧ IsPSaturated (AddSubgroup.zmultiples D) 3 ∧ (Module.finrank ℤ J ≤ 1 →
      ∃ C : FiniteIndexSubgroupCertificate J {3}, C.subgroup = AddSubgroup.zmultiples D) := by
  sorry

/-- ED.3/stoll-genus-four-subgroup: `G ≅ ℤ³` is certified; finite index needs the conditional
input `rank J(ℚ) ≤ 3`, which stays an explicit hypothesis. -/
theorem stoll_X0dyn6_subgroup (J : Type*) [AddCommGroup J] [AddGroup.FG J] (G : AddSubgroup J)
    (htors : ∀ a : J, IsOfFinAddOrder a → a = 0) (hG : Module.finrank ℤ G = 3) :
    Nonempty (G ≃+ (Fin 3 → ℤ)) ∧
      (Module.finrank ℤ J ≤ 3 → G.FiniteIndex ∧ saturation G = ⊤) := by
  sorry

end Applications

end TauCeti.EffectiveDiophantine.ED3

end PartED3

/-! ## ED.4 -/

section PartED4


attribute [local instance] Classical.propDecidable

namespace TauCeti.EffectiveDiophantine.ED4

instance fact_prime_five : Fact (Nat.Prime 5) := ⟨by norm_num⟩
instance fact_prime_seven : Fact (Nat.Prime 7) := ⟨by norm_num⟩

/-! ### ED.4/good-reduction-chabauty-datum -/

/-- A good-reduction Chabauty datum at `p`: the reduction map on ℚ_p-points of the curve,
local parameters on residue discs, the Abel–Jacobi map and the reduction of the Jacobian. -/
structure ReductionDiscData (p : ℕ) [Fact p.Prime] (X Xt J Jt : Type)
    [AddCommGroup J] [AddCommGroup Jt] where
  /-- reduction X(ℚ_p) = 𝒳(ℤ_p) → X̃(𝔽_p) -/
  red : X → Xt
  red_surj : Function.Surjective red
  fintypeXt : Fintype Xt
  /-- a local parameter `t_x̃` at each point of the special fibre -/
  param : Xt → X → ℚ_[p]
  param_bijOn : ∀ xt, Set.BijOn (param xt) {P | red P = xt} {t : ℚ_[p] | ‖t‖ < 1}
  /-- the Abel–Jacobi map `P ↦ [P − O]` on ℚ_p-points -/
  abelJacobi : X → J
  /-- reduction J(ℚ_p) = 𝒥(ℤ_p) → J̃(𝔽_p) -/
  redJ : J →+ Jt
  /-- the Abel–Jacobi map of the special fibre, based at `Õ` -/
  abelJacobiT : Xt → Jt
  redJ_abelJacobi : ∀ P, redJ (abelJacobi P) = abelJacobiT (red P)

namespace ReductionDiscData

variable {p : ℕ} [Fact p.Prime] {X Xt J Jt : Type} [AddCommGroup J] [AddCommGroup Jt]
variable (D : ReductionDiscData p X Xt J Jt)

theorem red_surjective : Function.Surjective D.red := sorry

/-- The residue disc `D(x̃) = red⁻¹(x̃)`. -/
def residueDisc (D : ReductionDiscData p X Xt J Jt) (xt : Xt) : Set X := sorry

theorem mem_residueDisc (xt : Xt) (P : X) : P ∈ D.residueDisc xt ↔ D.red P = xt := sorry

theorem localParam_bijOn (xt : Xt) :
    Set.BijOn (D.param xt) (D.residueDisc xt) {t : ℚ_[p] | ‖t‖ < 1} := sorry

theorem redJ_comp_abelJacobi (P Q : X) (h : D.red P = D.red Q) :
    D.redJ (D.abelJacobi P - D.abelJacobi Q) = 0 := sorry

/-- Supporting reduction data only. The geometric Coleman supplier adapter is omitted. -/
def baseResidueDisc (D : ReductionDiscData p X Xt J Jt) (O : X) : Xt × Set X :=
  sorry

end ReductionDiscData

section DatumTests
variable {p : ℕ} [Fact p.Prime] {X Xt J Jt : Type} [AddCommGroup J] [AddCommGroup Jt]

-- datum_C05_three: for C₀(5) at p = 3, X̃(𝔽_3) consists of the two points at infinity and the
-- affine points of y² = x⁶ + 8x⁵ + 22x⁴ + 22x³ + 5x² + 6x + 1 over 𝔽_3: four residue discs.
example (D : ReductionDiscData 3 X Xt J Jt)
    (hXt : Xt ≃ Fin 2 ⊕ {q : ZMod 3 × ZMod 3 // q.2 ^ 2 =
      q.1 ^ 6 + 8 * q.1 ^ 5 + 22 * q.1 ^ 4 + 22 * q.1 ^ 3 + 5 * q.1 ^ 2 + 6 * q.1 + 1}) :
    (Set.range D.residueDisc).ncard = 4 := sorry

-- datum_MP_example_one: y² = x(x−1)(x−2)(x−5)(x−6) at p = 7: X̃(𝔽_7) is the point at infinity
-- and the affine points over 𝔽_7, eight residue discs.
example (D : ReductionDiscData 7 X Xt J Jt)
    (hXt : Xt ≃ Option {q : ZMod 7 × ZMod 7 //
      q.2 ^ 2 = q.1 * (q.1 - 1) * (q.1 - 2) * (q.1 - 5) * (q.1 - 6)}) :
    (Set.range D.residueDisc).ncard = 8 := sorry

-- datum_elliptic_three: the smooth genus-one curve y² = x³ - x over F₃
-- has its three affine points and the point at infinity. This checks the special fibre;
-- construction of the geometric datum and all four analytic disc charts is omitted.
example : Nat.card (Option {q : ZMod 3 × ZMod 3 // q.2 ^ 2 = q.1 ^ 3 - q.1}) = 4 := sorry

-- datum_not_smooth_at_five: the reduction of x(x−1)(x−2)(x−5)(x−6) mod 5 is x²(x−1)²(x−2): not
-- squarefree, with the singular points (0, 0) and (1, 0) of y² = f̃(x). (The abstract datum
-- carries no equations; this is the failure of the smoothness hypothesis of
-- `hyperelliptic_integralDifferentials_basis`.)
example : ¬ Squarefree (Polynomial.map (Int.castRingHom (ZMod 5))
    (Polynomial.X * (Polynomial.X - 1) * (Polynomial.X - 2) * (Polynomial.X - 5) *
      (Polynomial.X - 6) : Polynomial ℤ)) ∧
    ∀ x₀ ∈ ({0, 1} : Set (ZMod 5)),
      (Polynomial.map (Int.castRingHom (ZMod 5)) (Polynomial.X * (Polynomial.X - 1) *
        (Polynomial.X - 2) * (Polynomial.X - 5) * (Polynomial.X - 6) : Polynomial ℤ)).eval x₀ = 0 ∧
      (Polynomial.derivative (Polynomial.map (Int.castRingHom (ZMod 5)) (Polynomial.X *
        (Polynomial.X - 1) * (Polynomial.X - 2) * (Polynomial.X - 5) * (Polynomial.X - 6) :
          Polynomial ℤ))).eval x₀ = 0 := sorry

-- datum_param_fibre: supporting parametrisation identity only, not a Coleman tube identification.
-- Former stronger test datum_residueDisc_eq_tube is omitted under §13.
-- D(x̃) is the set of ℚ_p-points of the residue disc ]x̃[ of the
-- good-reduction pair (𝒳, Ō), i.e. the image of the open unit disc under the inverse of the
-- disc parametrisation `t_x̃`; the pair's residue disc of `Ō` is D(red O).
example [Nonempty X] (D : ReductionDiscData p X Xt J Jt) (O : X) (xt : Xt) :
    (D.baseResidueDisc O).2 = D.residueDisc (D.red O) ∧
    D.residueDisc xt =
      Function.invFunOn (D.param xt) (D.residueDisc xt) '' {t : ℚ_[p] | ‖t‖ < 1} := sorry

end DatumTests

/-! ### ED.4/abelian-logarithm -/

section AbelianLog

variable {K : Type*} [Field K] [CharZero K]
variable {A T : Type*} [AddCommGroup A] [AddCommGroup T] [Module K T]

/-- The kernel of reduction `A¹(K)` of finite index with the formal logarithm on it. -/
structure FormalLogDatum (K A T : Type*) [Field K] [AddCommGroup A] [AddCommGroup T]
    [Module K T] where
  kernel : AddSubgroup A
  finiteIndex : kernel.FiniteIndex
  formalLog : kernel →+ T
  /-- the formal logarithm kills exactly the torsion of the kernel of reduction -/
  formalLog_eq_zero_iff : ∀ y : kernel, formalLog y = 0 ↔ IsOfFinAddOrder y
  /-- the image contains a lattice `(m_K^n)^g`, so it spans `Lie(A)` -/
  span_formalLog : Submodule.span K (Set.range formalLog) = ⊤

/-- The abelian logarithm `log_A : A(K) → Lie(A)`, `x ↦ N⁻¹ log_F̂(N x)`. -/
def abelianLog (D : FormalLogDatum K A T) : A →+ T := sorry

theorem abelianLog_eq_formalLog (D : FormalLogDatum K A T) (y : D.kernel) :
    abelianLog D y = D.formalLog y := sorry

theorem abelianLog_nsmul (D : FormalLogDatum K A T) (n : ℤ) (x : A) :
    abelianLog D (n • x) = n • abelianLog D x := sorry

theorem ker_abelianLog (D : FormalLogDatum K A T) (x : A) :
    abelianLog D x = 0 ↔ IsOfFinAddOrder x := sorry

theorem abelianLog_map {B T' : Type*} [AddCommGroup B] [AddCommGroup T'] [Module K T']
    (D : FormalLogDatum K A T) (D' : FormalLogDatum K B T') (φ : A →+ B) (dφ : T →ₗ[K] T')
    (hφ : ∀ y : D.kernel, ∃ hy : φ y ∈ D'.kernel, D'.formalLog ⟨φ y, hy⟩ = dφ (D.formalLog y))
    (x : A) : abelianLog D' (φ x) = dφ (abelianLog D x) := sorry

theorem abelianLog_baseChange {A' T' : Type*} [AddCommGroup A'] [AddCommGroup T'] [Module K T']
    (D : FormalLogDatum K A T) (D' : FormalLogDatum K A' T') (inc : A →+ A')
    (incT : T →ₗ[K] T')
    (h : ∀ y : D.kernel, ∃ hy : inc y ∈ D'.kernel, D'.formalLog ⟨inc y, hy⟩ = incT (D.formalLog y))
    (x : A) : abelianLog D' (inc x) = incT (abelianLog D x) := sorry

/-- The integration pairing `⟨x, ω⟩ = ω (log_A x)`. -/
def integrationPairing (D : FormalLogDatum K A T) (x : A) (ω : Module.Dual K T) : K := sorry

theorem integrationPairing_eq_zero_iff (D : FormalLogDatum K A T) (x : A) :
    (∀ ω : Module.Dual K T, integrationPairing D x ω = 0) ↔ IsOfFinAddOrder x := sorry

theorem abelianLog_unique (D : FormalLogDatum K A T) (lam : A →+ T)
    (h : ∀ y : D.kernel, lam y = D.formalLog y) : lam = abelianLog D := sorry

-- abelianLog_elliptic: in dimension one, log agrees with the formal logarithm on E¹.
example (D : FormalLogDatum K A T) (_hT : Module.finrank K T = 1) (x : A) (hx : x ∈ D.kernel) :
    abelianLog D x = D.formalLog ⟨x, hx⟩ := sorry

-- abelianLog_torsion: torsion points have logarithm zero.
example (D : FormalLogDatum K A T) (x : A) (hx : IsOfFinAddOrder x) : abelianLog D x = 0 := sorry

-- abelianLog_E11_five_torsion: a nonzero 5-torsion point shows log is not injective.
example (D : FormalLogDatum K A T) (x : A) (h5 : (5 : ℕ) • x = 0) (hx : x ≠ 0) :
    ¬ Function.Injective (abelianLog D) := sorry

-- abelianLog_C05_kernel_point: D' = 9·[∞⁺ − ∞⁻] lies in J¹(ℚ_3) with formal logarithm
-- ≡ (36, 3) (mod 3⁴) in Flynn's parameters.
example (A : Type*) [AddCommGroup A] (D : FormalLogDatum ℚ_[3] A (Fin 2 → ℚ_[3]))
    (d : D.kernel) (hd : ∀ i, ‖D.formalLog d i - ![36, 3] i‖ ≤ (3 : ℝ)⁻¹ ^ 4) :
    ∀ i, ‖abelianLog D d i - ![36, 3] i‖ ≤ (3 : ℝ)⁻¹ ^ 4 := sorry

-- integrationPairing_leftKernel: a differential pairing to zero with every point is zero.
example (D : FormalLogDatum K A T) (ω : Module.Dual K T)
    (h : ∀ x : A, integrationPairing D x ω = 0) : ω = 0 := sorry

end AbelianLog

/-- Evaluation of a power series at a point of the open unit disc. -/
def discEval {p : ℕ} [Fact p.Prime] (f : PowerSeries ℚ_[p]) (z : ℚ_[p]) : ℚ_[p] :=
  ∑' n, PowerSeries.coeff n f * z ^ n

/-! ### ED.4/abelian-integral -/

section AbelianIntegral

variable {K : Type*} [Field K] [CharZero K]
variable {X J T Ω : Type*} [AddCommGroup J] [AddCommGroup T] [Module K T]
  [AddCommGroup Ω] [Module K Ω]

/-- `∫_D ω := ⟨[D], ω_J⟩`, where `e : Ω ≃ Dual T` is `ω ↦ ω_J` (inverse of `ι_O^*`). -/
def abelianIntegral (D : FormalLogDatum K J T) (e : Ω ≃ₗ[K] Module.Dual K T) (d : J) (ω : Ω) :
    K := sorry

/-- Supporting extensionality of supplied linear identifications. The actual pullback
isomorphism and its geometric base-point independence are omitted under §13. -/
theorem pullback_basepoint_independent (e e' : Ω ≃ₗ[K] Module.Dual K T)
    (h : ∀ ω, e ω = e' ω) : e = e' := sorry

theorem abelianIntegral_add (D : FormalLogDatum K J T) (e : Ω ≃ₗ[K] Module.Dual K T)
    (d d' : J) (ω ω' : Ω) (a b : K) :
    abelianIntegral D e (d + d') ω = abelianIntegral D e d ω + abelianIntegral D e d' ω ∧
    abelianIntegral D e d (a • ω + b • ω') =
      a * abelianIntegral D e d ω + b * abelianIntegral D e d ω' := sorry

theorem abelianIntegral_eq_zero_iff (D : FormalLogDatum K J T) (e : Ω ≃ₗ[K] Module.Dual K T)
    (d : J) : (∀ ω, abelianIntegral D e d ω = 0) ↔ IsOfFinAddOrder d := sorry

theorem abelianIntegral_map {J' T' Ω' : Type*} [AddCommGroup J'] [AddCommGroup T'] [Module K T']
    [AddCommGroup Ω'] [Module K Ω'] (D : FormalLogDatum K J T) (D' : FormalLogDatum K J' T')
    (e : Ω ≃ₗ[K] Module.Dual K T) (e' : Ω' ≃ₗ[K] Module.Dual K T')
    (ρstar : J →+ J') (ρpull : Ω' →ₗ[K] Ω)
    (hlog : ∀ d, ∀ ω', e (ρpull ω') (abelianLog D d) = e' ω' (abelianLog D' (ρstar d)))
    (d : J) (ω' : Ω') : abelianIntegral D e d (ρpull ω') = abelianIntegral D' e' (ρstar d) ω' :=
  sorry

theorem abelianIntegral_trace {J' T' Ω' : Type*} [AddCommGroup J'] [AddCommGroup T']
    [Module K T'] [AddCommGroup Ω'] [Module K Ω'] (D : FormalLogDatum K J T)
    (D' : FormalLogDatum K J' T') (e : Ω ≃ₗ[K] Module.Dual K T)
    (e' : Ω' ≃ₗ[K] Module.Dual K T') (ρpic : J' →+ J) (tr : Ω →ₗ[K] Ω')
    (htr : ∀ d' ω, e ω (abelianLog D (ρpic d')) = e' (tr ω) (abelianLog D' d'))
    (d' : J') (ω : Ω) : abelianIntegral D e (ρpic d') ω = abelianIntegral D' e' d' (tr ω) :=
  sorry

theorem abelianIntegral_baseChange {J' T' Ω' : Type*} [AddCommGroup J'] [AddCommGroup T']
    [Module K T'] [AddCommGroup Ω'] [Module K Ω'] (D : FormalLogDatum K J T)
    (D' : FormalLogDatum K J' T') (e : Ω ≃ₗ[K] Module.Dual K T)
    (e' : Ω' ≃ₗ[K] Module.Dual K T') (inc : J →+ J') (incΩ : Ω →ₗ[K] Ω')
    (h : ∀ d ω, e' (incΩ ω) (abelianLog D' (inc d)) = e ω (abelianLog D d)) (d : J) (ω : Ω) :
    abelianIntegral D' e' (inc d) (incΩ ω) = abelianIntegral D e d ω := sorry

-- abelianIntegral_C05_tiny: on C₀(5) over ℚ_3, in the disc of (0, 1) with parameter t = x, the
-- forms dx/y and x dx/y expand as w dt and t·w dt with w² · f(t) = 1, w(0) = 1; the two tiny
-- integrals from (0, 1) to (−3, 1) are ≡ 2·3 + 3⁴ and ≡ 2·3² + 2·3³ (mod 3⁵).
example {X Xt J Jt T Ω : Type} [AddCommGroup J] [AddCommGroup Jt] [AddCommGroup T]
    [Module ℚ_[3] T] [AddCommGroup Ω] [Module ℚ_[3] Ω]
    (D : ReductionDiscData 3 X Xt J Jt) (L : FormalLogDatum ℚ_[3] J T)
    (e : Ω ≃ₗ[ℚ_[3]] Module.Dual ℚ_[3] T) (ω₀ ω₁ : Ω) (xt : Xt) (P₀ P₁ : X)
    (_h₀ : D.red P₀ = xt) (_h₁ : D.red P₁ = xt) (ht₀ : D.param xt P₀ = 0)
    (ht₁ : D.param xt P₁ = -3) (w : PowerSeries ℚ_[3]) (hw0 : PowerSeries.constantCoeff w = 1)
    (hw : w ^ 2 * ((Polynomial.X ^ 6 + 8 * Polynomial.X ^ 5 + 22 * Polynomial.X ^ 4 +
      22 * Polynomial.X ^ 3 + 5 * Polynomial.X ^ 2 + 6 * Polynomial.X + 1 :
        Polynomial ℚ_[3]) : PowerSeries ℚ_[3]) = 1)
    (hω : ∀ (i : Fin 2) (I : PowerSeries ℚ_[3]), PowerSeries.constantCoeff I = 0 →
      PowerSeries.derivative ℚ_[3] I = PowerSeries.X ^ (i : ℕ) * w →
      abelianIntegral L e (D.abelJacobi P₁ - D.abelJacobi P₀) (![ω₀, ω₁] i) =
        discEval I (D.param xt P₁) - discEval I (D.param xt P₀)) :
    ‖abelianIntegral L e (D.abelJacobi P₁ - D.abelJacobi P₀) ω₀ - (2 * 3 + 3 ^ 4)‖ ≤
        (3 : ℝ)⁻¹ ^ 5 ∧
      ‖abelianIntegral L e (D.abelJacobi P₁ - D.abelJacobi P₀) ω₁ - (2 * 3 ^ 2 + 2 * 3 ^ 3)‖ ≤
        (3 : ℝ)⁻¹ ^ 5 := sorry

-- abelianIntegral_self: the integral over the zero class vanishes.
example (D : FormalLogDatum K J T) (e : Ω ≃ₗ[K] Module.Dual K T) (ω : Ω) :
    abelianIntegral D e 0 ω = 0 := sorry

-- abelianIntegral_weierstrass_half: 2W ∼ S⁺ + S⁻ gives 2∫_{S⁻}^{W} = ∫_{S⁻}^{S⁺}.
example (D : FormalLogDatum K J T) (e : Ω ≃ₗ[K] Module.Dual K T) (w s : J)
    (h : (2 : ℤ) • w = s) (ω : Ω) :
    2 * abelianIntegral D e w ω = abelianIntegral D e s ω := sorry

-- abelianIntegral_genusOne: for an elliptic curve the integral is the logarithm paired with ω.
example (D : FormalLogDatum K J T) (e : Ω ≃ₗ[K] Module.Dual K T) (d : J) (ω : Ω) :
    abelianIntegral D e d ω = integrationPairing D d (e ω) := sorry

-- abelianIntegral_torsion_nonexample: a nonzero torsion class has all integrals zero.
example (D : FormalLogDatum K J T) (e : Ω ≃ₗ[K] Module.Dual K T) (d : J) (h5 : (5 : ℕ) • d = 0)
    (_hd : d ≠ 0) (ω : Ω) : abelianIntegral D e d ω = 0 := sorry

end AbelianIntegral

/-! ### Tiny integrals, kernel of reduction, comparison, constants -/

section Disc

variable {p : ℕ} [Fact p.Prime]

/- ED.4/tiny-integral-expansion has no faithful signature here yet (REV #535).
The abstract datum above imposes no analytic condition on `abelJacobi`, nor does it
identify `Ω` with regular differentials on a smooth proper curve. Consequently the
previous assertion of an analytic primitive was false for these carriers. The missing
interface must identify the actual geometric Abel–Jacobi map, its differential and the
disc chart with the suppliers' carriers, then derive convergence and the primitive
identity from ColemanIntegration L0/L1. See the packet gap "Geometric tiny-integral
signature". No abstract substitute for that theorem is declared. -/

/-- ED.4/kernel-of-reduction-evaluation: a kernel-of-reduction class represented by points
`Q₁, …, Q_g` of the disc of `P'` pairs as the sum of tiny integrals. -/
theorem integrationPairing_eq_sum_tiny {X Xt J Jt T Ω : Type} [AddCommGroup J]
    [AddCommGroup Jt] [AddCommGroup T] [Module ℚ_[p] T] [AddCommGroup Ω] [Module ℚ_[p] Ω]
    (D : ReductionDiscData p X Xt J Jt) (L : FormalLogDatum ℚ_[p] J T)
    (e : Ω ≃ₗ[ℚ_[p]] Module.Dual ℚ_[p] T) (ω : Ω) (P' : X) (lam : PowerSeries ℚ_[p])
    (hlam : ∀ P, D.red P = D.red P' →
      abelianIntegral L e (D.abelJacobi P - D.abelJacobi P') ω = discEval lam (D.param (D.red P') P))
    (Qs : Finset X) (hQs : ∀ Q ∈ Qs, D.red Q = D.red P') :
    abelianIntegral L e (∑ Q ∈ Qs, (D.abelJacobi Q - D.abelJacobi P')) ω =
      ∑ Q ∈ Qs, discEval lam (D.param (D.red P') Q) := sorry

/-- ED.4/coleman-abelian-comparison: a function on the curve that is a Coleman primitive of
a regular form agrees with the abelian integral. Coleman functions are an input here
(`colemanPrimitive`), with the defining properties used in the proof stated as hypotheses:
the difference is locally constant on residue discs and satisfies a Frobenius polynomial
equation without roots of unity (Dwork's principle), for a Frobenius lift `frob` preserving the
residue discs of the `𝔽_p`-points. -/
theorem colemanIntegral_eq_abelianIntegral {X Xt J Jt T Ω : Type} [AddCommGroup J]
    [AddCommGroup Jt] [AddCommGroup T] [Module ℚ_[p] T] [AddCommGroup Ω] [Module ℚ_[p] Ω]
    (D : ReductionDiscData p X Xt J Jt) (L : FormalLogDatum ℚ_[p] J T)
    (e : Ω ≃ₗ[ℚ_[p]] Module.Dual ℚ_[p] T) (ω : Ω) (colemanPrimitive : X → ℚ_[p]) (x : X)
    (frob : X → X) (hfrobred : ∀ y, D.red (frob y) = D.red y) (P : Polynomial ℤ)
    (hP : ∀ m : ℕ, 1 ≤ m → IsCoprime (P.map (Int.castRingHom ℚ)) (Polynomial.X ^ m - 1))
    (hloc : ∀ y y' : X, D.red y = D.red y' →
      colemanPrimitive y - abelianIntegral L e (D.abelJacobi y - D.abelJacobi x) ω =
      colemanPrimitive y' - abelianIntegral L e (D.abelJacobi y' - D.abelJacobi x) ω)
    (hfrob : ∃ c : ℚ_[p], ∀ y : X, ∑ i ∈ Finset.range (P.natDegree + 1),
      (P.coeff i : ℚ_[p]) * (colemanPrimitive (frob^[i] y) -
        abelianIntegral L e (D.abelJacobi (frob^[i] y) - D.abelJacobi x) ω) = c)
    (hx : colemanPrimitive x = 0) (y : X) :
    colemanPrimitive y = abelianIntegral L e (D.abelJacobi y - D.abelJacobi x) ω := sorry

/-- ED.4/disc-integration-constant (Wetherell): if `γ ∈ G` has the same reduction as `ι(B)`,
then `η(B) = ⟨ι(B) − γ, ω_J⟩`, a kernel-of-reduction value. -/
theorem eta_eq_const_add_tiny {X Xt J Jt T Ω : Type} [AddCommGroup J] [AddCommGroup Jt]
    [AddCommGroup T] [Module ℚ_[p] T] [AddCommGroup Ω] [Module ℚ_[p] Ω]
    (D : ReductionDiscData p X Xt J Jt) (L : FormalLogDatum ℚ_[p] J T)
    (e : Ω ≃ₗ[ℚ_[p]] Module.Dual ℚ_[p] T) (ω : Ω) (G : AddSubgroup J)
    (hω : ∀ γ ∈ G, abelianIntegral L e γ ω = 0) (B : X) (γ : J) (hγ : γ ∈ G)
    (hred : D.redJ γ = D.redJ (D.abelJacobi B)) :
    D.redJ (D.abelJacobi B - γ) = 0 ∧
      abelianIntegral L e (D.abelJacobi B) ω = abelianIntegral L e (D.abelJacobi B - γ) ω :=
  sorry

end Disc

/-! ### ED.4/padic-closure-dimension and ED.4/annihilating-differentials -/

section Annihilator

variable {K : Type*} [Field K] [CharZero K]
variable {J T Ω : Type*} [AddCommGroup J] [AddCommGroup T] [Module K T] [FiniteDimensional K T]
  [AddCommGroup Ω] [Module K Ω]

/-- ED.4/padic-closure-dimension, linear-algebra form: `dim span log Γ ≤ min (rank Γ) g`;
the rank of `Γ` is given by a generating family `v : Fin r → J`. -/
theorem dim_padicClosure_le_rank (D : FormalLogDatum K J T) {r : ℕ} (v : Fin r → J) :
    Module.finrank K (Submodule.span K (Set.range (fun i => abelianLog D (v i)))) ≤
      min r (Module.finrank K T) := sorry

/-- The differentials annihilating `Γ`: `{ω | ∀ γ ∈ Γ, ⟨γ, ω_J⟩ = 0}`. -/
def annihilatingDifferentials (D : FormalLogDatum K J T) (e : Ω ≃ₗ[K] Module.Dual K T)
    (Γ : AddSubgroup J) : Submodule K Ω := sorry

theorem mem_annihilatingDifferentials (D : FormalLogDatum K J T) (e : Ω ≃ₗ[K] Module.Dual K T)
    (Γ : AddSubgroup J) (ω : Ω) :
    ω ∈ annihilatingDifferentials D e Γ ↔ ∀ γ ∈ Γ, abelianIntegral D e γ ω = 0 := sorry

theorem annihilatingDifferentials_eq_dualAnnihilator (D : FormalLogDatum K J T)
    (e : Ω ≃ₗ[K] Module.Dual K T) (Γ : AddSubgroup J) :
    annihilatingDifferentials D e Γ =
      (Submodule.span K (abelianLog D '' (Γ : Set J))).dualAnnihilator.comap
        e.toLinearMap := sorry

theorem annihilatingDifferentials_of_finiteIndex (D : FormalLogDatum K J T)
    (e : Ω ≃ₗ[K] Module.Dual K T) (G Γ : AddSubgroup J) (hG : G ≤ Γ)
    (hfin : (G.addSubgroupOf Γ).FiniteIndex) :
    annihilatingDifferentials D e G = annihilatingDifferentials D e Γ := sorry

theorem annihilatingDifferentials_antitone (D : FormalLogDatum K J T)
    (e : Ω ≃ₗ[K] Module.Dual K T) {Γ Γ' : AddSubgroup J} (h : Γ ≤ Γ') :
    annihilatingDifferentials D e Γ' ≤ annihilatingDifferentials D e Γ := sorry

theorem finrank_annihilatingDifferentials [FiniteDimensional K Ω] (D : FormalLogDatum K J T)
    (e : Ω ≃ₗ[K] Module.Dual K T) (Γ : AddSubgroup J) :
    Module.finrank K (annihilatingDifferentials D e Γ) +
      Module.finrank K (Submodule.span K (abelianLog D '' (Γ : Set J))) =
        Module.finrank K T := sorry

theorem annihilatingDifferentials_saturation (D : FormalLogDatum K J T)
    (e : Ω ≃ₗ[K] Module.Dual K T) (Γ : AddSubgroup J) (ω : Ω)
    (hω : ω ∈ annihilatingDifferentials D e Γ) (x : J) (n : ℕ) (hn : n ≠ 0)
    (hx : n • x ∈ Γ) : abelianIntegral D e x ω = 0 := sorry

theorem annihilatingDifferentials_eq_ker (D : FormalLogDatum K J T) (e : Ω ≃ₗ[K] Module.Dual K T)
    {g r : ℕ} (b : Fin g → Ω) (gens : Fin r → J) (c : Fin g → K) :
    (∑ i, c i • b i) ∈ annihilatingDifferentials D e (AddSubgroup.closure (Set.range gens)) ↔
      ∀ j, ∑ i, c i * abelianIntegral D e (gens j) (b i) = 0 := sorry

/-- The reduction `Ṽ` of the integral annihilator, as the image of the integral lattice under
a reduction map `redΩ : Ωint → Ω̃` (an input, the reduction of integral differentials). -/
def reducedAnnihilator {Ωint Ωt : Type*} [AddCommGroup Ωint] [AddCommGroup Ωt]
    (D : FormalLogDatum K J T) (e : Ω ≃ₗ[K] Module.Dual K T) (Γ : AddSubgroup J)
    (incl : Ωint →+ Ω) (redΩ : Ωint →+ Ωt) : AddSubgroup Ωt := sorry

-- annihilator_C05_three: for C₀(5) at p = 3 the annihilator of ⟨[(−3,1) − (0,1)]⟩ is spanned
-- by ε dx/y + x dx/y with ε ≡ 2·3 + 3² + 2·3³ (mod 3⁴).
example {J T Ω : Type*} [AddCommGroup J] [AddCommGroup T] [Module ℚ_[3] T]
    [FiniteDimensional ℚ_[3] T] [AddCommGroup Ω] [Module ℚ_[3] Ω]
    (D : FormalLogDatum ℚ_[3] J T) (e : Ω ≃ₗ[ℚ_[3]] Module.Dual ℚ_[3] T) (d : J)
    (ω₀ ω₁ : Ω) (ε : ℚ_[3]) (hε : ε • ω₀ + ω₁ ∈ annihilatingDifferentials D e (AddSubgroup.zmultiples d))
    (h₀ : ‖abelianIntegral D e d ω₀ - (2 * 3 + 3 ^ 4)‖ ≤ (3 : ℝ)⁻¹ ^ 5)
    (h₁ : ‖abelianIntegral D e d ω₁ - (2 * 3 ^ 2 + 2 * 3 ^ 3)‖ ≤ (3 : ℝ)⁻¹ ^ 5) :
    ‖ε - (2 * 3 + 3 ^ 2 + 2 * 3 ^ 3)‖ ≤ (3 : ℝ)⁻¹ ^ 4 := sorry

-- annihilator_C132_three: for C₁(3₂) at p = 3, ∫_{S⁻}^{S⁺} dx/y ≡ 174 and ∫_{S⁻}^{S⁺} x dx/y ≡ 75
-- (mod 3⁵) give α ≡ 68 (mod 3⁴) and Ṽ = 𝔽₃·(x − 1) dx/y.
example {J T Ω : Type*} [AddCommGroup J] [AddCommGroup T] [Module ℚ_[3] T]
    [FiniteDimensional ℚ_[3] T] [AddCommGroup Ω] [Module ℚ_[3] Ω]
    (D : FormalLogDatum ℚ_[3] J T) (e : Ω ≃ₗ[ℚ_[3]] Module.Dual ℚ_[3] T) (d : J)
    (ω₀ ω₁ : Ω) (α : ℚ_[3])
    (hα : α • ω₀ + ω₁ ∈ annihilatingDifferentials D e (AddSubgroup.zmultiples d))
    (h₀ : ‖abelianIntegral D e d ω₀ - 174‖ ≤ (3 : ℝ)⁻¹ ^ 5)
    (h₁ : ‖abelianIntegral D e d ω₁ - 75‖ ≤ (3 : ℝ)⁻¹ ^ 5) : ‖α - 68‖ ≤ (3 : ℝ)⁻¹ ^ 4 := sorry

-- annihilator_zero: the annihilator of the zero subgroup is everything.
example (D : FormalLogDatum K J T) (e : Ω ≃ₗ[K] Module.Dual K T) :
    annihilatingDifferentials D e ⊥ = ⊤ := sorry

-- annihilator_top: the annihilator of the whole group is zero.
example (D : FormalLogDatum K J T) (e : Ω ≃ₗ[K] Module.Dual K T) :
    annihilatingDifferentials D e ⊤ = ⊥ := sorry

-- annihilator_small_subgroup_nonexample: a differential annihilating the zero subgroup need not
-- annihilate a nonzero class `d` (here `∫_d ω₀ ≢ 0 mod 3²`).
example {J T Ω : Type*} [AddCommGroup J] [AddCommGroup T] [Module ℚ_[3] T]
    [FiniteDimensional ℚ_[3] T] [AddCommGroup Ω] [Module ℚ_[3] Ω]
    (D : FormalLogDatum ℚ_[3] J T) (e : Ω ≃ₗ[ℚ_[3]] Module.Dual ℚ_[3] T) (d : J) (ω₀ : Ω)
    (h₀ : ‖abelianIntegral D e d ω₀ - (2 * 3 + 3 ^ 4)‖ ≤ (3 : ℝ)⁻¹ ^ 5) :
    ω₀ ∈ annihilatingDifferentials D e ⊥ ∧
      ω₀ ∉ annihilatingDifferentials D e (AddSubgroup.zmultiples d) := sorry

-- annihilator_dualAnnihilator: agreement with Mathlib's `Submodule.dualAnnihilator`.
example (D : FormalLogDatum K J T) (e : Ω ≃ₗ[K] Module.Dual K T) (Γ : AddSubgroup J) (ω : Ω) :
    ω ∈ annihilatingDifferentials D e Γ ↔
      e ω ∈ (Submodule.span K (abelianLog D '' (Γ : Set J))).dualAnnihilator := sorry

end Annihilator

/-! ### ED.4/annihilator-precision -/

/-- Cramer-rule precision. `M` is the matrix `M_{ij} = p^s ∫_{D_j} ω_i` for a basis `b` of the
differentials and `D₁, …, D_r ∈ J`, with entries in `ℤ_p`; `M'` approximates it to `p^k`, and the
`r × r` minor of `M'` on the rows `R` has valuation `δ` with `2δ < k`. Then (a) `M` has rank `r`,
the same minor of `M` has valuation `δ` and `dim Ann_p(⟨D₁, …, D_r⟩) = g − r`; (b) for `i ∉ R` the
solution `x` of `Σ_l x_l M_{R l, •} = M_{i, •}` lies in `p^{−δ} ℤ_p^R` and agrees to `p^{k−2δ}`
with the solution `x'` of the same system for `M'`; (c) the `ω^{(i)} = b_i − Σ_l x_l b_{R l}`,
`i ∉ R`, form a basis of `Ann_p(⟨D₁, …, D_r⟩)` (so by (b) `p^δ ω^{(i)}` is integral and known
modulo `p^{k−δ}`). -/
theorem annihilator_approx {p : ℕ} [Fact p.Prime] {J T Ω : Type*} [AddCommGroup J]
    [AddCommGroup T] [Module ℚ_[p] T] [FiniteDimensional ℚ_[p] T] [AddCommGroup Ω]
    [Module ℚ_[p] Ω] (L : FormalLogDatum ℚ_[p] J T) (e : Ω ≃ₗ[ℚ_[p]] Module.Dual ℚ_[p] T)
    {g r : ℕ} (_hrg : r < g) (b : Module.Basis (Fin g) ℚ_[p] Ω) (D : Fin r → J) (s : ℕ)
    (M M' : Matrix (Fin g) (Fin r) ℤ_[p])
    (hM : ∀ i j, (M i j : ℚ_[p]) = (p : ℚ_[p]) ^ s * abelianIntegral L e (D j) (b i))
    (k δ : ℕ) (hk : ∀ i j, ‖((M i j - M' i j : ℤ_[p]) : ℚ_[p])‖ ≤ (p : ℝ)⁻¹ ^ k)
    (R : Fin r → Fin g) (hδ : ‖((M'.submatrix R id).det : ℚ_[p])‖ = (p : ℝ)⁻¹ ^ δ)
    (hδk : 2 * δ < k) :
    Matrix.rank (M.map ((↑) : ℤ_[p] → ℚ_[p])) = r ∧
    ‖((M.submatrix R id).det : ℚ_[p])‖ = (p : ℝ)⁻¹ ^ δ ∧
    Module.finrank ℚ_[p] (annihilatingDifferentials L e (AddSubgroup.closure (Set.range D))) =
      g - r ∧
    (∀ i, i ∉ Set.range R → ∀ x x' : Fin r → ℚ_[p],
      Matrix.vecMul x ((M.map ((↑) : ℤ_[p] → ℚ_[p])).submatrix R id) =
        (fun j => (M i j : ℚ_[p])) →
      Matrix.vecMul x' ((M'.map ((↑) : ℤ_[p] → ℚ_[p])).submatrix R id) =
        (fun j => (M' i j : ℚ_[p])) →
      ∀ l, ‖x l‖ ≤ (p : ℝ) ^ δ ∧ ‖x l - x' l‖ ≤ (p : ℝ)⁻¹ ^ (k - 2 * δ)) ∧
    ∀ x : Fin g → Fin r → ℚ_[p],
      (∀ i, i ∉ Set.range R → Matrix.vecMul (x i)
        ((M.map ((↑) : ℤ_[p] → ℚ_[p])).submatrix R id) = (fun j => (M i j : ℚ_[p]))) →
      LinearIndependent ℚ_[p]
          (fun i : {i // i ∉ Set.range R} => b i - ∑ l, x i l • b (R l)) ∧
        Submodule.span ℚ_[p]
            (Set.range fun i : {i // i ∉ Set.range R} => b i - ∑ l, x i l • b (R l)) =
          annihilatingDifferentials L e (AddSubgroup.closure (Set.range D)) := sorry

/-! ### ED.4/residue-disc-zero-bound -/

section ZeroBound

variable {p : ℕ} [Fact p.Prime]

/-- ED.4/strassmann-bound: Strassmann's theorem over a complete nonarchimedean field. If `f` is
restricted at radius `1` and `N` is its last dominant index (the index supplied by Tau Ceti's
`TauCeti.PowerSeries.exists_max_eq_gaussNorm_of_isRestricted`), then `f` has at most `N` zeros in
the closed unit disc. -/
theorem strassmann_card_zeros_le {K : Type*} [NormedField K] [IsUltrametricDist K]
    [CompleteSpace K] (f : PowerSeries K) (hf : f.IsRestricted 1) (hf0 : f ≠ 0) (N : ℕ)
    (hN : ‖PowerSeries.coeff N f‖ = f.gaussNorm norm 1)
    (hlast : ∀ m, N < m → ‖PowerSeries.coeff m f‖ < f.gaussNorm norm 1)
    (Z : Finset K) (hZ : ∀ z ∈ Z, ‖z‖ ≤ 1 ∧ HasSum (fun n => PowerSeries.coeff n f * z ^ n) 0) :
    Z.card ≤ N := sorry

/-- The disc Strassmann index, for a nonzero series with integral derivative: the largest
`i` maximising `‖a_i‖ * p⁻ⁱ`, equivalently minimising the extended valuation `v(a_i) + i`.
Zero coefficients have extended valuation `+∞`; `Padic.valuation 0 = 0` must not be used
as their weight. Values outside this convergence contract are immaterial to the API. -/
def discStrassmannIndex (f : PowerSeries ℚ_[p]) : ℕ := sorry

/-- Zero-coefficient regression: the constant coefficient of `X` is zero, but the
last dominant coefficient of `X(pT)` is the coefficient at index one. -/
theorem discStrassmannIndex_X :
    discStrassmannIndex (PowerSeries.X : PowerSeries ℚ_[p]) = 1 := sorry

theorem card_zeros_le_discStrassmannIndex (f : PowerSeries ℚ_[p]) (hf : f ≠ 0)
    (hint : ∀ n : ℕ, ‖PowerSeries.coeff (n + 1) f * (n + 1 : ℚ_[p])‖ ≤ 1)
    (Z : Finset ℚ_[p]) (hZ : ∀ z ∈ Z, ‖z‖ < 1 ∧ discEval f z = 0) :
    Z.card ≤ discStrassmannIndex f := sorry

/-- McCallum–Poonen Lemma 5.1: if the derivative has order `m < p − 2` modulo `p`, the
index is at most `m + 1`. -/
theorem discStrassmannIndex_le_of_lt (f : PowerSeries ℚ_[p]) (m : ℕ) (hm : m + 2 < p)
    (hint : ∀ n : ℕ, ‖PowerSeries.coeff (n + 1) f * (n + 1 : ℚ_[p])‖ ≤ 1)
    (hlow : ∀ n < m, ‖PowerSeries.coeff (n + 1) f * (n + 1 : ℚ_[p])‖ < 1)
    (hm1 : ‖PowerSeries.coeff (m + 1) f * (m + 1 : ℚ_[p])‖ = 1) :
    discStrassmannIndex f ≤ m + 1 := sorry

end ZeroBound

/-! ### Chabauty finiteness and Coleman's bound -/

/-- ED.4/chabauty-finiteness, abstract form: if a nonzero locally analytic function `η` vanishes
on every point of the closure set, and each of the finitely many residue discs carries a finite
bound for its zeros, the closure set is finite. -/
theorem finite_rationalPoints_of_rank_lt_genus {p : ℕ} [Fact p.Prime] {X Xt J Jt : Type}
    [AddCommGroup J] [AddCommGroup Jt] (D : ReductionDiscData p X Xt J Jt)
    (η : X → ℚ_[p]) (S : Set X) (hS : ∀ P ∈ S, η P = 0) (N : Xt → ℕ)
    (hN : ∀ xt (Z : Finset X), (∀ z ∈ Z, D.red z = xt ∧ η z = 0) → Z.card ≤ N xt) : S.Finite :=
  sorry

/-- ED.4/coleman-bound: summing `m + 1` over the residue discs with `Σ m ≤ 2g − 2`. -/
theorem card_rationalPoints_le_coleman {p : ℕ} [Fact p.Prime] {X Xt J Jt : Type}
    [AddCommGroup J] [AddCommGroup Jt] (D : ReductionDiscData p X Xt J Jt)
    (g : ℕ) (hp : 2 * g < p) (rat : Finset X) (m : Xt → ℕ)
    (hm : ∑ xt ∈ @Finset.univ Xt D.fintypeXt, m xt ≤ 2 * g - 2)
    (hdisc : ∀ xt, (rat.filter (fun P => D.red P = xt)).card ≤ m xt + 1) :
    rat.card ≤ @Fintype.card Xt D.fintypeXt + (2 * g - 2) := sorry

/-- ED.4/bad-reduction-bound: the same count over the smooth 𝔽_p-points of the special fibre
of the minimal regular model, with `Σ_C n_C ≤ 2g − 2`. -/
theorem card_rationalPoints_le_badReduction {X Xs : Type} [Fintype Xs] (red : X → Xs)
    (g p : ℕ) (hp : 2 * g < p) (rat : Finset X) (n : Xs → ℕ)
    (hn : ∑ x ∈ Finset.univ, n x ≤ 2 * g - 2)
    (hdisc : ∀ x, (rat.filter (fun P => red P = x)).card ≤ n x + 1) :
    rat.card ≤ Fintype.card Xs + (2 * g - 2) := sorry

/-- ED.4/hyperelliptic-residue-discs, polynomial and power-series side. For `p` odd and
`y² = f(x)` with `f` of degree `2g + 1` or `2g + 2`, unit leading coefficient and squarefree
reduction (unit discriminant): the second chart `v² = f̌(u)`, `f̌ = u^{2g+2} f(1/u)
= reflect (2g + 2) f`, is smooth as well, and on either chart `h ∈ {f, f̌}` the local parameters
of (b) have power-series inverses over `ℤ_p`: at a point `(x₀, y₀)` with `y₀` a unit, `t = x − x₀`
and `y = Y(t) ∈ ℤ_p[[t]]` with `Y(0) = y₀`; at a Weierstrass point `(x̃₀, 0)`, `t = y` and
`x = ξ(t) ∈ ℤ_p[[t]]` with `h(ξ) = t²` and `h'(ξ) dξ = 2t dt` (so `dx/y = 2 dt/h'(x)`). The basis
statement (a) for `H⁰(𝒳, Ω¹)` and the orders (c) need differentials on the model and are not
stated. -/
theorem hyperelliptic_chart_powerSeries (p : ℕ) [Fact p.Prime] (hp : p ≠ 2)
    (f : Polynomial ℤ_[p]) (g : ℕ) (hg : 1 ≤ g)
    (hdeg : f.natDegree = 2 * g + 1 ∨ f.natDegree = 2 * g + 2) (hlead : IsUnit f.leadingCoeff)
    (hsq : Squarefree (f.map (PadicInt.toZMod (p := p)))) :
    Squarefree ((f.reflect (2 * g + 2)).map (PadicInt.toZMod (p := p))) ∧
    ∀ h ∈ ({f, f.reflect (2 * g + 2)} : Set (Polynomial ℤ_[p])),
      (∀ x₀ y₀ : ℤ_[p], IsUnit y₀ → h.eval x₀ = y₀ ^ 2 →
        ∃ Y : PowerSeries ℤ_[p], PowerSeries.constantCoeff Y = y₀ ∧
          Y ^ 2 = ((h.comp (Polynomial.X + Polynomial.C x₀) : Polynomial ℤ_[p]) :
            PowerSeries ℤ_[p])) ∧
      (∀ x₀ : ℤ_[p], (h.map (PadicInt.toZMod (p := p))).IsRoot (PadicInt.toZMod x₀) →
        ∃ ξ : PowerSeries ℤ_[p],
          PadicInt.toZMod (PowerSeries.constantCoeff ξ) = PadicInt.toZMod x₀ ∧
          Polynomial.aeval ξ h = PowerSeries.X ^ 2 ∧
          PowerSeries.derivative ℤ_[p] ξ * Polynomial.aeval ξ (Polynomial.derivative h) =
            2 * PowerSeries.X) := sorry

/-! ### ED.4/residue-disc-verdict -/

/-- A residue-disc verdict for `x̃`: base point and constant, the expansion `I_B` of `η` in the
local parameter of the disc, a certified bound `N` and the list of all `N` zeros, split into
verified rational points and certified non-rational points. -/
structure ResidueDiscVerdict {p : ℕ} [Fact p.Prime] {X Xt J Jt : Type} [AddCommGroup J]
    [AddCommGroup Jt] (D : ReductionDiscData p X Xt J Jt) (η : X → ℚ_[p]) (xt : Xt) where
  base : X
  baseValue : ℚ_[p]
  /-- the expansion `I_B(t) = c_B + primitive(w)(t)` of `η` on `D(x̃)` -/
  expansion : PowerSeries ℚ_[p]
  bound : ℕ
  zerosRat : Finset X
  zerosIrr : Finset X

namespace ResidueDiscVerdict

variable {p : ℕ} [Fact p.Prime] {X Xt J Jt : Type} [AddCommGroup J] [AddCommGroup Jt]
variable {D : ReductionDiscData p X Xt J Jt} {η : X → ℚ_[p]} {xt : Xt}

/-- All listed zeros. -/
def zeros (V : ResidueDiscVerdict D η xt) : Finset X := sorry

/-- Validity of a verdict relative to the set `rat` of rational points (inside `X(ℚ_p)`):
(i) the base point lies in the disc with certified value `c_B`; (ii) `I_B` is the expansion of `η`
on `D(x̃)` in the parameter `t_x̃` (so `I_B(t_x̃(B)) = c_B`), with integral derivative; (iii) `N`
bounds the disc Strassmann index of `I_B` (ED.4/residue-disc-zero-bound (d)), a finite check on
certified coefficient valuations; (iv) the listed points are zeros of `η` in the disc, rational
resp. not rational; (v) the lists are disjoint with `N` points in total. The bound on the number
of zeros is not a field: it follows from (ii)–(iii) and `card_zeros_le_discStrassmannIndex`. -/
def Valid (V : ResidueDiscVerdict D η xt) (rat : Set X) : Prop :=
  D.red V.base = xt ∧ η V.base = V.baseValue ∧
  (∀ P, D.red P = xt → η P = discEval V.expansion (D.param xt P)) ∧
  V.expansion ≠ 0 ∧
  (∀ n : ℕ, ‖PowerSeries.coeff (n + 1) V.expansion * (n + 1 : ℚ_[p])‖ ≤ 1) ∧
  discStrassmannIndex V.expansion ≤ V.bound ∧
  (∀ z ∈ V.zerosRat ∪ V.zerosIrr, D.red z = xt ∧ η z = 0) ∧
  (∀ z ∈ V.zerosRat, z ∈ rat) ∧ (∀ z ∈ V.zerosIrr, z ∉ rat) ∧
  Disjoint V.zerosRat V.zerosIrr ∧ (V.zerosRat ∪ V.zerosIrr).card = V.bound

theorem rationalPoints_eq (V : ResidueDiscVerdict D η xt) (rat : Set X) (hV : V.Valid rat)
    (hη : ∀ P ∈ rat, η P = 0) : {P | P ∈ rat ∧ D.red P = xt} = ↑V.zerosRat := sorry

/-- The verdict based at a listed rational point. -/
def ofKnownPoint (B : X) (w : PowerSeries ℚ_[p]) (N : ℕ) (Zr Zi : Finset X) :
    ResidueDiscVerdict D η xt := sorry

/-- The empty verdict, `N = 0`. -/
def empty (B : X) (c : ℚ_[p]) (w : PowerSeries ℚ_[p]) : ResidueDiscVerdict D η xt := sorry

theorem card_le (V : ResidueDiscVerdict D η xt) (rat : Set X) (hV : V.Valid rat)
    (hη : ∀ P ∈ rat, η P = 0) (Z : Finset X) (hZ : ∀ z ∈ Z, z ∈ rat ∧ D.red z = xt) :
    Z.card ≤ V.bound := sorry

/-- Moving the base point inside the disc. -/
def changeBase (V : ResidueDiscVerdict D η xt) (B' : X) : ResidueDiscVerdict D η xt := sorry

end ResidueDiscVerdict

section VerdictTests
variable {p : ℕ} [Fact p.Prime] {X Xt J Jt : Type} [AddCommGroup J] [AddCommGroup Jt]
variable {D : ReductionDiscData p X Xt J Jt} {η : X → ℚ_[p]} {xt : Xt}

-- verdict_C05_disc_zero_one: N = 2 with the two rational points (0,1), (−3,1).
example (V : ResidueDiscVerdict D η xt) (rat : Set X) (hV : V.Valid rat)
    (hη : ∀ P ∈ rat, η P = 0) (a b : X) (hab : a ≠ b) (h : V.zerosRat = {a, b}) (hN : V.bound = 2) :
    {P | P ∈ rat ∧ D.red P = xt} = {a, b} := sorry

-- verdict_C132_weierstrass: N = 3 with S⁻, S⁺ rational and W listed as non-rational.
example (V : ResidueDiscVerdict D η xt) (rat : Set X) (hV : V.Valid rat)
    (hη : ∀ P ∈ rat, η P = 0) (sm sp w : X) (h : V.zerosRat = {sm, sp}) (hw : V.zerosIrr = {w})
    (hN : V.bound = 3) : {P | P ∈ rat ∧ D.red P = xt} = {sm, sp} := sorry

-- verdict_empty: a valid verdict with N = 0 proves the disc has no rational point.
example (V : ResidueDiscVerdict D η xt) (rat : Set X) (hV : V.Valid rat)
    (hη : ∀ P ∈ rat, η P = 0) (hN : V.bound = 0) : ∀ P ∈ rat, D.red P ≠ xt := sorry

-- verdict_known_zeros_only: listing fewer zeros than the bound is not valid.
example (V : ResidueDiscVerdict D η xt) (rat : Set X)
    (hcard : (V.zerosRat ∪ V.zerosIrr).card < V.bound) : ¬ V.Valid rat := sorry

-- verdict_rationalPoints_eq: every rational point of the disc is listed.
example (V : ResidueDiscVerdict D η xt) (rat : Set X) (hV : V.Valid rat)
    (hη : ∀ P ∈ rat, η P = 0) (P : X) (hP : P ∈ rat) (hx : D.red P = xt) : P ∈ V.zerosRat := sorry

end VerdictTests

/-- Abstract rank-to-index bridge on the actual finitely generated group and its torsion
quotient. The geometric Chabauty factory still must identify J(Q), g and regular differentials. -/
theorem finiteIndex_of_rank_and_independent {A : Type*} [AddCommGroup A] [AddGroup.FG A]
    {r : ℕ} (γ : Fin r → A)
    (hind : LinearIndependent ℤ (fun i =>
      (QuotientAddGroup.mk (γ i) : A ⧸ AddCommGroup.torsion A)))
    (hrank : Module.finrank ℤ A ≤ r) : (AddSubgroup.closure (Set.range γ)).FiniteIndex := sorry

/-! ### ED.4/chabauty-coleman-certificate and ED.4/chabauty-coleman-completeness -/

/-- A Chabauty–Coleman certificate: the datum, the subgroup `G` and its rank input, the
pairing `⟨·, ω_J⟩` of an annihilating differential, and one verdict per point of `X̃(𝔽_p)`. -/
structure ChabautyColemanCertificate (p : ℕ) [Fact p.Prime] (X Xt J Jt : Type) [AddCommGroup J]
    [AddCommGroup Jt] where
  datum : ReductionDiscData p X Xt J Jt
  /-- the rational points inside `X(ℚ_p)` and the image of `J(ℚ)` inside `J(ℚ_p)` -/
  rat : Set X
  JQ : AddSubgroup J
  abelJacobi_rat : ∀ P ∈ rat, datum.abelJacobi P ∈ JQ
  /-- the finite-index subgroup with certified generators -/
  G : AddSubgroup J
  G_le : G ≤ JQ
  /-- the certified rank, or the rank in a labelled hypothesis -/
  rankInput : ℕ
  /-- the pairing `x ↦ ⟨x, ω_J⟩` of the annihilating differential -/
  pair : J →+ ℚ_[p]
  pair_G : ∀ γ ∈ G, pair γ = 0
  verdict : ∀ xt : Xt, ResidueDiscVerdict datum (fun P => pair (datum.abelJacobi P)) xt
  points : Finset X

namespace ChabautyColemanCertificate

variable {p : ℕ} [Fact p.Prime] {X Xt J Jt : Type} [AddCommGroup J] [AddCommGroup Jt]

/-- Validity: finite index of `G` (unconditionally, or under the labelled rank hypothesis),
valid verdicts on every disc, and `points` the union of their rational zeros. -/
def Valid (C : ChabautyColemanCertificate p X Xt J Jt) : Prop :=
  (C.G.addSubgroupOf C.JQ).FiniteIndex ∧ (∀ xt, (C.verdict xt).Valid C.rat) ∧
  ∀ P, P ∈ C.points ↔ ∃ xt, P ∈ (C.verdict xt).zerosRat

/-- The verdicts are indexed by all of `X̃(𝔽_p)`: every rational point is listed by the verdict of
its own residue disc. -/
theorem discs_complete (C : ChabautyColemanCertificate p X Xt J Jt) (hC : C.Valid) (P : X)
    (hP : P ∈ C.rat) : P ∈ (C.verdict (C.datum.red P)).zerosRat := sorry

theorem card_points_le (C : ChabautyColemanCertificate p X Xt J Jt) (hC : C.Valid) :
    C.points.card ≤ ∑ xt ∈ @Finset.univ Xt C.datum.fintypeXt, (C.verdict xt).bound := sorry

/-- The conditional certificate: the finite index of `G` is replaced by a labelled hypothesis
`FiniteIndex` input. This helper is not the rank-to-index constructor; that signature
is omitted until certified independent generators and the geometric differential carrier exist. -/
def withFiniteIndex (C : ChabautyColemanCertificate p X Xt J Jt) (r : ℕ)
    (_hyp : (C.G.addSubgroupOf C.JQ).FiniteIndex) : ChabautyColemanCertificate p X Xt J Jt :=
  sorry

/-- ED.4/chabauty-coleman-completeness. -/
theorem rationalPoints_eq (C : ChabautyColemanCertificate p X Xt J Jt) (hC : C.Valid) :
    C.rat = ↑C.points := sorry

end ChabautyColemanCertificate

section CertificateTests
variable {p : ℕ} [Fact p.Prime] {X Xt J Jt : Type} [AddCommGroup J] [AddCommGroup Jt]

-- certificate_C05: four discs with bounds 1, 1, 2, 2 give six points.
example (C : ChabautyColemanCertificate 3 X Xt J Jt) (hC : C.Valid)
    (h : ∑ xt ∈ @Finset.univ Xt C.datum.fintypeXt, (C.verdict xt).bound = 6) :
    C.points.card ≤ 6 := sorry

-- certificate_rank_zero: if `J(ℚ)` is finite, `G = ⊥` has finite index.
example (C : ChabautyColemanCertificate p X Xt J Jt) [Finite C.JQ] :
    ((⊥ : AddSubgroup J).addSubgroupOf C.JQ).FiniteIndex := sorry

-- certificate_missing_disc: verdicts on the discs other than `x̃₀` do not account for the rational
-- points of `X̃(𝔽_p)`'s disc `x̃₀` (for C₁(3₂) at p = 3, x̃₀ = (1, 0) containing S±): the list of
-- discs must be all of X̃(𝔽_p).
example (C : ChabautyColemanCertificate p X Xt J Jt) (hC : C.Valid) (x₀ : Xt) (P : X)
    (hP : P ∈ C.rat) (hx₀ : C.datum.red P = x₀) :
    C.rat ≠ ⋃ xt ∈ ({x₀}ᶜ : Set Xt), ((C.verdict xt).zerosRat : Set X) := sorry

-- certificate_rank_ge_genus: when log J(ℚ) spans the Lie algebra, no nonzero differential
-- annihilates J(ℚ).
example {K T Ω : Type*} [Field K] [CharZero K] [AddCommGroup T] [Module K T]
    [FiniteDimensional K T] [AddCommGroup Ω] [Module K Ω] (L : FormalLogDatum K J T)
    (e : Ω ≃ₗ[K] Module.Dual K T) (Γ : AddSubgroup J)
    (hspan : Submodule.span K (abelianLog L '' (Γ : Set J)) = ⊤) :
    annihilatingDifferentials L e Γ = ⊥ := sorry

-- certificate_conditional_label: the conditional certificate keeps the same points.
example (C : ChabautyColemanCertificate p X Xt J Jt) (r : ℕ)
    (hyp : (C.G.addSubgroupOf C.JQ).FiniteIndex) :
    (C.withFiniteIndex r hyp).points = C.points := sorry

end CertificateTests

/-! ### ED.4/number-field-chabauty-criterion -/

/-- Siksek's criterion over a number field of degree `d`: if the reduced matrix `M̃_p(Q)` has rank
`d`, `Q` is the only `K`-point of its `p`-unit ball. The ball, the θ-coordinates `z P ∈ ℤ_p^d` of
`t_Q(P)` (injective on the ball, `z Q = 0`, positive valuation by Siksek Lemma 3.1) and the
congruence `M_p(Q) z ≡ 0 (mod p^(s+1))` from Lemma 3.2 and the kernel of `p^a T` are inputs. -/
theorem eq_singleton_of_rank_reducedMatrix (p : ℕ) [Fact p.Prime] (hp : p ≠ 2) {d h : ℕ}
    {CK : Type} (ball : Set CK) (Q : CK) (hQ : Q ∈ ball)
    (M : Matrix (Fin h) (Fin d) ℤ_[p]) (hrank : (M.map (PadicInt.toZMod (p := p))).rank = d)
    (z : CK → Fin d → ℤ_[p]) (hzinj : Set.InjOn z ball) (hzQ : z Q = 0)
    (hz1 : ∀ P ∈ ball, ∀ i, ‖((z P i : ℤ_[p]) : ℚ_[p])‖ ≤ (p : ℝ)⁻¹)
    (hcong : ∀ P ∈ ball, ∀ s : ℕ, 1 ≤ s → (∀ i, ‖((z P i : ℤ_[p]) : ℚ_[p])‖ ≤ (p : ℝ)⁻¹ ^ s) →
      ∀ l, ‖((Matrix.mulVec M (z P) l : ℤ_[p]) : ℚ_[p])‖ ≤ (p : ℝ)⁻¹ ^ (s + 1)) :
    ball = {Q} := sorry

/-! ### ED.4/symmetric-square-chabauty-datum, ED.4/symmetric-chabauty,
ED.4/relative-symmetric-chabauty -/

/-- Symmetric-square datum: points of `X⁽²⁾`, its Abel–Jacobi map into `J`, reduction, the
points `X⁽²⁾(ℚ)` and `J(ℚ)`, the pairings with lifts `ω₁, …, ω_k ∈ V` of a basis of `Ṽ` (which
vanish on `J(ℚ)`), local coordinates of each residue class with the expansions of the integrals
`∫_𝒬^𝒫 ω_i` in them, the matrix `Ã(𝒬)` as the reduction of the linear coefficients of these
expansions, and the pullbacks `ρ*C(ℚ)`. -/
structure SymmetricSquareChabautyDatum (p : ℕ) [Fact p.Prime] (X2 X2t J Jt : Type)
    [AddCommGroup J] [AddCommGroup Jt] where
  abelJacobi : X2 → J
  red : X2 → X2t
  redJ : J →+ Jt
  abelJacobiT : X2t → Jt
  redJ_abelJacobi : ∀ Q, redJ (abelJacobi Q) = abelJacobiT (red Q)
  /-- the image of `J(ℚ)` in `J(ℚ_p)` and the points `X⁽²⁾(ℚ)`, with `ι⁽²⁾(X⁽²⁾(ℚ)) ⊆ J(ℚ)` -/
  JQ : AddSubgroup J
  rat : Set X2
  abelJacobi_rat : ∀ Q ∈ rat, abelJacobi Q ∈ JQ
  /-- the residue degree `[𝔽_p(Q̃₁) : 𝔽_p]` of `𝒬 = {Q₁, Q₂}` -/
  residueDegree : X2 → ℕ
  /-- number of basis vectors of `Ṽ` (resp. `Ṽ₀`) -/
  k : ℕ
  /-- the pairings `x ↦ ⟨x, (ω_i)_J⟩` for lifts `ω_i ∈ V` of the basis of `Ṽ`: they kill `J(ℚ)` -/
  pairing : Fin k → J →+ ℚ_[p]
  pairing_JQ : ∀ i, ∀ x ∈ JQ, pairing i x = 0
  /-- coordinates of the residue class of `𝒬` (the `θ`-components of `t_{Q̃₁}, t_{Q̃₂}`, resp. of
  their symmetric functions when `Q̃₁ = Q̃₂`), with values in `pℤ_p` -/
  coord : X2 → X2 → Fin 2 → ℤ_[p]
  coord_self : ∀ Q, coord Q Q = 0
  coord_injOn : ∀ Q, Set.InjOn (coord Q) {P | red P = red Q}
  coord_mem : ∀ Q P, red P = red Q → ∀ j, ‖(coord Q P j : ℚ_[p])‖ < 1
  /-- the expansion of `𝒫 ↦ ∫_𝒬^𝒫 ω_i` on the residue class of `𝒬` -/
  expansion : X2 → Fin k → MvPowerSeries (Fin 2) ℚ_[p]
  hasSum_expansion : ∀ Q P, red P = red Q → ∀ i,
    HasSum (fun m : Fin 2 →₀ ℕ => MvPowerSeries.coeff m (expansion Q i) *
      ∏ j, (coord Q P j : ℚ_[p]) ^ m j) (pairing i (abelJacobi P - abelJacobi Q))
  /-- the expansion is a primitive of an integral differential: the coefficient of a monomial
  of degree `n ≥ 1` lies in `n⁻¹ ℤ_p` -/
  norm_coeff_expansion : ∀ Q i (m : Fin 2 →₀ ℕ), m ≠ 0 →
    ‖MvPowerSeries.coeff m (expansion Q i)‖ * ‖((m 0 + m 1 : ℕ) : ℚ_[p])‖ ≤ 1
  /-- `Ã(𝒬)`: the reductions of the linear coefficients (`a₀(ω_i, t_{Q̃_j})`, resp.
  `(a₀(ω_i, t_{Q̃₁}), a₁(ω_i, t_{Q̃₁})/2)` in the diagonal case) -/
  matrix : X2 → Matrix (Fin k) (Fin 2) (ZMod p)
  matrix_eq : ∀ Q i j, ∃ a : ℤ_[p],
    (a : ℚ_[p]) = MvPowerSeries.coeff (Finsupp.single j 1) (expansion Q i) ∧
      PadicInt.toZMod a = matrix Q i j
  /-- the set `ρ*C(ℚ) ⊆ X⁽²⁾(ℚ)` of pulled-back points -/
  pullback : Set X2
  pullback_subset : pullback ⊆ rat

namespace SymmetricSquareChabautyDatum

variable {p : ℕ} [Fact p.Prime] {X2 X2t J Jt : Type} [AddCommGroup J] [AddCommGroup Jt]

theorem abelJacobi_injective (S : SymmetricSquareChabautyDatum p X2 X2t J Jt)
    (hX : Function.Injective S.abelJacobi) (Q Q' : X2) (h : S.abelJacobi Q = S.abelJacobi Q') :
    Q = Q' := sorry

/-- The relative vanishing differentials `Ṽ₀`, as a constant-coefficient column. -/
def relativeVanishing (S : SymmetricSquareChabautyDatum p X2 X2t J Jt) (Q : X2) :
    Matrix (Fin S.k) (Fin 1) (ZMod p) := sorry

theorem mem_pullback (S : SymmetricSquareChabautyDatum p X2 X2t J Jt) (C : Type) (ρstar : C → X2)
    (hρ : S.pullback = Set.range ρstar) (Q : X2) : Q ∈ S.pullback ↔ ∃ c, ρstar c = Q := sorry

end SymmetricSquareChabautyDatum

section SymmetricTests
variable {p : ℕ} [Fact p.Prime] {X2 X2t J Jt : Type} [AddCommGroup J] [AddCommGroup Jt]

-- symmetricSquare_rationalPairs: pairs of rational points give points of X⁽²⁾ with
-- ι⁽²⁾({P, Q}) = [P + Q − ∞]; since ι⁽²⁾ is injective, `{P, Q}` is unordered.
example {X : Type} (S : SymmetricSquareChabautyDatum p X2 X2t J Jt) (pair : X → X → X2)
    (ι : X → J) (inf : J) (h : ∀ P Q, S.abelJacobi (pair P Q) = ι P + ι Q - inf)
    (hX : Function.Injective S.abelJacobi) (P Q : X) :
    pair P Q = pair Q P := sorry

-- symmetricSquare_matrix_diagonal: for `𝒬 = {Q₁, Q₁}` the second column of `Ã(𝒬)` is
-- `a₁(ω_i, t)/2`, which needs p odd.
example (S : SymmetricSquareChabautyDatum p X2 X2t J Jt) (hp : p ≠ 2) (Q : X2)
    (a₁ : Fin S.k → ℤ_[p])
    (hdiag : ∀ i, MvPowerSeries.coeff (Finsupp.single 1 1) (S.expansion Q i) = (a₁ i : ℚ_[p]) / 2)
    (i : Fin S.k) : S.matrix Q i 1 = PadicInt.toZMod (a₁ i) / 2 := sorry

-- symmetricSquare_infinite_nonexample: with infinitely many pullback points X⁽²⁾(ℚ) is infinite,
-- even when there are two independent vanishing differentials (`k ≥ 2`).
example (S : SymmetricSquareChabautyDatum p X2 X2t J Jt) (_hk : 2 ≤ S.k)
    (hinf : S.pullback.Infinite) : S.rat.Infinite := sorry

-- symmetricSquare_reduction_compat: reduction commutes with the Abel–Jacobi maps, so points of
-- one residue class differ by a class in the kernel of reduction.
example (S : SymmetricSquareChabautyDatum p X2 X2t J Jt) (P Q : X2) (h : S.red P = S.red Q) :
    S.redJ (S.abelJacobi P - S.abelJacobi Q) = 0 := sorry

end SymmetricTests

/-- ED.4/symmetric-chabauty (Box Theorem 2.1): rank `Ã(𝒬) = 2` makes `𝒬` the only point of
`X⁽²⁾(ℚ)` in its residue class. -/
theorem eq_of_rank_symmetricMatrix {p : ℕ} [Fact p.Prime] {X2 X2t J Jt : Type} [AddCommGroup J]
    [AddCommGroup Jt] (S : SymmetricSquareChabautyDatum p X2 X2t J Jt) (hp : 2 < p)
    (Q : X2) (hp3 : S.residueDegree Q = 1 → p ≠ 3) (hQ : Q ∈ S.rat)
    (hrank : (S.matrix Q).rank = 2) (P : X2) (hP : P ∈ S.rat) (hred : S.red P = S.red Q) :
    P = Q := sorry

/-- ED.4/relative-symmetric-chabauty: (a) Box Theorem 2.4 and (b) Caraiani–Newton
Proposition 7.4.1 for one prime. -/
theorem mem_pullback_of_relativeCriterion {p : ℕ} [Fact p.Prime] {X2 X2t J Jt : Type}
    [AddCommGroup J] [AddCommGroup Jt] (S : SymmetricSquareChabautyDatum p X2 X2t J Jt)
    (L : Finset X2) (Lgood : Finset X2) (hL : Lgood ⊆ L)
    (hgood : ∀ y ∈ Lgood, ∀ x ∈ S.rat, S.red x = S.red y → x = y ∨ x ∈ S.pullback)
    (x : X2) (hx : x ∈ S.rat) (hred : ∃ y ∈ Lgood, S.red x = S.red y) :
    x ∈ L ∨ x ∈ S.pullback := sorry

/-! ### Applications -/

/-- ED.4/fps-quintic-cycle-curve: the six rational points of C₀(5), from a valid certificate at
`p = 3` with four discs of bounds 1, 1, 2, 2. -/
theorem C05_rationalPoints {X Xt J Jt : Type} [AddCommGroup J] [AddCommGroup Jt]
    (C : ChabautyColemanCertificate 3 X Xt J Jt) (hC : C.Valid) (hcard : C.points.card = 6) :
    C.rat = ↑C.points ∧ C.rat.ncard = 6 := sorry

/-- ED.4/poonen-type-three-two-curve: eight rational points of C₁(3₂), conditional on the rank
input recorded by ED.3 (the `FiniteIndex` field of `Valid`). -/
theorem C132_rationalPoints {X Xt J Jt : Type} [AddCommGroup J] [AddCommGroup Jt]
    (C : ChabautyColemanCertificate 3 X Xt J Jt) (hC : C.Valid) (hcard : C.points.card = 8) :
    C.rat = ↑C.points ∧ C.rat.ncard = 8 := sorry

/-- ED.4/stoll-six-cycle-curve: conditional on `rank J(ℚ) ≤ 3` (the `FiniteIndex` field), the
ten known points are all rational points of X₀^dyn(6). -/
theorem X0dyn6_rationalPoints_of_rank_le_three {X Xt J Jt : Type} [AddCommGroup J]
    [AddCommGroup Jt] (C : ChabautyColemanCertificate 5 X Xt J Jt) (hC : C.Valid)
    (hcard : C.points.card = 10) : C.rat = ↑C.points ∧ C.rat.ncard = 10 := sorry

end TauCeti.EffectiveDiophantine.ED4

end PartED4

/-! ## ED.5 -/

section PartED5


attribute [local instance] Classical.propDecidable
namespace TauCeti.MordellWeilSieve

variable {Γ ι : Type*} [AddCommGroup Γ]
variable {G : ι → Type*} [∀ i, AddCommGroup (G i)]

-- ED.5/admissible-classes
def admissibleClasses (S : Finset ι) (L : AddSubgroup Γ) [Fintype (Γ ⧸ L)]
    (φ : ∀ i, Γ →+ G i) (X : ∀ i, Finset (G i)) : Finset (Γ ⧸ L) := sorry

-- API: the native expression specifies the entire construction.
theorem admissibleClasses_eq_filter (S : Finset ι) (L : AddSubgroup Γ)
    [Fintype (Γ ⧸ L)] (φ : ∀ i, Γ →+ G i) (X : ∀ i, Finset (G i)) :
    admissibleClasses S L φ X = Finset.univ.filter (fun a => ∀ i ∈ S,
      QuotientAddGroup.map L (L.map (φ i)) (φ i) (AddSubgroup.le_comap_map (φ i) L) a ∈
        (X i).image (QuotientAddGroup.mk' (L.map (φ i)))) := sorry

-- ED.5/membership
theorem mem_admissibleClasses (S : Finset ι) (L : AddSubgroup Γ)
    [Fintype (Γ ⧸ L)] (φ : ∀ i, Γ →+ G i) (X : ∀ i, Finset (G i)) (a : Γ ⧸ L) :
    a ∈ admissibleClasses S L φ X ↔ ∀ i ∈ S,
      QuotientAddGroup.map L (L.map (φ i)) (φ i) (AddSubgroup.le_comap_map (φ i) L) a ∈
        (X i).image (QuotientAddGroup.mk' (L.map (φ i))) := sorry

-- ED.5/representative-congruences
theorem mk_mem_admissibleClasses (S : Finset ι) (L : AddSubgroup Γ)
    [Fintype (Γ ⧸ L)] (φ : ∀ i, Γ →+ G i) (X : ∀ i, Finset (G i)) (g : Γ) :
    QuotientAddGroup.mk' L g ∈ admissibleClasses S L φ X ↔
      ∀ i ∈ S, ∃ x ∈ X i, φ i g - x ∈ L.map (φ i) := sorry

theorem admissibleClasses_empty (L : AddSubgroup Γ) [Fintype (Γ ⧸ L)]
    (φ : ∀ i, Γ →+ G i) (X : ∀ i, Finset (G i)) :
    admissibleClasses ∅ L φ X = Finset.univ := sorry

theorem admissibleClasses_congr (S : Finset ι) (L : AddSubgroup Γ)
    [Fintype (Γ ⧸ L)] (φ : ∀ i, Γ →+ G i) (X Y : ∀ i, Finset (G i))
    (h : ∀ i ∈ S, X i = Y i) : admissibleClasses S L φ X = admissibleClasses S L φ Y := sorry

-- ED.5/constraint-monotonicity
theorem admissibleClasses_antitone (S T : Finset ι) (h : S ⊆ T)
    (L : AddSubgroup Γ) [Fintype (Γ ⧸ L)] (φ : ∀ i, Γ →+ G i)
    (X : ∀ i, Finset (G i)) : admissibleClasses T L φ X ⊆ admissibleClasses S L φ X := sorry

-- ED.5/local-overapproximations
theorem admissibleClasses_mono (S : Finset ι) (L : AddSubgroup Γ)
    [Fintype (Γ ⧸ L)] (φ : ∀ i, Γ →+ G i) (X Y : ∀ i, Finset (G i))
    (h : ∀ i ∈ S, X i ⊆ Y i) : admissibleClasses S L φ X ⊆ admissibleClasses S L φ Y := sorry

-- ED.5/global-soundness
theorem mk_mem_of_local_mem (S : Finset ι) (L : AddSubgroup Γ)
    [Fintype (Γ ⧸ L)] (φ : ∀ i, Γ →+ G i) (X : ∀ i, Finset (G i))
    (g : Γ) (h : ∀ i ∈ S, φ i g ∈ X i) :
    QuotientAddGroup.mk' L g ∈ admissibleClasses S L φ X := sorry

-- ED.5/empty-sieve-obstruction
theorem no_global_element_of_empty (S : Finset ι) (L : AddSubgroup Γ)
    [Fintype (Γ ⧸ L)] (φ : ∀ i, Γ →+ G i) (X : ∀ i, Finset (G i))
    (h : admissibleClasses S L φ X = ∅) : ¬ ∃ g : Γ, ∀ i ∈ S, φ i g ∈ X i := sorry

-- ED.5/top-initialization: range intersection is essential for non-surjective maps.
theorem admissibleClasses_top (S : Finset ι) [Fintype (Γ ⧸ (⊤ : AddSubgroup Γ))]
    (φ : ∀ i, Γ →+ G i) (X : ∀ i, Finset (G i))
    (h : ∀ i ∈ S, ∃ x ∈ X i, x ∈ (φ i).range) :
    admissibleClasses S ⊤ φ X = {0} := sorry

-- ED.5/quotient-refinement
theorem refinement_mem (S : Finset ι) (K L : AddSubgroup Γ) (hKL : K ≤ L)
    [Fintype (Γ ⧸ K)] [Fintype (Γ ⧸ L)]
    (φ : ∀ i, Γ →+ G i) (X : ∀ i, Finset (G i)) (a : Γ ⧸ K)
    (ha : a ∈ admissibleClasses S K φ X) :
    QuotientAddGroup.map K L (AddMonoidHom.id Γ) (by simpa using hKL) a ∈
      admissibleClasses S L φ X := sorry

-- ED.5/coset-lift
def refineClasses (S : Finset ι) (K L : AddSubgroup Γ) (hKL : K ≤ L)
    [Fintype (Γ ⧸ K)] (φ : ∀ i, Γ →+ G i) (X : ∀ i, Finset (G i))
    (σ : Γ ⧸ L → Γ ⧸ K) (B : Finset (Γ ⧸ L)) : Finset (Γ ⧸ K) := sorry

theorem refineClasses_eq_biUnion (S : Finset ι) (K L : AddSubgroup Γ) (hKL : K ≤ L)
    [Fintype (Γ ⧸ K)] (φ : ∀ i, Γ →+ G i) (X : ∀ i, Finset (G i))
    (σ : Γ ⧸ L → Γ ⧸ K) (B : Finset (Γ ⧸ L)) :
    let π := QuotientAddGroup.map K L (AddMonoidHom.id Γ) (by simpa using hKL)
    refineClasses S K L hKL φ X σ B =
      (B.biUnion (fun a => (Finset.univ.filter (fun z => π z = 0)).image
        (fun z => σ a + z))).filter (fun b => b ∈ admissibleClasses S K φ X) := sorry

-- ED.5/lift-membership
theorem mem_refineClasses (S : Finset ι) (K L : AddSubgroup Γ) (hKL : K ≤ L)
    [Fintype (Γ ⧸ K)] (φ : ∀ i, Γ →+ G i) (X : ∀ i, Finset (G i))
    (σ : Γ ⧸ L → Γ ⧸ K) (B : Finset (Γ ⧸ L)) :
    let π := QuotientAddGroup.map K L (AddMonoidHom.id Γ) (by simpa using hKL)
    (∀ a ∈ B, π (σ a) = a) → ∀ b,
      b ∈ refineClasses S K L hKL φ X σ B ↔
        π b ∈ B ∧ b ∈ admissibleClasses S K φ X := sorry

theorem refineClasses_empty (S : Finset ι) (K L : AddSubgroup Γ) (hKL : K ≤ L)
    [Fintype (Γ ⧸ K)] (φ : ∀ i, Γ →+ G i) (X : ∀ i, Finset (G i))
    (σ : Γ ⧸ L → Γ ⧸ K) : refineClasses S K L hKL φ X σ ∅ = ∅ := sorry

theorem refineClasses_section_independent (S : Finset ι) (K L : AddSubgroup Γ) (hKL : K ≤ L)
    [Fintype (Γ ⧸ K)] (φ : ∀ i, Γ →+ G i) (X : ∀ i, Finset (G i))
    (σ τ : Γ ⧸ L → Γ ⧸ K) (B : Finset (Γ ⧸ L)) :
    let π := QuotientAddGroup.map K L (AddMonoidHom.id Γ) (by simpa using hKL)
    (∀ a ∈ B, π (σ a) = a) → (∀ a ∈ B, π (τ a) = a) →
      refineClasses S K L hKL φ X σ B = refineClasses S K L hKL φ X τ B := sorry

-- ED.5/lift-correctness
theorem refineClasses_correct (S : Finset ι) (K L : AddSubgroup Γ) (hKL : K ≤ L)
    [Fintype (Γ ⧸ K)] [Fintype (Γ ⧸ L)]
    (φ : ∀ i, Γ →+ G i) (X : ∀ i, Finset (G i)) (σ : Γ ⧸ L → Γ ⧸ K) :
    let π := QuotientAddGroup.map K L (AddMonoidHom.id Γ) (by simpa using hKL)
    (∀ a ∈ admissibleClasses S L φ X, π (σ a) = a) →
      refineClasses S K L hKL φ X σ (admissibleClasses S L φ X) =
        admissibleClasses S K φ X := sorry

-- ED.5/unchanged-local-image
theorem unchanged_local_condition (K L : AddSubgroup Γ) (hKL : K ≤ L)
    (φ : ∀ i, Γ →+ G i) (X : ∀ i, Finset (G i)) (i : ι)
    (hmap : K.map (φ i) = L.map (φ i)) (b : Γ ⧸ K) :
    let π := QuotientAddGroup.map K L (AddMonoidHom.id Γ) (by simpa using hKL)
    (QuotientAddGroup.map K (K.map (φ i)) (φ i) (AddSubgroup.le_comap_map (φ i) K) b ∈
      (X i).image (QuotientAddGroup.mk' (K.map (φ i)))) ↔
    (QuotientAddGroup.map L (L.map (φ i)) (φ i) (AddSubgroup.le_comap_map (φ i) L) (π b) ∈
      (X i).image (QuotientAddGroup.mk' (L.map (φ i)))) := sorry

-- ED.5/relevant-tests
theorem refineClasses_relevant (S T : Finset ι) (hTS : T ⊆ S)
    (K L : AddSubgroup Γ) (hKL : K ≤ L)
    [Fintype (Γ ⧸ K)] [Fintype (Γ ⧸ L)]
    (φ : ∀ i, Γ →+ G i) (X : ∀ i, Finset (G i)) (σ : Γ ⧸ L → Γ ⧸ K)
    (hmap : ∀ i ∈ S, i ∉ T → K.map (φ i) = L.map (φ i)) :
    let π := QuotientAddGroup.map K L (AddMonoidHom.id Γ) (by simpa using hKL)
    (∀ a ∈ admissibleClasses S L φ X, π (σ a) = a) →
      refineClasses T K L hKL φ X σ (admissibleClasses S L φ X) =
        admissibleClasses S K φ X := sorry

-- ED.5/lift-cardinality
theorem card_refineClasses_le (S : Finset ι) (K L : AddSubgroup Γ) (hKL : K ≤ L)
    [Fintype (Γ ⧸ K)] (φ : ∀ i, Γ →+ G i) (X : ∀ i, Finset (G i))
    (σ : Γ ⧸ L → Γ ⧸ K) (B : Finset (Γ ⧸ L)) :
    let π := QuotientAddGroup.map K L (AddMonoidHom.id Γ) (by simpa using hKL)
    (refineClasses S K L hKL φ X σ B).card ≤
      B.card * (Finset.univ.filter (fun z => π z = 0)).card := sorry

-- ED.5/prepared-step-target
theorem target_le_preparedStep (D L : AddSubgroup Γ) (hDL : D ≤ L)
    {A : Type*} [AddCommGroup A] (φ : Γ →+ A) :
    D ≤ L ⊓ (D.map φ).comap φ := sorry

-- ED.5/prepared-step-progress
theorem preparedStep_lt (D L : AddSubgroup Γ) {A : Type*} [AddCommGroup A]
    (φ : Γ →+ A) (h : ¬ L.map φ ≤ D.map φ) :
    L ⊓ (D.map φ).comap φ < L := sorry

-- ED.5/subgroup-covers-quotient
theorem subgroup_covers_quotient (H L : AddSubgroup Γ) (N : ℕ)
    (hcop : Nat.Coprime H.index N) (hN : ∀ g : Γ, N • g ∈ L) :
    Function.Surjective ((QuotientAddGroup.mk' L).comp H.subtype) := sorry

-- ED.5/certified-map-obstruction: P is an arbitrary existing type, not a replacement for C(Q).
theorem isEmpty_of_commuting_maps {P : Type*} (j : P → Γ)
    (S : Finset ι) (L : AddSubgroup Γ) [Fintype (Γ ⧸ L)]
    (φ : ∀ i, Γ →+ G i) (X : ∀ i, Finset (G i)) (red : ∀ i, P → G i)
    (hcomm : ∀ i ∈ S, ∀ p, φ i (j p) = red i p)
    (hred : ∀ i ∈ S, ∀ p, red i p ∈ X i)
    (hempty : admissibleClasses S L φ X = ∅) : IsEmpty P := sorry

-- ED.5/known-points-completeness: uniqueness of fibres must be supplied by ED.4 or a height bound.
theorem mem_known_of_unique_fibres {P : Type*} (j : P → Γ)
    (S : Finset ι) (L : AddSubgroup Γ) [Fintype (Γ ⧸ L)]
    (φ : ∀ i, Γ →+ G i) (X : ∀ i, Finset (G i)) (W : Finset P)
    (hlocal : ∀ p, ∀ i ∈ S, φ i (j p) ∈ X i)
    (hcover : ∀ a ∈ admissibleClasses S L φ X,
      ∃ w ∈ W, QuotientAddGroup.mk' L (j w) = a)
    (huniq : Function.Injective (fun p => QuotientAddGroup.mk' L (j p))) :
    ∀ p, p ∈ W := sorry

-- Unit tests for admissibleClasses. Test names are comments because examples are anonymous.
-- admissibleClasses_empty_index: even with no places, all cosets survive.
example (L : AddSubgroup Γ) [Fintype (Γ ⧸ L)]
    (φ : ∀ i, Γ →+ G i) (X : ∀ i, Finset (G i)) :
    admissibleClasses ∅ L φ X = Finset.univ := sorry

-- admissibleClasses_empty_local: one empty local set eliminates every coset.
example (L : AddSubgroup Γ) [Fintype (Γ ⧸ L)] (φ : Γ →+ ZMod 4) :
    admissibleClasses {()} L (fun _ : Unit => φ) (fun _ => ∅) = ∅ := sorry

-- admissibleClasses_mod_four: torsion is retained, and local sets need not be subgroups.
example :
    admissibleClasses {()} (⊥ : AddSubgroup (ZMod 4))
      (fun _ : Unit => AddMonoidHom.id (ZMod 4)) (fun _ => {1, 3}) =
      ({1, 3} : Finset (ZMod 4)).image (QuotientAddGroup.mk' ⊥) := sorry

-- admissibleClasses_non_surjective: nonempty local data can miss the global image.
example :
    admissibleClasses {()} (⊤ : AddSubgroup (ZMod 2))
      (fun _ : Unit => (0 : ZMod 2 →+ ZMod 4)) (fun _ => {1}) = ∅ := sorry

-- admissibleClasses_top_nonempty: the initial coset survives a nonempty attainable local set.
example :
    admissibleClasses {()} (⊤ : AddSubgroup (ZMod 4))
      (fun _ : Unit => AddMonoidHom.id (ZMod 4)) (fun _ => {1}) = {0} := sorry

-- Unit tests for refineClasses.
-- refineClasses_empty_input
example (S : Finset ι) (K L : AddSubgroup Γ) (hKL : K ≤ L)
    [Fintype (Γ ⧸ K)] (φ : ∀ i, Γ →+ G i) (X : ∀ i, Finset (G i))
    (σ : Γ ⧸ L → Γ ⧸ K) : refineClasses S K L hKL φ X σ ∅ = ∅ := sorry

-- refineClasses_identity: refinement with no quotient change still applies the local tests.
example (S : Finset ι) (L : AddSubgroup Γ) [Fintype (Γ ⧸ L)]
    (φ : ∀ i, Γ →+ G i) (X : ∀ i, Finset (G i)) (B : Finset (Γ ⧸ L)) :
    refineClasses S L L le_rfl φ X id B = B ∩ admissibleClasses S L φ X := sorry

-- refineClasses_all_lifts: an empty set of tests retains the entire fibre.
example (K L : AddSubgroup Γ) (hKL : K ≤ L) [Fintype (Γ ⧸ K)]
    (φ : ∀ i, Γ →+ G i) (X : ∀ i, Finset (G i))
    (σ : Γ ⧸ L → Γ ⧸ K) (B : Finset (Γ ⧸ L)) :
    let π := QuotientAddGroup.map K L (AddMonoidHom.id Γ) (by simpa using hKL)
    (∀ a ∈ B, π (σ a) = a) →
      refineClasses ∅ K L hKL φ X σ B = Finset.univ.filter (fun b => π b ∈ B) := sorry

-- refineClasses_wrong_section: an unchecked representative changes the result.
example :
    refineClasses (∅ : Finset Unit) (⊥ : AddSubgroup (ZMod 4)) ⊥ le_rfl
      (fun _ : Unit => AddMonoidHom.id (ZMod 4)) (fun _ => ∅)
      (fun _ => QuotientAddGroup.mk' ⊥ 1) {QuotientAddGroup.mk' ⊥ 0} =
      {QuotientAddGroup.mk' ⊥ 1} := sorry


/-! ## Second part: geometric interface, transfers, combinations and the certificate -/

-- ED.5/kernel-level-exactness: below the kernels the sieve is exact.
theorem mk_mem_admissibleClasses_iff_of_le_ker (S : Finset ι) (L : AddSubgroup Γ)
    [Fintype (Γ ⧸ L)] (φ : ∀ i, Γ →+ G i) (X : ∀ i, Finset (G i))
    (hL : ∀ i ∈ S, L ≤ (φ i).ker) (g : Γ) :
    QuotientAddGroup.mk' L g ∈ admissibleClasses S L φ X ↔ ∀ i ∈ S, φ i g ∈ X i := sorry

theorem admissibleClasses_eq_empty_iff_of_le_ker (S : Finset ι) (L : AddSubgroup Γ)
    [Fintype (Γ ⧸ L)] (φ : ∀ i, Γ →+ G i) (X : ∀ i, Finset (G i))
    (hL : ∀ i ∈ S, L ≤ (φ i).ker) :
    admissibleClasses S L φ X = ∅ ↔ ¬ ∃ g : Γ, ∀ i ∈ S, φ i g ∈ X i := sorry

-- ED.5/exponent-relevance: a place whose exponent has small `q`-valuation gives no new test.
theorem range_nsmul_mul_eq_of_padicValNat_le {A : Type*} [AddCommGroup A] (q M : ℕ)
    (hq : q.Prime) (he : AddMonoid.exponent A ≠ 0)
    (hv : padicValNat q (AddMonoid.exponent A) ≤ padicValNat q M) :
    (nsmulAddMonoidHom (q * M) : A →+ A).range = (nsmulAddMonoidHom M : A →+ A).range := sorry

theorem map_range_nsmul_mul_eq_of_padicValNat_le {A : Type*} [AddCommGroup A] (φ : Γ →+ A)
    (q M : ℕ) (hq : q.Prime) (he : AddMonoid.exponent A ≠ 0)
    (hv : padicValNat q (AddMonoid.exponent A) ≤ padicValNat q M) :
    ((nsmulAddMonoidHom (q * M) : Γ →+ Γ).range).map φ =
      ((nsmulAddMonoidHom M : Γ →+ Γ).range).map φ := sorry

-- ED.5/coprime-index-transfer: a subgroup of index prime to `N` computes the sieve modulo `N`.
theorem inf_range_nsmul_eq_map_of_coprime (H : AddSubgroup Γ) (N : ℕ)
    (hcop : Nat.Coprime H.index N) :
    H ⊓ (nsmulAddMonoidHom N : Γ →+ Γ).range = H.map (nsmulAddMonoidHom N : Γ →+ Γ) := sorry

theorem coprimeIndex_quotient_bijective (H : AddSubgroup Γ) (N : ℕ)
    (hcop : Nat.Coprime H.index N) :
    Function.Bijective (QuotientAddGroup.map (nsmulAddMonoidHom N : H →+ H).range
      (nsmulAddMonoidHom N : Γ →+ Γ).range H.subtype (by
        intro x hx
        obtain ⟨y, rfl⟩ := AddMonoidHom.mem_range.1 hx
        exact AddSubgroup.mem_comap.2 (AddMonoidHom.mem_range.2 ⟨(y : Γ), by simp⟩))) := sorry

theorem coprimeIndex_sieve_transfer (H : AddSubgroup Γ) (N : ℕ)
    (hcop : Nat.Coprime H.index N) (S : Finset ι)
    [Fintype (H ⧸ (nsmulAddMonoidHom N : H →+ H).range)]
    (φ : ∀ i, Γ →+ G i) (X : ∀ i, Finset (G i)) (γ : Γ) (hγ : ∀ i ∈ S, φ i γ ∈ X i) :
    ∃ h : H, (h : Γ) - γ ∈ (nsmulAddMonoidHom N : Γ →+ Γ).range ∧
      QuotientAddGroup.mk' _ h ∈ admissibleClasses S (nsmulAddMonoidHom N : H →+ H).range
        (fun i => (QuotientAddGroup.mk' (nsmulAddMonoidHom N : G i →+ G i).range).comp
          ((φ i).comp H.subtype))
        (fun i => (X i).image (QuotientAddGroup.mk' (nsmulAddMonoidHom N : G i →+ G i).range)) :=
  sorry

-- ED.5/sieve-chain: the iterated lifting along a descending chain of subgroups.
def siftChain (S : Finset ι) (L : ℕ → AddSubgroup Γ) (hL : ∀ j, L (j + 1) ≤ L j)
    [∀ j, Fintype (Γ ⧸ L j)] (φ : ∀ i, Γ →+ G i) (X : ∀ i, Finset (G i))
    (σ : ∀ j, Γ ⧸ L j → Γ ⧸ L (j + 1)) (T : ℕ → Finset ι) : ∀ j, Finset (Γ ⧸ L j) := sorry

-- API: the initial level is the direct sieve.
theorem siftChain_zero (S : Finset ι) (L : ℕ → AddSubgroup Γ) (hL : ∀ j, L (j + 1) ≤ L j)
    [∀ j, Fintype (Γ ⧸ L j)] (φ : ∀ i, Γ →+ G i) (X : ∀ i, Finset (G i))
    (σ : ∀ j, Γ ⧸ L j → Γ ⧸ L (j + 1)) (T : ℕ → Finset ι) :
    siftChain S L hL φ X σ T 0 = admissibleClasses S (L 0) φ X := sorry

-- API: one lifting step.
theorem siftChain_succ (S : Finset ι) (L : ℕ → AddSubgroup Γ) (hL : ∀ j, L (j + 1) ≤ L j)
    [∀ j, Fintype (Γ ⧸ L j)] (φ : ∀ i, Γ →+ G i) (X : ∀ i, Finset (G i))
    (σ : ∀ j, Γ ⧸ L j → Γ ⧸ L (j + 1)) (T : ℕ → Finset ι) (j : ℕ) :
    siftChain S L hL φ X σ T (j + 1) =
      refineClasses (T j) (L (j + 1)) (L j) (hL j) φ X (σ j) (siftChain S L hL φ X σ T j) :=
  sorry

-- API: the deterministic size bound of a step.
theorem card_siftChain_succ_le (S : Finset ι) (L : ℕ → AddSubgroup Γ) (hL : ∀ j, L (j + 1) ≤ L j)
    [∀ j, Fintype (Γ ⧸ L j)] (φ : ∀ i, Γ →+ G i) (X : ∀ i, Finset (G i))
    (σ : ∀ j, Γ ⧸ L j → Γ ⧸ L (j + 1)) (T : ℕ → Finset ι) (j : ℕ) :
    (siftChain S L hL φ X σ T (j + 1)).card ≤
      (siftChain S L hL φ X σ T j).card *
        (Finset.univ.filter (fun z : Γ ⧸ L (j + 1) =>
          QuotientAddGroup.map (L (j + 1)) (L j) (AddMonoidHom.id Γ) (by simpa using hL j) z = 0)).card :=
  sorry

-- ED.5/sieve-chain-correct
theorem siftChain_eq_admissibleClasses (S : Finset ι) (L : ℕ → AddSubgroup Γ)
    (hL : ∀ j, L (j + 1) ≤ L j) [∀ j, Fintype (Γ ⧸ L j)] (φ : ∀ i, Γ →+ G i)
    (X : ∀ i, Finset (G i)) (σ : ∀ j, Γ ⧸ L j → Γ ⧸ L (j + 1)) (T : ℕ → Finset ι)
    (hσ : ∀ j, ∀ a ∈ admissibleClasses S (L j) φ X,
      QuotientAddGroup.map (L (j + 1)) (L j) (AddMonoidHom.id Γ) (by simpa using hL j) (σ j a) = a)
    (hTS : ∀ j, T j ⊆ S)
    (hT : ∀ j, ∀ i ∈ S, i ∉ T j → (L (j + 1)).map (φ i) = (L j).map (φ i)) (j : ℕ) :
    siftChain S L hL φ X σ T j = admissibleClasses S (L j) φ X := sorry

-- Unit tests for siftChain.
-- siftChain_level_zero: before any lifting the chain is the direct sieve.
example (S : Finset ι) (L : ℕ → AddSubgroup Γ) (hL : ∀ j, L (j + 1) ≤ L j)
    [∀ j, Fintype (Γ ⧸ L j)] (φ : ∀ i, Γ →+ G i) (X : ∀ i, Finset (G i))
    (σ : ∀ j, Γ ⧸ L j → Γ ⧸ L (j + 1)) (T : ℕ → Finset ι) :
    siftChain S L hL φ X σ T 0 = admissibleClasses S (L 0) φ X := sorry

-- siftChain_no_places: with no places and correct lifts every class survives at every level.
example (L : ℕ → AddSubgroup Γ) (hL : ∀ j, L (j + 1) ≤ L j)
    [∀ j, Fintype (Γ ⧸ L j)] (φ : ∀ i, Γ →+ G i) (X : ∀ i, Finset (G i))
    (σ : ∀ j, Γ ⧸ L j → Γ ⧸ L (j + 1))
    (hσ : ∀ j a, QuotientAddGroup.map (L (j + 1)) (L j) (AddMonoidHom.id Γ)
      (by simpa using hL j) (σ j a) = a) (j : ℕ) :
    siftChain ∅ L hL φ X σ (fun _ => ∅) j = Finset.univ := sorry

-- siftChain_two_levels: ZMod 4, top then bottom, identity map, allowed set {1}.
example :
    siftChain {()} (fun j => if j = 0 then (⊤ : AddSubgroup (ZMod 4)) else ⊥)
      (fun j => by simp) (fun _ : Unit => AddMonoidHom.id (ZMod 4)) (fun _ => {1})
      (fun _ _ => QuotientAddGroup.mk' _ 1) (fun _ => {()}) 1 =
      {QuotientAddGroup.mk' _ 1} := sorry

-- siftChain_omitted_changed_test: omitting a test whose image subgroup changes keeps all lifts.
example :
    (siftChain {()} (fun j => if j = 0 then (⊤ : AddSubgroup (ZMod 4)) else ⊥)
      (fun j => by simp) (fun _ : Unit => AddMonoidHom.id (ZMod 4)) (fun _ => {1})
      (fun _ _ => QuotientAddGroup.mk' _ 1) (fun _ => ∅) 1).card = 4 := sorry

-- ED.5/subgroup-from-membership-test (GetSubgroup of Bruin–Stoll §5).
def getSubgroup (K : AddSubgroup Γ) [K.FiniteIndex] (b : List Γ) : List Γ := sorry

-- API: the output generates the subgroup when the input generates the group.
theorem closure_getSubgroup (K : AddSubgroup Γ) [K.FiniteIndex] (b : List Γ)
    (hb : AddSubgroup.closure {x | x ∈ b} = ⊤) :
    AddSubgroup.closure {x | x ∈ getSubgroup K b} = K := sorry

theorem getSubgroup_mem (K : AddSubgroup Γ) [K.FiniteIndex] (b : List Γ) :
    ∀ x ∈ getSubgroup K b, x ∈ K := sorry

theorem length_getSubgroup (K : AddSubgroup Γ) [K.FiniteIndex] (b : List Γ) :
    (getSubgroup K b).length = b.length := sorry

theorem getSubgroup_top (b : List Γ) : getSubgroup (⊤ : AddSubgroup Γ) b = b := sorry

-- Unit tests for getSubgroup.
-- getSubgroup_whole_group: the whole group returns the input generators.
example (b : List Γ) : getSubgroup (⊤ : AddSubgroup Γ) b = b := sorry

-- getSubgroup_int_four: in ℤ with generator 1 and K = 4ℤ the output is [4].
example [(AddSubgroup.zmultiples (4 : ℤ)).FiniteIndex] :
    getSubgroup (AddSubgroup.zmultiples (4 : ℤ)) [1] = [4] := sorry

-- getSubgroup_parity: in ℤ², with K the even-sum subgroup, the output is [(2,0), (1,1)].
example [((Int.castAddHom (ZMod 2)).comp
      (AddMonoidHom.coprod (AddMonoidHom.id ℤ) (AddMonoidHom.id ℤ))).ker.FiniteIndex] :
    getSubgroup ((Int.castAddHom (ZMod 2)).comp
      (AddMonoidHom.coprod (AddMonoidHom.id ℤ) (AddMonoidHom.id ℤ))).ker [(1, 0), (0, 1)] =
      [(2, 0), (1, 1)] := sorry

-- getSubgroup_naive_multiples: doubling each generator gives a proper subgroup of K.
example [((Int.castAddHom (ZMod 2)).comp
      (AddMonoidHom.coprod (AddMonoidHom.id ℤ) (AddMonoidHom.id ℤ))).ker.FiniteIndex] :
    getSubgroup ((Int.castAddHom (ZMod 2)).comp
        (AddMonoidHom.coprod (AddMonoidHom.id ℤ) (AddMonoidHom.id ℤ))).ker [(1, 0), (0, 1)] ≠
      [((2 : ℤ), (0 : ℤ)), (0, 2)] ∧
    AddSubgroup.closure {x | x ∈ [((2 : ℤ), (0 : ℤ)), (0, 2)]} < ((Int.castAddHom (ZMod 2)).comp
      (AddMonoidHom.coprod (AddMonoidHom.id ℤ) (AddMonoidHom.id ℤ))).ker := sorry

-- ED.5/height-coset-separation (Bruin–Stoll §4.2): each coset of NΓ has at most one
-- element of height at most H.
theorem eq_of_sub_mem_range_nsmul_of_height_le (Q : QuadraticMap ℤ Γ ℝ) (hQ : ∀ x, 0 ≤ Q x)
    (m H : ℝ) (hm : ∀ x, ¬ IsOfFinAddOrder x → m ≤ Q x) (N : ℕ)
    (htors : ∀ x : Γ, IsOfFinAddOrder x → N • x = 0) (hN : 4 * H < (N : ℝ) ^ 2 * m)
    {x y : Γ} (hxy : x - y ∈ (nsmulAddMonoidHom N : Γ →+ Γ).range)
    (hx : Q x ≤ H) (hy : Q y ≤ H) : x = y := sorry

-- ED.5/height-bounded-points (Bruin–Stoll §4.2): points of bounded height lie among the
-- certified short representatives of the surviving classes.
theorem mem_candidates_of_height_le {P : Type*} (j : P → Γ) (S : Finset ι) (L : AddSubgroup Γ)
    [Fintype (Γ ⧸ L)] (φ : ∀ i, Γ →+ G i) (X : ∀ i, Finset (G i))
    (hlocal : ∀ p, ∀ i ∈ S, φ i (j p) ∈ X i) (Q : QuadraticMap ℤ Γ ℝ) (hgt : P → ℝ)
    (d δ H : ℝ) (hcomp : ∀ p, Q (j p) ≤ d * hgt p + δ) (hd : 0 ≤ d)
    (T : Γ ⧸ L → Finset Γ)
    (hT : ∀ a ∈ admissibleClasses S L φ X, ∀ x : Γ,
      QuotientAddGroup.mk' L x = a → Q x ≤ d * H + δ → x ∈ T a)
    (p : P) (hp : hgt p ≤ H) : ∃ a ∈ admissibleClasses S L φ X, j p ∈ T a := sorry

-- ED.5/kummer-curve-test (Bruin–Stoll Lemma 4.1, with the corrected constant 3).
-- The genus-two statement needs the Kummer surface (gap); its arithmetic core is:
theorem kummerLineValue_eq_zero (k₁ k₂ k₃ a b : ℤ) (B : ℝ)
    (hk : |(k₁ : ℝ)| ≤ B ∧ |(k₂ : ℝ)| ≤ B ∧ |(k₃ : ℝ)| ≤ B)
    (ps : Finset ℕ) (hps : ∀ p ∈ ps, p.Prime)
    (hdvd : ∀ p ∈ ps, (p : ℤ) ∣ k₁ * a ^ 2 - k₂ * a * b + k₃ * b ^ 2)
    (hprod : 3 * B * (max |(a : ℝ)| |(b : ℝ)|) ^ 2 < ∏ p ∈ ps, (p : ℝ)) :
    k₁ * a ^ 2 - k₂ * a * b + k₃ * b ^ 2 = 0 := sorry

-- ED.5/siksek-lattice-step (Bruin–Stoll §4.3): passing from L to L ∩ ker φ.
theorem represents_of_siksek_step {P : Type*} (j : P → Γ) (W : Finset Γ) (L : AddSubgroup Γ)
    {A : Type*} [AddCommGroup A] (φ : Γ →+ A) (Y : Set A) (hY : ∀ p, φ (j p) ∈ Y)
    (hW : ∀ p, ∃ w ∈ W, j p - w ∈ L) (R : Set Γ)
    (hR : ∀ l ∈ L, l ∉ L ⊓ φ.ker → ∃ r ∈ R, l - r ∈ L ⊓ φ.ker)
    (htest : ∀ w ∈ W, ∀ r ∈ R, φ (w + r) ∉ Y) :
    ∀ p, ∃ w ∈ W, j p - w ∈ L ⊓ φ.ker := sorry

-- ED.5/integral-points-completeness: the sieve lower bound against a certified upper bound.
theorem mem_known_of_height_gap {P : Type*} (j : P → Γ) (hj : Function.Injective j)
    (W : Finset P) (L : AddSubgroup Γ) (hW : ∀ p, ∃ w ∈ W, j p - j w ∈ L)
    (Q : QuadraticMap ℤ Γ ℝ) (hQ : ∀ x, 0 ≤ Q x) (μ : ℝ) (hμ : ∀ l ∈ L, l ≠ 0 → μ ≤ Q l)
    (Wmax : ℝ) (hWmax : ∀ w ∈ W, Q (j w) ≤ Wmax) (hsep : Real.sqrt Wmax < Real.sqrt μ)
    (ht : P → ℝ) (d δ B : ℝ) (hd : 0 ≤ d) (hcomp : ∀ p, Q (j p) ≤ d * ht p + δ)
    (hB : ∀ p, ht p ≤ B) (hgap : d * B + δ < (Real.sqrt μ - Real.sqrt Wmax) ^ 2) :
    ∀ p, p ∈ W := sorry

section LocalQuotient

variable {M A : Type*} [AddCommGroup M] [AddCommGroup A]

-- ED.5/padic-quotient-sieve-datum: classes of M/(M ∩ U) whose U-coset meets the local points.
def padicImageClasses (incl : M →+ A) (U : AddSubgroup A) [Fintype (M ⧸ U.comap incl)]
    (Y : Set A) : Finset (M ⧸ U.comap incl) := sorry

-- API (characterisation)
theorem mem_padicImageClasses (incl : M →+ A) (U : AddSubgroup A) [Fintype (M ⧸ U.comap incl)]
    (Y : Set A) (c : M ⧸ U.comap incl) :
    c ∈ padicImageClasses incl U Y ↔
      ∃ g : M, QuotientAddGroup.mk' (U.comap incl) g = c ∧ ∃ y ∈ Y, incl g - y ∈ U := sorry

-- API (compatibility): a global element lying in the local point set survives.
theorem mk_mem_padicImageClasses (incl : M →+ A) (U : AddSubgroup A)
    [Fintype (M ⧸ U.comap incl)] (Y : Set A) (g : M) (hg : incl g ∈ Y) :
    QuotientAddGroup.mk' (U.comap incl) g ∈ padicImageClasses incl U Y := sorry

-- API (functoriality): monotone in the local point set.
theorem padicImageClasses_mono (incl : M →+ A) (U : AddSubgroup A)
    [Fintype (M ⧸ U.comap incl)] {Y Y' : Set A} (h : Y ⊆ Y') :
    padicImageClasses incl U Y ⊆ padicImageClasses incl U Y' := sorry

-- API (relation): deeper information refines shallower information.
theorem padicImageClasses_refine (incl : M →+ A) {U U' : AddSubgroup A} (hU : U' ≤ U)
    [Fintype (M ⧸ U.comap incl)] [Fintype (M ⧸ U'.comap incl)] (Y : Set A)
    (c : M ⧸ U'.comap incl) (hc : c ∈ padicImageClasses incl U' Y) :
    QuotientAddGroup.map (U'.comap incl) (U.comap incl) (AddMonoidHom.id M)
      (fun x hx => hU hx) c ∈ padicImageClasses incl U Y := sorry

-- Unit tests for padicImageClasses.
-- padicImageClasses_top: with U the whole group, a nonempty local set keeps the unique class.
example (incl : M →+ A) [Fintype (M ⧸ (⊤ : AddSubgroup A).comap incl)] (Y : Set A)
    (hY : Y.Nonempty) : padicImageClasses incl ⊤ Y = Finset.univ := sorry

-- padicImageClasses_empty_points: no local points, no surviving class.
example (incl : M →+ A) (U : AddSubgroup A) [Fintype (M ⧸ U.comap incl)] :
    padicImageClasses incl U ∅ = ∅ := sorry

-- padicImageClasses_mod_four: M = A = ℤ, U = 4ℤ, local points {1}.
example [Fintype (ℤ ⧸ (AddSubgroup.zmultiples (4 : ℤ)).comap (AddMonoidHom.id ℤ))] :
    padicImageClasses (AddMonoidHom.id ℤ) (AddSubgroup.zmultiples 4) {1} =
      {QuotientAddGroup.mk' _ 1} := sorry

-- padicImageClasses_coset_not_point: the class of 1 survives with local points {5}, U = 4ℤ,
-- although 1 is not a local point.
example [Fintype (ℤ ⧸ (AddSubgroup.zmultiples (4 : ℤ)).comap (AddMonoidHom.id ℤ))] :
    QuotientAddGroup.mk' _ 1 ∈
      padicImageClasses (AddMonoidHom.id ℤ) (AddSubgroup.zmultiples 4) {5} := sorry

-- padicImageClasses_good_reduction: with U the kernel of a reduction ρ, membership is the
-- good-reduction test ρ(g) ∈ ρ(Y).
example {J : Type*} [AddCommGroup J] (incl : M →+ A) (ρ : A →+ J)
    [Fintype (M ⧸ ρ.ker.comap incl)] (Y : Set A) (g : M) :
    QuotientAddGroup.mk' (ρ.ker.comap incl) g ∈ padicImageClasses incl ρ.ker Y ↔
      ρ (incl g) ∈ ρ '' Y := sorry

end LocalQuotient

section Geometric

-- ED.5/jacobian-reduction-data: the abstract interface produced by the geometric construction.
-- `P` is the set of rational points (or of rational points of a symmetric power), `M` the
-- Mordell–Weil group or a subgroup containing the image of `aj`, `C k` the residue points and
-- `J k` the group of the reduction at the place `k`.
structure JacobianReductionData (P M : Type*) [AddCommGroup M] {κ : Type*}
    (C : κ → Type*) (J : κ → Type*) [∀ k, AddCommGroup (J k)] where
  /-- The Abel–Jacobi map `P ↦ [P] - c` on rational points. -/
  aj : P → M
  /-- Reduction of rational points. -/
  redPts : ∀ k, P → C k
  /-- The reduction homomorphism. -/
  red : ∀ k, M →+ J k
  /-- The Abel–Jacobi map of the reduction, `R ↦ [R] - c̄`. -/
  ajRes : ∀ k, C k → J k
  /-- The commuting square. -/
  red_aj : ∀ k p, red k (aj p) = ajRes k (redPts k p)

namespace JacobianReductionData

variable {P M : Type*} [AddCommGroup M] {κ : Type*} {C J : κ → Type*}
  [∀ k, AddCommGroup (J k)]

/-- API (data): the local image `X_k = ι_k(C_k)`. -/
def localImage [∀ k, Fintype (C k)] (D : JacobianReductionData P M C J) (k : κ) :
    Finset (J k) := sorry

theorem mem_localImage [∀ k, Fintype (C k)] (D : JacobianReductionData P M C J) (k : κ)
    (x : J k) : x ∈ D.localImage k ↔ ∃ r, D.ajRes k r = x := sorry

theorem red_aj_mem_localImage [∀ k, Fintype (C k)] (D : JacobianReductionData P M C J)
    (k : κ) (p : P) : D.red k (D.aj p) ∈ D.localImage k := sorry

/-- API (data): the Mordell–Weil sieve set `A_S(L)` of the curve. -/
def sieveSet [∀ k, Fintype (C k)] (D : JacobianReductionData P M C J) (S : Finset κ)
    (L : AddSubgroup M) [Fintype (M ⧸ L)] : Finset (M ⧸ L) := sorry

theorem sieveSet_eq [∀ k, Fintype (C k)] (D : JacobianReductionData P M C J) (S : Finset κ)
    (L : AddSubgroup M) [Fintype (M ⧸ L)] :
    D.sieveSet S L = admissibleClasses S L D.red D.localImage := sorry

/-- API (functoriality): compose the local data with homomorphisms of the local groups. -/
def mapLocal {J' : κ → Type*} [∀ k, AddCommGroup (J' k)] (D : JacobianReductionData P M C J)
    (f : ∀ k, J k →+ J' k) : JacobianReductionData P M C J' := sorry

theorem mapLocal_red {J' : κ → Type*} [∀ k, AddCommGroup (J' k)]
    (D : JacobianReductionData P M C J) (f : ∀ k, J k →+ J' k) (k : κ) :
    (D.mapLocal f).red k = (f k).comp (D.red k) := sorry

-- ED.5/curve-sieve-soundness: rational points survive the sieve with any certified supersets.
theorem mk_aj_mem_admissibleClasses [∀ k, Fintype (C k)] (D : JacobianReductionData P M C J)
    (S : Finset κ) (L : AddSubgroup M) [Fintype (M ⧸ L)] (Y : ∀ k, Finset (J k))
    (hY : ∀ k ∈ S, D.localImage k ⊆ Y k) (p : P) :
    QuotientAddGroup.mk' L (D.aj p) ∈ admissibleClasses S L D.red Y := sorry

theorem isEmpty_of_admissibleClasses_eq_empty [∀ k, Fintype (C k)]
    (D : JacobianReductionData P M C J) (S : Finset κ) (L : AddSubgroup M) [Fintype (M ⧸ L)]
    (Y : ∀ k, Finset (J k)) (hY : ∀ k ∈ S, D.localImage k ⊆ Y k)
    (h : admissibleClasses S L D.red Y = ∅) : IsEmpty P := sorry

-- ED.5/chabauty-sieve-combination
-- (i)–(ii): below the kernel at a Chabauty prime the sieve class separates the certified discs.
theorem injOn_mk_aj_of_residue_unique (D : JacobianReductionData P M C J) (k₀ : κ)
    (hinj : Function.Injective (D.ajRes k₀)) (L : AddSubgroup M) (hL : L ≤ (D.red k₀).ker)
    (U : Set (C k₀))
    (huniq : ∀ p q : P, D.redPts k₀ p = D.redPts k₀ q → D.redPts k₀ p ∈ U → p = q) :
    Set.InjOn (fun p => QuotientAddGroup.mk' L (D.aj p)) {p | D.redPts k₀ p ∈ U} := sorry

-- (iii): a residue-class decision by the sieve.
theorem redPts_mem_of_sieve_empty [∀ k, Fintype (C k)] (D : JacobianReductionData P M C J)
    (k₀ : κ) (U : Set (C k₀)) (S : Finset κ) (hk₀ : k₀ ∈ S) (L : AddSubgroup M)
    [Fintype (M ⧸ L)]
    (h : admissibleClasses S L D.red (Function.update D.localImage k₀
      ((Finset.univ.filter (fun r => r ∉ U)).image (D.ajRes k₀))) = ∅) :
    ∀ p, D.redPts k₀ p ∈ U := sorry

-- (iv): completeness of the known points.
theorem mem_known_of_chabauty_sieve [∀ k, Fintype (C k)] (D : JacobianReductionData P M C J)
    (k₀ : κ) (hinj : Function.Injective (D.ajRes k₀)) (L : AddSubgroup M) [Fintype (M ⧸ L)]
    (hL : L ≤ (D.red k₀).ker) (U : Set (C k₀))
    (huniq : ∀ p q : P, D.redPts k₀ p = D.redPts k₀ q → D.redPts k₀ p ∈ U → p = q)
    (S : Finset κ) (W : Finset P) (hout : ∀ p, D.redPts k₀ p ∉ U → p ∈ W)
    (hcover : ∀ a ∈ D.sieveSet S L, ∃ w ∈ W, QuotientAddGroup.mk' L (D.aj w) = a) :
    ∀ p, p ∈ W := sorry

-- ED.5/relative-symmetric-sieve (Caraiani–Newton Theorem 7.4.2 = Box Theorem 2.6).
-- Here `P` is X⁽²⁾(ℚ), `M` the finite-index subgroup G, `aj x = I·([x] - ∞)`.
theorem relative_symmetric_sieve [∀ k, Fintype (C k)] (D : JacobianReductionData P M C J)
    (S : Finset κ) (Lset : Set P) (Lgood : ∀ k, Finset P)
    (hgood : ∀ k ∈ S, ∀ x, ∀ y ∈ Lgood k, D.redPts k x = D.redPts k y → x ∈ Lset)
    (hempty : ¬ ∃ g : M, ∀ k ∈ S, D.red k g ∈
      (Finset.univ.filter (fun r => D.ajRes k r ∈ (D.red k).range ∧
        r ∉ (Lgood k).image (D.redPts k))).image (D.ajRes k)) :
    ∀ x, x ∈ Lset := sorry

-- The same conclusion from an empty finite sieve below the kernels.
theorem relative_symmetric_sieve_of_admissibleClasses [∀ k, Fintype (C k)]
    (D : JacobianReductionData P M C J) (S : Finset κ) (Lset : Set P) (Lgood : ∀ k, Finset P)
    (hgood : ∀ k ∈ S, ∀ x, ∀ y ∈ Lgood k, D.redPts k x = D.redPts k y → x ∈ Lset)
    (L : AddSubgroup M) [Fintype (M ⧸ L)] (hL : ∀ k ∈ S, L ≤ (D.red k).ker)
    (hempty : admissibleClasses S L D.red (fun k =>
      (Finset.univ.filter (fun r => D.ajRes k r ∈ (D.red k).range ∧
        r ∉ (Lgood k).image (D.redPts k))).image (D.ajRes k)) = ∅) :
    ∀ x, x ∈ Lset := sorry

end JacobianReductionData

-- Unit tests for JacobianReductionData.
-- localImage_mod_five: one residue field, two residue points with images 1 and 2 in ℤ/5.
example :
    (JacobianReductionData.mk (C := fun _ : Unit => Fin 2) (J := fun _ : Unit => ZMod 5)
      (fun _ : Unit => (1 : ℤ)) (fun _ _ => 0) (fun _ => Int.castAddHom (ZMod 5))
      (fun _ => (![1, 2] : Fin 2 → ZMod 5)) (by sorry)).localImage () = {1, 2} := sorry

-- sieveSet_no_places: with no places the sieve keeps every class.
example {P M : Type*} [AddCommGroup M] {κ : Type*} {C J : κ → Type*}
    [∀ k, AddCommGroup (J k)] [∀ k, Fintype (C k)] (D : JacobianReductionData P M C J)
    (L : AddSubgroup M) [Fintype (M ⧸ L)] : D.sieveSet ∅ L = Finset.univ := sorry

-- localImage_genus_one: if ι_k is onto (genus one with c = [O]) the local image is everything.
example {P M : Type*} [AddCommGroup M] {κ : Type*} {C J : κ → Type*}
    [∀ k, AddCommGroup (J k)] [∀ k, Fintype (C k)] [∀ k, Fintype (J k)]
    (D : JacobianReductionData P M C J) (k : κ)
    (h : Function.Surjective (D.ajRes k)) : D.localImage k = Finset.univ := sorry

-- localImage_not_known_points: reductions of the known points only are not the local image.
example :
    (({0} : Finset (Fin 2)).image (fun p : Fin 2 =>
      (JacobianReductionData.mk (C := fun _ : Unit => ZMod 2) (J := fun _ : Unit => ZMod 2)
        (fun p : Fin 2 => ((p : ℕ) : ℤ)) (fun _ p => ((p : ℕ) : ZMod 2))
        (fun _ => Int.castAddHom (ZMod 2)) (fun _ => id) (by sorry)).red ()
      (((p : ℕ) : ℤ)))) ≠
    (JacobianReductionData.mk (C := fun _ : Unit => ZMod 2) (J := fun _ : Unit => ZMod 2)
        (fun p : Fin 2 => ((p : ℕ) : ℤ)) (fun _ p => ((p : ℕ) : ZMod 2))
        (fun _ => Int.castAddHom (ZMod 2)) (fun _ => id) (by sorry)).localImage () := sorry

/-- Raw tables at one finite quotient refinement. `project` is represented on class indices;
`allowed` includes all local tests after reducing modulo the image of the new subgroup.
CN.3 supplies invariant-factor presentations and the transport of these tables. -/
structure RawSieveStep (oldSize newSize places : ℕ) where
  project : Fin newSize → Fin oldSize
  allowed : Fin places → Fin newSize → Bool
  oldClasses : Finset (Fin oldSize)
  nextClasses : Finset (Fin newSize)
namespace RawSieveStep
attribute [-instance] Classical.propDecidable
def check {o n k : ℕ} (c : RawSieveStep o n k) : Bool :=
  decide (∀ b : Fin n, b ∈ c.nextClasses ↔
    c.project b ∈ c.oldClasses ∧ ∀ v : Fin k, c.allowed v b = true)
attribute [local instance] Classical.propDecidable
theorem sound {o n k : ℕ} (c : RawSieveStep o n k) (hc : c.check = true) :
    (c.nextClasses : Set (Fin n)) =
      {b | c.project b ∈ c.oldClasses ∧ ∀ v, c.allowed v b = true} := sorry
end RawSieveStep
-- rawSieve_mod_four: both lifts of the surviving mod-two class must be listed.
example : (RawSieveStep.mk (oldSize := 2) (newSize := 4) (places := 0)
  (fun b => ⟨b.val % 2, by omega⟩) Fin.elim0 {1} {1, 3}).check = true := by native_decide
-- rawSieve_missing_lift: keeping only one lift is rejected.
example : (RawSieveStep.mk (oldSize := 2) (newSize := 4) (places := 0)
  (fun b => ⟨b.val % 2, by omega⟩) Fin.elim0 {1} {1}).check = false := by native_decide
-- rawSieve_empty: a false local test rules out every class.
example : (RawSieveStep.mk (oldSize := 1) (newSize := 1) (places := 1)
  id (fun _ _ => false) {0} ∅).check = true := by native_decide

-- ED.5/sieve-certificate: the final certificate.
structure SieveCertificate (P M : Type*) [AddCommGroup M] {κ : Type*} (C J : κ → Type*)
    [∀ k, AddCommGroup (J k)] [∀ k, Fintype (C k)] where
  /-- The geometric reduction data at the chosen places. -/
  data : JacobianReductionData P M C J
  /-- The places used. -/
  primes : Finset κ
  /-- The number of lifting steps. -/
  length : ℕ
  /-- The descending chain of subgroups. -/
  chain : ℕ → AddSubgroup M
  chain_succ_le : ∀ j, chain (j + 1) ≤ chain j
  quotFintype : ∀ j, Fintype (M ⧸ chain j)
  /-- Proposed lifts of the surviving classes. -/
  lifts : ∀ j, M ⧸ chain j → M ⧸ chain (j + 1)
  /-- The places tested at each step. -/
  tests : ℕ → Finset κ
  /-- The known points. -/
  known : Finset P

namespace SieveCertificate

attribute [instance] quotFintype

variable {P M : Type*} [AddCommGroup M] {κ : Type*} {C J : κ → Type*}
  [∀ k, AddCommGroup (J k)] [∀ k, Fintype (C k)]

/-- API (data): the exhaustive candidate set at the end of the chain. -/
def candidates (c : SieveCertificate P M C J) : Finset (M ⧸ c.chain c.length) := sorry

theorem candidates_eq_siftChain (c : SieveCertificate P M C J) :
    c.candidates = siftChain c.primes c.chain c.chain_succ_le c.data.red c.data.localImage
      c.lifts c.tests c.length := sorry

/-- API (other): the checks a verifier runs on the recorded chain. -/
def Checked (c : SieveCertificate P M C J) : Prop :=
  (∀ j < c.length, ∀ a ∈ c.data.sieveSet c.primes (c.chain j),
    QuotientAddGroup.map (c.chain (j + 1)) (c.chain j) (AddMonoidHom.id M)
      (by simpa using c.chain_succ_le j) (c.lifts j a) = a) ∧
  (∀ j < c.length, c.tests j ⊆ c.primes) ∧
  (∀ j < c.length, ∀ k ∈ c.primes, k ∉ c.tests j →
    (c.chain (j + 1)).map (c.data.red k) = (c.chain j).map (c.data.red k))

theorem candidates_eq_sieveSet (c : SieveCertificate P M C J) (hc : c.Checked) :
    c.candidates = c.data.sieveSet c.primes (c.chain c.length) := sorry

theorem mk_aj_mem_candidates (c : SieveCertificate P M C J) (hc : c.Checked) (p : P) :
    QuotientAddGroup.mk' _ (c.data.aj p) ∈ c.candidates := sorry

-- ED.5/sieve-certificate-sound
theorem isEmpty_of_candidates_eq_empty (c : SieveCertificate P M C J) (hc : c.Checked)
    (h : c.candidates = ∅) : IsEmpty P := sorry

theorem mem_known_of_chabauty (c : SieveCertificate P M C J) (hc : c.Checked) (k₀ : κ)
    (hinj : Function.Injective (c.data.ajRes k₀)) (hL : c.chain c.length ≤ (c.data.red k₀).ker)
    (huniq : ∀ p q : P, c.data.redPts k₀ p = c.data.redPts k₀ q → p = q)
    (hcover : ∀ a ∈ c.candidates, ∃ w ∈ c.known, QuotientAddGroup.mk' _ (c.data.aj w) = a) :
    ∀ p, p ∈ c.known := sorry

end SieveCertificate

-- Unit tests for SieveCertificate.
-- candidates_no_steps: no places, no steps, chain ⊤: the single class remains.
example :
    (SieveCertificate.mk (P := Empty) (M := ZMod 2) (C := fun _ : Bool => Unit)
      (J := fun _ : Bool => ZMod 2)
      (JacobianReductionData.mk (fun e => e.elim) (fun _ e => e.elim)
        (fun _ => AddMonoidHom.id (ZMod 2)) (fun b _ => if b then 1 else 0) (fun _ e => e.elim))
      ∅ 0 (fun _ => ⊤) (fun _ => le_rfl) (fun _ => inferInstance) (fun _ => id) (fun _ => ∅)
      ∅).candidates = Finset.univ := sorry

-- candidates_mod_four: one place, identity map on ℤ/4, local image {1}, chain ⊥.
example :
    (SieveCertificate.mk (P := Unit) (M := ZMod 4) (C := fun _ : Unit => Unit)
      (J := fun _ : Unit => ZMod 4)
      (JacobianReductionData.mk (fun _ => 1) (fun _ _ => ()) (fun _ => AddMonoidHom.id (ZMod 4))
        (fun _ _ => 1) (fun _ _ => rfl))
      {()} 0 (fun _ => ⊥) (fun _ => le_rfl) (fun _ => inferInstance)
      (fun _ _ => QuotientAddGroup.mk' _ 0) (fun _ => {()}) {()}).candidates =
      {QuotientAddGroup.mk' _ 1} := sorry

-- candidates_nonempty_without_points: two places with incompatible local images {0} and {1}
-- on ℤ/2 and no points; the unique class at level ⊤ survives, so a nonempty candidate set
-- is an open computation, not a point.
example :
    (SieveCertificate.mk (P := Empty) (M := ZMod 2) (C := fun _ : Bool => Unit)
      (J := fun _ : Bool => ZMod 2)
      (JacobianReductionData.mk (fun e => e.elim) (fun _ e => e.elim)
        (fun _ => AddMonoidHom.id (ZMod 2)) (fun b _ => if b then 1 else 0) (fun _ e => e.elim))
      Finset.univ 0 (fun _ => ⊤) (fun _ => le_rfl) (fun _ => inferInstance) (fun _ => id)
      (fun _ => Finset.univ) ∅).candidates ≠ ∅ := sorry

end Geometric

/-! Genus-two theorems named without a Lean form here (the Cassels–Flynn models are a gap):
* ED.5/kummer-curve-test — `TauCeti.MordellWeilSieve.GenusTwo.mem_range_aj_of_kummer_reductions`,
  Bruin–Stoll Lemma 4.1 with the constant 3 (its arithmetic core is `kummerLineValue_eq_zero`);
* ED.5/genus-two-bad-information — `TauCeti.MordellWeilSieve.GenusTwo.reduction_exact_of_regular`,
  Bruin–Stoll Theorem 5.11, Corollaries 5.14–5.15, Proposition 5.10;
* ED.5/genus-two-deep-information —
  `TauCeti.MordellWeilSieve.GenusTwo.dualKummer_valuation_of_mem_deep`, Bruin–Stoll §6, Lemma 6.2;
* ED.5/small-genus-two-nonexistence —
  `TauCeti.MordellWeilSieve.Examples.smallGenusTwo_noRationalPoints`, Bruin–Stoll §4.1 and §8.
-/

end TauCeti.MordellWeilSieve

end PartED5

/-! ## ED.6 -/

section PartED6

/-
This file is not the roadmap and is not exhaustive. The roadmap document is
definitive. These statements suggest Lean forms so contributors and reviewers
can converge on names and signatures. They do not constitute implementation.

ED.6: explicit higher methods and reproducible examples. Certified solution
sets, the comparison of p-adic candidates with global points, the explicit
quadratic Chabauty formulas of Balakrishnan–Dogra–Müller–Tuitman–Vonk (2019,
2021), the split Cartan curve X_s(13), and the classical worked examples of
Tzanakis–de Weger and de Weger.

Curves of genus ≥ 2, their Jacobians, unipotent isocrystals and p-adic heights
are not in Mathlib; following the ED.5 section they are taken as abstract inputs
(types of points, coordinate rings, local expansions) or reduced to the explicit
linear-algebra data the method computes. Inputs supplied by other roadmaps
(NC.5 quadratic Chabauty pairs, NC.2 universal connections, RD.7 Tuitman data,
GZ.8/HE.7 rank theorems, CN.4 certified L-values) are cited in comments.
-/


open scoped Matrix

namespace TauCeti.EffectiveDiophantine.ED6

/-! ### ED.6/certified-solution-set -/

/-- A certified solution set: a finite set, sound unconditionally and complete under `H`.
`H = True` is the unconditional label; any other `H` is a displayed conditional input. -/
structure CertifiedSolutionSet {α : Type*} (H : Prop) (P : α → Prop) where
  solutions : Finset α
  sound : ∀ x ∈ solutions, P x
  complete : H → ∀ x, P x → x ∈ solutions

namespace CertifiedSolutionSet

variable {α β : Type*} {H H' : Prop} {P : α → Prop}

theorem mem_iff (c : CertifiedSolutionSet H P) (h : H) (x : α) :
    x ∈ c.solutions ↔ P x := sorry

theorem coe_eq_setOf (c : CertifiedSolutionSet H P) (h : H) :
    (c.solutions : Set α) = {x | P x} := sorry

theorem solutions_eq {H₁ H₂ : Prop} (c₁ : CertifiedSolutionSet H₁ P)
    (c₂ : CertifiedSolutionSet H₂ P) (h₁ : H₁) (h₂ : H₂) :
    c₁.solutions = c₂.solutions := sorry

/-- Constructor for an unconditional certificate. -/
def unconditional (S : Finset α) (hsound : ∀ x ∈ S, P x) (hcomplete : ∀ x, P x → x ∈ S) :
    CertifiedSolutionSet True P := sorry

/-- Strengthening the hypotheses keeps the certificate. -/
def mono (c : CertifiedSolutionSet H P) (hH : H' → H) : CertifiedSolutionSet H' P := sorry

/-- Discharging the conditional input. -/
def discharge (c : CertifiedSolutionSet H P) (h : H) : CertifiedSolutionSet True P := sorry

/-- Transport along an equivalence of candidate types. -/
def map (c : CertifiedSolutionSet H P) (e : α ≃ β) (Q : β → Prop) (hQ : ∀ x, P x ↔ Q (e x)) :
    CertifiedSolutionSet H Q := sorry

end CertifiedSolutionSet

-- certifiedSolutionSet_sq_eq_four: for x² = 4 over ℤ every certificate has solutions {−2, 2}.
example (c : CertifiedSolutionSet True (fun x : ℤ => x ^ 2 = 4)) :
    c.solutions = {-2, 2} := sorry

-- certifiedSolutionSet_false: the condition False has only the empty certified set.
example {α : Type*} (H : Prop) (h : H) (c : CertifiedSolutionSet H (fun _ : α => False)) :
    c.solutions = ∅ := sorry

-- certifiedSolutionSet_sound_only: {2} is sound for x² = 4 but not complete.
example : ¬ ∃ c : CertifiedSolutionSet True (fun x : ℤ => x ^ 2 = 4), c.solutions = {2} := sorry

-- certifiedSolutionSet_toFinset: agreement with Mathlib's `Set.Finite.toFinset`.
example {α : Type*} {H : Prop} {P : α → Prop} (c : CertifiedSolutionSet H P) (h : H)
    (hfin : {x | P x}.Finite) : hfin.toFinset = c.solutions := sorry

-- certifiedSolutionSet_vacuous: under H = False every sound finite set is a certificate.
example {α : Type*} {P : α → Prop} (S : Finset α) (hS : ∀ x ∈ S, P x) :
    ∃ c : CertifiedSolutionSet False P, c.solutions = S := sorry

/-! ### ED.6/padic-candidate-comparison -/

/-- Stage acceptance: a finite cover of the p-adic candidate set by balls with at most one
candidate each, every ball matched by a known global point or excluded, gives `R = L`. -/
theorem eq_of_matched_or_excluded {X ι : Type*} (R Z : Set X) (hRZ : R ⊆ Z)
    (B : ι → Set X) (I : Finset ι) (hcover : Z ⊆ ⋃ i ∈ I, B i)
    (huniq : ∀ i ∈ I, (Z ∩ B i).Subsingleton) (L : Finset X) (hL : (L : Set X) ⊆ R)
    (hdec : ∀ i ∈ I, (∃ P ∈ L, P ∈ B i) ∨ R ∩ B i = ∅) :
    R = (L : Set X) := sorry

/-! ### ED.6/qc-disc-certificate -/

/-- A residue-disc certificate: every common zero of the functions `fn i` on `ℤ_[p]` lies
within `p ^ (-prec)` of a centre, and each such ball contains at most one common zero. -/
structure SemanticQCDiscCertificate (p : ℕ) [Fact p.Prime] (ι : Type*) where
  fn : ι → ℤ_[p] → ℚ_[p]
  centres : Finset ℤ_[p]
  prec : ℕ
  covers : ∀ s : ℤ_[p], (∀ i, fn i s = 0) →
    ∃ c ∈ centres, ‖s - c‖ ≤ (p : ℝ) ^ (-(prec : ℤ))
  unique : ∀ c ∈ centres, ∀ s t : ℤ_[p], (∀ i, fn i s = 0) → (∀ i, fn i t = 0) →
    ‖s - c‖ ≤ (p : ℝ) ^ (-(prec : ℤ)) → ‖t - c‖ ≤ (p : ℝ) ^ (-(prec : ℤ)) → s = t

namespace SemanticQCDiscCertificate

variable {p : ℕ} [Fact p.Prime] {ι : Type*}

/-- The common zeros of the certified functions on the disc. -/
def commonZeros (C : SemanticQCDiscCertificate p ι) : Set ℤ_[p] := {s | ∀ i, C.fn i s = 0}

theorem exists_centre (C : SemanticQCDiscCertificate p ι) {s : ℤ_[p]} (hs : s ∈ C.commonZeros) :
    ∃ c ∈ C.centres, ‖s - c‖ ≤ (p : ℝ) ^ (-(C.prec : ℤ)) := sorry

theorem eq_of_mem_ball (C : SemanticQCDiscCertificate p ι) {c s t : ℤ_[p]} (hc : c ∈ C.centres)
    (hs : s ∈ C.commonZeros) (ht : t ∈ C.commonZeros)
    (hsc : ‖s - c‖ ≤ (p : ℝ) ^ (-(C.prec : ℤ))) (htc : ‖t - c‖ ≤ (p : ℝ) ^ (-(C.prec : ℤ))) :
    s = t := sorry

theorem ncard_commonZeros_le (C : SemanticQCDiscCertificate p ι) :
    C.commonZeros.Finite ∧ C.commonZeros.ncard ≤ C.centres.card := sorry

theorem commonZeros_eq_empty (C : SemanticQCDiscCertificate p ι) (h : C.centres = ∅) :
    C.commonZeros = ∅ := sorry

/-- Adding a function to the family keeps the certificate (same centres and precision). -/
def addFunction (C : SemanticQCDiscCertificate p ι) (f : ℤ_[p] → ℚ_[p]) :
    SemanticQCDiscCertificate p (Option ι) := sorry

end SemanticQCDiscCertificate

instance fact_prime_seventeen : Fact (Nat.Prime 17) := ⟨by norm_num⟩
instance fact_prime_eleven : Fact (Nat.Prime 11) := ⟨by norm_num⟩
instance fact_prime_five : Fact (Nat.Prime 5) := ⟨by norm_num⟩

-- qcDisc_linear: f(s) = s − 1 with centres {1} at precision 5 is a certificate.
example : ∃ C : SemanticQCDiscCertificate 17 Unit,
    (∀ s, C.fn () s = (s : ℚ_[17]) - 1) ∧ C.centres = {1} ∧ C.prec = 5 ∧ C.commonZeros = {1} := sorry

-- qcDisc_no_zero: f ≡ 1 is certified by the empty set of centres.
example : ∃ C : SemanticQCDiscCertificate 17 Unit, (∀ s, C.fn () s = 1) ∧ C.centres = ∅ ∧
    C.commonZeros = ∅ := sorry

-- qcDisc_close_roots: the zeros 0 and 17⁶ cannot be separated at precision 5.
example : ¬ ∃ C : SemanticQCDiscCertificate 17 Unit,
    (∀ s, C.fn () s = (s : ℚ_[17]) * ((s : ℚ_[17]) - 17 ^ 6)) ∧ C.centres = {0} ∧
      C.prec = 5 := sorry

-- qcDisc_polynomial_roots: for a polynomial, the zero count is bounded by the degree.
example (F : Polynomial ℤ_[17]) (hF : F ≠ 0) (C : SemanticQCDiscCertificate 17 Unit)
    (hC : ∀ s, C.fn () s = ((F.eval s : ℤ_[17]) : ℚ_[17])) :
    C.commonZeros.ncard ≤ F.natDegree := sorry

/-! ### ED.6/qc-certificate-sound -/

/-- A quadratic Chabauty run on finitely many residue discs: disc parametrisations, one disc
certificate per disc, and the NC.5 output that every point of `R` is a common zero on its disc. -/
structure QCRun (p : ℕ) [Fact p.Prime] (X : Type*) (R : Set X) where
  D : Type
  [instFintype : Fintype D]
  ι : Type
  param : D → ℤ_[p] → X
  cert : D → SemanticQCDiscCertificate p ι
  nc5 : ∀ x ∈ R, ∃ d s, param d s = x ∧ ∀ i, (cert d).fn i s = 0

/-- Every centre of every disc certificate is matched by a point of `S` or excluded from `R`. -/
def QCRun.MatchedOrExcluded {p : ℕ} [Fact p.Prime] {X : Type*} {R : Set X} (run : QCRun p X R)
    (S : Set X) : Prop :=
  ∀ d, ∀ c ∈ (run.cert d).centres,
    (∃ s, run.param d s ∈ S ∧ (∀ i, (run.cert d).fn i s = 0) ∧
        ‖s - c‖ ≤ (p : ℝ) ^ (-((run.cert d).prec : ℤ))) ∨
      (∀ s, ‖s - c‖ ≤ (p : ℝ) ^ (-((run.cert d).prec : ℤ)) → run.param d s ∉ R)

/-- Soundness of a quadratic Chabauty certificate: matched or excluded centres give `R = L`. -/
theorem rationalPoints_eq_of_qcCertificate {p : ℕ} [Fact p.Prime] {X : Type*} {R : Set X}
    (run : QCRun p X R) (L : Finset X) (hL : (L : Set X) ⊆ R)
    (h : run.MatchedOrExcluded (L : Set X)) : R = (L : Set X) := sorry

/-! ### ED.6/explicit-setup -/

/-- The symplectic cup product matrix in the block decomposition
(holomorphic, non-holomorphic). -/
def symplecticCupMatrix (g : ℕ) : Matrix (Fin g ⊕ Fin g) (Fin g ⊕ Fin g) ℚ :=
  Matrix.fromBlocks 0 1 (-1) 0

/-- An admissible Tate matrix: conditions (b)–(d) of BDMTV §4.4 in a symplectic basis whose
first g elements are holomorphic. Condition (a) (Frobenius invariance) is a property of the
base change to `ℚ_[p]` and is not stated here. -/
structure AdmissibleTateMatrix (g : ℕ) where
  Z : Matrix (Fin g ⊕ Fin g) (Fin g ⊕ Fin g) ℚ
  ne_zero : Z ≠ 0
  antisymm : Zᵀ = -Z
  fil : ∀ i j : Fin g, Z (Sum.inr i) (Sum.inr j) = 0
  cup : ∑ i : Fin g, Z (Sum.inl i) (Sum.inr i) = 0

namespace AdmissibleTateMatrix

theorem transpose_eq_neg {g : ℕ} (A : AdmissibleTateMatrix g) : A.Zᵀ = -A.Z := sorry

theorem lowerRight_eq_zero {g : ℕ} (A : AdmissibleTateMatrix g) (i j : Fin g) :
    A.Z (Sum.inr i) (Sum.inr j) = 0 := sorry

theorem trace_cup_eq_zero {g : ℕ} (A : AdmissibleTateMatrix g) :
    (A.Z * (symplecticCupMatrix g)ᵀ).trace = 0 := sorry

/-- The linear conditions (b)–(d) cut out a ℚ-subspace. -/
def linearConditions (g : ℕ) : Submodule ℚ (Matrix (Fin g ⊕ Fin g) (Fin g ⊕ Fin g) ℚ) := sorry

end AdmissibleTateMatrix

/-- The linear-algebra shadow of the explicit set-up: residues of the d − 1 third-kind
differentials at the d points of D (over L), the cup product matrix, and the Tate class. -/
structure ExplicitSetup (L : Type*) [Field L] [Algebra ℚ L] (g d : ℕ) where
  residues : Matrix (Fin d) (Fin (d - 1)) L
  residues_sum : ∀ k, ∑ x, residues x k = 0
  residues_rank : residues.rank = d - 1
  cupMatrix : Matrix (Fin g ⊕ Fin g) (Fin g ⊕ Fin g) ℚ
  cupMatrix_symplectic : cupMatrix = symplecticCupMatrix g
  tate : AdmissibleTateMatrix g

namespace ExplicitSetup

variable {L : Type*} [Field L] [Algebra ℚ L] {g d : ℕ}

theorem residue_injective (S : ExplicitSetup L g d) (c : Fin (d - 1) → L)
    (hc : S.residues *ᵥ c = 0) : c = 0 := sorry

theorem cupMatrix_eq (S : ExplicitSetup L g d) : S.cupMatrix = symplecticCupMatrix g := sorry

/-! ### ED.6/explicit-connection -/

/-- Lemma 4.10 in linear-algebra form: residue data with total residue zero determine the
coefficients of η uniquely. -/
theorem eta_existsUnique (S : ExplicitSetup L g d) (r : Fin d → L) (hr : ∑ x, r x = 0) :
    ∃! c : Fin (d - 1) → L, S.residues *ᵥ c = r := sorry

end ExplicitSetup

/-- The blocks of Z1 of BDMTV p.931 (rows of the 6 × 6 matrix, holomorphic block first). -/
def xs13Z1 : Matrix (Fin 3 ⊕ Fin 3) (Fin 3 ⊕ Fin 3) ℚ :=
  Matrix.fromBlocks !![0, -976, -1104; 976, 0, -816; 1104, 816, 0]
    !![10, -6, 18; -3, 1, 3; -3, 3, -11] !![-10, 3, 3; 6, -1, -3; -18, -3, 11] 0

/-- The blocks of Z2 of BDMTV p.931. -/
def xs13Z2 : Matrix (Fin 3 ⊕ Fin 3) (Fin 3 ⊕ Fin 3) ℚ :=
  Matrix.fromBlocks !![0, 112, -656; -112, 0, -2576; 656, 2576, 0]
    !![-6, 6, 6; 15, 9, 27; 3, 3, -3] !![6, -15, -3; -6, -9, -3; -6, -27, 3] 0

-- admissibleTate_xs13_Z1: Z1 is antisymmetric, has zero lower-right block and cup sum 0.
example : ∃ A : AdmissibleTateMatrix 3, A.Z = xs13Z1 := sorry

-- admissibleTate_zero: the zero matrix is excluded.
example (g : ℕ) : ¬ ∃ A : AdmissibleTateMatrix g, A.Z = 0 := sorry

-- admissibleTate_symmetric: a symmetric nonzero matrix fails antisymmetry.
example : ¬ ∃ A : AdmissibleTateMatrix 1, A.Z = Matrix.fromBlocks 0 1 1 0 := sorry

-- explicitSetup_cupMatrix_g1: for g = 1 the cup product matrix is the standard form.
example : symplecticCupMatrix 1 (Sum.inl 0) (Sum.inr 0) = 1 ∧
    symplecticCupMatrix 1 (Sum.inr 0) (Sum.inl 0) = -1 := sorry

/-! ### ED.6/gauge-transformation and ED.6/transport-matrices -/

/-- Index type of the mixed extension `Q ⊕ V ⊕ Q(1)` with `dim V = n`. -/
abbrev MixIdx (n : ℕ) := Unit ⊕ (Fin n ⊕ Unit)

variable {R : Type*} [CommRing R] {n : ℕ}

/-- The unipotent matrix `[[1,0,0],[α,1,0],[γ,βᵀ,1]]`. -/
def unipotentMatrix (α β : Fin n → R) (γ : R) : Matrix (MixIdx n) (MixIdx n) R := sorry

/-- The gauge transformation `C_x = [[1,0,0],[Ω,1,0],[g,ΩᵀZ,1]]`. -/
def gaugeMatrix (Ω : Fin n → R) (gx : R) (Z : Matrix (Fin n) (Fin n) R) :
    Matrix (MixIdx n) (MixIdx n) R := sorry

/-- The connection matrix `Λ = −[[0,0,0],[ω,0,0],[η,ωᵀZ,0]]` (coefficients of dt). -/
def connectionMatrix (ω : Fin n → R) (η : R) (Z : Matrix (Fin n) (Fin n) R) :
    Matrix (MixIdx n) (MixIdx n) R := sorry

theorem gaugeMatrix_inv (Ω : Fin n → R) (gx : R) (Z : Matrix (Fin n) (Fin n) R)
    (hZ : Zᵀ = -Z) (hZd : ∀ i, Z i i = 0) :
    (gaugeMatrix Ω gx Z)⁻¹ = unipotentMatrix (-Ω) (-(Ω ᵥ* Z)) (-gx) := sorry

theorem gaugeMatrix_det (Ω : Fin n → R) (gx : R) (Z : Matrix (Fin n) (Fin n) R) :
    (gaugeMatrix Ω gx Z).det = 1 := sorry

theorem gaugeMatrix_gauge_iff [Algebra ℚ R] (D : Derivation ℚ R R) (Ω ω : Fin n → R)
    (gx η : R) (Z : Matrix (Fin n) (Fin n) R) (hZ : Zᵀ = -Z) (hDZ : ∀ i j, D (Z i j) = 0) :
    (gaugeMatrix Ω gx Z)⁻¹ * (gaugeMatrix Ω gx Z).map ⇑D = connectionMatrix ω η Z ↔
      (∀ i, D (Ω i) = -ω i) ∧ D gx = ∑ i, (Ω ᵥ* Z) i * D (Ω i) - η := sorry

theorem gaugeMatrix_shift (Ω c : Fin n → R) (gx e : R) (Z : Matrix (Fin n) (Fin n) R) :
    gaugeMatrix (Ω + c) (gx + ∑ i, (c ᵥ* Z) i * Ω i + e) Z =
      unipotentMatrix c (c ᵥ* Z) e * gaugeMatrix Ω gx Z := sorry

-- gaugeMatrix_zero: the trivial gauge is the identity.
example (Z : Matrix (Fin n) (Fin n) R) : gaugeMatrix (0 : Fin n → R) 0 Z = 1 := sorry

-- gaugeMatrix_g1_inverse: explicit inverse for g = 1.
example (a b c : ℚ) :
    gaugeMatrix ![a, b] c !![0, 1; -1, 0] *
      unipotentMatrix (-![a, b]) (-(![a, b] ᵥ* !![0, 1; -1, 0])) (-c) = 1 := sorry

-- gaugeMatrix_sign_convention: with DΩ = +ω (the 2021 convention) the gauge equation fails.
example [Algebra ℚ R] (D : Derivation ℚ R R) (Ω ω : Fin n → R) (gx η : R)
    (Z : Matrix (Fin n) (Fin n) R) (hω : ω ≠ 0) (hD : ∀ i, D (Ω i) = ω i) :
    (gaugeMatrix Ω gx Z)⁻¹ * (gaugeMatrix Ω gx Z).map ⇑D ≠ connectionMatrix ω η Z := sorry

-- gaugeMatrix_unipotent: C − 1 is nilpotent of order 3.
example (Ω : Fin n → R) (gx : R) (Z : Matrix (Fin n) (Fin n) R) :
    (gaugeMatrix Ω gx Z - 1) ^ 3 = 0 := sorry

/-- Elements `(a, b, c)` of the algebra `Q ⊕ V ⊕ Q(1)`. -/
structure MixElt (R : Type*) (n : ℕ) where
  a : R
  b : Fin n → R
  c : R

/-- The product `(a,b,c)(a',b',c') = (aa', ab' + a'b, ac' + a'c + bᵀZb')`. -/
def MixElt.mul (Z : Matrix (Fin n) (Fin n) R) (u v : MixElt R n) : MixElt R n :=
  ⟨u.a * v.a, u.a • v.b + v.a • u.b, u.a * v.c + v.a * u.c + (u.b ᵥ* Z) ⬝ᵥ v.b⟩

/-- Coordinates in the basis `1, T_0, …, T_{n−1}, S`. -/
def MixElt.toVec (u : MixElt R n) : MixIdx n → R := sorry

/-- `L(u) = [[a,0,0],[b,a·1,0],[c,bᵀZ,a]]` for `u = (a,b,c)`: the matrix of `v ↦ u·v` in the basis
`1, T_0, …, T_{n−1}, S`. -/
def leftMulMatrix (Z : Matrix (Fin n) (Fin n) R) (u : MixElt R n) :
    Matrix (MixIdx n) (MixIdx n) R := sorry

/-- `R(u) = [[a,0,0],[b,a·1,0],[c,−bᵀZ,a]]` for `u = (a,b,c)`; when `Zᵀ = −Z` this is the matrix of
`v ↦ v·u`. -/
def rightMulMatrix (Z : Matrix (Fin n) (Fin n) R) (u : MixElt R n) :
    Matrix (MixIdx n) (MixIdx n) R := sorry

theorem leftMulMatrix_mul (Z : Matrix (Fin n) (Fin n) R) (u v : MixElt R n) :
    leftMulMatrix Z (MixElt.mul Z u v) = leftMulMatrix Z u * leftMulMatrix Z v := sorry

theorem rightMulMatrix_mul (Z : Matrix (Fin n) (Fin n) R) (hZ : Zᵀ = -Z) (u v : MixElt R n) :
    rightMulMatrix Z (MixElt.mul Z u v) = rightMulMatrix Z v * rightMulMatrix Z u := sorry

theorem leftMul_rightMul_comm (Z : Matrix (Fin n) (Fin n) R) (hZ : Zᵀ = -Z) (u v : MixElt R n) :
    leftMulMatrix Z u * rightMulMatrix Z v = rightMulMatrix Z v * leftMulMatrix Z u := sorry

/-- The matrix of `v ↦ I(x₀,x) · v · I(b,b₀)` (orientation as corrected in E3). -/
def transportMatrix (Z : Matrix (Fin n) (Fin n) R) (Ixx Ibb : MixElt R n) :
    Matrix (MixIdx n) (MixIdx n) R :=
  leftMulMatrix Z Ixx * rightMulMatrix Z Ibb

theorem mulVec_leftMulMatrix (Z : Matrix (Fin n) (Fin n) R) (u v : MixElt R n) :
    leftMulMatrix Z u *ᵥ v.toVec = (MixElt.mul Z u v).toVec := sorry

-- leftMulMatrix_one: multiplication by the unit is the identity.
example (Z : Matrix (Fin n) (Fin n) R) :
    leftMulMatrix Z ⟨1, 0, 0⟩ = 1 ∧ rightMulMatrix Z ⟨1, 0, 0⟩ = 1 := sorry

-- leftMulMatrix_g1: products in the algebra for n = 2 and the standard form.
example : MixElt.mul !![(0 : ℚ), 1; -1, 0] ⟨1, ![1, 0], 0⟩ ⟨1, ![0, 1], 0⟩ =
      ⟨1, ![1, 1], 1⟩ ∧
    MixElt.mul !![(0 : ℚ), 1; -1, 0] ⟨1, ![0, 1], 0⟩ ⟨1, ![1, 0], 0⟩ = ⟨1, ![1, 1], -1⟩ := sorry

-- rightMulMatrix_symmetric_nonexample: the formula for R(u) needs antisymmetry.
example : rightMulMatrix (1 : Matrix (Fin 1) (Fin 1) ℚ) ⟨1, ![1], 0⟩ *ᵥ
      (⟨0, ![1], 0⟩ : MixElt ℚ 1).toVec ≠
    (MixElt.mul (1 : Matrix (Fin 1) (Fin 1) ℚ) ⟨0, ![1], 0⟩ ⟨1, ![1], 0⟩).toVec := sorry

-- transport_orientation: the (2,1) block of transportMatrix Z I(x₀,x) I(b,b₀) applied to I(b₀,x₀)
-- is the composed first-order part ∫_{x₀}^x ω + ∫_{b₀}^{x₀} ω + ∫_b^{b₀} ω.
example (Z : Matrix (Fin n) (Fin n) R) (w₁ w₂ w₃ : Fin n → R) (c₁ c₂ c₃ : R) (i : Fin n) :
    (transportMatrix Z ⟨1, w₁, c₁⟩ ⟨1, w₃, c₃⟩ *ᵥ (⟨1, w₂, c₂⟩ : MixElt R n).toVec)
        (Sum.inr (Sum.inl i)) = w₁ i + w₂ i + w₃ i := sorry

/-! ### ED.6/hodge-filtration-explicit and ED.6/hodge-filtration-algorithm -/

/-- A Laurent series is regular when it has no terms of negative degree. -/
def IsRegularLaurent {L : Type*} [Field L] (f : LaurentSeries L) : Prop :=
  ∀ m : ℤ, m < 0 → f.coeff m = 0

/-- Output of the Hodge filtration algorithm: coefficients of η in the third-kind
differentials, `b_Fil`, and `γ_Fil` in the coordinate ring `A` of the affine chart. -/
structure HodgeFiltrationData (L A : Type*) [Field L] [CommRing A] (g d : ℕ) where
  etaCoeff : Fin (d - 1) → L
  bFil : Fin g → L
  gammaFil : A

namespace HodgeFiltrationData

variable {L A : Type*} [Field L] [CommRing A] {g d : ℕ} {ι : Type*} [Fintype ι]

/-- The residue condition (30). -/
def ResidueCondition (H : HodgeFiltrationData L A g d) (res : Matrix ι (Fin (d - 1)) L)
    (target : ι → L) : Prop :=
  res *ᵥ H.etaCoeff = target

/-- The regularity condition (32): `γ_Fil(b) = 0` and
`g_x + γ_Fil − b_Filᵀ Nᵀ Ω_x − Ω_xᵀ Z N Nᵀ Ω_x` regular at every point at infinity. -/
def RegularCondition (H : HodgeFiltrationData L A g d) (expand : ι → A →+* LaurentSeries L)
    (evalBase : A →+* L) (gx quad : ι → LaurentSeries L) (lin : ι → Fin g → LaurentSeries L) :
    Prop :=
  evalBase H.gammaFil = 0 ∧
    ∀ x, IsRegularLaurent (gx x + expand x H.gammaFil -
      ∑ i, HahnSeries.C (H.bFil i) * lin x i - quad x)

/-- `β_Fil = (0, b_Fil)`. -/
def betaFil (H : HodgeFiltrationData L A g d) : Fin g ⊕ Fin g → L := Sum.elim 0 H.bFil

/-- Scaling the Tate class scales the data. -/
def smul [Algebra L A] (H : HodgeFiltrationData L A g d) (t : L) :
    HodgeFiltrationData L A g d :=
  ⟨t • H.etaCoeff, t • H.bFil, algebraMap L A t * H.gammaFil⟩

/-- Uniqueness: the data are determined by the two conditions, given that functions regular
at every point at infinity are constants and that the classes of the non-holomorphic
second-kind differentials are independent modulo `Fil¹` (`hind`). -/
theorem ext_of_conditions (H H' : HodgeFiltrationData L A g d) (res : Matrix ι (Fin (d - 1)) L)
    (target : ι → L) (expand : ι → A →+* LaurentSeries L) (evalBase : A →+* L)
    (gx quad : ι → LaurentSeries L) (lin : ι → Fin g → LaurentSeries L)
    (hres : Function.Injective (res *ᵥ ·))
    (hconst : ∀ a : A, (∀ x, IsRegularLaurent (expand x a)) → evalBase a = 0 → a = 0)
    (hind : ∀ (a : A) (b : Fin g → L),
      (∀ x, IsRegularLaurent (expand x a - ∑ i, HahnSeries.C (b i) * lin x i)) → b = 0)
    (h₁ : H.ResidueCondition res target) (h₂ : H'.ResidueCondition res target)
    (h₃ : H.RegularCondition expand evalBase gx quad lin)
    (h₄ : H'.RegularCondition expand evalBase gx quad lin) : H = H' := sorry

end HodgeFiltrationData

/-- BDMTV Theorem 4.11 (i) in the shadow form: existence and uniqueness of
`(γ_Fil, b_Fil)`, the surjectivity hypothesis `hsurj` being the Mittag-Leffler/Riemann–Roch
input `H¹_dR / Fil¹ ≅ H¹(X, 𝒪)` (NC.2). -/
theorem hodgeFiltration_basis {L A : Type*} [Field L] [CommRing A] {g : ℕ} {ι : Type*}
    [Fintype ι] (expand : ι → A →+* LaurentSeries L) (evalBase : A →+* L)
    (gx quad : ι → LaurentSeries L) (lin : ι → Fin g → LaurentSeries L)
    (hconst : ∀ a : A, (∀ x, IsRegularLaurent (expand x a)) → evalBase a = 0 → a = 0)
    (hind : ∀ (a : A) (b : Fin g → L),
      (∀ x, IsRegularLaurent (expand x a - ∑ i, HahnSeries.C (b i) * lin x i)) → b = 0)
    (hsurj : ∀ r : ι → LaurentSeries L, ∃ (a : A) (b : Fin g → L), evalBase a = 0 ∧
      ∀ x, IsRegularLaurent (r x + expand x a - ∑ i, HahnSeries.C (b i) * lin x i)) :
    ∃! p : A × (Fin g → L), evalBase p.1 = 0 ∧
      ∀ x, IsRegularLaurent (gx x + expand x p.1 - ∑ i, HahnSeries.C (p.2 i) * lin x i - quad x) :=
  sorry

-- hodgeData_xs13_Z1_beta: OMITTED (§13). The finite Laurent replay on the actual
-- affine coordinate ring is missing; accepting href₁/href₂ as inputs would assume the answer.

-- hodgeData_zero: for Z = 0 the residue targets, the principal parts g_x and the quadratic terms
-- vanish, and the unique data satisfying (30) and (32) are η = 0, b_Fil = 0, γ_Fil = 0.
example {L A : Type*} [Field L] [CommRing A] {g d : ℕ} {ι : Type*} [Fintype ι]
    (H : HodgeFiltrationData L A g d) (res : Matrix ι (Fin (d - 1)) L)
    (expand : ι → A →+* LaurentSeries L) (evalBase : A →+* L) (lin : ι → Fin g → LaurentSeries L)
    (hres : Function.Injective (res *ᵥ ·))
    (hconst : ∀ a : A, (∀ x, IsRegularLaurent (expand x a)) → evalBase a = 0 → a = 0)
    (hind : ∀ (a : A) (b : Fin g → L),
      (∀ x, IsRegularLaurent (expand x a - ∑ i, HahnSeries.C (b i) * lin x i)) → b = 0)
    (h₁ : H.ResidueCondition res 0) (h₂ : H.RegularCondition expand evalBase 0 0 lin) :
    H.etaCoeff = 0 ∧ H.bFil = 0 ∧ H.gammaFil = 0 := sorry

-- hodgeData_printed_step_nonexample: the printed sign gives −η.
example {L A : Type*} [Field L] [CharZero L] [CommRing A] {g d : ℕ} {ι : Type*} [Fintype ι]
    (H H' : HodgeFiltrationData L A g d) (res : Matrix ι (Fin (d - 1)) L) (target : ι → L)
    (hres : Function.Injective (res *ᵥ ·)) (h : H.ResidueCondition res target)
    (h' : H'.ResidueCondition res (-target)) (ht : target ≠ 0) :
    H'.etaCoeff = -H.etaCoeff ∧ H'.etaCoeff ≠ H.etaCoeff := sorry

-- hodgeData_linear: the residue condition is additive in the Tate class.
example {L A : Type*} [Field L] [CommRing A] {g d : ℕ} {ι : Type*} [Fintype ι]
    (H₁ H₂ : HodgeFiltrationData L A g d) (res : Matrix ι (Fin (d - 1)) L) (t₁ t₂ : ι → L)
    (h₁ : H₁.ResidueCondition res t₁) (h₂ : H₂.ResidueCondition res t₂) :
    res *ᵥ (H₁.etaCoeff + H₂.etaCoeff) = t₁ + t₂ := sorry

/-! ### ED.6/frobenius-structure-matrix, frobenius-equivariant-splitting, local-height-at-p,
base-point-change

These are statements about overconvergent functions on a strict neighbourhood of a tube;
their algebraic core is stated on an abstract differential ring `A` over `ℚ_[p]` carrying the
data `F, f, g, h` of BDMTV (45), supplied by RD.7. -/

/-- The inverse Frobenius structure `G = [[1,0,0],[f,F,0],[h,gᵀ,p]]`. -/
def frobeniusStructureMatrix {A : Type*} [CommRing A] {m : ℕ} (F : Matrix (Fin m) (Fin m) A)
    (f g : Fin m → A) (h p : A) : Matrix (MixIdx m) (MixIdx m) A := sorry

/-- BDMTV (45): the block equations of `Λ_φ G + dG = GΛ` for `G = [[1,0,0],[f,F,0],[h,gᵀ,p]]`,
using `Fᵀ Z F = p Z`. -/
theorem frobeniusStructure_eq {A : Type*} [CommRing A] [Algebra ℚ A] {m : ℕ}
    (D : Derivation ℚ A A) (F Z : Matrix (Fin m) (Fin m) A) (p : A)
    (hDF : ∀ i j, D (F i j) = 0) (hDZ : ∀ i j, D (Z i j) = 0) (hDp : D p = 0)
    (hZ : Zᵀ = -Z) (hFZ : Fᵀ * Z * F = p • Z)
    (ω φω f g : Fin m → A) (η φη h : A) (hf : ∀ i, φω i = (F *ᵥ ω) i + D (f i)) :
    connectionMatrix φω φη Z * frobeniusStructureMatrix F f g h p +
        (frobeniusStructureMatrix F f g h p).map ⇑D =
      frobeniusStructureMatrix F f g h p * connectionMatrix ω η Z ↔
    (∀ j, D (g j) = ((fun i => D (f i)) ᵥ* (Z * F)) j) ∧
      D h = (F *ᵥ ω) ⬝ᵥ (Z *ᵥ f) + (fun i => D (f i)) ⬝ᵥ (Z *ᵥ f) - g ⬝ᵥ ω + φη - p * η :=
  sorry

/-- The Frobenius-equivariant splitting at a Teichmüller point: the unipotent matrix
`[[1,0,0],[(I−F)⁻¹f,1,0],[(gᵀ(I−F)⁻¹f + h)/(1−p), gᵀ(F−p)⁻¹, 1]]` conjugates `G(x₀)⁻¹` to
`diag(1, F, p)`. -/
theorem frobeniusSplitting_eq {p : ℕ} [Fact p.Prime] {m : ℕ} (F : Matrix (Fin m) (Fin m) ℚ_[p])
    (hF₁ : IsUnit (1 - F).det) (hFp : IsUnit (F - (p : ℚ_[p]) • 1).det)
    (f g : Fin m → ℚ_[p]) (h : ℚ_[p]) :
    ∃! t : (Fin m → ℚ_[p]) × (Fin m → ℚ_[p]) × ℚ_[p], (1 - F) *ᵥ t.1 = f ∧
      t.2.1 ᵥ* (F - (p : ℚ_[p]) • 1) = g ∧ (1 - (p : ℚ_[p])) * t.2.2 = g ⬝ᵥ t.1 + h := sorry

/-- BDMTV Lemma 5.5: the local height at p from the Hodge and Frobenius data. -/
def localHeight {p : ℕ} [Fact p.Prime] {m : ℕ} (χp : ℚ_[p] →+ ℚ_[p])
    (s₁ s₂ : Matrix (Fin m) (Fin m) ℚ_[p]) (αφ βφ βFil : Fin m → ℚ_[p]) (γφ γFil : ℚ_[p]) :
    ℚ_[p] :=
  χp (γφ - γFil - βφ ⬝ᵥ (s₁ *ᵥ αφ) - βFil ⬝ᵥ (s₂ *ᵥ αφ))

/-- BDMTV (15), (17) and Lemma 5.5: Nekovář's `h_p(M) = χ_p([M] − δ([E₁]))`. In the `s₀`-coordinates
`E₂ = V_dR ⊕ ℚ_p(1)` given by (16), `[M] = s^φ(1) − s^Fil(1) = (α_φ, γ_φ − γ_Fil)`, the class
`[E₁] = α_φ mod Fil⁰` is sent by `δ` (the splitting `s = s₁`, then the Frobenius-equivariant
splitting `v ↦ (v, β_φᵀv)` of `E₂`) to `(s₁α_φ, β_φᵀ s₁α_φ)`, and `Fil⁰E₂ = {(v, β_Filᵀv) : v ∈ Fil⁰ = im s₂}`.
The `ℚ_p(1)`-component `t` of `[M] − δ([E₁])` modulo `Fil⁰E₂` is unique and `χ_p(t)` is
`localHeight`. -/
theorem localHeight_eq {p : ℕ} [Fact p.Prime] {m : ℕ} (χp : ℚ_[p] →+ ℚ_[p])
    (s₁ s₂ : Matrix (Fin m) (Fin m) ℚ_[p]) (hs : s₁ + s₂ = 1) (hs₂ : s₂ * s₂ = s₂)
    (αφ βφ βFil : Fin m → ℚ_[p]) (γφ γFil : ℚ_[p]) :
    (∃! t : ℚ_[p], ∃ v : Fin m → ℚ_[p], s₂ *ᵥ v = v ∧
      (αφ, γφ - γFil) - (s₁ *ᵥ αφ, βφ ⬝ᵥ (s₁ *ᵥ αφ)) - (0, t) = (v, βFil ⬝ᵥ v)) ∧
    ∀ t : ℚ_[p], (∃ v : Fin m → ℚ_[p], s₂ *ᵥ v = v ∧
      (αφ, γφ - γFil) - (s₁ *ᵥ αφ, βφ ⬝ᵥ (s₁ *ᵥ αφ)) - (0, t) = (v, βFil ⬝ᵥ v)) →
      χp t = localHeight χp s₁ s₂ αφ βφ βFil γφ γFil := sorry

/-- BDMTV Lemma 5.7 (matrix form): `L(I(b,b')) · R(I(b,b'))⁻¹` applied to the base-point
splitting `[[1,0,0],[0,1,0],[0,β_φᵀ,1]]` gives `[[1,0,0],[0,1,0],[0,β_φᵀ + 2∫ωᵀZ,1]]`. -/
theorem baseChange_splitting_eq {m : ℕ} (Z : Matrix (Fin m) (Fin m) R) (hZ : Zᵀ = -Z)
    (w : Fin m → R) (c : R) (βφ : Fin m → R) (hI : IsUnit (rightMulMatrix Z ⟨1, w, c⟩).det) :
    leftMulMatrix Z ⟨1, w, c⟩ * (rightMulMatrix Z ⟨1, w, c⟩)⁻¹ * unipotentMatrix 0 βφ 0 =
      unipotentMatrix 0 (βφ + 2 • (w ᵥ* Z)) 0 := sorry

/-! ### ED.6/height-series-valuation-bound and ED.6/root-determination-precision -/

/-- The formal primitive `∫F` of a power series, vanishing at `t = 0`. -/
def formalPrimitive {K : Type*} [Field K] (F : PowerSeries K) : PowerSeries K :=
  PowerSeries.mk fun n => if n = 0 then 0 else PowerSeries.coeff (n - 1) F / n

/-- BDMTV 2019 §6.4.1: for `F₁, …, F_m ∈ ℤ_p[[t]]` and
`G = Σ a_ij ∫F_i(∫F_j) + Σ a_i ∫F_i + Σ b_i F_i` with `a_ij, a_i, b_i ∈ ℚ_p` of valuation `≥ v`,
the `n`-th coefficient of `G` has valuation `≥ v − 2⌊log_p n⌋` for `n ≥ 1`. -/
theorem valuation_coeff_ge (p : ℕ) [Fact p.Prime] {m : ℕ} (F : Fin m → PowerSeries ℤ_[p])
    (a : Fin m → Fin m → ℚ_[p]) (a₁ b : Fin m → ℚ_[p]) (v : ℤ)
    (ha : ∀ i j, a i j ≠ 0 → v ≤ (a i j).valuation) (ha₁ : ∀ i, a₁ i ≠ 0 → v ≤ (a₁ i).valuation)
    (hb : ∀ i, b i ≠ 0 → v ≤ (b i).valuation) (n : ℕ) (hn : 1 ≤ n)
    (hc : PowerSeries.coeff n
      (∑ i, ∑ j, a i j • formalPrimitive (PowerSeries.map (PadicInt.Coe.ringHom) (F i) *
          formalPrimitive (PowerSeries.map (PadicInt.Coe.ringHom) (F j))) +
        ∑ i, a₁ i • formalPrimitive (PowerSeries.map (PadicInt.Coe.ringHom) (F i)) +
        ∑ i, b i • PowerSeries.map (PadicInt.Coe.ringHom) (F i)) ≠ 0) :
    v - 2 * (Nat.log p n : ℤ) ≤ (PowerSeries.coeff n
      (∑ i, ∑ j, a i j • formalPrimitive (PowerSeries.map (PadicInt.Coe.ringHom) (F i) *
          formalPrimitive (PowerSeries.map (PadicInt.Coe.ringHom) (F j))) +
        ∑ i, a₁ i • formalPrimitive (PowerSeries.map (PadicInt.Coe.ringHom) (F i)) +
        ∑ i, b i • PowerSeries.map (PadicInt.Coe.ringHom) (F i))).valuation := sorry

/-- BDMTV 2021 Lemma 4.7: roots in the disc `ord_p(x) ≥ 1` are determined to precision
`(n − k)/d` by the first `m` coefficients modulo `p^n`. Stated as its first step: a root of `F` in the
disc is a root of the truncation `F_0 + ⋯ + F_{m−1}x^{m−1}` modulo `p^n`. The hypotheses are
`min_i {ord_p(F_i) + i} = k` (`hk`, `hkmin`) and `max {i : ord_p(F_i) + i < n} < m` (`hm`); the printed
`max {i : ord_p(F_i) + i = n} < m` does not make the tail vanish modulo `p^n` (for `F = p² − p x`,
`n = 5`, `m = 1` the truncation `p²` is not `0` mod `p⁵` at the root `x = p`). -/
theorem root_satisfies_truncation_congruence (p : ℕ) [Fact p.Prime] (F : PowerSeries ℚ_[p])
    (Fval : ℤ_[p] → ℚ_[p])
    (hFval : ∀ s : ℤ_[p], HasSum (fun i => PowerSeries.coeff i F * ((p : ℚ_[p]) * s) ^ i) (Fval s))
    (k : ℤ) (m n : ℕ)
    (hk : ∀ i, PowerSeries.coeff i F ≠ 0 → k ≤ Padic.valuation (PowerSeries.coeff i F) + (i : ℤ))
    (hkmin : ∃ i, PowerSeries.coeff i F ≠ 0 ∧ Padic.valuation (PowerSeries.coeff i F) + (i : ℤ) = k)
    (hm : ∀ i, PowerSeries.coeff i F ≠ 0 →
      Padic.valuation (PowerSeries.coeff i F) + (i : ℤ) < n → i < m)
    (s : ℤ_[p]) (hs : Fval s = 0) :
    ‖∑ i ∈ Finset.range m, PowerSeries.coeff i F * ((p : ℚ_[p]) * s) ^ i‖ ≤
      (p : ℝ) ^ (-(n : ℤ)) := sorry

/-! ### ED.6/qc-modular-algorithm -/

/-- The failure outputs of BDMTV 2021 Algorithm 3.12. -/
inductive QCFailure
  | noIntegralSymplecticBasis
  | heightPairingUnsolved
  | precisionLoss
  | multipleRootAtKnownPoint
  deriving DecidableEq

/-- Output: FAIL with a reason, or candidates known to precision `prec`. -/
inductive QCOutput (P : Type*)
  | fail (r : QCFailure)
  | candidates (A : Finset P) (prec : ℕ)

/-- The input record. `X` is the type of `ℚ_p`-points, `rational` the global points,
`covered` the union of the residue discs covered by the patches, and `red` the reduction of a
point to the precision of the output. The rank and Tate-class hypotheses are inputs certified
elsewhere (GZ.8, HE.7, NC.5) and are not encoded as fields. -/
structure QCInput (X P : Type*) where
  p : ℕ
  startPrec : ℕ
  heightBound : ℕ
  patches : List (MvPolynomial (Fin 2) ℚ)
  rational : Set X
  covered : Set X
  red : X → P
  known : Finset X

/-- The algorithm as a function of its input. -/
def qcAlgorithm {X P : Type*} (I : QCInput X P) : QCOutput P := sorry

theorem QCOutput.candidates_sound {X P : Type*} (I : QCInput X P) (A : Finset P) (n : ℕ)
    (h : qcAlgorithm I = .candidates A n) : ∀ x ∈ I.rational ∩ I.covered, I.red x ∈ A := sorry

/-- From a candidates output with every candidate matched or excluded, the certified set. -/
def QCOutput.toCertifiedSolutionSet {X P : Type*} (I : QCInput X P) (A : Finset P) (n : ℕ)
    (h : qcAlgorithm I = .candidates A n) (hcov : I.rational ⊆ I.covered)
    (hknown : (I.known : Set X) ⊆ I.rational)
    (hdec : ∀ a ∈ A, ∀ x ∈ I.rational, I.red x = a → x ∈ I.known) :
    CertifiedSolutionSet True (· ∈ I.rational) := sorry

theorem QCOutput.fail_ne_empty {P : Type*} (r : QCFailure) (n : ℕ) :
    (QCOutput.fail r : QCOutput P) ≠ .candidates ∅ n := sorry

/-- The model of X₀⁺(97) used in BDMTV 2021 Example 5.7. -/
def x0plus97Quartic : MvPolynomial (Fin 3) ℚ :=
  let x := MvPolynomial.X (0 : Fin 3); let y := MvPolynomial.X (1 : Fin 3)
  let z := MvPolynomial.X (2 : Fin 3)
  z * x ^ 3 + (-y ^ 2 + z * y) * x ^ 2 + (-y ^ 3 - z * y ^ 2 - z ^ 3) * x + (z * y ^ 3 + z ^ 2 * y ^ 2)

/-- The ten rational points of X₀⁺(97). -/
def x0plus97Points : Fin 10 → Fin 3 → ℚ :=
  ![![1, 0, 0], ![-2, 1, 1], ![-1, 0, 1], ![0, 0, 1], ![0, 1, 0], ![0, -1, 1], ![1, 0, 1],
    ![1, 1, 1], ![-1, 1, 0], ![5, 3, 2]]

-- qcOutput_x0plus97: for X₀⁺(97) at p = 5 (BDMTV 2021 Example 5.7) the output is the candidate set
-- of the reductions of the ten points, which lie on the model; with every rational point covered
-- and separated from the other known points by its reduction, X₀⁺(97)(ℚ) is these ten points.
example {X P : Type*} [DecidableEq X] [DecidableEq P] (I : QCInput X P) (hp : I.p = 5)
    (pt : Fin 10 → X)
    (hknown : I.known = Finset.univ.image pt) (hptR : Set.range pt ⊆ I.rational)
    (hcov : I.rational ⊆ I.covered) (A : Finset P) (n : ℕ) (h : qcAlgorithm I = .candidates A n)
    (hA : A = Finset.univ.image (I.red ∘ pt))
    (hsep : ∀ x ∈ I.rational, ∀ i, I.red x = I.red (pt i) → x = pt i) :
    (∀ i, MvPolynomial.eval (x0plus97Points i) x0plus97Quartic = 0) ∧
      I.rational = Set.range pt := sorry

-- qcOutput_no_patch: `candidates ∅` asserts only that no rational point lies in a covered disc
-- (`candidates_sound` with `A = ∅`); when the patches cover no disc this condition is empty.
example {X P : Type*} (I : QCInput X P) (n : ℕ) (h : qcAlgorithm I = .candidates ∅ n) :
    I.rational ∩ I.covered = ∅ := sorry

-- qcOutput_fail_nonexample: FAIL is not the empty candidate set.
example {P : Type*} : (QCOutput.fail .precisionLoss : QCOutput P) ≠ .candidates ∅ 0 := sorry

-- qcOutput_sieve_compat: if every candidate's preimage among rational points is known,
-- the certified set is the set of known points.
example {X P : Type*} (I : QCInput X P) (A : Finset P) (n : ℕ)
    (h : qcAlgorithm I = .candidates A n) (hcov : I.rational ⊆ I.covered)
    (hknown : (I.known : Set X) ⊆ I.rational)
    (hdec : ∀ a ∈ A, ∀ x ∈ I.rational, I.red x = a → x ∈ I.known) :
    (QCOutput.toCertifiedSolutionSet I A n h hcov hknown hdec).solutions = I.known := sorry

/-! ### X_s(13): ED.6/xs13-plane-model and the following nodes -/

/-- Baran's quartic `B(X, Y, Z)`. -/
def baranQuartic : MvPolynomial (Fin 3) ℚ :=
  let X := MvPolynomial.X (0 : Fin 3); let Y := MvPolynomial.X (1 : Fin 3)
  let Z := MvPolynomial.X (2 : Fin 3)
  (-Y - Z) * X ^ 3 + (2 * Y ^ 2 + Y * Z) * X ^ 2 + (-Y ^ 3 + Y ^ 2 * Z - 2 * Y * Z ^ 2 + Z ^ 3) * X +
    (2 * Y ^ 2 * Z ^ 2 - 3 * Y * Z ^ 3)

/-- The quartic `Q(X, Y, Z)` of BDMTV §6.3 with its integer coefficients (monic in `Y`); the
integral model is used for the Frobenius lift at 17. -/
def xs13QuarticInt : MvPolynomial (Fin 3) ℤ :=
  let X := MvPolynomial.X (0 : Fin 3); let Y := MvPolynomial.X (1 : Fin 3)
  let Z := MvPolynomial.X (2 : Fin 3)
  Y ^ 4 + 5 * X ^ 4 - 6 * X ^ 2 * Y ^ 2 + 6 * X ^ 3 * Z + 26 * X ^ 2 * Y * Z + 10 * X * Y ^ 2 * Z -
    10 * Y ^ 3 * Z - 32 * X ^ 2 * Z ^ 2 - 40 * X * Y * Z ^ 2 + 24 * Y ^ 2 * Z ^ 2 + 32 * X * Z ^ 3 -
    16 * Y * Z ^ 3

/-- The quartic `Q(X, Y, Z)` of BDMTV §6.3 over `ℚ`. -/
def xs13Quartic : MvPolynomial (Fin 3) ℚ := MvPolynomial.map (Int.castRingHom ℚ) xs13QuarticInt

/-- The seven rational points `P0, …, P6`. -/
def xs13Points : Fin 7 → Fin 3 → ℚ :=
  ![![1, 1, 1], ![1, 1, 2], ![0, 0, 1], ![-3, 3, 2], ![1, 1, 0], ![0, 2, 1], ![-1, 1, 0]]

/-- The substitution `(X : Y : Z) ↦ (X − Y : X + Y : X + Z)`. -/
def baranSubstitution : Fin 3 → MvPolynomial (Fin 3) ℚ :=
  ![MvPolynomial.X 0 - MvPolynomial.X 1, MvPolynomial.X 0 + MvPolynomial.X 1,
    MvPolynomial.X 0 + MvPolynomial.X 2]

/-- BDMTV §6.3 (ii) and (iv): the substitution identity and the seven points. -/
theorem xs13_quartic_identity_and_points :
    MvPolynomial.aeval baranSubstitution xs13Quartic = 16 * baranQuartic ∧
      (∀ i, MvPolynomial.eval (xs13Points i) xs13Quartic = 0) ∧
      xs13Quartic.IsHomogeneous 4 ∧ baranQuartic.IsHomogeneous 4 := sorry

/-- Unique projective representatives: Z=1, then Z=0,Y=1, then (1:0:0). -/
def xs13SpecialFibrePoints : Finset (Fin 3 → ZMod 17) :=
  (((Finset.univ : Finset (ZMod 17 × ZMod 17)).image (fun q => ![q.1, q.2, 1])) ∪
    ((Finset.univ : Finset (ZMod 17)).image (fun x => ![x, 1, 0])) ∪ {![1, 0, 0]}).filter
      (fun q => MvPolynomial.eval q (MvPolynomial.map (Int.castRingHom (ZMod 17)) xs13QuarticInt) = 0)
theorem xs13_specialFibre_card : xs13SpecialFibrePoints.card = 20 := sorry
theorem xs13_specialFibre_smooth : ∀ q ∈ xs13SpecialFibrePoints,
    ∃ i : Fin 3, MvPolynomial.eval q (MvPolynomial.map (Int.castRingHom (ZMod 17))
      (MvPolynomial.pderiv i xs13QuarticInt)) ≠ 0 := sorry

/-- The newform coefficient field `K = ℚ(α)`, `α³ + 2α² − α − 1 = 0`, as a polynomial. -/
def xs13CoeffFieldPoly : Polynomial ℚ :=
  Polynomial.X ^ 3 + 2 * Polynomial.X ^ 2 - Polynomial.X - 1

-- xs13_coeffField_inert_seventeen: the defining cubic has no root modulo17.
example : ∀ a : ZMod 17, a ^ 3 + 2 * a ^ 2 - a - 1 ≠ 0 := sorry

/-- Supporting dimension computation for a field generated by a root of the displayed
irreducible cubic. The identification with End(J) and the Néron–Severi rank are omitted. -/
theorem finrank_of_xs13_cubic (E : Type*) [Field E] [Algebra ℚ E] (α : E)
    (hgen : Algebra.adjoin ℚ {α} = ⊤) (hα : Polynomial.aeval α xs13CoeffFieldPoly = 0) :
    Module.finrank ℚ E = 3 := sorry

/-- BDMTV Proposition 6.2 input: certified interval enclosures (CN.4) of `L'(f^σ, 1)` with
lower endpoints above `0.6`, one for each real embedding, prove nonvanishing. -/
theorem xs13_derivative_ne_zero (lo hi : Fin 3 → ℚ) (Lder : Fin 3 → ℝ)
    (hencl : ∀ σ, (lo σ : ℝ) ≤ Lder σ ∧ Lder σ ≤ hi σ) (hlo : ∀ σ, (3 : ℚ) / 5 < lo σ) :
    ∀ σ, Lder σ ≠ 0 := sorry

/-- Supporting restriction-of-scalars dimension computation. The RM action on J(Q)
and the rank-one-over-Q supplier theorem must be established independently. -/
theorem finrank_restrictScalars_three (V K : Type*) [AddCommGroup V] [Module ℚ V] [Field K] [Algebra ℚ K]
    [Module K V] [IsScalarTower ℚ K V] (hK : Module.finrank ℚ K = 3)
    (hGZKL : Module.finrank K V = 1) : Module.finrank ℚ V = 3 := sorry

/-- BDMTV §6.4: Z1 and Z2 are admissible and independent. -/
theorem xs13_tateClasses_admissible :
    (∃ A : AdmissibleTateMatrix 3, A.Z = xs13Z1) ∧ (∃ A : AdmissibleTateMatrix 3, A.Z = xs13Z2) ∧
      LinearIndependent ℚ ![xs13Z1, xs13Z2] := sorry

/-- The Hodge data for Z1 and Z2 on the first chart: `β_Fil` vectors. -/
def xs13BetaFil : Fin 2 → Fin 3 ⊕ Fin 3 → ℚ :=
  ![Sum.elim (0 : Fin 3 → ℚ) ![0, 1 / 2, 1 / 2], Sum.elim (0 : Fin 3 → ℚ) ![0, -1 / 2, -5 / 2]]

/-- The `γ_Fil` functions `5y/6 + 3x/2` and `−5y/6 − 15x/2` in `ℚ[x, y]`. -/
def xs13GammaFil : Fin 2 → MvPolynomial (Fin 2) ℚ :=
  ![MvPolynomial.C (5 / 6) * MvPolynomial.X 1 + MvPolynomial.C (3 / 2) * MvPolynomial.X 0,
    MvPolynomial.C (-5 / 6) * MvPolynomial.X 1 - MvPolynomial.C (15 / 2) * MvPolynomial.X 0]

def xs13AffineQuartic : MvPolynomial (Fin 2) ℚ :=
  MvPolynomial.aeval ![MvPolynomial.X 0, MvPolynomial.X 1, 1] xs13Quartic
abbrev Xs13AffineCoordinateRing :=
  MvPolynomial (Fin 2) ℚ ⧸ Ideal.span {xs13AffineQuartic}
def xs13GammaFilClass (i : Fin 2) : Xs13AffineCoordinateRing :=
  Ideal.Quotient.mk _ (xs13GammaFil i)
-- xs13_coordinate_relation: the quartic vanishes in its quotient, not in a polynomial ring.
example : (Ideal.Quotient.mk (Ideal.span {xs13AffineQuartic})) xs13AffineQuartic = 0 := sorry
-- xs13_hodge_nonconstant: the first gamma class is nonzero; zero data cannot pass.
example : xs13GammaFilClass 0 ≠ 0 := sorry
-- xs13_gamma_class: Hodge expressions are transported through the quotient map.
example : xs13GammaFilClass 0 =
  Ideal.Quotient.mk _ (MvPolynomial.C (5 / 6) * MvPolynomial.X 1 +
    MvPolynomial.C (3 / 2) * MvPolynomial.X 0) := sorry

/-- BDMTV §6.4 Hodge data: `γ_Fil` vanishes at the base point `P2 = (0, 0)` and `β_Fil` has
zero holomorphic part (the full conditions (30), (32) are the certificate of
`hodge-filtration-algorithm`). -/
theorem xs13_hodgeData_base_conditions :
    (∀ i, MvPolynomial.eval ![0, 0] (xs13GammaFil i) = 0) ∧
      (∀ i j, xs13BetaFil i (Sum.inl j) = 0) := sorry

/-! ### ED.6/xs13-first-chart-frobenius -/

/-- The Frobenius matrix on `H¹_dR` in the basis `ω` at `p = 17` (RD.7 output). -/
def xs13FrobeniusMatrix : Matrix (Fin 6) (Fin 6) ℚ_[17] := sorry

/-- The Frobenius lift `Φ` of RD.7 (Tuitman) on an abstract integral dagger algebra `A` of `U₁`: a
`ℤ_[17]`-algebra with coordinates `x, y`, `Q(x, y, 1) = 0` and `Q_y(x, y, 1)` a unit. It is a lift of
Frobenius (`Φ(a) ≡ a¹⁷ mod 17` for all `a`) with `Φ(x) = x¹⁷`. -/
def xs13FrobeniusLift (A : Type*) [CommRing A] [Algebra ℤ_[17] A] (x y : A) : A →ₐ[ℤ_[17]] A :=
  sorry

/-- `Φ(y) ≡ y¹⁷ mod 17`, `Q(x¹⁷, Φ(y)) = 0`, and `Φ(y)` is the unique solution of `Q(x¹⁷, ·) = 0`
congruent to `y¹⁷` modulo 17 (Hensel uniqueness, `A` Henselian along `17` as dagger algebras are).
The existence of a Frobenius lift with `Φ(x) = x¹⁷` is the RD.7 input `hRD7`. -/
theorem xs13FrobeniusLift_y_congr (A : Type*) [CommRing A] [Algebra ℤ_[17] A]
    [HenselianRing A (Ideal.span {(17 : A)})] (x y : A)
    (hQ : MvPolynomial.aeval ![x, y, 1] xs13QuarticInt = 0)
    (hQy : IsUnit (MvPolynomial.aeval ![x, y, 1] (MvPolynomial.pderiv 1 xs13QuarticInt)))
    (hRD7 : ∃ Φ : A →ₐ[ℤ_[17]] A, Φ x = x ^ 17 ∧ ∀ a, Φ a - a ^ 17 ∈ Ideal.span {(17 : A)}) :
    xs13FrobeniusLift A x y x = x ^ 17 ∧
      (∀ a, xs13FrobeniusLift A x y a - a ^ 17 ∈ Ideal.span {(17 : A)}) ∧
      MvPolynomial.aeval ![x ^ 17, xs13FrobeniusLift A x y y, 1] xs13QuarticInt = 0 ∧
      ∀ z : A, MvPolynomial.aeval ![x ^ 17, z, 1] xs13QuarticInt = 0 →
        z - y ^ 17 ∈ Ideal.span {(17 : A)} → z = xs13FrobeniusLift A x y y := sorry

/-- `P2 = (0, 0)` is a Teichmüller point: for the `ℤ_[17]`-point `P2 : A → ℤ_[17]` with
coordinates `(0, 0)`, the point `Φ(P2) = P2 ∘ Φ` again has coordinates `(0, 0)`. -/
theorem xs13_P2_teichmuller (A : Type*) [CommRing A] [Algebra ℤ_[17] A]
    [HenselianRing A (Ideal.span {(17 : A)})] (x y : A)
    (hQ : MvPolynomial.aeval ![x, y, 1] xs13QuarticInt = 0)
    (hQy : IsUnit (MvPolynomial.aeval ![x, y, 1] (MvPolynomial.pderiv 1 xs13QuarticInt)))
    (hRD7 : ∃ Φ : A →ₐ[ℤ_[17]] A, Φ x = x ^ 17 ∧ ∀ a, Φ a - a ^ 17 ∈ Ideal.span {(17 : A)})
    (P2 : A →ₐ[ℤ_[17]] ℤ_[17]) (hx : P2 x = 0) (hy : P2 y = 0) :
    P2 (xs13FrobeniusLift A x y x) = 0 ∧ P2 (xs13FrobeniusLift A x y y) = 0 := sorry

theorem xs13FrobeniusMatrix_cup (C : Matrix (Fin 6) (Fin 6) ℚ_[17])
    (hC : C = Matrix.reindex (finSumFinEquiv (m := 3) (n := 3)) (finSumFinEquiv (m := 3) (n := 3))
      (Matrix.fromBlocks (0 : Matrix (Fin 3) (Fin 3) ℚ_[17]) 1 (-1) 0)) :
    xs13FrobeniusMatrixᵀ * C * xs13FrobeniusMatrix = (17 : ℚ_[17]) • C ∧
      ∀ Z ∈ ({xs13Z1, xs13Z2} : Set (Matrix (Fin 3 ⊕ Fin 3) (Fin 3 ⊕ Fin 3) ℚ)),
        xs13FrobeniusMatrixᵀ * (Matrix.reindex finSumFinEquiv finSumFinEquiv Z).map (Rat.cast : ℚ → ℚ_[17]) *
            xs13FrobeniusMatrix =
          (17 : ℚ_[17]) • (Matrix.reindex finSumFinEquiv finSumFinEquiv Z).map (Rat.cast : ℚ → ℚ_[17]) := sorry

/-- The functions `θ_{Z_i}` on a residue disc of `]U₁[`, as power series in the parameter. -/
def xs13Theta (i : Fin 2) (disc : Fin 17) : PowerSeries ℚ_[17] := sorry

theorem xs13FrobeniusMatrix_trace : xs13FrobeniusMatrix.trace = -2 := sorry

-- xs13_Qy_P2: ∂Q/∂Y at (0 : 0 : 1) is −16.
example : MvPolynomial.eval ![0, 0, 1] (MvPolynomial.pderiv 1 xs13Quartic) = -16 := sorry

-- xs13_Qy_P0: ∂Q/∂Y at (1 : 1 : 1) is 0.
example : MvPolynomial.eval ![1, 1, 1] (MvPolynomial.pderiv 1 xs13Quartic) = 0 := sorry

-- xs13_frob_trace: tr F = 17 + 1 − #X(𝔽₁₇) = −2.
example : xs13FrobeniusMatrix.trace = 17 + 1 - 20 := sorry

-- xs13_naive_lift_nonexample: y ↦ y¹⁷ is not a lift: Q(2⁻¹⁷, 2⁻¹⁷) ≠ 0, so on any `A` with the
-- ℤ_[17]-point P1 = (1/2, 1/2) the lift has `Φ(y) ≠ y¹⁷`.
example (A : Type*) [CommRing A] [Algebra ℤ_[17] A] [HenselianRing A (Ideal.span {(17 : A)})]
    (x y : A) (hQ : MvPolynomial.aeval ![x, y, 1] xs13QuarticInt = 0)
    (hQy : IsUnit (MvPolynomial.aeval ![x, y, 1] (MvPolynomial.pderiv 1 xs13QuarticInt)))
    (hRD7 : ∃ Φ : A →ₐ[ℤ_[17]] A, Φ x = x ^ 17 ∧ ∀ a, Φ a - a ^ 17 ∈ Ideal.span {(17 : A)})
    (P1 : A →ₐ[ℤ_[17]] ℤ_[17]) (hx : 2 * P1 x = 1) (hy : 2 * P1 y = 1) :
    MvPolynomial.eval ![(1 / 2 : ℚ) ^ 17, (1 / 2) ^ 17, 1] xs13Quartic ≠ 0 ∧
      xs13FrobeniusLift A x y y ≠ y ^ 17 := sorry

/-! ### ED.6/xs13-equivariant-height-matrices, chart points, P0 disc, Theorem 1.1 -/

/-- The 4 × 4 matrix `T(x)` of the determinant criterion, from the first row at `x` and the
three rows at the known points. -/
def detCriterionMatrix {K : Type*} [Field K] (row : Fin 4 → K) (known : Fin 3 → Fin 4 → K) :
    Matrix (Fin 4) (Fin 4) K :=
  Matrix.of ![row, known 0, known 1, known 2]

/-- BDMTV Lemma 1.5 as used in §6.4.1: all rows satisfy the same linear relation
`θ = Σ h_j Ψ_j`, hence `det T = 0`. -/
theorem xs13_det_T_eq_zero {K : Type*} [Field K] (row : Fin 4 → K) (known : Fin 3 → Fin 4 → K)
    (hcoef : Fin 3 → K)
    (hrow : row 0 = ∑ j : Fin 3, hcoef j * row j.succ)
    (hknown : ∀ k, known k 0 = ∑ j : Fin 3, hcoef j * known k j.succ) :
    (detCriterionMatrix row known).det = 0 := sorry

theorem xs13_points_firstChart {X : Type*} (R U : Set X) (P : Fin 7 → X) (hP : ∀ i, P i ∈ R)
    (hU : ∀ i ∈ ({1, 2, 3, 5} : Finset (Fin 7)), P i ∈ U) (run : QCRun 17 X (R ∩ U))
    (h : run.MatchedOrExcluded (P '' ↑({1, 2, 3, 5} : Finset (Fin 7)))) :
    R ∩ U = P '' ↑({1, 2, 3, 5} : Finset (Fin 7)) := sorry

theorem xs13_points_secondChart {X : Type*} (R U : Set X) (P : Fin 7 → X) (hP : ∀ i, P i ∈ R)
    (hU : ∀ i ∈ ({4, 6} : Finset (Fin 7)), P i ∈ U) (run : QCRun 17 X (R ∩ U))
    (h : run.MatchedOrExcluded (P '' ↑({4, 6} : Finset (Fin 7)))) :
    R ∩ U = P '' ↑({4, 6} : Finset (Fin 7)) := sorry

theorem xs13_points_P0Disc {X : Type*} (R U : Set X) (P : Fin 7 → X) (hP : ∀ i, P i ∈ R)
    (hU : P 0 ∈ U) (run : QCRun 17 X (R ∩ U)) (h : run.MatchedOrExcluded {P 0}) :
    R ∩ U = {P 0} := sorry

/-- BDMTV Theorem 1.1: the three chart results cover `X(𝔽₁₇)`, so `X(ℚ) = {P0, …, P6}`. -/
theorem xs13_rationalPoints {X : Type*} (R U₁ U₂ U₀ : Set X) (P : Fin 7 → X)
    (hcover : R ⊆ U₁ ∪ U₂ ∪ U₀) (h₁ : R ∩ U₁ = P '' ↑({1, 2, 3, 5} : Finset (Fin 7)))
    (h₂ : R ∩ U₂ = P '' ↑({4, 6} : Finset (Fin 7))) (h₀ : R ∩ U₀ = {P 0}) :
    R = Set.range P := sorry

/-- The thirteen rational CM `j`-invariants: an elliptic curve over `ℚ` has CM (over `ℚ̄`) iff its
`j`-invariant is one of these (CM.4; the orders of class number one). "No CM" below means
`E.j ∉ rationalCMjInvariants`. -/
def rationalCMjInvariants : Finset ℚ :=
  {0, 1728, -3375, 8000, -32768, 54000, 287496, -884736, -12288000, 16581375, -884736000,
    -147197952000, -262537412640768000}

open scoped Classical in
/-- `ρ_{E,ℓ}(G_ℚ)` lies in the normaliser `C_s⁺(ℓ)` of a split Cartan subgroup of `GL₂(𝔽_ℓ)`: there are
two distinct subgroups of order `ℓ` of `E(ℚ̄)` whose unordered pair is stable under `Gal(ℚ̄/ℚ)`. -/
def HasSplitCartanNormaliserImage (E : WeierstrassCurve ℚ) (ℓ : ℕ) : Prop :=
  ∃ C₁ C₂ : AddSubgroup (E.baseChange (AlgebraicClosure ℚ)).toAffine.Point,
    Nat.card C₁ = ℓ ∧ Nat.card C₂ = ℓ ∧ C₁ ≠ C₂ ∧
    ∀ σ : AlgebraicClosure ℚ ≃ₐ[ℚ] AlgebraicClosure ℚ,
      (C₁.map (WeierstrassCurve.Affine.Point.map (W' := E.toAffine) σ.toAlgHom) = C₁ ∧
          C₂.map (WeierstrassCurve.Affine.Point.map (W' := E.toAffine) σ.toAlgHom) = C₂) ∨
        (C₁.map (WeierstrassCurve.Affine.Point.map (W' := E.toAffine) σ.toAlgHom) = C₂ ∧
          C₂.map (WeierstrassCurve.Affine.Point.map (W' := E.toAffine) σ.toAlgHom) = C₁)

/-- For `ℓ ∈ {2, 3, 5, 7}` infinitely many rational `j` are `j`-invariants of non-CM elliptic curves
over `ℚ` with mod-`ℓ` image in `C_s⁺(ℓ)` (genus-zero `X_s(ℓ) ≅ X₀⁺(ℓ²)` with its `j`-map and the
rational-point criterion for `X_H`, `−I ∈ H`, R13.4a). -/
theorem exists_nonCM_splitCartan_small (ℓ : ℕ) (hℓ : ℓ ∈ ({2, 3, 5, 7} : Finset ℕ)) :
    {j : ℚ | j ∉ rationalCMjInvariants ∧ ∃ (E : WeierstrassCurve ℚ) (_ : E.IsElliptic),
      E.j = j ∧ HasSplitCartanNormaliserImage E ℓ}.Infinite := sorry

/-- BDMTV Theorem 1.2: the primes `ℓ` with a non-CM `E/ℚ` whose mod-`ℓ` image lies in `C_s⁺(ℓ)` are
`2, 3, 5, 7`. Inputs: `h13`, the moduli reading of `xs13_rationalPoints` (`X_s(13)(ℚ)` consists of
cusps and CM points), and `hBPR`, Bilu–Parent–Rebolledo for `ℓ > 7`, `ℓ ≠ 13` (gap); the case
`ℓ ≤ 7` is `exists_nonCM_splitCartan_small`. -/
theorem splitCartan_primes_eq
    (h13 : ∀ (E : WeierstrassCurve ℚ) [E.IsElliptic], HasSplitCartanNormaliserImage E 13 →
      E.j ∈ rationalCMjInvariants)
    (hBPR : ∀ ℓ : ℕ, ℓ.Prime → 7 < ℓ → ℓ ≠ 13 → ∀ (E : WeierstrassCurve ℚ) [E.IsElliptic],
      HasSplitCartanNormaliserImage E ℓ → E.j ∈ rationalCMjInvariants) :
    {ℓ : ℕ | ℓ.Prime ∧ ∃ (E : WeierstrassCurve ℚ) (_ : E.IsElliptic),
      E.j ∉ rationalCMjInvariants ∧ HasSplitCartanNormaliserImage E ℓ} =
      (({2, 3, 5, 7} : Finset ℕ) : Set ℕ) := sorry

/-- The class-number-one discriminants in which 13 is inert. -/
def xns13CMDiscriminants : Finset ℤ := {-7, -8, -11, -19, -28, -67, -163}

/-- Corollary 1.3: Baran's isomorphism transports `#X_s(13)(ℚ) = 7`, and the seven CM points
(injective in the discriminant) exhaust `X_ns(13)(ℚ)`. -/
theorem xns13_rationalPoints_card {Xs Xns : Type*} [Fintype Xs] [Fintype Xns] (e : Xs ≃ Xns)
    (hs : Fintype.card Xs = 7) (cmPt : xns13CMDiscriminants → Xns)
    (hinj : Function.Injective cmPt) :
    Fintype.card Xns = 7 ∧ Function.Surjective cmPt := sorry

/-- The fundamental discriminants of class number one. -/
def classNumberOneDiscriminants : Finset ℤ := {-3, -4, -7, -8, -11, -19, -43, -67, -163}

/-- Remark 1.4: the imaginary quadratic fields of class number one. Inputs: `hns13`, Corollary 1.3
read through CM theory (a class-number-one field in which 13 is inert gives a rational CM point of
`X_ns(13)` of discriminant `discr K`); `hsmall`, the certified class numbers for `|D| ≤ 52` (CN.2);
`hbig`, `h(−67) = h(−163) = 1`. The remaining step is that `h_K = 1` and `discr K < −52` force 13 to
be inert (an ideal of norm 13 would be principal, generated by an element of norm `13 < |D|/4`). -/
theorem classNumberOne
    (hns13 : ∀ (K : Type) [Field K] [NumberField K], Module.finrank ℚ K = 2 →
      NumberField.discr K < 0 → NumberField.classNumber K = 1 →
      (Ideal.span {(13 : NumberField.RingOfIntegers K)}).IsPrime →
      NumberField.discr K ∈ xns13CMDiscriminants)
    (hsmall : ∀ (K : Type) [Field K] [NumberField K], Module.finrank ℚ K = 2 →
      -52 ≤ NumberField.discr K → NumberField.discr K < 0 →
      (NumberField.classNumber K = 1 ↔
        NumberField.discr K ∈ ({-3, -4, -7, -8, -11, -19, -43} : Finset ℤ)))
    (hbig : ∀ (K : Type) [Field K] [NumberField K], Module.finrank ℚ K = 2 →
      (NumberField.discr K = -67 ∨ NumberField.discr K = -163) → NumberField.classNumber K = 1) :
    ∀ (K : Type) [Field K] [NumberField K], Module.finrank ℚ K = 2 → NumberField.discr K < 0 →
      (NumberField.classNumber K = 1 ↔ NumberField.discr K ∈ classNumberOneDiscriminants) := sorry

/-! ### BDMTV 2021 examples -/

/-- The canonical model of `X_S4(13)` (Banwait–Cremona). -/
def xS4_13Quartic : MvPolynomial (Fin 3) ℚ :=
  let x := MvPolynomial.X (0 : Fin 3); let y := MvPolynomial.X (1 : Fin 3)
  let z := MvPolynomial.X (2 : Fin 3)
  4 * x ^ 3 * y - 3 * x ^ 2 * y ^ 2 + 3 * x * y ^ 3 - x ^ 3 * z + 16 * x ^ 2 * y * z -
    11 * x * y ^ 2 * z + 5 * y ^ 3 * z + 3 * x ^ 2 * z ^ 2 + 9 * x * y * z ^ 2 + y ^ 2 * z ^ 2 +
    x * z ^ 3 + 2 * y * z ^ 3

def xS4_13Points : Fin 4 → Fin 3 → ℚ := ![![1, 3, -2], ![0, 0, 1], ![0, 1, 0], ![1, 0, 0]]

/-- BDMTV 2021 Theorem 1.1: the four points lie on the model, and a run at p = 11 whose centres
are matched by them gives `X_S4(13)(ℚ) = {four points}`. -/
theorem xS4_13_rationalPoints {X : Type*} (R : Set X) (P : Fin 4 → X) (hP : ∀ i, P i ∈ R)
    (run : QCRun 11 X R) (h : run.MatchedOrExcluded (Set.range P)) :
    (∀ i, MvPolynomial.eval (xS4_13Points i) xS4_13Quartic = 0) ∧ R = Set.range P := sorry

/-- BDMTV 2021 Theorem 5.6 for N = 97 (p = 5); the other eight levels have the same form. -/
theorem x0plus_genusThree_rationalPoints {X : Type*} (R : Set X) (P : Fin 10 → X)
    (hP : ∀ i, P i ∈ R) (run : QCRun 5 X R) (h : run.MatchedOrExcluded (Set.range P)) :
    (∀ i, MvPolynomial.eval (x0plus97Points i) x0plus97Quartic = 0) ∧ R = Set.range P := sorry

/-! ### Classical examples -/

/-- The Thue form `X⁴ − 12X²Y² − 8XY³ + 4Y⁴` (TdW 1989 (2.2)). -/
def tdwForm2 (X Y : ℤ) : ℤ := X ^ 4 - 12 * X ^ 2 * Y ^ 2 - 8 * X * Y ^ 3 + 4 * Y ^ 4

/-- The Thue form `X⁴ − 4X³Y − 12X²Y² + 4Y⁴` (TdW 1989 (2.1)). -/
def tdwForm1 (X Y : ℤ) : ℤ := X ^ 4 - 4 * X ^ 3 * Y - 12 * X ^ 2 * Y ^ 2 + 4 * Y ^ 4

/-- TdW 1989 Theorem B as certified solution sets. -/
theorem tdw89_thue_solutions :
    (∃ c : CertifiedSolutionSet True (fun v : ℤ × ℤ => tdwForm1 v.1 v.2 = 1),
        c.solutions = {(1, 0), (-1, 0)}) ∧
      ∃ c : CertifiedSolutionSet True (fun v : ℤ × ℤ => tdwForm2 v.1 v.2 = 1),
        c.solutions = {(1, 0), (-1, 0), (1, -1), (-1, 1), (1, 3), (-1, -3), (3, -1), (-3, 1)} :=
  sorry

/-- The curve `y² = x³ − 4x + 1`. -/
def tdwCurve : WeierstrassCurve ℚ := ⟨0, 0, 0, -4, 1⟩

/-- TdW 1989 Theorem A: the 22 integral points. -/
theorem tdw89_integralPoints :
    ∃ c : CertifiedSolutionSet True
        (fun v : ℤ × ℤ => tdwCurve.toAffine.Equation (v.1 : ℚ) (v.2 : ℚ)),
      c.solutions = {(-2, 1), (-2, -1), (-1, 2), (-1, -2), (0, 1), (0, -1), (2, 1), (2, -1), (3, 4),
        (3, -4), (4, 7), (4, -7), (10, 31), (10, -31), (12, 41), (12, -41), (20, 89), (20, -89),
        (114, 1217), (114, -1217), (1274, 45473), (1274, -45473)} := sorry

/-- The set `S` of positive integers whose prime factors lie in `{2, 3, 5, 7, 11, 13}` (de Weger
Theorem 6.3). -/
def deWegerS (x : ℕ) : Prop := 0 < x ∧ ∀ q ∈ x.primeFactors, q ∈ ({2, 3, 5, 7, 11, 13} : Finset ℕ)

/-- de Weger Theorem 6.3: 545 solutions of `x + y = z` in `S`, `gcd(x, y) = 1`, `x ≤ y`. -/
theorem deWeger_sUnit_solutions :
    ∃ c : CertifiedSolutionSet True (fun v : ℕ × ℕ × ℕ =>
        deWegerS v.1 ∧ deWegerS v.2.1 ∧ deWegerS v.2.2 ∧ v.1 + v.2.1 = v.2.2 ∧
          Nat.gcd v.1 v.2.1 = 1 ∧ v.1 ≤ v.2.1),
      c.solutions.card = 545 ∧ ((91 : ℕ), (1771470 : ℕ), (1771561 : ℕ)) ∈ c.solutions := sorry

/-- The Thue–Mahler form `x³ − 23x²y + 5xy² + 24y³` (TdW 1992). -/
def tdw92Form (x y : ℤ) : ℤ := x ^ 3 - 23 * x ^ 2 * y + 5 * x * y ^ 2 + 24 * y ^ 3

/-- TdW 1992: 72 solutions up to sign, counted with `x ≥ 0` (and `y = −1` when `x = 0`). -/
theorem tdw92_thueMahler_solutions :
    ∃ c : CertifiedSolutionSet True (fun v : ℤ × ℤ =>
        Int.gcd v.1 v.2 = 1 ∧ (0 < v.1 ∨ (v.1 = 0 ∧ v.2 = -1)) ∧
          ∃ a b e f : ℕ, tdw92Form v.1 v.2 = 2 ^ a * 3 ^ b * 5 ^ e * 7 ^ f ∨
            tdw92Form v.1 v.2 = -(2 ^ a * 3 ^ b * 5 ^ e * 7 ^ f)),
      c.solutions.card = 72 ∧ ((48632 : ℤ), (-3729 : ℤ)) ∈ c.solutions := sorry

end TauCeti.EffectiveDiophantine.ED6

end PartED6

end

/-! ## Exact supplier-bound signature omissions (PROTOCOL §13)

The following are planning obligations, not substitute definitions or theorem assumptions.

EffectiveDiophantineMethods:ED.0/certified-enclosure
Names: TauCeti.EffectiveDiophantine.ED0.PadicEnclosure.toPadicApproximation
Reason: CN.0 PadicApproximation is planned but not a declaration at either pin.
Required mathematical signature: For e : PadicEnclosure p x, return a : CN.0 PadicApproximation p with a.N=e.precision and a.denotation={z : Q_p | ||z-e.centre||≤p^(-N)}; hence x∈a.denotation. At c=0 take (N,N,0); otherwise v=min(v_p(c),N), and if v<N choose the nonzero residue s prime to p. The (5,1) at p=3 test must return (1,0,2), not merely a ball-membership proof.

EffectiveDiophantineMethods:ED.2/thue-certificate
Names: thueCert_soundness_only, thueCert_totally_complex
Reason: The source output has not been replayed as raw finite covering/reduction/search data.
Required mathematical signature: Construct an explicit Valid certificate from the named equation and certified number-field/root input, without receiving a cover or Valid output. For x³−2y³=1 produce its finite unit/norm cover, logarithm bounds, reductions and exhaustive residual solution list. For x³−2y³=5^z produce finite ideal cases and reductions including (3,1,2). Existing conditional soundness tests are supporting implications, not these factory tests.

EffectiveDiophantineMethods:ED.2/thue-mahler-s-unit-covering
Names: TauCeti.EffectiveDiophantine.ThueMahlerCovering.ofIdealFactorization
Reason: CN.2 certified ideal factorization/principal generator carriers are not yet built.
Required mathematical signature: For θ root of integralNormalization g, [K:Q]=deg g, normalized ThueMahlerEquation, verified primes above each p_i, complete valuations/divisor representatives, principal ideal generators, ideal class orders h_i and complete units, return the finite cases α,π,h,s,t with α and each active π nonzero, and covers. Class orders and degree-one factors determine when n_i is free; when no degree-one factor occurs use h_i=0,π_i=1,n_i=0. The current abstract unit-only helper is not this producer.

EffectiveDiophantineMethods:ED.2/thue-mahler-certificate
Names: tmCert_listed_solution
Reason: The source output has not been replayed as raw finite covering/reduction/search data.
Required mathematical signature: Construct an explicit Valid certificate from the named equation and certified number-field/root input, without receiving a cover or Valid output. For x³−2y³=1 produce its finite unit/norm cover, logarithm bounds, reductions and exhaustive residual solution list. For x³−2y³=5^z produce finite ideal cases and reductions including (3,1,2). Existing conditional soundness tests are supporting implications, not these factory tests.

EffectiveDiophantineMethods:ED.3/local-descent-image
Names: certifiedLocalImage_real_three_roots, certifiedLocalImage_odd_good_prime
Reason: The finite local-factor factory and actual point evaluations have not been constructed.
Required mathematical signature: For W=y²=x³−x over R or Q_p, derive the decomposition of W.A, valuation parity and residue-unit square coordinates, construct W.M≃(Z/2)^n, lift each certified rational abscissa to a W.Point using real sign or p-adic Hensel certificates, evaluate actual W.μ, and prove the expected image cardinality using W.μ kernel and local quotient count. The abstract tests with hidx/hcard are only cardinality algebra.

EffectiveDiophantineMethods:ED.3/two-selmer-certificate
Names: twoSelmer_x3_minus_x.factory, twoSelmer_no_places.factory
Reason: The abstract basis-length examples compute cardinality only after the desired basis length is supplied; the actual descent/local factor factory has not been replayed.
Required mathematical signature: For the actual curve W:y²=x³−x over Q, factor its étale cubic Q³, compute square classes at2 and infinity, apply the pinned μ with all exceptional points, form actual norm and local restriction matrices, and row-reduce to a two-dimensional Selmer kernel. Independently compute the four-dimensional unconditioned norm kernel. Return concrete certificates and prove their pass/cardinality results without input basis-length hypotheses.

EffectiveDiophantineMethods:ED.4/good-reduction-chabauty-datum
Names: TauCeti.EffectiveDiophantine.ED4.GoodReductionChabautyDatum.geometricFactory, TauCeti.EffectiveDiophantine.ED4.GoodReductionChabautyDatum.toGoodReductionPair, datum_residueDisc_eq_tube, TauCeti.EffectiveDiophantine.ED4.GoodReductionChabautyDatum, GoodReductionChabautyDatum.red, GoodReductionChabautyDatum.red_surjective, GoodReductionChabautyDatum.residueDisc, GoodReductionChabautyDatum.localParam_bijOn, GoodReductionChabautyDatum.redJ_comp_abelJacobi, GoodReductionChabautyDatum.toGoodReductionPair
Reason: The smooth proper curve, relative Jacobian, analytic tubes and Coleman supplier carriers have not been identified.
Required mathematical signature: For actual X/Q smooth proper geometrically integral, genus g≥1, O∈X(Q) and smooth proper model over Z_p, construct point reduction, all special-fibre points, full formal disc charts, the geometric Abel–Jacobi morphism, its differential pullback isomorphism and completion at O, and return the ColemanIntegration good-reduction pair. Abstract ReductionDiscData and baseResidueDisc support set-theoretic disc partitioning only; a pair Xt×Set X is not the supplier model. All listed GoodReductionChabautyDatum APIs use this same actual geometric carrier. ReductionDiscData.red/residueDisc/param are only supporting set/group data. Its genus-one finite-field test has four special-fibre points; analytic chart construction is omitted.

EffectiveDiophantineMethods:ED.4/abelian-integral
Names: TauCeti.EffectiveDiophantine.ED4.abelJacobi_pullback_bijective
Reason: The current abstract helper only gives base-point independence; the regular differential carriers are missing.
Required mathematical signature: For the geometric Abel–Jacobi ι_O:X→Jac(X), construct a linear equivalence ι_O*:H⁰(J,Ω¹_J)≃H⁰(X,Ω¹_X), independent of O. Compose with the formal logarithm differential to derive tiny primitives; do not pass the primitive equality as a field.

EffectiveDiophantineMethods:ED.4/tiny-integral-expansion
Names: TauCeti.EffectiveDiophantine.ED4.abelianIntegral_eq_primitive
Reason: The actual regular differential, geometric Abel–Jacobi and convergent formal disc supplier identifications are missing; the earlier abstract primitive statement was false.
Required mathematical signature: For a genuine smooth proper curve over K with good reduction, integral regular differential ω and a formal parameter t on one full residue disc, construct the integral coefficient series w(t), its convergent formal primitive I, and derive ∫_Q^Q′ω=I(t(Q′))−I(t(Q)) for points in that disc over finite extensions. Obtain this from the differential pullback of the actual Abel–Jacobi morphism and its completed formal group; do not assume the equality as a field.

EffectiveDiophantineMethods:ED.4/coleman-abelian-comparison
Names: TauCeti.EffectiveDiophantine.ED4.colemanIntegral_eq_abelianIntegral.geometric
Reason: The abstract Dwork calculation receives the nonroutine Frobenius relation as input.
Required mathematical signature: For actual ColemanIntegration L1 integral and geometric Abel–Jacobi logarithm on a good-reduction Jacobian, derive Frobenius compatibility from the cohomology supplier, local primitive equality and Weil polynomial with no eigenvalue1; conclude equality of the two integrals. The algebraic uniqueness lemma alone is supporting.

EffectiveDiophantineMethods:ED.4/hyperelliptic-residue-discs
Names: TauCeti.EffectiveDiophantine.ED4.hyperelliptic_integralDifferentials_basis
Reason: The generic polynomial and disc algebra does not provide an integral regular-differential module.
Required mathematical signature: For a smooth good-reduction hyperelliptic model y²=f(x), 2 invertible and degree 2g+1 or2g+2, prove dx/y,x dx/y,…,x^(g−1)dx/y form the integral basis and compute orders in each affine/infinity chart. State and derive smoothness/discriminant and infinity charts on the actual model.

EffectiveDiophantineMethods:ED.4/chabauty-coleman-certificate
Names: TauCeti.EffectiveDiophantine.ED4.ChabautyColemanCertificate.ofRankHypothesis, certificate_conditional_label.geometric, certificate_C05.factory
Reason: Finite index, genus/rank and a nonzero geometric annihilator are not derived by the abstract record.
Required mathematical signature: Given actual J(Q) finitely generated, g≥1, rank J(Q)≤r<g, r certified independent generators modulo torsion, show their subgroup has full rank and finite index by the FG free quotient. Its p-adic log span has dimension≤r, so construct nonzero ω∈H⁰(X_Qp,Ω¹) annihilating it; only then construct all analytic disc verdicts. Conditional rank labels must be recorded; withFiniteIndex is merely a semantic helper. C05 factory must build rank/differential/four-disc data rather than receive Valid and a bound sum.

EffectiveDiophantineMethods:ED.4/relative-symmetric-chabauty
Names: TauCeti.EffectiveDiophantine.ED4.mem_pullback_of_relativeCriterion.geometric
Reason: The abstract symmetric-space test receives the Box criterion as an assumption.
Required mathematical signature: Use actual Sym²X, the degree-two Abel–Jacobi map and relative cover X→C, regular differential trace kernel, all divisors and local parameters; derive Box rank/vanishing criterion then membership in the pullback locus. Caraiani–Newton §7.4 is its relative application, not a new general owner.

EffectiveDiophantineMethods:ED.6/qc-disc-certificate
Names: TauCeti.EffectiveDiophantine.ED6.QCDiscCertificate, TauCeti.EffectiveDiophantine.ED6.QCDiscCertificate.check, TauCeti.EffectiveDiophantine.ED6.QCDiscCertificate.check_sound, TauCeti.EffectiveDiophantine.ED6.QCDiscCertificate.ofRestrictedSeries
Reason: Actual disc/function/precision suppliers and multiplicity-aware root isolation are not built.
Required mathematical signature: Input actual geometric disc chart and finitely many restricted F_i(pT), finite coefficients as residues modulo p^N, rational tail bounds derived from height-series-valuation-bound, finite residue-ball tree, root multiplicity/verifier data and centre representatives modulo p^n. Check finite coefficients, exhaustive tree cover/discard decisions and uniqueness/root counts by Newton/Weierstrass and derivative bounds; check=true plus supplier coefficient/tail semantics implies covers and unique. An arbitrary fn:Z_p→Q_p and universal covers proof is excluded from raw input; do not name the semantic record a numerical checker.

EffectiveDiophantineMethods:ED.6/hodge-filtration-algorithm
Names: TauCeti.EffectiveDiophantine.ED6.HodgeFiltrationData.geometricFactory, hodgeData_xs13_Z1_beta
Reason: Actual function field, Laurent charts and sufficient truncation orders are missing; previous tests assumed the printed answer.
Required mathematical signature: Use the actual affine coordinate ring/function field, boundary points and uniformizers, exact Laurent expansions of ΩᵀZdΩ and ΩᵀZNNᵀΩ. Derive product/primitive pole bounds and the finite function space for γ; compute residues and solve finite linear systems, then verify conditions(30),(32) and base normalization. For xs13 use H⁰(O(2D)) with basis1,x,y,x²,xy,y² and replay actual principal parts, without href₁/href₂ assuming the Hodge answer. Largest individual differential pole alone is not enough.

EffectiveDiophantineMethods:ED.6/root-determination-precision
Names: TauCeti.EffectiveDiophantine.ED6.roots_determined_of_truncation
Reason: The existing algebraic lemma supplies only a necessary congruence for an existing root.
Required mathematical signature: For nonzero restricted F(pT) over completed Cp, positive multiplicity bound d, finite coefficients modulo p^N and certified tail lower bounds, prove the Weierstrass/Newton perturbation theorem with n−k>0: a complete ball cover of every root, multiplicities, isolation and stability. Exact Polynomial.roots over Q_p is not a residue-root enumerator or a Cp root constructor. Zero coefficients have valuation∞; a zero dominant coefficient is rejected.

EffectiveDiophantineMethods:ED.6/qc-modular-algorithm
Names: TauCeti.EffectiveDiophantine.ED6.QCOutput.geometricFactory
Reason: The required concrete geometric/numerical input data have not been replayed at the supplier boundary.
Required mathematical signature: Construct NC.2/NC.5 connection/height objects, SF.3 curve/differential geometry, RP.1 Mordell–Weil data, CN.4 certified coefficients and actual RD.7 Frobenius. Only then run finite coefficient/tree checks and assemble all chart verdicts; semantic loci finiteness does not give the numerical output.

EffectiveDiophantineMethods:ED.6/xs13-plane-model
Names: TauCeti.EffectiveDiophantine.ED6.xs13_planeModel
Reason: The polynomial identity/point memberships do not identify the modular curve or prove good reduction.
Required mathematical signature: Return the actual modular identification with X_s(13), smooth projective quartic/good reduction at17, complete20-point special fibre and all chart data from R13.4a/CN.3; the exact quartic identity and seven memberships are supporting.

EffectiveDiophantineMethods:ED.6/xs13-endomorphism-algebra
Names: TauCeti.EffectiveDiophantine.ED6.xs13_endAlgebra
Reason: A generated cubic field is not End(J)⊗Q or an NS-rank computation.
Required mathematical signature: Construct the algebra isomorphism End(J_s(13))⊗Q≃Q(ζ₇)^+, prove no additional endomorphisms using supplier R14.5/newform/RM data, and identify Rosati-fixed NS rank3. The cubic field dimension helper alone does not prove this.

EffectiveDiophantineMethods:ED.6/xs13-analytic-rank-certificate
Names: TauCeti.EffectiveDiophantine.ED6.xs13_analyticRank_eq_one
Reason: Positive derivative intervals only imply derivative nonzero.
Required mathematical signature: Use the correct three conjugate newform L-functions, certified analytic continuation, central vanishing L(f^σ,1)=0 and nonzero derivative enclosures. Conclude order of vanishing exactly1. Numerical enclosure, central vanishing and newform identity are separate certified inputs.

EffectiveDiophantineMethods:ED.6/xs13-rank-three
Names: TauCeti.EffectiveDiophantine.ED6.xs13_rank_eq_three
Reason: Restriction-of-scalars dimension does not establish Q-rank1 over the RM field.
Required mathematical signature: Import exact admissible modular rank-one overQ theorem: exhibit imaginary quadraticK satisfying Heegner/Kolyvagin hypotheses, twist factorization and nonvanishing, admissible Gross–Zagier trace and passage back toQ, so dim_RM(J(Q)⊗Q)=1. Combine the genuine cubic RM action and its degree3 to obtain rank3; HE.7 and GZ.8 stage names alone do not supply this theorem.

EffectiveDiophantineMethods:ED.6/xs13-first-chart-hodge-data
Names: TauCeti.EffectiveDiophantine.ED6.xs13_hodgeData_conditions
Reason: Base normalization and zero holomorphic part omit Laurent residue/regularity and basis checks.
Required mathematical signature: On the actual quotient Q[x,y]/(Q(x,y,1)) and its function field, certify the six differential basis, cup product, boundary and Laurent replay of η,β,γ for Z1,Z2. The quotient relation is nonvacuous; elementary gamma/base checks are supporting only.

EffectiveDiophantineMethods:ED.6/xs13-first-chart-frobenius
Names: TauCeti.EffectiveDiophantine.ED6.xs13FrobeniusLift.actualProducer, TauCeti.EffectiveDiophantine.ED6.xs13FrobeniusMatrix.actualProducer
Reason: The required concrete geometric/numerical input data have not been replayed at the supplier boundary.
Required mathematical signature: RD.7 Tuitman plane-curve producer must return actual dagger Frobenius lift, the6×6 matrix and exact differentials/precision. Conditional Hensel uniqueness for a supplied lift does not construct these data; existing certified Kedlaya hyperelliptic output is insufficient.

EffectiveDiophantineMethods:ED.6/xs13-equivariant-height-matrices
Names: TauCeti.EffectiveDiophantine.ED6.xs13_equivariant_height_factory
Reason: The required concrete geometric/numerical input data have not been replayed at the supplier boundary.
Required mathematical signature: Certify the actual E₁(P5) p-adic log vector, inert cubic coefficient field at17, correspondence action, height pairing and determinant. It is already a log vector; do not reject it because some global class could be torsion.

EffectiveDiophantineMethods:ED.6/xs13-first-chart-points
Names: TauCeti.EffectiveDiophantine.ED6.xs13_points_firstChart.factory
Reason: The required concrete geometric/numerical input data have not been replayed at the supplier boundary.
Required mathematical signature: Construct actual matrices/functions/coefficient precision and every disc zero table from the source computations, not a supplied complete QCOutput. Distinguish affine domain excluding zeros of Q_y and its complement.

EffectiveDiophantineMethods:ED.6/xs13-second-chart-points
Names: TauCeti.EffectiveDiophantine.ED6.xs13_points_secondChart.factory
Reason: The required concrete geometric/numerical input data have not been replayed at the supplier boundary.
Required mathematical signature: Construct and replay second-chart coordinate change, smoothness, Frobenius, height and every zero table, plus overlap agreement; do not accept the output certificate as input.

EffectiveDiophantineMethods:ED.6/xs13-p0-disc
Names: TauCeti.EffectiveDiophantine.ED6.xs13_points_P0Disc.factory
Reason: The required concrete geometric/numerical input data have not been replayed at the supplier boundary.
Required mathematical signature: Replay the ramified-extension Coleman integration and overconvergent precision for P0 using Balakrishnan–Tuitman, then derive the unique common-zero verdict. This source/precision gap remains.
EffectiveDiophantineMethods:ED.3/explicit-height-difference-bound
Names: TauCeti.EffectiveDiophantine.ED3.silvermanMu, canonicalHeight_sub_half_naiveHeight_mem.numberField
Reason: The primary source is now independently verified; the weighted number-field height API has not yet been represented on the actual pinned carrier in Lean.
Required mathematical signature: Let d=[K:Q] and h∞(t)=d⁻¹ Σ(v archimedean) n_v log max(1,|t|_v), with n_v=[K_v:R]. For an integral nonsingular standard Weierstrass equation W/K put μ_S=h_abs(Δ)/12+h∞(j)/12+h∞(b₂/12)/2+log(2*)/2, where 2*=1 if b₂=0 and 2 otherwise. Define silvermanMu on this W and prove, for P in W.toAffine.Point including O, −h_abs(j)/24−μ_S−973/1000 ≤ P.canonicalHeight/d−P.naiveHeight/(2*d) ≤ μ_S+107/100. Both pinned heights are relative logarithmic heights; d converts them to the absolute heights of Silverman Theorem1.1. Unit-test b₂=0, K=Q and field-extension compatibility (local weights sum correctly).

EffectiveDiophantineMethods:ED.4/abelian-logarithm
Names: TauCeti.EffectiveDiophantine.ED4.abelianLog.geometric, TauCeti.EffectiveDiophantine.ED4.integrationPairing.geometric
Reason: The supplied abstract homomorphism and linear carrier are supporting algebra; the Néron/formal group, invariant differentials and analytic comparison for the actual abelian variety have not been identified.
Required mathematical signature: For an actual abelian variety A/K over a finite extension K/Q_p, identify A¹(K) with its formal group on the maximal ideal, derive its convergent formal logarithm with identity differential, and extend by N⁻¹log(Nx). Prove choice independence, torsion kernel, functoriality and the point-first pairing with invariant differentials. Compatible finite-extension maps define the algebraic-closure map; a separate analytic/continuous construction gives completed Cp. Do not substitute a supplied arbitrary additive homomorphism for this construction.

-/
