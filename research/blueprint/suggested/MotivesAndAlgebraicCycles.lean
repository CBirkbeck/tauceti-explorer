/-
This file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/MotivesAndAlgebraicCycles.md` is definitive. These
statements suggest Lean forms so that contributors and reviewers can converge on
names and signatures. They claim no implementation.

BP-MotivesAndAlgebraicCycles: partial prototype, implementationStatus = unchecked.
Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.
No Lean toolchain at those commits was available in this session, so elaboration
has not been established.

Objects another roadmap owns appear as parameters of a structure or as `variable`s,
never as invented definitions:

* Chow groups with rational equivalence, proper pushforward, flat and lci Gysin
  pullback, the intersection product, the projection formula, proper intersections,
  the degree of a zero cycle and the Chow ring of a projective bundle belong to
  SchemeAndStackFoundations SF.5, and appear here as the fields of `ChowTheory`;
* etale, de Rham and Betti cohomology with their cycle class maps belong to
  SchemeAndStackFoundations SF.2, and the comparison isomorphisms between them to
  SF.6; nothing here constructs one, and `WeilCohomology` below is the axiomatic
  shape a realisation must have;
* Bloch's higher Chow groups belong to MotivicEtaleKTheory M.4, and finite
  correspondences, Nisnevich sheaves with transfers, the effective motivic category
  and the cancellation theorem to M.5a; both appear as opaque parameters in the
  section on geometric motives.

Written out here: the graded groups of correspondences with their composition, the
category of correspondences and its monoidal structure, Chow motives with twists,
duals and Chow groups, the projective bundle formula, the data and axioms of a
classical Weil cohomology theory and its equivalence with monoidal functors on
motives, Jannsen's trace formula and semisimplicity theorem with the dual-numbers
non-example, the geometric motives with the Gysin triangle and the two comparisons,
Nori's diagram categories, the motivic Galois group and the formal period torsor,
and the two cycle conjectures as predicates.
-/
import Mathlib.AlgebraicGeometry.Scheme
import Mathlib.AlgebraicGeometry.Morphisms.Smooth
import Mathlib.AlgebraicGeometry.Morphisms.Proper
import Mathlib.AlgebraicGeometry.AlgebraicCycle.Basic
import Mathlib.CategoryTheory.Abelian.Basic
import Mathlib.CategoryTheory.Equivalence
import Mathlib.CategoryTheory.Idempotents.Basic
import Mathlib.CategoryTheory.Idempotents.Karoubi
import Mathlib.CategoryTheory.Idempotents.Biproducts
import Mathlib.CategoryTheory.Linear.Basic
import Mathlib.CategoryTheory.Localization.Predicate
import Mathlib.CategoryTheory.Monoidal.Braided.Basic
import Mathlib.CategoryTheory.Monoidal.Category
import Mathlib.CategoryTheory.Monoidal.Functor
import Mathlib.CategoryTheory.Monoidal.Rigid.Basic
import Mathlib.CategoryTheory.Preadditive.Basic
import Mathlib.CategoryTheory.Triangulated.Pretriangulated
import Mathlib.CategoryTheory.Yoneda
import Mathlib.LinearAlgebra.Trace
import Mathlib.RingTheory.Coalgebra.Basic
import Mathlib.RingTheory.Jacobson.Radical
import Mathlib.RingTheory.SimpleModule.Basic

noncomputable section

namespace TauCeti.Motives

open CategoryTheory

universe u

/-! ## Imported: what SchemeAndStackFoundations SF.5 owes this roadmap

Nothing in this section is planned by this roadmap. `AlgebraicGeometry.AlgebraicCycle`
is all the pinned libraries have, and the reviewed audit of SF.5 records rational
equivalence, the intersection product, the projection formula and the degree of a
zero cycle as absent. They appear here as the fields of one structure so that the
rest of the file can be written against them. -/

/-- The smooth projective schemes over `k`, the index category of the whole roadmap. -/
structure SmProj (k : Type u) [Field k] where
  carrier : AlgebraicGeometry.Scheme
  smooth : True
  proper : True

/-- SF.5: Chow groups with rational coefficients and everything the construction of
correspondences uses. A field per imported statement, so that a reader can see
exactly what is assumed and what is proved. -/
structure ChowTheory (k : Type u) [Field k] where
  /-- `CH^i(X) ⊗ ℚ`, graded by codimension. -/
  CH : SmProj k → ℤ → Type u
  addCommGroup : ∀ X i, AddCommGroup (CH X i)
  module : ∀ X i, Module ℚ (CH X i)
  /-- Proper pushforward, functorial in the morphism. -/
  pushforward : True
  /-- Flat and lci Gysin pullback, with `f^!` composing. -/
  gysin : True
  /-- The intersection product, associative and commutative. -/
  mul : True
  /-- The projection formula. -/
  projectionFormula : True
  /-- Flat pullback against proper pushforward in a fibre square. -/
  flatBaseChange : True
  /-- Two cycles meeting properly intersect in the class of their intersection. -/
  properIntersection : True
  /-- The degree of a zero cycle on a proper scheme. -/
  deg : True
  /-- The Chow ring of a projective bundle. -/
  projectiveBundle : True
  /-- The top Chern class of a locally free module, and Chern classes of a twist. -/
  chern : True

variable {k : Type u} [Field k] (C : ChowTheory k)

/-! ## MC.0 Cycle correspondences and equivalence relations -/

/-- MC.0/correspondence-group: `Corr^r(X, Y) = ⨁_d CH^{d+r}(X_d × Y) ⊗ ℚ`.
The shift by `d` is what makes a graph have degree zero. -/
def Corr (X Y : SmProj k) (r : ℤ) : Type u := by sorry

instance (X Y : SmProj k) (r : ℤ) : AddCommGroup (Corr C X Y r) := by sorry

instance (X Y : SmProj k) (r : ℤ) : Module ℚ (Corr C X Y r) := by sorry

/-- For `X` equidimensional of dimension `d` the group is `CH^{d+r}(X × Y) ⊗ ℚ`. -/
theorem Corr.of_equidimensional (X Y : SmProj k) (d r : ℤ) : True := by sorry

/-- `Corr^r(Spec k, X) = CH^r(X) ⊗ ℚ`. -/
theorem Corr.of_point (X : SmProj k) (r : ℤ) : True := by sorry

/-- MC.0/correspondence-action-on-cycles: `c^*(β) = pr_{1,*}(c · pr_2^*β)`. -/
def Corr.pullback {X Y : SmProj k} {r : ℤ} (_c : Corr C X Y r) : True := by sorry

/-- `c_*(α) = pr_{2,*}(c · pr_1^*α)`. -/
def Corr.pushforward {X Y : SmProj k} {r : ℤ} (_c : Corr C X Y r) : True := by sorry

/-- MC.0/correspondence-composition: `c' ∘ c = pr_{13,*}(pr_{12}^*c · pr_{23}^*c')`. -/
def Corr.comp {X Y Z : SmProj k} {r s : ℤ}
    (_c' : Corr C Y Z s) (_c : Corr C X Y r) : Corr C X Z (r + s) := by sorry

/-- MC.0/composition-associative (1): composition is associative. -/
theorem Corr.comp_assoc {X Y Z W : SmProj k} {r s t : ℤ}
    (c : Corr C X Y r) (c' : Corr C Y Z s) (c'' : Corr C Z W t) : True := by sorry

/-- MC.0/composition-associative (2) and (3): the two identifications with Chow groups. -/
theorem Corr.chow_iso (X : SmProj k) (r : ℤ) : True := by sorry

/-- MC.0/composition-associative (4): composition computes the action on cycles. -/
theorem Corr.comp_action {X Y Z : SmProj k} {r s : ℤ}
    (c : Corr C X Y r) (c' : Corr C Y Z s) : True := by sorry

/-- MC.0/graph-correspondence: the class of the graph of `f : Y ⟶ X`, of degree zero. -/
def Corr.graph {X Y : SmProj k} (_f : True) : Corr C X Y 0 := by sorry

/-- The graph of the identity is the class of the diagonal, the unit for composition. -/
def Corr.diagonal (X : SmProj k) : Corr C X X 0 := by sorry

theorem Corr.diagonal_comp {X Y : SmProj k} {r : ℤ} (c : Corr C X Y r) : True := by sorry

theorem Corr.comp_diagonal {X Y : SmProj k} {r : ℤ} (c : Corr C X Y r) : True := by sorry

/-- MC.0/correspondence-functor: `Γ_{f ∘ g} = Γ_g ∘ Γ_f`, so the assignment is
contravariant. -/
theorem Corr.graph_comp {X Y Z : SmProj k} (f g : True) : True := by sorry

/-- MC.0/transpose-correspondence: for `X`, `Y` equidimensional of dimensions `d`, `e`
the switch gives `Corr^r(X, Y) ≃ Corr^{d - e + r}(Y, X)`. -/
def Corr.transpose {X Y : SmProj k} {r : ℤ} (d e : ℤ)
    (_c : Corr C X Y r) : Corr C Y X (d - e + r) := by sorry

theorem Corr.transpose_graph {X Y : SmProj k} (f : True) : True := by sorry

/-- MC.0/graph-acts-as-gysin-and-pushforward: pushforward by `Γ_f` is `f^!` and
pullback by `Γ_f` is `f_*`; the transposed graph exchanges them. -/
theorem Corr.graph_action {X Y : SmProj k} (f : True) : True := by sorry

/-- MC.0/category-of-correspondences: the graded `ℚ`-linear category. -/
structure CorrCat (k : Type u) [Field k] (C : ChowTheory k) where
  obj : SmProj k

instance : Category (CorrCat k C) := by sorry

instance : Preadditive (CorrCat k C) := by sorry

instance : Linear ℚ (CorrCat k C) := by sorry

/-- MC.0/tensor-of-correspondences. -/
instance : MonoidalCategory (CorrCat k C) := by sorry

instance : SymmetricCategory (CorrCat k C) := by sorry

/-- MC.0/projective-line-idempotents: on `ℙ¹` the two classes `c₀ = [x × X]` and
`c₂ = [X × x]` are orthogonal idempotents summing to the diagonal, and
`Corr^0(ℙ¹, ℙ¹) ≃ ℚ × ℚ`. -/
theorem Corr.projectiveLine_idempotents : True := by sorry

example : True := by sorry -- unit test: `c₀ ∘ c₂ = 0` and `c₂ ∘ c₀ = 0`

example : True := by sorry -- unit test: `c₀ + c₂ = [Δ]`

example : True := by sorry -- unit test: the endomorphism algebra is two-dimensional

/-- MC.0/pointed-curve-idempotents: on a pointed geometrically irreducible curve the
three classes `p₀`, `p₁ = [Δ] - p₀ - p₂`, `p₂` are orthogonal idempotents summing to
the diagonal. -/
theorem Corr.pointedCurve_idempotents : True := by sorry

example : True := by sorry -- unit test: for `ℙ¹` with its point, `p₁ = 0`

/-- MC.0/adequate-equivalence-relation: pullback, pushforward and intersection all
descend. `F` is the coefficient field, of characteristic zero. -/
structure Adequate (k : Type u) [Field k] (F : Type u) [Field F] where
  rel : True
  pullbackDescends : True
  pushforwardDescends : True
  productDescends : True

/-- MC.0/numerical-equivalence: vanishing of the intersection number against every
cycle of complementary dimension. -/
def NumEquiv (X : SmProj k) : True := by sorry

theorem NumEquiv.adequate : True := by sorry

/-- Numerical equivalence is the coarsest adequate relation. -/
theorem NumEquiv.coarsest (F : Type u) [Field F] (A : Adequate k F) : True := by sorry

example : True := by sorry -- unit test: on a curve, numerical equivalence of zero
                           -- cycles is equality of degrees

/-- MC.0/homological-equivalence: the kernel of the cycle class map of a chosen
theory. The theory is an argument, not a global constant. -/
def HomEquiv (X : SmProj k) (_theory : True) : True := by sorry

theorem HomEquiv.le_num (X : SmProj k) (theory : True) : True := by sorry

/-! ## MC.1 Pure motives and Tate objects -/

/-- MC.1/chow-motive: a triple `(X, p, m)`. The first two slots are a Karoubi object
of the degree zero correspondences; Mathlib's `CategoryTheory.Idempotents.Karoubi` is
the pinned form. -/
structure Motive (k : Type u) [Field k] (C : ChowTheory k) where
  obj : SmProj k
  proj : Corr C obj obj 0
  idem : True
  twist : ℤ

/-- Morphisms: `q ∘ Corr^{n-m}(X, Y) ∘ p`. -/
def Motive.Hom (M N : Motive k C) : Type u := by sorry

instance : Category (Motive k C) := by sorry

/-- MC.1/motives-category. -/
instance : Linear ℚ (Motive k C) := by sorry

/-- MC.1/motives-karoubian. -/
instance : IsIdempotentComplete (Motive k C) := by sorry

/-- MC.1/motives-additive. -/
instance : Preadditive (Motive k C) := by sorry

/-- MC.1/motive-functor-h: the contravariant `h`, with `h(X) = (X, [Δ], 0)`. -/
def h (X : SmProj k) : Motive k C := by sorry

theorem h_map_comp (f g : True) : True := by sorry

/-- MC.1/motives-monoidal. -/
instance : MonoidalCategory (Motive k C) := by sorry

instance : SymmetricCategory (Motive k C) := by sorry

/-- MC.1/tate-twist: `𝟙(n) = (Spec k, 1, n)`, and `M(n) = M ⊗ 𝟙(n)`. -/
def tate (n : ℤ) : Motive k C := by sorry

def Motive.twistBy (M : Motive k C) (n : ℤ) : Motive k C := by sorry

theorem tate_add (n m : ℤ) : True := by sorry

example : True := by sorry -- unit test: `𝟙(0)` is the unit object

example : True := by sorry -- unit test: `𝟙(1) ⊗ 𝟙(-1)` is the unit

/-- MC.1/lefschetz-motive: `(ℙ¹, c₂, 0) ≅ 𝟙(-1)` and `(ℙ¹, c₀, 0) ≅ 𝟙`. The sign of
the twist is fixed by the computation of `a' ∘ b'`. -/
theorem lefschetz_iso : True := by sorry

/-- MC.1/h-projective-line: `h(ℙ¹) ≅ 𝟙 ⊕ 𝟙(-1)`. -/
theorem h_projectiveLine : True := by sorry

/-- MC.1/motives-universal-property: a `ℚ`-linear symmetric monoidal functor out of
the degree zero correspondences that inverts the image of `c₂` factors uniquely. -/
theorem motives_universal (D : Type u) [Category D] [MonoidalCategory D]
    [SymmetricCategory D] [Linear ℚ D] [IsIdempotentComplete D] : True := by sorry

/-- MC.1/motive-dual: `h(X)(d)` is a left dual of `h(X)`, with unit and counit both
the class of the diagonal. -/
theorem motive_dual (X : SmProj k) (d : ℤ) : True := by sorry

/-- MC.1/motives-rigid. -/
instance : LeftRigidCategory (Motive k C) := by sorry

/-- MC.1/chow-group-of-motive: `CH^i(X, p, m) = p(CH^{i+m}(X) ⊗ ℚ)`. -/
def Motive.chow (M : Motive k C) (i : ℤ) : Type u := by sorry

/-- MC.1/chow-groups-representable: `CH^i(M) ≃ Hom(𝟙(-i), M)`, naturally in `M`. -/
theorem chow_representable (M : Motive k C) (i : ℤ) : True := by sorry

/-- MC.1/manin-identity-principle. -/
theorem manin {M N : Motive k C} (c : M ⟶ N)
    (hc : ∀ X : SmProj k, True) : IsIso c := by sorry

/-- MC.1/projective-bundle-formula: `⨁_{i<r} h(X)(-i) ≅ h(ℙ(E))`, by the explicit
correspondences `c_i = c₁(pr₂^*O(1))^i ∩ [Γ_p]`. -/
theorem projectiveBundle_formula : True := by sorry

/-- MC.1/diagonal-of-projective-bundle. -/
theorem diagonal_projectiveBundle : True := by sorry

/-- MC.1/motives-mod-adequate-relation: the same construction modulo an arbitrary
adequate relation, with the internal hom `(X × Y, ᵗp × q, dim X - m + n)`. -/
structure MotiveMod (k : Type u) [Field k] (F : Type u) [Field F]
    (A : Adequate k F) where
  obj : SmProj k
  proj : True
  twist : ℤ

instance {F : Type u} [Field F] {A : Adequate k F} : Category (MotiveMod k F A) := by sorry

instance {F : Type u} [Field F] {A : Adequate k F} :
    IsIdempotentComplete (MotiveMod k F A) := by sorry

instance {F : Type u} [Field F] {A : Adequate k F} :
    MonoidalCategory (MotiveMod k F A) := by sorry

instance {F : Type u} [Field F] {A : Adequate k F} :
    LeftRigidCategory (MotiveMod k F A) := by sorry

/-! ## MC.2 Realizations and cycle-class compatibility -/

/-- MC.2/weil-cohomology-data: `(D1)`, `(D2)`, `(D3)`. `k` is algebraically closed and
`F` has characteristic zero. -/
structure WeilData (k : Type u) [Field k] (F : Type u) [Field F] where
  /-- `(D1)` a contravariant functor to graded commutative `F`-algebras. -/
  H : SmProj k → ℤ → Type u
  pullback : True
  cup : True
  /-- `(D2)` the cycle class map `CH^i(X) → H^{2i}(X)`. -/
  cycleClass : True
  /-- `(D3)` the trace `H^{2d}(X) → F`. -/
  trace : True

/-- MC.2/classical-weil-cohomology: the axioms `(A)`, `(B)`, `(C)`. -/
structure WeilCohomology (k : Type u) [Field k] (F : Type u) [Field F]
    extends WeilData k F where
  /-- `(A)(a)` finite dimensionality. -/
  finite : True
  /-- `(A)(b)` the Poincare pairing is perfect. -/
  poincare : True
  /-- `(A)(c)` vanishing outside `[0, 2d]`. -/
  vanishing : True
  /-- `(A)(d)` the trace is an isomorphism. -/
  traceIso : True
  /-- `(B)` the Kuenneth isomorphism. -/
  kunneth : True
  /-- `(C)(a)` compatibility with the Gysin map. -/
  cycle_gysin : True
  /-- `(C)(b)` compatibility with proper pushforward. -/
  cycle_pushforward : True
  /-- `(C)(c)` intersection product to cup product. -/
  cycle_mul : True
  /-- `(C)(d)` the normalisation `∫ γ([Spec k]) = 1`. -/
  normalisation : True

variable {F : Type u} [Field F]

/-- MC.2/weil-pushforward: the contragredient of pullback, characterised by
`∫_X f^*b ∪ a = ∫_Y b ∪ f_*a`. Needs `(A)` only. -/
def WeilCohomology.pushforward (H : WeilCohomology k F) (f : True) : True := by sorry

theorem WeilCohomology.projection_formula (H : WeilCohomology k F) : True := by sorry

/-- MC.2/cycle-class-degree: the trace of a cycle class is the degree of the zero
cycle. Uses the normalisation `(C)(d)`. -/
theorem WeilCohomology.trace_cycleClass (H : WeilCohomology k F) (X : SmProj k) :
    True := by sorry

/-- MC.2/trace-of-a-product and the projection to a factor. -/
theorem WeilCohomology.trace_prod (H : WeilCohomology k F) (X Y : SmProj k) :
    True := by sorry

/-- MC.2/class-of-the-diagonal: with `γ([Δ]) = Σ e_{i,j} ⊗ e'_{2d-i,j}`,
`∫_X e_{i,j} ∪ e'_{2d-i,j'} = (-1)^i δ_{jj'}`. The sign is not decoration. -/
theorem WeilCohomology.diagonal_kunneth (H : WeilCohomology k F) (X : SmProj k) :
    True := by sorry

