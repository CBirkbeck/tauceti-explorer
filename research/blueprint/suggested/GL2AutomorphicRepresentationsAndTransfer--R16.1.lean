/-
This file is not the roadmap and is not exhaustive. The companion roadmap document
is definitive. These statements suggest Lean forms so contributors and reviewers
can converge on names and signatures. They claim no implementation.

The pins have the matrix group, representations and invariants used below. They
lack the SR/AF/AL/AS/ET supplier interfaces for smooth irreducible classes,
automorphic classes, Weil parameters, analytic test functions and trace terms.
Capitalized carrier parameters and the operations on them denote those suppliers'
actual objects; they are not new representation definitions. Unavailable
conditions are never represented by dummy Prop-valued fields. A source statement
whose supplier objects or hypotheses cannot be stated at the pins is recorded in an
explicit §13 omission comment block with its full packet statement, hypotheses, API
and tests; every remaining declaration is intended to be true as written for all
values of its parameters. The packet states the full mathematics.

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
import Mathlib.Analysis.SpecialFunctions.Gamma.Deligne

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
/-
Explicit signature omissions (PROTOCOL §13; REV-FIX-RT-AREA-automorphic-1~4).
The SR.2/SR.3/SR.5 irreducible admissible GL₂(F) class carrier and its K₁(pⁿ) fixed spaces are absent, so an arbitrary representation, module or class map cannot satisfy these classification and newvector statements; conductorExponent with its API and the unramified test remain below as true fragments.
These source targets require the actual supplier objects and hypotheses below.
They are not universal theorems about arbitrary types, functions, or multiplicity maps.
Omitted declaration names: TauCeti.GL2Blueprint.localClassification, TauCeti.GL2Blueprint.newvectorLevelExists, TauCeti.GL2Blueprint.casselmanNewvector.
Full source-level tests awaiting the same carriers: TauCeti.GL2Blueprint.conductor_steinberg, TauCeti.GL2Blueprint.conductor_ramified_steinberg.

GL2AutomorphicRepresentationsAndTransfer:R16.2/local-classification
TauCeti.GL2Blueprint.localClassification
Over any nonarchimedean characteristic-zero local field F, with ν=|·|F and complex coefficients, normalized induction I(χ₁,χ₂)=Ind_B^G(χ₁⊗χ₂) is irreducible iff χ₁χ₂⁻¹≠ν,ν⁻¹. Its central character is χ₁χ₂. If χ₁=χν¹ᐟ², χ₂=χν⁻¹ᐟ², it has the essentially Steinberg subrepresentation St⊗χdet and one-dimensional quotient χdet; reversing the order reverses the sub/quotient. Every irreducible admissible representation is a character of determinant, irreducible principal series, essentially Steinberg, or supercuspidal. Infinite-dimensional irreducibles are generic; one-dimensional characters are not. These are explicit calculations in the SR.2 induction/Jacquet carriers and ET.6 classification, including residue characteristic two.
Hypotheses: Smooth, irreducible, admissible complex representations; χᵢ smooth quasicharacters.

GL2AutomorphicRepresentationsAndTransfer:R16.2/newvector-level-exists
TauCeti.GL2Blueprint.newvectorLevelExists
For an irreducible admissible infinite-dimensional complex smooth representation π of GL₂(F), with F a nonarchimedean local field of characteristic zero, there is n≥0 and a nonzero vector fixed by the last-row K₁(pⁿ). This assertion neither uses a conductor exponent nor asserts the dimension formula; it supplies the nonempty level set before its minimum is defined.
Hypotheses: Irreducible admissible infinite-dimensional complex smooth π; K₁ is the last-row subgroup over the valuation ring.

GL2AutomorphicRepresentationsAndTransfer:R16.2/newvector-conductor
TauCeti.GL2Blueprint.conductorExponent
For irreducible admissible infinite-dimensional π of GL₂(F), c(π) is the least n≥0 for which π^{K₁(pⁿ)} is nonzero. Define the ideal conductor p^{c(π)}. The same least-level construction is available for an existing representation with an explicit nonempty level set. Existence for the stated π is the preceding newvectorLevelExists theorem, not a field stored in a replacement representation. This is a specialization of fixed vectors, not a new admissibility predicate.
Hypotheses: π generic, equivalently infinite-dimensional irreducible in characteristic zero; O,p and K₁ fixed.
TauCeti.GL2Blueprint.conductor_min: π^{K₁(p^{c(π)})}≠0 and π^{K₁(pⁿ)}=0 for n<c(π).
TauCeti.GL2Blueprint.conductor_iso: Isomorphic local representations have equal conductor exponent.
TauCeti.GL2Blueprint.conductor_unramified_twist: An unramified χ has c(π⊗χdet)=c(π), since χdet is trivial on GL₂(O).
TauCeti.GL2Blueprint.conductor_unramified: An irreducible unramified generic principal series has conductor zero.
TauCeti.GL2Blueprint.conductor_steinberg: An unramified Steinberg twist has conductor one.
TauCeti.GL2Blueprint.conductor_ramified_steinberg: For χ of conductor a≥2, c(St⊗χdet)=2a≠1+a. At a=1 both formulas give2, so that case alone would not detect the incorrect rule.

