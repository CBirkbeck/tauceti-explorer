import Mathlib.FieldTheory.AbsoluteGaloisGroup
import Mathlib.FieldTheory.Minpoly.Field
import Mathlib.Analysis.Complex.Polynomial.Basic
import Mathlib.Analysis.SpecialFunctions.Pow.Real
import Mathlib.NumberTheory.Padics.PadicNumbers
import Mathlib.RepresentationTheory.Basic
import Mathlib.LinearAlgebra.PerfectPairing.Basic
import Mathlib.LinearAlgebra.Dimension.Finrank
import Mathlib.LinearAlgebra.Matrix.ToLin
import Mathlib.Algebra.Homology.DerivedCategory.Ext.Map
import Mathlib.Topology.Algebra.OpenSubgroup
import Mathlib.Topology.Algebra.ContinuousMonoidHom

/-!
# DeligneWeightsAndPurityPartII: representative target signatures

This file is not the roadmap and is not exhaustive. The roadmap document
(`research/blueprint/readmes/DeligneWeightsAndPurityPartII.md`) is definitive. The statements
below suggest Lean forms so that contributors and reviewers converge on names and signatures;
they record only what can be stated against Mathlib 082e2d3 and Tau Ceti f790474.

Design choices made explicit here:
* Weights are measured with **geometric** Frobenius elements, so that `H^i` of a smooth proper
  variety over a finite field has weight `i ≥ 0`.
* Weight–monodromy purity is stated relative to a *local monodromy datum*: inertia, an ℓ-adic tame
  character (up to a nonzero scalar), the coset of geometric Frobenius elements and the number `Q`.
  The standard datum of a local field, its restriction to a highly ramified closed subgroup and the
  tilting isomorphism `G_L ≅ G_{L♭}` are all instances; their constructions need the inertia and
  tame-character API of the Tau Ceti roadmap *Local fields and ramification* and perfectoid fields,
  which are not at the pins, so they are README targets.
* `IsWeilNumber` is the parent roadmap's notion (DeligneWeightsAndPurity, DWP.0) and the monodromy
  filtration is LefschetzPencilsAndVanishingCycles LPV.1's; both are restated in the same form so
  that this file elaborates on its own.
* Étale cohomology of varieties and adic spaces, tubular neighbourhoods, tilts and the comparison
  map have no carriers at the pins: the weight–monodromy conjecture for a variety, Huber's
  neighbourhood theorem, Lemma 9.9 and Theorem 9.6 are stated in the README only.
-/

namespace TauCetiRoadmap.DeligneWeightsAndPurityPartII

open Polynomial

/-! ## Imported notions, restated in the parent roadmaps' form -/

section Imported

variable {K : Type*} [Field K] [Algebra ℚ K]

/-- A Weil `q`-number of weight `n` (DeligneWeightsAndPurity, DWP.0): algebraic over `ℚ`, and every
complex root of its minimal polynomial has absolute value `q ^ (n / 2)`. The same definition as the
parent package. -/
def IsWeilNumber (q : ℝ) (n : ℤ) (α : K) : Prop :=
  1 < q ∧ IsAlgebraic ℚ α ∧ ∀ z ∈ (minpoly ℚ α).aroots ℂ, ‖z‖ = q ^ ((n : ℝ) / 2)

end Imported

section MonodromyFiltration

variable {E V : Type*} [Field E] [AddCommGroup V] [Module E V]

/-- The monodromy filtration of a nilpotent endomorphism, centred at `0` (LPV.1), by the explicit
formula `M_j = Σ_{a - b = j} ker N^(a+1) ∩ im N^b`. For nilpotent `N` it is the unique increasing
filtration with `N M_j ⊆ M_{j-2}` and `N^j : gr_j ≅ gr_{-j}`. -/
def monodromyFiltration (N : Module.End E V) (j : ℤ) : Submodule E V :=
  ⨆ (a : ℕ) (b : ℕ) (_ : (a : ℤ) - b = j), LinearMap.ker (N ^ (a + 1)) ⊓ LinearMap.range (N ^ b)

/-- With `N = 0` the filtration jumps once, in degree `0`. -/
theorem monodromyFiltration_zero_of_nonneg {j : ℤ} (hj : 0 ≤ j) :
    monodromyFiltration (0 : Module.End E V) j = ⊤ := by
  sorry

