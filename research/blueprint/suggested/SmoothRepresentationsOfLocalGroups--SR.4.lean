/-
This file is not the roadmap and is not exhaustive. The roadmap document is definitive; the review report records corrections awaiting reader synchronization.
These statements suggest Lean forms so contributors and reviewers converge on names
and signatures. Proofs are deliberately omitted; nothing here is an implementation.

Pinned Mathlib: 082e2d37e8b0463410cdb532e111cd43d5a66174.
Only Mathlib modules are imported. The Tau Ceti baseline audit is in the packet.

Unavailable local reductive, integral-block and geometric carrier conditions are left
out below, never replaced by an assumed Prop-valued field. Each partial prototype is
identified next to its declaration and in the handoff. In particular there is no
assumed “FS action” substituting for the actual Hecke-action construction.
-/
import Mathlib.RepresentationTheory.Coinvariants
import Mathlib.RepresentationTheory.Invariants
import Mathlib.RepresentationTheory.Subrepresentation
import Mathlib.RepresentationTheory.Irreducible
import Mathlib.RepresentationTheory.Rep.Basic
import Mathlib.LinearAlgebra.TensorProduct.Tower
import Mathlib.LinearAlgebra.Finsupp.LinearCombination
import Mathlib.RingTheory.Polynomial.Basic
import Mathlib.Algebra.Polynomial.Derivative
import Mathlib.Algebra.Polynomial.Reverse
import Mathlib.RingTheory.SimpleModule.Basic
import Mathlib.RingTheory.Noetherian.Basic
import Mathlib.RingTheory.Artinian.Module
import Mathlib.RingTheory.FiniteType
import Mathlib.CategoryTheory.Center.Linear
import Mathlib.Topology.Algebra.Group.Basic
import Mathlib.Data.ZMod.Basic
import Mathlib.GroupTheory.FreeGroup.Basic
import Mathlib.RingTheory.LocalRing.ResidueField.Ideal
import Mathlib.Algebra.MvPolynomial.Eval
import Mathlib.Topology.LocallyConstant.Basic

noncomputable section
open scoped BigOperators TensorProduct MonoidAlgebra
open CategoryTheory Polynomial
namespace SRPlan
local instance (X : Type*) : DecidableEq X := Classical.decEq X
universe u v w

section FiniteSums
variable {A D E L : Type*} [CommRing A]
/-- Finite-sum interface for the actual N-integral coefficients.
The coefficient construction, reductivity and hyperspecial hypotheses are omitted
here (G-SATAKE-CARRIER); this is not the full Satake isomorphism. -/
def satakeTransform (c : D → L →₀ A) : (D →₀ A) →ₗ[A] (L →₀ A) :=
  Finsupp.linearCombination A c
namespace satakeTransform
lemma coefficient (c : D → L →₀ A) (d : D) (a : A) :
    satakeTransform c (Finsupp.single d a) = a • c d := by sorry
lemma support (c : D → L →₀ A) (f : D →₀ A) :
    (satakeTransform c f).support ⊆ f.support.biUnion (fun d => (c d).support) := by sorry
lemma baseChange {B : Type*} [CommRing B] (φ : A →+* B) (c : D → L →₀ A)
    (f : D →₀ A) :
    (satakeTransform c f).mapRange φ φ.map_zero =
      satakeTransform (fun d => (c d).mapRange φ φ.map_zero)
        (f.mapRange φ φ.map_zero) := by sorry
lemma torus (f : L →₀ A) : satakeTransform (fun l => Finsupp.single l 1) f = f := by sorry
lemma unit (c : D → L →₀ A) (d0 : D) (l0 : L)
    (h : c d0 = Finsupp.single l0 1) :
    satakeTransform c (Finsupp.single d0 1) = Finsupp.single l0 1 := by sorry
lemma gl2 (qHalf : A) :
    satakeTransform (fun _ : Unit => Finsupp.single (0 : Fin 2) qHalf +
      Finsupp.single (1 : Fin 2) qHalf) (Finsupp.single () 1) =
      Finsupp.single (0 : Fin 2) qHalf + Finsupp.single (1 : Fin 2) qHalf := by sorry
example (f : L →₀ A) : satakeTransform (fun l => Finsupp.single l 1) f = f := by sorry
example (l0 : L) : satakeTransform (fun _ : Unit => Finsupp.single l0 (1 : A))
    (Finsupp.single () 1) = Finsupp.single l0 1 := by sorry
example (qHalf : A) :
    satakeTransform (fun _ : Unit => Finsupp.single (0 : Fin 2) qHalf +
      Finsupp.single (1 : Fin 2) qHalf) (Finsupp.single () 1) =
      Finsupp.single (0 : Fin 2) qHalf + Finsupp.single (1 : Fin 2) qHalf := by sorry
end satakeTransform

/-- Finite-coset coefficient interface; actual geometric descent coefficients
are omitted pending G-SATAKE-CARRIER. -/
def parabolicDescent (c : D → E →₀ A) : (D →₀ A) →ₗ[A] (E →₀ A) :=
  Finsupp.linearCombination A c
namespace parabolicDescent
lemma support (c : D → E →₀ A) (f : D →₀ A) :
    (parabolicDescent c f).support ⊆ f.support.biUnion (fun d => (c d).support) := by sorry
lemma stages (c : D → E →₀ A) (b : E → L →₀ A) :
    (parabolicDescent b).comp (parabolicDescent c) =
      parabolicDescent (fun d => parabolicDescent b (c d)) := by sorry
/-- A basis-level constant-term computation suffices to give the whole square. -/
lemma satake (c : D → E →₀ A) (sG : D → L →₀ A) (sM : E → L →₀ A)
    (h : ∀ d, satakeTransform sM (c d) = sG d) :
    (satakeTransform sM).comp (parabolicDescent c) = satakeTransform sG := by sorry
lemma wholeGroup (f : D →₀ A) :
    parabolicDescent (fun d => Finsupp.single d 1) f = f := by sorry
lemma torus (c : D → E →₀ A) : parabolicDescent c = satakeTransform c := by sorry
-- xiVariables: the dual-Levi and determinant-twist signature is omitted;
-- it needs the actual lattice identifications, not a freely chosen matrix.
example (f : D →₀ A) : parabolicDescent (fun d => Finsupp.single d 1) f = f := by sorry
example (c : D → E →₀ A) : parabolicDescent c = satakeTransform c := by sorry
end parabolicDescent
end FiniteSums

section Pseudoroot
variable {W H : Type*} [Group W] [CommGroup H]
/-- Both the square and twisted fixed-point conditions are required. -/
def Pseudoroot (a : W →* MulAut H) (twist : W → H) (sigmaQ x : H) : Prop :=
  x * x = sigmaQ ∧ ∀ w, a w x * twist w = x
namespace Pseudoroot
lemma square (a : W →* MulAut H) (d : W → H) (s x : H)
    (h : Pseudoroot a d s x) : x * x = s := by sorry
lemma fixed (a : W →* MulAut H) (d : W → H) (s x : H)
    (h : Pseudoroot a d s x) (w : W) : a w x * d w = x := by sorry
lemma translate (a : W →* MulAut H) (d : W → H) (s x : H)
    (h : Pseudoroot a d s x) (w : W) (y : H) :
    a w (y * x) * d w = a w y * x := by sorry
lemma even (a : W →* MulAut H) (d : W → H) (x : H)
    (h : ∀ w, a w x * d w = x) : Pseudoroot a d (x * x) x := by sorry
lemma trivial (a : W →* MulAut H) : Pseudoroot a (fun _ => 1) 1 1 := by sorry
-- The residue characteristic-two q=1 calculation is represented by this
-- identity case; the construction of Sigma*(q) is omitted with dual root data.
lemma characteristicTwo (a : W →* MulAut H) : Pseudoroot a (fun _ => 1) 1 1 := by sorry
example (a : W →* MulAut H) : Pseudoroot a (fun _ => 1) 1 1 := by sorry
example (a : W →* MulAut H) (d : W → H) (x : H)
    (h : ∀ w, a w x * d w = x) : Pseudoroot a d (x * x) x := by sorry
example (a : W →* MulAut H) (d : W → H) (s x : H)
    (h : Pseudoroot a d s x) (w : W) (y : H) :
    a w (y * x) * d w = a w y * x := by sorry
end Pseudoroot
end Pseudoroot

section Parameters
variable {A : Type*} [CommRing A]
structure PairedParameter (n : ℕ) where
  alpha : Fin n → Aˣ
  paired : ∀ i, alpha i * alpha i.rev = 1
  middle : ∀ i, 2 * i.val + 1 = n → alpha i = 1
namespace PairedParameter
def polynomial {n : ℕ} (a : PairedParameter (A := A) n) : A[X] :=
  ∏ i, (X - C (a.alpha i : A))
lemma reciprocal {n : ℕ} (a : PairedParameter (A := A) n) :
    a.polynomial.reverse = C ((-1 : A) ^ n) * a.polynomial := by sorry
