import Mathlib.AlgebraicGeometry.ResidueField
import Mathlib.AlgebraicGeometry.Morphisms.Proper
import Mathlib.AlgebraicGeometry.Morphisms.UnderlyingMap
import Mathlib.AlgebraicGeometry.Morphisms.FiniteType
import Mathlib.AlgebraicGeometry.Noetherian
import Mathlib.AlgebraicGeometry.Limits
import Mathlib.AlgebraicGeometry.Normalization
import Mathlib.Data.Nat.PrimeFin
import Mathlib.Data.ZMod.Basic
import Mathlib.Algebra.Polynomial.Basic
import Mathlib.NumberTheory.Zsqrtd.GaussianInt
import Mathlib.NumberTheory.Cyclotomic.Basic
import Mathlib.RingTheory.Valuation.ValuationSubring
import Mathlib.RingTheory.Algebraic.Basic
import Mathlib.FieldTheory.Separable
import Mathlib.CategoryTheory.Endomorphism
import TauCeti.AlgebraicGeometry.AdicSpace.ValuationSpectrum

/-!
# AdicCoefficientsAndComparisonsPartII: representative target signatures

This file is not the roadmap and is not exhaustive: the roadmap document (README) is definitive.
The statements below suggest Lean forms for the parts of the roadmap whose carriers already exist in
Mathlib and Tau Ceti at the pinned commits, so that contributors and reviewers converge on names and
signatures. Everything else — tame and wild loci, Riemann–Zariski spaces as locally ringed spaces,
universal `P`-resolvability, log regular pairs, Gabber's modification theorems, stable modification
and the desingularization theorems — needs carriers that are not at the pins (regular schemes and
strict normal crossings divisors of SchemeAndStackFoundations, tame valued extensions of
LocalFieldsRamificationPartII, the log algebra of CrystallineCohomology CR.5) and is stated in the
README only; a closing comment lists those names.

Design choices made explicit here:
* `residueChars X` is a set of primes, defined through residue fields; `char(X) = ∅` exactly for
  `ℚ`-schemes.
* Maximal points are generic points of irreducible components; alterations of noetherian schemes
  are proper, surjective, maximally dominating and finite at the generic points
  (`IsAlteration'`), and their degree is read off at each maximal point.
* `P`-degree conditions are stated with `Nat.primeFactors`, so the empty set of primes allows only
  degree one.
* Valuations of a field are Mathlib's `ValuationSubring`s for the restriction maps, and Tau Ceti's
  `ValuationSpectrum` carries the Zariski topology of the absolute Riemann–Zariski space.
-/

namespace TauCetiRoadmap.AdicCoefficientsAndComparisonsPartII

open AlgebraicGeometry CategoryTheory

universe u

/-! ## Layer PA.0: Degree-controlled alterations and universal resolvability -/

section Degree

variable {X Y S : Scheme.{u}}

/-- `char(X)`: the primes `p` such that some residue field of `X` has characteristic `p`
(Temkin 2017, §1.2.1). Residue characteristic zero contributes nothing. -/
def residueChars (X : Scheme.{u}) : Set ℕ :=
  {p | p.Prime ∧ ∃ x : X, ringChar (X.residueField x) = p}

/-- A prime lies in `char(X)` exactly when it is not invertible on `X`. -/
theorem mem_residueChars_iff_not_isUnit (X : Scheme.{u}) {p : ℕ} (hp : p.Prime) :
    p ∈ residueChars X ↔ ¬ IsUnit (p : Γ(X, ⊤)) := sorry

/-- `char(X) = ∅` exactly when every prime is invertible on `X`, that is, `X` is a `ℚ`-scheme. -/
theorem residueChars_eq_empty_iff (X : Scheme.{u}) :
    residueChars X = ∅ ↔ ∀ p : ℕ, p.Prime → IsUnit (p : Γ(X, ⊤)) := sorry

/-- Residue characteristics can only shrink along a morphism. -/
theorem residueChars_mono (f : X ⟶ Y) : residueChars X ⊆ residueChars Y := sorry

/-- A surjective morphism has the same residue characteristics on both sides. -/
theorem residueChars_eq_of_surjective (f : X ⟶ Y) (hf : Function.Surjective f) :
    residueChars X = residueChars Y := sorry

