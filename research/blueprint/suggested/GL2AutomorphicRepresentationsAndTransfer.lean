/-
This file is not the roadmap and is not exhaustive. The roadmap document
research/blueprint/readmes/GL2AutomorphicRepresentationsAndTransfer.md is definitive. These
statements suggest Lean forms so that contributors and reviewers converge on names and
signatures; they claim no implementation.

Layers R16.1–R16.6, R17.1 and R17.2 are in namespace TauCeti.GL2Blueprint; layers R17.3–R17.6
are in namespace TauCeti.GL2Transfer. The pinned libraries have the matrix groups GL₂ and PGL₂,
representations with their invariants, induced and irreducible representations, and absolute
Galois groups. They lack the supplier interfaces (SR, AF, AL, AS, ET and the automorphic,
local Weil–Deligne and Hilbert owners) for smooth irreducible local classes, automorphic
isomorphism classes, Weil parameters, analytic test functions, trace terms, the arithmetic
projective obstruction and the Hilbert weight-one dictionary. Capitalized carrier parameters
(P, C, W, DClass, FClass, EClass, GL3Class, …) and the operations on them (local projections,
twists, norms, conjugations, Satake projections) stand for those suppliers' actual objects;
they are not new definitions of representations. Unavailable conditions are omitted and named
in `Missing:` comments beside each signature, never replaced by Prop-valued fields or dummy
predicates. A signature with omitted conditions is NOT a theorem for arbitrary carrier
parameters or functions; the roadmap document states the complete mathematics. Compilation
checks only the signatures, the concrete matrix formulas and the discriminating examples.

Only Mathlib modules are imported, at the pinned Mathlib
082e2d37e8b0463410cdb532e111cd43d5a66174. The packets cite declarations of the pinned Tau Ceti
f790474, among them HeckeRing.GL2.Newform, TauCeti.symPowerRep,
TauCeti.IsProjectiveRep.exists_monoidHom_of_cohomologyClass_eq_zero,
TauCeti.Matrix.GeneralLinearGroup.not_isSolvable_fin_two and
TauCeti.simple_indFDRep_ofLinearCharacter_iff. They are not imported, because the shared
build's Tau Ceti is not at that pin. Where such existing carriers or operations enter (the
primitive Newform subtype, symmetric powers, the Hilbert tensor), the file takes parameters
for them rather than rebuilding them; those declarations replace the parameters in an
implementation. Each packet test name is a comment immediately preceding its example, apart
from that example's own `Missing:` notes.
-/
import Mathlib.Algebra.Field.ZMod
import Mathlib.Algebra.Group.Action.Basic
import Mathlib.Algebra.Group.Action.Defs
import Mathlib.Algebra.Group.Subgroup.Basic
import Mathlib.Algebra.Ring.Int.Parity
import Mathlib.Analysis.SpecialFunctions.Pow.Complex
import Mathlib.Basic.Complex.Basic
import Mathlib.Data.Finset.Insert
import Mathlib.Data.ZMod.Basic
import Mathlib.FieldTheory.AbsoluteGaloisGroup
import Mathlib.FieldTheory.IsAlgClosed.Basic
import Mathlib.GroupTheory.OrderOfElement
import Mathlib.LinearAlgebra.FiniteDimensional.Defs
import Mathlib.LinearAlgebra.Matrix.GeneralLinearGroup.Defs
import Mathlib.LinearAlgebra.Matrix.GeneralLinearGroup.Projective
import Mathlib.LinearAlgebra.Matrix.Notation
import Mathlib.LinearAlgebra.Matrix.Trace
import Mathlib.MeasureTheory.Measure.Haar.Basic
import Mathlib.NumberTheory.NumberField.Basic
import Mathlib.NumberTheory.Zsqrtd.Basic
import Mathlib.RepresentationTheory.Basic
import Mathlib.RepresentationTheory.Induced
import Mathlib.RepresentationTheory.Invariants
import Mathlib.RepresentationTheory.Irreducible
import Mathlib.RingTheory.Ideal.Operations
import Mathlib.RingTheory.PowerSeries.Basic
import Mathlib.Topology.Algebra.InfiniteSum.Basic
import Mathlib.Topology.Instances.AddCircle.Defs
import Mathlib.Topology.LocallyConstant.Basic

noncomputable section
set_option linter.unusedVariables false
set_option linter.unusedSectionVars false

/-! ## Layers R16.1–R16.6, R17.1 and R17.2: local and global GL₂ representations, local
parameters, classical and Hilbert dictionaries, local Jacquet–Langlands and trace-formula
inputs. -/
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

section LocalTopology
-- Missing: F is a local field, O its integers; K is the indicated integral,
-- orthogonal or unitary maximal compact subgroup in the supplier topology.
theorem compactComparison {G : Type*} [TopologicalSpace G] (K : Set G) :
    IsCompact K := by sorry
-- Missing: F nonarchimedean, ϖ a uniformizer, K=GL₂(O), Cartan representatives.
theorem iwasawaCartan {F : Type*} [Field F] (ϖ : Fˣ)
    (K : Subgroup (GeneralLinearGroup (Fin 2) F)) (g : GeneralLinearGroup (Fin 2) F) :
    ∃ (a b : ℤ) (k l : K), b ≤ a ∧
      g = k.val * GeneralLinearGroup.mkOfDetNeZero
        (!![(ϖ : F) ^ a, 0; 0, (ϖ : F) ^ b]) (by sorry) * l.val := by sorry
-- Missing: μ is the specified local Haar measure normalized on K;
-- AA.0's restricted product and AA.2's central quotient identifications.
theorem haarComparison {G : Type*} [MeasurableSpace G]
    (μ : MeasureTheory.Measure G) (K : Set G) : μ K = 1 := by sorry
-- Missing: the source and target are AF.2's exact finite-level automorphic and
-- finite-double-coset classical spaces, with growth/character/type conditions.
theorem finiteLevelComparison {A C : Type*} [AddCommGroup A] [Module ℂ A]
    [AddCommGroup C] [Module ℂ C] : Nonempty (A ≃ₗ[ℂ] C) := by sorry
end LocalTopology

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
-- Missing: A is the actual cuspidal constituent and T its AF.2 restricted tensor
-- model; the Hilbert completion is separate from this algebraic equivalence.
theorem cuspidalTensor {A T : Type*} [AddCommGroup A] [Module ℂ A]
    [AddCommGroup T] [Module ℂ T] : Nonempty (A ≃ₗ[ℂ] T) := by sorry
-- Missing: F number field, φ a genuine cusp form, W its Fourier coefficient,
-- ψ on F\A and vol(F\A)=1; convergence is supplied by AL.3 before multiplicity.
theorem globalWhittakerExpansion {F G : Type*} [Field F] [Group G]
    (diag : Fˣ → G) (φ W : G → ℂ) (g : G) :
    φ g = ∑' a : Fˣ, W (diag a * g) := by sorry
