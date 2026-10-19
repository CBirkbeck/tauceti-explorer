/-
Suggested Lean statements for "Drinfeld modules, t-motives and characteristic-p special values,
Part II: multiple zeta values and Thakur's basis" (DrinfeldModulesAndTModulesPartII).

This file is not the roadmap and is not exhaustive: the roadmap document
(research/blueprint/readmes/DrinfeldModulesAndTModulesPartII.md) is definitive. The statements
below suggest Lean forms so that contributors and reviewers converge on names and signatures.
Every proof is a placeholder. Only objects whose carriers exist at the pinned Mathlib are
given real definitions: indices (lists of natural numbers), compositions, the power sums over
`F_q[θ]` as elements of `RatFunc F_q`, the values as sums in `RatFunc.CompletionAtInfty F_q`,
their weight spans, the counting sequences and Chen's coefficients. Objects built on `C_∞`,
the Tate algebra, the entire series ring and dual t-motives (MZ.3–MZ.4) need carriers planned
in DrinfeldModulesAndTModules and are README targets; the register at the end lists their
names.

Conventions: `Fq` is a finite field with `q = Fintype.card Fq` elements, `θ = X` is the
variable of `Fq[X]`, `K = RatFunc Fq`, `K∞ = RatFunc.CompletionAtInfty Fq`. An index is a
`List ℕ` of positive entries; an array is a `List (ℕ × Fqˣ)`. The empty truncated power sum is
`1` for every natural `d` (Ngo Dac's convention; source issue E1).
The general power-sum targets in the reader use arrays: their prototypes here are
`altPowerSum` and `altCarlitzPowerSum`; `powerSum` and `carlitzPowerSum` specialise to
trivial characters. The independent review keeps the full period matrix under the
termwise norm bound, uses only the first column on Chang's larger convergence domain,
and states rational proportionality for polynomial solutions on a chosen support.
These analytic/difference-system statements remain README targets.
-/
import Mathlib.FieldTheory.RatFunc.Valuation
import Mathlib.FieldTheory.Finite.Basic
import Mathlib.Combinatorics.Enumerative.Composition
import Mathlib.Topology.Algebra.InfiniteSum.Basic
import Mathlib.LinearAlgebra.Dimension.Finrank
import Mathlib.Algebra.CharP.Lemmas
import Mathlib.Data.Finsupp.Basic

open Polynomial

namespace FunctionFieldMZV

/-! ## MZ.0 — indices, arrays and their orders -/

section Indices

/-- The weight `wt(s) = s_1 + ⋯ + s_r` of an index. -/
def Index.weight (s : List ℕ) : ℕ := s.sum

/-- The depth `dep(s) = r` of an index. -/
def Index.depth (s : List ℕ) : ℕ := s.length

/-- Prefix dominance `s ≤ t`: equal weight and dominated (zero-padded) prefix sums. -/
def Index.Dominates (s t : List ℕ) : Prop :=
  s.sum = t.sum ∧ ∀ i, (s.take i).sum ≤ (t.take i).sum

/-- The collapse `T_i(s) = (s_1 + ⋯ + s_i, s_{i+1}, …, s_r)` (the empty index is fixed). -/
def Index.collapse (i : ℕ) : List ℕ → List ℕ
  | [] => []
  | s@(_ :: _) => (s.take i).sum :: s.drop i

/-- Ngo Dac's initial tuple `Init(s)`: the longest initial segment with entries `≤ q`. -/
def Index.init (q : ℕ) (s : List ℕ) : List ℕ := s.takeWhile (· ≤ q)

/-- `k`-admissibility of an index. -/
def Index.IsAdmissible (q k : ℕ) (s : List ℕ) : Prop :=
  (∀ i < k, s.getD i 0 ≤ q) ∧
    ¬ (s ≠ [] ∧ s.length ≤ k ∧ (∀ x ∈ s.dropLast, x ≤ q) ∧ s.getLast? = some q)

/-- Thakur's condition: entries `≤ q` and last entry `< q`. -/
def IsThakur (q : ℕ) (s : List ℕ) : Prop :=
  (∀ x ∈ s.dropLast, x ≤ q) ∧ ∀ x ∈ s.getLast?, x < q

/-- The character `χ(ε) = ε_1⋯ε_r` of an array. -/
def ZetaArray.character {Fq : Type*} [Field Fq] (s : List (ℕ × Fqˣ)) : Fqˣ :=
  (s.map Prod.snd).prod

theorem Index.dominates_depth {s t : List ℕ} (hs : ∀ x ∈ s, 0 < x) (ht : ∀ x ∈ t, 0 < x)
    (h : Index.Dominates s t) : Index.depth t ≤ Index.depth s := sorry

theorem Index.dominates_collapse {s t : List ℕ} (h : Index.Dominates s t) (k : ℕ) (hk : 1 ≤ k) :
    Index.Dominates (Index.collapse k s) (Index.collapse k t) := sorry

theorem Index.admissible_weight_iff (q w : ℕ) (s : List ℕ) (hpos : ∀ x ∈ s, 0 < x)
    (hw : s.sum = w) (hw1 : 1 ≤ w) : Index.IsAdmissible q w s ↔ IsThakur q s := sorry

-- Index.test_weight
example : Index.weight [2, 1, 3] = 6 ∧ Index.depth [2, 1, 3] = 3 := by decide
-- Index.test_dominates
example : Index.Dominates [1, 2] [2, 1] ∧ ¬ Index.Dominates [2, 1] [1, 2] := sorry
-- Index.test_not_lex
example : ¬ Index.Dominates [1, 3] [2, 1, 1] ∧ ¬ Index.Dominates [2, 1, 1] [1, 3] := sorry
-- Index.test_empty
example (q k : ℕ) : Index.weight [] = 0 ∧ Index.init q [] = [] ∧ Index.IsAdmissible q k [] := sorry
-- Index.test_admissible
example (q : ℕ) (hq : 2 ≤ q) : ¬ Index.IsAdmissible q 1 [q] ∧ Index.IsAdmissible q 1 [q, 1] := sorry

end Indices

/-! ## MZ.0 — index families and counting -/

section Families

open Classical in
/-- Thakur's family `I^T_w` as a finset of compositions of `w`. -/
noncomputable def thakurIndices (q w : ℕ) : Finset (Composition w) :=
  Finset.univ.filter fun c => IsThakur q c.blocks

open Classical in
/-- The small-entry family `I^0_w` (every entry `< q`). -/
noncomputable def smallIndices (q w : ℕ) : Finset (Composition w) :=
  Finset.univ.filter fun c => ∀ x ∈ c.blocks, x < q

open Classical in
/-- The Hoffman-type family `IND_w` (no entry divisible by `q`). -/
noncomputable def hoffmanIndices (q w : ℕ) : Finset (Composition w) :=
  Finset.univ.filter fun c => ∀ x ∈ c.blocks, ¬ q ∣ x

/-- The block map `ι`: an entry `hq + r` (`0 < r < q`) becomes `q, …, q, r` (`h` copies of `q`). -/
def blockMap (q : ℕ) (s : List ℕ) : List ℕ :=
  s.flatMap fun x => List.replicate (x / q) q ++ [x % q]

/-- `thakurDimList q w = [d(w), d(w-1), …, d(0)]`. -/
def thakurDimList (q : ℕ) : ℕ → List ℕ
  | 0 => [1]
  | w + 1 =>
    let L := thakurDimList q w
    (if w + 1 < q then 2 ^ w else if w + 1 = q then 2 ^ w - 1 else (L.take q).sum) :: L

/-- Thakur–Todd's counting sequence `d(w)`. -/
def thakurDim (q w : ℕ) : ℕ := (thakurDimList q w).headD 0

/-- `altDimList q w = [s(w), …, s(0)]`, with `s(0) = 1`. -/
def altDimList (q : ℕ) : ℕ → List ℕ
  | 0 => [1]
  | w + 1 =>
    let L := altDimList q w
    (if w + 1 < q then (q - 1) * q ^ w
      else if w + 1 = q then (q - 1) * (q ^ w - 1)
      else (q - 1) * (L.take (q - 1)).sum + L.getD (q - 1) 0) :: L

/-- The sequence `s(w)` counting `AS_w`. -/
def altDim (q w : ℕ) : ℕ := (altDimList q w).headD 0

/-- `altThakurCountList q w = [t(w), …, t(0)]`, with `t(0) = 1`. -/
def altThakurCountList (q : ℕ) : ℕ → List ℕ
  | 0 => [1]
  | w + 1 =>
    let L := altThakurCountList q w
    (if w + 1 < q then (q - 1) * q ^ w
      else if w + 1 = q then (q - 1) * (q ^ w - 1)
      else (q - 1) * (L.take q).sum) :: L

/-- The sequence `t(w)` counting `AT_w`. -/
def altThakurCount (q w : ℕ) : ℕ := (altThakurCountList q w).headD 0

/-- `smallCountList q w = [c(w), …, c(0)]`. -/
def smallCountList (q : ℕ) : ℕ → List ℕ
  | 0 => [1]
  | w + 1 => let L := smallCountList q w; (L.take (q - 1)).sum :: L

/-- The number `c(w)` of compositions of `w` with parts `< q`. -/
def smallCount (q w : ℕ) : ℕ := (smallCountList q w).headD 0

theorem thakurDim_rec (q w : ℕ) (hq : 2 ≤ q) (hw : q < w) :
    thakurDim q w = ∑ i ∈ Finset.range q, thakurDim q (w - 1 - i) := sorry

theorem card_thakurIndices (q w : ℕ) (hq : 2 ≤ q) (hw : 1 ≤ w) :
    (thakurIndices q w).card = thakurDim q w := sorry

theorem card_hoffmanIndices (q w : ℕ) (hq : 2 ≤ q) (hw : 1 ≤ w) :
    (hoffmanIndices q w).card = thakurDim q w := sorry

theorem card_smallIndices (q w : ℕ) (hq : 2 ≤ q) (hw : 1 ≤ w) :
    (smallIndices q w).card = smallCount q w := sorry

theorem blockMap_bijective (q w : ℕ) (hq : 2 ≤ q) :
    Set.BijOn (fun c : Composition w => blockMap q c.blocks)
      (hoffmanIndices q w : Set (Composition w))
      ((fun c : Composition w => c.blocks) '' (thakurIndices q w : Set (Composition w))) := sorry

theorem thakurIndices_eq_of_le (q w : ℕ) (hq : 2 ≤ q) (hw : w ≤ q) :
    thakurIndices q w = smallIndices q w ∧ thakurIndices q w = hoffmanIndices q w := sorry

-- thakurDim_test_q2
example : (List.range 5).map (fun w => thakurDim 2 (w + 1)) = [1, 1, 2, 3, 5] := by decide
-- thakurDim_test_q3
example : thakurDim 3 4 = 6 ∧ altDim 3 4 = 46 := by decide
-- thakurDim_test_q
example : thakurDim 5 5 = 2 ^ 4 - 1 := by decide
-- altDim_test_ne
example : altThakurCount 3 4 = 48 ∧ altDim 3 4 ≠ altThakurCount 3 4 := by decide
-- thakurDim_two
example : ∀ w ∈ List.range 10, thakurDim 2 (w + 3) = thakurDim 2 (w + 2) + thakurDim 2 (w + 1) := by
  decide
-- indexFamilies_test_q3 (the block map sends (4) to (3, 1))
example : blockMap 3 [4] = [3, 1] := by decide
-- indexFamilies_test_q2
example : blockMap 2 [3] = [2, 1] ∧ blockMap 2 [1, 1, 1] = [1, 1, 1] := by decide

end Families

/-! ## MZ.0 — power sums of both realisations -/

section PowerSums

variable (Fq : Type*) [Field Fq] [Fintype Fq] [DecidableEq Fq] [DecidableEq (RatFunc Fq)]

/-- The monic polynomials of degree `d`, `A_{+,d}`. -/
noncomputable def monicDeg (d : ℕ) : Finset Fq[X] :=
  Finset.univ.image fun c : Fin d → Fq => X ^ d + ∑ i : Fin d, C (c i) * X ^ (i : ℕ)

/-- `ℓ_d = ∏_{i=1}^{d} (θ - θ^{q^i})`. -/
noncomputable def carlitzEll (d : ℕ) : Fq[X] :=
  ∏ i ∈ Finset.range d, (X - X ^ (Fintype.card Fq ^ (i + 1)))

/-- Depth-one Thakur power sum `S_d(s) = Σ_{a ∈ A_{+,d}} a^{-s}`. -/
noncomputable def powerSum1 (d s : ℕ) : RatFunc Fq :=
  ∑ a ∈ monicDeg Fq d, ((algebraMap Fq[X] (RatFunc Fq) a) ^ s)⁻¹

/-- Depth-one Carlitz power sum `Si_d(s) = ℓ_d^{-s}`. -/
noncomputable def carlitzPowerSum1 (d s : ℕ) : RatFunc Fq :=
  ((algebraMap Fq[X] (RatFunc Fq) (carlitzEll Fq d)) ^ s)⁻¹

/-- Iterated truncated sums `Σ_{d > d_1 > ⋯ > d_r ≥ 0} ∏ f(d_i, a_i)`; `1` on the empty array. -/
noncomputable def iterLT (f : ℕ → ℕ × Fqˣ → RatFunc Fq) : ℕ → List (ℕ × Fqˣ) → RatFunc Fq
  | _, [] => 1
  | d, a :: s => ∑ j ∈ Finset.range d, f j a * iterLT f j s

/-- Iterated fixed-degree sums `Σ_{d = d_1 > ⋯ > d_r ≥ 0} ∏ f(d_i, a_i)`. -/
noncomputable def iterFixed (f : ℕ → ℕ × Fqˣ → RatFunc Fq) (d : ℕ) : List (ℕ × Fqˣ) → RatFunc Fq
  | [] => if d = 0 then 1 else 0
  | a :: s => f d a * iterLT Fq f d s

/-- `S_d(ε; s)` for an array. -/
noncomputable def altPowerSum (d : ℕ) (s : List (ℕ × Fqˣ)) : RatFunc Fq :=
  iterFixed Fq (fun d a => algebraMap Fq (RatFunc Fq) ((a.2 : Fq) ^ d) * powerSum1 Fq d a.1) d s

/-- `Si_d(ε; s)` for an array. -/
noncomputable def altCarlitzPowerSum (d : ℕ) (s : List (ℕ × Fqˣ)) : RatFunc Fq :=
  iterFixed Fq (fun d a => algebraMap Fq (RatFunc Fq) ((a.2 : Fq) ^ d) * carlitzPowerSum1 Fq d a.1) d s

/-- Trivial characters. -/
def trivialArray (s : List ℕ) : List (ℕ × Fqˣ) := s.map fun a => (a, 1)

/-- `S_d(s)` for an index. -/
noncomputable def powerSum (d : ℕ) (s : List ℕ) : RatFunc Fq := altPowerSum Fq d (trivialArray Fq s)

/-- `S_{<d}(s)` for an index. -/
noncomputable def powerSumLT (d : ℕ) (s : List ℕ) : RatFunc Fq :=
  iterLT Fq (fun d a => powerSum1 Fq d a.1) d (trivialArray Fq s)

/-- `Si_d(s)` for an index. -/
noncomputable def carlitzPowerSum (d : ℕ) (s : List ℕ) : RatFunc Fq :=
  altCarlitzPowerSum Fq d (trivialArray Fq s)

/-- `Si_{<d}(s)` for an index. -/
noncomputable def carlitzPowerSumLT (d : ℕ) (s : List ℕ) : RatFunc Fq :=
  iterLT Fq (fun d a => carlitzPowerSum1 Fq d a.1) d (trivialArray Fq s)

/-- `D_1 = θ^q - θ`. -/
noncomputable def D1 : RatFunc Fq := algebraMap Fq[X] (RatFunc Fq) (X ^ Fintype.card Fq - X)

theorem powerSum_cons (d a : ℕ) (s : List ℕ) :
    powerSum Fq d (a :: s) = powerSum1 Fq d a * powerSumLT Fq d s := sorry

theorem powerSumLT_eq_sum (d : ℕ) (s : List ℕ) (hs : s ≠ []) :
    powerSumLT Fq d s = ∑ j ∈ Finset.range d, powerSum Fq j s := sorry

theorem powerSumLT_nil (d : ℕ) : powerSumLT Fq d [] = 1 := sorry

theorem powerSum_eq_zero_of_lt (d : ℕ) (s : List ℕ) (h : d + 1 < s.length) :
    powerSum Fq d s = 0 := sorry

theorem powerSum_character (d a : ℕ) (ε : Fqˣ) :
    altPowerSum Fq d [(a, ε)] = algebraMap Fq (RatFunc Fq) ((ε : Fq) ^ d) * powerSum1 Fq d a ∧
      altCarlitzPowerSum Fq d [(a, ε)] =
        algebraMap Fq (RatFunc Fq) ((ε : Fq) ^ d) * carlitzPowerSum1 Fq d a := sorry

/-- Carlitz's identity on Thakur's range (MZ.0/carlitz-identity). -/
theorem altPowerSum_eq_altCarlitzPowerSum (d : ℕ) (s : List (ℕ × Fqˣ))
    (h : ∀ x ∈ s, 1 ≤ x.1 ∧ x.1 ≤ Fintype.card Fq) :
    altPowerSum Fq d s = altCarlitzPowerSum Fq d s := sorry

-- powerSum_test_zero
example (a : ℕ) : powerSum Fq 0 [a] = 1 ∧ carlitzPowerSum Fq 0 [a] = 1 := sorry
-- powerSum_test_tail (the empty truncation is 1 at d = 0)
example (a : ℕ) : powerSum Fq 0 [a] = powerSum1 Fq 0 a * powerSumLT Fq 0 [] := sorry
-- powerSum_test_q2
example (h : Fintype.card Fq = 2) :
    powerSum1 Fq 1 1 = (algebraMap Fq[X] (RatFunc Fq) (X ^ 2 + X))⁻¹ := sorry

/-! ### Thakur's relation R_1, Chen's formula and the next-weight relation (MZ.1–MZ.2) -/

/-- Chen's coefficient `Δ^{[j]}_{a,b}`, an integer to be read in characteristic `p`. -/
def chenCoeff (q a b j : ℕ) : ℤ :=
  if q - 1 ∣ j ∧ 0 < j ∧ j < a + b then
    (-1) ^ (a - 1) * ((j - 1).choose (a - 1) : ℤ) + (-1) ^ (b - 1) * ((j - 1).choose (b - 1) : ℤ)
  else 0

theorem chenCoeff_comm (q a b j : ℕ) : chenCoeff q a b j = chenCoeff q b a j := sorry

theorem chenCoeff_eq_zero_of_add_le (p q a b j : ℕ) [Fact p.Prime] (hq : ∃ e, q = p ^ e)
    (h : a + b ≤ q) (ha : 1 ≤ a) (hb : 1 ≤ b) : (chenCoeff q a b j : ZMod p) = 0 := sorry

theorem chenCoeff_eq_zero_of_not_dvd (q a b j : ℕ) (h : ¬ (q - 1 ∣ j)) : chenCoeff q a b j = 0 := by
  simp [chenCoeff, h]

-- chenCoeff_test_q2
example : chenCoeff 2 1 2 1 = 1 ∧ chenCoeff 2 1 2 2 = 0 := by decide
-- chenCoeff_test_q3
example : (chenCoeff 3 2 2 2 : ZMod 3) = 1 := by decide
-- chenCoeff_test_index (the divisibility condition matters)
example : chenCoeff 3 1 2 1 = 0 := by decide

/-- Chen's equal-degree product formula (MZ.1/chen-product). -/
theorem chen_product (d a b : ℕ) (ha : 1 ≤ a) (hb : 1 ≤ b) :
    powerSum1 Fq d a * powerSum1 Fq d b =
      powerSum1 Fq d (a + b) + ∑ j ∈ Finset.range (a + b),
        ((chenCoeff (Fintype.card Fq) a b j : ℤ) : RatFunc Fq) * powerSum Fq d [a + b - j, j] := sorry

/-- Thakur's fundamental relation `R_1` (MZ.2/fundamental-relation). -/
theorem fundamental_relation (d : ℕ) :
    powerSum Fq d [Fintype.card Fq] + D1 Fq * powerSum Fq (d + 1) [1, Fintype.card Fq - 1] = 0 := sorry

/-- The next-weight relation `S_d(2q-1) + D_1 S_{d+1}(1, 2q-2) = 0` (MZ.2/next-weight-relation). -/
theorem next_weight_relation (d : ℕ) :
    powerSum Fq d [2 * Fintype.card Fq - 1] +
      D1 Fq * powerSum Fq (d + 1) [1, 2 * Fintype.card Fq - 2] = 0 := sorry

end PowerSums

/-! ## MZ.0 — values in `K∞` and weight spans -/

section Values

variable (Fq : Type*) [Field Fq] [Fintype Fq] [DecidableEq Fq] [DecidableEq (RatFunc Fq)]

local notation "K∞" => RatFunc.CompletionAtInfty Fq

/-- Harada's alternating value `ζ_A(ε; s) = Σ_{d ≥ 0} S_d(ε; s)`. -/
noncomputable def AMZV (s : List (ℕ × Fqˣ)) : K∞ :=
  ∑' d : ℕ, ((altPowerSum Fq d s : RatFunc Fq) : K∞)

/-- Thakur's multiple zeta value `ζ_A(s)`. -/
noncomputable def MZV (s : List ℕ) : K∞ := AMZV Fq (trivialArray Fq s)

/-- The alternating Carlitz multiple polylogarithm value `Li(ε; s) = Σ_{d ≥ 0} Si_d(ε; s)`. -/
noncomputable def ACMPL (s : List (ℕ × Fqˣ)) : K∞ :=
  ∑' d : ℕ, ((altCarlitzPowerSum Fq d s : RatFunc Fq) : K∞)

/-- The Carlitz multiple polylogarithm value `Li(s) = Li_s(1, …, 1)`. -/
noncomputable def CMPL (s : List ℕ) : K∞ := ACMPL Fq (trivialArray Fq s)

/-- `Z_w`, the `K`-span of the weight-`w` values `ζ_A(s)`. -/
noncomputable def weightSpan (w : ℕ) : Submodule (RatFunc Fq) K∞ :=
  Submodule.span (RatFunc Fq) (Set.range fun c : Composition w => MZV Fq c.blocks)

/-- `L_w`, the `K`-span of the weight-`w` values `Li(s)`. -/
noncomputable def polylogWeightSpan (w : ℕ) : Submodule (RatFunc Fq) K∞ :=
  Submodule.span (RatFunc Fq) (Set.range fun c : Composition w => CMPL Fq c.blocks)

/-- Arrays of weight `w` with positive entries. -/
def ArraysOfWeight (w : ℕ) : Type _ :=
  {s : List (ℕ × Fqˣ) // (s.map Prod.fst).sum = w ∧ ∀ x ∈ s, 0 < x.1}

/-- Arrays of weight `w` with no entry divisible by `q` (the index set of `AS_w`). -/
def HoffmanArrays (w : ℕ) : Type _ :=
  {s : List (ℕ × Fqˣ) // (s.map Prod.fst).sum = w ∧ ∀ x ∈ s, 0 < x.1 ∧ ¬ Fintype.card Fq ∣ x.1}

/-- `AZ_w`, the `K`-span of the weight-`w` alternating values. -/
noncomputable def altWeightSpan (w : ℕ) : Submodule (RatFunc Fq) K∞ :=
  Submodule.span (RatFunc Fq) (Set.range fun s : ArraysOfWeight Fq w => AMZV Fq s.1)

/-- `AL_w`, the `K`-span of the weight-`w` ACMPL values. -/
noncomputable def altPolylogWeightSpan (w : ℕ) : Submodule (RatFunc Fq) K∞ :=
  Submodule.span (RatFunc Fq) (Set.range fun s : ArraysOfWeight Fq w => ACMPL Fq s.1)

theorem MZV_nil : MZV Fq [] = 1 := sorry

theorem MZV_eq_tsum (s : List ℕ) : MZV Fq s = ∑' d : ℕ, ((powerSum Fq d s : RatFunc Fq) : K∞) := sorry

theorem AMZV_one (s : List ℕ) : AMZV Fq (trivialArray Fq s) = MZV Fq s := rfl

theorem CMPL_nil : CMPL Fq [] = 1 := sorry

/-- Thakur's nonvanishing theorem (MZ.0/mzv-nonvanishing). -/
theorem MZV_ne_zero (s : List ℕ) (hs : s ≠ []) (hpos : ∀ x ∈ s, 0 < x) : MZV Fq s ≠ 0 := sorry

/-- Nonvanishing of ACMPL values (MZ.0/cmpl-nonvanishing). -/
theorem ACMPL_ne_zero (s : List (ℕ × Fqˣ)) (hpos : ∀ x ∈ s, 0 < x.1) : ACMPL Fq s ≠ 0 := sorry

/-- Carlitz's identity for values (MZ.0/carlitz-identity). -/
theorem AMZV_eq_ACMPL (s : List (ℕ × Fqˣ)) (h : ∀ x ∈ s, 1 ≤ x.1 ∧ x.1 ≤ Fintype.card Fq) :
    AMZV Fq s = ACMPL Fq s := sorry

theorem weightSpan_le_alt (w : ℕ) :
    weightSpan Fq w ≤ altWeightSpan Fq w ∧ polylogWeightSpan Fq w ≤ altPolylogWeightSpan Fq w := sorry

theorem weightSpan_finiteDimensional (w : ℕ) : FiniteDimensional (RatFunc Fq) (weightSpan Fq w) := sorry

-- MZV_test_empty
example : MZV Fq [] = 1 := MZV_nil Fq
-- MZV_test_frobenius
example (h : Fintype.card Fq = 2) : MZV Fq [1] * MZV Fq [1] = MZV Fq [2] := sorry
-- CMPL_test_empty
example : CMPL Fq [] = 1 ∧ ACMPL Fq (trivialArray Fq [1, 2]) = CMPL Fq [1, 2] := sorry
-- CMPL_test_not_zeta
example (h : Fintype.card Fq = 3) : CMPL Fq [4] ≠ MZV Fq [4] := sorry
-- weightSpan_test_one
example : Module.finrank (RatFunc Fq) (weightSpan Fq 1) = 1 := sorry
-- weightSpan_test_q2
example (h : Fintype.card Fq = 2) (w : ℕ) : altWeightSpan Fq w = weightSpan Fq w := sorry

/-! ## MZ.1 — the algebra of values -/

/-- Products of values lie in the weight span of the added weight (MZ.1/value-algebras). -/
theorem MZV_mul_mem (a b : List ℕ) (ha : ∀ x ∈ a, 0 < x) (hb : ∀ x ∈ b, 0 < x) :
    MZV Fq a * MZV Fq b ∈ weightSpan Fq (a.sum + b.sum) := sorry

/-! ## MZ.2 — generation theorems -/

/-- Brown's theorem in positive characteristic (Ngo Dac, Theorem A). -/
theorem brown_spanning (w : ℕ) (hw : 1 ≤ w) :
    weightSpan Fq w = Submodule.span (RatFunc Fq)
      (Set.range fun c : thakurIndices (Fintype.card Fq) w => MZV Fq c.1.blocks) := sorry

/-- The bridges `AZ_w = AL_w` and `Z_w = L_w` (MZ.2/value-bridge). -/
theorem value_bridge (w : ℕ) :
    altWeightSpan Fq w = altPolylogWeightSpan Fq w ∧ weightSpan Fq w = polylogWeightSpan Fq w := sorry

/-- The Hoffman-type generating set `{Li(s) : s ∈ IND_w}` (MZ.2/ind-spanning). -/
theorem ind_spanning (w : ℕ) (hw : 1 ≤ w) :
    weightSpan Fq w = Submodule.span (RatFunc Fq)
      (Set.range fun c : hoffmanIndices (Fintype.card Fq) w => CMPL Fq c.1.blocks) := sorry

/-- The strong Brown theorem: `AS_w` spans `AL_w` (MZ.2/strong-brown). -/
theorem strong_brown (w : ℕ) (hw : 1 ≤ w) :
    altPolylogWeightSpan Fq w = Submodule.span (RatFunc Fq)
      (Set.range fun s : HoffmanArrays Fq w => ACMPL Fq s.1) := sorry

/-! ## MZ.5 — independence and dimension theorems -/

/-- Ngo Dac's Theorem B: the small-entry MZVs are independent. -/
theorem small_entry_independence (w : ℕ) (hw : 1 ≤ w) :
    LinearIndependent (RatFunc Fq)
      (fun c : smallIndices (Fintype.card Fq) w => MZV Fq c.1.blocks) := sorry

/-- Ngo Dac's Theorem 6.2: independence of `IND_w` MZVs for `q > 2`, `w ≤ 2q - 2`. -/
theorem q_indivisible_independence (w : ℕ) (hq : 2 < Fintype.card Fq) (hw : 1 ≤ w)
    (hw' : w ≤ 2 * Fintype.card Fq - 2) :
    LinearIndependent (RatFunc Fq)
      (fun c : hoffmanIndices (Fintype.card Fq) w => MZV Fq c.1.blocks) := sorry

/-- Ngo Dac's Theorem D: Thakur's basis through weight `2q - 2`. -/
theorem theorem_d (w : ℕ) (hw : 1 ≤ w) (hw' : w ≤ 2 * Fintype.card Fq - 2) :
    LinearIndependent (RatFunc Fq)
      (fun c : thakurIndices (Fintype.card Fq) w => MZV Fq c.1.blocks) ∧
    Module.finrank (RatFunc Fq) (weightSpan Fq w) = thakurDim (Fintype.card Fq) w := sorry

/-- The CMPL basis indexed by `IND_w` (Chang–Chen–Mishiba, Theorem 5.2.1). -/
theorem cmpl_ind_basis (w : ℕ) (hw : 1 ≤ w) :
    LinearIndependent (RatFunc Fq)
      (fun c : hoffmanIndices (Fintype.card Fq) w => CMPL Fq c.1.blocks) := sorry

/-- Thakur's basis theorem and Todd's dimension formula (MZ.5/thakur-basis-theorem). -/
theorem thakur_basis_theorem (w : ℕ) (hw : 1 ≤ w) :
    LinearIndependent (RatFunc Fq)
      (fun c : thakurIndices (Fintype.card Fq) w => MZV Fq c.1.blocks) ∧
    Module.finrank (RatFunc Fq) (weightSpan Fq w) = thakurDim (Fintype.card Fq) w := sorry

/-- The lower bound through CMPLs (Im–Kim–Le–Ngo Dac–Pham, Proposition 4.10). -/
theorem mzv_lower_bound_cmpl (w : ℕ) (hw : 1 ≤ w) :
    thakurDim (Fintype.card Fq) w ≤ Module.finrank (RatFunc Fq) (weightSpan Fq w) := sorry

/-- The Hoffman-like basis of `AL_w` (Im–Kim–Le–Ngo Dac–Pham, Theorem 3.6). -/
theorem hoffman_basis (w : ℕ) (hw : 1 ≤ w) :
    LinearIndependent (RatFunc Fq) (fun s : HoffmanArrays Fq w => ACMPL Fq s.1) ∧
    Module.finrank (RatFunc Fq) (altPolylogWeightSpan Fq w) = altDim (Fintype.card Fq) w := sorry

/-- The dimension of alternating MZVs (Im–Kim–Le–Ngo Dac–Pham, Theorem A). -/
theorem amzv_dimension (w : ℕ) (hw : 1 ≤ w) :
    Module.finrank (RatFunc Fq) (altWeightSpan Fq w) = altDim (Fintype.card Fq) w := sorry

theorem card_hoffmanArrays (w : ℕ) (hw : 1 ≤ w) :
    Nat.card (HoffmanArrays Fq w) = altDim (Fintype.card Fq) w := sorry

end Values

/-! ## MZ.1 — the harmonic product on the index space -/

section IndexSpace

/-- The harmonic (stuffle) product of two indices, as an integer combination of indices. -/
noncomputable def harmonicList : List ℕ → List ℕ → (List ℕ →₀ ℤ)
  | [], n => Finsupp.single n 1
  | s@(_ :: _), [] => Finsupp.single s 1
  | a :: s, b :: n =>
      (harmonicList s (b :: n)).mapDomain (a :: ·) + (harmonicList (a :: s) n).mapDomain (b :: ·) +
        (harmonicList s n).mapDomain ((a + b) :: ·)
termination_by s n => s.length + n.length

theorem IndexSpace.harmonic_comm (s n : List ℕ) : harmonicList s n = harmonicList n s := sorry

theorem IndexSpace.mul_weight (s n u : List ℕ) (hu : u ∈ (harmonicList s n).support) :
    u.sum = s.sum + n.sum := sorry

theorem IndexSpace.depth_bounds (s n u : List ℕ) (hu : u ∈ (harmonicList s n).support) :
    max s.length n.length ≤ u.length ∧ u.length ≤ s.length + n.length := sorry

-- IndexSpace.test_harmonic
example : harmonicList [1] [1] = Finsupp.single [1, 1] 2 + Finsupp.single [2] 1 := sorry
-- IndexSpace.test_unit
example (s : List ℕ) : harmonicList [] s = Finsupp.single s 1 := by simp [harmonicList]

end IndexSpace

/-! ## MZ.4 — monic Frobenius descent

The reader distinguishes the full localised solution space `X_w` (dimension exactly
one in divisible weights) from polynomial solutions on an arbitrary reduced support
(dimension at most one after taking their span over `F_q(t)`). At the two-row endpoint
`w = 2q - 2`, nonzero solutions with `a_2 = 0` exist; the independence proof excludes
`a_2 ≠ 0`. -/

/-- Monic Frobenius descent (MZ.4/monic-frobenius-descent): a polynomial solution of
`δ^{(1)} = F δ + G` with `F` monic of positive degree over a `q`-power-stable subring `B`
has its coefficients in `B`. -/
theorem monic_frobenius_descent {E : Type*} [Field E] (p e : ℕ) [Fact p.Prime] [CharP E p]
    (B : Subring E) (hB : ∀ x ∈ B, x ^ (p ^ e) ∈ B) (F G : Polynomial B) (hF : F.Monic)
    (hdeg : 0 < F.natDegree) (δ : Polynomial E)
    (h : δ.map (iterateFrobenius E p e) = F.map B.subtype * δ + G.map B.subtype) :
    δ ∈ Set.range (Polynomial.map B.subtype) := sorry

/-!
## Register of README targets not prototyped above

The following packet names are README targets: their carriers (`C_∞`, the Tate algebra `T`,
the entire series ring `E`, the coefficient twist, effective dual t-motives, the index space
with the q-shuffle product, binary relations and the rewriting operator) are planned in
DrinfeldModulesAndTModules or need recursive constructions beyond this file's scope.

MZ.0: FunctionFieldMZV.ZetaArray.character (defined above), FunctionFieldMZV.AMZV_eq_tsum,
FunctionFieldMZV.AMZV_depth_one, FunctionFieldMZV.AMZV_test_trivial, FunctionFieldMZV.AMZV_test_q2,
FunctionFieldMZV.AMZV_test_sign, FunctionFieldMZV.powerSum_norm_le, FunctionFieldMZV.MZV_depth_one,
FunctionFieldMZV.MZV_test_one, FunctionFieldMZV.MZV_test_first_entry, FunctionFieldMZV.powerSum_test_character,
FunctionFieldMZV.carlitzPolylog, FunctionFieldMZV.CMPL_eq_tsum, FunctionFieldMZV.carlitzPolylog_one,
FunctionFieldMZV.carlitzPolylog_roots, FunctionFieldMZV.CMPL_test_log, FunctionFieldMZV.CMPL_test_roots,
FunctionFieldMZV.altWeightSpan (defined above), FunctionFieldMZV.polylogWeightSpan (defined above),
FunctionFieldMZV.weightSpan_zero, FunctionFieldMZV.weightSpan_test_count, FunctionFieldMZV.weightSpan_test_field,
FunctionFieldMZV.smallIndices_subword, FunctionFieldMZV.indexFamilies_test_not_prefix,
FunctionFieldMZV.indexFamilies_test_p, FunctionFieldMZV.indexFamilies_test_small,
FunctionFieldMZV.IsEulerian, FunctionFieldMZV.IsEulerian.dvd, FunctionFieldMZV.IsEulerian.smul,
FunctionFieldMZV.isEulerian_zeta_q_sub_one, FunctionFieldMZV.IsEulerian_test_zeta, FunctionFieldMZV.IsEulerian_test_zero,
FunctionFieldMZV.IsEulerian_test_weight_one, FunctionFieldMZV.IsEulerian_test_q2.

MZ.1: FunctionFieldMZV.IndexSpace, FunctionFieldMZV.IndexSpace.bracket, FunctionFieldMZV.IndexSpace.boxPlus,
FunctionFieldMZV.IndexSpace.harmonic (prototyped as harmonicList), FunctionFieldMZV.IndexSpace.qShuffle,
FunctionFieldMZV.IndexSpace.correction_eq_zero, FunctionFieldMZV.IndexSpace.test_shuffle_q2,
FunctionFieldMZV.IndexSpace.test_boxplus, FunctionFieldMZV.chenCoeff_test_small,
FunctionFieldMZV.realiseFixed, FunctionFieldMZV.realiseLT, FunctionFieldMZV.realise, FunctionFieldMZV.realise_eq_lim,
FunctionFieldMZV.realiseFixed_bracket, FunctionFieldMZV.realise_zeta, FunctionFieldMZV.realise_test_empty,
FunctionFieldMZV.realise_test_agree, FunctionFieldMZV.realise_test_disagree, FunctionFieldMZV.realise_test_depth.

MZ.2: FunctionFieldMZV.BinaryRelation, FunctionFieldMZV.BinaryRelation.IsFixed,
FunctionFieldMZV.BinaryRelation.sum_eq_zero, FunctionFieldMZV.BinaryRelation.module, FunctionFieldMZV.relationSpace,
FunctionFieldMZV.BinaryRelation.test_R1, FunctionFieldMZV.BinaryRelation.test_zero,
FunctionFieldMZV.BinaryRelation.test_all_d, FunctionFieldMZV.BinaryRelation.test_homogeneous,
FunctionFieldMZV.BinaryRelation.bStar, FunctionFieldMZV.BinaryRelation.cOp, FunctionFieldMZV.BinaryRelation.bcOp,
FunctionFieldMZV.BinaryRelation.bStar_fixed, FunctionFieldMZV.BinaryRelation.bStar_small,
FunctionFieldMZV.BinaryRelation.bcOp_support, FunctionFieldMZV.relationSpace_bStar,
FunctionFieldMZV.BinaryRelation.test_bStar_R1, FunctionFieldMZV.BinaryRelation.test_C_empty,
FunctionFieldMZV.BinaryRelation.test_bStar_zero, FunctionFieldMZV.BinaryRelation.test_coeffs,
FunctionFieldMZV.thakurDecomp, FunctionFieldMZV.alphaQ, FunctionFieldMZV.rewrite,
FunctionFieldMZV.rewrite_of_mem_thakur, FunctionFieldMZV.rewrite_weight, FunctionFieldMZV.rewrite_components,
FunctionFieldMZV.rewrite_test_decomp, FunctionFieldMZV.rewrite_test_fixed, FunctionFieldMZV.rewrite_test_q,
FunctionFieldMZV.rewrite_test_not_init.

MZ.3: FunctionFieldMZV.carlitzFactorial, FunctionFieldMZV.andersonThakurPoly,
FunctionFieldMZV.andersonThakurPoly_degree_le, FunctionFieldMZV.andersonThakurPoly_of_le,
FunctionFieldMZV.andersonThakurPoly_q_add, FunctionFieldMZV.carlitzFactorial_of_le,
FunctionFieldMZV.andersonThakurPoly_test_small, FunctionFieldMZV.andersonThakurPoly_test_q3,
FunctionFieldMZV.carlitzFactorial_test, FunctionFieldMZV.andersonThakurPoly_test_shift,
FunctionFieldMZV.deformedEll, FunctionFieldMZV.changSeries, FunctionFieldMZV.changSeries_eq, FunctionFieldMZV.changSeries_nil,
FunctionFieldMZV.omega_twist_eq, FunctionFieldMZV.changSeries_twist, FunctionFieldMZV.changSeries_sub, FunctionFieldMZV.changSeries_test_depth_one,
FunctionFieldMZV.changSeries_test_empty, FunctionFieldMZV.changSeries_test_bound, FunctionFieldMZV.deformedEll_test,
FunctionFieldMZV.indexFrobeniusMatrix, FunctionFieldMZV.indexPeriodMatrix, FunctionFieldMZV.indexPeriodMatrix_twist,
FunctionFieldMZV.indexFrobeniusMatrix_det, FunctionFieldMZV.indexDualMotive, FunctionFieldMZV.indexDualMotive_rigid,
FunctionFieldMZV.indexPeriodMatrix_test_depth_one, FunctionFieldMZV.indexFrobeniusMatrix_test_det,
FunctionFieldMZV.indexDualMotive_test_empty, FunctionFieldMZV.indexDualMotive_test_not_free_sigma,
FunctionFieldMZV.HasMZProperty, FunctionFieldMZV.HasMZProperty.mul, FunctionFieldMZV.HasMZProperty.smul,
FunctionFieldMZV.HasMZProperty.ne_zero, FunctionFieldMZV.HasMZProperty_test_li, FunctionFieldMZV.HasMZProperty_test_power,
FunctionFieldMZV.HasMZProperty_test_zero, FunctionFieldMZV.HasMZProperty_test_scalar,
FunctionFieldMZV.prefixSet, FunctionFieldMZV.prefixFrobeniusMatrix, FunctionFieldMZV.prefixPeriodMatrix,
FunctionFieldMZV.prefixPeriodMatrix_twist, FunctionFieldMZV.prefixFrobeniusMatrix_det, FunctionFieldMZV.prefixVector,
FunctionFieldMZV.prefixVector_eval, FunctionFieldMZV.prefixSet_test, FunctionFieldMZV.prefixSet_test_single,
FunctionFieldMZV.prefixSet_test_shared, FunctionFieldMZV.prefixVector_test_not_square.

MZ.4: FunctionFieldMZV.denomRing, FunctionFieldMZV.initialSegments, FunctionFieldMZV.frobeniusSystem,
FunctionFieldMZV.eulerianIndices, FunctionFieldMZV.solutionSpace, FunctionFieldMZV.frobeniusSystem_leaf,
FunctionFieldMZV.frobeniusSystem_test_zero, FunctionFieldMZV.frobeniusSystem_test_q,
FunctionFieldMZV.frobeniusSystem_test_2q, FunctionFieldMZV.frobeniusSystem_test_not_ind.

The theorems of MZ.3–MZ.5 that involve `π̃`, `Ω`, `T`, `E` or dual t-motives (Carlitz's evaluation
of `ζ_A(q - 1)`, the interpolation formula, entireness and specialisation of Chang's series, the
MZ property, Chang's descent, the independence criterion, the key lemma, `dim X_w`, the twisted
and two-row systems, the relations theorem for ACMPL periods, all linear relations, the
character splitting and the v-adic bound) are stated in the README only.
-/

end FunctionFieldMZV
