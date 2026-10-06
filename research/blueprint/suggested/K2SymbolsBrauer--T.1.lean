/-
Current revision: FIX-RT-AREA-ktheory-1~2, issue #5541.
Codex codex-5ebb6f, 2026-10-02. Unchecked; NOT COMPILED; awaits independent review.
Earlier revision/compilation records below belong to their earlier text only.
The reader and JSON packet define the full roadmap. New future-carrier signatures
are comments until their suppliers exist; none asserts a completed Lean proof.
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
    ⁅x (n := 3) (by decide) (i := 0) (j := 1) (by decide) r,
      x (n := 3) (by decide) (i := 1) (j := 2) (by decide) s⁆ =
      x (n := 3) (by decide) (i := 0) (j := 2) (by decide) (r*s) := by
  sorry

example (r s : R) :
    ⁅x (n := 3) (by decide) (i := 0) (j := 1) (by decide) r,
      x (n := 3) (by decide) (i := 2) (j := 0) (by decide) s⁆ =
      x (n := 3) (by decide) (i := 2) (j := 1) (by decide) (-(s*r)) := by
  sorry

example : x (R := ℤ) (n := 3) (by decide) (i := 0) (j := 1) (by decide) 0 = 1 := by
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
      ((integralBar Q).cyclesMk z 1 (by decide) hz)) =
      barKernelH1Equiv q ((barKernel q).homologyπ 1
        ((barKernel q).cyclesMk boundary 0 (by decide) (by sorry))) := by sorry

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
      ((integralBar Q).cyclesMk z 1 (by decide) hz)) =
      barKernelH1Equiv q ((barKernel q).homologyπ 1
        ((barKernel q).cyclesMk boundary 0 (by decide) (by sorry))) := by sorry

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
