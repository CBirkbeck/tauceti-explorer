/-
Independent fix review REV-FIX-RT-AREA-ktheory-1~2, Codex codex-dbAQYQ, 2026-10-10.
The actual declarations elaborate with lean-check at the recorded pinned libraries.
The only warnings are uses of sorry. Future signatures and tests left in comments were not
elaborated. This is a prototype, not a formalization. The review report records its
scope and unresolved work. Earlier compilation records apply to their earlier text.
-/
/-
Current revision: FIX-RT-AREA-ktheory-1~2, issue #5541: Codex codex-5ebb6f (2026-10-02)
and Claude claude-HJaFqR (2026-10-06). Awaits independent review.
This file is not the roadmap and is not exhaustive: the packet and its reader document are
definitive, and the statements below only suggest Lean forms so that contributors and
reviewers converge on names and signatures.
This revision imports Mathlib only and elaborates with `lake env lean` at Mathlib
082e2d37e8b0463410cdb532e111cd43d5a66174, with `sorry` as its only warning
(claude-HJaFqR, 2026-10-06, after replacing tactic proofs of index side conditions that
unification had already discharged by term proofs). Earlier revision and compilation
records below belong to their earlier text only. New future-carrier signatures are
comments until their suppliers exist; none asserts a completed Lean proof.
-/
/-
FIX-RT-AREA-ktheory-2~2, Codex — codex-rtOQ9t, 2026-09-30.
Current revision is unchecked and NOT COMPILED. Any earlier compilation
record below describes only that earlier revision and environment.

T.2:symbols/milnor-number-field and milnor-global-positive-characteristic
already own the general Bass–Tate theorems (n >= 3); retain their unread
original-proof gap. V.2 and E.5 specialize these nodes. T.4 owns transfers
and reciprocity, not a second copy of the general Milnor calculation.
-/
/-
Independent review REV-K2SymbolsBrauer--T.1, Codex codex-5ebb6f, 2026-09-29.
The current plan and verdict are in the packet K2SymbolsBrauer--T.1.json and
research/blueprint/reviews/REV-K2SymbolsBrauer--T.1.md. The original companion
README still needs regeneration by its owner. This file is a partial suggested
interface, not an implementation or an assertion that the plan is closed.

Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.
No existing build at both pins was available; elaboration was not attempted.

FIX-RT-AREA-ktheory-1 (2026-09-30, findings RT-AREA-ktheory-1/29 and /30)
added the universal-central-extension package of T.1:classical: pullbacks and
composites of central extensions, superperfect groups, existence for perfect
groups, Hopf's formula through the four-term sequence, the kernel as H2, the
four implications of the Recognition Theorem and the lift of homomorphisms.
The file was then elaborated with `lake env lean` against Mathlib 082e2d3 (a
build at that pin): the additions produce only `sorry` warnings. Five errors
remain, all older than this fix and not touched by it: the commutator bracket on
the presented Steinberg group (`Bracket (Steinberg n hn R) _` is not found) in
commutator_nonchaining/forward/reverse and the first two tests. Homological
statements put the groups in Type, as Mathlib's integral group homology requires.

Signatures needing missing carriers are comments below. They do not use a
vacuous proposition, a self-map, or an arbitrary type to stand for that carrier.
Group homology uses trivial integral representation coefficients. Natural-number
homotopy degree n is represented by the coordinate type Fin n at this baseline.
-/
import Mathlib.Algebra.Group.Commutator
import Mathlib.Algebra.Homology.ConcreteCategory
import Mathlib.Algebra.Homology.HomologicalComplexKernels
import Mathlib.Algebra.Homology.HomologySequenceLemmas
import Mathlib.GroupTheory.Commutator.Basic
import Mathlib.Algebra.Module.CharacterModule
import Mathlib.GroupTheory.FreeGroup.IsFreeGroup
import Mathlib.GroupTheory.IsPerfect
import Mathlib.GroupTheory.PresentedGroup
import Mathlib.GroupTheory.Subgroup.Center
import Mathlib.GroupTheory.Perm.Sign
import Mathlib.Data.ZMod.Basic
import Mathlib.RepresentationTheory.Homological.GroupHomology.Functoriality

/- REV-FIX-RT-AREA-ktheory-1: enable the scoped group commutator instance
required by the five historical bracket failures described above. Checked
against the pinned declaration; this revision has not been elaborated. -/
open scoped commutatorElement

noncomputable section
universe u v

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
Missing OWNER carriers and their intended interfaces, not definitions in this file:

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
  classicalK2 R := (phi (R := R)).ker
  K2_eq_center : classicalK2 R = Subgroup.center (StableSteinberg R)
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
Stable comparison interfaces (all require missing carriers/maps):

  steinberg_isUniversal : IsUniversalCentralExtension (phi (R := R))
  k2EquivH2 : Additive (classicalK2 R) ≃+
    (groupHomology.H2 (trivial integral representation of StableElementary R))
  k2EquivPi2 : Additive (classicalK2 R) ≃+
    HomotopyGroup (Fin 2) (BGLPlus R) (zeroBasepoint R)

