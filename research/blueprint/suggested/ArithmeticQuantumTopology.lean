/-
This file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/ArithmeticQuantumTopology.md` is definitive. These
statements suggest Lean forms so that contributors and reviewers can converge on
names and signatures. They claim no implementation.

BP-ArithmeticQuantumTopology: partial prototype, implementationStatus = unchecked.
Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.
The file imports Mathlib only and elaborates with the Lean toolchain of Mathlib 082e2d3
against its prebuilt library: `sorry` is the only warning.

What is stated here is what can be stated honestly with Mathlib alone. The objects the atlas
has not yet built are not invented. These are:
* framed links and 3-manifolds (GeometricTopology layers 4 and 5, requested);
* the h-adic quantised enveloping algebra with its universal R-matrix and ribbon element;
* the Habiro ring (HabiroCyclotomicCompletions HC.1);
* the dilogarithm (Polylogarithms P.1);
* the Bloch groups (K3BlochGroups V.3).
Each item of the packet that needs one of them is listed as `-- name: not stated; needs …`,
never as a statement of type `True`. What is stated concretely:
* the linking-matrix layer of QT.0: algebraic splitness, admissibility, the homology of the
  surgered manifold as a cokernel, handle slides as congruences;
* the quantum integers;
* the representation ring of `sl₂` with the cyclotomic elements `P n` of QT.2;
* ideal tetrahedra, flattenings, triangulations with their gluing equations, and the extended
  pre-Bloch group of QT.5;
* the figure-eight Kashaev function of QT.6;
* the provenance ledger of QT.7.
-/
import Mathlib.Algebra.Polynomial.Laurent
import Mathlib.Analysis.SpecialFunctions.Complex.Log
import Mathlib.Analysis.SpecialFunctions.Pow.Real
import Mathlib.Data.Matrix.Basis
import Mathlib.Data.ZMod.Basic
import Mathlib.GroupTheory.FreeAbelianGroup
import Mathlib.LinearAlgebra.Basis.Basic
import Mathlib.LinearAlgebra.Matrix.Determinant.Basic
import Mathlib.LinearAlgebra.Matrix.IsDiag
import Mathlib.LinearAlgebra.Matrix.ToLin
import Mathlib.RingTheory.Polynomial.Chebyshev
import Mathlib.RingTheory.Polynomial.Cyclotomic.Basic
import Mathlib.RingTheory.RootsOfUnity.PrimitiveRoots

noncomputable section

open Polynomial LaurentPolynomial Finset

namespace TauCeti.QuantumTopology

/-! ## QT.0 Framed links, surgery and normalization

The carrier of framed oriented links, surgery and the 3-manifolds it produces are requested from
the geometric-topology roadmap (GeometricTopology layers 4 and 5). Tau Ceti's
`FramedOrientedGaussCode` is the nearest available presentation, and this file imports Mathlib
only. Everything below is stated for the linking matrix `A = Lk(L)`, which is how every statement
of the layer enters the invariants.

Nodes: `QT.0/framed-link-and-linking-matrix`, `QT.0/surgery-presentation` and
`QT.0/admissible-framed-link` are stated below at the matrix level; `QT.0/kirby-and-fenn-rourke-moves`
and `QT.0/hoste-move` only through `handleSlide`.

- `linkingMatrix`: not stated; needs the framed-link carrier (requested). The statements below
  take `A = linkingMatrix L`.
- `linkingMatrix_of_move`: not stated; needs the carrier and its moves.
- `surgery`, `surgery_empty`, `surgery_disjoint_union`: not stated; need the 3-manifold carrier
  (GeometricTopology layer 5, requested).
- `IsKirbyMove`, `IsFennRourkeMove`, `surgery_eq_of_isKirbyMove`, `kirbyEquiv`, `IsHosteMove`,
  `hosteEquiv`, `isFennRourkeMove_of_isHosteMove`, `hosteEquiv_refl`: not stated; they are moves
  of link diagrams and need the carrier.
- Tests `linkingMatrix_unknot`, `linkingMatrix_blackboard`, `surgery_empty_eq_sphere`,
  `surgery_unknot_pm_one`, `kirbyEquiv_empty_unknot_one`, `not_kirbyEquiv_of_ne_homology`,
  `isHosteMove_blowdown_unknot`, `not_isHosteMove_of_target_not_admissible`,
  `hosteEquiv_of_isotopy`: not stated; they need the carrier.
- `QT.0/refined-kirby-calculus` and `QT.0/refined-presentation-existence`: not stated; theorems
  about the carrier (Habiro, Theorem 10.1 and §10).
-/

section LinkingMatrix

variable {n : ℕ}

-- linkingMatrix_symm: not stated at the link level (needs the carrier); the matrices below are the
-- symmetric linking matrices.
-- linkingMatrix_diag: not stated at the link level; the diagonal entry `A i i` is the framing.

/-- `L` is algebraically split: every off-diagonal linking number vanishes. -/
def IsAlgebraicallySplit (A : Matrix (Fin n) (Fin n) ℤ) : Prop := ∀ i j, i ≠ j → A i j = 0

/-- `L` is admissible: algebraically split, with every framing `±1`. -/
def IsAdmissible (A : Matrix (Fin n) (Fin n) ℤ) : Prop :=
  IsAlgebraicallySplit A ∧ ∀ i, A i i = 1 ∨ A i i = -1

theorem isAdmissible_iff (A : Matrix (Fin n) (Fin n) ℤ) :
    IsAdmissible A ↔ A.IsDiag ∧ ∀ i, (A i i).natAbs = 1 := sorry

theorem isAdmissible_empty : IsAdmissible (0 : Matrix (Fin 0) (Fin 0) ℤ) := sorry

/-- The first homology of the surgered manifold: the cokernel `ℤⁿ / A ℤⁿ` of the linking matrix. -/
abbrev homology_surgery (A : Matrix (Fin n) (Fin n) ℤ) : Type :=
  (Fin n → ℤ) ⧸ LinearMap.range A.mulVecLin

/-- Surgery gives an integral homology sphere exactly when the linking matrix is unimodular. -/
theorem isIntegralHomologySphere_iff (A : Matrix (Fin n) (Fin n) ℤ) :
    Subsingleton (homology_surgery A) ↔ IsUnit A.det := sorry

theorem isIntegralHomologySphere_of_isAdmissible {A : Matrix (Fin n) (Fin n) ℤ}
    (h : IsAdmissible A) : Subsingleton (homology_surgery A) := sorry

/-- A handle slide of the `i`-th component over the `j`-th changes the linking matrix by the
unimodular congruence `A ↦ Pᵀ A P`, `P = 1 + E_{ji}`. -/
def handleSlide (A : Matrix (Fin n) (Fin n) ℤ) (i j : Fin n) : Matrix (Fin n) (Fin n) ℤ :=
  Matrix.transpose (1 + Matrix.single j i 1) * A * (1 + Matrix.single j i 1)

theorem linkingMatrix_congr_of_handleSlide (A : Matrix (Fin n) (Fin n) ℤ) {i j : Fin n} (hij : i ≠ j) :
    IsUnit (1 + Matrix.single j i (1 : ℤ)).det ∧
      handleSlide A i j i i = A i i + A j j + 2 * A i j := sorry

/-- Test `linkingMatrix_hopf` (computation): the 0-framed Hopf link is not algebraically split. -/
example : ¬ IsAlgebraicallySplit !![(0 : ℤ), 1; 1, 0] := sorry

/-- Test `not_algebraicallySplit_of_det_ne` (non-example). -/
example (A : Matrix (Fin 2) (Fin 2) ℤ) (h : A 0 1 ≠ 0) : ¬ IsAlgebraicallySplit A := sorry

/-- Test `homology_surgery_unknot_p` (computation): surgery on the `p`-framed unknot has
`H₁ = ℤ/|p|`; for `p = 0` this is `ℤ`, so it is not an integral homology sphere. -/
example (p : ℤ) : Nonempty (homology_surgery !![p] ≃+ ZMod p.natAbs) := sorry

/-- Test `isAdmissible_unknot_one` (computation). -/
example : IsAdmissible !![(1 : ℤ)] := sorry

/-- Test `not_isAdmissible_unknot_zero` (non-example): algebraically split but not admissible. -/
example : IsAlgebraicallySplit !![(0 : ℤ)] ∧ ¬ IsAdmissible !![(0 : ℤ)] := sorry

/-- Test `not_isAdmissible_hopf` (non-example): the unit-framed Hopf link. -/
example : ¬ IsAdmissible !![(1 : ℤ), 1; 1, 1] := sorry

/-- Test `framing_of_handleSlide` (computation): sliding the first component of the 0-framed Hopf
link over the second gives framing `0 + 0 + 2·1 = 2`. -/
example : handleSlide !![(0 : ℤ), 1; 1, 0] 0 1 0 0 = 2 := sorry

end LinkingMatrix

/-! ## QT.1 Ribbon categories and quantum group invariants

The quantum integers are stated. The h-adic algebra `U_h(sl₂)`, its integral forms, the universal
R-matrix and ribbon element, bottom tangles and the universal invariant need completed tensor
products of topologically free `ℚ⟦h⟧`-modules and the tangle carrier, and are not stated.

- `Uq`, `Uqev`, `basis_Uq`, `Uqev_le_Uq`, `completion` (QT.1/quantized-enveloping-algebra): not
  stated; need `U_h(sl₂)` over `ℚ⟦h⟧` and its h-adic completion.
- Tests `basis_freeness`, `Uqev_ne_Uq`, `classical_limit`: not stated; they need `Uq`.
- `universalR`, `yangBaxter`, `ribbonElement`, `braidedCategory_modules`, `rigidCategory_modules`
  (QT.1/ribbon-structure): not stated; need the completed tensor square of `U_h`. Mathlib supplies `BraidedCategory` and
  `RigidCategory` for the category once built.
- Tests `ribbon_unknot_framing`, `R_matrix_classical_limit`: not stated; need `universalR`.
- `QT.1/braided-hopf-structure`, `QT.1/universal-invariant-integrality`: not stated; theorems
  about the completed even form.
- `BottomTangle`, `closure`, `closure_surjective`, `comp`, `tensor` (QT.1/bottom-tangle) and tests `closure_trivial`,
  `closure_of_bottom_knot`, `bottomTangle_not_closed`: not stated; need the tangle carrier.
- `J`, `J_trivial`, `J_comp`, `J_tensor`, `J_mem_invariants` (QT.1/universal-sl2-invariant) and tests `J_unknot_zero_framed`,
  `J_framing_change`, `J_hopf_nontrivial`: not stated; need `universalR` and bottom tangles.
- `TopologicalRibbonHopfAlgebra`, `TopologicalRibbonHopfAlgebra.R`,
  `TopologicalRibbonHopfAlgebra.ribbon`, `TopologicalRibbonHopfAlgebra.moduleCategory`,
  `TopologicalRibbonHopfAlgebra.duals`, `ZeroConvergent` (QT.1/topological-ribbon-hopf-algebras):
  not stated; need complete Hopf algebras over `ℂ⟦h⟧` and completed tensor products.
- Tests `trivialRibbonHopf`, `twist_unit`, `braiding_not_symmetric`, `groupAlgebra_symmetric`:
  not stated; they need `TopologicalRibbonHopfAlgebra`.
- (QT.1/core-subalgebras-and-twist-forms) `CoreSubalgebra`, `CoreSubalgebra.twistForm`, `CoreSubalgebra.normalisation`,
  `CoreSubalgebra.twistForm_one_isUnit`, `CoreSubalgebra.invariant` and tests
  `integralCoreSubalgebra_sl2`, `twistForm_one_at_root`, `mirror_stability_needed`,
  `coreInvariant_empty`: not stated; they need `TopologicalRibbonHopfAlgebra`.
- `QT.1/root-of-unity-categories-are-not-generically-semisimple`: a comparison; nothing is stated.
-/

/-- The balanced quantum integer `[n] = v^{n-1} + v^{n-3} + ⋯ + v^{1-n}` in `ℤ[v^{±1}]`. -/
def qInt (n : ℕ) : LaurentPolynomial ℤ := ∑ i ∈ range n, T ((n : ℤ) - 1 - 2 * i)

/-- Test `quantum_dimension_V1` (computation): the quantum dimension of `V₁` is `[2] = v + v⁻¹`,
not `2`. -/
example : qInt 2 = T 1 + T (-1) ∧ qInt 2 ≠ 2 := sorry

/-! ## QT.2 Colored Jones polynomials and cyclotomic expansions

The representation ring of `sl₂` is `ℤ[v^{±1}][V₁]`, with `V n` the Chebyshev polynomial
`S n (V₁)`, so that `V₁ V n = V (n + 1) + V (n - 1)`. The cyclotomic elements
`P n = ∏_{i<n} (V₁ − v^{2i+1} − v^{−2i−1})` of Habiro §6 are polynomials in `V₁`. Nodes stated below:
`QT.2/p-basis` and `QT.2/algebra-P-and-completion`.

- `colouredJones`, `colouredJones_unknot`, `colouredJones_multilinear`, `reducedJones`,
  `colouredJones_framing_change` and tests `colouredJones_unknot_V1`, `colouredJones_trefoil_V1`,
  `colouredJones_split_union`: not stated; they need the quantum trace of the universal invariant (QT.1).
- `V_eq_sum_P`, `P_eq_sum_V`: not stated; their coefficients are the quantum binomial coefficients of
  Habiro (6.1)–(6.2). `P_basis` below states the triangularity that makes them exist.
- `mul_P`: not stated in general; its coefficients are Habiro's displayed structure constants. The
  test `mul_P_one_one` below is the first case.
- `completion`, test `twistElement_not_mem`: not stated; they need the completion of `algebraP` along
  `filtration`, the ring of QT.3's twist element.
- `QT.2/dual-basis-pairing`, `QT.2/cyclotomic-expansion`, `QT.2/integrality-algebraically-split`,
  `QT.2/quantum-trace-integrality`, `QT.2/coloured-jones-determination`: not stated; they need the
  quantum trace.
- `cyclotomicTruncation`, `cyclotomicTruncation_trunc`, `eval_cyclotomicTruncation`,
  `cyclotomicTruncation_before_completion` and tests `cyclotomicTruncation_unknot`,
  `eval_small_root`, `cyclotomicTruncation_compat`, `completion_first_differs`
  (QT.2/truncations-and-what-may-be-done-before-completion): not stated; they need the cyclotomic
  coefficients of QT.2/cyclotomic-expansion.
- `QT.2/an-expansion-is-a-theorem-about-an-invariant`: a comparison; nothing is stated.
-/

/-- The colour `V n` (the `(n+1)`-dimensional module) in the representation ring `ℤ[v^{±1}][V₁]`. -/
def V (n : ℕ) : (LaurentPolynomial ℤ)[X] := Polynomial.Chebyshev.S (LaurentPolynomial ℤ) n

/-- The cyclotomic element `P n = ∏_{i<n} (V₁ − v^{2i+1} − v^{−2i−1})`. -/
def P (n : ℕ) : (LaurentPolynomial ℤ)[X] :=
  ∏ i ∈ range n, (X - Polynomial.C (T (2 * i + 1) + T (-(2 * i + 1))))

@[simp] theorem P_zero : P 0 = 1 := sorry

/-- `P n` is monic of degree `n`, so `(P n)` is a basis of `ℤ[v^{±1}][V₁]` and the change of basis
with `(V n)` is triangular with unit diagonal. -/
theorem P_basis : ∃ b : Module.Basis ℕ (LaurentPolynomial ℤ) (LaurentPolynomial ℤ)[X], ∀ n, b n = P n := sorry

/-- `algebraP`: the span of the `P n`, all of `ℤ[v^{±1}][V₁]` in this model. -/
def algebraP : Subalgebra (LaurentPolynomial ℤ) (LaurentPolynomial ℤ)[X] := ⊤

theorem algebraP_isSubalgebra (n : ℕ) : P n ∈ algebraP := sorry

/-- The decreasing filtration: the ideal spanned by the `P m` with `m ≥ k`, which is `(P k)`. -/
def filtration (k : ℕ) : Ideal (LaurentPolynomial ℤ)[X] := Ideal.span {P k}

theorem filtration_mul (k l : ℕ) : filtration k * filtration l ≤ filtration (max k l) := sorry

/-- Test `P_one` (computation): `P 1 = V₁ − [2]`. -/
example : P 1 = V 1 - Polynomial.C (qInt 2) := sorry

/-- Test `V_one_in_P` (computation): `V₁ = P 1 + [2] P 0`. -/
example : V 1 = P 1 + Polynomial.C (qInt 2) * P 0 := sorry

/-- Test `P_change_of_basis_triangular` (characterisation). -/
example (n : ℕ) : (P n).Monic ∧ (P n).natDegree = n ∧ (V n).Monic ∧ (V n).natDegree = n := sorry

/-- Test `P_zero_eq_one` (degenerate). -/
example : P 0 = 1 := sorry

/-- Test `mul_P_one_one` (computation): `P₁² = P₂ + (v³ + v⁻³ − v − v⁻¹) P₁`. -/
example : P 1 * P 1 = P 2 + Polynomial.C (T 3 + T (-3) - T 1 - T (-1)) * P 1 := sorry

/-! ## QT.3 Unified invariants of integral homology spheres

The twist element lives in the completion of `algebraP` and the unified invariant in the Habiro
ring (HabiroCyclotomicCompletions HC.1). Neither completion is built in the pinned libraries.

- `omega`, `pairing_omega`, `omega_mul_inv`, `omega_mem_completion`, `omega_coeff` (QT.3/twist-element) and tests
  `pairing_omega_V0`, `omega_plus_mul_omega_minus`, `omega_not_finite`: not stated; need the
  completion of `algebraP` and the quantum trace pairing.
- `QT.3/twisting-theorem`: not stated; needs `omega` and the coloured invariant.
- `unifiedInvariantOfPresentation`, `unifiedInvariant_empty`, `summable`, `unifiedInvariant_mirror` (QT.3/definition-of-JM)
  and tests `unified_empty`, `unified_unknot_pm_one`, `unified_converges`: not stated; need the
  Habiro ring (HC.1) and the coloured invariant.
- `QT.3/JM-well-defined`, `QT.3/JM-divisibility`, `QT.3/JM-connected-sum-and-orientation`: not
  stated; theorems about the unified invariant.
- `QT.3/rational-homology-spheres-are-not-in-this-domain`: a comparison; nothing is stated.
-/

/-! ## QT.4 WRT values, Ohtsuki series and general Lie type

- `wrt`, `wrt_sphere`, `wrt_kirby_invariant`, `wrt_connected_sum` (QT.4/WRT-invariant-at-a-root) and tests `wrt_sphere_one`,
  `wrt_lens_space`, `wrt_multiplicative`: not stated; need surgery presentations and the coloured
  invariants at a root of unity.
- `QT.4/evaluation-theorem`, `QT.4/integrality-and-galois`, `QT.4/determination-by-WRT`,
  `QT.4/ohtsuki-series`, `QT.4/general-simple-lie-type`: not stated; theorems about `wrt` and the
  unified invariant.
- `QT.4/the-coefficient-ring-may-not-be-changed`: a comparison; nothing is stated.
-/

/-! ## QT.5 Hyperbolic geometry, Bloch classes and regulators

Nodes stated below: `QT.5/ideal-tetrahedron-and-shape`, `QT.5/gluing-and-completeness-equations`,
`QT.5/combinatorial-flattening` and `QT.5/bloch-element-of-a-triangulation`. -/

/-- An ordered oriented ideal tetrahedron, recorded by its shape. -/
structure IdealTetrahedron where
  /-- The cross-ratio of the four ideal vertices in the chosen order. -/
  shape : ℂ
  shape_ne_zero : shape ≠ 0
  shape_ne_one : shape ≠ 1

namespace IdealTetrahedron

/-- The parameter `z' = 1/(1 - z)` of the second pair of opposite edges. -/
def shape' (T : IdealTetrahedron) : ℂ := (1 - T.shape)⁻¹

