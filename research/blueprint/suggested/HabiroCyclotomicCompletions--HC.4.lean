/-
This file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/HabiroCyclotomicCompletions--HC.4.md` is definitive.
These statements suggest Lean forms so that contributors and reviewers can
converge on names and signatures. They claim no implementation.

BP-HabiroCyclotomicCompletions--HC.4. Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. All nodes remain unchecked.
The factorial-compatible-family model below sketches the imported HC.1–HC.2
object, rather than introducing a second completion into the packet. Finite
indices are ordered exactly as in the document. Auxiliary maps have concrete
domains and codomains; no missing theorem is encoded as an assumed field.
-/
import Mathlib.RingTheory.AdjoinRoot
import Mathlib.RingTheory.Polynomial.Cyclotomic.Basic
import Mathlib.RingTheory.Polynomial.Cyclotomic.Roots
import Mathlib.RingTheory.RootsOfUnity.Lemmas
import Mathlib.RingTheory.Polynomial.Resultant.Basic
import Mathlib.Algebra.Polynomial.HasseDeriv
import Mathlib.RingTheory.PowerSeries.Basic
import Mathlib.RingTheory.Ideal.Quotient.Operations
import Mathlib.LinearAlgebra.Matrix.Adjugate
import Mathlib.LinearAlgebra.Matrix.Block
import Mathlib.LinearAlgebra.Matrix.NonsingularInverse
import Mathlib.LinearAlgebra.Basis.VectorSpace
import Mathlib.RingTheory.Finiteness.Defs
import Mathlib.RingTheory.Localization.FractionRing
import Mathlib.RingTheory.Localization.Integer
import Mathlib.RingTheory.Localization.Away.Basic
import Mathlib.NumberTheory.Padics.PadicIntegers
import Mathlib.Data.Nat.Totient
import Mathlib.Data.Nat.Factorization.Defs

noncomputable section
namespace TauCeti.Habiro.HC4
open Polynomial
open scoped BigOperators Matrix

variable (R : Type*) [CommRing R]

/-- Imported HC.1 factorial polynomial. Its leading coefficient is a unit,
not necessarily one. -/
def factorialPoly (n : ℕ) : R[X] := ∏ i ∈ Finset.range n, (1 - X ^ (i + 1))

abbrev FiniteH (n : ℕ) := AdjoinRoot (factorialPoly R n)

def hTransition (n : ℕ) : FiniteH R (n + 1) →ₐ[R] FiniteH R n := sorry

theorem hTransition_mk (n : ℕ) (g : R[X]) :
    hTransition R n (AdjoinRoot.mk _ g) = AdjoinRoot.mk _ g := sorry

/-- Concrete imported HC.1 completion in a cofinal factorial system. -/
def naiveCompat : Subalgebra R (∀ n : ℕ, FiniteH R n) where
  carrier := {x | ∀ n, hTransition R n (x (n + 1)) = x n}
  algebraMap_mem' := by sorry
  zero_mem' := by sorry
  one_mem' := by sorry
  add_mem' := by sorry
  mul_mem' := by sorry

abbrev Naive := naiveCompat R

def fromPoly : R[X] →ₐ[R] Naive R := sorry

def hProjection (n : ℕ) : Naive R →ₐ[R] FiniteH R n :=
  { toFun := fun x => x.val n
    map_zero' := rfl
    map_one' := rfl
    map_add' := fun _ _ => rfl
    map_mul' := fun _ _ => rfl
    commutes' := fun _ => rfl }

theorem hProjection_fromPoly (n : ℕ) (g : R[X]) :
    hProjection R n (fromPoly R g) = AdjoinRoot.mk _ g := sorry

/-- Imported normalized digit at GSWZ index n≥1 (HC.2 index n−1). -/
def digit (h : Naive R) (n : ℕ) : R[X] := sorry

def naiveMap {S : Type*} [CommRing S] (φ : R →+* S) : Naive R →+* Naive S := sorry

abbrev CycloCoeff (m : ℕ) := AdjoinRoot (cyclotomic m R)

def cycloRoot (m : ℕ) : CycloCoeff R m := AdjoinRoot.root (cyclotomic m R)

/-- HC.4/universal-taylor-product. Universal quotient, including split factors. -/
abbrev TaylorProduct := ∀ m : ℕ+, PowerSeries (CycloCoeff R m)

def taylorCoeff (f : TaylorProduct R) (m : ℕ+) (l : ℕ) : CycloCoeff R m :=
  PowerSeries.coeff (l - 1) (f m)

def gamma (f : TaylorProduct R) (m : ℕ+) (l j : ℕ) : R :=
  (AdjoinRoot.modByMonicHom (cyclotomic.monic m R) (taylorCoeff R f m l)).coeff j

namespace TaylorProduct

theorem ext {f g : TaylorProduct R}
    (h : ∀ m k, PowerSeries.coeff k (f m) = PowerSeries.coeff k (g m)) : f = g := sorry

def map {S : Type*} [CommRing S] (φ : R →+* S) : TaylorProduct R →+* TaylorProduct S := sorry

theorem map_gamma {S : Type*} [CommRing S] (φ : R →+* S)
    (f : TaylorProduct R) (m : ℕ+) (l j : ℕ) :
    gamma S (map R φ f) m l j = φ (gamma R f m l j) := sorry

theorem map_id : map R (RingHom.id R) = RingHom.id (TaylorProduct R) := sorry

theorem map_comp {S T : Type*} [CommRing S] [CommRing T]
    (φ : R →+* S) (ψ : S →+* T) :
    map R (ψ.comp φ) = (map S ψ).comp (map R φ) := sorry
end TaylorProduct

/-- Test taylorCoeff_zero. -/
example (m : ℕ+) (l : ℕ) (hl : 0 < l) : taylorCoeff R 0 m l = 0 := sorry

/-- Test gamma_one. -/
example [Nontrivial R] (m : ℕ+) (l j : ℕ) (hl : 0 < l) (hj : j < Nat.totient m) :
    gamma R 1 m l j = if l = 1 ∧ j = 0 then 1 else 0 := sorry

/-- Specialization to one chosen root, used only in the split-coefficient test. -/
def atFourthRoot {K : Type*} [Field K] (i : K) (hi : i ^ 2 + 1 = 0) :
    CycloCoeff K 4 →ₐ[K] K := sorry

/-- Test universal_split_nonexample. Applies in particular to K=Q(i). -/
example {K : Type*} [Field K] [CharZero K] (i : K) (hi : i ^ 2 + 1 = 0) :
    cycloRoot K 4 - algebraMap K (CycloCoeff K 4) i ≠ 0 ∧
    atFourthRoot i hi (cycloRoot K 4 - algebraMap K (CycloCoeff K 4) i) = 0 := sorry

/-- HC.4/factorial-kernel-filtration. -/
def hFiltration (N : ℕ) : Ideal (Naive R) := RingHom.ker (hProjection R (N - 1))

theorem mem_hFiltration_iff (N : ℕ) (h : Naive R) :
    h ∈ hFiltration R N ↔ hProjection R (N - 1) h = 0 := sorry

/-- HC.4/factorial-kernel-characterisation (principal-kernel part). -/
theorem hFiltration_eq_principal (N : ℕ) (hN : 0 < N) :
    hFiltration R N = Ideal.span {fromPoly R (factorialPoly R (N - 1))} := sorry

theorem hFiltration_antitone (N : ℕ) (hN : 0 < N) :
    hFiltration R (N + 1) ≤ hFiltration R N := sorry

theorem hFiltration_inter : (⨅ N : ℕ+, hFiltration R N) = ⊥ := sorry

def hFiltration_quotient_equiv (N : ℕ) (hN : 0 < N) :
    (Naive R ⧸ hFiltration R N) ≃ₐ[R] FiniteH R (N - 1) := sorry

/-- Test hFiltration_one. -/
example : hFiltration R 1 = ⊤ := sorry

/-- Test hFiltration_two. -/
example (g : R[X]) : fromPoly R g ∈ hFiltration R 2 ↔ g.eval 1 = 0 := sorry

/-- Test hFiltration_digit_boundary. -/
example (N : ℕ) (hN : 0 < N) :
    fromPoly ℤ (factorialPoly ℤ (N - 1)) ∈ hFiltration ℤ N ∧
    fromPoly ℤ (factorialPoly ℤ (N - 1)) ∉ hFiltration ℤ (N + 1) := sorry

/-- HC.4/weighted-taylor-filtration. -/
def pFiltration (N : ℕ) : Ideal (TaylorProduct R) where
  carrier := {f | ∀ (m : ℕ+) (l : ℕ), 0 < l → (m : ℕ) * l < N →
    taylorCoeff R f m l = 0}
  zero_mem' := by sorry
  add_mem' := by sorry
  smul_mem' := by sorry

theorem mem_pFiltration_iff (N : ℕ) (f : TaylorProduct R) :
    f ∈ pFiltration R N ↔ ∀ (m : ℕ+) (l : ℕ), 0 < l → (m : ℕ) * l < N →
      taylorCoeff R f m l = 0 := sorry

theorem pFiltration_antitone (N : ℕ) : pFiltration R (N + 1) ≤ pFiltration R N := sorry

theorem pFiltration_inter : (⨅ N : ℕ+, pFiltration R N) = ⊥ := sorry

abbrev FiniteP (N : ℕ) := TaylorProduct R ⧸ pFiltration R N

def dimension (N : ℕ) : ℕ := N * (N - 1) / 2

/-- Source columns (n,k), 1≤n<N, k<n, lexicographically ordered. -/
def digitRows (N : ℕ) : List (ℕ × ℕ) :=
  ((List.range N).drop 1).flatMap fun n => (List.range n).map fun k => (n, k)

/-- Target rows (m,l,j), weight first, decreasing m within weight, then j. -/
def jetRows (N : ℕ) : List (ℕ × ℕ × ℕ) :=
  ((List.range N).drop 1).flatMap fun w =>
    (w.divisors.sort (· ≤ ·)).reverse.flatMap fun m =>
      (List.range (Nat.totient m)).map fun j => (m, w / m, j)

def digitAt (N : ℕ) (i : Fin (dimension N)) : ℕ × ℕ :=
  (digitRows N).getD i.val (1, 0)

def jetAt (N : ℕ) (i : Fin (dimension N)) : ℕ × ℕ × ℕ :=
  (jetRows N).getD i.val (1, 1, 0)

theorem jetAt_pos (N : ℕ) (i : Fin (dimension N)) : 0 < (jetAt N i).1 := sorry

def jetCoordinates (N : ℕ) (f : TaylorProduct R) : Fin (dimension N) → R :=
  fun i => gamma R f ⟨(jetAt N i).1, jetAt_pos N i⟩ (jetAt N i).2.1 (jetAt N i).2.2

def digitCoordinates (N : ℕ) (h : Naive R) : Fin (dimension N) → R :=
  fun i => (digit R h (digitAt N i).1).coeff (digitAt N i).2

/-- HC.4/weighted-jet-kernel. -/
theorem jetCoordinates_kernel (N : ℕ) (hN : 0 < N) (f : TaylorProduct R) :
    jetCoordinates R N f = 0 ↔ f ∈ pFiltration R N := sorry

/-- Test pFiltration_one. -/
example : pFiltration R 1 = ⊤ := sorry

/-- Test pFiltration_three. -/
example (f : TaylorProduct R) : f ∈ pFiltration R 3 ↔
    PowerSeries.coeff 0 (f 1) = 0 ∧ PowerSeries.coeff 1 (f 1) = 0 ∧
    PowerSeries.coeff 0 (f 2) = 0 := sorry

/-- Test pFiltration_shift_nonexample. -/
example (f : TaylorProduct ℤ) (hf : ∀ m : ℕ+,
    f m = if (m : ℕ) = 2 then PowerSeries.X else 0) :
    f ∈ pFiltration ℤ 4 ∧ f ∉ pFiltration ℤ 5 := sorry

/-- HC.4/multiplicative-taylor-comparison: imported additive Taylor map scaled
by -z_m in each degree. -/
def iota : Naive R →ₐ[R] TaylorProduct R := sorry

/-- Polynomial expansion in u, used to define the integer matrix explicitly. -/
def taylorPolynomial (m : ℕ) (g : R[X]) : (CycloCoeff R m)[X] :=
  g.eval₂ ((Polynomial.C : CycloCoeff R m →+* (CycloCoeff R m)[X]).comp
    (algebraMap R (CycloCoeff R m))) (C (cycloRoot R m) * (1 - X))

theorem iota_fromPoly (g : R[X]) (m : ℕ+) :
    iota R (fromPoly R g) m = (taylorPolynomial R m g : PowerSeries (CycloCoeff R m)) := sorry

theorem coeff_iota_fromPoly (g : R[X]) (m : ℕ+) (k : ℕ) :
    PowerSeries.coeff k (iota R (fromPoly R g) m) =
      (-cycloRoot R m) ^ k * (Polynomial.hasseDeriv k g).eval₂
        (algebraMap R (CycloCoeff R m)) (cycloRoot R m) := sorry

theorem iota_map {S : Type*} [CommRing S] (φ : R →+* S) (h : Naive R) :
    iota S (naiveMap R φ h) = TaylorProduct.map R φ (iota R h) := sorry

/-- Test iota_one. -/
example : iota R 1 = 1 := sorry

/-- Test iota_q. -/
example (m : ℕ+) :
    PowerSeries.coeff 0 (iota R (fromPoly R X) m) = cycloRoot R m ∧
    PowerSeries.coeff 1 (iota R (fromPoly R X) m) = -cycloRoot R m ∧
    PowerSeries.coeff 2 (iota R (fromPoly R X) m) = 0 := sorry

/-- Imported HC.3 additive Taylor component at q=z_m+x. -/
def additiveTaylor (m : ℕ+) : Naive R →ₐ[R] PowerSeries (CycloCoeff R m) := sorry

/-- Test iota_additive_coordinate. -/
example (h : Naive R) (m : ℕ+) (k : ℕ) :
    PowerSeries.coeff k (iota R h m) =
      (-cycloRoot R m) ^ k * PowerSeries.coeff k (additiveTaylor R m h) := sorry

/-- Nested ideals are quotiented as R-modules. -/
def idealStep {A : Type*} [CommRing A] [Algebra R A] (I J : Ideal A) : Submodule R I :=
  (J.restrictScalars R).comap (I.restrictScalars R).subtype

abbrev HGr (N : ℕ) := (hFiltration R N) ⧸
  idealStep R (hFiltration R N) (hFiltration R (N + 1))

abbrev PGr (N : ℕ) := (pFiltration R N) ⧸
  idealStep R (pFiltration R N) (pFiltration R (N + 1))

abbrev DivisorCoeff (N : ℕ) := ∀ m : {m : ℕ // m ∈ N.divisors}, CycloCoeff R m.val

/-- HC.4/factorial-graded-piece: [g] maps to [P_(N-1)g]. -/
def factorialGradedEquiv (N : ℕ) (hN : 0 < N) :
    AdjoinRoot (1 - X ^ N : R[X]) ≃ₗ[R] HGr R N := sorry

/-- HC.4/taylor-graded-piece: extract exponent N/m−1. -/
def taylorGradedEquiv (N : ℕ) (hN : 0 < N) : PGr R N ≃ₗ[R] DivisorCoeff R N := sorry

/-- The digit and jet bases of HC.4/finite-precision-bases. -/
def finiteDigitBasis (N : ℕ) (hN : 0 < N) :
    Module.Basis (Fin (dimension N)) R (FiniteH R (N - 1)) := sorry

def finiteJetBasis (N : ℕ) (hN : 0 < N) :
    Module.Basis (Fin (dimension N)) R (FiniteP R N) := sorry

/-- HC.4/factorial-vanishing-order. -/
theorem factorial_vanishing_order (n : ℕ) (m : ℕ+) :
    (X : (CycloCoeff R m)[X]) ^ (n / m) ∣
      taylorPolynomial R m (factorialPoly R n) := sorry

theorem iota_filtered (N : ℕ) (hN : 0 < N) (h : Naive R)
    (hh : h ∈ hFiltration R N) : iota R h ∈ pFiltration R N := sorry

/-- HC.4/leading-factor. -/
def leadingFactor (m l : ℕ) : ℕ := m ^ (2 * l - 1) * (l - 1).factorial

theorem leadingFactor_pos (m l : ℕ) (hm : 0 < m) (hl : 0 < l) :
    0 < leadingFactor m l := sorry

theorem leadingFactor_succ (m l : ℕ) (hl : 0 < l) :
    leadingFactor m (l + 1) = m ^ 2 * l * leadingFactor m l := sorry

/-- Test leadingFactor_order_one. -/
example : leadingFactor 1 4 = 6 := sorry

/-- Test leadingFactor_ell_one. -/
example (m : ℕ) : leadingFactor m 1 = m := sorry

/-- Test leadingFactor_two_two. -/
example : leadingFactor 2 2 = 8 := sorry

/-- HC.4/root-product-identity, in the universal cyclotomic algebra. -/
theorem root_product_identity (m : ℕ+) :
    (∏ r ∈ (Finset.range m).erase 0, (1 - cycloRoot R m ^ r)) = (m : CycloCoeff R m) := sorry

/-- HC.4/factorial-leading-coefficient. -/
theorem factorial_leading_coefficient (m : ℕ+) (l : ℕ) (hl : 0 < l) :
    (∀ k < l - 1, (taylorPolynomial R m (factorialPoly R (m * l - 1))).coeff k = 0) ∧
    (taylorPolynomial R m (factorialPoly R (m * l - 1))).coeff (l - 1) =
      (leadingFactor m l : CycloCoeff R m) := sorry

def gradedIota (N : ℕ) (hN : 0 < N) : HGr R N →ₗ[R] PGr R N := sorry

/-- HC.4/graded-taylor-map. -/
theorem graded_taylor_map (N : ℕ) (hN : 0 < N) (g : R[X])
    (m : {m : ℕ // m ∈ N.divisors}) :
    taylorGradedEquiv R N hN
      (gradedIota R N hN (factorialGradedEquiv R N hN (AdjoinRoot.mk _ g))) m =
    (leadingFactor m.val (N / m.val) : CycloCoeff R m.val) *
      g.eval₂ (algebraMap R (CycloCoeff R m.val)) (cycloRoot R m.val) := sorry

def simultaneousRemainders (N : ℕ) (hN : 0 < N) :
    AdjoinRoot (X ^ N - 1 : R[X]) →ₐ[R] DivisorCoeff R N := sorry

/-- Explicit torsion-free condition used on the underlying abelian group. -/
theorem simultaneous_remainders_injective
    (hR : ∀ z : ℤ, z ≠ 0 → Function.Injective (fun r : R => z • r))
    (N : ℕ) (hN : 0 < N) : Function.Injective (simultaneousRemainders R N hN) := sorry

theorem simultaneous_remainders_bijective [Algebra ℚ R] (N : ℕ) (hN : 0 < N) :
    Function.Bijective (simultaneousRemainders R N hN) := sorry

/-- HC.4/graded-taylor-injective. -/
theorem graded_taylor_injective
    (hR : ∀ z : ℤ, z ≠ 0 → Function.Injective (fun r : R => z • r))
    (N : ℕ) (hN : 0 < N) : Function.Injective (gradedIota R N hN) := sorry

theorem graded_taylor_bijective [Algebra ℚ R] (N : ℕ) (hN : 0 < N) :
    Function.Bijective (gradedIota R N hN) := sorry

/-- HC.4/finite-taylor-map. -/
def finiteIota (N : ℕ) (hN : 0 < N) : FiniteH R (N - 1) →ₐ[R] FiniteP R N := sorry

theorem finiteIota_polynomial (N : ℕ) (hN : 0 < N) (g : R[X]) :
    finiteIota R N hN (AdjoinRoot.mk _ g) =
      Ideal.Quotient.mk _ (iota R (fromPoly R g)) := sorry

def pTransition (N : ℕ) : FiniteP R (N + 1) →ₐ[R] FiniteP R N := sorry

theorem finiteIota_transition (N : ℕ) (hN : 0 < N) (g : FiniteH R N) :
    pTransition R N (finiteIota R (N + 1) (by omega) g) =
      finiteIota R N hN (hTransition R (N - 1) (by simpa [Nat.sub_add_cancel hN] using g)) := sorry

def finiteHMap {S : Type*} [CommRing S] (φ : R →+* S) (n : ℕ) :
    FiniteH R n →+* FiniteH S n := sorry

def finitePMap {S : Type*} [CommRing S] (φ : R →+* S) (N : ℕ) :
    FiniteP R N →+* FiniteP S N := sorry

theorem finiteIota_baseChange {S : Type*} [CommRing S] (φ : R →+* S)
    (N : ℕ) (hN : 0 < N) (g : FiniteH R (N - 1)) :
    finiteIota S N hN (finiteHMap R φ (N - 1) g) =
      finitePMap R φ N (finiteIota R N hN g) := sorry

/-- Test finiteIota_one. -/
example : Function.Bijective (finiteIota R 1 (by decide)) ∧ Subsingleton (FiniteP R 1) := sorry

/-- Test finiteIota_two. Under the constant R-coordinate bases this is the identity. -/
example (g : R[X]) : finiteIota R 2 (by decide) (AdjoinRoot.mk _ g) =
    algebraMap R (FiniteP R 2) (g.eval 1) := sorry

/-- HC.4/finite-taylor-injective. -/
theorem finite_taylor_injective
    (hR : ∀ z : ℤ, z ≠ 0 → Function.Injective (fun r : R => z • r))
    (N : ℕ) (hN : 0 < N) : Function.Injective (finiteIota R N hN) := sorry

theorem finite_taylor_bijective [Algebra ℚ R] (N : ℕ) (hN : 0 < N) :
    Function.Bijective (finiteIota R N hN) := sorry

/-- HC.4/global-taylor-injective. Joint components, with no domain assumption. -/
theorem global_taylor_injective
    (hR : ∀ z : ℤ, z ≠ 0 → Function.Injective (fun r : R => z • r)) :
    Function.Injective (iota R) := sorry

/-- HC.4/rational-taylor-isomorphism. H_(R), not H_Z tensor R. -/
theorem rational_taylor_isomorphism [Algebra ℚ R] : Function.Bijective (iota R) := sorry

def rationalTaylorEquiv [Algebra ℚ R] : Naive R ≃ₐ[R] TaylorProduct R :=
  AlgEquiv.ofBijective (iota R) (rational_taylor_isomorphism R)

/-- HC.4/taylor-matrix. Entries come from polynomial substitution and monic reduction. -/
def taylorMatrix (N : ℕ) : Matrix (Fin (dimension N)) (Fin (dimension N)) ℤ :=
  fun i k =>
    let row := jetAt N i
    let col := digitAt N k
    let g := X ^ col.2 * factorialPoly ℤ (col.1 - 1)
    (AdjoinRoot.modByMonicHom (cyclotomic.monic row.1 ℤ)
      ((taylorPolynomial ℤ row.1 g).coeff (row.2.1 - 1))).coeff row.2.2

theorem taylorMatrix_entry (N : ℕ) (i k : Fin (dimension N)) :
    taylorMatrix N i k =
    (AdjoinRoot.modByMonicHom (cyclotomic.monic (jetAt N i).1 ℤ)
      ((taylorPolynomial ℤ (jetAt N i).1
        (X ^ (digitAt N k).2 * factorialPoly ℤ ((digitAt N k).1 - 1))).coeff
        ((jetAt N i).2.1 - 1))).coeff (jetAt N i).2.2 := sorry

/-- HC.4/finite-taylor-coordinate-matrix, with the following base-change and zero statements. -/
theorem taylorMatrix_mul_digits (N : ℕ) (hN : 0 < N) (h : Naive R) :
    (taylorMatrix N).map (Int.castRingHom R) *ᵥ digitCoordinates R N h =
      jetCoordinates R N (iota R h) := sorry

theorem taylorMatrix_baseChange (N : ℕ) (hN : 0 < N) :
    (finiteIota R N hN).toLinearMap.toMatrix (finiteDigitBasis R N hN)
      (finiteJetBasis R N hN) = (taylorMatrix N).map (Int.castRingHom R) := sorry

theorem taylorMatrix_zero_above_weight (N : ℕ) (i k : Fin (dimension N))
    (h : (jetAt N i).1 * (jetAt N i).2.1 < (digitAt N k).1) :
    taylorMatrix N i k = 0 := sorry

/-- Test taylorMatrix_empty. -/
example : (taylorMatrix 1).det = 1 := sorry

/-- Test taylorMatrix_three. -/
example : taylorMatrix 3 = !![1,0,0; 1,2,-2; 0,1,1] := sorry

/-- Test taylorMatrix_five_kontsevich. -/
example : taylorMatrix 5 *ᵥ ![1,1,0,1,0,0,1,0,0,0] =
    ![1,3,1,5,-1,2,8,-3,11,5] := sorry

/-- Test taylorMatrix_sign_nonexample. -/
example : (taylorPolynomial ℤ 1 (X * (1 - X))).coeff 1 = 1 := sorry

/-- HC.4/two-factor-remainder-determinant: the remainder map in monomial bases. -/
def twoRemainderMatrix (f g : ℤ[X]) :
    Matrix (Fin (f.natDegree + g.natDegree)) (Fin (f.natDegree + g.natDegree)) ℤ :=
  fun i k => if i.val < f.natDegree then
    ((X ^ k.val) %ₘ f).coeff i.val
  else ((X ^ k.val) %ₘ g).coeff (i.val - f.natDegree)

theorem two_factor_remainder_determinant (f g : ℤ[X]) (hf : f.Monic) (hg : g.Monic) :
    (twoRemainderMatrix f g).det.natAbs = (f.resultant g).natAbs := sorry

def remainderRows (N : ℕ) : List (ℕ × ℕ) :=
  (N.divisors.sort (· ≤ ·)).flatMap fun m => (List.range (Nat.totient m)).map fun j => (m, j)

def remainderAt (N : ℕ) (i : Fin N) : ℕ × ℕ := (remainderRows N).getD i.val (1, 0)

def remainderMatrix (N : ℕ) : Matrix (Fin N) (Fin N) ℤ := fun i k =>
  ((X ^ k.val : ℤ[X]) %ₘ cyclotomic (remainderAt N i).1 ℤ).coeff (remainderAt N i).2

def D1 (N : ℕ) : ℕ := ∏ m ∈ N.divisors, (leadingFactor m (N / m)) ^ Nat.totient m

def D2 (N : ℕ) : ℕ := ∏ d ∈ N.divisors, ∏ e ∈ N.divisors,
  if d < e then ((cyclotomic e ℤ).resultant (cyclotomic d ℤ)).natAbs else 1

/-- HC.4/cyclotomic-remainder-determinant. -/
theorem cyclotomic_remainder_determinant (N : ℕ) (hN : 0 < N) :
    (remainderMatrix N).det.natAbs = D2 N := sorry

/-- Explicit matrix of the graded map, with row/column monomial bases. -/
def gradedMatrix (N : ℕ) : Matrix (Fin N) (Fin N) ℤ := fun i k =>
  (leadingFactor (remainderAt N i).1 (N / (remainderAt N i).1) : ℤ) * remainderMatrix N i k

/-- HC.4/graded-taylor-determinant. -/
theorem graded_taylor_determinant (N : ℕ) (hN : 0 < N) :
    (gradedMatrix N).det.natAbs = D1 N * D2 N ∧ 0 < D1 N * D2 N := sorry

def delta (N : ℕ) : ℕ := (taylorMatrix N).det.natAbs

/-- HC.4/finite-taylor-determinant, corrected upper bound. -/
theorem finite_taylor_determinant (N : ℕ) (hN : 0 < N) :
    delta N = ∏ n ∈ (Finset.range N).erase 0, D1 n * D2 n := sorry

theorem delta_pos (N : ℕ) (hN : 0 < N) : 0 < delta N := sorry

/-- HC.4/signed-adjugate. -/
def starMatrix (N : ℕ) : Matrix (Fin (dimension N)) (Fin (dimension N)) ℤ :=
  (taylorMatrix N).det.sign • (taylorMatrix N).adjugate

/-- HC.4/signed-adjugate-identities, with the reversed identity immediately below. -/
theorem taylorMatrix_mul_starMatrix (N : ℕ) (hN : 0 < N) :
    taylorMatrix N * starMatrix N = (delta N : ℤ) • 1 := sorry

theorem starMatrix_mul_taylorMatrix (N : ℕ) (hN : 0 < N) :
    starMatrix N * taylorMatrix N = (delta N : ℤ) • 1 := sorry

theorem starMatrix_over_rat (N : ℕ) (hN : 0 < N) :
    (starMatrix N).map (Int.castRingHom ℚ) =
      (delta N : ℚ) • ((taylorMatrix N).map (Int.castRingHom ℚ))⁻¹ := sorry

/-- Test starMatrix_empty. -/
example : taylorMatrix 1 * starMatrix 1 = (1 : ℤ) • 1 ∧
    starMatrix 1 * taylorMatrix 1 = (1 : ℤ) • 1 := sorry

/-- Test starMatrix_three. -/
example : starMatrix 3 = !![4,0,0; -1,1,2; 1,-1,2] := sorry

/-- Test starMatrix_three_nonexample. -/
example : starMatrix 3 *ᵥ ![1,0,0] = ![4,-1,1] ∧
    ¬∀ i, (4 : ℤ) ∣ (starMatrix 3 *ᵥ ![1,0,0]) i := sorry

/-- HC.4/finite-integral-image-criterion. -/
theorem finite_integral_image_criterion
    (hR : ∀ z : ℤ, z ≠ 0 → Function.Injective (fun r : R => z • r))
    (N : ℕ) (hN : 0 < N) (v : Fin (dimension N) → R) :
    (∃ b, (taylorMatrix N).map (Int.castRingHom R) *ᵥ b = v) ↔
      ∀ i, (delta N : R) ∣ ((starMatrix N).map (Int.castRingHom R) *ᵥ v) i := sorry

/-- HC.4/global-integral-image-criterion. -/
theorem global_integral_image_criterion
    (hR : ∀ z : ℤ, z ≠ 0 → Function.Injective (fun r : R => z • r))
    (f : TaylorProduct R) : f ∈ Set.range (iota R) ↔
    ∀ N : ℕ, 0 < N → ∀ i,
      (delta N : R) ∣ ((starMatrix N).map (Int.castRingHom R) *ᵥ jetCoordinates R N f) i := sorry

/-- Test finiteIota_three_nonsurjective, represented in the finite jet basis. -/
example : ¬∃ g : FiniteH ℤ 2,
    (fun i => (finiteJetBasis ℤ 3 (by decide)).repr (finiteIota ℤ 3 (by decide) g) i) = ![1,0,0] := sorry

abbrev Invert (D : ℤ) := Localization.Away D

/-- Coefficient localization map, p not dividing the inverted integer. -/
def awayToPadic (D : ℤ) (p : ℕ) [Fact p.Prime] (hpD : ¬(p : ℤ) ∣ D) :
    Invert D →+* ℤ_[p] := sorry

/-- HC.4/localized-scalar-divisibility. -/
theorem localized_scalar_divisibility (D : ℤ) (hD : D ≠ 0) (d : ℕ) (hd : 0 < d)
    (a : Invert D) : (d : Invert D) ∣ a ↔
      ∀ (p : ℕ) (hp : p.Prime) (hpD : ¬(p : ℤ) ∣ D),
        letI : Fact p.Prime := ⟨hp⟩
        (d : ℤ_[p]) ∣ awayToPadic D p hpD a := sorry

/-- HC.4/local-integrality-detection. -/
theorem local_integrality_detection (D : ℤ) (hD : D ≠ 0) (f : TaylorProduct (Invert D)) :
    f ∈ Set.range (iota (Invert D)) ↔
      ∀ (p : ℕ) (hp : p.Prime) (hpD : ¬(p : ℤ) ∣ D),
        letI : Fact p.Prime := ⟨hp⟩
        TaylorProduct.map (Invert D) (awayToPadic D p hpD) f ∈ Set.range (iota ℤ_[p]) := sorry

/-- HC.4/kontsevich-matrix-example: first digit coordinates all constant one. -/
theorem kontsevich_matrix_example :
    taylorMatrix 5 *ᵥ ![1,1,0,1,0,0,1,0,0,0] = ![1,3,1,5,-1,2,8,-3,11,5] ∧
    ((taylorMatrix 5).map (Int.castRingHom ℚ))⁻¹ *ᵥ ![2,3,1,5,-1,2,8,-3,11,5] =
      ![2,3/4,1/4,65/72,-1/72,17/72,275/288,-7/144,1/32,17/72] := sorry

/-- Constant odd-order indicator in the universal Taylor product. -/
def oddProjector : TaylorProduct ℚ := fun m => if Odd (m : ℕ) then 1 else 0

/-- HC.4/odd-order-idempotent-example. HC.5 supplies the localization lifting. -/
theorem odd_order_idempotent_example :
    let e := (rationalTaylorEquiv ℚ).symm oddProjector
    e * e = e ∧ e ≠ 0 ∧ e ≠ 1 ∧
    e ∈ Set.range (naiveMap (Invert 2) (by
      exact IsLocalization.Away.lift 2 (by norm_num : IsUnit (Int.castRingHom ℚ 2)))) ∧
    e ∉ Set.range (naiveMap ℤ (Int.castRingHom ℚ)) := sorry

/-- Imported HC.3 substitution q↦q² on the ordinary completion. -/
def substituteTwo : Naive ℚ →ₐ[ℚ] Naive ℚ := sorry

/-- The digit computations in HC.4/odd-order-idempotent-example. -/
theorem odd_projector_digits :
    let e := (rationalTaylorEquiv ℚ).symm oddProjector
    digit ℚ e 1 = 1 ∧ digit ℚ e 2 = (C (-1) + X) * C (1/4) ∧
    digit ℚ e 3 = (1 - X + X^2) * C (1/8) ∧
    digit ℚ e 4 = (C (-5) + C 2 * X + X^2 + C 4 * X^3) * C (1/32) := sorry

theorem companion_projector_digits :
    let e := (rationalTaylorEquiv ℚ).symm oddProjector
    let g := substituteTwo e - e
    digit ℚ g 1 = 0 ∧ digit ℚ g 2 = (1 - X) * C (1/4) ∧
    digit ℚ g 3 = (C (-1) + X - X^2) * C (1/8) ∧
    digit ℚ g 4 = (1 - C 2 * X + C 3 * X^2 - C 4 * X^3) * C (1/32) ∧
    (∀ m : ℕ+, iota ℚ g m = if (m : ℕ) % 4 = 2 then 1 else 0) := sorry

/-- HC.4/finite-domain-module-embedding. -/
theorem finite_domain_module_embedding {B : Type*} [CommRing B] [IsDomain R] [IsDomain B]
    [Algebra R B] [Module.Finite R B] (hRB : Function.Injective (algebraMap R B)) :
    ∃ r : ℕ, 0 < r ∧ ∃ L : B →ₗ[R] (Fin r → R), Function.Injective L := sorry

/-- HC.4/finite-domain-separation-transfer. The condition is an intersection
of scalar-power images, so it does not assume Noetherianity. -/
theorem finite_domain_separation_transfer {B : Type*} [CommRing B] [IsDomain R] [IsDomain B]
    [Algebra R B] [Module.Finite R B] (hRB : Function.Injective (algebraMap R B)) (c : R)
    (hsep : ∀ a : R, (∀ k : ℕ, ∃ b : R, a = c ^ k * b) → a = 0) :
    ∀ a : B, (∀ k : ℕ, ∃ b : B, a = algebraMap R B (c ^ k) * b) → a = 0 := sorry

end TauCeti.Habiro.HC4
