import Mathlib

/-!
# FreeGroupsAndLimitGroups: representative target signatures

This file is not the roadmap. The roadmap is `README.md`,
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
open scoped commutatorElement

/-! ## Layer 1: free-group words, normal forms, and elementary algorithms -/

section layer1

variable {α : Type*} [DecidableEq α]

/-- The word-problem procedure: a word is trivial in the free group iff its free reduction is
empty (§1.4). -/
def isTrivialWord (L : List (α × Bool)) : Bool :=
  (FreeGroup.reduce L).isEmpty

/-- Equality test for words (§1.4). -/
def eqWord (L₁ L₂ : List (α × Bool)) : Bool :=
  isTrivialWord (FreeGroup.invRev L₁ ++ L₂)

/-- Correctness of both answers of the word-problem procedure (§1.5). -/
theorem isTrivialWord_iff (L : List (α × Bool)) :
    isTrivialWord L = true ↔ FreeGroup.mk L = 1 := by
  sorry

theorem eqWord_iff (L₁ L₂ : List (α × Bool)) :
    eqWord L₁ L₂ = true ↔ FreeGroup.mk L₁ = FreeGroup.mk L₂ := by
  sorry

/-- The word problem is primitive recursive (§1.6). -/
theorem primrec_isTrivialWord [Primcodable α] : Primrec (isTrivialWord (α := α)) := by
  sorry

/-- Free reduction is primitive recursive (§1.2). -/
theorem primrec_reduce [Primcodable α] : Primrec (FreeGroup.reduce (α := α)) := by
  sorry

example : isTrivialWord ([] : List (α × Bool)) = true := by
  sorry

example (a b : α) (h : a ≠ b) :
    isTrivialWord [(a, true), (b, true), (a, false), (b, false)] = false := by
  sorry

example (a b : α) : isTrivialWord [(a, true), (b, true), (b, false), (a, false)] = true := by
  sorry

example (a : α) : eqWord [(a, true), (a, false)] [] = true := by
  sorry

example (a : α) : eqWord [(a, true)] [] = false := by
  sorry

/-- Conjugacy criterion (§1.7): two elements are conjugate iff their cyclic reductions are
rotations of each other. -/
theorem isConj_iff_isRotated (x y : FreeGroup α) :
    IsConj x y ↔ (FreeGroup.reduceCyclically x.toWord).IsRotated
      (FreeGroup.reduceCyclically y.toWord) := by
  sorry

/-- The conjugacy problem is decided by a primitive recursive procedure returning a conjugating
word (§1.8–§1.10). -/
theorem exists_conjWitness [Primcodable α] :
    ∃ f : List (α × Bool) → List (α × Bool) → Option (List (α × Bool)), Primrec₂ f ∧
      ∀ L₁ L₂, (∀ c, f L₁ L₂ = some c →
          (FreeGroup.mk c)⁻¹ * FreeGroup.mk L₁ * FreeGroup.mk c = FreeGroup.mk L₂) ∧
        (f L₁ L₂ = none ↔ ¬ IsConj (FreeGroup.mk L₁) (FreeGroup.mk L₂)) := by
  sorry

example (a b : α) (h : a ≠ b) :
    ¬ IsConj (FreeGroup.of a * FreeGroup.of b) (FreeGroup.of a * FreeGroup.of b)⁻¹ := by
  sorry

end layer1

/-- A proper power: `x = y ^ n` with `n ≥ 2` (§1.11). The identity is a proper power, so
‘not a proper power’ is used for nontrivial elements only. -/
def IsProperPower {G : Type*} [Group G] (x : G) : Prop :=
  ∃ y : G, ∃ n : ℕ, 2 ≤ n ∧ x = y ^ n

/-- A primitive element of a free group: a member of some free basis (§1.12). Being primitive is
not the negation of being a proper power. -/
def IsPrimitive {G : Type u} [Group G] (x : G) : Prop :=
  ∃ (ι : Type u) (b : FreeGroupBasis ι G) (i : ι), b i = x

/-- A malnormal subgroup: it meets its conjugate by any element outside it trivially (§1.18). -/
def IsMalnormal {G : Type*} [Group G] (M : Subgroup G) : Prop :=
  ∀ g : G, g ∉ M → M.map (MulAut.conj g).toMonoidHom ⊓ M = ⊥

/-- A subgroup any two of whose elements commute. -/
def IsCommSubgroup {G : Type*} [Group G] (M : Subgroup G) : Prop :=
  ∀ x ∈ M, ∀ y ∈ M, Commute x y

/-- CSA groups: every maximal abelian subgroup is malnormal (§1.18). -/
def IsCSA (G : Type*) [Group G] : Prop :=
  ∀ M : Subgroup G, IsCommSubgroup M →
    (∀ N : Subgroup G, M ≤ N → IsCommSubgroup N → N = M) → IsMalnormal M

