/-
This file is not the roadmap and is not exhaustive. The roadmap document
(research/blueprint/readmes/EffectiveDiophantineMethods.md) is definitive. These statements suggest
Lean forms so that contributors and reviewers converge on names and signatures; they do not
constitute an implementation. The theorem and example proof bodies use `sorry` as required
for this suggested file. This revision was not compiled at the pinned baseline, so no
proof-script or elaboration success is asserted.

Effective Diophantine methods and certified rational points, layers ED.0–ED.6. Each layer is a
section of its own. The individual imports use the pinned number-field, p-adic, power-series,
lattice, Weierstrass-point, quotient, canonical-height, regulator and descent declarations.
The geometric targets and raw numerical producers whose actual supplier carriers are unavailable
are recorded under their exact intended names in the PROTOCOL §13 omission register. Separately
named algebraic helpers and semantic summaries state only their displayed supporting claims.
-/
import TauCeti.AlgebraicGeometry.EllipticCurve.CanonicalHeight
import TauCeti.AlgebraicGeometry.EllipticCurve.MordellWeil.PointModTorsion
import TauCeti.AlgebraicGeometry.EllipticCurve.MordellWeil.Regulator
import TauCeti.AlgebraicGeometry.EllipticCurve.MordellWeil.LocalCondition
import TauCeti.AlgebraicGeometry.EllipticCurve.MordellWeil.SelmerGroupA
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

/-- Proof-free p-adic exclusion data. The actual p-adic coefficients do not occur
in this finite record. Their certified residues enter only the soundness theorem. -/
structure RawPadicExclusionCertificate (k : ℕ) where
  p : ℕ
  m : ℕ
  W : Fin (k + 1) → ℤ
  residue₀ : ℕ
  residue : Fin k → ℕ
  X : Fin (k + 1) → ℚ
  distance : RawDistanceCertificate (k + 1)

namespace RawPadicExclusionCertificate

/-- Weighted triangular matrix of the residue congruence. -/
def matrix {k : ℕ} (c : RawPadicExclusionCertificate k) :
    Matrix (Fin (k + 1)) (Fin (k + 1)) ℤ :=
  linearFormMatrix c.W (fun j =>
    if h : j.val < k then c.W (Fin.last k) * (c.residue ⟨j.val, h⟩ : ℤ)
    else c.W (Fin.last k) * (c.p : ℤ) ^ c.m)

/-- The negative constant term is essential: v = W b + target belongs to the lattice. -/
def target {k : ℕ} (c : RawPadicExclusionCertificate k) : Fin (k + 1) → ℤ :=
  linearFormTarget (c.W (Fin.last k) * (c.residue₀ : ℤ))

/-- Prime test, canonical residue bounds, positive weights, nonnegative box,
matrix/target identities, exact distance replay and strict separation. Every quantified
index is finite; the distance replay enumerates its explicit finite integer cube. -/
def check {k : ℕ} (c : RawPadicExclusionCertificate k) : Bool :=
  decide (c.p.Prime ∧ c.residue₀ < c.p ^ c.m ∧
    (∀ j, c.residue j < c.p ^ c.m) ∧
    (∀ j, 0 < c.W j ∧ 0 ≤ c.X j) ∧
    c.distance.A = c.matrix ∧ c.distance.y = c.target ∧
    c.distance.check = true ∧
    (∑ j, ((c.W j : ℚ) * c.X j) ^ 2) < c.distance.lower)

/-- Pure integer conclusion, before identifying any p-adic coefficient. -/
theorem not_congruent {k : ℕ} (c : RawPadicExclusionCertificate k) (hc : c.check = true)
    (b : Fin (k + 1) → ℤ) (hb : ∀ j, |(b j : ℚ)| ≤ c.X j)
    (hzero : c.residue₀ = 0 → b ≠ 0) :
    ¬ (c.p : ℤ) ^ c.m ∣ b (Fin.last k) - (c.residue₀ : ℤ) -
      ∑ j : Fin k, b j.castSucc * (c.residue j : ℤ) := sorry

/-- The only external arithmetic semantics are the certified coefficient residues.
The prime instance types those coefficients and is independently checked in the raw input. -/
theorem check_sound {k : ℕ} (c : RawPadicExclusionCertificate k) [Fact c.p.Prime]
    (hc : c.check = true) (β₀ : ℤ_[c.p]) (β : Fin k → ℤ_[c.p])
    (hβ₀ : PadicInt.appr β₀ c.m = c.residue₀)
    (hβ : ∀ j, PadicInt.appr (β j) c.m = c.residue j)
    (b : Fin (k + 1) → ℤ) (hb : ∀ j, |(b j : ℚ)| ≤ c.X j)
    (hzero : c.residue₀ = 0 → b ≠ 0) :
    ¬ (c.p : ℤ_[c.p]) ^ c.m ∣ padicLinearForm β₀ β b := sorry

/-- Compatibility with the semantic lattice built from the pinned PadicInt.appr. -/
theorem matrix_target_eq {k : ℕ} (c : RawPadicExclusionCertificate k) [Fact c.p.Prime]
    (β₀ : ℤ_[c.p]) (β : Fin k → ℤ_[c.p])
    (hβ₀ : PadicInt.appr β₀ c.m = c.residue₀)
    (hβ : ∀ j, PadicInt.appr (β j) c.m = c.residue j) :
    c.matrix = padicLatticeMatrix c.m c.W β ∧
      c.target = padicLatticeTarget c.m c.W β₀ := sorry

end RawPadicExclusionCertificate

-- raw_padic_one_dim: distance from -5 to 9ℤ is at least4; every b in[-3,3]
-- fails b≡5 mod9. B=4 and D=1 certify the complete finite distance search.
example : (RawPadicExclusionCertificate.mk (k := 0) 3 2 ![1] 5 Fin.elim0 ![3]
    (RawDistanceCertificate.mk ![![9]] ![-5] ![![1/9]] 4 15 1)).check = true := sorry

-- raw_padic_wrong_sign: even a sound distance bound cannot validate a mismatched target.
example : (RawPadicExclusionCertificate.mk (k := 0) 3 2 ![1] 5 Fin.elim0 ![3]
    (RawDistanceCertificate.mk ![![9]] ![5] ![![1/9]] 4 15 1)).check = false := sorry

-- raw_padic_bad_inverse: all numerical hypotheses, including distance replay, are checked.
example : (RawPadicExclusionCertificate.mk (k := 0) 3 2 ![1] 5 Fin.elim0 ![3]
    (RawDistanceCertificate.mk ![![9]] ![-5] 0 4 15 1)).check = false := sorry

-- raw_padic_composite: the same modulus9 as above does not make9 a prime base.
example : (RawPadicExclusionCertificate.mk (k := 0) 9 1 ![1] 5 Fin.elim0 ![3]
    (RawDistanceCertificate.mk ![![9]] ![-5] ![![1/9]] 4 15 1)).check = false := sorry

-- raw_padic_strict_boundary: b=-4 is an actual solution modulo9; equality16=16
-- must fail the strict separation check.
example : (RawPadicExclusionCertificate.mk (k := 0) 3 2 ![1] 5 Fin.elim0 ![4]
    (RawDistanceCertificate.mk ![![9]] ![-5] ![![1/9]] 4 16 1)).check = false := sorry

-- raw_padic_zero_box: homogeneous zero is excluded from the conclusion, as in the source.
example : (RawPadicExclusionCertificate.mk (k := 0) 3 1 ![1] 0 Fin.elim0 ![0]
    (RawDistanceCertificate.mk ![![3]] 0 ![![1/3]] 1 1 1)).check = true := sorry

-- raw_distance_one: the integer lattice has squared nonzero distance at least one.
example : (RawDistanceCertificate.mk (n := 1) 1 0 1 1 1 1).check = true := by
  sorry
-- raw_distance_bad_inverse: a forged inverse is rejected.
example : (RawDistanceCertificate.mk (n := 1) 1 0 0 1 1 1).check = false := by
  sorry
-- raw_distance_integral_target: no positive bound for an integral, nonzero target.
example : (RawDistanceCertificate.mk (n := 1) 1 ![1] 1 1 1 2).check = false := by
  sorry

-- raw_real_ten: a full rational check with θ=10 and homogeneous β=0.
example : (RawRealExclusionCertificate.mk (k := 0) 1 ![1] ![10] 0 true
    ![10] ![10] 0 0 ![1] 1
    (RawDistanceCertificate.mk ![![10]] 0 ![![1/10]] 2 4 1)).check = true := by
  sorry
-- raw_real_bad_endpoint: an endpoint with excessive rounding error is rejected.
example : (RawRealExclusionCertificate.mk (k := 0) 1 ![1] ![10] 0 true
    ![10] ![12] 0 0 ![1] 1
    (RawDistanceCertificate.mk ![![10]] 0 ![![1/10]] 2 4 1)).check = false := by
  sorry
-- raw_real_bad_distance: the enclosure check replays the inverse check too.
example : (RawRealExclusionCertificate.mk (k := 0) 1 ![1] ![10] 0 true
    ![10] ![10] 0 0 ![1] 1
    (RawDistanceCertificate.mk ![![10]] 0 0 2 4 1)).check = false := by
  sorry

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

/-- An empty complete representative set certifies that there are no solutions. -/
theorem solutions_eq_empty (cov : ThueFactorCovering g m K ξ) (hM : cov.M = ∅) :
    thueSolutions g m = ∅ := sorry

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

-- covering_empty_solutions: dispatch before taking representative extrema.
example {g : ℤ[X]} {m : ℤ} {K : Type*} [Field K] [NumberField K] {ξ : K}
    (cov : ThueFactorCovering g m K ξ) (hM : cov.M = ∅) :
    thueSolutions g m = ∅ := sorry

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
  sorry

/-! ### ED.2/thue-analytic-constants -/

/-- Tzanakis–de Weger's `C₁ = 2^(n−1)|m| / min |g′(ξ)|` over the real roots. -/
def ThueConstants.C₁ (g : ℤ[X]) (m : ℤ) : ℝ := sorry

/-- Tzanakis–de Weger's `C₂ = ½ min |ξ⁽ⁱ⁾ − ξ⁽ʲ⁾|`. -/
def ThueConstants.C₂ (g : ℤ[X]) : ℝ := sorry

/-- Tzanakis–de Weger's `C₃ = max |ξ⁽ⁱ¹⁾ − ξ⁽ⁱ²⁾| / |ξ⁽ⁱ¹⁾ − ξ⁽ⁱ³⁾|` over pairwise distinct roots. -/
def ThueConstants.C₃ (g : ℤ[X]) : ℝ := sorry

/-- Tzanakis–de Weger's threshold `Y₀` (equal to `1` when every root is real). -/
def ThueConstants.realY₀ (g : ℤ[X]) (m : ℤ) : ℝ := sorry

/-- Supporting archimedean bounds and scalar parameters. This record certifies
only the displayed root/threshold inequalities. The unit-matrix and representative
inequalities for c₄,c₅,μp remain explicit hypotheses of downstream semantic lemmas.
It is not the omitted full ThueConstants certificate or its finite producer. -/
structure ThueBoundParameters (g : ℤ[X]) (m : ℤ) where
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

-- ThueConstants.ofBoxes: OMITTED (§13), including the actual covering,
-- complete fundamental units, root/representative/logarithm enclosures and
-- interval-inverse witnesses. Root polynomial and precision alone are insufficient.

attribute [local instance] Matrix.linftyOpNormedRing in
/-- The certified bound `‖V‖_∞ / (1 − ρ)` for `N[U⁻¹]` (maximal absolute row sum) obtained
from an approximate inverse `V` with `‖1 − V·U‖_∞ ≤ ρ`. -/
def invNormBound {r : ℕ} (V : Matrix (Fin r) (Fin r) ℝ) (ρ : ℝ) : ℝ := ‖V‖ / (1 - ρ)

attribute [local instance] Matrix.linftyOpNormedRing in
theorem inv_norm_le {r : ℕ} (U V : Matrix (Fin (r + 1)) (Fin (r + 1)) ℝ) (ρ : ℝ) (hρ : ρ < 1)
    (h : ‖1 - V * U‖ ≤ ρ) : IsUnit U ∧ ‖U⁻¹‖ ≤ invNormBound V ρ := sorry

