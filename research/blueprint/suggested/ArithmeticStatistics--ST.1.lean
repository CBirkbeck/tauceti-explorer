import Mathlib.LinearAlgebra.Matrix.Determinant.Basic
import Mathlib.LinearAlgebra.Matrix.Symmetric
import Mathlib.LinearAlgebra.Basis.Defs
import Mathlib.LinearAlgebra.Dimension.Finrank
import Mathlib.LinearAlgebra.Span.Defs
import Mathlib.LinearAlgebra.ExteriorPower.Basic
import Mathlib.Algebra.Algebra.Subalgebra.Lattice
import Mathlib.RingTheory.Norm.Defs
import Mathlib.RingTheory.Trace.Defs
import Mathlib.RingTheory.AdjoinRoot
import Mathlib.Algebra.MvPolynomial.Basic
import Mathlib.Basic.Real.Basic
import Mathlib.Algebra.Squarefree.Basic
import Mathlib.Algebra.GCDMonoid.Finset
import Mathlib.LinearAlgebra.Matrix.Notation
import Mathlib.LinearAlgebra.Matrix.ToLin
import Mathlib.Algebra.MvPolynomial.Eval
import Mathlib.RingTheory.DedekindDomain.Basic
import Mathlib.RingTheory.Localization.FractionRing
import Mathlib.FieldTheory.Separable

/-!
This file is not the roadmap and is not exhaustive. The accompanying roadmap
README is definitive. These suggested Lean forms help contributors and reviewers
converge on names and signatures; they do not claim an implementation.

ST.1 adds to the parent ArithmeticStatistics signatures. All coordinates use
scalar-first bases. The native geometric interfaces that are not supplied by the
pinned libraries are listed in the omission register at the end. No arbitrary
predicate stands in for a missing scheme, torsor, or correspondence.
-/

noncomputable section
open scoped BigOperators Matrix
open Polynomial
set_option autoImplicit false
set_option linter.unusedVariables false

namespace ArithmeticOrbitRefinement

