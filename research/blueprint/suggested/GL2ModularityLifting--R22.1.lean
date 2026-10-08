import Mathlib.RingTheory.Henselian
import Mathlib.RingTheory.LocalRing.Defs
import Mathlib.LinearAlgebra.FreeModule.Basic
import Mathlib.Algebra.MonoidAlgebra.Defs
import Mathlib.Algebra.Polynomial.Splits
import Mathlib.Tactic.Ring
import Mathlib.Data.ZMod.Basic
import Mathlib.LinearAlgebra.Matrix.Notation
import Mathlib.LinearAlgebra.Matrix.Determinant.Basic
import Mathlib.Tactic.LinearCombination
import Mathlib.Data.Fintype.Perm
import Mathlib.GroupTheory.Solvable
import Mathlib.Tactic.FieldSimp
import Mathlib.Tactic.NormNum
import Mathlib.FieldTheory.Galois.Basic
import Mathlib.FieldTheory.Galois.Notation
import Mathlib.FieldTheory.KrullTopology
import Mathlib.FieldTheory.IsAlgClosed.AlgebraicClosure
import Mathlib.FieldTheory.Relrank
import Mathlib.FieldTheory.LinearDisjoint
import Mathlib.GroupTheory.PGroup
import Mathlib.LinearAlgebra.Matrix.GeneralLinearGroup.Defs
import Mathlib.NumberTheory.NumberField.Basic
import Mathlib.NumberTheory.NumberField.InfinitePlace.TotallyRealComplex
import Mathlib.RingTheory.DedekindDomain.Ideal.Lemmas
import Mathlib.RingTheory.RamificationInertia.Inertia
import Mathlib.RingTheory.RamificationInertia.Ramification
import Mathlib.RingTheory.Valuation.RamificationGroup

/-!
# Suggested Lean forms: GL₂ modularity lifting, R22.1–R22.6 and R32.1–R32.2 (GL2ModularityLifting, part R22.1)

**Standard note.** This file is not the roadmap and it is not exhaustive. The roadmap document
(`GL2ModularityLifting`) is definitive. The statements below suggest Lean forms, so that
contributors and reviewers converge on names and signatures. Nothing here claims to be
formalised.

Fix revision: Codex codex-5ebb6f, 30 September 2026, Refs #5142. Independent REV-FIX records needs_changes (2 October 2026, Refs #5143).
Independent review REV-GL2ModularityLifting--R22.1 returned needs_changes.
Fix revision (round 3): Claude claude-c9TlsS, 6 October 2026, Refs #5870.
Independent review REV-FIX-RT-AREA-langlands-2~3: Claude claude-hd6PQ0, 7 October 2026, Refs #5871;
needs_changes. Its declarations are unchanged by that review. The file elaborates with `lake env lean` against
Mathlib `082e2d3` with no errors; its only warnings are 13 `declaration uses sorry`. The fifteen
definitions and constructions in the packet's gap "Typed suggested signatures and tests are
incomplete" still have no typed signature here.
Completed continuation: Codex codex-t0EaB3, 7 October 2026, Refs #5871; needs_changes.
Source and test-classification corrections are recorded in the review report. The active Mathlib-only
file was checked with lean-check: no errors, 13 declaration-uses-sorry warnings. Supplier sketches
inside comments remain unelaborated; this receipt does not certify their APIs or arithmetic.

Pinned baseline: Mathlib `082e2d3`, Tau Ceti `f790474`. This file imports Mathlib only. At the
pinned Mathlib the whole file elaborates; its only warnings are `declaration uses sorry`.

## What is typed

The following nodes of the packet are Lean declarations that elaborate at the pinned Mathlib.
Bodies are `sorry`, apart from one-line consequences of the definitions and the two abstract
group lemmas of Lemma 7.10. A condition that cannot be stated is left out, and the docstring of
the declaration says which.

* `R22.1/allowable-base-change`: `KW.IsSolubleStep`, `KW.IsSolubleTower`, `KW.StandingHypotheses`,
  `KW.AllowableBaseChange` with `toExtension`, `degree_even`, `image_eq`, `comp`, `solubleTower`,
  `totallyReal`, and the four tests of the packet.
* `R22.5/kw-residual-modularity`, `R22.5/kw-residual-modularity-beta`: `IsResidualWitness`,
  `IsAlphaWitness`, `IsBetaWitness`, `ResidualModularAlpha`, `residualModularAlpha_iff`,
  `residualModularAlpha_of_witness`, `ResidualModularBeta`, `residualModularBeta_iff`,
  `residualModularBeta_of_witness`, and the six tests of the packet.
* `R22.1/determinant-character-kinds`: `KW.kindIExponent`, `KW.kindIIExponent`,
  `KW.kindIIIExponent`, `KW.IsKindI`, `KW.IsKindII`, `KW.IsKindIII`, `KW.kindsI_II_at_two`, and
  the three tests of the packet.
* `R22.1/allowable-base-change-existence`: `KW.allowableBaseChange_exists` (prescribed nontrivial
  completions left out) and, for its clause (5), `KW.allowableBaseChange_exists_quadratic` (degree
  `2`, split at one finite set of places and inert at another).
* `R22.1/alpha-beta-under-allowable-base-change`: `residualModularAlpha_of_allowableBaseChange`,
  `residualModularBeta_of_allowableBaseChange` (the identification of the new witness as a base
  change left out).
* `R22.1/lemma-8-1-residual-field-choice`: `KW.exists_initial_field` (the Serre weight clause left
  out).
* `R22.5/alpha-beta-from-modularity-over-q`: `residualModular_of_modular`, over `ℚ`, with the
  Serre weight an opaque imported function `serreWeight`.
* `R22.1/lemma-7-10-determinant-adjustment`, the branch for odd `p` only, for characters of an
  abstract group: `KW.exists_sq_mul_eq_of_pPower`, `KW.existsUnique_sq_eq_of_isPGroup`.
* `R32.1/p-star`: `pStar`, with the arithmetic and matrix regressions of namespace
  `SuggestedTest`.

The section "Imported interfaces" holds what other roadmaps own and these declarations consume:
absolute irreducibility, local irreducibility at `p`, ramification of a residual representation
and total oddness (ArithmeticGaloisRepresentations R01.3, R01.4), and cuspidal automorphic
representations of `GL₂` over a totally real field with their weights, conductor exponents and
residual Galois representations (AutomorphicGaloisRepresentations R19.2), and the Serre weight
(SerreWeightAndLevelOptimisation). Each is a definition with only conditions Mathlib can state,
or an opaque `def` of a type or function whose body is `sorry`.

## What is not typed

Everything in the comment block below is an unelaborated sketch, NOT a Lean declaration: the
quaternionic forms and Hecke algebras (HilbertModularVarietiesAndShimuraCurves R18.3/R18.6),
Galois representations over Hecke algebras (AutomorphicGaloisRepresentations R19.6), the global
deformation rings (GlobalGaloisDeformations R04.4–R04.6) and the p-adic Hodge theoretic
conditions on lifts do not exist at the pinned commits. For those nodes the packet/API/test
correspondence of PROTOCOL section 13 is not met here. Do not replace missing mathematics by
arbitrary propositions to make these sketches elaborate.

The packet separates residual alpha/beta (typed, see above), strong residual modularity and the
three pBT lifting results, dyadic torsor/presentation/regularity/faithfulness, the four statement
predicates, Hodge--Tate normalisation/weight recovery/oddness, and the corrected graded-piece
bound. Apart from alpha/beta, their names still require the actual supplier types before their
signatures can be written.

## Type sketches (comment only; not an implementation)

