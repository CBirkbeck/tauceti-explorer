import Mathlib.Algebra.Group.Equiv.TypeTags
import Mathlib.Algebra.Group.Subgroup.Ker
import Mathlib.RepresentationTheory.Homological.GroupHomology.Functoriality
import TauCeti.Topology.Homotopy.HomotopyGroup.HomotopyEquiv

/-!
This file is not the roadmap and is not exhaustive. The accompanying reader document is
definitive. These statements suggest Lean forms so contributors and reviewers can converge on
names and signatures.

Only the light composition interfaces over existing carriers are stated here. In the roadmap,
`s` is the stable Steinberg extension, `κ` is its inherited kernel/H₂ equivalence, and `ρ` is
constructed from the explicit fibre connecting map followed by the same UCE kernel/H₂ map.
Those inputs are mathematical targets of the named suppliers, not additional structure fields
or definitions in this file. No ring-level K₂ or plus-space implementation is claimed.
-/

open CategoryTheory
open scoped ContinuousMap

noncomputable section

namespace TauCeti.K2Comparison

variable {S : Type*} {E : Type} [Group S] [Group E]
  {X : Type*} [TopologicalSpace X]

/-- The light composition used by the normalised classical-to-plus comparison. -/
def fromHomology (s : S →* E) (x : X)
    (κ : Additive s.ker ≃+ groupHomology.H2 (Rep.trivial ℤ E ℤ))
    (ρ : Additive (HomotopyGroup (Fin 2) X x) ≃+
      groupHomology.H2 (Rep.trivial ℤ E ℤ)) :
    Additive s.ker ≃+ Additive (HomotopyGroup (Fin 2) X x) :=
  κ.trans ρ.symm

variable (s : S →* E) (x : X)
  (κ : Additive s.ker ≃+ groupHomology.H2 (Rep.trivial ℤ E ℤ))
  (ρ : Additive (HomotopyGroup (Fin 2) X x) ≃+
    groupHomology.H2 (Rep.trivial ℤ E ℤ))

/-- The normalisation equation fixes the comparison, including its sign. -/
theorem fromHomology_normalise (z : Additive s.ker) :
    ρ (fromHomology s x κ ρ z) = κ z := by
  sorry

/-- The inverse applies the same two identifications in the opposite direction. -/
theorem fromHomology_symm (v : Additive (HomotopyGroup (Fin 2) X x)) :
    (fromHomology s x κ ρ).symm v = κ.symm (ρ v) := by
  sorry

/-- There is only one homomorphism with the specified normalisation. -/
theorem fromHomology_unique
    (c : Additive s.ker →+ Additive (HomotopyGroup (Fin 2) X x))
    (h : ∀ z, ρ (c z) = κ z) :
    c = (fromHomology s x κ ρ).toAddMonoidHom := by
  sorry

/-- The additive equivalence uses the native group operations, with only the additive type tag. -/
theorem fromHomology_add (z w : Additive s.ker) :
    fromHomology s x κ ρ (z + w) =
      fromHomology s x κ ρ z + fromHomology s x κ ρ w := by
  sorry

/-- The fibre description: if `ρ` is the connecting map `δ` followed by the kernel equivalence
`κF` of the fibre extension, and `a` is a kernel map with `κF ∘ a = κ` (in the roadmap, the
restriction of the unique isomorphism of universal central extensions over `E`), then `δ` carries
the comparison to `a`. -/
theorem fromHomology_fibre {U : Type*} [Group U] (ε : U →* E)
    (δ : Additive (HomotopyGroup (Fin 2) X x) ≃+ Additive ε.ker)
    (κF : Additive ε.ker ≃+ groupHomology.H2 (Rep.trivial ℤ E ℤ))
    (a : Additive s.ker →+ Additive ε.ker) (ha : ∀ z, κF (a z) = κ z) (z : Additive s.ker) :
    δ (fromHomology s x κ (δ.trans κF) z) = a z := by
  sorry

-- Representative tests on the actual kernel, homology and homotopy-group carriers.
-- `normalisation_test`
example (z : Additive s.ker) : ρ (fromHomology s x κ ρ z) = κ z := by
  sorry

-- `inverse_test`
example (v : Additive (HomotopyGroup (Fin 2) X x)) :
    fromHomology s x κ ρ (κ.symm (ρ v)) = v := by
  sorry

-- The additive structure (`fromHomology_add`) at zero.
example : fromHomology s x κ ρ 0 = 0 := by
  sorry

