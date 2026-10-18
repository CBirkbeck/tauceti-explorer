import Mathlib
import TauCeti.GroupTheory.GroupExtension.Cohomology
import TauCeti.Algebra.Group.ElementaryTwoQuotient.Basic
import TauCeti.RepresentationTheory.ProjectiveRepresentation.SchurMultiplier

/-!
# Fixed fibres of reduced Schur covers and reduced multipliers of marked groups: representative target signatures

The roadmap is `README.md`; this file is not exhaustive. It records the light definitions and the
theorem signatures of the roadmap that can be stated against the pinned Mathlib and Tau Ceti, so
that contributors and reviewers converge on names and signatures. Every theorem is proved by
`sorry` unless a short proof is given. The heavy objects (the class map of a central extension,
Schur and reduced covers, the universal marked extension and its kernel, the unit action and its
corrections, finite certificates) are README targets and do not appear here.

Design choices made explicit here:

* `Multiplier G` is notation for Mathlib's `groupHomology.H2 (Rep.trivial ℤ G ℤ)`, the integral
  Schur multiplier `H₂(G, ℤ)`, written additively; it is not a second carrier. It is not Tau Ceti's
  `schurMultiplier k G`, which is `H²(G, kˣ)`.
* Commutators are `⁅X, Y⁆ = X * Y * X⁻¹ * Y⁻¹` (Mathlib's `commutatorElement`). The oriented
  commuting-pair class of commuting `x, y` is the class of the cycle `[x|y] - [y|x]`.
* A central extension is a Mathlib `GroupExtension` together with the predicate
  `IsCentralExtension`; centrality is never built into the carrier.
* The commuting-pair classes, the Schur relations, the reduced multiplier and the commutator of
  lifts belong to the roadmap InverseGaloisAndArithmeticFundamentalGroups (Layer IG.3.4, namespace
  `ReducedSchur`). They are stated in the sub-namespace `ReducedSchur` below with the signatures
  given there, over Mathlib's carriers, so that the statements of Layers RS.1 and RS.6 can be made;
  they are that roadmap's declarations, not new ones.
* The marked groups of the examples are subgroups of the swap wreath product
  `(G × G) ⋊ C₂`, with `C₂ = Multiplicative (ZMod 2)`.
-/

noncomputable section

open CategoryTheory
open scoped commutatorElement

namespace TauCetiRoadmap.InductionRestrictionPartII

/-! ## Layer RS.0: integral homology of groups and central extensions -/

section RS0

/-- The integral Schur multiplier `M(G) = H₂(G, ℤ)`, Mathlib's second group homology of the trivial
integral representation. -/
abbrev Multiplier (G : Type) [Group G] : Type :=
  groupHomology.H2 (Rep.trivial ℤ G ℤ)

/-- The map `Hₙ(G, ℤ) → Hₙ(H, ℤ)` induced by a group homomorphism, with the identity on the trivial
integral coefficients. -/
def homologyMap {G H : Type} [Group G] [Group H] (f : G →* H) (n : ℕ) :
    groupHomology (Rep.trivial ℤ G ℤ) n →+ groupHomology (Rep.trivial ℤ H ℤ) n :=
  (groupHomology.map (A := Rep.trivial ℤ G ℤ) (B := Rep.trivial ℤ H ℤ) f (𝟙 _) n).hom.toAddMonoidHom

/-- The map `M(G) → M(H)` induced by a group homomorphism. -/
def multiplierMap {G H : Type} [Group G] [Group H] (f : G →* H) :
    Multiplier G →+ Multiplier H :=
  homologyMap f 2

variable {A E G : Type} [Group A] [Group E] [Group G]

/-- A group extension is **central** when its kernel lies in the centre of the total group. It is
a separate hypothesis, never part of `GroupExtension`. -/
def IsCentralExtension (S : GroupExtension A E G) : Prop :=
  S.inl.range ≤ Subgroup.center E

/-- A central extension is **stem** when its kernel also lies in the commutator subgroup. -/
def IsStemExtension (S : GroupExtension A E G) : Prop :=
  IsCentralExtension S ∧ S.inl.range ≤ commutator E

/-- The pairing of a function `G × G → B` with an integral 2-chain,
`⟨φ, Σ n_(g,h) [g|h]⟩ = Σ n_(g,h) • φ (g, h)` (RS.0.1). On cocycles and cycles it is the universal
coefficient map `H²(G, B) → Hom(M(G), B)` on representatives, and on the factor set of a section of
a central extension it computes the class map. -/
def cyclePairing {B : Type} [AddCommGroup B] (φ : G × G → B) (z : G × G →₀ ℤ) : B :=
  z.sum fun p n => n • φ p

/-- **A cocycle pairs to zero with every boundary** (RS.0.1). -/
theorem cyclePairing_boundary {B : Type} [AddCommGroup B]
    (φ : G × G → B) (hφ : φ ∈ groupCohomology.cocycles₂ (Rep.trivial ℤ G B))
    (z : G × G →₀ ℤ) (hz : z ∈ groupHomology.boundaries₂ (Rep.trivial ℤ G ℤ)) :
    cyclePairing φ z = 0 := by
  sorry

/-- **A coboundary pairs to zero with every cycle** (RS.0.1). -/
theorem cyclePairing_coboundary {B : Type} [AddCommGroup B]
    (φ : G × G → B) (hφ : φ ∈ groupCohomology.coboundaries₂ (Rep.trivial ℤ G B))
    (z : G × G →₀ ℤ) (hz : z ∈ groupHomology.cycles₂ (Rep.trivial ℤ G ℤ)) :
    cyclePairing φ z = 0 := by
  sorry

/-- `integralEvaluation_test_1`, orientation: for `ℤ²` (written multiplicatively) and the bilinear
cocycle `φ((a,b),(c,d)) = ad`, which is also the factor set of the section `(a, b) ↦ (a, b, 0)` of
the integral Heisenberg group, the oriented commuting cycle of the basis pairs to `1`. -/
example :
    let G := Multiplicative (ℤ × ℤ)
    let x : G := Multiplicative.ofAdd (1, 0)
    let y : G := Multiplicative.ofAdd (0, 1)
    cyclePairing (G := G) (fun p => p.1.toAdd.1 * p.2.toAdd.2)
      (Finsupp.single (x, y) 1 - Finsupp.single (y, x) 1) = 1 := by
  sorry

/-- The reversed cycle pairs to `-1`: the pairing does not symmetrise. -/
example :
    let G := Multiplicative (ℤ × ℤ)
    let x : G := Multiplicative.ofAdd (1, 0)
    let y : G := Multiplicative.ofAdd (0, 1)
    cyclePairing (G := G) (fun p => p.1.toAdd.1 * p.2.toAdd.2)
      (Finsupp.single (y, x) 1 - Finsupp.single (x, y) 1) = -1 := by
  sorry

/-- **The order of `H²(G, ℂˣ)`** (RS.0.2, `card_schurMultiplier_complex`): for a finite group, Tau
Ceti's Schur multiplier `H²(G, ℂˣ)` has the order of the integral multiplier `M(G) = H₂(G, ℤ)`, by
the universal coefficient theorem with the divisible coefficients `ℂˣ`. -/
theorem card_schurMultiplier_complex (G : Type) [Group G] [Finite G] :
    Nat.card (TauCeti.schurMultiplier ℂ G) = Nat.card (Multiplier G) := by
  sorry

/-- `card_schurMultiplier_complex_test`: for `C₂ × C₂` both orders are `2`. -/
example : Nat.card (Multiplier (Multiplicative (ZMod 2) × Multiplicative (ZMod 2))) = 2 := by
  sorry

/-- `integralExtInclusion_test_1`: `H²(C₂, ℤ)` is nonzero although `M(C₂) = 0`, so evaluation is
not injective without a hypothesis on the abelianization or the coefficients. -/
example : Nontrivial (groupCohomology.H2 (Rep.trivial ℤ (Multiplicative (ZMod 2)) ℤ)) ∧
    Subsingleton (Multiplier (Multiplicative (ZMod 2))) := by
  sorry

/-- **The tail of the five-term sequence** (RS.0.3): for any extension, `Eᵃᵇ → Gᵃᵇ` is onto. -/
theorem abelianization_map_surjective (S : GroupExtension A E G) :
    Function.Surjective (Abelianization.map S.rightHom) := by
  sorry

/-- **Exactness at `Eᵃᵇ`** (RS.0.3): the kernel of `Eᵃᵇ → Gᵃᵇ` is the image of the kernel. -/
theorem abelianization_exact_of_extension (S : GroupExtension A E G) :
    (Abelianization.map S.rightHom).ker = (Abelianization.of.comp S.inl).range := by
  sorry

/-- **Stem extensions do not change the abelianization** (RS.0.3): `Eᵃᵇ → Gᵃᵇ` is bijective. -/
theorem abelianization_map_bijective_of_stem (S : GroupExtension A E G) (hS : IsStemExtension S) :
    Function.Bijective (Abelianization.map S.rightHom) := by
  sorry

/-- `extensionFiveTerm_test_4`: for `A₃ → S₃ → C₂` the kernel dies in the abelianization, since
`[S₃, A₃] = A₃`; the general form of the five-term sequence replaces `A₃` by `A₃/[S₃, A₃] = 1`. -/
example : (Abelianization.of.comp (alternatingGroup (Fin 3)).subtype).range = ⊥ := by
  sorry

/-- **Positive-degree integral homology of a finite group is killed by its order** (RS.0.4). -/
theorem integralHomology_card_smul (G : Type) [Group G] [Finite G] (n : ℕ)
    (z : groupHomology (Rep.trivial ℤ G ℤ) (n + 1)) : Nat.card G • z = 0 := by
  sorry

/-- **Positive-degree integral homology of a finite group is finite** (RS.0.4). -/
theorem integralHomology_finite (G : Type) [Group G] [Finite G] (n : ℕ) :
    Finite (groupHomology (Rep.trivial ℤ G ℤ) (n + 1)) := by
  sorry

/-- `integralHomology_test_3`: degree zero is excluded; `H₀(C₂, ℤ) ≅ ℤ` is infinite. -/
example : Infinite (groupHomology (Rep.trivial ℤ (Multiplicative (ZMod 2)) ℤ) 0) := by
  sorry

/-- **The Hall part of integral homology, image** (RS.0.5, `integralHomology_hallPart`): for a
normal Hall subgroup `H` of a finite group and `n ≥ 1`, the image of corestriction
`Hₙ(H, ℤ) → Hₙ(G, ℤ)` is the part killed by a power of `|H|`. -/
theorem integralHomology_hallPart_range (G : Type) [Group G] [Finite G] (H : Subgroup G)
    [H.Normal] (hcop : Nat.Coprime (Nat.card H) H.index) (n : ℕ)
    (z : groupHomology (Rep.trivial ℤ G ℤ) (n + 1)) :
    z ∈ (homologyMap H.subtype (n + 1)).range ↔ ∃ k : ℕ, (Nat.card H) ^ k • z = 0 := by
  sorry

/-- **The Hall part of integral homology, kernel** (RS.0.5, `integralHomology_hallPart`): the kernel
of corestriction is generated by the differences `(c_g)_* v - v` of the conjugation action, so
corestriction is injective on the coinvariants `Hₙ(H, ℤ)_G`. -/
theorem integralHomology_hallPart_ker (G : Type) [Group G] [Finite G] (H : Subgroup G)
    [H.Normal] (hcop : Nat.Coprime (Nat.card H) H.index) (n : ℕ) :
    (homologyMap H.subtype (n + 1)).ker =
      AddSubgroup.closure {w | ∃ (g : G) (v : groupHomology (Rep.trivial ℤ H ℤ) (n + 1)),
        w = homologyMap (MulAut.conjNormal g : MulAut H).toMonoidHom (n + 1) v - v} := by
  sorry

end RS0

/-! ## Layer RS.1: commuting-pair classes and reduced Schur covers -/

namespace ReducedSchur

variable {A E G : Type} [Group A] [Group E] [Group G]

/-- InverseGalois's commuting-pair cycle (IG.3.4): for commuting `x, y`, the integral 2-cycle
`[x|y] - [y|x]`. -/
def commutingCycle (x y : G) (h : Commute x y) : groupHomology.cycles₂ (Rep.trivial ℤ G ℤ) :=
  ⟨Finsupp.single (x, y) 1 - Finsupp.single (y, x) 1, by
    rw [groupHomology.cycles₂, LinearMap.mem_ker, map_sub, groupHomology.d₂₁_single,
      groupHomology.d₂₁_single]
    simp [h.eq]
    abel⟩

/-- InverseGalois's homological commutator `⟨x, y⟩ ∈ M(G)` (IG.3.4). -/
def homologicalCommutator (x y : G) (h : Commute x y) : Multiplier G :=
  groupHomology.H2π (Rep.trivial ℤ G ℤ) (commutingCycle x y h)

/-- InverseGalois's Schur relations `Q_c` (IG.3.4): the subgroup of `M(G)` generated by the classes
`⟨x, y⟩` with `x ∈ c` and `y` commuting with `x`. -/
def schurRelations (c : Set G) : AddSubgroup (Multiplier G) :=
  AddSubgroup.closure {z | ∃ x ∈ c, ∃ (y : G) (h : Commute x y), z = homologicalCommutator x y h}

/-- InverseGalois's reduced Schur multiplier `M(G, c) = M(G) / Q_c` (IG.3.4). -/
abbrev reducedMultiplier (c : Set G) : Type :=
  Multiplier G ⧸ schurRelations c

/-- For commuting `x, y`, the commutator of the chosen lifts lies in the image of the kernel. -/
theorem commutator_surjInv_mem_range (S : GroupExtension A E G) {x y : G} (h : Commute x y) :
    ⁅Function.surjInv S.rightHom_surjective x, Function.surjInv S.rightHom_surjective y⁆ ∈
      S.inl.range := by
  rw [S.range_inl_eq_ker_rightHom, MonoidHom.mem_ker, map_commutatorElement,
    Function.surjInv_eq S.rightHom_surjective, Function.surjInv_eq S.rightHom_surjective,
    commutatorElement_eq_one_iff_commute]
  exact h

/-- InverseGalois's commutator of lifts `κ_E(x, y) ∈ A` of commuting `x, y` (IG.3.4), computed from
the lifts chosen by `Function.surjInv`; in a central extension it does not depend on the lifts. -/
def liftCommutator (S : GroupExtension A E G) {x y : G} (h : Commute x y) : A :=
  (MonoidHom.ofInjective S.inl_injective).symm
    ⟨_, commutator_surjInv_mem_range S h⟩

end ReducedSchur

section RS1

open ReducedSchur

variable {A E G : Type} [Group A] [Group E] [Group G]

/-- **Commuting-pair classes are additive in the first variable** (RS.1.1): for `a, b` commuting
with `y`, `⟨ab, y⟩ = ⟨a, y⟩ + ⟨b, y⟩`; `a` and `b` need not commute with each other. -/
theorem homologicalCommutator_mul_left {a b y : G} (ha : Commute a y) (hb : Commute b y) :
    homologicalCommutator (a * b) y (ha.mul_left hb) =
      homologicalCommutator a y ha + homologicalCommutator b y hb := by
  sorry

/-- **Commuting-pair classes are additive in the second variable** (RS.1.1). -/
theorem homologicalCommutator_mul_right {x b b' : G} (hb : Commute x b) (hb' : Commute x b') :
    homologicalCommutator x (b * b') (hb.mul_right hb') =
      homologicalCommutator x b hb + homologicalCommutator x b' hb' := by
  sorry

/-- **The power law** (RS.1.1, `commutator_order`): `⟨xⁿ, y⟩ = n • ⟨x, y⟩` for every integer `n`. -/
theorem commutator_order {x y : G} (h : Commute x y) (n : ℤ) :
    homologicalCommutator (x ^ n) y (h.zpow_left n) = n • homologicalCommutator x y h := by
  sorry

/-- `homologicalCommutator_self` (RS.1.1): `⟨x, x⟩ = 0`. -/
theorem homologicalCommutator_self (x : G) :
    homologicalCommutator x x (Commute.refl x) = 0 := by
  sorry

/-- `commutator_order_test_1`, `n = 0`: `⟨1, y⟩ = 0`. -/
example (y : G) : homologicalCommutator 1 y (Commute.one_left y) = 0 := by
  sorry

/-- `commutator_order_test_1`, `n = -1`: the class of an inverse is the negative, not the class
itself. -/
example {x y : G} (h : Commute x y) :
    homologicalCommutator x⁻¹ y h.inv_left = -homologicalCommutator x y h := by
  sorry

/-- **Normalised factors over one element commute** (RS.1.3, `local_factors_commute`): in a central
extension, two elements lying over `1` or over one fixed `g` commute. -/
theorem local_factors_commute (S : GroupExtension A E G) (hS : IsCentralExtension S) (g : G)
    {e e' : E} (he : S.rightHom e = 1 ∨ S.rightHom e = g)
    (he' : S.rightHom e' = 1 ∨ S.rightHom e' = g) : Commute e e' := by
  sorry

/-- `local_factors_commute_test`: lying over one element cannot be weakened to lying over the
nonidentity elements of one quotient: in `D₈` the lifts `r` and `sr⁰` of two basis elements of
`C₂ × C₂` do not commute. -/
example : ¬ Commute (DihedralGroup.r (1 : ZMod 4)) (DihedralGroup.sr 0) := by
  sorry

/-- `centralizer_commutator_hom_test` at the level of `D₈`: `⁅r, s⁆ = r²`, the central involution. -/
example : ⁅(DihedralGroup.r (1 : ZMod 4)), DihedralGroup.sr (0 : ZMod 4)⁆ = DihedralGroup.r 2 := by
  sorry

end RS1

/-! ## Layer RS.3: the unit action on the kernel and degree orbits -/

section RS3

/-- **The bounded total-degree slice** `L_{n, ≥ M}` (RS.3.3): degree vectors with every coordinate at
least `M` and total degree `n`. A subset, not a subgroup. -/
def boundedDegreeSlice (D : Type) [Fintype D] (n M : ℤ) : Set (D → ℤ) :=
  {m | (∀ d, M ≤ m d) ∧ ∑ d, m d = n}

/-- `boundedDegreeSlice_test_2`: for two classes, `n = 3` and `M = 1`, the slice is
`{(1, 2), (2, 1)}`. -/
example : boundedDegreeSlice (Fin 2) 3 1 = {![1, 2], ![2, 1]} := by
  sorry

/-- `boundedDegreeSlice_test_3`: for nonempty `D`, `n = 0` and `M = 1` the slice is empty. -/
example : boundedDegreeSlice (Fin 1) 0 1 = ∅ := by
  sorry

/-- `boundedDegreeSlice_test_1`: for empty `D` the slice at `n = 0` is a single point. -/
example : boundedDegreeSlice (Fin 0) 0 1 = Set.univ := by
  sorry

/-- **The power-fixed degree lattice** `L_{≡ q}` (RS.3.4): degree vectors fixed by the coordinate
permutation of a permutation `σ` of the classes (in the application, `d ↦ d^q`). -/
def powerFixedDegree {D : Type} (σ : D ≃ D) : AddSubgroup (D →₀ ℤ) :=
  AddMonoidHom.eqLocus (Finsupp.domCongr σ).toAddMonoidHom (AddMonoidHom.id _)

/-- `powerFixedDegree_test_2`: for the swap of the two classes of `C₃` (the action of `q = 2`) the
fixed vectors are the `(a, a)`. -/
example (m : Fin 2 →₀ ℤ) : m ∈ powerFixedDegree (Equiv.swap (0 : Fin 2) 1) ↔ m 0 = m 1 := by
  sorry

/-- **The orbit set of class degrees** `𝔖^{c,G}` (RS.3.5): the quotient of the degree lattice by the
coordinate permutations of a subgroup `P` of permutations of the classes (in the application, the
permutations induced by units). -/
def DegreeOrbitSet {D : Type} (P : Subgroup (Equiv.Perm D)) : Type :=
  Quot fun m m' : D →₀ ℤ => ∃ σ ∈ P, Finsupp.domCongr σ m = m'

/-- The class of a degree vector in the orbit set. -/
def DegreeOrbitSet.mk {D : Type} (P : Subgroup (Equiv.Perm D)) (m : D →₀ ℤ) : DegreeOrbitSet P :=
  Quot.mk _ m

/-- `degreeOrbitSet_test_2`: when the classes are exchanged, `(1, 4)` and `(4, 1)` have the same
class. -/
example : DegreeOrbitSet.mk (⊤ : Subgroup (Equiv.Perm (Fin 2))) (Finsupp.equivFunOnFinite.symm ![1, 4]) =
    DegreeOrbitSet.mk ⊤ (Finsupp.equivFunOnFinite.symm ![4, 1]) := by
  sorry

/-- `degreeOrbitSet_test_3`: `(1, 4)` and `(2, 3)` have different classes although their totals
agree. -/
example : DegreeOrbitSet.mk (⊤ : Subgroup (Equiv.Perm (Fin 2))) (Finsupp.equivFunOnFinite.symm ![1, 4]) ≠
    DegreeOrbitSet.mk ⊤ (Finsupp.equivFunOnFinite.symm ![2, 3]) := by
  sorry

end RS3

/-! ## Layer RS.4: fixed fibres, square obstructions and parity -/

section RS4

open TauCeti

/-- **Lift squares of involutions are central** (RS.4.1, `involution_square_central`): in a central
extension, every lift of an involution squares into the kernel. -/
theorem involution_square_central {A E G : Type} [Group A] [Group E] [Group G]
    (S : GroupExtension A E G) (hS : IsCentralExtension S) {X : E} (hX : S.rightHom X ^ 2 = 1) :
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
definition by the torsion subgroup itself, without passing to `A / A²`, would not. -/
example : torsionImageFiltration (Multiplicative (ZMod 8)) 2 = ⊥ := by
  sorry

/-- **The two-primary obstruction threshold** `t_A(b)` (RS.4.9): the least `t` with the square
class of `b` in `B_t`. -/
def obstructionThreshold {A : Type} [CommGroup A] (b : A) : ℕ :=
  sInf {t : ℕ | elementaryTwoQuotientMk b ∈ torsionImageFiltration A t}

/-- `obstructionThreshold_zero`: `t_A(b) = 0` iff `b` is a square (for finite `A`). -/
theorem obstructionThreshold_zero {A : Type} [CommGroup A] [Finite A] (b : A) :
    obstructionThreshold b = 0 ↔ IsSquare b := by
  sorry

/-- `obstructionThreshold_test_3`: a generator of `C₈` has threshold `3`. -/
example : obstructionThreshold (Multiplicative.ofAdd (1 : ZMod 8)) = 3 := by
  sorry

/-- **The two-adic survival criterion** (RS.4.10), in the form used fibre by fibre: for finite
`A`, odd `q > 1` and `r = (q - 1) / 2`, the equation `h ^ (q - 1) = b ^ r` (equivalently
`= b ^ (-r)`) has a solution iff `v₂(q - 1) ≥ t_A(b) + 1`. -/
theorem two_adic_survival {A : Type} [CommGroup A] [Finite A] (b : A) (q : ℕ) (hq : Odd q)
    (hq1 : 1 < q) :
    (∃ h : A, h ^ (q - 1) = b ^ ((q - 1) / 2)) ↔
      obstructionThreshold b + 1 ≤ padicValNat 2 (q - 1) := by
  sorry

/-- `all_fixed_fibers_test`, a negative control for the count: in `C₄` with `b` a generator and
`q = 3`, the equation `h ^ 2 = b` has no solution although `A[2]` has two elements. -/
example : ¬ ∃ h : Multiplicative (ZMod 4), h ^ 2 = Multiplicative.ofAdd 1 := by
  sorry

/-- `two_adic_survival_test_2`: in `C₂` with `b` the generator, `q = 3` gives `h ^ 2 = b`, which has
no solution, while `q = 5` gives `h ^ 4 = b ^ 2`, solved by `h = 1`. -/
example : (¬ ∃ h : Multiplicative (ZMod 2), h ^ 2 = Multiplicative.ofAdd 1) ∧
    ∃ h : Multiplicative (ZMod 2), h ^ 4 = (Multiplicative.ofAdd (1 : ZMod 2)) ^ 2 := by
  sorry

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
  sorry

/-- The same map with `W = B` has all of `F₂` as kernel. -/
example : LinearMap.ker (jointParityMap (0 : ZMod 2 →ₗ[ZMod 2] ZMod 2) LinearMap.id ⊤) = ⊤ := by
  sorry

/-- **Ranks count surviving parities** (RS.4.17): a translate of the kernel of a linear map on a
finite `F₂`-space has `2 ^ (dim V - rank L)` elements. -/
theorem rank_parity_count {V W : Type} [AddCommGroup V] [Module (ZMod 2) V] [Finite V]
    [AddCommGroup W] [Module (ZMod 2) W] (L : V →ₗ[ZMod 2] W) (v₀ : V) :
    Nat.card {v : V // v - v₀ ∈ LinearMap.ker L} =
      2 ^ (Module.finrank (ZMod 2) V - Module.finrank (ZMod 2) (LinearMap.range L)) := by
  sorry

/-- **The weight enumerator of a surviving parity coset** (RS.4.18): for a set `C` of parity
vectors and a lower bound `N₀`, `Σ_{ε ∈ C} X ^ wt(ε + N₀ · 1)`. -/
def parityWeightEnumerator {N : ℕ} (C : Finset (Fin N → ZMod 2)) (N₀ : ℕ) : Polynomial ℕ :=
  ∑ ε ∈ C, Polynomial.X ^ (Finset.univ.filter fun i => ε i + (N₀ : ZMod 2) ≠ 0).card

/-- `parityWeightEnumerator_test_2`: for `N = 1`, `N₀ = 0`, the coset `{1}` gives `X`. -/
example : parityWeightEnumerator ({fun _ => 1} : Finset (Fin 1 → ZMod 2)) 0 = Polynomial.X := by
  sorry

/-- `parityWeightEnumerator_test_3`: the cosets `{0}` and `{1}` have equal size but different
enumerators (`1` and `X`). -/
example : parityWeightEnumerator ({fun _ => 0} : Finset (Fin 1 → ZMod 2)) 0 ≠
    parityWeightEnumerator ({fun _ => 1} : Finset (Fin 1 → ZMod 2)) 0 := by
  sorry

/-- `rank_parity_count_test`: the cosets `{0, e₁ + e₂}` and `{e₁, e₂}` of `F₂²` give `1 + X²` and
`2X`. -/
example :
    parityWeightEnumerator ({![0, 0], ![1, 1]} : Finset (Fin 2 → ZMod 2)) 0 =
        1 + Polynomial.X ^ 2 ∧
      parityWeightEnumerator ({![1, 0], ![0, 1]} : Finset (Fin 2 → ZMod 2)) 0 =
        2 * Polynomial.X := by
  sorry

end RS4

/-! ## Layer RS.6: certified finite examples -/

section RS6

open ReducedSchur

variable {G : Type} [Group G]

/-- **Coprime orders kill the Schur relations** (RS.6.1, `schurRelations_eq_bot_of_coprime`): if
every element of `c` has order prime to `|M(G)|`, then `Q_c = 0`. -/
theorem schurRelations_eq_bot_of_coprime [Finite G] (c : Set G)
    (hc : ∀ x ∈ c, Nat.Coprime (orderOf x) (Nat.card (Multiplier G))) :
    schurRelations c = ⊥ := by
  sorry

/-- **Odd-index-two homology reduction** (RS.6.1): if a normal subgroup of odd order has index
two, the multiplier has odd order and every set of elements of order at most two has trivial
Schur relations. The identification `M(G) ≅ M(H)_{C₂}` is the coinvariant form of
`integralHomology_hallPart_range` and `integralHomology_hallPart_ker`. -/
theorem odd_index_two_reduction [Finite G] (H : Subgroup G) [H.Normal] (hodd : Odd (Nat.card H))
    (hidx : H.index = 2) :
    Odd (Nat.card (Multiplier G)) ∧
      ∀ c : Set G, (∀ x ∈ c, x ^ 2 = 1) → schurRelations c = ⊥ := by
  sorry

/-- **Commutators of lifts define a homomorphism on the centraliser** (RS.6.2):
`κ(x, yz) = κ(x, y) κ(x, z)` for `y, z` commuting with `x`. -/
theorem centralizer_commutator_hom {A E : Type} [Group A] [Group E] (S : GroupExtension A E G)
    (hS : IsCentralExtension S) {x y z : G} (hy : Commute x y) (hz : Commute x z) :
    liftCommutator S (hy.mul_right hz) = liftCommutator S hy * liftCommutator S hz := by
  sorry

/-- The cyclic group of order two. -/
abbrev C₂ : Type := Multiplicative (ZMod 2)

/-- The factor swap of `G × G` squares to the identity. -/
theorem prodComm_two_nsmul :
    zmultiplesHom (Additive (MulAut (G × G))) (Additive.ofMul (MulEquiv.prodComm : G × G ≃* G × G))
      ((2 : ℕ) : ℤ) = 0 := by
  apply Additive.toMul.injective
  ext p <;> simp [two_zsmul, ← ofMul_mul, MulAut.mul_apply]

/-- The swap action of `C₂` on `G × G`. -/
def swapAction (G : Type) [Group G] : C₂ →* MulAut (G × G) :=
  AddMonoidHom.toMultiplicativeLeft
    (ZMod.lift 2 ⟨zmultiplesHom _ (Additive.ofMul MulEquiv.prodComm), prodComm_two_nsmul⟩)

/-- The nontrivial element of `C₂` acts by the factor swap. -/
theorem swapAction_ofAdd_one (G : Type) [Group G] :
    swapAction G (Multiplicative.ofAdd 1) = MulEquiv.prodComm := by
  have h := ZMod.lift_coe 2 ⟨zmultiplesHom _ (Additive.ofMul (MulEquiv.prodComm : G × G ≃* G × G)),
    prodComm_two_nsmul⟩ (1 : ℤ)
  rw [Int.cast_one] at h
  change Additive.toMul (ZMod.lift 2 _ 1) = _
  rw [h]
  simp

/-- The **swap wreath product** `W(G) = (G × G) ⋊ C₂`. -/
abbrev SwapWreath (G : Type) [Group G] : Type :=
  (G × G) ⋊[swapAction G] C₂

/-- The product map `G × G → Gᵃᵇ`, `(a, b) ↦ [a][b]`. -/
def abelianizedSum (G : Type) [Group G] : G × G →* Abelianization G :=
  Abelianization.of.comp (MonoidHom.fst G G) * Abelianization.of.comp (MonoidHom.snd G G)

/-- The swap does not change `[a][b]`. -/
theorem abelianizedSum_swap (g : C₂) :
    (abelianizedSum G).comp (MulEquiv.toMonoidHom (swapAction G g)) =
      (MulEquiv.toMonoidHom (MulAut.conj ((1 : C₂ →* Abelianization G) g))).comp
        (abelianizedSum G) := by
  have key : ∀ p : G × G, abelianizedSum G p.swap = abelianizedSum G p := fun p => by
    simp [abelianizedSum, mul_comm]
  have hs : ∀ (g : C₂) (p : G × G), swapAction G g p = p ∨ swapAction G g p = p.swap := by
    intro g p
    have : g = 1 ∨ g = Multiplicative.ofAdd 1 := by
      induction g using Multiplicative.rec with
      | ofAdd k => fin_cases k; exacts [Or.inl rfl, Or.inr rfl]
    rcases this with rfl | rfl
    · left; simp
    · right; rw [swapAction_ofAdd_one]; rfl
  ext p
  rcases hs g p with h | h <;> simp [h, key]

/-- The **sum-kernel model** (RS.6.9): the kernel of `W(G) → Gᵃᵇ`, `((a, b), t) ↦ [a][b]`. For
abelian `G` it is the anti-diagonal model `F(G)` of RS.6.8, and for perfect `G` it is all of
`W(G)`. -/
def sumKernelModel (G : Type) [Group G] : Subgroup (SwapWreath G) :=
  (SemidirectProduct.lift (abelianizedSum G) 1 abelianizedSum_swap).ker

/-- The **outside involutions** of a subgroup of `W(G)`: elements with nontrivial `C₂`
coordinate and square `1`. -/
def outsideInvolutions (F : Subgroup (SwapWreath G)) : Set F :=
  {x | (x : SwapWreath G).right ≠ 1 ∧ x ^ 2 = 1}

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
example : Nat.card (sumKernelModel (alternatingGroup (Fin 4))) = 96 := by
  sorry

/-- `sumKernelModel_test_1`, sum not difference: in `W(C₃)` the pair `((1, 2), 1)` (additive
residues) lies in the sum kernel and `((1, 1), 1)` does not. -/
example :
    (⟨(Multiplicative.ofAdd (1 : ZMod 3), Multiplicative.ofAdd 2), 1⟩ :
        SwapWreath (Multiplicative (ZMod 3))) ∈ sumKernelModel _ ∧
      (⟨(Multiplicative.ofAdd (1 : ZMod 3), Multiplicative.ofAdd 1), 1⟩ :
        SwapWreath (Multiplicative (ZMod 3))) ∉ sumKernelModel _ := by
  sorry

/-- **The anti-diagonal marking** (RS.6.8): for every abelian `G` the outside involutions generate
`F(G)`, and for finite `G` of odd order they form one conjugacy class. -/
theorem antidiagonal_marking (G : Type) [CommGroup G] :
    Subgroup.closure (outsideInvolutions (sumKernelModel G)) = ⊤ ∧
      (Finite G → Odd (Nat.card G) →
        ∀ x ∈ outsideInvolutions (sumKernelModel G), ∀ y ∈ outsideInvolutions (sumKernelModel G),
          IsConj x y) := by
  sorry

/-- **The reduced multiplier of the anti-diagonal model** (RS.6.8): for finite abelian `G` of odd
order, `M(F(G), c(G)) ≅ M(G)` (`≅ Λ²G`). -/
theorem antidiagonal_reduced_multiplier (G : Type) [CommGroup G] [Finite G]
    (hodd : Odd (Nat.card G)) :
    Nonempty (reducedMultiplier (outsideInvolutions (sumKernelModel G)) ≃+ Multiplier G) := by
  sorry

/-- `table_row_5`: for `G = C₃ × C₃` the reduced multiplier has three elements. -/
example : Nat.card (reducedMultiplier (outsideInvolutions
    (sumKernelModel (Multiplicative (ZMod 3) × Multiplicative (ZMod 3))))) = 3 := by
  sorry

/-- `table_row_25`: for `G = C₃³` the reduced multiplier has `27` elements. -/
example : Nat.card (reducedMultiplier (outsideInvolutions (sumKernelModel
    (Multiplicative (ZMod 3) × Multiplicative (ZMod 3) × Multiplicative (ZMod 3))))) = 27 := by
  sorry

/-- `table_row_1`: for `G = C₃` the anti-diagonal model is `S₃` and the reduced multiplier is
trivial. -/
example : Nat.card (reducedMultiplier (outsideInvolutions
    (sumKernelModel (Multiplicative (ZMod 3))))) = 1 := by
  sorry

/-- `table_row_8` (and `order96_reduced_multiplier`, RS.6.7): the order-96 type has reduced
multiplier of order two. -/
theorem order96_reduced_multiplier :
    Nat.card (reducedMultiplier
      (outsideInvolutions (sumKernelModel (alternatingGroup (Fin 4))))) = 2 := by
  sorry

/-- `table_row_29`: the full wreath product `A₅ ≀ C₂` has reduced multiplier of order two. -/
theorem table_row_29 :
    Nat.card (reducedMultiplier
      (outsideInvolutions (sumKernelModel (alternatingGroup (Fin 5))))) = 2 := by
  sorry

end RS6

/-!
## Statements not typed at the pins

The following targets are stated in the README and are not declarations here, because their
carriers are constructions that the pinned libraries do not have:

* RS.0: `integralEvaluation_mk`, `integralEvaluation_map_group`, `integralEvaluation_map_coeff`,
  `extensionClassMap_apply`, `extensionClassMap_natural`, `extensionClassMap_eq_zero_of_splitting`,
  `integralEvaluation_bijective_of_free`, `integralEvaluation_bijective_of_divisible` (the universal
  coefficient map and the class map are InverseGalois's), `extensionClassMap_exact`
  with `extensionClassMap_exact_left`, `extensionClassMap_exact_mid`,
  `extensionClassMap_surjective_of_stem`, `extensionFiveTerm_general`, and the coinvariant form of
  `integralHomology_hallPart` with `multiplier_hallPart`.
* RS.1: `localClassNormalization` and its API, `homology_image`.
* RS.3: `kernel_action_aut`, `finite_level_action`, the twisted slices and `degreeOrbitSet_slice`.
* RS.4: `squareObstruction`, `fixed_fiber_equation`, `all_fixed_fibers`, `odd_parity_fiber`,
  `even_parity_fiber`, `lift_square_columns`, `paritySquareMap`, `affine_compatible_parities`,
  `surviving_parities`, `independent_classes` (each is a statement about the fibres of the marked
  fibre product of a reduced cover).
* RS.6: `centralizer_generator_relations`, `ReductionCertificate`, `finiteParityAlgorithm`, the
  graph models, the explicit embedding of `order96Type`, and the remaining rows `table_row_k` of
  Wood's Table 2. The marked groups `antidiagonalModel` and `order96Type` appear above as
  `sumKernelModel G` for commutative `G` and as `sumKernelModel (alternatingGroup (Fin 4))`, each
  marked by `outsideInvolutions`.
-/

end TauCetiRoadmap.InductionRestrictionPartII
