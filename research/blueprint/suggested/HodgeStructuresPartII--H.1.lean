import Mathlib.RepresentationTheory.Irreducible
import Mathlib.LinearAlgebra.Matrix.GeneralLinearGroup.Defs
import Mathlib.Analysis.Complex.Basic

/-!
This file is not the roadmap and is not exhaustive. The roadmap document is definitive.
The statements suggest Lean forms so that contributors and reviewers converge on names
and signatures. This is a signature prototype; no implementation is claimed.

The native portion uses the actual matrix group, Representation.IsIrreducible and
Representation.Equiv. Its quotient is a set of stable representation classes. It supplies
no scheme, analytic space, topology, family functor or nonreduced structure.
The omission inventory at the end records signatures whose actual supplier carriers
are not available. No geometric condition is replaced by an opaque proposition.
-/

noncomputable section

namespace TauCeti.NonabelianHodge

variable {Γ : Type*} [Group Γ]

/-- Coordinate adapter to the native representation carrier. -/
def matrixRepresentation (r : ℕ)
    (ρ : Γ →* Matrix.GeneralLinearGroup (Fin r) ℂ) :
    Representation ℂ Γ (Fin r → ℂ) :=
  (Units.coeHom _).comp
    ((Matrix.GeneralLinearGroup.toLin (n := Fin r) (R := ℂ)).toMonoidHom.comp ρ)

/-- Fixed determinant is an equality of characters. Stability includes nonzero dimension. -/
structure BettiStableRepresentation (Γ : Type*) [Group Γ] (r : ℕ) (δ : Γ →* ℂˣ) where
  hom : Γ →* Matrix.GeneralLinearGroup (Fin r) ℂ
  fixedDeterminant : Matrix.GeneralLinearGroup.det.comp hom = δ
  irreducible : Representation.IsIrreducible (matrixRepresentation r hom)

namespace BettiStableRepresentation

variable {r : ℕ} {δ : Γ →* ℂˣ}

def toRepresentation (ρ : BettiStableRepresentation Γ r δ) :
    Representation ℂ Γ (Fin r → ℂ) := matrixRepresentation r ρ.hom

theorem det_eq (ρ : BettiStableRepresentation Γ r δ) (γ : Γ) :
    Matrix.GeneralLinearGroup.det (ρ.hom γ) = δ γ := by
  sorry

theorem ext (ρ σ : BettiStableRepresentation Γ r δ) (h : ρ.hom = σ.hom) : ρ = σ := by
  sorry

def rankOne (δ : Γ →* ℂˣ) : BettiStableRepresentation Γ 1 δ := by
  sorry

theorem iso_iff_conjugate (ρ σ : BettiStableRepresentation Γ r δ) :
    Nonempty (ρ.toRepresentation.Equiv σ.toRepresentation) ↔
      ∃ g : Matrix.GeneralLinearGroup (Fin r) ℂ,
        ∀ γ : Γ, σ.hom γ = g * ρ.hom γ * g⁻¹ := by
  sorry

-- BettiStableRepresentation.rankOne_det
example (δ : Γ →* ℂˣ) (γ : Γ) :
    Matrix.GeneralLinearGroup.det ((rankOne δ).hom γ) = δ γ := by
  sorry

-- BettiStableRepresentation.rankZero_empty
example (δ : Γ →* ℂˣ) : IsEmpty (BettiStableRepresentation Γ 0 δ) := by
  sorry

-- BettiStableRepresentation.irreducible_native
example (ρ : BettiStableRepresentation Γ r δ) :
    Representation.IsIrreducible ρ.toRepresentation := by
  sorry

-- BettiStableRepresentation.trivial_rankTwo_excluded
example (δ : Γ →* ℂˣ) :
    ¬ ∃ ρ : BettiStableRepresentation Γ 2 δ, ρ.hom = 1 := by
  sorry

end BettiStableRepresentation