theorem monodromyFiltration_zero_of_neg {j : ℤ} (hj : j < 0) :
    monodromyFiltration (0 : Module.End E V) j = ⊥ := by
  sorry

/-- Rescaling `N` by a nonzero scalar does not change the filtration; this is why the choice of
`ℤ_ℓ(1) ≅ ℤ_ℓ` has no effect. -/
theorem monodromyFiltration_smul (N : Module.End E V) {c : E} (hc : c ≠ 0) (j : ℤ) :
    monodromyFiltration (c • N) j = monodromyFiltration N j := by
  sorry

theorem monodromyFiltration_mono (N : Module.End E V) {i j : ℤ} (hij : i ≤ j) :
    monodromyFiltration N i ≤ monodromyFiltration N j := by
  sorry

/-- `N` lowers the filtration by two. -/
theorem monodromyFiltration_map (N : Module.End E V) (j : ℤ) :
    (monodromyFiltration N j).map N ≤ monodromyFiltration N (j - 2) := by
  sorry

/-- An endomorphism `Φ` with `Φ N = c N Φ`, `c ≠ 0`, preserves the filtration; for a geometric
Frobenius `c = Q⁻¹`. -/
theorem monodromyFiltration_mapsTo (N Φ : Module.End E V) {c : E} (hc : c ≠ 0)
    (hΦ : Φ * N = c • (N * Φ)) (j : ℤ) :
    (monodromyFiltration N j).map Φ ≤ monodromyFiltration N j := by
  sorry

/-- `α` is an eigenvalue of the endomorphism induced by `Φ` on `gr_j = M_j / M_{j-1}`. Over an
algebraically closed field this is the eigenvalue notion of the README. -/
def IsGradedEigenvalue (N Φ : Module.End E V) (j : ℤ) (α : E) : Prop :=
  ∃ v ∈ monodromyFiltration N j, v ∉ monodromyFiltration N (j - 1) ∧
    Φ v - α • v ∈ monodromyFiltration N (j - 1)

end MonodromyFiltration

/-! ## Layer WM.0: weight–monodromy purity -/

section LinearAlgebra

variable {E V : Type*} [Field E] [CharZero E] [AddCommGroup V] [Module E V]

/-- Linear-algebra weight–monodromy purity: every eigenvalue of `Φ` on `gr_j` of the monodromy
filtration of `N` is a Weil `q`-number of weight `w + j`. -/
def IsWeightMonodromyPureEnd (q : ℝ) (w : ℤ) (N Φ : Module.End E V) : Prop :=
  ∀ (j : ℤ) (α : E), IsGradedEigenvalue N Φ j α → IsWeilNumber q (w + j) α

/-- The finite exponential `Σ_{k ≤ dim V} N^k / k!`; for nilpotent `N` it is `exp N` and agrees with
Mathlib's `IsNilpotent.exp`. -/
noncomputable def nilExp [FiniteDimensional E V] (N : Module.End E V) : Module.End E V :=
  ∑ k ∈ Finset.range (Module.finrank E V + 1), ((k.factorial : E)⁻¹) • N ^ k

/-- Purity is insensitive to rescaling the monodromy operator. -/
theorem isWeightMonodromyPureEnd_smul (q : ℝ) (w : ℤ) (N Φ : Module.End E V) {c : E}
    (hc : c ≠ 0) :
    IsWeightMonodromyPureEnd q w (c • N) Φ ↔ IsWeightMonodromyPureEnd q w N Φ := by
  sorry

/-- Purity of a direct sum is purity of both summands. -/
theorem isWeightMonodromyPureEnd_prod {W : Type*} [AddCommGroup W] [Module E W]
    (q : ℝ) (w : ℤ) (N₁ Φ₁ : Module.End E V) (N₂ Φ₂ : Module.End E W) :
    IsWeightMonodromyPureEnd q w (N₁.prodMap N₂) (Φ₁.prodMap Φ₂) ↔
      IsWeightMonodromyPureEnd q w N₁ Φ₁ ∧ IsWeightMonodromyPureEnd q w N₂ Φ₂ := by
  sorry

end LinearAlgebra

section Datum

variable (ℓ : ℕ) [Fact ℓ.Prime]

