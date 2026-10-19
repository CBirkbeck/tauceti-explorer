import Mathlib.RingTheory.Perfectoid.FontaineTheta
import Mathlib.RingTheory.Perfectoid.Untilt
import Mathlib.RingTheory.Valuation.ValuationRing
import Mathlib.RingTheory.Valuation.Basic
import Mathlib.RingTheory.Flat.FaithfullyFlat.Basic
import Mathlib.RingTheory.FinitePresentation
import Mathlib.RingTheory.Localization.Away.Basic
import Mathlib.Algebra.Module.LocalizedModule.Basic
import Mathlib.RingTheory.Regular.RegularSequence
import Mathlib.RingTheory.Jacobson.Ideal
import Mathlib.RingTheory.Henselian
import Mathlib.RingTheory.LocalRing.ResidueField.Ideal
import Mathlib.RingTheory.TensorProduct.Basic
import Mathlib.Topology.Algebra.TopologicallyNilpotent
import Mathlib.Data.ZMod.Basic
import TauCeti.RingTheory.Huber.Continuous.ValuativeCriterion
import TauCeti.AlgebraicGeometry.AdicSpace.Cont.Basic

/-!
# Perfectoid quotients and their prismatic prerequisites, Part II — suggested Lean

This file is not the roadmap and it is not exhaustive: the roadmap document
(`research/blueprint/readmes/PerfectoidQuotientsPartII.md`) is definitive. The statements below
suggest Lean forms, so that contributors and reviewers converge on names and signatures. Every
proof is `sorry`; nothing here is formalised.

Only statements whose carriers exist at the pins (Mathlib `082e2d3`, Tau Ceti `f790474`) are
typed: the inverse-limit description of `PreTilt`, the tilt of a `p`-adically complete valuation
ring, ind-fppf maps, the commutative-algebra inputs of the André lemma, the tilt of a valuation,
the valuative criterion for topological nilpotence in a Tate ring, and `p`-Zariski rings. The
integral perfectoid predicate (PerfectoidSpaces P1.24), syntomic morphisms (Tau Ceti
StableReduction Layer 1), perfectoidization (PrismaticCohomology, Part I) and almost mathematics
(PerfectoidSpaces P0) are not at the pins, so the targets that need them are listed in the
closing comment and stated in the roadmap document only.
-/

open Ideal Polynomial TauCeti

noncomputable section

namespace TauCetiRoadmap.PerfectoidQuotientsPartII

universe u

/-! ## Layer Q5: the tilt as an inverse limit (README Q5.1) -/

section Tilt

variable (O : Type*) [CommRing O] (p : ℕ) [Fact p.Prime] [Fact ¬IsUnit (p : O)]
  [IsAdicComplete (span {(p : O)}) O]

/-- The `n`-th coordinate `(x^{1/p^n})^♯` of the inverse-limit description of the tilt
(Česnavičius–Scholze (2.1.1.2); BMS1 Lemma 3.2(i)). -/
def tiltCoord (x : PreTilt O p) (n : ℕ) : O :=
  PreTilt.untilt (((frobeniusEquiv (PreTilt O p) p).symm)^[n] x)

theorem tiltCoord_zero (x : PreTilt O p) : tiltCoord O p x 0 = PreTilt.untilt x := rfl

theorem tiltCoord_succ_pow (x : PreTilt O p) (n : ℕ) :
    tiltCoord O p x (n + 1) ^ p = tiltCoord O p x n := sorry

/-- README Q5.1 (1): the tilt is the monoid of `p`-power compatible sequences. -/
theorem tiltCoord_injective : Function.Injective (tiltCoord O p) := sorry

theorem tiltCoord_surjective (a : ℕ → O) (ha : ∀ n, a (n + 1) ^ p = a n) :
    ∃ x : PreTilt O p, tiltCoord O p x = a := sorry

