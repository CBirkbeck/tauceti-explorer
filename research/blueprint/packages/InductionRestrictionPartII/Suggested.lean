import Mathlib
import TauCeti.Algebra.Group.ElementaryTwoQuotient.Basic

/-!
# Fixed fibers, parity obstructions and finite reduced-multiplier calculations: representative target signatures

`README.md` is definitive. These signatures are representative and do not exhaust any layer.
This file states the targets that can be expressed using the pinned libraries and gives light
definitions over their native carriers. The supplied reduced covers,
marked extensions and unit actions are prerequisites from InverseGaloisAndArithmeticFundamentalGroups
IG.3.4–IG.3.5; they are not redeclared here. Targets requiring those missing carriers are listed
at the end and stated fully in the README.

`Multiplier G` abbreviates integral `H₂(G, ℤ)`, written additively. Commutators use
`XYX⁻¹Y⁻¹`. Degree coordinates are integers. Finite parity calculations use Tau Ceti's existing
elementary-2 quotient. The marked finite models use the native swap semidirect product.
-/

noncomputable section

open CategoryTheory
open scoped commutatorElement TensorProduct

namespace TauCetiRoadmap.InductionRestrictionPartII

/-! ## Layer RS.0: exactness and Hall-coinvariant homology comparisons -/

section RS0

/-- Native integral second group homology, used as an abbreviation throughout the README. -/
abbrev Multiplier (G : Type) [Group G] : Type :=
  groupHomology.H2 (Rep.trivial ℤ G ℤ)

variable {A E G : Type} [Group A] [Group E] [Group G]

/-- **The tail of the five-term sequence** (RS.0.1): for any extension, `Eᵃᵇ → Gᵃᵇ` is onto. -/
theorem abelianization_map_surjective (S : GroupExtension A E G) :
    Function.Surjective (Abelianization.map S.rightHom) := by
  sorry

/-- **Exactness at `Eᵃᵇ`** (RS.0.1): the kernel of `Eᵃᵇ → Gᵃᵇ` is the image of the kernel. -/
theorem abelianization_exact_of_extension (S : GroupExtension A E G) :
    (Abelianization.map S.rightHom).ker = (Abelianization.of.comp S.inl).range := by
  sorry

/-- **Derived-kernel extensions preserve abelianization** (RS.0.1): `Eᵃᵇ → Gᵃᵇ` is bijective.
Centrality is unnecessary for this tail consequence; stem central extensions are a specialization. -/
theorem abelianization_map_bijective_of_stem (S : GroupExtension A E G)
    (hstem : S.inl.range ≤ commutator E) :
    Function.Bijective (Abelianization.map S.rightHom) := by
  sorry

/-- `extensionFiveTerm_test_4`: centrality is not needed for the tail; for `S₃ → C₂` the kernel
`A₃` dies in the abelianization. -/
theorem extensionFiveTerm_test_4 : (Abelianization.of.comp (alternatingGroup (Fin 3)).subtype).range = ⊥ := by
  sorry

/-- **Positive-degree integral homology of a finite group is killed by its order** (RS.0.2). -/
theorem integralHomology_card_smul (G : Type) [Group G] [Finite G] (n : ℕ)
    (z : groupHomology (Rep.trivial ℤ G ℤ) (n + 1)) : Nat.card G • z = 0 := by
  sorry

/-- **Positive-degree integral homology of a finite group is finite** (RS.0.2). -/
theorem integralHomology_finite (G : Type) [Group G] [Finite G] (n : ℕ) :
    Finite (groupHomology (Rep.trivial ℤ G ℤ) (n + 1)) := by
  sorry

/-- `integralHomology_test_3`: degree zero is excluded; `H₀(C₂, ℤ) ≅ ℤ` is infinite. -/
theorem integralHomology_test_3 : Infinite (groupHomology (Rep.trivial ℤ (Multiplicative (ZMod 2)) ℤ) 0) := by
  sorry

