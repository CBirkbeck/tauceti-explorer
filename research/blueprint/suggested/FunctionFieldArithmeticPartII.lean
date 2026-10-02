/-
This file is not the roadmap and is not exhaustive. The roadmap document is
definitive. These signatures suggest Lean forms so that contributors and
reviewers converge on names and signatures. No implementation is claimed.

The native fragment uses the pinned invertible-sheaf and quotient-ring types.
The omission ledger below records signatures needing actual geometric types
from other roadmap owners. It does not replace them with assumed predicates.
This file was not compiled: no existing build at both pins was available.
-/

import TauCeti.AlgebraicGeometry.LineBundle.TensorProduct
import Mathlib.AlgebraicGeometry.Modules.Sheaf
import Mathlib.Algebra.Category.ModuleCat.Sheaf.Free
import Mathlib.CategoryTheory.Core
import Mathlib.RingTheory.AdjoinRoot
import Mathlib.RingTheory.RootsOfUnity.Basic
import TauCeti.Algebra.AlgebraicGroup.RootsOfUnity.Basic
import Mathlib.RingTheory.HopfAlgebra.MonoidAlgebra
import Mathlib.LinearAlgebra.TensorProduct.Basis
import Mathlib.Algebra.Polynomial.Monic
import Mathlib.Algebra.Polynomial.Degree.Operations

open CategoryTheory AlgebraicGeometry

noncomputable section
universe u

namespace TauCeti.RootStack

variable {X : Scheme.{u}}

-- A section is the native value of the module presheaf on the top open.
abbrev Section (L : TauCeti.AlgebraicGeometry.InvertibleSheaf X) :=
  Γ(L.obj, (⊤ : X.Opens))

abbrev mapSection {L M : TauCeti.AlgebraicGeometry.InvertibleSheaf X}
    (e : L ≅ M) (s : Section L) : Section M :=
  e.hom.hom.app (⊤ : X.Opens) s

def tensorPower (M : TauCeti.AlgebraicGeometry.InvertibleSheaf X) :
    ℕ → TauCeti.AlgebraicGeometry.InvertibleSheaf X
  | 0 => TauCeti.AlgebraicGeometry.InvertibleSheaf.trivial X
  | n + 1 => TauCeti.AlgebraicGeometry.InvertibleSheaf.tensorProduct (tensorPower M n) M

lemma tensorPower.zero (M : TauCeti.AlgebraicGeometry.InvertibleSheaf X) :
    tensorPower M 0 = TauCeti.AlgebraicGeometry.InvertibleSheaf.trivial X := by
  sorry

lemma tensorPower.succ (M : TauCeti.AlgebraicGeometry.InvertibleSheaf X) (n : ℕ) :
    tensorPower M (n + 1) =
      TauCeti.AlgebraicGeometry.InvertibleSheaf.tensorProduct (tensorPower M n) M := by
  sorry

def tensorPower.mapIso {M N : TauCeti.AlgebraicGeometry.InvertibleSheaf X}
    (n : ℕ) (e : M ≅ N) : tensorPower M n ≅ tensorPower N n := by
  sorry

-- tensorPower.test_zero
example (M : TauCeti.AlgebraicGeometry.InvertibleSheaf X) :
    tensorPower M 0 = TauCeti.AlgebraicGeometry.InvertibleSheaf.trivial X := by
  sorry

-- tensorPower.test_one
example (M : TauCeti.AlgebraicGeometry.InvertibleSheaf X) :
    Nonempty (tensorPower M 1 ≅ M) := by
  sorry

-- tensorPower.test_two
example (M : TauCeti.AlgebraicGeometry.InvertibleSheaf X) :
    Nonempty (tensorPower M 2 ≅
      TauCeti.AlgebraicGeometry.InvertibleSheaf.tensorProduct M M) := by
  sorry

-- A root-power step; its construction uses JAC-A's section tensor map.
-- This is not an alternative definition of the native tensor product.
def sectionPower.tensorStep (M : TauCeti.AlgebraicGeometry.InvertibleSheaf X)
    (n : ℕ) (t : Section M) (v : Section (tensorPower M n)) :
    Section (tensorPower M (n + 1)) := by
  sorry

def sectionPower (M : TauCeti.AlgebraicGeometry.InvertibleSheaf X)
    (n : ℕ) (t : Section M) : Section (tensorPower M n) := by
  sorry

lemma sectionPower.zero (M : TauCeti.AlgebraicGeometry.InvertibleSheaf X)
    (t : Section M) :
    sectionPower M 0 t =
      (SheafOfModules.freeSection (R := X.ringCatSheaf) PUnit.unit).val
        (Opposite.op (⊤ : X.Opens)) := by
  sorry

lemma sectionPower.succ (M : TauCeti.AlgebraicGeometry.InvertibleSheaf X)
    (n : ℕ) (t : Section M) :
    sectionPower M (n + 1) t = sectionPower.tensorStep M n t (sectionPower M n t) := by
  sorry

lemma sectionPower.mapIso {M N : TauCeti.AlgebraicGeometry.InvertibleSheaf X}
    (n : ℕ) (e : M ≅ N) (t : Section M) :
    mapSection (tensorPower.mapIso n e) (sectionPower M n t) =
      sectionPower N n (mapSection e t) := by
  sorry

-- sectionPower.test_zero
example (M : TauCeti.AlgebraicGeometry.InvertibleSheaf X) :
    sectionPower M 0 0 =
      (SheafOfModules.freeSection (R := X.ringCatSheaf) PUnit.unit).val
        (Opposite.op (⊤ : X.Opens)) := by
  sorry

-- sectionPower.test_one
example (M : TauCeti.AlgebraicGeometry.InvertibleSheaf X) (t : Section M) :
    mapSection (TauCeti.AlgebraicGeometry.InvertibleSheaf.tensorTrivialLeftIso M)
      (sectionPower M 1 t) = t := by
  sorry

-- sectionPower.test_zero_positive
example (M : TauCeti.AlgebraicGeometry.InvertibleSheaf X) (n : ℕ) [NeZero n] :
    sectionPower M n 0 = 0 := by
  sorry

structure RootObject (n : ℕ) [NeZero n]
    (L : TauCeti.AlgebraicGeometry.InvertibleSheaf X) (s : Section L) where
  line : TauCeti.AlgebraicGeometry.InvertibleSheaf X
  rootSection : Section line
  powerIso : tensorPower line n ≅ L
  section_eq : mapSection powerIso (sectionPower line n rootSection) = s

-- The equality fields are the defining equations of root data, not theorem
-- conclusions used as assumptions. All line and section types are native.
structure RootObject.iso {n : ℕ} [NeZero n]
    {L : TauCeti.AlgebraicGeometry.InvertibleSheaf X} {s : Section L}
    (a b : RootObject n L s) where
  lineIso : a.line ≅ b.line
  section_eq : mapSection lineIso a.rootSection = b.rootSection
  power_eq : tensorPower.mapIso n lineIso ≪≫ b.powerIso = a.powerIso

def RootObject.canonicalOne (L : TauCeti.AlgebraicGeometry.InvertibleSheaf X)
    (s : Section L) : RootObject 1 L s := by
  sorry

-- RootObject.mk and RootObject.line are the structure constructor/projection.
-- RootObject.test_one
example (L : TauCeti.AlgebraicGeometry.InvertibleSheaf X) (s : Section L)
    (a : RootObject 1 L s) :
    ∃! e : RootObject.iso a (RootObject.canonicalOne L s), True := by
  sorry

-- RootObject.test_zero
example (n : ℕ) [NeZero n] :
    ∃ a : RootObject n (TauCeti.AlgebraicGeometry.InvertibleSheaf.trivial X) 0,
      a.line = TauCeti.AlgebraicGeometry.InvertibleSheaf.trivial X ∧ a.rootSection = 0 := by
  sorry

-- RootObject.test_trivialization is stated in the native coordinate continuation
-- below. Generic tensor-section compatibility proofs remain JAC-A inputs.

section Affine
variable {A : Type u} [CommRing A]