/-- README Q5.1 (3): `θ` is the unique ring map with `θ([x]) = x^♯`. -/
theorem fontaineTheta_unique (f : WittVector p (PreTilt O p) →+* O)
    (hf : ∀ x, f (WittVector.teichmuller p x) = PreTilt.untilt x) :
    f = WittVector.fontaineTheta O p := sorry

end Tilt

/-! ## Layer Q6: the tilt of a complete valuation ring (README Q6.3) -/

section ValuationRing

variable (p : ℕ) [Fact p.Prime] (V : Type*) [CommRing V] [IsDomain V] [ValuationRing V]
  [Fact ¬IsUnit (p : V)] [IsAdicComplete (span {(p : V)}) V]

theorem untilt_eq_zero_iff (x : PreTilt V p) : PreTilt.untilt x = 0 ↔ x = 0 := sorry

theorem isDomain_preTilt : IsDomain (PreTilt V p) := sorry

theorem untilt_dvd_iff (x y : PreTilt V p) :
    x ∣ y ↔ PreTilt.untilt x ∣ PreTilt.untilt y := sorry

/-- README Q6.3: the tilt of a `p`-adically complete valuation ring is a valuation ring; no
perfectoid hypothesis. -/
theorem valuationRing_preTilt :
    letI := isDomain_preTilt p V
    ValuationRing (PreTilt V p) := sorry

end ValuationRing

/-! ## Layer Q7: ind-fppf maps and commutative-algebra inputs (README Q7) -/

/-- Ind-fppf ring maps (README Q7.1), in the factorization form of Stacks 07C3: `A → B` is
faithfully flat and every finitely presented `A`-algebra map `C → B` factors through a faithfully
flat finitely presented `A`-algebra. -/
def IsIndFppf (A : Type u) (B : Type u) [CommRing A] [CommRing B] [Algebra A B] : Prop :=
  Module.FaithfullyFlat A B ∧
    ∀ (C : Type u) [CommRing C] [Algebra A C] [Algebra.FinitePresentation A C] (f : C →ₐ[A] B),
      ∃ (D : Type u) (_ : CommRing D) (_ : Algebra A D),
        Algebra.FinitePresentation A D ∧ Module.FaithfullyFlat A D ∧
          ∃ (g : C →ₐ[A] D) (h : D →ₐ[A] B), h.comp g = f

namespace IsIndFppf

variable {A B C : Type u} [CommRing A] [CommRing B] [CommRing C] [Algebra A B]

theorem faithfullyFlat (h : IsIndFppf A B) : Module.FaithfullyFlat A B := h.1

theorem of_finitePresentation [Algebra.FinitePresentation A B] [Module.FaithfullyFlat A B] :
    IsIndFppf A B := sorry

theorem comp [Algebra B C] [Algebra A C] [IsScalarTower A B C]
    (hB : IsIndFppf A B) (hC : IsIndFppf B C) : IsIndFppf A C := sorry

open scoped TensorProduct in
theorem baseChange [Algebra A C] (h : IsIndFppf A B) : IsIndFppf C (C ⊗[A] B) := sorry

