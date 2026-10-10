import Mathlib.RingTheory.Perfectoid.BDeRham
import Mathlib.RingTheory.Perfectoid.FontaineTheta
import Mathlib.RingTheory.Perfectoid.Untilt
import Mathlib.RingTheory.AdicCompletion.Algebra
import Mathlib.RingTheory.AdicCompletion.Completeness
import Mathlib.RingTheory.AdicCompletion.Functoriality
import Mathlib.RingTheory.WittVector.Frobenius
import Mathlib.RingTheory.WittVector.Compare
import Mathlib.RingTheory.WittVector.Teichmuller
import Mathlib.RingTheory.WittVector.Truncated
import Mathlib.RingTheory.Length
import Mathlib.RingTheory.LocalRing.ResidueField.Basic
import Mathlib.RingTheory.DiscreteValuationRing.Basic
import Mathlib.RingTheory.Valuation.ValuationRing
import Mathlib.RingTheory.Flat.Basic
import Mathlib.RingTheory.RingHom.Flat
import Mathlib.RingTheory.Kaehler.Basic
import Mathlib.RingTheory.Smooth.Basic
import Mathlib.RingTheory.FinitePresentation
import Mathlib.RingTheory.PowerSeries.Basic
import Mathlib.RingTheory.MvPowerSeries.Basic
import Mathlib.RingTheory.Localization.Away.Basic
import Mathlib.RingTheory.Localization.FractionRing
import Mathlib.Algebra.Module.Torsion.Basic
import Mathlib.Algebra.Module.LocalizedModule.Basic
import Mathlib.Algebra.MonoidAlgebra.Defs
import Mathlib.Algebra.Polynomial.Eval.Defs
import Mathlib.Algebra.Category.ModuleCat.Abelian
import Mathlib.Algebra.Category.ModuleCat.ChangeOfRings
import Mathlib.Algebra.Category.ModuleCat.Monoidal.Basic
import Mathlib.Algebra.Category.Ring.Basic
import Mathlib.Algebra.Homology.DerivedCategory.Basic
import Mathlib.Algebra.Homology.DerivedCategory.HomologySequence
import Mathlib.Algebra.Homology.DerivedCategory.SingleTriangle
import Mathlib.AlgebraicGeometry.Morphisms.Proper
import Mathlib.AlgebraicGeometry.Morphisms.Smooth
import Mathlib.AlgebraicGeometry.AlgebraicCycle.Basic
import Mathlib.AlgebraicGeometry.EllipticCurve.Affine.Point
import Mathlib.LinearAlgebra.Dimension.Finrank
import Mathlib.LinearAlgebra.Dual.Defs
import Mathlib.LinearAlgebra.FreeModule.Basic
import Mathlib.LinearAlgebra.ExteriorPower.Basic
import Mathlib.NumberTheory.Padics.PadicIntegers
import Mathlib.RepresentationTheory.Basic
import Mathlib.FieldTheory.IsAlgClosed.AlgebraicClosure
import Mathlib.Data.Rat.Defs
import Mathlib.Basic.Real.Basic
import Mathlib.NumberTheory.Cyclotomic.CyclotomicCharacter
import Mathlib.CategoryTheory.Sites.Grothendieck
import Mathlib.Algebra.Polynomial.Derivative
import Mathlib.Tactic.NormNum
import Mathlib.Tactic.Ring
import Mathlib.Tactic.FieldSimp
import Mathlib.Tactic.Push

/-!
# Cohomology comparisons: representative target signatures

`README.md` is the definitive roadmap. This file records definitions, API statements,
checks and representative theorem signatures expressible in the pinned APIs; it is
not exhaustive. It uses one fixed primitive root system to trivialize the Tate lines in trace and class
signatures. It fixes theta versus Frobenius-twisted specialization, full embedding
ideal completion, contravariant cohomology maps, decreasing tensor filtrations and
balanced semilinear period operators. The mathematical meanings of the geometric and enhanced interface definitions are
specified in README.md and by the named supplier roadmaps; their admitted bodies are
proposed signatures, rather than implemented supplier imports. An ordinary derived-category signature
records only the underlying comparison; filtered or coherent enhancements are stated
in README.md. Every `sorry` denotes mathematics to construct or prove.
-/

set_option autoImplicit false
set_option linter.unusedVariables false
set_option linter.unusedSectionVars false

noncomputable section

namespace TauCetiRoadmap.CohomologyComparisons

open CategoryTheory CategoryTheory.Limits

attribute [local instance] HasDerivedCategory.standard

universe u

/-! ## Shared vocabulary: derived and semilinear base change (owner `EnhancedDerivedSheaves:E4`) -/

section Shared

variable {R : Type*} {S : Type u} {T : Type u} [CommRing R] [CommRing S] [CommRing T]

/-- Derived base change `− ⊗^L_R S : D(R) ⥤ D(S)` along a ring map (owner
`EnhancedDerivedSheaves:E4`). -/
def derivedBaseChange (f : R →+* S) :
    DerivedCategory (ModuleCat.{u} R) ⥤ DerivedCategory (ModuleCat.{u} S) := sorry

/-- Derived `I`-completed base change `(− ⊗^L_R S)^∧_I` (owner `EnhancedDerivedSheaves:E4`;
derived completion as in `DerivedDeRhamCohomology:DD.1`). -/
def completedBaseChange (f : R →+* S) (I : Ideal S) :
    DerivedCategory (ModuleCat.{u} R) ⥤ DerivedCategory (ModuleCat.{u} S) := sorry

/-- For `g ∘ f = h`, the completion map
`K ⊗^L_R T = (K ⊗^L_R S) ⊗^L_S T → (K ⊗̂^L_R S) ⊗^L_S T` (owner E4). -/
def completionComparison (f : R →+* S) (I : Ideal S) (g : S →+* T) (h : R →+* T)
    (hgf : g.comp f = h) :
    derivedBaseChange.{u} h ⟶ completedBaseChange.{u} f I ⋙ derivedBaseChange.{u} g := sorry

/-- Derived base change along a composite (owner E4). -/
def derivedBaseChangeComp (f : R →+* S) (g : S →+* T) :
    derivedBaseChange.{u} f ⋙ derivedBaseChange.{u} g ≅ derivedBaseChange.{u} (g.comp f) := sorry

/-- For `f ∘ σR = σS ∘ f` and a linearised Frobenius `φ : σR^* K → K`, the linearised Frobenius
`σS^* (K ⊗̂^L_R S) → K ⊗̂^L_R S` of the completed base change (owner E4). -/
def completedBaseChangeFrobenius {R : Type u} [CommRing R] (f : R →+* S) (I : Ideal S)
    (σR : R →+* R) (σS : S →+* S) (hf : f.comp σR = σS.comp f)
    (K : DerivedCategory (ModuleCat.{u} R)) (φ : (derivedBaseChange.{u} σR).obj K ⟶ K) :
    (derivedBaseChange.{u} σS).obj ((completedBaseChange.{u} f I).obj K) ⟶
      (completedBaseChange.{u} f I).obj K := sorry

/-- The `i`-th cohomology module of a complex. -/
abbrev H (K : DerivedCategory (ModuleCat.{u} R)) (i : ℤ) : ModuleCat.{u} R :=
  (DerivedCategory.homologyFunctor (ModuleCat.{u} R) i).obj K

/-- The map induced on `i`-th cohomology. -/
abbrev Hmap {K L : DerivedCategory (ModuleCat.{u} R)} (φ : K ⟶ L) (i : ℤ) : H K i ⟶ H L i :=
  (DerivedCategory.homologyFunctor (ModuleCat.{u} R) i).map φ

/-- Extension of scalars `S ⊗_R M` of a module. -/
abbrev bc (f : R →+* S) (M : ModuleCat.{u} R) : ModuleCat.{u} S :=
  (ModuleCat.extendScalars f).obj M

/-- The canonical map `S ⊗_R H^i(K) → H^i(K ⊗^L_R S)` (owner E4). -/
def baseChangeHomologyMap (f : R →+* S) (K : DerivedCategory (ModuleCat.{u} R)) (i : ℤ) :
    bc f (H K i) ⟶ H ((derivedBaseChange.{u} f).obj K) i := sorry

/-- `m ↦ 1 ⊗ m`. -/
def bcUnit (f : R →+* S) (M : ModuleCat.{u} R) : M →+ bc f M := sorry

/-- For `g ∘ f = f'`, the map `S ⊗_R M → T ⊗_R M`, `s ⊗ m ↦ g s ⊗ m` (owner E4). -/
def bcMap (f : R →+* S) (f' : R →+* T) (g : S →+* T) (hg : g.comp f = f')
    (M : ModuleCat.{u} R) : bc f M →+ bc f' M := sorry

/-- For `g ∘ f = h`, the associativity isomorphism `T ⊗_R M ≅ T ⊗_S (S ⊗_R M)` (Mathlib's
`ModuleCat.extendScalarsComp` when the three rings share a universe). -/
def bcAssoc (f : R →+* S) (g : S →+* T) (h : R →+* T) (hgf : g.comp f = h)
    (M : ModuleCat.{u} R) : bc h M ≅ bc g (bc f M) := sorry

/-- For `f ∘ σR = σS ∘ f` and a `σR`-semilinear `φ`, the `σS`-semilinear extension
`s ⊗ m ↦ σS s ⊗ φ m` (owner E4). -/
def semilinearExtend (f : R →+* S) (σR : R →+* R) (σS : S →+* S) (hf : f.comp σR = σS.comp f)
    (M : ModuleCat.{u} R) (φ : M →ₛₗ[σR] M) : bc f M →ₛₗ[σS] bc f M := sorry

/-- The extension `s ⊗ m ↦ N_S s ⊗ m + s ⊗ N_M m` of a monodromy operator (owner
`PadicHodgeTheory:R06.1`). -/
def derivationExtend (f : R →+* S) (NS : S →+ S)
    (hLeibniz : ∀ s t, NS (s * t) = s * NS t + t * NS s)
    (hConstants : ∀ r, NS (f r) = 0) (M : ModuleCat.{u} R) (NM : M →ₗ[R] M) :
    bc f M →+ bc f M := sorry

/-- For a group acting on `S` by ring automorphisms fixing `f(R)` and `R`-linearly on `M`, the
diagonal semilinear action `g (s ⊗ m) = σ_g s ⊗ ρ_g m` on `S ⊗_R M` (owner R06.1). -/
def galoisExtend {G : Type*} [Group G] (f : R →+* S) (σ : G →* RingAut S)
    (hσ : ∀ g, (σ g).toRingHom.comp f = f) (M : ModuleCat.{u} R) (ρ : Representation R G M) :
    G →* AddMonoid.End (bc f M) := sorry

/-- The `S`-bilinear extension of an `R`-bilinear map (owner E4). -/
def bilinearExtend (f : R →+* S) {M N P : ModuleCat.{u} R} (μ : M →ₗ[R] N →ₗ[R] P) :
    bc f M →ₗ[S] bc f N →ₗ[S] bc f P := sorry

/-- The action on `i`-th cohomology of an action on a complex. -/
def Hrep {G : Type*} [Group G] {K : DerivedCategory (ModuleCat.{u} R)} (ρ : G →* Aut K)
    (i : ℤ) : Representation R G (H K i) where
  toFun g := (Hmap (ρ g).hom i).hom
  map_one' := sorry
  map_mul' := sorry

/-- The fixed points of an additive action. -/
def fixedPoints {G M : Type*} [Monoid G] [AddCommGroup M] (act : G →* AddMonoid.End M) :
    AddSubgroup M where
  carrier := {x | ∀ g, act g x = x}
  add_mem' := sorry
  zero_mem' := sorry
  neg_mem' := sorry

/-- `length_R ((M_tor) / a^n)`, the length of the torsion submodule modulo `a ^ n`. -/
def torsionLength (R : Type*) [CommRing R] (M : Type*) [AddCommGroup M] [Module R M] (a : R)
    (n : ℕ) : ℕ∞ :=
  Module.length R (↥(Submodule.torsion R M) ⧸
    ((Ideal.span {a}) ^ n • ⊤ : Submodule R ↥(Submodule.torsion R M)))

/-- A perfect complex: quasi-isomorphic to a bounded complex of finite projective modules. -/
def IsPerfectComplex {R : Type u} [CommRing R] (K : DerivedCategory (ModuleCat.{u} R)) : Prop :=
  ∃ (L : CochainComplex (ModuleCat.{u} R) ℤ) (a b : ℤ),
    (∀ n, Module.Projective R (L.X n) ∧ Module.Finite R (L.X n)) ∧
    (∀ n, n < a ∨ b < n → IsZero (L.X n)) ∧ Nonempty (DerivedCategory.Q.obj L ≅ K)

end Shared

/-! ## Layer 0: coefficient maps and normalization -/

/-- `O` is the ring of integers `O_C` of a complete algebraically closed nonarchimedean
extension `C` of `ℚ_p`: a valuation ring (with `IsDomain O`) of rank one and characteristic zero
in which every monic polynomial of positive degree has a root (so `Frac O` is algebraically
closed). `p`-adic completeness and `p ∈ 𝔪` are the instances `IsAdicComplete (span {p}) O` and
`Fact ¬IsUnit (p : O)` that Mathlib's `fontaineTheta` uses. -/
class IsIntegersOfC (O : Type u) [CommRing O] : Prop where
  valuationRing : ∀ x y : O, x ∣ y ∨ y ∣ x
  rankOne : ∀ x y : O, x ≠ 0 → ¬ IsUnit y → ∃ n : ℕ, y ^ n ∈ Ideal.span {x}
  charZero : CharZero O
  monic_root : ∀ f : Polynomial O, f.Monic → 0 < f.natDegree → ∃ x, f.IsRoot x

/-- `O_K → O` exhibits `O = O_C` as the ring of integers of a completed algebraic closure of the
fraction field `K` of the complete discrete valuation ring `O_K` of mixed characteristic
`(0, p)` with perfect residue field `k`. -/
class IsCompletedAlgClosureOf (OK : Type u) [CommRing OK] [IsLocalRing OK] (O : Type u)
    [CommRing O] [Algebra OK O] (p : ℕ) : Prop where
  injective : Function.Injective (algebraMap OK O)
  complete : IsAdicComplete (IsLocalRing.maximalIdeal OK) OK
  p_mem : (p : OK) ∈ IsLocalRing.maximalIdeal OK
  perfect_residue : Function.Bijective (fun x : IsLocalRing.ResidueField OK => x ^ p)
  dense : ∀ (x : O) (n : ℕ), ∃ y : O, IsIntegral OK y ∧ x - y ∈ Ideal.span {(p : O) ^ n}

/-- `A_inf = W(O^♭)`. -/
abbrev Ainf (O : Type u) [CommRing O] (p : ℕ) [Fact p.Prime] : Type u :=
  WittVector p (PreTilt O p)

/-- `W(k)` for the residue field `k` of a local ring. -/
abbrev residueWitt (R : Type u) [CommRing R] [IsLocalRing R] (p : ℕ) [Fact p.Prime] : Type u :=
  WittVector p (IsLocalRing.ResidueField R)

/-- `C = O[1/p]`. -/
abbrev Cfield (O : Type u) [CommRing O] (p : ℕ) : Type u := Localization.Away (p : O)

/-- `F̂^{nr} = W(k̄)[1/p]` for the residue field `k̄` of `O = O_C`. The HK modules below
are first extended from `F^{nr}` to this completion; tensor associativity then gives their
`B_st` comparison. Smooth-vector descent over the original `F^{nr}` is not encoded here. -/
abbrev Fnr (O : Type u) [CommRing O] [IsLocalRing O] (p : ℕ) [Fact p.Prime] : Type u :=
  Localization.Away (p : residueWitt O p)

/-- `A_cris` of `O` (owner `CrystallineCohomology:CR.0`). -/
def Acris (O : Type u) [CommRing O] (p : ℕ) [Fact p.Prime] : Type u := sorry
instance (O : Type u) [CommRing O] (p : ℕ) [Fact p.Prime] : CommRing (Acris O p) := sorry

/-- `B_cris = A_cris[1/μ]` (owner `PadicHodgeTheory:R06.1`; BMS1 Definition 3.22). -/
def Bcris (O : Type u) [CommRing O] (p : ℕ) [Fact p.Prime] : Type u := sorry
instance (O : Type u) [CommRing O] (p : ℕ) [Fact p.Prime] : CommRing (Bcris O p) := sorry

/-- `B_st` (owner `PadicHodgeTheory:R06.1`). -/
def Bst (O : Type u) [CommRing O] (p : ℕ) [Fact p.Prime] : Type u := sorry
instance (O : Type u) [CommRing O] (p : ℕ) [Fact p.Prime] : CommRing (Bst O p) := sorry

section OC

variable (O : Type u) [CommRing O] [IsDomain O] [IsLocalRing O] (p : ℕ) [Fact p.Prime]
  [Fact ¬IsUnit (p : O)] [IsAdicComplete (Ideal.span {(p : O)}) O]

instance : CommRing (BDeRham O p) := by unfold BDeRham; infer_instance
instance : Algebra (BDeRhamPlus O p) (BDeRham O p) := by unfold BDeRham; infer_instance

/-- `O^♭ → k`: the zeroth coordinate followed by `O/p → k`. -/
def residueOfTilt : PreTilt O p →+* IsLocalRing.ResidueField O :=
  (Ideal.Quotient.factor ((Ideal.span_singleton_le_iff_mem _).2
    ((IsLocalRing.mem_maximalIdeal _).2 (mem_nonunits_iff.2 Fact.out)))).comp
    (PreTilt.coeff 0 : PreTilt O p →+* ModP O p)

/-- The Witt reduction `w : A_inf → W(k)`. -/
def wittReduction : Ainf O p →+* residueWitt O p := WittVector.map (residueOfTilt O p)

/-- The Witt vector Frobenius `φ` of `A_inf`, an automorphism since `O^♭` is perfect. -/
def ainfFrobenius : Ainf O p ≃+* Ainf O p := WittVector.frobeniusEquiv (p := p) (PreTilt O p)

/-- `θ̃ = θ ∘ φ⁻¹`. -/
def fontaineThetaTilde : Ainf O p →+* O :=
  (WittVector.fontaineTheta O p).comp (ainfFrobenius O p).symm.toRingHom

/-- `ε^{1/p}` for `ε ∈ O^♭`. -/
def epsRoot (ε : PreTilt O p) : PreTilt O p := (frobeniusEquiv (PreTilt O p) p).symm ε

/-- `ε = (1, ζ_p, ζ_{p^2}, …)` is a compatible system of primitive `p`-power roots of unity. -/
def IsCompatibleRootsOfUnity (ε : PreTilt O p) : Prop :=
  PreTilt.untilt ε = 1 ∧ PreTilt.untilt (epsRoot O p ε) ≠ 1

/-- `μ = [ε] - 1`. -/
def muOf (ε : PreTilt O p) : Ainf O p := WittVector.teichmuller p ε - 1

/-- `ξ = μ / φ⁻¹(μ) = ∑_{i < p} [ε^{1/p}]^i`. -/
def xiOf (ε : PreTilt O p) : Ainf O p :=
  ∑ i ∈ Finset.range p, WittVector.teichmuller p (epsRoot O p ε) ^ i

/-- `A_inf → A_cris` (owner `CrystallineCohomology:CR.0`). -/
def ainfToAcris : Ainf O p →+* Acris O p := sorry
/-- The Frobenius of `A_cris` (owner CR.0). -/
def acrisFrobenius : Acris O p →+* Acris O p := sorry
/-- `θ : A_cris → O` (owner CR.0). -/
def acrisTheta : Acris O p →+* O := sorry
/-- `A_cris → B_dR⁺` (owner CR.0). -/
def acrisToBdRPlus : Acris O p →+* BDeRhamPlus O p := sorry
/-- `A_cris → B_cris` (owner `PadicHodgeTheory:R06.1`). -/
def acrisToBcris : Acris O p →+* Bcris O p := sorry
/-- The Frobenius of `B_cris` (owner R06.1). -/
def bcrisFrobenius : Bcris O p →+* Bcris O p := sorry
/-- `B_cris → B_dR` (owner R06.1). -/
def bcrisToBdR : Bcris O p →+* BDeRham O p := sorry
/-- `B_cris → B_st` (owner R06.1). -/
def bcrisToBst : Bcris O p →+* Bst O p := sorry
/-- The Frobenius of `B_st` (owner R06.1). -/
def bstFrobenius : Bst O p →+* Bst O p := sorry
/-- The monodromy `N` of `B_st`, with the convention `N = -d/du` of `PadicHodgeTheory:R06.1`
(owner R06.1). -/
def bstMonodromy : Bst O p →+ Bst O p := sorry
/-- `F̂^{nr} → B_st` (owner R06.1). -/
def fnrToBst : Fnr O p →+* Bst O p := sorry
/-- `t = log [ε] ∈ A_cris` (owner R06.1). -/
def tPeriod (ε : PreTilt O p) : Acris O p := sorry

/-- The canonical map `A_inf → A_inf[1/p] → B_dR⁺` of Mathlib's completion. -/
def ainfToBdRPlus : Ainf O p →+* BDeRhamPlus O p :=
  (algebraMap (Localization.Away (p : Ainf O p))
    (AdicCompletion (RingHom.ker (fontaineThetaInvertP O p))
      (Localization.Away (p : Ainf O p)))).comp
    (algebraMap (Ainf O p) (Localization.Away (p : Ainf O p)))

/-- `θ : B_dR⁺ → C`, induced by `θ[1/p]` on the completion (the completion quotient of Mathlib's
`BDeRham.lean`). -/
def bdrTheta : BDeRhamPlus O p →+* Cfield O p :=
  (RingHom.kerLift (fontaineThetaInvertP O p)).comp
    (AdicCompletion.evalOneₐ (RingHom.ker (fontaineThetaInvertP O p))).toRingHom

/-- `B_dR⁺ → B_dR`. -/
def bdrPlusToBdR : BDeRhamPlus O p →+* BDeRham O p := algebraMap _ _

/-- `ℤ_p = W(𝔽_p) → W(O^♭)`. -/
def zpToAinf : ℤ_[p] →+* Ainf O p :=
  (WittVector.map (ZMod.castHom (dvd_refl p) (PreTilt O p))).comp
    (WittVector.equiv p).symm.toRingHom

/-- `ℤ_p → A_cris`. -/
def zpToAcris : ℤ_[p] →+* Acris O p := (ainfToAcris O p).comp (zpToAinf O p)
/-- `ℤ_p → B_cris`. -/
def zpToBcris : ℤ_[p] →+* Bcris O p := (acrisToBcris O p).comp (zpToAcris O p)
/-- `ℤ_p → B_st`. -/
def zpToBst : ℤ_[p] →+* Bst O p := (bcrisToBst O p).comp (zpToBcris O p)
/-- `ℤ_p → B_dR⁺`. -/
def zpToBdRPlus : ℤ_[p] →+* BDeRhamPlus O p := (ainfToBdRPlus O p).comp (zpToAinf O p)
/-- `ℤ_p → B_dR`. -/
def zpToBdR : ℤ_[p] →+* BDeRham O p := (bdrPlusToBdR O p).comp (zpToBdRPlus O p)
/-- `ℤ_p → C`. -/
def zpToC : ℤ_[p] →+* Cfield O p := (bdrTheta O p).comp (zpToBdRPlus O p)
/-- `ℚ_p → B_st` (owner R06.1). -/
def qpToBst : ℚ_[p] →+* Bst O p := sorry

/-- Leibniz rule for the period-ring monodromy (owner R06.1). -/
theorem bstMonodromy_leibniz (s t : Bst O p) :
    bstMonodromy O p (s * t) = s * bstMonodromy O p t + t * bstMonodromy O p s := by
  sorry

/-- Monodromy kills the unramified coefficient field (owner R06.1). -/
theorem bstMonodromy_fnr (r : Fnr O p) : bstMonodromy O p (fnrToBst O p r) = 0 := by
  sorry

/-- Monodromy kills the rational étale coefficients (owner R06.1). -/
theorem bstMonodromy_qp (r : ℚ_[p]) : bstMonodromy O p (qpToBst O p r) = 0 := by
  sorry

/-- Monodromy kills the integral étale coefficients (owner R06.1). -/
theorem bstMonodromy_zp (r : ℤ_[p]) : bstMonodromy O p (zpToBst O p r) = 0 := by
  sorry
/-- `ℚ_p → B_dR` (owner R06.1). -/
def qpToBdR : ℚ_[p] →+* BDeRham O p := sorry
/-- `A_inf → B_dR`. -/
def ainfToBdR : Ainf O p →+* BDeRham O p := (bdrPlusToBdR O p).comp (ainfToBdRPlus O p)
/-- `A_cris → B_dR`. -/
def acrisToBdR : Acris O p →+* BDeRham O p := (bdrPlusToBdR O p).comp (acrisToBdRPlus O p)
/-- `A_inf → A_inf[1/μ]`. -/
def ainfToMu (ε : PreTilt O p) : Ainf O p →+* Localization.Away (muOf O p ε) := algebraMap _ _
/-- `ℤ_p → A_inf[1/μ]`. -/
def zpToMu (ε : PreTilt O p) : ℤ_[p] →+* Localization.Away (muOf O p ε) :=
  (ainfToMu O p ε).comp (zpToAinf O p)
/-- `A_inf[1/μ] → B_dR` (`μ` becomes a unit in `B_dR`). -/
def muToBdR (ε : PreTilt O p) (hμ : IsUnit (ainfToBdR O p (muOf O p ε))) : Localization.Away (muOf O p ε) →+* BDeRham O p :=
  IsLocalization.Away.lift (muOf O p ε) (g := ainfToBdR O p) hμ
/-- A primitive compatible cyclotomic system has nonzero `μ`, whose image is invertible
in `B_dR` (BMS1 Example 3.16 and Definition 3.22). -/
theorem mu_unit (ε : PreTilt O p) (hε : IsCompatibleRootsOfUnity O p ε)
    [IsIntegersOfC O] : IsUnit (ainfToBdR O p (muOf O p ε)) := by
  sorry

/-- `ξ ∈ B_dR⁺`. -/
def xiBdR (ε : PreTilt O p) : BDeRhamPlus O p := ainfToBdRPlus O p (xiOf O p ε)

/-- The action of `Aut(O)` on `A_cris` by functoriality (owner R06.1). -/
def autAcris : (O ≃+* O) →* RingAut (Acris O p) := sorry
/-- The action of `Aut(O)` on `B_cris` (owner R06.1). -/
def autBcris : (O ≃+* O) →* RingAut (Bcris O p) := sorry
/-- The action of `Aut(O)` on `B_st` (owner R06.1). -/
def autBst : (O ≃+* O) →* RingAut (Bst O p) := sorry
/-- The action of `Aut(O)` on `B_dR⁺` (owner R06.1). -/
def autBdRPlus : (O ≃+* O) →* RingAut (BDeRhamPlus O p) := sorry
/-- The action of `Aut(O)` on `B_dR` (owner R06.1). -/
def autBdR : (O ≃+* O) →* RingAut (BDeRham O p) := sorry
/-- The action of `Aut(O)` on `C = O[1/p]` (owner R06.1). -/
def autC : (O ≃+* O) →* RingAut (Cfield O p) := sorry

theorem autBcris_zp (g : O ≃+* O) : (autBcris O p g).toRingHom.comp (zpToBcris O p) = zpToBcris O p := by
  sorry
theorem autBst_zp (g : O ≃+* O) : (autBst O p g).toRingHom.comp (zpToBst O p) = zpToBst O p := by
  sorry
theorem autBdR_zp (g : O ≃+* O) : (autBdR O p g).toRingHom.comp (zpToBdR O p) = zpToBdR O p := by
  sorry
theorem autBst_qp (g : O ≃+* O) : (autBst O p g).toRingHom.comp (qpToBst O p) = qpToBst O p := by
  sorry
theorem autBdR_qp (g : O ≃+* O) : (autBdR O p g).toRingHom.comp (qpToBdR O p) = qpToBdR O p := by
  sorry

theorem wittReduction_frobenius :
    (wittReduction O p).comp (ainfFrobenius O p).toRingHom =
      (WittVector.frobenius : residueWitt O p →+* residueWitt O p).comp (wittReduction O p) := by
  sorry
theorem ainfToAcris_frobenius :
    (ainfToAcris O p).comp (ainfFrobenius O p).toRingHom =
      (acrisFrobenius O p).comp (ainfToAcris O p) := by
  sorry
theorem acrisTheta_comp : (acrisTheta O p).comp (ainfToAcris O p) = WittVector.fontaineTheta O p := by
  sorry
theorem acrisToBdR_comp : (acrisToBdR O p).comp (ainfToAcris O p) = ainfToBdR O p := by
  sorry
theorem muToBdR_comp (ε : PreTilt O p) (hμ : IsUnit (ainfToBdR O p (muOf O p ε))) : (muToBdR O p ε hμ).comp (ainfToMu O p ε) = ainfToBdR O p := by
  sorry
theorem muToBdR_zp (ε : PreTilt O p) (hμ : IsUnit (ainfToBdR O p (muOf O p ε))) : (muToBdR O p ε hμ).comp (zpToMu O p ε) = zpToBdR O p := by
  sorry

/-- The constant root system has zero cyclotomic denominator. -/
example : muOf O p (1 : PreTilt O p) = 0 := by
  simp [muOf]

end OC

/-- `G_K`, realised as the `O_K`-algebra automorphisms of `O = O_C` (every automorphism of `C`
over `K` is continuous and preserves `O_C`). -/
abbrev GK (O OK : Type u) [CommRing O] [CommRing OK] [Algebra OK O] : Type u := O ≃ₐ[OK] O

/-- `K = O_K[1/p]`, the fraction field of `O_K`. -/
abbrev Kfield (OK : Type u) [CommRing OK] (p : ℕ) : Type u := Localization.Away (p : OK)

section DVBase

variable (O : Type u) [CommRing O] [IsDomain O] [IsLocalRing O] (p : ℕ) [Fact p.Prime]
  [Fact ¬IsUnit (p : O)] [IsAdicComplete (Ideal.span {(p : O)}) O]
  (OK : Type u) [CommRing OK] [IsDomain OK] [IsDiscreteValuationRing OK] [Algebra OK O]
  [IsLocalHom (algebraMap OK O)]