def affineAction (f : A) (n : ℕ) [NeZero n] (ζ : rootsOfUnity n A) :
    AdjoinRoot (Polynomial.X ^ n - Polynomial.C f) ≃ₐ[A]
      AdjoinRoot (Polynomial.X ^ n - Polynomial.C f) := by
  sorry

lemma affineAction.root (f : A) (n : ℕ) [NeZero n] (ζ : rootsOfUnity n A) :
    affineAction f n ζ (AdjoinRoot.root (Polynomial.X ^ n - Polynomial.C f)) =
      algebraMap A _ ((ζ : Aˣ) : A) *
        AdjoinRoot.root (Polynomial.X ^ n - Polynomial.C f) := by
  sorry

lemma affineAction.constant (f a : A) (n : ℕ) [NeZero n] (ζ : rootsOfUnity n A) :
    affineAction f n ζ (algebraMap A _ a) = algebraMap A _ a := by
  sorry

lemma affineAction.mul (f : A) (n : ℕ) [NeZero n] (ζ ξ : rootsOfUnity n A) :
    affineAction f n (ζ * ξ) = (affineAction f n ζ).trans (affineAction f n ξ) := by
  sorry

-- affineAction.test_one
example (f : A) (n : ℕ) [NeZero n] :
    affineAction f n 1 = AlgEquiv.refl := by
  sorry

-- affineAction.test_sign
example (f : A) : ∃ ζ : rootsOfUnity 2 A,
    ((ζ : Aˣ) : A) = -1 ∧
    affineAction f 2 ζ (AdjoinRoot.root (Polynomial.X ^ 2 - Polynomial.C f)) =
      -AdjoinRoot.root (Polynomial.X ^ 2 - Polynomial.C f) := by
  sorry

-- affineAction.test_infinitesimal
example (p : ℕ) [Fact p.Prime] [NeZero p] [CharP A p]
    (ε : A) (hε : ε ^ 2 = 0) (hε0 : ε ≠ 0) (f : A) :
    ∃ ζ : rootsOfUnity p A, ((ζ : Aˣ) : A) = 1 + ε ∧ ζ ≠ 1 ∧
      affineAction f p ζ (AdjoinRoot.root (Polynomial.X ^ p - Polynomial.C f)) =
        algebraMap A _ (1 + ε) *
          AdjoinRoot.root (Polynomial.X ^ p - Polynomial.C f) := by
  sorry

-- Root-specific affine continuation. These abbreviations only name native
-- carriers; they do not construct another polynomial quotient or μ_n group.
open scoped TensorProduct

abbrev AffineRing (f : A) (n : ℕ) :=
  AdjoinRoot (Polynomial.X ^ n - Polynomial.C f)

abbrev MuHopf (R : Type u) [CommRing R] (n : ℕ) :=
  MonoidAlgebra R (Multiplicative (ZMod n))

-- TauCeti.RootStack.affineCoaction
def affineCoaction (f : A) (n : ℕ) [NeZero n] :
    AffineRing f n →ₐ[A] (MuHopf A n ⊗[A] AffineRing f n) := by
  sorry

lemma affineCoaction.root (f : A) (n : ℕ) [NeZero n] :
    affineCoaction f n (AdjoinRoot.root (Polynomial.X ^ n - Polynomial.C f)) =
      MonoidAlgebra.single (TauCeti.RootsOfUnityGroup.generator n) (1 : A) ⊗ₜ[A]
        AdjoinRoot.root (Polynomial.X ^ n - Polynomial.C f) := by
  sorry

lemma affineCoaction.constant (f a : A) (n : ℕ) [NeZero n] :
    affineCoaction f n (algebraMap A (AffineRing f n) a) =
      (1 : MuHopf A n) ⊗ₜ[A] algebraMap A (AffineRing f n) a := by
  sorry

lemma affineCoaction.unique (f : A) (n : ℕ) [NeZero n]
    (ψ : AffineRing f n →ₐ[A] (MuHopf A n ⊗[A] AffineRing f n))
    (hψ : ψ (AdjoinRoot.root (Polynomial.X ^ n - Polynomial.C f)) =
      MonoidAlgebra.single (TauCeti.RootsOfUnityGroup.generator n) (1 : A) ⊗ₜ[A]
        AdjoinRoot.root (Polynomial.X ^ n - Polynomial.C f)) :
    ψ = affineCoaction f n := by
  sorry

-- TauCeti.RootStack.affineCoaction.weight
lemma affineCoaction.weight (f : A) (n i : ℕ) [NeZero n] :
    affineCoaction f n ((AdjoinRoot.root (Polynomial.X ^ n - Polynomial.C f)) ^ i) =
      MonoidAlgebra.single (Multiplicative.ofAdd (i : ZMod n)) (1 : A) ⊗ₜ[A]
        (AdjoinRoot.root (Polynomial.X ^ n - Polynomial.C f)) ^ i := by
  sorry

-- TauCeti.RootStack.affineCoaction.counit
lemma affineCoaction.counit (f : A) (n : ℕ) [NeZero n] :
    ((Algebra.TensorProduct.lid A (AffineRing f n)).toAlgHom.comp
      (Algebra.TensorProduct.map (Bialgebra.counitAlgHom A (MuHopf A n))
        (AlgHom.id A (AffineRing f n)))).comp (affineCoaction f n) =
      AlgHom.id A (AffineRing f n) := by
  sorry

-- TauCeti.RootStack.affineCoaction.coassoc
lemma affineCoaction.coassoc (f : A) (n : ℕ) [NeZero n] :
    (Algebra.TensorProduct.assoc A A A (MuHopf A n) (MuHopf A n)
      (AffineRing f n)).toAlgHom.comp
      ((Algebra.TensorProduct.map (Bialgebra.comulAlgHom A (MuHopf A n))
        (AlgHom.id A (AffineRing f n))).comp (affineCoaction f n)) =
      (Algebra.TensorProduct.map (AlgHom.id A (MuHopf A n))
        (affineCoaction f n)).comp (affineCoaction f n) := by
  sorry

-- TauCeti.RootStack.affineCoaction.nativePoint
lemma affineCoaction.nativePoint (f : A) (n : ℕ) [NeZero n]
    (ζ : rootsOfUnity n A) :
    ((Algebra.TensorProduct.lid A (AffineRing f n)).toAlgHom.comp
      (Algebra.TensorProduct.map
        (((TauCeti.RootsOfUnityGroup.pointsMulEquiv (R := A) (A := A) n).symm ζ).ofConv)
        (AlgHom.id A (AffineRing f n)))).comp (affineCoaction f n) =
      (affineAction f n ζ).toAlgHom := by
  sorry

-- TauCeti.RootStack.affineCoaction.invariants
theorem affineCoaction.invariants (f : A) (n : ℕ) [NeZero n] (b : AffineRing f n) :
    affineCoaction f n b = (1 : MuHopf A n) ⊗ₜ[A] b ↔
      ∃ a : A, b = algebraMap A (AffineRing f n) a := by
  sorry

-- TauCeti.RootStack.affineCoaction.test_one
example (f : A) (b : AffineRing f 1) :
    affineCoaction f 1 b = (1 : MuHopf A 1) ⊗ₜ[A] b := by
  sorry

-- TauCeti.RootStack.affineCoaction.test_sign
example (f : A) :
    ∃ ζ : rootsOfUnity 2 A, ((ζ : Aˣ) : A) = -1 ∧
      (Algebra.TensorProduct.lid A (AffineRing f 2))
        (Algebra.TensorProduct.map
          (((TauCeti.RootsOfUnityGroup.pointsMulEquiv (R := A) (A := A) 2).symm ζ).ofConv)
          (AlgHom.id A (AffineRing f 2))
          (affineCoaction f 2 (AdjoinRoot.root (Polynomial.X ^ 2 - Polynomial.C f)))) =
        -AdjoinRoot.root (Polynomial.X ^ 2 - Polynomial.C f) := by
  sorry