theorem prod {B' : Type u} [CommRing B'] [Algebra A B'] (h : IsIndFppf A B) (h' : IsIndFppf A B') :
    IsIndFppf A (B × B') := sorry

theorem of_equiv {B' : Type u} [CommRing B'] [Algebra A B'] (e : B ≃ₐ[A] B') (h : IsIndFppf A B) :
    IsIndFppf A B' := sorry

end IsIndFppf

/-- Test `indFppf_self`. -/
example (A : Type u) [CommRing A] : IsIndFppf A A := sorry

/-- Test `indFppf_polynomial` (one variable; the countable case is a filtered colimit). -/
example (A : Type u) [CommRing A] : IsIndFppf A A[X] := sorry

/-- Test `not_indFppf_localization`: flat but not faithfully flat. -/
example : ¬ IsIndFppf ℤ ℚ := sorry

/-- Test `not_indFppf_localization`: not flat. -/
example (p : ℕ) [Fact p.Prime] : ¬ IsIndFppf ℤ (ZMod p) := sorry

/-- Test `indFppf_prod`. -/
example (A : Type u) [CommRing A] : IsIndFppf A (A × A) := sorry

/-- README Q7.4: glueing of flatness along a nonzerodivisor (Stacks 0H7N). -/
theorem Module.Flat.of_isSMulRegular_of_flat_localization_of_flat_quotient
    {A M : Type*} [CommRing A] [AddCommGroup M] [Module A M] (f : A)
    (hA : IsSMulRegular A f) (hM : IsSMulRegular M f)
    (hloc : Module.Flat (Localization.Away f) (LocalizedModule (Submonoid.powers f) M))
    (hquot : Module.Flat (A ⧸ Ideal.span {f}) (M ⧸ (Ideal.span {f} • (⊤ : Submodule A M)))) :
    Module.Flat A M := sorry

/-- README Q7.5: for a regular pair `a, g` the kernel of `X ↦ g/a` from `R[X]` to `R[1/a]` is
generated by `aX - g` (Stacks 0BIQ). -/
theorem ker_aeval_div_of_isRegular {R : Type*} [CommRing R] (a g : R)
    (h : RingTheory.Sequence.IsRegular R [a, g]) :
    RingHom.ker (Polynomial.aeval (R := R)
      (IsLocalization.mk' (Localization.Away a) g (⟨a, Submonoid.mem_powers a⟩ :
        Submonoid.powers a))).toRingHom = Ideal.span {C a * X - C g} := sorry

/-- README Q7.6: fibrewise nonzero hypersurfaces are flat (Stacks 00SW for one equation). -/
theorem flat_quotient_of_forall_map_ne_zero {A : Type*} [CommRing A] {σ : Type*} [Finite σ]
    (g : MvPolynomial σ A)
    (hg : ∀ P : PrimeSpectrum A, MvPolynomial.map (algebraMap A P.asIdeal.ResidueField) g ≠ 0) :
    Module.Flat A (MvPolynomial σ A ⧸ Ideal.span {g}) := sorry

/-! ## Layer Q8: tilting valuations and topological nilpotence (README Q8) -/

section TiltValuation

variable (O : Type*) [CommRing O] (p : ℕ) [Fact p.Prime] [Fact ¬IsUnit (p : O)]
  [IsAdicComplete (span {(p : O)}) O]

/-- README Q8.2, for `ϖ = p`: the tilt `x ↦ v(x^♯)` of a valuation that is at most `1` on `O`
and continuous for the `p`-adic topology. Continuity is imposed against every unit of the
codomain, which is stronger than Wedhorn's value-group test used in the README. -/
def tiltValuation {Γ₀ : Type*} [LinearOrderedCommGroupWithZero Γ₀] (v : Valuation O Γ₀)
    (hle : ∀ x, v x ≤ 1) (hcont : ∀ γ : Γ₀ˣ, ∃ n : ℕ, v ((p : O) ^ n) < γ) :
    Valuation (PreTilt O p) Γ₀ where
  toFun x := v (PreTilt.untilt x)
  map_zero' := sorry
  map_one' := sorry
  map_mul' := sorry
  map_add_le_max' := sorry

variable {O p}

theorem tiltValuation_apply {Γ₀ : Type*} [LinearOrderedCommGroupWithZero Γ₀] (v : Valuation O Γ₀)
    (hle : ∀ x, v x ≤ 1) (hcont : ∀ γ : Γ₀ˣ, ∃ n : ℕ, v ((p : O) ^ n) < γ) (x : PreTilt O p) :
    tiltValuation O p v hle hcont x = v (PreTilt.untilt x) := rfl

theorem tiltValuation_le_one {Γ₀ : Type*} [LinearOrderedCommGroupWithZero Γ₀] (v : Valuation O Γ₀)
    (hle : ∀ x, v x ≤ 1) (hcont : ∀ γ : Γ₀ˣ, ∃ n : ℕ, v ((p : O) ^ n) < γ) (x : PreTilt O p) :
    tiltValuation O p v hle hcont x ≤ 1 := hle _

end TiltValuation

/-- README Q8.4: topological nilpotence is detected by continuous valuations bounded by `1` on a
ring of definition (Česnavičius–Scholze Lemma 2.3.2, in Tate-ring form). -/
theorem isTopologicallyNilpotent_iff_forall_vlt_one {R : Type*} [CommRing R] [TopologicalSpace R]
    [IsTopologicalRing R] [Huber.IsTateRing R] (P : Huber.PairOfDefinition R) (a : R) :
    IsTopologicallyNilpotent a ↔
      ∀ v : Spv R, v.IsContinuous → (∀ b ∈ P.ringOfDefinition, v.toValuativeRel.vle b 1) →
        v.toValuativeRel.vlt a 1 := sorry

/-! ## Layer Q9: `p`-Zariski rings (README Q9.5) -/

section PZariski

/-- A ring is `p`-Zariski if `1 + pA` consists of units. -/
def IsPZariski (A : Type*) [CommRing A] (p : ℕ) : Prop := ∀ a : A, IsUnit (1 + (p : A) * a)

/-- The multiplicative set `1 + pB`. -/
def pZariskiSubmonoid (B : Type*) [CommRing B] (p : ℕ) : Submonoid B where
  carrier := {x | ∃ b, x = 1 + (p : B) * b}
  one_mem' := ⟨0, by simp⟩
  mul_mem' := by
    rintro _ _ ⟨b, rfl⟩ ⟨c, rfl⟩
    exact ⟨b + c + p * b * c, by ring⟩

/-- The `p`-Zariskization `B_{1+pB}`. -/
abbrev PZariskization (B : Type*) [CommRing B] (p : ℕ) := Localization (pZariskiSubmonoid B p)

variable {A B : Type*} [CommRing A] [CommRing B] {p : ℕ}

theorem IsPZariski.iff_mem_jacobson : IsPZariski A p ↔ (p : A) ∈ (⊥ : Ideal A).jacobson := sorry

theorem PZariskization.isPZariski : IsPZariski (PZariskization B p) p := sorry

/-- The universal map from the `p`-Zariskization to a `p`-Zariski ring. -/
def PZariskization.lift {C : Type*} [CommRing C] (hC : IsPZariski C p) (f : B →+* C) :
    PZariskization B p →+* C :=
  IsLocalization.lift (M := pZariskiSubmonoid B p) (g := f) <| by
    rintro ⟨_, b, rfl⟩
    simpa using hC (f b)

theorem PZariskization.lift_comp {C : Type*} [CommRing C] (hC : IsPZariski C p) (f : B →+* C) :
    (PZariskization.lift hC f).comp (algebraMap B (PZariskization B p)) = f := sorry

theorem PZariskization.lift_unique {C : Type*} [CommRing C] (hC : IsPZariski C p) (f : B →+* C)
    (g : PZariskization B p →+* C) (hg : g.comp (algebraMap B (PZariskization B p)) = f) :
    g = PZariskization.lift hC f := sorry

theorem IsPZariski.of_isAdicComplete [IsAdicComplete (span {(p : A)}) A] : IsPZariski A p := sorry

theorem IsPZariski.of_henselian [HenselianRing A (span {(p : A)})] : IsPZariski A p := sorry

theorem IsPZariski.quotient (h : IsPZariski A p) (I : Ideal A) : IsPZariski (A ⧸ I) p := sorry

/-- Test `pZariski_zmod_ppow`. -/
example (p n : ℕ) : IsPZariski (ZMod (p ^ n)) p := sorry

/-- Test `not_pZariski_rat`. -/
example (p : ℕ) [Fact p.Prime] : ¬ IsPZariski ℚ p := sorry

/-- Test `not_pZariski_int`. -/
example (p : ℕ) [Fact p.Prime] : ¬ IsPZariski ℤ p := sorry

/-- Test `pZariski_zero`. -/
example (p : ℕ) : IsPZariski PUnit p := sorry

/-- Test `pZariskization_int`: integers prime to `p` become units, as in `ℤ_(p)`. -/
example (p : ℕ) [Fact p.Prime] (n : ℤ) (hn : ¬ (p : ℤ) ∣ n) :
    IsUnit (algebraMap ℤ (PZariskization ℤ p) n) := sorry

end PZariski

/-!
## Statements not typed at the pins

The following roadmap targets need carriers that neither pinned library has; they are stated in
the roadmap document, with the names proposed there.

* Integral perfectoid predicate (PerfectoidSpaces P1.24) and its tilts:
  `sharpQuotientEquiv` (Q5.3), `torsionTransfer` (Q5.4), `ainf_surjective_of_surjective` (Q5.5),
  `isIntegralPerfectoid_fibreProduct` (Q5.6), the glueing application (Q5.7),
  `relativeTiltingEquivalence` (Q6.1), `isAdicComplete_iff_tilt` (Q6.2),
  `valuationRing_iff_tilt` (Q6.4), `isAdicComplete_localization_of_valuationRing` (Q6.5),
  `isIntegralPerfectoid_localization` (Q6.6), `isAlgClosed_fractionRing_iff_tilt` (Q6.7),
  `exists_torsionFree_presentation` (Q6.8), `exists_sharp_approximation` (Q8.3),
  and the tilt-of-limits statement `tilt_pi` with its fibre-product form (Q5.2).
* Syntomic morphisms (Tau Ceti StableReduction Layer 1): `IsIndSyntomic` with
  `IsIndSyntomic.of_syntomic`, `.flat`, `.isIndFppf`, `.comp`, `.baseChange`, `.prod`,
  `.colimit`, `.iff_colimit` (Q7.2); `IsIndSyntomic.comp` and the stability theorem (Q7.3);
  syntomicity (not only flatness) in `flat_quotient_of_forall_map_ne_zero` (Q7.6); the ind-fppf
  colimit forms `IsIndFppf.iff_colimit`, `IsIndFppf.iff_faithfullyFlat_colimit_flat`,
  `IsIndFppf.colimit`; tests `indSyntomic_rootPolynomial`, `indSyntomic_hypersurface`,
  `not_indSyntomic_quotient`, `indSyntomic_not_faithfullyFlat`, `not_indFppf_completion`.
* Tilted valuations beyond `ϖ = p` (Q8.2): `tiltValuation_pseudoUniformizer`,
  `tiltValuation_isContinuous`, `tiltValuation_map`, `tiltValuation_charP`, `tiltValuation_field`;
  tests `tiltValuation_OC`, `tiltValuation_perfect`, `tiltValuation_kills_pseudoUniformizer`,
  `tiltValuation_not_lift`; and the continuity comparison `isContinuous_iff_pow_lt` (Q8.1), which
  needs the `ϖ`-adic topology as an instance.
* Root polynomial algebras and `p`-integral closures (PerfectoidQuotients Layer 0):
  `AndreRootExtension` with `.ideal`, `.root`, `.root_pow`, `.aeval_root`,
  `.ideal_varpi_divisible`, `.quotient_isIntegral`, `.quotient_isPIntegralClosure`, `.map`
  and tests `andreRootExtension_empty`, `andreRootExtension_linear`, `andreRootExtension_T`,
  `andreRootExtension_degree_zero` (Q9.1); `pIntegralClosure_blowup_eq_iUnion` (Q9.2);
  `exists_indSyntomic_andre_extension` (Q9.3); `andre_completion_faithfullyFlat_mod` (Q9.4);
  `exists_semiperfectoid_cover` (Q9.6).
* Regular local rings, prisms, perfectoidization and almost mathematics: `exists_regular_tower`
  (Q10.1), `exists_faithfullyFlat_perfectoid_cover` (Q10.2),
  `isIntegralPerfectoid_completion_absoluteIntegralClosure` (Q10.3),
  `exists_perfectoid_cover_le_completion_absoluteIntegralClosure` (Q10.4),
  `tor_image_almost_zero` (Q10.5).
-/

end TauCetiRoadmap.PerfectoidQuotientsPartII
