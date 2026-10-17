import Mathlib
import TauCeti.NumberTheory.NumberField.Global.Approximation.Weak
import TauCeti.LinearAlgebra.Matrix.GeneralLinearGroup.UpperTriangular.Solvable

/-!
# GL₂ modularity lifting: representative target signatures

The mathematical roadmap is `README.md`. This file records the light definitions and the
statements that can already be made against the pinned Mathlib and Tau Ceti APIs. It is not an
exhaustive list of the targets of any layer: the Hecke algebras of definite quaternionic forms,
the deformation rings, the patched modules and every lifting theorem need carriers (Galois
representations of number fields with their local conditions, Hilbert modular forms, local
deformation rings) that the pinned libraries do not contain, so they are README targets only.

Design choices.
* The patching radius of Layer 3 is the natural-number expression `s · m · p ^ (m · (h + j))`
  of Kisin's patching datum; the cutoff ideals themselves belong to the patching algebra.
* Oddness is a condition on the characteristic-zero determinant. Over a domain `R` with a ring
  map to a field `k` of characteristic different from two it can be read on the reduction
  (`odd_det_of_odd_reduction`); in characteristic two it cannot, and the examples of Layer 6 pin
  this.
* `pStar p` is the integer `(-1) ^ ((p - 1) / 2) * p`; for an odd prime it is `1` modulo `4`, and
  `ℚ(√p*)` is then the quadratic subfield of `ℚ(ζ_p)`.
* Hodge–Tate weights are normalised by `HT(ε) = 1`; distinct weights `a < b` normalise to
  `{0, k − 1}` with `k = b − a + 1` (`normalizedWeight`).
* Pan's good components (Layer 10) are stated on concrete data: a family of subsets of a point
  space, the potentially nice points and the seed points. Pan's extension components are the
  minimal primes of the source of a ring map that lie in the image of the target spectrum, for
  the whole target spectrum.
-/

namespace TauCetiRoadmap.GL2ModularityLifting

set_option autoImplicit false

/-! ## Layer 1: Minimal deformation-to-Hecke maps

The minimal-level data, the deformation-to-Hecke map and the framed objects need the definite
quaternionic Hecke algebras and the global deformation rings; they are README targets. The
square classes prescribed in the allowable base changes of §1.8 use weak approximation. -/

#check @TauCeti.GlobalNumberFields.weakApproximation_denseRange

/-! ## Layer 3: Arithmetic patching -/

/-- The patching radius `r_m = s · m · p ^ (m · (h + j))` of the level-`m` patching datum
(§3.1; Kisin's patching datum, with `s` the rank of the patched module and `h + j` the number of
patching variables). -/
def patchingRadius (s m p hj : ℕ) : ℕ := s * m * p ^ (m * hj)

/-- The radius grows with the level: the transition from level `m + 1` to level `m` is a
reduction, so the level-`m + 1` radius dominates. -/
theorem patchingRadius_mono_level (s p hj : ℕ) (hp : 1 ≤ p) (m : ℕ) :
    patchingRadius s m p hj ≤ patchingRadius s (m + 1) p hj := by
  sorry

/-- The worked value of §3.1: `s = 1`, `p = 3`, `m = 2`, `h + j = 1` give `r_m = 18`. -/
example : patchingRadius 1 2 3 1 = 18 := by decide

/-- With no patching variables the radius is `s · m`, not `0` or `s`. -/
example : patchingRadius 2 3 5 0 = 6 := by decide

/-- The rank enters linearly: doubling `s` doubles the radius. -/
example : patchingRadius 2 2 3 1 = 2 * patchingRadius 1 2 3 1 := by decide

/-! ## Layer 6: Dyadic lifting and Hypothesis (H)

In characteristic two the residual determinant cannot detect oddness: both `1` and
`diag(1, −1)` reduce to the identity, and the even lift `−1` reduces to it as well. -/

/-- `diag(1, −1)` is odd in characteristic zero. -/
example : Matrix.det !![(1 : ℤ), 0; 0, -1] = -1 := by
  simp [Matrix.det_fin_two]

/-- The same matrix reduces to a determinant-one matrix modulo two. -/
example : Matrix.det !![(1 : ZMod 2), 0; 0, -1] = 1 := by
  simp [Matrix.det_fin_two]

/-- The even lift `−1` has determinant `1` but the same reduction as an odd lift. -/
example : Matrix.det (-1 : Matrix (Fin 2) (Fin 2) ℤ) = 1 := by
  simp [Matrix.det_fin_two]

/-! ## Layer 7: Statement table and normalisations over ℚ -/

