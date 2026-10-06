/-
This file is not the roadmap and is not exhaustive. The roadmap document
research/blueprint/readmes/EllipticKTheory--E.5.md is definitive. These statements
suggest Lean forms so contributors and reviewers converge on names and signatures.
Every planned proof remains `sorry`; nothing is claimed to be implemented.

BP-EllipticKTheory--E.5, issue 6480, Codex — codex-jHS6hw.
Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.

This part imports the accepted parent's scheme/operation interfaces. It defines
only the elliptic twisted Frobenius subgroup, on the existing Weierstrass point
carrier. In its body, Point.map (FiniteField.frobeniusAlgHom k L) is the q-power
action on E(L), and the arithmetic Galois action when L is the algebraic closure.
No competing public Frobenius endomorphism is introduced.

The actual higher scheme K-functor, finite-coefficient spectra, scheme elliptic
model, continuous cohomology and Tate modules are absent at the pins. Their
signatures are identified below by name and mathematical contract. They are not
replaced by arbitrary groups, assumed equivalences, Prop-valued fields or types
whose definition is `sorry`. The shared build has no PointCount object file, so the executable signatures
use the displayed q+1−#E(k) expression and import only Mathlib. The resulting
elaboration checks the point subgroup,
all six API entries and all five discriminating tests, plus the point-kernel order
statement; it does not typecheck the omitted supplier-dependent K statements.
-/

import Mathlib.AlgebraicGeometry.EllipticCurve.Affine.Point
import Mathlib.Algebra.Module.Torsion.Basic
import Mathlib.FieldTheory.Finite.Basic
import Mathlib.FieldTheory.IsAlgClosed.AlgebraicClosure
import Mathlib.Data.ZMod.Basic

noncomputable section

namespace TauCeti.EllipticK

open WeierstrassCurve

section Kernel

variable {k L M : Type*} [Field k] [Fintype k] [DecidableEq k]
  [Field L] [DecidableEq L] [Algebra k L]
  [Field M] [DecidableEq M] [Algebra k M]

