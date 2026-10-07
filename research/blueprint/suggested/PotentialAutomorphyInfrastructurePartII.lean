/-
# Suggested Lean forms: Reusable infrastructure for potential automorphy over CM fields, Part II
## (polarized automorphy lifting and finiteness of deformation rings), layers PL.0–PL.9

**Standard note.** This file is not the roadmap and it is not exhaustive. The roadmap document
`research/blueprint/readmes/PotentialAutomorphyInfrastructurePartII.md` is definitive. The
statements below suggest Lean forms so that contributors and reviewers converge on names and
signatures. Every proof is `sorry`, and so is every piece of data whose construction is a roadmap
target; nothing here claims to be formalised.

Pinned baseline: Mathlib `082e2d3`, Tau Ceti `f790474`. The file imports Mathlib only: the
Tau Ceti modules at the pin contain none of the objects prototyped here.

**Independent review (Codex, REV-DESIGN-PotentialAutomorphyInfrastructurePartII).**
This is a partial prototype. Retained generic carrier statements do not yet give the arithmetic
definitions, API and tests in the packet. The packet review is `needs_changes`, and its coverage
lists what must be supplied. The reader has not been revised in this review's allowed scope;
the corrected packet and review record the discrepancies that its next revision must reconcile.

The former final theorem namespace omitted essential arithmetic hypotheses and thereby stated
false universal assertions. It has been removed. Automorphy, polarized Schur representations,
closed determinant subrings, reducibility ideals and rigidity also need actual supplier carriers;
their former substitute sections have been removed. They are inventoried below, not replaced
by conditions stored in Prop-valued fields or by `def _ : Prop := sorry`.

The retained definitions are generic models only. In particular a group with an arbitrary Artin
map does not provide local class field theory or labelled Hodge types, and a pair of complementary
subspaces does not supply the Frobenius eigenspace in a Taylor–Wiles datum. Examples with arithmetic
names may only test their generic carrier model. The inventory lists the exact required packet
names; comments in that inventory are not elaborated declarations. Protocol §13 correspondence
remains open. `sorry` marks unproved data and propositions, not an implementation.

Originally written by Claude (session claude-Zy0b6p), issue #3344; independently reviewed and
corrected by Codex (session codex-ODvJVt), issue #3592. Compilation of this partial draft is recorded
in the review and handoff; it does not establish the source theorems.
-/
import Mathlib.LinearAlgebra.Matrix.GeneralLinearGroup.Defs
import Mathlib.LinearAlgebra.Matrix.ToLin
import Mathlib.LinearAlgebra.Dimension.Finrank
import Mathlib.LinearAlgebra.Dimension.Constructions
import Mathlib.RingTheory.Ideal.MinimalPrime.Basic
import Mathlib.RingTheory.KrullDimension.Basic
import Mathlib.RingTheory.LocalRing.ResidueField.Defs
import Mathlib.RingTheory.Adjoin.Basic
import Mathlib.RingTheory.Nilpotent.Defs
import Mathlib.RingTheory.Finiteness.Defs
import Mathlib.RingTheory.Ideal.Quotient.Defs
import Mathlib.RingTheory.Ideal.Operations
import Mathlib.Algebra.DirectSum.Module
import Mathlib.GroupTheory.OrderOfElement
import Mathlib.GroupTheory.Index
import Mathlib.Algebra.Module.Submodule.Map
import Mathlib.RepresentationTheory.Basic
import Mathlib.Data.Fintype.Card
import Mathlib.FieldTheory.IsAlgClosed.AlgebraicClosure
import Mathlib.FieldTheory.Perfect
import Mathlib.LinearAlgebra.Matrix.PosDef
import Mathlib.LinearAlgebra.Matrix.Notation
import Mathlib.GroupTheory.DoubleCoset
import Mathlib.RepresentationTheory.Invariants
import Mathlib.LinearAlgebra.FreeModule.Basic
import Mathlib.Algebra.MonoidAlgebra.Defs
import Mathlib.Topology.Algebra.Group.Basic
import Mathlib.Topology.Instances.Matrix
import Mathlib.Topology.Algebra.Constructions
import Mathlib.Analysis.Complex.Basic
import Mathlib.RingTheory.Localization.AtPrime.Basic
import Mathlib.RingTheory.Artinian.Ring
import Mathlib.Algebra.CharP.Defs
import Mathlib.Data.ZMod.Basic
import Mathlib.Algebra.Field.ZMod
import Mathlib.LinearAlgebra.Matrix.Charpoly.Basic
import Mathlib.LinearAlgebra.Matrix.Block
import Mathlib.LinearAlgebra.BilinearForm.Properties
import Mathlib.RingTheory.MvPolynomial.Basic
import Mathlib.RingTheory.Localization.FractionRing
import Mathlib.RingTheory.TensorProduct.Basic
import Mathlib.RingTheory.Ideal.Cotangent
import Mathlib.RingTheory.DiscreteValuationRing.Basic
import Mathlib.RingTheory.AdicCompletion.Basic
import Mathlib.Data.ZMod.Defs

open Matrix

noncomputable section

namespace TauCeti.Automorphy

/-! ## PL.0 Ordinary representations, ι-ordinarity and automorphy -/

section Ordinary

variable {GK U E : Type*} [Group GK] [CommGroup U] [Field E] {n : ℕ}

/-- An invariant full flag of `ρ : GK → GL_n(E)` with its graded characters: `fil i` has
dimension `i`, is stable under `GK`, and `GK` acts on `fil (i+1) / fil i` through `char i`.
(`fil 1` is the invariant line, carrying `ψ_{v,1}` in Thorne 2015, Definition 2.5.) -/
structure InvariantFlag (ρ : GK →* GL (Fin n) E) where
  fil : Fin (n + 1) → Submodule E (Fin n → E)
  fil_mono : Monotone fil
  fil_zero : fil 0 = ⊥
  fil_last : fil (Fin.last n) = ⊤
  finrank_fil : ∀ i, Module.finrank E (fil i) = i
  stable : ∀ g i, ∀ v ∈ fil i, (ρ g : Matrix (Fin n) (Fin n) E) *ᵥ v ∈ fil i
  char : Fin n → GK →* Eˣ
  graded : ∀ g (i : Fin n), ∀ v ∈ fil i.succ,
    (ρ g : Matrix (Fin n) (Fin n) E) *ᵥ v - ((char i g : Eˣ) : E) • v ∈ fil i.castSucc

/-- **`PL.0/ordinary-of-weight`, local form.** `GK` stands for `G_{F_v}`, `U` for `O_{F_v}^×`,
`art` for `Art_{F_v}` on `O_{F_v}^×` (geometric normalisation) and `alg i` for the algebraic
character `x ↦ ∏_τ τ(x)^{λ_{τ,n−i+1}+i−1}`. `ρ` is ordinary of weight `λ` if it has an invariant
full flag whose graded characters `ψ_i` make `ψ_i ∘ art · alg i` of finite order. -/
def IsOrdinaryOfWeightAt (art : U →* GK) (alg : Fin n → U →* Eˣ)
    (ρ : GK →* GL (Fin n) E) : Prop :=
  ∃ F : InvariantFlag ρ, ∀ i, ∃ m : ℕ, 0 < m ∧ ∀ u, (F.char i (art u) * alg i u) ^ m = 1

/-- **`PL.0/ordinary-of-weight`.** The global notion: `G` stands for `G_F`, `Pl` for the places
above `l`, `dec v : GK v →* G` for the decomposition maps. `ρ` is ordinary of weight `λ` if its
restriction to every decomposition group is. -/
def IsOrdinaryOfWeight {Pl G : Type*} [Group G] {GKv : Pl → Type*} [∀ v, Group (GKv v)]
    {Uv : Pl → Type*} [∀ v, CommGroup (Uv v)] (dec : ∀ v, GKv v →* G)
    (art : ∀ v, Uv v →* GKv v) (alg : ∀ v, Fin n → Uv v →* Eˣ) (ρ : G →* GL (Fin n) E) : Prop :=
  ∀ v, IsOrdinaryOfWeightAt (art v) (alg v) (ρ.comp (dec v))

/-- BLGGT14 §1.4 ordinary: a full flag whose graded characters agree with the algebraic
characters `b i` (exponents `b_{τ,i}`) up to finite order, indexed along the *decreasing* flag. -/
def IsOrdinaryBLGGT (art : U →* GK) (b : Fin n → U →* Eˣ) (ρ : GK →* GL (Fin n) E) : Prop :=
  ∃ F : InvariantFlag ρ, ∀ i, ∃ m : ℕ, 0 < m ∧ ∀ u, (F.char i.rev (art u)) ^ m = (b i u) ^ m

/-- API: an ordinary `ρ` yields a flag with the finite-order condition. -/
theorem IsOrdinaryOfWeight.exists_flag {art : U →* GK} {alg : Fin n → U →* Eˣ}
    {ρ : GK →* GL (Fin n) E} (h : IsOrdinaryOfWeightAt art alg ρ) :
    ∃ F : InvariantFlag ρ, ∀ i, ∃ m : ℕ, 0 < m ∧ ∀ u, (F.char i (art u) * alg i u) ^ m = 1 :=
  h

/-- API (compatibility with BLGGT14 §1.4): the two conventions agree with
`b_{τ,i} = −(λ_{τ,i} + n − i)`, i.e. `b i = (alg i.rev)⁻¹`. -/
theorem isOrdinaryOfWeight_iff_local (art : U →* GK) (alg : Fin n → U →* Eˣ)
    (ρ : GK →* GL (Fin n) E) :
    IsOrdinaryOfWeightAt art alg ρ ↔ IsOrdinaryBLGGT art (fun i => (alg i.rev)⁻¹) ρ := by
  sorry

/-- API: restriction to a finite extension, with `N` the norm `O_{F′_w}^× → O_{F_v}^×`. -/
theorem IsOrdinaryOfWeight.restrict {GK' U' : Type*} [Group GK'] [CommGroup U']
    {art : U →* GK} {alg : Fin n → U →* Eˣ} {ρ : GK →* GL (Fin n) E}
    (ι : GK' →* GK) (art' : U' →* GK') (N : U' →* U) (hart : ∀ u, ι (art' u) = art (N u))
    (h : IsOrdinaryOfWeightAt art alg ρ) :
    IsOrdinaryOfWeightAt art' (fun i => (alg i).comp N) (ρ.comp ι) := by
  sorry

/-- The twist `ρ ⊗ ψ` by a character. -/
def twistRep (ρ : GK →* GL (Fin n) E) (ψ : GK →* Eˣ) : GK →* GL (Fin n) E := sorry

/-- The contragredient `g ↦ ᵗρ(g)⁻¹`. -/
def dualRep (ρ : GK →* GL (Fin n) E) : GK →* GL (Fin n) E := sorry

/-- API: twisting by a character `ψ` with `ψ ∘ art · h` of finite order (`h` the algebraic
character of its Hodge–Tate weight) shifts the weight by `h`. -/
theorem IsOrdinaryOfWeight.twist {art : U →* GK} {alg : Fin n → U →* Eˣ}
    {ρ : GK →* GL (Fin n) E} (ψ : GK →* Eˣ) (hwt : U →* Eˣ)
    (hψ : ∃ m : ℕ, 0 < m ∧ ∀ u, (ψ (art u) * hwt u) ^ m = 1)
    (h : IsOrdinaryOfWeightAt art alg ρ) :
    IsOrdinaryOfWeightAt art (fun i => alg i * hwt) (twistRep ρ ψ) := by
  sorry

/-- API: the dual has weight `μ_{τ,i} = −λ_{τ,n+1−i} − (n − 1)`, i.e. algebraic characters
`(alg i.rev)⁻¹`. -/
theorem IsOrdinaryOfWeight.dual {art : U →* GK} {alg : Fin n → U →* Eˣ}
    {ρ : GK →* GL (Fin n) E} (h : IsOrdinaryOfWeightAt art alg ρ) :
    IsOrdinaryOfWeightAt art (fun i => (alg i.rev)⁻¹) (dualRep ρ) := by
  sorry

/- Supplier-dependent (PadicHodgeTheory R06.2: de Rham representations and labelled
Hodge–Tate weights are not at the pins):

theorem IsOrdinaryOfWeight.isDeRham (h : IsOrdinaryOfWeight dec art alg ρ) (v : Pl) :
    IsDeRham (ρ.comp (dec v)) ∧ ∀ τ, HT τ (ρ.comp (dec v)) = {λ τ i + n - i | i} := by sorry
-/

-- ordinary_cyclotomic
-- For n = 1, `GK = G_{ℚ_l}`, `ψ = ε_l` with `ε_l ∘ art = id` on `ℤ_l^×` is ordinary of weight
-- `(−1)`: in the carrier, a character with `ψ ∘ art = hwt⁻¹` is ordinary for `alg 0 = hwt`.
example (art : U →* GK) (hwt : U →* Eˣ) (ρ : GK →* GL (Fin 1) E) (ψ : GK →* Eˣ)
    (hρ : ∀ g, (ρ g : Matrix (Fin 1) (Fin 1) E) = Matrix.scalar (Fin 1) (ψ g : E))
    (hψ : ∀ u, ψ (art u) = (hwt u)⁻¹) :
    IsOrdinaryOfWeightAt art (fun _ => hwt) ρ := by
  sorry

-- ordinary_tate_curve
-- `V_l E ≅ (ε_l *; 0 1)` is ordinary of weight `(−1, −1)`: an upper triangular `ρ` with diagonal
-- characters `ψ₁, ψ₂` is ordinary for `alg i` with `ψ_i ∘ art · alg i = 1`.
example (art : U →* GK) (ρ : GK →* GL (Fin 2) E) (ψ : Fin 2 → GK →* Eˣ) (alg : Fin 2 → U →* Eˣ)
    (hupper : ∀ g, (ρ g : Matrix (Fin 2) (Fin 2) E) 1 0 = 0)
    (hdiag : ∀ g i, (ρ g : Matrix (Fin 2) (Fin 2) E) i i = (ψ i g : E))
    (halg : ∀ i u, ψ i (art u) * alg i u = 1) :
    IsOrdinaryOfWeightAt art alg ρ := by
  sorry

