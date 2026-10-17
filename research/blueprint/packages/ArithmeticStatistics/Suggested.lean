import Mathlib
import TauCeti.Order.Northcott

/-!
# Arithmetic statistics: representative target signatures

The roadmap is the accompanying README. This file records a nonexhaustive selection
of light definitions, milestones and examples statable against the pinned APIs.
The coefficients of binary forms descend in x-degree. Heights retain the source's
cutoff and denominator; neither a coefficient family nor a weighted orbit count is
silently identified with an isomorphism-class family. Heavy orbit, moduli, covering
and arithmetic measure constructions remain targets in the README.
-/

noncomputable section
open scoped BigOperators Topology
open Polynomial Filter
set_option autoImplicit false
set_option linter.unusedVariables false

namespace TauCetiRoadmap.ArithmeticStatistics

/-! ## Layer 0: Families, heights and local specifications -/

/-- A height on an already chosen quotient or representative carrier, with finite sublevels. -/
structure ArithmeticFamily (A : Type*) where
  height : A → ℝ
  northcott : Northcott height

namespace ArithmeticFamily
variable {A : Type*} (F : ArithmeticFamily A)

/-- Inclusive, unweighted count; the Northcott field establishes finiteness. -/
def count (S : Set A) (X : ℝ) : ℕ := {a | a ∈ S ∧ F.height a ≤ X}.ncard

/-- Relative density keeps its ambient subfamily in the denominator. -/
def HasRelativeDensity (S T : Set A) (d : ℝ) : Prop :=
  Tendsto (fun X : ℝ => (F.count (S ∩ T) X : ℝ) / F.count T X) atTop (nhds d)

/-- Densities multiply along nested subfamilies of an infinite ambient family. -/
theorem relativeDensity_mul (U T S : Set A) (hUT : U ⊆ T) (hTS : T ⊆ S)
    (hS : S.Infinite) (d e : ℝ) (hT : F.HasRelativeDensity T S d)
    (hU : F.HasRelativeDensity U T e) : F.HasRelativeDensity U S (e * d) := by
  sorry

example (X : ℝ) : F.count ∅ X = 0 := by sorry
example (S : Set A) (hS : S.Infinite) : F.HasRelativeDensity S S 1 := by sorry
example : (⟨fun n : ℕ => (n : ℝ), by sorry⟩ : ArithmeticFamily ℕ).count Set.univ 3 = 4 := by sorry
example : ¬ Northcott (fun x : ℚ => (|x| : ℝ)) := by sorry

end ArithmeticFamily

namespace Coefficients
/-- Inclusive coefficient-cube height, including the empty vector. -/
def boxHeight {m : ℕ} (a : Fin m → ℤ) : ℕ := Finset.univ.sup (fun i => (a i).natAbs)