-- `negative_comparison_test`: negating the comparison breaks the normalisation wherever
-- `κ z ≠ -κ z`, so identity and naturality checks alone cannot hide a uniform sign change.
example (z : Additive s.ker) (hz : κ z ≠ -κ z) :
    ρ (-fromHomology s x κ ρ z) ≠ κ z := by
  sorry

section Naturality

variable {T : Type*} {D : Type} [Group T] [Group D]
  {Y : Type*} [TopologicalSpace Y]

/-- The algebraic endpoint of the ring-map square, after the suppliers prove its two inputs.
The coefficient map is the identity of the trivial integral representation. -/
theorem fromHomology_natural (t : T →* D) (y : Y)
    (κ' : Additive t.ker ≃+ groupHomology.H2 (Rep.trivial ℤ D ℤ))
    (ρ' : Additive (HomotopyGroup (Fin 2) Y y) ≃+
      groupHomology.H2 (Rep.trivial ℤ D ℤ))
    (e : E →* D) (k : Additive s.ker →+ Additive t.ker)
    (f : C(X, Y)) (hf : f x = y)
    (hκ : ∀ z, κ' (k z) =
      groupHomology.map (A := Rep.trivial ℤ E ℤ) e (𝟙 _) 2 (κ z))
    (hρ : ∀ v, ρ' ((HomotopyGroup.mapHom (N := Fin 2) f hf).toAdditive v) =
      groupHomology.map (A := Rep.trivial ℤ E ℤ) e (𝟙 _) 2 (ρ v))
    (z : Additive s.ker) :
    fromHomology t y κ' ρ' (k z) =
      (HomotopyGroup.mapHom (N := Fin 2) f hf).toAdditive
        (fromHomology s x κ ρ z) := by
  sorry

end Naturality

section Transport

variable {Y : Type*} [TopologicalSpace Y]

/-- Light transport through an actual homotopy equivalence. For the ring target this is the
zero-component equivalence; its inclusion in the full Q-space is a separate supplier input. -/
def toQuillen
    (c : Additive s.ker ≃+ Additive (HomotopyGroup (Fin 2) X x))
    (η : X ≃ₕ Y) :
    Additive s.ker ≃+ Additive (HomotopyGroup (Fin 2) Y (η.toFun x)) :=
  c.trans (HomotopyGroup.mulEquivOfHomotopyEquiv (N := Fin 2) η x).toAdditive

theorem toQuillen_apply
    (c : Additive s.ker ≃+ Additive (HomotopyGroup (Fin 2) X x))
    (η : X ≃ₕ Y) (z : Additive s.ker) :
    toQuillen s x c η z = Additive.ofMul
      (HomotopyGroup.mapHom (N := Fin 2) η.toFun rfl (c z).toMul) := by
  sorry

theorem toQuillen_symm
    (c : Additive s.ker ≃+ Additive (HomotopyGroup (Fin 2) X x))
    (η : X ≃ₕ Y) (v : Additive (HomotopyGroup (Fin 2) Y (η.toFun x))) :
    (toQuillen s x c η).symm v =
      c.symm ((HomotopyGroup.mulEquivOfHomotopyEquiv (N := Fin 2) η x).toAdditive.symm v) := by
  sorry

-- `quillen_formula_test`, inverse half: the displayed inverse recovers the kernel element.
example (c : Additive s.ker ≃+ Additive (HomotopyGroup (Fin 2) X x))
    (η : X ≃ₕ Y) (z : Additive s.ker) :
    (toQuillen s x c η).symm (toQuillen s x c η z) = z := by
  sorry

end Transport

/-!
Omitted ring-level targets, because their carriers or comparison maps are absent at the pins:
* the specialised χ_A, ρ_A (H.3's `pi2Equiv`), δ_A, κ_F,A and unique Steinberg/fibre UCE map;
  `fromHomology_fibre` above states only the algebraic step, with those maps as inputs, and
  `fromHomology_pi2Equiv` (ρ_A is H.3's `pi2Equiv` for GL(A) ⊇ E(A)) needs the plus construction;
* the zero-ring/nonzero-class comparison tests;
* ring naturality (the theorem above records only its composition step), basepoint-track
  independence and comparison-model-independence;
* Ξ_A for ΩBQ(Proj_fg(A)), its zero-component inclusion, inverse, naturality and compatible
  model independence; the nonflat ℤ → ℤ/2ℤ and zero-ring Q-space tests.
The reader and packet give all of these exact targets, APIs, tests and supplier contracts.
No substitute stable group, plus construction, exact category or Hurewicz theory is defined here.
-/

end TauCeti.K2Comparison