-- ordinary_rank_one
-- For n = 1 every character is ordinary of the weight given by its algebraic part.
example (art : U →* GK) (alg : Fin 1 → U →* Eˣ) (ρ : GK →* GL (Fin 1) E) (ψ : GK →* Eˣ)
    (hρ : ∀ g, (ρ g : Matrix (Fin 1) (Fin 1) E) = Matrix.scalar (Fin 1) (ψ g : E)) :
    IsOrdinaryOfWeightAt art alg ρ ↔
      ∃ m : ℕ, 0 < m ∧ ∀ u, (ψ (art u) * alg 0 u) ^ m = 1 := by
  sorry

-- not_ordinary_supersingular
-- An irreducible two-dimensional `ρ` (for instance `V_l E`, supersingular) has no invariant line,
-- hence no invariant full flag, hence is not ordinary of any weight.
example (art : U →* GK) (alg : Fin 2 → U →* Eˣ) (ρ : GK →* GL (Fin 2) E)
    (hirr : ∀ W : Submodule E (Fin 2 → E), (∀ g, ∀ v ∈ W, (ρ g : Matrix _ _ E) *ᵥ v ∈ W) →
      W = ⊥ ∨ W = ⊤) :
    ¬ IsOrdinaryOfWeightAt art alg ρ := by
  sorry

/- ordinary_weight_unique is pending the ordered labelled Hodge–Tate weight carrier.
The former abstract character assertion was false: swapping two diagonal characters
and their flags swaps alg without preserving its entries. -/

end Ordinary

section IotaOrdinary

variable {O M : Type*} [CommRing O] [AddCommGroup M] [Module O M]

/-- **`PL.0/iota-ordinary`, the ordinary part.** For the integral Iwahori invariants `M` of
`ι⁻¹π_v` (finite over the complete local `O`) and the product `Up` of the rescaled operators
`U^{(j)}_{λ,ϖ_v}`, the ordinary part is `⋂_k Up^k M`, the summand on which `Up` is invertible. -/
def ordinaryPart (Up : Module.End O M) : Submodule O M :=
  ⨅ k : ℕ, LinearMap.range (Up ^ k)

/-- **`PL.0/iota-ordinary`.** `Pl` stands for the places above `l` and `Mv v b, Upv v b` for the
integral Iwahori invariants of level `Iw(v^{b,b})` with the product of the rescaled
`U`-operators. `π` is ι-ordinary if at every `v` some level has a nonzero ordinary part. -/
def IsIotaOrdinary {Pl : Type*} (Mv : Pl → ℕ → Type*) [∀ v b, AddCommGroup (Mv v b)]
    [∀ v b, Module O (Mv v b)] (Upv : ∀ v b, Module.End O (Mv v b)) : Prop :=
  ∀ v, ∃ b : ℕ, 0 < b ∧ ordinaryPart (Upv v b) ≠ ⊥

/-- API: changing the uniformizer multiplies `Up` by an automorphism `d` of finite order commuting
with it (a diamond operator); the ordinary part is unchanged. -/
theorem ordinaryPart_indep_uniformizer (Up : Module.End O M) (d : M ≃ₗ[O] M)
    (hcomm : Up ∘ₗ d.toLinearMap = d.toLinearMap ∘ₗ Up)
    (hfin : ∃ m : ℕ, 0 < m ∧ d.toLinearMap ^ m = 1) :
    ordinaryPart (Up ∘ₗ d.toLinearMap) = ordinaryPart Up := by
  sorry

/- Supplier-dependent (smooth representations of `GL_n(F_v)` and normalised parabolic induction,
EndoscopicTransferAndUnitaryTraceComparison ET.6, are not at the pins):

theorem isIotaOrdinary_iff_principalSeries :
    IsIotaOrdinary π ↔ ∀ v, ∃ χ : Fin n → (F_v^× →* Q̄_l^×), IsSubquotient π_v (nInd (ι ∘ χ)) ∧
      ∀ i, val_l (χ i ϖ_v) = e_v⁻¹ * ∑ τ, (λ τ (n+1-i) - (n-1)/2 + i - 1) := by sorry
theorem IsIotaOrdinary.characters_unique : the tuple χ is determined by ι⁻¹π_v := by sorry
theorem IsIotaOrdinary.twist (ψ : algebraic Hecke character) :
    IsIotaOrdinary π ↔ IsIotaOrdinary (π ⊗ (ψ ∘ det)) := by sorry
-/

-- iotaOrdinary_rank_one
-- For n = 1, `Up` is invertible on the (rank-one) invariants, so the ordinary part is everything.
example (Up : M ≃ₗ[O] M) : ordinaryPart Up.toLinearMap = ⊤ := by
  sorry

-- iotaOrdinary_steinberg
-- Weight zero and Steinberg: `Up` acts on the Iwahori invariants of `St_n` by a unit
-- (a root of unity times `1`), so the ordinary part is nonzero.
example (Up : Module.End O M) (c : Oˣ) (hUp : Up = (c : O) • LinearMap.id) [Nontrivial M] :
    ordinaryPart Up ≠ ⊥ := by
  sorry

-- not_iotaOrdinary_supercuspidal
-- A supercuspidal `π_v` has no Iwahori invariants: the ordinary part of the zero module is `⊥`.
example (Up : Module.End O M) (h : ∀ x : M, x = 0) : ordinaryPart Up = ⊥ := by
  sorry

-- iotaOrdinary_twist_iff
-- Twisting rescales `Up` by a unit, which does not change the ordinary part.
example (Up : Module.End O M) (c : Oˣ) : ordinaryPart ((c : O) • Up) = ordinaryPart Up := by
  sorry

-- iotaOrdinary_galois_ordinary
-- (compatibility with PL.0/iota-ordinary-implies-ordinary; supplier-dependent: Galois side)
-- In the carrier: a nilpotent `Up` (no unit-root part) has zero ordinary part.
example (Up : Module.End O M) (hnil : IsNilpotent Up) : ordinaryPart Up = ⊥ := by
  sorry

end IotaOrdinary

/- Independent review: Automorphic signatures are pending the arithmetic suppliers.
See the complete required-name inventory below and the packet review gaps. -/

/-! ## PL.1 Connecting local lifts and potential diagonalizability -/

section Connects

variable {R B : Type*} [CommRing R] [CommRing B]

/-- **`PL.1/connects-relation`.** `R` stands for `R^□_{ρ̄} ⊗ Q̄_l` (for `l = p`, the potentially
crystalline quotient of the common Hodge type), and `x y : R →+* B` for the points of two lifts
with the same reduction. They connect if they lie on a common irreducible component, i.e. some
minimal prime of `R` is contained in both kernels. -/
def Connects (x y : R →+* B) : Prop :=
  ∃ P ∈ minimalPrimes R, P ≤ RingHom.ker x ∧ P ≤ RingHom.ker y

/-- Strong connection: `x` connects to `y` and lies on a unique irreducible component. -/
def StronglyConnects (x y : R →+* B) : Prop :=
  Connects x y ∧ ∀ P ∈ minimalPrimes R, ∀ Q ∈ minimalPrimes R,
    P ≤ RingHom.ker x → Q ≤ RingHom.ker x → P = Q

/-- API: `∼` is symmetric. -/
theorem Connects.symm {x y : R →+* B} (h : Connects x y) : Connects y x := by
  sorry

/-- API: invariance under an automorphism of the lifting ring (conjugation of the lift or a change
of the identification of reductions acts on `R` by automorphisms). -/
theorem Connects.of_conj (σ : R ≃+* R) {x y : R →+* B} (h : Connects x y) :
    Connects (x.comp σ.toRingHom) (y.comp σ.toRingHom) := by
  sorry

