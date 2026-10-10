/-
This file is not the roadmap and is not exhaustive. The companion README is
definitive. These statements suggest Lean forms so contributors can converge
on names and signatures; placeholder proofs claim no implementation.

The imports use Mathlib 082e2d3 and Tau Ceti f790474. Actual matrix groups,
representations, newforms and symmetric powers are reused. Automorphic,
smooth, Weil–Deligne and trace-formula objects belong to the dependencies
named in the README. Where their conditions cannot be stated on the existing
carriers, explicit signature omissions point to the README target and list
the names needed. Algebraic fragments do not replace those full targets.
-/
import Mathlib.LinearAlgebra.Matrix.GeneralLinearGroup.Defs
import Mathlib.LinearAlgebra.Matrix.Notation
import Mathlib.LinearAlgebra.Matrix.Trace
import Mathlib.RepresentationTheory.Basic
import Mathlib.RepresentationTheory.Invariants
import Mathlib.RingTheory.Ideal.Operations
import Mathlib.Data.Finset.Insert
import Mathlib.LinearAlgebra.FiniteDimensional.Defs
import Mathlib.Basic.Complex.Basic
import Mathlib.Data.ZMod.Basic
import Mathlib.Algebra.Field.ZMod
import Mathlib.MeasureTheory.Measure.Haar.Basic
import Mathlib.Algebra.Group.Action.Defs
import Mathlib.Algebra.Group.Action.Basic
import Mathlib.Algebra.Group.Subgroup.Basic
import Mathlib.GroupTheory.OrderOfElement
import Mathlib.Algebra.Ring.Int.Parity
import Mathlib.Topology.Algebra.InfiniteSum.Basic
import Mathlib.Analysis.SpecialFunctions.Pow.Complex
import Mathlib.Analysis.SpecialFunctions.Gamma.Deligne
import Mathlib.LinearAlgebra.Matrix.GeneralLinearGroup.Projective
import Mathlib.RepresentationTheory.Irreducible
import Mathlib.RingTheory.PowerSeries.Basic
import Mathlib.Topology.Instances.AddCircle.Defs
import Mathlib.FieldTheory.AbsoluteGaloisGroup
import Mathlib.FieldTheory.IsAlgClosed.Basic
import Mathlib.NumberTheory.NumberField.Basic
import Mathlib.Topology.LocallyConstant.Basic
import Mathlib.RepresentationTheory.Induced
import Mathlib.NumberTheory.Zsqrtd.Basic
import TauCeti.NumberTheory.ModularForms.Newforms.Newform
import TauCeti.RepresentationTheory.ClassicalGroups.SymmetricPower
import TauCeti.RepresentationTheory.ProjectiveRepresentation.SchurMultiplier
import Mathlib.LinearAlgebra.PiTensorProduct.Finite
import Mathlib.Topology.Algebra.Group.Matrix
import Mathlib.Topology.Algebra.Group.Quotient
import Mathlib.NumberTheory.Padics.PadicNumbers
import Mathlib.NumberTheory.LocalField.Basic
import Mathlib.Algebra.Group.AddChar

noncomputable section
set_option linter.unusedVariables false
set_option linter.unusedSectionVars false

namespace TauCeti.GL2Blueprint
open _root_.Matrix

section Congruence
variable {R : Type*} [CommRing R]

def k0 (I : Ideal R) : Subgroup (GeneralLinearGroup (Fin 2) R) := by sorry
lemma k0_mem (I : Ideal R) (g : GeneralLinearGroup (Fin 2) R) :
    g ∈ k0 I ↔ g.val 1 0 ∈ I := by sorry
lemma k0_mono {I J : Ideal R} (h : I ≤ J) : k0 I ≤ k0 J := by sorry
lemma k0_top : k0 (⊤ : Ideal R) = ⊤ := by sorry
lemma k0_scalar (I : Ideal R) (u : Rˣ) : GeneralLinearGroup.scalar (Fin 2) u ∈ k0 I := by sorry
-- TauCeti.GL2Blueprint.k0_identity
example (I : Ideal R) : (1 : GeneralLinearGroup (Fin 2) R) ∈ k0 I := by sorry
-- TauCeti.GL2Blueprint.k0_level_zero
example : k0 (⊤ : Ideal R) = ⊤ := by sorry
-- TauCeti.GL2Blueprint.k0_wrong_entry
example (u l : GeneralLinearGroup (Fin 2) (ZMod 5))
    (hu : u.val = !![1, 1; 0, 1]) (hl : l.val = !![1, 0; 1, 1]) :
    u ∈ k0 (⊥ : Ideal (ZMod 5)) ∧ l ∉ k0 (⊥ : Ideal (ZMod 5)) := by sorry

def k1 (I : Ideal R) : Subgroup (GeneralLinearGroup (Fin 2) R) := by sorry
lemma k1_mem (I : Ideal R) (g : GeneralLinearGroup (Fin 2) R) :
    g ∈ k1 I ↔ g.val 1 0 ∈ I ∧ g.val 1 1 - 1 ∈ I := by sorry
lemma k1_le_k0 (I : Ideal R) : k1 I ≤ k0 I := by sorry
lemma k1_mono {I J : Ideal R} (h : I ≤ J) : k1 I ≤ k1 J := by sorry
lemma k1_top : k1 (⊤ : Ideal R) = ⊤ := by sorry
lemma k1_scalar (I : Ideal R) (u : Rˣ) :
    GeneralLinearGroup.scalar (Fin 2) u ∈ k1 I ↔ (u : R) - 1 ∈ I := by sorry
-- TauCeti.GL2Blueprint.k1_identity
example (I : Ideal R) : (1 : GeneralLinearGroup (Fin 2) R) ∈ k1 I := by sorry
-- TauCeti.GL2Blueprint.k1_level_zero
example : k1 (⊤ : Ideal R) = ⊤ := by sorry
-- TauCeti.GL2Blueprint.k1_not_principal
example (g : GeneralLinearGroup (Fin 2) (ZMod 5)) (hg : g.val = !![2, 0; 0, 1]) :
    g ∈ k1 (⊥ : Ideal (ZMod 5)) ∧ g.val ≠ !![1, 0; 0, 1] := by sorry
end Congruence

/- Signature omissions: The AA.0 Haar product, AA.1 adelic group, AA.2 quotient/central-character L² and AL.0 test-function carriers are absent. An arbitrary compact set, measure or vector space cannot satisfy these GL₂ identifications.
README targets: R16.1/local-adelic-compact-comparison, R16.1/iwasawa-cartan, R16.1/haar-quotient-comparison, R16.1/finite-level-comparison.
Omitted declaration names: TauCeti.GL2Blueprint.compactComparison, TauCeti.GL2Blueprint.iwasawaCartan, TauCeti.GL2Blueprint.haarComparison, TauCeti.GL2Blueprint.finiteLevelComparison.
-/
section LocalRepresentation
variable {G V : Type*} [Group G] [AddCommGroup V] [Module ℂ V]
/- Signature omissions: The SR.2 principal-series and Steinberg constructions
and ET.6 classification are absent. The newvector existence and dimension
statements are given below on Mathlib's actual GL₂(F) and invariant carriers,
with smoothness and admissibility written explicitly.
README target: R16.2/local-classification.
Omitted declaration name: TauCeti.GL2Blueprint.localClassification.
Full source-level tests awaiting the principal-series and Steinberg carriers:
TauCeti.GL2Blueprint.conductor_unramified,
TauCeti.GL2Blueprint.conductor_steinberg,
TauCeti.GL2Blueprint.conductor_ramified_steinberg.
-/

/-- Algebraic least-level signature. The local-field section supplies the
nonempty level set for the actual last-row subgroups K₁(pⁿ). -/
def conductorExponent (ρ : Representation ℂ G V) (K : ℕ → Subgroup G)
    (hex : ∃ n, ∃ v ∈ (Representation.invariants (ρ.comp (K n).subtype)), v ≠ 0) : ℕ := by sorry
lemma conductor_min (ρ : Representation ℂ G V) (K : ℕ → Subgroup G)
    (hex : ∃ n, ∃ v ∈ (Representation.invariants (ρ.comp (K n).subtype)), v ≠ 0) :
    (∃ v ∈ (Representation.invariants (ρ.comp (K (conductorExponent ρ K hex)).subtype)), v ≠ 0) ∧
    ∀ n < conductorExponent ρ K hex,
      ¬ ∃ v ∈ (Representation.invariants (ρ.comp (K n).subtype)), v ≠ 0 := by sorry
lemma conductor_iso {W : Type*} [AddCommGroup W] [Module ℂ W]
    (ρ : Representation ℂ G V) (σ : Representation ℂ G W) (K : ℕ → Subgroup G)
    (e : V ≃ₗ[ℂ] W) (he : ∀ g v, e (ρ g v) = σ g (e v))
    (hρ : ∃ n, ∃ v ∈ (Representation.invariants (ρ.comp (K n).subtype)), v ≠ 0)
    (hσ : ∃ n, ∃ v ∈ (Representation.invariants (σ.comp (K n).subtype)), v ≠ 0) :
    conductorExponent ρ K hρ = conductorExponent σ K hσ := by sorry
lemma conductor_unramified_twist (ρ σ : Representation ℂ G V)
    (K : ℕ → Subgroup G) (he : ∀ n g, g ∈ K n → ρ g = σ g)
    (hρ : ∃ n, ∃ v ∈ (Representation.invariants (ρ.comp (K n).subtype)), v ≠ 0)
    (hσ : ∃ n, ∃ v ∈ (Representation.invariants (σ.comp (K n).subtype)), v ≠ 0) :
    conductorExponent ρ K hρ = conductorExponent σ K hσ := by sorry
-- TauCeti.GL2Blueprint.conductor_unramified
-- Missing: ρ is the unramified generic principal series; K=K₁(pⁿ).
example (ρ : Representation ℂ G V) (K : ℕ → Subgroup G)
    (hex : ∃ n, ∃ v ∈ (Representation.invariants (ρ.comp (K n).subtype)), v ≠ 0)
    (hzero : ∃ v ∈ (Representation.invariants (ρ.comp (K 0).subtype)), v ≠ 0) :
    conductorExponent ρ K hex = 0 := by sorry

/-- A normalized element of an actual one-dimensional fixed submodule.
ell must be SR.2.3/whittaker-functionals' chosen Whittaker functional restricted to that line. -/
def normalizedNewvector (L : Submodule ℂ V) (ell : L →ₗ[ℂ] ℂ)
    (hdim : Module.finrank ℂ L = 1) (hell : ell ≠ 0) : L := by sorry
lemma normalizedNewvector_fixed (ρ : Representation ℂ G V) (K : Subgroup G)
    (ell : (Representation.invariants (ρ.comp K.subtype)) →ₗ[ℂ] ℂ)
    (hdim : Module.finrank ℂ (Representation.invariants (ρ.comp K.subtype)) = 1) (hell : ell ≠ 0) (g : K) :
    ρ g.val (normalizedNewvector (Representation.invariants (ρ.comp K.subtype)) ell hdim hell).val =
      (normalizedNewvector (Representation.invariants (ρ.comp K.subtype)) ell hdim hell).val := by sorry
lemma normalizedNewvector_eval (L : Submodule ℂ V) (ell : L →ₗ[ℂ] ℂ)
    (hdim : Module.finrank ℂ L = 1) (hell : ell ≠ 0) :
    ell (normalizedNewvector L ell hdim hell) = 1 := by sorry
lemma normalizedNewvector_unique (L : Submodule ℂ V) (ell : L →ₗ[ℂ] ℂ)
    (hdim : Module.finrank ℂ L = 1) (hell : ell ≠ 0) (v : L) (hv : ell v = 1) :
    v = normalizedNewvector L ell hdim hell := by sorry
