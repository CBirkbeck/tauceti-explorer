import Mathlib.NumberTheory.Cyclotomic.CyclotomicCharacter
import Mathlib.FieldTheory.AbsoluteGaloisGroup
import Mathlib.RepresentationTheory.Homological.ContCohomology.Basic
import Mathlib.AlgebraicGeometry.Sites.Etale
import Mathlib.CategoryTheory.Sites.SheafCohomology.Basic
import Mathlib.AlgebraicGeometry.AlgebraicCycle.Basic
import Mathlib.NumberTheory.Padics.PadicIntegers
import Mathlib.NumberTheory.Padics.RingHoms
import Mathlib.RingTheory.Henselian
import Mathlib.FieldTheory.Perfect
import Mathlib.NumberTheory.NumberField.Basic
import Mathlib.AlgebraicGeometry.AffineSpace
import Mathlib.NumberTheory.Padics.PadicNumbers

/-!
# Suggested Lean prototypes for MotivicEtaleKTheory, M.1–M.5c

This file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/MotivicEtaleKTheory--M.1.md` is definitive. The
statements here suggest Lean forms so that contributors and reviewers converge on
names and signatures. They claim no implementation: every node of the packet
`research/blueprint/packets/MotivicEtaleKTheory--M.1.json` is unchecked.

The file imports Mathlib only. Tau Ceti's `KummerCoeff`, `kummerMap`,
`ContCohomology.explicitCup11` and the projection formula are the baseline the
packet cites; they are not imported because the shared build does not compile the
pinned Tau Ceti tree. Objects that no library provides yet (Milnor K-theory,
higher Chow groups, motives, motivic cohomology, étale twists on schemes) are
introduced as `sorry`-bodied carriers with the structure the packet requires.
Where a statement needs machinery those carriers do not expose, the declaration
is listed by name and statement in the catalogue at the end, which says why
its Lean signature is omitted.
-/

noncomputable section

universe u

open CategoryTheory

set_option linter.unusedVariables false
set_option linter.unusedSectionVars false

/-! ## M.1 — coefficient modules -/

namespace TauCeti.TateTwist

variable {G : Type} [Group G]

/-- `μ_m^{⊗j}` modelled as `ZMod m` with `g` acting by `χ(g)^j`, for the mod-`m`
cyclotomic character `χ` (packet node `M.1/finite-tate-twist`). -/
def finite (m : ℕ) (χ : G →* (ZMod m)ˣ) (j : ℤ) : Representation (ZMod m) G (ZMod m) where
  toFun g := (((χ g) ^ j : (ZMod m)ˣ) : ZMod m) • LinearMap.id
  map_one' := sorry
  map_mul' := sorry

/-- The mod-`m` cyclotomic character of `G_F` on the algebraic closure; Mathlib's
`modularCyclotomicCharacter` composed with `G_F → Aut(F̄)`. -/
def cyclotomicOfField (F : Type) [Field F] (m : ℕ) [NeZero m]
    (hn : Nat.card (rootsOfUnity m (AlgebraicClosure F)) = m) :
    Field.absoluteGaloisGroup F →* (ZMod m)ˣ := sorry

theorem smul_eq_cyclotomic (m : ℕ) (χ : G →* (ZMod m)ˣ) (j : ℤ) (g : G) (x : ZMod m) :
    finite m χ j g x = (((χ g) ^ j : (ZMod m)ˣ) : ZMod m) * x := sorry

theorem card_finite (m : ℕ) [NeZero m] : Nat.card (ZMod m) = m := sorry

theorem finite_zero (m : ℕ) (χ : G →* (ZMod m)ˣ) (g : G) :
    finite m χ 0 g = LinearMap.id := sorry

/-- The twist pairing `μ_m^{⊗i} × μ_m^{⊗j} → μ_m^{⊗(i+j)}` (multiplication on `ZMod m`). -/
def pairing (m : ℕ) : ZMod m →ₗ[ZMod m] ZMod m →ₗ[ZMod m] ZMod m := LinearMap.mul (ZMod m) (ZMod m)

theorem pairing_equivariant (m : ℕ) (χ : G →* (ZMod m)ˣ) (i j : ℤ) (g : G) (x y : ZMod m) :
    pairing m (finite m χ i g x) (finite m χ j g y) = finite m χ (i + j) g (pairing m x y) := sorry

theorem pairing_comm (m : ℕ) (x y : ZMod m) : pairing m x y = pairing m y x := sorry

/-- Reduction `μ_{m'}^{⊗j} → μ_m^{⊗j}` for `m ∣ m'`. -/
def reduce {m m' : ℕ} (h : m ∣ m') : ZMod m' →+* ZMod m := ZMod.castHom h (ZMod m)

theorem reduce_equivariant {m m' : ℕ} (h : m ∣ m') (χ' : G →* (ZMod m')ˣ) (χ : G →* (ZMod m)ˣ)
    (hχ : ∀ g, reduce h (χ' g : ZMod m') = (χ g : ZMod m)) (j : ℤ) (g : G) (x : ZMod m') :
    reduce h (finite m' χ' j g x) = finite m χ j g (reduce h x) := sorry

example (m : ℕ) (χ : G →* (ZMod m)ˣ) (g : G) (x : ZMod m) : finite m χ 0 g x = x := sorry -- test_zero_trivial

example : Subsingleton (ZMod 1) := sorry -- test_m_one

/-- `ℤ_p(j)`: `ℤ_[p]` with `g` acting by `χ(g)^j` for the `p`-adic cyclotomic character
(packet node `M.1/adic-tate-twist`). -/
def adic (p : ℕ) [Fact p.Prime] (χ : G →* ℤ_[p]ˣ) (j : ℤ) : Representation ℤ_[p] G ℤ_[p] where
  toFun g := (((χ g) ^ j : ℤ_[p]ˣ) : ℤ_[p]) • LinearMap.id
  map_one' := sorry
  map_mul' := sorry

theorem adic_smul (p : ℕ) [Fact p.Prime] (χ : G →* ℤ_[p]ˣ) (j : ℤ) (g : G) (x : ℤ_[p]) :
    adic p χ j g x = (((χ g) ^ j : ℤ_[p]ˣ) : ℤ_[p]) * x := sorry

/-- `ℤ_p(j)/p^ν ≅ μ_{p^ν}^{⊗j}`: reduction is equivariant for the reduced character. -/
theorem adicQuotientEquiv (p : ℕ) [Fact p.Prime] (χ : G →* ℤ_[p]ˣ) (ν : ℕ)
    (χν : G →* (ZMod (p ^ ν))ˣ) (hχ : ∀ g, PadicInt.toZModPow ν (χ g : ℤ_[p]) = (χν g : ZMod (p ^ ν)))
    (j : ℤ) (g : G) (x : ℤ_[p]) :
    PadicInt.toZModPow ν (adic p χ j g x) = finite (p ^ ν) χν j g (PadicInt.toZModPow ν x) := sorry

/-- The correct coefficient inclusion `ι : μ_{p^a}^{⊗j} → μ_{p^{a+b}}^{⊗j}`, multiplication by `p^b`. -/
def coeffInclusion (p a b : ℕ) : ZMod (p ^ a) →+ ZMod (p ^ (a + b)) := sorry

theorem coeffInclusion_injective (p a b : ℕ) [Fact p.Prime] :
    Function.Injective (coeffInclusion p a b) := sorry

example (p : ℕ) [Fact p.Prime] (χ : G →* ℤ_[p]ˣ) (g : G) (x : ℤ_[p]) : adic p χ 0 g x = x := sorry -- test_adic_zero

/-- `ℚ/ℤ(j) = ⊕_{ℓ ≠ char F} ℚ_ℓ/ℤ_ℓ(j)` as a discrete `G_F`-module (`M.1/primewise-q-mod-z-twist`). -/
def ratModInt (F : Type) [Field F] (j : ℤ) : Type := sorry

instance (F : Type) [Field F] (j : ℤ) : AddCommGroup (ratModInt F j) := sorry

/-- `w_j(F) = #H⁰(F, ℚ/ℤ(j))` when finite. -/
def w (F : Type) [Field F] (j : ℤ) : ℕ := sorry

example : w ℚ 2 = 24 := sorry -- test_w2_rat

/-- The bigraded Galois cohomology `H^i(F, μ_m^{⊗j})` (`M.1/twisted-cohomology-ring`), the
continuous cohomology of ProfiniteCohomology Layer 10 at the twist module. -/
def H (F : Type) [Field F] (m : ℕ) (i : ℕ) (j : ℤ) : Type := sorry

instance (F : Type) [Field F] (m i : ℕ) (j : ℤ) : AddCommGroup (H F m i j) := sorry

/-- The cup product `H^i(μ_m^{⊗a}) × H^k(μ_m^{⊗b}) → H^{i+k}(μ_m^{⊗(a+b)})`. -/
def cup (F : Type) [Field F] (m i k : ℕ) (a b : ℤ) : H F m i a →+ H F m k b →+ H F m (i + k) (a + b) := sorry

/-- Restriction and corestriction along a finite separable extension `E/F`. -/
def res (F E : Type) [Field F] [Field E] [Algebra F E] (m i : ℕ) (j : ℤ) : H F m i j →+ H E m i j := sorry

def cor (F E : Type) [Field F] [Field E] [Algebra F E] (m i : ℕ) (j : ℤ) : H E m i j →+ H F m i j := sorry

theorem cor_res (F E : Type) [Field F] [Field E] [Algebra F E] [FiniteDimensional F E]
    (m i : ℕ) (j : ℤ) (x : H F m i j) :
    cor F E m i j (res F E m i j x) = Module.finrank F E • x := sorry

theorem projection_formula (F E : Type) [Field F] [Field E] [Algebra F E] (m i k : ℕ) (a b : ℤ)
    (x : H F m i a) (y : H E m k b) :
    cor F E m (i + k) (a + b) (cup E m i k a b (res F E m i a x) y) = cup F m i k a b x (cor F E m k b y) := sorry

/-- The Kummer class map `κ : F^× → H¹(F, μ_m)` (Tau Ceti's `kummerMap` in the baseline). -/
def kummer (F : Type) [Field F] (m : ℕ) : Additive Fˣ →+ H F m 1 1 := sorry

/-- `M.1/continuous-limit-comparison`: the continuous ℓ-adic groups and the Milnor sequence. -/
def Hcont (F : Type) [Field F] (ℓ : ℕ) (i : ℕ) (j : ℤ) : Type := sorry

instance (F : Type) [Field F] (ℓ i : ℕ) (j : ℤ) : AddCommGroup (Hcont F ℓ i j) := sorry

/-- The projections `H^i(F, ℤ_ℓ(j)) → H^i(F, μ_{ℓ^ν}^{⊗j})`. -/
def toFinite (F : Type) [Field F] (ℓ i : ℕ) (j : ℤ) (ν : ℕ) : Hcont F ℓ i j →+ H F (ℓ ^ ν) i j := sorry

/-- `M.1/continuous-limit-comparison` (a), finite case: the projections are jointly injective. -/
theorem continuous_limit_injective (F : Type) [Field F] (ℓ : ℕ) [Fact ℓ.Prime] (i : ℕ) (j : ℤ)
    (hfin : ∀ ν, Finite (H F (ℓ ^ ν) (i - 1) j)) (x : Hcont F ℓ i j)
    (hx : ∀ ν, toFinite F ℓ i j ν x = 0) : x = 0 := sorry

end TauCeti.TateTwist

namespace TauCeti.EtaleTwist

open AlgebraicGeometry

/-- Étale cohomology `H^i_et(X, μ_m^{⊗j})` of a scheme with `m` invertible, as Mathlib's sheaf
cohomology on the small étale site (`M.1/etale-twist-sheaf`). -/
def H (X : Scheme.{0}) (m : ℕ) (i : ℕ) (j : ℤ) : Type := sorry

instance (X : Scheme.{0}) (m i : ℕ) (j : ℤ) : AddCommGroup (H X m i j) := sorry

/-- Continuous ℓ-adic étale cohomology, the cohomology of `R lim_ν RΓ_et(X, μ_{ℓ^ν}^{⊗j})`. -/
def Hcont (X : Scheme.{0}) (ℓ i : ℕ) (j : ℤ) : Type := sorry

instance (X : Scheme.{0}) (ℓ i : ℕ) (j : ℤ) : AddCommGroup (Hcont X ℓ i j) := sorry

/-- Pullback along a morphism of schemes. -/
def pullback {X Y : Scheme.{0}} (f : X ⟶ Y) (m i : ℕ) (j : ℤ) : H Y m i j →+ H X m i j := sorry

theorem pullback_id (X : Scheme.{0}) (m i : ℕ) (j : ℤ) (x : H X m i j) : pullback (𝟙 X) m i j x = x := sorry

/-- `M.1/field-etale-galois-comparison`. -/
theorem field_etale_galois_comparison (F : Type) [Field F] (m i : ℕ) (j : ℤ) :
    Nonempty (H (Spec (CommRingCat.of F)) m i j ≃+ TauCeti.TateTwist.H F m i j) := sorry

/-- `M.1/etale-kummer-sequences`, first sequence, for `X = Spec A`. -/
theorem etale_kummer_units (A : Type) [CommRing A] (n : ℕ) (hn : IsUnit (n : A)) :
    ∃ f : Additive Aˣ →+ H (Spec (CommRingCat.of A)) n 1 1,
      f.ker = AddSubgroup.map (nsmulAddMonoidHom n) ⊤ := sorry

/-- `M.1/henselian-residue-comparison`. -/
theorem henselian_residue_comparison (A : Type) [CommRing A] [HenselianLocalRing A]
    (m i : ℕ) (j : ℤ) (hm : IsUnit (m : IsLocalRing.ResidueField A)) :
    Nonempty (H (Spec (CommRingCat.of A)) m i j ≃+ TauCeti.TateTwist.H (IsLocalRing.ResidueField A) m i j) := sorry

end TauCeti.EtaleTwist

/-! ## M.2 — real places -/

namespace TauCeti.RealPlaces

/-- The number of real places `r₁` of a number field (`M.2/real-restriction-map`). -/
def r₁ (F : Type) [Field F] [NumberField F] : ℕ := sorry

/-- Étale cohomology of `O_{F,S}` with 2-primary coefficients `ℤ/2^ν(j)`, and the restriction
`α^n_S(j)` to the real places. -/
def HS (F : Type) [Field F] [NumberField F] (S : Finset ℕ) (ν n : ℕ) (j : ℤ) : Type := sorry

instance (F : Type) [Field F] [NumberField F] (S : Finset ℕ) (ν n : ℕ) (j : ℤ) : AddCommGroup (HS F S ν n j) := sorry

/-- `H^n(ℝ, ℤ/2^ν(j))`. -/
def HReal (ν n : ℕ) (j : ℤ) : Type := sorry

instance (ν n : ℕ) (j : ℤ) : AddCommGroup (HReal ν n j) := sorry

def alpha (F : Type) [Field F] [NumberField F] (S : Finset ℕ) (ν n : ℕ) (j : ℤ) :
    HS F S ν n j →+ (Fin (r₁ F) → HReal ν n j) := sorry

theorem realCohomology_modTwo (n : ℕ) : Nonempty (HReal 1 n 0 ≃+ ZMod 2) := sorry

/-- `M.2/positive-and-modified-cohomology`: the kernel groups `H̃^n = ker α^n`. -/
def kernelCohomology (F : Type) [Field F] [NumberField F] (S : Finset ℕ) (ν n : ℕ) (j : ℤ) :
    AddSubgroup (HS F S ν n j) := (alpha F S ν n j).ker

/-- Positive cohomology `H^n_+`, the cohomology of the fibre of `α` on cochains. -/
def positiveCohomology (F : Type) [Field F] [NumberField F] (S : Finset ℕ) (ν n : ℕ) (j : ℤ) : Type := sorry

instance (F : Type) [Field F] [NumberField F] (S : Finset ℕ) (ν n : ℕ) (j : ℤ) :
    AddCommGroup (positiveCohomology F S ν n j) := sorry

/-- `M.2/high-degree-real-isomorphism` (b). -/
theorem alpha_bijective_of_three_le (F : Type) [Field F] [NumberField F] (S : Finset ℕ) (ν n : ℕ) (j : ℤ)
    (hn : 3 ≤ n) : Function.Bijective (alpha F S ν n j) := sorry

/-- Complex places, finite places of `S`, and `t = dim Pic(O_{F,S})/2`. -/
def r₂ (F : Type) [Field F] [NumberField F] : ℕ := sorry

def numFinite (F : Type) [Field F] [NumberField F] (S : Finset ℕ) : ℕ := sorry

def picTwoRank (F : Type) [Field F] [NumberField F] (S : Finset ℕ) : ℕ := sorry

/-- `M.2/mod-two-dimension-formulas` (a). -/
theorem dim_H1_modTwo (F : Type) [Field F] [NumberField F] (S : Finset ℕ) :
    Nat.card (HS F S 1 1 0) = 2 ^ (r₁ F + r₂ F + numFinite F S + picTwoRank F S) := sorry

end TauCeti.RealPlaces

/-! ## M.3 — the Galois symbol and Tate's theorems -/

namespace TauCeti.GaloisSymbol

open TauCeti.TateTwist

/-- Classical `K₂` of a field (K2SymbolsBrauer T.1), a supplier carrier here. -/
def K2 (F : Type) [Field F] : Type := sorry

instance (F : Type) [Field F] : AddCommGroup (K2 F) := sorry

/-- The Steinberg symbol `{a, b}` (K2SymbolsBrauer T.2). -/
def steinberg (F : Type) [Field F] : Additive Fˣ →+ Additive Fˣ →+ K2 F := sorry

/-- `M.3/cohomological-steinberg`. -/
theorem cohomological_steinberg (F : Type) [Field F] (m : ℕ) (hm : IsUnit (m : F)) (a : Fˣ)
    (ha : (a : F) ≠ 1) (hb : IsUnit (1 - (a : F))) :
    cup F m 1 1 1 1 (kummer F m (Additive.ofMul a)) (kummer F m (Additive.ofMul hb.unit)) = 0 := sorry

/-- `M.3/galois-symbol`: `h_{F,m} : K₂(F) → H²(F, μ_m^{⊗2})`, killing `m K₂(F)`. -/
def symbol (F : Type) [Field F] (m : ℕ) : K2 F →+ H F m 2 2 := sorry

theorem symbol_steinberg (F : Type) [Field F] (m : ℕ) (a b : Fˣ) :
    symbol F m (steinberg F (Additive.ofMul a) (Additive.ofMul b)) =
      cup F m 1 1 1 1 (kummer F m (Additive.ofMul a)) (kummer F m (Additive.ofMul b)) := sorry

theorem symbol_mul_m (F : Type) [Field F] (m : ℕ) (x : K2 F) : symbol F m (m • x) = 0 := sorry

theorem symbol_unique (F : Type) [Field F] (m : ℕ) (f g : K2 F →+ H F m 2 2)
    (h : ∀ a b : Fˣ, f (steinberg F (Additive.ofMul a) (Additive.ofMul b)) =
      g (steinberg F (Additive.ofMul a) (Additive.ofMul b))) : f = g := sorry

/-- `M.3/adic-galois-symbol`: Tate's `h_F : K₂(F) → H²(F, ℤ_ℓ(2))`. -/
def adicSymbol (F : Type) [Field F] (ℓ : ℕ) : K2 F →+ Hcont F ℓ 2 2 := sorry

/-- The Milnor norm `N_{E/F}` on `K₂` (K2SymbolsBrauer T.4), supplier carrier. -/
def norm (F E : Type) [Field F] [Field E] [Algebra F E] : K2 E →+ K2 F := sorry

/-- `M.3/symbol-norm-compatibility`. -/
theorem symbol_norm (F E : Type) [Field F] [Field E] [Algebra F E] [FiniteDimensional F E]
    (m : ℕ) (x : K2 E) : cor F E m 2 2 (symbol E m x) = symbol F m (norm F E x) := sorry

/-- `M.3/tate-local`, for a finite extension of `ℚ_p` and a prime `ℓ`. -/
theorem tate_local (p ℓ : ℕ) [Fact p.Prime] [Fact ℓ.Prime] (F : Type) [Field F] [Algebra ℚ_[p] F]
    [FiniteDimensional ℚ_[p] F] :
    Function.Surjective (symbol F ℓ) ∧ (symbol F ℓ).ker = AddSubgroup.map (nsmulAddMonoidHom ℓ) ⊤ := sorry

/-- `M.3/tate-global` (c): `K₂(F)/ℓ^r ≅ H²(F, μ_{ℓ^r}^{⊗2})` for a number field. -/
theorem tate_global (F : Type) [Field F] [NumberField F] (ℓ r : ℕ) [Fact ℓ.Prime] :
    Function.Surjective (symbol F (ℓ ^ r)) ∧
      (symbol F (ℓ ^ r)).ker = AddSubgroup.map (nsmulAddMonoidHom (ℓ ^ r)) ⊤ := sorry

/-- `M.3/tate-torsion-symbols`: with a primitive `ℓ`-th root `z`, every element of order `ℓ`
in `K₂(F)` is `{z, a}`. -/
theorem tate_torsion_symbols (F : Type) [Field F] [NumberField F] (ℓ : ℕ) [Fact ℓ.Prime]
    (z : Fˣ) (hz : IsPrimitiveRoot z ℓ) (x : K2 F) (hx : ℓ • x = 0) :
    ∃ a : Fˣ, x = steinberg F (Additive.ofMul z) (Additive.ofMul a) := sorry

end TauCeti.GaloisSymbol

/-! ## M.4 — cycle complexes and motivic cohomology -/

namespace TauCeti.HigherChow

open AlgebraicGeometry

/-- The algebraic `n`-simplex `Δ^n_B` (`M.4/algebraic-simplex`). -/
def simplex (B : Scheme.{0}) (n : ℕ) : Scheme.{0} := sorry

def coface (B : Scheme.{0}) (n : ℕ) (i : Fin (n + 2)) : simplex B n ⟶ simplex B (n + 1) := sorry

/-- `z^q(X, n)`: admissible codimension-`q` cycles on `X × Δ^n`, as a subgroup of Mathlib's
algebraic cycles (`M.4/admissible-cycles`). -/
def cycles (X : Scheme.{0}) (q n : ℕ) : AddSubgroup (AlgebraicCycle (simplex X n) ℤ) := sorry

/-- Bloch's higher Chow groups `CH^q(X, n)` (`M.4/cycle-complex`). -/
def CH (X : Scheme.{0}) (q n : ℕ) : Type := sorry

instance (X : Scheme.{0}) (q n : ℕ) : AddCommGroup (CH X q n) := sorry

/-- Motivic cohomology `H^p(X, ℤ(q)) = CH^q(X, 2q - p)`, with `A` coefficients. -/
def H (X : Scheme.{0}) (A : Type) [AddCommGroup A] (p : ℤ) (q : ℕ) : Type := sorry

instance (X : Scheme.{0}) (A : Type) [AddCommGroup A] (p : ℤ) (q : ℕ) : AddCommGroup (H X A p q) := sorry

/-- Milnor K-theory of a field (K2SymbolsBrauer T.2), supplier carrier. -/
def KM (F : Type) [Field F] (n : ℕ) : Type := sorry

instance (F : Type) [Field F] (n : ℕ) : AddCommGroup (KM F n) := sorry

/-- `M.4/nesterenko-suslin-totaro`. -/
theorem nesterenko_suslin_totaro (F : Type) [Field F] (n : ℕ) :
    Nonempty (KM F n ≃+ CH (Spec (CommRingCat.of F)) n n) := sorry

/-- `M.4/vanishing-above-weight`. -/
theorem CH_field_eq_zero (F : Type) [Field F] (i n : ℕ) (h : n < i) (x : CH (Spec (CommRingCat.of F)) i n) :
    x = 0 := sorry

/-- `M.4/weight-zero-and-one` for a field: `H¹(F, ℤ(1)) ≅ F^×`. -/
theorem weight_one_field (F : Type) [Field F] :
    Nonempty (H (Spec (CommRingCat.of F)) ℤ 1 1 ≃+ Additive Fˣ) := sorry

/-- Pullback (`M.4/functoriality`, `M.4/products`) and proper pushforward with a codimension shift. -/
def pullback {Y X : Scheme.{0}} (f : Y ⟶ X) (q n : ℕ) : CH X q n →+ CH Y q n := sorry

def pushforward {Z X : Scheme.{0}} (i : Z ⟶ X) (c q n : ℕ) : CH Z (q - c) n →+ CH X q n := sorry

/-- `M.4/localization-sequence`, exactness at `CH^q(X, n)` for a closed immersion `i` of pure
codimension `c` with open complement `j`. -/
theorem localization_exact {Z X U : Scheme.{0}} (i : Z ⟶ X) (j : U ⟶ X) [IsClosedImmersion i]
    [IsOpenImmersion j] (hc : ∀ x, x ∈ Set.range i.base ↔ x ∉ Set.range j.base) (c q n : ℕ) :
    (pullback j q n).ker = (pushforward i c q n).range := sorry

/-- `M.4/homotopy-invariance`. -/
theorem homotopy_invariance (X : Scheme.{0}) (q n : ℕ) :
    Function.Bijective (pullback (𝔸(ULift.{0} (Fin 1); X) ↘ X) q n) := sorry

end TauCeti.HigherChow

/-! ## M.5a — transfers and effective motives -/

namespace TauCeti.Transfers

open AlgebraicGeometry

/-- `Cor_k(X, Y)` (`M.5a/finite-correspondence`). -/
def Cor (k : Type) [Field k] (X Y : Scheme.{0}) : Type := sorry

instance (k : Type) [Field k] (X Y : Scheme.{0}) : AddCommGroup (Cor k X Y) := sorry

def graph (k : Type) [Field k] {X Y : Scheme.{0}} (f : X ⟶ Y) : Cor k X Y := sorry

def comp (k : Type) [Field k] {X Y Z : Scheme.{0}} : Cor k Y Z →+ Cor k X Y →+ Cor k X Z := sorry

theorem graph_comp (k : Type) [Field k] {X Y Z : Scheme.{0}} (f : X ⟶ Y) (g : Y ⟶ Z) :
    comp k (graph k g) (graph k f) = graph k (f ≫ g) := sorry

/-- The effective motives `DM^{eff,−}_Nis(k, R)` (`M.5a/effective-motives`). -/
def DMeff (k : Type) [Field k] (R : Type) [CommRing R] : Type := sorry

/-- Motivic cohomology `H^{p,q}(X, R)` of `M.5a/suslin-complex-and-motivic-complexes`. -/
def motivicCohomology (k : Type) [Field k] (X : Scheme.{0}) (R : Type) [CommRing R] (p : ℤ) (q : ℕ) : Type := sorry

instance (k : Type) [Field k] (X : Scheme.{0}) (R : Type) [CommRing R] (p : ℤ) (q : ℕ) :
    AddCommGroup (motivicCohomology k X R p q) := sorry

/-- `M.5a/etale-motivic-comparison` (b): the map to étale cohomology. -/
def toEtale (k : Type) [Field k] (X : Scheme.{0}) (n : ℕ) (p : ℕ) (q : ℕ) :
    motivicCohomology k X (ZMod n) p q →+ TauCeti.EtaleTwist.H X n p q := sorry

/-- Morphism groups of `DM^{eff,−}` and the Tate twist `− ⊗ ℤ(1)`. -/
def DMHom (k : Type) [Field k] (R : Type) [CommRing R] (M N : DMeff k R) : Type := sorry

def tateTwist (k : Type) [Field k] (R : Type) [CommRing R] : DMeff k R → DMeff k R := sorry

def twistHom (k : Type) [Field k] (R : Type) [CommRing R] (M N : DMeff k R) :
    DMHom k R M N → DMHom k R (tateTwist k R M) (tateTwist k R N) := sorry

/-- `M.5a/cancellation`: tensoring with `ℤ(1)` is bijective on morphisms over a perfect field. -/
theorem cancellation (k : Type) [Field k] [PerfectField k] (M N : DMeff k ℤ) :
    Function.Bijective (twistHom k ℤ M N) := sorry

end TauCeti.Transfers

/-! ## M.5b — operations and norm varieties -/

namespace TauCeti.MotivicSteenrod

open AlgebraicGeometry TauCeti.Transfers

/-- `M.5b/motivic-steenrod-operations`: `P^i` and `β` on `H^{p,q}(X, ℤ/l)`. -/
def reducedPower (k : Type) [Field k] (X : Scheme.{0}) (l : ℕ) (i : ℕ) (p : ℤ) (q : ℕ) :
    motivicCohomology k X (ZMod l) p q →+ motivicCohomology k X (ZMod l) (p + 2 * i * (l - 1)) (q + i * (l - 1)) := sorry

def bockstein (k : Type) [Field k] (X : Scheme.{0}) (l : ℕ) (p : ℤ) (q : ℕ) :
    motivicCohomology k X (ZMod l) p q →+ motivicCohomology k X (ZMod l) (p + 1) q := sorry

/-- `P^0 = Id` (`M.5b/steenrod-relations`). -/
theorem reducedPower_zero (k : Type) [Field k] (X : Scheme.{0}) (l : ℕ) (p : ℤ) (q : ℕ)
    (x : motivicCohomology k X (ZMod l) p q) :
    HEq (reducedPower k X l 0 p q x) x := sorry

theorem bockstein_bockstein (k : Type) [Field k] (X : Scheme.{0}) (l : ℕ) (p : ℤ) (q : ℕ)
    (x : motivicCohomology k X (ZMod l) p q) :
    bockstein k X l (p + 1) q (bockstein k X l p q x) = 0 := sorry

end TauCeti.MotivicSteenrod

namespace TauCeti.RostMotive

open AlgebraicGeometry

/-- The characteristic number `s_d(X)` of a smooth projective variety (`M.5b/nu-variety`). -/
def charNumber (k : Type) [Field k] (X : Scheme.{0}) : ℤ := sorry

def dim (X : Scheme.{0}) : ℕ := sorry

/-- `X` is a `ν_n`-variety for the prime `l`. -/
def IsNuVariety (k : Type) [Field k] (l n : ℕ) (X : Scheme.{0}) : Prop :=
  dim X = l ^ n - 1 ∧ ¬ ((l : ℤ) ^ 2 ∣ charNumber k X)

/-- The generalised Rost motive of a norm variety (`M.5c/rost-motive`), an object of
`DM^{eff,−}(k, ℤ_(l))`. -/
def rostMotive (k : Type) [Field k] (l n : ℕ) (a : Fin n → kˣ) (X : Scheme.{0}) :
    TauCeti.Transfers.DMeff k ℤ := sorry

end TauCeti.RostMotive

/-! ## M.5c and M.5 — the norm residue homomorphism and theorem -/

namespace TauCeti.NormResidue

open TauCeti.TateTwist TauCeti.HigherChow

/-- `M.5c/galois-symbol-all-degrees`: `h^n_F : K^M_n(F) → H^n(F, μ_m^{⊗n})`, killing `m`. -/
def map (F : Type) [Field F] (m n : ℕ) : KM F n →+ TauCeti.TateTwist.H F m n n := sorry

theorem map_mul_m (F : Type) [Field F] (m n : ℕ) (x : KM F n) : map F m n (m • x) = 0 := sorry

/-- `M.5c/mod-l-norm-residue`: bijectivity mod `l` in characteristic zero. -/
theorem mod_l_norm_residue (F : Type) [Field F] [CharZero F] (l n : ℕ) [Fact l.Prime] :
    Function.Surjective (map F l n) ∧
      (map F l n).ker = AddSubgroup.map (nsmulAddMonoidHom l) ⊤ := sorry

/-- `M.5/norm-residue-theorem` (Rost–Voevodsky). -/
theorem norm_residue (F : Type) [Field F] (ℓ r n : ℕ) [Fact ℓ.Prime] (hℓ : IsUnit (ℓ : F)) :
    Function.Surjective (map F (ℓ ^ r) n) ∧
      (map F (ℓ ^ r) n).ker = AddSubgroup.map (nsmulAddMonoidHom (ℓ ^ r)) ⊤ := sorry

end TauCeti.NormResidue

/-! ## Further API signatures and unit tests -/

namespace TauCeti.TateTwist

variable {G : Type} [Group G]

theorem pairing_assoc (m : ℕ) (x y z : ZMod m) :
    pairing m (pairing m x y) z = pairing m x (pairing m y z) := sorry

/-- With a primitive `m`-th root in the field the character is trivial and the twist is `ℤ/m`. -/
theorem trivialise (m : ℕ) (χ : G →* (ZMod m)ˣ) (hχ : ∀ g, χ g = 1) (j : ℤ) (g : G) :
    finite m χ j g = LinearMap.id := sorry

/-- `ℚ_p(j) = ℤ_p(j) ⊗ ℚ_p`. -/
def rational (p : ℕ) [Fact p.Prime] (χ : G →* ℤ_[p]ˣ) (j : ℤ) : Representation ℚ_[p] G ℚ_[p] := sorry

/-- `ℚ_p/ℤ_p(j) = colim_ν μ_{p^ν}^{⊗j}` as a discrete module. -/
def divisible (p : ℕ) [Fact p.Prime] (χ : G →* ℤ_[p]ˣ) (j : ℤ) : Type := sorry

theorem shortExact_mul (p : ℕ) [Fact p.Prime] (ν : ℕ) :
    Function.Exact (fun x : ℤ_[p] => (p ^ ν : ℕ) • x) (PadicInt.toZModPow ν) := sorry

example (p : ℕ) [Fact p.Prime] (χ : G →* ℤ_[p]ˣ) (g : G) (x : ℤ_[p]) :
    adic p χ 1 g x = (χ g : ℤ_[p]) * x := sorry -- test_adic_char

theorem cup_assoc (F : Type) [Field F] (m i k n : ℕ) (a b c : ℤ) (x : H F m i a) (y : H F m k b)
    (z : H F m n c) :
    HEq (cup F m (i + k) n (a + b) c (cup F m i k a b x y) z)
      (cup F m i (k + n) a (b + c) x (cup F m k n b c y z)) := sorry

theorem cup_comm (F : Type) [Field F] (m i k : ℕ) (a b : ℤ) (x : H F m i a) (y : H F m k b) :
    HEq (cup F m i k a b x y) ((-1 : ℤ) ^ (i * k) • cup F m k i b a y x) := sorry

theorem res_cup (F E : Type) [Field F] [Field E] [Algebra F E] (m i k : ℕ) (a b : ℤ)
    (x : H F m i a) (y : H F m k b) :
    res F E m (i + k) (a + b) (cup F m i k a b x y) = cup E m i k a b (res F E m i a x) (res F E m k b y) := sorry

example (F : Type) [Field F] (m : ℕ) : Nonempty (H F m 0 0 ≃+ ZMod m) := sorry -- test_H0

example (n : ℕ) : Nonempty (H ℝ 2 n n ≃+ ZMod 2) := sorry -- test_real_mod_two

end TauCeti.TateTwist

namespace TauCeti.EtaleTwist

open AlgebraicGeometry

example : Nonempty (H (Spec (CommRingCat.of (ZMod 5))) 4 1 1 ≃+ ZMod 4) := sorry -- test_finite_field_H1

example (F : Type) [Field F] (m : ℕ) (j : ℤ) :
    Nonempty (H (Spec (CommRingCat.of F)) m 0 j ≃+ TauCeti.TateTwist.H F m 0 j) := sorry -- test_field_H0

end TauCeti.EtaleTwist

namespace TauCeti.RealPlaces

example (F : Type) [Field F] [NumberField F] (h : r₁ F = 0) (ν n : ℕ) (j : ℤ) :
    Subsingleton (Fin (r₁ F) → HReal ν n j) := sorry -- test_totally_imaginary

end TauCeti.RealPlaces

namespace TauCeti.GaloisSymbol

open TauCeti.TateTwist

/-- Functoriality of `K₂` along a field extension (K2SymbolsBrauer), supplier carrier. -/
def K2map (F E : Type) [Field F] [Field E] [Algebra F E] : K2 F →+ K2 E := sorry

/-- Reduction of coefficients `H(F, μ_{m'}^{⊗j}) → H(F, μ_m^{⊗j})` for `m ∣ m'`. -/
def reduceH (F : Type) [Field F] {m m' : ℕ} (h : m ∣ m') (i : ℕ) (j : ℤ) : H F m' i j →+ H F m i j := sorry

theorem symbol_res (F E : Type) [Field F] [Field E] [Algebra F E] (m : ℕ) (x : K2 F) :
    res F E m 2 2 (symbol F m x) = symbol E m (K2map F E x) := sorry

theorem symbol_reduce (F : Type) [Field F] {m m' : ℕ} (h : m ∣ m') (x : K2 F) :
    reduceH F h 2 2 (symbol F m' x) = symbol F m x := sorry

theorem symbol_skew (F : Type) [Field F] (m : ℕ) (a b : Fˣ) :
    symbol F m (steinberg F (Additive.ofMul a) (Additive.ofMul b)) =
      - symbol F m (steinberg F (Additive.ofMul b) (Additive.ofMul a)) := sorry

example (F : Type) [Field F] (m : ℕ) (b : Fˣ) :
    symbol F m (steinberg F (Additive.ofMul 1) (Additive.ofMul b)) = 0 := sorry -- test_one

example : symbol ℝ 2 (steinberg ℝ (Additive.ofMul (-1 : ℝˣ)) (Additive.ofMul (-1 : ℝˣ))) ≠ 0 := sorry -- test_hamilton

/-- The `ℓ`-adic Kummer map `d_F` and cup product on continuous cohomology. -/
def kummerCont (F : Type) [Field F] (ℓ : ℕ) : Additive Fˣ →+ Hcont F ℓ 1 1 := sorry

def cupCont (F : Type) [Field F] (ℓ i k : ℕ) (a b : ℤ) :
    Hcont F ℓ i a →+ Hcont F ℓ k b →+ Hcont F ℓ (i + k) (a + b) := sorry

theorem adicSymbol_steinberg (F : Type) [Field F] (ℓ : ℕ) (a b : Fˣ) :
    adicSymbol F ℓ (steinberg F (Additive.ofMul a) (Additive.ofMul b)) =
      cupCont F ℓ 1 1 1 1 (kummerCont F ℓ (Additive.ofMul a)) (kummerCont F ℓ (Additive.ofMul b)) := sorry

theorem adicSymbol_reduce (F : Type) [Field F] (ℓ ν : ℕ) (x : K2 F) :
    toFinite F ℓ 2 2 ν (adicSymbol F ℓ x) = symbol F (ℓ ^ ν) x := sorry

theorem adicSymbol_divisible (F : Type) [Field F] (ℓ : ℕ) (x : K2 F) (hx : ∀ n : ℕ, ∃ y, x = ℓ ^ n • y) :
    adicSymbol F ℓ x = 0 := sorry

example (F : Type) [Field F] (ℓ : ℕ) (b : Fˣ) :
    adicSymbol F ℓ (steinberg F (Additive.ofMul 1) (Additive.ofMul b)) = 0 := sorry -- test_adic_one

example (F : Type) [Field F] [IsAlgClosed F] (ℓ : ℕ) (x : K2 F) : adicSymbol F ℓ x = 0 := sorry -- test_adic_closed

end TauCeti.GaloisSymbol

namespace TauCeti.HigherChow

open AlgebraicGeometry

def codegeneracy (B : Scheme.{0}) (n : ℕ) (i : Fin (n + 1)) : simplex B (n + 1) ⟶ simplex B n := sorry

theorem simplex_iso_affine (B : Scheme.{0}) (n : ℕ) :
    Nonempty (simplex B n ≅ 𝔸(ULift.{0} (Fin n); B)) := sorry

/-- The cube `□^n_B = (ℙ¹_B ∖ {1})^n`. -/
def cube (B : Scheme.{0}) (n : ℕ) : Scheme.{0} := sorry

example (B : Scheme.{0}) : Nonempty (simplex B 0 ≅ B) := sorry -- test_simplex_zero

def face_restrict (X : Scheme.{0}) (q n : ℕ) (i : Fin (n + 2)) : cycles X q (n + 1) →+ cycles X q n := sorry

/-- Dimension-indexed admissible cycles over a Dedekind base. -/
def cyclesDim (X : Scheme.{0}) (r n : ℕ) : AddSubgroup (AlgebraicCycle (simplex X n) ℤ) := sorry

theorem CH_neg (X : Scheme.{0}) (A : Type) [AddCommGroup A] (p : ℤ) (q : ℕ) (h : 2 * (q : ℤ) < p)
    (x : H X A p q) : x = 0 := sorry

example (F : Type) [Field F] : Nonempty (CH (Spec (CommRingCat.of F)) 0 0 ≃+ ℤ) := sorry -- test_q_zero

example (F : Type) [Field F] : Nonempty (CH (Spec (CommRingCat.of F)) 1 1 ≃+ Additive Fˣ) := sorry -- test_field_weight_one

/-- Admissible cubical cycles modulo degenerate ones. -/
def cubeCycles (X : Scheme.{0}) (q n : ℕ) : Type := sorry

instance (X : Scheme.{0}) (q n : ℕ) : AddCommGroup (cubeCycles X q n) := sorry

/-- The Milnor symbol `{a₁, …, aₙ}` in Milnor K-theory and the cycle `(a₁, …, aₙ) ∈ □^n_F`. -/
def milnorSymbol (F : Type) [Field F] (n : ℕ) : (Fin n → Fˣ) → KM F n := sorry

def milnorCycle (F : Type) [Field F] (n : ℕ) (a : Fin n → Fˣ) : cubeCycles (Spec (CommRingCat.of F)) n n := sorry

def extProduct (X Y XY : Scheme.{0}) (p r n m : ℕ) : CH X p n →+ CH Y r m →+ CH XY (p + r) (n + m) := sorry

def cup (X : Scheme.{0}) (q r n s : ℕ) : CH X q n →+ CH X r s →+ CH X (q + r) (n + s) := sorry

/-- Motivic cohomology of a scheme over a Dedekind base (`M.4/dedekind-cycle-complex`). -/
def dedekind_H (X : Scheme.{0}) (A : Type) [AddCommGroup A] (p : ℤ) (n : ℕ) : Type := sorry

instance (X : Scheme.{0}) (A : Type) [AddCommGroup A] (p : ℤ) (n : ℕ) : AddCommGroup (dedekind_H X A p n) := sorry

example : Nonempty (dedekind_H (Spec (CommRingCat.of (Localization.Away (2 : ℤ)))) ℤ 1 1 ≃+
    Additive (Localization.Away (2 : ℤ))ˣ) := sorry -- test_dedekind_units

end TauCeti.HigherChow

namespace TauCeti.Transfers

open AlgebraicGeometry

theorem comp_assoc (k : Type) [Field k] {X Y Z W : Scheme.{0}} (f : Cor k X Y) (g : Cor k Y Z) (h : Cor k Z W) :
    comp k h (comp k g f) = comp k (comp k h g) f := sorry

/-- Presheaves and Nisnevich sheaves with transfers, and `ℤ_tr(X)`. -/
def PST (k : Type) [Field k] : Type := sorry

def NST (k : Type) [Field k] : Type := sorry

def ztr (k : Type) [Field k] (X : Scheme.{0}) : PST k := sorry

/-- The motive `M(X)` and the Tate objects `R(q)[p]` of `DM^{eff,−}`. -/
def motive (k : Type) [Field k] (R : Type) [CommRing R] (X : Scheme.{0}) : DMeff k R := sorry

def tate (k : Type) [Field k] (R : Type) [CommRing R] (q : ℕ) (p : ℤ) : DMeff k R := sorry

theorem hom_motive_tate (k : Type) [Field k] (R : Type) [CommRing R] (X : Scheme.{0}) (p : ℤ) (q : ℕ) :
    Nonempty (DMHom k R (motive k R X) (tate k R q p) ≃ motivicCohomology k X R p q) := sorry

theorem diagonal_milnor (k : Type) [Field k] (n : ℕ) :
    Nonempty (motivicCohomology k (Spec (CommRingCat.of k)) ℤ n n ≃+ TauCeti.HigherChow.KM k n) := sorry

example (k : Type) [Field k] :
    Nonempty (motivicCohomology k (Spec (CommRingCat.of k)) ℤ 1 1 ≃+ Additive kˣ) := sorry -- test_weight_one_field

end TauCeti.Transfers

namespace TauCeti.MotivicSteenrod

open AlgebraicGeometry TauCeti.Transfers

/-- The Milnor operation `Q_i` of bidegree `(2l^i − 1, l^i − 1)`. -/
def milnorOp (k : Type) [Field k] (X : Scheme.{0}) (l i : ℕ) (p : ℤ) (q : ℕ) :
    motivicCohomology k X (ZMod l) p q →+ motivicCohomology k X (ZMod l) (p + 2 * l ^ i - 1) (q + l ^ i - 1) := sorry

end TauCeti.MotivicSteenrod

namespace TauCeti.RostMotive

open AlgebraicGeometry

/-- The Pfister neighbour quadric `Q_a` of `M.5b/pfister-norm-variety`. -/
def pfisterNeighbourQuadric (k : Type) [Field k] (n : ℕ) (a : Fin (n + 1) → kˣ) : Scheme.{0} := sorry

theorem pfister_dim (k : Type) [Field k] (n : ℕ) (a : Fin (n + 1) → kˣ) :
    dim (pfisterNeighbourQuadric k n a) = 2 ^ n - 1 := sorry

end TauCeti.RostMotive

namespace TauCeti.NormResidue

open TauCeti.TateTwist TauCeti.HigherChow

/-- Restriction and Milnor norm on Milnor K-theory (K2SymbolsBrauer T.2, T.4), supplier carriers. -/
def KMmap (F E : Type) [Field F] [Field E] [Algebra F E] (n : ℕ) : KM F n →+ KM E n := sorry

def KMnorm (F E : Type) [Field F] [Field E] [Algebra F E] (n : ℕ) : KM E n →+ KM F n := sorry

theorem map_res (F E : Type) [Field F] [Field E] [Algebra F E] (m n : ℕ) (x : KM F n) :
    res F E m n n (map F m n x) = map E m n (KMmap F E n x) := sorry

theorem map_norm (F E : Type) [Field F] [Field E] [Algebra F E] [FiniteDimensional F E] (m n : ℕ) (x : KM E n) :
    cor F E m n n (map E m n x) = map F m n (KMnorm F E n x) := sorry

example (n : ℕ) : map ℝ 2 n (milnorSymbol ℝ n (fun _ => -1)) ≠ 0 := sorry -- test_real

example (F : Type) [Field F] [Fintype F] (n : ℕ) (hn : 2 ≤ n) (x : KM F n) : x = 0 := sorry -- test_finite_field

end TauCeti.NormResidue

/-!
## Catalogue of the packet's declarations

Every node, API item and unit test of the packet, under the name the packet gives it.
`LEAN` marks a declaration given a signature above; `STATEMENT` marks one whose Lean
signature is omitted because the carrier above is a `sorry`-bodied type that does not yet
expose the operations the statement needs (§13: conditions that cannot yet be stated are
left out). The packet and the reader give the mathematical statement of each.
-/

/- ### Finite Tate twists of the roots of unity — packet node `M.1/finite-tate-twist` (construction)
Lean carrier: TauCeti.TateTwist.finite
* TauCeti.TateTwist.finite [constructor] — LEAN: For a field F, m invertible in F and j ∈ ℤ, the
    discrete G_F-module μ_m^{⊗j}.
* TauCeti.TateTwist.finite_one [equivalence] — STATEMENT: μ_m^{⊗1} ≅ KummerCoeff F m as discrete
    G_F-modules.
* TauCeti.TateTwist.finite_zero [equivalence] — LEAN: μ_m^{⊗0} ≅ ℤ/m with the trivial action.
* TauCeti.TateTwist.smul_eq_cyclotomic [characterisation] — LEAN: g • x = χ_m(g)^j • x for g ∈
    G_F and x ∈ μ_m^{⊗j}.
* TauCeti.TateTwist.card_finite [simp] — LEAN: The underlying group of μ_m^{⊗j} has exactly m
    elements and is free of rank one over ℤ/m.
* TauCeti.TateTwist.pairing [constructor] — LEAN: The equivariant ℤ/m-bilinear pairing μ_m^{⊗i}
    × μ_m^{⊗j} → μ_m^{⊗(i+j)}.
* TauCeti.TateTwist.pairing_assoc [relation] — LEAN: The pairings are associative under the
    canonical identifications of iterated twists.
* TauCeti.TateTwist.pairing_comm [relation] — LEAN: pairing(x, y) corresponds to pairing(y, x)
    under the swap isomorphism μ_m^{⊗(i+j)} ≅ μ_m^{⊗(j+i)}; on μ_m ⊗ μ_m the swap is the
    identity of the underlying cyclic group.
* TauCeti.TateTwist.trivialise [equivalence] — LEAN: If ζ ∈ F is a primitive m-th root of unity,
    1 ↦ ζ^{⊗j} is a G_F-equivariant isomorphism ℤ/m ≅ μ_m^{⊗j} (the change-of-root rule itself
    is K2SymbolsBrauer T.7's).
* TauCeti.TateTwist.res [functoriality] — LEAN: For a field extension E/F with chosen embedding
    of separable closures, the restriction of μ_m^{⊗j}(F) along G_E → G_F is μ_m^{⊗j}(E);
    identity and composition laws hold.
* TauCeti.TateTwist.reduce [functoriality] — LEAN: For m | m', the reduction μ_{m'}^{⊗j} →
    μ_m^{⊗j}, ζ ↦ ζ^{m'/m} on each factor, is a surjective equivariant map; reductions compose.
* test TateTwist.test_zero_trivial [degenerate] — LEAN (example): For j = 0, every g ∈ G_F acts
    trivially on μ_m^{⊗0} = ℤ/m.
* test TateTwist.test_m_one [degenerate] — LEAN (example): For m = 1, μ_1^{⊗j} = 0 for every j.
* test TateTwist.test_kummer_coeff [compatibility] — STATEMENT: μ_m^{⊗1} is TauCeti.KummerCoeff
    F m, with the same action and discrete topology.
* test TateTwist.test_rat_three_square [computation] — STATEMENT: For F = ℚ and m = 3, complex
    conjugation acts trivially on μ_3^{⊗2} and by −1 on μ_3^{⊗1}.
* test TateTwist.test_not_trivial_without_root [non-example] — STATEMENT: For F = ℚ and m = 4,
    μ_4^{⊗1} and ℤ/4 (trivial action) are not isomorphic G_ℚ-modules, since complex conjugation
    acts by −1 on μ_4.
-/

/- ### ℓ-adic Tate twists and their coefficient sequences — packet node `M.1/adic-tate-twist` (construction)
Lean carrier: TauCeti.TateTwist.adic
* TauCeti.TateTwist.adic [constructor] — LEAN: The compact G_F-module ℤ_ℓ(j), free of rank one
    over ℤ_ℓ.
* TauCeti.TateTwist.adic_smul [characterisation] — LEAN: g • x = (cyclotomicCharacter ℓ g)^j • x
    on ℤ_ℓ(j).
* TauCeti.TateTwist.adicQuotientEquiv [equivalence] — LEAN: ℤ_ℓ(j)/ℓ^ν ≅ μ_{ℓ^ν}^{⊗j} as
    discrete G_F-modules, compatibly in ν.
* TauCeti.TateTwist.adicLimitEquiv [equivalence] — STATEMENT: ℤ_ℓ(j) ≅ lim_ν μ_{ℓ^ν}^{⊗j} as
    topological G_F-modules.
* TauCeti.TateTwist.rational [constructor] — LEAN: ℚ_ℓ(j) = ℤ_ℓ(j) ⊗_{ℤ_ℓ} ℚ_ℓ with the ℓ-adic
    topology.
* TauCeti.TateTwist.divisible [constructor] — LEAN: ℚ_ℓ/ℤ_ℓ(j) = colim_ν μ_{ℓ^ν}^{⊗j}, discrete,
    with ℚ_ℓ/ℤ_ℓ(j)[ℓ^ν] = μ_{ℓ^ν}^{⊗j}.
* TauCeti.TateTwist.coeffInclusion [data] — LEAN: ι : μ_{ℓ^a}^{⊗j} → μ_{ℓ^{a+b}}^{⊗j}, induced
    by multiplication by ℓ^b on ℤ_ℓ(j); it is injective with cokernel μ_{ℓ^b}^{⊗j}.
* TauCeti.TateTwist.shortExact_mul [relation] — LEAN: 0 → ℤ_ℓ(j) --ℓ^ν--> ℤ_ℓ(j) → μ_{ℓ^ν}^{⊗j}
    → 0 is exact and admits a continuous set-theoretic section.
* TauCeti.TateTwist.shortExact_rational [relation] — STATEMENT: 0 → ℤ_ℓ(j) → ℚ_ℓ(j) → ℚ_ℓ/ℤ_ℓ(j)
    → 0 is exact.
* TauCeti.TateTwist.adic_pairing [constructor] — STATEMENT: Equivariant pairings ℤ_ℓ(i) × ℤ_ℓ(j)
    → ℤ_ℓ(i+j) reducing mod ℓ^ν to the finite pairings.
* test TateTwist.test_adic_zero [degenerate] — LEAN (example): ℤ_ℓ(0) = ℤ_ℓ with trivial G_F-
    action.
* test TateTwist.test_adic_char [compatibility] — LEAN (example): On ℤ_ℓ(1), g acts by Mathlib's
    cyclotomicCharacter ℓ g.
* test TateTwist.test_rat_three_w2 [computation] — STATEMENT: H⁰(ℚ, ℚ_3/ℤ_3(2)) ≅ ℤ/3.
* test TateTwist.test_factorwise_inclusion_wrong [non-example] — STATEMENT: For j = 2 and a = b
    = 1, the factorwise inclusion μ_ℓ ⊗ μ_ℓ → μ_{ℓ²} ⊗ μ_{ℓ²} is the zero map, whereas ι is
    injective.
-/

/- ### The primewise twist ℚ/ℤ(j) and the numbers w_j(F) — packet node `M.1/primewise-q-mod-z-twist` (construction)
Lean carrier: TauCeti.TateTwist.ratModInt
* TauCeti.TateTwist.ratModInt [constructor] — LEAN: The discrete G_F-module ℚ/ℤ(j) = ⊕_{ℓ ≠ char
    F} ℚ_ℓ/ℤ_ℓ(j).
* TauCeti.TateTwist.ratModIntEquivRootsOfUnity [equivalence] — STATEMENT: ℚ/ℤ(j) ≅ μ(F^s) with g
    acting by ζ ↦ g^j(ζ).
* TauCeti.TateTwist.ratModInt_primary [projection] — STATEMENT: The ℓ-primary part of ℚ/ℤ(j) is
    ℚ_ℓ/ℤ_ℓ(j).
* TauCeti.TateTwist.w [data] — LEAN: w_j(F) = #H⁰(F, ℚ/ℤ(j)) when finite, and w_j^{(ℓ)}(F) its
    ℓ-part.
* TauCeti.TateTwist.w_eq_prod [relation] — STATEMENT: w_j(F) = ∏_ℓ w_j^{(ℓ)}(F) when H⁰(F,
    ℚ/ℤ(j)) is finite.
* test TateTwist.test_w2_rat [computation] — LEAN (example): w_2(ℚ) = 24.
* test TateTwist.test_ratModInt_zero [degenerate] — STATEMENT: ℚ/ℤ(0) has trivial action, so
    H⁰(F, ℚ/ℤ(0)) = ⊕_{ℓ≠p} ℚ_ℓ/ℤ_ℓ is infinite.
* test TateTwist.test_one_roots [compatibility] — STATEMENT: ℚ/ℤ(1) ≅ μ(F^s) with its natural
    action, whose m-torsion is KummerCoeff F m.
* test TateTwist.test_tensor_square_zero [non-example] — STATEMENT: (ℚ/ℤ) ⊗_ℤ (ℚ/ℤ) = 0, so
    ℚ/ℤ(2) is not the tensor square of ℚ/ℤ(1).
-/

/- ### The Galois cohomology ring of the twists — packet node `M.1/twisted-cohomology-ring` (construction)
Lean carrier: TauCeti.TateTwist.H, TauCeti.TateTwist.cup
* TauCeti.TateTwist.H [constructor] — LEAN: H^{i}(F, M) for the twist modules, as Layer 10's
    continuous cohomology of G_F.
* TauCeti.TateTwist.cup [constructor] — LEAN: The bigraded cup product H^{i}(μ_m^{⊗a}) ×
    H^{k}(μ_m^{⊗b}) → H^{i+k}(μ_m^{⊗(a+b)}).
* TauCeti.TateTwist.cup_assoc [relation] — LEAN: The cup product is associative.
* TauCeti.TateTwist.cup_comm [relation] — LEAN: x ∪ y = (−1)^{ik} y ∪ x for x of degree i and y
    of degree k, through the twist swap.
* TauCeti.TateTwist.res_cup [functoriality] — LEAN: Restriction to G_E is multiplicative.
* TauCeti.TateTwist.cor_res [relation] — LEAN: cor_{E/F} ∘ res_{E/F} = [E : F] on H^{i}(F,
    μ_m^{⊗j}).
* TauCeti.TateTwist.projection_formula [relation] — LEAN: cor_{E/F}(res(a) ∪ b) = a ∪
    cor_{E/F}(b).
* TauCeti.TateTwist.H_le_two_equiv [compatibility] — STATEMENT: For i ≤ 2 the groups and the
    (1,1) cup agree with Tau Ceti's H1, H2 and explicitCup11.
* test TateTwist.test_H0 [degenerate] — LEAN (example): H⁰(F, μ_m^{⊗0}) = ℤ/m and the unit of
    the ring is 1 ∈ ℤ/m.
* test TateTwist.test_real_mod_two [computation] — LEAN (example): For F = ℝ, m = 2: H^{n}(ℝ,
    μ_2^{⊗n}) ≅ ℤ/2 for all n ≥ 0, generated by κ(−1)^n.
* test TateTwist.test_explicitCup11 [compatibility] — STATEMENT: For i = k = 1 the cup product
    equals TauCeti.ContCohomology.explicitCup11 at the twist pairing.
* test TateTwist.test_not_commutative [non-example] — STATEMENT: For F = ℝ and m = 2 the degree-
    one class x = κ(−1) has x ∪ x ≠ 0, so the ring is not exterior on degree one (graded
    commutativity does not force x² = 0 when 2 = 0).
-/

/- ### Continuous cohomology of ℓ-adic twists as limits — packet node `M.1/continuous-limit-comparison` (theorem)
Lean signature: TauCeti.TateTwist.continuous_limit_injective
-/

/- ### Étale Tate twists on schemes and continuous étale cohomology — packet node `M.1/etale-twist-sheaf` (construction)
Lean carrier: TauCeti.EtaleTwist.H, TauCeti.EtaleTwist.Hcont
* TauCeti.EtaleTwist.sheaf [constructor] — STATEMENT: The étale sheaf μ_m^{⊗j} on X_et for m
    invertible on X.
* TauCeti.EtaleTwist.stalk [characterisation] — STATEMENT: The stalk at a geometric point x̄ is
    μ_m(κ(x̄))^{⊗j}, free of rank one over ℤ/m.
* TauCeti.EtaleTwist.H [constructor] — LEAN: H^{i}_et(X, μ_m^{⊗j}) := Sheaf.H of the sheaf.
* TauCeti.EtaleTwist.Hcont [constructor] — LEAN: H^{i}_cont(X, ℤ_ℓ(j)) as cohomology of R lim_ν
    RΓ_et(X, μ_{ℓ^ν}^{⊗j}).
* TauCeti.EtaleTwist.milnor_sequence [relation] — STATEMENT: 0 → lim^1 H^{i−1}_et(X,
    μ_{ℓ^ν}^{⊗j}) → H^{i}_cont(X, ℤ_ℓ(j)) → lim H^{i}_et(X, μ_{ℓ^ν}^{⊗j}) → 0.
* TauCeti.EtaleTwist.pullback [functoriality] — LEAN: Pullback along f : X' → X, with id and
    composition laws.
* TauCeti.EtaleTwist.cup [constructor] — LEAN: Cup products H^{i}_et(X, μ_m^{⊗a}) × H^{k}_et(X,
    μ_m^{⊗b}) → H^{i+k}_et(X, μ_m^{⊗(a+b)}).
* TauCeti.EtaleTwist.coeff_long_exact [relation] — STATEMENT: Long exact sequences for the
    coefficient sequences of adic-tate-twist, natural in X.
* test EtaleTwist.test_empty [degenerate] — STATEMENT: For X = ∅ every H^{i}_et(X, μ_m^{⊗j}) and
    H^{i}_cont(X, ℤ_ℓ(j)) is zero.
* test EtaleTwist.test_field_H0 [compatibility] — LEAN (example): For X = Spec F, H⁰_et(X,
    μ_m^{⊗j}) = (μ_m^{⊗j})^{G_F}, the H⁰ of finite-tate-twist.
* test EtaleTwist.test_finite_field_H1 [computation] — LEAN (example): For X = Spec 𝔽_5, m = 4,
    j = 1: H¹_et(X, μ_4) ≅ 𝔽_5^×/(𝔽_5^×)^4 ≅ ℤ/4.
* test EtaleTwist.test_cont_not_naive_limit [non-example] — STATEMENT: For X = Spec 𝔽_q with ℓ |
    q − 1, the étale sheaf of the discrete G-module ℤ_ℓ(1) has H¹ = 0 (no nonzero continuous
    cocycles into a torsion-free discrete module on which Frobenius acts by q ≠ 1), whereas
    H¹_cont(X, ℤ_ℓ(1)) ≅ ℤ_ℓ/(q − 1) ≠ 0.
-/

/- ### Étale cohomology of a field is Galois cohomology — packet node `M.1/field-etale-galois-comparison` (theorem)
Lean signature: TauCeti.EtaleTwist.field_etale_galois_comparison
-/

/- ### Étale cohomology of S-integers is cohomology of G_{F,S} — packet node `M.1/s-integer-galois-comparison` (theorem)
Lean signature: STATEMENT (the theorem is stated in the packet; its carriers are not exposed above)
-/

/- ### Étale Kummer sequences with units, Picard and Brauer terms — packet node `M.1/etale-kummer-sequences` (theorem)
Lean signature: TauCeti.EtaleTwist.etale_kummer_units
-/

/- ### Henselian local rings: cohomology of the closed point — packet node `M.1/henselian-residue-comparison` (theorem)
Lean signature: TauCeti.EtaleTwist.henselian_residue_comparison
-/

/- ### The étale localization sequence of a Dedekind scheme — packet node `M.1/localization-gysin-sequence` (theorem)
Lean signature: STATEMENT (the theorem is stated in the packet; its carriers are not exposed above)
-/

/- ### Restriction to the real places — packet node `M.2/real-restriction-map` (construction)
Lean carrier: TauCeti.RealPlaces.alpha
* TauCeti.RealPlaces.alpha [constructor] — LEAN: α^{n}_S(j) : H^{n}_et(O_{F,S}, M) → ⊕_{σ real}
    H^{n}(ℝ, M).
* TauCeti.RealPlaces.alpha_natural [functoriality] — STATEMENT: α commutes with the maps induced
    by S ⊆ T and by coefficient maps.
* TauCeti.RealPlaces.alpha_cup [compatibility] — STATEMENT: α is multiplicative for cup
    products.
* TauCeti.RealPlaces.realCohomology_divisible [simp] — STATEMENT: For n > 0, H^{n}(ℝ; ℤ/2^∞(j))
    ≅ ℤ/2 if j − n is odd and 0 if j − n is even.
* TauCeti.RealPlaces.realCohomology_modTwo [simp] — LEAN: H^{n}(ℝ; ℤ/2) ≅ ℤ/2 for every n ≥ 0.
* TauCeti.RealPlaces.alpha_one_sign [characterisation] — STATEMENT: On H¹(O_{F,S}, ℤ/2) ⊇
    O_{F,S}^×/2, α¹ is the sign map u ↦ (sign σ(u))_σ.
* test RealPlaces.test_totally_imaginary [degenerate] — LEAN (example): If r_1 = 0 the target of
    α^{n}_S(j) is 0.
* test RealPlaces.test_rat_sign [computation] — STATEMENT: For F = ℚ, S = {2, ∞}: α¹(−1) ≠ 0 and
    α¹(2) = 0.
* test RealPlaces.test_real_periodic [compatibility] — STATEMENT: For F = ℝ (r_1 = 1, no finite
    places) α is the identity of H^{n}(ℝ, M).
* test RealPlaces.test_parity [non-example] — STATEMENT: H²(ℝ; ℤ/2^∞(2)) = 0 although H²(ℝ; ℤ/2)
    ≠ 0: the divisible and mod-2 targets differ, so α for ℤ/2^∞(j) is not the mod-2 α.
-/

/- ### Positive and modified étale cohomology at the real places — packet node `M.2/positive-and-modified-cohomology` (definition)
Lean carrier: TauCeti.RealPlaces.kernelCohomology, TauCeti.RealPlaces.positiveCohomology
* TauCeti.RealPlaces.positiveCohomology [constructor] — LEAN: H^{n}_+(R, M) as cohomology of the
    fibre of α on cochains.
* TauCeti.RealPlaces.positive_long_exact [relation] — STATEMENT: The long exact sequence … → ⊕_σ
    H^{n−1}(ℝ, M) → H^{n}_+(R, M) → H^{n}(R, M) → ⊕_σ H^{n}(ℝ, M) → ….
* TauCeti.RealPlaces.kernelCohomology [constructor] — LEAN: H̃^{n}(R, M) = ker α^{n}.
* TauCeti.RealPlaces.positive_to_kernel [relation] — STATEMENT: 0 → coker α^{n−1} → H^{n}_+(R,
    M) → H̃^{n}(R, M) → 0 is exact.
* TauCeti.RealPlaces.odd_agree [characterisation] — STATEMENT: For ℓ-primary M with ℓ odd,
    H^{n}_+ = H̃^{n} = H^{n}.
* TauCeti.RealPlaces.not_tate_modified [other] — STATEMENT: The comparison map from D7's Tate-
    modified cohomology to these groups is recorded separately; no identification is asserted.
* test RealPlaces.test_totally_imaginary_agree [degenerate] — STATEMENT: If r_1 = 0 then H^{n}_+
    = H̃^{n} = H^{n} for all n.
* test RealPlaces.test_rat_kernel [computation] — STATEMENT: For F = ℚ, S = {2, ∞}, M = ℤ/2: H̃¹
    is spanned by the class of 2 and has dimension 1.
* test RealPlaces.test_high_degree [computation] — STATEMENT: For n ≥ 3, H̃^{n}(R, ℤ/2) = 0 (α^n
    is bijective) and H^{n}_+(R, ℤ/2) = 0 (α^{n−1} is surjective, by high-degree-real-
    isomorphism), although H^{n}(R, ℤ/2) ≅ (ℤ/2)^{r_1}.
* test RealPlaces.test_not_ordinary [non-example] — STATEMENT: For F = ℚ, S = {2, ∞}, M = ℤ/2, n
    = 3: H³ ≅ ℤ/2 but H̃³ = 0, so the kernel groups are not ordinary cohomology.
-/

/- ### Cohomological dimension and the real places in high degrees — packet node `M.2/high-degree-real-isomorphism` (theorem)
Lean signature: TauCeti.RealPlaces.alpha_bijective_of_three_le
-/

/- ### The Brauer group of a ring of S-integers — packet node `M.2/s-integer-brauer-sequence` (theorem)
Lean signature: STATEMENT (the theorem is stated in the packet; its carriers are not exposed above)
-/

/- ### Mod-2 dimensions, the narrow Picard group and the signature defect — packet node `M.2/mod-two-dimension-formulas` (theorem)
Lean signature: TauCeti.RealPlaces.dim_H1_modTwo
-/

/- ### Surjectivity onto the real places in even weight — packet node `M.2/even-twist-real-surjection` (lemma)
Lean signature: STATEMENT (the theorem is stated in the packet; its carriers are not exposed above)
-/

/- ### ℓ-adic cohomology of S-integers: finiteness and rationalisation — packet node `M.2/adic-s-integer-cohomology` (theorem)
Lean signature: STATEMENT (the theorem is stated in the packet; its carriers are not exposed above)
-/

/- ### The degree-two comparison diagram of localization sequences — packet node `M.2/degree-two-localization-diagram` (theorem)
Lean signature: STATEMENT (the theorem is stated in the packet; its carriers are not exposed above)
-/

/- ### The cohomological Steinberg relation — packet node `M.3/cohomological-steinberg` (theorem)
Lean signature: TauCeti.GaloisSymbol.cohomological_steinberg
-/

/- ### The Galois symbol on K₂ of a field — packet node `M.3/galois-symbol` (construction)
Lean carrier: TauCeti.GaloisSymbol.symbol
* TauCeti.GaloisSymbol.symbol [constructor] — LEAN: h_{F,m} : K_2(F)/m → H²(F, μ_m^{⊗2}).
* TauCeti.GaloisSymbol.symbol_steinberg [simp] — LEAN: h_{F,m}{a, b} = κ(a) ∪ κ(b).
* TauCeti.GaloisSymbol.symbol_unique [extensionality] — LEAN: Two homomorphisms K_2(F)/m → A
    agreeing on all Steinberg symbols are equal.
* TauCeti.GaloisSymbol.symbol_res [functoriality] — LEAN: res_{E/F} ∘ h_{F,m} = h_{E,m} ∘
    (K_2(F) → K_2(E)) for every field extension E/F.
* TauCeti.GaloisSymbol.symbol_reduce [functoriality] — LEAN: For m | m', reduction of
    coefficients intertwines h_{F,m'} and h_{F,m}.
* TauCeti.GaloisSymbol.symbol_skew [relation] — LEAN: h{a, b} = −h{b, a} and h{a, −a} = 0.
* test GaloisSymbol.test_one [degenerate] — LEAN (example): h{1, b} = 0 for every b, and for m =
    1 the symbol is the zero map between zero groups.
* test GaloisSymbol.test_hamilton [computation] — LEAN (example): For F = ℝ and m = 2, h{−1, −1}
    ≠ 0 (Hamilton's quaternions are not split).
* test GaloisSymbol.test_explicitCup11 [compatibility] — STATEMENT: h{a, b} =
    explicitCup11(kummerMap a, kummerMap b) for the tensor pairing KummerCoeff × KummerCoeff →
    μ_m^{⊗2} (Tau Ceti's low-degree model).
* test GaloisSymbol.test_not_untwisted [non-example] — STATEMENT: For F = ℚ and m = 4, the
    target H²(ℚ, μ_4^{⊗2}) is not H²(ℚ, μ_4): the two G_ℚ-modules differ, so a definition with
    untwisted μ_m coefficients changes the group.
-/

/- ### Tate's ℓ-adic Galois symbol — packet node `M.3/adic-galois-symbol` (construction)
Lean carrier: TauCeti.GaloisSymbol.adicSymbol
* TauCeti.GaloisSymbol.adicSymbol [constructor] — LEAN: h_F : K_2(F) → H²(F, ℤ_ℓ(2)).
* TauCeti.GaloisSymbol.adicSymbol_steinberg [simp] — LEAN: h_F{a, b} = d_F a ∪ d_F b.
* TauCeti.GaloisSymbol.adicSymbol_reduce [compatibility] — LEAN: Reducing h_F mod ℓ^ν gives
    h_{F,ℓ^ν}.
* TauCeti.GaloisSymbol.adicSymbol_divisible [relation] — LEAN: h_F vanishes on the ℓ-divisible
    subgroup of K_2(F) (Tate (3.5)(a)).
* TauCeti.GaloisSymbol.adicSymbol_res [functoriality] — STATEMENT: Natural for field extensions.
* test GaloisSymbol.test_adic_one [degenerate] — LEAN (example): h_F{1, b} = 0.
* test GaloisSymbol.test_adic_closed [computation] — LEAN (example): For F algebraically closed,
    H²(F, ℤ_ℓ(2)) = 0, so h_F = 0.
* test GaloisSymbol.test_adic_reduce [compatibility] — STATEMENT: For F = ℚ, ℓ = 2, ν = 1: the
    reduction of h_ℚ{−1, −1} is h_{ℚ,2}{−1, −1} ≠ 0.
* test GaloisSymbol.test_adic_not_injective [non-example] — STATEMENT: For F a local field, h_F
    is not injective on K_2(F): it kills the uncountable divisible summand of Moore's
    decomposition.
-/

/- ### The Galois symbol commutes with norms — packet node `M.3/symbol-norm-compatibility` (theorem)
Lean signature: TauCeti.GaloisSymbol.symbol_norm
-/

/- ### The Galois symbol commutes with residues — packet node `M.3/symbol-residue-compatibility` (theorem)
Lean signature: STATEMENT (the theorem is stated in the packet; its carriers are not exposed above)
-/

/- ### Tate's theorem for local fields — packet node `M.3/tate-local` (theorem)
Lean signature: TauCeti.GaloisSymbol.tate_local
-/

/- ### Tate's theorem for global fields — packet node `M.3/tate-global` (theorem)
Lean signature: TauCeti.GaloisSymbol.tate_global
-/

/- ### Torsion in K₂ of a global field is generated by root-of-unity symbols — packet node `M.3/tate-torsion-symbols` (theorem)
Lean signature: TauCeti.GaloisSymbol.tate_torsion_symbols
-/

/- ### Tate's theorem for rings of S-integers — packet node `M.3/tate-s-integer` (theorem)
Lean signature: STATEMENT (the theorem is stated in the packet; its carriers are not exposed above)
-/

/- ### K₂ of S-integers modulo ℓ and the Picard group — packet node `M.3/tate-picard-sequence` (theorem)
Lean signature: STATEMENT (the theorem is stated in the packet; its carriers are not exposed above)
-/

/- ### The algebraic simplices and the cubes — packet node `M.4/algebraic-simplex` (construction)
Lean carrier: TauCeti.HigherChow.simplex
* TauCeti.HigherChow.simplex [constructor] — LEAN: Δ^n_B as a B-scheme, functorial in B.
* TauCeti.HigherChow.coface [data] — LEAN: The coface closed immersions ∂_i : Δ^{n−1}_B → Δ^n_B.
* TauCeti.HigherChow.codegeneracy [data] — LEAN: The codegeneracy maps s_i : Δ^n_B → Δ^{n−1}_B.
* TauCeti.HigherChow.cosimplicial_identities [relation] — STATEMENT: ∂_j ∂_i = ∂_i ∂_{j−1} for i
    < j, and the remaining cosimplicial identities.
* TauCeti.HigherChow.simplex_iso_affine [equivalence] — LEAN: Δ^n_B ≅ 𝔸^n_B over B.
* TauCeti.HigherChow.cube [constructor] — LEAN: □^n_B = (ℙ¹_B ∖ {1})^n with faces δ^ε_i, ε ∈ {0,
    ∞}.
* TauCeti.HigherChow.face_regular [characterisation] — STATEMENT: Every face of Δ^n_B (resp.
    □^n_B) of codimension r is cut out by a regular sequence of length r.
* test HigherChow.test_simplex_zero [degenerate] — LEAN (example): Δ^0_B ≅ B.
* test HigherChow.test_simplex_one [computation] — STATEMENT: Δ^1_k ≅ 𝔸^1_k with exactly two
    codimension-one faces, the k-points t_0 = 0 and t_1 = 0.
* test HigherChow.test_base_change [compatibility] — STATEMENT: Δ^n_{B'} ≅ Δ^n_B ×_B B' for
    every B' → B.
* test HigherChow.test_not_projective [non-example] — STATEMENT: Δ^n is not ℙ^n: Δ^1 has no
    point at which t_0 + t_1 = 0, so the projective closure adds a face-free divisor at
    infinity.
-/

/- ### Cycles meeting the faces properly — packet node `M.4/admissible-cycles` (definition)
Lean carrier: TauCeti.HigherChow.cycles
* TauCeti.HigherChow.cycles [constructor] — LEAN: z^q(X, n) as a subgroup of AlgebraicCycle(X ×
    Δ^n, ℤ).
* TauCeti.HigherChow.mem_cycles_iff [characterisation] — STATEMENT: A cycle lies in z^q(X, n)
    iff each component has codimension q and meets every face properly.
* TauCeti.HigherChow.face_restrict [data] — LEAN: Intersection with the i-th face, z^q(X, n) →
    z^q(X, n − 1).
* TauCeti.HigherChow.cyclesDim [constructor] — LEAN: The dimension-indexed groups z_r(X, n) over
    a Dedekind base.
* TauCeti.HigherChow.cycles_eq_cyclesDim [compatibility] — STATEMENT: For X equidimensional of
    dimension d over a field, z^q(X, n) = z_{d−q}(X, n).
* test HigherChow.test_cycles_zero_n [degenerate] — STATEMENT: z^q(X, 0) is the group of
    codimension-q cycles of X.
* test HigherChow.test_point [computation] — STATEMENT: z^1(Spec k, 1) is generated by the
    closed points of Δ^1_k ≅ 𝔸^1_k other than the two vertices.
* test HigherChow.test_algebraic_cycle [compatibility] — STATEMENT: z^q(X, 0) agrees with the
    codimension-q part of Mathlib's AlgebraicCycle X ℤ with finite support.
* test HigherChow.test_vertex_not_admissible [non-example] — STATEMENT: The vertex t_0 = 0 of
    Δ^1_k is a codimension-one cycle on Δ^1_k that does not meet the face t_0 = 0 properly, so
    it is not in z^1(Spec k, 1).
-/

/- ### Bloch's cycle complex and higher Chow groups — packet node `M.4/cycle-complex` (construction)
Lean carrier: TauCeti.HigherChow.CH, TauCeti.HigherChow.H
* TauCeti.HigherChow.complex [constructor] — STATEMENT: z^q(X, •) as a simplicial abelian group
    and its chain complex.
* TauCeti.HigherChow.CH [constructor] — LEAN: CH^q(X, n) = H_n(z^q(X, •)).
* TauCeti.HigherChow.motivicComplex [constructor] — STATEMENT: Z(q)_X = z^q(−, •)[−2q] as a
    complex of Zariski (and étale) sheaves on X.
* TauCeti.HigherChow.H [constructor] — LEAN: H^{p}(X, A(q)) for an abelian group A, with
    H^{p}(X, Z(q)) = CH^q(X, 2q − p).
* TauCeti.HigherChow.d_sq [relation] — STATEMENT: d ∘ d = 0 with d = Σ (−1)^i ∂_i^*.
* TauCeti.HigherChow.CH_neg [simp] — LEAN: CH^q(X, n) = 0 for n < 0, and H^{p}(X, Z(q)) = 0 for
    p > 2q.
* TauCeti.HigherChow.coefficient_long_exact [relation] — STATEMENT: For 0 → A' → A → A'' → 0
    there is a long exact sequence … → H^{p}(X, A'(q)) → H^{p}(X, A(q)) → H^{p}(X, A''(q)) →
    H^{p+1}(X, A'(q)) → …; in particular the Bockstein triangle Z(q) --m--> Z(q) → Z/m(q).
* TauCeti.HigherChow.H_mod_m [relation] — STATEMENT: 0 → H^{p}(X, Z(q))/m → H^{p}(X, Z/m(q)) →
    H^{p+1}(X, Z(q))[m] → 0 is exact.
* test HigherChow.test_CH_zero [compatibility] — STATEMENT: CH^q(X, 0) is the Chow group CH^q(X)
    of SchemeAndStackFoundations SF.5.
* test HigherChow.test_q_zero [degenerate] — LEAN (example): For X = Spec k: CH^0(Spec k, 0) = ℤ
    and CH^0(Spec k, n) = 0 for n > 0.
* test HigherChow.test_field_weight_one [computation] — LEAN (example): CH^1(Spec k, 1) ≅ k^×,
    the point a ∈ Δ^1 ∖ vertices with barycentric coordinate ratio a ↦ a.
* test HigherChow.test_not_naive_cycles [non-example] — STATEMENT: Without the proper-
    intersection condition the homology in degree one for X = Spec k would vanish (all points of
    𝔸¹ are homologous to vertices), so admissibility is essential for CH^1(k, 1) = k^×.
-/

/- ### The cubical cycle complex — packet node `M.4/cubical-cycle-complex` (construction)
Lean carrier: STATEMENT (carrier omitted)
* TauCeti.HigherChow.cubeCycles [constructor] — LEAN: z^q_□(X, n), admissible cubical cycles
    modulo degenerate ones.
* TauCeti.HigherChow.cube_d_sq [relation] — STATEMENT: d ∘ d = 0 for d = Σ (−1)^i (∂^∞_i −
    ∂^0_i).
* TauCeti.HigherChow.cubeProduct [constructor] — STATEMENT: External product z^p_□(X, n) ⊗
    z^r_□(Y, m) → z^{p+r}_□(X × Y, n + m).
* TauCeti.HigherChow.cube_leibniz [relation] — STATEMENT: d(x × y) = dx × y + (−1)^n x × dy.
* TauCeti.HigherChow.milnorCycle [constructor] — LEAN: For a_i ∈ F^× ∖ {1}, the point (a_1, …,
    a_n) ∈ □^n_F as a cycle in z^n_□(F, n).
* test HigherChow.test_cube_zero [degenerate] — STATEMENT: z^q_□(X, 0) = z^q(X, 0).
* test HigherChow.test_cube_point [computation] — STATEMENT: For a ∈ F^× ∖ {1}, the point a ∈
    □^1_F is a cycle with d = 0 (it avoids 0 and ∞).
* test HigherChow.test_cube_vs_simplex [compatibility] — STATEMENT: The cubical and simplicial
    complexes have isomorphic homology (simplicial-cubical-comparison).
* test HigherChow.test_degenerate_killed [non-example] — STATEMENT: The pullback of a point of
    □^0 along □^1 → □^0 is the whole line, a degenerate cycle; without quotienting by degenerate
    cycles, the homology of the cubical complex is not CH.
-/

/- ### Simplicial and cubical higher Chow groups agree — packet node `M.4/simplicial-cubical-comparison` (theorem)
Lean signature: STATEMENT (the theorem is stated in the packet; its carriers are not exposed above)
-/

/- ### Flat pullback and proper pushforward of higher Chow groups — packet node `M.4/functoriality` (theorem)
Lean signature: STATEMENT (the theorem is stated in the packet; its carriers are not exposed above)
-/

/- ### Homotopy invariance of higher Chow groups — packet node `M.4/homotopy-invariance` (theorem)
Lean signature: TauCeti.HigherChow.homotopy_invariance
-/

/- ### Bloch's moving lemma for cycle complexes — packet node `M.4/moving-lemma` (theorem)
Lean signature: STATEMENT (the theorem is stated in the packet; its carriers are not exposed above)
-/

/- ### Bloch's localization theorem — packet node `M.4/localization-sequence` (theorem)
Lean signature: TauCeti.HigherChow.localization_exact
-/

/- ### Products and pullback for smooth schemes — packet node `M.4/products` (construction)
Lean carrier: TauCeti.HigherChow.pullback
* TauCeti.HigherChow.extProduct [constructor] — LEAN: CH^p(X, n) ⊗ CH^r(Y, m) → CH^{p+r}(X × Y,
    n + m).
* TauCeti.HigherChow.cup [constructor] — LEAN: The cup product on ⊕ CH^p(X, n) for X smooth.
* TauCeti.HigherChow.pullback [functoriality] — LEAN: f^* for f : Y → X between smooth quasi-
    projective k-schemes, with (g ∘ f)^* = f^* ∘ g^* and id^* = id.
* TauCeti.HigherChow.pullback_flat [compatibility] — STATEMENT: f^* agrees with flat pullback
    when f is flat.
* TauCeti.HigherChow.cup_comm [relation] — LEAN: x · y = (−1)^{nm} y · x for x ∈ CH^p(X, n), y ∈
    CH^r(X, m).
* TauCeti.HigherChow.projection_formula [relation] — LEAN: f_*(f^*x · y) = x · f_*y for f proper
    between smooth schemes.
* test HigherChow.test_unit [degenerate] — STATEMENT: The class [X] ∈ CH^0(X, 0) is the unit of
    the ring.
* test HigherChow.test_symbol_product [computation] — STATEMENT: For a, b ∈ F^× ∖ {1}, a · b ∈
    CH^2(F, 2) is the class of the point (a, b) ∈ □^2_F.
* test HigherChow.test_degree_zero [compatibility] — STATEMENT: On CH^*(X, 0) the cup product is
    SF.5's intersection product for X smooth.
* test HigherChow.test_sign [non-example] — STATEMENT: For a ∈ F^×, a · a = a · (−1) in CH^2(F,
    2), which is generally nonzero (e.g. F = ℝ, a = −1), so the product is graded-commutative
    but not alternating.
-/

/- ### Higher Chow groups in degree zero are Chow groups — packet node `M.4/chow-degree-zero` (theorem)
Lean signature: STATEMENT (the theorem is stated in the packet; its carriers are not exposed above)
-/

/- ### Motivic cohomology in weights zero and one — packet node `M.4/weight-zero-and-one` (theorem)
Lean signature: TauCeti.HigherChow.weight_one_field
-/

/- ### Vanishing above the weight for fields and local rings — packet node `M.4/vanishing-above-weight` (theorem)
Lean signature: TauCeti.HigherChow.CH_field_eq_zero
-/

/- ### Milnor K-theory is motivic cohomology on the diagonal — packet node `M.4/nesterenko-suslin-totaro` (theorem)
Lean signature: TauCeti.HigherChow.nesterenko_suslin_totaro
-/

/- ### The weight-two symbol comparison — packet node `M.4/weight-two-symbol-comparison` (theorem)
Lean signature: STATEMENT (the theorem is stated in the packet; its carriers are not exposed above)
-/

/- ### The projective bundle formula for higher Chow groups — packet node `M.4/projective-bundle-formula` (theorem)
Lean signature: STATEMENT (the theorem is stated in the packet; its carriers are not exposed above)
-/

/- ### Purity for cycle complexes with supports — packet node `M.4/purity-gysin-triangle` (theorem)
Lean signature: STATEMENT (the theorem is stated in the packet; its carriers are not exposed above)
-/

/- ### Cycle complexes over a Dedekind base — packet node `M.4/dedekind-cycle-complex` (construction)
Lean carrier: STATEMENT (carrier omitted)
* TauCeti.HigherChow.dedekindComplex [constructor] — STATEMENT: Z(n)_X for X essentially of
    finite type over a Dedekind scheme.
* TauCeti.HigherChow.dedekind_H [constructor] — LEAN: H^{p}(X, A(n)) as Zariski hypercohomology.
* TauCeti.HigherChow.dedekind_restrict_field [compatibility] — STATEMENT: Restriction to the
    generic fibre X_F agrees with cycle-complex for the field case.
* TauCeti.HigherChow.dedekind_flat_pullback [functoriality] — STATEMENT: Flat pullback Z(n)_X →
    f_*Z(n)_Y.
* TauCeti.HigherChow.dedekind_etale [constructor] — STATEMENT: The étale version Z(n)_et and the
    change-of-topology map Z(n)_Zar → Rε_* Z(n)_et.
* test HigherChow.test_dedekind_weight_zero [degenerate] — STATEMENT: Z(0)_X ≃ ℤ for X connected
    and essentially smooth over B.
* test HigherChow.test_dedekind_units [computation] — LEAN (example): H^{1}(Spec ℤ[1/2], Z(1)) ≅
    ℤ[1/2]^× ≅ {±1} × 2^ℤ.
* test HigherChow.test_dedekind_generic [compatibility] — STATEMENT: For X = Spec F (B = Spec F)
    the construction is cycle-complex.
* test HigherChow.test_not_codimension [non-example] — STATEMENT: Codimension indexing would be
    wrong for X = Spec ℤ_(p) ∪ fibres of different dimension; the dimension-indexed groups are
    the ones with localization over B.
-/

/- ### Localization and Gersten resolution over a Dedekind base — packet node `M.4/dedekind-gersten` (theorem)
Lean signature: STATEMENT (the theorem is stated in the packet; its carriers are not exposed above)
-/

/- ### Zariski descent for cycle complexes — packet node `M.4/zariski-descent` (theorem)
Lean signature: STATEMENT (the theorem is stated in the packet; its carriers are not exposed above)
-/

/- ### Finite correspondences — packet node `M.5a/finite-correspondence` (definition)
Lean carrier: TauCeti.Transfers.Cor
* TauCeti.Transfers.Cor [constructor] — LEAN: Cor_k(X, Y) as a free abelian group on elementary
    correspondences.
* TauCeti.Transfers.graph [constructor] — LEAN: Γ_f ∈ Cor_k(X, Y) for f : X → Y.
* TauCeti.Transfers.comp [constructor] — LEAN: Composition Cor_k(Y, Z) × Cor_k(X, Y) → Cor_k(X,
    Z).
* TauCeti.Transfers.comp_assoc [relation] — LEAN: Composition is associative and bilinear.
* TauCeti.Transfers.graph_comp [simp] — LEAN: Γ_g ∘ Γ_f = Γ_{g∘f} and Γ_id = id.
* TauCeti.Transfers.transpose_finite [other] — STATEMENT: For f : Y → X finite surjective with
    X, Y smooth, the transpose Γ_f^t ∈ Cor_k(X, Y).
* test Transfers.test_point_source [computation] — STATEMENT: Cor_k(Spec k, 𝔸^1_k) is the free
    abelian group on closed points of 𝔸^1_k.
* test Transfers.test_empty [degenerate] — STATEMENT: Cor_k(∅, Y) = 0 and Cor_k(X, ∅) = 0 for X
    nonempty.
* test Transfers.test_galois_group_ring [compatibility] — STATEMENT: For L/k finite Galois with
    group G, Cor_k(Spec L, Spec L) ≅ ℤ[G] as rings.
* test Transfers.test_not_all_cycles [non-example] — STATEMENT: The diagonal of 𝔸^1 × 𝔸^1 is a
    correspondence from 𝔸^1 to 𝔸^1, but the line {0} × 𝔸^1 is not (it is not finite over the
    first factor).
-/

/- ### Presheaves and Nisnevich sheaves with transfers — packet node `M.5a/presheaf-with-transfers` (definition)
Lean carrier: STATEMENT (carrier omitted)
* TauCeti.Transfers.PST [constructor] — LEAN: The abelian category of presheaves with transfers.
* TauCeti.Transfers.ztr [constructor] — LEAN: ℤ_tr(X) = Cor_k(−, X), with the Yoneda isomorphism
    Hom(ℤ_tr(X), F) ≅ F(X).
* TauCeti.Transfers.nisnevichTopology [constructor] — STATEMENT: The Nisnevich topology on Sm/k,
    generated by elementary distinguished squares.
* TauCeti.Transfers.NST [constructor] — LEAN: Nisnevich sheaves with transfers, Sh_Nis(Cor_k).
* TauCeti.Transfers.sheafify_transfers [universal-property] — STATEMENT: The Nisnevich
    sheafification of F ∈ PST has a unique transfer structure making F → F_Nis a map in PST.
* TauCeti.Transfers.ztr_sheaf [characterisation] — STATEMENT: ℤ_tr(X) is an étale sheaf, hence a
    Nisnevich sheaf.
* TauCeti.Transfers.NST_abelian [instance] — STATEMENT: Sh_Nis(Cor_k) is abelian with enough
    injectives.
* test Transfers.test_ztr_point [computation] — STATEMENT: ℤ_tr(Spec k)(X) = ℤ^{π_0(X)}.
* test Transfers.test_zero_presheaf [degenerate] — STATEMENT: The zero presheaf is a Nisnevich
    sheaf with transfers.
* test Transfers.test_units [compatibility] — STATEMENT: O^× with transfers given by norms
    agrees with G_m on Sm/k.
* test Transfers.test_not_zariski [non-example] — STATEMENT: A Zariski sheaf need not be a
    Nisnevich sheaf: Nisnevich covers by étale maps with sections are finer, and H^1_Nis ≠
    H^1_Zar for nonconstant sheaves in general.
-/

/- ### The Suslin complex and the motivic complexes ℤ(q) — packet node `M.5a/suslin-complex-and-motivic-complexes` (construction)
Lean carrier: TauCeti.Transfers.motivicCohomology
* TauCeti.Transfers.suslinComplex [constructor] — STATEMENT: C_*F for a presheaf (with
    transfers) F.
* TauCeti.Transfers.motivicComplex [constructor] — STATEMENT: ℤ(q) = C_*ℤ_tr(𝔾_m^{∧q})[−q] and
    A(q) = ℤ(q) ⊗ A.
* TauCeti.Transfers.motivicCohomology [constructor] — LEAN: H^{p,q}(X, A) = H^{p}_Zar(X, A(q)).
* TauCeti.Transfers.motivicComplex_zero [equivalence] — STATEMENT: ℤ(0) ≃ ℤ.
* TauCeti.Transfers.motivicComplex_one [equivalence] — STATEMENT: ℤ(1) ≃ O^×[−1] (MVW 4.1).
* TauCeti.Transfers.mul [constructor] — STATEMENT: Products ℤ(q) ⊗_tr ℤ(q') → ℤ(q + q'),
    associative and graded-commutative on cohomology.
* TauCeti.Transfers.diagonal_milnor [equivalence] — LEAN: H^{n,n}(Spec F, ℤ) ≅ K^M_n(F), sending
    {a_1, …, a_n} to the product of the classes of a_i (MVW 5.1).
* test Transfers.test_weight_zero [degenerate] — STATEMENT: H^{0,0}(X, ℤ) = ℤ^{π_0(X)} and
    H^{p,0} = 0 for p ≠ 0.
* test Transfers.test_weight_one_field [computation] — LEAN (example): H^{1,1}(Spec F, ℤ) ≅ F^×.
* test Transfers.test_vs_cycle_complex [compatibility] — STATEMENT: For X smooth over a perfect
    field, H^{p,q}(X, ℤ) ≅ H^{p}(X, Z(q)) of M.4 (MVW 19.1; the comparison is
    MotivesAndAlgebraicCycles MC.4's).
* test Transfers.test_negative_vanish [non-example] — STATEMENT: H^{p,q}(Spec F, ℤ) = 0 for p >
    q, whereas the naive complex ℤ_tr(𝔾_m^{×q}) without smashing has extra summands, e.g.
    ℤ_tr(𝔾_m) contains ℤ.
-/

/- ### Voevodsky's theorem on homotopy invariant presheaves with transfers — packet node `M.5a/homotopy-invariant-sheaves` (theorem)
Lean signature: STATEMENT (the theorem is stated in the packet; its carriers are not exposed above)
-/

/- ### The triangulated category of effective motives — packet node `M.5a/effective-motives` (construction)
Lean carrier: TauCeti.Transfers.DMeff
* TauCeti.Transfers.DMeff [constructor] — LEAN: DM^{eff,−}_Nis(k, R), a tensor triangulated
    category.
* TauCeti.Transfers.motive [constructor] — LEAN: M(X) for X ∈ Sm/k and M(𝒳) for smooth
    simplicial schemes.
* TauCeti.Transfers.motive_tensor [simp] — STATEMENT: M(X) ⊗ M(Y) ≅ M(X × Y).
* TauCeti.Transfers.motive_A1 [simp] — STATEMENT: M(X × 𝔸^1) ≅ M(X).
* TauCeti.Transfers.hom_motive_tate [characterisation] — LEAN: Hom(M(X), R(i)[n]) ≅ H^{n,i}(X,
    R).
* TauCeti.Transfers.localisation_equiv [equivalence] — STATEMENT: The A¹-local complexes form a
    subcategory equivalent to DM^{eff,−}_Nis(k, R), with C_* as localisation functor.
* TauCeti.Transfers.projective_line [example] — STATEMENT: M(ℙ^1) ≅ R ⊕ R(1)[2].
* test Transfers.test_point [degenerate] — STATEMENT: M(Spec k) = R is the unit object.
* test Transfers.test_projective_line [computation] — STATEMENT: Hom(M(ℙ^1), R(1)[2]) ≅ Pic(ℙ^1)
    ⊗ R ⊕ H^{2,1}(k, R) = R.
* test Transfers.test_hom_cycles [compatibility] — STATEMENT: Hom(M(X), ℤ(q)[p]) ≅ CH^q(X, 2q −
    p) for X smooth (through MC.4's comparison with M.4).
* test Transfers.test_affine_line [non-example] — STATEMENT: M(𝔸^1) is not M(Spec k) ⊕ ℤ(1)[1]:
    the A¹-localisation contracts 𝔸^1, unlike 𝔾_m with M(𝔾_m) = ℤ ⊕ ℤ(1)[1].
-/

/- ### Voevodsky's cancellation theorem — packet node `M.5a/cancellation` (theorem)
Lean signature: TauCeti.Transfers.cancellation
-/

/- ### Transfers on higher Chow groups and the comparison maps — packet node `M.5a/cycle-complex-transfers` (theorem)
Lean signature: STATEMENT (the theorem is stated in the packet; its carriers are not exposed above)
-/

/- ### Étale motivic cohomology with finite coefficients and the comparison map — packet node `M.5a/etale-motivic-comparison` (theorem)
Lean signature: STATEMENT (the theorem is stated in the packet; its carriers are not exposed above)
-/

/- ### Imperfect fields and filtered colimits — packet node `M.5a/imperfect-field-passage` (theorem)
Lean signature: STATEMENT (the theorem is stated in the packet; its carriers are not exposed above)
-/

/- ### Motivic reduced power operations — packet node `M.5b/motivic-steenrod-operations` (construction)
Lean carrier: TauCeti.MotivicSteenrod.reducedPower, TauCeti.MotivicSteenrod.bockstein
* TauCeti.MotivicSteenrod.bockstein [constructor] — LEAN: β : H̃^{p,q}(𝒳, ℤ/l) → H̃^{p+1,q}(𝒳,
    ℤ/l).
* TauCeti.MotivicSteenrod.reducedPower [constructor] — LEAN: P^i : H̃^{p,q} → H̃^{p+2i(l−1),
    q+i(l−1)}.
* TauCeti.MotivicSteenrod.natural [functoriality] — STATEMENT: β and P^i commute with pullback
    along maps of pointed simplicial schemes.
* TauCeti.MotivicSteenrod.suspension [compatibility] — STATEMENT: β and P^i commute with the
    simplicial and 𝔾_m suspension isomorphisms.
* TauCeti.MotivicSteenrod.BSl_cohomology [characterisation] — STATEMENT: H̃^{*,*}(𝒳 ∧ (BS_l)_+)
    = H̃^{*,*}(𝒳)[[c, d]]/(c² = τd + ρc) for l = 2 and /(c² = 0) for l odd.
* TauCeti.MotivicSteenrod.etale_realisation [compatibility] — STATEMENT: Under the motivic-to-
    étale map, P^i and β go to the classical Steenrod operations and Bockstein on étale
    cohomology with ℤ/l coefficients.
* test MotivicSteenrod.test_P0 [degenerate] — STATEMENT: P^0 = Id.
* test MotivicSteenrod.test_square [computation] — STATEMENT: For u ∈ H̃^{2n,n}, P^n(u) = u^l
    (RPO Lemma 9.7).
* test MotivicSteenrod.test_bockstein_P [compatibility] — STATEMENT: β P^i = B^i and β B^i = 0
    (RPO Lemma 9.5).
* test MotivicSteenrod.test_rho_term [non-example] — STATEMENT: For l = 2 the motivic Cartan
    formula has the extra term τ, ρ: the topological Cartan formula Sq^2(xy) = Sq^2x·y +
    Sq^1x·Sq^1y + x·Sq^2y fails without the ρ-term over k = ℝ.
-/

/- ### Cartan formula, instability and Adem relations — packet node `M.5b/steenrod-relations` (theorem)
Lean signature: TauCeti.MotivicSteenrod.reducedPower_zero
-/

/- ### The Milnor operations Q_i — packet node `M.5b/milnor-operations` (construction)
Lean carrier: STATEMENT (carrier omitted)
* TauCeti.MotivicSteenrod.milnorOp [constructor] — LEAN: Q_i ∈ A^{2l^i−1, l^i−1}.
* TauCeti.MotivicSteenrod.milnorOp_zero [simp] — STATEMENT: Q_0 = β.
* TauCeti.MotivicSteenrod.milnorOp_sq [relation] — STATEMENT: Q_i ∘ Q_i = 0.
* TauCeti.MotivicSteenrod.milnorOp_anticomm [relation] — STATEMENT: Q_i Q_j = −Q_j Q_i.
* TauCeti.MotivicSteenrod.Q0_Pb [relation] — STATEMENT: For l > 2, Q_0P^b = P^bQ_0 + P^{b−1}Q_1
    + ⋯ + P^0Q_n with b = (l^n − 1)/(l − 1).
* test MotivicSteenrod.test_Q0_beta [degenerate] — STATEMENT: Q_0 is the Bockstein β.
* test MotivicSteenrod.test_Q_bidegree [computation] — STATEMENT: Q_1 has bidegree (2l − 1, l −
    1); for l = 2, (3, 1).
* test MotivicSteenrod.test_Q_etale [compatibility] — STATEMENT: Under étale realisation Q_i
    maps to the topological Milnor primitive.
* test MotivicSteenrod.test_Q_not_derivation [non-example] — STATEMENT: For l = 2 over k = ℝ,
    Q_0 is not a derivation on the nose: β(uv) differs from βu·v + u·βv by a ρ-term, so a
    definition ignoring ρ gives wrong values.
-/

/- ### ν_n-varieties and norm varieties — packet node `M.5b/nu-variety` (definition)
Lean carrier: TauCeti.RostMotive.IsNuVariety
* TauCeti.RostMotive.charNumber [constructor] — LEAN: s_d(X) ∈ ℤ for X smooth projective of
    dimension d.
* TauCeti.RostMotive.IsNuVariety [characterisation] — LEAN: X is a ν_n-variety iff dim X = l^n −
    1 and s_{l^n−1}(X) ≢ 0 mod l².
* TauCeti.RostMotive.Splits [characterisation] — STATEMENT: X splits a iff a ↦ 0 in
    K^M_n(k(X))/l.
* TauCeti.RostMotive.IsNormVariety [constructor] — STATEMENT: The norm-variety predicate:
    ν_{≤(n−1)}, splits a, and Rost's norm exactness.
* TauCeti.RostMotive.splits_baseChange [functoriality] — STATEMENT: If X splits a then X_{k'}
    splits a_{k'} for every field extension k'/k.
* test RostMotive.test_projective_space [computation] — STATEMENT: s_{l−1}(ℙ^{l−1}) = l, so
    ℙ^{l−1} is a ν_1-variety.
* test RostMotive.test_point [degenerate] — STATEMENT: Spec k (dimension 0 = l^0 − 1) splits a
    iff a = 0 in K^M_n(k)/l.
* test RostMotive.test_splits_degree_one [compatibility] — STATEMENT: If X has a k-rational
    point and splits a, then a = 0.
* test RostMotive.test_quadric_not_nu [non-example] — STATEMENT: A smooth conic in ℙ^2 has
    dimension 1 = 2^1 − 1 and s_1 = 2 ≢ 0 mod 4, so it is a ν_1-variety for l = 2, while ℙ^1 ×
    ℙ^1 (dimension 2) is not a ν_n-variety for any n when l = 2.
-/

/- ### Voevodsky's motivic degree theorem — packet node `M.5b/degree-theorem` (theorem)
Lean signature: STATEMENT (the theorem is stated in the packet; its carriers are not exposed above)
-/

/- ### Pfister neighbours as norm varieties for l = 2 — packet node `M.5b/pfister-norm-variety` (construction)
Lean carrier: STATEMENT (carrier omitted)
* TauCeti.RostMotive.pfisterNeighbourQuadric [constructor] — LEAN: Q_a ⊂ ℙ^{2^{n−1}} for a ∈
    (k^×)^n.
* TauCeti.RostMotive.pfister_dim [simp] — LEAN: dim Q_a = 2^{n−1} − 1.
* TauCeti.RostMotive.pfister_splits [characterisation] — STATEMENT: Q_a splits {a_1, …, a_n} mod
    2.
* TauCeti.RostMotive.pfister_isNu [characterisation] — STATEMENT: Q_a is a ν_{n−1}-variety for l
    = 2.
* TauCeti.RostMotive.pfister_point_iff [characterisation] — STATEMENT: Q_a(k) ≠ ∅ iff {a_1, …,
    a_n} = 0 in K^M_n(k)/2.
* test RostMotive.test_pfister_n1 [degenerate] — STATEMENT: For n = 1, Q_a is the zero-
    dimensional quadric x² = a_1 z², which has a point iff a_1 is a square.
* test RostMotive.test_pfister_conic [computation] — STATEMENT: For n = 2 and a = (−1, −1) over
    ℝ, q_a = ⟨1, 1⟩ ⊥ ⟨1⟩, so Q_a is the conic x² + y² + z² = 0 with no real point, matching
    {−1, −1} ≠ 0 in K^M_2(ℝ)/2.
* test RostMotive.test_pfister_quaternion [compatibility] — STATEMENT: For n = 2, Q_a has a
    point iff the quaternion algebra (a_1, a_2) splits (QuadraticFormInvariants Layer 2).
* test RostMotive.test_not_full_pfister [non-example] — STATEMENT: The full Pfister quadric
    ⟨⟨a_1, …, a_n⟩⟩ = 0 has dimension 2^n − 2, not 2^{n−1} − 1, so it is not a ν_{n−1}-variety;
    the neighbour is required.
-/

/- ### Rost's Chain Lemma and Norm Principle — packet node `M.5b/chain-lemma-and-norm-principle` (theorem)
Lean signature: STATEMENT (the theorem is stated in the packet; its carriers are not exposed above)
-/

/- ### Existence of norm varieties — packet node `M.5b/norm-variety-existence` (theorem)
Lean signature: STATEMENT (the theorem is stated in the packet; its carriers are not exposed above)
-/

/- ### The Čech simplicial scheme of a splitting variety — packet node `M.5c/cech-simplicial-scheme` (construction)
Lean carrier: STATEMENT (carrier omitted)
* TauCeti.RostMotive.cech [constructor] — STATEMENT: Č(X) as a simplicial smooth k-scheme with
    M(Č(X)) → ℤ.
* TauCeti.RostMotive.cech_point [characterisation] — STATEMENT: If X(k) ≠ ∅ then M(Č(X)) → ℤ is
    an isomorphism.
* TauCeti.RostMotive.cech_suspension [constructor] — STATEMENT: 𝒳̃ = cone(Č(X)_+ → S^0) and its
    reduced motivic cohomology.
* TauCeti.RostMotive.cech_baseChange [functoriality] — STATEMENT: Č(X)_{k'} = Č(X_{k'}) and M
    commutes with base change.
* TauCeti.RostMotive.cech_idempotent [relation] — STATEMENT: M(Č(X)) ⊗ M(Č(X)) ≅ M(Č(X)).
* test RostMotive.test_cech_point [degenerate] — STATEMENT: Č(Spec k) is the constant simplicial
    scheme and M(Č(Spec k)) = ℤ.
* test RostMotive.test_cech_conic [computation] — STATEMENT: For a conic C without rational
    point, H̃^{*,*}(𝒳̃_C, ℤ/2) ≠ 0 (it contains the class δ of the quaternion symbol).
* test RostMotive.test_cech_etale [compatibility] — STATEMENT: After étale sheafification
    M(Č(X)) → ℤ becomes an isomorphism for every X with a point over k^sep.
* test RostMotive.test_cech_not_X [non-example] — STATEMENT: M(Č(X)) ≠ M(X) for X = ℙ^1: M(ℙ^1)
    = ℤ ⊕ ℤ(1)[2] while M(Č(ℙ^1)) = ℤ.
-/

/- ### The generalised Rost motive — packet node `M.5c/rost-motive` (construction)
Lean carrier: TauCeti.RostMotive.rostMotive
* TauCeti.RostMotive.rostMotive [constructor] — LEAN: M_a ∈ DM^{eff,−}(k, ℤ_(l)) for a norm
    variety X of a.
* TauCeti.RostMotive.rost_triangle [relation] — STATEMENT: Distinguished triangles M(𝒳)(ib)[2ib]
    → M_i → M_{i−1} → M(𝒳)(ib)[2ib + 1] for 1 ≤ i ≤ l − 1.
* TauCeti.RostMotive.rost_summand [characterisation] — STATEMENT: M_a is a direct summand of
    M(X) via the projector p = Dλ ∘ φ ∘ λ.
* TauCeti.RostMotive.rost_dual [relation] — STATEMENT: (M_a, e'_M) is an internal Hom-object
    from M_a to ℤ(d)[2d].
* TauCeti.RostMotive.rost_split_after_splitting [characterisation] — STATEMENT: After a field
    extension splitting a, M_a ≅ ⊕_{i=0}^{l−1} ℤ(ib)[2ib].
* TauCeti.RostMotive.symmetric_power_operation [relation] — STATEMENT: φ_{l−1}(α) = c β P^n(α)
    for α ∈ H̃^{2n+1,n}, some c ∈ (ℤ/l)^× (Theorem 3.8).
* test RostMotive.test_rost_split [degenerate] — STATEMENT: If a = 0 (X has a point), M_a ≅
    ⊕_{i=0}^{l−1} ℤ(ib)[2ib].
* test RostMotive.test_rost_conic [computation] — STATEMENT: For l = 2, n = 2: b = 1, d = 1, and
    M_a = M(C) for the conic C, with triangle M(𝒳)(1)[2] → M(C) → M(𝒳).
* test RostMotive.test_rost_rank [compatibility] — STATEMENT: Over k^sep, M_a has the Tate-
    motive decomposition of rank l, matching the l summands ℤ(ib)[2ib].
* test RostMotive.test_not_whole_X [non-example] — STATEMENT: For n ≥ 3 and l = 2, M_a ≠ M(Q_a):
    the Pfister neighbour quadric has more Tate summands over k^sep than the Rost motive.
-/

/- ### The norm residue homomorphism in all degrees — packet node `M.5c/galois-symbol-all-degrees` (construction)
Lean carrier: TauCeti.NormResidue.map
* TauCeti.NormResidue.map [constructor] — LEAN: h_F : K^M_*(F)/m → H^{*}(F, μ_m^{⊗*}), a graded
    ring homomorphism.
* TauCeti.NormResidue.map_symbol [simp] — STATEMENT: h^n_F{a_1, …, a_n} = κ(a_1) ∪ ⋯ ∪ κ(a_n).
* TauCeti.NormResidue.map_one [equivalence] — STATEMENT: h^1_F is the Kummer isomorphism F^×/m ≅
    H¹(F, μ_m).
* TauCeti.NormResidue.map_two [compatibility] — STATEMENT: h^2_F is M.3's Galois symbol.
* TauCeti.NormResidue.map_res [functoriality] — LEAN: Natural for field extensions.
* TauCeti.NormResidue.map_norm [compatibility] — LEAN: cor_{E/F} ∘ h_E = h_F ∘ N_{E/F} for E/F
    finite.
* TauCeti.NormResidue.map_residue [compatibility] — STATEMENT: ∂_v ∘ h_F = ±h_{k(v)} ∘ ∂^M_v for
    a discrete valuation v with m invertible in k(v).
* TauCeti.NormResidue.map_motivic [compatibility] — STATEMENT: h_F equals the composite
    K^M_n(F)/m ≅ H^{n,n}(F, ℤ/m) → H^n_et(F, μ_m^{⊗n}) with the normalised weight-one
    identification.
* test NormResidue.test_degree_zero [degenerate] — STATEMENT: h^0_F : ℤ/m → H^0(F, ℤ/m) = ℤ/m is
    the identity.
* test NormResidue.test_real [computation] — LEAN (example): For F = ℝ, m = 2: h^n{−1, …, −1} =
    κ(−1)^n ≠ 0.
* test NormResidue.test_kummer [compatibility] — STATEMENT: h^1_F = TauCeti.kummerMap modulo
    m-th powers.
* test NormResidue.test_finite_field [non-example] — LEAN (example): For F = 𝔽_q and n = 2 both
    sides vanish (K^M_2(𝔽_q) = 0, cd(𝔽_q) = 1); a map defined without the Steinberg relation on
    the tensor algebra would have nonzero source.
-/

/- ### The inductive step: Hilbert 90 for K^M_n and the vanishing of H^{n+1,n}(𝒳) — packet node `M.5c/hilbert-ninety-induction` (theorem)
Lean signature: STATEMENT (the theorem is stated in the packet; its carriers are not exposed above)
-/

/- ### The mod-l norm residue isomorphism in characteristic zero — packet node `M.5c/mod-l-norm-residue` (theorem)
Lean signature: TauCeti.NormResidue.mod_l_norm_residue
-/

/- ### The norm residue theorem (Rost–Voevodsky) — packet node `M.5/norm-residue-theorem` (theorem)
Lean signature: TauCeti.NormResidue.norm_residue
-/

end