GL2AutomorphicRepresentationsAndTransfer:R16.2/casselman-newvector
TauCeti.GL2Blueprint.casselmanNewvector
For π as above and every n≥0, dimℂ π^{K₁(pⁿ)}=max(0,n−c(π)+1). The minimal fixed space is a line. In the lower-last-row convention it is the ωπ(d)-isotypic line for K₀(p^{c(π)}), with ωπ the central character, when c>0; at c=0 it is the spherical line. With ψ trivial on O but nontrivial on ϖ⁻¹O, Whittaker evaluation W↦W(1) is nonzero on this line. Casselman’s printed top-left central-character convention is transported through the dual/twist convention; it is not silently identified with the lower-last-row subgroup. The theorem has no odd-residue-characteristic restriction.
Hypotheses: Irreducible admissible infinite-dimensional complex π; ψ of conductor O; n natural.
-/

/-- Algebraic least-level signature. In GL₂ the subgroups are K₁(pⁿ).
Under the R16.2/newvector-level-exists hypotheses (omitted above) such an hex exists. -/
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
/-
Explicit signature omissions (PROTOCOL §13; REV-FIX-RT-AREA-automorphic-1~4).
The SR.2/SR.3/SR.4/SR.5 irreducible smooth GL₂(F) class, its K₀(p) and GL₂(O) fixed spaces, the Iwahori–Hecke algebra with its relations, the Kirillov model and the type Hom-multiplicity are absent, so arbitrary modules, rings or multiplicity functions cannot satisfy these local identities.
These source targets require the actual supplier objects and hypotheses below.
They are not universal theorems about arbitrary types, functions, or multiplicity maps.
Omitted declaration names: TauCeti.GL2Blueprint.iwahoriOldforms, TauCeti.GL2Blueprint.iwahoriCenter, TauCeti.GL2Blueprint.supercuspidalKirillov, TauCeti.GL2Blueprint.henniartUnicity.

GL2AutomorphicRepresentationsAndTransfer:R16.2/iwahori-oldforms
TauCeti.GL2Blueprint.iwahoriOldforms
Let π be an irreducible admissible infinite-dimensional unramified representation of GL₂(F). Then dim π^{K₀(p)}=2 and dim π^{GL₂(O)}=1. With vol(K₀(p))=1, U=[K₀(p)diag(ϖ,1)K₀(p)], the spherical vector v generates the Iwahori fixed space under ℂ[U], even if the Satake parameters coincide. The U polynomial is X²−q^{1/2}(α+β)X+qαβ in this unnormalized double-coset convention. A nontrivial unramified χdet has dimensions 1 and 1, so the printed CG20 condition “not trivial” must be replaced by infinite-dimensional.
Hypotheses: Complex characteristic zero; π unramified and infinite-dimensional, not just nontrivial.

GL2AutomorphicRepresentationsAndTransfer:R16.2/iwahori-center
TauCeti.GL2Blueprint.iwahoriCenter
For the upper Iwahori I and a characteristic-zero coefficient ring in which q and q+1 are invertible, normalize vol(I)=1 and eK=1_K/vol(K). Put U₀=1_{I diag(ϖ,ϖ) I} and U₁=1_{I diag(ϖ,1) I}. The center of H(G,I) is the Laurent polynomial algebra in U₀^{±1} and z₁=U₁+qU₀U₁⁻¹. Multiplication by eK identifies it with the spherical algebra H(G,K), sending U₀ to T₀ and z₁ to T₁, with normalized spherical identity eK. Coefficient extensions used in BCGP invert p and the required idempotent denominators. The rank-independent Bernstein center belongs to SmoothRepresentationsPartIIParahoricCenters; until that proposed roadmap exists, SR.4 supplies the requested contract.
Hypotheses: q is a unit; eK requires the I-index q+1 to be a unit; U₁ has its usual invertibility in the affine Hecke algebra.

GL2AutomorphicRepresentationsAndTransfer:R16.2/supercuspidal-kirillov
TauCeti.GL2Blueprint.supercuspidalKirillov
For irreducible supercuspidal π with central character ω and nontrivial ψ, restricting the imported Whittaker function W to diag(x,1), x∈F×, identifies its Kirillov realization with C_c^∞(F×,ℂ). For b=(a u;0 d), the action is (π(b)f)(x)=ω(d)ψ(xu/d)f(xa/d). The Weyl action is the supplier local functional equation; it is not a freely chosen transform. For π over a finite extension L/ℚp, DLB’s scalar extension with L∞ and Γ descent is requested from SR.5; locally analytic Kirillov–Colmez theory belongs to R30.
Hypotheses: Smooth characteristic-zero supercuspidal; additive-character and central-character choices visible.