def bettiStableSetoid (Γ : Type*) [Group Γ] (r : ℕ) (δ : Γ →* ℂˣ) :
    Setoid (BettiStableRepresentation Γ r δ) where
  r ρ σ := Nonempty (ρ.toRepresentation.Equiv σ.toRepresentation)
  iseqv := by
    sorry

/-- This is the ordinary set quotient, not a stand-in for the coarse moduli scheme. -/
def BettiStableClasses (Γ : Type*) [Group Γ] (r : ℕ) (δ : Γ →* ℂˣ) :=
  Quotient (bettiStableSetoid Γ r δ)

namespace BettiStableClasses

variable {r : ℕ} {δ : Γ →* ℂˣ}

def mk (ρ : BettiStableRepresentation Γ r δ) : BettiStableClasses Γ r δ :=
  Quotient.mk (bettiStableSetoid Γ r δ) ρ

theorem mk_eq_mk (ρ σ : BettiStableRepresentation Γ r δ) :
    mk ρ = mk σ ↔ Nonempty (ρ.toRepresentation.Equiv σ.toRepresentation) := by
  sorry

def lift {T : Sort*} (f : BettiStableRepresentation Γ r δ → T)
    (hf : ∀ ρ σ, Nonempty (ρ.toRepresentation.Equiv σ.toRepresentation) → f ρ = f σ) :
    BettiStableClasses Γ r δ → T := by
  sorry

theorem lift_mk {T : Sort*} (f : BettiStableRepresentation Γ r δ → T)
    (hf : ∀ ρ σ, Nonempty (ρ.toRepresentation.Equiv σ.toRepresentation) → f ρ = f σ)
    (ρ : BettiStableRepresentation Γ r δ) : lift f hf (mk ρ) = f ρ := by
  sorry

theorem lift_unique {T : Sort*} (f g : BettiStableClasses Γ r δ → T)
    (h : ∀ ρ, f (mk ρ) = g (mk ρ)) : f = g := by
  sorry

def rankOne_equiv (δ : Γ →* ℂˣ) : BettiStableClasses Γ 1 δ ≃ PUnit := by
  sorry

-- BettiStableClasses.rankOne_subsingleton
example (δ : Γ →* ℂˣ) (a b : BettiStableClasses Γ 1 δ) : a = b := by
  sorry

-- BettiStableClasses.rankZero_empty
example (δ : Γ →* ℂˣ) : IsEmpty (BettiStableClasses Γ 0 δ) := by
  sorry

-- BettiStableClasses.native_iso_identification
example (ρ σ : BettiStableRepresentation Γ r δ)
    (e : ρ.toRepresentation.Equiv σ.toRepresentation) : mk ρ = mk σ := by
  sorry

-- BettiStableClasses.abelian_rankTwo_empty
example (Γ : Type*) [CommGroup Γ] (δ : Γ →* ℂˣ) :
    IsEmpty (BettiStableClasses Γ 2 δ) := by
  sorry

end BettiStableClasses

end TauCeti.NonabelianHodge

/-!
## Explicit signature omissions

G11 is an open prototype obligation. The names below have no Lean declarations or
examples in this file. Their mathematical statements, prerequisites, APIs and tests
are in the packet and definitive reader. The actual supplier carriers are missing;
these omissions are not replaced by opaque predicates, arbitrary result types,
or a set quotient pretending to be a geometric moduli space.

Carrier groups: G1 global relative operators and bundles; G2 scheme/GIT and slices;
G3 relative coherent analytic families; G4 compact Kähler/Chern-Weil theory;
G5 dg Lie/gauge deformation; G6 projective topology; G7 nonlinear metric flow;
G8 primary Corlette proof; G9 gauge and moment-map compactness.
G10 additionally records the regularity boundary of the coarse homeomorphism.

