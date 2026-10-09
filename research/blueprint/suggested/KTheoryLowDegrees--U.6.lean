/-
This file is not the roadmap and is not exhaustive. The roadmap document
KTheoryLowDegrees--U.6.md is definitive. These statements suggest Lean forms
so contributors and reviewers converge on names and signatures. All bodies
are planning placeholders; no declaration is claimed implemented.

Baseline: Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.
The active forms need only Mathlib. Existing parent nodes are imported in the
plan by ID, rather than redefined here. Generic plus, fibre, group-completion,
spectrum and graded-Picard carriers are the named owners' work.
-/
import Mathlib.RingTheory.LocalRing.Pullback
import Mathlib.LinearAlgebra.Matrix.GeneralLinearGroup.Defs
import Mathlib.GroupTheory.QuotientGroup.Basic
import Mathlib.Data.ZMod.Basic

set_option autoImplicit false

noncomputable section
namespace TauCeti.KTheory.LowDegreeComparison
variable {A C : Type*} [Ring A] [Ring C]
variable (q : A →+* C) (n : Type*) [Fintype n] [DecidableEq n]

/-- Node KTheoryLowDegrees:U.6/double-congruence-mulEquiv.
Second projection on compatible-pair matrix units; inverse is entrywise (1,g).
This is over arbitrary associative rings, with no surjectivity hypothesis. -/
def double_congruence_mulEquiv :
    (Units.map ((RingHom.pullbackFst q q).mapMatrix (m := n)).toMonoidHom).ker ≃*
      (Units.map (q.mapMatrix (m := n)).toMonoidHom).ker := by sorry

/-- Promoted API / node KTheoryLowDegrees:U.6/double-congruence-apply. -/
lemma double_congruence_apply
    (g : (Units.map ((RingHom.pullbackFst q q).mapMatrix (m := n)).toMonoidHom).ker) :
    ((double_congruence_mulEquiv q n g).val : (Matrix n n A)ˣ) =
      Units.map ((RingHom.pullbackSnd q q).mapMatrix (m := n)).toMonoidHom g.val := by sorry

/-- API TauCeti.KTheory.LowDegreeComparison.double_congruence_symm_fst. -/
lemma double_congruence_symm_fst
    (g : (Units.map (q.mapMatrix (m := n)).toMonoidHom).ker) :
    Units.map ((RingHom.pullbackFst q q).mapMatrix (m := n)).toMonoidHom
      ((double_congruence_mulEquiv q n).symm g).val = 1 := by sorry

/-- API TauCeti.KTheory.LowDegreeComparison.double_congruence_symm_snd. -/
lemma double_congruence_symm_snd
    (g : (Units.map (q.mapMatrix (m := n)).toMonoidHom).ker) :
    Units.map ((RingHom.pullbackSnd q q).mapMatrix (m := n)).toMonoidHom
      ((double_congruence_mulEquiv q n).symm g).val = g.val := by sorry

-- TEST TauCeti.KTheory.LowDegreeComparison.double_congruence_one_test [degenerate].
example : double_congruence_mulEquiv q n 1 = 1 := by sorry
-- TEST TauCeti.KTheory.LowDegreeComparison.double_congruence_empty_test [degenerate].
example (g : (Units.map ((RingHom.pullbackFst q q).mapMatrix (m := Fin 0)).toMonoidHom).ker) :
    double_congruence_mulEquiv q (Fin 0) g = 1 := by sorry
-- TEST TauCeti.KTheory.LowDegreeComparison.double_congruence_identity_test [characterisation].
example (g : (Units.map ((RingHom.pullbackFst (RingHom.id A) (RingHom.id A)).mapMatrix (m := n)).toMonoidHom).ker) :
    double_congruence_mulEquiv (RingHom.id A) n g = 1 := by sorry

