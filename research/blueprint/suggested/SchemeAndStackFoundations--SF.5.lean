import Mathlib.AlgebraicGeometry.AlgebraicCycle.Basic
import Mathlib.AlgebraicGeometry.Morphisms.Proper
import Mathlib.AlgebraicGeometry.Morphisms.Flat
import Mathlib.AlgebraicGeometry.Morphisms.Smooth
import Mathlib.AlgebraicGeometry.Limits
import Mathlib.Algebra.DualNumber
import Mathlib.LinearAlgebra.TensorProduct.Basic
import Mathlib.Algebra.DirectSum.Basic
import Mathlib.Algebra.Polynomial.Basic
import Mathlib.Algebra.MvPolynomial.Basic
import Mathlib.CategoryTheory.Abelian.Basic
import Mathlib.Algebra.Homology.ShortComplex.ShortExact
import Mathlib.CategoryTheory.Bicategory.Functor.Pseudofunctor
import Mathlib.CategoryTheory.Bicategory.LocallyDiscrete
import Mathlib.CategoryTheory.Category.Cat
import Mathlib.Analysis.SpecialFunctions.Pow.Real
import Mathlib.Data.ZMod.Basic
import Lean.Elab.Tactic.Omega
import TauCeti.AlgebraicGeometry.LineBundle.Basic
import TauCeti.AlgebraicGeometry.WeilDivisor.Scheme.Principal
import TauCeti.AlgebraicGeometry.Cohomology.EulerCharacteristic

/-!
This file is not the roadmap and is not exhaustive. The reader document is definitive.
These forms suggest names and signatures for contributors and reviewers. Every declaration
is a plan. Omitted hypotheses are listed by each node; proving these weakened signatures
without restoring those hypotheses is not an implementation of the roadmap.

The native Scheme, AlgebraicCycle, module-sheaf, invertible-sheaf, principal-divisor,
quotient, tensor-product, direct-sum and pseudofunctor carriers are reused. Supplier
helpers and geometric test fixtures have typed mathematical outputs. No missing
condition is encoded as a Prop field or as a definition proved by a placeholder.
-/

noncomputable section
open CategoryTheory CategoryTheory.Limits AlgebraicGeometry
open TauCeti.AlgebraicGeometry
open scoped TensorProduct DirectSum ZeroObject
set_option linter.unusedVariables false
set_option warn.classDefReducibility false
set_option autoImplicit false
universe u v
namespace TauCeti.AlgebraicGeometry.Intersection

abbrev Line (X : Scheme.{u}) := InvertibleSheaf X
-- Jacobian Layer A supplier forms: tensor, dual, powers and pullback of actual invertible sheaves.
def lineTensor {X : Scheme.{u}} (L M : Line X) : Line X := by sorry
def lineDual {X : Scheme.{u}} (L : Line X) : Line X := by sorry
def linePower {X : Scheme.{u}} (L : Line X) (m : ℕ) : Line X := by sorry
def linePullback {X Y : Scheme.{u}} (f : X ⟶ Y) (L : Line Y) : Line X := by sorry
def divisorLine {D X : Scheme.{u}} (i : D ⟶ X) : Line X := by sorry
-- SF.0/SF.2 helper outputs. Conditions are the source-scoped packet requests.
def freeModule (X : Scheme.{u}) (n : ℕ) : X.Modules := _root_.SheafOfModules.free (R := X.ringCatSheaf) (ULift.{u} (Fin n))
def unitModule (X : Scheme.{u}) : X.Modules := _root_.SheafOfModules.unit X.ringCatSheaf
def directSumModule {X : Scheme.{u}} (E F : X.Modules) : X.Modules := biprod E F
def moduleTensor {X : Scheme.{u}} (E F : X.Modules) : X.Modules := by sorry
def vectorBundle (X : Scheme.{u}) (E : X.Modules) : Scheme.{u} := by sorry
def canonicalLine (X : Scheme.{u}) : Line X := by sorry
def tangentBundle (X : Scheme.{u}) : X.Modules := by sorry
def divisorToLine {X : Scheme.{u}} (D : SchemeWeilDivisor X) : Line X := by sorry
def schemeDimension (X : Scheme.{u}) : ℕ := by sorry
-- Finite-dimensional coherent cohomology and vanishing above dim X are omitted here.
def eulerCharacteristic (k : Type u) [Field k] (X : Scheme.{u}) [X.Over (Spec (.of k))] (M : X.Modules) : ℤ := Scheme.Modules.eulerCharBelow k X M (schemeDimension X + 1)
def surfaceH0 (k : Type u) [Field k] (S : Scheme.{u}) [S.Over (Spec (.of k))] (D : SchemeWeilDivisor S) : ℤ := (Module.finrank k (Scheme.Modules.Cohomology (divisorToLine D).obj 0) : ℤ)
def surfaceH1 (k : Type u) [Field k] (S : Scheme.{u}) [S.Over (Spec (.of k))] (D : SchemeWeilDivisor S) : ℤ := (Module.finrank k (Scheme.Modules.Cohomology (divisorToLine D).obj 1) : ℤ)

def closedBaseChange {Z X Y : Scheme.{u}} (i : Z ⟶ X) (f : Y ⟶ X) : pullback i f ⟶ Y := pullback.snd _ _
def closedBaseChangeProjection {Z X Y : Scheme.{u}} (i : Z ⟶ X) (f : Y ⟶ X) : pullback i f ⟶ Z := pullback.fst _ _
instance closedBaseChange_closed {Z X Y : Scheme.{u}} (i : Z ⟶ X) [IsClosedImmersion i] (f : Y ⟶ X) : IsClosedImmersion (closedBaseChange i f) := by sorry
instance closedBaseChangeProjection_flat {Z X Y : Scheme.{u}} (i : Z ⟶ X) (f : Y ⟶ X) [Flat f] : Flat (closedBaseChangeProjection i f) := by sorry
def emptyTo (X : Scheme.{u}) : (∅ : Scheme.{u}) ⟶ X := by sorry
instance emptyTo_closed (X : Scheme.{u}) : IsClosedImmersion (emptyTo X) := by sorry

-- Concrete geometric fixtures: projective spaces are the SF.0/5 quotient Proj objects over ℚ.
def p1 : Scheme := by sorry
def p2 : Scheme := by sorry
instance p1_integral : IsIntegral p1 := by sorry
instance p1_over : p1.Over (Spec (.of ℚ)) := by sorry
instance p2_over : p2.Over (Spec (.of ℚ)) := by sorry
def p1O1 : Line p1 := by sorry
def p2O1 : Line p2 := by sorry
def p1Coordinate : Additive p1.functionFieldˣ := by sorry
def p2Hyperplane : p1 ⟶ p2 := by sorry
instance p2Hyperplane_closed : IsClosedImmersion p2Hyperplane := by sorry

def affineLine : Scheme := Spec (.of (Polynomial ℚ))
def affinePlane : Scheme := Spec (.of (MvPolynomial (Fin 2) ℚ))
def affineNode : Scheme := Spec (.of (MvPolynomial (Fin 2) ℚ ⧸ Ideal.span ({MvPolynomial.X 0 * MvPolynomial.X 1} : Set (MvPolynomial (Fin 2) ℚ))))
def affineLineToPoint : affineLine ⟶ Spec (.of ℚ) := by sorry
instance affineLineToPoint_flat : Flat affineLineToPoint := by sorry
def affineOrigin : Spec (.of ℚ) ⟶ affineLine := by sorry
instance affineOrigin_closed : IsClosedImmersion affineOrigin := by sorry
def nodeOrigin : Spec (.of ℚ) ⟶ affineNode := by sorry
instance nodeOrigin_closed : IsClosedImmersion nodeOrigin := by sorry
def doublePointToPoint : Spec (.of (DualNumber ℚ)) ⟶ Spec (.of ℚ) := by sorry
instance doublePointToPoint_flat : Flat doublePointToPoint := by sorry
def doublePointResidueModule : (Spec (.of (DualNumber ℚ))).Modules := by sorry

def p1Product : Scheme := pullback (p1 ↘ Spec (.of ℚ)) (p1 ↘ Spec (.of ℚ))
instance p1Product_over : p1Product.Over (Spec (.of ℚ)) := by sorry
def productRulingOne : SchemeWeilDivisor p1Product := by sorry
def productRulingTwo : SchemeWeilDivisor p1Product := by sorry
def p2LineDivisor : SchemeWeilDivisor p2 := by sorry
def productFirstRulingLine : Line p1Product := by sorry



/- SchemeAndStackFoundations:SF.5/dimension-function
Fix a locally Noetherian universally catenary base S with an integer dimension function δS. For X locally of finite type over S set δX(x)=δS(f(x))+trdeg(κ(x)/κ(f(x))). Along an immediate specialization the value falls by one. Dimension grades always use this induced function, including on open subschemes; they are not silently replaced by Krull dimension of the open scheme.
Omitted hypotheses: The prototype records the exact cover rule. The universally catenary base, the scheme-level transcendence-degree construction and induced-function proof are an SF.0 request; no unspecified dimension axiom is substituted. -/

structure DimensionFunction (X : Scheme.{u}) where
  value : X → ℤ
  cover : ∀ {x y : X}, x ⋖ y → value y = value x + 1

def DimensionFunction.shift {X : Scheme.{u}} (δ : DimensionFunction X) (n : ℤ) :
    DimensionFunction X := by sorry

/-- Adding a constant n adds n to every dimension value. -/
lemma DimensionFunction.shift_value {X : Scheme.{u}} (δ : DimensionFunction X) (n : ℤ) (x : X) : (δ.shift n).value x = δ.value x + n := by sorry
/-- Dimension functions with the same value at every point are equal. -/
lemma DimensionFunction.ext {X : Scheme.{u}} (δ ε : DimensionFunction X) (h : ∀ x, δ.value x = ε.value x) : δ = ε := by sorry
/-- At a cover x immediately specializing from y, δ(y)=δ(x)+1. -/
lemma DimensionFunction.cover_value {X : Scheme.{u}} (δ : DimensionFunction X) {x y : X} (h : x ⋖ y) : δ.value y = δ.value x + 1 := by sorry
-- Unit test TauCeti.AlgebraicGeometry.Intersection.DimensionFunction.test_shift_twice: Shifting by 2 and then by −1 shifts the original value by 1.
example {X : Scheme.{u}} (δ : DimensionFunction X) (x : X) : ((δ.shift 2).shift (-1)).value x = δ.value x + 1 := by sorry
-- Unit test TauCeti.AlgebraicGeometry.Intersection.DimensionFunction.test_dvr_generic_shift: For a DVR base with δ(closed)=0 the generic value is 1; the inherited grade on its generic open is 1 even though that open has Krull dimension 0.
example {X : Scheme.{u}} (δ : DimensionFunction X) {s η : X} (h : s ⋖ η) (hs : δ.value s = 0) : δ.value η = 1 := by sorry
-- Unit test TauCeti.AlgebraicGeometry.Intersection.DimensionFunction.test_shift_zero: Zero shift preserves the entire dimension function.
example {X : Scheme.{u}} (δ : DimensionFunction X) : δ.shift 0 = δ := by sorry

-- Induced dimensions, restriction and generic lengths are the exact SF.0 supplier request.
def restrictDimension {X Y : Scheme.{u}} (i : X ⟶ Y) (δ : DimensionFunction Y) : DimensionFunction X := by sorry
def genericLength {X Z : Scheme.{u}} (i : Z ⟶ X) (δ : DimensionFunction X) (d : ℤ) (η : X) : ℤ := by sorry
def p1Dimension : DimensionFunction p1 := by sorry
def p2Dimension : DimensionFunction p2 := by sorry
def pointDimension : DimensionFunction (Spec (.of ℚ)) := by sorry
def affineLineDimension : DimensionFunction affineLine := by sorry
def doublePointDimension : DimensionFunction (Spec (.of (DualNumber ℚ))) := by sorry
def p1ProductDimension : DimensionFunction p1Product := by sorry
def nodeDimension : DimensionFunction affineNode := by sorry


/- SchemeAndStackFoundations:SF.5/graded-cycle
Z_d(X) is the additive subgroup of the native integer AlgebraicCycle X ℤ whose coefficient is zero at every x with δX(x)≠d. It inherits local finiteness from the native carrier. A generator is the unit coefficient at the generic point of an integral closed subscheme with δ-dimension d.
Omitted hypotheses: The precise source hypotheses are in the packet and reader. -/

def cycleSubgroup (X : Scheme.{u}) (δ : DimensionFunction X) (d : ℤ) :
    AddSubgroup (AlgebraicCycle X ℤ) where
  carrier := {c | ∀ x, δ.value x ≠ d → c x = 0}
  zero_mem' := by simp
  add_mem' := by intro a b ha hb x hx; simp [ha x hx, hb x hx]
  neg_mem' := by intro a ha x hx; simp [ha x hx]

abbrev Cycle (X : Scheme.{u}) (δ : DimensionFunction X) (d : ℤ) := cycleSubgroup X δ d

def Cycle.single {X : Scheme.{u}} (δ : DimensionFunction X) (d : ℤ) (x : X)
    (hx : δ.value x = d) (n : ℤ) : Cycle X δ d := by sorry

/-- The inclusion into the native AlgebraicCycle is injective. -/
lemma Cycle.coe_injective {X : Scheme.{u}} (δ : DimensionFunction X) (d : ℤ) : Function.Injective (fun c : Cycle X δ d => c.val) := by sorry
/-- The coefficient of n[x] at x is n. -/
lemma Cycle.coeff_single {X : Scheme.{u}} (δ : DimensionFunction X) (d : ℤ) (x : X) (hx : δ.value x = d) (n : ℤ) : (Cycle.single δ d x hx n).val x = n := by sorry
/-- Homogeneous cycles are equal exactly when all point coefficients agree. -/
lemma Cycle.ext {X : Scheme.{u}} (δ : DimensionFunction X) (d : ℤ) (a b : Cycle X δ d) (h : ∀ x, a.val x = b.val x) : a = b := by sorry
-- Unit test TauCeti.AlgebraicGeometry.Intersection.Cycle.test_coefficient_two: The generator 2[x] has coefficient 2, so multiplicities survive the subtype.
example {X : Scheme.{u}} (δ : DimensionFunction X) (d : ℤ) (x : X) (hx : δ.value x = d) : (Cycle.single δ d x hx 2).val x = 2 := by sorry
-- Unit test TauCeti.AlgebraicGeometry.Intersection.Cycle.test_wrong_grade_zero: A d-cycle has coefficient zero at a point of dimension d+1.
example {X : Scheme.{u}} (δ : DimensionFunction X) (d : ℤ) (c : Cycle X δ d) (x : X) (hx : δ.value x = d + 1) : c.val x = 0 := by sorry
-- Unit test TauCeti.AlgebraicGeometry.Intersection.Cycle.test_native_weil_coefficient: The coheight-one coefficient of a native scheme Weil divisor is unchanged by the existing cycle inclusion.
example {X : Scheme.{u}} (D : SchemeWeilDivisor X) (x : CodimensionOnePoint X) : SchemeWeilDivisor.toAlgebraicCycle D x = D x := by sorry

-- Marked point cycles use the native carrier; homogeneous fixtures are its subtypes.
def p1ZeroCycle : AlgebraicCycle p1 ℤ := by sorry
def p1InfinityCycle : AlgebraicCycle p1 ℤ := by sorry
def p1ZeroHomogeneous : Cycle p1 p1Dimension 0 := by sorry
def p1InfinityHomogeneous : Cycle p1 p1Dimension 0 := by sorry


/- SchemeAndStackFoundations:SF.5/fundamental-cycle
For a closed subscheme Z⊂X with δ-dimension at most d, its d-dimensional fundamental cycle has coefficient length(O_Z,η) at a generic point η of a d-dimensional irreducible component and zero elsewhere. Nilpotents contribute generic lengths. Lower-dimensional components and embedded associated points do not contribute to this top-dimensional cycle.
Omitted hypotheses: The δ-dimension bound and locally Noetherian local-length finiteness are stated in the packet; their predicate-level signatures are not yet available. The auxiliary genericLength/restriction/base-change functions below are explicit SF.0 supplier prototypes, not new subscheme carriers. -/

def fundamental {X : Scheme.{u}} (δ : DimensionFunction X) (d : ℤ)
    {Z : Scheme.{u}} (i : Z ⟶ X) [IsClosedImmersion i] : Cycle X δ d := by sorry

/-- The coefficient at a top-dimensional generic point is its generic Artinian local length. -/
lemma fundamental_coefficient {X : Scheme.{u}} (δ : DimensionFunction X) (d : ℤ) {Z : Scheme.{u}} (i : Z ⟶ X) [IsClosedImmersion i] (η : X) : (fundamental δ d i).val η = genericLength i δ d η := by sorry
/-- An integral closed subscheme of δ-dimension d has fundamental cycle equal to its unit generic-point generator. -/
lemma fundamental_reduced_integral {X : Scheme.{u}} (δ : DimensionFunction X) (d : ℤ) {Z : Scheme.{u}} (i : Z ⟶ X) [IsClosedImmersion i] [IsIntegral Z] (η : Z) (hη : IsGenericPoint η (Set.univ : Set Z)) (hd : δ.value (i η) = d) : fundamental δ d i = Cycle.single δ d (i η) hd 1 := by sorry
/-- Restriction to an open subscheme preserves all coefficients at points of that open. -/
lemma fundamental_open_restrict {X U : Scheme.{u}} (j : U ⟶ X) [IsOpenImmersion j] (δ : DimensionFunction X) (d : ℤ) {Z : Scheme.{u}} (i : Z ⟶ X) [IsClosedImmersion i] (x : U) : (fundamental (restrictDimension j δ) d (closedBaseChange i j)).val x = (fundamental δ d i).val (j x) := by sorry
-- Unit test TauCeti.AlgebraicGeometry.Intersection.fundamental_test_dual_point: Spec(ℚ[ε]/ε²) has zero-dimensional fundamental coefficient 2.
example (δ : DimensionFunction (Spec (.of (DualNumber ℚ)))) (hδ : ∀ x, δ.value x = 0) (x : Spec (.of (DualNumber ℚ))) : (fundamental δ 0 (𝟙 _)).val x = 2 := by sorry
-- Unit test TauCeti.AlgebraicGeometry.Intersection.fundamental_test_reduced_point: Spec ℚ has zero-dimensional fundamental coefficient 1.
example (δ : DimensionFunction (Spec (.of ℚ))) (hδ : ∀ x, δ.value x = 0) (x : Spec (.of ℚ)) : (fundamental δ 0 (𝟙 _)).val x = 1 := by sorry
-- Unit test TauCeti.AlgebraicGeometry.Intersection.fundamental_test_empty: The fundamental cycle of the empty scheme is zero in every grade.
example (δ : DimensionFunction (∅ : Scheme.{u})) (d : ℤ) : fundamental δ d (𝟙 _) = 0 := by sorry


/- SchemeAndStackFoundations:SF.5/coherent-cycle
For a coherent O_X-module M with δ-dimension of its support at most d, form [M]_d by length(M_η) at the d-dimensional generic support points. On short exact sequences with this common support bound the resulting cycle is additive, and [O_Z]_d equals the fundamental cycle of Z.
Omitted hypotheses: Coherence and the common support dimension bounds are omitted only from the Lean signatures, because the pinned sheaf predicates are incomplete; the packet gives the exact domain. -/

def coherentCycle {X : Scheme.{u}} (δ : DimensionFunction X) (d : ℤ)
    (M : X.Modules) : Cycle X δ d := by sorry

/-- A short exact sequence with common support bound yields [M₂]_d=[M₁]_d+[M₃]_d. -/
lemma coherentCycle_exact {X : Scheme.{u}} (δ : DimensionFunction X) (d : ℤ) (S : ShortComplex X.Modules) (h : S.ShortExact) : coherentCycle δ d S.X₂ = coherentCycle δ d S.X₁ + coherentCycle δ d S.X₃ := by sorry
/-- The pushforward structure module of a closed subscheme gives its fundamental cycle. -/
lemma coherentCycle_structure {X : Scheme.{u}} (δ : DimensionFunction X) (d : ℤ) {Z : Scheme.{u}} (i : Z ⟶ X) [IsClosedImmersion i] : coherentCycle δ d ((Scheme.Modules.pushforward i).obj (unitModule Z)) = fundamental δ d i := by sorry
/-- An isomorphism of coherent modules preserves its cycle. -/
lemma coherentCycle_iso {X : Scheme.{u}} (δ : DimensionFunction X) (d : ℤ) {M N : X.Modules} (e : M ≅ N) : coherentCycle δ d M = coherentCycle δ d N := by sorry
-- Unit test TauCeti.AlgebraicGeometry.Intersection.coherentCycle_test_free_rank_two: A free rank-two module on a reduced point has coefficient 2.
example (δ : DimensionFunction (Spec (.of ℚ))) (hδ : ∀ x, δ.value x = 0) (x : Spec (.of ℚ)) : (coherentCycle δ 0 (freeModule _ 2)).val x = 2 := by sorry
-- Unit test TauCeti.AlgebraicGeometry.Intersection.coherentCycle_test_zero: The zero module has zero cycle.
example {X : Scheme.{u}} (δ : DimensionFunction X) (d : ℤ) : coherentCycle δ d (0 : X.Modules) = 0 := by sorry
-- Unit test TauCeti.AlgebraicGeometry.Intersection.coherentCycle_test_dual_number_residue: The residue module on the doubled point has length 1, whereas the structure module has length 2.
example (δ : DimensionFunction (Spec (.of (DualNumber ℚ)))) (hδ : ∀ x, δ.value x = 0) (x : Spec (.of (DualNumber ℚ))) : (coherentCycle δ 0 (doublePointResidueModule)).val x = 1 ∧ (coherentCycle δ 0 (unitModule _)).val x = 2 := by sorry


