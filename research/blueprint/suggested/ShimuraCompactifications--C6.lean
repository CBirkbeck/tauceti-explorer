/-
This file is not the roadmap and is not exhaustive. The roadmap document is definitive.
These statements suggest Lean forms so contributors and reviewers converge on names and
signatures. Every new proof is a placeholder; no implementation is claimed.

C6 uses native number fields, unit groups and integral trace duals.
The shared build lacks the TotallyPositive object file. Strict total positivity is
therefore written as its real-embedding condition, exactly equivalent to the pinned
NumberField.isTotallyPositive_iff under IsTotallyReal, without defining a new predicate. A coefficient family
is not a completed series ring or a Hilbert modular variety. Geometric signatures whose
supplier carriers do not yet exist are omitted, as required by PROTOCOL section 13.
The per-node ledger below and the packet gap identify each omission.
Pins: Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.
-/

import Mathlib.NumberTheory.NumberField.InfinitePlace.TotallyRealComplex
import Mathlib.NumberTheory.NumberField.Units.DirichletTheorem
import Mathlib.Analysis.SpecificLimits.Basic
import Mathlib.Data.ZMod.Basic
import Mathlib.RingTheory.DedekindDomain.Different

open NumberField NumberField.InfinitePlace
open scoped BigOperators

noncomputable section
namespace TauCeti.HilbertCusp

variable {F : Type*} [Field F] [NumberField F] [IsTotallyReal F]

/-- C6/finite-index-cusp-unit-contraction. InfinitePlace values are ABSOLUTE values. -/
theorem finiteIndex_unit_contracts_away
    (U : Subgroup (𝓞 F)ˣ) [U.FiniteIndex]
    (hd : 1 < Fintype.card (InfinitePlace F)) (w₀ : InfinitePlace F) :
    ∃ u : U, 1 < w₀ ((u : (𝓞 F)ˣ) : F) ∧
      ∀ w : InfinitePlace F, w ≠ w₀ → w ((u : (𝓞 F)ˣ) : F) < 1 := by
  sorry

/-- C6/negative-cusp-exponent. Zero must be excluded. -/
theorem exists_negative_embedding (ξ : F) (hξ : ξ ≠ 0)
    (hpos : ¬ (∀ w : InfinitePlace F, 0 < embedding_of_isReal (IsTotallyReal.isReal w) ξ)) :
    ∃ w : InfinitePlace F, embedding_of_isReal (IsTotallyReal.isReal w) ξ < 0 := by
  sorry

/-- C6/negative-trace-orbit. y is in the open positive dual cone. -/
theorem negative_trace_orbit_unbounded
    (U : Subgroup (𝓞 F)ˣ) [U.FiniteIndex]
    (hd : 1 < Fintype.card (InfinitePlace F))
    (ξ : F) (hξ : ξ ≠ 0) (hpos : ¬ (∀ w : InfinitePlace F, 0 < embedding_of_isReal (IsTotallyReal.isReal w) ξ))
    (y : InfinitePlace F → ℝ) (hy : ∀ w, 0 < y w) :
    ∀ B : ℝ, ∃ u : U,
      (∑ w : InfinitePlace F,
        embedding_of_isReal (IsTotallyReal.isReal w)
          ((((u : (𝓞 F)ˣ) : F) ^ 2) * ξ) * y w) < B := by
  sorry

variable {R : Type*} [CommRing R]

/-- C6/coefficient-unit-orbit. The multipliers are units even over nonreduced R. -/
theorem coefficient_ne_zero_on_unit_orbit
    (U : Subgroup (𝓞 F)ˣ) (a : F → R) (c : U → F → Rˣ)
    (ha : ∀ (u : U) (ξ : F),
      a ((((u : (𝓞 F)ˣ) : F) ^ 2) * ξ) = (c u ξ : R) * a ξ)
    (u : U) (ξ : F) :
    a ((((u : (𝓞 F)ˣ) : F) ^ 2) * ξ) ≠ 0 ↔ a ξ ≠ 0 := by
  sorry

