import Mathlib.Algebra.Category.Ring.Limits
import Mathlib.CategoryTheory.Limits.Preserves.Shapes.Pullbacks
import Mathlib.CategoryTheory.Limits.Preserves.Finite
import Mathlib.RingTheory.Ideal.Quotient.PowTransition
import Mathlib.Algebra.TrivSqZeroExt.Basic
import Mathlib.RingTheory.TensorProduct.Basic
import Mathlib.LinearAlgebra.Quotient.Basic
import Mathlib.RingTheory.Valuation.LocalSubring
import Mathlib.FieldTheory.Minpoly.Basic
import Mathlib.Algebra.Polynomial.Splits
import Mathlib.RingTheory.Ideal.Quotient.Operations

/-!
This file is not the roadmap and is not exhaustive. The accompanying roadmap
document is definitive. These statements suggest Lean forms so contributors
and reviewers can converge on names and signatures.

The native prototypes below are affine, set-valued interfaces and the module
algebra of the boundary trace. They do not assert that the geometric criteria
have been elaborated. The omission ledger at the end records every geometric
declaration, API item and test whose supplier interfaces are unavailable.
In particular set-valued effectivity does not replace equivalence of formal
groupoids in the stack criterion. No desired geometric condition is encoded
as an opaque field. All mathematical declarations remain unchecked.
-/

noncomputable section

open CategoryTheory CategoryTheory.Limits
open scoped TensorProduct

namespace TauCeti.AlgebraicGeometry.A0Extension

universe u

variable (F : CommRingCat.{u} ⥤ Type u)

/-- The affine set-valued RS* condition, on actual square-zero ring pullbacks. -/
def StrongInfinitesimalGluing : Prop :=
  ∀ {A B C : CommRingCat.{u}} (f : A ⟶ C) (g : B ⟶ C),
    Function.Surjective g.hom → RingHom.ker g.hom ^ 2 = ⊥ →
      IsIso (pullbackComparison F f g)

theorem StrongInfinitesimalGluing.of_preservesLimits
    [PreservesFiniteLimits F] : StrongInfinitesimalGluing F := by
  sorry

theorem StrongInfinitesimalGluing.comparison_bijective
    (hF : StrongInfinitesimalGluing F)
    {A B C : CommRingCat.{u}} (f : A ⟶ C) (g : B ⟶ C)
    (hg : Function.Surjective g.hom) (hker : RingHom.ker g.hom ^ 2 = ⊥) :
    Function.Bijective (pullbackComparison F f g) := by
  sorry

theorem StrongInfinitesimalGluing.transport
    {G : CommRingCat.{u} ⥤ Type u} (e : F ≅ G)
    (hF : StrongInfinitesimalGluing F) : StrongInfinitesimalGluing G := by
  sorry

-- StrongGluingTests.forget
example : StrongInfinitesimalGluing (forget CommRingCat.{u}) := by
  sorry

-- StrongGluingTests.terminal
example : StrongInfinitesimalGluing
    ((Functor.const CommRingCat.{u}).obj (ULift.{u} PUnit)) := by
  sorry

-- StrongGluingTests.zeroKernel: identity is a permitted extension.
example {A C : CommRingCat.{u}} (f : A ⟶ C)
    (hF : StrongInfinitesimalGluing F) :
    Function.Bijective (pullbackComparison F f (𝟙 C)) := by
  sorry

variable (R : Type u) [CommRing R] (I : Ideal R)

/-- Compatible points on all positive powers of an ideal, without truncation. -/
structure FormalPoint where
  value : ∀ n : ℕ, F.obj (CommRingCat.of (R ⧸ I ^ (n + 1)))
  compatible : ∀ {m n : ℕ} (h : n ≤ m),
    F.map (CommRingCat.ofHom (Ideal.Quotient.factorPow I (Nat.add_le_add_right h 1)))
      (value m) = value n

def FormalPoint.ofPoint (x : F.obj (CommRingCat.of R)) : FormalPoint F R I where
  value n := F.map (CommRingCat.ofHom (Ideal.Quotient.mk (I ^ (n + 1)))) x
  compatible := by
    sorry

theorem FormalPoint.ext {x y : FormalPoint F R I}
    (h : ∀ n, x.value n = y.value n) : x = y := by
  sorry

theorem FormalPoint.ofPoint_value (x : F.obj (CommRingCat.of R)) (n : ℕ) :
    (FormalPoint.ofPoint F R I x).value n =
      F.map (CommRingCat.ofHom (Ideal.Quotient.mk (I ^ (n + 1)))) x := by
  sorry

theorem FormalPoint.transition (x : FormalPoint F R I) {m n : ℕ} (h : n ≤ m) :
    F.map (CommRingCat.ofHom (Ideal.Quotient.factorPow I (Nat.add_le_add_right h 1)))
      (x.value m) = x.value n := by
  sorry

-- FormalPointTests.affineLine
example (x : R) (n : ℕ) :
    (FormalPoint.ofPoint (forget CommRingCat.{u}) R I x).value n =
      Ideal.Quotient.mk (I ^ (n + 1)) x := by
  sorry

-- FormalPointTests.terminal
example : Subsingleton
    (FormalPoint ((Functor.const CommRingCat.{u}).obj (ULift.{u} PUnit)) R I) := by
  sorry

-- FormalPointTests.allOrders: agreement at every order gives equality.
example (x y : FormalPoint F R I) (h : ∀ n, x.value n = y.value n) : x = y := by
  sorry

/-- This affine effectivity predicate has an explicit restriction map. -/
def IsEffective : Prop := Function.Surjective (FormalPoint.ofPoint F R I)

theorem IsEffective.iff_lift : IsEffective F R I ↔
    ∀ ξ : FormalPoint F R I, ∃ x, FormalPoint.ofPoint F R I x = ξ := by
  sorry

def IsEffective.lift (h : IsEffective F R I) (ξ : FormalPoint F R I) :
    F.obj (CommRingCat.of R) := Classical.choose (h ξ)

theorem IsEffective.lift_spec (h : IsEffective F R I) (ξ : FormalPoint F R I) :
    FormalPoint.ofPoint F R I (IsEffective.lift F R I h ξ) = ξ := by
  sorry

-- EffectivityTests.terminal
example : IsEffective
    ((Functor.const CommRingCat.{u}).obj (ULift.{u} PUnit)) R I := by
  sorry

-- EffectivityTests.zeroIdeal
example : IsEffective F R (⊥ : Ideal R) := by
  sorry

-- EffectivityTests.topIdeal: for the affine-line functor all quotients are zero.
example : IsEffective (forget CommRingCat.{u}) R (⊤ : Ideal R) := by
  sorry

variable (k : Type u) [Field k]

/-- The fibre over x of the dual-number restriction, not all dual-number points. -/
def TangentFiber (x : F.obj (CommRingCat.of k)) :=
  { y : F.obj (CommRingCat.of (TrivSqZeroExt k k)) //
    F.map (CommRingCat.ofHom (TrivSqZeroExt.fstHom k k k).toRingHom) y = x }

def TangentFiber.zero (x : F.obj (CommRingCat.of k)) : TangentFiber F k x :=
  ⟨F.map (CommRingCat.ofHom (TrivSqZeroExt.inlHom k k)) x, by sorry⟩

theorem TangentFiber.ext (x : F.obj (CommRingCat.of k))
    {y z : TangentFiber F k x} (h : y.val = z.val) : y = z := by
  sorry