/-- A local monodromy datum on a profinite group `H` (README, WM.0): inertia `I`, a continuous
nonzero additive ℓ-adic tame character `t`, the coset `Fr` of geometric Frobenius elements, which
generates `H` topologically together with `I`, and an integer `Q ≥ 2` prime to `ℓ`, with the twist
relation `t(Φ σ Φ⁻¹) = Q⁻¹ t(σ)`. The README also requires `H / I ≅ ℤ̂`, which only the restriction
construction uses. Compactness is retained here: it forces a nonzero tame character to
remain nonzero on every open subgroup of inertia, which is essential for uniqueness of `N`. -/
structure LocalMonodromyDatum (H : Type*) [Group H] [TopologicalSpace H] [IsTopologicalGroup H]
    [CompactSpace H] [T2Space H] [TotallyDisconnectedSpace H] where
  /-- The inertia subgroup. -/
  inertia : Subgroup H
  inertia_normal : inertia.Normal
  isClosed_inertia : IsClosed (inertia : Set H)
  /-- The tame ℓ-adic character, written additively. -/
  tame : inertia → ℚ_[ℓ]
  tame_mul : ∀ σ τ : inertia, tame (σ * τ) = tame σ + tame τ
  continuous_tame : Continuous tame
  exists_tame_ne_zero : ∃ σ : inertia, tame σ ≠ 0
  /-- The geometric Frobenius elements. -/
  frob : Set H
  frob_coset : ∃ Φ : H, frob = {x | Φ⁻¹ * x ∈ inertia}
  frob_generates : ∀ Φ ∈ frob, (Subgroup.zpowers Φ ⊔ inertia).topologicalClosure = ⊤
  /-- The cardinality measuring weights. -/
  Q : ℕ
  two_le_Q : 2 ≤ Q
  coprime_Q : Nat.Coprime Q ℓ
  tame_conj : ∀ Φ ∈ frob, ∀ σ : inertia,
    tame ⟨Φ * σ * Φ⁻¹, inertia_normal.conj_mem _ σ.2 Φ⟩ = (Q : ℚ_[ℓ])⁻¹ * tame σ

variable {ℓ}
variable {H : Type*} [Group H] [TopologicalSpace H] [IsTopologicalGroup H]
  [CompactSpace H] [T2Space H] [TotallyDisconnectedSpace H]

/-- The identity is never a Frobenius element. -/
theorem LocalMonodromyDatum.one_not_mem_frob (D : LocalMonodromyDatum ℓ H) : (1 : H) ∉ D.frob := by
  sorry

