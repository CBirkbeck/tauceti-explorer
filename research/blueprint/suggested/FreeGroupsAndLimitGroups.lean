import Mathlib.GroupTheory.FreeGroup.Reduce
import Mathlib.GroupTheory.FreeGroup.CyclicallyReduced
import Mathlib.GroupTheory.FreeGroup.IsFreeGroup
import Mathlib.Computability.Primrec.List
import Mathlib.Computability.Partrec
import Mathlib.Data.List.Rotate
import Mathlib.GroupTheory.Schreier
import Mathlib.GroupTheory.Rank
import Mathlib.GroupTheory.HNNExtension
import Mathlib.GroupTheory.Coprod.Basic
import Mathlib.GroupTheory.PresentedGroup
import Mathlib.GroupTheory.FinitelyPresentedGroup
import Mathlib.ModelTheory.Semantics
import Mathlib.LinearAlgebra.Matrix.SpecialLinearGroup
import Mathlib.Topology.Irreducible
import Mathlib.Topology.Order
import Mathlib.Topology.Constructions
import Mathlib.Algebra.Order.Group.PiLex
import Mathlib.Algebra.Group.Pi.Lemmas
import Mathlib.SetTheory.Cardinal.Finite

/-!
# FreeGroupsAndLimitGroups: representative target signatures

This file is not the roadmap. The roadmap is `FreeGroupsAndLimitGroups.md` (the reader document),
which is definitive; this file is not exhaustive. It records light definitions with real bodies
over carriers that exist in Mathlib, and theorem signatures statable against the pinned APIs, so
that contributors and reviewers converge on names and signatures. Every proof is `sorry`.

Design choices made explicit here:
* free-group algorithms are stated on Mathlib's words `List (α × Bool)` and on `FreeGroup α`
  itself, never on a second free-group carrier;
* an algorithm is stated as the existence of a `Primrec`/`Computable` function together with the
  correctness of both answers, never as a classical `DecidablePred`;
* equations over a group `G` are elements of `G[X] := Monoid.Coprod G (FreeGroup X)`;
* coordinate groups are quotients by kernels of evaluation maps, so normality is automatic;
* heavy constructions (graphs of groups and their fundamental groups, Bass–Serre trees,
  generalised equations, JSJ decompositions, Makanin–Razborov diagrams, infinite words) are
  README targets and do not appear here.
-/

namespace TauCetiRoadmap.FreeGroupsAndLimitGroups

open FreeGroup

/-! ## Layer FG1: free-group words, normal forms, and elementary algorithms -/

section FG1

variable {α : Type*} [DecidableEq α]

/-- The word-problem procedure: a word is trivial in the free group iff its free reduction is
empty (FG1.4). -/
def isTrivialWord (L : List (α × Bool)) : Bool :=
  (FreeGroup.reduce L).isEmpty

/-- Equality test for words (FG1.4). -/
def eqWord (L₁ L₂ : List (α × Bool)) : Bool :=
  isTrivialWord (FreeGroup.invRev L₁ ++ L₂)

/-- Correctness of both answers of the word-problem procedure (FG1.5). -/
theorem isTrivialWord_iff (L : List (α × Bool)) :
    isTrivialWord L = true ↔ FreeGroup.mk L = 1 := by
  sorry

theorem eqWord_iff (L₁ L₂ : List (α × Bool)) :
    eqWord L₁ L₂ = true ↔ FreeGroup.mk L₁ = FreeGroup.mk L₂ := by
  sorry

/-- The word problem is primitive recursive (FG1.6). -/
theorem primrec_isTrivialWord [Primcodable α] : Primrec (isTrivialWord (α := α)) := by
  sorry

/-- Free reduction is primitive recursive (FG1.2). -/
theorem primrec_reduce [Primcodable α] : Primrec (FreeGroup.reduce (α := α)) := by
  sorry

example : isTrivialWord ([] : List (α × Bool)) = true := by
  sorry

example (a b : α) (h : a ≠ b) :
    isTrivialWord [(a, true), (b, true), (a, false), (b, false)] = false := by
  sorry

example (a b : α) : isTrivialWord [(a, true), (b, true), (b, false), (a, false)] = true := by
  sorry

/-- Conjugacy criterion (FG1.7): two elements are conjugate iff their cyclic reductions are
rotations of each other. -/
theorem isConj_iff_isRotated (x y : FreeGroup α) :
    IsConj x y ↔ (FreeGroup.reduceCyclically x.toWord).IsRotated
      (FreeGroup.reduceCyclically y.toWord) := by
  sorry

/-- The conjugacy problem is decided by a primitive recursive procedure returning a conjugating
word (FG1.8–FG1.10). -/
theorem exists_conjWitness [Primcodable α] :
    ∃ f : List (α × Bool) → List (α × Bool) → Option (List (α × Bool)), Primrec₂ f ∧
      ∀ L₁ L₂, (∀ c, f L₁ L₂ = some c →
          (FreeGroup.mk c)⁻¹ * FreeGroup.mk L₁ * FreeGroup.mk c = FreeGroup.mk L₂) ∧
        (f L₁ L₂ = none ↔ ¬ IsConj (FreeGroup.mk L₁) (FreeGroup.mk L₂)) := by
  sorry