/- SchemeAndStackFoundations:SF.5/locally-finite-principal-boundary
For an integral closed W⊂X of δ-dimension d+1 and u∈κ(W)×, extend the existing Noetherian principal-divisor construction across Noetherian opens of W. Its locally finite order cycle pushes along W→X to a d-cycle ∂_W(u). The local order is length(A/aA)−length(A/bA) for u=a/b in a one-dimensional local domain, so normality is not required.
Omitted hypotheses: The local Noetherian and δ-dimension hypotheses are absent only from the prototype. P¹, its coordinate and marked point cycles are exact upstream Jacobian Layer A fixtures. -/

def principalBoundary {X : Scheme.{u}} (δ : DimensionFunction X) (d : ℤ)
    {W : Scheme.{u}} (i : W ⟶ X) [IsClosedImmersion i] [IsIntegral W]
    (f : Additive W.functionFieldˣ) : Cycle X δ d := by sorry

/-- Multiplication of rational functions adds principal boundary cycles. -/
lemma principalBoundary_add {X : Scheme.{u}} (δ : DimensionFunction X) (d : ℤ) {W : Scheme.{u}} (i : W ⟶ X) [IsClosedImmersion i] [IsIntegral W] (f g : Additive W.functionFieldˣ) : principalBoundary δ d i (f + g) = principalBoundary δ d i f + principalBoundary δ d i g := by sorry
/-- On a Noetherian integral W the boundary is the native principal divisor, included in cycles and pushed to X with the induced dimensions. -/
lemma principalBoundary_native {X : Scheme.{u}} (δ : DimensionFunction X) (d : ℤ) {W : Scheme.{u}} (i : W ⟶ X) [IsClosedImmersion i] [IsIntegral W] [IsNoetherian W] (f : Additive W.functionFieldˣ) : (principalBoundary δ d i f).val = AlgebraicCycle.map i (fun x => δ.value (i x)) δ.value (SchemeWeilDivisor.toAlgebraicCycle ((WeilDivisor.OrderSystem.ofScheme W).principalDivisor f)) := by sorry
/-- The boundary of the inverse function is the negative boundary. -/
lemma principalBoundary_neg {X : Scheme.{u}} (δ : DimensionFunction X) (d : ℤ) {W : Scheme.{u}} (i : W ⟶ X) [IsClosedImmersion i] [IsIntegral W] (f : Additive W.functionFieldˣ) : principalBoundary δ d i (-f) = -principalBoundary δ d i f := by sorry
-- Unit test TauCeti.AlgebraicGeometry.Intersection.principalBoundary_test_unit: The unit rational function has zero boundary.
example {X : Scheme.{u}} (δ : DimensionFunction X) (d : ℤ) {W : Scheme.{u}} (i : W ⟶ X) [IsClosedImmersion i] [IsIntegral W] : principalBoundary δ d i 0 = 0 := by sorry
-- Unit test TauCeti.AlgebraicGeometry.Intersection.principalBoundary_test_inverse_cancel: A function and its inverse cancel before quotienting by rational equivalence.
example {X : Scheme.{u}} (δ : DimensionFunction X) (d : ℤ) {W : Scheme.{u}} (i : W ⟶ X) [IsClosedImmersion i] [IsIntegral W] (f : Additive W.functionFieldˣ) : principalBoundary δ d i f + principalBoundary δ d i (-f) = 0 := by sorry
-- Unit test TauCeti.AlgebraicGeometry.Intersection.principalBoundary_test_p1_coordinate: The standard coordinate on P¹ has boundary [0]−[∞], with both coefficients 1.
example : (principalBoundary p1Dimension 0 (𝟙 p1) p1Coordinate).val = p1ZeroCycle - p1InfinityCycle := by sorry

-- An actual principal-boundary parameter, rather than an arbitrary index type.
structure PrincipalBoundaryData (X : Scheme.{u}) (δ : DimensionFunction X) (d : ℤ) where
  support : Scheme.{u}
  inclusion : support ⟶ X
  closed : IsClosedImmersion inclusion
  integral : IsIntegral support
  unit : support.functionFieldˣ
-- The δ-dimension condition on the integral support is omitted, as in principalBoundary.
def principalBoundaryGenerator (X : Scheme.{u}) (δ : DimensionFunction X) (d : ℤ) (a : PrincipalBoundaryData X δ d) : Cycle X δ d := by
  letI := a.closed
  letI := a.integral
  exact principalBoundary δ d a.inclusion (Additive.ofMul a.unit)


/- SchemeAndStackFoundations:SF.5/rational-equivalence
Rat_d(X)⊂Z_d(X) consists of sums of principal boundary cycles from a locally finite family of integral closed (d+1)-dimensional W⊂X with a rational unit on each W. Local finiteness refers to the family of closed supports. In the Noetherian quasi-compact case this is the subgroup generated by finite principal sums; for a non-quasi-compact scheme finite generation alone is too small.
Omitted hypotheses: The precise source hypotheses are in the packet and reader. -/

def rationalRelations (X : Scheme.{u}) (δ : DimensionFunction X) (d : ℤ) :
    AddSubgroup (Cycle X δ d) := by sorry

/-- Every individual principal boundary lies in Rat_d(X). -/
lemma rationalRelations_principal {X : Scheme.{u}} (δ : DimensionFunction X) (d : ℤ) {W : Scheme.{u}} (i : W ⟶ X) [IsClosedImmersion i] [IsIntegral W] (f : Additive W.functionFieldˣ) : principalBoundary δ d i f ∈ rationalRelations X δ d := by sorry
/-- A finite sum of principal boundary relations is again a relation. -/
lemma rationalRelations_finite_sum {X : Scheme.{u}} (δ : DimensionFunction X) (d : ℤ) (I : Type v) [Fintype I] (c : I → Cycle X δ d) (h : ∀ i, c i ∈ rationalRelations X δ d) : (∑ i, c i) ∈ rationalRelations X δ d := by sorry
/-- For Noetherian X the relation subgroup is the additive closure of the set of individual principal boundaries. -/
lemma rationalRelations_noetherian_generators {X : Scheme.{u}} [IsNoetherian X] (δ : DimensionFunction X) (d : ℤ) : rationalRelations X δ d = AddSubgroup.closure (Set.range (principalBoundaryGenerator X δ d)) := by sorry
-- Unit test TauCeti.AlgebraicGeometry.Intersection.rationalRelations_test_p1: On P¹, [0]−[∞] is a rational relation.
example : (p1ZeroHomogeneous - p1InfinityHomogeneous) ∈ rationalRelations p1 p1Dimension 0 := by sorry
-- Unit test TauCeti.AlgebraicGeometry.Intersection.rationalRelations_test_zero: The zero cycle is a relation, with the empty family.
example {X : Scheme.{u}} (δ : DimensionFunction X) (d : ℤ) : (0 : Cycle X δ d) ∈ rationalRelations X δ d := by sorry
-- Unit test TauCeti.AlgebraicGeometry.Intersection.rationalRelations_test_point_nonzero: A unit point on Spec ℚ is not a relation: there are no one-dimensional closed supports.
example (δ : DimensionFunction (Spec (.of ℚ))) (hδ : ∀ x, δ.value x = 0) (x : Spec (.of ℚ)) : Cycle.single δ 0 x (hδ x) 1 ∉ rationalRelations _ δ 0 := by sorry


/- SchemeAndStackFoundations:SF.5/chow-group
CH_d(X;ℤ)=Z_d(X)/Rat_d(X) as the native additive quotient. Rational coefficients mean ℚ⊗_ℤ CH_d(X;ℤ), not a change to the underlying integer relation. The class map is additive and universal for additive maps killing locally finite principal relations.
Omitted hypotheses: The precise source hypotheses are in the packet and reader. -/

abbrev Chow (X : Scheme.{u}) (δ : DimensionFunction X) (d : ℤ) :=
  Cycle X δ d ⧸ rationalRelations X δ d

def cycleClass {X : Scheme.{u}} (δ : DimensionFunction X) (d : ℤ) :
    Cycle X δ d →+ Chow X δ d := QuotientAddGroup.mk' _

abbrev ChowQ (X : Scheme.{u}) (δ : DimensionFunction X) (d : ℤ) := ℚ ⊗[ℤ] Chow X δ d

/-- Every Chow class is represented by a homogeneous cycle. -/
lemma cycleClass_surjective {X : Scheme.{u}} (δ : DimensionFunction X) (d : ℤ) : Function.Surjective (cycleClass δ d) := by sorry
/-- Two cycles have equal classes exactly when their difference is a rational relation. -/
lemma cycleClass_eq_iff {X : Scheme.{u}} (δ : DimensionFunction X) (d : ℤ) (a b : Cycle X δ d) : cycleClass δ d a = cycleClass δ d b ↔ a - b ∈ rationalRelations X δ d := by sorry
/-- The descended map of an additive cycle map φ killing Rat evaluates on [a] as φ(a). -/
lemma Chow.lift_class {X : Scheme.{u}} (δ : DimensionFunction X) (d : ℤ) {A : Type v} [AddCommGroup A] (φ : Cycle X δ d →+ A) (h : rationalRelations X δ d ≤ φ.ker) (a : Cycle X δ d) : QuotientAddGroup.lift _ φ h (cycleClass δ d a) = φ a := by sorry
-- Unit test TauCeti.AlgebraicGeometry.Intersection.Chow.test_p1_points: The zero and infinity points of P¹ have the same Chow class.
example : cycleClass p1Dimension 0 p1ZeroHomogeneous = cycleClass p1Dimension 0 p1InfinityHomogeneous := by sorry
-- Unit test TauCeti.AlgebraicGeometry.Intersection.Chow.test_principal_zero: Every principal boundary becomes zero.
example {X : Scheme.{u}} (δ : DimensionFunction X) (d : ℤ) {W : Scheme.{u}} (i : W ⟶ X) [IsClosedImmersion i] [IsIntegral W] (f : Additive W.functionFieldˣ) : cycleClass δ d (principalBoundary δ d i f) = 0 := by sorry
-- Unit test TauCeti.AlgebraicGeometry.Intersection.Chow.test_point_integer: CH₀(Spec ℚ;ℤ) is additively isomorphic to ℤ, with the unit point mapping to 1.
example (δ : DimensionFunction (Spec (.of ℚ))) (hδ : ∀ x, δ.value x = 0) : Nonempty (Chow (Spec (.of ℚ)) δ 0 ≃+ ℤ) := by sorry

-- Explicit restriction of the native weighted map: homogeneity uses its weight cutoff.
def gradedPush {X Y : Scheme.{u}} (f : X ⟶ Y) [IsProper f] (δ : DimensionFunction X) (ε : DimensionFunction Y) (d : ℤ) : Cycle X δ d →+ Cycle Y ε d := by sorry
def chowRegrade {X : Scheme.{u}} {δ : DimensionFunction X} {a b : ℤ} (h : a = b) (z : Chow X δ a) : Chow X δ b := h ▸ z
lemma restrictDimension_id (X : Scheme.{u}) (δ : DimensionFunction X) : restrictDimension (𝟙 X) δ = δ := by sorry
def chowDimensionCast {X : Scheme.{u}} {δ ε : DimensionFunction X} {d : ℤ} (h : δ = ε) (a : Chow X δ d) : Chow X ε d := h ▸ a
-- Chow test fixtures; [P¹], [P²], lines and points have their stated geometric meanings.
def wholeClass (X : Scheme.{u}) (δ : DimensionFunction X) (d : ℤ) : Chow X δ d := cycleClass δ d (fundamental δ d (𝟙 X))
def p1FundamentalClass : Chow p1 p1Dimension 1 := wholeClass _ _ _
def p2FundamentalClass : Chow p2 p2Dimension 2 := wholeClass _ _ _
def p1MarkedPointClass {δ : DimensionFunction p1} : Chow p1 δ 0 := by sorry
def p2HyperplaneClass : Chow p2 p2Dimension 1 := by sorry
def p2TransverseLineClass : Chow p2 p2Dimension 1 := by sorry
def p2PointClass : Chow p2 p2Dimension 0 := by sorry
def pointClass : Chow (Spec (.of ℚ)) pointDimension 0 := by sorry
def doublePointFundamentalClass : Chow (Spec (.of (DualNumber ℚ))) doublePointDimension 0 := by sorry
def affineLineFundamentalClass : Chow affineLine affineLineDimension 1 := by sorry


/- SchemeAndStackFoundations:SF.5/proper-relations
For a proper S-morphism f:X→Y, the existing dimension-weighted native cycle map carries Rat_d(X) into Rat_d(Y). For W generically finite over its image use the norm of a rational unit; if its image loses one dimension use degree zero of a principal divisor on the proper generic curve; greater dimension loss gives zero.
Omitted hypotheses: Compatibility of the two induced dimension functions is omitted from the prototype; arbitrary unrelated weight functions do not satisfy the theorem. -/

theorem proper_relations {X Y : Scheme.{u}} (f : X ⟶ Y) [IsProper f]
    (δ : DimensionFunction X) (ε : DimensionFunction Y) (d : ℤ)
    (c : Cycle X δ d) (hc : c ∈ rationalRelations X δ d) :
    gradedPush f δ ε d c ∈ rationalRelations Y ε d := by sorry



/- SchemeAndStackFoundations:SF.5/chow-proper-push
Restrict the native weighted AlgebraicCycle.map for a proper S-map f to Z_d, then descend to f_*:CH_d(X;ℤ)→CH_d(Y;ℤ). On [W] the coefficient is [κ(W):κ(f(W))] when image dimension is d, and zero when dimension drops. No new raw cycle map is constructed.
Omitted hypotheses: The compatibility of induced dimensions and S-linearity is omitted only in the Lean forms. -/

def properPush {X Y : Scheme.{u}} (f : X ⟶ Y) [IsProper f]
    (δ : DimensionFunction X) (ε : DimensionFunction Y) (d : ℤ) :
    Chow X δ d →+ Chow Y ε d := by sorry

/-- Pushforward of a cycle class is the class of its existing native weighted cycle map. -/
lemma properPush_class {X Y : Scheme.{u}} (f : X ⟶ Y) [IsProper f] (δ : DimensionFunction X) (ε : DimensionFunction Y) (d : ℤ) (c : Cycle X δ d) : properPush f δ ε d (cycleClass δ d c) = cycleClass ε d (gradedPush f δ ε d c) := by sorry
/-- The identity proper pushforward is the identity homomorphism. -/
lemma properPush_id {X : Scheme.{u}} (δ : DimensionFunction X) (d : ℤ) : properPush (𝟙 X) δ δ d = AddMonoidHom.id _ := by sorry
/-- For proper f and g, (g∘f)_*=g_*∘f_* with common induced dimensions. -/
lemma properPush_comp {X Y Z : Scheme.{u}} (f : X ⟶ Y) (g : Y ⟶ Z) [IsProper f] [IsProper g] (δ : DimensionFunction X) (ε : DimensionFunction Y) (ζ : DimensionFunction Z) (d : ℤ) : properPush (f ≫ g) δ ζ d = (properPush g ε ζ d).comp (properPush f δ ε d) := by sorry
-- Unit test TauCeti.AlgebraicGeometry.Intersection.properPush_test_degree_two: A finite map with residue extension degree 2 sends a unit point to twice the image point.
example {X Y : Scheme.{u}} (f : X ⟶ Y) [IsProper f] (δ : DimensionFunction X) (ε : DimensionFunction Y) (x : X) (hx : δ.value x = 0) (hy : ε.value (f x) = 0) (hdeg : f.residueDegree x = 2) : properPush f δ ε 0 (cycleClass δ 0 (Cycle.single δ 0 x hx 1)) = 2 • cycleClass ε 0 (Cycle.single ε 0 (f x) hy 1) := by sorry
-- Unit test TauCeti.AlgebraicGeometry.Intersection.properPush_test_dimension_drop: A positive-dimensional integral support contracted to a lower-dimensional image pushes to zero.
example {X Y : Scheme.{u}} (f : X ⟶ Y) [IsProper f] (δ : DimensionFunction X) (ε : DimensionFunction Y) (d : ℤ) (x : X) (hx : δ.value x = d) (hy : ε.value (f x) ≠ d) : properPush f δ ε d (cycleClass δ d (Cycle.single δ d x hx 1)) = 0 := by sorry
-- Unit test TauCeti.AlgebraicGeometry.Intersection.properPush_test_native_identity: Identity descent preserves any cycle class, in agreement with native map_id.
example {X : Scheme.{u}} (δ : DimensionFunction X) (d : ℤ) (c : Cycle X δ d) : properPush (𝟙 X) δ δ d (cycleClass δ d c) = cycleClass δ d c := by sorry


/- SchemeAndStackFoundations:SF.5/flat-pullback
For a flat S-map f:X→Y locally of finite type of constant relative dimension r, pull back a generator [W] to the (d+r)-dimensional fundamental cycle of X×Y W, with its generic lengths. This extends to locally finite cycles and descends to f*:CH_d(Y)→CH_(d+r)(X). A flat map with fibres of mixed dimension does not have this single graded pullback.
Omitted hypotheses: Locally finite type, constant relative pure dimension and compatibility of induced dimensions are omitted from the prototype; Flat alone is insufficient. -/

def flatPull {X Y : Scheme.{u}} (f : X ⟶ Y) [Flat f]
    (δ : DimensionFunction X) (ε : DimensionFunction Y) (r : ℕ) (d : ℤ) :
    Chow Y ε d →+ Chow X δ (d + r) := by sorry

/-- Pullback of an integral support class is the fundamental class of its scheme-theoretic inverse image, including nonreduced multiplicity. -/
lemma flatPull_fundamental {X Y : Scheme.{u}} (f : X ⟶ Y) [Flat f] (δ : DimensionFunction X) (ε : DimensionFunction Y) (r : ℕ) (d : ℤ) {W : Scheme.{u}} (i : W ⟶ Y) [IsClosedImmersion i] : flatPull f δ ε r d (cycleClass ε d (fundamental ε d i)) = cycleClass δ (d+r) (fundamental δ (d+r) (closedBaseChange i f)) := by sorry
/-- Flat pullback for the identity has relative dimension 0 and is the identity. -/
lemma flatPull_id {X : Scheme.{u}} (δ : DimensionFunction X) (d : ℤ) (a : Chow X δ d) : flatPull (𝟙 X) δ δ 0 d a = chowRegrade (by omega) a := by sorry
/-- Relative dimensions add in the composition law for flat pullback. -/
lemma flatPull_comp {X Y Z : Scheme.{u}} (f : X ⟶ Y) (g : Y ⟶ Z) [Flat f] [Flat g] (δ : DimensionFunction X) (ε : DimensionFunction Y) (ζ : DimensionFunction Z) (r s : ℕ) (d : ℤ) (a : Chow Z ζ d) : flatPull (f ≫ g) δ ζ (r+s) d a = chowRegrade (by omega) (flatPull f δ ε r (d+s) (flatPull g ε ζ s d a)) := by sorry
-- Unit test TauCeti.AlgebraicGeometry.Intersection.flatPull_test_identity: Relative dimension zero for the identity does not shift the grade.
example {X : Scheme.{u}} (δ : DimensionFunction X) (d : ℤ) (a : Chow X δ d) : flatPull (𝟙 X) δ δ 0 d a = chowRegrade (by omega) a := by sorry
-- Unit test TauCeti.AlgebraicGeometry.Intersection.flatPull_test_double_point: Pulling back the unit point along Spec ℚ[ε]/ε²→Spec ℚ gives the doubled fundamental point, rather than its reduction.
example : flatPull doublePointToPoint doublePointDimension pointDimension 0 0 pointClass = doublePointFundamentalClass := by sorry
-- Unit test TauCeti.AlgebraicGeometry.Intersection.flatPull_test_affine_line_shift: The pullback of the unit point to A¹ is its one-dimensional fundamental class.
example : flatPull affineLineToPoint affineLineDimension pointDimension 1 0 pointClass = affineLineFundamentalClass := by sorry


