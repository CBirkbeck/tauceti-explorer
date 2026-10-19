import Mathlib.AlgebraicGeometry.Morphisms.Proper
import Mathlib.Topology.Irreducible
import Mathlib.Combinatorics.SimpleGraph.Basic
import Mathlib.LinearAlgebra.Matrix.PosDef
import Mathlib.RingTheory.PicardGroup
import Mathlib.GroupTheory.QuotientGroup.Defs
import Mathlib.Algebra.NoZeroSMulDivisors.Defs
import TauCeti.AlgebraicGeometry.LineBundle.Class

/-!
# Algebraic moduli and representability for arithmetic geometry, Part II:
# numerical Picard groups and contraction descent — suggested Lean forms

This file is not the roadmap and is not exhaustive. The roadmap document
(`research/blueprint/readmes/AlgebraicModuliForArithmeticGeometryPartII.md`) is definitive.
The statements below suggest Lean forms so that contributors and reviewers converge on names
and signatures.

At the pinned Mathlib and Tau Ceti there is no degree of an invertible sheaf on a proper
curve, no Picard scheme, no numerical group and no sheaf cohomology of schemes in the form the
targets need, and Tau Ceti's `LineBundleClass` is only a commutative monoid. The file therefore
types what is statable over the pinned carriers with real bodies:

* contractions of schemes (README 3.1);
* the component dual graph of a scheme (README 4.1);
* the Galois-lattice core of the positive-power criterion (README 2.10);
* the doubling lift through a 2-torsion kernel (README 2.11);
* torsion-freeness of numerical quotients (README 1.1);
* the linear algebra of Zariski's lemma (README 4.6);
* the minimum of normalised degrees on a ray (README 5.8);
* the triviality of Picard groups of semilocal rings used in README 2.3.

Every other target is listed at the end, grouped by the carrier it needs.
-/

open AlgebraicGeometry CategoryTheory

namespace TauCetiRoadmap.AlgebraicModuliForArithmeticGeometryPartII

/-! ## Layer 3: contractions -/

namespace Contraction

/-- README 3.1: a contraction is a proper morphism `f : X ⟶ Y` with `O_Y ≅ f_* O_X`, expressed
by bijectivity of `f.app U : Γ(Y, U) ⟶ Γ(X, f⁻¹ U)` on every open `U` of `Y`. -/
def IsContraction {X Y : Scheme} (f : X ⟶ Y) : Prop :=
  IsProper f ∧ ∀ U : Y.Opens, Function.Bijective (f.app U)

/-- API `Contraction.surjective` (README 3.1). -/
theorem IsContraction.surjective {X Y : Scheme} {f : X ⟶ Y} (hf : IsContraction f) :
    Function.Surjective f.base := sorry

/-- API `Contraction.comp` (README 3.1): composites of contractions are contractions. -/
theorem IsContraction.comp {X Y Z : Scheme} {f : X ⟶ Y} {g : Y ⟶ Z}
    (hf : IsContraction f) (hg : IsContraction g) : IsContraction (f ≫ g) := sorry

/-- API `Contraction.comp` (README 3.1): isomorphisms are contractions. -/
theorem IsContraction.of_isIso {X Y : Scheme} (f : X ⟶ Y) [IsIso f] : IsContraction f := sorry

/-- Test `Contraction.identity` (README 3.1, degenerate). -/
example (X : Scheme) : IsContraction (𝟙 X) := IsContraction.of_isIso (𝟙 X)

end Contraction

/-! ## Layer 4: component dual graphs -/

namespace DualGraph

/-- README 4.1: the component dual graph of a scheme. Vertices are the irreducible components
of the underlying space; distinct components are adjacent when they meet. -/
def componentGraph (X : Scheme) : SimpleGraph (irreducibleComponents X) where
  Adj a b := a ≠ b ∧ ((a : Set X) ∩ (b : Set X)).Nonempty
  symm := ⟨fun _ _ h => ⟨h.1.symm, by rw [Set.inter_comm]; exact h.2⟩⟩
  loopless := ⟨fun _ h => h.1 rfl⟩

/-- API `DualGraph.componentGraph_adj_iff` (README 4.1). -/
theorem componentGraph_adj_iff (X : Scheme) (a b : irreducibleComponents X) :
    (componentGraph X).Adj a b ↔ a ≠ b ∧ ((a : Set X) ∩ (b : Set X)).Nonempty := Iff.rfl

