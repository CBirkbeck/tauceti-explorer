/-
This file is not the roadmap and is not exhaustive. The companion roadmap document
is definitive. These statements suggest Lean forms so contributors and reviewers
can converge on names and signatures. They claim no implementation.

The pins have the matrix group, representations and invariants used below. They
lack the SR/AF/AL/AS/ET supplier interfaces for smooth irreducible classes,
automorphic classes, Weil parameters, analytic test functions and trace terms.
Capitalized carrier parameters and the operations on them denote those suppliers'
actual objects; they are not new representation definitions. Unavailable
conditions are listed beside signatures and omitted, never represented by dummy
Prop-valued fields. A signature with omitted conditions is NOT a theorem for
arbitrary carrier parameters or functions. The packet states the full mathematics.

The suggested file checks signatures and discriminating examples only. It imports
individual modules at the pinned Mathlib. The pinned Tau Ceti Newform and symmetric
power declarations were read; their .olean files are unavailable in the shared
build, so this file uses parameters for those existing carriers/operations instead
of importing a later substitute or rebuilding them. The full Hilbert tensor and
primitive newform subtype must replace these parameters when the suppliers exist.
Each packet test name immediately precedes its example.
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

noncomputable section
set_option linter.unusedVariables false
set_option linter.unusedSectionVars false

namespace TauCeti.GL2Blueprint
open Matrix

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

/-
Explicit signature omissions (PROTOCOL §13; REV-FIX-RT-AREA-automorphic-1~3).
The AA.0 Haar product, AA.1 adelic group, AA.2 quotient/central-character L² and AL.0 test-function carriers are absent. An arbitrary compact set, measure or vector space cannot satisfy these GL₂ identifications.
These source targets require the actual supplier objects and hypotheses below.
They are not universal theorems about arbitrary types, functions, or multiplicity maps.
Omitted declaration names: TauCeti.GL2Blueprint.compactComparison, TauCeti.GL2Blueprint.iwasawaCartan, TauCeti.GL2Blueprint.haarComparison, TauCeti.GL2Blueprint.finiteLevelComparison.

GL2AutomorphicRepresentationsAndTransfer:R16.1/local-adelic-compact-comparison
TauCeti.GL2Blueprint.compactComparison
For any number field F, identify the generic reductive group GL₂(Fv) with existing matrix units. At finite v the standard maximal compact is GL₂(Ov); at real v it is O(2); at complex v it is U(2). The adelic compact is their product, and its finite part is compact open in the restricted product with respect to GL₂(Ov). K₀(pvⁿ), K₁(pvⁿ) and finite products of these are compact open at finite places. All topology and restricted-product identifications are those of AA.1.
Hypotheses: F a number field; chosen place completions and valuation rings.

GL2AutomorphicRepresentationsAndTransfer:R16.1/iwasawa-cartan
TauCeti.GL2Blueprint.iwasawaCartan
Specialize RG2.4 at finite places and AF.1 at infinity: GL₂(Fv)=B(Fv)K_v. At a finite place every double coset K_v g K_v has a unique representative diag(ϖᵃ,ϖᵇ) with a≥b integers. With upper triangular B and normalized induction, δB(diag(a,d))=|a/d|v. At infinity use positive singular values and O(2)/U(2).
Hypotheses: Chosen uniformizer at finite v; upper triangular B.

GL2AutomorphicRepresentationsAndTransfer:R16.1/haar-quotient-comparison
TauCeti.GL2Blueprint.haarComparison
Fix local measures dg_v on GL₂(Fv), vol(GL₂(Ov))=1 at finite places outside a specified finite set; form AA.0’s restricted Haar product. GL₂ is unimodular. For a continuous unitary idele-class character ω use AA.2’s quotient measure and central-character L² space on Z(𝔸)GL₂(F)\GL₂(𝔸): f(zγg)=ω(z)f(g), with finite integral of |f|². The matrix realization is an isometric right-translation-equivariant identification with AA.2/central-character-l2. Measures on elliptic centralizers are fixed separately, not inferred from dg_v.
Hypotheses: ω unitary and trivial on F×; quotient is formed by the closed subgroup specified by AA.2.

GL2AutomorphicRepresentationsAndTransfer:R16.1/finite-level-comparison
TauCeti.GL2Blueprint.finiteLevelComparison
At compact open Kf, the GL₂ finite-level space is the Kf-fixed subspace of AF.2’s automorphic forms with chosen central character, finite K∞ types and infinitesimal-character ideal. Using the finite double-coset decomposition GL₂(𝔸)=⊔GL₂(F)tᵢGL₂(F∞)Kf, restriction identifies it with the direct sum of classical spaces on Γᵢ\GL₂(F∞), with Γᵢ the corresponding arithmetic stabilizer. The central character, growth, differential and right-translation conditions are transported, not redefined. AL.0 owns additive Schwartz–Bruhat/Fourier theory; SR.1 owns the compactly supported smooth Hecke carrier.
Hypotheses: Kf compact open; finite type and finite-codimension annihilator data as in AF.2.
-/
section LocalRepresentation
variable {G V : Type*} [Group G] [AddCommGroup V] [Module ℂ V]
-- Missing: P is the SR.2 irreducible admissible GL₂(F) class carrier, with the
-- stated normalized induction and exceptional ν^{±1} ratios, and S supercuspidal.
theorem localClassification {P C S : Type*} (principal : C → C → P)
    (special detCharacter : C → P) (supercuspidal : S → P) (π : P) :
    (∃ a b, π = principal a b) ∨ (∃ a, π = special a) ∨
      (∃ a, π = detCharacter a) ∨ (∃ σ, π = supercuspidal σ) := by sorry