-- TEST TauCeti.KTheory.LowDegreeComparison.double_congruence_mod_four_test [non-example].
-- The second coordinate is 3, the first is 1; this detects a reversed projection.
example : let q₄₂ := ZMod.castHom (by decide : 2 ∣ 4) (ZMod 2)
    ∃ g : (Units.map (q₄₂.mapMatrix (m := Fin 1)).toMonoidHom).ker,
      ((((double_congruence_mulEquiv q₄₂ (Fin 1)).symm g).val.val 0 0).val) =
        (1, 3) := by sorry
end TauCeti.KTheory.LowDegreeComparison

/-!
## Explicit omissions at the pinned baseline

The following declarations have exact mathematical statements and supplier
contracts in the packet. Their needed conditions cannot yet be stated with
baseline types: stable GL, relative K₁ and ring K₀ are the parent's planned
carriers; K-spaces/fibres, group-completion units, connective spectra and the
signed graded-Picard groupoid are supplier carriers. No unrelated type or
proposition-valued substitute is used. Each omission gives its proposed name,
mathematical statement, and direct prerequisites, so the file-to-packet map is
exhaustive without claiming these signatures elaborate.

For the spectrum determinant API, the intended binders are a commutative ring R,
the already owned spectrum map Det_R, its unit-compatible model comparison θ_R,
and the already owned unit identification for π₁ of Pic^ℤ(Spec R). Its intended
result is equality of homomorphisms d_R ∘ θ_R = det_R, with domain classical K₁(R)
and codomain Rˣ. A fresh arbitrary map on a made-up π₁ carrier is not this API.
-/


/-
OMITTED NODE KTheoryLowDegrees:U.6/double-congruence-stable
Proposed declaration: TauCeti.KTheory.LowDegreeComparison.double_congruence_stable
Target: For q:A→C, c_{q,n+1}(diag(g,1))=diag(c_{q,n}(g),1). Thus the finite-rank equivalences induce the second-projection equivalence c_q:GL(D_q,ker pr)≃GL(A,ker q) of stable congruence groups.
Prerequisites:
  KTheoryLowDegrees:U.6/double-congruence-apply
  KTheoryLowDegrees:U.1/stabilisation-map
  KTheoryLowDegrees:U.1/stable-general-linear-group
  KTheoryLowDegrees:U.1/finite-representatives
  KTheoryLowDegrees:U.1/stable-equality-criterion
  KTheoryLowDegrees:U.5/congruence-subgroup
Reason: The parent stable matrix/relative elementary/K₁ carriers do not exist in the pinned library. Finite matrix units above supply the expressible algebraic interface.
-/

/-
OMITTED NODE KTheoryLowDegrees:U.6/double-elementary-image
Proposed declaration: TauCeti.KTheory.LowDegreeComparison.double_elementary_image
Target: Let A be an associative unital ring, I a two-sided ideal, D=A⊕I and J=ker pr. Under c_q, the image of E(D,J) is exactly E(A,I), where each relative elementary subgroup is the normal closure of the ideal-entry elementary matrices inside its ambient stable elementary group.
Prerequisites:
  KTheoryLowDegrees:U.6/double-congruence-stable
  KTheoryLowDegrees:U.5/augmented-double-ring
  KTheoryLowDegrees:U.5/relative-elementary-subgroup
  KTheoryLowDegrees:U.5/relative-elementary-stable-normal
  KTheoryLowDegrees:U.1/elementary-surjective-map
Reason: The parent stable matrix/relative elementary/K₁ carriers do not exist in the pinned library. Finite matrix units above supply the expressible algebraic interface.
-/

/-
OMITTED NODE KTheoryLowDegrees:U.6/double-relative-quotient
Proposed declaration: TauCeti.KTheory.LowDegreeComparison.double_relative_quotient
Target: For any associative unital A and two-sided I, second projection induces an isomorphism a_{A,I}:K₁(D,J)≃K₁(A,I), sending the class of a double congruence matrix to the class of its second projection. Here D=A⊕I and J=ker pr.
Prerequisites:
  KTheoryLowDegrees:U.6/double-elementary-image
  KTheoryLowDegrees:U.5/relative-K1