GL2AutomorphicRepresentationsAndTransfer:R16.2/henniart-unicity
TauCeti.GL2Blueprint.henniartUnicity
For the inertial class s of an irreducible supercuspidal π of GL₂(F), there is a unique isomorphism class of irreducible GL₂(O)-representation σ typical for s. It occurs with multiplicity one in every π⊗χdet with χ unramified. If σ occurs in an irreducible admissible π′, then π′≅π⊗χdet for an unramified χ. The type carrier and Bernstein inertial equivalence belong to SR.3/ET.6. No uniqueness is asserted for an arbitrary nonminimal K-constituent.
Hypotheses: Characteristic-zero algebraically closed coefficients; nonarchimedean F, including dyadic fields.
-/
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
-- TauCeti.GL2Blueprint.cdtVexingType_unramified_twist
example (Θ Θ' : Representation ℂ G V) (ι : H →* G)
    (he : ∀ g, Θ g = Θ' g) : cdtVexingType Θ ι = cdtVexingType Θ' ι := by sorry
/-
Explicit signature omissions (PROTOCOL §13; REV-FIX-RT-AREA-automorphic-1~4).
The CDT full type Θ(θ), the principal-congruence fixed space and the supplier Hom_K occurrence are absent, so arbitrary modules or occurrence counts cannot satisfy these statements; cdtVexingType with its API and the scalar-extension and unramified-twist tests remain above as true fragments.
These source targets require the actual supplier objects and hypotheses below.
They are not universal theorems about arbitrary types, functions, or multiplicity maps.
Omitted declaration names: TauCeti.GL2Blueprint.cdtInertiaMultiplicity.
Full source-level tests awaiting the same carriers: TauCeti.GL2Blueprint.cdtVexingType_distinct_inertia.

GL2AutomorphicRepresentationsAndTransfer:R16.2/cdt-vexing-type
TauCeti.GL2Blueprint.cdtVexingType
Let x≠ℓ be a vexing prime: x≡−1 mod ℓ, residual local rank-two representation irreducible but its inertia restriction reducible; its conductor c_x=2n. From CDT’s regular character θ of the unramified quadratic extension with conductor xⁿ construct Θ(θ), an existing finite-group representation of GL₂(ℤ/xⁿℤ), and choose a stable O-lattice for a characteristic-zero coefficient field containing its values. The local selector σ_x is Θ(θ) restricted to the exact U_x/V_x used by CDT §5 (U₀(x)/U(xⁿ) in the vexing case), not an arbitrary type on that quotient. The larger GL₂ quotient representation Wσx in CG18 restricts to this selector.
Hypotheses: x and ℓ distinct primes; regular θ, θ≠θ^Frob; coefficient field contains values; choose an invariant lattice.
TauCeti.GL2Blueprint.cdtVexingType_restrict: The selector is the restriction of Θ(θ) to U₀(x)/U(xⁿ).
TauCeti.GL2Blueprint.cdtVexingType_lattice: The chosen O-lattice is stable and scalar extension recovers Θ(θ).
TauCeti.GL2Blueprint.cdtVexingType_unramified: An unramified twist leaves the compact type and its selector unchanged.
TauCeti.GL2Blueprint.cdtVexingType_scalar_extension: The lattice tensored with the coefficient field is isomorphic to Θ(θ).
TauCeti.GL2Blueprint.cdtVexingType_distinct_inertia: A local representation with inertial characters not θ,θ^Frob has no occurrence of the full Θ(θ) type.
TauCeti.GL2Blueprint.cdtVexingType_unramified_twist: π and π⊗ξdet for unramified ξ have equal Θ(θ) occurrence multiplicity.

GL2AutomorphicRepresentationsAndTransfer:R16.3/cdt-inertia-multiplicity
TauCeti.GL2Blueprint.cdtInertiaMultiplicity
For CDT’s regular θ of conductor xⁿ, write Θ(θ) for its full GL₂(ℤ/xⁿℤ) type. For infinite-dimensional irreducible admissible Π of GL₂(ℚx), Hom_K(Θ(θ),Π^{U(xⁿ)})≠0 iff rec Π|I≅θ∘η_{x²} ⊕ θ∘Frob∘η_{x²} in CDT’s reciprocity convention. In that case Π^{U(xⁿ)}≅Θ(θ) and the type multiplicity is one. Translate the Artin convention to R16.3. This comparison concerns the full K-type; its U₀(x) restriction used as a vexing selector can identify more than one finite-character twist. The special case in CDT’s surrounding discussion is translated with N retained, not as an N=0 parameter.
Hypotheses: x≠ℓ; regular θ and coefficient field containing its values; principal congruence U(xⁿ), full compact type. Use CFT Layer9 Weil reciprocity for ℚx and its unramified quadratic extension; Layer7 supplies the compatible absolute/finite-quotient map, not an inverse on all of G_Fᵃᵇ.
-/
end CDT

section Parameters
/-
Explicit signature omissions (PROTOCOL §13; REV-FIX-RT-AREA-automorphic-1~4).
The ET.6 local class and Weil–Deligne parameter carriers and the AL.2 local factors are absent, so arbitrary maps and functions cannot satisfy these parameter and factor identities; steinbergParameter and normalizationBridge remain below as true matrix computations.
These source targets require the actual supplier objects and hypotheses below.
They are not universal theorems about arbitrary types, functions, or multiplicity maps.
Omitted declaration names: TauCeti.GL2Blueprint.principalParameter, TauCeti.GL2Blueprint.supercuspidalParameter, TauCeti.GL2Blueprint.conductorEpsilon.

GL2AutomorphicRepresentationsAndTransfer:R16.3/principal-series-parameter
TauCeti.GL2Blueprint.principalParameter
For F/ℚp finite, with Art_F:F×≃W_Fᵃᵇ the topological Weil-group reciprocity isomorphism normalized by Art_F(ϖ)=Φ geometric and ν(ϖ)=q⁻¹, rec(I(χ₁,χ₂))=(χ₁∘Art_F⁻¹)⊕(χ₂∘Art_F⁻¹), N=0, for an irreducible normalized principal series. Thus det rec=ωπ∘Art_F⁻¹ and L(s,π)=L(s,χ₁)L(s,χ₂). A ramified character contributes 1. At the reducible ratio ν^{±1}, this is the parameter of the one-dimensional Langlands quotient; the generic Steinberg constituent instead has nonzero N as below. The statement uses Frobenius-semisimple Weil–Deligne parameters, not semisimplification that discards N.
Hypotheses: Characteristic-zero nonarchimedean F; χ₁χ₂⁻¹≠ν^{±1} in the principal-series assertion. Art_F⁻¹ is evaluated on the topological Weil abelianization supplied by CFT Layer9, not on the absolute Galois abelianization of Layer7.

GL2AutomorphicRepresentationsAndTransfer:R16.3/supercuspidal-parameter
TauCeti.GL2Blueprint.supercuspidalParameter
rec identifies supercuspidal GL₂(F) representations with irreducible two-dimensional Weil representations, with N=0; determinants, character twists, conductors and L/epsilon factors agree with the existing parameter conventions. Such a parameter has no inertia-fixed vector, hence its standard L-factor is 1. A quadratic induction gives a dihedral example when θ≠θ^σ, but this is not an exhaustive description at dyadic places: primitive wild parameters remain in the ET.6 carrier and use the full Swan conductor. R30’s p-adic Banach correspondence is a separate consumer.
Hypotheses: All finite extensions of ℚp, including p=2; smooth characteristic-zero correspondence.

GL2AutomorphicRepresentationsAndTransfer:R16.3/conductor-epsilon-comparison
TauCeti.GL2Blueprint.conductorEpsilon
For every generic irreducible π, c(π)=a(rec π), with the same value for recᵀ. With ψ of conductor O and self-dual additive measure, ε(s,π,ψ)=ε(1/2,π,ψ)q^{-c(π)(s−1/2)}. For ψ_a(x)=ψ(ax), ε(s,π,ψ_a)=ωπ(a)|a|^{2s−1}ε(s,π,ψ); the measure is changed to the corresponding self-dual one. An unramified twist by ν^t replaces s by s+t and leaves c unchanged. For a ramified χ, one uses the full tensor-parameter conductor; c(π⊗χdet) is not generally c(π)+2a(χ).
Hypotheses: Use normalized AL.2 epsilon factors, not an unnormalized Fourier measure; π generic and characteristic zero.
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
/-
Explicit signature omissions (PROTOCOL §13; REV-FIX-RT-AREA-automorphic-1~4).
The AF.1 archimedean class and parameter carriers (gl2-real-discrete-series, archimedean-llc-gln) and the AL.2 standard factor are absent, so arbitrary maps and functions cannot satisfy these identifications; Mathlib’s Complex.Gammaℝ and Complex.Gammaℂ fix the gamma normalizations used in the true examples below.
These source targets require the actual supplier objects and hypotheses below.
They are not universal theorems about arbitrary types, functions, or multiplicity maps.
Omitted declaration names: TauCeti.GL2Blueprint.archimedeanClassification, TauCeti.GL2Blueprint.archimedeanFactors.

GL2AutomorphicRepresentationsAndTransfer:R16.2/archimedean-classification
TauCeti.GL2Blueprint.archimedeanClassification
Import the existing AF.1/weil-group-real, AF.1/archimedean-llc-gln and AF.1/casselman-wallach-globalization nodes of the single AF real-representation owner. The proposed AF.1b split preserves these contracts; it is not an installed stage. For GL₂(ℝ), real reducible parameters χ₁⊕χ₂ correspond to the appropriate Langlands quotient of normalized induction, including its finite-dimensional exceptional quotients. An irreducible parameter Ind_{ℂ×}^{Wℝ}((z/|z|)^m|z|^{2t}), integer m≥1, corresponds to D_{m+1}⊗|det|^t, the full O(2) representation whose positive-determinant restriction has holomorphic and antiholomorphic pieces. For m=0 the parameter splits and one obtains the limit boundary; it is not an irreducible Weil parameter. For GL₂(ℂ), every parameter is a pair of continuous quasicharacters and the representation is the corresponding Langlands quotient; GL₂(ℂ) has no discrete series modulo center.
Hypotheses: Admissible irreducible Harish–Chandra modules with their Casselman–Wallach globalizations; explicit chamber/order in a Langlands quotient.

GL2AutomorphicRepresentationsAndTransfer:R16.3/archimedean-factor-comparison
TauCeti.GL2Blueprint.archimedeanFactors
Use Γℝ(s)=π^{−s/2}Γ(s/2), Γℂ(s)=2(2π)^{−s}Γ(s). For a real character sign^ε|·|^u the factor is Γℝ(s+u+ε). For Ind_{ℂ×}^{Wℝ}((z/|z|)^m|z|^{2t}), m≥1, the factor is Γℂ(s+t+m/2); thus L(s,D_k)=Γℂ(s+(k−1)/2) for k≥2. At m=0 its split parameter has Γℝ(s+t)Γℝ(s+t+1)=Γℂ(s+t), without making it an irreducible Weil representation. Over ℂ, a character (z/|z|)^m|z|^{2t} has Γℂ(s+t+|m|/2), and the rank-two factor is the product. With ψℝ(x)=exp(2πix), the real-character epsilon is i^ε and the induced epsilon is i^{m+1}; complex places use ψℂ=ψℝ∘Trℂ/ℝ and AL.1’s convention.
Hypotheses: Archimedean local reciprocity, absolute value |z|ℂ=|z|², gamma and additive-character conventions fixed.
-/
-- True fragments for R16.2/R16.3 with Mathlib’s Deligne gamma factors (no packet
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
/-
Explicit signature omissions (PROTOCOL §13; REV-FIX-RT-AREA-automorphic-1~4).
The actual unramified-quadratic Galois action on tame characters and ET.6’s supercuspidal subset are absent, so an arbitrary involution or subset cannot satisfy these statements; tamelyDihedral with its parameter and twist API and its three tests remain above as true fragments.
These source targets require the actual supplier objects and hypotheses below.
They are not universal theorems about arbitrary types, functions, or multiplicity maps.
Omitted declaration names: TauCeti.GL2Blueprint.tamelyDihedral_conjugate, TauCeti.GL2Blueprint.tamelyDihedralSupercuspidal.

GL2AutomorphicRepresentationsAndTransfer:R16.3/tamely-dihedral
TauCeti.GL2Blueprint.tamelyDihedral
For odd prime ℓ with q≡−1 mod ℓ, an irreducible admissible π is tamely dihedral of order ℓ precisely when rec π=(Ind_{W_{F′}}^{W_F}θ,0), where F′/F is unramified quadratic and θ|I has exact order ℓ. Use the supplier’s induced Weil representation and class of π; no second automorphic or WD carrier is defined. The induction direction corrects the reversed indices in NT Definition 2.4. Since ℓ is prime to the residue characteristic, the inertia character is tame.
Hypotheses: ℓ odd prime, q residue cardinality and q≡−1 mod ℓ; θ continuous with open kernel on inertia.
TauCeti.GL2Blueprint.tamelyDihedral_parameter: Membership is equivalent to the stated induced parameter with exact inertia order ℓ and N=0.
TauCeti.GL2Blueprint.tamelyDihedral_unramified_twist: An unramified determinant twist preserves tamely-dihedral order ℓ.
TauCeti.GL2Blueprint.tamelyDihedral_conjugate: Replacing θ by θ^σ gives the same induced parameter.
TauCeti.GL2Blueprint.tamelyDihedral_order_three: At q=2, ℓ=3, an inertia character of order three satisfies θ^q=θ^{-1}≠θ.
TauCeti.GL2Blueprint.tamelyDihedral_order_two_excluded: ℓ=2 fails oddness and θ^{-1}=θ for order-two inertia, so this irreducibility argument fails.
TauCeti.GL2Blueprint.tamelyDihedral_unramified_character: An unramified θ has inertia order one and is not tamely dihedral of order ℓ>2.

GL2AutomorphicRepresentationsAndTransfer:R16.3/tamely-dihedral-supercuspidal
TauCeti.GL2Blueprint.tamelyDihedralSupercuspidal
Every tamely dihedral π of odd prime order ℓ is supercuspidal. Its parameter is irreducible, has N=0 and Swan conductor zero; since inertia has no fixed vector, a(rec π)=2 and L(s,π)=1. The exact-order argument works also at residue characteristic two, because ℓ is odd and prime to q.
Hypotheses: The complete hypotheses of tamelyDihedral, including q≡−1 mod ℓ.
-/
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
/-
Explicit signature omissions (PROTOCOL §13; REV-FIX-RT-AREA-automorphic-1~4).
The full tensor of Sym^{kτ−2} over the real embeddings is absent, so an arbitrary module V does not have the stated dimension; hilbertWeightRepresentation with its scalar, dual and base-change API and its tests remain as true fragments.
These source targets require the actual supplier objects and hypotheses below.
They are not universal theorems about arbitrary types, functions, or multiplicity maps.
Omitted declaration names: TauCeti.GL2Blueprint.hilbertWeightRepresentation_dimension.

GL2AutomorphicRepresentationsAndTransfer:R16.6/hilbert-algebraic-weights
TauCeti.GL2Blueprint.hilbertWeightRepresentation
For totally real F, embeddings Σ=Hom(F,ℝ), integers k_τ≥2 and m_τ with k_τ+2m_τ=w independent of τ, define the local algebraic representation V_τ=Sym^{k_τ−2}(standard₂)⊗det^{m_τ}, using TauCeti.symPowerRep and the existing determinant character, and V=⊗_{τ∈Σ}V_τ on (Res_{F/ℚ}GL₂)_ℂ. Its scalar action at τ is z^{k_τ−2+2m_τ}=z^{w−2}; its dimension is ∏τ(k_τ−1). The dual V∨ is used when the cohomological/local-system convention requires it; the choice is stated in the AF.4 comparison rather than silently interchanged. Parallel parity of k_τ follows from the existence of the integer m_τ.
Hypotheses: Finite embedding set of a totally real number field; k_τ≥2, m_τ∈ℤ, k_τ+2m_τ=w; characteristic-zero coefficients.
TauCeti.GL2Blueprint.hilbertWeightRepresentation_scalar: A scalar at τ acts by z^{k_τ−2+2m_τ}; for cohomological weight this is z^{w−2}.
TauCeti.GL2Blueprint.hilbertWeightRepresentation_dimension: dim V=∏τ(k_τ−1).
TauCeti.GL2Blueprint.hilbertWeightRepresentation_dual: Dualizing inverts the scalar central character and agrees with the AF.4 local-system convention.
TauCeti.GL2Blueprint.hilbertWeightRepresentation_base_change: Extension of characteristic-zero coefficients commutes with the tensor construction.
TauCeti.GL2Blueprint.hilbertWeightRepresentation_weight_two: For one embedding, k=2,m=0 gives the trivial one-dimensional representation.
TauCeti.GL2Blueprint.hilbertWeightRepresentation_weight_three: For one embedding, k=3,m=1 gives standard₂⊗det, dimension two and scalar exponent three.
TauCeti.GL2Blueprint.hilbertWeightRepresentation_mixed_parity: Weights (2,3) cannot satisfy k_τ+2m_τ=w for integer m_τ and one common w.
-/
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
/-
Explicit signature omissions (PROTOCOL §13; REV-FIX-RT-AREA-automorphic-1~4).
The smooth division-algebra and essentially square-integrable GL₂(F) class carriers, local JL, the ET.6 parameters and AF.1’s archimedean character interfaces are absent, so arbitrary maps cannot satisfy these local transfer identities; quaternionSwap remains below as a true parity computation.
These source targets require the actual supplier objects and hypotheses below.
They are not universal theorems about arbitrary types, functions, or multiplicity maps.
Omitted declaration names: TauCeti.GL2Blueprint.localQuaternionic, TauCeti.GL2Blueprint.normCharacterSteinberg, TauCeti.GL2Blueprint.realQuaternionic, TauCeti.GL2Blueprint.wildDyadicTransfer.

GL2AutomorphicRepresentationsAndTransfer:R17.1/local-quaternionic-comparison
TauCeti.GL2Blueprint.localQuaternionic
For a nonarchimedean F and quaternion division algebra D/F from the upstream quaternion carrier, ET.6 local Jacquet–Langlands identifies irreducible smooth D× representations with essentially square-integrable GL₂(F) representations. On corresponding regular elliptic d,g having the same reduced characteristic polynomial, Θ_JL(ρ)(g)=−Θ_ρ(d). Determinants/central characters and χ∘Nrd versus χ∘det twists agree. At a split place D=M₂(F) the comparison is the chosen algebra isomorphism and has sign +1. A principal series has no division-algebra preimage. This is a specialization of the general correspondence, not a second existence/bijectivity proof.
Hypotheses: Characteristic-zero smooth representations; compare matching elliptic conjugacy classes; square-integrability is essential.

GL2AutomorphicRepresentationsAndTransfer:R17.1/norm-character-steinberg
TauCeti.GL2Blueprint.normCharacterSteinberg
Under localQuaternionic, χ∘Nrd on D× transfers to St⊗χdet. Its central character is χ², its WD parameter is steinbergParameter with N≠0, and its standard conductor is 1 for unramified χ or 2a(χ) for ramified χ. The corresponding local L/epsilon factors are exactly those of that parameter; the one-dimensional D× dimension does not make the GL₂ WD parameter monodromy-free. The trivial D× representation is the unramified St case, used by the definite-quaternion applications.
Hypotheses: Nonarchimedean quaternion division algebra; smooth characteristic-zero χ.

GL2AutomorphicRepresentationsAndTransfer:R17.1/real-quaternionic-comparison
TauCeti.GL2Blueprint.realQuaternionic
For D=Hamilton quaternions at a real place, an irreducible algebraic D× representation restricts to SU(2) as Sym^{k−2} for k≥2, with its specified positive-real central character. Its local JL image is D_k with the norm twist that gives the same central character. Under the complex splitting, the algebraic representation Sym^{k−2}⊗det^m has scalar action z^{k−2+2m}; comparison with the unitary D_k therefore includes the explicit |det|^{(k−2+2m)/2} twist and the same sign^k on ℝ×. For k=2,m=0 the trivial quaternionic representation transfers to D₂. One does not assert that an arbitrary unitary D_k is itself a finite-dimensional algebraic representation.
Hypotheses: Real place, k≥2 and m integer; AF.1b supplies full O(2) representation and archimedean LLC.

GL2AutomorphicRepresentationsAndTransfer:R17.1/wild-dyadic-transfer
TauCeti.GL2Blueprint.wildDyadicTransfer
For every essentially square-integrable GL₂(F) parameter, including primitive wild rank-two Weil representations at dyadic places, the ET.6 quaternionic preimage has the same central character and LLC parameter as GL₂, with the same standard factors and Artin conductor in R16.3’s convention. For a supercuspidal it has N=0; for a special representation it has rank-one N. Dihedral/tamely-dihedral examples are checks within this statement, not a replacement for primitive wild cases. No naive level exponent of a chosen order in D is equated to the GL₂ conductor without a separate comparison.
Hypotheses: ET.6 canonical inner-form correspondence at every finite extension of ℚp; characteristic zero.
-/
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
/-
Explicit signature omissions (PROTOCOL §13; REV-FIX-RT-AREA-automorphic-1~4).
The integrated trace distributions of St⊗χdet, the determinant character and the unramified principal series are absent, so arbitrary trace functionals cannot take these values (the two former API statements contradicted each other); steinbergProjectorDifference with its evaluation, central and twist API and the two pointwise tests remain as true fragments.
These source targets require the actual supplier objects and hypotheses below.
They are not universal theorems about arbitrary types, functions, or multiplicity maps.
Omitted declaration names: TauCeti.GL2Blueprint.steinbergProjectorDifference_steinberg, TauCeti.GL2Blueprint.steinbergProjectorDifference_character.
Full source-level tests awaiting the same carriers: TauCeti.GL2Blueprint.steinbergProjectorDifference_trivial_norm, TauCeti.GL2Blueprint.steinbergProjectorDifference_unramified_principal.

GL2AutomorphicRepresentationsAndTransfer:R17.2/steinberg-projector-difference
TauCeti.GL2Blueprint.steinbergProjectorDifference
At a nonarchimedean place, for unitary χ and ω=χ², work in SR.1’s compact-mod-center, ω⁻¹-equivariant Hecke space with AA.2 quotient measure. Put K=GL₂(O), I=K₀(p), and H=⟨Z,I,w⟩ where w=(0 1;ϖ 0). Let ξ(a)=(−1)^{v_F(a)}χ(a). Set e_K^χ(g)=χ(det g)⁻¹/vol(Z\ZK) on ZK and zero elsewhere, e_H^ξ(g)=ξ(det g)⁻¹/vol(Z\H) on H and zero elsewhere, and ζχ=e_H^ξ−e_K^χ. Then trace(St⊗χdet)(ζχ)=1, every other unitary infinite-dimensional irreducible with central character ω has trace zero, and trace(χdet)(ζχ)=−1; the other determinant characters with central character ω have trace zero. The construction is compact modulo Z, not necessarily compact in G. It is a trace projector, not an assertion that its operator is zero on every induced representation.
Hypotheses: χ unitary; nonarchimedean F; fixed central quotient measure, matching ω⁻¹ equivariance; exact extended-Iwahori H and ξ above.
TauCeti.GL2Blueprint.steinbergProjectorDifference_eval: ζχ(g)=e_H^ξ(g)−e_K^χ(g) with the stated support and quotient volumes.
TauCeti.GL2Blueprint.steinbergProjectorDifference_central: ζχ(zg)=ω(z)⁻¹ζχ(g).
TauCeti.GL2Blueprint.steinbergProjectorDifference_steinberg: The corresponding Steinberg trace is one and all other unitary infinite-dimensional traces are zero.
TauCeti.GL2Blueprint.steinbergProjectorDifference_character: The corresponding determinant-character trace is minus one.
TauCeti.GL2Blueprint.steinbergProjectorDifference_twist: Replacing χ by χη multiplies ζχ(g) by η(det g)⁻¹ with the compatible central character.
TauCeti.GL2Blueprint.steinbergProjectorDifference_trivial_norm: For χ=1, the St trace is 1 and the trivial GL₂-character trace is −1.
TauCeti.GL2Blueprint.steinbergProjectorDifference_unramified_principal: An irreducible unitary unramified principal series has trace zero, even though its Iwahori fixed space has dimension two.
TauCeti.GL2Blueprint.steinbergProjectorDifference_outside_support: At g outside H∪ZK, ζχ(g)=0.
TauCeti.GL2Blueprint.steinbergProjectorDifference_scalar_twist: A determinant-character twist multiplies both local idempotents by the same inverse character.
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
/-
Explicit signature omissions (PROTOCOL §13; REV-FIX-RT-AREA-automorphic-1~4).
The inner-form and cyclic matching functions, the C_c^∞ carriers, norm classes, centralizer measures and Satake transforms are absent, so arbitrary orbital-integral maps cannot satisfy these identities and a transfer map between arbitrary types need not exist; cyclicMatching_central and the quadratic Satake arithmetic test remain below as true fragments.
These source targets require the actual supplier objects and hypotheses below.
They are not universal theorems about arbitrary types, functions, or multiplicity maps.
Omitted declaration names: TauCeti.GL2Blueprint.quaternionicOrbitalMatching, TauCeti.GL2Blueprint.cyclicMatching, TauCeti.GL2Blueprint.cyclicMatching_norm, TauCeti.GL2Blueprint.cyclicMatching_non_norm, TauCeti.GL2Blueprint.cyclicMatching_unit, TauCeti.GL2Blueprint.cyclicMatching_satake.
Full source-level tests awaiting the same carriers: TauCeti.GL2Blueprint.cyclicMatching_degree_one, TauCeti.GL2Blueprint.cyclicMatching_non_norm_test.

GL2AutomorphicRepresentationsAndTransfer:R17.2/quaternionic-orbital-matching
TauCeti.GL2Blueprint.quaternionicOrbitalMatching
For matching regular elliptic d∈D× and g∈GL₂(F) with the same reduced polynomial, identify their centralizer torus and choose the same torus measure; specify each ambient quotient Haar measure. ET.3/ET.6 transfer supplies test functions f_D,f_G with O_g(f_G)=−O_d(f_D) and O_g(f_G)=0 at split regular semisimple g. With the matching rank-two character identity Θ_GL₂=−Θ_D this gives trace JL(ρ)(f_G)=trace ρ(f_D). For a chosen D× matrix coefficient the transferred f_G is the JL §16 elliptic character function; in the norm-character case use steinbergProjectorDifference. Compare formal degrees and the identity orbital term using the actual quotient-volume ratio; do not infer equality of formal degrees under unrelated ambient measures.
Hypotheses: Fixed unitary central character; compact modulo center functions; regular elliptic correspondence and common centralizer measure.

GL2AutomorphicRepresentationsAndTransfer:R17.2/cyclic-local-matching
TauCeti.GL2Blueprint.cyclicMatching
Let E/F be a cyclic extension of nonarchimedean local fields with generator σ, and use the ET.3/ET.4 twisted orbital integrals. For φ∈C_c^∞(GL₂(E)), choose f∈C_c^∞(GL₂(F)) with O_γ(f)=TO_{δ,σ}(φ) whenever γ is a regular norm of δ, and O_γ(f)=0 for regular nonnorm classes, with centralizer measures identified as in AC89 Chapter 1 §3. A matching central character on E is pulled back from F by N_{E/F}; central equivariance must use this norm, not the raw same character. At an unramified place with unit volumes, choose the spherical transfer: 1_{GL₂(O_E)} maps to 1_{GL₂(O_F)}, and Satake transforms are related by (α,β)↦(α^d,β^d), d=[E:F]. At a completely split global place use the product norm δ₁…δ_d and the corresponding convolution of local functions. The function choice is unique only modulo the kernel of regular orbital integrals.
Hypotheses: Cyclic local extension and generator; compatible centralizer Haar measures; unramified spherical assertion requires unramified E/F.
TauCeti.GL2Blueprint.cyclicMatching_norm: Matching regular norm classes have equal ordinary and twisted orbital integrals with identified centralizer measures.
TauCeti.GL2Blueprint.cyclicMatching_non_norm: The ordinary orbital integral vanishes on regular classes that are not norms.
TauCeti.GL2Blueprint.cyclicMatching_unit: Unramified hyperspecial units match with hyperspecial volumes one.
TauCeti.GL2Blueprint.cyclicMatching_satake: On an unramified Satake pair the norm rule sends (α,β) to (α^d,β^d).
TauCeti.GL2Blueprint.cyclicMatching_central: The E central character is ω_F∘N_{E/F}; test functions use its inverse.
TauCeti.GL2Blueprint.cyclicMatching_degree_one: For E=F and σ=1 choose f=φ; ordinary and twisted orbital integrals agree.
TauCeti.GL2Blueprint.cyclicMatching_quadratic_satake: At an unramified quadratic place the pair (2,3) maps to (4,9), trace 13 and determinant 36.
TauCeti.GL2Blueprint.cyclicMatching_non_norm_test: For E/F unramified quadratic, a regular γ with odd valuation of det γ cannot be a norm and its matching ordinary orbital integral is zero.
-/
lemma cyclicMatching_central {ZE ZF : Type*} [Group ZE] [Group ZF]
    (norm : ZE →* ZF) (ω : ZF →* ℂˣ) (z : ZE) :
    (ω.comp norm) z = ω (norm z) := by sorry
-- TauCeti.GL2Blueprint.cyclicMatching_quadratic_satake
example : ((2 : ℂ) ^ 2 + 3 ^ 2 = 13) ∧ ((2 : ℂ) ^ 2 * 3 ^ 2 = 36) := by sorry
/-
Explicit signature omissions (PROTOCOL §13; REV-FIX-RT-AREA-automorphic-1~4).
The AS.2/AS.4/AS.6 and ET.4 trace distributions of a matched factorizable test function and its operators on Borel inductions are absent, so arbitrary complex scalars or endomorphisms cannot satisfy these identities.
These source targets require the actual supplier objects and hypotheses below.
They are not universal theorems about arbitrary types, functions, or multiplicity maps.
Omitted declaration names: TauCeti.GL2Blueprint.spectralLedger, TauCeti.GL2Blueprint.strongCuspidalVanishing, TauCeti.GL2Blueprint.specializedTraceComparison.

GL2AutomorphicRepresentationsAndTransfer:R17.2/continuous-residual-ledger
TauCeti.GL2Blueprint.spectralLedger
In the fixed-unitary-central-character GL₂ L² spectrum, identify AS.2, AS.4 and AS.6’s cuspidal terms, residual determinant characters χdet with χ²=ω, and continuous families of normalized inductions I(μ,ωμ⁻¹). The invariant trace formula includes the continuous integrals of normalized intertwining operators and their logarithmic derivatives, together with the residual/exceptional contributions prescribed by AS.6. On the anisotropic quaternion side identify norm characters χNrd and the non-norm cuspidal/discrete spectrum. For steinbergProjectorDifference, a matching χdet has trace −1; hence compare its residual term against the quaternion norm-character term rather than declaring both absent. In a cyclic quadratic comparison retain the σ-invariant induced families and their exceptional automorphic-induction terms, including the one-half Weyl weights, until the ET.4/AS.6 identities identify them. Local regular-elliptic matching alone does not remove the identity or continuous distributions.
Hypotheses: Use the same global Haar, central quotient and normalized intertwining conventions throughout; generic spectral carriers belong to AS.2, AS.4 and AS.6.

GL2AutomorphicRepresentationsAndTransfer:R17.2/strong-cuspidal-vanishing
TauCeti.GL2Blueprint.strongCuspidalVanishing
If a finite local factor f_v satisfies ∫_{N(Fv)}f_v(xny)dn=0 for every x,y∈GL₂(Fv), then its operator on every representation parabolically induced from the proper Borel is zero. Consequently the induced continuous terms and their intertwining-derivative contributions vanish for the factorizable global test function; the same operator identity kills any residual determinant character arising as a subquotient of such an induction. A supercuspidal matrix coefficient compact modulo center supplies this condition. The K-averaged constant-term identity printed for the Steinberg projector is weaker and is not substituted for this all-x,y condition.
Hypotheses: Compact-mod-center smooth test function, suitable integrability and fixed unitary central character; strong cuspidal constant-term condition for all x,y.

GL2AutomorphicRepresentationsAndTransfer:R17.2/specialized-trace-comparison
TauCeti.GL2Blueprint.specializedTraceComparison
For factorizable test functions with the local matching, central-character and Haar conventions above, specialize AS.6’s invariant trace identities to GL₂/quaternion and GL₂ cyclic base change. Every regular geometric term matches with the stated sign/norm, and the identity, singular/unipotent, residual and continuous terms are compared using the full spectralLedger. Under the all-x,y local cuspidality hypothesis use strongCuspidalVanishing for precisely the indicated terms; in the Steinberg/norm-character case retain the residual correction and match its norm-character contribution. The resulting equality of distributions is the prerequisite exported to R17.3 and R17.4. Its proof requires the complete AS.6/ET.4 singular and intertwining-term comparison; the sketch in JL §16 is not accepted as that verification.
Hypotheses: Supplier invariant trace formula and local transfer valid for the stated test-function space; compatible measures, central characters, cyclic generator and full spectral-term comparisons.
-/
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

/-
Archimedean classification imports the exact current AF.1/weil-group-real,
AF.1/gl2-real-discrete-series, AF.1/archimedean-llc-gln and
AF.1/casselman-wallach-globalization nodes. The factor comparison uses
AF.1/archimedean-llc-gln and AL.1's gamma/additive-character conventions.
AF.1b remains a proposed stage split; these exact node imports do not close
AF's original classification proofs or missing native signature interfaces.
-/