-- TauCeti.RootStack.affineCoaction.test_characteristic_p
example (k : Type u) [Field k] (p : ℕ) [Fact p.Prime] [NeZero p] [CharP k p] :
    AdjoinRoot.root (Polynomial.X ^ p - Polynomial.C (0 : k)) ≠ 0 ∧
      affineCoaction (0 : k) p (AdjoinRoot.root (Polynomial.X ^ p - Polynomial.C (0 : k))) ≠
        (1 : MuHopf k p) ⊗ₜ[k]
          AdjoinRoot.root (Polynomial.X ^ p - Polynomial.C (0 : k)) ∧
      ∀ ζ : rootsOfUnity p k,
        affineAction (0 : k) p ζ (AdjoinRoot.root (Polynomial.X ^ p - Polynomial.C (0 : k))) =
          AdjoinRoot.root (Polynomial.X ^ p - Polynomial.C (0 : k)) := by
  sorry

-- Invariant theorem acceptance: a nonreduced coefficient ring is allowed.
example (f : A) (b : AffineRing f 2) :
    affineCoaction f 2 b = (1 : MuHopf A 2) ⊗ₜ[A] b ↔
      ∃ a : A, b = algebraMap A (AffineRing f 2) a := by
  sorry

-- Invariant theorem acceptance: the zero-ring case has no artificial degree premise.
example [Subsingleton A] (f : A) (n : ℕ) [NeZero n] (b : AffineRing f n) :
    affineCoaction f n b = (1 : MuHopf A n) ⊗ₜ[A] b ∧
      ∃ a : A, b = algebraMap A (AffineRing f n) a := by
  sorry

end Affine
end TauCeti.RootStack

/-
Exact omission ledger for LEAN-GEOMETRY and LEAN-SECTION-COMP.
The statements below are mathematical obligations, not Lean declarations.
No missing carrier or theorem is encoded as an arbitrary Prop assumption.

Node FunctionFieldArithmeticPartII:key/root-stacks
For n≥1 and a line bundle with section (L,s) on a scheme X or an algebraic stack X, define
√[n]{(L,s)/X} on T→X as the groupoid of root objects of (L_T,s_T). Pullback and its coherent
isomorphisms define the fibred stack. For an effective Cartier divisor D use (O_X(D),s_D). Arbitrary
exponents use the fppf topology; the étale description is asserted only when n is invertible.
API TauCeti.RootStack.rootStack.object: The fibre over T→X is exactly the root-object groupoid of (L_T,s_T).
API TauCeti.RootStack.rootStack.forget: Forget root data to the base T→X.
API TauCeti.RootStack.rootStack.baseChange: A base morphism induces pullback of root data with identity/composition coherence.
API TauCeti.RootStack.rootStack.universalRoot: The stack carries the universal line bundle, section and n-th-power isomorphism; maps into it are
equivalent to such root data.
Example TauCeti.RootStack.rootStack.test_exponent_one: The n=1 stack is equivalent to X over X.
Example TauCeti.RootStack.rootStack.test_unit_section: For (O_X,1), every exponent gives a stack equivalent to X.
Example TauCeti.RootStack.rootStack.test_zero_section: Over an algebraically closed field, (O,0) at invertible n>1 has μ_n automorphisms and is not the
coarse point.
Example TauCeti.RootStack.rootStack.test_stack_base: At n=1 over BG the output is BG, rather than Spec k.

Node FunctionFieldArithmeticPartII:RS.1/two-pullback
Let A=[A¹/G_m] classify a line bundle with section and [n]:A→A take its n-th tensor power. The root
stack is X×_{A,[n]}A with its universal root. For a stack base this is a two-fibre product,
including the specified isomorphism, not an equality pullback of coarse points.

Node FunctionFieldArithmeticPartII:RS.1/base-change
For any f:Y→X there is a canonical equivalence Y×_X√[n]{(L,s)/X}≃√[n]{(f*L,f*s)/Y}, compatible with
identity and composition of f.

Node FunctionFieldArithmeticPartII:RS.1/affine-chart
If X=Spec A and (L,s) is trivialized with s=f, then √[n]{(L,s)/X}≃[Spec AdjoinRoot(Tⁿ−f)/μ_n], with
the diagonalizable action already constructed. This is a quotient stack with torsors, not an orbit
set.

Node FunctionFieldArithmeticPartII:RS.1/closed-fibre
For a geometric point x with s(x)=0, the full fibre is [Spec κ(x)[t]/tⁿ /μ_n]. Its reduction is
Bμ_n. If s(x)≠0 the fibre is the point. For n>1 the full closed fibre must not be identified with
its reduced gerbe.

Node FunctionFieldArithmeticPartII:RS.1/coarse-space
For a scheme base X, the projection of the root stack to X is its coarse-space morphism. For an
algebraic-stack base, it is relative coarse over X: after scheme base change it has the preceding
coarse property. It is not an assertion that X is an absolute algebraic space.

Node FunctionFieldArithmeticPartII:RS.1/regular-dm
If X is regular and D is a regular effective Cartier divisor, √[n]{(O(D),s_D)/X} is regular; when n
is invertible on X it is Deligne–Mumford with μ_n inertia over D and trivial inertia outside D. If a
geometric branch point has characteristic dividing n, its μ_n inertia is not étale, so the stack is
not DM there. An empty divisor still gives X in every characteristic.

Node FunctionFieldArithmeticPartII:RS.2/transition
For positive m,n the transition √[mn]{(L,s)}→√[n]{(L,s)} sends (M,t,φ) to (Mᵐ,tᵐ,φ), using the
coherent identification (Mᵐ)ⁿ≅Mᵐⁿ. Transitions are compatible with base change and with
multiplication of positive integers.
API TauCeti.RootStack.transition.object: The root line and section become Mᵐ and tᵐ.
API TauCeti.RootStack.transition.one: The m=1 transition is the identity.
API TauCeti.RootStack.transition.comp: Transitions for a and b compose to the transition for ab with the specified coherence.
Example TauCeti.RootStack.transition.test_identity: Transition from n to n is identity.
Example TauCeti.RootStack.transition.test_four_to_two: A fourth root (M,t) maps to the square root (M²,t²).
Example TauCeti.RootStack.transition.test_base_change: Pulling a transition back to Y gives the transition of the pulled-back section.

Node FunctionFieldArithmeticPartII:RS.2/infinite-root-stack
Define √[∞]{(L,s)/X} as the two-inverse limit of the finite root stacks indexed by positive integers
ordered by divisibility. Its objects over T are compatible finite root objects with transition
isomorphisms satisfying cocycles; its arrows are compatible systems of root isomorphisms. It is a
fibred stack, not asserted to be an algebraic stack of finite type.
API TauCeti.RootStack.infiniteRootStack.projection: Project a coherent system to its n-th root.
API TauCeti.RootStack.infiniteRootStack.lift: A compatible family of maps into the finite roots determines a map into the two-limit, with
compatible 2-morphisms.
API TauCeti.RootStack.infiniteRootStack.baseChange: The two-limit commutes with base change in X.
Example TauCeti.RootStack.infiniteRootStack.test_unit_section: The infinite root of (O_X,1) is X.
Example TauCeti.RootStack.infiniteRootStack.test_projection: Its n-th projection followed by a finite transition is the corresponding lower projection.
Example TauCeti.RootStack.infiniteRootStack.test_coherence: Choosing unrelated n-th roots without transition isomorphisms does not define an infinite root
object.

Node FunctionFieldArithmeticPartII:RS.2/infinite-base-change
For f:Y→X the canonical map √[∞]{(f*L,f*s)/Y}→Y×_X√[∞]{(L,s)/X} is an equivalence, compatible with
every finite projection.

Node FunctionFieldArithmeticPartII:RS.2/dvr-roots
For a DVR A with uniformizer π and closed divisor D, the n-th root is [Spec A[t]/(tⁿ−π)/μ_n].
Replacing π by uπ gives a canonically equivalent stack as a root of the same Cartier pair; it does
not require choosing an n-th root of u in A.

Node FunctionFieldArithmeticPartII:RS.2/dvr-infinite-gerbe
The reduced closed fibre of the infinite root of a DVR with residue field k is the inverse system of
the root gerbes of the normal line, banded by lim_n μ_n=Ẑ(1). It is noncanonically equivalent to
B_kẐ(1); a chosen trivialization of the normal line gives a compatible neutralization. The
neutralization is not part of the canonical root stack.