def TangentFiber.map {G : CommRingCat.{u} ⥤ Type u}
    (η : F ⟶ G) (x : F.obj (CommRingCat.of k)) :
    TangentFiber F k x → TangentFiber G k (η.app _ x) :=
  fun y => ⟨η.app _ y.val, by sorry⟩

-- TangentTests.affineLine: a single epsilon coefficient, base point fixed.
example (x : k) : Nonempty (TangentFiber (forget CommRingCat.{u}) k x ≃ k) := by
  sorry

-- TangentTests.terminal
example (x : ULift.{u} PUnit) :
    Subsingleton (TangentFiber
      ((Functor.const CommRingCat.{u}).obj (ULift.{u} PUnit)) k x) := by
  sorry

-- TangentTests.zeroRestriction
example (x : F.obj (CommRingCat.of k)) :
    F.map (CommRingCat.ofHom (TrivSqZeroExt.fstHom k k k).toRingHom)
      (TangentFiber.zero F k x).val = x := by
  sorry

variable (A B : Type u) [CommRing A] [CommRing B] [Algebra A B]
variable (IA : Ideal A) (JB : Ideal B)

/-- Linear functionals that descend modulo the indicated boundary ideals. -/
def BoundaryDualFunctional :=
  { ell : B →ₗ[A] A // ∀ b ∈ JB, ell b ∈ IA }

def BoundaryDualFunctional.reduce (ell : BoundaryDualFunctional A B IA JB) :
    (B ⧸ (JB.restrictScalars A)) →ₗ[A] (A ⧸ IA) :=
  (JB.restrictScalars A).liftQ ((Ideal.Quotient.mkₐ A IA).toLinearMap.comp ell.val)
    (by sorry)

theorem BoundaryDualFunctional.reduce_mk (ell : BoundaryDualFunctional A B IA JB) (b : B) :
    BoundaryDualFunctional.reduce A B IA JB ell ((JB.restrictScalars A).mkQ b) =
      Ideal.Quotient.mk IA (ell.val b) := by
  sorry

theorem BoundaryDualFunctional.evaluate_one (ell : BoundaryDualFunctional A B IA JB) :
    BoundaryDualFunctional.reduce A B IA JB ell ((JB.restrictScalars A).mkQ 1) =
      Ideal.Quotient.mk IA (ell.val 1) := by
  sorry

theorem BoundaryDualFunctional.ext {ell μ : BoundaryDualFunctional A B IA JB}
    (h : ell.val = μ.val) : ell = μ := by
  sorry

-- BoundaryTests.zeroFunctional
example : ∃ ell : BoundaryDualFunctional A B IA JB, ell.val = 0 := by
  sorry

-- BoundaryTests.identity
example : ∃ ell : BoundaryDualFunctional A A IA IA, ell.val = LinearMap.id := by
  sorry

-- BoundaryTests.dualNumbers: the epsilon coefficient cannot descend modulo epsilon.
example :
    ¬ ∃ ell : BoundaryDualFunctional ℚ (TrivSqZeroExt ℚ ℚ) (⊥ : Ideal ℚ)
      (RingHom.ker (TrivSqZeroExt.fstHom ℚ ℚ ℚ).toRingHom),
      ell.val = TrivSqZeroExt.sndHom ℚ ℚ := by
  sorry

-- The permitted functional after multiplying the input by epsilon is the
-- constant coefficient. This strengthens the same discriminating test.
example :
    ∃ ell : BoundaryDualFunctional ℚ (TrivSqZeroExt ℚ ℚ) (⊥ : Ideal ℚ)
      (RingHom.ker (TrivSqZeroExt.fstHom ℚ ℚ ℚ).toRingHom),
      ell.val = (TrivSqZeroExt.fstHom ℚ ℚ ℚ).toLinearMap := by
  sorry

variable (K M : Type u) [CommRing K] [Algebra R K]
variable [AddCommGroup M] [Module R M]

/-- Fractional coefficients modulo the image of the original module. -/
abbrev KOCoefficients :=
  (K ⊗[R] M) ⧸ LinearMap.range (TensorProduct.mk R K M 1)

def KOCoefficients.mk (z : K ⊗[R] M) : KOCoefficients R K M :=
  (LinearMap.range (TensorProduct.mk R K M 1)).mkQ z

theorem KOCoefficients.integral_zero (m : M) :
    KOCoefficients.mk R K M (1 ⊗ₜ[R] m) = 0 := by
  sorry

theorem KOCoefficients.mk_add (z w : K ⊗[R] M) :
    KOCoefficients.mk R K M (z + w) =
      KOCoefficients.mk R K M z + KOCoefficients.mk R K M w := by
  sorry

-- KOTests.baseField
example (z : KOCoefficients R R M) : z = 0 := by
  sorry

-- KOTests.zeroModule
example [Subsingleton M] : Subsingleton (KOCoefficients R K M) := by
  sorry

-- KOTests.integralClass
example (m : M) : KOCoefficients.mk R K M (1 ⊗ₜ[R] m) = 0 := by
  sorry

section ValuationAdapters

variable {F₀ E₀ L₀ : Type u} [Field F₀] [Field E₀] [Field L₀]
variable [Algebra F₀ E₀] [Algebra F₀ L₀]

/-- Native polynomial form; specializing to the minimal polynomial gives the
source's conjugate-coefficient adapter, with repeated roots retained. -/
theorem root_coefficient_descent
    (V : ValuationSubring F₀) (W : ValuationSubring L₀)
    (hW : W.comap (algebraMap F₀ L₀) = V)
    (p : Polynomial F₀) (hp : p.Monic)
    (hs : (p.map (algebraMap F₀ L₀)).Splits)
    (hr : ∀ z ∈ (p.map (algebraMap F₀ L₀)).roots, z ∈ W) :
    ∀ n : ℕ, p.coeff n ∈ V := by
  sorry

/-- The entire prolongation family is used, not one valuation per index. -/
theorem valuation_prolongation_integrality
    [FiniteDimensional F₀ E₀] {ι : Type u}
    (V : ι → ValuationSubring F₀) (B₀ : Subring F₀)
    [Algebra B₀ E₀] [IsScalarTower B₀ F₀ E₀]
    (hB : B₀ = ⨅ i, (V i).toSubring) (x : E₀) :
    x ∈ integralClosure B₀ E₀ ↔
      ∀ i (W : ValuationSubring E₀),
        W.comap (algebraMap F₀ E₀) = V i → x ∈ W := by
  sorry

end ValuationAdapters

end TauCeti.AlgebraicGeometry.A0Extension


/-!
## Explicit omission ledger

The definitive mathematical signatures follow. Their names, hypotheses, APIs
and discriminating tests are retained; they are not elaborated declarations.
The absent condition is left out of code as PROTOCOL section 13 requires.
There are no replacement axioms, abstract Prop fields or invented geometry.
All signatures below have namespace TauCeti.AlgebraicGeometry.A0Extension.

gRing_essentiallyFiniteType — theorem signature:
If R is a Noetherian G-ring and R→B is essentially of finite type, B is a G-ring. In particular the local rings of a finite-type scheme over a G-ring have geometrically regular formal fibres.
Hypotheses: R is Noetherian; G-ring means regularity of each local completion map.
Omitted because: The native G-ring/Popescu interfaces and geometric Sch/S, formal-groupoid, obstruction-module and smooth-chart suppliers are not available. The affine prototypes above cover set-valued absolute functors only.
Inputs: SchemeAndStackFoundations:SF.0/g-ring, SchemeAndStackFoundations:SF.0/regular-map-completion.

polynomial_approximation — theorem signature:
Let (R,m) be Noetherian local and a G-ring. Every solution in R̂ of a finite polynomial system over R can, for each N≥1, be approximated modulo m^N by a solution in a pointed étale R-algebra R′ with the same residue field. If R is henselian the solution can be chosen in R itself.
Hypotheses: Finitely many equations and variables; N≥1; the completion of R′ at its specified point is identified with R̂.
Omitted because: The native G-ring/Popescu interfaces and geometric Sch/S, formal-groupoid, obstruction-module and smooth-chart suppliers are not available. The affine prototypes above cover set-valued absolute functors only.
Inputs: SchemeAndStackFoundations:SF.0/popescu-desingularization, SchemeAndStackFoundations:SF.0/regular-map-completion, AlgebraicModuliForArithmeticGeometry:A0-extension/g-ring-finite-type.

common_etale_neighbourhood — theorem signature:
For schemes X₁,X₂ locally of finite type over a field or an excellent discrete valuation ring S, pointed at finite-type points with a specified S-isomorphism of completed local rings, there is a common pointed S-scheme U with étale maps to X₁ and X₂ inducing residue-field isomorphisms. Any fixed finite jet of the specified formal isomorphism can be matched; equality of the entire formal map is not promised.
Hypotheses: The points have identified residue fields and lie over the same point of S; the given isomorphism respects S.
Omitted because: The native G-ring/Popescu interfaces and geometric Sch/S, formal-groupoid, obstruction-module and smooth-chart suppliers are not available. The affine prototypes above cover set-valued absolute functors only.
Inputs: AlgebraicModuliForArithmeticGeometry:A0-extension/polynomial-approximation, SchemeAndStackFoundations:SF.1.

StrongInfinitesimalGluing — omitted geometric extension or extra conclusion:
For a covariant affine functor F from commutative rings to sets, RS* means that F(A×_C B)→F(A)×_{F(C)}F(B) is bijective for every cospan A→C←B with B→C surjective and square-zero kernel. For a category fibred in groupoids use equivalence with the 2-fibre product, retaining the gluing isomorphism.
Hypotheses: Use a fixed universe; the relative version uses rings over the affine base.
The native definition, API and three named tests appear above. Stack, relative-base, sheaf, exact-sequence or ramified-power consequences in this full statement require the actual suppliers; they are not implied by elaboration of the raw affine construction.

FormalPoint — omitted geometric extension or extra conclusion:
For an affine set-valued functor F, a ring R and ideal I, FormalPoint(F,R,I) consists of ξ_n∈F(R/I^(n+1)) for every n≥0, compatible with every quotient transition. Restriction sends x∈F(R) to its family. In the geometric criterion take I=m_R, R complete Noetherian local over S, and residue field finite type over S.
Hypotheses: The affine prototype has no completeness restriction; the criterion adds it explicitly. For stacks replace equality compatibility by coherent pullback isomorphisms in the formal-object groupoid.
The native definition, API and three named tests appear above. Stack, relative-base, sheaf, exact-sequence or ramified-power consequences in this full statement require the actual suppliers; they are not implied by elaboration of the raw affine construction.

IsEffective — omitted geometric extension or extra conclusion:
Affine set-valued effectivity at (R,I) is surjectivity of F(R)→FormalPoint(F,R,I). The Artin space criterion quantifies this over all complete Noetherian local S-algebras with finite-type residue field. For a stack, effectivity means essential surjectivity of restriction to its formal-object groupoid. The stronger equivalence interface also retains unique compatible lifting of morphisms; with represented diagonal this is the standard supplied effectivity interface.
Hypotheses: Use the restriction map of formal-point, not a separately postulated algebraization predicate.
The native definition, API and three named tests appear above. Stack, relative-base, sheaf, exact-sequence or ramified-power consequences in this full statement require the actual suppliers; they are not implied by elaboration of the raw affine construction.

TangentFiber — omitted geometric extension or extra conclusion:
For x∈F(k), define the tangent fibre as the fibre over x of F(k[ε]/ε²)→F(k), with zero tangent given by the split inclusion k→k[ε]/ε². For a stack take isomorphism classes of lifts with a specified identification with x; infinitesimal automorphisms are the kernel of the automorphism restriction of the split lift. RS supplies their natural k-vector-space structures.
Hypotheses: k is a field; relative functors and dual numbers are taken over the base.
The native definition, API and three named tests appear above. Stack, relative-base, sheaf, exact-sequence or ramified-power consequences in this full statement require the actual suppliers; they are not implied by elaboration of the raw affine construction.

ModuleObstructionTheory — definition signature:
For x∈X(Spec A), A Noetherian over S, an obstruction theory assigns an A-linear functor O_x on A-modules, natural in module maps, and to each square-zero extension A′→A of kernel M a class ob_x(A′)∈O_x(M), compatible with pushout of extensions. Its class vanishes exactly when the groupoid of lifts of x with specified identification is nonempty. T_x(M) and Inf_x(M) respectively describe differences between liftings and their infinitesimal automorphisms.
Hypotheses: For the openness theorem use the full module-functor axioms of 98.22.1, including naturality in extensions and in the object; the finite-dimensional Artin-local obstruction space of SF.4 alone is insufficient.
Omitted because: The native G-ring/Popescu interfaces and geometric Sch/S, formal-groupoid, obstruction-module and smooth-chart suppliers are not available. The affine prototypes above cover set-valued absolute functors only.
Inputs: AlgebraicModuliForArithmeticGeometry:A0-extension/strong-infinitesimal-gluing, AlgebraicModuliForArithmeticGeometry:A0-extension/tangent-fibre, SchemeAndStackFoundations:SF.4/obstruction-theory.
API ModuleObstructionTheory.pushout: A map M→N sends the obstruction to that of the pushed-out extension.
API ModuleObstructionTheory.zero_iff_lift: The obstruction vanishes exactly when a framed lift exists.
API ModuleObstructionTheory.lifting_torsor: If lifts exist their framed isomorphism classes form a torsor under T_x(M), with Inf_x(M) their infinitesimal automorphisms.
Example ObstructionTests.split (computation): A split extension has zero obstruction and its split lift exists.
Example ObstructionTests.zeroKernel (degenerate): A zero-kernel extension has the original object as lift.
Example ObstructionTests.curveLineBundle (compatibility): For a line bundle on a proper smooth curve over k, O_x(M)=H²(X,O_X)⊗M=0, though H¹ may parametrize different lifts.

formal_object_approximation — theorem signature:
Let S be locally Noetherian, X a category fibred in groupoids limit preserving on objects, R a complete Noetherian local S-algebra with finite-type residue field, and x∈X(R). If O_{S,s} is a G-ring at the image s, then for every N≥1 there are a finite-type S-algebra A, a maximal ideal m_A, an object x_A, and an S-isomorphism R/m_R^N≅A/m_A^N identifying the restrictions of x and x_A. One can also identify the associated graded rings at the specified points.
Hypotheses: The algebra A is over an affine neighbourhood of s; residue fields are identified. This is finite-order approximation, not an isomorphism R≅A or full algebraization of x.
Omitted because: The native G-ring/Popescu interfaces and geometric Sch/S, formal-groupoid, obstruction-module and smooth-chart suppliers are not available. The affine prototypes above cover set-valued absolute functors only.
Inputs: AlgebraicModuliForArithmeticGeometry:A0-extension/g-ring-finite-type, AlgebraicModuliForArithmeticGeometry:A0-extension/polynomial-approximation.

openness_of_versality — theorem signature:
Let X be a category fibred in groupoids over locally Noetherian S with representable diagonal, RS*, limit preservation and a module-valued obstruction theory. Suppose for every Noetherian A, x and family (M_i) of A-modules the map T_x(∏M_i)→∏T_x(M_i) is an isomorphism and O_x(∏M_i)→∏O_x(M_i) is injective. For an object over a finite-type S-scheme U, its formal versality at a finite-type point implies versality at all finite-type points in some open neighbourhood.
Hypotheses: Formal versality is the smooth lifting property of its complete-local deformation functor, as in SF.4 hull; retain both product conditions and the representable diagonal.
Omitted because: The native G-ring/Popescu interfaces and geometric Sch/S, formal-groupoid, obstruction-module and smooth-chart suppliers are not available. The affine prototypes above cover set-valued absolute functors only.
Inputs: AlgebraicModuliForArithmeticGeometry:A0-extension/module-obstruction-theory, AlgebraicModuliForArithmeticGeometry:A0-extension/strong-infinitesimal-gluing, SchemeAndStackFoundations:SF.4/hull, SchemeAndStackFoundations:SF.1.

artin_space_criterion — theorem signature:
An étale sheaf F:(Sch/S)^op→Sets satisfying the listed hypotheses is an algebraic space locally of finite presentation over S. Limit preservation means colim F(Spec A_i)→F(Spec colim A_i) is bijective for every filtered system of affine S-algebras.
Hypotheses: F is an étale sheaf. S is locally Noetherian; O_{S,s} is a G-ring for every finite-type point s. A fixed universe bounds the cardinalities of finite-type field fibres. The diagonal is representable by algebraic spaces. The functor preserves filtered affine limits, satisfies local RS, and all finite-type field tangent spaces are finite dimensional. Every complete-Noetherian-local formal object with finite-type residue field is effective, and versality for finite-type families is open.
Omitted because: The native G-ring/Popescu interfaces and geometric Sch/S, formal-groupoid, obstruction-module and smooth-chart suppliers are not available. The affine prototypes above cover set-valued absolute functors only.
Inputs: mathlib:CategoryTheory.Limits.PreservesFilteredColimits, AlgebraicModuliForArithmeticGeometry:A0-extension/formal-object-approximation, AlgebraicModuliForArithmeticGeometry:A0-extension/effectivity, AlgebraicModuliForArithmeticGeometry:A0-extension/tangent-fibre, SchemeAndStackFoundations:SF.4/hull, SchemeAndStackFoundations:SF.1.

artin_stack_criterion — theorem signature:
An étale stack in groupoids X over S satisfying the listed hypotheses admits a smooth surjective atlas by schemes and is an algebraic stack locally of finite presentation over S. Limit preservation is equivalence of the 2-colimit of affine fibre groupoids with the fibre over the filtered colimit.
Hypotheses: X is a stack for the étale topology. S is locally Noetherian; O_{S,s} is a G-ring for every finite-type point s. A fixed universe bounds the cardinalities of both isomorphism classes and arrows over finite-type fields. The diagonal is representable by algebraic spaces. The functor preserves filtered affine limits, satisfies local RS, and all finite-type field tangent and infinitesimal automorphism spaces are finite dimensional. Every complete-Noetherian-local formal object with finite-type residue field is in the essential image of restriction, and versality for finite-type families is open.
Omitted because: The native G-ring/Popescu interfaces and geometric Sch/S, formal-groupoid, obstruction-module and smooth-chart suppliers are not available. The affine prototypes above cover set-valued absolute functors only.
Inputs: DiamondsAndVStacks:D0, SchemeAndStackFoundations:SF.1, AlgebraicModuliForArithmeticGeometry:A0-extension/formal-object-approximation, AlgebraicModuliForArithmeticGeometry:A0-extension/effectivity, AlgebraicModuliForArithmeticGeometry:A0-extension/tangent-fibre, SchemeAndStackFoundations:SF.4/hull.

perfect_proper_pushforward — theorem signature:
Let f:X→Y be a finitely presented morphism of algebraic spaces. Let E be perfect on X and G• a bounded complex of finitely presented O_X-modules, termwise flat over Y, each with support proper over Y. Then Rf_*(E⊗^L G•) is perfect on Y. For every Y′→Y the derived base-change comparison to Rf′_*(E′⊗^L G′•) is an isomorphism. In particular this holds for Rf_*E when f is proper, flat and finitely presented.
Hypotheses: No Noetherian hypothesis on Y; boundedness, finite presentation, target-flatness and proper supports are all retained.
Omitted because: Requires the SF.2 qcqs-space D_QCoh/perfect/pushforward/tensor extension; the imported scheme interfaces cannot stand for this space theorem.
Inputs: SchemeAndStackFoundations:SF.2/derived-quasi-coherent-category, SchemeAndStackFoundations:SF.2/derived-pullback-pushforward-qcoh, SchemeAndStackFoundations:SF.2/derived-tensor-internal-hom, SchemeAndStackFoundations:SF.2/tor-independent-base-change, tauceti:TauCetiRoadmap/JacobianChallenge#layer-c-relative-coherent-cohomology-and-base-change, tauceti:TauCetiRoadmap/StableReduction#layer-2-coherent-curve-theory-duality-and-positivity, SchemeAndStackFoundations:SF.1, SchemeAndStackFoundations:SF.2.

fibre_betti_semicontinuity — theorem signature:
For a perfect complex K on an algebraic space Y, β_i(y)=dim_{κ(y)}H^i(K⊗^Lκ(y)) is upper semicontinuous, étale locally constructible, and invariant under arbitrary residue-field extension. The finite alternating sum χ(K_y)=Σ_i(−1)^iβ_i(y) is locally constant. Apply this to the perfect pushforwards above.
Hypotheses: Finite Tor amplitude is imposed locally, so the Euler sum is finite; the fibre is derived.
Omitted because: Requires the SF.2 qcqs-space D_QCoh/perfect/pushforward/tensor extension; the imported scheme interfaces cannot stand for this space theorem.
Inputs: AlgebraicModuliForArithmeticGeometry:A0-extension/perfect-proper-pushforward, SchemeAndStackFoundations:SF.2/derived-quasi-coherent-category.

single_degree_free_locus — theorem signature:
For a perfect complex K on Y, a fixed integer i and rank r≥0, the condition that K_y has cohomology only in degree i and β_i(y)=r is represented by an open subspace U⊂Y. Universally for T→Y it means K_T≅V[−i] for a locally free rank-r module V on T. This equivalence is local on T and commutes with arbitrary base change.
Hypotheses: Use a perfect K; the condition covers all degrees, not merely β_i=r.
Omitted because: Requires the SF.2 qcqs-space D_QCoh/perfect/pushforward/tensor extension; the imported scheme interfaces cannot stand for this space theorem.
Inputs: AlgebraicModuliForArithmeticGeometry:A0-extension/fibre-betti-semicontinuity, SchemeAndStackFoundations:SF.2/derived-quasi-coherent-category.

lowest_degree_rank_stratum — theorem signature:
Let K be perfect of Tor amplitude [a,b]. The locus β_a=r has a finitely presented locally closed structure representing, for every T→Y, the condition that H^a(K_T) is locally free of rank r and its formation commutes with every further base change. On the open β_a≤r locus this stratum is closed.
Hypotheses: a≤b and r≥0; use cohomological degree a, even when a≠0.
Omitted because: Requires the SF.2 qcqs-space D_QCoh/perfect/pushforward/tensor extension; the imported scheme interfaces cannot stand for this space theorem.
Inputs: AlgebraicModuliForArithmeticGeometry:A0-extension/fibre-betti-semicontinuity, SchemeAndStackFoundations:SF.2/derived-quasi-coherent-category.

universal_functions — theorem signature:
If f:X→Y is proper, flat and finitely presented with geometrically reduced, geometrically connected fibres, then O_T→(f_T)_*O_{X_T} is an isomorphism for every T→Y. More generally the same conclusion holds when H⁰(X_k,O)=k for every field-valued point Spec k→Y. Étale locally Rf_*O_X splits as O_Y⊕P with P perfect of Tor amplitude at least 1.
Hypotheses: The field-valued test is quantified over every point; geometric connectedness alone without geometric reducedness does not suffice.
Omitted because: Requires the SF.2 qcqs-space D_QCoh/perfect/pushforward/tensor extension; the imported scheme interfaces cannot stand for this space theorem.
Inputs: AlgebraicModuliForArithmeticGeometry:A0-extension/perfect-proper-pushforward, AlgebraicModuliForArithmeticGeometry:A0-extension/single-degree-free-locus.

PicardStackSpaces — definition signature:
For f:X→B define the stack whose fibre over T→B is the groupoid of invertible O_{X_T}-modules with all isomorphisms, and whose pullback functors are pullback of invertible modules. Tensor product, the structure sheaf and duals make this a commutative group stack. It is not the discrete groupoid on the relative Picard sheaf.
Hypotheses: X and B are algebraic spaces; invertible modules are taken on their small étale ringed sites; morphisms include line-bundle automorphisms.
Omitted because: Requires actual ringed étale algebraic-space sites and groupoids, R09.4 coherent-sheaf moduli, SF.4 proper-space effectivity and SF.1 neutral-component or group-scheme descent suppliers.
Inputs: SchemeAndStackFoundations:SF.3/picard-stack-curve, AlgebraicModuliForArithmeticGeometry:R09.3/space-quasicoherent-modules, DiamondsAndVStacks:D0.
API PicardStackSpaces.ofLineBundle: An invertible module on X_T defines an object in the fibre over T.
API PicardStackSpaces.pullback: Pullback respects tensor, unit and composition up to the canonical coherent isomorphisms.
API PicardStackSpaces.automorphism: Automorphisms of a line bundle are Γ(X_T,O_X_T×); under universal functions this is Γ(T,O_T×).
Example PicardStackTests.point (computation): For X=B=Spec k the fibre stack is B G_m, although the relative Picard sheaf is zero.
Example PicardStackTests.disjointPoints (computation): For two points over k the trivial line bundle has automorphism group k××k×.
Example PicardStackTests.baseChange (compatibility): Restricting the stack to Sch/T agrees with the Picard stack of X_T/T.

picard_stack_algebraic — theorem signature:
If f:X→B is proper, flat and finitely presented, the Picard stack is algebraic, quasi-separated and locally of finite presentation over B. It is the open substack of Coh_{X/B} consisting of invertible modules.
Hypotheses: No global section, Noetherian base or projectivity is required. The ambient coherent-sheaf stack parametrizes finitely presented T-flat modules with support proper over T.
Omitted because: Requires actual ringed étale algebraic-space sites and groupoids, R09.4 coherent-sheaf moduli, SF.4 proper-space effectivity and SF.1 neutral-component or group-scheme descent suppliers.
Inputs: AlgebraicModuliForArithmeticGeometry:A0-extension/picard-stack-spaces, AlgebraicModuliForArithmeticGeometry:R09.4, AlgebraicModuliForArithmeticGeometry:A0-extension/perfect-proper-pushforward, SchemeAndStackFoundations:SF.1.

rigidification_gm_torsor — theorem signature:
For proper flat finitely presented X→B with a section σ, the map from the stack of σ-rigidified line bundles to the Picard stack is representable, smooth and surjective: over L on X_T its fibre is the G_m-torsor of trivializations of σ_T*L. This conclusion does not require universal functions.
Hypotheses: Rigidification is an isomorphism O_T≅σ_T*L; a global trivialization need not exist on T.
Omitted because: Requires actual ringed étale algebraic-space sites and groupoids, R09.4 coherent-sheaf moduli, SF.4 proper-space effectivity and SF.1 neutral-component or group-scheme descent suppliers.
Inputs: AlgebraicModuliForArithmeticGeometry:A0-extension/section-rigidified-picard, AlgebraicModuliForArithmeticGeometry:A0-extension/picard-stack-spaces, SchemeAndStackFoundations:SF.2/multiplicative-additive-group-sheaves.

relative_picard_algebraicSpace — theorem signature:
If f:X→B is proper, flat and finitely presented and O_T→(f_T)_*O_{X_T} is an isomorphism for every T→B, its relative fppf Picard sheaf is an algebraic space, quasi-separated and locally of finite presentation over B. It remains the sheafification of line-bundle classes modulo base classes; arbitrary T-points need not be represented by a line bundle.
Hypotheses: Universal functions is an arbitrary-base-change condition. Neither a section nor geometrically integral fibres are required.
Omitted because: Requires actual ringed étale algebraic-space sites and groupoids, R09.4 coherent-sheaf moduli, SF.4 proper-space effectivity and SF.1 neutral-component or group-scheme descent suppliers.
Inputs: AlgebraicModuliForArithmeticGeometry:A0-extension/relative-picard-sheaf, AlgebraicModuliForArithmeticGeometry:A0-extension/relative-picard-base-change, AlgebraicModuliForArithmeticGeometry:A0-extension/section-picard-split, AlgebraicModuliForArithmeticGeometry:A0-extension/picard-stack-algebraicity, AlgebraicModuliForArithmeticGeometry:A0-extension/rigidification-gm-torsor, SchemeAndStackFoundations:SF.1.

relative_picard_separated — theorem signature:
Under the preceding Picard hypotheses its diagonal is a quasi-compact immersion, hence it is locally separated. If every geometric fibre of X→B is integral, the Picard space is separated over B.
Hypotheses: For the separatedness statement geometric integrality is required; normality is not added. Universal functions remains in force.
Omitted because: Requires actual ringed étale algebraic-space sites and groupoids, R09.4 coherent-sheaf moduli, SF.4 proper-space effectivity and SF.1 neutral-component or group-scheme descent suppliers.
Inputs: AlgebraicModuliForArithmeticGeometry:A0-extension/picard-space-representability, AlgebraicModuliForArithmeticGeometry:A0-extension/perfect-proper-pushforward, SchemeAndStackFoundations:SF.1.

picard_infinitesimal_lifting — theorem signature:
Let X₀ be proper over k and X_A⊂X_A′ a flat small Artinian thickening of kernel I annihilated by the maximal ideal. For a line bundle L_A the obstruction to a lift with specified reduction lies in H²(X₀,O_X₀)⊗_k I. When it vanishes, framed lift classes form a torsor under H¹(X₀,O_X₀)⊗I and infinitesimal automorphisms are H⁰(X₀,O_X₀)⊗I. Extend the existing scheme statement to algebraic spaces by étale descent.
Hypotheses: Use framed lifts. Unframed fibres of Pic(X_A′)→Pic(X_A) can be quotients by unit boundary maps. H²=0 is sufficient for smoothness, not a necessary condition.
Omitted because: Requires actual ringed étale algebraic-space sites and groupoids, R09.4 coherent-sheaf moduli, SF.4 proper-space effectivity and SF.1 neutral-component or group-scheme descent suppliers.
Inputs: SchemeAndStackFoundations:SF.4/deformations-of-smooth-schemes, AlgebraicModuliForArithmeticGeometry:A0-extension/picard-stack-spaces, SchemeAndStackFoundations:SF.2/quasi-coherent-topology-comparison, AlgebraicModuliForArithmeticGeometry:A0-extension/module-obstruction-theory.

PicardZeroSheaf — definition signature:
For the represented relative Picard sheaf P, define Pic⁰(T) as the subgroup of P(T) whose value at every geometric point t of T lies in the connected component containing zero in P_t. Keep the full induced scheme or algebraic-space structure when this subfunctor is represented; do not replace a nonreduced component by its reduction.
Hypotheses: P is a group algebraic space locally of finite presentation over B; geometric points test every base-changed fibre.
Omitted because: Requires actual ringed étale algebraic-space sites and groupoids, R09.4 coherent-sheaf moduli, SF.4 proper-space effectivity and SF.1 neutral-component or group-scheme descent suppliers.
Inputs: AlgebraicModuliForArithmeticGeometry:A0-extension/picard-space-representability, SchemeAndStackFoundations:SF.1/group-action, SchemeAndStackFoundations:SF.1.
API PicardZeroSheaf.inclusion: Pic⁰ includes naturally into the relative Picard sheaf as a subgroup.
API PicardZeroSheaf.baseChange: Membership is preserved under every base change; the neutral component of a fibre is geometrically connected because it has the identity point.
API PicardZeroSheaf.fibre: On geometric fibres the sheaf is exactly the identity component, with its full structure.
Example PicardZeroTests.projectiveLine (computation): For P¹/k the relative Picard sheaf is the constant degree group Z and Pic⁰ is zero.
Example PicardZeroTests.curve (compatibility): For a smooth proper pointed curve Pic⁰ agrees with the existing JacobianChallenge identity component.
Example PicardZeroTests.nonreduced (non-example): For an ordinary Enriques surface Y over an algebraically closed field k of characteristic 2, Picτ=μ₂ is connected, hence Pic⁰=μ₂. Its coordinate ring k[t]/((t−1)²) retains a nonzero nilpotent t−1; the reduced identity component would be the trivial group.

picard_zero_criterion — theorem signature:
Assume B is locally Noetherian and P is the relative Picard algebraic space above. In the scheme-represented case, if the identity components P_s⁰ are smooth of locally constant dimension, Pic⁰ is an open finite-type group subscheme; it is smooth when B is reduced, and proper and closed in P when all P_s⁰ are proper and P is separated. For algebraic spaces, under the requested neutral-component extension, the same conclusions hold. Over a nonreduced B instead require formal smoothness of P along the neutral component; local finite presentation then yields smoothness. With proper geometric identity components and separated P the resulting Pic⁰ is a smooth proper finitely presented group space.
Hypotheses: Kleiman 5.20 supplies the scheme-represented case. The algebraic-space extension and proper neutral-component criterion are an explicit supplier gap, not claimed source theorems here. Smooth geometric fibres alone do not imply smoothness over a nonreduced base.
Omitted because: Requires actual ringed étale algebraic-space sites and groupoids, R09.4 coherent-sheaf moduli, SF.4 proper-space effectivity and SF.1 neutral-component or group-scheme descent suppliers.
Inputs: AlgebraicModuliForArithmeticGeometry:A0-extension/picard-zero-sheaf, AlgebraicModuliForArithmeticGeometry:A0-extension/picard-separation, AlgebraicModuliForArithmeticGeometry:A0-extension/picard-infinitesimal-lifting, SchemeAndStackFoundations:SF.1, tauceti:TauCetiRoadmap/JacobianChallenge#layer-d-the-relative-picard-functor-and-the-jacobian-scheme.

picard_brauer_obstruction — theorem signature:
For proper flat finitely presented f:X→T with universal functions, the fppf Leray spectral sequence for G_m gives 0→Pic(T)→Pic(X)→Pic_{X/T}(T)→H²_fppf(T,G_m)→H²_fppf(X,G_m). The image of a relative class has zero obstruction exactly when it is represented by a line bundle on X. With a section the obstruction vanishes and the sequence recovers the prior split Picard comparison.
Hypotheses: H² denotes cohomological Brauer data, without asserting that every class is Azumaya or torsion over every base.
Omitted because: Requires actual ringed étale algebraic-space sites and groupoids, R09.4 coherent-sheaf moduli, SF.4 proper-space effectivity and SF.1 neutral-component or group-scheme descent suppliers.
Inputs: SchemeAndStackFoundations:SF.2/site-leray-spectral-sequence, SchemeAndStackFoundations:SF.2/hilbert-90, SchemeAndStackFoundations:SF.3/picard-brauer-sequence, AlgebraicModuliForArithmeticGeometry:A0-extension/relative-picard-kernel, AlgebraicModuliForArithmeticGeometry:A0-extension/section-picard-split, AlgebraicModuliForArithmeticGeometry:A0-extension/picard-space-representability.

finite_picard_cartier_torsors — theorem signature:
Let f:X→B be proper flat finitely presented with universal functions, M a finite locally free commutative group scheme over B and D(M) its Cartier dual. There is a natural isomorphism of fppf sheaves R¹f_*(D(M)_X)≅Hom_B(M,Pic_{X/B}). Thus a homomorphism into the Picard sheaf gives fppf-locally on B a D(M)-torsor on X. With a section, rigidifying the torsor along it gives the pointed global correspondence. Without a section there can be a base H²(D(M)) obstruction to a global representative.
Hypotheses: Finite locally free includes flatness and finite presentation; the statement includes non-étale group schemes. Sheafification of torsors and global torsors are distinguished.
Omitted because: Requires actual ringed étale algebraic-space sites and groupoids, R09.4 coherent-sheaf moduli, SF.4 proper-space effectivity and SF.1 neutral-component or group-scheme descent suppliers.
Inputs: tauceti:TauCeti.FiniteLocallyFreeBicommutativeHopfAlgCat.cartierDuality, SchemeAndStackFoundations:SF.2/abelian-torsor-h1, AlgebraicModuliForArithmeticGeometry:A0-extension/picard-brauer-obstruction, AlgebraicModuliForArithmeticGeometry:A0-extension/picard-space-representability, SchemeAndStackFoundations:SF.1.

RaynaudNStar — definition signature:
For a proper flat finitely presented scheme X over a discrete valuation trait S, condition N means the special fibre has no embedded associated points and X is normal at the generic points of that fibre. Condition N* adds f_*O_X=O_S. The last equality is over S itself; universal cohomological flatness is a conclusion of the degree-one criterion, not part of the definition.
Hypotheses: S is a discrete valuation trait; this definition is not a condition on an arbitrary base.
Omitted because: Requires actual ringed étale algebraic-space sites and groupoids, R09.4 coherent-sheaf moduli, SF.4 proper-space effectivity and SF.1 neutral-component or group-scheme descent suppliers.
Inputs: tauceti:TauCetiRoadmap/StableReduction#layer-2-coherent-curve-theory-duality-and-positivity, SchemeAndStackFoundations:SF.0/nagata-normalization-finite.
API RaynaudNStar.noEmbedded: The special fibre has no embedded associated points.
API RaynaudNStar.genericNormal: The total space is normal at every generic point of the special fibre.
API RaynaudNStar.functions: The structure-sheaf direct image over the trait is O_S.
Example RaynaudTests.regularPoint (computation): For X=S with the identity morphism, N* holds.
Example RaynaudTests.embeddedPoint (non-example): A flat trait family whose special fibre has an embedded associated point fails N regardless of its generic fibre.
Example RaynaudTests.nontrivialConstants (non-example): For a nontrivial finite unramified trait extension X→S, N holds but N* fails because f_*O_X is the extension ring.

raynaud_degree_one_cohomologicallyFlat — theorem signature:
Let f:X→S be a proper flat finitely presented relative curve over a discrete valuation trait satisfying N*. If the generic fibre after strict henselization of S has a divisor of degree one, f is cohomologically flat in degree zero: formation of f_*O_X commutes with every base change. In particular a section gives the required generic degree-one divisor.
Hypotheses: The divisor is on the generic fibre after strict henselization. A generic degree-one divisor without N* does not meet the theorem.
Omitted because: Requires actual ringed étale algebraic-space sites and groupoids, R09.4 coherent-sheaf moduli, SF.4 proper-space effectivity and SF.1 neutral-component or group-scheme descent suppliers.
Inputs: AlgebraicModuliForArithmeticGeometry:A0-extension/raynaud-n-star, tauceti:TauCetiRoadmap/StableReduction#layer-2-coherent-curve-theory-duality-and-positivity.

SpaceAnalytification — construction signature:
For a complex algebraic space X locally of finite type with locally separated diagonal, take an étale scheme presentation R⇉U and construct X^an as the analytic quotient of R^an⇉U^an. The local-isomorphism relation glues analytic structure, including nilpotents. Over a complete nontrivially valued nonarchimedean field K use an existing quotient of this analytified relation; separated X has such a quotient by the next theorem. Its quotient sheaf is represented, and U^an→X^an is an étale cover with R^an≅U^an×_{X^an}U^an.
Hypotheses: Scheme analytification is imported from the existing complex proposal and AdicSpacesPartII. In the nonarchimedean case existence is not assumed for every locally separated X.
Omitted because: Requires actual analytic space quotients and their sheaf categories; the existing scheme roadmap is an import, not a native Lean carrier. See the AdicSpacesPartII and R09.3/SF.4 supplier contracts.
Inputs: SchemeAndStackFoundations:SF.1/groupoid-space, SchemeAndStackFoundations:SF.1/etale-equivalence-relation, SchemeAndStackFoundations:SF.1/algebraic-space-category, AdicSpacesPartII:R1.
API SpaceAnalytification.chart: The analytic chart is étale and surjective, with relation equal to its fibre product.
API SpaceAnalytification.quotient: Maps out are exactly maps out of U^an equalizing the two relation arrows.
API SpaceAnalytification.scheme: For a scheme, this agrees with the existing scheme analytification, including the structure sheaf.
Example AnalytificationTests.dualNumbers (compatibility): For Spec C[ε]/ε² the analytic local ring contains the nonzero class ε with ε²=0.
Example AnalytificationTests.point (degenerate): A single field point analytifies to the existing analytic field point.
Example AnalytificationTests.presentation (characterisation): A disjoint union presentation of the same scheme gives the same analytification and its actual overlap relation.

separated_nonarch_analytification — theorem signature:
Every separated algebraic space locally of finite type over a complete nontrivially valued nonarchimedean field admits rigid analytification, compatible with the scheme construction. On the Berkovich side an étale equivalence relation R⇉U with closed-immersion diagonal has a separated analytic quotient; good and strictly analytic properties descend.
Hypotheses: Separatedness, not merely local separatedness, guarantees existence. The lower analytic-space substrate and rigid/Berkovich bridge are a supplier request.
Omitted because: Requires actual analytic space quotients and their sheaf categories; the existing scheme roadmap is an import, not a native Lean carrier. See the AdicSpacesPartII and R09.3/SF.4 supplier contracts.
Inputs: AlgebraicModuliForArithmeticGeometry:A0-extension/space-analytification, AdicSpacesPartII:R1, SchemeAndStackFoundations:SF.1.

analytification_descent — theorem signature:
For analytifiable algebraic spaces, the quotient analytification is independent up to unique canonical isomorphism of the chosen étale presentation. It is functorial in morphisms and compatible with fibre products whenever the terms are analytifiable. The scheme comparison respects these identifications; complex étale morphisms yield local analytic isomorphisms.
Hypotheses: In the nonarchimedean case étale morphisms stay étale and need not be local isomorphisms for the rigid topology.
Omitted because: Requires actual analytic space quotients and their sheaf categories; the existing scheme roadmap is an import, not a native Lean carrier. See the AdicSpacesPartII and R09.3/SF.4 supplier contracts.
Inputs: AlgebraicModuliForArithmeticGeometry:A0-extension/space-analytification, AdicSpacesPartII:R1.

complex_local_comparison — theorem signature:
For finite-type complex schemes at complex points, isomorphic analytic germs imply isomorphic completed local C-algebras and hence a common pointed étale neighbourhood with residue-field isomorphisms. Conversely a common pointed étale neighbourhood yields an isomorphism of analytic germs. These conclusions extend to locally separated finite-type complex algebraic spaces by choosing étale charts and descending the local analytic identifications.
Hypotheses: Use finite-type complex objects, retain nonreduced analytic structure and respect the chosen complex points. The particular formal automorphism need not itself analytify.
Omitted because: Requires actual analytic space quotients and their sheaf categories; the existing scheme roadmap is an import, not a native Lean carrier. See the AdicSpacesPartII and R09.3/SF.4 supplier contracts.
Inputs: AlgebraicModuliForArithmeticGeometry:A0-extension/common-etale-neighbourhood, AlgebraicModuliForArithmeticGeometry:A0-extension/analytification-descent.

proper_space_gaga — theorem signature:
For a proper morphism h:X→Y of analytifiable finite-type algebraic spaces over K and coherent F, (R^j h_*F)^an→R^j h^an_*F^an is an isomorphism for every j≥0. For X proper over K, analytification induces an exact tensor equivalence of coherent-module categories.
Hypotheses: K is complete and nontrivially valued; the source is the étale ringed site of an algebraic space. This is the space extension of the existing proper scheme theorem. Complex coherent GAGA is a downstream C3 target, not an imported prerequisite here.
Omitted because: Requires actual analytic space quotients and their sheaf categories; the existing scheme roadmap is an import, not a native Lean carrier. See the AdicSpacesPartII and R09.3/SF.4 supplier contracts.
Inputs: AlgebraicModuliForArithmeticGeometry:A0-extension/analytification-descent, SchemeAndStackFoundations:SF.4/chow-lemma, SchemeAndStackFoundations:SF.2/quasi-coherent-topology-comparison, AdicSpacesPartII:R3/proper-gaga, AdicSpacesPartII:R3/proper-gaga-coherent-equivalence, AlgebraicModuliForArithmeticGeometry:R09.3.

arithmetic_normalization_genericallyEtale — application signature:
For a field k, a reduced finite-type k-algebra A and a finite extension E of its total fraction ring, its relative normalization is finite by the SF.0 Nagata theorem. For A=k[t₁,…,t_d] and a finite separable extension E/k(t₁,…,t_d), the finite normalization is generically étale. Finite normalization also holds for reduced finite-type schemes over an excellent base without a separability assumption.
Hypotheses: Finite many generic field extensions; separability is used only for the generic-étale conclusion, not for finite normalization.
Omitted because: Requires the geometric normalization/generic-étale interfaces of SF.0/SF.1; the two valuation signatures above are native.
Inputs: SchemeAndStackFoundations:SF.0/quasi-excellent-nagata, SchemeAndStackFoundations:SF.0/nagata-normalization-finite, SchemeAndStackFoundations:SF.0/japanese-ring, SchemeAndStackFoundations:SF.1.

cartier_duality_restriction — theorem signature:
Let S be Noetherian and f:X→Y an embeddable morphism between embeddable S-schemes X,Y, both local complete intersections of the same pure relative dimension n over S. Let F be locally free of finite rank r on Y and h a section of a line bundle L with h regular on Y and f*h regular on X. Write D=V(h), D′=V(f*h) and f_D:D′→D. Then the canonical comparison (f^!F)|_{D′}≅f_D^!(F|_D) is an isomorphism of locally free sheaves of rank r. Here f^!O_Y≅ω_{X/S}⊗f*ω_{Y/S}^{−1} lies in degree zero; f itself is not assumed lci. For finite flat f the comparison on affine charts is Hom_A(B,F)⊗_B(B/hB)≅Hom_{A/h}(B/hB,F/hF), and commutes with evaluation at one.
Hypotheses: S is Noetherian; embeddability has the finite-type separated convention of the imported duality pseudofunctor. Regularity of both Cartier equations and equal relative dimensions are retained. F need not be invertible; r is arbitrary.
Omitted because: Requires the SF.2 duality/fundamental-class, derived sheaf and cofinite DVR module/cohomology interfaces. The raw quotient and functional algebra above are native, not these geometric or sheaf-theoretic consequences.
Inputs: SchemeAndStackFoundations:key/coherent-duality, SchemeAndStackFoundations:SF.2/finite-formula, SchemeAndStackFoundations:SF.2/trace, SchemeAndStackFoundations:SF.2/derived-tensor-internal-hom, SchemeAndStackFoundations:SF.2/upper-shriek-compactification-independence, SchemeAndStackFoundations:SF.2/lci-upper-shriek, SchemeAndStackFoundations:SF.2.

BoundaryDualFunctional — omitted geometric extension or extra conclusion:
For an A-algebra B and ideals I⊂A,J⊂B, BoundaryDualFunctional(A,B,I,J) consists of A-linear maps ℓ:B→A with ℓ(J)⊂I. Such a functional induces a unique A-linear map B/J→A/I, and its value at the class of 1 is ℓ(1) modulo I. If J^n⊂IB, ℓ is A-linear and sends IB into I, then for c∈J^(n−1) the functional b↦ℓ(cb) belongs to this construction.
Hypotheses: No division by n and no separability hypothesis. The final power application assumes n≥1.
The native definition, API and three named tests appear above. Stack, relative-base, sheaf, exact-sequence or ramified-power consequences in this full statement require the actual suppliers; they are not implied by elaboration of the raw affine construction.

fundamental_class_boundary — theorem signature:
Let f:X→Y be an embeddable morphism between S-schemes of the same pure relative dimension. Under the imported SF.2 fundamental-class hypotheses, let D_X,D_Y be reduced relative effective Cartier divisors with f^−1(|D_Y|)=|D_X|. For the determinant construction assume the normal/smooth dense open and relative normal-crossings conditions of Pilloni 4.2.4.1(1); for the trace construction assume f finite flat as in (2). Then Θ sends O_X(−D_X) into f^!O_Y(−D_Y). Under an open base change or, in the finite-flat case, any base change for which the Cartier divisors remain Cartier, this boundary map agrees with the base-changed map.
Hypotheses: A determinant fundamental class over a nonflat general morphism is not declared compatible with arbitrary base change. The two construction hypotheses are kept separate.
Omitted because: Requires the SF.2 duality/fundamental-class, derived sheaf and cofinite DVR module/cohomology interfaces. The raw quotient and functional algebra above are native, not these geometric or sheaf-theoretic consequences.
Inputs: SchemeAndStackFoundations:key/coherent-duality, SchemeAndStackFoundations:SF.2, AlgebraicModuliForArithmeticGeometry:A0-extension/boundary-dual-functional, AlgebraicModuliForArithmeticGeometry:A0-extension/cartier-duality-restriction.

ramified_divisor_trace — theorem signature:
Let f:X→Y be finite flat between smooth varieties over a field, D⊂Y and D′⊂X smooth effective Cartier divisors with f^*D=nD′, n≥1. The canonical-bundle trace restricts to f_*ω_X(−(n−1)D′)→ω_Y. Restriction and adjunction give a compatible divisor map f_{D′*}(ω_{D′}⊗O_X(−nD′)|_{D′})→ω_D⊗O_Y(−D)|_D. These maps commute with ambient trace and quotient restriction.
Hypotheses: The pullback is the scheme-theoretic equality nD′, not equality of supports. Characteristic may divide n; the statement does not divide by n.
Omitted because: Requires the SF.2 duality/fundamental-class, derived sheaf and cofinite DVR module/cohomology interfaces. The raw quotient and functional algebra above are native, not these geometric or sheaf-theoretic consequences.
Inputs: AlgebraicModuliForArithmeticGeometry:A0-extension/cartier-duality-restriction, AlgebraicModuliForArithmeticGeometry:A0-extension/boundary-dual-functional, SchemeAndStackFoundations:SF.2/finite-formula, SchemeAndStackFoundations:SF.2/trace, tauceti:Algebra.trace_quotient_pow_mk.

KOCoefficients — omitted geometric extension or extra conclusion:
For a commutative ring O, an O-algebra K and O-module M, define KOCoefficients(M)=(K⊗_O M)/im(m↦1⊗m). For a discrete valuation ring O, fraction field K, uniformizer π and flat M this identifies with M⊗_O(K/O), and 0→M/πM→KOCoefficients(M)→KOCoefficients(M)→0 is exact with first map m↦π^−1⊗m and second map multiplication by π. Apply the same construction to a locally free coherent sheaf.
Hypotheses: Flatness is required for the exact identification and injection; the raw quotient construction exists for every M.
The native definition, API and three named tests appear above. Stack, relative-base, sheaf, exact-sequence or ramified-power consequences in this full statement require the actual suppliers; they are not implied by elaboration of the raw affine construction.

ko_cohomology_cofinite — theorem signature:
Let X be a proper flat finitely presented relative curve over a complete discrete valuation ring O with fraction field K, uniformizer π and residue field k, and let L be locally free coherent. Cohomology with L_{K/O} is zero above degree one; H¹(X,L_{K/O}) is π-divisible, and H⁰ and H¹ are cofinite O-modules. Here cofinite means their Matlis/Pontryagin dual under the appropriate K/O injective-cogenerator pairing is finitely generated. H⁰(X,L_{K/O})[π]≅H⁰(X_k,L_k), and H¹(X,L_{K/O})[π] is a quotient of H¹(X_k,L_k).
Hypotheses: Use proper finiteness, curve cohomological dimension, filtered-colimit compatibility and the exact coefficient sequence. Do not identify cofinite with finite cardinality.
Omitted because: Requires the SF.2 duality/fundamental-class, derived sheaf and cofinite DVR module/cohomology interfaces. The raw quotient and functional algebra above are native, not these geometric or sheaf-theoretic consequences.
Inputs: AlgebraicModuliForArithmeticGeometry:A0-extension/ko-coefficients, tauceti:TauCetiRoadmap/JacobianChallenge#layer-c-relative-coherent-cohomology-and-base-change, tauceti:TauCetiRoadmap/StableReduction#layer-2-coherent-curve-theory-duality-and-positivity, SchemeAndStackFoundations:SF.2/site-leray-spectral-sequence, SchemeAndStackFoundations:SF.2.

-/