example (a b : α) (h : a ≠ b) :
    ¬ IsConj (FreeGroup.of a * FreeGroup.of b) (FreeGroup.of a * FreeGroup.of b)⁻¹ := by
  sorry

end FG1

/-- A proper power: `x = y ^ n` with `n ≥ 2` (FG1.11). The identity is a proper power, so
‘not a proper power’ is used for nontrivial elements only. -/
def IsProperPower {G : Type*} [Group G] (x : G) : Prop :=
  ∃ y : G, ∃ n : ℕ, 2 ≤ n ∧ x = y ^ n

/-- A primitive element of a free group: a member of some free basis (FG1.12). Being primitive is
not the negation of being a proper power. -/
def IsPrimitive {G : Type u} [Group G] (x : G) : Prop :=
  ∃ (ι : Type u) (b : FreeGroupBasis ι G) (i : ι), b i = x

/-- A malnormal subgroup: it meets its conjugate by any element outside it trivially (FG1.18). -/
def IsMalnormal {G : Type*} [Group G] (M : Subgroup G) : Prop :=
  ∀ g : G, g ∉ M → M.map (MulAut.conj g).toMonoidHom ⊓ M = ⊥

/-- A subgroup any two of whose elements commute. -/
def IsCommSubgroup {G : Type*} [Group G] (M : Subgroup G) : Prop :=
  ∀ x ∈ M, ∀ y ∈ M, Commute x y

/-- CSA groups: every maximal abelian subgroup is malnormal (FG1.18). -/
def IsCSA (G : Type*) [Group G] : Prop :=
  ∀ M : Subgroup G, IsCommSubgroup M →
    (∀ N : Subgroup G, M ≤ N → IsCommSubgroup N → N = M) → IsMalnormal M

/-- Commutation is transitive on nontrivial elements (FG1.18). -/
def IsCommTransitive (G : Type*) [Group G] : Prop :=
  ∀ x y z : G, y ≠ 1 → Commute x y → Commute y z → Commute x z

/-- CSA groups are commutative transitive (FG1.18). -/
theorem IsCSA.isCommTransitive {G : Type*} [Group G] (hG : IsCSA G) : IsCommTransitive G := by
  sorry

example : IsCSA (Multiplicative ℤ) := by
  sorry

example : ¬ IsCommTransitive (FreeGroup (Fin 2) × Multiplicative ℤ) := by
  sorry

section FG1roots

variable {α : Type*} [DecidableEq α]

example (a : α) : IsProperPower (FreeGroup.of a ^ 2) := by
  sorry

example (a : α) : ¬ IsProperPower (FreeGroup.of a) := by
  sorry

example (a b : α) (h : a ≠ b) :
    ¬ IsProperPower (FreeGroup.of a * FreeGroup.of b * (FreeGroup.of a)⁻¹ * (FreeGroup.of b)⁻¹) := by
  sorry

example (a b : α) (h : a ≠ b) :
    ¬ IsPrimitive (FreeGroup.of a * FreeGroup.of b * (FreeGroup.of a)⁻¹ * (FreeGroup.of b)⁻¹) := by
  sorry

/-- Maximal roots (FG1.13–FG1.15): a primitive recursive procedure on words with the identity
handled explicitly, returning the maximal root and the exponent. -/
theorem exists_maxRoot [Primcodable α] :
    ∃ r : List (α × Bool) → List (α × Bool) × ℕ, Primrec r ∧
      (∀ L, FreeGroup.mk L = 1 → r L = ([], 0)) ∧
      ∀ L, FreeGroup.mk L ≠ 1 →
        FreeGroup.mk (r L).1 ^ (r L).2 = FreeGroup.mk L ∧ 1 ≤ (r L).2 ∧
          ¬ IsProperPower (FreeGroup.mk (r L).1) ∧
          ∀ (s : FreeGroup α) (m : ℕ), 1 ≤ m → s ^ m = FreeGroup.mk L → ¬ IsProperPower s →
            s = FreeGroup.mk (r L).1 ∧ m = (r L).2 := by
  sorry

/-- Commuting elements are powers of a common element (FG1.16). -/
theorem commute_iff_exists_zpow (x y : FreeGroup α) :
    Commute x y ↔ ∃ r : FreeGroup α, ∃ m n : ℤ, x = r ^ m ∧ y = r ^ n := by
  sorry

/-- Centralizers of nontrivial elements are cyclic, generated by the maximal root (FG1.17). -/
theorem centralizer_eq_zpowers (x : FreeGroup α) (hx : x ≠ 1) :
    ∃ r : FreeGroup α, ¬ IsProperPower r ∧
      Subgroup.centralizer {x} = Subgroup.zpowers r := by
  sorry