Node FunctionFieldArithmeticPartII:RS.2/dvr-kummer-classes
After choosing a neutralization, the isomorphism classes of k-points of the infinite reduced DVR
gerbe identify with H¹_fppf(k,Ẑ(1)) and lim_n k×/(k×)ⁿ. This is an identification of isomorphism
classes with a chosen origin; the full groupoid still has Ẑ(1)(k) automorphisms.

Node FunctionFieldArithmeticPartII:GC.0/root-picard
Pic_X^√R(S) is the groupoid of (L,K_R,ι), where L is a line bundle on X×S, K_R a line bundle on R×S
and ι:K_R²≅L|_{R×S}. Its degree-d component imposes degree d on every geometric fibre; d ranges over
all integers. Tensor product and dual give the graded commutative Picard stack.
API TauCeti.RamifiedClassField.rootPicard.object: Create (L,K_R,ι) from the two line bundles and the square identification.
API TauCeti.RamifiedClassField.rootPicard.degree: The degree is the fibrewise degree of L, additive under tensor product.
API TauCeti.RamifiedClassField.rootPicard.tensor: Tensor two objects and their root identifications; dual gives inverse up to coherent isomorphism.
API TauCeti.RamifiedClassField.rootPicard.forget: Forget K_R,ι to the ordinary Picard stack.
Example TauCeti.RamifiedClassField.rootPicard.test_empty_R: At R=∅ this is the ordinary graded Picard stack.
Example TauCeti.RamifiedClassField.rootPicard.test_degree_minus_one: Negative-degree components contain line bundles and are not declared empty.
Example TauCeti.RamifiedClassField.rootPicard.test_stabilizer: Over an algebraically closed field with r geometric branch points, forgetting roots has relative
stabilizer μ₂^r.

Node FunctionFieldArithmeticPartII:GC.0/square-action-quotient
Let Pic_{X,R} classify (L,γ:L|_R≅O_R). Then Pic_X^√R≃[Pic_{X,R}/[2]Res_{R/k}G_m], where the acting
group changes the rigidification through its square. The forgetful morphism to Pic_X is a
Res_{R/k}μ₂-gerbe.

Node FunctionFieldArithmeticPartII:GC.0/root-picard-section
Pic_X^{√R;√R}(S) additionally carries α_R∈Γ(R×S,K_R). It does not carry a global section of L. The
zero root section is allowed.
API TauCeti.RamifiedClassField.rootPicardSection.object: Adjoin α_R to a root-Picard object, including α_R=0.
API TauCeti.RamifiedClassField.rootPicardSection.forget: Forget α_R to Pic_X^√R.
API TauCeti.RamifiedClassField.rootPicardSection.squareEvaluation: The squared section ι(α_R²) lies in L|_R.
Example TauCeti.RamifiedClassField.rootPicardSection.test_zero: Every root-Picard object admits the zero root section.
Example TauCeti.RamifiedClassField.rootPicardSection.test_empty_R: At R=∅ the forgetful map is an equivalence.
Example TauCeti.RamifiedClassField.rootPicardSection.test_weights: In the rigidified quotient α_R has weight one while the rigidification has weight two.

Node FunctionFieldArithmeticPartII:GC.1/root-symmetric-space
For d≥0 let hatX_d^√R classify (L,K_R,ι,a,α_R) of degree d with a∈Γ(X×S,L) and ι(α_R²)=a|_{R×S}.
Define X_d^√R as the open where a is nonzero on every geometric fibre, and U_d^√R as the inverse
image of Sym^d(X−R). Hat spaces admit zero global sections and nonreduced bases.
API TauCeti.RamifiedClassField.rootSymmetricPower.hatObject: Construct a hat object from the five data and the restriction equation.
API TauCeti.RamifiedClassField.rootSymmetricPower.effectiveOpen: The open X_d consists exactly of sections nonzero on every geometric fibre.
API TauCeti.RamifiedClassField.rootSymmetricPower.forgetRoot: Forgetting the root line and section maps to the ordinary degree-d section space.
API TauCeti.RamifiedClassField.rootSymmetricPower.awayFromR: On divisors disjoint from R the root-forgetting map is an equivalence.
Example TauCeti.RamifiedClassField.rootSymmetricPower.test_d_zero: At d=0 the effective space is Spec k; the section nowhere vanishes.
Example TauCeti.RamifiedClassField.rootSymmetricPower.test_empty_R: At R=∅ the effective space is Sym^d X.
Example TauCeti.RamifiedClassField.rootSymmetricPower.test_closed_fibre: Over a divisor containing a branch point the full fibre has the nilpotent root chart, rather than
only Bμ₂.
Example TauCeti.RamifiedClassField.rootSymmetricPower.test_hat_zero: The hat degree-d space admits a=0 and α_R=0 for any root-Picard object in that degree.

Node FunctionFieldArithmeticPartII:GC.1/evaluation-pullback
The root symmetric-power stack is the two-pullback of the ordinary evaluation map to [Res_R A¹/Res_R
G_m] along its square-power map. Over a splitting field the latter is a product of copies of
[A¹/G_m], one for each geometric point of R.

Node FunctionFieldArithmeticPartII:GC.1/incidence-transversality
After splitting R, in Sym^d X each incidence divisor D_x of effective divisors containing x is
smooth, and intersections for a subset I of distinct branch points identify with Sym^{d−|I|}X when
d≥|I|, with codimension |I|; the intersection is empty when d<|I|.

Node FunctionFieldArithmeticPartII:GC.1/evaluation-smooth-criterion
For a smooth Z over the algebraically closed base, a map Z→[A^r/G_m^r] given by r line bundles with
sections is smooth exactly when their zero divisors are smooth and meet transversely, including the
empty strata.

Node FunctionFieldArithmeticPartII:GC.1/root-symmetric-smooth
The effective root symmetric power X_d^√R is smooth over k of dimension d and is DM. Its evaluation
map to [Res_R A¹/Res_R G_m] is smooth.

Node FunctionFieldArithmeticPartII:GC.1/root-symmetric-coarse
The root-forgetting projection X_d^√R→Sym^d X is its coarse-space morphism and is an equivalence
over Sym^d(X−R).

Node FunctionFieldArithmeticPartII:GC.1/root-addition
For d,e≥0 tensor L and K_R and multiply both sections to define
hatadd_{d,e}:hatX_d^√R×hatX_e^√R→hatX_{d+e}^√R. Restriction gives addition on the effective opens;
the same construction gives effective-divisor translation of the hat space.
API TauCeti.RamifiedClassField.rootAddition.object: Root addition tensors line bundles and multiplies sections.
API TauCeti.RamifiedClassField.rootAddition.unit: Adding the degree-zero unit object gives the original divisor.
API TauCeti.RamifiedClassField.rootAddition.coherence: Associativity and symmetry are the imported coherent tensor isomorphisms, with the same section
equations.
Example TauCeti.RamifiedClassField.rootAddition.test_empty: Adding two empty divisors gives the empty divisor.
Example TauCeti.RamifiedClassField.rootAddition.test_ordinary: At R=∅ this is ordinary symmetric-power addition.
Example TauCeti.RamifiedClassField.rootAddition.test_branch_section: Two zero root-section values multiply to zero, rather than cancel or become nonzero.

Node FunctionFieldArithmeticPartII:GC.1/ordered-divisors
Iterated addition defines p_d:(X_1^√R)^d→X_d^√R, with its S_d-equivariance and the degree-zero unit
map.
API TauCeti.RamifiedClassField.orderedRootDivisors.one: p_1 is the identity.
API TauCeti.RamifiedClassField.orderedRootDivisors.permutation: Every σ∈S_d acts on the source and p_d is equivariant with coherent target isomorphisms.
API TauCeti.RamifiedClassField.orderedRootDivisors.blockAddition: Concatenating ordered tuples agrees with root addition after their separate p_d maps.
Example TauCeti.RamifiedClassField.orderedRootDivisors.test_zero: p_0 maps the point to the empty root divisor.
Example TauCeti.RamifiedClassField.orderedRootDivisors.test_one: p_1 is identity on the root curve.
Example TauCeti.RamifiedClassField.orderedRootDivisors.test_collision: p_2 is not representable at two equal branch points: its relative inertia contains diagonal μ₂.