Reason: The parent stable matrix/relative elementary/K₁ carriers do not exist in the pinned library. Finite matrix units above supply the expressible algebraic interface.
-/

/-
OMITTED NODE KTheoryLowDegrees:U.6/double-fibre-pi-one-kernel
Proposed declaration: TauCeti.KTheory.LowDegreeComparison.double_fibre_pi_one_kernel
Target: For D=A⊕I, pr:D→A and Δ its section, put F_D=hofib(K(pr)) at zero. Inclusion gives π₁F_D≃ker(K₁(pr):K₁(D)→K₁(A)). Combined with U.5/relative-K1-split, denote by s₁:K₁(D,J)≃π₁F_D the inverse identification, compatible with inclusion in K₁(D).
Prerequisites:
  GeneralAlgebraicKTheory:K.2:plus/plus-equals-Q
  StableHomotopyKTheory:H.4/gl-plus-comparison-naturality
  StableHomotopyKTheory:H.2/homotopy-fibre-and-long-exact-sequence
  StableHomotopyKTheory:H.2/long-exact-sequence
  KTheoryLowDegrees:U.6/pi1-plus-construction
  KTheoryLowDegrees:U.5/relative-K1-split
  KTheoryLowDegrees:U.5/augmented-double-ring
  GeneralAlgebraicKTheory:K.5/relative-K-theory
  GeneralAlgebraicKTheory:K.2/functorial-K-theory-of-a-ring
Reason: The named owners' K-space, homotopy-fibre, homotopy-group and classical relative-group carriers are unavailable at the pinned baseline. The packet specifies the proof and supplier obligations.
-/

/-
OMITTED NODE KTheoryLowDegrees:U.6/double-fibre-pi-zero-kernel
Proposed declaration: TauCeti.KTheory.LowDegreeComparison.double_fibre_pi_zero_kernel
Target: For the same D and F_D, inclusion gives π₀F_D≃ker(K₀(pr):K₀(D)→K₀(A))=K₀(I). Let s₀:K₀(I)≃π₀F_D be its inverse. The group operation on π₀F_D is the functorial K-space operation.
Prerequisites:
  GeneralAlgebraicKTheory:K.2:plus/plus-equals-Q
  StableHomotopyKTheory:H.4/gl-plus-comparison-naturality
  StableHomotopyKTheory:H.2/homotopy-fibre-and-long-exact-sequence
  StableHomotopyKTheory:H.2/long-exact-sequence
  KTheoryLowDegrees:U.5/relative-K0-of-ideal
  KTheoryLowDegrees:U.5/augmented-double-ring
  StableHomotopyKTheory:H.4/S-inverse-S-pi0
  GeneralAlgebraicKTheory:K.5/relative-K-theory
  GeneralAlgebraicKTheory:K.2/functorial-K-theory-of-a-ring
Reason: The named owners' K-space, homotopy-fibre, homotopy-group and classical relative-group carriers are unavailable at the pinned baseline. The packet specifies the proof and supplier obligations.
-/

/-
OMITTED NODE KTheoryLowDegrees:U.6/double-fibre-pi-zero-comparison
Proposed declaration: TauCeti.KTheory.LowDegreeComparison.double_fibre_pi_zero_comparison
Target: Let q:A→A/I and ω:F_D→F_q be the map on based homotopy fibres induced by the square with top pr:D→A, bottom q:A→A/I, left add:D→A and right q:A→A/I, where q add=q pr. Then π₀ω:π₀F_D→π₀F_q is an isomorphism of abelian groups.
Prerequisites:
  GeneralAlgebraicKTheory:K.2:plus/plus-equals-Q
  StableHomotopyKTheory:H.4/gl-plus-comparison-naturality
  StableHomotopyKTheory:H.2/homotopy-fibre-and-long-exact-sequence
  StableHomotopyKTheory:H.2/long-exact-sequence
  KTheoryLowDegrees:U.5/augmented-double-ring
  KTheoryLowDegrees:U.6/double-fibre-pi-zero-kernel
  KTheoryLowDegrees:U.5/ideal-sequence-degree-zero
  GeneralAlgebraicKTheory:K.5/relative-K-theory
  GeneralAlgebraicKTheory:K.2/functorial-K-theory-of-a-ring
