/-
This file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/RelativeFarguesFontaine--RF4.md` is definitive. These
statements suggest Lean forms so that contributors and reviewers can converge on
names and signatures. They claim no implementation.

BP-RelativeFarguesFontaine--RF4: partial prototype, implementationStatus =
unchecked. Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.

NOT COMPILED. No Lean was run for this job and the Mathlib build on this machine
is a shared cache that must not be rebuilt, so elaboration has not been
established. Every proof below is `sorry`.

SCOPE. Second part of the roadmap: RF4 with its two substages. RF0–RF3 belong to
issue #985.

The three notions of a G-torsor had NO node in the reviewed decomposition,
although the stage is named "Tannakian transfer" and its equivalence theorem is a
statement about objects it did not define. One was added, from Scholze–Weinstein
§19.5 (printed p. 179) and §19.1 (printed p. 170), read directly in this session
from a file whose SHA-256 reproduces byte for byte.

REUSED from the pinned libraries. Tau Ceti already has Tannaka RECONSTRUCTION —
`Tannaka.tensorAutFunctor`, `Tannaka.pointsFunctorIsoTensorAutFunctor` — but over
a FIELD, for finitely generated comodules over a Hopf algebra. The transfer here
is between three notions of TORSOR over a sousperfectoid analytic adic space over
`ℤ_p` and does not follow from it. Also reused: `IsAdicComplete`,
`AdicCompletion` and `IsLocalization` for the Beauville–Laszlo lemma —
whose whole subtlety is that `R → R̂` may fail to be flat — `Module.Projective`
for its finite-projectivity clause, and `IsDiscreteValuationRing`, because the
base case of étale-local triviality is that at a geometric point `B^+` is a
product of complete DVRs with algebraically closed residue field.

ABSENT at both pins: adic spaces, perfectoid rings, diamonds. Requested from
`AdicSpacesPartII`, `PerfectoidSpaces`, `DiamondsAndVStacks` and
`BunGAndNewtonStrata`.
-/
import Mathlib.RingTheory.AdicCompletion.Basic
import Mathlib.RingTheory.Localization.Defs
import Mathlib.RingTheory.Ideal.Span
import Mathlib.RingTheory.DiscreteValuationRing.Basic
import Mathlib.Algebra.Module.Projective
import Mathlib.LinearAlgebra.FreeModule.Basic
import Mathlib.CategoryTheory.Monoidal.Category
import Mathlib.CategoryTheory.Monoidal.Functor
import Mathlib.CategoryTheory.Equivalence
import Mathlib.CategoryTheory.Sites.Sheaf
import Mathlib.RepresentationTheory.Basic
import Mathlib.AlgebraicGeometry.Scheme

noncomputable section

open CategoryTheory

namespace TauCeti.RelativeFF.Patching

/-! ## RF4:vector-bundles. Linear patching -/

/-- The Beauville–Laszlo gluing lemma. For `f` a nonzerodivisor in `R` and `R̂`
the `f`-adic completion, `R`-modules on which `f` is a nonzerodivisor are
equivalent to triples `(M_{R̂}, M_{R[f⁻¹]}, β)`, and `M` is finite projective iff
both halves are.

NO noetherian or flatness hypothesis, and that is essential: `R → R̂` may fail to
be flat and no descent datum on `R̂ ⊗_R R̂` is included, so the lemma does NOT
follow from fpqc descent. -/
theorem beauville_laszlo (R : Type) [CommRing R] (f : R)
    (hf : ∀ x : R, f * x = 0 → x = 0)
    (ModulesWithFNZD TripleCategory : Type) [Category ModulesWithFNZD] [Category TripleCategory] :
    Nonempty (ModulesWithFNZD ≌ TripleCategory) := by
  sorry

/-- The finite-projectivity criterion is PART of the lemma, not an addendum. -/
theorem beauville_laszlo_finiteProjective (R : Type) [CommRing R] (f : R)
    (M : Type) [AddCommGroup M] [Module R M]
    (completedHalfIsFP localizedHalfIsFP : Prop) :
    Module.Projective R M ↔ (completedHalfIsFP ∧ localizedHalfIsFP) := by
  sorry

/-- Unit test. The lemma does NOT follow from fpqc descent: `R → R̂` may not be
flat when `R` is not noetherian, and there is no descent datum on the double
completion. -/
example (followsFromFpqcDescent : Prop) : ¬ followsFromFpqcDescent := by
  sorry

/-- Unit test. It must apply to a non-noetherian example — `R = W_{O_E}(R^+)[1/[ϖ]]`
with `f = ξ` — which is the only case the roadmap needs. -/
example (isNoetherian appliesAnyway : Prop) : ¬ isNoetherian → appliesAnyway := by
  sorry

/-- Meromorphy of a modification. An isomorphism off `D` is meromorphic along `D`
if for EVERY representation the associated map of vector bundles extends to
`ℱ → ℱ'(kD)` for `k ≫ 0`. Tested on all representations in the Tannakian
description; it is not automatic. -/
def IsMeromorphicAlong (Bundle : Type) (_E _E' : Bundle) : Prop := by sorry

/-- Beauville–Laszlo gluing identifies `Gr_G/φ^ℤ → Div¹` with the moduli of a
divisor `D`, a bundle `ℰ`, and a modification from the trivial `G`-bundle to `ℰ`
at `D`.

`Gr_G` is `GeometricSatakeAndFusion`'s object; this layer supplies the linear half
it rests on, which is the direction the atlas edge already has. -/
theorem modification_moduli (Gr Div1 Bun : Type) (identification : Prop) :
    identification := by
  sorry

/-- Unit test. Meromorphy is representation-independent given a faithful
representation TOGETHER WITH its tensor constructions; one representation alone
does not suffice. -/
example (faithfulPlusTensors oneRepresentationOnly : Prop) :
    faithfulPlusTensors ∧ ¬ oneRepresentationOnly := by
  sorry

/-! ## RF4:G-torsors. Tannakian transfer -/

/-- The smooth affine group scheme `G`, and the convention `G(S) = G(O_S(S))`
turning it into an adic space — without which the geometric notion cannot even be
stated. -/
variable (AdicSpace : Type) (G : Type) (Gsmooth : Prop)
variable (groupAsAdicSpace : AdicSpace)

/-- The standing hypothesis on the base: an analytic adic space over `ℤ_p` that is
SOUSPERFECTOID, locally `Spa(R,R^+)` with `R` sousperfectoid. The source's reason:
for a general adic space over `ℤ_p` it is not clear that `G × X` is an adic space
at all. -/
variable (IsSousperfectoid : AdicSpace → Prop)

/-- Vector bundles on `X`. -/
variable (Bun : AdicSpace → Type) [∀ X, Category (Bun X)] [∀ X, MonoidalCategory (Bun X)]

/-- Representations of `G`. -/
variable (RepG : Type) [Category RepG] [MonoidalCategory RepG]

/-- RF4:G-torsors/three-notions-of-G-torsor, (Geometric). An adic space `P → X`
with a `G`-action over `X`, étale-locally `G`-equivariantly isomorphic to
`G × X`. -/
structure IsGeometricTorsor (X : AdicSpace) (P : AdicSpace) : Prop where
  action : Prop
  etaleLocallyTrivial : Prop

/-- (Cohomological). An étale sheaf `Q` on `X` with a `G`-action, étale-locally
`G`-equivariantly isomorphic to `G`. -/
structure IsCohomologicalTorsor (X : AdicSpace) (Q : Type) : Prop where
  action : Prop
  etaleLocallyTrivial : Prop

/-- (Tannakian). An EXACT tensor-functor `Rep G → Bun(X)`. This is the working
definition, and the one in which meromorphy is tested. -/
structure TannakianTorsor (X : AdicSpace) where
  functor : RepG ⥤ Bun X
  exact : Prop

/-- Exactness IMPLIES faithfulness: the trivial representation embeds into
`V ⊗ V^∨`, so `O_X` embeds into `P(V) ⊗ P(V)^∨` and `P(V) ≠ 0`. Faithfulness is
therefore not an extra hypothesis. -/
theorem tannakian_faithful (X : AdicSpace) (P : TannakianTorsor AdicSpace Bun RepG X) :
    P.functor.Faithful := by
  sorry

/-- Unit test. For `G = GL_n` all three notions are vector bundles of rank `n`. -/
example (X : AdicSpace) (n : ℕ) (allThreeAreRankNBundles : Prop) :
    allThreeAreRankNBundles := by
  sorry

/-- Unit test. Smoothness of `G` is what lets the étale site replace the fppf
site: `P → X` is then smooth by descent and admits étale-local sections. -/
example (smooth etaleSiteSuffices : Prop) : smooth → etaleSiteSuffices := by
  sorry

/-- Unit test. Without sousperfectoidness it is not clear that `G × X` is an adic
space at all, so the geometric notion may not even be statable. -/
example (X : AdicSpace) (productIsAdicSpace : Prop) :
    ¬ IsSousperfectoid X → ¬ productIsAdicSpace := by
  sorry

/-- Unit test. Meromorphy is tested on ALL algebraic representations; a single
faithful representation without its tensor constructions is strictly weaker. -/
example (allRepresentations oneFaithful : Prop) :
    allRepresentations → oneFaithful := by
  sorry

/-- Theorem 19.5.2. The three categories are canonically equivalent, and moreover
any geometric `G`-torsor is itself sousperfectoid and locally étale over a ball
over `X`. -/
theorem three_notions_equivalent (X : AdicSpace)
    (GeomTorsors CohTorsors TannTorsors : Type)
    [Category GeomTorsors] [Category CohTorsors] [Category TannTorsors] :
    Nonempty (GeomTorsors ≌ CohTorsors) ∧ Nonempty (CohTorsors ≌ TannTorsors) := by
  sorry

theorem geometric_torsor_isSousperfectoid (X P : AdicSpace)
    (locallyEtaleOverBall : Prop) :
    IsSousperfectoid X → IsSousperfectoid P ∧ locallyEtaleOverBall := by
  sorry

/-- Proposition 19.5.3 and its application. `G`-torsors on open subsets form a
v-stack; vector bundles over `B^+_{Div^d}` satisfy v-descent (check modulo powers
of `I_S`), hence so do `G`-bundles by Tannaka; and any `G`-bundle over
`B^+_{Div^d_𝒴}(S)` is étale-locally on `S` trivial. -/
theorem G_torsors_vStack (isVStack : Prop) : isVStack := by sorry

/-- Étale-local triviality. The base case: at a geometric point `B^+` is a PRODUCT
OF COMPLETE DISCRETE VALUATION RINGS with algebraically closed residue field, so
every `G`-torsor over it is trivial; in general triviality modulo `I_S` lifts
along nilpotent thickenings. -/
theorem etale_locally_trivial (Bplus : Type) [CommRing Bplus] [IsDomain Bplus]
    (atGeometricPoint : Prop) (allTorsorsTrivial : Prop) :
    atGeometricPoint → IsDiscreteValuationRing Bplus → allTorsorsTrivial := by
  sorry

/-- Consequently `Hck_{G,Div^d}` and `Gr_{G,Div^d}` are small v-stacks with the
loop-group quotient presentations — as ÉTALE stacks, obtained after étale-local
trivialisation, and not as v-stack presentations. -/
theorem quotient_presentations (isEtaleStackPresentation isVStackPresentation : Prop) :
    isEtaleStackPresentation ∧ ¬ isVStackPresentation := by
  sorry

/-- Unit test. The affineness hypothesis on `Z` in the loop-space construction is
what makes `L^+Z` and `LZ` v-sheaves; without it they need not be. -/
example (affine isVSheaf : Prop) : affine → isVSheaf := by
  sorry

end TauCeti.RelativeFF.Patching