/-- MC.2/euler-characteristic-self-intersection:
`Σ (-1)^i dim H^i(X) = deg([Δ]·[Δ]) = deg(c_d(T_X) ∩ [X])`. -/
theorem WeilCohomology.euler_eq_selfIntersection (H : WeilCohomology k F)
    (X : SmProj k) : True := by sorry

/-- MC.2/weil-from-monoidal-functor: a monoidal `G` with `G(𝟙(1))` in degree `-2`
gives all the axioms except `(A)(c)` and `(A)(d)`. -/
theorem weil_of_functor (G : True) : True := by sorry

/-- MC.2/weil-to-monoidal-functor. -/
theorem functor_of_weil (H : WeilCohomology k F) : True := by sorry

/-- MC.2/realization-equivalence: classical Weil cohomology theories are exactly the
`ℚ`-linear symmetric monoidal functors `Motive k C ⥤ GradedVect F` with an
isomorphism `F[2] ≅ G(𝟙(1))`, such that `G(h X)` lives in nonnegative degrees and
`dim_F G⁰(h X) = 1`. -/
theorem realization_equivalence : True := by sorry

example : True := by sorry -- unit test: the two extra conditions are exactly
                           -- `(A)(c)` and `(A)(d)`

/-- MC.2/chow-groups-under-field-extension: the kernel of `CH_i(X) → CH_i(X_K)` is
torsion, and `CH_i(X_K)` is the colimit over finite subextensions. -/
theorem chow_base_change_kernel_torsion : True := by sorry

