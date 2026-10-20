import Mathlib

/-!
# NoncommutativeAndEquivariantIwasawa: representative target signatures

The roadmap is `README.md`. This file records light definitions, theorem signatures and computed
checks statable against the pinned Mathlib and Tau Ceti APIs; it is not exhaustive. References of
the form §NE.k.n name README subsections. The design choices are:

* Tau Ceti provides the completed group algebra `Λ(G) = ℤ_p[[G]]`. Its noncommutative
  localization, relative K-theory, determinant functors and the arithmetic complexes needed here
  lack the required pinned APIs, so their statements remain README targets. The canonical set is
  defined for an arbitrary ring `A` that is a module over a ring `B` compatibly with left
  multiplication (§NE.1.1); for `A = Λ(G)` and `B = Λ(H)` it is the set of Coates–Fukaya–Kato–
  Sujatha–Venjakob. Its one-variable case is stated on `PowerSeries ℤ_[p] ≅ Λ(ℤ_p)`.
* The carry cocycle of the twisted group ring presentation (§NE.6.7) is recorded through its
  integer exponent: representatives `0 ≤ a < q` of `Γ/Γ^q` multiply with carry `γ^(q · carry)`.
* `Γ*(j)` (§NE.7.15) is `Γ(j)` for `j > 0` and the residue of `Γ` at `j` for `j ≤ 0`.
-/

namespace TauCetiRoadmap.NoncommutativeAndEquivariantIwasawa

/- Layer NE.0: Uniform groups and Iwasawa homological foundations -/

section Augmentation

variable (p : ℕ) [Fact p.Prime] {Δ : Type*} [Group Δ]

/-- The base step of the induction showing that the augmentation ideal of `𝔽_p[Δ]` is nilpotent
for a finite `p`-group `Δ` (§§NE.0.4, NE.1.8): for `z` with `z ^ p = 1`, `(z - 1) ^ p = 0` in
`𝔽_p[Δ]`. Over `ℤ_p` the same element is not nilpotent. -/
theorem of_sub_one_pow_char (z : Δ) (hz : z ^ p = 1) :
    (MonoidAlgebra.of (ZMod p) Δ z - 1) ^ p = 0 := by
  have : CharP (MonoidAlgebra (ZMod p) Δ) p :=
    charP_of_injective_algebraMap (algebraMap (ZMod p) (MonoidAlgebra (ZMod p) Δ)).injective p
  rw [sub_pow_char_of_commute p (Commute.one_right _), ← map_pow, hz, map_one, one_pow, sub_self]

end Augmentation

/- Layer NE.1: Canonical Ore localization and torsion categories -/

section Canonical

universe u v

variable (A : Type u) (B : Type v) [Ring A] [Ring B] [Module B A] [IsScalarTower B A A]

/-- The canonical set (§NE.1.1): the elements `f` with `A ⧸ A f` finitely generated over `B`.
For `A = Λ(G)` and `B = Λ(H)` this is the canonical Ore set `S` of CFKSV. -/
def canonicalSet : Set A :=
  {f | Module.Finite B (A ⧸ Submodule.span A ({f} : Set A))}

/-- The `π`-saturation `S* = ⋃ₙ πⁿ S` of the canonical set (§NE.1.10), for a central element
`π` (in the Iwasawa case `π = p`). -/
def saturatedSet (π : A) : Set A :=
  {f | ∃ n : ℕ, ∃ s ∈ canonicalSet A B, f = π ^ n * s}

/-- `1` lies in the canonical set: `A ⧸ A·1` is zero. -/
theorem one_mem_canonicalSet : (1 : A) ∈ canonicalSet A B := by
  show Module.Finite B (A ⧸ Submodule.span A ({1} : Set A))
  rw [show Submodule.span A ({1} : Set A) = ⊤ from Ideal.span_singleton_one]
  infer_instance

/-- The canonical set is closed under multiplication (§NE.1.7, first step): `A s t ⊆ A t`, and
`A t ⧸ A s t` is a quotient of `A ⧸ A s`, so `A ⧸ A s t` is an extension of finitely generated
`B`-modules. No noetherian or group hypothesis is needed for this step. -/
theorem mul_mem_canonicalSet {s t : A} (hs : s ∈ canonicalSet A B) (ht : t ∈ canonicalSet A B) :
    s * t ∈ canonicalSet A B := by
  sorry

