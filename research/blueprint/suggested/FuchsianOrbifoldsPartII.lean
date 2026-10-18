import Mathlib.Analysis.Complex.UpperHalfPlane.Metric
import Mathlib.Analysis.SpecialFunctions.Arsinh
import Mathlib.Algebra.Group.Subgroup.Lattice
import TauCeti.Analysis.Complex.UpperHalfPlane.PSLAction
import TauCeti.Analysis.Complex.UpperHalfPlane.Measure
import TauCeti.NumberTheory.Modular

/-!
# Nielsen cores and quadratic-class surfaces: suggested signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`research/blueprint/readmes/FuchsianOrbifoldsPartII.md`. These signatures suggest forms for
milestones statable at Mathlib 082e2d3 and Tau Ceti f790474. Discharging them finishes neither a
layer nor the roadmap. All theorem/example proofs are placeholders; no implementation is claimed.

The full definitions of the ideal compactification, convex core, bordered orbifold, reflected
double, class-indexed pushforward measure and cusp-truncated integral belong in the reader.
Their required carriers are absent at the pins. This file contains only real-bodied lightweight
expressions over existing carriers, selected milestone statements and a few discriminating
examples, following WORKERS.md's 2026-10-12 shape rule. It constructs no replacement carriers.

Conventions: effective PSL, S(z)=-1/z, T(z)=z+1; curvature -1 distance and area; minus digits
at least 2 with some digit larger than 2; closed Ford inequalities. The boundary word in SL
has eigenvalue epsilon_D>1 and translation length 2*log epsilon_D. Lift spacings below are
upper-half-plane distances, not intrinsic distances between quotient cone points.

Source locators: Duke–Imamoḡlu–Tóth, Annals 184 (2016), §2 pp.952–953, §3 pp.954–959,
Theorem 1 and Figure 7; measure and Stokes endpoints are reader targets in N.4–N.5.
-/

noncomputable section

open scoped MatrixGroups UpperHalfPlane

namespace TauCetiRoadmap.FuchsianOrbifoldsPartII

/-- N.0/bordered-signature: the scalar area expression, not a surface classification. -/
def orbifoldAreaExpr (g : ℕ) (orders : List ℕ) (s t : ℕ) : ℝ :=
  2 * Real.pi * (2 * (g : ℝ) - 2 + (s : ℝ) + (t : ℝ) +
    (orders.map (fun m => (1 : ℝ) - (m : ℝ)⁻¹)).sum)