/-! ## MC.3 Numerical motives and semisimplicity -/

/-- MC.3/trace-formula-for-correspondences:
`⟨f, ᵗg⟩ = Σ_{i=0}^{2 dim X} (-1)^i Tr^i(f ∘ g)`. -/
theorem trace_formula (H : WeilCohomology k F) (X : SmProj k) : True := by sorry

/-- MC.3/pseudo-abelian-semisimplicity: an `F`-linear pseudo-abelian category whose
endomorphism algebras are finite dimensional and semisimple is semisimple abelian.
Proved by Wedderburn; Tau Ceti has `TauCeti.WedderburnPresentation`. -/
theorem semisimple_of_end (D : Type u) [Category D] [Linear F D]
    [IsIdempotentComplete D] (hEnd : ∀ M : D, True) : True := by sorry

/-- MC.3/dual-numbers-non-example: the finitely generated free modules over `F[ε]`
form a pseudo-abelian `F`-linear category with a faithful functor to vector spaces in
which every indecomposable is simple, and which is not abelian. This is why the
hypothesis of the previous theorem cannot be weakened. -/
theorem dualNumbers_not_abelian : True := by sorry

/-- MC.3/jannsen-semisimplicity: for an adequate relation the following are
equivalent: the motives are semisimple abelian; `A^{dim X}(X × X)` is a finite
dimensional semisimple `F`-algebra for every `X`; the relation is numerical
equivalence. Unconditional: no standard conjecture is used. -/
theorem jannsen (A : Adequate k F) : True := by sorry