```
-- R22.1/minimal-level-data
structure MinimalLevelData (ρbar : GaloisRep F 𝔽 2) where
  D : QuaternionAlgebra F; definite : IsTotallyDefinite D; ramified : RamifiedExactly D (Σ ∪ ∞)
  U : OpenCompactOrNot D; weight : WeightModule U; ψ : HeckeCharacter F 𝒪
  𝔪 : MaximalSpectrum (HeckeAlgebra D U ψ); nonEis : ¬ IsEisenstein 𝔪; residual : residualRep 𝔪 ≅ ρbar
-- R22.1/deformation-to-hecke-map and surjectivity
def defToHecke (d : MinimalLevelData ρbar) : d.kw.unframedRing →ₐ[𝒪] d.heckeAlgebra
theorem defToHecke_trace (v) (hv : v ∉ S) : d.defToHecke (trace (d.kw.univRep (Frob v))) = T v
theorem defToHecke_surjective : Function.Surjective d.defToHecke
-- R22.2/delta-freeness-at-taylor-wiles-level
-- Freeness is imported from R18.3 through R18.6. This layer applies it and proves the
-- Galois-dependent rank/coinvariant control; the quaternionic freeness proof is not duplicated.
theorem auxModule_free (Q : TaylorWilesDatum n) : Module.Free 𝒪[Δ Q] (auxModule d Q)
theorem auxModule_coinvariants (Q) : coinvariants (Δ Q) (auxModule d Q) ≃ₗ[𝒪] d.heckeModule
-- The missing early field/character supplier is proposed R23.1:soluble-extensions, NOT all R23.1.
-- R22.5/kw-residual-modularity, R22.5/kw-residual-modularity-beta, R22.1/allowable-base-change,
-- R22.1/determinant-character-kinds, R22.1/allowable-base-change-existence,
-- R22.1/alpha-beta-under-allowable-base-change, R22.1/lemma-8-1-residual-field-choice and
-- R22.5/alpha-beta-from-modularity-over-q are typed below the comment block; their former
-- sketches are removed from it.
-- The next paragraph of KW II §8.1 SUPPOSES ψ given; no existence of ψ is asserted by Lemma 8.1.
-- R22.1/lemma-7-10-determinant-adjustment: only the branch for odd p is typed (abstract groups).
-- Dyadic branch, not elaborated: a finite 2-primary group need not have square roots, so a
-- local-character extension theorem and a split soluble totally real extension are needed.
theorem determinant_adjustment_dyadic (ψ ψ' : ArithmeticHeckeCharacter F 𝒪) (V : Finset (FinitePlace F))
    (hred : ψ.reduce = ψ'.reduce) (hp : AgreeOnOpenSubgroupAbove 2 ψ ψ') (hV : ∀ v ∈ V, ψ.unitsAt v = ψ'.unitsAt v)
    (L : FiniteExtension F) :
    ∃ (ζ : FiniteOrderCharacter F 𝒪') (F' : TotallyRealSolubleExtension F),
      IsTwoPower ζ.order ∧ (∀ v ∈ V, ζ.UnramifiedAt v) ∧ F'.LinearDisjoint L ∧ F'.SplitAt V ∧
      ζ.restrict F' ^ 2 * ψ.restrict F' = ψ'.restrict F'
-- R22.5/kw-i-theorem-4-1-odd-prime (KW I Theorem 4.1(2)), not elaborated: crystalline and
-- potentially semistable lifts and modularity of a p-adic representation are not available.
theorem kw_i_4_1_odd (hp : 2 < p) (hirr : AbsIrred (ρbar.restrict ℚ⟮ζ_p⟯)) (hmod : IsModular ρbar)
    (ρ : GaloisRep ℚ 𝒪 2) (hlift : ρ.reduce ≅ ρbar) (hfin : FinitelyRamified ρ)
    (h : (∃ k, 2 ≤ k ∧ k ≤ p + 1 ∧ CrystallineOfWeight ρ p k) ∨ PotSemistableOfWeight ρ p 2) :
    IsModular ρ
-- Gap recorded in the packet: k = p + 1 with k(ρbar) = 2 and a non-ordinary lift.
-- The N ≠ 0 potentially semistable case reduces by a finite-order twist to type (C),
-- as explained in the packet; it is not an additional uncovered case.
-- R22.6/kw-i-theorem-4-1-dyadic (KW I Theorem 4.1(1)), not elaborated for the same reason.
theorem kw_i_4_1_dyadic (hns : ¬ IsSolvable ρbar.image) (hmod : IsModular ρbar)
    (ρ : GaloisRep ℚ 𝒪 2) (hlift : ρ.reduce ≅ ρbar) (hodd : det ρ c = -1) (hfin : FinitelyRamified ρ)
    (h : CrystallineOfWeight ρ 2 2 ∨ (serreWeight ρbar = 4 ∧ SemistableOfWeight ρ 2 2)) :
    IsModular ρ
-- R22.1/theorem-8-2-minimal-modular-lifts: full hypotheses and simultaneous cases in the reader.
theorem minimal_modular_lifts (hF : KWInitialField ρbar F) (ψ : KWGivenDeterminant ρbar F)
    (hα : p ≠ 2 ∨ serreWeight ρbar = 2 → ResidualModularAlpha ρbar p (serreWeight ρbar) F)
    (hβ : ResidualModularBeta ρbar p F) (π : KWSelectedAlphaOrBetaWitness ρbar ψ)
    (Σ : KWSteinbergSubset π) (hΣ : KWContainsRequiredPPlaces π Σ) :
    ∃ F'' : IntermediateField ℚ Ω, AllowableBaseChange ρbar p F F'' ∧
      Nonempty (KWMinimalModularWitness F'' ψ Σ)
-- KWMinimalModularWitness is output data for the precise cases on p.71, not an input assertion.
-- R22.1/lemma-8-3-weight-two-to-p-plus-one iterates the R18.3 per-place injection;
-- its extra weight-p+1-at-residual-weight-2 branch is not used in KW II.
-- R22.1/prescribed-level-raising-step applies R18.3 algebraic level raising and R19.4 compatibility.
-- R22.1/theorem-8-4-prescribed-modular-lifts, then used to construct MinimalLevelData.
theorem prescribed_modular_lift (hF : KWInitialField ρbar F) (ψ : KWGivenDeterminant ρbar F)
    (hα : p ≠ 2 ∨ serreWeight ρbar = 2 → ResidualModularAlpha ρbar p (serreWeight ρbar) F)
    (hβ : ResidualModularBeta ρbar p F) (localData : KWCompatibleLocalLifts ρbar ψ) :
    ∃ F' : IntermediateField ℚ Ω, AllowableBaseChange ρbar p F F' ∧
      ∃ π : HilbertCuspRep F',
        LiftsResidual π ρbar ∧
        FitsRestrictedLocalData π localData F' ∧ det π.galoisRep = ψ.restrict F' * cyclotomic p
-- In type (C), residual weight 2, and in the dyadic weight-4 branch, do not promise split at p.
-- The types above that are not declared below this comment block are unelaborated owner sketches:
-- no axiom and no Prop placeholder implements them.
-- R22.5/kw-odd-prime-lifting (KW II Theorem 9.7, p > 2)
theorem kw_lifting_odd (hp : 2 < p) (hF : UnramifiedAt F p)
    (hirr : AbsIrred (ρbar.restrict (F⟮ζ_p⟯)))
    (hα : ResidualModularAlpha ρbar p (serreWeight ρbar) F) (hβ : ResidualModularBeta ρbar p F)
    (ρ : GaloisRep F 𝒪 2) (hlift : ρ.reduce ≅ ρbar) (hodd : TotallyOdd ρ)
    (hp_type : ∀ v ∣ p, KWTypeA ρ v ∨ KWTypeB ρ v ∨ KWTypeC ρ v) : IsModular ρ
-- R22.5/kisin-potentially-bt-lifting (Kisin, Annals (3.5.5))
theorem kisin_pbt (hp : 2 < p) (hsrm : StronglyResiduallyModular ρ)
    (hres : ∀ 𝔭 ∣ p, ¬ PotOrdinary ρ 𝔭 → ResidueField 𝔭 = 𝔽_p)
    (hirr : AbsIrred (ρbar.restrict (F⟮ζ_p⟯)))
    (h5 : p = 5 → ExceptionalPGL2F5Condition ρbar) : IsModular ρ
-- R22.6/dyadic-patched-ring, dyadic-patched-torsor, dyadic-r-equals-t
def dyadicPatchedRing : PatchedRing  -- R′_∞ ↠ R_∞ with a free T-action and d : Sp R′_∞ → T
theorem dyadicDet_smul (λ : T) (x : Sp R′_∞) : d (λ • x) = λ ^ 2 * d x
theorem dyadic_torsor : IsTorsor (T.torsion 2) (Sp R_∞) (Sp R^inv_∞)
theorem dyadic_kernel_twoPowerTorsion : ∀ r ∈ RingHom.ker π, ∃ n, (2 : 𝒪) ^ n • r = 0
-- The reverse containment uses 2-torsion-freeness of the Hecke algebra.
-- At finite level the determinant-one quotient D''_m only surjects onto D_m;
-- the kernel is contained in its mth maximal-ideal power. Equality is at the limit.
-- R22.6/kisin-dyadic-bt-lifting, hypothesis-h
theorem kisin_2adic (hns : ¬ IsSolvable (ρbar.image)) (hmod : IsModular ρbar)
    (hbt : ∀ v ∣ 2, PotBarsottiTate ρ v) (hdet : det ρ = cyclo * ψ) (hψ : TotallyEven ψ)
    (hord : ∀ v ∣ 2, PotOrdinary ρ v → F_v = ℚ_2) : IsModular ρ
theorem hypothesisH (ρ : GaloisRep ℚ 𝒪 2) (hodd : det ρ c = -1) (hns : ¬ IsSolvable (ρbar.image))
    (hmod : IsModular ρbar) (hwt : PotCrystalline ρ 2 ∧ HodgeTate ρ = {0, 1}) : IsModular ρ
-- R32.1/lifting-statement-table (Dieulefait–Pacetti Theorems 1.4–1.7 as propositions)
-- pStar is defined in the active, checked fragment below.
def OddPrimeLifting (p : ℕ) : Prop :=
  ∀ (ρ : GaloisRep ℚ (AlgebraicClosure ℚ_[p]) 2) (k : ℕ), IsOdd ρ → FinitelyRamified ρ →
    AbsIrred (ρ.reduce.restrict ℚ⟮√(pStar p)⟯) → DeRhamWithWeights ρ p {0, k - 1} → 1 < k →
    IsModular ρ.reduce → IsModularOfWeight ρ k
def DyadicLifting : Prop      -- p = 2, ρ odd, de Rham {0, k − 1}, ρbar modular with ¬ IsSolvable (image)
def ResiduallyReducibleLifting (p : ℕ) (hp : 5 ≤ p) : Prop  -- ρ irreducible odd, ρbar^ss = χ₁ ⊕ χ₂
def OrdinaryThreeLifting : Prop  -- p = 3, ρbar^ss = 1 ⊕ χ̄₃, ρ|I₃ ≅ (∗ ∗; 0 1), det ρ = ψ χ₃^(k−1)
-- R32.1/quadratic-cyclotomic-irreducibility (DP Lemma 1.13)
theorem absIrred_sqrt_iff_cyclotomic (hp : Odd p) (hodd : IsOdd ρbar) :
    AbsIrred (ρbar.restrict ℚ⟮√(pStar p)⟯) ↔ AbsIrred (ρbar.restrict (CyclotomicField p ℚ))
-- R32.1/non-solvable-residual-image
theorem absIrred_restrict_of_not_solvable (h : ¬ Group.IsSolvable ρbar.image) (K : Type*) [SolvableGaloisExt ℚ K] :
    ¬ Group.IsSolvable (ρbar.restrict K).image ∧ AbsIrred (ρbar.restrict K)
-- R32.1/hodge-tate-and-oddness-normalisation
theorem isOdd_of_reduce_isOdd (hp : 2 < p) (h : IsOdd ρ.reduce) : IsOdd ρ
theorem isModularOfWeight_of_twist (hwt : DeRhamWithWeights ρ p {0, k - 1}) (g : Eigenform k') (hk : 2 ≤ k) (hk' : 2 ≤ k') (χ : FiniteOrderTimesCyclo)
    (h : ρ ≅ g.rep ⊗ χ) : IsModularOfWeight ρ k
-- R32.2/kisin-multiplicity-criterion (Kisin (2.2.10), (2.2.14), (2.2.16); Gee–Kisin Lemma B.5.1)
theorem patched_faithful_iff (d : KisinPatchingDatum F D σ ψ) :
    Module.Faithful d.Rbar d.M ↔ e (d.Rbar ⧸ π) * 2 ^ d.R.card ≤ e (d.M ⧸ π) (d.Rbar ⧸ π)
-- No unconditional `patched_faithful_of_breuilMezard` is asserted here.
-- Gee--Kisin B.5.2 gives the graded-piece LOWER BOUND, normalised by 2^(-|R|),
-- only under its extra nonexceptional local hypothesis. Exceptional cases need
-- the Hu--Tan/Tung support arguments and their separate global hypotheses.
-- R32.2/kisin-fontaine-mazur-totally-split, odd-prime-de-rham-lifting, odd-prime-statement-over-q
theorem kisin_fm (hp : 2 < p) (hF : TotallySplit F p) (habel : ∀ v ∣ p, SemistableOverAbelian ρ v)
    (hHT : ∀ v ∣ p, DistinctHT ρ v) (hmod : IsModular ρbar) (hirr : AbsIrred (ρbar.restrict F⟮ζ_p⟯))
    (hloc : ∀ v ∣ p, ∀ χ, ¬ (ρbar.restrict (F_v v) ≅ upperTri (ω * χ) χ)) : IsModular ρ
theorem deRham_lifting_odd (hp : Odd p) (hF : TotallySplit F p) (hmod : IsModular ρbar)
    (hirr : AbsIrred (ρbar.restrict F⟮ζ_p⟯)) (hpst : ∀ v ∣ p, PotSemistable ρ v ∧ DistinctHT ρ v) :
    IsModularUpToTwist ρ
theorem oddPrimeLifting (hp : Odd p) : OddPrimeLifting p
```
-/

