/-
This file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/ArithmeticKTheory.md` is definitive. These statements
suggest Lean forms so that contributors and reviewers can converge on names
and signatures. Every roadmap target remains unimplemented.

Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.

Only light definitions over pinned carriers appear here. The README specifies
the higher K, GW, L, Bott/étale and certificate targets, their APIs and tests.
Those carriers require their owning roadmaps; no assumed carrier or data
definition stands in for them. Gaps in a mathematical proof remain gaps even
when a theorem signature below elaborates.
-/
import Mathlib.Algebra.Group.Subgroup.Pointwise
import Mathlib.LinearAlgebra.Eigenspace.Basic
import Mathlib.NumberTheory.Bernoulli
import Mathlib.NumberTheory.NumberField.ClassNumber
import Mathlib.NumberTheory.NumberField.Cyclotomic.Basic
import Mathlib.RingTheory.DedekindDomain.SInteger
import TauCeti.RingTheory.DedekindDomain.SInteger.Basic
import TauCeti.RingTheory.DedekindDomain.SInteger.Unit

noncomputable section

open IsDedekindDomain
open scoped Pointwise

namespace ArithmeticKTheory

/-! N.1: use the actual S-integer subalgebra and units. -/

section SIntegers

variable {R : Type*} [CommRing R] [IsDedekindDomain R]
  (S : Set (HeightOneSpectrum R)) (F : Type*) [Field F]
  [Algebra R F] [IsFractionRing R F]

/-- The candidate denominators are the preimage of the units of the existing ring. -/
def sUnitSubmonoid : Submonoid R :=
  (IsUnit.submonoid (S.integer F)).comap (algebraMap R (S.integer F))

/-- N.1 localization criterion; no finiteness of S is assumed. -/
theorem integer_isLocalization_iff (M : Submonoid R) :
    IsLocalization M (S.integer F) ↔
      M ≤ sUnitSubmonoid S F ∧ ∀ v ∈ S, ∃ m ∈ M, m ∈ v.asIdeal := by
  sorry

example : (∅ : Set (HeightOneSpectrum R)).integer F = ⊥ :=
  IsDedekindDomain.integer_empty R F

example : (Set.univ : Set (HeightOneSpectrum R)).integer F = ⊤ :=
  IsDedekindDomain.integer_univ R F

example [Finite S] [Monoid.FG Rˣ] : Group.FG (S.unit F) :=
  inferInstance

end SIntegers

/-
N.2 imports the general Dedekind sequence from S.3 and the degree-two rows
from T.5. Its ramified pullback multiplies the residue extension by e(q/p).
N.3 imports orientation-correct Steinberg finiteness from R.1; only the
Quillen rank-filtration assembly is arithmetic here. R.3 supplies ranks for
orders, and N.3:ranks supplies the finite-S localization extension in n >= 2.
The connective H-space finite-type and homotopy-orbit inputs remain the
explicit H.3/H.6 requests, including nonzero pi_1 in the former.

The three new hermitian targets specify periodic L finiteness, all genuine
Q^(>=m) L finiteness, and classical symmetric/quadratic GW finiteness in n>=0.
Their carriers and fibre sequences belong to GN.6 and HK.7/HK.8; they are
README targets, rather than locally constructed spectra in this file.
-/

/-- Numerical rank convention for positive degrees >= 2; degree one is separate. -/
def borelRank (r₁ r₂ n : ℕ) : ℕ :=
  if n % 4 = 1 then r₁ + r₂ else if n % 4 = 3 then r₂ else 0

example : borelRank 1 0 3 = 0 ∧ borelRank 1 0 5 = 1 := by sorry

example : borelRank 0 1 3 = 1 ∧ borelRank 0 1 5 = 1 := by sorry

example (r₁ r₂ k : ℕ) : borelRank r₁ r₂ (2 * k) = 0 := by sorry

/-
N.4 has the single W_j(F)=H^0(F,Q/Z(j)) carrier. No new Tate twist is built
here. In a number field W_j is finite only for j != 0; w_2(Q)=24, whereas
mu(Q) has order 2. The corrected w_10(Q) is 264, not 1320.

N.5 uses M.7's named Suslin-real comparison and corrected real-place descent.
RT.4 must supply real KO/BO as requested. The odd structure table keeps its
noncanonical abstract splitting distinct from the natural e-invariant and
descent edge; full M.8 is not an input to that early torsion edge.
-/

/-! N.6: divisibility means an intersection of images, not a divisible subgroup. -/

section DivisibleElements

variable (A : Type*) [AddCommGroup A]

/-- The elements divisible by every positive integer. -/
def divisibleSubgroup : AddSubgroup A :=
  ⨅ (m : ℕ) (_ : 1 ≤ m), m • (⊤ : AddSubgroup A)

theorem mem_divisibleSubgroup_iff {x : A} :
    x ∈ divisibleSubgroup A ↔ ∀ m : ℕ, 1 ≤ m → ∃ y, m • y = x := by
  sorry

theorem divisibleSubgroup_eq_bot_of_finite [Finite A] :
    divisibleSubgroup A = ⊥ := by
  sorry

example : divisibleSubgroup ℚ = ⊤ := by sorry

example : divisibleSubgroup ℤ = ⊥ := by sorry

example : divisibleSubgroup (ZMod 4) = ⊥ := by sorry

end DivisibleElements

/-- Slot (cohomological degree, twist) for the positive/negative piece of degree 2j.
`positive = true` means the +1 eigenspace of dualization, not complex conjugation. -/
def bottCohomologySlot (j : ℤ) (positive : Bool) : ℕ × ℤ :=
  if positive = decide (Even j) then (0, j) else (2, j + 1)

theorem bottCohomologySlot_totalDegree (j : ℤ) (positive : Bool) :
    2 * (bottCohomologySlot j positive).2 -
      ((bottCohomologySlot j positive).1 : ℤ) = 2 * j := by
  sorry

example : bottCohomologySlot 0 true = (0, 0) := by sorry

example : bottCohomologySlot 0 false = (2, 1) := by sorry

example : bottCohomologySlot (-1) true = (2, 0) ∧
    bottCohomologySlot (-1) false = (0, -1) := by sorry

example : bottCohomologySlot 1 true = (2, 2) ∧
    bottCohomologySlot 1 false = (0, 1) := by sorry

/-
The actual Adams pieces use Module.End.eigenspace of the existing operation.
For X=Spec Z[1/p] or Z[zeta_(p^r),1/p], p odd, the README specifies canonical
edge maps, for all integer j:
  H^2(X,Z/q(j+1)) -> K^beta_(2j)(X;Z/q) -> H^0(X,Z/q(j)),
with opposite dualization signs. The projectors (1 plus or minus psi^(-1))/2 give the
canonical splitting. Odd degree 2j-1 is H^1(X,Z/q(j)). The four even entries
are stated separately for degrees 4k-2 and 4k, including negative k.
No ring structure on a mod-3 Moore spectrum is asserted.

Ordinary-to-Bott comparison holds in i>=0 after inverting p, and for i=0
or i>=2 before doing so. Ordinary degree one has an extra valuation class;
ordinary negative K-groups do not acquire the periodic table. Raw completion,
symbol and cohomological wild kernels remain distinct. G-WildHigher and
G-WildExceptional mark the precise unproved comparisons.
-/

/-! N.7: arithmetic Bernoulli convention and the class-number predicate. -/

/-- Translation of Weibel's positive, reindexed Bernoulli convention for k>=1. -/
def bernoulliTop (k : ℕ) : ℚ := (-1) ^ (k + 1) * bernoulli (2 * k)

example : bernoulli 1 = -1 / 2 := bernoulli_one

example : bernoulliTop 1 = 1 / 6 := by sorry

example : bernoulli 12 = -691 / 2730 ∧ bernoulliTop 6 = 691 / 2730 := by sorry

example : bernoulliTop 5 = 5 / 66 ∧ (bernoulli 10 / 5).num = 1 := by sorry

/-- Used with an explicit prime hypothesis; this never includes Vandiver's condition. -/
def IsRegularPrime (p : ℕ) : Prop :=
  ¬ p ∣ NumberField.classNumber (CyclotomicField p ℚ)

/-- Source-proof boundary G-RegularProofs remains open even for this signature. -/
theorem kummer_criterion (p : ℕ) (hp : p.Prime) (hodd : Odd p) :
    ¬ IsRegularPrime p ↔
      ∃ k ∈ Finset.Icc 1 ((p - 3) / 2), (p : ℤ) ∣ (bernoulli (2 * k)).num := by
  sorry

example : IsRegularPrime 3 := by sorry

example : ¬ IsRegularPrime 37 := by sorry

/-
N.8 imports K0(Z), K1(Z), K2(Z), K2(Q) from Z.6/U.6/T.5.
N.5 gives K3(Z)=K3(Q)=Z/48 and K3(Z[i])=K3(Q(i))=Z+Z/24.
N.5/N.8 supply V.5, which keeps decomposable/indecomposable analysis.
The independent Tate certificates give K2(Z[i])=0 and
K2(Z[(1+sqrt(5))/2])=(Z/2)^2. The latter uses both real signs for its lower
bound and the eleven exact residue steps and norm-33 cutoff for its upper
bound. It supplies B.3; Birch-Tate is never used to certify that upper bound.
All certificate data and their arithmetic proof obligations are in the README.
-/

end ArithmeticKTheory
