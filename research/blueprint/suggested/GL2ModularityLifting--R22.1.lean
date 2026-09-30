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

/-!
# Suggested Lean forms: GL₂ modularity lifting, R22.1–R22.6 and R32.1–R32.2 (GL2ModularityLifting, part R22.1)

**Standard note.** This file is not the roadmap and it is not exhaustive. The roadmap document
(`GL2ModularityLifting`) is definitive. The statements below suggest Lean forms, so that
contributors and reviewers converge on names and signatures. Nothing here claims to be
formalised.

Fix revision: Codex codex-5ebb6f, 30 September 2026, Refs #5142. Independent REV-FIX is pending.
No existing compiled build was found at the pinned commits, so this revision was not compiled.
The historical review's compilation claim applies to its old active fragment only.

Pinned baseline: Mathlib `082e2d3`, Tau Ceti `f790474`. This file imports Mathlib only; the
quaternionic forms and Hecke algebras (HilbertModularVarietiesAndShimuraCurves R18.3/R18.6),
Galois representations over Hecke algebras (AutomorphicGaloisRepresentations R19.6) and the
global deformation rings (GlobalGaloisDeformations R04.4–R04.6) are recorded in the comment
block below, not elaborated.

## Review status: incomplete typed interface

Independent review REV-GL2ModularityLifting--R22.1 returns needs_changes.
The sketches below are NOT Lean declarations: their supplier types do not yet exist here.
They do not satisfy the packet/API/test bijection of PROTOCOL section 13. Do not replace
missing mathematics by arbitrary propositions to make these sketches elaborate. The active
pStar definition and arithmetic/matrix regressions below are only the explicitly checked fragment.

The packet now separates residual alpha/beta, strong residual modularity and the three pBT
lifting results, dyadic torsor/presentation/regularity/faithfulness, the four statement predicates,
Hodge--Tate normalisation/weight recovery/oddness, and the corrected graded-piece bound.
The new names still require the actual supplier types before their signatures can be written.

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
-- R22.5/kw-residual-modularity
-- Stable R22.5 IDs, now owned by parent R22.1: these existential definitions precede §8.
-- Their carrier comes directly from R19.2, not from MinimalLevelData or its prescribed witness.
-- (α): π unramified above p, of weight k(ρbar); (β): π of conductor dividing v above p, weight 2
def ResidualModularAlpha (ρbar : GaloisRep F 𝔽 2) : Prop
def ResidualModularBeta (ρbar : GaloisRep F 𝔽 2) : Prop
-- R22.1/allowable-base-change: field data, not an assumed modular lift or R = T.
structure AllowableBaseChange (ρbar : GaloisRep F 𝔽 2) where
  extension : NumberFieldExtension F
  totallyReal : IsTotallyReal extension.field
  solvable : IsSolvable extension.galoisClosureGroup
  evenDegree : Even extension.degree
  unramifiedAtP : extension.UnramifiedAbove p
  splitWhenLocalIrreducible : AbsIrred (ρbar.restrict Dp) → extension.SplitAbove p
  image_eq : (ρbar.restrict extension.field).image = ρbar.image
  cyclotomic_irreducible : AbsIrred (ρbar.restrict (extension.field⟮ζ_p⟯))
-- The missing early field/character supplier is proposed R23.1:soluble-extensions, NOT all R23.1.
-- R22.1/lemma-8-1-residual-field-choice has the field conclusion only.
-- The next paragraph of KW II §8.1 SUPPOSES ψ given; no existence of ψ is asserted by that lemma.
-- R22.1/determinant-character-kinds: overlapping predicates on actual idele class characters.
def IsDeterminantKindI (ψ : ArithmeticHeckeCharacter F 𝒪) : Prop :=
  ∀ u : UnitsAtP F, ψ u = localNorm u ^ kindIExponent (serreWeight ρbar)
def IsDeterminantKindII (ψ : ArithmeticHeckeCharacter F 𝒪) : Prop :=
  ∀ u : UnitsAtP F, ψ u = teichmuller u ^ kindIIExponent (serreWeight ρbar)
def IsDeterminantKindIII (ψ : ArithmeticHeckeCharacter F 𝒪) : Prop :=
  serreWeight ρbar = 2 ∧ ∀ u : UnitsAtP F, ψ u = localNorm u ^ kindIIIExponent p
-- R22.1/lemma-7-10-determinant-adjustment: the dyadic character and field construction
-- requires the missing early CHT supplier. A finite 2-primary group need not have square roots.
-- R22.1/theorem-8-2-minimal-modular-lifts: full hypotheses and simultaneous cases in the reader.
theorem minimal_modular_lifts (hF : KWInitialField ρbar F) (ψ : KWGivenDeterminant ρbar F)
    (hα : p ≠ 2 ∨ serreWeight ρbar = 2 → ResidualModularAlpha ρbar)
    (hβ : ResidualModularBeta ρbar) (π : KWSelectedAlphaOrBetaWitness ρbar ψ)
    (Σ : KWSteinbergSubset π) (hΣ : KWContainsRequiredPPlaces π Σ) :
    ∃ bc : AllowableBaseChange ρbar, Nonempty (KWMinimalModularWitness bc ψ Σ)
-- KWMinimalModularWitness is output data for the precise cases on p.71, not an input assertion.
-- R22.1/lemma-8-3-weight-two-to-p-plus-one iterates the R18.3 per-place injection;
-- its extra weight-p+1-at-residual-weight-2 branch is not used in KW II.
-- R22.1/prescribed-level-raising-step applies R18.3 algebraic level raising and R19.4 compatibility.
-- R22.1/theorem-8-4-prescribed-modular-lifts, then used to construct MinimalLevelData.
theorem prescribed_modular_lift (hF : KWInitialField ρbar F) (ψ : KWGivenDeterminant ρbar F)
    (hα : p ≠ 2 ∨ serreWeight ρbar = 2 → ResidualModularAlpha ρbar)
    (hβ : ResidualModularBeta ρbar) (localData : KWCompatibleLocalLifts ρbar ψ) :
    ∃ bc : AllowableBaseChange ρbar,
      ∃ π : CuspidalHilbertRepresentation bc.extension.field,
        LiftsResidual π (ρbar.restrict bc.extension.field) ∧
        FitsRestrictedLocalData π localData bc ∧ det π.galoisRep = ψ.restrict bc * cyclotomic p
-- In type (C), residual weight 2, and in the dyadic weight-4 branch, do not promise split at p.
-- All types above are unelaborated owner sketches: no opaque/axiom/Prop placeholder implements them.
-- R22.5/kw-odd-prime-lifting (KW II Theorem 9.7, p > 2)
theorem kw_lifting_odd (hp : 2 < p) (hF : UnramifiedAt F p)
    (hirr : AbsIrred (ρbar.restrict (F⟮ζ_p⟯)))
    (hα : ResidualModularAlpha ρbar) (hβ : ResidualModularBeta ρbar)
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

namespace TauCeti.ModularityLifting

namespace KW

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

end KW

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