/-- E.5/twisted-frobenius-kernel. The prime-to-characteristic torsion fixed by
arithmetic Frobenius with an additional i-th twist. The definition also accepts
field extensions that are not algebraically closed. -/
def twistedFrobeniusKernel (W : WeierstrassCurve k) (L : Type*)
    [Field L] [DecidableEq L] [Algebra k L] (p i : ℕ) [CharP k p] :
    AddSubgroup (W.baseChange L).toAffine.Point where
  carrier := {P | (∃ m : ℕ, 0 < m ∧ Nat.Coprime m p ∧ m • P = 0) ∧
    Fintype.card k ^ i •
      Affine.Point.map (W' := W) (FiniteField.frobeniusAlgHom k L) P = P}
  zero_mem' := by sorry
  add_mem' := by sorry
  neg_mem' := by sorry

/-- API: exact membership, including the prime-to-p annihilator. -/
theorem mem_twistedFrobeniusKernel (W : WeierstrassCurve k) (p i : ℕ)
    [CharP k p] (P : (W.baseChange L).toAffine.Point) :
    P ∈ twistedFrobeniusKernel W L p i ↔
      (∃ m : ℕ, 0 < m ∧ Nat.Coprime m p ∧ m • P = 0) ∧
      Fintype.card k ^ i •
        Affine.Point.map (W' := W) (FiniteField.frobeniusAlgHom k L) P = P := by
  sorry

/-- API: the origin uses annihilator one. -/
theorem zero_mem_twistedFrobeniusKernel (W : WeierstrassCurve k) (p i : ℕ)
    [CharP k p] : (0 : (W.baseChange L).toAffine.Point) ∈
      twistedFrobeniusKernel W L p i := by
  sorry

/-- API: on rational prime-to-p torsion, the condition is (q^i−1)P=0.
The equivalent form q^i P=P avoids truncated natural-number subtraction. -/
theorem baseChange_mem_twistedFrobeniusKernel (W : WeierstrassCurve k)
    (p i : ℕ) [CharP k p] (P : W.toAffine.Point)
    (hP : ∃ m : ℕ, 0 < m ∧ Nat.Coprime m p ∧ m • P = 0) :
    Affine.Point.baseChange (W' := W) k L P ∈
      twistedFrobeniusKernel W L p i ↔ Fintype.card k ^ i • P = P := by
  sorry

/-- API: the existing field-extension point map preserves the subgroup.
For an algebra equivalence, apply this in both directions to obtain an additive
 equivalence; no new point map or Frobenius is defined. -/
theorem map_twistedFrobeniusKernel (W : WeierstrassCurve k) (p i : ℕ)
    [CharP k p] (f : L →ₐ[k] M) (P : (W.baseChange L).toAffine.Point)
    (hP : P ∈ twistedFrobeniusKernel W L p i) :
    Affine.Point.map (W' := W) f P ∈ twistedFrobeniusKernel W M p i := by
  sorry

/-- API: coprime annihilators exclude characteristic-primary torsion. -/
theorem p_torsion_not_mem_twistedFrobeniusKernel (W : WeierstrassCurve k)
    (p i : ℕ) [CharP k p] (P : (W.baseChange L).toAffine.Point)
    (hpP : p • P = 0) (hP : P ∈ twistedFrobeniusKernel W L p i) : P = 0 := by
  sorry

/-- E.5/elliptic-k-group-orders, the geometric point-kernel part.
This is an honest point statement; its identification with #K_(2i)(E) needs
positiveEvenGroups below. Finiteness is explicit so Nat.card cannot hide an
infinite type behind its zero default. -/
theorem twistedFrobeniusKernel_card (W : WeierstrassCurve k) [W.IsElliptic]
    [IsAlgClosed L] (p i : ℕ) [CharP k p] (hi : 1 ≤ i) :
    Finite (twistedFrobeniusKernel W L p i) ∧
      (Nat.card (twistedFrobeniusKernel W L p i) : ℤ) =
        1 - ((Nat.card k : ℤ) + 1 - (Nat.card W.toAffine.Point : ℤ)) * (Fintype.card k : ℤ) ^ i +
          (Fintype.card k : ℤ) ^ (2 * i + 1) := by
  sorry

/-- Test EllipticK.test_twistedKernel_origin. -/
example (W : WeierstrassCurve k) (p i : ℕ) [CharP k p] :
    (0 : (W.baseChange L).toAffine.Point) ∈ twistedFrobeniusKernel W L p i := by
  sorry

end Kernel

section ExplicitTests

-- These are local notation for the displayed equations, not new public curve
-- definitions. The geometric carrier is the actual AlgebraicClosure of ZMod.
local notation "E3" => (⟨0, 0, 0, -1, 0⟩ : WeierstrassCurve (ZMod 3))
local notation "E2ordinary" => (⟨1, 0, 0, 0, 1⟩ : WeierstrassCurve (ZMod 2))
local notation "E2one" => (⟨0, 0, 1, 1, 1⟩ : WeierstrassCurve (ZMod 2))
local notation "E2five" => (⟨0, 0, 1, 1, 0⟩ : WeierstrassCurve (ZMod 2))

local instance : DecidableEq (AlgebraicClosure (ZMod 2)) := Classical.decEq _
local instance : DecidableEq (AlgebraicClosure (ZMod 3)) := Classical.decEq _

/-- Test EllipticK.test_twistedKernel_rational_two_torsion.
The named point is nonzero of exact order two, and q−1=2. -/
example : ∃ (h : (E3).toAffine.Nonsingular 0 0),
    let P : (E3).toAffine.Point := Affine.Point.some 0 0 h
    P ≠ 0 ∧ 2 • P = 0 ∧
      Affine.Point.baseChange (W' := E3) (ZMod 3) (AlgebraicClosure (ZMod 3)) P ∈
        twistedFrobeniusKernel E3 (AlgebraicClosure (ZMod 3)) 3 1 := by
  sorry

/-- Test EllipticK.test_twistedKernel_excludes_characteristic_torsion.
The rational nonzero two-torsion point is Frobenius fixed but excluded from B_0.
Using all torsion or all Frobenius-fixed points would fail this test. -/
example : ∃ (h : (E2ordinary).toAffine.Nonsingular 0 1),
    let P : (E2ordinary).toAffine.Point := Affine.Point.some 0 1 h
    P ≠ 0 ∧ 2 • P = 0 ∧
      Affine.Point.baseChange (W' := E2ordinary) (ZMod 2) (AlgebraicClosure (ZMod 2)) P ∉
        twistedFrobeniusKernel E2ordinary (AlgebraicClosure (ZMod 2)) 2 0 := by
  sorry

/-- Test EllipticK.test_twistedKernel_F2_card_five.
The geometric group is finite of order five in the first twist, and trivial
without the twist. The finiteness assertions accompany both cardinalities. -/
example : Finite (twistedFrobeniusKernel E2one (AlgebraicClosure (ZMod 2)) 2 1) ∧
    Nat.card (twistedFrobeniusKernel E2one (AlgebraicClosure (ZMod 2)) 2 1) = 5 ∧
    Finite (twistedFrobeniusKernel E2one (AlgebraicClosure (ZMod 2)) 2 0) ∧
    Nat.card (twistedFrobeniusKernel E2one (AlgebraicClosure (ZMod 2)) 2 0) = 1 := by
  sorry

/-- Test EllipticK.test_twistedKernel_F2_trace_sign.
Changing the trace from +2 to −2 changes the first-twist order from five to 13. -/
example : Finite (twistedFrobeniusKernel E2five (AlgebraicClosure (ZMod 2)) 2 1) ∧
    Nat.card (E2five).toAffine.Point = 5 ∧ ((Nat.card (ZMod 2) : ℤ) + 1 - (Nat.card (E2five).toAffine.Point : ℤ)) = -2 ∧
    Nat.card (twistedFrobeniusKernel E2five (AlgebraicClosure (ZMod 2)) 2 1) = 13 := by
  sorry

end ExplicitTests

/-! Named target signatures awaiting their actual suppliers.

EllipticK.ellipticOperationComparisons (E.5/elliptic-operation-comparisons):
  not stated. Needs the actual E.1 scheme model and S.2 higher-K comparison/maps.
  Contract: Lf* and Rf* on the model of a nonzero isogeny agree on affine pieces
  with extension and restriction of scalars in every degree.

EllipticK.isogenyRankDeterminantAction (E.5/isogeny-rank-determinant-action):
  not stated. Needs E.1 models, E.2 rank–Pic K₀ and S.2 projection formula.
  Contract: f_*f*=[f_*O] multiplication, coordinates (d,0,P_f), and integral
  degree multiplication on K₀ iff P_f=O. The parent proves the separable rational,
  odd-[m] integral and degree-two counterexample clauses.

EllipticK.projectiveLineComparison (E.5/projective-line-finite-field-comparison):
  not stated. Needs S.5's actual projective line and K-functor.
  Contract: inverse to (a,b)↦π*a+[O(-1)]π*b is (π_*x,σ*x−π_*x); finite-field
  positive even groups vanish and odd groups have two finite-field summands.

EllipticK.harderFinite (E.5/harder-elliptic-input-closure):
  not stated. Needs actual higher K, function-field S-integer finite generation,
  Bass–Tate higher Milnor vanishing/tame-kernel finiteness and Geisser–Levine.
  Contract: for n≥1, Finite K_n(E) and gcd(#K_n(E),p)=1. The five-term
  localization proof explicitly includes K_(n+1)(k(E)).

EllipticK.geometricModules (E.5/geometric-elliptic-k-modules):
  not stated. Needs genuine K/coefficient spectra, Tate/Galois modules and twists.
  Contract: K_(2i−1)(Ebar)=D(i)² and K_(2i)(Ebar)=Ebar[prime-to-p torsion](i).
  The divisible-coefficient degree 2i−1 instead uses elliptic twist i−1.

EllipticK.cohomologyDescent (E.5/elliptic-cohomology-frobenius-descent):
  not stated. Needs continuous cohomology, derived coefficient triangles and
  H¹/Tate duality. Contract: for j≥2, H^r(E,Qℓ/Zℓ(j)) identifies with geometric
  invariants and H^(r+1)(E,Zℓ(j)). No such rational invariants assertion is made
  at j=0, where H¹(G,Qℓ)=Qℓ.

EllipticK.positiveKDescent (E.5/finite-elliptic-k-descent):
  not stated. Needs the actual base-change K map and equivariant filtration.
  Contract: for n>0, K_n(E)→K_n(Ebar)^G is an isomorphism. Handle n=1 separately.

EllipticK.positiveOddGroups (E.5/positive-odd-elliptic-k-groups):
  not stated. Needs the actual K-functor. Contract: Nonempty of an additive
  equivalence K_(2i−1)(E) ≃+ ZMod(q^i−1) × ZMod(q^i−1), i≥1;
  K₁ uses Additive(kˣ) × Additive(kˣ). Cyclic generators are not canonical.

EllipticK.positiveEvenGroups (E.5/positive-even-elliptic-k-groups):
  not stated. Needs the actual K-functor and upstream Tℓ/Vℓ objects.
  Contract: K_(2i)(E) ≃+ twistedFrobeniusKernel W kbar p i for i≥1, with
  ℓ-primary part coker(1−q^iπ:TℓE→TℓE). The cokernel, rather than the zero
  invariant subgroup of the lattice, is essential.

EllipticK.groupOrders (E.5/elliptic-k-group-orders):
  the point-kernel part is twistedFrobeniusKernel_card above; the K-group part
  is not stated until the genuine positiveOddGroups/positiveEvenGroups exist.
  Contract: odd order (q^i−1)², even order 1−a_q q^i+q^(2i+1), finite and prime
  to p. No invariant factors are inferred from the determinant alone.
-/

end TauCeti.EllipticK