/-- Commutation is transitive on nontrivial elements (§1.18). -/
def IsCommTransitive (G : Type*) [Group G] : Prop :=
  ∀ x y z : G, y ≠ 1 → Commute x y → Commute y z → Commute x z

/-- CSA groups are commutative transitive (§1.18). -/
theorem IsCSA.isCommTransitive {G : Type*} [Group G] (hG : IsCSA G) : IsCommTransitive G := by
  sorry

example : IsCSA (Multiplicative ℤ) := by
  sorry

example : ¬ IsCommTransitive (FreeGroup (Fin 2) × Multiplicative ℤ) := by
  sorry

example {α : Type u} (a : α) : IsPrimitive (FreeGroup.of a) := by
  sorry

example (a b : Fin 2) (h : a ≠ b) :
    ¬ IsMalnormal (Subgroup.zpowers (FreeGroup.of a ^ 2)) := by
  sorry

example : IsMalnormal (⊥ : Subgroup (FreeGroup (Fin 2))) := by
  sorry

example : IsCommSubgroup (⊤ : Subgroup (Multiplicative ℤ)) := by
  sorry

example : ¬ IsCommSubgroup (⊤ : Subgroup (FreeGroup (Fin 2))) := by
  sorry

example : ¬ IsCSA (FreeGroup (Fin 2) × Multiplicative ℤ) := by
  sorry

example : IsCommTransitive (FreeGroup (Fin 2)) := by
  sorry

section roots

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

/-- Maximal roots (§1.13–§1.15): a primitive recursive procedure on words with the identity
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

/-- Commuting elements are powers of a common element (§1.16). -/
theorem commute_iff_exists_zpow (x y : FreeGroup α) :
    Commute x y ↔ ∃ r : FreeGroup α, ∃ m n : ℤ, x = r ^ m ∧ y = r ^ n := by
  sorry

/-- Centralizers of nontrivial elements are cyclic, generated by the maximal root (§1.17). -/
theorem centralizer_eq_zpowers (x : FreeGroup α) (hx : x ≠ 1) :
    ∃ r : FreeGroup α, ¬ IsProperPower r ∧
      Subgroup.centralizer {x} = Subgroup.zpowers r := by
  sorry

