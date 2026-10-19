import Mathlib

/-!
# ExcursionOperatorsAndSpectralAction: representative target signatures

The roadmap is `README.md`. This file records the definitions and theorem signatures of the
roadmap that can be stated against the pinned Mathlib and Tau Ceti APIs. It is not exhaustive:
the enhanced stable categories, the lisse category of `Bun_G`, its Hecke operators, the stacks of
L-parameters, the categorical actions and the D-elliptic moduli have no carriers at the pins, and
their targets are stated only in the README.

Design choices made explicit here.

* The centre of an ordinary category is Mathlib's `CategoryTheory.CatCenter`. The enhanced
  centre `π₀ End(id)` of a stable ∞-category (Layer ES0) maps to the centre of its homotopy
  category; every statement below is about such an ordinary centre and a ring acting through it.
* The Hecke-compatible centre is the subring of the centre cut out by a family of additive
  endofunctors; it can be strictly smaller than the centre.
* Restriction of the centre along a fully faithful additive functor is a ring map; the stratum
  maps of Layer ES7:parabolic are restrictions of this kind composed with the spectral centre map.
* Central support is the zero locus in `PrimeSpectrum R` of the kernel of the evaluated central
  action. It is reduced support: it forgets nilpotent annihilators, and it is not singular support.
* Schur irreducibility is invertibility of the specified scalar unit in condensed `L`-algebras,
  not the existence of some isomorphism with `L`.
* The excursion character of a Schur object is the excursion action followed by the inverse
  scalar identification.
* The twisted Levi inclusion multiplies a cocycle by `t ^ deg w`, where the degree sends a
  geometric Frobenius to `1`.
-/

open CategoryTheory

namespace TauCetiRoadmap.ExcursionOperatorsAndSpectralAction

universe u v w

/-! ## Layer ES1:spectral-center: the Hecke-compatible centre -/

section HeckeCompatibleCentre

variable {C : Type u} [Category.{v} C] [Preadditive C]

/-- The Hecke-compatible centre: central elements `z` with `z_{T X} = T(z_X)` for every functor
of the family and every object. For the enhanced centre of `D_lis(Bun_G, Λ)` and the Hecke
functors `T_V` this is `Z_geom,Hecke` of Layer ES1:spectral-center; the definition here is the
same condition on an ordinary category. -/
def heckeCompatibleCentre {ι : Type w} (T : ι → C ⥤ C) [∀ i, (T i).Additive] :
    Subring (CatCenter C) where
  carrier := {z | ∀ i X, z.app ((T i).obj X) = (T i).map (z.app X)}
  mul_mem' {a b} ha hb i X := by
    rw [CatCenter.mul_app', CatCenter.mul_app', ha i X, hb i X, Functor.map_comp]
  one_mem' i X := by
    simp
  add_mem' {a b} ha hb i X := by
    change NatTrans.app (a + b) _ = (T i).map (NatTrans.app (a + b) X)
    rw [NatTrans.app_add, NatTrans.app_add, Functor.map_add]
    exact congrArg₂ (· + ·) (ha i X) (hb i X)
  zero_mem' i X := by
    simp
  neg_mem' {a} ha i X := by
    change NatTrans.app (-a) _ = (T i).map (NatTrans.app (-a) X)
    rw [NatTrans.app_neg, NatTrans.app_neg, Functor.map_neg]
    exact congrArg Neg.neg (ha i X)

-- With the identity functor as the only Hecke functor, every central element is compatible.
example : heckeCompatibleCentre (fun _ : Unit => 𝟭 C) = ⊤ :=
  eq_top_iff.2 fun _ _ _ _ => rfl

-- Scalars of a linear structure are compatible with every linear Hecke functor.
example (R : Type w) [CommRing R] [Linear R C] {ι : Type w} (T : ι → C ⥤ C)
    [∀ i, (T i).Additive] [∀ i, (T i).Linear R] (r : R) :
    Linear.toCatCenter R C r ∈ heckeCompatibleCentre T := by
  intro i X
  simp [Functor.map_smul]

