import Mathlib.RingTheory.RegularLocalRing.Defs
import Mathlib.RingTheory.Regular.RegularSequence
import Mathlib.Algebra.Module.SpanRank
import Mathlib.RingTheory.KrullDimension.Basic
import Mathlib.RingTheory.Spectrum.Prime.Topology
import Mathlib.RingTheory.Spectrum.Maximal.Basic
import Mathlib.Algebra.Module.FinitePresentation
import Mathlib.RingTheory.AdicCompletion.Algebra
import Mathlib.FieldTheory.IsAlgClosed.Basic
import Mathlib.Algebra.CharP.Lemmas
import Mathlib.LinearAlgebra.Dual.Defs
import Mathlib.LinearAlgebra.FreeModule.Basic
import Mathlib.LinearAlgebra.Basis.Defs
import Mathlib.RingTheory.UniqueFactorizationDomain.Defs
import Mathlib.RingTheory.DiscreteValuationRing.Basic
import Mathlib.RingTheory.MvPowerSeries.Inverse
import Mathlib.RingTheory.MvPowerSeries.Equiv
import Mathlib.NumberTheory.Padics.PadicIntegers
import Mathlib.AlgebraicGeometry.Restrict
import TauCeti.AlgebraicGeometry.LineBundle.Class

/-!
# Purity for flat cohomology and the conjectures of Gabber: suggested Lean forms