Reason: The named owners' K-space, homotopy-fibre, homotopy-group and classical relative-group carriers are unavailable at the pinned baseline. The packet specifies the proof and supplier obligations.
-/

/-
OMITTED NODE KTheoryLowDegrees:U.6/double-fibre-pi-one-comparison
Proposed declaration: TauCeti.KTheory.LowDegreeComparison.double_fibre_pi_one_comparison
Target: For the same square and specified fibre map ω, π₁ω:π₁F_D→π₁F_q is an isomorphism of groups. This assertion is only about degree one; the square is not asserted to be homotopy cartesian.
Prerequisites:
  GeneralAlgebraicKTheory:K.2:plus/plus-equals-Q
  StableHomotopyKTheory:H.4/gl-plus-comparison-naturality
  StableHomotopyKTheory:H.2/homotopy-fibre-and-long-exact-sequence
  StableHomotopyKTheory:H.2/long-exact-sequence
  KTheoryLowDegrees:U.5/augmented-double-ring
  KTheoryLowDegrees:U.6/double-relative-quotient
  KTheoryLowDegrees:U.6/double-fibre-pi-one-kernel
  GeneralAlgebraicKTheory:K.5/relative-K-theory
  GeneralAlgebraicKTheory:K.2/functorial-K-theory-of-a-ring
Reason: The named owners' K-space, homotopy-fibre, homotopy-group and classical relative-group carriers are unavailable at the pinned baseline. The packet specifies the proof and supplier obligations.
-/

/-
OMITTED NODE KTheoryLowDegrees:U.6/relative-pi-zero
Proposed declaration: TauCeti.KTheory.LowDegreeComparison.relative_pi_zero
Target: Define ε₀:K₀(I)≃π₀F_q as π₀ω composed with s₀. Its domain is the kernel in K₀(A⊕I), and its codomain is the component group of the zero-based fibre, not merely ker(K₀(A)→K₀(A/I)).
Prerequisites:
  KTheoryLowDegrees:U.6/double-fibre-pi-zero-kernel
  KTheoryLowDegrees:U.6/double-fibre-pi-zero-comparison
Reason: The named owners' K-space, homotopy-fibre, homotopy-group and classical relative-group carriers are unavailable at the pinned baseline. The packet specifies the proof and supplier obligations.
-/

/-
OMITTED NODE KTheoryLowDegrees:U.6/relative-pi-one
Proposed declaration: TauCeti.KTheory.LowDegreeComparison.relative_pi_one
Target: Define ε₁:K₁(A,I)≃π₁F_q as π₁ω composed with s₁ and a_{A,I}^{−1}. Its direction sends the class of a congruence matrix to its based fibre loop.
Prerequisites:
  KTheoryLowDegrees:U.6/double-relative-quotient
  KTheoryLowDegrees:U.6/double-fibre-pi-one-kernel
  KTheoryLowDegrees:U.6/double-fibre-pi-one-comparison
Reason: The named owners' K-space, homotopy-fibre, homotopy-group and classical relative-group carriers are unavailable at the pinned baseline. The packet specifies the proof and supplier obligations.
-/

/-
OMITTED NODE KTheoryLowDegrees:U.6/relative-pi-zero-natural
Proposed declaration: TauCeti.KTheory.LowDegreeComparison.relative_pi_zero_natural
Target: For a unital φ:A→B carrying the two-sided ideal I into J, the square ε₀ ∘ classical relative map(φ) = π₀(F_φ) ∘ ε₀ commutes. The classical source is K₀(I); F_φ is the map induced by the quotient square with the chosen coherent basepoints.
Prerequisites:
  KTheoryLowDegrees:U.6/relative-pi-zero
  KTheoryLowDegrees:U.5/augmented-double-ring
  KTheoryLowDegrees:U.5/relative-K0-of-ideal
  StableHomotopyKTheory:H.4/gl-plus-comparison-naturality
  StableHomotopyKTheory:H.2/homotopy-fibre-and-long-exact-sequence