/- SchemeAndStackFoundations:SF.5/proper-flat-basechange
In a Cartesian square X′→X over Y′→Y with f:X→Y proper and g:Y′→Y flat of pure relative dimension r, g*f_*=f′_*g′* on CH_d(X), with common target CH_(d+r)(Y′).
Omitted hypotheses: S-linearity, induced-dimension compatibility and pure relative dimension r are omitted. -/

theorem proper_flat_basechange {X Y X' Y' : Scheme.{u}}
    (f : X ⟶ Y) (g : Y' ⟶ Y) (f' : X' ⟶ Y') (g' : X' ⟶ X)
    [IsProper f] [IsProper f'] [Flat g] [Flat g'] (h : IsPullback g' f' f g)
    (δ : DimensionFunction X) (ε : DimensionFunction Y)
    (δ' : DimensionFunction X') (ε' : DimensionFunction Y') (r : ℕ) (d : ℤ)
    (a : Chow X δ d) : flatPull g ε' ε r d (properPush f δ ε d a) =
      properPush f' δ' ε' (d+r) (flatPull g' δ' δ r d a) := by sorry




/- SchemeAndStackFoundations:SF.5/finite-flat-degree
For a finite locally free S-morphism f:X→Y of constant rank n, f_*f*=n on CH_d(Y) in every grade, with the pure relative dimension zero pullback. Generic nonreduced lengths are part of n.
Omitted hypotheses: Finite locally free constant rank n, S-linearity and compatible induced dimensions are omitted. Proper and flat alone do not give this rank-n formula. -/

theorem finite_flat_push_pull {X Y : Scheme.{u}} (f : X ⟶ Y)
    [IsProper f] [Flat f] (δ : DimensionFunction X) (ε : DimensionFunction Y)
    (n : ℕ) (d : ℤ) (a : Chow Y ε d) :
    properPush f δ ε d (chowRegrade (by omega) (flatPull f δ ε 0 d a)) = n • a := by sorry



/- SchemeAndStackFoundations:SF.5/chow-localization
For a closed immersion i:Z→X with complementary open j:U→X, CH_d(Z)→CH_d(X)→CH_d(U)→0 is exact, using restricted ambient dimensions. The closed pushforward need not be injective.
Omitted hypotheses: The complementary-image condition is omitted from the Lean signature; it is not implied by the two immersion classes. -/

theorem chow_localization {Z X U : Scheme.{u}} (i : Z ⟶ X) (j : U ⟶ X)
    [IsClosedImmersion i] [IsOpenImmersion j] (δ : DimensionFunction X) (d : ℤ) :
    Function.Exact (properPush i (restrictDimension i δ) δ d)
      (flatPull j (restrictDimension j δ) δ 0 d) ∧
      Function.Surjective (flatPull j (restrictDimension j δ) δ 0 d) := by sorry



/- SchemeAndStackFoundations:SF.5/affine-bundle-homotopy
For a vector bundle, or a Zariski locally trivial affine-space bundle, p:E→X of constant relative rank r, flat pullback p*:CH_d(X)→CH_(d+r)(E) is an additive isomorphism. This is not asserted for every flat morphism.
Omitted hypotheses: The affine-space bundle condition, its constant rank and induced dimensions are omitted from the prototype; arbitrary Flat p does not suffice. -/

theorem affine_bundle_homotopy {E X : Scheme.{u}} (p : E ⟶ X) [Flat p]
    (δ : DimensionFunction E) (ε : DimensionFunction X) (r : ℕ) (d : ℤ) :
    Function.Bijective (flatPull p δ ε r d) := by sorry



/- SchemeAndStackFoundations:SF.5/first-chern
For an invertible sheaf L on X, c₁(L)∩−:CH_d(X;ℤ)→CH_(d−1)(X;ℤ) sends an integral support W to the divisor of a nonzero rational section of L|W, pushed to X. Different rational sections differ by a principal divisor. The operator, unlike intersection of arbitrary Weil divisors on a singular scheme, is defined on every X in Situation 42.7.1.
Omitted hypotheses: The precise source hypotheses are in the packet and reader. -/

def firstChern {X : Scheme.{u}} (δ : DimensionFunction X) (L : Line X)
    (d : ℤ) : Chow X δ d →+ Chow X δ (d-1) := by sorry

/-- c₁(L⊗M)∩a=c₁(L)∩a+c₁(M)∩a. -/
lemma firstChern_tensor {X : Scheme.{u}} (δ : DimensionFunction X) (L M : Line X) (d : ℤ) (a : Chow X δ d) : firstChern δ (lineTensor L M) d a = firstChern δ L d a + firstChern δ M d a := by sorry
/-- The trivial invertible sheaf has zero first Chern operator. -/
lemma firstChern_trivial {X : Scheme.{u}} (δ : DimensionFunction X) (d : ℤ) : firstChern δ (InvertibleSheaf.trivial X) d = 0 := by sorry
/-- Dualizing a line bundle negates its first Chern operator. -/
lemma firstChern_dual {X : Scheme.{u}} (δ : DimensionFunction X) (L : Line X) (d : ℤ) : firstChern δ (lineDual L) d = -firstChern δ L d := by sorry
-- Unit test TauCeti.AlgebraicGeometry.Intersection.firstChern_test_p1_o1: c₁(O(1))∩[P¹] is the class of a single point.
example : firstChern p1Dimension p1O1 1 p1FundamentalClass = cycleClass p1Dimension 0 p1ZeroHomogeneous := by sorry
-- Unit test TauCeti.AlgebraicGeometry.Intersection.firstChern_test_p1_o2: c₁(O(2))∩[P¹] is twice a point, detecting the tensor convention.
example : firstChern p1Dimension (linePower p1O1 2) 1 p1FundamentalClass = 2 • cycleClass p1Dimension 0 p1ZeroHomogeneous := by sorry
-- Unit test TauCeti.AlgebraicGeometry.Intersection.firstChern_test_trivial: The trivial bundle kills every Chow class in every grade.
example {X : Scheme.{u}} (δ : DimensionFunction X) (d : ℤ) (a : Chow X δ d) : firstChern δ (InvertibleSheaf.trivial X) d a = 0 := by sorry


/- SchemeAndStackFoundations:SF.5/chern-projection
For a proper S-map f:X→Y and an invertible L on Y, f_*(c₁(f*L)∩a)=c₁(L)∩f_*a in CH_(d−1)(Y).
Omitted hypotheses: S-linearity and induced-dimension compatibility are omitted. -/

theorem firstChern_projection {X Y : Scheme.{u}} (f : X ⟶ Y) [IsProper f]
    (δ : DimensionFunction X) (ε : DimensionFunction Y) (L : Line Y) (d : ℤ)
    (a : Chow X δ d) : properPush f δ ε (d-1) (firstChern δ (linePullback f L) d a) =
      firstChern ε L d (properPush f δ ε d a) := by sorry




/- SchemeAndStackFoundations:SF.5/chern-commutation
For two invertible sheaves L,M in Situation 42.7.1, c₁(L)c₁(M)∩a=c₁(M)c₁(L)∩a in CH_(d−2)(X).
Omitted hypotheses: The ambient dimension base is omitted. The two line objects are native invertible sheaves. -/

theorem firstChern_commute {X : Scheme.{u}} (δ : DimensionFunction X) (L M : Line X)
    (d : ℤ) (a : Chow X δ d) :
    firstChern δ L (d-1) (firstChern δ M d a) =
      firstChern δ M (d-1) (firstChern δ L d a) := by sorry



/- SchemeAndStackFoundations:SF.5/chern-flat
For a flat S-map f:X→Y of constant pure relative dimension r and a line L on Y, c₁(f*L)∩f*a=f*(c₁(L)∩a) in CH_(d+r−1)(X).
Omitted hypotheses: S-linearity, dimension compatibility and relative pure dimension r are omitted. -/

theorem firstChern_flat {X Y : Scheme.{u}} (f : X ⟶ Y) [Flat f] (δ : DimensionFunction X) (ε : DimensionFunction Y) (L : Line Y) (r : ℕ) (d : ℤ) (a : Chow Y ε d) : firstChern δ (linePullback f L) (d+r) (flatPull f δ ε r d a) = chowRegrade (by omega) (flatPull f δ ε r (d-1) (firstChern ε L d a)) := by sorry



/- SchemeAndStackFoundations:SF.5/cartier-gysin
For an effective Cartier divisor i:D→X with associated invertible sheaf O_X(D), define i!:CH_d(X)→CH_(d−1)(D). If an integral support W is not contained in D, use the Cartier intersection cycle on D∩W; if W is contained in D, use c₁(O_X(D)|W)∩[W]. The contained case is essential for self-intersection.
Omitted hypotheses: The effective Cartier condition is omitted from the Lean signatures; an arbitrary closed immersion does not define this map. The flat signature also omits the induced-dimension and relative-pure-dimension data. -/

def cartierGysin {D X : Scheme.{u}} (i : D ⟶ X) [IsClosedImmersion i]
    (δ : DimensionFunction X) (d : ℤ) : Chow X δ d →+ Chow D (restrictDimension i δ) (d-1) := by sorry