/-- The parameter `z'' = 1 - 1/z` of the third pair of opposite edges. -/
def shape'' (T : IdealTetrahedron) : ℂ := 1 - T.shape⁻¹

/-- The three edge parameters multiply to `-1`. -/
theorem shape_companions (T : IdealTetrahedron) : T.shape * T.shape' * T.shape'' = -1 := sorry

-- shape: the field `IdealTetrahedron.shape`, the cross-ratio of the vertices in the chosen order.

/-- `T` is positively oriented when its shape lies in the upper half-plane. -/
def positively_oriented (T : IdealTetrahedron) : Prop := 0 < T.shape.im

-- isometry_iff_shape_eq: not stated; needs hyperbolic 3-space and its orientation-preserving
-- isometries, which the pinned libraries do not have.

end IdealTetrahedron

/-- Test `shape_regular` (computation): the regular ideal tetrahedron has shape `e^{iπ/3}`, and all
three edge parameters are equal. -/
example (T : IdealTetrahedron) (h : T.shape = Complex.exp (Real.pi * Complex.I / 3)) :
    T.shape' = T.shape ∧ T.shape'' = T.shape := sorry

/-- Test `shape_product` (computation): the product is `-1`, not `1`. -/
example (T : IdealTetrahedron) : T.shape * T.shape' * T.shape'' ≠ 1 := sorry