/-- Every coefficient cube has its expected finite cardinality. -/
theorem boxHeight_count (m B : ℕ) :
    Nat.card {a : Fin m → ℤ // boxHeight a ≤ B} = (2 * B + 1) ^ m := by sorry

example : Nat.card {a : Fin 1 → ℤ // boxHeight a ≤ 3} = 7 := by sorry
example (a : Fin 0 → ℤ) : boxHeight a = 0 := by sorry

/-- Monic coefficients are ordered from x^(n−1) to the constant term. -/
def monicPolynomial {R : Type*} [CommRing R] (n : ℕ) (a : Fin n → R) : R[X] :=
  X ^ n + ∑ i : Fin n, C (a i) * X ^ (n - 1 - i.val)

/-- The strict weighted box used by the monic discriminant sieve. -/
def weightedBox (n : ℕ) (X : ℝ) : Set (Fin n → ℤ) :=
  {a | ∀ i, |(a i : ℝ)| < X ^ (i.val + 1)}

example : monicPolynomial 2 (![0, 4] : Fin 2 → ℤ) = X ^ 2 + C 4 := by sorry
example : monicPolynomial 0 (fun i : Fin 0 => Fin.elim0 i) = (1 : ℤ[X]) := by sorry
example : (![0, 4] : Fin 2 → ℤ) ∉ weightedBox 2 2 := by sorry
example : (![0, 4] : Fin 2 → ℤ) ∈ weightedBox 2 3 := by sorry

/-- Evaluation of a homogeneous binary form; the point at infinity is retained. -/
def binaryValue {R : Type*} [CommRing R] (n : ℕ) (a : Fin (n + 1) → R) (x y : R) : R :=
  ∑ i, a i * x ^ (n - i.val) * y ^ i.val

example : binaryValue 2 (![0, 1, 0] : Fin 3 → ℤ) 2 3 = 6 := by sorry
example : binaryValue 2 (![1, 0, 0] : Fin 3 → ℤ) 1 0 = 1 := by sorry

/-- Strong divisibility is a condition on every coefficient perturbation. -/
def StrongSquareDivides {r : ℕ} (Delta : (Fin r → ℤ) → ℤ) (p : ℕ) (a : Fin r → ℤ) : Prop :=
  ∀ b : Fin r → ℤ, (p : ℤ) ^ 2 ∣ Delta (fun i => a i + (p : ℤ) * b i)

/-- Weak divisibility includes divisibility at the point and excludes the strong locus. -/
def WeakSquareDivides {r : ℕ} (Delta : (Fin r → ℤ) → ℤ) (p : ℕ) (a : Fin r → ℤ) : Prop :=
  (p : ℤ) ^ 2 ∣ Delta a ∧ ¬ StrongSquareDivides Delta p a

example (a : Fin 1 → ℤ) : StrongSquareDivides (fun _ => 0) 3 a := by sorry
example (a : Fin 1 → ℤ) : ¬ WeakSquareDivides (fun _ => 0) 3 a := by sorry

end Coefficients

/-- Binary quartics use ordinary monomial coefficients, with no binomial factors. -/
structure BinaryQuartic (R : Type*) where
  a : R
  b : R
  c : R
  d : R
  e : R

namespace BinaryQuartic
variable {R : Type*} [CommRing R]
/-- The invariant `I = 12ae − 3bd + c²`. -/
def invI (f : BinaryQuartic R) : R := 12 * f.a * f.e - 3 * f.b * f.d + f.c ^ 2

/-- The invariant `J = 72ace + 9bcd − 27ad² − 27eb² − 2c³`. -/
def invJ (f : BinaryQuartic R) : R :=
  72 * f.a * f.c * f.e + 9 * f.b * f.c * f.d - 27 * f.a * f.d ^ 2 - 27 * f.e * f.b ^ 2
    - 2 * f.c ^ 3

/-- The discriminant, the integral polynomial with `27 Δ = 4I³ − J²`. -/
def disc (f : BinaryQuartic R) : R :=
  let a := f.a; let b := f.b; let c := f.c; let d := f.d; let e := f.e
  256 * a ^ 3 * e ^ 3 - 192 * a ^ 2 * b * d * e ^ 2 - 128 * a ^ 2 * c ^ 2 * e ^ 2
    + 144 * a ^ 2 * c * d ^ 2 * e - 27 * a ^ 2 * d ^ 4 + 144 * a * b ^ 2 * c * e ^ 2
    - 6 * a * b ^ 2 * d ^ 2 * e - 80 * a * b * c ^ 2 * d * e + 18 * a * b * c * d ^ 3
    + 16 * a * c ^ 4 * e - 4 * a * c ^ 3 * d ^ 2 - 27 * b ^ 4 * e ^ 2 + 18 * b ^ 3 * c * d * e
    - 4 * b ^ 3 * d ^ 3 - 4 * b ^ 2 * c ^ 3 * e + b ^ 2 * c ^ 2 * d ^ 2

/-- The integral invariant identity holds in every commutative coefficient ring. -/
theorem twentySeven_mul_disc (f : BinaryQuartic R) : 27 * disc f = 4 * invI f ^ 3 - invJ f ^ 2 :=
  sorry


/-- Invariant height, before conversion to a minimal elliptic-curve height. -/
def pairHeight (I J : ℝ) : ℝ := max (|I| ^ 3) (J ^ 2 / 4)

example : invI (⟨1, 0, 0, 0, -1⟩ : BinaryQuartic ℤ) = -12 ∧
    invJ (⟨1, 0, 0, 0, -1⟩ : BinaryQuartic ℤ) = 0 ∧
    disc (⟨1, 0, 0, 0, -1⟩ : BinaryQuartic ℤ) = -256 := by sorry
example : disc (⟨0, 1, 0, -1, 0⟩ : BinaryQuartic ℤ) = 4 := by sorry
example : pairHeight 3 0 = 27 ∧ pairHeight 1 2 = 1 := by sorry

end BinaryQuartic

/-! ## Layer 1: Integral orbit dictionaries -/
namespace Orbits

/-- Plücker coordinates of the two rows in the quartic coefficient convention. -/
def quarticMinors (M : Matrix (Fin 2) (Fin 6) ℤ) : Matrix (Fin 6) (Fin 6) ℤ :=
  fun i j => M 0 i * M 1 j - M 0 j * M 1 i

/-- Changing the two row generators scales every minor by the determinant. -/
theorem quarticMinors_mul (h : Matrix (Fin 2) (Fin 2) ℤ)
    (M : Matrix (Fin 2) (Fin 6) ℤ) :
    quarticMinors (h * M) = fun i j => h.det * quarticMinors M i j := by sorry

example : quarticMinors (0 : Matrix (Fin 2) (Fin 6) ℤ) = 0 := by sorry
example (M : Matrix (Fin 2) (Fin 6) ℤ) (i j : Fin 6) :
    quarticMinors M j i = -quarticMinors M i j := by sorry

section Pencil
variable {R : Type*} [CommRing R]
/-- Signed characteristic polynomial of a pair, retaining its prescribed matrix size. -/
private def pencilPoly {n : ℕ} (A B : Matrix (Fin n) (Fin n) R) : R[X] :=
  (-1)^(n*(n-1)/2) * Matrix.det (fun i j => C (A i j) * X - C (B i j))
/-- BGW §2, p.6: descending x-degree, signed determinant of xA-yB. -/
def pencilInvariant {n : ℕ} (A B : Matrix (Fin n) (Fin n) R) : Fin (n+1) → R :=
  fun i => (pencilPoly A B).coeff (n-i.val)
/-- Simultaneous congruence scales the invariant by the square determinant. -/
theorem pencilInvariant_congr {n : ℕ} (A B g : Matrix (Fin n) (Fin n) R) :
    pencilInvariant (g * A * g.transpose) (g * B * g.transpose) =
      fun i => g.det^2 * pencilInvariant A B i := by sorry
/-- Scalar pencils recover the coefficients of the signed power of a linear form. -/
theorem pencilInvariant_scalar {n : ℕ} (a b : R) :
    pencilInvariant (a • (1 : Matrix (Fin n) (Fin n) R)) (b • 1) =
      fun i => ((-1 : R[X])^(n*(n-1)/2) * (C a * X - C b)^n).coeff (n-i.val) := by sorry
example (a b : R) : pencilInvariant (!![a]) (!![b]) = ![a,-b] := by sorry
example : pencilInvariant (1 : Matrix (Fin 3) (Fin 3) ℤ) 0 = ![-1,0,0,0] := by sorry
example {n : ℕ} (hn : 1 ≤ n) :
    pencilInvariant (0 : Matrix (Fin n) (Fin n) R) 0 = 0 := by sorry

example : pencilPoly (1 : Matrix (Fin 1) (Fin 1) ℤ) 0 = X := by sorry

end Pencil

section Isotropic
variable {K : Type*} [Field K]
/-- Coordinate bilinear pairing; in characteristic two this is not a quadratic refinement. -/
private def pairing {n : ℕ} (A : Matrix (Fin n) (Fin n) K) (u v : Fin n → K) : K :=
  ∑ i, ∑ j, u i * A i j * v j
/-- BGW §4, p.12: rank r is vector dimension, not projective dimension. -/
def commonIsotropic {n : ℕ} (r : ℕ) (A B : Matrix (Fin n) (Fin n) K) :
    Set (Submodule K (Fin n → K)) :=
  {U | Module.finrank K U = r ∧
    ∀ u ∈ U, ∀ v ∈ U, pairing A u v = 0 ∧ pairing B u v = 0}

example (U : Submodule K (Fin 3 → K)) (h : Module.finrank K U = 1) :
    U ∈ commonIsotropic 1 (0 : Matrix (Fin 3) (Fin 3) K) 0 := by sorry
example : commonIsotropic 1 (1 : Matrix (Fin 3) (Fin 3) ℝ) 0 = ∅ := by sorry
example : pairing (1 : Matrix (Fin 1) (Fin 1) ℝ) (fun _ => 2) (fun _ => 3) = 6 := by sorry
end Isotropic
end Orbits

/-! ## Layer 2: Uniform orbit counts and sieves -/
namespace Counting
/-- Square-divisor tails exclude the singular discriminant-zero locus. -/
def squareDivisorTail {A : Type*} (Delta : A → ℤ) (H : A → ℝ)
    (M : ℕ) (X : ℝ) : Set A :=
  {a | H a < X ∧ Delta a ≠ 0 ∧
    ∃ m : ℕ, M < m ∧ 0 < m ∧ Squarefree m ∧ (m : ℤ) ^ 2 ∣ Delta a}

/-- Count the contributing squarefree moduli; zero discriminant has assigned count zero. -/
def squareDivisorMultiplicity {A : Type*} (Delta : A → ℤ)
    (M : ℕ) (a : A) : ℕ := by
  classical
  exact ((Delta a).natAbs.divisors.filter fun m =>
    M < m ∧ Squarefree m ∧ (m : ℤ) ^ 2 ∣ Delta a).card

/-- A square-divisor tail is detected by positive multiplicity on the nonsingular height box. -/
theorem tail_iff_multiplicity_pos {A : Type*} (Delta : A → ℤ) (H : A → ℝ)
    (M : ℕ) (X : ℝ) (a : A) (hH : H a < X) (hDelta : Delta a ≠ 0) :
    a ∈ squareDivisorTail Delta H M X ↔ 0 < squareDivisorMultiplicity Delta M a := by sorry

example : () ∈ squareDivisorTail (fun _ : Unit => 36) (fun _ => 0) 5 1 ∧
    squareDivisorMultiplicity (fun _ : Unit => 36) 5 () = 1 := by sorry
example (M : ℕ) : squareDivisorTail (fun _ : Unit => 0) (fun _ => 0) M 1 = ∅ ∧
    squareDivisorMultiplicity (fun _ : Unit => 0) M () = 0 := by sorry

/-- The rational-root estimate uses the actual strict weighted coefficient box. -/
theorem monic_rational_root_bound (n : ℕ) (hn : 2 ≤ n) :
    ∃ C : ℝ, 0 ≤ C ∧ ∀ X : ℝ, 2 ≤ X →
      ({a | a ∈ Coefficients.weightedBox n X ∧ ∃ t : ℚ,
        ((Coefficients.monicPolynomial n a).map (Int.castRingHom ℚ)).eval t = 0}.ncard : ℝ) ≤
      C * X ^ (n * (n + 1) / 2 - n + 1) * Real.log X := by sorry

/-- Sum over the full transporter of the invariant section, retaining every stabilizer element. -/
def sectionKernel {G U I : Type*} [Group G] [MulAction G U]
    (inv : U → I) (kappa : I → U) (Theta : G → ℝ) (phi : I → ℝ) (u : U) : ℝ := by
  classical
  exact ∑' g : G, if g • kappa (inv u) = u then Theta g * phi (inv u) else 0


/-- Finite transporters retain stabilizer multiplicities when unfolding the kernel. -/
theorem sectionKernel_finite_fibre {G U I : Type*} [Group G] [MulAction G U]
    (inv : U → I) (kappa : I → U) (Theta : G → ℝ) (phi : I → ℝ) (u : U)
    (hf : {g : G | g • kappa (inv u) = u}.Finite) :
    sectionKernel inv kappa Theta phi u =
      ∑ g ∈ hf.toFinset, Theta g * phi (inv u) := by sorry

/-- The trivial two-permutation action keeps both transporter elements. -/
private instance permUnitAction : MulAction (Equiv.Perm (Fin 2)) Unit where
  smul _ u := u
  one_smul _ := rfl
  mul_smul _ _ _ := rfl

example : sectionKernel (fun _ : Unit => ()) (fun _ : Unit => ())
    (fun _ : Equiv.Perm (Fin 2) => (2 : ℝ)) (fun _ => 3) () = 12 := by sorry
example : sectionKernel (fun _ : Unit => ()) (fun _ : Unit => ())
    (fun _ : Equiv.Perm (Fin 2) => (2 : ℝ)) (fun _ => 0) () = 0 := by sorry

/-- A coupled CRT condition occupies two residues, rather than four marginal combinations. -/
example : ({x : ZMod 15 | x = 0 ∨ x = 1}.ncard : ℚ) / 15 = 2 / 15 ∧
    (2 : ℚ) / 15 ≠ (2 / 3) * (2 / 5) := by sorry

end Counting

/-! ## Layer 3: Fields, class groups and moment tools -/
namespace FieldStatistics

/-- The p-torsion in the (k−1)st power image, rather than all p-torsion. -/
def powerRank (A : Type*) [CommGroup A] [Finite A] (p k : ℕ) : ℕ :=
  Nat.log p (Nat.card {a : A // (∃ b : A, b ^ (p ^ (k - 1)) = a) ∧ a ^ p = 1})

/-- Adjacent power-image ranks add under direct products. -/
theorem powerRank_prod (A B : Type*) [CommGroup A] [Finite A] [CommGroup B] [Finite B]
    {p k : ℕ} (hp : p.Prime) (hk : 1 ≤ k) :
    powerRank (A × B) p k = powerRank A p k + powerRank B p k := by sorry

example : powerRank (Multiplicative (ZMod 2)) 2 2 = 0 := by sorry
example : powerRank (Multiplicative (ZMod 4)) 2 2 = 1 := by sorry

/-- Binary coordinates for the Fouvry–Klüners finite quadratic calculation. -/
abbrev FKSpace (k : ℕ) := Fin k → ZMod 2 × ZMod 2

/-- The asymmetric phase in the quadratic-discriminant Jacobi expansion. -/
def fkPhase {k : ℕ} (u v : FKSpace k) : ZMod 2 :=
  ∑ j, ((u j).1 + (v j).1) * ((u j).1 + (v j).2)
/-- The phase relative to zero, as a quadratic expression. -/
def fkQuadratic {k : ℕ} (u : FKSpace k) : ZMod 2 :=
  ∑ j, (u j).1 * ((u j).1 + (u j).2)
/-- Linked indices have nonzero symmetrized phase. -/
def fkLinked {k : ℕ} (u v : FKSpace k) : Prop := fkPhase u v + fkPhase v u = 1
/-- Good planes are k-dimensional subspaces annihilated by the directed pairing. -/
def fkGoodPlanes (k : ℕ) : Set (Submodule (ZMod 2) (FKSpace k)) :=
  {U | Module.finrank (ZMod 2) U = k ∧
    ∀ u ∈ U, ∀ v ∈ U, (∑ j, (u j).1 * ((v j).1 + (v j).2)) = 0}
/-- The FK good k-planes are counted by all subspaces of F₂^k. -/
theorem fk_good_subspace_bijection (k : ℕ) :
    Nonempty ({U // U ∈ fkGoodPlanes k} ≃ Submodule (ZMod 2) (Fin k → ZMod 2)) := by sorry

example : fkPhase (fun _ : Fin 1 => (1, 0)) 0 = 1 ∧
    fkPhase 0 (fun _ : Fin 1 => (1, 0)) = 0 := by sorry
example : fkQuadratic (fun _ : Fin 1 => (1, 0)) = 1 ∧
    fkQuadratic (fun _ : Fin 1 => (1, 1)) = 0 := by sorry
example : fkLinked (fun _ : Fin 1 => (1, 0)) 0 := by sorry
example : Nat.card (FKSpace 0) = 1 ∧ Nat.card (FKSpace 1) = 4 := by sorry
example : (fkGoodPlanes 2).ncard = 5 := by sorry
end FieldStatistics

namespace Distributions
/-- Wood's separating product on a finite partition grid, with its convergent first factor. -/
def woodGridSeparator (m p : ℕ) (b : Fin (m + 1) → ℕ)
    (z : Fin (m + 1) → ℂ) : ℂ :=
  (∏' j : ℕ, (1 - z 0 / (p : ℂ) ^ (b 0 + 1 + j))) *
    ∏ i : Fin m,
      ∏ j ∈ Finset.Icc
        ((∑ k : Fin (m + 1) with k.val ≤ i.val + 1, b k) + 1)
        ((∑ k : Fin (m + 1) with k.val ≤ i.val, b k) + b i.castSucc),
        (1 - z i.succ / (p : ℂ) ^ j)

/-- The separator vanishes on a partition lexicographically greater than its target. -/
theorem woodGridSeparator_upper {m p : ℕ} (hp : p.Prime)
    (b f : Fin (m + 1) → ℕ) (hb : Antitone b) (hf : Antitone f)
    (hlex : ∃ i : Fin (m + 1), (∀ j, j < i → f j = b j) ∧ b i < f i) :
    woodGridSeparator m p b
      (fun i => (p : ℂ) ^ (∑ j : Fin (m + 1) with j ≤ i, f j)) = 0 := by sorry

/-- The same product is nonzero at the target partition. -/
theorem woodGridSeparator_diagonal {m p : ℕ} (hp : p.Prime)
    (b : Fin (m + 1) → ℕ) (hb : Antitone b) :
    woodGridSeparator m p b
      (fun i => (p : ℂ) ^ (∑ j : Fin (m + 1) with j ≤ i, b j)) ≠ 0 := by sorry


example : woodGridSeparator 0 2 (fun _ => 0) (fun _ => 2) = 0 := by sorry
example : woodGridSeparator 0 2 (fun _ => 0) (fun _ => 1) ≠ 0 := by sorry

end Distributions

/-! ## Layer 4: Selmer averages and arithmetic applications -/
namespace Selmer

/-- Restrict an existing Selmer set by a specified local image at every place. -/
def restrictedSelmerSet {A V : Type*} {Q : V → Type*} (S : Set A)
    (loc : (v : V) → A → Q v) (I : (v : V) → Set (Q v)) : Set A :=
  {s | s ∈ S ∧ ∀ v, loc v s ∈ I v}

example : restrictedSelmerSet (Set.univ : Set (Fin 3))
    (fun _ : Bool => id) (fun b => if b then {0, 1} else {1, 2}) = {1} := by sorry
example (S : Set ℕ) : restrictedSelmerSet (Q := fun _ : Empty => ℕ) S
    (fun v : Empty => Empty.elim v) (fun v : Empty => Empty.elim v) = S := by sorry

/-- Odd subsets of at most k out of m real components. -/
def oddComponentBound (m k : ℕ) : ℕ :=
  ∑ j ∈ (Finset.range (k + 1)).filter (fun j => Odd j), Nat.choose m j

/-- For fixed odd degree, the effective-divisor image occupies a vanishing fraction of real components. -/
theorem component_bound_ratio_tendsto (k : ℕ) :
    Tendsto (fun m : ℕ => (oddComponentBound m k : ℝ) / 2 ^ (m - 1))
      atTop (nhds 0) := by sorry

example : oddComponentBound 3 1 = 3 := by sorry
example : oddComponentBound 5 3 = 15 ∧ oddComponentBound 3 9 = 4 := by sorry

/-- Degree-three evaluation in the ten ordinary ternary monomial coefficients. -/
private def ternaryValue (c : Fin 10 → ℤ) (x : Fin 3 → ℚ) : ℚ :=
  c 0 * x 0 ^ 3 + c 1 * x 0 ^ 2 * x 1 + c 2 * x 0 ^ 2 * x 2 +
  c 3 * x 0 * x 1 ^ 2 + c 4 * x 0 * x 1 * x 2 + c 5 * x 0 * x 2 ^ 2 +
  c 6 * x 1 ^ 3 + c 7 * x 1 ^ 2 * x 2 + c 8 * x 1 * x 2 ^ 2 + c 9 * x 2 ^ 3
example : ternaryValue (![1,0,0,0,0,0,0,0,0,0] : Fin 10 → ℤ) ![2,3,4] = 8 := by sorry
example (c : Fin 10 → ℤ) : ternaryValue c 0 = 0 := by sorry

/-- A positive proportion of ternary cubic coefficient vectors have a rational projective zero.
The geometric proof must control the fundamental multiset's finite multiplicity. -/
theorem positive_plane_cubic_solubility :
    0 < liminf (fun T : ℕ =>
      ({c : Fin 10 → ℤ | (∀ i, |c i| ≤ (T : ℤ)) ∧
        ∃ x : Fin 3 → ℚ, x ≠ 0 ∧ ternaryValue c x = 0}.ncard : ℝ) /
      (((2 * T + 1) ^ 10 : ℕ) : ℝ)) atTop := by sorry

end Selmer

/-! ## Layer 5: Probability models and function-field distributions -/
namespace Distributions

/-- A continuous quadratic form whose polar adjoint is a topological group isomorphism. -/
structure LCQuadraticData (V : Type*) [AddCommGroup V] [TopologicalSpace V]
    [IsTopologicalAddGroup V] [T2Space V] [LocallyCompactSpace V] where
  quadratic : QuadraticMap ℤ V (AddCircle (1 : ℝ))
  continuous_quadratic : Continuous quadratic
  adjoint : V ≃ₜ+ (V →ₜ+ AddCircle (1 : ℝ))
  adjoint_apply : ∀ x y, adjoint x y = QuadraticMap.polar quadratic x y


namespace LCQuadraticData
variable {V : Type*} [AddCommGroup V] [TopologicalSpace V]
  [IsTopologicalAddGroup V] [T2Space V] [LocallyCompactSpace V]

/-- The polar diagonal is 2q(x), also in the dyadic case. -/
theorem polar_self (D : LCQuadraticData V) (x : V) :
    D.adjoint x x = (2 : ℤ) • D.quadratic x := by sorry

example (D : LCQuadraticData V) (h : D.quadratic = 0) : Subsingleton V := by sorry
example (D : LCQuadraticData V) (χ : V →ₜ+ AddCircle (1 : ℝ)) :
    ∃ x, D.adjoint x = χ := by sorry
end LCQuadraticData

/-- Prime Selmer laws share one parity; the empty prime set has weight one. -/
def parityCoupledWeight (k : ℕ) (w : Fin k → ℕ → ℝ) (d : Fin k → ℕ) : ℝ :=
  if k = 0 then 1 else
    if ∀ i j, d i % 2 = d j % 2 then
      (2 : ℝ) ^ (k - 1) * ∏ i, w i (d i)
    else 0

/-- Half-mass in each parity normalizes the coupled finite-prime law. -/
theorem parityCoupledWeight_total {k : ℕ} (w : Fin k → ℕ → ℝ)
    (hw : ∀ i n, 0 ≤ w i n) (hs : ∀ i, Summable (w i))
    (he : ∀ i, (∑' n : ℕ, w i (2 * n)) = 1 / 2)
    (ho : ∀ i, (∑' n : ℕ, w i (2 * n + 1)) = 1 / 2) :
    Summable (parityCoupledWeight k w) ∧ ∑' d, parityCoupledWeight k w d = 1 := by sorry

-- the coupling factor for two primes is two.
example (w : Fin 2 → ℕ → ℝ) :
    parityCoupledWeight 2 w (fun _ => 0) = 2 * w 0 0 * w 1 0 := by sorry
-- independent prime laws give the wrong support.
example (w : Fin 2 → ℕ → ℝ) :
    parityCoupledWeight 2 w (fun i => i.val) = 0 := by sorry

end Distributions

/-!
The README also gives the following definitions and interfaces, including their APIs
and Checks. Some have the representative specializations above; the others require
the full arithmetic, geometric or probability carriers specified there.

Layer 0:
Functions defined by congruence conditions share the acceptable weight interface.
arithmetic family; relative density; stabilizer weighted orbit count; family defined by local
conditions; acceptable weight function; binary quartic form; binary quartic invariants; binary
quartic height; eligible invariant pairs; elliptic curves over q ordered by height; elliptic
families defined by congruence conditions; invariants height and eligible pairs; squareclass
height; quadratic twist squareclass family; positive squarefree family over q; number fields
ordered by discriminant; binary cubic forms and the twisted action; cubic ring; cubic ring of a
binary cubic form; coefficient vector form; local density of a form modulo q; odd degree
quadratic function field family; coefficient box; monic weighted height; binary discriminant;
binary local proportion; monic local proportions; strong weak discriminant; local maximality;
kappa acceptable specifications; primitive hypersurface family; finite local hypersurface set;
hyperelliptic model family; negative pell radicands; unpolarized abelian count; principally
polarized count; polarization fiber count; natural bundle law; finite picard quotient; picard
representatives and carry; finite joint bundle mass; parity product candidate; hecke
pushforward; wood outside involutions; wood admissible type; wood good type; wood type
automorphisms; wood continuous surjections; wood infinity and type adapter; symmetric pencil;
binary discriminant; binary form order; stickelberger binary; monic density formulas; monic
euler products.

Layer 1:
index form of a based cubic ring; davenport heilbronn sets; pairs of ternary quadratic forms;
quartic ring and cubic resolvent; quartic ring of a pair; quadruples of quinary alternating
forms; pgl2 orbits and stabilizers of binary quartic forms; soluble binary quartic forms;
covariants of a binary quartic; cubic invariant of a binary quartic; quartic of a point; cubic
invariant of the quartic of a point; locally soluble quartics and the two selmer group; ternary
cubic forms and their invariants; projection of a plane cubic from a rational point; embedding
into pairs of ternary quadratic forms; quartic minors; binary density formulas; quintic
multiplication; sextic multiplication; based sextic resolvent; monogenized resolvent; common
isotropic; oriented ideal triples; oriented norm pairs; weak discriminant divisibility; q
hyperdeterminant; marked q.

Layer 2:
strongly and weakly divisible values; real root types of binary quartic forms; fundamental sets
for real binary quartic orbits; gauss fundamental domain in iwasawa coordinates; averaged count
of binary quartic orbits; averaged count of binary cubic orbits; square divisor tail; kappa
acceptable; section kernel.

Layer 3:
number field counting function; torsion count of class groups; splitting symbol and local sets
of binary cubic forms; acceptable local specifications for cubic orders; cohen lenstra moment
prediction; malle invariants of a permutation group; malle conjecture; gaussian binomial
coefficient; isomorphism classes of finite abelian p groups; surjection count; cohen lenstra
measure; surjection moment; enlargement of finite abelian p groups; cokernel law of haar random
p adic matrices; cohen lenstra measure over a finite set of primes; matrix kernel law over a
finite field; symmetric matrix kernel law; koymans pagano rank identity; prime power class group
rank; fk linking phase; rigid embedded field family; embedded quadratic wreath type; nonabelian
quadratic moment interface; embedded type catalogue; a4 appendix kernel enumerator; governing
field interface; restricted real quadratic family; polynomial order lattice reduction;
nonabelian tame local model; wood grid separator.

Layer 4:
rational orbit weight; locally soluble forms attached to a family; local masses of a family;
average over a height ordered family; height moments in an arithmetic family; admissibility;
restricted selmer set; odd component bound; rank one family.

Layer 5:
cohen lenstra heuristic for quadratic fields; cohen lenstra moment conjecture for quadratic
fields; cohen martinet predicted surjection moment; cohen lenstra martinet average conjecture;
cohen martinet surjection moment conjecture; enhanced cohen lenstra finite level law; enhanced
cohen lenstra conjecture; maximal isotropic subspaces of a quadratic space; isotropic reduction
map; poonen rains distribution; delaunay sha p rank law; alternating matrix kernel law;
symplectic finite abelian p groups; alternating cokernel law; bklpr model; poonen rains selmer
conjecture; bhargava shankar selmer average conjecture; bklpr selmer conjecture; p infinity
selmer corank distribution in twist families; smith twist family hypothesis; selmer ratio of an
isogeny; gradient valuation strata; kolmogorov distance; normalized eigenangle spacing measure;
generalized dihedral cover datum; class group surjection pair; empirical l primary class group
law; lower and upper degree densities; symplectic similitude group; eventual degree large q
limit; printed bad type ordinary limit assertion; whole fixed degree component profile; boundary
component remainder; complete stable range component sum; lc quadratic; weak metabolic; maximal
isotropics; joint parity weight; squarefree selmer conjecture; odd degree jacobian conjecture;
even genus two selmer conjecture; injection moment conjecture; global image splitting
conjecture.

Brauer relations and regulator constants use the existing induction/restriction functors;
their self-dual determinant interfaces are specified with the Layer 4 parity targets.

The full ring/resolvent and covering dictionaries, arithmetic field and Selmer
asymptotics, uniform sieve estimates, finite-group laws, and Hurwitz component limits
remain the end theorems of the README, with their exact hypotheses and source locators.
-/

end TauCetiRoadmap.ArithmeticStatistics