Omitted node: HodgeStructuresPartII:H.1/stable-automorphisms
Required inputs: Actual geometric carriers and the prerequisite supplier exports (G1-G9); G11.
Declaration: TauCeti.NonabelianHodge.stable_automorphisms

Omitted node: HodgeStructuresPartII:H.1/torsion-determinant-dictionary
Required inputs: G1; G11.
Declaration: TauCeti.NonabelianHodge.torsion_determinant_dictionary

Omitted node: HodgeStructuresPartII:H.1/stability
Required inputs: Actual geometric carriers and the prerequisite supplier exports (G1-G9); G11.
Declaration: TauCeti.NonabelianHodge.IsStableParameterConnection
API omission: TauCeti.NonabelianHodge.IsStableParameterConnection.invariant_iff
API omission: TauCeti.NonabelianHodge.IsStableParameterConnection.iso_iff
API omission: TauCeti.NonabelianHodge.IsStableParameterConnection.scale_unit_iff
API omission: TauCeti.NonabelianHodge.IsStableParameterConnection.rankOne
Example omission: TauCeti.NonabelianHodge.IsStableParameterConnection.line_stable
Example omission: TauCeti.NonabelianHodge.IsStableParameterConnection.zero_excluded
Example omission: TauCeti.NonabelianHodge.IsStableParameterConnection.zero_higgs_iff
Example omission: TauCeti.NonabelianHodge.IsStableParameterConnection.trivial_rankTwo_excluded

Omitted node: HodgeStructuresPartII:H.1/parameter-families
Required inputs: G1; G11.
Declaration: TauCeti.NonabelianHodge.FixedDeterminantFamily
API omission: TauCeti.NonabelianHodge.FixedDeterminantFamily.pullback
API omission: TauCeti.NonabelianHodge.FixedDeterminantFamily.fibre
API omission: TauCeti.NonabelianHodge.FixedDeterminantFamily.determinant
API omission: TauCeti.NonabelianHodge.FixedDeterminantFamily.twist_from_base
Example omission: TauCeti.NonabelianHodge.FixedDeterminantFamily.rankOne_class
Example omission: TauCeti.NonabelianHodge.FixedDeterminantFamily.zero_fibre
Example omission: TauCeti.NonabelianHodge.FixedDeterminantFamily.one_fibre
Example omission: TauCeti.NonabelianHodge.FixedDeterminantFamily.absolute_derivative_excluded
Example omission: TauCeti.NonabelianHodge.FixedDeterminantFamily.geometric_determinant_nonexample

Omitted node: HodgeStructuresPartII:H.1/betti-framed
Required inputs: G6; G11.
Declaration: TauCeti.NonabelianHodge.BettiRepresentationScheme
API omission: TauCeti.NonabelianHodge.BettiRepresentationScheme.points
API omission: TauCeti.NonabelianHodge.BettiRepresentationScheme.conjugation
API omission: TauCeti.NonabelianHodge.BettiRepresentationScheme.presentation_independent
API omission: TauCeti.NonabelianHodge.BettiRepresentationScheme.stable_open
Example omission: TauCeti.NonabelianHodge.BettiRepresentationScheme.free_group
Example omission: TauCeti.NonabelianHodge.BettiRepresentationScheme.trivial_group
Example omission: TauCeti.NonabelianHodge.BettiRepresentationScheme.native_points

Omitted node: HodgeStructuresPartII:H.1/betti-coarse
Required inputs: G2; G11.
Declaration: TauCeti.NonabelianHodge.BettiModuli
API omission: TauCeti.NonabelianHodge.BettiModuli.quotient
API omission: TauCeti.NonabelianHodge.BettiModuli.stable_points
API omission: TauCeti.NonabelianHodge.BettiModuli.closed_orbit_iff
API omission: TauCeti.NonabelianHodge.BettiModuli.basepoint_change
Example omission: TauCeti.NonabelianHodge.BettiModuli.rankOne_fixed
Example omission: TauCeti.NonabelianHodge.BettiModuli.trivial_group_stable_empty
Example omission: TauCeti.NonabelianHodge.BettiModuli.classes_compatibility
Example omission: TauCeti.NonabelianHodge.BettiModuli.semisimplification_nonexample