lemma normalizedNewvector_twist {W : Type*} [AddCommGroup W] [Module ℂ W]
    (L : Submodule ℂ V) (L' : Submodule ℂ W) (e : L ≃ₗ[ℂ] L')
    (ell : L →ₗ[ℂ] ℂ) (ell' : L' →ₗ[ℂ] ℂ)
    (hdim : Module.finrank ℂ L = 1) (hdim' : Module.finrank ℂ L' = 1)
    (hell : ell ≠ 0) (hell' : ell' ≠ 0) (he : ∀ v, ell' (e v) = ell v) :
    e (normalizedNewvector L ell hdim hell) = normalizedNewvector L' ell' hdim' hell' := by sorry
-- TauCeti.GL2Blueprint.normalizedNewvector_line
example (ell : (⊤ : Submodule ℂ ℂ) →ₗ[ℂ] ℂ) (hell : ∀ z, ell z = 2 * z.val) :
    (normalizedNewvector ⊤ ell (by sorry) (by sorry)).val = (1 / 2 : ℂ) := by sorry
-- TauCeti.GL2Blueprint.normalizedNewvector_rescale
example (L : Submodule ℂ V) (ell : L →ₗ[ℂ] ℂ)
    (hdim : Module.finrank ℂ L = 1) (hell : ell ≠ 0) (a : ℂ) (ha : a ≠ 0) :
    normalizedNewvector L (a • ell) hdim (by sorry) =
      a⁻¹ • normalizedNewvector L ell hdim hell := by sorry
-- TauCeti.GL2Blueprint.normalizedNewvector_zero_functional
example (L : Submodule ℂ V) : ¬ ∃ v : L, (0 : L →ₗ[ℂ] ℂ) v = 1 := by sorry
end LocalRepresentation

section LocalNewvectors
open scoped ValuativeRel
variable {F : Type*} [Field F] [CharZero F] [ValuativeRel F]
    [TopologicalSpace F] [IsNonarchimedeanLocalField F]
variable {V : Type*} [AddCommGroup V] [Module ℂ V]

/-- The earlier k1 subgroup over the valuation ring, embedded in GL₂(F).
This abbreviation introduces neither a local-field carrier nor a second
congruence subgroup. Level zero is the integral maximal compact subgroup. -/
abbrev localK1 (F : Type*) [Field F] [ValuativeRel F]
    [TopologicalSpace F] [IsNonarchimedeanLocalField F] (n : ℕ) :
    Subgroup (GeneralLinearGroup (Fin 2) F) :=
  (k1 (𝓂[F] ^ n)).map
    (GeneralLinearGroup.map (algebraMap 𝒪[F] F))

/-- The image of the earlier lower-left subgroup; this is a specialization
of k0, rather than another Iwahori or local-field carrier. -/
abbrev localK0 (F : Type*) [Field F] [ValuativeRel F]
    [TopologicalSpace F] [IsNonarchimedeanLocalField F] (n : ℕ) :
    Subgroup (GeneralLinearGroup (Fin 2) F) :=
  (k0 (𝓂[F] ^ n)).map
    (GeneralLinearGroup.map (algebraMap 𝒪[F] F))

lemma localK0_zero : localK0 F 0 = localK1 F 0 := by sorry
lemma localK0_antitone {m n : ℕ} (h : m ≤ n) :
    localK0 F n ≤ localK0 F m := by sorry
lemma localK1_le_localK0 (n : ℕ) : localK1 F n ≤ localK0 F n := by sorry

-- The Iwahori specialization still constrains the lower-left entry.
example (g : GeneralLinearGroup (Fin 2) 𝒪[F])
    (hg : g.val = !![1, 1; 0, 1]) :
    GeneralLinearGroup.map (algebraMap 𝒪[F] F) g ∈ localK0 F 1 := by sorry
example (g : GeneralLinearGroup (Fin 2) 𝒪[F])
    (hg : g.val = !![1, 0; 1, 1]) :
    GeneralLinearGroup.map (algebraMap 𝒪[F] F) g ∉ localK0 F 1 := by sorry
example (u : 𝒪[F]ˣ) :
    GeneralLinearGroup.map (algebraMap 𝒪[F] F)
      (GeneralLinearGroup.scalar (Fin 2) u) ∈ localK0 F 1 := by sorry

lemma localK1_zero : localK1 F 0 =
    (⊤ : Subgroup (GeneralLinearGroup (Fin 2) 𝒪[F])).map
      (GeneralLinearGroup.map (algebraMap 𝒪[F] F)) := by sorry
lemma localK1_antitone {m n : ℕ} (h : m ≤ n) :
    localK1 F n ≤ localK1 F m := by sorry
lemma localK1_le_integral (n : ℕ) : localK1 F n ≤ localK1 F 0 := by sorry

-- Specialization checks: distinguish the last row from the first row,
-- and distinguish K₁ from a principal congruence subgroup.
example (g : GeneralLinearGroup (Fin 2) 𝒪[F])
    (hg : g.val = !![1, 1; 0, 1]) :
    GeneralLinearGroup.map (algebraMap 𝒪[F] F) g ∈ localK1 F 1 := by sorry
example (g : GeneralLinearGroup (Fin 2) 𝒪[F])
    (hg : g.val = !![1, 0; 1, 1]) :
    GeneralLinearGroup.map (algebraMap 𝒪[F] F) g ∉ localK1 F 1 := by sorry
example (u : 𝒪[F]ˣ) (hu : (u : 𝒪[F]) - 1 ∉ 𝓂[F])
    (g : GeneralLinearGroup (Fin 2) 𝒪[F])
    (hg : g.val = !![(u : 𝒪[F]), 0; 0, 1]) :
    GeneralLinearGroup.map (algebraMap 𝒪[F] F) g ∈ localK1 F 1 ∧
      GeneralLinearGroup.map (algebraMap 𝒪[F] F) g ≠ 1 := by sorry

/-- The embedded congruence subgroups are compact open in the local matrix
unit group. These signatures supply the inputs to compact-open admissibility;
they do not assemble the adelic comparison of R16.1. -/
lemma localK0_isCompact (n : ℕ) :
    IsCompact (localK0 F n : Set (GeneralLinearGroup (Fin 2) F)) := by sorry
lemma localK0_isOpen (n : ℕ) :
    IsOpen (localK0 F n : Set (GeneralLinearGroup (Fin 2) F)) := by sorry
lemma localK1_isCompact (n : ℕ) :
    IsCompact (localK1 F n : Set (GeneralLinearGroup (Fin 2) F)) := by sorry
lemma localK1_isOpen (n : ℕ) :
    IsOpen (localK1 F n : Set (GeneralLinearGroup (Fin 2) F)) := by sorry

/-- Every element of K0 is an integral scalar times an element of K1.
For positive n the scalar can be the lower-right entry; at level zero take 1.
This is the concrete subgroup input to the fixed-space comparison. -/
lemma localK0_scalar_mul_localK1 (n : ℕ)
    (g : GeneralLinearGroup (Fin 2) F) (hg : g ∈ localK0 F n) :
    ∃ (u : 𝒪[F]ˣ) (h : GeneralLinearGroup (Fin 2) F),
      h ∈ localK1 F n ∧
      g = GeneralLinearGroup.map (algebraMap 𝒪[F] F)
        (GeneralLinearGroup.scalar (Fin 2) u) * h := by sorry

/-- Integral scalar matrices generate K0(n)/K1(n) for n>0; at n=0 the
subgroups coincide. An unramified scalar action therefore identifies the two
fixed submodules at every level. No spherical or irreducibility assumption
is needed for this comparison. -/
lemma localK0_invariants_eq_localK1
    (π : Representation ℂ (GeneralLinearGroup (Fin 2) F) V)
    (hcent : ∀ (u : 𝒪[F]ˣ) (v : V),
      π (GeneralLinearGroup.map (algebraMap 𝒪[F] F)
        (GeneralLinearGroup.scalar (Fin 2) u)) v = v) (n : ℕ) :
    Representation.invariants (π.comp (localK0 F n).subtype) =
      Representation.invariants (π.comp (localK1 F n).subtype) := by sorry

-- Boundary and distinction checks for the embedded subgroups.
-- The Weyl element belongs at level zero and is excluded at level one.
example (g : GeneralLinearGroup (Fin 2) 𝒪[F])
    (hg : g.val = !![0, 1; -1, 0]) :
    GeneralLinearGroup.map (algebraMap 𝒪[F] F) g ∈ localK0 F 0 ∧
      GeneralLinearGroup.map (algebraMap 𝒪[F] F) g ∉ localK0 F 1 := by sorry
-- Conditional on a nonidentity residue unit; there need not be one over F2.
example (u : 𝒪[F]ˣ) (hu : (u : 𝒪[F]) - 1 ∉ 𝓂[F]) :
    GeneralLinearGroup.map (algebraMap 𝒪[F] F)
      (GeneralLinearGroup.scalar (Fin 2) u) ∈ localK0 F 1 ∧
    GeneralLinearGroup.map (algebraMap 𝒪[F] F)
      (GeneralLinearGroup.scalar (Fin 2) u) ∉ localK1 F 1 := by sorry

-- The unramified scalar-action hypothesis cannot be omitted: a nontrivial
-- scalar eigenvalue kills all K0 invariants, even if K1 invariants are nonzero.
example (π : Representation ℂ (GeneralLinearGroup (Fin 2) F) V)
    (u : 𝒪[F]ˣ) (a : ℂ) (ha : a ≠ 1)
    (hscalar : ∀ v : V,
      π (GeneralLinearGroup.map (algebraMap 𝒪[F] F)
        (GeneralLinearGroup.scalar (Fin 2) u)) v = a • v)
    (n : ℕ)
    (hfixed : ∃ v ∈ Representation.invariants (π.comp (localK1 F n).subtype), v ≠ 0) :
    Representation.invariants (π.comp (localK0 F n).subtype) = ⊥ ∧
      Representation.invariants (π.comp (localK0 F n).subtype) ≠
        Representation.invariants (π.comp (localK1 F n).subtype) := by sorry

/-- Casselman, Theorem 1 and its proof, pp. 302–306, in the last-row
convention of the README. Infinite dimensionality excludes determinant
characters. No conductor or nonempty-level hypothesis is assumed. -/
theorem newvectorLevelExists
    (π : Representation ℂ (GeneralLinearGroup (Fin 2) F) V)
    [Representation.IsIrreducible π]
    (hsm : ∀ v : V, IsOpen {g | π g v = v})
    (hadm : ∀ K : Subgroup (GeneralLinearGroup (Fin 2) F),
      IsCompact (K : Set (GeneralLinearGroup (Fin 2) F)) →
      IsOpen (K : Set (GeneralLinearGroup (Fin 2) F)) →
      FiniteDimensional ℂ (Representation.invariants (π.comp K.subtype)))
    (hinf : ¬ FiniteDimensional ℂ V) :
    ∃ n, ∃ v ∈ Representation.invariants (π.comp (localK1 F n).subtype),
      v ≠ 0 := by sorry

/-- The complete dimension formula, not an assumption that a fixed line exists.
Natural subtraction expresses max(0, n-c+1). Casselman, Corollary to the
Proof, p. 306; apply his top-left convention to the contragredient and twist
back to obtain the lower-last-row subgroup used here. -/
theorem casselmanNewvector
    (π : Representation ℂ (GeneralLinearGroup (Fin 2) F) V)
    [Representation.IsIrreducible π]
    (hsm : ∀ v : V, IsOpen {g | π g v = v})
    (hadm : ∀ K : Subgroup (GeneralLinearGroup (Fin 2) F),
      IsCompact (K : Set (GeneralLinearGroup (Fin 2) F)) →
      IsOpen (K : Set (GeneralLinearGroup (Fin 2) F)) →
      FiniteDimensional ℂ (Representation.invariants (π.comp K.subtype)))
    (hinf : ¬ FiniteDimensional ℂ V) (n : ℕ) :
    Module.finrank ℂ (Representation.invariants (π.comp (localK1 F n).subtype)) =
      n + 1 - conductorExponent π (localK1 F)
        (newvectorLevelExists π hsm hadm hinf) := by sorry

/-- The central-character assertion for the minimal K₀-line. For positive
conductor the lower-right entry of an integral K₀ matrix is a unit; u is that
unit, rather than an arbitrary value of the determinant. At conductor zero
the fixed line is spherical. -/
theorem casselmanNewvector_k0_character
    (π : Representation ℂ (GeneralLinearGroup (Fin 2) F) V)
    [Representation.IsIrreducible π]
    (hsm : ∀ v : V, IsOpen {g | π g v = v})
    (hadm : ∀ K : Subgroup (GeneralLinearGroup (Fin 2) F),
      IsCompact (K : Set (GeneralLinearGroup (Fin 2) F)) →
      IsOpen (K : Set (GeneralLinearGroup (Fin 2) F)) →
      FiniteDimensional ℂ (Representation.invariants (π.comp K.subtype)))
    (hinf : ¬ FiniteDimensional ℂ V)
    (ω : Fˣ →* ℂˣ)
    (hcent : ∀ z v, π (GeneralLinearGroup.scalar (Fin 2) z) v = (ω z : ℂ) • v)
    (hc : 0 < conductorExponent π (localK1 F)
      (newvectorLevelExists π hsm hadm hinf))
    (g : GeneralLinearGroup (Fin 2) 𝒪[F])
    (hg : g ∈ k0 (𝓂[F] ^ conductorExponent π (localK1 F)
      (newvectorLevelExists π hsm hadm hinf)))
    (u : 𝒪[F]ˣ) (hu : (u : 𝒪[F]) = g.val 1 1)
    (v : Representation.invariants (π.comp (localK1 F
      (conductorExponent π (localK1 F)
        (newvectorLevelExists π hsm hadm hinf))).subtype)) :
    π (GeneralLinearGroup.map (algebraMap 𝒪[F] F) g) v.val =
      (ω (Units.map (algebraMap 𝒪[F] F).toMonoidHom u) : ℂ) • v.val := by sorry

/-- Nonvanishing of the chosen Whittaker functional on the newvector line.
The second character condition says it is nontrivial on the inverse maximal
ideal. Equivariance uses actual upper unipotent matrices. Existence of this
nonzero functional is SR.2.3's genericity theorem, not an assumption about its
restriction to the newvector line. Casselman, proof of Theorem 1, pp. 303–306. -/
theorem casselmanNewvector_whittaker_eval
    (π : Representation ℂ (GeneralLinearGroup (Fin 2) F) V)
    [Representation.IsIrreducible π]
    (hsm : ∀ v : V, IsOpen {g | π g v = v})
    (hadm : ∀ K : Subgroup (GeneralLinearGroup (Fin 2) F),
      IsCompact (K : Set (GeneralLinearGroup (Fin 2) F)) →
      IsOpen (K : Set (GeneralLinearGroup (Fin 2) F)) →
      FiniteDimensional ℂ (Representation.invariants (π.comp K.subtype)))
    (hinf : ¬ FiniteDimensional ℂ V)
    (ψ : AddChar F ℂ) (hψ : Continuous ψ)
    (hψO : ∀ a : 𝒪[F], ψ (a : F) = 1)
    (hψp : ∃ x : F, (∀ a : 𝒪[F], a ∈ 𝓂[F] →
      x * (a : F) ∈ (𝒪[F] : Set F)) ∧ ψ x ≠ 1)
    (ell : V →ₗ[ℂ] ℂ) (hell : ell ≠ 0)
    (hwhit : ∀ (x : F) (g : GeneralLinearGroup (Fin 2) F),
      g.val = !![1, x; 0, 1] → ∀ v, ell (π g v) = ψ x * ell v) :
    ∃ v : Representation.invariants (π.comp (localK1 F
      (conductorExponent π (localK1 F)
        (newvectorLevelExists π hsm hadm hinf))).subtype), ell v.val ≠ 0 := by sorry

end LocalNewvectors

section IwahoriOldforms
open scoped ValuativeRel
variable {F : Type*} [Field F] [CharZero F] [ValuativeRel F]
    [TopologicalSpace F] [IsNonarchimedeanLocalField F]
variable {V : Type*} [AddCommGroup V] [Module ℂ V]

/-- Casselman, Corollary to the Proof, p. 306; Calegari–Geraghty,
§1.3, printed pp. 805–806, with infinite dimensionality as in the README.
A nonzero spherical vector is the unramified hypothesis. -/
theorem iwahoriOldforms_dimensions
    (π : Representation ℂ (GeneralLinearGroup (Fin 2) F) V)
    [Representation.IsIrreducible π]
    (hsm : ∀ v : V, IsOpen {g | π g v = v})
    (hadm : ∀ K : Subgroup (GeneralLinearGroup (Fin 2) F),
      IsCompact (K : Set (GeneralLinearGroup (Fin 2) F)) →
      IsOpen (K : Set (GeneralLinearGroup (Fin 2) F)) →
      FiniteDimensional ℂ (Representation.invariants (π.comp K.subtype)))
    (hinf : ¬ FiniteDimensional ℂ V)
    (hsph : ∃ v ∈ Representation.invariants (π.comp (localK1 F 0).subtype), v ≠ 0) :
    Module.finrank ℂ (Representation.invariants (π.comp (localK1 F 0).subtype)) = 1 ∧
      Module.finrank ℂ (Representation.invariants (π.comp (localK0 F 1).subtype)) = 2 := by sorry

/-- The actual oldform operator, expressed as a finite sum of the concrete
right-coset representatives of I diag(ϖ,1) I, with vol(I)=1. A is a full set
of residue representatives, so its cardinality is q. The sum acts by π;
there is no independent operator or replacement Hecke algebra in the input.
The spherical double coset adds s=diag(1,ϖ). Its eigenvalue λ is
sqrt(q)*(α+β); the scalar action c is ω(ϖ)=α*β.

In the basis (v,π(s)v), U has columns (λ,-1) and (q*c,0).
The -1 coefficient gives cyclicity also at a repeated Satake root.
Sources: CG20 §1.3, printed pp. 805–806; Casselman p. 306; the matrix computation
and coset normalization are explained in the README. -/
theorem iwahoriOldforms
    (π : Representation ℂ (GeneralLinearGroup (Fin 2) F) V)
    [Representation.IsIrreducible π]
    (hsm : ∀ v : V, IsOpen {g | π g v = v})
    (hadm : ∀ K : Subgroup (GeneralLinearGroup (Fin 2) F),
      IsCompact (K : Set (GeneralLinearGroup (Fin 2) F)) →
      IsOpen (K : Set (GeneralLinearGroup (Fin 2) F)) →
      FiniteDimensional ℂ (Representation.invariants (π.comp K.subtype)))
    (hinf : ¬ FiniteDimensional ℂ V)
    (ϖ : 𝒪[F]) (hϖ : Ideal.span ({ϖ} : Set 𝒪[F]) = 𝓂[F])
    (ϖF : Fˣ) (hϖF : (ϖF : F) = (ϖ : F))
    (A : Finset 𝒪[F]) (hA : ∀ x : 𝒪[F], ∃! a : A, x - a.val ∈ 𝓂[F])
    (g : A → GeneralLinearGroup (Fin 2) F)
    (hg : ∀ a, (g a).val = !![(ϖ : F), (a.val : F); 0, 1])
    (s : GeneralLinearGroup (Fin 2) F) (hs : s.val = !![1, 0; 0, (ϖ : F)])
    (v : V) (hv : v ∈ Representation.invariants (π.comp (localK1 F 0).subtype))
    (hv0 : v ≠ 0) (lam c : ℂ)
    (hcent : ∀ w, π (GeneralLinearGroup.scalar (Fin 2) ϖF) w = c • w)
    (heigen : ((∑ a : A, π (g a)) + π s) v = lam • v) :
    let U : Module.End ℂ V := ∑ a : A, π (g a)
    Module.finrank ℂ (Representation.invariants (π.comp (localK1 F 0).subtype)) = 1 ∧
      Module.finrank ℂ (Representation.invariants (π.comp (localK0 F 1).subtype)) = 2 ∧
      Representation.invariants (π.comp (localK0 F 1).subtype) =
        Submodule.span ℂ ({v, U v} : Set V) ∧
      (∀ a : ℂ, U v ≠ a • v) ∧
      (∀ w ∈ Representation.invariants (π.comp (localK0 F 1).subtype),
        U w ∈ Representation.invariants (π.comp (localK0 F 1).subtype) ∧
          U (U w) - lam • U w + ((A.card : ℂ) * c) • w = 0) := by sorry

-- Companion-matrix tests in the basis (v,π(s)v). These test the U formula,
-- independently of a choice or ordering of residue representatives.
example : (!![(2 : ℂ), 1; -1, 0] - 1) ^ 2 = 0 ∧
    !![(2 : ℂ), 1; -1, 0] - 1 ≠ 0 := by sorry
example : !![(5 : ℂ), 6; -1, 0] ^ 2 -
    5 • !![(5 : ℂ), 6; -1, 0] + 6 • (1 : Matrix (Fin 2) (Fin 2) ℂ) = 0 := by sorry
example : !![(5 : ℂ), 6; -1, 0] ^ 2 -
    5 • !![(5 : ℂ), 6; -1, 0] + 3 • (1 : Matrix (Fin 2) (Fin 2) ℂ) ≠ 0 := by sorry

/-- The excluded determinant characters: unramified χ is trivial on O×,
so both the spherical and Iwahori invariant spaces are the whole ℂ line.
This calculation also applies to nontrivial χ. No genericity is assumed. -/
theorem iwahoriDeterminantCharacter
    (χ : Fˣ →* ℂˣ)
    (hχ : ∀ u : 𝒪[F]ˣ, χ (Units.map (algebraMap 𝒪[F] F).toMonoidHom u) = 1)
    (π : Representation ℂ (GeneralLinearGroup (Fin 2) F) ℂ)
    (hπ : ∀ g z, π g z = (χ (GeneralLinearGroup.det g) : ℂ) * z) :
    Representation.invariants (π.comp (localK1 F 0).subtype) = ⊤ ∧
      Representation.invariants (π.comp (localK0 F 1).subtype) = ⊤ ∧
      Module.finrank ℂ (Representation.invariants (π.comp (localK1 F 0).subtype)) = 1 ∧
      Module.finrank ℂ (Representation.invariants (π.comp (localK0 F 1).subtype)) = 1 := by sorry

-- A supplied nontrivial unramified character gives an actual nontrivial
-- representation with Iwahori dimension one, not two.
example (χ : Fˣ →* ℂˣ)
    (hχ : ∀ u : 𝒪[F]ˣ, χ (Units.map (algebraMap 𝒪[F] F).toMonoidHom u) = 1)
    (π : Representation ℂ (GeneralLinearGroup (Fin 2) F) ℂ)
    (hπ : ∀ g z, π g z = (χ (GeneralLinearGroup.det g) : ℂ) * z)
    (g : GeneralLinearGroup (Fin 2) F) (hg : χ (GeneralLinearGroup.det g) ≠ 1) :
    π g (1 : ℂ) ≠ 1 ∧
      Module.finrank ℂ (Representation.invariants (π.comp (localK0 F 1).subtype)) ≠ 2 := by sorry
end IwahoriOldforms

section Spherical
/-- Complete homogeneous polynomial, given by the nonsingular GL₂ recurrence. -/
def sphericalValues (α β : ℂ) (m : ℕ) : ℂ := by sorry
lemma sphericalValues_zero (α β : ℂ) : sphericalValues α β 0 = 1 := by sorry
lemma sphericalValues_recurrence (α β : ℂ) (m : ℕ) :
    sphericalValues α β (m + 2) = (α + β) * sphericalValues α β (m + 1) -
      α * β * sphericalValues α β m := by sorry
lemma sphericalValues_swap (α β : ℂ) (m : ℕ) :
    sphericalValues α β m = sphericalValues β α m := by sorry
lemma sphericalValues_equal (α : ℂ) (m : ℕ) :
    sphericalValues α α m = (m + 1) * α ^ m := by sorry
-- TauCeti.GL2Blueprint.sphericalValues_one
example (α β : ℂ) : sphericalValues α β 1 = α + β := by sorry
-- TauCeti.GL2Blueprint.sphericalValues_two
example (α β : ℂ) : sphericalValues α β 2 = α ^ 2 + α * β + β ^ 2 := by sorry
-- TauCeti.GL2Blueprint.sphericalValues_collision
example : sphericalValues 1 1 2 = 3 := by sorry
/- Signature omissions: The full Iwahori–Hecke algebra and its center, the Kirillov model and the type Hom-multiplicity remain supplier interfaces. The oldforms theorem above uses the actual GL₂(F) fixed spaces and concrete finite double-coset sum; it needs none of these missing carriers.
README targets: R16.2/iwahori-center, R16.2/supercuspidal-kirillov, R16.2/henniart-unicity.
Omitted declaration names: TauCeti.GL2Blueprint.iwahoriCenter, TauCeti.GL2Blueprint.supercuspidalKirillov, TauCeti.GL2Blueprint.henniartUnicity.
-/
end Spherical

section SupercuspidalProjectivity
variable {p : ℕ} [Fact p.Prime]
variable {F : Type*} [NontriviallyNormedField F] [NormedAlgebra ℚ_[p] F]
    [FiniteDimensional ℚ_[p] F] [CompleteSpace F]
variable {V W X : Type*} [AddCommGroup V] [Module ℂ V]
    [AddCommGroup W] [Module ℂ W] [AddCommGroup X] [Module ℂ X]

/-- R16.2/supercuspidal-projective on the existing representation carriers.
Smoothness means open vector stabilizers, admissibility means finite-dimensional
compact-open invariants, and supercuspidality uses compact-mod-center matrix
coefficients against the smooth dual. The latter two conditions are required
only of π. Every representation has the same scalar central character ω.
The conclusion lifts an equivariant linear map through a surjective equivariant
linear map. There is no topology on the coefficient modules in this smooth
category. The separate L-coefficient DLB descent interface is not asserted here. -/
theorem supercuspidalProjective
    (π : Representation ℂ (GeneralLinearGroup (Fin 2) F) V)
    (σ : Representation ℂ (GeneralLinearGroup (Fin 2) F) W)
    (τ : Representation ℂ (GeneralLinearGroup (Fin 2) F) X)
    [Representation.IsIrreducible π]
    (ω : Fˣ →* ℂˣ) (hω : IsOpen (ω.ker : Set Fˣ))
    (hπsm : ∀ v : V, IsOpen {g | π g v = v})
    (hσsm : ∀ w : W, IsOpen {g | σ g w = w})
    (hτsm : ∀ x : X, IsOpen {g | τ g x = x})
    (hπcent : ∀ z v, π (GeneralLinearGroup.scalar (Fin 2) z) v = (ω z : ℂ) • v)
    (hσcent : ∀ z w, σ (GeneralLinearGroup.scalar (Fin 2) z) w = (ω z : ℂ) • w)
    (hτcent : ∀ z x, τ (GeneralLinearGroup.scalar (Fin 2) z) x = (ω z : ℂ) • x)
    (hπadm : ∀ K : Subgroup (GeneralLinearGroup (Fin 2) F),
      IsCompact (K : Set (GeneralLinearGroup (Fin 2) F)) →
      IsOpen (K : Set (GeneralLinearGroup (Fin 2) F)) →
      FiniteDimensional ℂ (Representation.invariants (π.comp K.subtype)))
    (hπcusp : ∀ (v : V) (ell : V →ₗ[ℂ] ℂ),
      IsOpen {g : GeneralLinearGroup (Fin 2) F | ∀ w, ell (π g w) = ell w} →
      IsCompact (closure ((QuotientGroup.mk : GeneralLinearGroup (Fin 2) F →
        GeneralLinearGroup (Fin 2) F ⧸ Subgroup.center (GeneralLinearGroup (Fin 2) F)) ''
          {g | ell (π g v) ≠ 0})))
    (q : Representation.IntertwiningMap σ τ) (hq : Function.Surjective q)
    (f : Representation.IntertwiningMap π τ) :
    ∃ lift : Representation.IntertwiningMap π σ, q.comp lift = f := by sorry

end SupercuspidalProjectivity

section CDT
variable {G H V : Type*} [Group G] [Group H] [AddCommGroup V] [Module ℂ V]
/-- Restriction part of the CDT construction. Θ is the supplier's full finite
GL₂(Z/xⁿ) representation, ι is the exact U₀(x)/U(xⁿ) inclusion. Construction
of Θ from the regular character and the O-lattice are unavailable conditions. -/
def cdtVexingType (Θ : Representation ℂ G V) (ι : H →* G) : Representation ℂ H V := by sorry
lemma cdtVexingType_restrict (Θ : Representation ℂ G V) (ι : H →* G) :
    cdtVexingType Θ ι = Θ.comp ι := by sorry
lemma cdtVexingType_lattice {O : Type*} [CommRing O] [Module O V]
    (Θ : Representation ℂ G V) (ι : H →* G)
    (Λ : Submodule O V) (hstable : ∀ g v, v ∈ Λ → Θ g v ∈ Λ) :
    ∀ h v, v ∈ Λ → cdtVexingType Θ ι h v ∈ Λ := by sorry
lemma cdtVexingType_unramified (Θ Θ' : Representation ℂ G V) (ι : H →* G)
    (h : ∀ g, Θ g = Θ' g) : cdtVexingType Θ ι = cdtVexingType Θ' ι := by sorry
-- TauCeti.GL2Blueprint.cdtVexingType_scalar_extension
-- Missing: W is the scalar extension of the chosen stable O-lattice.
example {W : Type*} [AddCommGroup W] [Module ℂ W]
    (Θ : Representation ℂ G V) (ρ : Representation ℂ G W) (ι : H →* G)
    (e : W ≃ₗ[ℂ] V) (he : ∀ g v, e (ρ g v) = Θ g (e v)) :
    ∀ h v, e (cdtVexingType ρ ι h v) = cdtVexingType Θ ι h (e v) := by sorry
-- TauCeti.GL2Blueprint.cdtVexingType_unramified_twist
example (Θ Θ' : Representation ℂ G V) (ι : H →* G)
    (he : ∀ g, Θ g = Θ' g) : cdtVexingType Θ ι = cdtVexingType Θ' ι := by sorry
/- Signature omissions: The CDT full type Θ(θ), the principal-congruence fixed space and the supplier Hom_K occurrence are absent, so arbitrary modules or occurrence counts cannot satisfy these statements; cdtVexingType with its API and the scalar-extension and unramified-twist tests remain above as true fragments.
README targets: R16.2/cdt-vexing-type, R16.3/cdt-inertia-multiplicity.
Omitted declaration names: TauCeti.GL2Blueprint.cdtInertiaMultiplicity.
Full source-level tests awaiting the same carriers: TauCeti.GL2Blueprint.cdtVexingType_distinct_inertia.
-/
end CDT

section Parameters
/- Signature omissions: The ET.6 local class and Weil–Deligne parameter carriers and the AL.2 local factors are absent, so arbitrary maps and functions cannot satisfy these parameter and factor identities; steinbergParameter and normalizationBridge remain below as true matrix computations.
README targets: R16.3/principal-series-parameter, R16.3/supercuspidal-parameter, R16.3/conductor-epsilon-comparison.
Omitted declaration names: TauCeti.GL2Blueprint.principalParameter, TauCeti.GL2Blueprint.supercuspidalParameter, TauCeti.GL2Blueprint.conductorEpsilon.
-/
/-- The concrete nonzero monodromy calculation in geometric Frobenius coordinates.
Missing from this signature: embedding this matrix pair in R01.2's WD carrier. -/
theorem steinbergParameter (q α : ℂ) (hq : q ≠ 0) (hα : α ≠ 0) :
    let N : Matrix (Fin 2) (Fin 2) ℂ := !![0, 1; 0, 0]
    let R : Matrix (Fin 2) (Fin 2) ℂ := !![α / q, 0; 0, α * q]
    N ^ 2 = 0 ∧ N ≠ 0 ∧ R * N = (q ^ 2)⁻¹ • (N * R) := by sorry
-- Here q is the square root of the residue cardinality. N is NOT discarded.
-- Missing: A is Frobenius of recπ; the actual Tate rec has this scalar half-twist.
theorem normalizationBridge (A : Matrix (Fin 2) (Fin 2) ℂ) (u : ℂ) :
    (u • A).det = u ^ 2 * A.det := by sorry
/- Signature omissions: The AF.1 archimedean class and parameter carriers (gl2-real-discrete-series, archimedean-llc-gln) and the AL.2 standard factor are absent, so arbitrary maps and functions cannot satisfy these identifications; Mathlib’s Complex.Gammaℝ and Complex.Gammaℂ fix the gamma normalizations used in the true examples below.
README targets: R16.2/archimedean-classification, R16.3/archimedean-factor-comparison.
Omitted declaration names: TauCeti.GL2Blueprint.archimedeanClassification, TauCeti.GL2Blueprint.archimedeanFactors.
-/
-- True fragments for R16.2/R16.3 with Mathlib’s Deligne gamma factors (no source-level
-- test name; the AL.2 factor of D_k itself is omitted above).
-- Normalization Γℝ(s)=π^{−s/2}Γ(s/2) of the R16.3 statement (Complex.Gammaℝ_def).
example (s : ℂ) :
    Complex.Gammaℝ s = (Real.pi : ℂ) ^ (-s / 2) * Complex.Gamma (s / 2) := by sorry
-- Normalization Γℂ(s)=2(2π)^{−s}Γ(s) of the R16.3 statement (Complex.Gammaℂ_def).
example (s : ℂ) :
    Complex.Gammaℂ s = 2 * (2 * (Real.pi : ℂ)) ^ (-s) * Complex.Gamma s := by sorry
-- The m=0 boundary: the split parameter has Γℝ(s+t)Γℝ(s+t+1)=Γℂ(s+t).
example (s t : ℂ) :
    Complex.Gammaℝ (s + t) * Complex.Gammaℝ (s + t + 1) = Complex.Gammaℂ (s + t) :=
  Complex.Gammaℝ_mul_Gammaℝ_add_one (s + t)
-- Index convention k=m+1: the induced factor Γℂ(s+t+m/2) is Γℂ(s+t+(k−1)/2).
example (s t : ℂ) (m : ℕ) :
    Complex.Gammaℂ (s + t + (m : ℂ) / 2) =
      Complex.Gammaℂ (s + t + (((m + 1 : ℕ) : ℂ) - 1) / 2) := by sorry

/-- Membership uses the supplier parameter and quadratic Weil-induction maps.
Missing: q is the actual residue cardinality, inertiaOrder the actual exact
order, θ continuous/tame, F'/F unramified quadratic, and N=0 in ind θ. -/
def tamelyDihedral (P C W : Type*) (ℓ q : ℕ) (rec : P → W)
    (ind : C → W) (inertiaOrder : C → ℕ) : Set P := by sorry
lemma tamelyDihedral_parameter {P C W : Type*} (ℓ q : ℕ) (rec : P → W)
    (ind : C → W) (inertiaOrder : C → ℕ) (π : P) :
    π ∈ tamelyDihedral P C W ℓ q rec ind inertiaOrder ↔
      ℓ.Prime ∧ ℓ ≠ 2 ∧ q % ℓ = ℓ - 1 ∧
        ∃ θ, inertiaOrder θ = ℓ ∧ rec π = ind θ := by sorry
lemma tamelyDihedral_unramified_twist {P C W : Type*} (ℓ q : ℕ)
    (rec : P → W) (ind : C → W) (inertiaOrder : C → ℕ)
    (twistP : P → P) (twistC : C → C)
    (horder : ∀ θ, inertiaOrder (twistC θ) = inertiaOrder θ)
    (hrec : ∀ π θ, rec π = ind θ → rec (twistP π) = ind (twistC θ))
    (π : P) (hπ : π ∈ tamelyDihedral P C W ℓ q rec ind inertiaOrder) :
    twistP π ∈ tamelyDihedral P C W ℓ q rec ind inertiaOrder := by sorry
-- TauCeti.GL2Blueprint.tamelyDihedral_order_three
-- An actual order-three value is distinct from its inverse; q=2 acts as inversion.
example {G : Type*} [Group G] (x : G) (hx : orderOf x = 3) :
    x ^ 2 = x⁻¹ ∧ x⁻¹ ≠ x := by sorry
-- TauCeti.GL2Blueprint.tamelyDihedral_order_two_excluded
example {G : Type*} [Group G] (x : G) (hx : orderOf x = 2) :
    x⁻¹ = x := by sorry
-- TauCeti.GL2Blueprint.tamelyDihedral_unramified_character
example {P C W : Type*} (ℓ q : ℕ) (hℓ : 2 < ℓ)
    (rec : P → W) (ind : C → W) (inertiaOrder : C → ℕ)
    (hunram : ∀ θ, inertiaOrder θ = 1) :
    tamelyDihedral P C W ℓ q rec ind inertiaOrder = ∅ := by sorry
/- Signature omissions: The actual unramified-quadratic Galois action on tame characters and ET.6’s supercuspidal subset are absent, so an arbitrary involution or subset cannot satisfy these statements; tamelyDihedral with its parameter and twist API and its three tests remain above as true fragments.
README targets: R16.3/tamely-dihedral, R16.3/tamely-dihedral-supercuspidal.
Omitted declaration names: TauCeti.GL2Blueprint.tamelyDihedral_conjugate, TauCeti.GL2Blueprint.tamelyDihedralSupercuspidal.
-/
end Parameters

section Global
/- Signature omissions: Use AL.3 Fourier reconstruction, global-whittaker-factorization and global-multiplicity-one, then AL.3 strong-multiplicity-one. The source π, its cusp embedding, its actual local components and its rational model are indispensable. The old statements quantified over unrelated functions and multiplicities.
README targets: R16.4/cuspidal-tensor-factorization, R16.4/global-whittaker-expansion, R16.4/global-multiplicity-one, R16.4/strong-multiplicity-one, R16.4/cohomological-rationality.
Omitted declaration names: TauCeti.GL2Blueprint.cuspidalTensor, TauCeti.GL2Blueprint.globalWhittakerExpansion, TauCeti.GL2Blueprint.globalMultiplicityOne, TauCeti.GL2Blueprint.strongMultiplicityOne, TauCeti.GL2Blueprint.cohomologicalRationality.
-/
/-- Trivial stabilizer on existing global isomorphism classes under determinant twists.
P must be AF.2's cusp classes and H its Hecke characters; this is not a new carrier. -/
def nonCM (H P : Type*) [Group H] [MulAction H P] : Set P := by sorry
lemma nonCM_iff {H P : Type*} [Group H] [MulAction H P] (π : P) :
    π ∈ nonCM H P ↔ ∀ χ : H, χ • π = π → χ = 1 := by sorry
lemma nonCM_twist {H P : Type*} [Group H] [MulAction H P]
    (π : P) (hπ : π ∈ nonCM H P) (χ : H) : χ • π ∈ nonCM H P := by sorry
lemma nonCM_self_twist_square {H P : Type*} [CommGroup H] [MulAction H P]
    (central : P → H) (hcentral : ∀ χ π, central (χ • π) = χ ^ 2 * central π)
    (π : P) (χ : H) (hχ : χ • π = π) : χ ^ 2 = 1 := by sorry
-- TauCeti.GL2Blueprint.nonCM_free_action
example {H : Type*} [Group H] (π : H) : π ∈ nonCM H H := by sorry
-- TauCeti.GL2Blueprint.nonCM_trivial_character
example {H P : Type*} [Group H] [MulAction H P] (π : P) : (1 : H) • π = π := by sorry
-- TauCeti.GL2Blueprint.nonCM_quadratic_stabilizer
example {H P : Type*} [Group H] [MulAction H P] (π : P) (χ : H)
    (hne : χ ≠ 1) (hsquare : χ ^ 2 = 1) (hfix : χ • π = π) :
    π ∉ nonCM H P := by sorry
/- Signature omissions: The actual Rankin–Selberg integrals and completed L-functions are unavailable. The GL₂ converse needs every Hecke-quasicharacter twist, generic local factors/Casselman–Wallach globalizations, central-character automorphy, Euler convergence, dual entireness, strip bounds and the epsilon functional equations. AL.3/gln-converse-full-rank is used at n=2; reduced rank gives no n=2 theorem.
README targets: R16.5/whittaker-integral-comparison, R16.5/full-gl2-converse, R16.5/classical-l-function-comparison.
Omitted declaration names: TauCeti.GL2Blueprint.whittakerIntegral, TauCeti.GL2Blueprint.gl2Converse, TauCeti.GL2Blueprint.classicalLFunction.
-/
-- Variable conversion only; the README separately states local root numbers,
-- the discriminant, conductor and global additive-character product formula.
theorem globalEpsilon (k : ℂ) (s : ℂ) :
    (1 - s) + (k - 1) / 2 = k - (s + (k - 1) / 2) := by sorry
end Global

section Classical
/- Signature omissions: The primitive exact-conductor newform subtype and actual AF.5 adelization map with fixed k, nebentypus, infinity type and coefficient projections must exist before these equivalences and their API can be stated. No equivalence of two arbitrary types is asserted. The sound old-level/scalar tests below remain concrete fragments.
README targets: R16.6/primitive-classical-bijection.
Omitted declaration names: TauCeti.GL2Blueprint.primitiveBijection, TauCeti.GL2Blueprint.primitiveBijection_conductor, TauCeti.GL2Blueprint.primitiveBijection_weight_character, TauCeti.GL2Blueprint.primitiveBijection_hecke, TauCeti.GL2Blueprint.primitiveBijection_normalized, TauCeti.GL2Blueprint.primitiveBijection_inverse.
Full source-level tests awaiting the same carriers: TauCeti.GL2Blueprint.primitiveBijection_weight_two.
-/
-- TauCeti.GL2Blueprint.primitiveBijection_old_level
-- Missing: old is the upstream oldform inclusion of primitive conductor M<N;
-- cond is the actual conductor, not the ambient level. Old forms fail the N subtype.
example {Old : Type*} (f : Old) (M N : ℕ) (hMN : M < N)
    (cond : Old → ℕ) (hcond : cond f = M) : cond f ≠ N := by sorry
-- TauCeti.GL2Blueprint.primitiveBijection_scalar_normalization
example {N : ℕ} [NeZero N] {k : ℤ} (f : HeckeRing.GL2.Newform N k)
    (c : ℂ) (hc : c ≠ 1) : c * (UpperHalfPlane.qExpansion 1 f.toCuspForm).coeff 1 ≠ 1 := by
  simpa only [HeckeRing.GL2.Newform.qExpansion_coeff_one, mul_one] using hc
-- Good-prime polynomial coefficient conversion. Full ramified U and central
-- finite-unit character comparison are omitted until upstream Layer 4/AF.5 exists.
theorem classicalHeckeLevel (α β z ap χp : ℂ)
    (htrace : z * (α + β) = ap) (hdet : α * β = χp) :
    z * α + z * β = ap ∧ (z * α) * (z * β) = χp * z ^ 2 := by sorry

section Weight
open scoped TensorProduct
variable {ι : Type} [Fintype ι]

/-- For the Hilbert application, ι is the finite set of real embeddings and k≥2.
The existing symmetric power is the coefficient carrier, even at k=2. -/
abbrev HilbertWeightSpace (K : Type) [Field K] (k : ι → ℕ) :=
  ⨂[K] i, Sym[K]^(k i - 2) (Fin 2 → K)

/-- One actual symmetric-power factor with its determinant twist. -/
def hilbertWeightFactor (K : Type) [Field K] (k : ℕ) (m : ℤ) :
    Representation K (GeneralLinearGroup (Fin 2) K) (Sym[K]^(k - 2) (Fin 2 → K)) where
  toFun g := ((GeneralLinearGroup.det g : K) ^ m) • TauCeti.symPowerRep K 2 (k - 2) g
  map_one' := by sorry
  map_mul' := by sorry

/-- Tensor over the embeddings; the group is the product of the GL₂ factors.
This is the complex point realization of Res_{F/ℚ} GL₂ after the embeddings
are fixed. Purity is imposed in the cohomological scalar lemma below. -/
def hilbertWeightRepresentation (K : Type) [Field K] (k : ι → ℕ) (m : ι → ℤ) :
    Representation K (ι → GeneralLinearGroup (Fin 2) K) (HilbertWeightSpace K k) where
  toFun g := PiTensorProduct.map fun i => hilbertWeightFactor K (k i) (m i) (g i)
  map_one' := by sorry
  map_mul' := by sorry

lemma hilbertWeightRepresentation_scalar (K : Type) [Field K]
    (k : ι → ℕ) (m : ι → ℤ) (hk : ∀ i, 2 ≤ k i) (u : ι → Kˣ) :
    hilbertWeightRepresentation K k m (fun i => GeneralLinearGroup.scalar (Fin 2) (u i)) =
      (∏ i, ((u i : K) ^ ((k i : ℤ) - 2 + 2 * m i))) •
        (1 : Module.End K (HilbertWeightSpace K k)) := by sorry

lemma hilbertWeightRepresentation_pure (K : Type) [Field K]
    (k : ι → ℕ) (m : ι → ℤ) (hk : ∀ i, 2 ≤ k i) (w : ℤ)
    (hw : ∀ i, (k i : ℤ) + 2 * m i = w) (u : ι → Kˣ) :
    hilbertWeightRepresentation K k m (fun i => GeneralLinearGroup.scalar (Fin 2) (u i)) =
      (∏ i, (u i : K) ^ (w - 2)) • (1 : Module.End K (HilbertWeightSpace K k)) := by sorry

lemma hilbertWeightRepresentation_dimension (K : Type) [Field K]
    (k : ι → ℕ) (hk : ∀ i, 2 ≤ k i) :
    Module.finrank K (HilbertWeightSpace K k) = ∏ i, (k i - 1) := by sorry

lemma hilbertWeightRepresentation_dual (K : Type) [Field K]
    (k : ι → ℕ) (m : ι → ℤ) (hk : ∀ i, 2 ≤ k i) (u : ι → Kˣ) :
    (hilbertWeightRepresentation K k m).dual
        (fun i => GeneralLinearGroup.scalar (Fin 2) (u i)) =
      (∏ i, (u i : K) ^ (-((k i : ℤ) - 2 + 2 * m i))) •
        (1 : Module.End K (Module.Dual K (HilbertWeightSpace K k))) := by sorry

/-- Scalar extension compares these actual tensor carriers and intertwines
the coefficient-mapped matrix action. Equality on pure tensors specifies
the action on the whole scalar extension. -/
lemma hilbertWeightRepresentation_base_change (K L : Type) [Field K] [Field L]
    [Algebra K L] (k : ι → ℕ) (m : ι → ℤ) :
    ∃ e : (L ⊗[K] HilbertWeightSpace K k) ≃ₗ[L] HilbertWeightSpace L k,
      ∀ g : ι → GeneralLinearGroup (Fin 2) K, ∀ a : L, ∀ v : HilbertWeightSpace K k,
        e (a ⊗ₜ[K] hilbertWeightRepresentation K k m g v) =
          hilbertWeightRepresentation L k m
            (fun i => GeneralLinearGroup.map (algebraMap K L) (g i)) (e (a ⊗ₜ[K] v)) := by sorry
-- TauCeti.GL2Blueprint.hilbertWeightRepresentation_weight_two
example (g : Fin 1 → GeneralLinearGroup (Fin 2) ℂ) :
    Module.finrank ℂ (HilbertWeightSpace ℂ (fun _ : Fin 1 => 2)) = 1 ∧
      hilbertWeightRepresentation ℂ (fun _ : Fin 1 => 2) (fun _ => 0) g = 1 := by sorry
-- TauCeti.GL2Blueprint.hilbertWeightRepresentation_weight_three
example (u : ℂˣ) :
    Module.finrank ℂ (HilbertWeightSpace ℂ (fun _ : Fin 1 => 3)) = 2 ∧
      hilbertWeightRepresentation ℂ (fun _ : Fin 1 => 3) (fun _ => 1)
          (fun _ => GeneralLinearGroup.scalar (Fin 2) u) =
        (u : ℂ) ^ 3 • (1 : Module.End ℂ (HilbertWeightSpace ℂ (fun _ : Fin 1 => 3))) := by sorry
-- TauCeti.GL2Blueprint.hilbertWeightRepresentation_mixed_parity
example : ¬ ∃ m₁ m₂ w : ℤ, 2 + 2 * m₁ = w ∧ 3 + 2 * m₂ = w := by sorry
end Weight

-- The scalar parameter conversion is actual matrix algebra. The README requires
-- Frobenius inversion/contragredient and nebentypus agreement before identifying
-- this with R19's determinant ε·χ_cyc^{k−1}; that Galois attachment is omitted.
theorem weightKParameterConversion (α β z : ℂ) :
    z * α + z * β = z * (α + β) ∧
    (z * α) * (z * β) = z ^ 2 * (α * β) := by sorry
/- Signature omissions: The designated characteristic-zero automorphic multiplicity space at its compatible level/infinite type must be identified first. An arbitrary vector space does not have dimension one; integral/torsion multiplicity is separate.
README targets: R16.6/geometry-and-galois-exports.
Omitted declaration names: TauCeti.GL2Blueprint.geometricExports.
-/
end Classical

section Quaternion
/- Signature omissions: The smooth division-algebra and essentially square-integrable GL₂(F) class carriers, local JL, the ET.6 parameters and AF.1’s archimedean character interfaces are absent, so arbitrary maps cannot satisfy these local transfer identities; quaternionSwap remains below as a true parity computation.
README targets: R17.1/local-quaternionic-comparison, R17.1/norm-character-steinberg, R17.1/real-quaternionic-comparison, R17.1/wild-dyadic-transfer.
Omitted declaration names: TauCeti.GL2Blueprint.localQuaternionic, TauCeti.GL2Blueprint.normCharacterSteinberg, TauCeti.GL2Blueprint.realQuaternionic, TauCeti.GL2Blueprint.wildDyadicTransfer.
-/
-- The actual parity calculation for swapping one ramified and one split place.
-- This assumes chosen global algebras and their ramification data. QFI Layer 6D
-- supplies local classification. GlobalQuadraticForms §4.4 supplies global
-- realization via prescribed Hilbert signs and QFI Layer 2's quaternion algebra.
theorem quaternionSwap {V : Type*} [DecidableEq V] (S : Finset V)
    (v τ : V) (hv : v ∉ S) (hτ : τ ∈ S) (hvt : v ≠ τ) :
    Even S.card → Even (insert v (S.erase τ)).card := by sorry
end Quaternion

section Trace
variable {G : Type*} [Group G]
/-- Difference of the actual character-isotypic idempotents. Missing: eH/eK
are the exact extended-Iwahori/Haar-normalized functions, χ unitary and their
ω⁻¹ central equivariance. This function does not invent a test-function carrier. -/
def steinbergProjectorDifference (eH eK : G → ℂ) : G → ℂ := by sorry
lemma steinbergProjectorDifference_eval (eH eK : G → ℂ) (g : G) :
    steinbergProjectorDifference eH eK g = eH g - eK g := by sorry
lemma steinbergProjectorDifference_central (eH eK : G → ℂ) (z : G) (ωz : ℂ)
    (hH : ∀ g, eH (z * g) = ωz⁻¹ * eH g)
    (hK : ∀ g, eK (z * g) = ωz⁻¹ * eK g) (g : G) :
    steinbergProjectorDifference eH eK (z * g) =
      ωz⁻¹ * steinbergProjectorDifference eH eK g := by sorry
/- Signature omissions: The integrated trace distributions of St⊗χdet, the determinant character and the unramified principal series are absent, so arbitrary trace functionals cannot take these values (the two former API statements contradicted each other); steinbergProjectorDifference with its evaluation, central and twist API and the two pointwise tests remain as true fragments.
README targets: R17.2/steinberg-projector-difference.
Omitted declaration names: TauCeti.GL2Blueprint.steinbergProjectorDifference_steinberg, TauCeti.GL2Blueprint.steinbergProjectorDifference_character.
Full source-level tests awaiting the same carriers: TauCeti.GL2Blueprint.steinbergProjectorDifference_trivial_norm, TauCeti.GL2Blueprint.steinbergProjectorDifference_unramified_principal.
-/
lemma steinbergProjectorDifference_twist (eH eK η : G → ℂ) :
    steinbergProjectorDifference (fun g => η g * eH g) (fun g => η g * eK g) =
      fun g => η g * steinbergProjectorDifference eH eK g := by sorry
-- TauCeti.GL2Blueprint.steinbergProjectorDifference_outside_support
example (eH eK : G → ℂ) (g : G) (hH : eH g = 0) (hK : eK g = 0) :
    steinbergProjectorDifference eH eK g = 0 := by sorry
-- TauCeti.GL2Blueprint.steinbergProjectorDifference_scalar_twist
example (eH eK η : G → ℂ) (g : G) :
    steinbergProjectorDifference (fun x => η x * eH x) (fun x => η x * eK x) g =
      η g * steinbergProjectorDifference eH eK g := by sorry
/- Signature omissions: The inner-form and cyclic matching functions, the C_c^∞ carriers, norm classes, centralizer measures and Satake transforms are absent, so arbitrary orbital-integral maps cannot satisfy these identities and a transfer map between arbitrary types need not exist; cyclicMatching_central and the quadratic Satake arithmetic test remain below as true fragments.
README targets: R17.2/quaternionic-orbital-matching, R17.2/cyclic-local-matching.
Omitted declaration names: TauCeti.GL2Blueprint.quaternionicOrbitalMatching, TauCeti.GL2Blueprint.cyclicMatching, TauCeti.GL2Blueprint.cyclicMatching_norm, TauCeti.GL2Blueprint.cyclicMatching_non_norm, TauCeti.GL2Blueprint.cyclicMatching_unit, TauCeti.GL2Blueprint.cyclicMatching_satake.
Full source-level tests awaiting the same carriers: TauCeti.GL2Blueprint.cyclicMatching_degree_one, TauCeti.GL2Blueprint.cyclicMatching_non_norm_test.
-/
lemma cyclicMatching_central {ZE ZF : Type*} [Group ZE] [Group ZF]
    (norm : ZE →* ZF) (ω : ZF →* ℂˣ) (z : ZE) :
    (ω.comp norm) z = ω (norm z) := by sorry
-- TauCeti.GL2Blueprint.cyclicMatching_quadratic_satake
example : ((2 : ℂ) ^ 2 + 3 ^ 2 = 13) ∧ ((2 : ℂ) ^ 2 * 3 ^ 2 = 36) := by sorry
/- Signature omissions: The AS.2/AS.4/AS.6 and ET.4 trace distributions of a matched factorizable test function and its operators on Borel inductions are absent, so arbitrary complex scalars or endomorphisms cannot satisfy these identities.
README targets: R17.2/continuous-residual-ledger, R17.2/strong-cuspidal-vanishing, R17.2/specialized-trace-comparison.
Omitted declaration names: TauCeti.GL2Blueprint.spectralLedger, TauCeti.GL2Blueprint.strongCuspidalVanishing, TauCeti.GL2Blueprint.specializedTraceComparison.
-/
end Trace
/- Signature omissions: The actual conductor-N weight-one primitive newforms and full-O(2) limit D₁(0) automorphic subtype, odd nebentypus and lowering-operator condition are unavailable. Weight one has parameter 1⊕sgn and is not a negative symmetric-power coefficient system.
README targets: R16.6/weight-one-classical-comparison.
Omitted declaration names: TauCeti.GL2Blueprint.weightOneClassicalComparison.
-/
end TauCeti.GL2Blueprint

/-
Supplier boundary for the converse and multiplicity interfaces:
globalWhittakerExpansion imports AL.3/gln-fourier-expansion;
globalMultiplicityOne imports AL.3/global-multiplicity-one after Fourier reconstruction;
strong multiplicity one imports AL.3/strong-multiplicity-one.
gl2Converse compares the full GL1 twist family with
AL.3/gln-converse-full-rank at n=2, retaining the R16.5 local growth,
genericity, archimedean, dual entireness, strip and epsilon hypotheses.
AL.3/gln-converse-reduced-rank has n>=3 and supplies no rank-two shortcut.
These ownership annotations add no missing native carrier or proof.
-/

/-
Archimedean classification imports the exact current AF.1/weil-group-real,
AF.1/gl2-real-discrete-series, AF.1/archimedean-llc-gln and
AF.1/casselman-wallach-globalization nodes. The factor comparison uses
AF.1/archimedean-llc-gln and AL.1's gamma/additive-character conventions.
AF.1b remains a proposed stage split; these exact node imports do not close
AF's original classification proofs or missing native signature interfaces.
-/

namespace TauCeti.GL2Transfer

open _root_.Matrix

/- Signature omissions: Global JL is an equivalence only between the supplied non-norm quaternionic discrete spectrum and the D-compatible cuspidal GL₂ spectrum over the same number field and central character. All actual local JL, Hecke, twisting and inverse maps are required; an arbitrary pair of types need not be equivalent.
README targets: R17.3/global-jl.
Omitted declaration names: TauCeti.GL2Transfer.globalJL, TauCeti.GL2Transfer.globalJL_local, TauCeti.GL2Transfer.globalJL_central, TauCeti.GL2Transfer.globalJL_inverse, TauCeti.GL2Transfer.globalJL_twist, TauCeti.GL2Transfer.globalJL_split.
Full source-level tests awaiting the same carriers: TauCeti.GL2Transfer.jl_split_test, TauCeti.GL2Transfer.jl_steinberg_test, TauCeti.GL2Transfer.jl_eisenstein_excluded_test, TauCeti.GL2Transfer.jl_inverse_test.
-/
section Satake
variable {K L : Type*} [CommRing K] [CommRing L]

/-- The transfer-specific power rule on the existing GL, not a Satake carrier:
the representative `A ^ f` of the base-changed Satake class at a place of residue
degree `f`. f=0 is the formal matrix-power extension, not a field extension. -/
def unramifiedBaseChange (A : GeneralLinearGroup (Fin 2) K)
    (f : ℕ) : GeneralLinearGroup (Fin 2) K := A ^ f

lemma unramifiedBaseChange_one (A : GeneralLinearGroup (Fin 2) K) :
    unramifiedBaseChange A 1 = A := by sorry

lemma unramifiedBaseChange_tower (A : GeneralLinearGroup (Fin 2) K) (f g : ℕ) :
    unramifiedBaseChange (unramifiedBaseChange A f) g =
      unramifiedBaseChange A (f * g) := by sorry

lemma unramifiedBaseChange_conjugate (A P : GeneralLinearGroup (Fin 2) K) (f : ℕ) :
    unramifiedBaseChange (P * A * P⁻¹) f = P * unramifiedBaseChange A f * P⁻¹ := by sorry

lemma unramifiedBaseChange_det (A : GeneralLinearGroup (Fin 2) K) (f : ℕ) :
    GeneralLinearGroup.det (unramifiedBaseChange A f) = GeneralLinearGroup.det A ^ f := by sorry

lemma unramifiedBaseChange_map (φ : K →+* L) (A : GeneralLinearGroup (Fin 2) K) (f : ℕ) :
    GeneralLinearGroup.map φ (unramifiedBaseChange A f) =
      unramifiedBaseChange (GeneralLinearGroup.map φ A) f := by sorry

-- TauCeti.GL2Transfer.bc_degree_one_test
example (A : GeneralLinearGroup (Fin 2) K) : unramifiedBaseChange A 1 = A := by sorry

-- TauCeti.GL2Transfer.bc_identity_test
example (f : ℕ) : unramifiedBaseChange (1 : GeneralLinearGroup (Fin 2) K) f = 1 := by sorry

-- TauCeti.GL2Transfer.bc_diagonal_square_test
example (A : GeneralLinearGroup (Fin 2) ℚ) (hA : A.val = !![2, 0; 0, 3]) :
    (unramifiedBaseChange A 2).val = !![4, 0; 0, 9] ∧
    (unramifiedBaseChange A 2).val.trace = 13 ∧
    (unramifiedBaseChange A 2).val.det = 36 := by sorry

-- TauCeti.GL2Transfer.bc_not_identity_test
example (A : GeneralLinearGroup (Fin 2) ℚ) (hA : A.val = !![2, 0; 0, 3]) :
    unramifiedBaseChange A 2 ≠ unramifiedBaseChange A 1 := by sorry

-- TauCeti.GL2Transfer.bc_tower_test
example (A : GeneralLinearGroup (Fin 2) ℚ) (hA : A.val = !![2, 0; 0, 3]) :
    (unramifiedBaseChange (unramifiedBaseChange A 2) 3).val = !![64, 0; 0, 729] ∧
    unramifiedBaseChange (unramifiedBaseChange A 2) 3 = unramifiedBaseChange A 6 := by sorry
end Satake

/- Signature omissions: Cyclic base change is a map only between the supplier's isobaric GL₂ classes over F and over the given prime-cyclic E/F, with the arithmetic LLC normalization and the R17.2 trace comparison, and its Galois invariance refers to the actual Gal(E/F) action on automorphic classes over E; a function between two arbitrary types, or invariance under an arbitrary self-map, is not this statement.
README targets: R17.4/cyclic-base-change.
Omitted declaration names: TauCeti.GL2Transfer.cyclicBaseChange, TauCeti.GL2Transfer.cyclicBaseChange_local, TauCeti.GL2Transfer.cyclicBaseChange_unramified, TauCeti.GL2Transfer.cyclicBaseChange_central, TauCeti.GL2Transfer.cyclicBaseChange_twist, TauCeti.GL2Transfer.cyclicBaseChange_galois, TauCeti.GL2Transfer.cyclicBaseChange_coefficients.
Full source-level tests awaiting the same carriers: TauCeti.GL2Transfer.cyclic_split_test, TauCeti.GL2Transfer.cyclic_inert_test, TauCeti.GL2Transfer.cyclic_induced_test, TauCeti.GL2Transfer.cyclic_odd_degree_test.
-/
section Cyclic
variable {FClass EClass V W LF LE H HF HE C K : Type*} [CommRing K]

-- TauCeti.GL2Transfer.cyclic_inert_test (matrix component)
example (A : GeneralLinearGroup (Fin 2) ℚ) (hA : A.val = !![2, 0; 0, 3]) :
    (unramifiedBaseChange A 2).val = !![4, 0; 0, 9] := by sorry
end Cyclic

/- Signature omissions: Solvable base change is the isobaric class map for a finite solvable Galois E/F with chosen compatible embeddings, characterized independently of a prime-cyclic tower; maps between arbitrary types cannot satisfy the identity, tower and twist laws simultaneously.
README targets: R17.4/solvable-base-change.
Omitted declaration names: TauCeti.GL2Transfer.solvableBaseChange, TauCeti.GL2Transfer.solvableBaseChange_refl, TauCeti.GL2Transfer.solvableBaseChange_tower, TauCeti.GL2Transfer.solvableBaseChange_local, TauCeti.GL2Transfer.solvableBaseChange_twist.
Full source-level tests awaiting the same carriers: TauCeti.GL2Transfer.solvable_empty_test, TauCeti.GL2Transfer.solvable_two_towers_test, TauCeti.GL2Transfer.solvable_degree_six_test, TauCeti.GL2Transfer.solvable_cuspidality_test.
-/
section Solvable
variable {FClass EClass LClass V W LF LE HF HE : Type*}

-- TauCeti.GL2Transfer.solvable_degree_six_test (matrix component)
example (A : GeneralLinearGroup (Fin 2) ℚ) (hA : A.val = !![2, 0; 0, 3]) :
    (unramifiedBaseChange (unramifiedBaseChange A 2) 3).val = !![64, 0; 0, 729] := by sorry
end Solvable

/- Signature omissions: The Gelbart–Jacquet construction needs the genuine unitary cuspidal GL₂ and isobaric GL₃ carriers, all-place local factors/LLC and the distinct highly ramified T-converse input. The matrix component below does not construct an automorphic lift.
README targets: R17.4/adjoint-lift.
Omitted declaration names: TauCeti.GL2Transfer.adjointLift, TauCeti.GL2Transfer.adjointLift_local, TauCeti.GL2Transfer.adjointLift_unramified, TauCeti.GL2Transfer.adjointLift_twist, TauCeti.GL2Transfer.adjointLift_central.
Full source-level tests awaiting the same carriers: TauCeti.GL2Transfer.adjoint_diagonal_test, TauCeti.GL2Transfer.adjoint_scalar_test, TauCeti.GL2Transfer.adjoint_twist_test, TauCeti.GL2Transfer.adjoint_not_sym_square_test.
-/
section AdjointMatrix
variable {K : Type*} [Field K]
/-- The diagonal matrix formula only; automorphic existence is the omitted
`adjointLift` interface. Nonzero Satake roots are required in comparisons. -/
def adjointSatakeDiagonal (α β : K) : Matrix (Fin 3) (Fin 3) K :=
  diagonal ![α / β, 1, β / α]

-- TauCeti.GL2Transfer.adjoint_diagonal_test (matrix component)
example : adjointSatakeDiagonal (2 : ℚ) 3 =
    !![2/3, 0, 0; 0, 1, 0; 0, 0, 3/2] := by sorry
-- TauCeti.GL2Transfer.adjoint_scalar_test (matrix component)
example (a : K) (ha : a ≠ 0) : adjointSatakeDiagonal a a = 1 := by sorry
-- TauCeti.GL2Transfer.adjoint_twist_test (matrix component)
example (α β u : K) (hu : u ≠ 0) :
    adjointSatakeDiagonal (u * α) (u * β) = adjointSatakeDiagonal α β := by sorry
-- TauCeti.GL2Transfer.adjoint_not_sym_square_test (matrix component)
example : adjointSatakeDiagonal (2 : ℚ) 3 ≠ diagonal ![4, 6, 9] := by sorry
end AdjointMatrix

/- Signature omissions: Non-normal cubic base change requires an actual separable cubic number-field extension, its places/residue degrees, the weak JPSS automorphic transfer and isobaric uniqueness. Its original construction and the stronger Carayol all-place upgrade remain separate source-proof gaps. No arbitrary function between carriers is a transfer.
README targets: R17.4/nonnormal-cubic-base-change.
Omitted declaration names: TauCeti.GL2Transfer.cubicBaseChange, TauCeti.GL2Transfer.cubicBaseChange_unramified, TauCeti.GL2Transfer.cubicBaseChange_twist, TauCeti.GL2Transfer.cubicBaseChange_central, TauCeti.GL2Transfer.cubicBaseChange_unique.
Full source-level tests awaiting the same carriers: TauCeti.GL2Transfer.cubic_split_test, TauCeti.GL2Transfer.cubic_one_two_test, TauCeti.GL2Transfer.cubic_inert_test, TauCeti.GL2Transfer.cubic_not_three_test.
-/
/- Signature omissions: Quadratic automorphic induction needs the quadratic K/F, the continuous Hecke-character carrier of K, its Galois conjugation, actual Weil induction and the isobaric and cuspidal GL₂ carriers; a map between arbitrary types, an arbitrary σ or an arbitrary cuspidal subtype does not express the cuspidality criterion.
README targets: R17.5/quadratic-induction.
Omitted declaration names: TauCeti.GL2Transfer.quadraticInduction, TauCeti.GL2Transfer.quadraticInduction_local, TauCeti.GL2Transfer.quadraticInduction_central, TauCeti.GL2Transfer.quadraticInduction_baseChange, TauCeti.GL2Transfer.quadraticInduction_twist, TauCeti.GL2Transfer.quadraticInduction_cuspidal.
Full source-level tests awaiting the same carriers: TauCeti.GL2Transfer.induction_invariant_test, TauCeti.GL2Transfer.induction_split_test, TauCeti.GL2Transfer.induction_determinant_test, TauCeti.GL2Transfer.induction_noninvariant_test.
-/
section QuadraticInduction
variable {FClass EClass H V L2 L1 HF C : Type*}

-- In the basis {e, g e} the parameter of a coset element g is antidiagonal; its
-- determinant -(a * b) carries the sign η_{K/F}(g) = -1.
-- TauCeti.GL2Transfer.induction_determinant_test (matrix component)
example {K : Type*} [CommRing K] (a b : K) :
    (!![0, a; b, 0] : Matrix (Fin 2) (Fin 2) K).det = -(a * b) := by sorry
end QuadraticInduction

/- Signature omissions: The non-norm JL domain, eligible cuspidal range, actual Hecke/local-factor maps, compatible rational models and prescribed infinity/globalization hypotheses are required. Equality of rationality fields does not itself provide those models.
README targets: R17.3/norm-exception, R17.3/split-hecke, R17.3/local-factors, R17.3/strong-multiplicity-one, R17.3/multiplicity-one, R17.3/coefficient-conjugation, R17.3/rational-models, R17.3/definite-infinity, R17.3/indefinite-parity, R17.3/invariant-exchange, R17.3/supercuspidal-globalization.
Omitted declaration names: TauCeti.GL2Transfer.norm_exception, TauCeti.GL2Transfer.split_hecke, TauCeti.GL2Transfer.local_factors, TauCeti.GL2Transfer.strong_multiplicity_one, TauCeti.GL2Transfer.multiplicity_one, TauCeti.GL2Transfer.coefficient_conjugation, TauCeti.GL2Transfer.rational_models, TauCeti.GL2Transfer.definite_infinity, TauCeti.GL2Transfer.invariant_exchange, TauCeti.GL2Transfer.supercuspidal_globalization.
-/

-- Pure parity consequence of the supplied ramification parity.
theorem indefinite_parity (d t : ℕ) (hd : 1 ≤ d) (h : Even ((d - 1) + t)) :
    t % 2 = (d - 1) % 2 := by sorry

/- Signature omissions: These R17.4 interfaces need the actual prime-cyclic or solvable extension, its Galois action on automorphic classes over E, the cuspidal subtypes, the norm-kernel characters and the localRep restriction maps; with arbitrary types, functions and ℓ they are false.
README targets: R17.4/local-compatibility, R17.4/cyclic-descent, R17.4/cuspidality, R17.4/cyclic-descent-fibers, R17.4/isobaric-fibers, R17.4/tower-independence, R17.4/solvable-descent, R17.4/prescribed-local-base-change.
Omitted declaration names: TauCeti.GL2Transfer.local_compatibility, TauCeti.GL2Transfer.cyclic_descent, TauCeti.GL2Transfer.cuspidality, TauCeti.GL2Transfer.cyclic_descent_fibers, TauCeti.GL2Transfer.isobaric_fibers, TauCeti.GL2Transfer.tower_independence, TauCeti.GL2Transfer.solvable_descent, TauCeti.GL2Transfer.prescribed_local_base_change.
-/
section BCTheorems
variable {FClass EClass CF CE H V W LF LE C : Type*}

/- Signature omissions: Cubic induction requires a cyclic degree-three number-field extension and its continuous Hecke-character carrier, actual Weil induction and local-factor maps. The non-invariant orbit is the cuspidal branch; an invariant character gives the three rank-one summands.
README targets: R17.4/cubic-character-induction.
Omitted declaration names: TauCeti.GL2Transfer.cubic_character_induction.
-/
/-
Signature omission: TauCeti.GL2Transfer.gl3_recognition.
The analytic input is AL.3/gln-converse-reduced-rank at n=3: all GL1 twists
(or twists unramified at the specified finite S), dual entireness, strip bounds
and the functional equation. Nonempty S gives agreement outside S only.
The highly ramified T variant requires the separate GJ78 §9.2 contract. The second input is
AL.3/rs-global-poles with rs-boundary-nonvanishing and finiteness at s=1 of the
omitted local factors (AL.2/jacquet-shalika-satake-bound at unramified places; the
requested AL.3 unitary local convergence bound at ramified and archimedean places), for two unitary cuspidal GL3
representations and equality of their Rankin–Selberg factors against the first
dual, not equality of arbitrary objects or an isobaric uniqueness theorem.
The actual representation, twist, completed L/epsilon and pole carriers are
missing; this omission is not a theorem signature. The adjoint and cubic
induction applications consume the analytic input.
-/

-- Carayol's extraordinary dyadic comparison (his §12.2.2 Proposition) is planned in
-- AutomorphicGaloisRepresentations R19.2 (R19.2/carayol-cubic-base-change-of-extraordinary),
-- which imports the cubic transfer and Artin automorphy from here; it is not restated.
end BCTheorems

/- Signature omissions: The torsion-idele character extension needs the idele
class group of a number field, the quotient μ_n(F)\μ_n(𝔸_F) and the complex-place
condition. It is not extension with prescribed characters on full F_v×, as
needed by R17.5/tunnell-primitive-globalization and prescribed-local-induction.
The latter also requires compatible CM infinity types. Current Tau Ceti has
HeckeCharacter and finiteComponent, but these carriers are absent at the pin;
the current library's factorization of an existing finite-order character
through a ray class group is not the simultaneous prescription theorem.
Residual lifting needs a totally real field, a continuous absolutely
irreducible solvable r̄ and an adequate integral coefficient ring; over
arbitrary groups and rings both existence claims are false.
README targets: R17.5/finite-hecke-extension, R17.5/odd-residual-lift.
Omitted declaration names: TauCeti.GL2Transfer.finite_hecke_extension, TauCeti.GL2Transfer.odd_residual_lift.
-/
/- A concrete domain test: the unramified quadratic character of ℚ₂× and
the trivial character agree on integral units and torsion, but differ at 2.
This proves no global extension theorem. -/
section FullLocalCharacterTests
open Filter
open scoped Topology

private def unramifiedQuadraticTwo : ContinuousMonoidHom ℚ_[2]ˣ ℂˣ where
  toFun u := (-1 : ℂˣ) ^ (u : ℚ_[2]).valuation
  map_one' := by simp
  map_mul' u v := by
    simp only [Units.val_mul, Padic.valuation_mul u.ne_zero v.ne_zero, _root_.zpow_add]
  continuous_toFun := by
    apply IsLocallyConstant.continuous
    rw [IsLocallyConstant.iff_eventually_eq]
    intro u
    have hball : ∀ᶠ v : ℚ_[2]ˣ in 𝓝 u, ‖(v : ℚ_[2]) - u‖ < ‖(u : ℚ_[2])‖ :=
      (Units.continuous_val.sub continuous_const).norm.continuousAt.eventually
        (gt_mem_nhds (by simp))
    filter_upwards [hball] with v hv
    have hn := Padic.norm_eq_of_norm_sub_lt_right hv
    rw [Padic.norm_eq_zpow_neg_valuation v.ne_zero,
      Padic.norm_eq_zpow_neg_valuation u.ne_zero] at hn
    have he : (v : ℚ_[2]).valuation = (u : ℚ_[2]).valuation := by
      exact neg_injective ((zpow_right_inj₀ (by norm_num : (0 : ℝ) < 2)
        (by norm_num : (2 : ℝ) ≠ 1)).mp hn)
    rw [he]

private def twoUnit : ℚ_[2]ˣ := Units.mk0 2 (by norm_num)

example : unramifiedQuadraticTwo twoUnit = (-1 : ℂˣ) := by
  change (-1 : ℂˣ) ^ Padic.valuation (2 : ℚ_[2]) = -1
  rw [show Padic.valuation (2 : ℚ_[2]) = 1 from by
    exact Padic.valuation_p (p := 2), zpow_one]

example (u : ℚ_[2]ˣ) (hu : (u : ℚ_[2]).valuation = 0) :
    unramifiedQuadraticTwo u = 1 := by
  change (-1 : ℂˣ) ^ (u : ℚ_[2]).valuation = 1
  rw [hu, zpow_zero]

example (u : ℚ_[2]ˣ) : unramifiedQuadraticTwo u ^ 2 = 1 := by
  change ((-1 : ℂˣ) ^ (u : ℚ_[2]).valuation) ^ 2 = 1
  rw [← zpow_natCast, ← _root_.zpow_mul, mul_comm, _root_.zpow_mul]
  norm_num

example (u : ℚ_[2]ˣ) (hu : IsOfFinOrder u) : unramifiedQuadraticTwo u = 1 := by
  obtain ⟨n, hn, hpow⟩ := isOfFinOrder_iff_pow_eq_one.mp hu
  have hv : (u : ℚ_[2]).valuation = 0 := by
    have hp : (u : ℚ_[2]) ^ n = 1 := congrArg Units.val hpow
    have he := congrArg Padic.valuation hp
    rw [Padic.valuation_pow, Padic.valuation_one] at he
    exact (mul_eq_zero.mp he).resolve_left (by exact_mod_cast hn.ne')
  change (-1 : ℂˣ) ^ (u : ℚ_[2]).valuation = 1
  rw [hv, zpow_zero]

example : unramifiedQuadraticTwo ≠ 1 := by
  intro h
  have he := DFunLike.congr_fun h twoUnit
  change (-1 : ℂˣ) ^ Padic.valuation (2 : ℚ_[2]) = 1 at he
  rw [show Padic.valuation (2 : ℚ_[2]) = 1 from by
    exact Padic.valuation_p (p := 2), zpow_one] at he
  have hcoe := congrArg (fun u : ℂˣ => (u : ℂ)) he
  norm_num at hcoe

end FullLocalCharacterTests

section ArithmeticLifting
variable {G I T : Type*} [Group G] [Group I] [Group T]

-- AddCircle 1 over Q is the existing additive Q/Z quotient, with trivial action.
-- Q/Z is discrete, so continuous cochains on the Krull-topologized G_F are the
-- locally constant ones. The equation displays exactly the trivial-action
-- 2-cocycle condition, without a fake H² type. Generic groups fail this.
theorem tate_vanishing (F : Type*) [Field F] [NumberField F]
    (α : Field.absoluteGaloisGroup F → Field.absoluteGaloisGroup F → AddCircle (1 : ℚ))
    (hcont : IsLocallyConstant
      (fun p : Field.absoluteGaloisGroup F × Field.absoluteGaloisGroup F => α p.1 p.2))
    (hα : ∀ g h k, α g h + α (g * h) k = α g (h * k) + α h k) :
    ∃ b : Field.absoluteGaloisGroup F → AddCircle (1 : ℚ),
      IsLocallyConstant b ∧ ∀ g h, α g h = b g + b h - b (g * h) := by sorry

-- r is continuous with discrete finite image, i.e. its kernel is open in the
-- Krull topology; the lift has the same property. Generic groups do not have
-- this lifting property. The matrix/projective carriers are already in Mathlib.
theorem finite_projective_lift (F : Type*) [Field F] [NumberField F]
    (r : Field.absoluteGaloisGroup F →* ProjGenLinGroup (Fin 2) ℂ)
    (hr : IsOpen (r.ker : Set (Field.absoluteGaloisGroup F))) :
    ∃ ρ : Field.absoluteGaloisGroup F →* GeneralLinearGroup (Fin 2) ℂ,
      IsOpen (ρ.ker : Set (Field.absoluteGaloisGroup F)) ∧ Set.Finite (Set.range ρ) ∧
        ProjGenLinGroup.mk.comp ρ = r := by sorry

end ArithmeticLifting

/- Signature omissions: The continuous finite-image irreducible Galois representation, actual projective-image classification, local Weil data and automorphic parameter maps must be typed. The dihedral/tetrahedral/octahedral/solvable source hypotheses cannot be discarded from the existential automorphy statement.
README targets: R17.5/dihedral-artin, R17.5/tetrahedral-artin, R17.5/octahedral-artin, R17.5/solvable-artin.
Omitted declaration names: TauCeti.GL2Transfer.dihedral_artin, TauCeti.GL2Transfer.tetrahedral_artin, TauCeti.GL2Transfer.octahedral_artin, TauCeti.GL2Transfer.solvable_artin.
-/
/- Signature omissions: Use the actual G_Q or totally-real G_F, finite-image irreducible odd representation, its solvable image and the genuine weight-one classical/adelic dictionary. Conductor, nebentypus and all-place infinity-type hypotheses remain. The totally real extension is still requested from R16.6.
README targets: R17.5/q-weight-one, R17.5/tr-weight-one, R17.5/residual-lt-application.
Omitted declaration names: TauCeti.GL2Transfer.q_weight_one, TauCeti.GL2Transfer.tr_weight_one, TauCeti.GL2Transfer.residual_lt_application.
-/
/-! The finite section for the mod-three application. -/
/- Signature omissions: Tunnell's globalisation, Carayol's prescribed-local induction and the octahedral mod-3 application need the p-adic Weil group, the number-field globalisation data, the CM Hecke-character carrier and the normalized weight-one newform carrier; existence over arbitrary index types and maps is false.
README targets: R17.5/tunnell-primitive-globalization, R17.5/prescribed-local-induction, R17.5/octahedral-mod-three-application.
Omitted declaration names: TauCeti.GL2Transfer.tunnell_primitive_globalization, TauCeti.GL2Transfer.prescribed_local_induction, TauCeti.GL2Transfer.octahedral_mod_three_application.
-/
section FiniteSection

/-- Reduction modulo λ = (1 + √−2): ℤ[√−2] → F₃, sending √−2 to −1. -/
def redSqrtNegTwo : ℤ√(-2) →+* ZMod 3 := Zsqrtd.lift ⟨-1, by decide⟩

/-- The section used by the octahedral mod-3 application (Darmon–Diamond–Taylor,
Theorem 3.14(a)): an injective homomorphism GL₂(F₃) → GL₂(ℤ[√−2]) reducing to the
identity modulo (1 + √−2). Use the explicit generators in Darmon–Diamond–Taylor; the matrix
and quadratic-integer carriers already exist at the pins. -/
theorem gl2F3_section :
    ∃ s : GeneralLinearGroup (Fin 2) (ZMod 3) →* GeneralLinearGroup (Fin 2) (ℤ√(-2)),
      Function.Injective s ∧
        (GeneralLinearGroup.map redSqrtNegTwo).comp s = MonoidHom.id _ := by sorry

end FiniteSection

/- Signature omissions: The characteristic-two applications need G_Q, continuity, absolute irreducibility with the stated projective image, and the actual Katz, classical and witness carriers with their q-expansion, level, character, conductor and residual maps; existence claims over arbitrary carriers and maps are false.
README targets: R17.6/solvable-dihedral, R17.6/rt-technical-lemma, R17.6/serre-odd-trick, R17.6/rohrlich-tunnell, R17.6/wiese-odd-lift, R17.6/unramified-katz, R17.6/qualitative-residual-modularity, R17.6/weight-two-witness.
Omitted declaration names: TauCeti.GL2Transfer.solvable_dihedral, TauCeti.GL2Transfer.rt_technical_lemma, TauCeti.GL2Transfer.serre_odd_trick, TauCeti.GL2Transfer.rohrlich_tunnell, TauCeti.GL2Transfer.wiese_odd_lift, TauCeti.GL2Transfer.unramified_katz, TauCeti.GL2Transfer.qualitative_residual_modularity, TauCeti.GL2Transfer.weight_two_witness.
-/
/- Signature omissions: The classical attachments in R17.6 require the actual
modular-curve eigenprojector realization, coefficient descent and integral
ramified local–global comparison. Good-place trace data alone do not supply them.
README targets: R17.6/classical-higher-weight-attachment,
R17.6/classical-weight-one-attachment, R17.6/classical-conductor-comparison.
Suggested names: TauCeti.GL2Transfer.classical_higher_weight_attachment,
TauCeti.GL2Transfer.classical_weight_one_attachment,
TauCeti.GL2Transfer.classical_conductor_comparison.
-/
section CharacteristicTwo
variable {G : Type*} [Group G] {k : Type*} [Field k] [CharP k 2]

-- Missing: k algebraically closed, r continuous absolutely irreducible with
-- finite solvable projective image. Here is the actual scalar normalization;
-- the identification of its linear image with odd dihedral D_n is in the README.
theorem determinant_untwist (r : G →* GeneralLinearGroup (Fin 2) k)
    (hfinite : Set.Finite (Set.range r)) :
    ∃ ξ : G →* kˣ, Set.Finite (Set.range ξ) ∧
      ∀ g, ξ g ^ 2 = GeneralLinearGroup.det (r g) ∧
        GeneralLinearGroup.det (GeneralLinearGroup.scalar (Fin 2) (ξ g)⁻¹ * r g) = 1 := by sorry

-- Missing: r̄₀ = Ind φ, its Teichmüller lift φ̃, D = disc K, normF = N_{K/Q} f(φ̃) and
-- N = N(r̄₀); hcond is the conductor formula |D|·N f(φ̃) = 2^ν N proved in the README.
-- hfund is the 2-adic shape of a fundamental discriminant. Given these, the four
-- dyadic cases of Rohrlich–Tunnell §2 fix ν (case (ii) is printed "D ≡ ±5 (mod 8)",
-- and ν = 3 belongs to case (iv), not (iii)).
theorem teichmuller_conductor (D : ℤ) (normF N ν : ℕ) (hN : Odd N)
    (hfund : D % 4 = 1 ∨ D % 16 = 8 ∨ D % 16 = 12)
    (hcond : D.natAbs * normF = 2 ^ ν * N) :
    (Odd D → Odd normF → ν = 0) ∧ (D % 8 = 5 → normF % 8 = 4 → ν = 2) ∧
      (D % 8 = 4 → Odd normF → ν = 2) ∧ (D % 8 = 0 → Odd normF → ν = 3) := by sorry

end CharacteristicTwo

/- Signature omissions: Compatible descent and the potential-modularity interface need the actual cyclic or solvable automorphic descent, Galois invariance, a λ-independent twist and the R23 extension data; existence over an arbitrary class type is false.
README targets: R17.6/compatible-descent, R17.6/potential-modularity-interface.
Omitted declaration names: TauCeti.GL2Transfer.compatible_descent, TauCeti.GL2Transfer.potential_modularity_interface.
-/
section TransferExports
variable {G H V W FClass EClass Λ K : Type*} [Group G] [Group H] [Field K]

-- Missing the Galois specialization: G=G_F, H=G_E, i the restriction. Linear
-- disjointness of E from the projective-kernel field M is exactly what gives
-- hdisj (G_E surjects onto Gal(M/F)). Equality of projective ranges is the
-- criterion that gives residual absolute irreducibility, imported from R01.4.
theorem disjoint_irreducibility (i : H →* G)
    (r : G →* GeneralLinearGroup (Fin 2) K)
    (hdisj : i.range ⊔ (ProjGenLinGroup.mk.comp r).ker = ⊤) :
    Set.range (ProjGenLinGroup.mk.comp (r.comp i)) = Set.range (ProjGenLinGroup.mk.comp r) := by sorry

-- The index-two Mackey criterion on Mathlib's induced representation, over any
-- algebraically closed field (characteristic two included); over ℚ it fails, e.g.
-- for Z/4 ⊃ Z/2 and the sign character. Missing only the Galois specialization:
-- Γ = G_F, Kgp = G_K for the quadratic K/F and E = G_E for a finite E/F. σθ is the
-- one-dimensional representation of θ. In characteristic zero and for finite Γ,
-- TauCeti.simple_indFDRep_ofLinearCharacter_iff is the pinned unrestricted case.
-- Restricted to E, Ind θ is irreducible exactly when E ⊄ Kgp and θ differs from
-- its conjugate on E ∩ Kgp; when E ≤ Kgp it is the sum of two characters.
theorem quadratic_restriction {Γ k : Type*} [Group Γ] [Field k] [IsAlgClosed k]
    (Kgp E : Subgroup Γ)
    [Kgp.Normal] (hK : Kgp.index = 2) (θ : Kgp →* kˣ) (σθ : Representation k Kgp k)
    (hσθ : ∀ x, σθ x = (θ x : k) • LinearMap.id) :
    Representation.IsIrreducible ((Representation.ind Kgp.subtype σθ).comp E.subtype) ↔
      ∃ s ∈ E, s ∉ Kgp ∧ ∃ x : Kgp, (x : Γ) ∈ E ∧ θ x ≠ θ (MulAut.conjNormal s x) := by
  sorry

-- Missing the actual compatible-family polynomial projection and λ-independent
-- coefficient field; this explicit formula compares each restricted Frobenius.
theorem compatible_base_change (ρ : Λ → G →* GeneralLinearGroup (Fin 2) K)
    (i : H →* G) (FrobF : V → G) (FrobE : W → H) (below : W → V) (f : W → ℕ)
    (hfrob : ∀ w, i (FrobE w) = FrobF (below w) ^ f w) :
    ∀ ell w, ρ ell (i (FrobE w)) = unramifiedBaseChange (ρ ell (FrobF (below w))) (f w) := by sorry

end TransferExports

end TauCeti.GL2Transfer