lemma weyl {n : ℕ} (a : PairedParameter (A := A) n) (σ : Equiv.Perm (Fin n)) :
    (∏ i, (X - C (a.alpha (σ i) : A))) = a.polynomial := by sorry
lemma rankOne (a : PairedParameter (A := A) 1) : a.alpha 0 = 1 := by sorry
lemma rankTwo (a : Aˣ) :
    (X - C (a : A)) * (X - C ((a⁻¹ : Aˣ) : A)) =
      X^2 - C ((a : A) + ((a⁻¹ : Aˣ) : A)) * X + 1 := by sorry
lemma productRing :
    let a : Fin 3 → ZMod 5 × ZMod 5 := ![(1,2), (2,1), (3,3)]
    let P : (ZMod 5 × ZMod 5)[X] := ∏ i, (X - C (a i))
    P.reverse = -P ∧ ∀ i, (a i)^2 ≠ 1 := by sorry
example (a : PairedParameter (A := A) 1) : a.alpha 0 = 1 := by sorry
example (a : Aˣ) :
    (X - C (a : A)) * (X - C ((a⁻¹ : Aˣ) : A)) =
      X^2 - C ((a : A) + ((a⁻¹ : Aˣ) : A)) * X + 1 := by sorry
example :
    let a : Fin 3 → ZMod 5 × ZMod 5 := ![(1,2), (2,1), (3,3)]
    let P : (ZMod 5 × ZMod 5)[X] := ∏ i, (X - C (a i))
    P.reverse = -P ∧ ∀ i, (a i)^2 ≠ 1 := by sorry
end PairedParameter

inductive GenericityKind | oddTate | oddIntertwining | evenRaising | evenIntertwining
/-- Parity is a property of the input rank, not hidden in these four predicates. -/
def UnitaryGenericity (kind : GenericityKind) (P : A[X]) (q : A) : Prop :=
  match kind with
  | .oddTate => IsUnit (P.derivative.eval 1)
  | .oddIntertwining => IsUnit (P.eval (-q))
  | .evenRaising => P.eval q = 0 ∧ IsUnit (P.derivative.eval q)
  | .evenIntertwining => IsUnit (P.eval (-1))
namespace UnitaryGenericity
lemma oddTate (P : A[X]) (q : A) :
    UnitaryGenericity .oddTate P q ↔ IsUnit (P.derivative.eval 1) := by sorry
lemma evenRaising (P : A[X]) (q : A) :
    UnitaryGenericity .evenRaising P q ↔ P.eval q = 0 ∧ IsUnit (P.derivative.eval q) := by sorry
lemma baseChange {B : Type*} [CommRing B] (φ : A →+* B) (k : GenericityKind)
    (P : A[X]) (q : A) (h : UnitaryGenericity k P q) :
    UnitaryGenericity k (P.map φ) (φ q) := by sorry
lemma doubleRoot [Nontrivial A] :
    ¬ UnitaryGenericity .evenRaising ((X - C (1 : A))^2) 1 := by sorry
lemma oddOne : UnitaryGenericity .oddTate (X - C (1 : A)) 1 := by sorry
lemma collision [Nontrivial A] :
    ¬ UnitaryGenericity .oddIntertwining (X - C (1 : A)) (-1) := by sorry
example [Nontrivial A] :
    ¬ UnitaryGenericity .evenRaising ((X - C (1 : A))^2) 1 := by sorry
example : UnitaryGenericity .oddTate (X - C (1 : A)) 1 := by sorry
example [Nontrivial A] :
    ¬ UnitaryGenericity .oddIntertwining (X - C (1 : A)) (-1) := by sorry
end UnitaryGenericity

def SpinPolynomial (q T0 T1 T2 : A) : A[X] :=
  1 - C T2 * X + C (q * (T1 + (q^2 + 1) * T0)) * X^2 -
    C (q^3 * T2 * T0) * X^3 + C (q^6 * T0^2) * X^4
namespace SpinPolynomial
lemma constant (q T0 T1 T2 : A) : (SpinPolynomial q T0 T1 T2).eval 0 = 1 := by sorry
lemma coefficients (q T0 T1 T2 : A) :
    (SpinPolynomial q T0 T1 T2).coeff 4 = q^6 * T0^2 ∧
    (SpinPolynomial q T0 T1 T2).coeff 1 = -T2 := by sorry
lemma reciprocal (q T0 T1 T2 : A) :
    Polynomial.reflect 4 (SpinPolynomial q T0 T1 T2) =
      X^4 - C T2 * X^3 + C (q*T1+(q^3+q)*T0)*X^2 -
        C (q^3*T2*T0)*X + C (q^6*T0^2) := by sorry
lemma rankFour (q T0 T1 T2 : A) :
    (SpinPolynomial q T0 T1 T2).coeff 2 = q*T1+(q^3+q)*T0 := by sorry
lemma similitude (q T0 : A) (a b c d : A) (hq : IsUnit q)
    (hab : a*d=b*c) (hT0 : q^3*T0=a*d) : q^6*T0^2=a*b*c*d := by sorry
lemma centralScaling (q T0 T1 T2 z : A) (j : ℕ) :
    (SpinPolynomial q (z^2*T0) (z^2*T1) (z*T2)).coeff j =
      z^j * (SpinPolynomial q T0 T1 T2).coeff j := by sorry
example (q T0 T1 T2 : A) :
    (SpinPolynomial q T0 T1 T2).coeff 2 = q*T1+(q^3+q)*T0 := by sorry
example (q T0 : A) (a b c d : A) (hq : IsUnit q)
    (hab : a*d=b*c) (hT0 : q^3*T0=a*d) : q^6*T0^2=a*b*c*d := by sorry
example (q T0 T1 T2 z : A) (j : ℕ) :
    (SpinPolynomial q (z^2*T0) (z^2*T1) (z*T2)).coeff j =
      z^j * (SpinPolynomial q T0 T1 T2).coeff j := by sorry
end SpinPolynomial
end Parameters

section HallLittlewood
variable {K : Type*} [Field K]
def inversionLength {n : ℕ} (w : Equiv.Perm (Fin n)) : ℕ :=
  (Finset.univ.filter (fun ij : Fin n × Fin n => ij.1 < ij.2 ∧ w ij.2 < w ij.1)).card
def hallNormalizer {n : ℕ} (lam : Fin n → ℤ) (t : K) : K :=
  ∑ w ∈ Finset.univ.filter (fun w : Equiv.Perm (Fin n) => ∀ i, lam (w i) = lam i),
    t ^ inversionLength w
/-- Rational evaluation only. Pole cancellation and the universal integral
Laurent polynomial specialization are not implemented (G-HL-COUNT). -/
def HallLittlewood {n : ℕ} (lam : Fin n → ℤ) (t : K) (x : Fin n → K) : K :=
  (∑ w : Equiv.Perm (Fin n), (∏ i, x (w i) ^ lam i) *
    ∏ ij ∈ Finset.univ.filter (fun ij : Fin n × Fin n => ij.1 < ij.2),
      (x (w ij.1) - t * x (w ij.2)) / (x (w ij.1) - x (w ij.2))) /
    hallNormalizer lam t
namespace HallLittlewood
lemma symmetric {n : ℕ} (lam : Fin n → ℤ) (t : K) (x : Fin n → K)
    (w : Equiv.Perm (Fin n)) : HallLittlewood lam t (x ∘ w) = HallLittlewood lam t x := by sorry
lemma homogeneous {n : ℕ} (lam : Fin n → ℤ) (t z : K) (hz : z ≠ 0)
    (x : Fin n → K) :
    HallLittlewood lam t (fun i => z * x i) = z ^ (∑ i, lam i) * HallLittlewood lam t x := by sorry
/-- This states integral polynomiality in the dominant nonnegative case.
For negative coweights the Laurent-shift version is omitted in G-HL-COUNT. -/
lemma integral [CharZero K] {n : ℕ} (lam : Fin n → ℤ)
    (hdom : ∀ i j, i ≤ j → lam j ≤ lam i) (hpos : ∀ i, 0 ≤ lam i) :
    ∃ P : MvPolynomial (Option (Fin n)) ℤ, ∀ (t : K) (x : Fin n → K),
      Function.Injective x → hallNormalizer lam t ≠ 0 →
      HallLittlewood lam t x = MvPolynomial.eval₂ (Int.castRingHom K) (fun j => match j with | none => t | some i => x i) P := by sorry
lemma rankOne (m : ℤ) (t x : K) :
    HallLittlewood (fun _ : Fin 1 => m) t (fun _ => x) = x^m := by sorry
lemma zero {n : ℕ} (t : K) (x : Fin n → K) (hx : Function.Injective x)
    (ht : hallNormalizer (fun _ : Fin n => 0) t ≠ 0) :
    HallLittlewood (fun _ : Fin n => 0) t x = 1 := by sorry
lemma minuscule {n r : ℕ} (hr : r ≤ n) (t : K) (x : Fin n → K)
    (hx : Function.Injective x)
    (ht : hallNormalizer (fun i : Fin n => if i.val < r then 1 else 0) t ≠ 0) :
    HallLittlewood (fun i : Fin n => if i.val < r then 1 else 0) t x =
      ∑ s ∈ (Finset.univ : Finset (Fin n)).powersetCard r, ∏ i ∈ s, x i := by sorry