/-- `G_K → Aut(O)`. -/
def galoisToAut : (O ≃ₐ[OK] O) →* (O ≃+* O) where
  toFun := AlgEquiv.toRingEquiv
  map_one' := rfl
  map_mul' _ _ := rfl

/-- `k → k̄`, the map of residue fields. -/
def residueFieldMap : IsLocalRing.ResidueField OK →+* IsLocalRing.ResidueField O :=
  IsLocalRing.ResidueField.map (algebraMap OK O)

/-- `K → C` (an element of `O_K \ 0` is a unit of `C`). -/
def kToC : Kfield OK p →+* Cfield O p :=
  IsLocalization.Away.lift (p : OK) (g := (algebraMap O (Cfield O p)).comp (algebraMap OK O)) sorry

/-- The canonical continuous lift `K → B_dR⁺` of `K → C` (owner R06.1). -/
def kToBdRPlus : Kfield OK p →+* BDeRhamPlus O p := sorry
/-- `K → B_dR`. -/
def kToBdR : Kfield OK p →+* BDeRham O p := (bdrPlusToBdR O p).comp (kToBdRPlus O p OK)
/-- `O_K → K`. -/
def okToK : OK →+* Kfield OK p := algebraMap _ _
/-- `W(k) → A_inf`, through the unique map from the perfect field `k` to `O^♭` lifting
`k → O_K/p → O/p` (owner `AInfCohomology:AI.0:integral`). -/
def wittToAinf : residueWitt OK p →+* Ainf O p := sorry
/-- `W(k) → B_cris`. -/
def wittToBcris : residueWitt OK p →+* Bcris O p :=
  (acrisToBcris O p).comp ((ainfToAcris O p).comp (wittToAinf O p OK))
/-- `W(k) → B_st`. -/
def wittToBst : residueWitt OK p →+* Bst O p := (bcrisToBst O p).comp (wittToBcris O p OK)
/-- `W(k) → K`. -/
def wittToK : residueWitt OK p →+* Kfield OK p := sorry
/-- `W(k) → A_cris[1/p]`. -/
def wittToAcrisP : residueWitt OK p →+* Localization.Away (p : Acris O p) :=
  (algebraMap (Acris O p) _).comp ((ainfToAcris O p).comp (wittToAinf O p OK))
/-- `A_cris → A_cris[1/p]`. -/
def acrisToAcrisP : Acris O p →+* Localization.Away (p : Acris O p) := algebraMap _ _
/-- `W(k) → W(k̄)`. -/
def wittToResidueWitt : residueWitt OK p →+* residueWitt O p :=
  WittVector.map (residueFieldMap O OK)

/-- The Breuil–Kisin map `𝔖 = W(k)[[u]] → A_inf`, `u ↦ [π^♭]^p`, Frobenius on `W(k)` (owners
`FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4`, `AInfCohomology:AI.2`; BMS1 §4.4). -/
def kisinMap (πb : PreTilt O p) : PowerSeries (residueWitt OK p) →+* Ainf O p := sorry
/-- `𝔖 → O_K`, `u ↦ π`, extending `W(k) → O_K` (owner R07.4). -/
def kisinToOK (π : OK) : PowerSeries (residueWitt OK p) →+* OK := sorry

/-- The Frobenius of `A_cris[1/p]` (owner CR.0). -/
def acrisPFrobenius : Localization.Away (p : Acris O p) →+* Localization.Away (p : Acris O p) :=
  sorry
theorem acrisPFrobenius_comp :
    (acrisToAcrisP O p).comp (acrisFrobenius O p) = (acrisPFrobenius O p).comp (acrisToAcrisP O p) := by
  sorry
theorem acrisPFrobenius_witt :
    (wittToAcrisP O p OK).comp (WittVector.frobenius : residueWitt OK p →+* residueWitt OK p) =
      (acrisPFrobenius O p).comp (wittToAcrisP O p OK) := by
  sorry

theorem autBcris_witt (g : GK O OK) :
    (autBcris O p (galoisToAut O OK g)).toRingHom.comp (wittToBcris O p OK) =
      wittToBcris O p OK := by
  sorry
theorem autBst_witt (g : GK O OK) :
    (autBst O p (galoisToAut O OK g)).toRingHom.comp (wittToBst O p OK) = wittToBst O p OK := by
  sorry
theorem autBdR_k (g : GK O OK) :
    (autBdR O p (galoisToAut O OK g)).toRingHom.comp (kToBdR O p OK) = kToBdR O p OK := by
  sorry

/-- The semilinear action of `G_K` on `B_dR`. -/
abbrev galoisBdR : GK O OK →* RingAut (BDeRham O p) := (autBdR O p).comp (galoisToAut O OK)

end DVBase

/-- the normalized specialization diagram of
`A = W(O_C^♭)`: `θ : A → O_C`, `θ̃ = θ ∘ φ⁻¹`, the Witt reduction `w : A → W(k)` with the Witt
vector Frobenius `F` of `W(k)`, and `A → A_cris → B_dR⁺`, with `ξ`, `ξ̃ = φ(ξ)` and `μ`.
The fields are the maps and the equations among them; the specific value for `O = O_C` is
`SpecializationDictionary.standard`. The rational maps `A[1/μ] → B_cris → B_dR` are the
interfaces `acrisToBcris`, `bcrisToBdR` above. -/
structure SpecializationDictionary
    (A O W Acrys BdRPlus : Type*) [CommRing A] [CommRing O] [CommRing W]
    [CommRing Acrys] [CommRing BdRPlus] (p : ℕ) where
  phi : A ≃+* A
  theta : A →+* O
  thetaTilde : A →+* O
  witt : A →+* W
  /-- The Witt vector Frobenius `F` of `W = W(k)`. -/
  phiW : W →+* W
  toAcrys : A →+* Acrys
  acrysToBdRPlus : Acrys →+* BdRPlus
  toBdRPlus : A →+* BdRPlus
  xi : A
  xiTilde : A
  mu : A
  thetaTilde_eq : thetaTilde = theta.comp phi.symm.toRingHom
  period_eq : toBdRPlus = acrysToBdRPlus.comp toAcrys
  theta_xi_eq : theta xi = 0
  xiTilde_eq : xiTilde = phi xi
  ker_theta_eq : RingHom.ker theta = Ideal.span {xi}
  ker_thetaTilde_eq : RingHom.ker thetaTilde = Ideal.span {xiTilde}
  witt_xi_eq : witt xi = (p : W)
  witt_mu_eq : witt mu = 0
  witt_phi_eq : witt.comp phi.toRingHom = phiW.comp witt

namespace SpecializationDictionary
variable {A O W Acrys BdRPlus : Type*} [CommRing A] [CommRing O] [CommRing W]
  [CommRing Acrys] [CommRing BdRPlus] {p : ℕ}
  (d : SpecializationDictionary A O W Acrys BdRPlus p)

theorem thetaTilde_apply (a : A) : d.thetaTilde a = d.theta (d.phi.symm a) := by
  sorry
theorem period_composite (a : A) :
    d.toBdRPlus a = d.acrysToBdRPlus (d.toAcrys a) := by
  sorry
theorem theta_xi : d.theta d.xi = 0 := by
  sorry
theorem witt_xi : d.witt d.xi = (p : W) := by
  sorry
theorem witt_mu : d.witt d.mu = 0 := by
  sorry
theorem ker_theta :
    RingHom.ker d.theta = Ideal.span {d.xi} ∧ RingHom.ker d.thetaTilde = Ideal.span {d.xiTilde} := by
  sorry
theorem witt_frobenius : d.witt.comp d.phi.toRingHom = d.phiW.comp d.witt := by
  sorry

example : d.theta d.xi = 0 := by
  sorry
example (hp : (p : W) ≠ 0) : d.witt d.xi ≠ 0 := by
  sorry
example (a : A) : d.toBdRPlus a = d.acrysToBdRPlus (d.toAcrys a) := by
  sorry
end SpecializationDictionary

section Standard

variable (O : Type u) [CommRing O] [IsDomain O] [IsLocalRing O] (p : ℕ) [Fact p.Prime]
  [Fact ¬IsUnit (p : O)] [IsAdicComplete (Ideal.span {(p : O)}) O] [IsIntegersOfC O]

/-- The dictionary of `O = O_C` for a compatible system `ε` of primitive `p`-power roots of
unity: `A = W(O^♭)` with its Witt vector Frobenius, Mathlib's `θ = WittVector.fontaineTheta`,
`θ̃ = θ ∘ φ⁻¹`, `w = W(O^♭ → k)` with the Witt vector Frobenius of `W(k)`, Mathlib's
`B_dR⁺ = BDeRhamPlus O p` with its canonical map, `μ = [ε] - 1`, `ξ = ∑_{i<p} [ε^{1/p}]^i` and
`ξ̃ = φ(ξ)`; `A → A_cris → B_dR⁺` are the interfaces of `CrystallineCohomology:CR.0`. -/
def SpecializationDictionary.standard (ε : PreTilt O p) (hε : IsCompatibleRootsOfUnity O p ε) :
    SpecializationDictionary (Ainf O p) O (residueWitt O p) (Acris O p) (BDeRhamPlus O p) p where
  phi := ainfFrobenius O p
  theta := WittVector.fontaineTheta O p
  thetaTilde := fontaineThetaTilde O p
  witt := wittReduction O p
  phiW := WittVector.frobenius
  toAcrys := ainfToAcris O p
  acrysToBdRPlus := acrisToBdRPlus O p
  toBdRPlus := ainfToBdRPlus O p
  xi := xiOf O p ε
  xiTilde := ainfFrobenius O p (xiOf O p ε)
  mu := muOf O p ε
  thetaTilde_eq := rfl
  period_eq := sorry
  theta_xi_eq := sorry
  xiTilde_eq := rfl
  ker_theta_eq := sorry
  ker_thetaTilde_eq := sorry
  witt_xi_eq := sorry
  witt_mu_eq := sorry
  witt_phi_eq := sorry

example (ε : PreTilt O p) (hε : IsCompatibleRootsOfUnity O p ε) :
    (SpecializationDictionary.standard O p ε hε).theta = WittVector.fontaineTheta O p := rfl

end Standard

/-! ### Geometric carriers (interfaces whose owners are named) -/

/-- Proper smooth `p`-adic formal schemes over `Spf R` (owner `AdicSpacesPartII:F0`). -/
def ProperSmoothFormalScheme (R : Type u) [CommRing R] : Type (u + 1) := sorry

/-- `𝔛 ⊗̂_R S` (owner `AdicSpacesPartII:F0`). -/
def ProperSmoothFormalScheme.baseChange {R S : Type u} [CommRing R] [CommRing S] (f : R →+* S)
    (X : ProperSmoothFormalScheme R) : ProperSmoothFormalScheme S := sorry

/-- The special fibre `𝔛_k`, a proper smooth scheme over the residue field (owner F0). -/
def ProperSmoothFormalScheme.specialFibre {R : Type u} [CommRing R]
    (X : ProperSmoothFormalScheme R) : AlgebraicGeometry.Scheme.{u} := sorry

/-- Proper smooth rigid-analytic spaces over the Tate ring `A`: over `C`, over `K`, or families
over a smooth affinoid base (owner `AdicSpacesPartII:R3`). -/
def ProperSmoothRigid (A : Type u) [CommRing A] : Type (u + 1) := sorry
instance (A : Type u) [CommRing A] : Category.{u} (ProperSmoothRigid A) := sorry

/-- Base change of rigid spaces along `A → B`, e.g. the fibre of a family at a point (owner R3). -/
def ProperSmoothRigid.baseChange {A B : Type u} [CommRing A] [CommRing B] (f : A →+* B)
    (X : ProperSmoothRigid A) : ProperSmoothRigid B := sorry

/-- The adic generic fibre over `R[1/p]` (owner `ClassicalAdicEtaleCohomology:H1`). -/
def ProperSmoothFormalScheme.generic {R : Type u} [CommRing R] (p : ℕ)
    (X : ProperSmoothFormalScheme R) : ProperSmoothRigid (Localization.Away (p : R)) := sorry

/-- The `p`-adic completion of a proper smooth `R`-scheme (owner
`ClassicalAdicEtaleCohomology:H1:formal-adic-comparison`). -/
def formalCompletion {R : Type u} [CommRing R] {X : AlgebraicGeometry.Scheme.{u}}
    (f : X ⟶ AlgebraicGeometry.Spec (CommRingCat.of R)) [AlgebraicGeometry.IsProper f]
    [AlgebraicGeometry.Smooth f] : ProperSmoothFormalScheme R := sorry

/-- The analytification of a proper smooth `A`-scheme (owner `ClassicalAdicEtaleCohomology:H5`;
GAGA of `AdicSpacesPartII:R3`). -/
def analytification {A : Type u} [CommRing A] {X : AlgebraicGeometry.Scheme.{u}}
    (f : X ⟶ AlgebraicGeometry.Spec (CommRingCat.of A)) [AlgebraicGeometry.IsProper f]
    [AlgebraicGeometry.Smooth f] : ProperSmoothRigid A := sorry

/-- `RΓ_ét(X, ℤ_p)` of a proper smooth rigid space; over `C` the geometric étale cohomology (owner
`ClassicalAdicEtaleCohomology:H5`). -/
def etaleCohomology {A : Type u} [CommRing A] (p : ℕ) [Fact p.Prime] (X : ProperSmoothRigid A) :
    DerivedCategory (ModuleCat.{u} ℤ_[p]) := sorry

/-- `RΓ_ét(X, 𝔽_p)` (owner H5). -/
def etaleCohomologyModP {A : Type u} [CommRing A] (p : ℕ) [Fact p.Prime]
    (X : ProperSmoothRigid A) : DerivedCategory (ModuleCat.{u} (ZMod p)) := sorry

/-- Smooth affinoid (Tate) algebras over the Tate ring `A` (owner `AdicSpacesPartII:R0`). -/
def SmoothAffinoid (A : Type u) [CommRing A] : Type (u + 1) := sorry
/-- The underlying ring of a smooth affinoid algebra. -/
def SmoothAffinoid.ring {A : Type u} [CommRing A] (X : SmoothAffinoid A) : Type u := sorry
instance {A : Type u} [CommRing A] (X : SmoothAffinoid A) : CommRing X.ring := sorry
instance {A : Type u} [CommRing A] (X : SmoothAffinoid A) : Algebra A X.ring := sorry

/-- Proper flat `p`-adic formal schemes over `Spf R` with divisorial log structure and étale
local charts `t₀ ⋯ t_r = π'` (`π'` a nonzero nonunit, allowed to vary), with special fibre
of pure dimension as in ČK §7.1 (owner
`AInfCohomology:AI.6`). -/
def SemistableFormalScheme (R : Type u) [CommRing R] : Type (u + 1) := sorry
/-- Base change along `R → S` (owner AI.6). -/
def SemistableFormalScheme.baseChange {R S : Type u} [CommRing R] [CommRing S] (f : R →+* S)
    (X : SemistableFormalScheme R) : SemistableFormalScheme S := sorry
/-- The special fibre, a scheme over the residue field (owner AI.6). -/
def SemistableFormalScheme.specialFibre {R : Type u} [CommRing R]
    (X : SemistableFormalScheme R) : AlgebraicGeometry.Scheme.{u} := sorry
/-- The generic fibre, a proper smooth rigid space over `R[1/p]` (owner AI.6). -/
def SemistableFormalScheme.generic {R : Type u} [CommRing R] (p : ℕ)
    (X : SemistableFormalScheme R) : ProperSmoothRigid (Localization.Away (p : R)) := sorry
/-- A proper smooth formal scheme with its trivial (good-reduction) log structure (owner AI.6). -/
def ProperSmoothFormalScheme.toSemistable {R : Type u} [CommRing R]
    (X : ProperSmoothFormalScheme R) : SemistableFormalScheme R := sorry

/-! ### Imported data of a proper smooth formal scheme -/

/-- Imported cohomology of a proper smooth formal scheme `𝔛` over a local ring `R` with residue
field `k`. -/
structure FormalData (R : Type u) [CommRing R] [IsLocalRing R] (p : ℕ) [Fact p.Prime] where
  /-- `RΓ(𝔛, Ω^{•,cont}_{𝔛/R})` (owner `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison`). -/
  deRham : DerivedCategory (ModuleCat.{u} R)
  /-- The cup product on `H^*_dR(𝔛/R)` (owner H1). -/
  deRhamCup : ∀ i j : ℤ, H deRham i →ₗ[R] H deRham j →ₗ[R] H deRham (i + j)
  /-- `RΓ_crys(𝔛_k / W(k))` (owner `CrystallineCohomology:CR.3`). -/
  crystalline : DerivedCategory (ModuleCat.{u} (residueWitt R p))
  /-- Its linearised Frobenius `F^* RΓ_crys → RΓ_crys` (owner CR.3). -/
  crystallineFrob : (derivedBaseChange.{u}
    (WittVector.frobenius : residueWitt R p →+* residueWitt R p)).obj crystalline ⟶ crystalline
  /-- The `F`-semilinear Frobenius of `H^i_crys(𝔛_k / W(k))` (owner CR.3). -/
  crystallineFrobH : ∀ i : ℤ, H crystalline i →ₛₗ[(WittVector.frobenius :
    residueWitt R p →+* residueWitt R p)] H crystalline i
  /-- `RΓ_dR(𝔛_k / k)` (owner CR.3). -/
  deRhamResidue : DerivedCategory (ModuleCat.{u} (IsLocalRing.ResidueField R))
  /-- `RΓ(𝔛, Ω^a_{𝔛/R})`, coherent cohomology of the differentials (owner H1). -/
  hodge : ℕ → DerivedCategory (ModuleCat.{u} R)

/-- The imported cohomology of `𝔛` that its owners construct. -/
def FormalData.of {R : Type u} [CommRing R] [IsLocalRing R] (p : ℕ) [Fact p.Prime]
    (X : ProperSmoothFormalScheme R) : FormalData R p := sorry

section OCData

variable (O : Type u) [CommRing O] [IsDomain O] [IsLocalRing O] (p : ℕ) [Fact p.Prime]
  [Fact ¬IsUnit (p : O)] [IsAdicComplete (Ideal.span {(p : O)}) O]

/-- Geometric comparison data for a proper smooth formal scheme `𝔛` over `O = O_C`: the `A_inf`
cohomology, the specializations it is compared with, and the comparison maps of their owners. -/
structure AinfData (X : ProperSmoothFormalScheme O) where
  /-- `K_A = RΓ_{A_inf}(𝔛) = RΓ(𝔛, AΩ_𝔛)` (owner `AInfCohomology:AI.5`). -/
  complex : DerivedCategory (ModuleCat.{u} (Ainf O p))
  /-- Its linearised Frobenius `φ^* K_A → K_A` (owner AI.5). -/
  frob : (derivedBaseChange.{u} (ainfFrobenius O p).toRingHom).obj complex ⟶ complex
  /-- `RΓ_crys(𝔛_{O/p} / A_cris)` (owner `CrystallineCohomology:CR.2`). -/
  crysAcris : DerivedCategory (ModuleCat.{u} (Acris O p))
  /-- Its linearised Frobenius (owner CR.2). -/
  crysAcrisFrob : (derivedBaseChange.{u} (acrisFrobenius O p)).obj crysAcris ⟶ crysAcris
  /-- The Frobenius-semilinear Frobenius of `H^i_crys(𝔛_{O/p} / A_cris)` (owner CR.2). -/
  crysAcrisFrobH : ∀ i : ℤ, H crysAcris i →ₛₗ[acrisFrobenius O p] H crysAcris i
  /-- `RΓ_Δ(𝔛 / (A_inf, ker θ))` (owner `PrismaticCohomology:PR.6`). -/
  prismatic : DerivedCategory (ModuleCat.{u} (Ainf O p))
  /-- Its linearised Frobenius (owner PR.6). -/
  prismaticFrob : (derivedBaseChange.{u} (ainfFrobenius O p).toRingHom).obj prismatic ⟶ prismatic
  /-- The θ-de Rham comparison map `K_A ⊗^L_{A_inf, θ} O → RΓ(𝔛, Ω^{•,cont})` (owners
  `AInfCohomology:AI.4`, AI.5; BMS1 Theorem 14.1(ii)). -/
  thetaComparison : (derivedBaseChange.{u} (WittVector.fontaineTheta O p)).obj complex ⟶
    (FormalData.of p X).deRham
  /-- The Witt-crystalline comparison map `K_A ⊗̂^L W(k) → RΓ_crys(𝔛_k / W(k))` (owner AI.5;
  BMS1 Theorems 14.1(i), 14.3(i)). -/
  wittComparison : (completedBaseChange.{u} (wittReduction O p)
    (Ideal.span {(p : residueWitt O p)})).obj complex ⟶ (FormalData.of p X).crystalline
  /-- The `A_cris` comparison map `K_A ⊗̂^L A_cris → RΓ_crys(𝔛_{O/p} / A_cris)` (owners AI.4, AI.5;
  BMS1 Theorems 12.1, 14.3(iii)). -/
  acrisComparison : (completedBaseChange.{u} (ainfToAcris O p)
    (Ideal.span {(p : Acris O p)})).obj complex ⟶ crysAcris
  /-- For each `ε`, the étale comparison map `K_A[1/μ] → RΓ_ét(X_C, ℤ_p) ⊗^L A_inf[1/μ]` (owners
  `AInfCohomology:AI.0:period-comparison`, AI.5; BMS1 Theorem 14.3(iv)). -/
  etaleComparison : ∀ ε : PreTilt O p, (derivedBaseChange.{u} (ainfToMu O p ε)).obj complex ⟶
    (derivedBaseChange.{u} (zpToMu O p ε)).obj (etaleCohomology p (X.generic p))
  /-- `φ^* RΓ_Δ(𝔛 / (A_inf, ker θ)) → K_A` (owner `PrismaticCohomology:PR.6`; BS22 §17). -/
  prismaticComparison : (derivedBaseChange.{u} (ainfFrobenius O p).toRingHom).obj prismatic ⟶
    complex
  /-- The crystalline–de Rham map `RΓ_crys(𝔛_{O/p} / A_cris) ⊗^L_{θ} O → RΓ_dR(𝔛 / O)` (owner
  CR.2). -/
  crysDeRham : (derivedBaseChange.{u} (acrisTheta O p)).obj crysAcris ⟶ (FormalData.of p X).deRham
  /-- The cup product of `H^*(K_A ⊗^L_θ O)` (owner `EnhancedDerivedSheaves:E4`). -/
  cupTheta : ∀ i j : ℤ,
    H ((derivedBaseChange.{u} (WittVector.fontaineTheta O p)).obj complex) i →ₗ[O]
      H ((derivedBaseChange.{u} (WittVector.fontaineTheta O p)).obj complex) j →ₗ[O]
        H ((derivedBaseChange.{u} (WittVector.fontaineTheta O p)).obj complex) (i + j)

/-- The imported data of `𝔛` that the owners construct. -/
def AinfData.of (X : ProperSmoothFormalScheme O) : AinfData O p X := sorry

/-- `AΩ_R = RΓ(Spf R, AΩ)` for a `p`-completely smooth `O`-algebra `R` (owner
`AInfCohomology:AI.4`). -/
def aOmegaAffine (R : Type u) [CommRing R] [Algebra O R] :
    DerivedCategory (ModuleCat.{u} (Ainf O p)) := sorry

/-- The Breuil–Kisin twist `O{n}`, an invertible `O`-module (`O{1} = ker θ̃ / (ker θ̃)²`) (owners
`AInfCohomology:AI.1`, `PrismaticCohomology:PR.3`). -/
def bkTwist (n : ℤ) : ModuleCat.{u} O := sorry

variable (OK : Type u) [CommRing OK] [IsDomain OK] [IsDiscreteValuationRing OK] [Algebra OK O]
  [IsLocalHom (algebraMap OK O)]

/-- Imported Galois and site data of a proper smooth formal scheme `𝔛₀` over `O_K`, with
`X_C` the generic fibre of `𝔛₀ ⊗̂ O_C`. -/
structure GaloisData (X₀ : ProperSmoothFormalScheme OK) where
  /-- The action of `G_K` on `RΓ_ét(X_C, ℤ_p)` through compatible geometric points over
  `K̄ → C` (owners `ClassicalAdicEtaleCohomology:H5`, `SchemeAndStackFoundations:SF.2`). -/
  etaleGalois : GK O OK →* Aut (etaleCohomology p ((X₀.baseChange (algebraMap OK O)).generic p))
  /-- `RΓ_proét(X_C, ℤ̂_p)` (owner `AdicEtaleGeometry:A1`). -/
  proetale : DerivedCategory (ModuleCat.{u} ℤ_[p])
  /-- The action of `G_K` on it (owner A1). -/
  proetaleGalois : GK O OK →* Aut proetale
  /-- The pullback `ν^*` along `ν : X_proét → X_ét` (owner A1). -/
  nu : (etaleCohomology p ((X₀.baseChange (algebraMap OK O)).generic p)) ⟶ proetale

/-- The imported Galois data of `𝔛₀`. -/
def GaloisData.of (X₀ : ProperSmoothFormalScheme OK) : GaloisData O p OK X₀ := sorry

/-- The `G_K`-representation `H^i_ét(X_C, ℤ_p)`. -/
abbrev etaleRep (X₀ : ProperSmoothFormalScheme OK) (i : ℤ) :
    Representation ℤ_[p] (GK O OK) (H (etaleCohomology p ((X₀.baseChange (algebraMap OK O)).generic p)) i) :=
  Hrep (GaloisData.of O p OK X₀).etaleGalois i

open AlgebraicGeometry in
/-- Geometric fiber data for a proper smooth `O_K`-scheme `X₀` and its completion
`𝔛₀ = formalCompletion f`, with `𝔛 = 𝔛₀ ⊗̂ O_C`. -/
structure AlgebraicDictionaryData {X₀ : Scheme.{u}} (f : X₀ ⟶ Spec (CommRingCat.of OK))
    [IsProper f] [Smooth f] where
  /-- `RΓ_ét((X₀)_C, ℤ_p)`, algebraic étale cohomology (owner `SchemeAndStackFoundations:SF.2`). -/
  etaleAlgebraic : DerivedCategory (ModuleCat.{u} ℤ_[p])
  /-- `RΓ_dR(X₀ / O_K)`, algebraic de Rham cohomology (owner `CrystallineCohomology:CR.3`). -/
  deRhamAlgebraic : DerivedCategory (ModuleCat.{u} OK)
  /-- `RΓ_crys((X₀)_k / W(k))` (owner CR.3). -/
  crysAlgebraic : DerivedCategory (ModuleCat.{u} (residueWitt OK p))
  /-- `RΓ_crys((X₀)_{O_C/p} / A_cris)` over `Spec O_C/p`, not over `Spec k̄` (owner CR.3). -/
  crysAcrisAlgebraic : DerivedCategory (ModuleCat.{u} (Acris O p))
  /-- Analytification on étale cohomology of the proper generic fibre (owner H5). -/
  etaleGAGA : etaleAlgebraic ⟶
    (etaleCohomology p (((formalCompletion f).baseChange (algebraMap OK O)).generic p))
  /-- Completion on de Rham cohomology (owner `ClassicalAdicEtaleCohomology:H1`). -/
  deRhamCompletion : deRhamAlgebraic ⟶ (FormalData.of p (formalCompletion f)).deRham
  /-- Restriction to the special fibre of the completion (owner CR.3). -/
  crysCompletion : crysAlgebraic ⟶ (FormalData.of p (formalCompletion f)).crystalline
  /-- The same over `A_cris` (owner CR.3). -/
  crysAcrisCompletion : crysAcrisAlgebraic ⟶
    (AinfData.of O p ((formalCompletion f).baseChange (algebraMap OK O))).crysAcris

open AlgebraicGeometry in
/-- The imported Layer 0 data of `X₀`. -/
def AlgebraicDictionaryData.of {X₀ : Scheme.{u}} (f : X₀ ⟶ Spec (CommRingCat.of OK))
    [IsProper f] [Smooth f] : AlgebraicDictionaryData O p OK f := sorry

end OCData

/-! ### Layer 0 theorems -/

section CP0

variable (O : Type u) [CommRing O] [IsDomain O] [IsLocalRing O] (p : ℕ) [Fact p.Prime]
  [Fact ¬IsUnit (p : O)] [IsAdicComplete (Ideal.span {(p : O)}) O] [IsIntegersOfC O]
  (OK : Type u) [CommRing OK] [IsDomain OK] [IsDiscreteValuationRing OK] [Algebra OK O]
  [IsLocalHom (algebraMap OK O)] [IsCompletedAlgClosureOf OK O p]

open AlgebraicGeometry in
/-- (BMS1 Theorem 1.1, Remarks 1.2–1.3, §13.4):
for a proper smooth `O_K`-scheme `X₀` with completion `𝔛₀`, `𝔛 = 𝔛₀ ⊗̂ O_C` and
`Y = 𝔛_{O_C/p}`, analytification identifies algebraic and analytic étale cohomology of the
proper generic fibre, completion identifies algebraic and continuous formal de Rham
cohomology, and restriction identifies the special-fibre crystalline complexes over `W(k)` and
over `A_cris` (`Spec O_C/p` kept distinct from `Spec k`). The maps are the specific maps of
`AlgebraicDictionaryData.of`. -/
theorem CP0.formal_algebraic_analytic_dictionary {X₀ : Scheme.{u}}
    (f : X₀ ⟶ Spec (CommRingCat.of OK)) [IsProper f] [Smooth f] :
    IsIso (AlgebraicDictionaryData.of O p OK f).etaleGAGA ∧
      IsIso (AlgebraicDictionaryData.of O p OK f).deRhamCompletion ∧
      IsIso (AlgebraicDictionaryData.of O p OK f).crysCompletion ∧
      IsIso (AlgebraicDictionaryData.of O p OK f).crysAcrisCompletion := by
  sorry