Node FunctionFieldArithmeticPartII:GC.1/ordered-proper
The ordered map p_d is proper and quasi-finite in the nonrepresentable stack sense; the generic
distinct-point locus is an S_d-cover. Its finite relative stabilizers are tame μ₂-products. No
representably finite morphism is asserted at branch collisions.

Node FunctionFieldArithmeticPartII:GC.1/root-abel-jacobi
Define hatAJ_d:hatX_d^√R→Pic_X^√R,d by forgetting a and α_R, and the refined map retaining α_R to
Pic_X^{√R;√R,d}. Restrict the first map to AJ_d:X_d^√R→Pic_X^√R,d. Addition commutes with the
product AJ_d×AJ_e and Picard tensor multiplication.
API TauCeti.RamifiedClassField.rootAbelJacobi.hat: The hat map forgets both sections and retains the two root line bundles and ι.
API TauCeti.RamifiedClassField.rootAbelJacobi.refined: The refined map forgets a and retains α_R.
API TauCeti.RamifiedClassField.rootAbelJacobi.addition: AJ_{d+e}∘add≅mult∘(AJ_d×AJ_e).
Example TauCeti.RamifiedClassField.rootAbelJacobi.test_empty_R: At R=∅ the effective map is the ordinary Abel–Jacobi map to Pic^d.
Example TauCeti.RamifiedClassField.rootAbelJacobi.test_zero: At d=0 the effective point maps to the tensor unit.
Example TauCeti.RamifiedClassField.rootAbelJacobi.test_hat_zero: A zero global section still has a defined hatAJ image.

Node FunctionFieldArithmeticPartII:GC.2/root-units
At x∈R let O_{√x}×={(u,v)∈O_x××k(x)× : ū=v²}, with componentwise multiplication. For x∉R use O_x×.
Let O_{√R}× be their product. Its map to adelic units forgets v and has kernel ∏_{x∈R}μ₂(k(x)); do
not assume it is injective.
API TauCeti.RamifiedClassField.rootUnits.mk: Create (u,v) with ū=v².
API TauCeti.RamifiedClassField.rootUnits.forget: Project to u in O_x× and to the corresponding idele unit.
API TauCeti.RamifiedClassField.rootUnits.kernel: The kernel consists of u=1 and v²=1.
Example TauCeti.RamifiedClassField.rootUnits.test_empty_R: At R=∅ the product is the ordinary unit product.
Example TauCeti.RamifiedClassField.rootUnits.test_minus_one: At a ramified place, (1,−1) is a nontrivial kernel element.
Example TauCeti.RamifiedClassField.rootUnits.test_nonsquare: A unit with nonsquare residue has no lift to this group.

Node FunctionFieldArithmeticPartII:GC.2/adelic-root-groupoid
There is an equivalence Pic_X^√R(k)≃F×\A_F×/O_{√R}× as a double-action groupoid. The right action
uses the actual noninjective homomorphism to idele units. Degree and all stabilizers are retained.
At x∉R, π_x⁻¹ represents O_X(x)^♮.

Node FunctionFieldArithmeticPartII:GC.2/root-divisor-groupoid
The groupoid of root divisors used in §6.2.3 is the effective open X_d^√R(k) with its root data and
automorphisms; forgetting the root gives the ordinary divisor. The character on differences of such
objects is evaluated through the adelic root-Picard equivalence, not through an unweighted set
bijection.

Node FunctionFieldArithmeticPartII:GC.3/tame-local-systems
Rank-one Q̄ℓ-local systems L on X_1^√R correspond to rank-one tame local systems on U=X−R whose
geometric inertia characters have order dividing two. Their global monodromy can have arbitrary
order; in particular an unramified character of order three is allowed.

Node FunctionFieldArithmeticPartII:GC.3/symmetric-local-system
For L as above and d≥0 define K_d=(p_{d,!}L^{⊠d})^{S_d} with no shift, and L_d=H⁰(K_d). The
collision and middle-extension lemmas prove K_d≅L_d, with L_d lisse rank one and L_d[d] perverse.
The invariant projector is d!⁻¹Σσ over Q̄ℓ, including when ℓ divides d!.
API TauCeti.RamifiedClassField.symmetricLocalSystem.zero: L_0 is the coefficient line on Spec k.
API TauCeti.RamifiedClassField.symmetricLocalSystem.one: L_1=L under p_1=id.
API TauCeti.RamifiedClassField.symmetricLocalSystem.invariantProjector: L_d is the image of d!⁻¹Σσ on the unshifted p_{d,!}L^{⊠d}.
API TauCeti.RamifiedClassField.symmetricLocalSystem.perverseShift: L_d[d] is the perverse intermediate extension from the distinct-point open.
Example TauCeti.RamifiedClassField.symmetricLocalSystem.test_zero: The zeroth symmetric local system is the coefficient line in degree zero.
Example TauCeti.RamifiedClassField.symmetricLocalSystem.test_one: The first symmetric local system is L in degree zero.
Example TauCeti.RamifiedClassField.symmetricLocalSystem.test_shift: At d=1 the complex L[1] is perverse, while L is the unshifted lisse sheaf.
Example TauCeti.RamifiedClassField.symmetricLocalSystem.test_order_three: An unramified order-three character still gives this construction.

Node FunctionFieldArithmeticPartII:GC.3/collision-kernel
At a geometric divisor Σm_x x, the relative inertia of the ordered map over a branch point x is
ker(μ₂^{m_x}→μ₂). It acts trivially on L_x^{⊗m_x}, since the same rank-one character occurs in every
factor.

Node FunctionFieldArithmeticPartII:GC.3/middle-extension
The rational invariant object (p_{d,!}L^{⊠d}[d])^{S_d} is the perverse intermediate extension of the
distinct-point local system. Its unshifted stalks have no higher relative cohomology because the
relative fibres are finite tame groupoids with rational coefficients.

Node FunctionFieldArithmeticPartII:GC.3/collision-descent
L_d is a rank-one local system on all of X_d^√R, including repeated branch divisors.

Node FunctionFieldArithmeticPartII:GC.3/cohomology-vanishing
If L is geometrically nontrivial on the proper root curve, H⁰(X_1^√R_kbar,L)=H²(X_1^√R_kbar,L)=0;
its cohomology is concentrated in degree one.

Node FunctionFieldArithmeticPartII:GC.3/koszul-exterior
For a vector space V concentrated in cohomological degree one, the S_d-invariants of its d-fold
graded tensor power are ∧^dV in degree d. The permutation action includes the Koszul sign, so this
is the exterior rather than the ordinary symmetric power.

Node FunctionFieldArithmeticPartII:GC.3/exterior-cohomology
For geometrically nontrivial L, H^i(X_d^√R_kbar,L_d)=0 for i≠d, and H^d≅∧^dH¹(X_1^√R_kbar,L),
naturally and Frobenius-equivariantly. This includes d=0; exterior powers vanish for d above dim H¹.

Node FunctionFieldArithmeticPartII:GC.3/multiplicity-free-product
On the locus where the two effective divisors have mutually disjoint support away from R,
add*L_{d+e}≅L_d⊠L_e by concatenating the tensor lines on ordered divisors.

Node FunctionFieldArithmeticPartII:GC.3/symmetric-multiplicativity
The distinct-point isomorphism extends uniquely to α_{d,e}:add*L_{d+e}≅L_d⊠L_e on X_d^√R×X_e^√R.

Node FunctionFieldArithmeticPartII:GC.3/symmetric-associativity
For d,e,f≥0 the two composites of α_{d,e}, α_{d+e,f} and α_{e,f}, α_{d,e+f} agree after the
specified tensor/addition associators.

Node FunctionFieldArithmeticPartII:GC.3/symmetric-symmetry
The α_{d,e} isomorphisms commute with exchanging d,e and with the ordinary symmetry of rank-one
sheaves; α_{0,d} and α_{d,0} are the canonical unit isomorphisms.