Omitted node: HodgeStructuresPartII:H.1/operator-boundedness
Required inputs: G1; G11.
Declaration: TauCeti.NonabelianHodge.parameter_connection_boundedness

Omitted node: HodgeStructuresPartII:H.1/chern-component
Required inputs: G4; G11.
Declaration: TauCeti.NonabelianHodge.chern_zero_component

Omitted node: HodgeStructuresPartII:H.1/higgs-restriction
Required inputs: G6; G11.
Declaration: TauCeti.NonabelianHodge.higgs_restriction_and_extensions

Omitted node: HodgeStructuresPartII:H.1/higgs-local-freeness
Required inputs: G4, G6; G11.
Declaration: TauCeti.NonabelianHodge.higgs_chern_zero_locally_free

Omitted node: HodgeStructuresPartII:H.1/dolbeault-coarse
Required inputs: G1, G2; G11.
Declaration: TauCeti.NonabelianHodge.DolbeaultModuli
API omission: TauCeti.NonabelianHodge.DolbeaultModuli.classify
API omission: TauCeti.NonabelianHodge.DolbeaultModuli.points
API omission: TauCeti.NonabelianHodge.DolbeaultModuli.determinant_fibre
API omission: TauCeti.NonabelianHodge.DolbeaultModuli.stable_universal_etale
Example omission: TauCeti.NonabelianHodge.DolbeaultModuli.rankOne_fixed
Example omission: TauCeti.NonabelianHodge.DolbeaultModuli.point_base
Example omission: TauCeti.NonabelianHodge.DolbeaultModuli.trace_determinant
Example omission: TauCeti.NonabelianHodge.DolbeaultModuli.strictly_semistable_excluded

Omitted node: HodgeStructuresPartII:H.1/derham-coarse
Required inputs: G1, G2; G11.
Declaration: TauCeti.NonabelianHodge.DeRhamModuli
API omission: TauCeti.NonabelianHodge.DeRhamModuli.classify
API omission: TauCeti.NonabelianHodge.DeRhamModuli.stable_iff_irreducible
API omission: TauCeti.NonabelianHodge.DeRhamModuli.determinant_fibre
API omission: TauCeti.NonabelianHodge.DeRhamModuli.stable_universal_etale
Example omission: TauCeti.NonabelianHodge.DeRhamModuli.rankOne_fixed
Example omission: TauCeti.NonabelianHodge.DeRhamModuli.point_base
Example omission: TauCeti.NonabelianHodge.DeRhamModuli.native_operator
Example omission: TauCeti.NonabelianHodge.DeRhamModuli.underlying_line_insufficient

Omitted node: HodgeStructuresPartII:H.1/hodge-coarse
Required inputs: G1, G2; G11.
Declaration: TauCeti.NonabelianHodge.HodgeModuli
API omission: TauCeti.NonabelianHodge.HodgeModuli.parameter
API omission: TauCeti.NonabelianHodge.HodgeModuli.zero_fibre
API omission: TauCeti.NonabelianHodge.HodgeModuli.one_fibre
API omission: TauCeti.NonabelianHodge.HodgeModuli.classify
Example omission: TauCeti.NonabelianHodge.HodgeModuli.rankOne_fixed
Example omission: TauCeti.NonabelianHodge.HodgeModuli.zero_parameter
Example omission: TauCeti.NonabelianHodge.HodgeModuli.fibres_scheme
Example omission: TauCeti.NonabelianHodge.HodgeModuli.rankTwo_point_empty

Omitted node: HodgeStructuresPartII:H.1/horizontal-sections
Required inputs: G3; G11.
Declaration: TauCeti.NonabelianHodge.horizontal_sections_relative