set_option autoImplicit false

noncomputable section

namespace TauCeti.ModularityLifting

/-! ## Imported interfaces

Nothing in this section is planned by this part. Each declaration stands in for an object that
another roadmap (named in its docstring) owns; the owner's definition governs. A definition below
uses only conditions the pinned Mathlib can state, and says what it leaves out; an opaque `def` is
a type, or a function with values in `ℕ` or in homomorphisms, whose body is `sorry`. No condition
is a `Prop`-valued placeholder.

Conventions. `K` is the ground number field (`ℚ` in Khare–Wintenberger), `Ω` an algebraic closure
of `K`, and `G_K = Gal(Ω/K)`. A finite extension `E/K` is an `E : IntermediateField K Ω`, and
`G_E` is the subgroup `E.fixingSubgroup` of `G_K`. The residual representation is a homomorphism
`ρ : Gal(Ω/K) →* GL (Fin 2) k`; `k` is meant to be a finite field of characteristic `p`. The
definitions do not use that `K` is a number field, that `Ω` is algebraically closed or that `k` is
finite; the theorems carry these hypotheses. -/

section ImportedInterfaces

open IntermediateField NumberField IsDedekindDomain

variable {K Ω : Type*} [Field K] [Field Ω] [Algebra K Ω] {k : Type*} [Field k]

/-- ArithmeticGaloisRepresentations R01.4 (stand-in): a subgroup `H` of `GL₂(k)` acts absolutely
irreducibly on `k²`. Burnside's form: the matrices of `H` span the `2 × 2` matrices over an
algebraic closure of `k`. The owner's definition (irreducibility after every extension of
scalars) governs. -/
def IsAbsIrreducibleSubgroup (H : Subgroup (GL (Fin 2) k)) : Prop :=
  Submodule.span (AlgebraicClosure k)
    ((fun g : GL (Fin 2) k =>
        (g : Matrix (Fin 2) (Fin 2) k).map (algebraMap k (AlgebraicClosure k))) ''
      (H : Set (GL (Fin 2) k))) = ⊤

/-- ArithmeticGaloisRepresentations R01.3 (stand-in): `ρ̄|_{D_p}` is irreducible. For every
valuation subring `A` of `Ω` whose maximal ideal contains `p` (a place of `Ω` above `p`), the image
of the decomposition group of `A` is absolutely irreducible. "Irreducible" is read as absolutely
irreducible: an unramified `ρ̄|_{D_p}` has cyclic image, so it is reducible over the algebraic
closure of `k`, though it may be irreducible over `k`. For `K = ℚ` these decomposition groups are
conjugate; for general `K` the condition is asked at every place of `K` above `p`. -/
def IsIrreducibleAtP (ρ : Gal(Ω/K) →* GL (Fin 2) k) (p : ℕ) : Prop :=
  ∀ A : ValuationSubring Ω, (p : Ω) ∈ A.nonunits →
    IsAbsIrreducibleSubgroup (Subgroup.map ρ (A.decompositionSubgroup K))

/-- ArithmeticGaloisRepresentations R01.3 (stand-in): `ρ̄|_{G_E}` is unramified at the place `A` of
`Ω`: `ρ̄` is trivial on the inertia group of `A` in `G_E`, which is the intersection of `G_E` with
the inertia group of `A` in `G_K`. -/
def IsUnramifiedAt (ρ : Gal(Ω/K) →* GL (Fin 2) k) (E : IntermediateField K Ω)
    (A : ValuationSubring Ω) : Prop :=
  ∀ σ ∈ A.inertiaSubgroup K, (σ : Gal(Ω/K)) ∈ E.fixingSubgroup → ρ σ = 1

/-- ArithmeticGaloisRepresentations R01.3 (stand-in): `ρ̄|_{G_E}` is trivial on the decomposition
group of the place `A` of `Ω`. -/
def IsTrivialAt (ρ : Gal(Ω/K) →* GL (Fin 2) k) (E : IntermediateField K Ω)
    (A : ValuationSubring Ω) : Prop :=
  ∀ σ ∈ A.decompositionSubgroup K, σ ∈ E.fixingSubgroup → ρ σ = 1

/-- ArithmeticGaloisRepresentations R01.4 (stand-in): `ρ̄` is totally odd. For every embedding
`φ : Ω → ℂ` and every `c ∈ G_K` that induces complex conjugation through `φ`,
`det ρ̄(c) = −1`. -/
def IsTotallyOdd (ρ : Gal(Ω/K) →* GL (Fin 2) k) : Prop :=
  ∀ (φ : Ω →+* ℂ) (c : Gal(Ω/K)), (∀ x, φ (c x) = (starRingEnd ℂ) (φ x)) →
    Matrix.GeneralLinearGroup.det (ρ c) = -1

/-- The field `E(μ_p)` inside `Ω`. -/
def adjoinRootsOfUnity (p : ℕ) (E : IntermediateField K Ω) : IntermediateField K Ω :=
  E ⊔ IntermediateField.adjoin K {ζ : Ω | ζ ^ p = 1}

/-- An extension `B/A` of number fields is unramified at every prime of `B` above `p`. -/
def UnramifiedAbove (p : ℕ) (A B : Type*) [Field A] [Field B] [Algebra A B] : Prop :=
  ∀ P : Ideal (𝓞 B), P.IsPrime → (p : 𝓞 B) ∈ P → P.ramificationIdx (𝓞 A) = 1

/-- An extension `B/A` of number fields is split at every prime of `B` above `p`: ramification
index and residue degree are `1`. -/
def SplitAbove (p : ℕ) (A B : Type*) [Field A] [Field B] [Algebra A B] : Prop :=
  ∀ P : Ideal (𝓞 B), P.IsPrime → (p : 𝓞 B) ∈ P →
    P.ramificationIdx (𝓞 A) = 1 ∧ P.inertiaDeg (𝓞 A) = 1

/-- AutomorphicGaloisRepresentations R19.2 (stand-in), opaque: the type of cuspidal automorphic
representations of `GL₂(𝔸_E)` that are discrete series at every infinite place, for a totally
real number field `E` inside `Ω`. -/
def HilbertCuspRep (E : IntermediateField K Ω) : Type := sorry

namespace HilbertCuspRep

variable {E : IntermediateField K Ω}

/-- Opaque (R19.2): the weight `k_w ≥ 2` of the discrete series `π_w` at the infinite place `w`. -/
def weight (π : HilbertCuspRep E) : InfinitePlace E → ℕ := sorry

/-- Opaque (R19.2, with the local conductor of GL2AutomorphicRepresentationsAndTransfer): the
exponent of the conductor of `π_v` at the finite place `v`; it is `0` exactly when `π_v` is
unramified, and `1` for an unramified twist of the Steinberg representation. -/
def conductorExp (π : HilbertCuspRep E) : HeightOneSpectrum (𝓞 E) → ℕ := sorry

/-- Opaque (R19.2): the type of pairs `(λ, j)`, with `λ` a place above `p` of the coefficient
field of `π` and `j` an embedding of the residue field of `λ` into `k`. -/
def ResidualDatum (π : HilbertCuspRep E) (p : ℕ) (k : Type*) [Field k] : Type := sorry

