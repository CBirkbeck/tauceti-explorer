import TauCeti.FieldTheory.Galois.AbsoluteGaloisGroup
import Mathlib.NumberTheory.LocalField.Basic
import Mathlib.RepresentationTheory.Invariants
import Mathlib.LinearAlgebra.DirectSum.Finsupp
import Mathlib.MeasureTheory.Integral.Bochner.Set
import Mathlib.MeasureTheory.Measure.Lebesgue.Basic
import Mathlib.Data.Nat.Digits.Lemmas
import Mathlib.RingTheory.DedekindDomain.Ideal.Lemmas
import Mathlib.Algebra.BigOperators.Finsupp.Basic
import Mathlib.NumberTheory.Padics.LocalField
import Mathlib.NumberTheory.Padics.ValuativeRel
import Mathlib.RingTheory.RamificationInertia.Ramification
import Mathlib.AlgebraicGeometry.EllipticCurve.Reduction

/-!
This file is not the roadmap and is not exhaustive. The roadmap document is definitive.
These statements suggest Lean forms so that contributors and reviewers converge on names and
signatures. They are prototypes, not implementations.

The pinned library contains no finite upper ramification carrier or actual Weil-group,
elliptic Tate-module, regular-model/cohomology or determinant-discriminant carrier supplying
this interface. The finite-residue-field absolute groups below are concrete signatures with
mathematical bodies left to the existing ramification supplier. Tier P and the geometric
signatures are explicitly omitted where their conditions cannot yet be stated; no condition is
replaced by a Prop-valued placeholder. The arithmetic surface declarations and the elliptic Tate-module comparisons, their
API and examples, are listed by name in the final omission block. Elliptic curve exponents
and reduction-type tests use the existing WeierstrassCurve carrier below.

The ideal constructors below take the finitely supported local exponent function. The passage
from a global representation to that function is the NumberFieldArithmetic/R01.2 supplier;
these constructors are not purported definitions of a substitute representation.
-/

noncomputable section
open scoped BigOperators ValuativeRel
open IsDedekindDomain

namespace TauCeti.ConductorR013

section Absolute
variable (K : Type*) [Field K] [ValuativeRel K] [TopologicalSpace K]
  [IsNonarchimedeanLocalField K]

/-- Intersection of the inverse images of finite upper groups in the separable closure.
Its construction uses the existing finite-ramification supplier, not an algebraic-closure
Galois correspondence. The prototype states the carrier at tier F. -/
def absoluteUpper (u : ℝ) : Subgroup (TauCeti.AbsoluteGaloisGroup K) := sorry

