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

**Abstract carriers.** The pinned libraries do not contain absolute Galois groups of number fields
with their decomposition groups and Artin maps, local deformation rings, definite unitary groups
over number fields or their Hecke algebras. Where a definition needs them, the file works over
abstract carriers that stand for them and names the arithmetic instance in the docstring: a
group `GK` with a unit group `U` and a homomorphism `art : U →* GK` for a local Galois group with
the restriction of the Artin map to `O_K^×`; a commutative ring `R` with its points `R →+* B` for
a lifting ring after inverting `l`; groups `Γ ≤ G` with a subgroup `U` for `G(L⁺) ⊂ G(𝔸^∞)` and a
level. The definitions are honest relative to these carriers (no `Prop`-valued fields standing for
missing conditions, no `def _ : Prop := sorry`).

**Theorem templates.** The named arithmetic theorems of the layers are stated in the final
section over the same carriers. Their arithmetic identifications (that `R` *is* the polarized
deformation ring of the stated problem, that `T` *is* the Hecke algebra, and so on) are not
expressible at the pins and are omitted: a template is NOT a theorem for arbitrary inputs of its
carrier types. The packet and the reader document state the complete mathematics.

**Supplier-dependent items.** A few API items need objects that the pins lack entirely (period
rings, Hodge–Tate weights, smooth induction of `GL_n(K)`-representations). Their signatures are
recorded in comment blocks marked "supplier-dependent", which are not elaborated.

**Unit tests.** Every packet test is a comment naming it followed by an `example` proved by
`sorry`, stated for the abstract carrier; the comment names the arithmetic instance. The few tests
that need a missing supplier are recorded in comments marked "supplier-dependent" under their
names.