example (m : ℤ) (t x : K) :
    HallLittlewood (fun _ : Fin 1 => m) t (fun _ => x) = x^m := by sorry
example {n : ℕ} (t : K) (x : Fin n → K) (hx : Function.Injective x)
    (ht : hallNormalizer (fun _ : Fin n => 0) t ≠ 0) :
    HallLittlewood (fun _ : Fin n => 0) t x = 1 := by sorry
example (t : K) (x : Fin 2 → K) (hx : Function.Injective x)
    (ht : hallNormalizer (fun i : Fin 2 => if i.val < 1 then 1 else 0) t ≠ 0) :
    HallLittlewood (fun i : Fin 2 => if i.val < 1 then 1 else 0) t x = x 0 + x 1 := by sorry
end HallLittlewood
end HallLittlewood

section Whittaker
variable {A U V : Type*} [CommRing A] [Group U] [AddCommGroup V] [Module A V]
/-- Untwist and reuse ordinary Mathlib coinvariants. -/
def untwist (rho : Representation A U V) (psi : U →* Aˣ) : Representation A U V where
  toFun u := (((psi u)⁻¹ : Aˣ) : A) • rho u
  map_one' := by sorry
  map_mul' := by sorry
-- Inverse character values remain units; no division operation on A is used.
abbrev WhittakerCoinvariants (rho : Representation A U V) (psi : U →* Aˣ) :=
  Representation.Coinvariants (untwist rho psi)
namespace WhittakerCoinvariants
abbrev mk (rho : Representation A U V) (psi : U →* Aˣ) :
    V →ₗ[A] WhittakerCoinvariants rho psi := Representation.Coinvariants.mk _
lemma relation (rho : Representation A U V) (psi : U →* Aˣ) (u : U) (v : V) :
    mk rho psi (rho u v) = (psi u : A) • mk rho psi v := by sorry
lemma lift {M : Type*} [AddCommGroup M] [Module A M]
    (rho : Representation A U V) (psi : U →* Aˣ) (f : V →ₗ[A] M)
    (hf : ∀ u v, f (rho u v) = (psi u : A) • f v) :
    ∃! b : WhittakerCoinvariants rho psi →ₗ[A] M, b.comp (mk rho psi) = f := by sorry
/-- The tensor relation quotient is explicit, so no flatness is assumed. -/
lemma tensor {M : Type*} [AddCommGroup M] [Module A M]
    (rho : Representation A U V) (psi : U →* Aˣ) :
    Nonempty ((M ⊗[A] WhittakerCoinvariants rho psi) ≃ₗ[A]
      (M ⊗[A] V) ⧸ Submodule.span A
        {z | ∃ (u : U) (m : M) (v : V),
          z = m ⊗ₜ[A] rho u v - (psi u : A) • (m ⊗ₜ[A] v)}) := by sorry
lemma trivialCharacter (rho : Representation A U V) :
    Nonempty (WhittakerCoinvariants rho (1 : U →* Aˣ) ≃ₗ[A]
      Representation.Coinvariants rho) := by sorry
lemma trivialGroup (rho : Representation A Unit V) (psi : Unit →* Aˣ) :
    Function.Bijective (mk rho psi) := by sorry
lemma incompatibleCharacter (psi : U →* Aˣ) (u : U)
    (h : IsUnit ((psi u : A) - 1)) :
    Subsingleton (WhittakerCoinvariants (Representation.trivial A U A) psi) := by sorry
example (rho : Representation A U V) :
    Nonempty (WhittakerCoinvariants rho (1 : U →* Aˣ) ≃ₗ[A]
      Representation.Coinvariants rho) := by sorry
example (rho : Representation A Unit V) (psi : Unit →* Aˣ) :
    Function.Bijective (mk rho psi) := by sorry
example (psi : U →* Aˣ) (u : U) (h : IsUnit ((psi u : A) - 1)) :
    Subsingleton (WhittakerCoinvariants (Representation.trivial A U A) psi) := by sorry
end WhittakerCoinvariants
end Whittaker

section SmoothPredicates
variable {A G V : Type*} [CommRing A] [Group G] [TopologicalSpace G]
  [IsTopologicalGroup G] [AddCommGroup V] [Module A V]