/-- C6/bounded-cusp-support. This is the coefficient lemma, not geometric Koecher. -/
theorem bounded_cusp_support_is_positive
    (U : Subgroup (𝓞 F)ˣ) [U.FiniteIndex]
    (hd : 1 < Fintype.card (InfinitePlace F))
    (a : F → R) (c : U → F → Rˣ)
    (ha : ∀ (u : U) (ξ : F),
      a ((((u : (𝓞 F)ˣ) : F) ^ 2) * ξ) = (c u ξ : R) * a ξ)
    (y : InfinitePlace F → ℝ) (hy : ∀ w, 0 < y w)
    (hbound : ∃ B : ℝ, ∀ ξ : F, a ξ ≠ 0 →
      B ≤ ∑ w : InfinitePlace F,
        embedding_of_isReal (IsTotallyReal.isReal w) ξ * y w) :
    ∀ ξ : F, a ξ ≠ 0 → ξ = 0 ∨ (∀ w : InfinitePlace F, 0 < embedding_of_isReal (IsTotallyReal.isReal w) ξ) := by
  sorry

/-- C6/positive-exponents-on-charts. Boundary ray generators are nonzero. -/
theorem positive_exponent_pairs_pos
    (ξ : F) (hξ : (∀ w : InfinitePlace F, 0 < embedding_of_isReal (IsTotallyReal.isReal w) ξ))
    (v : InfinitePlace F → ℝ) (hv : ∀ w, 0 ≤ v w) (hv0 : v ≠ 0) :
    0 < ∑ w : InfinitePlace F,
      embedding_of_isReal (IsTotallyReal.isReal w) ξ * v w := by
  sorry

/-- C6/constant-term-covariance. In applications the root-of-unity phase is 1 at ξ=0. -/
theorem constant_coefficient_annihilated
    (U : Subgroup (𝓞 F)ˣ) (a : F → R) (c : U → F → Rˣ)
    (ha : ∀ (u : U) (ξ : F),
      a ((((u : (𝓞 F)ˣ) : F) ^ 2) * ξ) = (c u ξ : R) * a ξ) (u : U) :
    ((c u 0 : R) - 1) * a 0 = 0 := by
  sorry

/-- C6/constant-term-vanishing. The annihilator condition cannot be removed. -/
theorem constant_coefficient_eq_zero
    (U : Subgroup (𝓞 F)ˣ) (a : F → R) (c : U → F → Rˣ)
    (ha : ∀ (u : U) (ξ : F),
      a ((((u : (𝓞 F)ˣ) : F) ^ 2) * ξ) = (c u ξ : R) * a ξ)
    (u : U) (hregular : ∀ r : R, ((c u 0 : R) - 1) * r = 0 → r = 0) :
    a 0 = 0 := by
  sorry

/- Acceptance regressions, not additional definitions. -/

-- C6/negative-cusp-exponent: zero has no negative real embedding.
example : ¬ ∃ w : InfinitePlace ℚ,
    embedding_of_isReal (IsTotallyReal.isReal w) (0 : ℚ) < 0 := by
  sorry

-- C6/negative-trace-orbit: the degree-one unit orbit does not escape.
example (u : (𝓞 ℚ)ˣ) : (u : ℚ) ^ 2 * (-1 : ℚ) = -1 := by
  sorry

-- C6/coefficient-unit-orbit: a nonunit can kill a nonzero coefficient.
example : (2 : ZMod 4) ≠ 0 ∧ (2 : ZMod 4) * 2 = 0 := by
  sorry

-- C6/constant-term-vanishing: a nontrivial unit character need not force vanishing.
example : (3 : ZMod 4) ≠ 1 ∧ (3 : ZMod 4) * 2 = 2 ∧ (2 : ZMod 4) ≠ 0 := by
  sorry

-- C6/positive-exponents-on-charts: the zero dual vector gives pairing zero.
example (ξ : F) : (∑ w : InfinitePlace F,
    embedding_of_isReal (IsTotallyReal.isReal w) ξ * (0 : ℝ)) = 0 := by
  sorry

-- C6/bounded-cusp-support: the constant series is allowed, including nonzero constants.
example [DecidableEq F] (ξ : F) (h : (if ξ = 0 then (1 : ℤ) else 0) ≠ 0) :
    ξ = 0 ∨ (∀ w : InfinitePlace F, 0 < embedding_of_isReal (IsTotallyReal.isReal w) ξ) := by
  sorry