/-- MC.3/radical-of-homological-correspondences: under algebraic Kuenneth projectors
the kernel of `A_hom → A_num` is the Jacobson radical and is nilpotent. -/
theorem radical_eq_kernel (H : WeilCohomology k F) (X : SmProj k)
    (hC : True) : True := by sorry

/-- MC.3/rank-of-a-motive: `rk h(X) = ⟨Δ, Δ⟩`, which can be negative, so no fibre
functor exists for the unmodified commutativity constraint. -/
theorem rank_eq_selfIntersection (X : SmProj k) : True := by sorry

example : True := by sorry -- unit test: for a curve of genus `g`, `rk h(C) = 2 - 2g`

/-- MC.3/numerical-motives-tannakian: after changing the commutativity constraint by
`(-1)^{rs}` the numerical motives are a semisimple `F`-linear Tannakian category,
assuming the Kuenneth projectors are algebraic for every variety. -/
theorem numerical_tannakian (H : WeilCohomology k F) (hC : True) : True := by sorry

/-! ## MC.4 Geometric mixed motives and motivic cohomology

Everything RS-08 assigns to `MotivicEtaleKTheory:M.4` and `M.5a` is a parameter here:
the ambient triangulated category of effective motives, the motive `M(X)` of a smooth
scheme, the Tate object, the cancellation theorem, and Bloch's higher Chow groups. -/