/-- For a dominant morphism of finite type to a noetherian scheme only finitely many residue
characteristics of the target are lost (Temkin 2017, §4.3.2). -/
theorem residueChars_diff_finite_of_dominant [IsNoetherian S] (f : X ⟶ S) [IsDominant f]
    [LocallyOfFiniteType f] [QuasiCompact f] :
    (residueChars S \ residueChars X).Finite := sorry

/-- Test `residueChars_rat`: `char(Spec ℚ) = ∅`. -/
example : residueChars (Spec (CommRingCat.of ℚ)) = ∅ := sorry

/-- Test `residueChars_int`: `char(Spec ℤ)` is the set of all primes. -/
example : residueChars (Spec (CommRingCat.of ℤ)) = {p | p.Prime} := sorry

/-- Test `residueChars_fp_poly`: `char(Spec 𝔽_p[t]) = {p}`. -/
example (p : ℕ) [Fact p.Prime] :
    residueChars (Spec (CommRingCat.of (Polynomial (ZMod p)))) = {p} := sorry

/-- Test `residueChars_empty`: the empty scheme has no residue characteristics. -/
example : residueChars (⊥_ Scheme.{u}) = ∅ := sorry

/-- A maximal point: the generic point of an irreducible component. -/
def IsMaximalPoint {X : Scheme.{u}} (x : X) : Prop :=
  closure {x} ∈ irreducibleComponents X

/-- A morphism is maximally dominating if it maps maximal points to maximal points
(Temkin 2017, §4.1.1; ILO Exposé X, §2). -/
def IsMaximallyDominating (f : X ⟶ S) : Prop :=
  ∀ x : X, IsMaximalPoint x → IsMaximalPoint (f x)

theorem IsMaximallyDominating.comp {f : X ⟶ Y} {g : Y ⟶ S} (hf : IsMaximallyDominating f)
    (hg : IsMaximallyDominating g) : IsMaximallyDominating (f ≫ g) := sorry

/-- For irreducible source and target, maximal domination is dominance. -/
theorem IsMaximallyDominating.isDominant [IrreducibleSpace X] [IrreducibleSpace S] {f : X ⟶ S}
    (hf : IsMaximallyDominating f) : IsDominant f := sorry

/-- Test `maxdom_id`: the identity is maximally dominating. -/
example : IsMaximallyDominating (𝟙 X) := sorry

/-- The degree `[κ(x) : κ(f(x))]` of `f` at a point `x`; at a maximal point of the source of an
alteration this is its generic degree. -/
noncomputable def genericDegree (f : X ⟶ S) (x : X) : ℕ :=
  letI : Algebra (S.residueField (f x)) (X.residueField x) := (f.residueFieldMap x).hom.toAlgebra
  Module.finrank (S.residueField (f x)) (X.residueField x)

/-- An alteration of noetherian schemes: proper, surjective, maximally dominating, and finite at
the generic points — every point over a maximal point of `S` is a maximal point of `X` with a
finite residue extension (Temkin 2017, §4.1.2; ILO Exposé X, §3.3.1). For integral schemes this is
the alteration of SchemeAndStackFoundations §4.16. -/
def IsAlteration' (f : X ⟶ S) : Prop :=
  IsProper f ∧ Function.Surjective f ∧ IsMaximallyDominating f ∧
    ∀ x : X, IsMaximalPoint (f x) → IsMaximalPoint x ∧
      letI : Algebra (S.residueField (f x)) (X.residueField x) :=
        (f.residueFieldMap x).hom.toAlgebra
      Module.Finite (S.residueField (f x)) (X.residueField x)

/-- A `P`-alteration: an alteration whose degree at every maximal point has all its prime factors
in `P` (Temkin 2017, §1.2.1). `P = {ℓ}ᶜ` gives the `ℓ′`-alterations of ILO Exposé X. -/
def IsPAlteration (P : Set ℕ) (f : X ⟶ S) : Prop :=
  IsAlteration' f ∧ ∀ x : X, IsMaximalPoint x → ∀ q ∈ (genericDegree f x).primeFactors, q ∈ P

/-- A separable alteration: every residue extension at a maximal point is separable. -/
def IsSeparableAlteration (f : X ⟶ S) : Prop :=
  IsAlteration' f ∧ ∀ x : X, IsMaximalPoint x →
    letI : Algebra (S.residueField (f x)) (X.residueField x) := (f.residueFieldMap x).hom.toAlgebra
    Algebra.IsSeparable (S.residueField (f x)) (X.residueField x)