-- Missing: ρ is irreducible admissible infinite-dimensional GL₂(F), F a
-- nonarchimedean local field of characteristic zero, and K n = K₁(pⁿ).
-- This existence assertion precedes the least-level definition; it does not
-- assume a conductor or the subsequent Casselman dimension formula.
theorem newvectorLevelExists (ρ : Representation ℂ G V) (K : ℕ → Subgroup G) :
    ∃ n, ∃ v ∈ (Representation.invariants (ρ.comp (K n).subtype)), v ≠ 0 := by sorry

/-- Algebraic least-level signature. In GL₂ the subgroups are K₁(pⁿ).
The preceding newvectorLevelExists supplies hex under its stated conditions. -/
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
-- TauCeti.GL2Blueprint.conductor_steinberg
-- Missing: ρ is an unramified Steinberg twist and K=K₁(pⁿ).
example (ρ : Representation ℂ G V) (K : ℕ → Subgroup G)
    (hex : ∃ n, ∃ v ∈ (Representation.invariants (ρ.comp (K n).subtype)), v ≠ 0) :
    conductorExponent ρ K hex = 1 := by sorry
-- TauCeti.GL2Blueprint.conductor_ramified_steinberg
-- Missing: ρ=St⊗χdet, K=K₁(pⁿ), a=a(χ)≥2.
-- At a=1 the two expressions coincide, so it cannot detect the wrong rule.
example (ρ : Representation ℂ G V) (K : ℕ → Subgroup G) (a : ℕ) (ha : 2 ≤ a)
    (hex : ∃ n, ∃ v ∈ (Representation.invariants (ρ.comp (K n).subtype)), v ≠ 0) :
    conductorExponent ρ K hex = 2 * a ∧ conductorExponent ρ K hex ≠ 1 + a := by sorry
-- Missing: ρ is irreducible admissible infinite-dimensional GL₂(F), K=K₁(pⁿ).
theorem casselmanNewvector (ρ : Representation ℂ G V) (K : ℕ → Subgroup G)
    (hex : ∃ n, ∃ v ∈ (Representation.invariants (ρ.comp (K n).subtype)), v ≠ 0) (n : ℕ) :
    Module.finrank ℂ (Representation.invariants (ρ.comp (K n).subtype)) =
      n + 1 - conductorExponent ρ K hex := by sorry

/-- A normalized element of an actual one-dimensional fixed submodule.
ell must be SR.5's chosen Whittaker functional restricted to that line. -/
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
-- Missing: V_I,V_K are the supplied fixed spaces of an unramified generic π;
-- U is the indicated double-coset operator and v its spherical generator.
theorem iwahoriOldforms {V_I V_K : Type*} [AddCommGroup V_I] [Module ℂ V_I]
    [AddCommGroup V_K] [Module ℂ V_K] :
    Module.finrank ℂ V_I = 2 ∧ Module.finrank ℂ V_K = 1 := by sorry
-- Missing: the actual SR.4 Iwahori algebra, invertible q and q+1, U₀,U₁ and eK.
theorem iwahoriCenter {H : Type*} [Ring H] (q : H) (U₀ U₁ : Hˣ) :
    ∀ h : H, ((U₁ : H) + q * U₀ * ((U₁⁻¹ : Hˣ) : H)) * h =
      h * ((U₁ : H) + q * U₀ * ((U₁⁻¹ : Hˣ) : H)) := by sorry
-- Missing: C is SR.5's existing C_c^∞(F×) Kirillov model, π supercuspidal.
theorem supercuspidalKirillov {V C : Type*} [AddCommGroup V] [Module ℂ V]
    [AddCommGroup C] [Module ℂ C] : Nonempty (V ≃ₗ[ℂ] C) := by sorry
-- Missing: P is the supercuspidal class, KType the typical K-type class,
-- occurrences mean the supplier Hom multiplicity, and χ ranges over unramified twists.
theorem henniartUnicity {P KType : Type*} (typical : P → KType) (π : P)
    (multiplicity : KType → P → ℕ) : multiplicity (typical π) π = 1 := by sorry
-- Missing: f is a surjection in the fixed-central-character smooth category,
-- π is supercuspidal; unrestricted/mod-p projectivity is not the assertion.
theorem supercuspidalProjective {P A B : Type*} (f : A → B)
    (hf : Function.Surjective f) (g : P → B) : ∃ h : P → A, f ∘ h = g := by sorry
end Spherical

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
-- TauCeti.GL2Blueprint.cdtVexingType_distinct_inertia
-- Missing: fullType is Θ(θ), π has a different inertial pair; occurrence
-- is Hom_K multiplicity in the full principal-congruence fixed space.
example {P KType : Type*} (π : P) (fullType : KType)
    (occurrence : KType → P → ℕ) : occurrence fullType π = 0 := by sorry