/-- Frobenius elements form a single coset of inertia. -/
theorem LocalMonodromyDatum.inv_mul_mem_inertia (D : LocalMonodromyDatum ℓ H) {Φ Φ' : H}
    (hΦ : Φ ∈ D.frob) (hΦ' : Φ' ∈ D.frob) : Φ⁻¹ * Φ' ∈ D.inertia := by
  sorry

/-- An isomorphism of local monodromy data along a topological group isomorphism `α`, rescaling the
tame character by `c ≠ 0`. -/
structure LocalMonodromyDatum.IsIso {H' : Type*} [Group H'] [TopologicalSpace H']
    [IsTopologicalGroup H'] [CompactSpace H'] [T2Space H'] [TotallyDisconnectedSpace H'] (D : LocalMonodromyDatum ℓ H) (D' : LocalMonodromyDatum ℓ H')
    (α : H ≃ₜ* H') (c : ℚ_[ℓ]) : Prop where
  ne_zero : c ≠ 0
  map_inertia : D.inertia.map α.toMulEquiv.toMonoidHom = D'.inertia
  tame_map : ∀ (σ : D.inertia) (h : α.toMulEquiv σ ∈ D'.inertia),
    D'.tame ⟨α.toMulEquiv σ, h⟩ = c * D.tame σ
  map_frob : α.toMulEquiv '' D.frob = D'.frob
  Q_eq : D.Q = D'.Q

theorem LocalMonodromyDatum.IsIso.refl (D : LocalMonodromyDatum ℓ H) :
    D.IsIso D (ContinuousMulEquiv.refl H) 1 := by
  sorry

theorem LocalMonodromyDatum.IsIso.symm {H' : Type*} [Group H'] [TopologicalSpace H']
    [IsTopologicalGroup H'] [CompactSpace H'] [T2Space H'] [TotallyDisconnectedSpace H'] {D : LocalMonodromyDatum ℓ H} {D' : LocalMonodromyDatum ℓ H'}
    {α : H ≃ₜ* H'} {c : ℚ_[ℓ]} (hα : D.IsIso D' α c) : D'.IsIso D α.symm c⁻¹ := by
  sorry

theorem LocalMonodromyDatum.IsIso.trans {H' H'' : Type*} [Group H'] [TopologicalSpace H']
    [IsTopologicalGroup H'] [CompactSpace H'] [T2Space H'] [TotallyDisconnectedSpace H'] [Group H''] [TopologicalSpace H''] [IsTopologicalGroup H'']
    [CompactSpace H''] [T2Space H''] [TotallyDisconnectedSpace H'']
    {D : LocalMonodromyDatum ℓ H} {D' : LocalMonodromyDatum ℓ H'} {D'' : LocalMonodromyDatum ℓ H''}
    {α : H ≃ₜ* H'} {α' : H' ≃ₜ* H''} {c c' : ℚ_[ℓ]} (hα : D.IsIso D' α c)
    (hα' : D'.IsIso D'' α' c') : D.IsIso D'' (α.trans α') (c' * c) := by
  sorry

variable {E V : Type*} [Field E] [IsAlgClosed E] [CharZero E] [Algebra ℚ_[ℓ] E]
  [AddCommGroup V] [Module E V] [FiniteDimensional E V]

/-- Weight–monodromy purity of weight `w` relative to a local monodromy datum (README, WM.0): on an
open subgroup of inertia, `ρ σ = exp (t σ • N)` for a nilpotent `N`, and every geometric Frobenius
is weight–monodromy pure of weight `w` for `N`. For the standard datum of a local field this is the
parent roadmap's weight–monodromy predicate (DWP.5). Continuity of `ρ` is part of the README's
setting and is not needed to state the predicate. -/
def IsWeightMonodromyPure (D : LocalMonodromyDatum ℓ H) (ρ : Representation E H V) (w : ℤ) :
    Prop :=
  ∃ (N : Module.End E V) (U : OpenSubgroup H), IsNilpotent N ∧
    (∀ σ : D.inertia, (σ : H) ∈ U → ρ σ = nilExp (algebraMap ℚ_[ℓ] E (D.tame σ) • N)) ∧
    ∀ Φ ∈ D.frob, IsWeightMonodromyPureEnd (D.Q : ℝ) w N (ρ Φ)

/-- The monodromy operator is unique. -/
theorem IsWeightMonodromyPure.monodromy_unique (D : LocalMonodromyDatum ℓ H)
    (ρ : Representation E H V) {N N' : Module.End E V} {U U' : OpenSubgroup H}
    (hN : IsNilpotent N) (hN' : IsNilpotent N')
    (h : ∀ σ : D.inertia, (σ : H) ∈ U → ρ σ = nilExp (algebraMap ℚ_[ℓ] E (D.tame σ) • N))
    (h' : ∀ σ : D.inertia, (σ : H) ∈ U' → ρ σ = nilExp (algebraMap ℚ_[ℓ] E (D.tame σ) • N')) :
    N = N' := by
  sorry

/-- A Frobenius element conjugates the monodromy operator to `Q⁻¹ N`. -/
theorem IsWeightMonodromyPure.frob_conj_monodromy (D : LocalMonodromyDatum ℓ H)
    (ρ : Representation E H V) {N : Module.End E V} {U : OpenSubgroup H} (hN : IsNilpotent N)
    (h : ∀ σ : D.inertia, (σ : H) ∈ U → ρ σ = nilExp (algebraMap ℚ_[ℓ] E (D.tame σ) • N))
    {Φ : H} (hΦ : Φ ∈ D.frob) :
    ρ Φ * N = ((D.Q : E)⁻¹) • (N * ρ Φ) := by
  sorry

/-- Purity is transported along isomorphisms of data (WM.0/transport-along-isomorphisms). -/
theorem IsWeightMonodromyPure.iso_iff {H' : Type*} [Group H'] [TopologicalSpace H']
    [IsTopologicalGroup H'] [CompactSpace H'] [T2Space H'] [TotallyDisconnectedSpace H'] {D : LocalMonodromyDatum ℓ H} {D' : LocalMonodromyDatum ℓ H'}
    {α : H ≃ₜ* H'} {c : ℚ_[ℓ]} (hα : D.IsIso D' α c) (ρ' : Representation E H' V) (w : ℤ) :
    IsWeightMonodromyPure D (ρ'.comp α.toMulEquiv.toMonoidHom) w ↔ IsWeightMonodromyPure D' ρ' w := by
  sorry

/-- Purity of a direct sum is purity of both summands (WM.0/direct-summands). -/
theorem isWeightMonodromyPure_prod {W : Type*} [AddCommGroup W] [Module E W]
    [FiniteDimensional E W] (D : LocalMonodromyDatum ℓ H) (ρ₁ : Representation E H V)
    (ρ₂ : Representation E H W) (w : ℤ) :
    IsWeightMonodromyPure D (ρ₁.prod ρ₂) w ↔
      IsWeightMonodromyPure D ρ₁ w ∧ IsWeightMonodromyPure D ρ₂ w := by
  sorry

/-- Detection on a closed subgroup (WM.0/detection-on-subgroups), in the form used for restricted
data: `D'` is a datum on a compact (hence closed) subgroup `H'` whose inertia is the intersection with that of `D`, whose
tame character is the restriction, whose Frobenius elements lie in the `f`-th Frobenius coset, and
whose `Q` is `Q ^ f`; the hypothesis `htame` is the openness of the tame image. The README states
the theorem for the standard datum, where condition (a) holds for every representation by
Grothendieck's monodromy theorem; that hypothesis is `hgr`. -/
theorem isWeightMonodromyPure_iff_restrict (D : LocalMonodromyDatum ℓ H) (H' : Subgroup H) [CompactSpace H']
    (D' : LocalMonodromyDatum ℓ H') (f : ℕ) (hf : 0 < f)
    (hI : ∀ σ : H', σ ∈ D'.inertia ↔ (σ : H) ∈ D.inertia)
    (htameEq : ∀ (σ : D'.inertia) (h : ((σ : H') : H) ∈ D.inertia),
      D'.tame σ = D.tame ⟨(σ : H'), h⟩)
    (htame : ∃ σ : D'.inertia, D'.tame σ ≠ 0)
    (hfrob : ∀ Φ' ∈ D'.frob, ∀ Φ ∈ D.frob, (Φ ^ f)⁻¹ * (Φ' : H) ∈ D.inertia)
    (hQ : D'.Q = D.Q ^ f) (ρ : Representation E H V)
    (hgr : ∃ (N : Module.End E V) (U : OpenSubgroup H), IsNilpotent N ∧
      ∀ σ : D.inertia, (σ : H) ∈ U → ρ σ = nilExp (algebraMap ℚ_[ℓ] E (D.tame σ) • N))
    (w : ℤ) :
    IsWeightMonodromyPure D ρ w ↔ IsWeightMonodromyPure D' (ρ.comp H'.subtype) w := by
  sorry

end Datum

/-! ## Layer WM.3: cup products under pullback (Lemma 9.8) -/

section CupProduct

open CategoryTheory Abelian

universe w w'

variable {C D : Type*} [Category C] [Abelian C] [Category D] [Abelian D]
  [HasExt.{w} C] [HasExt.{w'} D]

/-- Lemma 9.8 in its homological form: the cup product on `H^*(T, A) = Ext^*(A, A)` is Yoneda
composition, and an exact functor (such as the inverse image along a morphism of sites, with
`f* A ≅ A`) preserves it. This is Mathlib's `Ext.mapExactFunctor_comp`. -/
theorem cup_mapExactFunctor (F : C ⥤ D) [F.Additive] [Limits.PreservesFiniteLimits F]
    [Limits.PreservesFiniteColimits F] {X : C} {a b c : ℕ} (α : Ext X X a) (β : Ext X X b)
    (h : a + b = c) :
    (α.comp β h).mapExactFunctor F = (α.mapExactFunctor F).comp (β.mapExactFunctor F) h :=
  Ext.mapExactFunctor_comp F α β h

end CupProduct

/-! ## Layer WM.4: the duality splitting -/

section DualitySplitting

variable {E A A' B B' : Type*} [Field E]
  [AddCommGroup A] [Module E A] [AddCommGroup A'] [Module E A']
  [AddCommGroup B] [Module E B] [AddCommGroup B'] [Module E B']
  [FiniteDimensional E A] [FiniteDimensional E A'] [FiniteDimensional E B] [FiniteDimensional E B']

/-- The linear algebra behind "Poincaré duality implies that `H^i(Y)` is a direct summand of
`H^i(Z′)`" (WM.4/duality-splitting). The pairings `A × A' → E` and `B × B' → E` are the cup-product
pairings into the trivialised top degrees `A^{2d}`, `B^{2d}`; `f`, `f'` are the comparison map in
degrees `i` and `2d - i`, and `c ≠ 0` expresses that the comparison map is an isomorphism in degree
`2d`. Then `f` is injective and its image is complementary to the annihilator of the image of
`f'`. -/
theorem duality_splitting (pA : A →ₗ[E] A' →ₗ[E] E) (pB : B →ₗ[E] B' →ₗ[E] E)
    [pA.IsPerfPair] [pB.IsPerfPair] (f : A →ₗ[E] B) (f' : A' →ₗ[E] B') {c : E} (hc : c ≠ 0)
    (hf : ∀ a a', pB (f a) (f' a') = c * pA a a') :
    Function.Injective f ∧ IsCompl (LinearMap.range f) (LinearMap.ker (pB.compl₂ f')) := by
  sorry

/-- The complement is stable under a group acting compatibly on all four spaces, the pairing on `B`
being equivariant up to a character `χ`. -/
theorem duality_splitting_stable {G : Type*} [Group G] (pB : B →ₗ[E] B' →ₗ[E] E)
    (f' : A' →ₗ[E] B') (ρA' : Representation E G A') (ρB : Representation E G B)
    (ρB' : Representation E G B') (χ : G →* Eˣ)
    (hpB : ∀ g b b', pB (ρB g b) (ρB' g b') = (χ g : E) * pB b b')
    (hf' : ∀ g a', f' (ρA' g a') = ρB' g (f' a')) (g : G) {b : B}
    (hb : b ∈ LinearMap.ker (pB.compl₂ f')) : ρB g b ∈ LinearMap.ker (pB.compl₂ f') := by
  sorry

end DualitySplitting

/-! ## Unit tests -/

section Examples

variable {E : Type*} [Field E] [CharZero E]

/-- The Tate-curve monodromy on `E²`: `N e₁ = e₀`, `N e₀ = 0`. -/
noncomputable abbrev tateN : Module.End E (Fin 2 → E) := Matrix.toLin' !![0, 1; 0, 0]

/-- Geometric Frobenius on the dual Tate module of a Tate curve: eigenvalue `1` on `e₀` and `q` on
`e₁`. -/
noncomputable abbrev tateΦ (q : E) : Module.End E (Fin 2 → E) := Matrix.toLin' !![1, 0; 0, q]

/-- Test `isWeightMonodromyPure_tate_curve`: pure of weight `1` (gr_{-1} has weight `0`, gr_1 has
weight `2`). -/
example (q : ℕ) (hq : 2 ≤ q) :
    IsWeightMonodromyPureEnd (q : ℝ) 1 (tateN (E := E)) (tateΦ (q : E)) := by
  sorry

/-- Test `not_isWeightMonodromyPure_semisimplification`: with `N = 0` the same Frobenius is pure of
no weight. -/
example (q : ℕ) (hq : 2 ≤ q) (w : ℤ) :
    ¬ IsWeightMonodromyPureEnd (q : ℝ) w (0 : Module.End E (Fin 2 → E)) (tateΦ (q : E)) := by
  sorry

/-- Test `isWeightMonodromyPure_zero`: the zero space is pure of every weight. -/
example (q : ℝ) (w : ℤ) (N Φ : Module.End E (Fin 0 → E)) : IsWeightMonodromyPureEnd q w N Φ := by
  sorry

/-- Test for the monodromy filtration of the two-step string: `M_{-1} = ker N`. -/
example : monodromyFiltration (tateN (E := E)) (-1) = LinearMap.ker (tateN (E := E)) := by
  sorry

end Examples

/-
Stated in the README and absent here because their carriers are not at the pins: the standard and
restricted local monodromy data of a local field (WM.0/standard-local-datum,
WM.0/restricted-local-datum); `WeightMonodromyConjecture` for a proper smooth variety and its
finite-extension and good-reduction cases; Deligne's equal-characteristic theorem (WM.1); the Kummer
tower, its tilt and the matching of monodromy data (WM.2); tubular neighbourhoods, Huber's
neighbourhood theorem and its Galois-stable form (WM.3); the tilted approximation, the comparison map,
Lemma 9.9 and Theorem 9.6 (WM.4).
-/

end TauCetiRoadmap.DeligneWeightsAndPurityPartII
