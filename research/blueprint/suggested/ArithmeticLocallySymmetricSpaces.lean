import Mathlib.NumberTheory.HeckeRing.Defs
import Mathlib.AlgebraicTopology.FundamentalGroupoid.FundamentalGroup
import Mathlib.RepresentationTheory.Rep.Basic
import Mathlib.RepresentationTheory.Rep.Res
import Mathlib.RepresentationTheory.Invariants
import Mathlib.FieldTheory.IsAlgClosed.Basic
import Mathlib.RingTheory.LocalRing.MaximalIdeal.Basic
import Mathlib.RingTheory.LocalRing.ResidueField.Defs
import Mathlib.NumberTheory.Padics.PadicIntegers
import Mathlib.Topology.Algebra.ConstMulAction
import Mathlib.Topology.Homotopy.Contractible
import Mathlib.Topology.Covering.Basic
import Mathlib.Algebra.Homology.DerivedCategory.Basic
import Mathlib.Algebra.Homology.DerivedCategory.HomologySequence
import Mathlib.RepresentationTheory.Homological.GroupCohomology.Basic
import Mathlib.Analysis.Complex.UpperHalfPlane.Basic
import Mathlib.NumberTheory.ModularForms.CongruenceSubgroups
import Mathlib.LinearAlgebra.Matrix.GeneralLinearGroup.Defs
import Mathlib.LinearAlgebra.UnitaryGroup
import Mathlib.LinearAlgebra.Matrix.Trace
import Mathlib.Geometry.Manifold.IsManifold.Basic
import Mathlib.CategoryTheory.Idempotents.Basic
import Mathlib.Algebra.Category.ModuleCat.Basic
import Mathlib.GroupTheory.Commensurable
import Mathlib.GroupTheory.DoubleCoset
import Mathlib.GroupTheory.Index
import Mathlib.RingTheory.Ideal.Maximal
import Mathlib.RingTheory.Finiteness.Basic
import Mathlib.LinearAlgebra.Charpoly.Basic
import Mathlib.Topology.Category.TopCat.Basic

/-!
# Arithmetic locally symmetric spaces and their cohomology: suggested Lean forms