-- TauCeti.GL2Blueprint.cdtVexingType_unramified_twist
example (Θ Θ' : Representation ℂ G V) (ι : H →* G)
    (he : ∀ g, Θ g = Θ' g) : cdtVexingType Θ ι = cdtVexingType Θ' ι := by sorry
-- Missing: Pi has the specified CDT regular inertial parameter; Fixed is
-- Pi^{U(xⁿ)} and ΘSpace is its full type, not only its U₀ restriction.
theorem cdtInertiaMultiplicity {Fixed ΘSpace : Type*} [AddCommGroup Fixed]
    [Module ℂ Fixed] [AddCommGroup ΘSpace] [Module ℂ ΘSpace] :
    Nonempty (Fixed ≃ₗ[ℂ] ΘSpace) := by sorry
end CDT

section Parameters
-- P and C are the ET.6 local class and character carriers; W its existing WD
-- isomorphism class. Missing: reciprocity, N, induction and LLC compatibility.
theorem principalParameter {P C W : Type*} (induction : C → C → P)
    (rec : P → W) (directSum : C → C → W) (χ₁ χ₂ : C) :
    rec (induction χ₁ χ₂) = directSum χ₁ χ₂ := by sorry
/-- The concrete nonzero monodromy calculation in geometric Frobenius coordinates.
Missing from this signature: embedding this matrix pair in R01.2's WD carrier. -/
theorem steinbergParameter (q α : ℂ) (hq : q ≠ 0) (hα : α ≠ 0) :
    let N : Matrix (Fin 2) (Fin 2) ℂ := !![0, 1; 0, 0]
    let R : Matrix (Fin 2) (Fin 2) ℂ := !![α / q, 0; 0, α * q]
    N ^ 2 = 0 ∧ N ≠ 0 ∧ R * N = (q ^ 2)⁻¹ • (N * R) := by sorry
-- Here q is the square root of the residue cardinality. N is NOT discarded.
-- Missing: π supercuspidal, r its ET.6 irreducible Weil parameter, L its AL.2 factor.
theorem supercuspidalParameter {P : Type*} (π : P) (L : P → ℂ → ℂ) :
    ∀ s, L π s = 1 := by sorry
-- Missing: A is Frobenius of recπ; the actual Tate rec has this scalar half-twist.
theorem normalizationBridge (A : Matrix (Fin 2) (Fin 2) ℂ) (u : ℂ) :
    (u • A).det = u ^ 2 * A.det := by sorry
-- Missing: π generic, c its newvector conductor, epsilon the self-dual AL.2 factor.
theorem conductorEpsilon {P : Type*} (π : P) (c : P → ℕ) (q : ℂ)
    (ε : P → ℂ → ℂ) (s : ℂ) :
    ε π s = ε π (1 / 2) * q ^ (-(c π : ℂ) * (s - 1 / 2)) := by sorry
-- Missing: D and realInd are AF.1b's full O(2) D_k and induced Weil parameter;
-- m≥1, while m=0 is a split/limit boundary, and complex cases have no discrete series.
theorem archimedeanClassification {P W : Type*} (D : ℕ → ℂ → P)
    (realInd : ℕ → ℂ → W) (rec : P → W) (m : ℕ) (hm : 1 ≤ m) (t : ℂ) :
    rec (D (m + 1) t) = realInd m t := by sorry
-- Missing: gammaC is Γ_C, D_k is the supplied archimedean representation,
-- standardL the AL.2 factor; k≥2 is essential.
theorem archimedeanFactors {P : Type*} (D : ℕ → P)
    (standardL : P → ℂ → ℂ) (gammaC : ℂ → ℂ) (k : ℕ) (hk : 2 ≤ k) (s : ℂ) :
    standardL (D k) s = gammaC (s + ((k : ℂ) - 1) / 2) := by sorry

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
lemma tamelyDihedral_conjugate {C W : Type*} (ind : C → W) (σ : C → C) :
    ∀ θ, ind (σ θ) = ind θ := by sorry
-- Missing in conjugate: σ is the nontrivial unramified-quadratic Galois action.
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
-- Missing: supercuspidal is the actual subset of ET.6's P, with its irreducible
-- parameter criterion. The exact-order argument includes residue characteristic two.
theorem tamelyDihedralSupercuspidal {P C W : Type*} (ℓ q : ℕ)
    (rec : P → W) (ind : C → W) (inertiaOrder : C → ℕ)
    (supercuspidal : Set P) :
    tamelyDihedral P C W ℓ q rec ind inertiaOrder ⊆ supercuspidal := by sorry
end Parameters

section Global
/-
Explicit signature omissions (PROTOCOL §13; REV-FIX-RT-AREA-automorphic-1~3).
Use AL.3 Fourier reconstruction, global-whittaker-factorization and global-multiplicity-one, then AL.3 strong-multiplicity-one. The source π, its cusp embedding, its actual local components and its rational model are indispensable. The old statements quantified over unrelated functions and multiplicities.
These source targets require the actual supplier objects and hypotheses below.
They are not universal theorems about arbitrary types, functions, or multiplicity maps.
Omitted declaration names: TauCeti.GL2Blueprint.cuspidalTensor, TauCeti.GL2Blueprint.globalWhittakerExpansion, TauCeti.GL2Blueprint.globalMultiplicityOne, TauCeti.GL2Blueprint.strongMultiplicityOne, TauCeti.GL2Blueprint.cohomologicalRationality.

GL2AutomorphicRepresentationsAndTransfer:R16.4/cuspidal-tensor-factorization
TauCeti.GL2Blueprint.cuspidalTensor
For unitary central character ω trivial on F×, the smooth K∞-finite cuspidal spectrum in AA.2’s L² space is AS.4’s algebraic Hilbert-direct-sum decomposition with finite multiplicities. Every irreducible constituent has the AF.2 restricted tensor factorization ⊗′vπv, with spherical distinguished vectors at almost all finite v. Identify this algebraic factorization with the corresponding smooth vectors of its Hilbert completion and with the Whittaker tensor model. Multiplicity one is proved below; it is not assumed in this comparison. Nonunitary cuspidal representations are handled after an explicitly recorded norm twist.
Hypotheses: F number field; central character unitary for L²; admissible local factors and AF.2 distinguished-vector data.

GL2AutomorphicRepresentationsAndTransfer:R16.4/global-whittaker-expansion
TauCeti.GL2Blueprint.globalWhittakerExpansion
Fix nontrivial ψ:F\𝔸→ℂ× and additive Haar mass vol(F\𝔸)=1. For a smooth K∞-finite cuspidal φ, Wφ(g)=∫_{F\𝔸}φ(n(x)g)ψ(−x)dx and φ(g)=Σ_{a∈F×}Wφ(diag(a,1)g), with the convergence appropriate to smooth cusp forms, locally uniform after the stated differentiability/growth estimates. The coefficient map is injective and equivariant. Specialize AL.3’s general GLn Fourier–Whittaker expansion; the GL₂ unipotent has a single additive coordinate. This declaration is in R16.4, upstream of both multiplicity and the integral comparison.
Hypotheses: Cuspidality supplies zero constant term; smooth automorphic form with supplier growth estimates; global ψ and compatible self-dual local measures.

GL2AutomorphicRepresentationsAndTransfer:R16.4/global-multiplicity-one
TauCeti.GL2Blueprint.globalMultiplicityOne
Every irreducible cuspidal automorphic GL₂(𝔸F) representation occurs with multiplicity one in the smooth cuspidal spectrum with its central character. The Whittaker coefficient identifies its realization with the restricted tensor product of the local Whittaker models, uniquely once ψ and almost-all spherical normalizations are fixed. Equivalently, two equivariant embeddings of the same irreducible representation into the cusp space are scalar multiples.
Hypotheses: Number field F; characteristic-zero automorphic forms; unitary twist when working inside L².

GL2AutomorphicRepresentationsAndTransfer:R16.4/strong-multiplicity-one
TauCeti.GL2Blueprint.strongMultiplicityOne
Let π,π′ be cuspidal automorphic representations of GL₂(𝔸F). If there is a finite set S of finite places containing their ramification and πv≅π′v for every finite v outside S, then π≅π′ globally, including every v in S and every infinite place. Equality at a density-one subset is not substituted for this cofinite condition. At an unramified place, equality means the unordered Satake pair, equivalently both standard Hecke trace and determinant data, not a single incomplete eigenvalue without central character.
Hypotheses: Cuspidal GL₂ over a number field; isomorphism at all finite places outside one finite set.

GL2AutomorphicRepresentationsAndTransfer:R16.4/cohomological-rationality
TauCeti.GL2Blueprint.cohomologicalRationality
For regular algebraic cuspidal GL₂ representations, import AF.4’s rationality field Q(π), the fixed field of automorphisms preserving the finite-part isomorphism class, and Clozel’s finite-part Q(π)-model. Specialize its semilinear Galois conjugation to the GL₂ Hecke operators and algebraic infinitesimal character. For a holomorphic newform f of weight k≥2 over ℚ, make this comparison for π_alg=π_f⊗|det|^{−(k−2)/2}, where π_f is unitary: the unnormalized spherical T₁ eigenvalue is a_p and T₀ eigenvalue is χ(p)p^{k−2}. Then Q(π_alg) is the field generated by the normalized newform coefficients and compatible nebentypus values. A claim about the field generated by raw unitary Satake roots is not this rationality theorem. Neither periods nor an integral lattice are canonical. Étale/cohomological rationality and Galois realization required by R19 belong to that geometric owner.
Hypotheses: Regular algebraic cuspidal π; distinguish field of rationality from a field of definition before invoking AF.4. Use the algebraic determinant twist just displayed in the holomorphic comparison; regular algebraicity is not inferred from arbitrary unitary normalization.
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
/-
Explicit signature omissions (PROTOCOL §13; REV-FIX-RT-AREA-automorphic-1~3).
The actual Rankin–Selberg integrals and completed L-functions are unavailable. The GL₂ converse needs every Hecke-quasicharacter twist, generic local factors/Casselman–Wallach globalizations, central-character automorphy, Euler convergence, dual entireness, strip bounds and the epsilon functional equations. AL.3/gln-converse-full-rank is used at n=2; reduced rank gives no n=2 theorem.
These source targets require the actual supplier objects and hypotheses below.
They are not universal theorems about arbitrary types, functions, or multiplicity maps.
Omitted declaration names: TauCeti.GL2Blueprint.whittakerIntegral, TauCeti.GL2Blueprint.gl2Converse, TauCeti.GL2Blueprint.classicalLFunction.

GL2AutomorphicRepresentationsAndTransfer:R16.5/whittaker-integral-comparison
TauCeti.GL2Blueprint.whittakerIntegral
For factorizable cusp φ and Wφ=⊗vWv, the integral ∫_{F×\𝔸×}φ(diag(a,1))χ(a)|a|^{s−1/2}d×a unfolds to ∫_{𝔸×}Wφ(diag(a,1))χ(a)|a|^{s−1/2}d×a and factors into the AL.2 local Whittaker zeta integrals in a common right half-plane. At unramified places with normalized spherical Wv the factor is L(s,πv⊗χv); at ramified places a supplier test vector realizes the L-factor, rather than every newvector doing so for every ramified twist. Compare this integral with AL.2’s Godement–Jacquet standard factor and AL.3’s GL₂×GL₁ Rankin–Selberg integral, using their shared LLC normalization.
Hypotheses: Cuspidal φ, Hecke character χ; factorizable measures with standard unit volume at almost all finite places; absolute convergence first.

GL2AutomorphicRepresentationsAndTransfer:R16.5/full-gl2-converse
TauCeti.GL2Blueprint.gl2Converse
Let Π=⊗′vΠv be an irreducible admissible generic GL₂(𝔸F) tensor, with central character trivial on F×, spherical almost everywhere and the JL uniform exponent bound at the unramified principal-series places so its standard and dual Euler products converge absolutely in a right half-plane. At infinity use genuine irreducible admissible Harish–Chandra modules and their Casselman–Wallach globalizations. Suppose for EVERY Hecke quasicharacter χ, the completed L(s,Π⊗χdet) and L(s,Π̃⊗χ⁻¹det) extend to entire functions, are bounded in every vertical strip outside the standard excluded neighborhoods (here there are no poles), and satisfy L(s,Π⊗χ)=ε(s,Π⊗χ,ψ)L(1−s,Π̃⊗χ⁻¹). Then Π is cuspidal automorphic. Finite-order, unramified-only or one fixed-conductor twists are not substituted for this family. One-dimensional local constituents are excluded by genericity/infinite-dimensionality.
Hypotheses: Number field F; uniform bound |χᵢ,v(ϖv)| between qv^{−r} and qv^r for a common r at principal-series unramified places; all local constituents infinite-dimensional/generic; full archimedean and analytic conditions above.

GL2AutomorphicRepresentationsAndTransfer:R16.5/classical-l-function-comparison
TauCeti.GL2Blueprint.classicalLFunction
For a normalized primitive holomorphic newform f of weight k≥2, let πf be the AF.5 unitary adelization. With Lf(s)=Σ_{n≥1}a_n n^{−s}, L(s,πf)=Lf(s+(k−1)/2), including the bad-prime factors supplied by upstream newform theory. Its infinite factor is Γℂ(s+(k−1)/2). The factor 2 in Γℂ distinguishes this completion from the common classical (2π)^{−s}Γ(s)Lf(s); record the scalar and the conductor power rather than asserting equality of differently normalized completed functions. At width one the pinned CuspForm L-series theorem supplies the convergent-domain Mellin comparison; the global continuation is imported.
Hypotheses: f in the existing Γ₁(N) normalized newform carrier, nebentypus compatible with weight; AF.5 unitary normalization.
-/
-- Variable conversion only; the packet separately states local root numbers,
-- the discriminant, conductor and global additive-character product formula.
theorem globalEpsilon (k : ℂ) (s : ℂ) :
    (1 - s) + (k - 1) / 2 = k - (s + (k - 1) / 2) := by sorry
end Global

section Classical
/-
Explicit signature omissions (PROTOCOL §13; REV-FIX-RT-AREA-automorphic-1~3).
The primitive exact-conductor newform subtype and actual AF.5 adelization map with fixed k, nebentypus, infinity type and coefficient projections must exist before these equivalences and their API can be stated. No equivalence of two arbitrary types is asserted. The sound old-level/scalar tests below remain concrete fragments.
These source targets require the actual supplier objects and hypotheses below.
They are not universal theorems about arbitrary types, functions, or multiplicity maps.
Omitted declaration names: TauCeti.GL2Blueprint.primitiveBijection, TauCeti.GL2Blueprint.primitiveBijection_conductor, TauCeti.GL2Blueprint.primitiveBijection_weight_character, TauCeti.GL2Blueprint.primitiveBijection_hecke, TauCeti.GL2Blueprint.primitiveBijection_normalized, TauCeti.GL2Blueprint.primitiveBijection_inverse.
Full source-level tests awaiting the same carriers: TauCeti.GL2Blueprint.primitiveBijection_weight_two.

GL2AutomorphicRepresentationsAndTransfer:R16.6/primitive-classical-bijection
TauCeti.GL2Blueprint.primitiveBijection
For fixed k≥2 and nebentypus χ with χ(−1)=(−1)^k, identify normalized primitive Γ₁(N) newforms in the existing HeckeRing.GL2.Newform carrier with cuspidal automorphic GL₂(𝔸ℚ) isomorphism classes of conductor N, central character determined by χ via AF.5, and infinite component D_k in unitary normalization. On the automorphic side take the finite newvector tensor and the holomorphic lowest-weight vector in the positive-determinant constituent; the full GL₂(ℝ) representation still contains both O(2) signs. Normalize its first Fourier coefficient to one. The all-bad-prime eigenproperty needed on the classical side is supplied by upstream primitive newform theory, not assumed to be a field of the pinned Newform structure.
Hypotheses: N>0, k≥2; primitive at exact conductor, existing newspace and AF.5 dictionary; chosen additive character for the vector comparison.
TauCeti.GL2Blueprint.primitiveBijection_conductor: The product of the local conductor ideals is exactly N.
TauCeti.GL2Blueprint.primitiveBijection_weight_character: π∞=D_k and the central character is the AF.5 character attached to χ.
TauCeti.GL2Blueprint.primitiveBijection_hecke: For p∤N, α_p+β_p=a_p p^{−(k−1)/2} and α_pβ_p=χ(p).
TauCeti.GL2Blueprint.primitiveBijection_normalized: The recovered holomorphic newform has first q-coefficient one.
TauCeti.GL2Blueprint.primitiveBijection_inverse: The two maps are inverse on primitive forms and compatible automorphic classes.
TauCeti.GL2Blueprint.primitiveBijection_weight_two: At k=2 the infinite component is D₂ and the good trace is a_p/√p.
TauCeti.GL2Blueprint.primitiveBijection_old_level: A primitive form of level M properly dividing N is not primitive of conductor N after the oldform inclusion.
TauCeti.GL2Blueprint.primitiveBijection_scalar_normalization: For a normalized eigenform with a₁=1, multiplying by a scalar c≠1 changes a₁ to c and fails normalization. Every nonzero c yields the same primitive class after renormalization; c=0 is excluded from the eigenform carrier.
-/
-- TauCeti.GL2Blueprint.primitiveBijection_old_level
-- Missing: old is the upstream oldform inclusion of primitive conductor M<N;
-- cond is the actual conductor, not the ambient level. Old forms fail the N subtype.
example {Old : Type*} (f : Old) (M N : ℕ) (hMN : M < N)
    (cond : Old → ℕ) (hcond : cond f = M) : cond f ≠ N := by sorry
-- TauCeti.GL2Blueprint.primitiveBijection_scalar_normalization
example (c : ℂ) (hc : c ≠ 1) : c * 1 ≠ 1 := by sorry
-- Good-prime polynomial coefficient conversion. Full ramified U and central
-- finite-unit character comparison are omitted until upstream Layer 4/AF.5 exists.
theorem classicalHeckeLevel (α β z ap χp : ℂ)
    (htrace : z * (α + β) = ap) (hdet : α * β = χp) :
    z * α + z * β = ap ∧ (z * α) * (z * β) = χp * z ^ 2 := by sorry

section Weight
variable {G V : Type*} [Group G] [AddCommGroup V] [Module ℂ V]
/-- One-factor signature of the Hilbert coefficient construction. ρ must be
TauCeti.symPowerRep ℂ 2 (kτ−2), δ the existing determinant, and m=mτ.
The product over embeddings, purity kτ+2mτ=w and the full tensor carrier are
omitted here; this function is not a second symmetric-power definition. -/
def hilbertWeightRepresentation (ρ : Representation ℂ G V) (δ : G →* ℂˣ)
    (m : ℤ) : Representation ℂ G V := by sorry
lemma hilbertWeightRepresentation_scalar (ρ : Representation ℂ G V)
    (δ : G →* ℂˣ) (m d : ℤ) (scalar : ℂˣ →* G)
    (hρ : ∀ u, ρ (scalar u) = ((u : ℂ) ^ d) • (1 : Module.End ℂ V))
    (hδ : ∀ u, δ (scalar u) = u ^ 2) (u : ℂˣ) :
    hilbertWeightRepresentation ρ δ m (scalar u) =
      ((u : ℂ) ^ (d + 2 * m)) • (1 : Module.End ℂ V) := by sorry
-- Missing: V is the actual tensor of Sym^{kτ−2} with kτ≥2.
lemma hilbertWeightRepresentation_dimension {Embeddings : Type*} [Fintype Embeddings] (k : Embeddings → ℕ) :
    Module.finrank ℂ V = ∏ τ, (k τ - 1) := by sorry
-- The full supplier dual representation is unavailable; this is its central scalar rule.
lemma hilbertWeightRepresentation_dual (u : ℂˣ) (w : ℤ) :
    ((u : ℂ) ^ (w - 2))⁻¹ = (u : ℂ) ^ (-(w - 2)) := by sorry
-- Missing: ρL,ρK are the supplier coefficient extensions and e their canonical
-- comparison. Explicit intertwining is retained, rather than a dummy base-change predicate.
lemma hilbertWeightRepresentation_base_change {W : Type*} [AddCommGroup W] [Module ℂ W]
    (ρ : Representation ℂ G V) (σ : Representation ℂ G W) (δ : G →* ℂˣ)
    (m : ℤ) (e : V ≃ₗ[ℂ] W) (he : ∀ g v, e (ρ g v) = σ g (e v)) :
    ∀ g v, e (hilbertWeightRepresentation ρ δ m g v) =
      hilbertWeightRepresentation σ δ m g (e v) := by sorry
-- TauCeti.GL2Blueprint.hilbertWeightRepresentation_weight_two
-- Missing: ρ is Sym⁰, hence trivial; this actual equation specifies that fact.
example (ρ : Representation ℂ G ℂ) (δ : G →* ℂˣ)
    (hρ : ∀ g, ρ g = 1) : ∀ g, hilbertWeightRepresentation ρ δ 0 g = 1 := by sorry
-- TauCeti.GL2Blueprint.hilbertWeightRepresentation_weight_three
-- Missing: ρ is the standard GL₂ representation, δ its determinant.
example (ρ : Representation ℂ G (Fin 2 → ℂ)) (δ : G →* ℂˣ)
    (scalar : ℂˣ →* G)
    (hρ : ∀ u, ρ (scalar u) = (u : ℂ) • (1 : Module.End ℂ (Fin 2 → ℂ)))
    (hδ : ∀ u, δ (scalar u) = u ^ 2) (u : ℂˣ) :
    Module.finrank ℂ (Fin 2 → ℂ) = 2 ∧
    hilbertWeightRepresentation ρ δ 1 (scalar u) =
      (u : ℂ) ^ 3 • (1 : Module.End ℂ (Fin 2 → ℂ)) := by sorry
-- TauCeti.GL2Blueprint.hilbertWeightRepresentation_mixed_parity
example : ¬ ∃ m₁ m₂ w : ℤ, 2 + 2 * m₁ = w ∧ 3 + 2 * m₂ = w := by sorry
end Weight

-- The scalar parameter conversion is actual matrix algebra. The packet requires
-- Frobenius inversion/contragredient and nebentypus agreement before identifying
-- this with R19's determinant ε·χ_cyc^{k−1}; that Galois attachment is omitted.
theorem weightKParameterConversion (α β z : ℂ) :
    z * α + z * β = z * (α + β) ∧
    (z * α) * (z * β) = z ^ 2 * (α * β) := by sorry
/-
Explicit signature omissions (PROTOCOL §13; REV-FIX-RT-AREA-automorphic-1~3).
The designated characteristic-zero automorphic multiplicity space at its compatible level/infinite type must be identified first. An arbitrary vector space does not have dimension one; integral/torsion multiplicity is separate.
These source targets require the actual supplier objects and hypotheses below.
They are not universal theorems about arbitrary types, functions, or multiplicity maps.
Omitted declaration names: TauCeti.GL2Blueprint.geometricExports.

GL2AutomorphicRepresentationsAndTransfer:R16.6/geometry-and-galois-exports
TauCeti.GL2Blueprint.geometricExports
Export the exact local conductor dimensions, normalized Whittaker line, primitive classical comparison, coefficient field and Hilbert algebraic representation to R18’s automorphic cohomology and R19’s Galois construction. Each consumer records its central character, archimedean dual convention, local compact subgroup, Hecke normalization and coefficient lattice. The finite-part multiplicity remains one for a fixed compatible infinite type; no new claim of integral multiplicity one, torsion-freeness or Galois existence is made by this export.
Hypotheses: Consumer coefficient field, local level and infinite type fixed; geometric statements imported from their owners.
-/
end Classical

section Quaternion
-- Missing: DClass consists of irreducible smooth division D× classes; FClass of
-- essentially square-integrable GL₂(F) classes; the sign is −1 only at division places.
theorem localQuaternionic {DClass FClass Delt : Type*}
    (jl : DClass → FClass) (charD : DClass → Delt → ℂ)
    (charF : FClass → Delt → ℂ) (ρ : DClass) (δ : Delt) :
    charF (jl ρ) δ = -charD ρ δ := by sorry
-- Missing: normCharacter is χ∘Nrd on division D×; special is St⊗χdet.
theorem normCharacterSteinberg {C DClass FClass : Type*}
    (jl : DClass → FClass) (normCharacter : C → DClass)
    (special : C → FClass) (χ : C) : jl (normCharacter χ) = special χ := by sorry
-- Missing: realLocalJL, coeff and D are the actual archimedean supplier maps;
-- coeff(k,m)=Sym^{k−2}⊗det^m and D has the central-character norm twist.
-- Use AF.1's archimedean character interfaces, requested through proposed AF.1b;
-- ET.6's current finite-extension-of-Qp construction supplies no real-place theorem.
theorem realQuaternionic {DClass FClass : Type*} (realLocalJL : DClass → FClass)
    (coeff : ℕ → ℤ → DClass) (D : ℕ → ℤ → FClass)
    (k : ℕ) (hk : 2 ≤ k) (m : ℤ) : realLocalJL (coeff k m) = D k m := by sorry
-- Missing: F can be dyadic, π essentially square-integrable, both rec maps are
-- the same ET.6 parameter convention. Primitive wild cases are included.
theorem wildDyadicTransfer {DClass FClass W : Type*} (jl : DClass → FClass)
    (recD : DClass → W) (recF : FClass → W) (ρ : DClass) :
    recF (jl ρ) = recD ρ := by sorry
-- The actual parity calculation for swapping one ramified and one split place.
-- This assumes chosen global algebras and their ramification data. QFI Layer 6D
-- supplies only local classification; global realization is a recorded R17.3 gap.
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
-- Missing: trace is the actual integrated trace of St⊗χdet, and eH/eK the stated idempotents.
lemma steinbergProjectorDifference_steinberg (eH eK : G → ℂ)
    (trace : (G → ℂ) → ℂ) : trace (steinbergProjectorDifference eH eK) = 1 := by sorry
-- Missing: trace is the actual determinant-character trace for the corresponding χ.
lemma steinbergProjectorDifference_character (eH eK : G → ℂ)
    (trace : (G → ℂ) → ℂ) : trace (steinbergProjectorDifference eH eK) = -1 := by sorry
lemma steinbergProjectorDifference_twist (eH eK η : G → ℂ) :
    steinbergProjectorDifference (fun g => η g * eH g) (fun g => η g * eK g) =
      fun g => η g * steinbergProjectorDifference eH eK g := by sorry
-- TauCeti.GL2Blueprint.steinbergProjectorDifference_trivial_norm
-- Missing: these are the St and trivial-character integrated traces of ζ₁.
example (eH eK : G → ℂ) (trSt trTrivial : (G → ℂ) → ℂ) :
    trSt (steinbergProjectorDifference eH eK) = 1 ∧
      trTrivial (steinbergProjectorDifference eH eK) = -1 := by sorry
-- TauCeti.GL2Blueprint.steinbergProjectorDifference_unramified_principal
-- Missing: trPrincipal is the actual irreducible unitary unramified principal-series trace.
example (eH eK : G → ℂ) (trPrincipal : (G → ℂ) → ℂ) :
    trPrincipal (steinbergProjectorDifference eH eK) = 0 := by sorry
-- TauCeti.GL2Blueprint.steinbergProjectorDifference_outside_support
example (eH eK : G → ℂ) (g : G) (hH : eH g = 0) (hK : eK g = 0) :
    steinbergProjectorDifference eH eK g = 0 := by sorry
-- TauCeti.GL2Blueprint.steinbergProjectorDifference_scalar_twist
example (eH eK η : G → ℂ) (g : G) :
    steinbergProjectorDifference (fun x => η x * eH x) (fun x => η x * eK x) g =
      η g * steinbergProjectorDifference eH eK g := by sorry
-- Missing: fG,fD are the actual inner-form matching functions; O_G/O_D use
-- the same elliptic torus measure and the stipulated ambient quotient measures.
theorem quaternionicOrbitalMatching {G D T : Type*} (fG : G → ℂ) (fD : D → ℂ)
    (O_G : (G → ℂ) → T → ℂ) (O_D : (D → ℂ) → T → ℂ) (t : T) :
    O_G fG t = -O_D fD t := by sorry

/-- Choice of the ET.3 transfer of a local function from E to F. Missing:
E/F cyclic, σ, the actual C_c^∞ carriers, norm classes and centralizer measures.
The ordinary-function choice is determined only modulo regular orbital integrals. -/
def cyclicMatching (EFunctions FFunctions : Type*) : EFunctions → FFunctions := by sorry
lemma cyclicMatching_norm {EFunctions FFunctions T : Type*} (φ : EFunctions)
    (O_F : FFunctions → T → ℂ) (TO_E : EFunctions → T → ℂ) (t : T) :
    O_F (cyclicMatching EFunctions FFunctions φ) t = TO_E φ t := by sorry
-- Missing: t represents a regular norm class, with the same centralizer measure.
lemma cyclicMatching_non_norm {EFunctions FFunctions T : Type*} (φ : EFunctions)
    (O_F : FFunctions → T → ℂ) (t : T) :
    O_F (cyclicMatching EFunctions FFunctions φ) t = 0 := by sorry
-- Missing: t is a regular NONnorm class; no dummy norm predicate is defined.
lemma cyclicMatching_unit {EFunctions FFunctions : Type*} (unitE : EFunctions)
    (unitF : FFunctions) : cyclicMatching EFunctions FFunctions unitE = unitF := by sorry
-- Missing: unramified extension, normalized hyperspecial units, vol(K)=1.
lemma cyclicMatching_satake {EFunctions FFunctions : Type*} (φ : EFunctions)
    (satE : EFunctions → ℂ → ℂ → ℂ) (satF : FFunctions → ℂ → ℂ → ℂ)
    (d : ℕ) (α β : ℂ) :
    satF (cyclicMatching EFunctions FFunctions φ) α β = satE φ (α ^ d) (β ^ d) := by sorry
-- Missing: these are the actual Satake transforms, and d the residue degree.
lemma cyclicMatching_central {ZE ZF : Type*} [Group ZE] [Group ZF]
    (norm : ZE →* ZF) (ω : ZF →* ℂˣ) (z : ZE) :
    (ω.comp norm) z = ω (norm z) := by sorry
-- TauCeti.GL2Blueprint.cyclicMatching_degree_one
-- Missing: E=F, σ=1 and the transfer choice is the identity on this carrier.
example {Functions : Type*} (φ : Functions) :
    cyclicMatching Functions Functions φ = φ := by sorry
-- TauCeti.GL2Blueprint.cyclicMatching_quadratic_satake
example : ((2 : ℂ) ^ 2 + 3 ^ 2 = 13) ∧ ((2 : ℂ) ^ 2 * 3 ^ 2 = 36) := by sorry
-- TauCeti.GL2Blueprint.cyclicMatching_non_norm_test
-- Missing: E/F unramified quadratic, det γ odd valuation, so γ is a nonnorm.
example {EFunctions FFunctions T : Type*} (φ : EFunctions)
    (O_F : FFunctions → T → ℂ) (γ : T) :
    O_F (cyclicMatching EFunctions FFunctions φ) γ = 0 := by sorry
-- Missing: these are the actual AS.6 terms of a common test function after the
-- local trace substitution. The residual term is explicitly retained.
-- Normalized intertwiners come from AS.2; AS.5 owns weighted cohomology.
theorem spectralLedger (cusp residual continuous quaternionNorm quaternionOther : ℂ) :
    cusp + residual + continuous = quaternionNorm + quaternionOther := by sorry
-- Missing: A is the integrated operator of f on Borel induction, with
-- ∫_N f(xny)=0 for ALL x,y; this is stronger than the K-averaged trace-zero identity.
theorem strongCuspidalVanishing {V : Type*} [AddCommGroup V] [Module ℂ V]
    (A : Module.End ℂ V) : A = 0 := by sorry
-- Missing: each summand is the actual supplier distribution with matched functions,
-- including identity/unipotent/residual/continuous terms, the norm-character
-- correction and quadratic exceptional terms. Generic matching alone is insufficient.
theorem specializedTraceComparison (geometric spectral : ℂ) :
    geometric = spectral := by sorry
end Trace
/-
Explicit signature omissions (PROTOCOL §13; REV-FIX-RT-AREA-automorphic-1~3).
The actual conductor-N weight-one primitive newforms and full-O(2) limit D₁(0) automorphic subtype, odd nebentypus and lowering-operator condition are unavailable. Weight one has parameter 1⊕sgn and is not a negative symmetric-power coefficient system.
These source targets require the actual supplier objects and hypotheses below.
They are not universal theorems about arbitrary types, functions, or multiplicity maps.
Omitted declaration names: TauCeti.GL2Blueprint.weightOneClassicalComparison.

GL2AutomorphicRepresentationsAndTransfer:R16.6/weight-one-classical-comparison
TauCeti.GL2Blueprint.weightOneClassicalComparison
For N>0 and odd nebentypus χ, the existing primitive normalized weight-one cusp forms at conductor N correspond to cuspidal GL₂(𝔸ℚ) classes of exact conductor N and central character ω_χ whose unitary infinite component is the full-O(2) limit D₁(0). Its positive-determinant restriction has holomorphic and antiholomorphic limits of lowest weights ±1. Its real Weil parameter is 1⊕sgn, not an irreducible induction from ℂ×; its standard infinite factor is Γℝ(s)Γℝ(s+1)=Γℂ(s). Use AF.5’s k≥1 function dictionary, finite newvector normalization and global multiplicity. This comparison does not give a regular algebraic Hilbert coefficient Sym^{−1} or a weight-one Galois construction. The Casimir is −1/4 at k=1 in the convention Δ=(H²+2XY+2YX)/4.
Hypotheses: N>0; χ(−1)=−1; existing primitive newform carrier with k=1 and exact conductor; chosen AF.1 limit globalization and AF.5 dictionary.
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