/-- Test `DualGraph.componentGraph_irreducible` (README 4.1, degenerate): no vertex is adjacent
to itself. -/
example (X : Scheme) (a : irreducibleComponents X) : ¬ (componentGraph X).Adj a a :=
  fun h => h.1 rfl

end DualGraph

/-! ## Layer 2: the Galois-lattice core of the positive-power criterion -/

namespace Picard

/-- README 2.10, sufficiency: a group acting additively on a torsion-free `ℤ`-module and fixing
every `d`-th multiple with `d ≠ 0` acts trivially. This is why the descent of `L^{⊗d}` up to
numerically trivial twists makes `Num_{X/k}` constant. -/
theorem trivial_of_fixes_multiples {G Λ : Type*} [Monoid G] [AddCommGroup Λ]
    [DistribMulAction G Λ] [NoZeroSMulDivisors ℤ Λ] {d : ℤ} (hd : d ≠ 0)
    (h : ∀ (g : G) (v : Λ), g • (d • v) = d • v) (g : G) (v : Λ) : g • v = v := by
  have h1 : d • (g • v - v) = 0 := by
    rw [smul_sub, ← smul_comm, h g v, sub_self]
  exact sub_eq_zero.mp ((smul_eq_zero.mp h1).resolve_left hd)

/-- Test (README 2.10, non-example): with `d = 0` the hypothesis holds for every action, which
is why the criterion requires `d ≥ 1`. -/
example {G Λ : Type*} [Monoid G] [AddCommGroup Λ] [DistribMulAction G Λ] (g : G) (v : Λ) :
    g • ((0 : ℤ) • v) = (0 : ℤ) • v := by simp

/-- README 2.11: for a subgroup `P` of an abelian group `Q` killed by `2`, doubling on `Q`
factors through `Q ⧸ P`. -/
def doubleLift {Q : Type*} [AddCommGroup Q] (P : AddSubgroup Q) (hP : ∀ x ∈ P, (2 : ℤ) • x = 0) :
    Q ⧸ P →+ Q :=
  QuotientAddGroup.lift P (zsmulAddGroupHom (2 : ℤ)) (fun x hx => by
    simpa [AddMonoidHom.mem_ker] using hP x hx)

/-- API `Picard.doubleLift` (README 2.11): `d ∘ π = [2]`. -/
theorem doubleLift_mk {Q : Type*} [AddCommGroup Q] (P : AddSubgroup Q)
    (hP : ∀ x ∈ P, (2 : ℤ) • x = 0) (x : Q) :
    doubleLift P hP (QuotientAddGroup.mk x) = (2 : ℤ) • x := rfl

/-- API `Picard.doubleLift_comp_proj` (README 2.11): `π ∘ d = [2]`. -/
theorem mk_doubleLift {Q : Type*} [AddCommGroup Q] (P : AddSubgroup Q)
    (hP : ∀ x ∈ P, (2 : ℤ) • x = 0) (y : Q ⧸ P) :
    (QuotientAddGroup.mk (doubleLift P hP y) : Q ⧸ P) = (2 : ℤ) • y := by
  induction y using QuotientAddGroup.induction_on with
  | H x => rw [doubleLift_mk]; rfl

