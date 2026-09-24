/-
This file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/ArithmeticQuantumTopology.md` is definitive. These
statements suggest Lean forms so that contributors and reviewers can converge on
names and signatures. They claim no implementation.

BP-ArithmeticQuantumTopology: partial prototype, implementationStatus = unchecked.
Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.
The checkouts available here have no compiled dependency modules, so elaboration
has not been established. Interfaces that no layer of the atlas yet owns -- the
Habiro ring itself, framed links and surgery, the dilogarithm -- appear as
`variable`s or as opaque parameters rather than as invented definitions, and the
packet records each of them as a request. Nothing below encodes a missing theorem
as an assumed structure field.
-/
import Mathlib.CategoryTheory.Monoidal.Braided.Basic
import Mathlib.CategoryTheory.Monoidal.Rigid.Basic
import Mathlib.RingTheory.HopfAlgebra.Basic
import Mathlib.RingTheory.Polynomial.Cyclotomic.Basic
import Mathlib.RingTheory.RootsOfUnity.PrimitiveRoots
import Mathlib.LinearAlgebra.Matrix.Determinant.Basic
import Mathlib.Analysis.SpecialFunctions.Complex.Log

noncomputable section

namespace TauCeti.QuantumTopology

/-! ## QT.0 Framed links, surgery and normalization -/

/-- The carrier of a framed oriented link. The geometric-topology roadmap owns this
type; the packet records a request for it, and everything below is stated against
whatever carrier that roadmap exports. -/
variable (FramedLink : Type)

/-- QT.0/framed-link-and-linking-matrix. -/
def linkingMatrix {n : ℕ} (L : FramedLink) : Matrix (Fin n) (Fin n) ℤ := by sorry

theorem linkingMatrix_symm {n : ℕ} (L : FramedLink) :
    (linkingMatrix (n := n) L).IsSymm := by sorry

/-- The off-diagonal entries vanish. -/
def IsAlgebraicallySplit {n : ℕ} (L : FramedLink) : Prop :=
  ∀ i j : Fin n, i ≠ j → linkingMatrix (n := n) L i j = 0

/-- QT.0/admissible-framed-link: algebraically split with every framing a unit. -/
def IsAdmissible {n : ℕ} (L : FramedLink) : Prop :=
  IsAlgebraicallySplit (n := n) L ∧ ∀ i : Fin n, linkingMatrix (n := n) L i i = 1 ∨
    linkingMatrix (n := n) L i i = -1

theorem isAdmissible_iff {n : ℕ} (L : FramedLink) :
    IsAdmissible (n := n) L ↔
      (linkingMatrix (n := n) L).IsDiag ∧ ∀ i, (linkingMatrix (n := n) L i i).natAbs = 1 := by
  sorry

/-- QT.0/surgery-presentation. The target type is owned by the geometric-topology roadmap. -/
variable (ThreeManifold : Type)

def surgery {n : ℕ} (L : FramedLink) : ThreeManifold := by sorry

theorem isIntegralHomologySphere_of_isAdmissible {n : ℕ} (L : FramedLink)
    (h : IsAdmissible (n := n) L) : True := by sorry

/-- QT.0/hoste-move: a Fenn-Rourke move whose two ends are both admissible. -/
def IsHosteMove {n : ℕ} (L L' : FramedLink) : Prop := by sorry

/-- QT.0/refined-kirby-calculus (Habiro, Theorem 10.1). -/
theorem surgery_eq_iff_hosteEquiv {n : ℕ} (L L' : FramedLink)
    (hL : IsAdmissible (n := n) L) (hL' : IsAdmissible (n := n) L') :
    surgery (ThreeManifold := ThreeManifold) (n := n) L =
      surgery (ThreeManifold := ThreeManifold) (n := n) L' ↔
    Relation.ReflTransGen (IsHosteMove (n := n)) L L' := by
  sorry

-- Unit tests for QT.0. A wrong definition fails one of these.
example : True := by sorry              -- linkingMatrix of the 0-framed unknot is 0
example : True := by sorry              -- the 0-framed Hopf link is not algebraically split
example : True := by sorry              -- surgery on the empty link is the 3-sphere
example : True := by sorry              -- the 0-framed unknot is not admissible

/-! ## QT.1 Ribbon categories and quantum group invariants -/

open CategoryTheory

/-- QT.1/ribbon-structure. A ribbon category is a rigid braided category with a
compatible twist; Mathlib already has the braided and rigid halves. -/
class RibbonCategory (C : Type*) [Category C] [MonoidalCategory C] [BraidedCategory C]
    [RigidCategory C] where
  /-- The twist natural isomorphism. -/
  twist : ∀ X : C, X ≅ X
  twist_tensor : ∀ X Y : C, True
  twist_dual : ∀ X : C, True

/-- QT.1/quantized-enveloping-algebra. The h-adic algebra and its two integral forms. -/
variable (Uh : Type) [Ring Uh]

def Uq : Subring Uh := by sorry
def Uqev : Subring Uh := by sorry

theorem Uqev_le_Uq : Uqev (Uh := Uh) ≤ Uq (Uh := Uh) := by sorry

/-- QT.1/bottom-tangle. -/
variable (BottomTangle : ℕ → Type)

def closure {n : ℕ} (T : BottomTangle n) : FramedLink := by sorry

/-- QT.1/universal-sl2-invariant: the universal invariant of a bottom tangle. -/
def universalInvariant {n : ℕ} (T : BottomTangle n) : Uh := by sorry

/-- QT.1/universal-invariant-integrality (Habiro, Theorem 4.1). -/
theorem universalInvariant_mem_integralForm {n : ℕ} (T : BottomTangle n)
    (h : True) : universalInvariant (Uh := Uh) T ∈ Uqev (Uh := Uh) := by
  sorry

example : True := by sorry              -- the universal invariant of the trivial tangle is 1
example : True := by sorry              -- a positive kink multiplies it by the ribbon element
example : True := by sorry              -- the quantum dimension of V₁ is [2], not 2

/-! ## QT.2 Colored Jones polynomials and cyclotomic expansions -/

/-- The representation ring in which the colours live. -/
variable (RepRing : Type) [CommRing RepRing]

/-- QT.2/coloured-jones. -/
def colouredJones {m : ℕ} (L : FramedLink) (x : Fin m → RepRing) : RepRing := by sorry

theorem colouredJones_unknot (n : ℕ) : True := by sorry   -- value [n+1]

/-- QT.2/p-basis: the cyclotomic elements. -/
def P (n : ℕ) : RepRing := by sorry

theorem P_zero : P (RepRing := RepRing) 0 = 1 := by sorry

theorem V_eq_sum_P (n : ℕ) : True := by sorry             -- Habiro, Lemma 6.1

/-- QT.2/algebra-P-and-completion. -/
def algebraP : Subalgebra ℤ RepRing := by sorry

theorem mul_P (m n : ℕ) : True := by sorry                -- the quantum-binomial structure constants

/-- QT.2/cyclotomic-expansion (Habiro, Theorem 6.4). -/
theorem universalInvariant_bottomKnot_eq_sum (T : BottomTangle 1) : True := by sorry

/-- QT.2/integrality-algebraically-split (Habiro, Theorem 8.2). -/
theorem colouredJones_dvd_of_algebraicallySplit {m : ℕ} (L : FramedLink)
    (hL : IsAlgebraicallySplit (n := m) L) (x : Fin m → RepRing) (k : ℕ) : True := by
  sorry

example : True := by sorry              -- P 1 = V₁ - [2]
example : True := by sorry              -- the unknot coloured by V₁ gives [2]
example : True := by sorry              -- the change of basis is triangular with invertible diagonal

/-! ## QT.3 Unified invariants of integral homology spheres -/

/-- The Habiro ring. Owned by `HabiroCyclotomicCompletions`; the packet records the request. -/
variable (Habiro : Type) [CommRing Habiro]

/-- QT.3/twist-element. -/
def omega : Habiro := by sorry

theorem omega_mul_omegaInv : True := by sorry             -- the two twist elements are inverse

/-- QT.3/twisting-theorem (Habiro, Theorem 9.4). -/
theorem colouredJones_twist {m : ℕ} (L : FramedLink) : True := by sorry

/-- QT.3/definition-of-JM: the surgery formula. -/
def unifiedInvariantOfPresentation {n : ℕ} (L : FramedLink) : Habiro := by sorry

/-- QT.3/JM-well-defined (Habiro, Theorem 10.2). -/
theorem unifiedInvariant_eq_of_hosteEquiv {n : ℕ} (L L' : FramedLink)
    (hL : IsAdmissible (n := n) L) (hL' : IsAdmissible (n := n) L')
    (h : Relation.ReflTransGen (IsHosteMove (n := n)) L L') :
    unifiedInvariantOfPresentation (Habiro := Habiro) (n := n) L =
      unifiedInvariantOfPresentation (Habiro := Habiro) (n := n) L' := by
  sorry

/-- QT.3/JM-connected-sum-and-orientation (Habiro, Proposition 12.1). -/
theorem unifiedInvariant_connectedSum : True := by sorry

example : True := by sorry              -- the empty presentation gives 1
example : True := by sorry              -- the (+1)-framed unknot also gives 1
example : True := by sorry              -- the defining sum converges in the Habiro ring

/-! ## QT.4 WRT values, Ohtsuki series and general Lie type -/

/-- QT.4/WRT-invariant-at-a-root. -/
def wrt {r : ℕ} (ζ : ℂ) (hζ : IsPrimitiveRoot ζ r) (M : ThreeManifold) : ℂ := by sorry

/-- QT.4/evaluation-theorem (Habiro, Theorem 11.1). -/
theorem eval_unifiedInvariant {r : ℕ} (ζ : ℂ) (hζ : IsPrimitiveRoot ζ r)
    (M : ThreeManifold) : True := by
  sorry

/-- QT.4/integrality-and-galois (Habiro, Corollary 1.3). -/
theorem wrt_isIntegral {r : ℕ} (ζ : ℂ) (hζ : IsPrimitiveRoot ζ r) (M : ThreeManifold) :
    True := by sorry

/-- QT.4/ohtsuki-series (Habiro, Theorem 12.6). -/
theorem taylor_unifiedInvariant_eq_ohtsuki (M : ThreeManifold) : True := by sorry

example : True := by sorry              -- the WRT invariant of the 3-sphere is 1
example : True := by sorry              -- the Ohtsuki series begins with 1
example : True := by sorry              -- its first nontrivial coefficient is the Casson invariant

/-! ## QT.5 Hyperbolic geometry, Bloch classes and regulators -/

/-- QT.5/ideal-tetrahedron-and-shape: an ordered oriented ideal tetrahedron is its shape. -/
structure IdealTetrahedron where
  /-- The cross-ratio of the four ideal vertices in the chosen order. -/
  shape : ℂ
  shape_ne_zero : shape ≠ 0
  shape_ne_one : shape ≠ 1

namespace IdealTetrahedron

def shape' (T : IdealTetrahedron) : ℂ := (1 - T.shape)⁻¹
def shape'' (T : IdealTetrahedron) : ℂ := 1 - T.shape⁻¹

theorem shape_mul_shape'_mul_shape'' (T : IdealTetrahedron) :
    T.shape * T.shape' * T.shape'' = -1 := by sorry

def IsPositivelyOriented (T : IdealTetrahedron) : Prop := 0 < T.shape.im

end IdealTetrahedron

/-- QT.5/combinatorial-flattening: a shape together with the two branch integers. -/
structure Flattening extends IdealTetrahedron where
  /-- The branch correction of the first log-parameter. -/
  p : ℤ
  /-- The branch correction of the second log-parameter. -/
  q : ℤ

namespace Flattening

def w₀ (f : Flattening) : ℂ := Complex.log f.shape + f.p * Real.pi * Complex.I
def w₁ (f : Flattening) : ℂ := Complex.log f.toIdealTetrahedron.shape' + f.q * Real.pi * Complex.I
def w₂ (f : Flattening) : ℂ := -(f.w₀ + f.w₁)

theorem w_sum_eq_zero (f : Flattening) : f.w₀ + f.w₁ + f.w₂ = 0 := by sorry

end Flattening

/-- The extended pre-Bloch group: the free abelian group on flattenings modulo the
lifted five-term relation. -/
def ExtendedPreBloch : Type := by sorry

/-- QT.5/volume-and-chern-simons: the flattened Rogers dilogarithm.
`Polylogarithms` owns the dilogarithm itself; the packet records the request. -/
def rogers (f : Flattening) : ℂ := by sorry

theorem rogers_wellDefined : True := by sorry             -- Neumann, Proposition 2.5

/-- QT.5/bloch-element-of-a-triangulation (Neumann, Theorems 4.5 and 4.6). -/
def blochElement (M : ThreeManifold) : ExtendedPreBloch := by sorry

theorem rogers_blochElement (M : ThreeManifold) : True := by sorry
                                                          -- i(vol + i cs)

example : True := by sorry              -- the regular ideal tetrahedron has shape a primitive 6th root
example : True := by sorry              -- the three edge parameters multiply to -1
example : True := by sorry              -- the figure-eight complement has both shapes that root

/-! ## QT.6 and QT.7

No signature is proposed. Their sources were not acquired, and the packet records
their coverage as `not_read`. Writing signatures for a state integral or for a
quantum-modularity statement before reading a primary source would encode guesses. -/

end TauCeti.QuantumTopology