/-- The signed prime `p* = (−1)^((p − 1)/2) · p` (§7.1). -/
def pStar (p : ℕ) : ℤ := (-1) ^ ((p - 1) / 2) * (p : ℤ)

/-- The sign does not change the absolute value. -/
theorem pStar_natAbs (p : ℕ) : (pStar p).natAbs = p := by
  sorry

/-- For an odd prime, `p* ≡ 1 (mod 4)`: this is why `ℚ(√p*)` is unramified at `2` and is the
quadratic subfield of `ℚ(ζ_p)`. -/
theorem pStar_emod_four {p : ℕ} (hp : p.Prime) (hp2 : p ≠ 2) : pStar p % 4 = 1 := by
  sorry

example : pStar 3 = -3 := by norm_num [pStar]
example : pStar 5 = 5 := by norm_num [pStar]
example : pStar 7 = -7 := by norm_num [pStar]
/-- The expression is total; the statements about `ℚ(√p*)` assume an odd prime, and at `2` the
congruence modulo `4` fails. -/
example : pStar 2 = 2 ∧ pStar 2 % 4 ≠ 1 := by norm_num [pStar]

/-- The normalised weight `k = b − a + 1` of a representation with Hodge–Tate weights `a < b`
(§7.7): twisting by `ε^{−a}` moves the weights to `{0, k − 1}`. -/
def normalizedWeight (a b : ℤ) : ℤ := b - a + 1

/-- Twisting by a power of the cyclotomic character shifts both weights and leaves `k` fixed. -/
theorem normalizedWeight_shift (a b n : ℤ) :
    normalizedWeight (a + n) (b + n) = normalizedWeight a b := by
  sorry

/-- Distinct weights give `k ≥ 2`. -/
theorem two_le_normalizedWeight {a b : ℤ} (h : a < b) : 2 ≤ normalizedWeight a b := by
  sorry

example : normalizedWeight 3 7 = 5 := by norm_num [normalizedWeight]
example : normalizedWeight 0 1 = 2 := by norm_num [normalizedWeight]
/-- Equal weights (a weight-one form) give `k = 1`, outside the lifting theorems. -/
example : normalizedWeight 4 4 = 1 := by norm_num [normalizedWeight]

/-- The oddness bridge of §7.11: over a domain, an involution whose reduction to a field of
characteristic different from two has determinant `−1` has determinant `−1`. -/
theorem odd_det_of_odd_reduction {R k : Type*} [CommRing R] [IsDomain R] [Field k]
    (φ : R →+* k) (c : Matrix (Fin 2) (Fin 2) R) (hc : c * c = 1)
    (hres : (c.map φ).det = -1) (h2 : (2 : k) ≠ 0) : c.det = -1 := by
  sorry

/-- At odd residue characteristic the two signs stay distinct. -/
example : (-1 : ZMod 3) ≠ 1 := by decide

/-- Rank-two twisting by a scalar `a` multiplies the determinant by `a ^ 2`. -/
example {R : Type*} [CommRing R] (a : R) (M : Matrix (Fin 2) (Fin 2) R) :
    (a • M).det = a ^ 2 * M.det := by
  rw [Matrix.det_smul, Fintype.card_fin]

/-! Nonsolvable residual image is used through solvability of the Borel subgroup of `GL₂`. -/

#check @TauCeti.UpperTriangularGroup.instIsSolvable

/-! ## Layer 10: Pan's residually reducible theorem -/

section GoodComponents

variable {I X : Type*}

/-- Pan's good components (Definition 7.4.1): component `i` is good when a finite chain of
components, each sharing a potentially nice point with the next, joins `i` to a component
containing a potentially nice seed point. `components` lists the irreducible components as
subsets of the point space, `nice` the potentially nice points and `seed` the closure of the
ordinary arithmetic points (§10.3). -/
def panGoodComponent (components : I → Set X) (nice seed : Set X) (i : I) : Prop :=
  ∃ j : I, (∃ x ∈ nice, x ∈ seed ∧ x ∈ components j) ∧
    Relation.ReflTransGen
      (fun a b : I => ∃ x ∈ nice, x ∈ components a ∧ x ∈ components b) j i

/-- A component containing a potentially nice seed point is good. -/
theorem panGoodComponent_seed (components : I → Set X) (nice seed : Set X) (i : I) (x : X)
    (hn : x ∈ nice) (hs : x ∈ seed) (hc : x ∈ components i) :
    panGoodComponent components nice seed i := by
  sorry