section Geometric

variable (DMeff : Type u) [Category DMeff] [Preadditive DMeff]
variable (Mot : True) (cancellation : True) (higherChow : True)

/-- MC.4/effective-geometric-motives: the thick triangulated subcategory generated by
the motives of smooth schemes. Thickness is what makes the image of a Chow projector
a geometric motive. -/
def DMeffGm : Type u := by sorry

/-- MC.4/tate-stabilised-motives: invert the Tate twist. Full faithfulness of the
comparison with the effective category is the cancellation theorem, imported. -/
def DMgm : Type u := by sorry

theorem DMgm.effective_fullyFaithful : True := by sorry

/-- MC.4/homotopy-invariance-and-mayer-vietoris. -/
theorem homotopy_invariance : True := by sorry

theorem mayer_vietoris : True := by sorry

/-- MC.4/motive-of-projective-space: `M(𝔸¹) ≅ R`, `M(𝔾_m) ≅ R ⊕ R(1)[1]`,
`M(ℙⁿ) ≅ ⨁_{i≤n} R(i)[2i]`, and the projective bundle isomorphism. -/
theorem motive_affineLine : True := by sorry

theorem motive_multiplicativeGroup : True := by sorry

theorem motive_projectiveSpace (n : ℕ) : True := by sorry

/-- MC.4/gysin-triangle: for `Z ⊆ X` smooth of codimension `c` there is a
distinguished triangle `M(X - Z) → M(X) → M(Z)(c)[2c] → M(X - Z)[1]`. -/
theorem gysin_triangle : True := by sorry

example : True := by sorry -- unit test: for a closed point of a smooth curve the
                           -- third term is `R(1)[2]`

/-- MC.4/geometric-motives-rigid. -/
theorem DMgm_rigid : True := by sorry

/-- MC.4/chow-motives-into-geometric-motives:
`Hom_Chow(Y, X) ≃ Hom(M X, M Y)`, contravariantly, with the Lefschetz motive going to
`R(1)[2]`. -/
theorem chow_into_DMgm : True := by sorry