Node FunctionFieldArithmeticPartII:GC.4/evaluation-surjective
If d≥ρ+max(2g−1,1), then for a degree-d line bundle L, H¹(X,L(−R))=0. In families, π_*L and π_*L(−R)
are vector bundles of ranks d−g+1 and d−ρ−g+1, commute with base change, and π_*L→π_*(L|_R) is
surjective.

Node FunctionFieldArithmeticPartII:GC.4/affine-fibre-chart
At a fixed geometric root-Picard object (L,K_R,ι), the two-fibre of AJ_d is M=H⁰(X,L) minus
{0}×_{H⁰(R,L|_R)}H⁰(R,K_R), with the second map α↦ι(α²). For ρ>0 and the degree bound, a splitting
of evaluation identifies M≃A^n minus {0}, n=d−g+1. Scaling K_R by λ and L by λ² gives weights two on
n−ρ coordinates and one on ρ coordinates.

Node FunctionFieldArithmeticPartII:GC.4/weighted-cover
For n≥ρ+1 and ρ≥1, set a=n−ρ. The coordinate map [x₁,…,x_a,y₁,…,y_ρ]↦[x₁²,…,x_a²,y₁,…,y_ρ] defines a
finite cover P^{n−1}→[A^n minus {0}/G_m], with weights (2^a,1^ρ). Its generic Galois group is μ₂^a.

Node FunctionFieldArithmeticPartII:GC.4/weighted-ramification
A proper subgroup Γ⊊μ₂^a gives an intermediate cover of the weighted quotient that is ramified along
at least one coordinate divisor x_i=0 in a chart where a weight-one coordinate y_ρ is nonzero. Hence
such an intermediate cover cannot be finite étale.

Node FunctionFieldArithmeticPartII:GC.4/weighted-simply-connected
The weighted quotient [A^n minus {0}/G_m] with weights (2^{n−ρ},1^ρ), ρ≥1 and n≥ρ+1, has no
nontrivial connected finite étale cover. Thus every rank-one lisse Q̄ℓ-local system on it is
geometrically constant.

Node FunctionFieldArithmeticPartII:GC.4/fibre-triviality
Under the high-degree bound and ρ>0, L_d restricts to a constant sheaf on each geometric two-fibre M
of AJ_d.

Node FunctionFieldArithmeticPartII:GC.4/empty-ramification-descent
When R=∅ and d≥max(2g−1,1), the symmetric local system descends along the ordinary Abel–Jacobi map
to the degree-d Picard stack. The ordinary scalar action has weight one; the projective fibre
quotient is P^{d−g}.

Node FunctionFieldArithmeticPartII:GC.4/high-degree-descent
For d≥ρ+max(2g−1,1), L_d descends to a rank-one local system L_d^Pic on Pic_X^√R,d with
AJ_d*L_d^Pic≅L_d. Descent and its comparison are unique up to the canonical isomorphism compatible
with pullback; the pullback functor is fully faithful in this setting.

Node FunctionFieldArithmeticPartII:GC.5/auxiliary-divisors
For every integer d and bound B there exists an effective divisor D on U=X−R with d+deg D≥B. The
construction requires no rational point of degree one. For two choices D,E, a common effective
enlargement is D+E.

Node FunctionFieldArithmeticPartII:GC.5/divisor-tensor-line
For an effective D=Σn_x x supported on U, define the Frobenius line L_D as the tensor product of the
fibres of L over all geometric points above x, each repeated n_x times, with its Frobenius
permutation descent. This is the value of L_{deg D} at the canonical root divisor O(D)^♮.
API TauCeti.RamifiedClassField.divisorTensorLine.zero: L_0 is the coefficient line.
API TauCeti.RamifiedClassField.divisorTensorLine.sum: L_{D+E}≅L_D⊗L_E with the inherited tensor coherence.
API TauCeti.RamifiedClassField.divisorTensorLine.closedPoint: The Frobenius action for a closed point is the cyclic permutation with its local Frobenius action.
Example TauCeti.RamifiedClassField.divisorTensorLine.test_empty: The empty divisor gives Q̄ℓ.
Example TauCeti.RamifiedClassField.divisorTensorLine.test_rational: For a rational point x outside R the line is L_x.
Example TauCeti.RamifiedClassField.divisorTensorLine.test_degree_two: For a degree-two closed point the line is the tensor of both conjugate fibres with Frobenius
descent.

Node FunctionFieldArithmeticPartII:GC.5/translate-high-degree
If D is effective away from R and both d and d+deg D satisfy the high-degree bound, there is a
canonical isomorphism t_D*L_{d+deg D}^Pic≅L_d^Pic⊗L_D.

Node FunctionFieldArithmeticPartII:GC.5/all-degree-extension
For d∈Z choose effective D⊂U with d+deg D≥B=ρ+max(2g−1,1) and set L_d^Pic=t_D*L_{d+deg D}^Pic⊗L_D⁻¹.
The comparison and cocycle lemmas identify different choices canonically; the resulting graded sheaf
is L^Pic on the whole root Picard stack.
API TauCeti.RamifiedClassField.picardCharacter.component: The degree-d component is the normalized translated high-degree sheaf.
API TauCeti.RamifiedClassField.picardCharacter.comparison: The sheaves from two effective choices are canonically isomorphic through their common enlargement.
API TauCeti.RamifiedClassField.picardCharacter.translation: t_D*L_{d+deg D}^Pic≅L_d^Pic⊗L_D for every d and effective D away from R.
Example TauCeti.RamifiedClassField.picardCharacter.test_negative_degree: The construction gives a sheaf on degree −1 without choosing a degree-one rational point.
Example TauCeti.RamifiedClassField.picardCharacter.test_common_sum: The comparisons through D+E agree with comparisons through further effective enlargements.
Example TauCeti.RamifiedClassField.picardCharacter.test_high_degree: Above B it agrees with the original high-degree descent.

Node FunctionFieldArithmeticPartII:GC.5/choice-comparison
For effective D,E giving high degrees, the two constructions of L_d^Pic are canonically identified
by translating each once more to the high degree d+deg D+deg E and using L_{D+E}≅L_D⊗L_E.

Node FunctionFieldArithmeticPartII:GC.5/choice-cocycle
For any three effective choices D,E,F the canonical comparison D→E followed by E→F is the comparison
D→F. Comparisons are unchanged by further common effective enlargement.

Node FunctionFieldArithmeticPartII:GC.5/effective-pullback
For every d≥0, AJ_d*L_d^Pic≅L_d canonically. Choose an effective D away from R reaching B; the
translated comparison and multiplication cancel L_D.

Node FunctionFieldArithmeticPartII:GC.5/unit-trivialization
At the root-Picard tensor unit e, the pullback e*L^Pic is canonically Q̄ℓ, via the degree-zero
effective Abel–Jacobi comparison.

Node FunctionFieldArithmeticPartII:GC.5/high-degree-multiplication
For d,e≥B, mult*L_{d+e}^Pic≅L_d^Pic⊠L_e^Pic on the product Pic^√R,d×Pic^√R,e. The pullback
comparison uses AJ_d×AJ_e, not AJ_{d+e}.

Node FunctionFieldArithmeticPartII:GC.5/all-degree-multiplication
For all d,e∈Z there is a canonical isomorphism μ_{d,e}:mult*L_{d+e}^Pic≅L_d^Pic⊠L_e^Pic. It is the
high-degree isomorphism transported by independent effective divisors D,E and normalized using
L_{D+E}≅L_D⊗L_E.

Node FunctionFieldArithmeticPartII:GC.5/character-associativity
For all integers d,e,f, the two composites of μ for the three-degree product agree under the Picard
and sheaf associators.

Node FunctionFieldArithmeticPartII:GC.5/character-symmetry-unit
The multiplication μ_{d,e} commutes with exchanging factors, and its restrictions along e×id and
id×e are the identity unit maps after the canonical unit trivialization.