end RS0

/-! ## Layer RS.1: power laws and local normalization -/

section RS1

/-- **Commuting-pair power law**, at the chain level (RS.1.1). This states the new theorem
without redeclaring IG's oriented homological commutator. -/
theorem commutator_order_boundary {G : Type} [Group G] {x y : G} (h : Commute x y) (n : ℕ) :
    n • (Finsupp.single (x, y) (1 : ℤ) - Finsupp.single (y, x) 1) -
      (Finsupp.single (x ^ n, y) 1 - Finsupp.single (y, x ^ n) 1) ∈
        groupHomology.boundaries₂ (Rep.trivial ℤ G ℤ) := by
  sorry

/-- **Integer powers in commuting-pair classes** (RS.1.1). Negative powers give negatives
of the oriented class; no finiteness or order hypothesis is needed. -/
theorem commutator_zpow_boundary {G : Type} [Group G] {x y : G} (h : Commute x y) (n : ℤ) :
    n • (Finsupp.single (x, y) (1 : ℤ) - Finsupp.single (y, x) 1) -
      (Finsupp.single (x ^ n, y) 1 - Finsupp.single (y, x ^ n) 1) ∈
        groupHomology.boundaries₂ (Rep.trivial ℤ G ℤ) := by
  sorry

/-- **Local normalized factors commute** (RS.1.3): in any central extension, two elements
above `1` or one fixed `c₀` commute. -/
theorem local_factors_commute {A E G : Type} [Group A] [Group E] [Group G]
    (S : GroupExtension A E G) (hcentral : S.inl.range ≤ Subgroup.center E)
    (c₀ : G) (X Y : E) (hX : S.rightHom X = 1 ∨ S.rightHom X = c₀)
    (hY : S.rightHom Y = 1 ∨ S.rightHom Y = c₀) : Commute X Y := by
  sorry

end RS1

/-! ## Layer RS.3: degree restrictions -/

section RS3

/-- **The bounded total-degree slice** `L_{n, ≥ M}` (RS.3.3): degrees with every coordinate at
least `M` and total degree `n`. A subset, not a subgroup. -/
def boundedDegreeSlice (D : Type) [Fintype D] (n M : ℤ) : Set (D → ℤ) :=
  {m | (∀ d, M ≤ m d) ∧ ∑ d, m d = n}

/-- `boundedDegreeSlice_test_2`: for two classes, `n = 3` and `M = 1`, the slice is
`{(1, 2), (2, 1)}`. -/
example : boundedDegreeSlice (Fin 2) 3 1 = {![1, 2], ![2, 1]} := by
  ext m
  simp only [boundedDegreeSlice, Set.mem_ofPred_eq, Fin.sum_univ_two, Set.mem_insert_iff,
    Set.mem_singleton_iff]
  constructor
  · rintro ⟨hm, hsum⟩
    have h0 := hm 0
    have h1 := hm 1
    have hcases : (m 0 = 1 ∧ m 1 = 2) ∨ (m 0 = 2 ∧ m 1 = 1) := by omega
    rcases hcases with ⟨h0, h1⟩ | ⟨h0, h1⟩
    · left; ext i; fin_cases i <;> simpa using (by assumption)
    · right; ext i; fin_cases i <;> simpa using (by assumption)
  · rintro (rfl | rfl) <;> constructor
    · intro i; fin_cases i <;> norm_num
    · norm_num
    · intro i; fin_cases i <;> norm_num
    · norm_num

/-- `boundedDegreeSlice_test_3`: for nonempty `D`, `n = 0` and `M = 1` the slice is empty. -/
example : boundedDegreeSlice (Fin 1) 0 1 = ∅ := by
  ext m
  simp only [boundedDegreeSlice, Set.mem_ofPred_eq, Fin.sum_univ_one, Set.mem_empty_iff_false,
    iff_false, not_and]
  intro hm
  have h0 := hm 0
  omega

