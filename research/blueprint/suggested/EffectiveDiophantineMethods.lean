/-
This file is not the roadmap and is not exhaustive. The roadmap document is
definitive. These statements suggest Lean forms so contributors and reviewers
can converge on names and signatures. They do not constitute implementation.

ED.5 checkpoint: finite quotient sieve and its lifting step. All quotients,
subgroups, homomorphisms and finite sets below are native Mathlib objects.
The geometry producing the reduction data is not prototyped here.
The classical instances support mathematical signatures, not an executable
implementation of quotient enumeration or Jacobian arithmetic.
-/
import Mathlib.GroupTheory.QuotientGroup.Defs
import Mathlib.GroupTheory.FiniteAbelian.Basic
import Mathlib.GroupTheory.OrderOfElement
import Mathlib.Data.Int.GCD
import Mathlib.Data.Finset.Union
import Mathlib.Data.Finset.Card
import Mathlib.Data.ZMod.Basic

noncomputable section
attribute [local instance] Classical.propDecidable
namespace TauCeti.MordellWeilSieve

variable {Γ ι : Type*} [AddCommGroup Γ]
variable {G : ι → Type*} [∀ i, AddCommGroup (G i)]

-- ED.5/admissible-classes
def admissibleClasses (S : Finset ι) (L : AddSubgroup Γ) [Fintype (Γ ⧸ L)]
    (φ : ∀ i, Γ →+ G i) (X : ∀ i, Finset (G i)) : Finset (Γ ⧸ L) := sorry