Written by Claude (session claude-Zy0b6p) for job DESIGN-PotentialAutomorphyInfrastructurePartII
(issue #3344). The file elaborates at the pinned Mathlib with `sorry` as its only warning.
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

-- ordinary_weight_unique
-- The weight is unique up to characters of finite order on the image of `art`.
example (art : U →* GK) (alg alg' : Fin n → U →* Eˣ) (ρ : GK →* GL (Fin n) E)
    (h : IsOrdinaryOfWeightAt art alg ρ) (h' : IsOrdinaryOfWeightAt art alg' ρ) (i : Fin n) :
    ∃ m : ℕ, 0 < m ∧ ∀ u, (alg i u) ^ m = (alg' i u) ^ m := by
  sorry

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

section Automorphic

/-- The carrier for automorphy statements: `Rep` stands for the polarized `l`-adic
representations of `G_F`, `Aut` for the regular algebraic cuspidal polarized `(π, χ)`,
`galois π` for `(r_{l,ι}(π), ε^{1−n} r_{l,ι}(χ))`, and the three predicates on `Aut` for
"level prime to `l`", "level potentially prime to `l`" and "ι-ordinary" (PL.0/iota-ordinary). -/
structure AutomorphyData (Rep : Type*) where
  Aut : Type*
  galois : Aut → Rep
  levelPrimeTo : Aut → Prop
  levelPotentiallyPrimeTo : Aut → Prop
  iotaOrdinary : Aut → Prop
  residual : Rep → Rep

variable {Rep : Type*} (D : AutomorphyData Rep)

/-- **`PL.0/automorphic-polarized-representation`.** `(r, μ)` is automorphic. -/
def IsAutomorphic (r : Rep) : Prop := ∃ π : D.Aut, D.galois π = r

/-- Automorphic of level prime to `l`. -/
def IsAutomorphicOfLevelPrimeTo (r : Rep) : Prop :=
  ∃ π : D.Aut, D.galois π = r ∧ D.levelPrimeTo π

/-- Automorphic of level potentially prime to `l`. -/
def IsAutomorphicOfLevelPotentiallyPrimeTo (r : Rep) : Prop :=
  ∃ π : D.Aut, D.galois π = r ∧ D.levelPotentiallyPrimeTo π

/-- Ordinarily automorphic. -/
def IsOrdinarilyAutomorphic (r : Rep) : Prop :=
  ∃ π : D.Aut, D.galois π = r ∧ D.iotaOrdinary π

/-- API: independence of `ι`: if two choices of `ι` give automorphy data whose Galois maps have
the same image (Clozel, Theorem 3.13), automorphy is the same for both. -/
theorem IsAutomorphic.indep_iota (D D' : AutomorphyData Rep)
    (h : Set.range D.galois = Set.range D'.galois) (r : Rep) :
    IsAutomorphic D r ↔ IsAutomorphic D' r := by
  sorry

/-- API: the residual representation of an automorphic representation is automorphic in the
residual sense (`r̄ ≅ r̄_{l,ι}(π)`). -/
theorem IsAutomorphic.residual {r : Rep} (h : IsAutomorphic D r) :
    ∃ π : D.Aut, D.residual (D.galois π) = D.residual r := by
  sorry

/- Supplier-dependent (signs of complex conjugations on `r_{l,ι}(π)`, AutomorphicGaloisRepresentationsPartII
AG2.0/AG2.2): theorem IsAutomorphic.totallyOdd (h : IsAutomorphic D r) : IsTotallyOdd r := by sorry -/

-- isAutomorphic_rank_one
-- For `n = 1` every algebraic character is `r_{l,ι}` of a Hecke character: in the carrier,
-- surjectivity of `galois` makes every `r` automorphic.
example (hsurj : Function.Surjective D.galois) (r : Rep) : IsAutomorphic D r := by
  sorry

-- not_isAutomorphic_of_not_totallyOdd
-- A representation outside the image of `galois` (for instance not totally odd) is not automorphic.
example (r : Rep) (h : r ∉ Set.range D.galois) : ¬ IsAutomorphic D r := by
  sorry

-- levelPrimeTo_crystalline
-- Level prime to `l` implies level potentially prime to `l` (and, on the Galois side,
-- crystallinity at `l`, supplier-dependent).
example (hD : ∀ π, D.levelPrimeTo π → D.levelPotentiallyPrimeTo π) (r : Rep)
    (h : IsAutomorphicOfLevelPrimeTo D r) : IsAutomorphicOfLevelPotentiallyPrimeTo D r := by
  sorry

-- ordinarilyAutomorphic_ordinary
-- Ordinarily automorphic implies automorphic.
example (r : Rep) (h : IsOrdinarilyAutomorphic D r) : IsAutomorphic D r := by
  sorry

end Automorphic

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

/-- Potentially diagonalizably automorphic: automorphic via some `π` with a potentially
diagonalizable local Galois representation at every place above `l` (recorded by `pd`). -/
def IsPotentiallyDiagonalizablyAutomorphic {Rep : Type*} (D : AutomorphyData Rep)
    (pd : D.Aut → Prop) (r : Rep) : Prop :=
  ∃ π : D.Aut, D.galois π = r ∧ D.levelPotentiallyPrimeTo π ∧ pd π

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

/-- The ordinary idempotent `e = lim_r U(l)^{r!}` attached to an operator `Up` on a module of
finite length (data; it is the projection onto `⋂ range Up^k` along `⋃ ker Up^k`). -/
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

/-- API (template): `pr S(U₁(Q), O)_m` is free over `O[Δ_Q]` at levels with trivial arithmetic
stabilisers; stated for the diamond representation. -/
theorem tw_free (Δ S : Type*) [CommGroup Δ] [Finite Δ] [AddCommGroup S] [Module O S]
    (ρΔ : Representation O Δ S) (hfree : ∀ (s : S) (d : Δ), ρΔ d s = s → d = 1 ∨ s = 0) :
    Module.Free (MonoidAlgebra O Δ) ρΔ.asModule := by
  sorry

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

/-- API: the level `N` of a Taylor–Wiles datum, the largest `N` with `q_v ≡ 1 mod l^N` for all
`v ∈ Q`. -/
def TaylorWilesDatum.level (D : TaylorWilesDatum P k n l) : ℕ :=
  sSup {N | ∀ v ∈ D.Q, l ^ N ∣ D.q v - 1}

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
    N ∈ {N | ∀ v ∈ D.Q, l ^ N ∣ D.q v - 1} := by
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
    (A : Matrix (Fin (2 * m)) (Fin (2 * m)) k) (hA : Aᵀ = A) (hdet : IsUnit A.det) :
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

section Schur

variable {Δ k : Type*} [Group Δ] [Field k] {n : ℕ}

/-- `W` is `ρ`-stable. -/
def IsStable (ρ : Δ →* GL (Fin n) k) (W : Submodule k (Fin n → k)) : Prop :=
  ∀ g, ∀ v ∈ W, (ρ g : Matrix (Fin n) (Fin n) k) *ᵥ v ∈ W

/-- The Schur condition over the field `k` itself: `Δ` stands for `G_F`, `cΔ` for conjugation by
`c` and `μ` for the multiplier. There are no stable `W₂ ≤ W₁` with `kⁿ/W₁` and `W₂` irreducible
and a nonzero pairing `B` on `kⁿ × W₂`, vanishing on `W₁ × W₂`, nondegenerate on
`kⁿ/W₁ × W₂`, with `B(ρ(δ)x, ρ(cδc)y) = μ(δ) B(x, y)`: such a pairing is an isomorphism
`(kⁿ/W₁)^c ≅ W₂^∨ ⊗ μ`. -/
def IsSchurOver (ρ : Δ →* GL (Fin n) k) (cΔ : Δ →* Δ) (μ : Δ →* kˣ) : Prop :=
  ∀ W₁ W₂ : Submodule k (Fin n → k), IsStable ρ W₁ → IsStable ρ W₂ → W₂ ≤ W₁ →
    (∀ W, IsStable ρ W → W₁ ≤ W → W = W₁ ∨ W = ⊤) →
    (∀ W, IsStable ρ W → W ≤ W₂ → W = ⊥ ∨ W = W₂) → W₂ ≠ ⊥ → W₁ ≠ ⊤ →
    ¬ ∃ B : LinearMap.BilinForm k (Fin n → k),
      (∀ x ∈ W₁, ∀ y ∈ W₂, B x y = 0) ∧
      (∀ x, (∀ y ∈ W₂, B x y = 0) → x ∈ W₁) ∧
      (∀ y ∈ W₂, (∀ x, B x y = 0) → y = 0) ∧
      ∀ δ x, ∀ y ∈ W₂, B ((ρ δ : Matrix (Fin n) (Fin n) k) *ᵥ x)
        ((ρ (cΔ δ) : Matrix (Fin n) (Fin n) k) *ᵥ y) = (μ δ : k) * B x y

/-- **`PL.6/schur-residual-representation`.** Thorne 2015, Definition 3.2: the Schur condition
after extending scalars to an algebraic closure (so that the irreducible constituents are
absolutely irreducible). -/
def IsSchur (ρ : Δ →* GL (Fin n) k) (cΔ : Δ →* Δ) (μ : Δ →* kˣ) : Prop :=
  IsSchurOver ((Matrix.GeneralLinearGroup.map (algebraMap k (AlgebraicClosure k))).comp ρ) cΔ
    ((Units.map (algebraMap k (AlgebraicClosure k)).toMonoidHom).comp μ)

/-- API: a Schur `ρ` is semisimple (every stable subspace has a stable complement); it is
moreover multiplicity free (Thorne 2015, Lemma 3.3(1)). -/
theorem IsSchur.semisimple_multiplicityFree {ρ : Δ →* GL (Fin n) k} {cΔ : Δ →* Δ} {μ : Δ →* kˣ}
    (h : IsSchur ρ cΔ μ) (W : Submodule k (Fin n → k)) (hW : IsStable ρ W) :
    ∃ W', IsStable ρ W' ∧ IsCompl W W' := by
  sorry

/-- API (Lemma 3.3(2)): two Schur representations with the same traces are conjugate over an
algebraically closed field (characteristic `0` or `> n`). -/
theorem IsSchur.conj_of_trace_eq [IsAlgClosed k] {ρ ρ' : Δ →* GL (Fin n) k} {cΔ : Δ →* Δ}
    {μ : Δ →* kˣ} (h : IsSchur ρ cΔ μ) (h' : IsSchur ρ' cΔ μ)
    (hchar : ringChar k = 0 ∨ n < ringChar k)
    (htr : ∀ δ, Matrix.trace (ρ δ : Matrix (Fin n) (Fin n) k) =
      Matrix.trace (ρ' δ : Matrix (Fin n) (Fin n) k)) :
    ∃ g : GL (Fin n) k, ∀ δ, ρ' δ = g * ρ δ * g⁻¹ := by
  sorry

/- Supplier-dependent (the 𝒢_n-valued adjoint representation, ArithmeticGaloisRepresentations G7,
has no Lean carrier at the pins):
theorem IsSchur.h0_ad_eq_zero (hk : ringChar k ≠ 2) : H⁰(Γ, ad r̄) = 0 (Lemma 3.3(3)).
def extensionsOfPolarizedSum : the GL_n(k)-classes of extensions of ⊕ρ_i to Γ → 𝒢_n(k), a torsor
  under ∏_i k^×/(k^×)² (Lemma 3.4). -/

/-- API: an absolutely irreducible representation is Schur. -/
theorem IsSchur.of_absIrred {ρ : Δ →* GL (Fin n) k} (cΔ : Δ →* Δ) (μ : Δ →* kˣ)
    (h : IsAbsIrred ρ) : IsSchur ρ cΔ μ := by
  sorry

-- schur_absIrred
-- Absolutely irreducible implies Schur (degenerate case `d = 1`).
example (ρ : Δ →* GL (Fin n) k) (cΔ : Δ →* Δ) (μ : Δ →* kˣ) (h : IsAbsIrred ρ) :
    IsSchur ρ cΔ μ := by
  sorry

-- schur_characters
-- For `n = 2` and `ρ = χ₁ ⊕ χ₂` diagonal with `χ₁ ≠ χ₂` and `χ₂ ∘ c ≠ χ₁⁻¹ μ`, `ρ` is Schur.
example (χ : Fin 2 → Δ →* kˣ) (ρ : Δ →* GL (Fin 2) k) (cΔ : Δ →* Δ) (μ : Δ →* kˣ)
    (hρ : ∀ g, (ρ g : Matrix (Fin 2) (Fin 2) k) = Matrix.diagonal fun i => (χ i g : k))
    (hne : χ 0 ≠ χ 1) (hc : ∀ i j, i ≠ j → (χ j).comp cΔ ≠ (χ i)⁻¹ * μ)
    (hc' : ∀ i, (χ i).comp cΔ = (χ i)⁻¹ * μ) : IsSchur ρ cΔ μ := by
  sorry

-- not_schur_repeated
-- `ρ = χ ⊕ χ` with `χ ∘ c = χ⁻¹ μ` is not Schur.
example (χ : Δ →* kˣ) (ρ : Δ →* GL (Fin 2) k) (cΔ : Δ →* Δ) (μ : Δ →* kˣ)
    (hρ : ∀ g, (ρ g : Matrix (Fin 2) (Fin 2) k) = Matrix.scalar (Fin 2) (χ g : k))
    (hc : χ.comp cΔ = χ⁻¹ * μ) : ¬ IsSchur ρ cΔ μ := by
  sorry

-- schur_h0
-- Over an algebraically closed field a Schur representation is semisimple.
example [IsAlgClosed k] (ρ : Δ →* GL (Fin n) k) (cΔ : Δ →* Δ) (μ : Δ →* kˣ) (h : IsSchur ρ cΔ μ)
    (W : Submodule k (Fin n → k)) (hW : IsStable ρ W) : ∃ W', IsStable ρ W' ∧ IsCompl W W' := by
  sorry

end Schur

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
theorem connectednessDim_quotient [IsLocalRing R] [IsNoetherianRing R] (I : Ideal R) :
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

section Pseudodeformation

variable {Γ Λ R k : Type*} [Group Γ] [CommRing Λ] [CommRing R] [Algebra Λ R] [Field k] {n : ℕ}

/-- **`PL.6/polarized-pseudodeformation-subring`.** For the universal deformation `r` over
`R = R^univ_𝒮`, the `Λ`-subalgebra generated by the coefficients of the characteristic polynomials
of `r(g)` (its closure in the complete local ring is `P_𝒮`). -/
def charPolySubring (Λ : Type*) [CommRing Λ] [Algebra Λ R] (r : Γ →* GL (Fin n) R) :
    Subalgebra Λ R :=
  Algebra.adjoin Λ {x | ∃ g i, x = (Matrix.charpoly (r g : Matrix (Fin n) (Fin n) R)).coeff i}

/-- The `Λ`-subalgebra generated by the matrix entries of `r`. -/
def entrySubring (Λ : Type*) [CommRing Λ] [Algebra Λ R] (r : Γ →* GL (Fin n) R) :
    Subalgebra Λ R :=
  Algebra.adjoin Λ {x | ∃ g i j, x = (r g : Matrix (Fin n) (Fin n) R) i j}

/- Supplier-dependent (Chenevier's determinant deformation rings, IntegralHeckeAndGaloisDeterminants
IHG.0, have no Lean carrier at the pins):
def pseudoDeformationRing : the ring Q_𝒮 representing continuous determinants lifting D̄.
theorem charPolySubring_eq_invariants : P_𝒮 = (R^univ_𝒮)^{μ₂^d}.
theorem charPolySubring_etale : at 𝔭 with absolutely irreducible r_𝔭, P_𝒮 → R^univ_𝒮 is étale
  at 𝔭 ∩ P_𝒮 and μ₂^d acts transitively on the primes above it.
theorem charPolySubring_generators : P_{𝒮′} is a quotient of O⟦X₁, …, X_C⟧ with C depending only
  on |S′ − S|, r̄ and S. -/

/-- API (Carayol): if the residual representation is absolutely irreducible, the characteristic
polynomial coefficients generate the same subalgebra as the entries of a conjugate of `r`. -/
theorem charPolySubring_eq_top_of_absIrred [IsLocalRing R] (π : R →+* k) (r : Γ →* GL (Fin n) R)
    (hπ : RingHom.ker π = IsLocalRing.maximalIdeal R)
    (h : IsAbsIrred ((Matrix.GeneralLinearGroup.map π).comp r)) :
    ∃ g : GL (Fin n) R, charPolySubring Λ r =
      entrySubring Λ ((MulAut.conj g).toMonoidHom.comp r) := by
  sorry

/-- API: for Schur residual representation, `R` (generated by the entries) is finite over the
characteristic polynomial subring (Thorne 2015, Proposition 3.29(2)). -/
theorem charPolySubring_finite [IsLocalRing R] (π : R →+* k) (r : Γ →* GL (Fin n) R)
    (cΓ : Γ →* Γ) (μ : Γ →* kˣ) (hS : IsSchur ((Matrix.GeneralLinearGroup.map π).comp r) cΓ μ)
    (hgen : entrySubring Λ r = ⊤) :
    Module.Finite (charPolySubring Λ r) R := by
  sorry

-- ps_absIrred
-- Absolutely irreducible residual representation: characteristic polynomials generate (Carayol).
example [IsLocalRing R] (π : R →+* k) (r : Γ →* GL (Fin n) R)
    (hπ : RingHom.ker π = IsLocalRing.maximalIdeal R)
    (h : IsAbsIrred ((Matrix.GeneralLinearGroup.map π).comp r)) (hgen : entrySubring Λ r = ⊤) :
    ∃ g : GL (Fin n) R, charPolySubring Λ r =
      entrySubring Λ ((MulAut.conj g).toMonoidHom.comp r) := by
  sorry

-- ps_two_characters
-- For a diagonal `r` the characteristic polynomial subring is generated by the diagonal entries'
-- elementary symmetric functions; in particular traces lie in it.
example (r : Γ →* GL (Fin n) R) (g : Γ) :
    Matrix.trace (r g : Matrix (Fin n) (Fin n) R) ∈ charPolySubring Λ r := by
  sorry

-- ps_compatibility_determinants
-- Determinants lie in the characteristic polynomial subring.
example (r : Γ →* GL (Fin n) R) (g : Γ) :
    Matrix.det (r g : Matrix (Fin n) (Fin n) R) ∈ charPolySubring Λ r := by
  sorry

-- ps_not_surjective_reducible
-- For a reducible (upper triangular, non-split) `r`, the off-diagonal entry need not lie in the
-- characteristic polynomial subring: the subring is contained in the subring generated by the
-- diagonal entries.
example (r : Γ →* GL (Fin 2) R) (hupper : ∀ g, (r g : Matrix (Fin 2) (Fin 2) R) 1 0 = 0) :
    charPolySubring Λ r ≤
      Algebra.adjoin Λ {x | ∃ g i, x = (r g : Matrix (Fin 2) (Fin 2) R) i i} := by
  sorry

end Pseudodeformation

section Reducibility

variable {Γ R : Type*} [Group Γ] [CommRing R] {n₁ n₂ : ℕ}

/-- **`PL.6/reducibility-ideal`.** For `r` written in a basis adapted to the residual
decomposition `ρ̄₁ ⊕ ρ̄₂`, the ideal of reducibility is generated by the entries of the products
`B(g) C(h)` of the off-diagonal blocks. -/
def reducibilityIdeal (r : Γ →* GL (Fin n₁ ⊕ Fin n₂) R) : Ideal R :=
  Ideal.span {x | ∃ g h i j, x = ((r g : Matrix (Fin n₁ ⊕ Fin n₂) (Fin n₁ ⊕ Fin n₂) R).toBlocks₁₂ *
    (r h : Matrix (Fin n₁ ⊕ Fin n₂) (Fin n₁ ⊕ Fin n₂) R).toBlocks₂₁) i j}

/-- Reducible deformations: lifts conjugate to a block-diagonal lift. -/
def reducibleDeformations : Set (Γ →* GL (Fin n₁ ⊕ Fin n₂) R) :=
  {r | ∃ g : GL (Fin n₁ ⊕ Fin n₂) R, ∀ h,
    ((g * r h * g⁻¹ : GL _ R) : Matrix (Fin n₁ ⊕ Fin n₂) (Fin n₁ ⊕ Fin n₂) R).toBlocks₁₂ = 0 ∧
    ((g * r h * g⁻¹ : GL _ R) : Matrix (Fin n₁ ⊕ Fin n₂) (Fin n₁ ⊕ Fin n₂) R).toBlocks₂₁ = 0}

/- Supplier-dependent (determinants and Cayley–Hamilton algebras, IntegralHeckeAndGaloisDeterminants
IHG.0–IHG.1):
def reducibilityIdeal_partition : the ideal I_P of Allen–Newton–Thorne Proposition 2.5 for a
  partition P of d constituents.
theorem reducibilityIdeal_map : restriction to a finite extension maps I^red into the reducibility
  ideal of the restricted problem. -/

/-- Irreducibility of the representation obtained from `r` along `φ : R →+* K`. -/
def IsIrreducibleMap {ι K : Type*} [Fintype ι] [DecidableEq ι] [Field K] (φ : R →+* K)
    (r : Γ →* GL ι R) : Prop :=
  ∀ W : Submodule K (ι → K), (∀ g, ∀ v ∈ W, ((r g : Matrix ι ι R).map φ) *ᵥ v ∈ W) →
    W = ⊥ ∨ W = ⊤

/-- The map `R → R/P → Frac(R/P) → (Frac(R/P))^alg`. -/
def toAlgClosure (P : Ideal R) [P.IsPrime] : R →+* AlgebraicClosure (FractionRing (R ⧸ P)) :=
  (algebraMap (FractionRing (R ⧸ P)) (AlgebraicClosure (FractionRing (R ⧸ P)))).comp
    ((algebraMap (R ⧸ P) (FractionRing (R ⧸ P))).comp (Ideal.Quotient.mk P))

/-- API: at a prime `P`, the specialisation is absolutely irreducible iff `I^red ⊄ P` (for Schur
residual representation and the conjugate self-dual setting, Allen–Newton–Thorne Lemma 3.4). -/
theorem absIrred_iff_not_le_reducibilityIdeal (r : Γ →* GL (Fin n₁ ⊕ Fin n₂) R) (P : Ideal R)
    [P.IsPrime] :
    IsIrreducibleMap (toAlgClosure P) r ↔ ¬ reducibilityIdeal r ≤ P := by
  sorry

-- red_absIrred
-- With no second block (`n₂ = 0`) the reducibility ideal is zero, and every deformation is
-- (trivially) "reducible"; the packet's degenerate case `d = 1` corresponds to `I^red = R`
-- for the conventions with a single constituent.
example (r : Γ →* GL (Fin n₁ ⊕ Fin 0) R) : reducibilityIdeal r = ⊥ := by
  sorry

-- red_two_characters
-- The products of off-diagonal entries lie in the reducibility ideal.
example (r : Γ →* GL (Fin 1 ⊕ Fin 1) R) (g h : Γ) :
    (r g : Matrix (Fin 1 ⊕ Fin 1) (Fin 1 ⊕ Fin 1) R) (Sum.inl 0) (Sum.inr 0) *
      (r h : Matrix (Fin 1 ⊕ Fin 1) (Fin 1 ⊕ Fin 1) R) (Sum.inr 0) (Sum.inl 0) ∈
        reducibilityIdeal r := by
  sorry

-- red_split_lift
-- A block-diagonal lift is a reducible deformation and has reducibility ideal zero.
example (r : Γ →* GL (Fin n₁ ⊕ Fin n₂) R)
    (h : ∀ g, (r g : Matrix (Fin n₁ ⊕ Fin n₂) (Fin n₁ ⊕ Fin n₂) R).toBlocks₁₂ = 0) :
    reducibilityIdeal r = ⊥ := by
  sorry

-- red_irreducible_point
-- If some off-diagonal product is a unit, the reducibility ideal is the whole ring (no point of
-- the reducible locus).
example (r : Γ →* GL (Fin 1 ⊕ Fin 1) R) (g h : Γ)
    (hu : IsUnit ((r g : Matrix (Fin 1 ⊕ Fin 1) (Fin 1 ⊕ Fin 1) R) (Sum.inl 0) (Sum.inr 0) *
      (r h : Matrix (Fin 1 ⊕ Fin 1) (Fin 1 ⊕ Fin 1) R) (Sum.inr 0) (Sum.inl 0))) :
    reducibilityIdeal r = ⊤ := by
  sorry

end Reducibility

section Generic

variable {Sl A : Type*} {I : Sl → Type*} [∀ v, Group (I v)] [CommRing A] {n : ℕ}

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
-- Two characters with values `1 + T` and `1` at `σ` in `ℤ_l⟦T⟧` are generic when distinct
-- elsewhere: in the carrier, values with no multiplicative relation give genericity.
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

section Rigid

variable {P k : Type*} [Field k] {N : ℕ}

/-- **`PL.9/rigid-residual-representation`.** `frob v` stands for `r̄^♮_v(φ_w)` at inert
`v ∈ Σ⁺_lr` with `q v = ‖v‖`; `allMinimal v` for "every lifting of `r̄_v` is minimally ramified"
(LocalGaloisDeformationRings R08.2), `regularFL v` for "regular Fontaine–Laffaille crystalline"
(L7) and `unram v` for "unramified at `v`", all given by the suppliers. Rigidity is the
conjunction of the four conditions of Liu–Tian–Xiao–Zhang–Zhu, Definition 3.6.1. -/
def IsRigid (Smin Slr Sl : Set P) (frob : P → Matrix (Fin N) (Fin N) k) (q : P → k)
    (allMinimal regularFL unram : P → Prop) : Prop :=
  (∀ v ∈ Smin, allMinimal v) ∧
    (∀ v ∈ Slr, (frob v).charpoly.rootMultiplicity ((q v)⁻¹ ^ N) = 1 ∧
      (frob v).charpoly.rootMultiplicity ((q v)⁻¹ ^ N * (q v) ^ 2) = 1) ∧
    (∀ v ∈ Sl, regularFL v) ∧ ∀ v, v ∉ Smin → v ∉ Slr → v ∉ Sl → unram v

variable {Smin Slr Sl : Set P} {frob : P → Matrix (Fin N) (Fin N) k} {q : P → k}
  {allMinimal regularFL unram : P → Prop}

/- Supplier-dependent (polarized global deformation problems, GlobalGaloisDeformations G7):
def IsRigid.globalProblem : the problem 𝒮 = (r̄, η^μ ε^{1−N}, Σ⁺_min ∪ Σ⁺_lr ∪ Σ⁺_ℓ, {all, D^ram, D^FL}). -/

/-- API: adding an inert place satisfying the eigenvalue condition preserves rigidity. -/
theorem IsRigid.mono (h : IsRigid Smin Slr Sl frob q allMinimal regularFL unram) (𝔭 : P)
    (h1 : (frob 𝔭).charpoly.rootMultiplicity ((q 𝔭)⁻¹ ^ N) = 1)
    (h2 : (frob 𝔭).charpoly.rootMultiplicity ((q 𝔭)⁻¹ ^ N * (q 𝔭) ^ 2) = 1) :
    IsRigid Smin (insert 𝔭 Slr) Sl frob q allMinimal regularFL unram := by
  sorry

/-- API: a rigid `r̄` is unramified outside `Σ⁺_min ∪ Σ⁺_lr ∪ Σ⁺_ℓ`. -/
theorem IsRigid.unramified_outside (h : IsRigid Smin Slr Sl frob q allMinimal regularFL unram)
    (v : P) (h1 : v ∉ Smin) (h2 : v ∉ Slr) (h3 : v ∉ Sl) : unram v :=
  h.2.2.2 v h1 h2 h3

/-- API: a rigid `r̄` is regular Fontaine–Laffaille at the places above `ℓ`. -/
theorem IsRigid.fontaineLaffaille (h : IsRigid Smin Slr Sl frob q allMinimal regularFL unram)
    (v : P) (hv : v ∈ Sl) : regularFL v :=
  h.2.2.1 v hv

-- rigid_empty_sets
example (hFL : ∀ v ∈ Sl, regularFL v) (hun : ∀ v, v ∉ Sl → unram v) :
    IsRigid ∅ ∅ Sl frob q allMinimal regularFL unram := by
  sorry

-- rigid_eigenvalue_pair
-- `N = 2`: `frob = diag(q⁻², 1)` has the pair `{q⁻², 1}` each exactly once when `q² ≠ 1`.
example (frob2 : P → Matrix (Fin 2) (Fin 2) k) (v : P) (hq : q v ≠ 0) (hq2 : (q v) ^ 2 ≠ 1)
    (hfrob : frob2 v = Matrix.diagonal ![(q v)⁻¹ ^ 2, 1]) :
    (frob2 v).charpoly.rootMultiplicity ((q v)⁻¹ ^ 2) = 1 ∧
      (frob2 v).charpoly.rootMultiplicity ((q v)⁻¹ ^ 2 * (q v) ^ 2) = 1 := by
  sorry

-- not_rigid_repeated_pair
-- If `‖v‖^{−N}` is a double root at some `v ∈ Σ⁺_lr`, `r̄` is not rigid.
example (v : P) (hv : v ∈ Slr) (h2 : (frob v).charpoly.rootMultiplicity ((q v)⁻¹ ^ N) = 2) :
    ¬ IsRigid Smin Slr Sl frob q allMinimal regularFL unram := by
  sorry

/- rigid_compatibility_global (supplier-dependent): the global problem of a rigid `r̄` is a
polarized deformation problem represented by `R^univ_𝒮` (Liu et al., Proposition 3.1.7). -/

end Rigid

end TauCeti.Automorphy

/-! ## The named theorems (templates)

Each theorem below is the Lean template of a theorem node of the packet, named after the node.
Arithmetic identifications that cannot be expressed at the pins are omitted (see the header); the
hypotheses that can be expressed with the definitions above are kept. Theorems of abstract algebra
(`exactness_and_freeness`, `character_sums_primitive`, `pseudodeformation_restriction_finite`,
`dimension_one_primes_avoiding`, `generic_r_is_irreducible_under_restriction` and the
connectedness bound) are stated in their true generality. -/

namespace TauCeti.Automorphy.Templates

open TauCeti.Automorphy TauCeti.DefiniteUnitary TauCeti.CommAlg

section Automorphy

variable {GF E k : Type*} [Group GF] [Field E] [Field k] {n : ℕ}
variable (D : AutomorphyData (GF →* GL (Fin n) E)) (red : (GF →* GL (Fin n) E) → GF →* GL (Fin n) k)
variable {Pl : Type*} {GKv : Pl → Type*} [∀ v, Group (GKv v)] {Uv : Pl → Type*}
  [∀ v, CommGroup (Uv v)] (dec : ∀ v, GKv v →* GF) (art : ∀ v, Uv v →* GKv v)

/-- **`PL.0/iota-ordinary-implies-ordinary`** (Thorne 2015, Corollary 2.6). -/
theorem iota_ordinary_implies_ordinary (alg : ∀ v, Fin n → Uv v →* Eˣ) (π : D.Aut)
    (hπ : D.iotaOrdinary π) : IsOrdinaryOfWeight dec art alg (D.galois π) := by
  sorry

/-- **`PL.0/ordinary-implies-iota-ordinary`** (BLGGT14 §2.1(7)): level potentially prime to `l`
and ordinary Galois representation imply ι-ordinary. -/
theorem ordinary_implies_iota_ordinary (alg : ∀ v, Fin n → Uv v →* Eˣ) (π : D.Aut)
    (hlev : D.levelPotentiallyPrimeTo π) (hord : IsOrdinaryOfWeight dec art alg (D.galois π)) :
    D.iotaOrdinary π := by
  sorry

/-- **`PL.0/steinberg-weight-zero-iota-ordinary`** (Newton–Thorne 2026, Lemma 2.6), on the
integral Iwahori invariants: `Up` acting by a unit has nonzero ordinary part. -/
theorem steinberg_weight_zero_iota_ordinary {O M : Type*} [CommRing O] [AddCommGroup M]
    [Module O M] [Nontrivial M] (Up : Module.End O M) (c : Oˣ)
    (hUp : Up = (c : O) • LinearMap.id) : ordinaryPart Up ≠ ⊥ := by
  sorry

/-- **`PL.0/isobaric-sum-iota-ordinary`** (Clozel–Thorne 2014, Lemma 2.6): with `sum` the
regular algebraic isobaric sum, ι-ordinary summands give an ι-ordinary sum. -/
theorem isobaric_sum_iota_ordinary (sum : List D.Aut → D.Aut) (πs : List D.Aut)
    (h : ∀ π ∈ πs, D.iotaOrdinary π) : D.iotaOrdinary (sum πs) := by
  sorry

/-- **`PL.0/automorphy-under-twist`** (BLGGT14 Lemma 2.2.1). -/
theorem automorphy_under_twist (ρ : GF →* GL (Fin n) E) (ψ : GF →* Eˣ) :
    IsAutomorphic D ρ ↔ IsAutomorphic D (twistRep ρ ψ) := by
  sorry

/-- **`PL.0/soluble-descent`** (BLGGT14 Lemma 2.2.2): for `ι : G_M → G_F` with `M/F` soluble and
`ρ|G_M` irreducible. -/
theorem soluble_descent {GM : Type*} [Group GM] (DM : AutomorphyData (GM →* GL (Fin n) E))
    (ι : GM →* GF) (ρ : GF →* GL (Fin n) E) (hirr : IsAbsIrred (ρ.comp ι)) :
    IsAutomorphic D ρ ↔ IsAutomorphic DM (ρ.comp ι) := by
  sorry

/-- **`PL.0/induction-descent`** (BLGGT14 Lemma 2.2.4), with `ind` the induction from `G_M`. -/
theorem induction_descent {GM : Type*} [Group GM] {m : ℕ}
    (DMF : AutomorphyData (GF →* GL (Fin (m * n)) E)) (DM : AutomorphyData (GM →* GL (Fin n) E))
    (ind : (GM →* GL (Fin n) E) → GF →* GL (Fin (m * n)) E) (r : GM →* GL (Fin n) E)
    (hirr : IsAbsIrred r) (h : IsAutomorphic DMF (ind r)) : IsAutomorphic DM r := by
  sorry

/-- **`PL.0/auxiliary-cm-extensions`** (BLGGT14 Lemmas A.2.1–A.2.3), Galois-theoretic form: a
cyclic extension of degree `N` is a surjection `χ : G_F → ℤ/N`; it is linearly disjoint from
`F^{(avoid)}` (given by `avoid : G_F → Q`) when `(avoid, χ)` is surjective, and the places of `S`
split completely when their decomposition groups lie in `ker χ`. -/
theorem auxiliary_cm_extensions {Q S : Type*} [Group Q] (avoid : GF →* Q)
    (havoid : Function.Surjective avoid) (decS : S → Subgroup GF) [Finite S] (N : ℕ) (hN : 0 < N) :
    ∃ χ : GF →* Multiplicative (ZMod N), Function.Surjective (avoid.prod χ) ∧
      ∀ s, decS s ≤ χ.ker := by
  sorry

/-- **`PL.0/auxiliary-characters`** (BLGGT14 Lemma A.2.5), template: characters with prescribed
conjugate norm `θ θ^c = χ` and inertial restrictions. -/
theorem auxiliary_characters (cF : GF →* GF) (χ : GF →* Eˣ) {I : Type*} [Group I]
    (incl : I →* GF) (ψI : I →* Eˣ) (hcompat : ∀ σ, ψI σ * ψI σ = χ (incl σ)) :
    ∃ θ : GF →* Eˣ, (∀ g, θ g * θ (cF g) = χ g) ∧ θ.comp incl = ψI := by
  sorry

end Automorphy

section LocalLifts

variable {R B : Type*} [CommRing R] [CommRing B]

/-- **`PL.1/connects-properties`**: strong connection implies connection, `∼` is symmetric, and a
point on a unique component connects only along that component. -/
theorem connects_properties (x y z : R →+* B) (hxy : StronglyConnects x y) (hyz : Connects y z)
    (hyx : StronglyConnects y x) : Connects x y ∧ Connects y x := by
  sorry

/-- **`PL.1/generic-smooth-points`** (BLGGT14 Lemma 1.3.2): a point of a reduced ring at which
the local ring is regular lies on a unique irreducible component. -/
theorem generic_smooth_points [IsNoetherianRing R] (x : R →+* B) [IsDomain B]
    (hreg : ∃! P, P ∈ minimalPrimes R ∧ P ≤ RingHom.ker x) (y : R →+* B) (h : Connects x y) :
    StronglyConnects x y := by
  sorry

/-- **`PL.1/pd-criteria`** (BLGGT14 Lemma 1.4.3): template: a point connected to a diagonal point
is diagonalizable. -/
theorem pd_criteria (diag : Set (R →+* B)) (x y : R →+* B) (hy : y ∈ diag) (h : Connects x y) :
    IsDiagonalizable diag x := by
  sorry

/-- **`PL.1/potentially-barsotti-tate-diagonalizable`** (Gee–Kisin, Lemma 4.4.1), template: if
every component of the Barsotti–Tate ring contains a diagonal (ordinary) point, every point is
diagonalizable. -/
theorem potentially_barsotti_tate_diagonalizable (diag : Set (R →+* B))
    (hcomp : ∀ P ∈ minimalPrimes R, ∃ y ∈ diag, P ≤ RingHom.ker y) (x : R →+* B) [IsDomain B] :
    IsDiagonalizable diag x := by
  sorry

/-- **`PL.1/pd-operations`**, template: the tensor operations are ring maps between lifting rings
sending diagonal points to diagonal points; diagonalizability is preserved. -/
theorem pd_operations {R' : Type*} [CommRing R'] (op : R' →+* R) (diag : Set (R →+* B))
    (diag' : Set (R' →+* B)) (hop : ∀ y ∈ diag, y.comp op ∈ diag')
    (hcomp : ∀ P ∈ minimalPrimes R, ∃ P' ∈ minimalPrimes R', P' ≤ P.comap op)
    (x : R →+* B) (hx : IsDiagonalizable diag x) : IsDiagonalizable diag' (x.comp op) := by
  sorry

end LocalLifts

section DefiniteUnitaryTheorems

variable {G O M : Type*} [Group G] [CommRing O] [AddCommGroup M] [Module O M]

/-- **`PL.2/exactness-and-freeness`** (Thorne 2012, Lemma 6.3), in the form used: for a finite
group `H` whose order is invertible in `O`, taking invariants is exact on surjections. -/
theorem exactness_and_freeness {H N : Type*} [Group H] [Fintype H] [AddCommGroup N] [Module O N]
    (ρ : Representation O H M) (σ : Representation O H N) (f : M →ₗ[O] N)
    (hf : ∀ h, f ∘ₗ ρ h = σ h ∘ₗ f) (hsurj : Function.Surjective f)
    (hH : IsUnit (Fintype.card H : O)) :
    ∀ y ∈ σ.invariants, ∃ x ∈ ρ.invariants, f x = y := by
  sorry

variable {GL' E : Type*} [Group GL'] [Field E] {n : ℕ}

/-- **`PL.2/unitary-constituent-galois-representation`** (Thorne 2012, Theorem 6.5), template:
an eigensystem `θ : T → E` of the Hecke algebra has a Galois representation whose Frobenius
characteristic polynomials are given by the Hecke eigenvalues `heckePoly`. -/
theorem unitary_constituent_galois_representation {T : Type*} [CommRing T] [Algebra O T]
    [Algebra O E] (θ : T →ₐ[O] E) {Frob : Type*} (frob : Frob → GL')
    (heckePoly : Frob → Polynomial T) :
    ∃ r : GL' →* GL (Fin n) E, ∀ w,
      Matrix.charpoly (r (frob w) : Matrix (Fin n) (Fin n) E) = (heckePoly w).map θ.toRingHom := by
  sorry

/-- **`PL.2/hecke-valued-galois-representation`** (Thorne 2012, Propositions 6.6–6.7), template: a
Galois representation valued in the localised Hecke algebra with prescribed characteristic
polynomials at Frobenius elements. -/
theorem hecke_valued_galois_representation {T : Type*} [CommRing T] [IsLocalRing T]
    {Frob : Type*} (frob : Frob → GL') (heckePoly : Frob → Polynomial T) :
    ∃ r : GL' →* GL (Fin n) T, ∀ w,
      Matrix.charpoly (r (frob w) : Matrix (Fin n) (Fin n) T) = heckePoly w := by
  sorry

/-- **`PL.2/unitary-base-change-and-descent`** (Labesse; Clozel–Harris–Taylor Proposition 3.3.2;
Geraghty Lemma 2.25), template: every Hecke eigensystem through a non-Eisenstein ideal comes from
an automorphic representation of `GL_n(𝔸_L)` with the same Galois representation. -/
theorem unitary_base_change_and_descent (D : AutomorphyData (GL' →* GL (Fin n) E))
    {T : Type*} [CommRing T] (θ : T →+* E) {Frob : Type*} (frob : Frob → GL')
    (heckePoly : Frob → Polynomial T) (r : GL' →* GL (Fin n) E) (hr : IsAbsIrred r)
    (hpoly : ∀ w, Matrix.charpoly (r (frob w) : Matrix (Fin n) (Fin n) E) = (heckePoly w).map θ) :
    IsAutomorphic D r := by
  sorry

/-- **`PL.2/ordinary-forms-free-over-lambda`** (Thorne 2012, Proposition 8.2), template. -/
theorem ordinary_forms_free_over_lambda (Λ S : Type*) [CommRing Λ] [AddCommGroup S] [Module Λ S]
    [Module.Finite Λ S] [IsLocalRing Λ] : Module.Free Λ S := by
  sorry

/-- **`PL.2/hida-classicality`** (Geraghty Lemmas 2.6.4, 2.2.6), template: specialisation of the
big ordinary Hecke algebra at level `c` is surjective. -/
theorem hida_classicality {T : ℕ → Type*} [∀ c, CommRing (T c)] (π : ∀ c, T (c + 1) →+* T c)
    (hsurj : ∀ c, Function.Surjective (π c)) (c : ℕ) :
    Function.Surjective (bigOrdinaryHeckeAlgebra.specialize π c) := by
  sorry

/-- **`PL.2/ordinary-hecke-galois-representation`** (Thorne 2012, Propositions 8.4–8.5), template:
a representation over the big ordinary Hecke algebra whose specialisations are the given ones. -/
theorem ordinary_hecke_galois_representation {T : ℕ → Type*} [∀ c, CommRing (T c)]
    (π : ∀ c, T (c + 1) →+* T c) (rc : ∀ c, GL' →* GL (Fin n) (T c))
    (hcompat : ∀ c, (Matrix.GeneralLinearGroup.map (π c)).comp (rc (c + 1)) = rc c) :
    ∃ r : GL' →* GL (Fin n) (bigOrdinaryHeckeAlgebra π), ∀ c,
      (Matrix.GeneralLinearGroup.map (bigOrdinaryHeckeAlgebra.specialize π c)).comp r = rc c := by
  sorry

end DefiniteUnitaryTheorems

section PatchingTheorems

variable {R T : Type*} [CommRing R] [CommRing T]

/-- **`PL.3/adequate-taylor-wiles-primes`** (Thorne 2012 Proposition 4.4; Thorne 2017
Proposition 7.1), template: for every level `N` there is a Taylor–Wiles datum of level at least
`N` with `q` places. -/
theorem adequate_taylor_wiles_primes {P k : Type*} [Field k] (n l q N : ℕ) :
    ∃ D : TaylorWilesDatum P k n l, D.Q.card = q ∧ N ≤ D.level := by
  sorry

/-- **`PL.3/taylor-wiles-primes-two-adic`** (Thorne 2017, Proposition 2.21), template. -/
theorem taylor_wiles_primes_two_adic {P k : Type*} [Field k] (n q N : ℕ) :
    ∃ D : TaylorWilesDatum P k n 2, D.Q.card = q ∧ N ≤ D.level := by
  sorry

/-- **`PL.3/minimal-r-equals-t`** (Thorne 2012, Theorem 6.8), template: `R^univ_𝒮 → T_m` is
surjective with nilpotent kernel, so every point of `R` on the components through a Hecke point
factors through `T`. -/
theorem minimal_r_equals_t (φ : R →+* T) (hsurj : Function.Surjective φ) :
    ∀ x ∈ RingHom.ker φ, IsNilpotent x := by
  sorry

/-- **`PL.3/ordinary-r-equals-t`** (Thorne 2012, Theorem 8.6), template, over `Λ`. -/
theorem ordinary_r_equals_t (Λ : Type*) [CommRing Λ] [Algebra Λ R] [Algebra Λ T]
    (φ : R →ₐ[Λ] T) (hsurj : Function.Surjective φ) :
    ∀ x ∈ RingHom.ker φ.toRingHom, IsNilpotent x := by
  sorry

/-- **`PL.3/revised-adequacy-r-equals-t`** (Thorne 2017, Proposition 7.2), template. -/
theorem revised_adequacy_r_equals_t (φ : R →+* T) (hsurj : Function.Surjective φ) :
    ∀ x ∈ RingHom.ker φ, IsNilpotent x := by
  sorry

end PatchingTheorems

section LiftingTheorems

variable {GF E k : Type*} [Group GF] [Field E] [Field k] {n : ℕ}
variable (D : AutomorphyData (GF →* GL (Fin n) E)) (red : (GF →* GL (Fin n) E) → GF →* GL (Fin n) k)
variable {Pl : Type*} {Rv : Pl → Type*} [∀ v, CommRing (Rv v)] {B : Type*} [CommRing B]

/-- **`PL.4/minimal-automorphy-lifting`** (Thorne 2012 Theorem 7.1 = BLGGT14 Theorem 2.3.1):
`x v`, `y v` are the points of `ρ|G_{F_v}` and `ρ′|G_{F_v}` on the local lifting rings. -/
theorem minimal_automorphy_lifting (ρ ρ' : GF →* GL (Fin n) E) (hred : red ρ = red ρ')
    (hirr : IsAbsIrred (red ρ)) (x y : ∀ v, Rv v →+* B) (hloc : ∀ v, Connects (y v) (x v))
    (h' : IsAutomorphicOfLevelPotentiallyPrimeTo D ρ') :
    IsAutomorphicOfLevelPotentiallyPrimeTo D ρ := by
  sorry

/-- **`PL.4/two-adic-automorphy-lifting`** (Thorne 2017, Theorem 5.1), template; strong residual
oddness at a real place is the hypothesis on `A` (the matrix of `r̄(c_v)`). -/
theorem two_adic_automorphy_lifting (ρ ρ' : GF →* GL (Fin n) E) (hred : red ρ = red ρ')
    (A : Matrix (Fin n) (Fin n) k) (hodd : IsStronglyResiduallyOdd A) (x y : ∀ v, Rv v →+* B)
    (hloc : ∀ v, Connects (y v) (x v)) (h' : IsAutomorphic D ρ') : IsAutomorphic D ρ := by
  sorry

/-- **`PL.4/relaxed-adequacy`** (Boxer–Calegari–Gee), template: the Taylor–Wiles primes exist under
the relaxed adequacy, as in `adequate_taylor_wiles_primes`. -/
theorem relaxed_adequacy {P : Type*} (n l q N : ℕ) :
    ∃ D : TaylorWilesDatum P k n l, D.Q.card = q ∧ N ≤ D.level := by
  sorry

variable {GKv : Pl → Type*} [∀ v, Group (GKv v)] {Uv : Pl → Type*} [∀ v, CommGroup (Uv v)]

/-- **`PL.4/ordinary-automorphy-lifting`** (BLGGT14 Theorem 2.4.1 = Thorne 2012 Theorem 9.1). -/
theorem ordinary_automorphy_lifting (dec : ∀ v, GKv v →* GF) (art : ∀ v, Uv v →* GKv v)
    (alg : ∀ v, Fin n → Uv v →* Eˣ) (ρ ρ' : GF →* GL (Fin n) E) (hred : red ρ = red ρ')
    (hirr : IsAbsIrred (red ρ)) (hord : IsOrdinaryOfWeight dec art alg ρ)
    (h' : IsOrdinarilyAutomorphic D ρ') : IsOrdinarilyAutomorphic D ρ := by
  sorry

/-- **`PL.4/minimal-finiteness`** (Thorne 2012 Theorem 10.1 = BLGGT14 Theorem 2.3.2), template:
the universal ring `R` is finite over `O`. -/
theorem minimal_finiteness (O R : Type*) [CommRing O] [CommRing R] [Algebra O R]
    [IsLocalRing R] [IsNoetherianRing R] : Module.Finite O R := by
  sorry

/-- **`PL.4/ordinary-finiteness`** (Thorne 2012 Theorem 10.2 = BLGGT14 Theorem 2.4.2),
template. -/
theorem ordinary_finiteness (O R : Type*) [CommRing O] [CommRing R] [Algebra O R]
    [IsLocalRing R] [IsNoetherianRing R] : Module.Finite O R := by
  sorry

/-- **`PL.4/characteristic-zero-lifts`** (BLGGT14 Proposition 1.5.1 and the Khare–Wintenberger
argument): a finite `O`-algebra of Krull dimension at least one with `O` a complete DVR has a
point in a finite extension of `Frac O`, i.e. a minimal prime with torsion-free quotient. -/
theorem characteristic_zero_lifts (O R : Type*) [CommRing O] [IsDomain O]
    [IsDiscreteValuationRing O] [CommRing R] [Algebra O R] [Module.Finite O R]
    (hdim : 1 ≤ ringKrullDim R) :
    ∃ P ∈ minimalPrimes R, ringKrullDim (R ⧸ P) = 1 := by
  sorry

end LiftingTheorems

section PotentialAutomorphy

variable {GF E k : Type*} [Group GF] [Field E] [Field k] {n : ℕ}
variable (D : AutomorphyData (GF →* GL (Fin n) E)) (red : (GF →* GL (Fin n) E) → GF →* GL (Fin n) k)

/-- **`PL.5/dwork-potential-ordinary-automorphy`** (BLGGT14 Theorem 3.1.2), template: over some
finite extension (`ι : G_{F′} → G_F`), the restricted residual representation is ordinarily
automorphic. -/
theorem dwork_potential_ordinary_automorphy (rbar : GF →* GL (Fin n) k) :
    ∃ (GF' : Type) (_ : Group GF') (ι : GF' →* GF)
      (D' : AutomorphyData (GF' →* GL (Fin n) E))
      (red' : (GF' →* GL (Fin n) E) → GF' →* GL (Fin n) k),
      ∃ π : D'.Aut, D'.iotaOrdinary π ∧ red' (D'.galois π) = rbar.comp ι := by
  sorry

/-- **`PL.5/ordinary-lifts-prescribed-local`** (BLGGT14 Proposition 3.2.1), template: a lift of
`r̄` ordinary of weight `alg` at the places above `l`. -/
theorem ordinary_lifts_prescribed_local {Pl : Type*} {GKv : Pl → Type*} [∀ v, Group (GKv v)]
    {Uv : Pl → Type*} [∀ v, CommGroup (Uv v)] (dec : ∀ v, GKv v →* GF) (art : ∀ v, Uv v →* GKv v)
    (alg : ∀ v, Fin n → Uv v →* Eˣ) (rbar : GF →* GL (Fin n) k) (hirr : IsAbsIrred rbar) :
    ∃ ρ : GF →* GL (Fin n) E, red ρ = rbar ∧ IsOrdinaryOfWeight dec art alg ρ := by
  sorry

/-- **`PL.5/tensor-product-trick-lifting`** (BLGGT14 Proposition 4.1.1), template; `pd` records
potential diagonalizability of the local Galois representation of a seed. -/
theorem tensor_product_trick_lifting (pd : D.Aut → Prop) (ρ ρ' : GF →* GL (Fin n) E)
    (hred : red ρ = red ρ') (hirr : IsAbsIrred (red ρ)) (h' : IsAutomorphicOfLevelPrimeTo D ρ') :
    IsPotentiallyDiagonalizablyAutomorphic D pd ρ := by
  sorry

/-- **`PL.5/pd-automorphy-lifting`** (BLGGT14 Theorem 4.2.1), template. -/
theorem pd_automorphy_lifting (pd : D.Aut → Prop) (ρ ρ' : GF →* GL (Fin n) E)
    (hred : red ρ = red ρ') (hirr : IsAbsIrred (red ρ))
    (h' : IsOrdinarilyAutomorphic D ρ' ∨ IsPotentiallyDiagonalizablyAutomorphic D pd ρ') :
    IsPotentiallyDiagonalizablyAutomorphic D pd ρ := by
  sorry

end PotentialAutomorphy

section ResiduallyReducible

variable {Γ k : Type*} [Group Γ] [Field k] {n : ℕ}

/-- **`PL.6/character-sums-primitive`** (Newton–Thorne 2021, Lemma 5.1). -/
theorem character_sums_primitive (χ : Fin n → Γ →* kˣ) (ρ : Γ →* GL (Fin n) k)
    (hρ : ∀ g, (ρ g : Matrix (Fin n) (Fin n) k) = Matrix.diagonal fun i => (χ i g : k))
    (hord : ∀ i j, i ≠ j → ∀ m : ℕ, 0 < m → m ≤ n → (χ i / χ j) ^ m ≠ 1) :
    IsPrimitive ρ := by
  sorry

variable {Λ R : Type*} [CommRing Λ] [CommRing R] [Algebra Λ R]

/-- **`PL.6/pseudodeformation-restriction-finite`** (Newton–Thorne 2021, Lemma 5.3, after
Chenevier), in the subring form: for `Σ ≤ Γ` of finite index, the characteristic-polynomial
subring of `Γ` is finite over that of `Σ` (for `R` complete noetherian local). -/
theorem pseudodeformation_restriction_finite [IsLocalRing R] [IsNoetherianRing R]
    (r : Γ →* GL (Fin n) R) (Sg : Subgroup Γ) (hSg : Sg.FiniteIndex) :
    ∃ h : charPolySubring Λ (r.comp Sg.subtype) ≤ charPolySubring Λ r,
      (Subalgebra.inclusion h).toRingHom.Finite := by
  sorry

/-- **`PL.6/reducible-locus-dimension`** (Allen–Newton–Thorne, Lemma 3.6), template with the
bound `b = n[F⁺ : ℚ] − d₀`. -/
theorem reducible_locus_dimension {n₁ n₂ : ℕ} (r : Γ →* GL (Fin n₁ ⊕ Fin n₂) R) (lam : R)
    (d d₀ : ℕ) :
    ringKrullDim (R ⧸ (reducibilityIdeal r ⊔ Ideal.span {lam})) ≤ ((n₁ + n₂) * d - d₀ : ℕ) := by
  sorry

/-- **`PL.6/large-quotients-contain-generic-primes`**, part (2) (Thorne 2015, Lemma 1.9), in its
true generality: a complete noetherian local ring of dimension `d ≥ 1` has a dimension-one prime
avoiding countably many ideals of smaller dimension. -/
theorem dimension_one_primes_avoiding [IsLocalRing R] [IsNoetherianRing R]
    [IsAdicComplete (IsLocalRing.maximalIdeal R) R] (d : ℕ) (hd : 1 ≤ d)
    (hdim : ringKrullDim R = d) (I : ℕ → Ideal R)
    (hI : ∀ i, ringKrullDim (R ⧸ I i) ≤ (d - 1 : ℕ)) :
    ∃ P : Ideal R, P.IsPrime ∧ ringKrullDim (R ⧸ P) = 1 ∧ ∀ i, ¬ I i ≤ P := by
  sorry

/-- **`PL.6/large-quotients-contain-generic-primes`**, part (3) (Allen–Newton–Thorne, Lemma 3.9),
template. -/
theorem large_quotients_contain_generic_primes {Sl : Type*} {I : Sl → Type*} [∀ v, Group (I v)]
    (l : ℕ) (ψ : ∀ v, Fin n → I v →* Rˣ) (r : Γ →* GL (Fin n) R) :
    ∃ (P : Ideal R) (_ : P.IsPrime), IsGenericPrime l ψ r P := by
  sorry

/-- **`PL.6/genericity-under-restriction`** (Thorne 2015, Proposition 5.3): absolute
irreducibility at a generic prime survives restriction to open subgroups. -/
theorem generic_r_is_irreducible_under_restriction (P : Ideal R) [P.IsPrime]
    (r : Γ →* GL (Fin n) R) (N : Subgroup Γ) (hN : N.FiniteIndex)
    (hirr : IsIrreducibleMap (toAlgClosure P) r) {Sl : Type*} {I : Sl → Type*}
    [∀ v, Group (I v)] (ψ : ∀ v, Fin n → I v →* (R ⧸ P)ˣ) (hgen : IsGenericAtL ψ) :
    IsIrreducibleMap (toAlgClosure P) (r.comp N.subtype) := by
  sorry

/-- **`PL.6/reducible-twisting-and-base-change`** (Thorne 2015, Lemma 3.36), template: the
universal ring with variable determinant is the fixed-determinant ring completed-tensored with the
Iwasawa algebra of `Δ/(c+1)`, here as an equivalence of rings supplied by twisting. -/
theorem reducible_twisting_and_base_change (O Rψ Iw : Type*) [CommRing O] [CommRing Rψ]
    [CommRing Iw] [Algebra O Rψ] [Algebra O Iw] [Algebra O R] :
    Nonempty (R ≃ₐ[O] TensorProduct O Rψ Iw) := by
  sorry

/-- **`PL.6/generic-prime-r-equals-t`** (Allen–Newton–Thorne Theorem 4.1; Thorne 2015 Theorem 4.19,
Corollary 4.20), template. `J` stands for `J_{𝒮₁} R^univ`, the extension to `R = R^univ` of
`J_{𝒮₁} = ker(P_{𝒮₁} → T_m)` (there is no map `R^univ → T_m` in the residually reducible case):
every prime contained in a generic prime containing `J R^univ` contains `J R^univ`. -/
theorem generic_prime_r_equals_t {Sl : Type*} {I : Sl → Type*} [∀ v, Group (I v)] (l : ℕ)
    (ψ : ∀ v, Fin n → I v →* Rˣ) (r : Γ →* GL (Fin n) R) (J P : Ideal R) [P.IsPrime]
    (hJ : J ≤ P) (hgen : IsGenericPrime l ψ r P) (Q : Ideal R) (hQ : Q.IsPrime) (hQP : Q ≤ P) :
    J ≤ Q := by
  sorry

end ResiduallyReducible

section ResiduallyReducibleLifting

variable {GF E k : Type*} [Group GF] [Field E] [Field k] {n : ℕ}
variable (D : AutomorphyData (GF →* GL (Fin n) E)) (red : (GF →* GL (Fin n) E) → GF →* GL (Fin n) k)

/-- **`PL.7/ordinary-steinberg-finiteness`** (Allen–Newton–Thorne, Theorem 6.2), template. -/
theorem ordinary_steinberg_finiteness (Λ R : Type*) [CommRing Λ] [CommRing R] [Algebra Λ R]
    [IsLocalRing R] [IsNoetherianRing R] : Module.Finite Λ R := by
  sorry

/-- **`PL.7/residually-reducible-automorphy-lifting`** (Allen–Newton–Thorne, Theorem 1.1). -/
theorem residually_reducible_automorphy_lifting {Pl : Type*} {GKv : Pl → Type*}
    [∀ v, Group (GKv v)] {Uv : Pl → Type*} [∀ v, CommGroup (Uv v)] (dec : ∀ v, GKv v →* GF)
    (art : ∀ v, Uv v →* GKv v) (alg : ∀ v, Fin n → Uv v →* Eˣ) (ρ ρ' : GF →* GL (Fin n) E)
    (hred : red ρ = red ρ') (hprim : IsPrimitive (red ρ)) (hord : IsOrdinaryOfWeight dec art alg ρ)
    (h' : IsOrdinarilyAutomorphic D ρ') : IsOrdinarilyAutomorphic D ρ := by
  sorry

/-- **`PL.7/two-constituent-automorphy-lifting`** (Thorne 2015, Theorem 7.1). -/
theorem two_constituent_automorphy_lifting {Pl : Type*} {GKv : Pl → Type*}
    [∀ v, Group (GKv v)] {Uv : Pl → Type*} [∀ v, CommGroup (Uv v)] (dec : ∀ v, GKv v →* GF)
    (art : ∀ v, Uv v →* GKv v) (alg : ∀ v, Fin n → Uv v →* Eˣ) (ρ ρ' : GF →* GL (Fin n) E)
    (hred : red ρ = red ρ') (hprim : IsPrimitive (red ρ)) (hord : IsOrdinaryOfWeight dec art alg ρ)
    (h' : IsOrdinarilyAutomorphic D ρ') : IsAutomorphic D ρ := by
  sorry

/-- **`PL.7/sum-of-characters-finiteness`** (Newton–Thorne 2021, Theorem 5.2), template. -/
theorem sum_of_characters_finiteness (Λ R : Type*) [CommRing Λ] [CommRing R] [Algebra Λ R]
    (χ : Fin n → GF →* kˣ) (hord : ∀ i j, i ≠ j → ∀ m : ℕ, 0 < m → m ≤ 2 * n → (χ i / χ j) ^ m ≠ 1) :
    Module.Finite Λ R := by
  sorry

/-- **`PL.7/ordinary-lifts-every-weight`** (Newton–Thorne 2021, Corollary 5.4, corrected). -/
theorem ordinary_lifts_every_weight {Pl : Type*} {GKv : Pl → Type*} [∀ v, Group (GKv v)]
    {Uv : Pl → Type*} [∀ v, CommGroup (Uv v)] (dec : ∀ v, GKv v →* GF) (art : ∀ v, Uv v →* GKv v)
    (alg : ∀ v, Fin n → Uv v →* Eˣ) (rbar : GF →* GL (Fin n) k) :
    ∃ ρ : GF →* GL (Fin n) E, red ρ = rbar ∧ IsOrdinaryOfWeight dec art alg ρ := by
  sorry

/-- **`PL.7/unrestricted-ring-dimension-bound`** (Newton–Thorne 2021, Corollary 5.5), template. -/
theorem unrestricted_ring_dimension_bound (R : Type*) [CommRing R] (varpi : R) (d : ℕ) :
    ringKrullDim (R ⧸ Ideal.span {varpi}) ≤ (n * d + n : ℕ) := by
  sorry

/-- **`PL.7/reducible-locus-small`** (Newton–Thorne 2021, Proposition 5.6), template. -/
theorem reducible_locus_small (A : Type*) [CommRing A] [IsDomain A] (d dR : ℕ) :
    ringKrullDim A ≤ (n * d + n - dR : ℕ) := by
  sorry

/-- **`PL.7/generic-primes-large-quotients`** (Newton–Thorne 2021, Theorem 5.7), template. -/
theorem generic_primes_large_quotients {Γ R : Type*} [Group Γ] [CommRing R] {Sl : Type*}
    {I : Sl → Type*} [∀ v, Group (I v)] (l : ℕ) (ψ : ∀ v, Fin n → I v →* Rˣ)
    (r : Γ →* GL (Fin n) R) (K : Ideal R) :
    ∃ (P : Ideal R) (_ : P.IsPrime), K ≤ P ∧ IsGenericPrime l ψ r P := by
  sorry

/-- **`PL.7/global-lifts-schur`** (Bellovin–Gee, Corollary 5.1.1, Schur form), template. -/
theorem global_lifts_schur (R : Type*) [CommRing R] (rbar : GF →* GL (Fin n) k) (cF : GF →* GF)
    (μ : GF →* kˣ) (hS : IsSchur rbar cF μ) : 1 ≤ ringKrullDim R := by
  sorry

/-- **`PL.7/prescribed-type-lifts`** (Newton–Thorne 2021, Proposition 5.8), template. -/
theorem prescribed_type_lifts (rbar : GF →* GL (Fin n) k) (hprim : IsPrimitive rbar) :
    ∃ π : D.Aut, D.iotaOrdinary π ∧ red (D.galois π) = rbar := by
  sorry

end ResiduallyReducibleLifting

section AdjointSelmer

variable {W E V : Type*} [Group W] [Field E] [AddCommGroup V] [Module E V] {ν : W →* Eˣ}

/-- **`PL.8/bloch-kato-at-generic-places`** (Allen, Remark 1.2.9), template: at a generic place the
Bloch–Kato condition is the whole local cohomology (away from `p`). -/
theorem bloch_kato_at_generic_places (ρ : WeilDeligne W E V ν) (hgen : ρ.IsGeneric)
    {Hv H2 : Type*} [AddCommGroup Hv] [Module E Hv] [FiniteDimensional E Hv] [AddCommGroup H2]
    [Module E H2] (Lf : Submodule E Hv)
    (hEuler : Module.finrank E Hv = Module.finrank E Lf + Module.finrank E H2)
    (hH2 : ∀ x : H2, x = 0) : Lf = ⊤ := by
  sorry

variable {H : Type*} [AddCommGroup H] [Module E H] {P : Type*} {Hv : P → Type*}
  [∀ v, AddCommGroup (Hv v)] [∀ v, Module E (Hv v)]

/-- **`PL.8/pseudodeformation-tangent-comparison`** (Newton–Thorne 2023, Propositions 2.15–2.17),
template: the tangent space of the semistable pseudodeformation ring at the point is the Selmer
group (rationally). -/
theorem pseudodeformation_tangent_comparison (loc : ∀ v, H →ₗ[E] Hv v)
    (Lf : ∀ v, Submodule E (Hv v)) (Tan : Type*) [AddCommGroup Tan] [Module E Tan] :
    Nonempty (Tan ≃ₗ[E] adjointSelmerF loc Lf) := by
  sorry

/-- **`PL.8/adjoint-selmer-vanishing`** (Newton–Thorne 2023, Theorem A), template. -/
theorem adjoint_selmer_vanishing (loc : ∀ v, H →ₗ[E] Hv v) (Lf : ∀ v, Submodule E (Hv v)) :
    adjointSelmerF loc Lf = ⊥ := by
  sorry

/-- **`PL.8/pseudodeformation-ring-regular-at-automorphic-point`**, template: the localisation is
a field (its maximal ideal is zero). -/
theorem pseudodeformation_ring_regular_at_automorphic_point (Rloc : Type*) [CommRing Rloc]
    [IsLocalRing Rloc] [IsNoetherianRing Rloc]
    (htan : Subsingleton (IsLocalRing.CotangentSpace Rloc)) :
    IsLocalRing.maximalIdeal Rloc = ⊥ := by
  sorry

/-- **`PL.8/ordinary-tangent-vectors-h1g`** (Geraghty, Lemma 3.9), template: ordinary tangent
vectors with trivial weight lie in `H¹_g`. -/
theorem ordinary_tangent_vectors_h1g (loc : ∀ v, H →ₗ[E] Hv v) (Lg : ∀ v, Submodule E (Hv v))
    (Ord : Submodule E H) : Ord ≤ adjointSelmerG loc Lg := by
  sorry

end AdjointSelmer

section RigidTheorems

variable {R T : Type*} [CommRing R] [CommRing T]

/-- **`PL.9/rigid-r-equals-t`** (Liu–Tian–Xiao–Zhang–Zhu, Theorem 3.6.3), template: `R → T` is an
isomorphism (and both are complete intersections; the middle cohomology is free over `T`). -/
theorem rigid_r_equals_t {P k : Type*} [Field k] {N : ℕ} (Smin Slr Sl : Set P)
    (frob : P → Matrix (Fin N) (Fin N) k) (q : P → k) (allMinimal regularFL unram : P → Prop)
    (hrig : IsRigid Smin Slr Sl frob q allMinimal regularFL unram) (φ : R →+* T)
    (hsurj : Function.Surjective φ) : Function.Injective φ := by
  sorry

/-- **`PL.9/rigidity-for-almost-all-primes`** (Liu–Tian–Xiao–Zhang–Zhu, Corollary 4.1.2,
Proposition 4.2.3, Theorem 4.2.6), template: rigidity holds outside a finite set of primes. -/
theorem rigidity_for_almost_all_primes {P : Type*} {N : ℕ} (kℓ : ℕ → Type*)
    [∀ ℓ, Field (kℓ ℓ)] (Smin Sl : ℕ → Set P) (frob : ∀ ℓ, P → Matrix (Fin N) (Fin N) (kℓ ℓ))
    (q : ∀ ℓ, P → kℓ ℓ) (allMinimal regularFL unram : ℕ → P → Prop) :
    ∃ S : Finset ℕ, ∀ ℓ, ℓ.Prime → ℓ ∉ S →
      IsRigid (Smin ℓ) ∅ (Sl ℓ) (frob ℓ) (q ℓ) (allMinimal ℓ) (regularFL ℓ) (unram ℓ) := by
  sorry

variable {GF E k : Type*} [Group GF] [Field E] [Field k] {n : ℕ}
variable (D : AutomorphyData (GF →* GL (Fin n) E)) (red : (GF →* GL (Fin n) E) → GF →* GL (Fin n) k)

/-- **`PL.9/generic-local-domain-lifting`** (Le–Le Hung–Levin–Morra, Theorem 9.2.1), template: the
local deformation rings at `p` are domains (`IsDomain (Rp v)`), the residual representation is
automorphic, hence so is `ρ`. -/
theorem generic_local_domain_lifting {Pl : Type*} (Rp : Pl → Type*) [∀ v, CommRing (Rp v)]
    [∀ v, IsDomain (Rp v)] (ρ ρ' : GF →* GL (Fin n) E) (hred : red ρ = red ρ')
    (h' : IsAutomorphic D ρ') : IsAutomorphic D ρ := by
  sorry

/-- **`PL.9/generic-change-of-weight-lifting`** (Le–Le Hung–Levin–Morra, Remark 9.2.2),
template. -/
theorem generic_change_of_weight_lifting (ρ ρ' : GF →* GL (Fin n) E) (hred : red ρ = red ρ')
    (h' : IsAutomorphic D ρ') : IsAutomorphic D ρ := by
  sorry

end RigidTheorems

end TauCeti.Automorphy.Templates
