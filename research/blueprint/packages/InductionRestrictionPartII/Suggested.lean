import Mathlib
import TauCeti.GroupTheory.GroupExtension.Cohomology
import TauCeti.Algebra.Group.ElementaryTwoQuotient.Basic

/-!
# Induction, restriction and Mackey theory, Part II: reduced Schur covers and marked extensions — representative target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is `README.md`.
The file records the light definitions of the roadmap and the theorem signatures that can be
stated against the pinned Mathlib and Tau Ceti, so that contributors and reviewers converge on
names and signatures. Every proof is `sorry`. The heavy constructions (the evaluation of
cohomology classes on cycles and the class map of a central extension, Schur covers, reduced
covers, the power action and its corrections, finite certificates) are README targets and do not
appear here; neither do the API lemmas and checks listed in the README.

Design choices made explicit here:

* `Multiplier G` is Mathlib's `groupHomology.H2 (Rep.trivial ℤ G ℤ)`, the integral Schur
  multiplier `H₂(G, ℤ)`, written additively. It is not Tau Ceti's `schurMultiplier k G`, which is
  `H²(G, kˣ)`.
* Commutators are `⁅X, Y⁆ = X * Y * X⁻¹ * Y⁻¹` (Mathlib's `commutatorElement`). The oriented
  commuting-pair class of commuting `x, y` is the class of the cycle `[x|y] - [y|x]`.
* A central extension is a Mathlib `GroupExtension` together with the predicate
  `IsCentralExtension`; centrality is never built into the carrier.
* The class lattice of a conjugacy-invariant set `c` is `ClassIndex c →₀ ℤ`, where `ClassIndex c`
  is the set of conjugacy classes meeting `c`; degrees are integers.
* The marked groups of the examples are subgroups of the swap wreath product
  `(G × G) ⋊ C₂`, with `C₂ = Multiplicative (ZMod 2)`.
-/

noncomputable section

open CategoryTheory
open scoped commutatorElement

namespace TauCetiRoadmap.InductionRestrictionPartII

/-! ## Layer RS.0: integral degree-two homology of groups and central extensions -/

section RS0

/-- The integral Schur multiplier `M(G) = H₂(G, ℤ)`, Mathlib's second group homology of the trivial
integral representation. -/
abbrev Multiplier (G : Type) [Group G] : Type :=
  groupHomology.H2 (Rep.trivial ℤ G ℤ)

/-- The map `M(G) → M(H)` induced by a group homomorphism (with the identity on the trivial
integral coefficients). -/
def multiplierMap {G H : Type} [Group G] [Group H] (f : G →* H) :
    Multiplier G →+ Multiplier H :=
  (groupHomology.map (A := Rep.trivial ℤ G ℤ) (B := Rep.trivial ℤ H ℤ) f (𝟙 _) 2).hom.toAddMonoidHom

variable {A E G : Type} [Group A] [Group E] [Group G]

/-- A group extension is **central** when its kernel lies in the centre of the total group.
Belongs to Layer RS.0; it is a separate hypothesis, never part of `GroupExtension`. -/
def IsCentralExtension (S : GroupExtension A E G) : Prop :=
  S.inl.range ≤ Subgroup.center E

/-- A central extension is **stem** when its kernel also lies in the commutator subgroup. -/
def IsStemExtension (S : GroupExtension A E G) : Prop :=
  IsCentralExtension S ∧ S.inl.range ≤ commutator E

/-- The pairing of a function `G × G → B` with an integral 2-chain:
`⟨φ, Σ n_(g,h) [g|h]⟩ = Σ n_(g,h) • φ (g, h)`. On cocycles and cycles it descends to the
evaluation `H²(G, B) → Hom(M(G), B)` of RS.0.1. -/
def cyclePairing {B : Type} [AddCommGroup B] (φ : G × G → B) (z : G × G →₀ ℤ) : B :=
  z.sum fun p n => n • φ p

/-- **A cocycle pairs to zero with every boundary** (RS.0.1): the pairing descends to homology. -/
theorem cyclePairing_boundary {B : Type} [AddCommGroup B]
    (φ : G × G → B) (hφ : φ ∈ groupCohomology.cocycles₂ (Rep.trivial ℤ G B))
    (z : G × G →₀ ℤ) (hz : z ∈ groupHomology.boundaries₂ (Rep.trivial ℤ G ℤ)) :
    cyclePairing φ z = 0 := by
  sorry

/-- **A coboundary pairs to zero with every cycle** (RS.0.1): the pairing descends to
cohomology. -/
theorem cyclePairing_coboundary {B : Type} [AddCommGroup B]
    (φ : G × G → B) (hφ : φ ∈ groupCohomology.coboundaries₂ (Rep.trivial ℤ G B))
    (z : G × G →₀ ℤ) (hz : z ∈ groupHomology.cycles₂ (Rep.trivial ℤ G ℤ)) :
    cyclePairing φ z = 0 := by
  sorry

/-- `integralEvaluation_test_1`: for `ℤ²` (written multiplicatively) and the bilinear cocycle
`φ((a,b),(c,d)) = ad`, the oriented commuting cycle of the basis pairs to `1`. -/
example :
    let G := Multiplicative (ℤ × ℤ)
    let x : G := Multiplicative.ofAdd (1, 0)
    let y : G := Multiplicative.ofAdd (0, 1)
    cyclePairing (G := G) (fun p => p.1.toAdd.1 * p.2.toAdd.2)
      (Finsupp.single (x, y) 1 - Finsupp.single (y, x) 1) = 1 := by
  sorry

/-- **The tail of the five-term sequence** (RS.0.4): for any extension, `Eᵃᵇ → Gᵃᵇ` is onto. -/
theorem abelianization_map_surjective (S : GroupExtension A E G) :
    Function.Surjective (Abelianization.map S.rightHom) := by
  sorry

/-- **Exactness at `Eᵃᵇ`** (RS.0.4): the kernel of `Eᵃᵇ → Gᵃᵇ` is the image of the kernel. -/
theorem abelianization_exact_of_extension (S : GroupExtension A E G) :
    (Abelianization.map S.rightHom).ker = (Abelianization.of.comp S.inl).range := by
  sorry

/-- **Stem extensions do not change the abelianization** (RS.0.4, `abelianization_equiv_of_stem`). -/
theorem abelianization_map_bijective_of_stem (S : GroupExtension A E G) (hS : IsStemExtension S) :
    Function.Bijective (Abelianization.map S.rightHom) := by
  sorry

/-- `extensionFiveTerm_test_4`: centrality is not needed for the tail; for `S₃ → C₂` the kernel
`A₃` dies in the abelianization. -/
example : (Abelianization.of.comp (alternatingGroup (Fin 3)).subtype).range = ⊥ := by
  sorry

/-- **Positive-degree integral homology of a finite group is killed by its order** (RS.0.6). -/
theorem integralHomology_card_smul (G : Type) [Group G] [Finite G] (n : ℕ)
    (z : groupHomology (Rep.trivial ℤ G ℤ) (n + 1)) : Nat.card G • z = 0 := by
  sorry

/-- **Positive-degree integral homology of a finite group is finite** (RS.0.6). -/
theorem integralHomology_finite (G : Type) [Group G] [Finite G] (n : ℕ) :
    Finite (groupHomology (Rep.trivial ℤ G ℤ) (n + 1)) := by
  sorry

/-- `integralHomology_test_3`: degree zero is excluded; `H₀(C₂, ℤ) ≅ ℤ` is infinite. -/
example : Infinite (groupHomology (Rep.trivial ℤ (Multiplicative (ZMod 2)) ℤ) 0) := by
  sorry

/-- **The complement part of the multiplier of a coprime semidirect product** (RS.0.7,
`multiplier_complementPart`): the projection induces a surjection `M(H ⋊ Γ) → M(Γ)` whose kernel
is the part of `M(H ⋊ Γ)` killed by a power of `|H|`. -/
theorem multiplier_complementPart {H Γ : Type} [Group H] [Group Γ] [Finite H] [Finite Γ]
    (φ : Γ →* MulAut H) (hcop : Nat.Coprime (Nat.card H) (Nat.card Γ)) :
    Function.Surjective (multiplierMap (SemidirectProduct.rightHom (φ := φ))) ∧
      ∀ z : Multiplier (H ⋊[φ] Γ),
        multiplierMap (SemidirectProduct.rightHom (φ := φ)) z = 0 ↔
          ∃ k : ℕ, (Nat.card H) ^ k • z = 0 := by
  sorry

/-- **Complements of a normal Hall subgroup with cyclic quotient are conjugate** (RS.0.8). -/
theorem complement_conj_of_cyclic_quotient (G : Type) [Group G] [Finite G]
    (H : Subgroup G) [H.Normal] (hcop : Nat.Coprime (Nat.card H) H.index)
    (hcyc : IsCyclic (G ⧸ H)) (C K : Subgroup G)
    (hC : Subgroup.IsComplement' H C) (hK : Subgroup.IsComplement' H K) :
    ∃ h ∈ H, K = C.map (MulAut.conj h).toMonoidHom := by
  sorry

/-- **Cyclic coprime complements in a semidirect product** (RS.0.8): a subgroup on which the
projection is bijective is conjugate to the standard complement by one element of `H`, pointwise. -/
theorem cyclic_coprime_complement_conjugacy {H C : Type} [Group H] [Group C] [Finite H] [Finite C]
    [IsCyclic C] (φ : C →* MulAut H) (hcop : Nat.Coprime (Nat.card H) (Nat.card C))
    (K : Subgroup (H ⋊[φ] C))
    (hK : Function.Bijective ((SemidirectProduct.rightHom (φ := φ)).comp K.subtype)) :
    ∃ h : H, ∀ c : C,
      SemidirectProduct.inl h * SemidirectProduct.inr c * (SemidirectProduct.inl h)⁻¹ ∈ K := by
  sorry

/-- `cyclicComplement_test_3`, a negative control: without coprimality the conclusion fails; in
`C₂ × C₂` (trivial action) the diagonal is not conjugate to the second factor. -/
example :
    let C := Multiplicative (ZMod 2)
    let K : Subgroup (C ⋊[1] C) :=
      Subgroup.zpowers ⟨Multiplicative.ofAdd 1, Multiplicative.ofAdd 1⟩
    ¬ ∃ h : C, ∀ c : C,
      SemidirectProduct.inl h * SemidirectProduct.inr c * (SemidirectProduct.inl h)⁻¹ ∈ K := by
  sorry

end RS0

/-! ## Layer RS.1: commuting-pair classes and reduced Schur covers -/

section RS1

variable {A E G : Type} [Group A] [Group E] [Group G]

/-- The commutator `⁅X, Y⁆ = X Y X⁻¹ Y⁻¹` of the chosen lifts of `x` and `y` to `E`. For commuting
`x, y` it lies in the kernel and, in a central extension, does not depend on the lifts. -/
def liftCommutatorElem (S : GroupExtension A E G) (x y : G) : E :=
  ⁅Function.surjInv S.rightHom_surjective x, Function.surjInv S.rightHom_surjective y⁆

/-- For commuting `x, y`, the commutator of lifts lies in the image of the kernel. -/
theorem liftCommutatorElem_mem_range (S : GroupExtension A E G) {x y : G} (h : Commute x y) :
    liftCommutatorElem S x y ∈ S.inl.range := by
  sorry

/-- **The commutator of lifts** `κ_E(x, y) ∈ A` of commuting `x, y` (RS.1.1):
`S.inl (liftCommutator S h) = X Y X⁻¹ Y⁻¹` for the chosen lifts `X, Y`. -/
def liftCommutator (S : GroupExtension A E G) {x y : G} (h : Commute x y) : A :=
  (MonoidHom.ofInjective S.inl_injective).symm
    ⟨liftCommutatorElem S x y, liftCommutatorElem_mem_range S h⟩

/-- `liftCommutator_independent`: in a central extension any lifts give the same commutator. -/
theorem liftCommutator_inl (S : GroupExtension A E G) (hS : IsCentralExtension S) {x y : G}
    (h : Commute x y) (X Y : E) (hX : S.rightHom X = x) (hY : S.rightHom Y = y) :
    S.inl (liftCommutator S h) = ⁅X, Y⁆ := by
  sorry

/-- `liftCommutator_test_1`: the commutator of a lift of `1` with anything is trivial. -/
example (S : GroupExtension A E G) (hS : IsCentralExtension S) (y : G) :
    liftCommutator S (Commute.one_left y) = 1 := by
  sorry

/-- `liftCommutator_test_3`: in the dihedral extension `C₂ → D₈ → C₂ × C₂` the lifts of the two
generators have nontrivial commutator: in `D₈` itself, `⁅r, s⁆ = r²` is the central involution. -/
example : ⁅(DihedralGroup.r (1 : ZMod 4)), DihedralGroup.sr (0 : ZMod 4)⁆ = DihedralGroup.r 2 := by
  sorry

/-- The oriented integral 2-chain `[x|y] - [y|x]`. -/
def commutingPairCycle (x y : G) : G × G →₀ ℤ :=
  Finsupp.single (x, y) 1 - Finsupp.single (y, x) 1

/-- **The oriented commuting-pair cycle** (RS.1.2): for commuting `x, y`, `[x|y] - [y|x]` is a
2-cycle with trivial integral coefficients. -/
theorem commutingPairCycle_mem {x y : G} (h : Commute x y) :
    commutingPairCycle x y ∈ groupHomology.cycles₂ (Rep.trivial ℤ G ℤ) := by
  sorry

/-- **The universal homological commutator** `⟨x, y⟩ ∈ M(G)` of commuting `x, y` (RS.1.3). -/
def homologicalCommutator {x y : G} (h : Commute x y) : Multiplier G :=
  groupHomology.H2π (Rep.trivial ℤ G ℤ) ⟨commutingPairCycle x y, commutingPairCycle_mem h⟩

/-- `homologicalCommutator_swap`: `⟨y, x⟩ = -⟨x, y⟩`. -/
theorem homologicalCommutator_swap {x y : G} (h : Commute x y) :
    homologicalCommutator h.symm = -homologicalCommutator h := by
  sorry

/-- `homologicalCommutator_map`: `f_* ⟨x, y⟩ = ⟨f x, f y⟩`. -/
theorem homologicalCommutator_map {H : Type} [Group H] (f : G →* H) {x y : G} (h : Commute x y) :
    multiplierMap f (homologicalCommutator h) = homologicalCommutator (h.map f) := by
  sorry

/-- **Commuting-pair classes respect orders** (RS.1.4, `commutator_order`):
`⟨xⁿ, y⟩ = n • ⟨x, y⟩`. Proved by an explicit 3-chain whose boundary is
`n • ([x|y] - [y|x]) - ([xⁿ|y] - [y|xⁿ])`. -/
theorem commutator_order {x y : G} (h : Commute x y) (n : ℕ) :
    homologicalCommutator (h.pow_left n) = n • homologicalCommutator h := by
  sorry

/-- `homologicalCommutator_test_1`: `⟨1, y⟩ = 0`. -/
example (y : G) : homologicalCommutator (Commute.one_left y) = 0 := by
  sorry

/-- **The Schur commutator relations** `Q_c` (RS.1.5): the subgroup of `M(G)` generated by the
classes `⟨x, y⟩` with `x ∈ c` and `y` commuting with `x`. -/
def schurRelations (c : Set G) : AddSubgroup (Multiplier G) :=
  AddSubgroup.closure
    {z | ∃ x ∈ c, ∃ y : G, ∃ h : Commute x y, z = homologicalCommutator h}

/-- `schurRelations_mono`: `c ⊆ d` gives `Q_c ≤ Q_d`. -/
theorem schurRelations_mono {c d : Set G} (hcd : c ⊆ d) : schurRelations c ≤ schurRelations d := by
  sorry

/-- `schurRelations_map`: `f(c) ⊆ d` gives `f_*(Q_c) ≤ Q_d`. -/
theorem schurRelations_map {H : Type} [Group H] (f : G →* H) {c : Set G} {d : Set H}
    (hcd : f '' c ⊆ d) : (schurRelations c).map (multiplierMap f) ≤ schurRelations d := by
  sorry

/-- `schurRelations_test_1`: `Q_∅ = 0`. -/
example : schurRelations (∅ : Set G) = ⊥ := by
  sorry

/-- **The reduced Schur multiplier** `M(G, c) = M(G) / Q_c` (RS.1.6). -/
abbrev ReducedMultiplier (c : Set G) : Type :=
  Multiplier G ⧸ schurRelations c

/-- `reducedMultiplier_test_3`, first half: `M(C₂ × C₂) ≅ C₂`, so `M(C₂ × C₂, ∅)` has two
elements. -/
example :
    Nat.card (ReducedMultiplier
      (∅ : Set (Multiplicative (ZMod 2) × Multiplicative (ZMod 2)))) = 2 := by
  sorry

/-- `reducedMultiplier_test_3`, second half: marking one nonidentity element kills the
multiplier of `C₂ × C₂`. -/
example :
    Nat.card (ReducedMultiplier
      ({(Multiplicative.ofAdd 1, 1)} : Set (Multiplicative (ZMod 2) × Multiplicative (ZMod 2)))) =
      1 := by
  sorry

/-- `reducedMultiplier_test_2`: for a finite cyclic group the reduced multiplier is trivial. -/
example (n : ℕ) [NeZero n] (c : Set (Multiplicative (ZMod n))) :
    Nat.card (ReducedMultiplier c) = 1 := by
  sorry

/-- The image of `Q_c` in the kernel of an extension under an additive map `τ : M(G) → A`
(the class map of a Schur cover, RS.0.5); the reduced cover `S_c` of RS.1.7 is the quotient of
`E` by this subgroup. -/
def reducedCoverRelations {A E G : Type} [CommGroup A] [Group E] [Group G]
    (S : GroupExtension A E G) (τ : Multiplier G →+ Additive A) (c : Set G) : Subgroup E :=
  (AddSubgroup.toSubgroup' ((schurRelations c).map τ)).map S.inl

end RS1

/-! ## Layer RS.2: universal marked extensions and degree -/

section RS2

variable {A E G : Type} [Group A] [Group E] [Group G]

/-- A set `c ⊆ G` is closed under conjugation. -/
def ConjInvariant (c : Set G) : Prop :=
  ∀ g x : G, x ∈ c → g * x * g⁻¹ ∈ c

/-- **A `c`-marked central extension** (RS.2.1): a central extension with a marking `c → E` over
the inclusion, equivariant for conjugation by every lift. -/
structure MarkedExtension (A E G : Type) [Group A] [Group E] [Group G] (c : Set G) where
  /-- The underlying extension. -/
  toExtension : GroupExtension A E G
  /-- Its kernel is central. -/
  central : IsCentralExtension toExtension
  /-- The marked lifts. -/
  mark : c → E
  /-- Each marked lift lies over its element. -/
  mark_over : ∀ x : c, toExtension.rightHom (mark x) = x
  /-- Conjugating a marked lift by any `e` gives the marked lift of the conjugate element. -/
  mark_conj : ∀ (e : E) (x : c) (hx : toExtension.rightHom e * x * (toExtension.rightHom e)⁻¹ ∈ c),
    e * mark x * e⁻¹ = mark ⟨_, hx⟩

/-- **Marked morphisms** of `c`-marked central extensions: homomorphisms over `G` preserving the
marked lifts; no kernel map is fixed. -/
structure MarkedHom {c : Set G} {A' E' : Type} [Group A'] [Group E']
    (M : MarkedExtension A E G c) (N : MarkedExtension A' E' G c) where
  /-- The homomorphism of total groups. -/
  toHom : E →* E'
  /-- It lies over the identity of `G`. -/
  rightHom_toHom : ∀ e, N.toExtension.rightHom (toHom e) = M.toExtension.rightHom e
  /-- It preserves the markings. -/
  mark_eq : ∀ x : c, toHom (M.mark x) = N.mark x

/-- The relators `[x][y][x]⁻¹[x y x⁻¹]⁻¹` of the universal marked presentation. -/
def markedRelators (c : Set G) (hc : ConjInvariant c) : Set (FreeGroup c) :=
  {w | ∃ x y : c, w = FreeGroup.of x * FreeGroup.of y * (FreeGroup.of x)⁻¹ *
      (FreeGroup.of (⟨x * y * (x : G)⁻¹, hc x y y.2⟩ : c))⁻¹}

/-- **The universal marked presentation** `U(G, c)` (RS.2.2). -/
abbrev UniversalMarked (c : Set G) (hc : ConjInvariant c) : Type :=
  PresentedGroup (markedRelators c hc)

/-- The relators hold in `G`, so the inclusion `c → G` extends to `U(G, c)`. -/
theorem markedRelators_eval (c : Set G) (hc : ConjInvariant c) :
    ∀ r ∈ markedRelators c hc, FreeGroup.lift (fun x : c => (x : G)) r = 1 := by
  sorry

/-- The projection `π_U : U(G, c) → G`, `[x] ↦ x`. -/
def universalProjection (c : Set G) (hc : ConjInvariant c) : UniversalMarked c hc →* G :=
  PresentedGroup.toGroup (markedRelators_eval c hc)

/-- `universalMarked_test_2`: for `C₂` with `c` its nonidentity element, `U(G, c)` is infinite
(it is `ℤ`); imposing `[x]² = 1` would wrongly give `C₂`. -/
example : Infinite (UniversalMarked ({Multiplicative.ofAdd (1 : ZMod 2)} : Set _)
    (fun g x hx => by sorry)) := by
  sorry

/-- The conjugacy classes contained in `c` (the classes meeting `c`, for conjugation-invariant
`c`): the index set `D = c/G` of the class lattice. -/
def ClassIndex (c : Set G) : Type :=
  {d : ConjClasses G // ∃ x ∈ c, ConjClasses.mk x = d}

/-- The class of an element of `c`. -/
def ClassIndex.mk {c : Set G} (x : c) : ClassIndex c :=
  ⟨ConjClasses.mk x, x, x.2, rfl⟩

/-- **The class degree map** `δ : L → Gᵃᵇ` (RS.2.3) on the integer lattice `L = D →₀ ℤ`,
`δ(e_d) = [x_d]` for any representative `x_d` of `d`. -/
def classDegreeMap (c : Set G) : (ClassIndex c →₀ ℤ) →+ Additive (Abelianization G) :=
  Finsupp.liftAddHom fun d =>
    zmultiplesHom _ (Additive.ofMul (Abelianization.of (Quotient.out d.1 : G)))

/-- `classDegreeMap_basis`: `δ(e_[x]) = [x]`; conjugate representatives agree in `Gᵃᵇ`. -/
theorem classDegreeMap_basis {c : Set G} (x : c) :
    classDegreeMap c (Finsupp.single (ClassIndex.mk x) 1) = Additive.ofMul (Abelianization.of (x : G)) := by
  sorry

/-- `classDegreeMap_surjective`: `δ` is onto when `c` generates `G`. -/
theorem classDegreeMap_surjective {c : Set G} (hgen : Subgroup.closure c = ⊤) :
    Function.Surjective (classDegreeMap c) := by
  sorry

/-- The degree of a marked word, `deg [x] = e_[x]`; the relators have degree zero. -/
theorem markedRelators_degree (c : Set G) (hc : ConjInvariant c) :
    ∀ r ∈ markedRelators c hc,
      FreeGroup.lift (fun x : c => Multiplicative.ofAdd (Finsupp.single (ClassIndex.mk x) (1 : ℤ)))
        r = 1 := by
  sorry

/-- **The degree of a marked word** `deg : U(G, c) → Multiplicative L` (RS.2.4). -/
def universalDegree (c : Set G) (hc : ConjInvariant c) :
    UniversalMarked c hc →* Multiplicative (ClassIndex c →₀ ℤ) :=
  PresentedGroup.toGroup (markedRelators_degree c hc)

/-- `universalDegree_abelianization`: `δ ∘ deg` is the abelianized projection. -/
theorem universalDegree_abelianization (c : Set G) (hc : ConjInvariant c)
    (u : UniversalMarked c hc) :
    classDegreeMap c (universalDegree c hc u).toAdd =
      Additive.ofMul (Abelianization.of (universalProjection c hc u)) := by
  sorry

/-- **The presentation is a central extension** (RS.2.6): if `c` generates `G`, `π_U` is onto
and its kernel is central. -/
theorem universal_central (c : Set G) (hc : ConjInvariant c) (hgen : Subgroup.closure c = ⊤) :
    Function.Surjective (universalProjection c hc) ∧
      (universalProjection c hc).ker ≤ Subgroup.center (UniversalMarked c hc) := by
  sorry

/-- **The universal marked central extension** (RS.2.7): every `c`-marked central extension
receives exactly one homomorphism from `U(G, c)` over `G` sending `[x]` to the marked lift of `x`. -/
theorem universal_marked_property (c : Set G) (hc : ConjInvariant c) (M : MarkedExtension A E G c) :
    ∃! f : UniversalMarked c hc →* E,
      (∀ x : c, f (PresentedGroup.of x) = M.mark x) ∧
        M.toExtension.rightHom.comp f = universalProjection c hc := by
  sorry

/-- **The abelianization of the presentation** (RS.2.8): the degree induces
`U(G, c)ᵃᵇ ≅ Multiplicative L`. -/
theorem presentation_abelianization (c : Set G) (hc : ConjInvariant c) :
    Function.Bijective (Abelianization.lift (universalDegree c hc)) := by
  sorry

/-- **The marked fiber product** `P = S ×_{Gᵃᵇ} Multiplicative L` (RS.2.9) of a homomorphism
`π : S → G` (a reduced cover in the application): pairs `(h, m)` with `[π h] = δ(m)`. -/
def markedFiberProduct {S : Type} [Group S] (π : S →* G) (c : Set G) :
    Subgroup (S × Multiplicative (ClassIndex c →₀ ℤ)) :=
  MonoidHom.eqLocus ((Abelianization.of.comp π).comp (MonoidHom.fst _ _))
    ((AddMonoidHom.toMultiplicativeLeft (classDegreeMap c)).comp (MonoidHom.snd _ _))

/-- `markedFiberProduct_membership`. -/
theorem markedFiberProduct_membership {S : Type} [Group S] (π : S →* G) (c : Set G)
    (p : S × Multiplicative (ClassIndex c →₀ ℤ)) :
    p ∈ markedFiberProduct π c ↔
      Additive.ofMul (Abelianization.of (π p.1)) = classDegreeMap c p.2.toAdd := by
  sorry

/-- **Commutators of the marked fiber product** (RS.2.10): if `δ` is onto, `[P, P] = [S, S] × 1`. -/
theorem fiber_product_commutator {S : Type} [Group S] (π : S →* G) (c : Set G)
    (hδ : Function.Surjective (classDegreeMap c)) :
    (commutator (markedFiberProduct π c)).map (markedFiberProduct π c).subtype =
      (commutator S).prod ⊥ := by
  sorry

/-- **The abelianization of the marked fiber product** (RS.2.11): if `δ` is onto and `π` induces
an isomorphism on abelianizations, the degree projection induces `Pᵃᵇ ≅ Multiplicative L`. -/
theorem fiber_product_abelianization {S : Type} [Group S] (π : S →* G) (c : Set G)
    (hδ : Function.Surjective (classDegreeMap c))
    (hπ : Function.Bijective (Abelianization.map π)) :
    Function.Bijective
      (Abelianization.lift ((MonoidHom.snd _ _).comp (markedFiberProduct π c).subtype)) := by
  sorry

/-- `markedFiberProduct_test_3`: for `C₂` (identity cover, `c` its nonidentity element) the
pair `(nonidentity, 0)` is not in `P`, so `P` is not the full product. -/
example :
    let G := Multiplicative (ZMod 2)
    let c : Set G := {Multiplicative.ofAdd 1}
    (Multiplicative.ofAdd (1 : ZMod 2), (1 : Multiplicative (ClassIndex c →₀ ℤ))) ∉
      markedFiberProduct (MonoidHom.id G) c := by
  sorry

/-- **The kernel of the universal marked extension** `K(G, c) = ker π_U` (RS.2.16). -/
abbrev universalKernel (c : Set G) (hc : ConjInvariant c) : Subgroup (UniversalMarked c hc) :=
  (universalProjection c hc).ker

/-- `universalKernel_degree`: the degree image of `K` is `ker δ` (when `c` generates `G`). -/
theorem universalKernel_degree (c : Set G) (hc : ConjInvariant c) (hgen : Subgroup.closure c = ⊤) :
    (universalKernel c hc).map (universalDegree c hc) =
      (AddMonoidHom.toMultiplicativeLeft (classDegreeMap c)).ker := by
  sorry

/-- `universalKernel_test_3`: for `C₂` the kernel is infinite although `M(C₂, c) = 0`. -/
example : Infinite (universalKernel ({Multiplicative.ofAdd (1 : ZMod 2)} : Set _)
    (fun g x hx => by sorry)) := by
  sorry

end RS2

/-! ## Layer RS.3: discrete powers, twists and degree orbits -/

section RS3

variable {G : Type} [Group G]

/-- **The finite power action** (RS.3.1) of a unit modulo a common exponent `n` of `G`:
`g ↦ g ^ a` for the least nonnegative representative `a`. On a nonabelian group this is a
permutation of the underlying set, not a homomorphism. -/
def finitePower (n : ℕ) (α : (ZMod n)ˣ) (g : G) : G :=
  g ^ (α : ZMod n).val

/-- `finitePower_residue`: congruent exponents modulo `orderOf g` give the same power. -/
theorem finitePower_residue (n : ℕ) [NeZero n] (hn : ∀ g : G, g ^ n = 1) (α : (ZMod n)ˣ) (g : G)
    (a : ℕ) (ha : (a : ZMod n) = α) : finitePower n α g = g ^ a := by
  sorry

/-- `finitePower_compose`: `α * (β * g) = (αβ) * g`. -/
theorem finitePower_compose (n : ℕ) [NeZero n] (hn : ∀ g : G, g ^ n = 1) (α β : (ZMod n)ˣ)
    (g : G) : finitePower n α (finitePower n β g) = finitePower n (α * β) g := by
  sorry

/-- `finitePower_test_1`: on `C₃`, the unit `2` swaps the two nonidentity elements. -/
example : finitePower 3 (-1 : (ZMod 3)ˣ) (Multiplicative.ofAdd (1 : ZMod 3)) =
    Multiplicative.ofAdd 2 := by
  sorry

/-- `finitePower_test_3`, a negative control: on `S₃` inversion fixes the transpositions
`(0 1)` and `(1 2)` but not their product, so it is not a homomorphism. -/
example :
    finitePower 6 (-1 : (ZMod 6)ˣ) (Equiv.swap (0 : Fin 3) 1 * Equiv.swap 1 2) ≠
      finitePower 6 (-1) (Equiv.swap (0 : Fin 3) 1) * finitePower 6 (-1) (Equiv.swap (1 : Fin 3) 2) := by
  sorry

/-- **The power permutation of class degrees** (RS.3.2): a permutation of the classes acts on
the integer lattice by moving coordinates, `m ↦ m ∘ σ⁻¹`, never by scaling them. -/
def degreePermutation {D : Type} (σ : D ≃ D) : (D →₀ ℤ) ≃+ (D →₀ ℤ) :=
  Finsupp.domCongr σ

/-- `degreePermutation_test_2`: for the two classes of `C₃` swapped by the unit `2`, the degree
`(1, 4)` becomes `(4, 1)`. -/
example : degreePermutation (Equiv.swap (0 : Fin 2) 1) (Finsupp.equivFunOnFinite.symm ![1, 4]) =
    Finsupp.equivFunOnFinite.symm ![4, 1] := by
  sorry

/-- **The cyclotomic twist** `X⟨-1⟩` of a `B`-set `X` by a `B`-torsor `T` (RS.3.8): the
`B`-equivariant maps `T → X`. -/
abbrev CyclotomicTwist (B T X : Type) [Group B] [MulAction B T] [MulAction B X] : Type :=
  T →[B] X

/-- `cyclotomicTwist_evaluation`: for a torsor `T`, evaluation at a point is a bijection. -/
theorem cyclotomicTwist_evaluation {B T X : Type} [Group B] [MulAction B T]
    [MulAction B X] [MulAction.IsPretransitive B T] (hfree : ∀ (b : B) (t : T), b • t = t → b = 1)
    (t₀ : T) : Function.Bijective (fun f : CyclotomicTwist B T X => f t₀) := by
  sorry

/-- `cyclotomicTwist_test_2`: for `C₂` acting regularly on `X = T = C₂` there are exactly two
equivariant maps (arbitrary maps would give four). -/
example : Nat.card (CyclotomicTwist (Multiplicative (ZMod 2)) (Multiplicative (ZMod 2))
    (Multiplicative (ZMod 2))) = 2 := by
  sorry

/-- **The bounded total-degree slice** `L_{n, ≥ M}` (RS.3.9): degrees with every coordinate at
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

/-- **The power-fixed degree lattice** `L_{≡ q}` (RS.3.10): degree vectors fixed by the class
permutation of `q`. -/
def powerFixedDegree {D : Type} (σ : D ≃ D) : AddSubgroup (D →₀ ℤ) :=
  AddMonoidHom.eqLocus (degreePermutation σ).toAddMonoidHom (AddMonoidHom.id _)

/-- `powerFixedDegree_test_2`: for the swap of two classes the fixed vectors are `(a, a)`. -/
example (m : Fin 2 →₀ ℤ) : m ∈ powerFixedDegree (Equiv.swap (0 : Fin 2) 1) ↔ m 0 = m 1 := by
  sorry

end RS3

/-! ## Layer RS.4: fixed fibers, square obstructions and parity -/

section RS4

open TauCeti

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
definition by the torsion subgroup itself (without passing to `A / A²`) would not. -/
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
example : ¬ ∃ h : Multiplicative (ZMod 4), h ^ 2 = Multiplicative.ofAdd 1 := by
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

end RS4

/-! ## Layer RS.5: coprime semidirect products and compatible covers -/

section RS5

variable {H Γ : Type} [Group H] [Group Γ]

/-- **Split projections induce homology surjections** (RS.5.1). -/
theorem split_homology_surjection (φ : Γ →* MulAut H) :
    Function.Surjective (multiplierMap (SemidirectProduct.rightHom (φ := φ))) := by
  sorry

/-- **A coprime central extension splits uniquely** (RS.5.3, in the generality used): a central
extension of a finite group by a finite kernel of coprime order has exactly one splitting
homomorphism. -/
theorem central_coprime_splitting {A E G : Type} [Group A] [Group E] [Group G] [Finite A]
    [Finite G] (S : GroupExtension A E G) (hS : IsCentralExtension S)
    (hcop : Nat.Coprime (Nat.card A) (Nat.card G)) :
    ∃! s : G →* E, S.rightHom.comp s = MonoidHom.id G := by
  sorry

/-- The **equal-order inertia classes** of `H ⋊ Γ` (RS.5.7): nonidentity elements whose order
equals the order of their image in `Γ`. -/
def equalOrderInertia (φ : Γ →* MulAut H) : Set (H ⋊[φ] Γ) :=
  {g | g ≠ 1 ∧ orderOf g = orderOf g.right}

/-- **Admissible equal-order inertia classes** (RS.5.7): for finite `H`, `Γ` of coprime orders,
with `H` generated by the elements `h⁻¹ γ(h)`, the equal-order classes generate `H ⋊ Γ`, and two of
them are conjugate iff their images in `Γ` are. -/
theorem admissible_inertia_classes [Finite H] [Finite Γ] (φ : Γ →* MulAut H)
    (hcop : Nat.Coprime (Nat.card H) (Nat.card Γ))
    (hadm : Subgroup.closure {k : H | ∃ (h : H) (γ : Γ), k = h⁻¹ * φ γ h} = ⊤) :
    Subgroup.closure (equalOrderInertia φ) = ⊤ ∧
      ∀ g ∈ equalOrderInertia φ, ∀ g' ∈ equalOrderInertia φ, IsConj g g' ↔ IsConj g.right g'.right := by
  sorry

/-- `admissible_inertia_classes`, a negative control for the identity: `1` has the same order as
its image but is excluded. -/
example (φ : Γ →* MulAut H) : (1 : H ⋊[φ] Γ) ∉ equalOrderInertia φ := by
  sorry

/-- **Admissible semidirect abelianization** (RS.5.8): admissibility makes `(H ⋊ Γ)ᵃᵇ → Γᵃᵇ`
bijective. -/
theorem admissible_abelianization (φ : Γ →* MulAut H)
    (hadm : Subgroup.closure {k : H | ∃ (h : H) (γ : Γ), k = h⁻¹ * φ γ h} = ⊤) :
    Function.Bijective (Abelianization.map (SemidirectProduct.rightHom (φ := φ))) := by
  sorry

/-- **The Schur relation map is surjective** (RS.5.9): the projection carries `Q_c` onto `Q_d`,
`d = Γ ∖ {1}`. -/
theorem relations_surjection [Finite H] [Finite Γ] (φ : Γ →* MulAut H)
    (hcop : Nat.Coprime (Nat.card H) (Nat.card Γ)) :
    (schurRelations (equalOrderInertia φ)).map (multiplierMap (SemidirectProduct.rightHom (φ := φ))) =
      schurRelations {γ : Γ | γ ≠ 1} := by
  sorry

/-- **Compatible reduced multipliers** (RS.5.10): `M(H ⋊ Γ, c) → M(Γ, d)` is onto and its kernel
is killed by a power of `|H|`. -/
theorem reduced_kernel_primary [Finite H] [Finite Γ] (φ : Γ →* MulAut H)
    (hcop : Nat.Coprime (Nat.card H) (Nat.card Γ))
    (hadm : Subgroup.closure {k : H | ∃ (h : H) (γ : Γ), k = h⁻¹ * φ γ h} = ⊤) :
    ∃ f : ReducedMultiplier (equalOrderInertia φ) →+ ReducedMultiplier {γ : Γ | γ ≠ 1},
      Function.Surjective f ∧
      (∀ z, QuotientAddGroup.mk' _ (multiplierMap (SemidirectProduct.rightHom (φ := φ)) z) =
        f (QuotientAddGroup.mk' _ z)) ∧
      ∀ w, f w = 0 → ∃ k : ℕ, (Nat.card H) ^ k • w = 0 := by
  sorry

end RS5

/-! ## Layer RS.6: certified finite examples -/

section RS6

variable {G : Type} [Group G]

/-- **Odd-index-two homology reduction** (RS.6.1): if a normal subgroup of odd order has index
two, the multiplier has odd order and every set of involutions has trivial Schur relations. -/
theorem odd_index_two_reduction [Finite G] (H : Subgroup G) [H.Normal] (hodd : Odd (Nat.card H))
    (hidx : H.index = 2) :
    Odd (Nat.card (Multiplier G)) ∧
      ∀ c : Set G, (∀ x ∈ c, x ^ 2 = 1) → schurRelations c = ⊥ := by
  sorry

/-- **Commutators define a centraliser homomorphism** (RS.6.2): `κ(x, yz) = κ(x, y) κ(x, z)` for
`y, z` commuting with `x`. -/
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
  sorry

/-- The swap action of `C₂` on `G × G`. -/
def swapAction (G : Type) [Group G] : C₂ →* MulAut (G × G) :=
  AddMonoidHom.toMultiplicativeLeft
    (ZMod.lift 2 ⟨zmultiplesHom _ (Additive.ofMul MulEquiv.prodComm), prodComm_two_nsmul⟩)

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
  sorry

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

/-- **The anti-diagonal marking** (RS.6.8): for abelian `G`, the outside involutions generate
`F(G)`, and for odd order they form one conjugacy class. -/
theorem antidiagonal_marking (G : Type) [CommGroup G] [Finite G] (hodd : Odd (Nat.card G)) :
    Subgroup.closure (outsideInvolutions (sumKernelModel G)) = ⊤ ∧
      ∀ x ∈ outsideInvolutions (sumKernelModel G), ∀ y ∈ outsideInvolutions (sumKernelModel G),
        IsConj x y := by
  sorry

/-- **The reduced multiplier of the anti-diagonal model** (RS.6.8): for finite abelian `G` of odd
order, `M(F(G), c(G)) ≅ M(G)` (`≅ Λ²G`). -/
theorem antidiagonal_reduced_multiplier (G : Type) [CommGroup G] [Finite G]
    (hodd : Odd (Nat.card G)) :
    Nonempty (ReducedMultiplier (outsideInvolutions (sumKernelModel G)) ≃+ Multiplier G) := by
  sorry

/-- `table_row_5`: for `G = C₃ × C₃` the reduced multiplier has three elements. -/
example : Nat.card (ReducedMultiplier (outsideInvolutions
    (sumKernelModel (Multiplicative (ZMod 3) × Multiplicative (ZMod 3))))) = 3 := by
  sorry

/-- `table_row_25`: for `G = C₃³` the reduced multiplier has `27` elements. -/
example : Nat.card (ReducedMultiplier (outsideInvolutions (sumKernelModel
    (Multiplicative (ZMod 3) × Multiplicative (ZMod 3) × Multiplicative (ZMod 3))))) = 27 := by
  sorry

/-- `table_row_8` (and `order96_reduced_multiplier`, RS.6.7): the order-96 type has reduced
multiplier of order two. -/
theorem order96_reduced_multiplier :
    Nat.card (ReducedMultiplier (outsideInvolutions (sumKernelModel (alternatingGroup (Fin 4))))) =
      2 := by
  sorry

/-- `table_row_29`: the full wreath product `A₅ ≀ C₂` has reduced multiplier of order two. -/
theorem table_row_29 :
    Nat.card (ReducedMultiplier (outsideInvolutions (sumKernelModel (alternatingGroup (Fin 5))))) =
      2 := by
  sorry

end RS6

/-!
## Statements not typed at the pins

The following targets are stated in the README and are not declarations here, because their
carriers are constructions that the pinned libraries do not have (formalising them is the work
the roadmap plans):

* RS.0: `integralEvaluation` and its API, `integralExtInclusion`,
  `integralEvaluation_surjective`, `integralEvaluation_ker`, `integralEvaluation_bijective_of_free`,
  `integralEvaluation_bijective_of_divisible`; `extensionClassMap` with
  `extensionClassMap_commutator` and `extensionClassMap_natural`; `extensionClassMap_exact_left`,
  `extensionClassMap_exact_mid`, `extensionClassMap_surjective_of_stem`; `IsSchurCover`,
  `isSchurCover_of_stem_card`, `isSchurCover_of_representationGroup`, `exists_isSchurCover`;
  `multiplier_primaryDecomposition`, `multiplier_hallPart`; `cyclic_subgroup_conj_to_complement`.
* RS.1: `ReducedCover` (the quotient of a Schur cover by `reducedCoverRelations` for its class
  map) and its API, `centralizer_lifts`, `conjugacy_bijection`, `classCompatibleMarking`,
  `localClassNormalization`, `local_factors_commute`, `homology_image`, `homology_composite_zero`,
  `homologicalCommutator_central_extension`.
* RS.2: `word_conjugation`, `marked_pullback_split`, `markingCorrection`,
  `fiber_product_universal`, `presentation_comparison`, the product decomposition of
  `universalKernel`.
* RS.3: `centralPowerCorrection`, `correction_cocycle`, `discreteAction`, `kernel_action_aut`,
  `finite_level_action`, `DegreeOrbitSet`.
* RS.4: `squareObstruction`, `involution_square_central`, `fixed_fiber_equation`,
  `all_fixed_fibers`, `odd_parity_fiber`, `even_parity_fiber`, `lift_square_columns`,
  `paritySquareMap`, `affine_compatible_parities`, `surviving_parities`, `independent_classes`
  (each is a statement about the fibers of the marked fiber product of a reduced cover).
* RS.5: `compatibleCovers`, `hall_preimage_normal`, `multiplier_kernel_primary` (its multiplier
  form is `multiplier_complementPart` above), `compatible_correction`.
* RS.6: `ReductionCertificate`, `finiteParityAlgorithm`, `centralizer_generator_relations`, the
  graph models, and the remaining rows `table_row_k` of Wood's Table 2.
-/

end TauCetiRoadmap.InductionRestrictionPartII