abbrev Coordinates (n : ℕ) := Fin n → ℤ
private def e {n : ℕ} (i : Fin n) : Coordinates n := fun j => if j = i then 1 else 0
abbrev AlternatingQuadruple := Fin 4 →
  {M : Matrix (Fin 5) (Fin 5) ℤ // M.transpose = -M ∧ ∀ i, M i i = 0}
private def scaleQuadruple (t : ℤ) (A : AlternatingQuadruple) : AlternatingQuadruple :=
  fun k => ⟨fun i j => t * (A k).1 i j, by sorry⟩

/-- HCL III §3.7 (20),(27), pp.1347–1348: integral polynomial coefficients. -/
def quarticMinors (M : Matrix (Fin 2) (Fin 6) ℤ) : Matrix (Fin 6) (Fin 6) ℤ :=
  fun i j => M 0 i * M 1 j - M 0 j * M 1 i
lemma quarticMinors_swap (M : Matrix (Fin 2) (Fin 6) ℤ) (i j : Fin 6) :
    quarticMinors M j i = -quarticMinors M i j := by sorry
lemma quarticMinors_plucker (M : Matrix (Fin 2) (Fin 6) ℤ) (i j k l : Fin 6) :
    quarticMinors M i k * quarticMinors M j l =
      quarticMinors M i j * quarticMinors M k l +
      quarticMinors M i l * quarticMinors M j k := by sorry
lemma quarticMinors_mul (h : Matrix (Fin 2) (Fin 2) ℤ)
    (M : Matrix (Fin 2) (Fin 6) ℤ) :
    quarticMinors (h*M) = h.det • quarticMinors M := by sorry
-- ArithmeticOrbitRefinement.minors_standard
example : quarticMinors ![![1,0,0,0,0,0], ![0,1,0,0,0,0]] 0 1 = 1 := by sorry
-- ArithmeticOrbitRefinement.minors_row_swap
example : quarticMinors ![![0,1,0,0,0,0], ![1,0,0,0,0,0]] 0 1 = -1 := by sorry
-- ArithmeticOrbitRefinement.minors_dependent
example (a : Fin 6 → ℤ) (c : ℤ) :
    quarticMinors ![a, fun i => c * a i] = 0 := by sorry

/-- HCL III Lemma16, p.1348: no quotient by automorphisms of the six labels. -/
theorem integral_minors_realization (minors : Matrix (Fin 6) (Fin 6) ℤ)
    (hskew : ∀ i j, minors j i = -minors i j) (hdiag : ∀ i, minors i i = 0)
    (hrel : ∀ i j k l, minors i k * minors j l = minors i j * minors k l + minors i l * minors j k) :
    ∃ M : Matrix (Fin 2) (Fin 6) ℤ, quarticMinors M = minors := by sorry

private def minorFibreSetoid (minors : Matrix (Fin 6) (Fin 6) ℤ) :
    Setoid {M : Matrix (Fin 2) (Fin 6) ℤ // quarticMinors M = minors} where
  r x y := ∃ h : Matrix (Fin 2) (Fin 2) ℤ, h.det = 1 ∧ y.val = h*x.val
  iseqv := by sorry
/-- HCL III Lemma17, p.1349: count based row orbits; nonzero minors are essential. -/
theorem integral_minors_fibre_count (minors : Matrix (Fin 6) (Fin 6) ℤ)
    (hne : minors ≠ 0) (hskew : ∀ i j, minors j i = -minors i j)
    (hdiag : ∀ i, minors i i = 0)
    (hrel : ∀ i j k l, minors i k * minors j l =
      minors i j * minors k l + minors i l * minors j k) :
    Nat.card (Quotient (minorFibreSetoid minors)) =
      ∑ d ∈ (Finset.univ.gcd (fun ij : Fin 6 × Fin 6 =>
        (minors ij.1 ij.2).natAbs)).divisors, d := by sorry

/-- HCL IV (16)–(22), pp.67–69: normalized integral multiplication, not Pi multiplication. -/
@[instance_reducible] def quinticRing (A : AlternatingQuadruple) : CommRing (Coordinates 5) := by sorry
lemma quinticRing_add (A : AlternatingQuadruple) :
    (∀ x y, (quinticRing A).add x y = fun i => x i + y i) ∧
    (quinticRing A).one = e 0 := by sorry
lemma quinticCoeff_scale (t : ℤ) (A : AlternatingQuadruple) (i j k : Fin 5)
    (hi : i ≠ 0) (hj : j ≠ 0) :
    (quinticRing (scaleQuadruple t A)).mul (e i) (e j) k =
      t ^ (if k = 0 then 10 else 5) * (quinticRing A).mul (e i) (e j) k := by sorry
private def zeroQuadruple : AlternatingQuadruple := fun _ => ⟨0, by sorry⟩
private def sparseQuadruple : AlternatingQuadruple := fun k =>
  ⟨if k = 0 then
      ![![0,1,0,0,0],![-1,0,0,0,0],![0,0,0,1,0],![0,0,-1,0,0],![0,0,0,0,0]]
    else if k = 1 then
      ![![0,0,0,0,0],![0,0,0,0,0],![0,0,0,0,0],![0,0,0,0,1],![0,0,0,-1,0]]
    else if k = 2 then
      ![![0,1,0,0,0],![-1,0,0,0,0],![0,0,0,0,1],![0,0,0,0,0],![0,0,-1,0,0]]
    else 0, by sorry⟩
-- ArithmeticOrbitRefinement.quintic_zero
example (i j : Fin 5) (hi : i ≠ 0) (hj : j ≠ 0) :
    (quinticRing zeroQuadruple).mul (e i) (e j) = 0 := by sorry
-- ArithmeticOrbitRefinement.quintic_one
example (A : AlternatingQuadruple) (i : Fin 5) :
    (quinticRing A).mul (e 0) (e i) = e i := by sorry
-- ArithmeticOrbitRefinement.quintic_sparse
example : (quinticRing sparseQuadruple).mul (e 1) (e 3) 4 = 1 := by sorry

/-- Trace-pairing determinant in the displayed coordinate basis. Its use below
requires the exported componentwise-addition/scalar-first-basis compatibility. -/
private def tableDisc {n : ℕ} (R : CommRing (Coordinates n)) : ℤ :=
  Matrix.det (fun i j : Fin n => ∑ k : Fin n, R.mul (R.mul (e i) (e j)) (e k) k)

/-- HCL IV (34)–(38), pp.77–79: only the indicated integral combinations of D. -/
@[instance_reducible] def sexticRing (A : AlternatingQuadruple) : CommRing (Coordinates 6) := by sorry
lemma sexticRing_add (A : AlternatingQuadruple) :
    (∀ x y, (sexticRing A).add x y = fun i => x i + y i) ∧
    (sexticRing A).one = e 0 := by sorry
lemma sextic_discriminant (A : AlternatingQuadruple) :
    tableDisc (sexticRing A) = 4096 * tableDisc (quinticRing A) ^ 3 := by sorry
-- ArithmeticOrbitRefinement.sextic_zero
example (i j : Fin 6) (hi : i ≠ 0) (hj : j ≠ 0) :
    (sexticRing zeroQuadruple).mul (e i) (e j) = 0 := by sorry
-- ArithmeticOrbitRefinement.sextic_one
example (A : AlternatingQuadruple) : (sexticRing A).mul (e 0) (e 5) = e 5 := by sorry
-- ArithmeticOrbitRefinement.sextic_factor16
example (A : AlternatingQuadruple) (h : tableDisc (quinticRing A) = 1) :
    tableDisc (sexticRing A) = 4096 := by sorry

/-- HCL IV Definitions10–11, pp.82–83: the map is encoded by the quadruple;
this predicate compares normalized based multiplication structures. -/
def IsBasedSexticResolvent (A : AlternatingQuadruple)
    (R : CommRing (Coordinates 5)) (S : CommRing (Coordinates 6)) : Prop :=
  R = quinticRing A ∧ S = sexticRing A
lemma basedSexticResolvent_self (A : AlternatingQuadruple) :
    IsBasedSexticResolvent A (quinticRing A) (sexticRing A) := by sorry
lemma basedSexticResolvent_disc (A : AlternatingQuadruple)
    (R : CommRing (Coordinates 5)) (S : CommRing (Coordinates 6))
    (h : IsBasedSexticResolvent A R S) : tableDisc S = 4096 * tableDisc R ^ 3 := by sorry
-- ArithmeticOrbitRefinement.resolvent_zero
example : IsBasedSexticResolvent zeroQuadruple
    (quinticRing zeroQuadruple) (sexticRing zeroQuadruple) := by sorry
-- ArithmeticOrbitRefinement.resolvent_recovers_both
example (A : AlternatingQuadruple) (R : CommRing (Coordinates 5))
    (S : CommRing (Coordinates 6)) (h : IsBasedSexticResolvent A R S) :
    R = quinticRing A ∧ S = sexticRing A := by sorry
-- ArithmeticOrbitRefinement.resolvent_wrong_disc
example (A : AlternatingQuadruple) (S : CommRing (Coordinates 6))
    (h : tableDisc S ≠ 4096 * tableDisc (quinticRing A) ^ 3) :
    ¬IsBasedSexticResolvent A (quinticRing A) S := by sorry

/-- Wood Theorem1.1, §§4–5, pp.5–8: a chosen power basis, including the scalar. -/
def IsMonogenizing {C : Type*} [CommRing C] [Algebra ℤ C] (w : C) : Prop :=
  LinearIndependent ℤ ![(1 : C), w, w^2] ∧
    Submodule.span ℤ (Set.range ![(1 : C), w, w^2]) = ⊤
lemma monogenizing_translate {C : Type*} [CommRing C] [Algebra ℤ C] (w : C) (k : ℤ) :
    IsMonogenizing (w + algebraMap ℤ C k) ↔ IsMonogenizing w := by sorry
lemma monogenizing_adjoin {C : Type*} [CommRing C] [Algebra ℤ C]
    (w : C) (h : IsMonogenizing w) : Algebra.adjoin ℤ ({w} : Set C) = ⊤ := by sorry
-- ArithmeticOrbitRefinement.monogenizing_truncated
example : IsMonogenizing (AdjoinRoot.root ((X : ℤ[X])^3)) := by sorry
-- ArithmeticOrbitRefinement.monogenizing_translate_test
example : IsMonogenizing (AdjoinRoot.root ((X : ℤ[X])^3) + 1) := by sorry
-- ArithmeticOrbitRefinement.monogenizing_square_fails
example : ¬IsMonogenizing (AdjoinRoot.root ((X : ℤ[X])^3)^2) := by sorry

section Pencil
variable {R : Type*} [CommRing R]
private def pencilPoly {n : ℕ} (A B : Matrix (Fin n) (Fin n) R) : R[X] :=
  (-1)^(n*(n-1)/2) * Matrix.det (fun i j => C (A i j) * X - C (B i j))
/-- BGW §2, p.6: descending x-degree, signed determinant of xA-yB. -/
def pencilInvariant {n : ℕ} (A B : Matrix (Fin n) (Fin n) R) : Fin (n+1) → R :=
  fun i => (pencilPoly A B).coeff (n-i.val)
lemma pencilInvariant_congr {n : ℕ} (A B g : Matrix (Fin n) (Fin n) R) :
    pencilInvariant (g * A * g.transpose) (g * B * g.transpose) =
      fun i => g.det^2 * pencilInvariant A B i := by sorry
lemma pencilInvariant_scalar {n : ℕ} (a b : R) :
    pencilInvariant (a • (1 : Matrix (Fin n) (Fin n) R)) (b • 1) =
      fun i => ((-1 : R[X])^(n*(n-1)/2) * (C a * X - C b)^n).coeff (n-i.val) := by sorry
-- ArithmeticOrbitRefinement.pencil_n1
example (a b : R) : pencilInvariant (!![a]) (!![b]) = ![a,-b] := by sorry
-- ArithmeticOrbitRefinement.pencil_n3_identity
example : pencilInvariant (1 : Matrix (Fin 3) (Fin 3) ℤ) 0 = ![-1,0,0,0] := by sorry
-- ArithmeticOrbitRefinement.pencil_zero
example {n : ℕ} (hn : 1 ≤ n) :
    pencilInvariant (0 : Matrix (Fin n) (Fin n) R) 0 = 0 := by sorry

/-- The universal homogeneous binary discriminant over Z, including f₀=0.
Construct it by the universal resultant divisibility, rather than applying the
univariate discriminant after dropping a vanishing leading coefficient. -/
private def universalBinaryDiscriminant (n : ℕ) : MvPolynomial (Fin (n+1)) ℤ := by sorry
/-- BGW §2, p.6; BSW II §3.1, p.7. -/
def binaryDiscriminant {n : ℕ} (f : Fin (n+1) → R) : R :=
  MvPolynomial.eval₂ (Int.castRingHom R) f (universalBinaryDiscriminant n)
lemma binaryDiscriminant_map {S : Type*} [CommRing S] {n : ℕ}
    (φ : R →+* S) (f : Fin (n+1) → R) :
    binaryDiscriminant (fun i => φ (f i)) = φ (binaryDiscriminant f) := by sorry
lemma binaryDiscriminant_scale {n : ℕ} (hn : 2 ≤ n) (t : R) (f : Fin (n+1) → R) :
    binaryDiscriminant (fun i => t*f i) = t^(2*n-2) * binaryDiscriminant f := by sorry
-- ArithmeticOrbitRefinement.discriminant_quadratic
example (a b c : R) : binaryDiscriminant ![a,b,c] = b^2-4*a*c := by sorry
-- ArithmeticOrbitRefinement.discriminant_infinity
example : binaryDiscriminant (![0,1,-1,0] : Fin 4 → ℤ) = 1 := by sorry
-- ArithmeticOrbitRefinement.discriminant_repeated
example {n : ℕ} (hn : 2 ≤ n) :
    binaryDiscriminant (fun i : Fin (n+1) => if i = 0 then (1 : R) else 0) = 0 := by sorry
end Pencil

section Isotropic
variable {K : Type*} [Field K]
private def pairing {n : ℕ} (A : Matrix (Fin n) (Fin n) K) (u v : Fin n → K) : K :=
  ∑ i, ∑ j, u i * A i j * v j
/-- BGW §4, p.12: rank r is vector dimension, not projective dimension. -/
def commonIsotropic {n : ℕ} (r : ℕ) (A B : Matrix (Fin n) (Fin n) K) :
    Set (Submodule K (Fin n → K)) :=
  {U | Module.finrank K U = r ∧
    ∀ u ∈ U, ∀ v ∈ U, pairing A u v = 0 ∧ pairing B u v = 0}
lemma commonIsotropic_congr {n : ℕ} (r : ℕ) (A B g : Matrix (Fin n) (Fin n) K)
    (hg : g.det ≠ 0) (U : Submodule K (Fin n → K)) :
    U ∈ commonIsotropic r (g*A*g.transpose) (g*B*g.transpose) ↔
      U.map (Matrix.toLin' g.transpose) ∈ commonIsotropic r A B := by sorry
lemma commonIsotropic_zero {n : ℕ} (r : ℕ) :
    commonIsotropic r (0 : Matrix (Fin n) (Fin n) K) 0 =
      {U : Submodule K (Fin n → K) | Module.finrank K U = r} := by sorry
-- ArithmeticOrbitRefinement.isotropic_zero_line
example (U : Submodule K (Fin 3 → K)) (h : Module.finrank K U = 1) :
    U ∈ commonIsotropic 1 (0 : Matrix (Fin 3) (Fin 3) K) 0 := by sorry
-- ArithmeticOrbitRefinement.isotropic_positive
example : commonIsotropic 1 (1 : Matrix (Fin 3) (Fin 3) ℝ) 0 = ∅ := by sorry
-- ArithmeticOrbitRefinement.isotropic_block
example (g n : ℕ) (hgn : g ≤ n) (A B : Matrix (Fin n) (Fin n) K)
    (hA : ∀ i j, i.val < g → j.val < g → A i j = 0)
    (hB : ∀ i j, i.val < g → j.val < g → B i j = 0) :
    Submodule.span K {v | ∃ i : Fin n, i.val < g ∧
      v = fun j => if j = i then (1 : K) else 0} ∈ commonIsotropic g A B := by sorry
end Isotropic

section Orders
variable {D K L : Type*} [CommRing D] [IsDomain D] [Field K] [CommRing L]
variable [Algebra D K] [IsFractionRing D K] [Algebra K L] [Algebra D L]
variable [IsScalarTower D K L] [Module.Free K L] [Module.Finite K L]

private def zetaCoord {n : ℕ} (f : Fin (n+1) → D) (θ : L) (i : Fin n) : L :=
  ∑ j : Fin (n+1), if j.val < i.val then algebraMap D L (f j) * θ^(i.val-j.val) else 0
private def orderVectors {n : ℕ} (f : Fin (n+1) → D) (θ : L) : Fin n → L :=
  fun i => if i.val = 0 then 1 else zetaCoord f θ i
/-- BGW §2, p.7: a native subalgebra; its displayed lattice basis is an API theorem. -/
def formOrder {n : ℕ} (f : Fin (n+1) → D) (θ : L) : Subalgebra D L :=
  Algebra.adjoin D (Set.range (orderVectors f θ))
/-- The fractional-ideal lattice I_f(k); restrict k to 0,...,n-1 in its API. -/
def formIdeal {n : ℕ} (f : Fin (n+1) → D) (θ : L) (k : ℕ) : Submodule D L :=
  Submodule.span D (Set.range (fun i : Fin n =>
    if i.val ≤ k then θ^i.val else zetaCoord f θ i))
private def evaluatesToZero {n : ℕ} (f : Fin (n+1) → D) (θ : L) : Prop :=
  (∑ i : Fin (n+1), algebraMap D L (f i) * θ^(n-i.val)) = 0
private def derivativeAt {n : ℕ} (f : Fin (n+1) → D) (θ : L) : L :=
  ∑ i : Fin (n+1), (n-i.val : ℕ) * algebraMap D L (f i) * θ^(n-i.val-1)
private def traceDual (I : Submodule D L) : Submodule D L :=
  { carrier := {x | ∀ y ∈ I, Algebra.trace K L (x*y) ∈ Set.range (algebraMap D K)}
    zero_mem' := by sorry
    add_mem' := by sorry
    smul_mem' := by sorry }
lemma formOrder_span {n : ℕ} (hn : 3 ≤ n) (f : Fin (n+1) → D) (θ : L)
    (hroot : evaluatesToZero f θ) :
    (formOrder f θ).toSubmodule = Submodule.span D (Set.range (orderVectors f θ)) := by sorry
lemma formIdeal_stable {n : ℕ} (hn : 3 ≤ n) (f : Fin (n+1) → D) (θ : L)
    (hroot : evaluatesToZero f θ) (k : ℕ) (hk : k ≤ n-1)
    (r : L) (hr : r ∈ formOrder f θ) (x : L) (hx : x ∈ formIdeal f θ k) :
    r*x ∈ formIdeal f θ k := by sorry
lemma formIdeal_traceDual {n : ℕ} (hn : 3 ≤ n) (f : Fin (n+1) → D) (θ : L)
    (hf0 : f 0 ≠ 0) (hroot : evaluatesToZero f θ)
    (b : Module.Basis (Fin n) K L) (hb : ∀ i, b i = θ^i.val)
    (d : Lˣ) (hd : (d : L) = derivativeAt f θ) :
    traceDual (K := K) ((formOrder f θ).toSubmodule) =
      (formIdeal f θ (n-2)).map (LinearMap.mulLeft D ((d⁻¹ : Lˣ) : L)) := by sorry
-- ArithmeticOrbitRefinement.formOrder_monic
example {n : ℕ} (hn : 3 ≤ n) (f : Fin (n+1) → D) (θ : L) (hf0 : f 0 = 1) :
    formOrder f θ = Algebra.adjoin D ({θ} : Set L) := by sorry
-- ArithmeticOrbitRefinement.formIdeal_zero
example {n : ℕ} (hn : 3 ≤ n) (f : Fin (n+1) → D) (θ : L)
    (hroot : evaluatesToZero f θ) :
    formIdeal f θ 0 = (formOrder f θ).toSubmodule := by sorry
-- ArithmeticOrbitRefinement.formOrder_nonmonic
example : AdjoinRoot.root ((2 : ℚ[X])*X^4-1) ∉
    formOrder (![2,0,0,0,-1] : Fin 5 → ℤ)
      (AdjoinRoot.root ((2 : ℚ[X])*X^4-1)) := by sorry

/-- Determinant fractional ideal relative to the specified basis, not a
cardinality and not the field norm of a generator of I. -/
def idealNorm {n : ℕ} (b : Module.Basis (Fin n) K L) (I : Submodule D L) : Submodule D K :=
  Submodule.span D {z | ∃ v : Fin n → L, (∀ i, v i ∈ I) ∧
    z = Matrix.det (fun i j => b.repr (v j) i)}
/-- BGW Theorem16, p.7: actual stability, rank, inclusion, and norm constraints. -/
def IsOrbitTriple {n : ℕ} (f : Fin (n+1) → D) (θ : L) (b : Module.Basis (Fin n) K L)
    (I : Submodule D L) (α : Lˣ) (s : Kˣ) : Prop :=
  3 ≤ n ∧ evaluatesToZero f θ ∧ (∀ i, b i = orderVectors f θ i) ∧
    Module.Finite D I ∧ Submodule.span K (I : Set L) = ⊤ ∧
    (∀ r ∈ formOrder f θ, ∀ x ∈ I, r*x ∈ I) ∧
    (∀ x ∈ I, ∀ y ∈ I,
      x*y ∈ (formIdeal f θ (n-3)).map (LinearMap.mulLeft D (α : L))) ∧
    idealNorm b I = Submodule.span D ({(s : K)} : Set K) ∧
    Algebra.norm K (α : L) = (s : K)^2 * algebraMap D K (f 0)^(n-3)
lemma orbitTriple_rescale {n : ℕ} (f : Fin (n+1) → D) (θ : L)
    (b : Module.Basis (Fin n) K L) (I : Submodule D L) (α c : Lˣ) (s : Kˣ)
    (t : Kˣ) (ht : (t : K) = Algebra.norm K (c : L))
    (h : IsOrbitTriple f θ b I α s) :
    IsOrbitTriple f θ b (I.map (LinearMap.mulLeft D (c : L))) (c^2*α) (t*s) := by sorry
-- The constructor's basis is the displayed order basis, a triangular change
-- from the power basis. This is a basis-compatibility condition, not a dummy Prop.
-- ArithmeticOrbitRefinement.triple_monic
example {n : ℕ} (hn : 3 ≤ n) (f : Fin (n+1) → D) (θ : L)
    (hf0 : f 0 = 1) (hroot : evaluatesToZero f θ)
    (b : Module.Basis (Fin n) K L) (hb : ∀ i, b i = orderVectors f θ i) :
    IsOrbitTriple f θ b (formOrder f θ).toSubmodule 1 1 := by sorry
-- ArithmeticOrbitRefinement.triple_orientation
example {n : ℕ} (f : Fin (n+1) → D) (θ : L) (b : Module.Basis (Fin n) K L)
    (I : Submodule D L) (α : Lˣ) (s : Kˣ) :
    IsOrbitTriple f θ b I α s ↔ IsOrbitTriple f θ b I α (-s) := by sorry
-- ArithmeticOrbitRefinement.triple_zero_lattice
example {n : ℕ} (hn : 0 < n) (f : Fin (n+1) → D) (θ : L)
    (b : Module.Basis (Fin n) K L) (α : Lˣ) (s : Kˣ) :
    ¬IsOrbitTriple f θ b ⊥ α s := by sorry
-- ArithmeticOrbitRefinement.triple_degree_two
example (f : Fin 3 → D) (θ : L) (b : Module.Basis (Fin 2) K L)
    (I : Submodule D L) (α : Lˣ) (s : Kˣ) : ¬IsOrbitTriple f θ b I α s := by sorry
end Orders

section NormPairs
variable {K L : Type*} [Field K] [CommRing L] [Algebra K L]
variable [Module.Free K L] [Module.Finite K L]
/-- BGW Corollary19, p.8: degree and separability are retained alongside s. -/
structure NormPair (n : ℕ) (f0 : Kˣ) where
  degree_ge_three : 3 ≤ n
  degree_eq : Module.finrank K L = n
  separable : Algebra.IsSeparable K L
  alpha : Lˣ
  orientation : Kˣ
  norm_eq : Algebra.norm K (alpha : L) = (orientation : K)^2 * (f0 : K)^(n-3)
def NormPair.rescale {n : ℕ} {f0 : Kˣ} (a : NormPair (L := L) n f0) (c : Lˣ)
    (t : Kˣ) (ht : (t : K) = Algebra.norm K (c : L)) : NormPair (L := L) n f0 :=
  ⟨a.degree_ge_three, a.degree_eq, a.separable, c^2*a.alpha, t*a.orientation, by sorry⟩
lemma NormPair.ext {n : ℕ} {f0 : Kˣ} (a b : NormPair (L := L) n f0)
    (halpha : a.alpha = b.alpha) (horientation : a.orientation = b.orientation) : a = b := by sorry
lemma normPair_sign_iff {n : ℕ} {f0 : Kˣ} (a : NormPair (L := L) n f0) :
    (∃ c : Lˣ, c^2*a.alpha = a.alpha ∧
      Algebra.norm K (c : L) * (a.orientation : K) = -(a.orientation : K)) ↔
      ∃ c : Lˣ, c^2 = 1 ∧ Algebra.norm K (c : L) = -1 := by sorry
-- ArithmeticOrbitRefinement.normPair_unit
example {n : ℕ} [Algebra.IsSeparable K L] (hn : 3 ≤ n)
    (hdegree : Module.finrank K L = n) : ∃ a : NormPair (L := L) n (1 : Kˣ),
    a.alpha = 1 ∧ a.orientation = 1 := by sorry
-- ArithmeticOrbitRefinement.normPair_negative_orientation
example {n : ℕ} [Algebra.IsSeparable K L] (hn : 3 ≤ n)
    (hdegree : Module.finrank K L = n) (hchar : (2 : K) ≠ 0) :
    ∃ a : NormPair (L := L) n (1 : Kˣ),
      a.alpha = 1 ∧ a.orientation = -1 ∧ a.orientation ≠ 1 := by sorry
-- ArithmeticOrbitRefinement.normPair_odd_split
example : ∃ c : (Fin 3 → K)ˣ, c^2 = 1 ∧
    (c : Fin 3 → K) = ![-1,1,1] ∧ Algebra.norm K (c : Fin 3 → K) = -1 := by sorry
-- ArithmeticOrbitRefinement.normPair_wrong_degree
example : IsEmpty (NormPair (L := K) 3 (1 : Kˣ)) := by sorry
end NormPairs

/-- BSW I §1, p.4; BSW II introduction, p.3: universally quantify over coefficient
perturbations, including the perturbation zero. -/
def StrongSquareDivides {n : ℕ} (p : ℤ) (f : Fin (n+1) → ℤ) : Prop :=
  ∀ h : Fin (n+1) → ℤ, p^2 ∣ binaryDiscriminant (fun i => f i + p*h i)
def WeakSquareDivides {n : ℕ} (p : ℤ) (f : Fin (n+1) → ℤ) : Prop :=
  p^2 ∣ binaryDiscriminant f ∧ ¬StrongSquareDivides p f
lemma weak_strong_exclusive {n : ℕ} (p : ℤ) (f : Fin (n+1) → ℤ) :
    WeakSquareDivides p f → ¬StrongSquareDivides p f := by sorry
-- ArithmeticOrbitRefinement.weak_simple_double
example (p : ℕ) (hp : p.Prime) (hodd : p ≠ 2) :
    WeakSquareDivides (p : ℤ) ![1,-1,0,(p : ℤ)^2] := by sorry
-- ArithmeticOrbitRefinement.strong_triple_root
example (p : ℕ) (hp : p.Prime) : StrongSquareDivides (p : ℤ) ![1,0,0,0] := by sorry
-- ArithmeticOrbitRefinement.weak_two_empty
example {n : ℕ} (hn : 2 ≤ n) (f : Fin (n+1) → ℤ) : ¬WeakSquareDivides 2 f := by sorry

section Hyperdeterminant
variable {R : Type*} [CommRing R]
/-- BSW II (4), p.9: columns are signed maximal minors; rows are coefficients
of x^g,x^(g-1)y,...,y^g. The integral determinant has no denominators. -/
def qHyperdeterminant {g : ℕ} (U V : Matrix (Fin g) (Fin (g+1)) R) : R :=
  Matrix.det (fun i j : Fin (g+1) =>
    ((-1 : R[X])^j.val * Matrix.det (fun r c : Fin g =>
      C (U r (j.succAbove c)) * X - C (V r (j.succAbove c)))).coeff (g-i.val))
lemma qHyperdeterminant_transform {g : ℕ} (U V : Matrix (Fin g) (Fin (g+1)) R)
    (h : Matrix (Fin g) (Fin g) R) (k : Matrix (Fin (g+1)) (Fin (g+1)) R) :
    qHyperdeterminant (h*U*k.transpose) (h*V*k.transpose) =
      h.det^(g+1) * k.det^g * qHyperdeterminant U V := by sorry
lemma qHyperdeterminant_scale {g : ℕ} (t : R) (U V : Matrix (Fin g) (Fin (g+1)) R) :
    qHyperdeterminant (t • U) (t • V) = t^(g*(g+1))*qHyperdeterminant U V := by sorry
lemma qHyperdeterminant_sl2 {g : ℕ} (U V : Matrix (Fin g) (Fin (g+1)) R)
    (a b c d : R) (hdet : a*d-b*c = 1) :
    qHyperdeterminant (a • U + b • V) (c • U + d • V) = qHyperdeterminant U V := by sorry
-- ArithmeticOrbitRefinement.q_g1
example : qHyperdeterminant (!![1,0] : Matrix (Fin 1) (Fin 2) ℤ) (!![0,1]) = -1 := by sorry
-- ArithmeticOrbitRefinement.q_g2
example : qHyperdeterminant (!![1,0,0;0,1,0] : Matrix (Fin 2) (Fin 3) ℤ)
    (!![0,1,0;0,0,1]) = -1 := by sorry
-- ArithmeticOrbitRefinement.q_zero
example {g : ℕ} (hg : 1 ≤ g) :
    qHyperdeterminant (0 : Matrix (Fin g) (Fin (g+1)) R) 0 = 0 := by sorry
end Hyperdeterminant

private def topBlock {T : Type*} {g : ℕ} (A : Matrix (Fin (2*g+1)) (Fin (2*g+1)) T) :
    Matrix (Fin g) (Fin (g+1)) T :=
  fun i j => A ⟨i.val, by omega⟩ ⟨g+j.val, by omega⟩
private def standardMarking {g : ℕ} : Submodule ℤ (Fin (2*g+1) → ℤ) :=
  Submodule.span ℤ {v | ∃ i : Fin (2*g+1), i.val < g ∧ v = e i}
/-- An integral marking includes the actual primitive lattice and an adapted
unimodular completion. The target proves completion-independence. -/
structure AdaptedMarking (g : ℕ) where
  lattice : Submodule ℤ (Fin (2*g+1) → ℤ)
  completion : Matrix (Fin (2*g+1)) (Fin (2*g+1)) ℤ
  determinant_one : completion.det = 1
  adapted : standardMarking.map (Matrix.toLin' completion.transpose) = lattice
/-- BSW II §3.4, pp.13–14: integer absolute Q with a marking. -/
def markedQ {g : ℕ} (A B : Matrix (Fin (2*g+1)) (Fin (2*g+1)) ℤ)
    (m : AdaptedMarking g) : ℤ :=
  |qHyperdeterminant (topBlock (m.completion*A*m.completion.transpose))
    (topBlock (m.completion*B*m.completion.transpose))|
lemma markedQ_independent {g : ℕ} (A B : Matrix (Fin (2*g+1)) (Fin (2*g+1)) ℤ)
    (hA : A.IsSymm) (hB : B.IsSymm) (m m' : AdaptedMarking g)
    (hmark : m.lattice = m'.lattice)
    (hisA : ∀ u ∈ m.lattice, ∀ v ∈ m.lattice,
      ∑ i, ∑ j, u i*A i j*v j = 0)
    (hisB : ∀ u ∈ m.lattice, ∀ v ∈ m.lattice,
      ∑ i, ∑ j, u i*B i j*v j = 0) : markedQ A B m = markedQ A B m' := by sorry
lemma markedQ_equivariant {g : ℕ} (A B h : Matrix (Fin (2*g+1)) (Fin (2*g+1)) ℤ)
    (hh : h.det = 1) (m m' : AdaptedMarking g)
    (hcompletion : m'.completion * h = m.completion) :
    markedQ (h*A*h.transpose) (h*B*h.transpose) m' = markedQ A B m := by sorry
private def markingOne : AdaptedMarking 1 := ⟨standardMarking,1,by sorry,by sorry⟩
private def sampleA : Matrix (Fin 3) (Fin 3) ℤ := !![0,1,0;1,0,0;0,0,0]
private def sampleB : Matrix (Fin 3) (Fin 3) ℤ := !![0,0,1;0,0,0;1,0,0]
-- ArithmeticOrbitRefinement.markedQ_standard
example : markedQ sampleA sampleB markingOne = 1 := by sorry
-- ArithmeticOrbitRefinement.markedQ_parabolic
example :
    qHyperdeterminant (topBlock (g := 1) ((!![-1,0,0;0,-1,0;0,0,1])*sampleA*
      (!![-1,0,0;0,-1,0;0,0,1]).transpose))
      (topBlock (g := 1) ((!![-1,0,0;0,-1,0;0,0,1])*sampleB*
      (!![-1,0,0;0,-1,0;0,0,1]).transpose)) =
      -qHyperdeterminant (topBlock (g := 1) sampleA) (topBlock (g := 1) sampleB) := by sorry
-- ArithmeticOrbitRefinement.markedQ_rational
example :
    let A : Matrix (Fin 3) (Fin 3) ℚ := !![0,1,0;1,0,0;0,0,0]
    let B : Matrix (Fin 3) (Fin 3) ℚ := !![0,0,1;0,0,0;1,0,0]
    let h : Matrix (Fin 3) (Fin 3) ℚ := !![2,0,0;0,1,0;0,0,1/2]
    h.det = 1 ∧
    |qHyperdeterminant (topBlock (g := 1) (h*A*h.transpose))
      (topBlock (g := 1) (h*B*h.transpose))| = 2 ∧
    |qHyperdeterminant (topBlock (g := 1) A) (topBlock (g := 1) B)| = 1 := by sorry

/-- BSW II Theorem3.5, pp.11–12: integer divisibility on the zero-block locus. -/
theorem q_squared_divides_discriminant {g : ℕ} (hg : 1 ≤ g)
    (A B : Matrix (Fin (2*g+1)) (Fin (2*g+1)) ℤ)
    (hA : A.IsSymm) (hB : B.IsSymm)
    (hzA : ∀ i j, i.val < g → j.val < g → A i j = 0)
    (hzB : ∀ i j, i.val < g → j.val < g → B i j = 0) :
    qHyperdeterminant (topBlock A) (topBlock B)^2 ∣
      binaryDiscriminant (pencilInvariant A B) := by sorry

/-- BSW II Theorem3.7, pp.12–13: the nonempty weak locus uses odd m. -/
theorem weak_lift_odd {g : ℕ} (hg : 1 ≤ g) (m : ℕ) (hm : 0 < m)
    (hodd : Odd m) (hsq : Squarefree m) (f : Fin (2*g+2) → ℤ)
    (hweak : ∀ p : ℕ, p.Prime → p ∣ m → WeakSquareDivides (p : ℤ) f) :
    ∃ A B : Matrix (Fin (2*g+1)) (Fin (2*g+1)) ℤ,
      A.IsSymm ∧ B.IsSymm ∧ pencilInvariant A B = f ∧
      (∀ i j, i.val < g → j.val < g → A i j = 0) ∧
      (∀ i j, i.val < g → j.val < g → B i j = 0) ∧
      |qHyperdeterminant (topBlock A) (topBlock B)| = m := by sorry

/-- BSW II Theorem3.7 and §3.4: the determinant invariant separates forms;
Q separates m after irreducibility supplies the unique rational marking. -/
theorem weak_lift_odd_orbit_separation {g : ℕ} (hg : 1 ≤ g)
    (A B A' B' h : Matrix (Fin (2*g+1)) (Fin (2*g+1)) ℤ)
    (hA : A.IsSymm) (hB : B.IsSymm) (hA' : A'.IsSymm) (hB' : B'.IsSymm)
    (hzA : ∀ i j, i.val < g → j.val < g → A i j = 0)
    (hzB : ∀ i j, i.val < g → j.val < g → B i j = 0)
    (hzA' : ∀ i j, i.val < g → j.val < g → A' i j = 0)
    (hzB' : ∀ i j, i.val < g → j.val < g → B' i j = 0)
    (hf : Irreducible (∑ i : Fin (2*g+2),
      C ((pencilInvariant A B i : ℤ) : ℚ) * X^(2*g+1-i.val)))
    (hh : h.det = 1) (hcongrA : A' = h*A*h.transpose)
    (hcongrB : B' = h*B*h.transpose) :
    pencilInvariant A B = pencilInvariant A' B' ∧
      |qHyperdeterminant (topBlock A) (topBlock B)| =
      |qHyperdeterminant (topBlock A') (topBlock B')| := by sorry

/-! Omission register (these targets remain precise mathematical statements in
README and packet; absent types are not replaced by arbitrary Prop parameters):

* integral-minor-fibres: the full orbit/lattice bijection and divisor-sum count
  require the current IntegralLattices saturated-lattice/completion adapter.
  The native integral realization and fibre count are stated above.
* quartic-invariant-index, quartic-etale-resolvent: the parent based quartic
  ring/resolvent/content and rational S4-closure/Galois-set interfaces.
* integral-quintic-realization, quintic-minimal-model: the parent normalized
  structure-coefficient image and GL4×GL5 orbit/maximal-order interfaces. The
  nonétale rational existence proof is a separate recorded gap.
* nondegenerate-resolvent-comparison: rational S5-closure, its order20 fixed
  algebra, labelled trace duals and the fundamental-map comparison.
* wood-ring-interpretation: the parent quartic/resolvent isomorphism groupoid
  and integral ternary-form classification; IsMonogenizing is stated above.
* integral-pencil-orbits and field-pencil-stabilizers: central quotient and
  restriction-of-scalars group schemes, their integral points and stabilizers.
  The determinant-lattice triple and oriented norm-pair interfaces are present.
* pencil-existence, pencil-fano-torsor, locally-soluble-pencil-orbits,
  integral-soluble-pencils, good-prime-integral-pencils: generalized Picard,
  regular augmented Fano schemes, two-cover Selmer torsors and local Néron model
  interfaces. The smooth Jacobian/genus-one requests supply only part of this.
* one-matrix-slice: use current OrthogonalSpinGroups Layer0. The atlas catalogue
  needs its source-file adapter; generic SO is not redefined in this file.
* even-weak-lift: the universal q polynomial after denominator cancellation,
  flag scheme and its native coefficient API, including the coprime-constant
  domain. Negative-index I_f(-1) for the n=2 boundary is also not represented.
* genus-one-stabilizer-schemes: theta groups and full linear-group quotients,
  Picard degree2–5 objects and the Galois-equivariant stabilizer comparison.

The concrete predicates above have actual formulas or native algebraic
conditions. They are only the interfaces they state, and do not encode the
omitted geometric dictionaries. All proofs and large polynomial constructions
remain unimplemented.
-/
end ArithmeticOrbitRefinement