The cover BE(R)+ -> BGL(R)+ and its chosen natural Hurewicz map are needed;
IV.1.7.1/Exercise IV.1.8 are the K2 locators, not the K3 exercise/corollary.

Symbol interfaces over arbitrary associative unital R:

  commutingSymbol (r s : Rˣ) (hrs : Commute r s) : classicalK2 R
  symbol_eq_commutator : symbol r s hrs = [h_ij(r),h_ik(s)]
  symbol_mul_left (r1 r2 s pairwise commuting) :
    symbol (r1*r2) s = symbol r1 s * symbol r2 s
  symbol_one_sub (r s : Rˣ) (hs : (s : R)=1-(r : R)) : symbol r s = 1
  symbol_negative (r : Rˣ) : symbol r (-r) = 1
  symbol_self : symbol r r = symbol r (-1)

The negative-unit identity is specialized FROM the universal Laurent ring;
no injection of arbitrary-ring K2 into a localization is assumed.

Milnor/Quillen signatures, commented because neither missing graded carrier
may be represented by a self-map or a vacuous theorem:

  milnorSymbol (F : Type u) [Field F] (n : ℕ) (a : Fin n → Fˣ) : MilnorK F n
  milnorSymbol_product : concatenate symbols = their graded product
  milnorLift : a degree-one unit map killing Steinberg products extends uniquely
  matsumoto : MilnorK F 2 ≃+ Additive (classicalK2 F)
  finite_field_K2 [Finite F] : Subsingleton (classicalK2 F)
  rational_restriction : Function.Injective (K2.map (F →+* F(t)))
  extension_kernel_torsion : every element of ker(K2.map(F→L)) has finite order
  milnor_permutation : symbol (a ∘ permutation) = sign • symbol a
  milnor_finite [Finite F] (hn : 2 ≤ n) : Subsingleton (MilnorK F n)
  milnor_algclosed [IsAlgClosed F] (hn : 2 ≤ n) : uniquely divisible (MilnorK F n)
  milnor_real (hn : 1 ≤ n) : MilnorK ℝ n ≃+ (Z/2 plus a divisible subgroup)
  milnor_number_field (hn : 3 ≤ n) : MilnorK F n ≃+ (Z/2)^(real places)
  milnor_global_positive_char (hn : 3 ≤ n) : Subsingleton (MilnorK F n)
  milnorToQuillen n : MilnorK F n →+ QuillenK F n
  milnorToQuillen_symbol : the image is the ordered product of unit classes
  milnorToQuillen_degree_two : Function.Bijective (milnorToQuillen 2)
  milnorToQuillen_degree_three : MilnorK F 3 →+ QuillenK F 3

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
Counterexample-sensitive tests awaiting the missing owners:
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

/-!
Round 2, FIX-RT-AREA-ktheory-1~2, Codex codex-5ebb6f, 2026-10-02.
This file is not the roadmap and is not exhaustive. The reader document is
definitive; these signatures suggest names and forms for contributors and
reviewers. The new integral five-term interface uses the actual pinned bar
complexes. All declarations remain unchecked and this revision was not compiled.
-/
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
-- Test bar_kernel_nonsurjective: the unique C₁→C₂ map misses this basis element.
example : Finsupp.single
    (fun _ : Fin 1 => Multiplicative.ofAdd (1 : ZMod 2)) (1 : ℤ) ∉
    ((barMap (1 : Multiplicative (ZMod 1) →* Multiplicative (ZMod 2))).f 1).hom.range :=
  by sorry

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
example : Subsingleton (mixedCoinvariants (MonoidHom.id E)) ∧
    (∀ x, intHomologyMap (MonoidHom.id E) 2 x = x) ∧
    (∀ x, quotientAbMap (MonoidHom.id E) x = x) := by sorry
/-- The concrete cyclic quotient used by the five-term test. -/
def cyclicFourToTwo : Multiplicative (ZMod 4) →* Multiplicative (ZMod 2) :=
  (ZMod.castHom (by decide : 2 ∣ 4) (ZMod 2)).toAddMonoidHom.toMultiplicative

-- Test five_term_abelian_extension: identify both maps, including the element 2.
example : ∃ (mid : mixedCoinvariants cyclicFourToTwo ≃+ ZMod 2)
    (src : Additive (Abelianization (Multiplicative (ZMod 4))) ≃+ ZMod 4)
    (dst : Additive (Abelianization (Multiplicative (ZMod 2))) ≃+ ZMod 2),
    (∀ x, src (mixedToAb cyclicFourToTwo x) = 2 * (mid x).val) ∧
    (∀ x, dst (quotientAbMap cyclicFourToTwo x) =
      ZMod.castHom (by decide : 2 ∣ 4) (ZMod 2) (src x)) := by sorry