theorem IsAlteration'.comp {f : X ⟶ Y} {g : Y ⟶ S} (hf : IsAlteration' f)
    (hg : IsAlteration' g) : IsAlteration' (f ≫ g) := sorry

theorem IsPAlteration.comp {P : Set ℕ} {f : X ⟶ Y} {g : Y ⟶ S} (hf : IsPAlteration P f)
    (hg : IsPAlteration P g) : IsPAlteration P (f ≫ g) := sorry

theorem IsPAlteration.mono {P P' : Set ℕ} (h : P ⊆ P') {f : X ⟶ S} (hf : IsPAlteration P f) :
    IsPAlteration P' f :=
  ⟨hf.1, fun x hx q hq ↦ h (hf.2 x hx q hq)⟩

/-- Every alteration is a `P`-alteration for the set of all primes. -/
theorem isPAlteration_univ {f : X ⟶ S} (hf : IsAlteration' f) : IsPAlteration Set.univ f :=
  ⟨hf, fun _ _ _ _ ↦ trivial⟩

/-- Test `palteration_empty`: the identity is a `∅`-alteration; its degrees are `1`, which has no
prime factors. -/
example : IsPAlteration ∅ (𝟙 X) := sorry

/-- Test `palteration_gaussian`: `Spec ℤ[i] → Spec ℤ` is a separable `{2}`-alteration. -/
example : IsPAlteration {2} (Spec.map (CommRingCat.ofHom (Int.castRingHom GaussianInt))) ∧
    IsSeparableAlteration (Spec.map (CommRingCat.ofHom (Int.castRingHom GaussianInt))) := sorry

/-- Test `palteration_gaussian_not_empty`: `Spec ℤ[i] → Spec ℤ` is not a `∅`-alteration; its
degree is `2`. -/
example : ¬ IsPAlteration ∅ (Spec.map (CommRingCat.ofHom (Int.castRingHom GaussianInt))) := sorry

end Degree

/-! ## Layer PA.1: Riemann–Zariski spaces of pointed schemes -/

section RiemannZariski

/-- A pointed scheme: a field `K` and a morphism `Spec K → X` to a quasi-compact, quasi-separated
scheme; the point need not be dominant (Temkin 2017, §3.1.1). -/
structure PointedScheme where
  /-- The field of the point. -/
  K : Type u
  [field : Field K]
  /-- The quasi-compact quasi-separated scheme. -/
  X : Scheme.{u}
  [compactSpace : CompactSpace X]
  [quasiSeparatedSpace : QuasiSeparatedSpace X]
  /-- The point. -/
  pt : Spec (CommRingCat.of K) ⟶ X

/-- `Val_K(X)′`: the valuation rings `O` of `K` for which the point `Spec K → X` extends to
`Spec O → X` (Temkin 2017, §§3.1.2 and 3.1.7). -/
def centred {K : Type u} [Field K] {X : Scheme.{u}} (ε : Spec (CommRingCat.of K) ⟶ X) :
    Set (ValuationSubring K) :=
  {O | ∃ g : Spec (CommRingCat.of O) ⟶ X, Spec.map (CommRingCat.ofHom (algebraMap O K)) ≫ g = ε}

/-- Test `centred_spec_int`: every valuation ring of `K` has a centre on `Spec ℤ`. -/
example {K : Type} [Field K] (ε : Spec (CommRingCat.of K) ⟶ Spec (CommRingCat.of ℤ)) :
    centred ε = Set.univ := sorry

/-- Restriction of valuations along a field extension, `ψ_{L/K}(O) = O ∩ K`
(Temkin 2017, §3.1.7). -/
def restrictField (K : Type*) {L : Type*} [Field K] [Field L] [Algebra K L]
    (O : ValuationSubring L) : ValuationSubring K :=
  O.comap (algebraMap K L)

theorem restrictField_comp (K L M : Type*) [Field K] [Field L] [Field M] [Algebra K L]
    [Algebra L M] [Algebra K M] [IsScalarTower K L M] (O : ValuationSubring M) :
    restrictField K (restrictField L O) = restrictField K O := sorry

/-- For an algebraic extension every valuation of `K` extends (Chevalley). -/
theorem restrictField_surjective_of_algebraic (K L : Type*) [Field K] [Field L] [Algebra K L]
    [Algebra.IsAlgebraic K L] : Function.Surjective (restrictField K (L := L)) := sorry

/-- Test `restrict_trivial`: the trivial valuation restricts to the trivial valuation. -/
example (K L : Type*) [Field K] [Field L] [Algebra K L] :
    restrictField K (⊤ : ValuationSubring L) = ⊤ := sorry

/-- Test `restrict_not_injective`: the two valuation rings of `ℚ(i)` above `5` restrict to the same
valuation ring of `ℚ`, so restriction is not injective. -/
example : ¬ Function.Injective
    (restrictField ℚ (L := CyclotomicField 4 ℚ)) := sorry

/-- Openness of restriction for finite field extensions in the Zariski topology of the
valuation spectrum (Temkin 2017, Lemma 3.1.6 and §3.1.7). -/
theorem restrictField_isOpenMap (K L : Type*) [Field K] [Field L] [Algebra K L]
    [FiniteDimensional K L] :
    IsOpenMap (TauCeti.ValuationSpectrum.comap (algebraMap K L)) := sorry

end RiemannZariski

/-! ## Layer PA.3: Tame distillation for alterations (group actions) -/

section GroupActions

/-- The decomposition group of a point under an action of `G` by automorphisms of a scheme:
the elements fixing the point. The inertia group, its subgroup acting trivially on `κ(x)`, and
tameness are README targets. -/
def decompositionGroup {G : Type*} [Group G] {X : Scheme.{u}} (ρ : G →* Aut X) (x : X) : Set G :=
  {g | (ρ g).hom x = x}

/-- Test `decompositionGroup_one`: the identity lies in every decomposition group. -/
example {G : Type*} [Group G] {X : Scheme.{u}} (ρ : G →* Aut X) (x : X) :
    (1 : G) ∈ decompositionGroup ρ x := sorry

end GroupActions

/-! The normalization of `X` in a finite extension of its function field (Layer PA.3) is Mathlib's
relative normalization of `Spec L → X`. -/
#check @AlgebraicGeometry.Scheme.Hom.normalization

/-!
## Statements not typed at the pins

The README states the following targets. Most are absent from this file because their carriers
(regular schemes, strict normal crossings divisors, tame valued extensions, log structures, or the
morphism properties they quantify over) are not in Mathlib or Tau Ceti at the pinned commits. A few
PA.0 and PA.1 items below (for example `residueChars_spec_field`, `maxdom_dense_open`,
`alteration_frobenius`, `absval_rat`) are statable at the pins and are left out only to keep this
file to a representative subset; the README is definitive for them.

Layer PA.0: Residue characteristics of a scheme: `residueChars_open_le`,
`residueChars_spec_field`, `residueChars_localization_two`, `residueChars_int_inv_six`; Maximal
points and maximally dominating morphisms: `isMaximallyDominating_iff_dense_genericFiber`,
`IsMaximallyDominating.of_isOpenImmersion_dense`, `IsMaximallyDominating.restrict`,
`maxdom_dense_open`, `maxdom_closed_point_fails`, `maxdom_dominant_not_maxdom`; Alterations of
noetherian schemes: `isAlteration'_iff_isAlteration`, `isAlteration'_normalization`,
`IsAlteration'.reduction`, `IsAlteration'.of_isModification`, `alteration_cusp_normalization`,
`alteration_frobenius`, `not_alteration_projective_line`, `not_alteration_extra_point`,
`alteration_id`; P-alterations, ℓ′-alterations and separable alterations:
`isPAlteration_empty_iff`, `IsSeparableAlteration.comp`, `isPAlteration_compl_singleton`,
`palteration_frobenius`, `palteration_square_map_charzero`, `palteration_all_primes`; Pseudo-
projective morphisms: `IsPseudoProjective`, `IsPseudoProjective.of_isQuasiProjective`,
`isPseudoProjective_iff_quasiProjective_of_separated`, `IsPseudoProjective.baseChange`,
`IsPseudoProjective.not_comp`, `pseudoProjective_quasiProjective`,
`pseudoProjective_doubled_origin`, `not_pseudoProjective_blowup_doubled_origin`,
`pseudoProjective_id`; Flattening of finite-type morphisms by admissible blow-ups; Chow's lemma
for non-separated morphisms; Strict normal crossings supports: `IsSNCSupport`,
`IsSNCSupport.empty`, `IsSNCSupport.union_components`, `IsSNCSupport.of_cartier_subset`,
`IsSNCSupport.codim_one`, `IsSNCSupport.restrict`, `IsSNCSupport.preimage_smooth`, `snc_axes`,
`snc_empty`, `not_snc_point`, `not_snc_nodal_cubic`, `not_snc_three_lines`; Universal
P-resolvability: `IsUniversallyPResolvable`, `IsUniversallySeparablyPResolvable`,
`IsUniversallyPResolvable.mono`, `IsUniversallyPResolvable.of_alteration`,
`IsUniversallyPResolvable.of_resolvable`, `isUniversallyPResolvable_spec_field`, `upr_field`,
`upr_mono`, `upr_nonqe_dvr_fails`, `upr_empty`; Universal resolvability in dimension at most one;
Universal resolvability of excellent surfaces; Universal resolvability of quasi-excellent
threefolds.

Layer PA.1: Pointed schemes and their modifications: `PointedScheme.Hom`,
`PointedScheme.IsModification`, `PointedScheme.IsTight`, `PointedScheme.modifications_isFiltered`,
`PointedScheme.exists_tight_le`, `pointed_id_modification`,
`pointed_open_immersion_not_modification`, `pointed_closed_point_tight`,
`pointed_blowup_modification`; Riemann–Zariski space of a pointed scheme: `RZSpace`,
`RZSpace.proj`, `RZSpace.stalk_eq_colim`, `RZSpace.isConstructible_iff`, `RZSpace.map`,
`rz_proper_trivial`, `rz_dvr`, `rz_affine_line_points`, `rz_not_noetherian`; Valuative points of a
pointed scheme: `ValPoints`, `ValPoints.toValuationSubring`,
`ValPoints.toValuationSubring_injective`, `ValPoints.exists_of_proper`, `ValPoints.centre`,
`valpoints_dvr`, `valpoints_proper`, `valpoints_finite_field`, `valpoints_doubled_origin`;
Compactness and the valuative description of RZ spaces; Functoriality of Riemann–Zariski spaces:
`RZSpace.restrict`, `RZSpace.restrict_comp`, `RZSpace.restrict_id`, `RZSpace.map_compatible`,
`restrict_rat_gaussian`, `restrict_tower`; Openness of the restriction map; Absolute
Riemann–Zariski spaces and centres: `absVal`, `absValEquivSpv`, `isCompact_centred`, `absval_rat`,
`absval_finite_field`, `centred_inv_p`, `restrict_gaussian_fibre`; Comparison with the affine
Zariski–Riemann limit.

Layer PA.2: Tame, wild and unramified loci: `tameLocus`, `wildLocus`, `unramifiedLocus`,
`unramifiedLocus_subset_tameLocus`, `mem_tameLocus_iff`, `tameLocus_self`,
`tameLocus_gaussian_two`, `tameLocus_trivial_valuation`, `tameLocus_artin_schreier`,
`tameLocus_self_all`; S-tameness and P-tameness: `IsSTame`, `IsXTame`, `chars`, `IsPTame`,
`isPTame_iff_spec_localization`, `IsXTame.of_modification`, `IsSTame.mono`,
`IsSTame.subextension`, `ptame_empty_P`, `ptame_gaussian`, `stame_empty`, `chars_val_rat`,
`not_ptame_artin_schreier`; P-closed fields are P-tame; Tame and unramified loci in towers and
composita; Openness of the tame and unramified loci; Tame distillation for finite field
extensions; Separable tame distillation for finite separable extensions.

Layer PA.3: Inertia, tame actions and inertia specialization: `inertiaGroup`, `IsTameAction`,
`IsInertiaSpecializing`, `isInertiaSpecializing_iff_isClosed_fixedPoints`, `IsAdmissibleAction`,
`quotient`, `IsTameAction.of_order_invertible`, `inertia_sign_plane`,
`not_tame_gaussian_conjugation`, `tame_trivial_group`, `not_inertia_specializing_doubled_origin`,
`decomposition_ne_inertia`; Galois alterations and tame Galois coverings: `IsGaloisAlteration`,
`IsSeparableGaloisAlteration`, `IsGaloisCovering`, `IsTameGaloisCovering`,
`IsGaloisCovering.quotient_isIso`, `isGaloisCovering_normalization`,
`IsTameGaloisCovering.of_order_invertible`, `galois_covering_gaussian`,
`tame_galois_covering_inv2`, `galois_alteration_frobenius`, `galois_identity`, `not_galois_cubic`;
Normalization in a finite extension of the function field: `normalizationIn`,
`normalizationIn_isFinite`, `normalizationIn_functionField`, `normalizationIn_isNormal`,
`normalizationIn_map`, `normalizationIn_self_of_normal`, `normalizationIn_gaussian`,
`normalizationIn_cusp`, `normalizationIn_inseparable`, `normalizationIn_not_finite`; Wild primes
set of an alteration: `wildPrimes`, `wildPrimes_subset_residueChars`, `wildPrimes_le_degree`,
`wildPrimes_eq_empty_of_tame`, `wildPrimes_modification`, `wildPrimes_gaussian`,
`wildPrimes_tame`, `wildPrimes_frobenius`, `wildPrimes_charzero`; Tame Galois coverings after
modification; Galois closures preserve S-tameness; Tame distillation of alterations; Separable
tame distillation of alterations.

Layer PA.4: Log regular pairs: `IsLogRegularPair`, `IsLogRegularPair.of_snc`,
`IsLogRegularPair.empty_iff`, `IsLogRegularPair.dense_triviality`,
`IsLogRegularPair.of_logRegular`, `IsLogRegularPair.strata`, `logRegularPair_axes`,
`logRegularPair_empty_regular`, `not_logRegularPair_cusp`, `logRegularPair_toric_quotient`,
`not_logRegularPair_point`; Very tame actions: `IsVeryTameAt`, `IsVeryTame`, `IsVeryTame.isTame`,
`IsVeryTame.isOpen`, `IsVeryTame.inertia_abelian`, `not_veryTame_sign_trivial_log`,
`veryTame_sign_axes`, `veryTame_trivial_group`, `not_veryTame_wild`; Quotients by very tame
actions; Log blow-ups and saturated log blow-ups: `logBlowup`, `satLogBlowup`,
`satLogBlowup_eq_normalizedBlowup`, `logBlowup_baseChange_strict`, `satLogBlowup_logRegular`,
`satLogBlowup_projective`, `logBlowup_axes_origin`, `logBlowup_unit_ideal`,
`logBlowup_invertible`, `satLogBlowup_differs`; Monoidal desingularization of log regular schemes;
Gabber's modification theorem, absolute case; Gabber's preparation lemma for equivariant log
smooth maps; Gabber's modification theorem, log smooth case; Log smoothness for intermediate
boundaries; Local forms of log smooth maps to points and traits.

Layer PA.5: Multipointed curves and their stable modifications: `MultipointedCurve`,
`MultipointedCurve.IsSemistable`, `MultipointedCurve.Modification`,
`MultipointedCurve.IsStableModification`, `MultipointedCurve.IsSemistable.baseChange`,
`MultipointedCurve.isSemistable_iff_fibres`, `MultipointedCurve.toPointedCurve`,
`mpc_affine_line`, `mpc_node_dvr`, `not_mpc_cusp`, `not_stable_blowup`,
`not_semistable_marking_on_node`; Stable modification theorem: projectivity; Stable modification
theorem: existence and uniqueness; Equivariance of stable modification; Semistable multipointed
curves are log smooth; Resolution of relative curves by P-alterations.

Layer PA.6: P-altered desingularization of morphisms; Inheritance of universal P-resolvability;
Separable desingularization over a perfect field; Desingularization by char(X)-alterations;
Desingularization of morphisms by char(S)-alterations; Refinement: char(X)-alterations of the
source; Gabber's prime-to-ℓ alteration theorem over a field; Gabber's prime-to-ℓ alteration
theorem over a one-dimensional base; Prime-to-ℓ alterations of varieties with snc boundary; Odd-
degree regular alterations of models over a henselian DVR; de Jong's equivariant (Galois)
alteration theorem; de Jong's alteration theorem over a Dedekind base.

-/

end TauCetiRoadmap.AdicCoefficientsAndComparisonsPartII