/-- MC.4/motivic-cohomology-higher-chow: `H^{n,i}(X, ℤ) ≃ CH^i(X, 2i - n)`, so
`H^{2i,i}(X, ℤ) ≃ CH^i(X)` and the groups vanish for `n > 2i`. -/
theorem motivic_eq_higherChow : True := by sorry

end Geometric

/-- MC.4/blow-up-triangle-and-formula: under resolution of singularities, an abstract
blow-up with centre `Z` gives a distinguished triangle, and for smooth `X`, `Z` with
`Z` of codimension `c` the motive of the blow-up splits off `c - 1` Tate twists. -/
theorem blowup_triangle (X Z : Type) : True := by sorry

theorem blowup_formula (X Z : Type) (c : ℕ) : True := by sorry

/-- MC.4/motives-with-compact-support: `Mᶜ(X) = z_equi(X,0)`, contravariant for étale
maps, covariant for proper maps, equal to `M(X)` for proper `X`, with
`Mᶜ(𝔸ⁱ) ≅ ℤ(i)[2i]` and a localisation triangle under resolution of singularities. -/
def motiveCompactSupport (X : Type) : Type := by sorry

theorem motiveCompactSupport_proper (X : Type) : True := by sorry

theorem motiveCompactSupport_affine (i : ℕ) : True := by sorry

theorem motiveCompactSupport_localisation (X Z : Type) : True := by sorry

theorem motiveCompactSupport_tensor (X Y : Type) : True := by sorry

/-- MC.4/borel-moore-motivic-homology: `H^{n,i}_c` and `H^{BM}_{n,i}`, the bivariant
cycle cohomology, the shifting theorem and Friedlander-Voevodsky duality. -/
def borelMooreMotivicHomology (X : Type) (n i : ℤ) : Type := by sorry

theorem borelMoore_localisation (X Z : Type) : True := by sorry

theorem motives_duality (X Y T : Type) (d : ℕ) : True := by sorry

/-- MC.4/cancellation-over-a-perfect-field: tensoring with `ℤ(1)` is fully faithful.
The first form assumes resolution of singularities; Voevodsky's later form assumes
only that the base field is perfect. -/
theorem cancellation_of_resolution (M N : Type) : True := by sorry

theorem cancellation_of_perfect (M N : Type) : True := by sorry

/-- MC.4/nisnevich-versus-etale-and-rational-coefficients: with `ℚ ⊆ R` the Nisnevich
and étale theories agree, and over a perfect field Lichtenbaum motivic cohomology with
rational coefficients is motivic cohomology with rational coefficients. -/
theorem nisnevich_eq_etale_rationally (F : Type) : True := by sorry

theorem lichtenbaum_eq_motivic_rationally (X : Type) : True := by sorry

/-! ## MC.5 Nori motives and diagram categories -/

/-- MC.5/diagram: a directed graph with a distinguished identity edge at each vertex.
Not a category: there is no composition, and a representation respects none. -/
structure Diagram where
  vertex : Type u
  edge : vertex → vertex → Type u
  id : ∀ v, edge v v

/-- A representation in finitely generated `R`-modules. -/
structure Diagram.Rep (D : Diagram) (R : Type u) [CommRing R] where
  obj : D.vertex → Type u
  module : ∀ v, AddCommGroup (obj v)
  smul : ∀ v, Module R (obj v)
  finite : ∀ v, True
  map : ∀ {v w}, D.edge v w → True

/-- MC.5/endomorphism-coalgebra: the colimit over finite subdiagrams of the duals of
the endomorphism rings of the restrictions. -/
def Diagram.Rep.coalgebra {D : Diagram} {R : Type u} [CommRing R]
    (_T : D.Rep R) : Type u := by sorry

instance {D : Diagram} {R : Type u} [CommRing R] (T : D.Rep R) :
    Coalgebra R (T.coalgebra) := by sorry

/-- MC.5/diagram-category: the finite comodules over that coalgebra. Tau Ceti's
`TauCeti.FGComoduleCat` is the pinned form of the target. -/
def Diagram.Rep.category {D : Diagram} {R : Type u} [CommRing R]
    (_T : D.Rep R) : Type u := by sorry

instance {D : Diagram} {R : Type u} [CommRing R] (T : D.Rep R) :
    Category (T.category) := by sorry

instance {D : Diagram} {R : Type u} [CommRing R] (T : D.Rep R) :
    Abelian (T.category) := by sorry

/-- The fibre functor, faithful, through which `T` factors. -/
def Diagram.Rep.fibre {D : Diagram} {R : Type u} [CommRing R]
    (_T : D.Rep R) : True := by sorry

/-- The universal property. The source read here states it and refers the proof to a
separate paper that was not obtained; this signature records the statement, not a
proof. -/
theorem Diagram.Rep.universal {D : Diagram} {R : Type u} [CommRing R]
    (T : D.Rep R) : True := by sorry

/-- MC.5/diagram-category-generation: every object is a subquotient of a finite direct
sum of the objects attached to vertices. -/
theorem Diagram.Rep.subquotient {D : Diagram} {R : Type u} [CommRing R]
    (T : D.Rep R) : True := by sorry

/-- MC.5/graded-multiplicative-diagram: a grading and a commutative product with unit
make the diagram category a tensor category and the coalgebra a bialgebra. -/
structure Diagram.Multiplicative (D : Diagram) where
  grading : D.vertex → ℤ
  mul : D.vertex → D.vertex → D.vertex
  unit : D.vertex
  grading_mul : True
  assoc : True
  comm : True