/-- **The power-fixed degree lattice** `L_{≡ q}` (RS.3.4): degree vectors fixed by the class
permutation of `q`. -/
def powerFixedDegree {D : Type} (σ : D ≃ D) : AddSubgroup (D →₀ ℤ) :=
  AddMonoidHom.eqLocus (Finsupp.domCongr σ).toAddMonoidHom (AddMonoidHom.id _)

/-- `powerFixedDegree_test_2`: for the swap of two classes the fixed vectors are `(a, a)`. -/
example (m : Fin 2 →₀ ℤ) : m ∈ powerFixedDegree (Equiv.swap (0 : Fin 2) 1) ↔ m 0 = m 1 := by
  change Finsupp.domCongr (Equiv.swap (0 : Fin 2) 1) m = m ↔ _
  constructor
  · intro h
    simpa [eq_comm] using congrArg (fun v => v 0) h
  · intro h
    ext i
    fin_cases i <;> simpa [eq_comm] using h

/-- `powerFixedDegree_test_1`: the identity permutation fixes every integer degree vector. -/
example (D : Type) : powerFixedDegree (Equiv.refl D) = ⊤ := by
  ext m
  change Finsupp.domCongr (Equiv.refl D) m = m ↔ True
  simp

end RS3

/-! ## Layer RS.4: fixed fibers, square obstructions and parity -/

section RS4

open TauCeti

/-- **Squares above involutions are central** (RS.4.1): any central extension suffices,
without a chosen Schur cover, marking, generation or finiteness hypothesis. -/
theorem involution_square_central {A E G : Type} [Group A] [Group E] [Group G]
    (S : GroupExtension A E G) (hcentral : S.inl.range ≤ Subgroup.center E)
    (X : E) (hX : (S.rightHom X) ^ 2 = 1) :
    X ^ 2 ∈ S.inl.range ∧ X ^ 2 ∈ Subgroup.center E := by
  sorry

/-- **Square-times-torsion solvability** (RS.4.4): in a commutative group, `b ^ r` is a
`2r`-th power exactly when `b` is a square times an `r`-torsion element. -/
theorem square_torsion_solvability {A : Type} [CommGroup A] (b : A) (r : ℕ) :
    (∃ h : A, b ^ r = h ^ (2 * r)) ↔ ∃ a t : A, t ^ r = 1 ∧ b = a ^ 2 * t := by
  sorry

/-- **The torsion-image filtration** `B_t` (RS.4.8): the image of the `2^t`-torsion of `A` in
`B = A / A²`. -/
def torsionImageFiltration (A : Type) [CommGroup A] (t : ℕ) :
    Submodule (ZMod 2) (ElementaryTwoQuotient A) :=
  Submodule.span (ZMod 2) (elementaryTwoQuotientMk '' {a : A | a ^ (2 ^ t) = 1})

/-- At `t = 0` only the identity is allowed, and its square class is zero. -/
example (A : Type) [CommGroup A] : torsionImageFiltration A 0 = ⊥ := by
  simp [torsionImageFiltration]

/-- In `C₂` the generator's nonzero square class already lies in `B₁`. -/
example : elementaryTwoQuotientMk (Multiplicative.ofAdd (1 : ZMod 2)) ∈
    torsionImageFiltration (Multiplicative (ZMod 2)) 1 := by
  exact Submodule.subset_span ⟨Multiplicative.ofAdd 1, by decide, rfl⟩

/-- `torsionImageFiltration_mono`. -/
theorem torsionImageFiltration_mono (A : Type) [CommGroup A] {t u : ℕ} (htu : t ≤ u) :
    torsionImageFiltration A t ≤ torsionImageFiltration A u := by
  sorry