/-- Maximal cyclic subgroups are malnormal (FG1.19). -/
theorem zpowers_malnormal (u : FreeGroup α) (hu : u ≠ 1) (hu' : ¬ IsProperPower u) :
    IsMalnormal (Subgroup.zpowers u) := by
  sorry

/-- Free groups are CSA (FG1.19). -/
theorem isCSA_freeGroup : IsCSA (FreeGroup α) := by
  sorry

end FG1roots

/-! ## Layer FG2: Stallings graphs and finitely generated free subgroups -/

/-- Serre graphs: an origin map and a fixed-point-free involution on edges; loops and multiple
edges are allowed (FG2.1). -/
structure SerreGraph (V : Type*) (E : Type*) where
  /-- The origin of an edge. -/
  src : E → V
  /-- Edge reversal. -/
  rev : E → E
  rev_rev : ∀ e, rev (rev e) = e
  rev_ne : ∀ e, rev e ≠ e

namespace SerreGraph

variable {V E : Type*} (Γ : SerreGraph V E)

/-- The terminus of an edge. -/
def tgt (e : E) : V := Γ.src (Γ.rev e)

/-- `IsPath u es w`: the list of edges `es` is a path from `u` to `w`. -/
def IsPath : V → List E → V → Prop
  | u, [], w => u = w
  | u, e :: es, w => Γ.src e = u ∧ IsPath (Γ.tgt e) es w

/-- Reduced paths: no edge is followed by its reverse. -/
def IsReducedPath (es : List E) : Prop :=
  es.IsChain fun e f => f ≠ Γ.rev e

/-- Trees: nonempty, connected, and without reduced closed paths of positive length. -/
def IsTree : Prop :=
  Nonempty V ∧ (∀ u w : V, ∃ es, Γ.IsPath u es w) ∧
    ∀ (v : V) (es : List E), Γ.IsPath v es v → Γ.IsReducedPath es → es = []

end SerreGraph

/-- `α`-labelled graphs with labels compatible with reversal (FG2.3). -/
structure LabelledGraph (α : Type*) (V : Type*) (E : Type*) extends SerreGraph V E where
  /-- The label of an edge: a letter and an exponent sign. -/
  label : E → α × Bool
  label_rev : ∀ e, label (rev e) = ((label e).1, !(label e).2)

namespace LabelledGraph

variable {α V E : Type*} (Γ : LabelledGraph α V E)

/-- The subgroup of `FreeGroup α` accepted at a vertex: generated by the labels of closed paths. -/
def accepted (v : V) : Subgroup (FreeGroup α) :=
  Subgroup.closure
    {g | ∃ es : List E, Γ.toSerreGraph.IsPath v es v ∧ g = FreeGroup.mk (es.map Γ.label)}

/-- Folded graphs: at each vertex at most one edge with each label. -/
def IsFolded : Prop :=
  ∀ e f : E, Γ.src e = Γ.src f → Γ.label e = Γ.label f → e = f

/-- The labels of closed paths at `v` already form a subgroup, so the closure adds nothing. -/
theorem mem_accepted_iff (v : V) (g : FreeGroup α) :
    g ∈ Γ.accepted v ↔
      ∃ es : List E, Γ.toSerreGraph.IsPath v es v ∧ g = FreeGroup.mk (es.map Γ.label) := by
  sorry

/-- For folded graphs, a reduced word lies in the accepted subgroup iff it is the label of a
reduced closed path at `v` (FG2.3; KM02 Lemma 3.2). -/
theorem mem_accepted_iff_of_isFolded (hΓ : Γ.IsFolded) (v : V) (w : List (α × Bool))
    (hw : FreeGroup.IsReduced w) :
    FreeGroup.mk w ∈ Γ.accepted v ↔
      ∃ es : List E, Γ.toSerreGraph.IsPath v es v ∧ Γ.toSerreGraph.IsReducedPath es ∧
        es.map Γ.label = w := by
  sorry

end LabelledGraph

section FG2

variable {α : Type*} [DecidableEq α]

/-- The membership (generalised word) problem is decided by a primitive recursive procedure
(FG2.10–FG2.11). -/
theorem exists_memberTest [Fintype α] [Primcodable α] :
    ∃ f : List (List (α × Bool)) → List (α × Bool) → Bool, Primrec₂ f ∧
      ∀ ws w, f ws w = true ↔
        FreeGroup.mk w ∈ Subgroup.closure (FreeGroup.mk '' {u | u ∈ ws}) := by
  sorry

/-- Howson property (FG2.12). -/
theorem fg_inf (H K : Subgroup (FreeGroup α)) (hH : H.FG) (hK : K.FG) : (H ⊓ K).FG := by
  sorry

/-- The exact Schreier formula (FG2.13); Mathlib has only an inequality. -/
theorem rank_sub_one_eq_index_mul (n : ℕ) (H : Subgroup (FreeGroup (Fin n)))
    [H.FiniteIndex] [Group.FG H] :
    (Group.rank H : ℤ) - 1 = H.index * ((n : ℤ) - 1) := by
  sorry

example (a b : α) (h : a ≠ b) :
    FreeGroup.of b ∉ Subgroup.closure {FreeGroup.of a, FreeGroup.of b * FreeGroup.of a * (FreeGroup.of b)⁻¹} := by
  sorry

end FG2

/-! ## Layer FG3: effective first-order group syntax -/

/-- Function symbols of the language of groups. -/
inductive GroupFunc : ℕ → Type
  | one : GroupFunc 0
  | inv : GroupFunc 1
  | mul : GroupFunc 2

/-- The first-order language of groups (FG3.1). Coefficients are carried by free variables
interpreted through a map `c : A → G`, as in the term–word correspondence. -/
def groupLang : FirstOrder.Language where
  Functions := GroupFunc
  Relations := fun _ => Empty

/-- Interpretation of a group symbol in a group. -/
def GroupFunc.eval {G : Type*} [Group G] : {n : ℕ} → GroupFunc n → (Fin n → G) → G
  | _, .one, _ => 1
  | _, .inv, x => (x 0)⁻¹
  | _, .mul, x => x 0 * x 1

/-- Every group is a structure for the language of groups (FG3.1). -/
instance groupStructure (G : Type*) [Group G] : groupLang.Structure G where
  funMap f x := GroupFunc.eval f x
  RelMap r _ := Empty.elim r

/-- The term–word correspondence (FG3.4): the word of a term is its value in the free group. -/
def termToWord {X : Type*} (t : groupLang.Term X) : FreeGroup X :=
  t.realize FreeGroup.of

/-- Terms evaluate through their words in every group (FG3.4). -/
theorem realize_eq_lift {X G : Type*} [Group G] (v : X → G) (t : groupLang.Term X) :
    t.realize v = FreeGroup.lift v (termToWord t) := by
  sorry

/-- Finite systems of equations and inequations with variables `X` and coefficient letters `A`
(FG3.5). -/
structure EqIneqSystem (X A : Type*) where
  /-- Equations `w = 1`. -/
  eqs : List (FreeGroup (X ⊕ A))
  /-- Inequations `w ≠ 1`. -/
  ineqs : List (FreeGroup (X ⊕ A))

/-- Solutions of a system in a group `G` with coefficient map `c` (FG3.5). -/
def EqIneqSystem.IsSolution {X A G : Type*} [Group G] (s : EqIneqSystem X A) (c : A → G)
    (v : X → G) : Prop :=
  (∀ w ∈ s.eqs, FreeGroup.lift (Sum.elim v c) w = 1) ∧
    ∀ w ∈ s.ineqs, FreeGroup.lift (Sum.elim v c) w ≠ 1

example {A : Type*} (a : A) :
    (⟨[], [FreeGroup.of (Sum.inl ())]⟩ : EqIneqSystem Unit A).IsSolution FreeGroup.of
      (fun _ => FreeGroup.of a) := by
  sorry

example {A : Type*} :
    ¬ (⟨[], [FreeGroup.of (Sum.inl ())]⟩ : EqIneqSystem Unit A).IsSolution FreeGroup.of
      (fun _ => 1) := by
  sorry

/-! ## Layer FG4: Bass–Serre theory and relative splittings -/

section FG4

/-- Dehn twists of HNN extensions (FG4.13): for `z` centralizing the associated subgroup `A`,
there is an automorphism fixing the base group and sending `t` to `t * z`. -/
theorem exists_dehnTwist_hnn {G : Type*} [Group G] (A B : Subgroup G) (φ : A ≃* B) (z : G)
    (hz : ∀ a : A, Commute z a) :
    ∃ τ : HNNExtension G A B φ ≃* HNNExtension G A B φ,
      (∀ g : G, τ (HNNExtension.of g) = HNNExtension.of g) ∧
        τ HNNExtension.t = HNNExtension.t * HNNExtension.of z := by
  sorry

/-- Grushko–Neumann theorem (FG4.11). -/
theorem rank_coprod {G H : Type*} [Group G] [Group H] [Group.FG G] [Group.FG H]
    [Group.FG (Monoid.Coprod G H)] [Nontrivial G] [Nontrivial H] :
    Group.rank (Monoid.Coprod G H) = Group.rank G + Group.rank H := by
  sorry

end FG4

/-! ## Layer FG5: equations, radicals, and algebraic geometry over groups -/

section FG5

variable {G : Type*} [Group G]

/-- The free `G`-group `G[X] = G ∗ F(X)` (FG5.1). -/
abbrev GX (G : Type*) [Group G] (X : Type*) := Monoid.Coprod G (FreeGroup X)

/-- Evaluation of `G[X]` at a point of a `G`-group (FG5.1). -/
def evalAt {X H : Type*} [Group H] (ι : G →* H) (v : X → H) : GX G X →* H :=
  Monoid.Coprod.lift ι (FreeGroup.lift v)

/-- Algebraic sets (FG5.2). -/
def algSet {X H : Type*} [Group H] (ι : G →* H) (S : Set (GX G X)) : Set (X → H) :=
  {v | ∀ s ∈ S, evalAt ι v s = 1}

/-- The ideal of a set of points, as the kernel of the joint evaluation (FG5.2). -/
abbrev idealOf {X H : Type*} [Group H] (ι : G →* H) (Y : Set (X → H)) : Subgroup (GX G X) :=
  (MonoidHom.pi fun v : Y => evalAt ι v.1).ker

/-- The radical of a system over `H` (FG5.2). -/
abbrev radical {X H : Type*} [Group H] (ι : G →* H) (S : Set (GX G X)) : Subgroup (GX G X) :=
  idealOf ι (algSet ι S)

/-- The coordinate group `G[X] ⧸ Rad(S)` (FG5.2). -/
abbrev CoordGroup {X H : Type*} [Group H] (ι : G →* H) (S : Set (GX G X)) : Type _ :=
  GX G X ⧸ radical ι S

/-- `K` is `G`-separated by `H` (residually `H`) (FG5.3). -/
def IsSeparatedBy (K H : Type*) [Group K] [Group H] (ιK : G →* K) (ιH : G →* H) : Prop :=
  ∀ k : K, k ≠ 1 → ∃ φ : K →* H, φ.comp ιK = ιH ∧ φ k ≠ 1

/-- `K` is `G`-discriminated by `H` (fully residually `H`) (FG5.3). -/
def IsDiscriminatedBy (K H : Type*) [Group K] [Group H] (ιK : G →* K) (ιH : G →* H) : Prop :=
  ∀ s : Finset K, (1 : K) ∉ s → ∃ φ : K →* H, φ.comp ιK = ιH ∧ ∀ k ∈ s, φ k ≠ 1

/-- `G`-domains: no `G`-zero divisors (FG5.4). -/
def IsGDomain (H : Type*) [Group H] (ι : G →* H) : Prop :=
  ∀ x y : H, x ≠ 1 → y ≠ 1 → ∃ g : G,
    x * (ι g * y * (ι g)⁻¹) * x⁻¹ * (ι g * y * (ι g)⁻¹)⁻¹ ≠ 1

/-- Equationally Noetherian groups (FG5.7). -/
def IsEquationallyNoetherian (H : Type*) [Group H] : Prop :=
  ∀ (X : Type) [Finite X] (S : Set (GX H X)),
    ∃ S₀ ⊆ S, S₀.Finite ∧ algSet (MonoidHom.id H) S₀ = algSet (MonoidHom.id H) S

/-- The Zariski topology: generated by complements of algebraic sets (FG5.6). -/
abbrev zariski {X H : Type*} [Group H] (ι : G →* H) : TopologicalSpace (X → H) :=
  TopologicalSpace.generateFrom {U | ∃ S : Set (GX G X), U = (algSet ι S)ᶜ}

/-- Free groups of rank two are linear over `ℤ` (FG5.8). -/
theorem exists_injective_freeGroup_SL :
    ∃ f : FreeGroup (Fin 2) →* Matrix.SpecialLinearGroup (Fin 2) ℤ, Function.Injective f := by
  sorry

/-- Free groups of finite rank are equationally Noetherian (FG5.9). -/
theorem isEquationallyNoetherian_freeGroup (n : ℕ) :
    IsEquationallyNoetherian (FreeGroup (Fin n)) := by
  sorry

/-- Irreducibility is discrimination of the coordinate group (FG5.11), for a `G`-equationally
Noetherian `G`-domain `H` (stated here with `H = G`). -/
theorem isIrreducible_iff_discriminated {X : Type*} (hG : IsEquationallyNoetherian G)
    (hD : IsGDomain G (MonoidHom.id G)) (S : Set (GX G X)) :
    @IsIrreducible _ (zariski (MonoidHom.id G)) (algSet (MonoidHom.id G) S) ↔
      IsDiscriminatedBy (CoordGroup (MonoidHom.id G) S) G
        ((QuotientGroup.mk' _).comp Monoid.Coprod.inl) (MonoidHom.id G) := by
  sorry

/-- The radical of `x²` over a free group is the normal closure of `x`, not of `x²` (FG5.2). -/
example :
    radical (MonoidHom.id (FreeGroup (Fin 2))) {Monoid.Coprod.inr (FreeGroup.of ()) ^ 2} =
      Subgroup.normalClosure {(Monoid.Coprod.inr (FreeGroup.of ()) : GX (FreeGroup (Fin 2)) Unit)} := by
  sorry

example : IsGDomain (FreeGroup (Fin 2)) (MonoidHom.id _) := by
  sorry

example : ¬ IsGDomain (Multiplicative (Fin 2 → ℤ)) (MonoidHom.id _) := by
  sorry

end FG5

/-! ## Layer FG6: surface groups and quadratic equations -/

section FG6

/-- The commutator `x y x⁻¹ y⁻¹` (Mathlib's convention for `⁅x, y⁆`). -/
def comm {G : Type*} [Group G] (x y : G) : G := x * y * x⁻¹ * y⁻¹

/-- The orientable surface relator of genus `g` with `m` boundary elements (FG6.1), with the
commutator convention of `comm`; the source's convention `x⁻¹ y⁻¹ x y` gives an isomorphic group. -/
def orientableRelator (g m : ℕ) : FreeGroup ((Fin g × Bool) ⊕ Fin m) :=
  ((List.finRange g).map fun i : Fin g =>
      comm (FreeGroup.of (Sum.inl (i, false) : (Fin g × Bool) ⊕ Fin m))
        (FreeGroup.of (Sum.inl (i, true)))).prod *
    ((List.finRange m).map fun j : Fin m =>
      FreeGroup.of (Sum.inr j : (Fin g × Bool) ⊕ Fin m)).prod

/-- The orientable surface group `S⁺(g, m)` (FG6.1). -/
abbrev OrientableSurfaceGroup (g m : ℕ) : Type :=
  PresentedGroup {orientableRelator g m}

/-- The non-orientable surface relator `c₁² ⋯ c_g² p₁ ⋯ p_m` (FG6.1). -/
def nonorientableRelator (g m : ℕ) : FreeGroup (Fin g ⊕ Fin m) :=
  ((List.finRange g).map fun i : Fin g => FreeGroup.of (Sum.inl i : Fin g ⊕ Fin m) ^ 2).prod *
    ((List.finRange m).map fun j : Fin m => FreeGroup.of (Sum.inr j : Fin g ⊕ Fin m)).prod

/-- The non-orientable surface group `S⁻(g, m)` (FG6.1). -/
abbrev NonorientableSurfaceGroup (g m : ℕ) : Type :=
  PresentedGroup {nonorientableRelator g m}

/-- Euler characteristic of `S⁺(g, m)`. -/
def orientableEulerChar (g m : ℕ) : ℤ := 2 - 2 * g - m

/-- Surface groups with boundary are free (FG6.2). -/
theorem isFreeGroup_orientable (g m : ℕ) (hm : 1 ≤ m) :
    IsFreeGroup (OrientableSurfaceGroup g m) := by
  sorry

/-- Closed orientable surface groups of positive genus are not free (FG6.2). -/
theorem not_isFreeGroup_orientable_closed (g : ℕ) (hg : 1 ≤ g) :
    ¬ IsFreeGroup (OrientableSurfaceGroup g 0) := by
  sorry

example : Nonempty (OrientableSurfaceGroup 1 0 ≃* Multiplicative (Fin 2 → ℤ)) := by
  sorry

example : Nat.card (NonorientableSurfaceGroup 1 0) = 2 := by
  sorry

example : orientableEulerChar 2 0 = -2 := by
  sorry

end FG6

/-! ## Layer FG7: generalised equations, equation solving, and positive formal solutions -/

section FG7

/-- An encoded system with `k` variables over the basis `Fin n`: lists of equation words and of
inequation words. -/
abbrev EncSystem (k n : ℕ) : Type :=
  List (List ((Fin k ⊕ Fin n) × Bool)) × List (List ((Fin k ⊕ Fin n) × Bool))

/-- Solutions of an encoded system in `FreeGroup (Fin n)`. -/
def EncSystem.Solves {k n : ℕ} (s : EncSystem k n) (v : Fin k → FreeGroup (Fin n)) : Prop :=
  (∀ w ∈ s.1, FreeGroup.lift (Sum.elim v FreeGroup.of) (FreeGroup.mk w) = 1) ∧
    ∀ w ∈ s.2, FreeGroup.lift (Sum.elim v FreeGroup.of) (FreeGroup.mk w) ≠ 1

/-- The solver for systems of equations and inequations over a free group of finite rank
(FG7.6–FG7.11): computable, returning a solution when one exists and `none` exactly when there
is none. -/
theorem exists_solver (k n : ℕ) :
    ∃ solve : EncSystem k n → Option (List (List (Fin n × Bool))), Computable solve ∧
      ∀ s, (∀ ws, solve s = some ws →
          s.Solves fun i => FreeGroup.mk (ws.getD i [])) ∧
        (solve s = none ↔ ¬ ∃ v, s.Solves v) := by
  sorry

/-- Merzljakov's theorem (FG7.14): if the positive `∀∃` sentence holds in `F`, witnessed by Skolem
functions in which `yᵢ` depends only on `x₁, …, xᵢ`, then it has a formal solution in `F[X]` with
the same dependence. -/
theorem merzljakov (k n : ℕ) (hn : 2 ≤ n) (S : FreeGroup ((Fin k ⊕ Fin k) ⊕ Fin n))
    (h : ∃ f : (Fin k → FreeGroup (Fin n)) → Fin k → FreeGroup (Fin n),
      (∀ (i : Fin k) (x x' : Fin k → FreeGroup (Fin n)),
          (∀ j ≤ i, x j = x' j) → f x i = f x' i) ∧
        ∀ x, FreeGroup.lift (Sum.elim (Sum.elim x (f x)) FreeGroup.of) S = 1) :
    ∃ q : Fin k → FreeGroup (Fin k ⊕ Fin n),
      (∀ i, q i ∈ Subgroup.closure
          (Set.range (fun a => FreeGroup.of (Sum.inr a)) ∪
            (fun j => FreeGroup.of (Sum.inl j)) '' {j | j ≤ i})) ∧
        FreeGroup.lift (Sum.elim (Sum.elim (fun j => FreeGroup.of (Sum.inl j)) q)
          (fun a => FreeGroup.of (Sum.inr a))) S = 1 := by
  sorry

end FG7

/-! ## Layer FG8: fully residually free groups, limit groups, and NTQ towers -/

section FG8

/-- Residually free groups (FG8.1). -/
def IsResiduallyFree (G : Type u) [Group G] : Prop :=
  ∀ g : G, g ≠ 1 → ∃ (F : Type u) (_ : Group F), IsFreeGroup F ∧ ∃ φ : G →* F, φ g ≠ 1

/-- Fully residually free (freely discriminated) groups (FG8.1). -/
def IsFullyResiduallyFree (G : Type u) [Group G] : Prop :=
  ∀ s : Finset G, (1 : G) ∉ s →
    ∃ (F : Type u) (_ : Group F), IsFreeGroup F ∧ ∃ φ : G →* F, ∀ g ∈ s, φ g ≠ 1

example : IsResiduallyFree (FreeGroup (Fin 2) × Multiplicative ℤ) := by
  sorry

example : ¬ IsFullyResiduallyFree (FreeGroup (Fin 2) × Multiplicative ℤ) := by
  sorry

example : IsFullyResiduallyFree (Multiplicative (Fin 3 → ℤ)) := by
  sorry

/-- The point of the Cantor space `FreeGroup (Fin n) → Bool` given by a subgroup. -/
noncomputable def markedPoint {n : ℕ} (N : Subgroup (FreeGroup (Fin n))) :
    FreeGroup (Fin n) → Bool := by
  classical
  exact fun w => decide (w ∈ N)

/-- Limit groups: some marking is a limit of markings of free groups (FG8.3). -/
def IsLimitGroup (G : Type*) [Group G] : Prop :=
  ∃ (n : ℕ) (f : FreeGroup (Fin n) →* G), Function.Surjective f ∧
    markedPoint f.ker ∈
      closure (Set.range fun ψ : FreeGroup (Fin n) →* FreeGroup (Fin 2) => markedPoint ψ.ker)

/-- Limit groups are the finitely generated fully residually free groups (FG8.4). -/
theorem isLimitGroup_iff (G : Type) [Group G] [Group.FG G] :
    IsLimitGroup G ↔ IsFullyResiduallyFree G := by
  sorry

/-- Fully residually free groups are commutative transitive (FG8.2). -/
theorem IsFullyResiduallyFree.commute_trans {G : Type u} [Group G] (hG : IsFullyResiduallyFree G)
    {a b c : G} (hb : b ≠ 1) (hab : Commute a b) (hbc : Commute b c) : Commute a c := by
  sorry

/-- The extension of the centralizer of `u` by `ℤ` (FG8.5), as an HNN extension along the
identity of the centralizer. -/
abbrev CentralizerExt (G : Type*) [Group G] (u : G) : Type _ :=
  HNNExtension G (Subgroup.centralizer {u}) (Subgroup.centralizer {u}) (MulEquiv.refl _)

/-- Extensions of centralizers of non-proper-powers in fully residually free groups are fully
residually free (FG8.6). -/
theorem isFullyResiduallyFree_centralizerExt {G : Type} [Group G] (hG : IsFullyResiduallyFree G)
    (u : G) (hu : u ≠ 1) (hu' : ¬ IsProperPower u) :
    IsFullyResiduallyFree (CentralizerExt G u) := by
  sorry

/-- Finitely generated fully residually free groups are finitely presented (FG8.7). -/
theorem isFinitelyPresented_of_fullyResiduallyFree (G : Type) [Group G] [Group.FG G]
    (hG : IsFullyResiduallyFree G) : Group.IsFinitelyPresented G := by
  sorry

end FG8

/-! ## Layer FG9: length functions and infinite-word representations -/

section FG9

/-- Lyndon length functions with values in an ordered abelian group `Λ` (FG9.1). The Gromov
product is used doubled, `2 c(g, f) = l g + l f - l (g⁻¹ f)`, to stay inside `Λ`. -/
structure LyndonLength (G : Type*) [Group G] (Λ : Type*) [AddCommGroup Λ] [LinearOrder Λ]
    [IsOrderedAddMonoid Λ] where
  /-- The length. -/
  l : G → Λ
  l_one : l 1 = 0
  l_inv : ∀ g, l g⁻¹ = l g
  gromov : ∀ g f h : G,
    l g + l h - l (g⁻¹ * h) < l g + l f - l (g⁻¹ * f) →
      l g + l h - l (g⁻¹ * h) = l f + l h - l (f⁻¹ * h)

namespace LyndonLength

variable {G Λ : Type*} [Group G] [AddCommGroup Λ] [LinearOrder Λ] [IsOrderedAddMonoid Λ]

/-- Free length functions: (L4) and (L5). -/
def IsFree (L : LyndonLength G Λ) : Prop :=
  (∀ g f : G, ∃ c : Λ, 2 • c = L.l g + L.l f - L.l (g⁻¹ * f)) ∧
    ∀ g : G, g ≠ 1 → L.l g < L.l (g ^ 2)

/-- Regular length functions: (L6). -/
def IsRegular (L : LyndonLength G Λ) : Prop :=
  ∀ g f : G, ∃ u g₁ f₁ : G, g = u * g₁ ∧ f = u * f₁ ∧ L.l g = L.l u + L.l g₁ ∧
    L.l f = L.l u + L.l f₁ ∧ 2 • L.l u = L.l g + L.l f - L.l (g⁻¹ * f)

end LyndonLength

/-- The word length of a free group is a free regular Lyndon length function (FG9.1). -/
theorem exists_lyndonLength_norm (α : Type*) [DecidableEq α] :
    ∃ L : LyndonLength (FreeGroup α) ℤ, (∀ g, L.l g = (FreeGroup.norm g : ℤ)) ∧
      L.IsFree ∧ L.IsRegular := by
  sorry

/-- Finitely generated fully residually free groups have free `ℤⁿ`-valued length functions for
the lexicographic order (FG9.5). -/
theorem exists_free_lyndonLength (G : Type) [Group G] [Group.FG G]
    (hG : IsFullyResiduallyFree G) :
    ∃ (n : ℕ) (L : LyndonLength G (Lex (Fin n → ℤ))), L.IsFree := by
  sorry

end FG9

/-! ## Layer FG11: regular implicit-function theorems over free groups -/

section FG11

variable {G : Type*} [Group G]

/-- Compatibility of `T(X, Y) = 1` with `S(X) = 1` over `G` (FG11.1). -/
def IsCompatible {X Y : Type*} (S : Set (GX G X)) (T : Set (GX G (X ⊕ Y))) : Prop :=
  ∀ v ∈ algSet (MonoidHom.id G) S, ∃ w : Y → G,
    ∀ t ∈ T, evalAt (MonoidHom.id G) (Sum.elim v w) t = 1

/-- `T` admits an `S`-lift: it has a solution in the coordinate group `G_{R(S)}` with `X`
interpreted as the generic point (FG11.1). -/
def HasLift {X Y : Type*} (S : Set (GX G X)) (T : Set (GX G (X ⊕ Y))) : Prop :=
  ∃ w : Y → CoordGroup (MonoidHom.id G) S,
    ∀ t ∈ T, evalAt ((QuotientGroup.mk' _).comp Monoid.Coprod.inl)
      (Sum.elim (fun x => QuotientGroup.mk' _ (Monoid.Coprod.inr (FreeGroup.of x))) w) t = 1

/-- The genus-two surface equation `[x₁, y₁][x₂, y₂] = 1` over `F(a, b)`, a regular standard
quadratic equation. -/
def genusTwoEquation : GX (FreeGroup (Fin 2)) (Fin 4) :=
  Monoid.Coprod.inr (comm (FreeGroup.of (0 : Fin 4)) (FreeGroup.of 1) *
    comm (FreeGroup.of (2 : Fin 4)) (FreeGroup.of 3))

/-- The implicit function theorem for regular quadratic equations (FG11.5), in the instance of the
genus-two equation: every compatible equation lifts to the generic point. -/
theorem hasLift_genusTwo {Y : Type*} (T : Set (GX (FreeGroup (Fin 2)) (Fin 4 ⊕ Y)))
    (hT : IsCompatible {genusTwoEquation} T) : HasLift {genusTwoEquation} T := by
  sorry

end FG11

/-
Targets stated only in the README (their carriers are not at the pins): the Primcodable encoding
of `FreeGroup α`; Stallings folds, cores and the Stallings correspondence; encodings of first-order
syntax; graphs of groups, their fundamental groups, Bass–Serre trees, the structure theorem,
induced splittings and Kurosh's theorem; QH vertices; generalised equations, elementary
transformations and Makanin's finiteness theorem; the existential, universal and positive
deciders; marked-group compactness; NTQ systems and NTQ groups; infinite words, `F^{ℤ[t]}` and
graphs labelled by infinite words; Λ-metric spaces, Λ-trees and free actions on them; JSJ trees and their existence, the promised-input algorithms
for limit groups, effective Grushko and JSJ decompositions, Makanin–Razborov diagrams and
effective components, equations over represented limit groups; basic automorphisms, generic
families, the implicit function theorem for regular NTQ systems and the effective lift.
-/

end TauCetiRoadmap.FreeGroupsAndLimitGroups