/-- Pushing the Cartier Gysin image back to X gives the first Chern cap operator of O_X(D). -/
lemma cartierGysin_push {D X : Scheme.{u}} (i : D ⟶ X) [IsClosedImmersion i] (δ : DimensionFunction X) (d : ℤ) (a : Chow X δ d) : properPush i (restrictDimension i δ) δ (d-1) (cartierGysin i δ d a) = firstChern δ (divisorLine i) d a := by sorry
/-- i! i_*a equals c₁(O_X(D)|D)∩a. -/
lemma cartierGysin_self {D X : Scheme.{u}} (i : D ⟶ X) [IsClosedImmersion i] (δ : DimensionFunction X) (d : ℤ) (a : Chow D (restrictDimension i δ) d) : cartierGysin i δ d (properPush i (restrictDimension i δ) δ d a) = firstChern (restrictDimension i δ) (linePullback i (divisorLine i)) d a := by sorry
/-- In a flat Cartesian base change, shifted flat pullback commutes with Cartier Gysin. -/
lemma cartierGysin_flat {D X X' : Scheme.{u}} (i : D ⟶ X) [IsClosedImmersion i] (f : X' ⟶ X) [Flat f] (δ : DimensionFunction X) (δ' : DimensionFunction X') (r : ℕ) (d : ℤ) (a : Chow X δ d) : cartierGysin (closedBaseChange i f) δ' (d+r) (flatPull f δ' δ r d a) = chowRegrade (by omega) (flatPull (closedBaseChangeProjection i f) (restrictDimension (closedBaseChange i f) δ') (restrictDimension i δ) r (d-1) (cartierGysin i δ d a)) := by sorry
-- Unit test TauCeti.AlgebraicGeometry.Intersection.cartierGysin_test_hyperplane: A hyperplane in P² meets a line not contained in it in one point.
example : cartierGysin p2Hyperplane p2Dimension 1 p2TransverseLineClass = p1MarkedPointClass := by sorry
-- Unit test TauCeti.AlgebraicGeometry.Intersection.cartierGysin_test_self_line: The same line in P² has self-intersection of degree 1, not zero merely because it is contained.
example : cartierGysin p2Hyperplane p2Dimension 1 p2HyperplaneClass = p1MarkedPointClass := by sorry
-- Unit test TauCeti.AlgebraicGeometry.Intersection.cartierGysin_test_empty_divisor: The empty effective Cartier divisor has zero Gysin map.
example {X : Scheme.{u}} (δ : DimensionFunction X) (d : ℤ) (a : Chow X δ d) : cartierGysin (emptyTo X) δ d a = 0 := by sorry


/- SchemeAndStackFoundations:SF.5/projective-bundle
For a finite locally free O_X-module E of rank r, construct P_X(E)=Proj_X(Sym E) with the quotient convention, π:P(E)→X and the universal rank-one quotient π*E→O(1). It represents invertible quotients up to isomorphism and commutes with arbitrary base change. For r=0 it is empty; for r=1 it is X with O(1)=E.
Omitted hypotheses: Finite local freeness and rank are omitted from the prototype. Relative Proj itself remains an SF.0 supplier rather than a second construction here. -/

def projectiveBundle (X : Scheme.{u}) (E : X.Modules) : Scheme.{u} := by sorry
def projectiveProjection {X : Scheme.{u}} (E : X.Modules) : projectiveBundle X E ⟶ X := by sorry
def tautologicalLine {X : Scheme.{u}} (E : X.Modules) : Line (projectiveBundle X E) := by sorry
def tautologicalQuotient {X : Scheme.{u}} (E : X.Modules) : ((Scheme.Modules.pullback (projectiveProjection E)).obj E) ⟶ (tautologicalLine E).obj := by sorry
/-- Base-changing P_X(E) to Y is canonically P_Y(f*E), with the same O(1). -/
def projectiveBundle_basechange {X Y : Scheme.{u}} (f : Y ⟶ X) (E : X.Modules) : pullback (projectiveProjection E) f ≅ projectiveBundle Y ((Scheme.Modules.pullback f).obj E) := by sorry
/-- For an invertible E, P(E) is X and its tautological quotient identifies O(1) with E. -/
def projectiveBundle_rank_one {X : Scheme.{u}} (L : Line X) : projectiveBundle X L.obj ≅ X := by sorry
/-- The canonical map π*E→O(1) is an epimorphism of native module sheaves. -/
lemma projectiveBundle_quotient_epi {X : Scheme.{u}} (E : X.Modules) : Epi (tautologicalQuotient E) := by sorry
-- Unit test TauCeti.AlgebraicGeometry.Intersection.projectiveBundle_test_rank_zero: The projectivization of the zero module is the empty scheme.
example {X : Scheme.{u}} : Nonempty (projectiveBundle X (0 : X.Modules) ≅ (∅ : Scheme.{u})) := by sorry
-- Unit test TauCeti.AlgebraicGeometry.Intersection.projectiveBundle_test_rank_two: The trivial rank-two bundle over Spec ℚ gives P¹.
example : Nonempty (projectiveBundle (Spec (.of ℚ)) (freeModule _ 2) ≅ p1) := by sorry
-- Unit test TauCeti.AlgebraicGeometry.Intersection.projectiveBundle_test_quotient_sign: For rank one, pulling E back along the projection is isomorphic to O(1), not its dual.
example {X : Scheme.{u}} (L : Line X) : Nonempty (((Scheme.Modules.pullback (projectiveProjection L.obj)).obj L.obj) ≅ (tautologicalLine L.obj).obj) := by sorry

-- Expansion index j records the correct homological shift d-r+1+j.
def projectiveDimension {X : Scheme.{u}} (δ : DimensionFunction X) (E : X.Modules) (r : ℕ) : DimensionFunction (projectiveBundle X E) := by sorry
def projectiveExpansion {X : Scheme.{u}} (δ : DimensionFunction X) (E : X.Modules) (r : ℕ) (d : ℤ) : (∀ j : Fin r, Chow X δ (d-r+1+j.val)) → Chow (projectiveBundle X E) (projectiveDimension δ E r) d := by sorry


/- SchemeAndStackFoundations:SF.5/projective-bundle-formula
For E of constant positive rank r, with ξ=c₁(O(1)), the map ⊕_(j=0)^(r−1) CH_(d−r+1+j)(X)→CH_d(P(E)), (a_j)↦Σ ξ^j∩π*a_j, is an isomorphism. Moreover π_*(ξ^s∩π*a)=0 for s<r−1 and equals a for s=r−1.
Omitted hypotheses: The constant rank r and finite locally free hypotheses are omitted from the Lean form; the integer grading of the expansion is retained. -/

theorem projective_bundle_formula {X : Scheme.{u}} (δ : DimensionFunction X)
    (E : X.Modules) (r : ℕ) (hr : 0 < r) (d : ℤ) :
    Function.Bijective (projectiveExpansion δ E r d) := by sorry



/- SchemeAndStackFoundations:SF.5/flag-bundle
Construct the complete quotient flag bundle q:F(E)→X by successive projectivizations of the kernels of the tautological quotient. Its pullback of E has a filtration with invertible quotients L₁,…,L_r. Pullback on every Chow group is injective, also after each base change; splitting means a filtration, not a claimed direct-sum isomorphism.
Omitted hypotheses: The finite locally free rank-r and flag-filtration hypotheses are stated in the packet but omitted from these suggested forms. -/

def flagBundle (X : Scheme.{u}) (E : X.Modules) (r : ℕ) : Scheme.{u} := by sorry
def flagProjection {X : Scheme.{u}} (E : X.Modules) (r : ℕ) : flagBundle X E r ⟶ X := by sorry
def flagDimension {X : Scheme.{u}} (δ : DimensionFunction X) (E : X.Modules) (r : ℕ) : DimensionFunction (flagBundle X E r) := by sorry
def flagPull {X : Scheme.{u}} (δ : DimensionFunction X) (E : X.Modules) (r : ℕ) (d : ℤ) : Chow X δ d →+ Chow (flagBundle X E r) (flagDimension δ E r) (d + r*(r-1)/2) := by sorry
/-- The flat flag pullback is injective in each grade. -/
lemma flagBundle_pull_injective {X : Scheme.{u}} (δ : DimensionFunction X) (E : X.Modules) (r : ℕ) (d : ℤ) : Function.Injective (flagPull δ E r d) := by sorry
/-- The complete flag bundle commutes with arbitrary base change. -/
def flagBundle_basechange {X Y : Scheme.{u}} (f : Y ⟶ X) (E : X.Modules) (r : ℕ) : pullback (flagProjection E r) f ≅ flagBundle Y ((Scheme.Modules.pullback f).obj E) r := by sorry
/-- The complete quotient flag has r invertible graded pieces. -/
def flagBundle_line_quotients {X : Scheme.{u}} (E : X.Modules) (r : ℕ) : Fin r → Line (flagBundle X E r) := by sorry
-- Unit test TauCeti.AlgebraicGeometry.Intersection.flagBundle_test_rank_one: For rank one the flag bundle is the base itself.
example {X : Scheme.{u}} (L : Line X) : Nonempty (flagBundle X L.obj 1 ≅ X) := by sorry
-- Unit test TauCeti.AlgebraicGeometry.Intersection.flagBundle_test_rank_two: For a trivial rank-two bundle over a point the complete flag scheme is P¹.
example : Nonempty (flagBundle (Spec (.of ℚ)) (freeModule _ 2) 2 ≅ p1) := by sorry
-- Unit test TauCeti.AlgebraicGeometry.Intersection.flagBundle_test_detect_zero: A Chow class whose flag pullback is zero was already zero.
example {X : Scheme.{u}} (δ : DimensionFunction X) (E : X.Modules) (r : ℕ) (d : ℤ) (a : Chow X δ d) (h : flagPull δ E r d a = 0) : a = 0 := by sorry


/- SchemeAndStackFoundations:SF.5/chern-operators
For a finite locally free E of constant rank r, define integral cap operators c_i(E):CH_d(X)→CH_(d−i)(X) by the unique projective relation ξ^r−π*c₁(E)ξ^(r−1)+…+(−1)^rπ*c_r(E)=0. Set c₀=id and c_i=0 for i>r. They are central natural operations for proper pushforward, flat pullback and Cartier Gysin; X need not be smooth.
Omitted hypotheses: Finite local freeness and constant rank are omitted only from the prototype. A varying-rank bundle is handled componentwise; no untruncated total class on a non-quasi-compact scheme is asserted. -/

def chern {X : Scheme.{u}} (δ : DimensionFunction X) (E : X.Modules)
    (i : ℕ) (d : ℤ) : Chow X δ d →+ Chow X δ (d-i) := by sorry

/-- c₀(E) is the identity after the zero grade shift. -/
lemma chern_zero {X : Scheme.{u}} (δ : DimensionFunction X) (E : X.Modules) (d : ℤ) (a : Chow X δ d) : chern δ E 0 d a = chowRegrade (by omega) a := by sorry
/-- For a line bundle, c₁ agrees with the existing first Chern cap construction. -/
lemma chern_rank_one {X : Scheme.{u}} (δ : DimensionFunction X) (L : Line X) (d : ℤ) : chern δ L.obj 1 d = firstChern δ L d := by sorry
/-- Chern operators commute with proper pushforward when the bundle is pulled back. -/
lemma chern_projection {X Y : Scheme.{u}} (f : X ⟶ Y) [IsProper f] (δ : DimensionFunction X) (ε : DimensionFunction Y) (E : Y.Modules) (i : ℕ) (d : ℤ) (a : Chow X δ d) : properPush f δ ε (d-i) (chern δ ((Scheme.Modules.pullback f).obj E) i d a) = chern ε E i d (properPush f δ ε d a) := by sorry
-- Unit test TauCeti.AlgebraicGeometry.Intersection.chern_test_trivial_rank_two: Every positive Chern operator of the trivial rank-two bundle is zero.
example {X : Scheme.{u}} (δ : DimensionFunction X) (d : ℤ) : chern δ (freeModule X 2) 1 d = 0 ∧ chern δ (freeModule X 2) 2 d = 0 := by sorry
-- Unit test TauCeti.AlgebraicGeometry.Intersection.chern_test_split_o1_o1: On P², c₂(O(1)⊕O(1))∩[P²] is one point.
example : chern p2Dimension (directSumModule p2O1.obj p2O1.obj) 2 2 p2FundamentalClass = p2PointClass := by sorry
-- Unit test TauCeti.AlgebraicGeometry.Intersection.chern_test_line_c2_zero: The second Chern operator of any line bundle is zero.
example {X : Scheme.{u}} (δ : DimensionFunction X) (L : Line X) (d : ℤ) : chern δ L.obj 2 d = 0 := by sorry
def whitneyExpansion {X : Scheme.{u}} (δ : DimensionFunction X) (E F : X.Modules) (n : ℕ) (d : ℤ) (a : Chow X δ d) : Chow X δ (d-n) := by sorry

/- SchemeAndStackFoundations:SF.5/whitney
For an exact sequence 0→E′→E→E″→0 of finite locally free modules, c_n(E)∩a=Σ_(i+j=n)c_i(E′)∩c_j(E″)∩a. The individual degree shifts are transported to d−n. The exact sequence need not split on X.
Omitted hypotheses: The three finite locally free conditions are omitted from the prototype. The expansion is an iterated cap sum with explicit grade transport, not an assumed Whitney identity. -/

theorem whitney {X : Scheme.{u}} (δ : DimensionFunction X) (S : ShortComplex X.Modules)
    (h : S.ShortExact) (n : ℕ) (d : ℤ) (a : Chow X δ d) :
    chern δ S.X₂ n d a = whitneyExpansion δ S.X₁ S.X₃ n d a := by sorry



/- SchemeAndStackFoundations:SF.5/chern-regular-section
If a section s of a rank-r finite locally free E is regular with zero scheme i:Z→X of codimension r, then c_r(E)∩[X]=i_*[Z] in CH_(dimδX−r)(X). At a regular embedding this gives the self-intersection factor c_r of its normal bundle.
Omitted hypotheses: Pure dimension, finite locally free rank r, the specified section and its regularity/zero-scheme identification are omitted from the prototype; they are not replaced by a hypothesis equal to this conclusion. -/

theorem top_chern_regular_section {X Z : Scheme.{u}} (δ : DimensionFunction X)
    (E : X.Modules) (r : ℕ) (d : ℤ) (i : Z ⟶ X) [IsClosedImmersion i] :
    chern δ E r d (cycleClass δ d (fundamental δ d (𝟙 X))) =
      properPush i (restrictDimension i δ) δ (d-r)
        (cycleClass (restrictDimension i δ) (d-r) (fundamental (restrictDimension i δ) (d-r) (𝟙 Z))) := by sorry



/- SchemeAndStackFoundations:SF.5/normal-cone
For a closed immersion i:Z→X with ideal I, the normal cone C_ZX is Spec_Z(⊕_(n≥0) I^n/I^(n+1)). Its zero section and projection are intrinsic. For a regular immersion of constant codimension c, I/I² is locally free of rank c and C_ZX is the normal vector bundle (I/I²)∨. Proj of this graded algebra is the projectivized cone, not the cone itself.
Omitted hypotheses: Regularity is omitted from normalCone_regular. vectorBundle is the SF.0 relative-Spec supplier. Affine schemes and the origin fixtures use native Scheme objects. -/

def normalCone {Z X : Scheme.{u}} (i : Z ⟶ X) [IsClosedImmersion i] : Scheme.{u} := by sorry
def normalProjection {Z X : Scheme.{u}} (i : Z ⟶ X) [IsClosedImmersion i] : normalCone i ⟶ Z := by sorry
def normalBundle {Z X : Scheme.{u}} (i : Z ⟶ X) [IsClosedImmersion i] : Z.Modules := by sorry

/-- Normal cones commute with flat base change; arbitrary nonflat base change need not preserve the normal algebra. -/
def normalCone_flat_basechange {Z X Y : Scheme.{u}} (i : Z ⟶ X) [IsClosedImmersion i] (f : Y ⟶ X) [Flat f] : normalCone (closedBaseChange i f) ≅ pullback (normalProjection i) (closedBaseChangeProjection i f) := by sorry
/-- For a regular immersion the cone is the total space of its normal vector bundle. -/
def normalCone_regular {Z X : Scheme.{u}} (i : Z ⟶ X) [IsClosedImmersion i] : normalCone i ≅ vectorBundle Z (normalBundle i) := by sorry
/-- The normal cone of the identity is the zero vector bundle, hence Z. -/
def normalCone_identity (Z : Scheme.{u}) : normalCone (𝟙 Z) ≅ Z := by sorry
-- Unit test TauCeti.AlgebraicGeometry.Intersection.normalCone_test_origin_line: The normal cone of the origin in A¹ over ℚ is A¹, not P⁰.
example : Nonempty (normalCone affineOrigin ≅ affineLine) := by sorry
-- Unit test TauCeti.AlgebraicGeometry.Intersection.normalCone_test_identity: The identity immersion has zero normal rank.
example (X : Scheme.{u}) : Nonempty (normalCone (𝟙 X) ≅ X) := by sorry
-- Unit test TauCeti.AlgebraicGeometry.Intersection.normalCone_test_node: At the origin of V(xy) in A² the normal cone is V(xy), a reducible cone rather than a rank-one vector space.
example : Nonempty (normalCone nodeOrigin ≅ affineNode) := by sorry

def relativeA1 (X : Scheme.{u}) : Scheme.{u} := by sorry
def relativeGm (X : Scheme.{u}) : Scheme.{u} := by sorry


/- SchemeAndStackFoundations:SF.5/normal-deformation
For a closed immersion i:Z→X, the open deformation M_ZX is Bl_(Z×{0})(X×A¹) with the strict transform of X×{0} removed. Its parameter t is a nonzerodivisor, its special fibre is C_ZX, and its restriction over G_m is X×G_m. Over a field k the parameter map M_ZX→A¹_k is flat. Over a general dimension base only the Cartier parameter and fibre identities are asserted. In the P¹ blowup compactification the exceptional divisor is the projective completion of C_ZX with an added trivial direction. For regular i this is P(N_ZX∨⊕O_Z) in the quotient convention. Its intersection with the strict transform is the projectivized cone without that direction. The blowup is imported from existing StableReduction Layer 4.
Omitted hypotheses: The relative A¹/G_m, parameter/fibre helpers are native schemes supplied by SF.0 and the imported blowup. Flatness is stated for the parameter map to A¹_k with the field explicit; it is not a flatness assertion about M_ZX→X×A¹. -/

def normalDeformation {Z X : Scheme.{u}} (i : Z ⟶ X) [IsClosedImmersion i] : Scheme.{u} := by sorry
def deformationParameter (k : Type u) [Field k] {Z X : Scheme.{u}} [X.Over (Spec (.of k))] (i : Z ⟶ X) [IsClosedImmersion i] : normalDeformation i ⟶ Spec (.of (Polynomial k)) := by sorry
def deformationZeroFiber {Z X : Scheme.{u}} (i : Z ⟶ X) [IsClosedImmersion i] : Scheme.{u} := by sorry
def deformationPunctured {Z X : Scheme.{u}} (i : Z ⟶ X) [IsClosedImmersion i] : Scheme.{u} := by sorry
/-- The t=0 fibre is canonically the normal cone. -/
def normalDeformation_zero {Z X : Scheme.{u}} (i : Z ⟶ X) [IsClosedImmersion i] : deformationZeroFiber i ≅ normalCone i := by sorry
/-- The restriction where t is invertible is X×G_m. -/
def normalDeformation_generic {Z X : Scheme.{u}} (i : Z ⟶ X) [IsClosedImmersion i] : deformationPunctured i ≅ relativeGm X := by sorry
/-- Over a field k the parameter map M_ZX→A¹_k is flat. -/
lemma normalDeformation_flat {k : Type u} [Field k] {Z X : Scheme.{u}} [X.Over (Spec (.of k))] (i : Z ⟶ X) [IsClosedImmersion i] : Flat (deformationParameter k i) := by sorry
-- Unit test TauCeti.AlgebraicGeometry.Intersection.normalDeformation_test_empty: The empty centre has empty special fibre; its open normal deformation is X×G_m.
example (X : Scheme.{u}) : Nonempty (normalDeformation (emptyTo X) ≅ relativeGm X) := by sorry
-- Unit test TauCeti.AlgebraicGeometry.Intersection.normalDeformation_test_origin: Deforming the origin of A¹ gives A² with coordinates t and x/t.
example : Nonempty (normalDeformation affineOrigin ≅ affinePlane) := by sorry
-- Unit test TauCeti.AlgebraicGeometry.Intersection.normalDeformation_test_node_special: The special fibre for the origin of V(xy) is the reducible node, retaining both branches.
example : Nonempty (deformationZeroFiber nodeOrigin ≅ affineNode) := by sorry
def originConeDimension : DimensionFunction (normalCone affineOrigin) := by sorry
def originConeFundamentalClass : Chow (normalCone affineOrigin) originConeDimension 1 := by sorry
def nodeConeDimension : DimensionFunction (normalCone nodeOrigin) := by sorry
def nodeFundamentalClass : Chow affineNode nodeDimension 1 := by sorry
def nodeConeBranchOne : Chow (normalCone nodeOrigin) nodeConeDimension 1 := by sorry
def nodeConeBranchTwo : Chow (normalCone nodeOrigin) nodeConeDimension 1 := by sorry
def coneSupportClass {Z X W : Scheme.{u}} (i : Z ⟶ X) [IsClosedImmersion i] (j : W ⟶ X) [IsClosedImmersion j] (γ : DimensionFunction (normalCone i)) (d : ℤ) : Chow (normalCone i) γ d := by sorry

/- SchemeAndStackFoundations:SF.5/specialization
Normal deformation gives σ_i:CH_d(X)→CH_d(C_ZX): lift the class to the compactified family and intersect with its special Cartier fibre. The trivial normal line kills the ambiguity of a lift. For an integral support W⊂X its specialization is the fundamental cycle of C_(W∩Z)W inside C_ZX, including generic multiplicities.
Omitted hypotheses: Compatible induced cone dimensions and pure support dimensions are omitted. The coneSupportClass helper denotes the stated closed normal-cone fundamental class, not an assumed specialization result. -/

def specialize {Z X : Scheme.{u}} (i : Z ⟶ X) [IsClosedImmersion i]
    (δ : DimensionFunction X) (γ : DimensionFunction (normalCone i)) (d : ℤ) :
    Chow X δ d →+ Chow (normalCone i) γ d := by sorry

/-- The class of an integral W specializes to the normal-cone fundamental class of W∩Z in W. -/
lemma specialize_fundamental {Z X W : Scheme.{u}} (i : Z ⟶ X) [IsClosedImmersion i] (j : W ⟶ X) [IsClosedImmersion j] (δ : DimensionFunction X) (γ : DimensionFunction (normalCone i)) (d : ℤ) : specialize i δ γ d (cycleClass δ d (fundamental δ d j)) = coneSupportClass i j γ d := by sorry
/-- Specialization adds cycles without changing the grade. -/
lemma specialize_add {Z X : Scheme.{u}} (i : Z ⟶ X) [IsClosedImmersion i] (δ : DimensionFunction X) (γ : DimensionFunction (normalCone i)) (d : ℤ) (a b : Chow X δ d) : specialize i δ γ d (a+b) = specialize i δ γ d a + specialize i δ γ d b := by sorry
/-- For the identity immersion specialization is the identity under C_XX≅X. -/
lemma specialize_identity {X : Scheme.{u}} (δ : DimensionFunction X) (γ : DimensionFunction (normalCone (𝟙 X))) (d : ℤ) : Function.Bijective (specialize (𝟙 X) δ γ d) := by sorry
-- Unit test TauCeti.AlgebraicGeometry.Intersection.specialize_test_zero: The zero Chow class has zero specialization.
example {Z X : Scheme.{u}} (i : Z ⟶ X) [IsClosedImmersion i] (δ : DimensionFunction X) (γ : DimensionFunction (normalCone i)) (d : ℤ) : specialize i δ γ d 0 = 0 := by sorry
-- Unit test TauCeti.AlgebraicGeometry.Intersection.specialize_test_line: The fundamental class of A¹ specializes to the fundamental class of its tangent line at the origin.
example : specialize affineOrigin affineLineDimension originConeDimension 1 affineLineFundamentalClass = originConeFundamentalClass := by sorry
-- Unit test TauCeti.AlgebraicGeometry.Intersection.specialize_test_node_branches: The node specializes with two component coefficients 1, rather than to one smooth tangent line.
example : specialize nodeOrigin nodeDimension nodeConeDimension 1 nodeFundamentalClass = nodeConeBranchOne + nodeConeBranchTwo := by sorry


/- SchemeAndStackFoundations:SF.5/refined-gysin
For a regular closed immersion i:Z→X of constant codimension c and any f:Y→X, define i!_f:CH_d(Y)→CH_(d−c)(Z×X Y). Specialize to C_(Z×X Y)Y, embed this cone in f_Z* N_ZX and invert rank-c vector-bundle homotopy. The base-changed immersion may fail to be regular; the rank is that of the original normal bundle.
Omitted hypotheses: Regularity and constant codimension c of the original immersion are omitted in Lean. refinedOriginal transports along the canonical pullback-with-identity isomorphism; it is not a second Gysin definition. -/

def refinedGysin {Z X Y : Scheme.{u}} (i : Z ⟶ X) [IsClosedImmersion i]
    (f : Y ⟶ X) (δ : DimensionFunction Y) (c : ℕ) (d : ℤ) :
    Chow Y δ d →+ Chow (pullback i f) (restrictDimension (closedBaseChange i f) δ) (d-c) := by sorry
def refinedOriginal {Z X : Scheme.{u}} (i : Z ⟶ X) [IsClosedImmersion i] (δ : DimensionFunction X) (c : ℕ) (d : ℤ) : Chow X δ d →+ Chow Z (restrictDimension i δ) (d-c) := by sorry
/-- In codimension one refined Gysin agrees with the Cartier map on the original ambient scheme. -/
lemma refinedGysin_cartier {Z X : Scheme.{u}} (i : Z ⟶ X) [IsClosedImmersion i] (δ : DimensionFunction X) (d : ℤ) : refinedOriginal i δ 1 d = cartierGysin i δ d := by sorry
/-- A codimension-zero identity has identity refined Gysin. -/
lemma refinedGysin_identity {X : Scheme.{u}} (δ : DimensionFunction X) (d : ℤ) (a : Chow X δ d) : refinedOriginal (𝟙 X) δ 0 d a = chowRegrade (by omega) (chowDimensionCast (restrictDimension_id X δ).symm a) := by sorry
/-- Every Chern cap operator commutes with refined Gysin, after pulling its bundle to the inverse image. -/
lemma refinedGysin_chern {Z X Y : Scheme.{u}} (i : Z ⟶ X) [IsClosedImmersion i] (f : Y ⟶ X) (δ : DimensionFunction Y) (c n : ℕ) (d : ℤ) (E : Y.Modules) (a : Chow Y δ d) : refinedGysin i f δ c (d-n) (chern δ E n d a) = chowRegrade (by omega) (chern (restrictDimension (closedBaseChange i f) δ) ((Scheme.Modules.pullback (closedBaseChange i f)).obj E) n (d-c) (refinedGysin i f δ c d a)) := by sorry
-- Unit test TauCeti.AlgebraicGeometry.Intersection.refinedGysin_test_transverse_lines: Two transverse lines in P² give one point in codimension one.
example : refinedOriginal p2Hyperplane p2Dimension 1 1 p2TransverseLineClass = p1MarkedPointClass := by sorry
-- Unit test TauCeti.AlgebraicGeometry.Intersection.refinedGysin_test_self_line: Refining a line against itself retains its normal Chern class, of degree 1.
example : refinedOriginal p2Hyperplane p2Dimension 1 1 p2HyperplaneClass = p1MarkedPointClass := by sorry
-- Unit test TauCeti.AlgebraicGeometry.Intersection.refinedGysin_test_identity: Codimension-zero refined Gysin preserves any class.
example {X : Scheme.{u}} (δ : DimensionFunction X) (d : ℤ) (a : Chow X δ d) : refinedOriginal (𝟙 X) δ 0 d a = chowRegrade (by omega) (chowDimensionCast (restrictDimension_id X δ).symm a) := by sorry
def refinedProperRight {Z X Y Y' : Scheme.{u}} (i : Z ⟶ X) [IsClosedImmersion i] (f : Y ⟶ X) (g : Y' ⟶ Y) [IsProper g] (δ : DimensionFunction Y) (ε : DimensionFunction Y') (c : ℕ) (d : ℤ) (a : Chow Y' ε d) : Chow (pullback i f) (restrictDimension (closedBaseChange i f) δ) (d-c) := by sorry
def refinedFlatRight {Z X Y Y' : Scheme.{u}} (i : Z ⟶ X) [IsClosedImmersion i] (f : Y ⟶ X) (g : Y' ⟶ Y) [Flat g] (δ : DimensionFunction Y) (ε : DimensionFunction Y') (c r : ℕ) (d : ℤ) (a : Chow Y δ d) : Chow (pullback i (g ≫ f)) (restrictDimension (closedBaseChange i (g ≫ f)) ε) (d+r-c) := by sorry

/- SchemeAndStackFoundations:SF.5/gysin-proper-flat
For an original regular immersion Z→X of constant codimension c and a proper Y′→Y over X, refined Gysin commutes with proper pushforward. Both routes have target CH_(d−c)(Z×X Y).
Omitted hypotheses: Original regularity/codimension and compatible dimensions are omitted. The right-side helper is pulled-back proper push with grade transport. -/

theorem refined_proper {Z X Y Y' : Scheme.{u}} (i : Z ⟶ X) [IsClosedImmersion i] (f : Y ⟶ X) (g : Y' ⟶ Y) [IsProper g] (δ : DimensionFunction Y) (ε : DimensionFunction Y') (c : ℕ) (d : ℤ) (a : Chow Y' ε d) : refinedGysin i f δ c d (properPush g ε δ d a) = refinedProperRight i f g δ ε c d a := by sorry




/- SchemeAndStackFoundations:SF.5/gysin-flat
For an original regular immersion Z→X of constant codimension c and Y′→Y flat of pure relative dimension r over X, refined Gysin commutes with flat pullback. Both routes have target CH_(d+r−c)(Z×X Y′), with the rank c of the original immersion.
Omitted hypotheses: Original regularity/codimension, compatible dimensions and flat relative pure dimension are omitted. The right-side helper is the actual pulled-back flat operation with its canonical transports. -/

theorem refined_flat {Z X Y Y' : Scheme.{u}} (i : Z ⟶ X) [IsClosedImmersion i] (f : Y ⟶ X) (g : Y' ⟶ Y) [Flat g] (δ : DimensionFunction Y) (ε : DimensionFunction Y') (c r : ℕ) (d : ℤ) (a : Chow Y δ d) : refinedGysin i (g ≫ f) ε c (d+r) (flatPull g ε δ r d a) = refinedFlatRight i f g δ ε c r d a := by sorry



/- SchemeAndStackFoundations:SF.5/gysin-excess
In a Cartesian square pulling a regular immersion of codimension c back to a regular immersion of codimension c′≤c, the excess bundle E fits 0→N_(Z′)Y→f_Z* N_ZX→E→0 and has rank c−c′. Refined pullback equals c_(c−c′)(E) capped with the codimension-c′ ordinary Gysin. Its target is CH_(d−c)(Z′), never CH_(d−c−c′) or CH_(d−c−rank E).
Omitted hypotheses: Regularity, the normal exact sequence and identification of E with its excess quotient are omitted; E is a native module, not a container for the desired equation. -/

theorem excess_intersection {Z X Y : Scheme.{u}} (i : Z ⟶ X) [IsClosedImmersion i] (f : Y ⟶ X) (δ : DimensionFunction Y) (c c' : ℕ) (hc : c' ≤ c) (d : ℤ) (E : (pullback i f).Modules) (a : Chow Y δ d) : refinedGysin i f δ c d a = chowRegrade (by omega) (chern (restrictDimension (closedBaseChange i f) δ) E (c-c') (d-c') (refinedOriginal (closedBaseChange i f) δ c' d a)) := by sorry



/- SchemeAndStackFoundations:SF.5/gysin-self-intersection
For a regular immersion i:Z→X of codimension c, i!i_*a=c_c(N_ZX)∩a in CH_(d−c)(Z). This is the excess case with pulled-back immersion the identity.
Omitted hypotheses: Regularity and the codimension condition are omitted from Lean. -/

theorem gysin_self_intersection {Z X : Scheme.{u}} (i : Z ⟶ X) [IsClosedImmersion i] (δ : DimensionFunction X) (c : ℕ) (d : ℤ) (a : Chow Z (restrictDimension i δ) d) : refinedOriginal i δ c d (properPush i (restrictDimension i δ) δ d a) = chern (restrictDimension i δ) (normalBundle i) c d a := by sorry

def refinedInterchangeRight {Z X W Y : Scheme.{u}} (i : Z ⟶ X) [IsClosedImmersion i] (j : W ⟶ Y) [IsClosedImmersion j] (f : Y ⟶ X) (δ : DimensionFunction Y) (c e : ℕ) (d : ℤ) (a : Chow Y δ d) : Chow (pullback j (closedBaseChange i f)) (restrictDimension (closedBaseChange j (closedBaseChange i f)) (restrictDimension (closedBaseChange i f) δ)) (d-c-e) := by sorry

/- SchemeAndStackFoundations:SF.5/gysin-interchange
For regular immersions Z→X and W→Y of constant codimensions c,e and a map Y→X, applying their refined Gysin operations in either order gives the same class on the canonical common fibre product, in grade d−c−e. Only the original immersions are required to be regular; their base changes can have excess.
Omitted hypotheses: Original regularity and codimensions, common induced dimensions, and the fibre-product isomorphism transports are omitted. The right side is the second order of refined operations transported to the common fibre product. -/

theorem regular_gysin_interchange {Z X W Y : Scheme.{u}} (i : Z ⟶ X) [IsClosedImmersion i] (j : W ⟶ Y) [IsClosedImmersion j] (f : Y ⟶ X) (δ : DimensionFunction Y) (c e : ℕ) (d : ℤ) (a : Chow Y δ d) : refinedGysin j (closedBaseChange i f) (restrictDimension (closedBaseChange i f) δ) e (d-c) (refinedGysin i f δ c d a) = refinedInterchangeRight i j f δ c e d a := by sorry

def regularCompositionRight {W Z X : Scheme.{u}} (j : W ⟶ Z) (i : Z ⟶ X) [IsClosedImmersion j] [IsClosedImmersion i] (δ : DimensionFunction X) (c e : ℕ) (d : ℤ) (a : Chow X δ d) : Chow W (restrictDimension (j ≫ i) δ) (d-(c+e)) := by sorry

/- SchemeAndStackFoundations:SF.5/gysin-composition
For regular closed immersions W→Z→X of constant codimensions e and c, their composite is regular of codimension c+e and its refined Gysin map is the composite of the two refined maps, including after arbitrary base change.
Omitted hypotheses: Regularity/codimension are omitted. The right side is the two composed Gysin maps with the canonical restriction and grade transports; proving their equality requires the double-deformation input recorded as a gap. -/

theorem regular_gysin_comp {W Z X : Scheme.{u}} (j : W ⟶ Z) (i : Z ⟶ X) [IsClosedImmersion j] [IsClosedImmersion i] (δ : DimensionFunction X) (c e : ℕ) (d : ℤ) (a : Chow X δ d) : refinedOriginal (j ≫ i) δ (c+e) d a = regularCompositionRight j i δ c e d a := by sorry



/- SchemeAndStackFoundations:SF.5/lci-pullback
For a morphism f:X→Y with a global factorization X→P→Y, first map a regular immersion of codimension c and second map smooth of pure relative dimension r, define f!=i!∘p*:CH_d(Y)→CH_(d+r−c)(X). This is independent of the chosen such factorization. A merely locally factorable lci morphism requires a separate gluing theorem; the read Stacks definition does not supply it.
Omitted hypotheses: The regular codimension-c and smooth relative-dimension-r hypotheses are omitted; Flat p alone is not sufficient. Factorization independence is a separate node below. The arbitrary locally factorable route remains a recorded gap. -/

def lciPull {X P Y : Scheme.{u}} (i : X ⟶ P) [IsClosedImmersion i] (p : P ⟶ Y) [Flat p] (δ : DimensionFunction X) (ε : DimensionFunction Y) (r c : ℕ) (d : ℤ) : Chow Y ε d →+ Chow X δ (d+r-c) := by sorry
def lciFactorizationRight {X P Y : Scheme.{u}} (i : X ⟶ P) [IsClosedImmersion i] (p : P ⟶ Y) [Flat p] (δ : DimensionFunction X) (γ : DimensionFunction P) (ε : DimensionFunction Y) (r c : ℕ) (d : ℤ) (a : Chow Y ε d) : Chow X δ (d+r-c) := by sorry
/-- The pullback is the shifted smooth pull followed by regular Gysin. -/
lemma lciPull_factorization {X P Y : Scheme.{u}} (i : X ⟶ P) [IsClosedImmersion i] (p : P ⟶ Y) [Flat p] (δ : DimensionFunction X) (γ : DimensionFunction P) (ε : DimensionFunction Y) (r c : ℕ) (d : ℤ) (a : Chow Y ε d) : lciPull i p δ ε r c d a = lciFactorizationRight i p δ γ ε r c d a := by sorry
/-- For a smooth morphism factored with the identity regular immersion, lci pullback is flat pullback. -/
lemma lciPull_smooth {X Y : Scheme.{u}} (p : X ⟶ Y) [Flat p] (δ : DimensionFunction X) (ε : DimensionFunction Y) (r : ℕ) (d : ℤ) (a : Chow Y ε d) : lciPull (𝟙 X) p δ ε r 0 d a = chowRegrade (by omega) (flatPull p δ ε r d a) := by sorry
/-- If the globally factorable lci map is also flat of pure relative dimension s=r−c, its lci pull is its flat pull. -/
lemma lciPull_flat {X P Y : Scheme.{u}} (i : X ⟶ P) [IsClosedImmersion i] (p : P ⟶ Y) [Flat p] [Flat (i ≫ p)] (δ : DimensionFunction X) (ε : DimensionFunction Y) (r c s : ℕ) (hs : (r : ℤ)-c = s) (d : ℤ) (a : Chow Y ε d) : lciPull i p δ ε r c d a = chowRegrade (by omega) (flatPull (i ≫ p) δ ε s d a) := by sorry
-- Unit test TauCeti.AlgebraicGeometry.Intersection.lciPull_test_identity: The identity has virtual relative dimension zero.
example {X : Scheme.{u}} (δ : DimensionFunction X) (d : ℤ) (a : Chow X δ d) : lciPull (𝟙 X) (𝟙 X) δ δ 0 0 d a = chowRegrade (by omega) a := by sorry
-- Unit test TauCeti.AlgebraicGeometry.Intersection.lciPull_test_hyperplane: A hyperplane immersion has virtual dimension −1 and gives the line intersection class in P².
example : lciPull p2Hyperplane (𝟙 p2) p1Dimension p2Dimension 0 1 1 p2TransverseLineClass = p1MarkedPointClass := by sorry
-- Unit test TauCeti.AlgebraicGeometry.Intersection.lciPull_test_affine_line: A¹→Spec ℚ has virtual dimension +1 and gives the affine-line fundamental class.
example : lciPull (𝟙 affineLine) affineLineToPoint affineLineDimension pointDimension 1 0 0 pointClass = affineLineFundamentalClass := by sorry


/- SchemeAndStackFoundations:SF.5/lci-factorization-independence
Two global regular-immersion/smooth factorizations of the same f give equal pullback homomorphisms after transporting the virtual-dimension grade. The same comparison proves composition when the relevant global factorizations exist.
Omitted hypotheses: Regular and smooth rank hypotheses are omitted in Lean. -/

theorem lci_factorization_independent {X P Q Y : Scheme.{u}} (i : X ⟶ P) (j : X ⟶ Q) (p : P ⟶ Y) (q : Q ⟶ Y) [IsClosedImmersion i] [IsClosedImmersion j] [Flat p] [Flat q] (h : i ≫ p = j ≫ q) (δ : DimensionFunction X) (ε : DimensionFunction Y) (r c s e : ℕ) (hv : (r : ℤ)-c = (s : ℤ)-e) (d : ℤ) (a : Chow Y ε d) : lciPull i p δ ε r c d a = chowRegrade (by omega) (lciPull j q δ ε s e d a) := by sorry

def fiberProduct (k : Type u) [Field k] (X Y : Scheme.{u}) [X.Over (Spec (.of k))] [Y.Over (Spec (.of k))] : Scheme.{u} := pullback (X ↘ Spec (.of k)) (Y ↘ Spec (.of k))
def inseparableProductCoefficient (k K : Type u) [Field k] [Field K] [Algebra k K] : ℤ := by sorry
def p1ProductFundamentalClass : Chow (fiberProduct ℚ p1 p1) p1ProductDimension 2 := by sorry
def fiberPointDimension (k : Type u) [Field k] (X : Scheme.{u}) [X.Over (Spec (.of k))] (δ : DimensionFunction X) : DimensionFunction (fiberProduct k X (Spec (.of k))) := by sorry


/- SchemeAndStackFoundations:SF.5/exterior-product
For finite-type schemes X,Y over a field k, form a×b in CH_(d+e)(X×kY) from the fundamental cycles of the tensor-product supports. If W×kV is nonreduced or reducible, use all its generic lengths. This is bilinear, associative and commutes with proper push and pure-dimensional flat pull, without assuming k algebraically closed.
Omitted hypotheses: Finite type, induced dimensions and support purity are omitted. The inseparable test additionally assumes K/k purely inseparable of degree p, omitted from Lean; it does not claim this coefficient for arbitrary extensions. -/

def exterior {k : Type u} [Field k] (X Y : Scheme.{u}) [X.Over (Spec (.of k))] [Y.Over (Spec (.of k))] (δ : DimensionFunction X) (ε : DimensionFunction Y) (γ : DimensionFunction (fiberProduct k X Y)) (d e : ℤ) : Chow X δ d →+ (Chow Y ε e →+ Chow (fiberProduct k X Y) γ (d+e)) := by sorry
def exteriorWithPoint (k : Type u) [Field k] (X : Scheme.{u}) [X.Over (Spec (.of k))] (δ : DimensionFunction X) (d : ℤ) : Chow X δ d → Chow (fiberProduct k X (Spec (.of k))) (fiberPointDimension k X δ) d := by sorry
/-- Exterior product is additive in its first argument as well as its second. -/
lemma exterior_add {k : Type u} [Field k] (X Y : Scheme.{u}) [X.Over (Spec (.of k))] [Y.Over (Spec (.of k))] (δ : DimensionFunction X) (ε : DimensionFunction Y) (γ : DimensionFunction (fiberProduct k X Y)) (d e : ℤ) (a b : Chow X δ d) (z : Chow Y ε e) : exterior (k := k) X Y δ ε γ d e (a+b) z = exterior (k := k) X Y δ ε γ d e a z + exterior (k := k) X Y δ ε γ d e b z := by sorry
/-- The product of fundamental integral support classes is the entire fibre-product fundamental class. -/
lemma exterior_fundamental {k : Type u} [Field k] (X Y : Scheme.{u}) [X.Over (Spec (.of k))] [Y.Over (Spec (.of k))] (δ : DimensionFunction X) (ε : DimensionFunction Y) (γ : DimensionFunction (fiberProduct k X Y)) (d e : ℤ) : exterior (k := k) X Y δ ε γ d e (wholeClass X δ d) (wholeClass Y ε e) = wholeClass (fiberProduct k X Y) γ (d+e) := by sorry
/-- Product with a unit rational point preserves the class under X×Spec k≅X. -/
lemma exterior_point {k : Type u} [Field k] (X : Scheme.{u}) [X.Over (Spec (.of k))] (δ : DimensionFunction X) (d : ℤ) : Function.Injective (exteriorWithPoint k X δ d) := by sorry
-- Unit test TauCeti.AlgebraicGeometry.Intersection.exterior_test_zero: Multiplying by the zero Chow class gives zero.
example {k : Type u} [Field k] (X Y : Scheme.{u}) [X.Over (Spec (.of k))] [Y.Over (Spec (.of k))] (δ : DimensionFunction X) (ε : DimensionFunction Y) (γ : DimensionFunction (fiberProduct k X Y)) (d e : ℤ) (a : Chow X δ d) : exterior (k := k) X Y δ ε γ d e a 0 = 0 := by sorry
-- Unit test TauCeti.AlgebraicGeometry.Intersection.exterior_test_p1: The exterior square of [P¹] is the two-dimensional fundamental class of P¹×P¹.
example : exterior (k := ℚ) p1 p1 p1Dimension p1Dimension p1ProductDimension 1 1 p1FundamentalClass p1FundamentalClass = p1ProductFundamentalClass := by sorry
-- Unit test TauCeti.AlgebraicGeometry.Intersection.exterior_test_inseparable: For a purely inseparable degree-p field extension K/k, K⊗kK has generic length p, which survives the product cycle.
example {k K : Type u} [Field k] [Field K] [Algebra k K] (p : ℕ) : inseparableProductCoefficient k K = (p : ℤ) := by sorry
def productRulingIntersection : ℤ := by sorry
def productRulingOneSquare : ℤ := by sorry
def productRulingTwoSquare : ℤ := by sorry

/- SchemeAndStackFoundations:SF.5/smooth-intersection
For X smooth and separated of pure dimension n over a field, multiply homological classes by Δ_X! applied to their exterior product. Reindex CH^j(X)=CH_(n−j)(X) and form the graded direct sum ⊕_j CH^j(X); it is a commutative ring with unit [X]. Only here are Chern operators identified with multiplication by Chern classes. Arbitrary singular Chow homology is not given this ring.
Omitted hypotheses: Smoothness, separatedness, finite type and pure dimension n are omitted in these signatures. No CommRing instance is supplied for arbitrary X or arbitrary dimension function; smoothChowRing is only a future structure constructor under those omitted conditions. -/

abbrev TotalChow (X : Scheme.{u}) (δ : DimensionFunction X) (n : ℤ) := ⨁ j : ℤ, Chow X δ (n-j)
def intersect {k : Type u} [Field k] (X : Scheme.{u}) [X.Over (Spec (.of k))] (δ : DimensionFunction X) (n d e : ℤ) : Chow X δ d →+ (Chow X δ e →+ Chow X δ (d+e-n)) := by sorry

/-- The intersection of a and b equals that of b and a after grade transport. -/
lemma intersect_comm {k : Type u} [Field k] (X : Scheme.{u}) [X.Over (Spec (.of k))] (δ : DimensionFunction X) (n d e : ℤ) (a : Chow X δ d) (b : Chow X δ e) : intersect (k := k) X δ n d e a b = chowRegrade (by omega) (intersect (k := k) X δ n e d b a) := by sorry
/-- The pure-dimensional fundamental class is the multiplicative unit. -/
lemma intersect_unit {k : Type u} [Field k] (X : Scheme.{u}) [X.Over (Spec (.of k))] (δ : DimensionFunction X) (n d : ℤ) (a : Chow X δ d) : intersect (k := k) X δ n n d (wholeClass X δ n) a = chowRegrade (by omega) a := by sorry
/-- The codimension-graded direct sum has the stated commutative ring structure. -/
def smoothChowRing {k : Type u} [Field k] (X : Scheme.{u}) [X.Over (Spec (.of k))] (δ : DimensionFunction X) (n : ℕ) : CommRing (TotalChow X δ n) := by sorry
-- Unit test TauCeti.AlgebraicGeometry.Intersection.intersect_test_p2_lines: Two P² line classes multiply to one point.
example : intersect (k := ℚ) p2 p2Dimension 2 1 1 p2HyperplaneClass p2HyperplaneClass = p2PointClass := by sorry
-- Unit test TauCeti.AlgebraicGeometry.Intersection.intersect_test_p1_square: The square of a point class on P¹ lies in grade −1 and is zero.
example : intersect (k := ℚ) p1 p1Dimension 1 0 0 p1MarkedPointClass p1MarkedPointClass = 0 := by sorry
-- Unit test TauCeti.AlgebraicGeometry.Intersection.intersect_test_rulings: On P¹×P¹ the two ruling classes multiply to one point, although each ruling has square zero.
example : productRulingIntersection = 1 ∧ productRulingOneSquare = 0 ∧ productRulingTwoSquare = 0 := by sorry
-- The two independent local invariants, with the packet's finite-length/regular-ring conditions omitted.
def localIntersectionMultiplicity (A : Type u) [CommRing A] (M N : Type v) [AddCommGroup M] [Module A M] [AddCommGroup N] [Module A N] : ℤ := by sorry
def alternatingTorLength (A : Type u) [CommRing A] (M N : Type v) [AddCommGroup M] [Module A M] [AddCommGroup N] [Module A N] : ℤ := by sorry

/- SchemeAndStackFoundations:SF.5/tor-intersection
On a smooth variety over an algebraically closed field, integral supports V,W meeting properly have intersection coefficients Σ_i(−1)^i length Tor_i^(O_X,η)(O_V,η,O_W,η). All lengths are finite and only finitely many are nonzero. If both supports are Cohen–Macaulay, the higher Tor terms vanish and the coefficient is length O_(V∩W),η. Without those hypotheses the raw intersection length can be wrong.
Omitted hypotheses: Regular Noetherian ambient local ring, finite modules, proper intersection and the finite-length Tor conditions are omitted. The two integer helpers are the described independently constructed length invariants; neither is defined by the equality being asserted. -/

theorem local_tor_intersection (A : Type u) [CommRing A] (M N : Type v) [AddCommGroup M] [Module A M] [AddCommGroup N] [Module A N] : localIntersectionMultiplicity A M N = alternatingTorLength A M N := by sorry

def residueFieldDegree (k : Type u) [Field k] (X : Scheme.{u}) [X.Over (Spec (.of k))] (x : X) : ℕ := by sorry

/- SchemeAndStackFoundations:SF.5/degree
For a proper finite-type k-scheme, push CH₀(X;ℤ) to CH₀(Spec k)=ℤ. A closed point x has degree [κ(x):k], including inseparable degree. Rational extension gives CH₀(X;ℚ)→ℚ. This is not a degree map on nonproper X: a point on A¹ can be rationally equivalent to zero.
Omitted hypotheses: Properness, finite type, field-induced dimensions and the pure proper curve condition are omitted. eulerCharacteristic is the native finite-cutoff expression with the required finite-dimensionality and vanishing certificate; it is not another cohomology definition. -/

def degree {k : Type u} [Field k] (X : Scheme.{u}) [X.Over (Spec (.of k))] (δ : DimensionFunction X) : Chow X δ 0 →+ ℤ := by sorry

/-- A closed-point unit class has its full residue extension degree. -/
lemma degree_closed_point {k : Type u} [Field k] (X : Scheme.{u}) [X.Over (Spec (.of k))] (δ : DimensionFunction X) (x : X) (hx : δ.value x = 0) : degree (k := k) X δ (cycleClass δ 0 (Cycle.single δ 0 x hx 1)) = (residueFieldDegree k X x : ℤ) := by sorry
/-- Degree commutes with proper push over k. -/
lemma degree_proper {k : Type u} [Field k] (X Y : Scheme.{u}) [X.Over (Spec (.of k))] [Y.Over (Spec (.of k))] (f : X ⟶ Y) [IsProper f] (δ : DimensionFunction X) (ε : DimensionFunction Y) (a : Chow X δ 0) : degree (k := k) Y ε (properPush f δ ε 0 a) = degree (k := k) X δ a := by sorry
/-- On a proper curve, deg(c₁(L)∩[C])=χ(L)−χ(O_C). -/
lemma degree_curve_chern {k : Type u} [Field k] (C : Scheme.{u}) [C.Over (Spec (.of k))] (δ : DimensionFunction C) (L : Line C) : degree (k := k) C δ (firstChern δ L 1 (wholeClass C δ 1)) = eulerCharacteristic k C L.obj - eulerCharacteristic k C (unitModule C) := by sorry
-- Unit test TauCeti.AlgebraicGeometry.Intersection.degree_test_p1_o2: The degree of c₁(O(2)) on P¹ is 2.
example : degree (k := ℚ) p1 p1Dimension (firstChern p1Dimension (linePower p1O1 2) 1 p1FundamentalClass) = 2 := by sorry
-- Unit test TauCeti.AlgebraicGeometry.Intersection.degree_test_point: A rational point has degree 1.
example : degree (k := ℚ) (Spec (.of ℚ)) pointDimension pointClass = 1 := by sorry
-- Unit test TauCeti.AlgebraicGeometry.Intersection.degree_test_degree_two: A closed point of residue degree 2 is not counted with degree 1.
example {k : Type u} [Field k] (X : Scheme.{u}) [X.Over (Spec (.of k))] (δ : DimensionFunction X) (x : X) (hx : δ.value x = 0) (hd : residueFieldDegree k X x = 2) : degree (k := k) X δ (cycleClass δ 0 (Cycle.single δ 0 x hx 1)) = 2 := by sorry
def isolatedPlaneIntersectionLength {k : Type u} [Field k] (F G : MvPolynomial (Fin 3) k) : ℕ := by sorry

/- SchemeAndStackFoundations:SF.5/isolated-plane-bezout
Let F,G be nonzero homogeneous polynomials of positive degrees m,n on P² over an algebraically closed field. Sum the local scheme lengths only over isolated points of V(F)∩V(G). The sum is at most mn, even if F and G have common curve components. If there are no common components, equality holds. Remove their homogeneous greatest common divisor H; an isolated point is outside V(H), so its local length equals that of the residual coprime pair.
Omitted hypotheses: Algebraic closedness, nonzero homogeneous forms and their specified degrees are omitted. The integer helper is the finite sum of lengths at isolated projective intersections, not total length of a positive-dimensional common locus. -/

theorem isolated_plane_bezout {k : Type u} [Field k] (F G : MvPolynomial (Fin 3) k) (m n : ℕ) : isolatedPlaneIntersectionLength F G ≤ m*n := by sorry

def importedArithmeticPairing {X : Scheme.{u}} (D E : SchemeWeilDivisor X) : ℤ := by sorry
def cartierArithmeticPairing {X : Scheme.{u}} (D E : SchemeWeilDivisor X) : ℤ := by sorry

/- SchemeAndStackFoundations:SF.5/arithmetic-surface-comparison
On a regular proper arithmetic surface over a Dedekind base, compare the imported StableReduction Layer 4 Cartier/Weil pairing with the local Cartier-Gysin lengths of SF.5. At proper vertical intersections the coefficients agree before taking residue-weighted fibre degree; self-intersection uses the normal line and agrees with the imported pairing. Keep the base dimension function: vertical curves have grade 1 and closed points grade 0. No global field-valued degree is asserted for a nonproper generic open.
Omitted hypotheses: Regular proper arithmetic-surface/base/fibre and divisor support conditions are omitted. Both integer pairing helpers denote their independently specified constructions; Layer 4 owns the pairing and all reduction/contraction mathematics. -/

theorem arithmetic_surface_pairing {X : Scheme.{u}} (D E : SchemeWeilDivisor X) : importedArithmeticPairing D E = cartierArithmeticPairing D E := by sorry



/- SchemeAndStackFoundations:SF.5/finite-resolutions
On a smooth quasiprojective variety over an algebraically closed field, every coherent module has a finite locally free resolution. Two resolutions give the same alternating Chern character; exact sequences of coherent modules give additive characters. The construction needed here is the minimal resolution comparison, not a replacement for SchemeKTheory S.7 K₀/G₀ or λ-operations.
Omitted hypotheses: Smoothness, quasiprojectivity, coherence and local freeness of each C.X n are omitted. The suggested form retains boundedness, vanishing positive homology and the degree-zero homology comparison to the actual native module M. -/

theorem coherent_finite_resolution {X : Scheme.{u}} (M : X.Modules) : ∃ (C : ChainComplex X.Modules ℕ) (N : ℕ), (∀ n : ℕ, N ≤ n → IsZero (C.X n)) ∧ (∀ n : ℕ, 0 < n → IsZero (C.homology n)) ∧ Nonempty (C.homology 0 ≅ M) := by sorry



/- SchemeAndStackFoundations:SF.5/chern-character
On a smooth separated pure n-dimensional finite-type k-scheme, ch(E)=Σ_i exp(α_i) in CH^*(X;ℚ), truncated above n, where α_i are the first Chern roots on the flag bundle. Thus ch₀=r, ch₁=c₁, ch₂=(c₁²−2c₂)/2. For coherent M in the smooth quasiprojective resolution scope, define ch(M) by the alternating character of a finite locally free resolution. These are finite characteristic polynomials with denominators, not integral classes or an unbounded exponential.
Omitted hypotheses: Smooth pure dimension, finite local freeness or the coherent finite-resolution conditions are omitted. Tensor and finite rational polynomial helpers use the native modules and direct-sum Chow carrier, with the stated smooth ring structure; no arbitrary singular Chow ring instance is introduced. -/

abbrev RationalTotalChow (X : Scheme.{u}) (δ : DimensionFunction X) (n : ℤ) := ℚ ⊗[ℤ] TotalChow X δ n
def chernCharacter {X : Scheme.{u}} (δ : DimensionFunction X) (n : ℕ) (E : X.Modules) : RationalTotalChow X δ n := by sorry

-- Finite rational characteristic expressions in the native tensor of the graded direct sum.
-- Smoothness, pure dimension and finite local freeness are required; no global ring instance is installed.
def rationalChowUnit {X : Scheme.{u}} (δ : DimensionFunction X) (n : ℕ) : RationalTotalChow X δ n := by sorry
def rationalChowProduct {X : Scheme.{u}} (δ : DimensionFunction X) (n : ℕ) (a b : RationalTotalChow X δ n) : RationalTotalChow X δ n := by sorry
def truncatedChernExponential {X : Scheme.{u}} (δ : DimensionFunction X) (n : ℕ) (L : Line X) : RationalTotalChow X δ n := by sorry
def characterTopNumber {X : Scheme.{u}} (δ : DimensionFunction X) (n : ℕ) (E : X.Modules) : ℚ := by sorry

/-- The character is additive on an exact sequence in the stated locally free/coherent scope. -/
lemma chernCharacter_exact {X : Scheme.{u}} (δ : DimensionFunction X) (n : ℕ) (S : ShortComplex X.Modules) (h : S.ShortExact) : chernCharacter δ n S.X₂ = chernCharacter δ n S.X₁ + chernCharacter δ n S.X₃ := by sorry
/-- For locally free E,F, ch(E⊗F)=ch(E)ch(F). -/
lemma chernCharacter_tensor {X : Scheme.{u}} (δ : DimensionFunction X) (n : ℕ) (E F : X.Modules) : chernCharacter δ n (moduleTensor E F) = rationalChowProduct δ n (chernCharacter δ n E) (chernCharacter δ n F) := by sorry
/-- For a line bundle ch(L) is the exponential of c₁(L), truncated at dimension n. -/
lemma chernCharacter_line {X : Scheme.{u}} (δ : DimensionFunction X) (n : ℕ) (L : Line X) : chernCharacter δ n L.obj = truncatedChernExponential δ n L := by sorry
-- Unit test TauCeti.AlgebraicGeometry.Intersection.chernCharacter_test_rank_two_point: At a rational point the free rank-two module has character 2.
example : chernCharacter pointDimension 0 (freeModule (Spec (.of ℚ)) 2) = 2 • rationalChowUnit pointDimension 0 := by sorry
-- Unit test TauCeti.AlgebraicGeometry.Intersection.chernCharacter_test_zero: The zero coherent module has zero character.
example {X : Scheme.{u}} (δ : DimensionFunction X) (n : ℕ) : chernCharacter δ n (0 : X.Modules) = 0 := by sorry
-- Unit test TauCeti.AlgebraicGeometry.Intersection.chernCharacter_test_line_c2: A line on P² has degree-two character h²/2 although its second Chern class vanishes.
example : characterTopNumber p2Dimension 2 p2O1.obj = (1/2 : ℚ) := by sorry


/- SchemeAndStackFoundations:SF.5/todd-class
For a finite locally free bundle E on a smooth pure n-dimensional scheme, td(E)=∏ α_i/(1−exp(−α_i)) in the dimension-truncated rational Chow ring. Its terms begin 1+c₁/2+(c₁²+c₂)/12+c₁c₂/24. It is multiplicative on exact sequences and has constant term 1, hence an inverse because the positive-degree ideal of the dimension-truncated graded ring is nilpotent. Define td(T_X) using the tangent bundle on a smooth variety.
Omitted hypotheses: The smooth pure-dimension and finite locally free hypotheses are omitted. The tangent bundle is the dual of the imported smooth cotangent module; the SF.2 smooth-proper duality node supplies canonical sheaf compatibility, not a new duality theory. -/

def todd {X : Scheme.{u}} (δ : DimensionFunction X) (n : ℕ) (E : X.Modules) : RationalTotalChow X δ n := by sorry
def toddTopNumber {X : Scheme.{u}} (δ : DimensionFunction X) (n : ℕ) (E : X.Modules) : ℚ := by sorry
def inverseTodd {X : Scheme.{u}} (δ : DimensionFunction X) (n : ℕ) (E : X.Modules) : RationalTotalChow X δ n := by sorry

/-- td(E)=td(E′)td(E″) for an exact sequence of finite locally free modules. -/
lemma todd_exact {X : Scheme.{u}} (δ : DimensionFunction X) (n : ℕ) (S : ShortComplex X.Modules) (h : S.ShortExact) : todd δ n S.X₂ = rationalChowProduct δ n (todd δ n S.X₁) (todd δ n S.X₃) := by sorry
/-- The zero bundle has Todd class 1. -/
lemma todd_zero {X : Scheme.{u}} (δ : DimensionFunction X) (n : ℕ) : todd δ n (0 : X.Modules) = rationalChowUnit δ n := by sorry
/-- Multiplying td(E) by its finite inverse gives the unit of the truncated rational Chow ring. -/
lemma todd_inverse {X : Scheme.{u}} (δ : DimensionFunction X) (n : ℕ) (E : X.Modules) : rationalChowProduct δ n (todd δ n E) (inverseTodd δ n E) = rationalChowUnit δ n := by sorry
-- Unit test TauCeti.AlgebraicGeometry.Intersection.todd_test_p1: The degree-one Todd number of P¹ is 1, since c₁(T_P¹)=2h.
example : toddTopNumber p1Dimension 1 (tangentBundle p1) = 1 := by sorry
-- Unit test TauCeti.AlgebraicGeometry.Intersection.todd_test_p2: The degree-two Todd number of P² is (9+3)/12=1.
example : toddTopNumber p2Dimension 2 (tangentBundle p2) = 1 := by sorry
-- Unit test TauCeti.AlgebraicGeometry.Intersection.todd_test_trivial: The trivial line has Todd class 1 in every dimension.
example {X : Scheme.{u}} (δ : DimensionFunction X) (n : ℕ) : todd δ n (unitModule X) = rationalChowUnit δ n := by sorry
def koszulAlternatingCharacter {X : Scheme.{u}} (δ : DimensionFunction X) (n r : ℕ) (E : X.Modules) : RationalTotalChow X δ n := by sorry
def topChernClass {X : Scheme.{u}} (δ : DimensionFunction X) (n r : ℕ) (E : X.Modules) : RationalTotalChow X δ n := by sorry

/- SchemeAndStackFoundations:SF.5/koszul-character
For a rank-r bundle E, ch(λ₋₁E∨)=c_r(E)td(E)⁻¹. If its section is regular, the associated Koszul complex resolves the zero-scheme structure sheaf, so this virtual expression is its coherent character. This is a minimal alternating exterior-power formula, not a new general λ-ring.
Omitted hypotheses: Finite local freeness, rank, smooth dimension and regularity are omitted. The missing general Koszul construction and exactness are explicitly requested from the lower algebra foundations owner. -/

theorem koszul_character {X : Scheme.{u}} (δ : DimensionFunction X) (n r : ℕ) (E : X.Modules) : koszulAlternatingCharacter δ n r E = rationalChowProduct δ n (topChernClass δ n r E) (inverseTodd δ n E) := by sorry

def projectiveEulerCharacteristic (n : ℕ) (m : ℤ) : ℤ := by sorry
def polynomialBinomial (m : ℤ) (n : ℕ) : ℤ := by sorry

/- SchemeAndStackFoundations:SF.5/projective-space-rr
For P^n and O(m), with every integer m, χ(O(m))=binom(m+n,n), using the polynomial binomial convention for negative m. Equivalently the degree-n coefficient of exp(mh)(h/(1−exp(−h)))^(n+1) is this Euler characteristic.
Omitted hypotheses: The precise source hypotheses are in the packet and reader. -/

theorem projective_space_rr (n : ℕ) (m : ℤ) : projectiveEulerCharacteristic n m = polynomialBinomial (m+n) n := by sorry

def vectorBundleRank {X : Scheme.{u}} (E : X.Modules) : ℕ := by sorry
def vectorBundleDimension {X : Scheme.{u}} (δ : DimensionFunction X) (E : X.Modules) : DimensionFunction (vectorBundle X E) := by sorry
def zeroSectionCharacterPush {X : Scheme.{u}} (δ : DimensionFunction X) (n : ℕ) (E M : X.Modules) : RationalTotalChow (vectorBundle X E) (vectorBundleDimension δ E) (n + vectorBundleRank E) := by sorry
def zeroSectionToddPush {X : Scheme.{u}} (δ : DimensionFunction X) (n : ℕ) (E M : X.Modules) : RationalTotalChow (vectorBundle X E) (vectorBundleDimension δ E) (n + vectorBundleRank E) := by sorry

/- SchemeAndStackFoundations:SF.5/zero-section-rr
For the zero section i:X→V(E) of a bundle on a smooth quasiprojective variety, ch(i_*M)=i_*(ch(M)td(E)⁻¹). Use the projective completion to prove the identity and restrict to the vector bundle. With the quotient convention that completion is P(E∨⊕O); the lines convention in Krämer writes P(E⊕O).
Omitted hypotheses: Smoothness, quasiprojectivity and coherence are omitted. Each side denotes the displayed independently constructed rational Chow expression, with the zero-section proper push; no conclusion is a premise. -/

theorem zero_section_rr {X : Scheme.{u}} (δ : DimensionFunction X) (n : ℕ) (E M : X.Modules) : zeroSectionCharacterPush δ n E M = zeroSectionToddPush δ n E M := by sorry

def embeddingRrLeft {X Y : Scheme.{u}} (i : X ⟶ Y) [IsClosedImmersion i] (δ : DimensionFunction X) (ε : DimensionFunction Y) (n m : ℕ) (M : X.Modules) : RationalTotalChow Y ε m := by sorry
def embeddingRrRight {X Y : Scheme.{u}} (i : X ⟶ Y) [IsClosedImmersion i] (δ : DimensionFunction X) (ε : DimensionFunction Y) (n m : ℕ) (M : X.Modules) : RationalTotalChow Y ε m := by sorry

/- SchemeAndStackFoundations:SF.5/regular-embedding-rr
For a closed immersion i:X→Y between smooth quasiprojective varieties, ch(i_*M)=i_*(ch(M)td(N_i)⁻¹). The normal tangent exact sequence converts this to ch(i_*M)td(T_Y)=i_*(ch(M)td(T_X)).
Omitted hypotheses: Smoothness, quasiprojectivity, coherence and dimensions are omitted; the two helpers are the rational Chow expressions specified above. -/

theorem regular_embedding_rr {X Y : Scheme.{u}} (i : X ⟶ Y) [IsClosedImmersion i] (δ : DimensionFunction X) (ε : DimensionFunction Y) (n m : ℕ) (M : X.Modules) : embeddingRrLeft i δ ε n m M = embeddingRrRight i δ ε n m M := by sorry

def grrHigherImageSide {X Y : Scheme.{u}} (f : X ⟶ Y) [IsProper f] (δ : DimensionFunction X) (ε : DimensionFunction Y) (n m : ℕ) (M : X.Modules) : RationalTotalChow Y ε m := by sorry
def grrPushSide {X Y : Scheme.{u}} (f : X ⟶ Y) [IsProper f] (δ : DimensionFunction X) (ε : DimensionFunction Y) (n m : ℕ) (M : X.Modules) : RationalTotalChow Y ε m := by sorry

/- SchemeAndStackFoundations:SF.5/projective-grr
For a projective morphism f:X→Y of smooth quasiprojective varieties over an algebraically closed field and coherent M, Σ_i(−1)^i ch(R^i f_*M)·td(T_Y)=f_*(ch(M)·td(T_X)) in CH^*(Y;ℚ). The higher direct images are coherent and vanish beyond a finite bound. This source proves projective GRR in all characteristics; it does not prove arbitrary proper, singular, nodal-family, or stack GRR.
Omitted hypotheses: Projectivity, common algebraically closed field, smoothness, quasiprojectivity, coherence and dimensions are omitted. IsProper alone is insufficient; the two independently defined sides contain the finite alternating higher images and the rational proper Chow push. -/

theorem projective_grr {X Y : Scheme.{u}} (f : X ⟶ Y) [IsProper f] (δ : DimensionFunction X) (ε : DimensionFunction Y) (n m : ℕ) (M : X.Modules) : grrHigherImageSide f δ ε n m M = grrPushSide f δ ε n m M := by sorry

def rrTopNumber {X : Scheme.{u}} (δ : DimensionFunction X) (n : ℕ) (M : X.Modules) : ℚ := by sorry

/- SchemeAndStackFoundations:SF.5/hirzebruch-rr
For a smooth projective n-dimensional variety over an algebraically closed field and coherent M, χ(M)=deg([ch(M)td(T_X)]_n). For a surface this gives χ(O_X)=(K_X²+c₂(T_X))/12 and χ(L)=χ(O_X)+(c₁(L)²−c₁(L)K_X)/2.
Omitted hypotheses: Smooth projective, algebraically closed field, dimension n and coherence hypotheses are omitted. -/

theorem hirzebruch_rr {k : Type u} [Field k] (X : Scheme.{u}) [X.Over (Spec (.of k))] (δ : DimensionFunction X) (n : ℕ) (M : X.Modules) : (eulerCharacteristic k X M : ℚ) = rrTopNumber δ n M := by sorry

def finiteSectionMap {X : Scheme.{u}} (M : X.Modules) {n : ℕ} (s : Fin n → (unitModule X ⟶ M)) : freeModule X n ⟶ M := by sorry

/- SchemeAndStackFoundations:SF.5/global-generation
A finite-type quasi-coherent module M on a quasi-compact scheme is globally generated when finitely many sections give a surjective evaluation O_X^n→M. This finite definition agrees in this scope with generation by an arbitrary family: stalkwise finite generation and quasi-compactness yield a finite subfamily. Tensor products and pullbacks of generated modules are generated. For a line, this is the basepoint-free condition.
Omitted hypotheses: The finite-type/quasi-compact hypotheses for equivalence with arbitrary-family generation are omitted. The concrete finite evaluation body is valid as a predicate on all native modules; it does not identify a large module with its finite generation. -/

def IsGloballyGenerated {X : Scheme.{u}} (M : X.Modules) : Prop := ∃ (n : ℕ) (s : Fin n → (unitModule X ⟶ M)), Epi (finiteSectionMap M s)

/-- The unit module is generated by its unit section. -/
lemma IsGloballyGenerated.trivial (X : Scheme.{u}) : IsGloballyGenerated (unitModule X) := by sorry
/-- Generated line bundles have generated tensor product. -/
lemma IsGloballyGenerated.tensor {X : Scheme.{u}} (L M : Line X) (hL : IsGloballyGenerated L.obj) (hM : IsGloballyGenerated M.obj) : IsGloballyGenerated (lineTensor L M).obj := by sorry
/-- Pullback of a globally generated line is globally generated. -/
lemma IsGloballyGenerated.pullback {X Y : Scheme.{u}} (f : Y ⟶ X) (L : Line X) (h : IsGloballyGenerated L.obj) : IsGloballyGenerated (linePullback f L).obj := by sorry
-- Unit test TauCeti.AlgebraicGeometry.Intersection.globalGeneration_test_zero: The zero module is generated by the empty family.
example {X : Scheme.{u}} : IsGloballyGenerated (0 : X.Modules) := by sorry
-- Unit test TauCeti.AlgebraicGeometry.Intersection.globalGeneration_test_p1_o1: The two coordinate sections generate O(1) on P¹.
example : IsGloballyGenerated p1O1.obj := by sorry
-- Unit test TauCeti.AlgebraicGeometry.Intersection.globalGeneration_test_p1_negative: O(−1) on P¹ has no nonzero section and is not globally generated.
example : ¬ IsGloballyGenerated (lineDual p1O1).obj := by sorry


/- SchemeAndStackFoundations:SF.5/projective-positivity
An invertible sheaf L is semiample if L^m is globally generated for some integer m>0. Positive powers, arbitrary pullbacks and tensor products of semiample lines are semiample. The trivial line is semiample even on a positive-dimensional projective scheme where it is not ample.
Omitted hypotheses: The tensor-power helper is the exact imported SF.3/Jacobian operation. Projectivity is needed for the numerical comparisons, not for the displayed power-of-generated predicate. -/

def IsSemiample {X : Scheme.{u}} (L : Line X) : Prop := ∃ m : ℕ, 0 < m ∧ IsGloballyGenerated (linePower L m).obj

/-- Every positive tensor power of a semiample line is semiample. -/
lemma IsSemiample.power {X : Scheme.{u}} (L : Line X) (h : IsSemiample L) (m : ℕ) (hm : 0 < m) : IsSemiample (linePower L m) := by sorry
/-- The trivial line is semiample. -/
lemma IsSemiample.trivial (X : Scheme.{u}) : IsSemiample (InvertibleSheaf.trivial X) := by sorry
/-- A generated line is semiample using exponent one. -/
lemma IsGloballyGenerated.semiample {X : Scheme.{u}} (L : Line X) (h : IsGloballyGenerated L.obj) : IsSemiample L := by sorry
-- Unit test TauCeti.AlgebraicGeometry.Intersection.semiample_test_p1_o1: O(1) on P¹ is semiample.
example : IsSemiample p1O1 := by sorry
-- Unit test TauCeti.AlgebraicGeometry.Intersection.semiample_test_p1_trivial: The trivial line is semiample on P¹.
example : IsSemiample (InvertibleSheaf.trivial p1) := by sorry
-- Unit test TauCeti.AlgebraicGeometry.Intersection.semiample_test_p1_negative: No positive power of O(−1) on P¹ is generated.
example : ¬ IsSemiample (lineDual p1O1) := by sorry
def projectiveSpace (k : Type u) [Field k] (n : ℕ) : Scheme.{u} := by sorry
instance projectiveSpace_over (k : Type u) [Field k] (n : ℕ) : (projectiveSpace k n).Over (Spec (.of k)) := by sorry
def projectiveSpaceO1 (k : Type u) [Field k] (n : ℕ) : Line (projectiveSpace k n) := by sorry

/- SchemeAndStackFoundations:SF.5/very-ample
On a projective k-scheme, L is very ample if some closed k-immersion i:X→P^n_k identifies L with i*O(1). This agrees with relative very ampleness over k: finite type gives a finite projective space and properness makes the immersion closed. The quotient O(1) convention is retained. Positive powers and restriction to closed subschemes are very ample.
Omitted hypotheses: Projectivity/finite type are omitted from ambient parameters; the closed restriction API also omits i.IsOver. The body explicitly includes an over-k closed immersion, so no arbitrary morphism is called a projective embedding. -/

def IsVeryAmple {k : Type u} [Field k] (X : Scheme.{u}) [X.Over (Spec (.of k))] (L : Line X) : Prop := ∃ (n : ℕ) (i : X ⟶ projectiveSpace k n), IsClosedImmersion i ∧ i.IsOver (Spec (.of k)) ∧ Nonempty (L ≅ linePullback i (projectiveSpaceO1 k n))

/-- A very ample line is generated by the pulled-back projective coordinates. -/
lemma IsVeryAmple.generated {k : Type u} [Field k] (X : Scheme.{u}) [X.Over (Spec (.of k))] (L : Line X) (h : IsVeryAmple (k := k) X L) : IsGloballyGenerated L.obj := by sorry
/-- A positive tensor power of a very ample line is very ample by Veronese. -/
lemma IsVeryAmple.power {k : Type u} [Field k] (X : Scheme.{u}) [X.Over (Spec (.of k))] (L : Line X) (h : IsVeryAmple (k := k) X L) (m : ℕ) (hm : 0 < m) : IsVeryAmple (k := k) X (linePower L m) := by sorry
/-- Closed restriction preserves very ampleness. -/
lemma IsVeryAmple.closed_restriction {k : Type u} [Field k] (X Y : Scheme.{u}) [X.Over (Spec (.of k))] [Y.Over (Spec (.of k))] (i : Y ⟶ X) [IsClosedImmersion i] (L : Line X) (h : IsVeryAmple (k := k) X L) : IsVeryAmple (k := k) Y (linePullback i L) := by sorry
-- Unit test TauCeti.AlgebraicGeometry.Intersection.veryAmple_test_p1_o1: O(1) on P¹ is very ample.
example : IsVeryAmple (k := ℚ) p1 p1O1 := by sorry
-- Unit test TauCeti.AlgebraicGeometry.Intersection.veryAmple_test_p2_o1: O(1) on P² gives the identity projective embedding.
example : IsVeryAmple (k := ℚ) p2 p2O1 := by sorry
-- Unit test TauCeti.AlgebraicGeometry.Intersection.veryAmple_test_p1_trivial: The constant map given by the trivial line cannot embed P¹.
example : ¬ IsVeryAmple (k := ℚ) p1 (InvertibleSheaf.trivial p1) := by sorry


/- SchemeAndStackFoundations:SF.5/ample
On a projective k-scheme, L is ample if a positive power is very ample. This agrees with the general ample-section definition by the finite-type embedding criterion. Every sufficiently large power is very ample and globally generated. Ample restriction to a closed subscheme is ample; ample lines are semiample and numerically nef.
Omitted hypotheses: Projectivity/finite type are ambient source hypotheses; the restriction API omits i.IsOver. The power-of-embedding predicate is intentionally the absolute projective-field form, not general relative ampleness over an arbitrary noncompact base. -/

def IsAmple {k : Type u} [Field k] (X : Scheme.{u}) [X.Over (Spec (.of k))] (L : Line X) : Prop := ∃ m : ℕ, 0 < m ∧ IsVeryAmple (k := k) X (linePower L m)

/-- Ample implies semiample. -/
lemma IsAmple.semiample {k : Type u} [Field k] (X : Scheme.{u}) [X.Over (Spec (.of k))] (L : Line X) (h : IsAmple (k := k) X L) : IsSemiample L := by sorry
/-- For m>0, L^m is ample exactly when L is. -/
lemma IsAmple.power {k : Type u} [Field k] (X : Scheme.{u}) [X.Over (Spec (.of k))] (L : Line X) (m : ℕ) (hm : 0 < m) : IsAmple (k := k) X (linePower L m) ↔ IsAmple (k := k) X L := by sorry
/-- Restriction of an ample line to a closed subscheme is ample. -/
lemma IsAmple.closed_restriction {k : Type u} [Field k] (X Y : Scheme.{u}) [X.Over (Spec (.of k))] [Y.Over (Spec (.of k))] (i : Y ⟶ X) [IsClosedImmersion i] (L : Line X) (h : IsAmple (k := k) X L) : IsAmple (k := k) Y (linePullback i L) := by sorry
-- Unit test TauCeti.AlgebraicGeometry.Intersection.ample_test_p1_o1: O(1) on P¹ is ample.
example : IsAmple (k := ℚ) p1 p1O1 := by sorry
-- Unit test TauCeti.AlgebraicGeometry.Intersection.ample_test_p1_trivial: The trivial line on P¹ is not ample despite being semiample.
example : ¬ IsAmple (k := ℚ) p1 (InvertibleSheaf.trivial p1) := by sorry
-- Unit test TauCeti.AlgebraicGeometry.Intersection.ample_test_p1_negative: O(−1) on P¹ is not ample.
example : ¬ IsAmple (k := ℚ) p1 (lineDual p1O1) := by sorry


/- SchemeAndStackFoundations:SF.5/surface-pairing
On a smooth projective integral surface over an algebraically closed field, Cartier divisors or their Picard line classes have the integer symmetric bilinear pairing (D,E)=deg(c₁(O(D))c₁(O(E))∩[S]). Properly meeting effective divisors use the sum of local intersection lengths. The pairing is invariant under linear equivalence; a general self-intersection uses the normal-line rule rather than an improper local length.
Omitted hypotheses: Smooth projective integral surface, algebraically closed ground field and its dimension grading are omitted. On these regular schemes native Weil divisors are Cartier; divisorToLine is the imported Jacobian Layer A comparison. -/

def surfacePair {S : Scheme.{u}} (δ : DimensionFunction S) (D E : SchemeWeilDivisor S) : ℤ := by sorry

/-- The surface pairing is symmetric. -/
lemma surfacePair_comm {S : Scheme.{u}} (δ : DimensionFunction S) (D E : SchemeWeilDivisor S) : surfacePair δ D E = surfacePair δ E D := by sorry
/-- The pairing is additive in either divisor. -/
lemma surfacePair_add {S : Scheme.{u}} (δ : DimensionFunction S) (D E F : SchemeWeilDivisor S) : surfacePair δ (D+E) F = surfacePair δ D F + surfacePair δ E F := by sorry
/-- The native Weil divisor line comparison identifies this pairing with the two first Chern cap degree. -/
lemma surfacePair_chern {k : Type u} [Field k] (S : Scheme.{u}) [S.Over (Spec (.of k))] (δ : DimensionFunction S) (D E : SchemeWeilDivisor S) : surfacePair δ D E = degree (k := k) S δ (firstChern δ (divisorToLine E) 1 (firstChern δ (divisorToLine D) 2 (wholeClass S δ 2))) := by sorry
-- Unit test TauCeti.AlgebraicGeometry.Intersection.surfacePair_test_plane_line: A line in P² has square 1.
example : surfacePair p2Dimension p2LineDivisor p2LineDivisor = 1 := by sorry
-- Unit test TauCeti.AlgebraicGeometry.Intersection.surfacePair_test_rulings: Two distinct ruling classes of P¹×P¹ pair to 1 while one ruling has square 0.
example : surfacePair p1ProductDimension productRulingOne productRulingTwo = 1 ∧ surfacePair p1ProductDimension productRulingOne productRulingOne = 0 := by sorry
-- Unit test TauCeti.AlgebraicGeometry.Intersection.surfacePair_test_zero: The zero divisor pairs to zero.
example {S : Scheme.{u}} (δ : DimensionFunction S) (D : SchemeWeilDivisor S) : surfacePair δ 0 D = 0 := by sorry


/- SchemeAndStackFoundations:SF.5/surface-adjunction
For a smooth curve C embedded as an effective divisor in a smooth projective surface S, ω_C≅(ω_S⊗O_S(C))|C, so 2g(C)−2=C·(C+K_S). In particular a smooth degree-d plane curve has genus (d−1)(d−2)/2, and the diagonal in C×C has square 2−2g(C).
Omitted hypotheses: Smooth proper surface/curve, Cartier condition and the ground field are omitted. -/

theorem surface_adjunction {S C : Scheme.{u}} (i : C ⟶ S) [IsClosedImmersion i] : Nonempty (canonicalLine C ≅ linePullback i (lineTensor (canonicalLine S) (divisorLine i))) := by sorry



/- SchemeAndStackFoundations:SF.5/surface-bertini
Over an algebraically closed field, sufficiently high ample twists of any divisor on a smooth projective surface admit smooth effective representatives. Consequently every divisor class is a difference of smooth effective divisors. The tangent-incidence proof is valid in this very ample setting in every characteristic; it does not assert smooth members of arbitrary positive-characteristic base-point-free systems.
Omitted hypotheses: Smooth projective surface, algebraically closed ground field, and smooth effective representatives E,F are omitted. The signature retains native linear equivalence D∼E−F, rather than equality of Weil divisors. -/

theorem surface_smooth_difference {S : Scheme.{u}} [IsIntegral S] [IsNoetherian S] (D : SchemeWeilDivisor S) : ∃ E F : SchemeWeilDivisor S, (WeilDivisor.OrderSystem.ofScheme S).LinearlyEquivalent D (E-F) := by sorry



/- SchemeAndStackFoundations:SF.5/surface-weak-rr
For a divisor D on a smooth projective surface, χ(O(D))−χ(O_S)=D·(D−K_S)/2. Prove this directly from the exact restriction sequence for smooth effective divisors and curve Riemann–Roch, then write a divisor class as the difference of such divisors. This route supplies the surface formula independently of the stronger GRR theorem.
Omitted hypotheses: Surface, field, coherence and canonical-divisor identification of K are omitted. -/

theorem surface_euler_rr {k : Type u} [Field k] (S : Scheme.{u}) [S.Over (Spec (.of k))] (δ : DimensionFunction S) (D K : SchemeWeilDivisor S) : 2 * (eulerCharacteristic k S (divisorToLine D).obj - eulerCharacteristic k S (unitModule S)) = surfacePair δ D (D-K) := by sorry



/- SchemeAndStackFoundations:SF.5/surface-rr
For a divisor D on a smooth projective surface, h⁰(D)−h¹(D)+h⁰(K_S−D)=χ(O_S)+D·(D−K_S)/2. The equality h²(D)=h⁰(K_S−D) is the imported SF.2 Serre duality theorem, not a newly planned duality theory.
Omitted hypotheses: The smooth projective surface, base field and canonical identity of K are omitted; the h⁰/h¹ helpers denote native coherent-cohomology dimensions under finite-dimensionality certificates. -/

theorem surface_riemann_roch {k : Type u} [Field k] (S : Scheme.{u}) [S.Over (Spec (.of k))] (δ : DimensionFunction S) (D K : SchemeWeilDivisor S) : 2 * (surfaceH0 k S D - surfaceH1 k S D + surfaceH0 k S (K-D) - eulerCharacteristic k S (unitModule S)) = surfacePair δ D (D-K) := by sorry



/- SchemeAndStackFoundations:SF.5/hodge-index
For a smooth projective integral surface over an algebraically closed field, an ample divisor H and any divisor D with D·H=0 satisfy D²≤0. On divisors modulo the radical of numerical equivalence the real intersection form has one positive direction and all other directions negative. The inequality is one-way: D²≤0 does not imply D·H=0.
Omitted hypotheses: Smooth projective integral surface and algebraic closedness of the ground field are omitted. The field, ampleness of H and ample orthogonality are explicit. The full numerical-radical quotient signature has its own recorded SF.5 gap; numerical and algebraic equivalence are not identified. -/

theorem hodge_index {k : Type u} [Field k] (S : Scheme.{u}) [S.Over (Spec (.of k))] (δ : DimensionFunction S) (D H : SchemeWeilDivisor S) (hH : IsAmple (k := k) S (divisorToLine H)) (h : surfacePair δ D H = 0) : surfacePair δ D D ≤ 0 := by sorry



/- SchemeAndStackFoundations:SF.5/hodge-cauchy
If D·H=E·H=0 for ample H, then (D·E)²≤D²E². Both squares on the right are nonpositive. This includes zero-square classes and follows from the nonpositive quadratic form on span(D,E), without assuming either class has strictly negative square.
Omitted hypotheses: Smooth projective integral surface and algebraic closedness are omitted. The field, ampleness and both orthogonality hypotheses are explicit. -/

theorem hodge_cauchy {k : Type u} [Field k] (S : Scheme.{u}) [S.Over (Spec (.of k))] (δ : DimensionFunction S) (D E H : SchemeWeilDivisor S) (hH : IsAmple (k := k) S (divisorToLine H)) (hD : surfacePair δ D H = 0) (hE : surfacePair δ E H = 0) : (surfacePair δ D E)^2 ≤ surfacePair δ D D * surfacePair δ E E := by sorry

def graphSelfNumber {C D : Scheme.{u}} (φ : C ⟶ D) : ℤ := by sorry

/- SchemeAndStackFoundations:SF.5/curve-product-graphs
For smooth projective geometrically connected C,D over an algebraically closed field and a finite morphism φ:C→D of degree e, the graph Γ has normal line φ*T_D and square e(2−2g(D)); inseparability causes no exception. For C×C with A={P}×C, B=C×{P}, one has A²=B²=0, A·B=1, Δ·A=Δ·B=1, Δ²=2−2g. Moreover Γ·A=1 and Γ·B=e for Γ=(x,φ(x)).
Omitted hypotheses: The actual smooth curve graph/degree/genus data are omitted from this numerical signature; graphSelfNumber denotes their independently constructed surface intersection number. -/

theorem graph_normal_degree {C D : Scheme.{u}} (φ : C ⟶ D) (e g : ℕ) : graphSelfNumber φ = (e : ℤ) * (2-2*(g : ℤ)) := by sorry

def frobeniusDiagonalNumber (C : Scheme.{u}) (q r : ℕ) : ℤ := by sorry
def curveExtensionPointCount (C : Scheme.{u}) (q r : ℕ) : ℤ := by sorry

/- SchemeAndStackFoundations:SF.5/frobenius-fixed-points
For a smooth projective geometrically connected curve C/F_q and every r≥1, work over an algebraic closure and let Γ_r be the graph of q^r-power Frobenius. Its intersection with Δ consists of C(F_(q^r)), with every local intersection multiplicity 1 because 1−dF^r=1. Thus Δ·Γ_r=N_r; Γ_r²=(2−2g)q^r, Γ_r·A=1 and Γ_r·B=q^r. The field-degree/base-change bookkeeping is imported from the curve lane.
Omitted hypotheses: Finite field, curve, genus and actual Frobenius/extension data are omitted from the numerical helpers; their exact geometric meaning is stated in the packet. -/

theorem frobenius_diagonal_count (C : Scheme.{u}) (q r : ℕ) (hr : 1 ≤ r) : frobeniusDiagonalNumber C q r = curveExtensionPointCount C q r := by sorry



/- SchemeAndStackFoundations:SF.5/weil-bound
For C/F_q smooth projective geometrically connected of genus g, for every r≥1 one has |#C(F_(q^r))−q^r−1|≤2g√(q^r). Set D=Δ−A−B and E_r=Γ_r−q^r A−B. Both are orthogonal to ample A+B; D²=−2g, E_r²=−2gq^r and D·E_r=N_r−q^r−1. Apply Hodge Cauchy and take a nonnegative square root. The zeta function/eigenvalue deduction remains the WeilConjectures consumer, not a theorem imported to prove this bound.
Omitted hypotheses: The curve and finite-field data are omitted from this numerical suggested form. The statement uses every r≥1; q and g stand for the field size and genus of that fixed curve. -/

theorem weil_bound_all_extensions (C : Scheme.{u}) (q g : ℕ) : ∀ r : ℕ, 1 ≤ r → |(curveExtensionPointCount C q r : ℝ) - (q^r : ℕ) - 1| ≤ 2*g*Real.sqrt (q^r : ℕ) := by sorry



/- SchemeAndStackFoundations:SF.5/stack-chow
For a finite-type Artin stack over a field, use Kresch’s cycle group A_d obtained from projective modifications and vector-bundle approximations, modulo the specified relations. For schemes and algebraic spaces it is the naive integral cycle quotient. For DM stacks its comparison with naive cycles is an isomorphism after tensoring with ℚ, not in general over ℤ. Negative homological grades may contain torsion. The stack carrier, descent and quotient presentations belong to SF.1, below this stage.
Omitted hypotheses: The pseudofunctor is the native bicategorical carrier. Stack descent, groupoid-valuedness, finite type and DM predicates are omitted; they are exact SF.1 requests, not unconstrained Prop fields. schemeAsStack, stackAffineBundle, naive cycles and Bμ_n are supplier/fixture prototypes. The Bμ_n fixture is over ℚ, so n>0 is invertible. -/

abbrev StackPresentation := Pseudofunctor (LocallyDiscrete Scheme.{u}ᵒᵖ) Cat.{u,u+1}
def stackChow (F : StackPresentation.{u}) (d : ℤ) : Type (u+2) := by sorry
instance stackChow_add (F : StackPresentation.{u}) (d : ℤ) : AddCommGroup (stackChow F d) := by sorry

-- Exact SF.1 supplier forms, on the native pseudofunctor carrier; all descent/DM conditions are omitted.
def schemeAsStack (X : Scheme.{u}) : StackPresentation.{u} := by sorry
def stackAffineBundle (F : StackPresentation.{u}) (r : ℕ) : StackPresentation.{u} := by sorry
def naiveStackChowQ (F : StackPresentation.{u}) (d : ℤ) : Type (u+2) := by sorry
instance naiveStackChowQ_add (F : StackPresentation.{u}) (d : ℤ) : AddCommGroup (naiveStackChowQ F d) := by sorry
def bmuStack (n : ℕ) : StackPresentation.{0} := by sorry
def bgmStack : StackPresentation.{0} := by sorry

/-- For a finite-type scheme viewed as a stack, Kresch homology is its integral Chow group. -/
def stackChow_scheme (X : Scheme.{u}) (δ : DimensionFunction X) (d : ℤ) : stackChow (schemeAsStack X) d ≃+ Chow X δ d := by sorry
/-- For a DM stack, rational extension agrees with naive cycle homology. -/
def stackChow_dm_rational (F : StackPresentation.{u}) (d : ℤ) : (ℚ ⊗[ℤ] stackChow F d) ≃+ naiveStackChowQ F d := by sorry
/-- Pullback along a trivial rank-r vector bundle gives A_d(F)≅A_(d+r)(F×A^r); the full vector-bundle formula is required. -/
def stackChow_trivial_vector (F : StackPresentation.{u}) (r : ℕ) (d : ℤ) : stackChow F d ≃+ stackChow (stackAffineBundle F r) (d+r) := by sorry
-- Unit test TauCeti.AlgebraicGeometry.Intersection.stackChow_test_point: The scheme point has A₀=ℤ.
example : Nonempty (stackChow (schemeAsStack (Spec (.of ℚ))) 0 ≃+ ℤ) := by sorry
-- Unit test TauCeti.AlgebraicGeometry.Intersection.stackChow_test_bmu2: Bμ₂ over ℚ has A_−1≅ℤ/2; naive negative-dimensional cycles would give zero.
example : Nonempty (stackChow (bmuStack 2) (-1) ≃+ ZMod 2) := by sorry
-- Unit test TauCeti.AlgebraicGeometry.Intersection.stackChow_test_bmu2_rational: That negative-degree torsion dies after rational extension.
example (a : ℚ ⊗[ℤ] stackChow (bmuStack 2) (-1)) : a = 0 := by sorry


/- SchemeAndStackFoundations:SF.5/mixed-quotients
For a g-dimensional linear algebraic group G acting on a finite-type space X, choose an l-dimensional representation V and invariant free open U with codim(V−U)>dim X−i. Define A_i^G(X)=CH_(i+l−g)((X×U)/G). This is independent of such a sufficiently good pair and functorial for equivariant proper/flat maps. For the quotient stack F=[X/G], A_d(F)=A_(d+g)^G(X); this homological shift is essential.
Omitted hypotheses: Group structure, action, base field, good-pair freeness/codimension and dimensions l,g are omitted. The trivial-group test also places X over ℚ. Mixed quotients and quotient stacks are the specified SF.1 constructions. The Bμ_n ring calculation follows from G_m approximation and localization for the weight-n line; no rational-only comparison is used for its integral torsion. -/

def equivariantChow (X G : Scheme.{u}) (i : ℤ) : Type (u+2) := by sorry
instance equivariantChow_add (X G : Scheme.{u}) (i : ℤ) : AddCommGroup (equivariantChow X G i) := by sorry
def mixedQuotient (X G U : Scheme.{u}) : Scheme.{u} := by sorry
def quotientStack (X G : Scheme.{u}) : StackPresentation.{u} := by sorry
/-- A good pair gives the prescribed shifted Chow group of its mixed quotient. -/
def equivariantChow_mixed (X G V U : Scheme.{u}) (δ : DimensionFunction (mixedQuotient X G U)) (i : ℤ) (l g : ℕ) : equivariantChow X G i ≃+ Chow (mixedQuotient X G U) δ (i+l-g) := by sorry
/-- Quotient-stack homology is the equivariant theory shifted by +dim G. -/
def equivariantChow_presentation (X G : Scheme.{u}) (d : ℤ) (g : ℕ) : stackChow (quotientStack X G) d ≃+ equivariantChow X G (d+g) := by sorry
/-- Two good-pair mixed quotients yield canonically isomorphic groups in the same equivariant grade. -/
def equivariantChow_independent (X G U U' : Scheme.{u}) (δ : DimensionFunction (mixedQuotient X G U)) (ε : DimensionFunction (mixedQuotient X G U')) (i : ℤ) (l l' g : ℕ) : Chow (mixedQuotient X G U) δ (i+l-g) ≃+ Chow (mixedQuotient X G U') ε (i+l'-g) := by sorry
-- Unit test TauCeti.AlgebraicGeometry.Intersection.equivariantChow_test_trivial_group: For the trivial group the equivariant theory is ordinary Chow.
example (X : Scheme) (δ : DimensionFunction X) (d : ℤ) : Nonempty (equivariantChow X (Spec (.of ℚ)) d ≃+ Chow X δ d) := by sorry
-- Unit test TauCeti.AlgebraicGeometry.Intersection.equivariantChow_test_bg_m: CH*(BG_m)=ℤ[t] with t the universal first Chern class.
example : Nonempty (stackChow bgmStack (-1) ≃+ ℤ) := by sorry
-- Unit test TauCeti.AlgebraicGeometry.Intersection.equivariantChow_test_bmu_n: CH*(Bμ_n)=ℤ[t]/(nt) over ℚ for n≥1, so A_−1=ℤ/n.
example (n : ℕ) (hn : 1 ≤ n) : Nonempty (stackChow (bmuStack n) (-1) ≃+ ZMod n) := by sorry


/- SchemeAndStackFoundations:SF.5/dm-gysin-ring
For finite-type DM stacks over a field, regular local immersions of constant codimension have integral refined Gysin maps, compatible with flat pullback and projective representable pushforward. Smooth DM stacks have an integral intersection ring via their regular local diagonal. For the more general lci construction in the read source, impose stratification by global quotient stacks; DM stacks satisfy this condition by Proposition 4.5.5(iii). The source does not give unrestricted integral pushforward for a nonrepresentable proper map.
Omitted hypotheses: Finite type, DM, smoothness and pure dimension n are omitted. The precise local-Gysin/composition construction invokes unread references in Kresch and is recorded as a proof gap; scheme diagonal Gysin is not treated as sufficient by itself. -/

theorem smooth_dm_intersection_ring (F : StackPresentation.{u}) (n : ℤ) : Nonempty (CommRing (⨁ j : ℤ, stackChow F (n-j))) := by sorry



/- SchemeAndStackFoundations:SF.5/dm-rational-degree
A proper finite-type DM stack over a field has degree A₀(F;ℚ)→ℚ compatible with rational proper push. Over an algebraically closed field the fundamental point of a residual gerbe with finite stabilizer G has degree 1/|G|. For Bμ_n with n invertible, the finite atlas has degree n and normalizes deg[Bμ_n]=1/n. This construction requires the Vistoli rational push comparison cited by Kresch; integral Kresch projective push alone cannot supply a general nonrepresentable degree.
Omitted hypotheses: Proper finite-type DM conditions are omitted; the scheme test works over ℚ. Bμ_n is over ℚ. The rational proper push proof is a named gap, not silently inferred from integral projective representable push. -/

def stackDegree (F : StackPresentation.{u}) : (ℚ ⊗[ℤ] stackChow F 0) →+ ℚ := by sorry
def schemeStackRationalClass (X : Scheme.{u}) (δ : DimensionFunction X) (a : Chow X δ 0) : ℚ ⊗[ℤ] stackChow (schemeAsStack X) 0 := by sorry
def schemeDegreeOverQ (X : Scheme) (δ : DimensionFunction X) (a : Chow X δ 0) : ℤ := by sorry
def bmuFundamentalQ (n : ℕ) : ℚ ⊗[ℤ] stackChow (bmuStack n) 0 := by sorry
/-- On a proper scheme stack this is rational extension of the scheme degree. -/
lemma stackDegree_scheme (X : Scheme) (δ : DimensionFunction X) (a : Chow X δ 0) : stackDegree (schemeAsStack X) (schemeStackRationalClass X δ a) = (schemeDegreeOverQ X δ a : ℚ) := by sorry
/-- A finite stabilizer gerbe has reciprocal stabilizer order degree. -/
lemma stackDegree_gerbe (n : ℕ) (hn : 1 ≤ n) : stackDegree (bmuStack n) (bmuFundamentalQ n) = 1/(n : ℚ) := by sorry
/-- Rational integration is additive. -/
lemma stackDegree_add (F : StackPresentation.{u}) (a b : ℚ ⊗[ℤ] stackChow F 0) : stackDegree F (a+b) = stackDegree F a + stackDegree F b := by sorry
-- Unit test TauCeti.AlgebraicGeometry.Intersection.stackDegree_test_point: The trivial-stabilizer point has degree 1.
example : stackDegree (bmuStack 1) (bmuFundamentalQ 1) = 1 := by sorry
-- Unit test TauCeti.AlgebraicGeometry.Intersection.stackDegree_test_bmu2: Bμ₂ has degree 1/2, which is not an integer degree.
example : stackDegree (bmuStack 2) (bmuFundamentalQ 2) = (1/2 : ℚ) := by sorry
-- Unit test TauCeti.AlgebraicGeometry.Intersection.stackDegree_test_bmu3: Bμ₃ has degree 1/3.
example : stackDegree (bmuStack 3) (bmuFundamentalQ 3) = (1/3 : ℚ) := by sorry
-- The section counts and top degrees use native coherent cohomology on reduced component schemes.
def lineCurveDegree {X C : Scheme.{u}} (L : Line X) (i : C ⟶ X) : ℤ := by sorry
def componentDimension (X : Scheme.{u}) (Z : Set X) : ℕ := by sorry
def componentSectionCount {X : Scheme.{u}} (L : Line X) (Z : Set X) (m : ℕ) : ℝ := by sorry
def componentTopIntersection {X : Scheme.{u}} (L : Line X) (Z : Set X) : ℤ := by sorry

/- SchemeAndStackFoundations:SF.5/nef-big
A line L on a projective k-scheme is nef if its degree on every integral closed curve is nonnegative. Tensoring nef lines and taking positive powers preserve nefness; for a positive power the condition is equivalent. An ample line is nef. This numerical condition alone does not imply global generation or semiampleness.
Omitted hypotheses: Projectivity and the ground field are omitted from ambient parameters. The curve-degree helper denotes the actual restricted first-Chern degree, not a chosen numerical function; integral curves are native schemes with closed immersions. -/

def IsNef {X : Scheme.{u}} (L : Line X) : Prop := ∀ (C : Scheme.{u}) (i : C ⟶ X), IsClosedImmersion i → IsIntegral C → topologicalKrullDim C = 1 → lineCurveDegree L i ≥ 0

/-- An ample line is nef. -/
lemma IsAmple.nef {k : Type u} [Field k] (X : Scheme.{u}) [X.Over (Spec (.of k))] (L : Line X) (h : IsAmple (k := k) X L) : IsNef L := by sorry
/-- For m>0, L^m is nef exactly when L is. -/
lemma IsNef.power {X : Scheme.{u}} (L : Line X) (m : ℕ) (hm : 0 < m) : IsNef (linePower L m) ↔ IsNef L := by sorry
/-- The tensor product of nef lines is nef. -/
lemma IsNef.tensor {X : Scheme.{u}} (L M : Line X) (hL : IsNef L) (hM : IsNef M) : IsNef (lineTensor L M) := by sorry
-- Unit test TauCeti.AlgebraicGeometry.Intersection.nef_test_p1_o1: O(1) on P¹ is nef.
example : IsNef p1O1 := by sorry
-- Unit test TauCeti.AlgebraicGeometry.Intersection.nef_test_p1_trivial: The trivial line is nef with all curve degrees zero.
example : IsNef (InvertibleSheaf.trivial p1) := by sorry
-- Unit test TauCeti.AlgebraicGeometry.Intersection.nef_test_p1_negative: O(−1) has negative degree on P¹ itself and is not nef.
example : ¬ IsNef (lineDual p1O1) := by sorry


/- SchemeAndStackFoundations:SF.5/big-line
On a reduced projective scheme, L is big if each irreducible component Z of dimension d has h⁰(Z,L^m|Z)≥c m^d for some c>0 and all sufficiently large m. This componentwise convention excludes a bundle whose sections grow maximally on only one component. Positive powers preserve bigness and detect it; ample lines are big. The section-growth definition does not require nefness.
Omitted hypotheses: Projectivity, reducedness and ground field are omitted. componentSectionCount is the native h⁰ finrank on the reduced component after restricting the actual line power. Its cohomology finiteness comes from SF.2; asymptotic comparison and Kodaira inputs remain a named gap. -/

def IsBig {X : Scheme.{u}} (L : Line X) : Prop := ∀ Z ∈ irreducibleComponents X, ∃ c : ℝ, 0 < c ∧ ∃ N : ℕ, ∀ m : ℕ, N ≤ m → c*(m : ℝ)^(componentDimension X Z) ≤ componentSectionCount L Z m

/-- For m>0, L^m is big exactly when L is. -/
lemma IsBig.power {X : Scheme.{u}} (L : Line X) (m : ℕ) (hm : 0 < m) : IsBig (linePower L m) ↔ IsBig L := by sorry
/-- An ample line is big in the componentwise reduced projective scope. -/
lemma IsAmple.big {k : Type u} [Field k] (X : Scheme.{u}) [X.Over (Spec (.of k))] (L : Line X) (h : IsAmple (k := k) X L) : IsBig L := by sorry
/-- Tensoring a big line by a generated line preserves bigness. -/
lemma IsBig.tensor_generated {X : Scheme.{u}} (L M : Line X) (hL : IsBig L) (hM : IsGloballyGenerated M.obj) : IsBig (lineTensor L M) := by sorry
-- Unit test TauCeti.AlgebraicGeometry.Intersection.big_test_p1_o1: O(1) has m+1 sections on P¹ and is big.
example : IsBig p1O1 := by sorry
-- Unit test TauCeti.AlgebraicGeometry.Intersection.big_test_p1_trivial: The trivial line on P¹ has constant section dimension and is not big.
example : ¬ IsBig (InvertibleSheaf.trivial p1) := by sorry
-- Unit test TauCeti.AlgebraicGeometry.Intersection.big_test_p1_negative: Positive powers of O(−1) on P¹ have no sections and are not big.
example : ¬ IsBig (lineDual p1O1) := by sorry


/- SchemeAndStackFoundations:SF.5/nef-big-numerical
For a nef line on a reduced projective scheme over a field, componentwise bigness is equivalent to strictly positive top self-intersection on every irreducible component. On a positive-dimensional component zero top intersection makes that component exceptional; bigness on another component cannot remove it.
Omitted hypotheses: Reduced projectivity and finite type are omitted. This theorem supplies the numerical equivalence used to identify exceptional components; the section-growth and numerical predicates are not made equal by definition. -/

lemma IsBig.nef_numeric {X : Scheme.{u}} (L : Line X) (h : IsNef L) : IsBig L ↔ ∀ Z ∈ irreducibleComponents X, 0 < componentTopIntersection L Z := by sorry

def lineTopNumber {X Z : Scheme.{u}} (L : Line X) (i : Z ⟶ X) : ℤ := by sorry

/- SchemeAndStackFoundations:SF.5/exceptional-locus
For nef L on a projective scheme, E(L) is the union of positive-dimensional integral closed subvarieties Z with (c₁(L)^dim Z·[Z])=0, given its reduced induced structure. This is a closed subset with finitely many irreducible components: on a big component use a power L^m=A⊗O(D) to put each exceptional Z inside D, then induct on dimension; a nonbig component belongs to E(L) itself. Zero-dimensional points are excluded.
Omitted hypotheses: Projectivity, field and nefness are omitted from the scheme constructors; they are needed for the closed-union theorem. The subset body has the exact positive-dimensional zero-top-number condition; it is not a Prop placeholder. -/

def exceptionalSet {X : Scheme.{u}} (L : Line X) : Set X := {x | ∃ (Z : Scheme.{u}) (i : Z ⟶ X), IsClosedImmersion i ∧ IsIntegral Z ∧ 0 < schemeDimension Z ∧ lineTopNumber L i = 0 ∧ x ∈ Set.range i}
def exceptionalScheme {X : Scheme.{u}} (L : Line X) : Scheme.{u} := by sorry
def exceptionalImmersion {X : Scheme.{u}} (L : Line X) : exceptionalScheme L ⟶ X := by sorry

/-- The exceptional union of a nef bundle is closed. -/
lemma exceptionalSet_closed {X : Scheme.{u}} (L : Line X) (h : IsNef L) : IsClosed (exceptionalSet L) := by sorry
/-- Taking a positive power does not change the exceptional locus. -/
lemma exceptionalSet_power {X : Scheme.{u}} (L : Line X) (m : ℕ) (hm : 0 < m) : exceptionalSet (linePower L m) = exceptionalSet L := by sorry
/-- The exceptional scheme is reduced and its immersion has exactly the exceptional union as image. -/
lemma exceptionalScheme_support {X : Scheme.{u}} (L : Line X) (h : IsNef L) : IsReduced (exceptionalScheme L) ∧ Set.range (exceptionalImmersion L) = exceptionalSet L := by sorry
-- Unit test TauCeti.AlgebraicGeometry.Intersection.exceptional_test_ample: The exceptional locus of O(1) on P¹ is empty.
example : exceptionalSet p1O1 = ∅ := by sorry
-- Unit test TauCeti.AlgebraicGeometry.Intersection.exceptional_test_trivial: The trivial line on P¹ has exceptional locus all of P¹.
example : exceptionalSet (InvertibleSheaf.trivial p1) = Set.univ := by sorry
-- Unit test TauCeti.AlgebraicGeometry.Intersection.exceptional_test_surface_fibre: For the first ruling line bundle on P¹×P¹, the fibres of the first projection fill the exceptional locus, although the other ruling degree is positive.
example : exceptionalSet productFirstRulingLine = Set.univ := by sorry


/- SchemeAndStackFoundations:SF.5/frobenius-descent
In characteristic p>0, a finite universal homeomorphism between projective schemes detects semiampleness: L is semiample exactly when its pullback is. After a sufficiently high p-power, sections of the pulled-back line bundle descend, including through nilpotent thickenings. A finite cover of degree divisible by p cannot be handled by dividing a trace.
Omitted hypotheses: Finite universal homeomorphism, projectivity and characteristic p>0 are omitted; the precise finite-algebra bound cited to Kollár by the source is recorded as an unread proof input. -/

theorem semiample_universal_homeomorphism {X Y : Scheme.{u}} (f : Y ⟶ X) (L : Line X) : IsSemiample (linePullback f L) ↔ IsSemiample L := by sorry



/- SchemeAndStackFoundations:SF.5/semiample-gluing
In the locally pushout conductor diagram of a reduced projective scheme and a proper cover normal outside a closed D, nef L is semiample if its pullback and L|D are semiample and the induced contraction on the reduced conductor intersection has geometrically connected fibres as in Keel Theorem 2.10. The Frobenius power matches sections in characteristic p>0. General positive characteristic uses the connected-fibre hypothesis; the weaker finitely-many-exceptional-fibres statement for semiampleness uses the algebraic closure of a finite field.
Omitted hypotheses: Nefness, positive characteristic, conductor pushout and connectedness are omitted. The SF.1 request names exactly the conductor pushout; the source’s Raynaud proof input remains a gap. -/

theorem semiample_conductor_gluing {X Y D : Scheme.{u}} (f : Y ⟶ X) (i : D ⟶ X) (L : Line X) (hY : IsSemiample (linePullback f L)) (hD : IsSemiample (linePullback i L)) : IsSemiample L := by sorry



/- SchemeAndStackFoundations:SF.5/ample-effective-semiample
In characteristic p>0, if a nef bundle L on a projective scheme has a power L^m=A⊗O(D), with A ample and D effective Cartier, then L is semiample exactly when L|D_red is semiample. The proof passes from formal thickenings to an algebraic-space contraction and descends a power of the line bundle; it is not just a numerical top-intersection argument.
Omitted hypotheses: Characteristic, nefness, the ample-plus-effective decomposition, and identification of D with its reduced Cartier support are omitted; the Artin contraction theorem invoked by the source is a precise recorded gap. -/

theorem ample_effective_semiample {X D : Scheme.{u}} (i : D ⟶ X) [IsClosedImmersion i] (L : Line X) : IsSemiample L ↔ IsSemiample (linePullback i L) := by sorry



/- SchemeAndStackFoundations:SF.5/keel-semiampleness
For every nef line bundle L on a projective scheme over a field of characteristic p>0, L is semiample if and only if L restricted to the reduced exceptional locus E(L) is semiample. The theorem does not assume smoothness or bigness of X or L. Reduce nilpotents by Frobenius descent, use ample-plus-effective decomposition on big components, induct on exceptional dimension and glue reducible components.
Omitted hypotheses: Projectivity and positive characteristic are omitted. The characteristic-zero counterexample below precludes silently dropping the latter. -/

theorem keel_semiample {X : Scheme.{u}} (L : Line X) (h : IsNef L) : IsSemiample L ↔ IsSemiample (linePullback (exceptionalImmersion L) L) := by sorry



/- SchemeAndStackFoundations:SF.5/finite-field-semiampleness
Over the algebraic closure of a finite field, a nef line bundle whose restriction to E(L) is numerically trivial is semiample, since numerically trivial line bundles on a projective scheme are torsion. On a projective surface, a nef bundle is semiample if it is big or numerically trivial: in the big case the exceptional locus has dimension at most one and all its curve degrees vanish. The general numerically-trivial-torsion result needs finite-type Picard boundedness, not merely the curve Picard variety.
Omitted hypotheses: Surface, projectivity and algebraic-closure-of-finite-field hypotheses are omitted. Arbitrary positive-characteristic fields do not supply the torsion conclusion. -/

theorem finite_field_nef_big_surface {X : Scheme.{u}} (L : Line X) (hn : IsNef L) (hb : IsBig L) : IsSemiample L := by sorry

def curveSelfProduct (C : Scheme.{u}) : Scheme.{u} := by sorry
def keelProductLine (C : Scheme.{u}) : Line (curveSelfProduct C) := by sorry

/- SchemeAndStackFoundations:SF.5/keel-characteristic-zero
For a smooth projective curve C of genus g≥2 in characteristic zero, on C×C take L=ω_(π₁)(Δ). It is nef and big, has square 2g−2, restricts trivially to Δ and has E(L)=Δ, yet is not semiample. The first infinitesimal neighbourhood of Δ carries a nontorsion obstruction. In characteristic p>0 the same exceptional-locus criterion makes the corresponding bundle semiample.
Omitted hypotheses: Smooth projective curve, algebraically closed characteristic-zero field and genus≥2 are omitted. keelProductLine denotes the concrete relative canonical line twisted by the diagonal on the actual scheme C×C. -/

theorem keel_characteristic_zero_counterexample (C : Scheme.{u}) : IsNef (keelProductLine C) ∧ IsBig (keelProductLine C) ∧ ¬ IsSemiample (keelProductLine C) := by sorry

end TauCeti.AlgebraicGeometry.Intersection
