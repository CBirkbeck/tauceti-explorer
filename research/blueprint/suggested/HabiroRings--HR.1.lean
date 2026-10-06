import Mathlib.Algebra.MvPolynomial.Eval
import Mathlib.Algebra.MvPolynomial.Expand
import Mathlib.NumberTheory.Divisors
import Mathlib.NumberTheory.Padics.PadicVal.Basic
import Mathlib.RingTheory.PowerSeries.Basic
import Mathlib.RingTheory.RingHom.FaithfullyFlat
import Mathlib.RingTheory.Flat.Localization
import Mathlib.RingTheory.Localization.AtPrime.Basic
import Mathlib.RingTheory.Localization.Away.Basic
import Mathlib.LinearAlgebra.FreeModule.Basic
import Mathlib.LinearAlgebra.Matrix.NonsingularInverse

/-!
This file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/HabiroRings--HR.1.md` is definitive. These statements
suggest Lean forms so that contributors and reviewers converge on names and
signatures; they claim no implementation. Every packet node remains unchecked.

Mathlib pin: 082e2d37e8b0463410cdb532e111cd43d5a66174.
Tau Ceti pin: f790474821cf4256814db967cb154e7af3d0c369.
No Tau Ceti modules are required by this supplement. The parent suggested file
contains unrelated derived stand-ins and is not imported as a library module.

The prelude below adapts two accepted parent interfaces, not new blueprint
nodes: HR.4/truncated-big-witt-vectors at the full truncation set, and
HR.1/lambda-rings-with-commuting-adams-operations. BigWitt has the actual
coordinate carrier and ghost polynomials; its admitted ring instance is the
imported NON-pointwise Witt ring. Adams has precisely the parent’s torsion-free
monoid of endomorphisms and prime congruences. Assembly replaces these adapters
by canonical supplier imports. Full Frobenius is the polynomial extension of
the parent’s finite-divisor Frobenius, planned by universal-frobenius-polynomials.
The inherited DD.1 completion interface is not restated here.
-/
noncomputable section
namespace HabiroHR1
universe u v w

structure BigWitt (A : Type u) where
  coeff : ℕ+ → A

namespace BigWitt
variable {A : Type u} {B : Type v} {C : Type w}
variable [CommRing A] [CommRing B] [CommRing C]
instance : CommRing (BigWitt A) := sorry

def ghost (n : ℕ+) : BigWitt A →+* A where
  toFun a := ∑ d ∈ (n : ℕ).divisors.attach,
    (d.1 : A) * a.coeff ⟨d.1, Nat.pos_of_mem_divisors d.2⟩ ^ ((n : ℕ) / d.1)
  map_one' := sorry
  map_mul' := sorry
  map_zero' := sorry
  map_add' := sorry

def map (f : A →+* B) : BigWitt A →+* BigWitt B where
  toFun a := ⟨fun n => f (a.coeff n)⟩
  map_one' := sorry
  map_mul' := sorry
  map_zero' := sorry
  map_add' := sorry

def teichmuller (a : A) : BigWitt A := ⟨fun n => if n = 1 then a else 0⟩

def frobenius (m : ℕ+) : BigWitt A →+* BigWitt A := sorry

theorem ghost_injective [IsAddTorsionFree A] :
    Function.Injective (fun a : BigWitt A => fun n => ghost n a) := by sorry
end BigWitt

structure Adams (A : Type u) [CommRing A] where
  adams : ℕ+ →* (A →+* A)
  torsionFree : IsAddTorsionFree A
  congruence : ∀ p : ℕ+, (p : ℕ).Prime → ∀ a : A,
    adams p a - a ^ (p : ℕ) ∈ Ideal.span {((p : ℕ) : A)}

namespace Adams
variable {A : Type u} {B : Type v} [CommRing A] [CommRing B]
structure Hom (s : Adams A) (t : Adams B) extends A →+* B where
  commute : ∀ n, toRingHom.comp (s.adams n) = (t.adams n).comp toRingHom

def integer : Adams ℤ where
  adams := 1
  torsionFree := inferInstance
  congruence := by sorry
end Adams

/-! dwork-ghost-image -/
theorem dwork_ghost_image {A : Type u} [CommRing A] [IsAddTorsionFree A]
    (φ : ℕ+ → A →+* A)
    (hφ : ∀ p : ℕ+, (p : ℕ).Prime → ∀ a : A,
      φ p a - a ^ (p : ℕ) ∈ Ideal.span {((p : ℕ) : A)}) (y : ℕ+ → A) :
    (∃! a : BigWitt A, ∀ n, BigWitt.ghost n a = y n) ↔
      ∀ p k : ℕ+, (p : ℕ).Prime →
        y (p * k) - φ p (y k) ∈
          Ideal.span {((p : ℕ) : A) ^ padicValNat (p : ℕ) (p * k : ℕ+)} := by sorry

/-! universal-frobenius-polynomials -/
namespace BigWitt
abbrev Universal := MvPolynomial ℕ+ ℤ

def frobeniusPoly (m n : ℕ+) : Universal := sorry

def evalPoly {A : Type u} [CommRing A] (a : ℕ+ → A) : Universal →+* A :=
  MvPolynomial.eval₂Hom (Int.castRingHom A) a

theorem frobenius_ghost {A : Type u} [CommRing A] (m n : ℕ+) (a : BigWitt A) :
    ghost n (frobenius m a) = ghost (m * n) a := by sorry

theorem frobenius_poly_ghost (m : ℕ+) (a : BigWitt Universal)
    (ha : ∀ n, a.coeff n = MvPolynomial.X n) (n : ℕ+) :
    ghost n ⟨fun d => frobeniusPoly m d⟩ = ghost (m * n) a := by sorry

def weight (d : ℕ+ →₀ ℕ) : ℕ := d.sum fun n r => (n : ℕ) * r

theorem frobenius_polynomials (m n : ℕ+) :
    (∀ {A : Type u} [CommRing A] (a : BigWitt A),
      (frobenius m a).coeff n = evalPoly a.coeff (frobeniusPoly m n)) ∧
    (∀ d, (frobeniusPoly m n).coeff d ≠ 0 → weight d = (m : ℕ) * (n : ℕ)) ∧
    (∀ j ∈ (frobeniusPoly m n).vars, (j : ℕ) ≤ (m : ℕ) * (n : ℕ)) := by sorry

theorem frobenius_poly_prime (p n : ℕ+) (hp : (p : ℕ).Prime) :
    (∃ P : Universal, frobeniusPoly p n = ((p : ℕ) : Universal) * MvPolynomial.X (p * n) + P ∧
      ∀ j ∈ P.vars, (j : ℕ) < (p : ℕ) * (n : ℕ)) ∧
    frobeniusPoly p n - MvPolynomial.X n ^ (p : ℕ) ∈
      Ideal.span {((p : ℕ) : Universal)} := by sorry

example : frobeniusPoly 2 1 = MvPolynomial.X 1 ^ 2 + 2 * MvPolynomial.X 2 ∧
    frobeniusPoly 2 2 = 2 * MvPolynomial.X 4 -
      2 * MvPolynomial.X 1 ^ 2 * MvPolynomial.X 2 - MvPolynomial.X 2 ^ 2 := by sorry

/-! witt-ring-frobenius-congruence: divisibility in the Witt ring itself. -/
theorem frobenius_witt_congruence {A : Type u} [CommRing A]
    (p : ℕ+) (hp : (p : ℕ).Prime) (a : BigWitt A) :
    frobenius p a - a ^ (p : ℕ) ∈ Ideal.span {((p : ℕ) : BigWitt A)} := by sorry

/-! big-witt-comonad -/
def comul {A : Type u} [CommRing A] : BigWitt A →+* BigWitt (BigWitt A) := sorry

theorem comul_ghost {A : Type u} [CommRing A] (n : ℕ+) :
    (ghost n).comp (comul (A := A)) = frobenius n := by sorry

theorem comul_natural {A : Type u} {B : Type v} [CommRing A] [CommRing B]
    (f : A →+* B) :
    (map (map f)).comp comul = comul.comp (map f) := by sorry

theorem comul_counit_left {A : Type u} [CommRing A] :
    (ghost 1).comp (comul (A := A)) = RingHom.id _ := by sorry

theorem comul_counit_right {A : Type u} [CommRing A] :
    (map (ghost 1)).comp (comul (A := A)) = RingHom.id _ := by sorry

theorem comul_assoc {A : Type u} [CommRing A] :
    (comul (A := BigWitt A)).comp comul = (map comul).comp (comul (A := A)) := by sorry

theorem comul_unique {A : Type u} [CommRing A] [IsAddTorsionFree A]
    (g : BigWitt A →+* BigWitt (BigWitt A))
    (hg : ∀ n, (ghost n).comp g = frobenius n) : g = comul := by sorry

theorem comul_teichmuller {A : Type u} [CommRing A] (a : A) :
    comul (teichmuller a) = teichmuller (teichmuller a) := by sorry

/-! big-witt-comonad-laws: the promoted simultaneous identities. -/
theorem comonad_laws {A : Type u} [CommRing A] :
    (∀ n, (ghost n).comp (comul (A := A)) = frobenius n) ∧
    (ghost 1).comp (comul (A := A)) = RingHom.id _ ∧
    (map (ghost 1)).comp (comul (A := A)) = RingHom.id _ ∧
    (comul (A := BigWitt A)).comp comul = (map comul).comp (comul (A := A)) ∧
    ∀ {B : Type v} [CommRing B] (f : A →+* B),
      (map (map f)).comp comul = comul.comp (map f) := by sorry

-- test BigWitt.comul_teichmuller_test (compatibility)
example {A : Type u} [CommRing A] (a : A) :
    comul (teichmuller a) = teichmuller (teichmuller a) := by sorry
-- test BigWitt.comul_zero_test (degenerate)
example : comul (0 : BigWitt (ZMod 4)) = 0 := by sorry
-- test BigWitt.comul_ghost_six_test (computation)
example (a : BigWitt ℤ) : ghost 2 (ghost 3 (comul a)) = ghost 6 a := by sorry
end BigWitt

/-! lambda-coalgebra: the conditions are actual ring-map equalities. -/
structure LambdaCoalgebra (A : Type u) [CommRing A] where
  coaction : A →+* BigWitt A
  counit : (BigWitt.ghost 1).comp coaction = RingHom.id A
  coassoc : BigWitt.comul.comp coaction = (BigWitt.map coaction).comp coaction

namespace LambdaCoalgebra
variable {A : Type u} {B : Type v} {C : Type w}
variable [CommRing A] [CommRing B] [CommRing C]
def adams (s : LambdaCoalgebra A) (n : ℕ+) : A →+* A :=
  (BigWitt.ghost n).comp s.coaction

def coord (s : LambdaCoalgebra A) (n : ℕ+) (a : A) : A := (s.coaction a).coeff n

theorem ext (s t : LambdaCoalgebra A) (h : s.coaction = t.coaction) : s = t := by sorry

theorem ext_coords (s t : LambdaCoalgebra A) (h : ∀ n a, s.coord n a = t.coord n a) :
    s = t := by sorry

structure Hom (s : LambdaCoalgebra A) (t : LambdaCoalgebra B) extends A →+* B where
  compatible : (BigWitt.map toRingHom).comp s.coaction = t.coaction.comp toRingHom

namespace Hom
def id (s : LambdaCoalgebra A) : Hom s s := sorry

def comp {s : LambdaCoalgebra A} {t : LambdaCoalgebra B} {r : LambdaCoalgebra C}
    (g : Hom t r) (f : Hom s t) : Hom s r := sorry

theorem ext {s : LambdaCoalgebra A} {t : LambdaCoalgebra B}
    (f g : Hom s t) (h : f.toRingHom = g.toRingHom) : f = g := by sorry

theorem comp_toRingHom {s : LambdaCoalgebra A} {t : LambdaCoalgebra B}
    {r : LambdaCoalgebra C} (g : Hom t r) (f : Hom s t) :
    (comp g f).toRingHom = g.toRingHom.comp f.toRingHom := by sorry

theorem id_toRingHom (s : LambdaCoalgebra A) :
    (id s).toRingHom = RingHom.id A := by sorry

theorem adams {s : LambdaCoalgebra A} {t : LambdaCoalgebra B}
    (f : Hom s t) (n : ℕ+) :
    f.toRingHom.comp (s.adams n) = (t.adams n).comp f.toRingHom := by sorry
end Hom

-- test LambdaCoalgebra.adams_one_test (degenerate)
example (s : LambdaCoalgebra A) : s.adams 1 = RingHom.id A := by sorry
-- test LambdaCoalgebra.adams_two_coord_test (computation)
example (s : LambdaCoalgebra A) (a : A) :
    s.adams 2 a = (s.coaction a).coeff 1 ^ 2 + 2 * (s.coaction a).coeff 2 := by sorry
-- test LambdaCoalgebra.hom_adams_test (compatibility)
example {s : LambdaCoalgebra A} {t : LambdaCoalgebra B} (f : Hom s t) :
    f.toRingHom.comp (s.adams 6) = (t.adams 6).comp f.toRingHom := by sorry

/-! coalgebra-adams-laws -/
theorem adams_laws (s : LambdaCoalgebra A) :
    s.adams 1 = RingHom.id A ∧
    (∀ m n, s.adams (m * n) = (s.adams m).comp (s.adams n)) ∧
    ∀ p : ℕ+, (p : ℕ).Prime → ∀ a : A,
      s.adams p a - a ^ (p : ℕ) ∈ Ideal.span {((p : ℕ) : A)} := by sorry
end LambdaCoalgebra

namespace Adams
variable {A : Type u} {B : Type v} [CommRing A] [CommRing B]
/-! adams-to-witt-section -/
def toWitt (s : Adams A) : A →+* BigWitt A := sorry

theorem toWitt_ghost (s : Adams A) (n : ℕ+) :
    (BigWitt.ghost n).comp s.toWitt = s.adams n := by sorry

theorem toWitt_coord_one (s : Adams A) (a : A) : (s.toWitt a).coeff 1 = a := by sorry

theorem toWitt_coord_recursion (s : Adams A) (n : ℕ+) (a : A) :
    ((n : ℕ) : A) * (s.toWitt a).coeff n = s.adams n a -
      ∑ d ∈ (n : ℕ).divisors.attach,
        if d.1 < (n : ℕ) then
          (d.1 : A) * (s.toWitt a).coeff ⟨d.1, Nat.pos_of_mem_divisors d.2⟩ ^
            ((n : ℕ) / d.1)
        else 0 := by sorry

theorem toWitt_unique (s : Adams A) (f : A →+* BigWitt A)
    (h : ∀ n, (BigWitt.ghost n).comp f = s.adams n) : f = s.toWitt := by sorry

theorem toWitt_natural {s : Adams A} {t : Adams B} (f : Hom s t) :
    (BigWitt.map f.toRingHom).comp s.toWitt = t.toWitt.comp f.toRingHom := by sorry

/-! adams-witt-section-laws: the promoted identities used in Wilkerson. -/
theorem toWitt_laws {s : Adams A} {t : Adams B} (f : Hom s t) :
    (∀ n, (BigWitt.ghost n).comp s.toWitt = s.adams n) ∧
    (∀ g : A →+* BigWitt A, (∀ n, (BigWitt.ghost n).comp g = s.adams n) → g = s.toWitt) ∧
    (BigWitt.map f.toRingHom).comp s.toWitt = t.toWitt.comp f.toRingHom := by sorry

-- test Adams.toWitt_integer_two_test (computation)
example : (integer.toWitt 2).coeff 2 = -1 ∧ (integer.toWitt 2).coeff 3 = -2 := by sorry
-- test Adams.toWitt_zero_test (degenerate)
example (s : Adams A) : s.toWitt 0 = 0 := by sorry
-- test Adams.toWitt_prime_delta_test (compatibility)
example (s : Adams A) (p : ℕ+) (hp : (p : ℕ).Prime) (a : A) :
    (p : ℕ) * (s.toWitt a).coeff p = s.adams p a - a ^ (p : ℕ) := by sorry
end Adams

/-! wilkerson-comparison -/
def wilkersonComparison (A : Type u) [CommRing A] [IsAddTorsionFree A] :
    LambdaCoalgebra A ≃ Adams A := sorry

theorem wilkersonComparison_forward {A : Type u} [CommRing A] [IsAddTorsionFree A]
    (s : LambdaCoalgebra A) (n : ℕ+) :
    (wilkersonComparison A s).adams n = s.adams n := by sorry

theorem wilkersonComparison_inverse {A : Type u} [CommRing A] [IsAddTorsionFree A]
    (s : Adams A) : ((wilkersonComparison A).symm s).coaction = s.toWitt := by sorry

theorem wilkerson_morphism_iff {A : Type u} {B : Type v} [CommRing A] [CommRing B]
    [IsAddTorsionFree A] [IsAddTorsionFree B] (s : LambdaCoalgebra A)
    (t : LambdaCoalgebra B) (f : A →+* B) :
    (BigWitt.map f).comp s.coaction = t.coaction.comp f ↔
    ∀ n, f.comp (s.adams n) = (t.adams n).comp f := by sorry

/-! big-witt-cofree-adjunction -/
def BigWitt.cofree (A : Type u) [CommRing A] : LambdaCoalgebra (BigWitt A) :=
  ⟨BigWitt.comul, BigWitt.comul_counit_left, BigWitt.comul_assoc⟩

def cofreeAdjunction {A : Type u} {B : Type v} [CommRing A] [CommRing B]
    (s : LambdaCoalgebra B) :
    (B →+* A) ≃ LambdaCoalgebra.Hom s (BigWitt.cofree A) := sorry

theorem cofreeAdjunction_transpose {A : Type u} {B : Type v} [CommRing A] [CommRing B]
    (s : LambdaCoalgebra B) (f : B →+* A) :
    (cofreeAdjunction s f).toRingHom = (BigWitt.map f).comp s.coaction := by sorry

theorem cofreeAdjunction_inverse {A : Type u} {B : Type v} [CommRing A] [CommRing B]
    (s : LambdaCoalgebra B) (f : LambdaCoalgebra.Hom s (BigWitt.cofree A)) :
    (cofreeAdjunction s).symm f = (BigWitt.ghost 1).comp f.toRingHom := by sorry

theorem BigWitt.map_ghost_comul {A : Type u} [CommRing A] (m : ℕ+) :
    (BigWitt.map (BigWitt.ghost m)).comp BigWitt.comul = BigWitt.frobenius (A := A) m := by sorry

/-! witt-product-addition: the finite coefficient form of Hesselholt Proposition 1.14.
The source's product coefficient condition is i₁+⋯+iᵣ=k; its weighted condition
is a misprint recorded in the packet. No infinite product is used in this signature.
-/
theorem BigWitt.product_add {A : Type u} [CommRing A] (a b : BigWitt A)
    (N k : ℕ) (hk : k ≤ N) :
    PowerSeries.coeff k (∏ d ∈ Finset.range N,
      (1 - PowerSeries.C ((a + b).coeff ⟨d+1, Nat.succ_pos d⟩) *
        PowerSeries.X ^ (d+1))) =
    PowerSeries.coeff k
      ((∏ d ∈ Finset.range N,
        (1 - PowerSeries.C (a.coeff ⟨d+1, Nat.succ_pos d⟩) * PowerSeries.X ^ (d+1))) *
       (∏ d ∈ Finset.range N,
        (1 - PowerSeries.C (b.coeff ⟨d+1, Nat.succ_pos d⟩) * PowerSeries.X ^ (d+1)))) := by sorry

/-! exterior-operations -/
namespace LambdaCoalgebra
variable {A : Type u} {B : Type v} [CommRing A] [CommRing B]
def exterior (s : LambdaCoalgebra A) (n : ℕ) (a : A) : A :=
  PowerSeries.coeff n (∏ d ∈ Finset.range n,
    (1 - PowerSeries.C ((s.coaction a).coeff ⟨d+1, Nat.succ_pos d⟩) *
      (-PowerSeries.X) ^ (d+1)))

theorem exterior_zero (s : LambdaCoalgebra A) (a : A) : s.exterior 0 a = 1 := by sorry

theorem exterior_one (s : LambdaCoalgebra A) (a : A) : s.exterior 1 a = a := by sorry

theorem exterior_two (s : LambdaCoalgebra A) (a : A) :
    s.exterior 2 a = -(s.coaction a).coeff 2 := by sorry

theorem exterior_three (s : LambdaCoalgebra A) (a : A) :
    s.exterior 3 a = (s.coaction a).coeff 3 -
      (s.coaction a).coeff 1 * (s.coaction a).coeff 2 := by sorry

theorem exterior_zero_element (s : LambdaCoalgebra A) (n : ℕ) (hn : 0 < n) :
    s.exterior n 0 = 0 := by sorry

theorem exterior_add (s : LambdaCoalgebra A) (n : ℕ) (a b : A) :
    s.exterior n (a+b) = ∑ i ∈ Finset.range (n+1), s.exterior i a * s.exterior (n-i) b := by sorry

theorem exterior_natural {s : LambdaCoalgebra A} {t : LambdaCoalgebra B}
    (f : Hom s t) (n : ℕ) (a : A) : f.toRingHom (s.exterior n a) = t.exterior n (f.toRingHom a) := by sorry

def integer : LambdaCoalgebra ℤ := (wilkersonComparison ℤ).symm Adams.integer

-- test LambdaCoalgebra.exterior_integer_two_test (computation)
example : integer.exterior 2 2 = 1 ∧ integer.exterior 3 2 = 0 := by sorry
-- test LambdaCoalgebra.exterior_zero_element_test (degenerate)
example (s : LambdaCoalgebra A) (n : ℕ) (hn : 0 < n) : s.exterior n 0 = 0 := by sorry
-- test LambdaCoalgebra.exterior_witt_sign_test (non-example)
example : integer.exterior 2 2 = -(integer.coaction 2).coeff 2 ∧
    integer.exterior 2 2 ≠ (integer.coaction 2).coeff 2 := by sorry
end LambdaCoalgebra

/-! free-lambda-ring -/
abbrev FreeLambdaRing (I : Type u) := MvPolynomial (I × ℕ+) ℤ
namespace FreeLambdaRing
variable {I : Type u} {J : Type v} {K : Type w}
def coord (i : I) (n : ℕ+) : FreeLambdaRing I := MvPolynomial.X (i,n)
def gen (i : I) : FreeLambdaRing I := coord i 1

def universalPoint (i : I) : BigWitt (FreeLambdaRing I) := ⟨fun n => coord i n⟩

def coaction (I : Type u) : FreeLambdaRing I →+* BigWitt (FreeLambdaRing I) :=
  MvPolynomial.eval₂Hom (Int.castRingHom _) fun j =>
    (BigWitt.comul (universalPoint j.1)).coeff j.2

def coalgebra (I : Type u) : LambdaCoalgebra (FreeLambdaRing I) where
  coaction := coaction I
  counit := by sorry
  coassoc := by sorry

theorem coaction_gen (i : I) : coaction I (gen i) = universalPoint i := by sorry

def adams (I : Type u) (m : ℕ+) : FreeLambdaRing I →+* FreeLambdaRing I :=
  (coalgebra I).adams m

theorem adams_coord (i : I) (m n : ℕ+) :
    adams I m (coord i n) = BigWitt.evalPoly (coord i) (BigWitt.frobeniusPoly m n) := by sorry

def reindex (r : I → J) : LambdaCoalgebra.Hom (coalgebra I) (coalgebra J) where
  toRingHom := MvPolynomial.eval₂Hom (Int.castRingHom _) fun j => coord (r j.1) j.2
  compatible := by sorry

theorem reindex_id : (reindex (id : I → I)).toRingHom = RingHom.id _ := by sorry

theorem reindex_comp (r : I → J) (q : J → K) :
    (reindex (q ∘ r)).toRingHom = (reindex q).toRingHom.comp (reindex r).toRingHom := by sorry

-- test FreeLambdaRing.adams_two_generator_test (computation)
example (i : I) : adams I 2 (gen i) = gen i ^ 2 + 2 * coord i 2 := by sorry
-- test FreeLambdaRing.empty_adams_test (degenerate)
example : ∃ e : FreeLambdaRing Empty ≃+* ℤ,
    ∀ n a, e (adams Empty n a) = e a := by sorry
-- test FreeLambdaRing.exterior_newton_three_test (compatibility)
example (i : I) : adams I 3 (gen i) = gen i ^ 3 -
    3 * gen i * (coalgebra I).exterior 2 (gen i) +
    3 * (coalgebra I).exterior 3 (gen i) := by sorry
-- test FreeLambdaRing.not_toric_test (non-example)
example : adams Unit 2 (gen ()) ≠ gen () ^ 2 := by sorry

/-! free-lambda-universal-property -/
def lift {A : Type v} [CommRing A] (s : LambdaCoalgebra A) (g : I → A) :
    LambdaCoalgebra.Hom (coalgebra I) s where
  toRingHom := MvPolynomial.eval₂Hom (Int.castRingHom A) fun j => (s.coaction (g j.1)).coeff j.2
  compatible := by sorry

def universalProperty {A : Type v} [CommRing A] (s : LambdaCoalgebra A) :
    (I → A) ≃ LambdaCoalgebra.Hom (coalgebra I) s := sorry

theorem universalProperty_apply {A : Type v} [CommRing A] (s : LambdaCoalgebra A)
    (g : I → A) : universalProperty s g = lift s g := by sorry

theorem lift_gen {A : Type v} [CommRing A] (s : LambdaCoalgebra A) (g : I → A) (i : I) :
    (lift s g).toRingHom (gen i) = g i := by sorry

theorem lift_unique {A : Type v} [CommRing A] (s : LambdaCoalgebra A) (g : I → A)
    (f : LambdaCoalgebra.Hom (coalgebra I) s) (hf : ∀ i, f.toRingHom (gen i) = g i) :
    f = lift s g := by sorry

example : (lift LambdaCoalgebra.integer (fun _ : Unit => (2 : ℤ))).toRingHom
    (coord () 2) = -1 := by sorry

/-! Real coefficient localization and Adams scalar twist used in local presentations. -/
abbrev Over (I : Type u) (R : Type v) [CommRing R] := MvPolynomial (I × ℕ+) R

def adamsOver (I : Type u) (R : Type v) [CommRing R] (m : ℕ+) : Over I R →+* Over I R :=
  MvPolynomial.eval₂Hom MvPolynomial.C fun j =>
    MvPolynomial.eval₂Hom (Int.castRingHom _) (fun n => MvPolynomial.X (j.1,n))
      (BigWitt.frobeniusPoly m j.2)

@[nolint unusedArguments]
def Via {R : Type u} {S : Type v} [CommRing R] [CommRing S] (_f : R →+* S) : Type v := S
namespace Via
variable {R : Type u} {S : Type v} [CommRing R] [CommRing S] (f : R →+* S)
instance : CommRing (Via f) := inferInstanceAs (CommRing S)
instance : Algebra R (Via f) := f.toAlgebra
end Via

abbrev RestrictedExponents (I : Type u) (p : ℕ+) :=
  {r : (I × ℕ+) →₀ ℕ // ∀ j, r j < (p : ℕ)}
abbrev PrimeToIndices (I : Type u) (p : ℕ+) := {j : I × ℕ+ // ¬ (p : ℕ) ∣ (j.2 : ℕ)}

/-! free-adams-local-presentations: actual bases/isomorphisms, not a flag. -/
-- The IsPrime instance for (p) is redundant mathematical data following from hp;
-- it supplies the typeclass required by Ideal.primeCompl in this signature.
theorem adams_local_basis (I : Type u) (p : ℕ+) (hp : (p : ℕ).Prime)
    (R : Type v) [CommRing R] [Algebra ℤ R]
    [(Ideal.span {((p : ℕ) : ℤ)}).IsPrime]
    [IsLocalization (Ideal.span {((p : ℕ) : ℤ)}).primeCompl R] :
    ∃ b : Module.Basis (RestrictedExponents I p) (Over I R) (Via (adamsOver I R p)),
      ∀ r, b r = MvPolynomial.monomial r.1 (1 : R) := by sorry

theorem adams_away_presentation (I : Type u) (p : ℕ+) (hp : (p : ℕ).Prime)
    (R : Type v) [CommRing R] [Algebra ℤ R] [IsLocalization.Away ((p : ℕ) : ℤ) R] :
    ∃ e : MvPolynomial (PrimeToIndices I p) (Over I R) ≃ₐ[Over I R] Via (adamsOver I R p),
      ∀ j, e (MvPolynomial.X j) = MvPolynomial.X j.1 := by sorry

/-! free-lambda-perfect-cover. The last clause uses the parent’s exact colimit
perfection/covering equivalence. This existence statement is the concrete cover
contract, and does not stand in for an unspecified perfectly-covered predicate. -/
theorem adams_faithfullyFlat (I : Type u) (m : ℕ+) : (adams I m).FaithfullyFlat := by sorry

example : ¬ Function.Surjective (adams Unit 2) := by sorry

theorem perfectlyCovered (I : Type u) :
    ∃ (B : Type u) (_ : CommRing B) (s : LambdaCoalgebra B)
      (f : LambdaCoalgebra.Hom (coalgebra I) s),
      f.toRingHom.FaithfullyFlat ∧ ∀ m, Function.Bijective (s.adams m) := by sorry
end FreeLambdaRing
end HabiroHR1