-- API: the native expression specifies the entire construction.
theorem admissibleClasses_eq_filter (S : Finset ι) (L : AddSubgroup Γ)
    [Fintype (Γ ⧸ L)] (φ : ∀ i, Γ →+ G i) (X : ∀ i, Finset (G i)) :
    admissibleClasses S L φ X = Finset.univ.filter (fun a => ∀ i ∈ S,
      QuotientAddGroup.map L (L.map (φ i)) (φ i) (AddSubgroup.le_comap_map (φ i) L) a ∈
        (X i).image (QuotientAddGroup.mk' (L.map (φ i)))) := sorry

-- ED.5/membership
theorem mem_admissibleClasses (S : Finset ι) (L : AddSubgroup Γ)
    [Fintype (Γ ⧸ L)] (φ : ∀ i, Γ →+ G i) (X : ∀ i, Finset (G i)) (a : Γ ⧸ L) :
    a ∈ admissibleClasses S L φ X ↔ ∀ i ∈ S,
      QuotientAddGroup.map L (L.map (φ i)) (φ i) (AddSubgroup.le_comap_map (φ i) L) a ∈
        (X i).image (QuotientAddGroup.mk' (L.map (φ i))) := sorry

-- ED.5/representative-congruences
theorem mk_mem_admissibleClasses (S : Finset ι) (L : AddSubgroup Γ)
    [Fintype (Γ ⧸ L)] (φ : ∀ i, Γ →+ G i) (X : ∀ i, Finset (G i)) (g : Γ) :
    QuotientAddGroup.mk' L g ∈ admissibleClasses S L φ X ↔
      ∀ i ∈ S, ∃ x ∈ X i, φ i g - x ∈ L.map (φ i) := sorry

theorem admissibleClasses_empty (L : AddSubgroup Γ) [Fintype (Γ ⧸ L)]
    (φ : ∀ i, Γ →+ G i) (X : ∀ i, Finset (G i)) :
    admissibleClasses ∅ L φ X = Finset.univ := sorry

theorem admissibleClasses_congr (S : Finset ι) (L : AddSubgroup Γ)
    [Fintype (Γ ⧸ L)] (φ : ∀ i, Γ →+ G i) (X Y : ∀ i, Finset (G i))
    (h : ∀ i ∈ S, X i = Y i) : admissibleClasses S L φ X = admissibleClasses S L φ Y := sorry

-- ED.5/constraint-monotonicity
theorem admissibleClasses_antitone (S T : Finset ι) (h : S ⊆ T)
    (L : AddSubgroup Γ) [Fintype (Γ ⧸ L)] (φ : ∀ i, Γ →+ G i)
    (X : ∀ i, Finset (G i)) : admissibleClasses T L φ X ⊆ admissibleClasses S L φ X := sorry

-- ED.5/local-overapproximations
theorem admissibleClasses_mono (S : Finset ι) (L : AddSubgroup Γ)
    [Fintype (Γ ⧸ L)] (φ : ∀ i, Γ →+ G i) (X Y : ∀ i, Finset (G i))
    (h : ∀ i ∈ S, X i ⊆ Y i) : admissibleClasses S L φ X ⊆ admissibleClasses S L φ Y := sorry

-- ED.5/global-soundness
theorem mk_mem_of_local_mem (S : Finset ι) (L : AddSubgroup Γ)
    [Fintype (Γ ⧸ L)] (φ : ∀ i, Γ →+ G i) (X : ∀ i, Finset (G i))
    (g : Γ) (h : ∀ i ∈ S, φ i g ∈ X i) :
    QuotientAddGroup.mk' L g ∈ admissibleClasses S L φ X := sorry

-- ED.5/empty-sieve-obstruction
theorem no_global_element_of_empty (S : Finset ι) (L : AddSubgroup Γ)
    [Fintype (Γ ⧸ L)] (φ : ∀ i, Γ →+ G i) (X : ∀ i, Finset (G i))
    (h : admissibleClasses S L φ X = ∅) : ¬ ∃ g : Γ, ∀ i ∈ S, φ i g ∈ X i := sorry

-- ED.5/top-initialization: range intersection is essential for non-surjective maps.
theorem admissibleClasses_top (S : Finset ι) [Fintype (Γ ⧸ (⊤ : AddSubgroup Γ))]
    (φ : ∀ i, Γ →+ G i) (X : ∀ i, Finset (G i))
    (h : ∀ i ∈ S, ∃ x ∈ X i, x ∈ (φ i).range) :
    admissibleClasses S ⊤ φ X = {0} := sorry

-- ED.5/quotient-refinement
theorem refinement_mem (S : Finset ι) (K L : AddSubgroup Γ) (hKL : K ≤ L)
    [Fintype (Γ ⧸ K)] [Fintype (Γ ⧸ L)]
    (φ : ∀ i, Γ →+ G i) (X : ∀ i, Finset (G i)) (a : Γ ⧸ K)
    (ha : a ∈ admissibleClasses S K φ X) :
    QuotientAddGroup.map K L (AddMonoidHom.id Γ) (by simpa using hKL) a ∈
      admissibleClasses S L φ X := sorry

-- ED.5/coset-lift
def refineClasses (S : Finset ι) (K L : AddSubgroup Γ) (hKL : K ≤ L)
    [Fintype (Γ ⧸ K)] (φ : ∀ i, Γ →+ G i) (X : ∀ i, Finset (G i))
    (σ : Γ ⧸ L → Γ ⧸ K) (B : Finset (Γ ⧸ L)) : Finset (Γ ⧸ K) := sorry

theorem refineClasses_eq_biUnion (S : Finset ι) (K L : AddSubgroup Γ) (hKL : K ≤ L)
    [Fintype (Γ ⧸ K)] (φ : ∀ i, Γ →+ G i) (X : ∀ i, Finset (G i))
    (σ : Γ ⧸ L → Γ ⧸ K) (B : Finset (Γ ⧸ L)) :
    let π := QuotientAddGroup.map K L (AddMonoidHom.id Γ) (by simpa using hKL)
    refineClasses S K L hKL φ X σ B =
      (B.biUnion (fun a => (Finset.univ.filter (fun z => π z = 0)).image
        (fun z => σ a + z))).filter (fun b => b ∈ admissibleClasses S K φ X) := sorry

-- ED.5/lift-membership
theorem mem_refineClasses (S : Finset ι) (K L : AddSubgroup Γ) (hKL : K ≤ L)
    [Fintype (Γ ⧸ K)] (φ : ∀ i, Γ →+ G i) (X : ∀ i, Finset (G i))
    (σ : Γ ⧸ L → Γ ⧸ K) (B : Finset (Γ ⧸ L)) :
    let π := QuotientAddGroup.map K L (AddMonoidHom.id Γ) (by simpa using hKL)
    (∀ a ∈ B, π (σ a) = a) → ∀ b,
      b ∈ refineClasses S K L hKL φ X σ B ↔
        π b ∈ B ∧ b ∈ admissibleClasses S K φ X := sorry

theorem refineClasses_empty (S : Finset ι) (K L : AddSubgroup Γ) (hKL : K ≤ L)
    [Fintype (Γ ⧸ K)] (φ : ∀ i, Γ →+ G i) (X : ∀ i, Finset (G i))
    (σ : Γ ⧸ L → Γ ⧸ K) : refineClasses S K L hKL φ X σ ∅ = ∅ := sorry

theorem refineClasses_section_independent (S : Finset ι) (K L : AddSubgroup Γ) (hKL : K ≤ L)
    [Fintype (Γ ⧸ K)] (φ : ∀ i, Γ →+ G i) (X : ∀ i, Finset (G i))
    (σ τ : Γ ⧸ L → Γ ⧸ K) (B : Finset (Γ ⧸ L)) :
    let π := QuotientAddGroup.map K L (AddMonoidHom.id Γ) (by simpa using hKL)
    (∀ a ∈ B, π (σ a) = a) → (∀ a ∈ B, π (τ a) = a) →
      refineClasses S K L hKL φ X σ B = refineClasses S K L hKL φ X τ B := sorry

-- ED.5/lift-correctness
theorem refineClasses_correct (S : Finset ι) (K L : AddSubgroup Γ) (hKL : K ≤ L)
    [Fintype (Γ ⧸ K)] [Fintype (Γ ⧸ L)]
    (φ : ∀ i, Γ →+ G i) (X : ∀ i, Finset (G i)) (σ : Γ ⧸ L → Γ ⧸ K) :
    let π := QuotientAddGroup.map K L (AddMonoidHom.id Γ) (by simpa using hKL)
    (∀ a ∈ admissibleClasses S L φ X, π (σ a) = a) →
      refineClasses S K L hKL φ X σ (admissibleClasses S L φ X) =
        admissibleClasses S K φ X := sorry

-- ED.5/unchanged-local-image
theorem unchanged_local_condition (K L : AddSubgroup Γ) (hKL : K ≤ L)
    (φ : ∀ i, Γ →+ G i) (X : ∀ i, Finset (G i)) (i : ι)
    (hmap : K.map (φ i) = L.map (φ i)) (b : Γ ⧸ K) :
    let π := QuotientAddGroup.map K L (AddMonoidHom.id Γ) (by simpa using hKL)
    (QuotientAddGroup.map K (K.map (φ i)) (φ i) (AddSubgroup.le_comap_map (φ i) K) b ∈
      (X i).image (QuotientAddGroup.mk' (K.map (φ i)))) ↔
    (QuotientAddGroup.map L (L.map (φ i)) (φ i) (AddSubgroup.le_comap_map (φ i) L) (π b) ∈
      (X i).image (QuotientAddGroup.mk' (L.map (φ i)))) := sorry

-- ED.5/relevant-tests
theorem refineClasses_relevant (S T : Finset ι) (hTS : T ⊆ S)
    (K L : AddSubgroup Γ) (hKL : K ≤ L)
    [Fintype (Γ ⧸ K)] [Fintype (Γ ⧸ L)]
    (φ : ∀ i, Γ →+ G i) (X : ∀ i, Finset (G i)) (σ : Γ ⧸ L → Γ ⧸ K)
    (hmap : ∀ i ∈ S, i ∉ T → K.map (φ i) = L.map (φ i)) :
    let π := QuotientAddGroup.map K L (AddMonoidHom.id Γ) (by simpa using hKL)
    (∀ a ∈ admissibleClasses S L φ X, π (σ a) = a) →
      refineClasses T K L hKL φ X σ (admissibleClasses S L φ X) =
        admissibleClasses S K φ X := sorry

-- ED.5/lift-cardinality
theorem card_refineClasses_le (S : Finset ι) (K L : AddSubgroup Γ) (hKL : K ≤ L)
    [Fintype (Γ ⧸ K)] (φ : ∀ i, Γ →+ G i) (X : ∀ i, Finset (G i))
    (σ : Γ ⧸ L → Γ ⧸ K) (B : Finset (Γ ⧸ L)) :
    let π := QuotientAddGroup.map K L (AddMonoidHom.id Γ) (by simpa using hKL)
    (refineClasses S K L hKL φ X σ B).card ≤
      B.card * (Finset.univ.filter (fun z => π z = 0)).card := sorry

-- ED.5/prepared-step-target
theorem target_le_preparedStep (D L : AddSubgroup Γ) (hDL : D ≤ L)
    {A : Type*} [AddCommGroup A] (φ : Γ →+ A) :
    D ≤ L ⊓ (D.map φ).comap φ := sorry

-- ED.5/prepared-step-progress
theorem preparedStep_lt (D L : AddSubgroup Γ) {A : Type*} [AddCommGroup A]
    (φ : Γ →+ A) (h : ¬ L.map φ ≤ D.map φ) :
    L ⊓ (D.map φ).comap φ < L := sorry

-- ED.5/subgroup-covers-quotient
theorem subgroup_covers_quotient (H L : AddSubgroup Γ) (N : ℕ)
    (hcop : Nat.Coprime H.index N) (hN : ∀ g : Γ, N • g ∈ L) :
    Function.Surjective ((QuotientAddGroup.mk' L).comp H.subtype) := sorry

-- ED.5/certified-map-obstruction: P is an arbitrary existing type, not a replacement for C(Q).
theorem isEmpty_of_commuting_maps {P : Type*} (j : P → Γ)
    (S : Finset ι) (L : AddSubgroup Γ) [Fintype (Γ ⧸ L)]
    (φ : ∀ i, Γ →+ G i) (X : ∀ i, Finset (G i)) (red : ∀ i, P → G i)
    (hcomm : ∀ i ∈ S, ∀ p, φ i (j p) = red i p)
    (hred : ∀ i ∈ S, ∀ p, red i p ∈ X i)
    (hempty : admissibleClasses S L φ X = ∅) : IsEmpty P := sorry

-- ED.5/known-points-completeness: uniqueness of fibres must be supplied by ED.4 or a height bound.
theorem mem_known_of_unique_fibres {P : Type*} (j : P → Γ)
    (S : Finset ι) (L : AddSubgroup Γ) [Fintype (Γ ⧸ L)]
    (φ : ∀ i, Γ →+ G i) (X : ∀ i, Finset (G i)) (W : Finset P)
    (hlocal : ∀ p, ∀ i ∈ S, φ i (j p) ∈ X i)
    (hcover : ∀ a ∈ admissibleClasses S L φ X,
      ∃ w ∈ W, QuotientAddGroup.mk' L (j w) = a)
    (huniq : Function.Injective (fun p => QuotientAddGroup.mk' L (j p))) :
    ∀ p, p ∈ W := sorry

-- Unit tests for admissibleClasses. Test names are comments because examples are anonymous.
-- admissibleClasses_empty_index: even with no places, all cosets survive.
example (L : AddSubgroup Γ) [Fintype (Γ ⧸ L)]
    (φ : ∀ i, Γ →+ G i) (X : ∀ i, Finset (G i)) :
    admissibleClasses ∅ L φ X = Finset.univ := sorry

-- admissibleClasses_empty_local: one empty local set eliminates every coset.
example (L : AddSubgroup Γ) [Fintype (Γ ⧸ L)] (φ : Γ →+ ZMod 4) :
    admissibleClasses {()} L (fun _ : Unit => φ) (fun _ => ∅) = ∅ := sorry

-- admissibleClasses_mod_four: torsion is retained, and local sets need not be subgroups.
example :
    admissibleClasses {()} (⊥ : AddSubgroup (ZMod 4))
      (fun _ : Unit => AddMonoidHom.id (ZMod 4)) (fun _ => {1, 3}) =
      ({1, 3} : Finset (ZMod 4)).image (QuotientAddGroup.mk' ⊥) := sorry

-- admissibleClasses_non_surjective: nonempty local data can miss the global image.
example :
    admissibleClasses {()} (⊤ : AddSubgroup (ZMod 2))
      (fun _ : Unit => (0 : ZMod 2 →+ ZMod 4)) (fun _ => {1}) = ∅ := sorry

-- admissibleClasses_top_nonempty: the initial coset survives a nonempty attainable local set.
example :
    admissibleClasses {()} (⊤ : AddSubgroup (ZMod 4))
      (fun _ : Unit => AddMonoidHom.id (ZMod 4)) (fun _ => {1}) = {0} := sorry

-- Unit tests for refineClasses.
-- refineClasses_empty_input
example (S : Finset ι) (K L : AddSubgroup Γ) (hKL : K ≤ L)
    [Fintype (Γ ⧸ K)] (φ : ∀ i, Γ →+ G i) (X : ∀ i, Finset (G i))
    (σ : Γ ⧸ L → Γ ⧸ K) : refineClasses S K L hKL φ X σ ∅ = ∅ := sorry

-- refineClasses_identity: refinement with no quotient change still applies the local tests.
example (S : Finset ι) (L : AddSubgroup Γ) [Fintype (Γ ⧸ L)]
    (φ : ∀ i, Γ →+ G i) (X : ∀ i, Finset (G i)) (B : Finset (Γ ⧸ L)) :
    refineClasses S L L le_rfl φ X id B = B ∩ admissibleClasses S L φ X := sorry

-- refineClasses_all_lifts: an empty set of tests retains the entire fibre.
example (K L : AddSubgroup Γ) (hKL : K ≤ L) [Fintype (Γ ⧸ K)]
    (φ : ∀ i, Γ →+ G i) (X : ∀ i, Finset (G i))
    (σ : Γ ⧸ L → Γ ⧸ K) (B : Finset (Γ ⧸ L)) :
    let π := QuotientAddGroup.map K L (AddMonoidHom.id Γ) (by simpa using hKL)
    (∀ a ∈ B, π (σ a) = a) →
      refineClasses ∅ K L hKL φ X σ B = Finset.univ.filter (fun b => π b ∈ B) := sorry

-- refineClasses_wrong_section: an unchecked representative changes the result.
example :
    refineClasses (∅ : Finset Unit) (⊥ : AddSubgroup (ZMod 4)) ⊥ le_rfl
      (fun _ : Unit => AddMonoidHom.id (ZMod 4)) (fun _ => ∅)
      (fun _ => QuotientAddGroup.mk' ⊥ 1) {QuotientAddGroup.mk' ⊥ 0} =
      {QuotientAddGroup.mk' ⊥ 1} := sorry

end TauCeti.MordellWeilSieve
