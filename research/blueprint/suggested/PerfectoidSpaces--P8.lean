/-
Suggested Lean forms for BP-PerfectoidSpaces--P8 (PerfectoidSpaces P8 and P9). This file is not
the roadmap and is not exhaustive: the roadmap document
`research/blueprint/readmes/PerfectoidSpaces--P8.md` is definitive. See the module documentation
after the imports.
-/
import Mathlib.Algebra.Algebra.Pi
import Mathlib.Algebra.Module.Projective
import Mathlib.CategoryTheory.Filtered.Basic
import Mathlib.CategoryTheory.Limits.HasLimits
import Mathlib.Data.Nat.Choose.Lucas
import Mathlib.FieldTheory.Normal.Defs
import Mathlib.FieldTheory.PurelyInseparable.Basic
import Mathlib.GroupTheory.Complement
import Mathlib.NumberTheory.Padics.PadicNumbers
import Mathlib.RepresentationTheory.Invariants
import Mathlib.RingTheory.AdicCompletion.Basic
import Mathlib.RingTheory.Etale.Basic
import Mathlib.RingTheory.Invariant.Basic
import Mathlib.RingTheory.IsGaloisGroup.Defs
import Mathlib.RingTheory.Spectrum.Prime.FreeLocus
import Mathlib.RingTheory.TensorProduct.Maps
import Mathlib.RingTheory.Valuation.ValuationSubring
import Mathlib.Topology.Algebra.Category.ProfiniteGrp.Basic
import Mathlib.Topology.Separation.Hausdorff
import TauCeti.RingTheory.Huber.Bounded
import TauCeti.RingTheory.Huber.Pair
import TauCeti.AlgebraicGeometry.AdicSpace.Spa.Comap

/-!
# Suggested Lean forms for PerfectoidSpaces P8 and P9 (BP-PerfectoidSpaces--P8)