-- Test five_term_noncentral: the sign quotient is the concrete S₃→C₂ model.
example : Subsingleton (mixedCoinvariants
    (Equiv.Perm.sign : Equiv.Perm (Fin 3) →* ℤˣ)) ∧
    Nat.card (Abelianization
      (Equiv.Perm.sign : Equiv.Perm (Fin 3) →* ℤˣ).ker) = 3 := by sorry

/-- A finite test carrier: upper-unitriangular 3×3 matrices over 𝔽₃, in coordinates.
Multiplication is (x,y,z)(x′,y′,z′)=(x+x′,y+y′,z+z′+xy′). -/
@[ext] structure HeisenbergThree where
  x : ZMod 3
  y : ZMod 3
  z : ZMod 3
  deriving DecidableEq

instance heisenbergMul : Mul HeisenbergThree :=
  ⟨fun a b => ⟨a.x + b.x, a.y + b.y, a.z + b.z + a.x * b.y⟩⟩
instance heisenbergOne : One HeisenbergThree := ⟨⟨0, 0, 0⟩⟩
instance heisenbergInv : Inv HeisenbergThree :=
  ⟨fun a => ⟨-a.x, -a.y, -a.z + a.x * a.y⟩⟩

instance : Group HeisenbergThree where
  mul_assoc a b c := by
    apply HeisenbergThree.ext
    · change (a.x + b.x) + c.x = a.x + (b.x + c.x); ring
    · change (a.y + b.y) + c.y = a.y + (b.y + c.y); ring
    · change (a.z + b.z + a.x * b.y) + c.z + (a.x + b.x) * c.y =
        a.z + (b.z + c.z + b.x * c.y) + a.x * (b.y + c.y); ring
  one_mul a := by
    apply HeisenbergThree.ext
    · change 0 + a.x = a.x; ring
    · change 0 + a.y = a.y; ring
    · change 0 + a.z + 0 * a.y = a.z; ring
  mul_one a := by
    apply HeisenbergThree.ext
    · change a.x + 0 = a.x; ring
    · change a.y + 0 = a.y; ring
    · change a.z + 0 + a.x * 0 = a.z; ring
  inv_mul_cancel a := by
    apply HeisenbergThree.ext
    · change -a.x + a.x = 0; ring
    · change -a.y + a.y = 0; ring
    · change (-a.z + a.x * a.y) + a.z + (-a.x) * a.y = 0; ring

/-- Projection to the abelian pair of first superdiagonal coordinates. -/
def heisenbergProjection : HeisenbergThree →* Multiplicative (ZMod 3 × ZMod 3) where
  toFun a := Multiplicative.ofAdd (a.x, a.y)
  map_one' := rfl
  map_mul' _a _b := rfl

theorem heisenbergProjection_surjective : Function.Surjective heisenbergProjection := by
  intro t
  exact ⟨⟨t.toAdd.1, t.toAdd.2, 0⟩, rfl⟩

-- The kernel is the central coordinate, so mixed coinvariants identify with 𝔽₃.
-- The positive boundary of [a|b]−[b|a] is [ba]−[ab], giving z², not z.
-- This computation has odd order: a sign error cannot disappear as in a C₂ target.
example :
    let a : HeisenbergThree := ⟨1, 0, 0⟩
    let b : HeisenbergThree := ⟨0, 1, 0⟩
    (b * a * (a * b)⁻¹).z = 2 ∧ (a * b * (b * a)⁻¹).z = 1 := by decide

-- Test five_term_positive_sign. The comparison hypothesis specifies the actual
-- central-coordinate isomorphism; it is not an unspecified abstract group iso.
example (central : mixedCoinvariants heisenbergProjection ≃+ ZMod 3)
    (hcentral : ∀ n : heisenbergProjection.ker,
      central (Additive.ofMul
        (QuotientGroup.mk' (mixedCommutator heisenbergProjection) n)) = n.val.z) :
    let a : HeisenbergThree := ⟨1, 0, 0⟩
    let b : HeisenbergThree := ⟨0, 1, 0⟩
    let z : (integralBar (Multiplicative (ZMod 3 × ZMod 3))).X 2 :=
      Finsupp.single ![heisenbergProjection a, heisenbergProjection b] (1 : ℤ) -
        Finsupp.single ![heisenbergProjection b, heisenbergProjection a] 1
    central (transgression heisenbergProjection heisenbergProjection_surjective
      ((integralBar _).homologyπ 2
        ((integralBar _).cyclesMk z 1 (ChainComplex.next_nat_succ 1) (by sorry)))) = 2 := by sorry

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

/- Packet names with no Lean signature in this file yet (FIX-RT-AREA-ktheory-1~2,
claude-HJaFqR, 2026-10-06). PROTOCOL section 13 asks for every definition, API item and
unit test of the packet under the packet's name; these are listed with their packet
statements so that the names agree, and a contributor gives each its signature (or an
`example`) next to its node above.

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