/-- Convenient expressions for the existing supplier's inertia and wild inertia, not a
second planned inertia construction. Their identifications are `absoluteUpper_atZero`. -/
abbrev inertia : Subgroup (TauCeti.AbsoluteGaloisGroup K) := absoluteUpper K 0
abbrev wild : Subgroup (TauCeti.AbsoluteGaloisGroup K) :=
  (⨆ u : {u : ℝ // 0 < u}, absoluteUpper K u).topologicalClosure

theorem absoluteUpper_antitone : Antitone (absoluteUpper K) := by sorry

theorem absoluteUpper_separated : (⨅ u : ℝ, absoluteUpper K u) = ⊥ := by sorry

/-- Unit test: TauCeti.ConductorR013.absoluteUpper_atMinusOne. -/
example : absoluteUpper K (-1) = ⊤ := by sorry

/- `absoluteUpper_finiteImage`, `absoluteUpper_atZero` and
`absoluteUpper_unramifiedQuotient` require the finite upper/inertia supplier. Their exact
mathematical statements are in the reader. In particular the zero test is not replaced by a
reflexive equality against the convenience abbreviations above. -/
end Absolute

section Breaks
variable {K : Type*} [Field K] [ValuativeRel K] [TopologicalSpace K]
  [IsNonarchimedeanLocalField K]
  {F V : Type*} [Field F] [TopologicalSpace F] [IsTopologicalRing F] [T2Space F]
  [AddCommGroup V] [Module F V] [Module.Finite F V] [TopologicalSpace V]
  [IsModuleTopology F V]

variable (ρ : Representation F (TauCeti.AbsoluteGaloisGroup K) V)
  (hc : Continuous fun x : TauCeti.AbsoluteGaloisGroup K × V => ρ x.1 x.2)
  (hF : ringChar F ≠ ringChar 𝓀[K])
  (hP : (Set.range fun g : wild K => ρ g).Finite)

/-- Canonical projector summands, with all finite-wild domain hypotheses explicit. -/
def breakDecomposition (ρ : Representation F (TauCeti.AbsoluteGaloisGroup K) V)
    (hc : Continuous fun x : TauCeti.AbsoluteGaloisGroup K × V => ρ x.1 x.2)
    (hF : ringChar F ≠ ringChar 𝓀[K])
    (hP : (Set.range fun g : wild K => ρ g).Finite) : ℚ → Submodule F V := sorry

/-- Dimension of the nonzero break summands, with finite support. -/
def breakMultiplicity (ρ : Representation F (TauCeti.AbsoluteGaloisGroup K) V)
    (hc : Continuous fun x : TauCeti.AbsoluteGaloisGroup K × V => ρ x.1 x.2)
    (hF : ringChar F ≠ ringChar 𝓀[K])
    (hP : (Set.range fun g : wild K => ρ g).Finite) : ℚ →₀ ℕ := sorry

/-- Zero on the zero module, otherwise the maximum of the finite nonnegative break support. -/
def highestBreak (ρ : Representation F (TauCeti.AbsoluteGaloisGroup K) V)
    (hc : Continuous fun x : TauCeti.AbsoluteGaloisGroup K × V => ρ x.1 x.2)
    (hF : ringChar F ≠ ringChar 𝓀[K])
    (hP : (Set.range fun g : wild K => ρ g).Finite) : ℚ := sorry

/-- The weighted break sum. -/
def swan : ℚ := (breakMultiplicity ρ hc hF hP).sum fun b n => b * n

/-- Actual inertia codimension; the supplied representation is not semisimplified. -/
def tamePart : ℕ :=
  Module.finrank F V - Module.finrank F (Representation.invariants (ρ.comp (inertia K).subtype))

/-- Actual tame part plus the canonical wild sum. -/
def artin : ℚ := tamePart ρ + swan ρ hc hF hP

theorem breakDecomposition_internal :
    DirectSum.IsInternal (breakDecomposition ρ hc hF hP) ∧
    (∀ g b, (breakDecomposition ρ hc hF hP b).map (ρ g) ≤
      breakDecomposition ρ hc hF hP b) := by sorry

theorem breakDecomposition_invariants (u : ℚ) (hu : 0 < u) :
    (Representation.invariants (ρ.comp (absoluteUpper K u).subtype)) =
      ⨆ b : {b : ℚ // b < u}, breakDecomposition ρ hc hF hP b := by sorry

theorem breakMultiplicity_support :
    (∀ b ∈ (breakMultiplicity ρ hc hF hP).support, 0 ≤ b) ∧
    (breakMultiplicity ρ hc hF hP) 0 =
      Module.finrank F (Representation.invariants (ρ.comp (wild K).subtype)) ∧
    (∀ b, (breakMultiplicity ρ hc hF hP) b =
      Module.finrank F (breakDecomposition ρ hc hF hP b)) := by sorry

/-- Unit test: TauCeti.ConductorR013.breakDecomposition_tame. -/
example (ht : ∀ g : wild K, ρ g = LinearMap.id) :
    breakDecomposition ρ hc hF hP 0 = ⊤ ∧
    ∀ b > (0 : ℚ), breakDecomposition ρ hc hF hP b = ⊥ := by sorry

/-- Unit test: TauCeti.ConductorR013.breakDecomposition_quadratic.
`hchar` specifies the actual one-dimensional character by its kernel; this is not an assumed
conductor value. Both square roots lie in the separable closure, as required. -/
example (i s : SeparableClosure ℚ_[2]) (hi : i ^ 2 = -1) (hs : s ^ 2 = 2)
    (χ χ' : Representation ℚ (TauCeti.AbsoluteGaloisGroup ℚ_[2]) ℚ)
    (hcχ : Continuous fun x : TauCeti.AbsoluteGaloisGroup ℚ_[2] × ℚ => χ x.1 x.2)
    (hcχ' : Continuous fun x : TauCeti.AbsoluteGaloisGroup ℚ_[2] × ℚ => χ' x.1 x.2)
    (hFχ : ringChar ℚ ≠ ringChar 𝓀[ℚ_[2]])
    (hPχ : (Set.range fun g : wild ℚ_[2] => χ g).Finite)
    (hPχ' : (Set.range fun g : wild ℚ_[2] => χ' g).Finite)
    (hchar : ∀ g, χ g = LinearMap.id ↔ g i = i)
    (hchar' : ∀ g, χ' g = LinearMap.id ↔ g s = s) :
    (breakMultiplicity χ hcχ hFχ hPχ).support = {1} ∧
    (breakMultiplicity χ' hcχ' hFχ hPχ').support = {2} := by sorry

/-- Unit test: TauCeti.ConductorR013.breakDecomposition_directSum. -/
example (i s : SeparableClosure ℚ_[2]) (hi : i ^ 2 = -1) (hs : s ^ 2 = 2)
    (χ χ' : Representation ℚ (TauCeti.AbsoluteGaloisGroup ℚ_[2]) ℚ)
    (τ : Representation ℚ (TauCeti.AbsoluteGaloisGroup ℚ_[2]) (ℚ × (ℚ × ℚ)))
    (hτ : τ = Representation.prod (Representation.trivial ℚ _ ℚ)
      (Representation.prod χ χ'))
    (hcτ : Continuous fun x : TauCeti.AbsoluteGaloisGroup ℚ_[2] × (ℚ × (ℚ × ℚ)) => τ x.1 x.2)
    (hFτ : ringChar ℚ ≠ ringChar 𝓀[ℚ_[2]])
    (hPτ : (Set.range fun g : wild ℚ_[2] => τ g).Finite)
    (hchar : ∀ g, χ g = LinearMap.id ↔ g i = i)
    (hchar' : ∀ g, χ' g = LinearMap.id ↔ g s = s) :
    breakMultiplicity τ hcτ hFτ hPτ =
      Finsupp.single 0 1 + Finsupp.single 1 1 + Finsupp.single 2 1 := by sorry

theorem swan_eq_zero_iff :
    swan ρ hc hF hP = 0 ↔ ∀ g : wild K, ρ g = LinearMap.id := by sorry

theorem swan_bound_highest :
    swan ρ hc hF hP ≤ highestBreak ρ hc hF hP * Module.finrank F V ∧
    (swan ρ hc hF hP = highestBreak ρ hc hF hP * Module.finrank F V ↔
      (breakMultiplicity ρ hc hF hP).support ⊆ {highestBreak ρ hc hF hP}) := by sorry

/-- Unit test: TauCeti.ConductorR013.swan_tame. -/
example (ht : ∀ g : wild K, ρ g = LinearMap.id) : swan ρ hc hF hP = 0 := by sorry

/-- Unit test: TauCeti.ConductorR013.swan_quadraticEight. -/
example (s : SeparableClosure ℚ_[2]) (hs : s ^ 2 = 2)
    (χ : Representation ℚ (TauCeti.AbsoluteGaloisGroup ℚ_[2]) ℚ)
    (hcχ : Continuous fun x : TauCeti.AbsoluteGaloisGroup ℚ_[2] × ℚ => χ x.1 x.2)
    (hFχ : ringChar ℚ ≠ ringChar 𝓀[ℚ_[2]])
    (hPχ : (Set.range fun g : wild ℚ_[2] => χ g).Finite)
    (hchar : ∀ g, χ g = LinearMap.id ↔ g s = s) :
    swan χ hcχ hFχ hPχ = 2 := by sorry

/-- Unit test: TauCeti.ConductorR013.swan_weightsMatter.
This tests the finite lower-sum arithmetic separately from the unavailable finite quotient
carrier; the field-specific identification is `swan_eq_lowerSum`. -/
example : (4 : ℚ) / 4 + 2 / 4 + 2 / 4 = 2 ∧ (1 : ℚ) + 1 + 1 ≠ 2 := by sorry

/- `swan_eq_lowerSum` and `artin_eq_lowerSum`: exact canonical finite quotient statements are
omitted because the pinned finite-ramification carrier is missing, not encoded by hypotheses
that already assume the desired conductor equation. -/

theorem artin_eq_tame_add_swan : artin ρ hc hF hP = tamePart ρ + swan ρ hc hF hP := by sorry

theorem artin_zero_iff :
    artin ρ hc hF hP = 0 ↔ ∀ g : inertia K, ρ g = LinearMap.id := by sorry

theorem conductor_integral : ∃ a s : ℕ,
    artin ρ hc hF hP = a ∧ swan ρ hc hF hP = s := by sorry

/-- Unit test: TauCeti.ConductorR013.artin_unramified. -/
example (hi : ∀ g : inertia K, ρ g = LinearMap.id) :
    tamePart ρ = 0 ∧ swan ρ hc hF hP = 0 ∧ artin ρ hc hF hP = 0 := by sorry

/-- Unit test: TauCeti.ConductorR013.artin_tameCharacter. -/
example (h1 : Module.finrank F V = 1)
    (ht : ∀ g : wild K, ρ g = LinearMap.id)
    (hn : ∃ g : inertia K, ρ g ≠ LinearMap.id) :
    tamePart ρ = 1 ∧ swan ρ hc hF hP = 0 ∧ artin ρ hc hF hP = 1 := by sorry

/-- Unit test: TauCeti.ConductorR013.artin_unipotent.
The rank-one kernel condition expresses the nonzero monodromy of a tame special module.
The actual local Weil–Deligne identification supplies this invariant-space equality. -/
example (h2 : Module.finrank F V = 2)
    (ht : ∀ g : wild K, ρ g = LinearMap.id)
    (hfixed : Module.finrank F (Representation.invariants (ρ.comp (inertia K).subtype)) = 1) :
    artin ρ hc hF hP = 1 := by sorry
end Breaks

section WeilDeligneFormula
variable {K : Type*} [Field K] [ValuativeRel K] [TopologicalSpace K]
  [IsNonarchimedeanLocalField K]
  {W F V : Type*} [Group W] [Field F] [CharZero F]
  [AddCommGroup V] [Module F V] [Module.Finite F V]

/-- Unbundled computational formula for the Swan term after pulling the absolute filtration
back to the actual Weil group. The genuine Weil/monodromy conditions are not weakened to
formal placeholders. The correspondence theorem is omitted until its supplier is available. -/
def wdSwan (ι : W →* TauCeti.AbsoluteGaloisGroup K) (r : Representation F W V) : ℝ :=
  ∫ u in Set.Ioi (0 : ℝ),
    (Module.finrank F V : ℝ) -
      Module.finrank F (Representation.invariants (r.comp ((absoluteUpper K u).comap ι).subtype))

/-- Formula underlying the actual WD conductor; it is defined on unbundled data so no actual
Weil carrier is fabricated. It agrees with the reader's rational value under the WD hypotheses. -/
def wdConductor (ι : W →* TauCeti.AbsoluteGaloisGroup K) (r : Representation F W V)
    (N : V →ₗ[F] V) : ℝ :=
  wdSwan ι r + (Module.finrank F V -
    Module.finrank F ((LinearMap.ker N) ⊓
      (Representation.invariants (r.comp ((inertia K).comap ι).subtype)) : Submodule F V) : ℕ)

theorem wd_eq_artin_correction (ι : W →* TauCeti.AbsoluteGaloisGroup K)
    (r : Representation F W V) (N : V →ₗ[F] V) :
    wdConductor ι r N =
      (wdSwan ι r + (Module.finrank F V -
        Module.finrank F (Representation.invariants (r.comp ((inertia K).comap ι).subtype)) : ℕ)) +
      (Module.finrank F (Representation.invariants (r.comp ((inertia K).comap ι).subtype)) -
        Module.finrank F ((LinearMap.ker N) ⊓
          (Representation.invariants (r.comp ((inertia K).comap ι).subtype)) : Submodule F V) : ℕ) := by sorry

/-- Unit test: TauCeti.ConductorR013.wd_zeroMonodromy. -/
example (ι : W →* TauCeti.AbsoluteGaloisGroup K) (r : Representation F W V) :
    wdConductor ι r 0 = wdSwan ι r +
      (Module.finrank F V -
        Module.finrank F (Representation.invariants (r.comp ((inertia K).comap ι).subtype)) : ℕ) := by sorry

/-- Unit test: TauCeti.ConductorR013.wd_specialTwo. Trivial pulled-back inertia
forces the positive-upper invariant codimensions, and therefore the Swan integral, to vanish. -/
example (ι : W →* TauCeti.AbsoluteGaloisGroup K) (r : Representation F W V)
    (N : V →ₗ[F] V) (hr : ∀ g : (inertia K).comap ι, r g = LinearMap.id)
    (h2 : Module.finrank F V = 2)
    (hN : Module.finrank F (LinearMap.ker N) = 1) : wdConductor ι r N = 1 := by sorry

/-- Unit test: TauCeti.ConductorR013.wd_unramifiedJordan. -/
example (ι : W →* TauCeti.AbsoluteGaloisGroup K) (r : Representation F W V)
    (N : V →ₗ[F] V) (hr : ∀ g : (inertia K).comap ι, r g = LinearMap.id)
    (n : ℕ) (hn : 0 < n)
    (hd : Module.finrank F V = n) (hN : Module.finrank F (LinearMap.ker N) = 1) :
    wdConductor ι r N = n - 1 := by sorry

/- `wd_eq_ladic`, `wd_frobeniusSemisimplification` and `wd-actual-inertia-invariants`
need R01.2's actual coefficient/tame-character/Weil functor. They are not asserted here for
arbitrary unbundled r,N,ι. The full statements and the missing carrier are explicit in the reader. -/
end WeilDeligneFormula

section IdealConstructors
variable {R : Type*} [CommRing R] [IsDedekindDomain R]

/-- Finite ideal product of local exponents, with the excluded places suppressed. -/
def globalConductor (a : HeightOneSpectrum R →₀ ℕ) (excluded : Finset (HeightOneSpectrum R)) : Ideal R :=
  by
  classical
  exact a.prod fun v n => if v ∈ excluded then 1 else v.asIdeal ^ n

theorem globalConductor_support (a : HeightOneSpectrum R →₀ ℕ)
    (excluded : Finset (HeightOneSpectrum R)) (v : HeightOneSpectrum R) :
    globalConductor a excluded ≤ v.asIdeal ↔ v ∉ excluded ∧ a v ≠ 0 := by sorry

theorem globalConductor_enlargeExcluded (a : HeightOneSpectrum R →₀ ℕ)
    (excluded excluded' : Finset (HeightOneSpectrum R)) (h : excluded ⊆ excluded') :
    globalConductor a excluded' ∣ globalConductor a excluded := by sorry

/-- Unit test: TauCeti.ConductorR013.globalConductor_unramified. -/
example (excluded : Finset (HeightOneSpectrum R)) : globalConductor 0 excluded = 1 := by sorry

/-- Unit test: TauCeti.ConductorR013.globalConductor_singlePrime. -/
example (v : HeightOneSpectrum R) (n : ℕ) (excluded : Finset (HeightOneSpectrum R))
    (hv : v ∉ excluded) : globalConductor (Finsupp.single v n) excluded = v.asIdeal ^ n := by sorry

/-- Unit test: TauCeti.ConductorR013.globalConductor_excludedPrime. -/
example (v : HeightOneSpectrum R) (n : ℕ) (excluded : Finset (HeightOneSpectrum R))
    (hv : v ∈ excluded) : globalConductor (Finsupp.single v n) excluded = 1 := by sorry

/- `globalConductor_valuation` uses the NumberFieldArithmetic prime-ideal exponent dictionary.
The ideal constructor above is generic, while the global representation exponent assignment
and excluded coefficient-place requirement remain in the exact mathematical target. -/
end IdealConstructors

section ResidualIntegerConstructor
/-- Over Q, the positive prime-to-coefficient conductor from its local exponent function.
The number-field ideal version is `globalConductor` with the set of places above ℓ. -/
def primeToConductor (ℓ : ℕ) (a : ℕ →₀ ℕ) : ℕ :=
  a.prod fun q n => if q = ℓ then 1 else q ^ n

theorem primeToConductor_coprime (ℓ : ℕ) (hℓ : ℓ.Prime) (a : ℕ →₀ ℕ)
    (ha : ∀ q ∈ a.support, q.Prime) : Nat.Coprime (primeToConductor ℓ a) ℓ := by sorry

/-- Unit test: TauCeti.ConductorR013.primeToConductor_trivial. -/
example (ℓ : ℕ) : primeToConductor ℓ 0 = 1 := by sorry

/-- Unit test: TauCeti.ConductorR013.primeToConductor_twoPrimes. -/
example : primeToConductor 3 (Finsupp.single 2 3 + Finsupp.single 3 1) = 8 := by sorry

/-- Unit test: TauCeti.ConductorR013.primeToConductor_notCoefficientPrime. -/
example : primeToConductor 2 (Finsupp.single 2 3 + Finsupp.single 3 1) = 3 := by sorry

/- `primeToConductor_raw_ss` and `primeToConductor_baseChange` apply the imported residual
representation functors, not arbitrary exponent functions. Their full representation signatures
are in the earlier reviewed roadmap's suggested file; no surrogate residual carrier is defined. -/
end ResidualIntegerConstructor

section SeparableHerbrand
variable (K L : Type*) [Field K] [Field L] [ValuativeRel K] [ValuativeRel L]
  [TopologicalSpace K] [TopologicalSpace L] [IsNonarchimedeanLocalField K]
  [IsNonarchimedeanLocalField L] [Algebra K L] [ValuativeExtension K L] [Module.Finite K L] [Algebra.IsSeparable K L]

/-- Non-Galois Herbrand function; on u≥0 it is φ_{M/L} ∘ ψ_{M/K} in a Galois closure.
The arbitrary negative extension of this real-valued prototype is not an asserted convention. -/
def herbrandExtension (K L : Type*) [Field K] [Field L]
    [ValuativeRel K] [ValuativeRel L] [TopologicalSpace K] [TopologicalSpace L]
    [IsNonarchimedeanLocalField K] [IsNonarchimedeanLocalField L]
    [Algebra K L] [ValuativeExtension K L] [Module.Finite K L] [Algebra.IsSeparable K L] (u : ℝ) : ℝ := sorry

variable {K L}
theorem herbrandExtension_tower (L' : Type*) [Field L'] [ValuativeRel L']
    [TopologicalSpace L'] [IsNonarchimedeanLocalField L'] [Algebra K L'] [Algebra L L']
    [ValuativeExtension K L'] [ValuativeExtension L L'] [IsScalarTower K L L']
    [Module.Finite K L'] [Module.Finite L L'] [Algebra.IsSeparable K L']
    [Algebra.IsSeparable L L'] (u : ℝ) (hu : 0 ≤ u) :
    herbrandExtension K L' u = herbrandExtension L L' (herbrandExtension K L u) := by sorry

local instance : ValuativeExtension K K where
  vle_iff_vle a b := by simp

/-- Unit test: TauCeti.ConductorR013.herbrandExtension_identity. -/
example (u : ℝ) (hu : 0 ≤ u) : herbrandExtension K K u = u := by sorry

/-- Unit test: TauCeti.ConductorR013.herbrandExtension_unramified.
The ring algebra is required to be the restriction of the given field inclusion. The actual
Mathlib ramification index, rather than an arbitrary number e, expresses unramifiedness. -/
example [Algebra 𝒪[K] 𝒪[L]]
    (hmap : ∀ a : 𝒪[K], (algebraMap 𝒪[K] 𝒪[L] a : L) = algebraMap K L a)
    (he : (IsLocalRing.maximalIdeal 𝒪[L]).ramificationIdx 𝒪[K] = 1)
    (u : ℝ) (hu : 0 ≤ u) : herbrandExtension K L u = u := by sorry

/-- Unit test: TauCeti.ConductorR013.herbrandExtension_tame. -/
example [Algebra 𝒪[K] 𝒪[L]]
    (hmap : ∀ a : 𝒪[K], (algebraMap 𝒪[K] 𝒪[L] a : L) = algebraMap K L a)
    (ht : ¬ ringChar 𝓀[K] ∣ (IsLocalRing.maximalIdeal 𝒪[L]).ramificationIdx 𝒪[K])
    (u : ℝ) (hu : 0 ≤ u) : herbrandExtension K L u =
      ((IsLocalRing.maximalIdeal 𝒪[L]).ramificationIdx 𝒪[K] : ℝ) * u := by sorry

/- `herbrandExtension_index` and `herbrandExtension_eventual` additionally use the canonical
absolute restriction/open-subgroup index and local different-exponent supplier. Those
conditions are omitted, rather than replaced by an assumed slope or defect equality. -/
end SeparableHerbrand

section EllipticExponents
variable {K : Type*} [Field K] [ValuativeRel K] [TopologicalSpace K]
  [IsNonarchimedeanLocalField K]

/-- f(E)=a(V_ℓ₀E) for one auxiliary ℓ₀≠p; the Tate-module body uses EllipticCurves layer 2. -/
def ellipticConductor (E : WeierstrassCurve K) [E.IsElliptic] : ℕ := sorry
/-- The actual tame inertia codimension of the elliptic Tate module. -/
def ellipticTame (E : WeierstrassCurve K) [E.IsElliptic] : ℕ := sorry
/-- The elliptic Swan term, independent of the auxiliary prime. -/
def ellipticSwan (E : WeierstrassCurve K) [E.IsElliptic] : ℕ := sorry

theorem ellipticConductor_eq_parts (E : WeierstrassCurve K) [E.IsElliptic] :
    ellipticConductor E = ellipticTame E + ellipticSwan E ∧
    ((E.minimal 𝒪[K]).HasGoodReduction 𝒪[K] → ellipticTame E = 0) ∧
    ((E.minimal 𝒪[K]).HasMultiplicativeReduction 𝒪[K] → ellipticTame E = 1) ∧
    ((E.minimal 𝒪[K]).HasAdditiveReduction 𝒪[K] → ellipticTame E = 2) := by sorry

/-- Unit test: TauCeti.ConductorR013.ellipticConductor_good. -/
example (E : WeierstrassCurve K) [E.IsElliptic]
    (h : (E.minimal 𝒪[K]).HasGoodReduction 𝒪[K]) :
    ellipticTame E = 0 ∧ ellipticSwan E = 0 ∧ ellipticConductor E = 0 := by sorry

/-- Unit test: TauCeti.ConductorR013.ellipticConductor_multiplicative. -/
example (E : WeierstrassCurve K) [E.IsElliptic]
    (h : (E.minimal 𝒪[K]).HasMultiplicativeReduction 𝒪[K]) :
    ellipticTame E = 1 ∧ ellipticSwan E = 0 ∧ ellipticConductor E = 1 := by sorry

/-- Unit test: TauCeti.ConductorR013.ellipticConductor_additiveTame. -/
example (E : WeierstrassCurve K) [E.IsElliptic]
    (h : (E.minimal 𝒪[K]).HasAdditiveReduction 𝒪[K]) (hp : 5 ≤ ringChar 𝓀[K]) :
    ellipticTame E = 2 ∧ ellipticSwan E = 0 ∧ ellipticConductor E = 2 := by sorry

/-- Elliptic small-prime bound, numeric specialization of Brumer–Kramer. -/
theorem elliptic_conductor_Q2_le_eight (E : WeierstrassCurve ℚ_[2]) [E.IsElliptic] :
    ellipticConductor E ≤ 8 := by sorry

theorem elliptic_conductor_Q3_le_five (E : WeierstrassCurve ℚ_[3]) [E.IsElliptic] :
    ellipticConductor E ≤ 5 := by sorry

/- `ellipticConductor_allEll` and `ellipticConductor_dual` need the actual Tate-module,
residual-torsion and isogeny comparison maps; the elliptic curve carrier itself exists and is
used above. Their missing conditions are not replaced by an arbitrary representation on F². -/
end EllipticExponents

section DigitWeight
/-- Brumer–Kramer's finite weighted digit sum, in Mathlib's little-endian digit convention. -/
def digitWeight (p n : ℕ) : ℕ :=
  ((Nat.digits p n).zipIdx.map fun x => x.2 * x.1 * p ^ x.2).sum

theorem digitWeight_zero (p : ℕ) : digitWeight p 0 = 0 := by sorry

theorem digitWeight_singlePlace (p r i : ℕ) (hp : 2 ≤ p) (hr : r < p) :
    digitWeight p (r * p ^ i) = i * r * p ^ i := by sorry

theorem digitWeight_carry (p : ℕ) (hp : 2 ≤ p) (s : ℕ →₀ ℕ) :
    s.sum (fun i n => i * n * p ^ i) ≤ digitWeight p (s.sum fun i n => n * p ^ i) := by sorry

/-- Unit test: TauCeti.ConductorR013.digitWeight_smallDigit. -/
example (p n : ℕ) (hp : 2 ≤ p) (hn : n < p) : digitWeight p n = 0 := by sorry

/-- Unit test: TauCeti.ConductorR013.digitWeight_binaryTwo. -/
example : digitWeight 2 2 = 2 ∧ digitWeight 2 3 = 2 ∧ digitWeight 2 4 = 8 := by sorry

/-- Unit test: TauCeti.ConductorR013.digitWeight_ternary. -/
example : digitWeight 3 3 = 3 ∧ digitWeight 3 6 = 6 ∧ digitWeight 3 2 = 0 := by sorry
end DigitWeight

/-!
The following exact future-carrier declarations are omitted under PROTOCOL §13. Their statement,
API and tests are specified in the definitive reader, and the corresponding gaps/requests name
the carriers required. They are not replaced by propositions with uninterpreted fields.

* `surfaceArtin`, `surfaceArtin_good`, `surfaceArtin_semistable`, `surfaceArtin_genusOne`;
  tests `surfaceArtin_smoothElliptic`, `surfaceArtin_nodalCubic`, `surfaceArtin_splitPolygon`:
  regular curve models and their finite-dimensional étale cohomology.
* `discriminantOrder`, `discriminantOrder_basisIndependent`, `discriminantOrder_extension`,
  `discriminantOrder_genusOne`; tests `discriminantOrder_good`, `discriminantOrder_I_n`,
  `discriminantOrder_nonminimal`: derived determinants and dualising lattices of those models.
* `potential-good-common-inertia`, `elliptic-local-independence`,
  `elliptic-minimal-model-comparison`, `saito-verified-statement`, `uniform-ogg-comparison`,
  `elliptic-sharp-exponent-bounds`: the full comparison statements use the Tate module or
  the preceding geometric carriers. The two Q₂/Q₃ numeric specializations above elaborate.
* `prime-to-characteristic-simple-lifting`, `brumer-kramer-rational-lift`,
  `brumer-kramer-constituent-estimate`, `brumer-kramer-wild-bound`: actual integral lattice,
  simple character, root identification and Schur-index interfaces are the representation-theory
  supplier inputs. Numerical inequalities with an assumed value for the conductor do not
  prototype these theorems, so none is substituted here.
* `character-conductor-reciprocity`: the canonical local Artin map and its unit filtration
  compatibility, not a quantified arbitrary reciprocity map.
-/

end TauCeti.ConductorR013