/-- Supporting weakening of c₁ alone, with every affected coupled inequality
supplied. The full ThueConstants.mono contract is separately omitted. -/
def weakenC1Bound {g : ℤ[X]} {m : ℤ} (T : ThueBoundParameters g m) (c₁' : ℚ) (h : T.c₁ ≤ c₁')
    (hY₁ : 4 * c₁' ≤ (T.Y₁ : ℚ) ^ (g.natDegree - 2))
    (hY₁s : 2 * c₁' * T.c₃ / T.c₂ ≤ (T.Y₁s : ℚ) ^ g.natDegree)
    (hc₆ : (1.39 : ℚ) * c₁' * T.c₃ * T.c₄ ^ g.natDegree / T.c₂ ≤ T.c₆) :
    ThueBoundParameters g m := sorry

end ThueConstants

-- thueConstants_cubic: C₁ ≈ 0.83995 for x³ − 2y³ = 1.
example : (0.8399 : ℝ) < ThueConstants.C₁ (X ^ 3 - C 2) 1 ∧
    ThueConstants.C₁ (X ^ 3 - C 2) 1 < 0.84 ∧
    (1.091 : ℝ) < ThueConstants.C₂ (X ^ 3 - C 2) ∧
    ThueConstants.C₂ (X ^ 3 - C 2) < 1.092 ∧
    ∀ T : ThueBoundParameters (X ^ 3 - C 2) 1, 4 ≤ T.Y₁ := sorry

-- thueBounds_totally_complex: for X⁴ + X + 1 every solution has |Y| ≤ Y₀.
example (T : ThueBoundParameters (X ^ 4 + X + 1) 1) :
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
theorem thue_exists_close_real_root (E : ThueEquation) (T : ThueBoundParameters E.g E.m) (x y : ℤ)
    (h : thueForm E.g x y = E.m) (hy : (T.Y₀ : ℤ) < |y|) :
    ∃ ξ : ℝ, aeval ξ E.g = 0 ∧ |(x : ℝ) - y * ξ| * |(y : ℝ)| ^ (E.g.natDegree - 1) ≤ T.c₁ ∧
      ((T.Y₁ : ℤ) < |y| → ∃ k, ((x : ℚ) / y) = ξ.convergent k) := sorry

/-- Lemma 1.2 with (1.2)–(1.4): `z ≠ 1` (so `Λ ≠ 0`) and `|Λ| = ‖log z‖` is small, where
`Λ = log |z|` (real case) or `Λ = −i Log z` (complex case). -/
theorem thue_linearForm_small {K : Type*} [Field K] [NumberField K] (E : ThueEquation) (ξ : K)
    (hξ : aeval ξ E.g = 0) (T : ThueBoundParameters E.g E.m) (σ τ υ : K →+* ℂ)
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
    (T : ThueBoundParameters E.g E.m) (cov : ThueFactorCovering E.g E.m K ξ)
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
structure SemanticThueReductionCase {g : ℤ[X]} {m : ℤ} {K : Type*} [Field K] [NumberField K] {ξ : K}
    (cov : ThueFactorCovering g m K ξ) (T : ThueBoundParameters g m) (μ : K) (σ : K →+* ℂ) where
  τ : K →+* ℂ
  υ : K →+* ℂ
  matveev : MatveevConstantCertificate (cov.r + 2)
    (g.natDegree * (g.natDegree - 1) * (g.natDegree - 2))
  c₈ : ℚ
  logC₆ : ℚ
  log2b : ℚ
  K₃ : ℚ
  chain : WeightedExponentReductionChain (fun _ => 1) (thueExponentSet cov T.Y₂ μ σ)

namespace SemanticThueReductionCase

open NumberField

variable {g : ℤ[X]} {m : ℤ} {K : Type*} [Field K] [NumberField K] {ξ : K}
  {cov : ThueFactorCovering g m K ξ} {T : ThueBoundParameters g m} {μ : K} {σ : K →+* ℂ}

/-- Semantic hypotheses for one case: distinct conjugates, the admissibility of the Matveev certificate
through the height bounds `h(δ_μ) ≤ 4h(ξ) + 2 log 2 + 2h(μ)`, `h(εᵢ^{(k)}/εᵢ^{(j)}) ≤ 2h(εᵢ)`,
`h(−1) = 0` and the logarithm enclosures, the enclosures `Ĉ₈ ≥ 1 + log(r + 2)`,
`ℓ⁺(ĉ₆) ≥ log ĉ₆`, `ℓ⁺(2b) ≥ log 2b`, the inequality `K₃ ≥ max(1, 2a + 2b(ℓ⁺(2b) − 1))` with
`a = (ĉ₅/n)(ℓ⁺(ĉ₆) + C₇Ĉ₈)`, `b = ĉ₅C₇/n`, and the start `X₀ ≥ (r + 2)K₃/2` of the chain. -/
structure Valid (R : SemanticThueReductionCase cov T μ σ) : Prop where
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

end SemanticThueReductionCase

open NumberField in
/-- The data used when `s ≥ 1`: a factor covering (its conditions (U), (M) are fields of
`ThueFactorCovering`, hypotheses of soundness rather than checks), the cases, the reduced
exponent bound `A_red`, two embeddings `l₁, l₂` and the rational bounds `Ê_{l₁}, Ê_{l₂}`. -/
structure SemanticThueReductionData (E : ThueEquation) (K : Type*) [Field K] [NumberField K] (ξ : K)
    (T : ThueBoundParameters E.g E.m) where
  covering : ThueFactorCovering E.g E.m K ξ
  cases : ∀ μ ∈ covering.M, ∀ σ : K →+* ℂ, SemanticThueReductionCase covering T μ σ
  Ared : ℕ
  l₁ : K →+* ℂ
  l₂ : K →+* ℂ
  Ê₁ : ℚ
  Ê₂ : ℚ

namespace SemanticThueReductionData

open NumberField

variable {E : ThueEquation} {K : Type*} [Field K] [NumberField K] {ξ : K} {T : ThueBoundParameters E.g E.m}

/-- Semantic hypotheses for the search bound `C`: the covering constants are
dominated (`ĉ₄ ≥ C₄`, `ĉ₅ ≥ C₅`, `μ̂₊ ≥ μ₊`), every case is valid, every chain ends below
`A_red`, `Ê_l ≥ ∏ᵢ max(|εᵢ^{(l)}|, |εᵢ^{(l)}|⁻¹)`, and Pethő's bound
`μ̂₊(Ê_{l₁}^{A_red} + Ê_{l₂}^{A_red}) / (2ĉ₂) ≤ C` (with `2ĉ₂ ≤ |ξ^{(l₁)} − ξ^{(l₂)}|`). -/
structure Valid (D : SemanticThueReductionData E K ξ T) (C : ℕ) : Prop where
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

end SemanticThueReductionData

/-- The data of a Thue certificate: constants, the reduction data when `s ≥ 1`, the search
bound `C`, rational approximations of the real roots and the claimed list `L`. -/
structure SemanticThueCertificate (E : ThueEquation) (K : Type*) [Field K] [NumberField K] (ξ : K) where
  constants : ThueBoundParameters E.g E.m
  reduction : Option (SemanticThueReductionData E K ξ constants)
  searchBound : ℕ
  rootApprox : Finset ℚ
  solutions : Finset (ℤ × ℤ)

namespace SemanticThueCertificate

open NumberField

variable {E : ThueEquation} {K : Type*} [Field K] [NumberField K] {ξ : K}

/-- Semantic validity, not a finite checker: this predicate has genuine real
inequalities and universally quantified completeness hypotheses. `L` passes the exact test and contains the
small solutions, the convergent candidates and the candidates of the exceptional exponent
vectors; when a real root exists the reduction data are present and valid for `C`. -/
structure Valid (c : SemanticThueCertificate E K ξ) : Prop where
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

theorem solutions_subset (c : SemanticThueCertificate E K ξ) (hc : c.Valid) :
    (c.solutions : Set (ℤ × ℤ)) ⊆ thueSolutions E.g E.m := sorry

/-- ED.2/thue-certified-solution-set: the classes `|Y| ≤ Ŷ₁` (enumerated),
`Ŷ₁ < |Y| ≤ C` (convergents), `C < |Y|` with `A ≤ K₃` (reduction chains and Pethő's bound) and
`A > K₃` (Matveev through the case certificates) exhaust the solutions. -/
theorem solutions_eq (c : SemanticThueCertificate E K ξ) (hc : c.Valid) (hξ : aeval ξ E.g = 0)
    (hK : Module.finrank ℚ K = E.g.natDegree) :
    thueSolutions E.g E.m = c.solutions := sorry

end SemanticThueCertificate

-- semantic_thueCert_contains_known_solutions (supporting conditional soundness): a valid certificate for x³ − 2y³ = 1 lists (1, 0) and (−1, −1).
example (E : ThueEquation) (hE : E.g = X ^ 3 - C 2) (hm : E.m = 1) (K : Type*) [Field K]
    [NumberField K] (ξ : K) (hξ : aeval ξ E.g = 0) (hK : Module.finrank ℚ K = E.g.natDegree)
    (c : SemanticThueCertificate E K ξ) (hc : c.Valid) :
    ((1 : ℤ), (0 : ℤ)) ∈ c.solutions ∧ ((-1 : ℤ), (-1 : ℤ)) ∈ c.solutions :=
  sorry

-- thueCert_totally_complex: OMITTED (§13), pending replayable raw certificate data.

-- semantic_thueCert_bad_box: validity requires the root approximations, whatever the list.
example (E : ThueEquation) (K : Type*) [Field K] [NumberField K] (ξ : K)
    (c : SemanticThueCertificate E K ξ) (ξr : ℝ) (hξr : aeval ξr E.g = 0)
    (hbad : ∀ ξt ∈ c.rootApprox, 1 / (6 * (c.searchBound : ℝ) ^ 2) ≤ |(ξt : ℝ) - ξr|) :
    ¬ c.Valid := sorry

-- semantic_thueCert_extra_pair: (2, 1) cannot be listed for x³ − 2y³ = 1.
example (E : ThueEquation) (hE : E.g = X ^ 3 - C 2) (hm : E.m = 1) (K : Type*) [Field K]
    [NumberField K] (ξ : K) (c : SemanticThueCertificate E K ξ)
    (h : ((2 : ℤ), (1 : ℤ)) ∈ c.solutions) : ¬ c.Valid := sorry

-- semantic_thueCert_compat: equality of the Finset coerced to Set with Mathlib-style solution set.
example (E : ThueEquation) (K : Type*) [Field K] [NumberField K] (ξ : K)
    (hξ : aeval ξ E.g = 0) (hK : Module.finrank ℚ K = E.g.natDegree)
    (c : SemanticThueCertificate E K ξ) (hc : c.Valid) (p : ℤ × ℤ) :
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
theorem prime_ideal_removing_unramified {K : Type*} [Field K] [NumberField K] (θ : 𝓞 K) (p : ℕ)
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
-- tmCovering_example_cases: all five element cases of TdW 6^Ex, printed p.234.
-- Ordering (2,3,5,7) is part of the regression, not an unspecified permutation.
example (E : ThueMahlerEquation) (hE : E.g = X ^ 3 - 23 * X ^ 2 + 5 * X + 24)
    (hc : E.c = 1 ∨ E.c = -1) (hv : E.v = 4)
    (hp : ∀ i : Fin 4, E.p (Fin.cast hv.symm i) = (![2, 3, 5, 7] : Fin 4 → ℕ) i)
    (K : Type*) [Field K] [NumberField K] (hK : Module.finrank ℚ K = 3) (θ : K)
    (hθ : aeval θ E.g = 0) :
    let ω := (2 + θ - θ ^ 2) / 5
    let π₂₁ := 22 + 25 * θ + 6 * ω
    let π₃₁ := 31 - 41 * θ + 47 * ω
    let π₅₁ := 133 + 150 * θ + 36 * ω
    let π₅₂ := 89 + 100 * θ + 24 * ω
    let π₅₃ := 111 - 90 * θ - 16 * ω
    let π₇₁ := 1 - θ
    let mkCase := fun (α π₅ : K) (t₅ : ℕ) =>
      ({ α := α
         π := fun j => (![π₂₁, π₃₁, π₅, π₇₁] : Fin 4 → K) (Fin.cast hv j)
         h := fun _ => 1
         s := fun _ => 0
         t := fun j => if j.val = 2 then t₅ else 0 } : ThueMahlerCase K E.v)
    ∃ cov : ThueMahlerCovering E K θ,
      cov.cases = [mkCase 1 π₅₁ 0, mkCase 1 π₅₂ 0,
        mkCase π₅₃ π₅₂ 1, mkCase 1 π₅₃ 0, mkCase π₅₂ π₅₃ 1] := sorry

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
-- tmCovering_nonempty_of_solution: supporting semantic consequence only.
-- The actual missing-Case-III regression is omitted under its original name.
example (E : ThueMahlerEquation) (K : Type*) [Field K] [NumberField K] (θ : K)
    (cov : ThueMahlerCovering E K θ) (u : ℤ × ℤ × (Fin E.v → ℕ))
    (hu : u ∈ thueMahlerSolutions E.g E.c E.p) : cov.cases ≠ [] := sorry

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
  sorry

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
structure SemanticThueMahlerCertificate (E : ThueMahlerEquation) (K : Type*) [Field K] [NumberField K]
    (θ : K) where
  covering : ThueMahlerCovering E K θ
  w : Fin (E.v + covering.r) → ℕ
  K₀ : ℚ
  chain : ∀ j : Fin covering.cases.length,
    WeightedExponentReductionChain w (thueMahlerExponentSet covering (covering.cases.get j))
  residualBox : Fin covering.cases.length → (Fin E.v → ℕ) × ℕ
  solutions : Finset (ℤ × ℤ × (Fin E.v → ℕ))

namespace SemanticThueMahlerCertificate

open NumberField

variable {E : ThueMahlerEquation} {K : Type*} [Field K] [NumberField K] {θ : K}

/-- The exact test of a tuple `(n, a)` of the case `j`: if `±α∏εᵢ^aᵢ∏πᵢ^nᵢ = f₀x − yθ` with
`(x, y, (nᵢhᵢ + s′ᵢ + t′ᵢ)ᵢ)` a normalised solution, that triple is listed. -/
def Tested (c : SemanticThueMahlerCertificate E K θ) (j : Fin c.covering.cases.length)
    (n : Fin E.v → ℕ) (a : Fin c.covering.r → ℤ) : Prop :=
  ∀ σ ∈ ({1, -1} : Finset K), ∀ x y : ℤ,
    ((E.g.leadingCoeff * x : ℤ) : K) - (y : K) * θ = σ * (c.covering.cases.get j).α *
      (∏ i, (((c.covering.ε i : (𝓞 K)ˣ) : 𝓞 K) : K) ^ a i) *
        ∏ i, (c.covering.cases.get j).π i ^ n i →
    (x, y, fun i => n i * (c.covering.cases.get j).h i + (c.covering.cases.get j).s i +
      (c.covering.cases.get j).t i) ∈ thueMahlerSolutions E.g E.c E.p →
    (x, y, fun i => n i * (c.covering.cases.get j).h i + (c.covering.cases.get j).s i +
      (c.covering.cases.get j).t i) ∈ c.solutions

/-- Semantic validity, not a finite checker. In particular initial_bound and Tested
are mathematical propositions, not bounded transcripts. The weights are positive;
`K₀` bounds the weighted exponent height of every case
(ED.2/thue-mahler-initial-bounds) and starts every chain; every chain ends inside its residual
box; every tuple of every residual box and every exceptional tuple passes the exact test
(bounded quantifiers over `Finset.range` and `Finset.Icc`); listed triples are solutions. -/
structure Valid (c : SemanticThueMahlerCertificate E K θ) : Prop where
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

theorem solutions_subset (c : SemanticThueMahlerCertificate E K θ) (hc : c.Valid) :
    (c.solutions : Set (ℤ × ℤ × (Fin E.v → ℕ))) ⊆ thueMahlerSolutions E.g E.c E.p := sorry

/-- ED.2/thue-mahler-certified-solution-set. -/
theorem solutions_eq (c : SemanticThueMahlerCertificate E K θ) (hc : c.Valid)
    (hθ : aeval θ (integralNormalization E.g) = 0) (hK : Module.finrank ℚ K = E.g.natDegree) :
    thueMahlerSolutions E.g E.c E.p = c.solutions := sorry

end SemanticThueMahlerCertificate

-- semantic_tmCert_contains_known_solution (supporting conditional soundness): a valid certificate for x³ − 2y³ = 5^z lists (3, 1, 2).
example (E : ThueMahlerEquation) (hE : E.g = X ^ 3 - C 2) (hc : E.c = 1) (hv : E.v = 1)
    (hp : ∀ i, E.p i = 5) (K : Type*) [Field K] [NumberField K] (θ : K)
    (hθ : aeval θ (integralNormalization E.g) = 0) (hK : Module.finrank ℚ K = E.g.natDegree)
    (c : SemanticThueMahlerCertificate E K θ) (hval : c.Valid) :
    ∃ s ∈ c.solutions, s.1 = 3 ∧ s.2.1 = 1 ∧ ∀ i, s.2.2 i = 2 := sorry

-- semantic_tmCert_wrong_z: a certificate listing (3, 1, 1) for x³ − 2y³ = 5^z is invalid.
example (E : ThueMahlerEquation) (hE : E.g = X ^ 3 - C 2) (hc : E.c = 1)
    (hp : ∀ i, E.p i = 5) (K : Type*) [Field K] [NumberField K] (θ : K)
    (c : SemanticThueMahlerCertificate E K θ) (z : Fin E.v → ℕ) (hz : ∀ i, z i = 1)
    (h : ((3 : ℤ), (1 : ℤ), z) ∈ c.solutions) : ¬ c.Valid := sorry

-- semantic_tmCert_missing_solution: validity fails when a solution escapes the list.
example (E : ThueMahlerEquation) (K : Type*) [Field K] [NumberField K] (θ : K)
    (hθ : aeval θ (integralNormalization E.g) = 0) (hK : Module.finrank ℚ K = E.g.natDegree)
    (c : SemanticThueMahlerCertificate E K θ) (s : ℤ × ℤ × (Fin E.v → ℕ))
    (hs : s ∈ thueMahlerSolutions E.g E.c E.p) (hnot : s ∉ c.solutions) : ¬ c.Valid := sorry

-- semantic_tmCert_no_primes_listed: for v = 0 the certificate certifies coprime solutions of F = c.
example (E : ThueMahlerEquation) (hv : E.v = 0) (K : Type*) [Field K] [NumberField K] (θ : K)
    (c : SemanticThueMahlerCertificate E K θ) (hval : c.Valid)
    (s : ℤ × ℤ × (Fin E.v → ℕ)) (hs : s ∈ c.solutions) : thueForm E.g s.1 s.2.1 = E.c := sorry

-- semantic_tmCert_compat: solutions_subset with solutions_eq gives equality of the coerced Finset.
example (E : ThueMahlerEquation) (K : Type*) [Field K] [NumberField K] (θ : K)
    (hθ : aeval θ (integralNormalization E.g) = 0) (hK : Module.finrank ℚ K = E.g.natDegree)
    (c : SemanticThueMahlerCertificate E K θ) (hval : c.Valid) :
    (c.solutions : Set (ℤ × ℤ × (Fin E.v → ℕ))) = thueMahlerSolutions E.g E.c E.p := sorry

/-! ### ED.2/s-unit-equation -/

/-- Solutions of `x + y = 1` in rational `S`-units. -/
def sUnitSolutions (S : Finset ℕ) : Set (ℚ × ℚ) :=
  {p | p.1 ≠ 0 ∧ p.2 ≠ 0 ∧
    (∀ q : ℕ, q.Prime → q ∉ S → padicValRat q p.1 = 0 ∧ padicValRat q p.2 = 0) ∧
    p.1 + p.2 = 1}

theorem mem_sUnitSolutions (S : Finset ℕ) (x y : ℚ) : (x, y) ∈ sUnitSolutions S ↔
    x ≠ 0 ∧ y ≠ 0 ∧ (∀ q : ℕ, q.Prime → q ∉ S → padicValRat q x = 0 ∧ padicValRat q y = 0) ∧
      x + y = 1 := by
  sorry

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
structure SemanticSUnitCertificate (S : Finset ℕ) where
  yu : 2 ≤ S.card → ∀ p ∈ S, YuConstantCertificate S.card 1 p
  X₀ : ℚ
  w : Fin S.card → ℕ
  chain : ExponentReductionChain (sUnitExponentSet S)
  finalBound : ℕ → ℕ
  exceptional : Finset (ℚ × ℚ)
  solutions : Finset (ℚ × ℚ)

namespace SemanticSUnitCertificate

variable {S : Finset ℕ}

/-- Semantic validity, not a finite checker. The Yu admissibility and logarithm
bounds are external mathematical hypotheses. The Yu certificates are admissible for
`(−1, (q)_{q ∈ S ∖ {p}})` and `X₀`
dominates the bound of ED.2/s-unit-initial-bounds (or `1` when `|S| ≤ 1`), the chain starts at
`X₀` and ends below the final bounds, every element `x = ±∏ pᵢ^eᵢ` of the final box (and of the
boxes of the exceptional vectors) with `(x, 1 − x)` a solution is listed, and the listed pairs
pass the exact test. The box indices are bounded; the real and solution-set predicates are semantic. -/
structure Valid (c : SemanticSUnitCertificate S) : Prop where
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

theorem solutions_subset (c : SemanticSUnitCertificate S) (hc : c.Valid) :
    (c.solutions : Set (ℚ × ℚ)) ⊆ sUnitSolutions S := sorry

/-- ED.2/s-unit-certified-solution-set: the initial bound (Yu), the chain and the exhaustive
enumeration of the final and exceptional boxes give every solution. -/
theorem solutions_eq (c : SemanticSUnitCertificate S) (hS : ∀ q ∈ S, q.Prime) (hc : c.Valid) :
    sUnitSolutions S = c.solutions := sorry

end SemanticSUnitCertificate

-- semantic_sUnitCert_two: for S = {2} (f(2) = 1) a valid certificate lists exactly
-- {(2, −1), (−1, 2), (1/2, 1/2)}.
example : ∃ c : SemanticSUnitCertificate {2}, c.Valid ∧ c.finalBound 2 = 1 ∧
    c.solutions = {((2 : ℚ), (-1 : ℚ)), ((-1 : ℚ), (2 : ℚ)), ((1 / 2 : ℚ), (1 / 2 : ℚ))} :=
  sorry

-- semantic_sUnitCert_empty: for S = ∅ a valid certificate lists nothing.
example (c : SemanticSUnitCertificate ∅) (hc : c.Valid) : c.solutions = ∅ := sorry

-- semantic_sUnitCert_missing: f(3) = 1 cannot be a valid final bound for S = {2, 3} when the
-- exceptional list omits (9/8, −1/8).
example (c : SemanticSUnitCertificate {2, 3}) (hf : c.finalBound 3 = 1)
    (hex : ((9 / 8 : ℚ), (-1 / 8 : ℚ)) ∉ c.exceptional) : ¬ c.Valid := sorry

-- semantic_sUnitCert_compat: the certified set is finite, as DT.4 predicts.
example (S : Finset ℕ) (hS : ∀ q ∈ S, q.Prime) (c : SemanticSUnitCertificate S) (hc : c.Valid) :
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

/-- The same count for the actual pinned descent map on the actual local point group. -/
theorem card_localDescentImage_padic (p : ℕ) [Fact p.Prime]
    (W : WeierstrassCurve.Affine ℚ_[p]) [DecidableEq ℚ_[p]]
    [W.IsElliptic] [W.IsCharNeTwoNF] :
    Nat.card W.μ.range =
      (if p = 2 then 2 else 1) * Nat.card (nsmulAddMonoidHom (α := W.Point) 2).ker := by
  sorry

/-- The real descent image has half as many elements as the actual 2-torsion subgroup. -/
theorem two_mul_card_localDescentImage_real (W : WeierstrassCurve.Affine ℝ)
    [DecidableEq ℝ] [W.IsElliptic] [W.IsCharNeTwoNF] :
    2 * Nat.card W.μ.range = Nat.card (nsmulAddMonoidHom (α := W.Point) 2).ker := by
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

/-- For the actual local curve in characteristic-≠2 normal form, absence of bad primes over
`ℤ_p` says that 2 and Δ are units and the coefficients are integral. The pinned `W.A` is the
étale cubic algebra, `W.M` its unit square classes, `W.μ` the corrected x−T descent map and
`W.normM` its induced norm. `W.selmerGroupA ℤ_[p]` uses the actual irreducible factors of W.f
and their integral closures. Its even-valuation classes are unramified because p is odd.
The unramified factor/unit-square norm count is a proof obligation, not an input cardinality.
Requires the individual import
`TauCeti.AlgebraicGeometry.EllipticCurve.MordellWeil.SelmerGroupA`. -/
theorem localCondition_eq_unramified_of_good (p : ℕ) [Fact p.Prime] (hp : p ≠ 2)
    (W : WeierstrassCurve.Affine ℚ_[p]) [DecidableEq ℚ_[p]]
    [W.IsElliptic] [W.IsCharNeTwoNF] (hgood : W.badPrimes ℤ_[p] = ∅) :
    W.μ.range = W.selmerGroupA ℤ_[p] ⊓ W.normM.ker := by
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

-- twoSelmer_le_unconditioned: abstract containment in the supplied norm kernel.
-- The actual x³−x order-sixteen regression remains a precise same-name omission.
example (μ : Multiplicative A →* M) (N : M →* Q) (μv : ∀ v, Multiplicative (Av v) →* Mv v)
    (res : ∀ v, M →* Mv v) (C : TwoSelmerCertificate μ N μv res) :
    C.selmer ≤ C.AS ⊓ N.ker := by
  sorry

-- twoSelmer_eq_supplied_localIntersection: equality with an abstract subgroup having
-- the supplied all-place membership rule. The actual pinned-curve comparison is omitted.
example (μ : Multiplicative A →* M) (N : M →* Q) (μv : ∀ v, Multiplicative (Av v) →* Mv v)
    (res : ∀ v, M →* Mv v) (C : TwoSelmerCertificate μ N μv res)
    (hgood : ∀ v ∉ C.places, ∀ m ∈ C.AS ⊓ N.ker, res v m ∈ (μv v).range)
    (hunram : ∀ m, N m = 1 → (∀ v, res v m ∈ (μv v).range) → m ∈ C.AS) (sel : Subgroup M)
    (hsel : ∀ m, m ∈ sel ↔ N m = 1 ∧ ∀ v, res v m ∈ (μv v).range) :
    C.selmer = sel := by
  sorry

-- twoSelmer_cardinality_gap: supporting abstract inequality, not the actual 571a1 regression.
-- PROTOCOL §13 omission: twoSelmer_not_image.
-- Required: for Cremona 571a1, W₀=[0,−1,1,−929,−10595], use the actual rational isomorphism
-- (x,y) ↦ (4x,8y+4) to W:y²=x³−4x²−14864x−678064 in characteristic-≠2 normal form.
-- Construct the actual global square classes, norm/restriction matrices and complete local
-- images, prove #W.μ.range=1 and #Sel₂(W)=4 (Cremona III p.91), and deduce non-equality.
-- No input cardinality, basis length or assumed non-equality discharges this regression.
-- The full local-factor and global descent replay supplier remains absent.
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

-- General-number-field Silverman μ and comparison: inherited source read; independently unread here.

/-- Accessible rational bound: half of Cremona III, Proposition 3.5.1, p.77.
The preceding revision reported the general-number-field Silverman statement in the omission register. This independent review could not recover that primary text; its weighted Lean interface remains omitted. -/
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

/-- Rational enclosure from explicitly supplied logarithm endpoints and error bounds.
The constructor does only exact arithmetic; containment requires the certification hypotheses
below. The CN.4 logarithm/enclosure producer is a separate supplier. -/
def canonicalHeightEnclosure (P : W.toAffine.Point) (n : ℕ)
    (lambdaMinus lambdaPlus cMinus cPlus : ℚ) : ℚ × ℚ :=
  if (2 ^ n) • P = 0 then (0, 0)
  else ((lambdaMinus / 2 - cMinus) / 4 ^ n, (lambdaPlus / 2 + cPlus) / 4 ^ n)

/-- The three supplied log intervals are ordered as P+Q, P, Q; error bounds are shared. -/
def pairingEnclosure (P Q : W.toAffine.Point) (n : ℕ)
    (bounds : Fin 3 → ℚ × ℚ) (cMinus cPlus : ℚ) : ℚ × ℚ :=
  let I := canonicalHeightEnclosure W (P + Q) n (bounds 0).1 (bounds 0).2 cMinus cPlus
  let J := canonicalHeightEnclosure W P n (bounds 1).1 (bounds 1).2 cMinus cPlus
  let L := canonicalHeightEnclosure W Q n (bounds 2).1 (bounds 2).2 cMinus cPlus
  ((I.1 - J.2 - L.2) / 2, (I.2 - J.1 - L.1) / 2)

local notation "ĥ" => WeierstrassCurve.Affine.Point.canonicalHeight (W := W.toAffine)

theorem canonicalHeight_mem_canonicalHeightEnclosure (h₁ : IsIntegral ℤ W.a₁)
    (h₂ : IsIntegral ℤ W.a₂) (h₃ : IsIntegral ℤ W.a₃) (h₄ : IsIntegral ℤ W.a₄)
    (h₆ : IsIntegral ℤ W.a₆) (P : W.toAffine.Point) (n : ℕ)
    (lambdaMinus lambdaPlus cMinus cPlus : ℚ)
    (hlog : (lambdaMinus : ℝ) ≤ ((2 ^ n) • P).naiveHeight ∧
      ((2 ^ n) • P).naiveHeight ≤ (lambdaPlus : ℝ))
    (hminus : NumberField.absLogHeight₁ W.j / 24 + cremonaMu W + 961 / 1000 ≤ (cMinus : ℝ))
    (hplus : cremonaMu W + 107 / 100 ≤ (cPlus : ℝ)) :
    ((canonicalHeightEnclosure W P n lambdaMinus lambdaPlus cMinus cPlus).1 : ℝ) ≤ ĥ P ∧
      ĥ P ≤ (canonicalHeightEnclosure W P n lambdaMinus lambdaPlus cMinus cPlus).2 := by
  sorry

/-- Exact quantitative width; the origin branch also satisfies this nonnegative bound.
No unspecified existential constant replaces the supplied certified error budget. -/
theorem canonicalHeightEnclosure_width_le (P : W.toAffine.Point) (n : ℕ)
    (lambdaMinus lambdaPlus cMinus cPlus : ℚ) (hlambda : lambdaMinus ≤ lambdaPlus)
    (hminus : 0 ≤ cMinus) (hplus : 0 ≤ cPlus) :
    (canonicalHeightEnclosure W P n lambdaMinus lambdaPlus cMinus cPlus).2 -
      (canonicalHeightEnclosure W P n lambdaMinus lambdaPlus cMinus cPlus).1 ≤
      ((lambdaPlus - lambdaMinus) / 2 + cPlus + cMinus) / 4 ^ n := by
  sorry

theorem neronTatePairing_mem_pairingEnclosure (h₁ : IsIntegral ℤ W.a₁)
    (h₂ : IsIntegral ℤ W.a₂) (h₃ : IsIntegral ℤ W.a₃) (h₄ : IsIntegral ℤ W.a₄)
    (h₆ : IsIntegral ℤ W.a₆) (P Q : W.toAffine.Point) (n : ℕ)
    (bounds : Fin 3 → ℚ × ℚ) (cMinus cPlus : ℚ)
    (hPQ : ((bounds 0).1 : ℝ) ≤ ((2 ^ n) • (P + Q)).naiveHeight ∧
      ((2 ^ n) • (P + Q)).naiveHeight ≤ ((bounds 0).2 : ℝ))
    (hP : ((bounds 1).1 : ℝ) ≤ ((2 ^ n) • P).naiveHeight ∧
      ((2 ^ n) • P).naiveHeight ≤ ((bounds 1).2 : ℝ))
    (hQ : ((bounds 2).1 : ℝ) ≤ ((2 ^ n) • Q).naiveHeight ∧
      ((2 ^ n) • Q).naiveHeight ≤ ((bounds 2).2 : ℝ))
    (hminus : NumberField.absLogHeight₁ W.j / 24 + cremonaMu W + 961 / 1000 ≤ (cMinus : ℝ))
    (hplus : cremonaMu W + 107 / 100 ≤ (cPlus : ℝ)) :
    ((pairingEnclosure W P Q n bounds cMinus cPlus).1 : ℝ) ≤ (ĥ (P + Q) - ĥ P - ĥ Q) / 2 ∧
      (ĥ (P + Q) - ĥ P - ĥ Q) / 2 ≤ (pairingEnclosure W P Q n bounds cMinus cPlus).2 := by
  sorry

theorem canonicalHeightEnclosure_zero (n : ℕ) (lambdaMinus lambdaPlus cMinus cPlus : ℚ) :
    canonicalHeightEnclosure W 0 n lambdaMinus lambdaPlus cMinus cPlus = (0, 0) := by
  sorry

/-- Sign compatibility uses the same rational input intervals and error bounds. -/
theorem canonicalHeightEnclosure_neg (P : W.toAffine.Point) (n : ℕ)
    (lambdaMinus lambdaPlus cMinus cPlus : ℚ) :
    canonicalHeightEnclosure W (-P) n lambdaMinus lambdaPlus cMinus cPlus =
      canonicalHeightEnclosure W P n lambdaMinus lambdaPlus cMinus cPlus := by
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

-- enclosure_torsion: order-2 points return the exact interval after one doubling.
example (h : curveX3Plus1.toAffine.Nonsingular (-1) 0) (n : ℕ) (hn : 1 ≤ n)
    (lambdaMinus lambdaPlus cMinus cPlus : ℚ) :
    canonicalHeightEnclosure curveX3Plus1 (.some (-1) 0 h) n
      lambdaMinus lambdaPlus cMinus cPlus = (0, 0) := by
  sorry

-- enclosure_origin: no logarithm computation is needed at O.
example (n : ℕ) (lambdaMinus lambdaPlus cMinus cPlus : ℚ) :
    canonicalHeightEnclosure curveX3Plus1 0 n lambdaMinus lambdaPlus cMinus cPlus = (0, 0) := by
  sorry

-- enclosure_contains_tauceti: explicit certified log/error data in the pinned half-height convention.
example (P : curveX3Plus1.toAffine.Point) (n : ℕ) (lambdaMinus lambdaPlus cMinus cPlus : ℚ)
    (hlog : (lambdaMinus : ℝ) ≤ ((2 ^ n) • P).naiveHeight ∧
      ((2 ^ n) • P).naiveHeight ≤ (lambdaPlus : ℝ))
    (hminus : NumberField.absLogHeight₁ curveX3Plus1.j / 24 + cremonaMu curveX3Plus1 +
      961 / 1000 ≤ (cMinus : ℝ))
    (hplus : cremonaMu curveX3Plus1 + 107 / 100 ≤ (cPlus : ℝ)) :
    ((canonicalHeightEnclosure curveX3Plus1 P n lambdaMinus lambdaPlus cMinus cPlus).1 : ℝ) ≤ ĥ P ∧
      ĥ P ≤ (canonicalHeightEnclosure curveX3Plus1 P n lambdaMinus lambdaPlus cMinus cPlus).2 := by
  sorry

-- enclosure_not_naive: (2,3) is torsion; its positive half-naive height is not its canonical height.
example (h : curveX3Plus1.toAffine.Nonsingular 2 3) (lambdaMinus lambdaPlus cMinus cPlus : ℚ)
    (hlog : (lambdaMinus : ℝ) ≤ Real.log 2 ∧ Real.log 2 ≤ (lambdaPlus : ℝ))
    (hminus : NumberField.absLogHeight₁ curveX3Plus1.j / 24 + cremonaMu curveX3Plus1 +
      961 / 1000 ≤ (cMinus : ℝ))
    (hplus : cremonaMu curveX3Plus1 + 107 / 100 ≤ (cPlus : ℝ)) :
    ((canonicalHeightEnclosure curveX3Plus1 (.some 2 3 h) 0
      lambdaMinus lambdaPlus cMinus cPlus).1 : ℝ) ≤ 0 ∧
      (0 : ℝ) ≤ (canonicalHeightEnclosure curveX3Plus1 (.some 2 3 h) 0
        lambdaMinus lambdaPlus cMinus cPlus).2 ∧
      ĥ (.some 2 3 h) ≠ Height.logHeight (WeierstrassCurve.Affine.Point.some 2 3 h).xRep / 2 := by
  sorry

-- enclosure_width_budget: log width 1/8 and errors 2 and 3 give budget 81/(16*4^n).
example (P : curveX3Plus1.toAffine.Point) (n : ℕ) (a : ℚ) :
    (canonicalHeightEnclosure curveX3Plus1 P n a (a + 1 / 8) 2 3).2 -
      (canonicalHeightEnclosure curveX3Plus1 P n a (a + 1 / 8) 2 3).1 ≤
      81 / (16 * 4 ^ n) := by
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
example (p : ℕ) : IsPSaturated (⊤ : AddSubgroup ℤ) p := by
  sorry

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

/-- Supporting additive-group data: a finite-index subgroup with a supplied homomorphism.
The geometric Néron/formal-group construction is an exact same-name omission. -/
structure FormalLogDatum (K A T : Type*) [Field K] [AddCommGroup A] [AddCommGroup T]
    [Module K T] where
  kernel : AddSubgroup A
  finiteIndex : kernel.FiniteIndex
  formalLog : kernel →+ T
  /-- The supplied subgroup homomorphism has exactly its torsion as kernel. -/
  formalLog_eq_zero_iff : ∀ y : kernel, formalLog y = 0 ↔ IsOfFinAddOrder y
  /-- The supplied subgroup homomorphism has image spanning the target K-vector space. -/
  span_formalLog : Submodule.span K (Set.range formalLog) = ⊤

/-- Supporting extension of the supplied finite-index subgroup homomorphism to A.
This does not construct the geometric abelian logarithm or its analytic properties. -/
def formalLogExtension (D : FormalLogDatum K A T) : A →+ T := sorry

theorem formalLogExtension_eq_formalLog (D : FormalLogDatum K A T) (y : D.kernel) :
    formalLogExtension D y = D.formalLog y := sorry

theorem formalLogExtension_zsmul (D : FormalLogDatum K A T) (n : ℤ) (x : A) :
    formalLogExtension D (n • x) = n • formalLogExtension D x := sorry

theorem ker_formalLogExtension (D : FormalLogDatum K A T) (x : A) :
    formalLogExtension D x = 0 ↔ IsOfFinAddOrder x := sorry

theorem formalLogExtension_map {B T' : Type*} [AddCommGroup B] [AddCommGroup T'] [Module K T']
    (D : FormalLogDatum K A T) (D' : FormalLogDatum K B T') (φ : A →+ B) (dφ : T →ₗ[K] T')
    (hφ : ∀ y : D.kernel, ∃ hy : φ y ∈ D'.kernel, D'.formalLog ⟨φ y, hy⟩ = dφ (D.formalLog y))
    (x : A) : formalLogExtension D' (φ x) = dφ (formalLogExtension D x) := sorry

theorem formalLogExtension_compatible_inclusion {A' T' : Type*} [AddCommGroup A'] [AddCommGroup T'] [Module K T']
    (D : FormalLogDatum K A T) (D' : FormalLogDatum K A' T') (inc : A →+ A')
    (incT : T →ₗ[K] T')
    (h : ∀ y : D.kernel, ∃ hy : inc y ∈ D'.kernel, D'.formalLog ⟨inc y, hy⟩ = incT (D.formalLog y))
    (x : A) : formalLogExtension D' (inc x) = incT (formalLogExtension D x) := sorry

/-- Supporting evaluation of the abstract extension by a supplied linear functional. -/
def formalLogPairing (D : FormalLogDatum K A T) (x : A) (ω : Module.Dual K T) : K := sorry

theorem formalLogPairing_eq_zero_iff (D : FormalLogDatum K A T) (x : A) :
    (∀ ω : Module.Dual K T, formalLogPairing D x ω = 0) ↔ IsOfFinAddOrder x := sorry

theorem formalLogExtension_unique (D : FormalLogDatum K A T) (lam : A →+ T)
    (h : ∀ y : D.kernel, lam y = D.formalLog y) : lam = formalLogExtension D := sorry

-- formalLogExtension_eq_formalLog_rankOne: For arbitrary FormalLogDatum with rank-one target, the extension agrees with its supplied subgroup homomorphism; this does not identify an elliptic formal group.
example (D : FormalLogDatum K A T) (_hT : Module.finrank K T = 1) (x : A) (hx : x ∈ D.kernel) :
    formalLogExtension D x = D.formalLog ⟨x, hx⟩ := sorry

-- formalLogExtension_torsion: A torsion element of the arbitrary additive group maps to zero.
example (D : FormalLogDatum K A T) (x : A) (hx : IsOfFinAddOrder x) : formalLogExtension D x = 0 := sorry

-- formalLogExtension_noninjective_of_fiveTorsion: A supplied nonzero element killed by5 makes the extension noninjective; the elliptic curve and its torsion point are not constructed.
example (D : FormalLogDatum K A T) (x : A) (h5 : (5 : ℕ) • x = 0) (hx : x ≠ 0) :
    ¬ Function.Injective (formalLogExtension D) := sorry

-- formalLogExtension_preserves_threeAdicCongruence: A supplied subgroup element whose supplied formal logarithm is congruent to(36,3) modulo3^4 has the same congruence under the extension; no C₀(5) point or formal-group computation is supplied.
example (A : Type*) [AddCommGroup A] (D : FormalLogDatum ℚ_[3] A (Fin 2 → ℚ_[3]))
    (d : D.kernel) (hd : ∀ i, ‖D.formalLog d i - ![36, 3] i‖ ≤ (3 : ℝ)⁻¹ ^ 4) :
    ∀ i, ‖formalLogExtension D d i - ![36, 3] i‖ ≤ (3 : ℝ)⁻¹ ^ 4 := sorry

-- formalLogPairing_rightKernel: If a linear functional vanishes on the entire abstract extension image, it is zero by the supplied spanning hypothesis (the right kernel in point-first order).
example (D : FormalLogDatum K A T) (ω : Module.Dual K T)
    (h : ∀ x : A, formalLogPairing D x ω = 0) : ω = 0 := sorry

end AbelianLog

/-- Evaluation of a power series at a point of the open unit disc. -/
def discEval {p : ℕ} [Fact p.Prime] (f : PowerSeries ℚ_[p]) (z : ℚ_[p]) : ℚ_[p] :=
  ∑' n, PowerSeries.coeff n f * z ^ n

/-! ### ED.4/abelian-integral -/

section AbelianIntegral

variable {K : Type*} [Field K] [CharZero K]
variable {X J T Ω : Type*} [AddCommGroup J] [AddCommGroup T] [Module K T]
  [AddCommGroup Ω] [Module K Ω]

/-- Supporting formal-log evaluation through a supplied dual-space equivalence.
No geometric regular differential, divisor class or Abel–Jacobi pullback is constructed. -/
def formalLogIntegral (D : FormalLogDatum K J T) (e : Ω ≃ₗ[K] Module.Dual K T) (d : J) (ω : Ω) :
    K := sorry

/-- Supporting extensionality of supplied linear identifications. The actual pullback
isomorphism and its geometric base-point independence are omitted under §13. -/
theorem suppliedDualEquiv_ext (e e' : Ω ≃ₗ[K] Module.Dual K T)
    (h : ∀ ω, e ω = e' ω) : e = e' := sorry

theorem formalLogIntegral_add (D : FormalLogDatum K J T) (e : Ω ≃ₗ[K] Module.Dual K T)
    (d d' : J) (ω ω' : Ω) (a b : K) :
    formalLogIntegral D e (d + d') ω = formalLogIntegral D e d ω + formalLogIntegral D e d' ω ∧
    formalLogIntegral D e d (a • ω + b • ω') =
      a * formalLogIntegral D e d ω + b * formalLogIntegral D e d ω' := sorry

theorem formalLogIntegral_eq_zero_iff (D : FormalLogDatum K J T) (e : Ω ≃ₗ[K] Module.Dual K T)
    (d : J) : (∀ ω, formalLogIntegral D e d ω = 0) ↔ IsOfFinAddOrder d := sorry

theorem formalLogIntegral_map_of_pairingIdentity {J' T' Ω' : Type*} [AddCommGroup J'] [AddCommGroup T'] [Module K T']
    [AddCommGroup Ω'] [Module K Ω'] (D : FormalLogDatum K J T) (D' : FormalLogDatum K J' T')
    (e : Ω ≃ₗ[K] Module.Dual K T) (e' : Ω' ≃ₗ[K] Module.Dual K T')
    (ρstar : J →+ J') (ρpull : Ω' →ₗ[K] Ω)
    (hlog : ∀ d, ∀ ω', e (ρpull ω') (formalLogExtension D d) = e' ω' (formalLogExtension D' (ρstar d)))
    (d : J) (ω' : Ω') : formalLogIntegral D e d (ρpull ω') = formalLogIntegral D' e' (ρstar d) ω' :=
  sorry

theorem formalLogIntegral_trace_of_pairingIdentity {J' T' Ω' : Type*} [AddCommGroup J'] [AddCommGroup T']
    [Module K T'] [AddCommGroup Ω'] [Module K Ω'] (D : FormalLogDatum K J T)
    (D' : FormalLogDatum K J' T') (e : Ω ≃ₗ[K] Module.Dual K T)
    (e' : Ω' ≃ₗ[K] Module.Dual K T') (ρpic : J' →+ J) (tr : Ω →ₗ[K] Ω')
    (htr : ∀ d' ω, e ω (formalLogExtension D (ρpic d')) = e' (tr ω) (formalLogExtension D' d'))
    (d' : J') (ω : Ω) : formalLogIntegral D e (ρpic d') ω = formalLogIntegral D' e' d' (tr ω) :=
  sorry

theorem formalLogIntegral_compatible_inclusion_of_pairingIdentity {J' T' Ω' : Type*} [AddCommGroup J'] [AddCommGroup T']
    [Module K T'] [AddCommGroup Ω'] [Module K Ω'] (D : FormalLogDatum K J T)
    (D' : FormalLogDatum K J' T') (e : Ω ≃ₗ[K] Module.Dual K T)
    (e' : Ω' ≃ₗ[K] Module.Dual K T') (inc : J →+ J') (incΩ : Ω →ₗ[K] Ω')
    (h : ∀ d ω, e' (incΩ ω) (formalLogExtension D' (inc d)) = e ω (formalLogExtension D d)) (d : J) (ω : Ω) :
    formalLogIntegral D' e' (inc d) (incΩ ω) = formalLogIntegral D e d ω := sorry

-- formalLogIntegral_seriesCongruences_of_primitiveIdentity: For supplied residue data, the displayed power-series square-root equation and an assumed primitive identity imply the two3-adic congruences; identification with actual C₀(5) points and forms is omitted.
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
      formalLogIntegral L e (D.abelJacobi P₁ - D.abelJacobi P₀) (![ω₀, ω₁] i) =
        discEval I (D.param xt P₁) - discEval I (D.param xt P₀)) :
    ‖formalLogIntegral L e (D.abelJacobi P₁ - D.abelJacobi P₀) ω₀ - (2 * 3 + 3 ^ 4)‖ ≤
        (3 : ℝ)⁻¹ ^ 5 ∧
      ‖formalLogIntegral L e (D.abelJacobi P₁ - D.abelJacobi P₀) ω₁ - (2 * 3 ^ 2 + 2 * 3 ^ 3)‖ ≤
        (3 : ℝ)⁻¹ ^ 5 := sorry

-- formalLogIntegral_zero: Evaluation of the zero abstract class is zero.
example (D : FormalLogDatum K J T) (e : Ω ≃ₗ[K] Module.Dual K T) (ω : Ω) :
    formalLogIntegral D e 0 ω = 0 := sorry

-- formalLogIntegral_double_of_classRelation: A supplied relation2w=s in the abstract additive group gives twice the evaluation atw equal to that ats; no Weierstrass divisor relation is proved.
example (D : FormalLogDatum K J T) (e : Ω ≃ₗ[K] Module.Dual K T) (w s : J)
    (h : (2 : ℤ) • w = s) (ω : Ω) :
    2 * formalLogIntegral D e w ω = formalLogIntegral D e s ω := sorry

-- formalLogIntegral_eq_pairing: The supplied Ω-to-dual equivalence identifies formalLogIntegral with formalLogPairing; no elliptic curve or genus hypothesis is encoded.
example (D : FormalLogDatum K J T) (e : Ω ≃ₗ[K] Module.Dual K T) (d : J) (ω : Ω) :
    formalLogIntegral D e d ω = formalLogPairing D d (e ω) := sorry

-- formalLogIntegral_eq_zero_of_fiveTorsion: A supplied class killed by5 has zero evaluation; the concrete elliptic point is not constructed.
example (D : FormalLogDatum K J T) (e : Ω ≃ₗ[K] Module.Dual K T) (d : J) (h5 : (5 : ℕ) • d = 0)
    (_hd : d ≠ 0) (ω : Ω) : formalLogIntegral D e d ω = 0 := sorry

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

/-- Supporting finite-sum identity only; no divisor existence or uniqueness is asserted.
A sum represented by points
`Q₁, …, Q_g` of the disc of `P'` pairs as the sum of tiny integrals. -/
theorem sum_pairing_eq_sum_discEval {X Xt J Jt T Ω : Type} [AddCommGroup J]
    [AddCommGroup Jt] [AddCommGroup T] [Module ℚ_[p] T] [AddCommGroup Ω] [Module ℚ_[p] Ω]
    (D : ReductionDiscData p X Xt J Jt) (L : FormalLogDatum ℚ_[p] J T)
    (e : Ω ≃ₗ[ℚ_[p]] Module.Dual ℚ_[p] T) (ω : Ω) (P' : X) (lam : PowerSeries ℚ_[p])
    (hlam : ∀ P, D.red P = D.red P' →
      formalLogIntegral L e (D.abelJacobi P - D.abelJacobi P') ω = discEval lam (D.param (D.red P') P))
    (Qs : Finset X) (hQs : ∀ Q ∈ Qs, D.red Q = D.red P') :
    formalLogIntegral L e (∑ Q ∈ Qs, (D.abelJacobi Q - D.abelJacobi P')) ω =
      ∑ Q ∈ Qs, discEval lam (D.param (D.red P') Q) := sorry

/-- Supporting Dwork-style uniqueness calculation. The candidate function, local
constancy of its difference, and Frobenius-polynomial relation are hypotheses.
The actual Coleman-versus-abelian theorem remains an exact same-name omission. -/
theorem residueConstantDifference_eq_zero_of_frobeniusRelation {X Xt J Jt T Ω : Type} [AddCommGroup J]
    [AddCommGroup Jt] [AddCommGroup T] [Module ℚ_[p] T] [AddCommGroup Ω] [Module ℚ_[p] Ω]
    (D : ReductionDiscData p X Xt J Jt) (L : FormalLogDatum ℚ_[p] J T)
    (e : Ω ≃ₗ[ℚ_[p]] Module.Dual ℚ_[p] T) (ω : Ω) (candidatePrimitive : X → ℚ_[p]) (x : X)
    (frob : X → X) (hfrobred : ∀ y, D.red (frob y) = D.red y) (P : Polynomial ℤ)
    (hP : ∀ m : ℕ, 1 ≤ m → IsCoprime (P.map (Int.castRingHom ℚ)) (Polynomial.X ^ m - 1))
    (hloc : ∀ y y' : X, D.red y = D.red y' →
      candidatePrimitive y - formalLogIntegral L e (D.abelJacobi y - D.abelJacobi x) ω =
      candidatePrimitive y' - formalLogIntegral L e (D.abelJacobi y' - D.abelJacobi x) ω)
    (hfrob : ∃ c : ℚ_[p], ∀ y : X, ∑ i ∈ Finset.range (P.natDegree + 1),
      (P.coeff i : ℚ_[p]) * (candidatePrimitive (frob^[i] y) -
        formalLogIntegral L e (D.abelJacobi (frob^[i] y) - D.abelJacobi x) ω) = c)
    (hx : candidatePrimitive x = 0) (y : X) :
    candidatePrimitive y = formalLogIntegral L e (D.abelJacobi y - D.abelJacobi x) ω := sorry

/-- ED.4/disc-integration-constant (Wetherell): if `γ ∈ G` has the same reduction as `ι(B)`,
then `η(B) = ⟨ι(B) − γ, ω_J⟩`, a kernel-of-reduction value. -/
theorem eta_eq_const_add_tiny {X Xt J Jt T Ω : Type} [AddCommGroup J] [AddCommGroup Jt]
    [AddCommGroup T] [Module ℚ_[p] T] [AddCommGroup Ω] [Module ℚ_[p] Ω]
    (D : ReductionDiscData p X Xt J Jt) (L : FormalLogDatum ℚ_[p] J T)
    (e : Ω ≃ₗ[ℚ_[p]] Module.Dual ℚ_[p] T) (ω : Ω) (G : AddSubgroup J)
    (hω : ∀ γ ∈ G, formalLogIntegral L e γ ω = 0) (B : X) (γ : J) (hγ : γ ∈ G)
    (hred : D.redJ γ = D.redJ (D.abelJacobi B)) :
    D.redJ (D.abelJacobi B - γ) = 0 ∧
      formalLogIntegral L e (D.abelJacobi B) ω = formalLogIntegral L e (D.abelJacobi B - γ) ω :=
  sorry

end Disc

/-! ### ED.4/padic-closure-dimension and ED.4/annihilating-differentials -/

section Annihilator

variable {K : Type*} [Field K] [CharZero K]
variable {J T Ω : Type*} [AddCommGroup J] [AddCommGroup T] [Module K T] [FiniteDimensional K T]
  [AddCommGroup Ω] [Module K Ω]

/-- Supporting finite-span inequality only; this does not form a p-adic closure: `dim span log Γ ≤ min (rank Γ) g`;
the rank of `Γ` is given by a generating family `v : Fin r → J`. -/
theorem finrank_logSpan_le_card (D : FormalLogDatum K J T) {r : ℕ} (v : Fin r → J) :
    Module.finrank K (Submodule.span K (Set.range (fun i => formalLogExtension D (v i)))) ≤
      min r (Module.finrank K T) := sorry

/-- The differentials annihilating `Γ`: `{ω | ∀ γ ∈ Γ, ⟨γ, ω_J⟩ = 0}`. -/
def annihilatingDifferentials (D : FormalLogDatum K J T) (e : Ω ≃ₗ[K] Module.Dual K T)
    (Γ : AddSubgroup J) : Submodule K Ω := sorry

theorem mem_annihilatingDifferentials (D : FormalLogDatum K J T) (e : Ω ≃ₗ[K] Module.Dual K T)
    (Γ : AddSubgroup J) (ω : Ω) :
    ω ∈ annihilatingDifferentials D e Γ ↔ ∀ γ ∈ Γ, formalLogIntegral D e γ ω = 0 := sorry

theorem annihilatingDifferentials_eq_dualAnnihilator (D : FormalLogDatum K J T)
    (e : Ω ≃ₗ[K] Module.Dual K T) (Γ : AddSubgroup J) :
    annihilatingDifferentials D e Γ =
      (Submodule.span K (formalLogExtension D '' (Γ : Set J))).dualAnnihilator.comap
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
      Module.finrank K (Submodule.span K (formalLogExtension D '' (Γ : Set J))) =
        Module.finrank K T := sorry

theorem annihilatingDifferentials_saturation (D : FormalLogDatum K J T)
    (e : Ω ≃ₗ[K] Module.Dual K T) (Γ : AddSubgroup J) (ω : Ω)
    (hω : ω ∈ annihilatingDifferentials D e Γ) (x : J) (n : ℕ) (hn : n ≠ 0)
    (hx : n • x ∈ Γ) : formalLogIntegral D e x ω = 0 := sorry

theorem annihilatingDifferentials_eq_ker (D : FormalLogDatum K J T) (e : Ω ≃ₗ[K] Module.Dual K T)
    {g r : ℕ} (b : Fin g → Ω) (gens : Fin r → J) (c : Fin g → K) :
    (∑ i, c i • b i) ∈ annihilatingDifferentials D e (AddSubgroup.closure (Set.range gens)) ↔
      ∀ j, ∑ i, c i * formalLogIntegral D e (gens j) (b i) = 0 := sorry

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
    (h₀ : ‖formalLogIntegral D e d ω₀ - (2 * 3 + 3 ^ 4)‖ ≤ (3 : ℝ)⁻¹ ^ 5)
    (h₁ : ‖formalLogIntegral D e d ω₁ - (2 * 3 ^ 2 + 2 * 3 ^ 3)‖ ≤ (3 : ℝ)⁻¹ ^ 5) :
    ‖ε - (2 * 3 + 3 ^ 2 + 2 * 3 ^ 3)‖ ≤ (3 : ℝ)⁻¹ ^ 4 := sorry

-- annihilator_C132_three: for C₁(3₂) at p = 3, ∫_{S⁻}^{S⁺} dx/y ≡ 174 and ∫_{S⁻}^{S⁺} x dx/y ≡ 75
-- (mod 3⁵) give α ≡ 68 (mod 3⁴) and Ṽ = 𝔽₃·(x − 1) dx/y.
example {J T Ω : Type*} [AddCommGroup J] [AddCommGroup T] [Module ℚ_[3] T]
    [FiniteDimensional ℚ_[3] T] [AddCommGroup Ω] [Module ℚ_[3] Ω]
    (D : FormalLogDatum ℚ_[3] J T) (e : Ω ≃ₗ[ℚ_[3]] Module.Dual ℚ_[3] T) (d : J)
    (ω₀ ω₁ : Ω) (α : ℚ_[3])
    (hα : α • ω₀ + ω₁ ∈ annihilatingDifferentials D e (AddSubgroup.zmultiples d))
    (h₀ : ‖formalLogIntegral D e d ω₀ - 174‖ ≤ (3 : ℝ)⁻¹ ^ 5)
    (h₁ : ‖formalLogIntegral D e d ω₁ - 75‖ ≤ (3 : ℝ)⁻¹ ^ 5) : ‖α - 68‖ ≤ (3 : ℝ)⁻¹ ^ 4 := sorry

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
    (h₀ : ‖formalLogIntegral D e d ω₀ - (2 * 3 + 3 ^ 4)‖ ≤ (3 : ℝ)⁻¹ ^ 5) :
    ω₀ ∈ annihilatingDifferentials D e ⊥ ∧
      ω₀ ∉ annihilatingDifferentials D e (AddSubgroup.zmultiples d) := sorry

-- annihilator_dualAnnihilator: agreement with Mathlib's `Submodule.dualAnnihilator`.
example (D : FormalLogDatum K J T) (e : Ω ≃ₗ[K] Module.Dual K T) (Γ : AddSubgroup J) (ω : Ω) :
    ω ∈ annihilatingDifferentials D e Γ ↔
      e ω ∈ (Submodule.span K (formalLogExtension D '' (Γ : Set J))).dualAnnihilator := sorry

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
    (hM : ∀ i j, (M i j : ℚ_[p]) = (p : ℚ_[p]) ^ s * formalLogIntegral L e (D j) (b i))
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

/-- Supporting finite-fibre counting only: if a nonzero locally analytic function `η` vanishes
on every point of the closure set, and each of the finitely many residue discs carries a finite
bound for its zeros, the closure set is finite. -/
theorem finite_set_of_fibre_zero_bounds {p : ℕ} [Fact p.Prime] {X Xt J Jt : Type}
    [AddCommGroup J] [AddCommGroup Jt] (D : ReductionDiscData p X Xt J Jt)
    (η : X → ℚ_[p]) (S : Set X) (hS : ∀ P ∈ S, η P = 0) (N : Xt → ℕ)
    (hN : ∀ xt (Z : Finset X), (∀ z ∈ Z, D.red z = xt ∧ η z = 0) → Z.card ≤ N xt) : S.Finite :=
  sorry

/-- Supporting counting only, with the crucial geometric bound assumed: summing `m + 1` over the residue discs with `Σ m ≤ 2g − 2`. -/
theorem card_le_sum_goodReduction_fibre_bounds {p : ℕ} [Fact p.Prime] {X Xt J Jt : Type}
    [AddCommGroup J] [AddCommGroup Jt] (D : ReductionDiscData p X Xt J Jt)
    (g : ℕ) (hp : 2 * g < p) (rat : Finset X) (m : Xt → ℕ)
    (hm : ∑ xt ∈ @Finset.univ Xt D.fintypeXt, m xt ≤ 2 * g - 2)
    (hdisc : ∀ xt, (rat.filter (fun P => D.red P = xt)).card ≤ m xt + 1) :
    rat.card ≤ @Fintype.card Xt D.fintypeXt + (2 * g - 2) := sorry

/-- Supporting counting only, with no regular-model construction: the same count over the smooth 𝔽_p-points of the special fibre
of the minimal regular model, with `Σ_C n_C ≤ 2g − 2`. -/
theorem card_le_sum_fibre_bounds {X Xs : Type} [Fintype Xs] (red : X → Xs)
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

/-- Supporting semantic zero data only, not the raw ResidueDiscVerdict or its checker.
A mathematical zero-count record for `x̃`: base point and constant, the expansion `I_B` of `η` in the
local parameter of the disc, a certified bound `N` and the list of all `N` zeros, split into
verified rational points and certified non-rational points. -/
structure SemanticDiscZeroData {p : ℕ} [Fact p.Prime] {X Xt J Jt : Type} [AddCommGroup J]
    [AddCommGroup Jt] (D : ReductionDiscData p X Xt J Jt) (η : X → ℚ_[p]) (xt : Xt) where
  base : X
  baseValue : ℚ_[p]
  /-- the expansion `I_B(t) = c_B + primitive(w)(t)` of `η` on `D(x̃)` -/
  expansion : PowerSeries ℚ_[p]
  bound : ℕ
  zerosRat : Finset X
  zerosIrr : Finset X

namespace SemanticDiscZeroData

variable {p : ℕ} [Fact p.Prime] {X Xt J Jt : Type} [AddCommGroup J] [AddCommGroup Jt]
variable {D : ReductionDiscData p X Xt J Jt} {η : X → ℚ_[p]} {xt : Xt}

/-- All listed zeros. -/
def zeros (V : SemanticDiscZeroData D η xt) : Finset X := sorry

/-- Validity of a verdict relative to the set `rat` of rational points (inside `X(ℚ_p)`):
(i) the base point lies in the disc with certified value `c_B`; (ii) `I_B` is the expansion of `η`
on `D(x̃)` in the parameter `t_x̃` (so `I_B(t_x̃(B)) = c_B`), with integral derivative; (iii) `N`
bounds the disc Strassmann index of `I_B` as a semantic hypothesis; (iv) the listed points are zeros of `η` in the disc, rational
resp. not rational; (v) the lists are disjoint with `N` points in total. The bound on the number
of zeros is not a field: it follows from (ii)–(iii) and `card_zeros_le_discStrassmannIndex`. -/
def Valid (V : SemanticDiscZeroData D η xt) (rat : Set X) : Prop :=
  D.red V.base = xt ∧ η V.base = V.baseValue ∧
  (∀ P, D.red P = xt → η P = discEval V.expansion (D.param xt P)) ∧
  V.expansion ≠ 0 ∧
  (∀ n : ℕ, ‖PowerSeries.coeff (n + 1) V.expansion * (n + 1 : ℚ_[p])‖ ≤ 1) ∧
  discStrassmannIndex V.expansion ≤ V.bound ∧
  (∀ z ∈ V.zerosRat ∪ V.zerosIrr, D.red z = xt ∧ η z = 0) ∧
  (∀ z ∈ V.zerosRat, z ∈ rat) ∧ (∀ z ∈ V.zerosIrr, z ∉ rat) ∧
  Disjoint V.zerosRat V.zerosIrr ∧ (V.zerosRat ∪ V.zerosIrr).card = V.bound

theorem rationalPoints_eq (V : SemanticDiscZeroData D η xt) (rat : Set X) (hV : V.Valid rat)
    (hη : ∀ P ∈ rat, η P = 0) : {P | P ∈ rat ∧ D.red P = xt} = ↑V.zerosRat := sorry

/-- The verdict based at a listed rational point. -/
def ofKnownPoint (B : X) (w : PowerSeries ℚ_[p]) (N : ℕ) (Zr Zi : Finset X) :
    SemanticDiscZeroData D η xt := sorry

/-- The empty verdict, `N = 0`. -/
def empty (B : X) (c : ℚ_[p]) (w : PowerSeries ℚ_[p]) : SemanticDiscZeroData D η xt := sorry

theorem card_le (V : SemanticDiscZeroData D η xt) (rat : Set X) (hV : V.Valid rat)
    (hη : ∀ P ∈ rat, η P = 0) (Z : Finset X) (hZ : ∀ z ∈ Z, z ∈ rat ∧ D.red z = xt) :
    Z.card ≤ V.bound := sorry

/-- Moving the base point inside the disc. -/
def changeBase (V : SemanticDiscZeroData D η xt) (B' : X) : SemanticDiscZeroData D η xt := sorry

end SemanticDiscZeroData

/-! A genuinely finite coefficient check, supporting the omitted raw disc verifier.
It neither stores a p-adic series nor assumes a zero bound. The coefficient/curve
interpretation and the strict infinite-tail theorem are separate mathematical inputs. -/
structure RawDiscCoefficientWitness (p : ℕ) where
  precision : ℕ
  minVal : ℕ
  lastIndex : ℕ
  coeffs : List ℕ

namespace RawDiscCoefficientWitness

attribute [-instance] Classical.propDecidable

/-- Sufficient integer certificate for a last dominant coefficient. The list length
also meets the conservative integral-derivative tail cutoff2(m+1). -/
def check {p : ℕ} (R : RawDiscCoefficientWitness p) : Bool :=
  decide (2 ≤ p ∧ R.minVal < R.precision ∧ R.lastIndex < R.coeffs.length ∧
    2 * (R.minVal + 1) ≤ R.coeffs.length ∧
    (¬ p ^ (R.minVal + 1) ∣ R.coeffs.getD R.lastIndex 0) ∧
    ∀ i : Fin R.coeffs.length,
      R.coeffs.get i < p ^ R.precision ∧
      p ^ R.minVal ∣ R.coeffs.get i ∧
      (R.lastIndex < i.val → p ^ (R.minVal + 1) ∣ R.coeffs.get i))

attribute [local instance] Classical.propDecidable

/-- This transports a sound finite table and an independently proved tail bound
into coefficient inequalities. It is not a producer of either analytic hypothesis. -/
theorem dominant_of_check {p : ℕ} [Fact p.Prime]
    (R : RawDiscCoefficientWitness p) (hR : R.check = true) (b : ℕ → ℚ_[p])
    (hcoeff : ∀ i : Fin R.coeffs.length,
      ‖b i.val - (R.coeffs.get i : ℚ_[p])‖ ≤ ((p : ℝ)⁻¹) ^ R.precision)
    (htail : ∀ n, R.coeffs.length ≤ n →
      ‖b n‖ ≤ ((p : ℝ)⁻¹) ^ (R.minVal + 1)) :
    ‖b R.lastIndex‖ = ((p : ℝ)⁻¹) ^ R.minVal ∧
      (∀ n, ‖b n‖ ≤ ((p : ℝ)⁻¹) ^ R.minVal) ∧
      (∀ n, R.lastIndex < n → ‖b n‖ < ((p : ℝ)⁻¹) ^ R.minVal) := sorry

end RawDiscCoefficientWitness

-- rawDiscCoefficient_constant: accepted constant coefficient witness.
example : (RawDiscCoefficientWitness.check
    (p := 3) { precision := 1, minVal := 0, lastIndex := 0, coeffs := [1, 0] }) = true := sorry
-- rawDiscCoefficient_linear: last dominant coefficient at index1.
example : (RawDiscCoefficientWitness.check
    (p := 3) { precision := 1, minVal := 0, lastIndex := 1, coeffs := [0, 1] }) = true := sorry
-- rawDiscCoefficient_reject_tie: index1 ties the claimed index0.
example : (RawDiscCoefficientWitness.check
    (p := 3) { precision := 1, minVal := 0, lastIndex := 0, coeffs := [1, 1] }) = false := sorry
-- rawDiscCoefficient_reject_short_tail: insufficient automatic-tail cutoff.
example : (RawDiscCoefficientWitness.check
    (p := 3) { precision := 1, minVal := 0, lastIndex := 0, coeffs := [1] }) = false := sorry
-- rawDiscCoefficient_reject_unknown: no certified nonzero coefficient.
example : (RawDiscCoefficientWitness.check
    (p := 3) { precision := 1, minVal := 0, lastIndex := 0, coeffs := [0, 0] }) = false := sorry

section VerdictTests
variable {p : ℕ} [Fact p.Prime] {X Xt J Jt : Type} [AddCommGroup J] [AddCommGroup Jt]
variable {D : ReductionDiscData p X Xt J Jt} {η : X → ℚ_[p]} {xt : Xt}

-- semantic_verdict_C05_disc_zero_one: N = 2 with the two rational points (0,1), (−3,1).
example (V : SemanticDiscZeroData D η xt) (rat : Set X) (hV : V.Valid rat)
    (hη : ∀ P ∈ rat, η P = 0) (a b : X) (hab : a ≠ b) (h : V.zerosRat = {a, b}) (hN : V.bound = 2) :
    {P | P ∈ rat ∧ D.red P = xt} = {a, b} := sorry

-- semantic_verdict_C132_weierstrass: N = 3 with S⁻, S⁺ rational and W listed as non-rational.
example (V : SemanticDiscZeroData D η xt) (rat : Set X) (hV : V.Valid rat)
    (hη : ∀ P ∈ rat, η P = 0) (sm sp w : X) (h : V.zerosRat = {sm, sp}) (hw : V.zerosIrr = {w})
    (hN : V.bound = 3) : {P | P ∈ rat ∧ D.red P = xt} = {sm, sp} := sorry

-- semantic_verdict_empty: a valid verdict with N = 0 proves the disc has no rational point.
example (V : SemanticDiscZeroData D η xt) (rat : Set X) (hV : V.Valid rat)
    (hη : ∀ P ∈ rat, η P = 0) (hN : V.bound = 0) : ∀ P ∈ rat, D.red P ≠ xt := sorry

-- semantic_verdict_known_zeros_only: listing fewer zeros than the bound is not valid.
example (V : SemanticDiscZeroData D η xt) (rat : Set X)
    (hcard : (V.zerosRat ∪ V.zerosIrr).card < V.bound) : ¬ V.Valid rat := sorry

-- semantic_verdict_rationalPoints_eq: every rational point of the disc is listed.
example (V : SemanticDiscZeroData D η xt) (rat : Set X) (hV : V.Valid rat)
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
  verdict : ∀ xt : Xt, SemanticDiscZeroData datum (fun P => pair (datum.abelJacobi P)) xt
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

-- certificate_bound_sum_six: a supplied total semantic disc bound6 bounds the listed cardinality.
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
    (hspan : Submodule.span K (formalLogExtension L '' (Γ : Set J)) = ⊤) :
    annihilatingDifferentials L e Γ = ⊥ := sorry

-- certificate_withFiniteIndex_points: the semantic helper preserves the supplied points field.
example (C : ChabautyColemanCertificate p X Xt J Jt) (r : ℕ)
    (hyp : (C.G.addSubgroupOf C.JQ).FiniteIndex) :
    (C.withFiniteIndex r hyp).points = C.points := sorry

end CertificateTests

/-! ### ED.4/number-field-chabauty-criterion -/

/-- Supporting congruence implication, not Siksek's geometric theorem: if the reduced matrix `M̃_p(Q)` has rank
`d`, `Q` is the only `K`-point of its `p`-unit ball. The ball, the θ-coordinates `z P ∈ ℤ_p^d` of
`t_Q(P)` (injective on the ball, `z Q = 0`, positive valuation by Siksek Lemma 3.1) and the
congruence `M_p(Q) z ≡ 0 (mod p^(s+1))` from Lemma 3.2 and the kernel of `p^a T` are inputs. -/
theorem eq_singleton_of_rank_and_congruences (p : ℕ) [Fact p.Prime] (hp : p ≠ 2) {d h : ℕ}
    {CK : Type} (ball : Set CK) (Q : CK) (hQ : Q ∈ ball)
    (M : Matrix (Fin h) (Fin d) ℤ_[p]) (hrank : (M.map (PadicInt.toZMod (p := p))).rank = d)
    (z : CK → Fin d → ℤ_[p]) (hzinj : Set.InjOn z ball) (hzQ : z Q = 0)
    (hz1 : ∀ P ∈ ball, ∀ i, ‖((z P i : ℤ_[p]) : ℚ_[p])‖ ≤ (p : ℝ)⁻¹)
    (hcong : ∀ P ∈ ball, ∀ s : ℕ, 1 ≤ s → (∀ i, ‖((z P i : ℤ_[p]) : ℚ_[p])‖ ≤ (p : ℝ)⁻¹ ^ s) →
      ∀ l, ‖((Matrix.mulVec M (z P) l : ℤ_[p]) : ℚ_[p])‖ ≤ (p : ℝ)⁻¹ ^ (s + 1)) :
    ball = {Q} := sorry

/-! ### ED.4/symmetric-square-chabauty-datum, ED.4/symmetric-chabauty,
ED.4/relative-symmetric-chabauty -/

/-- Supporting finite-cover implication only. The actual relative symmetric-power
criterion is one of the exact geometric omissions below. E31 records the impossible
printed i=0 hypothesis in Siksek2009 Theorem4.3; no repaired general theorem is assumed. -/
theorem mem_list_or_pullback_of_cover {X T : Type*} (red : X → T)
    (rat pullback : Set X) (L Lgood : Finset X) (hL : Lgood ⊆ L)
    (hgood : ∀ y ∈ Lgood, ∀ x ∈ rat, red x = red y → x = y ∨ x ∈ pullback)
    (x : X) (hx : x ∈ rat) (hred : ∃ y ∈ Lgood, red x = red y) :
    x ∈ L ∨ x ∈ pullback := sorry

/-! ### Applications -/

/-- Supporting 6-point consequence of an assumed complete semantic certificate.
The actual `C05_rationalPoints` target is an exact §13 omission. -/
theorem six_points_of_complete_certificate {X Xt J Jt : Type} [AddCommGroup J] [AddCommGroup Jt]
    (C : ChabautyColemanCertificate 3 X Xt J Jt) (hC : C.Valid) (hcard : C.points.card = 6) :
    C.rat = ↑C.points ∧ C.rat.ncard = 6 := sorry

/-- Supporting 8-point consequence of an assumed complete semantic certificate.
The actual `C132_rationalPoints` target is an exact §13 omission. -/
theorem eight_points_of_complete_certificate {X Xt J Jt : Type} [AddCommGroup J] [AddCommGroup Jt]
    (C : ChabautyColemanCertificate 3 X Xt J Jt) (hC : C.Valid) (hcard : C.points.card = 8) :
    C.rat = ↑C.points ∧ C.rat.ncard = 8 := sorry

/-- Supporting 10-point consequence of an assumed complete semantic certificate.
The actual `X0dyn6_rationalPoints_of_rank_le_three` target is an exact §13 omission. -/
theorem ten_points_of_complete_certificate {X Xt J Jt : Type} [AddCommGroup J]
    [AddCommGroup Jt] (C : ChabautyColemanCertificate 5 X Xt J Jt) (hC : C.Valid)
    (hcard : C.points.card = 10) : C.rat = ↑C.points ∧ C.rat.ncard = 10 := sorry

/-! ## ED.4 exact geometric and raw-verifier omissions (PROTOCOL §13)

The following names are reserved for these actual mathematical interfaces. None is
declared on arbitrary stand-in types. The renamed support lemmas above do not
count as these signatures.

### EffectiveDiophantineMethods:ED.4/kernel-of-reduction-evaluation
Names: TauCeti.EffectiveDiophantine.ED4.integrationPairing_eq_sum_tiny
Reason: Actual effective-divisor/Picard, smooth-model specialization, regular-differential and finite-extension integration carriers are unavailable.
Required signature: Let (X, O, p, 𝒳) be a good-reduction Chabauty datum of genus g, and P' ∈ X(ℚ_p) whose reduction x̃' satisfies dim H⁰(X̃, O(g·x̃')) = 1 (x̃' is not a Weierstrass point of X̃). Then every D ∈ J¹(ℚ_p) = ker(red_J) is uniquely represented as D = [Q₁ + ⋯ + Q_g − g·P'] with Q₁ + ⋯ + Q_g an effective divisor defined over ℚ_p (a Galois-stable geometric multiset, allowing repeated points) whose points Q_j ∈ X(ℚ̄_p) all reduce to x̃'. Independently of the Weierstrass hypothesis, whenever D = [Q₁ + ⋯ + Q_g − g·P'] with all Q_j in the residue disc of x̃', and ω ∈ H⁰(X_{ℚ_p}, Ω¹) has expansion w(t) dt at x̃' in a parameter t with t(P') = 0, and λ := primitive(w) = Σ_{n ≥ 1} λ_n t^n, then ⟨D, ω_J⟩ = Σ_j λ(t(Q_j)) = Σ_{n ≥ 1} λ_n s_n, where s_n = Σ_j t(Q_j)^n ∈ ℚ_p are the power sums of the roots of ∏_j (T − t(Q_j)) ∈ ℚ_p[T], computed from its coefficients by Newton's identities. In particular ⟨D, ω_J⟩ is computable to any p-adic precision from an effective representative of D + g·P'. Equivalently write E=Σ_x m_x[x] over closed points of X_{ℚ_p}: Σ_x m_x[κ(x):ℚ_p]=g and the value is Σ_x m_x Tr_{κ(x)/ℚ_p}(λ(t(x))). The representative is unique as an effective divisor, not as an ordering of geometric points. The characteristic polynomial and trace include every multiplicity. Hypotheses: Good-reduction datum; x̃' not a Weierstrass point of X̃ (h⁰(g x̃') = 1). For g = 1 every point qualifies and the statement is the formal-group description of E¹.

### EffectiveDiophantineMethods:ED.4/padic-closure-dimension
Names: TauCeti.EffectiveDiophantine.ED4.dim_padicClosure_le_rank
Reason: Actual abelian variety point topology, continuous geometric logarithm and p-adic Lie subgroup carriers are unavailable.
Required signature: Let A be an abelian variety of dimension g over ℚ, p a prime, Γ ⊆ A(ℚ) ⊆ A(ℚ_p) a finitely generated subgroup of rank r and Γ̄ its closure in A(ℚ_p). Then (a) log_A(Γ̄) = ℤ_p·log_A(Γ) inside Lie(A_{ℚ_p}) ≅ ℚ_p^g; (b) the p-adic Lie subgroup Γ̄ has dimension r₀ := rank_{ℤ_p} ℤ_p·log_A(Γ) = dim_{ℚ_p} ℚ_p·log_A(Γ), and r₀ ≤ min(r, g); (c) if G ⊆ Γ has finite index then ℚ_p·log_A(G) = ℚ_p·log_A(Γ) and Ḡ has finite index in Γ̄; if moreover [Γ : G] is prime to p·#Ã(𝔽_p) for a prime p of good reduction, then Ḡ = Γ̄. Inequality r₀ < r can occur, and r₀ ≤ g always. Hypotheses: A abelian variety over ℚ (in ED.4, the Jacobian J of X); Γ finitely generated (Mordell–Weil theorem for Γ = J(ℚ), requested from HeightsRationalPointsAndObstructions:RP.1). Closure is taken in the natural p-adic analytic topology on A(ℚ_p); the logarithm is the continuous geometric abelian logarithm, a local analytic isomorphism with finite torsion kernel. In the last clause A has good reduction and #Ã(𝔽_p) is the actual order of its reduced point group.

### EffectiveDiophantineMethods:ED.4/chabauty-finiteness
Names: TauCeti.EffectiveDiophantine.ED4.finite_rationalPoints_of_rank_lt_genus
Reason: The smooth projective curve/Jacobian, regular differential, geometric residue charts and analytic pullback/identity theorem are unavailable.
Required signature: Let X be a smooth projective geometrically integral curve of genus g ≥ 2 over ℚ with a rational point O, J its Jacobian, p a prime and r₀ the dimension of the p-adic closure of J(ℚ) in J(ℚ_p) (ED.4/padic-closure-dimension). If r₀ < g, in particular if r := rank J(ℚ) < g, then ι_O⁻¹(closure of J(ℚ)) ∩ X(ℚ_p) is finite; hence X(ℚ) is finite. Moreover, for p of good reduction its cardinality is at most Σ_{x̃ ∈ X̃(𝔽_p)} N_p(I_x̃) for any nonzero ω ∈ Ann_p(J(ℚ)) normalised to be integral with nonzero reduction, where I_x̃ is the expansion of η = ∫_O ω on D(x̃). Hypotheses: g ≥ 2; O ∈ X(ℚ); J(ℚ) finitely generated (Mordell–Weil, requested from RP.1). For p of bad reduction the residue classes are those of the minimal regular model (ED.4/bad-reduction-bound).

### EffectiveDiophantineMethods:ED.4/coleman-bound
Names: TauCeti.EffectiveDiophantine.ED4.card_rationalPoints_le_coleman
Reason: Actual smooth proper reduction, nonzero integral annihilator differential and canonical-divisor degree2g−2 comparison are unavailable.
Required signature: Let (X, O, p, 𝒳) be a good-reduction Chabauty datum with g ≥ 2 and r₀ < g, and ω ∈ Ann_p(J(ℚ)) nonzero, scaled so that ω ∈ H⁰(𝒳, Ω¹) with nonzero reduction ω̃ ∈ H⁰(X̃, Ω¹). (a) For x̃ ∈ X̃(𝔽_p) with m := ord_x̃ ω̃, the number of P ∈ X(ℚ) with red P = x̃ is at most the number of zeros of η on D(x̃), hence at most N_p of the disc expansion, and at most m + 1 if m < p − 2. (b) If p > 2g, then #X(ℚ) ≤ #X̃(𝔽_p) + 2g − 2. Hypotheses: Good reduction at p; rank condition r₀ < g (in particular r < g); ω annihilates J(ℚ), which may be certified from any finite-index subgroup (ED.4/annihilating-differentials (b)).

### EffectiveDiophantineMethods:ED.4/bad-reduction-bound
Names: TauCeti.EffectiveDiophantine.ED4.card_rationalPoints_le_badReduction
Reason: Actual minimal regular model, relative canonical sheaf, component multiplicities and horizontal/vertical intersection theory are unavailable.
Required signature: Let X be a smooth projective geometrically integral curve of genus g ≥ 2 over ℚ with O ∈ X(ℚ), J its Jacobian with r₀ < g at the prime p, 𝒳 → Spec ℤ_p the minimal proper regular model of X_{ℚ_p} (StableReduction layer 5), 𝒳_s its special fibre, 𝒳^sm the smooth locus of 𝒳 → Spec ℤ_p and 𝒳_s^sm its special fibre. Residue classes are the fibres of red : X(ℚ_p) = 𝒳(ℤ_p) = 𝒳^sm(ℤ_p) → 𝒳_s^sm(𝔽_p); each class lies on a single component C of multiplicity 1 and is parametrised by pℤ_p through a local parameter. Let ω ∈ Ann_p(J(ℚ)) be nonzero. (1) For a multiplicity-one component C scale ω by a power of p so that its restriction ω̃_C to C^sm := C ∩ 𝒳^sm is a nonzero 1-form; for Q̃ ∈ C^sm(𝔽_p) with m := ord_Q̃ ω̃_C < p − 2, at most m + 1 points of X(ℚ) reduce to Q̃ (and at most N_p of the class expansion in general). (2) If n_C denotes the number of zeros of ω̃_C on C^sm(𝔽_p) counted with multiplicity, then Σ_{C of multiplicity 1} n_C ≤ 2g − 2. (3) If p > 2g, then #X(ℚ) ≤ #𝒳_s^sm(𝔽_p) + 2g − 2. (4) For every prime p with r₀ < g the set ι_O⁻¹(closure of J(ℚ)) ∩ X(ℚ_p) is finite. Hypotheses: Separately stated hypotheses: 𝒳 is the minimal proper regular model over ℤ_p (regularity is what makes X(ℚ_p) = 𝒳^sm(ℤ_p) and the intersection theory available); no smoothness of 𝒳 is assumed. The scaling in (1) depends on C: ω_C = p^{k_C} ω with C absent from the divisor of ω_C as a section of the relative dualising sheaf. The relative canonical sheaf ω_{𝒳/ℤ_p} of the local complete intersection 𝒳 → Spec ℤ_p, with ω_{𝒳/ℤ_p} ≅ Ω¹ on the smooth locus and compatibility with base change (Liu Proposition 6.4.9), is requested from SchemeAndStackFoundations:SF.3.

### EffectiveDiophantineMethods:ED.4/residue-disc-verdict
Names: TauCeti.EffectiveDiophantine.ED4.ResidueDiscVerdict, ResidueDiscVerdict.zeros, ResidueDiscVerdict.Valid, ResidueDiscVerdict.rationalPoints_eq, ResidueDiscVerdict.ofKnownPoint, ResidueDiscVerdict.empty, ResidueDiscVerdict.card_le, ResidueDiscVerdict.changeBase, ResidueDiscVerdict.rawData, ResidueDiscVerdict.check, verdict_C05_disc_zero_one, verdict_C132_weierstrass, verdict_empty, verdict_known_zeros_only, verdict_rationalPoints_eq, verdict_reject_unknown_dominant, verdict_reject_tail_tie, verdict_reject_missing_child, verdict_reject_duplicate_zero
Reason: The exact point/field-embedding, curve/chart/series interpretation and certified analytic tail interfaces needed by the full raw verifier are unavailable. The finite coefficient-check fragment and renamed semantic zero data do not supply them.
Required signature: For a genuine geometric Chabauty datum, a residue disc D(x̃), a certified nonzero differential annihilating a finite-index Mordell–Weil subgroup, and η(P)=∫_O^Pω, a ResidueDiscVerdict is finite raw data with a terminating checker, not a record containing a universal bound on unknown points. It contains: (i) exact curve/base-point/local-parameter identifiers and a certified integration constant; (ii) finite coefficient residue tables for scaled pullback series F(u)=p^sη(φ(p(a+p^k u))) in each encoded ball, where φ is the inverse geometric parameter chart and the finite integers a,k describe the ball (the root uses a=k=0), common absolute precision, a certified nonzero leading coefficient and a last dominant index; (iii) a finite tail-bound transcript whose soundness follows from integral differential coefficients or the CN.4 certified analytic supplier; (iv) either the whole disc as one leaf or a finite full residue-subdivision tree, with all p children at each internal ℤ_p-ball and disjoint leaves covering the root; (v) exact rational/algebraic zero records, their embeddings in ℚ_p via isolating balls, checks of the curve equation and geometric vanishing relation, rationality/nonrationality certificates and distinctness; (vi) for each leaf, the number of distinct recorded zeros equals its checked Strassmann upper bound. Zero-root leaves have bound0 and no point records. Valid means that every finite arithmetic, identifier, covering, disjointness and exact algebraic check succeeds. Under separately stated geometric interpretation and supplier-soundness hypotheses this proves X(ℚ)∩D(x̃)=Z_rat. No list of approximate roots, semantic all-point validity predicate or asserted bound is a raw certificate. Raw shape, finite checks, soundness hypotheses and all tests are exactly the associated hypotheses/API/proofSteps/tests. No universal semantic Valid is advertised as executable. Hypotheses: G of finite index in J(ℚ), so that ω also annihilates J(ℚ) (ED.4/annihilating-differentials (b)); without the finite-index certificate a verdict proves only that the rational points of D(x̃) whose image lies in the saturation of G are listed. Distinct points of Z_rat ∪ Z_irr have distinct parameters t; points are compared exactly, not to finite precision. Interpretation is external to the raw payload: a proved chart identifies every encoded ball with its geometric subdisc, the certified differential has integral derivative in the recorded coordinate, the integration constant and coefficient congruences are sound, and the imported tail producer certifies all omitted coefficients. These are theorems of the actual curve/integration and arithmetic suppliers, not arbitrary Prop fields stored in the certificate. Each nonrational zero is specified by exact algebraic coordinates/defining polynomials and a chosen ℚ_p embedding, with an exact nonrationality certificate. A Hensel-isolated analytic root alone does not prove rationality or nonrationality. Distinct zeros consume one unit of the distinct-zero bound; multiplicity is never inferred from rounded equality. One sufficient root-disc tail rule is: for F(u)=p^s I(pu), s≥0, I′ integral and I≠0, v_p([u^n]F)≥s+n−v_p(n) for n≥1. If the chosen minimum coefficient valuation is m≥0, a cutoff K≥2(m+1) gives every n≥K valuation≥m+1. The constant coefficient is certified separately. The finite table modulo p^M must have M>m and must verify the last coefficient at valuation m. This rule is sufficient, not necessary; refinement may be needed.
API ResidueDiscVerdict.zeros: Z_rat ∪ Z_irr, the listed zeros of η on D(x̃).
API ResidueDiscVerdict.Valid: The executable Boolean check on finite raw coefficient/tail/subdivision/point data succeeds; no quantifier over all curve points, coefficients of an unspecified infinite series or possible future roots occurs in this predicate.
API ResidueDiscVerdict.rationalPoints_eq: For the actual curve/differential/disc interpretation and sound imported finite arithmetic/analytic certificate producers, check=true implies X(ℚ)∩D(x̃)=Z_rat. Geometry, coefficient interpretation and tail soundness are explicit theorem hypotheses, not payload assertions.
API ResidueDiscVerdict.ofKnownPoint: The verdict based at a listed rational point B (c_B = 0).
API ResidueDiscVerdict.empty: The verdict with N = 0, proving X(ℚ) ∩ D(x̃) = ∅.
API ResidueDiscVerdict.card_le: #(X(ℚ) ∩ D(x̃)) ≤ N for a valid verdict.
API ResidueDiscVerdict.changeBase: Recompute the affine-substitution coefficient tables, integration constant and certified tail/partition data at the new base point; prove that the recomputed accepted payload describes the same zeros. Arbitrarily changing a stored point is not validity preservation.
API ResidueDiscVerdict.rawData: The finite integer/residue tables, ball-prefix tree, exact point descriptors and arithmetic relation transcripts; no ℚ_p value, infinite series or universal correctness proof is a raw field.
API ResidueDiscVerdict.check: Terminating finite checker; Valid iff check=true. Inadequate precision, a missing child, unresolved point identity or an unverified tail causes failure rather than a completeness verdict.
Test verdict_C05_disc_zero_one: For C₀(5), p = 3, x̃ = (0, 1): B = (0, 1), t = x, N = 2, Z_rat = {(0, 1), (−3, 1)}, Z_irr = ∅ is valid.
Test verdict_C132_weierstrass: For C₁(3₂), p = 3, x̃ = (1, 0): B = S⁻ = (1, −3), t = y + 3, N = 3, Z_rat = {S⁻, S⁺}, Z_irr = {W} with W the Weierstrass point over ℚ_3 (x(W) a root of x⁶ − 2x⁴ + 2x³ + 5x² + 2x + 1, which has no rational root; c_B = 0 and 2(ι_O(W) − ι_O(S⁻)) = [S⁺ − S⁻] ∈ G) is valid.
Test verdict_empty: A valid verdict with N = 0 proves that D(x̃) contains no rational point.
Test verdict_known_zeros_only: For C₁(3₂) at x̃ = (1, 0), the tuple with N = 3, Z_rat = {S⁻, S⁺}, Z_irr = ∅ is not a verdict (#Z ≠ N): listing the known rational zeros without accounting for every zero proves nothing.
Test verdict_rationalPoints_eq: If the verdict is valid and P ∈ X(ℚ) reduces to x̃, then P ∈ Z_rat.
Test verdict_reject_unknown_dominant: A coefficient table whose entries are all zero modulo the recorded precision does not certify a nonzero series or last dominant coefficient and is rejected.
Test verdict_reject_tail_tie: A tail bound permitting a coefficient beyond N at the same norm as the claimed dominant coefficient is rejected; a strict tail bound is required.
Test verdict_reject_missing_child: For p=3, subdividing a ball into only the residue children0 and1 omits child2 and is rejected even if both supplied leaves have valid zero counts.
Test verdict_reject_duplicate_zero: Counting the same exact zero twice, even with two different approximate coordinate strings, cannot saturate a bound2 and is rejected unless exact distinctness is certified.

### EffectiveDiophantineMethods:ED.4/number-field-chabauty-criterion
Names: TauCeti.EffectiveDiophantine.ED4.eq_singleton_of_rank_reducedMatrix
Reason: Actual number-field curve/Jacobian, all local completions and integral differential bases, integration matrices and certified kernel/Hermite construction are unavailable.
Required signature: Let K be a number field of degree d, C a smooth projective geometrically integral curve over K of genus g ≥ 2 with Jacobian J, D₁, …, D_r a basis of a free subgroup of finite index in J(K), and p a rational prime such that (p1) p is odd, (p2) p is unramified in K, (p3) every prime υ | p of K is a prime of good reduction for C (a good-reduction datum over O_υ, ED.4/good-reduction-chabauty-datum). Fix ℤ_p-bases θ_{υ,1}, …, θ_{υ,d_υ} of O_υ and O_υ-bases ω_{υ,1}, …, ω_{υ,g} of H⁰(𝒞_υ, Ω¹). For ω ∈ H⁰(𝒞_υ, Ω¹) let τ_j = ∫_{D_j} ω = Σ_i t_{ij} θ_{υ,i} (t_{ij} ∈ ℚ_p), T_{υ,ω} = (t_{ij}), T_υ the stack of the T_{υ,ω_{υ,l}} and T the stack over υ | p (a gd × r matrix over ℚ_p). For Q ∈ C(K), a well-behaved uniformiser t_Q at Q (a local coordinate at Q̃ shifted to vanish at Q) and α = (ω/dt_Q)(Q) ∈ O_υ, let A_{υ,ω} be the d_υ × d_υ matrix of multiplication by α in the basis θ, A_υ the stack over ω_{υ,l} and A the block-diagonal matrix of the A_υ (gd × d over ℤ_p). Choose a ≥ 0 with p^a T integral and a unimodular U with U(p^a T) in Hermite normal form with h zero rows; let M_p(Q) be the last h rows of U A. If the reduction M̃_p(Q) ∈ M_{h×d}(𝔽_p) has rank d, then C(K) ∩ B_p(Q) = {Q}, where B_p(Q) = ∏_{υ|p} B_υ(Q) is the p-unit ball of points reducing to Q̃ at every υ | p. The rank of M̃_p(Q) does not depend on U; the necessary dimension condition is h ≥ d. The familiar r ≤ d(g − 1) condition follows when rank(T)=r, hence h=gd−r; without this full-rank assumption it is a sufficient dimension heuristic, not a necessary condition. Hypotheses: Separately stated hypotheses of the number-field variant: (p1) p odd; (p2) p unramified in K; (p3) good reduction at every υ | p; D₁, …, D_r a basis of a free finite-index subgroup of J(K) (its finite index requires an unconditional rank certificate, ED.3). Finite approximations alone generally certify all h kernel rows only in the full-rank case h=max(gd−r,0), using annihilator-precision. Exact dependencies or another certified kernel construction may also certify a larger h; r≤d(g−1) is not a universal necessity.

### EffectiveDiophantineMethods:ED.4/symmetric-square-chabauty-datum
Names: TauCeti.EffectiveDiophantine.ED4.SymmetricSquareChabautyDatum, SymmetricSquareChabautyDatum.abelJacobi, SymmetricSquareChabautyDatum.abelJacobi_injective, SymmetricSquareChabautyDatum.red, SymmetricSquareChabautyDatum.matrix, SymmetricSquareChabautyDatum.relativeVanishing, SymmetricSquareChabautyDatum.mem_pullback, symmetricSquare_rationalPairs, symmetricSquare_matrix_diagonal, symmetricSquare_infinite_nonexample, symmetricSquare_reduction_compat, symmetricSquare_conjugate_divisor
Reason: Actual Sym² of the curve, Galois-stable effective divisors with multiplicity, Abel–Jacobi/Picard map, trace on regular differentials and reduced coefficient matrices over their residue fields are unavailable.
Required signature: Let X be a smooth projective non-hyperelliptic curve of genus g ≥ 3 over ℚ with Jacobian J, ∞ a rational effective divisor of degree 2 (for example 2O or O + O'), and p a prime with a good-reduction datum 𝒳 (ED.4/good-reduction-chabauty-datum, with the base point replaced by ∞). The symmetric square X⁽²⁾ parametrises effective divisors of degree 2; X⁽²⁾(ℚ) consists of the pairs {P, P^σ} of a quadratic point and its conjugate and the pairs {P, Q} of rational points, including the doubled divisor 2P. Braces denote a multiset/effective divisor, never a Finset that loses repeated points. The datum consists of: (i) ι⁽²⁾ : X⁽²⁾ → J, 𝒬 ↦ [𝒬 − ∞], injective because X is not hyperelliptic; (ii) the reduction X⁽²⁾(ℚ) → X̃⁽²⁾(𝔽_p) and its residue classes; (iii) the integral vanishing lattice V = Ann_p(J(ℚ)) ∩ H⁰(𝒳, Ω¹) and its reduction Ṽ (ED.4/annihilating-differentials); (iv) for 𝒬 = {Q₁, Q₂} ∈ X⁽²⁾(ℚ), a prime v of ℚ(Q₁) above p, uniformisers t_{Q̃_j} at the reductions and the expansions ω_i = (a₀(ω_i, t_{Q̃_j}) + a₁(ω_i, t_{Q̃_j}) t + ⋯) dt for a basis ω₁, …, ω_k of Ṽ; (v) the matrix Ã(𝒬): the k × 2 matrix (a₀(ω_i, t_{Q̃₁}), a₀(ω_i, t_{Q̃₂})) when Q₁ ≠ Q₂, and (a₀(ω_i, t_{Q̃₁}), a₁(ω_i, t_{Q̃₁})/2) when Q₁ = Q₂; (vi) in the relative case, a degree-two morphism ρ : X → C to a curve C with good reduction at p, extending to ρ : 𝒳 → 𝒞, the trace Tr : H⁰(X, Ω¹) → H⁰(C, Ω¹), V₀ := V ∩ ker Tr and its reduction Ṽ₀, and the set ρ*C(ℚ) ⊆ X⁽²⁾(ℚ) of pullbacks of rational points. Hypotheses: X non-hyperelliptic of genus g ≥ 3 (so ι⁽²⁾ is an embedding); p of good reduction for X; p odd wherever the diagonal matrix (v) is used (and for C in the relative case, with ρ extending to the smooth models). The symmetric square of a curve and its points as effective divisors are requested from SchemeAndStackFoundations:SF.3. The reduced matrix has entries in the residue field generated by the support (or its algebraic closure), not necessarily 𝔽_p. Its two columns retain geometric multiplicities; arbitrary injective coordinates or an assumed Abel–Jacobi injection are not this geometric datum.
API SymmetricSquareChabautyDatum.abelJacobi: ι⁽²⁾(𝒬) = [𝒬 − ∞] ∈ J(ℚ) for 𝒬 ∈ X⁽²⁾(ℚ).
API SymmetricSquareChabautyDatum.abelJacobi_injective: ι⁽²⁾ is injective on X⁽²⁾(ℚ̄) for X non-hyperelliptic.
API SymmetricSquareChabautyDatum.red: Reduction X⁽²⁾(ℚ) → X̃⁽²⁾(𝔽_p), compatible with red_J ∘ ι⁽²⁾.
API SymmetricSquareChabautyDatum.matrix: Ã(𝒬) ∈ M_{k×2}(𝔽̄_p) as in (v).
API SymmetricSquareChabautyDatum.relativeVanishing: Ṽ₀ = reduction of Ann_p(J(ℚ)) ∩ ker Tr ∩ H⁰(𝒳, Ω¹).
API SymmetricSquareChabautyDatum.mem_pullback: 𝒬 ∈ ρ*C(ℚ) iff 𝒬 = ρ*(c) for some c ∈ C(ℚ).
Test symmetricSquare_rationalPairs: If P, Q ∈ X(ℚ) then {P, Q} ∈ X⁽²⁾(ℚ) and ι⁽²⁾({P, Q}) = [P + Q − ∞]; a rational point P ∉ ∞ gives the two points {P, P} and {P, P₀} for P₀ ∈ X(ℚ), at most one of which is a pullback from C (Box Remark 2.3).
Test symmetricSquare_matrix_diagonal: For 𝒬 = {Q₁, Q₁} the second column of Ã is a₁(ω_i, t)/2, which requires p odd.
Test symmetricSquare_infinite_nonexample: For X₀(N), N ∈ {43, 53, 61, 65}, X⁽²⁾(ℚ) is infinite (a degree-two map to an elliptic curve of positive rank) although r < g − 1, so finiteness of X⁽²⁾(ℚ) does not follow from two independent vanishing differentials.
Test symmetricSquare_reduction_compat: red_J(ι⁽²⁾(𝒬)) = ι̃⁽²⁾(red 𝒬) in J̃(𝔽_p), the identity behind ι_p in Caraiani–Newton §7.4.
Test symmetricSquare_conjugate_divisor: A genuinely quadratic point P together with its conjugate defines one rational effective divisor P+P^σ of degree2, although neither point is rational; 2Q at a rational point has degree2 and does not collapse to the singleton divisor Q.

### EffectiveDiophantineMethods:ED.4/symmetric-chabauty
Names: TauCeti.EffectiveDiophantine.ED4.eq_of_rank_symmetricMatrix
Reason: The actual effective-divisor and common-finite-extension local expansions with certified multiplicity/ramification bounds are unavailable.
Required signature: In a symmetric-square Chabauty datum (ED.4/symmetric-square-chabauty-datum) for X/ℚ non-hyperelliptic of genus g ≥ 3 and a prime p of good reduction, let 𝒬 = {Q₁, Q₂} ∈ X⁽²⁾(ℚ) and ω₁, …, ω_k a basis of Ṽ. Suppose p > 2, and p ≠ 3 when [𝔽_p(Q̃₁) : 𝔽_p] = 1. If rank Ã(𝒬) = 2, then 𝒬 is the unique point of X⁽²⁾(ℚ) in its residue class modulo p. Two independent vanishing differentials exist when r < g − 1; the criterion can fail even then. Derive the power-sum valuation contradiction from Siksek2009 Theorem3.2 and Lemmas3.3–3.4; do not assume a generic injectivity or linear-congruence criterion as a geometric factory. Hypotheses: Hypotheses of Box Theorem 2.1: p > 2; p ≠ 3 when Q̃₁ is 𝔽_p-rational; X non-hyperelliptic of genus ≥ 3 with good reduction at p. Ṽ is the reduction of the integral annihilator of J(ℚ) (ED.4/annihilating-differentials); computing it from a finite-index subgroup suffices.

### EffectiveDiophantineMethods:ED.4/relative-symmetric-chabauty
Names: TauCeti.EffectiveDiophantine.ED4.mem_pullback_of_relativeCriterion.geometric, TauCeti.EffectiveDiophantine.ED4.mem_pullback_of_relativeCriterion
Reason: The abstract symmetric-space test receives the Box criterion as an assumption. The supporting set-cover implication has a distinct name and cannot stand for the geometric theorem.
Required signature: Use actual Sym²X, the degree-two Abel–Jacobi map and relative cover X→C, regular differential trace kernel, all divisors and local parameters; derive Box rank/vanishing criterion then membership in the pullback locus. Caraiani–Newton §7.4 is its relative application, not a new general owner.
-/

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
  (fun b => ⟨b.val % 2, by omega⟩) Fin.elim0 {1} {1, 3}).check = true := by
  sorry
-- rawSieve_missing_lift: keeping only one lift is rejected.
example : (RawSieveStep.mk (oldSize := 2) (newSize := 4) (places := 0)
  (fun b => ⟨b.val % 2, by omega⟩) Fin.elim0 {1} {1}).check = false := by
  sorry
-- rawSieve_empty: a false local test rules out every class.
example : (RawSieveStep.mk (oldSize := 1) (newSize := 1) (places := 1)
  id (fun _ _ => false) {0} ∅).check = true := by
  sorry

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
are unavailable as the required identified supplier interfaces at the pin. The original
geometric declaration names are explicitly omitted below under PROTOCOL §13.
The present abstract point/coordinate/matrix helpers retain narrower names and
state only their supporting algebra; they do not instantiate the geometric contracts. Inputs supplied by other roadmaps
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

/-- Supporting set-theoretic soundness of a supplied semantic run. The geometric
`rationalPoints_eq_of_qcCertificate` is explicitly omitted below. -/
theorem QCRun.rational_eq_of_matched {p : ℕ} [Fact p.Prime] {X : Type*} {R : Set X}
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
structure ExplicitSetupLinearData (L : Type*) [Field L] [Algebra ℚ L] (g d : ℕ) where
  residues : Matrix (Fin d) (Fin (d - 1)) L
  residues_sum : ∀ k, ∑ x, residues x k = 0
  residues_rank : residues.rank = d - 1
  cupMatrix : Matrix (Fin g ⊕ Fin g) (Fin g ⊕ Fin g) ℚ
  cupMatrix_symplectic : cupMatrix = symplecticCupMatrix g
  tate : AdmissibleTateMatrix g

namespace ExplicitSetupLinearData

variable {L : Type*} [Field L] [Algebra ℚ L] {g d : ℕ}

theorem residue_injective (S : ExplicitSetupLinearData L g d) (c : Fin (d - 1) → L)
    (hc : S.residues *ᵥ c = 0) : c = 0 := sorry

theorem cupMatrix_eq (S : ExplicitSetupLinearData L g d) : S.cupMatrix = symplecticCupMatrix g := sorry

/-! ### ED.6/explicit-connection -/

/-- Lemma 4.10 in linear-algebra form: residue data with total residue zero determine the
coefficients of η uniquely. -/
theorem eta_existsUnique (S : ExplicitSetupLinearData L g d) (r : Fin d → L) (hr : ∑ x, r x = 0) :
    ∃! c : Fin (d - 1) → L, S.residues *ᵥ c = r := sorry

end ExplicitSetupLinearData

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

-- explicitSetup_frobenius_nonexample: b–d do not imply the genuine Tate/Frobenius condition.
example (Z : Matrix (Fin 3 ⊕ Fin 3) (Fin 3 ⊕ Fin 3) ℚ) (hZ : Z ≠ 0) :
    (1 : Matrix (Fin 3 ⊕ Fin 3) (Fin 3 ⊕ Fin 3) ℚ)ᵀ * Z * 1 ≠ (17 : ℚ) • Z := sorry

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

/-- Supporting Laurent linear-system existence and uniqueness of
`(γ_Fil, b_Fil)`, the surjectivity hypothesis `hsurj` being the Mittag-Leffler/Riemann–Roch
input `H¹_dR / Fil¹ ≅ H¹(X, 𝒪)` (NC.2). -/
theorem hodgePrincipalParts_linearSystem {L A : Type*} [Field L] [CommRing A] {g : ℕ} {ι : Type*}
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
theorem frobeniusStructure_blockEquations {A : Type*} [CommRing A] [Algebra ℚ A] {m : ℕ}
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
`diag(1, F⁻¹, p⁻¹)`; equivalently `G S = S diag(1,F,p)`.
This declaration below is only the uniquely solvable block system. -/
theorem frobeniusSplitting_linearSystem {p : ℕ} [Fact p.Prime] {m : ℕ} (F : Matrix (Fin m) (Fin m) ℚ_[p])
    (hF₁ : IsUnit (1 - F).det) (hFp : IsUnit (F - (p : ℚ_[p]) • 1).det)
    (f g : Fin m → ℚ_[p]) (h : ℚ_[p]) :
    ∃! t : (Fin m → ℚ_[p]) × (Fin m → ℚ_[p]) × ℚ_[p], (1 - F) *ᵥ t.1 = f ∧
      t.2.1 ᵥ* (F - (p : ℚ_[p]) • 1) = g ∧ (1 - (p : ℚ_[p])) * t.2.2 = g ⬝ᵥ t.1 + h := sorry

/-- BDMTV Lemma 5.5: the local height at p from the Hodge and Frobenius data. -/
def localHeightExpression {p : ℕ} [Fact p.Prime] {m : ℕ} (χp : ℚ_[p] →+ ℚ_[p])
    (s₁ s₂ : Matrix (Fin m) (Fin m) ℚ_[p]) (αφ βφ βFil : Fin m → ℚ_[p]) (γφ γFil : ℚ_[p]) :
    ℚ_[p] :=
  χp (γφ - γFil - βφ ⬝ᵥ (s₁ *ᵥ αφ) - βFil ⬝ᵥ (s₂ *ᵥ αφ))

/-- BDMTV (15), (17) and Lemma 5.5: Nekovář's `h_p(M) = χ_p([M] − δ([E₁]))`. In the `s₀`-coordinates
`E₂ = V_dR ⊕ ℚ_p(1)` given by (16), `[M] = s^φ(1) − s^Fil(1) = (α_φ, γ_φ − γ_Fil)`, the class
`[E₁] = α_φ mod Fil⁰` is sent by `δ` (the splitting `s = s₁`, then the Frobenius-equivariant
splitting `v ↦ (v, β_φᵀv)` of `E₂`) to `(s₁α_φ, β_φᵀ s₁α_φ)`, and `Fil⁰E₂ = {(v, β_Filᵀv) : v ∈ Fil⁰ = im s₂}`.
The `ℚ_p(1)`-component `t` of `[M] − δ([E₁])` modulo `Fil⁰E₂` is unique and `χ_p(t)` is
`localHeightExpression`. -/
theorem localHeightExpression_quotient {p : ℕ} [Fact p.Prime] {m : ℕ} (χp : ℚ_[p] →+ ℚ_[p])
    (s₁ s₂ : Matrix (Fin m) (Fin m) ℚ_[p]) (hs : s₁ + s₂ = 1) (hs₂ : s₂ * s₂ = s₂)
    (αφ βφ βFil : Fin m → ℚ_[p]) (γφ γFil : ℚ_[p]) :
    (∃! t : ℚ_[p], ∃ v : Fin m → ℚ_[p], s₂ *ᵥ v = v ∧
      (αφ, γφ - γFil) - (s₁ *ᵥ αφ, βφ ⬝ᵥ (s₁ *ᵥ αφ)) - (0, t) = (v, βFil ⬝ᵥ v)) ∧
    ∀ t : ℚ_[p], (∃ v : Fin m → ℚ_[p], s₂ *ᵥ v = v ∧
      (αφ, γφ - γFil) - (s₁ *ᵥ αφ, βφ ⬝ᵥ (s₁ *ᵥ αφ)) - (0, t) = (v, βFil ⬝ᵥ v)) →
      χp t = localHeightExpression χp s₁ s₂ αφ βφ βFil γφ γFil := sorry

/-- BDMTV Lemma 5.7 (matrix form): `L(I(b,b')) · R(I(b,b'))⁻¹` applied to the base-point
splitting `[[1,0,0],[0,1,0],[0,β_φᵀ,1]]` gives `[[1,0,0],[0,1,0],[0,β_φᵀ + 2∫ωᵀZ,1]]`. -/
theorem baseChange_splitting_matrix {m : ℕ} (Z : Matrix (Fin m) (Fin m) R) (hZ : Zᵀ = -Z)
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
theorem iteratedIntegral_valuation_coeff_ge (p : ℕ) [Fact p.Prime] {m : ℕ} (F : Fin m → PowerSeries ℤ_[p])
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

/-- Exact b–d matrix conditions and independence only. Genuine Hecke cycle classes and
Frobenius condition(a) belong to the omitted `xs13_tateClasses_admissible`. -/
theorem xs13_tateMatrices_linearConditions :
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

/-- Supporting union of three arbitrary sets. Actual `xs13_rationalPoints`, with modular
model and cusp/CM identification, is omitted below. -/
theorem rational_eq_of_three_charts {X : Type*} (R U₁ U₂ U₀ : Set X) (P : Fin 7 → X)
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
`2, 3, 5, 7`. Inputs: `h13`, the moduli reading of `rational_eq_of_three_charts` (`X_s(13)(ℚ)` consists of
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

/-- Supporting cardinal transport through an arbitrary equivalence. This is not the
actual `xns13_rationalPoints_card` theorem, omitted below. -/
theorem card_eq_seven_of_equiv {Xs Xns : Type*} [Fintype Xs] [Fintype Xns] (e : Xs ≃ Xns)
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

/-- Supporting four-point implication for an assumed complete run, plus exact polynomial
memberships. Actual `xS4_13_rationalPoints` is omitted below. -/
theorem four_points_of_complete_run {X : Type*} (R : Set X) (P : Fin 4 → X) (hP : ∀ i, P i ∈ R)
    (run : QCRun 11 X R) (h : run.MatchedOrExcluded (Set.range P)) :
    (∀ i, MvPolynomial.eval (xS4_13Points i) xS4_13Quartic = 0) ∧ R = Set.range P := sorry

/-- Supporting ten-point implication for an assumed complete run, plus the N=97
polynomial memberships. Actual `x0plus_genusThree_rationalPoints` is omitted below. -/
theorem ten_points_of_complete_run {X : Type*} (R : Set X) (P : Fin 10 → X)
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


/-! ### Exact geometric omissions for ED.6 (revision3, PROTOCOL §13)

These names are not declarations with arbitrary Prop fields. Their mathematical contracts
are recorded here and in packet suggestedOmissions; supplier construction and numerical
replay remain open. Supporting helpers above have deliberately narrower names.

`TauCeti.EffectiveDiophantine.ED6.ExplicitSetup`, `TauCeti.EffectiveDiophantine.ED6.ExplicitSetup.residue_injective`, `TauCeti.EffectiveDiophantine.ED6.ExplicitSetup.cupMatrix_eq`, `TauCeti.EffectiveDiophantine.ED6.ExplicitSetup.functionField`, `TauCeti.EffectiveDiophantine.ED6.ExplicitSetup.tateFrobenius`

Over Q, take a smooth projective geometrically connected curve X of genus g≥2, a nonempty reduced boundary divisor D of degree d=#D(Qbar) and affine open Y=X−D, b∈Y(Q), a good prime p and a smooth Z_p-model with integral b. Put A=Γ(Y,O_Y), K=Q(X)=Frac(A). Choose a finite Galois splitting field L for D and uniformizers t_x identifying completed local rings at x∈D(L) with L[[t_x]] and their fraction fields with L((t_x)); expansions must be the maps induced by K⊗L, not arbitrary Laurent-family maps. Choose ω_0,…,ω_{2g+d−2} in Ω¹(Y/Q) whose classes form a basis of H¹_dR(Y), the first2g of the second kind, the firstg a basis of H⁰(X,Ω¹), with cup matrix C=[[0,I],[-I,0]], and third-kind complement with residue map an isomorphism onto {(r_x):Σr_x=0}. Put V_dR=H¹_dR(X)^* with dual basis T_i. Take nonzero rational tensor Z with antisymmetry, lower-right g×g block0 and zero cup contraction; under crystalline/de Rham comparison require Frobenius weight p, in coordinates FᵀZF=pZ. For height applications additionally supply an actual nice correspondence whose cycle class is Z; do not infer a rational algebraic cycle from these linear/Frobenius conditions. Outputs are these actual identified geometric data, residue injectivity for the third-kind span and the displayed actual cup pairing; the separate ExplicitSetupLinearData only stores matrices.

`TauCeti.EffectiveDiophantine.ED6.ExplicitSetup.eta_existsUnique`

Over Q, take a smooth projective geometrically connected curve X of genus g≥2, a nonempty reduced boundary divisor D of degree d=#D(Qbar) and affine open Y=X−D, b∈Y(Q), a good prime p and a smooth Z_p-model with integral b. Put A=Γ(Y,O_Y), K=Q(X)=Frac(A). Choose a finite Galois splitting field L for D and uniformizers t_x identifying completed local rings at x∈D(L) with L[[t_x]] and their fraction fields with L((t_x)); expansions must be the maps induced by K⊗L, not arbitrary Laurent-family maps. Choose ω_0,…,ω_{2g+d−2} in Ω¹(Y/Q) whose classes form a basis of H¹_dR(Y), the first2g of the second kind, the firstg a basis of H⁰(X,Ω¹), with cup matrix C=[[0,I],[-I,0]], and third-kind complement with residue map an isomorphism onto {(r_x):Σr_x=0}. Put V_dR=H¹_dR(X)^* with dual basis T_i. Take nonzero rational tensor Z with antisymmetry, lower-right g×g block0 and zero cup contraction; under crystalline/de Rham comparison require Frobenius weight p, in coordinates FᵀZF=pZ. For height applications additionally supply an actual nice correspondence whose cycle class is Z; do not infer a rational algebraic cycle from these linear/Frobenius conditions. Import NC.2 universal pointed A²_dR and NC.5 its pushout A_Z along V_dR⊗²→Q(1), factoring through coker(cup*). Construct s0:(Q⊕V_dR⊕Q(1))⊗O_Y≅A_Z|Y and the unique η in span(ω_{2g},…,ω_{2g+d−2}) such that ∇=d−[[0,0,0],[ω,0,0],[η,ωᵀZ,0]] extends nonsingularly over X. For dΩ_x=−ω, its actual residue conditions are Res_x(Ω_xᵀZ dΩ_x−η)=0. Existence uses the universal quotient extending over X and total-residue/cup compatibility; the sum-zero matrix solver alone proves only uniqueness/linear solvability. The result includes the geometric extension, trivialization and η, with gauges C_x and g_x in L((t_x)), dg_x=Ω_xᵀZ dΩ_x−η.

`TauCeti.EffectiveDiophantine.ED6.hodgeFiltration_basis`

Over Q, take a smooth projective geometrically connected curve X of genus g≥2, a nonempty reduced boundary divisor D of degree d=#D(Qbar) and affine open Y=X−D, b∈Y(Q), a good prime p and a smooth Z_p-model with integral b. Put A=Γ(Y,O_Y), K=Q(X)=Frac(A). Choose a finite Galois splitting field L for D and uniformizers t_x identifying completed local rings at x∈D(L) with L[[t_x]] and their fraction fields with L((t_x)); expansions must be the maps induced by K⊗L, not arbitrary Laurent-family maps. Choose ω_0,…,ω_{2g+d−2} in Ω¹(Y/Q) whose classes form a basis of H¹_dR(Y), the first2g of the second kind, the firstg a basis of H⁰(X,Ω¹), with cup matrix C=[[0,I],[-I,0]], and third-kind complement with residue map an isomorphism onto {(r_x):Σr_x=0}. Put V_dR=H¹_dR(X)^* with dual basis T_i. Take nonzero rational tensor Z with antisymmetry, lower-right g×g block0 and zero cup contraction; under crystalline/de Rham comparison require Frobenius weight p, in coordinates FᵀZF=pZ. For height applications additionally supply an actual nice correspondence whose cycle class is Z; do not infer a rational algebraic cycle from these linear/Frobenius conditions. With the actual gauges of the mixed connection, use the principal-parts exact sequence 0→L→Γ(Y_L,O)→⊕_{x∈D(L)} L((t_x))/L[[t_x]]→H¹(X_L,O)→0 and H¹_dR(X_L)/Fil¹≅H¹(X_L,O). The principal parts of the primitives of ω_g,…,ω_{2g−1} map to a basis of the last group. For N=(0,I)ᵀ prove existence and uniqueness of γ∈Γ(Y,O), b_Fil∈Q^g with γ(b)=0 and g_x+γ−b_FilᵀNᵀΩ_x−Ω_xᵀZNNᵀΩ_x regular at every boundary point. Descend from L by uniqueness. Prove that the subbundle spanned by1+γS,T_g+b_gS,…,T_{2g−1}+b_{2g−1}S extends over X and satisfies Hadian’s transversality, exact-sequence and pointed-identity conditions; hence it equals Fil⁰A_Z. Return the actual filtered isomorphism sFil with βFil=(0,b_Fil), not just a solution to a Laurent linear system.

`TauCeti.EffectiveDiophantine.ED6.frobeniusStructure_eq`

Over Q, take a smooth projective geometrically connected curve X of genus g≥2, a nonempty reduced boundary divisor D of degree d=#D(Qbar) and affine open Y=X−D, b∈Y(Q), a good prime p and a smooth Z_p-model with integral b. Put A=Γ(Y,O_Y), K=Q(X)=Frac(A). Choose a finite Galois splitting field L for D and uniformizers t_x identifying completed local rings at x∈D(L) with L[[t_x]] and their fraction fields with L((t_x)); expansions must be the maps induced by K⊗L, not arbitrary Laurent-family maps. Choose ω_0,…,ω_{2g+d−2} in Ω¹(Y/Q) whose classes form a basis of H¹_dR(Y), the first2g of the second kind, the firstg a basis of H⁰(X,Ω¹), with cup matrix C=[[0,I],[-I,0]], and third-kind complement with residue map an isomorphism onto {(r_x):Σr_x=0}. Put V_dR=H¹_dR(X)^* with dual basis T_i. Take nonzero rational tensor Z with antisymmetry, lower-right g×g block0 and zero cup contraction; under crystalline/de Rham comparison require Frobenius weight p, in coordinates FᵀZF=pZ. For height applications additionally supply an actual nice correspondence whose cycle class is Z; do not infer a rational algebraic cycle from these linear/Frobenius conditions. Over Q_p take an actual strict neighborhood of the tube ]U[ in Y^an, its overconvergent structure sheaf, an overconvergent Frobenius lift φ reducing to p-power Frobenius, and a Teichmüller b0 in b’s disc. In the s0 coordinates of A_Z^rig, compute φ*ω=Fω+df with f(b0)=0, and FᵀZF=pZ. Define g0=−FᵀZf, ξ=(φ*ω)ᵀZf+φ*η−pη−g0ᵀω, and use actual rigid-cohomology reduction ξ=cᵀω+dh, h(b0)=0, to put g=g0+c. Identify the resulting G=[[1,0,0],[f,F,0],[h,gᵀ,p]] with Φ_Z⁻¹: ΛφG+dG=GΛ, and normalization1↦1 at b0. Uniqueness is among the graded-compatible morphisms of the actual pointed universal quotient. For the actual Frobenius Φ_Z the graded matrix is diag(1,F⁻¹,p⁻¹), while G has graded matrix diag(1,F,p). RD.7 must return coefficient, exactness and precision certificates for these actual overconvergent sections.

`TauCeti.EffectiveDiophantine.ED6.frobeniusSplitting_eq`

Over Q, take a smooth projective geometrically connected curve X of genus g≥2, a nonempty reduced boundary divisor D of degree d=#D(Qbar) and affine open Y=X−D, b∈Y(Q), a good prime p and a smooth Z_p-model with integral b. Put A=Γ(Y,O_Y), K=Q(X)=Frac(A). Choose a finite Galois splitting field L for D and uniformizers t_x identifying completed local rings at x∈D(L) with L[[t_x]] and their fraction fields with L((t_x)); expansions must be the maps induced by K⊗L, not arbitrary Laurent-family maps. Choose ω_0,…,ω_{2g+d−2} in Ω¹(Y/Q) whose classes form a basis of H¹_dR(Y), the first2g of the second kind, the firstg a basis of H⁰(X,Ω¹), with cup matrix C=[[0,I],[-I,0]], and third-kind complement with residue map an isomorphism onto {(r_x):Σr_x=0}. Put V_dR=H¹_dR(X)^* with dual basis T_i. Take nonzero rational tensor Z with antisymmetry, lower-right g×g block0 and zero cup contraction; under crystalline/de Rham comparison require Frobenius weight p, in coordinates FᵀZF=pZ. For height applications additionally supply an actual nice correspondence whose cycle class is Z; do not infer a rational algebraic cycle from these linear/Frobenius conditions. On the actual fibre x0* A_Z at a Teichmüller point x0, prove that the unique Frobenius-compatible unipotent splitting S=s0⁻¹sφ has α=(I−F)⁻¹f(x0), βᵀ=g(x0)ᵀ(F−pI)⁻¹, γ=(g(x0)ᵀα+h(x0))/(1−p). Its precise intertwining identity is G(x0)S=S diag(1,F,p), equivalently Φ_Z(x0)S=S diag(1,F⁻¹,p⁻¹). Weil weights prove invertibility of I−F,F−pI,1−p. For actual fibres at general b,x, Besser path transport gives S(b,x)=L(I(x0,x))R(I(b,b0))S(b0,x0); hence α(b,x)=∫_b^xω. The tuple solver alone does not identify any fibre or Coleman integral.

`TauCeti.EffectiveDiophantine.ED6.localHeight`, `TauCeti.EffectiveDiophantine.ED6.localHeight_eq`

Over Q, take a smooth projective geometrically connected curve X of genus g≥2, a nonempty reduced boundary divisor D of degree d=#D(Qbar) and affine open Y=X−D, b∈Y(Q), a good prime p and a smooth Z_p-model with integral b. Put A=Γ(Y,O_Y), K=Q(X)=Frac(A). Choose a finite Galois splitting field L for D and uniformizers t_x identifying completed local rings at x∈D(L) with L[[t_x]] and their fraction fields with L((t_x)); expansions must be the maps induced by K⊗L, not arbitrary Laurent-family maps. Choose ω_0,…,ω_{2g+d−2} in Ω¹(Y/Q) whose classes form a basis of H¹_dR(Y), the first2g of the second kind, the firstg a basis of H⁰(X,Ω¹), with cup matrix C=[[0,I],[-I,0]], and third-kind complement with residue map an isomorphism onto {(r_x):Σr_x=0}. Put V_dR=H¹_dR(X)^* with dual basis T_i. Take nonzero rational tensor Z with antisymmetry, lower-right g×g block0 and zero cup contraction; under crystalline/de Rham comparison require Frobenius weight p, in coordinates FᵀZF=pZ. For height applications additionally supply an actual nice correspondence whose cycle class is Z; do not infer a rational algebraic cycle from these linear/Frobenius conditions. Fix the actual NC.5 mixed extension A_Z(b,x), idèle class character χ with chosen p-adic logarithm branch, its additive factor χ_p on Q_p after the logarithm, and a splitting s of V_dR/Fil⁰V_dR with complementary projectors s1,s2. Use the cycle-compatible filtered φ-module comparison D_cris(A_Z(b,x))≅x* A_Z. For the actual Hodge and Frobenius splittings prove Nekovář h_p(A_Z(b,x))=χ_p(γφ−γFil−βφᵀs1(αφ)−βFilᵀs2(αφ)). Identify this locally analytic function with θ_Z in NC.5 and its actual convergent residue-disc expansion. The expression and quotient-coordinate helper are not a definition of the geometric height.

`TauCeti.EffectiveDiophantine.ED6.baseChange_splitting_eq`

Over Q, take a smooth projective geometrically connected curve X of genus g≥2, a nonempty reduced boundary divisor D of degree d=#D(Qbar) and affine open Y=X−D, b∈Y(Q), a good prime p and a smooth Z_p-model with integral b. Put A=Γ(Y,O_Y), K=Q(X)=Frac(A). Choose a finite Galois splitting field L for D and uniformizers t_x identifying completed local rings at x∈D(L) with L[[t_x]] and their fraction fields with L((t_x)); expansions must be the maps induced by K⊗L, not arbitrary Laurent-family maps. Choose ω_0,…,ω_{2g+d−2} in Ω¹(Y/Q) whose classes form a basis of H¹_dR(Y), the first2g of the second kind, the firstg a basis of H⁰(X,Ω¹), with cup matrix C=[[0,I],[-I,0]], and third-kind complement with residue map an isomorphism onto {(r_x):Σr_x=0}. Put V_dR=H¹_dR(X)^* with dual basis T_i. Take nonzero rational tensor Z with antisymmetry, lower-right g×g block0 and zero cup contraction; under crystalline/de Rham comparison require Frobenius weight p, in coordinates FᵀZF=pZ. For height applications additionally supply an actual nice correspondence whose cycle class is Z; do not infer a rational algebraic cycle from these linear/Frobenius conditions. For b′∈X(Q_p) in a pole-free residue disc, use the actual NC.2/Besser path isomorphism v↦I(b,b′)vI(b′,b). On A_Z obtain βFil(b′)=βFil(b), γFil(b′,x)=γFil(b,x)−γFil(b,b′), and S(b′,b′)=[[1,0,0],[0,I,0],[0,βφ(b,b)ᵀ+2∫_b^{b′}ωᵀZ,1]]. These identities together with Coleman integrals and tiny integrals compute the local height on the b′ disc even when the original Frobenius lift is absent there. Global rational-point/NC.5 comparisons require rational b′ and transport of the endomorphism, Chow–Heegner constant and away-from-p height data; do not claim equality of the individual scalar height functions for different base points. Assert invariance of the underlying identified Chabauty–Kim locus, supplied by NC.5, rather than invariance of every auxiliary zero set.

`TauCeti.EffectiveDiophantine.ED6.rationalPoints_eq_of_qcCertificate`

Let X/Q be a smooth projective geometrically connected curve of genus g ≥ 2 with b ∈ X(Q), Jacobian J of rank r = g with log : J(Q) ⊗ Q_p ≅ H⁰(X_{Q_p}, Ω¹)^*, ρ(J) ≥ 2, and p a prime of good reduction. Let Z_1, …, Z_k be nice classes and (θ_j, Υ_j) the quadratic Chabauty pairs of NC.5 with endomorphism E_j, constant c_j and pairing B_j (BDMTV Lemma 3.7, with Υ_j = {0} under potentially good reduction everywhere, Corollary 3.8). Suppose given: (a) a finite set L ⊆ X(Q) of verified rational points containing b and points P_1, …, P_m such that AJ_b(P_i) ⊗ (E_j(AJ_b(P_i)) + c_j) span E (or E_K = H⁰(Ω¹)^* ⊗_{K_p} H⁰(Ω¹)^* when the heights are K-equivariant); (b) for every x̄ ∈ X(F_p) and every choice (α_1, …, α_k) ∈ Υ_1 × ⋯ × Υ_k, a qc-disc-certificate on ]x̄[ for the family (det T_{j,α_j})_{j ≤ k} of the determinant criterion, whose power-series coefficients are computed by local-height-at-p and Coleman integration to the precision certified by height-series-valuation-bound; (c) for every centre of every disc certificate, a matching with an element of L or an exclusion. Then X(Q) = L, an unconditional certified solution set given the stated rank and Picard hypotheses (which are themselves certified inputs). If (b) or (c) fails for some disc, only L ⊆ X(Q) is asserted. The rational-point carrier is Hom_Q(Spec Q,X) and its injective image in Hom_Qp(Spec Q_p,X_Qp); residue discs are fibres of reduction from the chosen smooth proper Z_p-model. Require chart identifications with Z_p, actual NC.5 height/cycle/logarithm semantics for every determinant series, complete choices of away-from-p height values, finite coefficient/tail/tree certificates whose check_sound yields covers/uniqueness, and genuine geometric matching/sieve exclusions. If rank or supplier assertions remain conditional, the conclusion retains their conjunction as its label. QCRun.rational_eq_of_matched is only the final set-theoretic implication.

`TauCeti.EffectiveDiophantine.ED6.xs13_tateClasses_admissible`

For the actual Q-curve X_s(13) identified with xs13Quartic=0, its Jacobian J, the actual symplectic de Rham basis of the first chart and actual Hecke correspondences T7,T11 defined overQ, certify their exact matrices A7,A11. The trace-zero symmetric correspondences6T_q−tr(A_q)Id have zero cup contraction; construct their actual tensor cycle classes Z_q=(6A_q−tr(A_q)I)C⁻¹ and identify them entrywise with xs13Z1,xs13Z2. Prove these classes are nonzero, independent, in Fil¹, antisymmetric and cup-trivial and satisfy F_pᵀZ_qF_p=pZ_q after crystalline comparison at every prime of good reduction, in particular p=17. Exact Hecke reconstruction requires CN.3 bounds or q-expansion/duality certification; a finite p-adic approximation and the b–d checks alone do not supply condition(a).

`TauCeti.EffectiveDiophantine.ED6.valuation_coeff_ge`, `TauCeti.EffectiveDiophantine.ED6.qcValuation_lowDegree`, `TauCeti.EffectiveDiophantine.ED6.qcValuation_branchBoundary`, `TauCeti.EffectiveDiophantine.ED6.qcValuation_zeroCoefficient`

For the actual QC function ρ=h−h_p on D⊂X(Q_p)∩]U[, under BDMTV2021§4 standing hypotheses (p-integral F,Z and local expansions of ω,ωᵀZ; fixed End(J)-equivariant Hodge splitting), choose t at x1∈D, t(D)⊂pZ_p and Teichmüller x0. Use ord_p(0)=∞; for matrices/vectors use the minimum of entry valuations, including the diagonal1 of λφ so c1≤0. Certify c1=ord_p(λφ(x1)) by Frobenius evaluation and path-transport precision, v_spl=min valuation of the splitting coefficients, b=ord_p(βFil), a=ord_p(γFil), c2=min{0,v_spl,b,v_spl+b}, and c3=min_j ord_p(d_j) for the genuine global-height expansion h=Σd_jΨ_j. Let d_i(η) be certified lower bounds for the actual degree i−1 coefficient of η (all coefficient/coordinate changes included); the source uses a finite polynomial-coefficient branch and0 after its degree bound, whose sufficiency must be proved for the actual model. With ℓ_i=⌊log_p i⌋ for i≥1 put φ(i)=−ℓ_i+min{d_i(η),−ℓ_i}. The branches are φ(i)=d_i(η)−ℓ_i if d_i(η)<−ℓ_i, otherwise φ(i)=−2ℓ_i; the λφ coefficients have lower bound φ(i)+c1. Explicitly certify i0≥1 such that for every i≥i0, −ℓ_i≤d_i(η), 2(−ℓ_i)≤b and 2(−ℓ_i)≤a−c2 (the floor-half inequalities on publishedp1136). Then ord_p(ρ_i)≥−2ℓ_i+c1+min{c2,c3} for i≥i0 (Proposition4.6). Coefficients0≤i<i0 require their own finite valuation certificates; all-zero βFil,γFil or global-height coefficients use∞ and omit vacuous comparisons instead of assigning integer0. The actual coordinate/differential estimates and algebraic cancellations proving this height bound remain obligations; do not derive it solely from arbitrary matrices or assume the final coefficient inequality. For the elementary single/double-integral estimate of BDMTV2019pp932–933 retain the separate helper iteratedIntegral_valuation_coeff_ge. The source notation φ in preprintv4p24 has an extra+c1 corrected in publishedp1136; use publishedφ and addc1 once to the splitting bound. This is Proposition4.6, not Proposition4.1; the latter evaluates G(P). Regression contracts: qcValuation_lowDegree rejects applying the tail formula to i<i0; qcValuation_branchBoundary identifies both formulas at d_i(η)=−floor(log_p i); qcValuation_zeroCoefficient uses∞ and does not call Padic.valuation(0).

`TauCeti.EffectiveDiophantine.ED6.xs13_rationalPoints`

On X_s(13)(Q)=Hom_Q(Spec Q,X_s(13)), use the certified R13.4a isomorphism to the smooth projective quartic xs13Quartic=0 in P²_Q. Let P_i be the projective classes of xs13Points(i), i=0,…,6. Prove X_s(13)(Q)={P_i}, with all seven distinct, by the actual seventeen first-chart discs, two second-chart discs and P0 disc at17, using the named geometric factory results. Through the actual modular j-map the set is one cusp and six CM points of discriminants−3,−4,−12,−16,−27,−43 and j-values0,1728,54000,287496,−12288000,−884736000. Require the j=0,1728 special-fibre moduli comparisons; no point-by-point matching of P_i to discriminants is claimed without the explicit j-map. The final mathematical theorem is unconditional; until rank/model/path/zero-table suppliers are discharged, its certificate carries their explicit conjunction. The arbitrary three-set union lemma is only the assembly argument.

`TauCeti.EffectiveDiophantine.ED6.xns13_rationalPoints_card`

For the actual modular Q-curve X_ns(13) and its rational-point carrier Hom_Q(SpecQ,X_ns(13)), construct Baran’s Q-isomorphism to X_s(13) from the certified two quartic models and projective GL3(Q) coordinate change. Transport the seven-point theorem to get #X_ns(13)(Q)=7. Through its own modular j-map, independently construct the seven CM points above discriminants−7,−8,−11,−19,−28,−67,−163; prove their distinctness and exhaustiveness. These have j-values−3375,8000,−32768,−884736,16581375,−147197952000,−262537412640768000 respectively. Do not give Baran’s isomorphism a modular interpretation or assert it preserves j. The unconstructed X_ns quartic/map and CM/moduli comparison remain supplier obligations, not an arbitrary finite-type equivalence hypothesis.

`TauCeti.EffectiveDiophantine.ED6.xS4_13_rationalPoints`

For the actual modular curve X_S4(13), identified with the smooth projective quartic xS4_13Quartic=0, prove its Q-points are exactly the four projective classes xS4_13Points: (1:3:−2),(0:0:1),(0:1:0),(1:0:0). The point(0:0:1) is CM of discriminant−3; the other three have projective mod13 imageS4, with the three j-values stated in this node. Inputs to the proof are the genuine isogeny to J_s(13), potential-good-reduction result, actual two affine patches from BDMTVv4§5.1p26, p=11,T11 andT11² classes, four-point height pairing, and certified complete common-zero/matching tables on every disc. The final theorem is unconditional; missing supplier proofs and unreplayed computations are recorded gaps. An arbitrary QCRun whose output is already assumed complete is not the application.

`TauCeti.EffectiveDiophantine.ED6.x0plus_genusThree_rationalPoints`

For each N∈{97,109,113,127,139,149,151,179,239}, let X=X0(N)/⟨w_N⟩ be the actual coarse smooth projective Q-curve and identify it with the corresponding explicit plane quartic in BDMTVv4 Examples5.7–5.15pp31–32. Prove equality of its Hom_Q(SpecQ,X) with exactly the projective classes in the following ordered source lists, with cusp/CM identification through the quotient modular interpretation (not a single descended j-map on X0+(N)). N=97, p=5: Q_N=zx³+(−y²+zy)x²+(−y³−zy²−z³)x+zy³+z²y²=0; ordered points (1:0:0),(-2:1:1),(-1:0:1),(0:0:1),(0:1:0),(0:-1:1),(1:0:1),(1:1:1),(-1:1:0),(5:3:2); first point is the cusp, remaining CM discriminants in order -3,-4,-8,-11,-12,-16,-27,-43,-163. N=109, p=29: Q_N=zx³+(zy+z²)x²+(−y³−zy²−z³)x−zy³−3z²y²−2z³y=0; ordered points (1:0:0),(-2:1:2),(0:-2:1),(0:-1:1),(0:1:0),(0:0:1),(-1:-1:1),(-2:1:1),(1:-1:1); first point is the cusp, remaining CM discriminants in order -3,-4,-7,-12,-16,-27,-28,-43. N=113, p=17: Q_N=zx³+(−y²−z²)x²+(y³+z³)x−2z²y²+z³y=0; ordered points (1:0:0),(2:2:1),(0:1:0),(1:1:1),(1:1:0),(0:0:1),(0:1:2),(5:3:1); first point is the cusp, remaining CM discriminants in order -4,-7,-8,-11,-16,-28,-163. N=127, p=11: Q_N=zx³+(−y²−3z²)x²+(y³−z²y+4z³)x+2zy³−3z²y²+3z³y−2z⁴=0; ordered points (1:0:0),(5:3:2),(2:1:1),(1:1:0),(1:0:1),(0:1:1),(0:1:0),(4:2:1); first point is the cusp, remaining CM discriminants in order -3,-7,-12,-27,-28,-43,-67. N=139, p=19: Q_N=zx³+(−y²+zy)x²+(−y³−2zy²−3z²y−z³)x+y⁴+zy³+z²y²+z³y=0; ordered points (1:0:0),(4:-3:1),(0:0:1),(0:-1:1),(1:-1:1),(1:0:1),(-1:0:1); first point is the cusp, remaining CM discriminants in order -3,-8,-12,-19,-27,-43. N=149, p=11: Q_N=zx³−y²x²+(y³+zy²−2z²y−z³)x−y⁴+zy³+z²y²−z³y=0; ordered points (1:0:0),(-1:0:1),(0:1:1),(1:0:1),(0:0:1),(0:-1:1),(2:2:1); first point is the cusp, remaining CM discriminants in order -4,-7,-16,-19,-28,-67. N=151, p=19: Q_N=zx³+(−2zy+z²)x²+(−y³+2zy²)x−zy³+3z²y²−z³y−2z⁴=0; ordered points (1:0:0),(-2:-2:1),(0:1:0),(0:2:1),(1:1:1),(2:3:2),(1:0:1),(3:2:1); first point is the cusp, remaining CM discriminants in order -3,-7,-12,-27,-28,-67,-163. N=179, p=17: Q_N=zx³+(−2zy−z²)x²+(−y³−zy²−2z²y−z³)x−zy³+z³y=0; ordered points (1:0:0),(0:-1:1),(0:1:0),(0:0:1),(0:1:1),(-2:2:1); first point is the cusp, remaining CM discriminants in order -7,-8,-11,-28,-163. N=239, p=13: Q_N=zx³+(−y²+zy+z²)x²+(−y³−zy²−z²y)x+y⁴+3zy³+2z²y²+z³y=0; ordered points (1:0:0),(-1:0:1),(0:0:1),(1:-2:1),(1:-1:1); first point is the cusp, remaining CM discriminants in order -7,-19,-28,-43. The source counts are10,9,8,8,7,7,8,6,5 respectively. Require genuine rank/logarithm, endomorphism, model/reduction, local-height and two-cycle coefficient/zero/matching certificates for each N. Retain the modular rank-overQ and numerical replay gaps; do not generalize the ten-point97 helper to every level.

-/

end TauCeti.EffectiveDiophantine.ED6

end PartED6

end

/-! ## Exact supplier-bound signature omissions (PROTOCOL §13)

These are precise mathematical obligations. Supporting definitions and theorems with
different names do not discharge them. No omitted signature is claimed elaborated.

EffectiveDiophantineMethods:ED.0/certified-enclosure
Names: TauCeti.EffectiveDiophantine.ED0.PadicEnclosure.toPadicApproximation, padicEnclosure_normalize_five, padicEnclosure_normalize_zero
Reason: CN.0 PadicApproximation is planned but not a declaration at either pin.
Required mathematical signature: For e : PadicEnclosure p x, return a : CN.0 PadicApproximation p with a.N=e.precision and a.denotation={z : Q_p | ||z-e.centre||≤p^(-N)}; hence x∈a.denotation. At c=0 take (N,N,0); otherwise v=min(v_p(c),N), and if v<N choose the nonzero residue s prime to p. The (5,1) at p=3 test must return (1,0,2), not merely a ball-membership proof. The zero-centre regression must return (2,2,0) at p=3,N=2; ball-membership examples alone do not test either record constructor.

EffectiveDiophantineMethods:ED.2/thue-analytic-constants
Names: TauCeti.EffectiveDiophantine.ThueConstants, TauCeti.EffectiveDiophantine.ThueConstants.ofBoxes, TauCeti.EffectiveDiophantine.ThueConstants.mono, thueConstants_totally_complex
Reason: The complete covering-indexed constant and interval-inverse certificate carrier is not built; the former g,m,P producer was not its signature.
Required mathematical signature: The finite representation is over a certified number-field presentation Q[T]/(G), with rational power-basis coordinates, integral-basis conversion matrices, an irreducibility certificate, labelled real/complex embeddings, and the actual algebraic root θ. Ideal, unit, root-isolation and logarithm data are outputs of the CN.0/CN.2/CN.4 suppliers already named by this packet. No new generic number-field algorithm is owned here. A raw transcript has no proof fields. All loops have explicit finite index sets or integer ranges; checking uses exact integer/rational arithmetic and modular exponentiation. Supplier soundness theorems identify a checked finite record with the actual field, ideals, roots, units and logarithms. This identification belongs to the soundness theorem and is not a Boolean comparison on R or an assumption that the claimed answer is complete. The covering transcript records the complete prime-ideal factorizations of the fixed norm ideal and of every p_i, finite bounded valuation vectors given by the full removing lemma, all ideal-class remainders, principal generators (or certified nonprincipality), torsion representatives and exactly Units.rank K independent units. It checks ideal products, norms, residue degrees, class-order relations, basis conversions and a complete-unit regulator/index certificate. The finite case index set is exactly the product of these bounded choices, modulo explicitly checked duplicates; an omitted combination rejects. Its soundness derives conditions (U),(M)/(C). A finite list with a proof field saying it covers all solutions is only the separate semantic covering, not this finite input. ThueConstants is indexed by the actual ThueEquation E, K, ξ and its complete factor covering, with explicit no-real-root, empty-covering and nonempty-real-root tags. ofBoxes receives the certified complete root boxes, covering M, exactly rank(K) fundamental units and complete unit certificate, compatible embedding evaluations of ξ, every μ and ε_i, log|ε_i| intervals, precision bounds, and the selected index sets I. It checks disjoint/simple roots, conjugate-pair labels, nonzero representative modulus lower bounds, and all root-distance/derivative bounds. For each chosen U_I it checks a rational approximate inverse V and a uniform interval bound ||1−VU||∞≤ρ<1, with rows=embeddings and columns=units. It returns all correctly oriented c1,…,c6,μ−,μ+,Y0,Y1,Y1*,Y2 inequalities, including c4≥C4(cov), c5≥C5(cov),0<μ−≤min|σμ|,max|σμ|≤μ+, and every coupled threshold. The s=0 branch stores only the root certificate and Y0 and proves all solutions have |y|≤Y0; it never forms C1,C5 or a covering. mono takes new upper/lower bounds in the stated directions, positivity and the complete finite checks of all coupled inequalities, returning a certificate for the same E,K,ξ,cov. The raw computational input, the finite check, and the semantic inequalities deduced from a successful check must be separate. The partial ThueBoundParameters record and weakenC1Bound are supporting semantic data only. An s>0 empty-covering tag checks a complete covering transcript with M=∅ and derives thueSolutions g m=∅ from its soundness and covers field; it returns an empty answer before forming μ± or unit-dependent constants. The s>0 constants/search branch requires M.Nonempty.

EffectiveDiophantineMethods:ED.2/thue-certificate
Names: TauCeti.EffectiveDiophantine.ThueCertificate, TauCeti.EffectiveDiophantine.ThueCertificate.Valid, TauCeti.EffectiveDiophantine.ThueCertificate.solutions, TauCeti.EffectiveDiophantine.ThueCertificate.searchBound, TauCeti.EffectiveDiophantine.ThueCertificate.solutions_subset, thueCert_soundness_only, thueCert_totally_complex, thueCert_bad_box, thueCert_extra_pair, thueCert_compat
Reason: The actual raw covering/bound/reduction/search transcript type and its finite checker are not built; the former signatures expressed semantic validity.
Required mathematical signature: The finite representation is over a certified number-field presentation Q[T]/(G), with rational power-basis coordinates, integral-basis conversion matrices, an irreducibility certificate, labelled real/complex embeddings, and the actual algebraic root θ. Ideal, unit, root-isolation and logarithm data are outputs of the CN.0/CN.2/CN.4 suppliers already named by this packet. No new generic number-field algorithm is owned here. A raw transcript has no proof fields. All loops have explicit finite index sets or integer ranges; checking uses exact integer/rational arithmetic and modular exponentiation. Supplier soundness theorems identify a checked finite record with the actual field, ideals, roots, units and logarithms. This identification belongs to the soundness theorem and is not a Boolean comparison on R or an assumption that the claimed answer is complete. The covering transcript records the complete prime-ideal factorizations of the fixed norm ideal and of every p_i, finite bounded valuation vectors given by the full removing lemma, all ideal-class remainders, principal generators (or certified nonprincipality), torsion representatives and exactly Units.rank K independent units. It checks ideal products, norms, residue degrees, class-order relations, basis conversions and a complete-unit regulator/index certificate. The finite case index set is exactly the product of these bounded choices, modulo explicitly checked duplicates; an omitted combination rejects. Its soundness derives conditions (U),(M)/(C). A finite list with a proof field saying it covers all solutions is only the separate semantic covering, not this finite input. An initial-bound transcript records every logarithm/height enclosure, degree and nonvanishing input, the chosen Matveev/Yu source formula and all rounded rational constants; it verifies the finitely many rational inequalities of the DT.3/DT.4 bound derivation. A reduction transcript records successive nonnegative componentwise boxes, the exact real or p-adic form and its coefficient/residue identities, the raw ED.1 exclusion or complete enumeration data, and the exceptional exponent vectors. Each step is tagged with the applicable ED.1/ED.2 lemma and checks its complete finite numerical hypotheses. The theorem that all genuine solutions remain in the new box or exception set is derived from those checked records and the identified logarithms; it is never a proof field universally quantifying over the unknown solution set. ThueCertificate(E, certified K, ξ) is a tagged finite record. The no-real-root branch has a complete root isolation showing s=0, the certified Y0 threshold, a finite Cauchy-bounded search for each integer |y|≤Y0, and the exact accepted list. It forms no unit matrix or minimum over an empty real-root set. The nonempty-covering real-root branch has the complete covering, ThueConstants output, all (i0,μ) cases, explicit conjugate choices, Matveev constants, initial and reduction transcripts, Pethő bounds, and a search integer C≥Y2′. The root approximants are rationals enclosed within1/(6C²) of every real root. The transcript contains a finite Euclidean-algorithm trace for each rational approximant, ending at its exact finite continued fraction, and all signed nonzero divisors Z with Z^n|m. It checks every convergent with denominator≤C, every small-search pair and every exceptional exponent vector: exact power-basis arithmetic determines whether ±μ∏ε^a has the form x−yξ with integral x,y, and polynomial evaluation determines acceptance. All finite candidates, including nonsolutions, have an evaluated outcome; no unbounded convergent index or unbounded x,y search occurs. The listed Finset is exactly the union of accepted outputs. ThueCertificate.Valid c means c.check=true. Its solutions/searchBound projections are raw data, and solutions_subset/solutions_eq take the checked transcript and actual supplier-semantic identification, with irreducible deg(g)≥3,m≠0, ξ a root and [K:Q]=deg(g), and conclude L⊆/L=thueSolutions g m.  The named tests use these raw types and evaluate the entire checker, including invalid enclosures, wrong output pairs and missing nonsolution rows. The S={2} and S=∅ tests instantiate all finite branches and compute the exact lists; larger named examples require their complete replay data. Before applying Matveev, the finite logarithm list must delete certified zero terms or supply nonzero logarithms for every retained term, and certify the remaining linear form is nonzero; branch choices and the root-of-unity sign are explicit. An s>0 empty-covering tag checks a complete covering transcript with M=∅ and derives thueSolutions g m=∅ from its soundness and covers field; it returns an empty answer before forming μ± or unit-dependent constants. The s>0 constants/search branch requires M.Nonempty.

EffectiveDiophantineMethods:ED.2/thue-certified-solution-set
Names: TauCeti.EffectiveDiophantine.ThueCertificate.solutions_eq
Reason: The theorem is required over the actual omitted raw certificate; the surviving semantic implication has its own name.
Required mathematical signature: The finite representation is over a certified number-field presentation Q[T]/(G), with rational power-basis coordinates, integral-basis conversion matrices, an irreducibility certificate, labelled real/complex embeddings, and the actual algebraic root θ. Ideal, unit, root-isolation and logarithm data are outputs of the CN.0/CN.2/CN.4 suppliers already named by this packet. No new generic number-field algorithm is owned here. A raw transcript has no proof fields. All loops have explicit finite index sets or integer ranges; checking uses exact integer/rational arithmetic and modular exponentiation. Supplier soundness theorems identify a checked finite record with the actual field, ideals, roots, units and logarithms. This identification belongs to the soundness theorem and is not a Boolean comparison on R or an assumption that the claimed answer is complete. The covering transcript records the complete prime-ideal factorizations of the fixed norm ideal and of every p_i, finite bounded valuation vectors given by the full removing lemma, all ideal-class remainders, principal generators (or certified nonprincipality), torsion representatives and exactly Units.rank K independent units. It checks ideal products, norms, residue degrees, class-order relations, basis conversions and a complete-unit regulator/index certificate. The finite case index set is exactly the product of these bounded choices, modulo explicitly checked duplicates; an omitted combination rejects. Its soundness derives conditions (U),(M)/(C). A finite list with a proof field saying it covers all solutions is only the separate semantic covering, not this finite input. An initial-bound transcript records every logarithm/height enclosure, degree and nonvanishing input, the chosen Matveev/Yu source formula and all rounded rational constants; it verifies the finitely many rational inequalities of the DT.3/DT.4 bound derivation. A reduction transcript records successive nonnegative componentwise boxes, the exact real or p-adic form and its coefficient/residue identities, the raw ED.1 exclusion or complete enumeration data, and the exceptional exponent vectors. Each step is tagged with the applicable ED.1/ED.2 lemma and checks its complete finite numerical hypotheses. The theorem that all genuine solutions remain in the new box or exception set is derived from those checked records and the identified logarithms; it is never a proof field universally quantifying over the unknown solution set. ThueCertificate(E, certified K, ξ) is a tagged finite record. The no-real-root branch has a complete root isolation showing s=0, the certified Y0 threshold, a finite Cauchy-bounded search for each integer |y|≤Y0, and the exact accepted list. It forms no unit matrix or minimum over an empty real-root set. The nonempty-covering real-root branch has the complete covering, ThueConstants output, all (i0,μ) cases, explicit conjugate choices, Matveev constants, initial and reduction transcripts, Pethő bounds, and a search integer C≥Y2′. The root approximants are rationals enclosed within1/(6C²) of every real root. The transcript contains a finite Euclidean-algorithm trace for each rational approximant, ending at its exact finite continued fraction, and all signed nonzero divisors Z with Z^n|m. It checks every convergent with denominator≤C, every small-search pair and every exceptional exponent vector: exact power-basis arithmetic determines whether ±μ∏ε^a has the form x−yξ with integral x,y, and polynomial evaluation determines acceptance. All finite candidates, including nonsolutions, have an evaluated outcome; no unbounded convergent index or unbounded x,y search occurs. The listed Finset is exactly the union of accepted outputs. ThueCertificate.Valid c means c.check=true. Its solutions/searchBound projections are raw data, and solutions_subset/solutions_eq take the checked transcript and actual supplier-semantic identification, with irreducible deg(g)≥3,m≠0, ξ a root and [K:Q]=deg(g), and conclude L⊆/L=thueSolutions g m.  Before applying Matveev, the finite logarithm list must delete certified zero terms or supply nonzero logarithms for every retained term, and certify the remaining linear form is nonzero; branch choices and the root-of-unity sign are explicit. An s>0 empty-covering tag checks a complete covering transcript with M=∅ and derives thueSolutions g m=∅ from its soundness and covers field; it returns an empty answer before forming μ± or unit-dependent constants. The s>0 constants/search branch requires M.Nonempty.

EffectiveDiophantineMethods:ED.2/prime-ideal-removing-lemma
Names: TauCeti.EffectiveDiophantine.prime_ideal_removing
Reason: The correspondence between prime ideals, the factors over Q_p and normalized root valuations is not yet available as a faithful Lean carrier.
Required mathematical signature: For a primitive integral θ of degree n≥2 with K=Q(θ), a prime p, the complete monic irreducible factorization G=∏G_i over Q_p, corresponding prime ideals P_i⊂O_K, their e_i,f_i with deg(G_i)=e_i f_i, and the roots θ_i,k in an actual common finite extension of Q_p, normalize v_p(p)=1 and certify ord_{P_i}(x−yθ)=e_i v_p(x−yθ_i,k). For coprime x,y prove (i) for i≠j at most one v_i,v_j exceeds max(e_i,e_j)v_p(θ_i,k−θ_j,l); (ii) if e_i f_i>1, v_i≤e_i v_p(θ_i,k−θ_i,l) for all distinct k,l. Then with e=max e_i, at most one v_i>(e/2)v_p(disc G), and any such factor has e_i=f_i=1; if p does not divide disc G, any factor dividing x−yθ is the unique such degree-one unramified factor. For a normalized Thue–Mahler equation apply this to each p_i and the certified fixed-norm ideal factorization to enumerate finitely many (a,b,P_i) with (x−yθ)=a b∏P_i^u_i, absolute norm(a)=|f0^(n−1)c|, b supported above the p_i with every nonfree valuation bounded by the explicit pairwise/within-factor bounds, each free P_i of degree one, and u_i+v_{p_i}(norm b)=z_i after separating the fixed norm. Where no degree-one factor exists there is no free exponent. The output has completeness for every normalized solution, obtained from the valuation theorem, not supplied as a generic predicate. The present prime_ideal_removing_unramified signature gives only uniqueness in its squarefree-mod-p branch and does not stand for these conclusions.

EffectiveDiophantineMethods:ED.2/thue-mahler-s-unit-covering
Names: TauCeti.EffectiveDiophantine.ThueMahlerCovering.ofIdealFactorization
Reason: CN.2 certified ideal factorization/principal generator carriers are not yet built.
Required mathematical signature: For θ root of integralNormalization g, [K:Q]=deg g, normalized ThueMahlerEquation, verified primes above each p_i, complete valuations/divisor representatives, principal ideal generators, ideal class orders h_i and complete units, return the finite cases α,π,h,s,t with α and each active π nonzero, and covers. Class orders and degree-one factors determine when n_i is free; when no degree-one factor occurs use h_i=0,π_i=1,n_i=0. The current abstract unit-only helper is not this producer.

EffectiveDiophantineMethods:ED.2/thue-mahler-s-unit-covering
Names: tmCovering_missing_case
Reason: The specific principal-ideal factorization of the Case-III solution has not been replayed as certified finite ideal data.
Required mathematical signature: For the same explicitly ordered five cases as tmCovering_example_cases, with c=−1 and point(399,302), verify F(399,302)=−3^13·5^3 and its principal ideal has 5-part P52²P53 using the actual ideal generators and certified factorization. Delete exactly CaseIII, whose α=π53,π5=π52,t3=1,n3=2; prove the remaining four cases cannot represent that point, including either unit sign and every unit exponent. Thus the finite case-coverage checker rejects the shortened input before the solution-list comparison. A hypothesis already saying a solution has no representation, or merely a nonempty-list theorem, is not this test.

EffectiveDiophantineMethods:ED.2/thue-mahler-certificate
Names: TauCeti.EffectiveDiophantine.ThueMahlerCertificate, TauCeti.EffectiveDiophantine.ThueMahlerCertificate.Valid, TauCeti.EffectiveDiophantine.ThueMahlerCertificate.solutions, TauCeti.EffectiveDiophantine.ThueMahlerCertificate.solutions_subset, TauCeti.EffectiveDiophantine.ThueMahlerCertificate.residualBox, tmCert_listed_solution, tmCert_wrong_z, tmCert_unsieved_tuple, tmCert_no_primes, tmCert_compat
Reason: The actual raw covering/bound/reduction/search transcript type and its finite checker are not built; the former signatures expressed semantic validity.
Required mathematical signature: The finite representation is over a certified number-field presentation Q[T]/(G), with rational power-basis coordinates, integral-basis conversion matrices, an irreducibility certificate, labelled real/complex embeddings, and the actual algebraic root θ. Ideal, unit, root-isolation and logarithm data are outputs of the CN.0/CN.2/CN.4 suppliers already named by this packet. No new generic number-field algorithm is owned here. A raw transcript has no proof fields. All loops have explicit finite index sets or integer ranges; checking uses exact integer/rational arithmetic and modular exponentiation. Supplier soundness theorems identify a checked finite record with the actual field, ideals, roots, units and logarithms. This identification belongs to the soundness theorem and is not a Boolean comparison on R or an assumption that the claimed answer is complete. The covering transcript records the complete prime-ideal factorizations of the fixed norm ideal and of every p_i, finite bounded valuation vectors given by the full removing lemma, all ideal-class remainders, principal generators (or certified nonprincipality), torsion representatives and exactly Units.rank K independent units. It checks ideal products, norms, residue degrees, class-order relations, basis conversions and a complete-unit regulator/index certificate. The finite case index set is exactly the product of these bounded choices, modulo explicitly checked duplicates; an omitted combination rejects. Its soundness derives conditions (U),(M)/(C). A finite list with a proof field saying it covers all solutions is only the separate semantic covering, not this finite input. An initial-bound transcript records every logarithm/height enclosure, degree and nonvanishing input, the chosen Matveev/Yu source formula and all rounded rational constants; it verifies the finitely many rational inequalities of the DT.3/DT.4 bound derivation. A reduction transcript records successive nonnegative componentwise boxes, the exact real or p-adic form and its coefficient/residue identities, the raw ED.1 exclusion or complete enumeration data, and the exceptional exponent vectors. Each step is tagged with the applicable ED.1/ED.2 lemma and checks its complete finite numerical hypotheses. The theorem that all genuine solutions remain in the new box or exception set is derived from those checked records and the identified logarithms; it is never a proof field universally quantifying over the unknown solution set. ThueMahlerCertificate(E, certified K, θ) records the complete finite covering, all initial/reduction transcripts, final componentwise bounds N_i,A, the exact finite exception set, and labelled auxiliary-prime factorization/residue data. Residual rows are indexed by every (case,sign,n,a) in [0,N_1]×…×[0,N_v]×[-A,A]^r and by every exception tuple. A row either names a checked violated sieve congruence or contains the exact power-basis evaluation of ±α∏ε^a∏π^n. Coordinates outside span{1,θ}, nonintegral coefficients, f0∤x, failed coprimality, or failed F(x/f0,y)=c∏p_i^z_i are explicit rejecting outcomes for that row, where z_i=n_i h_i+s_i+t_i. Every bounded row must be covered even when it cannot be a solution; omitting such a row rejects the transcript. Duplicate accepted outputs are removed by Finset equality, and the claimed L is exactly the accepted set. ThueMahlerCertificate.Valid c means c.check=true. Its solutions/residualBox projections are raw finite data; solutions_subset/solutions_eq derive L⊆/L=thueMahlerSolutions from the actual normalized equation, θ a root of integralNormalization(g), [K:Q]=deg(g), checked supplier semantics and the initial/reduction/coverage soundness theorems.  The named tests use these raw types and evaluate the entire checker, including invalid enclosures, wrong output pairs and missing nonsolution rows. The S={2} and S=∅ tests instantiate all finite branches and compute the exact lists; larger named examples require their complete replay data. Before applying Matveev, the finite logarithm list must delete certified zero terms or supply nonzero logarithms for every retained term, and certify the remaining linear form is nonzero; branch choices and the root-of-unity sign are explicit.

EffectiveDiophantineMethods:ED.2/thue-mahler-certified-solution-set
Names: TauCeti.EffectiveDiophantine.ThueMahlerCertificate.solutions_eq
Reason: The theorem is required over the actual omitted raw certificate; the surviving semantic implication has its own name.
Required mathematical signature: The finite representation is over a certified number-field presentation Q[T]/(G), with rational power-basis coordinates, integral-basis conversion matrices, an irreducibility certificate, labelled real/complex embeddings, and the actual algebraic root θ. Ideal, unit, root-isolation and logarithm data are outputs of the CN.0/CN.2/CN.4 suppliers already named by this packet. No new generic number-field algorithm is owned here. A raw transcript has no proof fields. All loops have explicit finite index sets or integer ranges; checking uses exact integer/rational arithmetic and modular exponentiation. Supplier soundness theorems identify a checked finite record with the actual field, ideals, roots, units and logarithms. This identification belongs to the soundness theorem and is not a Boolean comparison on R or an assumption that the claimed answer is complete. The covering transcript records the complete prime-ideal factorizations of the fixed norm ideal and of every p_i, finite bounded valuation vectors given by the full removing lemma, all ideal-class remainders, principal generators (or certified nonprincipality), torsion representatives and exactly Units.rank K independent units. It checks ideal products, norms, residue degrees, class-order relations, basis conversions and a complete-unit regulator/index certificate. The finite case index set is exactly the product of these bounded choices, modulo explicitly checked duplicates; an omitted combination rejects. Its soundness derives conditions (U),(M)/(C). A finite list with a proof field saying it covers all solutions is only the separate semantic covering, not this finite input. An initial-bound transcript records every logarithm/height enclosure, degree and nonvanishing input, the chosen Matveev/Yu source formula and all rounded rational constants; it verifies the finitely many rational inequalities of the DT.3/DT.4 bound derivation. A reduction transcript records successive nonnegative componentwise boxes, the exact real or p-adic form and its coefficient/residue identities, the raw ED.1 exclusion or complete enumeration data, and the exceptional exponent vectors. Each step is tagged with the applicable ED.1/ED.2 lemma and checks its complete finite numerical hypotheses. The theorem that all genuine solutions remain in the new box or exception set is derived from those checked records and the identified logarithms; it is never a proof field universally quantifying over the unknown solution set. ThueMahlerCertificate(E, certified K, θ) records the complete finite covering, all initial/reduction transcripts, final componentwise bounds N_i,A, the exact finite exception set, and labelled auxiliary-prime factorization/residue data. Residual rows are indexed by every (case,sign,n,a) in [0,N_1]×…×[0,N_v]×[-A,A]^r and by every exception tuple. A row either names a checked violated sieve congruence or contains the exact power-basis evaluation of ±α∏ε^a∏π^n. Coordinates outside span{1,θ}, nonintegral coefficients, f0∤x, failed coprimality, or failed F(x/f0,y)=c∏p_i^z_i are explicit rejecting outcomes for that row, where z_i=n_i h_i+s_i+t_i. Every bounded row must be covered even when it cannot be a solution; omitting such a row rejects the transcript. Duplicate accepted outputs are removed by Finset equality, and the claimed L is exactly the accepted set. ThueMahlerCertificate.Valid c means c.check=true. Its solutions/residualBox projections are raw finite data; solutions_subset/solutions_eq derive L⊆/L=thueMahlerSolutions from the actual normalized equation, θ a root of integralNormalization(g), [K:Q]=deg(g), checked supplier semantics and the initial/reduction/coverage soundness theorems.  Before applying Matveev, the finite logarithm list must delete certified zero terms or supply nonzero logarithms for every retained term, and certify the remaining linear form is nonzero; branch choices and the root-of-unity sign are explicit.

EffectiveDiophantineMethods:ED.2/s-unit-certificate
Names: TauCeti.EffectiveDiophantine.SUnitCertificate, TauCeti.EffectiveDiophantine.SUnitCertificate.Valid, TauCeti.EffectiveDiophantine.SUnitCertificate.solutions, TauCeti.EffectiveDiophantine.SUnitCertificate.finalBound, TauCeti.EffectiveDiophantine.SUnitCertificate.solutions_subset, sUnitCert_two, sUnitCert_empty, sUnitCert_missing, sUnitCert_compat
Reason: The actual raw covering/bound/reduction/search transcript type and its finite checker are not built; the former signatures expressed semantic validity.
Required mathematical signature: An initial-bound transcript records every logarithm/height enclosure, degree and nonvanishing input, the chosen Matveev/Yu source formula and all rounded rational constants; it verifies the finitely many rational inequalities of the DT.3/DT.4 bound derivation. A reduction transcript records successive nonnegative componentwise boxes, the exact real or p-adic form and its coefficient/residue identities, the raw ED.1 exclusion or complete enumeration data, and the exceptional exponent vectors. Each step is tagged with the applicable ED.1/ED.2 lemma and checks its complete finite numerical hypotheses. The theorem that all genuine solutions remain in the new box or exception set is derived from those checked records and the identified logarithms; it is never a proof field universally quantifying over the unknown solution set. SUnitCertificate(S) records the increasing list of distinct primes, certified Yu/logarithm initial-bound data (or the proved |S|≤1 branch), successive per-prime boxes and tagged raw p-adic reduction/enumeration steps, all exceptions, the final bounds f(p), and L. Its final search domain is exactly {±1}×∏_{p∈S}[-f(p),f(p)]. For every sign/exponent tuple, including nonsolutions, it computes x=±∏p^a and y=1−x as reduced rationals, rejects y=0, and strips the primes of S from the absolute numerator and positive denominator of y to certify that both remainders are1. Each exceptional exponent box is enumerated in the same way. All rows are present exactly once in a fixed enumeration, and L is exactly their accepted pairs. Valid c means c.check=true; solutions/finalBound are finite projections, and solutions_subset/solutions_eq take the checked raw record and certified logarithm semantics and conclude L⊆/L=sUnitSolutions S. A quantified real-log inequality or a proof that every true solution was tested is not a checker input.  The named tests use these raw types and evaluate the entire checker, including invalid enclosures, wrong output pairs and missing nonsolution rows. The S={2} and S=∅ tests instantiate all finite branches and compute the exact lists; larger named examples require their complete replay data.

EffectiveDiophantineMethods:ED.2/s-unit-certified-solution-set
Names: TauCeti.EffectiveDiophantine.SUnitCertificate.solutions_eq
Reason: The theorem is required over the actual omitted raw certificate; the surviving semantic implication has its own name.
Required mathematical signature: An initial-bound transcript records every logarithm/height enclosure, degree and nonvanishing input, the chosen Matveev/Yu source formula and all rounded rational constants; it verifies the finitely many rational inequalities of the DT.3/DT.4 bound derivation. A reduction transcript records successive nonnegative componentwise boxes, the exact real or p-adic form and its coefficient/residue identities, the raw ED.1 exclusion or complete enumeration data, and the exceptional exponent vectors. Each step is tagged with the applicable ED.1/ED.2 lemma and checks its complete finite numerical hypotheses. The theorem that all genuine solutions remain in the new box or exception set is derived from those checked records and the identified logarithms; it is never a proof field universally quantifying over the unknown solution set. SUnitCertificate(S) records the increasing list of distinct primes, certified Yu/logarithm initial-bound data (or the proved |S|≤1 branch), successive per-prime boxes and tagged raw p-adic reduction/enumeration steps, all exceptions, the final bounds f(p), and L. Its final search domain is exactly {±1}×∏_{p∈S}[-f(p),f(p)]. For every sign/exponent tuple, including nonsolutions, it computes x=±∏p^a and y=1−x as reduced rationals, rejects y=0, and strips the primes of S from the absolute numerator and positive denominator of y to certify that both remainders are1. Each exceptional exponent box is enumerated in the same way. All rows are present exactly once in a fixed enumeration, and L is exactly their accepted pairs. Valid c means c.check=true; solutions/finalBound are finite projections, and solutions_subset/solutions_eq take the checked raw record and certified logarithm semantics and conclude L⊆/L=sUnitSolutions S. A quantified real-log inequality or a proof that every true solution was tested is not a checker input. 

EffectiveDiophantineMethods:ED.3/local-descent-image
Names: certifiedLocalImage_real_three_roots, certifiedLocalImage_odd_good_prime
Reason: The finite local-factor factory and actual point evaluations have not been constructed.
Required mathematical signature: For W=y²=x³−x over R or Q_p, derive the decomposition of W.A, valuation parity and residue-unit square coordinates, construct W.M≃(Z/2)^n, lift each certified rational abscissa to a W.Point using real sign or p-adic Hensel certificates, evaluate actual W.μ, and prove the expected image cardinality using W.μ kernel and local quotient count. The abstract tests with hidx/hcard are only cardinality algebra.

EffectiveDiophantineMethods:ED.3/two-selmer-certificate
Names: twoSelmer_x3_minus_x.factory, twoSelmer_no_places.factory, twoSelmer_x3_minus_x, twoSelmer_no_places, twoSelmer_eq_tauceti
Reason: The abstract basis-length examples compute cardinality only after the desired basis length is supplied; the actual descent/local factor factory has not been replayed.
Required mathematical signature: For the actual curve W:y²=x³−x over Q, factor its étale cubic Q³, compute square classes at2 and infinity, apply the pinned μ with all exceptional points, form actual norm and local restriction matrices, and row-reduce to a two-dimensional Selmer kernel. Independently compute the four-dimensional unconditioned norm kernel. Return concrete certificates and prove their pass/cardinality results without input basis-length hypotheses. For the compatibility regression, identify every abstract carrier and map in the certificate with the actual pinned W.A, W.M, normM, local μ and localRes for the given rational Weierstrass curve W in characteristic-not-two normal form, with W.IsElliptic, W.IsCharNeTwoNF and S containing the actual bad primes. Prove C.selmer equals the actual W.selmerGroup₂ for the ring of integers of Q and the one-member real archimedean family: this is the subgroup of W.M cut out by normM.ker, every finite-completion localCondition and the real localCondition. Use certified complete local images at S and infinity, the actual outside-S good-place theorem and the local-to-global unramified comparison. A freely supplied subgroup sel together with its defining membership equivalence is only the supporting intersection lemma. The x³−x test must additionally identify the four classes with the image of the actual rational two-torsion points O,(0,0),(1,0),(−1,0). Transport any concrete Q_p coordinates through the isomorphism with the corresponding finite adic completion before comparing the local maps.

EffectiveDiophantineMethods:ED.3/two-selmer-certificate
Names: twoSelmer_not_image
Reason: The actual 571a1 descent, local-image and global norm-kernel certificate has not been replayed; an abstract assumed-cardinality inequality is only supporting algebra.
Required mathematical signature: For Cremona 571a1 W₀=[0,−1,1,−929,−10595], transport rational points by (x,y)↦(4x,8y+4) to W:y²=x³−4x²−14864x−678064. On this actual normal-form curve construct the cubic square classes, norm and local restriction matrices, complete local images and finite Selmer certificate; certify #W.μ.range=1 and #Sel₂(W)=4, hence W.μ.range≠Sel₂(W), without input image cardinality, basis length or non-equality. The original model is Cremona ecdata row571a1; the n₁=1,n₂=4 claim is Cremona III §3.6 p.91.

EffectiveDiophantineMethods:ED.3/explicit-height-difference-bound
Names: TauCeti.EffectiveDiophantine.ED3.silvermanMu, canonicalHeight_sub_half_naiveHeight_mem.numberField
Reason: The primary source is now independently verified; the weighted number-field height API has not yet been represented on the actual pinned carrier in Lean.
Required mathematical signature: Let d=[K:Q] and h∞(t)=d⁻¹ Σ(v archimedean) n_v log max(1,|t|_v), with n_v=[K_v:R]. For an integral nonsingular standard Weierstrass equation W/K put μ_S=h_abs(Δ)/12+h∞(j)/12+h∞(b₂/12)/2+log(2*)/2, where 2*=1 if b₂=0 and 2 otherwise. Define silvermanMu on this W and prove, for P in W.toAffine.Point including O, −h_abs(j)/24−μ_S−973/1000 ≤ P.canonicalHeight/d−P.naiveHeight/(2*d) ≤ μ_S+107/100. Both pinned heights are relative logarithmic heights; d converts them to the absolute heights of Silverman Theorem1.1. Unit-test b₂=0, K=Q and field-extension compatibility (local weights sum correctly).

EffectiveDiophantineMethods:ED.4/good-reduction-chabauty-datum
Names: TauCeti.EffectiveDiophantine.ED4.GoodReductionChabautyDatum.geometricFactory, TauCeti.EffectiveDiophantine.ED4.GoodReductionChabautyDatum.toGoodReductionPair, datum_residueDisc_eq_tube, TauCeti.EffectiveDiophantine.ED4.GoodReductionChabautyDatum, GoodReductionChabautyDatum.red, GoodReductionChabautyDatum.red_surjective, GoodReductionChabautyDatum.residueDisc, GoodReductionChabautyDatum.localParam_bijOn, GoodReductionChabautyDatum.redJ_comp_abelJacobi, GoodReductionChabautyDatum.toGoodReductionPair
Reason: The smooth proper curve, relative Jacobian, analytic tubes and Coleman supplier carriers have not been identified.
Required mathematical signature: For actual X/Q smooth proper geometrically integral, genus g≥1, O∈X(Q) and smooth proper model over Z_p, construct point reduction, all special-fibre points, full formal disc charts, the geometric Abel–Jacobi morphism, its differential pullback isomorphism and completion at O, and return the ColemanIntegration good-reduction pair. Abstract ReductionDiscData and baseResidueDisc support set-theoretic disc partitioning only; a pair Xt×Set X is not the supplier model. All listed GoodReductionChabautyDatum APIs use this same actual geometric carrier. ReductionDiscData.red/residueDisc/param are only supporting set/group data. Its genus-one finite-field test has four special-fibre points; analytic chart construction is omitted.

EffectiveDiophantineMethods:ED.4/abelian-logarithm
Names: TauCeti.EffectiveDiophantine.ED4.abelianLog, TauCeti.EffectiveDiophantine.ED4.abelianLog_eq_formalLog, TauCeti.EffectiveDiophantine.ED4.abelianLog_nsmul, TauCeti.EffectiveDiophantine.ED4.ker_abelianLog, TauCeti.EffectiveDiophantine.ED4.abelianLog_map, TauCeti.EffectiveDiophantine.ED4.abelianLog_baseChange, TauCeti.EffectiveDiophantine.ED4.integrationPairing, TauCeti.EffectiveDiophantine.ED4.integrationPairing_eq_zero_iff, TauCeti.EffectiveDiophantine.ED4.abelianLog_unique, TauCeti.EffectiveDiophantine.ED4.abelianLog_elliptic, TauCeti.EffectiveDiophantine.ED4.abelianLog_torsion, TauCeti.EffectiveDiophantine.ED4.abelianLog_E11_five_torsion, TauCeti.EffectiveDiophantine.ED4.abelianLog_C05_kernel_point, TauCeti.EffectiveDiophantine.ED4.integrationPairing_leftKernel
Reason: Actual abelian-variety/Néron-formal-group, regular-differential, curve/divisor or Coleman-cohomology carriers have not been identified. Separately renamed abstract helpers do not realize these geometric signatures.
Required mathematical signature: Let K be a finite extension of ℚ_p with ring of integers O_K, residue field k and ramification index e, and A an abelian variety of dimension g over K. Write Lie(A) for its tangent space at 0 (a K-vector space of dimension g) and Ω_A := H⁰(A, Ω¹) for its space of regular 1-forms, which are the translation-invariant forms; evaluation at 0 identifies Ω_A with the dual Module.Dual K Lie(A). The abelian logarithm log_A : A(K) → Lie(A) is the unique group homomorphism that agrees with the formal logarithm on some open subgroup, constructed as follows. Let 𝒜 be the Néron model of A over O_K (an abelian scheme when A has good reduction), F̂ its formal group, the completion of 𝒜 along the zero section, a g-dimensional commutative formal Lie group over O_K once formal parameters s = (s₁, …, s_g) are chosen, and A¹(K) := ker(𝒜(O_K) → 𝒜(k)) = F̂(m_K). Let log_F̂ ∈ (K[[s]])^g be the formal logarithm, the unique homomorphism of formal groups F̂ → Ĝ_a^g over K whose linear term is the identity; its coordinates are the formal primitives of a basis of invariant differentials and converge on m_K^g. Put N := #𝒜(k) = [A(K) : A¹(K)] and log_A(x) := N⁻¹ log_F̂(s(N x)), identifying K^g with Lie(A) by ds at 0. The integration pairing is ⟨x, ω⟩ := ω(log_A x) ∈ K for x ∈ A(K), ω ∈ Ω_A. Properties: (a) log_A is a homomorphism, independent of the choices of formal parameters and of N among multiples of the exponent of 𝒜(k); (b) ker log_A = A(K)_tors, which is finite; (c) log_A is continuous, its differential at 0 is the identity, and for n > e/(p − 1) it maps the subgroup F̂(m_K^n) isomorphically onto the lattice (m_K^n)^g; (d) for a homomorphism φ : A → B of abelian varieties over K, log_B ∘ φ = dφ ∘ log_A, i.e. ⟨φ(x), ω⟩ = ⟨x, φ*ω⟩; for a finite extension K'/K, log_{A_{K'}} restricts to log_A on A(K); (e) the pairing A(K) × Ω_A → K is ℤ-bilinear and K-linear in ω, its kernel in Ω_A, {ω : ⟨x, ω⟩ = 0 ∀x}, is 0 and its kernel in A(K) is A(K)_tors; for each ω, x ↦ ⟨x, ω⟩ is the unique locally analytic homomorphism A(K) → K whose differential at 0 is ω. The compatible logarithms over finite K'/K first define log_A on A(ℚ̄_p). Over ℂ_p use the analytic logarithm of the ℂ_p-Lie group, extending this map continuously; the union over finite extensions alone does not define it on all A(ℂ_p) (KRZB Definition 3.8 and Proposition 3.16). Hypotheses: K finite over ℚ_p; A an abelian variety over K. Good reduction is not assumed; when A has good reduction 𝒜 is the abelian scheme extending A and 𝒜(k) is the group of points of its special fibre. Normalisation: Lie(A) = T₀A and the pairing is evaluation of an invariant differential on a tangent vector; no sign or scaling is inserted. Original API contracts: abelianLog: log_A : A(K) →+ Lie(A). abelianLog_eq_formalLog: On A¹(K) = F̂(m_K), log_A(x) = log_F̂(s(x)) for any choice of formal parameters s. abelianLog_nsmul: log_A(n • x) = n • log_A(x) for n ∈ ℤ. ker_abelianLog: log_A x = 0 ↔ x has finite order; A(K)_tors is finite. abelianLog_map: log_B(φ x) = dφ(log_A x) for a homomorphism φ : A → B; log_{id} = id and log respects composition. abelianLog_baseChange: For K'/K finite, log_{A_{K'}}(x) = log_A(x) ⊗ 1 for x ∈ A(K). integrationPairing: ⟨x, ω⟩ := ω(log_A x) for x ∈ A(K), ω ∈ Ω_A = Module.Dual K Lie(A). integrationPairing_eq_zero_iff: ⟨x, ω⟩ = 0 for all ω iff x is torsion; ⟨x, ω⟩ = 0 for all x iff ω = 0. abelianLog_unique: A continuous homomorphism λ : A(K) → Lie(A) that agrees with log_F̂ on some open subgroup equals log_A. Original geometric regressions: abelianLog_elliptic: For an elliptic curve E over ℚ_p with good reduction and minimal Weierstrass model, log_E on E¹(ℚ_p) is the formal-group logarithm of the Weierstrass formal group in the parameter z = −x/y (dimension one, the case of Mathlib's FormalGroup). abelianLog_torsion: log_A(x) = 0 for every torsion point x; for dim A = 0 the logarithm is the zero map to the zero space. abelianLog_E11_five_torsion: For E : y² + y = x³ − x² over ℚ_5 the point (0, 0) has order 5, so log_E(0, 0) = 0: log_A is not injective, and a definition requiring an inverse exponential on all of A(K) is wrong. abelianLog_C05_kernel_point: For the Jacobian of y² = x⁶ + 8x⁵ + 22x⁴ + 22x³ + 5x² + 6x + 1 over ℚ_3, D' = [(0, −1) + (−3, 1) − ∞⁺ − ∞⁻] lies in J¹(ℚ_3) with Flynn's local parameters (s₁, s₂) = (−9/14, 426/49), and its formal logarithm is ≡ (36, 3) (mod 3⁴) (Flynn–Poonen–Schaefer p.22). integrationPairing_leftKernel: If ω ∈ Ω_A satisfies ⟨x, ω⟩ = 0 for all x ∈ A(K), then ω = 0.

EffectiveDiophantineMethods:ED.4/abelian-integral
Names: TauCeti.EffectiveDiophantine.ED4.abelianIntegral, TauCeti.EffectiveDiophantine.ED4.abelJacobi_pullback_bijective, TauCeti.EffectiveDiophantine.ED4.abelianIntegral_add, TauCeti.EffectiveDiophantine.ED4.abelianIntegral_eq_zero_iff, TauCeti.EffectiveDiophantine.ED4.abelianIntegral_map, TauCeti.EffectiveDiophantine.ED4.abelianIntegral_trace, TauCeti.EffectiveDiophantine.ED4.abelianIntegral_baseChange, TauCeti.EffectiveDiophantine.ED4.pullback_basepoint_independent, TauCeti.EffectiveDiophantine.ED4.abelianIntegral_C05_tiny, TauCeti.EffectiveDiophantine.ED4.abelianIntegral_self, TauCeti.EffectiveDiophantine.ED4.abelianIntegral_weierstrass_half, TauCeti.EffectiveDiophantine.ED4.abelianIntegral_genusOne, TauCeti.EffectiveDiophantine.ED4.abelianIntegral_torsion_nonexample
Reason: Actual abelian-variety/Néron-formal-group, regular-differential, curve/divisor or Coleman-cohomology carriers have not been identified. Separately renamed abstract helpers do not realize these geometric signatures.
Required mathematical signature: Let K be a finite extension of ℚ_p, X a smooth projective geometrically integral curve of genus g ≥ 1 over K and J its Jacobian. For any O ∈ X(K) the pullback ι_O* : H⁰(J, Ω¹) → H⁰(X, Ω¹) along ι_O(P) = [P − O] is an isomorphism of K-vector spaces that does not depend on O; for ω ∈ H⁰(X, Ω¹) write ω_J for the invariant form with ι_O*ω_J = ω. For a degree-zero divisor D = Σ n_i P_i on X_K̄ that is Gal(K̄/K)-stable, define ∫_D ω := ⟨[D], ω_J⟩ (pairing of ED.4/abelian-logarithm on J(K)), and for Q, Q' ∈ X(K) put ∫_Q^{Q'} ω := ∫_{Q' − Q} ω = ⟨ι_O(Q') − ι_O(Q), ω_J⟩. The continuous analytic abelian logarithm over ℂ_p defines the same formulas on X(ℂ_p); finite-extension formulas give only its restriction to algebraic points. Properties: (i) K-linear in ω and additive in D; ∫_Q^{Q'} + ∫_{Q'}^{Q''} = ∫_Q^{Q''}; (ii) ∫_D ω = 0 whenever [D] is torsion in J(K), in particular when D is principal, and conversely if ∫_D ω = 0 for all ω then [D] is torsion; (iii) η_{ω,O}(P) := ∫_O^P ω = ⟨ι_O(P), ω_J⟩, and changing O adds a constant; (iv) change of variables: for a nonconstant morphism ρ : X → Y of such curves over K and ω ∈ H⁰(Y, Ω¹), ∫_D ρ*ω = ∫_{ρ_*D} ω; (v) trace: for ρ finite and E a degree-zero divisor on Y, ∫_{ρ*E} ω = ∫_E Tr_ρ ω, where Tr_ρ : H⁰(X, Ω¹) → H⁰(Y, Ω¹) is the trace; (vi) base change: ∫ is compatible with finite extensions K'/K. Hypotheses: K finite over ℚ_p; X smooth projective geometrically integral of genus g ≥ 1 over K. The definition uses only the abelian logarithm of J; no reduction hypothesis is made. When X has good reduction this integral equals the Coleman integral (ED.4/coleman-abelian-comparison). Original API contracts: abelianIntegral: ∫_D ω := ⟨[D], ω_J⟩ for a Galois-stable degree-zero divisor D and ω ∈ H⁰(X, Ω¹). abelJacobi_pullback_bijective: ι_O* : H⁰(J, Ω¹) → H⁰(X, Ω¹) is bijective and independent of O. abelianIntegral_add: ∫_{D+D'} ω = ∫_D ω + ∫_{D'} ω and ∫_D (aω + bω') = a∫_D ω + b∫_D ω'. abelianIntegral_eq_zero_iff: ∫_D ω = 0 for all ω iff [D] is torsion in J; in particular ∫_{div f} ω = 0. abelianIntegral_map: ∫_D ρ*ω = ∫_{ρ_*D} ω for a morphism ρ : X → Y. abelianIntegral_trace: ∫_{ρ*E} ω = ∫_E Tr_ρ ω for ρ finite and E of degree zero on Y. abelianIntegral_baseChange: Compatible with finite extensions K'/K. TauCeti.EffectiveDiophantine.ED4.pullback_basepoint_independent: For two actual base points O,O′ of X, the pullback maps H⁰(J,Ω¹)→H⁰(X,Ω¹) along their geometric Abel–Jacobi morphisms agree. Original geometric regressions: abelianIntegral_C05_tiny: On y² = x⁶ + 8x⁵ + 22x⁴ + 22x³ + 5x² + 6x + 1 over ℚ_3: ∫_{(0,1)}^{(−3,1)} dx/y ≡ 2·3 + 3⁴ (mod 3⁵) and ∫_{(0,1)}^{(−3,1)} x dx/y ≡ 2·3² + 2·3³ (mod 3⁵). abelianIntegral_self: ∫_Q^Q ω = 0 and ∫_D 0 = 0. abelianIntegral_weierstrass_half: On y² = x⁶ − 2x⁴ + 2x³ + 5x² + 2x + 1 over ℚ_3 let W be the Weierstrass point with x(W) ≡ 1 (mod 3), S^± = (1, ±3); then 2W ∼ S⁺ + S⁻, so 2∫_{S⁻}^{W} ω = ∫_{S⁻}^{S⁺} ω for every regular ω. abelianIntegral_genusOne: For X = E an elliptic curve and O its origin, ι_O is the identity of E = J and ∫_O^P ω = ⟨P, ω⟩ is the elliptic logarithm paired with ω. abelianIntegral_torsion_nonexample: For E : y² + y = x³ − x² over ℚ_5, ∫_O^{(0,0)} ω = 0 for every ω although (0, 0) ≠ O: the integral sees divisor classes modulo torsion, not points.

EffectiveDiophantineMethods:ED.4/tiny-integral-expansion
Names: TauCeti.EffectiveDiophantine.ED4.abelianIntegral_eq_primitive
Reason: The actual regular differential, geometric Abel–Jacobi and convergent formal disc supplier identifications are missing; the earlier abstract primitive statement was false.
Required mathematical signature: For a genuine smooth proper curve over K with good reduction, integral regular differential ω and a formal parameter t on one full residue disc, construct the integral coefficient series w(t), its convergent formal primitive I, and derive ∫_Q^Q′ω=I(t(Q′))−I(t(Q)) for points in that disc over finite extensions. Obtain this from the differential pullback of the actual Abel–Jacobi morphism and its completed formal group; do not assume the equality as a field.

EffectiveDiophantineMethods:ED.4/kernel-of-reduction-evaluation
Names: TauCeti.EffectiveDiophantine.ED4.integrationPairing_eq_sum_tiny
Reason: Actual effective-divisor/Picard, smooth-model specialization, regular-differential and finite-extension integration carriers are unavailable.
Required mathematical signature: Let (X, O, p, 𝒳) be a good-reduction Chabauty datum of genus g, and P' ∈ X(ℚ_p) whose reduction x̃' satisfies dim H⁰(X̃, O(g·x̃')) = 1 (x̃' is not a Weierstrass point of X̃). Then every D ∈ J¹(ℚ_p) = ker(red_J) is uniquely represented as D = [Q₁ + ⋯ + Q_g − g·P'] with Q₁ + ⋯ + Q_g an effective divisor defined over ℚ_p (a Galois-stable geometric multiset, allowing repeated points) whose points Q_j ∈ X(ℚ̄_p) all reduce to x̃'. Independently of the Weierstrass hypothesis, whenever D = [Q₁ + ⋯ + Q_g − g·P'] with all Q_j in the residue disc of x̃', and ω ∈ H⁰(X_{ℚ_p}, Ω¹) has expansion w(t) dt at x̃' in a parameter t with t(P') = 0, and λ := primitive(w) = Σ_{n ≥ 1} λ_n t^n, then ⟨D, ω_J⟩ = Σ_j λ(t(Q_j)) = Σ_{n ≥ 1} λ_n s_n, where s_n = Σ_j t(Q_j)^n ∈ ℚ_p are the power sums of the roots of ∏_j (T − t(Q_j)) ∈ ℚ_p[T], computed from its coefficients by Newton's identities. In particular ⟨D, ω_J⟩ is computable to any p-adic precision from an effective representative of D + g·P'. Equivalently write E=Σ_x m_x[x] over closed points of X_{ℚ_p}: Σ_x m_x[κ(x):ℚ_p]=g and the value is Σ_x m_x Tr_{κ(x)/ℚ_p}(λ(t(x))). The representative is unique as an effective divisor, not as an ordering of geometric points. The characteristic polynomial and trace include every multiplicity. Hypotheses: Good-reduction datum; x̃' not a Weierstrass point of X̃ (h⁰(g x̃') = 1). For g = 1 every point qualifies and the statement is the formal-group description of E¹.

EffectiveDiophantineMethods:ED.4/coleman-abelian-comparison
Names: TauCeti.EffectiveDiophantine.ED4.colemanIntegral_eq_abelianIntegral
Reason: Actual abelian-variety/Néron-formal-group, regular-differential, curve/divisor or Coleman-cohomology carriers have not been identified. Separately renamed abstract helpers do not realize these geometric signatures.
Required mathematical signature: Let K be a finite extension of ℚ_p with residue field 𝔽_q, (𝒳, D) a good-reduction pair over O_K (ColemanIntegration:L1/good-reduction-pair) with generic fibre X of genus g ≥ 1, Y = 𝒳 − D, a ∈ ℂ_p a branch of the logarithm and (φ, ω•, M, g•) a Frobenius-structured datum on (𝒳, D) (L1/good-reduction-datum-exists). For every ω ∈ H⁰(X, Ω¹) ⊂ Ω⁺(Y) and all x, y ∈ ]Y_k[(ℂ_p), the Coleman integral of ColemanIntegration:L1/coleman-integral equals the abelian integral: ∫^{Col}_x^y ω = ∫_x^y ω = ⟨[y − x], ω_J⟩ (ED.4/abelian-integral over ℂ_p). Consequently the Coleman integral of a regular differential does not depend on the branch a or on the Frobenius lift, extends to all of X(ℂ_p), takes values in K' on points of X(K') for K' ⊆ ℂ_p finite over K, and vanishes on every degree-zero divisor whose class is torsion. Hypotheses: (𝒳, D) a good-reduction pair over O_K, K finite over ℚ_p; ω a regular differential on the proper curve X (not merely on Y). The Frobenius-structured datum exists by ColemanIntegration:L1/good-reduction-datum-exists; its Frobenius matrix M has characteristic polynomial P_Y ∈ K[t] whose roots are Weil q-numbers of weights 1 and 2. Original API contracts:  Original geometric regressions:  Derive local primitive equality and Frobenius compatibility from the actual Coleman/cohomology suppliers and the Weil polynomial; a function supplied with the desired identities is only supporting algebra.

EffectiveDiophantineMethods:ED.4/padic-closure-dimension
Names: TauCeti.EffectiveDiophantine.ED4.dim_padicClosure_le_rank
Reason: Actual abelian variety point topology, continuous geometric logarithm and p-adic Lie subgroup carriers are unavailable.
Required mathematical signature: Let A be an abelian variety of dimension g over ℚ, p a prime, Γ ⊆ A(ℚ) ⊆ A(ℚ_p) a finitely generated subgroup of rank r and Γ̄ its closure in A(ℚ_p). Then (a) log_A(Γ̄) = ℤ_p·log_A(Γ) inside Lie(A_{ℚ_p}) ≅ ℚ_p^g; (b) the p-adic Lie subgroup Γ̄ has dimension r₀ := rank_{ℤ_p} ℤ_p·log_A(Γ) = dim_{ℚ_p} ℚ_p·log_A(Γ), and r₀ ≤ min(r, g); (c) if G ⊆ Γ has finite index then ℚ_p·log_A(G) = ℚ_p·log_A(Γ) and Ḡ has finite index in Γ̄; if moreover [Γ : G] is prime to p·#Ã(𝔽_p) for a prime p of good reduction, then Ḡ = Γ̄. Inequality r₀ < r can occur, and r₀ ≤ g always. Hypotheses: A abelian variety over ℚ (in ED.4, the Jacobian J of X); Γ finitely generated (Mordell–Weil theorem for Γ = J(ℚ), requested from HeightsRationalPointsAndObstructions:RP.1). Closure is taken in the natural p-adic analytic topology on A(ℚ_p); the logarithm is the continuous geometric abelian logarithm, a local analytic isomorphism with finite torsion kernel. In the last clause A has good reduction and #Ã(𝔽_p) is the actual order of its reduced point group.

EffectiveDiophantineMethods:ED.4/chabauty-finiteness
Names: TauCeti.EffectiveDiophantine.ED4.finite_rationalPoints_of_rank_lt_genus
Reason: The smooth projective curve/Jacobian, regular differential, geometric residue charts and analytic pullback/identity theorem are unavailable.
Required mathematical signature: Let X be a smooth projective geometrically integral curve of genus g ≥ 2 over ℚ with a rational point O, J its Jacobian, p a prime and r₀ the dimension of the p-adic closure of J(ℚ) in J(ℚ_p) (ED.4/padic-closure-dimension). If r₀ < g, in particular if r := rank J(ℚ) < g, then ι_O⁻¹(closure of J(ℚ)) ∩ X(ℚ_p) is finite; hence X(ℚ) is finite. Moreover, for p of good reduction its cardinality is at most Σ_{x̃ ∈ X̃(𝔽_p)} N_p(I_x̃) for any nonzero ω ∈ Ann_p(J(ℚ)) normalised to be integral with nonzero reduction, where I_x̃ is the expansion of η = ∫_O ω on D(x̃). Hypotheses: g ≥ 2; O ∈ X(ℚ); J(ℚ) finitely generated (Mordell–Weil, requested from RP.1). For p of bad reduction the residue classes are those of the minimal regular model (ED.4/bad-reduction-bound).

EffectiveDiophantineMethods:ED.4/coleman-bound
Names: TauCeti.EffectiveDiophantine.ED4.card_rationalPoints_le_coleman
Reason: Actual smooth proper reduction, nonzero integral annihilator differential and canonical-divisor degree2g−2 comparison are unavailable.
Required mathematical signature: Let (X, O, p, 𝒳) be a good-reduction Chabauty datum with g ≥ 2 and r₀ < g, and ω ∈ Ann_p(J(ℚ)) nonzero, scaled so that ω ∈ H⁰(𝒳, Ω¹) with nonzero reduction ω̃ ∈ H⁰(X̃, Ω¹). (a) For x̃ ∈ X̃(𝔽_p) with m := ord_x̃ ω̃, the number of P ∈ X(ℚ) with red P = x̃ is at most the number of zeros of η on D(x̃), hence at most N_p of the disc expansion, and at most m + 1 if m < p − 2. (b) If p > 2g, then #X(ℚ) ≤ #X̃(𝔽_p) + 2g − 2. Hypotheses: Good reduction at p; rank condition r₀ < g (in particular r < g); ω annihilates J(ℚ), which may be certified from any finite-index subgroup (ED.4/annihilating-differentials (b)).

EffectiveDiophantineMethods:ED.4/bad-reduction-bound
Names: TauCeti.EffectiveDiophantine.ED4.card_rationalPoints_le_badReduction
Reason: Actual minimal regular model, relative canonical sheaf, component multiplicities and horizontal/vertical intersection theory are unavailable.
Required mathematical signature: Let X be a smooth projective geometrically integral curve of genus g ≥ 2 over ℚ with O ∈ X(ℚ), J its Jacobian with r₀ < g at the prime p, 𝒳 → Spec ℤ_p the minimal proper regular model of X_{ℚ_p} (StableReduction layer 5), 𝒳_s its special fibre, 𝒳^sm the smooth locus of 𝒳 → Spec ℤ_p and 𝒳_s^sm its special fibre. Residue classes are the fibres of red : X(ℚ_p) = 𝒳(ℤ_p) = 𝒳^sm(ℤ_p) → 𝒳_s^sm(𝔽_p); each class lies on a single component C of multiplicity 1 and is parametrised by pℤ_p through a local parameter. Let ω ∈ Ann_p(J(ℚ)) be nonzero. (1) For a multiplicity-one component C scale ω by a power of p so that its restriction ω̃_C to C^sm := C ∩ 𝒳^sm is a nonzero 1-form; for Q̃ ∈ C^sm(𝔽_p) with m := ord_Q̃ ω̃_C < p − 2, at most m + 1 points of X(ℚ) reduce to Q̃ (and at most N_p of the class expansion in general). (2) If n_C denotes the number of zeros of ω̃_C on C^sm(𝔽_p) counted with multiplicity, then Σ_{C of multiplicity 1} n_C ≤ 2g − 2. (3) If p > 2g, then #X(ℚ) ≤ #𝒳_s^sm(𝔽_p) + 2g − 2. (4) For every prime p with r₀ < g the set ι_O⁻¹(closure of J(ℚ)) ∩ X(ℚ_p) is finite. Hypotheses: Separately stated hypotheses: 𝒳 is the minimal proper regular model over ℤ_p (regularity is what makes X(ℚ_p) = 𝒳^sm(ℤ_p) and the intersection theory available); no smoothness of 𝒳 is assumed. The scaling in (1) depends on C: ω_C = p^{k_C} ω with C absent from the divisor of ω_C as a section of the relative dualising sheaf. The relative canonical sheaf ω_{𝒳/ℤ_p} of the local complete intersection 𝒳 → Spec ℤ_p, with ω_{𝒳/ℤ_p} ≅ Ω¹ on the smooth locus and compatibility with base change (Liu Proposition 6.4.9), is requested from SchemeAndStackFoundations:SF.3.

EffectiveDiophantineMethods:ED.4/hyperelliptic-residue-discs
Names: TauCeti.EffectiveDiophantine.ED4.hyperelliptic_integralDifferentials_basis
Reason: The generic polynomial and disc algebra does not provide an integral regular-differential module.
Required mathematical signature: For a smooth good-reduction hyperelliptic model y²=f(x), 2 invertible and degree 2g+1 or2g+2, prove dx/y,x dx/y,…,x^(g−1)dx/y form the integral basis and compute orders in each affine/infinity chart. State and derive smoothness/discriminant and infinity charts on the actual model.

EffectiveDiophantineMethods:ED.4/residue-disc-verdict
Names: TauCeti.EffectiveDiophantine.ED4.ResidueDiscVerdict, ResidueDiscVerdict.zeros, ResidueDiscVerdict.Valid, ResidueDiscVerdict.rationalPoints_eq, ResidueDiscVerdict.ofKnownPoint, ResidueDiscVerdict.empty, ResidueDiscVerdict.card_le, ResidueDiscVerdict.changeBase, ResidueDiscVerdict.rawData, ResidueDiscVerdict.check, verdict_C05_disc_zero_one, verdict_C132_weierstrass, verdict_empty, verdict_known_zeros_only, verdict_rationalPoints_eq, verdict_reject_unknown_dominant, verdict_reject_tail_tie, verdict_reject_missing_child, verdict_reject_duplicate_zero
Reason: The exact point/field-embedding, curve/chart/series interpretation and certified analytic tail interfaces needed by the full raw verifier are unavailable. The finite coefficient-check fragment and renamed semantic zero data do not supply them.
Required mathematical signature: For a genuine geometric Chabauty datum, a residue disc D(x̃), a certified nonzero differential annihilating a finite-index Mordell–Weil subgroup, and η(P)=∫_O^Pω, a ResidueDiscVerdict is finite raw data with a terminating checker, not a record containing a universal bound on unknown points. It contains: (i) exact curve/base-point/local-parameter identifiers and a certified integration constant; (ii) finite coefficient residue tables for scaled pullback series F(u)=p^sη(φ(p(a+p^k u))) in each encoded ball, where φ is the inverse geometric parameter chart and the finite integers a,k describe the ball (the root uses a=k=0), common absolute precision, a certified nonzero leading coefficient and a last dominant index; (iii) a finite tail-bound transcript whose soundness follows from integral differential coefficients or the CN.4 certified analytic supplier; (iv) either the whole disc as one leaf or a finite full residue-subdivision tree, with all p children at each internal ℤ_p-ball and disjoint leaves covering the root; (v) exact rational/algebraic zero records, their embeddings in ℚ_p via isolating balls, checks of the curve equation and geometric vanishing relation, rationality/nonrationality certificates and distinctness; (vi) for each leaf, the number of distinct recorded zeros equals its checked Strassmann upper bound. Zero-root leaves have bound0 and no point records. Valid means that every finite arithmetic, identifier, covering, disjointness and exact algebraic check succeeds. Under separately stated geometric interpretation and supplier-soundness hypotheses this proves X(ℚ)∩D(x̃)=Z_rat. No list of approximate roots, semantic all-point validity predicate or asserted bound is a raw certificate. Raw shape, finite checks, soundness hypotheses and all tests are exactly the associated hypotheses/API/proofSteps/tests. No universal semantic Valid is advertised as executable. Hypotheses: G of finite index in J(ℚ), so that ω also annihilates J(ℚ) (ED.4/annihilating-differentials (b)); without the finite-index certificate a verdict proves only that the rational points of D(x̃) whose image lies in the saturation of G are listed. Distinct points of Z_rat ∪ Z_irr have distinct parameters t; points are compared exactly, not to finite precision. Interpretation is external to the raw payload: a proved chart identifies every encoded ball with its geometric subdisc, the certified differential has integral derivative in the recorded coordinate, the integration constant and coefficient congruences are sound, and the imported tail producer certifies all omitted coefficients. These are theorems of the actual curve/integration and arithmetic suppliers, not arbitrary Prop fields stored in the certificate. Each nonrational zero is specified by exact algebraic coordinates/defining polynomials and a chosen ℚ_p embedding, with an exact nonrationality certificate. A Hensel-isolated analytic root alone does not prove rationality or nonrationality. Distinct zeros consume one unit of the distinct-zero bound; multiplicity is never inferred from rounded equality. One sufficient root-disc tail rule is: for F(u)=p^s I(pu), s≥0, I′ integral and I≠0, v_p([u^n]F)≥s+n−v_p(n) for n≥1. If the chosen minimum coefficient valuation is m≥0, a cutoff K≥2(m+1) gives every n≥K valuation≥m+1. The constant coefficient is certified separately. The finite table modulo p^M must have M>m and must verify the last coefficient at valuation m. This rule is sufficient, not necessary; refinement may be needed. The interpreted rescaled series must be restricted (coefficients tend to zero), proved by the integral-derivative estimate or a separate analytic supplier theorem, before applying Strassmann.

EffectiveDiophantineMethods:ED.4/chabauty-coleman-certificate
Names: TauCeti.EffectiveDiophantine.ED4.ChabautyColemanCertificate.ofRankHypothesis, certificate_conditional_label.geometric, certificate_C05.factory
Reason: Finite index, genus/rank and a nonzero geometric annihilator are not derived by the abstract record.
Required mathematical signature: Given actual J(Q) finitely generated, g≥1, rank J(Q)≤r<g, r certified independent generators modulo torsion, show their subgroup has full rank and finite index by the FG free quotient. Its p-adic log span has dimension≤r, so construct nonzero ω∈H⁰(X_Qp,Ω¹) annihilating it; only then construct all analytic disc verdicts. Conditional rank labels must be recorded; withFiniteIndex is merely a semantic helper. C05 factory must build rank/differential/four-disc data rather than receive Valid and a bound sum.

EffectiveDiophantineMethods:ED.4/chabauty-coleman-certificate
Names: certificate_C05
Reason: The current example is only a weaker semantic consequence, renamed separately. The exact geometric factory/conditional-label regression remains unavailable.
Required mathematical signature: For C₀(5) with O = ∞⁺, G = ⟨[(−3,1) − (0,1)]⟩, r = 1, p = 3: four verdicts with N = 1, 1, 2, 2 at ∞⁺, ∞⁻, (0, 1), (0, −1), and L of size 6 = Σ N. Use the actual curve and rank-labelled geometric constructor ChabautyColemanCertificate.ofRankHypothesis, together with the required genuine rank, annihilator and complete raw disc-verdict data. For C05, construct the exact six distinct rational points and the four discs with bounds1,1,2,2; verify the list and equality, not only an upper bound from an assumed sum.

EffectiveDiophantineMethods:ED.4/chabauty-coleman-certificate
Names: certificate_conditional_label
Reason: The current example is only a weaker semantic consequence, renamed separately. The exact geometric factory/conditional-label regression remains unavailable.
Required mathematical signature: A certificate built by ofRankHypothesis is conditional and its completeness theorem is stated under the labelled hypothesis. Use the actual curve and rank-labelled geometric constructor ChabautyColemanCertificate.ofRankHypothesis, together with the required genuine rank, annihilator and complete raw disc-verdict data. Check that the stored conditional label is precisely the rank hypothesis and that the soundness/completeness result still requires that hypothesis. Equality of the points field under withFiniteIndex alone is insufficient.

EffectiveDiophantineMethods:ED.4/number-field-chabauty-criterion
Names: TauCeti.EffectiveDiophantine.ED4.eq_singleton_of_rank_reducedMatrix
Reason: Actual number-field curve/Jacobian, all local completions and integral differential bases, integration matrices and certified kernel/Hermite construction are unavailable.
Required mathematical signature: Let K be a number field of degree d, C a smooth projective geometrically integral curve over K of genus g ≥ 2 with Jacobian J, D₁, …, D_r a basis of a free subgroup of finite index in J(K), and p a rational prime such that (p1) p is odd, (p2) p is unramified in K, (p3) every prime υ | p of K is a prime of good reduction for C (a good-reduction datum over O_υ, ED.4/good-reduction-chabauty-datum). Fix ℤ_p-bases θ_{υ,1}, …, θ_{υ,d_υ} of O_υ and O_υ-bases ω_{υ,1}, …, ω_{υ,g} of H⁰(𝒞_υ, Ω¹). For ω ∈ H⁰(𝒞_υ, Ω¹) let τ_j = ∫_{D_j} ω = Σ_i t_{ij} θ_{υ,i} (t_{ij} ∈ ℚ_p), T_{υ,ω} = (t_{ij}), T_υ the stack of the T_{υ,ω_{υ,l}} and T the stack over υ | p (a gd × r matrix over ℚ_p). For Q ∈ C(K), a well-behaved uniformiser t_Q at Q (a local coordinate at Q̃ shifted to vanish at Q) and α = (ω/dt_Q)(Q) ∈ O_υ, let A_{υ,ω} be the d_υ × d_υ matrix of multiplication by α in the basis θ, A_υ the stack over ω_{υ,l} and A the block-diagonal matrix of the A_υ (gd × d over ℤ_p). Choose a ≥ 0 with p^a T integral and a unimodular U with U(p^a T) in Hermite normal form with h zero rows; let M_p(Q) be the last h rows of U A. If the reduction M̃_p(Q) ∈ M_{h×d}(𝔽_p) has rank d, then C(K) ∩ B_p(Q) = {Q}, where B_p(Q) = ∏_{υ|p} B_υ(Q) is the p-unit ball of points reducing to Q̃ at every υ | p. The rank of M̃_p(Q) does not depend on U; the necessary dimension condition is h ≥ d. The familiar r ≤ d(g − 1) condition follows when rank(T)=r, hence h=gd−r; without this full-rank assumption it is a sufficient dimension heuristic, not a necessary condition. Hypotheses: Separately stated hypotheses of the number-field variant: (p1) p odd; (p2) p unramified in K; (p3) good reduction at every υ | p; D₁, …, D_r a basis of a free finite-index subgroup of J(K) (its finite index requires an unconditional rank certificate, ED.3). Finite approximations alone generally certify all h kernel rows only in the full-rank case h=max(gd−r,0), using annihilator-precision. Exact dependencies or another certified kernel construction may also certify a larger h; r≤d(g−1) is not a universal necessity.

EffectiveDiophantineMethods:ED.4/symmetric-square-chabauty-datum
Names: TauCeti.EffectiveDiophantine.ED4.SymmetricSquareChabautyDatum, SymmetricSquareChabautyDatum.abelJacobi, SymmetricSquareChabautyDatum.abelJacobi_injective, SymmetricSquareChabautyDatum.red, SymmetricSquareChabautyDatum.matrix, SymmetricSquareChabautyDatum.relativeVanishing, SymmetricSquareChabautyDatum.mem_pullback, symmetricSquare_rationalPairs, symmetricSquare_matrix_diagonal, symmetricSquare_infinite_nonexample, symmetricSquare_reduction_compat, symmetricSquare_conjugate_divisor
Reason: Actual Sym² of the curve, Galois-stable effective divisors with multiplicity, Abel–Jacobi/Picard map, trace on regular differentials and reduced coefficient matrices over their residue fields are unavailable.
Required mathematical signature: Let X be a smooth projective non-hyperelliptic curve of genus g ≥ 3 over ℚ with Jacobian J, ∞ a rational effective divisor of degree 2 (for example 2O or O + O'), and p a prime with a good-reduction datum 𝒳 (ED.4/good-reduction-chabauty-datum, with the base point replaced by ∞). The symmetric square X⁽²⁾ parametrises effective divisors of degree 2; X⁽²⁾(ℚ) consists of the pairs {P, P^σ} of a quadratic point and its conjugate and the pairs {P, Q} of rational points, including the doubled divisor 2P. Braces denote a multiset/effective divisor, never a Finset that loses repeated points. The datum consists of: (i) ι⁽²⁾ : X⁽²⁾ → J, 𝒬 ↦ [𝒬 − ∞], injective because X is not hyperelliptic; (ii) the reduction X⁽²⁾(ℚ) → X̃⁽²⁾(𝔽_p) and its residue classes; (iii) the integral vanishing lattice V = Ann_p(J(ℚ)) ∩ H⁰(𝒳, Ω¹) and its reduction Ṽ (ED.4/annihilating-differentials); (iv) for 𝒬 = {Q₁, Q₂} ∈ X⁽²⁾(ℚ), a prime v of ℚ(Q₁) above p, uniformisers t_{Q̃_j} at the reductions and the expansions ω_i = (a₀(ω_i, t_{Q̃_j}) + a₁(ω_i, t_{Q̃_j}) t + ⋯) dt for a basis ω₁, …, ω_k of Ṽ; (v) the matrix Ã(𝒬): the k × 2 matrix (a₀(ω_i, t_{Q̃₁}), a₀(ω_i, t_{Q̃₂})) when Q₁ ≠ Q₂, and (a₀(ω_i, t_{Q̃₁}), a₁(ω_i, t_{Q̃₁})/2) when Q₁ = Q₂; (vi) in the relative case, a degree-two morphism ρ : X → C to a curve C with good reduction at p, extending to ρ : 𝒳 → 𝒞, the trace Tr : H⁰(X, Ω¹) → H⁰(C, Ω¹), V₀ := V ∩ ker Tr and its reduction Ṽ₀, and the set ρ*C(ℚ) ⊆ X⁽²⁾(ℚ) of pullbacks of rational points. Hypotheses: X non-hyperelliptic of genus g ≥ 3 (so ι⁽²⁾ is an embedding); p of good reduction for X; p odd wherever the diagonal matrix (v) is used (and for C in the relative case, with ρ extending to the smooth models). The symmetric square of a curve and its points as effective divisors are requested from SchemeAndStackFoundations:SF.3. The reduced matrix has entries in the residue field generated by the support (or its algebraic closure), not necessarily 𝔽_p. Its two columns retain geometric multiplicities; arbitrary injective coordinates or an assumed Abel–Jacobi injection are not this geometric datum.

EffectiveDiophantineMethods:ED.4/symmetric-chabauty
Names: TauCeti.EffectiveDiophantine.ED4.eq_of_rank_symmetricMatrix
Reason: The actual effective-divisor and common-finite-extension local expansions with certified multiplicity/ramification bounds are unavailable.
Required mathematical signature: In a symmetric-square Chabauty datum (ED.4/symmetric-square-chabauty-datum) for X/ℚ non-hyperelliptic of genus g ≥ 3 and a prime p of good reduction, let 𝒬 = {Q₁, Q₂} ∈ X⁽²⁾(ℚ) and ω₁, …, ω_k a basis of Ṽ. Suppose p > 2, and p ≠ 3 when [𝔽_p(Q̃₁) : 𝔽_p] = 1. If rank Ã(𝒬) = 2, then 𝒬 is the unique point of X⁽²⁾(ℚ) in its residue class modulo p. Two independent vanishing differentials exist when r < g − 1; the criterion can fail even then. Derive the power-sum valuation contradiction from Siksek2009 Theorem3.2 and Lemmas3.3–3.4; do not assume a generic injectivity or linear-congruence criterion as a geometric factory. Hypotheses: Hypotheses of Box Theorem 2.1: p > 2; p ≠ 3 when Q̃₁ is 𝔽_p-rational; X non-hyperelliptic of genus ≥ 3 with good reduction at p. Ṽ is the reduction of the integral annihilator of J(ℚ) (ED.4/annihilating-differentials); computing it from a finite-index subgroup suffices.

EffectiveDiophantineMethods:ED.4/relative-symmetric-chabauty
Names: TauCeti.EffectiveDiophantine.ED4.mem_pullback_of_relativeCriterion.geometric, TauCeti.EffectiveDiophantine.ED4.mem_pullback_of_relativeCriterion
Reason: The abstract symmetric-space test receives the Box criterion as an assumption. The supporting set-cover implication has a distinct name and cannot stand for the geometric theorem.
Required mathematical signature: Use actual Sym²X, the degree-two Abel–Jacobi map and relative cover X→C, regular differential trace kernel, all divisors and local parameters; derive Box rank/vanishing criterion then membership in the pullback locus. Caraiani–Newton §7.4 is its relative application, not a new general owner.

EffectiveDiophantineMethods:ED.4/fps-quintic-cycle-curve
Names: TauCeti.EffectiveDiophantine.ED4.C05_rationalPoints
Reason: The actual curve/Jacobian/model, rank and geometric disc-certificate construction is unavailable in the suggested file. The renamed cardinality implication is supporting only.
Required mathematical signature: Let X = C₀(5) be the smooth projective genus-2 curve y² = f(x), f = x⁶ + 8x⁵ + 22x⁴ + 22x³ + 5x² + 6x + 1, birational to the curve of quadratic polynomials with a marked 5-cycle. Then X(ℚ) = {∞⁺, ∞⁻, (0, 1), (0, −1), (−3, 1), (−3, −1)}. Certificate (ED.4/chabauty-coleman-certificate): O = ∞⁺; rank input J(ℚ) ≅ ℤ (Flynn–Poonen–Schaefer Theorem 3, a 2-descent with trivial torsion, certified by ED.3/fps-genus-two-mordell-weil); G = ⟨[(−3, 1) − (0, 1)]⟩, of finite index since its generator is nonzero in the torsion-free group J(ℚ) ≅ ℤ; p = 3 with the two-chart model, smooth since f has unit leading coefficient and is squarefree mod 3 (ED.4/hyperelliptic-residue-discs); X̃(𝔽_3) = {∞⁺, ∞⁻, (0, 1), (0, −1)}; annihilating differential ω = ε dx/y + x dx/y with ε ≡ 2·3 + 3² + 2·3³ (mod 3⁴), from ∫_{(0,1)}^{(−3,1)} dx/y ≡ 2·3 + 3⁴ and ∫_{(0,1)}^{(−3,1)} x dx/y ≡ 2·3² + 2·3³ (mod 3⁵), so ω̃ = x dx/y; verdicts: at ∞^±, m = 0 < p − 2, N = 1, Z_rat = {∞^±}; at (0, 1), t = x, m = 1 and the coefficient of t² in w vanishes mod 3, N = 2, Z_rat = {(0, 1), (−3, 1)}; at (0, −1), by the hyperelliptic involution, N = 2, Z_rat = {(0, −1), (−3, −1)}. Hypotheses: Rank input: J(ℚ) ≅ ℤ, an unconditional 2-descent (FPS Theorem 3), supplied as an ED.3 finite-index and rank certificate (ArithmeticDynamics request to ED.3). Use the actual smooth projective curve and Hom_Q(Spec Q,X), its genuine Jacobian and Abel–Jacobi map, and the exact named rational points. Construct the geometric reduction, annihilator and complete accepted disc-verdict data; do not receive an arbitrary complete semantic certificate or assume its point cardinality.  The actual six-point theorem is unconditional once the specified unconditional rank and geometric suppliers are proved.

EffectiveDiophantineMethods:ED.4/poonen-type-three-two-curve
Names: TauCeti.EffectiveDiophantine.ED4.C132_rationalPoints
Reason: The actual curve/Jacobian/model, rank and geometric disc-certificate construction is unavailable in the suggested file. The renamed cardinality implication is supporting only.
Required mathematical signature: Let X = C₁(3₂) be the smooth projective genus-2 curve y² = g(x), g = x⁶ − 2x⁴ + 2x³ + 5x² + 2x + 1, classifying z² + c with a rational point of preperiodic type 3₂. Then X(ℚ) = {(−1, ±1), (0, ±1), (1, ±3), ∞⁺, ∞⁻}. The certificate is conditional on the rank input rank J(ℚ) ≤ 1 (Poonen Proposition 1), whose corrected 2-descent ED.3/poonen-genus-two-mordell-weil records as a gap; unconditionally, the eight points are the only rational points P with ι_O(P) in the saturation of G in J(ℚ_3). Certificate: O = ∞⁺; rank input as just stated, with J(ℚ)_tors = 0 and rank J(ℚ) ≥ 1 certified; G = ⟨[S⁺ − S⁻]⟩ with S^± = (1, ±3), of finite index; p = 3 with the two-chart model (g mod 3 squarefree, leading coefficient 1); X̃(𝔽_3) = {∞⁺, ∞⁻, (0, ±1), (2, ±1), (1, 0)}, seven points; annihilating differential ω = α dx/y + x dx/y with ∫_{S⁻}^{S⁺} ω = 0, computed in the disc of the Weierstrass point (1, 0) with the parameter t = y + 3, giving α ≡ 68 (mod 3⁴) and ω̃ = (x − 1) dx/y; verdicts: on the six discs other than (1, 0), ω̃ does not vanish, so N = 1 with Z_rat the unique known point ((−1, ±1) reduce to (2, ±1)); on the disc of (1, 0), m = 2 ≥ p − 2 (exceptional disc), the certified disc Strassmann bound of ∫_{S⁻} ω is N = 3, Z_rat = {S⁻, S⁺} (t = 0, 6) and Z_irr = {W}, the Weierstrass point of X(ℚ_3) with x(W) ≡ 1 (mod 3) (t = 3), which is not rational because g has no rational root and is a zero because 2[W − S⁻] = [S⁺ − S⁻] ∈ G. Hypotheses: Conditionality label: 'conditional on rank J(ℚ) ≤ 1'. Poonen's printed 2-descent uses the point (2, √33), which is not on C; his errata replace it by (−2, √33) and the 2-adic information without printing the corrected computation, and ED.3/poonen-genus-two-mordell-weil records this as a gap. Torsion is trivial since #J(𝔽_3) = 27 and #J(𝔽_5) = 43. The Coleman-integral certificate replaces Poonen's formal-group computation; its numerical values (α, the disc Strassmann indices) are computed in this blueprint from the tiny-integral expansions and are not printed in the source. Use the actual smooth projective curve and Hom_Q(Spec Q,X), its genuine Jacobian and Abel–Jacobi map, and the exact named rational points. Construct the geometric reduction, annihilator and complete accepted disc-verdict data; do not receive an arbitrary complete semantic certificate or assume its point cardinality.  Preserve the conditional rank label and the separate unconditional saturation statement; an assumed Valid record is not a proof of the rank hypothesis.

EffectiveDiophantineMethods:ED.4/stoll-six-cycle-curve
Names: TauCeti.EffectiveDiophantine.ED4.X0dyn6_rationalPoints_of_rank_le_three
Reason: The actual curve/Jacobian/model, rank and geometric disc-certificate construction is unavailable in the suggested file. The renamed cardinality implication is supporting only.
Required mathematical signature: Let X = X₀^dyn(6) be the genus-4 curve given by the smooth model G(u, w) = w²(w + 1)u³ − (5w² + w + 1)u² − w(w² − 2w − 7)u + (w + 1)(w − 3) = 0 of bidegree (3, 3) in ℙ¹ × ℙ¹, with the ten rational points P₀, …, P₉ of Stoll's table. Unconditionally: J(ℚ) has trivial torsion, the subgroup G generated by differences of the P_i is ≅ ℤ³, and the P_i are the only rational points P with [P − P₁] in the saturation of G. Conditionally on the labelled hypothesis rank J(ℚ) ≤ 3 (which follows from analytic continuation and the standard functional equation of L(J, s), a certified nonvanishing L'''(J,1)≠0 (Stoll’s value 0.836… is numerical, and his reported lower-derivative vanishings are only to working precision), and the weak Birch and Swinnerton-Dyer conjecture for J; Stoll §4 and Theorem 7), X(ℚ) = {P₀, …, P₉}. Certificate: O = P₁; G with generators of G ∩ J(ℚ_5)¹ given by D₁ = P₇ − P₉, D₂ = P₀ − 6P₁ + 2P₅ + P₇ + P₈ + P₉, D₃ = P₀ − 3P₁ + 2P₂ + P₄ + P₆ − P₇ − P₈; p = 5 (the model has good reduction away from 2 and 8029187); the annihilating differential ω, computed by ED.4/kernel-of-reduction-evaluation at P₁ = (0, −1) with parameter u, has reduction ω̄ = ω̄₂ = w ω̄₀; verdicts: at (∞, −1), m = 1 < p − 2 = 3, N = 2, Z_rat = {P₇, P₉}; at (∞, 0), where ω̄ also vanishes, the explicit expansion λ = γτ(1 − (2 + O(5))5τ + O(5²)) gives N = 1, Z_rat = {P₃}; at every other point of X̃(𝔽_5), ω̄ does not vanish and N = 1, and each such disc contains one of the P_i (the reduction map on {P₀, …, P₉} is onto X̃(𝔽_5)). Hypotheses: Conditionality label: 'conditional on rank J(ℚ)≤3'. An analytic derivation additionally needs certified analytic order≤3, along with analytic continuation/functional equation and weak BSD; Stoll’s numerical evidence is not that certificate. The unconditional statement concerns the saturation of G. ED.3/stoll-genus-four-subgroup supplies the unconditional part of the rank input (G ≅ ℤ³, trivial torsion) and labels the analytic rank bound; under rank J(ℚ) = 3 the Chabauty step uses the saturation of G directly, so no p-saturation certificate is needed. Use the actual smooth projective curve and Hom_Q(Spec Q,X), its genuine Jacobian and Abel–Jacobi map, and the exact named rational points. Construct the geometric reduction, annihilator and complete accepted disc-verdict data; do not receive an arbitrary complete semantic certificate or assume its point cardinality.  Preserve the conditional rank label and the separate unconditional saturation statement; an assumed Valid record is not a proof of the rank hypothesis.

EffectiveDiophantineMethods:ED.5/kummer-curve-test
Names: TauCeti.MordellWeilSieve.GenusTwo.mem_range_aj_of_kummer_reductions
Reason: Cassels–Flynn explicit model of genus-two Jacobians and Kummer surfaces: Cassels–Flynn, Prolegomena (1996), Chapters 2–4 (not read): the embedding J_F ⊆ ℙ¹⁵ by 72 quadrics, the Kummer surface K_F ⊆ ℙ³ with its quartic, the duplication δ and the biquadratic forms B, the Kummer coordinates (1 : x₁+x₂ : x₁x₂ : β₀) of a degree-two divisor class, the dual Kummer surface (quotient of Pic¹ by the hyperelliptic involution) with the duality ξ·η = 0 iff P ∈ C ± Q and the forms A of Lemma 6.1; Bruin–Stoll Lemmas 5.2–5.4, 5.7 and Propositions 5.5, 5.10 rest on these. No atlas roadmap owns them; AlgebraicCurves Layer 10 stops at the models y² = f(x). Height comparison constants for genus-two Jacobians: For genus-two Jacobians: a certified bound γ ≥ h − ĥ between the naive Kummer height and the canonical height (Stoll 1999 and 2002, Bruin–Stoll references [25, 27], not read), the height-pairing matrix of the generators, and the comparison ĥ(ι(P)) ≤ d·h(P) + δ for the embedding (for ι(P) = [P − ∞] on an odd-degree model through the Kummer coordinates of [P − ∞]). The elliptic case is covered by Tau Ceti's canonical height and ED.3/explicit-height-difference-bound; the Néron–Tate height itself is requested from RP.0.
Required mathematical signature: Let C: y² = F(x, z) be a genus-two curve over ℚ with integral binary sextic F, P₀ ∈ C(ℚ) with x(P₀) = (a : b) for coprime integers a, b, and ι(P) = [P − P₀]. For Q ∈ J(ℚ) let (k₁ : k₂ : k₃ : k₄) be its image on the Kummer surface with coprime integer coordinates and h(Q) = log max|k_j|; let γ ≥ h − ĥ on J(ℚ). Let p₁, …, p_m be distinct primes of good reduction with p₁⋯p_m > 3·e^{H′+γ}·max(|a|, |b|)², and, if P₀ ≠ P̄₀, such that the product of those p_j modulo which P₀ and its hyperelliptic conjugate P̄₀ remain distinct exceeds e^{H′+γ} (for instance, every p_j separates them). If Q ∈ J(ℚ) has ĥ(Q) ≤ H′ and the reduction of Q modulo every p_j lies in ι_{p_j}(C̃(𝔽_{p_j})), then Q ∈ ι(C(ℚ)). The factor 3 corrects the printed bound (source issue EffectiveDiophantineMethods/E12). The arithmetic core: if |k_j| ≤ B, every p_j divides k₁a² − k₂ab + k₃b², and ∏ p_j > 3B·max(|a|, |b|)², then k₁a² − k₂ab + k₃b² = 0. Hypotheses: C of genus two with integral sextic model; P₀ rational with x(P₀) = (a : b), gcd(a, b) = 1; ι(P) = [P − P₀]. γ ≥ h − ĥ on J(ℚ); distinct good primes with p₁⋯p_m > 3e^{H′+γ}max(|a|,|b|)²; if P₀ ≠ P̄₀, the p_j separating P₀ and P̄₀ have product > e^{H′+γ}. The prime condition on the separating primes corrects the gap EffectiveDiophantineMethods/E17 in the published proof. Use the actual genus-two Jacobian, Cassels–Flynn/Kummer carriers and coordinate identities from the stated suppliers. The arithmetic helper alone does not identify the geometric objects or supply these model theorems.

EffectiveDiophantineMethods:ED.5/genus-two-bad-information
Names: TauCeti.MordellWeilSieve.GenusTwo.reduction_exact_of_regular
Reason: Certified finite presentations of Jacobians over finite fields and of sieve quotients: Certified executable presentations: the Mumford representation of J(𝔽_p) for hyperelliptic models and the correctness of Cantor's composition and reduction (Bruin–Stoll cite Cantor 1987, not read); a certified isomorphism J(𝔽_p) ≅ ⊕ ℤ/n_iℤ; discrete logarithms (Pohlig–Hellman) for the local maps on generators and for the image of C(𝔽_p); enumeration of C(𝔽_p); Smith-normal-form presentations of Γ/L_j, of the kernels of Γ/L_{j+1} → Γ/L_j and of the image subgroups φ_i(L_j). Natural owner: ComputationalNumberTheory:CN.3 with CN.0 carriers. The ED.5 theorems take finite groups and maps as inputs and are proved without these; executing a certificate needs them. Non-hyperelliptic models (plane quartics, Box's models of X₀(N)) need the same for their own Jacobian arithmetic. Supersedes the existing gap 'ED.5 geometric reduction and certified input data' together with jacobian-reduction-data and the requests to NeronModels R11.4. Cassels–Flynn explicit model of genus-two Jacobians and Kummer surfaces: Cassels–Flynn, Prolegomena (1996), Chapters 2–4 (not read): the embedding J_F ⊆ ℙ¹⁵ by 72 quadrics, the Kummer surface K_F ⊆ ℙ³ with its quartic, the duplication δ and the biquadratic forms B, the Kummer coordinates (1 : x₁+x₂ : x₁x₂ : β₀) of a degree-two divisor class, the dual Kummer surface (quotient of Pic¹ by the hyperelliptic involution) with the duality ξ·η = 0 iff P ∈ C ± Q and the forms A of Lemma 6.1; Bruin–Stoll Lemmas 5.2–5.4, 5.7 and Propositions 5.5, 5.10 rest on these. No atlas roadmap owns them; AlgebraicCurves Layer 10 stops at the models y² = f(x).
Required mathematical signature: Let O be a complete discrete valuation ring with uniformiser π, residue field k with char k ≠ 2 and fraction field L, F ∈ O[X, Z] a squarefree binary sextic, C_F: Y² = F(X, Z) in weighted projective space, J_F ⊆ ℙ¹⁵ the Cassels–Flynn model of its Jacobian, J_F¹(L) = {P : P̄ = O} its kernel of reduction for this model, and J_{F̄}^0 the component of the smooth locus of the special fibre containing the origin. (a) (Theorem 5.11) J_{F̄}^0 is a commutative algebraic group whose law on Mumford pairs (A, B) is Cantor composition and reduction, except when both A vanish at the same singular point x = 0, where φ(X², λXZ²) + φ(X², μXZ²) = φ(X², ((f₂ + λμ)/(λ + μ))XZ²) and the sum is zero if λ + μ = 0. (b) (Proposition 5.10) P ∈ J_F lies in J_F^0 iff δ(κ(P)) ≠ 0. (c) (Corollaries 5.14–5.15) If C_F/O is regular and F̄ is not a square, then 0 → J_F¹(L) → J_F(L) → J_{F̄}^0(k) → 0 is exact, the map reducing the Mumford representation. For an odd prime p at which the given model is regular with one-component special fibre this computes the local datum of padic-quotient-sieve-datum with U = J¹(ℚ_p) as at good primes; at an odd prime where the model is not regular or the special fibre has several components, J(ℚ) ∩ J⁰(ℚ_p) is computed by subgroup-from-membership-test with the test v_p(δ(κ(P))) = 4v_p(κ(P)), and the image of C(ℚ_p) modulo J¹(ℚ_p) by the dual Kummer test of genus-two-deep-information with n = 1. Remark 5.16 (the regular model minus singular points is the Néron model) is stated without proof in the source and is not used. Hypotheses: O complete DVR, char k ≠ 2; F squarefree of degree six over O; for (c) the model C_F/O is regular and F̄ is not a square. Use the actual genus-two Jacobian, Cassels–Flynn/Kummer carriers and coordinate identities from the stated suppliers. The arithmetic helper alone does not identify the geometric objects or supply these model theorems.

EffectiveDiophantineMethods:ED.5/genus-two-deep-information
Names: TauCeti.MordellWeilSieve.GenusTwo.dualKummer_valuation_of_mem_deep
Reason: Cassels–Flynn explicit model of genus-two Jacobians and Kummer surfaces: Cassels–Flynn, Prolegomena (1996), Chapters 2–4 (not read): the embedding J_F ⊆ ℙ¹⁵ by 72 quadrics, the Kummer surface K_F ⊆ ℙ³ with its quartic, the duplication δ and the biquadratic forms B, the Kummer coordinates (1 : x₁+x₂ : x₁x₂ : β₀) of a degree-two divisor class, the dual Kummer surface (quotient of Pic¹ by the hyperelliptic involution) with the duality ξ·η = 0 iff P ∈ C ± Q and the forms A of Lemma 6.1; Bruin–Stoll Lemmas 5.2–5.4, 5.7 and Propositions 5.5, 5.10 rest on these. No atlas roadmap owns them; AlgebraicCurves Layer 10 stops at the models y² = f(x).
Required mathematical signature: Let C be a genus-two curve over ℚ with a Weierstrass model over ℤ_p, p odd, ι: C → J from a rational degree-one class, Jⁿ(ℚ_p) the pⁿℤ_p-points of the formal group (n ≥ 1) and log: J¹(ℚ_p) → (pℤ_p)² the formal logarithm. (a) For Γ = J(ℚ) and K_n = Γ ∩ Jⁿ(ℚ_p), K_n is the kernel of K₁ → (pℤ_p/pⁿℤ_p)² ≅ (ℤ/p^{n−1})², P ↦ log P mod pⁿ; so Γ/K_n is finite and computable from K₁ and logarithms to precision pⁿ. (b) (Lemma 6.2) If P₀ ∈ C(ℚ_p), Q ∈ Jⁿ(ℚ_p) and (η₁ : η₂ : η₃ : η₄) are coordinates of the image of P₀ + Q ∈ Pic¹ on the dual Kummer surface, normalised to minimal valuation zero, then v_p(η₁η₃ − η₂²) ≥ n and v_p(η₄) ≥ 2n. Hence the set Y_n of classes c ∈ Γ/K_n whose chosen representative g, translated to Pic¹ by g↦g+D₁ and to the dual Kummer surface, satisfies v_p(η₄) ≥ 2n and v_p(η₁η₃ − η₂²) ≥ n, contains every class whose coset meets ι(C(ℚ_p)); it is a certified superset for padic-quotient-sieve-datum with U = Jⁿ(ℚ_p). The necessary dual-Kummer congruences supply a superset only; actual membership in the curve embedded in Pic¹ must be checked separately. Translation Pic⁰→Pic¹ is defined on the whole Jacobian, unlike an inverse of the curve embedding. Hypotheses: p odd; Weierstrass model of C over ℤ_p; n ≥ 1; ι from a rational degree-one class. Use the actual genus-two Jacobian, Cassels–Flynn/Kummer carriers and coordinate identities from the stated suppliers. The arithmetic helper alone does not identify the geometric objects or supply these model theorems.

EffectiveDiophantineMethods:ED.5/small-genus-two-nonexistence
Names: TauCeti.MordellWeilSieve.Examples.smallGenusTwo_noRationalPoints
Reason: Data of the small genus-two curves experiment: The list of the 1492 curves, their Mordell–Weil generators and ranks (with the BSD-conditional cases) and the local data, from Bruin–Stoll, 'Deciding existence of rational points on curves: an experiment', Experiment. Math. 17 (2008) 181–189, and the electronic appendix MWSieve-new.m; not read.
Required mathematical signature: Among the genus-two curves y² = f(x) with f of degree five or six and coefficients in {−3, …, 3}, the 1492 isomorphism classes left undecided after a search for rational points, a check for local points and a 2-cover descent have no rational point. For Jacobians of rank at most two the proof used good information only, for ranks three and four also bad and deep information; for some curves the rank of J(ℚ) is used under the Birch–Swinnerton-Dyer conjecture, and those cases are conditional. Each of the 1447 curves that needed a sieve computation (§8, p.301) is an instance of sieve-certificate-sound (a) with an emptiness certificate; the other 45 had rank zero or were ruled out directly by information from the Birch–Swinnerton-Dyer conjecture, and the latter are conditional. Hypotheses: The curves, Mordell–Weil generators, ranks and local data of Bruin–Stoll's experiment (gap); the BSD-conditional cases are labelled. The finite 1492-case input list and all 1447 sieve transcripts must be supplied and independently checked, together with the remaining45 cases and their individual conditional labels. These complete per-curve transcripts remain an unreplayed data obligation. ED.6 does not contain these1492 instances.

EffectiveDiophantineMethods:ED.6/qc-disc-certificate
Names: TauCeti.EffectiveDiophantine.ED6.QCDiscCertificate, TauCeti.EffectiveDiophantine.ED6.QCDiscCertificate.check, TauCeti.EffectiveDiophantine.ED6.QCDiscCertificate.check_sound, TauCeti.EffectiveDiophantine.ED6.QCDiscCertificate.ofRestrictedSeries
Reason: Actual disc/function/precision suppliers and multiplicity-aware root isolation are not built.
Required mathematical signature: Input actual geometric disc chart and finitely many restricted F_i(pT), finite coefficients as residues modulo p^N, rational tail bounds derived from height-series-valuation-bound, finite residue-ball tree, root multiplicity/verifier data and centre representatives modulo p^n. Check finite coefficients, exhaustive tree cover/discard decisions and uniqueness/root counts by Newton/Weierstrass and derivative bounds; check=true plus supplier coefficient/tail semantics implies covers and unique. An arbitrary fn:Z_p→Q_p and universal covers proof is excluded from raw input; do not name the semantic record a numerical checker.

EffectiveDiophantineMethods:ED.6/qc-certificate-sound
Names: TauCeti.EffectiveDiophantine.ED6.rationalPoints_eq_of_qcCertificate
Reason: The actual geometric supplier carriers and comparison maps are unavailable at the pinned baseline. The separately named matrix/set helper does not state this theorem.
Required mathematical signature: Let X/Q be a smooth projective geometrically connected curve of genus g ≥ 2 with b ∈ X(Q), Jacobian J of rank r = g with log : J(Q) ⊗ Q_p ≅ H⁰(X_{Q_p}, Ω¹)^*, ρ(J) ≥ 2, and p a prime of good reduction. Let Z_1, …, Z_k be nice classes and (θ_j, Υ_j) the quadratic Chabauty pairs of NC.5 with endomorphism E_j, constant c_j and pairing B_j (BDMTV Lemma 3.7, with Υ_j = {0} under potentially good reduction everywhere, Corollary 3.8). Suppose given: (a) a finite set L ⊆ X(Q) of verified rational points containing b and points P_1, …, P_m such that AJ_b(P_i) ⊗ (E_j(AJ_b(P_i)) + c_j) span E (or E_K = H⁰(Ω¹)^* ⊗_{K_p} H⁰(Ω¹)^* when the heights are K-equivariant); (b) for every x̄ ∈ X(F_p) and every choice (α_1, …, α_k) ∈ Υ_1 × ⋯ × Υ_k, a qc-disc-certificate on ]x̄[ for the family (det T_{j,α_j})_{j ≤ k} of the determinant criterion, whose power-series coefficients are computed by local-height-at-p and Coleman integration to the precision certified by height-series-valuation-bound; (c) for every centre of every disc certificate, a matching with an element of L or an exclusion. Then X(Q) = L, an unconditional certified solution set given the stated rank and Picard hypotheses (which are themselves certified inputs). If (b) or (c) fails for some disc, only L ⊆ X(Q) is asserted. The rational-point carrier is Hom_Q(Spec Q,X) and its injective image in Hom_Qp(Spec Q_p,X_Qp); residue discs are fibres of reduction from the chosen smooth proper Z_p-model. Require chart identifications with Z_p, actual NC.5 height/cycle/logarithm semantics for every determinant series, complete choices of away-from-p height values, finite coefficient/tail/tree certificates whose check_sound yields covers/uniqueness, and genuine geometric matching/sieve exclusions. If rank or supplier assertions remain conditional, the conclusion retains their conjunction as its label. QCRun.rational_eq_of_matched is only the final set-theoretic implication.

EffectiveDiophantineMethods:ED.6/explicit-setup
Names: TauCeti.EffectiveDiophantine.ED6.ExplicitSetup, TauCeti.EffectiveDiophantine.ED6.ExplicitSetup.residue_injective, TauCeti.EffectiveDiophantine.ED6.ExplicitSetup.cupMatrix_eq, TauCeti.EffectiveDiophantine.ED6.ExplicitSetup.functionField, TauCeti.EffectiveDiophantine.ED6.ExplicitSetup.tateFrobenius
Reason: The actual geometric supplier carriers and comparison maps are unavailable at the pinned baseline. The separately named matrix/set helper does not state this theorem.
Required mathematical signature: Over Q, take a smooth projective geometrically connected curve X of genus g≥2, a nonempty reduced boundary divisor D of degree d=#D(Qbar) and affine open Y=X−D, b∈Y(Q), a good prime p and a smooth Z_p-model with integral b. Put A=Γ(Y,O_Y), K=Q(X)=Frac(A). Choose a finite Galois splitting field L for D and uniformizers t_x identifying completed local rings at x∈D(L) with L[[t_x]] and their fraction fields with L((t_x)); expansions must be the maps induced by K⊗L, not arbitrary Laurent-family maps. Choose ω_0,…,ω_{2g+d−2} in Ω¹(Y/Q) whose classes form a basis of H¹_dR(Y), the first2g of the second kind, the firstg a basis of H⁰(X,Ω¹), with cup matrix C=[[0,I],[-I,0]], and third-kind complement with residue map an isomorphism onto {(r_x):Σr_x=0}. Put V_dR=H¹_dR(X)^* with dual basis T_i. Take nonzero rational tensor Z with antisymmetry, lower-right g×g block0 and zero cup contraction; under crystalline/de Rham comparison require Frobenius weight p, in coordinates FᵀZF=pZ. For height applications additionally supply an actual nice correspondence whose cycle class is Z; do not infer a rational algebraic cycle from these linear/Frobenius conditions. Outputs are these actual identified geometric data, residue injectivity for the third-kind span and the displayed actual cup pairing; the separate ExplicitSetupLinearData only stores matrices.

EffectiveDiophantineMethods:ED.6/explicit-connection
Names: TauCeti.EffectiveDiophantine.ED6.ExplicitSetup.eta_existsUnique
Reason: The actual geometric supplier carriers and comparison maps are unavailable at the pinned baseline. The separately named matrix/set helper does not state this theorem.
Required mathematical signature: Over Q, take a smooth projective geometrically connected curve X of genus g≥2, a nonempty reduced boundary divisor D of degree d=#D(Qbar) and affine open Y=X−D, b∈Y(Q), a good prime p and a smooth Z_p-model with integral b. Put A=Γ(Y,O_Y), K=Q(X)=Frac(A). Choose a finite Galois splitting field L for D and uniformizers t_x identifying completed local rings at x∈D(L) with L[[t_x]] and their fraction fields with L((t_x)); expansions must be the maps induced by K⊗L, not arbitrary Laurent-family maps. Choose ω_0,…,ω_{2g+d−2} in Ω¹(Y/Q) whose classes form a basis of H¹_dR(Y), the first2g of the second kind, the firstg a basis of H⁰(X,Ω¹), with cup matrix C=[[0,I],[-I,0]], and third-kind complement with residue map an isomorphism onto {(r_x):Σr_x=0}. Put V_dR=H¹_dR(X)^* with dual basis T_i. Take nonzero rational tensor Z with antisymmetry, lower-right g×g block0 and zero cup contraction; under crystalline/de Rham comparison require Frobenius weight p, in coordinates FᵀZF=pZ. For height applications additionally supply an actual nice correspondence whose cycle class is Z; do not infer a rational algebraic cycle from these linear/Frobenius conditions. Import NC.2 universal pointed A²_dR and NC.5 its pushout A_Z along V_dR⊗²→Q(1), factoring through coker(cup*). Construct s0:(Q⊕V_dR⊕Q(1))⊗O_Y≅A_Z|Y and the unique η in span(ω_{2g},…,ω_{2g+d−2}) such that ∇=d−[[0,0,0],[ω,0,0],[η,ωᵀZ,0]] extends nonsingularly over X. For dΩ_x=−ω, its actual residue conditions are Res_x(Ω_xᵀZ dΩ_x−η)=0. Existence uses the universal quotient extending over X and total-residue/cup compatibility; the sum-zero matrix solver alone proves only uniqueness/linear solvability. The result includes the geometric extension, trivialization and η, with gauges C_x and g_x in L((t_x)), dg_x=Ω_xᵀZ dΩ_x−η.

EffectiveDiophantineMethods:ED.6/hodge-filtration-explicit
Names: TauCeti.EffectiveDiophantine.ED6.hodgeFiltration_basis
Reason: The actual geometric supplier carriers and comparison maps are unavailable at the pinned baseline. The separately named matrix/set helper does not state this theorem.
Required mathematical signature: Over Q, take a smooth projective geometrically connected curve X of genus g≥2, a nonempty reduced boundary divisor D of degree d=#D(Qbar) and affine open Y=X−D, b∈Y(Q), a good prime p and a smooth Z_p-model with integral b. Put A=Γ(Y,O_Y), K=Q(X)=Frac(A). Choose a finite Galois splitting field L for D and uniformizers t_x identifying completed local rings at x∈D(L) with L[[t_x]] and their fraction fields with L((t_x)); expansions must be the maps induced by K⊗L, not arbitrary Laurent-family maps. Choose ω_0,…,ω_{2g+d−2} in Ω¹(Y/Q) whose classes form a basis of H¹_dR(Y), the first2g of the second kind, the firstg a basis of H⁰(X,Ω¹), with cup matrix C=[[0,I],[-I,0]], and third-kind complement with residue map an isomorphism onto {(r_x):Σr_x=0}. Put V_dR=H¹_dR(X)^* with dual basis T_i. Take nonzero rational tensor Z with antisymmetry, lower-right g×g block0 and zero cup contraction; under crystalline/de Rham comparison require Frobenius weight p, in coordinates FᵀZF=pZ. For height applications additionally supply an actual nice correspondence whose cycle class is Z; do not infer a rational algebraic cycle from these linear/Frobenius conditions. With the actual gauges of the mixed connection, use the principal-parts exact sequence 0→L→Γ(Y_L,O)→⊕_{x∈D(L)} L((t_x))/L[[t_x]]→H¹(X_L,O)→0 and H¹_dR(X_L)/Fil¹≅H¹(X_L,O). The principal parts of the primitives of ω_g,…,ω_{2g−1} map to a basis of the last group. For N=(0,I)ᵀ prove existence and uniqueness of γ∈Γ(Y,O), b_Fil∈Q^g with γ(b)=0 and g_x+γ−b_FilᵀNᵀΩ_x−Ω_xᵀZNNᵀΩ_x regular at every boundary point. Descend from L by uniqueness. Prove that the subbundle spanned by1+γS,T_g+b_gS,…,T_{2g−1}+b_{2g−1}S extends over X and satisfies Hadian’s transversality, exact-sequence and pointed-identity conditions; hence it equals Fil⁰A_Z. Return the actual filtered isomorphism sFil with βFil=(0,b_Fil), not just a solution to a Laurent linear system.

EffectiveDiophantineMethods:ED.6/hodge-filtration-algorithm
Names: TauCeti.EffectiveDiophantine.ED6.HodgeFiltrationData.geometricFactory, hodgeData_xs13_Z1_beta
Reason: Actual function field, Laurent charts and sufficient truncation orders are missing; previous tests assumed the printed answer.
Required mathematical signature: Use the actual affine coordinate ring/function field, boundary points and uniformizers, exact Laurent expansions of ΩᵀZdΩ and ΩᵀZNNᵀΩ. Derive product/primitive pole bounds and the finite function space for γ; compute residues and solve finite linear systems, then verify conditions(30),(32) and base normalization. For xs13 use H⁰(O(2D)) with basis1,x,y,x²,xy,y² and replay actual principal parts, without href₁/href₂ assuming the Hodge answer. Largest individual differential pole alone is not enough.

EffectiveDiophantineMethods:ED.6/frobenius-structure-matrix
Names: TauCeti.EffectiveDiophantine.ED6.frobeniusStructure_eq
Reason: The actual geometric supplier carriers and comparison maps are unavailable at the pinned baseline. The separately named matrix/set helper does not state this theorem.
Required mathematical signature: Over Q, take a smooth projective geometrically connected curve X of genus g≥2, a nonempty reduced boundary divisor D of degree d=#D(Qbar) and affine open Y=X−D, b∈Y(Q), a good prime p and a smooth Z_p-model with integral b. Put A=Γ(Y,O_Y), K=Q(X)=Frac(A). Choose a finite Galois splitting field L for D and uniformizers t_x identifying completed local rings at x∈D(L) with L[[t_x]] and their fraction fields with L((t_x)); expansions must be the maps induced by K⊗L, not arbitrary Laurent-family maps. Choose ω_0,…,ω_{2g+d−2} in Ω¹(Y/Q) whose classes form a basis of H¹_dR(Y), the first2g of the second kind, the firstg a basis of H⁰(X,Ω¹), with cup matrix C=[[0,I],[-I,0]], and third-kind complement with residue map an isomorphism onto {(r_x):Σr_x=0}. Put V_dR=H¹_dR(X)^* with dual basis T_i. Take nonzero rational tensor Z with antisymmetry, lower-right g×g block0 and zero cup contraction; under crystalline/de Rham comparison require Frobenius weight p, in coordinates FᵀZF=pZ. For height applications additionally supply an actual nice correspondence whose cycle class is Z; do not infer a rational algebraic cycle from these linear/Frobenius conditions. Over Q_p take an actual strict neighborhood of the tube ]U[ in Y^an, its overconvergent structure sheaf, an overconvergent Frobenius lift φ reducing to p-power Frobenius, and a Teichmüller b0 in b’s disc. In the s0 coordinates of A_Z^rig, compute φ*ω=Fω+df with f(b0)=0, and FᵀZF=pZ. Define g0=−FᵀZf, ξ=(φ*ω)ᵀZf+φ*η−pη−g0ᵀω, and use actual rigid-cohomology reduction ξ=cᵀω+dh, h(b0)=0, to put g=g0+c. Identify the resulting G=[[1,0,0],[f,F,0],[h,gᵀ,p]] with Φ_Z⁻¹: ΛφG+dG=GΛ, and normalization1↦1 at b0. Uniqueness is among the graded-compatible morphisms of the actual pointed universal quotient. For the actual Frobenius Φ_Z the graded matrix is diag(1,F⁻¹,p⁻¹), while G has graded matrix diag(1,F,p). RD.7 must return coefficient, exactness and precision certificates for these actual overconvergent sections.

EffectiveDiophantineMethods:ED.6/frobenius-equivariant-splitting
Names: TauCeti.EffectiveDiophantine.ED6.frobeniusSplitting_eq
Reason: The actual geometric supplier carriers and comparison maps are unavailable at the pinned baseline. The separately named matrix/set helper does not state this theorem.
Required mathematical signature: Over Q, take a smooth projective geometrically connected curve X of genus g≥2, a nonempty reduced boundary divisor D of degree d=#D(Qbar) and affine open Y=X−D, b∈Y(Q), a good prime p and a smooth Z_p-model with integral b. Put A=Γ(Y,O_Y), K=Q(X)=Frac(A). Choose a finite Galois splitting field L for D and uniformizers t_x identifying completed local rings at x∈D(L) with L[[t_x]] and their fraction fields with L((t_x)); expansions must be the maps induced by K⊗L, not arbitrary Laurent-family maps. Choose ω_0,…,ω_{2g+d−2} in Ω¹(Y/Q) whose classes form a basis of H¹_dR(Y), the first2g of the second kind, the firstg a basis of H⁰(X,Ω¹), with cup matrix C=[[0,I],[-I,0]], and third-kind complement with residue map an isomorphism onto {(r_x):Σr_x=0}. Put V_dR=H¹_dR(X)^* with dual basis T_i. Take nonzero rational tensor Z with antisymmetry, lower-right g×g block0 and zero cup contraction; under crystalline/de Rham comparison require Frobenius weight p, in coordinates FᵀZF=pZ. For height applications additionally supply an actual nice correspondence whose cycle class is Z; do not infer a rational algebraic cycle from these linear/Frobenius conditions. On the actual fibre x0* A_Z at a Teichmüller point x0, prove that the unique Frobenius-compatible unipotent splitting S=s0⁻¹sφ has α=(I−F)⁻¹f(x0), βᵀ=g(x0)ᵀ(F−pI)⁻¹, γ=(g(x0)ᵀα+h(x0))/(1−p). Its precise intertwining identity is G(x0)S=S diag(1,F,p), equivalently Φ_Z(x0)S=S diag(1,F⁻¹,p⁻¹). Weil weights prove invertibility of I−F,F−pI,1−p. For actual fibres at general b,x, Besser path transport gives S(b,x)=L(I(x0,x))R(I(b,b0))S(b0,x0); hence α(b,x)=∫_b^xω. The tuple solver alone does not identify any fibre or Coleman integral.

EffectiveDiophantineMethods:ED.6/local-height-at-p
Names: TauCeti.EffectiveDiophantine.ED6.localHeight, TauCeti.EffectiveDiophantine.ED6.localHeight_eq
Reason: The actual geometric supplier carriers and comparison maps are unavailable at the pinned baseline. The separately named matrix/set helper does not state this theorem.
Required mathematical signature: Over Q, take a smooth projective geometrically connected curve X of genus g≥2, a nonempty reduced boundary divisor D of degree d=#D(Qbar) and affine open Y=X−D, b∈Y(Q), a good prime p and a smooth Z_p-model with integral b. Put A=Γ(Y,O_Y), K=Q(X)=Frac(A). Choose a finite Galois splitting field L for D and uniformizers t_x identifying completed local rings at x∈D(L) with L[[t_x]] and their fraction fields with L((t_x)); expansions must be the maps induced by K⊗L, not arbitrary Laurent-family maps. Choose ω_0,…,ω_{2g+d−2} in Ω¹(Y/Q) whose classes form a basis of H¹_dR(Y), the first2g of the second kind, the firstg a basis of H⁰(X,Ω¹), with cup matrix C=[[0,I],[-I,0]], and third-kind complement with residue map an isomorphism onto {(r_x):Σr_x=0}. Put V_dR=H¹_dR(X)^* with dual basis T_i. Take nonzero rational tensor Z with antisymmetry, lower-right g×g block0 and zero cup contraction; under crystalline/de Rham comparison require Frobenius weight p, in coordinates FᵀZF=pZ. For height applications additionally supply an actual nice correspondence whose cycle class is Z; do not infer a rational algebraic cycle from these linear/Frobenius conditions. Fix the actual NC.5 mixed extension A_Z(b,x), idèle class character χ with chosen p-adic logarithm branch, its additive factor χ_p on Q_p after the logarithm, and a splitting s of V_dR/Fil⁰V_dR with complementary projectors s1,s2. Use the cycle-compatible filtered φ-module comparison D_cris(A_Z(b,x))≅x* A_Z. For the actual Hodge and Frobenius splittings prove Nekovář h_p(A_Z(b,x))=χ_p(γφ−γFil−βφᵀs1(αφ)−βFilᵀs2(αφ)). Identify this locally analytic function with θ_Z in NC.5 and its actual convergent residue-disc expansion. The expression and quotient-coordinate helper are not a definition of the geometric height.

EffectiveDiophantineMethods:ED.6/base-point-change
Names: TauCeti.EffectiveDiophantine.ED6.baseChange_splitting_eq
Reason: The actual geometric supplier carriers and comparison maps are unavailable at the pinned baseline. The separately named matrix/set helper does not state this theorem.
Required mathematical signature: Over Q, take a smooth projective geometrically connected curve X of genus g≥2, a nonempty reduced boundary divisor D of degree d=#D(Qbar) and affine open Y=X−D, b∈Y(Q), a good prime p and a smooth Z_p-model with integral b. Put A=Γ(Y,O_Y), K=Q(X)=Frac(A). Choose a finite Galois splitting field L for D and uniformizers t_x identifying completed local rings at x∈D(L) with L[[t_x]] and their fraction fields with L((t_x)); expansions must be the maps induced by K⊗L, not arbitrary Laurent-family maps. Choose ω_0,…,ω_{2g+d−2} in Ω¹(Y/Q) whose classes form a basis of H¹_dR(Y), the first2g of the second kind, the firstg a basis of H⁰(X,Ω¹), with cup matrix C=[[0,I],[-I,0]], and third-kind complement with residue map an isomorphism onto {(r_x):Σr_x=0}. Put V_dR=H¹_dR(X)^* with dual basis T_i. Take nonzero rational tensor Z with antisymmetry, lower-right g×g block0 and zero cup contraction; under crystalline/de Rham comparison require Frobenius weight p, in coordinates FᵀZF=pZ. For height applications additionally supply an actual nice correspondence whose cycle class is Z; do not infer a rational algebraic cycle from these linear/Frobenius conditions. For b′∈X(Q_p) in a pole-free residue disc, use the actual NC.2/Besser path isomorphism v↦I(b,b′)vI(b′,b). On A_Z obtain βFil(b′)=βFil(b), γFil(b′,x)=γFil(b,x)−γFil(b,b′), and S(b′,b′)=[[1,0,0],[0,I,0],[0,βφ(b,b)ᵀ+2∫_b^{b′}ωᵀZ,1]]. These identities together with Coleman integrals and tiny integrals compute the local height on the b′ disc even when the original Frobenius lift is absent there. Global rational-point/NC.5 comparisons require rational b′ and transport of the endomorphism, Chow–Heegner constant and away-from-p height data; do not claim equality of the individual scalar height functions for different base points. Assert invariance of the underlying identified Chabauty–Kim locus, supplied by NC.5, rather than invariance of every auxiliary zero set.

EffectiveDiophantineMethods:ED.6/height-series-valuation-bound
Names: TauCeti.EffectiveDiophantine.ED6.valuation_coeff_ge, TauCeti.EffectiveDiophantine.ED6.qcValuation_lowDegree, TauCeti.EffectiveDiophantine.ED6.qcValuation_branchBoundary, TauCeti.EffectiveDiophantine.ED6.qcValuation_zeroCoefficient
Reason: Actual geometric series/coefficient semantics and the full finite precision derivation are unavailable; a bound for arbitrary formal iterated integrals is only one supporting component.
Required mathematical signature: For the actual QC function ρ=h−h_p on D⊂X(Q_p)∩]U[, under BDMTV2021§4 standing hypotheses (p-integral F,Z and local expansions of ω,ωᵀZ; fixed End(J)-equivariant Hodge splitting), choose t at x1∈D, t(D)⊂pZ_p and Teichmüller x0. Use ord_p(0)=∞; for matrices/vectors use the minimum of entry valuations, including the diagonal1 of λφ so c1≤0. Certify c1=ord_p(λφ(x1)) by Frobenius evaluation and path-transport precision, v_spl=min valuation of the splitting coefficients, b=ord_p(βFil), a=ord_p(γFil), c2=min{0,v_spl,b,v_spl+b}, and c3=min_j ord_p(d_j) for the genuine global-height expansion h=Σd_jΨ_j. Let d_i(η) be certified lower bounds for the actual degree i−1 coefficient of η (all coefficient/coordinate changes included); the source uses a finite polynomial-coefficient branch and0 after its degree bound, whose sufficiency must be proved for the actual model. With ℓ_i=⌊log_p i⌋ for i≥1 put φ(i)=−ℓ_i+min{d_i(η),−ℓ_i}. The branches are φ(i)=d_i(η)−ℓ_i if d_i(η)<−ℓ_i, otherwise φ(i)=−2ℓ_i; the λφ coefficients have lower bound φ(i)+c1. Explicitly certify i0≥1 such that for every i≥i0, −ℓ_i≤d_i(η), 2(−ℓ_i)≤b and 2(−ℓ_i)≤a−c2 (the floor-half inequalities on publishedp1136). Then ord_p(ρ_i)≥−2ℓ_i+c1+min{c2,c3} for i≥i0 (Proposition4.6). Coefficients0≤i<i0 require their own finite valuation certificates; all-zero βFil,γFil or global-height coefficients use∞ and omit vacuous comparisons instead of assigning integer0. The actual coordinate/differential estimates and algebraic cancellations proving this height bound remain obligations; do not derive it solely from arbitrary matrices or assume the final coefficient inequality. For the elementary single/double-integral estimate of BDMTV2019pp932–933 retain the separate helper iteratedIntegral_valuation_coeff_ge. The source notation φ in preprintv4p24 has an extra+c1 corrected in publishedp1136; use publishedφ and addc1 once to the splitting bound. This is Proposition4.6, not Proposition4.1; the latter evaluates G(P). Regression contracts: qcValuation_lowDegree rejects applying the tail formula to i<i0; qcValuation_branchBoundary identifies both formulas at d_i(η)=−floor(log_p i); qcValuation_zeroCoefficient uses∞ and does not call Padic.valuation(0).

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

EffectiveDiophantineMethods:ED.6/xs13-tate-classes
Names: TauCeti.EffectiveDiophantine.ED6.xs13_tateClasses_admissible
Reason: The actual geometric supplier carriers and comparison maps are unavailable at the pinned baseline. The separately named matrix/set helper does not state this theorem.
Required mathematical signature: For the actual Q-curve X_s(13) identified with xs13Quartic=0, its Jacobian J, the actual symplectic de Rham basis of the first chart and actual Hecke correspondences T7,T11 defined overQ, certify their exact matrices A7,A11. The trace-zero symmetric correspondences6T_q−tr(A_q)Id have zero cup contraction; construct their actual tensor cycle classes Z_q=(6A_q−tr(A_q)I)C⁻¹ and identify them entrywise with xs13Z1,xs13Z2. Prove these classes are nonzero, independent, in Fil¹, antisymmetric and cup-trivial and satisfy F_pᵀZ_qF_p=pZ_q after crystalline comparison at every prime of good reduction, in particular p=17. Exact Hecke reconstruction requires CN.3 bounds or q-expansion/duality certification; a finite p-adic approximation and the b–d checks alone do not supply condition(a).

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

EffectiveDiophantineMethods:ED.6/xs13-rational-points
Names: TauCeti.EffectiveDiophantine.ED6.xs13_rationalPoints
Reason: The actual geometric supplier carriers and comparison maps are unavailable at the pinned baseline. The separately named matrix/set helper does not state this theorem.
Required mathematical signature: On X_s(13)(Q)=Hom_Q(Spec Q,X_s(13)), use the certified R13.4a isomorphism to the smooth projective quartic xs13Quartic=0 in P²_Q. Let P_i be the projective classes of xs13Points(i), i=0,…,6. Prove X_s(13)(Q)={P_i}, with all seven distinct, by the actual seventeen first-chart discs, two second-chart discs and P0 disc at17, using the named geometric factory results. Through the actual modular j-map the set is one cusp and six CM points of discriminants−3,−4,−12,−16,−27,−43 and j-values0,1728,54000,287496,−12288000,−884736000. Require the j=0,1728 special-fibre moduli comparisons; no point-by-point matching of P_i to discriminants is claimed without the explicit j-map. The final mathematical theorem is unconditional; until rank/model/path/zero-table suppliers are discharged, its certificate carries their explicit conjunction. The arbitrary three-set union lemma is only the assembly argument.

EffectiveDiophantineMethods:ED.6/nonsplit-cartan-13
Names: TauCeti.EffectiveDiophantine.ED6.xns13_rationalPoints_card
Reason: The actual geometric supplier carriers and comparison maps are unavailable at the pinned baseline. The separately named matrix/set helper does not state this theorem.
Required mathematical signature: For the actual modular Q-curve X_ns(13) and its rational-point carrier Hom_Q(SpecQ,X_ns(13)), construct Baran’s Q-isomorphism to X_s(13) from the certified two quartic models and projective GL3(Q) coordinate change. Transport the seven-point theorem to get #X_ns(13)(Q)=7. Through its own modular j-map, independently construct the seven CM points above discriminants−7,−8,−11,−19,−28,−67,−163; prove their distinctness and exhaustiveness. These have j-values−3375,8000,−32768,−884736,16581375,−147197952000,−262537412640768000 respectively. Do not give Baran’s isomorphism a modular interpretation or assert it preserves j. The unconstructed X_ns quartic/map and CM/moduli comparison remain supplier obligations, not an arbitrary finite-type equivalence hypothesis.

EffectiveDiophantineMethods:ED.6/xs4-13-rational-points
Names: TauCeti.EffectiveDiophantine.ED6.xS4_13_rationalPoints
Reason: The actual geometric supplier carriers and comparison maps are unavailable at the pinned baseline. The separately named matrix/set helper does not state this theorem.
Required mathematical signature: For the actual modular curve X_S4(13), identified with the smooth projective quartic xS4_13Quartic=0, prove its Q-points are exactly the four projective classes xS4_13Points: (1:3:−2),(0:0:1),(0:1:0),(1:0:0). The point(0:0:1) is CM of discriminant−3; the other three have projective mod13 imageS4, with the three j-values stated in this node. Inputs to the proof are the genuine isogeny to J_s(13), potential-good-reduction result, actual two affine patches from BDMTVv4§5.1p26, p=11,T11 andT11² classes, four-point height pairing, and certified complete common-zero/matching tables on every disc. The final theorem is unconditional; missing supplier proofs and unreplayed computations are recorded gaps. An arbitrary QCRun whose output is already assumed complete is not the application.

EffectiveDiophantineMethods:ED.6/x0plus-genus-three-points
Names: TauCeti.EffectiveDiophantine.ED6.x0plus_genusThree_rationalPoints
Reason: The actual geometric supplier carriers and comparison maps are unavailable at the pinned baseline. The separately named matrix/set helper does not state this theorem.
Required mathematical signature: For each N∈{97,109,113,127,139,149,151,179,239}, let X=X0(N)/⟨w_N⟩ be the actual coarse smooth projective Q-curve and identify it with the corresponding explicit plane quartic in BDMTVv4 Examples5.7–5.15pp31–32. Prove equality of its Hom_Q(SpecQ,X) with exactly the projective classes in the following ordered source lists, with cusp/CM identification through the quotient modular interpretation (not a single descended j-map on X0+(N)). N=97, p=5: Q_N=zx³+(−y²+zy)x²+(−y³−zy²−z³)x+zy³+z²y²=0; ordered points (1:0:0),(-2:1:1),(-1:0:1),(0:0:1),(0:1:0),(0:-1:1),(1:0:1),(1:1:1),(-1:1:0),(5:3:2); first point is the cusp, remaining CM discriminants in order -3,-4,-8,-11,-12,-16,-27,-43,-163. N=109, p=29: Q_N=zx³+(zy+z²)x²+(−y³−zy²−z³)x−zy³−3z²y²−2z³y=0; ordered points (1:0:0),(-2:1:2),(0:-2:1),(0:-1:1),(0:1:0),(0:0:1),(-1:-1:1),(-2:1:1),(1:-1:1); first point is the cusp, remaining CM discriminants in order -3,-4,-7,-12,-16,-27,-28,-43. N=113, p=17: Q_N=zx³+(−y²−z²)x²+(y³+z³)x−2z²y²+z³y=0; ordered points (1:0:0),(2:2:1),(0:1:0),(1:1:1),(1:1:0),(0:0:1),(0:1:2),(5:3:1); first point is the cusp, remaining CM discriminants in order -4,-7,-8,-11,-16,-28,-163. N=127, p=11: Q_N=zx³+(−y²−3z²)x²+(y³−z²y+4z³)x+2zy³−3z²y²+3z³y−2z⁴=0; ordered points (1:0:0),(5:3:2),(2:1:1),(1:1:0),(1:0:1),(0:1:1),(0:1:0),(4:2:1); first point is the cusp, remaining CM discriminants in order -3,-7,-12,-27,-28,-43,-67. N=139, p=19: Q_N=zx³+(−y²+zy)x²+(−y³−2zy²−3z²y−z³)x+y⁴+zy³+z²y²+z³y=0; ordered points (1:0:0),(4:-3:1),(0:0:1),(0:-1:1),(1:-1:1),(1:0:1),(-1:0:1); first point is the cusp, remaining CM discriminants in order -3,-8,-12,-19,-27,-43. N=149, p=11: Q_N=zx³−y²x²+(y³+zy²−2z²y−z³)x−y⁴+zy³+z²y²−z³y=0; ordered points (1:0:0),(-1:0:1),(0:1:1),(1:0:1),(0:0:1),(0:-1:1),(2:2:1); first point is the cusp, remaining CM discriminants in order -4,-7,-16,-19,-28,-67. N=151, p=19: Q_N=zx³+(−2zy+z²)x²+(−y³+2zy²)x−zy³+3z²y²−z³y−2z⁴=0; ordered points (1:0:0),(-2:-2:1),(0:1:0),(0:2:1),(1:1:1),(2:3:2),(1:0:1),(3:2:1); first point is the cusp, remaining CM discriminants in order -3,-7,-12,-27,-28,-67,-163. N=179, p=17: Q_N=zx³+(−2zy−z²)x²+(−y³−zy²−2z²y−z³)x−zy³+z³y=0; ordered points (1:0:0),(0:-1:1),(0:1:0),(0:0:1),(0:1:1),(-2:2:1); first point is the cusp, remaining CM discriminants in order -7,-8,-11,-28,-163. N=239, p=13: Q_N=zx³+(−y²+zy+z²)x²+(−y³−zy²−z²y)x+y⁴+3zy³+2z²y²+z³y=0; ordered points (1:0:0),(-1:0:1),(0:0:1),(1:-2:1),(1:-1:1); first point is the cusp, remaining CM discriminants in order -7,-19,-28,-43. The source counts are10,9,8,8,7,7,8,6,5 respectively. Require genuine rank/logarithm, endomorphism, model/reduction, local-height and two-cycle coefficient/zero/matching certificates for each N. Retain the modular rank-overQ and numerical replay gaps; do not generalize the ten-point97 helper to every level.

-/
