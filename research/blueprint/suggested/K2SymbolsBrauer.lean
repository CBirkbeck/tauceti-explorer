/-
This file is not the roadmap and is not exhaustive. The roadmap document
research/blueprint/readmes/K2SymbolsBrauer.md is definitive. These statements only
suggest Lean forms so that contributors and reviewers converge on names and
signatures. Every packet node remains unchecked; sorry is a proof obligation.

Baseline: Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.

Finite Steinberg.Gen n R and stable Steinberg.StableGen R are distinct index
types. StableSteinberg is a union presentation; its agreement with the finite
colimit and the imported elementary group must be proved. K2 is the kernel of
the faithful elementary action, not the kernel of a map onto all permutations.
The Milnor quotient models the carrier used by both parts. Quillen, plus-space,
relative homotopy-fibre and twice-twisted cohomological carriers are imported
contracts; interfaces that cannot yet be stated are explicit comments.

Conventions: [a,b]=aba⁻¹b⁻¹; classical K2 multiplicative, Milnor groups additive.
The roadmap tame symbol is inverse to K-book III.6.3. Higher residues put the
uniformizer last (Π on the right), so ∂Wb=(-1)^(n-1)∂. Norms use -∂∞=Σ Np∂p.
The K-book right-module Quillen boundary in degree two is inverse to this tame
symbol. Arithmetic-Frobenius Artin on the first input gives Hilbert exponent -1
against the ordered Kummer cup invariant, and the imported étale c₂,₂ is -h.
Use the reader for the complete hypotheses, APIs, tests and source gaps.
-/
import Mathlib.Algebra.BigOperators.Group.Finset.Basic
import Mathlib.Algebra.BigOperators.Group.List.Basic
import Mathlib.Algebra.DirectSum.Basic
import Mathlib.Algebra.DualNumber
import Mathlib.Algebra.Field.ZMod
import Mathlib.Algebra.Group.Commutator
import Mathlib.Algebra.Homology.ConcreteCategory
import Mathlib.Algebra.Homology.HomologicalComplexKernels
import Mathlib.Algebra.Homology.HomologySequenceLemmas
import Mathlib.Algebra.Module.CharacterModule
import Mathlib.Algebra.Module.Presentation.Basic
import Mathlib.Algebra.Ring.Units
import Mathlib.Algebra.TrivSqZeroExt.Ideal
import Mathlib.Analysis.Complex.Basic
import Mathlib.Data.Finsupp.Basic
import Mathlib.FieldTheory.IntermediateField.Adjoin.Basic
import Mathlib.FieldTheory.IsAlgClosed.AlgebraicClosure
import Mathlib.FieldTheory.Normal.Defs
import Mathlib.GroupTheory.Commutator.Basic
import Mathlib.GroupTheory.FreeAbelianGroup
import Mathlib.GroupTheory.FreeGroup.IsFreeGroup
import Mathlib.GroupTheory.IsPerfect
import Mathlib.GroupTheory.PresentedGroup
import Mathlib.GroupTheory.Subgroup.Center
import Mathlib.LinearAlgebra.Matrix.Notation
import Mathlib.LinearAlgebra.PiTensorProduct.Basic
import Mathlib.LinearAlgebra.Quotient.Basic
import Mathlib.NumberTheory.Cyclotomic.PrimitiveRoots
import Mathlib.NumberTheory.LocalField.Basic
import Mathlib.NumberTheory.NumberField.Basic
import Mathlib.NumberTheory.NumberField.InfinitePlace.Basic
import Mathlib.NumberTheory.Padics.HeightOneSpectrum
import Mathlib.NumberTheory.Padics.LocalField
import Mathlib.NumberTheory.Padics.PadicNumbers
import Mathlib.RepresentationTheory.Homological.GroupHomology.Functoriality
import Mathlib.RingTheory.DedekindDomain.AdicValuation
import Mathlib.RingTheory.DedekindDomain.SInteger
import Mathlib.RingTheory.DiscreteValuationRing.Basic
import Mathlib.RingTheory.Jacobson.Ideal
import Mathlib.RingTheory.Kaehler.Basic
import Mathlib.RingTheory.LocalRing.ResidueField.Basic
import Mathlib.RingTheory.Norm.Defs
import Mathlib.RingTheory.RootsOfUnity.EnoughRootsOfUnity
import Mathlib.RingTheory.Valuation.ValuationSubring
import TauCeti.FieldTheory.FunctionField.Divisor.Eval
import TauCeti.FieldTheory.FunctionField.Divisor.Principal
import TauCeti.FieldTheory.FunctionField.Place.RatFunc.Basic
import TauCeti.FieldTheory.FunctionField.Place.Residue
import TauCeti.FieldTheory.GaloisCohomology.Kummer
import TauCeti.RepresentationTheory.Homological.ContCohomology.Cup.Product
import TauCeti.RingTheory.DedekindDomain.AdicValuation.ValuativeRel
import TauCeti.RingTheory.Valuation.Discrete.Order

noncomputable section
universe u v w
open scoped TensorProduct commutatorElement WithZero Polynomial IntermediateField DirectSum

/-! ## Finite Steinberg groups and universal central extensions (T.1) -/
namespace TauCeti.Steinberg

/-- Indices and the ring parameter of a Steinberg generator. -/
structure Gen (n : ℕ) (R : Type u) where
  i : Fin n
  j : Fin n
  hij : i ≠ j
  val : R

/-- Intended relators: additivity, nonchaining commutators, forward chaining
coefficient r*s, and reverse chaining coefficient -(s*r). Opposite-root
commutators are deliberately not prescribed. -/
def relations (n : ℕ) (R : Type u) [Ring R] : Set (FreeGroup (Gen n R)) := by
  sorry

set_option linter.dupNamespace false in
/-- Finite-rank presentation, with the source's n >= 3 convention. -/
abbrev Steinberg (n : ℕ) (_hn : 3 ≤ n) (R : Type u) [Ring R] : Type u :=
  PresentedGroup (relations n R)

variable {R : Type u} [Ring R] {n : ℕ}

def x (hn : 3 ≤ n) {i j : Fin n} (hij : i ≠ j) (r : R) : Steinberg n hn R := by
  sorry

@[simp] theorem x_zero (hn : 3 ≤ n) {i j : Fin n} (hij : i ≠ j) :
    x (R := R) hn hij 0 = 1 := by
  sorry

@[simp] theorem x_inv (hn : 3 ≤ n) {i j : Fin n} (hij : i ≠ j) (r : R) :
    (x hn hij r)⁻¹ = x hn hij (-r) := by
  sorry

theorem x_add (hn : 3 ≤ n) {i j : Fin n} (hij : i ≠ j) (r s : R) :
    x hn hij r * x hn hij s = x hn hij (r + s) := by
  sorry

theorem commutator_nonchaining (hn : 3 ≤ n) {i j k l : Fin n}
    (hij : i ≠ j) (hkl : k ≠ l) (hjk : j ≠ k) (hil : i ≠ l) (r s : R) :
    ⁅x hn hij r, x hn hkl s⁆ = 1 := by
  sorry

theorem commutator_forward (hn : 3 ≤ n) {i j k : Fin n}
    (hij : i ≠ j) (hjk : j ≠ k) (hik : i ≠ k) (r s : R) :
    ⁅x hn hij r, x hn hjk s⁆ = x hn hik (r * s) := by
  sorry

theorem commutator_reverse (hn : 3 ≤ n) {i j k : Fin n}
    (hij : i ≠ j) (hki : k ≠ i) (hkj : k ≠ j) (r s : R) :
    ⁅x hn hij r, x hn hki s⁆ = x hn hkj (-(s * r)) := by
  sorry

/-- Keep both word indices, including the reversed indices in the middle factor. -/
def w (hn : 3 ≤ n) {i j : Fin n} (hij : i ≠ j) (r : Rˣ) : Steinberg n hn R :=
  x hn hij (r : R) * x hn hij.symm (-((r⁻¹ : Rˣ) : R)) * x hn hij (r : R)

def h (hn : 3 ≤ n) {i j : Fin n} (hij : i ≠ j) (r : Rˣ) : Steinberg n hn R :=
  w hn hij r * w hn hij (-1 : Rˣ)

/-- Finite perfectness follows by choosing a third index for each generator. -/
theorem finite_isPerfect (hn : 3 ≤ n) : Group.IsPerfect (Steinberg n hn R) := by
  sorry

/-
Finite/stable elementary-group interfaces imported from U.1:

KTheoryLowDegrees U.1 supplies Elementary n R and StableElementary R as the
actual elementary subgroups of finite/stable GL, including general-ring matrix
units, rank embeddings and Whitehead block factorization. General-ring bridges
and a group colimit are gaps in the packet.

  toElementary (hn : 3 ≤ n) : Steinberg n hn R →* Elementary n R
  toElementary_x : toElementary hn (x hn hij r) = elementary hij r
  toElementary_surjective : Function.Surjective (toElementary hn)
  stabilise : Steinberg n hn R →* Steinberg (n+1) (...) R
  stableLift : (compatible finite-stage homomorphisms) → (StableSteinberg R →* G)
  phi : StableSteinberg R →* StableElementary R
  K2 R := (phi (R := R)).ker
  K2_eq_center : K2 R = Subgroup.center (StableSteinberg R)
  stable_isPerfect : Group.IsPerfect (StableSteinberg R)

For phi, surjectivity and centrality are mathematical assertions to prove.
Its codomain is E(R), not St(R). Classical K2 is not assumed trivial.
The longer exact sequence uses the imported U.2 quotient GL(R)/E(R).
-/

section CentralExtensions
variable {X G Y : Type u} [Group X] [Group G] [Group Y]

/-- Kernel centrality. Surjectivity is a separate part of an extension. -/
def IsCentral (p : X →* G) : Prop := p.ker ≤ Subgroup.center X

/-- Maps over G retain the actual projection square. -/
structure HomOver (p : X →* G) (q : Y →* G) where
  hom : X →* Y
  over : q.comp hom = p

/-- Universality in the chosen common universe of central extensions over G.
The quantified target need not have the same marked kernel as p. -/
def IsUniversalCentralExtension (p : X →* G) : Prop :=
  Function.Surjective p ∧ IsCentral p ∧
    ∀ (Y : Type u) [Group Y] (q : Y →* G),
      Function.Surjective q → IsCentral q → ∃! f : X →* Y, q.comp f = p

theorem uce_isPerfect {p : X →* G} (hp : IsUniversalCentralExtension p) :
    Group.IsPerfect X ∧ Group.IsPerfect G := by
  sorry

theorem perfect_source_rigidity {p : X →* G} {q : Y →* G}
    (hX : Group.IsPerfect X) (hq : IsCentral q)
    (f g : X →* Y) (hf : q.comp f = p) (hg : q.comp g = p) : f = g := by
  sorry

/-- A generic instance of the star construction with actual central/surjective
projection data; its inputs are in the quotient elementary group when applied
to phi. It is not defined on arbitrary general-linear matrices. -/
def centralStar (p : X →* G) (hp : Function.Surjective p) (hc : IsCentral p)
    (A B : G) (hAB : Commute A B) : p.ker := by
  sorry

theorem centralStar_self (p : X →* G) (hp : Function.Surjective p)
    (hc : IsCentral p) (A : G) : centralStar p hp hc A A (Commute.refl A) = 1 := by
  sorry

/-
Remaining central-extension signatures require the owners' coefficient/quotient
models, rather than an invented carrier:

  relationProjection : F/[S,F] →* F/S
  commutatorProjection : [F,F]/[S,F] →* [G,G]
  hopf : H2(trivial integral representation of G) ≃+
         Additive ((S ∩ [F,F])/[S,F])
  -- T.1:classical/hopf-extension-perfect
  hopfExtension_isPerfect [Group.IsPerfect G] (hπ : surjective π) :
    Group.IsPerfect ([F,F]/[ker π,F])
  -- T.1:classical/perfect-uce-exists (the Hopf model; the bare existence
  -- statement is `exists_isUniversalCentralExtension` below)
  commutatorProjection_isUniversal [Group.IsPerfect G] (π : FreeGroup S →* G)
    (hπ : surjective π) : IsUniversalCentralExtension (commutatorProjection π)
  -- T.1:classical/hopf-four-term-sequence (F free, N normal, G = F/N)
  hopfFourTerm : an injection H2(G) →+ N/[F,N] whose range is the kernel of
    N/[F,N] → F_ab, with F_ab → G_ab surjective and exact at F_ab
    (the last two are groupHomology.H1CoresCoinfOfTrivial_exact / _g_epi)
  -- T.1:classical/hopf-formula-natural
  hopf_naturality (φ : F →* F') (hφ : π'.comp φ = f.comp π) :
    hopf' ∘ (map of Hopf quotients induced by φ) = intHomologyMap f 2 ∘ hopf
  finite_split (hn : 5 ≤ n) (q : Y →* Steinberg n (...) R)
    (hq_surj) (hq_central) : ∃ s, q.comp s = MonoidHom.id _
  finite_kernel_central (injective on finite kernel under stabilization) :
    IsCentral (toElementary hn)

No finite-rank centrality conclusion follows from finite_split alone.
The full classification uses H2 COHOMOLOGY with trivial action on a fixed
abelian kernel, whereas hopf uses H2 HOMOLOGY with integral coefficients.
-/
end CentralExtensions

/-! ### Pullbacks, composites and lifts (T.1:classical) -/

section UniversalCentralExtensions
variable {X G Y : Type u} [Group X] [Group G] [Group Y]

namespace CentralExtension

variable {H : Type u} [Group H]

/-- T.1:classical/central-extension-pullback: `H ×_G Y` as a subgroup of `H × Y`. -/
def pullback (q : Y →* G) (f : H →* G) : Subgroup (H × Y) :=
  (f.comp (MonoidHom.fst H Y)).eqLocus (q.comp (MonoidHom.snd H Y))

/-- The first projection `H ×_G Y → H`. -/
def pullbackFst (q : Y →* G) (f : H →* G) : pullback q f →* H :=
  (MonoidHom.fst H Y).comp (pullback q f).subtype

/-- The second projection `H ×_G Y → Y`. -/
def pullbackSnd (q : Y →* G) (f : H →* G) : pullback q f →* Y :=
  (MonoidHom.snd H Y).comp (pullback q f).subtype

theorem pullbackFst_surjective (q : Y →* G) (f : H →* G) (hq : Function.Surjective q) :
    Function.Surjective (pullbackFst q f) := by
  sorry

theorem pullbackFst_isCentral (q : Y →* G) (f : H →* G) (hq : IsCentral q) :
    IsCentral (pullbackFst q f) := by
  sorry

theorem comp_pullbackSnd (q : Y →* G) (f : H →* G) :
    q.comp (pullbackSnd q f) = f.comp (pullbackFst q f) := by
  sorry

/-- The factorisation of a commuting pair through the pullback. -/
def pullbackLift (q : Y →* G) (f : H →* G) (a : X →* H) (b : X →* Y)
    (h : f.comp a = q.comp b) : X →* pullback q f := by
  sorry

/-- The kernel of the first projection is the kernel of `q`. -/
def pullbackKerEquiv (q : Y →* G) (f : H →* G) : (pullbackFst q f).ker ≃* q.ker := by
  sorry

/-- Along the identity the pullback is `Y` again. -/
def pullbackId (q : Y →* G) : pullback q (MonoidHom.id G) ≃* Y := by
  sorry

end CentralExtension

/-- T.1:classical/central-extension-comp (Ex. III.5.7 with the perfectness
hypothesis the printed exercise omits). -/
theorem isCentral_comp_of_isPerfect (ρ : Y →* X) (π : X →* G) (hρ : Function.Surjective ρ)
    (hπ : Function.Surjective π) (hρc : IsCentral ρ) (hπc : IsCentral π) [Group.IsPerfect X] :
    Function.Surjective (π.comp ρ) ∧ IsCentral (π.comp ρ) := by
  sorry

/-- T.1:classical/uce-extensions-split. -/
theorem IsUniversalCentralExtension.exists_section {p : X →* G}
    (hp : IsUniversalCentralExtension p) (ρ : Y →* X) (hρ : Function.Surjective ρ)
    (hρc : IsCentral ρ) : ∃ s : X →* Y, ρ.comp s = MonoidHom.id X := by
  sorry

/-- T.1:classical/split-central-extension-universal: Recognition (2) ⇒ (1). -/
theorem isUniversalCentralExtension_of_forall_split {p : X →* G}
    (hp : Function.Surjective p) (hpc : IsCentral p) [Group.IsPerfect X]
    (hsplit : ∀ (Y : Type u) [Group Y] (ρ : Y →* X), Function.Surjective ρ → IsCentral ρ →
      ∃ s : X →* Y, ρ.comp s = MonoidHom.id X) :
    IsUniversalCentralExtension p := by
  sorry

/-- T.1:classical/perfect-uce-exists, bare form. -/
theorem exists_isUniversalCentralExtension [Group.IsPerfect G] :
    ∃ (X : Type u) (_ : Group X) (p : X →* G), IsUniversalCentralExtension p := by
  sorry

namespace IsUniversalCentralExtension