/-- Test `shape_excludes_degenerate` (non-example): no tetrahedron has shape `0` or `1`. -/
example : ¬ ∃ T : IdealTetrahedron, T.shape = 0 ∨ T.shape = 1 := sorry

/-- An ideal triangulation with `N` tetrahedra and `E` edges, recorded by the incidence matrices
`a, b, c` (how often each edge meets the edges of parameter `z`, `z'`, `z''` of each tetrahedron,
the Neumann–Zagier data) and a shape for each tetrahedron. -/
structure IdealTriangulation where
  N : ℕ
  E : ℕ
  a : Matrix (Fin E) (Fin N) ℕ
  b : Matrix (Fin E) (Fin N) ℕ
  c : Matrix (Fin E) (Fin N) ℕ
  tet : Fin N → IdealTetrahedron

namespace IdealTriangulation

/-- The edge equation at `e`, in product and logarithmic form. -/
def edgeEquation (X : IdealTriangulation) (e : Fin X.E) : Prop :=
  (∏ j, (X.tet j).shape ^ X.a e j * (X.tet j).shape' ^ X.b e j * (X.tet j).shape'' ^ X.c e j) = 1 ∧
    ∑ j, ((X.a e j : ℂ) * Complex.log (X.tet j).shape + (X.b e j : ℂ) * Complex.log (X.tet j).shape' +
      (X.c e j : ℂ) * Complex.log (X.tet j).shape'') = 2 * Real.pi * Complex.I

/-- A geometric solution: every edge equation holds and every tetrahedron is positively oriented.
That such a solution gives the complete hyperbolic structure is Thurston's theorem, which no layer of
the atlas owns (QT.5's remaining list). -/
def isGeometricSolution (X : IdealTriangulation) : Prop :=
  (∀ e, X.edgeEquation e) ∧ ∀ j, (X.tet j).positively_oriented

-- cuspEquation: not stated; needs the cusp torus and the derived holonomy of its generators.
-- volume_eq_sum: not stated; needs the Bloch–Wigner function (Polylogarithms P.1) and hyperbolic volume.

end IdealTriangulation

/-- The regular ideal tetrahedron, shape `e^{iπ/3}`. -/
def regularTetrahedron : IdealTetrahedron where
  shape := Complex.exp (Real.pi * Complex.I / 3)
  shape_ne_zero := sorry
  shape_ne_one := sorry

/-- Thurston's two-tetrahedron triangulation of the figure-eight knot complement: edge 1 is
`z₁² z₁' z₂² z₂'`, edge 2 is `z₁' z₁''² z₂' z₂''²`. -/
def figureEight (t : Fin 2 → IdealTetrahedron) : IdealTriangulation where
  N := 2
  E := 2
  a := !![2, 2; 0, 0]
  b := !![1, 1; 1, 1]
  c := !![0, 0; 2, 2]
  tet := t

/-- Test `figure_eight_solution` (computation): both shapes `e^{iπ/3}` solve the equations. -/
example : (figureEight fun _ ↦ regularTetrahedron).isGeometricSolution := sorry

/-- Test `edge_equation_log_form` (characterisation): the product form does not fix the branch, so
the logarithmic form is not implied by it. -/
example : ∃ X : IdealTriangulation, ∃ e,
    (∏ j, (X.tet j).shape ^ X.a e j * (X.tet j).shape' ^ X.b e j * (X.tet j).shape'' ^ X.c e j) = 1 ∧
      ¬ X.edgeEquation e := sorry

/-- Test `not_geometric_of_negative_imaginary` (non-example). -/
example (X : IdealTriangulation) (j : Fin X.N) (h : (X.tet j).shape.im < 0) :
    ¬ X.isGeometricSolution := sorry

/-- A combinatorial flattening: a shape with two branch integers. -/
structure Flattening extends IdealTetrahedron where
  p : ℤ
  q : ℤ

namespace Flattening

/-- The log-parameters `(log z + pπi, −log(1 − z) + qπi, −w₀ − w₁)` (Neumann §2). -/
def w₀ (f : Flattening) : ℂ := Complex.log f.shape + f.p * Real.pi * Complex.I
def w₁ (f : Flattening) : ℂ := -Complex.log (1 - f.shape) + f.q * Real.pi * Complex.I
def w₂ (f : Flattening) : ℂ := -(f.w₀ + f.w₁)

theorem flattening_sum_zero (f : Flattening) : f.w₀ + f.w₁ + f.w₂ = 0 := sorry

-- flatteningEquiv: not stated; needs the Riemann surface covering `ℂ ∖ {0, 1}` (Neumann §2).

end Flattening

/-- The lifted five-term relations of Neumann (Definition 2.2 there): the subgroup generated by the
alternating sums of five flattenings satisfying the flattening condition. Its generators are
left to the node's owner. -/
def liftedFiveTerm : AddSubgroup (FreeAbelianGroup Flattening) := sorry

/-- The extended pre-Bloch group. -/
abbrev extendedPreBloch : Type := FreeAbelianGroup Flattening ⧸ liftedFiveTerm

-- forget: not stated; its target is the pre-Bloch group of K3BlochGroups V.3 (requested).
-- Test lifted_five_term_general: not stated; needs forget.

/-- Test `flattening_zero_zero` (degenerate): the principal flattening has `w₀ = log z`. -/
example (T : IdealTetrahedron) : ({ T with p := 0, q := 0 } : Flattening).w₀ = Complex.log T.shape :=
  sorry

/-- Test `flattening_determines_shape` (characterisation). -/
example (f g : Flattening) (h : f.w₀ = g.w₀) : f.shape = g.shape := sorry

/-- The element `∑ⱼ [zⱼ; pⱼ, qⱼ]` of a flattened triangulation. -/
def blochElement (X : IdealTriangulation) (f : Fin X.N → Flattening) : extendedPreBloch :=
  ∑ j, QuotientAddGroup.mk (FreeAbelianGroup.of (f j))

-- blochElement_exists: not stated; needs the flattening condition of Neumann §3.
-- blochElement_indep: not stated; needs the flattening condition and the extended Bloch group.
-- blochElement_mem_extendedBloch: not stated; needs the map to `∧²(ℂ)` defining the extended Bloch group.
-- Test blochElement_flattening_independent: not stated; needs the flattening condition.
-- Test blochElement_not_in_prebloch_kernel: not stated; needs the Rogers dilogarithm (Polylogarithms P.1).

/-- Test `blochElement_figure_eight` (computation): the figure-eight complement gives twice the
flattened regular tetrahedron. -/
example (f : Fin 2 → Flattening) (hf : ∀ j, f j = { regularTetrahedron with p := 0, q := 0 }) :
    blochElement (figureEight fun _ ↦ regularTetrahedron) f =
      (2 : ℕ) • (QuotientAddGroup.mk (FreeAbelianGroup.of { regularTetrahedron with p := 0, q := 0 }) :
        extendedPreBloch) := sorry

/-
- `QT.5/five-term-and-pachner`: not stated; needs the flattening condition.
- `QT.5/volume-and-chern-simons`: not stated; needs the Rogers dilogarithm (Polylogarithms P.1)
  and `H₃(PSL₂(ℂ)^δ)`.
- `QT.5/a-diagram-does-not-produce-a-bloch-class`: a comparison; nothing is stated.
-/

/-! ## QT.6 State integrals, Nahm series and arithmetic asymptotics

The Kashaev invariant of a general knot needs the knot carrier and the coloured Jones polynomial.
For the figure-eight knot it is the explicit sum `⟨4₁⟩_N = ∑_{k<N} |(q; q)_k|²` at `q = e^{2πi/N}`,
and the function on the rationals is the same sum at `q = e^{2πix}`.

- `kashaevInvariant`, `kashaevInvariant_eq_colouredJones`, `kashaevFunction_unique`: not stated;
  need the knot carrier and the coloured Jones polynomial (QT.2).
- Tests `kashaev_unknot`, `galoisInvariance_needed`: not stated; need the knot carrier.
- `QT.6/the-asymptotic-series-and-its-arithmetic`, `QT.6/what-is-exported-to-the-habiro-roadmaps`,
  `QT.6/formal-and-analytic-asymptotics-are-different-outputs`: comparisons, and conjectures of the
  source; nothing is stated.
-/

/-- `(q; q)_k = ∏_{j=1}^{k} (1 - q^j)` at a complex number. -/
def qPochC (q : ℂ) (k : ℕ) : ℂ := ∏ j ∈ range k, (1 - q ^ (j + 1))

/-- The figure-eight Kashaev function `x ↦ ∑_{k < den x} |(e(x); e(x))_k|²` on the rationals. -/
def figureEightKashaev (x : ℚ) : ℝ :=
  ∑ k ∈ range x.den, ‖qPochC (Complex.exp (2 * Real.pi * Complex.I * x)) k‖ ^ 2

/-- `kashaevFunction`, for the figure-eight knot. -/
abbrev kashaevFunction : ℚ → ℝ := figureEightKashaev

/-- Test `kashaevFunction_periodic` (characterisation): the function is one-periodic. -/
theorem kashaevFunction_periodic (x : ℚ) : kashaevFunction (x + 1) = kashaevFunction x := sorry

/-- Test `figureEightKashaev_small` (computation): the values at `-1/N` for `N = 1, …, 6` are
`1, 5, 13, 27, 46 + 2√5, 89`. -/
example : figureEightKashaev (-1) = 1 ∧ figureEightKashaev (-1 / 2) = 5 ∧
    figureEightKashaev (-1 / 3) = 13 ∧ figureEightKashaev (-1 / 4) = 27 ∧
    figureEightKashaev (-1 / 5) = 46 + 2 * Real.sqrt 5 ∧ figureEightKashaev (-1 / 6) = 89 := sorry

/-! ## QT.7 Quantum modularity and arithmetic research statements

No statement in this section is a theorem of this roadmap. The quantum modularity conjecture and
the volume conjecture are conjectures of the source, and they need the asymptotic series of QT.6:
- `QT.7/the-quantum-modularity-conjecture`: not stated.
- `QT.7/proved-cases-conjectures-and-the-executable-boundary`: an application; nothing is stated.
The ledger (`QT.7/the-example-ledger`) is stated.
-/

/-- The five labels a ledger entry must carry (`LedgerEntry.status`). -/
inductive Provenance where
  | proved
  | imported
  | computed
  | numerical
  | conjectural
  deriving DecidableEq

/-- The six columns of the ledger. -/
inductive LedgerColumn where
  | cyclotomicCoefficients
  | kashaevValues
  | invariantsAtRootsOfUnity
  | traceFieldAndBlochClasses
  | volumeAndChernSimons
  | asymptoticSeries
  deriving DecidableEq

/-- A ledger entry: its column, the datum, the node that produces it, and its label. -/
structure LedgerEntry where
  column : LedgerColumn
  datum : String
  node : String
  status : Provenance

-- LedgerEntry.node: the field `node` of `LedgerEntry`, the producing node.
-- LedgerEntry.status: the field `status` of `LedgerEntry`, one of the five labels.

/-- The ledger: one row per example, each a list of entries (an empty column has no entry). -/
abbrev Ledger : Type := List (String × List LedgerEntry)

/-- The two rows, for `4₁` and `5₂`. -/
def ledgerRows : Ledger :=
  [("4_1", [⟨.cyclotomicCoefficients, "a_n(4_1)", "QT.2/cyclotomic-expansion", .proved⟩,
            ⟨.kashaevValues, "1, 5, 13, 27, 46 + 2√5, 89",
              "QT.6/the-kashaev-invariant-and-the-function-on-the-rationals", .computed⟩,
            ⟨.traceFieldAndBlochClasses, "Q(√-3)", "QT.5/bloch-element-of-a-triangulation", .proved⟩,
            ⟨.asymptoticSeries, "Phi^(4_1)", "QT.6/the-asymptotic-series-and-its-arithmetic", .conjectural⟩]),
   ("5_2", [⟨.cyclotomicCoefficients, "a_n(5_2)", "QT.2/cyclotomic-expansion", .proved⟩,
            ⟨.traceFieldAndBlochClasses, "cubic field of discriminant -23",
              "QT.5/bloch-element-of-a-triangulation", .proved⟩,
            ⟨.asymptoticSeries, "Phi^(5_2)", "QT.6/the-asymptotic-series-and-its-arithmetic", .conjectural⟩])]

/-- Test `ledger_status_consistent` (characterisation): the asymptotic-series column is conjectural
in every row. -/
example : ∀ r ∈ ledgerRows, ∀ e ∈ r.2, e.column = .asymptoticSeries → e.status = .conjectural := by
  decide

/-- Test `ledger_figureEight_row` (computation): the figure-eight Kashaev entry is computed. -/
example : ((ledgerRows.head?.map Prod.snd).getD []).any
    (fun e ↦ e.column == .kashaevValues && e.status == .computed) = true := by decide

/-- Test `ledger_traceField` (computation): the trace fields are `ℚ(√−3)` and the cubic field of
discriminant `−23`. -/
example : (ledgerRows.map fun r ↦ (r.2.filter (·.column == .traceFieldAndBlochClasses)).map (·.datum)) =
    [["Q(√-3)"], ["cubic field of discriminant -23"]] := by decide

/-- Test `ledger_empty_column` (non-example): `5₂` has no Kashaev entry, and the ledger records that
as an absence, not as agreement. -/
example : ((ledgerRows.getD 1 ("", [])).2.filter (·.column == .kashaevValues)) = [] := by decide

end TauCeti.QuantumTopology