Omitted node: HodgeStructuresPartII:H.1/riemann-hilbert-framed
Required inputs: G3, G6; G11.
Declaration: TauCeti.NonabelianHodge.riemann_hilbert_framed

Omitted node: HodgeStructuresPartII:H.1/riemann-hilbert-coarse
Required inputs: G2, G3, G9; G11.
Declaration: TauCeti.NonabelianHodge.riemann_hilbert_coarse

Omitted node: HodgeStructuresPartII:H.1/harmonic-bundle
Required inputs: G1, G7; G11.
Declaration: TauCeti.NonabelianHodge.HarmonicBundlePresentation
API omission: TauCeti.NonabelianHodge.HarmonicBundlePresentation.flat
API omission: TauCeti.NonabelianHodge.HarmonicBundlePresentation.higgs
API omission: TauCeti.NonabelianHodge.HarmonicBundlePresentation.tensor_dual
API omission: TauCeti.NonabelianHodge.HarmonicBundlePresentation.pullback
Example omission: TauCeti.NonabelianHodge.HarmonicBundlePresentation.trivial_line
Example omission: TauCeti.NonabelianHodge.HarmonicBundlePresentation.point
Example omission: TauCeti.NonabelianHodge.HarmonicBundlePresentation.zero_higgs_unitary
Example omission: TauCeti.NonabelianHodge.HarmonicBundlePresentation.tensor_stability_nonexample

Omitted node: HodgeStructuresPartII:H.1/kahler-identities
Required inputs: G4; G11.
Declaration: TauCeti.NonabelianHodge.harmonic_kahler_identities

Omitted node: HodgeStructuresPartII:H.1/donaldson-functional
Required inputs: G7; G11.
Declaration: TauCeti.NonabelianHodge.DonaldsonFunctional
API omission: TauCeti.NonabelianHodge.DonaldsonFunctional.refl
API omission: TauCeti.NonabelianHodge.DonaldsonFunctional.cocycle
API omission: TauCeti.NonabelianHodge.DonaldsonFunctional.first_variation
API omission: TauCeti.NonabelianHodge.DonaldsonFunctional.heat_derivative
Example omission: TauCeti.NonabelianHodge.DonaldsonFunctional.equal_metrics
Example omission: TauCeti.NonabelianHodge.DonaldsonFunctional.rankOne_fixed
Example omission: TauCeti.NonabelianHodge.DonaldsonFunctional.diagonal_kernel
Example omission: TauCeti.NonabelianHodge.DonaldsonFunctional.missing_higgs_term

Omitted node: HodgeStructuresPartII:H.1/higgs-metric-existence
Required inputs: G7; G11.
Declaration: TauCeti.NonabelianHodge.higgs_metric_existence

Omitted node: HodgeStructuresPartII:H.1/chern-weil-flatness
Required inputs: G4; G11.
Declaration: TauCeti.NonabelianHodge.chern_weil_flatness

Omitted node: HodgeStructuresPartII:H.1/flat-metric-existence
Required inputs: G8; G11.
Declaration: TauCeti.NonabelianHodge.flat_metric_existence

Omitted node: HodgeStructuresPartII:H.1/harmonic-correspondence
Required inputs: G8; G11.
Declaration: TauCeti.NonabelianHodge.harmonic_correspondence

Omitted node: HodgeStructuresPartII:H.1/hitchin-map
Required inputs: Actual geometric carriers and the prerequisite supplier exports (G1-G9); G11.
Declaration: TauCeti.NonabelianHodge.HitchinMap
API omission: TauCeti.NonabelianHodge.HitchinMap.coefficients
API omission: TauCeti.NonabelianHodge.HitchinMap.scale
API omission: TauCeti.NonabelianHodge.HitchinMap.jordan_invariant
API omission: TauCeti.NonabelianHodge.HitchinMap.nilpotent_iff
Example omission: TauCeti.NonabelianHodge.HitchinMap.rankTwo_sign
Example omission: TauCeti.NonabelianHodge.HitchinMap.rankOne_base
Example omission: TauCeti.NonabelianHodge.HitchinMap.trace_coordinate
Example omission: TauCeti.NonabelianHodge.HitchinMap.nonzero_nilpotent