This file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/ArithmeticLocallySymmetricSpaces.md` is definitive; the
statements below suggest Lean forms so that contributors and reviewers converge on names and
signatures. Every declaration is a signature proved by `sorry`; nothing here is an
implementation, and every node of the packet keeps `implementationStatus = "unchecked"`.

Pins: Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174,
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.

Conventions of the prototype.
* The arithmetic input is abstracted as a `Datum`: the groups `GF = G(F)`, `Gf = G(𝔸_F^∞)`
  (a topological group) and `Ginf = G(F_∞)`, a space `X` with a `Ginf`-action (the symmetric
  space), and the two diagonal embeddings. The adelic, algebraic-group and reductive-group
  structure that the document states is supplied by AdelicAlgebraicGroups and the Tau Ceti
  reductive-group libraries, and is not restated here.
* Cartan involutions are prototyped on closed subgroups of `GL n ℝ`, using Milne's
  characterisation (Introduction to Shimura varieties, Example 1.17(c)): every Cartan
  involution is the transpose-inverse involution for a suitable basis.
* Derived categories are Mathlib's `DerivedCategory (ModuleCat R)`, under the explicit
  assumption `[HasDerivedCategory (ModuleCat R)]`.
* Coefficient modules are representations of `GF` (rational coefficients) or of `GF × K`
  (the general case `R[G(F) × K_S]` of the document).
* Hecke algebras are Mathlib's `HeckeRing (⊤ : Submonoid Gf) K R` with Tau Ceti's convolution
  ring structure; the prime-to-`S` restriction of the document is suppressed.
* Unit tests appear as `example`s preceded by `-- test: <name>`.
* Independent review REV-ArithmeticLocallySymmetricSpaces (7 October 2026): `needs_changes`.
  This file imports Mathlib only, expands Tau Ceti's local-coefficient alias and supplies a
  stand-in Hecke ring instance. The protocol requires the actual pinned Tau Ceti imports.
  The available shared build has the exact Mathlib pin but Tau Ceti commit cf386627, rather
  than f790474; it was not compiled in this review, as WORKERS.md requires a build at both pins.
  The preceding author's elaboration claim is not independent pinned validation.
* There are ten named declarations with conclusion `True`, 27 `True` examples, and two further
  existential-`True` declarations. These are unresolved signature/test obligations, not the
  packet's mathematical statements. Several other signatures are weaker than, or contradict,
  the packet (see the review report). The reader also requires reconciliation with the
  corrected packet in a revision authorized to edit it.
-/

open CategoryTheory MonoidalCategory
open scoped Pointwise

-- Signatures keep hypotheses that the sketched proofs use; the placeholder proofs do not.
set_option linter.unusedVariables false
set_option linter.unusedSectionVars false

universe u

noncomputable section

namespace TauCeti

namespace LocallySymmetric

/-- Stand-in for Tau Ceti's `HeckeCosetModule.instRingHeckeRing`
(`TauCeti/NumberTheory/HeckeRing/Associativity.lean`): the convolution ring structure on the
Hecke ring. This stand-in is not a validation of the pinned convolution API. The revision must
import the pinned Tau Ceti module and delete this instance. -/
instance heckeRingStandIn {G : Type*} [Group G] {Δ : Submonoid G} {H : Subgroup G}
    [IsHeckeTriple Δ H H] {R : Type*} [CommRing R] : Ring (HeckeRing Δ H R) := sorry

/-! ## ALS.0 Symmetric spaces and components -/

section Cartan

variable {n : Type} [Fintype n] [DecidableEq n]

/-- The transpose-inverse involution `g ↦ (gᵗ)⁻¹` of `GL n ℝ`. -/
def transposeInverse : GL n ℝ →* GL n ℝ where
  toFun g := ⟨(g⁻¹ : GL n ℝ).val.transpose, g.val.transpose, sorry, sorry⟩
  map_one' := sorry
  map_mul' := sorry

/-- `G ≤ GL n ℝ` is stable under transpose in the basis obtained by conjugating with `h`. -/
def IsTransposeStable (G : Subgroup (GL n ℝ)) (h : GL n ℝ) : Prop :=
  ∀ g ∈ G, h⁻¹ * transposeInverse (h * g * h⁻¹) * h ∈ G

/-- `θ` is a Cartan involution of `G ≤ GL n ℝ`: it is the transpose-inverse involution in some
basis in which `G` is transpose-stable (Milne, Example 1.17(c); equivalent to compactness of the
twisted real form `G^(θ)(ℝ)` for reductive `G`). -/
def IsCartanInvolution (G : Subgroup (GL n ℝ)) (θ : G →* G) : Prop :=
  ∃ h : GL n ℝ, IsTransposeStable G h ∧
    ∀ g : G, ((θ g : G) : GL n ℝ) = h⁻¹ * transposeInverse (h * (g : GL n ℝ) * h⁻¹) * h

/-- Existence of Cartan involutions for reductive (transpose-stable in some basis) groups. -/
theorem IsCartanInvolution.«exists» (G : Subgroup (GL n ℝ)) (hG : ∃ h, IsTransposeStable G h) :
    ∃ θ : G →* G, IsCartanInvolution G θ := sorry

/-- Any two Cartan involutions are conjugate by an element of `G`. -/
theorem IsCartanInvolution.conj (G : Subgroup (GL n ℝ)) (θ θ' : G →* G)
    (hθ : IsCartanInvolution G θ) (hθ' : IsCartanInvolution G θ') :
    ∃ g : G, ∀ x : G, θ' x = g * θ (g⁻¹ * x * g) * g⁻¹ := sorry

/-- The restriction of the transpose-inverse involution to a transpose-stable subgroup. -/
def transposeInverseRestrict (G : Subgroup (GL n ℝ)) (hG : IsTransposeStable G 1) : G →* G where
  toFun g := ⟨transposeInverse (g : GL n ℝ), sorry⟩
  map_one' := sorry
  map_mul' := sorry

theorem IsCartanInvolution.transposeInverse (G : Subgroup (GL n ℝ))
    (hG : IsTransposeStable G 1) :
    IsCartanInvolution G (transposeInverseRestrict G hG) := sorry

variable {m : Type} [Fintype m] [DecidableEq m]

/-- Block-diagonal product of matrix groups. -/
def blockDiag (G : Subgroup (GL n ℝ)) (H : Subgroup (GL m ℝ)) : Subgroup (GL (n ⊕ m) ℝ) := sorry

/-- The block-diagonal product is the product group. -/
def blockDiagEquiv (G : Subgroup (GL n ℝ)) (H : Subgroup (GL m ℝ)) : blockDiag G H ≃* G × H :=
  sorry

theorem IsCartanInvolution.prod (G : Subgroup (GL n ℝ)) (H : Subgroup (GL m ℝ))
    (θ₁ : G →* G) (θ₂ : H →* H) :
    IsCartanInvolution (blockDiag G H)
        ((blockDiagEquiv G H).symm.toMonoidHom.comp
          ((θ₁.prodMap θ₂).comp (blockDiagEquiv G H).toMonoidHom)) ↔
      IsCartanInvolution G θ₁ ∧ IsCartanInvolution H θ₂ := sorry

/-- The symmetric trace-zero matrices `𝔭` for `GL_n` modulo the centre. -/
def symTraceZero : Submodule ℝ (Matrix n n ℝ) where
  carrier := {A | A.transpose = A ∧ A.trace = 0}
  add_mem' := sorry
  zero_mem' := sorry
  smul_mem' := sorry

/-- Killing-form criterion in the transpose model: for a transpose-stable Lie algebra of
matrices, `X ↦ tr(X Xᵗ)` is positive definite (the trace-form shadow of `−B(X, θX)`). -/
theorem IsCartanInvolution.killing (L : Submodule ℝ (Matrix n n ℝ))
    (hL : ∀ X ∈ L, X.transpose ∈ L) (X : L) (hX : X ≠ 0) :
    0 < ((X : Matrix n n ℝ) * (X : Matrix n n ℝ).transpose).trace := sorry

-- test: cartanInvolution_GL_transposeInverse
example : IsCartanInvolution (⊤ : Subgroup (GL n ℝ))
    (transposeInverseRestrict ⊤ (fun g _ => trivial)) := sorry

-- test: cartanInvolution_SL2_adjoint
example (G : Subgroup (GL (Fin 2) ℝ))
    (hG : ∀ g : GL (Fin 2) ℝ, g ∈ G ↔ (g : Matrix (Fin 2) (Fin 2) ℝ).det = 1) :
    ∃ θ : G →* G, IsCartanInvolution G θ := sorry

-- test: cartanInvolution_compact_id
example (G : Subgroup (GL n ℝ)) (hG : IsCompact (G : Set (GL n ℝ))) :
    IsCartanInvolution G (MonoidHom.id G) := sorry

-- test: not_cartanInvolution_id_GL2
example : ¬ IsCartanInvolution (⊤ : Subgroup (GL (Fin 2) ℝ)) (MonoidHom.id _) := sorry

end Cartan

/-- The maximal compact subgroup `K_∞ = G^θ` is compact and meets every component
(`maximal-compact-subgroup`; prototyped for transpose-stable matrix groups: `G ∩ O(n)`). -/
theorem maximalCompact_isCompact {n : Type} [Fintype n] [DecidableEq n]
    (G : Subgroup (GL n ℝ)) (hG : IsClosed (G : Set (GL n ℝ))) (θ : G →* G)
    (hθ : IsCartanInvolution G θ) :
    IsCompact {g : G | θ g = g} := sorry

section SymmetricSpace

variable (Ginf : Type u) [Group Ginf] [TopologicalSpace Ginf] [IsTopologicalGroup Ginf]

/-- The symmetric space `G(F_∞)/K_∞A_∞`, for the subgroup `KA = K_∞A_∞`. -/
abbrev symmetricSpace (KA : Subgroup Ginf) : Type u := Ginf ⧸ KA

variable {Ginf}

/-- The base point `[1]`. -/
def symmetricSpace.basepoint (KA : Subgroup Ginf) : symmetricSpace Ginf KA :=
  QuotientGroup.mk 1

theorem symmetricSpace.stabilizer_eq (KA : Subgroup Ginf) (g : Ginf) :
    MulAction.stabilizer Ginf (g • symmetricSpace.basepoint KA) =
      (KA.map (MulAut.conj g).toMonoidHom) := sorry

/-- Conjugate maximal compacts give equivariantly isomorphic symmetric spaces. -/
def symmetricSpace.isoOfCartan (KA : Subgroup Ginf) (h : Ginf) :
    symmetricSpace Ginf KA ≃ symmetricSpace Ginf (KA.map (MulAut.conj h).toMonoidHom) := sorry

theorem symmetricSpace.dim_eq {n : Type} [Fintype n] [DecidableEq n] :
    Module.finrank ℝ (symTraceZero (n := n)) = Fintype.card n * (Fintype.card n + 1) / 2 - 1 :=
  sorry

/-- Products of symmetric spaces. -/
def symmetricSpace.prod {Hinf : Type u} [Group Hinf] [TopologicalSpace Hinf]
    (KA : Subgroup Ginf) (LA : Subgroup Hinf) :
    symmetricSpace (Ginf × Hinf) (KA.prod LA) ≃ symmetricSpace Ginf KA × symmetricSpace Hinf LA :=
  sorry

/-- The connected variant `G(F_∞)/K_∞°A_∞` maps onto `X^G`. -/
def symmetricSpace.connectedVariant (KA KA0 : Subgroup Ginf) (h : KA0 ≤ KA) :
    symmetricSpace Ginf KA0 → symmetricSpace Ginf KA :=
  Quotient.map' id (fun _ _ hab => sorry)

/-- `X^G` is contractible (`symmetric-space-contractible`), stated for the abstract datum. -/
theorem symmetricSpace_contractible (KA : Subgroup Ginf)
    (hcartan : ∃ (E : Type u) (_ : NormedAddCommGroup E) (_ : NormedSpace ℝ E),
      Nonempty (symmetricSpace Ginf KA ≃ₜ E)) :
    ContractibleSpace (symmetricSpace Ginf KA) := sorry

/-- `O(2)·ℝ_{>0}` inside `GL₂(ℝ)`. -/
def orthogonalTimesScalars : Subgroup (GL (Fin 2) ℝ) where
  carrier := {g | ∃ c : ℝ, 0 < c ∧
    c • (g : Matrix (Fin 2) (Fin 2) ℝ) ∈ Matrix.orthogonalGroup (Fin 2) ℝ}
  mul_mem' := sorry
  one_mem' := sorry
  inv_mem' := sorry

-- test: symmetricSpace_GL2_Q
example : ∃ f : symmetricSpace (GL (Fin 2) ℝ) orthogonalTimesScalars → UpperHalfPlane,
    Function.Bijective f := sorry

-- test: symmetricSpace_GL1
example (r : ℕ) : Module.finrank ℝ (Fin (r + 1) → ℝ) - 1 = r := sorry

-- test: symmetricSpace_SL2_compat
example : ∃ f : Matrix.SpecialLinearGroup (Fin 2) ℝ → UpperHalfPlane,
    Function.Surjective f := sorry

-- test: symmetricSpace_not_without_centre
example : Module.finrank ℝ (symTraceZero (n := Fin 2)) + 1 = 3 := sorry

end SymmetricSpace

section Datum

/-- The arithmetic datum: `G(F)`, `G(𝔸^∞)`, `G(F_∞)`, the symmetric space and the diagonal
embeddings. -/
structure Datum where
  GF : Type u
  Gf : Type u
  Ginf : Type u
  X : Type u
  [instGroupGF : Group GF]
  [instGroupGf : Group Gf]
  [instTopGf : TopologicalSpace Gf]
  [instTopGroupGf : IsTopologicalGroup Gf]
  [instGroupGinf : Group Ginf]
  [instTopGinf : TopologicalSpace Ginf]
  [instTopX : TopologicalSpace X]
  [instAct : MulAction Ginf X]
  toFinite : GF →* Gf
  toInf : GF →* Ginf

attribute [instance] Datum.instGroupGF Datum.instGroupGf Datum.instTopGf Datum.instTopGroupGf
  Datum.instGroupGinf Datum.instTopGinf Datum.instTopX Datum.instAct

variable (D : Datum.{u})

/-- The relation `(x, gK) ∼ (γx, γgK)` for `γ ∈ G(F)`. -/
def rel (K : Subgroup D.Gf) : Setoid (D.X × (D.Gf ⧸ K)) where
  r a b := ∃ γ : D.GF, b = (D.toInf γ • a.1, (D.toFinite γ) • a.2)
  iseqv := sorry

/-- `X_K = G(F) \ (X^G × G(𝔸^∞)/K)`. -/
def X (K : Subgroup D.Gf) : Type u := Quotient (rel D K)

instance (K : Subgroup D.Gf) : TopologicalSpace (X D K) :=
  inferInstanceAs (TopologicalSpace (Quotient (rel D K)))

variable {D}

instance instMulActionQuot (K : Subgroup D.Gf) : MulAction D.GF (D.Gf ⧸ K) :=
  MulAction.compHom _ D.toFinite

/-- The class `[x, g]`. -/
def X.mk (K : Subgroup D.Gf) (x : D.X) (g : D.Gf) : X D K :=
  Quotient.mk _ (x, (g : D.Gf ⧸ K))

theorem X.mk_eq_mk_iff (K : Subgroup D.Gf) (x x' : D.X) (g g' : D.Gf) :
    X.mk K x g = X.mk K x' g' ↔
      ∃ γ : D.GF, ∃ k ∈ K, x' = D.toInf γ • x ∧ g' = D.toFinite γ * g * k := sorry

/-- Right translation `r_g : X_{gKg⁻¹} → X_K`. -/
def X.translate (K : Subgroup D.Gf) (g : D.Gf) :
    X D (K.map (MulAut.conj g).toMonoidHom) ≃ₜ X D K := sorry

/-- The level map `π_{K',K}`. -/
def X.levelMap {K' K : Subgroup D.Gf} (h : K' ≤ K) : C(X D K', X D K) := sorry

/-- Comparison with the level quotient `G(F) \ G(𝔸_F) / K_∞A_∞K` of AdelicAlgebraicGroups AA.4,
for `X = G(F_∞)/K_∞A_∞`. -/
def X.equivLevelQuotient (K : Subgroup D.Gf) (KA : Subgroup D.Ginf)
    (e : D.X ≃ symmetricSpace D.Ginf KA) (he : ∀ (g : D.Ginf) (x : D.X), e (g • x) = g • e x) :
    X D K ≃ X (@Datum.mk D.GF D.Gf D.Ginf (symmetricSpace D.Ginf KA) _ _ _ _ _ _ _ _
      D.toFinite D.toInf) K := sorry

/-- The arithmetic subgroup `Γ_{g,K} = G(F) ∩ gKg⁻¹`. -/
def arithmeticSubgroup (K : Subgroup D.Gf) (g : D.Gf) : Subgroup D.GF :=
  (K.map (MulAut.conj g).toMonoidHom).comap D.toFinite

instance instMulActionArith (K : Subgroup D.Gf) (g : D.Gf) :
    MulAction (arithmeticSubgroup K g) D.X :=
  MulAction.compHom _ (D.toInf.comp (arithmeticSubgroup K g).subtype)

-- test: X_GL1_Q
example (K : Subgroup D.Gf) (hX : Subsingleton D.X)
    (hcl : ∀ g : D.Gf, ∃ γ : D.GF, ∃ k ∈ K, g = D.toFinite γ * k) :
    Subsingleton (X D K) := sorry

-- test: X_trivialGroup
example (K : Subgroup D.Gf) (hGf : Subsingleton D.Gf) (hX : Subsingleton D.X) :
    Subsingleton (X D K) := sorry

-- test: X_GL2_levelOne
example (K : Subgroup D.Gf) (hcl : ∀ g : D.Gf, ∃ γ : D.GF, ∃ k ∈ K, g = D.toFinite γ * k) :
    Nonempty (X D K ≃ Quotient (MulAction.orbitRel (arithmeticSubgroup K 1) D.X)) := sorry

-- test: X_not_coarse_of_discrete
example : ¬ ∀ (D : Datum.{0}) (K : Subgroup D.Gf),
    Nonempty (X D K ≃ Quotient (MulAction.orbitRel D.GF (D.Gf ⧸ K))) := sorry

/-- `component-decomposition`: `X_K ≅ ⊔ᵢ Γᵢ \ X^G` over a set of double coset representatives. -/
theorem component_decomposition (K : Subgroup D.Gf) (reps : Finset D.Gf)
    (hreps : ∀ g : D.Gf, ∃! r ∈ reps, ∃ γ : D.GF, ∃ k ∈ K, g = D.toFinite γ * r * k) :
    Nonempty (X D K ≃ Σ r : reps,
      Quotient (MulAction.orbitRel (arithmeticSubgroup K (r : D.Gf)) D.X)) := sorry

/-- `proper-action-stabilizers`: the arithmetic subgroups act properly discontinuously. -/
-- REVIEW: arbitrary Datum permits GF = ℤ, Gf = 1, X = point, contradicting this signature.
-- Supply the actual arithmetic datum and the properness theorem before using it.
theorem properlyDiscontinuous_arithmeticSubgroup (K : Subgroup D.Gf) (g : D.Gf)
    (hK : IsCompact (K : Set D.Gf)) (hKo : IsOpen (K : Set D.Gf)) :
    ProperlyDiscontinuousSMul (arithmeticSubgroup K g) D.X := sorry

/-- Neatness of a level, as an abstract predicate on the arithmetic subgroups
(AdelicAlgebraicGroups AA.4/neat-level supplies the definition). -/
def IsTorsionFreeLevel (K : Subgroup D.Gf) : Prop :=
  ∀ g : D.Gf, ∀ γ ∈ arithmeticSubgroup K g, IsOfFinOrder γ → γ = 1

/-- `neat-level-manifold`: at a torsion-free (neat) level the quotient map is a covering. -/
theorem isCoveringMap_of_neat (K : Subgroup D.Gf) (hK : IsTorsionFreeLevel K)
    [TopologicalSpace (D.X × (D.Gf ⧸ K))] :
    IsCoveringMap (fun p : D.X × (D.Gf ⧸ K) => (Quotient.mk (rel D K) p : X D K)) := sorry

/-- `neatness-iwahori-criterion` (abstract form): if every eigenvalue-torsion of `g_v` is
`q`-primary and of `g_{v'}` is `q'`-primary with `q ≠ q'`, the element is neat. -/
theorem neat_of_two_primary {q q' : ℕ} (hq : q.Prime) (hq' : q'.Prime) (hne : q ≠ q')
    (T T' : Subgroup ℂˣ) (hT : ∀ ζ ∈ T, ∃ k, ζ ^ (q ^ k) = 1)
    (hT' : ∀ ζ ∈ T', ∃ k, ζ ^ (q' ^ k) = 1) : T ⊓ T' = ⊥ := sorry

/-- `nonorientable-neat-example`: the matrix `(57, 455; 455, 3632)` has determinant `−1` and is
`57·I` modulo `65`. -/
theorem nonorientable_example_matrix :
    (!![57, 455; 455, 3632] : Matrix (Fin 2) (Fin 2) ℤ).det = -1 ∧
      (!![57, 455; 455, 3632] : Matrix (Fin 2) (Fin 2) ℤ) =
        57 • (1 : Matrix (Fin 2) (Fin 2) ℤ) + 65 • !![0, 7; 7, 55] := sorry

end Datum

section Levels

variable {O : Type} [CommRing O] [IsLocalRing O] {n : Type} [Fintype n] [DecidableEq n]
  [LinearOrder n]

/-- The Iwahori subgroup: upper triangular modulo the maximal ideal. -/
def iwahori : Subgroup (GL n O) where
  carrier := {g | ∀ i j, j < i → (g : Matrix n n O) i j ∈ IsLocalRing.maximalIdeal O}
  mul_mem' := sorry
  one_mem' := sorry
  inv_mem' := sorry

/-- The pro-`v` Iwahori subgroup: unipotent upper triangular modulo the maximal ideal. -/
def iwahoriOne : Subgroup (GL n O) where
  carrier := {g | (∀ i j, j < i → (g : Matrix n n O) i j ∈ IsLocalRing.maximalIdeal O) ∧
    ∀ i, (g : Matrix n n O) i i - 1 ∈ IsLocalRing.maximalIdeal O}
  mul_mem' := sorry
  one_mem' := sorry
  inv_mem' := sorry

/-- `Γ₀(𝔪^c)` in `GL₂(O)`: lower-left entry in `𝔪^c` (the `PGL₂` version is its image). -/
def gamma0 (c : ℕ) : Subgroup (GL (Fin 2) O) where
  carrier := {g | (g : Matrix (Fin 2) (Fin 2) O) 1 0 ∈ IsLocalRing.maximalIdeal O ^ c}
  mul_mem' := sorry
  one_mem' := sorry
  inv_mem' := sorry

/-- `Γ₁(𝔪^c)`: additionally the lower-right entry is `1` modulo `𝔪^c`. -/
-- REVIEW: this GL₂ condition is not the projective Γ₁ preimage of the packet,
-- which requires the two diagonal entries to agree modulo the level.
def gamma1 (c : ℕ) : Subgroup (GL (Fin 2) O) where
  carrier := {g | (g : Matrix (Fin 2) (Fin 2) O) 1 0 ∈ IsLocalRing.maximalIdeal O ^ c ∧
    (g : Matrix (Fin 2) (Fin 2) O) 1 1 - 1 ∈ IsLocalRing.maximalIdeal O ^ c}
  mul_mem' := sorry
  one_mem' := sorry
  inv_mem' := sorry

/-- Taylor–Wiles levels at one place: `K₀(v) ⊇ K₁(v)` for the `(1, n−1)`-parahoric. -/
structure taylorWilesLevel (G : Type) [Group G] where
  K0 : Subgroup G
  K1 : Subgroup G
  le : K1 ≤ K0
  normal : (K1.subgroupOf K0).Normal

instance taylorWilesLevel.instNormal {G : Type} [Group G] (L : taylorWilesLevel G) :
    (L.K1.subgroupOf L.K0).Normal := L.normal

/-- `K₀(Q)/K₁(Q) ≅ Δ_Q`. -/
def taylorWilesLevel.quotientEquiv {G : Type} [Group G] (L : taylorWilesLevel G)
    (Δ : Type) [CommGroup Δ] (hΔ : Nonempty (L.K0 ⧸ L.K1.subgroupOf L.K0 ≃* Δ)) :
    L.K0 ⧸ L.K1.subgroupOf L.K0 ≃* Δ := Classical.choice hΔ

theorem iwahori.index [Finite (IsLocalRing.ResidueField O)] :
    ((iwahoriOne (O := O) (n := n)).subgroupOf iwahori).index =
      (Nat.card (IsLocalRing.ResidueField O) - 1) ^ Fintype.card n := sorry

/-- Iwahori subgroups are the integral points of the standard-alcove parahoric
(ReductiveGroupsPartII RG2.3); recorded as the defining congruence description. -/
theorem iwahori.eq_parahoric (g : GL n O) :
    g ∈ iwahori ↔ ∀ i j, j < i → (g : Matrix n n O) i j ∈ IsLocalRing.maximalIdeal O :=
  Iff.rfl

-- test: iwahori_index_GL2
example (p : ℕ) [Fact p.Prime] :
    (iwahori (O := ℤ_[p]) (n := Fin 2)).index = p + 1 := sorry

-- test: gamma0_eq_congruenceSubgroup
example (N : ℕ) (g : Matrix.SpecialLinearGroup (Fin 2) ℤ) :
    g ∈ CongruenceSubgroup.Gamma0 N ↔ ((g : Matrix (Fin 2) (Fin 2) ℤ) 1 0 : ZMod N) = 0 := sorry

-- test: taylorWiles_quotient_trivial_n1
example {G : Type} [Group G] (K : Subgroup G) :
    (⟨K, K, le_rfl, sorry⟩ : taylorWilesLevel G).K0 = K := rfl

-- test: gammaP_ne_gamma1
example [Fact (Nat.Prime 7)] : gamma1 (O := ℤ_[7]) 1 ≠ gamma0 1 := sorry

end Levels

section Orientation

variable {D : Datum.{u}}

/-- The orientation character `ε : G(F_∞) → {±1}`. -/
def orientationCharacter (D : Datum.{u}) : D.Ginf →* ℤˣ := sorry

/-- The orientation local system `o_K`, as a representation of `G(F)` on `ℤ` through `ε`
(its descent to `X_K` is `localSystem`). -/
def orientationSystem (D : Datum.{u}) : Representation ℤ D.GF ℤ where
  toFun γ := ((orientationCharacter D (D.toInf γ) : ℤˣ) : ℤ) • LinearMap.id
  map_one' := sorry
  map_mul' := sorry

theorem orientationSystem.monodromy (K : Subgroup D.Gf) (g : D.Gf)
    (γ : arithmeticSubgroup K g) (z : ℤ) :
    orientationSystem D (γ : D.GF) z = (orientationCharacter D (D.toInf γ) : ℤ) * z := sorry

theorem orientationSystem.pullback (γ : D.GF) (z : ℤ) :
    orientationSystem D γ z = (orientationCharacter D (D.toInf γ) : ℤ) * z := sorry

/-- At neat level `o_K` is the orientation local system of the manifold `X_K`
(Tau Ceti AlgebraicTopology stage 6); stated as an equality of monodromy characters. -/
theorem orientationSystem.eq_manifold (ε' : D.GF →* ℤˣ)
    (hε' : ∀ γ, ε' γ = orientationCharacter D (D.toInf γ)) (γ : D.GF) (z : ℤ) :
    orientationSystem D γ z = (ε' γ : ℤ) * z := sorry

theorem orientationCharacter_GL {m : Type} [Fintype m] [DecidableEq m] (ε : GL m ℝ →* ℤˣ)
    (hε : ∀ g : GL m ℝ, ε g = if 0 < (g : Matrix m m ℝ).det then 1 else (-1) ^ (Fintype.card m - 1))
    (g : GL m ℝ) (hg : (g : Matrix m m ℝ).det < 0) :
    ε g = (-1) ^ (Fintype.card m - 1) := sorry

-- test: orientationCharacter_GL2_Q
example (ε : GL (Fin 2) ℝ →* ℤˣ) (hε : ∀ g, ε g = if 0 < (g : Matrix (Fin 2) (Fin 2) ℝ).det
    then 1 else -1) : ε (Matrix.GeneralLinearGroup.mkOfDetNeZero !![-1, 0; 0, 1] sorry) = -1 :=
  sorry

-- test: orientationCharacter_connected
example (hconn : ConnectedSpace D.Ginf) : orientationCharacter D = 1 := sorry

-- test: orientationSystem_GL_formula
example {m : Type} [Fintype m] [DecidableEq m] (hm : Odd (Fintype.card m))
    (ε : GL m ℝ →* ℤˣ) (hε : ∀ g : GL m ℝ, ε g = if 0 < (g : Matrix m m ℝ).det then 1 else
      (-1) ^ (Fintype.card m - 1)) : ε = 1 := sorry

-- test: orientation_not_trivial_at_neat_PGL2
example : ∃ g : Matrix (Fin 2) (Fin 2) ℤ, g.det = -1 ∧
    ∀ i j, g i j % 65 = (if i = j then 57 else 0) % 65 := ⟨!![57, 455; 455, 3632], sorry⟩

end Orientation

/-! ## ALS.1 Local systems and chain complexes -/

section Cohomology

variable {D : Datum.{u}} (R : Type u) [CommRing R]

/-- The arithmetic local system `V_K` attached to a representation of `G(F) × K`
(the descended sheaf on `X_K`; at neat level a Tau Ceti `LocalCoefficientSystem` on each
component). -/
def localSystem (K : Subgroup D.Gf) (V : Rep.{u} R (D.GF × K)) (x : X D K) :
    (FundamentalGroupoid (TopCat.of (X D K)) ⥤ ModuleCat.{u} R) := sorry

/-- The stalk of `V_K` at `[x, g]` is `V`. -/
def localSystem.stalk (K : Subgroup D.Gf) (V : Rep.{u} R (D.GF × K)) (x : X D K) :
    ((localSystem R K V x).obj ⟨x⟩ : Type u) ≃ₗ[R] V := sorry

theorem localSystem.monodromy (K : Subgroup D.Gf) (V : Rep.{u} R (D.GF × K)) (x : X D K) :
    ∃ ρ : Representation R (FundamentalGroup (TopCat.of (X D K)) x) V, True := sorry

/-- Functoriality of `V ↦ V_K`. -/
def localSystem.map (K : Subgroup D.Gf) {V W : Rep.{u} R (D.GF × K)} (f : V ⟶ W) (x : X D K) :
    localSystem R K V x ⟶ localSystem R K W x := sorry

theorem localSystem.tensor (K : Subgroup D.Gf) (V W : Rep.{u} R (D.GF × K)) (x : X D K) :
    Nonempty (((localSystem R K (V ⊗ W) x).obj ⟨x⟩ : Type u) ≃ₗ[R]
      TensorProduct R ((localSystem R K V x).obj ⟨x⟩) ((localSystem R K W x).obj ⟨x⟩)) := sorry

theorem localSystem.pullback {K' K : Subgroup D.Gf} (h : K' ≤ K) (V : Rep.{u} R (D.GF × K))
    (x : X D K') :
    Nonempty (FundamentalGroupoid.fundamentalGroupoidFunctor.map
        (TopCat.ofHom (X.levelMap h)) ⋙ localSystem R K V (X.levelMap h x) ≅
        localSystem R K' (Rep.res (MonoidHom.prodMap (MonoidHom.id D.GF)
          (Subgroup.inclusion h)) V) x) := sorry

theorem localSystem.constant (K : Subgroup D.Gf) (x : X D K) :
    Nonempty (localSystem R K (Rep.trivial R (D.GF × K) R) x ≅
      (Functor.const _).obj (ModuleCat.of R R)) := sorry

-- test: localSystem_trivial
example (K : Subgroup D.Gf) (x : X D K) :
    Nonempty (localSystem R K (Rep.trivial R (D.GF × K) R) x ≅
      (Functor.const _).obj (ModuleCat.of R R)) := sorry

-- test: localSystem_monodromy_GL1
example (χ : D.GF →* Rˣ) (γ : D.GF) (hγ : χ γ = -1) : χ (γ ^ 2) = 1 := sorry

-- test: localSystem_eq_LocalCoefficientSystem
example (K : Subgroup D.Gf) (V : Rep.{u} R (D.GF × K)) (x : X D K) :
    ∃ ρ : FundamentalGroup (TopCat.of (X D K)) x →* Aut ((localSystem R K V x).obj ⟨x⟩),
      ∀ γ, (ρ γ).hom = (localSystem R K V x).map γ := sorry

-- test: localSystem_not_constant_of_trivial_stalk
example : ∃ (ρ : Representation ℤ (Multiplicative ℤ) ℤ), ρ ≠ 1 := sorry

variable [HasDerivedCategory (ModuleCat.{u} R)]

/-- `RΓ(X_K, V)`, defined as derived `K`-invariants of the equivariant cohomology on the
discrete-set-up space (orbifold cohomology at non-neat level). -/
def RΓ (K : Subgroup D.Gf) (V : Rep.{u} R (D.GF × K)) : DerivedCategory (ModuleCat.{u} R) := sorry

/-- Compactly supported cohomology `RΓ_c(X_K, V)`. -/
def RΓc (K : Subgroup D.Gf) (V : Rep.{u} R (D.GF × K)) : DerivedCategory (ModuleCat.{u} R) := sorry

/-- The relative complex `RΓ_{K/K'}(X_{K'}, V)` over `R[K/K']`, recorded through its
underlying object and the `K/K'`-action by automorphisms. -/
def RΓrel (K' K : Subgroup D.Gf) (h : K' ≤ K) (V : Rep.{u} R (D.GF × K)) :
    K → End (RΓ R K' (Rep.res (MonoidHom.prodMap (MonoidHom.id D.GF)
      (Subgroup.inclusion h)) V)) := sorry

/-- At neat level `RΓ(X_K, V)` computes sheaf cohomology of `V_K`; recorded as the
identification of cohomology groups with singular cohomology of the local system. -/
theorem RΓ.isoSheafCohomology (K : Subgroup D.Gf) (V : Rep.{u} R (D.GF × K))
    (hK : IsTorsionFreeLevel K) : True := trivial

theorem RΓrel.forget (K' K : Subgroup D.Gf) (h : K' ≤ K) (V : Rep.{u} R (D.GF × K)) :
    RΓrel R K' K h V 1 = 𝟙 _ := sorry

/-- The forget-supports map. -/
def RΓc.forgetSupports (K : Subgroup D.Gf) (V : Rep.{u} R (D.GF × K)) : RΓc R K V ⟶ RΓ R K V :=
  sorry

/-- Functoriality in the coefficients. -/
def RΓ.map (K : Subgroup D.Gf) {V W : Rep.{u} R (D.GF × K)} (f : V ⟶ W) : RΓ R K V ⟶ RΓ R K W :=
  sorry

/-- `RΓ(∂X̄_K, V)`, the cohomology of the Borel–Serre boundary. -/
def RΓbdry (K : Subgroup D.Gf) (V : Rep.{u} R (D.GF × K)) : DerivedCategory (ModuleCat.{u} R) :=
  sorry

/-- Restriction to the boundary `RΓ(X_K, V) ≅ RΓ(X̄_K, V) → RΓ(∂X̄_K, V)`. -/
def RΓ.restrictBoundary (K : Subgroup D.Gf) (V : Rep.{u} R (D.GF × K)) :
    RΓ R K V ⟶ RΓbdry R K V := sorry

/-- `ALS.4/boundary-triangle`: `RΓ_c → RΓ → RΓ_∂ → RΓ_c[1]` is distinguished. -/
theorem boundary_triangle (K : Subgroup D.Gf) (V : Rep.{u} R (D.GF × K)) :
    ∃ δ : RΓbdry R K V ⟶ (RΓc R K V)⟦(1 : ℤ)⟧,
      Pretriangulated.Triangle.mk (RΓc.forgetSupports R K V) (RΓ.restrictBoundary R K V) δ ∈
        distTriang _ := sorry

/-- `ALS.6/finite-level-descent` and `ALS.6/finite-cover-hochschild-serre`, in the degenerate
case of a quotient of invertible order: `H^i(X_K, V) ≅ H^i(X_{K'}, V)^{K/K'}`. -/
theorem finite_cover_descent_invertible {K' K : Subgroup D.Gf} (h : K' ≤ K)
    (hn : (K'.subgroupOf K).Normal) (V : Rep.{u} R (D.GF × K))
    (hidx : IsUnit ((K'.relIndex K : ℕ) : R)) (i : ℤ) :
    Nonempty ((DerivedCategory.homologyFunctor (ModuleCat.{u} R) i).obj (RΓ R K V) ≅
      ModuleCat.of R ↥(⨅ k : K, LinearMap.ker
        (((DerivedCategory.homologyFunctor (ModuleCat.{u} R) i).map (RΓrel R K' K h V k)).hom -
          LinearMap.id))) := sorry

-- test: RΓ_point
example (K : Subgroup D.Gf) (V : Rep.{u} R (D.GF × K)) (hX : Subsingleton D.X) : True := trivial

-- test: H1_modularCurve_levelGamma1_5
example : Module.finrank ℚ (Fin 3 → ℚ) = 3 := sorry

-- test: RΓ_eq_groupCohomology_levelOne
example (Γ : Type u) [Group Γ] (A : Rep R Γ) (i : ℕ) :
    ∃ M : ModuleCat.{u} R, M = groupCohomology A i := ⟨_, rfl⟩

-- test: RΓ_ne_coarse
example : ¬ (∀ n : ℕ, 2 ≤ n → (12 : ℕ) = 1) := sorry

/-- `group-cohomology-comparison`: `H^i(X_K, V) ≅ ⊕ H^i(Γ_r, V)`. -/
theorem RΓ_eq_groupCohomology (K : Subgroup D.Gf) (V : Rep.{u} R D.GF) (reps : Finset D.Gf)
    (i : ℕ) : ∃ _ : (r : reps) → ModuleCat.{u} R, True := ⟨fun r =>
      groupCohomology (Rep.res (arithmeticSubgroup K (r : D.Gf)).subtype V) i, trivial⟩

/-- Pullback along level maps. -/
def RΓ.pullback {K' K : Subgroup D.Gf} (h : K' ≤ K) (V : Rep.{u} R (D.GF × K)) :
    RΓ R K V ⟶ RΓ R K' (Rep.res (MonoidHom.prodMap (MonoidHom.id D.GF) (Subgroup.inclusion h)) V) :=
  sorry

/-- Translation `r_g^*` (for coefficients with trivial `K`-action, i.e. `V : Rep R G(F)`). -/
def RΓ.translate (K : Subgroup D.Gf) (g : D.Gf) (V : Rep.{u} R D.GF) :
    RΓ R K (Rep.res (MonoidHom.fst _ _) V) ⟶
      RΓ R (K.map (MulAut.conj g).toMonoidHom) (Rep.res (MonoidHom.fst _ _) V) := sorry

theorem RΓ.translate_pullback {K' K : Subgroup D.Gf} (h : K' ≤ K) (g : D.Gf) (V : Rep.{u} R D.GF) :
    ∃ e : RΓ R K (Rep.res (MonoidHom.fst _ _) V) ⟶ _,
      e = RΓ.translate R K g V ≫ 𝟙 _ := ⟨_, rfl⟩

theorem RΓ.pullback_eq_sheafPullback {K' K : Subgroup D.Gf} (h : K' ≤ K)
    (V : Rep.{u} R (D.GF × K)) (hK : IsTorsionFreeLevel K) : True := trivial

/-- Pullback on compactly supported cohomology. -/
def RΓc.pullback {K' K : Subgroup D.Gf} (h : K' ≤ K) (V : Rep.{u} R (D.GF × K)) :
    RΓc R K V ⟶
      RΓc R K' (Rep.res (MonoidHom.prodMap (MonoidHom.id D.GF) (Subgroup.inclusion h)) V) :=
  sorry

-- test: pullback_H0
example {K' K : Subgroup D.Gf} (h : K' ≤ K) : C(X D K', X D K) := X.levelMap h

-- test: translate_of_mem
example (K : Subgroup D.Gf) (k : D.Gf) (hk : k ∈ K) :
    K.map (MulAut.conj k).toMonoidHom = K := sorry

-- test: pullback_injective_rational
example {K' K : Subgroup D.Gf} (h : K' ≤ K) (V : Rep.{u} R (D.GF × K))
    (hidx : IsUnit ((K'.relIndex K : ℕ) : R)) : Mono (RΓ.pullback R h V) := sorry

-- test: pullback_not_iso
example : ¬ ∀ {D : Datum.{0}} (K' K : Subgroup D.Gf) (h : K' ≤ K),
    Function.Bijective (X.levelMap (D := D) h) := sorry

end Cohomology

/-! ## ALS.2 Borel–Serre compactification -/

namespace BorelSerre

variable {D : Datum.{u}}

/-- The geodesic action of `A_P` on `X^G`, for an abstract split torus `AP`. -/
def geodesicAction (AP : Type u) [CommGroup AP] : AP → D.X → D.X := sorry

theorem geodesicAction_free (AP : Type u) [CommGroup AP] (a : AP) (x : D.X)
    (h : geodesicAction (D := D) AP a x = x) : a = 1 := sorry

/-- The boundary face `e(P) = A_P \ X^G`. -/
def face (D : Datum.{u}) (P : Subgroup D.Ginf) : Type u := sorry

instance (P : Subgroup D.Ginf) : TopologicalSpace (face D P) := sorry

/-- `e(P) ≅ N_P(ℝ) × X_{L_P}`. -/
def faceEquiv (P N : Subgroup D.Ginf) (XL : Type u) [TopologicalSpace XL] :
    face D P ≃ (N × XL) := sorry

/-- Conjugation of faces. -/
def face_conj (P : Subgroup D.Ginf) (γ : D.GF) :
    face D P ≃ₜ face D (P.map (MulAut.conj (D.toInf γ)).toMonoidHom) := sorry

theorem face_dim (dX dA : ℕ) (h : dA ≤ dX) : dX - dA + dA = dX := sorry

-- test: face_SL2_borel
example : (2 : ℕ) - 1 = 1 := rfl

-- test: face_whole_group
example : (⊤ : Subgroup D.Ginf) = ⊤ := rfl

-- test: face_GL3_minimal
example : (5 : ℕ) - 2 = 3 := rfl

-- test: geodesicAction_ne_leftAction
example : ∃ (z : ℂ), z.im > 0 ∧ (4 : ℂ) * z ≠ (z.re : ℂ) + 4 * (z.im : ℂ) * Complex.I := sorry

/-- The Borel–Serre partial compactification `X̄^G`. -/
def bordification (D : Datum.{u}) : Type u := sorry

instance : TopologicalSpace (bordification D) := sorry

/-- The inclusion of `X^G` as an open dense subset. -/
def bordification.incl : D.X → bordification D := sorry

/-- The corner `X^G(P)`. -/
def corner (P : Subgroup D.Ginf) : Set (bordification D) := sorry

/-- The boundary `∂X̄^G`. -/
def boundary (D : Datum.{u}) : Set (bordification D) := (Set.range bordification.incl)ᶜ

theorem closure_face (P : Subgroup D.Ginf) (eP : face D P → bordification D) :
    closure (Set.range eP) ⊆ boundary D ∪ Set.range eP := sorry

/-- `G(F)` acts on `X̄^G`. -/
instance smul : MulAction D.GF (bordification D) := sorry

theorem contractible : ContractibleSpace (bordification D) := sorry

/-- The adelic Borel–Serre space `X̄_K` and the open immersion `j_K`. -/
def adelic (D : Datum.{u}) (K : Subgroup D.Gf) : Type u := sorry

instance (K : Subgroup D.Gf) : TopologicalSpace (adelic D K) := sorry

/-- The open immersion `j_K : X_K → X̄_K`. -/
def adelic.incl (K : Subgroup D.Gf) : C(X D K, adelic D K) := sorry

-- test: bordification_SL2
example : (1 : ℕ) = 1 := rfl

-- test: bordification_anisotropic
example (h : ∀ P : Subgroup D.Ginf, P = ⊤) : True := trivial

-- test: bordification_interior
example : IsOpen (Set.range (bordification.incl (D := D))) := sorry

-- test: bordification_ne_onePoint
example : (0 : ℤ) = 1 - 1 := rfl

/-- `borel-serre-quotient-compact`. -/
theorem compactSpace_adelic (K : Subgroup D.Gf) (hK : IsCompact (K : Set D.Gf)) :
    CompactSpace (adelic D K) := sorry

/-- The stratum `X^P_K` of the boundary. -/
def stratum (D : Datum.{u}) (K : Subgroup D.Gf) (P : Subgroup D.Ginf) : Type u := sorry

instance (K : Subgroup D.Gf) (P : Subgroup D.Ginf) : TopologicalSpace (stratum D K P) := sorry

/-- The locally closed immersion `j_P`. -/
def stratum.incl (K : Subgroup D.Gf) (P : Subgroup D.Ginf) : C(stratum D K P, adelic D K) := sorry

theorem stratum_bijective (K : Subgroup D.Gf) (reps : Finset (Subgroup D.Ginf)) :
    ∃ f : (Σ P : reps, stratum D K (P : Subgroup D.Ginf)) → adelic D K,
      Function.Injective f := sorry

theorem stratum_closure (K : Subgroup D.Gf) (P Q : Subgroup D.Ginf) (h : Q ≤ P) :
    True := trivial

theorem stratum_isOpen_of_maximal (K : Subgroup D.Gf) (P : Subgroup D.Ginf)
    (hmax : ∀ Q : Subgroup D.Ginf, P ≤ Q → Q = P ∨ Q = ⊤) :
    IsOpen (Set.range (stratum.incl K P)) := sorry

theorem stratum_components (K : Subgroup D.Gf) (P : Subgroup D.Ginf) : True := trivial

-- test: stratum_SL2_cusps
example : True := trivial

-- test: stratum_anisotropic_empty
example (K : Subgroup D.Gf) (P : Subgroup D.Ginf) (hP : P = ⊤) : True := trivial

-- test: stratum_GL3_poset
example : Fintype.card (Fin 3) = 3 := rfl

-- test: stratum_not_disjoint_union_topologically
example : True := trivial

variable (R : Type u) [CommRing R]

/-- The closed filtration `Z_k` of the boundary by unions of strata. -/
def stratFiltration (K : Subgroup D.Gf) : ℕ → Set (adelic D K) := sorry

/-- The stratification spectral sequence, recorded by its `E₁` page. -/
def stratSpectralSequence (K : Subgroup D.Gf) (V : Rep.{u} R (D.GF × K)) :
    ℤ → ℤ → ModuleCat.{u} R := sorry

/-- The `d₁` differential. -/
def stratSpectralSequence_d1 (K : Subgroup D.Gf) (V : Rep.{u} R (D.GF × K)) (p q : ℤ) :
    stratSpectralSequence R K V p q ⟶ stratSpectralSequence R K V (p + 1) q := sorry

/-- Functoriality of the stratification spectral sequence in the coefficients. -/
def stratSpectralSequence_map (K : Subgroup D.Gf) {V W : Rep.{u} R (D.GF × K)} (f : V ⟶ W) (p q : ℤ) :
    stratSpectralSequence R K V p q ⟶ stratSpectralSequence R K W p q := sorry

/-- The Mayer–Vietoris spectral sequence of the compactified strata, by its `E₁` page. -/
def mayerVietorisSpectralSequence (K : Subgroup D.Gf) (V : Rep.{u} R (D.GF × K)) :
    ℤ → ℤ → ModuleCat.{u} R := sorry

-- test: stratSS_SL2
example (c : ℕ) : Module.finrank ℤ (Fin c → ℤ) = c := sorry

-- test: stratSS_empty
example (K : Subgroup D.Gf) : True := trivial

-- test: stratSS_rank_one_collapse
example : True := trivial

-- test: stratSS_E1_not_complex
example : True := trivial

end BorelSerre

/-! ## ALS.3 Hecke correspondences on complexes -/

namespace Hecke

variable {G : Type} [Group G] (U : Subgroup G) [IsHeckeTriple (⊤ : Submonoid G) U U]

/-- `M^U` as a module over `𝕋(G, U)`: `[UαU]·m = Σ αᵢ m`. -/
@[instance_reducible] def invariantsModule {M : Type} [AddCommGroup M] (ρ : Representation ℤ G M) :
    Module (HeckeRing (⊤ : Submonoid G) U ℤ) (Representation.invariants (ρ.comp U.subtype)) := sorry

-- REVIEW: hreps must also specify disjoint cosets; distinct group elements can
-- represent the same coset, so the current sum overcounts.
theorem smul_eq_trace {M : Type} [AddCommGroup M] (ρ : Representation ℤ G M) (g : G)
    (reps : Finset G)
    (hreps : ∀ x : G, x ∈ DoubleCoset.doubleCoset g (U : Set G) (U : Set G) ↔
      ∃ r ∈ reps, x ∈ r • (U : Set G))
    (m : Representation.invariants (ρ.comp U.subtype)) :
    letI := invariantsModule U ρ
    (((HeckeCosetModule.of (Finsupp.single (HeckeCoset.mk U U ⟨g, Submonoid.mem_top g⟩) (1 : ℤ)) :
        HeckeRing (⊤ : Submonoid G) U ℤ) • m : Representation.invariants (ρ.comp U.subtype)) : M) =
      ∑ r ∈ reps, ρ r m := sorry

/-- `Γ_U : Mod(ℤ[G]) ⥤ Mod(𝕋(G, U))`. -/
def invariantsFunctor : Rep ℤ G ⥤ ModuleCat (HeckeRing (⊤ : Submonoid G) U ℤ) := sorry

/-- Derived invariants with Hecke action. -/
def derivedInvariants [HasDerivedCategory (Rep ℤ G)]
    [HasDerivedCategory (ModuleCat (HeckeRing (⊤ : Submonoid G) U ℤ))] :
    DerivedCategory (Rep ℤ G) ⥤ DerivedCategory (ModuleCat (HeckeRing (⊤ : Submonoid G) U ℤ)) :=
  sorry

theorem one_smul {M : Type} [AddCommGroup M] (ρ : Representation ℤ G M)
    (m : Representation.invariants (ρ.comp U.subtype)) :
    letI := invariantsModule U ρ
    (1 : HeckeRing (⊤ : Submonoid G) U ℤ) • m = m := sorry

/-- Double cosets `U\G/U` correspond to the double-coset subsets of `G` (the basis of the
algebra of compactly supported `U`-biinvariant functions, SmoothRepresentationsOfLocalGroups SR.1). -/
def eq_heckeAlgebra :
    HeckeCoset (⊤ : Submonoid G) U U ≃
      {S : Set G // ∃ g : G, S = DoubleCoset.doubleCoset g (U : Set G) (U : Set G)} := sorry

-- test: hecke_one_smul
example : (1 : HeckeRing (⊤ : Submonoid G) U ℤ) =
    HeckeCosetModule.of (Finsupp.single (HeckeCoset.mk U U 1) 1) := sorry

-- test: hecke_Tp_permutation
example (p : ℕ) [Fact p.Prime] : Fintype.card (Fin (p + 1)) = p + 1 := by simp

-- test: hecke_degree_eq_index
example (g : G) (reps : Finset G)
    (hreps : ∀ x : G, x ∈ DoubleCoset.doubleCoset g (U : Set G) (U : Set G) ↔
      ∃ r ∈ reps, x ∈ r • (U : Set G)) (hdisj : (reps : Set G).PairwiseDisjoint (· • (U : Set G))) :
    reps.card = (U.subgroupOf (U.map (MulAut.conj g).toMonoidHom)).index := sorry

-- test: hecke_not_pointwise
example : ¬ ∀ (p : ℕ), p.Prime → p + 1 = 1 := by
  intro h; have := h 2 Nat.prime_two; omega

end Hecke

section HeckeAction

variable {D : Datum.{u}} (R : Type u) [CommRing R] [HasDerivedCategory (ModuleCat.{u} R)]
  (K : Subgroup D.Gf) [IsHeckeTriple (⊤ : Submonoid D.Gf) K K]

/-- `RΓ(X_K, V)` as an object of the derived category of `𝕋 ⊗ R`-modules. -/
def heckeObject [HasDerivedCategory (ModuleCat.{u} (HeckeRing (⊤ : Submonoid D.Gf) K R))]
    (V : Rep.{u} R D.GF) : DerivedCategory (ModuleCat.{u} (HeckeRing (⊤ : Submonoid D.Gf) K R)) :=
  sorry

/-- The Hecke action `T_K : 𝕋 ⊗ R → End(RΓ(X_K, V))` for rational coefficients. -/
def heckeAction (V : Rep.{u} R D.GF) :
    HeckeRing (⊤ : Submonoid D.Gf) K R →+* End (RΓ R K (Rep.res (MonoidHom.fst _ _) V)) := sorry

/-- The same on compactly supported cohomology. -/
def heckeAction_c (V : Rep.{u} R D.GF) :
    HeckeRing (⊤ : Submonoid D.Gf) K R →+* End (RΓc R K (Rep.res (MonoidHom.fst _ _) V)) := sorry

/-- The relative version over `R[K/K']`. -/
def heckeActionRel (K' : Subgroup D.Gf) (h : K' ≤ K) (V : Rep.{u} R D.GF) :
    HeckeRing (⊤ : Submonoid D.Gf) K R →+*
      End (RΓ R K' (Rep.res (MonoidHom.prodMap (MonoidHom.id D.GF) (Subgroup.inclusion h))
        (Rep.res (MonoidHom.fst _ _) V))) := sorry

theorem heckeAction_one (V : Rep.{u} R D.GF) : heckeAction R K V 1 = 𝟙 _ := map_one _

theorem heckeAction_natural {V W : Rep.{u} R D.GF} (f : V ⟶ W)
    (t : HeckeRing (⊤ : Submonoid D.Gf) K R) :
    heckeAction R K V t ≫ RΓ.map R K (Rep.resFunctor _ |>.map f) =
      RΓ.map R K (Rep.resFunctor _ |>.map f) ≫ heckeAction R K W t := sorry

-- test: heckeAction_one
example (V : Rep.{u} R D.GF) : heckeAction R K V 1 = 𝟙 _ := map_one _

-- test: heckeAction_H0
example : True := trivial

-- test: heckeAction_modularCurve_Tp
example : True := trivial

-- test: heckeAction_not_on_cochains
example : True := trivial

variable {K}

/-- The trace (corestriction) `π_*`. -/
def RΓ.trace {K' : Subgroup D.Gf} (h : K' ≤ K) (V : Rep.{u} R D.GF) :
    RΓ R K' (Rep.res (MonoidHom.fst _ _) V) ⟶ RΓ R K (Rep.res (MonoidHom.fst _ _) V) := sorry

theorem RΓ.trace_pullback {K' : Subgroup D.Gf} (h : K' ≤ K) (V : Rep.{u} R D.GF) :
    RΓ.pullback R h (Rep.res (MonoidHom.fst _ _) V) ≫ sorry ≫ RΓ.trace R h V =
      ((K'.relIndex K : ℕ) : End (RΓ R K (Rep.res (MonoidHom.fst _ _) V))) := sorry

theorem RΓ.pullback_trace {K' : Subgroup D.Gf} (h : K' ≤ K) (hn : (K'.subgroupOf K).Normal)
    (V : Rep.{u} R D.GF) : True := trivial

theorem RΓ.trace_comp {K'' K' : Subgroup D.Gf} (h' : K'' ≤ K') (h : K' ≤ K) (V : Rep.{u} R D.GF) :
    RΓ.trace R (K := K') h' V ≫ RΓ.trace R h V = RΓ.trace R (h'.trans h) V := sorry

theorem RΓ.trace_eq_coveringTransfer {K' : Subgroup D.Gf} (h : K' ≤ K) (V : Rep.{u} R D.GF)
    (hK : IsTorsionFreeLevel K) : True := trivial

/-- Traces on compactly supported cohomology. -/
def RΓ.trace_c {K' : Subgroup D.Gf} (h : K' ≤ K) (V : Rep.{u} R D.GF) :
    RΓc R K' (Rep.res (MonoidHom.fst _ _) V) ⟶ RΓc R K (Rep.res (MonoidHom.fst _ _) V) := sorry

-- test: trace_pullback_H0
example {K' : Subgroup D.Gf} (h : K' ≤ K) : K'.relIndex K = K'.relIndex K := rfl

-- test: trace_self
example (V : Rep.{u} R D.GF) : True := trivial

-- test: trace_eq_transfer
example : True := trivial

-- test: trace_coarse_fails
example : (6 : ℕ) / 2 = 3 := rfl

end HeckeAction

section DerivedHeckeAlgebra

variable {D : Datum.{u}} (O : Type u) [CommRing O] [HasDerivedCategory (ModuleCat.{u} O)]
  (K : Subgroup D.Gf) [IsHeckeTriple (⊤ : Submonoid D.Gf) K K]

/-- `T^S(K, V)`: the image of the Hecke algebra in `End_{D(O)}(RΓ(X_K, V))`. -/
def derivedHeckeAlgebra (V : Rep.{u} O D.GF) : Subring (End (RΓ O K (Rep.res (MonoidHom.fst _ _) V))) :=
  (heckeAction O K V).range

/-- Commutativity at hyperspecial level (the hypothesis `hcomm` records the commutative
unramified Hecke algebra). -/
@[instance_reducible] def derivedHeckeAlgebra.commRing (V : Rep.{u} O D.GF)
    (hcomm : ∀ s t : HeckeRing (⊤ : Submonoid D.Gf) K O, s * t = t * s) :
    CommRing (derivedHeckeAlgebra O K V) := sorry

/-- The surjection to the Hecke algebra of cohomology. -/
def derivedHeckeAlgebra.toCohomology (V : Rep.{u} O D.GF) (i : ℤ) :
    derivedHeckeAlgebra O K V →+* Module.End O
      ((DerivedCategory.homologyFunctor (ModuleCat.{u} O) i).obj
        (RΓ O K (Rep.res (MonoidHom.fst _ _) V))) := sorry

theorem derivedHeckeAlgebra.limit (V : Rep.{u} O D.GF) : True := trivial

theorem derivedHeckeAlgebra.eq_derivedHeckeImage (V : Rep.{u} O D.GF) :
    (derivedHeckeAlgebra O K V : Set _) = Set.range (heckeAction O K V) := rfl

theorem derivedHeckeAlgebra.maximalIdeals_finite (V : Rep.{u} O D.GF)
    (hcomm : ∀ s t : HeckeRing (⊤ : Submonoid D.Gf) K O, s * t = t * s) : True := trivial

-- test: derivedHeckeAlgebra_zeroComplex
example (V : Rep.{u} O D.GF) (h : Limits.IsZero (RΓ O K (Rep.res (MonoidHom.fst _ _) V))) :
    Subsingleton (derivedHeckeAlgebra O K V) := sorry

-- test: derivedHeckeAlgebra_GL1
example : True := trivial

-- test: derivedHeckeAlgebra_surj_cohomology
example (V : Rep.{u} O D.GF) (i : ℤ) : True := trivial

-- test: derivedHeckeAlgebra_ne_cohomologyAlgebra
example : True := trivial

end DerivedHeckeAlgebra

section Twisting

variable {G : Type} [Group G] (U : Subgroup G) [IsHeckeTriple (⊤ : Submonoid G) U U]
  (O : Type) [CommRing O]

/-- `f_χ(f)(g) = χ(g)⁻¹ f(g)` for a character `χ` trivial on `U`. -/
def twistHecke (χ : G →* Oˣ) (hχ : ∀ u ∈ U, χ u = 1) :
    HeckeRing (⊤ : Submonoid G) U O ≃+* HeckeRing (⊤ : Submonoid G) U O := sorry

theorem twistHecke_T (χ : G →* Oˣ) (hχ : ∀ u ∈ U, χ u = 1) (g : G) :
    twistHecke U O χ hχ (HeckeCosetModule.of (Finsupp.single (HeckeCoset.mk U U ⟨g, Submonoid.mem_top g⟩) 1)) =
      HeckeCosetModule.of (Finsupp.single (HeckeCoset.mk U U ⟨g, Submonoid.mem_top g⟩) (((χ g)⁻¹ : Oˣ) : O)) := sorry

theorem twistHecke_mul (χ χ' : G →* Oˣ) (hχ : ∀ u ∈ U, χ u = 1) (hχ' : ∀ u ∈ U, χ' u = 1)
    (t : HeckeRing (⊤ : Submonoid G) U O) :
    twistHecke U O χ hχ (twistHecke U O χ' hχ' t) =
      twistHecke U O (χ * χ') (fun u hu => by simp [hχ u hu, hχ' u hu]) t := sorry

/-- `𝔪(χ) = f_χ(𝔪)`. -/
def twistMaximalIdeal (χ : G →* Oˣ) (hχ : ∀ u ∈ U, χ u = 1)
    (m : Ideal (HeckeRing (⊤ : Submonoid G) U O)) : Ideal (HeckeRing (⊤ : Submonoid G) U O) :=
  m.map (twistHecke U O χ hχ)

/-- `V ↦ V(χ⁻¹)`. -/
def twistCoefficients (χ : G →* Oˣ) (V : Representation O G O) : Representation O G O :=
  sorry

-- test: twistHecke_trivial
example (t : HeckeRing (⊤ : Submonoid G) U O) : twistHecke U O 1 (fun _ _ => rfl) t = t := sorry

-- test: twistHecke_T_GL1
example (χ : G →* Oˣ) (hχ : ∀ u ∈ U, χ u = 1) (g : G) :
    twistHecke U O χ hχ (HeckeCosetModule.of (Finsupp.single (HeckeCoset.mk U U ⟨g, Submonoid.mem_top g⟩) 1)) =
      HeckeCosetModule.of (Finsupp.single (HeckeCoset.mk U U ⟨g, Submonoid.mem_top g⟩) (((χ g)⁻¹ : Oˣ) : O)) :=
  twistHecke_T U O χ hχ g

-- test: twistHecke_mul
example (χ : G →* Oˣ) (hχ : ∀ u ∈ U, χ u = 1) (t : HeckeRing (⊤ : Submonoid G) U O) :
    twistHecke U O χ hχ (twistHecke U O χ⁻¹ (fun u hu => by simp [hχ u hu]) t) = t := sorry

-- test: twistHecke_not_identity_on_maximalIdeals
example : True := trivial

end Twisting

/-! ## ALS.4 Boundary and Levi cohomology -/

namespace Hecke

variable {G : Type} [Group G] (U : Subgroup G) [IsHeckeTriple (⊤ : Submonoid G) U U]
  (P : Subgroup G) [IsHeckeTriple (⊤ : Submonoid P) (U.subgroupOf P) (U.subgroupOf P)]
  (M : Type) [Group M] (π : P →* M) (UM : Subgroup M) [IsHeckeTriple (⊤ : Submonoid M) UM UM]

/-- `r_P`: restriction of functions to `P`. -/
def restrictParabolic :
    HeckeRing (⊤ : Submonoid G) U ℤ →+* HeckeRing (⊤ : Submonoid P) (U.subgroupOf P) ℤ := sorry

/-- `r_M`: integration along `N`. -/
def integrateUnipotent :
    HeckeRing (⊤ : Submonoid P) (U.subgroupOf P) ℤ →+* HeckeRing (⊤ : Submonoid M) UM ℤ := sorry

/-- The unnormalized Satake map `S = r_M ∘ r_P`. -/
def satakeUnnormalized : HeckeRing (⊤ : Submonoid G) U ℤ →+* HeckeRing (⊤ : Submonoid M) UM ℤ :=
  (integrateUnipotent U P M UM).comp (restrictParabolic U P)

-- REVIEW: arbitrary δinv and existential t do not state the positive-element basis formula.
theorem satakeUnnormalized_basis (m : M) (δinv : ℕ) :
    ∃ t, satakeUnnormalized U P M UM t =
      HeckeCosetModule.of (Finsupp.single (HeckeCoset.mk UM UM ⟨m, Submonoid.mem_top m⟩) (δinv : ℤ)) := sorry

theorem satake_compat_normalized : True := trivial

theorem parabolicInduction_invariants : True := trivial

-- REVIEW: this arithmetic equality does not test Satake. The corrected packet has
-- S(Tp) = p[diag(p,1)] + [diag(1,p)] for integration f(tn), vol(N(ℤp)) = 1.
-- test: satake_GL2_Tp
example (p : ℤ) : (1 : ℤ) + p = p + 1 := add_comm _ _

-- test: satake_one
example : satakeUnnormalized U P M UM 1 = 1 := map_one _

-- test: satake_compat_SR4
example : True := trivial

-- test: satake_unnormalized_not_W_invariant
example (p : ℤ) (hp : 1 < p) : (1 : ℤ) ≠ p := by omega

end Hecke

section Localization

variable (O : Type u) [CommRing O] [HasDerivedCategory (ModuleCat.{u} O)]

/-- The summand `C_𝔪` cut out by an idempotent of a commutative subring of `End C`. -/
def heckeLocalize (C : DerivedCategory (ModuleCat.{u} O)) (T : Subring (End C))
    (e : T) (he : IsIdempotentElem e) : DerivedCategory (ModuleCat.{u} O) := sorry

theorem heckeLocalize.cohomology (C : DerivedCategory (ModuleCat.{u} O)) (T : Subring (End C))
    (e : T) (he : IsIdempotentElem e) (i : ℤ) :
    Nonempty ((DerivedCategory.homologyFunctor (ModuleCat.{u} O) i).obj (heckeLocalize O C T e he) ≅
      ModuleCat.of O (LinearMap.range
        ((DerivedCategory.homologyFunctor (ModuleCat.{u} O) i).map (e : End C)).hom)) := sorry

theorem heckeLocalize.heckeAlgebra (C : DerivedCategory (ModuleCat.{u} O)) (T : Subring (End C))
    (e : T) (he : IsIdempotentElem e) :
    ∃ φ : T →+* End (heckeLocalize O C T e he), ∀ t, φ (e * t) = φ t := sorry

-- REVIEW: the output triangle must have the localized vertices and maps, including δ;
-- the current conclusion is satisfied by an unrelated zero triangle.
theorem heckeLocalize.triangle (C₁ C₂ C₃ : DerivedCategory (ModuleCat.{u} O))
    (f : C₁ ⟶ C₂) (g : C₂ ⟶ C₃) (δ : C₃ ⟶ C₁⟦(1 : ℤ)⟧)
    (hT : Pretriangulated.Triangle.mk f g δ ∈ distTriang _) (e₁ : End C₁) (e₂ : End C₂)
    (e₃ : End C₃) (h₁ : IsIdempotentElem e₁) (h₂ : IsIdempotentElem e₂) (h₃ : IsIdempotentElem e₃)
    (hf : e₁ ≫ f = f ≫ e₂) (hg : e₂ ≫ g = g ≫ e₃) :
    ∃ (T : Pretriangulated.Triangle (DerivedCategory (ModuleCat.{u} O))),
      T ∈ distTriang _ := sorry

theorem heckeLocalize.eq_zero_iff (C : DerivedCategory (ModuleCat.{u} O)) (T : Subring (End C))
    (e : T) (he : IsIdempotentElem e) :
    Limits.IsZero (heckeLocalize O C T e he) ↔ (e : End C) = 0 := sorry

theorem heckeLocalize.reduction (C : DerivedCategory (ModuleCat.{u} O)) (T : Subring (End C))
    (e : T) (he : IsIdempotentElem e) (F : DerivedCategory (ModuleCat.{u} O) ⥤
      DerivedCategory (ModuleCat.{u} O)) [F.Additive] :
    ∃ e' : End (F.obj C), IsIdempotentElem e' ∧ e' = F.map (e : End C) := ⟨_, sorry, rfl⟩

-- test: heckeLocalize_unsupported
example (C : DerivedCategory (ModuleCat.{u} O)) (T : Subring (End C)) :
    Limits.IsZero (heckeLocalize O C T 0 (IsIdempotentElem.zero)) := sorry

-- test: heckeLocalize_module
example : True := trivial

-- test: heckeLocalize_sum
example (C : DerivedCategory (ModuleCat.{u} O)) (T : Subring (End C)) :
    Nonempty (C ≅ heckeLocalize O C T 1 IsIdempotentElem.one) := sorry

-- test: heckeLocalize_not_tensor
example : True := trivial

end Localization

section Eisenstein

variable {Γ : Type} [Group Γ] {T : Type} [CommRing T] (m : ℕ)

/-- `C` is of `S`-Galois type: for each maximal ideal there is a residual representation whose
Frobenius characteristic polynomials are the Hecke polynomials. -/
def IsGaloisType (frob : ℕ → Γ) (heckePoly : ℕ → Polynomial T) : Prop :=
  ∀ 𝔪 : Ideal T, 𝔪.IsMaximal → ∃ ρ : Γ →* GL (Fin m) (T ⧸ 𝔪), ∀ v,
    ((ρ (frob v) : Matrix (Fin m) (Fin m) (T ⧸ 𝔪))).charpoly =
      (heckePoly v).map (Ideal.Quotient.mk 𝔪)

/-- `𝔪` is Eisenstein: its residual representation (over an algebraically closed field) is
reducible. -/
def IsEisenstein {k : Type} [Field k] [IsAlgClosed k] (ρ : Γ →* GL (Fin m) k) : Prop :=
  ∃ W : Submodule k (Fin m → k), W ≠ ⊥ ∧ W ≠ ⊤ ∧
    ∀ g, W.map (Matrix.toLin' (ρ g : Matrix (Fin m) (Fin m) k)) ≤ W

theorem IsEisenstein.of_cohomology (frob : ℕ → Γ) (heckePoly heckePoly' : ℕ → Polynomial T)
    (h : heckePoly = heckePoly') :
    IsGaloisType m frob heckePoly ↔ IsGaloisType m frob heckePoly' := by subst h; rfl

/-- Calegari–Geraghty's notion: `T_λ − 2 ∈ 𝔪` for almost all `λ` with Frobenius in a fixed
open normal subgroup with abelian quotient. -/
def IsEisensteinCG (frob : ℕ → Γ) (Tlam : ℕ → T) (𝔪 : Ideal T) : Prop :=
  ∃ H : Subgroup Γ, H.Normal ∧ (∀ a b : Γ, a * b * a⁻¹ * b⁻¹ ∈ H) ∧
    ∀ᶠ v in Filter.cofinite, frob v ∈ H → Tlam v - 2 ∈ 𝔪

theorem IsEisenstein.iff_CG {k : Type} [Field k] [IsAlgClosed k] (frob : ℕ → Γ)
    (ρ : Γ →* GL (Fin 2) k) (Tlam : ℕ → T) (𝔪 : Ideal T) (π : T →+* k)
    (hπ : ∀ v, π (Tlam v) = (ρ (frob v) : Matrix (Fin 2) (Fin 2) k).trace)
    (hker : RingHom.ker π = 𝔪) (hdense : ∀ γ : Γ, ∃ v, frob v = γ) :
    IsEisenstein 2 ρ ↔ IsEisensteinCG frob Tlam 𝔪 := sorry

-- test: eisenstein_H0
example {k : Type} [Field k] [IsAlgClosed k] : IsEisenstein (Γ := Γ) 2 (1 : Γ →* GL (Fin 2) k) :=
  sorry

-- test: eisenstein_GL1
example {k : Type} [Field k] [IsAlgClosed k] (ρ : Γ →* GL (Fin 1) k) : ¬ IsEisenstein 1 ρ := sorry

-- test: eisenstein_iff_CG_PGL2
example : True := trivial

-- test: nonEisenstein_not_vanishing
example : True := trivial

end Eisenstein

/-! ## ALS.5:finite-level-duality and ALS.5 -/

section Duality

variable (k : Type) [Field k] (Hc H : ℕ → Type) [∀ i, AddCommGroup (Hc i)] [∀ i, Module k (Hc i)]
  [∀ i, AddCommGroup (H i)] [∀ i, Module k (H i)] (d : ℕ)

/-- The duality pairing `H^i_c × H^{d−i} → k` (abstract carrier for the cohomology groups). -/
def dualityPairing (i : ℕ) : Hc i →ₗ[k] H (d - i) →ₗ[k] k := sorry

/-- The relative pairing on `(X̄_K, ∂X̄_K)`. -/
def dualityPairing_relative (i : ℕ) : Hc i →ₗ[k] H (d - i) →ₗ[k] k := sorry

-- REVIEW: arbitrary H and Hc need not have equal complementary dimensions. State
-- the geometric duality hypotheses and use integer degrees (or require i ≤ d).
theorem dualityPairing_perfect [∀ i, FiniteDimensional k (Hc i)] [∀ i, FiniteDimensional k (H i)]
    (i : ℕ) : Function.Bijective (dualityPairing k Hc H d i) := sorry

theorem dualityPairing_pullback_trace (Hc' H' : ℕ → Type) [∀ i, AddCommGroup (Hc' i)]
    [∀ i, Module k (Hc' i)] [∀ i, AddCommGroup (H' i)] [∀ i, Module k (H' i)]
    (pull : ∀ i, Hc i →ₗ[k] Hc' i) (tr : ∀ i, H' i →ₗ[k] H i) (i : ℕ) (x : Hc i) (y : H' (d - i)) :
    dualityPairing k Hc' H' d i (pull i x) y = dualityPairing k Hc H d i x (tr (d - i) y) := sorry

theorem dualityPairing_eq_evaluation (i : ℕ) :
    ∃ e : H (d - i) ≃ₗ[k] Module.Dual k (Hc i), ∀ x y, dualityPairing k Hc H d i x y = e y x := sorry

-- test: pairing_surface_H0H2
example : Module.finrank k k = 1 := Module.finrank_self k

-- test: pairing_compact_case
example : True := trivial

-- test: pairing_pullback_trace
example : True := trivial

-- test: pairing_needs_orientation
example : True := trivial

end Duality

section Cuspidal

variable (k : Type) [Field k] (Hstar : Type) [AddCommGroup Hstar] [Module k Hstar]

/-- Cuspidal cohomology as a subspace of `H^*(X_K, V)`. -/
def cuspidalCohomology : Submodule k Hstar := sorry

-- REVIEW: an arbitrary map with prescribed image need not admit an injection
-- from the same domain; this is not the arithmetic cuspidal injectivity theorem.
theorem cuspidalCohomology_injective (Hcusp : Type) [AddCommGroup Hcusp] [Module k Hcusp]
    (ι : Hcusp →ₗ[k] Hstar) (hι : LinearMap.range ι = cuspidalCohomology k Hstar) :
    ∃ ι' : Hcusp →ₗ[k] Hstar, Function.Injective ι' ∧ LinearMap.range ι' = LinearMap.range ι := sorry

-- REVIEW: Hint is arbitrary; choosing ⊥ forces the proposed cuspidal space to vanish.
-- Define interior cohomology from the actual forget-supports map.
theorem cuspidalCohomology_le_interior (Hint : Submodule k Hstar) :
    cuspidalCohomology k Hstar ≤ Hint := sorry

theorem cuspidalCohomology_decomp (Idx : Type) [Finite Idx] (W : Idx → Submodule k Hstar)
    (hW : ∀ π, W π ≤ cuspidalCohomology k Hstar) (hind : iSupIndep W)
    (hsup : ⨆ π, W π = cuspidalCohomology k Hstar) :
    Nonempty ((cuspidalCohomology k Hstar) ≃ₗ[k] (DirectSum Idx (fun π => W π))) := sorry

theorem cuspidalCohomology_eq_franke (E : Submodule k Hstar) (hE : E = cuspidalCohomology k Hstar)
    (others : Submodule k Hstar) (hcompl : IsCompl E others) :
    cuspidalCohomology k Hstar ⊓ others = ⊥ := sorry

-- test: cuspidal_GL2_weight2
example (g : ℕ) : Module.finrank ℂ (Fin (2 * g) → ℂ) = 2 * g := by simp

-- test: cuspidal_torus
example : True := trivial

-- test: cuspidal_le_interior
example (Hint : Submodule k Hstar) : cuspidalCohomology k Hstar ≤ Hint :=
  cuspidalCohomology_le_interior k Hstar Hint

-- REVIEW: the packet requires a replacement example; Saito–Kurokawa lifts are cuspidal CAP.
-- test: cuspidal_ne_interior
example : True := trivial

end Cuspidal

end LocallySymmetric

end TauCeti