/-- `torsionImageFiltration_exhaustive`: for finite `A`, `B_t = B` once `2^t` kills the
`2`-primary part. -/
theorem torsionImageFiltration_exhaustive (A : Type) [CommGroup A] [Finite A] :
    ∃ e : ℕ, torsionImageFiltration A e = ⊤ := by
  sorry

/-- `torsionImageFiltration_test_2`: for `A = C₈` the filtration vanishes at `t = 2`; a
definition by the torsion subgroup itself (without passing to `A / A²`) would not. -/
theorem torsionImageFiltration_test_2 : torsionImageFiltration (Multiplicative (ZMod 8)) 2 = ⊥ := by
  sorry

/-- **The two-primary obstruction threshold** `t_A(b)` (RS.4.9): the least `t` with the square
class of `b` in `B_t`. -/
def obstructionThreshold {A : Type} [CommGroup A] [Finite A] (b : A) : ℕ :=
  sInf {t : ℕ | elementaryTwoQuotientMk b ∈ torsionImageFiltration A t}

/-- The identity has threshold zero: its square class is already in the first step. -/
example (A : Type) [CommGroup A] [Finite A] : obstructionThreshold (1 : A) = 0 := by
  apply Nat.sInf_eq_zero.mpr
  exact Or.inl (by simp [torsionImageFiltration])

/-- The generator of `C₂` first appears at step one, rather than at step zero. -/
example : obstructionThreshold (Multiplicative.ofAdd (1 : ZMod 2)) = 1 := by
  have h1 : elementaryTwoQuotientMk (Multiplicative.ofAdd (1 : ZMod 2)) ∈
      torsionImageFiltration (Multiplicative (ZMod 2)) 1 :=
    Submodule.subset_span ⟨Multiplicative.ofAdd 1, by decide, rfl⟩
  apply (csInf_eq_iff ⟨1, h1⟩ 1).2
  refine ⟨h1, ?_⟩
  intro n hn
  by_contra h
  have hn0 : n = 0 := by omega
  subst n
  have hs : IsSquare (Multiplicative.ofAdd (1 : ZMod 2)) := by
    simpa [torsionImageFiltration] using hn
  exact (by decide : ¬ IsSquare (Multiplicative.ofAdd (1 : ZMod 2))) hs

/-- `obstructionThreshold_zero`: `t_A(b) = 0` iff `b` is a square (for finite `A`). -/
theorem obstructionThreshold_zero {A : Type} [CommGroup A] [Finite A] (b : A) :
    obstructionThreshold b = 0 ↔ IsSquare b := by
  sorry

/-- `obstructionThreshold_test_3`: a generator of `C₈` has threshold `3`. -/
theorem obstructionThreshold_test_3 : obstructionThreshold (Multiplicative.ofAdd (1 : ZMod 8)) = 3 := by
  sorry

/-- **The two-adic survival criterion** (RS.4.10), in the form used fiber by fiber: for finite
`A`, odd `q > 1` and `r = (q - 1) / 2`, the equation `h ^ (q - 1) = b ^ r` (equivalently
`= b ^ (-r)`) has a solution iff `v₂(q - 1) ≥ t_A(b) + 1`. -/
theorem two_adic_survival {A : Type} [CommGroup A] [Finite A] (b : A) (q : ℕ) (hq : Odd q)
    (hq1 : 1 < q) :
    (∃ h : A, h ^ (q - 1) = b ^ ((q - 1) / 2)) ↔
      obstructionThreshold b + 1 ≤ padicValNat 2 (q - 1) := by
  sorry

/-- `allFixedFibers_test`, a negative control for the count: in `C₄` with `b` a generator and
`q = 3`, the equation `h ^ 2 = b` has no solution although `A[2]` has two elements. -/
theorem allFixedFibers_test : ¬ ∃ h : Multiplicative (ZMod 4), h ^ 2 = Multiplicative.ofAdd 1 := by
  decide