This file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/PurityForFlatCohomology.md` is definitive. The statements below suggest
Lean forms for those targets whose carriers exist at the pinned Mathlib and Tau Ceti, so that
contributors and reviewers converge on names and signatures. Every proof is `sorry`; nothing here
is claimed to be formalised.

Flat cohomology with supports, Dieudonné modules over perfectoid rings, Brauer groups of schemes and
groups of multiplicative type have no carriers at the pins; the theorems about them are README targets
and are listed by name in the register at the end of this file.

Sources: Česnavičius–Scholze, *Purity for flat cohomology*, Ann. of Math. 199 (2024)
(arXiv:1912.10932v3, cited as CS24); Česnavičius, *Purity for the Brauer group*, Duke Math. J. 168
(2019) (arXiv:1711.06456v4, cited as C19); SGA 2, Exposés X and XIV; EGA IV₄ §21.13.
-/

noncomputable section

open IsLocalRing

namespace TauCetiRoadmap.PurityForFlatCohomology

universe u v

/-! ## Layer 0: punctured spectra (PF.0/punctured-spectrum) -/

section PuncturedSpectrum

variable (R : Type u) [CommRing R]

/-- The punctured spectrum of a ring: the primes that are not maximal. For a semilocal ring this is
the complement of the finitely many closed points (C19 §1.5). -/
def puncturedSpectrum : Set (PrimeSpectrum R) :=
  {p | ¬ p.asIdeal.IsMaximal}

/-- API `puncturedSpectrum_carrier`: for a local ring, the punctured spectrum is the complement of
the closed point. -/
theorem puncturedSpectrum_carrier [IsLocalRing R] (p : PrimeSpectrum R) :
    p ∈ puncturedSpectrum R ↔ p ≠ closedPoint R := sorry

/-- API `puncturedSpectrum_isCompact` (with openness): for a Noetherian semilocal ring the
punctured spectrum is a quasi-compact open subset. -/
theorem puncturedSpectrum_isCompact [IsNoetherianRing R] [Finite (MaximalSpectrum R)] :
    IsOpen (puncturedSpectrum R) ∧ IsCompact (puncturedSpectrum R) := sorry

/-- API `puncturedSpectrum_eq_empty_iff`. -/
theorem puncturedSpectrum_eq_empty_iff [Nontrivial R] [Finite (MaximalSpectrum R)] :
    puncturedSpectrum R = ∅ ↔ ringKrullDim R = 0 := sorry

/-- API `puncturedSpectrum_baseChange_of_finite`: along an integral (in particular finite)
extension, the punctured spectrum pulls back to the punctured spectrum. -/
theorem puncturedSpectrum_baseChange_of_finite (S : Type v) [CommRing S] [Algebra R S]
    [Algebra.IsIntegral R S] :
    puncturedSpectrum S = PrimeSpectrum.comap (algebraMap R S) ⁻¹' puncturedSpectrum R := sorry

/-- API `puncturedSpectrum_dvr`: for a discrete valuation ring the punctured spectrum is the
generic point. -/
theorem puncturedSpectrum_dvr [IsDomain R] [IsDiscreteValuationRing R] :
    puncturedSpectrum R = {p | p.asIdeal = ⊥} := sorry

/-- Test `puncturedSpectrum_field`. -/
example (K : Type u) [Field K] : puncturedSpectrum K = ∅ := sorry

/-- Test `puncturedSpectrum_dvr_eq`. -/
example (p : ℕ) [Fact p.Prime] :
    puncturedSpectrum ℤ_[p] = {q | q.asIdeal = ⊥} := sorry

/-- Test `puncturedSpectrum_semilocal_product`: all closed points are removed. -/
example (K : Type u) [Field K] : puncturedSpectrum (K × K) = ∅ := sorry

/-- Test `puncturedSpectrum_local_compat`. -/
example [IsLocalRing R] : puncturedSpectrum R = {closedPoint R}ᶜ := sorry

end PuncturedSpectrum

/-- The punctured spectrum of a local ring as an open subset of `Spec R`. -/
def puncturedSpectrumOpens (R : CommRingCat.{u}) [IsLocalRing R] : (AlgebraicGeometry.Spec R).Opens :=
  ⟨{closedPoint R}ᶜ, (isClosed_singleton_closedPoint R).isOpen_compl⟩

/-! ## Layer 0: the ring-level core of the Hartogs lemma (PF.0/hartogs-regular-sequence) -/

/-- The degree-one Koszul vanishing behind CS24 Lemma 7.2.7(b): if `m₁, m₂` is a regular sequence,
then `m₁ⁿ a = m₂ⁿ b` forces `a = m₂ⁿ c` and `b = m₁ⁿ c`. -/
theorem hartogs_koszul_step {A : Type u} [CommRing A] (m₁ m₂ : A)
    (h : RingTheory.Sequence.IsWeaklyRegular A [m₁, m₂]) (n : ℕ) (a b : A)
    (hab : m₁ ^ n * a = m₂ ^ n * b) : ∃ c : A, b = m₁ ^ n * c ∧ a = m₂ ^ n * c := sorry

/-! ## Layer 1: the virtual dimension (PF.1/virtual-dimension) -/

section VirtualDimension

variable {S : Type u} [CommRing S]

/-- The virtual dimension of the presentation `S/I` by a regular local ring `S`:
`dim S − μ(I)`, with `dim S = μ(𝔪_S)` for regular `S`. The virtual dimension of a Noetherian local
ring `R` is this number for any Cohen presentation `R̂ ≅ S/I` (README target `virtualDimension`). -/
def presentationVirtualDimension [IsLocalRing S] (I : Ideal S) : ℤ :=
  ((maximalIdeal S).spanFinrank : ℤ) - (I.spanFinrank : ℤ)

/-- API `virtualDimension_eq_of_presentation` (SGA 2 XIV 5.2): the value does not depend on the
regular local presentation. -/
theorem virtualDimension_eq_of_presentation {S' : Type u} [CommRing S']
    [IsRegularLocalRing S] [IsRegularLocalRing S'] (I : Ideal S) (I' : Ideal S')
    (hI : I ≠ ⊤) (hI' : I' ≠ ⊤) (e : (S ⧸ I) ≃+* (S' ⧸ I')) :
    presentationVirtualDimension I = presentationVirtualDimension I' := sorry

/-- API `virtualDimension_le_dim`, inequality (SGA 2 XIV 5.4): `vdim ≤ dim`, written additively. -/
theorem virtualDimension_le_dim [IsRegularLocalRing S] (I : Ideal S) (hI : I ≠ ⊤) :
    ringKrullDim S ≤ ringKrullDim (S ⧸ I) + (I.spanFinrank : WithBot ℕ∞) := sorry

/-- API `virtualDimension_le_dim`, equality case (SGA 2 XIV 5.4): equality holds iff `I` is
generated by a regular sequence, i.e. `S/I` is a complete intersection. -/
theorem virtualDimension_eq_dim_iff [IsRegularLocalRing S] (I : Ideal S) (hI : I ≤ maximalIdeal S) :
    ringKrullDim (S ⧸ I) + (I.spanFinrank : WithBot ℕ∞) = ringKrullDim S ↔
      ∃ rs : List S, Ideal.ofList rs = I ∧ RingTheory.Sequence.IsWeaklyRegular S rs := sorry

/-- API `virtualDimension_quotient`: adding `r` equations lowers the virtual dimension by at most
`r`. -/
theorem virtualDimension_quotient [IsLocalRing S] (I : Ideal S) (fs : List S) :
    presentationVirtualDimension I - fs.length ≤
      presentationVirtualDimension (I ⊔ Ideal.ofList fs) := sorry

/-- API `virtualDimension_regular`. -/
theorem virtualDimension_regular [IsRegularLocalRing S] :
    presentationVirtualDimension (⊥ : Ideal S) = (maximalIdeal S).spanFinrank := sorry

open MvPowerSeries in
/-- Test `virtualDimension_powerSeries`. -/
example (k : Type u) [Field k] (n : ℕ) :
    presentationVirtualDimension (⊥ : Ideal (MvPowerSeries (Fin n) k)) = n := sorry

open MvPowerSeries in
/-- Test `virtualDimension_node`: `vdim k⟦x, y⟧/(xy) = 1`. -/
example (k : Type u) [Field k] :
    presentationVirtualDimension
      (Ideal.span {X 0 * X 1} : Ideal (MvPowerSeries (Fin 2) k)) = 1 := sorry

/-- Test `virtualDimension_fatPoint`: `vdim k⟦x, y⟧/(x, y)² = −1`. -/
example (k : Type u) [Field k] :
    presentationVirtualDimension ((maximalIdeal (MvPowerSeries (Fin 2) k)) ^ 2) = -1 := sorry

open MvPowerSeries in
/-- Test `virtualDimension_remark626`: `vdim 𝔽_p⟦x, y, z, t⟧/(x², y², xz − yt) = 1`. -/
example (k : Type u) [Field k] :
    presentationVirtualDimension
      (Ideal.span {X 0 ^ 2, X 1 ^ 2, X 0 * X 2 - X 1 * X 3} :
        Ideal (MvPowerSeries (Fin 4) k)) = 1 := sorry

open MvPowerSeries in
/-- Test `virtualDimension_redundant_presentation`: `k⟦x⟧ = k⟦x, y⟧/(y)` gives `2 − 1 = 1`. -/
example (k : Type u) [Field k] :
    presentationVirtualDimension (Ideal.span {X 1} : Ideal (MvPowerSeries (Fin 2) k)) = 1 := sorry

end VirtualDimension

/-! ## Layer 3: modules over products and Frobenius-fixed vectors -/

/-- PF.3/finitely-presented-modules-over-products (CS24 Lemma 4.2.8): a finitely presented module
over `∏ Rᵢ` is the product of its base changes, here in the form `M ≃ ∏ (eᵢ • M)` for the
idempotents `eᵢ = Pi.single i 1`. -/
theorem finitelyPresented_pi_bijective {ι : Type u} [DecidableEq ι] (R : ι → Type u) [∀ i, CommRing (R i)]
    (M : Type u) [AddCommGroup M] [Module (∀ i, R i) M]
    [Module.FinitePresentation (∀ i, R i) M] :
    Function.Bijective (fun m : M => fun i : ι => (Pi.single i (1 : R i) : ∀ j, R j) • m) := sorry

/-- PF.3/frobenius-fixed-points-algebraically-closed (Katz; CS24 proof of Claim 4.2.10.1): a
finite-dimensional vector space over an algebraically closed field of characteristic `p` with a
bijective Frobenius-semilinear endomorphism has a basis of fixed vectors. -/
theorem frobenius_fixed_basis {K : Type u} [Field K] [IsAlgClosed K] (p : ℕ) [Fact p.Prime]
    [CharP K p] {M : Type v} [AddCommGroup M] [Module K M] [FiniteDimensional K M]
    (F : M →ₛₗ[frobenius K p] M) (hF : Function.Bijective F) :
    ∃ b : Module.Basis (Fin (Module.finrank K M)) K M, ∀ i, F (b i) = b i := sorry

/-! ## Layer 4: completion of regular sequences and the vdim counterexample -/

/-- PF.4/completion-regular-sequence (CS24 Lemma 6.2.2): a regular sequence whose partial quotients
have bounded `a`-power torsion stays regular in the `a`-adic completion. -/
theorem isWeaklyRegular_adicCompletion {A : Type u} [CommRing A] (a : A) (rs : List A)
    (hreg : RingTheory.Sequence.IsWeaklyRegular A rs)
    (hbdd : ∀ i ≤ rs.length, ∃ N : ℕ, ∀ x : A ⧸ Ideal.ofList (rs.take i),
      (∃ k : ℕ, a ^ k • x = 0) → a ^ N • x = 0) :
    RingTheory.Sequence.IsWeaklyRegular (AdicCompletion (Ideal.span {a}) A)
      (rs.map (algebraMap A (AdicCompletion (Ideal.span {a}) A))) := sorry

open MvPowerSeries in
/-- PF.4/virtual-dimension-flat-counterexample (CS24 Remark 6.2.6), ring-level part: in
`𝔽_p⟦x, y, z, t⟧/(x², y², xz − yt)` the class of `xy` is nonzero, killed by every variable and has
vanishing `p`-th power, so it lies in `α_p(R)` and is supported at the closed point. -/
theorem remark626_xy (p : ℕ) [Fact p.Prime] :
    let I : Ideal (MvPowerSeries (Fin 4) (ZMod p)) :=
      Ideal.span {X 0 ^ 2, X 1 ^ 2, X 0 * X 2 - X 1 * X 3}
    let xy := Ideal.Quotient.mk I (X 0 * X 1)
    xy ≠ 0 ∧ (∀ j : Fin 4, Ideal.Quotient.mk I (X j) * xy = 0) ∧ xy ^ p = 0 := sorry

/-! ## Layer 5: Auslander's criterion and parafactoriality -/

/-- PF.5/auslander-endomorphism-freeness (Auslander 1962, Theorem 1.3, as used in CS24 Theorem
7.1.3). -/
theorem auslander_free_of_end {R : Type u} [CommRing R] [IsRegularLocalRing R] {M : Type u}
    [AddCommGroup M] [Module R M] [Module.Finite R M] [Module.IsReflexive R M] (r : ℕ)
    (e : Module.End R M ≃ₗ[R] (Fin r → M)) : Module.Free R M := sorry

section Parafactorial

open AlgebraicGeometry CategoryTheory TopologicalSpace

/-- PF.5/parafactorial-local-ring: a local ring is parafactorial if restriction of functions to the
punctured spectrum is bijective and every line bundle on the punctured spectrum is trivial
(EGA IV 21.13.7–21.13.8). -/
def IsParafactorial (R : CommRingCat.{u}) [IsLocalRing R] : Prop :=
  Function.Bijective
      ((Spec R).presheaf.map (homOfLE (le_top : puncturedSpectrumOpens R ≤ ⊤)).op).hom ∧
    Subsingleton (TauCeti.AlgebraicGeometry.LineBundleClass (puncturedSpectrumOpens R).toScheme)

/-- API `IsParafactorial.two_le_dim` (EGA IV 21.13.9(i)). -/
theorem IsParafactorial.two_le_dim (R : CommRingCat.{u}) [IsLocalRing R] [IsNoetherianRing R]
    (h : IsParafactorial R) : 2 ≤ ringKrullDim R := sorry

/-- API `IsParafactorial.of_factorial` (EGA IV 21.13.9(ii)). -/
theorem IsParafactorial.of_factorial (R : CommRingCat.{u}) [IsLocalRing R] [IsNoetherianRing R]
    [IsDomain R] [UniqueFactorizationMonoid R] (h : 2 ≤ ringKrullDim R) : IsParafactorial R := sorry

/-- Test `isParafactorial_powerSeries_two`. -/
example (k : Type u) [Field k] : IsParafactorial (CommRingCat.of (MvPowerSeries (Fin 2) k)) := sorry

/-- Test `not_isParafactorial_dvr`. -/
example (p : ℕ) [Fact p.Prime] : ¬ IsParafactorial (CommRingCat.of ℤ_[p]) := sorry

end Parafactorial

/-!
## Register of README targets without Lean carriers at the pins

The following packet names are specified in the roadmap document only, because their carriers
(fppf cohomology with supports, prismatic Dieudonné modules, Brauer groups of schemes, groups of
multiplicative type, strict henselizations, complete intersections) are not at the pinned commits.

* PF.0/punctured-spectrum: `puncturedSpectrum_completion`, `puncturedSpectrum_sections_of_depth`,
  test `puncturedSpectrum_plane_sections`.
* PF.0/flat-cohomology-with-supports: `flatCohomologyWithSupports`,
  `flatCohomologyWithSupports_les`, `flatCohomologyWithSupports_zero`,
  `flatCohomologyWithSupports_excision_open`, `flatCohomologyWithSupports_excision_etale`,
  `flatCohomologyWithSupports_triple`, `flatCohomologyWithSupports_localToGlobal`,
  `flatCohomologyWithSupports_mayerVietoris`, `flatCohomologyWithSupports_finiteFlatDescent`,
  `flatCohomologyWithSupports_etale_comparison`, `flatCohomologyWithSupports_quasiCoherent`,
  `flatCohomologyWithSupports_limit`; tests `flatCohomologyWithSupports_empty`,
  `flatCohomologyWithSupports_all`, `flatCohomologyWithSupports_dvr_Gm`,
  `flatCohomologyWithSupports_Ga_compat`, `flatCohomologyWithSupports_not_restriction`.
* PF.0/regular-sequence-support-vanishing; PF.0/hartogs-regular-sequence (scheme form).
* PF.1/virtual-dimension: `virtualDimension` (the presentation-free invariant, through a Cohen
  presentation), `virtualDimension_completion`, `virtualDimension_flat_separable`.
* PF.1/virtual-dimension-flat-additivity, PF.1/depth-virtual-dimension-incomparable,
  PF.1/etale-depth-virtual-dimension, PF.1/zariski-nagata-virtual-dimension.
* PF.2/additive-group-depth-vanishing, PF.2/root-extraction-comparison,
  PF.2/finite-flat-cover-reduction, PF.2/char-p-complete-intersection-purity.
* PF.3/dieudonne-side-complex: `dieudonneSide`, `dieudonneSide_les`, `dieudonneSide_map`,
  `dieudonneSide_exact`, `dieudonneSide_localization`, `dieudonneSide_crystalline`; tests
  `dieudonneSide_zero`, `dieudonneSide_constant_perfect`, `dieudonneSide_mu_perfect`,
  `dieudonneSide_not_without_fixed_points`, `dieudonneSide_crystalline_compat`.
* PF.3/perfectoid-low-degree-cohomology, PF.3/dieudonne-side-arc-descent,
  PF.3/dieudonne-modules-over-products, PF.3/product-valuation-local-analysis,
  PF.3/flat-side-arc-descent, PF.3/key-formula, PF.3/perfectoid-purity.
* PF.4/flat-purity-complete-intersection, PF.4/etale-purity-virtual-dimension,
  PF.4/flat-purity-regular.
* PF.5/global-flat-purity, PF.5/torsor-gerbe-purity, PF.5/local-picard-torsion-vanishing,
  PF.5/cohen-macaulay-counterexample, PF.5/global-complete-intersection-picard,
  PF.5/gm-cohomology-torsion, PF.5/regular-dimension-two-extension,
  PF.5/brauer-purity-complete-intersection, PF.5/brauer-purity-sharpness,
  PF.5/multiplicative-type-purity-low-degree, PF.5/multiplicative-type-purity-higher.
* PF.5/parafactorial-local-ring: `IsParafactorial.iff_depth_pic`, `IsParafactorial.of_completion`,
  `IsParafactorial.of_completeIntersection`, `IsGeometricallyParafactorial`,
  `IsParafactorialPair.iff_local`; tests `not_isParafactorial_A1`, `not_isParafactorial_node3`,
  `isParafactorial_lineBundle_compat`.
* PF.6/generic-h2-injectivity: `GenericallyInjectiveH2`, `GenericallyInjectiveH2.restrict`,
  `GenericallyInjectiveH2.gm`, `GenericallyInjectiveH2.flasque`, `GenericallyInjectiveH2.prod`;
  tests `genericallyInjectiveH2_split`, `genericallyInjectiveH2_point`,
  `not_genericallyInjectiveH2_normTorus`, `genericallyInjectiveH2_weilRestriction`.
* PF.6/brauer-residue: `brauerResidue`, `brauerResidue_completion`,
  `brauerResidue_unramified_base_change`, `brauerResidue_kernel`, `brauerResidue_cyclic`; tests
  `brauerResidue_padic`, `brauerResidue_unramified_zero`, `brauerResidue_laurent`,
  `not_brauerResidue_imperfect`.
* PF.6/strict-local-brauer-purity, PF.6/henselian-torus-punctured-vanishing,
  PF.6/coniveau-spectral-sequence, PF.6/torus-low-support-vanishing, PF.6/torus-purity,
  PF.6/brauer-purity-regular, PF.6/codimension-one-torus-intersection,
  PF.6/brauer-codimension-one-intersection, PF.6/flasque-generic-injectivity,
  PF.6/norm-torus-counterexample, PF.6/dvr-brauer-residue-sequence,
  PF.6/global-brauer-residue-sequence, PF.6/imperfect-residue-exclusion,
  PF.6/codimension-one-deletion-example.
-/

end TauCetiRoadmap.PurityForFlatCohomology