Reason: The named owners' K-space, homotopy-fibre, homotopy-group and classical relative-group carriers are unavailable at the pinned baseline. The packet specifies the proof and supplier obligations.
-/

/-
OMITTED NODE KTheoryLowDegrees:U.6/relative-pi-one-natural
Proposed declaration: TauCeti.KTheory.LowDegreeComparison.relative_pi_one_natural
Target: For a unital φ:A→B carrying the two-sided ideal I into J, the square ε₁ ∘ classical relative map(φ) = π₁(F_φ) ∘ ε₁ commutes. The classical source is K₁(A,I); F_φ is the map induced by the quotient square with the chosen coherent basepoints.
Prerequisites:
  KTheoryLowDegrees:U.6/relative-pi-one
  KTheoryLowDegrees:U.5/augmented-double-ring
  KTheoryLowDegrees:U.5/relative-K1
  StableHomotopyKTheory:H.4/gl-plus-comparison-naturality
  StableHomotopyKTheory:H.2/homotopy-fibre-and-long-exact-sequence
Reason: The named owners' K-space, homotopy-fibre, homotopy-group and classical relative-group carriers are unavailable at the pinned baseline. The packet specifies the proof and supplier obligations.
-/

/-
OMITTED NODE KTheoryLowDegrees:U.6/relative-pi-one-inclusion
Proposed declaration: TauCeti.KTheory.LowDegreeComparison.relative_pi_one_inclusion
Target: Inclusion j_q:F_q→K(A) satisfies π₁(j_q) ε₁ = θ_A ι, where ι:K₁(A,I)→K₁(A) is the classical map and θ_A:K₁(A)≃π₁K(A) is the imported absolute comparison.
Prerequisites:
  KTheoryLowDegrees:U.6/relative-pi-one
  KTheoryLowDegrees:U.6/double-congruence-apply
  KTheoryLowDegrees:U.5/relative-sequence-degree-one
  KTheoryLowDegrees:U.6/pi1-plus-construction
  StableHomotopyKTheory:H.2/homotopy-fibre-and-long-exact-sequence
Reason: The named owners' K-space, homotopy-fibre, homotopy-group and classical relative-group carriers are unavailable at the pinned baseline. The packet specifies the proof and supplier obligations.
-/

/-
OMITTED NODE KTheoryLowDegrees:U.6/relative-pi-zero-inclusion
Proposed declaration: TauCeti.KTheory.LowDegreeComparison.relative_pi_zero_inclusion
Target: Inclusion j_q:F_q→K(A) satisfies π₀(j_q) ε₀ = K₀(add)|_{K₀(I)}, with the canonical identification π₀K(A)=K₀(A).
Prerequisites:
  KTheoryLowDegrees:U.6/relative-pi-zero
  KTheoryLowDegrees:U.5/relative-K0-of-ideal
  StableHomotopyKTheory:H.4/S-inverse-S-pi0
  StableHomotopyKTheory:H.2/homotopy-fibre-and-long-exact-sequence
Reason: The named owners' K-space, homotopy-fibre, homotopy-group and classical relative-group carriers are unavailable at the pinned baseline. The packet specifies the proof and supplier obligations.
-/

/-
OMITTED NODE KTheoryLowDegrees:U.6/relative-boundary-one
Proposed declaration: TauCeti.KTheory.LowDegreeComparison.relative_boundary_one
Target: Let ∂₁^W:π₁K(A/I)→π₀F_q be the homotopy boundary transported from the K-book zero-to-image path convention into the H.2 image-to-zero fibre by its path-reversal homeomorphism. The target equation is ε₀ δ_I = ∂₁^W θ_{A/I}. Here δ_I is U.5/ideal-boundary, whose image in K₀(D) is [FreePatch(a)]−n[D] for the fixed gluing convention. The formula relating ∂₁^W to H.2’s own loop-inclusion boundary, including its sign, is part of the recorded proof obligation; ε₀ remains the previously specified split-kernel comparison.
Prerequisites:
  KTheoryLowDegrees:U.6/relative-pi-zero
  KTheoryLowDegrees:U.5/ideal-boundary
  KTheoryLowDegrees:U.6/pi1-plus-construction
  StableHomotopyKTheory:H.2/homotopy-fibre-and-long-exact-sequence
  StableHomotopyKTheory:H.2/long-exact-sequence