/-- API: restriction to a finite extension is a ring map `res : R' →+* R` between lifting rings
(`R'` for `G_{K′}`); connected points restrict to connected points when `res` maps components
into components (`hres`). -/
theorem Connects.restrict {R' : Type*} [CommRing R'] (res : R' →+* R)
    (hres : ∀ P ∈ minimalPrimes R, ∃ P' ∈ minimalPrimes R', P' ≤ P.comap res)
    {x y : R →+* B} (h : Connects x y) : Connects (x.comp res) (y.comp res) := by
  sorry

/-- API: direct sums (and likewise tensor products and duals) are induced by ring maps
`s : R₃ →+* R₁ ⊗ R₂` on lifting rings; connection is preserved. Stated for the map to a product
ring over which both pairs of points factor. -/
theorem Connects.sum {R₁ R₂ R₃ : Type*} [CommRing R₁] [CommRing R₂] [CommRing R₃]
    (s : R₃ →+* R₁) (t : R₃ →+* R₂) {x₁ y₁ : R₁ →+* B} {x₂ y₂ : R₂ →+* B}
    (h₁ : Connects x₁ y₁) (h₂ : Connects x₂ y₂)
    (hx : x₁.comp s = x₂.comp t) (hy : y₁.comp s = y₂.comp t) :
    Connects (x₁.comp s) (y₁.comp s) := by
  sorry

/-- **`componentDeformationProblem`**: for a finite set `C` of minimal primes, the ideal cutting
out the reduced quotient supported on `C` (`R_{O,ρ̄,C}` of BLGGT14 §§1.3–1.4 is `R ⧸` this ideal,
after removing `l`-torsion). -/
def componentDeformationProblem (C : Finset (Ideal R)) : Ideal R :=
  ⨅ P ∈ C, P

-- connects_unramified
-- Unramified lifts with the same reduction lie on the (irreducible) unramified component:
-- two points of a domain connect.
example [IsDomain R] (x y : R →+* B) : Connects x y := by
  sorry

-- connects_refl
-- Every point connects to itself (a minimal prime lies below every prime, in particular below
-- `ker x` when `B` is a domain).
example [IsDomain B] (x : R →+* B) : Connects x x := by
  sorry

-- not_connects_inertia
-- Points of two different connected components (here: of a product ring) do not connect.
example {R₁ R₂ : Type*} [CommRing R₁] [CommRing R₂] [Nontrivial R₁] [Nontrivial R₂] [IsDomain B]
    (x : R₁ →+* B) (y : R₂ →+* B) :
    ¬ Connects (x.comp (RingHom.fst R₁ R₂)) (y.comp (RingHom.snd R₁ R₂)) := by
  sorry

-- connects_crystalline_characters
-- (l = p) the crystalline ring of a character is formally smooth after inverting `l`, so its
-- spectrum is irreducible and any two points connect.
example (hirr : ∃! P, P ∈ minimalPrimes R) (x y : R →+* B) [IsDomain B] : Connects x y := by
  sorry

-- connects_wd_inertia
-- Strong connection implies connection.
example (x y : R →+* B) (h : StronglyConnects x y) : Connects x y := by
  sorry

/-- **`PL.1/potentially-diagonalizable`.** `diag` stands for the points of the potentially
crystalline ring that are sums of crystalline characters. `x` is diagonalizable if it connects to
one of them. -/
def IsDiagonalizable (diag : Set (R →+* B)) (x : R →+* B) : Prop :=
  ∃ y ∈ diag, Connects x y

/-- Potentially diagonalizable: for some finite extension (an index `K'` of the family `res` of
restriction maps between lifting rings), the restricted point is diagonalizable. -/
def IsPotentiallyDiagonalizable {ι : Type*} {Rs : ι → Type*} [∀ i, CommRing (Rs i)]
    (res : ∀ i, Rs i →+* R) (diag : ∀ i, Set (Rs i →+* B)) (x : R →+* B) : Prop :=
  ∃ i, IsDiagonalizable (diag i) (x.comp (res i))

/-- API: invariance under automorphisms of the lifting ring (Lemma 1.4.1). -/
theorem IsPotentiallyDiagonalizable.of_conj {ι : Type*} {Rs : ι → Type*} [∀ i, CommRing (Rs i)]
    (res : ∀ i, Rs i →+* R) (diag : ∀ i, Set (Rs i →+* B)) (σ : R ≃+* R)
    (hσ : ∀ i, ∃ σ' : Rs i ≃+* Rs i, σ.toRingHom.comp (res i) = (res i).comp σ'.toRingHom ∧
      ∀ y ∈ diag i, y.comp σ'.toRingHom ∈ diag i)
    {x : R →+* B} (h : IsPotentiallyDiagonalizable res diag x) :
    IsPotentiallyDiagonalizable res diag (x.comp σ.toRingHom) := by
  sorry

/-- API: restriction along a further finite extension. -/
theorem IsPotentiallyDiagonalizable.restrict {ι : Type*} {Rs : ι → Type*} [∀ i, CommRing (Rs i)]
    {R' : Type*} [CommRing R'] (res : ∀ i, Rs i →+* R) (diag : ∀ i, Set (Rs i →+* B))
    (r : R' →+* R) (res' : ∀ i, Rs i →+* R') (hres : ∀ i, r.comp (res' i) = res i)
    {x : R →+* B} (h : IsPotentiallyDiagonalizable res diag x) :
    IsPotentiallyDiagonalizable res' diag (x.comp r) := by
  sorry

/- Supplier-dependent (potentially crystalline representations, PadicHodgeTheory R06.2):
theorem IsPotentiallyDiagonalizable.isPotentiallyCrystalline (h : IsPotentiallyDiagonalizable ρ) :
    IsPotentiallyCrystalline ρ := by sorry -/

/- The global potentially-diagonalizably-automorphic predicate is pending an arithmetic
automorphic carrier; it is not replaced by an arbitrary Prop-valued field. -/

-- pd_character
-- A one-dimensional point is a sum of one character: it is diagonalizable when `diag` contains it.
example (diag : Set (R →+* B)) (x : R →+* B) (hx : x ∈ diag) [IsDomain B] :
    IsDiagonalizable diag x := by
  sorry

-- pd_unramified
-- If the lifting ring is irreducible (unramified lifts after a finite unramified extension) and
-- `diag` is nonempty, every point is diagonalizable.
example (diag : Set (R →+* B)) (hdiag : diag.Nonempty) (hirr : ∃! P, P ∈ minimalPrimes R)
    [IsDomain B] (x : R →+* B) : IsDiagonalizable diag x := by
  sorry

-- pd_fontaine_laffaille
-- (Lemma 1.4.3(2), supplier-dependent on the Galois side) in the carrier: diagonalizable implies
-- potentially diagonalizable for the trivial extension.
example {ι : Type*} {Rs : ι → Type*} [∀ i, CommRing (Rs i)] (res : ∀ i, Rs i →+* R)
    (diag : ∀ i, Set (Rs i →+* B)) (i : ι) (x : R →+* B)
    (h : IsDiagonalizable (diag i) (x.comp (res i))) :
    IsPotentiallyDiagonalizable res diag x := by
  sorry

-- not_pd_tate_curve
-- With no diagonal points at all (no potentially crystalline lift: the Tate curve), nothing is
-- potentially diagonalizable.
example {ι : Type*} {Rs : ι → Type*} [∀ i, CommRing (Rs i)] (res : ∀ i, Rs i →+* R)
    (diag : ∀ i, Set (Rs i →+* B)) (h : ∀ i, diag i = ∅) (x : R →+* B) :
    ¬ IsPotentiallyDiagonalizable res diag x := by
  sorry

-- pd_conj_iff
-- Conjugation invariance, both directions.
example (diag : Set (R →+* B)) (σ : R ≃+* R) (hσ : ∀ y ∈ diag, y.comp σ.toRingHom ∈ diag)
    (hσ' : ∀ y ∈ diag, y.comp σ.symm.toRingHom ∈ diag) (x : R →+* B) :
    IsDiagonalizable diag x ↔ IsDiagonalizable diag (x.comp σ.toRingHom) := by
  sorry

end Connects

end TauCeti.Automorphy

/-! ## Shared: irreducibility of matrix representations -/

namespace TauCeti.Automorphy

section Irreducible

variable {Γ k : Type*} [Group Γ] [Field k] {n : ℕ}

/-- A matrix representation `ρ : Γ → GL_n(k)` is irreducible if `kⁿ` has no nontrivial
`Γ`-stable subspace. -/
def IsIrreducibleRep (ρ : Γ →* GL (Fin n) k) : Prop :=
  ∀ W : Submodule k (Fin n → k), (∀ g, ∀ v ∈ W, (ρ g : Matrix (Fin n) (Fin n) k) *ᵥ v ∈ W) →
    W = ⊥ ∨ W = ⊤

/-- Absolute irreducibility: irreducibility after extending scalars to an algebraic closure. -/
def IsAbsIrred (ρ : Γ →* GL (Fin n) k) : Prop :=
  IsIrreducibleRep
    ((Matrix.GeneralLinearGroup.map (algebraMap k (AlgebraicClosure k))).comp ρ)

end Irreducible

end TauCeti.Automorphy

/-! ## PL.2 Definite unitary groups, algebraic modular forms and Hecke algebras -/

namespace TauCeti.DefiniteUnitary

open TauCeti.Automorphy

section Group

variable {L : Type*} [Field L] [StarRing L] {n : ℕ}

/-- **`PL.2/definite-unitary-group`.** The unitary group of the hermitian matrix `Φ` over the CM
field `L` (star = complex conjugation): `{g | gᴴ Φ g = Φ}`. For `Φ` with the local properties of
the roadmap (quasi-split at every finite place, definite at every infinite place, which needs
`4 ∣ n[L⁺ : ℚ]`) this is `G(L⁺)`. -/
def unitaryGroup (Φ : Matrix (Fin n) (Fin n) L) : Subgroup (GL (Fin n) L) where
  carrier := {g | (g : Matrix (Fin n) (Fin n) L)ᴴ * Φ * (g : Matrix (Fin n) (Fin n) L) = Φ}
  one_mem' := by sorry
  mul_mem' := by sorry
  inv_mem' := by sorry

variable (K : Type*) [Field K]

/-- At a split place `v = ww^c`, `L ⊗ L⁺_v ≅ L_w × L_{w^c}` with the involution swapping the
factors; the unitary group is the group of pairs `(g, h)` with `h = Φ⁻¹ ᵗg⁻¹ Φ`. -/
def splitUnitaryGroup (Φ : GL (Fin n) K) : Subgroup (GL (Fin n) K × GL (Fin n) K) where
  carrier := {p | (p.2 : Matrix (Fin n) (Fin n) K) =
    ((Φ⁻¹ : GL (Fin n) K) : Matrix (Fin n) (Fin n) K) *
      ((p.1⁻¹ : GL (Fin n) K) : Matrix (Fin n) (Fin n) K)ᵀ * (Φ : Matrix (Fin n) (Fin n) K)}
  one_mem' := by sorry
  mul_mem' := by sorry
  inv_mem' := by sorry

/-- API `iotaW`: the first projection `ι_w : G(L⁺_v) ≅ GL_n(L_w)`. -/
def iotaW (Φ : GL (Fin n) K) : splitUnitaryGroup K Φ ≃* GL (Fin n) K := sorry

/-- API: the two identifications differ by transpose-inverse twisted by `Φ`. -/
theorem iotaW_conj (Φ : GL (Fin n) K) (p : splitUnitaryGroup K Φ) :
    ((p : GL (Fin n) K × GL (Fin n) K).2 : Matrix (Fin n) (Fin n) K) =
      ((Φ⁻¹ : GL (Fin n) K) : Matrix (Fin n) (Fin n) K) *
        (((iotaW K Φ p)⁻¹ : GL (Fin n) K) : Matrix (Fin n) (Fin n) K)ᵀ *
          (Φ : Matrix (Fin n) (Fin n) K) := by
  sorry

open scoped ComplexOrder in
/-- API: at an infinite place the group is compact: for a positive definite hermitian `Φ` the
unitary group in `GL_n(ℂ)` is compact. -/
theorem isCompact_infty (Φ : Matrix (Fin n) (Fin n) ℂ) (hΦ : Φ.PosDef) :
    IsCompact ((unitaryGroup Φ : Subgroup (GL (Fin n) ℂ)) : Set (GL (Fin n) ℂ)) := by
  sorry

/- Supplier-dependent (local classification of hermitian forms over `L⁺_v`, AdelicAlgebraicGroups
AA.0): theorem quasiSplit (v : finite place of L⁺) : IsQuasiSplit (G ×_{L⁺} L⁺_v) := by sorry -/

/-- API: finiteness of `Γ\G/U` for `Γ ≤ G` with compact quotient and `U` open (for `G(L⁺)` in
`G(𝔸^∞_{L⁺})`, which is cocompact because `G(L⁺ ⊗ ℝ)` is compact). -/
theorem finite_doubleCoset {G : Type*} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    (Γ U : Subgroup G) (hU : IsOpen (U : Set G))
    (hcpt : CompactSpace (Quotient (QuotientGroup.rightRel Γ))) :
    Finite (DoubleCoset.Quotient (Γ : Set G) (U : Set G)) := by
  sorry

-- unitaryGroup_rank_one
-- For `n = 1` and `Φ = 1`, `G(L⁺) = {x ∈ L^× | x̄ x = 1}`.
example (g : GL (Fin 1) L) :
    g ∈ unitaryGroup (1 : Matrix (Fin 1) (Fin 1) L) ↔
      star ((g : Matrix (Fin 1) (Fin 1) L) 0 0) * (g : Matrix (Fin 1) (Fin 1) L) 0 0 = 1 := by
  sorry

-- unitaryGroup_compact_infty
-- `U_1(ℂ) = {z | z̄ z = 1}` is compact.
example : IsCompact ((unitaryGroup (1 : Matrix (Fin 1) (Fin 1) ℂ) : Subgroup (GL (Fin 1) ℂ)) :
    Set (GL (Fin 1) ℂ)) := by
  sorry

-- unitaryGroup_split_place
-- `ι_w` is compatible with Mathlib's `GL_n`: it sends the identity to the identity and is
-- multiplicative.
example (Φ : GL (Fin n) K) : iotaW K Φ 1 = 1 := by
  sorry

/- unitaryGroup_parity_obstruction (supplier-dependent: the global classification of hermitian
forms, AdelicAlgebraicGroups AA.0): for `n` even with `n[L⁺ : ℚ] ≡ 2 mod 4` there is no `Φ`
quasi-split at every finite place and definite at every infinite place (the discriminants at the
real places differ from the quasi-split ones by `(−1)^{n/2}`, violating the product formula). -/

end Group

section ModularForms

variable {G O M M' : Type*} [Group G] [CommRing O] [AddCommGroup M] [Module O M]
  [AddCommGroup M'] [Module O M']

/-- **`PL.2/unitary-algebraic-modular-forms`.** `G` stands for `G(𝔸^∞_{L⁺})`, `Γ` for `G(L⁺)`,
`U` for the level and `ρ` for the action of `U` on `M_{λ,{χ_v}} ⊗ A` through its components at
`S_l ∪ R`. `S(U, M)` is the module of `f : G → M`, left `Γ`-invariant, with `f(gu) = u⁻¹ f(g)`. -/
def AlgebraicModularForm (Γ U : Subgroup G) (ρ : Representation O U M) : Submodule O (G → M) where
  carrier := {f | (∀ γ ∈ Γ, ∀ g, f (γ * g) = f g) ∧ ∀ u : U, ∀ g, f (g * u) = ρ u⁻¹ (f g)}
  zero_mem' := by sorry
  add_mem' := by sorry
  smul_mem' := by sorry

variable {Γ U : Subgroup G}

/-- API: functoriality in the coefficients along a `U`-equivariant map. -/
def AlgebraicModularForm.map {ρ : Representation O U M} {ρ' : Representation O U M'}
    (φ : M →ₗ[O] M') (hφ : ∀ u, φ ∘ₗ ρ u = ρ' u ∘ₗ φ) :
    AlgebraicModularForm Γ U ρ →ₗ[O] AlgebraicModularForm Γ U ρ' := sorry

/-- API: restriction to a smaller level `V ≤ U`. -/
def AlgebraicModularForm.restrict {V : Subgroup G} (hVU : V ≤ U) (ρ : Representation O U M) :
    AlgebraicModularForm Γ U ρ →ₗ[O]
      AlgebraicModularForm Γ V (ρ.comp (Subgroup.inclusion hVU)) := sorry

/-- API: the trace `tr_{U/V} : S(V, M) → S(U, M)`, `f ↦ Σ_{u ∈ U/V} u·f`, for `V` of finite index
in `U`. -/
def AlgebraicModularForm.trace {V : Subgroup G} (hVU : V ≤ U) (ρ : Representation O U M)
    (hfin : (V.subgroupOf U).FiniteIndex) :
    AlgebraicModularForm Γ V (ρ.comp (Subgroup.inclusion hVU)) →ₗ[O]
      AlgebraicModularForm Γ U ρ := sorry

/-- The stabiliser `U ∩ t⁻¹Γt` of a double coset representative, as a subgroup of `U`. -/
def stabilizerAt (Γ U : Subgroup G) (t : G) : Subgroup U :=
  (Γ.comap (MulAut.conj t⁻¹).toMonoidHom).subgroupOf U

/-- API: the double-coset description `S(U, M) ≅ ⊕_j M^{Γ_j}` for a complete set of
representatives `t j` of `Γ\G/U` with stabilisers `Γ_j = U ∩ t_j⁻¹Γt_j`. -/
def AlgebraicModularForm.equiv_doubleCoset {h : ℕ} (ρ : Representation O U M) (t : Fin h → G)
    (ht : ∀ g, ∃! j, ∃ γ ∈ Γ, ∃ u ∈ U, g = γ * t j * u) :
    AlgebraicModularForm Γ U ρ ≃ₗ[O] ((j : Fin h) →
      Representation.invariants (ρ.comp (stabilizerAt Γ U (t j)).subtype)) := sorry

/- Supplier-dependent (automorphic forms on `G(𝔸_{L⁺})`, AutomorphicFormsOnReductiveGroups AF.5):
def AlgebraicModularForm.automorphicComparison :
    AlgebraicModularForm Γ U (M_λ ⊗ Q̄_l) ≃ₗ[ι] Hom_{G(L⁺_∞)}(ξ_{ιλ}^∨, 𝒜(G)^U) := sorry -/

-- amf_weight_zero_level
-- For trivial coefficients, algebraic modular forms are the functions on `Γ\G/U`.
example (f : G → O) :
    f ∈ AlgebraicModularForm Γ U (1 : Representation O U O) ↔
      (∀ γ ∈ Γ, ∀ g, f (γ * g) = f g) ∧ ∀ u ∈ U, ∀ g, f (g * u) = f g := by
  sorry

-- amf_zero_module
-- With zero coefficients, the module of forms is zero.
example (ρ : Representation O U PUnit) (f : AlgebraicModularForm Γ U ρ) : f = 0 := by
  sorry

-- amf_compatibility_AF5
-- Membership is the defining equivariance of AF.5's `S(J_f, M)`.
example (ρ : Representation O U M) (f : G → M) :
    f ∈ AlgebraicModularForm Γ U ρ ↔
      (∀ γ ∈ Γ, ∀ g, f (γ * g) = f g) ∧ ∀ u : U, ∀ g, f (g * u) = ρ u⁻¹ (f g) := by
  sorry

/- amf_not_free_without_smallness (supplier-dependent on the arithmetic of `G(L⁺)`): if some
stabiliser `U ∩ t⁻¹Γt` contains an element of order `l` acting nontrivially on `M ⊗ k`, the
functor `A ↦ S(U, M ⊗ A)` need not be exact. -/

end ModularForms

section Hecke

variable {G O M : Type*} [Group G] [CommRing O] [AddCommGroup M] [Module O M]
variable {Γ U : Subgroup G} {ρ : Representation O U M}

/-- **`PL.2/unitary-hecke-algebra`.** The double coset operator `[U g U]` on `S(U, M)` (for `g`
in the Hecke semigroup to which the coefficient action extends; at split `w ∉ T` with
`g = ι_w⁻¹ diag(ϖ_w 1_j, 1_{n−j})` it is `T_w^j`). -/
def heckeOperator (Γ U : Subgroup G) (ρ : Representation O U M) (g : G) :
    Module.End O (AlgebraicModularForm Γ U ρ) := sorry

/-- The Hecke algebra `T^T(U, O)` generated by the operators `[U g_w U]`, `w ∈ W` (the inverses
`(T_w^n)⁻¹` are adjoined in the same way). -/
def heckeAlgebra (Γ U : Subgroup G) (ρ : Representation O U M) {W : Type*} (g : W → G) :
    Subalgebra O (Module.End O (AlgebraicModularForm Γ U ρ)) :=
  Algebra.adjoin O (Set.range fun w => heckeOperator Γ U ρ (g w))

/-- API: if the generators commute (as the spherical operators at split places do) the Hecke
algebra is commutative. -/
theorem heckeAlgebra.isCommutative {W : Type*} (g : W → G)
    (hcomm : ∀ w w', Commute (heckeOperator Γ U ρ (g w)) (heckeOperator Γ U ρ (g w'))) :
    ∀ a ∈ heckeAlgebra Γ U ρ g, ∀ b ∈ heckeAlgebra Γ U ρ g, Commute a b := by
  sorry

/-- API: `T^T(U, O)` is finite over a noetherian `O` when the forms are finite over `O`. -/
theorem heckeAlgebra.finite [IsNoetherianRing O] {W : Type*} (g : W → G)
    [Module.Finite O (AlgebraicModularForm Γ U ρ)] :
    Module.Finite O (heckeAlgebra Γ U ρ g) := by
  sorry

/-- API `residualRep`: for a homomorphism `κ : T → k` to a finite field (through `T/m`), the
semisimple residual representation `r̄_m : G_L → GL_n(k)` with the stated Frobenius polynomials
(`GL` stands for `G_L`; data constructed in PL.2/hecke-valued-galois-representation). -/
def residualRep {W : Type*} (g : W → G) (GL' : Type*) [Group GL'] (k : Type*) [Field k]
    [Algebra O k] (n : ℕ) (κ : heckeAlgebra Γ U ρ g →ₐ[O] k) : GL' →* GL (Fin n) k := sorry

/-- `m` (given by `κ`) is non-Eisenstein if `r̄_m` is absolutely irreducible. -/
def IsNonEisenstein {GL' k : Type*} [Group GL'] [Field k] {n : ℕ} (rbar : GL' →* GL (Fin n) k) :
    Prop :=
  IsAbsIrred rbar

/-- API: restriction to a smaller level is Hecke-equivariant for the operators at places where
the levels agree. -/
theorem heckeAlgebra.map_restrict {V : Subgroup G} (hVU : V ≤ U) (g : G)
    (hg : ∀ u ∈ U, ∃ v ∈ V, g * u * g⁻¹ = g * v * g⁻¹) :
    (AlgebraicModularForm.restrict (Γ := Γ) hVU ρ) ∘ₗ heckeOperator Γ U ρ g =
      heckeOperator Γ V (ρ.comp (Subgroup.inclusion hVU)) g ∘ₗ
        AlgebraicModularForm.restrict hVU ρ := by
  sorry

-- heckeAlgebra_rank_one
-- With trivial coefficients, a Hecke operator by an element of `U` acts trivially.
example (u : G) (hu : u ∈ U) :
    heckeOperator Γ U (1 : Representation O U O) u = 1 := by
  sorry

-- heckeAlgebra_charpoly
-- (characterisation of `r̄_m` by Frobenius characteristic polynomials; the Galois side is
-- supplier-dependent) in the carrier: the generators lie in the Hecke algebra.
example {W : Type*} (g : W → G) (w : W) :
    heckeOperator Γ U ρ (g w) ∈ heckeAlgebra Γ U ρ g := by
  sorry

-- heckeAlgebra_zero
-- If `S(U, M) = 0` the Hecke algebra is zero.
example {W : Type*} (g : W → G) (hS : ∀ f : AlgebraicModularForm Γ U ρ, f = 0)
    (a : heckeAlgebra Γ U ρ g) : a = 0 := by
  sorry

-- eisenstein_not_nonEisenstein
-- A reducible residual representation (for instance `1 ⊕ ε̄⁻¹`, upper triangular) is not
-- non-Eisenstein.
example {GL' k : Type*} [Group GL'] [Field k] (rbar : GL' →* GL (Fin 2) k)
    (hred : ∀ g, (rbar g : Matrix (Fin 2) (Fin 2) k) 1 0 = 0) : ¬ IsNonEisenstein rbar := by
  sorry

end Hecke

section Ordinary

variable {G O M : Type*} [Group G] [CommRing O] [AddCommGroup M] [Module O M]

/-- **`PL.2/iwahori-ordinary-parts`.** `U(l^{b,c}) = U^l × ∏_{v|l} ι_ṽ⁻¹ Iw(ṽ^{b,c})`, presented as
the intersection of the prime-to-`l` level with the preimage of the Iwahori level under the
projection `pl : G →* Gl` to the component at `l`. -/
def iwahoriLevel {Gl : Type*} [Group Gl] (Ul : Subgroup G) (pl : G →* Gl) (Iw : Subgroup Gl) :
    Subgroup G :=
  Ul ⊓ Iw.comap pl

/-- The renormalised operators `U^j_{λ,ϖ_ṽ}` on `S(U(l^{b,c}), A)` (data). -/
def uOperator (S : Type*) [AddCommGroup S] [Module O S] (j : ℕ) : Module.End O S := sorry

/-- The diamond operators `⟨u⟩`, `u ∈ T(O_{L⁺,l})`, as a representation of the torus. -/
def diamond (T S : Type*) [Group T] [AddCommGroup S] [Module O S] : Representation O T S := sorry

/-- Partial generic model: the Fitting projection onto `⋂ range Up^k` along `⋃ ker Up^k`
on a finite-length module. The factorial-power limit description additionally uses finite
coefficient quotients and their inverse-limit topology; it is not asserted over arbitrary
artinian rings such as a characteristic-zero field. -/
def ordinaryIdempotent (Up : Module.End O M) : Module.End O M := sorry

/-- API: `e` is idempotent. -/
theorem ordinaryIdempotent_isIdempotent [IsArtinianRing O] [Module.Finite O M]
    (Up : Module.End O M) : IsIdempotentElem (ordinaryIdempotent Up) := by
  sorry

/-- API: the ordinary part `e S` does not change when `Up` is multiplied by a commuting
automorphism of finite order (a change of uniformizer). -/
theorem ordinaryPart_indep_uniformizer [IsArtinianRing O] [Module.Finite O M]
    (Up : Module.End O M) (d : M ≃ₗ[O] M) (hcomm : Up ∘ₗ d.toLinearMap = d.toLinearMap ∘ₗ Up)
    (hfin : ∃ m : ℕ, 0 < m ∧ d.toLinearMap ^ m = 1) :
    LinearMap.range (ordinaryIdempotent (Up ∘ₗ d.toLinearMap)) =
      LinearMap.range (ordinaryIdempotent Up) := by
  sorry

/-- API: `e` commutes with Hecke-equivariant maps, in particular with the inclusions between
Iwahori levels `b ≤ b′`, `c ≤ c′`. -/
theorem ordinaryPart_restrict {M' : Type*} [AddCommGroup M'] [Module O M'] [IsArtinianRing O]
    [Module.Finite O M] [Module.Finite O M'] (Up : Module.End O M) (Up' : Module.End O M')
    (i : M →ₗ[O] M') (hi : i ∘ₗ Up = Up' ∘ₗ i) :
    i ∘ₗ ordinaryIdempotent Up = ordinaryIdempotent Up' ∘ₗ i := by
  sorry

-- ordinaryIdempotent_rank_one
-- For `n = 1`, `U` is invertible and `e = 1`.
example [IsArtinianRing O] [Module.Finite O M] (Up : M ≃ₗ[O] M) :
    ordinaryIdempotent Up.toLinearMap = 1 := by
  sorry

-- ordinaryIdempotent_zero
-- On the zero module `e = 0`.
example (Up : Module.End O M) (h : ∀ x : M, x = 0) : ordinaryIdempotent Up = 0 := by
  sorry

-- ordinary_compatibility_padicFamilies
-- `e` has range the ordinary part `⋂ range Up^k` (PadicFamilies L0a/finite-ordinary-projector).
example [IsArtinianRing O] [Module.Finite O M] (Up : Module.End O M) :
    LinearMap.range (ordinaryIdempotent Up) = TauCeti.Automorphy.ordinaryPart Up := by
  sorry

-- nonordinary_example
-- A nilpotent `Up` (all eigenvalues of positive slope) has `e = 0`.
example [IsArtinianRing O] [Module.Finite O M] (Up : Module.End O M) (h : IsNilpotent Up) :
    ordinaryIdempotent Up = 0 := by
  sorry

/-- **`PL.2/big-ordinary-hecke-algebra`.** The big ordinary Hecke algebra as the inverse limit of
the ordinary Hecke algebras `T c` of level `U(l^{c,c})` along the restriction surjections. -/
def bigOrdinaryHeckeAlgebra {T : ℕ → Type*} [∀ c, CommRing (T c)] (π : ∀ c, T (c + 1) →+* T c) :
    Subring ((c : ℕ) → T c) where
  carrier := {x | ∀ c, π c (x (c + 1)) = x c}
  zero_mem' := by sorry
  add_mem' := by sorry
  neg_mem' := by sorry
  one_mem' := by sorry
  mul_mem' := by sorry

variable {T : ℕ → Type*} [∀ c, CommRing (T c)] (π : ∀ c, T (c + 1) →+* T c)

/-- API: the `Λ`-algebra structure from compatible diamond actions `φ c : Λ →+* T c` (twisted by
`u ↦ ∏_τ ∏_i τ(u_i)^{1−i}` as in Thorne 2012 Definition 8.3). -/
def bigOrdinaryHeckeAlgebra.lambdaAlgebra (Λ : Type*) [CommRing Λ] (φ : ∀ c, Λ →+* T c)
    (hφ : ∀ c, (π c).comp (φ (c + 1)) = φ c) : Λ →+* bigOrdinaryHeckeAlgebra π := sorry

/-- API: specialisation to level `c`. -/
def bigOrdinaryHeckeAlgebra.specialize (c : ℕ) : bigOrdinaryHeckeAlgebra π →+* T c where
  toFun x := (x : (c : ℕ) → T c) c
  map_one' := rfl
  map_mul' _ _ := rfl
  map_zero' := rfl
  map_add' _ _ := rfl

/-- API: localisation at a maximal ideal `m` (data). -/
def bigOrdinaryHeckeAlgebra.localize (m : Ideal (bigOrdinaryHeckeAlgebra π)) [m.IsPrime] :
    Type _ :=
  Localization.AtPrime m

/- Supplier-dependent (the action on `S(U(l^∞), K/O)`):
theorem bigOrdinaryHeckeAlgebra.faithful : the big ordinary Hecke algebra acts faithfully on
  e S(U(l^∞), K/O) (Geraghty Lemma 2.4.7). -/

-- bigOrd_rank_one
-- Elements of the inverse limit are determined by their specialisations.
example (x y : bigOrdinaryHeckeAlgebra π)
    (h : ∀ c, bigOrdinaryHeckeAlgebra.specialize π c x = bigOrdinaryHeckeAlgebra.specialize π c y) :
    x = y := by
  sorry

-- bigOrd_zero
-- If every finite-level ordinary Hecke algebra is zero, so is the big one.
example (h : ∀ c, Subsingleton (T c)) : Subsingleton (bigOrdinaryHeckeAlgebra π) := by
  sorry

-- bigOrd_specialization
-- Specialisation is surjective when the transition maps are (control, at arithmetic weights).
example (hsurj : ∀ c, Function.Surjective (π c)) (c : ℕ) :
    Function.Surjective (bigOrdinaryHeckeAlgebra.specialize π c) := by
  sorry

/- bigOrd_not_finite_over_O (supplier-dependent: Krull dimension of `Λ`): the big ordinary Hecke
algebra is finite faithful over `Λ`, of Krull dimension `1 + n[L⁺ : ℚ]`, hence not finite over
`O` when nonzero. -/

end Ordinary

section TaylorWilesLevel

variable {G O : Type*} [Group G] [CommRing O]

/-- **`PL.2/taylor-wiles-level-structures`.** `U₀(Q)`, given as the parahoric level. -/
def twLevel0 (U0 : Subgroup G) : Subgroup G := U0

/-- `U₁(Q) = ker(U₀(Q) → Δ_Q)`. -/
def twLevel1 {Δ : Type*} [Group Δ] (U0 : Subgroup G) (δ : U0 →* Δ) : Subgroup G :=
  δ.ker.map U0.subtype

/-- The action of `O[Δ_Q]` on `S(U₁(Q), O)` by diamond operators (data). -/
def twDiamondAction (Δ S : Type*) [Group Δ] [AddCommGroup S] [Module O S] :
    Representation O Δ S := sorry

/-- The parahoric projection `pr_ϖ` (Thorne 2012, Propositions 5.9, 5.12) (data). -/
def twProjection (S : Type*) [AddCommGroup S] [Module O S] : Module.End O S := sorry

/- tw_free is pending the actual selected arithmetic module and its small-stabilizer
hypothesis. An action with no nonzero fixed vector for nonidentity group elements need
not be a free group-algebra module (the one-dimensional C₂ sign representation over Q). -/

/- Supplier-dependent (Galois side): theorem tw_inertia : on `pr S(U₁(Q), O)_{m_Q}`,
`r_{m_Q}|G_{L_ṽ} ≅ s ⊕ ψ` with `ψ(Art u)` acting by the diamond operator of `u`. -/

-- tw_empty
-- For `Q = ∅`, `Δ_∅ = 1` and `U₁(∅) = U₀(∅)`.
example (U0 : Subgroup G) (δ : U0 →* Unit) : twLevel1 U0 δ = twLevel0 U0 := by
  sorry

-- tw_coinvariants
-- `U₁(Q) ≤ U₀(Q)`.
example {Δ : Type*} [Group Δ] (U0 : Subgroup G) (δ : U0 →* Δ) : twLevel1 U0 δ ≤ twLevel0 U0 := by
  sorry

-- tw_rank
-- The index of `U₁(Q)` in `U₀(Q)` is `#Δ_Q` when `δ` is surjective.
example {Δ : Type*} [Group Δ] [Finite Δ] (U0 : Subgroup G) (δ : U0 →* Δ)
    (hδ : Function.Surjective δ) : (δ.ker).index = Nat.card Δ := by
  sorry

/- tw_not_free_without_smallness (supplier-dependent): if an arithmetic stabiliser of `U₁(Q)` has
order divisible by `l`, `S(U₁(Q), O)` need not be free over `O[Δ_Q]`. -/

end TaylorWilesLevel

end TauCeti.DefiniteUnitary

/-! ## PL.3 Taylor–Wiles data and PL.4 strong residual oddness -/

namespace TauCeti.Automorphy

section TaylorWilesData

/-- **`PL.3/thorne-taylor-wiles-datum`.** A finite set `Q` of places (of a type `P` of places of
`F⁺` split in `F`) with norms `q v ≡ 1 mod l` and, for each `v ∈ Q`, the residual eigenspace
decomposition `r̄|G_{F_ṽ} = s̄_v ⊕ ψ̄_v` (as a pair of complementary subspaces of `kⁿ`). -/
structure TaylorWilesDatum (P k : Type*) [Field k] (n l : ℕ) where
  Q : Finset P
  q : P → ℕ
  q_mod : ∀ v ∈ Q, q v % l = 1
  sbar : P → Submodule k (Fin n → k)
  psibar : P → Submodule k (Fin n → k)
  compl : ∀ v ∈ Q, IsCompl (sbar v) (psibar v)

variable {P k : Type*} [Field k] {n l : ℕ}

/-- Partial API: being of level `N` is a predicate. For an empty `Q` every `N` works,
so there is no largest level. The remaining arithmetic datum fields are pending. -/
def TaylorWilesDatum.level (D : TaylorWilesDatum P k n l) (N : ℕ) : Prop :=
  ∀ v ∈ D.Q, l ^ N ∣ D.q v - 1

/-- API: the local deformation problem `D_v^{TW}`: lifts `r : G_{F_ṽ} → GL_n(A)` preserving a
decomposition `Aⁿ = S ⊕ Ψ` with inertia `I` acting trivially on `S` and by scalars on `Ψ` (the
condition that the decomposition lifts `s̄_v ⊕ ψ̄_v` is part of the deformation-theoretic setting
and is omitted here). -/
def TaylorWilesDatum.localProblem {GK A : Type*} [Group GK] [CommRing A] (I : Subgroup GK) :
    Set (GK →* GL (Fin n) A) :=
  {r | ∃ S Ψ : Submodule A (Fin n → A), IsCompl S Ψ ∧
    (∀ g, ∀ v ∈ S, (r g : Matrix (Fin n) (Fin n) A) *ᵥ v ∈ S) ∧
    (∀ g, ∀ v ∈ Ψ, (r g : Matrix (Fin n) (Fin n) A) *ᵥ v ∈ Ψ) ∧
    (∀ σ ∈ I, ∀ v ∈ S, (r σ : Matrix (Fin n) (Fin n) A) *ᵥ v = v) ∧
    (∀ σ ∈ I, ∃ a : A, ∀ v ∈ Ψ, (r σ : Matrix (Fin n) (Fin n) A) *ᵥ v = a • v)}

/- Supplier-dependent (polarized global deformation problems and their rings,
GlobalGaloisDeformations G7, have no Lean carrier at the pins):
def TaylorWilesDatum.augmented (𝒮 : PolarizedDeformationProblem) : PolarizedDeformationProblem
instance TaylorWilesDatum.diamondAlgebra : Algebra O[Δ_Q] (R^univ_{𝒮_Q})
theorem TaylorWilesDatum.localCondition_perp : L_v^⊥ = {unramified classes with ψ̄_v-component in
  H¹(G_{F_ṽ}, ad⁰ ψ̄_v(1))} -/

-- twDatum_empty
-- For `Q = ∅` the level condition is vacuous: every `N` is allowed.
example (D : TaylorWilesDatum P k n l) (hQ : D.Q = ∅) (N : ℕ) :
    D.level N := by
  sorry

-- twDatum_rank_one_block
-- If `ψ̄_v` is a line, a lift with `S` of codimension one is of Taylor–Wiles type exactly when
-- inertia acts trivially on `S` and by a scalar on `Ψ`: unramified lifts are of this type.
example {GK A : Type*} [Group GK] [CommRing A] (I : Subgroup GK) (r : GK →* GL (Fin n) A)
    (hI : ∀ σ ∈ I, r σ = 1) : r ∈ TaylorWilesDatum.localProblem (n := n) I := by
  sorry

-- twDatum_unramified_lift
-- Every unramified lift lies in `D_v^{TW}` (same statement for the trivial representation).
example {GK A : Type*} [Group GK] [CommRing A] (I : Subgroup GK) :
    (1 : GK →* GL (Fin n) A) ∈ TaylorWilesDatum.localProblem (n := n) I := by
  sorry

-- twDatum_nonexample_nonscalar
-- If inertia acts on a two-dimensional `Ψ` by a non-scalar unipotent matrix and trivially on
-- nothing else (`n = 2`, `S = 0` forced), the lift is not of Taylor–Wiles type.
example {GK A : Type*} [Group GK] [Field A] (I : Subgroup GK) (r : GK →* GL (Fin 2) A) (σ : GK)
    (hσ : σ ∈ I) (hr : (r σ : Matrix (Fin 2) (Fin 2) A) = !![1, 1; 0, 1])
    (hirr : IsIrreducibleRep r) : r ∉ TaylorWilesDatum.localProblem (n := 2) I := by
  sorry

end TaylorWilesData

section ResidualOddness

variable {k : Type*} [Field k] {n : ℕ}

/-- **`PL.4/strongly-residually-odd`.** With `r̄(c_v) = (A, −μ̄(c_v)) j` in `𝒢_n(k)`
(`char k = 2`, `n` even), the pair is strongly residually odd at `v` if `r̄(c_v)` is
`GL_n(k)`-conjugate to `(1_n, 1) j`, i.e. `g A ᵗg = 1` for some `g`. -/
def IsStronglyResiduallyOdd (A : Matrix (Fin n) (Fin n) k) : Prop :=
  ∃ g : GL (Fin n) k, (g : Matrix (Fin n) (Fin n) k) * A * (g : Matrix (Fin n) (Fin n) k)ᵀ = 1

/-- API: independence of the extension and of `c_v` within its class (conjugation invariance). -/
theorem IsStronglyResiduallyOdd.indep_extension (A : Matrix (Fin n) (Fin n) k) (h : GL (Fin n) k) :
    IsStronglyResiduallyOdd A ↔
      IsStronglyResiduallyOdd ((h : Matrix (Fin n) (Fin n) k) * A * (h : Matrix (Fin n) (Fin n) k)ᵀ) := by
  sorry

/-- The standard alternating matrix `Ψ_n` (blocks `(0 1; 1 0)` in characteristic 2). -/
def standardAlternating (n : ℕ) : Matrix (Fin (2 * n)) (Fin (2 * n)) k :=
  Matrix.of fun i j => if (i : ℕ) / 2 = (j : ℕ) / 2 ∧ i ≠ j then 1 else 0

/-- API (Thorne 2017, Lemma 2.16): over a perfect field of characteristic 2, an invertible
symmetric `A` of even size is congruent to exactly one of `1` and `Ψ`. -/
theorem complexConjugation_dichotomy [CharP k 2] [PerfectField k] {m : ℕ}
    (hm : 0 < m) (A : Matrix (Fin (2 * m)) (Fin (2 * m)) k) (hA : Aᵀ = A) (hdet : IsUnit A.det) :
    Xor (IsStronglyResiduallyOdd A)
      (∃ g : GL (Fin (2 * m)) k, (g : Matrix _ _ k) * A * (g : Matrix _ _ k)ᵀ = standardAlternating m) := by
  sorry

/- Supplier-dependent (lifts to `𝒢_n(O)`):
theorem IsStronglyResiduallyOdd.mu_neg_one : strongly residually odd at `v` and `r` lifting `r̄`
  with absolutely irreducible `ρ̄` ⇒ `μ(c_v) = −1` (Thorne 2017, Lemma 3.4).
theorem isStronglyResiduallyOdd_rank_two_iff : for `n = 2`, `ρ̄ = σ|G_F ⊗ ψ⁻¹`, strongly residually
  odd at `v` ⇔ `σ(c_v) ≠ 1` (Lemma 3.5(ii)). -/

-- sro_rank_two_nontrivial
-- Over `F_2`, the identity form is strongly residually odd.
example [Fact (Nat.Prime 2)] : IsStronglyResiduallyOdd (1 : Matrix (Fin 2) (Fin 2) (ZMod 2)) := by
  sorry

-- sro_rank_two_trivial
-- Over `F_2`, the alternating form `(0 1; 1 0)` is not.
example [Fact (Nat.Prime 2)] :
    ¬ IsStronglyResiduallyOdd (!![0, 1; 1, 0] : Matrix (Fin 2) (Fin 2) (ZMod 2)) := by
  sorry

/- sro_lift_sign (supplier-dependent): every lift `r` with absolutely irreducible `ρ̄` of a strongly
residually odd pair has `μ(c_v) = −1`. -/

-- sro_odd_n_irrelevant
-- For odd `n`, every invertible symmetric form over a perfect field of characteristic 2 is
-- congruent to the identity (alternating forms have even rank), so the condition is automatic.
example [CharP k 2] [PerfectField k] (hn : Odd n) (A : Matrix (Fin n) (Fin n) k) (hA : Aᵀ = A)
    (hdet : IsUnit A.det) : IsStronglyResiduallyOdd A := by
  sorry

end ResidualOddness

end TauCeti.Automorphy

/-! ## PL.6 Residually reducible deformation rings -/

namespace TauCeti.Automorphy

/- Independent review: Schur signatures are pending the arithmetic suppliers.
See the complete required-name inventory below and the packet review gaps. -/

section Primitive

variable {Γ k : Type*} [Group Γ] [Field k] {n : ℕ}

/-- **`PL.6/primitive-representation`.** `ρ` is primitive if `kⁿ` has no system of imprimitivity:
a decomposition into at least two nonzero subspaces permuted transitively by `Γ` (equivalently,
`ρ` is not induced from a proper subgroup of finite index). -/
def IsPrimitive (ρ : Γ →* GL (Fin n) k) : Prop :=
  ¬ ∃ (ι : Type) (_ : Fintype ι) (_ : DecidableEq ι) (W : ι → Submodule k (Fin n → k)),
    1 < Fintype.card ι ∧ DirectSum.IsInternal W ∧ (∀ i, W i ≠ ⊥) ∧
    (∀ g i, ∃ j, (W i).map (Matrix.toLin' (ρ g : Matrix (Fin n) (Fin n) k)) = W j) ∧
    ∀ i j, ∃ g, (W i).map (Matrix.toLin' (ρ g : Matrix (Fin n) (Fin n) k)) = W j

/-- API: primitivity depends only on the image. -/
theorem IsPrimitive.restrict {Γ' : Type*} [Group Γ'] (ι : Γ' →* Γ) (ρ : Γ →* GL (Fin n) k)
    (him : Set.range (ρ.comp ι) = Set.range ρ) : IsPrimitive (ρ.comp ι) ↔ IsPrimitive ρ := by
  sorry

/-- API: one-dimensional representations are primitive. -/
theorem isPrimitive_of_dim_one (ρ : Γ →* GL (Fin 1) k) : IsPrimitive ρ := by
  sorry

/-- API: a representation with a system of imprimitivity (an induced representation) is not
primitive. -/
theorem not_isPrimitive_ind (ρ : Γ →* GL (Fin n) k) {ι : Type} [Fintype ι] [DecidableEq ι]
    (W : ι → Submodule k (Fin n → k)) (hcard : 1 < Fintype.card ι) (hW : DirectSum.IsInternal W)
    (hne : ∀ i, W i ≠ ⊥)
    (hperm : ∀ g i, ∃ j, (W i).map (Matrix.toLin' (ρ g : Matrix (Fin n) (Fin n) k)) = W j)
    (htrans : ∀ i j, ∃ g, (W i).map (Matrix.toLin' (ρ g : Matrix (Fin n) (Fin n) k)) = W j) :
    ¬ IsPrimitive ρ := by
  sorry

/-- API (Newton–Thorne 2021, Lemma 5.1): a sum of characters whose pairwise ratios have order
greater than `n` is primitive. -/
theorem isPrimitive_of_characters (χ : Fin n → Γ →* kˣ) (ρ : Γ →* GL (Fin n) k)
    (hρ : ∀ g, (ρ g : Matrix (Fin n) (Fin n) k) = Matrix.diagonal fun i => (χ i g : k))
    (hord : ∀ i j, i ≠ j → ∀ m : ℕ, 0 < m → m ≤ n → (χ i / χ j) ^ m ≠ 1) :
    IsPrimitive ρ := by
  sorry

-- primitive_dim_one
example (ρ : Γ →* GL (Fin 1) k) : IsPrimitive ρ := by
  sorry

-- not_primitive_induced
-- The regular representation of a group of order two, swapping the two coordinate lines, is
-- induced from the trivial subgroup and is not primitive.
example (ρ : Γ →* GL (Fin 2) k) (σ : Γ)
    (hσ : (ρ σ : Matrix (Fin 2) (Fin 2) k) = !![0, 1; 1, 0])
    (hdiag : ∀ g, (ρ g : Matrix (Fin 2) (Fin 2) k) = 1 ∨
      (ρ g : Matrix (Fin 2) (Fin 2) k) = !![0, 1; 1, 0]) : ¬ IsPrimitive ρ := by
  sorry

-- primitive_characters
-- `χ₁ ⊕ χ₂` with `χ₁/χ₂` of order three is primitive.
example (χ : Fin 2 → Γ →* kˣ) (ρ : Γ →* GL (Fin 2) k)
    (hρ : ∀ g, (ρ g : Matrix (Fin 2) (Fin 2) k) = Matrix.diagonal fun i => (χ i g : k))
    (h3 : orderOf (χ 0 / χ 1) = 3) : IsPrimitive ρ := by
  sorry

-- not_primitive_small_ratio
-- If `χ₁/χ₂` has order two, `χ₁ ⊕ χ₂` is induced from its kernel; with the swap `σ` realising
-- the induction (in a basis adapted to the induction) it is not primitive.
example (ρ : Γ →* GL (Fin 2) k) (σ : Γ) (hσ : (ρ σ : Matrix (Fin 2) (Fin 2) k) = !![0, 1; 1, 0])
    (hdiag : ∀ g, (ρ g : Matrix (Fin 2) (Fin 2) k) = 1 ∨
      (ρ g : Matrix (Fin 2) (Fin 2) k) = !![0, 1; 1, 0]) : ¬ IsPrimitive ρ := by
  sorry

end Primitive

end TauCeti.Automorphy

namespace TauCeti.CommAlg

section Connectedness

variable (R : Type*) [CommRing R]

open scoped Classical in
/-- **`PL.6/connectedness-dimension`.** `c(R)`: for `Spec R` irreducible, `dim R`; otherwise the
infimum over partitions `𝒞₁ ⊔ 𝒞₂` of the minimal primes of `dim ⋃_{P∈𝒞₁, Q∈𝒞₂} V(P) ∩ V(Q)
= sup dim R/(P + Q)`. -/
def connectednessDim : WithBot ℕ∞ :=
  if (minimalPrimes R).Subsingleton then ringKrullDim R else
    ⨅ (C : Set (Ideal R)) (_ : C ⊆ minimalPrimes R) (_ : C.Nonempty)
      (_ : (minimalPrimes R \ C).Nonempty),
      ⨆ (P ∈ C) (Q ∈ minimalPrimes R \ C), ringKrullDim (R ⧸ (P ⊔ Q))

variable {R}

/-- The arithmetic rank `r(I) = min {r : √(f₁, …, f_r) = √I}`. -/
def arithmeticRank (I : Ideal R) : ℕ :=
  sInf {r | ∃ f : Fin r → R, (Ideal.span (Set.range f)).radical = I.radical}

/-- API (Thorne 2015, Proposition 1.8, after Brodmann–Rung): `c(R/I) ≥ c(R) − r(I) − 1` for a
complete noetherian local `R`. -/
theorem connectednessDim_quotient [IsLocalRing R] [IsNoetherianRing R]
    [IsAdicComplete (IsLocalRing.maximalIdeal R) R] (I : Ideal R) :
    connectednessDim R ≤ connectednessDim (R ⧸ I) + ((arithmeticRank I + 1 : ℕ) : WithBot ℕ∞) := by
  sorry

/-- API: for irreducible `Spec R`, `c(R) = dim R`. -/
theorem connectednessDim_of_irreducible (h : ∃! P, P ∈ minimalPrimes R) :
    connectednessDim R = ringKrullDim R := by
  sorry

/-- API: `c(R) ≤ dim R`. -/
theorem connectednessDim_le_dim : connectednessDim R ≤ ringKrullDim R := by
  sorry

-- cdim_node
-- Two lines crossing at the origin: `c(k[x, y]/(xy)) = 0`.
example (k : Type*) [Field k] :
    connectednessDim (MvPolynomial (Fin 2) k ⧸
      (Ideal.span {MvPolynomial.X 0 * MvPolynomial.X 1} : Ideal (MvPolynomial (Fin 2) k))) = 0 := by
  sorry

-- cdim_domain
example [IsDomain R] : connectednessDim R = ringKrullDim R := by
  sorry

-- cdim_planes
-- Two planes meeting in a point: `c(k[x, y, z, w]/((x, y) ∩ (z, w))) = 0`.
example (k : Type*) [Field k] :
    connectednessDim (MvPolynomial (Fin 4) k ⧸
      ((Ideal.span {MvPolynomial.X 0, MvPolynomial.X 1} : Ideal (MvPolynomial (Fin 4) k)) ⊓
        Ideal.span {MvPolynomial.X 2, MvPolynomial.X 3})) = 0 := by
  sorry

-- arank_principal
example (f : R) : arithmeticRank (⊥ : Ideal R) = 0 ∧ arithmeticRank (Ideal.span {f}) ≤ 1 := by
  sorry

end Connectedness

end TauCeti.CommAlg

namespace TauCeti.Automorphy

/- Independent review: Pseudodeformation signatures are pending the arithmetic suppliers.
See the complete required-name inventory below and the packet review gaps. -/

/- Independent review: Reducibility signatures are pending the arithmetic suppliers.
See the complete required-name inventory below and the packet review gaps. -/

section Generic

variable {Sl A : Type*} {I : Sl → Type*} [∀ v, Group (I v)] [CommRing A] {n : ℕ}

/-- Generic matrix helper retained from the former reducibility section: irreducibility
after scalar extension. It carries no reducibility-ideal assertion. -/
def IsIrreducibleMap {Γ R ι K : Type*} [Group Γ] [CommRing R]
    [Fintype ι] [DecidableEq ι] [Field K] (φ : R →+* K) (r : Γ →* GL ι R) : Prop :=
  ∀ W : Submodule K (ι → K), (∀ g, ∀ v ∈ W, ((r g : Matrix ι ι R).map φ) *ᵥ v ∈ W) →
    W = ⊥ ∨ W = ⊤

/-- The scalar-extension map at a prime. -/
def toAlgClosure {R : Type*} [CommRing R] (P : Ideal R) [P.IsPrime] :
    R →+* AlgebraicClosure (FractionRing (R ⧸ P)) :=
  (algebraMap (FractionRing (R ⧸ P)) (AlgebraicClosure (FractionRing (R ⧸ P)))).comp
    ((algebraMap (R ⧸ P) (FractionRing (R ⧸ P))).comp (Ideal.Quotient.mk P))

/-- **`PL.6/generic-prime`.** The universal characters `ψ v i : I^{ab}_{F_ṽ}(l) → A^×` are
generic at `l`: pairwise distinct at every `v`, and for some `v` and `σ` their values satisfy no
nontrivial `ℤ`-linear (multiplicative) relation. -/
def IsGenericAtL (ψ : ∀ v, Fin n → I v →* Aˣ) : Prop :=
  (∀ v i j, i ≠ j → ψ v i ≠ ψ v j) ∧
    ∃ v, ∃ σ : I v, ∀ a : Fin n → ℤ, (∏ i, (ψ v i σ) ^ (a i)) = 1 → a = 0

/-- A generic prime: `𝔭` of dimension one and characteristic `l` with generic universal
characters modulo `𝔭` and `r_𝔭` absolutely irreducible over `Frac(R/𝔭)`. -/
def IsGenericPrime {Γ R : Type*} [Group Γ] [CommRing R] (l : ℕ) (ψ : ∀ v, Fin n → I v →* Rˣ)
    (r : Γ →* GL (Fin n) R) (𝔭 : Ideal R) [𝔭.IsPrime] : Prop :=
  ringKrullDim (R ⧸ 𝔭) = 1 ∧ ((l : R ⧸ 𝔭) = 0) ∧
    IsGenericAtL (fun v i => (Units.map (Ideal.Quotient.mk 𝔭).toMonoidHom).comp (ψ v i)) ∧
      IsIrreducibleMap (toAlgClosure 𝔭) r

/-- API: generic characters are pairwise distinct. -/
theorem IsGenericAtL.distinct {ψ : ∀ v, Fin n → I v →* Aˣ} (h : IsGenericAtL ψ) (v : Sl)
    {i j : Fin n} (hij : i ≠ j) : ψ v i ≠ ψ v j :=
  h.1 v i j hij

/- Supplier-dependent (restriction maps between deformation rings over soluble extensions):
theorem IsGenericPrime.restrict : the pullback of a generic prime along restriction to a soluble
  CM extension in which the places above l split is generic (Thorne 2015, Proposition 5.3). -/

/-- The countable family of ideals of `Λ/(λ)` containing every non-generic point (Allen–Newton–
Thorne, Lemma 3.8) (data). -/
def nonGenericIdeals (Λ : Type*) [CommRing Λ] : ℕ → Ideal Λ := sorry

-- generic_rank_one
-- For `n = 1`, genericity is the existence of a value of infinite order.
example (ψ : ∀ v, Fin 1 → I v →* Aˣ) :
    IsGenericAtL ψ ↔ ∃ v, ∃ σ : I v, ∀ a : ℤ, (ψ v 0 σ) ^ a = 1 → a = 0 := by
  sorry

-- generic_example
-- The packet uses the independent values `1 + T₁` and `1 + T₂` in k⟦T₁,T₂⟧.
-- The former pair `1 + T`, `1` has the relation (0,1) and is not generic.
-- This abstract helper assumes independence; the actual power-series test is pending.
example (ψ : ∀ v, Fin n → I v →* Aˣ) (hdist : ∀ v i j, i ≠ j → ψ v i ≠ ψ v j) (v : Sl) (σ : I v)
    (hind : ∀ a : Fin n → ℤ, (∏ i, (ψ v i σ) ^ (a i)) = 1 → a = 0) : IsGenericAtL ψ := by
  sorry

-- not_generic_equal_characters
example (ψ : ∀ v, Fin n → I v →* Aˣ) (v : Sl) (i j : Fin n) (hij : i ≠ j) (h : ψ v i = ψ v j) :
    ¬ IsGenericAtL ψ := by
  sorry

-- not_generic_torsion
-- If every value is of finite order, there is a nontrivial relation.
example [Nonempty Sl] (hn : 0 < n) (ψ : ∀ v, Fin n → I v →* Aˣ)
    (htors : ∀ v i σ, IsOfFinOrder (ψ v i σ)) : ¬ IsGenericAtL ψ := by
  sorry

end Generic

/-! ## PL.8 Generic Weil–Deligne representations and adjoint Selmer groups -/

section WD

/-- A Weil–Deligne representation on `V` over `E`: `W` stands for the Weil group, `ν` for the
character `w ↦ |w|` (so that `r(1) = r ⊗ ν`), `r` for the action and `N` for the monodromy with
`r(w) N r(w)⁻¹ = ν(w) N`. -/
structure WeilDeligne (W E V : Type*) [Group W] [Field E] [AddCommGroup V] [Module E V]
    (ν : W →* Eˣ) where
  r : Representation E W V
  N : Module.End E V
  rel : ∀ w, r w ∘ₗ N = ((ν w : E)) • (N ∘ₗ r w)

namespace WeilDeligne

variable {W E V : Type*} [Group W] [Field E] [AddCommGroup V] [Module E V] {ν : W →* Eˣ}

/-- **`PL.8/generic-weil-deligne`.** `(r, N)` is generic if there is no nonzero morphism
`(r, N) → (r(1), N) = (r ⊗ ν, N)`. -/
def IsGeneric (ρ : WeilDeligne W E V ν) : Prop :=
  ∀ f : Module.End E V, (∀ w, f ∘ₗ ρ.r w = ((ν w : E)) • (ρ.r w ∘ₗ f)) →
    f ∘ₗ ρ.N = ρ.N ∘ₗ f → f = 0

/-- API: genericity can be checked after restriction to a subgroup `W' → W` (e.g. a finite
extension): a morphism for `W` is one for `W'`. -/
theorem IsGeneric.restrict {W' : Type*} [Group W'] (ι : W' →* W) (ρ : WeilDeligne W E V ν)
    (ρ' : WeilDeligne W' E V (ν.comp ι)) (hr : ∀ w, ρ'.r w = ρ.r (ι w)) (hN : ρ'.N = ρ.N)
    (h : IsGeneric ρ') : IsGeneric ρ := by
  sorry

/- Supplier-dependent (Frobenius semisimplification, the local Langlands correspondence
EndoscopicTransferAndUnitaryTraceComparison ET.6 and weights are not at the pins):
theorem isGeneric_of_frobSS : IsGeneric (frobSS ρ) → IsGeneric ρ.
theorem isGeneric_of_rec_generic : WD(ρ)^{F-ss} = rec(π), π generic ⇒ IsGeneric (Allen, Lemma 1.1.3).
theorem isGeneric_of_pure : pure Weil–Deligne representations are generic. -/

-- generic_trivial
-- The trivial one-dimensional `(1, 0)` is generic when `ν` is nontrivial.
example (ρ : WeilDeligne W E E ν) (hr : ∀ w, ρ.r w = LinearMap.id) (hN : ρ.N = 0)
    (hν : ∃ w, ν w ≠ 1) : IsGeneric ρ := by
  sorry

-- not_generic_steinberg_pair
-- `(1 ⊕ ν, 0)` on `E²` is not generic: the second summand maps onto `1(1) = ν`.
example (ρ : WeilDeligne W E (Fin 2 → E) ν)
    (hr : ∀ w, ρ.r w = Matrix.toLin' (Matrix.diagonal ![1, (ν w : E)])) (hN : ρ.N = 0) :
    ¬ IsGeneric ρ := by
  sorry

-- generic_irreducible
-- An irreducible `r` with `N = 0` and `ν^{dim}` nontrivial is generic.
example [FiniteDimensional E V] (ρ : WeilDeligne W E V ν) (hN : ρ.N = 0)
    (hirr : ∀ U : Submodule E V, (∀ w, ∀ v ∈ U, ρ.r w v ∈ U) → U = ⊥ ∨ U = ⊤)
    (hν : ∃ w, (ν w : E) ^ Module.finrank E V ≠ 1) : IsGeneric ρ := by
  sorry

-- generic_zero_dim
example (ρ : WeilDeligne W E V ν) (h : ∀ v : V, v = 0) : IsGeneric ρ := by
  sorry

end WeilDeligne

end WD

section Selmer

variable {Δ E : Type*} [Group Δ] [Field E] {n : ℕ}

/-- **`PL.8/adjoint-bloch-kato-selmer-group`.** The adjoint action `X ↦ ρ(g) X ρ(g)⁻¹` on
`gl_n(E)` (for a `𝒢_n`-valued `r`, `c` acts by `X ↦ −A ᵗX A⁻¹`; omitted in this carrier). -/
def adjointRep (ρ : Δ →* GL (Fin n) E) : Representation E Δ (Matrix (Fin n) (Fin n) E) where
  toFun g :=
    { toFun := fun X => (ρ g : Matrix (Fin n) (Fin n) E) * X * ((ρ g)⁻¹ : GL (Fin n) E)
      map_add' := by sorry
      map_smul' := by sorry }
  map_one' := by sorry
  map_mul' := by sorry

variable {H : Type*} [AddCommGroup H] [Module E H] {P : Type*} {Hv : P → Type*}
  [∀ v, AddCommGroup (Hv v)] [∀ v, Module E (Hv v)]

/-- The Selmer group: `H` stands for `H¹(G_{F⁺,S}, ad ρ)`, `Hv v` for `H¹(F⁺_v, ad ρ)`, `loc v` for
localisation and `Lf v` for the Bloch–Kato condition `H¹_f(F⁺_v, ad ρ)`. -/
def adjointSelmerF (loc : ∀ v, H →ₗ[E] Hv v) (Lf : ∀ v, Submodule E (Hv v)) : Submodule E H :=
  ⨅ v, (Lf v).comap (loc v)

/-- `H¹_g`: the same with the conditions `H¹_g` at the places above `p`. -/
def adjointSelmerG (loc : ∀ v, H →ₗ[E] Hv v) (Lg : ∀ v, Submodule E (Hv v)) : Submodule E H :=
  ⨅ v, (Lg v).comap (loc v)

/-- API: `H¹_f ⊂ H¹_g`. -/
theorem adjointSelmerF_le_G (loc : ∀ v, H →ₗ[E] Hv v) (Lf Lg : ∀ v, Submodule E (Hv v))
    (h : ∀ v, Lf v ≤ Lg v) : adjointSelmerF loc Lf ≤ adjointSelmerG loc Lg := by
  sorry

/- Supplier-dependent (deformations to E[ε] and the Bloch–Kato conditions, SelmerIwasawaCohomology
L4): theorem adjointSelmerF_eq_tangent : H¹_f(F⁺, ad ρ) is the tangent space of polarized
deformations de Rham above p. -/

/-- API: twisting by a character does not change the adjoint representation. -/
theorem adjointSelmer_twist (ρ : Δ →* GL (Fin n) E) (ψ : Δ →* Eˣ) :
    adjointRep (twistRep ρ ψ) = adjointRep ρ := by
  sorry

-- selmer_rank_one
-- If the global cohomology is zero, so is the Selmer group (the case `n = 1`).
example (loc : ∀ v, H →ₗ[E] Hv v) (Lf : ∀ v, Submodule E (Hv v)) (h : ∀ x : H, x = 0) :
    adjointSelmerF loc Lf = ⊥ := by
  sorry

-- selmer_zero_coeff
-- With no local conditions imposed (every `Lf v = ⊤`) the Selmer group is everything.
example (loc : ∀ v, H →ₗ[E] Hv v) : adjointSelmerF loc (fun _ => ⊤) = ⊤ := by
  sorry

-- selmer_compatibility_selmerIwasawa
example (loc : ∀ v, H →ₗ[E] Hv v) (Lf : ∀ v, Submodule E (Hv v)) (x : H) :
    x ∈ adjointSelmerF loc Lf ↔ ∀ v, loc v x ∈ Lf v := by
  sorry

-- selmer_conditions_not_vacuous
-- With the zero conditions at a place where localisation is injective, the Selmer group is zero.
example (loc : ∀ v, H →ₗ[E] Hv v) (Lf : ∀ v, Submodule E (Hv v)) (v : P) (hv : Lf v = ⊥)
    (hinj : Function.Injective (loc v)) : adjointSelmerF loc Lf = ⊥ := by
  sorry

end Selmer

/- **`PL.8/semistable-pseudodeformation-ring`** (supplier-dependent: Chenevier determinants,
Cayley–Hamilton representations and the stable category `𝓔^{[a,b]}` of semistable subquotients are
not at the pins; signatures recorded for naming):
def detDeformationRing (D̄ : determinant of G_{F,S} over k) : CompleteLocalRing O
def semistableDetRing (a b : ℤ) : the quotient R^{[a,b]}_{D̄,S}
def conjSelfDualDetRing : the conjugate self-dual quotient R_S
theorem detDeformationRing_generators : R_{D̄,S∪Q} is a quotient of O⟦X₁, …, X_{g₀}⟧ with g₀
  depending only on S, D̄ and q ≥ |Q|
theorem semistableDetRing_points : O_E-points of R^{[a,b]} are the semistable [a, b] determinants
theorem semistableDetRing_absIrred : for absolutely irreducible ρ̄, R^{[a,b]}_{D̄,S} is the
  semistable quotient of the unframed deformation ring
Unit tests (as statements): ssdet_rank_one, ssdet_empty_interval, ssdet_absIrred,
ssdet_not_semistable_point, in the reader document. -/

/-! ## PL.9 Rigid residual representations -/

/- Independent review: Rigid signatures are pending the arithmetic suppliers.
See the complete required-name inventory below and the packet review gaps. -/

end TauCeti.Automorphy

/-! ## The named theorems (templates)

Each theorem below is the Lean template of a theorem node of the packet, named after the node.
Arithmetic identifications that cannot be expressed at the pins are omitted (see the header); the
hypotheses that can be expressed with the definitions above are kept. Theorems of abstract algebra
(`exactness_and_freeness`, `character_sums_primitive`, `pseudodeformation_restriction_finite`,
`dimension_one_primes_avoiding`, `generic_r_is_irreducible_under_restriction` and the
connectedness bound) are stated in their true generality. -/


/-
Required arithmetic declaration inventory (pending exact signatures, APIs and examples).
This inventory is not Lean code and is not evidence of protocol §13 correspondence.

PotentialAutomorphyInfrastructurePartII:PL.0/ordinary-of-weight — Ordinary Galois representations of weight λ
  API: TauCeti.Automorphy.IsOrdinaryOfWeight
  API: TauCeti.Automorphy.IsOrdinaryOfWeight.exists_flag
  API: TauCeti.Automorphy.isOrdinaryOfWeight_iff_local
  API: TauCeti.Automorphy.IsOrdinaryOfWeight.restrict
  API: TauCeti.Automorphy.IsOrdinaryOfWeight.twist
  API: TauCeti.Automorphy.IsOrdinaryOfWeight.dual
  API: TauCeti.Automorphy.IsOrdinaryOfWeight.isDeRham
  example: ordinary_cyclotomic
  example: ordinary_tate_curve
  example: ordinary_rank_one
  example: not_ordinary_supersingular
  example: ordinary_weight_unique

PotentialAutomorphyInfrastructurePartII:PL.0/iota-ordinary — ι-ordinary automorphic representations
  API: TauCeti.Automorphy.IsIotaOrdinary
  API: TauCeti.Automorphy.ordinaryPart
  API: TauCeti.Automorphy.ordinaryPart_indep_uniformizer
  API: TauCeti.Automorphy.isIotaOrdinary_iff_principalSeries
  API: TauCeti.Automorphy.IsIotaOrdinary.characters_unique
  API: TauCeti.Automorphy.IsIotaOrdinary.twist
  example: iotaOrdinary_rank_one
  example: iotaOrdinary_steinberg
  example: not_iotaOrdinary_supercuspidal
  example: iotaOrdinary_twist_iff
  example: iotaOrdinary_galois_ordinary

PotentialAutomorphyInfrastructurePartII:PL.0/automorphic-polarized-representation — Automorphic polarized representations and their levels
  API: TauCeti.Automorphy.IsAutomorphic
  API: TauCeti.Automorphy.IsAutomorphicOfLevelPrimeTo
  API: TauCeti.Automorphy.IsAutomorphicOfLevelPotentiallyPrimeTo
  API: TauCeti.Automorphy.IsOrdinarilyAutomorphic
  API: TauCeti.Automorphy.IsAutomorphic.indep_iota
  API: TauCeti.Automorphy.IsAutomorphic.residual
  API: TauCeti.Automorphy.IsAutomorphic.totallyOdd
  example: isAutomorphic_rank_one
  example: not_isAutomorphic_of_not_totallyOdd
  example: levelPrimeTo_crystalline
  example: ordinarilyAutomorphic_ordinary

PotentialAutomorphyInfrastructurePartII:PL.0/iota-ordinary-implies-ordinary — ι-ordinary automorphic representations have ordinary Galois representations

PotentialAutomorphyInfrastructurePartII:PL.0/ordinary-implies-iota-ordinary — Ordinary Galois representations come from ι-ordinary automorphic representations

PotentialAutomorphyInfrastructurePartII:PL.0/steinberg-weight-zero-iota-ordinary — Weight-zero Steinberg representations are ι-ordinary

PotentialAutomorphyInfrastructurePartII:PL.0/isobaric-sum-iota-ordinary — Ordinarity of a regular algebraic isobaric sum

PotentialAutomorphyInfrastructurePartII:PL.0/automorphy-under-twist — Automorphy is invariant under algebraic twists

PotentialAutomorphyInfrastructurePartII:PL.0/soluble-descent — Soluble base change and descent of automorphy

PotentialAutomorphyInfrastructurePartII:PL.0/induction-descent — Automorphy of an induced representation descends

PotentialAutomorphyInfrastructurePartII:PL.0/auxiliary-cm-extensions — Soluble and cyclic CM extensions with prescribed local behaviour

PotentialAutomorphyInfrastructurePartII:PL.0/auxiliary-characters — Algebraic characters with prescribed conjugate-norm and local behaviour

PotentialAutomorphyInfrastructurePartII:PL.1/connects-relation — Connecting and strongly connecting local lifts
  API: TauCeti.Automorphy.Connects
  API: TauCeti.Automorphy.StronglyConnects
  API: TauCeti.Automorphy.Connects.symm
  API: TauCeti.Automorphy.Connects.of_conj
  API: TauCeti.Automorphy.Connects.restrict
  API: TauCeti.Automorphy.Connects.sum
  API: TauCeti.Automorphy.componentDeformationProblem
  example: connects_unramified
  example: connects_refl
  example: not_connects_inertia
  example: connects_crystalline_characters
  example: connects_wd_inertia

PotentialAutomorphyInfrastructurePartII:PL.1/connects-properties — Properties of connection and strong connection

PotentialAutomorphyInfrastructurePartII:PL.1/generic-smooth-points — Generic local representations are smooth points and smooth points are dense

PotentialAutomorphyInfrastructurePartII:PL.1/potentially-diagonalizable — Diagonalizable and potentially diagonalizable representations
  API: TauCeti.Automorphy.IsDiagonalizable
  API: TauCeti.Automorphy.IsPotentiallyDiagonalizable
  API: TauCeti.Automorphy.IsPotentiallyDiagonalizable.of_conj
  API: TauCeti.Automorphy.IsPotentiallyDiagonalizable.restrict
  API: TauCeti.Automorphy.IsPotentiallyDiagonalizable.isPotentiallyCrystalline
  API: TauCeti.Automorphy.IsPotentiallyDiagonalizablyAutomorphic
  example: pd_character
  example: pd_unramified
  example: pd_fontaine_laffaille
  example: not_pd_tate_curve
  example: pd_conj_iff

PotentialAutomorphyInfrastructurePartII:PL.1/pd-criteria — Ordinary and Fontaine–Laffaille representations are potentially diagonalizable

PotentialAutomorphyInfrastructurePartII:PL.1/potentially-barsotti-tate-diagonalizable — Two-dimensional potentially Barsotti–Tate representations are potentially diagonalizable

PotentialAutomorphyInfrastructurePartII:PL.1/pd-operations — Potential diagonalizability is preserved by the tensor operations

PotentialAutomorphyInfrastructurePartII:PL.2/definite-unitary-group — The definite unitary group attached to a CM field
  API: TauCeti.DefiniteUnitary.unitaryGroup
  API: TauCeti.DefiniteUnitary.iotaW
  API: TauCeti.DefiniteUnitary.iotaW_conj
  API: TauCeti.DefiniteUnitary.isCompact_infty
  API: TauCeti.DefiniteUnitary.quasiSplit
  API: TauCeti.DefiniteUnitary.finite_doubleCoset
  example: unitaryGroup_rank_one
  example: unitaryGroup_compact_infty
  example: unitaryGroup_split_place
  example: unitaryGroup_parity_obstruction

PotentialAutomorphyInfrastructurePartII:PL.2/unitary-algebraic-modular-forms — Algebraic modular forms on a definite unitary group
  API: TauCeti.DefiniteUnitary.AlgebraicModularForm
  API: TauCeti.DefiniteUnitary.AlgebraicModularForm.map
  API: TauCeti.DefiniteUnitary.AlgebraicModularForm.restrict
  API: TauCeti.DefiniteUnitary.AlgebraicModularForm.trace
  API: TauCeti.DefiniteUnitary.AlgebraicModularForm.equiv_doubleCoset
  API: TauCeti.DefiniteUnitary.AlgebraicModularForm.automorphicComparison
  example: amf_weight_zero_level
  example: amf_zero_module
  example: amf_compatibility_AF5
  example: amf_not_free_without_smallness

PotentialAutomorphyInfrastructurePartII:PL.2/unitary-hecke-algebra — Hecke algebras of definite unitary groups and their maximal ideals
  API: TauCeti.DefiniteUnitary.heckeOperator
  API: TauCeti.DefiniteUnitary.heckeAlgebra
  API: TauCeti.DefiniteUnitary.heckeAlgebra.isCommutative
  API: TauCeti.DefiniteUnitary.heckeAlgebra.finite
  API: TauCeti.DefiniteUnitary.residualRep
  API: TauCeti.DefiniteUnitary.IsNonEisenstein
  API: TauCeti.DefiniteUnitary.heckeAlgebra.map_restrict
  example: heckeAlgebra_rank_one
  example: heckeAlgebra_charpoly
  example: heckeAlgebra_zero
  example: eisenstein_not_nonEisenstein

PotentialAutomorphyInfrastructurePartII:PL.2/exactness-and-freeness — Exactness and group-ring freeness at l-torsion-free level

PotentialAutomorphyInfrastructurePartII:PL.2/unitary-constituent-galois-representation — Galois representations attached to constituents of algebraic modular forms

PotentialAutomorphyInfrastructurePartII:PL.2/hecke-valued-galois-representation — The 𝒢_n-valued Galois representation over the localized Hecke algebra

PotentialAutomorphyInfrastructurePartII:PL.2/unitary-base-change-and-descent — Base change and descent between definite unitary groups and GL_n

PotentialAutomorphyInfrastructurePartII:PL.2/iwahori-ordinary-parts — Iwahori levels at l, the U_p-operators and ordinary parts
  API: TauCeti.DefiniteUnitary.iwahoriLevel
  API: TauCeti.DefiniteUnitary.uOperator
  API: TauCeti.DefiniteUnitary.diamond
  API: TauCeti.DefiniteUnitary.ordinaryIdempotent
  API: TauCeti.DefiniteUnitary.ordinaryIdempotent_isIdempotent
  API: TauCeti.DefiniteUnitary.ordinaryPart_indep_uniformizer
  API: TauCeti.DefiniteUnitary.ordinaryPart_restrict
  example: ordinaryIdempotent_rank_one
  example: ordinaryIdempotent_zero
  example: ordinary_compatibility_padicFamilies
  example: nonordinary_example

PotentialAutomorphyInfrastructurePartII:PL.2/big-ordinary-hecke-algebra — The big ordinary Hecke algebra over Λ
  API: TauCeti.DefiniteUnitary.bigOrdinaryHeckeAlgebra
  API: TauCeti.DefiniteUnitary.bigOrdinaryHeckeAlgebra.lambdaAlgebra
  API: TauCeti.DefiniteUnitary.bigOrdinaryHeckeAlgebra.faithful
  API: TauCeti.DefiniteUnitary.bigOrdinaryHeckeAlgebra.specialize
  API: TauCeti.DefiniteUnitary.bigOrdinaryHeckeAlgebra.localize
  example: bigOrd_rank_one
  example: bigOrd_zero
  example: bigOrd_specialization
  example: bigOrd_not_finite_over_O

PotentialAutomorphyInfrastructurePartII:PL.2/ordinary-forms-free-over-lambda — Ordinary forms are finite free over Λ

PotentialAutomorphyInfrastructurePartII:PL.2/hida-classicality — Hida classicality and independence of the characters χ_v modulo λ

PotentialAutomorphyInfrastructurePartII:PL.2/ordinary-hecke-galois-representation — The Λ-adic Galois representation on the big ordinary Hecke algebra

PotentialAutomorphyInfrastructurePartII:PL.2/taylor-wiles-level-structures — Taylor–Wiles level structures and the parahoric projection
  API: TauCeti.DefiniteUnitary.twLevel0
  API: TauCeti.DefiniteUnitary.twLevel1
  API: TauCeti.DefiniteUnitary.twDiamondAction
  API: TauCeti.DefiniteUnitary.twProjection
  API: TauCeti.DefiniteUnitary.tw_free
  API: TauCeti.DefiniteUnitary.tw_inertia
  example: tw_empty
  example: tw_coinvariants
  example: tw_rank
  example: tw_not_free_without_smallness

PotentialAutomorphyInfrastructurePartII:PL.3/thorne-taylor-wiles-datum — Taylor–Wiles data with a residual eigenspace
  API: TauCeti.Automorphy.TaylorWilesDatum
  API: TauCeti.Automorphy.TaylorWilesDatum.level
  API: TauCeti.Automorphy.TaylorWilesDatum.localProblem
  API: TauCeti.Automorphy.TaylorWilesDatum.augmented
  API: TauCeti.Automorphy.TaylorWilesDatum.diamondAlgebra
  API: TauCeti.Automorphy.TaylorWilesDatum.localCondition_perp
  example: twDatum_empty
  example: twDatum_rank_one_block
  example: twDatum_unramified_lift
  example: twDatum_nonexample_nonscalar

PotentialAutomorphyInfrastructurePartII:PL.3/adequate-taylor-wiles-primes — Taylor–Wiles primes for adequate residual image

PotentialAutomorphyInfrastructurePartII:PL.3/taylor-wiles-primes-two-adic — Taylor–Wiles data when F contains ζ_p, including p = 2

PotentialAutomorphyInfrastructurePartII:PL.3/minimal-r-equals-t — The minimal R = T theorem on definite unitary groups

PotentialAutomorphyInfrastructurePartII:PL.3/ordinary-r-equals-t — The ordinary R = T theorem with Taylor's Ihara avoidance

PotentialAutomorphyInfrastructurePartII:PL.3/revised-adequacy-r-equals-t — The R = T theorems under Guralnick–Herzig–Tiep adequacy

PotentialAutomorphyInfrastructurePartII:PL.4/minimal-automorphy-lifting — Minimal automorphy lifting with adequate residual image

PotentialAutomorphyInfrastructurePartII:PL.4/strongly-residually-odd — Strong residual oddness at a real place (p = 2)
  API: TauCeti.Automorphy.IsStronglyResiduallyOdd
  API: TauCeti.Automorphy.IsStronglyResiduallyOdd.indep_extension
  API: TauCeti.Automorphy.complexConjugation_dichotomy
  API: TauCeti.Automorphy.IsStronglyResiduallyOdd.mu_neg_one
  API: TauCeti.Automorphy.isStronglyResiduallyOdd_rank_two_iff
  example: sro_rank_two_nontrivial
  example: sro_rank_two_trivial
  example: sro_lift_sign
  example: sro_odd_n_irrelevant

PotentialAutomorphyInfrastructurePartII:PL.4/two-adic-automorphy-lifting — Automorphy lifting for every prime p, including p = 2 and p | n

PotentialAutomorphyInfrastructurePartII:PL.4/relaxed-adequacy — Adequacy relaxed to the vanishing of H¹(H, ad)

PotentialAutomorphyInfrastructurePartII:PL.4/ordinary-automorphy-lifting — Ordinary automorphy lifting

PotentialAutomorphyInfrastructurePartII:PL.4/minimal-finiteness — Finiteness of polarized deformation rings for fixed components

PotentialAutomorphyInfrastructurePartII:PL.4/ordinary-finiteness — Finiteness of ordinary polarized deformation rings

PotentialAutomorphyInfrastructurePartII:PL.4/characteristic-zero-lifts — Characteristic-zero lifts from finiteness and the dimension bound

PotentialAutomorphyInfrastructurePartII:PL.5/dwork-potential-ordinary-automorphy — Potential ordinary automorphy of symplectic mod l representations

PotentialAutomorphyInfrastructurePartII:PL.5/ordinary-lifts-prescribed-local — Ordinary crystalline lifts with prescribed local behaviour

PotentialAutomorphyInfrastructurePartII:PL.5/tensor-product-trick-lifting — Harris's tensor product trick: a preliminary potentially diagonalizable lifting theorem

PotentialAutomorphyInfrastructurePartII:PL.5/pd-automorphy-lifting — Automorphy lifting for potentially diagonalizable representations

PotentialAutomorphyInfrastructurePartII:PL.6/schur-residual-representation — Schur 𝒢_n-valued residual representations
  API: TauCeti.Automorphy.IsSchur
  API: TauCeti.Automorphy.IsSchur.semisimple_multiplicityFree
  API: TauCeti.Automorphy.IsSchur.conj_of_trace_eq
  API: TauCeti.Automorphy.IsSchur.h0_ad_eq_zero
  API: TauCeti.Automorphy.extensionsOfPolarizedSum
  API: TauCeti.Automorphy.IsSchur.of_absIrred
  example: schur_absIrred
  example: schur_characters
  example: not_schur_repeated
  example: schur_h0

PotentialAutomorphyInfrastructurePartII:PL.6/primitive-representation — Primitive representations
  API: TauCeti.Automorphy.IsPrimitive
  API: TauCeti.Automorphy.IsPrimitive.restrict
  API: TauCeti.Automorphy.isPrimitive_of_dim_one
  API: TauCeti.Automorphy.not_isPrimitive_ind
  API: TauCeti.Automorphy.isPrimitive_of_characters
  example: primitive_dim_one
  example: not_primitive_induced
  example: primitive_characters
  example: not_primitive_small_ratio

PotentialAutomorphyInfrastructurePartII:PL.6/character-sums-primitive — Sums of characters with large ratios are primitive

PotentialAutomorphyInfrastructurePartII:PL.6/connectedness-dimension — Connectedness dimension and arithmetic rank
  API: TauCeti.CommAlg.connectednessDim
  API: TauCeti.CommAlg.arithmeticRank
  API: TauCeti.CommAlg.connectednessDim_quotient
  API: TauCeti.CommAlg.connectednessDim_of_irreducible
  API: TauCeti.CommAlg.connectednessDim_le_dim
  example: cdim_node
  example: cdim_domain
  example: cdim_planes
  example: arank_principal

PotentialAutomorphyInfrastructurePartII:PL.6/polarized-pseudodeformation-subring — The subring P_𝒮 generated by characteristic polynomials
  API: TauCeti.Automorphy.pseudoDeformationRing
  API: TauCeti.Automorphy.charPolySubring
  API: TauCeti.Automorphy.charPolySubring_eq_top_of_absIrred
  API: TauCeti.Automorphy.charPolySubring_finite
  API: TauCeti.Automorphy.charPolySubring_eq_invariants
  API: TauCeti.Automorphy.charPolySubring_etale
  API: TauCeti.Automorphy.charPolySubring_generators
  example: ps_absIrred
  example: ps_two_characters
  example: ps_compatibility_determinants
  example: ps_not_surjective_reducible

PotentialAutomorphyInfrastructurePartII:PL.6/pseudodeformation-restriction-finite — Restriction of pseudodeformations to a finite-index subgroup is finite

PotentialAutomorphyInfrastructurePartII:PL.6/reducibility-ideal — Split deformation ideals and determinant reducibility ideals
  API: TauCeti.Automorphy.reducibleDeformations
  API: TauCeti.Automorphy.splitReducibilityIdeal
  API: TauCeti.Automorphy.reducibilityIdeal
  API: TauCeti.Automorphy.reducibilityIdeal_partition
  API: TauCeti.Automorphy.absIrred_iff_not_le_reducibilityIdeal
  API: TauCeti.Automorphy.reducibilityIdeal_map
  example: red_absIrred
  example: red_two_characters
  example: red_split_lift
  example: red_irreducible_point

PotentialAutomorphyInfrastructurePartII:PL.6/reducible-locus-dimension — The reducible locus is small in the presence of Steinberg places

PotentialAutomorphyInfrastructurePartII:PL.6/generic-prime — Generic primes of an ordinary deformation ring
  API: TauCeti.Automorphy.IsGenericAtL
  API: TauCeti.Automorphy.IsGenericPrime
  API: TauCeti.Automorphy.IsGenericAtL.distinct
  API: TauCeti.Automorphy.IsGenericPrime.restrict
  API: TauCeti.Automorphy.nonGenericIdeals
  example: generic_rank_one
  example: generic_example
  example: not_generic_equal_characters
  example: not_generic_torsion

PotentialAutomorphyInfrastructurePartII:PL.6/large-quotients-contain-generic-primes — Large quotients contain generic primes

PotentialAutomorphyInfrastructurePartII:PL.6/genericity-under-restriction — Absolute irreducibility at a generic prime survives restriction

PotentialAutomorphyInfrastructurePartII:PL.6/reducible-twisting-and-base-change — Twisting and soluble base change for residually reducible rings and Hecke algebras

PotentialAutomorphyInfrastructurePartII:PL.6/generic-prime-r-equals-t — The generic R_𝔭 = T_𝔭 theorem

PotentialAutomorphyInfrastructurePartII:PL.7/ordinary-steinberg-finiteness — Finiteness of ordinary locally Steinberg deformation rings

PotentialAutomorphyInfrastructurePartII:PL.7/residually-reducible-automorphy-lifting — Automorphy lifting for residually reducible representations

PotentialAutomorphyInfrastructurePartII:PL.7/two-constituent-automorphy-lifting — Thorne's automorphy lifting for two adequate constituents

PotentialAutomorphyInfrastructurePartII:PL.7/sum-of-characters-finiteness — Finiteness of ordinary deformation rings of sums of characters

PotentialAutomorphyInfrastructurePartII:PL.7/ordinary-lifts-every-weight — Ordinary lifts of every weight

PotentialAutomorphyInfrastructurePartII:PL.7/unrestricted-ring-dimension-bound — A dimension bound for the ring without Steinberg conditions

PotentialAutomorphyInfrastructurePartII:PL.7/reducible-locus-small — The reducible locus is small

PotentialAutomorphyInfrastructurePartII:PL.7/generic-primes-large-quotients — Generic primes in large quotients

PotentialAutomorphyInfrastructurePartII:PL.7/global-lifts-schur — Global lifts with prescribed local components (Bellovin–Gee, Schur form)

PotentialAutomorphyInfrastructurePartII:PL.7/prescribed-type-lifts — Automorphic lifts of prescribed type from residual automorphy over a soluble extension

PotentialAutomorphyInfrastructurePartII:PL.8/generic-weil-deligne — Generic Weil–Deligne representations
  API: TauCeti.Automorphy.WeilDeligne.IsGeneric
  API: TauCeti.Automorphy.WeilDeligne.isGeneric_of_frobSS
  API: TauCeti.Automorphy.WeilDeligne.isGeneric_of_rec_generic
  API: TauCeti.Automorphy.WeilDeligne.isGeneric_of_pure
  API: TauCeti.Automorphy.WeilDeligne.IsGeneric.restrict
  example: generic_trivial
  example: not_generic_steinberg_pair
  example: generic_irreducible
  example: generic_zero_dim

PotentialAutomorphyInfrastructurePartII:PL.8/bloch-kato-at-generic-places — Bloch–Kato local conditions at generic places

PotentialAutomorphyInfrastructurePartII:PL.8/adjoint-bloch-kato-selmer-group — The adjoint Bloch–Kato Selmer group of a conjugate self-dual representation
  API: TauCeti.Automorphy.adjointRep
  API: TauCeti.Automorphy.adjointSelmerF
  API: TauCeti.Automorphy.adjointSelmerG
  API: TauCeti.Automorphy.adjointSelmerF_le_G
  API: TauCeti.Automorphy.adjointSelmerF_eq_tangent
  API: TauCeti.Automorphy.adjointSelmer_twist
  example: selmer_rank_one
  example: selmer_zero_coeff
  example: selmer_compatibility_selmerIwasawa
  example: selmer_conditions_not_vacuous

PotentialAutomorphyInfrastructurePartII:PL.8/semistable-pseudodeformation-ring — Semistable conjugate self-dual pseudodeformation rings
  API: TauCeti.Automorphy.detDeformationRing
  API: TauCeti.Automorphy.semistableDetRing
  API: TauCeti.Automorphy.conjSelfDualDetRing
  API: TauCeti.Automorphy.detDeformationRing_generators
  API: TauCeti.Automorphy.semistableDetRing_points
  API: TauCeti.Automorphy.semistableDetRing_absIrred
  example: ssdet_rank_one
  example: ssdet_empty_interval
  example: ssdet_absIrred
  example: ssdet_not_semistable_point

PotentialAutomorphyInfrastructurePartII:PL.8/pseudodeformation-tangent-comparison — Tangent spaces of semistable pseudodeformation rings and Selmer groups

PotentialAutomorphyInfrastructurePartII:PL.8/adjoint-selmer-vanishing — Vanishing of adjoint Bloch–Kato Selmer groups of unitary type

PotentialAutomorphyInfrastructurePartII:PL.8/pseudodeformation-ring-regular-at-automorphic-point — The pseudodeformation ring is its residue field at an automorphic point

PotentialAutomorphyInfrastructurePartII:PL.8/ordinary-tangent-vectors-h1g — Ordinary tangent vectors of trivial weight lie in H¹_g

PotentialAutomorphyInfrastructurePartII:PL.9/rigid-residual-representation — Rigid residual conjugate self-dual representations
  API: TauCeti.Automorphy.IsRigid
  API: TauCeti.Automorphy.IsRigid.globalProblem
  API: TauCeti.Automorphy.IsRigid.mono
  API: TauCeti.Automorphy.IsRigid.unramified_outside
  API: TauCeti.Automorphy.IsRigid.fontaineLaffaille
  example: rigid_empty_sets
  example: rigid_eigenvalue_pair
  example: not_rigid_repeated_pair
  example: rigid_compatibility_global

PotentialAutomorphyInfrastructurePartII:PL.9/rigid-r-equals-t — The almost minimal integral R = T theorem for rigid residual representations

PotentialAutomorphyInfrastructurePartII:PL.9/rigidity-for-almost-all-primes — Rigidity and residual irreducibility for almost all primes

PotentialAutomorphyInfrastructurePartII:PL.9/generic-local-domain-lifting — Modularity lifting from polynomially generic local domains

PotentialAutomorphyInfrastructurePartII:PL.9/generic-change-of-weight-lifting — Change-of-weight relaxation of generic-type modularity lifting
-/