/-- Opaque (R19.2): the semisimple reduction `ρ̄_{π,λ}` of the `λ`-adic Galois representation
attached to `π`, with coefficients extended to `k` along `j`, as a homomorphism on `G_E`. -/
def residualRep (π : HilbertCuspRep E) {p : ℕ} (ι : π.ResidualDatum p k) :
    E.fixingSubgroup →* GL (Fin 2) k := sorry

end HilbertCuspRep

/-- SerreWeightAndLevelOptimisation (stand-in), opaque: the weight `k(ρ̄)` of Serre's conjecture
for a representation `ρ̄` of `G_ℚ` in characteristic `p`. -/
def serreWeight {Ω : Type*} [Field Ω] [Algebra ℚ Ω] (ρ : Gal(Ω/ℚ) →* GL (Fin 2) k) (p : ℕ) :
    ℕ := sorry

end ImportedInterfaces

namespace KW

section Allowable

open IntermediateField NumberField IsDedekindDomain

variable {K Ω : Type*} [Field K] [Field Ω] [Algebra K Ω] {k : Type*} [Field k]

/-- One step of a soluble tower: `E ⊆ E'`, and `E'/E` is finite and Galois with soluble group. -/
def IsSolubleStep (E E' : IntermediateField K Ω) : Prop :=
  ∃ h : E ≤ E', FiniteDimensional E (extendScalars h) ∧ IsGalois E (extendScalars h) ∧
    Group.IsSolvable ((extendScalars h) ≃ₐ[E] (extendScalars h))

/-- `F'/F` is soluble in the tower sense of `R22.1/allowable-base-change`: there is a tower
`F = F₀ ⊆ F₁ ⊆ … ⊆ F_n = F'` in which every step is finite and Galois with soluble group. The top
need not be Galois over `F`. -/
inductive IsSolubleTower (F : IntermediateField K Ω) : IntermediateField K Ω → Prop
  | refl : IsSolubleTower F F
  | step {E E' : IntermediateField K Ω} :
      IsSolubleTower F E → IsSolubleStep E E' → IsSolubleTower F E'

/-- The standing hypotheses of Khare–Wintenberger II §7.6.2 on `ρ̄` and a base field `F`, as far
as they are used in `R22.1/allowable-base-change` and the two lemmas on it: `ρ̄` is continuous for
the Krull topology (its kernel is open) and totally odd; `F` is a totally real number field,
unramified at `p` over `ℚ`, and split at `p` if `ρ̄|_{D_p}` is irreducible; `ρ̄(G_F)` is
non-solvable if `p = 2`, and `ρ̄|_{G_{F(μ_p)}}` is absolutely irreducible if `p > 2`. -/
structure StandingHypotheses [NumberField K] (ρ : Gal(Ω/K) →* GL (Fin 2) k) (p : ℕ)
    (F : IntermediateField K Ω) : Prop where
  continuous : IsOpen (ρ.ker : Set Gal(Ω/K))
  totallyOdd : IsTotallyOdd ρ
  finiteDimensional : FiniteDimensional K F
  totallyReal : IsTotallyReal F
  unramifiedAbove : UnramifiedAbove p ℚ F
  splitAbove : IsIrreducibleAtP ρ p → SplitAbove p ℚ F
  not_isSolvable_of_two : p = 2 → ¬ Group.IsSolvable (Subgroup.map ρ F.fixingSubgroup)
  absIrreducible_of_odd : 2 < p →
    IsAbsIrreducibleSubgroup (Subgroup.map ρ (adjoinRootsOfUnity p F).fixingSubgroup)

/-- `R22.1/allowable-base-change` (Khare–Wintenberger II, Definition 7.9). `F'/F` is an allowable
base change for `ρ̄`: (1) `F'` is totally real; (2) `F'/F` is soluble in the tower sense, so in
particular finite; (3) `[F' : F]` is even; (4) `F'/F` is unramified at the primes above `p`, and
split at them if `ρ̄|_{D_p}` is irreducible; (5) `ρ̄(G_{F'}) = ρ̄(G_F)` and `ρ̄|_{G_{F'(μ_p)}}` is
absolutely irreducible. Base and top are intermediate fields of `Ω/K`, so that composition is
`AllowableBaseChange.comp`. The standing hypotheses on `F` are `StandingHypotheses`; they are not
part of the definition. -/
structure AllowableBaseChange (ρ : Gal(Ω/K) →* GL (Fin 2) k) (p : ℕ)
    (F F' : IntermediateField K Ω) : Prop where
  /-- `F ⊆ F'`. -/
  le : F ≤ F'
  /-- Packet API `AllowableBaseChange.totallyReal`: `F'` is totally real. -/
  totallyReal : IsTotallyReal F'
  /-- Packet API `AllowableBaseChange.solubleTower`: a tower from `F` to `F'` with every step
  finite and Galois with soluble group. -/
  solubleTower : IsSolubleTower F F'
  /-- Packet API `AllowableBaseChange.degree_even`: `[F' : F]` is even. -/
  degree_even : Even (relfinrank F F')
  /-- `F'/F` is unramified at the primes above `p`. -/
  unramifiedAbove : UnramifiedAbove p F (extendScalars le)
  /-- `F'/F` is split at the primes above `p` if `ρ̄|_{D_p}` is irreducible. -/
  splitAbove : IsIrreducibleAtP ρ p → SplitAbove p F (extendScalars le)
  /-- `ρ̄(G_{F'}) = ρ̄(G_F)`. -/
  image_map_eq : Subgroup.map ρ F'.fixingSubgroup = Subgroup.map ρ F.fixingSubgroup
  /-- `ρ̄|_{G_{F'(μ_p)}}` is absolutely irreducible. -/
  absIrreducible_cyclotomic :
    IsAbsIrreducibleSubgroup (Subgroup.map ρ (adjoinRootsOfUnity p F').fixingSubgroup)

namespace AllowableBaseChange

variable {ρ : Gal(Ω/K) →* GL (Fin 2) k} {p : ℕ} {F F' F'' : IntermediateField K Ω}

/-- The extension `F'/F` as an intermediate field of `Ω/F`. -/
def toExtension (h : AllowableBaseChange ρ p F F') : IntermediateField F Ω :=
  extendScalars h.le

/-- With `toExtension`: the inclusion `G_{F'} ⊆ G_F`. -/
example (h : AllowableBaseChange ρ p F F') : F'.fixingSubgroup ≤ F.fixingSubgroup :=
  IntermediateField.fixingSubgroup_le h.le

/-- With `solubleTower`: a finite Galois extension with soluble group is a tower of one step. -/
example (h : IsSolubleStep F F') : IsSolubleTower F F' := .step .refl h

/-- `ρ̄(G_{F'}) = ρ̄(G_F)`, and `ρ̄|_{G_{F'(μ_p)}}` is absolutely irreducible. -/
theorem image_eq (h : AllowableBaseChange ρ p F F') :
    Subgroup.map ρ F'.fixingSubgroup = Subgroup.map ρ F.fixingSubgroup ∧
      IsAbsIrreducibleSubgroup (Subgroup.map ρ (adjoinRootsOfUnity p F').fixingSubgroup) :=
  ⟨h.image_map_eq, h.absIrreducible_cyclotomic⟩

/-- If `F'/F` is allowable and `F''/F'` is allowable over the base `F'`, then `F''/F` is
allowable. Here `F` is a number field (finite over `K`). -/
theorem comp [NumberField K] [FiniteDimensional K F] (h₁ : AllowableBaseChange ρ p F F')
    (h₂ : AllowableBaseChange ρ p F' F'') : AllowableBaseChange ρ p F F'' := sorry

/-- Packet test `allowable_odd_degree`: if `[F' : F] = 3` then `F'/F` is not allowable, whatever
`ρ̄` is. -/
example (h3 : relfinrank F F' = 3) : ¬ AllowableBaseChange ρ p F F' := fun h => by
  have := h.degree_even
  rw [h3] at this
  exact absurd this (by decide)

/-- Packet test `allowable_image_loss`: if `ρ̄(G_{F'})` is a proper subgroup of `ρ̄(G_F)` then
`F'/F` is not allowable, even if `F'` is totally real and `F'/F` is quadratic. -/
example (_hreal : IsTotallyReal F') (_h2 : relfinrank F F' = 2)
    (hlt : Subgroup.map ρ F'.fixingSubgroup < Subgroup.map ρ F.fixingSubgroup) :
    ¬ AllowableBaseChange ρ p F F' := fun h => hlt.ne h.image_map_eq

/-- Packet test `allowable_comp_degree`: two allowable steps compose, and for two quadratic steps
`[F'' : F] = 4`. -/
example [NumberField K] [FiniteDimensional K F] (h₁ : AllowableBaseChange ρ p F F')
    (h₂ : AllowableBaseChange ρ p F' F'') (d₁ : relfinrank F F' = 2)
    (d₂ : relfinrank F' F'' = 2) :
    AllowableBaseChange ρ p F F'' ∧ relfinrank F F'' = 4 :=
  ⟨h₁.comp h₂, by rw [← relfinrank_mul_relfinrank h₁.le h₂.le, d₁, d₂]⟩

/-- Packet test `allowable_trivial_extension`: the trivial extension `F' = F` is not allowable,
its degree `1` being odd. -/
example : ¬ AllowableBaseChange ρ p F F := fun h => by
  have := h.degree_even
  rw [relfinrank_self] at this
  exact absurd this (by decide)

end AllowableBaseChange

/-- `R22.1/allowable-base-change-existence`. Under the standing hypotheses on `ρ̄` and `F`, for a
finite extension `L/F` and a finite set `S` of finite places of `F` there is an allowable
`F'/F`, finite and Galois with soluble group, linearly disjoint from `L` over `F`, split at every
place of `S`, with `ρ̄(G_{F'(μ_p)}) = ρ̄(G_{F(μ_p)})`, and over which the standing hypotheses hold
again.

Left out: prescribed nontrivial completions `E_v` at the places of `S₀` (only the case
`E_v = F_v` is stated, as splitting at `S`; a nontrivial unramified `E_v` above `p` is not
stated); and linear disjointness from the field cut out by `ρ̄|_{G_F}` and from its extension by
`μ_p`, of which only the consequences for the images are stated. -/
theorem allowableBaseChange_exists [NumberField K] [IsAlgClosure K Ω] [Finite k] {p : ℕ}
    [Fact p.Prime] [CharP k p] {ρ : Gal(Ω/K) →* GL (Fin 2) k} {F : IntermediateField K Ω}
    (hF : StandingHypotheses ρ p F) (L : IntermediateField K Ω) (hFL : F ≤ L)
    [FiniteDimensional K L] (S : Finset (HeightOneSpectrum (𝓞 F))) :
    ∃ (F' : IntermediateField K Ω) (h : AllowableBaseChange ρ p F F'),
      IsSolubleStep F F' ∧
      (extendScalars h.le).LinearDisjoint (extendScalars hFL) ∧
      Subgroup.map ρ (adjoinRootsOfUnity p F').fixingSubgroup =
        Subgroup.map ρ (adjoinRootsOfUnity p F).fixingSubgroup ∧
      (∀ P : Ideal (𝓞 (extendScalars h.le)), P.IsPrime →
        (∃ v ∈ S, P.under (𝓞 F) = v.asIdeal) →
          P.ramificationIdx (𝓞 F) = 1 ∧ P.inertiaDeg (𝓞 F) = 1) ∧
      StandingHypotheses ρ p F' := sorry

/-- `R22.1/allowable-base-change-existence`, clause (5): the quadratic case. Under the standing
hypotheses, for a finite extension `L/F` and disjoint finite sets `S`, `T` of finite places of
`F`, with no place of `T` above `p` when `ρ̄|_{D_p}` is irreducible, there is an allowable `F'/F`
of degree `2`, linearly disjoint from `L` over `F`, split at every place of `S` and inert at
every place of `T`, over which the standing hypotheses hold again. This is the step of the
quadratic tower in the proof of Theorem 8.4.

Left out: prescribed ramified quadratic completions (only the split and the unramified quadratic
cases are stated). -/
theorem allowableBaseChange_exists_quadratic [NumberField K] [IsAlgClosure K Ω] [Finite k] {p : ℕ}
    [Fact p.Prime] [CharP k p] {ρ : Gal(Ω/K) →* GL (Fin 2) k} {F : IntermediateField K Ω}
    (hF : StandingHypotheses ρ p F) (L : IntermediateField K Ω) (hFL : F ≤ L)
    [FiniteDimensional K L] (S T : Finset (HeightOneSpectrum (𝓞 F))) (hST : Disjoint S T)
    (hT : IsIrreducibleAtP ρ p → ∀ v ∈ T, (p : 𝓞 F) ∉ v.asIdeal) :
    ∃ (F' : IntermediateField K Ω) (h : AllowableBaseChange ρ p F F'),
      relfinrank F F' = 2 ∧
      (extendScalars h.le).LinearDisjoint (extendScalars hFL) ∧
      (∀ P : Ideal (𝓞 (extendScalars h.le)), P.IsPrime →
        (∃ v ∈ S, P.under (𝓞 F) = v.asIdeal) →
          P.ramificationIdx (𝓞 F) = 1 ∧ P.inertiaDeg (𝓞 F) = 1) ∧
      (∀ P : Ideal (𝓞 (extendScalars h.le)), P.IsPrime →
        (∃ v ∈ T, P.under (𝓞 F) = v.asIdeal) →
          P.ramificationIdx (𝓞 F) = 1 ∧ P.inertiaDeg (𝓞 F) = 2) ∧
      StandingHypotheses ρ p F' := sorry

/-- `R22.1/lemma-8-1-residual-field-choice` (Khare–Wintenberger II, Lemma 8.1), with the ground
field `K` in the place of `ℚ`. Under the standing hypotheses over `K` there is `F/K`, finite and
Galois with soluble group and allowable over `K` (so totally real, of even degree, unramified
above `p`, split above `p` if `ρ̄|_{D_p}` is irreducible, with the same image), over which the
standing hypotheses hold again, such that `ρ̄|_{G_F}` is unramified at every place not above `p`,
and trivial on the decomposition groups above `p` if `ρ̄` is unramified above `p`.

Left out: the Serre weight `k(ρ̄)`, hence the normalisation `2 ≤ k(ρ̄) ≤ p + 1` and the clause
"split at `p` if `k(ρ̄) = p + 1`". No determinant character `ψ` is asserted to exist. -/
theorem exists_initial_field [NumberField K] [IsAlgClosure K Ω] [Finite k] {p : ℕ}
    [Fact p.Prime] [CharP k p] {ρ : Gal(Ω/K) →* GL (Fin 2) k}
    (hK : StandingHypotheses ρ p ⊥) :
    ∃ F : IntermediateField K Ω, AllowableBaseChange ρ p ⊥ F ∧ IsSolubleStep ⊥ F ∧
      StandingHypotheses ρ p F ∧
      (∀ A : ValuationSubring Ω, (p : Ω) ∉ A.nonunits → IsUnramifiedAt ρ F A) ∧
      ((∀ A : ValuationSubring Ω, (p : Ω) ∈ A.nonunits → IsUnramifiedAt ρ ⊥ A) →
        ∀ A : ValuationSubring Ω, (p : Ω) ∈ A.nonunits → IsTrivialAt ρ F A) := sorry

/-- `R22.1/lemma-7-10-determinant-adjustment`, the branch for odd `p`, for characters of an
abstract commutative group: if `ψ'/ψ` has order dividing `p ^ n` with `p` odd, there is `ζ` of
order dividing `p ^ n` with `ζ² ψ = ψ'`, and `ζ` is trivial wherever `ψ` and `ψ'` agree (so it is
unramified where their restrictions to the local units agree). Here `F' = F`.

Left out: that the characters are arithmetic idele class characters with the same reduction, and
the whole dyadic branch (extension of local characters, and the soluble totally real field split
at `V` over which `ζ² ψ = ψ'`). -/
theorem exists_sq_mul_eq_of_pPower {A M : Type*} [CommGroup A] [CommGroup M] {p : ℕ}
    (hp : Odd p) (ψ ψ' : A →* M) (n : ℕ) (h : (ψ' / ψ) ^ p ^ n = 1) :
    ∃ ζ : A →* M, ζ ^ 2 * ψ = ψ' ∧ ζ ^ p ^ n = 1 ∧ ∀ a : A, ψ a = ψ' a → ζ a = 1 := by
  obtain ⟨m, hm⟩ : ∃ m, p ^ n + 1 = 2 * m := by
    obtain ⟨r, hr⟩ := hp.pow (n := n)
    exact ⟨r + 1, by omega⟩
  refine ⟨(ψ' / ψ) ^ m, ?_, ?_, ?_⟩
  · rw [← pow_mul, mul_comm m 2, ← hm, pow_succ, h, one_mul, div_mul_cancel]
  · rw [← pow_mul, mul_comm, pow_mul, h, one_pow]
  · intro a ha
    simp [ha]

/-- `R22.1/lemma-7-10-determinant-adjustment`, the group-theoretic reason for the branch for odd
`p`: in a finite commutative `p`-group with `p` odd, every element has a unique square root. For
`p = 2` this fails (the element of order two of a cyclic group of order two is not a square). -/
theorem existsUnique_sq_eq_of_isPGroup {G : Type*} [CommGroup G] [Finite G] {p : ℕ}
    [Fact p.Prime] (hp : p ≠ 2) (hG : IsPGroup p G) (x : G) : ∃! y : G, y ^ 2 = x := by
  have hcop : (Nat.card G).Coprime 2 := by
    obtain ⟨n, hn⟩ := IsPGroup.iff_card.mp hG
    rw [hn]
    exact Nat.Coprime.pow_left n ((Nat.coprime_primes Fact.out Nat.prime_two).mpr hp)
  exact (powCoprime hcop).bijective.existsUnique x

end Allowable

/-- Integer exponent of the norm in determinant kind (i). -/
def kindIExponent (k : ℕ) : ℤ := 2 - (k : ℤ)

/-- Integer exponent of the Teichmüller character in kind (ii). -/
def kindIIExponent (k : ℕ) : ℤ := (k : ℤ) - 2

/-- Integer exponent of the norm in kind (iii), used only at residual weight two. -/
def kindIIIExponent (p : ℕ) : ℤ := 1 - (p : ℤ)

theorem kindIExponent_eq (k : ℕ) : kindIExponent k = 2 - (k : ℤ) := rfl
theorem kindIIExponent_eq (k : ℕ) : kindIIExponent k = (k : ℤ) - 2 := rfl
theorem kindIIIExponent_eq (p : ℕ) : kindIIIExponent p = 1 - (p : ℤ) := rfl

/-- The two local characters coincide at weight two; this tests their exponents only. -/
example : kindIExponent 2 = 0 ∧ kindIIExponent 2 = 0 := by
  norm_num [kindIExponent, kindIIExponent]

/-- Integer subtraction is essential; natural subtraction would give the wrong character. -/
example : kindIIIExponent 3 = -2 ∧ kindIExponent 4 = -2 := by
  norm_num [kindIIIExponent, kindIExponent]

/-- Kind (iii)'s required residual weight is two, not four. -/
example : (4 : ℕ) ≠ 2 := by norm_num

/-- Degree tests for allowable fields are arithmetic regressions, not field existence proofs. -/
example : ¬ Even (3 : ℕ) ∧ Even (2 * 2 : ℕ) := by decide

/-- At the upper residual-weight boundary, case (b) is excluded and case (c) is selected. -/
example : ¬ (6 < 5 + 1 : Prop) ∧ (6 : ℕ) = 5 + 1 := by norm_num

section DeterminantKinds

/-! `R22.1/determinant-character-kinds`. `U` stands for the units above `p` (the product of the
groups `𝒪_{F_v}^×` over `v | p`) and `R` for the coefficient ring; `ψp : U →* Rˣ` is the
restriction to `U` of the given character `ψ`. The norm character `N : U →* Rˣ` (the product of
the local norms to `ℤ_p^×`, mapped to `R`) and the Teichmüller character of the norm
`τN : U →* Rˣ` are parameters: they are data of the owner (GlobalGaloisDeformations
R04.6/kw-deformation-data), not constructed here. The three kinds are predicates on the given
`ψp`; they are not disjoint and assert no existence. -/

variable {U R : Type*} [CommGroup U] [CommRing R]

/-- `ψ` is of kind (i): its restriction to the units above `p` is `u ↦ N(u)^{2−k(ρ̄)}`. -/
def IsKindI (ψp N : U →* Rˣ) (k : ℕ) : Prop := ∀ u, ψp u = N u ^ kindIExponent k

/-- `ψ` is of kind (ii): its restriction to the units above `p` is `u ↦ τ(N(u))^{k(ρ̄)−2}`. -/
def IsKindII (ψp τN : U →* Rˣ) (k : ℕ) : Prop := ∀ u, ψp u = τN u ^ kindIIExponent k

/-- `ψ` is of kind (iii): `k(ρ̄) = 2` and the restriction of `ψ` to the units above `p` is
`u ↦ N(u)^{1−p}`. -/
def IsKindIII (ψp N : U →* Rˣ) (p k : ℕ) : Prop :=
  k = 2 ∧ ∀ u, ψp u = N u ^ kindIIIExponent p

/-- At `k(ρ̄) = 2` kinds (i) and (ii) are the same condition on `ψ`: trivial on the units above
`p`. -/
theorem kindsI_II_at_two (ψp N τN : U →* Rˣ) : IsKindI ψp N 2 ↔ IsKindII ψp τN 2 := by
  simp [IsKindI, IsKindII, kindIExponent, kindIIExponent]

/-- Packet test `determinant_overlap_weight_two`: at `k = 2` the exponents of kinds (i) and (ii)
are both `0`, and `ψ` is of kind (i) if and only if it is of kind (ii). -/
example (ψp N τN : U →* Rˣ) :
    kindIExponent 2 = 0 ∧ kindIIExponent 2 = 0 ∧ (IsKindI ψp N 2 ↔ IsKindII ψp τN 2) :=
  ⟨by norm_num [kindIExponent], by norm_num [kindIIExponent], kindsI_II_at_two ψp N τN⟩

/-- Packet test `determinant_negative_exponent`: kind (iii) at `p = 3` has exponent `−2`, so the
norm character is inverted. -/
example (ψp N : U →* Rˣ) :
    kindIIIExponent 3 = -2 ∧ (IsKindIII ψp N 3 2 ↔ ∀ u, ψp u = (N u ^ 2)⁻¹) := by
  have h : kindIIIExponent 3 = -2 := by norm_num [kindIIIExponent]
  refine ⟨h, ?_⟩
  simp [IsKindIII, h, zpow_neg]

/-- Packet test `determinant_third_needs_weight_two`: at residual weight `4` no `ψ` is of kind
(iii), since the predicate contains `k(ρ̄) = 2`. -/
example (ψp N : U →* Rˣ) (p : ℕ) : ¬ IsKindIII ψp N p 4 := fun h => by
  have := h.1
  omega

end DeterminantKinds

end KW

section ResidualModularity

open IntermediateField NumberField IsDedekindDomain

variable {K Ω : Type*} [Field K] [Field Ω] [Algebra K Ω] {k : Type*} [Field k]
  {E : IntermediateField K Ω}

/-! `R22.5/kw-residual-modularity` and `R22.5/kw-residual-modularity-beta`. The identifiers are the
stable R22.5 ones; the parent R22.1 owns the two definitions, which precede §8 of
Khare–Wintenberger II. Their carrier comes from AutomorphicGaloisRepresentations R19.2
(`HilbertCuspRep`), not from the minimal level data or its prescribed witness. They are stated for
the restriction of `ρ̄` to `G_E`, for any `E` inside `Ω`, so that they can be transported along an
allowable base change. -/

/-- `ρ̄_π ≅ ρ̄|_{G_E}`: for some residual datum of `π`, the residual representation of `π` is
conjugate in `GL₂(k)` to the restriction of `ρ̄` to `G_E`. -/
def IsResidualWitness (ρ : Gal(Ω/K) →* GL (Fin 2) k) (p : ℕ) (π : HilbertCuspRep E) : Prop :=
  ∃ (ι : π.ResidualDatum p k) (g : GL (Fin 2) k),
    ∀ σ : E.fixingSubgroup, π.residualRep ι σ = g * ρ σ * g⁻¹

/-- `π` is a witness for (α): `ρ̄_π ≅ ρ̄|_{G_E}`, `π` has parallel weight `kS`, and `π_v` is
unramified at every `v | p`. -/
def IsAlphaWitness (ρ : Gal(Ω/K) →* GL (Fin 2) k) (p kS : ℕ) (π : HilbertCuspRep E) : Prop :=
  IsResidualWitness ρ p π ∧ (∀ w, π.weight w = kS) ∧
    ∀ v : HeightOneSpectrum (𝓞 E), (p : 𝓞 E) ∈ v.asIdeal → π.conductorExp v = 0

/-- `π` is a witness for (β): `ρ̄_π ≅ ρ̄|_{G_E}`, `π` has parallel weight two, and the conductor
exponent of `π_v` is at most one at every `v | p`. -/
def IsBetaWitness (ρ : Gal(Ω/K) →* GL (Fin 2) k) (p : ℕ) (π : HilbertCuspRep E) : Prop :=
  IsResidualWitness ρ p π ∧ (∀ w, π.weight w = 2) ∧
    ∀ v : HeightOneSpectrum (𝓞 E), (p : 𝓞 E) ∈ v.asIdeal → π.conductorExp v ≤ 1

/-- `R22.5/kw-residual-modularity`, hypothesis (α) of Khare–Wintenberger II §8.2 for `ρ̄|_{G_E}`:
there is a cuspidal `π` of `GL₂(𝔸_E)` with `ρ̄_π ≅ ρ̄|_{G_E}`, of parallel weight `kS`, unramified
at every `v | p`. The parameter `kS` is the Serre weight `k(ρ̄)`, which is owned by
SerreWeightAndLevelOptimisation and is not defined here. A predicate on the existence of a
witness: it does not say that every modular witness has this weight. -/
def ResidualModularAlpha (ρ : Gal(Ω/K) →* GL (Fin 2) k) (p kS : ℕ)
    (E : IntermediateField K Ω) : Prop :=
  ∃ π : HilbertCuspRep E, IsAlphaWitness ρ p kS π

/-- `R22.5/kw-residual-modularity-beta`, hypothesis (β) of Khare–Wintenberger II §8.2 for
`ρ̄|_{G_E}`: there is a cuspidal `π` of `GL₂(𝔸_E)` with `ρ̄_π ≅ ρ̄|_{G_E}`, of parallel weight
two, with conductor exponent at most one at every `v | p`. -/
def ResidualModularBeta (ρ : Gal(Ω/K) →* GL (Fin 2) k) (p : ℕ)
    (E : IntermediateField K Ω) : Prop :=
  ∃ π : HilbertCuspRep E, IsBetaWitness ρ p π

variable {ρ : Gal(Ω/K) →* GL (Fin 2) k} {p kS : ℕ}

/-- (α) holds iff a cuspidal witness of weight `k(ρ̄)`, unramified at all `v | p`, with residual
representation `ρ̄` exists. -/
theorem residualModularAlpha_iff :
    ResidualModularAlpha ρ p kS E ↔
      ∃ π : HilbertCuspRep E,
        (∃ (ι : π.ResidualDatum p k) (g : GL (Fin 2) k),
          ∀ σ : E.fixingSubgroup, π.residualRep ι σ = g * ρ σ * g⁻¹) ∧
        (∀ w, π.weight w = kS) ∧
        ∀ v : HeightOneSpectrum (𝓞 E), (p : 𝓞 E) ∈ v.asIdeal → π.conductorExp v = 0 :=
  Iff.rfl

/-- A witness with the stated residual representation, weight and level gives (α). -/
theorem residualModularAlpha_of_witness (π : HilbertCuspRep E) (ι : π.ResidualDatum p k)
    (g : GL (Fin 2) k) (hres : ∀ σ : E.fixingSubgroup, π.residualRep ι σ = g * ρ σ * g⁻¹)
    (hwt : ∀ w, π.weight w = kS)
    (hcond : ∀ v : HeightOneSpectrum (𝓞 E), (p : 𝓞 E) ∈ v.asIdeal → π.conductorExp v = 0) :
    ResidualModularAlpha ρ p kS E :=
  ⟨π, ⟨ι, g, hres⟩, hwt, hcond⟩

/-- (β) holds iff a cuspidal `π` with residual representation `ρ̄`, weight two and local
conductor exponent at most one above `p` exists. -/
theorem residualModularBeta_iff :
    ResidualModularBeta ρ p E ↔
      ∃ π : HilbertCuspRep E,
        (∃ (ι : π.ResidualDatum p k) (g : GL (Fin 2) k),
          ∀ σ : E.fixingSubgroup, π.residualRep ι σ = g * ρ σ * g⁻¹) ∧
        (∀ w, π.weight w = 2) ∧
        ∀ v : HeightOneSpectrum (𝓞 E), (p : 𝓞 E) ∈ v.asIdeal → π.conductorExp v ≤ 1 :=
  Iff.rfl

/-- A `π` satisfying those three conditions gives (β). -/
theorem residualModularBeta_of_witness (π : HilbertCuspRep E) (ι : π.ResidualDatum p k)
    (g : GL (Fin 2) k) (hres : ∀ σ : E.fixingSubgroup, π.residualRep ι σ = g * ρ σ * g⁻¹)
    (hwt : ∀ w, π.weight w = 2)
    (hcond : ∀ v : HeightOneSpectrum (𝓞 E), (p : 𝓞 E) ∈ v.asIdeal → π.conductorExp v ≤ 1) :
    ResidualModularBeta ρ p E :=
  ⟨π, ⟨ι, g, hres⟩, hwt, hcond⟩

/-- Packet test `alpha_of_goodReduction`: a witness of weight two with good reduction above `p`
(for instance the automorphic representation of a modular elliptic curve with good reduction at
`p`) supplies (α) at `k(ρ̄) = 2`. Left out: the passage from the elliptic curve to `π`. -/
example (π : HilbertCuspRep E) (hres : IsResidualWitness ρ p π) (hwt : ∀ w, π.weight w = 2)
    (hgood : ∀ v : HeightOneSpectrum (𝓞 E), (p : 𝓞 E) ∈ v.asIdeal → π.conductorExp v = 0) :
    ResidualModularAlpha ρ p 2 E :=
  ⟨π, hres, hwt, hgood⟩

/-- Packet test `alpha_weight_must_match`: a `π` of parallel weight `k(ρ̄) + p − 1` is not itself
an α-witness, whatever its level, since its weight differs from `k(ρ̄)`. -/
example [NumberField K] [FiniteDimensional K E] (π : HilbertCuspRep E)
    (hp : 1 < p) (hwt : ∀ w, π.weight w = kS + p - 1) : ¬ IsAlphaWitness ρ p kS π := fun h => by
  have : NumberField E := NumberField.of_module_finite K E
  obtain ⟨w⟩ := (inferInstance : Nonempty (InfinitePlace E))
  have h1 := h.2.1 w
  have h2 := hwt w
  omega

/-- Packet test `steinberg_not_alpha`: a `π` with conductor exponent one at a place above `p` is
not an α-witness, while that component is allowed in a β-witness. This concerns the witness `π`,
not the existence of another α-witness. -/
example (π : HilbertCuspRep E) (v : HeightOneSpectrum (𝓞 E)) (hv : (p : 𝓞 E) ∈ v.asIdeal)
    (hst : π.conductorExp v = 1) : ¬ IsAlphaWitness ρ p kS π ∧ π.conductorExp v ≤ 1 :=
  ⟨fun h => by have := h.2.2 v hv; omega, hst.le⟩

/-- Packet test `beta_of_unramified_weight_two`: a weight-two witness unramified above `p` has
conductor exponent zero there, hence satisfies the local bound of (β). -/
example (π : HilbertCuspRep E) (h : IsAlphaWitness ρ p 2 π) : IsBetaWitness ρ p π :=
  ⟨h.1, h.2.1, fun v hv => by have := h.2.2 v hv; omega⟩

/-- Packet test `beta_allows_steinberg_witness`: a weight-two witness with conductor exponent one
at the places above `p` is a β-witness. -/
example (π : HilbertCuspRep E) (hres : IsResidualWitness ρ p π) (hwt : ∀ w, π.weight w = 2)
    (hst : ∀ v : HeightOneSpectrum (𝓞 E), (p : 𝓞 E) ∈ v.asIdeal → π.conductorExp v = 1) :
    IsBetaWitness ρ p π :=
  ⟨hres, hwt, fun v hv => (hst v hv).le⟩

/-- Packet test `conductor_two_not_beta_witness`: a `π` with conductor exponent two at a place
above `p` is not itself a β-witness; this does not preclude another witness. -/
example (π : HilbertCuspRep E) (v : HeightOneSpectrum (𝓞 E)) (hv : (p : 𝓞 E) ∈ v.asIdeal)
    (h2 : π.conductorExp v = 2) : ¬ IsBetaWitness ρ p π :=
  fun h => by have := h.2.2 v hv; omega

/-- `R22.1/alpha-beta-under-allowable-base-change`, (α): if `ρ̄|_{G_F}` satisfies (α) and `F'/F`
is an allowable base change, then `ρ̄|_{G_{F'}}` satisfies (α).

Left out: that the witness over `F'` is the base change of the witness over `F` (no base change
map of automorphic representations is imported here; it is owned by
GL2AutomorphicRepresentationsAndTransfer R17.4). -/
theorem residualModularAlpha_of_allowableBaseChange [NumberField K] [IsAlgClosure K Ω]
    [Finite k] [Fact p.Prime] [CharP k p] {F F' : IntermediateField K Ω}
    (hF : KW.StandingHypotheses ρ p F) (h : KW.AllowableBaseChange ρ p F F')
    (hα : ResidualModularAlpha ρ p kS F) : ResidualModularAlpha ρ p kS F' := sorry

/-- `R22.1/alpha-beta-under-allowable-base-change`, (β): if `ρ̄|_{G_F}` satisfies (β) and `F'/F`
is an allowable base change, then `ρ̄|_{G_{F'}}` satisfies (β). Left out: as for (α). -/
theorem residualModularBeta_of_allowableBaseChange [NumberField K] [IsAlgClosure K Ω]
    [Finite k] [Fact p.Prime] [CharP k p] {F F' : IntermediateField K Ω}
    (hF : KW.StandingHypotheses ρ p F) (h : KW.AllowableBaseChange ρ p F F')
    (hβ : ResidualModularBeta ρ p F) : ResidualModularBeta ρ p F' := sorry

/-- `R22.5/alpha-beta-from-modularity-over-q`. Let `ρ̄` be a representation of `G_ℚ` of S-type
(continuous, absolutely irreducible, odd) that is modular: `ρ̄ ≅ ρ̄_π` for some cuspidal `π` of
`GL₂(𝔸_ℚ)`, discrete series at infinity, of any weight and level. Normalise `2 ≤ k(ρ̄) ≤ p + 1`
if `p > 2`. Let `F` be totally real with a soluble tower over `ℚ`, unramified at `p`, with
`ρ̄|_{G_F}` absolutely irreducible. Then `ρ̄|_{G_F}` satisfies (β), and it satisfies (α) if
`p > 2` or `k(ρ̄) = 2`. Part (1) of the node, on the levels of the forms over `ℚ`, is the case
`F = ℚ`: weight `k(ρ̄)` at a level prime to `p`, and weight two at a level in which `p` has
exponent at most one.

Left out: that the normalisation `2 ≤ k(ρ̄) ≤ p + 1` is reached by a twist (it is a hypothesis
here), and the description of the levels by the groups `Γ₁(N)`. -/
theorem residualModular_of_modular {Ω : Type*} [Field Ω] [Algebra ℚ Ω] [IsAlgClosure ℚ Ω]
    {k : Type*} [Field k] [Finite k] {p : ℕ} [Fact p.Prime] [CharP k p]
    {ρ : Gal(Ω/ℚ) →* GL (Fin 2) k} (hcont : IsOpen (ρ.ker : Set Gal(Ω/ℚ)))
    (hodd : IsTotallyOdd ρ) (hirrQ : IsAbsIrreducibleSubgroup ρ.range)
    (hmod : ∃ π : HilbertCuspRep (⊥ : IntermediateField ℚ Ω), IsResidualWitness ρ p π)
    (hk : 2 < p → 2 ≤ serreWeight ρ p ∧ serreWeight ρ p ≤ p + 1)
    {F : IntermediateField ℚ Ω} (htower : KW.IsSolubleTower ⊥ F) (hreal : IsTotallyReal F)
    (hunr : UnramifiedAbove p ℚ F)
    (hirr : IsAbsIrreducibleSubgroup (Subgroup.map ρ F.fixingSubgroup)) :
    ResidualModularBeta ρ p F ∧
      (2 < p ∨ serreWeight ρ p = 2 → ResidualModularAlpha ρ p (serreWeight ρ p) F) := sorry

end ResidualModularity

/-- The signed prime, with natural subtraction/division in the exponent.
Only its arithmetic value is defined here; the quadratic-field theorem is not asserted. -/
def pStar (p : ℕ) : ℤ := (-1) ^ ((p - 1) / 2) * (p : ℤ)

theorem pStar_eq (p : ℕ) : pStar p = (-1) ^ ((p - 1) / 2) * (p : ℤ) := rfl

theorem pStar_natAbs (p : ℕ) : (pStar p).natAbs = p := by
  simp [pStar, Int.natAbs_mul, Int.natAbs_pow]

namespace SuggestedTest

/-- Regression for the sign and the explicit boundary convention. -/
example : pStar 3 = -3 := by norm_num [pStar] -- pStar_three
example : pStar 2 = 2 := by norm_num [pStar] -- pStar_two_boundary
example : pStar 5 = 5 := by norm_num [pStar] -- pStar_five
example : pStar 7 = -7 := by norm_num [pStar] -- pStar_not_always_positive

/-- The exact pinned simple-root input, not the predicate Polynomial.Splits. -/
example {R : Type*} [CommRing R] (I : Ideal R) [HenselianRing R I]
    (f : Polynomial R) (hf : f.Monic) (a₀ : R)
    (hroot : f.eval a₀ ∈ I)
    (hsimple : IsUnit (Ideal.Quotient.mk I (f.derivative.eval a₀))) :
    ∃ a : R, f.IsRoot a ∧ a - a₀ ∈ I :=
  HenselianRing.is_henselian f hf a₀ hroot hsimple

/-- The completeness-to-Henselian instance is present even though the name index omits instances. -/
example {R : Type*} [CommRing R] (I : Ideal R) [IsAdicComplete I R] :
    HenselianRing R I := inferInstance

/-- Derivative of the split quadratic at the selected root; distinctness is essential. -/
example {R : Type*} [CommRing R] (a b : R) : 2 * a - (a + b) = a - b := by ring

/-- A repeated root still exists; it is simple-root lifting that cannot be invoked. -/
example : (1 : ZMod 5) ^ 2 - 2 * 1 + 1 = 0 ∧ (2 * 1 - 2 : ZMod 5) = 0 := by decide

/-- Source issue E9: A W A⁻¹ = -W, since A² = 1.
Thus the subgroup {I,-I,W,-W} is invariant under both generators A and W,
although W is not in the original diagonal torus. This tests the faulty proof
step, not a counterexample to the Galois irreducibility theorem. -/
example :
    (!![1, 0; 0, -1] : Matrix (Fin 2) (Fin 2) (ZMod 3)) *
      !![0, 1; 1, 0] * !![1, 0; 0, -1] = -!![0, 1; 1, 0] := by decide

example : (!![1, 0; 0, -1] : Matrix (Fin 2) (Fin 2) (ZMod 3)) ^ 2 = 1 := by decide
example : (!![0, 1; 1, 0] : Matrix (Fin 2) (Fin 2) (ZMod 3)) ^ 2 = 1 := by decide
example : (!![0, 1; 1, 0] : Matrix (Fin 2) (Fin 2) (ZMod 3)) 0 1 ≠ 0 := by decide


/-- `R22.2/auxiliary-hecke-algebra`: the Hecke polynomial at `v ∈ Q` factors as `(X − A)(X − B)` with
`A + B = T_v`, `AB = N(v)ψ(π_v)`; the factorisation identity itself. -/
example {R : Type*} [CommRing R] (A B x : R) : (x - A) * (x - B) = x ^ 2 - (A + B) * x + A * B := by
  ring

/-- `R22.2/dyadic-twists-of-forms`: a character of order two squares to one, so `χ(Nm z) = 1` on
`(𝔸_F^∞)^×` whenever `Nm z = z²` there. -/
example {M : Type*} [CommGroup M] (χ z : M) (h : χ ^ 2 = 1) : (χ * z) ^ 2 = z ^ 2 := by
  rw [mul_pow, h, one_mul]

/-- `R22.3/patched-support`: the dimension count `1 + d + (h + j − d) = 1 + h + j` for the power
series ring over the local ring (with `d ≤ h + j`). -/
example (d h j : ℕ) (hd : d ≤ h + j) : 1 + d + (h + j - d) = 1 + h + j := by omega

/-- `R22.5/solvable-base-change-reduction`: `ℚ(√6) ⊗ ℚ_3 = ℚ_3(√−3)` because `6/(−3) = −2`
is a nonzero square modulo 3 and the local simple-root lift applies. The example
below only checks the residue calculation, not the tensor-product isomorphism. -/
example : IsSquare (-2 : ZMod 3) := ⟨1, by decide⟩

/-- `R22.6/dyadic-oddness`: `diag(1, −1)` has determinant `−1` (the lift is odd) but reduces to the
identity modulo 2. -/
example : (!![1, 0; 0, -1] : Matrix (Fin 2) (Fin 2) ℤ).det = -1 := by
  simp [Matrix.det_fin_two]

example : (!![1, 0; 0, -1] : Matrix (Fin 2) (Fin 2) ℤ).map (Int.cast : ℤ → ZMod 2) = 1 := by
  ext i j
  fin_cases i <;> fin_cases j <;> decide

/-- `R22.6/dyadic-power-series-isomorphism` (Lemma 9.5): removing the `t` torus directions from
`dim R′_∞ = h + j + t + 1` leaves `h + j + 1`. -/
example (h j t : ℕ) : h + j + t + 1 - t = h + j + 1 := by omega

/-- `R22.6/dyadic-patched-torsor`: `T[2](𝒪) ≅ (±1)^t` has `2^t` elements. -/
example (t : ℕ) : Fintype.card (Fin t → ZMod 2) = 2 ^ t := by
  simp [ZMod.card]

/-- `R22.6/hypothesis-h`: with `χ(c) = −1` and `det ρ(c) = −1`, the character `ψ = det ρ · χ⁻¹` is
even. -/
example {R : Type*} [CommRing R] (ψc : R) (h : (-1) * ψc = -1) : ψc = 1 := by
  linear_combination -h

/-- `R32.1/p-star`: `p* = (−1)^((p−1)/2) p` is `−3` at `p = 3`, so
`ℚ(√p*) = ℚ(√−3) = ℚ(ζ₃)`. -/
example : (-1 : ℤ) ^ ((3 - 1) / 2) * 3 = -3 := by norm_num

/-- `R32.1/p-star`: `p* ≡ 1 (mod 4)` for the odd primes `3, 5, 7, 11, 13`. -/
example : ∀ p ∈ ({3, 5, 7, 11, 13} : Finset ℕ), ((-1 : ℤ) ^ ((p - 1) / 2) * p) % 4 = 1 := by
  decide

/-- `R32.1/quadratic-cyclotomic-irreducibility`: for `p ≥ 5`, `p ∤ |S₄| = 24`, so `A₄` and `S₄`
have no element of order `p`. -/
example : ¬ (5 ∣ Fintype.card (Equiv.Perm (Fin 4))) := by
  rw [Fintype.card_perm, Fintype.card_fin]; decide

/-- `R32.1/non-solvable-residual-image`: `S₅` is not solvable; the dyadic hypothesis asks for such
an image. -/
example : ¬ Group.IsSolvable (Equiv.Perm (Fin 5)) := Equiv.Perm.not_isSolvable_fin_5

/-- `R32.1/hodge-tate-and-oddness-normalisation`: for odd `p`, `−1 ≠ 1` in `𝔽_p`, so `ρ̄` odd
forces `ρ` odd; at `p = 2`, `−1 = 1`. -/
example : (-1 : ZMod 3) ≠ 1 := by decide
example : (-1 : ZMod 2) = 1 := by decide
example (p : ℕ) [Fact (2 < p)] : (-1 : ZMod p) ≠ 1 := ZMod.neg_one_ne_one

/-- `R32.1/hodge-tate-and-oddness-normalisation`: Hodge–Tate weights `{a, b}` with `a < b`
twist to `{0, k − 1}` with `k = b − a + 1 ≥ 2`. -/
example (a b : ℤ) (h : a < b) : 2 ≤ (b - a) + 1 := by omega

/-- `R32.1/exceptional-local-cases`, `R32.5`: every nonzero element of `𝔽₃` squares to `1`, so
`ω² = 1` at `p = 3` and `χ̄₃^{−1} = χ̄₃`. -/
example : ∀ x : ZMod 3, x ≠ 0 → x ^ 2 = 1 := by decide

/-- `R32.2/kisin-multiplicity-criterion` (Gee–Kisin B.5): for a central `z`, `tr²/det` of `z·g′`
equals that of `g′`, so replacing `g′` by `gg′` leaves the left side of (2.2.2) unchanged. -/
example {K : Type*} [Field K] (z a b : K) (hz : z ≠ 0) :
    (z * a + z * b) ^ 2 / (z * a * (z * b)) = (a + b) ^ 2 / (a * b) := by
  rcases eq_or_ne a 0 with rfl | ha
  · simp
  rcases eq_or_ne b 0 with rfl | hb
  · simp
  field_simp

/-- `R32.2/kisin-multiplicity-criterion` (Gee–Kisin B.3): with `N(v) = 19 ≡ −1 (mod 5)`,
`ω(Frob_v)² = 1`, so `γ̄_v` and `γ̄_v ω` both fit an extension of `γ̄` by `γ̄(1)`. -/
example : ((19 : ZMod 5)) ^ 2 = 1 := by decide

/-- `R32.2/application-requirements`: in Paso 1, `w > 2k` with `k = 3` and `w = 7` avoids the
bad dihedral primes `2k − 3 = 3` and `2k − 1 = 5` of Lemma 1.14. -/
example : (7 : ℕ) ≠ 2 * 3 - 3 ∧ (7 : ℕ) ≠ 2 * 3 - 1 := by decide

/-- `R32.2/application-requirements`: `w > 2k ≥ 4` gives `w ≥ 5`, the range of Theorem 1.6. -/
example (w k : ℕ) (hk : 2 ≤ k) (hw : 2 * k < w) : 5 ≤ w := by omega

end SuggestedTest
end TauCeti.ModularityLifting

end

/-
Repair supplier contracts (/26): allowable-base-change-existence and
solvable-base-change-reduction import
PotentialModularityAndCompatibleSystems:R23.1/cht-soluble-prescribed-completions;
lemma-7-10-determinant-adjustment imports
PotentialModularityAndCompatibleSystems:R23.1/cht-character-extension, including
finite-order and p-primary refinements. CHT Lemmas 4.1.1–4.1.2, pp. 116–117.
Quadratic field prescription remains the weak-approximation clause of this file's
allowable-base-change-existence; unrestricted same-degree Grunwald–Wang is not used.
-/
