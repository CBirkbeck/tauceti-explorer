import Mathlib.LinearAlgebra.Matrix.GeneralLinearGroup.Defs
import Mathlib.Topology.Algebra.Group.Basic
import Mathlib.Topology.Instances.Matrix
import Mathlib.RingTheory.LocalRing.ResidueField.Defs
import Mathlib.RingTheory.Artinian.Ring
import Mathlib.RingTheory.MvPowerSeries.Basic
import Mathlib.GroupTheory.GroupAction.Quotient
import Mathlib.Data.ZMod.Basic
import Mathlib.LinearAlgebra.Matrix.Determinant.Basic
import Mathlib.LinearAlgebra.Matrix.Notation
import Mathlib.Tactic.LinearCombination
import Mathlib.LinearAlgebra.Matrix.Trace
import Mathlib.RingTheory.Polynomial.Basic
import Mathlib.Data.ZMod.Defs
import Mathlib.Algebra.Field.ZMod
import Mathlib.RingTheory.AdicCompletion.Basic
import Mathlib.RingTheory.Noetherian.Defs
import Mathlib.RingTheory.LocalRing.ResidueField.Basic
import Mathlib.LinearAlgebra.Dimension.RankNullity
import Mathlib.LinearAlgebra.Dimension.DivisionRing
import Mathlib.LinearAlgebra.Dimension.Constructions
import Mathlib.LinearAlgebra.Pi
import Mathlib.LinearAlgebra.Quotient.Basic

/-!
# Suggested Lean forms: global Galois deformations (GlobalGaloisDeformations, R04.1–R04.6, G7–G8)

**Standard note.** This file is not the roadmap and it is not exhaustive. The roadmap document
(`GlobalGaloisDeformations`) is definitive. The statements below suggest Lean forms, so that
contributors and reviewers converge on names and signatures. Every proof of a new declaration is
`sorry`; nothing here claims to be formalised.

Pinned baseline: Mathlib `082e2d3`, Tau Ceti `f790474`. This file imports Mathlib only.

Fix revision (round 3): Claude claude-c9TlsS, 6 October 2026, Refs #5870. The determinant comparison is divided
between `R04.1/determinant-comparison` (the determinant map and its non-injectivity) and the new
`R04.2/determinant-comparison-isomorphism` (bijectivity for absolutely irreducible residual representations);
both are in the comment block of supplier-dependent sketches below, which is not elaborated. The file
elaborates at the pinned Mathlib with `sorry` as its only warning.
Independent review REV-FIX-RT-AREA-langlands-2~3: Claude claude-hd6PQ0, 7 October 2026, Refs #5871;
accepted; its declarations are unchanged by that review. The file elaborates with `lake env lean` against Mathlib `082e2d3`
with no errors; its only warnings are 18 `declaration uses sorry`.

