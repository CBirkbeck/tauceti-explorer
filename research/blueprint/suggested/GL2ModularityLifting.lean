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
import Mathlib.Logic.Relation
import Mathlib.RingTheory.Ideal.MinimalPrime.Basic
import Mathlib.RingTheory.Spectrum.Prime.RingHom
import Mathlib.RingTheory.Spectrum.Prime.Topology

/-!
# Suggested Lean forms: GL₂ modularity lifting

**Standard note.** This file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/GL2ModularityLifting.md` is definitive. These statements suggest
Lean forms so contributors and reviewers converge on names and signatures. Pinned baseline:
Mathlib `082e2d3`, Tau Ceti `f790474`. This file imports Mathlib only; no implementation of the
advanced arithmetic theorems is claimed. Proof and imported-carrier bodies may contain `sorry`.

The classical fragment uses namespace `TauCeti.ModularityLifting`; the modern component
fragment uses `TauCeti.GL2Lifting`, matching the part packets' API names. They share the
mathematical conventions in the reader, while retaining distinct names for distinct objects.
The supplier stand-ins, omitted hypotheses and unelaborated sketches are identified below.
Compilation checks the stated prototype signatures, not the omitted arithmetic contracts.

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
-- Gap recorded in the packet: k = p + 1 with k(ρbar) = 2 non-ordinary, and potentially
-- semistable, not potentially crystalline, not semistable over ℚ_p(μ_p).
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

/-!
## Modern component interfaces

The definitions below take actual component subsets, the potentially-nice point set, the
closure of ordinary arithmetic points and the trace map to an extension deformation ring.
Their arithmetic specialization awaits the named suppliers. `nice` in `panGoodComponent`
denotes the potentially-nice point set of Pan Definition 7.4.1; the ordinary seed-point set
is a separate argument. A reflexive chain still requires a seed.

The indexed omission manifest below records the remaining modern definitions, API names,
tests and results. Missing arithmetic conditions have no executable placeholder predicates.
-/

namespace TauCeti.GL2Lifting

section GoodComponents

variable {I X : Type*}

/-- Pan Definition 7.4.1 as seeded reachability on concrete component subsets.
The intended seed set is the closure of ordinary arithmetic points. A seed must also be nice;
reflexivity allows a one-component seeded chain, not an unseeded empty chain. -/
def panGoodComponent (components : I → Set X) (nice seed : Set X) (i : I) : Prop :=
  ∃ j : I, (∃ x : X, x ∈ nice ∧ x ∈ seed ∧ x ∈ components j) ∧
    Relation.ReflTransGen
      (fun a b : I => ∃ x : X, x ∈ nice ∧ x ∈ components a ∧ x ∈ components b) j i

theorem panGoodComponent_iff (components : I → Set X) (nice seed : Set X) (i : I) :
    panGoodComponent components nice seed i ↔
      ∃ j : I, (∃ x : X, x ∈ nice ∧ x ∈ seed ∧ x ∈ components j) ∧
        Relation.ReflTransGen
          (fun a b : I => ∃ x : X, x ∈ nice ∧ x ∈ components a ∧ x ∈ components b) j i := by
  sorry

theorem panGoodComponent_seed (components : I → Set X) (nice seed : Set X) (i : I)
    (x : X) (hn : x ∈ nice) (hs : x ∈ seed) (hc : x ∈ components i) :
    panGoodComponent components nice seed i := by
  sorry

theorem panGoodComponent_step (components : I → Set X) (nice seed : Set X) (i j : I)
    (hgood : panGoodComponent components nice seed i)
    (x : X) (hn : x ∈ nice) (hi : x ∈ components i) (hj : x ∈ components j) :
    panGoodComponent components nice seed j := by
  sorry

theorem panGoodComponent_mono (components : I → Set X) (nice nice' seed seed' : Set X)
    (hn : nice ⊆ nice') (hs : seed ⊆ seed') (i : I)
    (hgood : panGoodComponent components nice seed i) :
    panGoodComponent components nice' seed' i := by
  sorry

theorem panGoodComponent_congr (components components' : I → Set X)
    (nice nice' seed seed' : Set X) (hc : ∀ j, components j = components' j)
    (hn : nice = nice') (hs : seed = seed') (i : I) :
    panGoodComponent components nice seed i ↔ panGoodComponent components' nice' seed' i := by
  sorry

-- good_component_single_seed
example : panGoodComponent (fun _ : Unit => (Set.univ : Set Unit))
    Set.univ Set.univ () := by
  sorry

-- good_component_empty_seed: arbitrary adjacency still cannot create a seed.
example (components : I → Set X) (nice : Set X) (i : I) :
    ¬ panGoodComponent components nice ∅ i := by
  sorry

-- good_component_two_step_chain: C₀={0}, C₁={0,1}, C₂={1,2}.
example : ∀ i : Fin 3,
    panGoodComponent
      (fun j : Fin 3 => if j = 0 then ({0} : Set ℕ)
        else if j = 1 then {0, 1} else {1, 2})
      {0, 1} {0} i := by
  sorry

-- good_component_non_nice_intersection: the point 1 cannot carry an edge.
example :
    panGoodComponent (fun b : Bool => if b then ({1, 2} : Set ℕ) else {0, 1})
      {0} {0} false ∧
    ¬ panGoodComponent (fun b : Bool => if b then ({1, 2} : Set ℕ) else {0, 1})
      {0} {0} true := by
  sorry

end GoodComponents

section ExtensionComponents

variable {A B : Type*} [CommRing A] [CommRing B]

/-- The incidence construction in Pan Definition 7.4.21. Minimal primes of the source
index its irreducible components. Arithmetic uses the trace map Rᵖˢ → R_B.
The entire target spectrum is used, as in Pan's definition. -/
def panExtensionComponents (f : A →+* B) : Set (PrimeSpectrum A) :=
  {P | P.asIdeal ∈ minimalPrimes A ∧ P ∈ Set.range (PrimeSpectrum.comap f)}

theorem panExtensionComponents_mem_iff (f : A →+* B) (P : PrimeSpectrum A) :
    P ∈ panExtensionComponents f ↔
      P.asIdeal ∈ minimalPrimes A ∧ ∃ Q : PrimeSpectrum B, PrimeSpectrum.comap f Q = P := by
  sorry

theorem panExtensionComponents_minimal (f : A →+* B) (P : PrimeSpectrum A)
    (hP : P ∈ panExtensionComponents f) : P.asIdeal ∈ minimalPrimes A := by
  sorry

theorem panExtensionComponents_id :
    panExtensionComponents (RingHom.id A) = {P : PrimeSpectrum A | P.asIdeal ∈ minimalPrimes A} := by
  sorry

theorem panExtensionComponents_kernel_le (f : A →+* B) (P : PrimeSpectrum A)
    (hP : P ∈ panExtensionComponents f) : RingHom.ker f ≤ P.asIdeal := by
  sorry

theorem panExtensionComponents_comp_subset {C : Type*} [CommRing C]
    (f : A →+* B) (g : B →+* C) :
    panExtensionComponents (g.comp f) ⊆ panExtensionComponents f := by
  sorry

-- extension_components_identity: compatible with minimalPrimes.equivIrreducibleComponents.
example : panExtensionComponents (RingHom.id A) =
    {P : PrimeSpectrum A | P.asIdeal ∈ minimalPrimes A} := by
  sorry

-- extension_components_zero_target: the zero ring has no prime points.
example [Subsingleton B] (f : A →+* B) : panExtensionComponents f = ∅ := by
  sorry

-- extension_components_kernel_obstruction: stronger than the stated minimal-prime test.
example (f : A →+* B) (P : PrimeSpectrum A) (hker : ¬ RingHom.ker f ≤ P.asIdeal) :
    P ∉ panExtensionComponents f := by
  sorry

end ExtensionComponents

/-!
## Indexed omission manifest

The two remaining definitions need R04/IHG determinant-fixed pseudodeformation rings and their
prime-point representations, R31.3 actual completed Hecke quotients and normalization-lattice
reconstruction, and R01 residual/local/induced representations and finite coefficient extension.
The theorem nodes additionally need R06 local Hodge predicates, R19 eigenform attachment,
R21 ordinary lifting, R31 typed support/classicality and R17 Hilbert transfer, as specified by each
node's supplier requests. No guessed type names or weaker placeholder predicates are declared.

Every omitted item below is identified by the packet's exact node/API/test name and statement.
An omitted statement is a planning obligation, not an elaborated theorem with missing hypotheses.
The two concrete definitions above are fully present as signatures, ten lemma signatures and
seven examples; their *arithmetic specializations* remain subject to these suppliers.

### GL2ModularityLifting:R32.3/dyadic-de-rham-modularity-lifting

Let p = 2, E/ℚ₂ finite with ring 𝒪 and residue field k, and ρ : G_ℚ → GL₂(𝒪) continuous, irreducible, odd, unramified outside finitely many primes, with ρ|_{G_{ℚ₂}} de Rham of distinct Hodge–Tate weights. If ρ̄ is modular and has non-solvable image, then ρ is modular: up to a twist, ρ ≅ ρ_f for a cuspidal eigenform f (Tung, Theorem A). Before Tung, Paškūnas proved this over totally real F in which 2 splits completely, for ρ|_{G_{F_v}} potentially semistable with distinct Hodge–Tate weights and det ρ totally odd, under the extra local hypothesis (iv) ρ̄|_{G_{F_v}} ≇ (χ ∗; 0 χ) for every v | 2 (Theorem 1.1). Tung removes (iv), which was the only remaining local restriction at p = 2 (ω = 1 there), by proving that every component of the patched deformation ring lies in the support of the patched module (his Theorem B).

Hypothesis/convention: this is a de Rham theorem with arbitrary distinct Hodge–Tate weights; it is not the potentially Barsotti–Tate theorem of the classical proof (Kisin's (0.1), GL2ModularityLifting:R22.6/kisin-dyadic-bt-lifting), and a regular de Rham representation is not Barsotti–Tate after renaming its weights

Hypothesis/convention: residual modularity is a hypothesis; Tung notes that over ℚ it follows from Khare–Wintenberger and Kisin, but his proof does not use that (see R32.6/globalisation-dependency-audit)

Hypothesis/convention: non-solvable residual image replaces the cyclotomic irreducibility condition used for odd p

Hypothesis/convention: The dyadic statement is specified here; the current R32.1/lifting-statement-table defines only the odd-prime statement. The totally-real theorem uses the requested general-field nonsolvable-image preservation, rather than the Q-only R32.1 lemma.

Hypothesis/convention: Tung Theorem 8.0.1 combines an ordinary and a nonordinary component argument; Colmez finiteness and near faithfulness alone do not replace the ordinary input.

Prerequisite interfaces: GL2ModularityLifting:R32.3/totally-real-dyadic-lifting; PadicHodgeTheory:R06.3; ArithmeticGaloisRepresentations:R01.2.

### GL2ModularityLifting:R32.4/pan-residually-reducible-fontaine-mazur

Let p be odd and ρ : G_ℚ → GL₂(E), E/ℚ_p finite, continuous, irreducible, odd, unramified outside finitely many primes and potentially semistable at p, with ρ|_{G_{ℚ_p}} of distinct Hodge–Tate weights. Suppose ρ̄^{ss} ≅ χ̄₁ ⊕ χ̄₂ is a sum of two characters, and if p = 3 that χ̄₁χ̄₂^{−1}|_{G_{ℚ₃}} ≠ ω (the mod-3 cyclotomic character). Then ρ comes from a cuspidal eigenform up to twist (Pan, Theorem 1.0.2). When ρ|_{G_{ℚ_p}} is reducible (ordinary) and χ̄₁χ̄₂^{−1}|_{G_{ℚ_p}} ≠ 1 this is Skinner–Wiles; Pan supplies the missing ordinary case χ̄₁χ̄₂^{−1}|_{G_{ℚ_p}} = 1 (his §6) and the non-ordinary case (his Theorem 7.1.1).

Hypothesis/convention: irreducibility of ρ is kept: ρ̄ being a sum of characters does not make ρ a sum of characters

Hypothesis/convention: no residual modularity is assumed: residually reducible representations are handled with pseudo-representations

Hypothesis/convention: at p = 3 the case χ̄₁χ̄₂^{−1}|_{G_{ℚ₃}} = ω is excluded throughout the paper, for lack of p-adic local Langlands input (Pan's Theorems 3.4.5–3.4.6); Dieulefait–Pacetti quote the theorem only for p ≥ 5

Hypothesis/convention: For p≥5 this is the residually reducible lifting form used by transfer-residually-reducible; it does not need the current odd-only R32.1 statement table.

Prerequisite interfaces: GL2ModularityLifting:R32.4/nonordinary-hilbert-modularity; OrdinaryAutomorphicFormsAndModularityLifting:R21.5; ArithmeticGaloisRepresentations:R01.2; PadicHodgeTheory:R06.3.

### GL2ModularityLifting:R32.4/pan-residually-irreducible-fontaine-mazur

The usable lifting form is Pan Theorem 8.0.1 at F=ℚ: p odd, ρ continuous irreducible odd finitely ramified, ρ̄|G_ℚ(ζ_p) absolutely irreducible and modular, and ρ|G_ℚp absolutely irreducible regular de Rham. At p=3 exclude residual local extensions η by ηω in either orientation. Then ρ is modular. Pan Theorem 1.0.4 is a broader source consequence, combining earlier ordinary and residually dihedral cases and invoking full Serre modularity over ℚ through Remark 8.0.4; that unconditional consequence is not an input to the independent R33 proof.

Hypothesis/convention: Residual modularity is kept in the lifting statement.

Hypothesis/convention: This comparison node is outside the dependency cone of the modern residually reducible transfer; the source’s unconditional Theorem 1.0.4 is not exported as an independent Serre input.

Prerequisite interfaces: CompletedCohomologyAndLocalGlobalCompatibility:R31.5; CompletedCohomologyAndLocalGlobalCompatibility:R31.4; CompletedCohomologyAndLocalGlobalCompatibility:R31.6.

### GL2ModularityLifting:R32.5/p-three-residually-reducible-branch

Let ρ : G_ℚ → GL₂(ℚ̄₃) be continuous, irreducible, odd and finitely ramified with ρ̄^{ss} ≅ 1 ⊕ χ̄₃, ρ|_{I₃} ≅ (∗ ∗; 0 1) and det ρ = ψχ₃^{k−1} (k ≥ 2, ψ of finite order). Then ρ is modular of weight k (Dieulefait–Pacetti Theorem 1.7 = Skinner–Wiles at p = 3, OrdinaryAutomorphicFormsAndModularityLifting:R21.5/theorem-a-at-three). This branch is not a consequence of Pan's theorem: Dieulefait–Pacetti quote Pan only for p ≥ 5, and Pan's Theorem 1.0.2 at p = 3 excludes exactly the case χ̄₁χ̄₂^{−1}|_{G_{ℚ₃}} = ω, which is this one (χ̄₃|_{G_{ℚ₃}} = ω). Normalisation after twisting: if ρ̄^{ss} ≅ χ̄₁ ⊕ χ̄₂, choose β̄ among χ̄₁,χ̄₂ by the actual unramified ordinary quotient and twist ρ by its inverse Teichmüller lift so that ρ̄^{ss} ≅ 1 ⊕ χ with the trivial character on the unramified quotient; hypothesis (ii) is then read for the twisted ρ.

Hypothesis/convention: Skinner–Wiles' hypothesis (i) χ|_{D₃} ≠ 1 holds automatically for χ = χ̄₃, which is ramified at 3; Dieulefait–Pacetti print it as 'ρ|_{D₃} ≠ (1 0; 0 1)' (source issue OrdinaryAutomorphicFormsAndModularityLifting/E9)

Hypothesis/convention: The inertia-quotient condition is an explicit hypothesis of this theorem. The crystalline-to-ordinary criterion is used separately in crystalline-weights-two-four-completion.

Hypothesis/convention: Pan Theorem 1.0.2 includes odd p=3 but excludes local residual ratio ω; the existing R21.5/theorem-a-at-three already records this accurately.

Hypothesis/convention: ψ is of finite order, as stated in Skinner–Wiles. DP Theorem 1.7 does not repeat this qualification; source issue E1 records it.

Hypothesis/convention: The representation is defined over a finite extension E/Q_3, as required by Skinner–Wiles; the Q̄_3 notation denotes its coefficient embedding.

Prerequisite interfaces: OrdinaryAutomorphicFormsAndModularityLifting:R21.5/theorem-a-at-three; GL2ModularityLifting:R32.5/ordinary-character-normalisation.

### GL2ModularityLifting:R32.6/transfer-residually-irreducible-odd

Let p be odd and ρ, ρ′ : G_ℚ → GL₂(ℚ̄_p) continuous, odd, finitely ramified, with ρ̄ ≅ ρ̄′, ρ̄|_{G_{ℚ(√p*)}} absolutely irreducible, and ρ|_{G_{ℚ_p}}, ρ′|_{G_{ℚ_p}} de Rham with Hodge–Tate weights {0, k − 1}, {0, k′ − 1} (k, k′ > 1). Then ρ is modular if and only if ρ′ is. This is Dieulefait–Pacetti's Theorem 1.4 read as a transfer statement: if ρ is modular then ρ̄ = ρ̄′ is modular and Theorem 1.4 applies to ρ′. Its proof is R32.2/odd-prime-statement-over-q, for every odd p, 3 included: Kisin's Theorem (2.2.17), with Emerton's Theorem 3.3.22 removing his abelian hypothesis, and the Breuil–Mézard results of Paškūnas, Hu–Tan (p ≥ 5) and Tung (every p > 2) removing the local exclusion.

Hypothesis/convention: absolute irreducibility over ℚ(√p*) is equivalent to that over ℚ(ζ_p) (Dieulefait–Pacetti Lemma 1.13, R32.1/quadratic-cyclotomic-irreducibility); it is the hypothesis in the combined theorem as Tung states it

Hypothesis/convention: residual modularity is the only global modularity input; no Serre conjecture is used (R32.6/globalisation-dependency-audit)

Hypothesis/convention: Modularity is considered up to the specified global geometric character twist; with normalized weights {0,k−1}, the imported twist convention identifies the classical weight k.

Prerequisite interfaces: GL2ModularityLifting:R32.2/odd-prime-statement-over-q; GL2ModularityLifting:R32.1/quadratic-cyclotomic-irreducibility; ArithmeticGaloisRepresentations:R01.1; ArithmeticGaloisRepresentations:R01.2; PadicHodgeTheory:R06.3.

### GL2ModularityLifting:R32.6/transfer-dyadic

Let ρ, ρ′ : G_ℚ → GL₂(ℚ̄₂) be continuous, odd, finitely ramified, de Rham at 2 with distinct Hodge–Tate weights, with ρ̄ ≅ ρ̄′ of non-solvable image. Then ρ is modular if and only if ρ′ is (Dieulefait–Pacetti Theorem 1.5, from R32.3/dyadic-de-rham-modularity-lifting).

Hypothesis/convention: non-solvable residual image is needed at p = 2

Hypothesis/convention: irreducibility of ρ, ρ′ follows from that of ρ̄

Hypothesis/convention: Modularity is considered up to the specified global geometric character twist; with normalized weights {0,k−1}, the imported twist convention identifies the classical weight k.

Prerequisite interfaces: GL2ModularityLifting:R32.3/dyadic-de-rham-modularity-lifting; ArithmeticGaloisRepresentations:R01.1; ArithmeticGaloisRepresentations:R01.2; PadicHodgeTheory:R06.3.

### GL2ModularityLifting:R32.6/transfer-residually-reducible

Let p ≥ 5 (or p = 3 outside Pan's exclusion) and ρ : G_ℚ → GL₂(ℚ̄_p) continuous, irreducible, odd and finitely ramified, de Rham at p with distinct Hodge–Tate weights, with ρ̄^{ss} a sum of two characters. Then ρ is modular (Dieulefait–Pacetti Theorem 1.6, from Skinner–Wiles and R32.4/pan-residually-reducible-fontaine-mazur). In a congruence argument this is used when a member of an almost strictly compatible system is residually reducible at its own prime p, possibly with p in the ramification set: no residual modularity and no ordinarity is needed.

Hypothesis/convention: Dieulefait–Pacetti state p ≥ 5; Pan's theorem also covers p = 3 when χ̄₁χ̄₂^{−1}|_{G_{ℚ₃}} ≠ ω, and the p = 3 case with ω is R32.5/p-three-residually-reducible-branch

Hypothesis/convention: Modularity is considered up to the specified global geometric character twist; with normalized weights {0,k−1}, the imported twist convention identifies the classical weight k.

Prerequisite interfaces: GL2ModularityLifting:R32.4/pan-residually-reducible-fontaine-mazur; OrdinaryAutomorphicFormsAndModularityLifting:R21.5/theorem-a-over-q; ArithmeticGaloisRepresentations:R01.1; ArithmeticGaloisRepresentations:R01.2; PadicHodgeTheory:R06.3.

### GL2ModularityLifting:R32.6/de-rham-lifting-and-almost-strict-systems

For a DP-style rank-two almost strictly compatible system, with odd irreducible characteristic-zero members, all-member de Rham behavior and common weights {0,k−1}, k>1 explicitly supplied, the characteristic-p lifting step can use the modern de Rham transfer statements even when the system’s coefficient-prime WD comparison is absent. Select the branch by residual data: nonsolvable at p=2; absolutely irreducible cyclotomic restriction plus a known modular congruent lift at odd p; reducible at p≥5 (or nonexceptional Pan p=3); normalized ordinary p=3 under its exact extra conditions. Once a member is modular, good Frobenius polynomials identify all semisimple members with the modular-form system. A plain or historical KW almost-strict system alone does not supply the all-member de Rham premise.

Hypothesis/convention: DP Definition 1.10 clauses (4)–(5), not the bare historical KW almost-strict label, supply de Rham behavior at every coefficient prime.

Hypothesis/convention: The coefficient-change theorem consumes a system; it does not prove existence of a system through every regular de Rham lift. The supplier has recorded a gap in DP Theorem 1.11’s claimed general existence.

Prerequisite interfaces: PotentialModularityAndCompatibleSystems:R24.5/compatible-system; PotentialModularityAndCompatibleSystems:R24.5/rank-two-reducibility-independent-of-lambda; GL2ModularityLifting:R32.6/transfer-residually-irreducible-odd; GL2ModularityLifting:R32.6/transfer-dyadic; GL2ModularityLifting:R32.6/transfer-residually-reducible; GL2ModularityLifting:R32.6/transfer-ordinary-three; GL2ModularityLifting:R32.6/ramified-reducible-coefficient-prime; ArithmeticGaloisRepresentations:R01.5; AutomorphicGaloisRepresentations:R19.3; PotentialModularityAndCompatibleSystems:R24.5.

### GL2ModularityLifting:R32.6/globalisation-dependency-audit

Source-independence comparison for the transfer dependency cone: use the Q lifting forms with residual modularity explicitly retained, and Pan’s residually reducible theorem with no residual modularity. Do not use Pan 1.0.4’s unconditional residually irreducible consequence (Remark 8.0.4 invokes full Serre), or Emerton §7.3’s unconditional promodularity argument. Tung’s local Breuil–Mézard proof does additionally use suitable auxiliary globalizations: §4.3 Lemma 4.3.3 cites Calegari 3.2, Snowden 8.2.1, and the dyadic HBAV construction in KW II Theorem 6.1; Lemma 4.3.4 cites Paškūnas 3.29 and KW II Lemma 3.5. These have distinct roles from the global lift’s assumed residual modularity. The exact independent supplier proofs, including part 1’s Emerton–Paškūnas/BLGG and Gee inputs, remain the named requests and gap; this comparison is not a certificate that those uninspected proofs are independent.

Hypothesis/convention: not audited here: the global inputs of Tung's Breuil–Mézard theorem (the patched modules of [CEG+16], Emerton–Paškūnas' faithfulness and Barnet-Lamb–Gee–Geraghty's Theorem A.4.1), and Gee's Theorem 4.4.12 of 'Automorphic lifts of prescribed types', which Kisin's proof of (2.2.17) uses. These are requested from CompletedCohomologyAndLocalGlobalCompatibility R31.5–R31.6 and SerreWeightAndLevelOptimisation R20.6

Hypothesis/convention: The exact KW II local and patching inputs are named in the R31.6 request. Their independence from the full Serre endpoint remains an audit obligation in the first gap; this packet does not certify their uninspected proofs.

Prerequisite interfaces: CompletedCohomologyAndLocalGlobalCompatibility:R31.6; SerreWeightAndLevelOptimisation:R20.6.

### GL2ModularityLifting:R32.3/typed-component-specialisation

In Tung §§4–5, with a modular totally odd nonsolvable residual representation over a totally real F in which 2 splits completely, fixed determinant ψε, the specified Steinberg conditions away from 2, auxiliary place v₁, and a product σ of locally algebraic types, suppose the imported Theorem 8.0.1 gives support meeting every component of R∞(σ)[1/2]. Then Rˢ_ψ(σ) is finite over 𝒪 and M(σ)[1/2] is faithful over Rˢ_ψ(σ)[1/2]. Every characteristic-zero point of this global deformation problem, including the point of a prescribed lift of type σ, therefore occurs in algebraic quaternionic forms and is automorphic after Jacquet–Langlands.

Prerequisite interfaces: CompletedCohomologyAndLocalGlobalCompatibility:R31.5; CompletedCohomologyAndLocalGlobalCompatibility:R31.2; DeformationAndDerivedPatchingAlgebra:R03.6/nearly-faithful-iff-support-eq-univ; DeformationAndDerivedPatchingAlgebra:R03.6/nearly-faithful-quotient; GL2AutomorphicRepresentationsAndTransfer:R17.3.

### GL2ModularityLifting:R32.3/totally-real-dyadic-lifting

Let F be totally real with every F_v ≅ ℚ₂ for v|2. Let ρ:G_F→GL₂(𝒪) be continuous, finitely ramified, with modular totally odd residual representation of nonsolvable image, and potentially semistable with distinct Hodge–Tate weights at every v|2. Then ρ is attached, up to twist, to a Hilbert modular form. There is no local exclusion of extensions of a character by itself (Tung Theorem 8.0.3).

Prerequisite interfaces: GL2ModularityLifting:R32.3/typed-component-specialisation; GlobalGaloisDeformations:R04.4; CompletedCohomologyAndLocalGlobalCompatibility:R31.6; GL2AutomorphicRepresentationsAndTransfer:R17.4.

### GL2ModularityLifting:R32.4/nice-prime

Fix all data of Pan §4.1: p odd; F totally real of even degree with p completely split; S⊇Σ_p finite, p|N(v)−1 outside p; χ:G_F,S→𝒪× totally odd, unramified outside p with χ(Frob_v)≡1 for v∈S\Σ_p; p-power tame characters ξ_v; the definite quaternionic completed Hecke algebra T_m and R^{ps,{ξ_v}}↠T_m. A prime q of T_m is nice if p∈q, dim(T_m/q)=1, and there exists a lattice ρ(q)° over the normalization A of T_m/q in k(q) such that: its generic fibre is irreducible; its reduction is a nonsplit extension of the two residual characters; if ρ(q) is induced from G_L for a quadratic L/F, then L∩F(ζ_p)=F; and at every v∈S\Σ_p the lattice representation is the constant lift of its residual representation. A prime of R^{ps,{ξ_v}} is nice when it is the contraction of such a Hecke prime.

Hypothesis/convention: Retain Pan §4.1.2 Assumption 1: the ideal generated by ϖ and T_v−1−χ(Frob_v), v∉S, is an actual maximal ideal m of the completed Hecke algebra. Its central character is ψ=χε and the quaternion algebra is ramified exactly at the infinite places.

Prerequisite interfaces: GlobalGaloisDeformations:R04.1; GlobalGaloisDeformations:R04.2; CompletedCohomologyAndLocalGlobalCompatibility:R31.3; ArithmeticGaloisRepresentations:R01.1; IntegralHeckeAndGaloisDeterminants:IHG.1.

Omitted API `TauCeti.GL2Lifting.PanNicePrime.char_p_dimension`: A nice Hecke prime contains p and has quotient dimension one.

Omitted API `TauCeti.GL2Lifting.PanNicePrime.lattice`: Extract a normalization lattice with irreducible generic fibre, nonsplit reduction and the stated away-p restrictions.

Omitted API `TauCeti.GL2Lifting.PanNicePrime.is_proModular`: The contraction of a nice Hecke prime is pro-modular for Pan’s direct pseudodeformation-to-Hecke quotient from R31.3, equivalently its prime contains the kernel of that quotient.

Omitted API `TauCeti.GL2Lifting.PanNicePrime.dihedral_disjoint`: If the associated representation is induced from a quadratic L, then L∩F(ζ_p)=F.

Omitted API `TauCeti.GL2Lifting.PanNicePrime.mk`: In the stated setup, p∈q, quotient dimension one and existence of a normalization lattice with all four properties in the definition imply the predicate. For a pseudo-ring nice prime, also supply its Hecke prime and contraction equality.

Omitted API `TauCeti.GL2Lifting.PanNicePrime.iff`: The predicate is equivalent to p∈q, quotient dimension one and existence of a normalization lattice with all four properties in the definition. Hecke and pseudo-ring primes are distinguished; the latter has an existential contracted Hecke witness.

Omitted example `nice_prime_characteristic_zero_rejected` (non-example): A prime not containing p is not nice, even if it is a classical automorphic point.

Omitted example `nice_prime_split_lattice_rejected` (non-example): A proposed witness lattice with split residual reduction does not satisfy PanNicePrime.lattice; irreducible generic fibre alone does not validate that witness.

Omitted example `nice_prime_constant_away_p` (characterisation): With all other clauses satisfied, the away-p clause is equivalent to equality of ρ(q)°|G_Fv with the constant residual lift for every v∈S\Σ_p; finite image alone does not suffice.

### GL2ModularityLifting:R32.4/potentially-nice-prime

For Pan §7.1’s global determinant-fixed ring R^{ps} over a totally real abelian F split at p, a prime q is potentially nice in the sense of §7.2.4 if p∈q, dim(R^{ps}/q)=1, the associated semisimple representation ρ(q) is irreducible, and ρ(q)|G_Fv has finite image for every v∈S\Σ_p. This is a Galois condition: it does not assert Hecke occurrence, a nonsplit normalization lattice, or a constant away-p lift.

Prerequisite interfaces: GlobalGaloisDeformations:R04.2; IntegralHeckeAndGaloisDeterminants:IHG.1; ArithmeticGaloisRepresentations:R01.1.

Omitted API `TauCeti.GL2Lifting.PanPotentiallyNicePrime.char_p_dimension`: Extract p∈q and dim R^{ps}/q=1.

Omitted API `TauCeti.GL2Lifting.PanPotentiallyNicePrime.finite_away`: Each away-p local restriction has finite image.

Omitted API `TauCeti.GL2Lifting.PanPotentiallyNicePrime.of_nice`: A contracted Pan nice prime, in the same §7 global problem with its finite residual away-p lift, is potentially nice.

Omitted API `TauCeti.GL2Lifting.PanPotentiallyNicePrime.coefficient_extension`: For a finite unramified coefficient extension and a prime above q, the predicate is preserved when the generic representation remains irreducible.

Omitted API `TauCeti.GL2Lifting.PanPotentiallyNicePrime.mk`: In the stated setup, p∈q, quotient dimension one, irreducible associated representation and finite image at every away-p place imply the predicate.

Omitted API `TauCeti.GL2Lifting.PanPotentiallyNicePrime.iff`: The predicate is equivalent to p∈q, quotient dimension one, irreducible associated representation and finite image at every away-p place; no Hecke-image premise is added.

Omitted example `potentially_nice_reducible_rejected` (non-example): A dimension-one characteristic-p prime with a sum-of-characters generic representation is not potentially nice.

Omitted example `potentially_nice_no_away_places` (degenerate): When S=Σ_p, the finite-away-p clause is vacuous; the other three clauses remain necessary.

Omitted example `potentially_nice_not_proModular_by_definition` (characterisation): For fixed q and associated representation, changing the candidate Hecke quotient does not change the potentially-nice predicate; it changes whether q is a contracted nice Hecke prime.

### GL2ModularityLifting:R32.4/nice-prime-component-bridge

In Pan §4.1’s setup, let x be a maximal ideal of R^{ps,{ξ_v}}[1/p] such that ρ(x)|G_Fv is irreducible and de Rham with distinct Hodge–Tate weights for every v|p. If an irreducible component contains x and a nice prime q, and if p=3 the local residual ratio is not ω^{±1}, then ρ(x) is regular algebraic cuspidal automorphic over F (Corollary 4.1.8).

Prerequisite interfaces: GL2ModularityLifting:R32.4/nice-prime; CompletedCohomologyAndLocalGlobalCompatibility:R31.5; CompletedCohomologyAndLocalGlobalCompatibility:R31.4; GL2AutomorphicRepresentationsAndTransfer:R17.3; CompletedCohomologyAndLocalGlobalCompatibility:R31.3; PadicHodgeTheory:R06.2.

### GL2ModularityLifting:R32.4/large-component-at-regular-point

In Pan §7.1, let F be totally real abelian, p split, χ=det ρ totally odd, and ρ:G_F,S→GL₂(𝒪) irreducible with residual trace 1+χ̄. Let x be the prime of its trace in the determinant-fixed R^{ps}. Then dim (R^{ps})_x≥2[F:ℚ], and there is a component C through x with dim C≥1+2[F:ℚ]. After enlarging coefficients, inertia away from p on the generic point of C is a sum of two finite-order characters.

Hypothesis/convention: For the component used in this proof, retain Pan §7.1.1–7.1.2: χ is de Rham at the p-places, the odd residual ratio χ̄ extends to G_Q, and the solvable field/coefficient enlargement has been performed with d=[F:Q]>|S\Σ_p|+2. These are the setup hypotheses used by the downstream ordinary-density and trace-cut arguments.

Prerequisite interfaces: GlobalGaloisDeformations:R04.2; GlobalGaloisDeformations:R04.3; ArithmeticGaloisDuality:R02.6.

### GL2ModularityLifting:R32.4/generic-ordinary-intersection

With C as in large-component-at-regular-point and χ̄|G_Fv≠1,ω^{±1} at every v|p, form C^{ord}=C∩Spec R^{ps,ord} using the imported local reducibility quotients. Then dim C^{ord}≥1+[F:ℚ]. There is a component C₁^{ord} finite and surjective over Spec Λ_F, of that dimension, whose irreducible regular de Rham ordinary points are dense and modular.

Hypothesis/convention: The degree enlargement of §7.1.2 ensures [F:ℚ]>|S\Σ_p|+2.

Hypothesis/convention: The local ratio hypothesis excludes both cyclotomic ratios; that branch has a two-generator ideal and a separate proof.

Prerequisite interfaces: GL2ModularityLifting:R32.4/large-component-at-regular-point; LocalGaloisDeformationRings:R08.6; OrdinaryAutomorphicFormsAndModularityLifting:R21.4; OrdinaryAutomorphicFormsAndModularityLifting:R21.5.

### GL2ModularityLifting:R32.4/scalar-ordinary-intersection

With the same global C, if χ̄|G_Fv=1 at every v|p, use R₁^{ps,ord}, which remembers a chosen lifting ψ_{v,1} of the trivial local character with T|G_Fv=ψ_{v,1}+χψ_{v,1}^{−1} and ψ_{v,1}-ordinarity. Its pullback C^{ord,1} has dimension at least 1+[F:ℚ], and a component finite surjective over Λ_F with dense modular regular de Rham points, as in Pan Lemma 7.3.1 and Corollary 7.3.2.

Prerequisite interfaces: GL2ModularityLifting:R32.4/large-component-at-regular-point; OrdinaryAutomorphicFormsAndModularityLifting:R21.3; OrdinaryAutomorphicFormsAndModularityLifting:R21.4; OrdinaryAutomorphicFormsAndModularityLifting:R21.5; LocalGaloisDeformationRings:R08.6.

### GL2ModularityLifting:R32.4/potentially-nice-base-change

In Pan §7.1–§7.2, suppose C^{ord} (or its chosen-character cover) has a component C₁ finite surjective over Λ_F, with dense irreducible modular regular de Rham points, and [F:ℚ]>|S\Σ_p|+2. Then C₁ contains a potentially nice q. A finite totally real solvable F₁/F, split at p and of even degree, can be chosen so that the contractions x′,q′ of x,q to the determinant-fixed problem R^{ps,1}_{F₁} lie on one component, q′ is nice, and that problem has a nonzero completed Hecke quotient.

Prerequisite interfaces: GL2ModularityLifting:R32.4/potentially-nice-prime; GL2ModularityLifting:R32.4/nice-prime; GL2ModularityLifting:R32.4/large-component-at-regular-point; GlobalGaloisDeformations:R04.4; GL2AutomorphicRepresentationsAndTransfer:R17.4; CompletedCohomologyAndLocalGlobalCompatibility:R31.3; GlobalGaloisDeformations:R04.3.

### GL2ModularityLifting:R32.4/good-component

Pan Definition 7.4.1: a component C of Spec R^{ps} is good if a finite chain C₁,…,C_t=C has potentially nice q₁,…,q_t, with q_i∈C_{i−1}∩C_i for i≥2, and q₁∈C₁∩closure(A^{ord}), where A^{ord} is the set of irreducible regular de Rham ordinary primes of Corollary 7.2.3. A chain of length one is allowed. Equivalently, on the component index set, take the reflexive transitive closure of adjacency by a potentially nice common point, starting at a component containing such a point in closure(A^{ord}). The prototype takes concrete component subsets, a potentially-nice point set and the seed-point set; its intended specialization is this spectrum.

Prerequisite interfaces: GL2ModularityLifting:R32.4/potentially-nice-prime; mathlib:Relation.ReflTransGen; mathlib:Relation.ReflTransGen.trans; mathlib:Relation.reflTransGen_iff_eq; OrdinaryAutomorphicFormsAndModularityLifting:R21.4.

Concrete definition, API signatures and examples: see the executable sections above.

### GL2ModularityLifting:R32.4/extension-components

Pan Definition 7.4.21: for a nonzero extension class B∈Ext¹_{E[G_F,S]}(ψ₁,ψ₂), let R_B be the imported determinant-fixed characteristic-zero deformation ring of the nonsplit extension ρ_B. Under its trace map f_B:R^{ps}→R_B, define Z_B to be the components of Spec R^{ps} whose generic points lie in the image of Spec R_B→Spec R^{ps}. For a general ring map f:A→B the underlying incidence construction is the set of prime points P with P.asIdeal∈minimalPrimes A and P in range(Spec f). The arithmetic specialization uses f_B; scalar-equivalent extension classes have the same Z_B under the deformation comparison.

Prerequisite interfaces: GlobalGaloisDeformations:R04.2; IntegralHeckeAndGaloisDeterminants:IHG.1; mathlib:PrimeSpectrum.comap; mathlib:minimalPrimes; mathlib:minimalPrimes.equivIrreducibleComponents.

Concrete definition, API signatures and examples: see the executable sections above.

### GL2ModularityLifting:R32.4/extension-component-control

In Pan §7.4.14–7.4.20, p≥5, F is abelian totally real, split at p, d=[F:ℚ]>|S\Σ_p|+2, and ψ₁/ψ₂=εθ with θ finite order and εθ totally odd. For nonzero B, the determinant-fixed R_B satisfies dim R_B^{red}≤d+1, every component has dimension ≥2d, and its connectedness dimension is ≥2d−1. If Q∉Spec R_B^{red}, then dim R^{ps}/(Q∩R^{ps})≥1+dim R_B/Q; minimal primes of R_B contract to minimal primes of R^{ps}. Here R_B^{red} denotes the reduced closed reducible locus, not the reduced ring R_B modulo its nilradical.

Prerequisite interfaces: GL2ModularityLifting:R32.4/extension-components; GlobalGaloisDeformations:R04.2; GlobalGaloisDeformations:R04.3; ArithmeticGaloisDuality:R02.6; DeformationAndDerivedPatchingAlgebra:R03.6.

### GL2ModularityLifting:R32.4/extension-component-propagation

Under extension-component-control’s hypotheses, for each nonzero B, if one component in Z_B is good then all components in Z_B are good (Pan Corollary 7.4.22).

Hypothesis/convention: The degree is enlarged sufficiently for the strict dimension inequalities of the proof; they are not asserted for d=1.

Prerequisite interfaces: GL2ModularityLifting:R32.4/extension-component-control; GL2ModularityLifting:R32.4/good-component; GL2ModularityLifting:R32.4/potentially-nice-prime; GL2ModularityLifting:R32.4/potentially-nice-base-change; GlobalGaloisDeformations:R04.3.

### GL2ModularityLifting:R32.4/cyclotomic-component-connectedness

In Pan §7.4, p≥5 and after the coefficient, twist and degree enlargement of §7.1.2, suppose χ̄|G_Fv=ω at every v|p, with C the large component through the given irreducible regular de Rham point. Then C is good (Proposition 7.4.3). The inverse-cyclotomic orientation is obtained by relabelling and twisting; the p=3 cyclotomic case is excluded.

Prerequisite interfaces: GL2ModularityLifting:R32.4/large-component-at-regular-point; GL2ModularityLifting:R32.4/good-component; GL2ModularityLifting:R32.4/generic-ordinary-intersection; GL2ModularityLifting:R32.4/potentially-nice-base-change; GL2ModularityLifting:R32.4/extension-components; GL2ModularityLifting:R32.4/extension-component-control; GL2ModularityLifting:R32.4/extension-component-propagation; LocalGaloisDeformationRings:R08.6; GlobalGaloisDeformations:R04.2; GlobalGaloisDeformations:R04.3; IntegralHeckeAndGaloisDeterminants:IHG.1; OrdinaryAutomorphicFormsAndModularityLifting:R21.4; OrdinaryAutomorphicFormsAndModularityLifting:R21.5; DeformationAndDerivedPatchingAlgebra:R03.6.

### GL2ModularityLifting:R32.4/nonordinary-hilbert-modularity

Let p>2, F/ℚ abelian totally real with p completely split, and ρ:G_F→GL₂(𝒪) continuous irreducible and finitely ramified. Assume ρ̄^{ss}=χ̄₁⊕χ̄₂, χ̄₁/χ̄₂ extends to G_ℚ and takes value −1 at every complex conjugation. At every v|p, require ρ|G_Fv irreducible de Rham with distinct Hodge–Tate weights, and when p=3 require the local residual ratio not ω^{±1}. Then ρ is a twist of a Hilbert modular representation (Pan Theorem 7.1.1).

Prerequisite interfaces: GL2ModularityLifting:R32.4/large-component-at-regular-point; GL2ModularityLifting:R32.4/generic-ordinary-intersection; GL2ModularityLifting:R32.4/scalar-ordinary-intersection; GL2ModularityLifting:R32.4/potentially-nice-base-change; GL2ModularityLifting:R32.4/good-component; GL2ModularityLifting:R32.4/cyclotomic-component-connectedness; GL2ModularityLifting:R32.4/nice-prime-component-bridge; ArithmeticGaloisRepresentations:R01.1; GL2AutomorphicRepresentationsAndTransfer:R17.4; GlobalGaloisDeformations:R04.4.

### GL2ModularityLifting:R32.5/ordinary-character-normalisation

Let ρ be a continuous irreducible odd finitely ramified 3-adic representation with an ordinary local quotient β unramified at 3, residual characters ᾱ,β̄ globally with β̄ restricting to the reduction of that quotient, and determinant ψε^{k−1} with ψ finite order and integer k≥2. Let η be the Teichmüller lift of the global character β̄ and twist by η^{−1}. Then the residual characters become ᾱβ̄^{−1},1, the local quotient remains unramified (hence trivial on inertia), det(ρ⊗η^{−1})=(ψη^{−2})ε^{k−1}, and the Hodge–Tate weights and oddness are unchanged. If ᾱβ̄^{−1}=ω₃ globally, this is exactly the imported Skinner–Wiles p=3 interface; otherwise a nontrivial local ratio is sufficient for its more general distinguished theorem.

Prerequisite interfaces: ArithmeticGaloisRepresentations:R01.1; ArithmeticGaloisRepresentations:R01.2; OrdinaryAutomorphicFormsAndModularityLifting:R21.5/theorem-a-over-q; OrdinaryAutomorphicFormsAndModularityLifting:R21.5/theorem-a-at-three.

### GL2ModularityLifting:R32.5/crystalline-weights-two-four-completion

Let ρ:G_ℚ→GL₂(E), E/ℚ₃ finite, be irreducible, odd, continuous, finitely ramified and crystalline at 3 with Hodge–Tate weights {0,k−1}, k∈{2,4}. If its residual semisimplification is a sum of two global characters, then ρ is modular of weight k. In the level-one branch of DP, normalization has residual characters 1,ω₃; without level one the general distinguished Skinner–Wiles theorem still applies after quotient-character normalization.

Prerequisite interfaces: GL2ModularityLifting:R32.5/ordinary-character-normalisation; OrdinaryAutomorphicFormsAndModularityLifting:R21.5/crystalline-reducible-reduction-is-ordinary; OrdinaryAutomorphicFormsAndModularityLifting:R21.5/theorem-a-over-q; ArithmeticGaloisRepresentations:R01.2; GL2ModularityLifting:R32.5/p-three-residually-reducible-branch.

### GL2ModularityLifting:R32.6/ramified-reducible-coefficient-prime

Let R be a rank-two system over ℚ in the DP Definition 1.10 sense, weight k>1, whose members are odd, semisimple and finitely ramified. Let λ|p with p in the ramification set S, p≥5, and suppose ρ_λ is irreducible in characteristic zero while ρ̄_λ^{ss} is a sum of two characters. Then ρ_λ is modular by Pan, without any comparison of WD(ρ_λ|G_ℚp) with the system parameter at p, and its good Frobenius polynomials identify the system with the modular system of that eigenform. The same conclusion at p=3 requires the nonexceptional Pan ratio, or the explicitly normalized ordinary hypotheses of R32.5. Irreducibility and oddness are checked hypotheses, not consequences of bare weak compatibility.

Hypothesis/convention: The all-member de Rham and common regular Hodge–Tate-weight clauses of DP Definition 1.10 are explicit extra data on the R24.5 compatible-system carrier. The historical KW almost-strict definition alone does not contain them.

Prerequisite interfaces: PotentialModularityAndCompatibleSystems:R24.5/compatible-system; GL2ModularityLifting:R32.6/transfer-residually-reducible; GL2ModularityLifting:R32.5/p-three-residually-reducible-branch; PadicHodgeTheory:R06.3; ArithmeticGaloisRepresentations:R01.5; AutomorphicGaloisRepresentations:R19.3; PotentialModularityAndCompatibleSystems:R24.5.

### GL2ModularityLifting:R32.6/transfer-ordinary-three

Let ρ,ρ′ be continuous irreducible odd finitely ramified 3-adic representations. Suppose each, after a specified finite-order quotient-character normalization, has residual semisimplification 1⊕ω₃, is of inertia shape (∗ ∗;0 1), and has determinant finite order times ε^{k−1} for its own integer k≥2. Then each is modular, hence modularity is equivalent for the two lifts. Neither identical weights nor identical inertial types are required. Congruence alone does not imply the ordinary hypotheses on the second lift.

Prerequisite interfaces: GL2ModularityLifting:R32.5/ordinary-character-normalisation; GL2ModularityLifting:R32.5/p-three-residually-reducible-branch; ArithmeticGaloisRepresentations:R01.1.

-/

end TauCeti.GL2Lifting