-- C6/bounded-cusp-support: a single positive coefficient has nonnegative pairing.
example (y : InfinitePlace F → ℝ) (hy : ∀ w, 0 < y w) :
    0 ≤ ∑ w : InfinitePlace F,
      embedding_of_isReal (IsTotallyReal.isReal w) (1 : F) * y w := by
  sorry

end TauCeti.HilbertCusp

-- Generated additive baseline statement: checked because the text-only index omits it.

namespace TauCeti.HilbertCusp.UniformizationPrototype

variable {K : Type*} [Field K] [NumberField K]
variable {S : Type*} [CommRing S]

/-- An exponent n clears the trace denominator when n * B is contained in A. -/
theorem trace_exponent_integral
    (A B : Submodule ℤ K) (n : ℕ)
    (hn : ∀ ξ : K, ξ ∈ B → n • ξ ∈ A)
    (ξ x : K) (hξ : ξ ∈ B) (hx : x ∈ Submodule.traceDual ℤ ℚ A) :
    ∃ m : ℤ, (m : ℚ) = (n : ℚ) * Algebra.trace ℚ K (ξ * x) := by
  sorry

/-- Changing x modulo the dual of B changes the integer exponent by a multiple of n. -/
theorem trace_exponents_congruent
    (B : Submodule ℤ K) (n : ℕ) (ξ x x' : K)
    (hξ : ξ ∈ B) (hx : x' - x ∈ Submodule.traceDual ℤ ℚ B)
    (m m' : ℤ)
    (hm : (m : ℚ) = (n : ℚ) * Algebra.trace ℚ K (ξ * x))
    (hm' : (m' : ℚ) = (n : ℚ) * Algebra.trace ℚ K (ξ * x')) :
    ∃ k : ℤ, m' = m + (n : ℤ) * k := by
  sorry

/-- This uses only ζ^n=1, not primitivity or cancellation in the coefficient ring. -/
theorem phase_independent_of_lift
    (B : Submodule ℤ K) (n : ℕ) (ξ x x' : K)
    (hξ : ξ ∈ B) (hx : x' - x ∈ Submodule.traceDual ℤ ℚ B)
    (m m' : ℤ)
    (hm : (m : ℚ) = (n : ℚ) * Algebra.trace ℚ K (ξ * x))
    (hm' : (m' : ℚ) = (n : ℚ) * Algebra.trace ℚ K (ξ * x'))
    (ζ : Sˣ) (hζ : ζ ^ (n : ℤ) = 1) :
    ζ ^ m' = ζ ^ m := by
  sorry

/-- The Fourier phase is multiplicative in the additive character exponent. -/
theorem phase_additive_in_character
    (n : ℕ) (ξ η x : K) (mξ mη msum : ℤ)
    (hξ : (mξ : ℚ) = (n : ℚ) * Algebra.trace ℚ K (ξ * x))
    (hη : (mη : ℚ) = (n : ℚ) * Algebra.trace ℚ K (η * x))
    (hsum : (msum : ℚ) =
      (n : ℚ) * Algebra.trace ℚ K ((ξ + η) * x))
    (ζ : Sˣ) :
    ζ ^ msum = ζ ^ mξ * ζ ^ mη := by
  sorry

/-- C6/uniformization-phase-character. Additive notation wraps the existing unit group. -/
noncomputable def tracePhase
    (A B : Submodule ℤ K) (n : ℕ)
    (hn : ∀ ξ : K, ξ ∈ B → n • ξ ∈ A)
    (ζ : Sˣ) (hζ : ζ ^ (n : ℤ) = 1)
    (x : K) (hx : x ∈ Submodule.traceDual ℤ ℚ A) :
    B →+ Additive Sˣ := by
  sorry

variable (A B : Submodule ℤ K) (n : ℕ)
variable (hn : ∀ ξ : K, ξ ∈ B → n • ξ ∈ A)
variable (ζ : Sˣ) (hζ : ζ ^ (n : ℤ) = 1)
variable (x : K) (hx : x ∈ Submodule.traceDual ℤ ℚ A)

/-- Evaluation using the integral trace witness. -/
theorem tracePhase_apply (ξ : B) (m : ℤ)
    (hm : (m : ℚ) = (n : ℚ) * Algebra.trace ℚ K ((ξ : K) * x)) :
    (tracePhase A B n hn ζ hζ x hx ξ).toMul = ζ ^ m := by
  sorry

/-- The zero exponent has phase one. -/
theorem tracePhase_zero :
    (tracePhase A B n hn ζ hζ x hx 0).toMul = 1 := by
  sorry

/-- The native AddMonoidHom laws express multiplication of phases. -/
theorem tracePhase_add (ξ η : B) :
    (tracePhase A B n hn ζ hζ x hx (ξ + η)).toMul =
      (tracePhase A B n hn ζ hζ x hx ξ).toMul *
        (tracePhase A B n hn ζ hζ x hx η).toMul := by
  sorry

/-- Quotient by B-dual, retaining admissibility of both representatives. -/
theorem tracePhase_lift (x' : K)
    (hx' : x' ∈ Submodule.traceDual ℤ ℚ A)
    (hshift : x' - x ∈ Submodule.traceDual ℤ ℚ B) :
    tracePhase A B n hn ζ hζ x' hx' = tracePhase A B n hn ζ hζ x hx := by
  sorry

/-- No primitive-root assumption is built into the construction. -/
theorem tracePhase_trivial_root (h1 : (1 : Sˣ) ^ (n : ℤ) = 1) (ξ : B) :
    (tracePhase A B n hn 1 h1 x hx ξ).toMul = 1 := by
  sorry

/-- Arbitrary coefficient maps preserve the phase character. -/
theorem tracePhase_map {S' : Type*} [CommRing S'] (f : S →+* S')
    (hfζ : (Units.map f.toMonoidHom ζ) ^ (n : ℤ) = 1) (ξ : B) :
    (tracePhase A B n hn (Units.map f.toMonoidHom ζ) hfζ x hx ξ).toMul =
      Units.map f.toMonoidHom ((tracePhase A B n hn ζ hζ x hx ξ).toMul) := by
  sorry

/- Five discriminating construction tests, named by comments because Lean examples
   are anonymous. Their objects are native Z-submodules and unit groups. -/

-- UniformizationPrototype.phase_third_denominator
example (ζ : Sˣ) (hζ : ζ ^ (3 : ℤ) = 1)
    (hn : ∀ ξ : ℚ, ξ ∈ Submodule.span ℤ {(1 / 3 : ℚ)} →
      (3 : ℕ) • ξ ∈ Submodule.span ℤ {(1 : ℚ)})
    (hx : (1 : ℚ) ∈ Submodule.traceDual ℤ ℚ (Submodule.span ℤ {(1 : ℚ)}))
    (hξ : (1 / 3 : ℚ) ∈ Submodule.span ℤ {(1 / 3 : ℚ)}) :
    (tracePhase (Submodule.span ℤ {(1 : ℚ)})
      (Submodule.span ℤ {(1 / 3 : ℚ)}) 3 hn ζ hζ 1 hx ⟨1 / 3, hξ⟩).toMul = ζ := by
  sorry

-- UniformizationPrototype.phase_zero_character
example : (tracePhase A B n hn ζ hζ x hx 0).toMul = 1 := by
  sorry

-- UniformizationPrototype.phase_dual_shift
example (ζ : Sˣ) (hζ : ζ ^ (3 : ℤ) = 1)
    (hn : ∀ ξ : ℚ, ξ ∈ Submodule.span ℤ {(1 / 3 : ℚ)} →
      (3 : ℕ) • ξ ∈ Submodule.span ℤ {(1 : ℚ)})
    (hx : (1 : ℚ) ∈ Submodule.traceDual ℤ ℚ (Submodule.span ℤ {(1 : ℚ)}))
    (hx' : (4 : ℚ) ∈ Submodule.traceDual ℤ ℚ (Submodule.span ℤ {(1 : ℚ)})) :
    tracePhase (Submodule.span ℤ {(1 : ℚ)}) (Submodule.span ℤ {(1 / 3 : ℚ)})
      3 hn ζ hζ 1 hx =
    tracePhase (Submodule.span ℤ {(1 : ℚ)}) (Submodule.span ℤ {(1 / 3 : ℚ)})
      3 hn ζ hζ 4 hx' := by
  sorry

-- UniformizationPrototype.phase_wrong_dual
example (ζ : (ZMod 5)ˣ) (hζ : ζ ^ (4 : ℤ) = 1) (hζval : (ζ : ZMod 5) = 2)
    (hn : ∀ ξ : ℚ, ξ ∈ Submodule.span ℤ {(1 / 4 : ℚ)} →
      (4 : ℕ) • ξ ∈ Submodule.span ℤ {(1 : ℚ)})
    (hx : (0 : ℚ) ∈ Submodule.traceDual ℤ ℚ (Submodule.span ℤ {(1 : ℚ)}))
    (hx' : (1 : ℚ) ∈ Submodule.traceDual ℤ ℚ (Submodule.span ℤ {(1 : ℚ)}))
    (hξ : (1 / 4 : ℚ) ∈ Submodule.span ℤ {(1 / 4 : ℚ)}) :
    (tracePhase (Submodule.span ℤ {(1 : ℚ)}) (Submodule.span ℤ {(1 / 4 : ℚ)})
      4 hn ζ hζ 0 hx ⟨1 / 4, hξ⟩).toMul ≠
    (tracePhase (Submodule.span ℤ {(1 : ℚ)}) (Submodule.span ℤ {(1 / 4 : ℚ)})
      4 hn ζ hζ 1 hx' ⟨1 / 4, hξ⟩).toMul := by
  sorry

-- UniformizationPrototype.phase_nonprimitive
example (ζ : (ZMod 8)ˣ) (hζ : ζ ^ (4 : ℤ) = 1) (hζval : (ζ : ZMod 8) = 3)
    (A B : Submodule ℤ K)
    (hn : ∀ ξ : K, ξ ∈ B → (4 : ℕ) • ξ ∈ A)
    (x : K) (hx : x ∈ Submodule.traceDual ℤ ℚ A)
    (ξ : B) (m : ℤ) (hm : (m : ℚ) = 4 * Algebra.trace ℚ K ((ξ : K) * x)) :
    (tracePhase A B 4 hn ζ hζ x hx ξ).toMul = ζ ^ m ∧ ζ ^ (2 : ℤ) = 1 := by
  sorry

end TauCeti.HilbertCusp.UniformizationPrototype

/-
Geometric signature omission ledger (packet gap: Geometric supplier interfaces and
suggested signatures). Each name has its full mathematical statement in the roadmap
and packet. The absent types are supplied by the listed stages, not by Prop fields.
ShimuraCompactifications:C6/meromorphic-cusp-support-bound
  meromorphic_cusp_support_bound — ShimuraCompactifications:C0/relative-regular-coordinates, ShimuraCompactifications:C0/relative-boundary-coordinates, ShimuraCompactifications:C4, AdicSpacesPartII:F0, HilbertModularVarietiesAndShimuraCurves:H1, HilbertModularVarietiesAndShimuraCurves:H3
ShimuraCompactifications:C6/hilbert-cusp-positive-support
  hilbert_cusp_support_positive — HilbertModularVarietiesAndShimuraCurves:H1, HilbertModularVarietiesAndShimuraCurves:H3, ShimuraCompactifications:C0, ShimuraCompactifications:C4, ShimuraCompactifications:C5
ShimuraCompactifications:C6/arithmetic-koecher
  arithmetic_koecher — AdicSpacesPartII:F0, ShimuraCompactifications:C0/relative-boundary-coordinates, ShimuraCompactifications:C4, ShimuraCompactifications:C5, HilbertModularVarietiesAndShimuraCurves:H3, SchemeAndStackFoundations:SF.1, SchemeAndStackFoundations:SF.0
ShimuraCompactifications:C6/hilbert-boundary-constant
  hilbert_cuspidal_iff_constant_zero — ShimuraCompactifications:C0/relative-boundary-coordinates, AdicSpacesPartII:F0, SchemeAndStackFoundations:SF.0, SchemeAndStackFoundations:SF.1
ShimuraCompactifications:C6/cusp-lattice-comparison
  hilbert_cusp_lattice_compare — HilbertModularVarietiesAndShimuraCurves:H1, HilbertModularVarietiesAndShimuraCurves:H3
ShimuraCompactifications:C6/admissible-fan-specialization
  hilbert_admissible_fan_compare — ShimuraCompactifications:C0, HilbertModularVarietiesAndShimuraCurves:H3
ShimuraCompactifications:C6/uniformized-level-chart
  hilbert_uniformized_level_chart — ShimuraCompactifications:C4, HilbertModularVarietiesAndShimuraCurves:H1, HilbertModularVarietiesAndShimuraCurves:H3
ShimuraCompactifications:C6/hilbert-toroidal-model
  hilbert_toroidal_model_exists — ShimuraCompactifications:C5, AdicSpacesPartII:F0, SchemeAndStackFoundations:SF.1, NeronModelsAndSemistableAbelianVarieties:R11.3
ShimuraCompactifications:C6/toroidal-polarization-quotient
  hilbert_toroidal_polarization_quotient — HilbertModularVarietiesAndShimuraCurves:H3, SchemeAndStackFoundations:SF.1
ShimuraCompactifications:C6/hilbert-boundary-formal-comparison
  hilbert_boundary_formal_compare — ShimuraCompactifications:C0, HilbertModularVarietiesAndShimuraCurves:H3, AdicSpacesPartII:F0
ShimuraCompactifications:C6/hilbert-boundary-etale-charts
  hilbert_boundary_etale_toric — ShimuraCompactifications:C0, AdicSpacesPartII:F0
ShimuraCompactifications:C6/hilbert-regular-refinement
  hilbert_regular_refinement_smooth — ShimuraCompactifications:C0, ShimuraCompactifications:C3, HilbertModularVarietiesAndShimuraCurves:H1
ShimuraCompactifications:C6/hilbert-semiabelian-extension
  hilbert_semiabelian_extension — ShimuraCompactifications:C4, SchemeAndStackFoundations:SF.1, NeronModelsAndSemistableAbelianVarieties:R11.3, NeronModelsAndSemistableAbelianVarieties:R11.3/rigid-uniformisation
ShimuraCompactifications:C6/hilbert-conormal-comparison
  hilbert_conormal_compare — ShimuraCompactifications:C4, HilbertModularVarietiesAndShimuraCurves:H1, HilbertModularVarietiesAndShimuraCurves:H2, HilbertModularVarietiesAndShimuraCurves:H3
ShimuraCompactifications:C6/hilbert-toroidal-proper
  hilbert_toroidal_proper — ShimuraCompactifications:C4, ShimuraCompactifications:C5, NeronModelsAndSemistableAbelianVarieties:R11.3, NeronModelsAndSemistableAbelianVarieties:R11.3/finite-separable-semistable-extension
ShimuraCompactifications:C6/hilbert-hodge-semiampleness
  hilbert_hodge_semiample — ShimuraCompactifications:C5
ShimuraCompactifications:C6/hilbert-minimal-contraction
  hilbert_minimal_contraction — ShimuraCompactifications:C5
ShimuraCompactifications:C6/hilbert-minimal-finite-generation
  hilbert_minimal_sectionRing_finite — ShimuraCompactifications:C5
ShimuraCompactifications:C6/hilbert-minimal-normal-projective
  hilbert_minimal_normal_projective — ShimuraCompactifications:C5, SchemeAndStackFoundations:SF.0
ShimuraCompactifications:C6/minimal-polarization-quotient
  hilbert_minimal_polarization_quotient — ShimuraCompactifications:C5, HilbertModularVarietiesAndShimuraCurves:H3, SchemeAndStackFoundations:SF.1
ShimuraCompactifications:C6/hilbert-minimal-cusps
  hilbert_minimal_cusps — ShimuraCompactifications:C5, HilbertModularVarietiesAndShimuraCurves:H3, AdicSpacesPartII:F0
ShimuraCompactifications:C6/hilbert-minimal-boundary-fibres
  hilbert_minimal_boundary_fibres — ShimuraCompactifications:C5
ShimuraCompactifications:C6/hilbert-minimal-formal-comparison
  hilbert_minimal_formal_compare — AdicSpacesPartII:F0, HilbertModularVarietiesAndShimuraCurves:H3, AdicSpacesPartII:F0/completion-of-morphism, AdicSpacesPartII:F0/theorem-on-formal-functions
ShimuraCompactifications:C6/hilbert-minimal-weight-extension
  hilbert_minimal_weight_extension — ShimuraCompactifications:C5, HilbertModularVarietiesAndShimuraCurves:H3, SchemeAndStackFoundations:SF.0
ShimuraCompactifications:C6/hilbert-q-expansion-comparison
  hilbert_qExpansion_compare — HilbertModularVarietiesAndShimuraCurves:H3, ShimuraCompactifications:C0, AdicSpacesPartII:F0
ShimuraCompactifications:C6/hilbert-q-expansion-module-injective
  hilbert_qExpansion_module_injective — HilbertModularVarietiesAndShimuraCurves:H1, SchemeAndStackFoundations:SF.0, AdicSpacesPartII:F0
ShimuraCompactifications:C6/hilbert-q-expansion-injective
  hilbert_qExpansion_injective — ShimuraCompactifications:C6/hilbert-q-expansion-module-injective
ShimuraCompactifications:C6/hilbert-q-expansion-coefficient-descent
  hilbert_qExpansion_coefficient_descent — SchemeAndStackFoundations:SF.0
ShimuraCompactifications:C6/hilbert-boundary-ideal-pushforward
  hilbert_boundary_ideal_pushforward — ShimuraCompactifications:C5, AdicSpacesPartII:F0, SchemeAndStackFoundations:SF.0, AdicSpacesPartII:F0/formal-direct-image-comparison
ShimuraCompactifications:C6/hilbert-ordinary-model-comparison
  hilbert_ordinary_integral_model_compare — HilbertModularVarietiesAndShimuraCurves:H2, HilbertModularVarietiesAndShimuraCurves:H1, AdicSpacesPartII:F0
ShimuraCompactifications:C6/hilbert-hasse-boundary-comparison
  hilbert_hasse_boundary_compare — HilbertModularVarietiesAndShimuraCurves:H2, FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2, HodgeTateAndCanonicalSubgroups:T0, HilbertModularVarietiesAndShimuraCurves:H3
ShimuraCompactifications:C6/hilbert-boundary-ordinary
  hilbert_boundary_ordinary — HodgeTateAndCanonicalSubgroups:T0, HilbertModularVarietiesAndShimuraCurves:H2, SchemeAndStackFoundations:SF.1
ShimuraCompactifications:C6/hilbert-near-ordinary-model
  hilbert_nearOrdinary_model_compare — HilbertModularVarietiesAndShimuraCurves:H2, AdicSpacesPartII:F0, AdicSpacesPartII:R2, AdicSpacesPartII:R3
ShimuraCompactifications:C6/hilbert-ordinary-polarization-quotient
  hilbert_ordinary_polarization_quotient — HilbertModularVarietiesAndShimuraCurves:H3, HilbertModularVarietiesAndShimuraCurves:H4, SchemeAndStackFoundations:SF.1
ShimuraCompactifications:C6/hilbert-p-level-boundary-comparison
  hilbert_pLevel_boundary_compare — HilbertModularVarietiesAndShimuraCurves:H2, HilbertModularVarietiesAndShimuraCurves:H3, HilbertModularVarietiesAndShimuraCurves:H4, ShimuraCompactifications:C4, ShimuraCompactifications:C5
ShimuraCompactifications:C6/hilbert-integral-differential-interface
  hilbert_integral_differential_compare — HilbertModularVarietiesAndShimuraCurves:H2, HilbertModularVarietiesAndShimuraCurves:H4, AdicSpacesPartII:F0, AdicSpacesPartII:R3
ShimuraCompactifications:C6/modular-toroidal-minimal-comparison
  modular_toroidal_minimal_compare — HilbertModularVarietiesAndShimuraCurves:H1, HilbertModularVarietiesAndShimuraCurves:H4, ShimuraCompactifications:C4, ShimuraCompactifications:C5, ModularCurvesPartII:R13.4a, SchemeAndStackFoundations:SF.0
ShimuraCompactifications:C6/modular-formal-cusp-comparison
  modular_formal_cusp_compare — ShimuraCompactifications:C4, ModularCurvesPartII:R13.4a, ModularCurvesPartII:R13.4b, AdicSpacesPartII:F0, AdicSpacesPartII:R2, AdicSpacesPartII:R3
ShimuraCompactifications:C6/prime-diamond-pr81-comparison
  modular_primeDiamond_PR81_compare — ModularCurvesPartII:R13.4a, tauceti:TauCetiRoadmap/ModularCurves#layer-10-compactified-coarse-curves-over-ℤ1n-cusps-and-the-shimura-covering
-/