Fix revision: Codex codex-5ebb6f, 30 September 2026, Refs #5142. Independent REV-FIX records needs_changes (2 October 2026, Refs #5143).
The earlier revision did not claim compilation. FIX-RT-BP-GlobalGaloisDeformations (#5719)
repairs the signatures and adds the regressions below; its fresh elaboration receipt is in the fixes report.
R04.5 imports the finite-image classification, invariants, H¹ vanishing and adjoint submodule
list from R01.4. The missing supplier is not replaced by numerical group-order tests or an axiom.
KW II author-final numbering: generators Lemma 4.4; relations Lemma 4.6; dimension Proposition 4.5.
The ESI preprint calls the relation bound Lemma 4.5. Corollary 4.7 also needs finiteness and is
applied at R24.2, using R03.4 algebra; it is not a second global-presentation theorem.
G8's variable-determinant problem, representability and presentation supply arithmetic data to
PA.3 together with the L7/L8 local component exports. P9 retains its abstract hypotheses.
Stage-edge promotion remains a maintainer handoff. The existing signatures below retain their
actual rank/determinant assumptions and are not evidence that the missing arithmetic is built.

## Conventions

* The raw `Lift` carrier only records a commutative ring, topology and a reduction map.
  It does NOT turn that map into a residue map. Source coefficient rings are local,
  with `π` surjective and `RingHom.ker π = IsLocalRing.maximalIdeal A`.
  The normalization theorem explicitly requires these hypotheses. The trace theorem
  additionally requires Noetherianity and maximal-ideal adic completeness (Gee's C_𝒪);
  its Artinian-local variant is Kisin's Lecture 1 theorem. The actual coefficient
  categories and their topology remain imports from R03.1, never new local carriers.
* `Γ̂_n(A) = ker (GL_n(A) → GL_n(𝔽))`; deformations are lifts modulo conjugation by `Γ̂_n(A)`
  (strict equivalence), not by all of `GL_n(A)`.
* Continuity of a lift is continuity of its matrix entries.
* Pro-representability is a theorem about these functors, not part of their definition.
-/

open Matrix

noncomputable section

namespace TauCeti.GaloisDeformation

variable {G : Type*} [Group G] [TopologicalSpace G]
variable {𝔽 : Type*} [Field 𝔽]
variable (n : ℕ) (ρbar : G →* GL (Fin n) 𝔽)

section Lifts

variable {A : Type*} [CommRing A] [TopologicalSpace A] (π : A →+* 𝔽)

/-- **`R04.1/lifting-functor`**. A lift of `ρ̄` to the coefficient ring `(A, π)`: a continuous
homomorphism `G → GL_n(A)` reducing to `ρ̄`. -/
@[ext]
structure Lift where
  toHom : G →* GL (Fin n) A
  continuous : Continuous fun g ↦ (toHom g : Matrix (Fin n) (Fin n) A)
  reduce : (Matrix.GeneralLinearGroup.map π).comp toHom = ρbar

/-- `Γ̂_n(A)`: invertible matrices reducing to the identity. -/
def strictKernel : Subgroup (GL (Fin n) A) := (Matrix.GeneralLinearGroup.map (n := Fin n) π).ker

/-- Strict conjugation of lifts. -/
instance : MulAction (strictKernel n π) (Lift n ρbar π) := sorry

/-- **`R04.1/strict-deformation-functor`**. Deformations: lifts modulo strict conjugation. -/
def Def : Type _ := MulAction.orbitRel.Quotient (strictKernel n π) (Lift n ρbar π)

/-- API: two lifts define the same deformation iff they are conjugate by `Γ̂_n(A)`. -/
theorem def_mk_eq_iff (ρ ρ' : Lift n ρbar π) :
    (Quotient.mk (MulAction.orbitRel _ _) ρ : Def n ρbar π) = Quotient.mk _ ρ' ↔
      ∃ a ∈ strictKernel n π, ∀ g, ρ'.toHom g = a * ρ.toHom g * a⁻¹ := sorry

/-- **`R04.1/fixed-determinant-functors`**. Lifts with determinant `χ_A`. -/
def LiftDet (χ : G →* Aˣ) : Set (Lift n ρbar π) :=
  {ρ | ∀ g, Matrix.GeneralLinearGroup.det (ρ.toHom g) = χ g}

/-- API: strict conjugation preserves the fixed-determinant condition. -/
theorem smul_mem_liftDet (χ : G →* Aˣ) (a : strictKernel n π) {ρ : Lift n ρbar π}
    (hρ : ρ ∈ LiftDet n ρbar π χ) : a • ρ ∈ LiftDet n ρbar π χ := sorry

end Lifts

section Restriction

variable {H : Type*} [Group H] [TopologicalSpace H]
variable {A : Type*} [CommRing A] [TopologicalSpace A] (π : A →+* 𝔽)

/-- **`R04.1/restriction-of-deformations`**. Restriction along a continuous homomorphism. -/
def Lift.restrict (ι : H →* G) (hι : Continuous ι) (ρ : Lift n ρbar π) : Lift n (ρbar.comp ι) π :=
  sorry

/-- API: the framed local restriction `α⁻¹ (ρ ∘ ι) α` is invariant under
`(ρ, α) ↦ (β ρ β⁻¹, β α)`. -/
theorem framed_restrict_invariant (ι : H →* G) (ρ : G →* GL (Fin n) A)
    (α β : GL (Fin n) A) (h : H) :
    (β * α)⁻¹ * (β * ρ (ι h) * β⁻¹) * (β * α) = α⁻¹ * ρ (ι h) * α := sorry

end Restriction

section Schur

/-- `ρ̄` is Schur: its `𝔽[G]`-endomorphisms are scalars. -/
def IsSchur : Prop :=
  ∀ M : Matrix (Fin n) (Fin n) 𝔽, (∀ g, M * (ρbar g : Matrix (Fin n) (Fin n) 𝔽) =
    (ρbar g : Matrix (Fin n) (Fin n) 𝔽) * M) → ∃ c : 𝔽, M = c • (1 : Matrix (Fin n) (Fin n) 𝔽)

variable {A : Type*} [CommRing A] [TopologicalSpace A] (π : A →+* 𝔽)

/-- **`R04.1/strict-vs-full-conjugacy`**. For Schur `ρ̄`, `GL_n(A)`-conjugate lifts are strictly
conjugate over a LOCAL coefficient ring with its genuine residue map. Surjectivity alone
is insufficient: see the integral S₃ regression below. -/
theorem strict_of_full [IsLocalRing A]
    (hres : RingHom.ker π = IsLocalRing.maximalIdeal A) (hS : IsSchur n ρbar) (hπ : Function.Surjective π) (ρ ρ' : Lift n ρbar π)
    (a : GL (Fin n) A) (h : ∀ g, ρ'.toHom g = a * ρ.toHom g * a⁻¹) :
    ∃ b ∈ strictKernel n π, ∀ g, ρ'.toHom g = b * ρ.toHom g * b⁻¹ := sorry

end Schur

section PhiP

variable (p : ℕ) (G)

/-- **`R04.2/phi-p-condition`**. Mazur's `Φ_p`: every open subgroup has finitely many
homomorphisms to `ℤ/p` with open kernel. -/
def PhiP : Prop :=
  ∀ Δ : Subgroup G, IsOpen (Δ : Set G) →
    Finite {f : Δ →* Multiplicative (ZMod p) // IsOpen (f.ker : Set Δ)}

variable {G}

/-- API: `Φ_p` passes to open subgroups. -/
theorem PhiP.of_open (h : PhiP G p) (Δ : Subgroup G) (hΔ : IsOpen (Δ : Set G)) : PhiP Δ p := sorry

end PhiP

section Comparison

variable {R : Type*} [CommRing R]

/-- **`R04.2/framed-unframed-comparison`**, explicit form: the framed universal lift
`(1 + X) ρ^univ (1 + X)⁻¹` over `R[[X_{ij}]]/(X_{11})`, here recorded on the level of matrices:
normalising the `(1,1)` entry determines a matrix `1 + X` of `Γ̂_n` up to scalars. -/
theorem exists_unique_normalized (hn : 0 < n) (a : Matrix (Fin n) (Fin n) R)
    (ha : IsUnit (a ⟨0, hn⟩ ⟨0, hn⟩)) :
    ∃! c : Rˣ, (((c : R) • a) ⟨0, hn⟩ ⟨0, hn⟩ = 1) := sorry

end Comparison

section Carayol

variable {A : Type*} [CommRing A] [TopologicalSpace A] (π : A →+* 𝔽)

/-- **`R04.2/carayol-trace-theorem`** (2), Gee Lemma 3.7 on complete Noetherian
LOCAL rings. The spanning hypothesis is Burnside's condition; a nonlocal ring with a
surjective map to the same field is not an admissible coefficient object. -/
theorem strictly_conj_of_trace_eq [IsLocalRing A] [IsNoetherianRing A]
    [IsAdicComplete (IsLocalRing.maximalIdeal A) A]
    (hπ : Function.Surjective π) (hres : RingHom.ker π = IsLocalRing.maximalIdeal A)
    (habs : Submodule.span 𝔽 (Set.range fun g ↦ (ρbar g : Matrix (Fin n) (Fin n) 𝔽)) = ⊤)
    (ρ ρ' : Lift n ρbar π) (htr : ∀ g, (ρ.toHom g : Matrix (Fin n) (Fin n) A).trace =
      (ρ'.toHom g : Matrix (Fin n) (Fin n) A).trace) :
    ∃ a ∈ strictKernel n π, ∀ g, ρ'.toHom g = a * ρ.toHom g * a⁻¹ := sorry

/-- The separate Artinian-local form (Kisin Lecture 1, Theorem 1.4.1).
This is a prototype for the imported Art_𝒪 category, not a restriction of the packet's C_𝒪 theorem. -/
theorem strictly_conj_of_trace_eq_artinian [IsLocalRing A] [IsArtinianRing A]
    (hπ : Function.Surjective π) (hres : RingHom.ker π = IsLocalRing.maximalIdeal A)
    (habs : Submodule.span 𝔽 (Set.range fun g ↦ (ρbar g : Matrix (Fin n) (Fin n) 𝔽)) = ⊤)
    (ρ ρ' : Lift n ρbar π) (htr : ∀ g, (ρ.toHom g : Matrix (Fin n) (Fin n) A).trace =
      (ρ'.toHom g : Matrix (Fin n) (Fin n) A).trace) :
    ∃ a ∈ strictKernel n π, ∀ g, ρ'.toHom g = a * ρ.toHom g * a⁻¹ := sorry

end Carayol

section Global

variable {A : Type*} [CommRing A] [TopologicalSpace A] (π : A →+* 𝔽) (T : Type*)

/-- **`R04.3/global-deformation-type`**. A `T`-framed lift: a lift together with framings
`α_v ∈ Γ̂_n(A)` for `v ∈ T` (local conditions are imposed separately). -/
structure TFramedLift where
  lift : Lift n ρbar π
  frame : T → strictKernel n π

/-- The equivalence `(ρ, α) ∼ (β ρ β⁻¹, β α)`. -/
instance : MulAction (strictKernel n π) (TFramedLift n ρbar π T) := sorry

/-- `T`-framed deformations: `T`-framed lifts modulo simultaneous strict conjugation. -/
def TFramedDef : Type _ := MulAction.orbitRel.Quotient (strictKernel n π) (TFramedLift n ρbar π T)

/-- API: the framed local lift `α_v⁻¹ ρ α_v` (here on the whole group) is constant on classes. -/
theorem framedLocalLift_smul (x : TFramedLift n ρbar π T) (b : strictKernel n π) (v : T) (g : G) :
    ((b • x).frame v : GL (Fin n) A)⁻¹ * (b • x).lift.toHom g * (b • x).frame v =
      (x.frame v : GL (Fin n) A)⁻¹ * x.lift.toHom g * x.frame v := sorry

end Global

section Twisting

variable {A : Type*} [CommRing A] [TopologicalSpace A] (π : A →+* 𝔽)

/-- **`R04.4/twisting-action`**. The twist `χ ⊗ ρ` of a lift by a continuous character `χ`
that reduces to the trivial character. -/
def Lift.twist (χ : G →* Aˣ) (hχ : ∀ g, π (χ g) = 1)
    (hc : Continuous fun g ↦ ((χ g : Aˣ) : A)) (ρ : Lift n ρbar π) : Lift n ρbar π := sorry

/-- API: `χ ⊗ ρ` has matrices `χ(g) • ρ(g)`. -/
theorem Lift.twist_apply (χ : G →* Aˣ) (hχ : ∀ g, π (χ g) = 1)
    (hc : Continuous fun g ↦ ((χ g : Aˣ) : A)) (ρ : Lift n ρbar π) (g : G) :
    ((ρ.twist n ρbar π χ hχ hc).toHom g : Matrix (Fin n) (Fin n) A) =
      ((χ g : Aˣ) : A) • (ρ.toHom g : Matrix (Fin n) (Fin n) A) := sorry

/-- **`R04.4/twist-action-free`**, the trace step: `tr (χ ⊗ ρ)(g) = χ(g) · tr ρ(g)`. -/
theorem Lift.trace_twist (χ : G →* Aˣ) (hχ : ∀ g, π (χ g) = 1)
    (hc : Continuous fun g ↦ ((χ g : Aˣ) : A)) (ρ : Lift n ρbar π) (g : G) :
    ((ρ.twist n ρbar π χ hχ hc).toHom g : Matrix (Fin n) (Fin n) A).trace =
      ((χ g : Aˣ) : A) * (ρ.toHom g : Matrix (Fin n) (Fin n) A).trace := sorry

/-- The twist commutes with strict conjugation, so it acts on `Def`. -/
theorem Lift.twist_smul (χ : G →* Aˣ) (hχ : ∀ g, π (χ g) = 1)
    (hc : Continuous fun g ↦ ((χ g : Aˣ) : A)) (ρ : Lift n ρbar π) (b : strictKernel n π) :
    (b • ρ).twist n ρbar π χ hχ hc = b • ρ.twist n ρbar π χ hχ hc := sorry

end Twisting

/-!
## Signatures against Tau Ceti and the requested suppliers (comment only)

These need Tau Ceti's continuous cohomology and the R03.1/R03.2 coefficient categories, which are
not available as oleans on this server; they are recorded here, not elaborated.

```
-- R04.1/tangent-spaces
def liftDualNumbersEquiv : TauCeti.ContCohomology.Z1 G (Matrix (Fin n) (Fin n) 𝔽) ≃ Lift n ρbar (DualNumber.fst : 𝔽[ε] →+* 𝔽)
theorem defDualNumbersEquiv : Def n ρbar DualNumber.fst ≃ TauCeti.ContCohomology.H1 G (ad ρbar)
-- R04.2/universal-lifting-ring (with Art_𝒪, C_𝒪 from R03.1 and Schlessinger from R03.2)
theorem Lift.proRepresentable (hG : PhiP G p) : (Lift n ρbar).IsProRepresentable (C 𝒪)
-- R04.2/universal-deformation-ring
theorem Def.proRepresentable (hG : PhiP G p) (hS : IsSchur n ρbar) : (Def n ρbar).IsProRepresentable (C 𝒪)
-- R04.1/determinant-deformation-functor (determinants from IHG.0)
def DetDef (Dbar : Determinant 𝔽 G n) : ArtO ⥤ Type
-- R04.1/determinant-comparison: the determinant map only (no irreducibility hypothesis, nothing from R04.2)
def Def.toDetDef : Def n ρbar ⟶ DetDef (Determinant.ofRep ρbar)
theorem Def.toDetDef_not_injective_of_ext (hext : 1 < finrank 𝔽 (Ext¹ χ₂ χ₁)) (hρ : ρbar.IsNonsplitExtension χ₂ χ₁) :
    ¬ Function.Injective ((Def.toDetDef (ρbar := ρbar)).app 𝔽[ε])
-- R04.2/determinant-comparison-isomorphism (Chenevier 2.22(i) from IHG.0, and R04.2/carayol-trace-theorem)
theorem Def.toDetDef_bijective (habs : AbsolutelyIrreducible ρbar) (A : ArtO) :
    Function.Bijective ((Def.toDetDef (ρbar := ρbar)).app A)
-- R04.4/restriction-ring-map and restriction-finiteness (Σ open in Γ, ρ̄|Σ absolutely irreducible)
def resRing (ι : Σ →* Γ) : Runiv (ρbar.comp ι) →ₐ[𝒪] Runiv ρbar
theorem resRing_finite (hΣ : IsOpen (Set.range ι)) (habs : AbsolutelyIrreducible (ρbar.comp ι)) :
    letI := (resRing ι).toAlgebra; Module.Finite (Runiv (ρbar.comp ι)) (Runiv ρbar)
-- R04.4/enlarging-ramification
theorem inflRing_surjective (hS : S ⊆ S') : Function.Surjective (inflRing hS : R□ S' →ₐ[𝒪] R□ S)
-- R04.4/diagonalizable-groups and free-action-quotient (group functors on C_𝒪 from R03.1)
def DiagGroup (a : Type*) [AddCommGroup a] : C 𝒪 ⥤ Grp   -- A ↦ Hom(a, 1 + 𝔪_A)
theorem freeQuotient_smooth (hG : FormallySmooth (A G)) (hfree : IsFreeAction G X) :
    Algebra.FormallySmooth (invariants G X) (A X)
-- R04.4/determinant-fixed-on-S and determinant-twist-torsor
def detMap : Sp (RdetOnS S V) ⟶ DiagGroup (G_V)
theorem detMap_twist (χ) (x) : detMap (χ • x) = χ ^ 2 * detMap x
-- R04.5/taylor-wiles-datum and the existence theorems (Chebotarev from Tau Ceti)
structure TaylorWilesDatum (N : ℕ) where
  Q : Finset (FinitePlace F)
  disjoint : Disjoint Q S
  cong : ∀ v ∈ Q, p ^ N ∣ absNorm v - 1
  distinct : ∀ v ∈ Q, (ρbar (Frob v)).charpoly.roots.Nodup
  α : ∀ v ∈ Q, 𝔽                      -- the chosen eigenvalue
theorem exists_taylorWiles_odd (hp : p ≠ 2) (h : IsCyclotomicAbsIrred ρbar) (N : ℕ) :
    ∃ D : TaylorWilesDatum N, D.Q.card = dualSelmerDim ∧ dualSelmer (S ∪ D.Q) = ⊥
-- R04.6/kw-deformation-data, taylor-wiles-deformation-system, factorization-through-local-conditions
structure KWDeformationData where
  S : Finset (Place F)
  cond : ∀ v ∈ S, LocalCondition v                       -- from LocalGaloisDeformationRings R08.6
theorem KWDeformationData.localRing_relDim : relDim (D.localRing) = 3 * D.S.card
theorem factor_through_localConditions (A) [IsReduced A] [Module.Flat 𝒪 A] [Module.Finite 𝒪 A]
    (ρ : Lift ρbar A) (h : ∀ x : A →ₐ[𝒪] 𝒪', (ρ.map x).SatisfiesConditions D) :
    ∃! φ : D.unframedRing →ₐ[𝒪] A, φ.comp D.univRep = ρ
-- R04.4/inertia-rigid-deformations
theorem inertiaRigid_dim (C : irreducibleComponent (R□φ0fl ρ₀)) : absDim C = d ^ 2
-- R04.3/relative-tangent-space, exact R02.5/D8 request; L2 owns the mapping fibre.
-- M = ad ρbar, M0 = ker trace. Cglob⁰ = C⁰(G,M), Cglobⁱ = Cⁱ(G,M0) for i>0.
-- Cloc⁰ = ⊕_{v∈T} C⁰(Gv,M).
-- Cloc¹ = ⊕_T C¹(Gv,M0) ⊕ ⊕_{S\\T} C¹(Gv,M0)/Ltilde_v.
-- Here Ltilde_v ⊆ Z¹ ⊆ C¹ is the preimage of L_v under Z¹ → H¹.
-- Clocⁱ = ⊕_S Cⁱ(Gv,M0) for i≥2; all negative terms are zero.
-- Crelⁱ = Cglobⁱ ⊕ Cloc^(i-1) = Cone(res)[-1],
-- d(φ,ψ) = (dφ,res φ-dψ). In degree zero the full-adjoint commutator lands in M0.
-- Its LES begins 0→H⁰rel→H⁰(G,M)→⊕_T H⁰(Gv,M)→H¹rel→H¹(G,M0)→… .
-- The dual ordinary Selmer kernel (conditions L_v^⊥ only at S\\T) is DISTINCT.
-- T nonempty, p>2, p∤n, T contains all p-adic places, all finite, Schur residual:
-- H⁰rel=0 and the EXISTING E3 correction gives #T-1, not #T.
-- Use ℤ for the Euler identity; Nat subtraction would truncate negative summands.
theorem relTangent_finrank (hT : T.Nonempty) :
    (finrank 𝔽 (relTangent D T) : ℤ) = (T.card : ℤ) - 1 -
      (∑ v ∈ infPlaces F, (h0 v ad0 : ℤ)) +
      (∑ v ∈ S \\ T, ((finrank 𝔽 (L v) : ℤ) - (h0 v ad0 : ℤ))) +
      (dualSelmerDim D T : ℤ) - (h0Global ad0Twist : ℤ)
-- T empty has H⁰rel=k and ordinary fixed-determinant Selmer H¹. It does NOT
-- inherit the formula's assumption T contains all p-adic places.
-- G8/variable-determinant-problem and variable-determinant-representability (ACC+ 6.2.2–6.2.4)
structure GlobalDeformationProblem where
  S : Finset (FinitePlace F)
  Λ : ∀ v ∈ S, CNL 𝒪                                      -- Λ = ⊗̂_v Λ_v
  D : ∀ v ∈ S, LocalDeformationProblem (ρbar.restrict v)   -- strict-conjugation-stable quotients of R□_v
theorem framedRing_iso (𝒮 : GlobalDeformationProblem) (hT : T.Nonempty) (v₀ ∈ T) :
    R T 𝒮 ≃ₐ[Λ] R ∅ 𝒮 ⊗̂ (MvPowerSeries (T × Fin n × Fin n) 𝒪 ⧸ Ideal.span {X (v₀, 0, 0)})   -- n²|T| − 1 variables
-- G8/variable-determinant-presentation (ad ρ̄, not ad⁰ρ̄)
theorem presentation (hT : T.Nonempty) :
    ∃ f : MvPowerSeries (Fin (h1ST 𝒮 T ad)) (Rloc 𝒮 T) →ₐ[Λ] R T 𝒮, Function.Surjective f
-- G7/polarized-deformation-problem and polarized-representability (CHT §2.2–2.3)
def GroupGn (n : ℕ) : Type _   -- (GL_n × GL_1) ⋊ {1, j}, with ν : 𝒢_n → GL_1
theorem polarized_framedRing_iso (hS : IsSchur r̄) :
    R□T 𝒮 ≃ₐ[𝒪] MvPowerSeries (T × Fin n × Fin n) (Runiv 𝒮)   -- n²|T| variables: the centraliser is trivial
```
-/

/- Round-2 planning boundary (FIX-RT-AREA-langlands-1~2).

R04.5/chebotarev-selmer-selection is the shared arithmetic selection lemma.
Its future signature must take the finite-dimensional cohomology space, actual
localization maps, finite-quotient detecting Frobenius classes and their
conjugacy/coboundary compatibility, an admissible padding class, a finite
avoidance set, and q ≥ dim H. It returns q distinct degree-one admissible
places with injective joint localization. G7 verifies the enormous-image
detecting-element hypotheses and applies it; it does not repeat Chebotarev.
The full arithmetic carriers are absent at the pin, so no executable signature
or placeholder Prop-valued structure is introduced for this contract.

G7/enormous-taylor-wiles-presentation is published ACC+ Proposition 6.2.33
(arXiv-v2 6.2.32). Before giving exists_twPresentation a Lean signature, require:
* F = F⁺ F₀, F⁺ totally real, F₀ imaginary quadratic, ζ_p ∉ F;
* p ∤ 2n, continuous absolutely irreducible ρbar, enormous cyclotomic image;
* k containing all residual eigenvalues, the actual G8 variable-determinant
  global problem, S containing p-adic and residual ramification places, T = S;
* N ≥ 1 and q at least the specified dual Selmer dimension.
Return ordered distinct eigenvalues, #Q = q, q_v ≡ 1 mod p^N, splitting in F₀,
the Λ[Δ_Q]-action with qn cyclic factors each of order at least p^N, a
surjection from the power-series ring in g variables, and the augmentation
quotient. Define g as the proven nonnegative integer qn − n²[F⁺:Q], then convert
to a finite indexing type: truncated Nat subtraction cannot encode the theorem.
The degree-one selection avoids primes over the discriminant of F₀.

PA.4 imports that package and supplies arithmetic complexes, Hecke actions,
uniform bounds and specialization. Its neatness primes remain separate.
PA.3 imports G8's actual global rings/framing and G7's augmentation map, with
L7/L8/R08.2 local conditions, to instantiate P9's abstract algebra. Polarized
and fixed-determinant variants retain their own hypotheses and dimension counts.
CG Proposition 8.5 is a different big-image, fixed-determinant theorem with one
selected generalized eigenline and q + |T| − 1 − [F:Q]n(n−1)/2 − l₀ variables.
Its contract cannot be obtained by renaming the enormous-image theorem.

These comments replace the incomplete exists_twPresentation sketch, whose
omitted field/framing/cardinality hypotheses made it unsuitable as a signature.
The new tests below are expressible at the baseline; the arithmetic signature
must wait for its named suppliers. That earlier round did not claim compilation. The #5719 fixes report records the fresh check.
-/

/- FIX-RT-BP-GlobalGaloisDeformations/3 source-specific supplier boundary.
KW II Lemma 5.3 retains p>2 and cyclotomic absolute irreducibility. It does NOT
assume irreducibility of the whole adjoint. R01.4 must export: for E=K F(ζ_p^N),
M=(ad⁰ ρbar)^*(1), every nonzero irreducible constituent V occurring in the span
of a restricted nonzero cocycle has a cyclotomically trivial σ whose residual
matrix has distinct eigenvalues and V → M/(σ-1)M is nonzero. For p>2 the trace
pairing identifies M with ad⁰(1), only under its stated rank-two hypotheses.
Taylor, On the meromorphic continuation of degree two L-functions, Documenta
Math. Extra Volume Coates (2006), Lemma 2.5, printed pp.749–750, physical pp.21–22,
is KW's reference [59], NOT Remarks on a conjecture of Fontaine and Mazur [58].
Its detector splits ad⁰=V⊕W: W=0, dim W=1 (induced case, choose outside the
inducing quadratic field), dim W=2 (choose inside that field where χ/χᶜ≠1).
For p=3 use KW II Lemmas 5.2(1), 5.3 and the constituent argument cited there;
Taylor's l>3 cyclotomic-degree/vanishing proof is NOT a p=3 justification.
R02.6 separately supplies H¹(Gal(E/F),M)=0 for the exact KW hypotheses.
Gee's p≥5 SL₂-image branch may use full-adjoint irreducibility and spanning.
Both branches then use the EXISTING chebotarev-selmer-selection, including its
padding class. No finite-image axiom, dummy cohomology or second selector is added.
-/

end TauCeti.GaloisDeformation

namespace TauCeti.GaloisDeformation.SuggestedTest

open TauCeti.GaloisDeformation

/-- Shared selection: independent coordinate detections have zero joint kernel. -/
example : Function.Injective (fun x : Fin 2 → ZMod 3 => (x 0, x 1)) := by
  intro x y h
  funext i
  fin_cases i
  · exact congrArg Prod.fst h
  · exact congrArg Prod.snd h

/-- Repeating one detection cannot kill a two-dimensional kernel. -/
example : ¬ Function.Injective (fun x : Fin 2 → ZMod 3 => (x 0, x 0)) := by
  intro h
  have he := h (a₁ := fun _ => 0) (a₂ := fun i => if i = 0 then 0 else 1)
    (by simp)
  have bad := congrFun he 1
  norm_num at bad

/-- The framed restriction invariance is a group identity. -/
example {A : Type*} [CommRing A] (n : ℕ) (x α β : GL (Fin n) A) :
    (β * α)⁻¹ * (β * x * β⁻¹) * (β * α) = α⁻¹ * x * α := by group

/-- A discrete topology on `Multiplicative ℤ`, for the examples. -/
local instance : TopologicalSpace (Multiplicative ℤ) := ⊥


/-- The trivial one-dimensional residual representation is Schur. -/
example (𝔽 : Type) [Field 𝔽] : IsSchur 1 (1 : Multiplicative ℤ →* GL (Fin 1) 𝔽) := sorry

/-- `1 ⊕ 1` is not Schur. -/
example (𝔽 : Type) [Field 𝔽] : ¬ IsSchur 2 (1 : Multiplicative ℤ →* GL (Fin 2) 𝔽) := sorry

/-- `R04.4/diagonalizable-groups`, the case `p = 2`, `m = 1` of the truncation isomorphism:
`(1 + X)² − 1 ∈ (2, X)²`. -/
example : ((1 + Polynomial.X) ^ 2 - 1 : Polynomial ℤ) ∈
    (Ideal.span {(2 : Polynomial ℤ), Polynomial.X}) ^ 2 := by
  have h2 : (2 : Polynomial ℤ) ∈ Ideal.span {(2 : Polynomial ℤ), Polynomial.X} :=
    Ideal.subset_span (by simp)
  have hX : (Polynomial.X : Polynomial ℤ) ∈ Ideal.span {(2 : Polynomial ℤ), Polynomial.X} :=
    Ideal.subset_span (by simp)
  have : ((1 + Polynomial.X) ^ 2 - 1 : Polynomial ℤ) = 2 * Polynomial.X + Polynomial.X * Polynomial.X := by
    ring
  rw [this, pow_two]
  exact Ideal.add_mem _ (Ideal.mul_mem_mul h2 hX) (Ideal.mul_mem_mul hX hX)

/-- `R04.4/twisting-action`: twisting a rank-two lift by `c` multiplies determinants by `c²`. -/
example {A : Type*} [CommRing A] (c : A) (M : Matrix (Fin 2) (Fin 2) A) :
    (c • M).det = c ^ 2 * M.det := by
  simp

/-- `R04.4/twist-action-free`, the dihedral stabiliser: in the induced basis, conjugation by
`diag(1, −1)` negates the matrix of an element outside the index-two subgroup. -/
example {A : Type*} [CommRing A] (a : A) :
    !![1, 0; 0, -1] * !![0, a; 1, 0] * !![1, 0; 0, -1] = -!![(0 : A), a; 1, 0] := by
  ext i j; fin_cases i <;> fin_cases j <;> simp [Matrix.mul_apply, Fin.sum_univ_two]

/-- ... and fixes a diagonal matrix, the image of an element of the index-two subgroup. -/
example {A : Type*} [CommRing A] (x y : A) :
    !![1, 0; 0, -1] * !![x, 0; 0, y] * !![1, 0; 0, -1] = !![x, 0; 0, y] := by
  ext i j; fin_cases i <;> fin_cases j <;> simp [Matrix.mul_apply, Fin.sum_univ_two]

/-- `R04.5/taylor-wiles-local-cohomology`: `Frob_v = diag(α, β)` acts on `E₁₂` by `α/β`, so
`ad⁰` has the eigenvalues `1, α/β, β/α` and its coinvariants are one-dimensional when `α ≠ β`. -/
example {K : Type*} [Field K] (α β : K) :
    !![α, 0; 0, β] * !![0, 1; 0, 0] * !![α⁻¹, 0; 0, β⁻¹] = (α * β⁻¹) • !![(0 : K), 1; 0, 0] := by
  ext i j; fin_cases i <;> fin_cases j <;> simp [Matrix.mul_apply, Fin.sum_univ_two]

/-- `R04.5/taylor-wiles-local-cohomology`, why `p = 2` differs: scalars are trace-free in
characteristic two, so `Z ⊆ Ad⁰` and `Ad⁰/Z` is two-dimensional. -/
example : (1 : Matrix (Fin 2) (Fin 2) (ZMod 2)).trace = 0 := by decide

/-- `R04.5/dyadic-linear-disjointness`: KW II's recursion `R₄(X) = R₃(2X² − 1)` with
`R₃ = 2X² − 1`, so `R₄(0) = 1` (the Chebyshev polynomial `T₄`). -/
example : (2 * (2 * Polynomial.X ^ 2 - 1) ^ 2 - 1 : Polynomial ℤ) =
    8 * Polynomial.X ^ 4 - 8 * Polynomial.X ^ 2 + 1 := by ring

/-- `R04.6/patching-numerology`, `p > 2`: the number of generators `h + j − d` with `j = 4|S| − 1`,
`d = 3|S|` equals `h + |S| − 1`. -/
example (h S : ℤ) : h + (4 * S - 1) - 3 * S = h + S - 1 := by ring

/-- `p = 2`: with `t = 2 − |S| + h`, `h + j + t − d = 2h + 1`. -/
example (h S : ℤ) : h + (4 * S - 1) + (2 - S + h) - 3 * S = 2 * h + 1 := by ring

/-- `R04.6/kw-deformation-data`: `3|S_f| + [F : ℚ] + 2[F : ℚ] = 3|S|` for totally real `F`, whose
infinite places number `[F : ℚ]`. -/
example (Sf n : ℕ) : 3 * Sf + n + 2 * n = 3 * (Sf + n) := by ring

/-- `G8/fixed-versus-variable-determinant`: in characteristic `3` with `ε² = 0`,
`(1 + aε)³ = 1`, so `1 + ε` has no cube root of the form `1 + aε`: the splitting needs `p ∤ n`. -/
example {R : Type*} [CommRing R] (a e : R) (h3 : (3 : R) = 0) (he : e ^ 2 = 0) :
    (1 + a * e) ^ 3 = 1 := by
  linear_combination (a * e) * h3 + (3 * a ^ 2 + a ^ 3 * e) * he

/-- `G7/polarized-tangent-obstruction`: for `p = n = 3` the identity matrix has trace `0`, so the
scalars lie in `𝔤⁰`. -/
example : Matrix.trace (1 : Matrix (Fin 3) (Fin 3) (ZMod 3)) = 0 := by
  rw [Matrix.trace_one, Fintype.card_fin]
  decide

/-- `G7/enormous-taylor-wiles-presentation`: `−n²[F⁺ : ℚ] + q·n = qn − n²[F⁺ : ℚ]`. -/
example (q n f : ℤ) : -(n ^ 2 * f) + q * n = q * n - n ^ 2 * f := by ring

/- #5719 regression helpers are only abbreviations for existing matrices, linear
maps and Submodule quotients; they do not replace any supplier construction. -/

private abbrev Cℤ : Matrix (Fin 2) (Fin 2) ℤ := !![0, -1; 1, -1]
private abbrev Sℤ : Matrix (Fin 2) (Fin 2) ℤ := !![0, 1; 1, 0]
private abbrev aℤ : Matrix (Fin 2) (Fin 2) ℤ := !![2, 5; 5, 12]
private abbrev aℤinv : Matrix (Fin 2) (Fin 2) ℤ := !![-12, 5; 5, -2]

/-- /1: the integral matrices generate S₃, and a is an integral unit matrix. -/
example : Cℤ ^ 3 = 1 ∧ Sℤ ^ 2 = 1 ∧ Sℤ * Cℤ * Sℤ = Cℤ ^ 2 ∧
    aℤ * aℤinv = 1 ∧ aℤinv * aℤ = 1 := by decide

/-- /1: a reduces to 2I, not I, modulo 5; only ±1 are integral scalar units. -/
example : aℤ.map (Int.castRingHom (ZMod 5)) =
    (2 : ZMod 5) • (1 : Matrix (Fin 2) (Fin 2) (ZMod 5)) ∧
    aℤ.map (Int.castRingHom (ZMod 5)) ≠ 1 ∧
    (-aℤ).map (Int.castRingHom (ZMod 5)) ≠ 1 := by decide

/-- /1: the integral common centralizer of C and S consists of scalar matrices. -/
example (x y z w : ℤ)
    (hC : !![x,y;z,w] * Cℤ = Cℤ * !![x,y;z,w])
    (hS : !![x,y;z,w] * Sℤ = Sℤ * !![x,y;z,w]) :
    y = 0 ∧ z = 0 ∧ x = w := by
  have hc00 := congrArg (fun M : Matrix (Fin 2) (Fin 2) ℤ => M 0 0) hC
  have hc01 := congrArg (fun M : Matrix (Fin 2) (Fin 2) ℤ => M 0 1) hC
  have hs00 := congrArg (fun M : Matrix (Fin 2) (Fin 2) ℤ => M 0 0) hS
  simp [Matrix.mul_apply, Fin.sum_univ_two] at hc00 hc01 hs00
  omega

/-- /1: the local-residue condition genuinely supplies the missing scalar unit. -/
example {A : Type*} [CommRing A] [IsLocalRing A] [IsArtinianRing A]
    (π : A →+* ZMod 5) (hres : RingHom.ker π = IsLocalRing.maximalIdeal A)
    (c : A) (hc : π c ≠ 0) : IsUnit c := by
  by_contra hu
  have hm : c ∈ IsLocalRing.maximalIdeal A := hu
  have hk : c ∈ RingHom.ker π := hres.symm ▸ hm
  exact hc (RingHom.mem_ker.mp hk)

/-- /1 allowed Artinian-local A=Z/25, residue F₅: 2 lifts a residue scalar and is a unit.
The inverse 13 normalizes the same conjugator to the strict kernel. -/
example : (2 * 13 : ZMod 25) = 1 ∧
    ((13 : ZMod 25) • (aℤ.map (Int.castRingHom (ZMod 25)))).map
      (ZMod.castHom (by norm_num : 5 ∣ 25) (ZMod 5)) = 1 := by decide

/-- /1: the normalized Artinian-local matrix is still invertible. -/
example :
    ((13 : ZMod 25) • (aℤ.map (Int.castRingHom (ZMod 25)))) *
      ((2 : ZMod 25) • (aℤinv.map (Int.castRingHom (ZMod 25)))) = 1 := by decide

local instance : Fact (Nat.Prime 3) := ⟨by decide⟩

private abbrev diagonal (m : ℕ) : ZMod 3 →ₗ[ZMod 3] (Fin m → ZMod 3) :=
  LinearMap.pi fun _ => LinearMap.id

private abbrev scalarFrames (m : ℕ) :=
  (Fin m → ZMod 3) ⧸ (diagonal m).range

/-- /2 rank one: trace-zero matrices vanish, but scalar framings need not. -/
example (M : Matrix (Fin 1) (Fin 1) (ZMod 3)) (h : M.trace = 0) : M = 0 := by
  ext i j
  fin_cases i
  fin_cases j
  simpa [Matrix.trace, Fin.sum_univ_one] using h

/-- /2: the scalar boundary is the diagonal map, injective for two framings. -/
example : Function.Injective (diagonal 2) := by
  intro x y h
  exact congrFun h 0

/-- /2: two framings leave exactly one actual quotient direction, k²/diag(k). -/
example : Module.finrank (ZMod 3) (scalarFrames 2) = 1 := by
  have hi : Function.Injective (diagonal 2) := fun _ _ h => congrFun h 0
  have hr := LinearMap.finrank_range_of_inj hi
  have hd := (diagonal 2).range.finrank_quotient_add_finrank
  simp only [CommSemiring.finrank_self] at hr
  rw [hr, Module.finrank_fin_fun] at hd
  exact Nat.add_right_cancel (hd.trans (by rfl))

/-- /2: the two-framing quotient is not zero: the frame (0,1) is not diagonal. -/
example : (Submodule.Quotient.mk ![0,1] : scalarFrames 2) ≠ 0 := by
  intro h
  obtain ⟨c,hc⟩ := LinearMap.mem_range.mp
    ((Submodule.Quotient.mk_eq_zero (diagonal 2).range).mp h)
  have h0 := congrFun hc 0
  have h1 := congrFun hc 1
  change c = 0 at h0
  change c = 1 at h1
  norm_num [h0] at h1

/-- /2: one framing is killed by the diagonal scalar change, so its quotient has dimension 0. -/
example : Module.finrank (ZMod 3) (scalarFrames 1) = 0 := by
  have hi : Function.Injective (diagonal 1) := fun _ _ h => congrFun h 0
  have hr := LinearMap.finrank_range_of_inj hi
  have hd := (diagonal 1).range.finrank_quotient_add_finrank
  simp only [CommSemiring.finrank_self] at hr
  rw [hr, Module.finrank_fin_fun] at hd
  exact Nat.add_right_cancel (hd.trans (by rfl))

/-- /2: no framings give zero H¹ frame directions, but all scalars remain in ker d⁰. -/
example : Module.finrank (ZMod 3) (scalarFrames 0) = 0 ∧
    (diagonal 0).ker = ⊤ := by
  constructor
  · have hd := (diagonal 0).range.finrank_quotient_add_finrank
    rw [Module.finrank_fin_fun] at hd
    change Module.finrank (ZMod 3) ((Fin 0 → ZMod 3) ⧸ (diagonal 0).range) = 0
    omega
  · ext x
    simp [LinearMap.mem_ker, diagonal, funext_iff]

private abbrev C₅ : Matrix (Fin 2) (Fin 2) (ZMod 5) := Cℤ.map (Int.castRingHom _)
private abbrev S₅ : Matrix (Fin 2) (Fin 2) (ZMod 5) := Sℤ.map (Int.castRingHom _)
private abbrev J₅ : Matrix (Fin 2) (Fin 2) (ZMod 5) := C₅ - C₅ ^ 2

/-- /3: J spans a nonzero trace-zero sign line in the adjoint of the S₃ representation. -/
example : J₅.trace = 0 ∧ J₅ ≠ 0 ∧
    C₅ * J₅ * C₅ ^ 2 = J₅ ∧ S₅ * J₅ * S₅ = -J₅ := by decide

/-- /3: the sign line is proper even inside ad⁰: diag(1,-1) is not in it. -/
example : !![(1 : ZMod 5),0;0,-1] ∉ Submodule.span (ZMod 5) {J₅} := by
  rw [Submodule.mem_span_singleton]
  decide

/-- /3: all scalar multiples stay in the sign line under the two generators. -/
example (t : ZMod 5) :
    C₅ * (t • J₅) * C₅ ^ 2 = t • J₅ ∧ S₅ * (t • J₅) * S₅ = -(t • J₅) := by
  fin_cases t <;> decide

/-- /1 and /3: I,C,S,CS form a basis of M₂(F₅), witnessed by their flattened determinant.
This tests residual absolute irreducibility, not irreducibility of the adjoint. -/
example : (!![(1 : ZMod 5),0,0,1;0,-1,1,-1;0,1,1,0;-1,0,-1,1]).det ≠ 0 := by decide

end TauCeti.GaloisDeformation.SuggestedTest