Reason: The named owners' K-space, homotopy-fibre, homotopy-group and classical relative-group carriers are unavailable at the pinned baseline. The packet specifies the proof and supplier obligations.
-/

/-
OMITTED NODE KTheoryLowDegrees:U.6/relative-boundary-two
Proposed declaration: TauCeti.KTheory.LowDegreeComparison.relative_boundary_two
Target: Let β:K₂(A/I)→K₁(A,I) be the classical relative Steinberg boundary of Theorem III.5.7.1, using the T.6 conventions. Let κ_{A/I}:K₂(A/I)≃π₂K(A/I) be T.1’s plus comparison. Let ∂₂^W be the topological boundary transported by the same path-reversal convention as relative-boundary-one. The target equation is ε₁ β = ∂₂^W κ_{A/I}; its relation to H.2’s loop-inclusion orientation must be computed, not inferred from exactness. This is an equality of homomorphisms to π₁F_q.
Prerequisites:
  KTheoryLowDegrees:U.6/relative-pi-one
  StableHomotopyKTheory:H.2/long-exact-sequence
  StableHomotopyKTheory:H.2/homotopy-fibre-and-long-exact-sequence
  K2SymbolsBrauer:T.1:plus
  K2SymbolsBrauer:T.6
  K2SymbolsBrauer:T.1/k2-pi2
  K2SymbolsBrauer:T.6/relative-steinberg-group
Reason: The named owners' K-space, homotopy-fibre, homotopy-group and classical relative-group carriers are unavailable at the pinned baseline. The packet specifies the proof and supplier obligations.
-/

/-
OMITTED NODE KTheoryLowDegrees:U.6/graded-det-free-map
Proposed declaration: TauCeti.GradedDeterminant.projective_graded_det_free_map
Target: For a commutative unital ring R and g∈GL_n(R), the morphism Det^ℤ(g) of the graded line Det^ℤ(Rⁿ) acts on its determinant line by multiplication by det(g)∈Rˣ. The grade is n on every point of Spec R, and this assertion concerns morphisms rather than only Picard classes.
Prerequisites:
  KTheoryLowDegrees:Z.3/projective-graded-det
  KTheoryLowDegrees:Z.3/projective-exterior-power
  KTheoryLowDegrees:Z.3/determinant-projective
  KTheoryLowDegrees:Z.3/determinant-free
  mathlib:Matrix.GeneralLinearGroup.det
Reason: The projective graded determinant, its connective spectrum map, group-completion unit and unit-compatible model comparison are the named suppliers' planned types and maps, unavailable at the pinned baseline.
-/

/-
OMITTED NODE KTheoryLowDegrees:U.6/graded-det-translated-loop
Proposed declaration: TauCeti.GradedDeterminant.ring_spectrum_det_automorphism_loop
Target: Let R be commutative and P finite projective. An automorphism α:P≃P gives a loop at [P] under the group-completion unit η:N(iso P(R))→Ω∞K(R). Translate this loop to the zero component by the inverse of η(P), using the coherent grouplike law, and write ℓ_P(α)∈π₁K(R). Then Det_R sends it to the unit corresponding to Det^ℤ(α):Aut(Det^ℤ(P))≃Rˣ. The target translation tensors with the inverse graded line, so its basepoint is (R,0).
Prerequisites:
  KTheoryLowDegrees:Z.3/projective-graded-det
  KTheoryLowDegrees:Z.3/ring-spectrum-det
  KTheoryLowDegrees:Z.3/graded-line-automorphisms
  KTheoryLowDegrees:Z.3/graded-line-inverse
  StableHomotopyKTheory:H.4/group-completion-adjunction
  StableHomotopyKTheory:H.5:spectra/grouplike-einfty-connective-spectra
  StableHomotopyKTheory:H.5:spectra/picard-one-truncated-spectra
  StableHomotopyKTheory:H.3/hspace-is-abelian