theorem orbifoldAreaExpr_perm {orders orders' : List ℕ} (g s t : ℕ)
    (h : orders.Perm orders') :
    orbifoldAreaExpr g orders s t = orbifoldAreaExpr g orders' s t := by
  sorry

/-- Scalar compatibility for the reflected double; the actual double is a reader target. -/
theorem orbifoldAreaExpr_double (g s t : ℕ) (orders : List ℕ) (ht : 1 ≤ t) :
    orbifoldAreaExpr (2 * g + t - 1) (orders ++ orders) (2 * s) 0 =
      2 * orbifoldAreaExpr g orders s t := by
  sorry

example : orbifoldAreaExpr 0 [2, 3] 1 0 = Real.pi / 3 := by
  sorry

example (ell : ℕ) :
    orbifoldAreaExpr 0 (List.replicate ell 2) 1 1 = Real.pi * ell := by
  sorry

example : orbifoldAreaExpr 0 [] 0 3 = 2 * Real.pi := by
  sorry

example : orbifoldAreaExpr 0 [] 1 0 = -2 * Real.pi := by
  sorry

/-- N.1/cycle-group: raw lists are allowed in the lightweight formulas below;
all geometric milestones impose this digit condition. Arithmetic periods are also primitive. -/
def AdmissibleCycle (ns : List ℕ) : Prop :=
  ns ≠ [] ∧ (∀ n ∈ ns, 2 ≤ n) ∧ ∃ n ∈ ns, 2 < n

/-- Prefix N_k, with N_0=0. Integer exponents avoid truncated subtraction. -/
def cyclePrefix (ns : List ℕ) (k : ℕ) : ℤ :=
  ((ns.take k).sum : ℤ)

/-- The projective integral translation by an integer. -/
def projectiveTranslation (a : ℤ) : PSL(2, ℤ) :=
  ↑(ModularGroup.T ^ a)

/-- The actual projective half-turn at a+i; the determinant-one lift squares to -I. -/
def cycleInvolution (a : ℤ) : PSL(2, ℤ) :=
  ↑(ModularGroup.T ^ a * ModularGroup.S * ModularGroup.T ^ (-a))

/-- The height-one point, expressed in the existing upper-half-plane carrier. -/
def heightOne (x : ℝ) : ℍ :=
  ⟨⟨x, 1⟩, zero_lt_one⟩

/-- N.1/cycle-group, using S_1,...,S_ell and T^m. -/
def cycleGroup (ns : List ℕ) : Subgroup PSL(2, ℤ) :=
  Subgroup.closure
    (Set.range (fun k : Fin ns.length => cycleInvolution (cyclePrefix ns (k.val + 1))) ∪
      {projectiveTranslation (ns.sum : ℤ)})

theorem cyclePrefix_zero (ns : List ℕ) : cyclePrefix ns 0 = 0 := by
  sorry

theorem cyclePrefix_length (ns : List ℕ) : cyclePrefix ns ns.length = (ns.sum : ℤ) := by
  sorry

theorem cyclePrefix_step (ns : List ℕ) (k : Fin ns.length) :
    cyclePrefix ns (k.val + 1) = cyclePrefix ns k.val + (ns[k.val] : ℤ) := by
  sorry

theorem cycleInvolution_order (a : ℤ) :
    cycleInvolution a ^ 2 = 1 ∧ cycleInvolution a ≠ 1 := by
  sorry

theorem cycleInvolution_fixed (a : ℤ) :
    cycleInvolution a • heightOne (a : ℝ) = heightOne (a : ℝ) := by
  sorry

theorem cycleInvolution_apply (a : ℤ) (z : ℍ) :
    ((cycleInvolution a • z : ℍ) : ℂ) = (a : ℂ) - 1 / ((z : ℂ) - (a : ℂ)) := by
  sorry

theorem cycleGroup_generators (ns : List ℕ) :
    (∀ k : Fin ns.length,
      cycleInvolution (cyclePrefix ns (k.val + 1)) ∈ cycleGroup ns) ∧
    projectiveTranslation (ns.sum : ℤ) ∈ cycleGroup ns := by
  sorry

theorem cycleGroup_alternate (ns : List ℕ) :
    cycleGroup ns = Subgroup.closure
      (Set.range (fun k : Fin ns.length => cycleInvolution (cyclePrefix ns k.val)) ∪
        {projectiveTranslation (ns.sum : ℤ)}) := by
  sorry

/-- Rotation transports subgroup membership by the specified translation conjugacy. -/
theorem cycleGroup_rotation (ns : List ℕ) (r : ℕ) (hr : r ≤ ns.length)
    (g : PSL(2, ℤ)) :
    g ∈ cycleGroup (ns.drop r ++ ns.take r) ↔
      projectiveTranslation (cyclePrefix ns r) * g *
        projectiveTranslation (-cyclePrefix ns r) ∈ cycleGroup ns := by
  sorry

/-- N.1/word-endpoints: a baseline-statable matrix identity, before the Pell dictionary. -/
theorem boundaryWord_telescope (ns : List ℕ) :
    (List.ofFn (fun k : Fin ns.length =>
      cycleInvolution (cyclePrefix ns (k.val + 1)))).prod *
        projectiveTranslation (ns.sum : ℤ) =
      (ns.map (fun n => projectiveTranslation (n : ℤ) * cycleInvolution 0)).prod := by
  sorry

example : AdmissibleCycle [4] := by
  sorry

example : AdmissibleCycle [3, 6] ∧ AdmissibleCycle [3, 2] := by
  sorry

example : ¬AdmissibleCycle [] ∧ ¬AdmissibleCycle [2] ∧ ¬AdmissibleCycle [2, 2] := by
  sorry

example : cyclePrefix [3, 6] 0 = 0 ∧ cyclePrefix [3, 6] 1 = 3 ∧
    cyclePrefix [3, 6] 2 = 9 := by
  sorry

example : cycleGroup [4] =
    Subgroup.closure {cycleInvolution 0, projectiveTranslation 4} := by
  sorry

example : cycleGroup [3, 6] = Subgroup.closure
    {cycleInvolution 0, cycleInvolution 3, projectiveTranslation 9} := by
  sorry

example : cycleGroup [] = ⊥ := by
  sorry

/-- N.1/cycle-polygon: closed strip outside the ell+1 closed unit semicircles. -/
def cyclePolygon (ns : List ℕ) : Set ℍ :=
  {z | 0 ≤ z.re ∧ z.re ≤ (ns.sum : ℝ) ∧
    ∀ k ≤ ns.length, 1 ≤ Complex.normSq ((z : ℂ) - (cyclePrefix ns k : ℂ))}

theorem cyclePolygon_mem (ns : List ℕ) (z : ℍ) :
    z ∈ cyclePolygon ns ↔ 0 ≤ z.re ∧ z.re ≤ (ns.sum : ℝ) ∧
      ∀ k ≤ ns.length, 1 ≤ Complex.normSq ((z : ℂ) - (cyclePrefix ns k : ℂ)) := by
  sorry

theorem cyclePolygon_measurable (ns : List ℕ) : MeasurableSet (cyclePolygon ns) := by
  sorry

theorem cyclePolygon_closed (ns : List ℕ) : IsClosed (cyclePolygon ns) := by
  sorry

theorem cyclePolygon_cuspStrip (ns : List ℕ) (z : ℍ) (hz : 1 ≤ z.im) :
    z ∈ cyclePolygon ns ↔ 0 ≤ z.re ∧ z.re ≤ (ns.sum : ℝ) := by
  sorry

example : heightOne 0 ∈ cyclePolygon [4] ∧ heightOne 4 ∈ cyclePolygon [4] := by
  sorry

example : heightOne 0 ∈ cyclePolygon [3, 6] ∧
    heightOne 3 ∈ cyclePolygon [3, 6] ∧ heightOne 9 ∈ cyclePolygon [3, 6] := by
  sorry

example : heightOne (-1) ∉ cyclePolygon [4] ∧ heightOne 5 ∉ cyclePolygon [4] := by
  sorry

/-- N.3/highest-elliptics: the integral denominator bound, before the core lifting argument. -/
theorem ellipticLift_im_le_one (g : SL(2, ℤ)) (a : ℤ) :
    (g • heightOne (a : ℝ)).im ≤ 1 := by
  sorry

/-- N.2/lift-spacing. This is a scalar function, not a quotient distance. -/
def liftSpacing (x : ℝ) : ℝ :=
  2 * Real.arsinh (x / 2)

theorem liftSpacing_strictMono : StrictMono liftSpacing := by
  sorry

theorem liftSpacing_log (x : ℝ) (hx : 0 ≤ x) :
    liftSpacing x = Real.log (1 + (x / 2) * (Real.sqrt (x ^ 2 + 4) + x)) := by
  sorry

theorem liftSpacing_dist (x y : ℝ) :
    dist (heightOne x) (heightOne y) = liftSpacing |x - y| := by
  sorry

example : liftSpacing 0 = 0 := by
  sorry

example : dist (heightOne 0) (heightOne 3) = liftSpacing 3 := by
  sorry

example : liftSpacing 3 < liftSpacing 6 := by
  sorry

/-- N.2/small-discriminants: the SL matrix for [3,6], including its sign convention. -/
example : (((ModularGroup.T ^ (3 : ℕ) * ModularGroup.S) *
    (ModularGroup.T ^ (6 : ℕ) * ModularGroup.S) : SL(2, ℤ)) :
      Matrix (Fin 2) (Fin 2) ℤ) = !![17, -3; 6, -1] := by
  sorry

example : orbifoldAreaExpr 0 [2, 2] 1 1 = 2 * Real.pi ∧
    orbifoldAreaExpr 0 [2, 2, 2, 2, 2] 1 1 = 5 * Real.pi := by
  sorry

/-- N.4/dit-domain: only a boundary adapter to the existing modular domain. -/
def ditDomain : Set ℍ :=
  {z | (-(1 / 2 : ℝ) ≤ z.re ∧ z.re ≤ 0 ∧ 1 ≤ Complex.normSq (z : ℂ)) ∨
    (0 < z.re ∧ z.re < (1 / 2 : ℝ) ∧ 1 < Complex.normSq (z : ℂ))}

theorem ditDomain_measurable : MeasurableSet ditDomain := by
  sorry

theorem ditDomain_ae_fdo : ditDomain =ᵐ[MeasureTheory.volume] ModularGroup.fdo := by
  sorry

example : heightOne 0 ∈ ditDomain ∧ heightOne 0 ∉ ModularGroup.fdo := by
  sorry

example : (⟨⟨-(1 / 2 : ℝ), 2⟩, by norm_num⟩ : ℍ) ∈ ditDomain ∧
    (⟨⟨(1 / 2 : ℝ), 2⟩, by norm_num⟩ : ℍ) ∉ ditDomain := by
  sorry

example : (⟨⟨-(1 / 2 : ℝ), Real.sqrt 3 / 2⟩, by positivity⟩ : ℍ) ∈ ditDomain ∧
    (⟨⟨(1 / 2 : ℝ), Real.sqrt 3 / 2⟩, by positivity⟩ : ℍ) ∉ ditDomain := by
  sorry

end TauCetiRoadmap.FuchsianOrbifoldsPartII