/-- The degenerate case `B = A`: every element, including `0`, lies in the canonical set; the
statement that `S` consists of nonzero divisors needs the group hypotheses of §NE.1.7. -/
example : (0 : A) ∈ canonicalSet A A := by
  show Module.Finite A (A ⧸ Submodule.span A ({0} : Set A))
  infer_instance

/-- In `ℤ_p[[T]]` the element `p` lies in the saturation `S*`, as `p ^ 1 * 1`; by
`mem_canonicalSet_powerSeries_iff` it does not lie in `S`, so `S* ≠ S` (§NE.1.10). -/
example (p : ℕ) [Fact p.Prime] :
    PowerSeries.C (p : ℤ_[p]) ∈
      saturatedSet (PowerSeries ℤ_[p]) ℤ_[p] (PowerSeries.C (p : ℤ_[p])) := by
  refine ⟨1, 1, ?_, by simp⟩
  show Module.Finite ℤ_[p] (PowerSeries ℤ_[p] ⧸ Submodule.span (PowerSeries ℤ_[p]) ({1} : Set _))
  have h : Submodule.span (PowerSeries ℤ_[p]) ({1} : Set (PowerSeries ℤ_[p])) = ⊤ :=
    Ideal.span_singleton_one
  rw [h]
  infer_instance

/-- The canonical set in the one-variable case `Λ(ℤ_p) ≅ ℤ_p[[T]]`, `H = 1` (§NE.1.1, Worked
examples, example 1): `ℤ_p[[T]] ⧸ (f)` is finitely generated over `ℤ_p` exactly when `p` does not
divide `f`. In particular `T ∈ S` and `p ∉ S`, and `S` is not the set of nonzero elements. -/
theorem mem_canonicalSet_powerSeries_iff (p : ℕ) [Fact p.Prime] (f : PowerSeries ℤ_[p]) :
    f ∈ canonicalSet (PowerSeries ℤ_[p]) ℤ_[p] ↔ ¬ (PowerSeries.C (p : ℤ_[p])) ∣ f := by
  sorry

end Canonical

/- Layer NE.6: The main theorems for totally real fields -/

section UniformSmoothing

/-- Every finite intersection of the nested ideals `p ^ n * ℤ_p` contains a nonzero element
(§NE.6.25). This does not give a nonzero element of their infinite intersection. -/
example (p : ℕ) [Fact p.Prime] (n : ℕ) :
    (p : ℤ_[p]) ^ n ≠ 0 ∧
      ∀ m ≤ n, (p : ℤ_[p]) ^ n ∈ (Ideal.span {(p : ℤ_[p]) ^ m} : Ideal ℤ_[p]) := by
  constructor
  · exact pow_ne_zero n (by exact_mod_cast (Fact.out : p.Prime).ne_zero)
  · intro m hmn
    rw [Ideal.mem_span_singleton]
    exact pow_dvd_pow _ hmn

/-- The infinite intersection in the preceding example is zero (§NE.6.25). Thus compactness
cannot preserve the required nontrivial cyclotomic image when solving each conductor separately. -/
example (p : ℕ) [Fact p.Prime] (x : ℤ_[p])
    (h : ∀ n : ℕ, x ∈ (Ideal.span {(p : ℤ_[p]) ^ n} : Ideal ℤ_[p])) : x = 0 := by
  by_contra hx
  have hh := (PadicInt.mem_span_pow_iff_le_valuation x hx (x.valuation + 1)).mp (h _)
  omega

end UniformSmoothing

section Carry

/-- The carry exponent of the twisted group ring presentation (§NE.6.7): for representatives
`a, b` of `Γ/Γ^q` taken in `[0, q)`, the product of the representatives of `a` and `b` is the
representative of `a + b` times `γ ^ (q * carryExponent q a b)`. -/
def carryExponent (q a b : ℕ) : ℕ :=
  (a % q + b % q) / q

/-- The carry is a normalized symmetric 2-cocycle on `ℤ/q` with values in `ℕ` (§NE.6.7). -/
theorem carryExponent_cocycle (q a b c : ℕ) (hq : 0 < q) :
    carryExponent q a b + carryExponent q (a + b) c =
      carryExponent q b c + carryExponent q a (b + c) := by
  sorry