Reason: The projective graded determinant, its connective spectrum map, group-completion unit and unit-compatible model comparison are the named suppliers' planned types and maps, unavailable at the pinned baseline.
-/

/-
OMITTED NODE KTheoryLowDegrees:U.6/matrix-loop-model-comparison
Proposed declaration: TauCeti.GradedDeterminant.ring_spectrum_matrix_loop_comparison
Target: For commutative R and g∈GL_n(R), the translated free-module automorphism loop ℓ_{Rⁿ}(g) in the spectrum group-completion model equals θ_R([g]) after the specified zero-component comparison with the plus/Q model. The map θ_R is the existing classical K₁-to-π₁ comparison. This statement requires a comparison under the projective nerve, not an unspecified equivalence of spaces.
Prerequisites:
  KTheoryLowDegrees:U.6/pi1-plus-construction
  GeneralAlgebraicKTheory:K.2:plus/plus-equals-Q
  StableHomotopyKTheory:H.4/cofinality-projective-modules
  StableHomotopyKTheory:H.4/gl-plus-comparison-naturality
  StableHomotopyKTheory:H.4/group-completion-adjunction
  GeneralAlgebraicKTheory:K.4:construction
Reason: The projective graded determinant, its connective spectrum map, group-completion unit and unit-compatible model comparison are the named suppliers' planned types and maps, unavailable at the pinned baseline.
-/

/-
OMITTED NODE KTheoryLowDegrees:U.6/ring-spectrum-det-pi-one
Proposed declaration: TauCeti.GradedDeterminant.ring_spectrum_det_pi_one
Target: For every commutative unital ring R, let d_R:π₁K(R)→Rˣ be π₁(Det_R) followed by π₁Pic^ℤ(Spec R)≃Aut((R,0))≃Rˣ, and let θ_R:K₁(R)≃π₁K(R) be the specified zero-component comparison. As group homomorphisms, d_R ∘ θ_R = det_R:K₁(R)→Rˣ. In particular d_R(θ_R([g]))=Matrix.GeneralLinearGroup.det(g) for every finite matrix unit g. This promotes the exact used Z.3/ring-spectrum-det π₁ API to a node; it creates no new determinant map.
Prerequisites:
  KTheoryLowDegrees:U.6/graded-det-free-map
  KTheoryLowDegrees:U.6/graded-det-translated-loop
  KTheoryLowDegrees:U.6/matrix-loop-model-comparison
  KTheoryLowDegrees:U.1/finite-representatives
  KTheoryLowDegrees:U.2/K1
  KTheoryLowDegrees:U.3/stable-determinant
  KTheoryLowDegrees:U.6/pi1-plus-determinant
  KTheoryLowDegrees:Z.3/ring-spectrum-det
  KTheoryLowDegrees:Z.3/graded-line-automorphisms
Reason: The projective graded determinant, its connective spectrum map, group-completion unit and unit-compatible model comparison are the named suppliers' planned types and maps, unavailable at the pinned baseline.
-/

/-
OMITTED NODE KTheoryLowDegrees:U.6/projective-loop-class
Proposed declaration: TauCeti.GradedDeterminant.ring_spectrum_det_projective_loop
Target: For commutative R, a finite projective R-module P and α∈Aut_R(P), the translated loop ℓ_P(α) satisfies ℓ_P(α)=θ_R(autClass(P,α)). Consequently d_R(ℓ_P(α)) is the scalar by which the top exterior automorphism acts on det(P), and equals det_R(autClass(P,α)).
Prerequisites:
  KTheoryLowDegrees:U.6/matrix-loop-model-comparison
  KTheoryLowDegrees:U.6/graded-det-translated-loop
  KTheoryLowDegrees:U.6/ring-spectrum-det-pi-one
  KTheoryLowDegrees:U.2/automorphism-class
  KTheoryLowDegrees:U.2/automorphism-class-independence
  KTheoryLowDegrees:U.2/automorphism-class-direct-sum
  KTheoryLowDegrees:Z.1/free-summand-data