This file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/PerfectoidSpaces--P8.md` is definitive. The statements below
suggest Lean forms so that contributors and reviewers converge on names and signatures. They
claim no implementation: every proof and every non-`Prop` definition body is `sorry`, and every
node keeps `implementationStatus = "unchecked"`.

Pinned commits: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. The file elaborates with `lake env lean` against a
project at exactly these commits; its only warnings are `declaration uses 'sorry'`.

## Library declarations imported and reused

Mathlib, used in statements:
* `FixedPoints.subring` and `FixedPoints.subalgebra` (the carrier of `A^G`),
  `Algebra.IsInvariant`, `IsGaloisGroup`, `FaithfulSMul`, `MulSemiringAction.toAlgHom`,
  `MulSemiringAction.toRingHom`;
* `Algebra.TensorProduct.lift`, `Pi.constAlgHom`, `AlgHom.pi`, `LinearMap.rTensor`,
  `LinearMap.baseChange`, `LinearMap.liftBaseChange`, `Algebra.Etale`, `Module.Projective`,
  `Module.Finite`, `Module.rankAtStalk`, `Representation.invariants`;
* `Rep.invariantsFunctor`, `CategoryTheory.Limits.colimit.post`, `CategoryTheory.IsFiltered`,
  `ProfiniteGrp`, `OpenNormalSubgroup`;
* `MulAction.stabilizer`, `Subgroup.IsComplement`, `T2Space`, `T2Quotient` with
  `T2Quotient.mk`, `Topology.IsOpenEmbedding`, `Topology.IsQuotientMap`,
  `IsTopologicalAddGroup.rightUniformSpace`;
* `ValuationSubring.comap` with the pointwise action of `L ≃ₐ[K] L`, `Normal`,
  `IsPurelyInseparable`, `Algebra.IsAlgebraic`;
* `CharP`, `Nat.choose`, `IsAdicComplete`, `IsPowMul`, `Padic` (`ℚ_[p]`).

Mathlib, cited and not restated: `Algebra.IsInvariant.isIntegral` (integrality over `A^G`),
`Representation.averageMap` with `Representation.isProj_averageMap` (the untwisted idempotent
`e_G`), `Module.rankAtStalk_baseChange`, the Lucas congruence
`Choose.choose_pow_mul_pow_mul_modEq_choose_nat`, `Sylow` (the reduction in the proof of the
invariants theorem), and `continuousCohomology` with `ContinuousCohomology.zeroIso` (the target
of the Čech comparison, whose source needs the pro-étale site, so it is not imported).

Tau Ceti:
* `TauCeti.Huber.Pair` with `Pair.Hom`, `Pair.Hom.id`, `Pair.Hom.comp`;
  `TauCeti.Huber.IsTateRing`, `TauCeti.Huber.IsPseudoUniformizer`,
  `TauCeti.Huber.PairOfDefinition`, `TauCeti.Huber.powerBoundedSubring`,
  `TauCeti.Huber.IsPowerBounded`, `TauCeti.Huber.IsBounded`;
* `TauCeti.ValuationSpectrum` (`Spv`), `ValuationSpectrum.comap`, `ValuationSpectrum.cont`,
  `ValuationSpectrum.spa`, `ValuationSpectrum.spaComap`, `ValuationSpectrum.rationalSubset`;
  the preimage identity `ValuationSpectrum.spaComap_preimage_rationalSubset` is used as it
  stands.
* `TauCeti.Huber.PairOfDefinition.completionLocObj` is where the identities
  `A^G⟨T/s⟩ ≅ (A⟨T/s⟩)^G` are to be phrased. Its module
  `TauCeti.RingTheory.Huber.LocalizationTopology.CompleteSeparated.Basic` has no build in the
  elaboration environment, so it is not imported and those identities stay comments.

## What is not stated

Adic spaces, perfectoid spaces, rigid spaces, Huber's category `V`, v-sheaves, diamonds,
pro-étale sites, sheaves on `Spa`, affinoid algebras and completed tensor products are in
neither library. Every packet item that needs one of them is a comment of the form
`-- <name>: not stated here; needs <missing carrier> (supplier: <stage>)`, so that every packet
name still appears. The supplier is the packet's request for that carrier when there is one;
otherwise it is the earlier stage that the node lists as a prerequisite for it. No stand-in is
introduced for any of these geometric objects. Where a node has a ring-level or topological
core that the libraries can state, that core is stated under the node's name with a suffix, and
the comment says so.

The one stand-in is `IsPerfectoidTateRing`, a `structure` with real fields standing for
PerfectoidSpaces P1's planned definition of a perfectoid Tate ring.

## Pinned conventions

* Groups act on rings on the left, by `MulSemiringAction G A`: `γ • f` is `γ^* f`, so
  `(γ * δ) • f = γ • (δ • f)`, that is `(γδ)^* = γ^* δ^*`.
* Groups act on spaces on the right. On `Spv A` the right action is
  `v · g = ValuationSpectrum.comap (MulSemiringAction.toRingHom G A g) v`, that is `v ∘ g`, and
  `comap_comp` gives `(v · g) · h = v · (g * h)`. The G-clean API is stated for a left action of
  an arbitrary group `Γ`; a right action of `G` is used through `Γ = Gᵐᵒᵖ`.
* 1-cocycles satisfy `c (γ * δ) = c γ * γ • c δ` (`TorsorDescent.IsTwistCocycle`); the twisted
  invariants are `{f | ∀ γ, γ • f = (c γ)⁻¹ * f}`; `f ↦ c γ * γ • f` is an action by the cocycle
  law, and `e = |G|⁻¹ ∑ γ, c γ * γ •` is its averaging idempotent.
* A topological ring is complete when it is Hausdorff and complete for the canonical uniformity
  `IsTopologicalAddGroup.rightUniformSpace` (Huber's "complete").
-/

noncomputable section

namespace TauCeti.Perfectoid

open TauCeti.Huber TauCeti.ValuationSpectrum Topology Pointwise CategoryTheory
  CategoryTheory.Limits

/-! ## Stand-in: perfectoid Tate rings (PerfectoidSpaces P1) -/

/-- **Stand-in for PerfectoidSpaces P1's perfectoid Tate ring** (ECD Definition 3.1, in the form
the sources of P8 use), local to this file until P1 lands. A topological ring `A` is a
perfectoid Tate ring for the prime `p` if it is complete and Hausdorff, Tate, uniform (`A°`
bounded), has a pseudouniformizer `ϖ ∈ A°` with `ϖ ^ p ∣ p` in `A°`, and Frobenius is
surjective on `A° / p`. Completeness is for the canonical uniformity of the additive group. -/
structure IsPerfectoidTateRing (p : ℕ) (A : Type*) [CommRing A] [TopologicalSpace A]
    [IsTopologicalRing A] : Prop where
  /-- `A` is complete for its canonical uniformity. -/
  completeSpace : @CompleteSpace A (IsTopologicalAddGroup.rightUniformSpace A)
  /-- `A` is Hausdorff. -/
  t2Space : T2Space A
  /-- `A` is a Tate ring. -/
  isTateRing : IsTateRing A
  /-- `A` is uniform: the power-bounded subring `A°` is bounded. -/
  isBounded_powerBoundedSubring :
    haveI := isTateRing
    IsBounded (powerBoundedSubring A : Set A)
  /-- There is a pseudouniformizer `ϖ ∈ A°` with `ϖ ^ p ∣ p` in `A°`. -/
  exists_isPseudoUniformizer_pow_dvd :
    haveI := isTateRing
    ∃ ϖ : powerBoundedSubring A, IsPseudoUniformizer (ϖ : A) ∧ ϖ ^ p ∣ (p : powerBoundedSubring A)
  /-- Frobenius `x ↦ x ^ p` is surjective on `A° / p`. -/
  surjective_frobenius :
    haveI := isTateRing
    Function.Surjective fun x : powerBoundedSubring A ⧸ Ideal.span {(p : powerBoundedSubring A)} ↦
      x ^ p

/-! ## PerfectoidSpaces:P8/invariant-huber-pair (construction) -/

section InvariantPair

variable {A : Type*} [CommRing A] [TopologicalSpace A] [IsTopologicalRing A]
  (G : Type*) [Group G] [MulSemiringAction G A]

/-- PerfectoidSpaces:P8/invariant-huber-pair (i): for a finite group acting by continuous ring
automorphisms on a Tate ring, `A^G` with the subspace topology is a Tate ring, with the invariant
pseudouniformizer `Huber.Pair.normPseudoUniformizer` and the ring of definition of
`Huber.Pair.exists_stable_ringOfDefinition`. -/
instance instIsTateRingFixedPointsSubring [IsTateRing A] [Finite G] [ContinuousConstSMul G A] :
    IsTateRing (FixedPoints.subring A G) := sorry

/-- PerfectoidSpaces:P8/invariant-huber-pair, constructor: the norm `N(ϖ) = ∏_{g ∈ G} g • ϖ`, an
element of `A^G`. Its value is `Huber.Pair.coe_normPseudoUniformizer`. -/
def Huber.Pair.normPseudoUniformizer [Fintype G] (ϖ : A) : FixedPoints.subring A G := sorry

/-- The value of the norm. -/
theorem Huber.Pair.coe_normPseudoUniformizer [Fintype G] (ϖ : A) :
    (Huber.Pair.normPseudoUniformizer G ϖ : A) = ∏ g : G, g • ϖ := sorry

/-- PerfectoidSpaces:P8/invariant-huber-pair, constructor: the norm of a pseudouniformizer is a
`G`-invariant pseudouniformizer of `A` and of `A^G`. -/
theorem Huber.Pair.isPseudoUniformizer_normPseudoUniformizer [Fintype G]
    [ContinuousConstSMul G A] {ϖ : A} (hϖ : IsPseudoUniformizer ϖ) :
    IsPseudoUniformizer (Huber.Pair.normPseudoUniformizer G ϖ : A) ∧
      IsPseudoUniformizer (Huber.Pair.normPseudoUniformizer G ϖ) := sorry

/-- PerfectoidSpaces:P8/invariant-huber-pair (iv): `A` is integral over `A^G`, and `A^G` is
invariant in Mathlib's sense. For the fixed subring this is `Algebra.IsInvariant.isIntegral`
with the one-line instance `Algebra.IsInvariant (FixedPoints.subring A G) A G`, which Mathlib
lacks. -/
theorem Huber.Pair.isIntegral_invariants [Finite G] :
    Algebra.IsIntegral (FixedPoints.subring A G) A ∧
      Algebra.IsInvariant (FixedPoints.subring A G) A G := sorry

/-- PerfectoidSpaces:P8/invariant-huber-pair (i): `A^G` is closed in a Hausdorff `A`. -/
theorem Huber.Pair.isClosed_invariants [T2Space A] [ContinuousConstSMul G A] :
    IsClosed (FixedPoints.subring A G : Set A) := sorry

/-- PerfectoidSpaces:P8/invariant-huber-pair (i): `A^G` is complete when `A` is complete and
Hausdorff; the consequence of `Huber.Pair.isClosed_invariants` that the construction uses. -/
theorem Huber.Pair.completeSpace_invariants [T2Space A] [ContinuousConstSMul G A]
    (hA : @CompleteSpace A (IsTopologicalAddGroup.rightUniformSpace A)) :
    @CompleteSpace (FixedPoints.subring A G)
      (IsTopologicalAddGroup.rightUniformSpace (FixedPoints.subring A G)) := sorry

variable [IsTateRing A] [Finite G] [ContinuousConstSMul G A]

/-- PerfectoidSpaces:P8/invariant-huber-pair, data: the invariant Huber pair `(A^G, A^{+G})`,
with `A^{+G} = A⁺ ∩ A^G` (`Huber.Pair.invariants_toSubring`), for a finite group acting by
continuous ring automorphisms preserving `A⁺`. There is no hypothesis on `|G|`. -/
def Huber.Pair.invariants (P : TauCeti.Huber.Pair A)
    (hP : ∀ g : G, ∀ a ∈ P.plus, g • a ∈ P.plus) :
    TauCeti.Huber.Pair (FixedPoints.subring A G) := sorry

/-- PerfectoidSpaces:P8/invariant-huber-pair, compatibility: the pair lives on Mathlib's
`FixedPoints.subring A G`, and its ring of integral elements is `A⁺ ∩ A^G`. -/
theorem Huber.Pair.invariants_toSubring (P : TauCeti.Huber.Pair A)
    (hP : ∀ g : G, ∀ a ∈ P.plus, g • a ∈ P.plus) :
    (Huber.Pair.invariants G P hP).plus.map (FixedPoints.subring A G).subtype =
      P.plus ⊓ FixedPoints.subring A G := sorry

/-- `A^{+G} ⊆ A⁺`: the form of `Huber.Pair.invariants_toSubring` that `spaComap` takes. -/
theorem Huber.Pair.coe_mem_plus_of_mem_invariants (P : TauCeti.Huber.Pair A)
    (hP : ∀ g : G, ∀ a ∈ P.plus, g • a ∈ P.plus) :
    ∀ a ∈ (Huber.Pair.invariants G P hP).plus,
      (FixedPoints.subring A G).subtype a ∈ P.plus := sorry

/-- PerfectoidSpaces:P8/invariant-huber-pair, constructor: every ring of definition lies in a
`G`-stable one `A₀` (the subring generated by its translates), and `A₀ ∩ A^G` is a ring of
definition of `A^G`. -/
theorem Huber.Pair.exists_stable_ringOfDefinition (P₁ : PairOfDefinition A) :
    ∃ P₀ : PairOfDefinition A, P₁.ringOfDefinition ≤ P₀.ringOfDefinition ∧
      (∀ g : G, ∀ a ∈ P₀.ringOfDefinition, g • a ∈ P₀.ringOfDefinition) ∧
      ∃ Q : PairOfDefinition (FixedPoints.subring A G),
        Q.ringOfDefinition = P₀.ringOfDefinition.comap (FixedPoints.subring A G).subtype := sorry

/-- PerfectoidSpaces:P8/invariant-huber-pair (ii), characterisation: `(A^G)° = (A°)^G`. -/
theorem Huber.Pair.powerBounded_invariants :
    powerBoundedSubring (FixedPoints.subring A G) =
      (powerBoundedSubring A).comap (FixedPoints.subring A G).subtype := sorry

/-- PerfectoidSpaces:P8/invariant-huber-pair (v), characterisation: `A⁺` is the integral closure
of `A^{+G}` in `A` (Hansen, Theorem 3.1, Step 3). -/
theorem Huber.Pair.plus_eq_integralClosure_invariants (P : TauCeti.Huber.Pair A)
    (hP : ∀ g : G, ∀ a ∈ P.plus, g • a ∈ P.plus) :
    (integralClosure ((Huber.Pair.invariants G P hP).plus.map (FixedPoints.subring A G).subtype)
      A).toSubring = P.plus := sorry

/-- PerfectoidSpaces:P8/invariant-huber-pair, relation: for `H ≤ G`, `A^G ⊆ A^H` and
`A^{+G} ⊆ A^{+H}`. -/
theorem Huber.Pair.invariants_mono (H : Subgroup G) [ContinuousConstSMul H A]
    (P : TauCeti.Huber.Pair A) (hP : ∀ g : G, ∀ a ∈ P.plus, g • a ∈ P.plus) :
    FixedPoints.subring A G ≤ FixedPoints.subring A H ∧
      (Huber.Pair.invariants G P hP).plus.map (FixedPoints.subring A G).subtype ≤
        (Huber.Pair.invariants H P fun h ↦ hP h).plus.map (FixedPoints.subring A H).subtype :=
  sorry

section Functoriality

variable {B : Type*} [CommRing B] [TopologicalSpace B] [IsTopologicalRing B] [IsTateRing B]
  [MulSemiringAction G B] [ContinuousConstSMul G B]
  {C : Type*} [CommRing C] [TopologicalSpace C] [IsTopologicalRing C] [IsTateRing C]
  [MulSemiringAction G C] [ContinuousConstSMul G C]

/-- PerfectoidSpaces:P8/invariant-huber-pair, functoriality: a `G`-equivariant continuous map of
pairs induces a map of invariant pairs, the restriction of `f`
(`Huber.Pair.invariants_map_apply`). -/
def Huber.Pair.invariants_map {P : TauCeti.Huber.Pair A} {Q : TauCeti.Huber.Pair B}
    (hP : ∀ g : G, ∀ a ∈ P.plus, g • a ∈ P.plus) (hQ : ∀ g : G, ∀ b ∈ Q.plus, g • b ∈ Q.plus)
    (f : P.Hom Q) (hf : ∀ (g : G) (a : A), f.toRingHom (g • a) = g • f.toRingHom a) :
    (Huber.Pair.invariants G P hP).Hom (Huber.Pair.invariants G Q hQ) := sorry

/-- The induced map is the restriction of `f`. -/
theorem Huber.Pair.invariants_map_apply {P : TauCeti.Huber.Pair A} {Q : TauCeti.Huber.Pair B}
    (hP : ∀ g : G, ∀ a ∈ P.plus, g • a ∈ P.plus) (hQ : ∀ g : G, ∀ b ∈ Q.plus, g • b ∈ Q.plus)
    (f : P.Hom Q) (hf : ∀ (g : G) (a : A), f.toRingHom (g • a) = g • f.toRingHom a)
    (x : FixedPoints.subring A G) :
    ((Huber.Pair.invariants_map G hP hQ f hf).toRingHom x : B) = f.toRingHom x := sorry

/-- `map_id` for `Huber.Pair.invariants_map`. -/
theorem Huber.Pair.invariants_map_id {P : TauCeti.Huber.Pair A}
    (hP : ∀ g : G, ∀ a ∈ P.plus, g • a ∈ P.plus)
    (hid : ∀ (g : G) (a : A),
      (TauCeti.Huber.Pair.Hom.id P).toRingHom (g • a) =
        g • (TauCeti.Huber.Pair.Hom.id P).toRingHom a) :
    Huber.Pair.invariants_map G hP hP (TauCeti.Huber.Pair.Hom.id P) hid =
      TauCeti.Huber.Pair.Hom.id _ := sorry

/-- `map_comp` for `Huber.Pair.invariants_map`. -/
theorem Huber.Pair.invariants_map_comp {P : TauCeti.Huber.Pair A} {Q : TauCeti.Huber.Pair B}
    {R : TauCeti.Huber.Pair C} (hP : ∀ g : G, ∀ a ∈ P.plus, g • a ∈ P.plus)
    (hQ : ∀ g : G, ∀ b ∈ Q.plus, g • b ∈ Q.plus) (hR : ∀ g : G, ∀ c ∈ R.plus, g • c ∈ R.plus)
    (f : P.Hom Q) (hf : ∀ (g : G) (a : A), f.toRingHom (g • a) = g • f.toRingHom a)
    (k : Q.Hom R) (hk : ∀ (g : G) (b : B), k.toRingHom (g • b) = g • k.toRingHom b)
    (hkf : ∀ (g : G) (a : A), (k.comp f).toRingHom (g • a) = g • (k.comp f).toRingHom a) :
    Huber.Pair.invariants_map G hP hR (k.comp f) hkf =
      (Huber.Pair.invariants_map G hQ hR k hk).comp (Huber.Pair.invariants_map G hP hQ f hf) :=
  sorry

end Functoriality

-- test invariants_trivialGroup (degenerate)
example [Subsingleton G] (P : TauCeti.Huber.Pair A)
    (hP : ∀ g : G, ∀ a ∈ P.plus, g • a ∈ P.plus) :
    FixedPoints.subring A G = ⊤ ∧
      (Huber.Pair.invariants G P hP).plus.map (FixedPoints.subring A G).subtype = P.plus :=
  sorry

-- test invariants_toSubring_eq_fixedPoints (compatibility)
example (P : TauCeti.Huber.Pair A) (hP : ∀ g : G, ∀ a ∈ P.plus, g • a ∈ P.plus) :
    Algebra.IsInvariant (FixedPoints.subring A G) A G ∧
      (Huber.Pair.invariants G P hP).plus.map (FixedPoints.subring A G).subtype =
        P.plus ⊓ FixedPoints.subring A G := sorry

end InvariantPair

/- `K × K` with `K⁺ × K⁺` and a group of order two acting by swapping the factors: `A^G` is the
diagonal copy of `K`, `A^{+G}` the diagonal copy of `K⁺`, and the norm of `(ϖ, ϖ)` is
`(ϖ ^ 2, ϖ ^ 2)`. -/
-- test invariants_swap_prod (computation)
example {K : Type*} [CommRing K] [TopologicalSpace K] [IsTopologicalRing K] [IsTateRing (K × K)]
    {G : Type*} [Group G] [Fintype G] [MulSemiringAction G (K × K)]
    [ContinuousConstSMul G (K × K)] (σ : G) (hσ : ∀ x : K × K, σ • x = x.swap)
    (hG : ∀ g : G, g = 1 ∨ g = σ) (hσ1 : σ ≠ 1) (Kplus : Subring K)
    (P : TauCeti.Huber.Pair (K × K)) (hPplus : P.plus = Kplus.prod Kplus)
    (hP : ∀ g : G, ∀ a ∈ P.plus, g • a ∈ P.plus) (ϖ : K) :
    (∀ x : K × K, x ∈ FixedPoints.subring (K × K) G ↔ x.1 = x.2) ∧
      (∀ x : K × K,
        x ∈ (Huber.Pair.invariants G P hP).plus.map (FixedPoints.subring (K × K) G).subtype ↔
          x.1 = x.2 ∧ x.1 ∈ Kplus) ∧
      (Huber.Pair.normPseudoUniformizer G ((ϖ, ϖ) : K × K) : K × K) = (ϖ ^ 2, ϖ ^ 2) := sorry

/- For the trivial action of a group of order `p` on a ring of characteristic `p`, the trace is
zero while `A^G = A`: when `p` divides `|G|` the invariant ring is not the image of a trace or
averaging operator. -/
-- test trace_image_ne_invariants (non-example)
example {p : ℕ} [Fact p.Prime] {A : Type*} [CommRing A] [CharP A p] {G : Type*} [Group G]
    [Fintype G] [MulSemiringAction G A] (hG : Fintype.card G = p)
    (htriv : ∀ (g : G) (a : A), g • a = a) :
    (∀ a : A, ∑ g : G, g • a = 0) ∧ FixedPoints.subring A G = ⊤ := sorry

/-! ## PerfectoidSpaces:P8/extensions-of-valuations-are-conjugate -/

section Valuations

variable {K L : Type*} [Field K] [Field L] [Algebra K L]

/-- PerfectoidSpaces:P8/extensions-of-valuations-are-conjugate, existence: every valuation of `K`,
of any rank, extends along an algebraic extension, as a valuation subring lying over it. -/
theorem extensions_of_valuations_are_conjugate_exists [Algebra.IsAlgebraic K L]
    (O : ValuationSubring K) : ∃ O' : ValuationSubring L, O'.comap (algebraMap K L) = O := sorry

/-- PerfectoidSpaces:P8/extensions-of-valuations-are-conjugate, uniqueness along a purely
inseparable extension (the subextension `K ⊆ L^{Aut(L/K)}`). -/
theorem extensions_of_valuations_are_conjugate_unique [IsPurelyInseparable K L]
    {O₁ O₂ : ValuationSubring L}
    (h : O₁.comap (algebraMap K L) = O₂.comap (algebraMap K L)) : O₁ = O₂ := sorry

/-- PerfectoidSpaces:P8/extensions-of-valuations-are-conjugate: along a normal extension with
finite automorphism group, `Aut(L/K)` acts transitively on the valuation subrings of `L` lying
over a given valuation subring of `K`. -/
theorem extensions_of_valuations_are_conjugate [Normal K L] [Finite (L ≃ₐ[K] L)]
    {O₁ O₂ : ValuationSubring L}
    (h : O₁.comap (algebraMap K L) = O₂.comap (algebraMap K L)) :
    ∃ σ : L ≃ₐ[K] L, σ • O₁ = O₂ := sorry

end Valuations

/-! ## PerfectoidSpaces:P8/continuous-valuations-over-invariants and
PerfectoidSpaces:P8/invariant-spectrum-homeomorphism -/

section Spectrum

variable {A : Type*} [CommRing A] [TopologicalSpace A] [IsTopologicalRing A] [T2Space A]
  (G : Type*) [Group G] [MulSemiringAction G A] [IsTateRing A] [Finite G]
  [ContinuousConstSMul G A]

/-- PerfectoidSpaces:P8/continuous-valuations-over-invariants, surjectivity: restriction
`Cont(A) → Cont(A^G)` is surjective, for a complete Tate ring with a continuous action of a
finite group. -/
theorem continuous_valuations_over_invariants_surjective
    (hA : @CompleteSpace A (IsTopologicalAddGroup.rightUniformSpace A)) :
    ∀ w ∈ cont (FixedPoints.subring A G), ∃ v ∈ cont A,
      ValuationSpectrum.comap (FixedPoints.subring A G).subtype v = w := sorry

/-- PerfectoidSpaces:P8/continuous-valuations-over-invariants, fibres: two continuous valuations
of `A` have the same restriction to `A^G` if and only if they lie in one orbit of the right
action `v ↦ v ∘ g`. -/
theorem continuous_valuations_over_invariants_fibre
    (hA : @CompleteSpace A (IsTopologicalAddGroup.rightUniformSpace A))
    {v w : ValuationSpectrum A} (hv : v ∈ cont A) (hw : w ∈ cont A) :
    ValuationSpectrum.comap (FixedPoints.subring A G).subtype v =
        ValuationSpectrum.comap (FixedPoints.subring A G).subtype w ↔
      ∃ g : G, w = ValuationSpectrum.comap (MulSemiringAction.toRingHom G A g) v := sorry

/-- The restriction map `q : Spa(A, A⁺) → Spa(A^G, A^{+G})`, `v ↦ v|_{A^G}`; it is `spaComap`
of the inclusion (`invariantSpaMap_eq_spaComap`). -/
def invariantSpaMap (P : TauCeti.Huber.Pair A) (hP : ∀ g : G, ∀ a ∈ P.plus, g • a ∈ P.plus) :
    spa P.plus → spa (Huber.Pair.invariants G P hP).plus := sorry

/-- `invariantSpaMap` is Tau Ceti's `spaComap` along `A^G → A`. -/
theorem invariantSpaMap_eq_spaComap (P : TauCeti.Huber.Pair A)
    (hP : ∀ g : G, ∀ a ∈ P.plus, g • a ∈ P.plus) :
    invariantSpaMap G P hP =
      spaComap (FixedPoints.subring A G).subtype continuous_subtype_val
        (Huber.Pair.invariants G P hP).plus P.plus
        (Huber.Pair.coe_mem_plus_of_mem_invariants G P hP) := sorry

variable (hA : @CompleteSpace A (IsTopologicalAddGroup.rightUniformSpace A))
  (P : TauCeti.Huber.Pair A) (hP : ∀ g : G, ∀ a ∈ P.plus, g • a ∈ P.plus)

include hA in
/-- PerfectoidSpaces:P8/invariant-spectrum-homeomorphism: `q` is surjective. -/
theorem invariant_spectrum_homeomorphism_surjective :
    Function.Surjective (invariantSpaMap G P hP) := sorry

include hA in
/-- PerfectoidSpaces:P8/invariant-spectrum-homeomorphism: the fibres of `q` are the orbits of
the right action `v ↦ v ∘ g`. -/
theorem invariant_spectrum_homeomorphism_fibre (v w : spa P.plus) :
    invariantSpaMap G P hP v = invariantSpaMap G P hP w ↔
      ∃ g : G, w.1 = ValuationSpectrum.comap (MulSemiringAction.toRingHom G A g) v.1 := sorry

include hA in
/-- PerfectoidSpaces:P8/invariant-spectrum-homeomorphism: `q` is a quotient map. Together with
`invariant_spectrum_homeomorphism_surjective` and `invariant_spectrum_homeomorphism_fibre` this
is the homeomorphism `|Spa(A, A⁺)|/G ≅ |Spa(A^G, A^{+G})|` for the quotient topology. No
sheafiness is assumed. -/
theorem invariant_spectrum_homeomorphism_isQuotientMap :
    IsQuotientMap (invariantSpaMap G P hP) := sorry

include hA in
/-- PerfectoidSpaces:P8/invariant-spectrum-homeomorphism: `Spa(A, A⁺)` is the full preimage of
`Spa(A^G, A^{+G})` in `Cont(A)`. -/
theorem invariant_spectrum_homeomorphism_mem_spa_iff {v : ValuationSpectrum A}
    (hv : v ∈ cont A) :
    v ∈ spa P.plus ↔
      ValuationSpectrum.comap (FixedPoints.subring A G).subtype v ∈
        spa (Huber.Pair.invariants G P hP).plus := sorry

open scoped Classical in
include hA in
/-- PerfectoidSpaces:P8/invariant-spectrum-homeomorphism, rational subsets: if `T ∪ {s} ⊆ A^G`
generates an open ideal of `A^G`, it generates an open ideal of `A`, and the rational subset
`U(T/s)` of `Spa(A, A⁺)` is `G`-stable. That `q⁻¹ U(T/s) = U(T/s)` is Tau Ceti's
`spaComap_preimage_rationalSubset`. -/
theorem invariant_spectrum_homeomorphism_rationalSubset (T : Finset (FixedPoints.subring A G))
    (s : FixedPoints.subring A G)
    (hT : IsOpen (Ideal.span (↑(insert s T) : Set (FixedPoints.subring A G)) :
      Set (FixedPoints.subring A G))) :
    IsOpen (Ideal.span (↑((insert s T).image (FixedPoints.subring A G).subtype) : Set A) :
      Set A) ∧
      ∀ g : G, ∀ v ∈ rationalSubset P.plus (T.image (FixedPoints.subring A G).subtype) (s : A),
        ValuationSpectrum.comap (MulSemiringAction.toRingHom G A g) v ∈
          rationalSubset P.plus (T.image (FixedPoints.subring A G).subtype) (s : A) := sorry

end Spectrum

-- invariant_quotient_v_sheaf_presentation: not stated here; needs Spd(A, A⁺) and v-sheaves on
--   Perf with their quotients (supplier: DiamondsAndVStacks:D2, DiamondsAndVStacks:D5,
--   DiamondsAndVStacks:D6). Node PerfectoidSpaces:P8/invariant-quotient-v-sheaf-presentation.

/-! ## PerfectoidSpaces:P8/frobenius-on-invariants-of-p-group and
PerfectoidSpaces:P8/invariants-of-perfectoid-tate-ring -/

section Perfectoid

variable {p : ℕ} [Fact p.Prime] {A : Type*} [CommRing A] [TopologicalSpace A]
  [IsTopologicalRing A] (G : Type*) [Group G] [MulSemiringAction G A] [Finite G]
  [ContinuousConstSMul G A]

/-- PerfectoidSpaces:P8/frobenius-on-invariants-of-p-group: for a `p`-group of order `p ^ k`
there is a `G`-invariant pseudouniformizer `u ∈ A°` with `u ^ p ^ (k + 1) ∣ p` in `(A°)^G` such
that every `x ∈ (A°)^G` is a `p`-th power modulo `u ^ p (A°)^G`. The source takes
`u = (ū^{1/p^n})♯` for an invariant pseudouniformizer `ū` of the tilt; the tilt of a perfectoid
Tate ring is PerfectoidSpaces P1's, so only the existence of `u` is stated.
`(A^G)° = (A°)^G` is `Huber.Pair.powerBounded_invariants`. -/
theorem frobenius_on_invariants_of_p_group (hA : IsPerfectoidTateRing p A) {k : ℕ}
    (hG : Nat.card G = p ^ k) :
    ∃ u ∈ FixedPoints.subring A G, IsPseudoUniformizer u ∧ IsPowerBounded u ∧
      (∃ w ∈ FixedPoints.subring A G, IsPowerBounded w ∧ (p : A) = u ^ p ^ (k + 1) * w) ∧
      ∀ x ∈ FixedPoints.subring A G, IsPowerBounded x →
        ∃ z ∈ FixedPoints.subring A G, IsPowerBounded z ∧
          ∃ y ∈ FixedPoints.subring A G, IsPowerBounded y ∧ x - z ^ p = u ^ p * y := sorry

/-- PerfectoidSpaces:P8/invariants-of-perfectoid-tate-ring: the invariants of a perfectoid Tate
ring under a finite group, with the subspace topology, are a perfectoid Tate ring. There is no
hypothesis on `|G|`. The tilt statement `(A^G)♭ = (A♭)^G` is not stated: it needs the tilt of a
perfectoid Tate ring with its `G`-action (supplier: PerfectoidSpaces:P1). -/
theorem invariants_of_perfectoid_tate_ring (hA : IsPerfectoidTateRing p A) :
    IsPerfectoidTateRing p (FixedPoints.subring A G) := sorry

end Perfectoid

/-- The binomial input of PerfectoidSpaces:P8/rational-invariants-characteristic-p: if `p ^ m`
exactly divides `n = p ^ m * k` then `C(n, p ^ m)` is a unit in every ring of characteristic `p`
(Lucas: `C(p ^ m k, p ^ m) ≡ k mod p`, `Choose.choose_pow_mul_pow_mul_modEq_choose_nat`). It is
what lets the proof divide by no multiple of `p`. -/
theorem rational_invariants_characteristic_p_isUnit_choose {R : Type*} [CommRing R] (p : ℕ)
    [Fact p.Prime] [CharP R p] {m k : ℕ} (hk : ¬ p ∣ k) :
    IsUnit (((p ^ m * k).choose (p ^ m) : ℕ) : R) := sorry

-- rational_invariants_order_invertible: not stated here; needs the completed rational
--   localisations A^G⟨f/h⟩ and A⟨f/h⟩ with the G-action on the latter (Tau Ceti
--   `completionLocObj`, module not built here), completed tensor products and sheafiness
--   (supplier: AdicEtaleGeometry:A0). Node
--   PerfectoidSpaces:P8/rational-invariants-order-invertible. Its splitting
--   A = A^G ⊕ (1 - e_G) A is Mathlib's `Representation.isProj_averageMap`; the twisted form is
--   `TorsorDescent.twistedAverage` below.
-- rational_invariants_characteristic_p: not stated here; needs A^G⟨T/s⟩ → A⟨T/s⟩^G (Tau Ceti
--   `completionLocObj`, module not built here), rational localisation of perfectoid pairs
--   (PerfectoidSpaces:P2) and the spectral seminorm of uniform rings (supplier:
--   AdicSpacesPartII:R3). Node PerfectoidSpaces:P8/rational-invariants-characteristic-p. Its
--   binomial input is `rational_invariants_characteristic_p_isUnit_choose`.
-- rational_invariants_perfectoid: not stated here; needs A⟨T/s⟩ with its G-action (Tau Ceti
--   `completionLocObj`, module not built here), rational localisation and tilting of perfectoid
--   pairs and O_Y, q_* O_X as sheaves on Spa (supplier: PerfectoidSpaces:P1,
--   PerfectoidSpaces:P2, AdicEtaleGeometry:A0). Node
--   PerfectoidSpaces:P8/rational-invariants-perfectoid.
-- invariants_of_affinoid_algebra: not stated here; needs classical K-affinoid algebras,
--   noetherian, with closed finite modules (supplier: AdicSpacesPartII:R0). Node
--   PerfectoidSpaces:P8/invariants-of-affinoid-algebra.
-- rational_invariants_affinoid_algebra: not stated here; needs K-affinoid algebras and A⟨f/h⟩
--   with its G-action (supplier: AdicSpacesPartII:R0). Node
--   PerfectoidSpaces:P8/rational-invariants-affinoid-algebra.

/-! ## PerfectoidSpaces:P8/categorical-quotient (construction): every item needs Huber's
category `V` -/

-- VRingedSpace.quotient: not stated here; needs Huber's category V of v-ringed spaces with
--   structure sheaves (supplier: AdicEtaleGeometry:A0)
-- VRingedSpace.quotient.π: not stated here; needs V (supplier: AdicEtaleGeometry:A0)
-- VRingedSpace.quotient.isQuotientMap: not stated here; needs V (supplier: AdicEtaleGeometry:A0)
-- VRingedSpace.quotient.sections: not stated here; needs V and sheaves on |X|/G
--   (supplier: AdicEtaleGeometry:A0)
-- VRingedSpace.quotient.lift: not stated here; needs V (supplier: AdicEtaleGeometry:A0)
-- VRingedSpace.quotient.restrict: not stated here; needs V (supplier: AdicEtaleGeometry:A0)
-- VRingedSpace.quotient.map: not stated here; needs V (supplier: AdicEtaleGeometry:A0)
-- VRingedSpace.quotient.stalk: not stated here; needs V and stalks of O_X
--   (supplier: AdicEtaleGeometry:A0)
-- quotient_trivialAction: not stated here; needs V (supplier: AdicEtaleGeometry:A0)
--   [degenerate test]
-- quotient_prod_self: not stated here; needs V (supplier: AdicEtaleGeometry:A0)
--   [computation test]
-- quotient_affinoid_perfectoid: not stated here; needs V and affinoid perfectoid spaces
--   (supplier: AdicEtaleGeometry:A0, PerfectoidSpaces:P2) [compatibility test]
-- quotient_not_etale_at_fixed_point: not stated here; needs V, the perfectoid disc and étale
--   morphisms of adic spaces (supplier: AdicEtaleGeometry:A0) [non-example test]

-- affinoid_perfectoid_quotient: not stated here; needs V (supplier: AdicEtaleGeometry:A0),
--   affinoid perfectoid spaces (supplier: PerfectoidSpaces:P2) and v-sheaves on Perfd
--   (supplier: DiamondsAndVStacks:D2). Node PerfectoidSpaces:P8/affinoid-perfectoid-quotient.
--   Its ring-level parts are `invariants_of_perfectoid_tate_ring` and the
--   `invariant_spectrum_homeomorphism_*` theorems.
-- quotient_scalar_extension: not stated here; needs completed tensor products A ⊗̂_K L
--   (supplier: AdicEtaleGeometry:A0). Node PerfectoidSpaces:P8/quotient-scalar-extension.
-- perfectoid_quotient_invariant_cover: not stated here; needs perfectoid spaces and V
--   (supplier: AdicEtaleGeometry:A0, PerfectoidSpaces:P2). Node
--   PerfectoidSpaces:P8/perfectoid-quotient-invariant-cover.
-- adic_quotient_order_invertible: not stated here; needs analytic adic spaces and V
--   (supplier: AdicEtaleGeometry:A0). Node PerfectoidSpaces:P8/adic-quotient-order-invertible.
-- rigid_quotient_invariant_cover: not stated here; needs rigid analytic spaces and finite
--   morphisms (supplier: AdicSpacesPartII:R0) and V (supplier: AdicEtaleGeometry:A0). Node
--   PerfectoidSpaces:P8/rigid-quotient-invariant-cover.
-- quotient_diamond_comparison: not stated here; needs diamonds X^◇ and pro-étale sheaf quotients
--   (supplier: DiamondsAndVStacks:D4, DiamondsAndVStacks:D6). Node
--   PerfectoidSpaces:P8/quotient-diamond-comparison.
-- free_action_quotient_is_torsor: not stated here; needs perfectoid spaces, diamonds and
--   G-torsors of v-stacks (supplier: DiamondsAndVStacks:D2, DiamondsAndVStacks:D3,
--   DiamondsAndVStacks:D5). Node PerfectoidSpaces:P8/free-action-quotient-is-torsor.

/-! ## PerfectoidSpaces:P8/g-clean-neighbourhood (definition) and
PerfectoidSpaces:P8/g-clean-neighbourhoods-exist -/

section GClean

variable (Γ : Type*) {X : Type*} [Group Γ] [MulAction Γ X] [TopologicalSpace X]

/-- PerfectoidSpaces:P8/g-clean-neighbourhood, data: an open neighbourhood `U` of `x` is
`Γ`-clean if it is stable under the stabilizer `H_x` and disjoint from its translates by the
elements outside `H_x`. Stated for a left action; for the right actions of the sources use
`Γ = Gᵐᵒᵖ`, so that `U · g` is `MulOpposite.op g • U`. No separation hypothesis. -/
def MulAction.IsGClean (x : X) (U : Set X) : Prop :=
  IsOpen U ∧ x ∈ U ∧ (∀ h ∈ MulAction.stabilizer Γ x, h • U = U) ∧
    ∀ g ∉ MulAction.stabilizer Γ x, Disjoint U (g • U)

variable {Γ}

/-- PerfectoidSpaces:P8/g-clean-neighbourhood, projection: `h • U = U` for `h` in the
stabilizer. -/
theorem MulAction.IsGClean.smul_eq {x : X} {U : Set X} (hU : MulAction.IsGClean Γ x U) {h : Γ}
    (hh : h ∈ MulAction.stabilizer Γ x) : h • U = U := sorry

/-- PerfectoidSpaces:P8/g-clean-neighbourhood, projection: `U` and `g • U` are disjoint for `g`
outside the stabilizer. -/
theorem MulAction.IsGClean.disjoint_smul {x : X} {U : Set X} (hU : MulAction.IsGClean Γ x U)
    {g : Γ} (hg : g ∉ MulAction.stabilizer Γ x) : Disjoint U (g • U) := sorry

/-- PerfectoidSpaces:P8/g-clean-neighbourhood, characterisation: for a left transversal `S` of
`H_x`, the map `⊔_{s ∈ S} U → X, (s, u) ↦ s • u` (the balanced product `U ×^{H_x} Γ`) is an
open embedding onto `⋃ g, g • U`. -/
theorem MulAction.IsGClean.isOpenEmbedding_induced [ContinuousConstSMul Γ X] {x : X}
    {U : Set X} (hU : MulAction.IsGClean Γ x U) {S : Set Γ}
    (hS : Subgroup.IsComplement S (MulAction.stabilizer Γ x : Set Γ)) :
    IsOpenEmbedding (fun q : (Σ _ : S, U) ↦ (q.1 : Γ) • (q.2 : X)) ∧
      Set.range (fun q : (Σ _ : S, U) ↦ (q.1 : Γ) • (q.2 : X)) = ⋃ g : Γ, g • U := sorry

/-- PerfectoidSpaces:P8/g-clean-neighbourhood, relation: the intersection of a `Γ`-clean `U`
with an `H_x`-stable open neighbourhood of `x` is `Γ`-clean. -/
theorem MulAction.IsGClean.inter {x : X} {U V : Set X} (hU : MulAction.IsGClean Γ x U)
    (hV : IsOpen V) (hxV : x ∈ V) (hVst : ∀ h ∈ MulAction.stabilizer Γ x, h • V = V) :
    MulAction.IsGClean Γ x (U ∩ V) := sorry

/-- PerfectoidSpaces:P8/g-clean-neighbourhood, functoriality: the preimage of a `Γ`-clean
neighbourhood of `f x` under an equivariant continuous `f` with the same stabilizer at `x` is
`Γ`-clean. The stabilizer hypothesis is the one the chart lemma needs (sourceIssues E1). -/
theorem MulAction.IsGClean.preimage {Y : Type*} [MulAction Γ Y] [TopologicalSpace Y]
    {f : X → Y} (hf : Continuous f) (hequiv : ∀ (g : Γ) (y : X), f (g • y) = g • f y) {x : X}
    (hstab : MulAction.stabilizer Γ (f x) = MulAction.stabilizer Γ x) {U : Set Y}
    (hU : MulAction.IsGClean Γ (f x) U) : MulAction.IsGClean Γ x (f ⁻¹' U) := sorry

end GClean

-- test isGClean_trivialGroup (degenerate)
example {Γ X : Type*} [Group Γ] [Subsingleton Γ] [MulAction Γ X] [TopologicalSpace X] {x : X}
    {U : Set X} (hU : IsOpen U) (hx : x ∈ U) : MulAction.IsGClean Γ x U := sorry

/- `ℤˣ = {±1}` acting on `ℝ` by `x ↦ -x`: `(1/2, 3/2)` is clean at `1` (trivial stabilizer), and
`(-1, 1)` is clean at `0` (stabilizer the whole group). -/
-- test isGClean_neg_real (computation)
example :
    MulAction.IsGClean ℤˣ (1 : ℝ) (Set.Ioo (1 / 2) (3 / 2)) ∧
      MulAction.IsGClean ℤˣ (0 : ℝ) (Set.Ioo (-1) 1) := sorry

-- test isGClean_iff_isOpenEmbedding (characterisation)
example {Γ X : Type*} [Group Γ] [MulAction Γ X] [TopologicalSpace X] [ContinuousConstSMul Γ X]
    {x : X} {U : Set X} (hUo : IsOpen U) (hx : x ∈ U) {S : Set Γ}
    (hS : Subgroup.IsComplement S (MulAction.stabilizer Γ x : Set Γ)) :
    MulAction.IsGClean Γ x U ↔ (∀ h ∈ MulAction.stabilizer Γ x, h • U = U) ∧
      Function.Injective (fun q : (Σ _ : S, U) ↦ (q.1 : Γ) • (q.2 : X)) ∧
      IsOpen (Set.range fun q : (Σ _ : S, U) ↦ (q.1 : Γ) • (q.2 : X)) := sorry

/- The line with a doubled origin is not in Mathlib, so the test is stated for what goes wrong
there: a point `x` whose translate `g • x ≠ x` cannot be separated from it by neighbourhoods
(the two origins, swapped by `ℤ/2`) has no `Γ`-clean neighbourhood. So the Hausdorff hypothesis
of `g_clean_neighbourhoods_exist` cannot be dropped. -/
-- test not_isGClean_doubled_origin (non-example)
example {Γ X : Type*} [Group Γ] [MulAction Γ X] [TopologicalSpace X] [ContinuousConstSMul Γ X]
    {x : X} {g : Γ} (hg : g • x ≠ x) (hsep : ¬ Disjoint (𝓝 x) (𝓝 (g • x))) (U : Set X) :
    ¬ MulAction.IsGClean Γ x U := sorry

section GCleanExist

variable (Γ : Type*) {X : Type*} [Group Γ] [MulAction Γ X] [TopologicalSpace X] [T2Space X]
  [Finite Γ] [ContinuousConstSMul Γ X]

/-- PerfectoidSpaces:P8/g-clean-neighbourhoods-exist: in a Hausdorff space with a continuous
action of a finite group, every point has a clean neighbourhood. -/
theorem g_clean_neighbourhoods_exist (x : X) : ∃ U, MulAction.IsGClean Γ x U := sorry

/-- PerfectoidSpaces:P8/g-clean-neighbourhoods-exist: the clean neighbourhoods of `x` form a
neighbourhood basis. -/
theorem g_clean_neighbourhoods_exist_hasBasis (x : X) :
    (𝓝 x).HasBasis (MulAction.IsGClean Γ x) id := sorry

end GCleanExist

/-- The topological step of PerfectoidSpaces:P8/finite-quotient-chart: `T2Quotient.mk` to the
maximal Hausdorff quotient, with a compatible action on it, pulls a clean neighbourhood of the
image of `x` back to a clean neighbourhood of `x` containing the closure of `{x}`, provided the
two stabilizers agree (sourceIssues E1: `π` injective on the orbit). -/
theorem finite_quotient_chart_isGClean_preimage (Γ : Type*) {X : Type*} [Group Γ]
    [MulAction Γ X] [TopologicalSpace X] [MulAction Γ (T2Quotient X)]
    (hmk : ∀ (g : Γ) (y : X), T2Quotient.mk (g • y) = g • T2Quotient.mk y) {x : X}
    (hstab : MulAction.stabilizer Γ (T2Quotient.mk x) = MulAction.stabilizer Γ x)
    {U : Set (T2Quotient X)} (hU : MulAction.IsGClean Γ (T2Quotient.mk x) U) :
    MulAction.IsGClean Γ x (T2Quotient.mk ⁻¹' U) ∧ closure {x} ⊆ T2Quotient.mk ⁻¹' U := sorry

-- finite_quotient_chart: not stated here; needs quasi-separated analytic adic spaces, their
--   affinoid quotients and V (supplier: AdicEtaleGeometry:A0). Node
--   PerfectoidSpaces:P8/finite-quotient-chart. Its topological step is
--   `finite_quotient_chart_isGClean_preimage`.

/-! ## PerfectoidSpaces:P8/zariski-closed-embedding (definition): every item needs perfectoid
spaces -/

-- PerfectoidSpace.IsZariskiClosedEmbedding: not stated here; needs perfectoid spaces with their
--   open affinoid perfectoids and fibre products and Zariski-closed subsets of affinoid
--   perfectoids (supplier: PerfectoidSpaces:P2, PerfectoidQuotients:Q4)
-- PerfectoidSpace.IsZariskiClosedEmbedding.of_affinoid: not stated here; needs perfectoid
--   spaces (supplier: PerfectoidSpaces:P2, PerfectoidQuotients:Q4)
-- PerfectoidSpace.IsZariskiClosedEmbedding.base_change_affinoid: not stated here; needs fibre
--   products of perfectoid spaces (supplier: PerfectoidSpaces:P2)
-- PerfectoidSpace.IsZariskiClosedEmbedding.isClosedImmersion: not stated here; needs closed
--   immersions of perfectoid spaces (supplier: PerfectoidSpaces:P4)
-- PerfectoidSpace.IsZariskiClosedEmbedding.comp_open: not stated here; needs perfectoid spaces
--   (supplier: PerfectoidSpaces:P2)
-- PerfectoidSpace.IsZariskiOpen: not stated here; needs perfectoid spaces
--   (supplier: PerfectoidSpaces:P2, PerfectoidQuotients:Q4)
-- isZariskiClosedEmbedding_id: not stated here; needs perfectoid spaces
--   (supplier: PerfectoidSpaces:P2) [degenerate test]
-- isZariskiClosedEmbedding_point: not stated here; needs the perfectoid disc
--   (supplier: PerfectoidSpaces:P2) [computation test]
-- isZariskiClosedEmbedding_affinoid_iff: not stated here; needs the immersions of ECD 5.7
--   (supplier: PerfectoidQuotients:Q4) [compatibility test]
-- not_isZariskiClosed_gauss_closure: not stated here; needs the perfectoid disc
--   (supplier: PerfectoidSpaces:P2) [non-example test]

/-! ## PerfectoidSpaces:P8/analytically-separated (definition): every item needs perfectoid
spaces -/

-- PerfectoidSpace.IsAnalyticallySeparated: not stated here; needs perfectoid spaces over
--   Spa(K, K⁺) with fibre products and Zariski-closed embeddings (supplier: PerfectoidSpaces:P2)
-- PerfectoidSpace.IsAnalyticallySeparated.inter_affinoid: not stated here; needs perfectoid
--   spaces (supplier: PerfectoidSpaces:P2)
-- PerfectoidSpace.IsAnalyticallySeparated.isSeparated: not stated here; needs diamonds and
--   separated maps of v-sheaves (supplier: PerfectoidSpaces:P4)
-- PerfectoidSpace.IsAnalyticallySeparated.of_affinoid: not stated here; needs perfectoid spaces
--   (supplier: PerfectoidSpaces:P2)
-- PerfectoidSpace.IsAnalyticallySeparated.of_open: not stated here; needs perfectoid spaces
--   (supplier: PerfectoidSpaces:P2)
-- isAnalyticallySeparated_affinoid: not stated here; needs perfectoid spaces
--   (supplier: PerfectoidSpaces:P2) [degenerate test]
-- isAnalyticallySeparated_projective_tower: not stated here; needs the perfectoid projective
--   line (supplier: AdicSpacesPartII:R1) [computation test]
-- isAnalyticallySeparated_isSeparated: not stated here; needs ECD 10.7 separatedness
--   (supplier: PerfectoidSpaces:P4) [compatibility test]
-- not_isAnalyticallySeparated_nonseparated_gluing: not stated here; needs gluing of perfectoid
--   spaces (supplier: PerfectoidSpaces:P2) [non-example test]

-- analytically_separated_is_separated: not stated here; needs diamonds and separated maps of
--   v-sheaves (supplier: PerfectoidSpaces:P4). Node
--   PerfectoidSpaces:P8/analytically-separated-is-separated.
-- analytically_separated_affinoid_intersections: not stated here; needs perfectoid spaces and
--   fibre products (supplier: PerfectoidSpaces:P2). Node
--   PerfectoidSpaces:P8/analytically-separated-affinoid-intersections.
-- limit_of_zariski_closed_embeddings: not stated here; needs limits of v-sheaves and
--   Zariski-closed subsets (supplier: PerfectoidQuotients:Q4). Node
--   PerfectoidSpaces:P8/limit-of-zariski-closed-embeddings.
-- closed_subvariety_pullback_is_zariski_closed: not stated here; needs analytification of
--   quasi-projective varieties (supplier: AdicSpacesPartII:R1) and vector bundles on affinoid
--   perfectoids (supplier: AdicSpacesPartII:R3). Node
--   PerfectoidSpaces:P8/closed-subvariety-pullback-is-zariski-closed.
-- projective_tower_limit_is_analytically_separated: not stated here; needs towers of rigid
--   spaces with perfectoid limit (supplier: AdicSpacesPartII:R1, PerfectoidSpaces:P7). Node
--   PerfectoidSpaces:P8/projective-tower-limit-is-analytically-separated.
-- rigid_finite_quotient: not stated here; needs separated rigid spaces and their affinoids
--   (supplier: AdicSpacesPartII:R0) and V (supplier: AdicEtaleGeometry:A0). Node
--   PerfectoidSpaces:P8/rigid-finite-quotient.
-- perfectoid_finite_quotient: not stated here; needs perfectoid spaces, V and diamonds
--   (supplier: AdicEtaleGeometry:A0, DiamondsAndVStacks:D4). Node
--   PerfectoidSpaces:P8/perfectoid-finite-quotient.
-- perfectoid_quotient_map_is_weakly_affinoid: not stated here; needs perfectoid spaces and V
--   (supplier: AdicEtaleGeometry:A0). Node
--   PerfectoidSpaces:P8/perfectoid-quotient-map-is-weakly-affinoid.
-- perfectoid_from_perfectoid_components: not stated here; needs spatial diamonds and their
--   connected components (supplier: DiamondsAndVStacks:D4, DiamondsAndVStacks:D5). Node
--   PerfectoidSpaces:P8/perfectoid-from-perfectoid-components.
-- integral_extension_of_perfectoid_pair: not stated here; needs Spd(S, S⁺) (supplier:
--   DiamondsAndVStacks:D6) and the perfectoidization S⁺_perfd of an integral algebra over a
--   perfectoid ring (Bhatt–Scholze Theorem 1.17(1); gap, no owner). Node
--   PerfectoidSpaces:P8/integral-extension-of-perfectoid-pair.
-- finite_tower_over_perfectoid_tower: not stated here; needs locally noetherian adic spaces and
--   finite maps (supplier: AdicSpacesPartII:R0) and the integral-extension lemma (gap). Node
--   PerfectoidSpaces:P8/finite-tower-over-perfectoid-tower.
-- finite_level_affinoid_basis: not stated here; needs cofiltered limits of adic spaces as
--   diamonds (supplier: PerfectoidSpaces:P5, PerfectoidSpaces:P7). Node
--   PerfectoidSpaces:P8/finite-level-affinoid-basis.

/-! ## PerfectoidSpaces:P8/good-tower (definition): every item needs towers of rigid spaces -/

-- PerfectoidSpace.GoodTower: not stated here; needs projective rigid spaces over K and
--   perfectoid limits of towers (supplier: AdicSpacesPartII:R1, PerfectoidSpaces:P7)
-- PerfectoidSpace.GoodTower.limit: not stated here; needs limits of towers as diamonds
--   (supplier: PerfectoidSpaces:P7)
-- PerfectoidSpace.GoodTower.isAnalyticallySeparated: not stated here; needs perfectoid spaces
--   (supplier: PerfectoidSpaces:P2)
-- PerfectoidSpace.GoodTower.closure_rankOne_subset_affinoid: not stated here; needs perfectoid
--   spaces (supplier: PerfectoidSpaces:P2)
-- PerfectoidSpace.GoodTower.ofFinite: not stated here; needs finite maps of rigid spaces
--   (supplier: AdicSpacesPartII:R1)
-- PerfectoidSpace.GoodTower.reindex: not stated here; needs towers of rigid spaces
--   (supplier: PerfectoidSpaces:P7)
-- goodTower_const_point: not stated here; needs rigid spaces over K
--   (supplier: AdicSpacesPartII:R1) [degenerate test]
-- goodTower_frobenius_P1: not stated here; needs the analytic projective line
--   (supplier: AdicSpacesPartII:R1) [computation test]
-- goodTower_isAnalyticallySeparated: not stated here; needs perfectoid spaces
--   (supplier: PerfectoidSpaces:P2) [compatibility test]
-- not_goodTower_affine_line: not stated here; needs rigid spaces over K
--   (supplier: AdicSpacesPartII:R1) [non-example test]

-- good_towers_under_finite_maps: not stated here; needs rigid GAGA (supplier:
--   AdicSpacesPartII:R1). Node PerfectoidSpaces:P8/good-towers-under-finite-maps.
-- quotient_of_good_tower: not stated here; needs spatial diamonds (supplier:
--   DiamondsAndVStacks:D5) and the quotient theorems above. Node
--   PerfectoidSpaces:P8/quotient-of-good-tower.
-- closed_loci_in_towers: not stated here; needs tilde-limits of adic spaces (supplier:
--   ClassicalAdicEtaleCohomology:H0) and analytifications of closed subvarieties (supplier:
--   AdicSpacesPartII:R1). Node PerfectoidSpaces:P8/closed-loci-in-towers.

/-! ## P9 -/

namespace TorsorDescent

/-! ### PerfectoidSpaces:P9/profinite-galois-tower (definition): every item needs the pro-étale
site -/

-- ProetaleGaloisTower: not stated here; needs locally noetherian adic spaces, their pro-étale
--   site and pro-étale torsors (supplier: AdicEtaleGeometry:A1, DiamondsAndVStacks:D3); its
--   group will be a Mathlib `ProfiniteGrp` with levels `OpenNormalSubgroup`s
-- ProetaleGaloisTower.level: not stated here; needs the pro-étale site
--   (supplier: AdicEtaleGeometry:A1)
-- ProetaleGaloisTower.torsorIso: not stated here; needs fibre products in X_proet
--   (supplier: DiamondsAndVStacks:D3)
-- ProetaleGaloisTower.restrict: not stated here; needs the pro-étale site
--   (supplier: AdicEtaleGeometry:A1)
-- ProetaleGaloisTower.subgroup: not stated here; needs quotients of towers
--   (supplier: DiamondsAndVStacks:D3)
-- ProetaleGaloisTower.functionAction: not stated here; needs O_{X_∞} and O⁺_{X_∞} on the
--   pro-étale site (supplier: PadicHodgeTheory:P8:local-rational)
-- tower_trivial: not stated here; needs perfectoid spaces (supplier: PerfectoidSpaces:P2)
--   [degenerate test]
-- tower_finite_etale: not stated here; needs finite étale maps of perfectoid spaces
--   (supplier: PerfectoidSpaces:P3) [computation test]
-- tower_Zp_torus: not stated here; needs the perfectoid torus (supplier: PerfectoidSpaces:P2)
--   [computation test]
-- tower_torsorIso_compat: not stated here; needs O⁺(U_∞ × G)
--   (supplier: PadicHodgeTheory:P8:local-rational) [compatibility test]
-- tower_not_cofinal: not stated here; needs pro-étale torsors
--   (supplier: DiamondsAndVStacks:D3) [non-example test]

/-! ### PerfectoidSpaces:P9/cech-descent-datum (construction): every item needs the pro-étale
site -/

-- ProetaleGaloisTower.cechNerveIso: not stated here; needs the pro-étale site and its fibre
--   products (supplier: AdicEtaleGeometry:A1)
-- ProetaleGaloisTower.sections_prod_profinite: not stated here; needs Ô, Ô⁺ on affinoid
--   perfectoids (supplier: PadicHodgeTheory:P8:local-rational)
-- ProetaleGaloisTower.cechComplexIso: not stated here; needs the Čech complex on X_proet
--   (supplier: AdicEtaleGeometry:A1); its target is Mathlib's continuous cochain complex
--   behind `continuousCohomology`
-- ProetaleGaloisTower.equalizer_eq_invariants: not stated here; needs F(U_∞)
--   (supplier: PadicHodgeTheory:P8:local-rational)
-- ProetaleGaloisTower.cechComplex_map: not stated here; needs the pro-étale site
--   (supplier: AdicEtaleGeometry:A1)
-- cech_trivial_group: not stated here; needs the pro-étale site
--   (supplier: AdicEtaleGeometry:A1) [degenerate test]
-- cech_finite_group: not stated here; needs the pro-étale site
--   (supplier: AdicEtaleGeometry:A1) [computation test]
-- cech_equalizer_eq_contInvariants: not stated here; needs F(U_∞)
--   (supplier: PadicHodgeTheory:P8:local-rational) [compatibility test]; the identification
--   it tests is Mathlib's `ContinuousCohomology.zeroIso`
-- cech_not_discrete: not stated here; needs F(U_∞ × G)
--   (supplier: PadicHodgeTheory:P8:local-rational) [non-example test]

/-! ### PerfectoidSpaces:P9/invariants-of-eventually-injective-colimits -/

universe u

/-- PerfectoidSpaces:P9/invariants-of-eventually-injective-colimits: for a profinite group `G`
and a filtered system of representations on each of which `G` acts through a finite quotient
`G / U` (`U` open normal), invariants commute with the colimit. -/
theorem invariants_of_eventually_injective_colimits {k : Type u} [CommRing k]
    (G : ProfiniteGrp.{u}) {J : Type u} [SmallCategory J] [IsFiltered J] (F : J ⥤ Rep.{u} k G)
    (hF : ∀ j, ∃ U : OpenNormalSubgroup G, ∀ g ∈ U, (F.obj j).ρ g = 1) :
    IsIso (colimit.post F (Rep.invariantsFunctor k G)) := sorry

/-- PerfectoidSpaces:P9/invariants-of-eventually-injective-colimits: for an arbitrary group the
same holds when the transition maps are eventually injective. -/
theorem invariants_of_eventually_injective_colimits_of_injective {k : Type u} [CommRing k]
    (G : Type u) [Group G] {J : Type u} [Preorder J] [IsDirected J (· ≤ ·)] [Nonempty J]
    (F : J ⥤ Rep.{u} k G)
    (hinj : ∃ j₀ : J, ∀ (i j : J) (hij : i ≤ j), j₀ ≤ i →
      Function.Injective (F.map (homOfLE hij)).hom) :
    IsIso (colimit.post F (Rep.invariantsFunctor k G)) := sorry

-- etale_sheaf_sections_over_galois_tower: not stated here; needs sheaves on Y_proet pulled back
--   from Y_et (supplier: AdicEtaleGeometry:A1). Node
--   PerfectoidSpaces:P9/etale-sheaf-sections-over-galois-tower. Its algebraic input is
--   `invariants_of_eventually_injective_colimits`.
-- function_descent_along_tower: not stated here; needs smooth rigid spaces and O, O⁺, Ô on
--   X_proet (supplier: PadicHodgeTheory:P8:local-rational). Node
--   PerfectoidSpaces:P9/function-descent-along-tower.
-- function_descent_over_perfectoid_base: not stated here; needs O, O⁺ as v-sheaves and
--   pro-étale torsors (supplier: DiamondsAndVStacks:D2, DiamondsAndVStacks:D3). Node
--   PerfectoidSpaces:P9/function-descent-over-perfectoid-base.
-- almost_cohomology_of_tower: not stated here; needs pro-étale cohomology (supplier:
--   PadicHodgeTheory:P8:local-rational) and almost mathematics (supplier: PerfectoidSpaces:P0);
--   its target is Mathlib's `continuousCohomology`. Node
--   PerfectoidSpaces:P9/almost-cohomology-of-tower.

/-! ### PerfectoidSpaces:P9/closed-invariant-subalgebra -/

/-- PerfectoidSpaces:P9/closed-invariant-subalgebra: the invariants of a uniform `ℚ_p`-Banach
algebra under a group acting by continuous ring automorphisms form a closed, hence complete,
uniform subalgebra, and `A° = (A_∞°)^G`. -/
theorem closed_invariant_subalgebra (p : ℕ) [Fact p.Prime] {Ainf : Type*} [NormedCommRing Ainf]
    [NormedAlgebra ℚ_[p] Ainf] [CompleteSpace Ainf] (hunif : IsPowMul (norm : Ainf → ℝ))
    (G : Type*) [Group G] [MulSemiringAction G Ainf] [SMulCommClass G ℚ_[p] Ainf]
    [ContinuousConstSMul G Ainf] :
    IsClosed (FixedPoints.subalgebra ℚ_[p] Ainf G : Set Ainf) ∧
      CompleteSpace (FixedPoints.subalgebra ℚ_[p] Ainf G) ∧
      IsPowMul (norm : FixedPoints.subalgebra ℚ_[p] Ainf G → ℝ) ∧
      ∀ a : FixedPoints.subalgebra ℚ_[p] Ainf G, IsPowerBounded a ↔ IsPowerBounded (a : Ainf) :=
  sorry

-- invariants_of_completed_tensor_with_profinite_module: not stated here; needs the mixed
--   completed tensor product (A_∞° ⊗̂ M)[1/p] (supplier: AdicSpacesPartII:R5). Node
--   PerfectoidSpaces:P9/invariants-of-completed-tensor-with-profinite-module.
-- invariants_of_completed_tensor_with_banach_space: not stated here; needs A_∞ ⊗̂_L V for Banach
--   spaces (supplier: AdicEtaleGeometry:A0) and t-orthogonal bases (gap). Node
--   PerfectoidSpaces:P9/invariants-of-completed-tensor-with-banach-space.
-- weight_extension_of_function_descent: not stated here; needs sousperfectoid fibre products
--   X ×_L 𝒰 (supplier: AdicSpacesPartII:R5). Node
--   PerfectoidSpaces:P9/weight-extension-of-function-descent.

/-! ### PerfectoidSpaces:P9/descent-of-finite-locally-free-modules, on sections -/

section ModuleDescent

open TensorProduct

variable {A B : Type*} [CommRing A] [CommRing B] [Algebra A B] (G : Type*) [Group G]
  [MulSemiringAction G B] [SMulCommClass G A B] [Algebra.IsInvariant A B G] [FaithfulSMul A B]

/-- PerfectoidSpaces:P9/descent-of-finite-locally-free-modules, on the sections over one affinoid:
if `A = B^G` (`O(U) = O(U_∞)^G`) and `E` is projective over `A`, the invariants of `B ⊗_A E`, with
`G` acting on `B`, are `E`. The statement for sheaves needs finite locally free modules on `X`
(supplier: AdicSpacesPartII:R3). -/
theorem descent_of_finite_locally_free_modules_sections (E : Type*) [AddCommGroup E]
    [Module A E] [Module.Projective A E] (x : B ⊗[A] E) :
    (∀ g : G, (MulSemiringAction.toAlgHom A B g).toLinearMap.rTensor E x = x) ↔
      ∃ e : E, x = (1 : B) ⊗ₜ[A] e := sorry

/-- PerfectoidSpaces:P9/descent-of-finite-locally-free-modules, full faithfulness on sections:
the `G`-equivariant `B`-linear maps `B ⊗_A E → B ⊗_A F` between base changes of projective
modules, `E` finite, are exactly the base changes of `A`-linear maps. The failure of essential
surjectivity (the Tate twist over the cyclotomic tower) needs the completed cyclotomic field and
Tate's theorem and is not stated. -/
theorem descent_of_finite_locally_free_modules_hom (E F : Type*) [AddCommGroup E] [Module A E]
    [Module.Projective A E] [Module.Finite A E] [AddCommGroup F] [Module A F]
    [Module.Projective A F] (φ : B ⊗[A] E →ₗ[B] B ⊗[A] F)
    (hφ : ∀ (g : G) (x : B ⊗[A] E),
      φ ((MulSemiringAction.toAlgHom A B g).toLinearMap.rTensor E x) =
        (MulSemiringAction.toAlgHom A B g).toLinearMap.rTensor F (φ x)) :
    ∃! f : E →ₗ[A] F, φ = f.baseChange B := sorry

end ModuleDescent

/-! ### PerfectoidSpaces:P9/finite-galois-descent-of-modules -/

section GaloisDescent

open TensorProduct

variable (A B H : Type*) [CommRing A] [CommRing B] [Algebra A B] [Group H] [Fintype H]
  [MulSemiringAction H B] [SMulCommClass H A B]

/-- The Galois condition of PerfectoidSpaces:P9/finite-galois-descent-of-modules: the map
`B ⊗_A B → ∏_{h ∈ H} B`, `b ⊗ b' ↦ (b * h • b')_h`, is bijective. -/
def IsGaloisExtension : Prop :=
  Function.Bijective
    (Algebra.TensorProduct.lift (Pi.constAlgHom A H B)
      (AlgHom.pi fun h : H ↦ MulSemiringAction.toAlgHom A B h) fun _ _ ↦ Commute.all _ _)

variable [IsGaloisGroup H A B] [FaithfulSMul A B] [Algebra.Etale A B] [Module.Finite A B]

/-- PerfectoidSpaces:P9/finite-galois-descent-of-modules: along a finite étale Galois extension,
`M → (B ⊗_A M)^H` is an isomorphism for every `A`-module `M`. -/
theorem finite_galois_descent_of_modules_invariants (hGal : IsGaloisExtension A B H)
    (M : Type*) [AddCommGroup M] [Module A M] :
    Function.Injective (fun m : M ↦ (1 : B) ⊗ₜ[A] m) ∧
      ∀ x : B ⊗[A] M,
        (∀ h : H, (MulSemiringAction.toAlgHom A B h).toLinearMap.rTensor M x = x) ↔
          ∃ m : M, x = (1 : B) ⊗ₜ[A] m := sorry

/-- PerfectoidSpaces:P9/finite-galois-descent-of-modules: every `B`-module `N` with a semilinear
`H`-action descends: `B ⊗_A N^H ≅ N`. With the previous theorem, `M ↦ B ⊗_A M` is an
equivalence onto semilinear `H`-modules, with inverse `N ↦ N^H`. -/
theorem finite_galois_descent_of_modules_effective (hGal : IsGaloisExtension A B H)
    (N : Type*) [AddCommGroup N] [Module A N] [Module B N] [IsScalarTower A B N]
    (ρ : Representation A H N) (hρ : ∀ (h : H) (b : B) (n : N), ρ h (b • n) = (h • b) • ρ h n) :
    Function.Bijective (LinearMap.liftBaseChange B ρ.invariants.subtype) := sorry

/-- PerfectoidSpaces:P9/finite-galois-descent-of-modules: base change preserves and reflects
finite projectivity. When `|H|` is invertible, `N^H` is the image of the idempotent
`|H|⁻¹ ∑ h`, which is Mathlib's `Representation.isProj_averageMap`. -/
theorem finite_galois_descent_of_modules_projective (hGal : IsGaloisExtension A B H)
    (M : Type*) [AddCommGroup M] [Module A M] :
    (Module.Projective A M ∧ Module.Finite A M) ↔
      (Module.Projective B (B ⊗[A] M) ∧ Module.Finite B (B ⊗[A] M)) := sorry

/-- PerfectoidSpaces:P9/finite-galois-descent-of-modules: base change preserves and reflects
constant rank. Preservation is Mathlib's `Module.rankAtStalk_baseChange`; reflection uses that
`Spec B → Spec A` is surjective. -/
theorem finite_galois_descent_of_modules_rank (hGal : IsGaloisExtension A B H) (M : Type*)
    [AddCommGroup M] [Module A M] [Module.Projective A M] [Module.Finite A M] (n : ℕ) :
    (∀ P : PrimeSpectrum A, Module.rankAtStalk M P = n) ↔
      ∀ Q : PrimeSpectrum B, Module.rankAtStalk (B ⊗[A] M) Q = n := sorry

end GaloisDescent

/-! ### PerfectoidSpaces:P9/twisted-character-sheaf (construction): the sheaf needs the
pro-étale site; the twisted invariants of one ring are stated below -/

-- TwistedCharacterSheaf: not stated here; needs sheaves on X built from a pro-étale tower and
--   the coefficient algebras O(U_∞) ⊗̂ A (supplier: AdicSpacesPartII:R5); its sections over one
--   U are `twistedInvariants c` for the ring O(U_∞) ⊗̂ A
-- TwistedCharacterSheaf.sections: not stated here; needs O(U_∞) ⊗̂ A
--   (supplier: AdicSpacesPartII:R5); on one ring it is `mem_twistedInvariants`
-- TwistedCharacterSheaf.module: not stated here; needs sheaves of O_X ⊗̂ A-modules
--   (supplier: AdicSpacesPartII:R5)
-- TwistedCharacterSheaf.integral: not stated here; needs O⁺(X_∞) ⊗̂ A°
--   (supplier: AdicSpacesPartII:R5)
-- TwistedCharacterSheaf.congr_cocycle: not stated here; needs the sheaf
--   (supplier: AdicSpacesPartII:R5); on one ring it is `twistedInvariantsCongr`
-- TwistedCharacterSheaf.mul: not stated here; needs the sheaf (supplier: AdicSpacesPartII:R5)
-- TwistedCharacterSheaf.restrict: not stated here; needs the pro-étale site
--   (supplier: AdicEtaleGeometry:A1)
-- TwistedCharacterSheaf.baseChange: not stated here; needs maps of coefficient algebras under ⊗̂
--   (supplier: AdicSpacesPartII:R5)
-- twisted_trivial_cocycle: not stated here; needs weight-space function descent
--   (supplier: AdicSpacesPartII:R5) [degenerate test]; on one ring it is `twistedInvariants_one`
-- twisted_finite_character: not stated here; needs the ℤ_p(1)-tower on the torus
--   (supplier: PerfectoidSpaces:P2) [computation test]
-- twisted_coboundary: not stated here; needs the sheaf (supplier: AdicSpacesPartII:R5)
--   [compatibility test]; on one ring it is `twistedInvariants_eq_of_eigenunit`
-- twisted_tate_twist_zero: not stated here; needs the completed cyclotomic tower and Tate's
--   theorem (supplier: PadicHodgeTheory:P8:local-rational) [non-example test]

section TwistedInvariants

variable {G R : Type*} [Group G] [CommRing R] [MulSemiringAction G R]

/-- The pinned cocycle law `c (γ * δ) = c γ * γ • c δ` for `c : G → Rˣ`, with `G` acting on `R`
on the left (`γ • f = γ^* f`). It is Mathlib's `groupCohomology.IsMulCocycle₁` once `Rˣ`
carries the induced action, which it does not at the pinned commit. -/
def IsTwistCocycle (c : G → Rˣ) : Prop :=
  ∀ γ δ : G, (c (γ * δ) : R) = c γ * γ • (c δ : R)

/-- The `c`-twisted invariants `{f | ∀ γ, γ • f = (c γ)⁻¹ * f}`, an `R^G`-submodule of `R`: the
sections `ω_c(U)` of PerfectoidSpaces:P9/twisted-character-sheaf, for one ring. -/
def twistedInvariants (c : G → Rˣ) : Submodule (FixedPoints.subring R G) R := sorry

/-- Membership in the twisted invariants. -/
theorem mem_twistedInvariants (c : G → Rˣ) (f : R) :
    f ∈ twistedInvariants c ↔ ∀ γ : G, γ • f = ((c γ)⁻¹ : Rˣ) * f := sorry

/-- For the trivial cocycle the twisted invariants are the invariants (the test
`twisted_trivial_cocycle` for one ring). -/
theorem twistedInvariants_one :
    (twistedInvariants (1 : G → Rˣ) : Set R) = FixedPoints.subring R G := sorry

/-- Change of cocycle (`TwistedCharacterSheaf.congr_cocycle` for one ring): if
`c' γ = c γ * F / γ • F` for a unit `F`, multiplication by `F` is an isomorphism of twisted
invariants (`twistedInvariantsCongr_apply`). -/
def twistedInvariantsCongr (c c' : G → Rˣ) (F : Rˣ)
    (h : ∀ γ : G, (c' γ : R) = c γ * F * γ • ((F⁻¹ : Rˣ) : R)) :
    twistedInvariants c ≃ₗ[FixedPoints.subring R G] twistedInvariants c' := sorry

/-- `twistedInvariantsCongr` is multiplication by `F`. -/
theorem twistedInvariantsCongr_apply (c c' : G → Rˣ) (F : Rˣ)
    (h : ∀ γ : G, (c' γ : R) = c γ * F * γ • ((F⁻¹ : Rˣ) : R)) (f : twistedInvariants c) :
    (twistedInvariantsCongr c c' F h f : R) = F * f := sorry

/-- A unit eigenfunction `F` with `γ • F = (c γ)⁻¹ * F` trivialises the twisted invariants:
they are `F · R^G`. This is the test `twisted_coboundary` for one ring and, for the ring
`O⁺(V_∞) ⊗̂ A°`, the content of
PerfectoidSpaces:P9/integral-coboundary-trivialises-integral-sheaf on sections. -/
theorem twistedInvariants_eq_of_eigenunit (c : G → Rˣ) (F : Rˣ)
    (hF : ∀ γ : G, γ • (F : R) = ((c γ)⁻¹ : Rˣ) * F) (f : R) :
    f ∈ twistedInvariants c ↔ ∃ a ∈ FixedPoints.subring R G, f = F * a := sorry

/-- The averaging idempotent `e = |G|⁻¹ ∑ γ, c γ * γ •` of the twisted action, for a finite group
whose order is invertible: `e_n` of PerfectoidSpaces:P9/finite-level-character-sheaf-comparison,
with the sign of sourceIssues E27. Its value is `twistedAverage_apply`. -/
def twistedAverage [Fintype G] (c : G → Rˣ) (hG : IsUnit (Fintype.card G : R)) :
    R →ₗ[FixedPoints.subring R G] R := sorry

/-- The value of the twisted average. -/
theorem twistedAverage_apply [Fintype G] (c : G → Rˣ) (hG : IsUnit (Fintype.card G : R))
    (f : R) :
    twistedAverage c hG f = ((hG.unit⁻¹ : Rˣ) : R) * ∑ γ : G, (c γ : R) * γ • f := sorry

/-- For a cocycle the twisted average is idempotent. -/
theorem twistedAverage_idempotent [Fintype G] {c : G → Rˣ} (hc : IsTwistCocycle c)
    (hG : IsUnit (Fintype.card G : R)) :
    twistedAverage c hG ∘ₗ twistedAverage c hG = twistedAverage c hG := sorry

/-- For a cocycle the image of the twisted average is the twisted invariants, which are
therefore a direct summand, split by `e`. -/
theorem range_twistedAverage [Fintype G] {c : G → Rˣ} (hc : IsTwistCocycle c)
    (hG : IsUnit (Fintype.card G : R)) :
    LinearMap.range (twistedAverage c hG) = twistedInvariants c := sorry

end TwistedInvariants

/-! ### PerfectoidSpaces:P9/approximation-of-units-at-finite-level, for rings -/

/-- PerfectoidSpaces:P9/approximation-of-units-at-finite-level, for rings. Read `R` as `O(U_∞)`
(with `p` a unit), `Rplus` as `O⁺(U_∞)` (`p`-adically complete) and `Rn n` as `O(U_n)` (a unit
of `R` lying in `Rn n` is a unit of `Rn n`, since `U_∞ → U_n` is surjective), with `⋃ₙ Rn n`
`p`-adically dense in `Rplus`. The bound `|p ^ M| ≤ |p ^ N t| ≤ 1` that quasicompactness of `U`
gives is the hypothesis `ht`. Then `t = t⁽ⁿ⁾ s_n` with `s_n` a unit of `Rn n` and
`t⁽ⁿ⁾ ∈ 1 + p ^ m Rplus`. -/
theorem approximation_of_units_at_finite_level {R : Type*} [CommRing R] (p : ℕ)
    (Rplus : Subring R) (Rn : ℕ → Subring R) (hp : IsUnit (p : R))
    (hcompl : IsAdicComplete (Ideal.span {(p : Rplus)}) Rplus)
    (hRn : ∀ n, ∀ a ∈ Rn n, IsUnit a → ∃ b ∈ Rn n, a * b = 1)
    (hdense : ∀ x ∈ Rplus, ∀ k : ℕ, ∃ n, ∃ y ∈ Rn n, y ∈ Rplus ∧
      ∃ z ∈ Rplus, x - y = (p : R) ^ k * z)
    (t : Rˣ) (N M : ℕ)
    (ht : (p : R) ^ N * t ∈ Rplus ∧ ∃ w ∈ Rplus, (p : R) ^ M = (p : R) ^ N * t * w)
    (m : ℕ) (hm : 1 ≤ m) :
    ∃ n, ∃ s : Rˣ, (s : R) ∈ Rn n ∧ ((s⁻¹ : Rˣ) : R) ∈ Rn n ∧
      ∃ z ∈ Rplus, (t : R) = (1 + (p : R) ^ m * z) * s := sorry

-- finite_level_character_sheaf_comparison: not stated here; needs the character sheaf,
--   O(U_n) ⊗̂ A and Kiehl's theorem (supplier: AdicSpacesPartII:R5, AdicSpacesPartII:R3). Node
--   PerfectoidSpaces:P9/finite-level-character-sheaf-comparison. Its ring-level steps are
--   `twistedInvariantsCongr` (with F = u), `twistedAverage_idempotent`,
--   `range_twistedAverage`, and `finite_galois_descent_of_modules_effective` for the rank-one
--   descent.
-- integral_coboundary_trivialises_integral_sheaf: not stated here; needs ω_c⁺ and integral
--   weight-space descent (supplier: AdicSpacesPartII:R5). Node
--   PerfectoidSpaces:P9/integral-coboundary-trivialises-integral-sheaf. On sections it is
--   `twistedInvariants_eq_of_eigenunit`.
-- coefficient_change_by_regular_element: not stated here; needs character sheaves and their
--   cohomology (supplier: AdicSpacesPartII:R5, AdicSpacesPartII:R3). Node
--   PerfectoidSpaces:P9/coefficient-change-by-regular-element.
-- derived_coefficient_change: not stated here; needs Čech complexes of character sheaves on
--   finite affinoid covers (supplier: AdicSpacesPartII:R3, AdicSpacesPartII:R5). Node
--   PerfectoidSpaces:P9/derived-coefficient-change.
-- profinite_module_coefficient_sheaf: not stated here; needs M ⊗̂ Ô_X on X_proet
--   (supplier: PadicHodgeTheory:P8:local-rational, AdicSpacesPartII:R5). Node
--   PerfectoidSpaces:P9/profinite-module-coefficient-sheaf.
-- higher_inverse_limits_vanish_on_towers: not stated here; needs R lim on X_proet
--   (supplier: PadicHodgeTheory:P8:local-rational). Node
--   PerfectoidSpaces:P9/higher-inverse-limits-vanish-on-towers.

end TorsorDescent

end TauCeti.Perfectoid