/-- The Hecke-compatible centre of a family contains that of any larger family. -/
theorem heckeCompatibleCentre_anti {ι κ : Type w} (T : ι → C ⥤ C) [∀ i, (T i).Additive]
    (f : κ → ι) :
    heckeCompatibleCentre T ≤ heckeCompatibleCentre (fun k => T (f k)) := by
  sorry

/-- Compatibility with two functors gives compatibility with their composite. -/
theorem heckeCompatibleCentre_comp {ι : Type w} (T : ι → C ⥤ C) [∀ i, (T i).Additive]
    (z : CatCenter C) (hz : z ∈ heckeCompatibleCentre T) (i j : ι) (X : C) :
    z.app ((T i ⋙ T j).obj X) = (T i ⋙ T j).map (z.app X) := by
  sorry

end HeckeCompatibleCentre

/-! ## Layer ES5: Schur objects and their excursion characters -/

section Schur

variable {L : Type u} [Field L]

/-- An object is Schur-irreducible when the specified scalar unit from the relatively discrete
scalar algebra to its condensed endomorphism algebra is an isomorphism of condensed
`L`-algebras. The unit is part of the data: an abstract isomorphism with `L` does not suffice. -/
def IsSchurIrreducible {Scalar End : Condensed.{u} (AlgCat.{u} L)} (scalarUnit : Scalar ⟶ End) :
    Prop :=
  IsIso scalarUnit

-- The identity unit of the scalar algebra is Schur.
example (Scalar : Condensed.{u} (AlgCat.{u} L)) : IsSchurIrreducible (𝟙 Scalar) := by
  unfold IsSchurIrreducible
  infer_instance

-- Transporting the unit along an isomorphism of endomorphism algebras preserves the condition.
example {Scalar End End' : Condensed.{u} (AlgCat.{u} L)} (s : Scalar ⟶ End) (e : End ≅ End')
    (h : IsSchurIrreducible s) : IsSchurIrreducible (s ≫ e.hom) := by
  unfold IsSchurIrreducible at h ⊢
  infer_instance

/-- A Schur unit is bijective on sections over every profinite test object. -/
theorem IsSchurIrreducible.sections_bijective {Scalar End : Condensed.{u} (AlgCat.{u} L)}
    (s : Scalar ⟶ End) (h : IsSchurIrreducible s) (S : CompHaus.{u}ᵒᵖ) :
    Function.Bijective (s.hom.app S).hom := by
  sorry

/-- A unit that is not bijective on the sections over one test object is not Schur, whatever
holds for global sections. -/
theorem not_isSchurIrreducible_of_sections {Scalar End : Condensed.{u} (AlgCat.{u} L)}
    (s : Scalar ⟶ End) (S : CompHaus.{u}ᵒᵖ) (h : ¬ Function.Bijective (s.hom.app S).hom) :
    ¬ IsSchurIrreducible s := by
  sorry

variable {Exc End : Type u} [CommRing Exc] [Algebra L Exc] [Ring End] [Algebra L End]

/-- The excursion character of a Schur object: the excursion action `op` on its endomorphism
algebra followed by the inverse of the scalar identification `s`. In Layer ES5 this is the
degree-zero part of the condensed character family. -/
def excursionCharacter (op : Exc →ₐ[L] End) (s : End ≃ₐ[L] L) : Exc →ₐ[L] L :=
  (s : End →ₐ[L] L).comp op

-- The character fixes scalars of the excursion algebra.
example (op : Exc →ₐ[L] End) (s : End ≃ₐ[L] L) (a : L) :
    excursionCharacter op s (algebraMap L Exc a) = a := by
  simp [excursionCharacter]