Omitted node: HodgeStructuresPartII:H.1/hitchin-properness
Required inputs: Actual geometric carriers and the prerequisite supplier exports (G1-G9); G11.
Declaration: TauCeti.NonabelianHodge.hitchin_proper

Omitted node: HodgeStructuresPartII:H.1/harmonic-compactness
Required inputs: G9; G11.
Declaration: TauCeti.NonabelianHodge.harmonic_compactness

Omitted node: HodgeStructuresPartII:H.1/nonabelian-hodge-topology
Required inputs: G8, G9, G10; G11.
Declaration: TauCeti.NonabelianHodge.nonabelian_hodge_homeomorphism

Omitted node: HodgeStructuresPartII:H.1/hodge-scaling
Required inputs: Actual geometric carriers and the prerequisite supplier exports (G1-G9); G11.
Declaration: TauCeti.NonabelianHodge.HodgeScaling
API omission: TauCeti.NonabelianHodge.HodgeScaling.parameter
API omission: TauCeti.NonabelianHodge.HodgeScaling.action_laws
API omission: TauCeti.NonabelianHodge.HodgeScaling.nonzero_equiv
API omission: TauCeti.NonabelianHodge.HodgeScaling.determinant
Example omission: TauCeti.NonabelianHodge.HodgeScaling.rankOne
Example omission: TauCeti.NonabelianHodge.HodgeScaling.zero_higgs
Example omission: TauCeti.NonabelianHodge.HodgeScaling.unit_parameter
Example omission: TauCeti.NonabelianHodge.HodgeScaling.fixed_lambda_nonexample

Omitted node: HodgeStructuresPartII:H.1/two-types-formality
Required inputs: G4, G5; G11.
Declaration: TauCeti.NonabelianHodge.two_types_formality

Omitted node: HodgeStructuresPartII:H.1/hodge-formal-product
Required inputs: G5; G11.
Declaration: TauCeti.NonabelianHodge.hodge_formal_product

Omitted node: HodgeStructuresPartII:H.1/hodge-etale-product
Required inputs: G5; G11.
Declaration: TauCeti.NonabelianHodge.hodge_etale_local_product

Omitted node: HodgeStructuresPartII:H.1/hodge-flatness
Required inputs: Actual geometric carriers and the prerequisite supplier exports (G1-G9); G11.
Declaration: TauCeti.NonabelianHodge.hodge_parameter_flat

Omitted node: HodgeStructuresPartII:H.1/operator-git
Required inputs: G1, G2; G11.
Declaration: TauCeti.NonabelianHodge.parameter_connection_git

Omitted node: HodgeStructuresPartII:H.1/operator-framed
Required inputs: G1, G2, G3; G11.
Declaration: TauCeti.NonabelianHodge.FramedParameterModuli
API omission: TauCeti.NonabelianHodge.FramedParameterModuli.represent
API omission: TauCeti.NonabelianHodge.FramedParameterModuli.universal
API omission: TauCeti.NonabelianHodge.FramedParameterModuli.frame_change
API omission: TauCeti.NonabelianHodge.FramedParameterModuli.quotient
Example omission: TauCeti.NonabelianHodge.FramedParameterModuli.rankOne
Example omission: TauCeti.NonabelianHodge.FramedParameterModuli.point_base
Example omission: TauCeti.NonabelianHodge.FramedParameterModuli.frame_kills_inertia
Example omission: TauCeti.NonabelianHodge.FramedParameterModuli.coarse_not_fine

-/