/-- API `Picard.doubleLift_unique` (README 2.11). -/
theorem doubleLift_unique {Q : Type*} [AddCommGroup Q] (P : AddSubgroup Q)
    (hP : ∀ x ∈ P, (2 : ℤ) • x = 0) (e : Q ⧸ P →+ Q)
    (he : ∀ x : Q, e (QuotientAddGroup.mk x) = (2 : ℤ) • x) : e = doubleLift P hP := by
  ext x
  simp only [AddMonoidHom.comp_apply, QuotientAddGroup.coe_mk', he, doubleLift_mk]

/-- README 2.3, the `i = 1` step: semilocal rings, in particular finite algebras over a field,
have trivial Picard group (Mathlib). -/
example (R : Type*) [CommRing R] [Finite (MaximalSpectrum R)] :
    Subsingleton (CommRing.Pic R) := inferInstance

end Picard

/-! ## Layer 1: torsion-freeness of numerical quotients -/

namespace Numerical

/-- README 1.1: a quotient of an abelian group by the kernel of a map to a product of copies of
`ℤ` (the degrees on curves) is torsion-free. -/
theorem quotient_ker_noZeroSMulDivisors {A ι : Type*} [AddCommGroup A] (φ : A →+ (ι → ℤ)) :
    NoZeroSMulDivisors ℤ (A ⧸ φ.ker) := sorry

/-- README 5.8: on a ray, the normalised degrees `(H·C)/d_C` are positive integers, so their
minimum is attained. Curves are indexed by `ι`; `deg C = H·C > 0` and `d C ∣ deg C`. -/
theorem exists_extremal {ι : Type*} [Nonempty ι] (deg d : ι → ℕ) (hd : ∀ C, 0 < d C)
    (hdiv : ∀ C, d C ∣ deg C) (hpos : ∀ C, 0 < deg C) :
    ∃ Γ, ∀ C, deg Γ / d Γ ≤ deg C / d C := sorry

/-- README 5.8: extremality does not depend on the ample class. On a ray, degrees against two
ample classes are positive multiples `λ_C·h` and `λ_C·h'` of fixed numbers. -/
theorem extremal_independent {ι : Type*} (lam : ι → ℚ) (h h' : ℚ) (hh : 0 < h) (hh' : 0 < h')
    (d : ι → ℚ) (hd : ∀ C, 0 < d C) (Γ : ι) :
    (∀ C, lam Γ * h / d Γ ≤ lam C * h / d C) ↔ (∀ C, lam Γ * h' / d Γ ≤ lam C * h' / d C) := sorry

end Numerical

/-! ## Layer 4: the linear algebra of Zariski's lemma -/

namespace DualGraph

/-- README 4.6 (linear-algebra core of Zariski's lemma): let `N` be a symmetric rational
matrix with nonnegative off-diagonal entries, `m` a vector with positive entries and `N m = 0`,
and suppose no proper nonempty set of indices is orthogonal to its complement. Then `-N` is
positive semidefinite and its kernel is the line through `m`. -/
theorem zariski_linearAlgebra {r : ℕ} (N : Matrix (Fin r) (Fin r) ℚ) (hsymm : N.IsSymm)
    (hoff : ∀ i j, i ≠ j → 0 ≤ N i j) (m : Fin r → ℚ) (hm : ∀ i, 0 < m i)
    (hker : N.mulVec m = 0)
    (hconn : ∀ I : Finset (Fin r), I.Nonempty → I ≠ Finset.univ → ∃ i ∈ I, ∃ j ∉ I, N i j ≠ 0) :
    (-N).PosSemidef ∧ ∀ v : Fin r → ℚ, v ⬝ᵥ N.mulVec v = 0 → ∃ q : ℚ, v = q • m := sorry

/-- README 4.6: every proper subset of components is negative definite; in index form, a vector
supported on a proper subset with zero self-intersection vanishes. -/
theorem zariski_properSubset {r : ℕ} (N : Matrix (Fin r) (Fin r) ℚ) (hsymm : N.IsSymm)
    (hoff : ∀ i j, i ≠ j → 0 ≤ N i j) (m : Fin r → ℚ) (hm : ∀ i, 0 < m i)
    (hker : N.mulVec m = 0)
    (hconn : ∀ I : Finset (Fin r), I.Nonempty → I ≠ Finset.univ → ∃ i ∈ I, ∃ j ∉ I, N i j ≠ 0)
    (v : Fin r → ℚ) (i₀ : Fin r) (hv : v i₀ = 0) (h0 : v ⬝ᵥ N.mulVec v = 0) : v = 0 := sorry

/-- Test (README 4.6, computation): the fibre of type I₂ has `N = [[-2, 2], [2, -2]]` and
`m = (1, 1)`, with `N m = 0`. -/
example : (!![(-2 : ℚ), 2; 2, -2]).mulVec ![1, 1] = 0 := by
  ext i; fin_cases i <;> simp [Matrix.mulVec, dotProduct, Fin.sum_univ_two]

end DualGraph

end TauCetiRoadmap.AlgebraicModuliForArithmeticGeometryPartII

/-! ## Statements not typed at the pins

The following README targets, API items and checks have no carrier at the pinned Mathlib and
Tau Ceti; the README states each of them. They are grouped by layer, with the carrier they need.

* Layer 0 (needs degrees of invertible sheaves on proper curves over residue fields (no Euler-characteristic degree or Chow c₁ at the pins)):
  `Numerical.curveDegree`, `Numerical.curveDegree_tensor`, `Numerical.curveDegree_inv`,
  `Numerical.curveDegree_cycle`, `Numerical.curveDegree_finite_pullback`,
  `Numerical.curveDegree_baseField`, `Numerical.curveDegree_fieldExtension`,
  `Numerical.curveDegree_eq_chow`, `Numerical.curveDegree_projectiveLine`,
  `Numerical.curveDegree_realForm`, `Numerical.curveDegree_trivial`,
  `Numerical.curveDegree_doubleLine`, `Numerical.curveDegree_ne_euler`, curve-index (theorem),
  field-extension-invariance (theorem), `Numerical.NumericallyTrivial`,
  `Numerical.numericallyTrivialSubgroup`, `Numerical.numericallyTrivial_pullback_base`,
  `Numerical.numericallyTrivial_iff_closedPoints`, `Numerical.numericallyTrivial_iff_geometric`,
  `Numerical.numericallyTrivial_baseChange`, `Numerical.numericallyTrivial_restrict`,
  `Numerical.numericallyTrivial_iff_surface`, `Numerical.numericallyTrivial_projectiveLine`,
  `Numerical.numericallyTrivial_identity`, `Numerical.numericallyTrivial_elliptic`,
  `Numerical.numericallyTrivial_relative_ruling`, closed-points-suffice (theorem),
  surjective-pullback (theorem).
* Layer 1 (needs the numerical groups Num, N¹, N₁ and NE‾ over a base and positivity predicates (they need the curve degree and sheaf cohomology)):
  `Numerical.Num`, `Numerical.Num.mk_eq_mk_iff`, `Numerical.Num.pairing`,
  `Numerical.Num.torsionFree`, `Numerical.N1`, `Numerical.relativePicardNumber`,
  `Numerical.Num.pullback`, `Numerical.Num.baseChange`, `Numerical.N1.qCartierClass`,
  `Numerical.Num.eq_surface`, `Numerical.Num_projectiveLine`, `Numerical.Num_identity`,
  `Numerical.Num_productRelative`, `Numerical.Num_ne_Pic_elliptic`,
  `Numerical.Num_torsion_killed`, `Numerical.N1curves`, `Numerical.N1curves.pairing`,
  `Numerical.N1curves.pairing_perfect`, `Numerical.coneOfCurves`,
  `Numerical.N1curves.pushforward`, `Numerical.coneOfCurves_productLines`,
  `Numerical.coneOfCurves_identity`, `Numerical.coneOfCurves_relativeRuling`,
  `Numerical.coneOfCurves_not_closed`, neron-severi-rank (theorem),
  finite-dimensionality (theorem), `Numerical.IsRelNef`, `Numerical.nefCone`,
  `Numerical.IsRelNef.iff_cone`, `Numerical.IsRelNef.add`, `Numerical.IsRelNef.pullback`,
  `Numerical.IsRelNef.baseChange`, `Numerical.IsRelNef.eq_abundance`,
  `Numerical.IsRelNef_projectiveLine`, `Numerical.IsRelNef_identity`,
  `Numerical.IsRelNef_blowup`, `Numerical.IsRelNef_relativeRuling`, `Numerical.IsBig`,
  `Numerical.IsBig.iff_topIntersection_of_nef`, `Numerical.IsBig.pow`,
  `Numerical.IsBig.fieldExtension`, `Numerical.IsBig_projectiveSpace`, `Numerical.IsBig_trivial`,
  `Numerical.IsBig_productPullback`.
* Layer 2 (needs the Picard scheme of a proper scheme over a field, fppf sheafification of Pic and étale group schemes over a field):
  picard-scheme (theorem), `Picard.affinization`, `Picard.affinization_finite`,
  `Picard.affinization_baseChange`, `Picard.directImage_units`,
  `Picard.affinization_contraction`, `Picard.affinization_projectiveLine`,
  `Picard.affinization_realForm`, `Picard.affinization_affine`, `Picard.affinization_disjoint`,
  `Picard.affinization_ne_reduced`, finite-algebra-brauer (theorem), leray-obstruction (theorem),
  tau-component (theorem), `Picard.NumLocalSystem`, `Picard.NumLocalSystem.galoisModule`,
  `Picard.NumLocalSystem.stalk_free`, `Picard.NumLocalSystem.classMap_injective`,
  `Picard.NumLocalSystem.baseChange`, `Picard.NumLocalSystem.pullback`,
  `Picard.NumLocalSystem_projectiveLine`, `Picard.NumLocalSystem_realForm`,
  `Picard.NumLocalSystem_point`, `Picard.NumLocalSystem_isolatedPoint`,
  `Picard.NumLocalSystem_conic`, `Picard.IsConstantNum`, `Picard.IsConstantNum.iff_iso_constant`,
  `Picard.IsConstantNum.iff_finiteIndex`, `Picard.IsConstantNum.baseChange`,
  `Picard.IsConstantNum.of_sepClosed`, `Picard.IsConstantNum_projectiveLine`,
  `Picard.IsConstantNum_realForm`, `Picard.IsConstantNum_rhoZero`,
  `Picard.IsConstantNum_quadricSurface`, `Picard.picardNorm`, `Picard.picardNorm_comp_pullback`,
  `Picard.picardNorm_tau`, `Picard.picardNorm_lineBundle`, `Picard.picardNorm_trans`,
  `Picard.picardNorm_projectiveLine`, `Picard.picardNorm_trivialExtension`,
  `Picard.picardNorm_ne_pullbackInverse`, torsor-torsion (theorem),
  positive-power-criterion (theorem), `Picard.doubleLift_natural`, `Picard.doubleLift_cyclic`,
  `Picard.doubleLift_split`, `Picard.doubleLift_needs_two_torsion`,
  finite-field-finiteness (theorem).
* Layer 3 (needs direct images f_*, global generation of sheaves on schemes, relative Proj of section rings and algebraic spaces):
  `Contraction.geometricallyConnected_fibres`, `Contraction.flatBaseChange`, `Contraction.stein`,
  `Contraction.structureMorphism_iff`, `Contraction.blowup`, `Contraction.projection`,
  `Contraction.cuspNormalization_not`, `Contraction.realForm_not`, rigidity (theorem),
  `Contraction.IsSemiample`, `Contraction.sectionRing`, `Contraction.IsSemiample.pow`,
  `Contraction.IsSemiample.nef`, `Contraction.IsSemiample.pullback`,
  `Contraction.IsSemiample.fieldExtension`, `Contraction.IsSemiample.of_pullback_base`,
  `Contraction.IsSemiample_projectiveSpace`, `Contraction.IsSemiample_torsion`,
  `Contraction.IsSemiample_nontorsion_degreeZero`, `Contraction.IsSemiample_exceptional`,
  semiample-contraction (theorem), spreading-out (theorem), inseparable-descent (theorem),
  contraction-descent (theorem), ampleness-openness (theorem).
* Layer 4 (needs intersection numbers of curves on surfaces and fibres of morphisms as schemes):
  `DualGraph.vertexMap`, `DualGraph.vertexMap_adj`, `DualGraph.IsGraphIso`,
  `DualGraph.baseChange`, `DualGraph.componentGraph_disjointLines`,
  `DualGraph.componentGraph_axes`, `DualGraph.vertexMap_contracts_edge`,
  curve-criterion (theorem), `DualGraph.intersectionMatrix`, `DualGraph.IsNegDef`,
  `DualGraph.labelledGraph`, `DualGraph.label_pos_iff_adj`, `DualGraph.labelledGraph_baseChange`,
  `DualGraph.intersectionMatrix_twoLines`, `DualGraph.intersectionMatrix_exceptional`,
  `DualGraph.intersectionMatrix_single`, `DualGraph.labelledGraph_residueScaling`,
  surface-contraction-trichotomy (theorem), exceptional-negativity (theorem),
  zariski-lemma (theorem), fibre-graph-descent (theorem), reducible-fibre-residue (theorem),
  fibre-label-descent (theorem).
* Layer 5 (needs schemes over a DVR with special and generic fibres as above, ℚ-Cartier divisors, resolutions):
  `Numerical.specialFibreRestriction`, `Numerical.specialFibreRestriction_injective`,
  `Numerical.IsNumericallySurjective`, `Numerical.curveSpace_specialFibre`,
  `Numerical.specialFibreRestriction_baseChange`,
  `Numerical.specialFibreRestriction_projectiveSpace`,
  `Numerical.specialFibreRestriction_identity`,
  `Numerical.specialFibreRestriction_quadricDegeneration`, numerical-representatives (theorem),
  line-bundle-lifting (theorem), cone-identification (theorem), nef-big-specialization (theorem),
  semiample-trivial-descent (theorem), vertical-descent (theorem), extremal-curve (theorem),
  `Numerical.ahkRank`, `Numerical.ahkRank_eq_of_resolution`, `Numerical.ahkRank_regular`,
  `Numerical.ahkRank_small`, `Numerical.ahkRank_divisorialContraction`,
  `Numerical.ahkRank_projectivePlane`, `Numerical.ahkRank_regular_point`,
  `Numerical.ahkRank_quadricCone`, `Numerical.ahkRank_ne_naive`.
-/