Node FunctionFieldArithmeticPartII:GC.5/hat-character-pullback
For every integer degree in which the hat section moduli problem is defined, set
hatL_d=hatAJ_d*L_d^Pic. On the effective open it is canonically L_d for d≥0. This is a pullback
along the entire hat map, so its zero-section stalks remain rank one.
API TauCeti.RamifiedClassField.hatCharacter.definition: hatL_d is exactly hatAJ_d*L_d^Pic.
API TauCeti.RamifiedClassField.hatCharacter.effective: Its restriction to the effective open is canonically L_d.
API TauCeti.RamifiedClassField.hatCharacter.zeroSection: At a zero global section its stalk is the character line of the underlying root-Picard object.
Example TauCeti.RamifiedClassField.hatCharacter.test_effective: The restriction agrees with the unshifted degree-zero symmetric local system.
Example TauCeti.RamifiedClassField.hatCharacter.test_zero: The zero-section stalk is rank one, not zero.
Example TauCeti.RamifiedClassField.hatCharacter.test_degree_zero: At the effective empty divisor it is the coefficient line with the canonical unit.

Node FunctionFieldArithmeticPartII:GC.6/root-multiplicative-sheaf
On X_et define G_m,X^√R=G_m,X×_{i_*G_m,R,[2]}i_*G_m,R. Its sections are pairs (u,v) of a unit and a
root unit on R satisfying u|_R=v². Its torsor stack is the root Picard stack.
API TauCeti.RamifiedClassField.rootMultiplicativeSheaf.sections: Its sections are exactly (u,v) with u|_R=v².
API TauCeti.RamifiedClassField.rootMultiplicativeSheaf.forget: Forget v to G_m,X.
API TauCeti.RamifiedClassField.rootMultiplicativeSheaf.torsors: Its torsor stack is Pic_X^√R.
Example TauCeti.RamifiedClassField.rootMultiplicativeSheaf.test_empty_R: At R=∅ this is G_m,X.
Example TauCeti.RamifiedClassField.rootMultiplicativeSheaf.test_kernel: The forgetful kernel on R is μ₂.
Example TauCeti.RamifiedClassField.rootMultiplicativeSheaf.test_nonadditive: For odd-characteristic residue rings the square map is multiplicative but does not define an
additive ring map.

Node FunctionFieldArithmeticPartII:GC.6/norm-residue-square
For the smooth geometrically connected double cover ν:X′→X with reduced ramification R′≃R and
involution σ, restriction of Nm(u) to R is (u|_{R′})². For a line bundle L′, Nm(L′)|_R≅(L′|_{R′})²
canonically.

Node FunctionFieldArithmeticPartII:GC.6/root-norm
The sheaf map Nm^√R=(Nm,r_{R′}):ν_*G_m,X′→G_m,X^√R induces the root norm Pic_X′→Pic_X^√R, sending L′
to (Nm L′,L′|_{R′},ι). It lifts the ordinary norm and respects tensor products.
API TauCeti.RamifiedClassField.rootNorm.object: The object is (Nm L′,L′|_{R′},ι).
API TauCeti.RamifiedClassField.rootNorm.forget: Forgetting roots gives the ordinary norm.
API TauCeti.RamifiedClassField.rootNorm.tensor: Root norm preserves tensor product with the canonical coherent norm isomorphism.
API TauCeti.RamifiedClassField.rootNorm.baseChange: It commutes with admissible base changes of the double cover.
Example TauCeti.RamifiedClassField.rootNorm.test_trivial: The trivial upstairs line maps to the root-Picard tensor unit.
Example TauCeti.RamifiedClassField.rootNorm.test_branch: Its chosen root at a branch point is precisely the upstairs fibre of L′.
Example TauCeti.RamifiedClassField.rootNorm.test_degree: The norm of a degree-one upstairs line has degree one, while pullback of a degree-one downstairs
line has degree two.

Node FunctionFieldArithmeticPartII:GC.6/root-norm-surjective
Nm^√R:ν_*G_m,X′→G_m,X^√R is surjective as an étale sheaf under the odd-characteristic double-cover
hypotheses.

Node FunctionFieldArithmeticPartII:GC.6/norm-kernel
As étale sheaves, ker Nm^√R is the image of u↦u/(σu), and ker(1−σ)=G_m,X inside ν_*G_m,X′. At
ramification a root-normalized norm-one u has residue one, so w=1+u is locally a unit and u=w/(σw).

Node FunctionFieldArithmeticPartII:GC.6/exact-sheaf-complex
The étale sheaf complex 1→G_m,X→ν_*G_m,X′→^{1−σ}ν_*G_m,X′→^{Nm^√R}G_m,X^√R→1 is exact, with
specified zero composites. Passing to torsor groupoids requires its connecting obstruction data;
this theorem does not claim a short exact sequence of Picard groups.

Node FunctionFieldArithmeticPartII:GC.6/picard-descent-obstructions
Let K=ker Nm^√R. Interpret the exact sheaf complex as the two short exact sequences G_m→ν_*G_m→K and
K→ν_*G_m→G_m^√R, and apply their derived cohomology and torsor descent. Any Picard-stack exactness
statement must specify the connecting maps, coherent norm trivializations and effectiveness
obstructions, rather than replacing the result by an ordinary kernel of 1−σ on line-bundle classes.

Node FunctionFieldArithmeticPartII:GC.6/hat-root-norm
Send (L′,a′) on X′ to (Nm L′,L′|_{R′},ι,Nm a′,a′|_{R′}) on hatX_d^√R. It commutes with hat
Abel–Jacobi and the root norm, and restricts to effective sections.
API TauCeti.RamifiedClassField.hatRootNorm.object: The root line and root section are L′|_{R′} and a′|_{R′}.
API TauCeti.RamifiedClassField.hatRootNorm.abelJacobi: hatAJ∘hatNorm≅rootNorm∘hatAJ′.
API TauCeti.RamifiedClassField.hatRootNorm.effective: A fibrewise-nonzero upstairs section gives a fibrewise-nonzero norm section.
Example TauCeti.RamifiedClassField.hatRootNorm.test_zero: A zero section maps to a zero global and root section.
Example TauCeti.RamifiedClassField.hatRootNorm.test_branch: At ramification the norm section restricts to the square of a′|_{R′}.
Example TauCeti.RamifiedClassField.hatRootNorm.test_ordinary: Forgetting roots recovers the ordinary norm on section spaces.

Node FunctionFieldArithmeticPartII:GC.6/quadratic-input
For the geometrically connected double cover, ν_*Q̄ℓ decomposes into the ± eigensheaves of σ; its
anti-invariant restriction to U is rank one, geometrically nontrivial and has inertia −1 exactly at
R. Extend it to the root curve through the tame correspondence. The parent’s arithmetic reciprocity
gives η_{F′/F}:F×\A_F×→{±1}, which is trivial on the image of O_{√R}×.
API TauCeti.RamifiedClassField.quadraticInput.antiInvariant: The input on U is the −1 eigensheaf of ν_*Q̄ℓ.
API TauCeti.RamifiedClassField.quadraticInput.inertia: Every ramified inertia generator acts by −1.
API TauCeti.RamifiedClassField.quadraticInput.ideleCharacter: The arithmetic character factors through the root-unit idele quotient.
Example TauCeti.RamifiedClassField.quadraticInput.test_split_point: At a split unramified point the local Frobenius trace is +1.
Example TauCeti.RamifiedClassField.quadraticInput.test_inert_point: At an inert unramified point the local Frobenius trace is −1.
Example TauCeti.RamifiedClassField.quadraticInput.test_geometric_connectedness: A constant quadratic cover is excluded from the geometrically nontrivial input assertion.

Node FunctionFieldArithmeticPartII:GC.6/trace-character
The Frobenius trace of L^Pic is a multiplicative Q̄ℓ×-valued function on isomorphism classes of
Pic_X^√R(k), normalized to one at the tensor unit. Via the adelic equivalence it defines an idele
character. For general input L its range is not restricted to {±1}.

Node FunctionFieldArithmeticPartII:GC.6/closed-point-trace
For a closed point x∈U of degree δ, Tr(Fr_k,(L_δ)_{[x]})=Tr(Fr_x,L_x). On the tensor of δ conjugate
rank-one fibres, Frobenius cyclically permutes factors and applies Fr_x on the wrapped factor.

Node FunctionFieldArithmeticPartII:GC.6/away-ramification-generation
Every class of the root-Picard idele groupoid is a difference of canonical root-divisor classes
supported on U, after multiplying by the modified-unit image. Thus a normalized idele character is
determined by its values on π_x⁻¹ for x∈U.