/-- (Scholze, erratum to "p-adic Hodge theory
for rigid-analytic varieties", (1)–(3)): for `𝔛₀` over `O_K`, the pullback along
`ν : (X_C)_proét → (X_C)_ét` is an isomorphism `RΓ_ét(X_C, ℤ_p) ≅ RΓ_proét(X_C, ℤ̂_p)` and
commutes with the `G_K`-actions defined through compatible geometric points over `K̄ → C`.
The pullbacks to the special fibres and from the logarithmic generic fibre are not stated. -/
theorem CP0.site_and_geometric_point_compatibility (X₀ : ProperSmoothFormalScheme OK) :
    IsIso (GaloisData.of O p OK X₀).nu ∧
      ∀ g : GK O OK, ((GaloisData.of O p OK X₀).etaleGalois g).hom ≫ (GaloisData.of O p OK X₀).nu =
        (GaloisData.of O p OK X₀).nu ≫ ((GaloisData.of O p OK X₀).proetaleGalois g).hom := by
  sorry

/-- (BMS1 Example 4.24, §4.4, introduction
p. 4): for `ε` a compatible system of
primitive `p`-power roots of unity, `t = log [ε]` satisfies `φ(t) = p t` and `g t = χ_p(g) t`
for Mathlib's cyclotomic character `χ_p` (so `ℚ_p(1) = ℚ_p t ⊂ Fil¹`, i.e. `HT(χ_p) = +1`), and
`Fil^r B_dR⁺ = (ker θ)^r = t^r B_dR⁺`. For a uniformizer `π` of `O_K` and `π^♭` with
`(π^♭)^♯ = π`, the Breuil–Kisin map `𝔖 = W(k)[[u]] → A_inf` sends `u ↦ [π^♭]^p`, composes with
`θ̃` to `𝔖 → O_K`, `u ↦ π`, and composes with the Witt reduction to `u ↦ 0` followed by the
Frobenius of `W(k)`. The Breuil–Kisin twists `{−j}` are those of `bkTwist`. -/
theorem CP0.twist_frobenius_filtration_normalization (ε : PreTilt O p)
    (hε : IsCompatibleRootsOfUnity O p ε) (π : OK) (hπ : Irreducible π) (πb : PreTilt O p)
    (hπb : PreTilt.untilt πb = algebraMap OK O π) :
    acrisFrobenius O p (tPeriod O p ε) = (p : Acris O p) * tPeriod O p ε ∧
      (∀ g : O ≃+* O, autAcris O p g (tPeriod O p ε) =
        zpToAcris O p (cyclotomicCharacter O p g : ℤ_[p]) * tPeriod O p ε) ∧
      (∀ r : ℕ, RingHom.ker (bdrTheta O p) ^ r =
        Ideal.span {acrisToBdRPlus O p (tPeriod O p ε) ^ r}) ∧
      kisinMap O p OK πb PowerSeries.X = WittVector.teichmuller p πb ^ p ∧
      (fontaineThetaTilde O p).comp (kisinMap O p OK πb) =
        (algebraMap OK O).comp (kisinToOK p OK π) ∧
      (wittReduction O p).comp (kisinMap O p OK πb) =
        (wittToResidueWitt O p OK).comp
          ((WittVector.frobenius : residueWitt OK p →+* residueWitt OK p).comp
            (PowerSeries.constantCoeff : PowerSeries (residueWitt OK p) →+* residueWitt OK p)) := by
  sorry

/-- (BMS1 Lemmas 13.11–13.13, Remarks 13.20,
13.22), for `K` complete discretely valued with
perfect residue field (`IsCompletedAlgClosureOf`): the canonical lift `K → B_dR⁺` of `K → C` is
`G_K`-invariant and is the only `G_K`-invariant ring map lifting `K → C` (`(B_dR⁺)^{G_K} = K`).
That no natural section `C → B_dR⁺` exists (Fontaine: `θ` has no continuous `G_K`-equivariant
section) needs the topology of `B_dR⁺` and is left out; the transport of lifting choices is
stated in Layer 2 (`CP3.embedding_independence_and_reduction`) and of residue sections in
`CP2.residue_section_descent_adapter`. -/
theorem CP0.no_c_section_and_choice_transport :
    (bdrTheta O p).comp (kToBdRPlus O p OK) = kToC O p OK ∧
      (∀ g : GK O OK, (autBdRPlus O p (galoisToAut O OK g)).toRingHom.comp (kToBdRPlus O p OK) =
        kToBdRPlus O p OK) ∧
      ∀ s : Kfield OK p →+* BDeRhamPlus O p, (bdrTheta O p).comp s = kToC O p OK →
        (∀ g : GK O OK, (autBdRPlus O p (galoisToAut O OK g)).toRingHom.comp s = s) →
          s = kToBdRPlus O p OK := by
  sorry

end CP0

/-! ## Layer 1: integral specialization squares -/

section CP1

open MonoidalCategory

variable (O : Type u) [CommRing O] [IsDomain O] [IsLocalRing O] (p : ℕ) [Fact p.Prime]
  [Fact ¬IsUnit (p : O)] [IsAdicComplete (Ideal.span {(p : O)}) O] [IsIntegersOfC O]

/-- (BMS1 Theorems 14.1, 14.3; AI.4, AI.5): for a proper
smooth formal `O_C`-scheme `𝔛`, `K_A = RΓ_{A_inf}(𝔛)` is perfect, each `H^i(K_A)` is finitely
presented and finite free after inverting `p`, and is a Breuil–Kisin–Fargues module: its
linearised Frobenius becomes an isomorphism after inverting `ξ̃ = φ(ξ)`. The derived
specializations are the specific maps of `AinfData.of` (targets below). -/
theorem CP1.proper_ainf_input_package (X : ProperSmoothFormalScheme O) (ε : PreTilt O p)
    (hε : IsCompatibleRootsOfUnity O p ε) :
    IsPerfectComplex (AinfData.of O p X).complex ∧
      ∀ i : ℤ, Module.FinitePresentation (Ainf O p) (H (AinfData.of O p X).complex i) ∧
        Module.Free (Localization.Away (p : Ainf O p))
          (LocalizedModule (Submonoid.powers (p : Ainf O p)) (H (AinfData.of O p X).complex i)) ∧
        Module.Finite (Localization.Away (p : Ainf O p))
          (LocalizedModule (Submonoid.powers (p : Ainf O p)) (H (AinfData.of O p X).complex i)) ∧
        IsIso ((ModuleCat.extendScalars (algebraMap (Ainf O p)
          (Localization.Away (ainfFrobenius O p (xiOf O p ε))))).map
            (Hmap (AinfData.of O p X).frob i)) := by
  sorry

/-- (BMS1 Theorems 14.1(ii), 14.3(ii)): the θ-base change
`K_A ⊗^L_{A_inf, θ} O_C → RΓ(𝔛, Ω^{•,cont}_{𝔛/O_C})` is an isomorphism (derived tensor
product, θ not θ̃). Multiplicativity is `CP1.multiplicative_bockstein_coherence`. -/
theorem CP1.theta_de_rham_specialization (X : ProperSmoothFormalScheme O) :
    IsIso (AinfData.of O p X).thetaComparison := by
  sorry

/-- (BMS1 Theorem 8.3, Theorem 9.2(i), Proposition 6.12), in its local form on a
`p`-completely smooth `O_C`-algebra `R` (a `p`-complete `R` with `R/p` smooth over `O/p`): the
θ̃-base change of `AΩ_R` has `H^j ≅ Ω̂^j_{R/O_C}{−j}`, the `p`-completed `j`-th exterior power of
the differentials twisted by the Breuil–Kisin twist. The Bockstein differential (the de Rham
differential under this identification) and the cup product are not stated. -/
theorem CP1.hodge_tate_specialization (R : Type u) [CommRing R] [Algebra O R]
    [IsAdicComplete (Ideal.span {(p : R)}) R]
    (hR : Algebra.Smooth (O ⧸ Ideal.span {(p : O)})
      (R ⧸ (Ideal.span {(p : O)}).map (algebraMap O R))) (j : ℕ) :
    Nonempty (H ((derivedBaseChange.{u} (fontaineThetaTilde O p)).obj (aOmegaAffine O p R)) j ≅
      (ModuleCat.restrictScalars (algebraMap O R)).obj
          (ModuleCat.of R (⋀[R]^j (AdicCompletion (Ideal.span {(p : R)}) (Ω[R⁄O])))) ⊗
        bkTwist O (-(j : ℤ))) := by
  sorry

/-- (BMS1 Theorems 14.1(i), 14.3(i)): the derived
`p`-completed base change `K_A ⊗̂^L_{A_inf} W(k) → RΓ_crys(𝔛_k / W(k))` along the Witt reduction
(`w(ξ) = p`) is an isomorphism. No degreewise `H^i(K_A) ⊗ W(k)` statement is made (see
`CP1.singular_and_completed_boundary`). Compatibility with the crystalline Frobenius is a target
of AI.5/CR.3 and is not part of this theorem. -/
theorem CP1.witt_crystalline_specialization (X : ProperSmoothFormalScheme O) :
    IsIso (AinfData.of O p X).wittComparison := by
  sorry

/-- (BMS1 Theorems 12.1, 14.1(iii), 14.3(iii)): for `Y = 𝔛_{O_C/p}`,
`K_A ⊗̂^L_{A_inf} A_cris → RΓ_crys(Y / A_cris)` is an isomorphism (derived `p`-completed base
change; no general claim that the completion is unnecessary). -/
theorem CP1.acris_specialization (X : ProperSmoothFormalScheme O) :
    IsIso (AinfData.of O p X).acrisComparison := by
  sorry

/-- (BMS1 Theorem 14.3(iv) via Theorem 5.7; Lemma
4.26): for the proper
smooth `𝔛`, `K_A[1/μ] → RΓ_ét(X_C, ℤ_p) ⊗^L_{ℤ_p} A_inf[1/μ]` is an isomorphism; moreover
`A_inf → W(C^♭)` is flat and `μ` is a unit in `W(C^♭)`. Nothing is asserted for nonproper formal
schemes. -/
theorem CP1.mu_inverted_etale_specialization (X : ProperSmoothFormalScheme O) (ε : PreTilt O p)
    (hε : IsCompatibleRootsOfUnity O p ε) :
    IsIso ((AinfData.of O p X).etaleComparison ε) ∧
      IsUnit (WittVector.map (algebraMap (PreTilt O p) (FractionRing (PreTilt O p)))
        (muOf O p ε)) ∧
      (WittVector.map (p := p) (algebraMap (PreTilt O p) (FractionRing (PreTilt O p)))).Flat := by
  sorry

/-- (BS22 Theorem 17.2, Notation 18.1,
Theorem 18.2, Lemma 18.3): for the
bounded prism `(A_inf, ker θ)`, `φ^* RΓ_Δ(𝔛 / (A_inf, ker θ)) → K_A` is an isomorphism compatible
with the Frobenii. The uniqueness of BS22 Theorem 18.2 (`End(Δ_{−/A}) = {1}` among symmetric
monoidal transformations with the de Rham comparison `η`) is the owner's (`PR.6`) and is not
restated. -/
theorem CP1.prismatic_frobenius_pullback_comparison (X : ProperSmoothFormalScheme O) :
    IsIso (AinfData.of O p X).prismaticComparison ∧
      (derivedBaseChange.{u} (ainfFrobenius O p).toRingHom).map
          (AinfData.of O p X).prismaticComparison ≫ (AinfData.of O p X).frob =
        (derivedBaseChange.{u} (ainfFrobenius O p).toRingHom).map
          (AinfData.of O p X).prismaticFrob ≫ (AinfData.of O p X).prismaticComparison := by
  sorry

/-- (BMS1 Theorem 14.1 proof, §12.2): the θ-base change of the `A_cris` comparison
followed by the crystalline–de Rham map is the θ-de Rham specialization of `K_A`
(`θ_cris ∘ (A_inf → A_cris) = θ`). The `W(k)` clause (Frobenius-normalized reduction) is not
stated. -/
theorem CP1.crystalline_de_rham_overlap_square (X : ProperSmoothFormalScheme O) :
    (completionComparison (ainfToAcris O p) (Ideal.span {(p : Acris O p)}) (acrisTheta O p)
        (WittVector.fontaineTheta O p) (acrisTheta_comp O p)).app (AinfData.of O p X).complex ≫
      (derivedBaseChange.{u} (acrisTheta O p)).map (AinfData.of O p X).acrisComparison ≫
        (AinfData.of O p X).crysDeRham = (AinfData.of O p X).thetaComparison := by
  sorry

/-- (BMS1 Theorem 14.1 and proof): in the smooth BMS1 setting the θ-de Rham
comparison is multiplicative on cohomology. Coherent associativity of iterated scalar
extension and the Bockstein structures are E4's and are not stated; semistable
multiplicativity is not inferred. -/
theorem CP1.multiplicative_bockstein_coherence (X : ProperSmoothFormalScheme O) (i j : ℤ)
    (x : H ((derivedBaseChange.{u} (WittVector.fontaineTheta O p)).obj
      (AinfData.of O p X).complex) i)
    (y : H ((derivedBaseChange.{u} (WittVector.fontaineTheta O p)).obj
      (AinfData.of O p X).complex) j) :
    (Hmap (AinfData.of O p X).thetaComparison (i + j)).hom ((AinfData.of O p X).cupTheta i j x y) =
      (FormalData.of p X).deRhamCup i j ((Hmap (AinfData.of O p X).thetaComparison i).hom x)
        ((Hmap (AinfData.of O p X).thetaComparison j).hom y) := by
  sorry

/-- (BMS1 Lemma 4.16; Theorems 14.1–14.3): degreewise, the θ-specialization
is governed by the exact sequence for the non-zero-divisor `ξ`:
`0 → H^i(K_A) ⊗_θ O_C → H^i(K_A ⊗^L_θ O_C) → H^{i+1}(K_A)[ξ] → 0`; the Tor term from
`H^{i+1}` can be nonzero, so `H^i(K_A) ⊗ S` does not replace the derived specialization.
Singular, semiperfectoid and nonproper objects are the owners' (`PR.5`, `PR.6`, E4) and are not
stated. -/
theorem CP1.singular_and_completed_boundary (X : ProperSmoothFormalScheme O) (ε : PreTilt O p)
    (hε : IsCompatibleRootsOfUnity O p ε) (i : ℤ) :
    Mono (baseChangeHomologyMap (WittVector.fontaineTheta O p) (AinfData.of O p X).complex i) ∧
      Nonempty (↑(cokernel (baseChangeHomologyMap (WittVector.fontaineTheta O p)
          (AinfData.of O p X).complex i)) ≃+
        Submodule.torsionBy (Ainf O p) (H (AinfData.of O p X).complex (i + 1)) (xiOf O p ε)) := by
  sorry

end CP1

/-! ## Layer 2: canonical and relative infinitesimal B_dR⁺ cohomology -/

/-- Layer 2/infinitesimal-envelope: the presented underlying algebra, completing
along the full kernel. The source Tate algebra, its topology and the continuous
log differential complex come from the named analytic suppliers. This abbreviation
reuses the pinned construction, rather than planning another completion theory. -/
abbrev InfinitesimalEnvelope {P R : Type*} [CommRing P] [CommRing R]
    (e : P →+* R) := AdicCompletion (RingHom.ker e) P

namespace InfinitesimalEnvelope
variable {P R : Type*} [CommRing P] [CommRing R] (e : P →+* R)

abbrev of : P →ₗ[P] InfinitesimalEnvelope e :=
  AdicCompletion.of (RingHom.ker e) P
abbrev level (n : ℕ) : InfinitesimalEnvelope e →ₗ[P]
    P ⧸ ((RingHom.ker e)^n • ⊤ : Submodule P P) :=
  AdicCompletion.eval (RingHom.ker e) P n
theorem level_of (n : ℕ) (a : P) :
    level e n (of e a) =
      Submodule.mkQ ((RingHom.ker e)^n • ⊤ : Submodule P P) a := by
  sorry
theorem ext {x y : InfinitesimalEnvelope e}
    (h : ∀ n, level e n x = level e n y) : x = y := by
  sorry
theorem complete (h : (RingHom.ker e).FG) :
    IsAdicComplete (RingHom.ker e) (InfinitesimalEnvelope e) := by
  sorry

def map {P' : Type*} [CommRing P'] (e' : P' →+* R) (g : P →+* P') (hg : e'.comp g = e) :
    InfinitesimalEnvelope e →+* InfinitesimalEnvelope e' := sorry
theorem map_of {P' : Type*} [CommRing P'] (e' : P' →+* R) (g : P →+* P') (hg : e'.comp g = e)
    (a : P) : map e e' g hg (of e a) = of e' (g a) := by
  sorry
theorem map_id : map e e (RingHom.id P) (RingHom.comp_id e) = RingHom.id _ := by
  sorry
theorem map_comp {P' P'' : Type*} [CommRing P'] [CommRing P''] (e' : P' →+* R) (e'' : P'' →+* R)
    (g : P →+* P') (g' : P' →+* P'') (hg : e'.comp g = e) (hg' : e''.comp g' = e') :
    (map e' e'' g' hg').comp (map e e' g hg) =
      map e e'' (g'.comp g) (by rw [← RingHom.comp_assoc, hg', hg]) := by
  sorry

def lift (hfg : (RingHom.ker e).FG) {S : Type*} [CommRing S] [Algebra P S] (J : Ideal S) [IsAdicComplete J S]
    (hJ : (RingHom.ker e).map (algebraMap P S) ≤ J) : InfinitesimalEnvelope e →+* S := sorry
theorem lift_of (hfg : (RingHom.ker e).FG) {S : Type*} [CommRing S] [Algebra P S] (J : Ideal S) [IsAdicComplete J S]
    (hJ : (RingHom.ker e).map (algebraMap P S) ≤ J) (a : P) :
    lift e hfg J hJ (of e a) = algebraMap P S a := by
  sorry
/-- Uniqueness of `lift` (for finitely generated `ker e`, so that every ring map is continuous). -/
theorem lift_unique {S : Type*} [CommRing S] [Algebra P S] (J : Ideal S) [IsAdicComplete J S]
    (hJ : (RingHom.ker e).map (algebraMap P S) ≤ J) (hfg : (RingHom.ker e).FG)
    (φ : InfinitesimalEnvelope e →+* S) (hφ : ∀ a, φ (of e a) = algebraMap P S a) :
    φ = lift e hfg J hJ := by
  sorry

example (B : Type*) [CommRing B] :
    ∃ f : InfinitesimalEnvelope (RingHom.id B) ≃ₗ[B] B,
      ∀ b, f (of (RingHom.id B) b) = b := by
  sorry
example :
    level (Polynomial.evalRingHom (0 : ℚ)) 2
      (of (Polynomial.evalRingHom (0 : ℚ)) Polynomial.X) =
      Submodule.mkQ ((RingHom.ker (Polynomial.evalRingHom (0 : ℚ)))^2 • ⊤ :
        Submodule (Polynomial ℚ) (Polynomial ℚ)) Polynomial.X ∧
    level (Polynomial.evalRingHom (0 : ℚ)) 2
      (of (Polynomial.evalRingHom (0 : ℚ)) Polynomial.X) ≠ 0 := by
  sorry
example :
    of (Polynomial.evalRingHom (0 : ℚ)) Polynomial.X ≠ 0 ∧
    level (Polynomial.evalRingHom (0 : ℚ)) 1
      (of (Polynomial.evalRingHom (0 : ℚ)) Polynomial.X) = 0 := by
  sorry
end InfinitesimalEnvelope



section CP3Defs

variable (O : Type u) [CommRing O] [IsDomain O] [IsLocalRing O] (p : ℕ) [Fact p.Prime]
  [Fact ¬IsUnit (p : O)] [IsAdicComplete (Ideal.span {(p : O)}) O]

/-- `C⟨X_u^{±1} : u ∈ Σ⟩`, the Laurent Tate algebra on a finite set `Σ` of units of a smooth
affinoid `C`-algebra (owner `AdicSpacesPartII:R0`). -/
def laurentTate (U : SmoothAffinoid (Cfield O p)) (S : Finset U.ring) : Type u := sorry
instance (U : SmoothAffinoid (Cfield O p)) (S : Finset U.ring) : CommRing (laurentTate O p U S) :=
  sorry
instance (U : SmoothAffinoid (Cfield O p)) (S : Finset U.ring) :
    Algebra (Cfield O p) (laurentTate O p U S) := sorry
/-- The variable `X_u`. -/
def laurentVar (U : SmoothAffinoid (Cfield O p)) (S : Finset U.ring) (v : S) :
    laurentTate O p U S := sorry

/-- `P_Σ = lim_n (B_dR⁺/ξ^n)⟨X_u^{±1} : u ∈ Σ⟩` (owner `AdicSpacesPartII:R0`). -/
def envelopeAmbient (U : SmoothAffinoid (Cfield O p)) (S : Finset U.ring) : Type u := sorry
instance (U : SmoothAffinoid (Cfield O p)) (S : Finset U.ring) :
    CommRing (envelopeAmbient O p U S) := sorry
instance (U : SmoothAffinoid (Cfield O p)) (S : Finset U.ring) :
    Algebra (BDeRhamPlus O p) (envelopeAmbient O p U S) := sorry
/-- The variable `X_u ∈ P_Σ`. -/
def envelopeVar (U : SmoothAffinoid (Cfield O p)) (S : Finset U.ring) (v : S) :
    envelopeAmbient O p U S := sorry
/-- `e : P_Σ → R`, `X_u ↦ u` (owner R0). -/
def envelopeMap (U : SmoothAffinoid (Cfield O p)) (S : Finset U.ring) :
    envelopeAmbient O p U S →+* U.ring := sorry

/-- The completed logarithmic de Rham complex `Ω^•_{D_Σ(R)/B_dR⁺}` of the envelope
`D_Σ(R) = InfinitesimalEnvelope (envelopeMap O p U Σ)` (BMS1 Lemma 13.13; completion owned by
`EnhancedDerivedSheaves:E4`). -/
def envelopeDeRham (U : SmoothAffinoid (Cfield O p)) (S : Finset U.ring) :
    DerivedCategory (ModuleCat.{u} (BDeRhamPlus O p)) := sorry
/-- The refinement map for `Σ ⊆ Σ'`. -/
def envelopeRefine (U : SmoothAffinoid (Cfield O p)) {S S' : Finset U.ring} (h : S ⊆ S') :
    envelopeDeRham O p U S ⟶ envelopeDeRham O p U S' := sorry
/-- `Ω^•_{R/C}` (owner R0). -/
def affinoidDeRham (U : SmoothAffinoid (Cfield O p)) :
    DerivedCategory (ModuleCat.{u} (Cfield O p)) := sorry

/-- Base change of smooth affinoid algebras along `A → B`, the completed tensor product
(owner `AdicSpacesPartII:R3`). -/
def SmoothAffinoid.baseChange {A B : Type u} [CommRing A] [CommRing B] (f : A →+* B)
    (X : SmoothAffinoid A) : SmoothAffinoid B := sorry
/-- `R_A → R_A ⊗̂_A B` (owner R3). -/
def SmoothAffinoid.toBaseChange {A B : Type u} [CommRing A] [CommRing B] (f : A →+* B)
    (X : SmoothAffinoid A) : X.ring →+* (X.baseChange f).ring := sorry

/-- For a subring `O_K ⊆ O`, the map `K = O_K[1/p] → C`. -/
def subringKToC (OK : Subring O) : Localization.Away (p : OK) →+* Cfield O p :=
  IsLocalization.Away.lift (p : OK) (g := (algebraMap O (Cfield O p)).comp OK.subtype) sorry

/-- `R_A ⊗̂_A B_dR⁺` for a chosen lift `s : A → B_dR⁺` (owners `AdicSpacesPartII:R3`, E4). -/
def completedLift {A : Type u} [CommRing A] (RA : SmoothAffinoid A) (s : A →+* BDeRhamPlus O p) :
    Type u := sorry
instance {A : Type u} [CommRing A] (RA : SmoothAffinoid A) (s : A →+* BDeRhamPlus O p) :
    CommRing (completedLift O p RA s) := sorry
instance {A : Type u} [CommRing A] (RA : SmoothAffinoid A) (s : A →+* BDeRhamPlus O p) :
    Algebra (BDeRhamPlus O p) (completedLift O p RA s) := sorry
/-- Its reduction modulo `ker θ` (owner R3). -/
def completedLiftReduction {A : Type u} [CommRing A] (RA : SmoothAffinoid A)
    (s : A →+* BDeRhamPlus O p) : completedLift O p RA s →+* (RA.baseChange ((bdrTheta O p).comp s)).ring :=
  sorry

/-- `K_dR⁺(X) = RΓ(X_very-small, Ω^•_{X/B_dR⁺})`, where `Ω^•_{X/B_dR⁺}` is the filtered colimit of
the completed envelope de Rham complexes `envelopeDeRham` over sufficiently large `Σ` (BMS1
Definition 13.18), for a proper smooth rigid space `X` over `C`. Its construction makes no
choice of a lift of `X` to `B_dR⁺`; the site of very small affinoids is `AdicEtaleGeometry:A1`'s
and the colimit and global sections are `EnhancedDerivedSheaves:E4`'s. -/
def CanonicalBdrCohomology (X : ProperSmoothRigid (Cfield O p)) :
    DerivedCategory (ModuleCat.{u} (BDeRhamPlus O p)) := sorry

/-- The value of `Ω^•_{X/B_dR⁺}` on a very small affinoid. -/
def CanonicalBdrCohomology.affinoidComplex (U : SmoothAffinoid (Cfield O p)) :
    DerivedCategory (ModuleCat.{u} (BDeRhamPlus O p)) := sorry

/-! Imported cohomology of a proper smooth rigid space `X` over `C` (each value is that of the
named owner; they are separate declarations rather than fields of one structure). -/

/-- `RΓ_dR(X / C)` (owner `AdicSpacesPartII:R3`). -/
def rigidDeRham (X : ProperSmoothRigid (Cfield O p)) :
    DerivedCategory (ModuleCat.{u} (Cfield O p)) := sorry
/-- `RΓ(X, Ω^a_X)` (owner R3). -/
def rigidHodge (X : ProperSmoothRigid (Cfield O p)) (a : ℕ) :
    DerivedCategory (ModuleCat.{u} (Cfield O p)) := sorry
/-- `RΓ(X_proét, B_dR⁺)` (owners `PadicHodgeTheory:P8:local-rational`, `AdicEtaleGeometry:A1`). -/
def rigidProetaleBdR (X : ProperSmoothRigid (Cfield O p)) :
    DerivedCategory (ModuleCat.{u} (BDeRhamPlus O p)) := sorry
/-- The natural map `K_dR⁺(X) → RΓ(X_proét, B_dR⁺)` (owner P8:local-rational; BMS1 §13). -/
def rigidToProetale (X : ProperSmoothRigid (Cfield O p)) :
    CanonicalBdrCohomology O p X ⟶ (rigidProetaleBdR O p X) := sorry
/-- The primitive comparison `RΓ_ét(X, ℤ_p) ⊗^L B_dR → RΓ(X_proét, B_dR⁺) ⊗ B_dR` (owner P8). -/
def rigidPrimitiveComparison (X : ProperSmoothRigid (Cfield O p)) :
    (derivedBaseChange.{u} (zpToBdR O p)).obj (etaleCohomology p X) ⟶
      (derivedBaseChange.{u} (bdrPlusToBdR O p)).obj (rigidProetaleBdR O p X) := sorry

/-- The degreewise comparison `H^i(K_dR⁺(X)) ⊗ B_dR ≅ H^i_ét(X, ℤ_p) ⊗ B_dR` induced by `toProetale`
and the primitive comparison (constructed in `CP3.canonical_bdr_etale_comparison`). -/
def bdrEtaleComparisonH (X : ProperSmoothRigid (Cfield O p)) (i : ℤ) :
    bc (bdrPlusToBdR O p) (H (CanonicalBdrCohomology O p X) i) ⟶
      bc (zpToBdR O p) (H (etaleCohomology p X) i) := sorry

/-- The good-reduction map `RΓ_crys(𝔛_{O/p} / A_cris) ⊗^L B_dR⁺ → K_dR⁺(X_C)` (BMS1 Proposition 13.23;
constructed in `CP3.good_reduction_bdr_lattice_identification` from AI.4, CR.2). -/
def goodReductionMap (X : ProperSmoothFormalScheme O) :
    (derivedBaseChange.{u} (acrisToBdRPlus O p)).obj (AinfData.of O p X).crysAcris ⟶
      CanonicalBdrCohomology O p (X.generic p) := sorry

variable (OK : Type u) [CommRing OK] [IsDomain OK] [IsDiscreteValuationRing OK] [Algebra OK O]
  [IsLocalHom (algebraMap OK O)]

/-! Imported data of a proper smooth rigid space `X₀` over `K`, with `X₀ ⊗̂_K C` its base change. -/

/-- `RΓ_dR(X₀ / K)` (owner `AdicSpacesPartII:R3`). -/
def rigidDeRhamK (X₀ : ProperSmoothRigid (Kfield OK p)) :
    DerivedCategory (ModuleCat.{u} (Kfield OK p)) := sorry
/-- The Hodge filtration `Fil^a H^i_dR(X₀ / K)` (owner R3). -/
def rigidHodgeFilK (X₀ : ProperSmoothRigid (Kfield OK p)) (i : ℤ) (a : ℤ) :
    Submodule (Kfield OK p) (H (rigidDeRhamK p OK X₀) i) := sorry
/-- The `G_K`-action on `RΓ_ét(X₀ ⊗̂ C, ℤ_p)` (owner `ClassicalAdicEtaleCohomology:H5`). -/
def rigidEtaleGaloisK (X₀ : ProperSmoothRigid (Kfield OK p)) :
    GK O OK →* Aut (etaleCohomology p (X₀.baseChange (kToC O p OK))) := sorry

/-- The `G_K`-representation `H^i_ét(X₀ ⊗̂ C, ℤ_p)`. -/
abbrev etaleRepK (X₀ : ProperSmoothRigid (Kfield OK p)) (i : ℤ) :
    Representation ℤ_[p] (GK O OK) (H (etaleCohomology p (X₀.baseChange (kToC O p OK))) i) :=
  Hrep (rigidEtaleGaloisK O p OK X₀) i

/-- `Fil^r (B_dR ⊗_{ℤ_p} M) = Fil^r B_dR ⊗ M` (owner `PadicHodgeTheory:R06.1`). -/
def periodFiltration (M : ModuleCat.{u} ℤ_[p]) (r : ℤ) : AddSubgroup (bc (zpToBdR O p) M) := sorry
/-- `Fil^r (B_dR ⊗_K D) = ∑_a Fil^a D ⊗ Fil^{r-a} B_dR` (owner R06.1). -/
def tensorFiltration (D : ModuleCat.{u} (Kfield OK p)) (F : ℤ → Submodule (Kfield OK p) D)
    (r : ℤ) : AddSubgroup (bc (kToBdR O p OK) D) := sorry

/-- The de Rham comparison map `c_dR : H^i_ét(X₀ ⊗̂ C, ℤ_p) ⊗ B_dR → H^i_dR(X₀ / K) ⊗_K B_dR`
(Scholze Theorem 8.4; constructed in `CP3.filtered_de_rham_comparison`). -/
def deRhamComparison (X₀ : ProperSmoothRigid (Kfield OK p)) (i : ℤ) :
    bc (zpToBdR O p) (H (etaleCohomology p (X₀.baseChange (kToC O p OK))) i) ⟶
      bc (kToBdR O p OK) (H (rigidDeRhamK p OK X₀) i) := sorry

end CP3Defs

section CP3

variable (O : Type u) [CommRing O] [IsDomain O] [IsLocalRing O] (p : ℕ) [Fact p.Prime]
  [Fact ¬IsUnit (p : O)] [IsAdicComplete (Ideal.span {(p : O)}) O] [IsIntegersOfC O]

/-- (BMS1 Definition 13.5, Construction 13.6): a smooth
affinoid `C`-algebra `R` of dimension `d` has a finite set `Σ` of units containing `d` coordinates
`T_i` with `C⟨X_u^{±1}⟩ → R`, `X_u ↦ u`, surjective. That `Spa(R, R°) → 𝕋^d_C` factors through
rational embeddings and finite étale maps, power-boundedness of `Σ`, and that very small
affinoids form a basis, need adic spaces (`AdicSpacesPartII:R0`) and are not stated. -/
theorem CP3.very_small_affinoid_embedding (U : SmoothAffinoid (Cfield O p)) :
    ∃ (S : Finset U.ring) (d : ℕ) (T : Fin d → U.ring),
      ringKrullDim U.ring = d ∧ (∀ i, T i ∈ S) ∧ (∀ v ∈ S, IsUnit v) ∧
      ∃ e : laurentTate O p U S →ₐ[Cfield O p] U.ring,
        Function.Surjective e ∧ ∀ v : S, e (laurentVar O p U S v) = v := by
  sorry

open Classical in
/-- (BMS1 Lemmas 13.7–13.10): after enlarging `Σ`,
a very small `R / C` descends to a smooth affinoid `R_A` over a smooth affinoid algebra `A` over
a complete discretely valued subfield `K ⊂ C`, with `R_A ⊗̂_A C ≅ R` carrying a finite set `Σ_A`
onto the enlarged `Σ'`. The étale torus coordinates of `Σ_A` are not stated. -/
theorem CP3.noetherian_approximation_interface (U : SmoothAffinoid (Cfield O p))
    (S : Finset U.ring) :
    ∃ S' : Finset U.ring, S ⊆ S' ∧ ∃ (OK : Subring O) (_ : IsDiscreteValuationRing OK)
      (_ : IsAdicComplete (IsLocalRing.maximalIdeal OK) OK)
      (A : SmoothAffinoid (Localization.Away (p : OK))) (RA : SmoothAffinoid A.ring)
      (g : A.ring →+* Cfield O p) (SA : Finset RA.ring),
      g.comp (algebraMap (Localization.Away (p : OK)) A.ring) = subringKToC O p OK ∧
      ∃ e : (RA.baseChange g).ring ≃+* U.ring,
        S' = SA.image (fun a => e (SmoothAffinoid.toBaseChange g RA a)) := by
  sorry

/-- (BMS1 Lemma 13.11): for the approximation `R_A / A` and a
lift `s : A → B_dR⁺` of `A → C`, `R_A ⊗̂_A B_dR⁺` is `ξ`-adically complete, flat over `B_dR⁺`, and
reduces modulo `ξ` to `R_A ⊗̂_A C`. Topological freeness modulo `ξ^n` is not stated. -/
theorem CP3.completed_smooth_lift (ε : PreTilt O p) (hε : IsCompatibleRootsOfUnity O p ε)
    {A : Type u} [CommRing A] (RA : SmoothAffinoid A) (s : A →+* BDeRhamPlus O p) :
    IsAdicComplete (Ideal.span {algebraMap (BDeRhamPlus O p) (completedLift O p RA s)
        (xiBdR O p ε)}) (completedLift O p RA s) ∧
      Module.Flat (BDeRhamPlus O p) (completedLift O p RA s) ∧
      Function.Surjective (completedLiftReduction O p RA s) ∧
      RingHom.ker (completedLiftReduction O p RA s) =
        Ideal.span {algebraMap (BDeRhamPlus O p) (completedLift O p RA s) (xiBdR O p ε)} := by
  sorry

/-- (BMS1 Lemma 13.12): for `Σ` large enough, containing
coordinates `T`, and lifts `ũ ∈ R_A ⊗̂_A B_dR⁺` of the remaining `u ∈ Σ`, `D_Σ(R)` is the power
series ring over `R_A ⊗̂_A B_dR⁺` in the variables `X_u − ũ`, `u ∉ T`. -/
theorem CP3.envelope_normal_form (U : SmoothAffinoid (Cfield O p)) {A : Type u} [CommRing A]
    (RA : SmoothAffinoid A) (s : A →+* BDeRhamPlus O p)
    (e : (RA.baseChange ((bdrTheta O p).comp s)).ring ≃+* U.ring) :
    ∃ S₀ : Finset U.ring, ∀ S : Finset U.ring, S₀ ⊆ S → ∃ T : Finset U.ring, T ⊆ S ∧
      ∀ lift : S → completedLift O p RA s,
        (∀ v, e (completedLiftReduction O p RA s (lift v)) = v) →
        ∃ φ : InfinitesimalEnvelope (envelopeMap O p U S) ≃+*
            MvPowerSeries {v : S // v.1 ∉ T} (completedLift O p RA s),
          ∀ v : {v : S // v.1 ∉ T}, φ (algebraMap _ _ (envelopeVar O p U S v.1)) =
            MvPowerSeries.X v + MvPowerSeries.C (lift v.1) := by
  sorry

/-- (BMS1 Lemma 13.13, Definition 13.14): for
`Σ` large enough the refinement maps are isomorphisms satisfying the cocycle law, and reduction
modulo `ξ` (θ-base change) is `Ω^•_{R/C}`. The double-embedding comparison of two lifts and the
identification with `Ω^•_{R_A/A} ⊗̂_A B_dR⁺` are not stated. -/
theorem CP3.embedding_independence_and_reduction (U : SmoothAffinoid (Cfield O p)) :
    ∃ S₀ : Finset U.ring,
      (∀ (S S' : Finset U.ring) (h : S ⊆ S'), S₀ ⊆ S → IsIso (envelopeRefine O p U h)) ∧
      (∀ (S S' S'' : Finset U.ring) (h : S ⊆ S') (h' : S' ⊆ S''), S₀ ⊆ S →
        envelopeRefine O p U h ≫ envelopeRefine O p U h' = envelopeRefine O p U (h.trans h')) ∧
      ∀ S : Finset U.ring, S₀ ⊆ S → Nonempty ((derivedBaseChange.{u} (bdrTheta O p)).obj
        (envelopeDeRham O p U S) ≅ affinoidDeRham O p U) := by
  sorry

/-- (BMS1 Proposition 13.15, Corollary 13.16): a proper smooth
rigid space `X / C` is the fibre at a `C`-point `x` of a proper smooth family over a smooth
affinoid base `S` over a complete discretely valued subfield `K ⊂ C`. -/
theorem CP3.proper_formal_spreading (X : ProperSmoothRigid (Cfield O p)) :
    ∃ (OK : Subring O) (_ : IsDiscreteValuationRing OK)
      (_ : IsAdicComplete (IsLocalRing.maximalIdeal OK) OK)
      (S : SmoothAffinoid (Localization.Away (p : OK))) (Y : ProperSmoothRigid S.ring)
      (x : S.ring →+* Cfield O p),
      x.comp (algebraMap (Localization.Away (p : OK)) S.ring) = subringKToC O p OK ∧
      Nonempty (Y.baseChange x ≅ X) := by
  sorry

namespace CanonicalBdrCohomology

/-- On a very small affinoid, the presheaf value is the colimit of the envelope complexes along
the refinement maps, which are eventually isomorphisms (BMS1 Lemma 13.13). -/
theorem affinoid (U : SmoothAffinoid (Cfield O p)) :
    ∃ (S₀ : Finset U.ring) (c : ∀ S : Finset U.ring, S₀ ⊆ S →
        (envelopeDeRham O p U S ⟶ affinoidComplex O p U)),
      (∀ S hS, IsIso (c S hS)) ∧
      ∀ (S S' : Finset U.ring) (hS : S₀ ⊆ S) (h : S ⊆ S'),
        envelopeRefine O p U h ≫ c S' (hS.trans h) = c S hS := by
  sorry

/-- Functoriality: `f : X → Y` gives `K_dR⁺(Y) → K_dR⁺(X)`. -/
def map {X Y : ProperSmoothRigid (Cfield O p)} (f : X ⟶ Y) :
    CanonicalBdrCohomology O p Y ⟶ CanonicalBdrCohomology O p X := sorry

theorem map_id (X : ProperSmoothRigid (Cfield O p)) : map O p (𝟙 X) = 𝟙 _ := by
  sorry

theorem map_comp {X Y Z : ProperSmoothRigid (Cfield O p)} (f : X ⟶ Y) (g : Y ⟶ Z) :
    map O p (f ≫ g) = map O p g ≫ map O p f := by
  sorry

/-- `K_dR⁺(X) ⊗^L_{B_dR⁺, θ} C ≅ RΓ_dR(X / C)`. -/
theorem theta (X : ProperSmoothRigid (Cfield O p)) :
    Nonempty ((derivedBaseChange.{u} (bdrTheta O p)).obj (CanonicalBdrCohomology O p X) ≅
      (rigidDeRham O p X)) := by
  sorry

/-- `K_dR⁺(X)` is perfect and `ξ`-complete (each cohomology module of the perfect complex over
`B_dR⁺` is classically `ξ`-adically complete). -/
theorem complete (X : ProperSmoothRigid (Cfield O p)) (ε : PreTilt O p)
    (hε : IsCompatibleRootsOfUnity O p ε) :
    IsPerfectComplex (CanonicalBdrCohomology O p X) ∧
      ∀ i : ℤ, IsAdicComplete (Ideal.span {xiBdR O p ε}) (H (CanonicalBdrCohomology O p X) i) := by
  sorry

/-- Systems of sufficiently large embeddings `Σ_U` of the very small affinoids of `X`, ordered by
refinement (owner: this construction, on `AdicEtaleGeometry:A1`'s site). -/
def EmbeddingSystem (X : ProperSmoothRigid (Cfield O p)) : Type u := sorry
instance (X : ProperSmoothRigid (Cfield O p)) : Preorder (EmbeddingSystem O p X) := sorry
/-- The complex built from one embedding system. -/
def ofSystem {X : ProperSmoothRigid (Cfield O p)} (s : EmbeddingSystem O p X) :
    DerivedCategory (ModuleCat.{u} (BDeRhamPlus O p)) := sorry
/-- The comparison map along a refinement. -/
def compareSystems {X : ProperSmoothRigid (Cfield O p)} {s s' : EmbeddingSystem O p X}
    (h : s ≤ s') : ofSystem O p s ⟶ ofSystem O p s' := sorry

/-- Two sufficiently large embedding systems give the same object through the refinement
quasi-isomorphisms, which satisfy the cocycle law. -/
theorem independent (X : ProperSmoothRigid (Cfield O p)) :
    ∃ s₀ : EmbeddingSystem O p X,
      (∀ (s s' : EmbeddingSystem O p X) (h : s ≤ s'), s₀ ≤ s → IsIso (compareSystems O p h)) ∧
      (∀ (s s' s'' : EmbeddingSystem O p X) (h : s ≤ s') (h' : s' ≤ s''), s₀ ≤ s →
        compareSystems O p h ≫ compareSystems O p h' = compareSystems O p (h.trans h')) ∧
      ∀ s : EmbeddingSystem O p X, s₀ ≤ s →
        Nonempty (ofSystem O p s ≅ CanonicalBdrCohomology O p X) := by
  sorry

/-- `Spa C` as a proper smooth rigid space (owner `AdicSpacesPartII:R3`). -/
def point : ProperSmoothRigid (Cfield O p) := sorry
/-- `ℙ¹_C` (owner R3). -/
def projectiveLine : ProperSmoothRigid (Cfield O p) := sorry
/-- The very small torus `C⟨T^{±1}⟩` (owner `AdicSpacesPartII:R0`). -/
def torus : SmoothAffinoid (Cfield O p) := sorry
/-- Its coordinate `T`. -/
def torusCoordinate : (torus O p).ring := sorry

example : Nonempty (CanonicalBdrCohomology O p (point O p) ≅
    (DerivedCategory.singleFunctor (ModuleCat.{u} (BDeRhamPlus O p)) 0).obj
      (ModuleCat.of (BDeRhamPlus O p) (BDeRhamPlus O p))) := by
  sorry

example :
    Module.Free (BDeRhamPlus O p) (H (CanonicalBdrCohomology O p (projectiveLine O p)) 0) ∧
    Module.finrank (BDeRhamPlus O p) (H (CanonicalBdrCohomology O p (projectiveLine O p)) 0) = 1 ∧
    IsZero (H (CanonicalBdrCohomology O p (projectiveLine O p)) 1) ∧
    Module.Free (BDeRhamPlus O p) (H (CanonicalBdrCohomology O p (projectiveLine O p)) 2) ∧
    Module.finrank (BDeRhamPlus O p) (H (CanonicalBdrCohomology O p (projectiveLine O p)) 2) = 1 ∧
    Nonempty (bc (bdrTheta O p) (H (CanonicalBdrCohomology O p (projectiveLine O p)) 0) ≅
      H (rigidDeRham O p (projectiveLine O p)) 0) ∧
    Nonempty (bc (bdrTheta O p) (H (CanonicalBdrCohomology O p (projectiveLine O p)) 2) ≅
      H (rigidDeRham O p (projectiveLine O p)) 2) := by
  sorry

open Classical in
example (v : (torus O p).ring) (hv : IsUnit v) :
    IsIso (envelopeRefine O p (torus O p) (Finset.subset_insert v {torusCoordinate O p})) ∧
      ∀ i : ℤ, IsIso (Hmap
        (envelopeRefine O p (torus O p) (Finset.subset_insert v {torusCoordinate O p})) i) := by
  sorry

end CanonicalBdrCohomology

/-- (BMS1 Theorem 13.19): for `X` proper smooth over
`C`, every `H^i(K_dR⁺(X))` is finite free over `B_dR⁺` and its θ-reduction is `H^i_dR(X / C)`. -/
theorem CP3.bdr_cohomology_finite_freeness (X : ProperSmoothRigid (Cfield O p)) (i : ℤ) :
    Module.Free (BDeRhamPlus O p) (H (CanonicalBdrCohomology O p X) i) ∧
      Module.Finite (BDeRhamPlus O p) (H (CanonicalBdrCohomology O p X) i) ∧
      Nonempty (bc (bdrTheta O p) (H (CanonicalBdrCohomology O p X) i) ≅
        H (rigidDeRham O p X) i) := by
  sorry

/-- `B_dR⁺(R_∞,Σ)` of the perfectoid tower adjoining compatible `p`-power roots of all `u ∈ Σ`
(owner `PadicHodgeTheory:P8:local-rational`). -/
def periodRingTower (U : SmoothAffinoid (Cfield O p)) (S : Finset U.ring) : Type u := sorry
instance (U : SmoothAffinoid (Cfield O p)) (S : Finset U.ring) :
    CommRing (periodRingTower O p U S) := sorry
/-- `[u^♭] ∈ B_dR⁺(R_∞,Σ)` (owner P8). -/
def teichmullerPeriod (U : SmoothAffinoid (Cfield O p)) (S : Finset U.ring) (v : S) :
    periodRingTower O p U S := sorry
/-- The `Γ = ∏_Σ ℤ_p(1)`-Koszul complex of `B_dR⁺(R_∞,Σ)` (owners `AInfCohomology:AI.4`, P8). -/
def koszulPeriod (U : SmoothAffinoid (Cfield O p)) (S : Finset U.ring) :
    DerivedCategory (ModuleCat.{u} (BDeRhamPlus O p)) := sorry
/-- `Lη_ξ` on `D(B_dR⁺)` (owner `AInfCohomology:AI.1`). -/
def letaXi : DerivedCategory (ModuleCat.{u} (BDeRhamPlus O p)) ⥤
    DerivedCategory (ModuleCat.{u} (BDeRhamPlus O p)) := sorry
/-- `RΓ(U_proét, B_dR⁺)` (owner P8). -/
def localProetaleBdR (U : SmoothAffinoid (Cfield O p)) :
    DerivedCategory (ModuleCat.{u} (BDeRhamPlus O p)) := sorry

/-- (BMS1 Theorem 13.1 proof, Proposition 12.9): for a very small
`U` and `Σ` large enough, there is a map `D_Σ(R) → B_dR⁺(R_∞,Σ)` with `X_u ↦ [u^♭]`; the envelope
de Rham complex is `Lη_ξ` of the period Koszul complex, and after inverting `ξ` it is the local
pro-étale `B_dR` cohomology. -/
theorem CP3.local_bdr_etale_map (U : SmoothAffinoid (Cfield O p)) :
    ∃ S₀ : Finset U.ring, ∀ S : Finset U.ring, S₀ ⊆ S →
      (∃ ψ : InfinitesimalEnvelope (envelopeMap O p U S) →+* periodRingTower O p U S,
        ∀ v : S, ψ (algebraMap _ _ (envelopeVar O p U S v)) = teichmullerPeriod O p U S v) ∧
      Nonempty (envelopeDeRham O p U S ≅ (letaXi O p).obj (koszulPeriod O p U S)) ∧
      Nonempty ((derivedBaseChange.{u} (bdrPlusToBdR O p)).obj (envelopeDeRham O p U S) ≅
        (derivedBaseChange.{u} (bdrPlusToBdR O p)).obj (localProetaleBdR O p U)) := by
  sorry

/-- (BMS1 Theorem 13.1 and proof): the natural map
`K_dR⁺(X) → RΓ(X_proét, B_dR⁺)` becomes an isomorphism after inverting `ξ`, the primitive
comparison identifies the target with `RΓ_ét(X, ℤ_p) ⊗^L B_dR`, and degreewise
`bdrEtaleComparisonH : H^i(K_dR⁺(X)) ⊗ B_dR → H^i_ét(X, ℤ_p) ⊗ B_dR` is an isomorphism. The
filtered enhancement is `CP3.filtered_de_rham_comparison`. -/
theorem CP3.canonical_bdr_etale_comparison (X : ProperSmoothRigid (Cfield O p)) :
    IsIso ((derivedBaseChange.{u} (bdrPlusToBdR O p)).map (rigidToProetale O p X)) ∧
      IsIso (rigidPrimitiveComparison O p X) ∧
      ∀ i : ℤ, IsIso (bdrEtaleComparisonH O p X i) := by
  sorry

/-- (BMS1 Theorem 13.3(i)): for `X` proper smooth over `C`,
the Hodge–de Rham spectral sequence degenerates at `E₁`: `dim H^n_dR = ∑_{a+b=n} dim H^b(X, Ω^a)`. -/
theorem CP3.hodge_de_rham_degeneration (X : ProperSmoothRigid (Cfield O p)) (n : ℕ) :
    Module.finrank (Cfield O p) (H (rigidDeRham O p X) n) =
      ∑ a ∈ Finset.range (n + 1),
        Module.finrank (Cfield O p) (H (rigidHodge O p X a) ((n : ℤ) - a)) := by
  sorry

/-- (BMS1 Theorem 13.3(ii)): the Hodge–Tate spectral sequence
`E₂^{a,b} = H^a(X, Ω^b)(−b) ⇒ H^{a+b}_ét(X, ℚ_p) ⊗ C` degenerates at `E₂`:
`dim_C H^n_ét(X, ℤ_p) ⊗ C = ∑_{a+b=n} dim H^a(X, Ω^b)`. No canonical splitting is asserted. -/
theorem CP3.hodge_tate_degeneration (X : ProperSmoothRigid (Cfield O p)) (n : ℕ) :
    Module.finrank (Cfield O p) (bc (zpToC O p) (H (etaleCohomology p X) n)) =
      ∑ b ∈ Finset.range (n + 1),
        Module.finrank (Cfield O p) (H (rigidHodge O p X b) ((n : ℤ) - b)) := by
  sorry

/-- (BMS1 Proposition 13.23): for `𝔛` proper
smooth over `O_C` and `Y = 𝔛_{O_C/p}`, `RΓ_crys(Y / A_cris) ⊗^L B_dR⁺ → K_dR⁺(X_C)` is an
isomorphism, and degreewise `H^i_crys(Y / A_cris) ⊗ B_dR⁺ ≅ H^i(K_dR⁺(X_C))`. -/
theorem CP3.good_reduction_bdr_lattice_identification (X : ProperSmoothFormalScheme O) :
    IsIso (goodReductionMap O p X) ∧
      ∀ i : ℤ, Nonempty (bc (acrisToBdRPlus O p) (H (AinfData.of O p X).crysAcris i) ≅
        H (CanonicalBdrCohomology O p (X.generic p)) i) := by
  sorry

/-- (BMS1 Theorem 14.5(i) proof, Theorem 13.1
proof): after `⊗ B_dR`, the BMS map `K_A → K_A[1/μ] ≅ RΓ_ét ⊗ A_inf[1/μ]` followed by the
primitive comparison equals the canonical map through `A_cris`, the good-reduction lattice
`K_dR⁺(X_C)` and `RΓ(X_proét, B_dR⁺)`. -/
theorem CP3.integral_rational_bdr_map_agreement (X : ProperSmoothFormalScheme O)
    (ε : PreTilt O p) (hε : IsCompatibleRootsOfUnity O p ε) :
    (completionComparison (ainfToAcris O p) (Ideal.span {(p : Acris O p)}) (acrisToBdR O p)
        (ainfToBdR O p) (acrisToBdR_comp O p)).app (AinfData.of O p X).complex ≫
      (derivedBaseChange.{u} (acrisToBdR O p)).map (AinfData.of O p X).acrisComparison ≫
      (derivedBaseChangeComp (acrisToBdRPlus O p) (bdrPlusToBdR O p)).inv.app
        (AinfData.of O p X).crysAcris ≫
      (derivedBaseChange.{u} (bdrPlusToBdR O p)).map (goodReductionMap O p X) ≫
      (derivedBaseChange.{u} (bdrPlusToBdR O p)).map (rigidToProetale O p (X.generic p)) =
    eqToHom (congrArg (fun h => (derivedBaseChange.{u} h).obj (AinfData.of O p X).complex)
        (muToBdR_comp O p ε (mu_unit O p ε hε)).symm) ≫
      (derivedBaseChangeComp (ainfToMu O p ε) (muToBdR O p ε (mu_unit O p ε hε))).inv.app
        (AinfData.of O p X).complex ≫
      (derivedBaseChange.{u} (muToBdR O p ε (mu_unit O p ε hε))).map ((AinfData.of O p X).etaleComparison ε) ≫
      (derivedBaseChangeComp (zpToMu O p ε) (muToBdR O p ε (mu_unit O p ε hε))).hom.app
        (etaleCohomology p (X.generic p)) ≫
      eqToHom (congrArg (fun h => (derivedBaseChange.{u} h).obj (etaleCohomology p (X.generic p)))
        (muToBdR_zp O p ε (mu_unit O p ε hε))) ≫
      (rigidPrimitiveComparison O p (X.generic p)) := by
  sorry

variable (OK : Type u) [CommRing OK] [IsDomain OK] [IsDiscreteValuationRing OK] [Algebra OK O]
  [IsLocalHom (algebraMap OK O)] [IsCompletedAlgClosureOf OK O p]

/-- (BMS1 Remark 13.20, Theorem 13.1 proof), for `K`
complete discretely valued with perfect residue field: if `X = X₀ ⊗̂_K C` with `X₀` proper
smooth over `K`, then `H^i(K_dR⁺(X)) ≅ H^i_dR(X₀ / K) ⊗_K B_dR⁺` via the canonical lift
`K → B_dR⁺`. Agreement after inverting `ξ` with Scholze's comparison (BMS1 Theorem 5.1) through a
common envelope is not stated. -/
theorem CP3.descended_de_rham_lattice (X₀ : ProperSmoothRigid (Kfield OK p)) (i : ℤ) :
    Nonempty (H (CanonicalBdrCohomology O p (X₀.baseChange (kToC O p OK))) i ≅
      bc (kToBdRPlus O p OK) (H (rigidDeRhamK p OK X₀) i)) := by
  sorry

/-- (Scholze Theorem 8.4; BMS1 Theorem 5.1, Theorem 13.1
proof): for `X₀` proper smooth over `K`, `c_dR` is a `G_K`-equivariant isomorphism
`H^i_ét(X_C, ℤ_p) ⊗ B_dR ≅ H^i_dR(X₀ / K) ⊗_K B_dR`, strict for the period filtration against the
tensor-product filtration. -/
theorem CP3.filtered_de_rham_comparison (X₀ : ProperSmoothRigid (Kfield OK p)) (i : ℤ) :
    IsIso (deRhamComparison O p OK X₀ i) ∧
      (∀ (g : GK O OK) x, (deRhamComparison O p OK X₀ i).hom
          (galoisExtend (zpToBdR O p) (galoisBdR O p OK) (fun g => autBdR_zp O p _) _
            (etaleRepK O p OK X₀ i) g x) =
        galoisExtend (kToBdR O p OK) (galoisBdR O p OK) (fun g => autBdR_k O p OK g) _
          (Representation.trivial (Kfield OK p) (GK O OK) _) g
          ((deRhamComparison O p OK X₀ i).hom x)) ∧
      ∀ r : ℤ, (deRhamComparison O p OK X₀ i).hom ''
          (periodFiltration O p (H (etaleCohomology p (X₀.baseChange (kToC O p OK))) i) r :
            Set _) =
        tensorFiltration O p OK _ (rigidHodgeFilK p OK X₀ i) r := by
  sorry

end CP3

/-! ### Layer 2, relative: the relative infinitesimal site of Guo–Reinecke -/

/-- Smooth morphisms `f : X → Y = Spf R` of smooth `p`-adic formal `O_K`-schemes, with `R` a
`p`-complete smooth `O_K`-algebra (owners `AdicSpacesPartII:F0`, `AdicEtaleGeometry:A1`). -/
def SmoothFormalMorphism (OK R : Type u) [CommRing OK] [CommRing R] [Algebra OK R] :
    Type (u + 1) := sorry

/-- Proper smooth such morphisms (owner F0). -/
def ProperSmoothFormalMorphism (OK R : Type u) [CommRing OK] [CommRing R] [Algebra OK R] :
    Type (u + 1) := sorry

namespace SmoothFormalMorphism

variable {OK R : Type u} [CommRing OK] [CommRing R] [Algebra OK R]

/-- The underlying smooth morphism of a proper smooth one. -/
def ofProper (f : ProperSmoothFormalMorphism OK R) : SmoothFormalMorphism OK R := sorry
/-- Base change along `R → R'` (owner F0). -/
def baseChange {R' : Type u} [CommRing R'] [Algebra OK R'] (g : R →ₐ[OK] R')
    (f : SmoothFormalMorphism OK R) : SmoothFormalMorphism OK R' := sorry
/-- The identity of `Spf R` (owner F0). -/
def identity (OK R : Type u) [CommRing OK] [CommRing R] [Algebra OK R] :
    SmoothFormalMorphism OK R := sorry
/-- The opens `U` of `X_C` (owner `AdicEtaleGeometry:A1`). -/
def SourceOpen (f : SmoothFormalMorphism OK R) : Type u := sorry
instance (f : SmoothFormalMorphism OK R) : PartialOrder f.SourceOpen := sorry

end SmoothFormalMorphism

section CP3RelDefs

variable (O : Type u) [CommRing O] [IsDomain O] [IsLocalRing O] (p : ℕ) [Fact p.Prime]
  [Fact ¬IsUnit (p : O)] [IsAdicComplete (Ideal.span {(p : O)}) O]
  {OK R : Type u} [CommRing OK] [CommRing R] [Algebra OK R]

/-- Adic spaces topologically of finite type over `Y_{B_dR⁺/I^e}`, `I = ker θ`, for the specified
`O_K → B_dR⁺` (owner `AdicSpacesPartII:R0`). -/
def Thickening (O : Type u) [CommRing O] (p : ℕ) (f : SmoothFormalMorphism OK R) (e : ℕ) :
    Type (u + 1) := sorry
/-- Zariski closed immersions `U → T` defined by a nilpotent ideal, compatible with the maps to
`Y` (`U → Y_C`, `T → Y_{B_dR⁺/I^e}`) (owner R0). -/
def NilpotentImmersion (O : Type u) [CommRing O] (p : ℕ) {f : SmoothFormalMorphism OK R}
    {e : ℕ} (U : f.SourceOpen) (T : Thickening O p f e) : Type u := sorry
/-- `Γ(T, O_T)` (owner R0). -/
def thickeningSections (O : Type u) [CommRing O] (p : ℕ) {f : SmoothFormalMorphism OK R}
    {e : ℕ} (T : Thickening O p f e) : Type u := sorry
instance (O : Type u) [CommRing O] (p : ℕ) {f : SmoothFormalMorphism OK R} {e : ℕ}
    (T : Thickening O p f e) : CommRing (thickeningSections O p T) := sorry

/-- (Guo–Reinecke Definition 10.1): the site
`X/Y_{B_dR⁺,inf}` of a smooth morphism `f : X → Y` of smooth formal `O_K`-schemes. An object is
`(U, T)`: an open `U ⊆ X_C`, an adic space `T` topologically of finite type over `Y_{B_dR⁺/I^e}`
for some `e`, and a Zariski closed immersion `U → T` defined by a nilpotent ideal, compatible
with the maps to `Y`. Morphisms, covers and the structure sheaf are below; generic crystals and
their cartesian condition are `CrystallineCohomology:CR.1`'s and E4's. -/
structure RelativeInfinitesimalSite (f : SmoothFormalMorphism OK R) where
  /-- The open `U ⊆ X_C`. -/
  U : f.SourceOpen
  /-- The level `e`. -/
  level : ℕ
  /-- The thickening `T` over `Y_{B_dR⁺/I^e}`. -/
  T : Thickening O p f level
  /-- The nilpotent closed immersion `U → T` over `Y`. -/
  immersion : NilpotentImmersion O p U T

namespace RelativeInfinitesimalSite

variable {O p} {f : SmoothFormalMorphism OK R}

/-- An open, a finite-level thickening and a nilpotent closed immersion over the base give an
object. -/
def object (U : f.SourceOpen) (e : ℕ) (T : Thickening O p f e) (i : NilpotentImmersion O p U T) :
    RelativeInfinitesimalSite O p f := ⟨U, e, T, i⟩

/-- Morphisms: maps of thickenings over `Y_{B_dR⁺}` restricting to open immersions on the `U`
(owner R0). -/
def morphism (A B : RelativeInfinitesimalSite O p f) : Type u := sorry

instance : Category.{u} (RelativeInfinitesimalSite O p f) where
  Hom := morphism
  id _ := sorry
  comp _ _ := sorry
  id_comp := sorry
  comp_id := sorry
  assoc := sorry

/-- A morphism restricts to an inclusion of opens. -/
theorem morphism_le {A B : RelativeInfinitesimalSite O p f} (φ : A ⟶ B) : A.U ≤ B.U := by
  sorry

/-- `O_inf(U, T) = Γ(T, O_T)`. -/
def structureSheaf (f : SmoothFormalMorphism OK R) :
    (RelativeInfinitesimalSite O p f)ᵒᵖ ⥤ CommRingCat.{u} := sorry

theorem structureSheaf_obj (A : RelativeInfinitesimalSite O p f) :
    Nonempty ((structureSheaf f).obj (Opposite.op A) ≅
      CommRingCat.of (thickeningSections O p A.T)) := by
  sorry

/-- A base change `R → R'` pulls relative thickenings back. -/
def baseChange {R' : Type u} [CommRing R'] [Algebra OK R'] (g : R →ₐ[OK] R')
    (f : SmoothFormalMorphism OK R) :
    RelativeInfinitesimalSite O p f ⥤ RelativeInfinitesimalSite O p (f.baseChange g) := sorry

/-- Covers: simultaneous analytic covers of `U` and `T` (owner `AdicEtaleGeometry:A1`). -/
def topology (f : SmoothFormalMorphism OK R) :
    GrothendieckTopology (RelativeInfinitesimalSite O p f) := sorry

/-- Smooth rigid `Z` over `Y_K` with a closed immersion `X_C → Z` (owner R0). -/
def SmoothAmbient (O : Type u) [CommRing O] (p : ℕ) (f : SmoothFormalMorphism OK R) :
    Type (u + 1) := sorry

/-- The `e`-th infinitesimal neighbourhood of `X_C` in the ambient `Z` (owner R0). -/
def envelopeObject (Z : SmoothAmbient O p f) (e : ℕ) : RelativeInfinitesimalSite O p f := sorry

/-- The ind-system of infinitesimal neighbourhoods in a smooth ambient is weakly final: every
object is covered by objects mapping to some neighbourhood (GR Lemma 10.3). That its
self-products are the diagonal envelopes is not stated. -/
theorem envelope (Z : SmoothAmbient O p f) (A : RelativeInfinitesimalSite O p f) :
    ∃ S ∈ topology f A, ∀ (B : RelativeInfinitesimalSite O p f) (φ : B ⟶ A), S.arrows φ →
      ∃ e : ℕ, Nonempty (B ⟶ envelopeObject Z e) := by
  sorry

end RelativeInfinitesimalSite

/-- `R_{B_dR⁺} = R ⊗̂_{O_K} B_dR⁺` (owners `AdicSpacesPartII:R0`, E4). -/
def relBdR (O : Type u) [CommRing O] (p : ℕ) (R : Type u) [CommRing R] [Algebra OK R] :
    Type u := sorry
instance (O : Type u) [CommRing O] [IsDomain O] [IsLocalRing O] (p : ℕ) [Fact p.Prime]
    [Fact ¬IsUnit (p : O)] [IsAdicComplete (Ideal.span {(p : O)}) O] (R : Type u) [CommRing R]
    [Algebra OK R] : CommRing (relBdR (OK := OK) O p R) := sorry
instance (R : Type u) [CommRing R] [Algebra OK R] :
    Algebra (BDeRhamPlus O p) (relBdR (OK := OK) O p R) := sorry
/-- `R → R_{B_dR⁺}` (owner R0). -/
def rToRelBdR (R : Type u) [CommRing R] [Algebra OK R] : R →+* relBdR (OK := OK) O p R := sorry
/-- `I R_{B_dR⁺}` for `I = ker θ`. -/
def relBdRIdeal (R : Type u) [CommRing R] [Algebra OK R] : Ideal (relBdR (OK := OK) O p R) :=
  (RingHom.ker (bdrTheta O p)).map (algebraMap (BDeRhamPlus O p) (relBdR (OK := OK) O p R))
/-- `R_{A_cris} = R ⊗̂ A_cris` (owner `CrystallineCohomology:CR.1`). -/
def relAcris (O : Type u) [CommRing O] (p : ℕ) (R : Type u) [CommRing R] [Algebra OK R] :
    Type u := sorry
instance (R : Type u) [CommRing R] [Algebra OK R] : CommRing (relAcris (OK := OK) O p R) := sorry
/-- `R_{A_cris} → R_{B_dR⁺}` (owner CR.1). -/
def relAcrisToRelBdR (R : Type u) [CommRing R] [Algebra OK R] :
    relAcris (OK := OK) O p R →+* relBdR (OK := OK) O p R := sorry

/-- Vector-bundle crystals on `X/Y_{B_dR⁺,inf}` (owners `CrystallineCohomology:CR.1`, E4). -/
def VectorBundleCrystal (O : Type u) [CommRing O] (p : ℕ) (f : SmoothFormalMorphism OK R) :
    Type (u + 1) := sorry
instance (f : SmoothFormalMorphism OK R) : Category.{u} (VectorBundleCrystal O p f) := sorry
/-- The structure crystal `O_inf`. -/
def VectorBundleCrystal.unit (f : SmoothFormalMorphism OK R) : VectorBundleCrystal O p f := sorry

/-- `RΓ_inf(X/Y_{B_dR⁺}, F)` (this construction, on E4's sheaf cohomology). -/
def infinitesimalCohomology (f : SmoothFormalMorphism OK R) (F : VectorBundleCrystal O p f) :
    DerivedCategory (ModuleCat.{u} (relBdR (OK := OK) O p R)) := sorry

/-- The Čech–Alexander complex of the weakly final envelope (GR Construction 10.6). -/
def cechAlexander (f : SmoothFormalMorphism OK R) (F : VectorBundleCrystal O p f)
    (Z : RelativeInfinitesimalSite.SmoothAmbient O p f) :
    DerivedCategory (ModuleCat.{u} (relBdR (OK := OK) O p R)) := sorry
/-- The completed relative de Rham complex of `F` on the envelope (GR Theorem 10.7). -/
def envelopeRelDeRham (f : SmoothFormalMorphism OK R) (F : VectorBundleCrystal O p f)
    (Z : RelativeInfinitesimalSite.SmoothAmbient O p f) :
    DerivedCategory (ModuleCat.{u} (relBdR (OK := OK) O p R)) := sorry
/-- The relative de Rham cohomology of the vector bundle with flat connection on `X_C / Y_C`
attached to `F` (owners R3, E4). -/
def relativeDeRhamFlat (f : ProperSmoothFormalMorphism OK R)
    (F : VectorBundleCrystal O p (SmoothFormalMorphism.ofProper f)) :
    DerivedCategory (ModuleCat.{u} (relBdR (OK := OK) O p R ⧸ relBdRIdeal (OK := OK) O p R)) :=
  sorry

/-- Perfect complexes on `X_{p=0,crys}` (owner `CrystallineCohomology:CR.1`). -/
def PerfectCrystalline (O : Type u) [CommRing O] (p : ℕ) (f : SmoothFormalMorphism OK R) :
    Type (u + 1) := sorry
instance (f : SmoothFormalMorphism OK R) : Category.{u} (PerfectCrystalline O p f) := sorry
/-- Perfect complexes on `X/Y_{B_dR⁺,inf}` (owner E4). -/
def PerfectInfinitesimal (O : Type u) [CommRing O] (p : ℕ) (f : SmoothFormalMorphism OK R) :
    Type (u + 1) := sorry
instance (f : SmoothFormalMorphism OK R) : Category.{u} (PerfectInfinitesimal O p f) := sorry
/-- Vector-bundle crystals on `X_{p=0,crys}` (owner CR.1). -/
def VBCrystalline (O : Type u) [CommRing O] (p : ℕ) (f : SmoothFormalMorphism OK R) :
    Type (u + 1) := sorry
instance (f : SmoothFormalMorphism OK R) : Category.{u} (VBCrystalline O p f) := sorry
/-- Vector-bundle crystals as perfect complexes (owner CR.1). -/
def vbCrysToPerf (f : SmoothFormalMorphism OK R) :
    VBCrystalline O p f ⥤ PerfectCrystalline O p f := sorry
/-- Vector-bundle crystals as perfect complexes (owner E4). -/
def vbInfToPerf (f : SmoothFormalMorphism OK R) :
    VectorBundleCrystal O p f ⥤ PerfectInfinitesimal O p f := sorry
/-- Enlarged framings of the smooth relative setup (GR Convention 10.4; owner R0). -/
def EnlargedFraming (O : Type u) [CommRing O] (p : ℕ) (f : SmoothFormalMorphism OK R) :
    Type u := sorry
/-- The PD envelope `D_{pd,Σ}^n` of a framing (owner CR.1). -/
def framingPD {f : SmoothFormalMorphism OK R} (fr : EnlargedFraming O p f) : Type u := sorry
instance {f : SmoothFormalMorphism OK R} (fr : EnlargedFraming O p f) : CommRing (framingPD O p fr) := sorry
/-- The infinitesimal envelope `D_Σ^n` of a framing (`InfinitesimalEnvelope` of its presentation). -/
def framingEnvelope {f : SmoothFormalMorphism OK R} (fr : EnlargedFraming O p f) : Type u := sorry
instance {f : SmoothFormalMorphism OK R} (fr : EnlargedFraming O p f) : CommRing (framingEnvelope O p fr) := sorry
/-- `D_pd → D_Σ`: `p`-inversion followed by completion along the embedding ideal. -/
def framingPDToEnvelope {f : SmoothFormalMorphism OK R} (fr : EnlargedFraming O p f) :
    framingPD O p fr →+* framingEnvelope O p fr := sorry
/-- Evaluation of a crystalline perfect complex on a framing (owner CR.1). -/
def evalCrys {f : SmoothFormalMorphism OK R} (fr : EnlargedFraming O p f) :
    PerfectCrystalline O p f ⥤ DerivedCategory (ModuleCat.{u} (framingPD O p fr)) := sorry
/-- Evaluation of an infinitesimal perfect complex on a framing (owner E4). -/
def evalInf {f : SmoothFormalMorphism OK R} (fr : EnlargedFraming O p f) :
    PerfectInfinitesimal O p f ⥤ DerivedCategory (ModuleCat.{u} (framingEnvelope O p fr)) := sorry
/-- The functor `D_perf(X_{p=0,crys}) → D_perf(X/Y_{B_dR⁺,inf})` of GR Proposition 10.10
(constructed in `CP3.crystalline_to_infinitesimal_coefficients`). -/
def crysToInf (f : SmoothFormalMorphism OK R) :
    PerfectCrystalline O p f ⥤ PerfectInfinitesimal O p f := sorry
/-- Its restriction to vector-bundle crystals. -/
def crysToInfVB (f : SmoothFormalMorphism OK R) :
    VBCrystalline O p f ⥤ VectorBundleCrystal O p f := sorry
/-- `RΓ_crys(X_{p=0} / R, E′)` (owners CR.1, CR.3). -/
def crysCohomologyRel (f : SmoothFormalMorphism OK R) (E : VBCrystalline O p f) :
    DerivedCategory (ModuleCat.{u} R) := sorry
/-- `RΓ_crys(X_{p=0} / R_{A_cris}, E′)` (owners CR.1, CR.3). -/
def crysCohomologyAcrisRel (f : SmoothFormalMorphism OK R) (E : VBCrystalline O p f) :
    DerivedCategory (ModuleCat.{u} (relAcris (OK := OK) O p R)) := sorry
/-- An absolute `B_dR⁺`-thickening site of `X_C` (Guo's site; owner R0). -/
def AbsoluteInfinitesimalSite (O : Type u) [CommRing O] (p : ℕ) (f : SmoothFormalMorphism OK R) :
    Type (u + 1) := sorry
instance (f : SmoothFormalMorphism OK R) : Category.{u} (AbsoluteInfinitesimalSite O p f) := sorry
/-- Forgetting the map to `Y_{B_dR⁺/I^e}`. -/
def forgetToAbsolute (f : SmoothFormalMorphism OK R) :
    RelativeInfinitesimalSite O p f ⥤ AbsoluteInfinitesimalSite O p f := sorry
/-- Guo's `B_dR⁺`-infinitesimal cohomology of a rigid space over `C` (owner
`EnhancedDerivedSheaves:E5:animation` for its éh extension). -/
def guoInfinitesimal (X : ProperSmoothRigid (Cfield O p)) :
    DerivedCategory (ModuleCat.{u} (BDeRhamPlus O p)) := sorry

end CP3RelDefs

section CP3Rel

variable (O : Type u) [CommRing O] [IsDomain O] [IsLocalRing O] (p : ℕ) [Fact p.Prime]
  [Fact ¬IsUnit (p : O)] [IsAdicComplete (Ideal.span {(p : O)}) O] [IsIntegersOfC O]
  (OK : Type u) [CommRing OK] [IsDomain OK] [IsDiscreteValuationRing OK] [Algebra OK O]
  [IsLocalHom (algebraMap OK O)] [IsCompletedAlgClosureOf OK O p]

namespace RelativeInfinitesimalSite

example : Nonempty (relBdR (OK := OK) O p OK ≃+* BDeRhamPlus O p) ∧
    Nonempty (infinitesimalCohomology O p (SmoothFormalMorphism.identity OK OK)
        (VectorBundleCrystal.unit O p _) ≅
      (DerivedCategory.singleFunctor (ModuleCat.{u} (relBdR (OK := OK) O p OK)) 0).obj
        (ModuleCat.of _ (relBdR (OK := OK) O p OK))) := by
  sorry

example (R : Type u) [CommRing R] [Algebra OK R] :
    (∀ i : ℤ, i ≠ 0 → IsZero (H (infinitesimalCohomology O p (SmoothFormalMorphism.identity OK R)
      (VectorBundleCrystal.unit O p _)) i)) ∧
    Nonempty (H (infinitesimalCohomology O p (SmoothFormalMorphism.identity OK R)
        (VectorBundleCrystal.unit O p _)) 0 ≅ ModuleCat.of _ (relBdR (OK := OK) O p R)) := by
  sorry

example : ∃ (R : Type u) (_ : CommRing R) (_ : Algebra OK R) (f : SmoothFormalMorphism OK R)
    (B : AbsoluteInfinitesimalSite O p f),
    ∀ A : RelativeInfinitesimalSite O p f, ¬ Nonempty ((forgetToAbsolute O p f).obj A ≅ B) := by
  sorry

end RelativeInfinitesimalSite

variable {R : Type u} [CommRing R] [Algebra OK R]

/-- (GR Construction 10.6, Theorem 10.7, Corollary
10.8): for a vector-bundle crystal `F` and a smooth ambient embedding, the Čech–Alexander complex
of the weakly final envelope and the completed relative de Rham complex of `F` on it both compute
`RΓ_inf(X/Y_{B_dR⁺}, F)`. -/
theorem CP3.relative_cech_de_rham_comparison (f : SmoothFormalMorphism OK R)
    (F : VectorBundleCrystal O p f) (Z : RelativeInfinitesimalSite.SmoothAmbient O p f) :
    Nonempty (cechAlexander O p f F Z ≅ infinitesimalCohomology O p f F) ∧
      Nonempty (envelopeRelDeRham O p f F Z ≅ infinitesimalCohomology O p f F) := by
  sorry

/-- (GR Corollaries 10.8–10.9): for `f` proper
smooth over `Y = Spf R`, `RΓ_inf(X/Y_{B_dR⁺}, F)` is a perfect `R_{B_dR⁺}`-complex whose derived
`I`-reduction is the relative de Rham cohomology of the associated flat vector bundle on
`X_C / Y_C`. Freeness of higher direct images is not asserted. -/
theorem CP3.relative_infinitesimal_perfectness (f : ProperSmoothFormalMorphism OK R)
    (F : VectorBundleCrystal O p (SmoothFormalMorphism.ofProper f)) :
    IsPerfectComplex (infinitesimalCohomology O p (SmoothFormalMorphism.ofProper f) F) ∧
      Nonempty ((derivedBaseChange.{u} (Ideal.Quotient.mk (relBdRIdeal (OK := OK) O p R))).obj
          (infinitesimalCohomology O p (SmoothFormalMorphism.ofProper f) F) ≅
        relativeDeRhamFlat O p f F) := by
  sorry

/-- (GR Proposition 10.10): the functor
`D_perf(X_{p=0,crys}) → D_perf(X/Y_{B_dR⁺,inf})` restricts to vector-bundle crystals, and on an
enlarged framing its value is `E′(D_pd) ⊗^L_{D_pd} D_Σ` along `p`-inversion followed by completion
along the embedding ideal. -/
theorem CP3.crystalline_to_infinitesimal_coefficients (f : SmoothFormalMorphism OK R) :
    Nonempty (vbCrysToPerf O p f ⋙ crysToInf O p f ≅ crysToInfVB O p f ⋙ vbInfToPerf O p f) ∧
      ∀ fr : EnlargedFraming O p f, Nonempty (crysToInf O p f ⋙ evalInf O p fr ≅
        evalCrys O p fr ⋙ derivedBaseChange.{u} (framingPDToEnvelope O p fr)) := by
  sorry

/-- (GR Proposition 10.11, equation
(36)): for a vector-bundle crystalline crystal `E′` with image `F`, crystalline cohomology over `R`
and over `R_{A_cris}` identify with `RΓ_inf(X/Y_{B_dR⁺}, F)` after the completed `B_dR⁺` base
change. The comparison of connections (`∇_inf` the completion of `∇_crys[1/p]`) is not stated. -/
theorem CP3.relative_crystalline_infinitesimal_base_change (f : SmoothFormalMorphism OK R)
    (E : VBCrystalline O p f) :
    Nonempty ((completedBaseChange.{u} (rToRelBdR (OK := OK) O p R)
        (relBdRIdeal (OK := OK) O p R)).obj (crysCohomologyRel O p f E) ≅
      infinitesimalCohomology O p f ((crysToInfVB O p f).obj E)) ∧
    Nonempty ((completedBaseChange.{u} (relAcrisToRelBdR (OK := OK) O p R)
        (relBdRIdeal (OK := OK) O p R)).obj (crysCohomologyAcrisRel O p f E) ≅
      infinitesimalCohomology O p f ((crysToInfVB O p f).obj E)) := by
  sorry

/-- (Guo Theorem 1.2.7, Corollary 1.2.11):
for proper smooth `X / C`, Guo's `B_dR⁺`-infinitesimal cohomology agrees with the canonical
`K_dR⁺(X)` of BMS1. Guo's éh extension to singular spaces is the requested interface, not stated. -/
theorem CP3.absolute_relative_infinitesimal_agreement (X : ProperSmoothRigid (Cfield O p)) :
    Nonempty (guoInfinitesimal O p X ≅ CanonicalBdrCohomology O p X) := by
  sorry

end CP3Rel

/-! ## Layer 3: rational crystalline comparison and descent -/

section CP2

variable (O : Type u) [CommRing O] [IsDomain O] [IsLocalRing O] (p : ℕ) [Fact p.Prime]
  [Fact ¬IsUnit (p : O)] [IsAdicComplete (Ideal.span {(p : O)}) O] [IsIntegersOfC O]
  (OK : Type u) [CommRing OK] [IsDomain OK] [IsDiscreteValuationRing OK] [Algebra OK O]
  [IsLocalHom (algebraMap OK O)] [IsCompletedAlgClosureOf OK O p]

theorem bcrisFrobenius_zp :
    (zpToBcris O p).comp (RingHom.id ℤ_[p]) = (bcrisFrobenius O p).comp (zpToBcris O p) := by
  sorry
theorem bcrisFrobenius_witt :
    (wittToBcris O p OK).comp (WittVector.frobenius : residueWitt OK p →+* residueWitt OK p) =
      (bcrisFrobenius O p).comp (wittToBcris O p OK) := by
  sorry

/-- `W(k)[1/p] = K₀ → B_cris`. -/
def k0ToBcris : Localization.Away (p : residueWitt OK p) →+* Bcris O p :=
  IsLocalization.Away.lift (p : residueWitt OK p) (g := wittToBcris O p OK) sorry

/-- `G_K → Aut(B_cris)`. -/
abbrev galoisBcris : GK O OK →* RingAut (Bcris O p) := (autBcris O p).comp (galoisToAut O OK)
/-- `G_K → Aut(B_st)`. -/
abbrev galoisBst : GK O OK →* RingAut (Bst O p) := (autBst O p).comp (galoisToAut O OK)

/-- `H^i_ét(X_C, ℤ_p)` for `X_C` the generic fibre of `𝔛₀ ⊗̂ O_C`. -/
abbrev etH (X₀ : ProperSmoothFormalScheme OK) (i : ℤ) : ModuleCat.{u} ℤ_[p] :=
  H (etaleCohomology p ((X₀.baseChange (algebraMap OK O)).generic p)) i

/-- `H^i_crys(𝔛₀,k / W(k))`. -/
abbrev crysH (X₀ : ProperSmoothFormalScheme OK) (i : ℤ) : ModuleCat.{u} (residueWitt OK p) :=
  H (FormalData.of p X₀).crystalline i

/-- An isomorphism `B_cris ⊗_{ℤ_p} H^i_ét(X_C, ℤ_p) ≅ B_cris ⊗_{W(k)} H^i_crys(𝔛₀,k / W(k))` is
compatible with Frobenius (`1 ⊗ φ_{B_cris}` against `φ_crys ⊗ φ_{B_cris}`) and with `G_K`
(diagonal against `G_K` acting on `B_cris` only). -/
def IsCrystallineComparison (X₀ : ProperSmoothFormalScheme OK) (i : ℤ)
    (e : bc (zpToBcris O p) (etH O p OK X₀ i) ≅ bc (wittToBcris O p OK) (crysH p OK X₀ i)) :
    Prop :=
  (∀ x, e.hom.hom (semilinearExtend (zpToBcris O p) (RingHom.id ℤ_[p]) (bcrisFrobenius O p)
      (bcrisFrobenius_zp O p) (etH O p OK X₀ i) LinearMap.id x) =
    semilinearExtend (wittToBcris O p OK) WittVector.frobenius (bcrisFrobenius O p)
      (bcrisFrobenius_witt O p OK) (crysH p OK X₀ i) ((FormalData.of p X₀).crystallineFrobH i)
      (e.hom.hom x)) ∧
  ∀ (g : GK O OK) x, e.hom.hom (galoisExtend (zpToBcris O p) (galoisBcris O p OK)
      (fun g => autBcris_zp O p _) (etH O p OK X₀ i) (etaleRep O p OK X₀ i) g x) =
    galoisExtend (wittToBcris O p OK) (galoisBcris O p OK) (fun g => autBcris_witt O p OK g)
      (crysH p OK X₀ i) (Representation.trivial (residueWitt OK p) (GK O OK) (crysH p OK X₀ i)) g
      (e.hom.hom x)

/-- (BMS1 Theorem 14.5(i)): for `𝔛` proper
smooth over `O_C`, `H^i_crys(𝔛_{O/p} / A_cris) ⊗_{A_cris} B_cris ≅ H^i_ét(X_C, ℤ_p) ⊗_{ℤ_p} B_cris`.
Its compatibility with the `B_dR` comparison of BMS1 Theorem 13.1 is
`CP3.integral_rational_bdr_map_agreement`. -/
theorem CP2.rational_crystalline_comparison_over_C (X : ProperSmoothFormalScheme O) (i : ℤ) :
    Nonempty (bc (acrisToBcris O p) (H (AinfData.of O p X).crysAcris i) ≅
      bc (zpToBcris O p) (H (etaleCohomology p (X.generic p)) i)) := by
  sorry

/-- (BMS1 Theorem 14.6(i)): for
`𝔛₀` proper smooth over `O_K`, `H^i_ét(X_C, ℤ_p) ⊗ B_cris ≅ H^i_crys(𝔛₀,k / W(k)) ⊗ B_cris`
compatibly with Frobenius and `G_K`; in particular `H^i_ét(X_C, ℚ_p)` is crystalline (CP6
records the realization). Compatibility with the filtrations after `⊗ B_dR` is
`CP3.filtered_de_rham_comparison`. -/
theorem CP2.crystalline_comparison_over_discretely_valued_base
    (X₀ : ProperSmoothFormalScheme OK) (i : ℤ) :
    ∃ e : bc (zpToBcris O p) (etH O p OK X₀ i) ≅ bc (wittToBcris O p OK) (crysH p OK X₀ i),
      IsCrystallineComparison O p OK X₀ i e := by
  sorry

/-- (BMS1 Proposition 13.21, Remark 13.22, Theorem 14.6 proof; CR.3): for `𝔛₀` over
`O_K` and `Y = (𝔛₀ ⊗̂ O_C)_{O_C/p}`, `H^i_crys(Y / A_cris)[1/p] ≅ H^i_crys(𝔛₀,k / W(k)) ⊗ A_cris[1/p]`
compatibly with Frobenius, for the section `k → O_C/p` through `W(k) → O_K` (`wittToAinf`). -/
theorem CP2.residue_section_descent_adapter (X₀ : ProperSmoothFormalScheme OK) (i : ℤ) :
    ∃ e : bc (acrisToAcrisP O p)
        (H (AinfData.of O p (X₀.baseChange (algebraMap OK O))).crysAcris i) ≅
      bc (wittToAcrisP O p OK) (crysH p OK X₀ i),
      ∀ x, e.hom.hom (semilinearExtend (acrisToAcrisP O p) (acrisFrobenius O p)
          (acrisPFrobenius O p) (acrisPFrobenius_comp O p) _
          ((AinfData.of O p (X₀.baseChange (algebraMap OK O))).crysAcrisFrobH i) x) =
        semilinearExtend (wittToAcrisP O p OK) WittVector.frobenius (acrisPFrobenius O p)
          (acrisPFrobenius_witt O p OK) (crysH p OK X₀ i)
          ((FormalData.of p X₀).crystallineFrobH i) (e.hom.hom x) := by
  sorry

/-- (BMS1 Theorems 14.3–14.5, §1.2): `A_cris → B_cris` is the localization at `μ`,
`B_cris` is flat over `ℤ_p`, and the rational base changes give degreewise isomorphisms
`H^i(K_A) ⊗_{A_inf} B_cris ≅ H^i_crys(𝔛_{O/p} / A_cris) ⊗_{A_cris} B_cris`. No integral equality
`H^i(K_A ⊗^L W(k)) = H^i(K_A) ⊗ W(k)` is asserted. -/
theorem CP2.rational_degreewise_comparison (X : ProperSmoothFormalScheme O) (ε : PreTilt O p)
    (hε : IsCompatibleRootsOfUnity O p ε) :
    (letI : Algebra (Acris O p) (Bcris O p) := (acrisToBcris O p).toAlgebra;
      IsLocalization.Away (ainfToAcris O p (muOf O p ε)) (Bcris O p)) ∧
      (zpToBcris O p).Flat ∧
      ∀ i : ℤ, Nonempty (bc ((acrisToBcris O p).comp (ainfToAcris O p))
          (H (AinfData.of O p X).complex i) ≅
        bc (acrisToBcris O p) (H (AinfData.of O p X).crysAcris i)) := by
  sorry

/-- (BMS1 Theorem 14.6(i); R06.2): `B_cris^{G_K} = K₀ = W(k)[1/p]`; the
crystalline comparison carries `D_cris(V) = (B_cris ⊗ H^i_ét)^{G_K}` onto `K₀ ⊗ H^i_crys`
(φ-equivariantly, by `IsCrystallineComparison`); and `D_dR(V) = (B_dR ⊗ H^i_ét)^{G_K}` is
additively `H^i_dR(𝔛₀,K / K)`. The Hodge filtration of `D_dR` is not stated. -/
theorem CP2.period_invariants_and_admissibility (X₀ : ProperSmoothFormalScheme OK) (i : ℤ) :
    (∀ b : Bcris O p, (∀ g : GK O OK, galoisBcris O p OK g b = b) ↔
      b ∈ Set.range (k0ToBcris O p OK)) ∧
    (∃ e : bc (zpToBcris O p) (etH O p OK X₀ i) ≅ bc (wittToBcris O p OK) (crysH p OK X₀ i),
      IsCrystallineComparison O p OK X₀ i e ∧
      e.hom.hom '' (fixedPoints (galoisExtend (zpToBcris O p) (galoisBcris O p OK)
          (fun g => autBcris_zp O p _) (etH O p OK X₀ i) (etaleRep O p OK X₀ i)) : Set _) =
        AddSubgroup.closure {y | ∃ b ∈ Set.range (k0ToBcris O p OK), ∃ h : crysH p OK X₀ i,
          y = b • bcUnit (wittToBcris O p OK) (crysH p OK X₀ i) h}) ∧
    Nonempty (fixedPoints (galoisExtend (zpToBdR O p) (galoisBdR O p OK)
        (fun g => autBdR_zp O p _) (etH O p OK X₀ i) (etaleRep O p OK X₀ i)) ≃+
      bc (okToK p OK) (H (FormalData.of p X₀).deRham i)) := by
  sorry

/-- The `p`-adic completion of the projective Weierstrass model of an elliptic curve over `O_K`
with good reduction (owner `AlgebraicModuliForArithmeticGeometry`). -/
def weierstrassModel (W : WeierstrassCurve OK) [W.IsElliptic] : ProperSmoothFormalScheme OK :=
  sorry

open Classical in
/-- (BMS1 Theorem 14.6; CR.3): for an elliptic curve
`E/O_K` with good reduction, `M = H^1_crys(E_k / W(k))` is free of rank 2 with Hodge numbers
`1, 1`; if `E_k` is ordinary (`E(k̄)[p] ≠ 0`) then `M = M₀ ⊕ M₁` with `φ M₀ = M₀`, `φ M₁ = p M₁`
(slopes `0, 1`); otherwise `φ² M = p M` (slopes `1/2, 1/2`). The identification with the Galois
period modules is `CP2.period_invariants_and_admissibility`; the clause on nonprojective generic
fibres is not stated. -/
theorem CP2.crystalline_geometric_examples (W : WeierstrassCurve OK) [W.IsElliptic] :
    Module.Free (residueWitt OK p) (crysH p OK (weierstrassModel OK W) 1) ∧
      Module.finrank (residueWitt OK p) (crysH p OK (weierstrassModel OK W) 1) = 2 ∧
      Module.finrank OK (H ((FormalData.of p (weierstrassModel OK W)).hodge 1) 0) = 1 ∧
      Module.finrank OK (H ((FormalData.of p (weierstrassModel OK W)).hodge 0) 1) = 1 ∧
      ((∃ P : (W.map ((IsLocalRing.residue O).comp (algebraMap OK O))).toAffine.Point,
          P ≠ 0 ∧ p • P = 0) →
        ∃ M₀ M₁ : Submodule (residueWitt OK p) (crysH p OK (weierstrassModel OK W) 1),
          IsCompl M₀ M₁ ∧
          Submodule.span (residueWitt OK p)
              ((FormalData.of p (weierstrassModel OK W)).crystallineFrobH 1 '' M₀) = M₀ ∧
          Submodule.span (residueWitt OK p)
              ((FormalData.of p (weierstrassModel OK W)).crystallineFrobH 1 '' M₁) =
            (Ideal.span {(p : residueWitt OK p)}) • M₁) ∧
      ((¬ ∃ P : (W.map ((IsLocalRing.residue O).comp (algebraMap OK O))).toAffine.Point,
          P ≠ 0 ∧ p • P = 0) →
        Submodule.span (residueWitt OK p) (Set.range
            ((FormalData.of p (weierstrassModel OK W)).crystallineFrobH 1 ∘
              (FormalData.of p (weierstrassModel OK W)).crystallineFrobH 1)) =
          (Ideal.span {(p : residueWitt OK p)}) • ⊤) := by
  sorry

end CP2

/-! ## AMMN Theorem 7.13: the good-reduction nearby-cycle pullback (Layer 3, the canonical period realization) -/

section Ammn

variable (O : Type u) [CommRing O] [IsDomain O] [IsLocalRing O] (p : ℕ) [Fact p.Prime]
  [Fact ¬IsUnit (p : O)] [IsAdicComplete (Ideal.span {(p : O)}) O] [IsIntegersOfC O]
  (OK : Type u) [CommRing OK] [IsDomain OK] [IsDiscreteValuationRing OK] [Algebra OK O]
  [IsLocalHom (algebraMap OK O)] [IsCompletedAlgClosureOf OK O p]

/-- `RΓ(𝔛_proét, τ≤i Rψ_* ℚ_p(i))` for `𝔛 = 𝔛₀ ⊗̂ O_C`.
Owner PR.4 extension: AMMN Definition 7.10 and Theorem 7.11, p.52. Truncation is on the
nearby-cycle sheaf before taking global sections. The full generic-fibre complex is not used. -/
def ammnNearbyCyclesTruncated (O : Type u) [CommRing O] [IsDomain O] [IsLocalRing O] (p : ℕ) [Fact p.Prime]
    [Fact ¬IsUnit (p : O)] [IsAdicComplete (Ideal.span {(p : O)}) O] [IsIntegersOfC O]
    (OK : Type u) [CommRing OK] [IsDomain OK] [IsDiscreteValuationRing OK] [Algebra OK O]
    [IsLocalHom (algebraMap OK O)] [IsCompletedAlgClosureOf OK O p]
    (X₀ : ProperSmoothFormalScheme OK) (i : ℕ) :
    DerivedCategory (ModuleCat.{u} ℚ_[p]) := sorry

/-- The derived fibre of `φ - p^i` on
`A_crys ⊗^L_{W(k)} RΓ_crys(𝔛̄₀/W(k))`, followed by inverting p, where `𝔛̄₀` is reduction
modulo a uniformizer. Owners CR.3 and PR.4 extension; this is not degreewise fixed vectors. -/
def ammnCrystallineEigenspace (O : Type u) [CommRing O] [IsDomain O] [IsLocalRing O] (p : ℕ) [Fact p.Prime]
    [Fact ¬IsUnit (p : O)] [IsAdicComplete (Ideal.span {(p : O)}) O] [IsIntegersOfC O]
    (OK : Type u) [CommRing OK] [IsDomain OK] [IsDiscreteValuationRing OK] [Algebra OK O]
    [IsLocalHom (algebraMap OK O)] [IsCompletedAlgClosureOf OK O p]
    (X₀ : ProperSmoothFormalScheme OK) (i : ℕ) :
    DerivedCategory (ModuleCat.{u} ℚ_[p]) := sorry

/-- `RΓ_dR(X₀/K) ⊗^L_K B_dR⁺` restricted to `ℚ_p`, with `X₀` the generic fibre of `𝔛₀`.
Owners DD.2/CR.3; AMMN Construction 7.12. Its finite Hodge filtration and the ξ-adic
coefficient filtration determine the convolution filtration, not scalar multiplication by ξ^i. -/
def ammnDeRhamTensor (O : Type u) [CommRing O] [IsDomain O] [IsLocalRing O] (p : ℕ) [Fact p.Prime]
    [Fact ¬IsUnit (p : O)] [IsAdicComplete (Ideal.span {(p : O)}) O] [IsIntegersOfC O]
    (OK : Type u) [CommRing OK] [IsDomain OK] [IsDiscreteValuationRing OK] [Algebra OK O]
    [IsLocalHom (algebraMap OK O)] [IsCompletedAlgClosureOf OK O p]
    (X₀ : ProperSmoothFormalScheme OK) :
    DerivedCategory (ModuleCat.{u} ℚ_[p]) := sorry

/-- `Fil≥i` of the preceding tensor filtration after the specified Hodge completion.
Owner DD.2 extension, AMMN Theorem 7.13 proof, pp.53–54. -/
def ammnFilteredDeRhamTensor (O : Type u) [CommRing O] [IsDomain O] [IsLocalRing O] (p : ℕ) [Fact p.Prime]
    [Fact ¬IsUnit (p : O)] [IsAdicComplete (Ideal.span {(p : O)}) O] [IsIntegersOfC O]
    (OK : Type u) [CommRing OK] [IsDomain OK] [IsDiscreteValuationRing OK] [Algebra OK O]
    [IsLocalHom (algebraMap OK O)] [IsCompletedAlgClosureOf OK O p]
    (X₀ : ProperSmoothFormalScheme OK) (i : ℕ) :
    DerivedCategory (ModuleCat.{u} ℚ_[p]) := sorry

/-- Specific maps obtained by transporting the graded Beilinson square in Layer 3 through
AMMN's three corner identifications. These are the constructed natural maps. The
connecting map is the one determined by that enhanced square and its commutativity homotopy. -/
structure AmmnSquareMaps (X₀ : ProperSmoothFormalScheme OK) (i : ℕ) where
  top : ammnNearbyCyclesTruncated O p OK X₀ i ⟶ ammnCrystallineEigenspace O p OK X₀ i
  left : ammnNearbyCyclesTruncated O p OK X₀ i ⟶ ammnFilteredDeRhamTensor O p OK X₀ i
  right : ammnCrystallineEigenspace O p OK X₀ i ⟶ ammnDeRhamTensor O p OK X₀
  bottom : ammnFilteredDeRhamTensor O p OK X₀ i ⟶ ammnDeRhamTensor O p OK X₀
  connecting : ammnDeRhamTensor O p OK X₀ ⟶
    (ammnNearbyCyclesTruncated O p OK X₀ i)⟦(1 : ℤ)⟧

/-- The canonical square maps of AMMN Theorem 7.13 for this model and weight.
No theorem below quantifies over values of `AmmnSquareMaps`. -/
def AmmnSquareMaps.of (X₀ : ProperSmoothFormalScheme OK) (i : ℕ) :
    AmmnSquareMaps O p OK X₀ i := sorry

/-- AMMN Theorem 7.13, pp.53–54:
commutativity and the distinguished-triangle shadow of its homotopy cartesian square. The
middle arrow is `(right, -bottom)`, not an ordinary categorical pullback in the triangulated
category. The enhanced homotopy, functoriality, and agreement with classical Layer 3/Layer 2 maps are
not encoded by this 1-categorical signature . -/
theorem CP2.nearby_cycle_crystalline_de_rham_pullback
    (X₀ : ProperSmoothFormalScheme OK) (i : ℕ) :
    let d := AmmnSquareMaps.of O p OK X₀ i
    d.top ≫ d.right = d.left ≫ d.bottom ∧
      Pretriangulated.Triangle.mk (biprod.lift d.top d.left) (biprod.desc d.right (-d.bottom))
        d.connecting ∈ distTriang (DerivedCategory (ModuleCat.{u} ℚ_[p])) := by
  sorry

end Ammn

/-! ## Layer 4: semistable and logarithmic comparison -/

section CP4Defs

variable (O : Type u) [CommRing O] [IsDomain O] [IsLocalRing O] (p : ℕ) [Fact p.Prime]
  [Fact ¬IsUnit (p : O)] [IsAdicComplete (Ideal.span {(p : O)}) O] [IsIntegersOfC O]
  (OK : Type u) [CommRing OK] [IsDomain OK] [IsDiscreteValuationRing OK] [Algebra OK O]
  [IsLocalHom (algebraMap OK O)] [IsCompletedAlgClosureOf OK O p]

/-- The Frobenius of `F̂^{nr} = W(k̄)[1/p]` (owner `PadicHodgeTheory:R06.1`). -/
def fnrFrobenius : Fnr O p →+* Fnr O p := sorry

theorem fnrToBst_frobenius :
    (fnrToBst O p).comp (fnrFrobenius O p) = (bstFrobenius O p).comp (fnrToBst O p) := by
  sorry

theorem qpToBst_frobenius :
    (qpToBst O p).comp (RingHom.id ℚ_[p]) = (bstFrobenius O p).comp (qpToBst O p) := by
  sorry

/-- `Fil^r (B_dR ⊗_{ℚ_p} V) = Fil^r B_dR ⊗ V` (owner `PadicHodgeTheory:R06.1`). -/
def periodFiltrationQ (V : ModuleCat.{u} ℚ_[p]) (r : ℤ) : AddSubgroup (bc (qpToBdR O p) V) :=
  sorry

/-- Period data of one cohomological degree of a variety or rigid space over `K`, as its owners
construct it: the étale realization with its `G_K`-action, the Hyodo–Kato realization over
`F̂^{nr}` with Frobenius, monodromy and `G_K`-action, and the de Rham realization over `K` with its
Hodge filtration. Its specific values are `PeriodData.ofSemistable`, `.ofVariety` and `.ofRigid`;
no statement quantifies over it. -/
def PeriodData (O : Type u) (p : ℕ) (OK : Type u) : Type (u + 1) := sorry

namespace PeriodData

variable {O p OK}

/-- `H^r_ét(X_{K̄}, ℚ_p)` (owner `ClassicalAdicEtaleCohomology:H5`). -/
def etale (D : PeriodData O p OK) : ModuleCat.{u} ℚ_[p] := sorry
/-- Its `G_K`-action (owner H5). -/
def galois (D : PeriodData O p OK) : Representation ℚ_[p] (GK O OK) D.etale := sorry
/-- `H^r_HK` over `F̂^{nr}` (owner `CrystallineCohomology:CR.6`). -/
def hk (D : PeriodData O p OK) : ModuleCat.{u} (Fnr O p) := sorry
/-- Its Frobenius (owner CR.6). -/
def hkFrob (D : PeriodData O p OK) : D.hk →ₛₗ[fnrFrobenius O p] D.hk := sorry
/-- Its monodromy `N` with `Nφ = pφN` (owner CR.6). -/
def hkMonodromy (D : PeriodData O p OK) : D.hk →ₗ[Fnr O p] D.hk := sorry
/-- Its semilinear `G_K`-action, trivial on inertia in the semistable case (owner CR.6). -/
def hkGalois (D : PeriodData O p OK) : GK O OK →* AddMonoid.End D.hk := sorry
/-- `H^r_dR(X_K)` (owners CR.6, `AdicSpacesPartII:R3`). -/
def deRham (D : PeriodData O p OK) : ModuleCat.{u} (Kfield OK p) := sorry
/-- Its Hodge filtration (owners CR.6, R3). -/
def hodgeFil (D : PeriodData O p OK) : ℤ → Submodule (Kfield OK p) D.deRham := sorry

end PeriodData

namespace PeriodData

variable {O p OK}

/-- The diagonal `G_K`-action `g (b ⊗ d) = g b ⊗ g d` on `B_st ⊗_{F̂^{nr}} H_HK` (owner R06.1). -/
def hkGaloisBst (D : PeriodData O p OK) : GK O OK →* AddMonoid.End (bc (fnrToBst O p) D.hk) :=
  sorry

/-- An isomorphism `B_st ⊗_{ℚ_p} H_ét ≅ B_st ⊗_{F̂^{nr}} H_HK` is a `C_st` comparison when it is
compatible with Frobenius (`φ_{B_st} ⊗ 1` against `φ_{B_st} ⊗ φ_HK`), with monodromy
(`N_{B_st} ⊗ 1` against `N_{B_st} ⊗ 1 + 1 ⊗ N_HK`) and with `G_K` (diagonal on both sides). -/
def IsStComparison (D : PeriodData O p OK)
    (e : bc (qpToBst O p) D.etale ≅ bc (fnrToBst O p) D.hk) : Prop :=
  (∀ x, e.hom.hom (semilinearExtend (qpToBst O p) (RingHom.id ℚ_[p]) (bstFrobenius O p)
      (qpToBst_frobenius O p) D.etale LinearMap.id x) =
    semilinearExtend (fnrToBst O p) (fnrFrobenius O p) (bstFrobenius O p)
      (fnrToBst_frobenius O p) D.hk D.hkFrob (e.hom.hom x)) ∧
  (∀ x, e.hom.hom (derivationExtend (qpToBst O p) (bstMonodromy O p)
      (bstMonodromy_leibniz O p) (bstMonodromy_qp O p) D.etale 0 x) =
    derivationExtend (fnrToBst O p) (bstMonodromy O p)
      (bstMonodromy_leibniz O p) (bstMonodromy_fnr O p) D.hk D.hkMonodromy (e.hom.hom x)) ∧
  ∀ (g : GK O OK) x, e.hom.hom (galoisExtend (qpToBst O p) (galoisBst O p OK)
      (fun g => autBst_qp O p _) D.etale D.galois g x) = D.hkGaloisBst g (e.hom.hom x)

/-- An isomorphism `B_dR ⊗_{ℚ_p} H_ét ≅ B_dR ⊗_K H_dR` is a filtered de Rham comparison when it
is `G_K`-equivariant and carries the period filtration exactly onto the tensor-product
filtration (strictness). -/
def IsFilteredDRComparison (D : PeriodData O p OK)
    (e : bc (qpToBdR O p) D.etale ≅ bc (kToBdR O p OK) D.deRham) : Prop :=
  (∀ (g : GK O OK) x, e.hom.hom (galoisExtend (qpToBdR O p) (galoisBdR O p OK)
      (fun g => autBdR_qp O p _) D.etale D.galois g x) =
    galoisExtend (kToBdR O p OK) (galoisBdR O p OK) (fun g => autBdR_k O p OK g) D.deRham
      (Representation.trivial (Kfield OK p) (GK O OK) D.deRham) g (e.hom.hom x)) ∧
  ∀ r : ℤ, e.hom.hom '' (periodFiltrationQ O p D.etale r : Set _) =
    tensorFiltration O p OK D.deRham D.hodgeFil r

/-- The map `B_st ⊗ H_HK → B_dR ⊗ H_dR` given by the Hyodo–Kato isomorphism and the chosen
embedding `B_st → B_dR` (owners CR.6, R06.1). -/
def hkToDeRham (D : PeriodData O p OK) :
    bc (fnrToBst O p) D.hk →+ bc (kToBdR O p OK) D.deRham := sorry

/-- `(H_HK ⊗ B_st)^{φ = 1, N = 0} ∩ Fil⁰(H_dR ⊗ B_dR)`, through `hkToDeRham`. -/
def recoverySubgroup (D : PeriodData O p OK) : AddSubgroup (bc (fnrToBst O p) D.hk) where
  carrier := {y | semilinearExtend (fnrToBst O p) (fnrFrobenius O p) (bstFrobenius O p)
      (fnrToBst_frobenius O p) D.hk D.hkFrob y = y ∧
    derivationExtend (fnrToBst O p) (bstMonodromy O p)
      (bstMonodromy_leibniz O p) (bstMonodromy_fnr O p) D.hk D.hkMonodromy y = 0 ∧
    D.hkToDeRham y ∈ tensorFiltration O p OK D.deRham D.hodgeFil 0}
  add_mem' := sorry
  zero_mem' := sorry
  neg_mem' := sorry

end PeriodData

/-- The period data of `H^r` of the generic fibre of a proper semistable `O_K`-model (owners
`AInfCohomology:AI.6`, `CrystallineCohomology:CR.6`). -/
def PeriodData.ofSemistable (X : SemistableFormalScheme OK) (r : ℤ) : PeriodData O p OK := sorry

/-- The period data of `H^r` of a variety over `K`, with the h-descent Hyodo–Kato and de Rham
realizations of Beilinson (owners CR.6 extension, `AlgebraicModuliForArithmeticGeometry:R09.7`). -/
def PeriodData.ofVariety {X : AlgebraicGeometry.Scheme.{u}}
    (f : X ⟶ AlgebraicGeometry.Spec (CommRingCat.of (Kfield OK p)))
    [AlgebraicGeometry.LocallyOfFiniteType f] [AlgebraicGeometry.QuasiCompact f] [AlgebraicGeometry.IsSeparated f] (r : ℤ) : PeriodData O p OK := sorry

/-- The period data of `H^r` of a proper smooth rigid space over `K`, with the overconvergent
Hyodo–Kato realization of Colmez–Nizioł (owner CR.6 extension). -/
def PeriodData.ofRigid (X₀ : ProperSmoothRigid (Kfield OK p)) (r : ℤ) : PeriodData O p OK :=
  sorry

/-- The `C_st` comparison of a proper semistable model (ČK Theorem 9.5; constructed in
`CP4.semistable_period_comparison`). -/
def semistableStComparison (X : SemistableFormalScheme OK) (r : ℤ) :
    bc (qpToBst O p) (PeriodData.ofSemistable O p OK X r).etale ≅
      bc (fnrToBst O p) (PeriodData.ofSemistable O p OK X r).hk := sorry

/-- The `B_dR` comparison of a semistable model, obtained from the `C_st` comparison and the chosen
embedding `B_st → B_dR` (ČK Remark 9.6). -/
def semistableDRComparison (X : SemistableFormalScheme OK) (r : ℤ) :
    bc (qpToBdR O p) (PeriodData.ofSemistable O p OK X r).etale ≅
      bc (kToBdR O p OK) (PeriodData.ofSemistable O p OK X r).deRham := sorry

/-- Beilinson's `C_st` comparison of a variety over `K` (CN Theorem 6.2). -/
def varietyStComparison {X : AlgebraicGeometry.Scheme.{u}}
    (f : X ⟶ AlgebraicGeometry.Spec (CommRingCat.of (Kfield OK p)))
    [AlgebraicGeometry.LocallyOfFiniteType f] [AlgebraicGeometry.QuasiCompact f] [AlgebraicGeometry.IsSeparated f] (r : ℤ) :
    bc (qpToBst O p) (PeriodData.ofVariety O p OK f r).etale ≅
      bc (fnrToBst O p) (PeriodData.ofVariety O p OK f r).hk := sorry

/-- Its induced `B_dR` comparison (CN Theorem 6.2). -/
def varietyDRComparison {X : AlgebraicGeometry.Scheme.{u}}
    (f : X ⟶ AlgebraicGeometry.Spec (CommRingCat.of (Kfield OK p)))
    [AlgebraicGeometry.LocallyOfFiniteType f] [AlgebraicGeometry.QuasiCompact f] [AlgebraicGeometry.IsSeparated f] (r : ℤ) :
    bc (qpToBdR O p) (PeriodData.ofVariety O p OK f r).etale ≅
      bc (kToBdR O p OK) (PeriodData.ofVariety O p OK f r).deRham := sorry

/-- The `C_st` comparison of a proper smooth rigid space over `K` (CN Theorem 6.4). -/
def rigidStComparison (X₀ : ProperSmoothRigid (Kfield OK p)) (r : ℤ) :
    bc (qpToBst O p) (PeriodData.ofRigid O p OK X₀ r).etale ≅
      bc (fnrToBst O p) (PeriodData.ofRigid O p OK X₀ r).hk := sorry

/-- Its induced `B_dR` comparison (CN Theorem 6.4). -/
def rigidDRComparison (X₀ : ProperSmoothRigid (Kfield OK p)) (r : ℤ) :
    bc (qpToBdR O p) (PeriodData.ofRigid O p OK X₀ r).etale ≅
      bc (kToBdR O p OK) (PeriodData.ofRigid O p OK X₀ r).deRham := sorry

/-- Imported logarithmic `A_inf` data of a proper semistable model over `O_C` (owner
`AInfCohomology:AI.6`): the semistable `K_A`, its specializations and their comparison maps. -/
structure LogAinfData (X : SemistableFormalScheme O) where
  /-- The semistable `K_A` (AI.6). -/
  complex : DerivedCategory (ModuleCat.{u} (Ainf O p))
  /-- `RΓ_logdR(𝔛/O_C)` (AI.6/log-de-rham). -/
  logDeRham : DerivedCategory (ModuleCat.{u} O)
  /-- `RΓ_logcrys(𝔛_k / W(k))` over the `ℚ_{≥0}` log base (AI.6/global-crystalline). -/
  logCrysWitt : DerivedCategory (ModuleCat.{u} (residueWitt O p))
  /-- `RΓ_logcrys(𝔛_{O/p} / A_cris)` (AI.6/global-crystalline). -/
  logCrysAcris : DerivedCategory (ModuleCat.{u} (Acris O p))
  /-- The θ-log de Rham comparison (AI.6/log-de-rham). -/
  thetaComparison : (derivedBaseChange.{u} (WittVector.fontaineTheta O p)).obj complex ⟶ logDeRham
  /-- The Witt-log crystalline comparison (AI.6/global-crystalline). -/
  wittComparison : (completedBaseChange.{u} (wittReduction O p)
    (Ideal.span {(p : residueWitt O p)})).obj complex ⟶ logCrysWitt
  /-- The `A_cris`-log crystalline comparison (AI.6/global-crystalline). -/
  acrisComparison : (completedBaseChange.{u} (ainfToAcris O p)
    (Ideal.span {(p : Acris O p)})).obj complex ⟶ logCrysAcris
  /-- The μ-inverted étale comparison for proper `𝔛` (AI.6/etale-comparison). -/
  etaleComparison : ∀ ε : PreTilt O p, (derivedBaseChange.{u} (ainfToMu O p ε)).obj complex ⟶
    (derivedBaseChange.{u} (zpToMu O p ε)).obj (etaleCohomology p (X.generic p))

/-- The imported logarithmic data of a proper semistable model. -/
def LogAinfData.of (X : SemistableFormalScheme O) : LogAinfData O p X := sorry

/-- The logarithmic prismatic maps of `PrismaticCohomology:PR.8` on a semistable model (its targets
`log-crystalline-comparison`, `log-de-rham-comparison`, `etale-comparison-over-ainf`), as maps out
of the same `K_A`. -/
structure LogPrismaticData (X : SemistableFormalScheme O) where
  /-- PR.8's log crystalline map. -/
  crystalline : (completedBaseChange.{u} (ainfToAcris O p)
    (Ideal.span {(p : Acris O p)})).obj (LogAinfData.of O p X).complex ⟶
      (LogAinfData.of O p X).logCrysAcris
  /-- PR.8's log de Rham map. -/
  deRham : (derivedBaseChange.{u} (WittVector.fontaineTheta O p)).obj
      (LogAinfData.of O p X).complex ⟶ (LogAinfData.of O p X).logDeRham

/-- The imported PR.8 maps of a semistable model in PR.8's admitted chart class. -/
def LogPrismaticData.of (X : SemistableFormalScheme O) : LogPrismaticData O p X := sorry

/-- PR.8's admitted chart class: bounded, log smooth of Cartier type with exact charts (owner
PR.8). Stated as membership in a specific set of models. -/
def pr8ChartClass : Set (SemistableFormalScheme O) := sorry

/-- `K ⊗_{W(k)} H^r_HK(𝔛_k / W(k))` of a proper semistable model over the `ℕ → W(k), 1 ↦ 0` log
base (owner `CrystallineCohomology:CR.6`). -/
def hkK (X : SemistableFormalScheme OK) (r : ℤ) : ModuleCat.{u} (Kfield OK p) := sorry

/-- Its monodromy `N` (owner CR.6). -/
def hkMonodromyK (X : SemistableFormalScheme OK) (r : ℤ) :
    hkK p OK X r →ₗ[Kfield OK p] hkK p OK X r := sorry

/-- Nilpotency of HK monodromy (owner CR.6). -/
theorem hkMonodromyK_nilpotent (X : SemistableFormalScheme OK) (r : ℤ) :
    IsNilpotent (hkMonodromyK p OK X r) := by
  sorry

/-- The Hyodo–Kato isomorphism `ρ_π : K ⊗ H^r_HK ≅ H^r_dR(X_K)` attached to a uniformizer `π` of
`O_K` (owner CR.6). -/
def hkDeRhamIdentification (X : SemistableFormalScheme OK) (r : ℤ) (π : OK) :
    hkK p OK X r →+ (PeriodData.ofSemistable O p OK X r).deRham := sorry

/-- The `p`-adic logarithm of a unit, `log_K : O_K^× → K` (owner R06.1). -/
def logK (u : OKˣ) : Kfield OK p := sorry

/-- `exp(c N)` for a nilpotent `N` (owner R06.1). -/
def expNilpotent {M : Type u} [AddCommGroup M] [Module (Kfield OK p) M] (c : Kfield OK p)
    (N : M →ₗ[Kfield OK p] M) (hN : IsNilpotent N) : M →+ M := sorry

end CP4Defs

section CP4

variable (O : Type u) [CommRing O] [IsDomain O] [IsLocalRing O] (p : ℕ) [Fact p.Prime]
  [Fact ¬IsUnit (p : O)] [IsAdicComplete (Ideal.span {(p : O)}) O] [IsIntegersOfC O]

/-- (ČK §7.1–7.2, Corollary 5.43, Theorem 2.3): for a
proper semistable formal `O_C`-scheme with étale charts `t₀ ⋯ t_r = π′`, the θ-log de Rham, the
Witt-log crystalline (over the `ℚ_{≥0}` log base of `W(k)`), the `A_cris`-log crystalline and,
for every compatible system `ε`, the μ-inverted étale comparison maps of AI.6 are isomorphisms.
The carrier includes ČK §7.1's pure dimensionality hypothesis;
multiplicativity of the `A_cris` map is not asserted. -/
theorem CP4.logarithmic_integral_diagram (X : SemistableFormalScheme O) :
    IsIso (LogAinfData.of O p X).thetaComparison ∧ IsIso (LogAinfData.of O p X).wittComparison ∧
      IsIso (LogAinfData.of O p X).acrisComparison ∧
      ∀ ε : PreTilt O p, IsCompatibleRootsOfUnity O p ε →
        IsIso ((LogAinfData.of O p X).etaleComparison ε) := by
  sorry

/-- (ČK Proposition 9.2, Remark 9.3), after inverting `μ`:
the log crystalline cohomology over `W(k̄)` (the `ℚ_{≥0}` log base) and over `A_cris` become
isomorphic after base change to `B_st`. The `φ`- and `N`-compatibility (`N_HK ⊗ 1 + 1 ⊗ N_{B_st}`
against `1 ⊗ N_{B_st}`) and the descent to `W(k₀)` with the `ℕ` log base are not stated. -/
theorem CP4.hyodo_kato_log_base_adapter (X : SemistableFormalScheme O) (i : ℤ) :
    Nonempty (bc ((fnrToBst O p).comp (algebraMap (residueWitt O p) (Fnr O p)))
        (H (LogAinfData.of O p X).logCrysWitt i) ≅
      bc ((bcrisToBst O p).comp (acrisToBcris O p)) (H (LogAinfData.of O p X).logCrysAcris i)) := by
  sorry

/-- for a semistable model in PR.8's admitted chart class
(bounded, log smooth of Cartier type, exact charts), PR.8's log crystalline and log de Rham maps
(targets `PR.8/log-crystalline-comparison`, `PR.8/log-de-rham-comparison`) are the AI.6 comparison
maps. Nothing is asserted outside the chart class. -/
theorem CP4.log_prismatic_agreement (X : SemistableFormalScheme O) (hX : X ∈ pr8ChartClass O) :
    (LogPrismaticData.of O p X).crystalline = (LogAinfData.of O p X).acrisComparison ∧
      (LogPrismaticData.of O p X).deRham = (LogAinfData.of O p X).thetaComparison := by
  sorry

variable (OK : Type u) [CommRing OK] [IsDomain OK] [IsDiscreteValuationRing OK] [Algebra OK O]
  [IsLocalHom (algebraMap OK O)] [IsCompletedAlgClosureOf OK O p]

/-- (ČK Theorem 9.5): for a proper semistable `O_K`-model
`X` and every `r`, the comparison `B_st ⊗_{ℚ_p} H^r_ét(X_{K̄}, ℚ_p) ≅ B_st ⊗_{F̂^{nr}} H^r_HK` is
compatible with Frobenius, monodromy (`Nφ = pφN`) and `G_K`; hence `H^r_ét(X_{K̄}, ℚ_p)` is
semistable. -/
theorem CP4.semistable_period_comparison (X : SemistableFormalScheme OK) (r : ℤ) :
    (PeriodData.ofSemistable O p OK X r).IsStComparison (semistableStComparison O p OK X r) := by
  sorry

/-- (ČK Remark 9.6, Proposition 6.8): after the
chosen embedding `B_st → B_dR`, the induced `B_dR` comparison is `G_K`-equivariant and strict for
the Hodge filtration transported through the Hyodo–Kato identification. Its agreement with the
integral Layer 2 comparison (`deRhamComparison`, on `ℤ_p`-lattices) is not restated. -/
theorem CP4.semistable_filtered_bdr_agreement (X : SemistableFormalScheme OK) (r : ℤ) :
    (PeriodData.ofSemistable O p OK X r).IsFilteredDRComparison
      (semistableDRComparison O p OK X r) := by
  sorry

/-- With `T_{πu} = T_π + log_K(u)` and period monodromy `N = -d/dT`, normalize
`ρ_π` by evaluating total-monodromy-horizontal sections at `T_π = 0`. Then
`ρ_{πu} = ρ_π ∘ exp(-log_K(u) N_HK)`; the transport satisfies the unit cocycle.
ČK §9.1 gives the torsor-coordinate translation; the arithmetic chart adapter is CR.6. -/
theorem CP4.uniformizer_change_and_monodromy (X : SemistableFormalScheme OK) (r : ℤ)
    (π : OK) (u : OKˣ) (hπ : Irreducible π) :
    hkDeRhamIdentification O p OK X r (π * u) =
      (hkDeRhamIdentification O p OK X r π).comp
        (expNilpotent p OK (-logK p OK u) (hkMonodromyK p OK X r)
          (hkMonodromyK_nilpotent p OK X r)) := by
  sorry

/-- A Tate curve `E_q` over `O_K` (`q` a nonzero nonunit) with its semistable model (owner
`AlgebraicModuliForArithmeticGeometry`; the Tate-curve Hyodo–Kato computation is CR.6's). -/
def tateCurveModel (q : OK) (hq : q ≠ 0) (hq' : ¬ IsUnit q) : SemistableFormalScheme OK := sorry

/-- in good reduction the monodromy of every `H^r_HK`
vanishes, so the semistable comparison is the crystalline one of Layer 3; for a Tate curve the
monodromy of `H^1_HK` is nonzero, so `H^1_ét(E_{q,K̄}, ℚ_p)` is semistable and not crystalline. -/
theorem CP4.semistable_geometric_examples :
    (∀ (X₀ : ProperSmoothFormalScheme OK) (r : ℤ),
      (PeriodData.ofSemistable O p OK X₀.toSemistable r).hkMonodromy = 0) ∧
    ∀ (q : OK) (hq : q ≠ 0) (hq' : ¬ IsUnit q),
      (PeriodData.ofSemistable O p OK (tateCurveModel OK q hq hq') 1).hkMonodromy ≠ 0 := by
  sorry

open AlgebraicGeometry in
/-- (CN Theorem 6.2, after Beilinson): for every
variety `X` over `K` (no smoothness or properness) and every `r`, the comparison
`B_st ⊗ H^r_ét(X_{K̄}, ℚ_p) ≅ B_st ⊗_{F^{nr}} H^r_HK(X_{K̄})` preserves `φ`, `N` and `G_K`, and
induces a filtered `B_dR` isomorphism with `H^r_dR(X_K)`; the Hyodo–Kato and de Rham realizations
are the h-descent ones. -/
theorem CP4.algebraic_beilinson_period_comparison {X : Scheme.{u}}
    (f : X ⟶ Spec (CommRingCat.of (Kfield OK p))) [LocallyOfFiniteType f] [QuasiCompact f] [IsSeparated f] (r : ℤ) :
    (PeriodData.ofVariety O p OK f r).IsStComparison (varietyStComparison O p OK f r) ∧
      (PeriodData.ofVariety O p OK f r).IsFilteredDRComparison (varietyDRComparison O p OK f r) := by
  sorry

open AlgebraicGeometry in
/-- (CN Theorem 6.2, (6.3); Remark 6.7):
`H^r_ét(X_{K̄}, ℚ_p) ≅ (H^r_HK ⊗ B_st)^{φ = 1, N = 0} ∩ Fil⁰(H^r_dR ⊗ B_dR)`. The two Hom
descriptions (`Hom^sm_{G_K}(H^r_ét, B_st) ≅ (H^r_HK)^*` and `Hom_{G_K}(H^r_ét, B_dR) ≅ (H^r_dR)^*`)
are not stated. -/
theorem CP4.algebraic_period_recovery_and_duals {X : Scheme.{u}}
    (f : X ⟶ Spec (CommRingCat.of (Kfield OK p))) [LocallyOfFiniteType f] [QuasiCompact f] [IsSeparated f] (r : ℤ) :
    Nonempty ((PeriodData.ofVariety O p OK f r).etale ≃+
      (PeriodData.ofVariety O p OK f r).recoverySubgroup) := by
  sorry

/-- (CN Theorem 6.4): for a proper smooth
rigid space `X₀` over `K`, the `C_st` comparison with the overconvergent Hyodo–Kato realization
over `F^{nr}` preserves `φ`, `N` and `G_K` and induces the filtered `B_dR` comparison; the
`G_K`-action on `H_HK` may be nontrivial on inertia (potential semistability). -/
theorem CP4.proper_rigid_potential_semistable_comparison (X₀ : ProperSmoothRigid (Kfield OK p))
    (r : ℤ) :
    (PeriodData.ofRigid O p OK X₀ r).IsStComparison (rigidStComparison O p OK X₀ r) ∧
      (PeriodData.ofRigid O p OK X₀ r).IsFilteredDRComparison (rigidDRComparison O p OK X₀ r) := by
  sorry

end CP4

section CP4C

variable (O : Type u) [CommRing O] [IsDomain O] [IsLocalRing O] (p : ℕ) [Fact p.Prime]
  [Fact ¬IsUnit (p : O)] [IsAdicComplete (Ideal.span {(p : O)}) O] [IsIntegersOfC O]

/-- Scalar extension to `F̂^{nr}` of `H^r_HK(X)` over `F^{nr}` for a proper smooth rigid space over `C` (Colmez–Nizioł; owner
`CrystallineCohomology:CR.6` extension). -/
def rigidHKC (X : ProperSmoothRigid (Cfield O p)) (r : ℤ) : ModuleCat.{u} (Fnr O p) := sorry
/-- Its Frobenius (owner CR.6). -/
def rigidHKCFrob (X : ProperSmoothRigid (Cfield O p)) (r : ℤ) :
    rigidHKC O p X r →ₛₗ[fnrFrobenius O p] rigidHKC O p X r := sorry
/-- Its monodromy (owner CR.6). -/
def rigidHKCMonodromy (X : ProperSmoothRigid (Cfield O p)) (r : ℤ) :
    rigidHKC O p X r →ₗ[Fnr O p] rigidHKC O p X r := sorry
/-- The filtration `Im[H^r(Fil^i K_dR⁺(X)) → H^r(K_dR⁺(X))]`, extended to `B_dR` (this roadmap,
CN §6.2.3). -/
def canonicalBdrFiltration (X : ProperSmoothRigid (Cfield O p)) (r i : ℤ) :
    AddSubgroup (bc (bdrPlusToBdR O p) (H (CanonicalBdrCohomology O p X) r)) := sorry
/-- The `C_st` comparison over `C` (CN Theorem 6.8). -/
def rigidStComparisonC (X : ProperSmoothRigid (Cfield O p)) (r : ℤ) :
    bc (zpToBst O p) (H (etaleCohomology p X) r) ⟶ bc (fnrToBst O p) (rigidHKC O p X r) := sorry

theorem zpToBst_frobenius :
    (zpToBst O p).comp (RingHom.id ℤ_[p]) = (bstFrobenius O p).comp (zpToBst O p) := by
  sorry

/-- (CN Theorem 6.8, Remark 6.10): for `X` proper
smooth over `C`, the `C_st` comparison with `H^r_HK(X)` is an isomorphism compatible with `φ` and
`N` (no `G_K`-action without descent), and the `B_dR` comparison of Layer 2 carries the filtration
`Im[H^r(Fil^i K_dR⁺) → H^r(K_dR⁺)] ⊗ B_dR` onto the period filtration: a filtered statement that
the free `B_dR⁺`-lattice alone does not give. -/
theorem CP4.proper_rigid_c_period_comparison (X : ProperSmoothRigid (Cfield O p)) (r : ℤ) :
    IsIso (rigidStComparisonC O p X r) ∧
      (∀ x, (rigidStComparisonC O p X r).hom (semilinearExtend (zpToBst O p) (RingHom.id ℤ_[p])
          (bstFrobenius O p) (zpToBst_frobenius O p) _ LinearMap.id x) =
        semilinearExtend (fnrToBst O p) (fnrFrobenius O p) (bstFrobenius O p)
          (fnrToBst_frobenius O p) _ (rigidHKCFrob O p X r) ((rigidStComparisonC O p X r).hom x)) ∧
      (∀ x, (rigidStComparisonC O p X r).hom
          (derivationExtend (zpToBst O p) (bstMonodromy O p)
            (bstMonodromy_leibniz O p) (bstMonodromy_zp O p) _ 0 x) =
        derivationExtend (fnrToBst O p) (bstMonodromy O p)
          (bstMonodromy_leibniz O p) (bstMonodromy_fnr O p) _ (rigidHKCMonodromy O p X r)
          ((rigidStComparisonC O p X r).hom x)) ∧
      ∀ i : ℤ, (bdrEtaleComparisonH O p X r).hom '' (canonicalBdrFiltration O p X r i : Set _) =
        periodFiltration O p (H (etaleCohomology p X) r) i := by
  sorry

end CP4C

section CP4Curve

variable (O : Type u) [CommRing O] [IsDomain O] [IsLocalRing O] (p : ℕ) [Fact p.Prime]
  [Fact ¬IsUnit (p : O)] [IsAdicComplete (Ideal.span {(p : O)}) O] [IsIntegersOfC O]
  (OK : Type u) [CommRing OK] [IsDomain OK] [IsDiscreteValuationRing OK] [Algebra OK O]
  [IsLocalHom (algebraMap OK O)] [IsCompletedAlgClosureOf OK O p]

/-- Proper smooth geometrically connected curves over `K` (owner
`AlgebraicModuliForArithmeticGeometry`). -/
def ProperSmoothCurve (OK : Type u) (p : ℕ) : Type (u + 1) := sorry
/-- The analytification of a curve (owner `ClassicalAdicEtaleCohomology:H5`). -/
def ProperSmoothCurve.analytify (X : ProperSmoothCurve OK p) : ProperSmoothRigid (Kfield OK p) :=
  sorry
/-- `H⁰(X_K, Ω¹)` (owner `AdicSpacesPartII:R3`). -/
def ProperSmoothCurve.differentials (X : ProperSmoothCurve OK p) : ModuleCat.{u} (Kfield OK p) :=
  sorry
/-- Scalar extension to `F̂^{nr}` of `D_pst(V) = (B_st ⊗ V)^{G_L-smooth}` (owner
`PadicHodgeTheory:R06.3`). -/
def PeriodData.dpst (D : PeriodData O p OK) : ModuleCat.{u} (Fnr O p) := sorry

/-- (CDN Proposition 3.12, first proof
paragraph): for a proper smooth curve over a finite extension `K/ℚ_p`, `V = H^1_ét(X_{K̄}, ℚ_p)` has Hodge–Tate weights
`0, −1` (`Fil⁰ H^1_dR = H^1_dR`, `Fil² = 0`), `D_pst(V) ≅ H^1_HK`, and `Fil¹ H^1_dR ≅ H⁰(Ω¹)`.
No semistability over `K` itself is asserted. -/
theorem CP4.proper_curve_potential_period_interface (X : ProperSmoothCurve OK p)
    (fQp : ℚ_[p] →+* Kfield OK p)
    (hfinite : letI := fQp.toAlgebra; Module.Finite ℚ_[p] (Kfield OK p)) :
    (PeriodData.ofRigid O p OK X.analytify 1).hodgeFil 0 = ⊤ ∧
      (PeriodData.ofRigid O p OK X.analytify 1).hodgeFil 2 = ⊥ ∧
      Nonempty ((PeriodData.ofRigid O p OK X.analytify 1).dpst ≅
        (PeriodData.ofRigid O p OK X.analytify 1).hk) ∧
      Nonempty (↥((PeriodData.ofRigid O p OK X.analytify 1).hodgeFil 1) ≃ₗ[Kfield OK p]
        X.differentials) := by
  sorry

end CP4Curve

/-! ## Layer 5: integral torsion inequalities and lattice recovery -/

/-- `M` has no `a`-torsion: `a • x = 0` forces `x = 0`. -/
def IsATorsionFree (R : Type*) [CommRing R] (M : Type*) [AddCommGroup M] [Module R M] (a : R) :
    Prop :=
  ∀ x : M, a • x = 0 → x = 0

section CP5

variable (O : Type u) [CommRing O] [IsDomain O] [IsLocalRing O] (p : ℕ) [Fact p.Prime]
  [Fact ¬IsUnit (p : O)] [IsAdicComplete (Ideal.span {(p : O)}) O] [IsIntegersOfC O]

/-- `BKF(H^i_ét(X, ℤ_p))`: the finite free Breuil–Kisin–Fargues module that AI.2's Fargues
equivalence attaches to the pair of `H^i_ét(X, ℤ_p)` (torsion-free) and the `B_dR⁺`-lattice
`H^i(K_dR⁺(X)) ⊂ H^i_ét ⊗ B_dR` (owner `AInfCohomology:AI.2`). -/
def farguesModule (X : ProperSmoothFormalScheme O) (i : ℤ) : ModuleCat.{u} (Ainf O p) := sorry

/-- (BMS1 Remarks 14.4, 14.7, from
AI.5's Lemma 4.18): `H^i_crys(𝔛_k / W(k))` is `p`-torsion-free if and only if `H^i_dR(𝔛 / O_C)` is;
then `H^i_{A_inf}(𝔛)` is finite free and `H^i_ét(X_C, ℤ_p)` is torsion-free. No converse from
étale torsion-freeness is asserted. -/
theorem CP5.crystalline_de_rham_torsionfreeness_equivalence (X : ProperSmoothFormalScheme O)
    (i : ℤ) :
    (IsATorsionFree (residueWitt O p) (H (FormalData.of p X).crystalline i) (p : residueWitt O p) ↔
      IsATorsionFree O (H (FormalData.of p X).deRham i) (p : O)) ∧
    (IsATorsionFree (residueWitt O p) (H (FormalData.of p X).crystalline i) (p : residueWitt O p) →
      Module.Free (Ainf O p) (H (AinfData.of O p X).complex i) ∧
        Module.Finite (Ainf O p) (H (AinfData.of O p X).complex i) ∧
        IsATorsionFree ℤ_[p] (H (etaleCohomology p (X.generic p)) i) (p : ℤ_[p])) := by
  sorry

/-- (BMS1 Theorem 14.5(ii)): for every
`n ≥ 0`, `length_{W(k)}(H^i_crys(𝔛_k/W(k))_tor / p^n) ≥ length_{ℤ_p}(H^i_ét(X, ℤ_p)_tor / p^n)`;
in particular crystalline torsion-freeness implies étale torsion-freeness; and the ranks agree. -/
theorem CP5.integral_torsion_length_inequality_over_C (X : ProperSmoothFormalScheme O) (i : ℤ) :
    (∀ n : ℕ, torsionLength ℤ_[p] (H (etaleCohomology p (X.generic p)) i) (p : ℤ_[p]) n ≤
      torsionLength (residueWitt O p) (H (FormalData.of p X).crystalline i)
        (p : residueWitt O p) n) ∧
    (IsATorsionFree (residueWitt O p) (H (FormalData.of p X).crystalline i) (p : residueWitt O p) →
      IsATorsionFree ℤ_[p] (H (etaleCohomology p (X.generic p)) i) (p : ℤ_[p])) ∧
    Module.finrank (residueWitt O p) (H (FormalData.of p X).crystalline i) =
      Module.finrank ℤ_[p] (H (etaleCohomology p (X.generic p)) i) := by
  sorry

/-- (BMS1 Theorem 14.5(iii)). Tier 1: if `H^i_crys(𝔛_k/W(k))`
is `p`-torsion-free, then `H^i_{A_inf}(𝔛)` is finite free, isomorphic to `BKF(H^i_ét(X, ℤ_p))`,
and `H^i_{A_inf}(𝔛) ⊗ W(k) → H^i(K_A ⊗^L W(k))` is injective. Tier 2: if moreover
`H^{i+1}_crys(𝔛_k/W(k))` is `p`-torsion-free, that map is an isomorphism, so `H^i_crys` with its
Frobenius is recovered from `H^i_ét` with its `B_dR⁺`-lattice. -/
theorem CP5.lattice_recovery_over_C (X : ProperSmoothFormalScheme O) (i : ℤ)
    (hi : IsATorsionFree (residueWitt O p) (H (FormalData.of p X).crystalline i)
      (p : residueWitt O p)) :
    Module.Free (Ainf O p) (H (AinfData.of O p X).complex i) ∧
      Nonempty (H (AinfData.of O p X).complex i ≅ farguesModule O p X i) ∧
      Mono (baseChangeHomologyMap (wittReduction O p) (AinfData.of O p X).complex i) ∧
      (IsATorsionFree (residueWitt O p) (H (FormalData.of p X).crystalline (i + 1))
          (p : residueWitt O p) →
        IsIso (baseChangeHomologyMap (wittReduction O p) (AinfData.of O p X).complex i)) := by
  sorry

/-- (ČK Theorem 7.9), imported from AI.6: for a
proper semistable `𝔛` over `O_C` and all `n ≥ 0`,
`length_{ℤ_p}(H^i_ét(X_C, ℤ_p)_tor / p^n) ≤ length_{W(k)}(H^i_logcrys(𝔛_k / W(k))_tor / p^n)`. The
finite-coefficient version is not stated. -/
theorem CP5.semistable_crystalline_torsion_export (X : SemistableFormalScheme O) (i : ℤ)
    (n : ℕ) :
    torsionLength ℤ_[p] (H (etaleCohomology p (X.generic p)) i) (p : ℤ_[p]) n ≤
      torsionLength (residueWitt O p) (H (LogAinfData.of O p X).logCrysWitt i)
        (p : residueWitt O p) n := by
  sorry

/-- The normalized length `v_{O_C}` of a finitely presented torsion `O_C`-module (valuation of
its Fitting ideal `Fitt₀`, with `v(p) = 1`) (owners `AInfCohomology:AI.5`, AI.6). -/
def normalizedLength (M : ModuleCat.{u} O) : ℝ := sorry

/-- (ČK §7.10, Lemma 7.11, Theorem 7.12):
`length_{ℤ_p}(H^i_ét(X_C, ℤ_p)_tor / p^n) ≤ v_{O_C}(H^i_logdR(𝔛 / O_C)_tor / p^n)` with the
normalized length `v(p) = 1`, not the unscaled module length. -/
theorem CP5.semistable_normalized_de_rham_torsion_export (X : SemistableFormalScheme O) (i : ℤ)
    (n : ℕ) :
    ((torsionLength ℤ_[p] (H (etaleCohomology p (X.generic p)) i) (p : ℤ_[p]) n).toNat : ℝ) ≤
      normalizedLength O (ModuleCat.of O (↥(Submodule.torsion O (H (LogAinfData.of O p X).logDeRham i))
        ⧸ ((Ideal.span {(p : O)}) ^ n • ⊤ :
          Submodule O ↥(Submodule.torsion O (H (LogAinfData.of O p X).logDeRham i))))) := by
  sorry

/-- (BMS1 Theorem 2.10): there is a smooth
projective surface `H` over `O_C` with `H^2_ét(H_C, ℤ_p)_tor ≅ ℤ/p²` and
`H^2_crys(H_k/W(k))_tor ≅ k ⊕ k`; the length inequality holds (`1 ≤ 2` at `n = 1`, `2 ≤ 2` for
`n ≥ 2`) but étale torsion is not a subquotient of crystalline torsion. Projectivity is left out. -/
theorem CP5.degenerating_group_torsion_counterexample :
    ∃ X : ProperSmoothFormalScheme O,
      Nonempty (↥(Submodule.torsion ℤ_[p] (H (etaleCohomology p (X.generic p)) 2)) ≃+
        ZMod (p ^ 2)) ∧
      Nonempty (↥(Submodule.torsion (residueWitt O p) (H (FormalData.of p X).crystalline 2)) ≃+
        (IsLocalRing.ResidueField O × IsLocalRing.ResidueField O)) := by
  sorry

end CP5


section CP5K

variable (O : Type u) [CommRing O] [IsDomain O] [IsLocalRing O] (p : ℕ) [Fact p.Prime]
  [Fact ¬IsUnit (p : O)] [IsAdicComplete (Ideal.span {(p : O)}) O] [IsIntegersOfC O]
  (OK : Type u) [CommRing OK] [IsDomain OK] [IsDiscreteValuationRing OK] [Algebra OK O]
  [IsLocalHom (algebraMap OK O)] [IsCompletedAlgClosureOf OK O p]

/-- (BMS1 Theorem 14.6(ii)): over a complete discretely
valued `O_K` with perfect residue field, for all `n ≥ 0`,
`length_{W(k)}(H^i_crys(𝔛_k/W(k))_tor / p^n) ≥ length_{ℤ_p}(H^i_ét(X_C, ℤ_p)_tor / p^n)`. -/
theorem CP5.dvr_torsion_length_inequality (X₀ : ProperSmoothFormalScheme OK) (i : ℤ) (n : ℕ) :
    torsionLength ℤ_[p] (etH O p OK X₀ i) (p : ℤ_[p]) n ≤
      torsionLength (residueWitt OK p) (crysH p OK X₀ i) (p : residueWitt OK p) n := by
  sorry

/-- (BMS1 inequality (1), from Theorem 1.1(ii)):
`dim_k H^i_dR(𝔛_k) ≥ dim_{𝔽_p} H^i_ét(X_C, 𝔽_p)` for every `i`. -/
theorem CP5.mod_p_de_rham_dimension_bound (X₀ : ProperSmoothFormalScheme OK) (i : ℤ) :
    Module.finrank (ZMod p)
        (H (etaleCohomologyModP p ((X₀.baseChange (algebraMap OK O)).generic p)) i) ≤
      Module.finrank (IsLocalRing.ResidueField OK) (H (FormalData.of p X₀).deRhamResidue i) := by
  sorry

/-- Kisin's Breuil–Kisin module `BK(T)` over `𝔖 = W(k)[[u]]` of the `G_K`-stable lattice
`T = H^i_ét(X_C, ℤ_p)` in the crystalline representation `H^i_ét(X_C, ℚ_p)`, for the fixed
uniformizer and compatible `p`-power roots (owner `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4`,
all-weight extension; the all-weight supplier contract). -/
def kisinModule (X₀ : ProperSmoothFormalScheme OK) (i : ℤ) :
    ModuleCat.{u} (PowerSeries (residueWitt OK p)) := sorry

/-- `𝔖 → W(k)`, `u ↦ 0`, the Frobenius on `W(k)` (BMS1 p.4). -/
def kisinToWitt : PowerSeries (residueWitt OK p) →+* residueWitt OK p :=
  (WittVector.frobenius : residueWitt OK p →+* residueWitt OK p).comp PowerSeries.constantCoeff

/-- (BMS1 Theorem 14.6(iii), Proposition 4.34):
if `H^i_crys(𝔛₀,k/W(k))` and `H^{i+1}_crys(𝔛₀,k/W(k))` are `p`-torsion-free, then
`BK(H^i_ét(X_C, ℤ_p)) ⊗_{𝔖} W(k) ≅ H^i_crys(𝔛₀,k/W(k))` along `u ↦ 0` and Frobenius on `W(k)`.
Compatibility with Frobenius and the equality as lattices inside the common `W(k)[1/p]`-space are
not stated. -/
theorem CP5.dvr_lattice_recovery_via_breuil_kisin (X₀ : ProperSmoothFormalScheme OK) (i : ℤ)
    (hi : IsATorsionFree (residueWitt OK p) (crysH p OK X₀ i) (p : residueWitt OK p))
    (hi' : IsATorsionFree (residueWitt OK p) (crysH p OK X₀ (i + 1)) (p : residueWitt OK p)) :
    Nonempty (bc (kisinToWitt p OK) (kisinModule p OK X₀ i) ≅ crysH p OK X₀ i) := by
  sorry

/-- The Fontaine–Laffaille module of a `G_K`-stable lattice with Hodge–Tate weights in
`[0, p − 2]` over an absolutely unramified `K` (owner
`FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3`). -/
def fontaineLaffaille (X₀ : ProperSmoothFormalScheme OK) (i : ℤ) :
    ModuleCat.{u} (residueWitt OK p) := sorry

/-- (R07.3, R07.4, R06.4; BMS1 §4.4): for `K`
absolutely unramified (`p` generates the maximal ideal of `O_K`), `0 ≤ i ≤ p − 2` and
`H^i_crys` torsion-free, the Fontaine–Laffaille module of `H^i_ét(X_C, ℤ_p)` is
`H^i_crys(𝔛₀,k/W(k))`. The restricted endpoint `[0, p − 1]` subcategories, `p = 2` and the
Breuil–Kisin branch are not stated. -/
theorem CP5.small_weight_integral_interface (X₀ : ProperSmoothFormalScheme OK) (i : ℤ)
    (hK : IsLocalRing.maximalIdeal OK = Ideal.span {(p : OK)}) (hi : 0 ≤ i)
    (hip : i ≤ (p : ℤ) - 2)
    (htf : IsATorsionFree (residueWitt OK p) (crysH p OK X₀ i) (p : residueWitt OK p)) :
    Nonempty (fontaineLaffaille p OK X₀ i ≅ crysH p OK X₀ i) := by
  sorry

/-- `L_dR(T) = (M(T) ⊗_{A_inf, θ} O_C)^{G_K}` for `T = H^i_ét`, as an additive subgroup of
`H^i_dR(X_K)` (owner `AInfCohomology:AI.6/de-rham-lattice-functor`). -/
def latticeDR (X : SemistableFormalScheme OK) (i : ℤ) :
    AddSubgroup (PeriodData.ofSemistable O p OK X i).deRham := sorry
/-- The image of `H^i_logdR(𝔛 / O_K)` in `H^i_dR(X_K)` (owner AI.6). -/
def logDeRhamImage (X : SemistableFormalScheme OK) (i : ℤ) :
    AddSubgroup (PeriodData.ofSemistable O p OK X i).deRham := sorry
/-- `H^i_logdR(𝔛 / O_K)` (owner AI.6). -/
def logDeRhamOK (X : SemistableFormalScheme OK) (i : ℤ) : ModuleCat.{u} OK := sorry

/-- (ČK Theorem 8.7, Remark 8.8; AI.6): for a
proper flat semistable model with `H^i_logdR` and `H^{i+1}_logdR` both free over `O_K`,
`L_dR(H^i_ét) = H^i_logdR` inside `H^i_dR(X_K)`, so the lattice is independent of such a model. -/
theorem CP5.functorial_log_de_rham_lattice_export (X : SemistableFormalScheme OK) (i : ℤ)
    (hi : Module.Free OK (logDeRhamOK OK X i)) (hi' : Module.Free OK (logDeRhamOK OK X (i + 1))) :
    latticeDR O p OK X i = logDeRhamImage O p OK X i := by
  sorry

/-- (BMS1 Theorem 2.1, Proposition 2.2), over
`O_K ≅ ℤ₂` (`p = 2`, maximal ideal `(2)`, residue field `𝔽₂`): there is a smooth projective
geometrically connected surface `X` whose geometric generic fibre has all `H^i_ét(X_C, ℤ₂)` free,
while `H^2_crys(X_{𝔽₂}/ℤ₂)_tor ≅ 𝔽₂`. Projectivity and geometric connectedness are left out. -/
theorem CP5.enriques_torsion_counterexample (h2 : p = 2)
    (hK : IsLocalRing.maximalIdeal OK = Ideal.span {(p : OK)})
    (hk : Nat.card (IsLocalRing.ResidueField OK) = 2) :
    ∃ X : ProperSmoothFormalScheme OK,
      (∀ i : ℤ, IsATorsionFree ℤ_[p] (etH O p OK X i) (p : ℤ_[p])) ∧
      Nonempty (↥(Submodule.torsion (residueWitt OK p) (crysH p OK X 2)) ≃+ ZMod 2) := by
  sorry

/-- (BMS1 Remark 2.4), over
`O_K ≅ ℤ₂`: two lifts `D` and `D′ = S × E` of the same special fibre have different torsion in
`H^2_ét` of the geometric generic fibre, so integral étale cohomology (and `RΓ_{A_inf}`) is not a
function of the special fibre. -/
theorem CP5.special_fibre_does_not_determine_integral_etale (h2 : p = 2)
    (hK : IsLocalRing.maximalIdeal OK = Ideal.span {(p : OK)})
    (hk : Nat.card (IsLocalRing.ResidueField OK) = 2) :
    ∃ X X' : ProperSmoothFormalScheme OK,
      Nonempty (X.specialFibre ≅ X'.specialFibre) ∧
      ¬ Nonempty (↥(Submodule.torsion ℤ_[p] (etH O p OK X 2)) ≃+
        ↥(Submodule.torsion ℤ_[p] (etH O p OK X' 2))) := by
  sorry

end CP5K

/-! ## Layer 6: relative, product and arithmetic comparisons -/

section CP6

variable (O : Type u) [CommRing O] [IsDomain O] [IsLocalRing O] (p : ℕ) [Fact p.Prime]
  [Fact ¬IsUnit (p : O)] [IsAdicComplete (Ideal.span {(p : O)}) O] [IsIntegersOfC O]
  (OK : Type u) [CommRing OK] [IsDomain OK] [IsDiscreteValuationRing OK] [Algebra OK O]
  [IsLocalHom (algebraMap OK O)] [IsCompletedAlgClosureOf OK O p]

/-- A proper smooth rigid space with an algebraic proper smooth model; the comparison
statements using Betts–Stix are restricted to this range. -/
def IsAlgebraizable (X : ProperSmoothRigid (Kfield OK p)) : Prop :=
  ∃ (Y : AlgebraicGeometry.Scheme.{u})
    (f : Y ⟶ AlgebraicGeometry.Spec (CommRingCat.of (Kfield OK p)))
    (hp : AlgebraicGeometry.IsProper f) (hs : AlgebraicGeometry.Smooth f),
    @Nonempty (analytification f ≅ X)


/-- The étale cup product on `H^*_ét(X₀ ⊗̂ C, ℤ_p)` (owner `ClassicalAdicEtaleCohomology:H5`). -/
def etaleCupK (X₀ : ProperSmoothRigid (Kfield OK p)) (i j : ℤ) :
    H (etaleCohomology p (X₀.baseChange (kToC O p OK))) i →ₗ[ℤ_[p]]
      H (etaleCohomology p (X₀.baseChange (kToC O p OK))) j →ₗ[ℤ_[p]]
        H (etaleCohomology p (X₀.baseChange (kToC O p OK))) (i + j) := sorry
/-- The de Rham cup product on `H^*_dR(X₀ / K)` (owner `AdicSpacesPartII:R3`). -/
def deRhamCupK (X₀ : ProperSmoothRigid (Kfield OK p)) (i j : ℤ) :
    H (rigidDeRhamK p OK X₀) i →ₗ[Kfield OK p] H (rigidDeRhamK p OK X₀) j →ₗ[Kfield OK p]
      H (rigidDeRhamK p OK X₀) (i + j) := sorry
/-- Pullback on étale cohomology along a morphism (owner H5). -/
def etalePullbackK {X₀ Y₀ : ProperSmoothRigid (Kfield OK p)} (f : X₀ ⟶ Y₀) (i : ℤ) :
    H (etaleCohomology p (Y₀.baseChange (kToC O p OK))) i ⟶
      H (etaleCohomology p (X₀.baseChange (kToC O p OK))) i := sorry
/-- Pullback on de Rham cohomology along a morphism (owner R3). -/
def deRhamPullbackK {X₀ Y₀ : ProperSmoothRigid (Kfield OK p)} (f : X₀ ⟶ Y₀) (i : ℤ) :
    H (rigidDeRhamK p OK Y₀) i ⟶ H (rigidDeRhamK p OK X₀) i := sorry

/-- (Betts–Stix Proposition 3.19): the de Rham
comparison `c_dR` of Layer 2 is multiplicative (`c_dR(x ∪ y) = c_dR(x) ∪ c_dR(y)`) and natural for
morphisms of proper smooth spaces over `K`. Compatibility with finite extensions `K′/K`, the
Künneth formula and the integral/semistable enhancements are not stated. -/
theorem CP6.naturality_base_change_and_cup_products (X₀ : ProperSmoothRigid (Kfield OK p)) (hX : IsAlgebraizable p OK X₀)
    (i j : ℤ) :
    (∀ x y, (deRhamComparison O p OK X₀ (i + j)).hom
        (bilinearExtend (zpToBdR O p) (etaleCupK O p OK X₀ i j) x y) =
      bilinearExtend (kToBdR O p OK) (deRhamCupK p OK X₀ i j)
        ((deRhamComparison O p OK X₀ i).hom x) ((deRhamComparison O p OK X₀ j).hom y)) ∧
    ∀ (Y₀ : ProperSmoothRigid (Kfield OK p)) (hY : IsAlgebraizable p OK Y₀) (f : X₀ ⟶ Y₀),
      (ModuleCat.extendScalars (zpToBdR O p)).map (etalePullbackK O p OK f i) ≫
          deRhamComparison O p OK X₀ i =
        deRhamComparison O p OK Y₀ i ≫
          (ModuleCat.extendScalars (kToBdR O p OK)).map (deRhamPullbackK p OK f i) := by
  sorry

/-- The dimension of a proper smooth rigid space (owner R3). -/
def ProperSmoothRigid.dim {A : Type u} [CommRing A] (X : ProperSmoothRigid A) : ℕ := sorry
/-- `P¹_K` (owner R3). -/
def projectiveLineK : ProperSmoothRigid (Kfield OK p) := sorry
/-- The étale trace `H^{2d}_ét(X_C, ℤ_p) → ℤ_p`, after the choice of generator `ε` of `ℤ_p(1)`
(owner `EtaleDualityAndPerverseSheaves:EDC.2:trace-purity`). -/
def etaleTraceK (X₀ : ProperSmoothRigid (Kfield OK p)) :
    H (etaleCohomology p (X₀.baseChange (kToC O p OK))) (2 * X₀.dim) →ₗ[ℤ_[p]] ℤ_[p] := sorry
/-- The de Rham trace `H^{2d}_dR(X₀ / K) → K` (owner `CrystallineCohomology:CR.3:duality`). -/
def deRhamTraceK (X₀ : ProperSmoothRigid (Kfield OK p)) :
    H (rigidDeRhamK p OK X₀) (2 * X₀.dim) →ₗ[Kfield OK p] Kfield OK p := sorry
/-- `B_dR ⊗` of a trace. -/
def traceExtend {R : Type*} {S : Type u} [CommRing R] [CommRing S] (f : R →+* S) {M : ModuleCat.{u} R}
    (τ : M →ₗ[R] R) : bc f M →ₗ[S] S := sorry

/-- The trace-normalized period `a` of Betts–Stix (constructed in
`CP6.trace_normalized_tate_period`). -/
def tracePeriod : (BDeRham O p)ˣ := sorry

/-- (Betts–Stix Proposition 3.20(5), Remark 3.21): there
is a unique `a ∈ B_dR^×` making the trace square on `P¹` commute, and then for every smooth proper
geometrically connected `X₀` of dimension `d` (in characteristic zero: `dim_K H⁰_dR(X₀/K) = 1`),
`tr_dR ∘ c_dR = a^d · tr_ét` on `H^{2d}`. Identification
of `a` with the canonical Fontaine Tate-line isomorphism is not asserted (Remark 3.21 leaves it unproved). -/
theorem CP6.trace_normalized_tate_period :
    (∃! a : (BDeRham O p)ˣ, ∀ x, traceExtend (kToBdR O p OK) (deRhamTraceK p OK (projectiveLineK p OK))
        ((deRhamComparison O p OK (projectiveLineK p OK) (2 * (projectiveLineK p OK).dim)).hom x) =
      (a : BDeRham O p) * traceExtend (zpToBdR O p) (etaleTraceK O p OK (projectiveLineK p OK)) x) ∧
    ∀ X₀ : ProperSmoothRigid (Kfield OK p), IsAlgebraizable p OK X₀ →
      Module.finrank (Kfield OK p) (H (rigidDeRhamK p OK X₀) 0) = 1 → ∀ x,
      traceExtend (kToBdR O p OK) (deRhamTraceK p OK X₀)
          ((deRhamComparison O p OK X₀ (2 * X₀.dim)).hom x) =
        ((tracePeriod O p : BDeRham O p) ^ X₀.dim) *
          traceExtend (zpToBdR O p) (etaleTraceK O p OK X₀) x := by
  sorry

/-- The selected scalar is the unit fixed by the P¹ trace square. -/
theorem tracePeriod_spec :
    ∀ x, traceExtend (kToBdR O p OK) (deRhamTraceK p OK (projectiveLineK p OK))
        ((deRhamComparison O p OK (projectiveLineK p OK) (2 * (projectiveLineK p OK).dim)).hom x) =
      (tracePeriod O p : BDeRham O p) *
        traceExtend (zpToBdR O p) (etaleTraceK O p OK (projectiveLineK p OK)) x := by
  sorry

/-- The P¹ normalization determines the selected unit uniquely. -/
theorem tracePeriod_unique (a : (BDeRham O p)ˣ)
    (ha : ∀ x, traceExtend (kToBdR O p OK) (deRhamTraceK p OK (projectiveLineK p OK))
        ((deRhamComparison O p OK (projectiveLineK p OK) (2 * (projectiveLineK p OK).dim)).hom x) =
      (a : BDeRham O p) *
        traceExtend (zpToBdR O p) (etaleTraceK O p OK (projectiveLineK p OK)) x) :
    a = tracePeriod O p := by
  sorry

/-- The dimension-zero trace needs no period factor. -/
theorem tracePeriod_pow_zero : (tracePeriod O p : BDeRham O p) ^ 0 = 1 := by simp

example : (tracePeriod O p : BDeRham O p) ^ 0 = 1 := by simp

/-- A degree-two P¹ element of étale trace one has compared de Rham trace a. -/
example (x : bc (zpToBdR O p)
    (H (etaleCohomology p ((projectiveLineK p OK).baseChange (kToC O p OK)))
      (2 * (projectiveLineK p OK).dim)))
    (hx : traceExtend (zpToBdR O p) (etaleTraceK O p OK (projectiveLineK p OK)) x = 1) :
    traceExtend (kToBdR O p OK) (deRhamTraceK p OK (projectiveLineK p OK))
      ((deRhamComparison O p OK (projectiveLineK p OK) (2 * (projectiveLineK p OK).dim)).hom x) =
        (tracePeriod O p : BDeRham O p) := by
  rw [tracePeriod_spec O p OK, hx, mul_one]

/-- Algebraic cycles of codimension `r` (owner `EtaleDualityAndPerverseSheaves:EDC.3`). -/
def CycleK (X₀ : ProperSmoothRigid (Kfield OK p)) (r : ℕ) : Type u := sorry
/-- The étale cycle class in `H^{2r}_ét(X_C, ℤ_p)` after the choice of `ε` (owner EDC.3). -/
def cycleClassEt (X₀ : ProperSmoothRigid (Kfield OK p)) (r : ℕ) (Z : CycleK p OK X₀ r) :
    H (etaleCohomology p (X₀.baseChange (kToC O p OK))) (2 * r) := sorry
/-- The de Rham cycle class in `H^{2r}_dR(X₀ / K)` (owner `CrystallineCohomology:CR.3:duality`). -/
def cycleClassDR (X₀ : ProperSmoothRigid (Kfield OK p)) (r : ℕ) (Z : CycleK p OK X₀ r) :
    H (rigidDeRhamK p OK X₀) (2 * r) := sorry

/-- (Betts–Stix Proposition 3.20(6)–(7)): for a
codimension-`r` cycle `Z` on a smooth proper `X₀`, `c_dR(cl_ét(Z)) = a^r cl_dR(Z)`. The
identification of the Poincaré pairings and the Gysin/pushforward extension (a roadmap extension
beyond Betts–Stix) are not stated. -/
theorem CP6.duality_and_cycle_class_compatibility (X₀ : ProperSmoothRigid (Kfield OK p)) (hX : IsAlgebraizable p OK X₀) (r : ℕ)
    (Z : CycleK p OK X₀ r) :
    (deRhamComparison O p OK X₀ (2 * r)).hom
        (bcUnit (zpToBdR O p) _ (cycleClassEt O p OK X₀ r Z)) =
      ((tracePeriod O p) ^ r : (BDeRham O p)ˣ) • bcUnit (kToBdR O p OK) _ (cycleClassDR p OK X₀ r Z) := by
  sorry

/-- Line bundles on `X₀` (owner R3). -/
def LineBundleK (X₀ : ProperSmoothRigid (Kfield OK p)) : Type u := sorry
/-- Vector bundles of rank `n` on `X₀` (owner R3). -/
def VectorBundleK (X₀ : ProperSmoothRigid (Kfield OK p)) (n : ℕ) : Type u := sorry
/-- The étale Chern class `c_r` (Kummer for `r = 1`), after the choice of `ε` (owner EDC.3). -/
def chernEt (X₀ : ProperSmoothRigid (Kfield OK p)) {n : ℕ} (E : VectorBundleK p OK X₀ n) (r : ℕ) :
    H (etaleCohomology p (X₀.baseChange (kToC O p OK))) (2 * r) := sorry
/-- The de Rham Chern class `c_r` (dlog for `r = 1`) (owners CR.3:duality, `PrismaticCohomology:PR.4`). -/
def chernDR (X₀ : ProperSmoothRigid (Kfield OK p)) {n : ℕ} (E : VectorBundleK p OK X₀ n) (r : ℕ) :
    H (rigidDeRhamK p OK X₀) (2 * r) := sorry
/-- A line bundle as a rank-one vector bundle. -/
def LineBundleK.toVectorBundle {X₀ : ProperSmoothRigid (Kfield OK p)} (L : LineBundleK p OK X₀) :
    VectorBundleK p OK X₀ 1 := sorry

/-- (Betts–Stix Proposition 3.20(8), with the proper
`P(O ⊕ L)` section/Gysin argument): `c_dR(c₁^ét(L)) = a c₁^dR(L)`. The crystalline and
prismatic first Chern classes (PR.4) and the integral semistable cup maps are not stated. -/
theorem CP6.first_chern_class_comparison (X₀ : ProperSmoothRigid (Kfield OK p)) (hX : IsAlgebraizable p OK X₀)
    (L : LineBundleK p OK X₀) :
    (deRhamComparison O p OK X₀ (2 * 1)).hom
        (bcUnit (zpToBdR O p) _ (chernEt O p OK X₀ L.toVectorBundle 1)) =
      (tracePeriod O p) • bcUnit (kToBdR O p OK) _ (chernDR p OK X₀ L.toVectorBundle 1) := by
  sorry

/-- (Betts–Stix Proposition 3.20(8),
Grothendieck's splitting principle): for a vector bundle `E` of rank `n` and every `r`,
`c_dR(c_r^ét(E)) = a^r c_r^dR(E)`. The projective-bundle relation itself is EDC.4's and
PR.4's. -/
theorem CP6.higher_chern_and_projective_bundle_comparison (X₀ : ProperSmoothRigid (Kfield OK p)) (hX : IsAlgebraizable p OK X₀)
    {n : ℕ} (E : VectorBundleK p OK X₀ n) (r : ℕ) :
    (deRhamComparison O p OK X₀ (2 * r)).hom (bcUnit (zpToBdR O p) _ (chernEt O p OK X₀ E r)) =
      ((tracePeriod O p) ^ r : (BDeRham O p)ˣ) • bcUnit (kToBdR O p OK) _ (chernDR p OK X₀ E r) := by
  sorry

/-- The realizations returned to R06.6, R07 and
AutomorphicGaloisRepresentationsPartII. Good reduction gives a crystalline comparison (Layer 3), a
proper semistable model a semistable one (Layer 4), and a proper smooth rigid space over `K` a
potentially semistable one (Layer 4). Small-weight integral consumers keep R07.3/R07.4's hypotheses
(Layer 5). -/
theorem CP6.geometric_arithmetic_export :
    (∀ (X₀ : ProperSmoothFormalScheme OK) (i : ℤ), ∃ e, IsCrystallineComparison O p OK X₀ i e) ∧
    (∀ (X : SemistableFormalScheme OK) (r : ℤ),
      (PeriodData.ofSemistable O p OK X r).IsStComparison (semistableStComparison O p OK X r)) ∧
    ∀ (X₀ : ProperSmoothRigid (Kfield OK p)) (r : ℤ),
      (PeriodData.ofRigid O p OK X₀ r).IsStComparison (rigidStComparison O p OK X₀ r) := by
  sorry

/-- Return the normalized coefficient
maps and the geometric Chern comparison as concrete data. HQ.8 owns q-gluing and RT owns the
cyclotomic-character square. This signature exports the de Rham Chern clause already stated here;
integral/prismatic enhancement and the consumers' gluing homotopies remain owner interfaces. -/
theorem CP6.habiro_and_trace_specialization_export
    (ε : PreTilt O p) (hε : IsCompatibleRootsOfUnity O p ε)
    (X₀ : ProperSmoothRigid (Kfield OK p)) (hX : IsAlgebraizable p OK X₀) {n : ℕ} (E : VectorBundleK p OK X₀ n) (r : ℕ) :
    ∃ d : SpecializationDictionary (Ainf O p) O (residueWitt O p)
        (Acris O p) (BDeRhamPlus O p) p,
      d = SpecializationDictionary.standard O p ε hε ∧
      d.theta = WittVector.fontaineTheta O p ∧
      d.toBdRPlus = d.acrysToBdRPlus.comp d.toAcrys ∧
      (deRhamComparison O p OK X₀ (2 * r)).hom
          (bcUnit (zpToBdR O p) _ (chernEt O p OK X₀ E r)) =
        ((tracePeriod O p) ^ r : (BDeRham O p)ˣ) •
          bcUnit (kToBdR O p OK) _ (chernDR p OK X₀ E r) := by
  sorry

end CP6

/-! ### Pan's truncated period comparison on the modular-curve tower -/

section CP6Pan

variable (O : Type u) [CommRing O] [IsDomain O] [IsLocalRing O] (p : ℕ) [Fact p.Prime]
  [Fact ¬IsUnit (p : O)] [IsAdicComplete (Ideal.span {(p : O)}) O] [IsIntegersOfC O]

/-- Tame levels `K^p` contained in full level `N ≥ 3`, prime to `p`, of the modular-curve tower (owner `CompletedCohomologyPartII:CC.8`). -/
def TameLevel : Type u := sorry
/-- `B_dR⁺/t^k` (owner `PadicHodgeTheory:R06.1`). -/
def bdrTrunc (O : Type u) (p : ℕ) (k : ℕ) : Type u := sorry
instance (k : ℕ) : CommRing (bdrTrunc O p k) := sorry
/-- The reduction `B_dR⁺/t^{k+1} → B_dR⁺/t^k` (owner R06.1). -/
def bdrTruncReduce (k : ℕ) : bdrTrunc O p (k + 1) →+* bdrTrunc O p k := sorry

/-- Completed cohomology `H̃^i(K^p, B_dR,k⁺)` of the modular-curve tower (owner CC.8). -/
def completedCohomologyBdR (Kp : TameLevel) (i : ℤ) (k : ℕ) : ModuleCat.{u} (bdrTrunc O p k) :=
  sorry
/-- `H^i(Fℓ, B_dR,k⁺)` on the flag variety, with Pan's truncated period sheaf (owners
Layer 6 modular-curve basis, `PadicHodgeTheory:P8:local-rational`; ordinary period
sheaves in Pan §7.2, not the log structural sheaves of §6.3). -/
def flagCohomologyBdR (Kp : TameLevel) (i : ℤ) (k : ℕ) : ModuleCat.{u} (bdrTrunc O p k) := sorry
/-- Reduction from level `k + 1` to level `k` on both sides. -/
def completedReduce (Kp : TameLevel) (i : ℤ) (k : ℕ) :
    completedCohomologyBdR O p Kp i (k + 1) →+ completedCohomologyBdR O p Kp i k := sorry
/-- Reduction on the flag side. -/
def flagReduce (Kp : TameLevel) (i : ℤ) (k : ℕ) :
    flagCohomologyBdR O p Kp i (k + 1) →+ flagCohomologyBdR O p Kp i k := sorry
/-- Pan's map `H̃^i(K^p, B_dR,k⁺) → H^i(Fℓ, B_dR,k⁺)` (constructed in
`CP6.pan_etale_site_truncated_comparison_map`). -/
def panTruncatedMap (Kp : TameLevel) (i : ℤ) (k : ℕ) :
    completedCohomologyBdR O p Kp i k ⟶ flagCohomologyBdR O p Kp i k := sorry
/-- `G_{ℚ_p}`-actions on both sides (owner CC.8 and the Layer 6 modular-curve basis). -/
def panGaloisCompleted (Kp : TameLevel) (i : ℤ) (k : ℕ) :
    (O ≃+* O) →* AddMonoid.End (completedCohomologyBdR O p Kp i k) := sorry
/-- The `G_{ℚ_p}`-action on the flag side. -/
def panGaloisFlag (Kp : TameLevel) (i : ℤ) (k : ℕ) :
    (O ≃+* O) →* AddMonoid.End (flagCohomologyBdR O p Kp i k) := sorry

/-- (Pan Lemma 7.2.4): Pan's maps are
`G_{ℚ_p}`-equivariant and compatible with reduction `k + 1 → k`; at `k = 1` the map is the
completed `C`-coefficient isomorphism of Pan22 Corollary 4.4.3. The finite-level Witt
construction is the proof. -/
theorem CP6.pan_etale_site_truncated_comparison_map (Kp : TameLevel) (i : ℤ) :
    IsIso (panTruncatedMap O p Kp i 1) ∧
    ∀ k : ℕ, (∀ x, flagReduce O p Kp i k ((panTruncatedMap O p Kp i (k + 1)).hom x) =
        (panTruncatedMap O p Kp i k).hom (completedReduce O p Kp i k x)) ∧
      ∀ (g : O ≃+* O) x, (panTruncatedMap O p Kp i k).hom (panGaloisCompleted O p Kp i k g x) =
        panGaloisFlag O p Kp i k g ((panTruncatedMap O p Kp i k).hom x) := by
  sorry

/-- (Pan Proposition 7.2.3): for every `k ≥ 1` and
degree `i`, Pan's map `H̃^i(K^p, B_dR,k⁺) → H^i(Fℓ, B_dR,k⁺)` is an isomorphism. -/
theorem CP6.pan_truncated_period_isomorphism (Kp : TameLevel) (i : ℤ) (k : ℕ) (hk : 1 ≤ k) :
    IsIso (panTruncatedMap O p Kp i k) := by
  sorry

/-- Right-adjoint underlying-module representatives of the almostified
`H^i(X_{K^p}, A_inf/(ker θ)^k)`, not an exact ordinary integral comparison.
Pan Lemma 7.2.5 is in the almost category; the maps below represent that comparison after
applying its right adjoint. The almost/enhanced interfaces require the supplier category
(owners CC.2, `AInfCohomology:AI.3`). -/
def panAinfTruncated (Kp : TameLevel) (i : ℤ) (k : ℕ) : ModuleCat.{u} (Ainf O p) := sorry
/-- The right-adjoint representative of the almost inverse limit
`lim_m H^i(X_{K^p}, A_inf/((ker θ)^k, p^m))` (owner CC.2). -/
def panAinfLimit (Kp : TameLevel) (i : ℤ) (k : ℕ) : ModuleCat.{u} (Ainf O p) := sorry
/-- The natural map to the inverse limit. -/
def panAinfToLimit (Kp : TameLevel) (i : ℤ) (k : ℕ) :
    panAinfTruncated O p Kp i k ⟶ panAinfLimit O p Kp i k := sorry

/-- (Pan Lemma 7.2.5): for each `i` and `k ≥ 1`, the
`p`-primary torsion of `H^i(X_{K^p}, A_inf/(ker θ)^k)` is killed by a power of `p` depending on
`i, k`, and the module is the inverse limit of its reductions modulo `p^m`. No bound uniform in `k`
or `i` is asserted. -/
theorem CP6.pan_bounded_torsion_inverse_limit (Kp : TameLevel) (i : ℤ) (k : ℕ) (hk : 1 ≤ k) :
    (∃ n : ℕ, ∀ x : panAinfTruncated O p Kp i k, (∃ m : ℕ, ((p : Ainf O p) ^ m) • x = 0) →
      ((p : Ainf O p) ^ n) • x = 0) ∧
      IsIso (panAinfToLimit O p Kp i k) := by
  sorry

/-- `lim_m H̃^i(K^p, ℤ/p^m) ⊗ A_inf/((ker θ)^k, p^m)` (owner CC.4). -/
def panCompletedCoefficient (Kp : TameLevel) (i : ℤ) (k : ℕ) : ModuleCat.{u} (Ainf O p) := sorry
/-- The coefficient-interchange map (Pan Lemma 7.2.6). -/
def panCoefficientMap (Kp : TameLevel) (i : ℤ) (k : ℕ) :
    panCompletedCoefficient O p Kp i k ⟶ panAinfTruncated O p Kp i k := sorry
/-- `R^j π_{HT,*}(A_inf,X^a/(ker θ)^k)` on `Fℓ`, its global sections as a module (Layer 6 modular-curve basis and PerfectoidSpaces P3). -/
def panHigherDirectImage (Kp : TameLevel) (j : ℕ) (k : ℕ) : ModuleCat.{u} (Ainf O p) := sorry

/-- (Pan Lemma 7.2.6): completed cohomology
with `A_inf/(ker θ)^k` coefficients is `lim_m H̃^i(K^p, ℤ/p^m) ⊗ A_inf/((ker θ)^k, p^m)`, and the
higher direct images `R^j π_{HT,*}(A_inf,X^a/(ker θ)^k)` vanish for `j > 0` (on the affinoid
perfectoid preimages of the basis), so the cohomology descends to `Fℓ`. -/
theorem CP6.pan_completed_coefficient_and_flag_descent (Kp : TameLevel) (i : ℤ) (k : ℕ)
    (hk : 1 ≤ k) :
    IsIso (panCoefficientMap O p Kp i k) ∧
      ∀ j : ℕ, 0 < j → Limits.IsZero (panHigherDirectImage O p Kp j k) := by
  sorry

/-- The opens `U ∈ B` of the basis of `Fℓ` with affinoid perfectoid preimages (owner
Layer 6 modular-curve basis). -/
def PanBasisOpen : Type u := sorry

/-- The graded piece `gr^i OB_dR,k⁺` on an open `U` of the basis, its locally analytic vectors,
and the three natural maps of Pan Proposition 6.3.9 (Layer 6 logarithmic structural coefficients and CC.8). -/
def panGradedSource (U : PanBasisOpen) (i k l : ℕ) (which : Fin 3) :
    ModuleCat.{u} (Cfield O p) := sorry
/-- The target of the `which`-th map of Pan Proposition 6.3.9. -/
def panGradedTarget (U : PanBasisOpen) (i k l : ℕ) (which : Fin 3) : ModuleCat.{u} (Cfield O p) := sorry
/-- The `which`-th natural map of Pan Proposition 6.3.9. -/
def panGradedComparison (U : PanBasisOpen) (i k l : ℕ) (which : Fin 3) :
    panGradedSource O p U i k l which ⟶ panGradedTarget O p U i k l which := sorry

/-- (Pan Proposition 6.3.9, with the hypothesis
`k > i` needed for stabilization): for `i ≥ 0`, `l > 0` and `k > i`, taking `gr^i` commutes with
`GL₂(ℚ_p)`-locally analytic vectors, with the `χ̃_l`-isotypic part, and with the decompleted
`G_{K∞}`-fixed, `G_K`-analytic vectors. The filtration by the symmetric power of the Faltings
extension is not stated. -/
theorem CP6.pan_graded_analytic_decompletion (U : PanBasisOpen) (i k l : ℕ) (hl : 0 < l) (hk : i < k) :
    ∀ which : Fin 3, IsIso (panGradedComparison O p U i k l which) := by
  sorry

end CP6Pan


/-! ### Computed normalization witnesses -/

/-- A two-term nilpotent operator with N(e₁)=e₀ transports e₁ to e₁−ce₀. -/
example (c : ℚ) : ((0 : ℚ) - c * 1, (1 : ℚ)) = (-c, 1) := by simp

/-- Successive negative-exponential transports add their coordinate shifts. -/
example (c d x y : ℚ) : ((x - c * y) - d * y, y) = (x - (c + d) * y, y) := by
  congr 1
  ring

/-- Transport by zero is the identity, including the zero vector. -/
example (x y : ℚ) : (x - (0 : ℚ) * y, y) = (x, y) := by simp

/-- A trace-normalized factor and its inverse give different untwisted class values. -/
example : (2 : ℚ) ≠ (2 : ℚ)⁻¹ := by norm_num

/-- Rank one fixes the quotient-line projective-bundle sign. -/
example (c : ℚ) : Polynomial.eval c (Polynomial.X - Polynomial.C c) = 0 := by simp

/-- The two corner identities use (right, −bottom) in the pullback triangle. -/
example (x : ℚ) : x + (-x) = 0 := by ring

/-- Normalized length divides ordinary length by the ramification index. -/
example (e : ℕ) (he : 0 < e) (n : ℕ) : ((e * n : ℕ) : ℚ) / e = n := by
  have heq : (e : ℚ) ≠ 0 := by exact_mod_cast Nat.ne_of_gt he
  push_cast
  field_simp

/-- The trivial torsion quotient at exponent zero has length zero. -/
example (R M : Type*) [CommRing R] [AddCommGroup M] [Module R M] (a : R) :
    torsionLength R M a 0 = 0 := by
  simp [torsionLength]

/-- The weight-one crystalline point operator is invertible after rationalization. -/
example (p : ℕ) (hp : p.Prime) : 1 - (p : ℚ)⁻¹ ≠ 0 := by
  have hpq : (p : ℚ) > 1 := by exact_mod_cast hp.one_lt
  rw [sub_ne_zero, ne_comm, inv_ne_one]
  exact ne_of_gt hpq

/-- Weight zero has zero operator; its enhanced fibre is not merely an ordinary kernel. -/
example : (1 : ℚ) - 1 / 1 = 0 := by norm_num

/-- The logarithmic Poincaré coordinate has derivative one. -/
example : Polynomial.derivative (Polynomial.X : Polynomial ℚ) = 1 := by simp

/-- Its two-term quadratic computation fixes the connection's positive sign. -/
example : Polynomial.derivative ((Polynomial.X : Polynomial ℚ) ^ 2) =
    2 * Polynomial.X := by
  simp
  norm_num

/-- The constant-unit logarithm has zero derivative. -/
example : Polynomial.derivative (1 : Polynomial ℚ) = 0 := by simp

end TauCetiRoadmap.CohomologyComparisons

/-
Additional signatures in README.md: the quasisyntomic graded Beilinson square and its
filtered map `gradedBeilinsonSquare_map`, `gradedBeilinsonSquare_zero`,
`gradedBeilinsonSquare_cartesian` and its local finite-weight cyclotomic construction;
the filtered equivariant Tate-line refinement of `tracePeriod_spec`; the modular-curve divisorial Kummer/pro-Kummer sites, log-period
`panLogPeriod_restrict`, `panLogPeriod_theta`, `panLogPeriod_connection`,
`panLogPeriod_faltings` APIs and their full-kernel/residue checks;
`panBasis_perfectoid`, `panBasis_inter`, `panBasis_finiteLevel` and their
chart-cover/annulus/pullback checks; the sheaf-level higher-direct-image vanishing;
coherent enhanced tensor identities; the original
uncompleted F^{nr} smooth-vector Hom descriptions; Künneth and finite-extension
compatibility; full Poincaré pairings; the logarithmic Faltings-extension filtration;
finite-coefficient semistable torsion inequalities; the relative filtered prismatic
agreement with its crystalline local system, perfect prism and compatible section. These require their suppliers'
enhanced types in addition to the underlying ordinary derived-category signatures.
-/
