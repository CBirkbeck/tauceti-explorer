/-
This file is not the roadmap and is not exhaustive. The roadmap document is definitive.
The statements suggest Lean forms so that contributors and reviewers converge on names
and signatures. They make no implementation claim for the compactification roadmap.

Part C0 covers ShimuraCompactifications C0, C1, C2, C2.general, C3, C3.general, C4, C5.
This initial checkpoint develops five mathematical targets inside C5. The actual PEL
algebraic-space, good-chart and boundary-stratum carriers are not yet available through
verified pinned interfaces, so those geometric signatures are deliberately NOT replaced
by Prop-valued fields, opaque constants, or arbitrary schemes assumed to satisfy them.

The three examples below reuse existing declarations at:
  Tau Ceti f790474821cf4256814db967cb154e7af3d0c369
  Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174
They are specialization checks, not proofs of the five C5 nodes or new foundational lemmas.
This file was not compiled in the submitting environment.

Geometric signature work still required, with the packet's exact hypotheses:
  C5/neat-boundary-intersection-smooth
  C5/neat-boundary-open-fiberwise-dense
  C5/neat-stratum-closure-component
  C5/neat-stratum-closure-proper
  C5/neat-strata-detect-geometric-components
The last consumes an SF.2 algebraic-space component detector; it does not import B5.
-/

import TauCeti.Geometry.Toric.Algebraic.Fan.Basic
import TauCeti.Algebra.AlgebraicGroup.SplitTorus.Scheme
import TauCeti.AlgebraicGeometry.IrreducibleOfConnectedDomainStalk

open CategoryTheory AlgebraicGeometry
open scoped CategoryTheory.MonObj

noncomputable section

namespace ShimuraCompactificationBlueprint

/-- The existing fan is finite. Reuse it in the finite specialization; do not identify
finiteness of its cones with finiteness of orbits of an arithmetic cone system. -/
example {N V : Type*} [AddCommGroup N] [AddCommGroup V] [Module ℝ V]
    {i : N →+ V} {Φ Ψ : TauCeti.Toric.Fan i}
    (h : Φ.cones = Ψ.cones) : Φ = Ψ := by
  exact TauCeti.Toric.Fan.ext h

/-- The existing split torus is already defined over a commutative base ring.
This example is not the relative torus-torsor embedding or its boundary chart. -/
example : Grp (Over (Spec (CommRingCat.of ℤ))) :=
  TauCeti.SplitTorus.groupScheme ℤ (Fin 2)

/-- Scheme-only specialization. The neat source model is an algebraic space, so this
existing theorem alone does not prove its connected-component or geometric-fiber claims. -/
example (Z : Scheme) [IsLocallyNoetherian Z] [ConnectedSpace Z]
    (hStalks : ∀ x : Z.carrier, IsDomain (Z.presheaf.stalk x)) :
    IrreducibleSpace Z := by
  exact TauCeti.AlgebraicGeometry.irreducibleSpace_of_connected_of_isDomain_stalk Z hStalks

end ShimuraCompactificationBlueprint