/-- MC.5/diagram-localisation: localising at a vertex whose value is locally free of
rank one. -/
def Diagram.localise (D : Diagram) (_v : D.vertex) : Diagram := by sorry

theorem Diagram.localise_category {D : Diagram} (v : D.vertex) : True := by sorry

/-- MC.5/effective-pairs-diagram: vertices `(X, Y, i)`, functoriality edges against
morphisms and coboundary edges raising the degree by one. -/
def pairDiagram : Diagram := by sorry

/-- Good pairs: relative singular cohomology concentrated in degree `i`. -/
def goodPairs : Diagram := by sorry

/-- Very good pairs: `X` affine, `X - Y` smooth, and the dimension conditions. -/
def veryGoodPairs : Diagram := by sorry

/-- MC.5/nori-motives. -/
def NoriMotivesEff : Type u := by sorry

def NoriMotives : Type u := by sorry

instance : Category NoriMotives := by sorry

instance : Abelian NoriMotives := by sorry

instance : MonoidalCategory NoriMotives := by sorry

/-- `𝟙(-1) = H¹_Nori(𝔾_m, {1})`, defined from geometry and not by fiat. -/
def noriTate (n : ℤ) : NoriMotives := by sorry

/-- MC.5/nori-tensor-category: the tensor structure and the localisation statement.
Both depend on a sign convention for the boundary maps, fixed once. -/
theorem nori_tensor : True := by sorry

/-- MC.5/diagram-comparison: pairs, good pairs and very good pairs give equivalent
categories. -/
theorem nori_diagram_comparison : True := by sorry

/-- MC.5/nori-generators: every object is a subquotient of a sum of `H^i_Nori(X, Y)`
for `X = W - W_∞`, `Y = W₀ - (W₀ ∩ W_∞)` with `W` smooth projective and
`W₀ ∪ W_∞` a normal crossings divisor. -/
theorem nori_generators : True := by sorry

/-- MC.5/cohomology-with-supports, with the long exact sequence and the computations
`H^{2n}_Nori(ℙᴺ) = 𝟙(-n)` and `H^{2n}_Z(X) = 𝟙(-n)`. -/
theorem nori_supports : True := by sorry

/-- MC.5/nori-rigidity. -/
instance : LeftRigidCategory NoriMotives := by sorry

/-! ## MC.6 Motivic Galois groups and periods -/

/-- MC.6/torsor: the basepoint free notion. A group is a torsor by
`(g, h, k) ↦ g h⁻¹ k`, and a torsor with a point is a group. -/
class Torsor (X : Type u) where
  op : X → X → X → X
  right : ∀ x y, op x y y = x
  left : ∀ x y, op x x y = y
  assoc₁ : ∀ x y z u v, op (op x y z) u v = op x y (op z u v)
  assoc₂ : ∀ x y z u v, op x (op u z y) v = op (op x y) z (op u v)

instance (G : Type u) [Group G] : Torsor G := by sorry

/-- A torsor with a chosen point is a group, and the two constructions are inverse. -/
def Torsor.toGroup {X : Type u} [Torsor X] (_e : X) : Group X := by sorry

/-- MC.6/affine-torsor-groups: an affine torsor carries affine group schemes on both
sides. -/
theorem affine_torsor_groups : True := by sorry

/-- MC.6/tensor-automorphism-group: the motivic Galois group, the tensor automorphism
group of the fibre functor. Tau Ceti has `TauCeti.Tannaka.tensorAutFunctor` and
`TauCeti.Tannaka.reconstructedPoint`. -/
def motivicGalois : Type u := by sorry

theorem motivicGalois_reconstruct : True := by sorry

theorem motivicGalois_representations : True := by sorry

/-- MC.6/comparison-algebra: `A₁₂ = colim_F (Hom(T₁|F, T₂|F))ᵛ`, a commutative ring
and a comodule over the coalgebra of `T₁`. -/
def comparisonAlgebra {D : Diagram} {R : Type u} [CommRing R]
    (_T₁ _T₂ : D.Rep R) : Type u := by sorry

/-- MC.6/period-space-of-a-diagram: generated by `(p, ω, γ)` modulo linearity and
change of variables. -/
def periodSpace {D : Diagram} {R : Type u} [CommRing R]
    (_T₁ _T₂ : D.Rep R) : Type u := by sorry

/-- MC.6/periods-equal-comparison-algebra: the natural map is an isomorphism. -/
theorem period_eq_comparison {D : Diagram} {R : Type u} [CommRing R]
    (T₁ T₂ : D.Rep R) : True := by sorry

/-- MC.6/formal-periods: `P⁺` generated by `(X, D, ω, γ)` modulo linearity, change of
variables and the boundary relation for a triple; `P` is its localisation at the
period of `(𝔾_m, {1}, dX/X, S¹)`. -/
def formalPeriodsEff : Type u := by sorry

def formalPeriods : Type u := by sorry

/-- MC.6/formal-periods-equal-comparison-algebra: `P = P₁₂ = A₁₂` for the diagram of
pairs with de Rham and singular cohomology. -/
theorem formalPeriods_eq_comparison : True := by sorry

/-- MC.6/very-good-pairs-generate-periods. -/
theorem formalPeriods_veryGood : True := by sorry