/-- Maximal cyclic subgroups are malnormal (§1.19). -/
theorem zpowers_malnormal (u : FreeGroup α) (hu : u ≠ 1) (hu' : ¬ IsProperPower u) :
    IsMalnormal (Subgroup.zpowers u) := by
  sorry

/-- Free groups are CSA (§1.19). -/
theorem isCSA_freeGroup : IsCSA (FreeGroup α) := by
  sorry

end roots

/-! ## Layer 2: Stallings graphs and finitely generated free subgroups -/

/-- Serre graphs: an origin map and a fixed-point-free involution on edges; loops and multiple
edges are allowed (§2.1). -/
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

example (e : E) : Γ.tgt (Γ.rev e) = Γ.src e := by
  sorry

example (v : V) : Γ.IsPath v [] v := by
  sorry

example (e : E) : Γ.IsPath (Γ.src e) [e] (Γ.tgt e) := by
  sorry

example (e : E) : Γ.IsReducedPath [e] := by
  sorry

example (e : E) : ¬ Γ.IsReducedPath [e, Γ.rev e] := by
  sorry

example (e : E) (he : Γ.tgt e = Γ.src e) : ¬ Γ.IsTree := by
  sorry

example : ¬ Nonempty (SerreGraph Unit Unit) := by
  sorry

example : ∃ T : SerreGraph Unit Empty, T.IsTree := by
  sorry

end SerreGraph

/-- `α`-labelled graphs with labels compatible with reversal (§2.3). -/
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
reduced closed path at `v` (§2.3; KM02 Lemma 3.2). -/
theorem mem_accepted_iff_of_isFolded (hΓ : Γ.IsFolded) (v : V) (w : List (α × Bool))
    (hw : FreeGroup.IsReduced w) :
    FreeGroup.mk w ∈ Γ.accepted v ↔
      ∃ es : List E, Γ.toSerreGraph.IsPath v es v ∧ Γ.toSerreGraph.IsReducedPath es ∧
        es.map Γ.label = w := by
  sorry

example (v : V) : (1 : FreeGroup α) ∈ Γ.accepted v := by
  sorry

example (e : E) (he : Γ.tgt e = Γ.src e) :
    FreeGroup.mk [Γ.label e] ∈ Γ.accepted (Γ.src e) := by
  sorry

example (e f : E) (hsrc : Γ.src e = Γ.src f) (hlab : Γ.label e = Γ.label f)
    (hne : e ≠ f) : ¬ Γ.IsFolded := by
  sorry

example (e : E) : Γ.label (Γ.rev e) = ((Γ.label e).1, !(Γ.label e).2) := by
  sorry

end LabelledGraph

section layer2

variable {α : Type*} [DecidableEq α]

/-- The membership (generalised word) problem is decided by a primitive recursive procedure
(§2.9–§2.10). -/
theorem exists_memberTest [Fintype α] [Primcodable α] :
    ∃ f : List (List (α × Bool)) → List (α × Bool) → Bool, Primrec₂ f ∧
      ∀ ws w, f ws w = true ↔
        FreeGroup.mk w ∈ Subgroup.closure (FreeGroup.mk '' {u | u ∈ ws}) := by
  sorry

/-- Howson property (§2.12). -/
theorem fg_inf (H K : Subgroup (FreeGroup α)) (hH : H.FG) (hK : K.FG) : (H ⊓ K).FG := by
  sorry

/-- The exact Schreier formula (§2.12); this is the equality for free groups. -/
theorem rank_sub_one_eq_index_mul (n : ℕ) (H : Subgroup (FreeGroup (Fin n)))
    [H.FiniteIndex] [Group.FG H] :
    (Group.rank H : ℤ) - 1 = H.index * ((n : ℤ) - 1) := by
  sorry

example (a b : α) (h : a ≠ b) :
    FreeGroup.of b ∉ Subgroup.closure {FreeGroup.of a, FreeGroup.of b * FreeGroup.of a * (FreeGroup.of b)⁻¹} := by
  sorry

end layer2

/-! ## Layer 3: effective first-order group syntax -/

/-- Function symbols of the language of groups. -/
inductive GroupFunc : ℕ → Type
  | one : GroupFunc 0
  | inv : GroupFunc 1
  | mul : GroupFunc 2

/-- The first-order language of groups (§3.1). Coefficients are carried by free variables
interpreted through a map `c : A → G`, as in the term–word correspondence. -/
def groupLang : FirstOrder.Language where
  Functions := GroupFunc
  Relations := fun _ => Empty

/-- Interpretation of a group symbol in a group. -/
def GroupFunc.eval {G : Type*} [Group G] : {n : ℕ} → GroupFunc n → (Fin n → G) → G
  | _, .one, _ => 1
  | _, .inv, x => (x 0)⁻¹
  | _, .mul, x => x 0 * x 1

/-- Every group is a structure for the language of groups (§3.1). -/
instance groupStructure (G : Type*) [Group G] : groupLang.Structure G where
  funMap f x := GroupFunc.eval f x
  RelMap r _ := Empty.elim r

example : groupLang.Relations 2 = Empty := by
  sorry

example {G : Type*} [Group G] (x : Fin 2 → G) : GroupFunc.eval .mul x = x 0 * x 1 := by
  sorry

example {G : Type*} [Group G] :
    (FirstOrder.Language.Term.func (L := groupLang) GroupFunc.one
      (fun i => Fin.elim0 i) : groupLang.Term Empty).realize (fun i => Empty.elim i) = (1 : G) := by
  sorry

/-- The term–word correspondence (§3.4): the word of a term is its value in the free group. -/
def termToWord {X : Type*} (t : groupLang.Term X) : FreeGroup X :=
  t.realize FreeGroup.of

example {X : Type*} (x : X) : termToWord (FirstOrder.Language.Term.var x) = FreeGroup.of x := by
  sorry

example {X : Type*} :
    termToWord (FirstOrder.Language.Term.func GroupFunc.one (fun i => Fin.elim0 i) :
      groupLang.Term X) = 1 := by
  sorry

/-- Terms evaluate through their words in every group (§3.4). -/
theorem realize_eq_lift {X G : Type*} [Group G] (v : X → G) (t : groupLang.Term X) :
    t.realize v = FreeGroup.lift v (termToWord t) := by
  sorry

/-- Finite systems of equations and inequations with variables `X` and coefficient letters `A`
(§3.5). -/
structure EqIneqSystem (X A : Type*) where
  /-- Equations `w = 1`. -/
  eqs : List (FreeGroup (X ⊕ A))
  /-- Inequations `w ≠ 1`. -/
  ineqs : List (FreeGroup (X ⊕ A))

/-- Solutions of a system in a group `G` with coefficient map `c` (§3.5). -/
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

example {X A G : Type*} [Group G] (c : A → G) (v : X → G) :
    (⟨[], []⟩ : EqIneqSystem X A).IsSolution c v := by
  sorry

/-! ## Layer 4: Bass–Serre theory and relative splittings -/

section layer4

/-- Dehn twists of HNN extensions (§4.13): for `z` centralizing the associated subgroup `A`,
there is an automorphism fixing the base group and sending `t` to `t * z`. -/
theorem exists_dehnTwist_hnn {G : Type*} [Group G] (A B : Subgroup G) (φ : A ≃* B) (z : G)
    (hz : ∀ a : A, Commute z a) :
    ∃ τ : HNNExtension G A B φ ≃* HNNExtension G A B φ,
      (∀ g : G, τ (HNNExtension.of g) = HNNExtension.of g) ∧
        τ HNNExtension.t = HNNExtension.t * HNNExtension.of z := by
  sorry

/-- Grushko–Neumann theorem (§4.11). -/
theorem rank_coprod {G H : Type*} [Group G] [Group H] [Group.FG G] [Group.FG H]
    [Group.FG (Monoid.Coprod G H)] [Nontrivial G] [Nontrivial H] :
    Group.rank (Monoid.Coprod G H) = Group.rank G + Group.rank H := by
  sorry

end layer4

/-! ## Layer 5: equations, radicals, and algebraic geometry over groups -/

section layer5

variable {G : Type*} [Group G]

/-- The free `G`-group `G[X] = G ∗ F(X)` (§5.1). -/
abbrev GX (G : Type*) [Group G] (X : Type*) := Monoid.Coprod G (FreeGroup X)

/-- Evaluation of `G[X]` at a point of a `G`-group (§5.1). -/
def evalAt {X H : Type*} [Group H] (ι : G →* H) (v : X → H) : GX G X →* H :=
  Monoid.Coprod.lift ι (FreeGroup.lift v)

/-- Algebraic sets (§5.2). -/
def algSet {X H : Type*} [Group H] (ι : G →* H) (S : Set (GX G X)) : Set (X → H) :=
  {v | ∀ s ∈ S, evalAt ι v s = 1}

/-- The ideal of a set of points, as the kernel of the joint evaluation (§5.2). -/
abbrev idealOf {X H : Type*} [Group H] (ι : G →* H) (Y : Set (X → H)) : Subgroup (GX G X) :=
  (MonoidHom.pi fun v : Y => evalAt ι v.1).ker

/-- The radical of a system over `H` (§5.2). -/
abbrev radical {X H : Type*} [Group H] (ι : G →* H) (S : Set (GX G X)) : Subgroup (GX G X) :=
  idealOf ι (algSet ι S)

/-- The coordinate group `G[X] ⧸ Rad(S)` (§5.2). -/
abbrev CoordGroup {X H : Type*} [Group H] (ι : G →* H) (S : Set (GX G X)) : Type _ :=
  GX G X ⧸ radical ι S

/-- `K` is `G`-separated by `H` (residually `H`) (§5.3). -/
def IsSeparatedBy (K H : Type*) [Group K] [Group H] (ιK : G →* K) (ιH : G →* H) : Prop :=
  ∀ k : K, k ≠ 1 → ∃ φ : K →* H, φ.comp ιK = ιH ∧ φ k ≠ 1

/-- `K` is `G`-discriminated by `H` (fully residually `H`) (§5.3). -/
def IsDiscriminatedBy (K H : Type*) [Group K] [Group H] (ιK : G →* K) (ιH : G →* H) : Prop :=
  ∀ s : Finset K, (1 : K) ∉ s → ∃ φ : K →* H, φ.comp ιK = ιH ∧ ∀ k ∈ s, φ k ≠ 1

/-- `G`-domains: no `G`-zero divisors (§5.4). -/
def IsGDomain (H : Type*) [Group H] (ι : G →* H) : Prop :=
  ∀ x y : H, x ≠ 1 → y ≠ 1 → ∃ g : G,
    x * (ι g * y * (ι g)⁻¹) * x⁻¹ * (ι g * y * (ι g)⁻¹)⁻¹ ≠ 1

/-- Equationally Noetherian groups (§5.7). -/
def IsEquationallyNoetherian (H : Type*) [Group H] : Prop :=
  ∀ (X : Type) [Finite X] (S : Set (GX H X)),
    ∃ S₀ ⊆ S, S₀.Finite ∧ algSet (MonoidHom.id H) S₀ = algSet (MonoidHom.id H) S

/-- The Zariski topology: generated by complements of algebraic sets (§5.6). -/
abbrev zariski {X H : Type*} [Group H] (ι : G →* H) : TopologicalSpace (X → H) :=
  TopologicalSpace.generateFrom {U | ∃ S : Set (GX G X), U = (algSet ι S)ᶜ}

example {X H : Type*} [Group H] (ι : G →* H) (v : X → H) (g : G) :
    evalAt ι v (Monoid.Coprod.inl g) = ι g := by
  sorry

example {X H : Type*} [Group H] (ι : G →* H) (v : X → H) (x : X) :
    evalAt ι v (Monoid.Coprod.inr (FreeGroup.of x)) = v x := by
  sorry

example {X : Type*} : algSet (MonoidHom.id G) (∅ : Set (GX G X)) = Set.univ := by
  sorry

example {X : Type*} :
    idealOf (MonoidHom.id G) (∅ : Set (X → G)) = ⊤ := by
  sorry

example {X : Type*} (x : X) :
    radical (MonoidHom.id (FreeGroup (Fin 2))) {Monoid.Coprod.inr (FreeGroup.of x)} =
      Subgroup.normalClosure {(Monoid.Coprod.inr (FreeGroup.of x) : GX (FreeGroup (Fin 2)) X)} := by
  sorry

example : Nonempty (CoordGroup (MonoidHom.id G)
    (∅ : Set (GX G Empty)) ≃* G) := by
  sorry

example : IsSeparatedBy G G (MonoidHom.id G) (MonoidHom.id G) := by
  sorry

example : IsDiscriminatedBy G G (MonoidHom.id G) (MonoidHom.id G) := by
  sorry

example {X : Type*} (v : X → G) : @IsClosed _ (zariski (MonoidHom.id G)) {v} := by
  sorry

example : IsEquationallyNoetherian (Multiplicative ℤ) := by
  sorry

example : ¬ IsGDomain (Multiplicative ℤ)
    (1 : FreeGroup (Fin 2) →* Multiplicative ℤ) := by
  sorry

/-- Free groups of rank two are linear over `ℤ` (§5.8). -/
theorem exists_injective_freeGroup_SL :
    ∃ f : FreeGroup (Fin 2) →* Matrix.SpecialLinearGroup (Fin 2) ℤ, Function.Injective f := by
  sorry

/-- Free groups of finite rank are equationally Noetherian (§5.9). -/
theorem isEquationallyNoetherian_freeGroup (n : ℕ) :
    IsEquationallyNoetherian (FreeGroup (Fin n)) := by
  sorry

/-- Irreducibility is discrimination of the coordinate group (§5.11), for a `G`-equationally
Noetherian `G`-domain `H` (stated here with `H = G`). -/
theorem isIrreducible_iff_discriminated {X : Type*} [Finite X]
    (hG : IsEquationallyNoetherian G) (hD : IsGDomain G (MonoidHom.id G))
    (S : Set (GX G X)) (hS : (algSet (MonoidHom.id G) S).Nonempty) :
    @IsIrreducible _ (zariski (MonoidHom.id G)) (algSet (MonoidHom.id G) S) ↔
      IsDiscriminatedBy (CoordGroup (MonoidHom.id G) S) G
        ((QuotientGroup.mk' _).comp Monoid.Coprod.inl) (MonoidHom.id G) := by
  sorry

/-- The radical of `x²` over a free group is the normal closure of `x`, not of `x²` (§5.2). -/
example :
    radical (MonoidHom.id (FreeGroup (Fin 2))) {Monoid.Coprod.inr (FreeGroup.of ()) ^ 2} =
      Subgroup.normalClosure {(Monoid.Coprod.inr (FreeGroup.of ()) : GX (FreeGroup (Fin 2)) Unit)} := by
  sorry

example : IsGDomain (FreeGroup (Fin 2)) (MonoidHom.id _) := by
  sorry

example : ¬ IsGDomain (Multiplicative (Fin 2 → ℤ)) (MonoidHom.id _) := by
  sorry

end layer5

/-! ## Layer 6: surface groups and quadratic equations -/

section layer6

/-- The source commutator `x⁻¹ y⁻¹ x y`, equal to Mathlib's `⁅x⁻¹, y⁻¹⁆`. -/
def comm {G : Type*} [Group G] (x y : G) : G := x⁻¹ * y⁻¹ * x * y

/-- The orientable surface relator of genus `g` with `m` boundary elements (§6.1), with the
source commutator convention of `comm`. -/
def orientableRelator (g m : ℕ) : FreeGroup ((Fin g × Bool) ⊕ Fin m) :=
  ((List.finRange g).map fun i : Fin g =>
      comm (FreeGroup.of (Sum.inl (i, false) : (Fin g × Bool) ⊕ Fin m))
        (FreeGroup.of (Sum.inl (i, true)))).prod *
    ((List.finRange m).map fun j : Fin m =>
      FreeGroup.of (Sum.inr j : (Fin g × Bool) ⊕ Fin m)).prod

/-- The orientable surface group `S⁺(g, m)` (§6.1). -/
abbrev OrientableSurfaceGroup (g m : ℕ) : Type :=
  PresentedGroup {orientableRelator g m}

/-- The non-orientable surface relator `c₁² ⋯ c_g² p₁ ⋯ p_m` (§6.1). -/
def nonorientableRelator (g m : ℕ) : FreeGroup (Fin g ⊕ Fin m) :=
  ((List.finRange g).map fun i : Fin g => FreeGroup.of (Sum.inl i : Fin g ⊕ Fin m) ^ 2).prod *
    ((List.finRange m).map fun j : Fin m => FreeGroup.of (Sum.inr j : Fin g ⊕ Fin m)).prod

/-- The non-orientable surface group `S⁻(g, m)` (§6.1). -/
abbrev NonorientableSurfaceGroup (g m : ℕ) : Type :=
  PresentedGroup {nonorientableRelator g m}

/-- Euler characteristic of `S⁺(g, m)`. -/
def orientableEulerChar (g m : ℕ) : ℤ := 2 - 2 * g - m

example {G : Type*} [Group G] (x y : G) : comm x y = ⁅x⁻¹, y⁻¹⁆ := by
  sorry

example : orientableRelator 0 1 = FreeGroup.of (Sum.inr (0 : Fin 1)) := by
  sorry

example : nonorientableRelator 1 0 = FreeGroup.of (Sum.inl (0 : Fin 1)) ^ 2 := by
  sorry

example : Subsingleton (OrientableSurfaceGroup 0 1) := by
  sorry

/-- Surface groups with boundary are free (§6.2). -/
theorem isFreeGroup_orientable (g m : ℕ) (hm : 1 ≤ m) :
    IsFreeGroup (OrientableSurfaceGroup g m) := by
  sorry

/-- Closed orientable surface groups of positive genus are not free (§6.2). -/
theorem not_isFreeGroup_orientable_closed (g : ℕ) (hg : 1 ≤ g) :
    ¬ IsFreeGroup (OrientableSurfaceGroup g 0) := by
  sorry

example : Nonempty (OrientableSurfaceGroup 1 0 ≃* Multiplicative (Fin 2 → ℤ)) := by
  sorry

example : Nat.card (NonorientableSurfaceGroup 1 0) = 2 := by
  sorry

example : orientableEulerChar 2 0 = -2 := by
  sorry

example :
    radical (MonoidHom.id (FreeGroup (Fin 2)))
      {Monoid.Coprod.inr (FreeGroup.of false ^ 2 * FreeGroup.of true ^ 2)} =
    Subgroup.normalClosure
      {(Monoid.Coprod.inr (FreeGroup.of false * FreeGroup.of true) : GX (FreeGroup (Fin 2)) Bool)} := by
  sorry

/-- The nonabelian coefficient hypothesis in the quadratic radical theorem is necessary. -/
example :
    let r : GX (Multiplicative ℤ) (Fin 4) :=
      Monoid.Coprod.inr (comm (FreeGroup.of 0) (FreeGroup.of 1) *
        comm (FreeGroup.of 2) (FreeGroup.of 3))
    let w : GX (Multiplicative ℤ) (Fin 4) :=
      Monoid.Coprod.inr (comm (FreeGroup.of 0) (FreeGroup.of 1))
    w ∈ radical (MonoidHom.id _) {r} ∧ w ∉ Subgroup.normalClosure {r} := by
  sorry

end layer6

/-! ## Layer 7: generalised equations, equation solving, and positive formal solutions -/

section layer7

/-- An encoded system with `k` variables over the basis `Fin n`: lists of equation words and of
inequation words. -/
abbrev EncSystem (k n : ℕ) : Type :=
  List (List ((Fin k ⊕ Fin n) × Bool)) × List (List ((Fin k ⊕ Fin n) × Bool))

/-- Solutions of an encoded system in `FreeGroup (Fin n)`. -/
def EncSystem.Solves {k n : ℕ} (s : EncSystem k n) (v : Fin k → FreeGroup (Fin n)) : Prop :=
  (∀ w ∈ s.1, FreeGroup.lift (Sum.elim v FreeGroup.of) (FreeGroup.mk w) = 1) ∧
    ∀ w ∈ s.2, FreeGroup.lift (Sum.elim v FreeGroup.of) (FreeGroup.mk w) ≠ 1

example (k n : ℕ) (v : Fin k → FreeGroup (Fin n)) :
    EncSystem.Solves (([], []) : EncSystem k n) v := by
  sorry

example (n : ℕ) (v : Fin 1 → FreeGroup (Fin n)) :
    ¬ EncSystem.Solves (([], [[]]) : EncSystem 1 n) v := by
  sorry

/-- The solver for systems of equations and inequations over a free group of finite rank
(§7.6–§7.11): computable, returning a solution when one exists and `none` exactly when there
is none. -/
theorem exists_solver (k n : ℕ) :
    ∃ solve : EncSystem k n → Option (List (List (Fin n × Bool))), Computable solve ∧
      ∀ s, (∀ ws, solve s = some ws → ws.length = k ∧
          s.Solves fun i => FreeGroup.mk (ws.getD i [])) ∧
        (solve s = none ↔ ¬ ∃ v, s.Solves v) := by
  sorry

/-- Merzljakov's theorem (§7.15): if the positive `∀∃` sentence holds in `F`, witnessed by Skolem
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

end layer7

/-! ## Layer 8: fully residually free groups, limit groups, and NTQ towers -/

section layer8

/-- Residually free groups (§8.1). -/
def IsResiduallyFree (G : Type u) [Group G] : Prop :=
  ∀ g : G, g ≠ 1 → ∃ (F : Type u) (_ : Group F), IsFreeGroup F ∧ ∃ φ : G →* F, φ g ≠ 1

/-- Fully residually free (freely discriminated) groups (§8.1). -/
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

/-- Limit groups: some marking is a limit of markings of free groups (§8.3). -/
def IsLimitGroup (G : Type*) [Group G] : Prop :=
  ∃ (n : ℕ) (f : FreeGroup (Fin n) →* G), Function.Surjective f ∧
    markedPoint f.ker ∈
      closure (Set.range fun ψ : FreeGroup (Fin n) →* FreeGroup (Fin 2) => markedPoint ψ.ker)

example : IsLimitGroup (Multiplicative (Fin 2 → ℤ)) := by
  sorry

example : ¬ IsLimitGroup (Multiplicative (ZMod 2)) := by
  sorry

example (w : FreeGroup (Fin 2)) : markedPoint (⊤ : Subgroup (FreeGroup (Fin 2))) w = true := by
  sorry

example (w : FreeGroup (Fin 2)) (hw : w ≠ 1) :
    markedPoint (⊥ : Subgroup (FreeGroup (Fin 2))) w = false := by
  sorry

/-- Limit groups are the finitely generated fully residually free groups (§8.4). -/
theorem isLimitGroup_iff (G : Type) [Group G] [Group.FG G] :
    IsLimitGroup G ↔ IsFullyResiduallyFree G := by
  sorry

/-- Fully residually free groups are commutative transitive (§8.2). -/
theorem IsFullyResiduallyFree.commute_trans {G : Type u} [Group G] (hG : IsFullyResiduallyFree G)
    {a b c : G} (hb : b ≠ 1) (hab : Commute a b) (hbc : Commute b c) : Commute a c := by
  sorry

/-- The extension of the centralizer of `u` by `ℤ` (§8.5), as an HNN extension along the
identity of the centralizer. -/
abbrev CentralizerExt (G : Type*) [Group G] (u : G) : Type _ :=
  HNNExtension G (Subgroup.centralizer {u}) (Subgroup.centralizer {u}) (MulEquiv.refl _)

example : Nonempty
    (CentralizerExt (Multiplicative ℤ) (Multiplicative.ofAdd 1) ≃*
      Multiplicative (Fin 2 → ℤ)) := by
  sorry

/-- Extensions of centralizers of non-proper-powers in fully residually free groups are fully
residually free (§8.6). -/
theorem isFullyResiduallyFree_centralizerExt {G : Type} [Group G] (hG : IsFullyResiduallyFree G)
    (u : G) (hu : u ≠ 1) (hu' : ¬ IsProperPower u) :
    IsFullyResiduallyFree (CentralizerExt G u) := by
  sorry

/-- Finitely generated fully residually free groups are finitely presented (§8.7). -/
theorem isFinitelyPresented_of_fullyResiduallyFree (G : Type) [Group G] [Group.FG G]
    (hG : IsFullyResiduallyFree G) : Group.IsFinitelyPresented G := by
  sorry

end layer8

/-! ## Layer 9: length functions and infinite-word representations -/

section layer9

/-- Lyndon length functions with values in an ordered abelian group `Λ` (§9.1). The Gromov
product is used doubled, `2 c(g, f) = l g + l f - l (g⁻¹ f)`, to stay inside `Λ`. -/
structure LyndonLength (G : Type*) [Group G] (Λ : Type*) [AddCommGroup Λ] [LinearOrder Λ]
    [IsOrderedAddMonoid Λ] where
  /-- The length. -/
  l : G → Λ
  l_nonneg : ∀ g, 0 ≤ l g
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

example (L : LyndonLength G Λ) (hG : Subsingleton G) : L.IsFree := by
  sorry

example (L : LyndonLength G Λ) (hz : ∀ g, L.l g = 0) : L.IsRegular := by
  sorry

example (L : LyndonLength G Λ) (hz : ∀ g, L.l g = 0) (hg : ∃ g : G, g ≠ 1) :
    ¬ L.IsFree := by
  sorry

end LyndonLength

/-- The word length of a free group is a free regular Lyndon length function (§9.1). -/
theorem exists_lyndonLength_norm (α : Type*) [DecidableEq α] :
    ∃ L : LyndonLength (FreeGroup α) ℤ, (∀ g, L.l g = (FreeGroup.norm g : ℤ)) ∧
      L.IsFree ∧ L.IsRegular := by
  sorry

/-- Finitely generated fully residually free groups have free `ℤⁿ`-valued length functions for
the lexicographic order (§9.5). -/
theorem exists_free_lyndonLength (G : Type) [Group G] [Group.FG G]
    (hG : IsFullyResiduallyFree G) :
    ∃ (n : ℕ) (L : LyndonLength G (Lex (Fin n → ℤ))), L.IsFree := by
  sorry

example : ∃ L : LyndonLength (Multiplicative ℤ) ℤ,
    (∀ g, L.l g = 0) ∧ ¬ L.IsFree := by
  sorry

end layer9

/-! ## Layer 10: effective structure and finite solution diagrams

The JSJ, represented-input and finite-diagram carriers are specified in README.md.
-/

/-! ## Layer 11: regular implicit-function theorems over free groups -/

section layer11

variable {G : Type*} [Group G]

/-- Compatibility of `T(X, Y) = 1` with `S(X) = 1` over `G` (§11.1). -/
def IsCompatible {X Y : Type*} (S : Set (GX G X)) (T : Set (GX G (X ⊕ Y))) : Prop :=
  ∀ v ∈ algSet (MonoidHom.id G) S, ∃ w : Y → G,
    ∀ t ∈ T, evalAt (MonoidHom.id G) (Sum.elim v w) t = 1

/-- `T` admits an `S`-lift: it has a solution in the coordinate group `G_{R(S)}` with `X`
interpreted as the generic point (§11.1). -/
def HasLift {X Y : Type*} (S : Set (GX G X)) (T : Set (GX G (X ⊕ Y))) : Prop :=
  ∃ w : Y → CoordGroup (MonoidHom.id G) S,
    ∀ t ∈ T, evalAt ((QuotientGroup.mk' _).comp Monoid.Coprod.inl)
      (Sum.elim (fun x => QuotientGroup.mk' _ (Monoid.Coprod.inr (FreeGroup.of x))) w) t = 1

/-- The genus-two surface equation `[x₁, y₁][x₂, y₂] = 1` over `F(a, b)`, a regular standard
quadratic equation. -/
def genusTwoEquation : GX (FreeGroup (Fin 2)) (Fin 4) :=
  Monoid.Coprod.inr (comm (FreeGroup.of (0 : Fin 4)) (FreeGroup.of 1) *
    comm (FreeGroup.of (2 : Fin 4)) (FreeGroup.of 3))

/-- The implicit function theorem for regular quadratic equations (§11.5), in the instance of the
genus-two equation: every compatible equation lifts to the generic point. -/
theorem hasLift_genusTwo {Y : Type*} [Finite Y]
    (T : Set (GX (FreeGroup (Fin 2)) (Fin 4 ⊕ Y))) (hfinite : T.Finite)
    (hT : IsCompatible {genusTwoEquation} T) : HasLift {genusTwoEquation} T := by
  sorry

example : IsCompatible (∅ : Set (GX (FreeGroup (Fin 2)) Unit))
    {Monoid.Coprod.inr (FreeGroup.of (Sum.inr ()) * (FreeGroup.of (Sum.inl ()))⁻¹)} := by
  sorry

example : HasLift (∅ : Set (GX (FreeGroup (Fin 2)) Unit))
    {Monoid.Coprod.inr (FreeGroup.of (Sum.inr ()) * (FreeGroup.of (Sum.inl ()))⁻¹)} := by
  sorry

example : ¬ IsCompatible (∅ : Set (GX (FreeGroup (Fin 2)) Unit))
    {Monoid.Coprod.inr (FreeGroup.of (Sum.inr ()) ^ 2 * (FreeGroup.of (Sum.inl ()))⁻¹)} := by
  sorry

example : genusTwoEquation ∈ radical (MonoidHom.id (FreeGroup (Fin 2)))
    {genusTwoEquation} := by
  sorry

example : ∃ v : Fin 4 → FreeGroup (Fin 2),
    evalAt (MonoidHom.id _) v genusTwoEquation = 1 ∧ v 0 ≠ 1 := by
  sorry

end layer11

/-
Further README targets: `GGroup` and `GHom` with injective coefficient embeddings; the
Primcodable encoding of `FreeGroup α`; Stallings folds, cores, `basisWords` and the Stallings
correspondence; encodings of first-order syntax and `Term.ofWord`; `GraphOfGroups`, its paths,
fundamental groups, Bass–Serre trees, `GTree`, the structure theorem,
induced splittings and Kurosh's theorem; QH vertices; generalised equations, elementary
transformations and Makanin's finiteness theorem; the existential, universal and positive
deciders; quadratic and strictly quadratic words, standard quadratic forms, atoms, degeneracy,
general position, `kappa` and quadratic regularity; `MarkedGroup` and its compactness;
`NTQ.System`, its level groups, nondegeneracy and regularity; infinite words, `F^{ℤ[t]}` and
graphs labelled by infinite words; Λ-metric spaces, Λ-trees and free actions on them; JSJ trees and their existence, the promised-input algorithms
for limit groups, effective Grushko and JSJ decompositions, Makanin–Razborov diagrams and
effective components, equations over represented limit groups; `HasCompleteLift`,
`IsGenericFamily`, `basicSeq` and its powers; the implicit function theorem for regular NTQ
systems and `liftSolve` on promised compatible inputs.
-/

end TauCetiRoadmap.FreeGroupsAndLimitGroups
