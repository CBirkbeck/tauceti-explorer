import Mathlib.Topology.Algebra.ContinuousMonoidHom
import Mathlib.GroupTheory.Finiteness
import Mathlib.NumberTheory.ArithmeticFunction.Moebius
import Mathlib.NumberTheory.Divisors
import Mathlib.Order.Filter.AtTopBot.Basic
import Mathlib.RingTheory.RootsOfUnity.PrimitiveRoots
import Mathlib.Data.ZMod.Basic

/-!
# NC.6: sections, rational points and the conjectural frontiers

This file is not the roadmap and is not exhaustive. The roadmap document,
`research/blueprint/readmes/AnabelianGeometryAndNonabelianChabauty--NC.6.md`, is definitive.
The statements below suggest Lean forms so that contributors and reviewers converge on names
and signatures. Every theorem is admitted with `sorry`; nothing here claims an implementation.

The étale fundamental group of a scheme, the unipotent fundamental group, Selmer varieties and
Chabauty–Kim loci are not available at the pins (Mathlib 082e2d3, Tau Ceti f790474). This file
therefore states the frontier objects on the carriers that do exist:

* an abstract arithmetic extension is a continuous homomorphism `q : E →ₜ* Γ`; its continuous
  sections, their conjugacy classes by the kernel of `q`, and the section map attached to a
  family of sections indexed by a point set;
* the section conjecture for such a datum is bijectivity of the section map;
* the arithmetic core of the injectivity theorem: a finitely generated abelian group has no
  nonzero element divisible by every positive integer;
* the Witt and Labute dimension formulas for the lower central quotients, as functions of the
  genus data, with their divisor-sum identities;
* Kim's dimension inequality, eventual vanishing and eventual equality of a decreasing family
  of loci, as propositions on sequences of dimensions and of sets;
* the residue-level fact behind the depth-one computation for the thrice-punctured line.

The geometric statements (the section map of a curve, Stix's Theorem 45, Grothendieck's
conjecture for curves of genus at least two over number fields, Kim's Conjectures 1 and 2 and
their conditional bridges, BDCKW Conjecture 3.1) are README targets, because their carriers are
not at the pins.
-/

namespace TauCeti.Anabelian

open Filter

/-! ## Sections of an abstract arithmetic extension -/

section Sections

variable {E Γ : Type*} [Group E] [Group Γ] [TopologicalSpace E] [TopologicalSpace Γ]

/-- A continuous section of the continuous homomorphism `q : E →ₜ* Γ`. For a scheme `X/k`,
`q` is the projection `π₁(X, x̄) → Γ_k` and its kernel is the geometric fundamental group. -/
structure GaloisSection (q : E →ₜ* Γ) where
  /-- The underlying continuous homomorphism `Γ → E`. -/
  toHom : Γ →ₜ* E
  /-- `q ∘ s = id`. -/
  comp_eq : ∀ σ, q (toHom σ) = σ

namespace GaloisSection

variable {q : E →ₜ* Γ}

/-- Two sections are conjugate when one is obtained from the other by conjugating with an
element of the kernel of `q`. -/
def Conj (q : E →ₜ* Γ) (s t : GaloisSection q) : Prop :=
  ∃ δ : E, q δ = 1 ∧ ∀ σ, t.toHom σ = δ * s.toHom σ * δ⁻¹

lemma conj_refl (s : GaloisSection q) : Conj q s s := by sorry

lemma conj_symm {s t : GaloisSection q} (h : Conj q s t) : Conj q t s := by sorry

lemma conj_trans {s t u : GaloisSection q} (h₁ : Conj q s t) (h₂ : Conj q t u) :
    Conj q s u := by sorry

/-- The difference cocycle `σ ↦ s σ * (s₀ σ)⁻¹` of two sections, with values in the kernel. -/
def diff (s₀ s : GaloisSection q) (σ : Γ) : q.toMonoidHom.ker :=
  ⟨s.toHom σ * (s₀.toHom σ)⁻¹, by
    change q (s.toHom σ * (s₀.toHom σ)⁻¹) = 1
    rw [map_mul, map_inv, s.comp_eq, s₀.comp_eq, mul_inv_cancel]⟩