/-- Goodness passes along a shared potentially nice point. -/
theorem panGoodComponent_step (components : I → Set X) (nice seed : Set X) {i j : I}
    (hi : panGoodComponent components nice seed i) (x : X) (hn : x ∈ nice)
    (hxi : x ∈ components i) (hxj : x ∈ components j) :
    panGoodComponent components nice seed j := by
  sorry

/-- Enlarging the potentially nice points or the seed preserves goodness. -/
theorem panGoodComponent_mono (components : I → Set X) {nice nice' seed seed' : Set X}
    (hn : nice ⊆ nice') (hs : seed ⊆ seed') {i : I}
    (hi : panGoodComponent components nice seed i) :
    panGoodComponent components nice' seed' i := by
  sorry

/-- With no seed points no component is good. -/
example (components : I → Set X) (nice : Set X) (i : I) :
    ¬ panGoodComponent components nice ∅ i := by
  rintro ⟨j, ⟨x, -, hx, -⟩, -⟩
  exact hx

/-- The intermediate component of a two-edge chain is required: components `{0}`, `{0, 1}`,
`{1, 2}` with nice points `{0, 1}` and seed `{0}` are all good. -/
example : ∀ i : Fin 3,
    panGoodComponent
      (fun j : Fin 3 => if j = 0 then ({0} : Set ℕ) else if j = 1 then {0, 1} else {1, 2})
      {0, 1} {0} i := by
  sorry

/-- A shared point that is not potentially nice does not propagate goodness: `{0, 1}` and
`{1, 2}` meet only in `1`, which is not nice, so the second component is not good. -/
example :
    panGoodComponent (fun b : Bool => if b then ({1, 2} : Set ℕ) else {0, 1}) {0} {0} false ∧
      ¬ panGoodComponent (fun b : Bool => if b then ({1, 2} : Set ℕ) else {0, 1}) {0} {0}
        true := by
  sorry

end GoodComponents

section ExtensionComponents

variable {A B : Type*} [CommRing A] [CommRing B]

/-- Pan's extension components (Definition 7.4.21): the minimal primes of `A` in the image of
`Spec B → Spec A`, for the whole of `Spec B`. In the application `f` is the trace map from the
pseudodeformation ring to the deformation ring of a nonsplit extension (§10.4). -/
def panExtensionComponents (f : A →+* B) : Set (PrimeSpectrum A) :=
  {P | P.asIdeal ∈ minimalPrimes A ∧ P ∈ Set.range (PrimeSpectrum.comap f)}

/-- An extension component contains the kernel of the map. -/
theorem panExtensionComponents_kernel_le (f : A →+* B) {P : PrimeSpectrum A}
    (hP : P ∈ panExtensionComponents f) : RingHom.ker f ≤ P.asIdeal := by
  sorry

/-- Along the identity every minimal prime is an extension component. -/
theorem panExtensionComponents_id :
    panExtensionComponents (RingHom.id A) = {P : PrimeSpectrum A | P.asIdeal ∈ minimalPrimes A} := by
  sorry

/-- Composing with a further map can only shrink the set. -/
theorem panExtensionComponents_comp_subset {C : Type*} [CommRing C] (f : A →+* B) (g : B →+* C) :
    panExtensionComponents (g.comp f) ⊆ panExtensionComponents f := by
  sorry

/-- A zero target detects no component. -/
example [Subsingleton B] (f : A →+* B) : panExtensionComponents f = ∅ := by
  sorry

/-- A minimal prime not containing the kernel is not detected. -/
example (f : A →+* B) (P : PrimeSpectrum A) (hker : ¬ RingHom.ker f ≤ P.asIdeal) :
    P ∉ panExtensionComponents f :=
  fun hP => hker (panExtensionComponents_kernel_le f hP)

end ExtensionComponents

/-!
## Targets stated in the README only

Layers 1–6: minimal-level data, the deformation-to-Hecke map and its surjectivity, the framed
Hecke algebra and module, auxiliary Taylor–Wiles levels and their freeness, the arithmetic
patching data and the patched ring and module, the support and avoidance theorems, integral and
generic-fibre R = T, the Khare–Wintenberger lifting theorems at odd primes and at 2, Kisin's
potentially Barsotti–Tate theorems, the Fontaine–Laffaille, BCDT and crystalline lifting
theorems, Khare–Wintenberger I Theorem 4.1 and Hypothesis (H). Layers 7–12: the four lifting
propositions, the classification of geometric twists, Kisin's multiplicity criterion and the
de Rham lifting theorems at odd primes and at 2, Pan's nice and potentially nice primes and his
residually reducible theorem, the ordinary 3-adic completion, and the transfer statements along
congruences.
-/

end TauCetiRoadmap.GL2ModularityLifting