Reason: The projective graded determinant, its connective spectrum map, group-completion unit and unit-compatible model comparison are the named suppliers' planned types and maps, unavailable at the pinned baseline.
-/

/-
OMITTED NODE KTheoryLowDegrees:U.6/ring-spectrum-det-pi-one-natural
Proposed declaration: TauCeti.GradedDeterminant.ring_spectrum_det_pi_one_natural
Target: For a commutative ring map f:R→S, the homomorphisms d satisfy d_S ∘ π₁K(f)=fˣ ∘ d_R, and θ_S ∘ K₁(f)=π₁K(f) ∘ θ_R. Thus the determinant comparison square commutes under scalar extension, for all components translated coherently to zero.
Prerequisites:
  KTheoryLowDegrees:U.6/ring-spectrum-det-pi-one
  KTheoryLowDegrees:U.2/K1-map
  KTheoryLowDegrees:U.6/pi1-plus-construction
  KTheoryLowDegrees:Z.3/ring-spectrum-det
  KTheoryLowDegrees:Z.3/projective-graded-det
  StableHomotopyKTheory:H.4/gl-plus-comparison-naturality
Reason: The projective graded determinant, its connective spectrum map, group-completion unit and unit-compatible model comparison are the named suppliers' planned types and maps, unavailable at the pinned baseline.
-/

/-
OMITTED NODE KTheoryLowDegrees:U.6/ring-spectrum-transfer-pi-one
Proposed declaration: TauCeti.GradedDeterminant.ring_spectrum_det_transfer_pi_one
Target: Let R→B be a map of commutative rings with B finite free as a right R-module, with a chosen basis b. Let t:K₁(B)→K₁(R) be the classical transfer and T:K(B)→K(R) the K-space restriction-of-scalars map from the owning K-theory roadmap. Then d_R π₁(T) θ_B = det_R t. On g∈GL_n(B), this is the determinant over R of the restriction matrix in the induced basis bⁿ; no identification with a group homomorphism Bˣ→Rˣ is used without a norm theorem.
Prerequisites:
  KTheoryLowDegrees:U.6/ring-spectrum-det-pi-one
  KTheoryLowDegrees:U.6/pi1-plus-transfer
  KTheoryLowDegrees:U.5/transfer
  GeneralAlgebraicKTheory:K.3/transfer-maps-and-projection-formula
Reason: The projective graded determinant, its connective spectrum map, group-completion unit and unit-compatible model comparison are the named suppliers' planned types and maps, unavailable at the pinned baseline.
-/

/-
INHERITED TARGETS (not redeclared):
  KTheoryLowDegrees:U.6/pi1-plus-construction
  KTheoryLowDegrees:U.6/pi1-plus-determinant
  KTheoryLowDegrees:U.6/pi1-plus-transfer
  KTheoryLowDegrees:U.6/relative-K1-homotopy-comparison
  KTheoryLowDegrees:U.6/euclidean-elementary-generation
  KTheoryLowDegrees:U.6/localised-integers-euclidean
  KTheoryLowDegrees:U.6/K1-integers
  KTheoryLowDegrees:U.6/K1-finite-field
  KTheoryLowDegrees:U.6/units-of-integers-away-from-p
  KTheoryLowDegrees:U.6/K1-integers-away-from-p
  KTheoryLowDegrees:U.6/K1-product-of-fields
  KTheoryLowDegrees:U.6/triangular-determinant-class
  KTheoryLowDegrees:U.6/diagonal-inverse-pair-test
  KTheoryLowDegrees:U.6/uniformiser-boundary-one
The accepted parent owns these statements, signatures and tests. Its bundled
relative comparison is refined by the nodes above, without duplicating its ID.
-/