Node FunctionFieldArithmeticPartII:GC.6/quadratic-trace
For the geometrically connected double cover, the Frobenius trace of its all-degree root-Picard
character sheaf equals η_{F′/F} under the adelic groupoid equivalence, with π_x⁻¹↔O_X(x)^♮ and
geometric Frobenius. At unramified x the value is +1 for split x and −1 for inert x.

Native fragment example TauCeti.RootStack.RootObject.test_trivialization is supplied
in the coordinate continuation below; its proof remains unchecked.
See LEAN-SECTION-COMP for its exact affine unit/section comparison.
-/


/-! Root-specific coordinate comparisons. These native signatures are uncompiled.
The coordinate and unit-section abbreviations below only expose the existing
freePUnitIsoUnit and freeSection maps; they are not substitute geometric types. -/
namespace TauCeti.RootStack

variable {X : Scheme.{u}}

private abbrev trivialSectionUnit :
    Section (TauCeti.AlgebraicGeometry.InvertibleSheaf.trivial X) :=
  (SheafOfModules.freeSection (R := X.ringCatSheaf) PUnit.unit).val
    (Opposite.op (⊤ : X.Opens))

private abbrev trivialSectionCoordinate
    (v : Section (TauCeti.AlgebraicGeometry.InvertibleSheaf.trivial X)) : Γ(X, ⊤) :=
  (TauCeti.SheafOfModules.freePUnitIsoUnit X.ringCatSheaf).hom.val.app
    (Opposite.op (⊤ : X.Opens)) v

def tensorPower.trivialIso (n : ℕ) :
    tensorPower (TauCeti.AlgebraicGeometry.InvertibleSheaf.trivial X) n ≅
      TauCeti.AlgebraicGeometry.InvertibleSheaf.trivial X := by sorry

lemma tensorPower.trivialIso_zero :
    tensorPower.trivialIso (X := X) 0 = Iso.refl _ := by sorry

lemma tensorPower.trivialIso_succ (n : ℕ) :
    tensorPower.trivialIso (X := X) (n + 1) =
      TauCeti.AlgebraicGeometry.InvertibleSheaf.tensorProductCongrLeft
        (tensorPower.trivialIso n) ≪≫
      TauCeti.AlgebraicGeometry.InvertibleSheaf.tensorTrivialRightIso
        (TauCeti.AlgebraicGeometry.InvertibleSheaf.trivial X) := by sorry

lemma tensorPower.trivialIso_unit (n : ℕ) :
    trivialSectionCoordinate (mapSection (tensorPower.trivialIso n)
      (sectionPower (TauCeti.AlgebraicGeometry.InvertibleSheaf.trivial X) n
        trivialSectionUnit)) = 1 := by sorry

-- tensorPower.trivialIso_test_zero
example : tensorPower.trivialIso (X := X) 0 = Iso.refl _ := by sorry

-- tensorPower.trivialIso_test_one
example : tensorPower.trivialIso (X := X) 1 =
    TauCeti.AlgebraicGeometry.InvertibleSheaf.tensorTrivialRightIso
      (TauCeti.AlgebraicGeometry.InvertibleSheaf.trivial X) := by sorry

-- tensorPower.trivialIso_test_two
example (v : Section (TauCeti.AlgebraicGeometry.InvertibleSheaf.trivial X)) :
    trivialSectionCoordinate (mapSection (tensorPower.trivialIso 2)
      (sectionPower (TauCeti.AlgebraicGeometry.InvertibleSheaf.trivial X) 2 v)) =
      trivialSectionCoordinate v ^ 2 := by sorry

lemma sectionPower.in_trivialization
    (M : TauCeti.AlgebraicGeometry.InvertibleSheaf X)
    (e : M ≅ TauCeti.AlgebraicGeometry.InvertibleSheaf.trivial X)
    (v : Section M) (n : ℕ) :
    trivialSectionCoordinate (mapSection
      (tensorPower.mapIso n e ≪≫ tensorPower.trivialIso n) (sectionPower M n v)) =
      trivialSectionCoordinate (mapSection e v) ^ n := by sorry

-- This coefficient is the image of the native unit section, not an assumption.
private abbrev rootPowerCoefficient {n : ℕ} [NeZero n]
    {L : TauCeti.AlgebraicGeometry.InvertibleSheaf X} {s : Section L}
    (a : RootObject n L s)
    (e : a.line ≅ TauCeti.AlgebraicGeometry.InvertibleSheaf.trivial X)
    (l : L ≅ TauCeti.AlgebraicGeometry.InvertibleSheaf.trivial X) : Γ(X, ⊤) :=
  trivialSectionCoordinate (mapSection
    ((tensorPower.trivialIso n).symm ≪≫ tensorPower.mapIso n e.symm ≪≫
      a.powerIso ≪≫ l) trivialSectionUnit)

lemma RootObject.powerIdentification_isUnit {n : ℕ} [NeZero n]
    {L : TauCeti.AlgebraicGeometry.InvertibleSheaf X} {s : Section L}
    (a : RootObject n L s)
    (e : a.line ≅ TauCeti.AlgebraicGeometry.InvertibleSheaf.trivial X)
    (l : L ≅ TauCeti.AlgebraicGeometry.InvertibleSheaf.trivial X) :
    IsUnit (rootPowerCoefficient a e l) ∧
      ∀ v : Section (tensorPower a.line n),
        trivialSectionCoordinate (mapSection (a.powerIso ≪≫ l) v) =
          rootPowerCoefficient a e l *
            trivialSectionCoordinate (mapSection
              (tensorPower.mapIso n e ≪≫ tensorPower.trivialIso n) v) := by sorry

theorem RootObject.trivializationEquation {n : ℕ} [NeZero n]
    {L : TauCeti.AlgebraicGeometry.InvertibleSheaf X} {s : Section L}
    (a : RootObject n L s)
    (e : a.line ≅ TauCeti.AlgebraicGeometry.InvertibleSheaf.trivial X)
    (l : L ≅ TauCeti.AlgebraicGeometry.InvertibleSheaf.trivial X) :
    IsUnit (rootPowerCoefficient a e l) ∧
      rootPowerCoefficient a e l *
        trivialSectionCoordinate (mapSection e a.rootSection) ^ n =
          trivialSectionCoordinate (mapSection l s) := by sorry

-- RootObject.test_trivialization: the omitted comparison now has a native signature.
example {n : ℕ} [NeZero n]
    {L : TauCeti.AlgebraicGeometry.InvertibleSheaf X} {s : Section L}
    (a : RootObject n L s)
    (e : a.line ≅ TauCeti.AlgebraicGeometry.InvertibleSheaf.trivial X)
    (l : L ≅ TauCeti.AlgebraicGeometry.InvertibleSheaf.trivial X) :
    ∃ u : Γ(X, ⊤)ˣ, (u : Γ(X, ⊤)) = rootPowerCoefficient a e l ∧
      (u : Γ(X, ⊤)) * trivialSectionCoordinate (mapSection e a.rootSection) ^ n =
        trivialSectionCoordinate (mapSection l s) := by sorry

lemma RootObject.arrow_scalar_equations {n : ℕ} [NeZero n]
    {L : TauCeti.AlgebraicGeometry.InvertibleSheaf X} {s : Section L}
    (a b : RootObject n L s) (h : RootObject.iso a b)
    (ea : a.line ≅ TauCeti.AlgebraicGeometry.InvertibleSheaf.trivial X)
    (eb : b.line ≅ TauCeti.AlgebraicGeometry.InvertibleSheaf.trivial X)
    (l : L ≅ TauCeti.AlgebraicGeometry.InvertibleSheaf.trivial X) :
    ∃ w : Γ(X, ⊤)ˣ,
      trivialSectionCoordinate (mapSection eb b.rootSection) =
        (w : Γ(X, ⊤)) * trivialSectionCoordinate (mapSection ea a.rootSection) ∧
      rootPowerCoefficient b eb l * (w : Γ(X, ⊤)) ^ n =
        rootPowerCoefficient a ea l := by sorry

end TauCeti.RootStack