variable {X' G' : Type u} [Group X'] [Group G'] {p : X →* G} {p' : X' →* G'}

/-- T.1:classical/uce-lift: the lift of `f : G →* G'` to universal central extensions. -/
def lift (hp : IsUniversalCentralExtension p) (hp' : IsUniversalCentralExtension p')
    (f : G →* G') : X →* X' := by
  sorry

theorem proj_comp_lift (hp : IsUniversalCentralExtension p)
    (hp' : IsUniversalCentralExtension p') (f : G →* G') :
    p'.comp (lift hp hp' f) = f.comp p := by
  sorry

theorem lift_unique (hp : IsUniversalCentralExtension p)
    (hp' : IsUniversalCentralExtension p') (f : G →* G') (h : X →* X')
    (hh : p'.comp h = f.comp p) : h = lift hp hp' f := by
  sorry

theorem lift_id (hp : IsUniversalCentralExtension p) :
    lift hp hp (MonoidHom.id G) = MonoidHom.id X := by
  sorry

theorem lift_comp {X'' G'' : Type u} [Group X''] [Group G''] {p'' : X'' →* G''}
    (hp : IsUniversalCentralExtension p) (hp' : IsUniversalCentralExtension p')
    (hp'' : IsUniversalCentralExtension p'') (f : G →* G') (g : G' →* G'') :
    lift hp hp'' (g.comp f) = (lift hp' hp'' g).comp (lift hp hp' f) := by
  sorry

/-- The lift restricted to kernels. -/
def kerMap (hp : IsUniversalCentralExtension p) (hp' : IsUniversalCentralExtension p')
    (f : G →* G') : p.ker →* p'.ker := by
  sorry

/-- Test `lift_trivial_hom`. -/
example (hp : IsUniversalCentralExtension p) (hp' : IsUniversalCentralExtension p') :
    lift hp hp' (1 : G →* G') = 1 := by
  sorry

end IsUniversalCentralExtension

end UniversalCentralExtensions

/-! ### Superperfect groups and the Recognition Theorem (T.1:classical)

Mathlib's integral group homology `groupHomology (Rep.trivial ℤ G ℤ) n` fixes the
group in the universe of `ℤ`, so this section works with `G : Type`. -/

section Recognition

open CategoryTheory

/-- `H_n(G, ℤ)` with trivial coefficients. -/
abbrev intHomology (G : Type) [Group G] (n : ℕ) : ModuleCat ℤ :=
  groupHomology (Rep.trivial ℤ G ℤ) n

/-- `H_n(f; ℤ)`, the map of integral homology induced by a homomorphism. -/
abbrev intHomologyMap {G H : Type} [Group G] [Group H] (f : G →* H) (n : ℕ) :
    intHomology G n →+ intHomology H n :=
  (groupHomology.map (A := Rep.trivial ℤ G ℤ) (B := Rep.trivial ℤ H ℤ) f (𝟙 _) n).hom.toAddMonoidHom

/-- T.1:classical/h1-trivial-perfect: `H₁(G, ℤ) ≅ Gᵃᵇ`, from
`groupHomology.H1AddEquivOfIsTrivial` and `TensorProduct.rid`. -/
def h1EquivAbelianization (G : Type) [Group G] :
    intHomology G 1 ≃+ Additive (Abelianization G) := by
  sorry

theorem subsingleton_h1_iff_isPerfect (G : Type) [Group G] :
    Subsingleton (intHomology G 1) ↔ Group.IsPerfect G := by
  sorry

/-- T.1:classical/superperfect: `H₁(G, ℤ) = H₂(G, ℤ) = 0`. -/
def Group.IsSuperperfect (G : Type) [Group G] : Prop :=
  Subsingleton (intHomology G 1) ∧ Subsingleton (intHomology G 2)

theorem Group.isSuperperfect_iff (G : Type) [Group G] :
    Group.IsSuperperfect G ↔ Group.IsPerfect G ∧ Subsingleton (intHomology G 2) := by
  sorry

theorem Group.IsSuperperfect.isPerfect {G : Type} [Group G] (h : Group.IsSuperperfect G) :
    Group.IsPerfect G := by
  sorry

theorem Group.IsSuperperfect.of_mulEquiv {G H : Type} [Group G] [Group H] (e : G ≃* H)
    (h : Group.IsSuperperfect G) : Group.IsSuperperfect H := by
  sorry

theorem Group.IsSuperperfect.of_subsingleton (G : Type) [Group G] [Subsingleton G] :
    Group.IsSuperperfect G := by
  sorry

/-- Test `isSuperperfect_trivial`. -/
example : Group.IsSuperperfect Unit := by
  sorry

/-- Test `not_isSuperperfect_free`: `H₂` of a free group vanishes, `H₁` does not. -/
example : ¬ Group.IsSuperperfect (FreeGroup Unit) := by
  sorry

/-- Test `isSuperperfect_iff_perfect`. -/
example (G : Type) [Group G] :
    Group.IsSuperperfect G ↔ Group.IsPerfect G ∧ Subsingleton (intHomology G 2) :=
  Group.isSuperperfect_iff G

/-- T.1:classical/free-group-higher-homology. -/
theorem subsingleton_intHomology_of_isFreeGroup (F : Type) [Group F] [IsFreeGroup F]
    (k : ℕ) (hk : 2 ≤ k) : Subsingleton (intHomology F k) := by
  sorry

/-- T.1:classical/split-extensions-kill-h2: if every central extension of `G` by
`ℚ/ℤ` splits then `H₂(G, ℤ) = 0`. -/
theorem schurMultiplier_eq_zero_of_split (G : Type) [Group G]
    (h : ∀ (E : Type) [Group E] (i : Multiplicative (AddCircle (1 : ℚ)) →* E)
      (π : E →* G), Function.Injective i → Function.Surjective π → i.range = π.ker →
        i.range ≤ Subgroup.center E → ∃ s : G →* E, π.comp s = MonoidHom.id G) :
    Subsingleton (intHomology G 2) := by
  sorry

variable {X G : Type} [Group X] [Group G]

/-- T.1:classical/uce-source-superperfect: Recognition (1) ⇒ (3). -/
theorem IsUniversalCentralExtension.isSuperperfect {p : X →* G}
    (hp : IsUniversalCentralExtension p) : Group.IsSuperperfect X := by
  sorry

/-- T.1:classical/superperfect-extensions-split: Recognition (3) ⇒ (2), through the
universality of the identity. -/
theorem Group.IsSuperperfect.isUniversalCentralExtension_id (hX : Group.IsSuperperfect X) :
    IsUniversalCentralExtension (MonoidHom.id X) := by
  sorry

/-- T.1/recognition-theorem (K-book III.5.4), for a central extension of a perfect group. -/
theorem recognition {p : X →* G} [Group.IsPerfect G] (hp : Function.Surjective p)
    (hpc : IsCentral p) :
    (IsUniversalCentralExtension p ↔ Group.IsSuperperfect X) ∧
      (IsUniversalCentralExtension p ↔ (Group.IsPerfect X ∧
        ∀ (Y : Type) [Group Y] (ρ : Y →* X), Function.Surjective ρ → IsCentral ρ →
          ∃ s : X →* Y, ρ.comp s = MonoidHom.id X)) := by
  sorry

/-- T.1:classical/uce-kernel-h2: the kernel of a universal central extension of a
perfect group is `H₂(G, ℤ)`. -/
def uceKernelEquivH2 {p : X →* G} [Group.IsPerfect G] (hp : IsUniversalCentralExtension p) :
    Additive p.ker ≃+ intHomology G 2 := by
  sorry

/-- T.1:classical/uce-kernel-h2-natural. -/
theorem uceKernelEquivH2_naturality {X' G' : Type} [Group X'] [Group G'] {p : X →* G}
    {p' : X' →* G'} [Group.IsPerfect G] [Group.IsPerfect G']
    (hp : IsUniversalCentralExtension p) (hp' : IsUniversalCentralExtension p') (f : G →* G')
    (x : p.ker) :
    uceKernelEquivH2 hp' (Additive.ofMul (IsUniversalCentralExtension.kerMap hp hp' f x)) =
      intHomologyMap f 2 (uceKernelEquivH2 hp (Additive.ofMul x)) := by
  sorry

end Recognition

/-
Tests of the recognition package kept as statements (their carriers need concrete
finite groups or the Steinberg owner interfaces):
* pullback_id: y ↦ (q y, y) is an isomorphism Y ≃* pullback q id over G (pullbackId).
* pullback_trivial_subgroup: for C4 → C2 and the inclusion of the trivial group,
  the pullback is C2 → 1.
* pullback_split: the pullback of A × G → G along f is A × H → H.
* pullback_noncentral: for the sign map S3 → C2 and f = id the kernel A3 of the
  first projection is not central.
* not_isSuperperfect_cyclic: H1(Z/2, Z) ≅ Z/2.
* not_isSuperperfect_alternating: A5 is perfect with H2(A5, Z) ≅ Z/2.
* lift_id_self: lift hp hp (MonoidHom.id G) = MonoidHom.id X (lift_id).
* lift_steinberg: the lift of E(φ) along the Steinberg extensions sends x_ij(r)
  to x_ij(φ r).
* lift_not_unique_nonuniversal: id : C2 → C2 has two lifts to C2 × C2 → C2.
-/

/-
Stable comparison interfaces (require the imported elementary group and plus-space maps):

  steinberg_isUniversal : IsUniversalCentralExtension (phi (R := R))
  k2EquivH2 : Additive (K2 R) ≃+
    (groupHomology.H2 (trivial integral representation of StableElementary R))
  k2EquivPi2 : Additive (K2 R) ≃+
    HomotopyGroup (Fin 2) (BGLPlus R) (zeroBasepoint R)

The cover BE(R)+ -> BGL(R)+ and its chosen natural Hurewicz map are needed;
IV.1.7.1/Exercise IV.1.8 are the K2 locators, not the K3 exercise/corollary.

Symbol interfaces over arbitrary associative unital R:

  commutingSymbol (r s : Rˣ) (hrs : Commute r s) : K2 R
  symbol_eq_commutator : symbol r s hrs = [h_ij(r),h_ik(s)]
  symbol_mul_left (r1 r2 s pairwise commuting) :
    symbol (r1*r2) s = symbol r1 s * symbol r2 s
  symbol_one_sub (r s : Rˣ) (hs : (s : R)=1-(r : R)) : symbol r s = 1
  symbol_negative (r : Rˣ) : symbol r (-r) = 1
  symbol_self : symbol r r = symbol r (-1)

The negative-unit identity is specialized FROM the universal Laurent ring;
no injection of arbitrary-ring K2 into a localization is assumed.

Milnor/Quillen interface checklist. The concrete milnorK carrier and some
operations occur below; QuillenK and its product still require their supplier.
The spelling MilnorK in this checklist denotes TauCeti.MilnorK.milnorK:

  milnorSymbol (F : Type u) [Field F] (n : ℕ) (a : Fin n → Fˣ) : milnorK F n
  milnorSymbol_product : concatenate symbols = their graded product
  milnorLift : a degree-one unit map killing Steinberg products extends uniquely
  matsumoto : milnorK F 2 ≃+ Additive (K2 F)
  finite_field_K2 [Finite F] : Subsingleton (K2 F)
  rational_restriction : Function.Injective (K2.map (F →+* F(t)))
  extension_kernel_torsion : every element of ker(K2.map(F→L)) has finite order
  milnor_permutation : symbol (a ∘ permutation) = sign • symbol a
  milnor_finite [Finite F] (hn : 2 ≤ n) : Subsingleton (milnorK F n)
  milnor_algclosed [IsAlgClosed F] (hn : 2 ≤ n) : uniquely divisible (milnorK F n)
  milnor_real (hn : 1 ≤ n) : MilnorK ℝ n ≃+ (Z/2 plus a divisible subgroup)
  milnor_number_field (hn : 3 ≤ n) : milnorK F n ≃+ (Z/2)^(real places)
  milnor_global_positive_char (hn : 3 ≤ n) : Subsingleton (milnorK F n)
  milnorToQuillen n : milnorK F n →+ QuillenK F n
  milnorToQuillen_symbol : the image is the ordered product of unit classes
  milnorToQuillen_degree_two : Function.Bijective (milnorToQuillen 2)
  milnorToQuillen_degree_three : milnorK F 3 →+ QuillenK F 3

K.7 supplies the products and comparison with classical degree-two symbols;
V.2 consumes the integral degree-three component, proves its injectivity and
constructs its cokernel. V.2 is not a prerequisite for constructing that map.
-/

/-! Representative tests in addition to the packet's full object-level tests. -/
example (r s : R) :
    ⁅x (n := 3) le_rfl (i := 0) (j := 1) (by decide) r,
      x (n := 3) le_rfl (i := 1) (j := 2) (by decide) s⁆ =
      x (n := 3) le_rfl (i := 0) (j := 2) (by decide) (r*s) := by
  sorry

example (r s : R) :
    ⁅x (n := 3) le_rfl (i := 0) (j := 1) (by decide) r,
      x (n := 3) le_rfl (i := 2) (j := 0) (by decide) s⁆ =
      x (n := 3) le_rfl (i := 2) (j := 1) (by decide) (-(s*r)) := by
  sorry

example : x (R := ℤ) (n := 3) le_rfl (i := 0) (j := 1) (by decide) 0 = 1 := by
  sorry

/-
Counterexample-sensitive tests for the packet contracts:
* R=M_2(Z), r=E12, s=E21 distinguishes reverse s*r from r*s.
* C4 -> C2 is central and nonsplit; C2 x C2 -> C2 is split.
* Killing b in Free(a,b)->Z leaves a nonzero RELATION kernel detected by b's
  exponent sum, though H2(Z;Z) is zero.
* The elementary pair e01(1),e12(1) is not a legal star input.
* h12(2) over Q has diagonal image (1,2,1/2), preserving both indices.
* K0^M(C)=Z and K1^M(C)=C× exclude unique divisibility in degrees 0 and 1.
* In C(t), {t,t}={t,-1} has residue -1 at t=0. The presence of i does not
  annihilate this integral repeated-entry symbol.
* Over Q, degree three is injective Z/2 -> Z/48 and fails surjectivity.
-/
end TauCeti.Steinberg

/-! ## Integral quotient-bar complexes and the low-degree sequence
These prototypes use the pinned bar complexes with trivial integral coefficients. -/
namespace TauCeti.Steinberg
open CategoryTheory CategoryTheory.Limits

namespace GroupQuotient
variable {E Q E' Q' : Type} [Group E] [Group Q] [Group E'] [Group Q']

abbrev integralBar (E : Type) [Group E] : ChainComplex (ModuleCat ℤ) ℕ :=
  groupHomology.inhomogeneousChains (Rep.trivial ℤ E ℤ)

abbrev barMap (q : E →* Q) : integralBar E ⟶ integralBar Q :=
  groupHomology.chainsMap (A := Rep.trivial ℤ E ℤ) (B := Rep.trivial ℤ Q ℤ) q (𝟙 _)

/-- T.1:classical/quotient-bar-kernel: categorical kernel of the actual map. -/
abbrev barKernel (q : E →* Q) : ChainComplex (ModuleCat ℤ) ℕ :=
  kernel (barMap q)

def barKernelShortComplex (q : E →* Q) :
    ShortComplex (ChainComplex (ModuleCat ℤ) ℕ) :=
  ShortComplex.mk (kernel.ι (barMap q)) (barMap q) (by simp)

theorem barKernelShortExact (q : E →* Q) (hq : Function.Surjective q) :
    (barKernelShortComplex q).ShortExact := by sorry

theorem barKernel_zero (q : E →* Q) : IsZero ((barKernel q).X 0) := by sorry

theorem barKernel_pairGenerators (q : E →* Q) (n : ℕ) :
    ((barMap q).f n).hom.ker =
      Submodule.span ℤ {v | ∃ a b : Fin n → E, q ∘ a = q ∘ b ∧
        v = Finsupp.single a (1 : ℤ) - Finsupp.single b 1} := by sorry

def barKernel_map (q : E →* Q) (q' : E' →* Q') (a : E →* E') (b : Q →* Q')
    (hsq : q'.comp a = b.comp q) : barKernel q ⟶ barKernel q' := by sorry

-- Test bar_kernel_identity
example : IsZero (barKernel (MonoidHom.id E)) := by sorry
-- Test bar_kernel_zero_degree
example (q : E →* Q) (hq : Function.Surjective q) :
    IsZero ((barKernel q).X 0) := by sorry
-- Test bar_kernel_tuple_difference
example (q : E →* Q) (n : ℕ) (a b : Fin n → E) :
    Finsupp.single a (1 : ℤ) - Finsupp.single b 1 ∈ ((barMap q).f n).hom.ker ↔
      q ∘ a = q ∘ b := by sorry
/- Test bar_kernel_nonsurjective: for the unique map 1→C₂, the degree-one
pushforward misses the basis element of the nonidentity of C₂. Its finite
group carrier is Multiplicative (ZMod 2), with the trivial source group. -/

/-- The mixed commutator subgroup inside ker(q), rather than [ker(q),ker(q)]. -/
def mixedCommutator (q : E →* Q) : Subgroup q.ker :=
  (⁅(⊤ : Subgroup E), q.ker⁆).subgroupOf q.ker

instance mixedCommutator_normal (q : E →* Q) : (mixedCommutator q).Normal := by sorry
abbrev mixedQuotient (q : E →* Q) := q.ker ⧸ mixedCommutator q
instance mixedQuotient_commGroup (q : E →* Q) : CommGroup (mixedQuotient q) := by sorry
abbrev mixedCoinvariants (q : E →* Q) := Additive (mixedQuotient q)

/-- T.1:classical/quotient-bar-kernel-h1. On [a]−[b] it is class(ab⁻¹). -/
def barKernelH1Equiv (q : E →* Q) :
    (barKernel q).homology 1 ≃+ mixedCoinvariants q := by sorry

/-- T.1:classical/hochschild-serre-integral-five-term. -/
def transgression (q : E →* Q) (hq : Function.Surjective q) :
    intHomology Q 2 →+ mixedCoinvariants q := by sorry

def mixedToAb (q : E →* Q) : mixedCoinvariants q →+ Additive (Abelianization E) := by sorry
def quotientAbMap (q : E →* Q) :
    Additive (Abelianization E) →+ Additive (Abelianization Q) := by sorry

theorem transgression_lift (q : E →* Q) (hq : Function.Surjective q)
    (z : (integralBar Q).X 2) (hz : (integralBar Q).d 2 1 z = 0)
    (lift : (integralBar E).X 2) (hlift : (barMap q).f 2 lift = z)
    (boundary : (barKernel q).X 1)
    (hboundary : (kernel.ι (barMap q)).f 1 boundary = (integralBar E).d 2 1 lift) :
    transgression q hq ((integralBar Q).homologyπ 2
      ((integralBar Q).cyclesMk z 1 (ChainComplex.next_nat_succ 1) hz)) =
      barKernelH1Equiv q ((barKernel q).homologyπ 1
        ((barKernel q).cyclesMk boundary 0 (ChainComplex.next_nat_succ 0) (by sorry))) := by sorry

theorem fiveTerm_exact (q : E →* Q) (hq : Function.Surjective q) :
    (intHomologyMap q 2).range = (transgression q hq).ker ∧
    (transgression q hq).range = (mixedToAb q).ker ∧
    (mixedToAb q).range = (quotientAbMap q).ker ∧
    Function.Surjective (quotientAbMap q) := by sorry

theorem fiveTerm_maps (q : E →* Q) (x : q.ker) :
    mixedToAb q (Additive.ofMul (QuotientGroup.mk' (mixedCommutator q) x)) =
      h1EquivAbelianization E
        (intHomologyMap q.ker.subtype 1
          ((h1EquivAbelianization q.ker).symm
            (Additive.ofMul (Abelianization.of x)))) := by sorry

-- Test five_term_identity
example (x : intHomology E 2) :
    transgression (MonoidHom.id E) (fun x => ⟨x, rfl⟩) x = 0 := by sorry
/- Test five_term_abelian_extension: C₄→C₂ has middle quotient C₂ whose
nonidentity class maps to 2 in C₄; quotientAbMap is reduction modulo 2.
Test five_term_noncentral: S₃→C₂ has middle quotient zero whereas N_ab=C₃.
These require the concrete finite-group identifications, not an arbitrary
type substituted for a group or an assumed isomorphism.
Test five_term_positive_sign: the example below uses +d(lift). -/
example (q : E →* Q) (hq : Function.Surjective q)
    (z : (integralBar Q).X 2) (hz : (integralBar Q).d 2 1 z = 0)
    (lift : (integralBar E).X 2) (hlift : (barMap q).f 2 lift = z)
    (boundary : (barKernel q).X 1)
    (hb : (kernel.ι (barMap q)).f 1 boundary = (integralBar E).d 2 1 lift) :
    transgression q hq ((integralBar Q).homologyπ 2
      ((integralBar Q).cyclesMk z 1 (ChainComplex.next_nat_succ 1) hz)) =
      barKernelH1Equiv q ((barKernel q).homologyπ 1
        ((barKernel q).cyclesMk boundary 0 (ChainComplex.next_nat_succ 0) (by sorry))) := by sorry

def mixedMap (q : E →* Q) (q' : E' →* Q') (a : E →* E') (b : Q →* Q')
    (hsq : q'.comp a = b.comp q) : mixedCoinvariants q →+ mixedCoinvariants q' := by sorry

/-- T.1:classical/hochschild-serre-five-term-natural: actual H₂(b;ℤ) square. -/
theorem transgression_natural (q : E →* Q) (q' : E' →* Q')
    (hq : Function.Surjective q) (hq' : Function.Surjective q')
    (a : E →* E') (b : Q →* Q') (hsq : q'.comp a = b.comp q)
    (x : intHomology Q 2) :
    mixedMap q q' a b hsq (transgression q hq x) =
      transgression q' hq' (intHomologyMap b 2 x) := by sorry

end GroupQuotient
end TauCeti.Steinberg

/- T.1 interface checklist. Some entries have concrete signatures above or below;
the remainder specify the full packet contract. In particular, Elementary,
StableElementary, the chosen quotient models and Quillen carriers still need
their suppliers before the corresponding signatures can be written.

Steinberg.hom_ext (API, extensionality; K2SymbolsBrauer:T.1/steinberg-group-finite-rank): Two homomorphisms agreeing on every generator are equal.
x_inverse (test, ; K2SymbolsBrauer:T.1/steinberg-group-finite-rank): x_01(r)^-1=x_01(-r).
forward_product (test, ; K2SymbolsBrauer:T.1/steinberg-group-finite-rank): [x_01(r),x_12(s)]=x_02(r*s).
reverse_product_order (test, ; K2SymbolsBrauer:T.1/steinberg-group-finite-rank): Over R=M_2(Z), [x_01(r),x_20(s)]=x_21(-(s*r)); choose noncommuting r=E12 and s=E21 to distinguish s*r from r*s.
disjoint (test, ; K2SymbolsBrauer:T.1/steinberg-group-finite-rank): [x_01(r),x_02(s)]=1; the opposite-root case x_01,x_10 is not assigned this relation.
StableSteinberg.phi_surjective (API, characterisation; K2SymbolsBrauer:T.1/stabilisation): That surjection is onto.
StableSteinberg.hom_ext (API, extensionality; K2SymbolsBrauer:T.1/stabilisation): Homomorphisms agreeing on every finite-stage generator are equal.
rank_three_generator (test, ; K2SymbolsBrauer:T.1/stabilisation): The rank-three generator x_01(2) maps to the stable generator with the same parameter.
relation_survives (test, ; K2SymbolsBrauer:T.1/stabilisation): The image of [x_01(r),x_12(s)] is x_02(r*s) after any common stabilization.
finite_word_lift (test, ; K2SymbolsBrauer:T.1/stabilisation): A stable elementary word represented at rank five is the image of the corresponding rank-five Steinberg word.
K2.subtype (API, coercion; K2SymbolsBrauer:T.1/k2-definition): Its inclusion into St(R).
K2.mem_iff (API, characterisation; K2SymbolsBrauer:T.1/k2-definition): An element lies in K_2(R) exactly when its image in E(R) is trivial.
K2.ext (API, extensionality; K2SymbolsBrauer:T.1/k2-definition): Kernel elements are equal exactly when their values in St(R) are equal.
zero_ring (test, ; K2SymbolsBrauer:T.1/k2-definition): K_2 of the zero ring is trivial.
integers (test, ; K2SymbolsBrauer:T.1/k2-definition): K_2(Z) is cyclic of order two.
not_by_definition_abelian (test, ; K2SymbolsBrauer:T.1/k2-definition): Abelianness is a theorem, not part of the definition: a definition that assumes it assumes Steinberg's theorem.
IsCentralExtension (API, characterisation; K2SymbolsBrauer:T.1/central-extension): The predicate that an extension is central.
CentralExtension.Equiv (API, structure; K2SymbolsBrauer:T.1/central-extension): Equivalence of two extensions of G by A.
CentralExtension.section_equiv (API, equivalence; K2SymbolsBrauer:T.1/central-extension): A homomorphic section gives an extension equivalence to A x G, with formula (a,g) -> inl(a)*section(g).
product_extension (test, ; K2SymbolsBrauer:T.1/central-extension): For A=C2 and G=C2, the product projection is central and split.
cyclic_nonsplit (test, ; K2SymbolsBrauer:T.1/central-extension): The quotient C4 -> C2 modulo two is central but has no homomorphic section.
marked_kernel (test, ; K2SymbolsBrauer:T.1/central-extension): For C9 -> C3 modulo three, kernel inclusions C3 -> C9 given by 1 -> 3 and 1 -> 6 give inequivalent extensions although both total groups are C9: a map over C3 has multiplier 1 mod 3, whereas preserving these marked kernels would require multiplier 2 mod 3.
uce_unique (API, characterisation; K2SymbolsBrauer:T.1/universal-central-extension): Uniqueness up to isomorphism over G.
uce_hom (API, constructor; K2SymbolsBrauer:T.1/universal-central-extension): The unique homomorphism to any central extension.
uce_hom_unique (API, characterisation; K2SymbolsBrauer:T.1/universal-central-extension): Its uniqueness.
UCE.equiv_over (API, equivalence; K2SymbolsBrauer:T.1/universal-central-extension): Two universal central extensions of G have a unique equivalence commuting with their projections.
trivial_uce (test, ; K2SymbolsBrauer:T.1/universal-central-extension): The identity extension of the trivial group is universal: its unique map to any group is over the trivial quotient.
cyclic_obstruction (test, ; K2SymbolsBrauer:T.1/universal-central-extension): The identity C2 -> C2 is not universal; it has two different lifts to C2 x C2 -> C2, given by the zero and identity first coordinates.
split_target (test, ; K2SymbolsBrauer:T.1/universal-central-extension): For a universal extension X -> G and abelian A, its map to A x G -> G is (1,p(x)); perfectness forces every map X -> A to be trivial.
starProduct (API, constructor; K2SymbolsBrauer:T.2/star-product): The star product of two commuting elements of E(R).
starProduct_lift_indep (API, characterisation; K2SymbolsBrauer:T.2/star-product): It does not depend on the chosen lifts.
starProduct_conj (API, relation; K2SymbolsBrauer:T.2/star-product): Invariance under simultaneous conjugation by an element of GL(R).
starProduct_skew (API, relation; K2SymbolsBrauer:T.2/star-product): Skew-symmetry.
starProduct_mul_left (API, relation; K2SymbolsBrauer:T.2/star-product): For A1,A2,B in E(R), if each Ai commutes with B then (A1*A2) star B=(A1 star B)*(A2 star B). No mutual commutation of A1 and A2 is required.
starProduct_mul_right (API, relation; K2SymbolsBrauer:T.2/star-product): For A commuting with B1 and B2 in E(R), A star (B1*B2)=(A star B1)*(A star B2).
forward_vs_star (test, ; K2SymbolsBrauer:T.2/star-product): Over Z in rank three, e_01(1) and e_12(1) do not commute; their lifted commutator maps to e_02(1), so it cannot be a K2-valued star input.
nontrivial_diagonal (test, ; K2SymbolsBrauer:T.2/star-product): Over Z, diag(-1,-1,1) star diag(-1,1,-1) is {-1,-1}, the nontrivial K2(Z) class once T.5 supplies that computation.
multiply_commuting_inputs (test, ; K2SymbolsBrauer:T.2/star-product): For A1,A2 each commuting with B, the product rule holds; omit either commutation proof and the construction is ill-typed.
steinbergSymbol (API, constructor; K2SymbolsBrauer:T.2/steinberg-symbol): The symbol of two commuting units.
steinbergSymbol_eq_commutator (API, characterisation; K2SymbolsBrauer:T.2/steinberg-symbol): It is the commutator of h_ij(r) and h_ik(s).
steinbergSymbol_one (API, simp; K2SymbolsBrauer:T.2/steinberg-symbol): The symbol with a one entry is trivial.
steinbergSymbol_mul_left (API, relation; K2SymbolsBrauer:T.2/steinberg-symbol): Bilinearity for a pairwise commuting triple r1,r2,s of units. Over a commutative ring the commuting hypotheses are automatic.
steinbergSymbol_skew (API, relation; K2SymbolsBrauer:T.2/steinberg-symbol): Skew-symmetry.
steinbergSymbol_index_indep (API, characterisation; K2SymbolsBrauer:T.2/steinberg-symbol): Independence of the chosen indices.
steinbergSymbol_map (API, functoriality; K2SymbolsBrauer:T.2/steinberg-symbol): Unital ring homomorphisms preserve the commuting-unit symbol and its indexed commutator formula.
one_entry (test, ; K2SymbolsBrauer:T.2/steinberg-symbol): The symbol with a one entry is trivial.
minus_one_integers (test, ; K2SymbolsBrauer:T.2/steinberg-symbol): For the integers the symbol of minus one with itself is the nontrivial element of K_2(Z).
bilinear (test, ; K2SymbolsBrauer:T.2/steinberg-symbol): The product rule holds for pairwise commuting units r1,r2,s; in a commutative field it has no extra condition.
not_alternating_integrally (test, ; K2SymbolsBrauer:T.2/steinberg-symbol): The symbol of a with itself is not trivial in general, which the next node computes.
milnorK (API, data; K2SymbolsBrauer:T.2/milnor-k-theory): The graded ring, and its degree-n part.
milnorK.symbol_mul (API, relation; K2SymbolsBrauer:T.2/milnor-k-theory): Multiplicativity in each entry.
milnorK.symbol_steinberg (API, relation; K2SymbolsBrauer:T.2/milnor-k-theory): Vanishing when two consecutive entries sum to one.
milnorK.hom_ext (API, extensionality; K2SymbolsBrauer:T.2/milnor-k-theory): Graded ring maps agreeing on degree-one units are equal, since products of these generate.
milnorK.map_id_comp (API, simp; K2SymbolsBrauer:T.2/milnor-k-theory): Field maps induce graded maps respecting identity and composition on every symbol.
milnorK.symbol_product (API, structure; K2SymbolsBrauer:T.2/milnor-k-theory): Concatenating two tuples gives the product of their symbols with degree addition.
degree_zero_one (test, ; K2SymbolsBrauer:T.2/milnor-k-theory): Degree zero is the integers and degree one is the unit group.
not_alternating_by_fiat (test, ; K2SymbolsBrauer:T.2/milnor-k-theory): The alternating property is a theorem, proved from skew-symmetry in degree two, not an axiom.
milnorToQuillen_one (API, simp; K2SymbolsBrauer:T.2/graded-map): Degree one is the identity on the unit group.
milnorToQuillen_two (API, characterisation; K2SymbolsBrauer:T.2/graded-map): Under product-symbol compatibility and Matsumoto, the component K2^M(F)->Quillen K2(F) is an isomorphism.
milnorToQuillen_map (API, functoriality; K2SymbolsBrauer:T.2/graded-map): Naturality in the field.
milnorToQuillen_graded (API, structure; K2SymbolsBrauer:T.2/graded-map): It is a map of graded rings.
milnorToQuillen_unique (API, extensionality; K2SymbolsBrauer:T.2/graded-map): A graded map with the same degree-one unit classes is equal by the Milnor universal property.
degree_zero (test, ; K2SymbolsBrauer:T.2/graded-map): The degree-zero map Z->Quillen K0(F) sends 1 to the class of the one-dimensional vector space.
degree_one (test, ; K2SymbolsBrauer:T.2/graded-map): For F=Q, the unit 2 maps to its K1 unit class, corresponding to 2 under determinant.
degree_two_symbol (test, ; K2SymbolsBrauer:T.2/graded-map): {a,1-a} maps to zero, and {-1,-1} maps to the classical symbol under the K2 comparison.
degree_three_Q (test, ; K2SymbolsBrauer:T.2/graded-map): For F=Q the integral component is injective Z/2->Z/48 and is not onto; this computation is an external VI.5.2.1 test, not a new owned theorem.
toElementary_map (API, functoriality; K2SymbolsBrauer:T.1:classical/to-elementary): The square for a unital ring homomorphism commutes on each generator.
generator_image (test, ; K2SymbolsBrauer:T.1:classical/to-elementary): x_01(2) maps to I+2E_01 over Z.
elementary_word (test, ; K2SymbolsBrauer:T.1:classical/to-elementary): e_01(r)*e_12(s) is the image of x_01(r)*x_12(s).
not_whole_gl (test, ; K2SymbolsBrauer:T.1:classical/to-elementary): Over Q, diag(2,1,1) has determinant 2 and is outside the image; surjectivity concerns E_3, not GL_3.
HomOver.mk (API, constructor; K2SymbolsBrauer:T.1:classical/central-extension-hom): A homomorphism and proof of the projection square give a morphism.
HomOver.ext (API, extensionality; K2SymbolsBrauer:T.1:classical/central-extension-hom): Equality of underlying homomorphisms implies equality of morphisms.
HomOver.id_comp (API, simp; K2SymbolsBrauer:T.1:classical/central-extension-hom): Identity and composition retain the projection square; unit and associativity laws hold.
reject_projection_error (test, ; K2SymbolsBrauer:T.1:classical/central-extension-hom): For nontrivial G, the constant homomorphism G->A x G is not over id:G->G.
relatorProjection (API, constructor; K2SymbolsBrauer:T.1:classical/relation-central-extension): The induced quotient projection E/[N,E]→E/N for any normal N in E.
relatorProjection_kernel (API, characterisation; K2SymbolsBrauer:T.1:classical/relation-central-extension): Its kernel is canonically N/[N,E] and lies in the centre.
relatorProjection_map (API, functoriality; K2SymbolsBrauer:T.1:classical/relation-central-extension): A map of presentations preserving relators induces a commuting map of extensions.
no_relators (test, ; K2SymbolsBrauer:T.1:classical/relation-central-extension): If S=1, the extension is the identity F->F and its kernel is trivial.
cyclic_relation (test, ; K2SymbolsBrauer:T.1:classical/relation-central-extension): If F=Z and S=mZ with m>=2, the extension is Z->Z/m with kernel mZ, which is nontrivial.
redundant_generator (test, ; K2SymbolsBrauer:T.1:classical/relation-central-extension): For Free(a,b)->Z killing b, the relation kernel is nonzero, detected by the b-exponent sum.
commutatorProjection_kernel (API, characterisation; K2SymbolsBrauer:T.1:classical/commutator-central-extension): Its kernel is the intersection quotient.
commutatorProjection_perfect (API, compatibility; K2SymbolsBrauer:T.1:classical/commutator-central-extension): For perfect G the quotient [G,G] identifies with G, preserving the projection.
free_presentation (test, ; K2SymbolsBrauer:T.1:classical/commutator-central-extension): For S=1 the map [F,F]->[F,F] is the identity, with trivial kernel.
cyclic_quotient (test, ; K2SymbolsBrauer:T.1:classical/commutator-central-extension): For F=Z, S=mZ, its source and target commutator groups are trivial even though the larger relation kernel is mZ.
abelian_rank_two (test, ; K2SymbolsBrauer:T.1:classical/commutator-central-extension): For G=Z^2 presented by F(a,b) with S=[F,F], the quotient target is trivial and the kernel [F,F]/[[F,F],F] is nontrivial; detect [a,b] in the integral Heisenberg quotient.
w_phi (API, compatibility; K2SymbolsBrauer:T.2:symbols/diagonal-lift-words): phi(w_ij(r)) has r,-r^-1 in the two off-diagonal positions.
w_map (API, functoriality; K2SymbolsBrauer:T.2:symbols/diagonal-lift-words): Unital ring homomorphisms preserve the indexed word and its elementary image.
unit_sign (test, ; K2SymbolsBrauer:T.2:symbols/diagonal-lift-words): w_01(1) has block [[0,1],[-1,0]].
negative_unit (test, ; K2SymbolsBrauer:T.2:symbols/diagonal-lift-words): w_01(-1) has block [[0,-1],[1,0]].
indexed_inverse (test, ; K2SymbolsBrauer:T.2:symbols/diagonal-lift-words): Over Q, w_12(2) has off-diagonal entries 2 and -1/2 in positions (1,2),(2,1), and entry 1 at (0,0).
h_phi (API, compatibility; K2SymbolsBrauer:T.2:symbols/diagonal-lift): The image is diag(r,r^-1) on coordinates i,j.
h_map (API, functoriality; K2SymbolsBrauer:T.2:symbols/diagonal-lift): Ring homomorphisms preserve h_ij(r), retaining the two indices.
identity_image (test, ; K2SymbolsBrauer:T.2:symbols/diagonal-lift): h_01(1) has identity elementary image.
inverse_parameter (test, ; K2SymbolsBrauer:T.2:symbols/diagonal-lift): Over Q, h_01(2) has diagonal image (2,1/2,1).
indexed_positions (test, ; K2SymbolsBrauer:T.2:symbols/diagonal-lift): Over Q, h_12(2) has diagonal image (1,2,1/2).
-/

/-! ## Shared Milnor and stable Steinberg carriers (T.1–T.2)

These are the single local presentation models consumed below. Their missing
bridges to imported owner carriers are obligations, not additional definitions.
-/
namespace TauCeti.MilnorK

variable (F : Type u) [Field F]

/-- Stand-in for `K2SymbolsBrauer:T.2/milnor-k-theory` (the relations): the `ℤ`-span of the pure
tensors `l(x₁) ⊗ ⋯ ⊗ l(xₙ)` of `(Fˣ)^{⊗n}` having two entries `xᵢ + xⱼ = 1` (`i ≠ j`). With
graded commutativity this is the span of the consecutive Steinberg tensors. -/
def milnorRel (n : ℕ) : Submodule ℤ (⨂[ℤ] _ : Fin n, Additive Fˣ) :=
  Submodule.span ℤ {z | ∃ (x : Fin n → Fˣ) (i j : Fin n), i ≠ j ∧ (x i : F) + x j = 1 ∧
    z = ⨂ₜ[ℤ] k, Additive.ofMul (x k)}

/-- Stand-in for `K2SymbolsBrauer:T.2/milnor-k-theory` (`milnorK`): the Milnor K-group
`K^M_n(F) = (Fˣ)^{⊗n} / ⟨Steinberg tensors⟩`, written additively. -/
def milnorK (n : ℕ) : Type u := (⨂[ℤ] _ : Fin n, Additive Fˣ) ⧸ milnorRel F n

instance (n : ℕ) : AddCommGroup (milnorK F n) :=
  inferInstanceAs (AddCommGroup (_ ⧸ milnorRel F n))

namespace milnorK

variable {F}

/-- Stand-in for `milnorK.symbol` of `K2SymbolsBrauer:T.2/milnor-k-theory`: the symbol
`{x₁, …, xₙ}`, the class of `l(x₁) ⊗ ⋯ ⊗ l(xₙ)`. -/
def symbol {n : ℕ} (x : Fin n → Fˣ) : milnorK F n :=
  Submodule.Quotient.mk (⨂ₜ[ℤ] k, Additive.ofMul (x k))

/-- The empty symbol, the generator `1` of `K^M_0(F) = ℤ`. -/
def one : milnorK F 0 := symbol ![]

/-- Stand-in for the graded product of `K2SymbolsBrauer:T.2/milnor-k-theory`:
`K^M_i(F) × K^M_j(F) → K^M_{i+j}(F)`, `{x} · {y} = {x, y}` (concatenation). -/
def mul {i j : ℕ} : milnorK F i →+ milnorK F j →+ milnorK F (i + j) := sorry

/-- Stand-in for `milnorK.map` of `K2SymbolsBrauer:T.2/milnor-k-theory`: restriction along a
field homomorphism, `{x₁, …, xₙ} ↦ {f x₁, …, f xₙ}`. -/
def map {E : Type v} [Field E] (f : F →+* E) (n : ℕ) : milnorK F n →+ milnorK E n := sorry

/-- Transport along an equality of degrees (a real definition). -/
def cast {m n : ℕ} (h : m = n) : milnorK F m ≃+ milnorK F n := by
  subst h
  exact AddEquiv.refl _

/-- Stand-in for `milnorK.zero` of `K2SymbolsBrauer:T.2/milnor-k-theory`: `K^M_0(F) ≃ ℤ`,
`one ↦ 1`. -/
def zeroEquiv : milnorK F 0 ≃+ ℤ := sorry

/-- Stand-in for `milnorK.one` of `K2SymbolsBrauer:T.2/milnor-k-theory`: `K^M_1(F) ≃ Fˣ`
(written additively), `{x} ↦ x`. -/
def oneEquiv : milnorK F 1 ≃+ Additive Fˣ := sorry

end milnorK

end TauCeti.MilnorK

namespace TauCeti.Steinberg

variable (R : Type u) [Ring R]

/-- The generators `x_ij(r)` of the stable Steinberg group: a pair of distinct indices and a ring
element (stable presentation model for `K2SymbolsBrauer:T.1/stabilisation`). -/
structure StableGen where
  /-- The row index. -/
  i : ℕ
  /-- The column index. -/
  j : ℕ
  /-- The indices are distinct; this is data of the generator, never a forgotten side condition. -/
  ne : i ≠ j
  /-- The ring element. -/
  r : R

/-- The Steinberg relations, each with its index hypotheses: additivity, the commutator of
disjoint generators, and `[x_ij(r), x_jl(s)] = x_il(rs)` for `i ≠ l`. -/
def rels : Set (FreeGroup (StableGen R)) :=
  {z | ∃ (i j : ℕ) (hij : i ≠ j) (r s : R), z = FreeGroup.of (⟨i, j, hij, r⟩ : StableGen R) *
      FreeGroup.of (⟨i, j, hij, s⟩ : StableGen R) * (FreeGroup.of (⟨i, j, hij, r + s⟩ : StableGen R))⁻¹} ∪
  {z | ∃ (i j k l : ℕ) (hij : i ≠ j) (hkl : k ≠ l) (r s : R), j ≠ k ∧ i ≠ l ∧
      z = ⁅FreeGroup.of (⟨i, j, hij, r⟩ : StableGen R), FreeGroup.of (⟨k, l, hkl, s⟩ : StableGen R)⁆} ∪
  {z | ∃ (i j l : ℕ) (hij : i ≠ j) (hjl : j ≠ l) (hil : i ≠ l) (r s : R),
      z = ⁅FreeGroup.of (⟨i, j, hij, r⟩ : StableGen R), FreeGroup.of (⟨j, l, hjl, s⟩ : StableGen R)⁆ *
        (FreeGroup.of (⟨i, l, hil, r * s⟩ : StableGen R))⁻¹}

/-- Stand-in for `StableSteinberg` of `K2SymbolsBrauer:T.1/stabilisation`: the stable Steinberg
group `St(R)`, presented on the generators `x_ij(r)`, `i ≠ j ∈ ℕ`. The union presentation models the colimit. The finite-to-stable maps and
proof of its colimit universal property remain T.1/stabilisation’s obligations. -/
def StableSteinberg : Type u := PresentedGroup (rels R)

instance : Group (StableSteinberg R) := inferInstanceAs (Group (PresentedGroup (rels R)))

namespace StableSteinberg

variable {R}

/-- The generator `x_ij(r)`. -/
def x {i j : ℕ} (hij : i ≠ j) (r : R) : StableSteinberg R := PresentedGroup.of ⟨i, j, hij, r⟩

/-- `w_ij(u) = x_ij(u) x_ji(-u⁻¹) x_ij(u)` (exposed as the first request of the packet asks). -/
def w {i j : ℕ} (hij : i ≠ j) (u : Rˣ) : StableSteinberg R :=
  x hij (u : R) * x hij.symm (-((u⁻¹ : Rˣ) : R)) * x hij (u : R)

/-- `h_ij(u) = w_ij(u) w_ij(-1)`, whose image in `E(R)` is `diag(u, u⁻¹)` at `(i, j)`. -/
def h {i j : ℕ} (hij : i ≠ j) (u : Rˣ) : StableSteinberg R := w hij u * w hij (-1)

/-- The elementary transvection `e_ij(r)` acting on column vectors `R^{(ℕ)}`:
`v ↦ v + eᵢ · r vⱼ`. The action of `GL(R)` on `R^{(ℕ)}` is faithful, so the kernel of `St(R)`
acting through these is the kernel of `St(R) → E(R) ⊆ GL(R)`. -/
def elemPerm {i j : ℕ} (hij : i ≠ j) (r : R) : Equiv.Perm (ℕ →₀ R) where
  toFun c := c + Finsupp.single i (r * c j)
  invFun c := c - Finsupp.single i (r * c j)
  left_inv c := by simp [hij]
  right_inv c := by simp [hij]

variable (R)

/-- Stand-in for `StableSteinberg.phi` of `K2SymbolsBrauer:T.1/stabilisation`: the elementary action on `R^{(ℕ)}`. Its image models `E(R)`;
no surjectivity onto the full permutation group is asserted. The data is the
presentation's universal property; the relation check is the owning node
`K2SymbolsBrauer:T.1/elementary-matrices-satisfy`. -/
def phi : StableSteinberg R →* Equiv.Perm (ℕ →₀ R) :=
  PresentedGroup.toGroup (f := fun g : StableGen R => elemPerm g.ne g.r) (by sorry)

variable {R}

/-- Stand-in for `StableSteinberg.map` of `K2SymbolsBrauer:T.1/stabilisation`:
`x_ij(r) ↦ x_ij(f r)`. -/
def map {S : Type v} [Ring S] (f : R →+* S) : StableSteinberg R →* StableSteinberg S :=
  PresentedGroup.toGroup (f := fun g : StableGen R => x g.ne (f g.r)) (by sorry)

end StableSteinberg

/-- Stand-in for `K2` of `K2SymbolsBrauer:T.1/k2-definition`: `K₂(R) = ker(St(R) → E(R))`. -/
def K2 : Subgroup (StableSteinberg R) := (StableSteinberg.phi R).ker

/-- `K₂(R)` is central, hence abelian (`K2SymbolsBrauer:T.1/k2-is-centre`); the group law is the
subgroup's. -/
instance : CommGroup (K2 R) := { (inferInstance : Group (K2 R)) with mul_comm := sorry }

variable {R} in
/-- Stand-in for `K2.map` of `K2SymbolsBrauer:T.1/k2-definition`. -/
def K2.map {S : Type v} [Ring S] (f : R →+* S) : K2 R →* K2 S where
  toFun g := ⟨StableSteinberg.map f g, by sorry⟩
  map_one' := by sorry
  map_mul' := by sorry

end TauCeti.Steinberg

namespace TauCeti.MilnorK

open TauCeti.Steinberg

/-- Stand-in for `steinbergSymbol` of `K2SymbolsBrauer:T.2/steinberg-symbol`: for commuting units,
`{u, v} = [h_12(u), h_13(v)] ∈ K₂(R)` (indices `0, 1, 2` here). -/
def steinbergSymbol {R : Type u} [Ring R] (u v : Rˣ) (huv : Commute (u : R) v) : K2 R :=
  ⟨⁅StableSteinberg.h (i := 0) (j := 1) (by decide) u,
    StableSteinberg.h (i := 0) (j := 2) (by decide) v⁆, by sorry⟩

/-- Stand-in for `K2SymbolsBrauer:T.2/matsumoto`: Matsumoto's isomorphism
`K^M_2(F) ≃ K₂(F)`, `{a, b} ↦ steinbergSymbol a b`, for a field. -/
def matsumotoEquiv (F : Type u) [Field F] : milnorK F 2 ≃+ Additive (K2 F) := sorry

end TauCeti.MilnorK


namespace TauCeti.Steinberg

/-- T.1/stabilisation's finite presentation map into the shared stable model. -/
def finiteToStable {n : ℕ} (hn : 3 ≤ n) (R : Type u) [Ring R] :
    Steinberg n hn R →* StableSteinberg R := by sorry

theorem finiteToStable_x {n : ℕ} (hn : 3 ≤ n) {R : Type u} [Ring R]
    {i j : Fin n} (hij : i ≠ j) (r : R) :
    finiteToStable hn R (x hn hij r) =
      StableSteinberg.x (i := i.val) (j := j.val)
        (by intro h; exact hij (Fin.ext h)) r := by sorry

-- test finite_field (K2SymbolsBrauer:T.1/k2-definition)
example (F : Type u) [Field F] [Finite F] : Subsingleton (K2 F) := by sorry

-- test self (K2SymbolsBrauer:T.2/star-product)
example {X G : Type u} [Group X] [Group G] (p : X →* G)
    (hp : Function.Surjective p) (hc : IsCentral p) (A : G) :
    centralStar p hp hc A A (Commute.refl A) = 1 := by sorry

end TauCeti.Steinberg

namespace TauCeti.MilnorK

-- test finite_field (K2SymbolsBrauer:T.2/milnor-k-theory)
example (F : Type u) [Field F] [Finite F] (n : ℕ) (hn : 2 ≤ n) :
    Subsingleton (milnorK F n) := by sorry

end TauCeti.MilnorK

/-! ## `K2SymbolsBrauer:T.3:symbols` — the tame symbol

Convention (pinned): `∂_v{f, g} = (-1)^{v(f) v(g)} · (f^{v(g)} / g^{v(f)})‾`, so `∂{u, π} = ū` and
`∂{π, u} = ū⁻¹`. The K-book's tame symbol (Lemma III.6.3) is its inverse. -/

namespace TauCeti.TameSymbol

open TauCeti.MilnorK TauCeti.Steinberg


variable {F : Type u} [Field F]

/-- The residue field `k_v` of a `ℤᵐ⁰`-valued valuation `v` (of its valuation subring). -/
abbrev ResidueField (v : Valuation F ℤᵐ⁰) : Type u := IsLocalRing.ResidueField v.valuationSubring

/-- The residue `ū ∈ k_vˣ` of an element of the unit group of the valuation ring
(`ValuationSubring.unitGroupToResidueFieldUnits`). -/
abbrev res (v : Valuation F ℤᵐ⁰) (u : v.valuationSubring.unitGroup) : (ResidueField v)ˣ :=
  v.valuationSubring.unitGroupToResidueFieldUnits u

/-- `f^{ord g} g^{-ord f}` has order zero, so lies in the unit group of the valuation ring. -/
theorem zpow_ord_mul_zpow_neg_ord_mem_unitGroup (v : Valuation F ℤᵐ⁰) (f g : Fˣ) :
    f ^ v.ord (g : F) * g ^ (-v.ord (f : F)) ∈ v.valuationSubring.unitGroup := by
  sorry

/-- **The tame symbol** (`K2SymbolsBrauer:T.3/tame-symbol`). For a surjective `v : F → ℤᵐ⁰`,
`tameSymbol v hv f g = (-1)^{ord f · ord g} · ū_f^{ord g} · ū_g^{-ord f} ∈ k_vˣ`, the unit parts
`f = t^{ord f} u_f` being taken against a uniformiser `t` fixed by choice
(`Valuation.exists_isUniformizer_of_surjective`, `Valuation.exists_eq_zpow_mul_unit_of_surjective`).
The residue map is applied only to units of the valuation ring. -/
def tameSymbol (v : Valuation F ℤᵐ⁰) (hv : Function.Surjective v) (f g : Fˣ) :
    (ResidueField v)ˣ :=
  sorry

variable (v : Valuation F ℤᵐ⁰) (hv : Function.Surjective v)

/-- The uniformiser-free form (`K2SymbolsBrauer:T.3/tame-symbol-uniformizer-independence`):
`∂_v{f, g} = (-1)^{ord f · ord g} · res(f^{ord g} g^{-ord f})`. -/
theorem tameSymbol_eq_residue (f g : Fˣ) :
    tameSymbol v hv f g = (-1) ^ (v.ord (f : F) * v.ord (g : F)) *
      res v ⟨_, zpow_ord_mul_zpow_neg_ord_mem_unitGroup v f g⟩ := by
  sorry

/-- The convention-pinning value `∂_v{u, t} = ū`. -/
@[simp]
theorem tameSymbol_unit_uniformizer (u : v.valuationSubring.unitGroup) (t : Fˣ)
    (ht : v.ord (t : F) = 1) : tameSymbol v hv u t = res v u := by
  sorry

/-- The convention-pinning value `∂_v{t, u} = ū⁻¹`. -/
@[simp]
theorem tameSymbol_uniformizer_unit (u : v.valuationSubring.unitGroup) (t : Fˣ)
    (ht : v.ord (t : F) = 1) : tameSymbol v hv t u = (res v u)⁻¹ := by
  sorry

@[simp]
theorem tameSymbol_of_ord_eq_zero (f g : Fˣ) (hf : v.ord (f : F) = 0) (hg : v.ord (g : F) = 0) :
    tameSymbol v hv f g = 1 := by
  sorry

theorem tameSymbol_swap (f g : Fˣ) : tameSymbol v hv g f = (tameSymbol v hv f g)⁻¹ := by
  sorry

theorem tameSymbol_self (f : Fˣ) : tameSymbol v hv f f = (-1) ^ v.ord (f : F) := by
  sorry

theorem tameSymbol_neg_self (f : Fˣ) : tameSymbol v hv f (-f) = 1 := by
  sorry

/-- The K-book's tame symbol of Lemma III.6.3, `∂_v({r, s}) = (-1)^{v(r)v(s)} (s^{v(r)}/r^{v(s)})‾`,
is `tameSymbol v s r`, the **inverse** of `tameSymbol v r s`. -/
theorem tameSymbol_kbook (r s : Fˣ) :
    (-1) ^ (v.ord (r : F) * v.ord (s : F)) *
        res v ⟨_, zpow_ord_mul_zpow_neg_ord_mem_unitGroup v s r⟩ = (tameSymbol v hv r s)⁻¹ := by
  sorry

/-- The DVR form: for an irreducible `ϖ` of the valuation ring `R = 𝒪_v` (a DVR,
`Valuation.valuationSubring_isDiscreteValuationRing_of_surjective`) and
`f = u_f ϖ^{n_f}`, `g = u_g ϖ^{n_g}` (`IsDiscreteValuationRing.exists_units_eq_smul_zpow_of_irreducible`),
`∂_v{f, g} = (-1)^{n_f n_g} ū_f^{n_g} ū_g^{-n_f}`. -/
theorem tameSymbol_dvr (ϖ : v.valuationSubring) (hϖ : Irreducible ϖ) (f g : Fˣ) (nf ng : ℤ)
    (uf ug : v.valuationSubringˣ)
    (hf : (f : F) = ((uf : v.valuationSubring) : F) * (ϖ : F) ^ nf)
    (hg : (g : F) = ((ug : v.valuationSubring) : F) * (ϖ : F) ^ ng) :
    tameSymbol v hv f g = (-1) ^ (nf * ng) *
      Units.map (IsLocalRing.residue v.valuationSubring).toMonoidHom uf ^ ng *
      Units.map (IsLocalRing.residue v.valuationSubring).toMonoidHom ug ^ (-nf) := by
  sorry

/-- Residue fields of equal valuation subrings (a real definition). -/
def residueFieldCongr {A B : ValuationSubring F} (h : A = B) :
    IsLocalRing.ResidueField A ≃+* IsLocalRing.ResidueField B := by
  subst h
  exact RingEquiv.refl _

/-- The valuation ring of a Tau Ceti place is the valuation subring of its valuation
(`TauCeti.Place.integers` is not an exposed definition, so this is stated rather than unfolded). -/
theorem valuationSubring_eq_integers {k : Type v} [Field k] [Algebra k F] (P : Place k F) :
    P.valuation.valuationSubring = P.integers := by
  ext x
  rw [Valuation.mem_valuationSubring_iff, Place.mem_integers_iff]

/-- At a place `P` of a function field, with `t` a uniformiser and `P.ord f = 0`,
`∂_P{f, t} = f(P)`, Tau Ceti's `TauCeti.Place.residueUnit`. -/
theorem tameSymbol_place {k : Type v} [Field k] [Algebra k F] (P : Place k F) (f t : Fˣ)
    (hf : P.ord (f : F) = 0) (ht : P.ord (t : F) = 1) :
    Units.map (residueFieldCongr (valuationSubring_eq_integers P)).toRingHom.toMonoidHom
      (tameSymbol P.valuation P.valuation_surjective f t) = P.residueUnit f hf := by
  sorry

/-- `K2SymbolsBrauer:T.3/tame-symbol-uniformizer-independence`: for **any** uniformiser `t` and
the unit parts `f = t^{ord f} u_f`, `g = t^{ord g} u_g` against it,
`∂_v{f, g} = (-1)^{ord f ord g} ū_f^{ord g} ū_g^{-ord f}`; the left side involves no uniformiser.
On `ℚ` at `5`, `t = 5` and `t = 10` both give `∂{10, 5} = 3`. -/
theorem tameSymbol_uniformizer_independence (t : Fˣ) (ht : v.ord (t : F) = 1) (f g : Fˣ)
    (uf ug : v.valuationSubring.unitGroup) (hf : f = t ^ v.ord (f : F) * uf)
    (hg : g = t ^ v.ord (g : F) * ug) :
    tameSymbol v hv f g =
      (-1) ^ (v.ord (f : F) * v.ord (g : F)) * res v uf ^ v.ord (g : F) *
        res v ug ^ (-v.ord (f : F)) := by
  sorry

/-- `K2SymbolsBrauer:T.3/tame-symbol-steinberg`: bimultiplicativity in the first entry. -/
theorem tameSymbol_mul_left (f f' g : Fˣ) :
    tameSymbol v hv (f * f') g = tameSymbol v hv f g * tameSymbol v hv f' g := by
  sorry

/-- `K2SymbolsBrauer:T.3/tame-symbol-steinberg`: bimultiplicativity in the second entry. -/
theorem tameSymbol_mul_right (f g g' : Fˣ) :
    tameSymbol v hv f (g * g') = tameSymbol v hv f g * tameSymbol v hv f g' := by
  sorry

/-- `K2SymbolsBrauer:T.3/tame-symbol-steinberg`: the Steinberg relation `∂_v{r, 1 - r} = 1` for
`r ≠ 0, 1`, by the source's four exhaustive cases. -/
theorem tameSymbol_steinberg (r : Fˣ) (hr : (r : F) ≠ 1) :
    tameSymbol v hv r (Units.mk0 (1 - (r : F)) (sub_ne_zero.mpr hr.symm)) = 1 := by
  sorry

section Extension

variable {E : Type v} [Field E] [Algebra F E]

/-- The inclusion of valuation rings `𝒪_v → 𝒪_w` for `w` over `v`, i.e.
`ord_w (r) = e · ord_v (r)` on `F` (a real definition; the membership is the order condition). -/
def valuationSubringMap (w : Valuation E ℤᵐ⁰) (e : ℕ)
    (hvw : ∀ r : F, w.ord (algebraMap F E r) = e * v.ord r) :
    v.valuationSubring →+* w.valuationSubring :=
  ((algebraMap F E).comp v.valuationSubring.subtype).codRestrict w.valuationSubring
    (fun _ => by sorry)

/-- The residue field extension `k_v → k_w` for a positive-index valued embedding.
The restricted valuation-ring map is local only when `e > 0`; no finiteness is used. -/
def residueFieldMap (w : Valuation E ℤᵐ⁰) (e : ℕ) (he : 0 < e)
    (hvw : ∀ r : F, w.ord (algebraMap F E r) = e * v.ord r) :
    ResidueField v →+* ResidueField w :=
  haveI : IsLocalHom (valuationSubringMap v w e hvw) := by
    -- For a nonzero ring element, ord_w(f(r)) = e * ord_v(r).
    -- Positivity he makes positive orders equivalent, so nonunits map to nonunits.
    -- Zero maps to zero. Use the local-hom criterion for these valuation rings.
    sorry
  IsLocalRing.ResidueField.map (valuationSubringMap v w e hvw)

/-- `K2SymbolsBrauer:T.3/ramification-formula`: for any field embedding `F → E` and normalised valuations
with positive ramification index `e ≥ 1`, `∂_w{r₁, r₂} = (∂_v{r₁, r₂})^e` in `k_wˣ` for `r₁, r₂ ∈ Fˣ`.
(With all `e_i = 1` the diagonal `k_vˣ → ∏ k_{w_i}ˣ` carries `∂_v` to `(∂_{w_i})_i`.) -/
theorem ramification_formula (w : Valuation E ℤᵐ⁰)
    (hw : Function.Surjective w) (e : ℕ) (he : 0 < e)
    (hvw : ∀ r : F, w.ord (algebraMap F E r) = e * v.ord r) (r₁ r₂ : Fˣ) :
    tameSymbol w hw (Units.map (algebraMap F E).toMonoidHom r₁)
        (Units.map (algebraMap F E).toMonoidHom r₂) =
      Units.map (residueFieldMap v w e he hvw).toMonoidHom (tameSymbol v hv r₁ r₂) ^ e := by
  sorry

-- test TauCeti.TameSymbol.residueFieldMap_residue (compatibility)
example (w : Valuation E ℤᵐ⁰) (e : ℕ) (he : 0 < e)
    (hvw : ∀ r : F, w.ord (algebraMap F E r) = e * v.ord r)
    (a : v.valuationSubring) :
    residueFieldMap v w e he hvw (IsLocalRing.residue v.valuationSubring a) =
      IsLocalRing.residue w.valuationSubring (valuationSubringMap v w e hvw a) := by
  sorry

-- test TauCeti.TameSymbol.residueFieldMap_requires_positive (non-example)
-- The u-adic valuation on ℚ(u) supplies htriv. 5 is a nonunit at v but a unit at w.
example [Fact (Nat.Prime 5)] (w : Valuation (RatFunc ℚ) ℤᵐ⁰)
    (htriv : ∀ r : ℚ, w.ord (algebraMap ℚ (RatFunc ℚ) r) = 0) :
    ¬ IsLocalHom (valuationSubringMap (Rat.padicValuation 5) w 0
      (by intro r; simpa using htriv r)) := by
  sorry

end Extension

/-! ### `K2SymbolsBrauer:T.3/tame-symbol-hom` -/

/-- **The tame symbol on `K^M_2(F)`** (`K2SymbolsBrauer:T.3/tame-symbol-hom`):
`K^M_2(F) →+ Additive k_vˣ`, `{f, g} ↦ tameSymbol v f g`. -/
def tameSymbolHom (v : Valuation F ℤᵐ⁰) (hv : Function.Surjective v) :
    milnorK F 2 →+ Additive (ResidueField v)ˣ :=
  sorry

@[simp]
theorem tameSymbolHom_symbol (f g : Fˣ) :
    tameSymbolHom v hv (milnorK.symbol ![f, g]) = Additive.ofMul (tameSymbol v hv f g) := by
  sorry

theorem tameSymbolHom_surjective : Function.Surjective (tameSymbolHom v hv) := by
  sorry

/-- The tame symbol on Steinberg's `K₂(F)`, through Matsumoto's isomorphism
(`K2SymbolsBrauer:T.2/matsumoto`). -/
def tameSymbolHomK2 (v : Valuation F ℤᵐ⁰) (hv : Function.Surjective v) :
    K2 F →* (ResidueField v)ˣ :=
  sorry

/-- `tameSymbolHomK2` has the same value on Steinberg symbols. -/
theorem tameSymbolHomK2_steinbergSymbol (f g : Fˣ) :
    tameSymbolHomK2 v hv (steinbergSymbol f g (Commute.all _ _)) = tameSymbol v hv f g := by
  sorry

@[simp]
theorem tameSymbolHom_symbol_units (u u' : v.valuationSubring.unitGroup) :
    tameSymbolHom v hv (milnorK.symbol ![(u : Fˣ), (u' : Fˣ)]) = 0 := by
  sorry

/-- The K-book's `∂_v` (Lemma III.6.3) is `-tameSymbolHom v` in additive notation: on a symbol
its value `(-1)^{v(f)v(g)} (g^{v(f)}/f^{v(g)})‾` is minus `tameSymbolHom v {f, g}`. -/
theorem tameSymbolHom_kbook (f g : Fˣ) :
    Additive.ofMul ((-1) ^ (v.ord (f : F) * v.ord (g : F)) *
        res v ⟨_, zpow_ord_mul_zpow_neg_ord_mem_unitGroup v g f⟩) =
      -tameSymbolHom v hv (milnorK.symbol ![f, g]) := by
  sorry

/-! ### Unit tests: the tame symbol at the `5`-adic valuation of `ℚ`

`k_{v₅}` is `𝔽₅`; each test is stated through a ring homomorphism `φ : k_{v₅} →+* ZMod 5`
(there is exactly one), so the values are read in `ZMod 5`. -/

section Tests

variable [Fact (Nat.Prime 5)]

/-- A nonzero rational as a unit (test notation). -/
local notation "⟪" q "⟫" => Units.mk0 (q : ℚ) (by norm_num)

-- test tameSymbol_rat_five (computation)
example (φ : ResidueField (Rat.padicValuation 5) →+* ZMod 5) :
    φ (tameSymbol (Rat.padicValuation 5) (Rat.surjective_padicValuation 5) ⟪2⟫ ⟪5⟫) = 2 ∧
      φ (tameSymbol (Rat.padicValuation 5) (Rat.surjective_padicValuation 5) ⟪5⟫ ⟪2⟫) = 3 := by
  sorry

-- test tameSymbol_rat_five_sign (computation)
example (φ : ResidueField (Rat.padicValuation 5) →+* ZMod 5) :
    φ (tameSymbol (Rat.padicValuation 5) (Rat.surjective_padicValuation 5) ⟪5⟫ ⟪5⟫) = 4 ∧
      φ (tameSymbol (Rat.padicValuation 5) (Rat.surjective_padicValuation 5) ⟪10⟫ ⟪5⟫) = 3 := by
  sorry

-- test tameSymbol_units (degenerate)
example :
    tameSymbol (Rat.padicValuation 5) (Rat.surjective_padicValuation 5) ⟪2⟫ ⟪3⟫ = 1 ∧
      ∀ f : ℚˣ, tameSymbol (Rat.padicValuation 5) (Rat.surjective_padicValuation 5) f 1 = 1 := by
  sorry

-- test tameSymbol_not_kbook (non-example)
/- `tameSymbol 5 2 = 3`, while the K-book's formula at `(r, s) = (5, 2)` gives `2`. -/
example (φ : ResidueField (Rat.padicValuation 5) →+* ZMod 5) :
    φ (tameSymbol (Rat.padicValuation 5) (Rat.surjective_padicValuation 5) ⟪5⟫ ⟪2⟫) = 3 ∧
      φ ((-1) ^ ((Rat.padicValuation 5).ord 5 * (Rat.padicValuation 5).ord 2) *
        res (Rat.padicValuation 5)
          ⟨_, zpow_ord_mul_zpow_neg_ord_mem_unitGroup (Rat.padicValuation 5) ⟪2⟫ ⟪5⟫⟩ :
            (ResidueField (Rat.padicValuation 5))ˣ) = 2 := by
  sorry

-- test tameSymbolHom_rat_five (computation)
example (φ : ResidueField (Rat.padicValuation 5) →+* ZMod 5) :
    φ ↑(Additive.toMul (tameSymbolHom (Rat.padicValuation 5) (Rat.surjective_padicValuation 5)
        (milnorK.symbol ![⟪5⟫, ⟪2⟫]))) = 3 ∧
      φ ↑(Additive.toMul (tameSymbolHom (Rat.padicValuation 5) (Rat.surjective_padicValuation 5)
        (milnorK.symbol ![⟪2⟫, ⟪5⟫]))) = 2 := by
  sorry

-- test tameSymbolHom_units (degenerate)
example : tameSymbolHom (Rat.padicValuation 5) (Rat.surjective_padicValuation 5)
    (milnorK.symbol ![⟪2⟫, ⟪3⟫]) = 0 := by
  sorry

-- test tameSymbolHom_generates (characterisation)
example : Subgroup.zpowers (Additive.toMul (tameSymbolHom (Rat.padicValuation 5)
    (Rat.surjective_padicValuation 5) (milnorK.symbol ![⟪2⟫, ⟪5⟫]))) = ⊤ := by
  sorry

-- test tameSymbolHom_needs_sign (non-example)
/- `{1/5, 4/5}` is a Steinberg element, so it is `0` in `K^M_2(ℚ)` and the signed symbol kills
it; the unsigned formula `res((1/5)^{v(4/5)} (4/5)^{-v(1/5)})` gives `4 ≠ 1`. -/
example (φ : ResidueField (Rat.padicValuation 5) →+* ZMod 5) :
    milnorK.symbol ![⟪1 / 5⟫, ⟪4 / 5⟫] = 0 ∧
      φ (res (Rat.padicValuation 5)
        ⟨_, zpow_ord_mul_zpow_neg_ord_mem_unitGroup (Rat.padicValuation 5) ⟪1 / 5⟫ ⟪4 / 5⟫⟩ :
          (ResidueField (Rat.padicValuation 5))ˣ) = 4 := by
  sorry

-- test tameSymbolHom_self (compatibility)
example (φ : ResidueField (Rat.padicValuation 5) →+* ZMod 5) :
    milnorK.symbol ![⟪5⟫, ⟪5⟫] = milnorK.symbol ![⟪5⟫, -1] ∧
      φ ↑(Additive.toMul (tameSymbolHom (Rat.padicValuation 5) (Rat.surjective_padicValuation 5)
        (milnorK.symbol ![⟪5⟫, ⟪5⟫]))) = 4 := by
  sorry

end Tests

-- test tameSymbol_ratFunc (compatibility)
/- At the place `t - b` of `k(t)`, `∂{a, t - b} = a` for `a ∈ kˣ` (read in `k` through the residue
field of the place); the K-book's Weil reciprocity (6.5.3) uses the inverse `a⁻¹`. -/
example {k : Type u} [Field k] (b : k) (a : kˣ) :
    residueFieldCongr (valuationSubring_eq_integers
        (Place.adicOfIrreducible (Polynomial.irreducible_X_sub_C b)))
      (tameSymbol (Place.adicOfIrreducible (Polynomial.irreducible_X_sub_C b)).valuation
        (Place.adicOfIrreducible (Polynomial.irreducible_X_sub_C b)).valuation_surjective
        (Units.map (algebraMap k (RatFunc k)).toMonoidHom a)
        (Units.mk0 (algebraMap (Polynomial k) (RatFunc k) (Polynomial.X - Polynomial.C b))
          (RatFunc.algebraMap_ne_zero (Polynomial.X_sub_C_ne_zero b))) : _) =
      algebraMap k (Place.adicOfIrreducible (Polynomial.irreducible_X_sub_C b)).ResidueField a := by
  sorry

end TauCeti.TameSymbol

/-! ## Milnor residues — nodes parented in `K2SymbolsBrauer:T.3:symbols`

Serre's algebra, the higher residues and specialisations, their product formula, the change of
uniformiser, the kernel of Serre's map, finite support and rigidity realise
`T.3:localization-comparison`'s text but are parented in `T.3:symbols`, so that `T.4` can use them
while `T.3:localization-comparison` follows `T.4` (RT-AREA-ktheory-1/28). The ramification formula
`higher_ramification_formula` is parented in `T.4`. The comparison with Quillen K-theory is the
section after `T.4` below.

Convention (pinned): `d_t(x) = λ_t(x) + ∂_v(x)·Π` with **Π on the right**, so
`∂_v{u₁, …, u_{n-1}, π} = {ū₁, …, ū_{n-1}}`, degree two is the roadmap's tame symbol, and
Theorem III.7.3's residue (Π on the left, `∂^{Wb}{π, u₂, …} = {ū₂, …}`) is
`∂^{Wb} = (-1)^{n-1} ∂` on `K^M_n(F)`. -/

namespace TauCeti.MilnorK

variable (k : Type u) [Field k]

/-- **Serre's algebra** `L(k)` (`K2SymbolsBrauer:T.3/serre-residue-algebra`), degreewise:
`L(k)_0 = K^M_0(k)` and `L(k)_{n+1} = K^M_{n+1}(k) × K^M_n(k)`, the second factor written `b·Π`.
The graded multiplication is `serreAlgebra.mul`, pinned by `serreAlgebra.mul_def`. -/
def serreAlgebra : ℕ → Type u
  | 0 => milnorK k 0
  | n + 1 => milnorK k (n + 1) × milnorK k n

instance serreAlgebra.instAddCommGroup : (n : ℕ) → AddCommGroup (serreAlgebra k n)
  | 0 => inferInstanceAs (AddCommGroup (milnorK k 0))
  | n + 1 => inferInstanceAs (AddCommGroup (milnorK k (n + 1) × milnorK k n))

namespace serreAlgebra

variable {k}

/-- `L(k)_{n+1} ≃ K^M_{n+1}(k) ⊕ K^M_n(k)`: the source's direct sum is part of the construction. -/
def decompose (n : ℕ) : serreAlgebra k (n + 1) ≃+ milnorK k (n + 1) × milnorK k n :=
  AddEquiv.refl _

/-- The indeterminate `Π = (0, 1) ∈ L(k)_1`. -/
def «Π» : serreAlgebra k 1 := (decompose 0).symm (0, milnorK.one)

/-- The graded ring embedding `K^M_*(k) → L(k)`, `a ↦ (a, 0)`. -/
def of : (n : ℕ) → milnorK k n →+ serreAlgebra k n
  | 0 => AddMonoidHom.id _
  | n + 1 => (decompose n).symm.toAddMonoidHom.comp (AddMonoidHom.inl _ _)

/-- The graded multiplication of `L(k)` (data of `serreAlgebra`; its formula is `mul_def`). -/
def mul {i j : ℕ} : serreAlgebra k i →+ serreAlgebra k j →+ serreAlgebra k (i + j) := sorry

/-- Transport along an equality of degrees (a real definition). -/
def cast {m n : ℕ} (h : m = n) : serreAlgebra k m ≃+ serreAlgebra k n := by
  subst h
  exact AddEquiv.refl _

/-- `(a + bΠ)(c + dΠ) = ac + (ad + (-1)^{|c|} bc + (-1)^{|d|} bd{-1})Π`, in degrees
`|a| = i + 1`, `|c| = j + 1`. -/
theorem mul_def {i j : ℕ} (a : milnorK k (i + 1)) (b : milnorK k i) (c : milnorK k (j + 1))
    (d : milnorK k j) :
    decompose (i + 1 + j) (mul ((decompose i).symm (a, b)) ((decompose j).symm (c, d))) =
      (milnorK.mul a c, milnorK.mul a d + (-1 : ℤ) ^ (j + 1) • milnorK.cast (by omega)
          (milnorK.mul b c) +
        (-1 : ℤ) ^ j • milnorK.cast (by omega) (milnorK.mul (milnorK.mul b d) (milnorK.symbol ![-1]))) := by
  sorry

/-- `Π · Π = {-1} · Π`. -/
@[simp]
theorem «Π_mul_Π» : mul «Π» «Π» = mul (of 1 (milnorK.symbol ![(-1 : kˣ)])) (k := k) «Π» := by
  sorry

/-- `Π · x = (-1)^{|x|} x · Π` for `x ∈ K^M_n(k)`. -/
theorem «Π_mul» {n : ℕ} (x : milnorK k n) :
    mul «Π» (of n x) = (-1 : ℤ) ^ n • cast (by omega) (mul (of n x) «Π») := by
  sorry

/-- `L(k)` is graded-commutative: `x y = (-1)^{|x||y|} y x`. -/
theorem gradedComm {i j : ℕ} (x : serreAlgebra k i) (y : serreAlgebra k j) :
    mul x y = (-1 : ℤ) ^ (i * j) • cast (by omega) (mul y x) := by
  sorry

/-- The λ-part `a + bΠ ↦ a`. -/
def lambdaHom : (n : ℕ) → serreAlgebra k n →+ milnorK k n
  | 0 => AddMonoidHom.id _
  | n + 1 => (AddMonoidHom.fst _ _).comp (decompose n).toAddMonoidHom

/-- The ρ-part `a + bΠ ↦ a + b{-1}`. -/
def rhoHom : (n : ℕ) → serreAlgebra k n →+ milnorK k n
  | 0 => AddMonoidHom.id _
  | n + 1 => ((AddMonoidHom.fst _ _) +
      ((milnorK.mul (i := n) (j := 1)).flip (milnorK.symbol ![-1])).comp (AddMonoidHom.snd _ _)).comp
        (decompose n).toAddMonoidHom

/-- `lambdaHom` is a graded ring homomorphism. -/
theorem lambdaHom_mul {i j : ℕ} (x : serreAlgebra k i) (y : serreAlgebra k j) :
    lambdaHom (i + j) (mul x y) = milnorK.mul (lambdaHom i x) (lambdaHom j y) := by
  sorry

/-- `rhoHom` is a graded ring homomorphism. -/
theorem rhoHom_mul {i j : ℕ} (x : serreAlgebra k i) (y : serreAlgebra k j) :
    rhoHom (i + j) (mul x y) = milnorK.mul (rhoHom i x) (rhoHom j y) := by
  sorry

/-- On `K^M_{n+1}(k) × K^M_n(k)`: `(a, b) ↦ (a - b{c}, b)`. -/
def shiftAux (c : kˣ) (n : ℕ) : milnorK k (n + 1) × milnorK k n ≃+ milnorK k (n + 1) × milnorK k n
    where
  toFun p := (p.1 - milnorK.mul p.2 (milnorK.symbol ![c]), p.2)
  invFun p := (p.1 + milnorK.mul p.2 (milnorK.symbol ![c]), p.2)
  left_inv p := by simp
  right_inv p := by simp
  map_add' p q := by sorry

/-- For `c ∈ kˣ`, the automorphism with `Π ↦ Π - {c}` over `K^M_*(k)`:
`a + bΠ ↦ (a - b{c}) + bΠ`. -/
def shift (c : kˣ) : (n : ℕ) → serreAlgebra k n ≃+ serreAlgebra k n
  | 0 => AddEquiv.refl _
  | n + 1 => ((decompose n).trans (shiftAux c n)).trans (decompose n).symm

/-- `shift c` is multiplicative. -/
theorem shift_mul (c : kˣ) {i j : ℕ} (x : serreAlgebra k i) (y : serreAlgebra k j) :
    shift c (i + j) (mul x y) = mul (shift c i x) (shift c j y) := by
  sorry

/-- `shift c ∘ shift c' = shift (c c')`. -/
theorem shift_trans (c c' : kˣ) (n : ℕ) : (shift c n).trans (shift c' n) = shift (c * c') n := by
  sorry

/-- A field homomorphism `k → k'` induces `L(k) → L(k')` fixing `Π`. -/
def map {k' : Type v} [Field k'] (f : k →+* k') :
    (n : ℕ) → serreAlgebra k n →+ serreAlgebra k' n
  | 0 => milnorK.map f 0
  | n + 1 => (decompose n).symm.toAddMonoidHom.comp
      (((milnorK.map f (n + 1)).prodMap (milnorK.map f n)).comp (decompose n).toAddMonoidHom)

theorem map_id (n : ℕ) : map (RingHom.id k) n = AddMonoidHom.id _ := by
  sorry

theorem map_comp {k' : Type v} {k'' : Type w} [Field k'] [Field k''] (f : k →+* k')
    (g : k' →+* k'') (n : ℕ) : map (g.comp f) n = (map g n).comp (map f n) := by
  sorry

theorem «map_Π» {k' : Type v} [Field k'] (f : k →+* k') : map f 1 «Π» = «Π» := by
  sorry

end serreAlgebra

section SerreTests

variable [Fact (Nat.Prime 5)]

-- test serreAlgebra_pi_sq_F5 (computation)
example : serreAlgebra.mul serreAlgebra.«Π» serreAlgebra.«Π» =
      serreAlgebra.mul (serreAlgebra.of 1 (milnorK.symbol ![ZMod.unitOfCoprime 4 (by norm_num : Nat.Coprime 4 5)]))
        serreAlgebra.«Π» ∧
    milnorK.symbol ![ZMod.unitOfCoprime 4 (by norm_num : Nat.Coprime 4 5)] ≠ 0 := by
  sorry

-- test serreAlgebra_pi_sq_char_two (degenerate)
example {k : Type u} [Field k] [CharP k 2] :
    serreAlgebra.mul (serreAlgebra.«Π» (k := k)) serreAlgebra.«Π» = 0 := by
  sorry

-- test serreAlgebra_anticomm_F5 (characterisation)
example : serreAlgebra.mul serreAlgebra.«Π»
      (serreAlgebra.of 1 (milnorK.symbol ![ZMod.unitOfCoprime 2 (by norm_num : Nat.Coprime 2 5)])) =
      serreAlgebra.mul (serreAlgebra.of 1 (milnorK.symbol ![ZMod.unitOfCoprime 3 (by norm_num : Nat.Coprime 3 5)]))
        serreAlgebra.«Π» ∧
    serreAlgebra.mul serreAlgebra.«Π»
      (serreAlgebra.of 1 (milnorK.symbol ![ZMod.unitOfCoprime 2 (by norm_num : Nat.Coprime 2 5)])) ≠
      serreAlgebra.mul (serreAlgebra.of 1 (milnorK.symbol ![ZMod.unitOfCoprime 2 (by norm_num : Nat.Coprime 2 5)]))
        serreAlgebra.«Π» := by
  sorry

-- test serreAlgebra_lambda (compatibility)
example {k : Type u} [Field k] :
    (∀ (n : ℕ) (x : milnorK k n), serreAlgebra.lambdaHom n (serreAlgebra.of n x) = x) ∧
      serreAlgebra.lambdaHom 1 (serreAlgebra.«Π» (k := k)) = 0 := by
  sorry

-- test serreAlgebra_not_square_zero (non-example)
/- `d(5) d(-5) = Π·({-1} + Π) = 0` in `L(𝔽₅)`, as `{5, -5} = 0` requires; with `Π² = 0` only the
term `Π·{-1}` would survive, and it is nonzero. -/
example : serreAlgebra.mul serreAlgebra.«Π»
      (serreAlgebra.of 1 (milnorK.symbol ![(-1 : (ZMod 5)ˣ)]) + serreAlgebra.«Π») = 0 ∧
    serreAlgebra.mul serreAlgebra.«Π» (serreAlgebra.of 1 (milnorK.symbol ![(-1 : (ZMod 5)ˣ)])) ≠
      0 := by
  sorry

end SerreTests

end TauCeti.MilnorK

namespace TauCeti.TameSymbol

open TauCeti.MilnorK TauCeti.Steinberg


variable {F : Type u} [Field F]

/-- The unit part `u_f = f · t^{-ord f}` of `f` against a uniformiser `t` (a real definition;
the membership in the unit group is `ord u_f = 0`). -/
def unitPart (v : Valuation F ℤᵐ⁰) (t : Fˣ) (ht : v.ord (t : F) = 1) (f : Fˣ) :
    v.valuationSubring.unitGroup :=
  ⟨f * t ^ (-v.ord (f : F)), by sorry⟩

/-- Serre's map on `Fˣ` (`K2SymbolsBrauer:T.3/serre-map-steinberg`), a real definition:
`d_t(u · t^i) = {ū} + i · Π ∈ L(k)_1`. -/
def serreMapOne (v : Valuation F ℤᵐ⁰) (t : Fˣ) (ht : v.ord (t : F) = 1) (f : Fˣ) :
    serreAlgebra (ResidueField v) 1 :=
  (serreAlgebra.decompose 0).symm
    (milnorK.symbol ![res v (unitPart v t ht f)], v.ord (f : F) • milnorK.one)

/-- **Serre's map** `d_t : K^M_*(F) → L(k)` (`K2SymbolsBrauer:T.3/higher-milnor-residues`), the
graded ring homomorphism with `d_t{f} = {ū_f} + ord(f) · Π` (`serreMap_symbol`, `serreMap_mul`). -/
def serreMap (v : Valuation F ℤᵐ⁰) (hv : Function.Surjective v) (t : Fˣ)
    (ht : v.ord (t : F) = 1) (n : ℕ) : milnorK F n →+ serreAlgebra (ResidueField v) n :=
  sorry

/-- **The higher residue** `∂_v : K^M_{n+1}(F) → K^M_n(k)`, the `Π`-coefficient of `d_t` with Π on
the right; it does not depend on `t` (`milnorResidue_indep`). -/
def milnorResidue (v : Valuation F ℤᵐ⁰) (hv : Function.Surjective v) (n : ℕ) :
    milnorK F (n + 1) →+ milnorK (ResidueField v) n :=
  sorry

/-- **The specialisation** `λ_t : K^M_n(F) → K^M_n(k)`, the `Π`-free part of `d_t`; it depends on
`t` (`K2SymbolsBrauer:T.3/specialisation-change-of-uniformiser`). -/
def milnorSpecialisation (v : Valuation F ℤᵐ⁰) (hv : Function.Surjective v) (t : Fˣ)
    (ht : v.ord (t : F) = 1) (n : ℕ) : milnorK F n →+ milnorK (ResidueField v) n :=
  sorry

variable (v : Valuation F ℤᵐ⁰) (hv : Function.Surjective v) (t : Fˣ) (ht : v.ord (t : F) = 1)

/-- `d_t` in degree one is Serre's map on `Fˣ`. -/
theorem serreMap_symbol (f : Fˣ) : serreMap v hv t ht 1 (milnorK.symbol ![f]) = serreMapOne v t ht f := by
  sorry

/-- `d_t` is multiplicative. -/
theorem serreMap_mul {i j : ℕ} (x : milnorK F i) (y : milnorK F j) :
    serreMap v hv t ht (i + j) (milnorK.mul x y) =
      serreAlgebra.mul (serreMap v hv t ht i x) (serreMap v hv t ht j y) := by
  sorry

@[simp]
theorem milnorResidue_symbol_units_uniformizer {n : ℕ} (u : Fin n → v.valuationSubring.unitGroup) :
    milnorResidue v hv n (milnorK.symbol (Fin.snoc (α := fun _ => Fˣ) (fun i => (u i : Fˣ)) t)) =
      milnorK.symbol fun i => res v (u i) := by
  sorry

@[simp]
theorem milnorResidue_symbol_units {n : ℕ} (u : Fin (n + 1) → v.valuationSubring.unitGroup) :
    milnorResidue v hv n (milnorK.symbol fun i => (u i : Fˣ)) = 0 := by
  sorry

@[simp]
theorem milnorSpecialisation_symbol {n : ℕ} (u : Fin n → v.valuationSubring.unitGroup)
    (e : Fin n → ℤ) :
    milnorSpecialisation v hv t ht n (milnorK.symbol fun i => (u i : Fˣ) * t ^ e i) =
      milnorK.symbol fun i => res v (u i) := by
  sorry

/-- `λ_t` is a graded ring homomorphism. -/
theorem milnorSpecialisation_mul {i j : ℕ} (x : milnorK F i) (y : milnorK F j) :
    milnorSpecialisation v hv t ht (i + j) (milnorK.mul x y) =
      milnorK.mul (milnorSpecialisation v hv t ht i x) (milnorSpecialisation v hv t ht j y) := by
  sorry

/-- In degree one `∂_v{f} = ord_v f`. -/
theorem milnorResidue_one (f : Fˣ) :
    milnorResidue v hv 0 (milnorK.symbol ![f]) = v.ord (f : F) • milnorK.one := by
  sorry

/-- In degree two `∂_v = tameSymbolHom v`, with no inversion. -/
theorem milnorResidue_two (x : milnorK F 2) :
    milnorK.oneEquiv (milnorResidue v hv 1 x) = tameSymbolHom v hv x := by
  sorry

/-- Theorem III.7.3's residue reads the coefficient with Π on the left,
`∂^{Wb}{t, u₂, …, u_{n+1}} = {ū₂, …, ū_{n+1}}`; the roadmap's residue gives `(-1)^n` times that,
i.e. `∂^{Wb} = (-1)^n ∂_v` on `K^M_{n+1}(F)` (both vanish on symbols of units). -/
theorem milnorResidue_kbook {n : ℕ} (u : Fin n → v.valuationSubring.unitGroup) :
    milnorResidue v hv n (milnorK.symbol (Fin.cons (α := fun _ => Fˣ) t fun i => (u i : Fˣ))) =
      (-1 : ℤ) ^ n • milnorK.symbol fun i => res v (u i) := by
  sorry

theorem milnorResidue_surjective (n : ℕ) : Function.Surjective (milnorResidue v hv n) := by
  sorry

theorem milnorSpecialisation_surjective (n : ℕ) :
    Function.Surjective (milnorSpecialisation v hv t ht n) := by
  sorry

/-- `∂_v` is the Π-coefficient of `d_t` for **every** uniformiser `t`. -/
theorem milnorResidue_indep {n : ℕ} (x : milnorK F (n + 1)) :
    milnorResidue v hv n x = (serreAlgebra.decompose n (serreMap v hv t ht (n + 1) x)).2 := by
  sorry

/-- `K2SymbolsBrauer:T.3/milnor-residue-product-formula` (Ex. III.7.10 as printed, which holds in
this normalisation): for `x ∈ K^M_{i+1}(F)`, `y ∈ K^M_{j+1}(F)`,
`∂(x y) = λ_t(x) ∂(y) + (-1)^{j+1} ∂(x) ρ_t(y)`, with `ρ_t = rhoHom ∘ d_t`,
`ρ_t{u t^m} = {(-1)^m ū}`. -/
theorem milnorResidue_product_formula {i j : ℕ} (x : milnorK F (i + 1)) (y : milnorK F (j + 1)) :
    milnorResidue v hv (i + 1 + j) (milnorK.mul x y) =
      milnorK.mul (milnorSpecialisation v hv t ht (i + 1) x) (milnorResidue v hv j y) +
        (-1 : ℤ) ^ (j + 1) • milnorK.cast (by omega)
          (milnorK.mul (milnorResidue v hv i x)
            (serreAlgebra.rhoHom (j + 1) (serreMap v hv t ht (j + 1) y))) := by
  sorry

/-- The product formula (`K2SymbolsBrauer:T.3/milnor-residue-product-formula`). -/
theorem milnorResidue_mul {i j : ℕ} (x : milnorK F (i + 1)) (y : milnorK F (j + 1)) :
    milnorResidue v hv (i + 1 + j) (milnorK.mul x y) =
      milnorK.mul (milnorSpecialisation v hv t ht (i + 1) x) (milnorResidue v hv j y) +
        (-1 : ℤ) ^ (j + 1) • milnorK.cast (by omega)
          (milnorK.mul (milnorResidue v hv i x)
            (serreAlgebra.rhoHom (j + 1) (serreMap v hv t ht (j + 1) y))) :=
  milnorResidue_product_formula v hv t ht x y

/-- `K2SymbolsBrauer:T.3/milnor-residue-product-formula`, the module form: `∂_v(x y) = x̄ ∂_v(y)`
when `x` is a symbol of units, so `∂_v` is left linear over the image of `K^M_*(R^×)`. -/
theorem milnorResidue_product_formula_units {i j : ℕ} (u : Fin (i + 1) → v.valuationSubring.unitGroup)
    (y : milnorK F (j + 1)) :
    milnorResidue v hv (i + 1 + j) (milnorK.mul (milnorK.symbol fun l => (u l : Fˣ)) y) =
      milnorK.mul (milnorK.symbol fun l => res v (u l)) (milnorResidue v hv j y) := by
  sorry

/-- `K2SymbolsBrauer:T.3/serre-map-steinberg`: `d_t` is a homomorphism on `Fˣ`. -/
theorem serreMapOne_mul (f g : Fˣ) :
    serreMapOne v t ht (f * g) = serreMapOne v t ht f + serreMapOne v t ht g := by
  sorry

/-- `K2SymbolsBrauer:T.3/serre-map-steinberg`: `d_t(r) d_t(1 - r) = 0` in `L(k)_2` for
`r ≠ 0, 1` (the last case reduces to `d(x) d(-x) = 0`, which needs `Π² = {-1}Π`). -/
theorem serre_map_steinberg (r : Fˣ) (hr : (r : F) ≠ 1) :
    serreAlgebra.mul (serreMapOne v t ht r)
      (serreMapOne v t ht (Units.mk0 (1 - (r : F)) (sub_ne_zero.mpr hr.symm))) = 0 := by
  sorry

/-- `K2SymbolsBrauer:T.3/serre-map-kernel` (Ex. III.7.2): the kernel of
`d_t : K^M_{n+1}(F) → L(k)_{n+1}` is `U¹ · K^M_n(F)`, generated by the `y · {a}` with
`a ∈ U¹ = 1 + 𝔪` (equivalently the `{a} · y`, by graded commutativity). -/
theorem serre_map_kernel (n : ℕ) :
    (serreMap v hv t ht (n + 1)).ker = AddSubgroup.closure {z | ∃ (a : Fˣ) (y : milnorK F n),
      a ∈ v.valuationSubring.principalUnitGroup ∧ z = milnorK.mul y (milnorK.symbol ![a])} := by
  sorry

/-- `K2SymbolsBrauer:T.3/specialisation-change-of-uniformiser` (Ex. III.7.1 as corrected by the
errata): for `t' = c t`, `∂_v` is unchanged and `λ_{t'}(x) = λ_t(x) - ∂_v(x) · {c̄}`. -/
theorem specialisation_change_of_uniformiser (c : v.valuationSubring.unitGroup)
    (ht' : v.ord (((c : Fˣ) * t : Fˣ) : F) = 1) {n : ℕ} (x : milnorK F (n + 1)) :
    (serreAlgebra.decompose n (serreMap v hv ((c : Fˣ) * t) ht' (n + 1) x)).2 =
        (serreAlgebra.decompose n (serreMap v hv t ht (n + 1) x)).2 ∧
      milnorSpecialisation v hv ((c : Fˣ) * t) ht' (n + 1) x =
        milnorSpecialisation v hv t ht (n + 1) x -
          milnorK.mul (milnorResidue v hv n x) (milnorK.symbol ![res v c]) := by
  sorry

/-- `K2SymbolsBrauer:T.3/higher-ramification-formula` (Ex. III.7.8; parented in `T.4`, one of the
elementary identities before Kato's theorem): for any field embedding with normalised
surjective valuations and positive ramification index `e`,
`∂_w(res_{E/F} x) = e · res_{k_w/k_v}(∂_v x)`. The source states the finite case;
the unit/uniformiser calculation also proves this generalisation. -/
theorem higher_ramification_formula {E : Type v} [Field E] [Algebra F E]
    (w : Valuation E ℤᵐ⁰) (hw : Function.Surjective w) (e : ℕ) (he : 0 < e)
    (hvw : ∀ r : F, w.ord (algebraMap F E r) = e * v.ord r) {n : ℕ} (x : milnorK F (n + 1)) :
    milnorResidue w hw n (milnorK.map (algebraMap F E) (n + 1) x) =
      e • milnorK.map (residueFieldMap v w e he hvw) n (milnorResidue v hv n x) := by
  sorry

-- test TauCeti.MilnorK.higher_ramification_infinite (compatibility)
-- The 5-adic Gauss valuation on ℚ(u) supplies w and hvw; k_w = F_5(u).
-- No FiniteDimensional ℚ (RatFunc ℚ) instance is assumed or requested.
example [Fact (Nat.Prime 5)] (w : Valuation (RatFunc ℚ) ℤᵐ⁰) (hw : Function.Surjective w)
    (hvw : ∀ r : ℚ, w.ord (algebraMap ℚ (RatFunc ℚ) r) = (Rat.padicValuation 5).ord r)
    (n : ℕ) (x : milnorK ℚ (n + 1)) :
    milnorResidue w hw n (milnorK.map (algebraMap ℚ (RatFunc ℚ)) (n + 1) x) =
      milnorK.map (residueFieldMap (Rat.padicValuation 5) w 1 (by decide)
        (by intro r; simpa using hvw r)) n
        (milnorResidue (Rat.padicValuation 5) (Rat.surjective_padicValuation 5) n x) := by
  simpa using higher_ramification_formula (Rat.padicValuation 5)
    (Rat.surjective_padicValuation 5) w hw 1 (by decide) (by intro r; simpa using hvw r) x

-- test TauCeti.MilnorK.higher_residue_trivial_restriction (degenerate)
-- In the constant extension F(t) → F(u)(t), the place t-u supplies this condition.
-- All imported entries are units; symbol generation extends zero to the whole group.
example {A B : Type u} [Field A] [Field B] (f : A →+* B)
    (w : Valuation B ℤᵐ⁰) (hw : Function.Surjective w)
    (htriv : ∀ a : Aˣ, w.ord (f a) = 0)
    (n : ℕ) (a : Fin (n + 1) → Aˣ) :
    milnorResidue w hw n
      (milnorK.map f (n + 1) (milnorK.symbol a)) = 0 := by
  -- Lift each f(a_i) to w.valuationSubring.unitGroup using htriv;
  -- map the symbol and apply milnorResidue_symbol_units.
  sorry

/-- `K2SymbolsBrauer:T.3/rigidity`: for `F` complete for `v` and `q` prime to `char k`,
`(λ_t, ∂_v) : K^M_{n+1}(F)/q → K^M_{n+1}(k)/q ⊕ K^M_n(k)/q` is bijective (stated as injectivity
and surjectivity modulo `q`). -/
theorem rigidity [IsAdicComplete (IsLocalRing.maximalIdeal v.valuationSubring) v.valuationSubring]
    (q : ℕ) (hq : 0 < q) (hqk : (q : ResidueField v) ≠ 0) (n : ℕ) :
    (∀ x : milnorK F (n + 1), (∃ y, ((milnorSpecialisation v hv t ht (n + 1)).prod
        (milnorResidue v hv n)) x = q • y) → ∃ z, x = q • z) ∧
      ∀ y : milnorK (ResidueField v) (n + 1) × milnorK (ResidueField v) n,
        ∃ x z, ((milnorSpecialisation v hv t ht (n + 1)).prod (milnorResidue v hv n)) x =
          y + q • z := by
  sorry

end TauCeti.TameSymbol

namespace TauCeti.TameSymbol

open TauCeti.MilnorK


variable {F : Type u} [Field F]

/-- `K2SymbolsBrauer:T.3/finite-support`: for a family of discrete valuations in which each
`f ∈ Fˣ` has nonzero order at finitely many members (the places of a function field,
`TauCeti.Place.finite_setOf_ord_ne_zero`; the height-one primes of a Dedekind domain), each
`x ∈ K^M_{n+1}(F)` has nonzero residue at finitely many members. -/
theorem finite_support {I : Type v} (v : I → Valuation F ℤᵐ⁰) (hv : ∀ i, Function.Surjective (v i))
    (hfin : ∀ f : Fˣ, {i | (v i).ord (f : F) ≠ 0}.Finite) (n : ℕ) (x : milnorK F (n + 1)) :
    {i | milnorResidue (v i) (hv i) n x ≠ 0}.Finite := by
  sorry

/-- `K2SymbolsBrauer:T.3/finite-support` in degree two: `∂_v{f, g} = 1` outside the union of the
supports of `f` and `g`. -/
theorem finite_support_tameSymbol {I : Type v} (v : I → Valuation F ℤᵐ⁰)
    (hv : ∀ i, Function.Surjective (v i)) (f g : Fˣ) :
    {i | tameSymbol (v i) (hv i) f g ≠ 1} ⊆
      {i | (v i).ord (f : F) ≠ 0} ∪ {i | (v i).ord (g : F) ≠ 0} := by
  sorry

/- `K2SymbolsBrauer:T.3/localization-boundary`: not stated here; the Quillen boundary
carrier is absent. Exact upstream input: GeneralAlgebraicKTheory K.3 constructs the ring
localization boundary on K₁ by the cone/cokernel of multiplication by a non-zero-divisor:
∂[s]=[R/sR] in K₀ of the torsion exact category (K.3/localization-degree-one-index).
For a DVR, dévissage gives ∂[π]=[k] and ∂[π^r u]=r[k] (K.3/dvr-degree-one-boundary).
This is not requested from downstream SchemeKTheoryOperations S.3.
K.3/localization-product-boundary, on K.7's products, supplies the RIGHT action
∂(x·j*y)=∂x·i*y, and K.7 the ordered unit product a·b={a,b}. Hence ∂{π,u}=ū;
skew-symmetry gives ∂{u,π}=ū⁻¹ and ∂{π,π}=−1. Expanding
f=π^r u, g=π^s v gives ∂{f,g}=(−1)^(rs) v̄^r ū^(−s)=tameSymbol v g f,
the inverse of the roadmap's symbol. This fixes the module-action side and owner without
constructing a second localization sequence. At 5, ∂{2,5}=3, tameSymbol 2 5=2. -/

/-! ### Unit tests for the higher residues -/

section ResidueTests

variable [Fact (Nat.Prime 5)]

local notation "⟪" q "⟫" => Units.mk0 (q : ℚ) (by norm_num)

-- test milnorResidue_degree_one (computation)
example (φ : ResidueField (Rat.padicValuation 5) →+* ZMod 5)
    (h5 : (Rat.padicValuation 5).ord ((⟪5⟫ : ℚˣ) : ℚ) = 1) :
    milnorK.zeroEquiv (milnorResidue (Rat.padicValuation 5) (Rat.surjective_padicValuation 5) 0
        (milnorK.symbol ![⟪50⟫])) = 2 ∧
      φ ↑(Additive.toMul (milnorK.oneEquiv (milnorSpecialisation (Rat.padicValuation 5)
        (Rat.surjective_padicValuation 5) ⟪5⟫ h5 1 (milnorK.symbol ![⟪50⟫])))) = 2 := by
  sorry

-- test milnorResidue_degree_two (compatibility)
example (φ : ResidueField (Rat.padicValuation 5) →+* ZMod 5) :
    φ ↑(Additive.toMul (milnorK.oneEquiv (milnorResidue (Rat.padicValuation 5)
        (Rat.surjective_padicValuation 5) 1 (milnorK.symbol ![⟪5⟫, ⟪2⟫])))) = 3 ∧
      φ (tameSymbol (Rat.padicValuation 5) (Rat.surjective_padicValuation 5) ⟪5⟫ ⟪2⟫) = 3 ∧
      φ ↑(Additive.toMul (milnorK.oneEquiv (milnorResidue (Rat.padicValuation 5)
        (Rat.surjective_padicValuation 5) 1 (milnorK.symbol ![⟪2⟫, ⟪5⟫])))) = 2 := by
  sorry

-- test milnorSpecialisation_depends_on_uniformizer (characterisation)
example (φ : ResidueField (Rat.padicValuation 5) →+* ZMod 5)
    (h5 : (Rat.padicValuation 5).ord ((⟪5⟫ : ℚˣ) : ℚ) = 1)
    (h10 : (Rat.padicValuation 5).ord ((⟪10⟫ : ℚˣ) : ℚ) = 1) :
    φ ↑(Additive.toMul (milnorK.oneEquiv (milnorSpecialisation (Rat.padicValuation 5)
        (Rat.surjective_padicValuation 5) ⟪5⟫ h5 1 (milnorK.symbol ![⟪5⟫])))) = 1 ∧
      φ ↑(Additive.toMul (milnorK.oneEquiv (milnorSpecialisation (Rat.padicValuation 5)
        (Rat.surjective_padicValuation 5) ⟪10⟫ h10 1 (milnorK.symbol ![⟪5⟫])))) = 3 ∧
      milnorResidue (Rat.padicValuation 5) (Rat.surjective_padicValuation 5) 0
        (milnorK.symbol ![⟪5⟫]) = milnorK.one := by
  sorry

-- test milnorResidue_needs_serre_relation (non-example)
/- `{5, -5} = 0` in `K^M_2(ℚ)`; in `L(k_{v₅})`, `d(5) d(-5) = Π·({-1} + Π) = 0`, whereas with
`Π² = 0` the value would be `Π·{-1} = {-1}Π ≠ 0`. -/
example : milnorK.symbol ![⟪5⟫, -⟪5⟫] = 0 ∧
    serreAlgebra.mul serreAlgebra.«Π»
      (serreAlgebra.of 1 (milnorK.symbol ![(-1 : (ResidueField (Rat.padicValuation 5))ˣ)]) +
        serreAlgebra.«Π») = 0 ∧
    serreAlgebra.mul serreAlgebra.«Π»
      (serreAlgebra.of 1 (milnorK.symbol ![(-1 : (ResidueField (Rat.padicValuation 5))ˣ)])) ≠ 0 := by
  sorry

end ResidueTests

section RatFuncTests

/-- The constants of `ℚ(t)` in the residue field of the place `P` (a real definition). -/
def placeConst {k : Type u} [Field k] (P : Place k (RatFunc k)) : k →+* ResidueField P.valuation :=
  (residueFieldCongr (valuationSubring_eq_integers P)).symm.toRingHom.comp
    (algebraMap k P.ResidueField)

/-- A constant of `k(t)` as a unit (a real definition). -/
def constUnit {k : Type u} [Field k] (c : kˣ) : (RatFunc k)ˣ :=
  Units.map (algebraMap k (RatFunc k)).toMonoidHom c

/-- The variable `t` of `k(t)` as a unit. -/
def varUnit (k : Type u) [Field k] : (RatFunc k)ˣ := Units.mk0 RatFunc.X RatFunc.X_ne_zero

-- test milnorResidue_degree_three_position (computation)
/- At the `t`-adic place of `k(t)`: `∂{t, c, d} = {c, d}` and `∂{c, t, d} = -{c, d}`; for
`k = ℚ`, `c = 5`, `d = 2` these differ in `K^M_2(ℚ)` (the tame symbol at `5` sends them to `3`
and `2`), which is the third conjunct. -/
example {k : Type u} [Field k] (c d : kˣ) :
    milnorResidue (Place.adicOfIrreducible (Polynomial.irreducible_X (R := k))).valuation
        (Place.adicOfIrreducible (Polynomial.irreducible_X (R := k))).valuation_surjective 2
        (milnorK.symbol ![varUnit k, constUnit c, constUnit d]) =
      milnorK.map (placeConst (Place.adicOfIrreducible (Polynomial.irreducible_X (R := k)))) 2
        (milnorK.symbol ![c, d]) ∧
    milnorResidue (Place.adicOfIrreducible (Polynomial.irreducible_X (R := k))).valuation
        (Place.adicOfIrreducible (Polynomial.irreducible_X (R := k))).valuation_surjective 2
        (milnorK.symbol ![constUnit c, varUnit k, constUnit d]) =
      -milnorK.map (placeConst (Place.adicOfIrreducible (Polynomial.irreducible_X (R := k)))) 2
        (milnorK.symbol ![c, d]) ∧
    milnorK.symbol ![Units.mk0 (5 : ℚ) (by norm_num), Units.mk0 (2 : ℚ) (by norm_num)] ≠
      -milnorK.symbol ![Units.mk0 (5 : ℚ) (by norm_num), Units.mk0 (2 : ℚ) (by norm_num)] := by
  sorry

-- test milnorResidue_units (degenerate)
/- Symbols of units have zero residue; at the `t`-adic place of `k(t)` (for `k = ℚ` in the
source) `∂_t` vanishes on the image of `K^M_*(k)` and `λ_t` restricts to the identity there. -/
example {k : Type u} [Field k]
    (ht : (Place.adicOfIrreducible (Polynomial.irreducible_X (R := k))).valuation.ord
      ((varUnit k : (RatFunc k)ˣ) : RatFunc k) = 1) :
    (∀ (n : ℕ) (u : Fin (n + 1) →
        (Place.adicOfIrreducible (Polynomial.irreducible_X (R := k))).valuation.valuationSubring.unitGroup),
      milnorResidue (Place.adicOfIrreducible (Polynomial.irreducible_X (R := k))).valuation
        (Place.adicOfIrreducible (Polynomial.irreducible_X (R := k))).valuation_surjective n
        (milnorK.symbol fun i => (u i : (RatFunc k)ˣ)) = 0) ∧
    (∀ (n : ℕ) (x : milnorK k (n + 1)),
      milnorResidue (Place.adicOfIrreducible (Polynomial.irreducible_X (R := k))).valuation
        (Place.adicOfIrreducible (Polynomial.irreducible_X (R := k))).valuation_surjective n
        (milnorK.map (algebraMap k (RatFunc k)) (n + 1) x) = 0) ∧
    ∀ (n : ℕ) (x : milnorK k n),
      milnorSpecialisation (Place.adicOfIrreducible (Polynomial.irreducible_X (R := k))).valuation
        (Place.adicOfIrreducible (Polynomial.irreducible_X (R := k))).valuation_surjective
        (varUnit k) ht n (milnorK.map (algebraMap k (RatFunc k)) n x) =
      milnorK.map (placeConst (Place.adicOfIrreducible (Polynomial.irreducible_X (R := k)))) n x := by
  sorry

end RatFuncTests

end TauCeti.TameSymbol

/-! ## `K2SymbolsBrauer:T.4` — the Bass–Tate sequence, Milnor transfers and Weil reciprocity

Convention (pinned): the transfer is normalised by `-∂_∞ = Σ_p N_p ∘ ∂_p` on `K^M_{n+1} F(t)`,
the residues being those of `T.3/higher-milnor-residues` (Π on the right). -/

namespace TauCeti.MilnorK

open TauCeti.TameSymbol


variable {F : Type u} [Field F]

/-- The monic irreducible polynomials of `F[t]`: the finite places of `F(t)`. -/
abbrev MonicIrreducible (F : Type u) [Field F] := {q : F[X] // q.Monic ∧ Irreducible q}

/-- The valuation of the finite place of `q`, Tau Ceti's `TauCeti.Place.adicOfIrreducible`. -/
abbrev placeVal (q : MonicIrreducible F) : Valuation (RatFunc F) ℤᵐ⁰ :=
  (Place.adicOfIrreducible q.2.2).valuation

/-- The residue `∂_q : K^M_{n+1} F(t) → K^M_n(k_q)` at the finite place `q`. -/
def residueAt (q : MonicIrreducible F) (n : ℕ) :
    milnorK (RatFunc F) (n + 1) →+ milnorK (TameSymbol.ResidueField (placeVal q)) n :=
  milnorResidue (placeVal q) (Place.adicOfIrreducible q.2.2).valuation_surjective n

/-- The residue field at infinity is `F` (`TauCeti.Place.inftyResidueFieldEquiv`, read in the
valuation subring; a real definition). -/
def inftyResidueEquiv (F : Type u) [Field F] :
    TameSymbol.ResidueField (Place.infty F).valuation ≃+* F :=
  (residueFieldCongr (valuationSubring_eq_integers (Place.infty F))).trans
    (Place.inftyResidueFieldEquiv F).symm.toRingEquiv

/-- The residue `∂_∞ : K^M_{n+1} F(t) → K^M_n(F)` at the place at infinity. -/
def residueInfty (n : ℕ) : milnorK (RatFunc F) (n + 1) →+ milnorK F n :=
  (milnorK.map (inftyResidueEquiv F).toRingHom n).comp
    (milnorResidue (Place.infty F).valuation (Place.infty F).valuation_surjective n)

/-- The transfer `N_q : K^M_n(k_q) → K^M_n(F)` of the residue field of the finite place `q`: the
unique homomorphisms with `-∂_∞ = Σ_q N_q ∘ ∂_q` (`residueInfty_eq_neg_sum_transfer`), which exist
because the residue sum is onto with kernel `K^M_{n+1}(F)` (`bass_tate_sequence`). -/
def placeTransfer (q : MonicIrreducible F) (n : ℕ) :
    milnorK (TameSymbol.ResidueField (placeVal q)) n →+ milnorK F n :=
  sorry

/-- `F⟮a⟯ ≃ F[t]/(π) ≃ k_π` for `π` the minimal polynomial of `a` (a real definition). -/
def simpleResidueEquiv {E : Type v} [Field E] [Algebra F E] (a : E) (ha : IsIntegral F a) :
    TameSymbol.ResidueField (placeVal ⟨minpoly F a, minpoly.monic ha, minpoly.irreducible ha⟩)
      ≃+* F⟮a⟯ :=
  (residueFieldCongr (valuationSubring_eq_integers
      (Place.adicOfIrreducible (minpoly.irreducible ha)))).trans
    ((Place.adicOfIrreducibleResidueFieldEquiv (minpoly.irreducible ha)).symm.toRingEquiv.trans
      (IntermediateField.adjoinRootEquivAdjoin F ha).toRingEquiv)

/-- **The simple transfer** `N_{a/F} : K^M_n(F⟮a⟯) → K^M_n(F)`
(`K2SymbolsBrauer:T.4/simple-transfer`, Definition III.7.5): `N_π` transported to `F⟮a⟯` by
`F⟮a⟯ ≃ F[t]/(π)`, `π` the minimal polynomial of `a`. Independence of `a` is Kato's theorem
(`milnor_transfer_transitivity_simple`), not part of the definition. -/
def milnorTransferSimple (F : Type u) [Field F] {E : Type v} [Field E] [Algebra F E] (a : E)
    (ha : IsIntegral F a) (n : ℕ) : milnorK F⟮a⟯ n →+ milnorK F n :=
  (placeTransfer ⟨minpoly F a, minpoly.monic ha, minpoly.irreducible ha⟩ n).comp
    (milnorK.map (simpleResidueEquiv a ha).symm.toRingHom n)

variable {E : Type v} [Field E] [Algebra F E] (a : E) (ha : IsIntegral F a)

/-- `K2SymbolsBrauer:T.4/transfer-low-degrees` (Exercise III.7.5): in degree one `N_{a/F}` is the
field norm `Algebra.norm F`. For `ℚ(∛2)/ℚ`, the factor `π(0) = -2` and the sign `(-1)^{de} = -1`
give `N(∛2) = 2`. -/
theorem transfer_low_degrees (x : (F⟮a⟯)ˣ) :
    milnorTransferSimple F a ha 1 (milnorK.symbol ![x]) =
      milnorK.symbol ![Units.map (Algebra.norm F : F⟮a⟯ →* F) x] := by
  sorry

/-- `K2SymbolsBrauer:T.4/milnor-projection-formula`: `N_{a/F}(res(x) · y) = x · N_{a/F}(y)`. -/
theorem milnor_projection_formula {i j : ℕ} (x : milnorK F i) (y : milnorK F⟮a⟯ j) :
    milnorTransferSimple F a ha (i + j) (milnorK.mul (milnorK.map (algebraMap F F⟮a⟯) i x) y) =
      milnorK.mul x (milnorTransferSimple F a ha j y) := by
  sorry

/-- `K2SymbolsBrauer:T.4/restriction-transfer-degree`: `N_{a/F} ∘ res = [F⟮a⟯ : F]`. -/
theorem restriction_transfer_degree {n : ℕ} (x : milnorK F n) :
    milnorTransferSimple F a ha n (milnorK.map (algebraMap F F⟮a⟯) n x) =
      Module.finrank F F⟮a⟯ • x := by
  sorry

/-- `K2SymbolsBrauer:T.4/restriction-transfer-degree`: the kernel of `res_{F⟮a⟯/F}` is killed by
`[F⟮a⟯ : F]`. -/
theorem restriction_transfer_degree_ker {n : ℕ} (x : milnorK F n)
    (hx : milnorK.map (algebraMap F F⟮a⟯) n x = 0) : Module.finrank F F⟮a⟯ • x = 0 := by
  sorry

/-- The defining property: if `∂_π(y)` corresponds to `x` and `∂_p(y) = 0` for `p ≠ π`, then
`N_{a/F}(x) = -∂_∞(y)`. -/
theorem milnorTransferSimple_eq_neg_residueInfty {n : ℕ} (y : milnorK (RatFunc F) (n + 1))
    (x : milnorK F⟮a⟯ n)
    (hx : milnorK.map (simpleResidueEquiv a ha).toRingHom n
      (residueAt ⟨minpoly F a, minpoly.monic ha, minpoly.irreducible ha⟩ n y) = x)
    (hy : ∀ p : MonicIrreducible F, p.1 ≠ minpoly F a → residueAt p n y = 0) :
    milnorTransferSimple F a ha n x = -residueInfty n y := by
  sorry

/-- Weil's formula III.7.5.1: `-∂_∞(y) = Σ_p N_p(∂_p y)`, a finite sum. -/
theorem residueInfty_eq_neg_sum_transfer {n : ℕ} (y : milnorK (RatFunc F) (n + 1)) :
    -residueInfty n y = ∑ᶠ p : MonicIrreducible F, placeTransfer p n (residueAt p n y) := by
  sorry

@[simp]
theorem milnorTransferSimple_degree_zero (m : milnorK F⟮a⟯ 0) :
    milnorK.zeroEquiv (milnorTransferSimple F a ha 0 m) =
      (Module.finrank F F⟮a⟯ : ℤ) * milnorK.zeroEquiv m := by
  sorry

/-- If `a ∈ F` then `N_{a/F}` is the identity (read through `F ≃ F⟮a⟯`). -/
@[simp]
theorem milnorTransferSimple_of_mem (c : F)
    (hc : IsIntegral F (algebraMap F E c)) {n : ℕ} (x : milnorK F n) :
    milnorTransferSimple F (algebraMap F E c) hc n
      (milnorK.map (algebraMap F F⟮algebraMap F E c⟯) n x) = x := by
  sorry

/-- The projection formula (`K2SymbolsBrauer:T.4/milnor-projection-formula`). -/
theorem milnorTransferSimple_mul_restrict {i j : ℕ} (x : milnorK F i) (y : milnorK F⟮a⟯ j) :
    milnorTransferSimple F a ha (i + j) (milnorK.mul (milnorK.map (algebraMap F F⟮a⟯) i x) y) =
      milnorK.mul x (milnorTransferSimple F a ha j y) :=
  milnor_projection_formula a ha x y

/-- The degree formula (`K2SymbolsBrauer:T.4/restriction-transfer-degree`). -/
theorem milnorTransferSimple_restrict {n : ℕ} (x : milnorK F n) :
    milnorTransferSimple F a ha n (milnorK.map (algebraMap F F⟮a⟯) n x) =
      Module.finrank F F⟮a⟯ • x :=
  restriction_transfer_degree a ha x

/-- In degree one `N_{a/F}` is `Algebra.norm F` (`K2SymbolsBrauer:T.4/transfer-low-degrees`). -/
theorem milnorTransferSimple_one_eq_norm (x : (F⟮a⟯)ˣ) :
    milnorTransferSimple F a ha 1 (milnorK.symbol ![x]) =
      milnorK.symbol ![Units.map (Algebra.norm F : F⟮a⟯ →* F) x] :=
  transfer_low_degrees a ha x

/-- `N_{a/F}` is the same with Theorem III.7.3's residues `∂^{Wb} = (-1)^n ∂` on `K^M_{n+1}`:
every residue in the defining identity changes by the same sign. -/
theorem milnorTransferSimple_kbook {n : ℕ} (y : milnorK (RatFunc F) (n + 1)) (x : milnorK F⟮a⟯ n)
    (hx : milnorK.map (simpleResidueEquiv a ha).toRingHom n
      ((-1 : ℤ) ^ n • residueAt ⟨minpoly F a, minpoly.monic ha, minpoly.irreducible ha⟩ n y) = x)
    (hy : ∀ p : MonicIrreducible F, p.1 ≠ minpoly F a → (-1 : ℤ) ^ n • residueAt p n y = 0) :
    milnorTransferSimple F a ha n x = -((-1 : ℤ) ^ n • residueInfty n y) := by
  sorry

/-- The minimal polynomial `π` of `a` as a unit of `F(t)`. -/
def minpolyUnit (F : Type u) [Field F] {E : Type v} [Field E] [Algebra F E] (a : E)
    (ha : IsIntegral F a) : (RatFunc F)ˣ :=
  Units.mk0 (algebraMap F[X] (RatFunc F) (minpoly F a)) (RatFunc.algebraMap_ne_zero (minpoly.ne_zero ha))

-- test milnorTransferSimple_degree_zero_eq (computation)
/- `N_{a/F}(1) = d`, from `y = π`: `∂_π(π) = 1` and `∂_∞(π) = -d`. -/
example : milnorK.zeroEquiv (milnorTransferSimple F a ha 0 milnorK.one) = Module.finrank F F⟮a⟯ ∧
    residueAt ⟨minpoly F a, minpoly.monic ha, minpoly.irreducible ha⟩ 0
      (milnorK.symbol ![minpolyUnit F a ha]) = milnorK.one ∧
    milnorK.zeroEquiv (residueInfty 0 (milnorK.symbol ![minpolyUnit F a ha])) =
      -(Module.finrank F F⟮a⟯ : ℤ) := by
  sorry

-- test milnorTransferSimple_of_mem_eq_id (degenerate)
/- If `a ∈ F` (`π = t - a`), `N_{a/F} = id`. In this roadmap's normalisation (Π on the right) the
witness is `y = {x, t - a}`, with `∂_{t-a}(y) = x` and `∂_∞(y) = -x`; the packet's
`y = {t - a, x}` has residues `(-1)^n x` and `-(-1)^n x` (`{t - a, x} = (-1)^n {x, t - a}`). -/
example (c : F) (n : ℕ) (x : milnorK F n) :
    residueAt ⟨Polynomial.X - Polynomial.C c, Polynomial.monic_X_sub_C c,
        Polynomial.irreducible_X_sub_C c⟩ n
      (milnorK.mul (milnorK.map (algebraMap F (RatFunc F)) n x)
        (milnorK.symbol ![Units.mk0 (algebraMap F[X] (RatFunc F) (Polynomial.X - Polynomial.C c))
          (RatFunc.algebraMap_ne_zero (Polynomial.X_sub_C_ne_zero c))])) =
      milnorK.map (placeConst (Place.adicOfIrreducible (Polynomial.irreducible_X_sub_C c))) n x ∧
    residueInfty n (milnorK.mul (milnorK.map (algebraMap F (RatFunc F)) n x)
        (milnorK.symbol ![Units.mk0 (algebraMap F[X] (RatFunc F) (Polynomial.X - Polynomial.C c))
          (RatFunc.algebraMap_ne_zero (Polynomial.X_sub_C_ne_zero c))])) = -x := by
  sorry

-- test milnorTransferSimple_one_eq_algebraNorm (compatibility)
/- For `ℚ(i)/ℚ`, `N(1 + i) = 2`, read in `ℂ ⊇ ℚ⟮i⟯`. -/
example (hI : IsIntegral ℚ Complex.I)
    (h : (1 + IntermediateField.AdjoinSimple.gen ℚ Complex.I : ℚ⟮Complex.I⟯) ≠ 0) :
    milnorTransferSimple ℚ Complex.I hI 1 (milnorK.symbol ![Units.mk0 _ h]) =
      milnorK.symbol ![Units.mk0 (2 : ℚ) (by norm_num)] := by
  sorry

-- test milnorTransferSimple_sign (non-example)
/- The sign is forced: `∂_∞(π) = -[F⟮a⟯ : F]` while `N_{a/F}(1) = [F⟮a⟯ : F]`, so the maps defined
by `+∂_∞ = Σ N_p ∂_p` would give `N_{a/F}(1) = -[F⟮a⟯ : F]`. -/
example (hd : Module.finrank F F⟮a⟯ ≠ 0) :
    milnorK.zeroEquiv (residueInfty 0 (milnorK.symbol ![minpolyUnit F a ha])) ≠
      milnorK.zeroEquiv (milnorTransferSimple F a ha 0 milnorK.one) := by
  sorry

-- test milnorTransferSimple_projection_linear (characterisation)
/- `N_{a/F}{c, a - d} = {c, N(a - d)}` for `c ∈ Fˣ`, `d ∈ F`. -/
example (c : Fˣ) (d : F)
    (h : (IntermediateField.AdjoinSimple.gen F a - algebraMap F F⟮a⟯ d : F⟮a⟯) ≠ 0) :
    milnorTransferSimple F a ha 2
        (milnorK.symbol ![Units.map (algebraMap F F⟮a⟯).toMonoidHom c, Units.mk0 _ h]) =
      milnorK.symbol ![c, Units.map (Algebra.norm F : F⟮a⟯ →* F) (Units.mk0 _ h)] := by
  sorry

end TauCeti.MilnorK

namespace TauCeti.MilnorK

open TauCeti.TameSymbol


variable {F : Type u} [Field F]

/-- The Milnor norm `N_{E/F} : K^M_n(E) → K^M_n(F)` of a finite extension, the composite of simple
transfers along any generating tower, well defined by Kato's theorem
(`K2SymbolsBrauer:T.4/milnor-transfer-transitivity`). -/
def milnorNorm (F : Type u) [Field F] (E : Type v) [Field E] [Algebra F E] (n : ℕ) :
    milnorK E n →+ milnorK F n :=
  sorry

/-- The Milnor norm along a field homomorphism `K → L` (a real definition from `milnorNorm`). -/
def milnorNormOf {K : Type u} {L : Type v} [Field K] [Field L] (f : K →+* L) (n : ℕ) :
    milnorK L n →+ milnorK K n :=
  letI := f.toAlgebra
  milnorNorm K L n

/-- `K2SymbolsBrauer:T.4/milnor-transfer-transitivity` (Kato): `N_{E/F} = N_{K/F} ∘ N_{E/K}` for
every intermediate field. -/
theorem milnor_transfer_transitivity {K : Type v} {E : Type w} [Field K] [Field E] [Algebra F K]
    [Algebra K E] [Algebra F E] [IsScalarTower F K E] [FiniteDimensional F K]
    [FiniteDimensional K E] (n : ℕ) :
    milnorNorm F E n = (milnorNorm F K n).comp (milnorNorm K E n) := by
  sorry

/-- `K2SymbolsBrauer:T.4/milnor-transfer-transitivity`: for a simple extension `N_{F⟮a⟯/F} = N_{a/F}`
for **every** generator `a` (not part of the definition of the simple transfer). -/
theorem milnor_transfer_transitivity_simple {E : Type v} [Field E] [Algebra F E] (a : E)
    (ha : IsIntegral F a) (n : ℕ) : milnorNorm F F⟮a⟯ n = milnorTransferSimple F a ha n := by
  sorry

/-- `K2SymbolsBrauer:T.4/milnor-transfer-transitivity`: in degree zero `N_{E/F}` is multiplication
by `[E : F]`. -/
theorem milnor_transfer_transitivity_degree_zero {E : Type v} [Field E] [Algebra F E]
    [FiniteDimensional F E] (m : milnorK E 0) :
    milnorK.zeroEquiv (milnorNorm F E 0 m) = (Module.finrank F E : ℤ) * milnorK.zeroEquiv m := by
  sorry

/-- `K2SymbolsBrauer:T.4/milnor-transfer-transitivity`: in degree one `N_{E/F}` is
`Algebra.norm F`, whose transitivity is the pinned `Algebra.norm_norm`. -/
theorem milnor_transfer_transitivity_degree_one {E : Type v} [Field E] [Algebra F E]
    [FiniteDimensional F E] (x : Eˣ) :
    milnorNorm F E 1 (milnorK.symbol ![x]) =
      milnorK.symbol ![Units.map (Algebra.norm F : E →* F) x] := by
  sorry

/-- `K2SymbolsBrauer:T.4/milnor-projection-formula` for the Milnor norm of a finite extension. -/
theorem milnor_projection_formula_milnorNorm {E : Type v} [Field E] [Algebra F E]
    [FiniteDimensional F E] {i j : ℕ} (x : milnorK F i) (y : milnorK E j) :
    milnorNorm F E (i + j) (milnorK.mul (milnorK.map (algebraMap F E) i x) y) =
      milnorK.mul x (milnorNorm F E j y) := by
  sorry

/-- `K2SymbolsBrauer:T.4/restriction-transfer-degree` for the Milnor norm, degrees multiplying
along a tower. -/
theorem restriction_transfer_degree_milnorNorm {E : Type v} [Field E] [Algebra F E]
    [FiniteDimensional F E] {n : ℕ} (x : milnorK F n) :
    milnorNorm F E n (milnorK.map (algebraMap F E) n x) = Module.finrank F E • x := by
  sorry

/-- `x⁻¹` as a unit of `F(t)`: the uniformiser at infinity (`TauCeti.Place.isUniformizer_infty`). -/
def inftyUniformizer (F : Type u) [Field F] : (RatFunc F)ˣ :=
  Units.mk0 (RatFunc.X⁻¹) (inv_ne_zero RatFunc.X_ne_zero)

theorem ord_infty_X_inv (F : Type u) [Field F] :
    (Place.infty F).valuation.ord ((inftyUniformizer F : (RatFunc F)ˣ) : RatFunc F) = 1 := by
  sorry

/-- The leading coefficient `lead(f)` of a nonzero rational function (the denominator is monic,
so it is the leading coefficient of the numerator). -/
def leadUnit (f : (RatFunc F)ˣ) : Fˣ :=
  Units.mk0 (f : RatFunc F).num.leadingCoeff (by simp [RatFunc.num_ne_zero f.ne_zero])

/-- `K2SymbolsBrauer:T.4/leading-coefficient-splitting` (Example III.7.3.2): the specialisation at
infinity with respect to `t⁻¹` is `{f₁, …, fₙ} ↦ {lead f₁, …, lead fₙ}`, it is the identity on the
image of `K^M_n(F)`, and `∂_∞` vanishes there. -/
theorem leading_coefficient_splitting (n : ℕ) (f : Fin n → (RatFunc F)ˣ) :
    milnorSpecialisation (Place.infty F).valuation (Place.infty F).valuation_surjective
        (inftyUniformizer F) (ord_infty_X_inv F) n (milnorK.symbol f) =
      milnorK.map (placeConst (Place.infty F)) n (milnorK.symbol fun i => leadUnit (f i)) ∧
    (∀ x : milnorK F n, milnorSpecialisation (Place.infty F).valuation
        (Place.infty F).valuation_surjective (inftyUniformizer F) (ord_infty_X_inv F) n
        (milnorK.map (algebraMap F (RatFunc F)) n x) = milnorK.map (placeConst (Place.infty F)) n x) ∧
    ∀ x : milnorK F (n + 1), residueInfty n (milnorK.map (algebraMap F (RatFunc F)) (n + 1) x) = 0 := by
  sorry

/-- `K2SymbolsBrauer:T.4/bass-tate-sequence` (Theorem III.7.4): for `n ≥ 0`,
`0 → K^M_{n+1}(F) → K^M_{n+1} F(t) → ⊕_π K^M_n(F[t]/π) → 0` is exact — injectivity, exactness in
the middle, surjectivity onto finitely supported families — and is split by the specialisation
at infinity. The place at infinity is not a component of the residue map. -/
theorem bass_tate_sequence (n : ℕ) :
    Function.Injective (milnorK.map (algebraMap F (RatFunc F)) (n + 1)) ∧
    (∀ x : milnorK (RatFunc F) (n + 1), (∀ q : MonicIrreducible F, residueAt q n x = 0) ↔
      x ∈ (milnorK.map (algebraMap F (RatFunc F)) (n + 1)).range) ∧
    (∀ y : Π₀ q : MonicIrreducible F, milnorK (TameSymbol.ResidueField (placeVal q)) n,
      ∃ x, ∀ q, residueAt q n x = y q) ∧
    ∀ x : milnorK F (n + 1), milnorSpecialisation (Place.infty F).valuation
      (Place.infty F).valuation_surjective (inftyUniformizer F) (ord_infty_X_inv F) (n + 1)
      (milnorK.map (algebraMap F (RatFunc F)) (n + 1) x) =
        milnorK.map (placeConst (Place.infty F)) (n + 1) x := by
  sorry

/-- A nonzero polynomial as a unit of `F(t)`. -/
def polyUnit (p : F[X]) (hp : p ≠ 0) : (RatFunc F)ˣ :=
  Units.mk0 (algebraMap F[X] (RatFunc F) p) (RatFunc.algebraMap_ne_zero hp)

/-- `L_d ⊆ K^M_n F(t)`: generated by symbols whose entries are nonzero polynomials of degree
`≤ d`; `L_0` is the image of `K^M_n(F)`. -/
def degreeFiltration (F : Type u) [Field F] (n d : ℕ) : AddSubgroup (milnorK (RatFunc F) n) :=
  AddSubgroup.closure {z | ∃ (p : Fin n → F[X]) (hp : ∀ i, p i ≠ 0), (∀ i, (p i).natDegree ≤ d) ∧
    z = milnorK.symbol fun i => polyUnit (p i) (hp i)}

/-- `K2SymbolsBrauer:T.4/degree-reduction` (i) (Exercise III.6.2, corrected): for monic
`e₁ ≠ e₂` of the same degree and `h = e₁ - e₂`,
`{e₁, e₂} = {h, e₂} - {h, e₁} + {e₁, -1}`. -/
theorem degree_reduction (e₁ e₂ : F[X]) (h₁ : e₁.Monic) (h₂ : e₂.Monic)
    (hdeg : e₁.natDegree = e₂.natDegree) (hne : e₁ ≠ e₂) :
    milnorK.symbol ![polyUnit e₁ h₁.ne_zero, polyUnit e₂ h₂.ne_zero] =
      milnorK.symbol ![polyUnit (e₁ - e₂) (sub_ne_zero.mpr hne), polyUnit e₂ h₂.ne_zero] -
        milnorK.symbol ![polyUnit (e₁ - e₂) (sub_ne_zero.mpr hne), polyUnit e₁ h₁.ne_zero] +
        milnorK.symbol ![polyUnit e₁ h₁.ne_zero, -1] := by
  sorry

/-- `K2SymbolsBrauer:T.4/degree-reduction` (ii): `L_d` is generated by `L_{d-1}` and the symbols
`{π, a₂, …, a_{n+1}}` with `π` monic irreducible of degree `d` and `deg aᵢ < d`. -/
theorem degree_reduction_generation (n d : ℕ) (hd : 1 ≤ d) :
    degreeFiltration F (n + 1) d = degreeFiltration F (n + 1) (d - 1) ⊔
      AddSubgroup.closure {z | ∃ (π : MonicIrreducible F) (a : Fin n → F[X]) (ha : ∀ i, a i ≠ 0),
        π.1.natDegree = d ∧ (∀ i, (a i).natDegree < d) ∧
        z = milnorK.symbol (Fin.cons (α := fun _ => (RatFunc F)ˣ) (polyUnit π.1 π.2.2.ne_zero)
          fun i => polyUnit (a i) (ha i))} := by
  sorry

/-- `L_d / L_{d-1}`. -/
abbrev degreeQuotient (F : Type u) [Field F] (n d : ℕ) : Type u :=
  degreeFiltration F n d ⧸ (degreeFiltration F n (d - 1)).addSubgroupOf (degreeFiltration F n d)

/-- `K2SymbolsBrauer:T.4/residue-section` (Lemma III.7.4.1): for `π` monic irreducible of degree
`d`, there is a unique `h_π : K^M_n(F[t]/π) → L_d / L_{d-1}` with
`h_π{ā₁, …, āₙ} = [{a₁, …, aₙ, π}]`, the `aᵢ` being the representatives of degree `< d`. The
source puts `π` first; with `π` last, `h_π` is a section of this roadmap's residue `∂_π`. -/
theorem residue_section (π : F[X]) [Fact (Irreducible π)] (hπ : π.Monic) (n : ℕ) :
    ∃! h : milnorK (AdjoinRoot π) n →+ degreeQuotient F (n + 1) π.natDegree,
      ∀ (a : Fin n → F[X]) (ha : ∀ i, a i ≠ 0) (_ : ∀ i, (a i).natDegree < π.natDegree)
        (ha' : ∀ i, AdjoinRoot.mk π (a i) ≠ 0),
        h (milnorK.symbol fun i => Units.mk0 _ (ha' i)) =
          QuotientAddGroup.mk ⟨milnorK.symbol (Fin.snoc (α := fun _ => (RatFunc F)ˣ)
            (fun i => polyUnit (a i) (ha i)) (polyUnit π hπ.ne_zero)), by sorry⟩ := by
  sorry

/-- `K2SymbolsBrauer:T.4/filtration-quotients` (Lemma III.7.4.2), in this roadmap's normalisation:
for `deg π = d`, `∂_π` vanishes on `L_{d-1}`, `∂_π{a₁, …, aₙ, π} = {ā₁, …, āₙ}` (Π on the right),
`∂_{π'}` kills `{a₁, …, aₙ, π}` for `π' ≠ π` of degree `d`, and the residues give
`⊕_{deg π = d} K^M_n(k_π) ≃ L_d / L_{d-1}`. -/
theorem filtration_quotients (n d : ℕ) (hd : 1 ≤ d) :
    (∀ q : MonicIrreducible F, q.1.natDegree = d →
      ∀ x ∈ degreeFiltration F (n + 1) (d - 1), residueAt q n x = 0) ∧
    (∀ q : MonicIrreducible F, q.1.natDegree = d → ∀ (a : Fin n → F[X]) (ha : ∀ i, a i ≠ 0)
      (hu : ∀ i, polyUnit (a i) (ha i) ∈ (placeVal q).valuationSubring.unitGroup),
      (∀ i, (a i).natDegree < d) →
      residueAt q n (milnorK.symbol (Fin.snoc (α := fun _ => (RatFunc F)ˣ)
        (fun i => polyUnit (a i) (ha i)) (polyUnit q.1 q.2.2.ne_zero))) =
        milnorK.symbol fun i => res (placeVal q) ⟨_, hu i⟩) ∧
    (∀ q q' : MonicIrreducible F, q.1.natDegree = d → q'.1.natDegree = d → q ≠ q' →
      ∀ (a : Fin n → F[X]) (ha : ∀ i, a i ≠ 0), (∀ i, (a i).natDegree < d) →
      residueAt q' n (milnorK.symbol (Fin.snoc (α := fun _ => (RatFunc F)ˣ)
        (fun i => polyUnit (a i) (ha i)) (polyUnit q.1 q.2.2.ne_zero))) = 0) ∧
    Nonempty ((⨁ q : {q : MonicIrreducible F // q.1.natDegree = d},
      milnorK (TameSymbol.ResidueField (placeVal q.1)) n) ≃+ degreeQuotient F (n + 1) d) := by
  sorry

/-- `K2SymbolsBrauer:T.4/projective-line-reciprocity` (III.7.5.1): `Σ_v N_v ∂_v(x) = 0` over all
places of `F(t)`, with `N_∞ = id`; the sum is finite. -/
theorem projective_line_reciprocity (n : ℕ) (x : milnorK (RatFunc F) (n + 1)) :
    {q : MonicIrreducible F | residueAt q n x ≠ 0}.Finite ∧
      ∑ᶠ q : MonicIrreducible F, placeTransfer q n (residueAt q n x) + residueInfty n x = 0 := by
  sorry

/-- `K2SymbolsBrauer:T.4/prime-to-p-closure` (Kato's trick): a prime-to-`p` closure `F'` exists,
and the kernel of `K^M_n(F) → K^M_n(F')` is killed by integers prime to `p`. -/
theorem prime_to_p_closure (p : ℕ) [Fact p.Prime] :
    ∃ F' : IntermediateField F (AlgebraicClosure F),
      (∀ x ∈ F', ∃ K : IntermediateField F (AlgebraicClosure F), FiniteDimensional F K ∧
        ¬ p ∣ Module.finrank F K ∧ x ∈ K ∧ K ≤ F') ∧
      (∀ (L : Type u) [Field L] [Algebra F' L] [FiniteDimensional F' L],
        ∃ k : ℕ, Module.finrank F' L = p ^ k) ∧
      ∀ (n : ℕ) (x : milnorK F n), milnorK.map (algebraMap F F') n x = 0 →
        ∃ m : ℕ, ¬ p ∣ m ∧ m • x = 0 := by
  sorry

/-- `K2SymbolsBrauer:T.4/transfer-base-change` (Exercise III.7.7, for any `F'/F`): if
`π = ∏ πᵢ^{eᵢ}` over `F'` with `πᵢ` the minimal polynomial of `bᵢ`, and `σᵢ : F⟮a⟯ → F'⟮bᵢ⟯` sends
`a ↦ bᵢ`, then `res ∘ N_{a/F} = Σᵢ eᵢ · N_{bᵢ/F'} ∘ σᵢ`.
Use higher_ramification_formula at nontrivially restricting places, with positive index.
At a place trivial on F(t), all imported symbols are symbols of units and their residue is zero.
This separate case is necessary for F' = F(u), e.g. the place t-u; no e = 0 residue map exists. -/
theorem transfer_base_change {E : Type v} [Field E] [Algebra F E] (a : E) (ha : IsIntegral F a)
    {F' L : Type w} [Field F'] [Field L] [Algebra F F'] [Algebra F' L] {r : ℕ} (b : Fin r → L)
    (hb : ∀ i, IsIntegral F' (b i)) (e : Fin r → ℕ)
    (hfac : (minpoly F a).map (algebraMap F F') = ∏ i, minpoly F' (b i) ^ e i)
    (hdistinct : Function.Injective fun i => minpoly F' (b i))
    (σ : ∀ i, F⟮a⟯ →+* F'⟮b i⟯)
    (hσ : ∀ i, σ i (IntermediateField.AdjoinSimple.gen F a) =
      IntermediateField.AdjoinSimple.gen F' (b i))
    (hσF : ∀ i c, σ i (algebraMap F F⟮a⟯ c) = algebraMap F' F'⟮b i⟯ (algebraMap F F' c))
    (n : ℕ) (x : milnorK F⟮a⟯ n) :
    milnorK.map (algebraMap F F') n (milnorTransferSimple F a ha n x) =
      ∑ i, e i • milnorTransferSimple F' (b i) (hb i) n (milnorK.map (σ i) n x) := by
  sorry

/-- `K2SymbolsBrauer:T.4/p-closed-generation` (Exercise III.7.6): if every finite extension of `F`
has `p`-power degree and `[E : F] = p`, then `K^M_{n+1}(E)` is generated by the
`{y, x₂, …, x_{n+1}}` with `y ∈ Eˣ`, `xᵢ ∈ Fˣ`. -/
theorem p_closed_generation (p : ℕ) [Fact p.Prime]
    (hF : ∀ (L : Type u) [Field L] [Algebra F L] [FiniteDimensional F L],
      ∃ k : ℕ, Module.finrank F L = p ^ k)
    {E : Type u} [Field E] [Algebra F E] [FiniteDimensional F E] (hE : Module.finrank F E = p)
    (n : ℕ) :
    AddSubgroup.closure {z | ∃ (y : Eˣ) (x : Fin n → Fˣ),
      z = milnorK.symbol (Fin.cons (α := fun _ => Eˣ) y
        fun i => Units.map (algebraMap F E).toMonoidHom (x i))} = ⊤ := by
  sorry

/-- `K2SymbolsBrauer:T.4/kato-prime-degree` (Lemma III.7.6.2): for `E/F` normal of prime degree and
`E = F(a) = F(b)`, `N_{a/F} = N_{b/F}`. -/
theorem kato_prime_degree {E : Type v} [Field E] [Algebra F E] [FiniteDimensional F E] [Normal F E]
    (hp : (Module.finrank F E).Prime) (a b : E) (ha : IsIntegral F a) (hb : IsIntegral F b)
    (htop : F⟮a⟯ = ⊤) (hab : F⟮a⟯ = F⟮b⟯) (n : ℕ) :
    milnorTransferSimple F a ha n = (milnorTransferSimple F b hb n).comp
      (milnorK.map (IntermediateField.equivOfEq hab).toRingEquiv.toRingHom n) := by
  sorry

/-- The residue degree `f(w | v) = [k_w : k_v]` (a real definition). -/
def residueDegree {E : Type v} [Field E] [Algebra F E] (v : Valuation F ℤᵐ⁰)
    (w : Valuation E ℤᵐ⁰) (e : ℕ) (he : 0 < e)
    (hvw : ∀ r : F, w.ord (algebraMap F E r) = e * v.ord r) : ℕ :=
  letI := (residueFieldMap v w e he hvw).toAlgebra
  Module.finrank (TameSymbol.ResidueField v) (TameSymbol.ResidueField w)


/- `K2SymbolsBrauer:T.4/prime-degree-residue-on-generated-symbols`: GS Lemma 7.3.10,
pp. 200–201. The four cases (unit/unit, uniformizer/unit, unit/uniformizer,
uniformizer/uniformizer) use the valuation and unit-residue norm identities requested from
LocalFieldsRamification Layer 3 for generic complete DVR fields, not just finite residue fields.
The last case retains π=u′π′^e, Nπ′=uπ^f and compares
{(−1)^(ef) N(ū′), tail} with {(−1)^f ū⁻¹, tail}; use π′=π when e=1,
and the Eisenstein constant term when e=p. GS's uniformizer-FIRST computation is multiplied
by (−1)^n on both sides here, yielding the packet's uniformizer-LAST residue. -/
theorem prime_degree_residue_on_generated_symbols {E : Type v} [Field E] [Algebra F E] [FiniteDimensional F E]
    [Normal F E] (hp : (Module.finrank F E).Prime) (v : Valuation F ℤᵐ⁰)
    (hv : Function.Surjective v)
    [IsAdicComplete (IsLocalRing.maximalIdeal v.valuationSubring) v.valuationSubring]
    (w : Valuation E ℤᵐ⁰) (hw : Function.Surjective w) (e : ℕ) (he : 0 < e)
    (hvw : ∀ r : F, w.ord (algebraMap F E r) = e * v.ord r)
    (hunique : ∀ (w' : Valuation E ℤᵐ⁰) (e' : ℕ), Function.Surjective w' →
      (∀ r : F, w'.ord (algebraMap F E r) = e' * v.ord r) → w' = w)
    (n : ℕ) (y : Eˣ) (a : Fin n → Fˣ) :
    milnorResidue v hv n (milnorNorm F E (n + 1) (milnorK.symbol (Fin.cons (α := fun _ => Eˣ) y
        fun i => Units.map (algebraMap F E).toMonoidHom (a i)))) =
      milnorNormOf (residueFieldMap v w e he hvw) n (milnorResidue w hw n (milnorK.symbol (Fin.cons (α := fun _ => Eˣ) y
        fun i => Units.map (algebraMap F E).toMonoidHom (a i)))) := by
  sorry

/-- `K2SymbolsBrauer:T.4/complete-norm-residue`: GS Proposition 7.4.1, p. 204.
Factor the inseparable tower; for the separable part use p-closed towers and finite descent.
All valuation computations occur over finite complete discrete extensions, never over an
infinite prime-to-p closure. Keep r·res δ=0, transfer back to get [F′:F]δ=0,
then detect each primary part. The normal-prime-degree lemma supplies each tower step. -/
theorem complete_norm_residue {E : Type v} [Field E] [Algebra F E] [FiniteDimensional F E]
    (v : Valuation F ℤᵐ⁰)
    (hv : Function.Surjective v)
    [IsAdicComplete (IsLocalRing.maximalIdeal v.valuationSubring) v.valuationSubring]
    (w : Valuation E ℤᵐ⁰) (hw : Function.Surjective w) (e : ℕ) (he : 0 < e)
    (hvw : ∀ r : F, w.ord (algebraMap F E r) = e * v.ord r)
    (hunique : ∀ (w' : Valuation E ℤᵐ⁰) (e' : ℕ), Function.Surjective w' →
      (∀ r : F, w'.ord (algebraMap F E r) = e' * v.ord r) → w' = w)
    (n : ℕ) (x : milnorK E (n + 1)) :
    milnorResidue v hv n (milnorNorm F E (n + 1) x) =
      milnorNormOf (residueFieldMap v w e he hvw) n (milnorResidue w hw n x) := by
  sorry

/-- `K2SymbolsBrauer:T.4/kato-complete-residue` (Corollary III.7.6.3): for `F` complete for `v` and
`E/F` normal of prime degree with the unique extension `w`, `∂_v ∘ N_{E/F} = N_{k_w/k_v} ∘ ∂_w`.
The reader gives p/p² annihilation, finite descent and the retained ramification factor. -/
theorem kato_complete_residue {E : Type v} [Field E] [Algebra F E] [FiniteDimensional F E]
    [Normal F E] (hp : (Module.finrank F E).Prime) (v : Valuation F ℤᵐ⁰)
    (hv : Function.Surjective v)
    [IsAdicComplete (IsLocalRing.maximalIdeal v.valuationSubring) v.valuationSubring]
    (w : Valuation E ℤᵐ⁰) (hw : Function.Surjective w) (e : ℕ) (he : 0 < e)
    (hvw : ∀ r : F, w.ord (algebraMap F E r) = e * v.ord r)
    (hunique : ∀ (w' : Valuation E ℤᵐ⁰) (e' : ℕ), Function.Surjective w' →
      (∀ r : F, w'.ord (algebraMap F E r) = e' * v.ord r) → w' = w)
    (n : ℕ) (x : milnorK E (n + 1)) :
    milnorResidue v hv n (milnorNorm F E (n + 1) x) =
      milnorNormOf (residueFieldMap v w e he hvw) n (milnorResidue w hw n x) := by
  sorry

/-- `K2SymbolsBrauer:T.3/transfer-and-norm-residue` (reparented to T.4): for a finite extension
`E/F` and `v` on `F` whose valuation ring has a finite integral closure in `E`
(`Σ_w e_w f_w = [E : F]`), `∂_v ∘ N_{E/F} = Σ_{w | v} N_{k_w/k_v} ∘ ∂_w`. Ramification indices do
not enter; without the finiteness hypothesis the degree-one case fails.
Proof: finite normalization gives the semilocal CRT completion and E⊗F F̂=∏ Ê_w
(AlgebraicCurves Layer 2 contract, GS Appendix A.6.4). Arbitrary-field Milnor base change has
all lengths 1 here. Completion has index 1 and the same residue field; apply
complete_norm_residue to each factor and add. At degree one the norm on K₀ is the residue
degree f_w, not an extra ramification factor. -/
theorem transfer_and_norm_residue {E : Type v} [Field E] [Algebra F E] [FiniteDimensional F E]
    (v : Valuation F ℤᵐ⁰) (hv : Function.Surjective v) (W : Finset (Valuation E ℤᵐ⁰))
    (e : Valuation E ℤᵐ⁰ → ℕ) (he : ∀ w ∈ W, 0 < e w)
    (hsurj : ∀ w ∈ W, Function.Surjective w)
    (hvw : ∀ w ∈ W, ∀ r : F, w.ord (algebraMap F E r) = e w * v.ord r)
    (hall : ∀ (w : Valuation E ℤᵐ⁰) (e' : ℕ), Function.Surjective w → 0 < e' →
      (∀ r : F, w.ord (algebraMap F E r) = e' * v.ord r) → w ∈ W)
    (hfin : ∑ w ∈ W.attach, e w.1 * residueDegree v w.1 (e w.1) (he w.1 w.2) (hvw w.1 w.2) =
      Module.finrank F E)
    (n : ℕ) (x : milnorK E (n + 1)) :
    milnorResidue v hv n (milnorNorm F E (n + 1) x) =
      ∑ w ∈ W.attach, milnorNormOf (residueFieldMap v w.1 (e w.1) (he w.1 w.2) (hvw w.1 w.2)) n
        (milnorResidue w.1 (hsurj w.1 w.2) n x) := by
  sorry

/-- `K2SymbolsBrauer:T.4/constant-extension-residue` (Exercise III.7.9): for `E/F` normal of prime
degree and a place `v` of `F(t)` trivial on `F`, `∂_v ∘ N_{E(t)/F(t)} = Σ_{w | v} N ∘ ∂_w`; the
algebra `F(t) → E(t)` is required to be the constant extension. -/
theorem constant_extension_residue {E : Type u} [Field E] [Algebra F E] [FiniteDimensional F E]
    [Normal F E] (hp : (Module.finrank F E).Prime) [Algebra (RatFunc F) (RatFunc E)]
    [FiniteDimensional (RatFunc F) (RatFunc E)]
    (hC : ∀ c : F, algebraMap (RatFunc F) (RatFunc E) (algebraMap F (RatFunc F) c) =
      algebraMap E (RatFunc E) (algebraMap F E c))
    (hX : algebraMap (RatFunc F) (RatFunc E) RatFunc.X = RatFunc.X)
    (v : Valuation (RatFunc F) ℤᵐ⁰) (hv : Function.Surjective v) [v.IsTrivialOn F]
    (W : Finset (Valuation (RatFunc E) ℤᵐ⁰)) (e : Valuation (RatFunc E) ℤᵐ⁰ → ℕ)
    (he : ∀ w ∈ W, 0 < e w)
    (hsurj : ∀ w ∈ W, Function.Surjective w)
    (hvw : ∀ w ∈ W, ∀ r, w.ord (algebraMap (RatFunc F) (RatFunc E) r) = e w * v.ord r)
    (hall : ∀ (w : Valuation (RatFunc E) ℤᵐ⁰) (e' : ℕ), Function.Surjective w → 0 < e' →
      (∀ r, w.ord (algebraMap (RatFunc F) (RatFunc E) r) = e' * v.ord r) → w ∈ W)
    (n : ℕ) (x : milnorK (RatFunc E) (n + 1)) :
    milnorResidue v hv n (milnorNorm (RatFunc F) (RatFunc E) (n + 1) x) =
      ∑ w ∈ W.attach, milnorNormOf (residueFieldMap v w.1 (e w.1) (he w.1 w.2) (hvw w.1 w.2)) n
        (milnorResidue w.1 (hsurj w.1 w.2) n x) := by
  sorry

/-- `K2SymbolsBrauer:T.4/kato-commuting-square` (Proposition III.7.6.4, with the errata's
`N_{a/E}`): for `E/F` normal of prime degree, `F' = F(a)`, `E' = E(a)`,
`N_{E/F} ∘ N_{a/E} = N_{a/F} ∘ N_{E'/F'}`. -/
theorem kato_commuting_square {E : Type v} [Field E] [Algebra F E] [FiniteDimensional F E]
    [Normal F E] (hp : (Module.finrank F E).Prime) {L : Type w} [Field L] [Algebra F L]
    [Algebra E L] [IsScalarTower F E L] (a : L) (haF : IsIntegral F a) (haE : IsIntegral E a)
    (ι : F⟮a⟯ →+* E⟮a⟯) (hι : ∀ x : F⟮a⟯, ((ι x : E⟮a⟯) : L) = x) (n : ℕ) :
    (milnorNorm F E n).comp (milnorTransferSimple E a haE n) =
      (milnorTransferSimple F a haF n).comp (milnorNormOf ι n) := by
  sorry

end TauCeti.MilnorK

namespace TauCeti.TameSymbol

open TauCeti.MilnorK


/-- The residue `∂_P` at a place `P` of `K/k`, landing in `K^M_n(P.ResidueField)` (a real
definition). -/
def placeResidue {k : Type u} {K : Type v} [Field k] [Field K] [Algebra k K] (P : Place k K)
    (n : ℕ) : milnorK K (n + 1) →+ milnorK P.ResidueField n :=
  (milnorK.map (residueFieldCongr (valuationSubring_eq_integers P)).toRingHom n).comp
    (milnorResidue P.valuation P.valuation_surjective n)

/-- The tame symbol at a place `P`, in `P.ResidueFieldˣ` (a real definition). -/
def placeTame {k : Type u} {K : Type v} [Field k] [Field K] [Algebra k K] (P : Place k K)
    (f g : Kˣ) : P.ResidueFieldˣ :=
  Units.map (residueFieldCongr (valuationSubring_eq_integers P)).toRingHom.toMonoidHom
    (tameSymbol P.valuation P.valuation_surjective f g)

/-- `K2SymbolsBrauer:T.4/projective-line-reciprocity` in degree two: `∏_v N_{k(v)/F} ∂_v{f, g} = 1`
over all places of `F(t)` (either normalisation). -/
theorem projective_line_reciprocity_tameSymbol {F : Type u} [Field F] (f g : (RatFunc F)ˣ) :
    ∏ᶠ P : Place F (RatFunc F), Units.map (Algebra.norm F : P.ResidueField →* F) (placeTame P f g) =
      1 := by
  sorry

/-- `K2SymbolsBrauer:T.4/weil-reciprocity`, Suslin's reciprocity law: for any field `F` (perfect
or not), a function field `K/F` of one variable and `x ∈ K^M_{n+1}(K)`, `∂_P x = 0` at almost every
place and `Σ_P N_{k(P)/F} ∂_P(x) = 0`. The places are the closed points of the regular proper model
(the normalisation, not necessarily smooth), `k(P)/F` may be inseparable, and `milnorNorm` is
Kato's norm. MotivicEtaleKTheory M.4 imports it. -/
/- AlgebraicCurves Layer 2 finite-normalization input for arbitrary F and finite K/F(t):
embed K in a finite normal hull M. Take its maximal purely inseparable intermediate P FIRST,
so M/P is separable (Stacks 032N). The pinned pure-polynomial theorem makes the closure A′
of F[t] in P finite. A′ is normal Noetherian; the separable trace argument makes its closure
in M finite. The closure of F[t] in K is an F[t]-submodule of that finite module, hence finite.
Repeat at t⁻¹ and localize. A separable-first tower inside K would not make the pure theorem's
polynomial base available. Test: F=F₃(s), K=F(s^(1/3))(u), t=u², closure F(s^(1/3))[u], rank 6.
This is the Layer 2 imported assembly, not a smoothness assumption. -/
theorem weil_reciprocity {F : Type u} {K : Type v} [Field F] [Field K] [Algebra F K]
    (hK : IsFunctionField F K) (n : ℕ) (x : milnorK K (n + 1)) :
    {P : Place F K | placeResidue P n x ≠ 0}.Finite ∧
      ∑ᶠ P : Place F K, milnorNorm F P.ResidueField n (placeResidue P n x) = 0 := by
  sorry

/-- `K2SymbolsBrauer:T.4/weil-reciprocity-symbol-form`, over the places of `K/F`:
`∂_P{f, g} = 1` for almost all `P` and `∏_P N_{k(P)/F}(∂_P{f, g}) = 1`. -/
theorem weil_reciprocity_symbol_form {F : Type u} {K : Type v} [Field F] [Field K] [Algebra F K]
    (hK : IsFunctionField F K) (f g : Kˣ) :
    {P : Place F K | placeTame P f g ≠ 1}.Finite ∧
      ∏ᶠ P : Place F K, Units.map (Algebra.norm F : P.ResidueField →* F) (placeTame P f g) = 1 := by
  sorry

/-- `K2SymbolsBrauer:T.4/disjoint-support-reciprocity`: for disjoint supports, `f(div g) = g(div f)`
for Tau Ceti's evaluation of a function on a divisor (local factors the residue-field norms), from
the symbol form: `∂_P{f, g} = f(P)^{ord_P g}` on the support of `div g` and `g(P)^{-ord_P f}` on the
support of `div f`. -/
theorem weil_reciprocity_symbol_form_eval {F : Type u} {K : Type v} [Field F] [Field K]
    [Algebra F K] (hK : IsFunctionField F K) (f g : Kˣ)
    (hfg : Disjoint (Divisor.principal hK f).support (Divisor.principal hK g).support) :
    Divisor.eval (Divisor.principal hK g) f = Divisor.eval (Divisor.principal hK f) g := by
  sorry

/- `K2SymbolsBrauer:T.4/weil-reciprocity-symbol-form`, the product over the closed points `X^{(1)}`
of a proper regular curve: not stated here; needs the closed-point/place dictionary with
`Scheme.ord` and `κ(x) ≃ₐ[F] k(P_x)` (supplier: AlgebraicCurves Layer 12, 12A–12B).
`K2SymbolsBrauer:T.4/valuation-comparison`: not stated here; needs the same dictionary, with
Weil divisors on the regular model identified with `Divisor F K` (supplier: AlgebraicCurves Layer 12,
12A, 12B and 12D; imported, not re-proved; regular, not smooth).
`K2SymbolsBrauer:T.4/disjoint-support-reciprocity`, the elliptic instance (EllipticCurves Layer 2's
milestone `f(div g) = g(div f)`): not compiled; suggested form, with the import
`TauCeti.AlgebraicGeometry.EllipticCurve.Affine.FunctionField.Finrank`, for `W` elliptic over `F`:
  example (W : WeierstrassCurve.Affine F) [W.IsElliptic] (f g : W.FunctionFieldˣ)
      (hfg : Disjoint (Divisor.principal W.isFunctionField f).support
        (Divisor.principal W.isFunctionField g).support) :
      Divisor.eval (Divisor.principal W.isFunctionField g) f =
        Divisor.eval (Divisor.principal W.isFunctionField f) g :=
    weil_reciprocity_symbol_form_eval W.isFunctionField f g hfg
(the universe of `W.FunctionField` has to match the statement's `K`). Its test value: on
`y² = x³ - x` over `ℚ`, `f = x/(x - 2)` and `g = (x - 3)/(x - 5)` give `81/25` on both sides. -/

/-! ## `K2SymbolsBrauer:T.3:localization-comparison` — the comparison with Quillen K-theory

After RT-AREA-ktheory-1/28 this sub-stage follows `T.4`. It imports Milnor norms from `T.4` and
K-theory transfers from GeneralAlgebraicKTheory K.3; it constructs no transfer. Its nodes need
Quillen's localisation sequence and transfers, which neither pinned library has, so they are
recorded here as comments (the discrete-valuation-ring comparison
`K2SymbolsBrauer:T.3/localization-boundary` is the comment after `finite_support_tameSymbol`).

`K2SymbolsBrauer:T.3/dedekind-localization-boundary` (K-book III.6.5, V.6.6): not stated here; needs
the localisation sequence of a Dedekind domain `R` with fraction field `F`,
`⊕_𝔭 K₂(R/𝔭) → K₂(R) → K₂(F) → ⊕_𝔭 K₁(R/𝔭) → K₁(R) → K₁(F)` (supplier: GeneralAlgebraicKTheory:K.3,
its localisation, dévissage, resolution and transfer nodes). Suggested content: the `𝔭`-component of
the boundary on `steinbergSymbol f g` is `tameSymbol (𝔭.valuation F) _ g f` (the K-book's
right-linear normalisation), the cokernel of the boundary is `ker (K₁(R) → K₁(F))`.

`K2SymbolsBrauer:T.3/quillen-transfer-norm-residue` (K-book V.(6.6.3)–(6.6.4)): not stated here;
needs Quillen's transfers along a finite extension `R ⊆ R'` of Dedekind domains (supplier:
GeneralAlgebraicKTheory:K.3/transfer-maps-and-projection-formula). Suggested content: the boundary
of `N_{F'/F} x` at `𝔭` is `∑_{𝔭' | 𝔭} N_{k(𝔭')/k(𝔭)}` of the boundaries at the `𝔭'` (no
ramification index), and restriction followed by transfer is multiplication by `[E : F]`.

`K2SymbolsBrauer:T.3/milnor-quillen-transfer-comparison`: not stated here; needs Quillen
K₂ and its transfers (GeneralAlgebraicKTheory K.3). The equality holds for EVERY finite E/F.
Exact arbitrary-field base-change contract, for any F′/F: decompose B=E⊗F F′ into local
Artinian B_i with residue fields L_i and lengths r_i. The restriction-of-scalars functor
base-changes to restriction from B; its radical filtration and additivity give
res_F′/F Tr_E/F=Σ r_i Tr_L_i/F′ res_L_i/E. Use G(B) and dévissage, not K(B)=G(B):
B can be nonregular. In E=F_p(s^(1/p)), F′=E, the length is p, so res Tr=p id.
Transport Quillen transfer along Matsumoto/T.1. Over F^(p), each component has normal
degree-p towers. p_closed_generation gives {y,x} with x in the base, and both transfers
send it to {N₁(y),x} by projection. Transitivity and the shared base-change lengths give
res δ=0 over F^(p). Descend finitely many symbol identities to a finite prime-to-p stage,
then restriction-transfer kills δ by an integer prime to p. Detection for every p proves
δ=0. The proof does not use norm/residue compatibility, so has no circular prerequisite. -/

end TauCeti.TameSymbol

/-! ## `K2SymbolsBrauer:T.5` — tame kernels, `K₂(ℤ)` and `K₂(ℚ)` -/

namespace TauCeti.TameSymbol

open TauCeti.MilnorK TauCeti.Steinberg IsDedekindDomain NumberField

variable {F : Type u} [Field F]

/-- **The unramified subgroup** (`K2SymbolsBrauer:T.5/unramified-subgroup`) of a family of
discrete valuations: `⨅ i, ker ∂_{v i} ⊆ K₂(F)` (a real definition; it uses no localisation
theorem). -/
def unramifiedSubgroup {I : Type v} (v : I → Valuation F ℤᵐ⁰)
    (hv : ∀ i, Function.Surjective (v i)) : Subgroup (K2 F) :=
  ⨅ i, (tameSymbolHomK2 (v i) (hv i)).ker

/-- The subgroup unramified outside `S ⊆ I`: `⨅ i ∉ S, ker ∂_{v i}` (a real definition). -/
def unramifiedOutside {I : Type v} (v : I → Valuation F ℤᵐ⁰)
    (hv : ∀ i, Function.Surjective (v i)) (S : Set I) : Subgroup (K2 F) :=
  ⨅ i ∉ S, (tameSymbolHomK2 (v i) (hv i)).ker

section Unramified

variable {I : Type v} (v : I → Valuation F ℤᵐ⁰) (hv : ∀ i, Function.Surjective (v i))

theorem mem_unramifiedSubgroup_iff (x : K2 F) :
    x ∈ unramifiedSubgroup v hv ↔ ∀ i, tameSymbolHomK2 (v i) (hv i) x = 1 := by
  sorry

theorem unramifiedOutside_empty : unramifiedOutside v hv ∅ = unramifiedSubgroup v hv := by
  sorry

theorem unramifiedOutside_mono {S T : Set I} (h : S ⊆ T) :
    unramifiedOutside v hv S ≤ unramifiedOutside v hv T := by
  sorry

/-- The residue sum `K₂(F) → ⨁ᵢ k(vᵢ)ˣ`, `x ↦ (∂_{vᵢ} x)ᵢ`, for a family with finite support. -/
def residueSum (hfin : ∀ x : K2 F, {i | tameSymbolHomK2 (v i) (hv i) x ≠ 1}.Finite) :
    K2 F →* Multiplicative (Π₀ i, Additive (ResidueField (v i))ˣ) :=
  sorry

theorem unramifiedSubgroup_eq_ker_residueSum
    (hfin : ∀ x : K2 F, {i | tameSymbolHomK2 (v i) (hv i) x ≠ 1}.Finite) :
    unramifiedSubgroup v hv = (residueSum v hv hfin).ker := by
  sorry

@[simp]
theorem symbol_mem_unramifiedSubgroup (a b : Fˣ) (ha : ∀ i, (v i).ord (a : F) = 0)
    (hb : ∀ i, (v i).ord (b : F) = 0) :
    steinbergSymbol a b (Commute.all _ _) ∈ unramifiedSubgroup v hv := by
  sorry

/-- Restriction along a finite extension carrying each `w_j` over some `v_i` maps the unramified
subgroup into the unramified subgroup. -/
theorem unramifiedSubgroup_map_le {E : Type v} [Field E] [Algebra F E] [FiniteDimensional F E]
    {J : Type v} (w : J → Valuation E ℤᵐ⁰) (hw : ∀ j, Function.Surjective (w j))
    (hcarry : ∀ j, ∃ i, ∃ e : ℕ, 0 < e ∧ ∀ r : F, (w j).ord (algebraMap F E r) = e * (v i).ord r) :
    (unramifiedSubgroup v hv).map (K2.map (algebraMap F E)) ≤ unramifiedSubgroup w hw := by
  sorry

end Unramified

/-- The finite places of a Dedekind domain `R` with fraction field `F` (Mathlib's
`HeightOneSpectrum.valuation`). -/
abbrev primeFamily (R : Type v) [CommRing R] [IsDedekindDomain R] (F : Type u) [Field F]
    [Algebra R F] [IsFractionRing R F] : HeightOneSpectrum R → Valuation F ℤᵐ⁰ :=
  fun p => p.valuation F

theorem range_K2_le_unramifiedSubgroup (R : Type u) [CommRing R] [IsDedekindDomain R]
    [Algebra R F] [IsFractionRing R F] :
    (K2.map (algebraMap R F)).range ≤
      unramifiedSubgroup (primeFamily R F) (fun p => p.valuation_surjective F) := by
  sorry

/-- The transfer `K₂(E) → K₂(F)` of a finite extension, through Matsumoto's isomorphism. -/
def k2Transfer (F : Type u) [Field F] (E : Type u) [Field E] [Algebra F E] : K2 E →* K2 F :=
  MonoidHom.toAdditive.symm ((matsumotoEquiv F).toAddMonoidHom.comp
    ((milnorNorm F E 2).comp (matsumotoEquiv E).symm.toAddMonoidHom))

/-- The transfer of a finite extension of number fields maps the unramified subgroup of `E` into
that of `F`. -/
theorem transfer_mem_unramifiedSubgroup (E : Type u) [Field E] [NumberField F] [NumberField E]
    [Algebra F E] (x : K2 E)
    (hx : x ∈ unramifiedSubgroup (primeFamily (𝓞 E) E) (fun p => p.valuation_surjective E)) :
    k2Transfer F E x ∈ unramifiedSubgroup (primeFamily (𝓞 F) F) (fun p => p.valuation_surjective F) := by
  sorry

/-- For `I = HeightOneSpectrum R`, `k(v_𝔭)` is `R ⧸ 𝔭`. -/
theorem unramifiedSubgroup_heightOneSpectrum (R : Type u) [CommRing R] [IsDedekindDomain R]
    [Algebra R F] [IsFractionRing R F] (p : HeightOneSpectrum R) :
    Nonempty (ResidueField (p.valuation F) ≃+* R ⧸ p.asIdeal) := by
  sorry

/-- The `p`-adic valuation of `ℚ` at a prime `p`. -/
def primeVal (p : Nat.Primes) : Valuation ℚ ℤᵐ⁰ := @Rat.padicValuation p.1 ⟨p.2⟩

theorem primeVal_surjective (p : Nat.Primes) : Function.Surjective (primeVal p) :=
  @Rat.surjective_padicValuation p.1 ⟨p.2⟩

/-- `r` as a unit of `ℚ`. -/
local notation "⟪" q "⟫" => Units.mk0 (q : ℚ) (by norm_num)

-- test neg_one_neg_one_mem (computation)
example : steinbergSymbol (-1 : ℚˣ) (-1) (Commute.all _ _) ∈
    unramifiedSubgroup primeVal primeVal_surjective := by
  sorry

-- test neg_one_p_not_mem (non-example)
example (p : Nat.Primes) (hp : p.1 ≠ 2) :
    steinbergSymbol (-1 : ℚˣ) (Units.mk0 (p.1 : ℚ) (by exact_mod_cast p.2.ne_zero))
      (Commute.all _ _) ∉ unramifiedSubgroup primeVal primeVal_surjective ∧
    tameSymbol (primeVal p) (primeVal_surjective p) (-1)
      (Units.mk0 (p.1 : ℚ) (by exact_mod_cast p.2.ne_zero)) = -1 := by
  sorry

-- test three_three_not_mem (non-example)
example : steinbergSymbol ⟪3⟫ ⟪3⟫ (Commute.all _ _) ∉
      unramifiedSubgroup primeVal primeVal_surjective ∧
    tameSymbol (primeVal ⟨3, Nat.prime_three⟩) (primeVal_surjective _) ⟪3⟫ ⟪3⟫ = -1 := by
  sorry

-- test two_neg_one_mem (degenerate)
example : steinbergSymbol ⟪2⟫ (-1) (Commute.all _ _) = 1 ∧
    tameSymbol (primeVal ⟨2, Nat.prime_two⟩) (primeVal_surjective _) ⟪2⟫ (-1) = 1 := by
  sorry

-- test empty_family (degenerate)
example {I : Type v} (v : I → Valuation F ℤᵐ⁰) (hv : ∀ i, Function.Surjective (v i)) :
    unramifiedSubgroup (F := F) (Empty.elim : Empty → Valuation F ℤᵐ⁰) (fun e => e.elim) = ⊤ ∧
      unramifiedOutside v hv Set.univ = ⊤ := by
  sorry

-- test mem_iff_residueSum_rat (characterisation)
example (hfin : ∀ x : K2 ℚ, {p | tameSymbolHomK2 (primeVal p) (primeVal_surjective p) x ≠ 1}.Finite)
    (x : K2 ℚ) :
    x ∈ unramifiedSubgroup primeVal primeVal_surjective ↔
      residueSum primeVal primeVal_surjective hfin x = 1 := by
  sorry

-- test heightOneSpectrum_int (compatibility)
example (v : HeightOneSpectrum ℤ) (p : ℕ) [Fact p.Prime] (hv : v.asIdeal = Ideal.span {(p : ℤ)}) :
    v.valuation ℚ = Rat.padicValuation p ∧ Nonempty (ℤ ⧸ v.asIdeal ≃+* ZMod p) := by
  sorry

/-- `K2SymbolsBrauer:T.5/tame-kernel-sequence` (the case `S = ∅` of the S-integer sequence,
derived through the Dedekind localisation sequence of `T.3/dedekind-localization-boundary`, with
`K₂(𝔽_q) = 0` for injectivity and KTheoryLowDegrees U.4's `SK₁(O_F) = 0` for surjectivity; not
imported from ArithmeticKTheory N.2, which imports it): for a number field,
`0 → K₂(O_F) → K₂(F) → ⊕_𝔭 k(𝔭)ˣ → 0` is exact. -/
theorem tame_kernel_sequence (F : Type u) [Field F] [NumberField F] :
    Function.Injective (K2.map (algebraMap (𝓞 F) F)) ∧
    (K2.map (algebraMap (𝓞 F) F)).range =
      unramifiedSubgroup (primeFamily (𝓞 F) F) (fun p => p.valuation_surjective F) ∧
    ∀ y : Π₀ p : HeightOneSpectrum (𝓞 F), Additive (ResidueField (p.valuation F))ˣ,
      ∃ x : K2 F, ∀ p, Additive.ofMul
        (tameSymbolHomK2 (p.valuation F) (p.valuation_surjective F) x) = y p := by
  sorry

/-- `K2SymbolsBrauer:T.5/relative-s-integer-sequence`: for a finite set `S` of finite places,
`0 → K₂(O_F) → K₂(O_{F,S}) → ⊕_{𝔭 ∈ S} k(𝔭)ˣ → 0` is exact — the residues are at the primes **in**
`S` — together with the image clause of `K2SymbolsBrauer:T.5/s-integer-tame-kernel-sequence`: the
image of `K₂(O_{F,S})` in `K₂(F)` is the subgroup unramified outside `S`. -/
theorem relative_s_integer_sequence (F : Type u) [Field F] [NumberField F]
    (S : Set (HeightOneSpectrum (𝓞 F))) (hS : S.Finite) :
    Function.Injective (K2.map (algebraMap (𝓞 F) (S.integer F))) ∧
    (K2.map (algebraMap (S.integer F) F)).range =
      unramifiedOutside (primeFamily (𝓞 F) F) (fun p => p.valuation_surjective F) S ∧
    (∀ x : K2 (S.integer F), (∀ p ∈ S, tameSymbolHomK2 (p.valuation F) (p.valuation_surjective F)
        (K2.map (algebraMap (S.integer F) F) x) = 1) ↔
      x ∈ (K2.map (algebraMap (𝓞 F) (S.integer F))).range) ∧
    ∀ y : ∀ p : S, (ResidueField (p.1.valuation F))ˣ, ∃ x : K2 (S.integer F), ∀ p : S,
      tameSymbolHomK2 (p.1.valuation F) (p.1.valuation_surjective F)
        (K2.map (algebraMap (S.integer F) F) x) = y p := by
  sorry

/- `K2SymbolsBrauer:T.5/s-integer-tame-kernel-sequence`, the remaining clauses: not compiled;
suggested form (the residues are at the primes **outside** `S`, read through
`IsDedekindDomain.integerHeightOneSpectrumEquiv`):
  theorem s_integer_tame_kernel_sequence (F : Type u) [Field F] [NumberField F]
      (S : Set (HeightOneSpectrum (𝓞 F))) (hS : S.Finite) :
      Function.Injective (K2.map (algebraMap (S.integer F) F)) ∧
      ∀ y : ∀ p : {p : HeightOneSpectrum (𝓞 F) // p ∉ S}, (ResidueField (p.1.valuation F))ˣ,
        (Function.mulSupport y).Finite → ∃ x : K2 (S.integer F), ∀ p,
          tameSymbolHomK2 (p.1.valuation F) (p.1.valuation_surjective F)
            (K2.map (algebraMap (S.integer F) F) x) = y p
(the surjectivity uses KTheoryLowDegrees U.4's `SK₁(O_{F,S}) = 0`).

`K2SymbolsBrauer:T.5/certified-presentation` was deleted with RT-AREA-ktheory-1/9: the order
certificate (`OrderCertificate` on `Module.Relations` and `Module.Presentation`, with its API and
tests) is ArithmeticKTheory N.6's certificate engine, and its block was removed from this file. -/



/-! ### `K2SymbolsBrauer:T.5/real-sign-symbol` -/

/-- **The real sign symbol** `(x, y)_∞` (Example III.6.2.1): `K₂(ℝ) →* ℤˣ`,
`{x, y} ↦ -1` if `x < 0` and `y < 0`, else `1`. -/
def realSignSymbol : K2 ℝ →* ℤˣ := sorry

@[simp]
theorem realSignSymbol_symbol (x y : ℝˣ) :
    realSignSymbol (steinbergSymbol x y (Commute.all _ _)) =
      if (x : ℝ) < 0 ∧ (y : ℝ) < 0 then -1 else 1 := by
  sorry

@[simp]
theorem realSignSymbol_neg_one_neg_one :
    realSignSymbol (steinbergSymbol (-1 : ℝˣ) (-1) (Commute.all _ _)) = -1 := by
  sorry

theorem realSignSymbol_surjective : Function.Surjective realSignSymbol := by
  sorry

/-- The sign symbol at a real embedding `σ : F → ℝ` (a real definition). -/
def signSymbolAt {R : Type u} [Ring R] (σ : R →+* ℝ) : K2 R →* ℤˣ := realSignSymbol.comp (K2.map σ)

/-- The degree-two part of the graded map `K^M_*(ℝ) → (ℤ/2)[t]`, `{x₁, …, xₙ} ↦ ∏ [xᵢ < 0] tⁿ`
of `K2SymbolsBrauer:T.2/milnor-examples`, under `ℤ/2 ≅ ℤˣ`, read on `K^M_2(ℝ)` through Matsumoto:
`{x, y} ↦ -1` exactly when both are negative. -/
theorem realSignSymbol_eq_milnorExamples (x y : ℝˣ) :
    realSignSymbol (Additive.toMul (matsumotoEquiv ℝ (milnorK.symbol ![x, y]))) =
      if (x : ℝ) < 0 ∧ (y : ℝ) < 0 then -1 else 1 := by
  sorry

-- test realSignSymbol_values (computation)
example : realSignSymbol (steinbergSymbol (Units.mk0 (-2 : ℝ) (by norm_num))
      (Units.mk0 (-3 : ℝ) (by norm_num)) (Commute.all _ _)) = -1 ∧
    realSignSymbol (steinbergSymbol (Units.mk0 (-2 : ℝ) (by norm_num))
      (Units.mk0 (3 : ℝ) (by norm_num)) (Commute.all _ _)) = 1 := by
  sorry

-- test realSignSymbol_one (degenerate)
example (x y : ℝˣ) : realSignSymbol (steinbergSymbol x 1 (Commute.all _ _)) = 1 ∧
    realSignSymbol (steinbergSymbol 1 y (Commute.all _ _)) = 1 := by
  sorry

-- test orSign_not_steinberg (non-example)
/- The "or" pairing is `-1` at `(2, -1)` although `2 + (-1) = 1`, where every Steinberg symbol
is trivial. -/
example : (if (2 : ℝ) < 0 ∨ (-1 : ℝ) < 0 then (-1 : ℤˣ) else 1) = -1 ∧
    steinbergSymbol (Units.mk0 (2 : ℝ) (by norm_num)) (-1) (Commute.all _ _) = 1 := by
  sorry

-- test signSymbolAt_rat (characterisation)
example : signSymbolAt (Rat.castHom ℝ) (steinbergSymbol (-1 : ℚˣ) (-1) (Commute.all _ _)) = -1 ∧
    ∀ p q : ℚˣ, 0 < (p : ℚ) → 0 < (q : ℚ) →
      signSymbolAt (Rat.castHom ℝ) (steinbergSymbol p q (Commute.all _ _)) = 1 := by
  sorry

-- test realSignSymbol_hilbert (compatibility)
example (x y : ℝˣ) :
    realSignSymbol (steinbergSymbol x y (Commute.all _ _)) = 1 ↔
      ∃ a b : ℝ, (x : ℝ) * a ^ 2 + (y : ℝ) * b ^ 2 = 1 := by
  sorry

/-- `K2SymbolsBrauer:T.5/k2-of-the-integers`, the lower bound (Example III.6.2.1): the sign symbol
sends `{-1, -1} ∈ K₂(ℤ)` to `-1`, so `{-1, -1} ≠ 1`. -/
theorem k2_of_the_integers_lower_bound :
    signSymbolAt (Int.castRingHom ℝ) (steinbergSymbol (-1 : ℤˣ) (-1) (Commute.all _ _)) = -1 := by
  sorry

/-- Finite generators for the integer models; indices are distinct. -/
structure IntegerGen (n : ℕ) where
  i : Fin n
  j : Fin n
  ne : i ≠ j
  r : ℤ

private def integerFreeX {n : ℕ} {i j : Fin n} (hij : i ≠ j) (r : ℤ) :
    FreeGroup (IntegerGen n) := FreeGroup.of ⟨i, j, hij, r⟩

private def integerFreeW {n : ℕ} {i j : Fin n} (hij : i ≠ j) (u : ℤˣ) :
    FreeGroup (IntegerGen n) :=
  integerFreeX hij (u : ℤ) * integerFreeX hij.symm (-((u⁻¹ : ℤˣ) : ℤ)) *
    integerFreeX hij (u : ℤ)

/-- The usual finite Steinberg relations, with Milnor Definition 10.4's additional
rank-two conjugation relation. With n≤1 there are no generators, hence the group is trivial. -/
def integerModelRels (n : ℕ) : Set (FreeGroup (IntegerGen n)) :=
  {z | ∃ (i j : Fin n) (hij : i ≠ j) (r s : ℤ),
    z = integerFreeX hij r * integerFreeX hij s * (integerFreeX hij (r + s))⁻¹} ∪
  {z | ∃ (i j k l : Fin n) (hij : i ≠ j) (hkl : k ≠ l) (r s : ℤ),
    j ≠ k ∧ i ≠ l ∧ z = ⁅integerFreeX hij r, integerFreeX hkl s⁆} ∪
  {z | ∃ (i j l : Fin n) (hij : i ≠ j) (hjl : j ≠ l) (hil : i ≠ l) (r s : ℤ),
    z = ⁅integerFreeX hij r, integerFreeX hjl s⁆ * (integerFreeX hil (r * s))⁻¹} ∪
  {z | n = 2 ∧ ∃ (i j : Fin n) (hij : i ≠ j) (u : ℤˣ) (a : ℤ),
    z = integerFreeW hij u * integerFreeX hij.symm a * integerFreeW hij (-u) *
      (integerFreeX hij (-((u : ℤ) ^ 2 * a)))⁻¹}

/-- `K2SymbolsBrauer:T.5/integer-steinberg-word-model`: the auxiliary S_n, including
the strengthened rank-two presentation. For n≥3 it is T.1's finite St(n,ℤ). -/
def IntegerSteinbergModel (n : ℕ) := PresentedGroup (integerModelRels n)

instance (n : ℕ) : Group (IntegerSteinbergModel n) :=
  inferInstanceAs (Group (PresentedGroup (integerModelRels n)))

namespace IntegerSteinbergModel

def x {n : ℕ} (g : IntegerGen n) : IntegerSteinbergModel n := PresentedGroup.of g

def w {n : ℕ} {i j : Fin n} (hij : i ≠ j) (u : ℤˣ) : IntegerSteinbergModel n :=
  x ⟨i, j, hij, u⟩ * x ⟨j, i, hij.symm, -((u⁻¹ : ℤˣ) : ℤ)⟩ * x ⟨i, j, hij, u⟩

/-- The faithful column-vector realization of the elementary group E(n,ℤ).
Its image is generated by e_ij(a); no matrix kernel injectivity is assumed. -/
def toElementary (n : ℕ) : IntegerSteinbergModel n →* Equiv.Perm (Fin n → ℤ) := sorry

theorem toElementary_x {n : ℕ} (g : IntegerGen n) (b : Fin n → ℤ) (k : Fin n) :
    toElementary n (x g) b k = b k + if k = g.i then g.r * b g.j else 0 := by sorry

/-- Row action has the opposite composition convention, so its target is a
MulOpposite. Thus b·(zw)=(b·z)·w. This avoids reversing the order of the word. -/
def rowAction (n : ℕ) : IntegerSteinbergModel n →* MulOpposite (Equiv.Perm (Fin n → ℤ)) := sorry

def act {n : ℕ} (b : Fin n → ℤ) (z : IntegerSteinbergModel n) : Fin n → ℤ :=
  MulOpposite.unop (rowAction n z) b

theorem act_x {n : ℕ} (b : Fin n → ℤ) (g : IntegerGen n) (k : Fin n) :
    act b (x g) k = b k + if k = g.j then g.r * b g.i else 0 := by sorry

/-- The compatible map into T.1's stable Steinberg group; no rank-two injectivity is asserted. -/
def toStable (n : ℕ) : IntegerSteinbergModel n →* TauCeti.Steinberg.StableSteinberg ℤ := sorry

def stabilize (n : ℕ) : IntegerSteinbergModel n →* IntegerSteinbergModel (n + 1) := sorry

def monomialSubgroup (n : ℕ) : Subgroup (IntegerSteinbergModel n) :=
  Subgroup.closure {z | ∃ (i j : Fin n) (hij : i ≠ j), z = w hij 1}

def rowNorm {n : ℕ} (b : Fin n → ℤ) : ℕ := ∑ i, (b i).natAbs

theorem unitWord {n : ℕ} (z : IntegerSteinbergModel n) :
    ∃ (gs : List (IntegerGen n)) (c : monomialSubgroup n),
      (∀ g ∈ gs, g.r = 1 ∨ g.r = -1) ∧ z = (gs.map x).prod * c := by sorry

-- test IntegerSteinbergModel.row_two (computation)
example :
    act ![2, -1] (x (⟨0, 1, by decide, 1⟩ : IntegerGen 2)) = ![2, 1] ∧
    act ![2, -1] (x (⟨1, 0, by decide, 1⟩ : IntegerGen 2)) = ![1, -1] := by sorry

-- test IntegerSteinbergModel.w_preserves_norm (computation)
example : act ![2, -1] (w (i := (0 : Fin 2)) (j := 1) (by decide) 1) = ![1, 2] ∧
    rowNorm (![2, -1] : Fin 2 → ℤ) = 3 ∧ rowNorm (![1, 2] : Fin 2 → ℤ) = 3 := by sorry

-- test IntegerSteinbergModel.rank_two_guard (non-example)
example (i j : Fin 2) (hij : i ≠ j) (u : ℤˣ) (a : ℤ) :
    w hij u * x ⟨j, i, hij.symm, a⟩ * w hij (-u) =
      x ⟨i, j, hij, -((u : ℤ) ^ 2 * a)⟩ := by sorry


/-- At n≥3, the auxiliary integer presentation is the existing finite Steinberg
model. At rank two it has extra relators and this equivalence is not asserted. -/
def equivFinite (n : ℕ) (hn : 3 ≤ n) : IntegerSteinbergModel n ≃*
    TauCeti.Steinberg.Steinberg n hn ℤ := by sorry

theorem equivFinite_x {n : ℕ} (hn : 3 ≤ n) (g : IntegerGen n) :
    equivFinite n hn (x g) = TauCeti.Steinberg.x hn g.ne g.r := by sorry

theorem toStable_eq_finiteToStable (n : ℕ) (hn : 3 ≤ n)
    (z : IntegerSteinbergModel n) :
    toStable n z = TauCeti.Steinberg.finiteToStable hn ℤ (equivFinite n hn z) := by sorry

end IntegerSteinbergModel

/-- `K2SymbolsBrauer:T.5/silvester-word-reduction`: Milnor Lemma 10.6,
pp. 85–90. Induct on the maximum descent height and its last occurrence; the
reader gives all seven cases and the Steinberg identities, including the non-strict
Case 7 inequality. Word length need not decrease. -/
theorem silvester_word_reduction {n : ℕ} (hn : 2 ≤ n) (i : Fin n) (ε : ℤ)
    (hε : ε = 1 ∨ ε = -1) (z : IntegerSteinbergModel n) :
    ∃ (gs : List (IntegerGen n)) (c : IntegerSteinbergModel.monomialSubgroup n),
      (∀ g ∈ gs, g.r = 1 ∨ g.r = -1) ∧ z = (gs.map IntegerSteinbergModel.x).prod * c ∧
      ∀ k < gs.length,
        IntegerSteinbergModel.rowNorm (IntegerSteinbergModel.act (fun j => if j = i then ε else 0)
          ((gs.take k).map IntegerSteinbergModel.x).prod) ≤
        IntegerSteinbergModel.rowNorm (IntegerSteinbergModel.act (fun j => if j = i then ε else 0)
          ((gs.take (k + 1)).map IntegerSteinbergModel.x).prod) := by sorry

/-- `K2SymbolsBrauer:T.5/integer-kernel-in-monomial-subgroup`: Milnor Lemma 10.7,
pp. 90–92. Norm-one prefixes fix e_n; last-column rearrangement reduces to rank n−1.
The n=2 base uses the auxiliary presentation, without stabilization injectivity. -/
theorem integer_kernel_in_monomial_subgroup (n : ℕ) (hn : 1 ≤ n) :
    (IntegerSteinbergModel.toElementary n).ker ≤ IntegerSteinbergModel.monomialSubgroup n := by sorry

/-- `K2SymbolsBrauer:T.5/integer-kernel-upper-generation`: Milnor §9/§10.
Represent a stable kernel element at rank n≥3; the preceding lemma puts it in W_n.
T.2 must supply the monomial-kernel theorem (G-monomial-kernel; no exact node yet): its kernel
is generated by unit symbols. Since ℤˣ={±1}, only c={−1,−1} remains, and c²=1.
This upper bound uses neither the real sign nor the calculation of K₂(ℚ). -/
theorem integer_kernel_upper_generation (z : K2 ℤ) :
    z = 1 ∨ z = steinbergSymbol (-1 : ℤˣ) (-1) (Commute.all _ _) := by
  sorry

/-- `K2SymbolsBrauer:T.5/k2-of-the-integers`: `K₂(ℤ)` is cyclic of order two, generated by
`{-1, -1}`, and `K₂(ℤ) → K₂(ℝ) → {±1}` is an isomorphism. The upper bound is Milnor's
word proof in `integer_kernel_upper_generation`, independent of the real-sign lower bound. -/
theorem k2_of_the_integers :
    Nat.card (K2 ℤ) = 2 ∧
      Subgroup.zpowers (steinbergSymbol (-1 : ℤˣ) (-1) (Commute.all _ _)) = ⊤ ∧
      Function.Bijective (signSymbolAt (Int.castRingHom ℝ)) := by
  sorry

/- The certificate for `K₂(ℤ)` (one generator `{-1, -1}`, one relation `2g = 0`, span from
integer_kernel_upper_generation, lower bound the real sign symbol) is stated in ArithmeticKTheory N.6's format by
N.6/N.8, which import `k2_of_the_integers`. -/

/-- `K2SymbolsBrauer:T.5/k2-of-the-rationals` (Application III.6.5.1): the residue sum gives the
split exact sequence `1 → K₂(ℤ) → K₂(ℚ) → ⊕_p 𝔽_pˣ → 1`, split by the real sign symbol; in
particular `K₂(ℚ)` is infinite. -/
theorem k2_of_the_rationals :
    Function.Injective (K2.map (Int.castRingHom ℚ)) ∧
    (K2.map (Int.castRingHom ℚ)).range = unramifiedSubgroup primeVal primeVal_surjective ∧
    (∀ y : Π₀ p : Nat.Primes, Additive (ResidueField (primeVal p))ˣ,
      ∃ x : K2 ℚ, ∀ p, Additive.ofMul (tameSymbolHomK2 (primeVal p) (primeVal_surjective p) x) =
        y p) ∧
    Function.Bijective ((signSymbolAt (Rat.castHom ℝ)).comp (K2.map (Int.castRingHom ℚ))) ∧
    Infinite (K2 ℚ) := by
  sorry

end TauCeti.TameSymbol

/-! ## `K2SymbolsBrauer:T.6` — Dennis–Stein symbols and relative `K₂`

Convention (pinned): the modern Dennis–Stein symbol `⟨r, s⟩`, defined when `1 - rs` is a unit;
the pre-1980 symbol (`1 + ab` a unit) is `⟨-a, b⟩⁻¹` and is not a second definition. -/

namespace TauCeti.K2

open TauCeti.Steinberg TauCeti.MilnorK

section DennisStein

variable {R : Type u} [Ring R]

/-- The Dennis–Stein word `x_ji(-s u⁻¹) x_ij(-r) x_ji(s) x_ij(u⁻¹ r) h_ij(u)⁻¹` in `St(R)`
(a real definition). -/
def dennisSteinWord {i j : ℕ} (hij : i ≠ j) (r s : R) (u : Rˣ) : StableSteinberg R :=
  StableSteinberg.x hij.symm (-(s * ((u⁻¹ : Rˣ) : R))) * StableSteinberg.x hij (-r) *
    StableSteinberg.x hij.symm s * StableSteinberg.x hij (((u⁻¹ : Rˣ) : R) * r) *
    (StableSteinberg.h hij u)⁻¹

/-- **The Dennis–Stein symbol** `⟨r, s⟩ ∈ K₂(R)` (`K2SymbolsBrauer:T.6/dennis-stein-symbol`) for
commuting `r, s` with `1 - rs` a unit: the Dennis–Stein word at `(i, j) = (0, 1)`; it lies in
`K₂(R)` because its image in `E(R)` is trivial. -/
def dennisStein (r s : R) (hrs : Commute r s) (hu : IsUnit (1 - r * s)) : K2 R :=
  ⟨dennisSteinWord (i := 0) (j := 1) (by decide) r s hu.unit, by sorry⟩

variable (r s : R) (hrs : Commute r s) (hu : IsUnit (1 - r * s))

theorem coe_dennisStein {i j : ℕ} (hij : i ≠ j) :
    (dennisStein r s hrs hu : StableSteinberg R) = dennisSteinWord hij r s hu.unit := by
  sorry

theorem dennisStein_index_indep {i j k l : ℕ} (hij : i ≠ j) (hkl : k ≠ l) :
    dennisSteinWord hij r s hu.unit = dennisSteinWord hkl r s hu.unit := by
  sorry

/-- The image in `E(R)` of the four elementary factors is `diag(u, u⁻¹)` at `(i, j)`, read on
column vectors. -/
theorem phi_dennisSteinWord {i j : ℕ} (hij : i ≠ j) (c : ℕ →₀ R) :
    StableSteinberg.phi R (StableSteinberg.x hij.symm (-(s * ((hu.unit⁻¹ : Rˣ) : R))) *
        StableSteinberg.x hij (-r) * StableSteinberg.x hij.symm s *
        StableSteinberg.x hij (((hu.unit⁻¹ : Rˣ) : R) * r)) c =
      c + Finsupp.single i (((hu.unit : R) - 1) * c i) +
        Finsupp.single j ((((hu.unit⁻¹ : Rˣ) : R) - 1) * c j) := by
  sorry

@[simp]
theorem dennisStein_zero_left (s : R) :
    dennisStein 0 s (Commute.zero_left s) (by simp) = 1 := by
  sorry

@[simp]
theorem dennisStein_zero_right (r : R) :
    dennisStein r 0 (Commute.zero_right r) (by simp) = 1 := by
  sorry

/-- For a unit `r`, `⟨r, s⟩ = {r, 1 - rs}`. -/
theorem dennisStein_eq_steinbergSymbol (u : Rˣ) (s : R) (hus : Commute (u : R) s)
    (hu' : IsUnit (1 - (u : R) * s)) :
    dennisStein (u : R) s hus hu' = steinbergSymbol u hu'.unit (by
      rw [IsUnit.unit_spec]
      exact (Commute.one_right _).sub_right ((Commute.refl _).mul_right hus)) := by
  sorry

/-- For commuting units, `{u, v} = ⟨u, u⁻¹(1 - v)⟩`. -/
theorem steinbergSymbol_eq_dennisStein (u v : Rˣ) (huv : Commute (u : R) v) :
    steinbergSymbol u v huv = dennisStein (u : R) (((u⁻¹ : Rˣ) : R) * (1 - v))
      ((Commute.units_inv_right (Commute.refl _)).mul_right
        ((Commute.one_right _).sub_right huv))
      (by rw [← mul_assoc, Units.mul_inv, one_mul, sub_sub_cancel]; exact v.isUnit) := by
  sorry

theorem map_dennisStein {R' : Type v} [Ring R'] (f : R →+* R') :
    K2.map f (dennisStein r s hrs hu) =
      dennisStein (f r) (f s) (hrs.map f) (by simpa using hu.map f) := by
  sorry

/-- The pre-1980 symbol of `(a, b)`, defined when `1 + ab` is a unit, is `⟨-a, b⟩⁻¹`; no second
symbol is defined, so what is stated is that the old hypothesis is the new one at `(-a, b)`. -/
theorem dennisStein_neg_inv (a b : R) (hab : IsUnit (1 + a * b)) : IsUnit (1 - (-a) * b) := by
  sorry

end DennisStein

-- test TauCeti.K2.phi_dennisSteinWord_two (characterisation)
/- In `GL₂(R)`, with `u = 1 - rs` a unit and `rs = sr`,
`e₂₁(-s u⁻¹) e₁₂(-r) e₂₁(s) e₁₂(u⁻¹ r) = diag(u, u⁻¹)`. -/
example {R : Type u} [Ring R] (r s : R) (hrs : r * s = s * r) (u : Rˣ) (hu : (u : R) = 1 - r * s) :
    !![1, 0; -(s * ((u⁻¹ : Rˣ) : R)), 1] * !![1, -r; 0, 1] * !![1, 0; s, 1] *
        !![1, ((u⁻¹ : Rˣ) : R) * r; 0, 1] = !![(u : R), 0; 0, ((u⁻¹ : Rˣ) : R)] := by
  sorry

-- test TauCeti.K2.dennisStein_zero (degenerate)
example {R : Type u} [Ring R] (r s : R) :
    dennisStein r 0 (Commute.zero_right r) (by simp) = 1 ∧
      dennisStein 0 s (Commute.zero_left s) (by simp) = 1 := by
  sorry

-- test TauCeti.K2.dennisStein_neg_one_neg_two (computation)
/- In `K₂(ℤ)`, `⟨-1, -2⟩ = {-1, 1 - (-1)(-2)} = {-1, -1}`, non-trivial by the sign symbol. -/
example (h : IsUnit (1 - (-1 : ℤ) * (-2))) :
    dennisStein (-1 : ℤ) (-2) (Commute.all _ _) h = steinbergSymbol (-1) (-1) (Commute.all _ _) ∧
      TameSymbol.signSymbolAt (Int.castRingHom ℝ) (dennisStein (-1 : ℤ) (-2) (Commute.all _ _) h) =
        -1 := by
  sorry

-- test TauCeti.K2.dennisStein_not_old_convention (non-example)
/- At `(-1, -2)` in `ℚ` the pre-1980 symbol is `⟨1, -2⟩⁻¹ = {1, 3}⁻¹ = 1`, while the modern
`⟨-1, -2⟩ = {-1, -1} ≠ 1`; over `ℤ` the modern symbol is defined at `(1, 2)` (`1 - 2 = -1`) where
the old hypothesis (`1 + 2 = 3`) fails. -/
example (h₁ : IsUnit (1 - (1 : ℚ) * (-2))) (h₂ : IsUnit (1 - (-1 : ℚ) * (-2))) :
    (dennisStein (1 : ℚ) (-2) (Commute.all _ _) h₁)⁻¹ = 1 ∧
      dennisStein (-1 : ℚ) (-2) (Commute.all _ _) h₂ ≠ 1 ∧
      IsUnit (1 - (1 : ℤ) * 2) ∧ ¬ IsUnit (1 + (1 : ℤ) * 2) := by
  sorry

-- test TauCeti.K2.steinbergSymbol_two_three (compatibility)
/- In `K₂(ℚ)`, `{2, 3} = ⟨2, -1⟩`, the case `u = 2`, `v = 3` of `{u, v} = ⟨u, u⁻¹(1 - v)⟩`. -/
example (h : IsUnit (1 - (2 : ℚ) * (-1))) :
    steinbergSymbol (Units.mk0 (2 : ℚ) (by norm_num)) (Units.mk0 (3 : ℚ) (by norm_num))
      (Commute.all _ _) = dennisStein (2 : ℚ) (-1) (Commute.all _ _) h := by
  sorry

section Relations

variable {R : Type u} [CommRing R]

/-- `K2SymbolsBrauer:T.6/dennis-stein-relations` (D1): `⟨r, s⟩⟨s, r⟩ = 1`. -/
theorem dennis_stein_relations (r s : R) (h : IsUnit (1 - r * s)) (h' : IsUnit (1 - s * r)) :
    dennisStein r s (Commute.all _ _) h * dennisStein s r (Commute.all _ _) h' = 1 := by
  sorry

/-- `K2SymbolsBrauer:T.6/dennis-stein-relations` (D2): `⟨r, s⟩⟨r, t⟩ = ⟨r, s + t - rst⟩`. -/
theorem dennis_stein_relations_add (r s t : R) (hs : IsUnit (1 - r * s)) (ht : IsUnit (1 - r * t))
    (hst : IsUnit (1 - r * (s + t - r * s * t))) :
    dennisStein r s (Commute.all _ _) hs * dennisStein r t (Commute.all _ _) ht =
      dennisStein r (s + t - r * s * t) (Commute.all _ _) hst := by
  sorry

/-- `K2SymbolsBrauer:T.6/dennis-stein-relations` (D3): `⟨r, st⟩ = ⟨rs, t⟩⟨tr, s⟩`. -/
theorem dennis_stein_relations_mul (r s t : R) (h : IsUnit (1 - r * (s * t)))
    (h₁ : IsUnit (1 - r * s * t)) (h₂ : IsUnit (1 - t * r * s)) :
    dennisStein r (s * t) (Commute.all _ _) h =
      dennisStein (r * s) t (Commute.all _ _) h₁ * dennisStein (t * r) s (Commute.all _ _) h₂ := by
  sorry

/-- `K2SymbolsBrauer:T.6/dennis-stein-relations`: `⟨r, 1⟩ = 1` when `1 - r` is a unit (the source
prints `0`; see `K2SymbolsBrauer/E1`). -/
theorem dennis_stein_relations_one (r : R) (h : IsUnit (1 - r * 1)) :
    dennisStein r 1 (Commute.all _ _) h = 1 := by
  sorry

/-- The generators `⟨r, s⟩` of the Dennis–Stein presentation. -/
abbrev DSGen (R : Type u) [CommRing R] := {p : R × R // IsUnit (1 - p.1 * p.2)}

/-- The relations (D1)–(D3) among the generators. -/
def dsRel (R : Type u) [CommRing R] : Set (FreeAbelianGroup (DSGen R)) :=
  {z | ∃ (r s : R) (h : IsUnit (1 - r * s)) (h' : IsUnit (1 - s * r)),
      z = FreeAbelianGroup.of ⟨(r, s), h⟩ + FreeAbelianGroup.of ⟨(s, r), h'⟩} ∪
  {z | ∃ (r s t : R) (hs : IsUnit (1 - r * s)) (ht : IsUnit (1 - r * t))
      (hst : IsUnit (1 - r * (s + t - r * s * t))),
      z = FreeAbelianGroup.of ⟨(r, s), hs⟩ + FreeAbelianGroup.of ⟨(r, t), ht⟩ -
        FreeAbelianGroup.of ⟨(r, s + t - r * s * t), hst⟩} ∪
  {z | ∃ (r s t : R) (h : IsUnit (1 - r * (s * t))) (h₁ : IsUnit (1 - r * s * t))
      (h₂ : IsUnit (1 - t * r * s)),
      z = FreeAbelianGroup.of ⟨(r, s * t), h⟩ - FreeAbelianGroup.of ⟨(r * s, t), h₁⟩ -
        FreeAbelianGroup.of ⟨(t * r, s), h₂⟩}

/-- The abelian group `D(R)` generated by the `⟨r, s⟩` subject only to (D1)–(D3). -/
def dennisSteinGroup (R : Type u) [CommRing R] : Type u :=
  FreeAbelianGroup (DSGen R) ⧸ AddSubgroup.closure (dsRel R)

instance (R : Type u) [CommRing R] : AddCommGroup (dennisSteinGroup R) :=
  inferInstanceAs (AddCommGroup (_ ⧸ AddSubgroup.closure (dsRel R)))

/-- `D(R) → K₂(R)`, generator ↦ Dennis–Stein symbol (the relation check is
`K2SymbolsBrauer:T.6/dennis-stein-relations`). -/
def dennisSteinGroup.toK2 (R : Type u) [CommRing R] : dennisSteinGroup R →+ Additive (K2 R) :=
  QuotientAddGroup.lift _ (FreeAbelianGroup.lift fun p : DSGen R =>
    Additive.ofMul (dennisStein p.1.1 p.1.2 (Commute.all _ _) p.2)) (by sorry)

/-- `K2SymbolsBrauer:T.6/dennis-stein-presentation` (Theorem III.5.11.1(a)): for a commutative
local ring (a field included) `D(R) → K₂(R)` is an isomorphism. For a field it is Matsumoto's
theorem through `⟨r, s⟩ ↦ {r, 1 - rs}`; for a local ring that is not a field it is cited
(Maazen–Stienstra, van der Kallen; Keune [103]). -/
theorem dennis_stein_presentation (R : Type u) [CommRing R] [IsLocalRing R] :
    Function.Bijective (dennisSteinGroup.toK2 R) := by
  sorry

end Relations

/-! ### `K2SymbolsBrauer:T.6/relative-steinberg-group` -/

section Relative

variable (R : Type u) [Ring R] (I : Ideal R) [I.IsTwoSided]

/-- The double ring `R ⊕ I`, realised as `{(a, b) ∈ R × R | b - a ∈ I}` through
`(r, x) ↦ (r, r + x)`: `pr = fst`, `add = snd` (a real definition). -/
def doubleRing : Subring (R × R) where
  carrier := {p | p.2 - p.1 ∈ I}
  mul_mem' := by sorry
  one_mem' := by sorry
  add_mem' := by sorry
  zero_mem' := by sorry
  neg_mem' := by sorry

/-- `add : R ⊕ I → R`, `(r, x) ↦ r + x`. -/
def doubleAdd : doubleRing R I →+* R := (RingHom.snd R R).comp (doubleRing R I).subtype

/-- `pr : R ⊕ I → R`, `(r, x) ↦ r`. -/
def doublePr : doubleRing R I →+* R := (RingHom.fst R R).comp (doubleRing R I).subtype

/-- The element `(0, v)` of `R ⊕ I` for `v ∈ I`. -/
def doubleZeroV (v : R) (hv : v ∈ I) : doubleRing R I := ⟨(0, v), by sorry⟩

/-- The element `(v, -v)` of `R ⊕ I` for `v ∈ I` (`(v, 0)` in the model). -/
def doubleVNeg (v : R) (hv : v ∈ I) : doubleRing R I := ⟨(v, 0), by sorry⟩

/-- `St′(R, I)`: the normal subgroup of `St(R ⊕ I)` generated by the `x_ij(0, v)`, `v ∈ I`
(it is `ker St(pr)`). -/
def stPrime : Subgroup (StableSteinberg (doubleRing R I)) :=
  Subgroup.normalClosure {g | ∃ (i j : ℕ) (hij : i ≠ j) (v : R) (hv : v ∈ I),
    g = StableSteinberg.x hij (doubleZeroV R I v hv)}

/-- The cross-commutators `[x_ij(0, u), x_kl(v, -v)]`, `u, v ∈ I`. -/
def crossCommutators : Subgroup (StableSteinberg (doubleRing R I)) :=
  Subgroup.normalClosure {g | ∃ (i j k l : ℕ) (hij : i ≠ j) (hkl : k ≠ l) (a b : R) (ha : a ∈ I)
    (hb : b ∈ I), g = ⁅StableSteinberg.x hij (doubleZeroV R I a ha),
      StableSteinberg.x hkl (doubleVNeg R I b hb)⁆}

instance crossCommutators_subgroupOf_normal :
    ((crossCommutators R I).subgroupOf (stPrime R I)).Normal :=
  Subgroup.Normal.subgroupOf (Subgroup.normalClosure_normal) _

/-- **The relative Steinberg group** `St(R, I)` (Keune–Loday): `St′(R, I)` modulo the
cross-commutators. -/
def RelSteinberg : Type u := stPrime R I ⧸ (crossCommutators R I).subgroupOf (stPrime R I)

instance : Group (RelSteinberg R I) := inferInstanceAs (Group (_ ⧸ _))

/-- `St(R, I) → St(R)`, induced by `add`. -/
def RelSteinberg.add : RelSteinberg R I →* StableSteinberg R :=
  QuotientGroup.lift _ ((StableSteinberg.map (doubleAdd R I)).comp (stPrime R I).subtype)
    (by sorry)

/-- The range of `St(R, I) → St(R)` is the normal subgroup generated by the `x_ij(v)`, `v ∈ I`. -/
theorem RelSteinberg.range_add : (RelSteinberg.add R I).range =
    Subgroup.normalClosure {g | ∃ (i j : ℕ) (hij : i ≠ j) (v : R), v ∈ I ∧
      g = StableSteinberg.x hij v} := by
  sorry

/-- **Relative `K₂`**: `K₂(R, I) = ker(St(R, I) → E(R, I))`, the map to `E(R, I) ⊆ GL(R)` read
through `St(R)`. -/
def relK2 : Subgroup (RelSteinberg R I) := ((StableSteinberg.phi R).comp (RelSteinberg.add R I)).ker

/-- `K₂(R, I)` is central in `St(R, I)`, hence abelian; the group law is the subgroup's. -/
instance : CommGroup (relK2 R I) := { (inferInstance : Group (relK2 R I)) with mul_comm := sorry }

/-- `K₂(R, I) → K₂(R)` (a real definition). -/
def relK2.toK2 : relK2 R I →* K2 R where
  toFun g := ⟨RelSteinberg.add R I g, g.2⟩
  map_one' := by sorry
  map_mul' := by sorry

/-- Exactness of `K₂(R, I) → K₂(R) → K₂(R/I)` (Theorem III.5.7.1). The continuation
`→ K₁(R, I) → K₁(R) → K₁(R/I)` is not stated here; it needs `K₁(R, I)` and `E(R, I)`
(supplier: KTheoryLowDegrees:U.5). -/
theorem relK2.exact : (relK2.toK2 R I).range = (K2.map (Ideal.Quotient.mk I)).ker := by
  sorry

variable {R I}

/-- Functoriality of `K₂(R, I)`. -/
def relK2.map {R' : Type v} [Ring R'] (I' : Ideal R') [I'.IsTwoSided] (f : R →+* R')
    (hf : ∀ x ∈ I, f x ∈ I') : relK2 R I →* relK2 R' I' :=
  sorry

theorem relK2.map_id : relK2.map I (RingHom.id R) (fun _ hx => hx) = MonoidHom.id (relK2 R I) := by
  sorry

theorem relK2.map_comp {R' : Type v} {R'' : Type w} [Ring R'] [Ring R''] (I' : Ideal R')
    [I'.IsTwoSided] (I'' : Ideal R'') [I''.IsTwoSided] (f : R →+* R') (g : R' →+* R'')
    (hf : ∀ x ∈ I, f x ∈ I') (hg : ∀ x ∈ I', g x ∈ I'') :
    relK2.map I'' (g.comp f) (fun x hx => hg _ (hf x hx)) =
      (relK2.map I'' g hg).comp (relK2.map I' f hf) := by
  sorry

variable (R) in
theorem relK2_bot : ∀ g : relK2 R ⊥, g = 1 := by
  sorry

/-- **The relative Dennis–Stein symbol** `⟨r, s⟩ ∈ K₂(R, I)` for `s ∈ I`: the class of the
Dennis–Stein word of `((r, 0), (0, s))` in `St(R ⊕ I)` (in the model, `(r, r)` and `(0, s)`),
with `1 - (r, 0)(0, s) = (1, -rs)` inverted in `R ⊕ I` (a real definition). -/
def relDennisStein (r s : R) (hs : s ∈ I) (hrs : Commute r s) (hu : IsUnit (1 - r * s)) :
    relK2 R I :=
  ⟨QuotientGroup.mk ⟨dennisSteinWord (i := 0) (j := 1) (by decide)
      (⟨(r, r), by sorry⟩ : doubleRing R I) (doubleZeroV R I s hs)
      { val := ⟨(1, 1 - r * s), by sorry⟩
        inv := ⟨(1, ((hu.unit⁻¹ : Rˣ) : R)), by sorry⟩
        val_inv := by sorry
        inv_val := by sorry }, by sorry⟩, by sorry⟩

theorem toK2_relDennisStein (r s : R) (hs : s ∈ I) (hrs : Commute r s) (hu : IsUnit (1 - r * s)) :
    relK2.toK2 R I (relDennisStein r s hs hrs hu) = dennisStein r s hrs hu := by
  sorry

end Relative

-- test TauCeti.K2.relK2_zero_ideal (degenerate)
example {R : Type u} [Ring R] :
    (∀ g : RelSteinberg R ⊥, g = 1) ∧ ∀ g : relK2 R ⊥, g = 1 := by
  sorry

-- test TauCeti.K2.relK2_Z4 (computation)
/- For `ℤ/4 ⊇ I = (2)`: `K₂(ℤ/2) = 1`, so `K₂(ℤ/4, I) → K₂(ℤ/4)` is onto, and the relative
`⟨2, 2⟩` maps to `⟨2, 2⟩ = {-1, -1}`. -/
example (hu : IsUnit (1 - (2 : ZMod 4) * 2)) :
    Function.Surjective (relK2.toK2 (ZMod 4) (Ideal.span {2})) ∧
      relK2.toK2 (ZMod 4) (Ideal.span {2})
        (relDennisStein 2 2 (Ideal.mem_span_singleton_self 2) (Commute.all _ _) hu) =
        steinbergSymbol (-1) (-1) (Commute.all _ _) := by
  sorry

-- test TauCeti.K2.RelSteinberg.range_add_top (characterisation)
example {R : Type u} [Ring R] :
    (RelSteinberg.add R ⊤).range = ⊤ ∧ (RelSteinberg.add R ⊥).range = ⊥ := by
  sorry

section RelativePresentation

variable {R : Type u} [CommRing R] (I : Ideal R)

/-- The generators of the relative presentation: pairs with an entry in `I`. -/
abbrev RelDSGen (I : Ideal R) := {p : R × R // p.1 ∈ I ∨ p.2 ∈ I}

/-- The relations (D1)–(D3) among the relative generators (whenever `r`, `s` or `t` lies in `I`,
every symbol involved is a generator). -/
def relDSRel : Set (FreeAbelianGroup (RelDSGen I)) :=
  {z | ∃ (r s : R) (h : r ∈ I ∨ s ∈ I) (h' : s ∈ I ∨ r ∈ I),
      z = FreeAbelianGroup.of ⟨(r, s), h⟩ + FreeAbelianGroup.of ⟨(s, r), h'⟩} ∪
  {z | ∃ (r s t : R) (hs : r ∈ I ∨ s ∈ I) (ht : r ∈ I ∨ t ∈ I)
      (hst : r ∈ I ∨ s + t - r * s * t ∈ I),
      z = FreeAbelianGroup.of ⟨(r, s), hs⟩ + FreeAbelianGroup.of ⟨(r, t), ht⟩ -
        FreeAbelianGroup.of ⟨(r, s + t - r * s * t), hst⟩} ∪
  {z | ∃ (r s t : R) (hI3 : r ∈ I ∨ s ∈ I ∨ t ∈ I),
      z = FreeAbelianGroup.of ⟨(r, s * t), by
        rcases hI3 with hr | hs | ht
        · exact Or.inl hr
        · exact Or.inr (I.mul_mem_right t hs)
        · exact Or.inr (I.mul_mem_left s ht)⟩ -
      FreeAbelianGroup.of ⟨(r * s, t), by
        rcases hI3 with hr | hs | ht
        · exact Or.inl (I.mul_mem_right s hr)
        · exact Or.inl (I.mul_mem_left r hs)
        · exact Or.inr ht⟩ -
      FreeAbelianGroup.of ⟨(t * r, s), by
        rcases hI3 with hr | hs | ht
        · exact Or.inl (I.mul_mem_left t hr)
        · exact Or.inr hs
        · exact Or.inl (I.mul_mem_right r ht)⟩}

/-- The relative Dennis–Stein group, generated by the relative generators subject only to
(D1), (D2), and D3 only when an entry of the triple is in I. Pair admissibility alone
is not a relation condition. -/
def relDennisSteinGroup : Type u := FreeAbelianGroup (RelDSGen I) ⧸ AddSubgroup.closure (relDSRel I)

instance : AddCommGroup (relDennisSteinGroup I) :=
  inferInstanceAs (AddCommGroup (_ ⧸ AddSubgroup.closure (relDSRel I)))

open Classical in
/-- For `I ⊆ rad R`, generator `(r, s)` ↦ `⟨r, s⟩` (`s ∈ I`) or `⟨s, r⟩⁻¹` (`r ∈ I`); every
`1 - rs` is a unit because `rs ∈ I ⊆ rad R`. -/
def relDennisSteinGroup.toRelK2 (hI : I ≤ Ideal.jacobson ⊥) :
    relDennisSteinGroup I →+ Additive (relK2 R I) :=
  QuotientAddGroup.lift _ (FreeAbelianGroup.lift fun p : RelDSGen I =>
    if h : p.1.2 ∈ I then Additive.ofMul (relDennisStein p.1.1 p.1.2 h (Commute.all _ _) (by sorry))
    else Additive.ofMul (relDennisStein p.1.2 p.1.1 (p.2.resolve_right h) (Commute.all _ _)
      (by sorry))⁻¹) (by
      -- Check the relation generators, then extend to their additive closure.
      -- D1/D2 use relative-symbol identities. For D3 split on its hI3 witness;
      -- use D1 to place the ideal entry correctly and apply the source's relative D3.
      -- There is no case for a triple with all entries outside I.
      sorry)

/-- `K2SymbolsBrauer:T.6/relative-presentation` (Theorem III.5.11.1(b), cited): for a radical ideal
of a commutative ring, `K₂(R, I)` is presented by the relative Dennis–Stein symbols subject only
to (D1)–(D3). -/
theorem relative_presentation (hI : I ≤ Ideal.jacobson ⊥) :
    Function.Bijective (relDennisSteinGroup.toRelK2 I hI) := by
  sorry

-- test TauCeti.K2.relative_D3_guard (non-example)
-- This actual iterated dual-number ring is F_3[x,y]/(x²,y²), not a free carrier.
example :
    let R := DualNumber (DualNumber (ZMod 3))
    let x : R := TrivSqZeroExt.inl (DualNumber.eps : DualNumber (ZMod 3))
    let y : R := DualNumber.eps
    let I : Ideal R := Ideal.span {x * y}
    I ^ 2 = ⊥ ∧ I ≤ Ideal.jacobson ⊥ ∧
      ¬ (x ∈ I ∨ y ∈ I ∨ x + y ∈ I) ∧
      (x ∈ I ∨ y * (x + y) ∈ I) ∧
      (x * y ∈ I ∨ x + y ∈ I) ∧
      ((x + y) * x ∈ I ∨ y ∈ I) := by
  sorry

-- test TauCeti.K2.relative_D3_detector (computation)
-- Ex. III.5.14(a) and relative_square_zero_kaehler give δ⟨i,a⟩ = i⊗da.
-- The following signature identifies the actual tensor target and the three images.
example :
    let R := DualNumber (DualNumber (ZMod 3))
    let x : R := TrivSqZeroExt.inl (DualNumber.eps : DualNumber (ZMod 3))
    let y : R := DualNumber.eps
    let I : Ideal R := Ideal.span {x * y}
    let z : I := ⟨x * y, by exact Ideal.subset_span (by simp)⟩
    letI : Module R Ω[(R ⧸ I)⁄ℤ] := Module.compHom _ (Ideal.Quotient.mk I)
    ∃ coord : (I ⊗[R] Ω[(R ⧸ I)⁄ℤ]) ≃+ (ZMod 3 × ZMod 3),
      coord (-(z ⊗ₜ KaehlerDifferential.D ℤ (R ⧸ I) (Ideal.Quotient.mk I x))) = (2, 0) ∧
      coord (z ⊗ₜ KaehlerDifferential.D ℤ (R ⧸ I) (Ideal.Quotient.mk I (x + y))) = (1, 1) ∧
      coord (z ⊗ₜ KaehlerDifferential.D ℤ (R ⧸ I) (Ideal.Quotient.mk I y)) = (0, 1) ∧
      coord (-(z ⊗ₜ KaehlerDifferential.D ℤ (R ⧸ I) (Ideal.Quotient.mk I x)) -
        (z ⊗ₜ KaehlerDifferential.D ℤ (R ⧸ I) (Ideal.Quotient.mk I (x + y))) -
        (z ⊗ₜ KaehlerDifferential.D ℤ (R ⧸ I) (Ideal.Quotient.mk I y))) = (1, 1) ∧
      ((1, 1) : ZMod 3 × ZMod 3) ≠ 0 := by
  sorry

-- test TauCeti.K2.relative_presentation_bot (degenerate)
example {A : Type u} [CommRing A] :
    Subsingleton (relDennisSteinGroup (⊥ : Ideal A)) := by
  sorry

end RelativePresentation

section SquareZero

variable {A : Type u} [CommRing A]

/-- `K2SymbolsBrauer:T.6/relative-square-zero`: for `I² = 0` every `⟨a, s⟩`, `s ∈ I`, is defined
(`1 - as` has inverse `1 + as`). -/
theorem relative_square_zero (I : Ideal A) (hI : I ^ 2 = ⊥) (a s : A) (hs : s ∈ I) :
    IsUnit (1 - a * s) := by
  sorry

/-- `K2SymbolsBrauer:T.6/relative-square-zero`: `⟨s, a⟩ = ⟨a, s⟩⁻¹` and `s ↦ ⟨a, s⟩` is additive
on `I` (the term `ast` of (D2) lies in `I² = 0`). -/
theorem relative_square_zero_symm_add (I : Ideal A) (hI : I ^ 2 = ⊥) (a s t : A) (hs : s ∈ I)
    (ht : t ∈ I) (h₁ : IsUnit (1 - a * s)) (h₂ : IsUnit (1 - s * a)) (h₃ : IsUnit (1 - a * t))
    (h₄ : IsUnit (1 - a * (s + t))) :
    dennisStein s a (Commute.all _ _) h₂ = (dennisStein a s (Commute.all _ _) h₁)⁻¹ ∧
      dennisStein a (s + t) (Commute.all _ _) h₄ =
        dennisStein a s (Commute.all _ _) h₁ * dennisStein a t (Commute.all _ _) h₃ := by
  sorry

/-- `K2SymbolsBrauer:T.6/relative-square-zero` on Mathlib's `TrivSqZeroExt R M` with
`I = kerIdeal R M`: `K₂(A, I)` is generated by the relative `⟨a, s⟩`, `s ∈ I`. -/
theorem relative_square_zero_generation (R M : Type u) [CommRing R] [AddCommGroup M] [Module R M]
    [Module Rᵐᵒᵖ M] [IsCentralScalar R M] :
    Subgroup.closure {g | ∃ (a s : TrivSqZeroExt R M) (hs : s ∈ TrivSqZeroExt.kerIdeal R M)
      (hu : IsUnit (1 - a * s)), g = relDennisStein a s hs (Commute.all _ _) hu} =
      (⊤ : Subgroup (relK2 (TrivSqZeroExt R M) (TrivSqZeroExt.kerIdeal R M))) := by
  sorry

/-- `K2SymbolsBrauer:T.6/relative-square-zero`, Ex. III.5.14(c) (van der Kallen, cited): for the dual
numbers with `1/2 ∈ R`, `K₂(R[ε], (ε)) ≃ Ω¹_R`. -/
theorem relative_square_zero_dualNumber (R : Type u) [CommRing R] (h2 : IsUnit (2 : R)) :
    Nonempty (Additive (relK2 (DualNumber R) (TrivSqZeroExt.kerIdeal R R)) ≃+ Ω[R⁄ℤ]) := by
  sorry

/-- `K2SymbolsBrauer:T.6/relative-square-zero`, Ex. III.5.13: `K₂(ℤ/2ⁿ) ≅ {±1}` for `n ≥ 2`, and in
`K₂(ℤ/4)`, `{-1, -1} = ⟨-1, -2⟩ = ⟨2, 2⟩`. -/
theorem relative_square_zero_zmod (n : ℕ) (hn : 2 ≤ n) (h₁ : IsUnit (1 - (-1 : ZMod 4) * (-2)))
    (h₂ : IsUnit (1 - (2 : ZMod 4) * 2)) :
    Nat.card (K2 (ZMod (2 ^ n))) = 2 ∧
      steinbergSymbol (-1 : (ZMod 4)ˣ) (-1) (Commute.all _ _) =
        dennisStein (-1 : ZMod 4) (-2) (Commute.all _ _) h₁ ∧
      dennisStein (-1 : ZMod 4) (-2) (Commute.all _ _) h₁ =
        dennisStein (2 : ZMod 4) 2 (Commute.all _ _) h₂ := by
  sorry

/-- `K2SymbolsBrauer:T.6/relative-square-zero`, Ex. III.5.14(a),(b) (exercises in the source): for
`I² = 0` there is a surjection `K₂(A, I) → I ⊗_A Ω¹_{A/I}`, `⟨x, r⟩ ↦ x ⊗ dr̄` (so
`⟨r, x⟩ ↦ -(x ⊗ dr̄)`), whose kernel is generated by the `⟨x, y⟩` with `x, y ∈ I`. -/
theorem relative_square_zero_kaehler (I : Ideal A) (hI : I ^ 2 = ⊥) :
    letI : Module A Ω[(A ⧸ I)⁄ℤ] := Module.compHom _ (Ideal.Quotient.mk I)
    ∃ f : Additive (relK2 A I) →+ (I ⊗[A] Ω[(A ⧸ I)⁄ℤ]), Function.Surjective f ∧
      (∀ (x : A) (hx : x ∈ I) (r : A) (hu : IsUnit (1 - r * x)),
        f (Additive.ofMul (relDennisStein r x hx (Commute.all _ _) hu)) =
          -((⟨x, hx⟩ : I) ⊗ₜ KaehlerDifferential.D ℤ (A ⧸ I) (Ideal.Quotient.mk I r))) ∧
      f.ker = AddSubgroup.closure {z | ∃ (x y : A) (_ : x ∈ I) (hy : y ∈ I)
        (hu : IsUnit (1 - x * y)), z = Additive.ofMul (relDennisStein x y hy (Commute.all _ _) hu)} := by
  sorry

/- The comparison of `K₂(A, I)` with GeneralAlgebraicKTheory K.5's relative group, of which the
square-zero values above are tests: not stated here; needs `K(A, I)` as the homotopy fibre of
`K(A) → K(A/I)` and the Keune–Loday comparison (supplier: GeneralAlgebraicKTheory:K.5). -/

end SquareZero

end TauCeti.K2

/-! ## `K2SymbolsBrauer:T.7` — norm residue symbols

Convention (pinned): local reciprocity, and hence the norm residue symbol, carries the
arithmetic-Frobenius normalisation of ClassFieldTheory Layer 6, and the variable order is the
source's, `x ↦ (x, -)_F`. -/

namespace TauCeti.Twist

open TauCeti

variable {F : Type u} [Field F] {m : ℕ} [NeZero m]

/-- The weight-one trivialisation `τ_ζ^{(1)} : ZMod m ≃+ μ_m = KummerCoeff F m`, `1 ↦ ζ`, for a
primitive `m`-th root of unity `ζ ∈ F`: `IsPrimitiveRoot.zmodEquivZPowers` followed by
`IsPrimitiveRoot.zpowers_eq`, read in `KummerCoeff F m` (a real definition). This is the `j = 1`
case of the packet's `TauCeti.Twist.trivialisation`, whose other weights need the twists
`μ_m^{⊗j}` (not pinned; see below). -/
def trivialisationOne {ζ : F} (hζ : IsPrimitiveRoot ζ m) : ZMod m ≃+ KummerCoeff F m :=
  let η : (SeparableClosure F)ˣ :=
    ((hζ.map_of_injective (algebraMap F (SeparableClosure F)).injective).isUnit
      (NeZero.ne m)).unit
  have hη : IsPrimitiveRoot η m := by sorry
  hη.zmodEquivZPowers.trans (MulEquiv.subgroupCongr hη.zpowers_eq).toAdditive

/-- The weight-one change-of-root rule `τ_{ζ^u}^{(1)} = τ_ζ^{(1)} ∘ (u ·)`. -/
theorem trivialisationOne_pow {ζ : F} (hζ : IsPrimitiveRoot ζ m) (u : (ZMod m)ˣ) (a : ZMod m) :
    trivialisationOne (hζ.pow_of_coprime _ (ZMod.val_coe_unit_coprime u)) a =
      trivialisationOne hζ ((u : ZMod m) * a) := by
  sorry

/- `K2SymbolsBrauer:T.7/twisted-roots-of-unity`, the twists `μ_m^{⊗j}` (`j ∈ ℤ`) with the diagonal
action:
`TauCeti.Twist.trivialisation`: not stated here; needs μ_m^{⊗j} for j ≠ 0, 1 (supplier:
MotivicEtaleKTheory:M.1) — its weight-one case is `trivialisationOne` above.
`TauCeti.Twist.trivialisation_one`: not stated here; needs μ_m^{⊗j} (supplier:
MotivicEtaleKTheory:M.1).
`TauCeti.Twist.trivialisation_zero`: not stated here; needs μ_m^{⊗0} as the twist of weight zero
(supplier: MotivicEtaleKTheory:M.1).
`TauCeti.Twist.trivialisation_equivariant`: not stated here; needs the G_F-action on μ_m^{⊗j}
(supplier: MotivicEtaleKTheory:M.1).
`TauCeti.Twist.trivialisation_pow`: not stated here; needs μ_m^{⊗j} (supplier:
MotivicEtaleKTheory:M.1) — its weight-one case is `trivialisationOne_pow`.
`TauCeti.Twist.trivialisation_tensor`: not stated here; needs the pairings
μ_m^{⊗i} ⊗ μ_m^{⊗j} ≅ μ_m^{⊗(i+j)} (supplier: MotivicEtaleKTheory:M.1).
`TauCeti.Twist.trivialisation_one_eq`: realised by the definition of `trivialisationOne`
(`zmodEquivZPowers` followed by `zpowers_eq`, read in `KummerCoeff F m`); as an identity about
`trivialisation` it needs μ_m^{⊗1} as a twist (supplier: MotivicEtaleKTheory:M.1).
-- test TauCeti.Twist.trivialisation_zero_indep (degenerate): not stated here; needs μ_m^{⊗0}
(supplier: MotivicEtaleKTheory:M.1).
-- test TauCeti.Twist.trivialisation_two (computation): not stated here; needs μ_2^{⊗j}
(supplier: MotivicEtaleKTheory:M.1).
-- test TauCeti.Twist.trivialisation_pow_five (characterisation): the weight-one half is the
example below; the weight-two half needs μ_5^{⊗2} (supplier: MotivicEtaleKTheory:M.1).
-- test TauCeti.Twist.twist_Q_three (non-example): not stated here; needs μ_3^{⊗2} and H⁰ of it
(supplier: MotivicEtaleKTheory:M.1). -/

-- test TauCeti.Twist.trivialisation_pow_five (characterisation), weight one
/- For `m = 5` and `ζ' = ζ²`: `τ_{ζ'}^{(1)} = τ_ζ^{(1)} ∘ (2 ·)`. -/
example {F : Type u} [Field F] {ζ : F} (hζ : IsPrimitiveRoot ζ 5) (a : ZMod 5) :
    trivialisationOne (hζ.pow_of_coprime 2 (by norm_num)) a = trivialisationOne hζ (2 * a) := by
  sorry

end TauCeti.Twist

namespace TauCeti.NormResidueSymbol

open TauCeti TauCeti.MilnorK TauCeti.Steinberg TauCeti.ContCohomology

section Local

variable (F : Type u) [Field F] [ValuativeRel F] [TopologicalSpace F] [IsNonarchimedeanLocalField F]
  (m : ℕ) [NeZero m] [HasEnoughRootsOfUnity F m]

/-- **The `m`-th power norm residue symbol** `(x, y)_F ∈ μ_m`
(`K2SymbolsBrauer:T.7/classical-local-symbols`, Example III.6.2.3), for a nonarchimedean local
field with `μ_m ⊆ F` and `m` invertible: the value at `y` of the character of `Fˣ` attached, by
Kummer theory, to the local reciprocity image of `x` (arithmetic Frobenius). -/
def normResidueSymbol (hm : IsUnit (m : F)) (x y : Fˣ) : rootsOfUnity m F :=
  sorry

variable {F m} (hm : IsUnit (m : F))

/- `TauCeti.NormResidueSymbol.normResidueSymbol_apply`: not stated here; needs the local
reciprocity map `Fˣ → Gal(Fˢ/F)^{ab}` with its arithmetic-Frobenius normalisation (supplier:
ClassFieldTheory Layer 6, `localArtinEquiv`). -/

theorem normResidueSymbol_mul_left (x x' y : Fˣ) :
    normResidueSymbol F m hm (x * x') y = normResidueSymbol F m hm x y * normResidueSymbol F m hm x' y := by
  sorry

theorem normResidueSymbol_mul_right (x y y' : Fˣ) :
    normResidueSymbol F m hm x (y * y') = normResidueSymbol F m hm x y * normResidueSymbol F m hm x y' := by
  sorry

@[simp]
theorem normResidueSymbol_pow_right (x y : Fˣ) : normResidueSymbol F m hm x (y ^ m) = 1 := by
  sorry

/-- The source's "norm residue" property, read with `(x, y)_F` (see `K2SymbolsBrauer/E2`):
`(x, -)_F` is trivial exactly when `x` is an `m`-th power. -/
theorem forall_normResidueSymbol_eq_one_iff (x : Fˣ) :
    (∀ y, normResidueSymbol F m hm x y = 1) ↔ ∃ z : Fˣ, z ^ m = x := by
  sorry

theorem normResidueSymbol_one_sub (a : Fˣ) (ha : (a : F) ≠ 1) :
    normResidueSymbol F m hm a (Units.mk0 (1 - (a : F)) (sub_ne_zero.mpr ha.symm)) = 1 := by
  sorry

variable (F m) in
/-- The Steinberg symbol `K₂(F) → μ_m`, `{x, y} ↦ (x, y)_F` (through Matsumoto). -/
def normResidueK2 (hm : IsUnit (m : F)) : K2 F →* rootsOfUnity m F := sorry

theorem normResidueK2_steinbergSymbol (x y : Fˣ) :
    normResidueK2 F m hm (steinbergSymbol x y (Commute.all _ _)) = normResidueSymbol F m hm x y := by
  sorry

-- test TauCeti.NormResidueSymbol.normResidueSymbol_pow (degenerate)
example (x y : Fˣ) :
    normResidueSymbol F m hm x (y ^ m) = 1 ∧ normResidueSymbol F m hm x 1 = 1 := by
  sorry

end Local

open Classical in
/-- The source's conic symbol `c_F(r, s) ∈ {±1}` (`K2SymbolsBrauer:T.7/hilbert-symbol-steinberg`):
`+1` exactly when `r x² + s y² = 1` has a solution in `F` (a real definition). -/
def conicSymbol (F : Type u) [Field F] (r s : F) : ℤˣ :=
  if ∃ x y : F, r * x ^ 2 + s * y ^ 2 = 1 then 1 else -1

/- `TauCeti.NormResidueSymbol.hilbertSymbol_eq_one_iff_conic`: not stated here; needs `hilbertSymbol`
with its bimultiplicativity (supplier: QuadraticFormInvariants 6C). The source's `c_F` is
`conicSymbol`, and the statements below use it. -/

section Hilbert

variable (F : Type u) [Field F] [ValuativeRel F] [TopologicalSpace F] [IsNonarchimedeanLocalField F]

/-- **The Hilbert symbol as a Steinberg symbol**: `K₂(F) →* ℤˣ`, `{r, s} ↦ c_F(r, s)`, for a
nonarchimedean local field with `2` invertible (bilinear there; over `ℚ` it is not). -/
def hilbertK2 (h2 : IsUnit (2 : F)) : K2 F →* ℤˣ := sorry

variable {F}

@[simp]
theorem hilbertK2_symbol (h2 : IsUnit (2 : F)) (r s : Fˣ) :
    hilbertK2 F h2 (steinbergSymbol r s (Commute.all _ _)) = conicSymbol F r s := by
  sorry

/-- For `m = 2` the norm residue symbol is the Hilbert symbol (Example III.6.2.2); QuadraticForm-
Invariants 6C's `hilbertSymbol` is the same map (`hilbertSymbol_eq_qfi`, cited). -/
theorem normResidueSymbol_two [HasEnoughRootsOfUnity F 2] (hm : IsUnit ((2 : ℕ) : F)) (a b : Fˣ) :
    ((normResidueSymbol F 2 hm a b : Fˣ) : F) = ((conicSymbol F a b : ℤ) : F) := by
  sorry

theorem hilbertK2_eq_normResidueK2 [HasEnoughRootsOfUnity F 2] (h2 : IsUnit (2 : F))
    (hm : IsUnit ((2 : ℕ) : F)) (x : K2 F) :
    Units.map (Int.castRingHom F).toMonoidHom (hilbertK2 F h2 x) =
      (normResidueK2 F 2 hm x : Fˣ) := by
  sorry

end Hilbert

/-- Over `ℝ`, the conic symbol is the sign symbol of `K2SymbolsBrauer:T.5/real-sign-symbol`. -/
theorem hilbertK2_real (r s : ℝˣ) :
    conicSymbol ℝ r s = TameSymbol.realSignSymbol (steinbergSymbol r s (Commute.all _ _)) ∧
      conicSymbol ℝ r s = if (r : ℝ) < 0 ∧ (s : ℝ) < 0 then -1 else 1 := by
  sorry

-- test TauCeti.NormResidueSymbol.normResidueSymbol_Q2 (computation)
example [HasEnoughRootsOfUnity ℚ_[2] 2] (hm : IsUnit ((2 : ℕ) : ℚ_[2])) :
    (normResidueSymbol ℚ_[2] 2 hm (-1) (-1) : ℚ_[2]ˣ) = -1 := by
  sorry

-- test TauCeti.NormResidueSymbol.normResidueSymbol_Q3 (characterisation)
example [HasEnoughRootsOfUnity ℚ_[3] 2] (hm : IsUnit ((2 : ℕ) : ℚ_[3])) :
    (normResidueSymbol ℚ_[3] 2 hm (Units.mk0 3 (by norm_num)) (-1) : ℚ_[3]ˣ) = -1 := by
  sorry

-- test TauCeti.NormResidueSymbol.normResidueSymbol_not_tame (non-example)
/- On `ℚ₂` with `m = 2`, the tame symbol of `(-1, -1)` is `1` (both are units) while
`(-1, -1)_{ℚ₂} = -1`. -/
example [HasEnoughRootsOfUnity ℚ_[2] 2] (hm : IsUnit ((2 : ℕ) : ℚ_[2]))
    (hv : Function.Surjective (Padic.mulValuation (p := 2))) :
    TameSymbol.tameSymbol (Padic.mulValuation (p := 2)) hv (-1) (-1) = 1 ∧
      (normResidueSymbol ℚ_[2] 2 hm (-1) (-1) : ℚ_[2]ˣ) = -1 := by
  sorry

-- test TauCeti.NormResidueSymbol.normResidueSymbol_eq_tame_odd (compatibility)
/- On `ℚ_p`, `p` odd, `m = 2`: `(r, s) = ε(∂(r, s))`, `ε : 𝔽_pˣ → {±1}` the quadratic character, so
`(r, s) = 1` exactly when the tame symbol is a square (the inversion between the roadmap's and
the K-book's tame symbol is invisible to `ε`). -/
example (p : ℕ) [Fact p.Prime] (hp : p ≠ 2) [HasEnoughRootsOfUnity ℚ_[p] 2]
    (hm : IsUnit ((2 : ℕ) : ℚ_[p])) (hv : Function.Surjective (Padic.mulValuation (p := p)))
    (r s : ℚ_[p]ˣ) :
    (normResidueSymbol ℚ_[p] 2 hm r s : ℚ_[p]ˣ) = 1 ↔
      IsSquare (TameSymbol.tameSymbol (Padic.mulValuation (p := p)) hv r s) := by
  sorry

-- test TauCeti.NormResidueSymbol.hilbertSymbol_Q2 (computation)
example : conicSymbol ℚ_[2] (-1) (-1) = -1 := by
  sorry

-- test TauCeti.NormResidueSymbol.hilbertSymbol_real (compatibility)
example (r s : ℝˣ) : conicSymbol ℝ r s = -1 ↔ (r : ℝ) < 0 ∧ (s : ℝ) < 0 := by
  sorry

-- test TauCeti.NormResidueSymbol.conicSymbol_zero_not_hilbert (non-example)
example : conicSymbol ℝ 0 0 = -1 ∧ ¬ ((0 : ℝ) < 0 ∧ (0 : ℝ) < 0) := by
  simp [conicSymbol]

-- test TauCeti.NormResidueSymbol.hilbertSymbol_eq_qfi (compatibility): not stated here; needs
-- `hilbertSymbol` of QuadraticFormInvariants 6C (supplier: QuadraticFormInvariants 6C).

-- test TauCeti.NormResidueSymbol.hilbertSymbol_degenerate (degenerate)
example {F : Type u} [Field F] (r s : F) : conicSymbol F 1 s = 1 ∧ conicSymbol F r (1 - r) = 1 := by
  sorry

-- test TauCeti.NormResidueSymbol.conicSymbol_Q_not_bilinear (non-example)
/- `c_ℚ(3, -1) = c_ℚ(7, -1) = c_ℚ(21, -1) = -1`, so `c_ℚ(21, -1) ≠ c_ℚ(3, -1) c_ℚ(7, -1)`. -/
example : conicSymbol ℚ 3 (-1) = -1 ∧ conicSymbol ℚ 7 (-1) = -1 ∧ conicSymbol ℚ 21 (-1) = -1 := by
  sorry

/-! ### `K2SymbolsBrauer:T.7/brauer-valued-symbol`

`Br(F)` is taken in its cohomological form `H²(G_F, (Fˢ)ˣ)`, Tau Ceti's
`H2 (AbsoluteGaloisGroup F) (UnitsCoeff F)`; its identification with Tau Ceti's `BrauerGroup F` of
central simple algebras is cited, not pinned. -/

section Brauer

variable {F : Type u} [Field F] {m : ℕ} [NeZero m]

/-- The pairing `μ_m × μ_m → μ_m`, `(a, b) ↦ τ_ζ⁻¹(b) · a`, i.e. `id ⊗ τ_ζ^{(1)⁻¹}` on
`μ_m ⊗ μ_m` (equivariant because `ζ ∈ F`; a real definition). -/
def rootPairing {ζ : F} (hζ : IsPrimitiveRoot ζ m) :
    KummerCoeff F m →+ KummerCoeff F m →+ KummerCoeff F m where
  toFun a :=
    { toFun := fun b => ((Twist.trivialisationOne hζ).symm b).val • a
      map_zero' := by sorry
      map_add' := by sorry }
  map_zero' := by sorry
  map_add' := by sorry

theorem rootPairing_continuous {ζ : F} (hζ : IsPrimitiveRoot ζ m) :
    Continuous fun p : KummerCoeff F m × KummerCoeff F m => rootPairing hζ p.1 p.2 := by
  sorry

theorem rootPairing_equivariant {ζ : F} (hζ : IsPrimitiveRoot ζ m) (g : AbsoluteGaloisGroup F)
    (a b : KummerCoeff F m) : rootPairing hζ (g • a) (g • b) = g • rootPairing hζ a b := by
  sorry

/-- The equivariant inclusion `μ_m → (Fˢ)ˣ` (`kummerCoeffIncl`, `kummerCoeffIncl_equivariant`). -/
def kummerCoeffInclHom (F : Type u) [Field F] (m : ℕ) :
    KummerCoeff F m →+[AbsoluteGaloisGroup F] UnitsCoeff F where
  toFun := kummerCoeffIncl F m
  map_smul' g x := kummerCoeffIncl_equivariant F m g x
  map_zero' := map_zero _
  map_add' := map_add _

/-- **The Brauer-valued symbol** `β_ζ : K₂(F) → Br(F)[m]` attached to a primitive root `ζ ∈ F`:
the Galois symbol `h_F`, then `id ⊗ τ_ζ^{(1)⁻¹}`, then `H²(G_F, μ_m) → H²(G_F, (Fˢ)ˣ)`. Its values
are killed by `m` (`nsmul_brauerSymbol`). -/
def brauerSymbol (hm : IsUnit (m : F)) {ζ : F} (hζ : IsPrimitiveRoot ζ m) :
    K2 F →* Multiplicative (H2 (AbsoluteGaloisGroup F) (UnitsCoeff F)) :=
  sorry

variable (hm : IsUnit (m : F)) {ζ : F} (hζ : IsPrimitiveRoot ζ m)

/-- `β_ζ{a, b}` is the image of `κ(a) ∪ κ(b)` under `id ⊗ τ_ζ⁻¹` and `μ_m → (Fˢ)ˣ`, computed with
the pinned `kummerMap` and `explicitCup11`. -/
theorem brauerSymbol_symbol (a b : Fˣ) :
    Multiplicative.toAdd (brauerSymbol hm hζ (steinbergSymbol a b (Commute.all _ _))) =
      explicitCoeff2 (AbsoluteGaloisGroup F) (KummerCoeff F m) (kummerCoeffInclHom F m)
        continuous_of_discreteTopology
        (explicitCup11 (AbsoluteGaloisGroup F) (KummerCoeff F m) (KummerCoeff F m) (KummerCoeff F m)
          (rootPairing hζ) (rootPairing_continuous hζ) (rootPairing_equivariant hζ)
          (Multiplicative.toAdd (kummerMap F m hm a)) (Multiplicative.toAdd (kummerMap F m hm b))) := by
  sorry

/-- Change of root: `β_{ζ^u} = u⁻¹ β_ζ`. -/
theorem brauerSymbol_pow_root (u : (ZMod m)ˣ) (x : K2 F) :
    Multiplicative.toAdd (brauerSymbol hm (hζ.pow_of_coprime _ (ZMod.val_coe_unit_coprime u)) x) =
      ((u⁻¹ : (ZMod m)ˣ) : ZMod m).val • Multiplicative.toAdd (brauerSymbol hm hζ x) := by
  sorry

@[simp]
theorem nsmul_brauerSymbol (x : K2 F) : m • Multiplicative.toAdd (brauerSymbol hm hζ x) = 0 := by
  sorry

-- test TauCeti.NormResidueSymbol.brauerSymbol_steinberg (degenerate)
example (a : Fˣ) (ha : (a : F) ≠ 1) (c : Fˣ) :
    brauerSymbol hm hζ (steinbergSymbol a (Units.mk0 (1 - (a : F)) (sub_ne_zero.mpr ha.symm))
      (Commute.all _ _)) = 1 ∧
    brauerSymbol hm hζ (steinbergSymbol a (c ^ m) (Commute.all _ _)) = 1 := by
  sorry

end Brauer

-- test TauCeti.NormResidueSymbol.brauerSymbol_pow_root_five (characterisation)
/- For `m = 5`, `β_{ζ²} = 3 β_ζ`, since `2⁻¹ = 3` in `ZMod 5`. -/
example {F : Type u} [Field F] (hm : IsUnit ((5 : ℕ) : F)) {ζ : F} (hζ : IsPrimitiveRoot ζ 5)
    (x : K2 F) :
    Multiplicative.toAdd (brauerSymbol hm (hζ.pow_of_coprime 2 (by norm_num)) x) =
      3 • Multiplicative.toAdd (brauerSymbol hm hζ x) := by
  sorry

-- test TauCeti.NormResidueSymbol.brauerSymbol_real (computation)
/- For `F = ℝ`, `m = 2`, `ζ = -1`: `β{-1, -1} ≠ 0` (the Hamilton quaternions under the cited
identification), and `β{a, b} = 0` unless `a < 0` and `b < 0`. -/
example (hm : IsUnit ((2 : ℕ) : ℝ)) (hζ : IsPrimitiveRoot (-1 : ℝ) 2) :
    brauerSymbol hm hζ (steinbergSymbol (-1) (-1) (Commute.all _ _)) ≠ 1 ∧
      ∀ a b : ℝˣ, ¬((a : ℝ) < 0 ∧ (b : ℝ) < 0) →
        brauerSymbol hm hζ (steinbergSymbol a b (Commute.all _ _)) = 1 := by
  sorry

-- test TauCeti.NormResidueSymbol.brauerSymbol_depends_on_root (non-example)
/- For `m = 3` and a field containing a primitive cube root `ζ` (such as `ℚ(μ₃)`),
`β_{ζ²} = -β_ζ`, so a symbol not naming `ζ` could only be `0`. -/
example {F : Type u} [Field F] (hm : IsUnit ((3 : ℕ) : F)) {ζ : F} (hζ : IsPrimitiveRoot ζ 3)
    (x : K2 F) :
    Multiplicative.toAdd (brauerSymbol hm (hζ.pow_of_coprime 2 (by norm_num)) x) =
      -Multiplicative.toAdd (brauerSymbol hm hζ x) := by
  sorry

/-! ### `K2SymbolsBrauer:T.7/global-reciprocity` -/

open IsDedekindDomain NumberField in
/-- `K2SymbolsBrauer:T.7/global-reciprocity`, the symbol form of the adapter: for a number field
with `μ_m ⊆ F` and `a, b ∈ Fˣ`, the local symbols `(a, b)_v` (the norm residue symbol of `F_v` at
the finite places, `1` at real places for `m = 1`, the sign symbol there for
`m = 2`, and `1` at complex places; `m > 2` allows no real places) are `1` for almost
all `v`, and `∏_v (a, b)_v = 1`. The finite-place values are read in `μ_m(F)` (each lies in its
image). The law itself is imported from ClassicalArithmeticCompletion CA.1 (ClassFieldTheory Layer
14 for `m = 2`); the node proves its statement on `K₂(F)` and its compatibility with ClassFieldTheory
Layer 10's `sumLocalInv_eq_zero` for `brauerSymbol`. -/
theorem global_reciprocity (F : Type u) [Field F] [NumberField F] (m : ℕ) [NeZero m]
    [HasEnoughRootsOfUnity F m]
    [∀ v : HeightOneSpectrum (𝓞 F), HasEnoughRootsOfUnity (v.adicCompletion F) m]
    (hm : ∀ v : HeightOneSpectrum (𝓞 F), IsUnit (m : v.adicCompletion F)) (a b : Fˣ) :
    ∃ c : HeightOneSpectrum (𝓞 F) → rootsOfUnity m F,
      (∀ v, restrictRootsOfUnity (algebraMap F (v.adicCompletion F)) m (c v) =
        normResidueSymbol (v.adicCompletion F) m (hm v)
          (Units.map (algebraMap F (v.adicCompletion F)).toMonoidHom a)
          (Units.map (algebraMap F (v.adicCompletion F)).toMonoidHom b)) ∧
      (Function.mulSupport c).Finite ∧
      (∏ᶠ v, ((c v : rootsOfUnity m F) : Fˣ)) *
        ∏ᶠ w : {w : InfinitePlace F // w.IsReal},
          (if m = 2 then Units.map (Int.castRingHom F).toMonoidHom
            (TameSymbol.signSymbolAt (InfinitePlace.embedding_of_isReal w.2)
              (steinbergSymbol a b (Commute.all _ _))) else 1) = 1 := by
  sorry

-- test TauCeti.NormResidueSymbol.global_reciprocity_one (degenerate)
-- This is the full m = 1 symbol-product assertion on ℚ at {-1,-1};
-- it needs neither the nontrivial reciprocity law nor any comparison theorem.
open IsDedekindDomain NumberField in
example :
    ∃ c : HeightOneSpectrum (𝓞 ℚ) → rootsOfUnity 1 ℚ,
      (∀ v, restrictRootsOfUnity (algebraMap ℚ (v.adicCompletion ℚ)) 1 (c v) =
        normResidueSymbol (v.adicCompletion ℚ) 1 (by simp) (-1) (-1)) ∧
      (Function.mulSupport c).Finite ∧
      (∏ᶠ v, ((c v : rootsOfUnity 1 ℚ) : ℚˣ)) *
        ∏ᶠ w : {w : InfinitePlace ℚ // w.IsReal},
          (if (1 : ℕ) = 2 then Units.map (Int.castRingHom ℚ).toMonoidHom
            (TameSymbol.signSymbolAt (InfinitePlace.embedding_of_isReal w.2)
              (steinbergSymbol (-1 : ℚˣ) (-1) (Commute.all _ _))) else 1) = 1 := by
  refine ⟨fun _ => 1, ?_, ?_, ?_⟩
  · intro v
    exact Subsingleton.elim _ _
  · simp [Function.mulSupport]
  · simp

-- test TauCeti.NormResidueSymbol.global_reciprocity_two_real_dyadic (computation)
example :
    conicSymbol ℝ (-1) (-1) = -1 ∧ conicSymbol ℚ_[2] (-1) (-1) = -1 ∧
      conicSymbol ℝ (-1) (-1) * conicSymbol ℚ_[2] (-1) (-1) = 1 := by
  sorry

/- `K2SymbolsBrauer:T.7/symbol-formula`: not stated here; needs the Galois symbol
`h_F : K₂(F)/m → H²(F, μ_m^{⊗2})` and the module `μ_m^{⊗2}` with its diagonal action (supplier:
MotivicEtaleKTheory:M.3, the single owner of `h_F`, its Steinberg relation and Tate's theorems;
MotivicEtaleKTheory:M.1 for the twist). With a primitive root
`ζ ∈ F` its image in `Br(F)` is `brauerSymbol_symbol` above, computed with the pinned
`TauCeti.kummerMap` and `TauCeti.ContCohomology.explicitCup11`.
`K2SymbolsBrauer:T.7/local-comparison`: not stated here; needs inv_F and its m-torsion
coordinate e_m:[r/m]↦r (ClassFieldTheory Layer 5), the ordered Kummer cup and twists (M.1/M.3).
The precise equality is normResidueSymbol F m a b = ζ^(−e_m(inv_F β_ζ{a,b})).
Milne CFT III.3.6(a) and III.4.4/Remark 4.5 identify the positive ordered cup with
Artin(b) acting on an m-th root of a. The packet's classical symbol uses Artin(a) on a root
of b. Skew symmetry therefore fixes the minus sign for arbitrary m; it disappears only at m=2.
Root change ζ→ζ^u multiplies β by u⁻¹ and cancels with the new base.
Q₇ regression: choose ζ reducing to 2 mod 7. X³−3 is irreducible mod 7, so its Kummer
extension is unramified; on its residue field Frobenius sends ᾱ to ᾱ⁷. The residue
of σ(α)/α is ᾱ⁶=3²=2 mod 7, and reduction is injective on μ₃.
Thus Artin(7)(α)/α=ζ, inv β{3,7}=1/3, and (3,7)=ζ⁻¹, not ζ.
The full invariant-valued regression is not stated here because inv_F has no pinned carrier.
`TauCeti.NormResidueSymbol.brauerSymbol_algebraic` (API of `K2SymbolsBrauer:T.7/brauer-valued-symbol`):
not stated here; needs QuadraticFormInvariants 7B's comparison of `BrauerGroup F` with
`H2 (AbsoluteGaloisGroup F) (UnitsCoeff F)`; content: `β_ζ` lands in the `m`-torsion of
`BrauerGroup F`, and `β_{-1}{a, b}` is the quaternion class `(a, b)`.
`K2SymbolsBrauer:T.7/chern-class-agreement`: not stated here; needs imported étale Chern
maps (M.3) on Quillen K₂ and T.1/k2-pi2. Contract: c₂,₂=−h_F, with h_F the positive ordered cup.
Soulé THESIS Proposition 2.2.2.3, pp. 42–44, gives coefficient
−(i+j−1)!/((i−1)!(j−1)!)=−1 for i=j=k=k′=1. For this output, (M) has only that contributing
positive-index pair. Pull the external F⊗ℤF product back along multiplication F⊗ℤF→F;
K.7 identifies the ordered K₁ product with {a,b}. Equality on symbols gives equality on K₂.
For composite m, M.3's coefficient naturality and CRT reduce to each prime power; m=1 is zero.
The Q₇ root-trivialized Chern invariant is −1/3, whereas the Galois-symbol invariant is +1/3.
No arithmetic Tate or S-integer theorem is proved in this compatibility node. -/

-- The residue computation underlying the higher-power local/Chern regression.
example : (3 : ZMod 7) ^ 2 = 2 ∧ ∀ x : ZMod 7, x ^ 3 ≠ 3 := by decide


end TauCeti.NormResidueSymbol

/- REV-FIX-RT-AREA-ktheory-1 regression: m = 1, F = ℚ, a = b = −1
must have real factor 1. In the uniformiser-last Milnor convention
∂₅{2,5} = 2, not 3. This revision has not been elaborated. -/

/- Local comparison: read the Brauer invariant through the coordinate map
(Q/Z)[m] ≃ ZMod m, sending [a/m] to a. Multiplication by m in Q/Z
is zero on this subgroup and is not the exponent coordinate. Milne’s ordered
cup/Artin calculation fixes the exponent sign at −1 for higher powers as well. -/

/- Packet names with no Lean signature in this file yet (FIX-RT-AREA-ktheory-1~2,
claude-HJaFqR, 2026-10-06). PROTOCOL section 13 asks for every definition, API item and
unit test of the packet under the packet's name; these are listed with their packet
statements so that the names agree, and a contributor gives each its signature (or an
`example`) next to its node above.

TauCeti.K2.relK2.toK2 (API, projection; K2SymbolsBrauer:T.6/relative-steinberg-group): The map K₂(R, I) → K₂(R).
TauCeti.K2.relDennisSteinGroup.toRelK2 (API, compatibility; K2SymbolsBrauer:T.6/relative-presentation): For I ≤ Ideal.jacobson ⊥, the relative generator map descends through exactly the source-allowed D1–D3 relations. Bijectivity is relative_presentation; its cited completeness proof remains unobtained.
-/