/-- At `q = 1`, every element solves the fixed-fiber equation. The valuation criterion
requires `q > 1`, since `padicValNat 2 0 = 0`. -/
theorem fixed_fiber_at_one {A : Type} [CommGroup A] (b : A) (h : A) : h ^ (1 - 1 : ℕ) = b ^ ((1 - 1) / 2 : ℕ) := by
  simp

/-- **Involution classes span an elementary abelian abelianization** (RS.4.11). -/
theorem involution_abelianization {G : Type} [Group G] (c : Set G) (hgen : Subgroup.closure c = ⊤)
    (hinv : ∀ x ∈ c, x ^ 2 = 1) (u : Abelianization G) : u ^ 2 = 1 := by
  sorry

/-- **The joint parity map** `L_t(v) = (a v, s v mod B_t)` (RS.4.15). -/
def jointParityMap {V U B : Type} [AddCommGroup V] [Module (ZMod 2) V] [AddCommGroup U]
    [Module (ZMod 2) U] [AddCommGroup B] [Module (ZMod 2) B]
    (a : V →ₗ[ZMod 2] U) (s : V →ₗ[ZMod 2] B) (W : Submodule (ZMod 2) B) :
    V →ₗ[ZMod 2] U × (B ⧸ W) :=
  a.prod (W.mkQ ∘ₗ s)

/-- `jointParityMap_kernel`. -/
theorem jointParityMap_kernel {V U B : Type} [AddCommGroup V] [Module (ZMod 2) V] [AddCommGroup U]
    [Module (ZMod 2) U] [AddCommGroup B] [Module (ZMod 2) B]
    (a : V →ₗ[ZMod 2] U) (s : V →ₗ[ZMod 2] B) (W : Submodule (ZMod 2) B) (v : V) :
    v ∈ LinearMap.ker (jointParityMap a s W) ↔ a v = 0 ∧ s v ∈ W := by
  sorry

/-- `jointParityMap_test_2`: with `a = 0` and `s = id` on `F₂`, the kernel is `0` for `W = 0`;
using `a` alone would give all of `F₂`. -/
example : LinearMap.ker (jointParityMap (0 : ZMod 2 →ₗ[ZMod 2] ZMod 2) LinearMap.id ⊥) = ⊥ := by
  ext v
  simp [jointParityMap]