/-- The inverse pair carries once: `τ(γ̄, γ̄⁻¹) = γ^q ≠ 1` for `q = 9` (Worked examples,
example 4); a basis inverse needs this central factor. -/
example : carryExponent 9 1 8 = 1 := by decide

/-- Normalization at the identity: the representative `0` never carries. -/
example : carryExponent 9 0 8 = 0 := by decide

end Carry

/- Layer NE.7: Descent, leading terms and Fitting invariants -/

section GammaStar

/-- `Γ*(j)` (§NE.7.15): `(j - 1)!` for `j > 0` and the residue `(-1)^(-j) / (-j)!` of the Gamma
function at `j ≤ 0`. -/
def gammaStar (j : ℤ) : ℚ :=
  if 0 < j then ((j - 1).toNat.factorial : ℚ)
  else (-1 : ℚ) ^ (-j).toNat / ((-j).toNat.factorial : ℚ)

/-- For positive `j`, `Γ*(j)` is the value of the Gamma function. -/
theorem gammaStar_eq_Gamma (j : ℕ) (hj : 0 < j) :
    ((gammaStar j : ℚ) : ℂ) = Complex.Gamma j := by
  sorry

/-- For `j ≤ 0`, `Γ*(j)` is the residue of the Gamma function at `j` (§NE.7.15). -/
theorem gammaStar_eq_residue (n : ℕ) :
    Filter.Tendsto (fun s : ℂ => (s + n) * Complex.Gamma s) (nhdsWithin (-(n : ℂ)) {-(n : ℂ)}ᶜ)
      (nhds ((gammaStar (-(n : ℤ)) : ℚ) : ℂ)) := by
  sorry

example : gammaStar 3 = 2 := by norm_num [gammaStar, Int.toNat, Nat.factorial]

/-- At `j = -1` the residue is `-1`: this detects loss of the alternating residue sign. -/
example : gammaStar (-1) = -1 := by norm_num [gammaStar, Int.toNat, Nat.factorial]

end GammaStar

/-
The following definitions and constructions remain in the README, with their APIs and checks,
because their required carriers or comparisons are absent from the pinned APIs:

Layer NE.0: the compact analytic group model (0.2), ordered coordinates (0.7), their explicit p-valuation (0.8),
integral and rational ordered series (0.9), diagonal twists (0.15), and compact/rational group homology (0.16).
Layer NE.1: the finite-level algebra V (1.3), canonical Ore localization (1.11), the category
𝔐_H(G) (1.13), and localization-acyclic perfect complexes (1.14). The canonical and saturated
sets (1.1, 1.10) have real-bodied ring-level definitions above.
Layer NE.2: localized K₁ (2.7), relative perfect-complex classes (2.8), the boundary (2.10),
and characteristic elements (2.12).
Layer NE.3: the twist homomorphism (3.1), Artin evaluation (3.3), Akashi series (3.4), the
integrality-conjecture proposition (3.10), SK₁ and K′₁ (3.11), and the total quotient (3.12).
Layer NE.4: the dual Selmer module (4.1), the torsion-conjecture propositions (4.2), admissibility,
μ=0 and weak-Leopoldt overfield vanishing (4.4), the dual Galois complex (4.5), and compact-support
complexes (4.6).
Layer NE.5: the GL₂ L-function and main-conjecture propositions (5.1, 5.2), the totally real
main-conjecture proposition (5.5), and normalized interpolation contracts (5.6).
Layer NE.6: twisted group rings (6.7; their carry exponent is defined above), congruence groups
(6.8), additive trace maps and ψ (6.9), relative and integral logarithms (6.11, 6.12), partial
zeta and smoothed values (6.19), and the Ritter–Weiss logarithmic pseudomeasure (6.27).
Layer NE.7: the Bockstein (7.1), semisimplicity and order (7.2), its trivialization (7.3), leading
terms (7.4), the global zeta proposition and fundamental line (7.9), the p-adic Stark proposition
(7.11), local epsilon maps and their conjecture (7.15; gammaStar is defined above), the
Dabrowski–Panchishkin condition and Selmer complexes (7.16), Fitting orders (7.19), integrality
rings and denominator ideals (7.20), and maximal Fitting invariants (7.21).

The homological, localization, arithmetic and main-theorem milestones on these objects likewise
remain README targets. No substitute carrier is introduced for them here.
-/

end TauCetiRoadmap.NoncommutativeAndEquivariantIwasawa