-- Missing: C is the existing cuspidal isomorphism-class carrier and mult AS.4 multiplicity.
theorem globalMultiplicityOne {C : Type*} (mult : C → ℕ) (π : C) : mult π = 1 := by sorry
-- Missing: C consists of cuspidal global classes, v ranges over finite places,
-- and local is the actual local-class map. No infinite-place equality is assumed.
theorem strongMultiplicityOne {C V L : Type*} [DecidableEq V]
    (localFactor : C → V → L) (π π' : C) (S : Finset V)
    (h : ∀ v ∉ S, localFactor π v = localFactor π' v) : π = π' := by sorry
-- Missing: π is regular algebraic cuspidal in the algebraic normalization
-- π_alg = π_unitary ⊗ |det|^{-(k-2)/2}; K is the AF.4 rationality/model field,
-- coeff the algebraically normalized Hecke coefficients.
theorem cohomologicalRationality {C : Type*} (π : C) (K : Subfield ℂ)
    (coeff : C → ℕ → ℂ) : ∀ n, coeff π n ∈ K := by sorry

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
-- Missing: Zglobal is the unfolded GL₂ Mellin integral and Zlocal its AL.2
-- factors; absolute convergence, factorization, ψ and Haar hypotheses precede continuation.
theorem whittakerIntegral {V : Type*} (Zglobal : ℂ → ℂ)
    (Zlocal : V → ℂ → ℂ) (s : ℂ) : Zglobal s = ∏' v, Zlocal v s := by sorry
-- Missing: Pi is the irreducible generic restricted tensor with central character
-- trivial on F×, all Hecke-quasicharacter twists entire/bounded in strips,
-- uniform Euler exponent bound, the dual functional equations and actual
-- archimedean CW globalizations. No dummy analytic predicate is introduced.
theorem gl2Converse {Tensor Cusp : Type*} (Pi : Tensor)
    (forget : Cusp → Tensor) : ∃ π, forget π = Pi := by sorry
-- Missing: f a primitive existing Newform, Lf its classical coefficient series,
-- Lunitary its AF.5 adelization's full standard L including bad factors.
theorem classicalLFunction (Lf Lunitary : ℂ → ℂ) (k : ℕ) (hk : 2 ≤ k) (s : ℂ) :
    Lunitary s = Lf (s + ((k : ℂ) - 1) / 2) := by sorry
-- Variable conversion only; the packet separately states local root numbers,
-- the discriminant, conductor and global additive-character product formula.
theorem globalEpsilon (k : ℂ) (s : ℂ) :
    (1 - s) + (k - 1) / 2 = k - (s + (k - 1) / 2) := by sorry
end Global

section Classical
-- NClass is the existing Tau Ceti primitive Newform subtype with N,k,χ fixed;
-- AClass is AF.5's conductor-N, central-character-χ, infinite-D_k cusp subtype.
-- Missing: k≥2, parity, exact conductor, the good-index/bad-U distinction,
-- normalization a₁=1, and the actual AF.5 map. This is not an arbitrary equivalence.
def primitiveBijection (NClass AClass : Type*) : NClass ≃ AClass := by sorry
lemma primitiveBijection_conductor {NClass AClass : Type*}
    (f : NClass) (N : ℕ) (conductor : AClass → ℕ) :
    conductor (primitiveBijection NClass AClass f) = N := by sorry
lemma primitiveBijection_weight_character {NClass AClass W C : Type*}
    (f : NClass) (Dk : W) (χ : C) (infinite : AClass → W) (central : AClass → C) :
    infinite (primitiveBijection NClass AClass f) = Dk ∧
    central (primitiveBijection NClass AClass f) = χ := by sorry
lemma primitiveBijection_hecke {NClass AClass : Type*} (f : NClass)
    (p k : ℕ) (hp : 0 < p) (hk : 2 ≤ k) (α β : AClass → ℂ)
    (ap χp : NClass → ℂ) :
    α (primitiveBijection NClass AClass f) + β (primitiveBijection NClass AClass f) =
      ap f * (p : ℂ) ^ (-((k : ℂ) - 1) / 2) ∧
    α (primitiveBijection NClass AClass f) * β (primitiveBijection NClass AClass f) = χp f := by sorry
-- Missing in hecke: p∤N and α,β are the actual unitary Satake values.
lemma primitiveBijection_normalized {NClass AClass : Type*} (π : AClass)
    (a1 : NClass → ℂ) : a1 ((primitiveBijection NClass AClass).symm π) = 1 := by sorry
lemma primitiveBijection_inverse {NClass AClass : Type*} (f : NClass) (π : AClass) :
    (primitiveBijection NClass AClass).symm (primitiveBijection NClass AClass f) = f ∧
    primitiveBijection NClass AClass ((primitiveBijection NClass AClass).symm π) = π := by sorry
-- TauCeti.GL2Blueprint.primitiveBijection_weight_two
-- Missing: f weight two, p good, Satake the supplier pair of its adelization.
example {NClass AClass : Type*} (f : NClass) (p : ℕ) (hp : 0 < p)
    (α β : AClass → ℂ) (ap : NClass → ℂ) :
    α (primitiveBijection NClass AClass f) + β (primitiveBijection NClass AClass f) =
      ap f * (p : ℂ) ^ (-(1 / 2 : ℂ)) := by sorry
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
-- Missing: V is the characteristic-zero multiplicity factor in R18/R19 at the
-- fixed compatible level/infinite type; torsion and integral multiplicity are separate.
theorem geometricExports {V : Type*} [AddCommGroup V] [Module ℂ V] :
    Module.finrank ℂ V = 1 := by sorry
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
-- Missing: the existing primitive k=1 newform subtype, exact conductor N, odd
-- nebentypus, and AF.1 full-O(2) D₁(0) limit carrier. This is the AF.5 k≥1
-- dictionary restricted to normalized newforms; no negative symmetric power.
theorem weightOneClassicalComparison {NewformWeightOne AutoWeightOne : Type*} :
    Nonempty (NewformWeightOne ≃ AutoWeightOne) := by sorry

end TauCeti.GL2Blueprint

/-! ## Layers R17.3–R17.6: global Jacquet–Langlands, base change and automorphic induction,
Artin automorphy, weight one, characteristic-two residual modularity and transfer exports.
`Layer inputs` comments name the TauCeti.GL2Blueprint declarations that stand for inputs
from layers R16.1–R17.2. -/
namespace TauCeti.GL2Transfer

open Matrix

section GlobalJL
-- Layer inputs (TauCeti.GL2Blueprint): specializedTraceComparison, strongMultiplicityOne
variable {DClass FClass V LD LF H C : Type*}

/-- Missing: F a number field, quaternion algebra D, fixed central character;
DClass is the non-norm spectrum and FClass the D-compatible cuspidal spectrum,
with the exact finite/infinite localRep hypotheses of R17.3/global-jl. -/
noncomputable def globalJL (DClass FClass : Type*) : DClass ≃ FClass := by sorry

-- Layer inputs (TauCeti.GL2Blueprint): localQuaternionic, realQuaternionic (localJL)
lemma globalJL_local (d : DClass) (v : V)
    (localD : DClass → V → LD) (localF : FClass → V → LF)
    (localJL : V → LD → LF) :
    localF (globalJL DClass FClass d) v = localJL v (localD d v) := by sorry

lemma globalJL_central (d : DClass) (ωD : DClass → C) (ωF : FClass → C) :
    ωF (globalJL DClass FClass d) = ωD d := by sorry

lemma globalJL_inverse (d : DClass) (π : FClass) :
    (globalJL DClass FClass).symm (globalJL DClass FClass d) = d ∧
    globalJL DClass FClass ((globalJL DClass FClass).symm π) = π := by sorry

lemma globalJL_twist (d : DClass) (χ : H)
    (twistD : H → DClass → DClass) (twistF : H → FClass → FClass) :
    globalJL DClass FClass (twistD χ d) = twistF χ (globalJL DClass FClass d) := by sorry

-- Missing: the quaternion algebra is split and all localRep identifications are identity.
lemma globalJL_split (π : FClass) : globalJL FClass FClass π = π := by sorry

-- TauCeti.GL2Transfer.jl_split_test
example (π : FClass) : globalJL FClass FClass π = π := by sorry

-- Layer inputs (TauCeti.GL2Blueprint): normCharacterSteinberg (charNrd)
-- TauCeti.GL2Transfer.jl_steinberg_test
-- Missing: D/Q ramified at {p,infinity}, π weight two with π_p=St⊗χ;
-- charNrd is the supplied division-place character class χ∘Nrd.
example (π : FClass) (p : V) (localD : DClass → V → LD) (charNrd : LD) :
    localD ((globalJL DClass FClass).symm π) p = charNrd := by sorry

-- TauCeti.GL2Transfer.jl_eisenstein_excluded_test
-- Missing: D = M₂(Q); Eis is the supplier's set of Eisenstein constituents π(μ,ν)
-- of GL₂(A_Q), and inclE, inclF the inclusions of Eisenstein and cuspidal classes
-- into all automorphic classes. An Eisenstein constituent does not factor through
-- det, yet it is not the image of any discrete-series class under global JL.
example {Eis : Type*} (e : Eis) (inclE : Eis → LF) (inclF : FClass → LF) :
    ∀ d : DClass, inclF (globalJL DClass FClass d) ≠ inclE e := by sorry

-- TauCeti.GL2Transfer.jl_inverse_test
example (π : FClass) :
    globalJL DClass FClass ((globalJL DClass FClass).symm π) = π := by sorry
end GlobalJL

section Satake
-- Layer inputs (TauCeti.GL2Blueprint): principalParameter, cyclicMatching_satake
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

section Cyclic
-- Layer inputs (TauCeti.GL2Blueprint): specializedTraceComparison, strongMultiplicityOne
variable {FClass EClass V W LF LE H HF HE C K : Type*} [CommRing K]

/-- Missing: prime-cyclic extension E/F, the supplier's isobaric GL₂ classes,
arithmetic LLC normalization, and the trace comparison of R17.2. -/
noncomputable def cyclicBaseChange (FClass EClass : Type*) : FClass → EClass := by sorry

lemma cyclicBaseChange_local (π : FClass) (v : V) (w : W)
    (localF : FClass → V → LF) (localE : EClass → W → LE) (res : LF → LE) :
    localE (cyclicBaseChange FClass EClass π) w = res (localF π v) := by sorry

-- Layer inputs (TauCeti.GL2Blueprint): cyclicMatching_satake (satF, satE)
lemma cyclicBaseChange_unramified (π : FClass) (v : V) (w : W) (f : ℕ)
    (satF : FClass → V → GeneralLinearGroup (Fin 2) K)
    (satE : EClass → W → GeneralLinearGroup (Fin 2) K) :
    satE (cyclicBaseChange FClass EClass π) w = unramifiedBaseChange (satF π v) f := by sorry

-- Layer inputs (TauCeti.GL2Blueprint): cyclicMatching_central (normPullback)
lemma cyclicBaseChange_central (π : FClass) (ωF : FClass → HF) (ωE : EClass → HE)
    (normPullback : HF → HE) :
    ωE (cyclicBaseChange FClass EClass π) = normPullback (ωF π) := by sorry

lemma cyclicBaseChange_twist (π : FClass) (χ : HF) (normPullback : HF → HE)
    (twistF : HF → FClass → FClass) (twistE : HE → EClass → EClass) :
    cyclicBaseChange FClass EClass (twistF χ π) =
      twistE (normPullback χ) (cyclicBaseChange FClass EClass π) := by sorry

-- The converse (every invariant cuspidal class occurs) is cyclic_descent below.
lemma cyclicBaseChange_galois (π : FClass) (σ : EClass → EClass) :
    σ (cyclicBaseChange FClass EClass π) = cyclicBaseChange FClass EClass π := by sorry

-- Missing: cohomological rational structures and the precise normalization twist.
lemma cyclicBaseChange_coefficients (π : FClass)
    (conjugateF : FClass → FClass) (conjugateE : EClass → EClass) :
    cyclicBaseChange FClass EClass (conjugateF π) =
      conjugateE (cyclicBaseChange FClass EClass π) := by sorry

-- TauCeti.GL2Transfer.cyclic_split_test
-- Missing: v completely split, w|v, using the identity localRep identification.
example (π : FClass) (v : V) (w : W)
    (localF : FClass → V → C) (localE : EClass → W → C) :
    localE (cyclicBaseChange FClass EClass π) w = localF π v := by sorry

-- TauCeti.GL2Transfer.cyclic_inert_test
-- Missing: v inert and unramified in the quadratic E/F, w the place above it, and
-- satF/satE the suppliers' Satake projections. No global form with arbitrarily
-- prescribed diagonal Satake eigenvalues is asserted.
example (π : FClass) (v : V) (w : W)
    (satF : FClass → V → GeneralLinearGroup (Fin 2) ℚ)
    (satE : EClass → W → GeneralLinearGroup (Fin 2) ℚ)
    (hA : (satF π v).val = !![2, 0; 0, 3]) :
    (satE (cyclicBaseChange FClass EClass π) w).val = !![4, 0; 0, 9] := by sorry

-- TauCeti.GL2Transfer.cyclic_induced_test
-- Missing: θ≠θ^σ, quadratic E/F and the actual isobaric direct-sum operation.
example (θ : H) (σ : H → H) (hθ : θ ≠ σ θ)
    (ai : H → FClass) (isobaricSum : H → H → EClass) :
    cyclicBaseChange FClass EClass (ai θ) = isobaricSum θ (σ θ) := by sorry

-- TauCeti.GL2Transfer.cyclic_odd_degree_test
-- Missing: E/F cyclic of the odd prime degree ℓ; CF/CE are the suppliers'
-- cuspidal subtypes with their forget maps. A cuspidal input stays cuspidal.
example {CF CE : Type*} (ℓ : ℕ) (hprime : ℓ.Prime) (hodd : ℓ ≠ 2)
    (forgetF : CF → FClass) (forgetE : CE → EClass) (π : CF) :
    ∃ Pi : CE, cyclicBaseChange FClass EClass (forgetF π) = forgetE Pi := by sorry
end Cyclic

section Solvable
-- Layer inputs (TauCeti.GL2Blueprint): strongMultiplicityOne
variable {FClass EClass LClass V W LF LE HF HE : Type*}

/-- Missing: finite solvable Galois E/F and its chosen compatible embeddings;
the isobaric class map is characterized independently of a prime-cyclic tower. -/
noncomputable def solvableBaseChange (FClass EClass : Type*) : FClass → EClass := by sorry

-- Missing E=F and the empty tower.
lemma solvableBaseChange_refl (π : FClass) : solvableBaseChange FClass FClass π = π := by sorry

lemma solvableBaseChange_tower (π : FClass) :
    solvableBaseChange EClass LClass (solvableBaseChange FClass EClass π) =
      solvableBaseChange FClass LClass π := by sorry

lemma solvableBaseChange_local (π : FClass) (v : V) (w : W)
    (localF : FClass → V → LF) (localE : EClass → W → LE) (res : LF → LE) :
    localE (solvableBaseChange FClass EClass π) w = res (localF π v) := by sorry

lemma solvableBaseChange_twist (π : FClass) (χ : HF) (normPullback : HF → HE)
    (twistF : HF → FClass → FClass) (twistE : HE → EClass → EClass) :
    solvableBaseChange FClass EClass (twistF χ π) =
      twistE (normPullback χ) (solvableBaseChange FClass EClass π) := by sorry

-- TauCeti.GL2Transfer.solvable_empty_test
example (π : FClass) : solvableBaseChange FClass FClass π = π := by sorry

-- TauCeti.GL2Transfer.solvable_two_towers_test
-- Missing: MClass and LClass are the classes for two quadratic subfields of
-- the same biquadratic E/F, with each cyclic map using that field extension.
example {MClass : Type*} (π : FClass) :
    cyclicBaseChange LClass EClass (cyclicBaseChange FClass LClass π) =
      cyclicBaseChange MClass EClass (cyclicBaseChange FClass MClass π) := by sorry

-- TauCeti.GL2Transfer.solvable_degree_six_test
example (A : GeneralLinearGroup (Fin 2) ℚ) (hA : A.val = !![2, 0; 0, 3]) :
    (unramifiedBaseChange (unramifiedBaseChange A 2) 3).val = !![64, 0; 0, 729] := by sorry

-- TauCeti.GL2Transfer.solvable_cuspidality_test
-- Missing: first quadratic step, a non-invariant inducing character, and
-- isobaricSum. The displayed sum witnesses loss of cuspidality there.
example {H : Type*} (θ : H) (σ : H → H) (hθ : θ ≠ σ θ)
    (ai : H → FClass) (isobaricSum : H → H → EClass) :
    solvableBaseChange FClass EClass (ai θ) = isobaricSum θ (σ θ) := by sorry
end Solvable

section Adjoint
-- Layer inputs (TauCeti.GL2Blueprint): principalParameter, supercuspidalParameter, conductorEpsilon
variable {FClass GL3Class V LF L3 H : Type*}

/-- Missing: π unitary cuspidal over a number field, and the supplier-owned
isobaric rank-three carrier. This is Ad=Sym²⊗ω⁻¹, not untwisted Sym². -/
noncomputable def adjointLift (FClass GL3Class : Type*) : FClass → GL3Class := by sorry

lemma adjointLift_local (π : FClass) (v : V)
    (local2 : FClass → V → LF) (local3 : GL3Class → V → L3) (adjoint : LF → L3) :
    local3 (adjointLift FClass GL3Class π) v = adjoint (local2 π v) := by sorry

lemma adjointLift_unramified {K : Type*} [Field K] (π : FClass) (v : V)
    (α β : K) (hα : α ≠ 0) (hβ : β ≠ 0)
    (sat2 : FClass → V → Matrix (Fin 2) (Fin 2) K)
    (sat3 : GL3Class → V → Matrix (Fin 3) (Fin 3) K)
    (hsat : sat2 π v = diagonal ![α, β]) :
    sat3 (adjointLift FClass GL3Class π) v = diagonal ![α / β, 1, β / α] := by sorry

lemma adjointLift_twist (π : FClass) (χ : H) (twist : H → FClass → FClass) :
    adjointLift FClass GL3Class (twist χ π) = adjointLift FClass GL3Class π := by sorry

lemma adjointLift_central {C : Type*} [Monoid C] (π : FClass) (ω : GL3Class → C) :
    ω (adjointLift FClass GL3Class π) = 1 := by sorry

-- The next four examples evaluate adjointLift through the suppliers' unramified
-- Satake projections sat2/sat3 (missing: v unramified for π); they do not
-- assert global existence of a form with a chosen Satake class.
-- TauCeti.GL2Transfer.adjoint_diagonal_test
example (π : FClass) (v : V)
    (sat2 : FClass → V → Matrix (Fin 2) (Fin 2) ℚ)
    (sat3 : GL3Class → V → Matrix (Fin 3) (Fin 3) ℚ)
    (hsat : sat2 π v = diagonal ![2, 3]) :
    sat3 (adjointLift FClass GL3Class π) v = !![2/3, 0, 0; 0, 1, 0; 0, 0, 3/2] := by sorry

-- TauCeti.GL2Transfer.adjoint_scalar_test
example {K : Type*} [Field K] (π : FClass) (v : V) (a : K) (ha : a ≠ 0)
    (sat2 : FClass → V → Matrix (Fin 2) (Fin 2) K)
    (sat3 : GL3Class → V → Matrix (Fin 3) (Fin 3) K)
    (hsat : sat2 π v = diagonal ![a, a]) :
    sat3 (adjointLift FClass GL3Class π) v = 1 := by sorry

-- TauCeti.GL2Transfer.adjoint_twist_test
-- Missing: twistBy u is the supplied twist by an unramified character with value
-- u at v, so the Satake class of the twist is u times that of π.
example {K : Type*} [Field K] (π : FClass) (v : V) (α β u : K)
    (hα : α ≠ 0) (hβ : β ≠ 0) (hu : u ≠ 0) (twistBy : K → FClass → FClass)
    (sat2 : FClass → V → Matrix (Fin 2) (Fin 2) K)
    (sat3 : GL3Class → V → Matrix (Fin 3) (Fin 3) K)
    (hsat : sat2 π v = diagonal ![α, β])
    (htw : sat2 (twistBy u π) v = diagonal ![u * α, u * β]) :
    sat3 (adjointLift FClass GL3Class (twistBy u π)) v =
      sat3 (adjointLift FClass GL3Class π) v := by sorry

-- TauCeti.GL2Transfer.adjoint_not_sym_square_test
-- The untwisted symmetric square diag(4,6,9) is not the adjoint lift.
example (π : FClass) (v : V)
    (sat2 : FClass → V → Matrix (Fin 2) (Fin 2) ℚ)
    (sat3 : GL3Class → V → Matrix (Fin 3) (Fin 3) ℚ)
    (hsat : sat2 π v = diagonal ![2, 3]) :
    sat3 (adjointLift FClass GL3Class π) v ≠ diagonal ![4, 6, 9] := by sorry
end Adjoint

section Cubic
-- Layer inputs (TauCeti.GL2Blueprint): strongMultiplicityOne, principalParameter
variable {FClass EClass V W HF HE C K : Type*} [CommRing K]

/-- Missing: separable non-Galois cubic K/F, its S₃ closure, the JPSS
construction and strong localRep upgrade; this is not a prime-cyclic tower. -/
noncomputable def cubicBaseChange (FClass EClass : Type*) : FClass → EClass := by sorry

lemma cubicBaseChange_unramified (π : FClass) (v : V) (w : W) (f : ℕ)
    (satF : FClass → V → GeneralLinearGroup (Fin 2) K)
    (satE : EClass → W → GeneralLinearGroup (Fin 2) K) :
    satE (cubicBaseChange FClass EClass π) w = unramifiedBaseChange (satF π v) f := by sorry

lemma cubicBaseChange_twist (π : FClass) (χ : HF) (normPullback : HF → HE)
    (twistF : HF → FClass → FClass) (twistE : HE → EClass → EClass) :
    cubicBaseChange FClass EClass (twistF χ π) =
      twistE (normPullback χ) (cubicBaseChange FClass EClass π) := by sorry

lemma cubicBaseChange_central (π : FClass) (ωF : FClass → HF) (ωE : EClass → HE)
    (normPullback : HF → HE) :
    ωE (cubicBaseChange FClass EClass π) = normPullback (ωF π) := by sorry

-- Missing: sat is the actual unramified localRep class projection on isobaric classes.
lemma cubicBaseChange_unique (Pi Ψ : EClass) (S : Finset W)
    (sat : EClass → W → C) (h : ∀ w, w ∉ S → sat Pi w = sat Ψ w) : Pi = Ψ := by sorry

-- In the four tests below satF/satE are the suppliers' unramified Satake
-- projections and w, w₁, w₂ are places of K above an unramified v of F
-- (missing: the cubic field K/F and the splitting type of v).
-- TauCeti.GL2Transfer.cubic_split_test
-- Missing: v splits completely in K as w₁, w₂, w₃.
example (π : FClass) (v : V) (w₁ w₂ w₃ : W)
    (satF : FClass → V → GeneralLinearGroup (Fin 2) K)
    (satE : EClass → W → GeneralLinearGroup (Fin 2) K) :
    (satE (cubicBaseChange FClass EClass π) w₁, satE (cubicBaseChange FClass EClass π) w₂,
      satE (cubicBaseChange FClass EClass π) w₃) = (satF π v, satF π v, satF π v) := by sorry

-- TauCeti.GL2Transfer.cubic_one_two_test
-- Missing: v = w₁ w₂ in K with residue degrees 1 and 2.
example (π : FClass) (v : V) (w₁ w₂ : W)
    (satF : FClass → V → GeneralLinearGroup (Fin 2) ℚ)
    (satE : EClass → W → GeneralLinearGroup (Fin 2) ℚ)
    (hA : (satF π v).val = !![2, 0; 0, 3]) :
    ((satE (cubicBaseChange FClass EClass π) w₁).val,
      (satE (cubicBaseChange FClass EClass π) w₂).val) =
      (!![2, 0; 0, 3], !![4, 0; 0, 9]) := by sorry

-- TauCeti.GL2Transfer.cubic_inert_test
-- Missing: v inert in K, w the place above it.
example (π : FClass) (v : V) (w : W)
    (satF : FClass → V → GeneralLinearGroup (Fin 2) ℚ)
    (satE : EClass → W → GeneralLinearGroup (Fin 2) ℚ)
    (hA : (satF π v).val = !![2, 0; 0, 3]) :
    (satE (cubicBaseChange FClass EClass π) w).val = !![8, 0; 0, 27] := by sorry

-- TauCeti.GL2Transfer.cubic_not_three_test
-- Missing: v = w₁ w₂ with residue degrees 1 and 2, as in cubic_one_two_test.
example (π : FClass) (v : V) (w₁ w₂ : W)
    (satF : FClass → V → GeneralLinearGroup (Fin 2) ℚ)
    (satE : EClass → W → GeneralLinearGroup (Fin 2) ℚ)
    (hA : (satF π v).val = !![2, 0; 0, 3]) :
    (satE (cubicBaseChange FClass EClass π) w₁, satE (cubicBaseChange FClass EClass π) w₂) ≠
      (unramifiedBaseChange (satF π v) 3, unramifiedBaseChange (satF π v) 3) := by sorry
end Cubic

section QuadraticInduction
-- Layer inputs (TauCeti.GL2Blueprint): gl2Converse, principalParameter
variable {FClass EClass H V L2 L1 HF C : Type*}

/-- Missing: K/F quadratic, the supplied continuous Hecke-character carrier H,
and the canonical localRep/global isobaric classes with normalization fixed. -/
noncomputable def quadraticInduction (H FClass : Type*) : H → FClass := by sorry

lemma quadraticInduction_local (θ : H) (v : V)
    (localChar : H → V → L1) (induce : L1 → L2) (localRep : FClass → V → L2) :
    localRep (quadraticInduction H FClass θ) v = induce (localChar θ v) := by sorry

lemma quadraticInduction_central [Monoid HF] (θ : H) (η : HF)
    (restrictChar : H → HF) (ω : FClass → HF) :
    ω (quadraticInduction H FClass θ) = η * restrictChar θ := by sorry

lemma quadraticInduction_baseChange (θ : H) (σ : H → H)
    (isobaricSum : H → H → EClass) :
    cyclicBaseChange FClass EClass (quadraticInduction H FClass θ) =
      isobaricSum θ (σ θ) := by sorry

lemma quadraticInduction_twist [Monoid H] (θ : H) (χ : HF)
    (normPullback : HF → H) (twist : HF → FClass → FClass) :
    quadraticInduction H FClass (θ * normPullback χ) =
      twist χ (quadraticInduction H FClass θ) := by sorry

-- Missing: the actual cuspidal-subtype map of the automorphic supplier. The
-- membership formulation avoids defining a new cuspidality predicate here.
lemma quadraticInduction_cuspidal {CuspidalClass : Type*} (θ : H) (σ : H → H)
    (forget : CuspidalClass → FClass) :
    (∃ π : CuspidalClass, forget π = quadraticInduction H FClass θ) ↔ θ ≠ σ θ := by sorry

-- TauCeti.GL2Transfer.induction_invariant_test
-- Missing: normPullback, η and sum are the supplied quadratic reciprocity data.
example (χ : HF) (η : HF) (normPullback : HF → H)
    (isobaricSum : HF → HF → FClass) [Monoid HF] :
    quadraticInduction H FClass (normPullback χ) = isobaricSum χ (χ * η) := by sorry

-- TauCeti.GL2Transfer.induction_split_test
-- Missing: split v with the two localRep character values a,b and the localRep parameter map.
example {K : Type*} [Field K] (θ : H) (v : V) (a b : K)
    (localRep : FClass → V → Matrix (Fin 2) (Fin 2) K) :
    localRep (quadraticInduction H FClass θ) v = diagonal ![a, b] := by sorry

-- TauCeti.GL2Transfer.induction_determinant_test
-- Missing: v inert in K/F, Wv its local Weil group and g ∈ Wv outside the
-- index-two subgroup; localRep is the supplied local parameter of AI θ. In the
-- basis {e, g e} the parameter of g is antidiagonal, and its determinant is
-- -(a * b): the sign is η_{K/F}(g) = -1 of the central-character formula.
example {K Wv : Type*} [CommRing K] [Group Wv] (θ : H) (v : V) (g : Wv) (a b : K)
    (localRep : FClass → V → Wv →* GeneralLinearGroup (Fin 2) K)
    (hg : (localRep (quadraticInduction H FClass θ) v g).val = !![0, a; b, 0]) :
    ((localRep (quadraticInduction H FClass θ) v g).val).det = -(a * b) := by sorry

-- TauCeti.GL2Transfer.induction_noninvariant_test
-- Missing: rank-one isobaric classes do not lie in the supplied cuspidal subtype.
example {CuspidalClass : Type*} (θ : H) (σ : H → H) (hθ : θ ≠ σ θ)
    (forget : CuspidalClass → FClass) :
    ∃ π : CuspidalClass, forget π = quadraticInduction H FClass θ := by sorry
end QuadraticInduction

/-! R17.3 theorem interfaces. Each abstract projection must be its named supplier
operation; the number-field/quaternion data and eligible spectra of GlobalJL are
still omitted. These are not assertions about arbitrary sets of classes. -/
section JLTheorems
variable {DClass FClass DFull H V C : Type*}

-- Layer inputs (TauCeti.GL2Blueprint): normCharacterSteinberg, globalWhittakerExpansion
theorem norm_exception (forget : DClass → DFull) (normChar : H → DFull)
    (d : DClass) (χ : H) : forget d ≠ normChar χ := by sorry

theorem split_hecke (d : DClass) (v : V) (T S : DClass → V → C)
    (T' S' : FClass → V → C) :
    T' (globalJL DClass FClass d) v = T d v ∧
    S' (globalJL DClass FClass d) v = S d v := by sorry

-- Layer inputs (TauCeti.GL2Blueprint): localQuaternionic, conductorEpsilon, whittakerIntegral
theorem local_factors (d : DClass) (v : V) (s : ℂ) (χ : H)
    (L ε : DClass → V → H → ℂ → ℂ) (L' ε' : FClass → V → H → ℂ → ℂ) :
    L' (globalJL DClass FClass d) v χ s = L d v χ s ∧
    ε' (globalJL DClass FClass d) v χ s = ε d v χ s := by sorry

-- Layer inputs (TauCeti.GL2Blueprint): strongMultiplicityOne
theorem strong_multiplicity_one (d e : DClass) (S : Finset V)
    (localRep : DClass → V → C) (h : ∀ v, v ∉ S → localRep d v = localRep e v) : d = e := by sorry

-- Layer inputs (TauCeti.GL2Blueprint): globalMultiplicityOne, specializedTraceComparison
theorem multiplicity_one (d : DClass) (multiplicity : DClass → ℕ) :
    multiplicity d = 1 := by sorry

-- Layer inputs (TauCeti.GL2Blueprint): cohomologicalRationality, strongMultiplicityOne
-- Missing: cohomological infinity types, rational structures and their conjugates.
theorem coefficient_conjugation (d : DClass) (conjD : DClass → DClass)
    (conjF : FClass → FClass) :
    globalJL DClass FClass (conjD d) = conjF (globalJL DClass FClass d) := by sorry

-- Layer inputs (TauCeti.GL2Blueprint): cohomologicalRationality
-- The supplied coefficient models may require a finite extension; this prototype
-- compares their Hecke scalars, rather than promising arbitrary whole-module descent.
theorem rational_models {K L : Type*} [Field K] [Field L] (φ : K →+* L)
    (d : DClass) (v : V) (aD : DClass → V → K) (aF : FClass → V → K) :
    φ (aF (globalJL DClass FClass d) v) = φ (aD d v) := by sorry

-- Layer inputs (TauCeti.GL2Blueprint): realQuaternionic
-- Missing: D/Q ramified at p,infinity; coefficient type W(-k,0); d non-norm.
-- The excluded k=0 norm branch has weight zero, as stated in the packet.
theorem definite_infinity (d : DClass) (k : ℕ) (weight : FClass → ℕ) :
    weight (globalJL DClass FClass d) = k + 2 := by sorry

-- Apply imported Hilbert reciprocity to the actual finite ramification set first.
theorem indefinite_parity (d t : ℕ) (hd : 1 ≤ d) (h : Even ((d - 1) + t)) :
    t % 2 = (d - 1) % 2 := by sorry

-- Layer inputs (TauCeti.GL2Blueprint): quaternionSwap, localQuaternionic, realQuaternionic
-- Missing CDN23's even-degree totally real E and the common representation
-- compatible with both invariant-exchanged quaternion algebras, plus level data.
theorem invariant_exchange {D0Class : Type*} (π : FClass) :
    ∃ d0 : D0Class, ∃ d : DClass,
      globalJL D0Class FClass d0 = π ∧ globalJL DClass FClass d = π := by sorry

-- Missing the precise Clozel limit-multiplicity hypotheses, compatible central
-- character after the permitted twist, and the specified infinity type.
theorem supercuspidal_globalization (v : V) (τ : C) (localRep : DClass → V → C) :
    ∃ d : DClass, localRep d v = τ := by sorry
end JLTheorems

/-! R17.4 theorem interfaces. The cyclic extension, the real automorphic class
carriers, the action and the localRep restriction maps are supplied, not recreated. -/
section BCTheorems
variable {FClass EClass CF CE H V W LF LE C : Type*}

-- Layer inputs (TauCeti.GL2Blueprint): principalParameter, steinbergParameter, normalizationBridge
theorem local_compatibility (π : FClass) (v : V) (w : W)
    (recF : FClass → V → LF) (recE : EClass → W → LE) (res : LF → LE) :
    recE (cyclicBaseChange FClass EClass π) w = res (recF π v) := by sorry

-- Layer inputs (TauCeti.GL2Blueprint): specializedTraceComparison, strongMultiplicityOne
-- CF/CE are the supplied cuspidal subtypes. Include their actual forget maps,
-- not a newly defined predicate on arbitrary isobaric objects.
theorem cyclic_descent (Pi : CE) (σ : CE → CE) (forgetF : CF → FClass)
    (forgetE : CE → EClass) :
    (∃ π : CF, cyclicBaseChange FClass EClass (forgetF π) = forgetE Pi) ↔ σ Pi = Pi := by sorry

theorem cuspidality (π : CF) (forgetF : CF → FClass) (forgetE : CE → EClass)
    (η : H) (twist : H → FClass → FClass) :
    (¬ ∃ Pi : CE, cyclicBaseChange FClass EClass (forgetF π) = forgetE Pi) ↔
      twist η (forgetF π) = forgetF π := by sorry

-- Missing: Pi cuspidal invariant output, η generating the prime-degree character
-- group, π one descent; the quadratic noncuspidal fiber is separately in the packet.
theorem cyclic_descent_fibers [Monoid H] (π : FClass) (Pi : EClass) (η : H) (ℓ : ℕ)
    (twist : H → FClass → FClass) :
    {τ | cyclicBaseChange FClass EClass τ = Pi} =
      Set.range (fun i : Fin ℓ => twist (η ^ i.val) π) := by sorry

-- Layer inputs (TauCeti.GL2Blueprint): strongMultiplicityOne
-- Missing: H is the rank-one Hecke-character carrier and the sums/pullback are
-- the canonical operations. Independent norm-kernel twists must be retained.
theorem isobaric_fibers (χ₁ χ₂ : H) (pullback : H → H)
    (sumF : H → H → FClass) (sumE : H → H → EClass) :
    cyclicBaseChange FClass EClass (sumF χ₁ χ₂) = sumE (pullback χ₁) (pullback χ₂) := by sorry

-- Layer inputs (TauCeti.GL2Blueprint): strongMultiplicityOne
-- Missing: F ⊂ L ⊂ E and F ⊂ M ⊂ E are two prime-cyclic towers inside the same
-- solvable Galois E/F, and LClass/MClass are the isobaric classes over L and M.
-- Both composites equal the tower-free solvableBaseChange.
theorem tower_independence {LClass MClass : Type*} (π : FClass) :
    cyclicBaseChange LClass EClass (cyclicBaseChange FClass LClass π) =
        solvableBaseChange FClass EClass π ∧
      cyclicBaseChange MClass EClass (cyclicBaseChange FClass MClass π) =
        solvableBaseChange FClass EClass π := by sorry

-- Missing: at every prime-cyclic step a Galois-invariant automorphic descent
-- has been chosen, with compatible character/localRep data. Global Galois descent
-- or unqualified invariance is deliberately not used as the hypothesis.
theorem solvable_descent (Pi : EClass) :
    ∃ π : FClass, solvableBaseChange FClass EClass π = Pi := by sorry

-- Missing: the arithmetic owner has already constructed E/F completely split
-- at v, and these are the canonically identified localRep carriers.
theorem prescribed_local_base_change (π : FClass) (v : V) (w : W)
    (localF : FClass → V → C) (localE : EClass → W → C) :
    localE (solvableBaseChange FClass EClass π) w = localF π v := by sorry

-- Missing: cyclic cubic E/F, the localRep induction operation and Hecke character.
-- Only existence is prototyped; the orbit-size-three criterion is in the document.
theorem cubic_character_induction {GL3Class : Type*} (θ : H)
    (inducedLocal : H → V → C) (local3 : GL3Class → V → C) :
    ∃ Pi : GL3Class, ∀ v, local3 Pi v = inducedLocal θ v := by sorry

-- Missing: generic AL converse, all Hecke-character twists with dual entireness,
-- functional equations and strip bounds; GL₃ isobaric uniqueness/pole criterion.
theorem gl3_recognition {GL3Class : Type*} (Pi Ψ : GL3Class) (S : Finset V)
    (localRep : GL3Class → V → C) (h : ∀ v, v ∉ S → localRep Pi v = localRep Ψ v) : Pi = Ψ := by sorry

-- Carayol's extraordinary dyadic comparison (his §12.2.2 Proposition) is planned in
-- AutomorphicGaloisRepresentations R19.2 (R19.2/carayol-cubic-base-change-of-extraordinary),
-- which imports the cubic transfer and Artin automorphy from here; it is not restated.
end BCTheorems

section ArithmeticLifting
variable {G I T : Type*} [Group G] [Group I] [Group T]

-- Missing: I is the idele class group of a number field; T its n-torsion quotient
-- with the global μ_n factored out; ω continuous and trivial at complex places.
-- Continuous/finite-order data and the GW exceptional choice must be restored.
theorem finite_hecke_extension (i : T →* I) (ω : T →* ℂˣ) :
    ∃ χ : I →* ℂˣ, Set.Finite (Set.range χ) ∧ χ.comp i = ω := by sorry

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

-- Missing: F totally real, p>2, continuous absolutely irreducible solvable r̄;
-- O is an adequate cyclotomic integral coefficient ring after finite extension,
-- red its chosen place map and ι its complex embedding; c indexes all real places.
-- The scalar/projective theorem alone does not supply this reduction identity.
theorem odd_residual_lift {O k J : Type*} [CommRing O] [Field k]
    (p : ℕ) [CharP k p] (hp : 2 < p)
    (r : G →* GeneralLinearGroup (Fin 2) k) (red : O →+* k) (ι : O →+* ℂ)
    (c : J → G) (hc : ∀ j, c j * c j = 1)
    (hodd : ∀ j, GeneralLinearGroup.det (r (c j)) = -1) :
    ∃ ρ : G →* GeneralLinearGroup (Fin 2) O,
      Set.Finite (Set.range ρ) ∧ (GeneralLinearGroup.map red).comp ρ = r ∧
      ∀ j, GeneralLinearGroup.det (GeneralLinearGroup.map ι (ρ (c j))) = -1 := by sorry
end ArithmeticLifting

/-! Artin automorphy uses the suppliers' actual localRep Weil homomorphisms. These
types are parameters for them, not a new global Langlands-parameter definition.
Missing in every theorem below: G=G_F for a number field, continuity, irreducibility,
the specified projective image and the arithmetic LLC normalization; all localRep
monodromies of the finite-image Artin parameter are zero. -/
section Artin
-- Layer inputs (TauCeti.GL2Blueprint): strongMultiplicityOne, whittakerIntegral, principalParameter
variable {G V FClass : Type*} [Group G] (W : V → Type*) [∀ v, Group (W v)]
    (emb : ∀ v, W v →* G)
    (rec : FClass → ∀ v, W v →* GeneralLinearGroup (Fin 2) ℂ)

theorem dihedral_artin (ρ : G →* GeneralLinearGroup (Fin 2) ℂ)
    (hfinite : Set.Finite (Set.range ρ)) :
    ∃ π : FClass, ∀ v, rec π v = ρ.comp (emb v) := by sorry

theorem tetrahedral_artin (ρ : G →* GeneralLinearGroup (Fin 2) ℂ)
    (hfinite : Set.Finite (Set.range ρ)) :
    ∃ π : FClass, ∀ v, rec π v = ρ.comp (emb v) := by sorry

-- Missing the original Tunnell/JPSS comparison as well as the S₄ image hypothesis.
theorem octahedral_artin (ρ : G →* GeneralLinearGroup (Fin 2) ℂ)
    (hfinite : Set.Finite (Set.range ρ)) :
    ∃ π : FClass, ∀ v, rec π v = ρ.comp (emb v) := by sorry

theorem solvable_artin (ρ : G →* GeneralLinearGroup (Fin 2) ℂ)
    (hfinite : Set.Finite (Set.range ρ)) :
    ∃! π : FClass, ∀ v, rec π v = ρ.comp (emb v) := by sorry
end Artin

section WeightOne
-- Layer inputs (TauCeti.GL2Blueprint): weightOneClassicalComparison, conductorExponent
variable {G Form V C : Type*} [Group G]

-- Missing: G=G_Q, solvable finite irreducible ρ, odd at c; Form is the actual
-- normalized weight-one newform carrier. S excludes the bad primes, and N is
-- the Artin conductor. Coefficient field, λ and lattice are supplier data.
theorem q_weight_one (ρ : G →* GeneralLinearGroup (Fin 2) ℂ) (c : G)
    (hodd : GeneralLinearGroup.det (ρ c) = -1) (N : ℕ) (S : Finset V)
    (Frob : V → G) (weight level : Form → ℕ) (a : Form → V → ℂ) :
    ∃ f : Form, weight f = 1 ∧ level f = N ∧
      ∀ v, v ∉ S → a f v = (ρ (Frob v)).val.trace := by sorry

-- Missing: G=G_F, F totally real, Form the holomorphic parallel-weight-one
-- Hilbert carrier; real c's all have the weight-one (1,sign) Weil parameter.
theorem tr_weight_one {J : Type*} (ρ : G →* GeneralLinearGroup (Fin 2) ℂ)
    (c : J → G) (hodd : ∀ j, GeneralLinearGroup.det (ρ (c j)) = -1)
    (weight : Form → J → ℕ) : ∃ f : Form, ∀ j, weight f j = 1 := by sorry

-- Missing: the data produced by odd_residual_lift/tr_weight_one with the chosen
-- coefficient place and lattice; this is a supplied residual witness, not its definition.
theorem residual_lt_application {k Witness : Type*} [Field k]
    (r : G →* GeneralLinearGroup (Fin 2) k)
    (realize : Witness → G →* GeneralLinearGroup (Fin 2) k) :
    ∃ w : Witness, realize w = r := by sorry
end WeightOne

/-! R17.5 globalisation and mod-3 interfaces:
Tunnell's globalisation, Carayol's prescribed-local induction and the octahedral mod-3
application. The local Weil groups, Hecke characters and weight-one forms are the
suppliers' carriers, passed as parameters as elsewhere in this file. -/
section GlobalisationAndModThree

-- Missing: K a p-adic field, W_K its Weil group, σ continuous; Glob indexes pairs
-- (F, v) with F a number field and F_v ≅ K, W g the Weil group of F and emb g the
-- decomposition embedding at v. Type preservation and the Q₂/S₄ oddness clause of
-- Tunnell's Theorem 1.3 are in the packet.
theorem tunnell_primitive_globalization {WK Glob : Type*} [Group WK]
    (W : Glob → Type*) [∀ g, Group (W g)] (emb : ∀ g, WK →* W g)
    (σ : WK →* GeneralLinearGroup (Fin 2) ℂ) :
    ∃ g : Glob, ∃ ρ : W g →* GeneralLinearGroup (Fin 2) ℂ,
      ∃ P : GeneralLinearGroup (Fin 2) ℂ, ∀ x, ρ (emb g x) = P * σ x * P⁻¹ := by sorry

-- Missing: F totally real, L/F the CM quadratic extension with conditions (a)–(c) of
-- Carayol 11.2, H the Hecke quasi-characters of L, component θ 𝔭 the 𝔭-component,
-- weil the local Weil representation and localRep the supplier's local component.
theorem prescribed_local_induction {H FClass V C Loc : Type*} (𝔭 : V) (ξ𝔭 : C)
    (component : H → V → C) (localRep : FClass → V → Loc) (weil : C → Loc) :
    ∃ θ : H, component θ 𝔭 = ξ𝔭 ∧
      localRep (quadraticInduction H FClass θ) 𝔭 = weil ξ𝔭 := by sorry

/-- Reduction modulo λ = (1 + √−2): ℤ[√−2] → F₃, sending √−2 to −1. -/
def redSqrtNegTwo : ℤ√(-2) →+* ZMod 3 := Zsqrtd.lift ⟨-1, by decide⟩

/-- The section used by the octahedral mod-3 application (Darmon–Diamond–Taylor,
Theorem 3.14(a)): an injective homomorphism GL₂(F₃) → GL₂(ℤ[√−2]) reducing to the
identity modulo (1 + √−2). The packet gives explicit generators; it is a true statement
at the pinned Mathlib. -/
theorem gl2F3_section :
    ∃ s : GeneralLinearGroup (Fin 2) (ZMod 3) →* GeneralLinearGroup (Fin 2) (ℤ√(-2)),
      Function.Injective s ∧
        (GeneralLinearGroup.map redSqrtNegTwo).comp s = MonoidHom.id _ := by sorry

-- Missing: G = G_Q, ρbar continuous and absolutely irreducible, c complex conjugation;
-- Form is the normalized weight-one newform carrier and residual f its reduction at λ.
-- The proof applies solvable_artin and q_weight_one to s ∘ ρbar, with s from gl2F3_section.
theorem octahedral_mod_three_application {G Form : Type*} [Group G]
    (ρbar : G →* GeneralLinearGroup (Fin 2) (ZMod 3)) (c : G)
    (hodd : GeneralLinearGroup.det (ρbar c) = -1) (weight : Form → ℕ)
    (residual : Form → G →* GeneralLinearGroup (Fin 2) (ZMod 3)) :
    ∃ f : Form, weight f = 1 ∧ residual f = ρbar := by sorry

end GlobalisationAndModThree

section CharacteristicTwo
variable {G : Type*} [Group G] {k : Type*} [Field k] [CharP k 2]

-- Missing: k algebraically closed, r continuous absolutely irreducible with
-- finite solvable projective image. Here is the actual scalar normalization;
-- the identification of its linear image with odd dihedral D_n is in the packet.
theorem determinant_untwist (r : G →* GeneralLinearGroup (Fin 2) k)
    (hfinite : Set.Finite (Set.range r)) :
    ∃ ξ : G →* kˣ, Set.Finite (Set.range ξ) ∧
      ∀ g, ξ g ^ 2 = GeneralLinearGroup.det (r g) ∧
        GeneralLinearGroup.det (GeneralLinearGroup.scalar (Fin 2) (ξ g)⁻¹ * r g) = 1 := by sorry

-- Missing: R01.4's finite classification and the actual dihedral group carrier.
-- This prototype records the quadratic inducing field's index-two subgroup
-- and non-invariant character data; the induction is supplied, not defined here.
theorem solvable_dihedral (r : G →* GeneralLinearGroup (Fin 2) k)
    (hfinite : Set.Finite (Set.range r)) :
    ∃ H : Subgroup G, H.index = 2 ∧ ∃ θ : H →* kˣ, Set.Finite (Set.range θ) := by sorry

-- Missing: r̄₀ = Ind φ, its Teichmüller lift φ̃, D = disc K, normF = N_{K/Q} f(φ̃) and
-- N = N(r̄₀); hcond is the conductor formula |D|·N f(φ̃) = 2^ν N proved in the packet.
-- hfund is the 2-adic shape of a fundamental discriminant. Given these, the four
-- dyadic cases of Rohrlich–Tunnell §2 fix ν (case (ii) is printed "D ≡ ±5 (mod 8)",
-- and ν = 3 belongs to case (iv), not (iii): sourceIssues E1).
theorem teichmuller_conductor (D : ℤ) (normF N ν : ℕ) (hN : Odd N)
    (hfund : D % 4 = 1 ∨ D % 16 = 8 ∨ D % 16 = 12)
    (hcond : D.natAbs * normF = 2 ^ ν * N) :
    (Odd D → Odd normF → ν = 0) ∧ (D % 8 = 5 → normF % 8 = 4 → ν = 2) ∧
      (D % 8 = 4 → Odd normF → ν = 2) ∧ (D % 8 = 0 → Odd normF → ν = 3) := by sorry

-- All arithmetic conditions in the source technical lemma are visible here.
-- Missing: Form's actual primitive/classical carrier, q-expansion, character,
-- residual representation and conductor projections, plus λ-integrality.
theorem rt_technical_lemma {O Form C : Type*} [CommRing O] [Monoid C]
    (red : O →+* k) (qexp : Form → PowerSeries O) (level weight : Form → ℕ)
    (character : Form → C) (residual : Form → G →* GeneralLinearGroup (Fin 2) k)
    (conductor : (G →* GeneralLinearGroup (Fin 2) k) → ℕ)
    (g : Form) (ν N r : ℕ) (hν : ν = 0 ∨ ν = 2 ∨ ν = 3)
    (hN : N % 2 = 1) (hr : r = 1 ∨ (r.Prime ∧ r ≠ 2 ∧ ¬r ∣ N))
    (hlevel : level g = 2 ^ ν * N * r) (hweight : weight g = 1)
    (hchar : character g ^ 2 = 1) (hcond : conductor (residual g) = N)
    (haux : r ≠ 1 → red (PowerSeries.coeff r (qexp g)) ≠ 1)
    (heven : ν = 2 → ∀ n, Even n → PowerSeries.coeff n (qexp g) = 0)
    (htwo : ν = 3 → red (PowerSeries.coeff 2 (qexp g)) ≠ 0) :
    ∃ f : Form, level f = N ∧ character f = 1 ∧
      weight f = (if ν = 3 then 4 else 2) ∧ residual f = residual g := by sorry

-- Missing: K real quadratic, θ its same-order lift and the controlled ray-class
-- construction ramified at exactly one real place and one auxiliary degree-one prime.
theorem serre_odd_trick {H : Type*} [Group H] (θ : H →* ℂˣ) (c : H)
    (induce : (H →* ℂˣ) → G →* GeneralLinearGroup (Fin 2) ℂ) :
    ∃ ξ : H →* ℂˣ, (∀ h, ξ h ^ 2 = 1) ∧
      ∃ cQ : G, GeneralLinearGroup.det (induce (θ * ξ) cQ) = -1 := by sorry

-- Missing: G=G_Q, r has irreducible LINEAR-dihedral image, D is the quadratic
-- discriminant, N the prime-to-two Artin conductor and ν its actual dyadic case.
-- The discriminant restriction cannot be dropped or extended to D≡4 mod8.
theorem rohrlich_tunnell {Form C : Type*} [Monoid C]
    (r : G →* GeneralLinearGroup (Fin 2) k) (D : ℤ) (N ν : ℕ)
    (hD : Odd D ∨ 8 ∣ D) (hN : Odd N)
    (weight level : Form → ℕ) (character : Form → C)
    (residual : Form → G →* GeneralLinearGroup (Fin 2) k) :
    ∃ f : Form, level f = N ∧ character f = 1 ∧
      weight f = (if ν = 3 then 4 else 2) ∧ residual f = r := by sorry

-- Missing: G=G_Q, r dihedral; O/red/ι selected after adequate cyclotomic
-- coefficient extension. No conductor equality is asserted by general Lemma 3.
theorem wiese_odd_lift {O : Type*} [CommRing O]
    (r : G →* GeneralLinearGroup (Fin 2) k) (red : O →+* k) (ι : O →+* ℂ) (c : G) :
    ∃ ρ : G →* GeneralLinearGroup (Fin 2) O,
      Set.Finite (Set.range ρ) ∧ (GeneralLinearGroup.map red).comp ρ = r ∧
      GeneralLinearGroup.det (GeneralLinearGroup.map ι (ρ c)) = -1 := by sorry

-- Missing: r dihedral and unramified at two; Form is the normalized cuspidal
-- Katz carrier, N the exact odd conductor, and character its actual determinant.
theorem unramified_katz {Form C : Type*} (r : G →* GeneralLinearGroup (Fin 2) k)
    (N : ℕ) (weight level : Form → ℕ) (character : Form → C) (detChar : C)
    (residual : Form → G →* GeneralLinearGroup (Fin 2) k) :
    ∃ f : Form, weight f = 1 ∧ level f = N ∧ character f = detChar ∧ residual f = r := by sorry

-- Missing: the qualitative soluble/irreducible hypotheses, the actual R15.6
-- witness carrier and its coefficient-place/lattice realization operation.
theorem qualitative_residual_modularity {Witness : Type*}
    (r : G →* GeneralLinearGroup (Fin 2) k)
    (realize : Witness → G →* GeneralLinearGroup (Fin 2) k) :
    ∃ w : Witness, realize w = r := by sorry

-- Missing: R15 Hasse and integral-lifting hypotheses, full Hecke action and
-- the DS dominating-DVR coefficient choices. No new weight-change construction.
theorem weight_two_witness {Witness : Type*} (r : G →* GeneralLinearGroup (Fin 2) k)
    (weight : Witness → ℕ) (realize : Witness → G →* GeneralLinearGroup (Fin 2) k) :
    ∃ w : Witness, 2 ≤ weight w ∧ realize w = r := by sorry
end CharacteristicTwo

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

-- The index-two Mackey criterion on Mathlib's induced representation, over an
-- algebraically closed field of any characteristic (characteristic two included). Missing only the Galois specialization:
-- Γ = G_F, Kgp = G_K for the quadratic K/F and E = G_E for a finite E/F. σθ is the
-- one-dimensional representation of θ. In characteristic zero and for finite Γ,
-- TauCeti.simple_indFDRep_ofLinearCharacter_iff is the pinned unrestricted case.
-- Restricted to E, Ind θ is irreducible exactly when E ⊄ Kgp and θ differs from
-- its conjugate on E ∩ Kgp; when E ≤ Kgp it is the sum of two characters.
theorem quadratic_restriction {Γ k : Type*} [Group Γ] [Field k] [IsAlgClosed k]
    (Kgp E : Subgroup Γ) [Kgp.Normal] (hK : Kgp.index = 2) (θ : Kgp →* kˣ) (σθ : Representation k Kgp k)
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

-- Missing actual cyclic automorphic descent, Galois invariance, one fixed η^i
-- chosen independently of λ, and matching ALL good characteristic polynomials.
-- These parameter functions are the suppliers' matrices, not arbitrary traces.
theorem compatible_descent (Pi : EClass) (r : Λ → V → GeneralLinearGroup (Fin 2) K)
    (sat : FClass → V → GeneralLinearGroup (Fin 2) K) (S : Finset V) :
    ∃ π : FClass, cyclicBaseChange FClass EClass π = Pi ∧
      ∀ ell v, v ∉ S → (sat π v).val.trace = (r ell v).val.trace ∧
        (sat π v).val.det = (r ell v).val.det := by sorry

-- Layer inputs (TauCeti.GL2Blueprint): strongMultiplicityOne
-- Missing the extension/localRep/disjointness data supplied by R23, automorphic
-- invariance and consistent character matching at every cyclic tower step.
-- Galois descent alone is explicitly insufficient.
theorem potential_modularity_interface (Pi : EClass) :
    ∃ π : FClass, solvableBaseChange FClass EClass π = Pi := by sorry
end TransferExports

end TauCeti.GL2Transfer

/-
Node index. For each layer R16.1–R17.6, the packet nodes in packet order: node id
suffix, kind, and the Lean names typed for the node (its declaration, then `api:` and
`tests:` names). Names are relative to TauCeti.GL2Blueprint (R16.1–R17.2) and
TauCeti.GL2Transfer (R17.3–R17.6).

Layer R16.1 (TauCeti.GL2Blueprint)
  R16.1/k0 (definition): k0
    api: k0_mem, k0_mono, k0_top, k0_scalar
    tests: k0_identity, k0_level_zero, k0_wrong_entry
  R16.1/k1 (definition): k1
    api: k1_mem, k1_le_k0, k1_mono, k1_top, k1_scalar
    tests: k1_identity, k1_level_zero, k1_not_principal
  R16.1/local-adelic-compact-comparison (theorem): compactComparison
  R16.1/iwasawa-cartan (theorem): iwasawaCartan
  R16.1/haar-quotient-comparison (theorem): haarComparison
  R16.1/finite-level-comparison (theorem): finiteLevelComparison

Layer R16.2 (TauCeti.GL2Blueprint)
  R16.2/local-classification (theorem): localClassification
  R16.2/newvector-level-exists (theorem): newvectorLevelExists
  R16.2/newvector-conductor (definition): conductorExponent
    api: conductor_min, conductor_iso, conductor_unramified_twist
    tests: conductor_unramified, conductor_steinberg, conductor_ramified_steinberg
  R16.2/casselman-newvector (theorem): casselmanNewvector
  R16.2/normalized-newvector (construction): normalizedNewvector
    api: normalizedNewvector_fixed, normalizedNewvector_eval, normalizedNewvector_unique,
      normalizedNewvector_twist
    tests: normalizedNewvector_line, normalizedNewvector_rescale,
      normalizedNewvector_zero_functional
  R16.2/spherical-whittaker-values (construction): sphericalValues
    api: sphericalValues_zero, sphericalValues_recurrence, sphericalValues_swap,
      sphericalValues_equal
    tests: sphericalValues_one, sphericalValues_two, sphericalValues_collision
  R16.2/iwahori-oldforms (theorem): iwahoriOldforms
  R16.2/supercuspidal-kirillov (theorem): supercuspidalKirillov
  R16.2/henniart-unicity (theorem): henniartUnicity
  R16.2/supercuspidal-projective (theorem): supercuspidalProjective
  R16.2/cdt-vexing-type (construction): cdtVexingType
    api: cdtVexingType_restrict, cdtVexingType_lattice, cdtVexingType_unramified
    tests: cdtVexingType_scalar_extension, cdtVexingType_distinct_inertia,
      cdtVexingType_unramified_twist
  R16.2/iwahori-center (theorem): iwahoriCenter
  R16.2/archimedean-classification (theorem): archimedeanClassification

Layer R16.3 (TauCeti.GL2Blueprint)
  R16.3/principal-series-parameter (theorem): principalParameter
  R16.3/steinberg-monodromy (theorem): steinbergParameter
  R16.3/supercuspidal-parameter (comparison): supercuspidalParameter
  R16.3/tate-unitary-normalization (theorem): normalizationBridge
  R16.3/conductor-epsilon-comparison (comparison): conductorEpsilon
  R16.3/archimedean-factor-comparison (theorem): archimedeanFactors
  R16.3/tamely-dihedral (definition): tamelyDihedral
    api: tamelyDihedral_parameter, tamelyDihedral_unramified_twist, tamelyDihedral_conjugate
    tests: tamelyDihedral_order_three, tamelyDihedral_order_two_excluded,
      tamelyDihedral_unramified_character
  R16.3/tamely-dihedral-supercuspidal (theorem): tamelyDihedralSupercuspidal
  R16.3/cdt-inertia-multiplicity (theorem): cdtInertiaMultiplicity

Layer R16.4 (TauCeti.GL2Blueprint)
  R16.4/cuspidal-tensor-factorization (theorem): cuspidalTensor
  R16.4/global-whittaker-expansion (theorem): globalWhittakerExpansion
  R16.4/global-multiplicity-one (theorem): globalMultiplicityOne
  R16.4/strong-multiplicity-one (theorem): strongMultiplicityOne
  R16.4/cohomological-rationality (theorem): cohomologicalRationality
  R16.4/non-cm-self-twists (definition): nonCM
    api: nonCM_iff, nonCM_twist, nonCM_self_twist_square
    tests: nonCM_free_action, nonCM_trivial_character, nonCM_quadratic_stabilizer

Layer R16.5 (TauCeti.GL2Blueprint)
  R16.5/whittaker-integral-comparison (theorem): whittakerIntegral
  R16.5/full-gl2-converse (theorem): gl2Converse
  R16.5/classical-l-function-comparison (theorem): classicalLFunction
  R16.5/global-epsilon-normalization (comparison): globalEpsilon

Layer R16.6 (TauCeti.GL2Blueprint)
  R16.6/primitive-classical-bijection (construction): primitiveBijection
    api: primitiveBijection_conductor, primitiveBijection_weight_character,
      primitiveBijection_hecke, primitiveBijection_normalized, primitiveBijection_inverse
    tests: primitiveBijection_weight_two, primitiveBijection_old_level,
      primitiveBijection_scalar_normalization
  R16.6/classical-hecke-and-level (theorem): classicalHeckeLevel
  R16.6/hilbert-algebraic-weights (construction): hilbertWeightRepresentation
    api: hilbertWeightRepresentation_scalar, hilbertWeightRepresentation_dimension,
      hilbertWeightRepresentation_dual, hilbertWeightRepresentation_base_change
    tests: hilbertWeightRepresentation_weight_two, hilbertWeightRepresentation_weight_three,
      hilbertWeightRepresentation_mixed_parity
  R16.6/weight-k-parameter-conversion (theorem): weightKParameterConversion
  R16.6/geometry-and-galois-exports (application): geometricExports
  R16.6/weight-one-classical-comparison (theorem): weightOneClassicalComparison

Layer R17.1 (TauCeti.GL2Blueprint)
  R17.1/local-quaternionic-comparison (theorem): localQuaternionic
  R17.1/norm-character-steinberg (theorem): normCharacterSteinberg
  R17.1/real-quaternionic-comparison (theorem): realQuaternionic
  R17.1/wild-dyadic-transfer (comparison): wildDyadicTransfer
  R17.1/swapped-quaternion-invariants (theorem): quaternionSwap

Layer R17.2 (TauCeti.GL2Blueprint)
  R17.2/steinberg-projector-difference (construction): steinbergProjectorDifference
    api: steinbergProjectorDifference_eval, steinbergProjectorDifference_central,
      steinbergProjectorDifference_steinberg, steinbergProjectorDifference_character,
      steinbergProjectorDifference_twist
    tests: steinbergProjectorDifference_trivial_norm,
      steinbergProjectorDifference_unramified_principal,
      steinbergProjectorDifference_outside_support, steinbergProjectorDifference_scalar_twist
  R17.2/quaternionic-orbital-matching (theorem): quaternionicOrbitalMatching
  R17.2/cyclic-local-matching (construction): cyclicMatching
    api: cyclicMatching_norm, cyclicMatching_non_norm, cyclicMatching_unit, cyclicMatching_satake,
      cyclicMatching_central
    tests: cyclicMatching_degree_one, cyclicMatching_quadratic_satake, cyclicMatching_non_norm_test
  R17.2/continuous-residual-ledger (theorem): spectralLedger
  R17.2/strong-cuspidal-vanishing (theorem): strongCuspidalVanishing
  R17.2/specialized-trace-comparison (theorem): specializedTraceComparison

Layer R17.3 (TauCeti.GL2Transfer)
  R17.3/global-jl (construction): globalJL
    api: globalJL_local, globalJL_central, globalJL_inverse, globalJL_twist, globalJL_split
    tests: jl_split_test, jl_steinberg_test, jl_inverse_test, jl_eisenstein_excluded_test
  R17.3/norm-exception (theorem): norm_exception
  R17.3/split-hecke (comparison): split_hecke
  R17.3/local-factors (theorem): local_factors
  R17.3/strong-multiplicity-one (theorem): strong_multiplicity_one
  R17.3/multiplicity-one (theorem): multiplicity_one
  R17.3/coefficient-conjugation (theorem): coefficient_conjugation
  R17.3/rational-models (comparison): rational_models
  R17.3/definite-infinity (theorem): definite_infinity
  R17.3/indefinite-parity (application): indefinite_parity
  R17.3/invariant-exchange (application): invariant_exchange
  R17.3/supercuspidal-globalization (theorem): supercuspidal_globalization

Layer R17.4 (TauCeti.GL2Transfer)
  R17.4/unramified-base-change (definition): unramifiedBaseChange
    api: unramifiedBaseChange_one, unramifiedBaseChange_tower, unramifiedBaseChange_conjugate,
      unramifiedBaseChange_det, unramifiedBaseChange_map
    tests: bc_degree_one_test, bc_identity_test, bc_diagonal_square_test, bc_not_identity_test,
      bc_tower_test
  R17.4/cyclic-base-change (construction): cyclicBaseChange
    api: cyclicBaseChange_local, cyclicBaseChange_unramified, cyclicBaseChange_central,
      cyclicBaseChange_twist, cyclicBaseChange_galois, cyclicBaseChange_coefficients
    tests: cyclic_split_test, cyclic_inert_test, cyclic_induced_test, cyclic_odd_degree_test
  R17.4/local-compatibility (theorem): local_compatibility
  R17.4/cyclic-descent (theorem): cyclic_descent
  R17.4/cuspidality (theorem): cuspidality
  R17.4/cyclic-descent-fibers (theorem): cyclic_descent_fibers
  R17.4/isobaric-fibers (theorem): isobaric_fibers
  R17.4/solvable-base-change (construction): solvableBaseChange
    api: solvableBaseChange_refl, solvableBaseChange_tower, solvableBaseChange_local,
      solvableBaseChange_twist
    tests: solvable_empty_test, solvable_two_towers_test, solvable_degree_six_test,
      solvable_cuspidality_test
  R17.4/tower-independence (theorem): tower_independence
  R17.4/solvable-descent (theorem): solvable_descent
  R17.4/prescribed-local-base-change (application): prescribed_local_base_change
  R17.4/adjoint-lift (construction): adjointLift
    api: adjointLift_local, adjointLift_unramified, adjointLift_twist, adjointLift_central
    tests: adjoint_diagonal_test, adjoint_scalar_test, adjoint_twist_test,
      adjoint_not_sym_square_test
  R17.4/cubic-character-induction (theorem): cubic_character_induction
  R17.4/gl3-recognition (theorem): gl3_recognition
  R17.4/nonnormal-cubic-base-change (construction): cubicBaseChange
    api: cubicBaseChange_unramified, cubicBaseChange_twist, cubicBaseChange_central,
      cubicBaseChange_unique
    tests: cubic_split_test, cubic_one_two_test, cubic_inert_test, cubic_not_three_test

Layer R17.5 (TauCeti.GL2Transfer)
  R17.5/quadratic-induction (construction): quadraticInduction
    api: quadraticInduction_local, quadraticInduction_central, quadraticInduction_baseChange,
      quadraticInduction_twist, quadraticInduction_cuspidal
    tests: induction_invariant_test, induction_split_test, induction_determinant_test,
      induction_noninvariant_test
  R17.5/dihedral-artin (theorem): dihedral_artin
  R17.5/finite-hecke-extension (theorem): finite_hecke_extension
  R17.5/tate-vanishing (theorem): tate_vanishing
  R17.5/finite-projective-lift (theorem): finite_projective_lift
  R17.5/tetrahedral-artin (theorem): tetrahedral_artin
  R17.5/octahedral-artin (theorem): octahedral_artin
  R17.5/solvable-artin (theorem): solvable_artin
  R17.5/q-weight-one (comparison): q_weight_one
  R17.5/tr-weight-one (comparison): tr_weight_one
  R17.5/odd-residual-lift (theorem): odd_residual_lift
  R17.5/residual-lt-application (application): residual_lt_application
  R17.5/tunnell-primitive-globalization (theorem): tunnell_primitive_globalization
  R17.5/prescribed-local-induction (theorem): prescribed_local_induction
  R17.5/octahedral-mod-three-application (application): octahedral_mod_three_application

Layer R17.6 (TauCeti.GL2Transfer)
  R17.6/solvable-dihedral (application): solvable_dihedral
  R17.6/determinant-untwist (theorem): determinant_untwist
  R17.6/teichmuller-conductor (comparison): teichmuller_conductor
  R17.6/rt-technical-lemma (theorem): rt_technical_lemma
  R17.6/serre-odd-trick (theorem): serre_odd_trick
  R17.6/rohrlich-tunnell (theorem): rohrlich_tunnell
  R17.6/wiese-odd-lift (theorem): wiese_odd_lift
  R17.6/unramified-katz (theorem): unramified_katz
  R17.6/qualitative-residual-modularity (theorem): qualitative_residual_modularity
  R17.6/weight-two-witness (application): weight_two_witness
  R17.6/disjoint-irreducibility (theorem): disjoint_irreducibility
  R17.6/quadratic-restriction (application): quadratic_restriction
  R17.6/compatible-base-change (comparison): compatible_base_change
  R17.6/compatible-descent (comparison): compatible_descent
  R17.6/potential-modularity-interface (application): potential_modularity_interface
-/