lemma diff_self (s₀ : GaloisSection q) (σ : Γ) : diff s₀ s₀ σ = 1 := by sorry

/-- The difference cocycle satisfies the twisted cocycle identity for the conjugation action
through `s₀`. -/
lemma diff_mul (s₀ s : GaloisSection q) (σ τ : Γ) :
    ((diff s₀ s (σ * τ) : q.toMonoidHom.ker) : E) =
      (diff s₀ s σ : E) * (s₀.toHom σ * (diff s₀ s τ : E) * (s₀.toHom σ)⁻¹) := by sorry

/-- Sections along a morphism of extensions: `f : E →ₜ* E'` over `Γ` (that is, `q' ∘ f = q`)
carries sections of `q` to sections of `q'`. For schemes this is the map induced by a
`k`-morphism `X → Y`. -/
def map {E' : Type*} [Group E'] [TopologicalSpace E'] {q' : E' →ₜ* Γ} (f : E →ₜ* E')
    (hf : ∀ e, q' (f e) = q e) (s : GaloisSection q) : GaloisSection q' :=
  ⟨f.comp s.toHom, fun σ => by rw [ContinuousMonoidHom.coe_comp, Function.comp_apply, hf, s.comp_eq]⟩

lemma conj_map {E' : Type*} [Group E'] [TopologicalSpace E'] {q' : E' →ₜ* Γ} (f : E →ₜ* E')
    (hf : ∀ e, q' (f e) = q e) {s t : GaloisSection q} (h : Conj q s t) :
    Conj q' (map f hf s) (map f hf t) := by
  obtain ⟨δ, hδ, h⟩ := h
  refine ⟨f δ, by rw [hf, hδ], fun σ => ?_⟩
  change f (t.toHom σ) = f δ * f (s.toHom σ) * (f δ)⁻¹
  rw [h σ, map_mul, map_mul, map_inv]

end GaloisSection

/-- `Sect(X/k)`: conjugacy classes of continuous sections. -/
def SectionClasses (q : E →ₜ* Γ) : Type _ :=
  Quot (GaloisSection.Conj q)

namespace SectionClasses

variable {q : E →ₜ* Γ}

/-- The class of a section. -/
def mk (q : E →ₜ* Γ) (s : GaloisSection q) : SectionClasses q :=
  Quot.mk _ s

lemma mk_eq_mk_iff (s t : GaloisSection q) :
    mk q s = mk q t ↔ GaloisSection.Conj q s t := by sorry

lemma mk_surjective : Function.Surjective (mk q) := by sorry

/-- Kim's action of the whole group `E` (conjugation, precomposed with conjugation in `Γ`) has
the same orbits as conjugation by the kernel. -/
lemma orbit_eq_kim (s t : GaloisSection q) (γ : E)
    (h : ∀ σ, t.toHom σ = γ * s.toHom (q γ⁻¹ * σ * q γ) * γ⁻¹) :
    mk q t = mk q s := by sorry

/-- `Sect` is functorial for morphisms of extensions over `Γ`. -/
def map {E' : Type*} [Group E'] [TopologicalSpace E'] {q' : E' →ₜ* Γ} (f : E →ₜ* E')
    (hf : ∀ e, q' (f e) = q e) : SectionClasses q → SectionClasses q' :=
  Quot.map (GaloisSection.map f hf) (fun _ _ h => GaloisSection.conj_map f hf h)

lemma map_mk {E' : Type*} [Group E'] [TopologicalSpace E'] {q' : E' →ₜ* Γ} (f : E →ₜ* E')
    (hf : ∀ e, q' (f e) = q e) (s : GaloisSection q) :
    map f hf (mk q s) = mk q' (GaloisSection.map f hf s) := rfl

lemma map_id : map (ContinuousMonoidHom.id E) (q := q) (fun _ => rfl) = id := by sorry

end SectionClasses

/-- The section map of a family of sections indexed by a point set `P`; for a curve, `P` is
the set of rational points and `sec x` is a section attached to `x`. -/
def sectionClassMap (q : E →ₜ* Γ) {P : Type*} (sec : P → GaloisSection q) :
    P → SectionClasses q :=
  fun x => SectionClasses.mk q (sec x)

/-- `SectionConjecture(X/k)` for an abstract datum: the section map is bijective. -/
def SectionConjectureFor (q : E →ₜ* Γ) {P : Type*} (sec : P → GaloisSection q) : Prop :=
  Function.Bijective (sectionClassMap q sec)

lemma sectionClassMap_natural {E' : Type*} [Group E'] [TopologicalSpace E'] {q' : E' →ₜ* Γ}
    (q : E →ₜ* Γ) (f : E →ₜ* E') (hf : ∀ e, q' (f e) = q e) {P P' : Type*}
    (sec : P → GaloisSection q) (sec' : P' → GaloisSection q') (φ : P → P')
    (hφ : ∀ x, GaloisSection.Conj q' (GaloisSection.map f hf (sec x)) (sec' (φ x))) :
    ∀ x, sectionClassMap q' sec' (φ x) = SectionClasses.map f hf (sectionClassMap q sec x) := by
  sorry

lemma sectionClassMap_eq_iff (q : E →ₜ* Γ) {P : Type*} (sec : P → GaloisSection q) (x y : P) :
    sectionClassMap q sec x = sectionClassMap q sec y ↔ GaloisSection.Conj q (sec x) (sec y) := by
  sorry

lemma sectionConjectureFor_iff_surjective (q : E →ₜ* Γ) {P : Type*} (sec : P → GaloisSection q)
    (hinj : Function.Injective (sectionClassMap q sec)) :
    SectionConjectureFor q sec ↔ Function.Surjective (sectionClassMap q sec) := by sorry

lemma sectionConjectureFor_isEmpty_iff (q : E →ₜ* Γ) {P : Type*} [IsEmpty P]
    (sec : P → GaloisSection q) :
    SectionConjectureFor q sec ↔ IsEmpty (SectionClasses q) := by sorry

-- SectionClasses.spec_field_unique: for `q = id` (the case `X = Spec k`) there is exactly one class.
example : Subsingleton (SectionClasses (ContinuousMonoidHom.id Γ)) := by sorry

example : Nonempty (SectionClasses (ContinuousMonoidHom.id Γ)) := by sorry

-- sectionConjecture_spec_field: the identity datum with a single point satisfies the conjecture.
example (s : GaloisSection (ContinuousMonoidHom.id Γ)) :
    SectionConjectureFor (ContinuousMonoidHom.id Γ) (fun _ : Unit => s) := by sorry

-- not_sectionConjecture_projectiveLine: two distinct points with the same section violate
-- injectivity, as for `P¹`, where every section is conjugate to every other.
example (q : E →ₜ* Γ) (s : GaloisSection q) :
    ¬ SectionConjectureFor q (fun _ : Bool => s) := by sorry

-- sectionConjecture_iff_bijective: the proposition is bijectivity, nothing weaker.
example (q : E →ₜ* Γ) {P : Type*} (sec : P → GaloisSection q) :
    SectionConjectureFor q sec ↔
      Function.Injective (sectionClassMap q sec) ∧ Function.Surjective (sectionClassMap q sec) :=
  Iff.rfl

end Sections

/-! ## The arithmetic core of injectivity (Stix, Theorem 45) -/

section Injectivity

/-- A finitely generated abelian group has no nonzero element divisible by every positive
integer; with Mordell–Weil this is the input of the injectivity theorem over number fields. -/
theorem eq_zero_of_forall_divisible {A : Type*} [AddCommGroup A] [AddGroup.FG A] (a : A)
    (h : ∀ n : ℕ, 0 < n → ∃ b : A, n • b = a) : a = 0 := by sorry

/-- The shape of Stix's Theorem 45: an injection into a finitely generated abelian group,
together with the Kummer comparison (equal classes force the difference to be divisible by every
`n`), makes the section map injective. -/
theorem injective_of_kummer {P A C : Type*} [AddCommGroup A] [AddGroup.FG A] (ι : P → A)
    (hι : Function.Injective ι) (κ : P → C)
    (hκ : ∀ x y, κ x = κ y → ∀ n : ℕ, 0 < n → ∃ b : A, n • b = ι x - ι y) :
    Function.Injective κ := by sorry

-- the elementary step in `ℤ × ZMod 6`: an element divisible by every `n` is zero.
example (a : ℤ × ZMod 6) (h : ∀ n : ℕ, 0 < n → ∃ b : ℤ × ZMod 6, n • b = a) : a = 0 := by
  sorry

-- sectionClassMap_gm_eq_kummer: `-1` is not a square in `ℚ`, so its Kummer class is nonzero.
example : ¬ ∃ b : ℚ, b ^ 2 = -1 := by sorry

end Injectivity

/-! ## Dimensions of the lower central quotients (Witt, Labute) -/

section GradedDimensions

open ArithmeticFunction

/-- Witt's formula: the dimension of the degree-`n` part of the free Lie algebra on `m`
generators, `(1/n) ∑_{d ∣ n} μ(d) m^{n/d}`. It is `d_n` for an affine curve with `m = 2g + s - 1`. -/
def wittDim (m n : ℕ) : ℤ :=
  (∑ d ∈ n.divisors, moebius d * (m : ℤ) ^ (n / d)) / n

/-- `α^n + β^n` for the roots `α, β` of `t² - 2g t + 1`, by its linear recursion. -/
def lucasSum (g : ℕ) : ℕ → ℤ
  | 0 => 2
  | 1 => 2 * g
  | n + 2 => 2 * g * lucasSum g (n + 1) - lucasSum g n

/-- Labute's formula: the rank of the `n`-th lower central quotient of the fundamental group of a
compact surface of genus `g`, `(1/n) ∑_{d ∣ n} μ(d) (α^{n/d} + β^{n/d})`. -/
def labuteDim (g n : ℕ) : ℤ :=
  (∑ d ∈ n.divisors, moebius d * lucasSum g (n / d)) / n

theorem sum_divisors_mul_wittDim (m n : ℕ) (hn : 0 < n) :
    ∑ d ∈ n.divisors, (d : ℤ) * wittDim m d = (m : ℤ) ^ n := by sorry

theorem sum_divisors_mul_labuteDim (g n : ℕ) (hn : 0 < n) :
    ∑ d ∈ n.divisors, (d : ℤ) * labuteDim g d = lucasSum g n := by sorry

theorem wittDim_nonneg (m n : ℕ) : 0 ≤ wittDim m n := by sorry

-- thrice-punctured line (`m = 2`): `d₁, …, d₅ = 2, 1, 2, 3, 6`.
example : (List.range 5).map (fun k => wittDim 2 (k + 1)) = [2, 1, 2, 3, 6] := by sorry

-- genus 2: `d₁ = 4`, `d₂ = 5 = dim Λ²H₁ - 1`, `d₃ = 16`.
example : labuteDim 2 1 = 4 ∧ labuteDim 2 2 = 5 ∧ labuteDim 2 3 = 16 := by sorry

-- genus 1 (not hyperbolic): the abelian case, `d₁ = 2` and `d₂ = 0`.
example : labuteDim 1 1 = 2 ∧ labuteDim 1 2 = 0 := by sorry

-- the free Lie algebra on two generators is not abelian: `d₂ ≠ 0`, unlike `Λ²` of a line.
example : wittDim 2 2 ≠ 0 := by sorry

end GradedDimensions

/-! ## Kim's dimension conjecture and Selmer vanishing, on dimension sequences -/

section DimensionFrontier

/-- Kim's Conjecture 1 for given dimension sequences: some depth `n ≥ 1` has
`dim S_n < dim Q_n`. -/
def KimDimensionInequality (selDim dRDim : ℕ → ℕ) : Prop :=
  ∃ n, 1 ≤ n ∧ selDim n < dRDim n

/-- Kim's Conjecture 2 for a sequence of strict Selmer dimensions: eventually zero. -/
def EventuallyVanishing (dim : ℕ → ℕ) : Prop :=
  ∀ᶠ n in atTop, dim n = 0

lemma kimDimensionInequality_mono {selDim selDim' dRDim : ℕ → ℕ} (h : ∀ n, selDim' n ≤ selDim n)
    (hK : KimDimensionInequality selDim dRDim) : KimDimensionInequality selDim' dRDim := by sorry

-- kimDimensionConjecture_thrice_punctured_Z: over `ℤ`, `dim S₁ = 0 < 2 = dim Q₁`.
example (selDim dRDim : ℕ → ℕ) (h₁ : selDim 1 = 0) (h₂ : dRDim 1 = 2) :
    KimDimensionInequality selDim dRDim := by sorry

-- kimDimensionConjecture_thrice_punctured_half: over `ℤ[1/2]`, depth one gives `2 = 2` and
-- depth two gives `2 < 3`; the inequality is witnessed at depth two.
example (selDim dRDim : ℕ → ℕ) (h₂ : selDim 2 = 2) (h₃ : dRDim 2 = 3) :
    KimDimensionInequality selDim dRDim := by sorry

-- not_kimDimensionConjecture_gm: for `G_m` over `ℤ[1/2]` both dimensions are `1` at every depth.
example : ¬ KimDimensionInequality (fun _ => 1) (fun _ => 1) := by sorry

-- selmerVanishing_zero_rep: the zero sequence vanishes eventually.
example : EventuallyVanishing (fun _ => 0) := by sorry

-- selmerVanishing_needs_local_conditions (dimension form): the unrestricted `H¹(G_T, V_n)` of the
-- thrice-punctured line is nonzero at every even `n`, and such a sequence never vanishes eventually.
example (dim : ℕ → ℕ) (h : ∀ n, 2 ≤ n → n % 2 = 0 → 1 ≤ dim n) : ¬ EventuallyVanishing dim := by
  sorry

end DimensionFrontier

/-! ## Kim's conjecture: eventual equality of a decreasing family of loci -/

section EventualEquality

variable {Y : Type*}

/-- `X(ℤ_p)_n = 𝒳(ℤ)` for all large `n`. -/
def EventualEquality (L : ℕ → Set Y) (G : Set Y) : Prop :=
  ∀ᶠ n in atTop, L n = G

lemma eventualEquality_iff_exists_subset {L : ℕ → Set Y} {G : Set Y} (hanti : Antitone L)
    (hG : ∀ n, G ⊆ L n) : EventualEquality L G ↔ ∃ n, L n ⊆ G := by sorry

lemma eventualEquality_iInter {L : ℕ → Set Y} {G : Set Y} (h : EventualEquality L G)
    (hanti : Antitone L) : (⋂ n, L n) = G := by sorry

-- kimConjecture_not_intersection: the intersection can be `G` without eventual equality.
example :
    (⋂ n : ℕ, ({m : ℕ | n ≤ m} ∪ {0})) = ({0} : Set ℕ) ∧
      ¬ EventualEquality (fun n : ℕ => {m : ℕ | n ≤ m} ∪ {0}) ({0} : Set ℕ) := by sorry

-- kimConjectureS_empty (degenerate form): a constant family is eventually equal to its value.
example (G : Set Y) : EventualEquality (fun _ => G) G := by sorry

end EventualEquality

/-! ## The thrice-punctured line at depth one -/

section ThricePunctured

-- `𝒳(ℤ) = ∅` for `P¹ ∖ {0, 1, ∞}`: no integer `z` has `z` and `1 - z` both units.
example : ¬ ∃ z : ℤ, IsUnit z ∧ IsUnit (1 - z) := by sorry

/-- Residue-level form of the depth-one computation: a primitive sixth root of unity exists
modulo `p` exactly when `p ≡ 1 (mod 3)`; by Hensel's lemma (Teichmüller lifts) the same holds
in `ℤ_p`. -/
theorem exists_primitiveRoot_six_iff (p : ℕ) [Fact p.Prime] :
    (∃ x : ZMod p, IsPrimitiveRoot x 6) ↔ p % 3 = 1 := by sorry

-- kimConjecture_thrice_punctured_p5: no primitive sixth root of unity modulo 5.
example : ¬ ∃ x : ZMod 5, IsPrimitiveRoot x 6 := by sorry

-- kimLocus_thrice_punctured_p7: `3` is a primitive sixth root of unity modulo 7.
example : IsPrimitiveRoot (3 : ZMod 7) 6 := by sorry

end ThricePunctured

/-! ## Packet items stated in the README only

The following packet items need carriers that are not at the pins (étale fundamental groups of
schemes, nonabelian `H¹` of profinite groups with the NC.3 topology, unipotent fundamental groups,
Selmer varieties, Chabauty–Kim loci, Galois cohomology of number fields with `ℚ_p`-coefficients).
They are stated in the README and not given Lean signatures here:

* `SectionClasses.equivH1`, `SectionClasses.restrict`, `SectionClasses.basepointEquiv`, and the
  tests `SectionClasses.projectiveLine_unique`, `SectionClasses.gm_kummer`,
  `SectionClasses.raw_sections_not_classes` (need `π₁` of `P¹` and `G_m`);
* `sectionClassMap_eq_pathTorsor`, `sectionClassMap_base`, `sectionClassMap_restrict`, and the
  tests `sectionClassMap_spec_field`, `sectionClassMap_projectiveLine_not_injective`,
  `sectionClassMap_gm_eq_kummer`, `sectionClassMap_gm_not_surjective`;
* `GrothendieckSectionConjecture`, `sectionConjecture_of_equiv`, and the curve forms of
  `sectionConjecture_iff_surjective` and `sectionConjecture_isEmpty_iff` (abstract forms above),
  with the test `not_sectionConjecture_gm`;
* `KimDimensionConjecture`, `finite_of_kimDimensionConjecture`,
  `kimDimensionConjecture_of_refined`, `kimDimensionConjecture_basepoint`, `dim_Q_eq_sum` and the
  tests `kimDimensionConjecture_depth_one_chabauty`, `kimDimensionConjecture_needs_crystalline`
  (abstract inequality above);
* `SelmerVanishing`, `sel0_eq_sha1`, `sel0_dual_sha2`, `sel0_mono_T`,
  `selmerVanishing_of_finite_extension`, and the tests `selmerVanishing_thrice_punctured`,
  `sel0_eq_sha1_test`, `selmerVanishing_needs_local_conditions` (abstract eventual vanishing above);
* `kimLocus`, `kimLocus_antitone`, `integral_subset_kimLocus`, `kimConjecture_iff_exists_subset`
  (abstract form `eventualEquality_iff_exists_subset` above), `kimLocus_eq_crystallineLocus`,
  `kimLocus_indep_T`, `kimLocus_indep_basepoint`, `kimConjectureS`, and the tests
  `kimConjecture_thrice_punctured_p5`, `kimLocus_thrice_punctured_p7` (residue-level forms above),
  `kimLocusS_half_contains`;
* the theorems `kummer-section-comparison`, `section-map-injective` (abstract core above),
  `h2-growth-bound`, `vanishing-implies-dimension`, `bloch-kato-implies-vanishing`,
  `weight-splitting-implies-vanishing`, `weak-jannsen-implies-dimension`, `cm-rank-one-finiteness`,
  `pseudo-null-implies-dimension`, `genus-zero-dimension` and `thrice-punctured-depth-one`.
-/

end TauCeti.Anabelian