/-- The defining identity: every excursion operator acts as the scalar given by the character. -/
theorem excursionCharacter_spec (op : Exc →ₐ[L] End) (s : End ≃ₐ[L] L) (x : Exc) :
    op x = algebraMap L End (excursionCharacter op s x) := by
  sorry

/-- Characters attached to isomorphic objects agree when the isomorphism of endomorphism algebras
intertwines the excursion actions and the scalar identifications. -/
theorem excursionCharacter_iso {End' : Type u} [Ring End'] [Algebra L End']
    (e : End ≃ₐ[L] End') (op : Exc →ₐ[L] End) (op' : Exc →ₐ[L] End')
    (s : End ≃ₐ[L] L) (s' : End' ≃ₐ[L] L) (hop : op' = (e : End →ₐ[L] End').comp op)
    (hs : (s' : End' →ₐ[L] L).comp (e : End →ₐ[L] End') = (s : End →ₐ[L] L)) :
    excursionCharacter op s = excursionCharacter op' s' := by
  sorry

end Schur

section StratumIndependence

variable {C : Type u} [Category.{v} C] {D : Type u} [Category.{v} D]

/-- Two stratum extensions `left` and `right` of the same restriction functor, with retractions
compatible with a comparison `left ⟶ right`, induce the same action of the centre on the
stratum. This is the formal core of the independence of the parameter of a smooth
representation from the eligible stratum extension. -/
theorem stratum_centre_embedding_independence (left right : D ⥤ C) (restriction : C ⥤ D)
    (comparison : left ⟶ right) (leftRetraction : left ⋙ restriction ≅ 𝟭 D)
    (rightRetraction : right ⋙ restriction ≅ 𝟭 D)
    (h : ∀ X, restriction.map (comparison.app X) ≫ rightRetraction.hom.app X =
      leftRetraction.hom.app X) (z : CatCenter C) (X : D) :
    leftRetraction.inv.app X ≫ restriction.map (z.app (left.obj X)) ≫
        leftRetraction.hom.app X =
      rightRetraction.inv.app X ≫ restriction.map (z.app (right.obj X)) ≫
        rightRetraction.hom.app X := by
  sorry

end StratumIndependence

/-! ## Layer ES7:parabolic: restriction of centres and the twisted Levi inclusion -/

section RestrictCentre

variable {A : Type u} [Category.{v} A] [Preadditive A]
variable {B : Type u} [Category.{v} B] [Preadditive B]

/-- Restriction of the centre along a fully faithful additive functor `F : A ⥤ B`: a central
element `z` of `B` acts on `X` by the preimage of `z_{F X}`. The stratum maps `Ψ_G^b` are this
restriction along the stratum embedding composed with the spectral centre map. -/
def restrictCentre (F : A ⥤ B) [F.Additive] (hF : F.FullyFaithful) :
    CatCenter B →+* CatCenter A where
  toFun z :=
    { app := fun X => hF.preimage (z.app (F.obj X))
      naturality := fun X Y f => hF.map_injective (by
        simpa using z.naturality (F.map f)) }
  map_one' := by
    ext X
    exact hF.map_injective (by simp [CatCenter.app])
  map_mul' a b := by
    ext X
    exact hF.map_injective (by simp [CatCenter.app, CatCenter.mul_app'])
  map_zero' := by
    ext X
    exact hF.map_injective (by simp [CatCenter.app])
  map_add' a b := by
    ext X
    exact hF.map_injective (by simp [CatCenter.app])

-- The restricted action is computed through `F`.
example (F : A ⥤ B) [F.Additive] (hF : F.FullyFaithful) (z : CatCenter B) (X : A) :
    F.map ((restrictCentre F hF z).app X) = z.app (F.obj X) := by
  simp [restrictCentre, CatCenter.app]

-- Restriction along the identity functor is the identity.
example (z : CatCenter B) : restrictCentre (𝟭 B) (Functor.FullyFaithful.id B) z = z := by
  ext X
  simp [restrictCentre, CatCenter.app]

/-- Restriction of centres is functorial for composites of fully faithful functors. -/
theorem restrictCentre_comp {E : Type u} [Category.{v} E] [Preadditive E]
    (F : A ⥤ B) [F.Additive] (hF : F.FullyFaithful) (G : B ⥤ E) [G.Additive]
    (hG : G.FullyFaithful) :
    restrictCentre (F ⋙ G) (hF.comp hG) = (restrictCentre F hF).comp (restrictCentre G hG) := by
  sorry

end RestrictCentre

section TwistedLevi

variable {W M H : Type*} [Group W] [Group M] [Group H]

/-- The twisted inclusion of Levi cocycles: `φ ↦ (w ↦ t ^ deg w * j (φ w))`, where `j` is the
inclusion of the dual Levi, `deg` sends a geometric Frobenius to `1`, and `t` is the value of
`2ρ_Ĝ - 2ρ_M̂` at the chosen square root of `q`. -/
def twistedLeviCocycle (degree : W →* Multiplicative ℤ) (j : M →* H) (t : H) (φ : W → M) :
    W → H :=
  fun w => t ^ Multiplicative.toAdd (degree w) * j (φ w)

-- On degree-zero elements (inertia) the twist is invisible.
example (degree : W →* Multiplicative ℤ) (j : M →* H) (t : H) (φ : W → M) (w : W)
    (hw : degree w = 1) : twistedLeviCocycle degree j t φ w = j (φ w) := by
  simp [twistedLeviCocycle, hw]

-- For a basic stratum `t = 1` and the twisted inclusion is the plain inclusion.
example (degree : W →* Multiplicative ℤ) (j : M →* H) (φ : W → M) :
    twistedLeviCocycle degree j 1 φ = fun w => j (φ w) := by
  funext w
  simp [twistedLeviCocycle]

/-- The twisted inclusion carries crossed cocycles to crossed cocycles when `j` is equivariant,
`t` is fixed by the action and `t` commutes with the image of `j`. -/
theorem twistedLeviCocycle_isCocycle (degree : W →* Multiplicative ℤ) (j : M →* H) (t : H)
    (αM : W →* MulAut M) (αH : W →* MulAut H) (hj : ∀ w m, j (αM w m) = αH w (j m))
    (ht : ∀ w, αH w t = t) (hcomm : ∀ m, t * j m = j m * t) (φ : W → M)
    (hφ : ∀ w v, φ (w * v) = φ w * αM w (φ v)) (w v : W) :
    twistedLeviCocycle degree j t φ (w * v) =
      twistedLeviCocycle degree j t φ w * αH w (twistedLeviCocycle degree j t φ v) := by
  sorry

end TwistedLevi

/-! ## Layer ES4: reduced central support and its operations -/

section CentralSupport

variable {R : Type w} [CommRing R]
variable {C : Type u} [Category.{v} C] [Preadditive C]

/-- Evaluation of the centre at an object, with its ring laws. -/
def centerEvaluation (X : C) : CatCenter C →+* End X where
  toFun z := z.app X
  map_one' := rfl
  map_mul' _ _ := rfl
  map_zero' := rfl
  map_add' _ _ := rfl

/-- The central annihilator: the kernel of the evaluated central action of `R` on `X`. -/
def centralAnnihilator (a : R →+* CatCenter C) (X : C) : Ideal R :=
  RingHom.ker ((centerEvaluation X).comp a)

/-- Reduced central support in `Spec R`, distinct from the singular support of a stack. -/
def centralSupport (a : R →+* CatCenter C) (X : C) : Set (PrimeSpectrum R) :=
  PrimeSpectrum.zeroLocus (centralAnnihilator a X : Set R)

-- Scalar evaluation fixes the normalization of the evaluation map.
example [Linear R C] (X : C) (r : R) :
    centerEvaluation X (Linear.toCatCenter R C r) = r • 𝟙 X := rfl

-- The annihilator contains the unit exactly for an object whose identity vanishes.
example (a : R →+* CatCenter C) (X : C) :
    (1 : R) ∈ centralAnnihilator a X ↔ 𝟙 X = 0 := by
  change ((centerEvaluation X).comp a) 1 = 0 ↔ _
  simp only [map_one, End.one_def]

-- A zero object has empty support.
example (a : R →+* CatCenter C) (X : C) (h : 𝟙 X = 0) :
    centralSupport a X = ∅ := by
  have ha : centralAnnihilator a X = ⊤ := by
    rw [Ideal.eq_top_iff_one]
    change ((centerEvaluation X).comp a) 1 = 0
    simpa only [map_one, End.one_def] using h
  simp [centralSupport, ha]

/-- Annihilation means vanishing of the evaluated central endomorphism. -/
theorem centralAnnihilator_mem (a : R →+* CatCenter C) (X : C) (r : R) :
    r ∈ centralAnnihilator a X ↔ (a r).app X = 0 := by
  sorry

/-- A prime lies in the support exactly when it contains the annihilator. -/
theorem centralSupport_mem (a : R →+* CatCenter C) (X : C) (x : PrimeSpectrum R) :
    x ∈ centralSupport a X ↔ centralAnnihilator a X ≤ x.asIdeal := by
  sorry

/-- Central support is invariant under isomorphism of objects. -/
theorem centralSupport_iso (a : R →+* CatCenter C) {X Y : C} (e : X ≅ Y) :
    centralSupport a X = centralSupport a Y := by
  sorry

/-- An injective evaluated central action has full reduced support. -/
theorem centralSupport_of_faithful_action (a : R →+* CatCenter C) (X : C)
    (h : Function.Injective ((centerEvaluation X).comp a)) :
    centralSupport a X = Set.univ := by
  sorry

end CentralSupport

section ExactSupport

open CategoryTheory.Limits CategoryTheory.Pretriangulated

variable {R : Type w} [CommRing R]
variable {C : Type u} [Category.{v} C] [Preadditive C]
variable [HasZeroObject C] [HasShift C ℤ]
variable [∀ n : ℤ, (shiftFunctor C n).Additive] [Pretriangulated C]

/-- Support under exact operations on a pretriangulated category with a central action that
commutes with the shift: invariance under shifts, union for binary biproducts, containment for
retracts, and the three triangle inclusions. -/
theorem support_exact_operations (a : R →+* CatCenter C)
    (hshift : ∀ (r : R) (X : C) (n : ℤ),
      (a r).app (X⟦n⟧) = (shiftFunctor C n).map ((a r).app X))
    [HasBinaryBiproducts C] :
    (∀ (X : C) (n : ℤ), centralSupport a (X⟦n⟧) = centralSupport a X) ∧
    (∀ X Y : C, centralSupport a (X ⊞ Y) = centralSupport a X ∪ centralSupport a Y) ∧
    (∀ (X Y : C) (i : X ⟶ Y) (r : Y ⟶ X), i ≫ r = 𝟙 X →
      centralSupport a X ⊆ centralSupport a Y) ∧
    (∀ (T : Triangle C), T ∈ distTriang C →
      centralSupport a T.obj₂ ⊆ centralSupport a T.obj₁ ∪ centralSupport a T.obj₃) ∧
    (∀ (T : Triangle C), T ∈ distTriang C →
      centralSupport a T.obj₁ ⊆ centralSupport a T.obj₂ ∪ centralSupport a T.obj₃) ∧
    (∀ (T : Triangle C), T ∈ distTriang C →
      centralSupport a T.obj₃ ⊆ centralSupport a T.obj₁ ∪ centralSupport a T.obj₂) := by
  sorry

end ExactSupport

section SupportComparisons

open scoped TensorProduct

variable {R S : Type*} [CommRing R] [CommRing S]
variable {C D : Type*} [Category C] [Category D] [Preadditive C] [Preadditive D]

/-- An additive functor compatible with the central actions along `φ : R →+* S` gives the
containment of annihilators and of supports, with no flatness hypothesis. -/
theorem support_compatible_functor (a : R →+* CatCenter C) (b : S →+* CatCenter D)
    (φ : R →+* S) (F : C ⥤ D) [F.Additive]
    (h : ∀ r X, (b (φ r)).app (F.obj X) = F.map ((a r).app X)) (X : C) :
    Ideal.map φ (centralAnnihilator a X) ≤ centralAnnihilator b (F.obj X) ∧
      centralSupport b (F.obj X) ⊆ (PrimeSpectrum.comap φ) ⁻¹' centralSupport a X := by
  sorry

/-- For flat `S` over `R` and an `S`-linear identification of `S ⊗ End X` with `End Y` carrying
`1 ⊗ id` to `id`, annihilators extend and supports are inverse images. The module structures on
the endomorphism rings are the evaluated central actions, recorded by `ha` and `hb`. -/
theorem support_coefficient_change [Algebra R S] [Module.Flat R S]
    (a : R →+* CatCenter C) (b : S →+* CatCenter D) (X : C) (Y : D)
    [Module R (End X)] [Module S (End Y)]
    (ha : ∀ r : R, ((a r).app X : End X) = r • (1 : End X))
    (hb : ∀ s : S, ((b s).app Y : End Y) = s • (1 : End Y))
    (e : S ⊗[R] End X ≃ₗ[S] End Y)
    (he : e (1 ⊗ₜ[R] (1 : End X)) = (1 : End Y)) :
    centralAnnihilator b Y = Ideal.map (algebraMap R S) (centralAnnihilator a X) ∧
    centralSupport b Y = (PrimeSpectrum.comap (algebraMap R S)) ⁻¹' centralSupport a X := by
  sorry

/-- The ring-theoretic half of central localization: support lies in `V(f)` exactly when some
power of `f` kills the identity. -/
theorem centralSupport_subset_principal_iff (a : R →+* CatCenter C) (X : C) (f : R) :
    centralSupport a X ⊆ PrimeSpectrum.zeroLocus ({f} : Set R) ↔
      ∃ n : ℕ, (a (f ^ n)).app X = 0 := by
  sorry

/-- Complementary central idempotents confine support to complementary clopen loci. -/
theorem centralSupport_idempotent (a : R →+* CatCenter C) (e : R) (he : e * e = e) (X Y : C)
    (hX : (a e).app X = 𝟙 X) (hY : (a e).app Y = 0) :
    centralSupport a X ⊆ PrimeSpectrum.zeroLocus ({1 - e} : Set R) ∧
      centralSupport a Y ⊆ PrimeSpectrum.zeroLocus ({e} : Set R) := by
  sorry

end SupportComparisons

section ModuleSupportChecks

open scoped TensorProduct

variable (R : Type u) [CommRing R]

/-- The scalar action on the free module of rank one is faithful and has full support. -/
theorem centralSupport_free :
    centralAnnihilator (Linear.toCatCenter R (ModuleCat R)) (ModuleCat.of R R) = ⊥ ∧
    centralSupport (Linear.toCatCenter R (ModuleCat R)) (ModuleCat.of R R) = Set.univ := by
  sorry

variable (k : Type u) [Field k]

/-- The dual numbers acting on `k` through `k[ε] → k` have annihilator `(ε)` and full reduced
support: support forgets the nilpotent thickening. -/
theorem centralSupport_nilpotent :
    let a : DualNumber k →+* CatCenter (ModuleCat k) :=
      (Linear.toCatCenter k (ModuleCat k)).comp (TrivSqZeroExt.fstHom k k k).toRingHom
    centralAnnihilator a (ModuleCat.of k k) = Ideal.span ({DualNumber.eps} : Set (DualNumber k)) ∧
      centralSupport a (ModuleCat.of k k) = Set.univ := by
  sorry

/-- Over the flat identity map of `ℤ`, the free module and the zero module have different
annihilators although the zero functor intertwines their actions: compatible actions and
flatness alone give no annihilator equality. -/
theorem support_coefficient_change_requires_End_comparison :
    centralAnnihilator (Linear.toCatCenter ℤ (ModuleCat ℤ)) (ModuleCat.of ℤ ℤ) = ⊥ ∧
    centralAnnihilator (Linear.toCatCenter ℤ (ModuleCat ℤ))
      (ModuleCat.of ℤ (Fin 0 → ℤ)) = ⊤ := by
  sorry

/-- Along the nonflat map `ℤ → ℤ/2`, `ℚ` becomes zero: the identification of endomorphism rings
exists and preserves the identity, yet the annihilator grows from zero to the unit ideal. -/
theorem support_coefficient_change_requires_flatness :
    let X := ModuleCat.of ℚ ℚ
    let Y := ModuleCat.of (ZMod 2) (Fin 0 → ZMod 2)
    let a : ℤ →+* CatCenter (ModuleCat ℚ) :=
      (Linear.toCatCenter ℚ (ModuleCat ℚ)).comp (Int.castRingHom ℚ)
    let b := Linear.toCatCenter (ZMod 2) (ModuleCat (ZMod 2))
    (¬ Module.Flat ℤ (ZMod 2)) ∧
    (∃ e : (ZMod 2) ⊗[ℤ] End X ≃ₗ[ZMod 2] End Y,
      e (1 ⊗ₜ[ℤ] (1 : End X)) = (1 : End Y)) ∧
    centralAnnihilator a X = ⊥ ∧ centralAnnihilator b Y = ⊤ ∧
    Ideal.map (Int.castRingHom (ZMod 2)) (centralAnnihilator a X) ≠
      centralAnnihilator b Y := by
  sorry

end ModuleSupportChecks

/-! ## Layer ES7:GLn-comparison: the two-leg excursion is a trace -/

section TwoLeg

variable {L W V : Type*} [Field L] [Group W] [AddCommGroup V] [Module L V]
  [FiniteDimensional L V]

/-- Creation by coevaluation, the action of `(g, h)` on `V ⊗ V^∨`, and annihilation by
evaluation give the trace of `ρ (g * h⁻¹)`: the dual factor acts through the inverse. -/
theorem two_leg_excursion_is_trace (ρ : Representation L W V) (g h : W) :
    contractRight L V (TensorProduct.map (ρ g) (ρ.dual h) (coevaluation L V 1)) =
      LinearMap.trace L V (ρ (g * h⁻¹)) := by
  sorry

end TwoLeg

/-!
## Targets stated only in the README

The following have no carriers at the pins and appear only in `README.md`: the enhanced centre
and its comparison maps (ES0); excursion operators on `Bun_G`, finite-wild Hecke categories, the
finite-ramification theorem and the component decomposition (ES1:finite-ramification); the
spectral centre map (ES1:spectral-center); compactly supported actions, the rational and integral
universal action theorems and the spectral actions on `Bun_G` (ES2, ES3); the continuous
semisimple parameters of Schur sheaves and of irreducible smooth representations (ES5); the
functoriality, torus, central-character and duality theorems (ES6:functoriality, ES6:duality);
the stratum factorization and parabolic induction (ES7:parabolic); elliptic parameters and
their components (ES4); the tower realizations, the function-field trace formula, D-elliptic
sheaves and the classical agreement theorems (ES7:GLn-comparison,
ES7:function-field-automorphic, ES7:equal-characteristic, ES7).
-/

end TauCetiRoadmap.ExcursionOperatorsAndSpectralAction