/-- **Ranks count surviving parities** (RS.4.17): a translate of the kernel of a linear map on a
finite `F₂`-space has `2 ^ (dim V - rank L)` elements. -/
theorem rank_parity_count {V W : Type} [AddCommGroup V] [Module (ZMod 2) V] [Finite V]
    [AddCommGroup W] [Module (ZMod 2) W] (L : V →ₗ[ZMod 2] W) (v₀ : V) :
    Nat.card {v : V // v - v₀ ∈ LinearMap.ker L} =
      2 ^ (Module.finrank (ZMod 2) V - Module.finrank (ZMod 2) (LinearMap.range L)) := by
  sorry

/-- The fixed-fiber sign (RS.4.3), in the central marked model `C₁₄ → C₂`:
`b = a⁻²` in the kernel `C₇` gives `h² = a²`, solved by `a`, not `a⁻¹`. -/
theorem fixed_fiber_sign_test :
    (Multiplicative.ofAdd (1 : ZMod 7)) ^ 2 =
        (Multiplicative.ofAdd (-2 : ZMod 7))⁻¹ ∧
      (Multiplicative.ofAdd (-1 : ZMod 7)) ^ 2 ≠
        (Multiplicative.ofAdd (-2 : ZMod 7))⁻¹ := by
  decide

end RS4

/-! ## Layer RS.6: certified finite examples -/

section RS6

variable {G : Type} [Group G]

/-- **Odd-index-two homology reduction** (RS.6.1), its part expressed on native homology.
The reduced-multiplier consequence requires IG's quotient carrier and stays in the README. -/
theorem odd_index_two_reduction [Finite G] (H : Subgroup G) [H.Normal] (hodd : Odd (Nat.card H))
    (hidx : H.index = 2) : Odd (Nat.card (Multiplier G)) := by
  sorry

/-- **Centralizer commutator multiplicativity** (RS.6.2), before reading commutators through
the kernel inclusion. Both projected commutators must vanish. -/
theorem centralizer_commutator_hom {A E : Type} [Group A] [Group E] (S : GroupExtension A E G)
    (hcentral : S.inl.range ≤ Subgroup.center E) (X Y Z : E)
    (hy : Commute (S.rightHom X) (S.rightHom Y))
    (hz : Commute (S.rightHom X) (S.rightHom Z)) :
    ⁅X, Y * Z⁆ = ⁅X, Y⁆ * ⁅X, Z⁆ := by
  sorry

/-- The cyclic group of order two. -/
abbrev C₂ : Type := Multiplicative (ZMod 2)

/-- The swap action of `C₂` on `G × G`. -/
def swapAction (G : Type) [Group G] : C₂ →* MulAut (G × G) where
  toFun g := if g.toAdd.val = 0 then 1 else MulEquiv.prodComm
  map_one' := rfl
  map_mul' := by
    intro g h
    obtain ⟨g, rfl⟩ := Multiplicative.ofAdd.surjective g
    obtain ⟨h, rfl⟩ := Multiplicative.ofAdd.surjective h
    fin_cases g <;> fin_cases h <;> ext x <;> rfl

/-- The nontrivial swap exchanges unequal coordinates; the identity fixes them. -/
example : swapAction (Multiplicative (ZMod 3)) (Multiplicative.ofAdd 1)
    (Multiplicative.ofAdd 1, Multiplicative.ofAdd 2) =
      (Multiplicative.ofAdd 2, Multiplicative.ofAdd 1) ∧
    swapAction (Multiplicative (ZMod 3)) 1
      (Multiplicative.ofAdd 1, Multiplicative.ofAdd 2) =
        (Multiplicative.ofAdd 1, Multiplicative.ofAdd 2) := by
  decide

/-- The **swap wreath product** `W(G) = (G × G) ⋊ C₂`. -/
abbrev SwapWreath (G : Type) [Group G] : Type :=
  (G × G) ⋊[swapAction G] C₂

/-- The product map `G × G → Gᵃᵇ`, `(a, b) ↦ [a][b]`. -/
def abelianizedSum (G : Type) [Group G] : G × G →* Abelianization G :=
  Abelianization.of.comp (MonoidHom.fst G G) * Abelianization.of.comp (MonoidHom.snd G G)

/-- The sum map on `C₃²` kills `(1,2)` and preserves the nonzero sum of `(1,1)`. -/
example :
    abelianizedSum (Multiplicative (ZMod 3)) (Multiplicative.ofAdd 1, Multiplicative.ofAdd 2) = 1 ∧
    abelianizedSum (Multiplicative (ZMod 3)) (Multiplicative.ofAdd 1, Multiplicative.ofAdd 1) ≠ 1 := by
  change Abelianization.of ((Multiplicative.ofAdd (1 : ZMod 3)) * Multiplicative.ofAdd 2) = 1 ∧
    Abelianization.of ((Multiplicative.ofAdd (1 : ZMod 3)) * Multiplicative.ofAdd 1) ≠ 1
  constructor
  · exact map_one _
  · intro h
    have h' := Abelianization.equivOfComm.injective (h.trans (map_one _).symm)
    exact (by decide : (Multiplicative.ofAdd (1 : ZMod 3)) * Multiplicative.ofAdd 1 ≠ 1) h'

set_option backward.isDefEq.respectTransparency false in
/-- The **sum-kernel model** (RS.6.9): the kernel of `W(G) → Gᵃᵇ`, `((a, b), t) ↦ [a][b]`. For
abelian `G` it is the anti-diagonal model `F(G)` of RS.6.8, and for perfect `G` it is all of
`W(G)`. -/
def sumKernelModel (G : Type) [Group G] : Subgroup (SwapWreath G) :=
  (SemidirectProduct.lift (abelianizedSum G) 1 (by
    intro g
    obtain ⟨g, rfl⟩ := Multiplicative.ofAdd.surjective g
    have h0 : (Multiplicative.ofAdd (0 : ZMod 2) : C₂) = 1 := rfl
    have h1 : (Multiplicative.ofAdd (1 : ZMod 2) : C₂) ≠ 1 := by decide
    fin_cases g <;> ext x <;> simp [abelianizedSum, swapAction, h0, h1, mul_comm])).ker

/-- The **outside involutions** of a subgroup of `W(G)`: elements with nontrivial `C₂`
coordinate and square `1`. -/
def outsideInvolutions (F : Subgroup (SwapWreath G)) : Set F :=
  {x | (x : SwapWreath G).right ≠ 1 ∧ x ^ 2 = 1}

/-- The identity squares to one but is excluded from the outside marking. -/
example : (1 : (⊤ : Subgroup (SwapWreath C₂))) ∉
    outsideInvolutions (⊤ : Subgroup (SwapWreath C₂)) := by
  simp [outsideInvolutions]

/-- The pure swap is an outside involution; the marking is nonempty. -/
example : (⟨⟨(1, 1), Multiplicative.ofAdd 1⟩, Subgroup.mem_top _⟩ :
    (⊤ : Subgroup (SwapWreath C₂))) ∈
      outsideInvolutions (⊤ : Subgroup (SwapWreath C₂)) := by
  change Multiplicative.ofAdd (1 : ZMod 2) ≠ 1 ∧ _
  constructor
  · decide
  · apply Subtype.ext
    rfl

/-- `sumKernelModel_card`: `|sumKernelModel G| = 2 |G| |[G, G]|`. -/
theorem sumKernelModel_card [Finite G] :
    Nat.card (sumKernelModel G) = 2 * Nat.card G * Nat.card (commutator G) := by
  sorry

/-- `sumKernelModel_eq_top_of_perfect`: for a perfect group the sum kernel is all of `W(G)`, the
full wreath model of RS.6.9. -/
theorem sumKernelModel_eq_top_of_perfect (h : commutator G = ⊤) : sumKernelModel G = ⊤ := by
  sorry

/-- `sumKernelModel_test_2`: the sum-kernel model of `A₄` has order `96` (the order-96 type of
RS.6.6, Table 2 row 8). -/
theorem sumKernelModel_test_2 : Nat.card (sumKernelModel (alternatingGroup (Fin 4))) = 96 := by
  sorry

/-- `sumKernelModel_test_1`, sum not difference: in `W(C₃)` the pair `((1, 2), 1)` (additive
residues) lies in the sum kernel and `((1, 1), 1)` does not. -/
example :
    (⟨(Multiplicative.ofAdd (1 : ZMod 3), Multiplicative.ofAdd 2), 1⟩ :
        SwapWreath (Multiplicative (ZMod 3))) ∈ sumKernelModel _ ∧
      (⟨(Multiplicative.ofAdd (1 : ZMod 3), Multiplicative.ofAdd 1), 1⟩ :
        SwapWreath (Multiplicative (ZMod 3))) ∉ sumKernelModel _ := by
  change Abelianization.of (Multiplicative.ofAdd (1 : ZMod 3)) *
      Abelianization.of (Multiplicative.ofAdd (2 : ZMod 3)) = 1 ∧
    Abelianization.of (Multiplicative.ofAdd (1 : ZMod 3)) *
      Abelianization.of (Multiplicative.ofAdd (1 : ZMod 3)) ≠ 1
  rw [← (Abelianization.of : Multiplicative (ZMod 3) →* _).map_mul,
    ← (Abelianization.of : Multiplicative (ZMod 3) →* _).map_mul]
  constructor
  · change Abelianization.of (1 : Multiplicative (ZMod 3)) = 1
    exact map_one _
  · intro h
    have h' := Abelianization.equivOfComm.injective (h.trans (map_one _).symm)
    have : (Multiplicative.ofAdd (1 : ZMod 3)) * Multiplicative.ofAdd 1 ≠ 1 := by decide
    exact this h'

/-- **The anti-diagonal marking** (RS.6.8): for every abelian `G` the outside involutions generate
`F(G)`, and for finite `G` of odd order they form one conjugacy class. -/
theorem antidiagonal_marking (G : Type) [CommGroup G] :
    Subgroup.closure (outsideInvolutions (sumKernelModel G)) = ⊤ ∧
      (Finite G → Odd (Nat.card G) →
        ∀ x ∈ outsideInvolutions (sumKernelModel G), ∀ y ∈ outsideInvolutions (sumKernelModel G),
          IsConj x y) := by
  sorry

/-- **Degree-two Künneth for arbitrary groups** (RS.6.8): the cross summand tensors their
abelianizations, with no commutativity or finiteness assumption on the factors. -/
theorem multiplier_prod (G H : Type) [Group G] [Group H] :
    Nonempty (Multiplier (G × H) ≃+
      ((Multiplier G × Multiplier H) ×
        (Additive (Abelianization G) ⊗[ℤ] Additive (Abelianization H)))) := by
  sorry

/-- **Finite abelian multipliers are exterior squares** (RS.6.8), on Mathlib's existing
exterior-power carrier. The comparison sends `a ∧ b` to the oriented commuting-pair class. -/
theorem abelian_multiplier_exteriorSquare (G : Type) [CommGroup G] [Finite G] :
    Nonempty ((⋀[ℤ]^2 (Additive G)) ≃+ Multiplier G) := by
  sorry

/-- **The ordinary multiplier of the anti-diagonal model** (RS.6.8). The README identifies
it with the reduced multiplier and then with the exterior square. -/
theorem antidiagonal_multiplier (G : Type) [CommGroup G] [Finite G]
    (hodd : Odd (Nat.card G)) : Nonempty (Multiplier (sumKernelModel G) ≃+ Multiplier G) := by
  sorry

end RS6

/-!
## README targets requiring carriers absent at the pins

* RS.0: the supplied class map's `extensionClassMap_exact_left`, `extensionClassMap_exact_mid`,
  `extensionClassMap_surjective_of_stem`, and the
  Hall-coinvariant equivalence `multiplier_hallPart`.
* RS.1: `localClassNormalization` with its API and `homology_image` for the supplied reduced cover.
* RS.3: `kernel_action_aut`, `finite_level_action`, `DegreeOrbitSet`, the actual marked-kernel
  and twisted restrictions of `boundedDegreeSlice` and `powerFixedDegree`.
* RS.4: `squareObstruction`, `fixed_fiber_equation`,
  `all_fixed_fibers`, `odd_parity_fiber`, `even_parity_fiber`, `lift_square_columns`,
  `paritySquareMap`, `affine_compatible_parities`, `surviving_parities`, `independent_classes`.
  The lower-bound adapter `parity_lowerBound_translation` and `parity_degree_generatingSeries`
  consume the current library's weight polynomial, which is absent at the pins.
* RS.6: `ReductionCertificate`, `finiteParityAlgorithm`, `centralizer_generator_relations`,
  the graph models,
  `antidiagonal_reduced_multiplier`, `order96_reduced_multiplier`, and all
  thirty-one `table_row_k` statements. The light `sumKernelModel` specializes to `order96Type`
  at `A₄` and to `antidiagonalModel` for abelian groups; `outsideInvolutions` retains their marking.

Every theorem and every API and Check for these targets is specified in the README. None of the
supplied IG constructions is an additional target of this file.
-/

end TauCetiRoadmap.InductionRestrictionPartII