/-- Temporary adapter for the earlier SR.0 export, not a second roadmap node. -/
def Smooth (rho : Representation A G V) : Prop := ∀ v, IsOpen {g | rho g v = v}
def smoothVectors (rho : Representation A G V) : Subrepresentation rho where
  toSubmodule :=
    { carrier := {v | IsOpen {g | rho g v = v}}
      zero_mem' := by sorry
      add_mem' := by sorry
      smul_mem' := by sorry }
  apply_mem_toSubmodule := by sorry
def Admissible (rho : Representation A G V) : Prop :=
  ∀ K : Subgroup G, IsOpen (K : Set G) → IsCompact (K : Set G) →
    Module.Finite A (Representation.invariants (rho.comp K.subtype))
/-- Scalar extension uses the existing linear-map base-change operation. -/
def extendRepresentation (rho : Representation A G V) (B : Type u)
    [CommRing B] [Algebra A B] : Representation B G (B ⊗[A] V) where
  toFun g := (rho g).baseChange B
  map_one' := by sorry
  map_mul' := by sorry
end SmoothPredicates

section AIG
variable {k G V : Type u} [Field k] [Group G] [TopologicalSpace G]
  [IsTopologicalGroup G] [AddCommGroup V] [Module k V]
-- Algebraic absolute simplicity plus smoothness, with scalar extensions stated
-- explicitly. This is not the weaker End(V)=k condition.
def AbsolutelyIrreducible (rho : Representation k G V) : Prop :=
  ∀ (L : Type u) (hL : Field L) (hAlg : Algebra k L),
    letI := hL
    letI := hAlg
    Representation.IsIrreducible (extendRepresentation rho L)
def Generic (rho : Representation k G V) (U : Subgroup G) (psi : U →* kˣ) : Prop :=
  Nontrivial (WhittakerCoinvariants (rho.comp U.subtype) psi)
def finiteLength (rho : Representation k G V) : Prop :=
  IsNoetherian k[G] rho.asModule ∧ IsArtinian k[G] rho.asModule
def quotientRepresentation (rho : Representation k G V) (S : Subrepresentation rho) :
    Representation k G (V ⧸ S.toSubmodule) :=
  rho.quotient S.toSubmodule (fun g => S.apply_mem_toSubmodule g)
/-- The existential S is the socle: absolute simplicity and containing every
simple subrepresentation identify it without introducing an opaque socle field. -/
def EssentiallyAIG (rho : Representation k G V) (U : Subgroup G) (psi : U →* kˣ) : Prop :=
  Smooth rho ∧ ∃ S : Subrepresentation rho,
    AbsolutelyIrreducible S.toRepresentation ∧ Generic S.toRepresentation U psi ∧
    (∀ T : Subrepresentation rho, Representation.IsIrreducible T.toRepresentation → T ≤ S) ∧
    Subsingleton (WhittakerCoinvariants ((quotientRepresentation rho S).comp U.subtype) psi) ∧
    ∀ v : V, ∃ T : Subrepresentation rho, v ∈ T ∧ finiteLength T.toRepresentation
namespace EssentiallyAIG
lemma socle (rho : Representation k G V) (U : Subgroup G) (psi : U →* kˣ)
    (h : EssentiallyAIG rho U psi) :
    ∃ S : Subrepresentation rho, AbsolutelyIrreducible S.toRepresentation ∧
      Generic S.toRepresentation U psi ∧
      ∀ T : Subrepresentation rho, Representation.IsIrreducible T.toRepresentation → T ≤ S := by sorry
lemma quotient (rho : Representation k G V) (U : Subgroup G) (psi : U →* kˣ)
    (h : EssentiallyAIG rho U psi) :
    ∃ S : Subrepresentation rho, AbsolutelyIrreducible S.toRepresentation ∧
      Subsingleton (WhittakerCoinvariants ((quotientRepresentation rho S).comp U.subtype) psi) := by sorry
-- endomorphisms: scalarity uses the GL_n generic uniqueness and derivative
-- exactness package; its group-specific hypotheses cannot yet be typed.
lemma genericSimple (rho : Representation k G V) (U : Subgroup G) (psi : U →* kˣ)
    (hs : Smooth rho) (hi : AbsolutelyIrreducible rho) (hg : Generic rho U psi) :
    EssentiallyAIG rho U psi := by sorry
lemma twoGeneric {W : Type u} [AddCommGroup W] [Module k W]
    (rho : Representation k G V) (sigma : Representation k G W)
    (U : Subgroup G) (psi : U →* kˣ)
    (hi : Representation.IsIrreducible rho) (hj : Representation.IsIrreducible sigma)
    (hg : Generic rho U psi) (hh : Generic sigma U psi) :
    ¬ EssentiallyAIG (rho.prod sigma) U psi := by sorry
example {W : Type u} [AddCommGroup W] [Module k W]
    (rho : Representation k G V) (sigma : Representation k G W)
    (U : Subgroup G) (psi : U →* kˣ)
    (hi : Representation.IsIrreducible rho) (hj : Representation.IsIrreducible sigma)
    (hg : Generic rho U psi) (hh : Generic sigma U psi) :
    ¬ EssentiallyAIG (rho.prod sigma) U psi := by sorry
lemma zero (U : Subgroup G) (psi : U →* kˣ) :
    ¬ EssentiallyAIG (Representation.trivial k G (Fin 0 → k)) U psi := by sorry
example (rho : Representation k G V) (U : Subgroup G) (psi : U →* kˣ)
    (hs : Smooth rho) (hi : AbsolutelyIrreducible rho) (hg : Generic rho U psi) :
    EssentiallyAIG rho U psi := by sorry
example (U : Subgroup G) (psi : U →* kˣ) :
    ¬ EssentiallyAIG (Representation.trivial k G (Fin 0 → k)) U psi := by sorry
end EssentiallyAIG
end AIG

section Families
variable {A G V : Type u} [CommRing A] [Group G] [TopologicalSpace G]
  [IsTopologicalGroup G] [AddCommGroup V] [Module A V]
/-- The specified U,psi are to be the GL_n generic data in the roadmap.
The formula itself includes every prime, with no minimal-prime shortcut. -/
def CoWhittaker (rho : Representation A G V) (U : Subgroup G) (psi : U →* Aˣ) : Prop :=
  Smooth rho ∧ Admissible rho ∧
  Nonempty (WhittakerCoinvariants (rho.comp U.subtype) psi ≃ₗ[A] A) ∧
  ∀ (P : Ideal A) (hP : P.IsPrime),
    letI := hP
    letI : CommRing P.ResidueField := Field.toCommRing
    EssentiallyAIG
      (smoothVectors (Representation.dual (extendRepresentation rho P.ResidueField))).toRepresentation
      U ((Units.map (algebraMap A P.ResidueField).toMonoidHom).comp psi)
namespace CoWhittaker
lemma derivative (rho : Representation A G V) (U : Subgroup G) (psi : U →* Aˣ)
    (h : CoWhittaker rho U psi) :
    Nonempty (WhittakerCoinvariants (rho.comp U.subtype) psi ≃ₗ[A] A) := by sorry
lemma fibers (rho : Representation A G V) (U : Subgroup G) (psi : U →* Aˣ)
    (h : CoWhittaker rho U psi) :
    ∀ (P : Ideal A) (hP : P.IsPrime),
    letI := hP
    letI : CommRing P.ResidueField := Field.toCommRing
    EssentiallyAIG
      (smoothVectors (Representation.dual (extendRepresentation rho P.ResidueField))).toRepresentation
      U ((Units.map (algebraMap A P.ResidueField).toMonoidHom).comp psi) := by sorry
-- scalars and field: the GL_n generic/finite-length cosocle hypotheses are
-- omitted rather than stated for arbitrary groups (G-MODULAR-TYPES).
lemma twoCopies [Nontrivial A] (rho : Representation A G V)
    (U : Subgroup G) (psi : U →* Aˣ) (h : CoWhittaker rho U psi) :
    ¬ CoWhittaker (rho.prod rho) U psi := by sorry
example [Nontrivial A] (rho : Representation A G V)
    (U : Subgroup G) (psi : U →* Aˣ) (h : CoWhittaker rho U psi) :
    ¬ CoWhittaker (rho.prod rho) U psi := by sorry
lemma nongeneric [Nontrivial A] (rho : Representation A G V) (U : Subgroup G)
    (psi : U →* Aˣ) [Subsingleton (WhittakerCoinvariants (rho.comp U.subtype) psi)] :
    ¬ CoWhittaker rho U psi := by sorry
example [Nontrivial A] (rho : Representation A G V) (U : Subgroup G)
    (psi : U →* Aˣ) [Subsingleton (WhittakerCoinvariants (rho.comp U.subtype) psi)] :
    ¬ CoWhittaker rho U psi := by sorry
end CoWhittaker
end Families

section DerivativeInterfaces
variable {C : Type u} [Category.{v} C]
/-- An endofunctor adapter after embedding all mirabolic ranks in a common
carrier. Actual rank-changing Phi/Psi functors and their descent are omitted
pending SR.2 and G-MODULAR-TYPES. This formula fixes iteration order. -/
def iterateFunctor (F : C ⥤ C) : ℕ → C ⥤ C
  | 0 => 𝟭 C
  | r+1 => F ⋙ iterateFunctor F r
def BZDerivative (Phi Psi : C ⥤ C) : ℕ → C ⥤ C
  | 0 => 𝟭 C
  | r+1 => (iterateFunctor Phi r) ⋙ Psi
namespace BZDerivative
lemma zero (Phi Psi : C ⥤ C) : BZDerivative Phi Psi 0 = 𝟭 C := by sorry
lemma top (Phi Psi : C ⥤ C) (n : ℕ) :
    BZDerivative Phi Psi (n+1) = (iterateFunctor Phi n) ⋙ Psi := by sorry
lemma baseChange (Phi Psi B : C ⥤ C)
    (hPhi : Phi ⋙ B ≅ B ⋙ Phi) (hPsi : Psi ⋙ B ≅ B ⋙ Psi) (r : ℕ) :
    Nonempty (BZDerivative Phi Psi r ⋙ B ≅ B ⋙ BZDerivative Phi Psi r) := by sorry
lemma rankOne (Psi : C ⥤ C) : Nonempty (BZDerivative (𝟭 C) Psi 1 ≅ Psi) := by sorry
lemma range (Phi Psi : C ⥤ C) : Nonempty (BZDerivative Phi Psi 2 ≅ Phi ⋙ Psi) := by sorry
-- induced: the genuine normalized-parabolic top-derivative tensor signature
-- needs the GL_n and mirabolic carrier; it is not asserted for arbitrary C.
example (Psi : C ⥤ C) : Nonempty (BZDerivative (𝟭 C) Psi 1 ≅ Psi) := by sorry
example (Phi Psi : C ⥤ C) : Nonempty (BZDerivative Phi Psi 2 ≅ Phi ⋙ Psi) := by sorry
example (Phi Psi : C ⥤ C) : BZDerivative Phi Psi 0 = 𝟭 C := by sorry
end BZDerivative
end DerivativeInterfaces

section SchwartzInterface
variable {A M V : Type*} [CommRing A] [AddCommGroup M] [Module A M]
  [AddCommGroup V] [Module A V]
/-- Range of the canonical mirabolic map. Its construction from Phi/Psi,
injectivity and group-specific derivative are omitted in this interface. -/
def SchwartzSubmodule (iota : M →ₗ[A] V) : Submodule A V := LinearMap.range iota
namespace SchwartzSubmodule
lemma injective (iota : M →ₗ[A] V) (h : Function.Injective iota) :
    Nonempty (M ≃ₗ[A] SchwartzSubmodule iota) := by sorry
-- derivative and endomorphisms: actual mirabolic functors and canonical map
-- are needed; the formula range(iota) cannot prove these statements by itself.
lemma rankOne : SchwartzSubmodule (LinearMap.id : V →ₗ[A] V) = ⊤ := by sorry
lemma zeroDerivative : SchwartzSubmodule (0 : M →ₗ[A] V) = ⊥ := by sorry
-- tensor: the canonical-map tensor signature awaits the actual derivative.
example : SchwartzSubmodule (LinearMap.id : V →ₗ[A] V) = ⊤ := by sorry
example : SchwartzSubmodule (0 : M →ₗ[A] V) = ⊥ := by sorry
end SchwartzSubmodule
end SchwartzInterface

section CompactInductionInterface
variable {A G : Type*} [CommRing A] [Group G] [TopologicalSpace G]
  [IsTopologicalGroup G]
/-- Function-space part of c-Ind_U^G psi. For closed U, local constancy makes
its quotient support closed; compact support modulo U is expressed by a
compact set of representatives. The block projector is omitted. -/
def UniversalWhittaker (U : Subgroup G) (psi : U →* Aˣ) : Submodule A (G → A) where
  carrier := {f | IsLocallyConstant f ∧
    (∀ (u : U) (g : G), f (u * g) = (psi u : A) * f g) ∧
    ∃ C : Set G, IsCompact C ∧ ∀ g, f g ≠ 0 → ∃ (u : U) (c : G), c ∈ C ∧ g = u * c}
  zero_mem' := by sorry
  add_mem' := by sorry
  smul_mem' := by sorry
namespace UniversalWhittaker
-- represents, center, line, nongeneric, genericSimple, baseChange: the actual
-- GL_n, nondegenerate-character and integral-block projective carrier is
-- needed for these six signatures. They are omitted (G-MODULAR-TYPES),
-- rather than falsely asserted for arbitrary closed subgroups U.
end UniversalWhittaker
end CompactInductionInterface

section Cocycle
variable {Gamma H : Type*} [Group Gamma] [Group H]
structure CrossedCocycle (action : Gamma →* MulAut H) where
  value : Gamma → H
  cocycle : ∀ g h, value (g*h) = value g * action g (value h)
namespace CrossedCocycle
lemma one (action : Gamma →* MulAut H) (c : CrossedCocycle action) : c.value 1 = 1 := by sorry
def gauge (action : Gamma →* MulAut H) (h : H) (c : CrossedCocycle action) :
    CrossedCocycle action where
  value g := h * c.value g * (action g h)⁻¹
  cocycle := by sorry
def map {J : Type*} [Group J] (a : Gamma →* MulAut H) (b : Gamma →* MulAut J)
    (f : H →* J) (hf : ∀ g x, f (a g x) = b g (f x)) (c : CrossedCocycle a) :
    CrossedCocycle b where
  value g := f (c.value g)
  cocycle := by sorry
@[ext] lemma ext (a : Gamma →* MulAut H) (c d : CrossedCocycle a)
    (h : ∀ g, c.value g = d.value g) : c = d := by sorry
lemma gaugeOne (a : Gamma →* MulAut H) (c : CrossedCocycle a) :
    gauge a 1 c = c := by sorry
lemma gaugeMul (a : Gamma →* MulAut H) (h k : H) (c : CrossedCocycle a) :
    gauge a (h * k) c = gauge a h (gauge a k c) := by sorry
lemma mapGauge {J : Type*} [Group J] (a : Gamma →* MulAut H) (b : Gamma →* MulAut J)
    (f : H →* J) (hf : ∀ g x, f (a g x) = b g (f x)) (h : H) (c : CrossedCocycle a) :
    map a b f hf (gauge a h c) = gauge b (f h) (map a b f hf c) := by sorry
lemma trivialAction (c : CrossedCocycle (1 : Gamma →* MulAut H)) (g h : Gamma) :
    c.value (g*h) = c.value g * c.value h := by sorry
def identityCocycle (a : Gamma →* MulAut H) : CrossedCocycle a where
  value _ := 1
  cocycle := by sorry
lemma coboundary (a : Gamma →* MulAut H) (h : H) (g : Gamma) :
    (gauge a h (identityCocycle a)).value g = h * (a g h)⁻¹ := by sorry
example (c : CrossedCocycle (1 : Gamma →* MulAut H)) (g h : Gamma) :
    c.value (g*h) = c.value g * c.value h := by sorry
example (a : Gamma →* MulAut H) (g : Gamma) : (identityCocycle a).value g = 1 := by sorry
example (a : Gamma →* MulAut H) (h : H) (g : Gamma) :
    (gauge a h (identityCocycle a)).value g = h * (a g h)⁻¹ := by sorry
end CrossedCocycle
end Cocycle

section Excursions
variable {A H I V : Type*} [CommRing A] [Group H] [AddCommGroup V] [Module A V]
/-- Concrete matrix-coefficient data, not an assumed geometric Hecke action.
The full finite Weil-action component and colimit algebra are omitted. -/
structure ExcursionDatum (A H I V : Type*) [CommRing A] [Group H]
    [AddCommGroup V] [Module A V] where
  rho : Representation A (I → H) V
  alpha : V
  beta : V →ₗ[A] A
  alpha_fixed : ∀ h : H, rho (fun _ => h) alpha = alpha
  beta_fixed : ∀ h : H, ∀ v, beta (rho (fun _ => h) v) = beta v
namespace ExcursionDatum
def matrixCoefficient (D : ExcursionDatum A H I V) (h : I → H) : A := D.beta (D.rho h D.alpha)
lemma diagonalInvariant (D : ExcursionDatum A H I V) (k : H) (h : I → H) :
    D.matrixCoefficient (fun i => k * h i * k⁻¹) = D.matrixCoefficient h := by sorry
/-- Matrix-coefficient product only; the finite Weil-action exterior datum
and its geometric operator comparison remain omitted. -/
lemma tensorProduct {W : Type*} [AddCommGroup W] [Module A W]
    (D : ExcursionDatum A H I V) (E : ExcursionDatum A H I W)
    (b : (V ⊗[A] W) →ₗ[A] A)
    (hb : ∀ v w, b (v ⊗ₜ[A] w) = D.beta v * E.beta w) (h : I → H) :
    b ((D.rho.tprod E.rho) h (D.alpha ⊗ₜ[A] E.alpha)) =
      D.matrixCoefficient h * E.matrixCoefficient h := by sorry
lemma unit (D : ExcursionDatum A H I A) (hrho : D.rho = Representation.trivial A (I → H) A)
    (ha : D.alpha = 1) (hb : D.beta = LinearMap.id) (h : I → H) :
    D.matrixCoefficient h = 1 := by sorry
lemma zeroAnnihilation (D : ExcursionDatum A H I V) (hb : D.beta = 0) (h : I → H) :
    D.matrixCoefficient h = 0 := by sorry
lemma singleton (D : ExcursionDatum A H Unit V) (h : Unit → H) :
    D.matrixCoefficient h = D.beta D.alpha := by sorry
example (D : ExcursionDatum A H I A) (hrho : D.rho = Representation.trivial A (I → H) A)
    (ha : D.alpha = 1) (hb : D.beta = LinearMap.id) (h : I → H) : D.matrixCoefficient h = 1 := by sorry
example (D : ExcursionDatum A H I V) (hb : D.beta = 0) (h : I → H) : D.matrixCoefficient h = 0 := by sorry
example (D : ExcursionDatum A H Unit V) (h : Unit → H) : D.matrixCoefficient h = D.beta D.alpha := by sorry
end ExcursionDatum
end Excursions

section CenterFiniteness
variable {R Z G V : Type*} [CommRing R] [CommRing Z] [Algebra R Z]
  [Group G] [TopologicalSpace G] [IsTopologicalGroup G] [AddCommGroup V] [Module Z V]
/-- Z is to be the actual image of the smooth categorical center. This
predicate separates its finite type from finite invariant modules.
The categorical image construction is omitted until SR.0 provides its carrier. -/
def ZFinite (rho : Representation Z G V) : Prop :=
  Algebra.FiniteType R Z ∧ ∀ K : Subgroup G, IsOpen (K : Set G) → IsCompact (K : Set G) →
    Module.Finite Z (Representation.invariants (rho.comp K.subtype))
namespace ZFinite
-- image and subquotient: the smooth-category center-image and subquotient
-- signatures are omitted; an arbitrary chosen commutative action is not that image.
lemma invariants (rho : Representation Z G V) (h : ZFinite (R := R) rho)
    (K : Subgroup G) (ho : IsOpen (K : Set G)) (hc : IsCompact (K : Set G)) :
    Module.Finite Z (Representation.invariants (rho.comp K.subtype)) := by sorry
lemma zero [Algebra.FiniteType R Z] :
    ZFinite (R := R) (Representation.trivial Z G (Fin 0 → Z)) := by sorry
lemma scalarFinite (rho : Representation R G (Fin 2 → R)) (h : Admissible rho) :
    ZFinite (R := R) rho := by sorry
-- infiniteDirectSum: omitted actual center-image computation; it is not enough
-- to assert an infinite invariant module is infinite over every possible Z.
example [Algebra.FiniteType R Z] :
    ZFinite (R := R) (Representation.trivial Z G (Fin 0 → Z)) := by sorry
example (rho : Representation R G (Fin 2 → R)) (h : Admissible rho) :
    ZFinite (R := R) rho := by sorry
end ZFinite
end CenterFiniteness

section Stability
variable {R M : Type*} [CommRing R] [AddCommGroup M] [Module R M]
/-- Explicit nilpotent/invertible decomposition; no “stable : Prop” field. -/
def StableOperator (T : Module.End R M) : Prop :=
  ∃ (c : ℕ) (I : Submodule R M), 0 < c ∧
    IsCompl (LinearMap.ker (T^c)) I ∧
    (∀ x ∈ I, T x ∈ I) ∧
    (∀ y ∈ I, ∃! x : I, T x = y)
namespace StableOperator
lemma split (T : Module.End R M) (h : StableOperator T) :
    ∃ (c : ℕ) (I : Submodule R M), 0 < c ∧ IsCompl (LinearMap.ker (T^c)) I := by sorry
-- invertiblePart: the localization and contracting Hecke/Jacquet identification
-- are omitted until SR.2 and G-DEPTH are supplied.
-- dual: injective-cogenerator dual, not the ordinary scalar Hom dual, is needed.
lemma nilpotent (T : Module.End R M) (c : ℕ) (hc : 0 < c) (h : T^c = 0) :
    StableOperator T := by sorry
lemma automorphism (e : M ≃ₗ[R] M) : StableOperator e.toLinearMap := by sorry
lemma mixed {N : Type*} [AddCommGroup N] [Module R N]
    (T : Module.End R M) (e : N ≃ₗ[R] N) (c : ℕ) (hc : 0 < c) (h : T^c = 0) :
    StableOperator (LinearMap.prodMap T e.toLinearMap) := by sorry
example (T : Module.End R M) (c : ℕ) (hc : 0 < c) (h : T^c = 0) : StableOperator T := by sorry
example (e : M ≃ₗ[R] M) : StableOperator e.toLinearMap := by sorry
example {N : Type*} [AddCommGroup N] [Module R N]
    (T : Module.End R M) (e : N ≃ₗ[R] N) (c : ℕ) (hc : 0 < c) (h : T^c = 0) :
    StableOperator (LinearMap.prodMap T e.toLinearMap) := by sorry
end StableOperator
end Stability

/- Named theorem signatures requiring unavailable carriers are omitted:
classical Satake isomorphism (G-SATAKE-CARRIER); the canonical c-group fiber;
Macdonald and unitary triangular count (G-HL-COUNT); universal domination and
minimal-prime reconstruction (G-MODULAR-TYPES); conditional pi(rho) interpolation
(G-INTERPOLATION); finite integral cocycle/GIT quotients (G-INTEGRAL-GIT); actual
FS Hecke action and its compatibility theorems (G-GEOMETRIC-ACTION); bounded-depth
center finiteness and integral second adjointness (G-DEPTH and the preceding gaps).
The packet and reader contain the full mathematical statements and proof routes.
-/
end SRPlan



/- Planned signature inventory — NOT elaborated declarations.
The following names and mathematical signatures need the carriers or hypotheses
identified in the packet gaps and reader. They are omitted from executable Lean,
not assumed as axioms. A successful lean-check does not validate these signatures.

SRPlan.twistedWeylInvariance [theorem]
Let W0=N_G(A)/Z_G(A) for the maximal F-split torus A and let Sigma* be the sum of positive dual coroots. S* lands in functions invariant for w*a=w(a)((Sigma*-w Sigma*)/2)(q). The difference is even, so this action is integral without a square root of q. Normalized S lands in the ordinary W0 invariants.

SRPlan.satakeIsomorphism [theorem]
Over Z[q^-1], S* identifies the spherical Hecke algebra with the twisted W0-invariant lattice algebra. After adjoining a specified q-half, S identifies it with ordinary W0 invariants. Coefficient versions use the integral triangular orbit-sum basis, including when the coefficient characteristic divides the order of W0.

SRPlan.torusCharacterDictionary [theorem]
Over an algebraically closed field with p invertible, unramified characters of T(F) are points of the Frobenius-coinvariant dual torus. This is the character-lattice dictionary, including nonsplit unramified tori.

SRPlan.frobeniusComponentInvariants [theorem]
For an algebraically closed coefficient field k of characteristic different from p, restriction from the dual group Frobenius component H semidirect Fr identifies H-conjugation-invariant regular functions with W0-invariant regular functions on the Frobenius-coinvariant dual torus. Closed conjugacy orbits give semisimple unramified parameters. This node does not assert an integral twisted invariant theorem.

SRPlan.sphericalParameter [theorem]
For an algebraically closed coefficient field of characteristic different from p, a spherical Hecke character determines a semisimple unramified parameter. The K-fixed line in unnormalized Ind_P^G(theta) has character f mapped to theta(S*f) and parameter t_theta a0^-1 semidirect Fr; normalized induction has parameter t_chi semidirect Fr.

SRPlan.cGroupFormulation [theorem]
In TV arXiv v1, for coefficient characteristic different from p and two, the capital C-group is (L-group times G_m) modulo the central element (Sigma*(-1),1,-1). The lower c-group is the quotient of the subgroup of triples (g,gamma,c) satisfying c^2=cyclotomic(gamma) by that element. Theorem 7.9 identifies its Frobenius-fiber invariant algebra canonically with the spherical Hecke algebra, independently of q-half. In characteristic two retain the published pseudoroot formulation.

SRPlan.glnGenerators [theorem]
For GL_n(F), S([K diag(varpi repeated r,1 repeated n-r) K])=q^(r(n-r)/2) e_r(X_1,...,X_n). The scalar coset is invertible, and the target is the symmetric Laurent polynomial ring. Reuse the existing arithmetic GL_n Hecke algebra and central-coset localization comparison, rather than defining another multiplication.

SRPlan.macdonaldFormula [theorem]
For GL_n(E), with E/F unramified quadratic and q=card(k_F), S(1_lambda)=q^<lambda,2 rho> P_lambda(X;q^-2). Hall–Littlewood branching separates n=a+b variables into bidegrees with |alpha|+|beta|=|lambda|.

SRPlan.parabolicDescent.xiVariables [tests]
xi_(a,b) replaces the first a variables by q^-b X_i and the last b by q^-a Y_j.

SRPlan.unitaryWeylTraces [theorem]
For the unramified unitary rank-N dual group GL_N semidirect the pinned transpose-inverse involution, invariant lattice coordinates are the elementary symmetric functions in mu_i=x_i/x_(N+1-i)+x_(N+1-i)/x_i. The extended exterior-power tensor-dual representation has Frobenius-component trace equal to the subset sum of the products x_i/x_(N+1-i), with cardinality delta.

SRPlan.unitaryTriangularTransform [theorem]
For t_delta=(1 repeated delta,0 repeated N-2delta,-1 repeated delta), write T_delta for its hyperspecial double coset. Then q^(delta(N-delta)) trace(rho_(N,delta)) = sum_(i=0)^delta GaussianBinomial(N-2i,delta-i;-q) S(T_i). The matrix is unitriangular and gives an integral algorithm for all spherical calculations in Appendix B.

SRPlan.unitaryIsotropicCounts [theorem]
The product I of the two neighboring unitary lattice correspondences has coefficient at T_delta equal to the number of maximal isotropic subspaces in a residual hermitian space of dimension N-2delta. In even dimension 2k this is product_(i=1)^k(q^(2i-1)+1); in odd dimension 2k+1 it is product_(i=1)^k(q^(2i+1)+1). These coefficients define its hyperspecial spherical image.

SRPlan.unitaryEvenFormulas [theorem]
For N=2r, S(I)=q^(r^2) product_i(mu_i+2) and S((q+1)R-I)=-q^(r^2) product_i(mu_i-q-q^-1). Moreover S(R+(q+1)T)=-(q^(r^2+1)-q^(r^2-1)) sum_j product_(i not j)(mu_i-q-q^-1). R is the linear combination of T_delta with coefficient ((1-(-q)^(r-delta))/(q+1)) product_(i=1)^(r-delta)(q^(2i-1)+1); all apparent quotients are universal polynomials.

SRPlan.unitaryOddFormulas [theorem]
For N=2r+1, S(I)=q^(r^2+r) product_i(mu_i+q+q^-1) and S(T)=q^(r^2+r) product_i(mu_i-2). Here T=sum_delta d_(r-delta,q) T_delta and d_(k,q)=sum_(j=0)^k (-1)^j(2j+1) q^(j(j+1)) GaussianBinomial(2k+1,k-j;-q). Even-rank T uses d_bullet_(k,q)=(d_(k,q)+(((-q)^(k+1)-1)/(q+1)) product_(i=1)^k(q^(2i-1)+1))/(q+1), again evaluated as a polynomial.

SRPlan.gsp4GaloisComparison [comparison]
For an irreducible complex smooth spherical GSp_4 representation pi, use the usual Satake parameter of pi tensor |nu|^(-3/2). Write its spin roots as alpha,beta,gamma,delta with alpha delta=beta gamma. Then T0=q^-3 alpha delta, T2=alpha+beta+gamma+delta and T1=q^-1(alpha beta+alpha gamma+alpha delta+beta delta+gamma delta)-q^-3 alpha delta, and Q(X)=product_xi(1-xi X). Substitution Tx1=T2, Tx2=T1, Sx=T0 identifies the degree-four reciprocal with Calegari–Geraghty Definition 6.7. This is the local normalization comparison.

SRPlan.derivedSatake [theorem]
For split G, S=Z/ell^r, q congruent to 1 modulo ell^r and ell not dividing |W|, derived spherical restriction gives a graded algebra isomorphism with (S[Lambda] tensor H*(T(k_F),S))^W. Its degree-zero map is the classical Satake specialization. The Iwahori-to-spherical Morita comparison is restricted to the etale locus of Spec S[Lambda] over Spec S[Lambda]^W.

SRPlan.unitaryIwahoriCenter [comparison]
Let E/F be ramified quadratic with odd residue characteristic and n=2k+1 as in Clozel–Thorne §2.1. Their B is the chamber stabilizer, containing the connected Iwahori with index two, and K=U_n(O_F) is special. Proposition 2.2 identifies H_B with the split Sp_(2k) Iwahori Hecke algebra. Over C its Bernstein presentation has center C[Lambda]^W0; the hyperspecial spherical comparison is on the split symplectic side. For the integral double-coset generators the corrected relation is (T_s+1)(T_s-q)=0. Use the positive braid monoid over Z, and the braid group only after q is a unit.

SRPlan.geometricTraceContract [comparison]
Export the normalized Satake isomorphism, dominant-coweight basis and Weyl-module trace functions with explicit q-half and Frobenius. A downstream geometric Satake trace comparison must use these same functions and normalizations. The geometric equivalence is not used to prove SR.4.

SRPlan.BZDerivative.induced [tests]
The top derivative of a normalized parabolic induction is the tensor product of the top derivatives of its Levi factors.

SRPlan.derivativeExactness [theorem]
Over the Noetherian W(k)-algebras of the mirabolic node, with ell different from p and the required character chosen or descended, Psi^-, Phi^-, Phi^+, hat-Phi^+ and Psi^+ are exact. Their specified adjunctions, Psi^- Psi^+=Id, Phi^- Phi^+=Id, mixed vanishings and 0 to Phi^+Phi^- to Id to Psi^+Psi^- to 0 hold naturally. Derivatives commute with tensoring by any A-module. An extension to all p-invertible rings requires the separate coefficient-generality refinement.

SRPlan.SchwartzSubmodule.derivative [api]
J(V) has the same top derivative as V.

SRPlan.SchwartzSubmodule.endomorphisms [api]
Restriction identifies End_(P_n)(J(V)) with End_A(V^(n)).

SRPlan.SchwartzSubmodule.tensor [tests]
J(M tensor V)=M tensor J(V), for an arbitrary coefficient module M.

SRPlan.EssentiallyAIG.endomorphisms [api]
Every equivariant endomorphism is scalar.

SRPlan.integralBlocks [theorem]
For algebraically closed k of characteristic ell different from p, the smooth W(k)[GL_n(F)] category decomposes by mod-ell inertial supercuspidal support. Each block center A_[L,pi] is a reduced, ell-torsion-free finite-type W(k)-algebra. Its k-points classify exact supercuspidal supports of simple representations in that block. This center specializes the existing abstract CatCenter, not a new abstract center construction.

SRPlan.typeProjectives [theorem]
For a maximal distinguished cuspidal k-type (K,tau), the compactly induced projective envelope P_(K,tau) has commutative endomorphism ring E_(K,tau), is E-admissible, and its top derivative is locally free of rank one over E. Every prime fiber has absolutely irreducible generic cosocle and essentially AIG smooth dual.

SRPlan.UniversalWhittaker.represents [api]
Hom_G(W_[L,pi],V) is naturally the top derivative of the block part of V.

SRPlan.UniversalWhittaker.center [api]
End_G(W_[L,pi]) is the integral block center.

SRPlan.UniversalWhittaker.line [api]
The top derivative is free of rank one over the center.

SRPlan.UniversalWhittaker.nongeneric [tests]
Hom_G(W,V)=0 for a representation with zero top derivative.

SRPlan.UniversalWhittaker.genericSimple [tests]
A generic simple fiber is a nonzero quotient of the corresponding universal fiber.

SRPlan.UniversalWhittaker.baseChange [tests]
After a center map to A, the top derivative of W tensor A is A.

SRPlan.CoWhittaker.scalars [api]
The natural A to End_(A[G])(V) map is an isomorphism.

SRPlan.CoWhittaker.field [tests]
Over a field a finite-length admissible family is co-Whittaker exactly when its cosocle is absolutely irreducible generic and its top derivative has dimension one.

SRPlan.universalDomination [theorem]
For any Noetherian A and center map A_[L,pi] to A, W_[L,pi] tensor A is co-Whittaker and surjects onto every co-Whittaker A-family with that center character. A co-Whittaker family has a uniquely determined center character through its scalar endomorphisms. Domination does not assert that every quotient is isomorphic to the universal object.

SRPlan.reducedFamilyReconstruction [theorem]
Let A be a reduced Noetherian algebra over the block center and choose nonzero generic-cosocle quotients V_a of the universal fibers at its finitely many minimal primes. The image of the diagonal universal map in the product of V_a is co-Whittaker, A-torsion-free and uniquely determined by these generic fibers in the sense of Helm Lemma 6.4.

SRPlan.llcFamilyConditional [theorem]
Let A be a reduced complete Noetherian local ell-torsion-free W(k)-algebra with residue field k, and rho:G_F to GL_n(A) a continuous Galois representation. Assuming Helm v1 Conjecture 7.4 for rho modulo the maximal ideal, Theorem 7.8 constructs the unique admissible A-torsion-free co-Whittaker pi(rho). At every minimal prime a its fiber is the kappa(a)-dual of the Breuil–Schneider representation of the dual rho_a. This source does not prove the general interpolation conjecture.

SRPlan.tensorEndomorphisms [theorem]
For a co-Whittaker GL_2(Q_l) family V over a Noetherian Z_p-algebra A, p different from l, and any A-module M, End_A(M) to End_(A[G])(M tensor_A V) is an isomorphism. After renaming local residue characteristic to p and coefficient characteristic to ell, the Schwartz proof extends to GL_n with the preceding derivative package; the generalization is a planned proof, not a misquotation of Lemma B.10.

SRPlan.invariantsDualityBaseChange [comparison]
For a ring map A to B there is a natural map B tensor_A V^K to (B tensor_A V)^K. It is an isomorphism under an available averaging projector with invertible pro-order, and otherwise only with separately proved hypotheses; it is not asserted for arbitrary hyperspecial K or arbitrary base change. Smooth duality over fields and its base-change compatibility for admissible finite-dimensional invariant modules are kept separate from injective-cogenerator duality.

SRPlan.extSupportOrthogonality [theorem]
For irreducible admissible representations of GL_n or its Levi over a field of characteristic different from p, nonzero Ext^i implies the same exact supercuspidal support. In a supercuspidal block the Laurent-coordinate maximal ideals kill Ext, so distinct unramified twists have zero Ext; inertial equivalence alone is insufficient for nonvanishing.

SRPlan.cgDistinctBlock [theorem]
In the Calegari–Geraghty setup, A=O/varpi^k, q congruent to 1 modulo ell and residual unramified Frobenius eigenvalues distinct. There is a unique irreducible unramified principal series pi attached to the residual semisimple parameter. The locally admissible category with every irreducible subquotient pi is equivalent to the direct-limit finite-length module category of the completed ordered-character deformation algebra: independent pro-ell residual-unit cyclic variables of order d and independent formal unramified variables X_i.

SRPlan.cgDerivedProjector [theorem]
In that distinct residual-eigenvalue block, projection e_alpha to a chosen simple Frobenius root induces an isomorphism from hyperspecial invariants to the distinguished line-parahoric invariants, and an isomorphism on all their right derived functors. The projector is the stabilized Q(V)^(n!) construction of CG, with Q isolating the chosen residual root; the result is specific to this local block.

SRPlan.highestDerivativeAdapter [comparison]
For an irreducible complex smooth representation Z(m) of GL_n(F) in the Atobe–Kondo–Yasuda convention, its highest nonzero normalized derivative is irreducible and is Z(m^-). Here each segment [a,b]_rho is shortened to [a,b-1]_rho and empty segments are deleted. Their repeated highest-derivative sequence is distinct from a single fixed-order D^r functor. The underlying multisegment classification must be imported or refined separately.

SRPlan.essentialVectorContract [application]
Export Whittaker representability, derivative base change, Schwartz generation, co-Whittaker domination and the correctly conditioned invariant and duality maps for integral essential-vector applications. A canonical GL_n essential vector over arbitrary nonreduced A is not deduced from rank-one derivatives alone. The field GL_2 conductor/newvector theory and the Fouquet–Wan minimal-lift line keep their assigned owners under RS-21.

SRPlan.finiteWildDiscretization [theorem]
Choose arithmetic Frobenius Fr and a compatible tame generator s. W_F^0 is the preimage of Z[1/q] semidirect Fr^Z inside W_F; Fr s Fr^-1=s^q. For a normal open finite-action-compatible wild subgroup P_F^e, W_F^0/P_F^e is finitely presented. Its topology keeps the wild subgroup profinite and the tame–Frobenius quotient discrete.

SRPlan.finiteWildRepresentability [theorem]
For the pinned split dual group H over Z[1/p] with finite Weil action, the cocycle functor on W_F^0/P_F^e is represented by a finite-presentation affine scheme, realized as the closed relation locus in H^r for a finite presentation of the group. Construct this scheme once over Z[1/p]; its Z_ell models are base changes, not independent schemes. The expected fiber dimension is dim(H over the base), while the total dimension over Z[1/p] includes the base dimension.

SRPlan.ellAdicExtension [theorem]
After base change to Z_ell, ell different from p, the universal finite-wild cocycle extends continuously to W_F/P_F^e in the relative discrete ell-adic sense of DHKM. Changes of tame generator and Frobenius give canonical ell-adic functor comparisons; the integral discretized schemes are not thereby identified over Z[1/p].

SRPlan.wildStrata [theorem]
Fix e and P_F/P_F^e, a finite wild p-group acting on H through the chosen finite Weil action. Over the algebraic integral base of DHKM parameters Proposition 1.1, its cocycles have finitely many H-conjugacy classes; their centralizers are smooth with reductive connected components. After the finite integral coefficient extension and Borel-pair-normalizing extensions of Proposition 1.2, the finite-wild scheme decomposes into induced tame strata for these centralizers.

SRPlan.twistedComponentFiniteness [theorem]
Over R=the algebraic integral closure of Z[1/N] in the fixed algebraic number field closure used in DHKM, with p dividing N, let theta be a finite-order automorphism of a split reductive G. If H is a closed reductive subgroup stable under Int(g) theta, the component quotient (H g semidirect theta)//H to (G semidirect theta)//G is finite. Finite scalar-extension descent recovers the base needed for the cocycle quotient application.

SRPlan.tameTorusEngine [theorem]
For a tame stratum with semisimple inertia s and a normalizer representative n, the equation n Fr(t) n^-1 t^-q=s^q(n)n^-1 lies in the maximal fixed subtorus T^(s,0). The torus endomorphism n Fr-q is an isogeny, giving a finite map to the allowed normalizer components. Closed orbits are reached by this torus locus.

SRPlan.frobeniusQuotientFinite [theorem]
The Frobenius evaluation Z^1(W_F^0/P_F^e,H)//H to the twisted Frobenius component H semidirect Fr//H is finite over Z[1/p]. After restriction to a Weil-stable closed reductive subgroup, the induced cocycle quotient map is also finite.

SRPlan.excursionInvariantComparison [theorem]
Over Z_ell the natural map from the finite-wild excursion algebra to the invariant cocycle ring is a universal homeomorphism and an isomorphism after inverting ell; its kernel is nilpotent ell-torsion. The strong integral isomorphism of FS Theorem VIII.3.6 requires ell not dividing the torsion order of pi_1(H). DHKM Corollary 2.6 gives finite Frobenius and reductive-subgroup maps for reduced excursion algebras without that good-prime hypothesis.

SRPlan.geometricHeckeAction [theorem]
For the Fargues–Scholze lisse derived category on Bun_G over ell-adic coefficients with the specified q-half, construct the exact monoidal, finite-set-compatible Hecke action with W_F^I descent, preservation of compact/ULA objects and a uniform finite-wild bound on each compact object. Its restriction to the trivial G-bundle stratum yields the smooth representation action used by DHKM. This is an actual geometric construction, not a tuple of assumed functors.

SRPlan.excursionCenterAction [theorem]
With Lambda=Z_ell[chosen sqrt(q)], the finite-set Hecke action gives a ring map from Exc(W_F,H)=inverse_limit_e Exc(W_F^0/P_F^e,H) to the smooth categorical center. Operators are S_(I,V,alpha,beta,gamma)=T_beta gamma T_alpha and satisfy the free-group relations. For each finitely generated smooth representation this action factors through some finite level e. A map from one fixed finite-level excursion algebra to the entire smooth center is not asserted.

SRPlan.torusCentralCompatibility [theorem]
The torus excursion action agrees with local class-field theory. It is compatible with products, Weil restriction and homomorphisms inducing an adjoint-group isomorphism. For a Levi M, apply the central isogeny M_der times Z_M to M, where Z_M is its maximal connected central torus, to identify the restricted excursion action with the actual central-character action. Z_M need not be split.

SRPlan.parabolicExcursionCompatibility [theorem]
For normalized parabolic induction, the excursion action commutes with the dual-Levi restriction map. For unnormalized induction the ratio of the rho_G and rho_M cyclotomic twists is retained. The chosen delta_P^(1/2) normalization cancels that ratio in the normalized statement.

SRPlan.ZFinite.image [api]
Z_V is the image subalgebra in equivariant endomorphisms.

SRPlan.ZFinite.subquotient [api]
Over a Noetherian base, Z-finiteness passes to subquotients.

SRPlan.ZFinite.infiniteDirectSum [tests]
An infinite direct sum of the trivial representation over a field is not Z-finite.

SRPlan.depthGenerators [theorem]
A bounded-depth smooth block over p-invertible coefficients has a finitely generated projective generator built from compact pro-p induction. Z-finiteness of all finitely generated objects is equivalent to finite-over-finite-type-center behavior of the corresponding Hecke corners. The depth splitting and these generators are the integral Dat inputs; the compact-open corner comparison is supplied by SR.1.

SRPlan.cuspidalEmbedding [theorem]
Over Lambda=Z_ell[sqrt(q)], every finitely generated projective smooth representation embeds into a finite direct sum of normalized parabolic inductions of finitely generated ell-torsion-free cuspidal Levi modules. Lambda is the finite flat q-half extension used by DHKM, not an algebraic integral closure. Characteristic-zero cuspidal support, second adjointness and stable lattices provide the embedding.

SRPlan.cuspidalExcursionFiniteness [theorem]
For a finitely generated ell-torsion-free cuspidal Lambda[M]-module, choose a finite wild level through which its excursion action factors. Since the nilradical of that finite-level excursion algebra is ell-torsion, its action on the lattice is zero. Compatibility with the full connected central torus Z_M makes the lattice admissible over its central-character algebra. Finite reduced-excursion restriction and normalized parabolic compatibility transfer this property to its induced G-module.

SRPlan.integralCenterFiniteness [theorem]
If R is a Noetherian Z_ell-algebra, ell different from p, every finitely generated smooth R[G(F)] representation is Z-finite and every compact-open Hecke algebra is finite over its finite-type R-center. More precisely, Corollary 3.5 states that for r>0 a bounded-depth center over Lambda=Z_ell[sqrt(q)] is finite over a suitable reduced finite-level excursion algebra. Statements for general R use the specified coefficient-extension comparisons rather than an unspecified excursion map.

SRPlan.parabolicCenterMap [theorem]
For a Noetherian flat Z[1/p]-algebra R, Theorem 4.1 gives a unique map Z_R(G) to Z_R(M) compatible with unnormalized parabolic induction and flat coefficient extension. For any Noetherian Z_ell-algebra R, Theorem 4.3 makes Z_R(M)_r finite over Z_Zell(G)_r tensor_Zell R; Lemma 4.2 makes Z_R(G)_r finite over Z_Zell(G)_r tensor_Zell R. This latter assertion does not require or construct a parabolic map from Z_R(G) when R is nonflat.

SRPlan.StableOperator.invertiblePart [api]
The stable image identifies with the localization M[T^-1].

SRPlan.StableOperator.dual [api]
Stability passes to the injective-cogenerator dual with adjoint operator.

SRPlan.ellAdicStability [theorem]
For a fixed depth bound r, sufficiently small pro-p compact open H, a decomposed K, parabolic P and strictly contracting lambda, finite-center control makes R_P(Z_ell[G/H]_r) admissible over the G-center. Lemmas 4.5–4.6 give K,P-stability. Lemma 4.7 chooses a stability exponent depending on r,K,P,lambda but independent of ell different from p, and this common exponent applies to all smooth Z_ell representations of depth at most r.

SRPlan.cogenerators [theorem]
Fix a depth bound r and sufficiently small pro-p H. Let P_r=Z_ell[G/H]_r. Its smooth injective-coefficient dual I_ell=Hom_Zell(P_r,Q_ell/Z_ell)^smooth is an injective cogenerator in the depth-at-most-r smooth Z_ell category and remains injective as a Z[1/p] object. Every simple smooth Z[1/p] representation of depth at most r embeds in some I_ell, including simples with zero coefficient annihilator. Products over ell different from p yield injective resolutions in the smooth category, with a common stability bound. These are not ordinary scalar duals or a claim that one fixed r cogenerates every depth.

SRPlan.jacquetCogeneratorDuality [theorem]
For the smooth dual V-vee=Hom_Z[1/p](V,Q/Z[1/p])^smooth, stability gives R_P(V-vee) isomorphic to (R_oppositeP V)-vee. The pairing on compact-open invariants descends to the mutually adjoint invertible Hecke summands, and the isomorphism is natural.

SRPlan.integralSecondAdjointness [theorem]
For every commutative Z[1/p]-algebra R, unnormalized I_P is left adjoint to delta_P R_oppositeP. If a specified square root delta_P^(1/2) exists, normalized i_P is left adjoint to normalized r_oppositeP. Construct the natural Hom equivalence, its unit and counit and both triangle identities. No Noetherian or Z_ell-algebra hypothesis is imposed on this final adjunction.

SRPlan.integralNoetherianConsequences [theorem]
For a Noetherian Z[1/p]-algebra R, the relevant Hecke algebras are Noetherian, induction preserves projectives and finite generation, and Jacquet functors preserve admissibility. An irreducible Qbar_ell representation is integral exactly when its supercuspidal support is integral. Finite-over-center remains the stronger Z_ell-algebra theorem already stated.

SRPlan.cuspidalReductionConsequences [theorem]
For an irreducible integral Qbar_ell representation pi, cuspidality of its reduction implies cuspidality of pi (Corollary 4.11). For an algebraically closed field k over Z[1/p], any irreducible smooth k-representation sigma of a Levi M, and parabolics P,Q with Levi M, Corollary 4.12 gives a Zariski dense open set of unramified characters psi for which normalized i_P(sigma psi) is irreducible, and equality of the finite-length Grothendieck classes of i_P(sigma) and i_Q(sigma). Sigma need not be cuspidal.

-/
