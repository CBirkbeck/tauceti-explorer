/-
This file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/GeometricSatakeAndFusion--GS3.md` is definitive.
These statements suggest Lean forms so that contributors and reviewers can
converge on names and signatures. They claim no implementation.

BP-GeometricSatakeAndFusion--GS3: partial prototype, implementationStatus =
unchecked. Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.

NOT COMPILED. No Lean was run for this job and the Mathlib build on this machine
is a shared cache that must not be rebuilt, so elaboration has not been
established. Every proof below is `sorry`.

SCOPE. Second part of the roadmap: GS3 with its substage, and the four GS4
stages. GS0, GS1 and GS2 belong to the other part and appear here as requested
carriers. Nothing is stated for GS4:classical-Satake-comparison, which the
decomposition records as not read and for which no passage of the primary source
was found.

REUSED from the pinned libraries rather than restated: Tau Ceti's Tannaka
development — `TauCeti.Tannaka.tensorAutFunctor` (the tensor-automorphism functor
of a fibre functor, i.e. the Tannakian group functor),
`TauCeti.Tannaka.pointsFunctorIsoTensorAutFunctor` (the reconstruction
isomorphism) and `TauCeti.Tannaka.reconstructedPoint` — together with Mathlib's
`HopfAlgebra`, `Bialgebra`, `BraidedCategory`, `SymmetricCategory`,
`Functor.Braided`, `Functor.Monoidal`, `LeftRigidCategory` and `RootPairing`, and
Tau Ceti's `AffineGroupSchemeCat` and `ReductiveAffineGroupSchemeCat`.

What Tau Ceti's Tannaka development does NOT give, and what this part is for: it
is over a FIELD, for finitely generated comodules over a Hopf algebra. The
theorem here identifies a group scheme over `ℤ_ℓ`, recovered from the torus and
the rank-one Levi maps by maximal-compact generation. The roadmap says "rational
reductivity alone does not identify the integral group scheme".

ABSENT at both pins, and so opaque parameters: the Weil group `W_E` (requested
from Tau Ceti's ClassFieldTheory roadmap, layer 9) and the Langlands dual group
`Ĝ` (requested from `ReductiveGroupsPartII:RG2.4`).
-/
import Mathlib.CategoryTheory.Monoidal.Category
import Mathlib.CategoryTheory.Monoidal.Braided.Basic
import Mathlib.CategoryTheory.Monoidal.Functor
import Mathlib.CategoryTheory.Monoidal.Rigid.Basic
import Mathlib.CategoryTheory.Adjunction.Basic
import Mathlib.CategoryTheory.Abelian.Basic
import Mathlib.CategoryTheory.Triangulated.TStructure.Basic
import Mathlib.RingTheory.HopfAlgebra.Basic
import Mathlib.RingTheory.Bialgebra.Basic
import Mathlib.LinearAlgebra.RootSystem.Defs
import Mathlib.RepresentationTheory.Basic
import Mathlib.Algebra.Module.Projective
import Mathlib.RingTheory.Flat.Basic

noncomputable section

open CategoryTheory

namespace TauCeti.GeometricSatakeFusion

/-! ## Carriers requested from the other part and from other roadmaps -/

/-- The Satake category `Sat^I_G(Λ)` for a finite leg set `I`. Planned in
`BP-GeometricSatakeAndFusion--GS0` (`GS2:correspondences`); requested here. -/
variable (Sat : Type → Type) [∀ I, Category (Sat I)] [∀ I, MonoidalCategory (Sat I)]

/-- The local Weil group. ABSENT from both pinned libraries; requested from Tau
Ceti's ClassFieldTheory roadmap, layer 9. -/
variable (WeilGroup : Type)

/-- Continuous representations of `W_E^I` on FINITE PROJECTIVE `Λ`-modules. -/
variable (RepWeil : Type → Type) [∀ I, Category (RepWeil I)] [∀ I, MonoidalCategory (RepWeil I)]

/-- The fibre functor `F^I`. Planned in the other part; its exactness,
faithfulness and conservativity are established there. -/
variable (F : ∀ I : Type, Sat I ⥤ RepWeil I)

/-- Dominant cocharacters, the index set of the Schubert stratification. -/
variable (Cochar : Type) (dominanceLE : Cochar → Cochar → Prop)

/-! ## GS3:fusion. Coherent collision and factorization maps -/

/-- The open disjoint-leg locus inside `(Div¹_X)^I`: the points where `x_i` and
`x_{i'}` differ whenever `i` and `i'` lie in different parts. -/
variable (VSheaf : Type)
def disjointLegLocus (I : Type) (_parts : I → ℕ) : VSheaf := by sorry

/-- The Satake category over the disjoint-leg locus. -/
variable (SatDisjoint : Type → Type) [∀ I, Category (SatDisjoint I)]

/-- GS3:fusion/disjoint-leg-factorization-and-full-faithfulness, Proposition
VI.9.3. Restriction to the disjoint-leg locus is FULLY FAITHFUL. The geometric
input is that the complementary closed locus is stratified by PARTIAL DIAGONALS
with smooth strata of `ℓ`-codimension `≥ 1`, whence `i^*i^!Λ ∈ D^{≥2}`. -/
theorem restriction_fullyFaithful (I : Type) (parts : I → ℕ)
    (j : Sat I ⥤ SatDisjoint I) :
    j.FullyFaithful := by
  sorry

/-- The same statement for local systems, which is what gives the Weil-group
functoriality. -/
theorem restriction_fullyFaithful_locSys (I : Type) (parts : I → ℕ)
    (LocSys : Type → Type) [∀ I, Category (LocSys I)]
    (j : LocSys I ⥤ LocSys I) :
    j.FullyFaithful := by
  sorry

/-- Unit test. The codimension-`1` input is what makes `i^*i^!Λ ∈ D^{≥2}`; with
codimension `0` strata the argument fails. -/
example (codimAtLeastOne degreeAtLeastTwo : Prop) :
    codimAtLeastOne → degreeAtLeastTwo := by
  sorry

/-- GS3:fusion/fusion-product-and-sign-rule. The even/odd decomposition of
`Hck^I_G` by the parity of `d_{μ∙} = Σ_i ⟨2ρ,μ_i⟩`. It is open AND closed
precisely because the dominance order never compares elements of different
parity. -/
def parity (I : Type) (_μ : I → Cochar) : Bool := by sorry

theorem parity_decomposition_isClopen (I : Type)
    (Clopen : (I → Cochar) → Prop) (μ : I → Cochar) :
    Clopen μ := by
  sorry

/-- Unit test. The decomposition is clopen because the dominance order does not
compare elements of different parity; on an order that did, it would not be. -/
example (μ ν : Cochar) :
    dominanceLE μ ν → parity Cochar ({*} : Type) (fun _ => μ) =
      parity Cochar ({*} : Type) (fun _ => ν) := by
  sorry

/-- The exterior product over the disjoint-leg locus. `Hck^I_G` restricted there
is the product of the `Hck^{I_j}_G`, so this is where the product comes from. -/
def exteriorProduct (I J : Type) : Sat I → Sat J → SatDisjoint I := by sorry

/-- The FUSION PRODUCT: the image of the exterior product lands in `Sat^I_G`, by
full faithfulness of the restriction. A functor of monoidal categories,
functorial in the parts. -/
def fusionProduct (I J : Type) : Sat I → Sat J → Sat I := by sorry

/-- With the sign rule imposed, each `Sat^I_G` is SYMMETRIC monoidal and `F^I` is
a symmetric monoidal functor. -/
instance (I : Type) : SymmetricCategory (Sat I) := by sorry

instance (I : Type) : (F I).Braided := by sorry

/-- Unit test. The minus sign on two odd objects. Without it, `F^I` is symmetric
monoidal for a SUPER variant and the dual group comes out wrong. -/
example (I : Type) (A B : Sat I) (odd : Sat I → Prop)
    (braiding : Sat I → Sat I → Sat I) (minusSign : Prop) :
    odd A → odd B → minusSign := by
  sorry

/-- Unit test. The sign is FORCED, not chosen: the shift by `deg` inside `F^I`
introduces exactly it, and faithfulness of the functors pins it down. -/
example (signIsForcedByDeg signIsAConvention : Prop) :
    signIsForcedByDeg ∧ ¬ signIsAConvention := by
  sorry

/-- Unit test, the completion contract's obligation. For three legs the two
successive diagonal factorizations must agree. The source asserts functoriality
and compatibility with composition but no coherence proof was read, so this
records the obligation rather than a verified fact. -/
example (threeLegCoherence : Prop) : threeLegCoherence := by
  sorry

/-- Unit test. Fusion uses NO characteristic-zero semisimplicity. A construction
that needs it has imported `GS4:rational-reductivity` early and made the roadmap
circular. -/
example (usesSemisimplicity : Prop) : ¬ usesSemisimplicity := by
  sorry

/-- GS3:fusion/finite-set-functoriality-and-constant-terms, Proposition VI.9.2.
`LocSys((Div¹_X)^I, Λ) ≃ Rep_{W_E^I}(Λ)`, continuous representations on FINITE
PROJECTIVE `Λ`-modules. The source's proof is one line: "This is a consequence of
Proposition IV.7.3" — Drinfeld's lemma, which the decomposition records as
unread. -/
theorem locSys_eq_repWeil (I : Type) (LocSys : Type → Type) [∀ I, Category (LocSys I)] :
    Nonempty (LocSys I ≌ RepWeil I) := by
  sorry

/-- Functoriality in `I`, from the closed immersion
`Gr^I_G ×_{(Div¹)^I}(Div¹)^J → Gr^J_G`. The source's own footnote, crediting Tony
Feng, records that on HECKE STACKS the map is not a closed immersion. -/
def finiteSetFunctoriality {I J : Type} (_f : I → J) : Sat I ⥤ Sat J := by sorry

instance {I J : Type} (f : I → J) : (finiteSetFunctoriality Sat f).Monoidal := by
  sorry

/-- Corollary VI.9.5. `F^I(sw^* A) = F^I(A)` and `D(sw^* A) = sw^* D(A)`; `D` is
symmetric monoidal and `D ∘ F^I = (F^I)^*`. The proof consumes dualizability from
`GS2:Satake-closure` — which is why the atlas edge `GS3:fusion →
GS2:Satake-closure` points the wrong way. -/
theorem switching_commutes_with_fibreFunctor (I : Type) (sw D : Sat I → Sat I) (A : Sat I) :
    (F I).obj (sw A) = (F I).obj A ∧ D (sw A) = sw (D A) := by
  sorry

/-- Proposition VI.9.6. The constant terms `CT^I_P[deg_P]` commute with the fusion
product, functorially in `I` and in permutations of the parts, hence are symmetric
monoidal. -/
theorem constantTerm_commutes_with_fusion (I J : Type) (SatM : Type → Type)
    [∀ I, Category (SatM I)] (CT : ∀ I, Sat I ⥤ SatM I) (A : Sat I) (B : Sat J) :
    (CT I).obj (fusionProduct Sat I J A B) = (CT I).obj A := by
  sorry

/-- Unit test. Pairwise isomorphisms for two legs do NOT give the coherent family
the excursion operators need; the functoriality is coCartesian. -/
example (pairwise coCartesian : Prop) : ¬ (pairwise → coCartesian) := by
  sorry

/-! ## GS4:rational-reductivity. The late decomposition-theorem input -/

/-- GS4:rational-reductivity/rational-semisimplicity. After inverting `ℓ`,
`Sat_G(Q_ℓ) = ⊕_μ Rep^cont_{W_E}(Q_ℓ) ⊗ A_μ`, where `A_μ = ^p j_{μ!}ℤ_ℓ[d_μ]`.
The input is the last clause of Proposition VI.7.5, which is the ONLY place the
decomposition theorem enters this roadmap, and it enters through the degeneration
to the Witt vector affine Grassmannian. -/
theorem rational_decomposition (SatQl : Type) [Category SatQl]
    (A : Cochar → SatQl) (directSumDecomposition : Prop) :
    directSumDecomposition := by
  sorry

/-- The representation category of the generic fibre of the Tannakian group is
semisimple; hence the generic fibre is of finite type, connected and REDUCTIVE
(by three citations to Deligne–Milne that were not read). -/
theorem genericFibre_reductive (TannakianGroup : Type)
    (Semisimple FiniteType Connected Reductive : Type → Prop) :
    Semisimple TannakianGroup →
      FiniteType TannakianGroup ∧ Connected TannakianGroup ∧ Reductive TannakianGroup := by
  sorry

/-- Unit test. The same argument FAILS mod `ℓ`: no integral semisimplicity is
asserted, and the roadmap forbids asserting one. -/
example (modLSemisimplicity : Prop) : ¬ modLSemisimplicity := by
  sorry

/-- Unit test. Rational reductivity does NOT identify the integral group scheme;
that is the next layer's content. -/
example (rationalReductivity integralIdentification : Prop) :
    ¬ (rationalReductivity → integralIdentification) := by
  sorry

/-! ## GS4:integral-dual-group. Reconstruction and normalized functoriality -/

/-- GS4:integral-dual-group/tannakian-left-adjoint, Proposition VI.10.1. On each
quasicompact bounded piece, `F^I` has a left adjoint `L^I`, with
`L^I(V) = L^I(1) ⊗ V` (using that `Sat^I_G` is TENSORED over `Rep_{W_E^I}`) and
`L^I(1)` the FUSION over `i ∈ I` of the one-element values — which is what makes
the Tannakian Hopf algebra a tensor product over `I`, and where GS3 is consumed. -/
def tannakianLeftAdjoint (I : Type) : RepWeil I ⥤ Sat I := by sorry

theorem tannakianLeftAdjoint_adjunction (I : Type) :
    tannakianLeftAdjoint Sat RepWeil I ⊣ F I := by
  sorry

/-- Unit test. The left adjoint is constructed only on the QUASICOMPACT bounded
pieces; the whole Satake category is their colimit. -/
example (I : Type) (quasicompactOnly wholeCategory : Prop) :
    quasicompactOnly ∧ ¬ wholeCategory := by
  sorry

/-- GS4:integral-dual-group/dual-group-identification, Theorem VI.11.1. A
CANONICAL `W_E`-equivariant isomorphism between the Tannakian group scheme and the
Langlands dual group `Ĝ`.

Tau Ceti's `Tannaka.tensorAutFunctor` and `pointsFunctorIsoTensorAutFunctor` give
the Tannakian group functor and the reconstruction over a FIELD; the statement
here is over `ℤ_ℓ`. -/
variable (DualGroup TannakianGroup : Type)

theorem tannakian_is_dual_group (canonical weilEquivariant : Prop) :
    canonical ∧ weilEquivariant := by
  sorry

/-- The `W_E`-action agrees with the usual pinned action up to an explicit
CYCLOTOMIC TWIST; if `√q ∈ Λ` the twist trivialises and `Sat^I_G(Λ)` becomes the
category of `(Ĝ ⋊ W_E)^I`-representations on finite projective `Λ`-modules. -/
theorem weilAction_up_to_cyclotomic_twist (sqrtQInLambda : Prop)
    (twistTrivialised satakeEquivalence : Prop) :
    sqrtQInLambda → twistTrivialised ∧ satakeEquivalence := by
  sorry

/-- Unit test. For `G = T` a torus, `Gr_T = X_*(T) × Div¹` and `Sat_T` is
`X_*(T)`-graded `W_E`-representations, so the Tannakian group is the dual torus
with `X^*(T̂) = X_*(T)`. -/
example (T That : Type) (characterLattice cocharacterLattice : Type → Type) :
    Nonempty (characterLattice That ≃ cocharacterLattice T) := by
  sorry

/-- Unit test. The integral recovery needs that `Ĝ(ℤ_ℓ) ⊆ Ĝ(Q_ℓ)` is a maximal
compact open subgroup generated by the rank-one Levi subgroups — Bruhat–Tits
theory, requested from `ReductiveGroupsPartII:RG2.5`. -/
example (maximalCompactGenerated integralIdentification : Prop) :
    maximalCompactGenerated → integralIdentification := by
  sorry

/-- Unit test, the source's own caveat. That the Tannakian group depends only on
`G` up to inner automorphisms "is not clear"; a formulation that assumes it goes
beyond the source. -/
example (dependsOnlyUpToInner : Prop) : ¬ dependsOnlyUpToInner := by
  sorry

/-- GS4:integral-dual-group/chevalley-involution, Proposition VI.12.1. The
switching involution `sw^*` gives a `W_E`-equivariant automorphism of the
Tannakian group, and under the identification it is the Chevalley involution of
the split group `Ĝ`, CONJUGATED BY `ρ̂(-1)` in `Ĝ_ad(ℤ_ℓ)`. -/
theorem switching_is_chevalley (chevalley conjugationByRhoHatMinusOne : Prop) :
    chevalley ∧ conjugationByRhoHatMinusOne := by
  sorry

/-- Unit test. The sign `ρ̂(-1)` is essential: Fargues–Scholze record that
Ginzburg's earlier construction of the commutativity constraint overlooked it. -/
example (withSign withoutSign : Prop) : ¬ (withSign ↔ withoutSign) := by
  sorry

/-- Unit test. Remark VI.12.2 notes a DIFFERENT construction of the commutativity
constraint, not using fusion, based on the Chevalley involution. This packet
decomposes the fusion route, as the roadmap requires, and the two should agree. -/
example (fusionConstraint chevalleyConstraint : Prop) :
    fusionConstraint ↔ chevalleyConstraint := by
  sorry

/-! ## GS4:classical-Satake-comparison

NOT READ, and nothing is stated. The decomposition inspected the section list of
Fargues–Scholze Chapter VI, which ends at VI.12, and found no passage comparing
the Frobenius trace of a Satake object on a finite-type special-fibre model with
the spherical Hecke function. The packet leaves the coverage at `not_read` and
proposes either a source route of its own or a move to the roadmap that owns the
classical Satake transform. -/

end TauCeti.GeometricSatakeFusion