/-- MC.6/fibre-functor-extension: the second representation extends to a fibre functor
on the diagram category of the first. This is where the universal property is used. -/
theorem fibre_extension : True := by sorry

/-- MC.6/iso-torsor: the scheme of tensor isomorphisms is a torsor, with inversion
identifying the two orders. -/
theorem iso_torsor : True := by sorry

/-- MC.6/period-torsor: `Spec P` is a torsor under the motivic Galois group of Nori's
category of mixed motives over `ℚ`. The period conjecture is not used. -/
theorem period_torsor : True := by sorry

example : True := by sorry -- unit test: the evaluation `P → ℂ` is an algebra map;
                           -- its injectivity is the period conjecture and is not claimed

/-! ## MC.7 Cycle conjectures and proven special cases

Predicates, not theorems. Each takes the Weil cohomology theory as an argument. -/

/-- MC.7/kunneth-conjecture-C: the Kuenneth components of the diagonal are algebraic.
Equivalently, the diagonal decomposes into orthogonal idempotents modulo numerical
equivalence. -/
def ConjectureC (H : WeilCohomology k F) (_X : SmProj k) : Prop := by sorry

/-- MC.7/conjecture-D: numerical equivalence implies homological equivalence. -/
def ConjectureD (H : WeilCohomology k F) : Prop := by sorry

theorem conjectureD_one_direction (H : WeilCohomology k F) : True := by sorry

/-- MC.7/known-cases-of-conjecture-C: dimension at most two, abelian varieties, base
fields inside `F̄_p`, and products. Only the product case is proved in a source read
for this packet; the other three rest on Jannsen's report of Murre, Lieberman and
Katz-Messing, which is recorded as a gap. -/
theorem conjectureC_product (H : WeilCohomology k F) (X Y : SmProj k)
    (hX : ConjectureC H X) (hY : ConjectureC H Y) : True := by sorry

theorem conjectureC_of_dim_le_two (H : WeilCohomology k F) (X : SmProj k) : True := by sorry

theorem conjectureC_of_abelianVariety (H : WeilCohomology k F) (X : SmProj k) : True := by sorry

theorem conjectureC_of_finiteField (H : WeilCohomology k F) (X : SmProj k) : True := by sorry

/-- MC.7/smash-nilpotence: for `x`, `x'` rational points of a geometrically
irreducible smooth projective `X`, the `n`-fold exterior power of `[x] - [x']` is
torsion in `CH₀(Xⁿ)` for `n` large. Torsion, not zero. -/
theorem smash_nilpotence (X : SmProj k) : True := by sorry

/-- MC.7/hodge-conjecture: over `ℂ`, every rational class of type `(p,p)` is a
rational combination of cycle classes. Rational, not integral; projective, not
Kähler. -/
def HodgeClass (X : Type) (p : ℕ) : Type := by sorry

def HodgeConjecture (X : Type) (p : ℕ) : Prop := by sorry

theorem hodgeConjecture_degree_two (X : Type) : True := by sorry

/-- MC.7/tate-conjecture: over a field finitely generated over the prime field, the
Galois-fixed part of `H^{2a}(X, ℚ_l(a))` is spanned by cycle classes. -/
def TateClass (X : Type) (a : ℕ) : Type := by sorry

def TateConjecture (X : Type) (a : ℕ) : Prop := by sorry

theorem tateConjecture_of_finite_extension (X : Type) (a : ℕ) : True := by sorry

/-- MC.7/tate-conjecture-variants: the strong, Borel-Moore, separable-closure,
integral and Tate-Beilinson forms. The integral form is mostly false and is recorded
as a variant, never asserted. -/
def StrongTateConjecture (X : Type) (a : ℕ) : Prop := by sorry

def TateBeilinsonConjecture (X : Type) (a : ℕ) : Prop := by sorry

theorem strongTate_implies_conjectureD (X : Type) : True := by sorry

/-- MC.7/lefschetz-and-hodge-standard-conjectures. In characteristic zero the Hodge
standard conjecture is a theorem; the Lefschetz standard conjecture is open. -/
def LefschetzStandardConjecture (H : WeilCohomology k F) (X : SmProj k) : Prop := by sorry

def HodgeStandardConjecture (H : WeilCohomology k F) (X : SmProj k) : Prop := by sorry

theorem lefschetzStandard_implies_C (H : WeilCohomology k F) (X : SmProj k) : True := by sorry

theorem hodgeStandard_char_zero (H : WeilCohomology k F) (X : SmProj k) : True := by sorry

/-- MC.7/bloch-beilinson-filtration-and-murre: the Chow-level idempotent decomposition
is stated; the further conditions of Murre and the axioms of the filtration are in no
source read for this packet and are NOT stated here. -/
def MurreDecomposition (X : SmProj k) : Prop := by sorry

/-- MC.7/motivic-t-structure: no statement is planned, and this is the record of why. -/
theorem no_motivic_t_structure : True := by sorry

/-- MC.7/tate-and-hodge-known-cases: each entry carries its base field, characteristic,
codimension and coefficients. -/
theorem tate_divisors_abelian_finiteField (A : Type) : True := by sorry

theorem tate_divisors_abelian_numberField (A : Type) : True := by sorry

theorem tate_divisors_h20_one (X : Type) : True := by sorry

theorem tate_K3_finiteField (X : Type) : True := by sorry

end TauCeti.Motives
