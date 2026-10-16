import Mathlib.Analysis.Normed.Field.Ultra
import Mathlib.FieldTheory.IsAlgClosed.Basic
import Mathlib.Data.Nat.Factorial.Basic
import Mathlib.Topology.Algebra.MulAction
import TauCeti.Topology.Algebra.Group.Profinite.ProP.Basic

/-!
# Étale cohomology of diamonds: suggested milestone statements

This file is not the roadmap and is not exhaustive. The definitive specification is
`research/blueprint/readmes/DiamondEtaleCohomology.md`. These declarations suggest names
and Lean forms; proving them does not by itself complete a layer. The proofs use `sorry`
because these are targets, with unchecked implementation status.

Baseline: Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.

The README specifies all 186 target nodes, their hypotheses, APIs and distinguishing
unit tests. This compact prototype states the C8 field milestones whose actual carriers
exist at the pins. The field, automorphism, product topology, compactness, group action
and pro-p predicate below are existing library objects. There are no geometric supplier
structures here. Definitions of sites, enhancements, dimension invariants and derived
operations are README targets, rather than developments inside this suggested file.

C0–C1: the geometric sites, comparison maps and base-change transformations require the
perfectoid, diamond and small-v-stack carriers owned by PerfectoidSpaces and
DiamondsAndVStacks. A generic Grothendieck topology cannot substitute for these sites.

C2–C3: D_ét, Postnikov completion, coreflection, the four operations and their coherent
adjunctions require the enhanced categories of EnhancedDerivedSheaves. Mathlib's
one-categorical DerivedCategory alone does not express these targets.

C4–C6: properness, the canonical compactification, étale extension by zero, proper base
change and geometric-field invariance use the same absent geometric carriers. Their
precise valuative, coefficient and boundedness hypotheses are in the README.

C7: perfect local systems, constructibility and their descent and filtration targets
require those carriers and the perfect-module suppliers. In particular the named
perfect-local-system-dualizable lemma is a README target, including the canonical
comparison with internal Hom and both triangle identities. It is not modelled by an
arbitrary closed monoidal category with the desired conclusion as input.

C8: the remaining analytic/diamond dimension invariants, spectral chain descent,
point/cohomology comparison and cohomological bounds stay in the README. The abstract
profinite completion, procyclic powers and Sylow theory are imported from their owners;
the first statement below isolates the compactness consequence of the field action.

C9: compact generators and the characterization of compact objects require the genuine
enhanced étale category and one uniform cohomological bound on the stated test basis.
The README keeps these hypotheses; a generic finite-presentation predicate is insufficient.
-/

set_option autoImplicit false

open Filter Topology

namespace TauCeti.DiamondEtale

universe u v

section CompactClosure

variable {C : Type u} [NormedField C] [IsUltrametricDist C] [CompleteSpace C]

/-- C8/compact-procyclic-field-action, compactness consequence.

The README gives the stronger extension to a continuous profinite-integer action and
identifies its image with this closure. No local compactness of `C` is assumed. The
pointwise topology is the existing product topology on `C → C`. -/
theorem isCompact_closure_iterates (γ : C ≃+* C)
    (hiso : Isometry (γ : C → C))
    (hfac : ∀ x : C,
      Tendsto (fun n : ℕ => (γ : C → C)^[n.factorial] x) atTop (𝓝 x)) :
    IsCompact (closure (Set.range fun n : ℕ => (γ : C → C)^[n])) := by
  sorry

/-- The identity is a degenerate test for the compact action statement. -/
example : IsCompact (closure (Set.range fun n : ℕ => (id : C → C)^[n])) := by
  sorry

/-- A norm-preserving finite-order automorphism has the required compact closure. -/
example (γ : C ≃+* C) (hiso : Isometry (γ : C → C))
    (m : ℕ) (hm : 0 < m) (hperiod : (γ : C → C)^[m] = id) :
    IsCompact (closure (Set.range fun n : ℕ => (γ : C → C)^[n])) := by
  sorry

end CompactClosure

section WildAutomorphism

variable {C : Type u} [NontriviallyNormedField C] [IsUltrametricDist C]
  [CompleteSpace C] [IsAlgClosed C]
variable {p : ℕ} [Fact p.Prime] [CharP C p]

/-- C8/wild-automorphism, ECD Lemma 21.17, p.127.

The ratio condition is the actual leading-term congruence. It implies norm preservation;
the compact closure and the uniform residue normalization are detailed in the README. -/
theorem wild_automorphism_prime_powers (γ : C ≃+* C)
    (hcontinuous : Continuous (γ : C → C))
    (hfac : ∀ x : C,
      Tendsto (fun n : ℕ => (γ : C → C)^[n.factorial] x) atTop (𝓝 x))
    (hleading : ∀ x : C, x ≠ 0 → ‖γ x / x - 1‖ < 1) :
    ∀ x : C, Tendsto (fun n : ℕ => (γ : C → C)^[p ^ n] x) atTop (𝓝 x) := by
  sorry

/-- The identity satisfies the leading-term hypothesis, including for every nonzero x. -/
example : ∀ x : C, x ≠ 0 → ‖(RingEquiv.refl C) x / x - 1‖ < 1 := by
  sorry

/-- C8/wild-kernel-pro-p, ECD Proposition 21.16, pp.126–127.

Apply this to the closed kernel of the leading-term action. Faithfulness is essential
for concluding that the group itself, rather than its image, is pro-p. -/
theorem isProP_of_faithful_leading_term_action
    {G : Type v} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    [CompactSpace G] [TotallyDisconnectedSpace G]
    [MulSemiringAction G C] [ContinuousSMul G C] [FaithfulSMul G C]
    (hleading : ∀ (g : G) (x : C), x ≠ 0 → ‖(g • x) / x - 1‖ < 1) :
    TauCeti.IsProP p G := by
  sorry

end WildAutomorphism

end TauCeti.DiamondEtale
