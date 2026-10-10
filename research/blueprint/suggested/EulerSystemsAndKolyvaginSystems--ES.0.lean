import Mathlib.Analysis.SpecialFunctions.Pow.Real
import Mathlib.Topology.Algebra.InfiniteSum.Real
import TauCeti.FieldTheory.Galois.AbsoluteGaloisGroup
import TauCeti.RepresentationTheory.Homological.ContCohomology.Functoriality
import TauCeti.RepresentationTheory.Homological.ContCohomology.Corestriction
import Mathlib.NumberTheory.NumberField.InfinitePlace.Basic
import Mathlib.NumberTheory.NumberField.Ideal.Basic
import Mathlib.FieldTheory.Galois.Infinite
import Mathlib.RingTheory.DedekindDomain.Ideal.Lemmas
import Mathlib.RingTheory.DiscreteValuationRing.Basic
import Mathlib.RingTheory.Length
import Mathlib.LinearAlgebra.ExteriorPower.Basis
import Mathlib.LinearAlgebra.ExteriorPower.Pairing
import Mathlib.LinearAlgebra.Quotient.Basic
import Mathlib.LinearAlgebra.Charpoly.Basic
import Mathlib.Topology.Instances.AddCircle.Defs
import Mathlib.Algebra.MonoidAlgebra.Basic
import Mathlib.Algebra.Polynomial.Div
import Mathlib.Combinatorics.SimpleGraph.Basic
import Mathlib.Algebra.Group.End
import Mathlib.GroupTheory.OrderOfElement
import Mathlib.GroupTheory.Torsion
import Mathlib.LinearAlgebra.PiTensorProduct.Basic
import Mathlib.Topology.Instances.ZMod
import Mathlib.LinearAlgebra.TensorProduct.Basic
import Mathlib.Algebra.Module.Torsion.Free
import Mathlib.RingTheory.AdicCompletion.Basic
import Mathlib.RingTheory.LocalRing.ResidueField.Basic
import Mathlib.NumberTheory.Padics.PadicIntegers
import Mathlib.NumberTheory.ClassNumber.Finite
import Mathlib.Algebra.DirectSum.Module
import Mathlib.LinearAlgebra.DFinsupp
import Mathlib.NumberTheory.NumberField.Discriminant.Defs
import Mathlib.AlgebraicGeometry.EllipticCurve.Affine.Point
import Mathlib.AlgebraicGeometry.EllipticCurve.VariableChange
import Mathlib.Algebra.Homology.DerivedCategory.Ext.Basic
import TauCeti.AlgebraicGeometry.AbelianVariety.Basic

/-!
Suggested declarations for ES.0–ES.7. This file is not the roadmap.
This is a prototype, not an implementation.
The packet and reader document give the definitive mathematical statements.
The file is not exhaustive: its statements suggest Lean forms so that contributors
and reviewers converge on names and signatures. Proofs and imported constructions use `sorry`. Supplier adapters below
use Mathlib's continuous cohomology and actual absolute Galois subgroups; their
comparison equations specify the imported interfaces, without adding roadmap
ownership of those interfaces. General exterior-bidual algebra belongs to L6.
Unavailable geometric and archimedean conditions are omitted explicitly under
PROTOCOL §13, with their full statements retained in the packet and exact
supplier requests. See the Nekovář, elliptic, local-torsion and Rubin–Stark
scope notes below; the displayed data alone do not imply those source theorems.
-/
noncomputable section
open CategoryTheory Polynomial
open scoped TensorProduct
attribute [local instance] Classical.propDecidable
attribute [local instance] Classical.decEq
-- DVR and local-ring interfaces both depend on Nontrivial; the overlapping-instance linter
-- reports their necessary dependent parameters at this Mathlib pin.
set_option linter.overlappingInstances false
set_option linter.unusedVariables false
set_option maxHeartbeats 1000000
universe u
namespace TauCeti.KolyvaginSystems
variable (K R : Type) [Field K] [NumberField K] [CommRing R] [TopologicalSpace R]
abbrev GK := TauCeti.AbsoluteGaloisGroup K
abbrev Prime := IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers K)
abbrev Place := NumberField.InfinitePlace K ⊕ Prime K
abbrev Rep := TopRep.{0} R (GK K)
abbrev H (T : Rep K R) (n : ℕ) := continuousCohomology n T
/-- Chosen decomposition and inertia subgroups supplied by LocalGaloisGroups. -/
def decomposition (v : Place K) : Subgroup (GK K) := sorry
def inertia (v : Place K) : Subgroup (decomposition K v) := sorry
abbrev localRep (T : Rep K R) (v : Place K) : TopRep R (decomposition K v) :=
  TopRep.res (decomposition K v).subtype T
abbrev LocalH (T : Rep K R) (v : Place K) (n : ℕ) :=
  continuousCohomology n (localRep K R T v)
def loc (T : Rep K R) (v : Place K) : H K R T 1 →ₗ[R] LocalH K R T v 1 :=
  (TauCeti.ContinuousCohomology.res (decomposition K v) T 1).hom.toLinearMap
def unramified (T : Rep K R) (v : Place K) : Submodule R (LocalH K R T v 1) :=
  LinearMap.ker (TauCeti.ContinuousCohomology.res (inertia K v) (localRep K R T v) 1).hom.toLinearMap
def IsContinuous (T : Rep K R) : Prop :=
  Continuous (fun gt : GK K × T => T.ρ gt.1 gt.2)
def IsUnramified (T : Rep K R) (v : Place K) : Prop :=
  ∀ g : inertia K v, ∀ t : T, T.ρ (g.val.val) t = t
/-- Arithmetic Selmer carrier imported from L2, instantiated on canonical H¹. -/
structure SelmerStructure (T : Rep K R) where
  sigma : Finset (Place K)
  condition : (v : Place K) → Submodule R (LocalH K R T v 1)
  off_sigma : ∀ v ∉ sigma, condition v = unramified K R T v
  ramification : ∀ v ∉ sigma, IsUnramified K R T v
variable {K R}
def SelmerStructure.selmer {T : Rep K R} (F : SelmerStructure K R T) : Submodule R (H K R T 1) :=
  ⨅ v, (F.condition v).comap (loc K R T v)
variable (K R) in
structure SelmerTriple (T : Rep K R) where
  free : Module.Free R T
  finite : Module.Finite R T
  continuous : IsContinuous K R T
  F : SelmerStructure K R T
  primes : Set (Prime K)
  disjoint : ∀ q ∈ primes, Sum.inr q ∉ F.sigma
abbrev Conductor (K : Type) [Field K] [NumberField K] := Finset (Prime K)
def SelmerTriple.conductors {T : Rep K R} (S : SelmerTriple K R T) : Set (Conductor K) :=
  {n | ∀ q ∈ n, q ∈ S.primes}
lemma SelmerTriple.one_mem_conductors {T : Rep K R} (S : SelmerTriple K R T) :
  ∅ ∈ S.conductors := sorry
lemma SelmerTriple.conductors_dvd_closed {T : Rep K R} (S : SelmerTriple K R T)
    {m n : Conductor K} (hn : n ∈ S.conductors) (hmn : m ⊆ n) : m ∈ S.conductors := sorry
def SelmerTriple.restrictPrimes {T : Rep K R} (S : SelmerTriple K R T)
    (P : Set (Prime K)) (hP : P ⊆ S.primes) : SelmerTriple K R T := sorry
lemma restrictPrimes_conductors {T : Rep K R} (S : SelmerTriple K R T)
    (P : Set (Prime K)) (hP : P ⊆ S.primes) :
    (S.restrictPrimes P hP).conductors ⊆ S.conductors := sorry
-- Tests are statements against these arithmetic carriers, not a parallel Selmer model.
-- Unit test: SelmerTriple.conductors_empty
example {T : Rep K R} (S : SelmerTriple K R T) (h : S.primes = ∅) :
    S.conductors = {∅} := sorry
-- Unit test: SelmerTriple.card_conductors_of_finite
example {T : Rep K R} (S : SelmerTriple K R T) (q₁ q₂ : Prime K) (h : q₁ ≠ q₂)
    (hP : S.primes = {q₁, q₂}) :
    S.conductors = {∅, {q₁}, {q₂}, {q₁, q₂}} := sorry
-- Unit test: SelmerTriple.disjoint_sigma
example {T : Rep K R} (S : SelmerTriple K R T) (n : Conductor K)
    (hn : n ∈ S.conductors) (q : Prime K) (hq : Sum.inr q ∈ S.F.sigma) : q ∉ n := sorry
/-- The ideal product records squarefreeness; repeated prime powers are excluded. -/
def conductorProduct (n : Conductor K) : Ideal (NumberField.RingOfIntegers K) :=
  n.prod (fun q => q.asIdeal)
-- Unit test: SelmerTriple.not_mem_conductors_of_sq
example (q : Prime K) : ∀ n : Conductor K, conductorProduct n ≠ q.asIdeal ^ 2 := sorry

/-- Quotient-representation adapter from L2 with an explicit quotient dictionary. -/
def quotientRep (T : Rep K R) (I : Ideal R) : Rep K R := sorry
def quotientEquiv (T : Rep K R) (I : Ideal R) :
    quotientRep T I ≃ₗ[R] (T ⧸ (I • (⊤ : Submodule R T))) := sorry
def quotientMap (T : Rep K R) (I : Ideal R) : T ⟶ quotientRep T I := sorry
lemma quotientMap_apply (T : Rep K R) (I : Ideal R) (t : T) :
    quotientEquiv T I ((quotientMap T I).hom t) = Submodule.Quotient.mk t := sorry
lemma quotient_ρ (T : Rep K R) (I : Ideal R) (g : GK K) (t : T) :
    (quotientRep T I).ρ g ((quotientMap T I).hom t) = (quotientMap T I).hom (T.ρ g t) := sorry
def coeff (T T' : Rep K R) (f : T ⟶ T') (n : ℕ) : H K R T n →ₗ[R] H K R T' n :=
  (TauCeti.ContinuousCohomology.coeffMap f n).hom.toLinearMap
structure QuotCat (T : Rep K R) where
  ideal : Ideal R
/-- Morphisms are the actual quotient maps induced by scalars. -/
def QuotCat.scalarHom (T : Rep K R) (I J : Ideal R) (r : R)
    (hr : ∀ a ∈ I, r * a ∈ J) : quotientRep T I ⟶ quotientRep T J := sorry
lemma QuotCat.scalarHom_apply (T : Rep K R) (I J : Ideal R) (r : R)
    (hr : ∀ a ∈ I, r * a ∈ J) (t : T) :
    (QuotCat.scalarHom T I J r hr).hom ((quotientMap T I).hom t) =
      (quotientMap T J).hom (r • t) := sorry
lemma QuotCat.scalarHom_comp (T : Rep K R) (I J L : Ideal R) (r s : R)
    (hr : ∀ a ∈ I, r * a ∈ J) (hs : ∀ a ∈ J, s * a ∈ L)
    (hsr : ∀ a ∈ I, (s*r)*a ∈ L) :
    QuotCat.scalarHom T I J r hr ≫ QuotCat.scalarHom T J L s hs =
      QuotCat.scalarHom T I L (s*r) hsr := sorry
lemma QuotCat.scalarHom_injective_iff (T : Rep K R) [Module.Free R T]
    [Module.Finite R T] [Nontrivial T] (I J : Ideal R) (r : R)
    (hr : ∀ a ∈ I, r * a ∈ J) :
    Function.Injective (QuotCat.scalarHom T I J r hr).hom ↔
      ∀ a : R, r * a ∈ J ↔ a ∈ I := sorry
def propagated (T : Rep K R) (v : Place K) (L : Submodule R (LocalH K R T v 1))
    (I : Ideal R) : Submodule R (LocalH K R (quotientRep T I) v 1) :=
  L.map (TauCeti.ContinuousCohomology.coeffMap
    (TopRep.resFunctor (decomposition K v).subtype |>.map (quotientMap T I)) 1).hom.toLinearMap
lemma QuotCat.propagate_functorial (T : Rep K R) (v : Place K)
    (L : Submodule R (LocalH K R T v 1)) (I J : Ideal R) (r : R)
    (hr : ∀ a ∈ I, r * a ∈ J) :
    (propagated T v L I).map (TauCeti.ContinuousCohomology.coeffMap
      (TopRep.resFunctor (decomposition K v).subtype |>.map (QuotCat.scalarHom T I J r hr)) 1).hom.toLinearMap
      ≤ propagated T v L J := sorry
-- Unit test: QuotCat.quotient_zero
example (T : Rep K R) (I : Ideal R) :
    quotientEquiv T I ((quotientMap T I).hom 0) = 0 := sorry
-- Unit test: QuotCat.zmod_sq_mul_p_injective
example (p : ℕ) [Fact p.Prime] :
    ∀ a : ZMod (p^2), (p : ZMod (p^2))*a = 0 ↔ a ∈ Ideal.span {(p : ZMod (p^2))} := sorry
-- Unit test: QuotCat.not_hom_of_not_le
example (p : ℕ) [Fact p.Prime] :
    ¬ (∀ a ∈ Ideal.span {(p : ZMod (p^2))}, (1 : ZMod (p^2))*a ∈ (⊥ : Ideal (ZMod (p^2)))) := sorry

def IsCartesian (T : Rep K R) (v : Place K) (L : Submodule R (LocalH K R T v 1)) : Prop :=
  ∀ (I J : Ideal R) (r : R) (hr : ∀ a ∈ I, r*a ∈ J),
    Function.Injective (QuotCat.scalarHom T I J r hr).hom →
    propagated T v L I = (propagated T v L J).comap
      (TauCeti.ContinuousCohomology.coeffMap
        (TopRep.resFunctor (decomposition K v).subtype |>.map (QuotCat.scalarHom T I J r hr)) 1).hom.toLinearMap
lemma isCartesian_of_field (T : Rep K R) (hR : IsField R) (v : Place K)
    (L : Submodule R (LocalH K R T v 1)) : IsCartesian T v L := sorry
lemma isCartesian_unramified (T : Rep K R) (v : Place K)
    (h : IsUnramified K R T v) : IsCartesian T v (unramified K R T v) := sorry
lemma IsCartesian.quotient (T : Rep K R) (v : Place K) (L : Submodule R (LocalH K R T v 1))
    (h : IsCartesian T v L) (I : Ideal R) :
    IsCartesian (quotientRep T I) v (propagated T v L I) := sorry
-- Unit test: isCartesian_strict_and_relaxed_field
example (T : Rep K R) (hR : IsField R) (v : Place K) :
    IsCartesian T v ⊥ ∧ IsCartesian T v ⊤ := sorry
-- Unit test: isCartesian_unramified
example (T : Rep K R) (v : Place K) (h : IsUnramified K R T v) :
    IsCartesian T v (unramified K R T v) := sorry
-- The non-cartesian example uses the actual local cohomology and a nonzero character.
-- Unit test: not_isCartesian_torsion_condition
example (p : ℕ) [Fact p.Prime] (T : Rep K (ZMod (p^2)))
    (v : Place K) (hT : ∀ g : GK K, ∀ t : T, T.ρ g t = t)
    (e : T ≃ₗ[ZMod (p^2)] ZMod (p^2))
    (hne : Nontrivial (LocalH K (ZMod (p^2)) (quotientRep T (Ideal.span {(p : ZMod (p^2))})) v 1)) :
    ¬ IsCartesian T v (LinearMap.ker ((p : ZMod (p^2)) • (LinearMap.id :
      LocalH K (ZMod (p^2)) T v 1 →ₗ[ZMod (p^2)] LocalH K (ZMod (p^2)) T v 1))) := sorry

/-- Quotient scalar maps are identified when they have the same action on T/IT. -/
instance quotientCategory (T : Rep K R) : Category (QuotCat T) where
  Hom I J := {f : quotientRep T I.ideal ⟶ quotientRep T J.ideal //
    ∃ (r : R) (hr : ∀ a ∈ I.ideal, r*a ∈ J.ideal), f = QuotCat.scalarHom T I.ideal J.ideal r hr}
  id := sorry
  comp := sorry
  id_comp := sorry
  comp_id := sorry
  assoc := sorry

abbrev QZ := AddCircle (1 : ℚ)
local instance qzTopology : TopologicalSpace QZ := ⊥
local instance qzDiscrete : DiscreteTopology QZ := ⟨rfl⟩
/-- Cyclotomic action on torsion roots, transported to ℚ/ℤ. -/
def cyclotomicAction (K : Type) [Field K] [NumberField K] : GK K → AddAut QZ := sorry
/-- L1/L2 Cartier dual, with the actual Hom and Galois-action dictionary. -/
def dualRep (T : Rep K R) : Rep K R := sorry
def dualEquiv (T : Rep K R) : dualRep T ≃+ ContinuousAddMonoidHom T QZ := sorry
lemma dual_smul (T : Rep K R) (r : R) (f : dualRep T) (t : T) :
    dualEquiv T (r • f) t = dualEquiv T f (r • t) := sorry
lemma dual_ρ (T : Rep K R) (g : GK K) (f : dualRep T) (t : T) :
    dualEquiv T ((dualRep T).ρ g f) t =
      cyclotomicAction K g (dualEquiv T f (T.ρ g⁻¹ t)) := sorry
def localPairing (T : Rep K R) (v : Place K) :
    LocalH K R T v 1 →+ LocalH K R (dualRep T) v 1 →+ QZ := sorry
lemma localPairing_balanced (T : Rep K R) (v : Place K) (r : R)
    (x : LocalH K R T v 1) (y : LocalH K R (dualRep T) v 1) :
    localPairing T v (r • x) y = localPairing T v x (r • y) := sorry
def orthogonal (T : Rep K R) (v : Place K) (L : Submodule R (LocalH K R T v 1)) :
    Submodule R (LocalH K R (dualRep T) v 1) := sorry
lemma mem_orthogonal (T : Rep K R) (v : Place K) (L : Submodule R (LocalH K R T v 1))
    (y : LocalH K R (dualRep T) v 1) : y ∈ orthogonal T v L ↔
      ∀ x ∈ L, localPairing T v x y = 0 := sorry
def dualStructure (T : Rep K R) (F : SelmerStructure K R T) :
    SelmerStructure K R (dualRep T) := sorry
lemma dualStructure_condition (T : Rep K R) (F : SelmerStructure K R T) (v : Place K) :
    (dualStructure T F).condition v = orthogonal T v (F.condition v) := sorry
/-- The Cartier-dual data have no lattice freeness field. -/
structure CartierSelmerData (T : Rep K R) where
  F : SelmerStructure K R (dualRep T)
  primes : Set (Prime K)
  disjoint : ∀ q ∈ primes, Sum.inr q ∉ F.sigma
def SelmerTriple.dual {T : Rep K R} (S : SelmerTriple K R T) : CartierSelmerData T := sorry
lemma SelmerTriple.dual_sigma {T : Rep K R} (S : SelmerTriple K R T) :
    S.dual.F.sigma = S.F.sigma := sorry

def IsCartesianStructure (T : Rep K R) (F : SelmerStructure K R T) : Prop :=
  ∀ v ∈ F.sigma, IsCartesian T v (F.condition v)
def propagatedStructure (T : Rep K R) (F : SelmerStructure K R T) (I : Ideal R) :
    SelmerStructure K R (quotientRep T I) := sorry
lemma propagatedStructure_condition (T : Rep K R) (F : SelmerStructure K R T)
    (I : Ideal R) (v : Place K) : (propagatedStructure T F I).condition v =
      propagated T v (F.condition v) I := sorry
abbrev len (R : Type) [CommRing R] (M : Type) [AddCommGroup M] [Module R M] : ℕ :=
  (Module.length R M).toNat
/-- Finite-length hypothesis prevents the `.toNat` convention from hiding infinity. -/
def FiniteSelmerLengths (T : Rep K R) (F : SelmerStructure K R T) : Prop :=
  Module.length R F.selmer ≠ ⊤ ∧ Module.length R (dualStructure T F).selmer ≠ ⊤
def NoResidualInvariants (T : Rep K R) (m : Ideal R) : Prop :=
  Subsingleton (H K R (quotientRep T m) 0) ∧
  Subsingleton (H K R (dualRep (quotientRep T m)) 0)
def coreRankInt (T : Rep K R) (F : SelmerStructure K R T) : ℤ :=
  ((len R F.selmer : ℤ) - len R (dualStructure T F).selmer) / len R R
def coreRank (T : Rep K R) (F : SelmerStructure K R T) : ℕ := (coreRankInt T F).toNat
lemma coreRank_mul_length (T : Rep K R) (F : SelmerStructure K R T)
    [IsArtinianRing R] [IsLocalRing R] [IsPrincipalIdealRing R]
    [Module.Free R T] [Module.Finite R T] (hc : IsCartesianStructure T F)
    (h0 : NoResidualInvariants T (IsLocalRing.maximalIdeal R)) (hf : FiniteSelmerLengths T F) :
    (len R F.selmer : ℤ) - len R (dualStructure T F).selmer =
      coreRankInt T F * len R R := sorry
lemma coreRank_eq_zero_or_dual (T : Rep K R) (F : SelmerStructure K R T)
    [IsArtinianRing R] [IsLocalRing R] [IsPrincipalIdealRing R]
    [Module.Free R T] [Module.Finite R T] (hc : IsCartesianStructure T F)
    (h0 : NoResidualInvariants T (IsLocalRing.maximalIdeal R)) (hf : FiniteSelmerLengths T F) :
    coreRank T F = 0 ∨ coreRank (dualRep T) (dualStructure T F) = 0 := sorry
lemma selmer_equiv_dual_prod_free (T : Rep K R) (F : SelmerStructure K R T)
    [IsArtinianRing R] [IsLocalRing R] [IsPrincipalIdealRing R]
    [Module.Free R T] [Module.Finite R T] (hc : IsCartesianStructure T F)
    (h0 : NoResidualInvariants T (IsLocalRing.maximalIdeal R)) (hf : FiniteSelmerLengths T F)
    (hr : 0 ≤ coreRankInt T F) :
    Nonempty (F.selmer ≃ₗ[R] ((dualStructure T F).selmer × (Fin (coreRank T F) → R))) := sorry
lemma coreRank_field (T : Rep K R) (F : SelmerStructure K R T) (hR : IsField R)
    (hf : FiniteSelmerLengths T F) : coreRankInt T F =
    (Module.finrank R F.selmer : ℤ) - Module.finrank R (dualStructure T F).selmer := sorry
/-- MR04 Theorem 2.3.3, including ordinary archimedean H⁰. -/
theorem selmer_length_difference (T : Rep K R) (F : SelmerStructure K R T)
    [IsArtinianRing R] [IsLocalRing R] [Module.Finite R T] [Finite T]
    (hf : FiniteSelmerLengths T F) :
    (len R F.selmer : ℤ) - len R (dualStructure T F).selmer =
      (len R (H K R T 0) : ℤ) - len R (H K R (dualRep T) 0) -
        ∑ v ∈ F.sigma, ((len R (LocalH K R T v 0) : ℤ) - len R (F.condition v)) := sorry

def rationalRep (T : Rep K R) [IsDomain R] : Rep K R := sorry
def rationalMap (T : Rep K R) [IsDomain R] : T ⟶ rationalRep T := sorry
/-- The rational carrier is Frac(R) ⊗ T, supplied by lattice passage in L2. -/
def rationalEquiv (T : Rep K R) [IsDomain R] :
    rationalRep T ≃ₗ[R] (FractionRing R ⊗[R] T) := sorry
def finiteLatticeCondition (T : Rep K R) [IsDomain R] (v : Place K) :
    Submodule R (LocalH K R T v 1) :=
  (unramified K R (rationalRep T) v).comap
    (TauCeti.ContinuousCohomology.coeffMap
      (TopRep.resFunctor (decomposition K v).subtype |>.map (rationalMap T)) 1).hom.toLinearMap
/-- Σ, including p and infinity, comes from the imported arithmetic support data. -/
def canonicalStructure (T : Rep K R) [IsDomain R] (sigma : Finset (Place K))
    (atP : Set (Place K)) (hbad : ∀ v ∉ sigma, IsUnramified K R T v)
    (hP : atP ⊆ (sigma : Set (Place K))) : SelmerStructure K R T := sorry
lemma canonicalStructure_condition (T : Rep K R) [IsDomain R] (sigma : Finset (Place K))
    (atP : Set (Place K)) (hbad : ∀ v ∉ sigma, IsUnramified K R T v)
    (hP : atP ⊆ (sigma : Set (Place K))) (v : Place K) :
    (canonicalStructure T sigma atP hbad hP).condition v =
      if v ∈ atP then ⊤ else finiteLatticeCondition T v := sorry
lemma canonicalStructure_torsionFree (T : Rep K R) [IsDomain R] [IsDiscreteValuationRing R]
    (v : Place K) : Module.IsTorsionFree R (LocalH K R T v 1 ⧸ finiteLatticeCondition T v) := sorry
lemma canonicalStructure_dual_at_p (T : Rep K R) [IsDomain R] (sigma : Finset (Place K))
    (atP : Set (Place K)) (hbad : ∀ v ∉ sigma, IsUnramified K R T v)
    (hP : atP ⊆ (sigma : Set (Place K))) (v : Place K) (hv : v ∈ atP) :
    (dualStructure T (canonicalStructure T sigma atP hbad hP)).condition v = ⊥ := sorry
end TauCeti.KolyvaginSystems

namespace TauCeti.KolyvaginSystems
variable (K R : Type) [Field K] [NumberField K] [CommRing R] [TopologicalSpace R]
/-- Finite Galois subextensions of Kˢ, using the infinite Galois dictionary. -/
structure Layer where
  group : Subgroup (GK K)
  normal : group.Normal
  open_group : IsOpen (group : Set (GK K))
  finiteIndex : group.FiniteIndex
attribute [instance] Layer.normal Layer.finiteIndex
abbrev Layer.Gal (F : Layer K) := GK K ⧸ F.group
instance Layer.galFintype (F : Layer K) : Fintype (Layer.Gal K F) := sorry
def Layer.field (F : Layer K) : IntermediateField K (SeparableClosure K) :=
  IntermediateField.fixedField F.group
variable {K}
/-- Canonical finite-Galois field action, imported from ProfiniteArithmetic. -/
def layerFieldAction (F : Layer K) : Layer.Gal K F ≃* (F.field ≃ₐ[K] F.field) := sorry
lemma layerFieldAction_mk (F : Layer K) (g : GK K) (x : F.field) :
    (layerFieldAction F (QuotientGroup.mk g) x : SeparableClosure K) = g x.val := sorry
variable (K)
abbrev HAt (T : Rep K R) (F : Layer K) (n : ℕ) :=
  continuousCohomology n (TopRep.res F.group.subtype T)
variable {K R}
def resAt (T : Rep K R) (F F' : Layer K) (h : F'.group ≤ F.group) :
    HAt K R T F 1 →ₗ[R] HAt K R T F' 1 := sorry
/-- ProfiniteCohomology/ArithmeticGaloisDuality supplies this canonical adapter. -/
def corAt (T : Rep K R) (F F' : Layer K) (h : F'.group ≤ F.group) :
    HAt K R T F' 1 →ₗ[R] HAt K R T F 1 := sorry
lemma corAt_resAt (T : Rep K R) (hT : IsContinuous K R T)
    (F F' : Layer K) (h : F'.group ≤ F.group) (x : HAt K R T F 1) :
    corAt T F F' h (resAt T F F' h x) = (F'.group.relIndex F.group : R) • x := sorry
lemma corAt_trans (T : Rep K R) (hT : IsContinuous K R T) (F₁ F₂ F₃ : Layer K)
    (h12 : F₂.group ≤ F₁.group) (h23 : F₃.group ≤ F₂.group) (h13 : F₃.group ≤ F₁.group) :
    (corAt T F₁ F₂ h12).comp (corAt T F₂ F₃ h23) = corAt T F₁ F₃ h13 := sorry
/-- The conjugation action on canonical H¹, trivial on G_F. -/
def cohomologyAction (T : Rep K R) (F : Layer K) :
    Representation R (Layer.Gal K F) (HAt K R T F 1) := sorry
/-- K(n) is the compositum of the single-prime maximal p-ray extensions over K(1). -/
def rayPExtension (K : Type) [Field K] [NumberField K] (p : ℕ)
    (n : Conductor K) : IntermediateField K (SeparableClosure K) := sorry
def rayLayer (K : Type) [Field K] [NumberField K] (p : ℕ) (n : Conductor K) : Layer K := sorry
lemma rayLayer_field (K : Type) [Field K] [NumberField K] (p : ℕ) (n : Conductor K) :
    (rayLayer K p n).field = rayPExtension K p n := sorry
-- Γ_n is the actual relative subgroup Gal(K(n)/K(1)).
def gammaConductor (K : Type) [Field K] [NumberField K] (p : ℕ) (n : Conductor K) :
    Subgroup (Layer.Gal K (rayLayer K p n)) := sorry
abbrev gammaPrime (K : Type) [Field K] [NumberField K] (p : ℕ) (q : Prime K) :=
  gammaConductor K p {q}
instance gammaFinite (K : Type) [Field K] [NumberField K] (p : ℕ) (n : Conductor K) :
    Fintype (gammaConductor K p n) := sorry
instance gammaComm (K : Type) [Field K] [NumberField K] (p : ℕ) (n : Conductor K) :
    CommGroup (gammaConductor K p n) := sorry
/-- Residue units modulo the image of global units, then maximal p-primary quotient. -/
def residueUnits (K : Type) [Field K] [NumberField K] (q : Prime K) : Subgroup ((NumberField.RingOfIntegers K ⧸ q.asIdeal)ˣ) :=
  (Units.map (Ideal.Quotient.mk q.asIdeal).toMonoidHom).range
abbrev residueUnitQuotient (K : Type) [Field K] [NumberField K] (p : ℕ) (q : Prime K) :=
  CommGroup.primaryComponent (((NumberField.RingOfIntegers K ⧸ q.asIdeal)ˣ) ⧸ residueUnits K q) p
def gammaPrime_equiv (K : Type) [Field K] [NumberField K] (p : ℕ) (q : Prime K) :
    gammaPrime K p q ≃* residueUnitQuotient K p q := sorry
def gammaConductor_equiv_pi (K : Type) [Field K] [NumberField K] (p : ℕ) (n : Conductor K) :
    gammaConductor K p n ≃* (∀ q : n, gammaPrime K p q) := sorry
def primeNorm (K : Type) [Field K] [NumberField K] (q : Prime K) : ℕ :=
  Nat.card (NumberField.RingOfIntegers K ⧸ q.asIdeal)
lemma card_gammaPrime_dvd (K : Type) [Field K] [NumberField K] (p : ℕ) [Fact p.Prime]
    (q : Prime K) : Fintype.card (gammaPrime K p q) ∣ primeNorm K q - 1 := sorry
-- Arithmetic Frobenius, chosen in the decomposition subgroup at q.
def frobenius (K : Type) [Field K] [NumberField K] (q : Prime K) : decomposition K (Sum.inr q) := sorry
abbrev frobEnd (T : Rep K R) (q : Prime K) : Module.End R T :=
  (T.ρ (frobenius K q).val).toLinearMap
abbrev frobInvEnd (T : Rep K R) (q : Prime K) : Module.End R T :=
  (T.ρ (frobenius K q).val⁻¹).toLinearMap
/-- The MR04 local conductor ideal over ℚ. The general-number-field definition is separate. -/
def conductorIdeal04 (T : Rep K R) [Module.Free R T] [Module.Finite R T]
    (q : Prime K) : Ideal R :=
  Ideal.span {(primeNorm K q - 1 : ℕ) |> Nat.cast,
    ((frobEnd T q).charpoly.reverse).eval 1}
/-- MR16 ideal: the greatest admissible power of m; unit ideal for nonprincipal q. -/
def primeConductorIdeal (T : Rep K R) (p : ℕ) (q : Prime K) : Ideal R := sorry
lemma primeConductorIdeal_spec (T : Rep K R) (p : ℕ) (q : Prime K)
    [IsLocalRing R] [IsPrincipalIdealRing R] :
    q.asIdeal.IsPrincipal → ∃ k : ℕ,
      primeConductorIdeal T p q = IsLocalRing.maximalIdeal R ^ k ∧
      (Fintype.card (gammaPrime K p q) : R) ∈ primeConductorIdeal T p q ∧
      Nonempty ((T ⧸ (LinearMap.range (frobEnd T q - LinearMap.id) ⊔
        (primeConductorIdeal T p q • (⊤ : Submodule R T)))) ≃ₗ[R]
        (R ⧸ primeConductorIdeal T p q)) := sorry
/-- Maximality is ordered by reverse inclusion of powers, including the zero
ideal at a finite coefficient level. This rules out choosing the unit ideal always. -/
lemma primeConductorIdeal_maximal (T : Rep K R) (p : ℕ) (q : Prime K)
    [IsLocalRing R] [IsPrincipalIdealRing R] (hq : q.asIdeal.IsPrincipal)
    (hu : IsUnramified K R T (Sum.inr q)) (j : ℕ)
    (hc : (Fintype.card (gammaPrime K p q) : R) ∈ IsLocalRing.maximalIdeal R ^ j)
    (hr : Nonempty ((T ⧸ (LinearMap.range (frobEnd T q - LinearMap.id) ⊔
        (IsLocalRing.maximalIdeal R ^ j • (⊤ : Submodule R T)))) ≃ₗ[R]
        (R ⧸ IsLocalRing.maximalIdeal R ^ j))) :
    primeConductorIdeal T p q ≤ IsLocalRing.maximalIdeal R ^ j := sorry
-- I_n is a sum, not the intersection/product of I_q.
def conductorIdeal (T : Rep K R) (p : ℕ) (n : Conductor K) : Ideal R :=
  ⨆ q ∈ n, primeConductorIdeal T p q
lemma conductorIdeal_one (T : Rep K R) (p : ℕ) : conductorIdeal T p ∅ = ⊥ := sorry
lemma conductorIdeal_mono (T : Rep K R) (p : ℕ) {m n : Conductor K} (h : m ⊆ n) :
    conductorIdeal T p m ≤ conductorIdeal T p n := sorry
/-- Additive tame groups and their tensor products retain the generator-independent factor. -/
abbrev tamePrime (K : Type) [Field K] [NumberField K] (p : ℕ) (q : Prime K) :=
  Additive (gammaPrime K p q)
abbrev tameGroup (K : Type) [Field K] [NumberField K] (p : ℕ) (n : Conductor K) :=
  PiTensorProduct ℤ (fun q : n => tamePrime K p q)
-- The defining tensor dictionary, including degree zero, comes from the ray tower.
def tameGroup_one (K : Type) [Field K] [NumberField K] (p : ℕ) :
    tameGroup K p ∅ ≃+ ℤ := sorry
def tameGroup_insert (K : Type) [Field K] [NumberField K] (p : ℕ)
    (q : Prime K) (n : Conductor K) (hq : q ∉ n) :
    tameGroup K p (insert q n) ≃+ (tamePrime K p q ⊗[ℤ] tameGroup K p n) := sorry
-- R-module structure comes from the cohomology factor in ⊗_ℤ.
def kolyvaginPrimes (T : Rep K R) (S : SelmerTriple K R T) (p k : ℕ)
    [IsLocalRing R] : Set (Prime K) :=
  {q | q ∈ S.primes ∧ primeConductorIdeal T p q ≤ IsLocalRing.maximalIdeal R ^ k}
lemma kolyvaginPrimes_antitone (T : Rep K R) (S : SelmerTriple K R T) (p k : ℕ)
    [IsLocalRing R] : kolyvaginPrimes T S p (k+1) ⊆ kolyvaginPrimes T S p k := sorry
def IsUnramifiedLayer (L : Layer K) (q : Prime K) : Prop :=
  ∀ g : inertia K (Sum.inr q), g.val.val ∈ L.group
/-- Frobenius condition on an actual finite quotient of G_K; exclude Σ. -/
def frobeniusPrimes (T : Rep K R) (S : SelmerTriple K R T) (L : Layer K) (τ : GK K) :
    Set (Prime K) := {q | Sum.inr q ∉ S.F.sigma ∧
      IsUnramifiedLayer L q ∧
      IsConj (QuotientGroup.mk (frobenius K q).val : Layer.Gal K L)
        (QuotientGroup.mk τ : Layer.Gal K L)}
-- Chebotarev input is about L, not ramification of T.
lemma kolyvaginPrimes_infinite (T : Rep K R) (S : SelmerTriple K R T) (p k : ℕ)
    [IsLocalRing R] (L : Layer K) (τ : GK K)
    (hcontain : frobeniusPrimes T S L τ ⊆ kolyvaginPrimes T S p k) :
    (kolyvaginPrimes T S p k).Infinite := sorry
-- Unit test: gammaConductor_one
example (K : Type) [Field K] [NumberField K] (p : ℕ) :
    Fintype.card (gammaConductor K p ∅) = 1 := sorry
-- Unit test: gammaPrime_trivial_of_not_dvd
example (K : Type) [Field K] [NumberField K] (p : ℕ) [Fact p.Prime] (q : Prime K)
    (h : ¬ p ∣ primeNorm K q - 1) : Fintype.card (gammaPrime K p q) = 1 := sorry
-- Unit test: conductorIdeal_two_primes
example (T : Rep K R) (p : ℕ) (q₁ q₂ : Prime K) :
    conductorIdeal T p {q₁,q₂} = primeConductorIdeal T p q₁ ⊔ primeConductorIdeal T p q₂ := sorry
end TauCeti.KolyvaginSystems

namespace TauCeti.KolyvaginSystems
variable {K R : Type} [Field K] [NumberField K] [CommRing R] [TopologicalSpace R]
/-- The local extension is the completion of the specified ray p-extension. -/
structure LocalTameData (T : Rep K R) (p : ℕ) (q : Prime K) where
  away : (p : NumberField.RingOfIntegers K) ∉ q.asIdeal
  extension : Subgroup (decomposition K (Sum.inr q))
  open_extension : IsOpen (extension : Set (decomposition K (Sum.inr q)))
  finiteIndex : extension.FiniteIndex
  normal : extension.Normal
  unramified : IsUnramified K R T (Sum.inr q)
  killed : ∀ t : T, (Fintype.card (gammaPrime K p q) : R) • t = 0
  total_ramification : ∀ g : decomposition K (Sum.inr q),
    ∃ i : inertia K (Sum.inr q), ∃ h : extension, g = i.val * h.val
  tame_dictionary : Nonempty ((decomposition K (Sum.inr q) ⧸ extension) ≃* gammaPrime K p q)
attribute [instance] LocalTameData.finiteIndex LocalTameData.normal
abbrev singular (T : Rep K R) (q : Prime K) :=
  LocalH K R T (Sum.inr q) 1 ⧸ unramified K R T (Sum.inr q)
def singularMap (T : Rep K R) (q : Prime K) :
    LocalH K R T (Sum.inr q) 1 →ₗ[R] singular T q :=
  (unramified K R T (Sum.inr q)).mkQ
/-- The transverse condition is a kernel of restriction, not a selected complement. -/
def transverse (T : Rep K R) {p : ℕ} {q : Prime K} (D : LocalTameData T p q) :
    Submodule R (LocalH K R T (Sum.inr q) 1) :=
  LinearMap.ker (TauCeti.ContinuousCohomology.res D.extension (localRep K R T (Sum.inr q)) 1).hom.toLinearMap
lemma transverse_isCompl_finite (T : Rep K R) {p : ℕ} {q : Prime K}
    (D : LocalTameData T p q) [Module.Finite R T] (hT : IsContinuous K R T) :
    IsCompl (unramified K R T (Sum.inr q)) (transverse T D) := sorry
def transverse_equiv_singular (T : Rep K R) {p : ℕ} {q : Prime K}
    (D : LocalTameData T p q) [Module.Finite R T] (hT : IsContinuous K R T) :
    transverse T D ≃ₗ[R] singular T q := sorry
lemma transverse_equiv_singular_apply (T : Rep K R) {p : ℕ} {q : Prime K}
    (D : LocalTameData T p q) [Module.Finite R T] (hT : IsContinuous K R T)
    (x : transverse T D) : transverse_equiv_singular T D hT x = singularMap T q x := sorry
def finitePart (T : Rep K R) {p : ℕ} {q : Prime K}
    (D : LocalTameData T p q) [Module.Finite R T] (hT : IsContinuous K R T) :
    LocalH K R T (Sum.inr q) 1 →ₗ[R] unramified K R T (Sum.inr q) := sorry
lemma finitePart_spec (T : Rep K R) {p : ℕ} {q : Prime K}
    (D : LocalTameData T p q) [Module.Finite R T] (hT : IsContinuous K R T)
    (x : LocalH K R T (Sum.inr q) 1) : x - finitePart T D hT x ∈ transverse T D := sorry
lemma transverse_map (T T' : Rep K R) {p : ℕ} {q : Prime K}
    (D : LocalTameData T p q) (D' : LocalTameData T' p q) (he : D.extension = D'.extension)
    (f : T ⟶ T') :
    (transverse T D).map (TauCeti.ContinuousCohomology.coeffMap
      (TopRep.resFunctor (decomposition K (Sum.inr q)).subtype |>.map f) 1).hom.toLinearMap
      ≤ transverse T' D' := sorry
lemma transverse_eq_bot_iff (T : Rep K R) {p : ℕ} {q : Prime K}
    (D : LocalTameData T p q) [Module.Finite R T] (hT : IsContinuous K R T) :
    transverse T D = ⊥ ↔ LinearMap.ker (frobEnd T q - LinearMap.id) = ⊥ := sorry
-- Tests: restriction kernel, zero fixed part, and the field/ray-extension complement.
-- Unit test: transverse_restriction_kernel
example (T : Rep K R) {p : ℕ} {q : Prime K} (D : LocalTameData T p q)
    (x : LocalH K R T (Sum.inr q) 1) : x ∈ transverse T D ↔
    (TauCeti.ContinuousCohomology.res D.extension (localRep K R T (Sum.inr q)) 1).hom x = 0 := sorry
-- Unit test: transverse_trivial
example (T : Rep K R) {p : ℕ} {q : Prime K} (D : LocalTameData T p q)
    [Module.Finite R T] (hT : IsContinuous K R T) (h : LinearMap.ker (frobEnd T q - LinearMap.id) = ⊥) :
    transverse T D = ⊥ := sorry
-- Unit test: transverse_finite_projection
example (T : Rep K R) {p : ℕ} {q : Prime K} (D : LocalTameData T p q)
    [Module.Finite R T] (hT : IsContinuous K R T) (x : transverse T D) :
    finitePart T D hT x = 0 := sorry

def fsQuotientPoly (P : R[X]) (hP : P.eval 1 = 0) : R[X] := P /ₘ (X - 1)
lemma fsQuotientPoly_spec (P : R[X]) (hP : P.eval 1 = 0) :
    (X - 1) * fsQuotientPoly P hP = P ∧
      ∀ Q : R[X], (X - 1)*Q = P → Q = fsQuotientPoly P hP := sorry
-- Frobenius and tame-inertia evaluation are the local reciprocity adapters of L2/CFT.
def finiteEvaluation (T : Rep K R) (q : Prime K) (hu : IsUnramified K R T (Sum.inr q)) :
    unramified K R T (Sum.inr q) ≃ₗ[R] (T ⧸ LinearMap.range (frobEnd T q - LinearMap.id)) := sorry
def singularEvaluation (T : Rep K R) {p : ℕ} {q : Prime K} (D : LocalTameData T p q)
    [Module.Finite R T] (hT : IsContinuous K R T) :
    (singular T q ⊗[ℤ] tamePrime K p q) ≃ₗ[R] LinearMap.ker (frobEnd T q - LinearMap.id) := sorry
/-- Q(Fr⁻¹) between the actual finite and singular local carriers. -/
def finiteSingular (T : Rep K R) [Module.Free R T] [Module.Finite R T]
    {p : ℕ} {q : Prime K} (D : LocalTameData T p q) (hT : IsContinuous K R T)
    (hP : ((frobEnd T q).charpoly.reverse).eval 1 = 0) :
    unramified K R T (Sum.inr q) →ₗ[R] (singular T q ⊗[ℤ] tamePrime K p q) := sorry
lemma finiteSingular_formula (T : Rep K R) [Module.Free R T] [Module.Finite R T]
    {p : ℕ} {q : Prime K} (D : LocalTameData T p q) (hT : IsContinuous K R T)
    (hP : ((frobEnd T q).charpoly.reverse).eval 1 = 0)
    (x : unramified K R T (Sum.inr q)) (t : T)
    (ht : finiteEvaluation T q D.unramified x = Submodule.Quotient.mk t) :
    (singularEvaluation T D hT (finiteSingular T D hT hP x)).val =
      aeval (frobInvEnd T q) (fsQuotientPoly ((frobEnd T q).charpoly.reverse) hP) t := sorry
lemma finiteSingular_bijective (T : Rep K R) [Module.Free R T] [Module.Finite R T]
    [IsArtinianRing R] {p : ℕ} {q : Prime K} (D : LocalTameData T p q)
    (hT : IsContinuous K R T) (hP : ((frobEnd T q).charpoly.reverse).eval 1 = 0)
    (h1 : Nonempty ((T ⧸ LinearMap.range (frobEnd T q - LinearMap.id)) ≃ₗ[R] R)) :
    Function.Bijective (finiteSingular T D hT hP) := sorry
-- Unit test: finiteSingular_cyclotomic
example (P : R[X]) (h : P = 1-X) (hP : P.eval 1 = 0) : fsQuotientPoly P hP = -1 := sorry
-- Unit test: finiteSingular_rank_two
example (a : R) (P : R[X]) (h : P = (1-X)*(1-C a*X)) (hP : P.eval 1 = 0) :
    fsQuotientPoly P hP = -(1-C a*X) := sorry
-- Unit test: finiteSingular_not_iso
example (P : R[X]) (h : P = (1-X)^2) (hP : P.eval 1 = 0) :
    (fsQuotientPoly P hP).eval 1 = 0 := sorry
-- Unit test: finiteSingular_not_natural_inclusion
example : (-((1 : ZMod 5)-(2 : ZMod 5))) ≠ (-1 : ZMod 5) := sorry

/-- Arithmetic modification on one fixed coefficient representation. -/
def SelmerTriple.modify {T : Rep K R} (S : SelmerTriple K R T) (a b c : Conductor K)
    (hab : Disjoint a b) (hac : Disjoint a c) (hbc : Disjoint b c)
    (hc : c ∈ S.conductors) (p : ℕ) (D : ∀ q : c, LocalTameData T p q) :
    SelmerStructure K R T := sorry
lemma modify_condition {T : Rep K R} (S : SelmerTriple K R T) (a b c : Conductor K)
    (hab : Disjoint a b) (hac : Disjoint a c) (hbc : Disjoint b c)
    (hc : c ∈ S.conductors) (p : ℕ) (D : ∀ q : c, LocalTameData T p q) (q : Prime K) :
    (S.modify a b c hab hac hbc hc p D).condition (Sum.inr q) =
      if q ∈ a then ⊥ else if q ∈ b then ⊤ else
        if hq : q ∈ c then transverse T (D ⟨q,hq⟩) else S.F.condition (Sum.inr q) := sorry
/-- Strict and relaxed modifications need no tame extension. -/
def strict (T : Rep K R) (F : SelmerStructure K R T) (n : Conductor K) :
    SelmerStructure K R T := sorry
def relaxed (T : Rep K R) (F : SelmerStructure K R T) (n : Conductor K) :
    SelmerStructure K R T := sorry
lemma strict_condition (T : Rep K R) (F : SelmerStructure K R T) (n : Conductor K) (q : Prime K) :
    (strict T F n).condition (Sum.inr q) = if q ∈ n then ⊥ else F.condition (Sum.inr q) := sorry
lemma relaxed_condition (T : Rep K R) (F : SelmerStructure K R T) (n : Conductor K) (q : Prime K) :
    (relaxed T F n).condition (Sum.inr q) = if q ∈ n then ⊤ else F.condition (Sum.inr q) := sorry
lemma SelmerTriple.modify_le {T : Rep K R} (S : SelmerTriple K R T) (n : Conductor K) :
    (strict T S.F n).selmer ≤ S.F.selmer ∧ S.F.selmer ≤ (relaxed T S.F n).selmer := sorry
lemma SelmerTriple.selmer_strict_eq_inf {T : Rep K R} (S : SelmerTriple K R T)
    (n : Conductor K) : (strict T S.F n).selmer = S.F.selmer ⊓
      ⨅ q ∈ n, LinearMap.ker (loc K R T (Sum.inr q)) := sorry
-- Unit test: modify_one
example (T : Rep K R) (F : SelmerStructure K R T) :
    strict T F ∅ = F ∧ relaxed T F ∅ = F := sorry
-- Unit test: modify_strict_one_prime
example (T : Rep K R) (F : SelmerStructure K R T) (q : Prime K) :
    (strict T F {q}).condition (Sum.inr q) = ⊥ := sorry
-- Unit test: modify_relaxed_one_prime
example (T : Rep K R) (F : SelmerStructure K R T) (q : Prime K) :
    (relaxed T F {q}).condition (Sum.inr q) = ⊤ := sorry
end TauCeti.KolyvaginSystems

namespace TauCeti.KolyvaginSystems
variable {K R : Type} [Field K] [NumberField K] [CommRing R] [TopologicalSpace R]
instance layerNumberField (F : Layer K) : NumberField F.field := sorry
/-- ProfiniteArithmetic's absolute-Galois subgroup dictionary. -/
def layerGalois (F : Layer K) : GK F.field →* GK K := sorry
lemma layerGalois_range (F : Layer K) : (layerGalois F).range = F.group := sorry
abbrev layerRep (T : Rep K R) (F : Layer K) : Rep F.field R := TopRep.res (layerGalois F) T
def layerCohomology (T : Rep K R) (F : Layer K) (i : ℕ) :
    HAt K R T F i ≃ₗ[R] H F.field R (layerRep T F) i := sorry
def locAt (T : Rep K R) (F : Layer K) (v : Place F.field) :
    HAt K R T F 1 →ₗ[R] LocalH F.field R (layerRep T F) v 1 :=
  (loc F.field R (layerRep T F) v).comp (layerCohomology T F 1).toLinearMap
def primesAbove (F : Layer K) (q : Prime K) : Set (Prime F.field) := sorry
lemma primesAbove_spec (F : Layer K) (q : Prime K) (w : Prime F.field) :
    w ∈ primesAbove F q ↔ w.asIdeal.comap
      (NumberField.RingOfIntegers.mapRingHom (algebraMap K F.field)) = q.asIdeal := sorry
def isAboveP (p : ℕ) (q : Prime K) : Prop := (p : NumberField.RingOfIntegers K) ∈ q.asIdeal
def pInfinity (p : ℕ) : Set (Place K) := {v | ∀ q, v = Sum.inr q → isAboveP p q}
end TauCeti.KolyvaginSystems

namespace TauCeti.EulerSystems
open TauCeti.KolyvaginSystems
variable {K R : Type} [Field K] [NumberField K] [CommRing R] [TopologicalSpace R]
def eulerPolyMR (T : TauCeti.KolyvaginSystems.Rep K R) [Module.Free R T] [Module.Finite R T] (q : TauCeti.KolyvaginSystems.Prime K) : R[X] :=
  (frobEnd T q).charpoly.reverse
/-- N(q) is a unit away from p; the Tate-dual convention scales Frobenius. -/
def eulerPoly (T : TauCeti.KolyvaginSystems.Rep K R) [Module.Free R T] [Module.Finite R T] (q : TauCeti.KolyvaginSystems.Prime K)
    (u : Rˣ) (hu : (u : R) = primeNorm K q) : R[X] :=
  ((↑u⁻¹ : R) • frobEnd T q).charpoly.reverse
lemma eulerPoly_eq_det_twist (T : TauCeti.KolyvaginSystems.Rep K R) [Module.Free R T] [Module.Finite R T]
    (q : TauCeti.KolyvaginSystems.Prime K) (u : Rˣ) (hu : (u : R) = primeNorm K q) :
    eulerPoly T q u hu = (eulerPolyMR T q).comp (C (↑u⁻¹ : R) * X) := sorry
lemma eulerPoly_coeff (T : TauCeti.KolyvaginSystems.Rep K R) [Module.Free R T] [Module.Finite R T]
    (q : TauCeti.KolyvaginSystems.Prime K) (u : Rˣ) (hu : (u : R) = primeNorm K q) (i : ℕ) :
    (eulerPoly T q u hu).coeff i * (primeNorm K q : R)^i = (eulerPolyMR T q).coeff i := sorry
lemma eulerPoly_congr (T : TauCeti.KolyvaginSystems.Rep K R) [Module.Free R T] [Module.Finite R T]
    (q : TauCeti.KolyvaginSystems.Prime K) (u : Rˣ) (hu : (u : R) = primeNorm K q) (I : Ideal R)
    (hI : (primeNorm K q : R)-1 ∈ I) :
    (eulerPoly T q u hu).map (Ideal.Quotient.mk I) =
      (eulerPolyMR T q).map (Ideal.Quotient.mk I) := sorry
lemma eulerPoly_aeval_annihilates (T : TauCeti.KolyvaginSystems.Rep K R) [Module.Free R T] [Module.Finite R T]
    (q : TauCeti.KolyvaginSystems.Prime K) (u : Rˣ) (hu : (u : R) = primeNorm K q) :
    aeval ((primeNorm K q : R) • frobInvEnd T q) (eulerPoly T q u hu) = 0 := sorry
-- These examples compute the polynomial of the actual arithmetic Frobenius endomorphism.
-- Unit test: eulerPoly_zp_one
example (T : TauCeti.KolyvaginSystems.Rep K R) [Module.Free R T] [Module.Finite R T] (q : TauCeti.KolyvaginSystems.Prime K)
    (e : T ≃ₗ[R] R) (u : Rˣ) (hu : (u : R) = primeNorm K q)
    (h : ∀ t, e (frobEnd T q t) = (primeNorm K q : R)*e t) :
    eulerPoly T q u hu = 1-X ∧ eulerPolyMR T q = 1-C (primeNorm K q : R)*X := sorry
-- Unit test: eulerPoly_elliptic
example (T : TauCeti.KolyvaginSystems.Rep K R) [Module.Free R T] [Module.Finite R T] (q : TauCeti.KolyvaginSystems.Prime K)
    (u : Rˣ) (hu : (u : R) = primeNorm K q) (a : R)
    (h : eulerPolyMR T q = 1-C a*X+C (primeNorm K q : R)*X^2) :
    eulerPoly T q u hu = 1-C (a*(↑u⁻¹ : R))*X+C (↑u⁻¹ : R)*X^2 := sorry
-- Unit test: eulerPoly_rank_zero
example (T : TauCeti.KolyvaginSystems.Rep K R) [Module.Free R T] [Module.Finite R T] [Subsingleton T]
    (q : TauCeti.KolyvaginSystems.Prime K) (u : Rˣ) (hu : (u : R) = primeNorm K q) :
    eulerPoly T q u hu = 1 ∧ eulerPolyMR T q = 1 := sorry

/-- An abelian extension in Kˢ and its bad support, rather than an abstract index set. -/
structure Tower (T : TauCeti.KolyvaginSystems.Rep K R) where
  subgroup : Subgroup (GK K)
  normal : subgroup.Normal
  closed : IsClosed (subgroup : Set (GK K))
  abelian : ∀ g h : GK K, g*h*g⁻¹*h⁻¹ ∈ subgroup
  p : ℕ
  p_prime : p.Prime
  bad : Finset (Place K)
  contains_p_infinity : pInfinity p ⊆ (bad : Set (Place K))
  unramified : ∀ v ∉ bad, IsUnramified K R T v
attribute [instance] Tower.normal
abbrev FiniteLayer {T : TauCeti.KolyvaginSystems.Rep K R} (A : Tower T) := {F : Layer K // A.subgroup ≤ F.group}
def baseLayer (K : Type) [Field K] [NumberField K] : Layer K := sorry
lemma baseLayer_group (K : Type) [Field K] [NumberField K] : (baseLayer K).group = ⊤ := sorry
def Tower.base {T : TauCeti.KolyvaginSystems.Rep K R} (A : Tower T) : FiniteLayer A := sorry
lemma Tower.base_val {T : TauCeti.KolyvaginSystems.Rep K R} (A : Tower T) : A.base.val = baseLayer K := sorry
def baseEquiv (T : TauCeti.KolyvaginSystems.Rep K R) : HAt K R T (baseLayer K) 1 ≃ₗ[R] H K R T 1 := sorry
def ramifiedDifference {T : TauCeti.KolyvaginSystems.Rep K R} (A : Tower T) (F F' : FiniteLayer A) : Finset (TauCeti.KolyvaginSystems.Prime K) := sorry
lemma ramifiedDifference_spec {T : TauCeti.KolyvaginSystems.Rep K R} (A : Tower T) (F F' : FiniteLayer A)
    (q : TauCeti.KolyvaginSystems.Prime K) : q ∈ ramifiedDifference A F F' ↔
    Sum.inr q ∉ A.bad ∧ IsUnramifiedLayer F.val q ∧ ¬ IsUnramifiedLayer F'.val q := sorry
/-- Unit data are determined by the coefficient ring and the primes outside the support. -/
inductive EulerNormalization | rubin | mazurRubin
structure EulerFactors (T : TauCeti.KolyvaginSystems.Rep K R) [Module.Free R T] [Module.Finite R T] (A : Tower T) where
  normalization : EulerNormalization
  normUnit : (q : TauCeti.KolyvaginSystems.Prime K) → Sum.inr q ∉ A.bad → Rˣ
  normUnit_spec : ∀ q hq, (normUnit q hq : R) = primeNorm K q
def EulerFactors.poly (T : TauCeti.KolyvaginSystems.Rep K R) [Module.Free R T] [Module.Finite R T]
    {A : Tower T} (E : EulerFactors T A) (q : TauCeti.KolyvaginSystems.Prime K) (hq : Sum.inr q ∉ A.bad) : R[X] :=
  match E.normalization with
  | .rubin => eulerPoly T q (E.normUnit q hq) (E.normUnit_spec q hq)
  | .mazurRubin => eulerPolyMR T q
def factorOperator (T : TauCeti.KolyvaginSystems.Rep K R) [Module.Free R T] [Module.Finite R T]
    {A : Tower T} (E : EulerFactors T A) (F F' : FiniteLayer A) :
    Module.End R (HAt K R T F.val 1) := sorry
lemma factorOperator_formula (T : TauCeti.KolyvaginSystems.Rep K R) [Module.Free R T] [Module.Finite R T]
    {A : Tower T} (E : EulerFactors T A) (F F' : FiniteLayer A) :
    factorOperator T E F F' =
      ((ramifiedDifference A F F').attach.toList.map (fun q =>
        aeval ((cohomologyAction T F.val) (QuotientGroup.mk (frobenius K q.val).val⁻¹))
          (E.poly T q.val (by sorry)))).prod := sorry
def EulerSystem (T : TauCeti.KolyvaginSystems.Rep K R) [Module.Free R T] [Module.Finite R T]
    {A : Tower T} (E : EulerFactors T A) : Submodule R (∀ F : FiniteLayer A, HAt K R T F.val 1) where
  carrier := {c | ∀ (F F' : FiniteLayer A) (h : F'.val.group ≤ F.val.group),
    corAt T F.val F'.val h (c F') = factorOperator T E F F' (c F)}
  zero_mem' := sorry
  add_mem' := sorry
  smul_mem' := sorry
def EulerSystem.eval (T : TauCeti.KolyvaginSystems.Rep K R) [Module.Free R T] [Module.Finite R T]
    {A : Tower T} (E : EulerFactors T A) (F : FiniteLayer A) :
    EulerSystem T E →ₗ[R] HAt K R T F.val 1 := sorry
lemma EulerSystem.eval_apply (T : TauCeti.KolyvaginSystems.Rep K R) [Module.Free R T] [Module.Finite R T]
    {A : Tower T} (E : EulerFactors T A) (c : EulerSystem T E) (F : FiniteLayer A) :
    EulerSystem.eval T E F c = c.val F := sorry
lemma EulerSystem.cor_eval (T : TauCeti.KolyvaginSystems.Rep K R) [Module.Free R T] [Module.Finite R T]
    {A : Tower T} (E : EulerFactors T A) (c : EulerSystem T E)
    (F F' : FiniteLayer A) (h : F'.val.group ≤ F.val.group) :
    corAt T F.val F'.val h (c.val F') = factorOperator T E F F' (c.val F) := sorry
lemma EulerSystem.cor_eval_of_ramified_eq (T : TauCeti.KolyvaginSystems.Rep K R) [Module.Free R T] [Module.Finite R T]
    {A : Tower T} (E : EulerFactors T A) (c : EulerSystem T E)
    (F F' : FiniteLayer A) (h : F'.val.group ≤ F.val.group)
    (he : ramifiedDifference A F F' = ∅) : corAt T F.val F'.val h (c.val F') = c.val F := sorry
lemma EulerSystem.ext (T : TauCeti.KolyvaginSystems.Rep K R) [Module.Free R T] [Module.Finite R T]
    {A : Tower T} (E : EulerFactors T A) (c d : EulerSystem T E)
    (h : ∀ F, c.val F = d.val F) : c = d := sorry
def EulerSystem.lift (T : TauCeti.KolyvaginSystems.Rep K R) [Module.Free R T] [Module.Finite R T]
    {A : Tower T} (E : EulerFactors T A) {X : Type} [AddCommGroup X] [Module R X]
    (f : ∀ F : FiniteLayer A, X →ₗ[R] HAt K R T F.val 1)
    (hf : ∀ F F' h x, corAt T F.val F'.val h (f F' x) = factorOperator T E F F' (f F x)) :
    X →ₗ[R] EulerSystem T E := sorry
-- Zero, a genuine corestriction equation, and failure of restriction families.
-- Unit test: EulerSystem.zero_mem
example (T : TauCeti.KolyvaginSystems.Rep K R) [Module.Free R T] [Module.Finite R T] {A : Tower T}
    (E : EulerFactors T A) : (fun _ => 0) ∈ EulerSystem T E := sorry
-- Unit test: EulerSystem.universal_norm
example (T : TauCeti.KolyvaginSystems.Rep K R) [Module.Free R T] [Module.Finite R T] {A : Tower T}
    (E : EulerFactors T A) (c : EulerSystem T E) (F F' : FiniteLayer A)
    (h : F'.val.group ≤ F.val.group) (he : ramifiedDifference A F F' = ∅) :
    c.val F ∈ LinearMap.range (corAt T F.val F'.val h) := sorry
-- Unit test: EulerSystem.not_restriction
example (T : TauCeti.KolyvaginSystems.Rep K R) [Module.Free R T] [Module.Finite R T] (hT : IsContinuous K R T)
    {A : Tower T} (E : EulerFactors T A) (c : ∀ F : FiniteLayer A, HAt K R T F.val 1)
    (F F' : FiniteLayer A) (h : F'.val.group ≤ F.val.group)
    (he : ramifiedDifference A F F' = ∅) (hc : c F' = resAt T F.val F'.val h (c F))
    (hne : ((F'.val.group.relIndex F.val.group : R)-1) • c F ≠ 0) :
    c ∉ EulerSystem T E := sorry

end TauCeti.EulerSystems

namespace TauCeti.KolyvaginSystems
variable {K R : Type} [Field K] [NumberField K] [CommRing R] [TopologicalSpace R]
/-- Arithmetic supplier adapters all carry equations identifying their carriers. -/
def representationKernel (T : Rep K R) : Subgroup (GK K) := sorry
lemma mem_representationKernel (T : Rep K R) (g : GK K) :
    g ∈ representationKernel T ↔ ∀ t : T, T.ρ g t = t := sorry
instance representationKernel_normal (T : Rep K R) : (representationKernel T).Normal := sorry
def rootsGroup (p : ℕ) (depth : Option ℕ) : Subgroup (GK K) := sorry
lemma mem_rootsGroup (p : ℕ) (depth : Option ℕ) (g : GK K) :
    g ∈ rootsGroup (K := K) p depth ↔ ∀ m : ℕ, (∀ d, depth = some d → m ≤ d) →
      ∀ x : SeparableClosure K, x^(p^m) = 1 → g x = x := sorry
instance rootsGroup_normal (p : ℕ) (depth : Option ℕ) : (rootsGroup (K := K) p depth).Normal := sorry
def unitsRootsGroup (p : ℕ) (depth : Option ℕ) : Subgroup (GK K) := sorry
lemma mem_unitsRootsGroup (p : ℕ) (depth : Option ℕ) (g : GK K) :
    g ∈ unitsRootsGroup (K := K) p depth ↔ ∀ m : ℕ, (∀ d, depth = some d → m ≤ d) →
      ∀ (u : (NumberField.RingOfIntegers K)ˣ) (x : SeparableClosure K),
        x^(p^m) = algebraMap K (SeparableClosure K) (u.val : K) → g x = x := sorry
instance unitsRootsGroup_normal (p : ℕ) (depth : Option ℕ) :
    (unitsRootsGroup (K := K) p depth).Normal := sorry
def hilbertClassField (K : Type) [Field K] [NumberField K] : IntermediateField K (SeparableClosure K) := sorry
def hilbertGroup (K : Type) [Field K] [NumberField K] : Subgroup (GK K) := sorry
lemma mem_hilbertGroup (K : Type) [Field K] [NumberField K] (g : GK K) :
    g ∈ hilbertGroup K ↔ ∀ x : hilbertClassField K, g x.val = x.val := sorry
instance hilbertGroup_normal (K : Type) [Field K] [NumberField K] : (hilbertGroup K).Normal := sorry
def HMGroup (p : ℕ) (depth : Option ℕ) : Subgroup (GK K) :=
  hilbertGroup K ⊓ rootsGroup p depth ⊓ unitsRootsGroup p depth
instance hmGroup_normal (p : ℕ) (depth : Option ℕ) : (HMGroup (K := K) p depth).Normal := sorry
def descentRep (T : Rep K R) (U : Subgroup (GK K)) [U.Normal]
    (hU : U ≤ representationKernel T) : TopRep.{0} R (GK K ⧸ U) := sorry
def descentRepEquiv (T : Rep K R) (U : Subgroup (GK K)) [U.Normal]
    (hU : U ≤ representationKernel T) : descentRep T U hU ≃ₗ[R] T := sorry
lemma descentRep_action (T : Rep K R) (U : Subgroup (GK K)) [U.Normal]
    (hU : U ≤ representationKernel T) (g : GK K) (t : descentRep T U hU) :
    descentRepEquiv T U hU ((descentRep T U hU).ρ (QuotientGroup.mk g) t) =
      T.ρ g (descentRepEquiv T U hU t) := sorry
def inflation (T : Rep K R) (U : Subgroup (GK K)) [U.Normal]
    (hU : U ≤ representationKernel T) : continuousCohomology 1 (descentRep T U hU) →ₗ[R] H K R T 1 := sorry

variable [IsLocalRing R]
abbrev Residue := IsLocalRing.ResidueField R
local instance residueTopology : TopologicalSpace (Residue (R := R)) := ⊥
def residualRep (T : Rep K R) : TopRep.{0} (Residue (R := R)) (GK K) := sorry
instance residualRep_module (T : Rep K R) : Module R (residualRep T) :=
  Module.compHom (residualRep T) (IsLocalRing.residue R)
def residualEquiv (T : Rep K R) :
    residualRep T ≃ₗ[R] quotientRep T (IsLocalRing.maximalIdeal R) := sorry
lemma residual_action (T : Rep K R) (g : GK K) (t : residualRep T) :
    residualEquiv T ((residualRep T).ρ g t) =
      (quotientRep T (IsLocalRing.maximalIdeal R)).ρ g (residualEquiv T t) := sorry
def ResiduallyIrreducible (T : Rep K R) : Prop :=
  Nontrivial (residualRep T) ∧ ∀ W : Submodule (Residue (R := R)) (residualRep T),
    (∀ g : GK K, ∀ x ∈ W, (residualRep T).ρ g x ∈ W) → W = ⊥ ∨ W = ⊤
def ResiduallyAbsolutelyIrreducible (T : Rep K R) : Prop :=
  Nontrivial (residualRep T) ∧ ∀ (k' : Type) [Field k'] [Algebra (Residue (R := R)) k'],
    ∀ W : Submodule k' (k' ⊗[Residue (R := R)] residualRep T),
      (∀ g : GK K, ∀ x ∈ W, TensorProduct.map LinearMap.id
        ((residualRep T).ρ g).toLinearMap x ∈ W) → W = ⊥ ∨ W = ⊤
def RankOneCoinvariants (T : Rep K R) (τ : GK K) : Prop :=
  Nonempty ((T ⧸ LinearMap.range ((T.ρ τ).toLinearMap - LinearMap.id)) ≃ₗ[R] R)
def ResidualHomVanishing (T : Rep K R) : Prop :=
  ∀ f : quotientRep T (IsLocalRing.maximalIdeal R) ⟶
      dualRep (quotientRep T (IsLocalRing.maximalIdeal R)), f = 0
def NotResidualSelfDual (T : Rep K R) : Prop :=
  ¬ Nonempty (quotientRep T (IsLocalRing.maximalIdeal R) ≅
      dualRep (quotientRep T (IsLocalRing.maximalIdeal R)))
def H1ImageVanishing (T : Rep K R) (U : Subgroup (GK K)) [U.Normal]
    (hT : U ≤ representationKernel (quotientRep T (IsLocalRing.maximalIdeal R)))
    (hD : U ≤ representationKernel (dualRep (quotientRep T (IsLocalRing.maximalIdeal R)))) : Prop :=
  Subsingleton (continuousCohomology 1 (descentRep (quotientRep T (IsLocalRing.maximalIdeal R)) U hT)) ∧
  Subsingleton (continuousCohomology 1 (descentRep (dualRep (quotientRep T (IsLocalRing.maximalIdeal R))) U hD))
def MR04SplittingGroup (T : Rep K R) (p : ℕ) : Subgroup (GK K) :=
  representationKernel T ⊓ rootsGroup p none
instance mr04Splitting_normal (T : Rep K R) (p : ℕ) : (MR04SplittingGroup T p).Normal := sorry
def MR16SplittingGroup (T : Rep K R) (p : ℕ) (depth : Option ℕ) : Subgroup (GK K) :=
  representationKernel T ⊓ HMGroup p depth
instance mr16Splitting_normal (T : Rep K R) (p : ℕ) (depth : Option ℕ) :
    (MR16SplittingGroup T p depth).Normal := sorry
lemma splitting_le_residual (T : Rep K R) (p : ℕ) :
    MR04SplittingGroup T p ≤ representationKernel (quotientRep T (IsLocalRing.maximalIdeal R)) := sorry
lemma splitting_le_residual_dual (T : Rep K R) (p : ℕ) :
    MR04SplittingGroup T p ≤ representationKernel (dualRep (quotientRep T (IsLocalRing.maximalIdeal R))) := sorry
lemma hmSplitting_le_residual (T : Rep K R) (p : ℕ) (d : Option ℕ) :
    MR16SplittingGroup T p d ≤ representationKernel (quotientRep T (IsLocalRing.maximalIdeal R)) := sorry
lemma hmSplitting_le_residual_dual (T : Rep K R) (p : ℕ) (d : Option ℕ) :
    MR16SplittingGroup T p d ≤ representationKernel (dualRep (quotientRep T (IsLocalRing.maximalIdeal R))) := sorry
/-- Positive and signed ranks over a DVR are defined at the residue modulus. -/
def latticeCoreRankInt (T : Rep K R) (F : SelmerStructure K R T) : ℤ :=
  coreRankInt (quotientRep T (IsLocalRing.maximalIdeal R))
    (propagatedStructure T F (IsLocalRing.maximalIdeal R))
def latticeCoreRank (T : Rep K R) (F : SelmerStructure K R T) : ℕ := (latticeCoreRankInt T F).toNat

structure MR04Hypotheses (T : Rep K R) (S : SelmerTriple K R T) (p : ℕ) where
  baseIsRational : Nonempty (K ≃+* ℚ)
  prime : p.Prime
  residueChar : CharP (Residue (R := R)) p
  residueFinite : Finite (Residue (R := R))
  noetherian : IsNoetherianRing R
  complete : IsAdicComplete (IsLocalRing.maximalIdeal R) R
  free : Module.Free R T
  finite : Module.Finite R T
  continuous : IsContinuous K R T
  irreducible : ResiduallyAbsolutelyIrreducible T
  tau : GK K
  tauCyclotomic : tau ∈ rootsGroup p none
  tauCoinvariants : RankOneCoinvariants T tau
  h1Vanishing : H1ImageVanishing T (MR04SplittingGroup T p)
    (splitting_le_residual T p) (splitting_le_residual_dual T p)
  homVanishingOrLarge : ResidualHomVanishing T ∨ 4 < p
  primes : ∃ t, 0 < t ∧
    {q | Sum.inr q ∉ S.F.sigma ∧ conductorIdeal04 T q ≤ IsLocalRing.maximalIdeal R ^ t} ⊆ S.primes ∧
      S.primes ⊆ {q | conductorIdeal04 T q ≤ IsLocalRing.maximalIdeal R}
  cartesian : IsCartesianStructure T S.F

structure MR16Hypotheses (T : Rep K R) (S : SelmerTriple K R T) (p r : ℕ) where
  prime : p.Prime
  residueChar : CharP (Residue (R := R)) p
  residueFinite : Finite (Residue (R := R))
  free : Module.Free R T
  finite : Module.Finite R T
  continuous : IsContinuous K R T
  coefficient : IsArtinianRing R ∨ ∃ (_ : IsDomain R), IsDiscreteValuationRing R
  depth : Option ℕ
  depthSpec : ∀ d, depth = some d → (p^d : R) = 0 ∧ ∀ e < d, (p^e : R) ≠ 0
  infiniteDepth : depth = none → ∃ (_ : IsDomain R), IsDiscreteValuationRing R
  invariants : NoResidualInvariants T (IsLocalRing.maximalIdeal R)
  irreducible : ResiduallyAbsolutelyIrreducible T
  tau : GK K
  tauHM : tau ∈ HMGroup p depth
  tauCoinvariants : RankOneCoinvariants T tau
  L : Layer K
  L_in_HM : HMGroup p depth ≤ L.group
  primeContainment : frobeniusPrimes T S L tau ⊆ S.primes
  h1Vanishing : H1ImageVanishing T (MR16SplittingGroup T p depth)
    (hmSplitting_le_residual T p depth) (hmSplitting_le_residual_dual T p depth)
  notSelfDualOrLarge : NotResidualSelfDual T ∨ 3 < p
  cartesian : IsCartesianStructure T S.F
  positive : 0 < r
  coreRank : latticeCoreRankInt T S.F = r
def MR16Hypotheses.IsArtinianAdmissible {T : Rep K R} {S : SelmerTriple K R T}
    {p r : ℕ} (h : MR16Hypotheses T S p r) : Prop := ∀ q ∈ S.primes, primeConductorIdeal T p q = ⊥
lemma MR04Hypotheses.invariants_eq_bot {T : Rep K R} {S : SelmerTriple K R T}
    {p : ℕ} (h : MR04Hypotheses T S p) : NoResidualInvariants T (IsLocalRing.maximalIdeal R) := sorry
lemma MR16Hypotheses.artinianAdmissible_of_frobenius {T : Rep K R} {S : SelmerTriple K R T}
    {p r : ℕ} (h : MR16Hypotheses T S p r) [IsArtinianRing R]
    (hP : S.primes ⊆ frobeniusPrimes T S h.L h.tau)
    (hfield : h.L.group ≤ HMGroup p h.depth) : h.IsArtinianAdmissible := sorry
-- Three tests for each record: dual-invariant exclusion, τ=1 in rank one,
-- and a restricted prime set which must contain a genuine Frobenius set.
-- Unit test: MR04Hypotheses.residual_invariants_zero
example {T : Rep K R} {S : SelmerTriple K R T} {p : ℕ} (h : MR04Hypotheses T S p) :
    Subsingleton (H K R (quotientRep T (IsLocalRing.maximalIdeal R)) 0) := sorry
-- Unit test: MR04Hypotheses.rank_one_coinvariants
example (T : Rep K R) (e : T ≃ₗ[R] R) : RankOneCoinvariants T 1 := sorry
-- Unit test: MR04Hypotheses.not_dual_invariants
example {T : Rep K R} {S : SelmerTriple K R T} {p : ℕ} (h : MR04Hypotheses T S p)
    (hne : Nontrivial (H K R (dualRep (quotientRep T (IsLocalRing.maximalIdeal R))) 0)) : False := sorry
-- Unit test: MR16Hypotheses.positive_rank
example {T : Rep K R} {S : SelmerTriple K R T} {p r : ℕ} (h : MR16Hypotheses T S p r) : 0 < r := sorry
-- Unit test: MR16Hypotheses.infinite_primes
example {T : Rep K R} {S : SelmerTriple K R T} {p r : ℕ} (h : MR16Hypotheses T S p r) : S.primes.Infinite := sorry
-- Unit test: MR16Hypotheses.not_empty_primes
example (T : Rep K R) (S : SelmerTriple K R T) (p r : ℕ) (h : S.primes = ∅) :
    IsEmpty (MR16Hypotheses T S p r) := sorry
end TauCeti.KolyvaginSystems

namespace TauCeti.KolyvaginSystems
universe v w
section Derivative

variable {Γ : Type*} [Group Γ]

/-- **`ES.3/derivative-operators`**, API `normElement`: `N_Γ = Σ_{γ} γ ∈ ℤ[Γ]`. -/
def normElement (Γ : Type*) [Group Γ] [Fintype Γ] : MonoidAlgebra ℤ Γ :=
  ∑ g : Γ, MonoidAlgebra.of ℤ Γ g

/-- API `kolyvaginDerivative`: `D_σ = Σ_{i < n} i σ^i`, `n` the order of `σ`. -/
def kolyvaginDerivative (σ : Γ) : MonoidAlgebra ℤ Γ :=
  ∑ i ∈ Finset.range (orderOf σ), (i : MonoidAlgebra ℤ Γ) * MonoidAlgebra.of ℤ Γ (σ ^ i)

/-- API `sub_one_mul_kolyvaginDerivative`: `(σ - 1) D_σ = |Γ| - N_Γ` for a generator `σ`. -/
theorem sub_one_mul_kolyvaginDerivative [Fintype Γ] (σ : Γ) (hσ : ∀ g : Γ, g ∈ Subgroup.zpowers σ) :
    (MonoidAlgebra.of ℤ Γ σ - 1) * kolyvaginDerivative σ =
      (Fintype.card Γ : MonoidAlgebra ℤ Γ) - normElement Γ := sorry

/-- The augmentation `ℤ[Γ] → ℤ`. -/
def augmentation (Γ : Type*) [Group Γ] : MonoidAlgebra ℤ Γ →ₐ[ℤ] ℤ :=
  MonoidAlgebra.lift ℤ ℤ Γ 1

/-- API `augmentation_kolyvaginDerivative`. -/
theorem augmentation_kolyvaginDerivative (σ : Γ) :
    2 * augmentation Γ (kolyvaginDerivative σ) = (orderOf σ : ℤ) * ((orderOf σ : ℤ) - 1) := sorry

theorem augmentation_normElement [Fintype Γ] :
    augmentation Γ (normElement Γ) = Fintype.card Γ := sorry

/-- API `kolyvaginDerivative_generator`: for `a a' ≡ 1 (mod n)`, `D_{σ^a} - a' D_σ ∈ n ℤ[Γ]`. -/
theorem kolyvaginDerivative_generator (σ : Γ) (a a' : ℕ) (h : a * a' ≡ 1 [MOD orderOf σ]) :
    ∃ x : MonoidAlgebra ℤ Γ,
      kolyvaginDerivative (σ ^ a) - (a' : MonoidAlgebra ℤ Γ) * kolyvaginDerivative σ =
        (orderOf σ : MonoidAlgebra ℤ Γ) * x := sorry

/-- API `normElement_eq_representation_norm`: `N_Γ` acts as Mathlib's `Representation.norm`. -/
theorem normElement_eq_representation_norm [Fintype Γ] {V : Type*} [AddCommGroup V] [Module ℤ V]
    (ρ : Representation ℤ Γ V) :
    MonoidAlgebra.lift ℤ (Module.End ℤ V) Γ ρ (normElement Γ) = ρ.norm := sorry

/-- Test `kolyvaginDerivative_order_two`: for `σ` of order two, `D_σ = σ`. -/
-- Unit test: kolyvaginDerivative_order_two
example (σ : Γ) (h : orderOf σ = 2) : kolyvaginDerivative σ = MonoidAlgebra.of ℤ Γ σ := sorry

/-- Test `kolyvaginDerivative_order_three`: for `σ` of order three, `D_σ = σ + 2σ²`. -/
-- Unit test: kolyvaginDerivative_order_three
example (σ : Γ) (h : orderOf σ = 3) :
    kolyvaginDerivative σ = MonoidAlgebra.of ℤ Γ σ + 2 * MonoidAlgebra.of ℤ Γ (σ ^ 2) := sorry

/-- Test `kolyvaginDerivative_trivial`: for the trivial element, `D = 0`. -/
-- Unit test: kolyvaginDerivative_trivial
example : kolyvaginDerivative (1 : Γ) = 0 := sorry

/-- Test `kolyvaginDerivative_not_norm_multiple`: `(σ - 1) D_σ ≠ 0` for a generator of a group of
order at least two. -/
-- Unit test: kolyvaginDerivative_not_norm_multiple
example [Fintype Γ] (σ : Γ) (hσ : ∀ g : Γ, g ∈ Subgroup.zpowers σ) (h : 2 ≤ Fintype.card Γ) :
    (MonoidAlgebra.of ℤ Γ σ - 1) * kolyvaginDerivative σ ≠ 0 := sorry

end Derivative
section GraphSheaf

/-- **`ES.4/selmer-sheaf`**, API `GraphSheaf`: a sheaf of `R`-modules on a simple graph: vertex
modules, edge modules and vertex-to-edge maps (Mazur–Rubin, Definition 3.1.1). -/
structure GraphSheaf (R : Type u) [CommRing R] {V : Type v} (X : SimpleGraph V) where
  /-- The stalk at a vertex. -/
  stalk : V → Type w
  [addCommGroupStalk : ∀ x, AddCommGroup (stalk x)]
  [moduleStalk : ∀ x, Module R (stalk x)]
  /-- The module at an edge. -/
  edge : X.edgeSet → Type w
  [addCommGroupEdge : ∀ e, AddCommGroup (edge e)]
  [moduleEdge : ∀ e, Module R (edge e)]
  /-- The vertex-to-edge map `ψ_v^e`, for `v` an endpoint of `e`. -/
  toEdge : ∀ (e : X.edgeSet) (x : V), x ∈ (e : Sym2 V) → stalk x →ₗ[R] edge e

attribute [instance] GraphSheaf.addCommGroupStalk GraphSheaf.moduleStalk
  GraphSheaf.addCommGroupEdge GraphSheaf.moduleEdge

namespace GraphSheaf

variable {R : Type u} [CommRing R] {V : Type v} {X : SimpleGraph V} (S : GraphSheaf.{u, v, w} R X)

/-- API `GraphSheaf.sections`: the module `Γ(S)` of global sections. -/
def sections : Submodule R (∀ x, S.stalk x) :=
  ⨅ (e : X.edgeSet) (x : V) (y : V) (hx : x ∈ (e : Sym2 V)) (hy : y ∈ (e : Sym2 V)),
    LinearMap.eqLocus ((S.toEdge e x hx).comp (LinearMap.proj x))
      ((S.toEdge e y hy).comp (LinearMap.proj y))

/-- API `GraphSheaf.mem_sections`. -/
theorem mem_sections (κ : ∀ x, S.stalk x) :
    κ ∈ S.sections ↔ ∀ (e : X.edgeSet) (x y : V) (hx : x ∈ (e : Sym2 V)) (hy : y ∈ (e : Sym2 V)),
      S.toEdge e x hx (κ x) = S.toEdge e y hy (κ y) := sorry

/-- **`ES.4/sheaf-monodromy`**, API `GraphSheaf.IsLocallyCyclic`. -/
structure IsLocallyCyclic : Prop where
  stalk_cyclic : ∀ x, (⊤ : Submodule R (S.stalk x)).IsPrincipal
  edge_cyclic : ∀ e, (⊤ : Submodule R (S.edge e)).IsPrincipal
  toEdge_surjective : ∀ e x hx, Function.Surjective (S.toEdge e x hx)

/-- A step of a surjective path from `x` to `y`: they span an edge whose map from `y` is
bijective. -/
def SurjStep (x y : V) : Prop :=
  ∃ (e : X.edgeSet) (_ : x ∈ (e : Sym2 V)) (hy : y ∈ (e : Sym2 V)), x ≠ y ∧
    Function.Bijective (S.toEdge e y hy)

/-- API `GraphSheaf.IsHub`: every vertex is reached from `x` by a surjective path. -/
def IsHub (x : V) : Prop := ∀ y, Relation.ReflTransGen S.SurjStep x y

/-- API `GraphSheaf.IsPrimitive`: `κ_v` generates `S(v)` for every `v`. -/
def IsPrimitive (κ : S.sections) : Prop :=
  ∀ x, Submodule.span R {(κ : ∀ x, S.stalk x) x} = ⊤

/-- API `GraphSheaf.eval_injective_of_isHub` (Mazur–Rubin, Proposition 3.4.4(i)). -/
theorem eval_injective_of_isHub (hS : S.IsLocallyCyclic) {x : V} (hx : S.IsHub x) :
    Function.Injective fun κ : S.sections => (κ : ∀ x, S.stalk x) x := sorry

/-- API `GraphSheaf.Subsheaf`: submodules of the stalks and edge modules stable under the maps. -/
structure Subsheaf where
  /-- The submodule of each stalk. -/
  stalk : ∀ x, Submodule R (S.stalk x)
  /-- The submodule of each edge module. -/
  edge : ∀ e, Submodule R (S.edge e)
  map_le : ∀ e x hx, (stalk x).map (S.toEdge e x hx) ≤ edge e

/-- The sections of a subsheaf, as a submodule of `Γ(S)`: sections with values in the
substalks. -/
def Subsheaf.sections (S' : S.Subsheaf) : Submodule R (∀ x, S.stalk x) :=
  S.sections ⊓ Submodule.pi Set.univ S'.stalk

/-- A surjective path retains the edge witnesses needed to compute its transport. -/
inductive SurjPath : V → V → Type (max u v w) where
  | nil (x : V) : SurjPath x x
  | cons {x y z : V} (e : X.edgeSet) (hx : x ∈ (e : Sym2 V))
      (hy : y ∈ (e : Sym2 V)) (hne : x ≠ y)
      (hyIso : Function.Bijective (S.toEdge e y hy)) (tail : SurjPath y z) : SurjPath x z
def pathMap {x y : V} (P : S.SurjPath x y) : S.stalk x →ₗ[R] S.stalk y := sorry
lemma pathMap_nil (x : V) : S.pathMap (.nil x) = LinearMap.id := sorry
lemma pathMap_cons {x y z : V} (e : X.edgeSet) (hx : x ∈ (e : Sym2 V))
    (hy : y ∈ (e : Sym2 V)) (hne : x ≠ y)
    (hyIso : Function.Bijective (S.toEdge e y hy)) (P : S.SurjPath y z) :
    S.pathMap (.cons e hx hy hne hyIso P) = (S.pathMap P).comp
      ((LinearEquiv.ofBijective (S.toEdge e y hy) hyIso).symm.toLinearMap.comp (S.toEdge e x hx)) := sorry
/-- MR04 Definition 3.4.2 includes compatibility across the final edge as well
as independence of parallel paths; loops alone are insufficient for cyclic stalks. -/
def HasTrivialMonodromy : Prop :=
  S.IsLocallyCyclic ∧ (∀ x y (P Q : S.SurjPath x y), S.pathMap P = S.pathMap Q) ∧
    ∀ x y z (P : S.SurjPath x y) (Q : S.SurjPath x z) (e : X.edgeSet)
      (hy : y ∈ (e : Sym2 V)) (hz : z ∈ (e : Sym2 V)),
      (S.toEdge e y hy).comp (S.pathMap P) = (S.toEdge e z hz).comp (S.pathMap Q)
def eval (x : V) : S.sections →ₗ[R] S.stalk x := sorry
lemma eval_apply (x : V) (κ : S.sections) : S.eval x κ = κ.val x := sorry
lemma eval_surjective_iff (hc : S.IsLocallyCyclic) (x : V) (hx : S.IsHub x) :
    Function.Surjective (S.eval x) ↔ S.HasTrivialMonodromy := sorry
lemma generates_of_generates (hc : S.IsLocallyCyclic) (x : V) (hx : S.IsHub x)
    (κ : S.sections) (I : Ideal R) (hgen : Submodule.span R {κ.val x} = I • (⊤ : Submodule R (S.stalk x))) :
    ∀ y, Submodule.span R {κ.val y} = I • (⊤ : Submodule R (S.stalk y)) := sorry
lemma sections_equiv_ideal_of_free_hub (hc : S.IsLocallyCyclic) (x : V) (hx : S.IsHub x)
    (e : S.stalk x ≃ₗ[R] R) : ∃ I : Ideal R, Nonempty (S.sections ≃ₗ[R] I) := sorry
/-- A subsheaf has its own actual vertex and edge modules and induced maps. -/
def Subsheaf.asSheaf (S' : S.Subsheaf) : GraphSheaf.{u,v,w} R X :=
  {stalk := fun x => S'.stalk x, addCommGroupStalk := inferInstance, moduleStalk := inferInstance,
   edge := fun e => S'.edge e, addCommGroupEdge := inferInstance, moduleEdge := inferInstance,
   toEdge := fun e x hx => (S.toEdge e x hx).restrict (by intro z hz; exact S'.map_le e x hx ⟨z,hz,rfl⟩)}
def Subsheaf.sectionsEquiv (S' : S.Subsheaf) : S'.asSheaf.sections ≃ₗ[R] S'.sections := sorry
lemma primitive_iff_generator_at_hub (hc : S.IsLocallyCyclic) (x : V) (hx : S.IsHub x) (κ : S.sections) :
    S.IsPrimitive κ ↔ Submodule.span R {κ.val x} = ⊤ := sorry
-- Unit test: monodromy_trivial_loop
example (x : V) (P : S.SurjPath x x) (hm : S.HasTrivialMonodromy) : S.pathMap P = LinearMap.id := sorry
-- Unit test: sections_zero_hub
example (hc : S.IsLocallyCyclic) (x : V) (hx : S.IsHub x)
    (κ : S.sections) (h : κ.val x=0) : κ=0 := sorry
example (x : V) (e : S.stalk x ≃ₗ[R] R) (h : Subsingleton (S.stalk x)) : Subsingleton R := sorry

/-- Test `isPrimitive_zero_module`: if all stalks are zero, the zero section is primitive. -/
-- Unit test: isPrimitive_zero_module
example (h : ∀ x, Subsingleton (S.stalk x)) : S.IsPrimitive 0 := sorry

end GraphSheaf

end GraphSheaf
end TauCeti.KolyvaginSystems

namespace TauCeti.KolyvaginSystems
variable {K R : Type} [Field K] [NumberField K] [CommRing R] [TopologicalSpace R]
instance quotientRep_finite (T : Rep K R) [Module.Finite R T] (I : Ideal R) :
    Module.Finite R (quotientRep T I) := sorry
lemma quotientRep_continuous (T : Rep K R) (hT : IsContinuous K R T) (I : Ideal R) :
    IsContinuous K R (quotientRep T I) := sorry
/-- The reduced coefficient ring is retained when taking characteristic polynomials. -/
def reducedRep (T : Rep K R) (I : Ideal R) : TopRep.{0} (R ⧸ I) (GK K) := sorry
instance reducedRep_module (T : Rep K R) (I : Ideal R) : Module R (reducedRep T I) :=
  Module.compHom (reducedRep T I) (Ideal.Quotient.mk I)
def reducedEquiv (T : Rep K R) (I : Ideal R) : reducedRep T I ≃ₗ[R] quotientRep T I := sorry
instance reducedRep_free (T : Rep K R) [Module.Free R T] (I : Ideal R) : Module.Free (R ⧸ I) (reducedRep T I) := sorry
instance reducedRep_finite (T : Rep K R) [Module.Finite R T] (I : Ideal R) : Module.Finite (R ⧸ I) (reducedRep T I) := sorry
lemma reduced_charpoly (T : Rep K R) [Module.Free R T] [Module.Finite R T]
    (I : Ideal R) (q : Prime K) :
    (frobEnd (reducedRep T I) q).charpoly = (frobEnd T q).charpoly.map (Ideal.Quotient.mk I) := sorry
/-- Quotient local comparison is formed from the reduced polynomial of the same lattice. -/
def finiteSingularMod (T : Rep K R) [Module.Free R T] [Module.Finite R T]
    (I : Ideal R) {p : ℕ} {q : Prime K} (D : LocalTameData (quotientRep T I) p q)
    (hT : IsContinuous K R T) (hP : ((frobEnd T q).charpoly.reverse).eval 1 ∈ I) :
    unramified K R (quotientRep T I) (Sum.inr q) →ₗ[R]
      (singular (quotientRep T I) q ⊗[ℤ] tamePrime K p q) := sorry
lemma finiteSingularMod_formula (T : Rep K R) [Module.Free R T] [Module.Finite R T]
    (I : Ideal R) {p : ℕ} {q : Prime K} (D : LocalTameData (quotientRep T I) p q)
    (hT : IsContinuous K R T) (hP : ((frobEnd T q).charpoly.reverse).eval 1 ∈ I)
    (x : unramified K R (quotientRep T I) (Sum.inr q)) (t : quotientRep T I)
    (ht : finiteEvaluation (quotientRep T I) q D.unramified x = Submodule.Quotient.mk t) :
    (singularEvaluation (quotientRep T I) D (quotientRep_continuous T hT I)
      (finiteSingularMod T I D hT hP x)).val =
      aeval (frobInvEnd (quotientRep T I) q) (((frobEnd T q).charpoly.reverse) /ₘ (X-1)) t := sorry
variable {T : Rep K R} [Module.Free R T] [Module.Finite R T] (S : SelmerTriple K R T) (p : ℕ)
abbrev Vertices := {n : Conductor K // n ∈ S.conductors}
def vertexInsert (n : Vertices S) (q : Prime K) (hq : q ∈ S.primes) : Vertices S := sorry
lemma vertexInsert_val (n : Vertices S) (q : Prime K) (hq : q ∈ S.primes) :
    (vertexInsert S n q hq).val = insert q n.val := sorry
def conductorGraph : SimpleGraph (Vertices S) where
  Adj n m := ∃ q : Prime K, q ∈ S.primes ∧
    ((q ∉ n.val ∧ m.val = insert q n.val) ∨ (q ∉ m.val ∧ n.val = insert q m.val))
  symm := sorry
  loopless := sorry
structure KolyvaginData (T : Rep K R) [Module.Free R T] [Module.Finite R T]
    (S : SelmerTriple K R T) (p : ℕ) where
  tame : ∀ (n : Vertices S) (q : n.val), LocalTameData (quotientRep T (conductorIdeal T p n.val)) p q
  polynomial : ∀ (n : Vertices S) (q : n.val), ((frobEnd T q).charpoly.reverse).eval 1 ∈ conductorIdeal T p n.val
variable {S p}
def modified {T : Rep K R} [Module.Free R T] [Module.Finite R T]
    {S : SelmerTriple K R T} {p : ℕ} (D : KolyvaginData T S p) (n : Vertices S) :
    SelmerStructure K R (quotientRep T (conductorIdeal T p n.val)) := sorry
lemma modified_condition {T : Rep K R} [Module.Free R T] [Module.Finite R T]
    {S : SelmerTriple K R T} {p : ℕ} (D : KolyvaginData T S p) (n : Vertices S) (q : Prime K) :
    (modified D n).condition (Sum.inr q) = if hq : q ∈ n.val then
      transverse (quotientRep T (conductorIdeal T p n.val)) (D.tame n ⟨q,hq⟩)
    else (propagatedStructure T S.F (conductorIdeal T p n.val)).condition (Sum.inr q) := sorry
abbrev KolyvaginData.Stalk {T : Rep K R} [Module.Free R T] [Module.Finite R T]
    {S : SelmerTriple K R T} {p : ℕ} (D : KolyvaginData T S p) (n : Vertices S) :=
  (modified D n).selmer ⊗[ℤ] tameGroup K p n.val
abbrev KolyvaginData.EdgeStalk {T : Rep K R} [Module.Free R T] [Module.Finite R T]
    {S : SelmerTriple K R T} {p : ℕ} (D : KolyvaginData T S p)
    (n : Vertices S) (q : Prime K) (hq : q ∈ S.primes) :=
  singular (quotientRep T (conductorIdeal T p (insert q n.val))) q ⊗[ℤ] tameGroup K p (insert q n.val)
def edgeUpper {T : Rep K R} [Module.Free R T] [Module.Finite R T]
    {S : SelmerTriple K R T} {p : ℕ} (D : KolyvaginData T S p)
    (n : Vertices S) (q : Prime K) (hq : q ∈ S.primes) (hqn : q ∉ n.val) :
    D.Stalk (vertexInsert S n q hq) →ₗ[R] D.EdgeStalk n q hq := sorry
lemma edgeUpper_pure {T : Rep K R} [Module.Free R T] [Module.Finite R T]
    {S : SelmerTriple K R T} {p : ℕ} (D : KolyvaginData T S p)
    (n : Vertices S) (q : Prime K) (hq : q ∈ S.primes) (hqn : q ∉ n.val)
    (x : (modified D (vertexInsert S n q hq)).selmer)
    (g : tameGroup K p (vertexInsert S n q hq).val) :
    edgeUpper D n q hq hqn (x ⊗ₜ[ℤ] g) =
      (by
        change singular (quotientRep T (conductorIdeal T p (insert q n.val))) q ⊗[ℤ] tameGroup K p (insert q n.val)
        rw [← vertexInsert_val S n q hq]
        exact (singularMap (quotientRep T (conductorIdeal T p (vertexInsert S n q hq).val)) q
            (loc K R _ (Sum.inr q) x.val) ⊗ₜ[ℤ] g)) := sorry
def edgeLower {T : Rep K R} [Module.Free R T] [Module.Finite R T]
    {S : SelmerTriple K R T} {p : ℕ} (D : KolyvaginData T S p)
    (n : Vertices S) (q : Prime K) (hq : q ∈ S.primes) (hqn : q ∉ n.val) :
    D.Stalk n →ₗ[R] D.EdgeStalk n q hq := sorry
/-- The lower map reduces coefficients, localizes in H¹_ur, applies φ_fs, then tensors.
This equation pins down the supplier transport rather than choosing an edge map. -/
def lowerLocalFinite {T : Rep K R} [Module.Free R T] [Module.Finite R T]
    {S : SelmerTriple K R T} {p : ℕ} (D : KolyvaginData T S p)
    (n : Vertices S) (q : Prime K) (hq : q ∈ S.primes) (hqn : q ∉ n.val) :
    (modified D n).selmer →ₗ[R] unramified K R
      (quotientRep T (conductorIdeal T p (insert q n.val))) (Sum.inr q) := sorry
lemma lowerLocalFinite_val {T : Rep K R} [Module.Free R T] [Module.Finite R T]
    {S : SelmerTriple K R T} {p : ℕ} (D : KolyvaginData T S p)
    (n : Vertices S) (q : Prime K) (hq : q ∈ S.primes) (hqn : q ∉ n.val)
    (x : (modified D n).selmer) :
    (lowerLocalFinite D n q hq hqn x).val = loc K R _ (Sum.inr q)
      (coeff _ _ (QuotCat.scalarHom T (conductorIdeal T p n.val)
        (conductorIdeal T p (insert q n.val)) 1 (by sorry)) 1 x.val) := sorry
def edgeLowerTensor {T : Rep K R} [Module.Free R T] [Module.Finite R T]
    {S : SelmerTriple K R T} {p : ℕ} (D : KolyvaginData T S p)
    (n : Vertices S) (q : Prime K) (hq : q ∈ S.primes) (hqn : q ∉ n.val) :
    ((singular (quotientRep T (conductorIdeal T p (insert q n.val))) q ⊗[ℤ] tamePrime K p q)
      ⊗[ℤ] tameGroup K p n.val) ≃ₗ[R] D.EdgeStalk n q hq := sorry
lemma edgeLower_pure {T : Rep K R} [Module.Free R T] [Module.Finite R T]
    {S : SelmerTriple K R T} {p : ℕ} (D : KolyvaginData T S p)
    (n : Vertices S) (q : Prime K) (hq : q ∈ S.primes) (hqn : q ∉ n.val)
    (x : (modified D n).selmer) (g : tameGroup K p n.val) :
    edgeLower D n q hq hqn (x ⊗ₜ[ℤ] g) = edgeLowerTensor D n q hq hqn
      (finiteSingularMod T (conductorIdeal T p (insert q n.val))
        (by simpa only [vertexInsert_val] using D.tame (vertexInsert S n q hq) ⟨q,by sorry⟩)
        S.continuous (by sorry) (lowerLocalFinite D n q hq hqn x) ⊗ₜ[ℤ] g) := sorry
def KolyvaginSystem {T : Rep K R} [Module.Free R T] [Module.Finite R T]
    {S : SelmerTriple K R T} {p : ℕ} (D : KolyvaginData T S p) : Submodule R (∀ n : Vertices S, D.Stalk n) where
  carrier := {κ | ∀ n q hq hqn, edgeLower D n q hq hqn (κ n) =
    edgeUpper D n q hq hqn (κ (vertexInsert S n q hq))}
  zero_mem' := sorry
  add_mem' := sorry
  smul_mem' := sorry
def KolyvaginSystem.eval {T : Rep K R} [Module.Free R T] [Module.Finite R T]
    {S : SelmerTriple K R T} {p : ℕ} (D : KolyvaginData T S p) (n : Vertices S) :
    KolyvaginSystem D →ₗ[R] D.Stalk n := sorry
lemma KolyvaginSystem.singular_eq_finiteSingular {T : Rep K R} [Module.Free R T] [Module.Finite R T]
    {S : SelmerTriple K R T} {p : ℕ} (D : KolyvaginData T S p) (κ : KolyvaginSystem D)
    (n : Vertices S) (q : Prime K) (hq : q ∈ S.primes) (hqn : q ∉ n.val) :
    edgeUpper D n q hq hqn (κ.val (vertexInsert S n q hq)) = edgeLower D n q hq hqn (κ.val n) := sorry
lemma KolyvaginSystem.ext {T : Rep K R} [Module.Free R T] [Module.Finite R T]
    {S : SelmerTriple K R T} {p : ℕ} (D : KolyvaginData T S p) (κ κ' : KolyvaginSystem D)
    (h : ∀ n, κ.val n = κ'.val n) : κ = κ' := sorry
def KolyvaginSystem.ord {T : Rep K R} [Module.Free R T] [Module.Finite R T]
    {S : SelmerTriple K R T} {p : ℕ} (D : KolyvaginData T S p) (κ : KolyvaginSystem D) : ℕ∞ :=
  ⨅ n ∈ {n : Vertices S | κ.val n ≠ 0}, (n.val.card : ℕ∞)
structure OrientedEdge {T : Rep K R} (S : SelmerTriple K R T) (e : (conductorGraph S).edgeSet) where
  n : Vertices S
  q : Prime K
  inP : q ∈ S.primes
  notIn : q ∉ n.val
  edge_eq : e.val = Sym2.mk n (vertexInsert S n q inP)
def orientEdge {T : Rep K R} (S : SelmerTriple K R T) (e : (conductorGraph S).edgeSet) : OrientedEdge S e := sorry
def selmerSheaf {T : Rep K R} [Module.Free R T] [Module.Finite R T]
    {S : SelmerTriple K R T} {p : ℕ} (D : KolyvaginData T S p) : GraphSheaf.{0,0,0} R (conductorGraph S) :=
  { stalk := D.Stalk, addCommGroupStalk := inferInstance, moduleStalk := inferInstance,
    edge := fun e => D.EdgeStalk (orientEdge S e).n (orientEdge S e).q (orientEdge S e).inP,
    addCommGroupEdge := inferInstance, moduleEdge := inferInstance, toEdge := sorry }
def selmerSheaf_edge_equiv {T : Rep K R} [Module.Free R T] [Module.Finite R T]
    {S : SelmerTriple K R T} {p : ℕ} (D : KolyvaginData T S p)
    (n : Vertices S) (q : Prime K) (hq : q ∈ S.primes) (hqn : q ∉ n.val)
    (e : (conductorGraph S).edgeSet)
    (he : e.val = Sym2.mk n (vertexInsert S n q hq)) :
    (selmerSheaf D).edge e ≃ₗ[R] D.EdgeStalk n q hq := sorry
lemma sections_selmerSheaf {T : Rep K R} [Module.Free R T] [Module.Finite R T]
    {S : SelmerTriple K R T} {p : ℕ} (D : KolyvaginData T S p) :
    (selmerSheaf D).sections = KolyvaginSystem D := sorry
-- Arithmetic tests for the graph, stalks, and equations.
-- Unit test: conductorGraph_two_prime_nonedge
example {T : Rep K R} (S : SelmerTriple K R T) (q₁ q₂ : Prime K)
    (h : q₁ ≠ q₂) (h₁ : q₁ ∈ S.primes) (h₂ : q₂ ∈ S.primes) :
    ¬ (conductorGraph S).Adj ⟨∅,S.one_mem_conductors⟩ ⟨{q₁,q₂},by sorry⟩ := sorry
-- Unit test: KolyvaginSystem.zero_mem
example {T : Rep K R} [Module.Free R T] [Module.Finite R T]
    {S : SelmerTriple K R T} {p : ℕ} (D : KolyvaginData T S p) : KolyvaginSystem.ord D 0 = ⊤ := sorry
def stalkOne {T : Rep K R} [Module.Free R T] [Module.Finite R T]
    {S : SelmerTriple K R T} {p : ℕ} (D : KolyvaginData T S p) :
    D.Stalk ⟨∅,S.one_mem_conductors⟩ ≃ₗ[R] S.F.selmer := sorry
-- Unit test: KolyvaginSystem.empty_primes
example {T : Rep K R} [Module.Free R T] [Module.Finite R T]
    {S : SelmerTriple K R T} {p : ℕ} (D : KolyvaginData T S p) (h : S.primes = ∅) :
    Nonempty (KolyvaginSystem D ≃ₗ[R] S.F.selmer) := sorry
-- Unit test: KolyvaginSystem.not_product
example {T : Rep K R} [Module.Free R T] [Module.Finite R T]
    {S : SelmerTriple K R T} {p : ℕ} (D : KolyvaginData T S p)
    (n : Vertices S) (q : Prime K) (hq : q ∈ S.primes) (hqn : q ∉ n.val)
    (κ : ∀ n : Vertices S, D.Stalk n) (hlo : edgeLower D n q hq hqn (κ n) ≠ 0)
    (hup : κ (vertexInsert S n q hq) = 0) : κ ∉ KolyvaginSystem D := sorry
end TauCeti.KolyvaginSystems

namespace TauCeti.EulerSystems
open TauCeti.KolyvaginSystems
abbrev GaloisRep := TauCeti.KolyvaginSystems.Rep
abbrev FinitePrime := TauCeti.KolyvaginSystems.Prime
variable {K R : Type} [Field K] [NumberField K] [CommRing R] [TopologicalSpace R]
/-- Rubin's Z_p^d direction, including the non-splitting condition at every finite prime. -/
structure InfiniteDirection (T : GaloisRep K R) (A : Tower T) where
  subgroup : Subgroup (GK K)
  normal : subgroup.Normal
  closed : IsClosed (subgroup : Set (GK K))
  containsTower : A.subgroup ≤ subgroup
  d : ℕ
  positive : 0 < d
  prime : Fact A.p.Prime
  galois : (GK K ⧸ subgroup) ≃* Multiplicative (Fin d → PadicInt A.p)
  continuous : Continuous galois
  inverseContinuous : Continuous galois.symm
  noSplitting : ∀ q : FinitePrime K, ¬ decomposition K (Sum.inr q) ≤ subgroup
attribute [instance] InfiniteDirection.normal
structure IsAdmissibleTower (T : GaloisRep K R) (A : Tower T) where
  ray : ∀ q : FinitePrime K, Sum.inr q ∉ A.bad → A.subgroup ≤ (rayLayer K A.p {q}).group
  direction : InfiniteDirection T A
def InInfiniteDirection {T : GaloisRep K R} {A : Tower T} (Z : InfiniteDirection T A)
    (F F' : FiniteLayer A) : Prop := F.val.group ⊓ Z.subgroup ≤ F'.val.group
lemma universal_norm {T : GaloisRep K R} [Module.Free R T] [Module.Finite R T]
    {A : Tower T} (E : EulerFactors T A) (hA : IsAdmissibleTower T A)
    (c : EulerSystem T E) (F F' : FiniteLayer A) (h : F'.val.group ≤ F.val.group)
    (hz : InInfiniteDirection hA.direction F F') :
    corAt T F.val F'.val h (c.val F') = c.val F := sorry
theorem classes_unramified_outside_p {T : GaloisRep K R} [Module.Free R T] [Module.Finite R T]
    {A : Tower T} (E : EulerFactors T A) (hA : IsAdmissibleTower T A) [Fact A.p.Prime]
    [Algebra (PadicInt A.p) R] [Module.Finite (PadicInt A.p) R]
    (c : EulerSystem T E) (F : FiniteLayer A) (q : FinitePrime F.val.field)
    (hq : ¬ isAboveP A.p q) :
    locAt T F.val (Sum.inr q) (c.val F) ∈
      unramified F.val.field R (layerRep T F.val) (Sum.inr q) := sorry

structure CharacterData {T : GaloisRep K R} (A : Tower T) where
  character : GK K →* Rˣ
  continuous : Continuous character
  finite : (Set.range character).Finite
  field : FiniteLayer A
  field_dictionary : field.val.group = character.ker
def twistRep (T : GaloisRep K R) (χ : GK K →* Rˣ) : GaloisRep K R := sorry
def twistEquiv (T : GaloisRep K R) (χ : GK K →* Rˣ) : twistRep T χ ≃ₗ[R] T := sorry
lemma twist_action (T : GaloisRep K R) (χ : GK K →* Rˣ) (g : GK K) (t : twistRep T χ) :
    twistEquiv T χ ((twistRep T χ).ρ g t) = (χ g : R) • T.ρ g (twistEquiv T χ t) := sorry
instance twistRep_free (T : GaloisRep K R) [Module.Free R T] (χ : GK K →* Rˣ) :
    Module.Free R (twistRep T χ) := sorry
instance twistRep_finite (T : GaloisRep K R) [Module.Finite R T] (χ : GK K →* Rˣ) :
    Module.Finite R (twistRep T χ) := sorry
lemma eulerPoly_twist (T : GaloisRep K R) [Module.Free R T] [Module.Finite R T]
    (χ : GK K →* Rˣ) (q : FinitePrime K) (u : Rˣ) (hu : (u : R) = primeNorm K q) :
    eulerPoly (twistRep T χ) q u hu =
      (eulerPoly T q u hu).comp (C (χ (frobenius K q).val : R)*X) := sorry
def twistTower {T : GaloisRep K R} {A : Tower T} (χ : CharacterData A) : Tower (twistRep T χ.character) := sorry
lemma twistTower_subgroup {T : GaloisRep K R} {A : Tower T} (χ : CharacterData A) :
    (twistTower χ).subgroup = A.subgroup := sorry
lemma twistTower_bad {T : GaloisRep K R} {A : Tower T} (χ : CharacterData A) (v : Place K) :
    v ∈ (twistTower χ).bad ↔ v ∈ A.bad ∨
      ∃ q : FinitePrime K, v = Sum.inr q ∧ ¬ IsUnramifiedLayer χ.field.val q := sorry
def twistFactors {T : GaloisRep K R} [Module.Free R T] [Module.Finite R T]
    {A : Tower T} (E : EulerFactors T A) (χ : CharacterData A) :
    EulerFactors (twistRep T χ.character) (twistTower χ) := sorry
def compositum (F F' : Layer K) : Layer K :=
  { group := F.group ⊓ F'.group, normal := inferInstance, open_group := sorry, finiteIndex := inferInstance }
def compositumLayer {T : GaloisRep K R} {A : Tower T} (F F' : FiniteLayer A) : FiniteLayer A := sorry
lemma compositumLayer_group {T : GaloisRep K R} {A : Tower T} (F F' : FiniteLayer A) :
    (compositumLayer F F').val.group = F.val.group ⊓ F'.val.group := sorry
def twistFiniteLayer {T : GaloisRep K R} {A : Tower T} (χ : CharacterData A) (F : FiniteLayer A) :
    FiniteLayer (twistTower χ) := sorry
lemma twistFiniteLayer_val {T : GaloisRep K R} {A : Tower T} (χ : CharacterData A) (F : FiniteLayer A) :
    (twistFiniteLayer χ F).val = F.val := sorry
def tensorCharacterAt {T : GaloisRep K R} {A : Tower T} (χ : CharacterData A) (F : FiniteLayer A) :
    HAt K R T (compositumLayer F χ.field).val 1 ≃ₗ[R]
      HAt K R (twistRep T χ.character) (compositumLayer F χ.field).val 1 := sorry
def EulerSystem.twist {T : GaloisRep K R} [Module.Free R T] [Module.Finite R T]
    {A : Tower T} (E : EulerFactors T A) (χ : CharacterData A) :
    EulerSystem T E →ₗ[R] EulerSystem (twistRep T χ.character) (twistFactors E χ) := sorry
def EulerSystem.twistValue {T : GaloisRep K R} [Module.Free R T] [Module.Finite R T]
    {A : Tower T} (E : EulerFactors T A) (χ : CharacterData A) (c : EulerSystem T E) (F : FiniteLayer A) :
    HAt K R (twistRep T χ.character) F.val 1 := by
  rw [← twistFiniteLayer_val χ F]
  exact (EulerSystem.twist E χ c).val (twistFiniteLayer χ F)
lemma EulerSystem.twist_eval {T : GaloisRep K R} [Module.Free R T] [Module.Finite R T]
    {A : Tower T} (E : EulerFactors T A) (χ : CharacterData A) (c : EulerSystem T E) (F : FiniteLayer A) :
    EulerSystem.twistValue E χ c F =
      corAt (twistRep T χ.character) F.val (compositumLayer F χ.field).val (by sorry)
        (tensorCharacterAt χ F (c.val (compositumLayer F χ.field))) := sorry
def trivialTwistCohomology (T : GaloisRep K R) (F : Layer K) :
    HAt K R (twistRep T 1) F 1 ≃ₗ[R] HAt K R T F 1 := sorry
lemma EulerSystem.twist_one {T : GaloisRep K R} [Module.Free R T] [Module.Finite R T]
    {A : Tower T} (E : EulerFactors T A) (χ : CharacterData A)
    (hχ : χ.character = 1) (c : EulerSystem T E) (F : FiniteLayer A) :
    trivialTwistCohomology T F.val
      (by simpa only [hχ] using EulerSystem.twistValue E χ c F) = c.val F := sorry
-- Character-weighted trace: the χ^{-1} isotypic component, without a degree factor.
def characterTrace {T : GaloisRep K R} {A : Tower T} (χ : CharacterData A) (F : FiniteLayer A) :
    Module.End R (HAt K R T (compositumLayer F χ.field).val 1) := sorry
lemma characterTrace_formula {T : GaloisRep K R} {A : Tower T} (χ : CharacterData A) (F : FiniteLayer A)
    (g : GK K) (hg : g ∈ F.val.group) (x : HAt K R T (compositumLayer F χ.field).val 1) :
    cohomologyAction T (compositumLayer F χ.field).val (QuotientGroup.mk g)
      (characterTrace χ F x) = (χ.character g⁻¹ : R) • characterTrace χ F x := sorry
lemma EulerSystem.res_twist {T : GaloisRep K R} [Module.Free R T] [Module.Finite R T]
    {A : Tower T} (E : EulerFactors T A) (χ : CharacterData A) (c : EulerSystem T E) (F : FiniteLayer A) :
    (tensorCharacterAt χ F).symm
      (resAt (twistRep T χ.character) F.val (compositumLayer F χ.field).val (by sorry)
        (EulerSystem.twistValue E χ c F)) =
      characterTrace χ F (c.val (compositumLayer F χ.field)) := sorry
-- Unit test: EulerSystem.twist_zero
example {T : GaloisRep K R} [Module.Free R T] [Module.Finite R T]
    {A : Tower T} (E : EulerFactors T A) (χ : CharacterData A) : EulerSystem.twist E χ 0 = 0 := sorry
-- Unit test: EulerSystem.twist_conductor
example {T : GaloisRep K R} [Module.Free R T] [Module.Finite R T]
    {A : Tower T} (E : EulerFactors T A) (χ : CharacterData A) (q : FinitePrime K)
    (hq : ¬ IsUnramifiedLayer χ.field.val q) : Sum.inr q ∈ (twistTower χ).bad := sorry
-- Unit test: EulerSystem.twist_inverse_norm
example {T : GaloisRep K R} [Module.Free R T] [Module.Finite R T]
    {A : Tower T} (E : EulerFactors T A) (χ : CharacterData A) (c : EulerSystem T E) (F : FiniteLayer A)
    (he : ramifiedDifference A F (compositumLayer F χ.field) = ∅) :
    corAt T F.val (compositumLayer F χ.field).val (by sorry)
      (c.val (compositumLayer F χ.field)) = c.val F := sorry

def EulerSystem.IsTrivialAt {T : GaloisRep K R} [Module.Free R T] [Module.Finite R T]
    {A : Tower T} (E : EulerFactors T A) (c : EulerSystem T E) (SigmaBad : Finset (FinitePrime K)) : Prop :=
  ∀ F : FiniteLayer A, ∀ q ∈ SigmaBad, ∀ w ∈ primesAbove F.val q, locAt T F.val (Sum.inr w) (c.val F) = 0
def FiniteDepthEulerSystem {T : GaloisRep K R} [Module.Free R T] [Module.Finite R T]
    {A : Tower T} (E : EulerFactors T A) (M : Ideal R) :
    Submodule R (∀ F : FiniteLayer A, HAt K R (quotientRep T M) F.val 1) := sorry
def finiteDepthFactorOperator {T : GaloisRep K R} [Module.Free R T] [Module.Finite R T]
    {A : Tower T} (E : EulerFactors T A) (M : Ideal R) (F F' : FiniteLayer A) :
    Module.End R (HAt K R (quotientRep T M) F.val 1) := sorry
lemma finiteDepthFactorOperator_formula {T : GaloisRep K R} [Module.Free R T] [Module.Finite R T]
    {A : Tower T} (E : EulerFactors T A) (M : Ideal R) (F F' : FiniteLayer A) :
    finiteDepthFactorOperator E M F F' =
      ((ramifiedDifference A F F').attach.toList.map (fun q =>
        aeval (cohomologyAction (quotientRep T M) F.val
          (QuotientGroup.mk (frobenius K q.val).val⁻¹)) (E.poly T q.val (by sorry)))).prod := sorry
lemma mem_finiteDepthEulerSystem {T : GaloisRep K R} [Module.Free R T] [Module.Finite R T]
    {A : Tower T} (E : EulerFactors T A) (M : Ideal R)
    (c : ∀ F : FiniteLayer A, HAt K R (quotientRep T M) F.val 1) :
    c ∈ FiniteDepthEulerSystem E M ↔ ∀ (F F' : FiniteLayer A) (h : F'.val.group ≤ F.val.group),
      corAt (quotientRep T M) F.val F'.val h (c F') =
        finiteDepthFactorOperator E M F F' (c F) := sorry
def EulerSystem.toFiniteDepth {T : GaloisRep K R} [Module.Free R T] [Module.Finite R T]
    {A : Tower T} (E : EulerFactors T A) (M : Ideal R) :
    EulerSystem T E →ₗ[R] FiniteDepthEulerSystem E M := sorry
lemma EulerSystem.toFiniteDepth_eval {T : GaloisRep K R} [Module.Free R T] [Module.Finite R T]
    {A : Tower T} (E : EulerFactors T A) (M : Ideal R) (c : EulerSystem T E) (F : FiniteLayer A) :
    (EulerSystem.toFiniteDepth E M c).val F =
      (TauCeti.ContinuousCohomology.coeffMap
        (TopRep.resFunctor F.val.group.subtype |>.map (quotientMap T M)) 1).hom (c.val F) := sorry
end TauCeti.EulerSystems

namespace TauCeti.KolyvaginSystems
variable {K R : Type} [Field K] [NumberField K] [CommRing R] [TopologicalSpace R]
variable [IsLocalRing R] {T : Rep K R} [Module.Free R T] [Module.Finite R T]
variable {S : SelmerTriple K R T} {p : ℕ}
/-- Finite-level coefficient hypotheses, separately from the Galois hypotheses. -/
structure PrincipalArtinian : Prop where
  artinian : IsArtinianRing R
  principal : IsPrincipalIdealRing R
  nontrivial : Nontrivial R
  finiteResidue : Finite (IsLocalRing.ResidueField R)
def selmerLength (D : KolyvaginData T S p) (n : Vertices S) : ℕ := len R (modified D n).selmer
def dualSelmerLength (D : KolyvaginData T S p) (n : Vertices S) : ℕ :=
  len R (dualStructure (quotientRep T (conductorIdeal T p n.val)) (modified D n)).selmer
def IsCoreVertex (D : KolyvaginData T S p) (n : Vertices S) : Prop :=
  selmerLength D n = 0 ∨ dualSelmerLength D n = 0
def IsCoreVertex16 (D : KolyvaginData T S p) (n : Vertices S) : Prop := dualSelmerLength D n = 0
def IsLeadingVertex (D : KolyvaginData T S p) (n : Vertices S) : Prop :=
  IsCoreVertex D n ∧ n.val.card =
    len R (dualStructure (quotientRep T (IsLocalRing.maximalIdeal R))
      (propagatedStructure T S.F (IsLocalRing.maximalIdeal R))).selmer
/-- Specialization at a level where every conductor ideal is zero. -/
def AtLevel (S : SelmerTriple K R T) (p : ℕ) : Prop :=
  ∀ q ∈ S.primes, primeConductorIdeal T p q = ⊥
theorem isCoreVertex_iff_residual (D : KolyvaginData T S p)
    (h : MR04Hypotheses T S p) (hR : PrincipalArtinian (R := R)) (hP : AtLevel S p)
    (n : Vertices S) : IsCoreVertex D n ↔
    Subsingleton ((propagatedStructure (quotientRep T (conductorIdeal T p n.val))
      (modified D n) (IsLocalRing.maximalIdeal R)).selmer) ∨
    Subsingleton ((propagatedStructure (dualRep (quotientRep T (conductorIdeal T p n.val)))
      (dualStructure (quotientRep T (conductorIdeal T p n.val)) (modified D n))
      (IsLocalRing.maximalIdeal R)).selmer) := sorry
theorem free_of_isCoreVertex (D : KolyvaginData T S p)
    (h : MR04Hypotheses T S p) (hR : PrincipalArtinian (R := R)) (hP : AtLevel S p)
    (n : Vertices S) (hn : IsCoreVertex D n) :
    Module.Free R (modified D n).selmer ∧
      Module.finrank R (modified D n).selmer = latticeCoreRank T S.F := sorry
theorem exists_isCoreVertex_dvd (D : KolyvaginData T S p)
    (h : MR04Hypotheses T S p) (hR : PrincipalArtinian (R := R)) (hP : AtLevel S p)
    (m : Vertices S) : ∃ n : Vertices S, m.val ⊆ n.val ∧ IsCoreVertex D n := sorry
theorem selmerLength_sub (D : KolyvaginData T S p)
    (h : MR04Hypotheses T S p) (hR : PrincipalArtinian (R := R)) (hP : AtLevel S p)
    (n : Vertices S) : (selmerLength D n : ℤ) - dualSelmerLength D n =
      len R R * latticeCoreRankInt T S.F := sorry
/-- The four cyclic quotients of the Selmer diamond, not an arbitrary numerical diamond. -/
def vertexStepLengths (D : KolyvaginData T S p) (n : Vertices S)
    (q : Prime K) (hq : q ∈ S.primes) (hqn : q ∉ n.val) : Fin 4 → ℕ := sorry
theorem vertex_step (D : KolyvaginData T S p)
    (h : MR04Hypotheses T S p) (hR : PrincipalArtinian (R := R)) (hP : AtLevel S p)
    (n : Vertices S) (q : Prime K) (hq : q ∈ S.primes) (hqn : q ∉ n.val) :
    let l := vertexStepLengths D n q hq hqn
    l 0 + l 2 = l 1 + l 3 ∧ l 3 ≤ l 0 ∧ l 2 ≤ l 1 ∧ ∀ i, l i ≤ len R R := sorry
def stubSheaf (D : KolyvaginData T S p) : (selmerSheaf D).Subsheaf := sorry
lemma stubSheaf_stalk (D : KolyvaginData T S p) (n : Vertices S) :
    (stubSheaf D).stalk n = IsLocalRing.maximalIdeal R ^ dualSelmerLength D n •
      (⊤ : Submodule R (D.Stalk n)) := sorry
theorem stubSheaf_stalk_eq_bot (D : KolyvaginData T S p)
    (h : MR04Hypotheses T S p) (hR : PrincipalArtinian (R := R)) (hP : AtLevel S p)
    (hr : 0 < latticeCoreRank T S.F) (n : Vertices S) :
    (stubSheaf D).stalk n = ⊥ ↔ len R R ≤ dualSelmerLength D n := sorry
theorem stubSheaf_isLocallyCyclic (D : KolyvaginData T S p)
    (h : MR04Hypotheses T S p) (hR : PrincipalArtinian (R := R)) (hP : AtLevel S p)
    (hr : latticeCoreRank T S.F = 1) :
    (stubSheaf D).asSheaf.IsLocallyCyclic := sorry
/-- The arithmetic extra condition of MR04 H.4a and the coefficient image condition. -/
def CoefficientsFromGalois (T : Rep K R) (p : ℕ) : Prop :=
  ∃ hp : p.Prime, letI : Fact p.Prime := ⟨hp⟩;
    ∃ φ : PadicInt p →+* R, Continuous φ ∧ ∀ r : R,
      ∃ (n : ℕ) (a : Fin n → PadicInt p) (g : Fin n → GK K),
        ∑ i : Fin n, φ (a i) • (T.ρ (g i)).toLinearMap = r • LinearMap.id
theorem sections_stubSheaf_eq (D : KolyvaginData T S p)
    (h : MR04Hypotheses T S p) (hR : PrincipalArtinian (R := R)) (hP : AtLevel S p)
    (hextra : latticeCoreRank T S.F = 1 ∨ IsField R ∨
      (ResidualHomVanishing T ∧ CoefficientsFromGalois T p)) :
    (stubSheaf D).sections = (selmerSheaf D).sections := sorry
theorem kolyvaginSystem_eq_bot_of_coreRank_zero (D : KolyvaginData T S p)
    (h : MR04Hypotheses T S p) (hR : PrincipalArtinian (R := R)) (hP : AtLevel S p)
    (hr : latticeCoreRank T S.F = 0) : KolyvaginSystem D = ⊥ := sorry
-- Unit test: stubSheaf_core_vertex
example (D : KolyvaginData T S p) (n : Vertices S) (hn : dualSelmerLength D n = 0) :
    (stubSheaf D).stalk n = ⊤ := sorry
-- Unit test: stubSheaf_zero_of_large
example (D : KolyvaginData T S p) (hR : PrincipalArtinian (R := R))
    (h : MR04Hypotheses T S p) (hP : AtLevel S p) (hr : latticeCoreRank T S.F = 1)
    (n : Vertices S) (hn : len R R ≤ dualSelmerLength D n) : (stubSheaf D).stalk n = ⊥ := sorry
-- Unit test: stubSheaf_field
example (D : KolyvaginData T S p) (hR : IsField R)
    (h : MR04Hypotheses T S p) (hP : AtLevel S p) (n : Vertices S)
    (hLength : dualSelmerLength D n > 0) : (stubSheaf D).stalk n = ⊥ := sorry
/-- The divisibility index is infinite at zero; it is not the length of a cyclic image. -/
def divisibilityIndex {M : Type} [AddCommGroup M] [Module R M] (x : M) : ℕ∞ :=
  ⨆ (j : ℕ) (_ : x ∈ IsLocalRing.maximalIdeal R ^ j • (⊤ : Submodule R M)), (j : ℕ∞)
def initialVertex (S : SelmerTriple K R T) : Vertices S := ⟨∅,S.one_mem_conductors⟩
def partialInvariant (D : KolyvaginData T S p) (κ : KolyvaginSystem D) (i : ℕ) : ℕ∞ :=
  ⨅ (n : Vertices S) (_ : n.val.card = i), divisibilityIndex (R := R) (κ.val n)
def partialInfinity (D : KolyvaginData T S p) (κ : KolyvaginSystem D) : ℕ∞ :=
  ⨅ i, partialInvariant D κ i
def IsPrimitive (D : KolyvaginData T S p) (κ : KolyvaginSystem D) : Prop :=
  ∃ n : Vertices S, κ.val n ∉ IsLocalRing.maximalIdeal R • (⊤ : Submodule R (D.Stalk n))
lemma partialInvariant_zero (D : KolyvaginData T S p) (i : ℕ) : partialInvariant D 0 i = ⊤ := sorry
lemma partialInvariant_smul (D : KolyvaginData T S p) [IsDomain R] [IsDiscreteValuationRing R]
    (π : R) (hπ : IsLocalRing.maximalIdeal R = Ideal.span {π}) (κ : KolyvaginSystem D)
    (i : ℕ) (hfree : ∀ n : Vertices S, n.val.card=i → Module.IsTorsionFree R (D.Stalk n)) :
    partialInvariant D (π • κ) i = partialInvariant D κ i + 1 := sorry
lemma isPrimitive_iff_partialInfinity (D : KolyvaginData T S p) [IsDomain R] [IsDiscreteValuationRing R]
    (h : MR04Hypotheses T S p) (hr : latticeCoreRank T S.F = 1) (κ : KolyvaginSystem D) :
    IsPrimitive D κ ↔ partialInfinity D κ = 0 := sorry
example (D : KolyvaginData T S p) (i : ℕ) : partialInvariant D 0 i = ⊤ := sorry
example (D : KolyvaginData T S p) [IsDomain R] [IsDiscreteValuationRing R]
    (π : R) (hπ : IsLocalRing.maximalIdeal R = Ideal.span {π}) (κ : KolyvaginSystem D)
    (i : ℕ) (hfree : ∀ n : Vertices S, n.val.card=i → Module.IsTorsionFree R (D.Stalk n))
    (hκ : partialInvariant D κ i ≠ ⊤) :
    partialInvariant D (π • κ) i > partialInvariant D κ i := sorry
example (D : KolyvaginData T S p) (κ : KolyvaginSystem D)
    (hκ : κ.val (initialVertex S) = 0) : partialInvariant D κ 0 = ⊤ := sorry
/-- Finite-level divisibility uses the cyclic image, including the zero value k. -/
def artinianPartialInvariant (D : KolyvaginData T S p) (κ : KolyvaginSystem D) (i : ℕ) : ℕ∞ :=
  ⨅ (n : Vertices S) (_ : n.val.card=i), ((len R R-len R (Submodule.span R {κ.val n})) : ℕ∞)
/-- Finite-level bound. The length of the whole Cartier-dual Selmer group occurs. -/
theorem kolyvagin_bound_artinian (D : KolyvaginData T S p)
    (h : MR04Hypotheses T S p) (hR : PrincipalArtinian (R := R)) (hP : AtLevel S p)
    (hr : latticeCoreRank T S.F = 1) (κ : KolyvaginSystem D) :
    Module.length R (dualStructure T S.F).selmer ≤ artinianPartialInvariant D κ 0 := sorry
theorem kolyvagin_bound (D : KolyvaginData T S p) [IsDomain R] [IsDiscreteValuationRing R]
    (h : MR04Hypotheses T S p) (hr : latticeCoreRank T S.F = 1)
    (hsat : ∀ v ∈ S.F.sigma, Module.IsTorsionFree R (LocalH K R T v 1 ⧸ S.F.condition v))
    (hP : S.primes = {q | Sum.inr q ∉ S.F.sigma ∧ conductorIdeal04 T q ≤ IsLocalRing.maximalIdeal R})
    (κ : KolyvaginSystem D) :
    Module.length R (dualStructure T S.F).selmer ≤ partialInvariant D κ 0 := sorry
theorem rank_one_module (D : KolyvaginData T S p) [IsDomain R] [IsDiscreteValuationRing R]
    (h : MR04Hypotheses T S p) (hr : latticeCoreRank T S.F = 1)
    (hsat : ∀ v ∈ S.F.sigma, Module.IsTorsionFree R (LocalH K R T v 1 ⧸ S.F.condition v))
    (hP : S.primes = {q | Sum.inr q ∉ S.F.sigma ∧ conductorIdeal04 T q ≤ IsLocalRing.maximalIdeal R}) :
    Nonempty (KolyvaginSystem D ≃ₗ[R] R) := sorry
/-- Divisible part of the discrete Selmer group; imported from L2. -/
def divisiblePart (A : Rep K R) (F : SelmerStructure K R A) : Submodule R F.selmer := sorry
lemma mem_divisiblePart (A : Rep K R) (F : SelmerStructure K R A) (x : F.selmer) :
    x ∈ divisiblePart A F ↔ ∀ a : R, a ≠ 0 → ∃ y : F.selmer, a • y = x := sorry
-- The discrete corank is the rank of the Pontryagin dual, not the algebraic R-linear dual.
abbrev pontryaginDual (M : Type) [AddCommGroup M] [Module R M] : Type := M →+ QZ
instance pdAdd (M : Type) [AddCommGroup M] [Module R M] : AddCommGroup (pontryaginDual (R := R) M) := inferInstance
instance pdModule (M : Type) [AddCommGroup M] [Module R M] : Module R (pontryaginDual (R := R) M) := sorry
lemma pontryaginDual_smul (M : Type) [AddCommGroup M] [Module R M] (r : R)
    (f : pontryaginDual (R := R) M) (x : M) : (r • f) x = f (r • x) := sorry
theorem structure_corank (D : KolyvaginData T S p) [IsDomain R] [IsDiscreteValuationRing R]
    (h : MR04Hypotheses T S p) (hr : latticeCoreRank T S.F = 1)
    (hsat : ∀ v ∈ S.F.sigma, Module.IsTorsionFree R (LocalH K R T v 1 ⧸ S.F.condition v))
    (hP : S.primes = {q | Sum.inr q ∉ S.F.sigma ∧ conductorIdeal04 T q ≤ IsLocalRing.maximalIdeal R})
    (κ : KolyvaginSystem D) (hκ : κ ≠ 0) :
    Module.rank R (pontryaginDual (R := R) (dualStructure T S.F).selmer) =
      ((KolyvaginSystem.ord D κ).toNat : Cardinal) := sorry
end TauCeti.KolyvaginSystems

namespace TauCeti.StarkSystems
open TauCeti.KolyvaginSystems
abbrev SelmerRep := TauCeti.KolyvaginSystems.Rep
variable {K R : Type} [Field K] [NumberField K] [CommRing R] [TopologicalSpace R]
variable {T : SelmerRep K R} [Module.Free R T] [Module.Finite R T]
/-- These are applications of L6's exterior-bidual API, on actual Selmer modules. -/
abbrev selmerBidual (F : SelmerStructure K R T) (r : ℕ) :=
  Module.Dual R (⋀[R]^r (Module.Dual R F.selmer))
def selmerToBidual (F : SelmerStructure K R T) (r : ℕ) :
    (⋀[R]^r F.selmer) →ₗ[R] selmerBidual F r := sorry
lemma selmerToBidual_det (F : SelmerStructure K R T) (r : ℕ)
    (x : Fin r → F.selmer) (f : Fin r → Module.Dual R F.selmer) :
    selmerToBidual F r (exteriorPower.ιMulti R r x) (exteriorPower.ιMulti R r f) =
      Matrix.det (fun i j => f i (x j)) := sorry
lemma selmerToBidual_bijective (F : SelmerStructure K R T) (r : ℕ)
    [Module.Free R F.selmer] [Module.Finite R F.selmer] :
    Function.Bijective (selmerToBidual F r) := sorry
-- Unit test: TauCeti.StarkSystems.selmerBidual_free_three
example (F : SelmerStructure K R T) (e : F.selmer ≃ₗ[R] (Fin 3 → R)) :
    Module.finrank R (selmerBidual F 2) = 3 := sorry
-- Unit test: TauCeti.StarkSystems.selmerBidual_zero_degree
example (F : SelmerStructure K R T) : Nonempty (selmerBidual F 0 ≃ₗ[R] R) := sorry
-- Unit test: TauCeti.StarkSystems.selmerBidual_torsion
example (F : SelmerStructure K R T) [IsDomain R] (p : R) (hp : p ≠ 0)
    (e : F.selmer ≃ₗ[R] (R × (R ⧸ Ideal.span {p}))) (ht : Nontrivial (R ⧸ Ideal.span {p})) :
    ¬ Function.Injective (selmerToBidual F 1) := sorry

def relaxed (S : SelmerTriple K R T) (n : Vertices S) : SelmerStructure K R T := sorry
lemma relaxed_condition (S : SelmerTriple K R T) (n : Vertices S) (v : Place K) :
    (relaxed S n).condition v = if ∃ q ∈ n.val, v = Sum.inr q then ⊤ else S.F.condition v := sorry
def strictDual (S : SelmerTriple K R T) (n : Vertices S) : SelmerStructure K R (dualRep T) := sorry
lemma strictDual_condition (S : SelmerTriple K R T) (n : Vertices S) (v : Place K) :
    (strictDual S n).condition v = if ∃ q ∈ n.val, v = Sum.inr q then ⊥ else S.dual.F.condition v := sorry
/-- Local comparison data, supplied by the chosen ray-class tower. -/
structure ComparisonData (S : SelmerTriple K R T) (p : ℕ) where
  tame : ∀ q ∈ S.primes, LocalTameData T p q
  polynomial : ∀ q ∈ S.primes, ((frobEnd T q).charpoly.reverse).eval 1 = 0
  rankOne : ∀ q ∈ S.primes, Nonempty ((T ⧸ LinearMap.range ((frobEnd T q)-LinearMap.id)) ≃ₗ[R] R)
variable {S : SelmerTriple K R T} {p : ℕ}
abbrev Wtr (D : ComparisonData S p) (n : Vertices S) :=
  (q : n.val) → Module.Dual R (transverse T (D.tame q.val (n.property q.val q.property)))
abbrev Wsing (n : Vertices S) := (q : n.val) → Module.Dual R (singular T q)
abbrev stalk (D : ComparisonData S p) (r : ℕ) (n : Vertices S) :=
  (⋀[R]^(r+n.val.card) (relaxed S n).selmer) ⊗[R] (⋀[R]^n.val.card (Wtr D n))
abbrev bidualStalk (r : ℕ) (n : Vertices S) :=
  selmerBidual (relaxed S n) (r+n.val.card) ⊗[R] (⋀[R]^n.val.card (Wsing (T := T) n))
/-- Ordered contraction of the transverse localizations; the determinant factor cancels reordering. -/
def transition (D : ComparisonData S p) (r : ℕ) (m n : Vertices S) (h : m.val ⊆ n.val) :
    stalk D r n →ₗ[R] stalk D r m := sorry
def bidualTransition (D : ComparisonData S p) (r : ℕ) (m n : Vertices S) (h : m.val ⊆ n.val) :
    bidualStalk (T := T) r n →ₗ[R] bidualStalk (T := T) r m := sorry
lemma transition_comp (D : ComparisonData S p) (r : ℕ) (l m n : Vertices S)
    (hlm : l.val ⊆ m.val) (hmn : m.val ⊆ n.val) :
    (transition D r l m hlm).comp (transition D r m n hmn) =
      transition D r l n (hlm.trans hmn) := sorry
lemma transition_self (D : ComparisonData S p) (r : ℕ) (n : Vertices S) :
    transition D r n n (by rfl) = LinearMap.id := sorry
lemma bidualTransition_comp (D : ComparisonData S p) (r : ℕ) (l m n : Vertices S)
    (hlm : l.val ⊆ m.val) (hmn : m.val ⊆ n.val) :
    (bidualTransition D r l m hlm).comp (bidualTransition D r m n hmn) =
      bidualTransition D r l n (hlm.trans hmn) := sorry
/-- MR inverse limit, with no untyped inverse-system placeholder. -/
def StarkSystem (D : ComparisonData S p) (r : ℕ) : Submodule R (∀ n : Vertices S, stalk D r n) :=
  { carrier := {ε | ∀ m n h, transition D r m n h (ε n) = ε m},
    zero_mem' := sorry, add_mem' := sorry, smul_mem' := sorry }
def BidualStarkSystem (D : ComparisonData S p) (r : ℕ) :
    Submodule R (∀ n : Vertices S, bidualStalk (T := T) r n) :=
  { carrier := {ε | ∀ m n h, bidualTransition D r m n h (ε n) = ε m},
    zero_mem' := sorry, add_mem' := sorry, smul_mem' := sorry }
def StarkSystem.eval (D : ComparisonData S p) (r : ℕ) (n : Vertices S) :
    StarkSystem D r →ₗ[R] stalk D r n := sorry
def StarkSystem.eval_one (D : ComparisonData S p) (r : ℕ) :
    StarkSystem D r →ₗ[R] (⋀[R]^r S.F.selmer) := sorry
lemma StarkSystem.eval_one_dictionary (D : ComparisonData S p) (r : ℕ) :
    ∃ e : stalk D r (initialVertex S) ≃ₗ[R] (⋀[R]^r S.F.selmer),
      StarkSystem.eval_one D r = e.toLinearMap.comp (StarkSystem.eval D r (initialVertex S)) := sorry
-- Unit test: TauCeti.StarkSystems.stalk_one
example (D : ComparisonData S p) (r : ℕ) : Nonempty (stalk D r (initialVertex S) ≃ₗ[R] (⋀[R]^r S.F.selmer)) := sorry
-- Unit test: TauCeti.StarkSystems.rank_one_free_stalk
example (D : ComparisonData S p) (r : ℕ) (n : Vertices S)
    (e : (relaxed S n).selmer ≃ₗ[R] (Fin (r+n.val.card) → R)) :
    Nonempty (stalk D r n ≃ₗ[R] R) := sorry
-- Unit test: TauCeti.StarkSystems.not_product
example (D : ComparisonData S p) (r : ℕ) (q : Prime K) (hq : q ∈ S.primes)
    (ε : ∀ n : Vertices S, stalk D r n) (h0 : ε (initialVertex S) ≠ 0)
    (hq0 : ε (vertexInsert S (initialVertex S) q hq) = 0) : ε ∉ StarkSystem D r := sorry
/-- Sakamoto Proposition 4.14: transport the determinant of the transverse dual to the singular dual. -/
def transverseSingularDual (D : ComparisonData S p) (n : Vertices S) : Wtr D n ≃ₗ[R] Wsing (T := T) n := sorry
lemma transverseSingularDual_apply (D : ComparisonData S p) (n : Vertices S)
    (f : Wtr D n) (q : n.val) (x : transverse T (D.tame q.val (n.property q.val q.property))) :
    transverseSingularDual D n f q (singularMap T q x.val) = f q x := sorry
def comparisonComponent (D : ComparisonData S p) (r : ℕ) (n : Vertices S) :
    stalk D r n →ₗ[R] bidualStalk (T := T) r n :=
  TensorProduct.map (selmerToBidual (relaxed S n) (r+n.val.card))
    (exteriorPower.map n.val.card (transverseSingularDual D n).toLinearMap)
lemma comparison_transition (D : ComparisonData S p) (r : ℕ) (m n : Vertices S) (h : m.val ⊆ n.val) :
    (comparisonComponent D r m).comp (transition D r m n h) =
      (bidualTransition D r m n h).comp (comparisonComponent D r n) := sorry
/-- Core-vertex cofinality is stated on the actual Selmer modules. -/
def CofinalFreeCoreVertices (S : SelmerTriple K R T) (r : ℕ) : Prop :=
  ∀ m : Vertices S, ∃ n : Vertices S, m.val ⊆ n.val ∧
    Subsingleton (strictDual S n).selmer ∧
      Nonempty ((relaxed S n).selmer ≃ₗ[R] (Fin (r+n.val.card) → R))
def starkComparison (D : ComparisonData S p) (r : ℕ) [IsLocalRing R]
    (hR : PrincipalArtinian (R := R)) (hc : IsCartesianStructure T S.F)
    (hQ : S.primes.Infinite) (hcore : CofinalFreeCoreVertices S r) :
    StarkSystem D r ≃ₗ[R] BidualStarkSystem D r := sorry
lemma starkComparison_eval (D : ComparisonData S p) (r : ℕ) [IsLocalRing R]
    (hR : PrincipalArtinian (R := R)) (hc : IsCartesianStructure T S.F)
    (hQ : S.primes.Infinite) (hcore : CofinalFreeCoreVertices S r) (ε : StarkSystem D r) (n : Vertices S) :
    (starkComparison D r hR hc hQ hcore ε).val n = comparisonComponent D r n (ε.val n) := sorry
example (D : ComparisonData S p) (r : ℕ) (n : Vertices S)
    [Module.Free R (relaxed S n).selmer] [Module.Finite R (relaxed S n).selmer] :
    Function.Bijective (comparisonComponent D r n) := sorry
example (D : ComparisonData S p) (r : ℕ) (m n : Vertices S) (h : m.val ⊆ n.val) :
    comparisonComponent D r m (transition D r m n h 0) = bidualTransition D r m n h (comparisonComponent D r n 0) := sorry
example (D : ComparisonData S p) (r : ℕ) [IsLocalRing R]
    (hR : PrincipalArtinian (R := R)) (hc : IsCartesianStructure T S.F)
    (hQ : S.primes.Infinite) (hcore : CofinalFreeCoreVertices S r) :
    starkComparison D r hR hc hQ hcore 0 = 0 := sorry

variable [IsLocalRing R]
structure BSSHypothesis32 (T : SelmerRep K R) (p : ℕ) where
  irreducible : ResiduallyIrreducible T
  exponent : ℕ
  exponentSpec : (p^exponent : R) = 0 ∧ ∀ e < exponent, (p^e : R) ≠ 0
  tau : GK K
  tauHM : tau ∈ HMGroup p (some exponent)
  tauCoinvariants : RankOneCoinvariants T tau
  primalFix : MR16SplittingGroup T p (some exponent) ≤ representationKernel T
  dualFix : MR16SplittingGroup T p (some exponent) ≤ representationKernel (dualRep T)
  h1Primal : Subsingleton (continuousCohomology 1 (descentRep T
    (MR16SplittingGroup T p (some exponent)) primalFix))
  h1Dual : Subsingleton (continuousCohomology 1 (descentRep (dualRep T)
    (MR16SplittingGroup T p (some exponent)) dualFix))
def BSSHypothesis33 (T : SelmerRep K R) : Prop := NoResidualInvariants T (IsLocalRing.maximalIdeal R)
structure BSSHypothesis42 (S : SelmerTriple K R T) (r : ℕ) where
  vertex : Vertices S
  strictDualZero : Subsingleton (strictDual S vertex).selmer
  expectedRank : Nonempty ((relaxed S vertex).selmer ≃ₗ[R] (Fin (r+vertex.val.card) → R))
structure BSSHypothesis47 (T : SelmerRep K R) (p : ℕ) where
  irreducible : ResiduallyIrreducible T
  tau : GK K
  tauHM : tau ∈ HMGroup p none
  tauCoinvariants : RankOneCoinvariants T tau
  h1Vanishing : H1ImageVanishing T (MR16SplittingGroup T p none)
    (hmSplitting_le_residual T p none) (hmSplitting_le_residual_dual T p none)
/-- A Gorenstein order has self-injective quotients at every positive p-power level. -/
structure GorensteinOrderData (p : ℕ) where
  prime : p.Prime
  O : Type
  [ringO : CommRing O]
  [domainO : IsDomain O]
  [dvrO : IsDiscreteValuationRing O]
  [algebra : Algebra O R]
  finite : Module.Finite O R
  free : Module.Free O R
  characteristicZero : CharZero O
  completeO : IsAdicComplete (IsLocalRing.maximalIdeal O) O
  reduced : IsReduced R
  [dualModule : Module R (R →ₗ[O] O)]
  selfDual : Nonempty ((R →ₗ[O] O) ≃ₗ[R] R)
  residueChar : CharP (IsLocalRing.ResidueField R) p
  residueFinite : Finite (IsLocalRing.ResidueField R)
attribute [instance] GorensteinOrderData.ringO GorensteinOrderData.domainO GorensteinOrderData.dvrO
attribute [instance] GorensteinOrderData.algebra GorensteinOrderData.dualModule
lemma BSSHypothesis42.free_of_core (D : ComparisonData S p) (r : ℕ)
    (h : BSSHypothesis42 S r) [IsNoetherianRing R] [Module.Injective R R]
    (n : Vertices S) (hn : Subsingleton (strictDual S n).selmer) :
    Nonempty ((relaxed S n).selmer ≃ₗ[R] (Fin (r+n.val.card) → R)) := sorry
lemma BSSHypothesis47.toFiniteLevel (T : SelmerRep K R) [Module.Free R T] [Module.Finite R T]
    (hO : GorensteinOrderData (R := R) p) (h : BSSHypothesis47 T p) (m : ℕ) (hm : 0 < m)
    [IsLocalRing (R ⧸ Ideal.span {(p^m : R)})] :
    Nonempty (BSSHypothesis32 (reducedRep T (Ideal.span {(p^m : R)})) p) ∧
      BSSHypothesis33 (reducedRep T (Ideal.span {(p^m : R)})) := sorry
-- Unit test: TauCeti.StarkSystems.not_bss33_trivial
example (T : SelmerRep K R) (p : ℕ) (hT : ∀ g : GK K, ∀ x : T, T.ρ g x = x)
    (e : T ≃ₗ[R] R)  : ¬ BSSHypothesis33 T := sorry
-- Unit test: TauCeti.StarkSystems.bss_rank_one_coinvariants
example (T : SelmerRep K R) (e : T ≃ₗ[R] R) : RankOneCoinvariants T 1 := sorry
-- Unit test: TauCeti.StarkSystems.bss42_strict_dual_zero
example (D : ComparisonData S p) (r : ℕ) (h : BSSHypothesis42 S r) :
    Subsingleton (strictDual S h.vertex).selmer := h.strictDualZero
/-- Finite BSS hypotheses, including the actual admissible Frobenius prime set. -/
structure BSSFiniteData (S : SelmerTriple K R T) (p r : ℕ) where
  prime : p.Prime
  characteristic : CharP (IsLocalRing.ResidueField R) p
  finiteResidue : Finite (IsLocalRing.ResidueField R)
  noetherian : IsNoetherianRing R
  selfInjective : Module.Injective R R
  artinian : IsArtinianRing R
  h32 : BSSHypothesis32 T p
  h33 : BSSHypothesis33 T
  h42 : BSSHypothesis42 S r
  splitting : Layer K
  splittingSpec : splitting.group = MR16SplittingGroup T p (some h32.exponent)
  primesSpec : S.primes = frobeniusPrimes T S splitting h32.tau
  coordinates : ∀ q ∈ S.primes, singular T q ≃ₗ[R] R
/-- Normalized BSS components: the determinant of local duals has been trivialized. -/
def normalizeStalk (D : ComparisonData S p) (r : ℕ) (h : BSSFiniteData S p r) (n : Vertices S) :
    bidualStalk (T := T) r n ≃ₗ[R] selmerBidual (relaxed S n) (r+n.val.card) := sorry
def bssTransition (D : ComparisonData S p) (r : ℕ) (h : BSSFiniteData S p r)
    (m n : Vertices S) (hmn : m.val ⊆ n.val) :
    selmerBidual (relaxed S n) (r+n.val.card) →ₗ[R] selmerBidual (relaxed S m) (r+m.val.card) :=
  (normalizeStalk D r h m).toLinearMap.comp
    ((bidualTransition D r m n hmn).comp (normalizeStalk D r h n).symm.toLinearMap)
def BSSStarkSystem (D : ComparisonData S p) (r : ℕ) (h : BSSFiniteData S p r) :
    Submodule R (∀ n : Vertices S, selmerBidual (relaxed S n) (r+n.val.card)) :=
  { carrier := {ε | ∀ (m n : Vertices S) (hmn : m.val ⊆ n.val),
      bssTransition D r h m n hmn (ε n) = ε m},
    zero_mem' := sorry, add_mem' := sorry, smul_mem' := sorry }
def StarkSystem.ideal (D : ComparisonData S p) (r : ℕ) (h : BSSFiniteData S p r)
    (ε : BSSStarkSystem D r h) (i : ℕ) : Ideal R :=
  ⨆ (n : Vertices S) (_ : n.val.card = i), LinearMap.range (ε.val n)
def StarkSystem.idealInfinity (D : ComparisonData S p) (r : ℕ) (h : BSSFiniteData S p r)
    (ε : BSSStarkSystem D r h) : Ideal R := ⨆ i, StarkSystem.ideal D r h ε i
/-- Actual finite Selmer module dual in the Fitting formulas. -/
abbrev finiteDualSelmer (S : SelmerTriple K R T) := Module.Dual R S.dual.F.selmer
/-- Import adapter for L6/the current Tau Ceti FittingIdeal API, which postdates the pin.
The source-presentation equation below fixes its meaning; this is not an ES-owned construction. -/
def fittingIdeal (M : Type) [AddCommGroup M] [Module R M] (i : ℕ) : Ideal R := sorry
/-- A matrix presentation of M, including its cokernel dictionary. -/
structure MatrixPresentation (M : Type) [AddCommGroup M] [Module R M] where
  s : ℕ
  t : ℕ
  relation : (Fin t → R) →ₗ[R] (Fin s → R)
  quotient : ((Fin s → R) ⧸ LinearMap.range relation) ≃ₗ[R] M
def presentationMinorIdeal {M : Type} [AddCommGroup M] [Module R M]
    (P : MatrixPresentation (R := R) M) (i : ℕ) : Ideal R :=
  Ideal.span {a | ∃ (rows : Fin (P.s-i) → Fin P.s) (cols : Fin (P.s-i) → Fin P.t),
    Function.Injective rows ∧ Function.Injective cols ∧
    a = Matrix.det (fun j k => P.relation (Pi.single (cols k) 1) (rows j))}
lemma fittingIdeal_presentation {M : Type} [AddCommGroup M] [Module R M]
    (P : MatrixPresentation (R := R) M) (i : ℕ) : fittingIdeal (R := R) M i = presentationMinorIdeal P i := sorry
lemma fittingIdeal_quotient (I : Ideal R) : fittingIdeal (R ⧸ I) 0 = I := sorry
/-- All-principal-artinian MR Stark structure. -/
theorem stark_structure_mr (D : ComparisonData S p) (r : ℕ)
    (h : MR16Hypotheses T S p r) (hR : PrincipalArtinian (R := R))
    (h7 : h.IsArtinianAdmissible) : Nonempty (StarkSystem D r ≃ₗ[R] R) := sorry
/-- BSS Theorem 4.6; Stark systems do not require p>3. -/
theorem stark_structure (D : ComparisonData S p) (r : ℕ) (h : BSSFiniteData S p r) :
    Nonempty (BSSStarkSystem D r h ≃ₗ[R] R) ∧
      ∀ (ε : BSSStarkSystem D r h) (i : ℕ),
        StarkSystem.ideal D r h ε i = StarkSystem.idealInfinity D r h ε * fittingIdeal (finiteDualSelmer S) i := sorry
lemma StarkSystem.ideal_mono (D : ComparisonData S p) (r : ℕ) (h : BSSFiniteData S p r)
    (ε : BSSStarkSystem D r h) : Monotone (StarkSystem.ideal D r h ε) := sorry
lemma StarkSystem.idealInfinity_eq_top_iff (D : ComparisonData S p) (r : ℕ) (h : BSSFiniteData S p r)
    (ε : BSSStarkSystem D r h) : StarkSystem.idealInfinity D r h ε = ⊤ ↔
      Submodule.span R {ε} = (⊤ : Submodule R (BSSStarkSystem D r h)) := sorry

/-- Modified F(n), with the original coefficient A; admissibility here has I_q=0. -/
def rankModified (D : ComparisonData S p) (n : Vertices S) : SelmerStructure K R T := sorry
lemma rankModified_condition (D : ComparisonData S p) (n : Vertices S) (q : Prime K) :
    (rankModified D n).condition (Sum.inr q) = if hq : q ∈ n.val then
      transverse T (D.tame q (n.property q hq)) else S.F.condition (Sum.inr q) := sorry
lemma rankModified_infinite (D : ComparisonData S p) (n : Vertices S) (v : NumberField.InfinitePlace K) :
    (rankModified D n).condition (Sum.inl v) = S.F.condition (Sum.inl v) := sorry
def rankStrict (D : ComparisonData S p) (n : Vertices S) (q : Prime K) : SelmerStructure K R T := sorry
lemma rankStrict_condition (D : ComparisonData S p) (n : Vertices S) (q : Prime K) (v : Place K) :
    (rankStrict D n q).condition v = if v = Sum.inr q then ⊥ else (rankModified D n).condition v := sorry
abbrev rankStalk (D : ComparisonData S p) (r : ℕ) (n : Vertices S) :=
  selmerBidual (rankModified D n) r ⊗[ℤ] tameGroup K p n.val
abbrev rankExteriorStalk (D : ComparisonData S p) (r : ℕ) (n : Vertices S) :=
  (⋀[R]^r (rankModified D n).selmer) ⊗[ℤ] tameGroup K p n.val
abbrev rankEdge (D : ComparisonData S p) (r : ℕ) (n : Vertices S) (q : Prime K) :=
  (singular T q ⊗[R] selmerBidual (rankStrict D n q) (r-1)) ⊗[ℤ] tameGroup K p (insert q n.val)
def rankUpper (D : ComparisonData S p) (r : ℕ) (hr : 0 < r)
    (n : Vertices S) (q : Prime K) (hq : q ∈ S.primes) (hqn : q ∉ n.val) :
    rankStalk D r (vertexInsert S n q hq) →ₗ[R] rankEdge D r n q := sorry
def rankLower (D : ComparisonData S p) (r : ℕ) (hr : 0 < r)
    (n : Vertices S) (q : Prime K) (hq : q ∈ S.primes) (hqn : q ∉ n.val) :
    rankStalk D r n →ₗ[R] rankEdge D r n q := sorry
/-- Edge maps are the Selmer contraction maps against transverse/finite-singular localization. -/
def KolyvaginSystemRank (D : ComparisonData S p) (r : ℕ) (hr : 0 < r) :
    Submodule R (∀ n : Vertices S, rankStalk D r n) :=
  { carrier := {κ | ∀ n q hq hqn, rankUpper D r hr n q hq hqn (κ (vertexInsert S n q hq)) =
      rankLower D r hr n q hq hqn (κ n)}, zero_mem' := sorry, add_mem' := sorry, smul_mem' := sorry }
def KolyvaginSystemRank.eval (D : ComparisonData S p) (r : ℕ) (hr : 0 < r) (n : Vertices S) :
    KolyvaginSystemRank D r hr →ₗ[R] rankStalk D r n := sorry
/-- The MR rank-r sheaf uses exterior powers. The bidual version is kept separate. -/
def rankSelmerSheaf (D : ComparisonData S p) (r : ℕ) (hr : 0 < r) : GraphSheaf.{0,0,0} R (conductorGraph S) :=
  { stalk := rankExteriorStalk D r, addCommGroupStalk := inferInstance, moduleStalk := inferInstance,
    edge := fun e =>
      let o := orientEdge S e
      ((transverse T (D.tame o.q o.inP)) ⊗[R] (⋀[R]^(r-1) (rankStrict D o.n o.q).selmer)) ⊗[ℤ]
        tameGroup K p (insert o.q o.n.val),
    addCommGroupEdge := fun e => inferInstance, moduleEdge := fun e => inferInstance,
    toEdge := sorry }
def MRKolyvaginSystemRank (D : ComparisonData S p) (r : ℕ) (hr : 0 < r) :=
  (rankSelmerSheaf D r hr).sections
/-- Same exterior rank throughout the stub inclusion. -/
def KolyvaginSystemRank.stub (D : ComparisonData S p) (r : ℕ) (hr : 0 < r) :
    Submodule R (MRKolyvaginSystemRank D r hr) :=
  { carrier := {κ | ∀ n : Vertices S, κ.val n ∈
      IsLocalRing.maximalIdeal R ^ len R (dualStructure T (rankModified D n)).selmer •
        (⊤ : Submodule R (rankExteriorStalk D r n))},
    zero_mem' := sorry, add_mem' := sorry, smul_mem' := sorry }
/-- Choose compatible cyclic tame generators. Their unit rescaling changes each
normalized value by a unit and hence leaves its evaluation ideal unchanged. -/
def normalizeRankStalk (D : ComparisonData S p) (r : ℕ) (hr : 0 < r)
    (h : BSSFiniteData S p r) (n : Vertices S) :
    rankStalk D r n ≃ₗ[R] selmerBidual (rankModified D n) r := sorry
def tameScalar (D : ComparisonData S p) (r : ℕ) (h : BSSFiniteData S p r) (n : Vertices S) :
    tameGroup K p n.val →ₗ[ℤ] R := sorry
lemma normalizeRankStalk_pure (D : ComparisonData S p) (r : ℕ) (hr : 0 < r)
    (h : BSSFiniteData S p r) (n : Vertices S) (x : selmerBidual (rankModified D n) r)
    (g : tameGroup K p n.val) : normalizeRankStalk D r hr h n (x ⊗ₜ[ℤ] g) = tameScalar D r h n g • x := sorry
def KolyvaginSystemRank.ideal (D : ComparisonData S p) (r : ℕ) (hr : 0 < r)
    (h : BSSFiniteData S p r) (κ : KolyvaginSystemRank D r hr) (i : ℕ) : Ideal R :=
  ⨆ (n : Vertices S) (_ : n.val.card=i), LinearMap.range (normalizeRankStalk D r hr h n (κ.val n))
lemma KolyvaginSystemRank.ideal_formula (D : ComparisonData S p) (r : ℕ) (hr : 0 < r)
    (h : BSSFiniteData S p r) (κ : KolyvaginSystemRank D r hr) (i : ℕ) :
    KolyvaginSystemRank.ideal D r hr h κ i =
      ⨆ (n : Vertices S) (_ : n.val.card=i), LinearMap.range (normalizeRankStalk D r hr h n (κ.val n)) := sorry
def regulator (D : ComparisonData S p) (r : ℕ) (hr : 0 < r) (h : BSSFiniteData S p r) :
    BSSStarkSystem D r h →ₗ[R] KolyvaginSystemRank D r hr := sorry
def regulatorComponent (D : ComparisonData S p) (r : ℕ) (hr : 0 < r) (n : Vertices S) :
    selmerBidual (relaxed S n) (r+n.val.card) →ₗ[R] rankStalk D r n := sorry
lemma regulator_eval (D : ComparisonData S p) (r : ℕ) (hr : 0 < r) (h : BSSFiniteData S p r)
    (ε : BSSStarkSystem D r h) (n : Vertices S) :
    (regulator D r hr h ε).val n = regulatorComponent D r hr n (ε.val n) := sorry
lemma regulator_eval_one (D : ComparisonData S p) (r : ℕ) (hr : 0 < r) (h : BSSFiniteData S p r)
    (ε : BSSStarkSystem D r h) :
    ∃ e : rankStalk D r (initialVertex S) ≃ₗ[R] selmerBidual S.F r,
      ∃ e' : selmerBidual (relaxed S (initialVertex S)) r ≃ₗ[R] selmerBidual S.F r,
        e ((regulator D r hr h ε).val (initialVertex S)) = e' (by simpa [initialVertex] using ε.val (initialVertex S)) := sorry
/-- BSS II Theorem 5.2, with the prime restriction. -/
theorem regulator_isomorphism (D : ComparisonData S p) (r : ℕ) (hr : 0 < r)
    (h : BSSFiniteData S p r) (hp : 3 < p) : Function.Bijective (regulator D r hr h) := sorry
theorem regulator_fitting_bound (D : ComparisonData S p) (r : ℕ) (hr : 0 < r)
    (h : BSSFiniteData S p r) (hp : 3 < p) (κ : KolyvaginSystemRank D r hr) (i : ℕ) :
    KolyvaginSystemRank.ideal D r hr h κ i ≤ fittingIdeal (finiteDualSelmer S) i := sorry
theorem regulator_fitting_equality_zero (D : ComparisonData S p) (r : ℕ) (hr : 0 < r)
    (h : BSSFiniteData S p r) (hp : 3 < p) (κ : KolyvaginSystemRank D r hr)
    (hκ : Submodule.span R {κ} = (⊤ : Submodule R (KolyvaginSystemRank D r hr))) :
    KolyvaginSystemRank.ideal D r hr h κ 0 = fittingIdeal (finiteDualSelmer S) 0 := sorry
theorem regulator_fitting_equality (D : ComparisonData S p) (r : ℕ) (hr : 0 < r)
    (h : BSSFiniteData S p r) (hp : 3 < p) [IsPrincipalIdealRing R]
    (κ : KolyvaginSystemRank D r hr)
    (hκ : Submodule.span R {κ} = (⊤ : Submodule R (KolyvaginSystemRank D r hr))) (i : ℕ) :
    KolyvaginSystemRank.ideal D r hr h κ i = fittingIdeal (finiteDualSelmer S) i := sorry
-- Unit test: TauCeti.StarkSystems.regulator_zero
example (D : ComparisonData S p) (r : ℕ) (hr : 0 < r) (h : BSSFiniteData S p r) : regulator D r hr h 0 = 0 := sorry
-- Unit test: TauCeti.StarkSystems.rank_system_not_product
example (D : ComparisonData S p) (r : ℕ) (hr : 0 < r) (κ : ∀ n : Vertices S, rankStalk D r n)
    (n : Vertices S) (q : Prime K) (hq : q ∈ S.primes) (hqn : q ∉ n.val)
    (hu : rankUpper D r hr n q hq hqn (κ (vertexInsert S n q hq)) = 0)
    (hl : rankLower D r hr n q hq hqn (κ n) ≠ 0) : κ ∉ KolyvaginSystemRank D r hr := sorry
-- A same-rank stalk witness: over a field a positive dual length kills the stub.
-- Unit test: TauCeti.StarkSystems.stub_stalk_zero_field
example (D : ComparisonData S p) (r : ℕ) (hr : 0 < r) (n : Vertices S) (hR : IsField R)
    (hLength : 0 < len R (dualStructure T (rankModified D n)).selmer)
    (hne : Nontrivial (rankExteriorStalk D r n)) :
    IsLocalRing.maximalIdeal R ^ len R (dualStructure T (rankModified D n)).selmer •
      (⊤ : Submodule R (rankExteriorStalk D r n)) = ⊥ ∧
      (⊤ : Submodule R (rankExteriorStalk D r n)) ≠ ⊥ := sorry
end TauCeti.StarkSystems

namespace TauCeti.EulerSystems
open TauCeti.KolyvaginSystems
abbrev FiniteGalois := TauCeti.KolyvaginSystems.Layer.Gal
variable {K R : Type} [Field K] [NumberField K] [CommRing R] [TopologicalSpace R]
variable {T : GaloisRep K R} [Module.Free R T] [Module.Finite R T] {A : Tower T}
/-- The compositum F K(n), not the maximal ray class field of the product modulus. -/
def auxiliaryLayer (F : FiniteLayer A) (n : Conductor K) : Layer K := compositum F.val (rayLayer K A.p n)
def auxiliaryFiniteLayer (hA : IsAdmissibleTower T A) (F : FiniteLayer A)
    (n : Conductor K) (hn : ∀ q ∈ n, Sum.inr q ∉ A.bad) : FiniteLayer A := sorry
lemma auxiliaryFiniteLayer_val (hA : IsAdmissibleTower T A) (F : FiniteLayer A)
    (n : Conductor K) (hn : ∀ q ∈ n, Sum.inr q ∉ A.bad) :
    (auxiliaryFiniteLayer hA F n hn).val = auxiliaryLayer F n := sorry
abbrev Divisors (n : Conductor K) := {s : Conductor K // s ⊆ n}
def relativeGal (F F' : Layer K) (h : F'.group ≤ F.group) : Subgroup (FiniteGalois K F') := sorry
lemma mem_relativeGal (F F' : Layer K) (h : F'.group ≤ F.group) (g : GK K) :
    QuotientGroup.mk g ∈ relativeGal F F' h ↔ g ∈ F.group := sorry
instance relativeGal_finite (F F' : Layer K) (h : F'.group ≤ F.group) : Fintype (relativeGal F F' h) := sorry
def relativeCharacter {T : GaloisRep K R} {A : Tower T} (χ : CharacterData A) (F : FiniteLayer A) :
    relativeGal F.val (compositumLayer F χ.field).val (by sorry) →* Rˣ := sorry
lemma relativeCharacter_mk {T : GaloisRep K R} {A : Tower T} (χ : CharacterData A) (F : FiniteLayer A)
    (g : F.val.group) : relativeCharacter χ F
      ⟨QuotientGroup.mk g.val, by sorry⟩ = χ.character g.val := sorry
lemma characterTrace_sum {T : GaloisRep K R} {A : Tower T} (χ : CharacterData A) (F : FiniteLayer A)
    (x : HAt K R T (compositumLayer F χ.field).val 1) : characterTrace χ F x =
      ∑ g : relativeGal F.val (compositumLayer F χ.field).val (by sorry),
        (relativeCharacter χ F g : R) • cohomologyAction T (compositumLayer F χ.field).val g.val x := sorry
namespace Universal
variable (F : FiniteLayer A) (n : Conductor K)
abbrev GroupRing := MonoidAlgebra R (FiniteGalois K (auxiliaryLayer F n))
abbrev Y := Divisors n →₀ GroupRing (R := R) F n
def freeGen (s : Divisors n) : Y (R := R) F n := Finsupp.single s 1
def subgroupNorm (U : Subgroup (FiniteGalois K (auxiliaryLayer F n))) [Fintype U] : GroupRing (R := R) F n :=
  ∑ g : U, MonoidAlgebra.of R (FiniteGalois K (auxiliaryLayer F n)) g.val
def factorAt (E : EulerFactors T A) (q : FinitePrime K) (hq : Sum.inr q ∉ A.bad) : GroupRing (R := R) F n :=
  Polynomial.eval₂ (algebraMap R (GroupRing (R := R) F n))
    (MonoidAlgebra.of R (FiniteGalois K (auxiliaryLayer F n)) (QuotientGroup.mk (frobenius K q).val⁻¹))
    (E.poly T q hq)
def relations (E : EulerFactors T A) (hn : ∀ q ∈ n, Sum.inr q ∉ A.bad) :
    Submodule (GroupRing (R := R) F n) (Y (R := R) F n) :=
  Submodule.span (GroupRing (R := R) F n) {y |
    (∃ (s : Divisors n) (g : relativeGal (auxiliaryLayer F s.val) (auxiliaryLayer F n) (by sorry)),
      y = MonoidAlgebra.of R (FiniteGalois K (auxiliaryLayer F n)) g.val • freeGen (R := R) F n s - freeGen (R := R) F n s) ∨
    (∃ (s : Divisors n) (q : FinitePrime K) (hq : q ∈ n) (hqs : q ∉ s.val)
      (hins : insert q s.val ⊆ n), Fintype.card (gammaPrime K A.p q) ≠ 1 ∧
      y = subgroupNorm (R := R) F n
        (relativeGal (auxiliaryLayer F (n.erase q)) (auxiliaryLayer F n) (by sorry)) •
          freeGen (R := R) F n ⟨insert q s.val,hins⟩ - factorAt F n E q (hn q hq) • freeGen (R := R) F n s) ∨
    (∃ (s : Divisors n) (q : FinitePrime K) (hq : q ∈ n) (hqs : q ∉ s.val)
      (hins : insert q s.val ⊆ n), Fintype.card (gammaPrime K A.p q) = 1 ∧
      y = freeGen (R := R) F n ⟨insert q s.val,hins⟩ - freeGen (R := R) F n s)}
abbrev X (E : EulerFactors T A) (hn : ∀ q ∈ n, Sum.inr q ∉ A.bad) :=
  Y (R := R) F n ⧸ relations F n E hn
instance xRModule (E : EulerFactors T A) (hn : ∀ q ∈ n, Sum.inr q ∉ A.bad) : Module R (X F n E hn) := sorry
lemma xR_smul (E : EulerFactors T A) (hn : ∀ q ∈ n, Sum.inr q ∉ A.bad) (r : R) (x : X F n E hn) :
    r • x = (algebraMap R (GroupRing (R := R) F n) r) • x := sorry
def gen (E : EulerFactors T A) (hn : ∀ q ∈ n, Sum.inr q ∉ A.bad) (s : Divisors n) : X F n E hn :=
  Submodule.Quotient.mk (freeGen (R := R) F n s)
lemma fixed_gen (E : EulerFactors T A) (hn : ∀ q ∈ n, Sum.inr q ∉ A.bad)
    (s : Divisors n) (g : relativeGal (auxiliaryLayer F s.val) (auxiliaryLayer F n) (by sorry)) :
    MonoidAlgebra.of R (FiniteGalois K (auxiliaryLayer F n)) g.val • gen F n E hn s = gen F n E hn s := sorry
lemma norm_gen_trivial (E : EulerFactors T A) (hn : ∀ q ∈ n, Sum.inr q ∉ A.bad)
    (s : Divisors n) (q : FinitePrime K) (hq : q ∈ n) (hins : insert q s.val ⊆ n)
    (htr : Fintype.card (gammaPrime K A.p q) = 1) :
    gen F n E hn ⟨insert q s.val,hins⟩ = gen F n E hn s := sorry
lemma norm_gen (E : EulerFactors T A) (hn : ∀ q ∈ n, Sum.inr q ∉ A.bad)
    (s : Divisors n) (q : FinitePrime K) (hq : q ∈ n) (hqs : q ∉ s.val)
    (hins : insert q s.val ⊆ n) (htr : Fintype.card (gammaPrime K A.p q) ≠ 1) :
    subgroupNorm F n (relativeGal (auxiliaryLayer F (n.erase q)) (auxiliaryLayer F n) (by sorry)) •
      gen F n E hn ⟨insert q s.val,hins⟩ = factorAt F n E q (hn q hq) • gen F n E hn s := sorry
def lift (E : EulerFactors T A) (hA : IsAdmissibleTower T A)
    (hn : ∀ q ∈ n, Sum.inr q ∉ A.bad) (c : EulerSystem T E) :
    X F n E hn →ₗ[R] HAt K R T (auxiliaryLayer F n) 1 := sorry
lemma lift_gen (E : EulerFactors T A) (hA : IsAdmissibleTower T A)
    (hn : ∀ q ∈ n, Sum.inr q ∉ A.bad) (c : EulerSystem T E) (s : Divisors n) :
    lift F n E hA hn c (gen F n E hn s) =
      resAt T (auxiliaryLayer F s.val) (auxiliaryLayer F n) (by sorry)
        (by rw [← auxiliaryFiniteLayer_val hA F s.val (by sorry)];
            exact c.val (auxiliaryFiniteLayer hA F s.val (by sorry))) := sorry
lemma lift_equivariant (E : EulerFactors T A) (hA : IsAdmissibleTower T A)
    (hn : ∀ q ∈ n, Sum.inr q ∉ A.bad) (c : EulerSystem T E)
    (g : FiniteGalois K (auxiliaryLayer F n)) (x : X F n E hn) :
    lift F n E hA hn c (MonoidAlgebra.of R (FiniteGalois K (auxiliaryLayer F n)) g • x) =
      cohomologyAction T (auxiliaryLayer F n) g (lift F n E hA hn c x) := sorry
theorem free (E : EulerFactors T A) (hA : IsAdmissibleTower T A)
    (hn : ∀ q ∈ n, Sum.inr q ∉ A.bad) (hF : F.val.group ≥ hA.direction.subgroup) :
    Module.Free R (X F n E hn) ∧ Module.Finite R (X F n E hn) ∧
      Module.finrank R (X F n E hn) = Fintype.card (FiniteGalois K (auxiliaryLayer F n)) := sorry
-- Unit test: Universal.X_one
example (E : EulerFactors T A) (hA : IsAdmissibleTower T A)
    (hF : F.val.group = ⊤) (h1 : (rayLayer K A.p ∅).group = ⊤) :
    Nonempty (X F ∅ E (by simp) ≃ₗ[R] R) := sorry
-- Unit test: Universal.rank_one_prime
example (E : EulerFactors T A) (hA : IsAdmissibleTower T A) (q : FinitePrime K)
    (hq : Sum.inr q ∉ A.bad) (hF : F.val.group = ⊤)
    (h1 : (rayLayer K A.p ∅).group = ⊤) :
    Module.finrank R (X F {q} E (by simpa)) = Fintype.card (gammaPrime K A.p q) := sorry
-- Unit test: Universal.zero_lift
example (E : EulerFactors T A) (hA : IsAdmissibleTower T A)
    (hn : ∀ q ∈ n, Sum.inr q ∉ A.bad) (s : Divisors n) : lift F n E hA hn 0 (gen F n E hn s) = 0 := sorry
end Universal
end TauCeti.EulerSystems

namespace TauCeti.KolyvaginSystems
open TauCeti.EulerSystems
variable {K R : Type} [Field K] [NumberField K] [CommRing R] [TopologicalSpace R]
/-- Continuous crossed homomorphisms, with the canonical H¹ class adapter from L1. -/
structure Cocycle (T : Rep K R) (U : Subgroup (GK K)) where
  val : U → T
  continuous : Continuous val
  crossed : ∀ g h, val (g*h) = val g + T.ρ g.val (val h)
def cocycleClass (T : Rep K R) (F : Layer K) : Cocycle T F.group → HAt K R T F 1 := sorry
lemma cocycleClass_eq_zero (T : Rep K R) (F : Layer K) (z : Cocycle T F.group) :
    cocycleClass T F z = 0 ↔ ∃ t : T, ∀ g, z.val g = T.ρ g.val t - t := sorry
/-- The coinduced carrier is continuous maps, with right translation. -/
def coinduced (T : Rep K R) : Rep K R := sorry
def coinducedEquiv (T : Rep K R) : coinduced T ≃ₗ[R] C(GK K,T) := sorry
lemma coinduced_action (T : Rep K R) (g : GK K) (f : coinduced T) (h : GK K) :
    coinducedEquiv T ((coinduced T).ρ g f) h = coinducedEquiv T f (h*g) := sorry
def coinducedEmbedding (T : Rep K R) (hT : IsContinuous K R T) : T ⟶ coinduced T := sorry
lemma coinducedEmbedding_apply (T : Rep K R) (hT : IsContinuous K R T) (t : T) (g : GK K) :
    coinducedEquiv T ((coinducedEmbedding T hT).hom t) g = T.ρ g t := sorry
def coinducedQuotient (T : Rep K R) (hT : IsContinuous K R T) : Rep K R := sorry
def coinducedQuotientEquiv (T : Rep K R) (hT : IsContinuous K R T) :
    coinducedQuotient T hT ≃ₗ[R] (coinduced T ⧸ LinearMap.range (coinducedEmbedding T hT).hom.toLinearMap) := sorry
def inducedProjection (T : Rep K R) (hT : IsContinuous K R T) : coinduced T ⟶ coinducedQuotient T hT := sorry
lemma inducedProjection_apply (T : Rep K R) (hT : IsContinuous K R T) (f : coinduced T) :
    coinducedQuotientEquiv T hT ((inducedProjection T hT).hom f) = Submodule.Quotient.mk f := sorry
def fixed (T : Rep K R) (U : Subgroup (GK K)) : Submodule R T :=
  { carrier := {t | ∀ g : U, T.ρ g.val t = t}, zero_mem' := sorry, add_mem' := sorry, smul_mem' := sorry }
def delta (T : Rep K R) (hT : IsContinuous K R T) (F : Layer K) :
    fixed (coinducedQuotient T hT) F.group →ₗ[R] HAt K R T F 1 := sorry
lemma delta_surjective (T : Rep K R) [Finite T] (hT : IsContinuous K R T) (F : Layer K) :
    Function.Surjective (delta T hT F) := sorry
lemma delta_kernel (T : Rep K R) [Finite T] (hT : IsContinuous K R T) (F : Layer K)
    (x : fixed (coinducedQuotient T hT) F.group) : delta T hT F x = 0 ↔
    ∃ f : fixed (coinduced T) F.group, (inducedProjection T hT).hom f = x.val := sorry
lemma delta_cocycle (T : Rep K R) (hT : IsContinuous K R T) (F : Layer K)
    (x : fixed (coinducedQuotient T hT) F.group) (f : coinduced T)
    (hf : (inducedProjection T hT).hom f = x.val) (z : Cocycle T F.group)
    (hz : ∀ g, (coinducedEmbedding T hT).hom (z.val g) = (coinduced T).ρ g.val f - f) :
    delta T hT F x = cocycleClass T F z := sorry
variable {T : Rep K R} [Module.Free R T] [Module.Finite R T] [Fact (IsContinuous K R T)] {A : Tower T}
/-- Rubin's conductor condition includes complete splitting in F(1). -/
def DerivativeAdmissible (E : EulerFactors T A) (F : FiniteLayer A) (M : R) (n : Conductor K) : Prop :=
  M ≠ 0 ∧ ∀ q ∈ n, Sum.inr q ∉ A.bad ∧
    (Fintype.card (gammaPrime K A.p q) : R) ∈ Ideal.span {M} ∧
    (E.poly T q (by sorry)).eval 1 ∈ Ideal.span {M} ∧
    (frobenius K q).val ∈ (auxiliaryLayer F ∅).group
/-- D_{n,F}=N_{F(1)/F}∏D_q acting on the universal module. -/
def universalDerivative (E : EulerFactors T A) (F : FiniteLayer A) (n : Conductor K)
    (hn : ∀ q ∈ n, Sum.inr q ∉ A.bad)
    (σ : ∀ q : n, gammaPrime K A.p q) : Module.End R (Universal.X F n E hn) := sorry
lemma universalDerivative_one (E : EulerFactors T A) (F : FiniteLayer A) :
    universalDerivative E F ∅ (fun q hq => False.elim (Finset.notMem_empty q hq)) (by sorry) =
      (by exact { toFun := fun x => (Universal.subgroupNorm F ∅ (relativeGal F.val (auxiliaryLayer F ∅) (by sorry))) • x, map_add' := sorry, map_smul' := sorry } : Module.End R (Universal.X F ∅ E (fun q hq => False.elim (Finset.notMem_empty q hq)))) := sorry
lemma derivative_invariance (E : EulerFactors T A) (F : FiniteLayer A) (M : R) (n : Conductor K)
    (h : DerivativeAdmissible E F M n) (σ : ∀ q : n, gammaPrime K A.p q)
    (hσ : ∀ (q : n) (g : gammaPrime K A.p q), g ∈ Subgroup.zpowers (σ q))
    (g : relativeGal F.val (auxiliaryLayer F n) (by sorry)) :
    let x := universalDerivative E F n (fun q hq => (h.2 q hq).1) σ
      (Universal.gen F n E (fun q hq => (h.2 q hq).1) ⟨n,Finset.Subset.refl n⟩)
    MonoidAlgebra.of R (Layer.Gal K (auxiliaryLayer F n)) g.val • x - x ∈
      Ideal.span {M} • (⊤ : Submodule R (Universal.X F n E (fun q hq => (h.2 q hq).1))) := sorry
/-- Lifting theorem: the map is into actual quotient invariants and has δ equal to the
reduced universal Euler-system evaluation. This is not an arbitrary lift hypothesis. -/
def inducedLift (E : EulerFactors T A) (hA : IsAdmissibleTower T A) (F : FiniteLayer A)
    (n : Conductor K) (hn : ∀ q ∈ n, Sum.inr q ∉ A.bad) (M : R) (hM : M ≠ 0)
    (c : EulerSystem T E) : Universal.X F n E hn →ₗ[R]
      fixed (coinducedQuotient (quotientRep T (Ideal.span {M}))
        (quotientRep_continuous T Fact.out (Ideal.span {M}))) (auxiliaryLayer F n).group := sorry
lemma inducedLift_delta (E : EulerFactors T A) (hA : IsAdmissibleTower T A) (F : FiniteLayer A)
    (n : Conductor K) (hn : ∀ q ∈ n, Sum.inr q ∉ A.bad) (M : R) (hM : M ≠ 0)
    (c : EulerSystem T E) (x : Universal.X F n E hn) :
    delta _ _ (auxiliaryLayer F n) (inducedLift E hA F n hn M hM c x) =
      (TauCeti.ContinuousCohomology.coeffMap
        (TopRep.resFunctor (auxiliaryLayer F n).group.subtype |>.map (quotientMap T (Ideal.span {M}))) 1).hom
        (Universal.lift F n E hA hn c x) := sorry
/-- The element obtained by differentiating the induced lift is fixed by G_F. -/
def differentiatedLift (E : EulerFactors T A) (hA : IsAdmissibleTower T A)
    (F : FiniteLayer A) (M : R) (n : Conductor K) (h : DerivativeAdmissible E F M n)
    (σ : ∀ q : n, gammaPrime K A.p q) (hσ : ∀ (q : n) (g : gammaPrime K A.p q), g ∈ Subgroup.zpowers (σ q))
    (c : EulerSystem T E) :
    fixed (coinducedQuotient (quotientRep T (Ideal.span {M}))
      (quotientRep_continuous T Fact.out (Ideal.span {M}))) F.val.group := sorry
lemma differentiatedLift_value (E : EulerFactors T A) (hA : IsAdmissibleTower T A)
    (F : FiniteLayer A) (M : R) (n : Conductor K) (h : DerivativeAdmissible E F M n)
    (σ : ∀ q : n, gammaPrime K A.p q) (hσ : ∀ (q : n) (g : gammaPrime K A.p q), g ∈ Subgroup.zpowers (σ q))
    (c : EulerSystem T E) :
    (differentiatedLift E hA F M n h σ hσ c).val =
      (inducedLift E hA F n (fun q hq => (h.2 q hq).1) M h.1 c
        (universalDerivative E F n (fun q hq => (h.2 q hq).1) σ
          (Universal.gen F n E (fun q hq => (h.2 q hq).1) ⟨n,Finset.Subset.refl n⟩))).val := sorry
def derivativeClass (E : EulerFactors T A) (hA : IsAdmissibleTower T A)
    (F : FiniteLayer A) (M : R) (n : Conductor K) (h : DerivativeAdmissible E F M n)
    (σ : ∀ q : n, gammaPrime K A.p q) (hσ : ∀ (q : n) (g : gammaPrime K A.p q), g ∈ Subgroup.zpowers (σ q)) :
    EulerSystem T E →ₗ[R] HAt K R (quotientRep T (Ideal.span {M})) F.val 1 := sorry
lemma derivativeClass_delta (E : EulerFactors T A) (hA : IsAdmissibleTower T A)
    (F : FiniteLayer A) (M : R) (n : Conductor K) (h : DerivativeAdmissible E F M n)
    (σ : ∀ q : n, gammaPrime K A.p q) (hσ : ∀ (q : n) (g : gammaPrime K A.p q), g ∈ Subgroup.zpowers (σ q)) (c : EulerSystem T E) :
    derivativeClass E hA F M n h σ hσ c = delta _ _ F.val (differentiatedLift E hA F M n h σ hσ c) := sorry
lemma derivativeClass_one (E : EulerFactors T A) (hA : IsAdmissibleTower T A)
    (F : FiniteLayer A) (M : R) (hM : M ≠ 0) (c : EulerSystem T E) :
    derivativeClass E hA F M ∅ ⟨hM,by simp⟩ (by sorry) (by simp) c =
      (TauCeti.ContinuousCohomology.coeffMap
        (TopRep.resFunctor F.val.group.subtype |>.map (quotientMap T (Ideal.span {M}))) 1).hom (c.val F) := sorry
def derivativeAt (E : EulerFactors T A) (F : FiniteLayer A) (M : R) (n : Conductor K)
    (σ : ∀ q : n, gammaPrime K A.p q) : Module.End R (HAt K R (quotientRep T (Ideal.span {M})) (auxiliaryLayer F n) 1) := sorry
lemma res_derivativeClass (E : EulerFactors T A) (hA : IsAdmissibleTower T A)
    (F : FiniteLayer A) (M : R) (n : Conductor K) (h : DerivativeAdmissible E F M n)
    (σ : ∀ q : n, gammaPrime K A.p q) (hσ : ∀ (q : n) (g : gammaPrime K A.p q), g ∈ Subgroup.zpowers (σ q)) (c : EulerSystem T E) :
    resAt _ F.val (auxiliaryLayer F n) (by sorry) (derivativeClass E hA F M n h σ hσ c) =
      derivativeAt E F M n σ
        ((TauCeti.ContinuousCohomology.coeffMap
          (TopRep.resFunctor (auxiliaryLayer F n).group.subtype |>.map (quotientMap T (Ideal.span {M}))) 1).hom
          (Universal.lift F n E hA (fun q hq => (h.2 q hq).1) c
            (Universal.gen F n E (fun q hq => (h.2 q hq).1) ⟨n,Finset.Subset.refl n⟩))) := sorry
lemma derivativeClass_reduction (E : EulerFactors T A) (hA : IsAdmissibleTower T A)
    (F : FiniteLayer A) (M M' : R) (d : R) (hd : M'=M*d) (n : Conductor K)
    (h : DerivativeAdmissible E F M n) (h' : DerivativeAdmissible E F M' n)
    (σ : ∀ q : n, gammaPrime K A.p q) (hσ : ∀ (q : n) (g : gammaPrime K A.p q), g ∈ Subgroup.zpowers (σ q)) (c : EulerSystem T E) :
    (TauCeti.ContinuousCohomology.coeffMap
      (TopRep.resFunctor F.val.group.subtype |>.map (QuotCat.scalarHom T (Ideal.span {M'}) (Ideal.span {M}) 1 (by sorry))) 1).hom
      (derivativeClass E hA F M' n h' σ hσ c) = derivativeClass E hA F M n h σ hσ c ∧
    (TauCeti.ContinuousCohomology.coeffMap
      (TopRep.resFunctor F.val.group.subtype |>.map (QuotCat.scalarHom T (Ideal.span {M}) (Ideal.span {M'}) d (by sorry))) 1).hom
      (derivativeClass E hA F M n h σ hσ c) = d • derivativeClass E hA F M' n h' σ hσ c := sorry
lemma derivativeClass_cocycle (E : EulerFactors T A) (hA : IsAdmissibleTower T A)
    (F : FiniteLayer A) (M : R) (n : Conductor K) (h : DerivativeAdmissible E F M n)
    (σ : ∀ q : n, gammaPrime K A.p q) (hσ : ∀ (q : n) (g : gammaPrime K A.p q), g ∈ Subgroup.zpowers (σ q))
    (c : EulerSystem T E) (f : coinduced (quotientRep T (Ideal.span {M})))
    (hf : (inducedProjection (quotientRep T (Ideal.span {M})) (by sorry)).hom f = (differentiatedLift E hA F M n h σ hσ c).val)
    (z : Cocycle (quotientRep T (Ideal.span {M})) F.val.group)
    (hz : ∀ g, (coinducedEmbedding (quotientRep T (Ideal.span {M})) (by sorry)).hom (z.val g) = (coinduced _).ρ g.val f - f) :
    derivativeClass E hA F M n h σ hσ c = cocycleClass _ F.val z := sorry
lemma derivativeClass_linear (E : EulerFactors T A) (hA : IsAdmissibleTower T A)
    (F : FiniteLayer A) (M : R) (n : Conductor K) (h : DerivativeAdmissible E F M n)
    (σ : ∀ q : n, gammaPrime K A.p q) (hσ : ∀ (q : n) (g : gammaPrime K A.p q), g ∈ Subgroup.zpowers (σ q))
    (c c' : EulerSystem T E) (a : R) :
    derivativeClass E hA F M n h σ hσ (a • c + c') =
      a • derivativeClass E hA F M n h σ hσ c + derivativeClass E hA F M n h σ hσ c' := sorry
-- Three defining tests: conductor one, zero, and the restriction formula above.
-- Unit test: derivativeClass_zero
example (E : EulerFactors T A) (hA : IsAdmissibleTower T A) (F : FiniteLayer A)
    (M : R) (n : Conductor K) (h : DerivativeAdmissible E F M n)
    (σ : ∀ q : n, gammaPrime K A.p q) (hσ : ∀ (q : n) (g : gammaPrime K A.p q), g ∈ Subgroup.zpowers (σ q)) :
    derivativeClass E hA F M n h σ hσ 0 = 0 := sorry
-- Unit test: derivativeClass_delta_lift
example (T : Rep K R) (hT : IsContinuous K R T) (F : Layer K)
    (f : fixed (coinduced T) F.group) (x : fixed (coinducedQuotient T hT) F.group)
    (hx : x.val = (inducedProjection T hT).hom f.val) : delta T hT F x = 0 := sorry
-- Unit test: derivativeClass_conductor_one_nonzero
example (E : EulerFactors T A) (hA : IsAdmissibleTower T A) (F : FiniteLayer A)
    (M : R) (hM : M ≠ 0) (c : EulerSystem T E) (hc : c.val F ≠ 0)
    (hinj : Function.Injective (TauCeti.ContinuousCohomology.coeffMap
      (TopRep.resFunctor F.val.group.subtype |>.map (quotientMap T (Ideal.span {M}))) 1).hom) :
    derivativeClass E hA F M ∅ ⟨hM,by simp⟩ (by sorry) (by simp) c ≠ 0 := sorry
end TauCeti.KolyvaginSystems

namespace TauCeti.ErrorTolerant
open TauCeti.KolyvaginSystems
abbrev ErrorRep := TauCeti.KolyvaginSystems.Rep
variable {K O : Type} [Field K] [NumberField K] [CommRing O] [TopologicalSpace O]
variable [IsDomain O] [IsDiscreteValuationRing O]
variable (π : O) (hπ : IsLocalRing.maximalIdeal O = Ideal.span {π})
def expAt {M : Type} [AddCommGroup M] [Module O M] (x : M) : ℕ∞ :=
  ⨅ (d : ℕ) (_ : π^d • x = 0), (d : ℕ∞)
def ordAt {M : Type} [AddCommGroup M] [Module O M] (x : M) : ℕ∞ :=
  ⨆ (d : ℕ) (_ : x ∈ Ideal.span {π^d} • (⊤ : Submodule O M)), (d : ℕ∞)
/-- Use truncated order at a torsion level: zero has order n. -/
def truncatedOrdAt {M : Type} [AddCommGroup M] [Module O M] (n : ℕ) (x : M) : ℕ∞ :=
  min n (ordAt π x)
theorem expAt_add_ordAt_le {M : Type} [AddCommGroup M] [Module O M]
    (n r : ℕ) (e : M ≃ₗ[O] (Fin r → O ⧸ Ideal.span {π^n})) (x : M) :
    expAt π x + truncatedOrdAt π n x = n := sorry
variable {π hπ}
def equivariantEnd (T : ErrorRep K O) : Submodule O (Module.End O T) :=
  {carrier := {f | ∀ g, f.comp (T.ρ g).toLinearMap = (T.ρ g).toLinearMap.comp f},
    zero_mem' := sorry, add_mem' := sorry, smul_mem' := sorry }
def scalarEnd (T : ErrorRep K O) : Submodule O (equivariantEnd T) :=
  Submodule.span O {f | ∃ a : O, f.val = a • LinearMap.id}
def Stable (T : ErrorRep K O) (W : Submodule O T) : Prop :=
  ∀ g : GK K, ∀ x ∈ W, T.ρ g x ∈ W
def DepthBound (T : ErrorRep K O) (π : O) (d : ℕ) : Prop :=
  (∀ W : Submodule O T, Stable T W → ¬ W ≤ Ideal.span {π} • (⊤ : Submodule O T) →
    Ideal.span {π^d} • (⊤ : Submodule O T) ≤ W) ∧
  ∀ m : ℕ, 0 < m → ∀ f : equivariantEnd (quotientRep T (Ideal.span {π^m})),
    π^d • f ∈ scalarEnd (quotientRep T (Ideal.span {π^m}))
def reducibilityDepth (T : ErrorRep K O) (π : O) : ℕ∞ :=
  ⨅ (d : ℕ) (_ : DepthBound T π d), (d : ℕ∞)
theorem reducibilityDepth_eq_zero (T : ErrorRep K O) [Module.Finite O T]
    (π : O) (hπ : IsLocalRing.maximalIdeal O = Ideal.span {π})
    (h : ResiduallyAbsolutelyIrreducible T) : reducibilityDepth T π = 0 := sorry
/-- Rational absolute irreducibility is a statement about invariant subspaces after
extending Frac(O), not residual irreducibility. -/
def RationalAbsolutelyIrreducible (T : ErrorRep K O) : Prop :=
  Nontrivial T ∧ ∀ (E : Type) [Field E] [Algebra (FractionRing O) E] [Algebra O E]
    [IsScalarTower O (FractionRing O) E],
    ∀ W : Submodule E (E ⊗[O] T),
    (∀ g : GK K, ∀ x ∈ W, TensorProduct.map LinearMap.id (T.ρ g).toLinearMap x ∈ W) → W = ⊥ ∨ W = ⊤
theorem reducibilityDepth_bounded (T : ErrorRep K O) [Module.Free O T] [Module.Finite O T]
    (π : O) (hπ : IsLocalRing.maximalIdeal O = Ideal.span {π})
    (h : RationalAbsolutelyIrreducible T) :
    ∃ d : ℕ, ∀ m : ℕ, reducibilityDepth (quotientRep T (Ideal.span {π^m})) π ≤ d := sorry
-- Unit test: expAt_zero
example (π : O) : expAt π (0 : O) = 0 := sorry
-- Unit test: expAt_uniformizer_quotient
example (π : O) (hπ : IsLocalRing.maximalIdeal O = Ideal.span {π}) (n d : ℕ)
    (hd : d < n) : expAt π (Ideal.Quotient.mk (Ideal.span {π^n}) (π^d)) = n-d := sorry
-- Unit test: reducibilityDepth_stable_counterexample
example (T : ErrorRep K O) (π : O) (d : ℕ) (W : Submodule O T) (hW : Stable T W)
    (hprim : ¬ W ≤ Ideal.span {π} • (⊤ : Submodule O T))
    (hmiss : ¬ Ideal.span {π^d} • (⊤ : Submodule O T) ≤ W) : ¬ DepthBound T π d := sorry
/-- Restriction to the field cut out by the representation evaluates cocycles at its
absolute Galois group. Independence of the representative uses trivial action there. -/
def restrictionPairing (T : ErrorRep K O) : H K O T 1 →ₗ[O] ((representationKernel T) → T) := sorry
def globalCocycleClass (T : ErrorRep K O) : Cocycle T (⊤ : Subgroup (GK K)) → H K O T 1 := sorry
lemma restrictionPairing_cocycle (T : ErrorRep K O) (z : Cocycle T (⊤ : Subgroup (GK K)))
    (g : representationKernel T) : restrictionPairing T (globalCocycleClass T z) g =
      z.val ⟨g.val,by simp⟩ := sorry
/-- The Selmer-field subgroup is precisely the common kernel of the evaluations. -/
def selmerFieldGroup (T : ErrorRep K O) (S : Submodule O (H K O T 1)) : Subgroup (representationKernel T) := sorry
lemma mem_selmerFieldGroup (T : ErrorRep K O) (S : Submodule O (H K O T 1)) (g : representationKernel T) :
    g ∈ selmerFieldGroup T S ↔ ∀ s ∈ S, restrictionPairing T s g = 0 := sorry
instance selmerFieldNormal (T : ErrorRep K O) (S : Submodule O (H K O T 1)) : (selmerFieldGroup T S).Normal := sorry
abbrev SelmerGalois (T : ErrorRep K O) (S : Submodule O (H K O T 1)) :=
  representationKernel T ⧸ selmerFieldGroup T S
def theta (T : ErrorRep K O) (S : Submodule O (H K O T 1)) : SelmerGalois T S → (S →ₗ[O] T) := sorry
lemma theta_eval (T : ErrorRep K O) (S : Submodule O (H K O T 1))
    (g : representationKernel T) (s : S) : theta T S (QuotientGroup.mk g) s = restrictionPairing T s.val g := sorry
lemma theta_injective (T : ErrorRep K O) (S : Submodule O (H K O T 1)) : Function.Injective (theta T S) := sorry
def saturationLoss : ℕ → ℕ
  | 0 => 1 | 1 => 1 | 2 => 4 | n+3 => 2 * (saturationLoss (n+2)+1)
theorem selmer_field_saturation (T : ErrorRep K O) (π : O) (m r rT d : ℕ)
    (eT : T ≃ₗ[O] (Fin rT → O ⧸ Ideal.span {π^m}))
    (S : Submodule O (H K O T 1)) (eS : S ≃ₗ[O] (Fin r → O ⧸ Ideal.span {π^m}))
    (hinj : Function.Injective (restrictionPairing T)) (hDepth : DepthBound T π d) :
    Ideal.span {π^(saturationLoss r*d)} • (⊤ : Submodule O (S →ₗ[O] T)) ≤
      Submodule.span O (Set.range (theta T S)) := sorry
/-- The group N lies OVER the field cut out by T, not over K itself. -/
def normalKernel (T : ErrorRep K O) (E : Layer K) : Subgroup (Layer.Gal K E) :=
  (representationKernel T).map (QuotientGroup.mk' E.group)
/-- Arithmetic normal-closure input for LTXZZ §2.6. All dictionaries refer to
field actions or cocycle evaluations; no abundance conclusion is a field. -/
structure AbundanceData (T : ErrorRep K O) (S : Submodule O (H K O T 1)) where
  Fplus : Type
  [fieldPlus : Field Fplus]
  [numberFieldPlus : NumberField Fplus]
  [extension : Algebra Fplus K]
  [galoisBase : IsGalois Fplus K]
  degree : Module.finrank Fplus K = 1 ∨ Module.finrank Fplus K = 2
  plusLayer : Layer Fplus
  normalClosure : Layer K
  containsRepresentation : normalClosure.group ≤ representationKernel T
  containsSelmer : ∀ g : representationKernel T, g.val ∈ normalClosure.group → g ∈ selmerFieldGroup T S
  [normalAlgebra : Algebra Fplus normalClosure.field]
  [normalTower : IsScalarTower Fplus K normalClosure.field]
  [normalGalois : IsGalois Fplus normalClosure.field]
  normalOverPlus : Layer Fplus
  normalOverPlusEquiv : normalOverPlus.field ≃ₐ[Fplus] normalClosure.field
  alpha : MulAut (normalKernel T normalClosure)
  restriction : normalKernel T normalClosure →* SelmerGalois T S
  restriction_mk : ∀ g : representationKernel T,
    restriction ⟨QuotientGroup.mk g.val,by sorry⟩ = QuotientGroup.mk g
  h : GK K
  ell : ℕ
  prime : ell.Prime
  residueChar : CharP (IsLocalRing.ResidueField O) ell
  torsion : ∃ m rT, Nonempty (T ≃ₗ[O] (Fin rT → O ⧸ IsLocalRing.maximalIdeal O^m))
  gamma : Layer.Gal Fplus plusLayer
  primeOrder : Nat.Coprime (orderOf gamma) ell
  fieldEmbedding : plusLayer.field →ₐ[Fplus] normalClosure.field
  lift : normalClosure.field ≃ₐ[Fplus] normalClosure.field
  lift_restrict : ∀ x, lift (fieldEmbedding x) = fieldEmbedding (layerFieldAction plusLayer gamma x)
  conjugation : ∀ g, (layerFieldAction normalClosure (alpha g).val).restrictScalars Fplus =
    lift * (layerFieldAction normalClosure g.val).restrictScalars Fplus * lift⁻¹
  evaluation_action : ∀ g s, theta T S (restriction (alpha g)) s = T.ρ h (theta T S (restriction g) s)
attribute [instance] AbundanceData.fieldPlus AbundanceData.numberFieldPlus AbundanceData.extension
attribute [instance] AbundanceData.galoisBase AbundanceData.normalAlgebra AbundanceData.normalTower AbundanceData.normalGalois
def primeIdealAboveEmbedding {E E' : Type} [Field E] [NumberField E] [Field E'] [NumberField E']
    {F : Type} [Field F] [Algebra F E] [Algebra F E'] (i : E →ₐ[F] E') (w : Prime E) (v : Prime E') : Prop :=
  ∀ x : NumberField.RingOfIntegers E, x ∈ w.asIdeal ↔ ∀ y : NumberField.RingOfIntegers E',
    (y.val : E') = i x.val → y ∈ v.asIdeal
def IsUnramifiedSelmerField (T : ErrorRep K O) (S : Submodule O (H K O T 1))
    (E : Layer K) (v : Prime E.field) : Prop :=
  (inertia E.field (Sum.inr v)).map ((layerGalois E).comp (decomposition E.field (Sum.inr v)).subtype) ≤
    (selmerFieldGroup T S).map (representationKernel T).subtype
/-- Frobenius in the Selmer field, supplied by restriction of the actual arithmetic
Frobenius of the chosen place; changing the prime gives conjugation. -/
def selmerFrobenius (T : ErrorRep K O) (S : Submodule O (H K O T 1))
    (D : AbundanceData T S) (w : Prime D.plusLayer.field) : SelmerGalois T S := sorry
def gammaAssociated (T : ErrorRep K O) (S : Submodule O (H K O T 1))
    (D : AbundanceData T S) (w : Prime D.plusLayer.field) : Prop :=
  ¬ isAboveP D.ell w ∧ ∀ q : Prime D.Fplus, w ∈ primesAbove D.plusLayer q →
    IsUnramifiedLayer D.normalOverPlus q ∧ IsUnramifiedLayer D.plusLayer q ∧
      QuotientGroup.mk (frobenius D.Fplus q).val = D.gamma
def frobeniusSet (T : ErrorRep K O) (S : Submodule O (H K O T 1)) (D : AbundanceData T S) :
    Set (SelmerGalois T S) := {g | ∃ w : Prime D.plusLayer.field, gammaAssociated T S D w ∧ selmerFrobenius T S D w = g}
lemma frobeniusSet_eq_image (T : ErrorRep K O) (S : Submodule O (H K O T 1)) (D : AbundanceData T S) :
    frobeniusSet T S D = D.restriction '' {g | D.alpha g = g} := sorry
lemma frobeniusSet_subset_fixed (T : ErrorRep K O) (S : Submodule O (H K O T 1)) (D : AbundanceData T S)
    (g : SelmerGalois T S) (hg : g ∈ frobeniusSet T S D) :
    ∀ s : S, T.ρ D.h (theta T S g s) = theta T S g s := sorry
/-- Abundance is an image containment, not a basis or a determinant being a unit. -/
def abundanceMap (T : ErrorRep K O) (S : Submodule O (H K O T 1))
    {r : ℕ} (Ψ : Fin r → SelmerGalois T S) : S →ₗ[O] (Fin r → T) :=
  LinearMap.pi (fun i => theta T S (Ψ i))
def fixedAbundanceMap (T : ErrorRep K O) (S : Submodule O (H K O T 1))
    (D : AbundanceData T S) {r : ℕ} (Ψ : Fin r → SelmerGalois T S)
    (hΨ : ∀ i, Ψ i ∈ frobeniusSet T S D) : S →ₗ[O] (Fin r → fixed T (Subgroup.zpowers D.h)) := sorry
lemma fixedAbundanceMap_apply (T : ErrorRep K O) (S : Submodule O (H K O T 1))
    (D : AbundanceData T S) {r : ℕ} (Ψ : Fin r → SelmerGalois T S)
    (hΨ : ∀ i, Ψ i ∈ frobeniusSet T S D) (s : S) (i : Fin r) :
    (fixedAbundanceMap T S D Ψ hΨ s i).val = theta T S (Ψ i) s := sorry
def IsAbundant (T : ErrorRep K O) (S : Submodule O (H K O T 1)) (D : AbundanceData T S)
    (π : O) (m₀ r rT d : ℕ) (Ψ : Fin r → SelmerGalois T S) : Prop :=
  ∃ hΨ : ∀ i, Ψ i ∈ frobeniusSet T S D,
    Ideal.span {π^(m₀+saturationLoss r*d)} •
      (⊤ : Submodule O (Fin r → fixed T (Subgroup.zpowers D.h))) ≤
        LinearMap.range (fixedAbundanceMap T S D Ψ hΨ)
theorem exists_isAbundant (T : ErrorRep K O) (S : Submodule O (H K O T 1)) (D : AbundanceData T S)
    (π : O) (m m₀ r rT d : ℕ)
    (hS : Nonempty (S ≃ₗ[O] (Fin r → O ⧸ Ideal.span {π^(m-m₀)})))
    (hRes : Function.Injective (restrictionPairing T)) (hDepth : DepthBound T π d)
    (hFixed : Nonempty (fixed T (Subgroup.zpowers D.h) ≃ₗ[O] O ⧸ Ideal.span {π^m}))
    (hsurj : ∀ g : SelmerGalois T S, (∀ s : S, T.ρ D.h (theta T S g s) = theta T S g s) →
      ∃ a : normalKernel T D.normalClosure, D.alpha a = a ∧ D.restriction a = g) :
    ∃ Ψ : Fin r → SelmerGalois T S, IsAbundant T S D π m₀ r rT d Ψ := sorry
/-- The finite-ring inverse is scaled. A unit inverse is unavailable at positive loss. -/
theorem scaled_inverse (π : O) (n r c : ℕ) (A : Matrix (Fin r) (Fin r) (O ⧸ Ideal.span {π^n}))
    (h : Ideal.span {(Ideal.Quotient.mk (Ideal.span {π^n}) π)^c} • (⊤ : Submodule (O ⧸ Ideal.span {π^n}) (Fin r → O ⧸ Ideal.span {π^n})) ≤
      LinearMap.range A.mulVecLin) :
    ∃ C : Matrix (Fin r) (Fin r) (O ⧸ Ideal.span {π^n}),
      A*C = ((Ideal.Quotient.mk (Ideal.span {π^n}) π)^c) • (1 : Matrix (Fin r) (Fin r) (O ⧸ Ideal.span {π^n})) ∧
      C*A = ((Ideal.Quotient.mk (Ideal.span {π^n}) π)^c) • (1 : Matrix (Fin r) (Fin r) (O ⧸ Ideal.span {π^n})) ∧
      Ideal.span {(Ideal.Quotient.mk (Ideal.span {π^n}) π)^c} • (⊤ : Submodule (O ⧸ Ideal.span {π^n}) (Fin r → O ⧸ Ideal.span {π^n})) ≤ LinearMap.range C.mulVecLin := sorry
example (π : O) (n r c : ℕ) (hcn : n ≤ c) :
    (0 : Matrix (Fin r) (Fin r) (O ⧸ Ideal.span {π^n})) * 0 =
      (Ideal.Quotient.mk (Ideal.span {π^n}) π)^c • (1 : Matrix (Fin r) (Fin r) (O ⧸ Ideal.span {π^n})) := sorry
example : ¬ Function.Bijective ((fun x : ZMod 25 => (5 : ZMod 25)*x)) := sorry
example (π : O) (n r : ℕ) (A : Matrix (Fin r) (Fin r) (O ⧸ Ideal.span {π^n}))
    (h : LinearMap.range A.mulVecLin = ⊤) : IsUnit A.det := sorry
end TauCeti.ErrorTolerant

namespace TauCeti.KolyvaginSystems
variable {K R : Type} [Field K] [NumberField K] [CommRing R] [TopologicalSpace R]
lemma isCartesian_iff_comap (T : Rep K R) (v : Place K) (L : Submodule R (LocalH K R T v 1)) :
    IsCartesian T v L ↔ ∀ (I J : Ideal R) (r : R) (hr : ∀ a ∈ I, r*a ∈ J),
      Function.Injective (QuotCat.scalarHom T I J r hr).hom →
      propagated T v L I = (propagated T v L J).comap
        (TauCeti.ContinuousCohomology.coeffMap
          (TopRep.resFunctor (decomposition K v).subtype |>.map (QuotCat.scalarHom T I J r hr)) 1).hom.toLinearMap := sorry
lemma isCartesian_of_torsionFree_quotient (T : Rep K R) [IsDomain R] [IsDiscreteValuationRing R]
    (v : Place K) (L : Submodule R (LocalH K R T v 1))
    (h0 : NoResidualInvariants T (IsLocalRing.maximalIdeal R))
    (h : Module.IsTorsionFree R (LocalH K R T v 1 ⧸ L)) : IsCartesian T v L := sorry
/-- I-torsion is an actual submodule, available for finite and discrete duals alike. -/
def torsionBy (I : Ideal R) (M : Type) [AddCommGroup M] [Module R M] : Submodule R M :=
  { carrier := {x | ∀ a ∈ I, a • x = 0}, zero_mem' := sorry, add_mem' := sorry, smul_mem' := sorry }
def dualQuotientEquiv (T : Rep K R) (I : Ideal R) :
    dualRep (quotientRep T I) ≃ₗ[R] torsionBy I (dualRep T) := sorry
/-- Precomposition by T→T/IT is the actual Cartier-dual injection. -/
def dualQuotientInjection (T : Rep K R) (I : Ideal R) : dualRep (quotientRep T I) ⟶ dualRep T := sorry
lemma dualQuotientInjection_apply (T : Rep K R) (I : Ideal R)
    (φ : dualRep (quotientRep T I)) (t : T) :
    dualEquiv T ((dualQuotientInjection T I).hom φ) t =
      dualEquiv (quotientRep T I) φ ((quotientMap T I).hom t) := sorry
lemma quotient_dual_propagation (T : Rep K R) (v : Place K)
    (L : Submodule R (LocalH K R T v 1)) (I : Ideal R) :
    orthogonal (quotientRep T I) v (propagated T v L I) =
      (orthogonal T v L).comap
        (TauCeti.ContinuousCohomology.coeffMap
          (TopRep.resFunctor (decomposition K v).subtype |>.map (dualQuotientInjection T I)) 1).hom.toLinearMap := sorry
def dualSelmerTorsionEquiv (T : Rep K R) (F : SelmerStructure K R T) (I : Ideal R) [IsLocalRing R]
    (h0 : NoResidualInvariants T (IsLocalRing.maximalIdeal R)) :
    (dualStructure (quotientRep T I) (propagatedStructure T F I)).selmer ≃ₗ[R]
      torsionBy I (dualStructure T F).selmer := sorry
/-- MR04 Lemma 2.2.5: local lengths are linear in the quotient length. -/
theorem cartesian_length_linearity (T : Rep K R) [Module.Free R T] [Module.Finite R T]
    [IsArtinianRing R] [IsLocalRing R] [IsPrincipalIdealRing R]
    (v : Place K) (L : Submodule R (LocalH K R T v 1)) (hL : IsCartesian T v L) :
    ∃ a : ℤ, ∀ i : ℕ, 0 < i → i ≤ len R R →
      (len R (LocalH K R (quotientRep T (IsLocalRing.maximalIdeal R ^ i)) v 0) : ℤ) -
        len R (propagated T v L (IsLocalRing.maximalIdeal R ^ i)) = a*i := sorry
theorem selmer_torsion_identification (T : Rep K R) [Module.Free R T] [Module.Finite R T]
    [IsArtinianRing R] [IsLocalRing R] [IsPrincipalIdealRing R]
    (F : SelmerStructure K R T) (hF : IsCartesianStructure T F)
    (h0 : NoResidualInvariants T (IsLocalRing.maximalIdeal R)) (i : ℕ)
    (hi : 0 < i) (hik : i ≤ len R R) :
    Nonempty ((propagatedStructure T F (IsLocalRing.maximalIdeal R ^ i)).selmer ≃ₗ[R]
      torsionBy (IsLocalRing.maximalIdeal R ^ i) F.selmer) := sorry
/-- The quotient is considered over its reduced ring, never asserted R-free. -/
def reducedStructure (T : Rep K R) (F : SelmerStructure K R T) (I : Ideal R)
    : SelmerStructure K (R ⧸ I) (reducedRep T I) := sorry
theorem coreRank_independence_of_modulus (T : Rep K R) [Module.Free R T] [Module.Finite R T]
    [IsArtinianRing R] [IsLocalRing R] [IsPrincipalIdealRing R]
    (F : SelmerStructure K R T) (hF : IsCartesianStructure T F)
    (h0 : NoResidualInvariants T (IsLocalRing.maximalIdeal R)) (i : ℕ)
    (hi : 0 < i) (hik : i ≤ len R R)
    :
    coreRankInt (reducedRep T (IsLocalRing.maximalIdeal R ^ i))
      (reducedStructure T F _) = coreRankInt T F := sorry
/-- Unramified rational local conditions are pulled back to the lattice at every place. -/
def unramifiedStructure (T : Rep K R) [IsDomain R] (sigma : Finset (Place K))
    (hbad : ∀ v ∉ sigma, IsUnramified K R T v) : SelmerStructure K R T := sorry
lemma unramifiedStructure_condition (T : Rep K R) [IsDomain R] (sigma : Finset (Place K))
    (hbad : ∀ v ∉ sigma, IsUnramified K R T v) (v : Place K) :
    (unramifiedStructure T sigma hbad).condition v = finiteLatticeCondition T v := sorry
lemma unramifiedStructure_eq_canonical_empty (T : Rep K R) [IsDomain R] (sigma : Finset (Place K))
    (hbad : ∀ v ∉ sigma, IsUnramified K R T v) :
    unramifiedStructure T sigma hbad = canonicalStructure T sigma ∅ hbad (by simp) := sorry
/-- MR16 §3: equality with the relaxed p-adic canonical condition needs
vanishing of rational dual H⁰ at the relaxed places. Finite lattice-dual invariants
imply this vanishing; mere unramifiedness does not. -/
lemma unramifiedStructure_eq_canonical (T : Rep K R) [IsDomain R]
    [IsDiscreteValuationRing R] [Module.Free R T] [Module.Finite R T]
    (sigma : Finset (Place K)) (atP : Set (Place K))
    (hbad : ∀ v ∉ sigma, IsUnramified K R T v) (hP : atP ⊆ (sigma : Set (Place K)))
    (hdual : ∀ v ∈ atP, Finite (LocalH K R (dualRep T) v 0)) :
    unramifiedStructure T sigma hbad = canonicalStructure T sigma atP hbad hP := sorry
lemma canonicalStructure_quotient_at_p (T : Rep K R) [IsDomain R]
    (sigma : Finset (Place K)) (atP : Set (Place K))
    (hbad : ∀ v ∉ sigma, IsUnramified K R T v) (hP : atP ⊆ (sigma : Set (Place K)))
    (I : Ideal R) (v : Place K) (hv : v ∈ atP) :
    (propagatedStructure T (canonicalStructure T sigma atP hbad hP) I).condition v =
      LinearMap.range (TauCeti.ContinuousCohomology.coeffMap
        (TopRep.resFunctor (decomposition K v).subtype |>.map (quotientMap T I)) 1).hom.toLinearMap := sorry
-- Unit test: canonicalStructure_unramified_place
example (T : Rep K R) [IsDomain R] (sigma : Finset (Place K))
    (hbad : ∀ v ∉ sigma, IsUnramified K R T v) (q : Prime K) (hq : Sum.inr q ∉ sigma) :
    (unramifiedStructure T sigma hbad).condition (Sum.inr q) = unramified K R T (Sum.inr q) := sorry
-- Unit test: canonicalStructure_relaxed_lattice
example (T : Rep K R) [IsDomain R] (sigma : Finset (Place K)) (atP : Set (Place K))
    (hbad : ∀ v ∉ sigma, IsUnramified K R T v) (hP : atP ⊆ (sigma : Set (Place K)))
    (v : Place K) (hv : v ∈ atP) : (canonicalStructure T sigma atP hbad hP).condition v = ⊤ := sorry
-- Unit test: canonicalStructure_quotient_ne_relaxed
example (T : Rep K R) [IsDomain R] (sigma : Finset (Place K)) (atP : Set (Place K))
    (hbad : ∀ v ∉ sigma, IsUnramified K R T v) (hP : atP ⊆ (sigma : Set (Place K)))
    (I : Ideal R) (v : Place K) (hv : v ∈ atP)
    (hproper : ¬ Function.Surjective (TauCeti.ContinuousCohomology.coeffMap
      (TopRep.resFunctor (decomposition K v).subtype |>.map (quotientMap T I)) 1).hom) :
    (propagatedStructure T (canonicalStructure T sigma atP hbad hP) I).condition v ≠ ⊤ := sorry
-- Core-rank tests distinguish the signed rank from its nonnegative part.
-- Unit test: coreRank_negative_signed
example (T : Rep K R) (F : SelmerStructure K R T) (h : coreRankInt T F = -2) : coreRank T F = 0 := sorry
-- Unit test: coreRank_positive_signed
example (T : Rep K R) (F : SelmerStructure K R T) (h : coreRankInt T F = 3) : coreRank T F = 3 := sorry
-- Unit test: coreRank_length_quotient
example (T : Rep K R) (F : SelmerStructure K R T) [IsLocalRing R]
    (hT : NoResidualInvariants T (IsLocalRing.maximalIdeal R))
    (hs : len R F.selmer = 5) (hd : len R (dualStructure T F).selmer = 3) (hR : len R R = 2) :
    coreRankInt T F = 1 := sorry
end TauCeti.KolyvaginSystems

namespace TauCeti.KolyvaginSystems.SelfDual
open TauCeti.KolyvaginSystems
variable {K R : Type} [Field K] [NumberField K] [CommRing R] [TopologicalSpace R] [IsLocalRing R]
/-- The quadratic field and complex conjugation are arithmetic input from LocalGaloisGroups. -/
structure ImaginaryQuadraticData (K : Type) [Field K] [NumberField K] where
  rational : Algebra ℚ K
  degree : letI := rational; Module.finrank ℚ K = 2
  imaginary : ∀ v : NumberField.InfinitePlace K, ¬ v.IsReal
  restriction : GK K →* GK ℚ
  conjugation : MulAut (GK K)
  involution : ∀ g, conjugation (conjugation g) = g
  conjugatePlace : Place K → Place K
  place_involution : ∀ v, conjugatePlace (conjugatePlace v) = v
/-- Pairing data are actual bilinear maps with symmetry, perfectness and the conjugate
Galois-equivariance formula. The Tate twist on the target is supplied as a character. -/
structure PairingData (T : Rep K R) (F : SelmerStructure K R T) (D : ImaginaryQuadraticData K) where
  cyclotomic : GK K →* Rˣ
  pairing : T →ₗ[R] T →ₗ[R] R
  symmetric : ∀ s t, pairing s t = pairing t s
  perfect : Function.Bijective pairing
  equivariant : ∀ g s t, pairing (T.ρ g s) (T.ρ (D.conjugation g) t) = (cyclotomic g : R) * pairing s t
  localPairing : ∀ v, LocalH K R T v 1 →ₗ[R] LocalH K R T (D.conjugatePlace v) 1 →ₗ[R] R
  orthogonal : ∀ v, F.condition v =
    { carrier := {x | ∀ y ∈ F.condition (D.conjugatePlace v), localPairing v x y = 0},
      zero_mem' := sorry, add_mem' := sorry, smul_mem' := sorry }
local instance residueTopologySD : TopologicalSpace (IsLocalRing.ResidueField R) := ⊥
/-- Howard H.0–H.5. The splitting field and residual extension are actual representations. -/
structure Hypotheses (T : Rep K R) (S : SelmerTriple K R T) (p : ℕ) where
  quadratic : ImaginaryQuadraticData K
  prime : p.Prime
  odd : 2 < p
  residueChar : CharP (IsLocalRing.ResidueField R) p
  residueFinite : Finite (IsLocalRing.ResidueField R)
  noetherian : IsNoetherianRing R
  complete : IsAdicComplete (IsLocalRing.maximalIdeal R) R
  rankTwo : Nonempty (T ≃ₗ[R] (Fin 2 → R))
  irreducible : ResiduallyAbsolutelyIrreducible T
  splitting : Subgroup (GK K)
  normal : splitting.Normal
  trivialAction : splitting ≤ representationKernel T
  noH1 : Subsingleton (continuousCohomology 1 (descentRep
    (quotientRep T (IsLocalRing.maximalIdeal R)) (splitting ⊓ rootsGroup p none) (by let _ := normal; sorry)))
  cartesian : IsCartesianStructure T S.F
  pairing : PairingData T S.F quadratic
  residualOverQ : TopRep.{0} (IsLocalRing.ResidueField R) (GK ℚ)
  restrictionEquiv : residualRep T ≃ₗ[IsLocalRing.ResidueField R] residualOverQ
  restriction_action : ∀ g t, restrictionEquiv ((residualRep T).ρ g t) =
    residualOverQ.ρ (quadratic.restriction g) (restrictionEquiv t)
  tau : GK ℚ
  tauSquare : tau^2 = 1
  eigenspaces : ∀ a : IsLocalRing.ResidueField R, a=1 ∨ a=-1 →
    Module.finrank (IsLocalRing.ResidueField R)
      (LinearMap.ker ((residualOverQ.ρ tau).toLinearMap - a • LinearMap.id)) = 1
  conjugateLocal : ∀ v, LocalH K R (quotientRep T (IsLocalRing.maximalIdeal R)) v 1 ≃ₗ[R]
    LocalH K R (quotientRep T (IsLocalRing.maximalIdeal R)) (quadratic.conjugatePlace v) 1
  residualStable : ∀ v, ((propagatedStructure T S.F (IsLocalRing.maximalIdeal R)).condition v).map
    (conjugateLocal v).toLinearMap =
      (propagatedStructure T S.F (IsLocalRing.maximalIdeal R)).condition (quadratic.conjugatePlace v)
-- Inert prime conditions use ell+1 and Frob at the prime above ell, not ell-1.
def IsInertPrime (D : ImaginaryQuadraticData K) (ell : ℕ) (q : Prime K) : Prop :=
  ell.Prime ∧ primeNorm K q = ell^2 ∧ ∀ x : ℤ, x ∈ q.asIdeal.comap (algebraMap ℤ (NumberField.RingOfIntegers K)) ↔ (ell : ℤ) ∣ x

def inertIdeal (T : Rep K R) (ell : ℕ) (q : Prime K) : Ideal R :=
  Ideal.span {(ell+1 : R)} ⊔ ⨅ (I : Ideal R) (_ : LinearMap.range (frobEnd T q - LinearMap.id) ≤ I • (⊤ : Submodule R T)), I
def inertPrimes (T : Rep K R) (S : SelmerTriple K R T) (D : ImaginaryQuadraticData K) (p k : ℕ) : Set (Prime K) :=
  {q | Sum.inr q ∉ S.F.sigma ∧ ∃ ell : ℕ, IsInertPrime D ell q ∧ ell ≠ p ∧
    inertIdeal T ell q ≤ Ideal.span {(p : R)^k}}
lemma inertIdeal_contains (T : Rep K R) (ell : ℕ) (q : Prime K) : (ell+1 : R) ∈ inertIdeal T ell q := sorry
lemma inertPrimes_antitone (T : Rep K R) (S : SelmerTriple K R T) (D : ImaginaryQuadraticData K)
    (p k j : ℕ) (h : k ≤ j) : inertPrimes T S D p j ⊆ inertPrimes T S D p k := sorry
/-- Howard's tame group is kλ×/kℓ×. This is a different carrier and comparison
from the rank-one-coinvariant Mazur–Rubin polynomial construction. -/
def rationalResidueMap (D : ImaginaryQuadraticData K) (ell : ℕ) (q : Prime K)
    (h : IsInertPrime D ell q) : ZMod ell →+* (NumberField.RingOfIntegers K ⧸ q.asIdeal) := sorry
lemma rationalResidueMap_int (D : ImaginaryQuadraticData K) (ell : ℕ) (q : Prime K)
    (h : IsInertPrime D ell q) (a : ℤ) : rationalResidueMap D ell q h a =
      Ideal.Quotient.mk q.asIdeal (algebraMap ℤ (NumberField.RingOfIntegers K) a) := sorry
def InertResidueGroup (D : ImaginaryQuadraticData K) (ell : ℕ) (q : Prime K)
    (h : IsInertPrime D ell q) :=
  ((NumberField.RingOfIntegers K ⧸ q.asIdeal)ˣ) ⧸
    (Units.map (rationalResidueMap D ell q h).toMonoidHom).range
instance inertResidueGroup (D : ImaginaryQuadraticData K) (ell : ℕ) (q : Prime K)
    (h : IsInertPrime D ell q) : Group (InertResidueGroup D ell q h) :=
  inferInstanceAs (Group (((NumberField.RingOfIntegers K ⧸ q.asIdeal)ˣ) ⧸
    (Units.map (rationalResidueMap D ell q h).toMonoidHom).range))
instance inertResidueComm (D : ImaginaryQuadraticData K) (ell : ℕ) (q : Prime K)
    (h : IsInertPrime D ell q) : CommGroup (InertResidueGroup D ell q h) :=
  {__ := inertResidueGroup D ell q h, mul_comm := sorry}
instance inertResidueFinite (D : ImaginaryQuadraticData K) (ell : ℕ) (q : Prime K)
    (h : IsInertPrime D ell q) : Fintype (InertResidueGroup D ell q h) := sorry
lemma inertResidue_card (D : ImaginaryQuadraticData K) (ell : ℕ) (q : Prime K)
    (h : IsInertPrime D ell q) : Fintype.card (InertResidueGroup D ell q h) = ell+1 := sorry
structure InertPrimeData (T : Rep K R) (D : ImaginaryQuadraticData K) (p : ℕ) (q : Prime K) where
  ell : ℕ
  inert : IsInertPrime D ell q
  notP : ell ≠ p
  unramified : IsUnramified K R T (Sum.inr q)
abbrev InertPrimeData.tame {T : Rep K R} {D : ImaginaryQuadraticData K} {p : ℕ} {q : Prime K}
    (U : InertPrimeData T D p q) := Additive (InertResidueGroup D U.ell q U.inert)
/-- The maximal p-subextension of the local ring-class field, supplied by HE.0/ring-class-tower-quotients and CFT Layer 13.
Its local extension is retained, so the transverse condition is a restriction kernel. -/
structure InertLocalData (T : Rep K R) (D : ImaginaryQuadraticData K) (p : ℕ) (q : Prime K)
    (U : InertPrimeData T D p q) where
  extension : Subgroup (decomposition K (Sum.inr q))
  normal : extension.Normal
  finiteIndex : extension.FiniteIndex
  open_extension : IsOpen (extension : Set (decomposition K (Sum.inr q)))
  localTrivial : ∀ g : decomposition K (Sum.inr q), ∀ t : T, T.ρ g.val t = t
  killed : ∀ t : T, (U.ell+1 : R) • t = 0
  totalRamification : ∀ g : decomposition K (Sum.inr q), ∃ i : inertia K (Sum.inr q),
    ∃ h : extension, g = i.val*h.val
  reciprocity : Nonempty ((decomposition K (Sum.inr q) ⧸ extension) ≃*
    CommGroup.primaryComponent (InertResidueGroup D U.ell q U.inert) p)
attribute [instance] InertLocalData.normal InertLocalData.finiteIndex
def inertTransverse (T : Rep K R) {D : ImaginaryQuadraticData K} {p : ℕ} {q : Prime K}
    {U : InertPrimeData T D p q} (L : InertLocalData T D p q U) :
    Submodule R (LocalH K R T (Sum.inr q) 1) :=
  LinearMap.ker (TauCeti.ContinuousCohomology.res L.extension (localRep K R T (Sum.inr q)) 1).hom.toLinearMap
/-- Howard Definition 1.1.8: evaluation at Frobenius and the Artin symbol identifies
both local sides with T, even when T has rank two. No Q(Fr⁻¹) factor is used. -/
def inertFiniteSingular (T : Rep K R) {D : ImaginaryQuadraticData K} {p : ℕ} {q : Prime K}
    {U : InertPrimeData T D p q} (L : InertLocalData T D p q U) :
    unramified K R T (Sum.inr q) ≃ₗ[R] (singular T q ⊗[ℤ] U.tame) := sorry
def inertFiniteEvaluation (T : Rep K R) {D : ImaginaryQuadraticData K} {p : ℕ} {q : Prime K}
    {U : InertPrimeData T D p q} (L : InertLocalData T D p q U) :
    unramified K R T (Sum.inr q) ≃ₗ[R] T := sorry
def inertSingularEvaluation (T : Rep K R) {D : ImaginaryQuadraticData K} {p : ℕ} {q : Prime K}
    {U : InertPrimeData T D p q} (L : InertLocalData T D p q U) :
    (singular T q ⊗[ℤ] U.tame) ≃ₗ[R] T := sorry
lemma inertFiniteSingular_evaluation (T : Rep K R) {D : ImaginaryQuadraticData K} {p : ℕ} {q : Prime K}
    {U : InertPrimeData T D p q} (L : InertLocalData T D p q U)
    (x : unramified K R T (Sum.inr q)) :
    inertSingularEvaluation T L (inertFiniteSingular T L x) = inertFiniteEvaluation T L x := sorry
structure InertData (T : Rep K R) [Module.Free R T] [Module.Finite R T]
    (S : SelmerTriple K R T) (p : ℕ) where
  quadratic : ImaginaryQuadraticData K
  primes : ∀ q : S.primes, InertPrimeData T quadratic p q.val
  locals : ∀ (n : Vertices S) (q : n.val),
    let U := primes ⟨q.val,n.property q.val q.property⟩
    InertLocalData (quotientRep T (⨆ q' ∈ n.val,
      inertIdeal T (primes ⟨q',n.property q' (by assumption)⟩).ell q')) quadratic p q.val
      {ell := U.ell, inert := U.inert, notP := U.notP, unramified := sorry}
variable {T : Rep K R} [Module.Free R T] [Module.Finite R T] {S : SelmerTriple K R T} {p : ℕ}
def inertConductorIdeal (D : InertData T S p) (n : Vertices S) : Ideal R :=
  ⨆ (q : Prime K) (hq : q ∈ n.val), inertIdeal T (D.primes ⟨q,n.property q hq⟩).ell q
abbrev InertTameGroup (D : InertData T S p) (n : Vertices S) :=
  PiTensorProduct ℤ (fun q : n.val => (D.primes ⟨q.val,n.property q.val q.property⟩).tame)
def modified (D : InertData T S p) (n : Vertices S) :
    SelmerStructure K R (quotientRep T (inertConductorIdeal D n)) := sorry
lemma modified_condition (D : InertData T S p) (n : Vertices S) (q : Prime K) :
    (modified D n).condition (Sum.inr q) = if hq : q ∈ n.val then
      inertTransverse _ (D.locals n ⟨q,hq⟩)
    else (propagatedStructure T S.F (inertConductorIdeal D n)).condition (Sum.inr q) := sorry
abbrev InertStalk (D : InertData T S p) (n : Vertices S) := (modified D n).selmer ⊗[ℤ] InertTameGroup D n
abbrev InertEdge (D : InertData T S p) (n : Vertices S) (q : Prime K) (hq : q ∈ S.primes) :=
  singular (quotientRep T (inertConductorIdeal D (vertexInsert S n q hq))) q ⊗[ℤ]
    InertTameGroup D (vertexInsert S n q hq)
def inertUpper (D : InertData T S p) (n : Vertices S) (q : Prime K) (hq : q ∈ S.primes) (hqn : q ∉ n.val) :
    InertStalk D (vertexInsert S n q hq) →ₗ[R] InertEdge D n q hq := sorry
def inertLower (D : InertData T S p) (n : Vertices S) (q : Prime K) (hq : q ∈ S.primes) (hqn : q ∉ n.val) :
    InertStalk D n →ₗ[R] InertEdge D n q hq := sorry
/-- The lower map is coefficient reduction, finite localization and the evaluation
comparison above. The upper map is singular localization; both retain the tame tensor. -/
def KolyvaginSystem (D : InertData T S p) : Submodule R (∀ n : Vertices S, InertStalk D n) :=
  {carrier := {κ | ∀ n q hq hqn, inertUpper D n q hq hqn (κ (vertexInsert S n q hq)) =
      inertLower D n q hq hqn (κ n)}, zero_mem' := sorry, add_mem' := sorry, smul_mem' := sorry}
def stalkOne (D : InertData T S p) : InertStalk D (initialVertex S) ≃ₗ[R] S.F.selmer := sorry
def AtLevel (D : InertData T S p) : Prop := ∀ n : Vertices S, inertConductorIdeal D n = ⊥
-- Unit test: SelfDual.conductorIdeal_one
example (D : InertData T S p) : inertConductorIdeal D (initialVertex S) = ⊥ := sorry
-- Unit test: SelfDual.tame_group_inert
example (D : ImaginaryQuadraticData K) (ell : ℕ) (q : Prime K) (h : IsInertPrime D ell q) :
    Fintype.card (InertResidueGroup D ell q h) = ell+1 := sorry
example (D : InertData T S p) (n : Vertices S) (q : Prime K) (hq : q ∈ S.primes) (hqn : q ∉ n.val)
    (κ : ∀ n : Vertices S, InertStalk D n)
    (hu : inertUpper D n q hq hqn (κ (vertexInsert S n q hq)) = 0)
    (hl : inertLower D n q hq hqn (κ n) ≠ 0) : κ ∉ KolyvaginSystem D := sorry

/-- Weak Cassels hypotheses omit residual irreducibility and the H.2 splitting condition. -/
structure WeakHypotheses (T : Rep K R) (F : SelmerStructure K R T) where
  quadratic : ImaginaryQuadraticData K
  rankTwo : Nonempty (T ≃ₗ[R] (Fin 2 → R))
  cartesian : IsCartesianStructure T F
  invariants : NoResidualInvariants T (IsLocalRing.maximalIdeal R)
  pairing : PairingData T F quadratic
/-- The finite module M is explicitly finite-length. ε is zero or one. -/
theorem weak_cassels_structure (T : Rep K R) [Module.Free R T] [Module.Finite R T]
    [IsArtinianRing R] [IsPrincipalIdealRing R] (F : SelmerStructure K R T)
    (h : WeakHypotheses T F) (h2 : IsUnit (2 : R)) :
    ∃ (ε : ℕ) (_ : ε ≤ 1) (M : Type) (_ : AddCommGroup M) (_ : Module R M),
      Module.length R M ≠ ⊤ ∧ Nonempty (F.selmer ≃ₗ[R] ((Fin ε → R) × M × M)) := sorry
theorem cassels_structure (T : Rep K R) [Module.Free R T] [Module.Finite R T]
    [IsArtinianRing R] [IsPrincipalIdealRing R] (S : SelmerTriple K R T) (p : ℕ)
    (h : Hypotheses T S p) :
    ∃ (ε : ℕ) (_ : ε ≤ 1) (M : Type) (_ : AddCommGroup M) (_ : Module R M),
      Module.length R M ≠ ⊤ ∧ Nonempty (S.F.selmer ≃ₗ[R] ((Fin ε → R) × M × M)) := sorry
/-- Howard's self-dual stub uses one half of the torsion, not the full dual length. -/
def howardStub (T : Rep K R) (F : SelmerStructure K R T) (M : Type) [AddCommGroup M] [Module R M] : Submodule R F.selmer :=
  IsLocalRing.maximalIdeal R ^ len R M • (⊤ : Submodule R F.selmer)
theorem howard_stub_propagation (T : Rep K R) [Module.Free R T] [Module.Finite R T]
    [IsArtinianRing R] [IsPrincipalIdealRing R] {S : SelmerTriple K R T} {p : ℕ}
    (h : Hypotheses T S p) (D : InertData T S p) (hP : AtLevel D)
    (n : Vertices S) (q : Prime K) (hq : q ∈ S.primes) (hqn : q ∉ n.val)
    (M N : Type) [AddCommGroup M] [Module R M] [AddCommGroup N] [Module R N]
    (e : (modified D n).selmer ≃ₗ[R] (R × M × M))
    (e' : (modified D (vertexInsert S n q hq)).selmer ≃ₗ[R] (R × N × N))
    (hloc : ∀ x ∈ howardStub _ (modified D n) M, loc K R _ (Sum.inr q) x.val = 0) :
    ∀ x ∈ howardStub _ (modified D (vertexInsert S n q hq)) N,
      loc K R _ (Sum.inr q) x.val = 0 := sorry
-- L2 lattice-to-discrete adapter: V/T with its inherited Galois action.
def discreteRep (T : Rep K R) [IsDomain R] : Rep K R := sorry
def discreteEquiv (T : Rep K R) [IsDomain R] : discreteRep T ≃ₗ[R]
    (rationalRep T ⧸ LinearMap.range (rationalMap T).hom.toLinearMap) := sorry
def discreteStructure (T : Rep K R) [IsDomain R] (F : SelmerStructure K R T) :
    SelmerStructure K R (discreteRep T) := sorry
theorem howard_dvr_theorem (T : Rep K R) [Module.Free R T] [Module.Finite R T]
    [IsDomain R] [IsDiscreteValuationRing R] {S : SelmerTriple K R T} {p : ℕ}
    (h : Hypotheses T S p) (D : InertData T S p)
    (hP : ∃ s, inertPrimes T S h.quadratic p s ⊆ S.primes)
    (κ : KolyvaginSystem D) (hκ : κ.val (initialVertex S) ≠ 0) :
    Module.Free R S.F.selmer ∧ Module.finrank R S.F.selmer = 1 ∧
    ∃ (M : Type) (_ : AddCommGroup M) (_ : Module R M), Module.length R M ≠ ⊤ ∧
      Nonempty ((discreteStructure T S.F).selmer ≃ₗ[R]
        ((FractionRing R ⧸ LinearMap.range (Algebra.linearMap R (FractionRing R))) × M × M)) ∧
      Module.length R M ≤ Module.length R (S.F.selmer ⧸ Submodule.span R {(stalkOne D) (κ.val (initialVertex S))}) := sorry
example (T : Rep K R) (S : SelmerTriple K R T) (p : ℕ) (h : Hypotheses T S p) : 2 < p := sorry
example (T : Rep K R) (F : SelmerStructure K R T) (h : WeakHypotheses T F)
    (hnonzero : Nontrivial (H K R (quotientRep T (IsLocalRing.maximalIdeal R)) 0)) : False := sorry
-- Unit test: SelfDual.conductorIdeal_inert
example (T : Rep K R) (S : SelmerTriple K R T) (D : ImaginaryQuadraticData K) (p k : ℕ)
    (q : Prime K) (ell : ℕ) (h : q ∈ inertPrimes T S D p k)
    (hq : IsInertPrime D ell q) : (ell+1 : R) ∈ Ideal.span {(p : R)^k} := sorry
end TauCeti.KolyvaginSystems.SelfDual

namespace TauCeti.EulerSystems
open TauCeti.KolyvaginSystems
variable {K O : Type} [Field K] [NumberField K] [CommRing O] [TopologicalSpace O]
variable [IsDomain O] [IsDiscreteValuationRing O]
variable {T : GaloisRep K O} [Module.Free O T] [Module.Finite O T] {A : Tower T}
def pHilbertGroup (p : ℕ) : Subgroup (GK K) := (rayLayer K p ∅).group
def rubinHM (p : ℕ) : Subgroup (GK K) := pHilbertGroup p ⊓ rootsGroup p none ⊓ unitsRootsGroup p none
instance rubinHM_normal (p : ℕ) : (rubinHM (K := K) p).Normal := sorry
structure HypKT (T : GaloisRep K O) (p : ℕ) where
  continuous : IsContinuous K O T
  tau : GK K
  tauFixed : tau ∈ rubinHM p
  rankOne : RankOneCoinvariants T tau
  irreducible : ResiduallyIrreducible T
/-- Rational irreducibility and rational coinvariant rank are distinct from their
integral/residual versions. No absolute irreducibility is silently added. -/
def RationalIrreducible (T : GaloisRep K O) : Prop :=
  Nontrivial T ∧ ∀ W : Submodule (FractionRing O) (FractionRing O ⊗[O] T),
    (∀ g : GK K, ∀ x ∈ W, TensorProduct.map LinearMap.id (T.ρ g).toLinearMap x ∈ W) → W = ⊥ ∨ W = ⊤
structure HypKV (T : GaloisRep K O) (p : ℕ) where
  continuous : IsContinuous K O T
  tau : GK K
  tauFixed : tau ∈ rubinHM p
  rankOne : Module.finrank (FractionRing O)
    (FractionRing O ⊗[O] (T ⧸ LinearMap.range ((T.ρ tau).toLinearMap - LinearMap.id))) = 1
  irreducible : RationalIrreducible T
def HypKT.toHypKV (T : GaloisRep K O) [Module.Free O T] [Module.Finite O T]
    (p : ℕ) (h : HypKT T p) : HypKV T p := sorry
/-- Arithmetic H¹ torsion, rather than zero, is factored out in Rubin's index. -/
def h1Torsion (T : GaloisRep K O) : Submodule O (H K O T 1) :=
  {carrier := {x | ∃ a : O, a ≠ 0 ∧ a • x = 0}, zero_mem' := sorry, add_mem' := sorry, smul_mem' := sorry}
def baseClass (E : EulerFactors T A) (c : EulerSystem T E) : H K O T 1 :=
  baseEquiv T (by rw [← Tower.base_val A]; exact c.val A.base)
def indexOfDivisibility (E : EulerFactors T A) (c : EulerSystem T E) : ℕ∞ :=
  ⨆ (i : ℕ) (_ : baseClass E c ∈ IsLocalRing.maximalIdeal O^i • (⊤ : Submodule O (H K O T 1)) + h1Torsion T), (i : ℕ∞)
lemma indexOfDivisibility_eq_top_iff (E : EulerFactors T A) (hDVR : IsDiscreteValuationRing O)
    [Module.Finite O (H K O T 1)] (c : EulerSystem T E) :
    indexOfDivisibility E c = ⊤ ↔ baseClass E c ∈ h1Torsion T := sorry
lemma indexOfDivisibility_smul (E : EulerFactors T A) (hDVR : IsDiscreteValuationRing O)
    [Module.Finite O (H K O T 1)] (π : O) (hπ : IsLocalRing.maximalIdeal O = Ideal.span {π})
    (c : EulerSystem T E) : indexOfDivisibility E (π • c) = indexOfDivisibility E c + 1 := sorry
abbrev Discrete (T : GaloisRep K O) := SelfDual.discreteRep T
def omegaGroup (T : GaloisRep K O) (p : ℕ) : Subgroup (GK K) :=
  rubinHM p ⊓ representationKernel (Discrete T)
instance omegaGroup_normal (T : GaloisRep K O) (p : ℕ) : (omegaGroup T p).Normal := sorry
def inflationRange (W : GaloisRep K O) (U : Subgroup (GK K)) [U.Normal]
    (hU : U ≤ representationKernel W) : Submodule O (H K O W 1) :=
  LinearMap.range (inflation W U hU)
def errorTerm (W : GaloisRep K O) (U : Subgroup (GK K)) [U.Normal]
    (hU : U ≤ representationKernel W) (F : SelmerStructure K O W) : ℕ∞ :=
  Module.length O ↥((inflationRange W U hU : Submodule O (H K O W 1)) ⊓ F.selmer)
lemma errorTerm_zero (W : GaloisRep K O) (U : Subgroup (GK K)) [U.Normal]
    (hU : U ≤ representationKernel W) (F : SelmerStructure K O W)
    (h : Subsingleton (continuousCohomology 1 (descentRep W U hU))) : errorTerm W U hU F = 0 := sorry
/-- The public-source Rubin bound: no MR04 H.3 hypothesis is imposed. -/
theorem rubin_bound (E : EulerFactors T A) (hA : IsAdmissibleTower T A)
    (hE : E.normalization = .rubin) (h : HypKT T A.p) (hodd : 2 < A.p)
    (F : SelmerStructure K O T) (hF : F = unramifiedStructure T A.bad A.unramified) (FW : SelmerStructure K O (Discrete T))
    (pPrimes : Conductor K) (hp : ∀ q, q ∈ pPrimes ↔ isAboveP A.p q)
    (hFW : FW = SelfDual.discreteStructure T F) (c : EulerSystem T E)
    (hDual : omegaGroup T A.p ≤ representationKernel (dualRep T)) :
    Module.length O (strict (dualRep T) (dualStructure T F) pPrimes).selmer ≤
      indexOfDivisibility E c +
        errorTerm (Discrete T) (omegaGroup T A.p) (by exact inf_le_right) (relaxed _ FW pPrimes) +
        errorTerm (dualRep T) (omegaGroup T A.p) hDual (strict _ (dualStructure T F) pPrimes) := sorry
/-- The any-prime result is finiteness; it does not assert the odd-prime length bound. -/
theorem rubin_bound_rational (E : EulerFactors T A) (hA : IsAdmissibleTower T A)
    (hE : E.normalization = .rubin) (h : HypKV T A.p)
    (htriv : ¬ (Module.finrank O T = 1 ∧ ∀ g : GK K, ∀ t : T, T.ρ g t = t))
    (F : SelmerStructure K O T) (hF : F = unramifiedStructure T A.bad A.unramified) (pPrimes : Conductor K) (hp : ∀ q, q ∈ pPrimes ↔ isAboveP A.p q)
    (c : EulerSystem T E) (hc : baseClass E c ∉ h1Torsion T) :
    Module.length O (strict (dualRep T) (dualStructure T F) pPrimes).selmer ≠ ⊤ := sorry
/-- Finite-depth descent bounds an exponent, retaining the local denominator loss. -/
theorem finite_depth_bound (E : EulerFactors T A) (hA : IsAdmissibleTower T A)
    (hE : E.normalization = .rubin) (h : HypKT T A.p) (M a : O) (hM : M ≠ 0)
    (c : FiniteDepthEulerSystem E (Ideal.span {M}))
    (F : SelmerStructure K O T) (hF : F = unramifiedStructure T A.bad A.unramified) (pPrimes : Conductor K) (hp : ∀ q, q ∈ pPrimes ↔ isAboveP A.p q)
    (h0 : Subsingleton (H K O (quotientRep T (Ideal.span {M})) 0))
    (hErr : ∀ W : GaloisRep K O, W = Discrete T ∨ W = dualRep T →
      Subsingleton (continuousCohomology 1 (descentRep W (omegaGroup T A.p) (by sorry))))
    (hden : ∀ q : FinitePrime K, ¬ isAboveP A.p q →
      ∀ x : LocalH K O (Discrete T) (Sum.inr q) 1, a • x ∈ unramified K O (Discrete T) (Sum.inr q)) :
    ∀ b : O, b • (a • baseEquiv _ (by rw [← Tower.base_val A]; exact c.val A.base)) = 0 →
      ∀ s : (strict (dualRep (quotientRep T (Ideal.span {M})))
        (dualStructure _ (propagatedStructure T F (Ideal.span {M}))) pPrimes).selmer, b • s = 0 := sorry
-- Unit test: indexOfDivisibility_zero_system
example (E : EulerFactors T A) : indexOfDivisibility E 0 = ⊤ := sorry
example (E : EulerFactors T A) (c : EulerSystem T E) (hc : baseClass E c ∈ h1Torsion T) :
    indexOfDivisibility E c = ⊤ := sorry
-- Unit test: HypKT.p_hilbert
example (T : GaloisRep K O) (p : ℕ) (h : HypKT T p) : h.tau ∈ pHilbertGroup p := sorry
-- Unit test: HypKT.roots_and_units
example (T : GaloisRep K O) (p : ℕ) (h : HypKT T p) :
    h.tau ∈ rootsGroup p none ∧ h.tau ∈ unitsRootsGroup p none := sorry
end TauCeti.EulerSystems

namespace TauCeti.KolyvaginSystems
open TauCeti.EulerSystems
variable {K R : Type} [Field K] [NumberField K] [CommRing R] [TopologicalSpace R]
variable {T : Rep K R} [Module.Free R T] [Module.Finite R T] {S : SelmerTriple K R T} {p : ℕ}
abbrev WeakStalk (D : KolyvaginData T S p) (n : Vertices S) :=
  (relaxed _ (propagatedStructure T S.F (conductorIdeal T p n.val)) n.val).selmer ⊗[ℤ] tameGroup K p n.val
def weakUpper (D : KolyvaginData T S p) (n : Vertices S) (q : Prime K)
    (hq : q ∈ S.primes) (hqn : q ∉ n.val) : WeakStalk D (vertexInsert S n q hq) →ₗ[R] D.EdgeStalk n q hq := sorry
def weakLower (D : KolyvaginData T S p) (n : Vertices S) (q : Prime K)
    (hq : q ∈ S.primes) (hqn : q ∉ n.val) : WeakStalk D n →ₗ[R] D.EdgeStalk n q hq := sorry
def WeakKolyvaginSystem (D : KolyvaginData T S p) : Submodule R (∀ n : Vertices S, WeakStalk D n) :=
  {carrier := {κ | ∀ n q hq hqn, weakLower D n q hq hqn (κ n) = weakUpper D n q hq hqn (κ (vertexInsert S n q hq))},
    zero_mem' := sorry, add_mem' := sorry, smul_mem' := sorry}
def KolyvaginSystem.toWeak (D : KolyvaginData T S p) : KolyvaginSystem D →ₗ[R] WeakKolyvaginSystem D := sorry
lemma KolyvaginSystem.toWeak_injective (D : KolyvaginData T S p) : Function.Injective (KolyvaginSystem.toWeak D) := sorry
/-- The ambient intrinsic class module; no Selmer membership is assumed here. -/
abbrev RawStalk (T : Rep K R) (p : ℕ) (n : Conductor K) :=
  H K R (quotientRep T (conductorIdeal T p n)) 1 ⊗[ℤ] tameGroup K p n
def fixedPart (n : Conductor K) (π : Equiv.Perm n) : Conductor K :=
  n.filter (fun q => ∀ hq : q ∈ n, (π ⟨q,hq⟩).val = q)
def augmentationIdeal (R : Type) [CommRing R] (Γ : Type) [Group Γ] : Ideal (MonoidAlgebra R Γ) :=
  RingHom.ker (MonoidAlgebra.lift R R Γ 1).toRingHom
def augmentationSquare (R : Type) [CommRing R] (Γ : Type) [Group Γ] :
    Submodule R (augmentationIdeal R Γ) :=
  ((augmentationIdeal R Γ)^2).restrictScalars R |>.comap ((augmentationIdeal R Γ).subtype.restrictScalars R)
abbrev AugmentationGraded (R : Type) [CommRing R] (Γ : Type) [Group Γ] :=
  augmentationIdeal R Γ ⧸ augmentationSquare R Γ
/-- I/I² sends σ−1 to the tame generator tensor 1. -/
def rhoAug (q : Prime K) (I : Ideal R) :
    AugmentationGraded (R ⧸ I) (gammaPrime K p q) ≃ₗ[R ⧸ I]
      ((R ⧸ I) ⊗[ℤ] tamePrime K p q) := sorry
/-- Evaluation of P_q(Fr_l⁻¹) in the augmentation quotient. All Frobenius restrictions
are those of the chosen ray compositum; q,l are auxiliary split primes. -/
def rhoEuler {A : Tower T} (E : EulerFactors T A) (q l : Prime K) (I : Ideal R)
    (hq : Sum.inr q ∉ A.bad) (haug : (E.poly T q hq).eval 1 ∈ I) :
    tamePrime K p q ⊗[ℤ] (R ⧸ I) := sorry
/-- Reduce κ_d to I_n and tensor the rhoEuler factors for the non-fixed primes. -/
def correctionTensor {A : Tower T} (E : EulerFactors T A) (n : Vertices S) (π : Equiv.Perm n.val)
    (hP : ∀ q ∈ S.primes, Sum.inr q ∉ A.bad) :
    RawStalk T p (fixedPart n.val π) →ₗ[R] RawStalk T p n.val := sorry
lemma fixedPart_identity (n : Conductor K) : fixedPart n (Equiv.refl _) = n := sorry
lemma fixedPart_swap (n : Conductor K) (π : Equiv.Perm n) (h : ∀ x, (π x).val ≠ x.val) : fixedPart n π = ∅ := sorry
lemma correctionTensor_identity {A : Tower T} (E : EulerFactors T A) (n : Vertices S)
    (hP : ∀ q ∈ S.primes, Sum.inr q ∉ A.bad) (x : RawStalk T p n.val) :
    correctionTensor E n (Equiv.refl _) hP (by rw [fixedPart_identity]; exact x) = x := sorry
def correctedClass {A : Tower T} (E : EulerFactors T A)
    (raw : ∀ n : Conductor K, RawStalk T p n) (n : Vertices S)
    (hP : ∀ q ∈ S.primes, Sum.inr q ∉ A.bad) : RawStalk T p n.val :=
  ∑ π : Equiv.Perm n.val, (Equiv.Perm.sign π : ℤ) • correctionTensor E n π hP (raw (fixedPart n.val π))
lemma correctedClass_one {A : Tower T} (E : EulerFactors T A)
    (raw : ∀ n : Conductor K, RawStalk T p n)
    (hP : ∀ q ∈ S.primes, Sum.inr q ∉ A.bad) :
    correctedClass E raw (initialVertex S) hP = raw ∅ := sorry
lemma correctedClass_prime {A : Tower T} (E : EulerFactors T A)
    (raw : ∀ n : Conductor K, RawStalk T p n) (q : Prime K) (hq : q ∈ S.primes)
    (hP : ∀ q ∈ S.primes, Sum.inr q ∉ A.bad) :
    correctedClass E raw ⟨{q},by sorry⟩ hP = raw {q} := sorry
/-- The transposition term in conductor q*l has a minus sign. -/
lemma correctedClass_two_primes {A : Tower T} (E : EulerFactors T A)
    (raw : ∀ n : Conductor K, RawStalk T p n) (q l : Prime K)
    (hne : q ≠ l) (hq : q ∈ S.primes) (hl : l ∈ S.primes)
    (hP : ∀ q ∈ S.primes, Sum.inr q ∉ A.bad)
    (swap : Equiv.Perm ({q,l} : Conductor K)) (hswap : ∀ x, (swap x).val ≠ x.val) :
    correctedClass E raw ⟨{q,l},by sorry⟩ hP = raw {q,l} -
      correctionTensor E ⟨{q,l},by sorry⟩ swap hP (by rw [fixedPart_swap _ _ hswap]; exact raw ∅) := sorry
/-- Coefficient reduction on ambient intrinsic classes. -/
def rawReduction [IsLocalRing R] (k : ℕ) (n : Conductor K) :
    (H K R (quotientRep T (IsLocalRing.maximalIdeal R^(k+1))) 1 ⊗[ℤ] tameGroup K p n) →ₗ[R]
      (H K R (quotientRep T (IsLocalRing.maximalIdeal R^k)) 1 ⊗[ℤ] tameGroup K p n) := sorry
/-- The quotient module at a fixed coefficient level, independent of n. -/
abbrev FixedLevelStalk [IsLocalRing R] (k : ℕ) (n : Conductor K) :=
  H K R (quotientRep T (IsLocalRing.maximalIdeal R^k)) 1 ⊗[ℤ] tameGroup K p n
def levelLocalTame [IsLocalRing R] (k j : ℕ) (q : Prime K)
    (hq : q ∈ kolyvaginPrimes T S p j) (hkj : k ≤ j) :
    LocalTameData (quotientRep T (IsLocalRing.maximalIdeal R^k)) p q := sorry
/-- Off the admissible prime set the map is zero; finite-level relations use it only on that set. -/
def finiteLevelUpper [IsLocalRing R] (T : Rep K R) [Module.Free R T] [Module.Finite R T]
    (S : SelmerTriple K R T) (p k j : ℕ) (n : Conductor K) (q : Prime K) :
    FixedLevelStalk (T := T) (p := p) k (insert q n) →ₗ[R]
      (singular (quotientRep T (IsLocalRing.maximalIdeal R^k)) q ⊗[ℤ] tameGroup K p (insert q n)) :=
  sorry
def finiteLevelLower [IsLocalRing R] (T : Rep K R) [Module.Free R T] [Module.Finite R T]
    (S : SelmerTriple K R T) (p k j : ℕ) (n : Conductor K) (q : Prime K) :
    FixedLevelStalk (T := T) (p := p) k n →ₗ[R]
      (singular (quotientRep T (IsLocalRing.maximalIdeal R^k)) q ⊗[ℤ] tameGroup K p (insert q n)) := sorry
lemma finiteLevelLower_pure [IsLocalRing R] (k j : ℕ) (n : Conductor K) (q : Prime K)
    (hq : q ∈ kolyvaginPrimes T S p j) (hkj : k ≤ j) (hqn : q ∉ n)
    (x : H K R (quotientRep T (IsLocalRing.maximalIdeal R^k)) 1) (g : tameGroup K p n)
    (merge : ((singular (quotientRep T (IsLocalRing.maximalIdeal R^k)) q ⊗[ℤ] tamePrime K p q)
      ⊗[ℤ] tameGroup K p n) ≃ₗ[R]
      (singular (quotientRep T (IsLocalRing.maximalIdeal R^k)) q ⊗[ℤ] tameGroup K p (insert q n))) :
    finiteLevelLower T S p k j n q (x ⊗ₜ[ℤ] g) = merge
      (finiteSingularMod T (IsLocalRing.maximalIdeal R^k) (levelLocalTame k j q hq hkj)
        S.continuous (by sorry)
        (finitePart _ (levelLocalTame k j q hq hkj)
          (quotientRep_continuous T S.continuous _) (loc K R _ (Sum.inr q) x)) ⊗ₜ[ℤ] g) := sorry
def levelModified [IsLocalRing R] (k j : ℕ) (n : Conductor K)
    (hn : ∀ q ∈ n, q ∈ kolyvaginPrimes T S p j) (hkj : k ≤ j) :
    SelmerStructure K R (quotientRep T (IsLocalRing.maximalIdeal R^k)) := sorry
lemma levelModified_condition [IsLocalRing R] (k j : ℕ) (n : Conductor K)
    (hn : ∀ q ∈ n, q ∈ kolyvaginPrimes T S p j) (hkj : k ≤ j) (q : Prime K) :
    (levelModified k j n hn hkj).condition (Sum.inr q) = if hq : q ∈ n then
      transverse _ (levelLocalTame k j q (hn q hq) hkj)
    else (propagatedStructure T S.F (IsLocalRing.maximalIdeal R^k)).condition (Sum.inr q) := sorry
/-- Canonical inclusion of the actual modified Selmer module into arithmetic H¹. -/
def levelSelmerInclusion [IsLocalRing R] (k j : ℕ) (n : Conductor K)
    (hn : ∀ q ∈ n, q ∈ kolyvaginPrimes T S p j) (hkj : k ≤ j) :
    ((levelModified k j n hn hkj).selmer ⊗[ℤ] tameGroup K p n) →ₗ[R]
      FixedLevelStalk (T := T) (p := p) k n := sorry
lemma levelSelmerInclusion_pure [IsLocalRing R] (k j : ℕ) (n : Conductor K)
    (hn : ∀ q ∈ n, q ∈ kolyvaginPrimes T S p j) (hkj : k ≤ j)
    (x : (levelModified k j n hn hkj).selmer) (g : tameGroup K p n) :
    levelSelmerInclusion k j n hn hkj (x ⊗ₜ[ℤ] g) = x.val ⊗ₜ[ℤ] g := sorry
def finiteLevelSelmer [IsLocalRing R] (T : Rep K R) [Module.Free R T] [Module.Finite R T]
    (S : SelmerTriple K R T) (p k j : ℕ) (n : Conductor K)
    (x : FixedLevelStalk (T := T) (p := p) k n) : Prop :=
  ∃ (hkj : k ≤ j) (hn : ∀ q ∈ n, q ∈ kolyvaginPrimes T S p j),
    x ∈ LinearMap.range (levelSelmerInclusion k j n hn hkj)
def weakFinitePart (D : KolyvaginData T S p) (n : Vertices S) (q : Prime K) (hq : q ∈ n.val) :
    WeakStalk D n →ₗ[R]
      (unramified K R (quotientRep T (conductorIdeal T p n.val)) (Sum.inr q) ⊗[ℤ] tameGroup K p n.val) :=
  sorry
/-- The literal finite-level KS relations on sufficiently deep conductors. These use
strict/transverse local kernels and the reduced polynomial finite-singular map. -/
def FiniteLevelKS [IsLocalRing R] (k j : ℕ) (κ : ∀ n : Conductor K,
    H K R (quotientRep T (IsLocalRing.maximalIdeal R^k)) 1 ⊗[ℤ] tameGroup K p n) : Prop :=
  k ≤ j ∧ ∀ n : Conductor K, (∀ q ∈ n, q ∈ S.primes ∩ kolyvaginPrimes T S p j) →
    (∀ q ∉ n, q ∈ S.primes ∩ kolyvaginPrimes T S p j →
      finiteLevelLower T S p k j n q (κ n) = finiteLevelUpper T S p k j n q (κ (insert q n))) ∧
    finiteLevelSelmer T S p k j n (κ n)
/-- Germs modulo restriction to a deeper prime set give the filtered colimit in j. -/
def eventuallyCompatible [IsLocalRing R] (k : ℕ) : Submodule R (∀ n : Conductor K,
    H K R (quotientRep T (IsLocalRing.maximalIdeal R^k)) 1 ⊗[ℤ] tameGroup K p n) :=
  {carrier := {κ | ∃ j, k ≤ j ∧ FiniteLevelKS (T := T) (S := S) (p := p) k j κ},
    zero_mem' := sorry, add_mem' := sorry, smul_mem' := sorry}
def eventuallyZero [IsLocalRing R] (k : ℕ) : Submodule R (eventuallyCompatible (T := T) (S := S) (p := p) k) :=
  {carrier := {κ | ∃ j, k ≤ j ∧ ∀ n : Conductor K,
      (∀ q ∈ n, q ∈ S.primes ∩ kolyvaginPrimes T S p j) → κ.val n = 0},
    zero_mem' := sorry, add_mem' := sorry, smul_mem' := sorry}
abbrev GeneralizedLevel [IsLocalRing R] (k : ℕ) :=
  eventuallyCompatible (T := T) (S := S) (p := p) k ⧸ eventuallyZero (T := T) (S := S) (p := p) k
def generalizedReduction [IsLocalRing R] (k : ℕ) :
    GeneralizedLevel (T := T) (S := S) (p := p) (k+1) →ₗ[R] GeneralizedLevel (T := T) (S := S) (p := p) k := sorry
def GeneralizedKolyvaginSystem [IsLocalRing R] : Submodule R (∀ k : ℕ, GeneralizedLevel (T := T) (S := S) (p := p) k) :=
  {carrier := {κ | ∀ k, generalizedReduction (T := T) (S := S) (p := p) k (κ (k+1)) = κ k},
    zero_mem' := sorry, add_mem' := sorry, smul_mem' := sorry}
def toGeneralized [IsLocalRing R] (D : KolyvaginData T S p) :
    KolyvaginSystem D →ₗ[R] GeneralizedKolyvaginSystem (T := T) (S := S) (p := p) := sorry
def generalizedOne [IsLocalRing R] (hcomplete : IsAdicComplete (IsLocalRing.maximalIdeal R) R)
    (h0 : NoResidualInvariants T (IsLocalRing.maximalIdeal R)) :
    GeneralizedKolyvaginSystem (T := T) (S := S) (p := p) →ₗ[R] S.F.selmer := sorry
/-- Maximal abelian pro-p extension unramified outside the given support. -/
def maximalAbelianPGroup (K : Type) [Field K] [NumberField K] (p : ℕ) (bad : Set (Place K)) : Subgroup (GK K) :=
  ⨅ (F : Layer K) (_ : ∃ a : ℕ, Fintype.card (Layer.Gal K F)=p^a)
    (_ : IsMulCommutative (Layer.Gal K F)) (_ : ∀ q : Prime K, Sum.inr q ∉ bad → IsUnramifiedLayer F q), F.group
structure EulerKolyvaginHypotheses [IsDomain R] {A : Tower T} (E : EulerFactors T A) (S : SelmerTriple K R T) where
  rational : Nonempty (K ≃+* ℚ)
  dvr : IsDiscreteValuationRing R
  normalization : E.normalization = .mazurRubin
  continuous : IsContinuous K R T
  canonical : S.F = canonicalStructure T A.bad (pInfinity A.p) A.unramified A.contains_p_infinity
  support : ∀ q ∈ S.primes, Sum.inr q ∉ A.bad
  cyclic : ∀ q ∈ S.primes, (⊤ : Submodule R (T ⧸ LinearMap.range (frobEnd T q - LinearMap.id))).IsPrincipal
  frobeniusInjective : ∀ q ∈ S.primes, ∀ k : ℕ, Function.Injective ((frobEnd T q)^(A.p^k) - (LinearMap.id : Module.End R T))
  towerContains : A.subgroup ≤ maximalAbelianPGroup K A.p (pInfinity A.p ∪ Sum.inr '' S.primes)
def eulerToKolyvagin [IsDomain R] [IsDiscreteValuationRing R] {A : Tower T}
    (E : EulerFactors T A) (hA : IsAdmissibleTower T A) (h : EulerKolyvaginHypotheses E S) :
    EulerSystem T E →ₗ[R] GeneralizedKolyvaginSystem (T := T) (S := S) (p := A.p) := sorry
lemma eulerToKolyvagin_one [IsDomain R] [IsDiscreteValuationRing R] {A : Tower T}
    (E : EulerFactors T A) (hA : IsAdmissibleTower T A) (h : EulerKolyvaginHypotheses E S)
    (hcomplete : IsAdicComplete (IsLocalRing.maximalIdeal R) R)
    (h0 : NoResidualInvariants T (IsLocalRing.maximalIdeal R)) (c : EulerSystem T E) :
    (generalizedOne hcomplete h0 (eulerToKolyvagin E hA h c)).val = baseClass E c := sorry
/-- Divisibility of the local discrete invariants is the extra ordinary-output hypothesis. -/
def pDualInvariantsDivisible (T : Rep K R) (p : ℕ) : Prop :=
  ∀ q : Prime K, isAboveP p q → ∀ x : LocalH K R (dualRep T) (Sum.inr q) 0,
    ∀ a : R, a ≠ 0 → ∃ y, a • y = x
def eulerToKolyvaginOrdinary [IsDomain R] [IsDiscreteValuationRing R] {A : Tower T}
    (E : EulerFactors T A) (hA : IsAdmissibleTower T A) (h : EulerKolyvaginHypotheses E S)
    (D : KolyvaginData T S A.p) (hdiv : pDualInvariantsDivisible T A.p) :
    EulerSystem T E →ₗ[R] KolyvaginSystem D := sorry
lemma eulerToKolyvagin_ordinary [IsDomain R] [IsDiscreteValuationRing R] {A : Tower T}
    (E : EulerFactors T A) (hA : IsAdmissibleTower T A) (h : EulerKolyvaginHypotheses E S)
    (D : KolyvaginData T S A.p) (hdiv : pDualInvariantsDivisible T A.p) :
    (toGeneralized D).comp (eulerToKolyvaginOrdinary E hA h D hdiv) = eulerToKolyvagin E hA h := sorry
-- Unit test: eulerToKolyvagin_zero
example [IsDomain R] [IsDiscreteValuationRing R] {A : Tower T}
    (E : EulerFactors T A) (hA : IsAdmissibleTower T A) (h : EulerKolyvaginHypotheses E S) : eulerToKolyvagin E hA h 0 = 0 := sorry
example (D : KolyvaginData T S p) (n : Vertices S) (q : Prime K) (hq : q ∈ n.val)
    (κ : WeakKolyvaginSystem D) (hfinite : weakFinitePart D n q hq (κ.val n) ≠ 0) :
    κ ∉ LinearMap.range (KolyvaginSystem.toWeak D) := sorry
end TauCeti.KolyvaginSystems

namespace TauCeti.EulerSystems
open TauCeti.KolyvaginSystems
abbrev HigherRep := TauCeti.KolyvaginSystems.Rep
variable {K R : Type} [Field K] [NumberField K] [CommRing R] [TopologicalSpace R]
variable {T : HigherRep K R} [Module.Free R T] [Module.Finite R T] {A : Tower T}
def LayerAbelianGal (A : Tower T) (F : FiniteLayer A) := Layer.Gal K F.val
instance layerAbelianGroup (A : Tower T) (F : FiniteLayer A) : Group (LayerAbelianGal A F) :=
  inferInstanceAs (Group (Layer.Gal K F.val))
instance layerAbelianComm (A : Tower T) (F : FiniteLayer A) : CommGroup (LayerAbelianGal A F) :=
  {__ := layerAbelianGroup A F, mul_comm := sorry}
instance layerAbelianFinite (A : Tower T) (F : FiniteLayer A) : Fintype (LayerAbelianGal A F) :=
  inferInstanceAs (Fintype (Layer.Gal K F.val))
def layerAbelianEquiv (A : Tower T) (F : FiniteLayer A) : LayerAbelianGal A F ≃* Layer.Gal K F.val := MulEquiv.refl _
abbrev LayerRing (A : Tower T) (F : FiniteLayer A) := MonoidAlgebra R (LayerAbelianGal A F)
def layerCohomAction (A : Tower T) (F : FiniteLayer A) :
    Representation R (LayerAbelianGal A F) (HAt K R T F.val 1) :=
  (cohomologyAction T F.val).comp (layerAbelianEquiv A F).toMonoidHom
abbrev LayerCohomModule (A : Tower T) (F : FiniteLayer A) := (layerCohomAction A F).asModule
/-- Restricted ramification is an intersection of actual inertia kernels at the primes over K. -/
def ramifiedCohom (A : Tower T) (F : FiniteLayer A) (support : Set (Prime K)) :
    Submodule (LayerRing A F) (LayerCohomModule A F) :=
  {carrier := {x | ∀ q : Prime K, q ∉ support → ∀ w ∈ primesAbove F.val q,
      locAt T F.val (Sum.inr w) ((layerCohomAction A F).asModuleEquiv x) ∈
        unramified F.val.field R (layerRep T F.val) (Sum.inr w)},
    zero_mem' := sorry, add_mem' := sorry, smul_mem' := sorry}
def layerSupport (A : Tower T) (F : FiniteLayer A) : Set (Prime K) :=
  {q | Sum.inr q ∈ A.bad ∨ ¬ IsUnramifiedLayer F.val q}
abbrev HigherStalk (A : Tower T) (r : ℕ) (F : FiniteLayer A) :=
  Module.Dual (LayerRing A F) (⋀[LayerRing A F]^r
    (Module.Dual (LayerRing A F) (ramifiedCohom A F (layerSupport A F))))
instance higherStalkR (A : Tower T) (r : ℕ) (F : FiniteLayer A) : Module R (HigherStalk A r F) :=
  Module.compHom _ (algebraMap R (LayerRing A F))
abbrev ExpandedStalk (A : Tower T) (r : ℕ) (F F' : FiniteLayer A) :=
  Module.Dual (LayerRing A F) (⋀[LayerRing A F]^r
    (Module.Dual (LayerRing A F) (ramifiedCohom A F (layerSupport A F'))))
instance expandedStalkR (A : Tower T) (r : ℕ) (F F' : FiniteLayer A) : Module R (ExpandedStalk A r F F') :=
  Module.compHom _ (algebraMap R (LayerRing A F))
/-- L6's group-ring transfer, normalized by Sano14 Proposition 2.4. It is not an exterior norm
with a missing power of the extension degree. The cohomological map is corAt. -/
def higherCorestriction (A : Tower T) (r : ℕ) (F F' : FiniteLayer A)
    (h : F'.val.group ≤ F.val.group) : HigherStalk A r F' →ₗ[R] ExpandedStalk A r F F' := sorry
def expandBidual (A : Tower T) (r : ℕ) (F F' : FiniteLayer A)
    (h : F'.val.group ≤ F.val.group) : HigherStalk A r F →ₗ[R] ExpandedStalk A r F F' := sorry
def higherFactor (E : EulerFactors T A) (r : ℕ) (F F' : FiniteLayer A) :
    Module.End R (ExpandedStalk A r F F') := sorry
lemma higherFactor_formula (E : EulerFactors T A) (r : ℕ) (F F' : FiniteLayer A)
    (x : ExpandedStalk A r F F') : higherFactor E r F F' x =
      ((ramifiedDifference A F F').attach.toList.map (fun q =>
        aeval (MonoidAlgebra.of R (LayerAbelianGal A F) ((layerAbelianEquiv A F).symm (QuotientGroup.mk (frobenius K q.val).val⁻¹)))
          (E.poly T q.val (by sorry)))).prod • x := sorry
/-- A genuine inverse system of group-ring exterior biduals of arithmetic cohomology. -/
def HigherEulerSystem (E : EulerFactors T A) (r : ℕ) : Submodule R (∀ F : FiniteLayer A, HigherStalk A r F) :=
  {carrier := {c | ∀ F F' h, higherCorestriction A r F F' h (c F') =
      higherFactor E r F F' (expandBidual A r F F' h (c F))},
    zero_mem' := sorry, add_mem' := sorry, smul_mem' := sorry}
def HigherEulerSystem.eval (E : EulerFactors T A) (r : ℕ) (F : FiniteLayer A) :
    HigherEulerSystem E r →ₗ[R] HigherStalk A r F := sorry
lemma HigherEulerSystem.cor_eval (E : EulerFactors T A) (r : ℕ) (c : HigherEulerSystem E r)
    (F F' : FiniteLayer A) (h : F'.val.group ≤ F.val.group) :
    higherCorestriction A r F F' h (c.val F') = higherFactor E r F F' (expandBidual A r F F' h (c.val F)) := sorry
/-- Reflexivity is the evaluation into the double dual, not freeness of the original
cohomology over a possibly non-principal group ring. -/
def BSSHypothesis61 (A : Tower T) : Prop :=
  ∀ F : FiniteLayer A, Function.Bijective
    (Module.Dual.eval (LayerRing A F) (ramifiedCohom A F (layerSupport A F))) ∧
      Subsingleton (HAt K R T F.val 0)
lemma BSSHypothesis61.iff_free [IsLocalRing R] (hO : TauCeti.StarkSystems.GorensteinOrderData (R := R) A.p)
    [∀ F : FiniteLayer A, Module hO.O (ramifiedCohom A F (layerSupport A F))]
    [∀ F : FiniteLayer A, IsScalarTower hO.O (LayerRing A F) (ramifiedCohom A F (layerSupport A F))] :
    BSSHypothesis61 A ↔ ∀ F : FiniteLayer A,
      Module.Free hO.O (ramifiedCohom A F (layerSupport A F)) ∧ Subsingleton (HAt K R T F.val 0) := sorry
def HigherEulerSystem.rank_one_equiv (E : EulerFactors T A) (hA : IsAdmissibleTower T A)
    (h : BSSHypothesis61 A) (hT : IsContinuous K R T) : HigherEulerSystem E 1 ≃ₗ[R] EulerSystem T E := sorry
/-- Rank-one evaluation includes the canonical identification ∧¹ M* ≃ M*. -/
def oneBidualEvaluation (F : FiniteLayer A) :
    ramifiedCohom A F (layerSupport A F) →ₗ[LayerRing A F] HigherStalk A 1 F := sorry
lemma oneBidualEvaluation_apply (F : FiniteLayer A)
    (x : ramifiedCohom A F (layerSupport A F))
    (φ : Module.Dual (LayerRing A F) (ramifiedCohom A F (layerSupport A F))) :
    oneBidualEvaluation F x (exteriorPower.ιMulti _ 1 (fun _ => φ)) = φ x := sorry
lemma rank_one_equiv_eval (E : EulerFactors T A) (hA : IsAdmissibleTower T A)
    (h : BSSHypothesis61 A) (hT : IsContinuous K R T) (c : HigherEulerSystem E 1) (F : FiniteLayer A) :
    ∃ x : ramifiedCohom A F (layerSupport A F), oneBidualEvaluation F x = c.val F ∧
      (HigherEulerSystem.rank_one_equiv E hA h hT c).val F = (layerCohomAction A F).asModuleEquiv x.val := sorry
-- Unit test: TauCeti.EulerSystems.HigherEulerSystem.zero_mem
example (E : EulerFactors T A) (r : ℕ) : (0 : ∀ F, HigherStalk A r F) ∈ HigherEulerSystem E r := sorry
-- Unit test: TauCeti.EulerSystems.HigherEulerSystem.rank_one_zero
example (E : EulerFactors T A) (hA : IsAdmissibleTower T A) (h : BSSHypothesis61 A)
    (hT : IsContinuous K R T) : HigherEulerSystem.rank_one_equiv E hA h hT 0 = 0 := sorry
-- Unit test: TauCeti.EulerSystems.not_BSSHypothesis61_torsion
example (F : FiniteLayer A) (p : R) (hp : p ≠ 0)
    (h : ∃ x : ramifiedCohom A F (layerSupport A F), x ≠ 0 ∧ p • x = 0)
    [IsDomain R] (hfree : Module.IsTorsionFree R (ramifiedCohom A F (layerSupport A F))) : False := sorry
/-- The local injectivity hypothesis is stated on the integral T. -/
def BSSHypothesis611 (T : HigherRep K R) (p : ℕ) (P : Set (Prime K)) : Prop :=
  ∀ q ∈ P, ∀ k : ℕ, Function.Injective ((frobEnd T q)^(p^k)-(LinearMap.id : Module.End R T))
/-- E(n) is a compositum. No direct-product decomposition of Gal(E(n)/K) is assumed. -/
def auxiliaryCompositum (F : Layer K) (p : ℕ) (n : Conductor K) : Layer K := sorry
lemma auxiliaryCompositum_group (F : Layer K) (p : ℕ) (n : Conductor K) :
    (auxiliaryCompositum F p n).group = F.group ⊓ (rayLayer K p n).group := sorry
instance relativeAuxNormal (F : Layer K) (p : ℕ) (n : Conductor K) :
    ((auxiliaryCompositum F p n).group.subgroupOf F.group).Normal := sorry
abbrev RelativeAuxGroup (F : Layer K) (p : ℕ) (n : Conductor K) :=
  F.group ⧸ (auxiliaryCompositum F p n).group.subgroupOf F.group
/-- Shapiro induction is supplied by ProfiniteCohomology. Its underlying module consists
of continuous equivariant functions GK→T/MT, with left translation. -/
def inducedAt (T : HigherRep K R) (F : Layer K) (M : R) : HigherRep K R := sorry
def inducedFunctionModule (T : HigherRep K R) (F : Layer K) (M : R) :
    Submodule R C(GK K, quotientRep T (Ideal.span {M})) :=
  {carrier := {f | ∀ (g : GK K) (h : F.group), f (h.val*g) =
      (quotientRep T (Ideal.span {M})).ρ h.val (f g)},
    zero_mem' := sorry, add_mem' := sorry, smul_mem' := sorry}
def inducedAtEquiv (T : HigherRep K R) (F : Layer K) (M : R) :
    inducedAt T F M ≃ₗ[R] inducedFunctionModule T F M := sorry
/-- Ambient reduced bidual over the FULL Gal(E(n)/K), with the uninduced T/MT. -/
def reducedCohomAction (A : Tower T) (F : FiniteLayer A) (M : R) :
    Representation (R ⧸ Ideal.span {M}) (LayerAbelianGal A F)
      (HAt K (R ⧸ Ideal.span {M}) (reducedRep T (Ideal.span {M})) F.val 1) :=
  (cohomologyAction (reducedRep T (Ideal.span {M})) F.val).comp (layerAbelianEquiv A F).toMonoidHom
abbrev FullReducedBidual (A : Tower T) (F : FiniteLayer A) (M : R) (r : ℕ) :=
  Module.Dual (MonoidAlgebra (R ⧸ Ideal.span {M}) (LayerAbelianGal A F))
    (⋀[MonoidAlgebra (R ⧸ Ideal.span {M}) (LayerAbelianGal A F)]^r
      (Module.Dual (MonoidAlgebra (R ⧸ Ideal.span {M}) (LayerAbelianGal A F))
        (reducedCohomAction A F M).asModule))
/-- Source map (9): reduce coefficient functionals before dualizing. -/
def reduceHigher (E : EulerFactors T A) (r : ℕ) (F : FiniteLayer A) (M : R)
    (h : BSSHypothesis61 A) : HigherStalk A r F →ₗ[R] FullReducedBidual A F M r := sorry
/-- Determinant correction in an arbitrary commutative target of augmentation factors. -/
def deltaCorrection {B : Type} [CommRing B] (n : ℕ) (P : Fin n → Fin n → B) : B :=
  Matrix.det (fun i j => if i=j then 0 else P i j)
-- Unit test: TauCeti.EulerSystems.higherCorrection_empty
example {B : Type} [CommRing B] (P : Fin 0 → Fin 0 → B) : deltaCorrection 0 P = 1 := sorry
-- Unit test: TauCeti.EulerSystems.higherCorrection_one_prime
example {B : Type} [CommRing B] (P : Fin 1 → Fin 1 → B) : deltaCorrection 1 P = 0 := sorry
-- Unit test: TauCeti.EulerSystems.higherDerivative_two_primes
example {B : Type} [CommRing B] (P : Fin 2 → Fin 2 → B) : deltaCorrection 2 P = -(P 0 1 * P 1 0) := sorry
/-- Integral finite condition over a reduced Gorenstein order: rationalize at all
non-zero-divisors, not at the zero ring obtained from a finite coefficient ring. -/
def orderRationalRep (U : HigherRep K R) : HigherRep K R := sorry
def orderRationalEquiv (U : HigherRep K R) : orderRationalRep U ≃ₗ[R]
    (Localization (nonZeroDivisors R) ⊗[R] U) := sorry
def orderRationalMap (U : HigherRep K R) : U ⟶ orderRationalRep U := sorry
def orderFiniteCondition (U : HigherRep K R) (v : Place K) : Submodule R (LocalH K R U v 1) :=
  (TauCeti.KolyvaginSystems.unramified K R (orderRationalRep U) v).comap
    (TauCeti.ContinuousCohomology.coeffMap
      (TopRep.resFunctor (decomposition K v).subtype |>.map (orderRationalMap U)) 1).hom.toLinearMap
/-- Canonical local coefficient reduction plus the induction/Shapiro dictionary.
The integral source is induced T, represented as inducedAt T E 0. -/
def inducedIntegralLocal {C : Type} [CommRing C] [TopologicalSpace C] [Algebra R C]
    (T : HigherRep K R) (F : Layer K) (M : R) (B : TopRep.{0} C (GK K))
    [Module R B] [IsScalarTower R C B] (i : B ≃ₗ[R] inducedAt T F M) (v : Place K) :
    LocalH K R (inducedAt T F 0) v 1 → LocalH K C B v 1 := sorry
/-- The propagated canonical condition. The displayed image, rather than full
finite-level H¹ at p, retains the local H² obstruction to surjectivity. -/
def inducedCanonicalCondition {C : Type} [CommRing C] [TopologicalSpace C] [Algebra R C]
    (T : HigherRep K R) (F : Layer K) (p : ℕ) (M : R) (B : TopRep.{0} C (GK K))
    [Module R B] [IsScalarTower R C B] (i : B ≃ₗ[R] inducedAt T F M) (v : Place K) :
    Submodule C (LocalH K C B v 1) :=
  {carrier := {x | ∃ y : LocalH K R (inducedAt T F 0) v 1,
      (v ∈ pInfinity p ∨ y ∈ orderFiniteCondition (inducedAt T F 0) v) ∧
        inducedIntegralLocal T F M B i v y=x},
    zero_mem' := sorry, add_mem' := sorry, smul_mem' := sorry}
lemma inducedCanonicalCondition_at_p {C : Type} [CommRing C] [TopologicalSpace C] [Algebra R C]
    (T : HigherRep K R) (F : Layer K) (p : ℕ) (M : R) (B : TopRep.{0} C (GK K))
    [Module R B] [IsScalarTower R C B] (i : B ≃ₗ[R] inducedAt T F M) (v : Place K)
    (hv : v ∈ pInfinity p) (x : LocalH K C B v 1) :
    x ∈ inducedCanonicalCondition T F p M B i v ↔ ∃ y, inducedIntegralLocal T F M B i v y=x := sorry

/-- Arithmetic data connecting the integral tower to a finite induced coefficient module.
The equalities are supplier dictionaries, not an assumption that the derivative satisfies KS relations. -/
structure HigherDerivativeData (E : EulerFactors T A) (M : R) (r : ℕ) where
  field : FiniteLayer A
  includesHilbert : field.val.group ≤ (rayLayer K A.p ∅).group
  unramified : ∀ q : Prime K, Sum.inr q ∉ A.bad → IsUnramifiedLayer field.val q
  power : ∃ k : ℕ, M = (A.p^k : R) ∧ 0 < k
  C : Type
  [ringC : CommRing C]
  [spaceC : TopologicalSpace C]
  [algebraC : Algebra R C]
  [localC : IsLocalRing C]
  coefficient : C ≃+* MonoidAlgebra (R ⧸ Ideal.span {M}) (LayerAbelianGal A field)
  coefficientScalar : ∀ a : R, coefficient (algebraMap R C a) =
    MonoidAlgebra.single 1 (Ideal.Quotient.mk (Ideal.span {M}) a)
  B : TopRep.{0} C (GK K)
  [freeB : Module.Free C B]
  [finiteB : Module.Finite C B]
  [moduleR : Module R B]
  [towerR : IsScalarTower R C B]
  inducedEquiv : B ≃ₗ[R] inducedAt T field.val M
  inducedAction : ∀ g x, inducedEquiv (B.ρ g x) = (inducedAt T field.val M).ρ g (inducedEquiv x)
  S : SelmerTriple K C B
  comparison : TauCeti.StarkSystems.ComparisonData S A.p
  hypotheses61 : BSSHypothesis61 A
  admissible : IsAdmissibleTower T A
  auxiliaryPrimes : ∀ q ∈ S.primes, Sum.inr q ∉ A.bad ∧
    (frobenius K q).val ∈ field.val.group ∧
    (Fintype.card (gammaPrime K A.p q) : R) ∈ Ideal.span {M} ∧
    (E.poly T q (by sorry)).eval 1 ∈ Ideal.span {M}
  polynomial : E.normalization = .rubin
  canonical : ∀ v : Place K, S.F.condition v =
    inducedCanonicalCondition T field.val A.p M B inducedEquiv v
attribute [instance] HigherDerivativeData.ringC HigherDerivativeData.spaceC HigherDerivativeData.algebraC
attribute [instance] HigherDerivativeData.localC HigherDerivativeData.freeB HigherDerivativeData.finiteB
attribute [instance] HigherDerivativeData.moduleR HigherDerivativeData.towerR
abbrev RawHigherStalk {E : EulerFactors T A} {M : R} {r : ℕ} (h : HigherDerivativeData E M r) :=
  Module.Dual h.C (⋀[h.C]^r (Module.Dual h.C (H K h.C h.B 1)))
instance rawHigherModule {E : EulerFactors T A} {M : R} {r : ℕ} (h : HigherDerivativeData E M r) :
    Module R (RawHigherStalk h) := Module.compHom _ (algebraMap R h.C)
abbrev HigherKS {E : EulerFactors T A} {M : R} {r : ℕ} (h : HigherDerivativeData E M r) (hr : 0 < r) :=
  TauCeti.StarkSystems.KolyvaginSystemRank h.comparison r hr
instance higherKSModule {E : EulerFactors T A} {M : R} {r : ℕ} (h : HigherDerivativeData E M r) (hr : 0 < r) :
    Module R (HigherKS h hr) := Module.compHom _ (algebraMap R h.C)
/-- Raw derivative before correcting the transverse local condition. -/
def rawHigherDerivative (E : EulerFactors T A) (M : R) (r : ℕ)
    (h : HigherDerivativeData E M r) (c : HigherEulerSystem E r) (n : Vertices h.S) : RawHigherStalk h := sorry
/-- The relative group is a product over auxiliary primes; the full group over K
remains an extension, as BSS II §6.3 requires. -/
def derivativeAuxiliary (E : EulerFactors T A) (M : R) (r : ℕ)
    (h : HigherDerivativeData E M r) (n : Vertices h.S) : FiniteLayer A := sorry
lemma derivativeAuxiliary_group (E : EulerFactors T A) (M : R) (r : ℕ)
    (h : HigherDerivativeData E M r) (n : Vertices h.S) :
    (derivativeAuxiliary E M r h n).val.group = h.field.val.group ⊓ (rayLayer K A.p n.val).group := sorry
def derivativeRelativeProduct (E : EulerFactors T A) (M : R) (r : ℕ)
    (h : HigherDerivativeData E M r) (n : Vertices h.S) :
    RelativeAuxGroup h.field.val A.p n.val ≃* (∀ q : n.val, gammaPrime K A.p q) := sorry
/-- Canonical embedding of one cyclic factor in the full auxiliary Galois group. -/
def derivativeGenerator (E : EulerFactors T A) (M : R) (r : ℕ)
    (h : HigherDerivativeData E M r) (n : Vertices h.S) (q : n.val) :
    gammaPrime K A.p q →* LayerAbelianGal A (derivativeAuxiliary E M r h n) := sorry
/-- The literal product of cyclic group-ring derivatives. -/
def higherDerivativeOperator (E : EulerFactors T A) (M : R) (r : ℕ)
    (h : HigherDerivativeData E M r) (n : Vertices h.S) (σ : ∀ q : n.val, gammaPrime K A.p q) :
    MonoidAlgebra (R ⧸ Ideal.span {M}) (LayerAbelianGal A (derivativeAuxiliary E M r h n)) :=
  ∏ q : n.val, ∑ i ∈ Finset.range (Fintype.card (gammaPrime K A.p q)),
    MonoidAlgebra.single (derivativeGenerator E M r h n q (σ q)^i) (i : R ⧸ Ideal.span {M})
/-- Normalized bidual restriction, including Shapiro. Its transfer uses
Sano's i(N_H^{∧r}x)=N_H x, with compatible lifts of coefficient functionals. -/
def higherRestriction (E : EulerFactors T A) (M : R) (r : ℕ)
    (h : HigherDerivativeData E M r) (n : Vertices h.S) :
    RawHigherStalk h →ₗ[R] FullReducedBidual A (derivativeAuxiliary E M r h n) M r := sorry
/-- The generator-dependent raw derivative, before the determinant correction. -/
def rawHigherWithGenerators (E : EulerFactors T A) (M : R) (r : ℕ)
    (h : HigherDerivativeData E M r) (c : HigherEulerSystem E r) (n : Vertices h.S)
    (σ : ∀ q : n.val, gammaPrime K A.p q)
    (hσ : ∀ (q : n.val) (g : gammaPrime K A.p q), g ∈ Subgroup.zpowers (σ q)) : RawHigherStalk h := sorry
lemma rawHigherWithGenerators_formula (E : EulerFactors T A) (M : R) (r : ℕ)
    (h : HigherDerivativeData E M r) (c : HigherEulerSystem E r) (n : Vertices h.S)
    (σ : ∀ q : n.val, gammaPrime K A.p q)
    (hσ : ∀ (q : n.val) (g : gammaPrime K A.p q), g ∈ Subgroup.zpowers (σ q)) :
    higherRestriction E M r h n (rawHigherWithGenerators E M r h c n σ hσ) =
      higherDerivativeOperator E M r h n σ •
        reduceHigher E r (derivativeAuxiliary E M r h n) M h.hypotheses61
          (c.val (derivativeAuxiliary E M r h n)) := sorry
abbrev AmbientHigherStalk {E : EulerFactors T A} {M : R} {r : ℕ}
    (h : HigherDerivativeData E M r) (n : Vertices h.S) :=
  RawHigherStalk h ⊗[ℤ] tameGroup K A.p n.val
/-- The image of P_q(Fr_l⁻¹) in the q-augmentation quotient. The coefficient
identification h.coefficient is applied to its Gal(E/K) component. -/
def higherRhoEuler (E : EulerFactors T A) (M : R) (r : ℕ)
    (h : HigherDerivativeData E M r) (q l : Prime K) (hq : q ∈ h.S.primes) :
    h.C ⊗[ℤ] tamePrime K A.p q := sorry
/-- Multiply scalar factors and concatenate the tame factors; the formula on pure
tensors fixes both the factor order and the normalization. -/
def higherTensorFactors (E : EulerFactors T A) (M : R) (r : ℕ)
    (h : HigherDerivativeData E M r) (n : Vertices h.S) :
    RawHigherStalk h → (∀ q : n.val, h.C ⊗[ℤ] tamePrime K A.p q) → AmbientHigherStalk h n := sorry
lemma higherTensorFactors_pure (E : EulerFactors T A) (M : R) (r : ℕ)
    (h : HigherDerivativeData E M r) (n : Vertices h.S) (x : RawHigherStalk h)
    (a : n.val → h.C) (g : ∀ q : n.val, tamePrime K A.p q) :
    higherTensorFactors E M r h n x (fun q => a q ⊗ₜ[ℤ] g q) =
      ((∏ q, a q) • x) ⊗ₜ[ℤ] PiTensorProduct.tprod ℤ g := sorry
/-- Bidual covariance of the actual Selmer inclusion. -/
def higherSelmerInclusion (E : EulerFactors T A) (M : R) (r : ℕ)
    (h : HigherDerivativeData E M r) (n : Vertices h.S) :
    TauCeti.StarkSystems.rankStalk h.comparison r n →ₗ[R] AmbientHigherStalk h n := sorry
/-- The permutation expression for the zero-diagonal determinant correction.
Fixed factors contribute σ_q−1; non-fixed factors contribute P_q(Fr_{π(q)}⁻¹). -/
def correctedHigherAmbient (E : EulerFactors T A) (M : R) (r : ℕ)
    (h : HigherDerivativeData E M r) (c : HigherEulerSystem E r) (n : Vertices h.S)
    (σ : ∀ q : n.val, gammaPrime K A.p q)
    (hσ : ∀ (q : n.val) (g : gammaPrime K A.p q), g ∈ Subgroup.zpowers (σ q)) : AmbientHigherStalk h n :=
  ∑ π : Equiv.Perm n.val, (Equiv.Perm.sign π : ℤ) •
    higherTensorFactors E M r h n
      (rawHigherWithGenerators E M r h c ⟨fixedPart n.val π,by sorry⟩
        (fun q => σ ⟨q.val,by sorry⟩) (by sorry))
      (fun q => if (π q).val = q.val then 1 ⊗ₜ[ℤ] Additive.ofMul (σ q)
        else higherRhoEuler E M r h q.val (π q).val (n.prop q.val q.prop))
lemma correctedHigherAmbient_one (E : EulerFactors T A) (M : R) (r : ℕ)
    (h : HigherDerivativeData E M r) (c : HigherEulerSystem E r)
    (σ : ∀ q : (initialVertex h.S).val, gammaPrime K A.p q)
    (hσ : ∀ (q : (initialVertex h.S).val) (g : gammaPrime K A.p q), g ∈ Subgroup.zpowers (σ q)) :
    correctedHigherAmbient E M r h c (initialVertex h.S) σ hσ =
      rawHigherWithGenerators E M r h c (initialVertex h.S) σ hσ ⊗ₜ[ℤ]
        PiTensorProduct.tprod ℤ (fun q => Additive.ofMul (σ q)) := sorry

/-- The actual local-condition equalizer is the target, over the reduced induced group ring. -/
def higherDerivative (E : EulerFactors T A) (M : R) (r : ℕ) (hr : 0 < r)
    (h : HigherDerivativeData E M r)
    (h611 : BSSHypothesis611 T A.p h.S.primes) : HigherEulerSystem E r →ₗ[R] HigherKS h hr := sorry
lemma higherDerivative_singular (E : EulerFactors T A) (M : R) (r : ℕ) (hr : 0 < r)
    (h : HigherDerivativeData E M r) (h611 : BSSHypothesis611 T A.p h.S.primes)
    (c : HigherEulerSystem E r) (n : Vertices h.S)
    (q : Prime K) (hq : q ∈ h.S.primes) (hqn : q ∉ n.val) :
    TauCeti.StarkSystems.rankUpper h.comparison r hr n q hq hqn
      ((higherDerivative E M r hr h h611 c).val (vertexInsert h.S n q hq)) =
    TauCeti.StarkSystems.rankLower h.comparison r hr n q hq hqn ((higherDerivative E M r hr h h611 c).val n) := sorry
-- Unit test: TauCeti.EulerSystems.higherDerivative_zero
example (E : EulerFactors T A) (M : R) (r : ℕ) (hr : 0 < r) (h : HigherDerivativeData E M r)
    (h611 : BSSHypothesis611 T A.p h.S.primes) :
    higherDerivative E M r hr h h611 0 = 0 := sorry
-- Unit test: TauCeti.EulerSystems.higherDerivative_needs_611
example (T : HigherRep K R) (e : T ≃ₗ[R] R) [Nontrivial R]
    (h : ∀ g x, T.ρ g x = x) (p : ℕ) (q : Prime K) : ¬ BSSHypothesis611 T p {q} := sorry
lemma higherDerivative_eval (E : EulerFactors T A) (M : R) (r : ℕ) (hr : 0 < r)
    (h : HigherDerivativeData E M r) (h611 : BSSHypothesis611 T A.p h.S.primes)
    (c : HigherEulerSystem E r) (n : Vertices h.S)
    (σ : ∀ q : n.val, gammaPrime K A.p q)
    (hσ : ∀ (q : n.val) (g : gammaPrime K A.p q), g ∈ Subgroup.zpowers (σ q)) :
    higherSelmerInclusion E M r h n ((higherDerivative E M r hr h h611 c).val n) =
      correctedHigherAmbient E M r h c n σ hσ := sorry
lemma higherDerivative_indep (E : EulerFactors T A) (M : R) (r : ℕ)
    (h : HigherDerivativeData E M r) (c : HigherEulerSystem E r) (n : Vertices h.S)
    (σ τ : ∀ q : n.val, gammaPrime K A.p q)
    (hσ : ∀ (q : n.val) (g : gammaPrime K A.p q), g ∈ Subgroup.zpowers (σ q))
    (hτ : ∀ (q : n.val) (g : gammaPrime K A.p q), g ∈ Subgroup.zpowers (τ q)) :
    correctedHigherAmbient E M r h c n σ hσ = correctedHigherAmbient E M r h c n τ hτ := sorry
example (E : EulerFactors T A) (M : R) (r : ℕ) (h : HigherDerivativeData E M r)
    (σ : ∀ q : (initialVertex h.S).val, gammaPrime K A.p q) :
    higherDerivativeOperator E M r h (initialVertex h.S) σ = 1 := sorry
end TauCeti.EulerSystems

namespace TauCeti.RubinStark
open TauCeti.KolyvaginSystems
variable {K : Type} [Field K] [NumberField K]
/-- A named abelian Galois carrier preserves the underlying canonical quotient group. -/
def AbelianGal (F : Layer K) := Layer.Gal K F
instance abelianGroup (F : Layer K) : Group (AbelianGal F) :=
  inferInstanceAs (Group (Layer.Gal K F))
instance abelianComm (F : Layer K) [IsMulCommutative (Layer.Gal K F)] : CommGroup (AbelianGal F) :=
  {__ := abelianGroup F, mul_comm := sorry}
instance abelianFinite (F : Layer K) : Fintype (AbelianGal F) :=
  inferInstanceAs (Fintype (Layer.Gal K F))
/-- Valuation dictionary from Mathlib's Dedekind-domain adic valuation; ord is additive. -/
def placeOrder {L : Type} [Field L] [NumberField L] (w : Prime L) : Lˣ →* Multiplicative ℤ := sorry
lemma placeOrder_valuation {L : Type} [Field L] [NumberField L] (w : Prime L) (u : Lˣ) :
    w.valuation L u.val = WithZero.coe (placeOrder w u)⁻¹ := sorry
/-- S and T here are FINITE primes. S is the set of designated split primes, whereas
S0 in the Stickelberger input also contains ramification and infinite places. -/
def modifiedUnits (F : Layer K) [IsMulCommutative (Layer.Gal K F)] (S T : Finset (Prime K)) : Subgroup F.fieldˣ :=
  {carrier := {u | (∀ w : Prime F.field, (∀ q ∈ S, w ∉ primesAbove F q) → placeOrder w u = 1) ∧
      ∀ q ∈ T, ∀ w ∈ primesAbove F q, w.valuation F.field (u.val-1) < 1},
    one_mem' := sorry, mul_mem' := sorry, inv_mem' := sorry}
/-- Arithmetic field action, imported through the infinite Galois dictionary. -/
def fieldAction (F : Layer K) [IsMulCommutative (Layer.Gal K F)] : AbelianGal F →* (F.field ≃ₐ[K] F.field) := sorry
def unitRepresentation (F : Layer K) [IsMulCommutative (Layer.Gal K F)] (S T : Finset (Prime K)) :
    Representation ℤ (AbelianGal F) (Additive (modifiedUnits F S T)) := sorry
lemma unitRepresentation_apply (F : Layer K) [IsMulCommutative (Layer.Gal K F)] (S T : Finset (Prime K)) (g : AbelianGal F)
    (u : Additive (modifiedUnits F S T)) :
    ((unitRepresentation F S T g u).toMul.val : F.field) = fieldAction F g u.toMul.val.val := sorry
abbrev UnitModule (F : Layer K) [IsMulCommutative (Layer.Gal K F)] (S T : Finset (Prime K)) := (unitRepresentation F S T).asModule
/-- Rationalization retains the FULL unit module before taking the minus part. -/
def rationalUnitRepresentation (F : Layer K) [IsMulCommutative (Layer.Gal K F)] (S T : Finset (Prime K)) :
    Representation ℚ (AbelianGal F) (ℚ ⊗[ℤ] Additive (modifiedUnits F S T)) := sorry
lemma rationalUnitRepresentation_pure (F : Layer K) [IsMulCommutative (Layer.Gal K F)] (S T : Finset (Prime K)) (g : AbelianGal F)
    (a : ℚ) (u : Additive (modifiedUnits F S T)) :
    rationalUnitRepresentation F S T g (a ⊗ₜ[ℤ] u) = a ⊗ₜ[ℤ] (unitRepresentation F S T g u) := sorry
abbrev RationalUnits (F : Layer K) [IsMulCommutative (Layer.Gal K F)] (S T : Finset (Prime K)) := (rationalUnitRepresentation F S T).asModule
/-- The CM extension, its actual conjugation, and the selected split primes. -/
structure Data (F : Layer K) [IsMulCommutative (Layer.Gal K F)] (S T : Finset (Prime K)) (r : ℕ) where
  positiveRank : 0 < r
  totallyReal : ∀ v : NumberField.InfinitePlace K, v.IsReal
  totallyImaginary : ∀ w : NumberField.InfinitePlace F.field, ¬ w.IsReal
  c : AbelianGal F
  conjugation : ∀ (w : F.field →+* ℂ) (x : F.field), w (fieldAction F c x) = star (w x)
  square : c^2 = 1
  nontrivial : c ≠ 1
  disjoint : Disjoint S T
  torsionFree : Module.IsTorsionFree ℤ (UnitModule F S T)
  v : Fin r → Prime K
  inS : ∀ i, v i ∈ S
  enumerates : Function.Bijective (fun i => (⟨v i,inS i⟩ : S))
  split : ∀ i, IsUnramifiedLayer F (v i) ∧ (frobenius K (v i)).val ∈ F.group
  w : Fin r → Prime F.field
  above : ∀ i, w i ∈ primesAbove F (v i)
variable {F : Layer K} [IsMulCommutative (Layer.Gal K F)] {S T : Finset (Prime K)} {r : ℕ}
abbrev RationalExterior (F : Layer K) [IsMulCommutative (Layer.Gal K F)] (S T : Finset (Prime K)) (r : ℕ) :=
  ⋀[MonoidAlgebra ℚ (AbelianGal F)]^r (RationalUnits F S T)
def minusExterior (D : Data F S T r) : Submodule (MonoidAlgebra ℚ (AbelianGal F)) (RationalExterior F S T r) :=
  LinearMap.ker ((MonoidAlgebra.of ℚ _ D.c) • LinearMap.id + LinearMap.id)
def minusGroupRing (D : Data F S T r) : Submodule (MonoidAlgebra ℚ (AbelianGal F)) (MonoidAlgebra ℚ (AbelianGal F)) :=
  LinearMap.ker ((MonoidAlgebra.of ℚ _ D.c) • LinearMap.id + LinearMap.id)
def rationalUnit (u : UnitModule F S T) : RationalUnits F S T :=
  (rationalUnitRepresentation F S T).asModuleEquiv.symm
    (1 ⊗ₜ[ℤ] (unitRepresentation F S T).asModuleEquiv u)
def equivariantOrder (D : Data F S T r) (j : Fin r) :
    RationalUnits F S T →ₗ[MonoidAlgebra ℚ (AbelianGal F)] MonoidAlgebra ℚ (AbelianGal F) := sorry
def actedUnit (g : AbelianGal F) (u : UnitModule F S T) : F.fieldˣ :=
  Units.map (fieldAction F g).toRingHom.toMonoidHom
    ((unitRepresentation F S T).asModuleEquiv u).toMul.val
lemma equivariantOrder_unit (D : Data F S T r) (j : Fin r) (u : UnitModule F S T) :
    equivariantOrder D j (rationalUnit u) = ∑ σ : AbelianGal F,
      MonoidAlgebra.single σ⁻¹ ((placeOrder (D.w j) (actedUnit σ u)).toAdd : ℚ) := sorry
def ordG (D : Data F S T r) : minusExterior D →ₗ[MonoidAlgebra ℚ (AbelianGal F)] minusGroupRing D := sorry
lemma ordG_ιMulti (D : Data F S T r) (u : Fin r → RationalUnits F S T)
    (hminus : exteriorPower.ιMulti _ r u ∈ minusExterior D) :
    (ordG D ⟨exteriorPower.ιMulti _ r u,hminus⟩).val = Matrix.det (fun i j => equivariantOrder D j (u i)) := sorry
lemma ordG_bijective (D : Data F S T r) : Function.Bijective (ordG D) := sorry
/-- Every integral group-ring functional is extended to rational scalars. -/
def rationalFunctional (φ : UnitModule F S T →ₗ[MonoidAlgebra ℤ (AbelianGal F)] MonoidAlgebra ℤ (AbelianGal F)) :
    RationalUnits F S T →ₗ[MonoidAlgebra ℚ (AbelianGal F)] MonoidAlgebra ℚ (AbelianGal F) := sorry
lemma rationalFunctional_unit (φ : UnitModule F S T →ₗ[MonoidAlgebra ℤ (AbelianGal F)] MonoidAlgebra ℤ (AbelianGal F))
    (u : UnitModule F S T) (g : AbelianGal F) : (rationalFunctional φ (rationalUnit u)).coeff g = ((φ u).coeff g : ℚ) := sorry
def determinantFunctional
    (φ : Fin r → (UnitModule F S T →ₗ[MonoidAlgebra ℤ (AbelianGal F)] MonoidAlgebra ℤ (AbelianGal F))) :
    RationalExterior F S T r →ₗ[MonoidAlgebra ℚ (AbelianGal F)] MonoidAlgebra ℚ (AbelianGal F) := sorry
lemma determinantFunctional_pure
    (φ : Fin r → (UnitModule F S T →ₗ[MonoidAlgebra ℤ (AbelianGal F)] MonoidAlgebra ℤ (AbelianGal F)))
    (u : Fin r → RationalUnits F S T) :
    determinantFunctional φ (exteriorPower.ιMulti _ r u) = Matrix.det (fun i j => rationalFunctional (φ i) (u j)) := sorry
/-- Integral bidual lattice, tested against the FULL integral unit dual. -/
def rubinLattice (D : Data F S T r) : Submodule ℤ (minusExterior D) :=
  {carrier := {x | ∀ φ : Fin r → (UnitModule F S T →ₗ[MonoidAlgebra ℤ (AbelianGal F)] MonoidAlgebra ℤ (AbelianGal F)),
      ∀ g, ∃ a : ℤ, (determinantFunctional φ x.val).coeff g = a},
    zero_mem' := sorry, add_mem' := sorry, smul_mem' := sorry}
/-- Θ is imported from IntegralIwasawaTheory I.7, including its partial-zeta definition.
It is a concrete minus group-ring element, not a presumed integral unit. -/
def rubinBrumerStark (D : Data F S T r) (Θ : minusGroupRing D) : minusExterior D :=
  (LinearEquiv.ofBijective (ordG D) (ordG_bijective D)).symm Θ
lemma ordG_rubinBrumerStark (D : Data F S T r) (Θ : minusGroupRing D) : ordG D (rubinBrumerStark D Θ) = Θ := sorry
def RubinConjecture (D : Data F S T r) (Θ : minusGroupRing D) : Prop := rubinBrumerStark D Θ ∈ rubinLattice D
lemma rubinBrumerStark_change_w (D D' : Data F S T r) (h : D.c = D'.c) (hv : D.v = D'.v)
    (Θ : minusGroupRing D) (Θ' : minusGroupRing D') (hΘ : Θ.val = Θ'.val) :
    ∃ g : AbelianGal F, (rubinBrumerStark D' Θ').val = MonoidAlgebra.of ℚ _ g • (rubinBrumerStark D Θ).val := sorry
lemma rubinConjecture_indep (D D' : Data F S T r) (hc : D.c = D'.c)
    (Θ : minusGroupRing D) (Θ' : minusGroupRing D') (hΘ : Θ.val = Θ'.val) :
    RubinConjecture D Θ ↔ RubinConjecture D' Θ' := sorry
-- Unit test: TauCeti.RubinStark.rubinBrumerStark_zero
example (D : Data F S T r) : rubinBrumerStark D 0 = 0 ∧ RubinConjecture D 0 := sorry
-- Unit test: TauCeti.RubinStark.rubinBrumerStark_unique
example (D : Data F S T r) (Θ : minusGroupRing D) (x : minusExterior D) (hx : ordG D x = Θ) :
    x = rubinBrumerStark D Θ := sorry
-- Unit test: TauCeti.RubinStark.rubinLattice_nonintegral_functional
example (D : Data F S T r) (x : minusExterior D)
    (φ : Fin r → (UnitModule F S T →ₗ[MonoidAlgebra ℤ (AbelianGal F)] MonoidAlgebra ℤ (AbelianGal F)))
    (g : AbelianGal F) (h : ∀ a : ℤ, (determinantFunctional φ x.val).coeff g ≠ a) : x ∉ rubinLattice D := sorry
-- Unit test: TauCeti.RubinStark.modifiedUnits_T_condition
example (D : Data F S T r) (u : F.fieldˣ) (q : Prime K) (hq : q ∈ T)
    (w : Prime F.field) (hw : w ∈ primesAbove F q) (h : 1 ≤ w.valuation F.field (u.val-1)) : u ∉ modifiedUnits F S T := sorry
example (u : F.fieldˣ) (h : ∀ w : Prime F.field, placeOrder w u = 1)
    (hT : ∀ q ∈ T, ∀ w ∈ primesAbove F q, w.valuation F.field (u.val-1)<1) : u ∈ modifiedUnits F ∅ T := sorry
example (u : F.fieldˣ) (w : Prime F.field) (hout : ∀ q ∈ S, w ∉ primesAbove F q)
    (h : placeOrder w u ≠ 1) : u ∉ modifiedUnits F S T := sorry
/-- Algebraic minus-lattice test: half of a determinant of two anti-invariant functionals
is integral over Z[C2], although a projector (1-c)/2 is not integral. -/
def c2 : Multiplicative (ZMod 2) := Multiplicative.ofAdd 1
-- Unit test: TauCeti.RubinStark.rubinLattice_half_determinant
example : ((1/2 : ℚ) • ((1-MonoidAlgebra.of ℚ _ c2)^2) :
    MonoidAlgebra ℚ (Multiplicative (ZMod 2))) = 1-MonoidAlgebra.of ℚ _ c2 := sorry
/-- Degree-one integral reflexivity of the full unit lattice, followed by the minus kernel. -/
lemma rubinLattice_rank_one (D : Data F S T 1) (x : minusExterior D) :
    x ∈ rubinLattice D ↔ ∃ u : UnitModule F S T,
      x.val = exteriorPower.ιMulti _ 1 (fun _ => rationalUnit u) := sorry
-- Unit test: TauCeti.RubinStark.rubinConjecture_not_projector
example : ¬ ∃ z : MonoidAlgebra ℤ (Multiplicative (ZMod 2)),
    ∀ g, ((z.coeff g : ℚ)) = ((1/2 : ℚ) • (1-MonoidAlgebra.of ℚ _ c2) : MonoidAlgebra ℚ (Multiplicative (ZMod 2))).coeff g := sorry
end TauCeti.RubinStark

namespace TauCeti.EulerSystems
open TauCeti.KolyvaginSystems
variable {K R : Type} [Field K] [NumberField K] [CommRing R] [TopologicalSpace R]
variable {T : GaloisRep K R} [Module.Free R T] [Module.Finite R T] {A : Tower T}
/-- Rubin IV.8.1: the difference polynomial is integral because |G_q| divides Nq-1. -/
def congruencePolynomial (E : EulerFactors T A) (q : Prime K) (hq : Sum.inr q ∉ A.bad) : R[X] := sorry
lemma congruencePolynomial_mul (E : EulerFactors T A) (q : Prime K) (hq : Sum.inr q ∉ A.bad) :
    C (Fintype.card (gammaPrime K A.p q) : R) * congruencePolynomial E q hq =
      E.poly T q hq - (E.poly T q hq).comp (C (primeNorm K q : R)*X) := sorry
/-- Classes on the ray-class layers are unramified away from p. -/
def RayFamilyUnramified (E : EulerFactors T A) (c : EulerSystem T E) (N : Conductor K) : Prop :=
  ∀ (n : Conductor K) (_ : Disjoint n N) (F : FiniteLayer A),
    F.val.group = (rayLayer K A.p n).group → ∀ w : Prime F.val.field,
      ¬ isAboveP A.p w → locAt T F.val (Sum.inr w) (c.val F) ∈
        unramified F.val.field R (layerRep T F.val) (Sum.inr w)
def RayFamilyCongruent (E : EulerFactors T A) (c : EulerSystem T E) (N : Conductor K) : Prop :=
  ∀ (n : Conductor K) (q : Prime K) (hq : q ∉ N) (_ : q ∉ n)
    (F F' : FiniteLayer A) (_ : F.val.group = (rayLayer K A.p n).group)
    (_ : F'.val.group = (rayLayer K A.p (insert q n)).group)
    (h : F'.val.group ≤ F.val.group) (w : Prime F'.val.field) (_ : w ∈ primesAbove F'.val q)
    (hbad : Sum.inr q ∉ A.bad),
    locAt T F'.val (Sum.inr w) (c.val F') = locAt T F'.val (Sum.inr w)
      (resAt T F.val F'.val h
        (aeval (cohomologyAction T F.val (QuotientGroup.mk (frobenius K q).val⁻¹))
          (congruencePolynomial E q hbad) (c.val F)))
/-- Rubin IX.1, pp.133–135: rigidity is a condition on a family, with three alternatives. -/
def IsRigid (E : EulerFactors T A) (c : EulerSystem T E) (N : Conductor K) : Prop :=
  Nonempty (InfiniteDirection T A) ∨
    (RayFamilyUnramified E c N ∧ ∃ γ : GK K, γ ∈ rubinHM A.p ∧
      Function.Injective ((T.ρ γ).toLinearMap-(LinearMap.id : Module.End R T))) ∨
    (RayFamilyUnramified E c N ∧
      (∀ q : Prime K, q ∉ N → ∀ k : ℕ,
        Function.Injective ((frobEnd T q)^(A.p^k)-(LinearMap.id : Module.End R T))) ∧ RayFamilyCongruent E c N)
-- Unit test: IsRigid.of_admissible
example (E : EulerFactors T A) (h : IsAdmissibleTower T A) (c : EulerSystem T E) (N : Conductor K) : IsRigid E c N := sorry
-- Unit test: not_isRigid_failed_unramified
example (E : EulerFactors T A) (c : EulerSystem T E) (N : Conductor K)
    (ha : IsEmpty (InfiniteDirection T A)) (hu : ¬ RayFamilyUnramified E c N) : ¬ IsRigid E c N := sorry
-- Unit test: IsRigid.of_injective_direction
example (E : EulerFactors T A) (c : EulerSystem T E) (N : Conductor K)
    (hu : RayFamilyUnramified E c N) (γ : GK K) (hγ : γ ∈ rubinHM A.p)
    (hi : Function.Injective ((T.ρ γ).toLinearMap-(LinearMap.id : Module.End R T))) : IsRigid E c N := sorry

/-- General cyclic character data for Rubin IX.4; no imaginary-quadratic specialization. -/
structure AnticyclotomicData (T : GaloisRep K R) (p : ℕ) [Fact p.Prime] where
  chi : GK K →* (PadicInt p)ˣ
  continuous : Continuous chi
  d : ℕ
  positive : 0 < d
  divides : d ∣ p-1
  order : orderOf chi = d
  base : Layer K
  baseSpec : base.group = chi.ker
  tower : Subgroup (GK K)
  normal : tower.Normal
  closed : IsClosed (tower : Set (GK K))
  overBase : tower ≤ base.group
  abelianOverBase : ∀ g h : base.group, g.val*h.val*g.val⁻¹*h.val⁻¹ ∈ tower
  proP : ∀ (F : Layer K) (_ : tower ≤ F.group) (h : F.group ≤ base.group),
    ∃ k, Fintype.card (relativeGal base F h) = p^k
  bad : Conductor K
  atP : ∀ q, isAboveP p q → q ∈ bad
  ramified : ∀ q, ¬ IsUnramified K R T (Sum.inr q) → q ∈ bad
  chiRamified : ∀ q, ¬ IsUnramifiedLayer base q → q ∈ bad
attribute [instance] AnticyclotomicData.normal
abbrev AntiLayer {p : ℕ} [Fact p.Prime] (D : AnticyclotomicData T p) :=
  {F : Layer K // D.tower ≤ F.group ∧ F.group ≤ D.base.group}
/-- χ acts by p-adic powering on the abelian pro-p relative Galois group. -/
def relativePadicPower {p : ℕ} [Fact p.Prime] (D : AnticyclotomicData T p)
    (g : D.base.group) (a : PadicInt p) : D.base.group ⧸ D.tower.subgroupOf D.base.group := sorry
lemma relativePadicPower_nat {p : ℕ} [Fact p.Prime] (D : AnticyclotomicData T p)
    (g : D.base.group) (n : ℕ) : relativePadicPower D g n = (QuotientGroup.mk g)^n := sorry
/-- The tower action is conjugation by GK, identified with multiplication by χ. -/
def HasChiAction {p : ℕ} [Fact p.Prime] (D : AnticyclotomicData T p) : Prop :=
  ∀ (σ : GK K) (g : D.base.group) (h : σ*g.val*σ⁻¹ ∈ D.base.group),
    QuotientGroup.mk (⟨σ*g.val*σ⁻¹,h⟩ : D.base.group) = relativePadicPower D g (D.chi σ : PadicInt p)
/-- Character part of ray extensions over K', with modulus formed from primes of K. -/
def antiRayLayer {p : ℕ} [Fact p.Prime] (D : AnticyclotomicData T p) (n : Conductor K) : Layer K := sorry
def AntiRayContract {p : ℕ} [Fact p.Prime] (D : AnticyclotomicData T p) : Prop :=
  HasChiAction D ∧ ∀ q ∉ D.bad, D.tower ≤ (antiRayLayer D {q}).group
/-- The norm family is based at K', but Euler factors are attached to primes of K. -/
def antiFactor {p : ℕ} [Fact p.Prime] [Algebra (PadicInt p) R]
    (D : AnticyclotomicData T p) (F F' : AntiLayer D) : Module.End R (HAt K R T F.val 1) := sorry
lemma antiFactor_formula {p : ℕ} [Fact p.Prime] [Algebra (PadicInt p) R]
    (D : AnticyclotomicData T p) (F F' : AntiLayer D) (m : ℕ) (q : Fin m → Prime K)
    (hq : Function.Injective q)
    (enumerates : ∀ v, v ∈ Set.range q ↔ v ∉ D.bad ∧ IsUnramifiedLayer F.val v ∧ ¬ IsUnramifiedLayer F'.val v)
    (u : Fin m → Rˣ) (hu : ∀ i, (u i : R) = primeNorm K (q i)) :
    antiFactor D F F' = (List.ofFn (fun i : Fin m =>
      Polynomial.eval₂ (algebraMap R (Module.End R (HAt K R T F.val 1)))
        (cohomologyAction T F.val (QuotientGroup.mk (frobenius K (q i)).val⁻¹))
        (eulerPoly T (q i) (u i) (hu i)))).prod := sorry
def AnticyclotomicNormFamily {p : ℕ} [Fact p.Prime] [Algebra (PadicInt p) R]
    (D : AnticyclotomicData T p) : Submodule R (∀ F : AntiLayer D, HAt K R T F.val 1) :=
  {carrier := {c | ∀ (F F' : AntiLayer D) (h : F'.val.group ≤ F.val.group), corAt T F.val F'.val h (c F') = antiFactor D F F' (c F)},
    zero_mem' := sorry, add_mem' := sorry, smul_mem' := sorry}
/-- The rigidity alternatives use the norm family itself. Their χ-adapted arithmetic
maps are the base-changed IV.8.1 congruence and K'(1)_χ root/unit fixed group. -/
def AntiUnramified {p : ℕ} [Fact p.Prime] [Algebra (PadicInt p) R]
    (D : AnticyclotomicData T p) (c : AnticyclotomicNormFamily D) : Prop :=
  ∀ (n : Conductor K) (F : AntiLayer D), F.val.group = (antiRayLayer D n).group → ∀ w : Prime F.val.field,
    ¬ isAboveP p w → locAt T F.val (Sum.inr w) (c.val F) ∈
      unramified F.val.field R (layerRep T F.val) (Sum.inr w)
def antiHM {p : ℕ} [Fact p.Prime] (D : AnticyclotomicData T p) : Subgroup (GK K) := sorry
lemma antiHM_spec {p : ℕ} [Fact p.Prime] (D : AnticyclotomicData T p) (g : GK K) :
    g ∈ antiHM D ↔ g ∈ (antiRayLayer D ∅).group ∧
      ∀ h : GK D.base.field, layerGalois D.base h = g → h ∈
        rootsGroup p none ⊓ unitsRootsGroup p none := sorry
/-- Cyclotomic character from the roots-of-unity action, imported from ProfiniteArithmetic. -/
def cyclotomicCharacter (K : Type) [Field K] [NumberField K] (p : ℕ) [Fact p.Prime] : GK K →* (PadicInt p)ˣ := sorry
structure AntiDirection {p : ℕ} [Fact p.Prime] (D : AnticyclotomicData T p) where
  group : Subgroup (GK K)
  normal : group.Normal
  closed : IsClosed (group : Set (GK K))
  between : D.tower ≤ group ∧ group ≤ D.base.group
  d : ℕ
  positive : 0 < d
  quotient : (D.base.group ⧸ group.subgroupOf D.base.group) ≃* Multiplicative (Fin d → PadicInt p)
  continuous : Continuous quotient
  inverseContinuous : Continuous quotient.symm
  nonsplit : ∀ w : Prime D.base.field, ¬ ((layerGalois D.base).comp
    (decomposition D.base.field (Sum.inr w)).subtype).range ≤ group
-- The congruence operator is the χ-ray version of congruencePolynomial and uses
-- (P_q(X)-P_q(Nq X))/[K'(q)_χ:K'(1)_χ], without division in the coefficient field.
def antiCongruenceOperator {p : ℕ} [Fact p.Prime] [Algebra (PadicInt p) R]
    (D : AnticyclotomicData T p) (F : AntiLayer D) (q : Prime K) : Module.End R (HAt K R T F.val 1) := sorry
def AntiCongruent {p : ℕ} [Fact p.Prime] [Algebra (PadicInt p) R]
    (D : AnticyclotomicData T p) (c : AnticyclotomicNormFamily D) : Prop :=
  ∀ (n : Conductor K) (q : Prime K) (F F' : AntiLayer D) (h : F'.val.group ≤ F.val.group), q ∉ D.bad → q ∉ n →
    F.val.group = (antiRayLayer D n).group → F'.val.group = (antiRayLayer D (insert q n)).group →
    ∀ w ∈ primesAbove F'.val q, locAt T F'.val (Sum.inr w) (c.val F') =
      locAt T F'.val (Sum.inr w) (resAt T F.val F'.val h (antiCongruenceOperator D F q (c.val F)))
def AntiRigid {p : ℕ} [Fact p.Prime] [Algebra (PadicInt p) R]
    (D : AnticyclotomicData T p) (c : AnticyclotomicNormFamily D) : Prop :=
  Nonempty (AntiDirection D) ∨ (AntiUnramified D c ∧ ∃ γ : GK K,
    cyclotomicCharacter K p γ = D.chi γ ∧ γ^D.d ∈ antiHM D ∧
    Function.Injective ((T.ρ γ).toLinearMap-(LinearMap.id : Module.End R T))) ∨
    (AntiUnramified D c ∧ (∀ q ∉ D.bad, ∀ k : ℕ,
      Function.Injective ((frobEnd T q)^(p^k)-(LinearMap.id : Module.End R T))) ∧ AntiCongruent D c)
/-- Rigidity is not a linear property: this type is a norm family with a proof. -/
def AnticyclotomicEulerSystem {p : ℕ} [Fact p.Prime] [Algebra (PadicInt p) R]
    (D : AnticyclotomicData T p) := {c : AnticyclotomicNormFamily D // AntiRigid D c}
def AnticyclotomicEulerSystem.of_trivial {p : ℕ} [Fact p.Prime] [Algebra (PadicInt p) R]
    (D : AnticyclotomicData T p) (hd : D.d = 1) (hD : AntiRayContract D)
    (E : EulerFactors T A) (hE : E.normalization = .rubin)
    (hbase : D.base = baseLayer K) (htower : D.tower = A.subgroup)
    (hbad : ∀ q, q ∈ D.bad ↔ Sum.inr q ∈ A.bad)
    (c : EulerSystem T E) (hc : IsRigid E c D.bad) : AnticyclotomicEulerSystem D := sorry
example {p : ℕ} [Fact p.Prime] (D : AnticyclotomicData T p) (h : D.d = 1) : D.chi = 1 := sorry
example {p : ℕ} [Fact p.Prime] (D : AnticyclotomicData T p)
    (h : D.d = 2) (σ : GK K) : (D.chi σ)^2 = 1 := sorry
example {p : ℕ} [Fact p.Prime] [Algebra (PadicInt p) R] (D : AnticyclotomicData T p)
    (c : AnticyclotomicNormFamily D) (h : AntiRigid D c) : Nonempty (AnticyclotomicEulerSystem D) := sorry
end TauCeti.EulerSystems

namespace TauCeti.KolyvaginSystems
variable {K R : Type} [Field K] [NumberField K] [CommRing R] [TopologicalSpace R]
variable {T : Rep K R} [Module.Free R T] [Module.Finite R T] {S : SelmerTriple K R T} {p : ℕ}
namespace KolyvaginSystem
variable [IsLocalRing R]
abbrev divIndex (D : KolyvaginData T S p) (κ : KolyvaginSystem D) (i : ℕ) := partialInvariant D κ i
lemma divIndex_zero (D : KolyvaginData T S p) [IsDomain R] [IsDiscreteValuationRing R]
    [Module.Finite R S.F.selmer] (h : Module.IsTorsionFree R S.F.selmer) (κ : KolyvaginSystem D) :
    divIndex D κ 0 = ⊤ ↔ κ.val (initialVertex S) = 0 := sorry
abbrev divIndexInfty (D : KolyvaginData T S p) (κ : KolyvaginSystem D) := partialInfinity D κ
abbrev IsPrimitive (D : KolyvaginData T S p) (κ : KolyvaginSystem D) := TauCeti.KolyvaginSystems.IsPrimitive D κ
/-- Infinite minus infinite is not an elementary divisor; restrict to i≥ord κ. -/
def elementaryDivisor (D : KolyvaginData T S p) (κ : KolyvaginSystem D) (i : ℕ)
    (hi : KolyvaginSystem.ord D κ ≤ i) : ℕ∞ := divIndex D κ i - divIndex D κ (i+1)
lemma divIndex_smul [IsDomain R] [IsDiscreteValuationRing R] (D : KolyvaginData T S p)
    (π : R) (hπ : IsLocalRing.maximalIdeal R = Ideal.span {π}) (κ : KolyvaginSystem D) (i : ℕ)
    (hfree : ∀ n : Vertices S, n.val.card=i → Module.IsTorsionFree R (D.Stalk n)) :
    divIndex D (π • κ) i = divIndex D κ i + 1 := sorry
lemma not_isPrimitive_smul [IsDomain R] [IsDiscreteValuationRing R] (D : KolyvaginData T S p)
    (h : MR04Hypotheses T S p) (hr : latticeCoreRank T S.F = 1)
    (π : R) (hπ : IsLocalRing.maximalIdeal R = Ideal.span {π}) (κ : KolyvaginSystem D) :
    ¬ IsPrimitive D (π • κ) := sorry
/-- The source's artinian convention uses the length of the cyclic span, not an
ambient m-adic divisibility of an element of a nonfree stalk. -/
def artinianDivIndex (D : KolyvaginData T S p) (κ : KolyvaginSystem D) (i : ℕ) : ℕ∞ :=
  artinianPartialInvariant D κ i
lemma artinianDivIndex_zero [IsArtinianRing R] (D : KolyvaginData T S p) (i : ℕ)
    (hexists : ∃ n : Vertices S, n.val.card=i) : artinianDivIndex D 0 i = len R R := sorry
lemma ord_eq (D : KolyvaginData T S p) [IsDomain R] [IsDiscreteValuationRing R]
    (h : MR04Hypotheses T S p) (hr : latticeCoreRank T S.F = 1) (κ : KolyvaginSystem D) :
    KolyvaginSystem.ord D κ = ⨅ i ∈ {i : ℕ | divIndex D κ i < ⊤}, (i : ℕ∞) := sorry
lemma ord_eq_artinian (D : KolyvaginData T S p) [IsArtinianRing R] [IsPrincipalIdealRing R]
    (κ : KolyvaginSystem D) :
    KolyvaginSystem.ord D κ = ⨅ i ∈ {i : ℕ | artinianDivIndex D κ i < len R R}, (i : ℕ∞) := sorry
-- Unit test: divIndex_zero_order
example (D : KolyvaginData T S p) : KolyvaginSystem.ord D 0 = ⊤ := sorry
-- Unit test: divIndex_zero_artinian
example (D : KolyvaginData T S p) [IsArtinianRing R] (i : ℕ)
    (hi : ∃ n : Vertices S, n.val.card=i) : artinianDivIndex D 0 i = len R R := sorry
-- Unit test: divIndex_scaling
example [IsDomain R] [IsDiscreteValuationRing R] (D : KolyvaginData T S p)
    (π : R) (hπ : IsLocalRing.maximalIdeal R = Ideal.span {π}) (κ : KolyvaginSystem D)
    (hfree : ∀ n : Vertices S, n.val.card=0 → Module.IsTorsionFree R (D.Stalk n))
    (hκ : divIndex D κ 0 = 3) : divIndex D (π^2 • κ) 0 = 5 := sorry
end KolyvaginSystem
end TauCeti.KolyvaginSystems

namespace TauCeti.KolyvaginSystems
variable {K R : Type} [Field K] [NumberField K] [CommRing R] [TopologicalSpace R]
variable {T : Rep K R} [Module.Free R T] [Module.Finite R T] {S : SelmerTriple K R T} {p : ℕ}
/-- Normalize the tame factors, retaining their generators and actual edge maps. -/
structure DualEdgeDictionary (D : KolyvaginData T S p) where
  level : AtLevel S p
  tameGenerator : ∀ q : S.primes, tamePrime K p q.val
  generates : ∀ (q : S.primes) (g : tamePrime K p q.val),
    g ∈ AddSubgroup.zmultiples (tameGenerator q)
  edgeEquiv : ∀ n q hq, D.EdgeStalk n q hq ≃ₗ[R] singular T q
  value : ∀ (n : Vertices S) (q : S.primes), q.val ∈ n.val → D.Stalk n →ₗ[R] singular T q.val
  upper : ∀ n q hq hqn (x : D.Stalk (vertexInsert S n q hq)),
    value (vertexInsert S n q hq) ⟨q,hq⟩ (by sorry) x =
      edgeEquiv n q hq (edgeUpper D n q hq hqn x)
abbrev FiniteEdgeValues (n : Vertices S) := ∀ q : {q : S.primes // q.val ∈ n.val}, singular T q.val.val
/-- ψ_d includes edge values in the larger sum by zero outside d. -/
def edgeRelationMap (D : KolyvaginData T S p) (E : DualEdgeDictionary D)
    (d n : Vertices S) (h : d.val ⊆ n.val) : D.Stalk d →ₗ[R] FiniteEdgeValues (T := T) n :=
  {toFun := fun x q => if hq : q.val.val ∈ d.val then E.value d q.val hq x else 0,
    map_add' := sorry, map_smul' := sorry}
def finiteEdgeRelations (D : KolyvaginData T S p) (E : DualEdgeDictionary D)
    (κ : KolyvaginSystem D) (n : Vertices S) : Submodule R (FiniteEdgeValues (T := T) n) :=
  ⨆ (d : Vertices S) (h : d.val ⊆ n.val),
    Submodule.span R {edgeRelationMap D E d n h (κ.val d)}
abbrev finiteKolyvaginDualSelmer (D : KolyvaginData T S p) (E : DualEdgeDictionary D)
    (κ : KolyvaginSystem D) (n : Vertices S) := FiniteEdgeValues (T := T) n ⧸ finiteEdgeRelations D E κ n
def edgeExtension (m n : Vertices S) (h : m.val ⊆ n.val) :
    FiniteEdgeValues (T := T) m →ₗ[R] FiniteEdgeValues (T := T) n := sorry
lemma edgeExtension_apply (m n : Vertices S) (h : m.val ⊆ n.val)
    (x : FiniteEdgeValues (T := T) m) (q : {q : S.primes // q.val ∈ n.val}) :
    edgeExtension m n h x q = if hq : q.val.val ∈ m.val then x ⟨q.val,hq⟩ else 0 := sorry
def kolyvaginDualSelmer_map (D : KolyvaginData T S p) (E : DualEdgeDictionary D)
    (κ : KolyvaginSystem D) (m n : Vertices S) (h : m.val ⊆ n.val) :
    finiteKolyvaginDualSelmer D E κ m →ₗ[R] finiteKolyvaginDualSelmer D E κ n := sorry
lemma kolyvaginDualSelmer_map_mk (D : KolyvaginData T S p) (E : DualEdgeDictionary D)
    (κ : KolyvaginSystem D) (m n : Vertices S) (h : m.val ⊆ n.val)
    (x : FiniteEdgeValues (T := T) m) : kolyvaginDualSelmer_map D E κ m n h (Submodule.Quotient.mk x) =
      Submodule.Quotient.mk (edgeExtension m n h x) := sorry
/-- Direct sum presentation of the filtered colimit: all local edges, modulo the
images ψ_d(Rκ_d). This is not a union of torsion submodules of a Selmer group. -/
abbrev GlobalEdgeValues (S : SelmerTriple K R T) := Π₀ q : S.primes, singular T q.val
def globalEdgeExtension (n : Vertices S) : FiniteEdgeValues (T := T) n →ₗ[R] GlobalEdgeValues (T := T) S := sorry
lemma globalEdgeExtension_apply (n : Vertices S) (x : FiniteEdgeValues (T := T) n) (q : S.primes) :
    globalEdgeExtension n x q = if hq : q.val ∈ n.val then x ⟨q,hq⟩ else 0 := sorry
def globalEdgeRelations (D : KolyvaginData T S p) (E : DualEdgeDictionary D)
    (κ : KolyvaginSystem D) : Submodule R (GlobalEdgeValues (T := T) S) :=
  ⨆ d : Vertices S, Submodule.span R {globalEdgeExtension d
    (edgeRelationMap D E d d (Finset.Subset.refl _) (κ.val d))}
abbrev kolyvaginDualSelmer (D : KolyvaginData T S p) (E : DualEdgeDictionary D)
    (κ : KolyvaginSystem D) := GlobalEdgeValues (T := T) S ⧸ globalEdgeRelations D E κ
def finiteToGlobalDualSelmer (D : KolyvaginData T S p) (E : DualEdgeDictionary D)
    (κ : KolyvaginSystem D) (n : Vertices S) :
    finiteKolyvaginDualSelmer D E κ n →ₗ[R] kolyvaginDualSelmer D E κ := sorry
/-- Universal property of the colimit, with its actual transition maps. -/
theorem kolyvaginDualSelmer_colimit (D : KolyvaginData T S p) (E : DualEdgeDictionary D)
    (κ : KolyvaginSystem D) {M : Type} [AddCommGroup M] [Module R M]
    (f : ∀ n, finiteKolyvaginDualSelmer D E κ n →ₗ[R] M)
    (hf : ∀ m n h, (f n).comp (kolyvaginDualSelmer_map D E κ m n h) = f m) :
    ∃! g : kolyvaginDualSelmer D E κ →ₗ[R] M, ∀ n, g.comp (finiteToGlobalDualSelmer D E κ n) = f n := sorry
/-- The discrete character dual is imported from L2, with scalar action by precomposition. -/
abbrev CharacterDual (M : Type) [AddCommGroup M] := M →+ QZ
instance characterDualModule (M : Type) [AddCommGroup M] [Module R M] : Module R (CharacterDual M) := sorry
lemma characterDual_smul (M : Type) [AddCommGroup M] [Module R M]
    (a : R) (φ : CharacterDual M) (x : M) : (a • φ) x = φ (a • x) := sorry
/-- The canonical global-duality map has kernel the classes strict at every prime in P. -/
def dualSelmerToKolyvaginDual (D : KolyvaginData T S p) (E : DualEdgeDictionary D)
    (κ : KolyvaginSystem D) :
    (dualStructure T S.F).selmer →ₗ[R] CharacterDual (kolyvaginDualSelmer D E κ) := sorry
lemma ker_dualSelmerToKolyvaginDual (D : KolyvaginData T S p) (E : DualEdgeDictionary D)
    (κ : KolyvaginSystem D) :
    LinearMap.ker (dualSelmerToKolyvaginDual D E κ) =
      ⨅ q : S.primes, LinearMap.ker
        ((loc K R (dualRep T) (Sum.inr q.val)).comp (dualStructure T S.F).selmer.subtype) := sorry
lemma dualSelmerToKolyvaginDual_bijective [IsLocalRing R]
    (D : KolyvaginData T S p) (E : DualEdgeDictionary D) (κ : KolyvaginSystem D)
    (h : MR04Hypotheses T S p) (hR : PrincipalArtinian (R := R))
    (hr : latticeCoreRank T S.F = 1) (h4a : ResidualHomVanishing T)
    (hcoeff : CoefficientsFromGalois T p) (hκ : IsPrimitive D κ) :
    Function.Bijective (dualSelmerToKolyvaginDual D E κ) := sorry
-- Unit test: kolyvaginDualSelmer_one
example (D : KolyvaginData T S p) (E : DualEdgeDictionary D) (κ : KolyvaginSystem D) :
    Subsingleton (finiteKolyvaginDualSelmer D E κ (initialVertex S)) := sorry
-- Unit test: kolyvaginDualSelmer_zero_system
example (D : KolyvaginData T S p) (E : DualEdgeDictionary D) (n : Vertices S) :
    Nonempty (finiteKolyvaginDualSelmer D E 0 n ≃ₗ[R] FiniteEdgeValues (T := T) n) := sorry
/-- At one edge, multiplying a generator by π leaves the quotient R/(π), even when
an arithmetic dual Selmer group is zero; nonprimitivity prevents surjectivity. -/
-- Unit test: kolyvaginDualSelmer_scaled_edge
example [IsDomain R] [IsDiscreteValuationRing R] (π : R)
    (hπ : IsLocalRing.maximalIdeal R = Ideal.span {π}) :
    Nontrivial (R ⧸ Submodule.span R {π}) := sorry
end TauCeti.KolyvaginSystems

namespace TauCeti.KolyvaginSystems.CGLS
open TauCeti.EulerSystems
variable {K R : Type} [Field K] [NumberField K] [CommRing R] [TopologicalSpace R]
variable [IsDomain R] [IsDiscreteValuationRing R] {p : ℕ} [Fact p.Prime] [Algebra (PadicInt p) R]
variable (E : WeierstrassCurve ℚ) [E.IsElliptic]
abbrev Points (L : Type) [Field L] [Algebra ℚ L] := (E.baseChange L).toAffine.Point
/-- The integral Tate carrier is an inverse system of actual p^n-torsion points. -/
def TateCarrier : Submodule ℤ (∀ n : ℕ, Points E (SeparableClosure ℚ)) :=
  {carrier := {x | (∀ n, (p^n : ℕ) • x n = 0) ∧ ∀ n, p • x (n+1) = x n},
    zero_mem' := sorry, add_mem' := sorry, smul_mem' := sorry}
def tateRep (E : WeierstrassCurve ℚ) [E.IsElliptic] : Rep ℚ (PadicInt p) := sorry
def tateCarrierEquiv : tateRep (p := p) E ≃ₗ[ℤ] TateCarrier (p := p) E := sorry
/-- Scalar action and Galois action are pinned by the inverse system, not by an
uninterpreted module named T_p E. The point-map adapter comes from Mathlib. -/
def pointAction (g : GK ℚ) : Points E (SeparableClosure ℚ) →+ Points E (SeparableClosure ℚ) := sorry
lemma tateRep_action (g : GK ℚ) (x : tateRep (p := p) E) (n : ℕ) :
    (tateCarrierEquiv E ((tateRep E).ρ g x)).val n = pointAction E g ((tateCarrierEquiv E x).val n) := sorry
instance tateRep_free : Module.Free (PadicInt p) (tateRep (p := p) E) := sorry
instance tateRep_finite : Module.Finite (PadicInt p) (tateRep (p := p) E) := sorry
/- Imported elliptic-curve predicates use the curve itself; their model/reduction
constructions are supplied by HE.7, not new ES-owned elliptic geometry. -/
/-- HE.7's elliptic conductor, transported from the Artin conductor of T_l E.
This numeric import is used only through its source-defined conductor dictionary. -/
def ellipticConductor (E : WeierstrassCurve ℚ) [E.IsElliptic] : ℕ := sorry
def HasConductor (E : WeierstrassCurve ℚ) [E.IsElliptic] (N : ℕ) : Prop := ellipticConductor E=N
def GoodOrdinaryReduction (E : WeierstrassCurve ℚ) [E.IsElliptic] (p : ℕ) : Prop :=
  ∃ (W : WeierstrassCurve ℤ) (C : WeierstrassCurve.VariableChange ℚ),
    E = C • W.baseChange ℚ ∧ (W.baseChange (ZMod p)).Δ ≠ 0 ∧
      ¬ (p : ℤ) ∣ ((p+1 : ℤ)-(Nat.card (W.baseChange (ZMod p)).toAffine.Point : ℤ))
/-- Γ is the actual anticyclotomic Z_p quotient of GK. -/
structure Parameters where
  quadratic : SelfDual.ImaginaryQuadraticData K
  N : ℕ
  conductor : HasConductor E N
  positiveN : 0 < N
  primeTo : Nat.Coprime p (2*N)
  ordinary : GoodOrdinaryReduction E p
  discriminantPrimeTo : Nat.Coprime (Int.natAbs (NumberField.discr K)) (N*p)
  noPTorsion : ∀ x : Points E K, p • x = 0 → x = 0
  rankR : Module.Finite (PadicInt p) R
  freeR : Module.Free (PadicInt p) R
  gamma : GK K →* Multiplicative (PadicInt p)
  gammaSurj : Function.Surjective gamma
  gammaContinuous : Continuous gamma
  conjugate : ∀ g, gamma (quadratic.conjugation g) = (gamma g)⁻¹
  alpha : Multiplicative (PadicInt p) →* Rˣ
  continuousAlpha : Continuous alpha
  residualOne : ∀ g, (alpha g : R)-1 ∈ IsLocalRing.maximalIdeal R
  nontrivialAlpha : alpha ≠ 1
  generator : Multiplicative (PadicInt p)
  topGenerator : Dense (Subgroup.zpowers generator : Set (Multiplicative (PadicInt p)))
/-- Tα is the restriction of T_pE tensored with R and twisted by α∘γ. -/
def twistedTate (D : Parameters (K := K) (R := R) (p := p) E) : Rep K R := sorry
def twistedTateEquiv (D : Parameters (K := K) (R := R) (p := p) E) :
    twistedTate E D ≃ₗ[R] (R ⊗[PadicInt p] tateRep (p := p) E) := sorry
lemma twistedTate_action (D : Parameters (K := K) (R := R) (p := p) E) (g : GK K) (x : twistedTate E D) :
    twistedTateEquiv E D ((twistedTate E D).ρ g x) = (D.alpha (D.gamma g) : R) •
      TensorProduct.map LinearMap.id ((tateRep E).ρ (D.quadratic.restriction g)).toLinearMap
        (twistedTateEquiv E D x) := sorry
instance twistedTate_free (D : Parameters (K := K) (R := R) (p := p) E) : Module.Free R (twistedTate E D) := sorry
instance twistedTate_finite (D : Parameters (K := K) (R := R) (p := p) E) : Module.Finite R (twistedTate E D) := sorry
/-- Ordinary filtration is ker(T_pE→T_pẼ), imported from the good reduction input. -/
def ordinaryFiltration (D : Parameters (K := K) (R := R) (p := p) E)
    (q : Prime K) (hq : isAboveP p q) : TopRep R (decomposition K (Sum.inr q)) := sorry
def filtrationInclusion (D : Parameters (K := K) (R := R) (p := p) E)
    (q : Prime K) (hq : isAboveP p q) : ordinaryFiltration E D q hq ⟶
      localRep K R (rationalRep (twistedTate E D)) (Sum.inr q) := sorry
def ordinaryStructure (D : Parameters (K := K) (R := R) (p := p) E) : SelmerStructure K R (twistedTate E D) := sorry
lemma ordinaryStructure_condition (D : Parameters (K := K) (R := R) (p := p) E) (q : Prime K) :
    (ordinaryStructure E D).condition (Sum.inr q) = if hq : isAboveP p q then
      (LinearMap.range ((TauCeti.ContinuousCohomology.coeffMap (filtrationInclusion E D q hq) 1).hom.toLinearMap)).comap
        (TauCeti.ContinuousCohomology.coeffMap
          (TopRep.resFunctor (decomposition K (Sum.inr q)).subtype |>.map (rationalMap (twistedTate E D))) 1).hom.toLinearMap
    else finiteLatticeCondition (twistedTate E D) (Sum.inr q) := sorry
/-- Rational Frobenius trace controls the inert-prime set aℓ=ℓ+1=0 mod p. -/
def frobeniusTrace (E : WeierstrassCurve ℚ) [E.IsElliptic] (ell : ℕ) : ℤ := sorry
def errorPrimes (D : Parameters (K := K) (R := R) (p := p) E) : Set (Prime K) :=
  {q | ∃ ell : ℕ, SelfDual.IsInertPrime D.quadratic ell q ∧ ell ≠ p ∧
      p ∣ ell+1 ∧ (p : ℤ) ∣ frobeniusTrace E ell ∧ ¬ ((ell : ℤ) ∣ (D.N : ℤ))}
/-- C1 measures scalar homotheties on GK∞; C2 the integral endomorphism image.
The ideal minima below do not impose residual irreducibility. -/
def scalarHomothety (D : Parameters (K := K) (R := R) (p := p) E) (u : (PadicInt p)ˣ) : Prop :=
  ∃ g : GK K, D.gamma g=1 ∧ ∀ x : tateRep (p := p) E,
    (tateRep E).ρ (D.quadratic.restriction g) x = (u : PadicInt p) • x
def integralImage : Submodule (PadicInt p) (Module.End (PadicInt p) (tateRep (p := p) E)) :=
  Submodule.span (PadicInt p) {f | ∃ g : GK ℚ, f = ((tateRep E).ρ g).toLinearMap}
def scalarValuation (u : (PadicInt p)ˣ) : ℕ∞ := sorry
lemma scalarValuation_spec (u : (PadicInt p)ˣ) (j : ℕ) :
    j ≤ scalarValuation (p := p) u ↔ (u : PadicInt p)-1 ∈ Ideal.span {(p : PadicInt p)^j} := sorry
def C1 (D : Parameters (K := K) (R := R) (p := p) E) : ℕ := sorry
def C2 (D : Parameters (K := K) (R := R) (p := p) E) : ℕ := sorry
lemma C1_minimum (D : Parameters (K := K) (R := R) (p := p) E) :
    (C1 E D : ℕ∞) = ⨅ (u : (PadicInt p)ˣ) (_ : scalarHomothety E D u), scalarValuation (p := p) u := sorry
lemma C2_minimum (D : Parameters (K := K) (R := R) (p := p) E) :
    C2 E D = sInf {m : ℕ | Ideal.span {(p : PadicInt p)^m} •
      (⊤ : Submodule (PadicInt p) (Module.End (PadicInt p) (tateRep (p := p) E))) ≤ integralImage (p := p) E} := sorry
def pValuation (p : ℕ) (x : R) : ℚ := sorry
def CAlpha (D : Parameters (K := K) (R := R) (p := p) E) : ℚ :=
  if D.alpha = D.alpha⁻¹ then 0 else pValuation p ((D.alpha D.generator : R)-(D.alpha D.generator⁻¹ : R))
def descentError (D : Parameters (K := K) (R := R) (p := p) E) : ℕ := sorry
/-- CGLS Theorem 3.2.1, p.17. Nonzero leading class gives rank one and a length
bound with a constant fixed by the curve, coefficient degree and α. -/
theorem howard_descent_with_errors (D : Parameters (K := K) (R := R) (p := p) E)
    (S : SelmerTriple K R (twistedTate E D)) (hF : S.F = ordinaryStructure E D)
    (hP : S.primes = errorPrimes E D) (KS : SelfDual.InertData (twistedTate E D) S p)
    (κ : SelfDual.KolyvaginSystem KS) (hκ : κ.val (initialVertex S) ≠ 0) :
    Module.Free R S.F.selmer ∧ Module.finrank R S.F.selmer = 1 ∧
      ∃ (M : Type) (_ : AddCommGroup M) (_ : Module R M), Module.length R M ≠ ⊤ ∧
        Nonempty ((SelfDual.discreteStructure _ S.F).selmer ≃ₗ[R]
          ((FractionRing R ⧸ LinearMap.range (Algebra.linearMap R (FractionRing R))) × M × M)) ∧
        Module.length R M ≤ Module.length R (S.F.selmer ⧸ Submodule.span R {(SelfDual.stalkOne KS) (κ.val (initialVertex S))}) + descentError E D := sorry
/-- CGLS Proposition 3.3.2 gives a common parity on all n and all finite levels. -/
theorem weak_cassels_uniform (D : Parameters (K := K) (R := R) (p := p) E)
    (S : SelmerTriple K R (twistedTate E D)) (hF : S.F = ordinaryStructure E D)
    (hP : S.primes = errorPrimes E D) (KS : SelfDual.InertData (twistedTate E D) S p) :
    ∃ ε : ℕ, ε ≤ 1 ∧ ∀ k : ℕ, 0 < k → ∀ n : Vertices S,
      SelfDual.inertConductorIdeal KS n ≤ IsLocalRing.maximalIdeal R^k → ∃ (M : Type) (_ : AddCommGroup M) (_ : Module R M),
        Module.length R M ≠ ⊤ ∧ Nonempty
          ((propagatedStructure (quotientRep _ (SelfDual.inertConductorIdeal KS n)) (SelfDual.modified KS n)
            (IsLocalRing.maximalIdeal R^k)).selmer ≃ₗ[R]
              ((Fin ε → R ⧸ IsLocalRing.maximalIdeal R^k) × M × M)) := sorry
example (D : Parameters (K := K) (R := R) (p := p) E) (x : Points E K) (hx : p • x = 0) : x = 0 := sorry
example (D : Parameters (K := K) (R := R) (p := p) E) (g : Multiplicative (PadicInt p)) :
    IsLocalRing.residue R (D.alpha g : R) = 1 := sorry
example (D : Parameters (K := K) (R := R) (p := p) E) : 2 < p := sorry
end TauCeti.KolyvaginSystems.CGLS

namespace TauCeti.KolyvaginSystems.Nekovar
open _root_.AlgebraicGeometry
variable {F K H L O : Type} [Field F] [NumberField F] [Field K] [NumberField K]
variable [Field H] [NumberField H] [Field L] [NumberField L]
variable [Algebra F K] [Algebra K H] [Algebra F H] [IsScalarTower F K H] [IsGalois K H]
variable [CommRing O] [TopologicalSpace O] [IsDomain O] [IsDiscreteValuationRing O]
/-- Rational points of the existing abelian variety, represented by actual sections. -/
abbrev Points (A : TauCeti.AlgebraicGeometry.AbelianVariety H) :=
  Over.mk (𝟙 (Spec (.of H))) ⟶ A.toOver
instance pointsAddComm (A : TauCeti.AlgebraicGeometry.AbelianVariety H) : AddCommGroup (Points A) := sorry
/-- The HE.7 geometry predicates of Nekovář §3.1, the §5.19 isogeny and condition (*)
are stated in the packet. Their supplier carrier is not yet expressible in this
pin and is omitted here, as PROTOCOL §13 requires. No opaque Prop replaces it.
`all_prime_error_descent` below prototypes the arithmetic output once that exact
HE.7 setting is supplied; its displayed parameters alone are not sufficient
hypotheses for the mathematical theorem. -/
structure Parameters where
  Aj : TauCeti.AlgebraicGeometry.AbelianVariety F
  A : TauCeti.AlgebraicGeometry.AbelianVariety H
  y : Points A
  beta : (H ≃ₐ[K] H) →* (NumberField.RingOfIntegers L)ˣ
  faithful : Function.Injective beta
  totallyReal : ∀ v : NumberField.InfinitePlace F, v.IsReal
  imaginary : ∀ v : NumberField.InfinitePlace K, ¬ v.IsReal
  quadratic : Module.finrank F K = 2
  prime : Prime L
  coefficientMap : (NumberField.RingOfIntegers L) →+* O
  localMap : ∀ a : NumberField.RingOfIntegers L,
    coefficientMap a ∈ IsLocalRing.maximalIdeal O ↔ a ∈ prime.asIdeal
  coefficientCompletion : Nonempty (O ≃+* AdicCompletion prime.asIdeal (NumberField.RingOfIntegers L))
  uniformizer : O
  uniformizerSpec : IsLocalRing.maximalIdeal O = Ideal.span {uniformizer}
/- Integral group action, Kummer maps and coefficients are HE.7/L2 suppliers. -/
variable (D : Parameters (F := F) (K := K) (H := H) (L := L) (O := O))
def pointModule : Type := O ⊗[ℤ] Points D.A
instance pointModuleAddComm : AddCommGroup (pointModule D) := inferInstanceAs (AddCommGroup (O ⊗[ℤ] Points D.A))
instance pointModuleModule : Module O (pointModule D) := inferInstanceAs (Module O (O ⊗[ℤ] Points D.A))
def pointAction : Representation O (H ≃ₐ[K] H) (pointModule D) := sorry
def betaPart : Submodule O (pointModule D) :=
  {carrier := {x | ∀ g, pointAction D g x = D.coefficientMap (D.beta g : NumberField.RingOfIntegers L) • x},
    zero_mem' := sorry, add_mem' := sorry, smul_mem' := sorry}
def betaPoint : betaPart D := sorry
/-- The source uses the integral sum eβ=Σ β(σ)⁻¹σ, without division by the group order. C5 accounts for its square eβ²=[H:K]eβ. -/
lemma betaPoint_formula : (betaPoint D).val = ∑ g : H ≃ₐ[K] H,
    D.coefficientMap (D.beta g⁻¹ : NumberField.RingOfIntegers L) • pointAction D g (1 ⊗ₜ[ℤ] D.y) := sorry
def NonTorsionBetaPoint : Prop := ∀ a : O, a ≠ 0 → a • betaPoint D ≠ 0
/-- Actual π^M-torsion points inside A(Hbar), via the O_L action supplied by §5.19. -/
abbrev geometricPoints := Points (D.A.baseChange (SeparableClosure H))
instance geometricOLModule : Module (NumberField.RingOfIntegers L) (geometricPoints D) := sorry
def torsionPoints (M : ℕ) : Submodule (NumberField.RingOfIntegers L) (geometricPoints D) :=
  {carrier := {x | ∀ a ∈ D.prime.asIdeal^M, a • x=0},
    zero_mem' := sorry, add_mem' := sorry, smul_mem' := sorry}
instance torsionPointsO (M : ℕ) : Module O (torsionPoints D M) := sorry
lemma torsionPoints_scalar (M : ℕ) (a : NumberField.RingOfIntegers L) (x : torsionPoints D M) :
    ((D.coefficientMap a) • x).val = a • x.val := sorry
def geometricAction (g : GK H) : geometricPoints D →+ geometricPoints D := sorry
def torsionRep (D : Parameters (F := F) (K := K) (H := H) (L := L) (O := O)) (M : ℕ) : Rep H O := sorry
def torsionRepEquiv (M : ℕ) : torsionRep D M ≃ₗ[O] torsionPoints D M := sorry
lemma torsionRep_action (M : ℕ) (g : GK H) (x : torsionRep D M) :
    (torsionRepEquiv D M ((torsionRep D M).ρ g x)).val =
      geometricAction D g (torsionRepEquiv D M x).val := sorry
example (x : torsionPoints D 0) : x=0 := sorry
example (M : ℕ) (x : torsionPoints D M) (a : NumberField.RingOfIntegers L)
    (ha : a ∈ D.prime.asIdeal^M) : a • x.val=0 := sorry
def classicalSelmer (M : ℕ) : SelmerStructure H O (torsionRep D M) := sorry
def cohomologyAction (M : ℕ) : Representation O (H ≃ₐ[K] H) (classicalSelmer D M).selmer := sorry
def betaSelmer (M : ℕ) : Submodule O (classicalSelmer D M).selmer :=
  {carrier := {x | ∀ g, cohomologyAction D M g x = D.coefficientMap (D.beta g : NumberField.RingOfIntegers L) • x},
    zero_mem' := sorry, add_mem' := sorry, smul_mem' := sorry}
def kummer (M : ℕ) : betaPart D →ₗ[O] betaSelmer D M := sorry
/-- Fixed error constants. C0: point divisibility; C1: local components; C2:
restriction kernel; C3: image/order conductor; C4: β/β⁻¹ overlap; C5: ord𝔭[H:K];
C6: ord𝔭degϕ. They are defined by those arithmetic data, independent of M. -/
def C0 (D : Parameters (F := F) (K := K) (H := H) (L := L) (O := O)) : ℕ := sorry
def C1 (D : Parameters (F := F) (K := K) (H := H) (L := L) (O := O)) : ℕ := sorry
def C2 (D : Parameters (F := F) (K := K) (H := H) (L := L) (O := O)) : ℕ := sorry
def C3 (D : Parameters (F := F) (K := K) (H := H) (L := L) (O := O)) : ℕ := sorry
def C4 (D : Parameters (F := F) (K := K) (H := H) (L := L) (O := O)) : ℕ := sorry
def valuation (D : Parameters (F := F) (K := K) (H := H) (L := L) (O := O)) (a : O) : ℕ := sorry
def C5 : ℕ := valuation D (Module.finrank K H : O)
def isogenyDegree (D : Parameters (F := F) (K := K) (H := H) (L := L) (O := O)) : ℕ := sorry
def C6 : ℕ := valuation D (isogenyDegree D : O)
def errorConstant : ℕ :=
  if D.beta^2=1 then 2*C0 D+2*C1 D+4*C2 D+4*C3 D+C5 D+C6 D+21*valuation D 2
  else 4*C0 D+4*C1 D+7*C2 D+7*C3 D+5*C4 D+2*C5 D+2*C6 D+38*valuation D 2
def leadingClass (M : ℕ) : betaSelmer D M := D.uniformizer^(C1 D) • kummer D M (betaPoint D)
/-- Conditional arithmetic descent: the geometry and noncommutative pairing inputs
are supplied by HE.7 and CA.7; ES.4 proves the two-prime descent. -/
theorem all_prime_error_descent (hy : NonTorsionBetaPoint D) :
    ∃ M0 : ℕ, ∀ M ≥ M0, ∀ x : betaSelmer D M,
      D.uniformizer^(errorConstant D) • x ∈ Submodule.span O {leadingClass D M} := sorry
/-- Finiteness for α/α⁻¹ and full Sha is the HE.7 application of this theorem.
The ES interface above deliberately returns a uniform annihilator bound. -/
lemma errorConstant_quadratic (h : D.beta^2=1) :
    errorConstant D = 2*C0 D+2*C1 D+4*C2 D+4*C3 D+C5 D+C6 D+21*valuation D 2 := sorry
lemma errorConstant_nonquadratic (h : D.beta^2≠1) :
    errorConstant D = 4*C0 D+4*C1 D+7*C2 D+7*C3 D+5*C4 D+2*C5 D+2*C6 D+38*valuation D 2 := sorry
example (h0 : C0 D=0) (h1 : C1 D=0) (h2 : C2 D=0) (h3 : C3 D=0)
    (h4 : C4 D=0) (h5 : C5 D=0) (h6 : C6 D=0) (hdyadic : valuation D 2=0) : errorConstant D=0 := sorry
example (hβ : D.beta^2=1) (h2 : valuation D 2=1) : 21 ≤ errorConstant D := sorry
example (hβ : D.beta^2≠1) (h2 : valuation D 2=1) : 38 ≤ errorConstant D := sorry
end TauCeti.KolyvaginSystems.Nekovar

namespace TauCeti.RubinStark.ClassGroups
open TauCeti.KolyvaginSystems TauCeti.EulerSystems TauCeti.StarkSystems
open scoped DirectSum
variable {K O : Type} [Field K] [NumberField K] [CommRing O] [TopologicalSpace O]
variable [IsDomain O] [IsDiscreteValuationRing O] {p : ℕ} [Fact p.Prime] [Algebra (PadicInt p) O]
/-- BSS II §7 data: the character is faithful on its defining finite abelian field,
prime to p, with coefficient order generated by its values. The cyclotomic and
Teichmüller characters below are the arithmetic characters supplied by CFT/L6. -/
structure CharacterData where
  L : Layer K
  abelian : IsMulCommutative (Layer.Gal K L)
  chi : Layer.Gal K L →* Oˣ
  faithful : Function.Injective chi
  primeTo : Nat.Coprime (Fintype.card (Layer.Gal K L)) p
  finiteO : Module.Finite (PadicInt p) O
  freeO : Module.Free (PadicInt p) O
  generated : Algebra.adjoin (PadicInt p) (Set.range (fun g => (chi g : O))) = ⊤
  archSplit : ∀ v : NumberField.InfinitePlace K, decomposition K (Sum.inl v) ≤ L.group
  nontrivial : chi ≠ 1
  S : Finset (Place K)
  infinity : ∀ v : NumberField.InfinitePlace K, Sum.inl v ∈ S
  ramification : ∀ q : Prime K, ¬ IsUnramifiedLayer L q → Sum.inr q ∈ S
  extraPlace : Fintype.card (NumberField.InfinitePlace K) < S.card
  pNonSplit : ∀ q : Prime K, isAboveP p q → ¬ decomposition K (Sum.inr q) ≤ L.group
variable (D : CharacterData (K := K) (O := O) (p := p))
def absoluteCharacter : GK K →* Oˣ := D.chi.comp (QuotientGroup.mk' D.L.group)
def cyclotomicCharacter : GK K →* (PadicInt p)ˣ := sorry
/-- Its reduction is the Teichmüller lift of the mod-p cyclotomic character. -/
def teichmullerCharacter (p : ℕ) [Fact p.Prime] : GK K →* Oˣ := sorry
lemma teichmullerCharacter_residue (g : GK K) :
    IsLocalRing.residue O (teichmullerCharacter (K := K) (O := O) p g : O) =
      IsLocalRing.residue O (algebraMap (PadicInt p) O (TauCeti.RubinStark.ClassGroups.cyclotomicCharacter (K := K) (p := p) g : PadicInt p)) := sorry
/-- Tχ=O(1)⊗χ⁻¹, with its actual one-dimensional carrier and Galois formula. -/
def characterRep (D : CharacterData (K := K) (O := O) (p := p)) : TauCeti.KolyvaginSystems.Rep K O := sorry
def characterRepEquiv : characterRep D ≃ₗ[O] O := sorry
lemma characterRep_action (g : GK K) (x : characterRep D) :
    characterRepEquiv D ((characterRep D).ρ g x) =
      algebraMap (PadicInt p) O (TauCeti.RubinStark.ClassGroups.cyclotomicCharacter (K := K) (p := p) g : PadicInt p) *
        ((absoluteCharacter D g)⁻¹).val * characterRepEquiv D x := sorry
instance characterRep_free : Module.Free O (characterRep D) := sorry
instance characterRep_finite : Module.Finite O (characterRep D) := sorry
/-- The ideal class group is Mathlib's actual fractional-ideal quotient. -/
abbrev IntegralClassGroup := Additive (ClassGroup (NumberField.RingOfIntegers D.L.field))
abbrev ClassModule := O ⊗[ℤ] IntegralClassGroup D
def classAction : Representation O (Layer.Gal K D.L) (ClassModule D) := sorry
/-- Transport of ideals by the field automorphism supplies this action; no Selmer
bound occurs in its definition. -/
def classTransport (g : Layer.Gal K D.L) : IntegralClassGroup D →+ IntegralClassGroup D := sorry
lemma classAction_pure (g : Layer.Gal K D.L) (a : O) (x : IntegralClassGroup D) :
    classAction D g (a ⊗ₜ[ℤ] x) = a ⊗ₜ[ℤ] classTransport D g x := sorry
/-- χ-part over the full integral class group, before comparison with p-integers. -/
def chiClassGroup : Submodule O (ClassModule D) :=
  {carrier := {x | ∀ g, classAction D g x = (D.chi g : O) • x},
    zero_mem' := sorry, add_mem' := sorry, smul_mem' := sorry}
def primeClass (q : Prime D.L.field) : IntegralClassGroup D :=
  Additive.ofMul (ClassGroup.mk0 ⟨q.asIdeal,by sorry⟩)
def pPrimeClasses : Submodule O (ClassModule D) :=
  Submodule.span O {x | ∃ q : Prime D.L.field, isAboveP p q ∧ x = 1 ⊗ₜ[ℤ] primeClass D q}
/-- The p-integer class group is the quotient by the classes of primes over p. -/
def pIntegerClassModule := ClassModule D ⧸ pPrimeClasses D
instance pIntegerAdd : AddCommGroup (pIntegerClassModule D) := inferInstanceAs (AddCommGroup (ClassModule D ⧸ pPrimeClasses D))
instance pIntegerModule : Module O (pIntegerClassModule D) := inferInstanceAs (Module O (ClassModule D ⧸ pPrimeClasses D))
def pIntegerAction : Representation O (Layer.Gal K D.L) (pIntegerClassModule D) := sorry
def chiPIntegerClassGroup : Submodule O (pIntegerClassModule D) :=
  {carrier := {x | ∀ g, pIntegerAction D g x = (D.chi g : O) • x},
    zero_mem' := sorry, add_mem' := sorry, smul_mem' := sorry}
def classGroupProjection : chiClassGroup D →ₗ[O] chiPIntegerClassGroup D := sorry
lemma classGroupProjection_apply (x : chiClassGroup D) :
    (classGroupProjection D x).val = Submodule.Quotient.mk x.val := sorry
lemma classGroupProjection_bijective : Function.Bijective (classGroupProjection D) := sorry
/-- §7, equation (14): the canonical dual Selmer character dual is the p-integer
class module. The p-nonsplitting hypothesis then restores the full class group. -/
def canonical (D : CharacterData (K := K) (O := O) (p := p)) : SelmerStructure K O (characterRep D) := sorry
lemma canonical_condition (v : Place K) : (canonical D).condition v =
    if (∃ q : Prime K, v = Sum.inr q ∧ isAboveP p q) then ⊤ else finiteLatticeCondition (characterRep D) v := sorry
def dualSelmerClassEquiv : CharacterDual (dualStructure (characterRep D) (canonical D)).selmer ≃ₗ[O]
    chiPIntegerClassGroup D := sorry
/-- The admitted tower is the sufficiently large abelian pro-p extension of §6.7. -/
structure ApplicationData where
  tower : Tower (characterRep D)
  admissible : IsAdmissibleTower (characterRep D) tower
  factors : EulerFactors (characterRep D) tower
  rubinNormalization : factors.normalization = .rubin
  notTeich : absoluteCharacter D ≠ teichmullerCharacter (K := K) (O := O) p
  smallPrime : 3 < p ∨ (absoluteCharacter D)^2 ≠ teichmullerCharacter (K := K) (O := O) p
  h61 : BSSHypothesis61 tower
  h611 : BSSHypothesis611 (characterRep D) p {q | Sum.inr q ∉ D.S}
variable (A : ApplicationData D)
abbrev archRank := Fintype.card (NumberField.InfinitePlace K)
/-- Component ideals of the higher Kolyvagin derivative, in the inverse limit over
all positive moduli. The L6 limit/Fitting dictionary is part of the supplier contract. -/
def componentIdeal (D : CharacterData (K := K) (O := O) (p := p)) (A : ApplicationData D) (c : HigherEulerSystem A.factors (archRank (K := K))) (i : ℕ) : Ideal O := sorry
def allEulerIdeal (i : ℕ) : Ideal O := ⨆ c : HigherEulerSystem A.factors (archRank (K := K)), componentIdeal D A c i
/-- BSS II Theorem 7.1(i), without a Rubin–Stark or Leopoldt assumption. -/
theorem class_group_fitting_bound (i : ℕ) : allEulerIdeal D A i ≤ fittingIdeal (chiClassGroup D) i := sorry
/-- Additional finite-place nonsplitting hypothesis of Theorem 7.1(ii). -/
def NoFiniteSplit : Prop := ∀ q : Prime K, Sum.inr q ∈ D.S → ¬ decomposition K (Sum.inr q) ≤ D.L.group
theorem class_group_fitting_equality (hS : NoFiniteSplit D) (i : ℕ) :
    allEulerIdeal D A i = fittingIdeal (chiClassGroup D) i := sorry
lemma allEulerIdeal_mono (hS : NoFiniteSplit D) : Monotone (allEulerIdeal D A) := sorry
/-- The successive quotient is I_(i+1)/I_i, retaining that direction. -/
def idealSuccessor (hS : NoFiniteSplit D) (i : ℕ) : Submodule O (allEulerIdeal D A (i+1)) :=
  {carrier := {x | x.val ∈ allEulerIdeal D A i},
    zero_mem' := sorry, add_mem' := sorry, smul_mem' := sorry}
theorem class_group_structure (hS : NoFiniteSplit D) : Nonempty
    (chiClassGroup D ≃ₗ[O] (⨁ i : ℕ, ((allEulerIdeal D A (i+1)) ⧸ idealSuccessor D A hS i))) := sorry
/-- Rational scalar extension of the three L6 integral transfer maps. -/
def rationalCorestriction (F F' : FiniteLayer A.tower)
    (h : F'.val.group ≤ F.val.group) :
    FractionRing O ⊗[O] HigherStalk A.tower (archRank (K := K)) F' →ₗ[O]
      FractionRing O ⊗[O] ExpandedStalk A.tower (archRank (K := K)) F F' :=
  TensorProduct.map (LinearMap.id : Module.End O (FractionRing O))
    (higherCorestriction A.tower (archRank (K := K)) F F' h)
def rationalExpansion (F F' : FiniteLayer A.tower)
    (h : F'.val.group ≤ F.val.group) :
    FractionRing O ⊗[O] HigherStalk A.tower (archRank (K := K)) F →ₗ[O]
      FractionRing O ⊗[O] ExpandedStalk A.tower (archRank (K := K)) F F' :=
  TensorProduct.map (LinearMap.id : Module.End O (FractionRing O))
    (expandBidual A.tower (archRank (K := K)) F F' h)
def rationalFactor (F F' : FiniteLayer A.tower) :
    Module.End O (FractionRing O ⊗[O] ExpandedStalk A.tower (archRank (K := K)) F F') :=
  TensorProduct.map (LinearMap.id : Module.End O (FractionRing O))
    (higherFactor A.factors (archRank (K := K)) F F')
/- I.7 Part II supplies rationality, the ordered archimedean regulator identity
and unit/Kummer transports. The regulator condition cannot yet be stated in this
pin and is omitted, as PROTOCOL §13 requires. These elements are input data;
there is no unconditional function turning complex L-values into p-adic classes. -/
set_option maxHeartbeats 4000000 in
structure RationalRubinStarkData where
  element : ∀ F : FiniteLayer A.tower, FractionRing O ⊗[O]
    HigherStalk A.tower (archRank (K := K)) F
  norm : ∀ (F F' : FiniteLayer A.tower) (h : F'.val.group ≤ F.val.group),
    rationalCorestriction D A F F' h (element F') =
      rationalFactor D A F F' (rationalExpansion D A F F' h (element F))
variable (η : RationalRubinStarkData D A)
def analyticElement (F : FiniteLayer A.tower) := η.element F
/-- This finite-level integrality predicate is the arithmetic consequence of
Conjecture B′ at every LF/K, for the analytic family supplied above. -/
def RubinStarkFamily : Prop := ∀ F : FiniteLayer A.tower,
    analyticElement D A η F ∈ LinearMap.range
      (TensorProduct.mk O (FractionRing O) (HigherStalk A.tower (archRank (K := K)) F) 1)
def rubinStarkEulerSystem (hRS : RubinStarkFamily D A η) : HigherEulerSystem A.factors (archRank (K := K)) := sorry
lemma rubinStarkEulerSystem_eval (hRS : RubinStarkFamily D A η) (F : FiniteLayer A.tower) :
    1 ⊗ₜ[O] (rubinStarkEulerSystem D A η hRS).val F = analyticElement D A η F := sorry
/-- ηχ's image ideal is computed after the L6 rank-r integral bidual dictionary. -/
def initialRubinStarkImage (hRS : RubinStarkFamily D A η) : Ideal O := sorry
lemma initialRubinStarkImage_formula (hRS : RubinStarkFamily D A η) :
    initialRubinStarkImage D A η hRS = componentIdeal D A (rubinStarkEulerSystem D A η hRS) 0 := sorry
theorem rubin_stark_class_group_bound (hRS : RubinStarkFamily D A η) :
    initialRubinStarkImage D A η hRS ≤ fittingIdeal (chiClassGroup D) 0 := sorry
example (x : ClassModule D) (g : Layer.Gal K D.L)
    (h : classAction D g x ≠ (D.chi g : O) • x) : x ∉ chiClassGroup D := sorry
example (x : chiClassGroup D) (hx : classGroupProjection D x = 0) : x = 0 := sorry
example (i : ℕ) (hS : NoFiniteSplit D) :
    allEulerIdeal D A i ≤ allEulerIdeal D A (i+1) := sorry
end TauCeti.RubinStark.ClassGroups

namespace TauCeti.KolyvaginSystems
open TauCeti.EulerSystems
variable {K R : Type} [Field K] [NumberField K] [CommRing R] [TopologicalSpace R]
variable {T : Rep K R} [Module.Free R T] [Module.Finite R T]
variable {S : SelmerTriple K R T} {p : ℕ}

/-- The representation hypotheses H.0–H.4, separated from the prime-set and
local-condition hypotheses which do not pass to arbitrary quotients unchanged. -/
structure MR04BasicHypotheses (T : Rep K R) (p : ℕ) [IsLocalRing R] where
  rational : Nonempty (K ≃+* ℚ)
  prime : p.Prime
  residueChar : CharP (IsLocalRing.ResidueField R) p
  finiteResidue : Finite (IsLocalRing.ResidueField R)
  noetherian : IsNoetherianRing R
  complete : IsAdicComplete (IsLocalRing.maximalIdeal R) R
  free : Module.Free R T
  finite : Module.Finite R T
  continuous : IsContinuous K R T
  irreducible : ResiduallyAbsolutelyIrreducible T
  tau : GK K
  fixesRoots : tau ∈ rootsGroup p none
  coinvariants : RankOneCoinvariants T tau
  h1 : H1ImageVanishing T (MR04SplittingGroup T p)
    (splitting_le_residual T p) (splitting_le_residual_dual T p)
  homOrLarge : ResidualHomVanishing T ∨ 4 < p

def reducedTriple (S : SelmerTriple K R T) (I : Ideal R) :
    SelmerTriple K (R ⧸ I) (reducedRep T I) := sorry
lemma reducedTriple_primes (I : Ideal R) : (reducedTriple S I).primes = S.primes := sorry
lemma reducedTriple_condition (I : Ideal R) (v : Place K) :
    (reducedTriple S I).F.condition v = (reducedStructure T S.F I).condition v := sorry

/-- Finite principal-artinian duality makes the Cartier dual a lattice over the
same coefficient ring. No such triple is constructed for the discrete DVR dual. -/
def finiteDualTriple [IsLocalRing R] [IsArtinianRing R] [IsPrincipalIdealRing R]
    (S : SelmerTriple K R T) : SelmerTriple K R (dualRep T) := sorry
lemma finiteDualTriple_condition [IsLocalRing R] [IsArtinianRing R] [IsPrincipalIdealRing R]
    (v : Place K) : (finiteDualTriple S).F.condition v = orthogonal T v (S.F.condition v) := sorry
def MR04Hypotheses.dual [IsLocalRing R] [IsArtinianRing R] [IsPrincipalIdealRing R]
    (h : MR04Hypotheses T S p) : MR04Hypotheses (dualRep T) (finiteDualTriple S) p := sorry
def MR04Hypotheses.quotient [IsLocalRing R] (h : MR04Hypotheses T S p)
    (I : Ideal R) [IsLocalRing (R ⧸ I)] :
    MR04BasicHypotheses (reducedRep T I) p := sorry
lemma MR04Hypotheses.quotient_cartesian [IsLocalRing R] [IsArtinianRing R]
    [IsPrincipalIdealRing R] (h : MR04Hypotheses T S p) (i : ℕ) (hi : 0 < i) :
    IsCartesianStructure (reducedRep T (IsLocalRing.maximalIdeal R^i))
      (reducedTriple S (IsLocalRing.maximalIdeal R^i)).F := sorry
lemma MR04Hypotheses.of_rank_one [IsLocalRing R] (e : T ≃ₗ[R] R) :
    ResiduallyAbsolutelyIrreducible T ∧ RankOneCoinvariants T 1 := sorry

/-- Positive quotients retain H.1–H.6; H.7 is still a separate admissibility condition. -/
def MR16Hypotheses.quotient [IsLocalRing R] [IsDomain R] [IsDiscreteValuationRing R]
    {r : ℕ} (h : MR16Hypotheses T S p r) (i : ℕ) (hi : 0 < i)
    [IsLocalRing (R ⧸ IsLocalRing.maximalIdeal R^i)] :
    MR16Hypotheses (reducedRep T (IsLocalRing.maximalIdeal R^i))
      (reducedTriple S (IsLocalRing.maximalIdeal R^i)) p r := sorry
def MR16Hypotheses.of_mr04 [IsLocalRing R] [IsDomain R] [IsDiscreteValuationRing R]
    (h : MR04Hypotheses T S p) (hp : 2 < p) (r : ℕ)
    (hr : latticeCoreRankInt T S.F = r) (hpos : 0 < r)
    (L : Layer K) (hL : HMGroup p none ≤ L.group)
    (hP : frobeniusPrimes T S L h.tau ⊆ S.primes) : MR16Hypotheses T S p r := sorry

/-- The ramification statement compares inertia in K(q) with the relative group
over K(1); K(1) itself need not be trivial. -/
lemma rayPExtension_ramification (p : ℕ) [Fact p.Prime] (q : Prime K)
    (hq : ¬ isAboveP p q) :
    (∀ l : Prime K, l ≠ q → IsUnramifiedLayer (rayLayer K p {q}) l) ∧
    (∀ g : GK K, g ∈ (rayLayer K p ∅).group →
      ∃ i : inertia K (Sum.inr q), QuotientGroup.mk g =
        (QuotientGroup.mk i.val.val : Layer.Gal K (rayLayer K p {q}))) := sorry
lemma tameGroup_tensor_free [IsLocalRing R] [IsPrincipalIdealRing R]
    (n : Vertices S) :
    Module.Free (R ⧸ conductorIdeal T p n.val)
      ((R ⧸ conductorIdeal T p n.val) ⊗[ℤ] tameGroup K p n.val) ∧
    Module.finrank (R ⧸ conductorIdeal T p n.val)
      ((R ⧸ conductorIdeal T p n.val) ⊗[ℤ] tameGroup K p n.val) =
        if conductorIdeal T p n.val = ⊤ then 0 else 1 := sorry
lemma conductorIdeal_rat [IsLocalRing R] [IsPrincipalIdealRing R]
    (hK : Nonempty (K ≃+* ℚ)) (q : Prime K) (j : ℕ)
    (hcoin : Nonempty ((T ⧸ (LinearMap.range (frobEnd T q-LinearMap.id) ⊔
      (IsLocalRing.maximalIdeal R^j • (⊤ : Submodule R T)))) ≃ₗ[R]
        (R ⧸ IsLocalRing.maximalIdeal R^j))) :
    primeConductorIdeal T p q ≤ IsLocalRing.maximalIdeal R^j ↔
      conductorIdeal04 T q ≤ IsLocalRing.maximalIdeal R^j := sorry
lemma mem_kolyvaginPrimes_of_frobenius [IsLocalRing R]
    (L : Layer K) (τ : GK K) (k : ℕ)
    (hP : frobeniusPrimes T S L τ ⊆ S.primes)
    (hI : ∀ q ∈ frobeniusPrimes T S L τ,
      primeConductorIdeal T p q ≤ IsLocalRing.maximalIdeal R^k)
    (q : Prime K) (hq : q ∈ frobeniusPrimes T S L τ) :
    q ∈ kolyvaginPrimes T S p k := sorry

/-- Rubin's set imposes principal splitting, divisibility of the tame degree,
and annihilation of the Euler polynomial at 1. -/
def rubinPrimes {A : Tower T} (E : EulerFactors T A) (F : FiniteLayer A) (M : R) : Set (Prime K) :=
  {q | ∃ hq : Sum.inr q ∉ A.bad,
    (frobenius K q).val ∈ (auxiliaryLayer F ∅).group ∧
    (Fintype.card (gammaPrime K A.p q) : R) ∈ Ideal.span {M} ∧
    (E.poly T q hq).eval 1 ∈ Ideal.span {M}}
lemma mem_rubinPrimes_of_frobenius {A : Tower T} (E : EulerFactors T A)
    (F : FiniteLayer A) (M : R) (L : Layer K) (τ : GK K) (k : ℕ)
    (hL : L.group ≤ (auxiliaryLayer F ∅).group ⊓
      rootsGroup A.p (some k) ⊓ unitsRootsGroup A.p (some k) ⊓
      representationKernel (quotientRep T (Ideal.span {M})))
    (hτ : τ ∈ (auxiliaryLayer F ∅).group ⊓ rootsGroup A.p none ⊓ unitsRootsGroup A.p none)
    (hcoin : Nontrivial (T ⧸ (LinearMap.range ((T.ρ τ).toLinearMap-LinearMap.id) ⊔
      (Ideal.span {M} • (⊤ : Submodule R T)))))
    (hE : E.normalization = .rubin) (hM : M=(A.p^k : R))
    (q : Prime K) (hq : q ∈ frobeniusPrimes T S L τ) : q ∈ rubinPrimes E F M := sorry

/-- Scalar trivialization of a cyclic tame factor. It is chosen by a generator,
not used in the intrinsic tensor-valued comparison. -/
def tameGeneratorEquiv [IsLocalRing R] {q : Prime K} (I : Ideal R)
    (σ : gammaPrime K p q) (hσ : ∀ g, g ∈ Subgroup.zpowers σ)
    (hkill : (Fintype.card (gammaPrime K p q) : R) ∈ I) :
    ((R ⧸ I) ⊗[ℤ] tamePrime K p q) ≃ₗ[R ⧸ I] R ⧸ I := sorry
lemma tameGeneratorEquiv_pure [IsLocalRing R] {q : Prime K} (I : Ideal R)
    (σ : gammaPrime K p q) (hσ : ∀ g, g ∈ Subgroup.zpowers σ)
    (hkill : (Fintype.card (gammaPrime K p q) : R) ∈ I) (a : R ⧸ I) :
    tameGeneratorEquiv I σ hσ hkill (a ⊗ₜ[ℤ] Additive.ofMul σ) = a := sorry

/-- Stub freeness is over the smaller quotient, not over the original artinian R. -/
lemma stubSheaf_stalk_free [IsLocalRing R] (D : KolyvaginData T S p)
    (h : MR04Hypotheses T S p) (hR : PrincipalArtinian (R := R))
    (hP : AtLevel S p) (hr : 0 < latticeCoreRank T S.F) (n : Vertices S)
    (hn : dualSelmerLength D n < len R R) :
    Nonempty ((stubSheaf D).stalk n ≃ₗ[R]
      (Fin (latticeCoreRank T S.F) → R ⧸
        IsLocalRing.maximalIdeal R^(len R R-dualSelmerLength D n))) := sorry

/-- Reindexing respects squarefree conductors and insertion of primes. -/
def stalkReindex {T' : Rep K R} [Module.Free R T'] [Module.Finite R T']
    {S' : SelmerTriple K R T'} {D' : KolyvaginData T' S' p}
    {n m : Vertices S'} (h : n = m) : D'.Stalk n ≃ₗ[R] D'.Stalk m := by
  subst m
  exact LinearEquiv.refl _ _
structure SystemMorphism {T' : Rep K R} [Module.Free R T'] [Module.Finite R T']
    {S' : SelmerTriple K R T'} (D : KolyvaginData T S p) (D' : KolyvaginData T' S' p) where
  primes : S.primes = S'.primes
  vertices : Vertices S ≃ Vertices S'
  conductor : ∀ n, (vertices n).val = n.val
  insertEq : ∀ n q hq, vertices (vertexInsert S n q hq) =
    vertexInsert S' (vertices n) q (primes ▸ hq)
  stalk : ∀ n, D.Stalk n →ₗ[R] D'.Stalk (vertices n)
  edge : ∀ n q hq, D.EdgeStalk n q hq →ₗ[R]
    D'.EdgeStalk (vertices n) q (primes ▸ hq)
  upper : ∀ n q hq hqn x, edge n q hq (edgeUpper D n q hq hqn x) =
    edgeUpper D' (vertices n) q (primes ▸ hq) (by simpa only [conductor] using hqn)
      (stalkReindex (insertEq n q hq) (stalk (vertexInsert S n q hq) x))
  lower : ∀ n q hq hqn x, edge n q hq (edgeLower D n q hq hqn x) =
    edgeLower D' (vertices n) q (primes ▸ hq) (by simpa only [conductor] using hqn)
      (stalk n x)
def KolyvaginSystem.map {T' : Rep K R} [Module.Free R T'] [Module.Finite R T']
    {S' : SelmerTriple K R T'} {D : KolyvaginData T S p} {D' : KolyvaginData T' S' p}
    (f : SystemMorphism D D') : KolyvaginSystem D →ₗ[R] KolyvaginSystem D' := sorry
lemma KolyvaginSystem.map_eval {T' : Rep K R} [Module.Free R T'] [Module.Finite R T']
    {S' : SelmerTriple K R T'} {D : KolyvaginData T S p} {D' : KolyvaginData T' S' p}
    (f : SystemMorphism D D') (κ : KolyvaginSystem D) (n : Vertices S) :
    (KolyvaginSystem.map f κ).val (f.vertices n) = f.stalk n (κ.val n) := sorry
end TauCeti.KolyvaginSystems

namespace TauCeti.KolyvaginSystems
variable {K R : Type} [Field K] [NumberField K] [CommRing R] [TopologicalSpace R]
/-- Maps are induced by the same coefficient morphism on local continuous H¹. -/
def localFiniteMap (T T' : TauCeti.KolyvaginSystems.Rep K R) (f : T ⟶ T') (q : Prime K) :
    unramified K R T (Sum.inr q) →ₗ[R] unramified K R T' (Sum.inr q) := sorry
lemma localFiniteMap_val (T T' : TauCeti.KolyvaginSystems.Rep K R) (f : T ⟶ T') (q : Prime K)
    (x : unramified K R T (Sum.inr q)) : (localFiniteMap T T' f q x).val =
      (TauCeti.ContinuousCohomology.coeffMap
        (TopRep.resFunctor (decomposition K (Sum.inr q)).subtype |>.map f) 1).hom x.val := sorry
def localSingularMap (T T' : TauCeti.KolyvaginSystems.Rep K R) (f : T ⟶ T') (q : Prime K) :
    singular T q →ₗ[R] singular T' q := sorry
lemma localSingularMap_mk (T T' : TauCeti.KolyvaginSystems.Rep K R) (f : T ⟶ T') (q : Prime K)
    (x : LocalH K R T (Sum.inr q) 1) : localSingularMap T T' f q (Submodule.Quotient.mk x) =
      Submodule.Quotient.mk ((TauCeti.ContinuousCohomology.coeffMap
        (TopRep.resFunctor (decomposition K (Sum.inr q)).subtype |>.map f) 1).hom x) := sorry
def localSingularTensorMap (T T' : TauCeti.KolyvaginSystems.Rep K R) (f : T ⟶ T') (p : ℕ) (q : Prime K) :
    (singular T q ⊗[ℤ] tamePrime K p q) →ₗ[R] (singular T' q ⊗[ℤ] tamePrime K p q) := sorry
lemma localSingularTensorMap_pure (T T' : TauCeti.KolyvaginSystems.Rep K R) (f : T ⟶ T') (p : ℕ) (q : Prime K)
    (x : singular T q) (g : tamePrime K p q) : localSingularTensorMap T T' f p q (x ⊗ₜ[ℤ] g) =
      localSingularMap T T' f q x ⊗ₜ[ℤ] g := sorry
lemma finiteSingular_map (T T' : TauCeti.KolyvaginSystems.Rep K R) [Module.Free R T] [Module.Finite R T]
    [Module.Free R T'] [Module.Finite R T'] {p : ℕ} {q : Prime K}
    (D : LocalTameData T p q) (D' : LocalTameData T' p q) (f : T ⟶ T')
    (hT : IsContinuous K R T) (hT' : IsContinuous K R T')
    (hP : ((frobEnd T q).charpoly.reverse).eval 1 = 0)
    (hP' : ((frobEnd T' q).charpoly.reverse).eval 1 = 0)
    (hpoly : (frobEnd T q).charpoly = (frobEnd T' q).charpoly) :
    (localSingularTensorMap T T' f p q).comp
      (finiteSingular T D hT hP) = (finiteSingular T' D' hT' hP').comp (localFiniteMap T T' f q) := sorry
/-- A generator identifies the intrinsic tensor target with the scalar singular side. -/
def singularGeneratorEquiv (T : TauCeti.KolyvaginSystems.Rep K R) {p : ℕ} {q : Prime K}
    (σ : gammaPrime K p q) (hσ : ∀ g, g ∈ Subgroup.zpowers σ)
    (hkill : (Fintype.card (gammaPrime K p q) : R)=0) :
    (singular T q ⊗[ℤ] tamePrime K p q) ≃ₗ[R] singular T q := sorry
lemma singularGeneratorEquiv_pure (T : TauCeti.KolyvaginSystems.Rep K R) {p : ℕ} {q : Prime K}
    (σ : gammaPrime K p q) (hσ : ∀ g, g ∈ Subgroup.zpowers σ)
    (hkill : (Fintype.card (gammaPrime K p q) : R)=0) (x : singular T q) :
    singularGeneratorEquiv T σ hσ hkill (x ⊗ₜ[ℤ] Additive.ofMul σ) = x := sorry
def finiteSingular_generator (T : TauCeti.KolyvaginSystems.Rep K R) [Module.Free R T] [Module.Finite R T]
    {p : ℕ} {q : Prime K} (D : LocalTameData T p q) (hT : IsContinuous K R T)
    (hP : ((frobEnd T q).charpoly.reverse).eval 1 = 0)
    (σ : gammaPrime K p q) (hσ : ∀ g, g ∈ Subgroup.zpowers σ)
    (hkill : (Fintype.card (gammaPrime K p q) : R)=0) :
    unramified K R T (Sum.inr q) →ₗ[R] singular T q :=
  (singularGeneratorEquiv T σ hσ hkill).toLinearMap.comp (finiteSingular T D hT hP)
lemma SelmerTriple.dual_modify [IsLocalRing R] [IsArtinianRing R] [IsPrincipalIdealRing R]
    {T : TauCeti.KolyvaginSystems.Rep K R} [Module.Free R T] [Module.Finite R T] (S : SelmerTriple K R T)
    (a b c : Conductor K) (hab : Disjoint a b) (hac : Disjoint a c) (hbc : Disjoint b c)
    (hc : c ∈ S.conductors) (p : ℕ) (D : ∀ q : c, LocalTameData T p q)
    (D' : ∀ q : c, LocalTameData (dualRep T) p q)
    (he : ∀ q, (D q).extension = (D' q).extension) :
    dualStructure T (S.modify a b c hab hac hbc hc p D) =
      (finiteDualTriple S).modify b a c hab.symm hbc hac (by sorry) p D' := sorry
lemma SelmerTriple.modify_isCartesian [IsLocalRing R] [IsArtinianRing R] [IsPrincipalIdealRing R]
    {T : TauCeti.KolyvaginSystems.Rep K R} [Module.Free R T] [Module.Finite R T] (S : SelmerTriple K R T)
    (a b c : Conductor K) (hab : Disjoint a b) (hac : Disjoint a c) (hbc : Disjoint b c)
    (ha : a ∈ S.conductors) (hb : b ∈ S.conductors) (hc : c ∈ S.conductors)
    (p : ℕ) (D : ∀ q : c, LocalTameData T p q) (hF : IsCartesianStructure T S.F)
    (h1 : ∀ q ∈ a ∪ b ∪ c,
      Nonempty ((T ⧸ LinearMap.range (frobEnd T q-LinearMap.id)) ≃ₗ[R] R)) :
    IsCartesianStructure T (S.modify a b c hab hac hbc hc p D) := sorry
end TauCeti.KolyvaginSystems

namespace TauCeti.EulerSystems
open TauCeti.KolyvaginSystems
variable {K R : Type} [Field K] [NumberField K] [CommRing R] [TopologicalSpace R]
variable {T : TauCeti.KolyvaginSystems.Rep K R} [Module.Free R T] [Module.Finite R T] {A : Tower T}
/-- Restriction to a smaller abelian extension uses the same bad support and polynomials. -/
structure TowerRestriction (A B : Tower T) where
  subgroup : A.subgroup ≤ B.subgroup
  bad : A.bad=B.bad
  prime : A.p=B.p
def restrictFactors (E : EulerFactors T A) {B : Tower T} (h : TowerRestriction A B) : EulerFactors T B := sorry
def includedLayer {B : Tower T} (h : TowerRestriction A B) (F : FiniteLayer B) : FiniteLayer A := ⟨F.val,h.subgroup.trans F.property⟩
def EulerSystem.restrictTower (E : EulerFactors T A) {B : Tower T} (h : TowerRestriction A B) :
    EulerSystem T E →ₗ[R] EulerSystem T (restrictFactors E h) := sorry
lemma EulerSystem.restrictTower_eval (E : EulerFactors T A) {B : Tower T}
    (h : TowerRestriction A B) (c : EulerSystem T E) (F : FiniteLayer B) :
    (EulerSystem.restrictTower E h c).val F = c.val (includedLayer h F) := sorry
variable (R' : Type) [CommRing R'] [TopologicalSpace R'] [Algebra R R']
def scalarRep (T : TauCeti.KolyvaginSystems.Rep K R) : TauCeti.KolyvaginSystems.Rep K R' := sorry
def scalarRepEquiv (T : TauCeti.KolyvaginSystems.Rep K R) : scalarRep R' T ≃ₗ[R'] (R' ⊗[R] T) := sorry
lemma scalarRep_action (T : TauCeti.KolyvaginSystems.Rep K R) (g : GK K) (t : scalarRep R' T) :
    scalarRepEquiv R' T ((scalarRep R' T).ρ g t) =
      TensorProduct.map LinearMap.id (T.ρ g).toLinearMap (scalarRepEquiv R' T t) := sorry
instance scalarRep_free (T : TauCeti.KolyvaginSystems.Rep K R) [Module.Free R T] : Module.Free R' (scalarRep R' T) := sorry
instance scalarRep_finite (T : TauCeti.KolyvaginSystems.Rep K R) [Module.Finite R T] : Module.Finite R' (scalarRep R' T) := sorry
def scalarTower (A : Tower T) : Tower (scalarRep R' T) := sorry
lemma scalarTower_group (A : Tower T) : (scalarTower R' A).subgroup=A.subgroup := sorry
lemma scalarTower_bad (A : Tower T) : (scalarTower R' A).bad=A.bad := sorry
def scalarFactors (E : EulerFactors T A) : EulerFactors (scalarRep R' T) (scalarTower R' A) := sorry
lemma scalarFactors_poly (E : EulerFactors T A) (q : Prime K) (hq : Sum.inr q ∉ A.bad) :
    (scalarFactors R' E).poly _ q (by simpa only [scalarTower_bad] using hq) =
      (E.poly T q hq).map (algebraMap R R') := sorry
def scalarLayer (F : FiniteLayer A) : FiniteLayer (scalarTower R' A) := sorry
lemma scalarLayer_val (F : FiniteLayer A) : (scalarLayer R' F).val=F.val := sorry
instance scalarEulerModule (E : EulerFactors T A) : Module R
    (EulerSystem (scalarRep R' T) (scalarFactors R' E)) :=
  Module.compHom _ (algebraMap R R')
instance scalarHModule (F : FiniteLayer A) : Module R
    (HAt K R' (scalarRep R' T) (scalarLayer R' F).val 1) :=
  Module.compHom _ (algebraMap R R')
def scalarCohom (F : FiniteLayer A) : HAt K R T F.val 1 →ₗ[R]
    HAt K R' (scalarRep R' T) (scalarLayer R' F).val 1 := sorry
def EulerSystem.baseChange (E : EulerFactors T A) : EulerSystem T E →ₗ[R]
    EulerSystem (scalarRep R' T) (scalarFactors R' E) := sorry
lemma EulerSystem.baseChange_eval (E : EulerFactors T A) (c : EulerSystem T E) (F : FiniteLayer A) :
    (EulerSystem.baseChange R' E c).val (scalarLayer R' F) = scalarCohom R' F (c.val F) := sorry
end TauCeti.EulerSystems

namespace TauCeti.KolyvaginSystems.SelfDual
open TauCeti.KolyvaginSystems
variable {K R : Type} [Field K] [NumberField K] [CommRing R] [TopologicalSpace R] [IsLocalRing R]
variable {T : TauCeti.KolyvaginSystems.Rep K R} [Module.Free R T] [Module.Finite R T]
variable {S : SelmerTriple K R T} {p : ℕ}
/-- Howard modification at I_n=0 keeps the same coefficient representation. -/
def sameCoefficientModified (D : InertData T S p) (n : Vertices S)
    (hn : inertConductorIdeal D n = ⊥) : SelmerTriple K R T := sorry
lemma sameCoefficientModified_primes (D : InertData T S p) (n : Vertices S)
    (hn : inertConductorIdeal D n = ⊥) :
    (sameCoefficientModified D n hn).primes = S.primes \ (n.val : Set (Prime K)) := sorry
lemma sameCoefficientModified_condition (D : InertData T S p) (n : Vertices S)
    (hn : inertConductorIdeal D n = ⊥) (q : Prime K) :
    (sameCoefficientModified D n hn).F.condition (Sum.inr q) = if hq : q ∈ n.val then
      (inertTransverse _ (D.locals n ⟨q,hq⟩)).comap
        (TauCeti.ContinuousCohomology.coeffMap
          (TopRep.resFunctor (decomposition K (Sum.inr q)).subtype |>.map
            (quotientMap T (inertConductorIdeal D n))) 1).hom.toLinearMap
    else S.F.condition (Sum.inr q) := sorry
def Hypotheses.modify (h : Hypotheses T S p) (D : InertData T S p)
    (hD : D.quadratic=h.quadratic) (n : Vertices S) (hn : inertConductorIdeal D n = ⊥) :
    Hypotheses T (sameCoefficientModified D n hn) p := sorry
def Hypotheses.baseChange (h : Hypotheses T S p) (I : Ideal R) [IsLocalRing (R ⧸ I)] :
    Hypotheses (reducedRep T I) (reducedTriple S I) p := sorry
/-- Alternating Tate pairing and actual conjugation on T. The twist converts it
into the symmetric conjugate-equivariant pairing of Howard H.4. -/
structure WeilPairingInput (T : TauCeti.KolyvaginSystems.Rep K R) (D : ImaginaryQuadraticData K) where
  cyclotomic : GK K →* Rˣ
  weil : T →ₗ[R] T →ₗ[R] R
  alternating : ∀ x, weil x x=0
  perfect : Function.Bijective weil
  conjugation : T ≃ₗ[R] T
  involution : ∀ x, conjugation (conjugation x)=x
  antiSymplectic : ∀ x y, weil (conjugation x) (conjugation y) = -weil x y
  action : ∀ g x, conjugation (T.ρ g x)=T.ρ (D.conjugation g) (conjugation x)
  equivariant : ∀ g x y, weil (T.ρ g x) (T.ρ g y) = (cyclotomic g : R)*weil x y
def conjugateWeilLocal {D : ImaginaryQuadraticData K} (W : WeilPairingInput T D)
    (v : Place K) : LocalH K R T v 1 →ₗ[R] LocalH K R T (D.conjugatePlace v) 1 →ₗ[R] R := sorry
def weilOrthogonal {D : ImaginaryQuadraticData K} (W : WeilPairingInput T D)
    (F : SelmerStructure K R T) (v : Place K) : Submodule R (LocalH K R T v 1) :=
  { carrier := {x | ∀ y ∈ F.condition (D.conjugatePlace v), conjugateWeilLocal W v x y = 0},
    zero_mem' := sorry, add_mem' := sorry, smul_mem' := sorry }
def Hypotheses.ofWeilPairing (D : ImaginaryQuadraticData K) (W : WeilPairingInput T D)
    (F : SelmerStructure K R T)
    (hF : ∀ v, F.condition v = weilOrthogonal W F v) :
    PairingData T F D := sorry
lemma ofWeilPairing_formula (D : ImaginaryQuadraticData K) (W : WeilPairingInput T D)
    (F : SelmerStructure K R T)
    (hF : ∀ v, F.condition v = weilOrthogonal W F v)
    (x y : T) : (Hypotheses.ofWeilPairing D W F hF).pairing x y = W.weil x (W.conjugation y) := sorry
end TauCeti.KolyvaginSystems.SelfDual

namespace TauCeti.KolyvaginSystems
open TauCeti.EulerSystems
variable {K R : Type} [Field K] [NumberField K] [CommRing R] [TopologicalSpace R]
/-- Product derivative on a product of cyclic tame groups. -/
def kolyvaginDerivative_prod {ι : Type} [Fintype ι] [DecidableEq ι]
    (Γ : ι → Type) [∀ i, CommGroup (Γ i)] (σ : ∀ i, Γ i) :
    MonoidAlgebra ℤ (∀ i, Γ i) :=
  ∏ i, ∑ j ∈ Finset.range (orderOf (σ i)),
    MonoidAlgebra.single (fun k => if h : k=i then h.symm ▸ (σ i)^j else 1) (j : ℤ)
lemma kolyvaginDerivative_prod_empty {ι : Type} [Fintype ι] [DecidableEq ι] [IsEmpty ι]
    (Γ : ι → Type) [∀ i, CommGroup (Γ i)] (σ : ∀ i, Γ i) : kolyvaginDerivative_prod Γ σ=1 := sorry
variable {T : TauCeti.KolyvaginSystems.Rep K R} [Module.Free R T] [Module.Finite R T]
variable [Fact (IsContinuous K R T)] {A : Tower T}
/-- Changing one cyclic generator by a unit multiplies the scalar derivative by
its inverse mod M. Tensoring with the same generator makes the class intrinsic. -/
lemma derivativeClass_generator (E : EulerFactors T A) (hA : IsAdmissibleTower T A)
    (F : FiniteLayer A) (M : R) (n : Conductor K) (h : DerivativeAdmissible E F M n)
    (σ σ' : ∀ q : n, gammaPrime K A.p q)
    (hσ : ∀ (q : n) (g : gammaPrime K A.p q), g ∈ Subgroup.zpowers (σ q))
    (hσ' : ∀ (q : n) (g : gammaPrime K A.p q), g ∈ Subgroup.zpowers (σ' q))
    (c : EulerSystem T E) :
    derivativeClass E hA F M n h σ hσ c ⊗ₜ[ℤ] PiTensorProduct.tprod ℤ (fun q => Additive.ofMul (σ q)) =
      derivativeClass E hA F M n h σ' hσ' c ⊗ₜ[ℤ] PiTensorProduct.tprod ℤ (fun q => Additive.ofMul (σ' q)) := sorry
end TauCeti.KolyvaginSystems

namespace TauCeti.EulerSystems.Universal
open TauCeti.KolyvaginSystems
variable {K R : Type} [Field K] [NumberField K] [CommRing R] [TopologicalSpace R]
variable {T : GaloisRep K R} [Module.Free R T] [Module.Finite R T] {A : Tower T}
/-- Rubin IV Theorem 4.2: Ext¹ vanishes into a finite free group-ring module,
although the universal module need not be free over that group ring. -/
theorem ext_eq_zero [IsArtinianRing R] [IsLocalRing R] [IsPrincipalIdealRing R]
    (F : FiniteLayer A) (n : Conductor K) (E : EulerFactors T A)
    (hn : ∀ q ∈ n, Sum.inr q ∉ A.bad) (k : ℕ)
    [CategoryTheory.HasExt (ModuleCat (GroupRing (R := R) F n))] :
    Subsingleton (CategoryTheory.Abelian.Ext
      (ModuleCat.of (GroupRing (R := R) F n) (X F n E hn))
      (ModuleCat.of (GroupRing (R := R) F n) (Fin k → GroupRing (R := R) F n)) 1) := sorry
end TauCeti.EulerSystems.Universal

namespace TauCeti.StarkSystems
open TauCeti.KolyvaginSystems
variable {K R : Type} [Field K] [NumberField K] [CommRing R] [TopologicalSpace R] [IsLocalRing R]
variable {T : SelmerRep K R} [Module.Free R T] [Module.Finite R T] {S : SelmerTriple K R T} {p : ℕ}
def ComparisonData.kolyvaginData (C : ComparisonData S p)
    (hI : ∀ q ∈ S.primes, primeConductorIdeal T p q=⊥) : KolyvaginData T S p := sorry
/-- At a fixed coefficient level, I_q=0 prevents a second coefficient reduction.
The bidual comparison additionally uses actual evaluation reflexivity. -/
def KolyvaginSystemRank.rank_one_equiv (C : ComparisonData S p)
    (hI : ∀ q ∈ S.primes, primeConductorIdeal T p q=⊥)
    (hRef : ∀ n : Vertices S, Function.Bijective (Module.Dual.eval R (rankModified C n).selmer)) :
    KolyvaginSystemRank C 1 (by decide) ≃ₗ[R] KolyvaginSystem (C.kolyvaginData hI) := sorry
/-- The exterior-power MR version needs no reflexivity assumption in degree one. -/
def MRKolyvaginSystemRank.rank_one_equiv (C : ComparisonData S p)
    (hI : ∀ q ∈ S.primes, primeConductorIdeal T p q=⊥) :
    MRKolyvaginSystemRank C 1 (by decide) ≃ₗ[R] KolyvaginSystem (C.kolyvaginData hI) := sorry
end TauCeti.StarkSystems

namespace TauCeti.EulerSystems
open TauCeti.KolyvaginSystems
variable {K R : Type} [Field K] [NumberField K] [CommRing R] [TopologicalSpace R]
variable {T : HigherRep K R} [Module.Free R T] [Module.Finite R T] {A : Tower T}
instance reductionCohomR (T : HigherRep K R) (F : Layer K) (M : R) :
    Module R (HAt K (R ⧸ Ideal.span {M}) (reducedRep T (Ideal.span {M})) F 1) :=
  Module.compHom _ (Ideal.Quotient.mk (Ideal.span {M}))
def coefficientReductionAt (T : HigherRep K R) (F : Layer K) (M : R) :
    HAt K R T F 1 →ₗ[R] HAt K (R ⧸ Ideal.span {M}) (reducedRep T (Ideal.span {M})) F 1 := sorry
/-- The rank-one Shapiro and evaluation map, not an equality between different carriers. -/
def higherRankOneEvaluation (E : EulerFactors T A) (M : R)
    (h : HigherDerivativeData E M 1) :
    HAt K (R ⧸ Ideal.span {M}) (reducedRep T (Ideal.span {M})) h.field.val 1 →ₗ[R]
      RawHigherStalk h := sorry
lemma higherDerivative_one (E : EulerFactors T A) (M : R) (r : ℕ) (hr : 0 < r)
    (h : HigherDerivativeData E M r) (h611 : BSSHypothesis611 T A.p h.S.primes)
    (c : HigherEulerSystem E r)
    (σ : ∀ q : (initialVertex h.S).val, gammaPrime K A.p q)
    (hσ : ∀ (q : (initialVertex h.S).val) (g : gammaPrime K A.p q), g ∈ Subgroup.zpowers (σ q)) :
    higherSelmerInclusion E M r h (initialVertex h.S)
      ((higherDerivative E M r hr h h611 c).val (initialVertex h.S)) =
        rawHigherWithGenerators E M r h c (initialVertex h.S) σ hσ ⊗ₜ[ℤ]
          PiTensorProduct.tprod ℤ (fun q => Additive.ofMul (σ q)) := sorry
/-- This is the raw rank-one comparison. The corrected MR comparison also needs
its polynomial-change map and finite-level Selmer/augmentation transports. -/
lemma higherDerivative_rank_one (E : EulerFactors T A) (M : R) (h : HigherDerivativeData E M 1)
    (hT : IsContinuous K R T) (c : HigherEulerSystem E 1)
    (σ : ∀ q : (initialVertex h.S).val, gammaPrime K A.p q)
    (hσ : ∀ (q : (initialVertex h.S).val) (g : gammaPrime K A.p q), g ∈ Subgroup.zpowers (σ q)) :
    rawHigherWithGenerators E M 1 h c (initialVertex h.S) σ hσ =
      higherRankOneEvaluation E M h
        (coefficientReductionAt T h.field.val M
          ((HigherEulerSystem.rank_one_equiv E h.admissible h.hypotheses61 hT c).val h.field)) := sorry
end TauCeti.EulerSystems

namespace TauCeti.KolyvaginSystems
open TauCeti.EulerSystems
variable {K R : Type} [Field K] [NumberField K] [CommRing R] [TopologicalSpace R]
variable [IsDomain R] [IsDiscreteValuationRing R]
variable {T : TauCeti.KolyvaginSystems.Rep K R} [Module.Free R T] [Module.Finite R T]
variable {S : SelmerTriple K R T} {A : Tower T}
/-- The corrected weak family from the MR norm-compatible derivative construction.
A general weak family is not asserted to have vanishing finite parts. -/
def eulerToWeakKolyvagin (E : EulerFactors T A) (hA : IsAdmissibleTower T A)
    (h : EulerKolyvaginHypotheses E S) (D : KolyvaginData T S A.p) :
    EulerSystem T E →ₗ[R] WeakKolyvaginSystem D := sorry
lemma correctedClass_finite_eq_zero (E : EulerFactors T A) (hA : IsAdmissibleTower T A)
    (h : EulerKolyvaginHypotheses E S) (D : KolyvaginData T S A.p)
    (c : EulerSystem T E) (n : Vertices S) (q : Prime K) (hq : q ∈ n.val) :
    weakFinitePart D n q hq ((eulerToWeakKolyvagin E hA h D c).val n) = 0 := sorry
/-- Twisting comparison at conductor one. Full finite-level naturality requires
the same polynomial normalization and its quotient/augmentation dictionaries. -/
lemma eulerToKolyvagin_twist (E : EulerFactors T A) (χ : CharacterData A)
    (S' : SelmerTriple K R (twistRep T χ.character))
    (hA' : IsAdmissibleTower (twistRep T χ.character) (twistTower χ))
    (h' : EulerKolyvaginHypotheses (twistFactors E χ) S')
    (hcomplete : IsAdicComplete (IsLocalRing.maximalIdeal R) R)
    (h0 : NoResidualInvariants (twistRep T χ.character) (IsLocalRing.maximalIdeal R))
    (c : EulerSystem T E) :
    (generalizedOne hcomplete h0
      (eulerToKolyvagin (twistFactors E χ) hA' h' (EulerSystem.twist E χ c))).val =
        baseClass (twistFactors E χ) (EulerSystem.twist E χ c) := sorry
example (E : EulerFactors T A) (hA : IsAdmissibleTower T A)
    (h : EulerKolyvaginHypotheses E S) (D : KolyvaginData T S A.p) :
    eulerToWeakKolyvagin E hA h D 0 = 0 := sorry
end TauCeti.KolyvaginSystems

namespace TauCeti.KolyvaginSystems
variable {K R : Type} [Field K] [NumberField K] [CommRing R] [TopologicalSpace R]
variable {T : Rep K R} [Module.Free R T] [Module.Finite R T]
variable {S : SelmerTriple K R T} {p : ℕ}

-- Unit test: gammaConductor_product
example (K : Type) [Field K] [NumberField K] (p : ℕ) (n : Conductor K) :
  Nonempty (gammaConductor K p n ≃* (∀ q : n, gammaPrime K p q)) := sorry

-- Unit test: conductorIdeal_one
example (T : Rep K R) (p : ℕ) : conductorIdeal T p ∅ = ⊥ := sorry

-- Unit test: tameGroup_one
example (K : Type) [Field K] [NumberField K] (p : ℕ) :
  Nonempty (tameGroup K p ∅ ≃+ ℤ) := sorry

-- Unit test: kolyvaginPrimes_not_outside
example [IsLocalRing R] (T : Rep K R) (S : SelmerTriple K R T) (p k : ℕ)
    (q : Prime K) (h : q ∉ S.primes) : q ∉ kolyvaginPrimes T S p k := sorry

-- Unit test: kolyvaginPrimes_unit_ideal
example [IsLocalRing R] (T : Rep K R) (S : SelmerTriple K R T) (p k : ℕ)
    (q : Prime K) (hI : primeConductorIdeal T p q = ⊤)
    (hproper : IsLocalRing.maximalIdeal R^k ≠ ⊤) : q ∉ kolyvaginPrimes T S p k := sorry

-- Unit test: kolyvaginPrimes_level_zero
example [IsLocalRing R] (T : Rep K R) (S : SelmerTriple K R T) (p : ℕ) :
  kolyvaginPrimes T S p 0 = S.primes := sorry

-- Unit test: sections_one_vertex
example (G : SimpleGraph Unit) (D : GraphSheaf R G) :
  Nonempty (D.sections ≃ₗ[R] D.stalk ()) := sorry

-- Unit test: sections_ne_product
example {V : Type} (G : SimpleGraph V) (D : GraphSheaf R G)
    (e : G.edgeSet) (x y : V) (hx : x ∈ e.val) (hy : y ∈ e.val)
    (a : ∀ v, D.stalk v) (h : D.toEdge e x hx (a x) ≠ D.toEdge e y hy (a y)) :
  a ∉ D.sections := sorry

-- Unit test: isCoreVertex_dual_zero
example [IsLocalRing R] (D : KolyvaginData T S p) (n : Vertices S)
    (h : dualSelmerLength D n = 0) : IsCoreVertex D n := sorry

-- Unit test: not_isCoreVertex_both_positive
example [IsLocalRing R] (D : KolyvaginData T S p) (n : Vertices S)
    (h : 0 < selmerLength D n) (hd : 0 < dualSelmerLength D n) : ¬ IsCoreVertex D n := sorry

-- Unit test: isCoreVertex_free_rank
example [IsLocalRing R] (D : KolyvaginData T S p) (h : MR04Hypotheses T S p)
    (hR : PrincipalArtinian (R := R)) (hP : AtLevel S p) (n : Vertices S)
    (hn : IsCoreVertex D n) (hr : latticeCoreRank T S.F = 1) :
  Module.Free R (modified D n).selmer ∧ Module.finrank R (modified D n).selmer = 1 := sorry

end TauCeti.KolyvaginSystems

namespace TauCeti.ErrorTolerant
open TauCeti.KolyvaginSystems
variable {K O : Type} [Field K] [NumberField K] [CommRing O] [TopologicalSpace O]
variable [IsLocalRing O] [IsDomain O] [IsDiscreteValuationRing O]

-- Unit test: frobeniusSet_proper
example (T : ErrorRep K O) (S : Submodule O (H K O T 1))
    (D : AbundanceData T S) (g : SelmerGalois T S)
    (h : ∀ a : normalKernel T D.normalClosure, D.alpha a = a → D.restriction a ≠ g) :
  g ∉ frobeniusSet T S D := sorry

-- Unit test: frobeniusSet_fixed_evaluation
example (T : ErrorRep K O) (S : Submodule O (H K O T 1))
    (D : AbundanceData T S) (g : SelmerGalois T S) (hg : g ∈ frobeniusSet T S D)
    (x : S) : T.ρ D.h (theta T S g x) = theta T S g x := sorry

-- Unit test: isAbundant_zero_loss
example (T : ErrorRep K O) (S : Submodule O (H K O T 1))
    (D : AbundanceData T S) (π : O) (r rT : ℕ) (Ψ : Fin r → SelmerGalois T S) :
  IsAbundant T S D π 0 r rT 0 Ψ ↔ ∃ hΨ : ∀ i, Ψ i ∈ frobeniusSet T S D,
    Function.Surjective (fixedAbundanceMap T S D Ψ hΨ) := sorry

end TauCeti.ErrorTolerant

namespace TauCeti.KolyvaginSystems
open TauCeti.EulerSystems
variable {K R : Type} [Field K] [NumberField K] [CommRing R] [TopologicalSpace R]
variable [IsDomain R] [IsDiscreteValuationRing R]
variable {T : Rep K R} [Module.Free R T] [Module.Finite R T]
variable {S : SelmerTriple K R T} {p : ℕ} {A : Tower T}

-- Unit test: correctedClass_finite_vanishes
example (E : EulerFactors T A) (hA : IsAdmissibleTower T A)
    (h : EulerKolyvaginHypotheses E S) (D : KolyvaginData T S A.p)
    (c : EulerSystem T E) (n : Vertices S) (q : Prime K) (hq : q ∈ n.val) :
  weakFinitePart D n q hq ((eulerToWeakKolyvagin E hA h D c).val n) = 0 := sorry

-- Unit test: WeakKolyvaginSystem.not_kolyvagin
example (D : KolyvaginData T S p) (n : Vertices S) (q : Prime K) (hq : q ∈ n.val)
    (κ : WeakKolyvaginSystem D) (hf : weakFinitePart D n q hq (κ.val n) ≠ 0) :
  κ ∉ LinearMap.range (KolyvaginSystem.toWeak D) := sorry

end TauCeti.KolyvaginSystems

namespace TauCeti.KolyvaginSystems
variable {K R : Type} [Field K] [NumberField K] [CommRing R] [TopologicalSpace R]

-- Blueprint node: EulerSystemsAndKolyvaginSystems:ES.1/finite-singular-decomposition
/-- MR04 Lemma 1.2.1; the reciprocity adapters above give these canonical maps. -/
theorem finite_singular_decomposition (T : Rep K R) [Module.Finite R T]
    {p : ℕ} {q : Prime K} (D : LocalTameData T p q) (hT : IsContinuous K R T) :
    Nonempty (unramified K R T (Sum.inr q) ≃ₗ[R]
      (T ⧸ LinearMap.range (frobEnd T q - LinearMap.id))) ∧
    Nonempty ((singular T q ⊗[ℤ] tamePrime K p q) ≃ₗ[R]
      LinearMap.ker (frobEnd T q - LinearMap.id)) := sorry

-- Blueprint node: EulerSystemsAndKolyvaginSystems:ES.1/transverse-duality
/-- MR04 Proposition 1.3.2, with the same local extension for both coefficients. -/
theorem transverse_duality (T : Rep K R) [Module.Finite R T] [Finite T]
    {p : ℕ} {q : Prime K} (D : LocalTameData T p q)
    (Ddual : LocalTameData (dualRep T) p q) (hD : D.extension = Ddual.extension) :
    orthogonal T (Sum.inr q) (transverse T D) = transverse (dualRep T) Ddual ∧
    orthogonal T (Sum.inr q) (unramified K R T (Sum.inr q)) =
      unramified K R (dualRep T) (Sum.inr q) := sorry

/-- Dirichlet density is a limit of the prime-ideal series as s decreases to 1.
This consumer definition does not supply the Chebotarev theorem. -/
def HasPositiveDirichletDensity (Q : Set (Prime K)) : Prop :=
  ∃ δ : ℝ, 0 < δ ∧ Filter.Tendsto
    (fun s : ℝ => (∑' q : Prime K, if q ∈ Q then (primeNorm K q : ℝ) ^ (-s) else 0) /
      Real.log (1 / (s-1))) (nhdsWithin 1 (Set.Ioi 1)) (nhds δ)

def mr04PrimesAt (T : Rep K R) (S : SelmerTriple K R T) [Module.Free R T] [Module.Finite R T] [IsLocalRing R] (k : ℕ) :
    Set (Prime K) := {q | q ∈ S.primes ∧ conductorIdeal04 T q ≤ IsLocalRing.maximalIdeal R^k}

-- Blueprint node: EulerSystemsAndKolyvaginSystems:ES.1/chebotarev-nonvanishing
/-- MR04 Proposition 3.6.1 uses four classes and the full MR04 hypotheses. -/
theorem chebotarev_nonvanishing [IsLocalRing R] [IsArtinianRing R]
    [IsPrincipalIdealRing R] [Finite R]
    (T : Rep ℚ R) [Module.Free R T] [Module.Finite R T]
    (S : SelmerTriple ℚ R T) (p : ℕ) (h : MR04Hypotheses T S p)
    (c : Fin 2 → H ℚ R T 1) (cdual : Fin 2 → H ℚ R (dualRep T) 1)
    (hc : ∀ i, c i ≠ 0) (hd : ∀ i, cdual i ≠ 0) (k : ℕ) (hk : 0 < k) :
    ∃ Q : Set (Prime ℚ), Q ⊆ mr04PrimesAt T S k ∧ HasPositiveDirichletDensity Q ∧
      ∀ q ∈ Q, (∀ i, loc ℚ R T (Sum.inr q) (c i) ≠ 0) ∧
        ∀ i, loc ℚ R (dualRep T) (Sum.inr q) (cdual i) ≠ 0 := sorry

def restrictedLocalization (T : Rep K R) (C : Submodule R (H K R T 1)) (q : Prime K) :
    C →ₗ[R] LocalH K R T (Sum.inr q) 1 := (loc K R T (Sum.inr q)).comp C.subtype

-- Blueprint node: EulerSystemsAndKolyvaginSystems:ES.1/chebotarev-prescribed-kernels
/-- MR04 Proposition 3.6.2(i). The two-coefficient form also assumes H.4a. -/
theorem chebotarev_prescribed_kernels [IsLocalRing R] [IsArtinianRing R]
    [IsPrincipalIdealRing R] [Finite R]
    (T : Rep ℚ R) [Module.Free R T] [Module.Finite R T]
    (S : SelmerTriple ℚ R T) (p : ℕ) (h : MR04Hypotheses T S p)
    (hcoeff : CoefficientsFromGalois T p) (C : Submodule R (H ℚ R T 1)) [Finite C]
    (φ : C →ₗ[R] R) (k : ℕ) (hk : 0 < k) :
    ∃ Q : Set (Prime ℚ), Q ⊆ mr04PrimesAt T S k ∧ HasPositiveDirichletDensity Q ∧
      ∀ q ∈ Q, LinearMap.ker (restrictedLocalization T C q) = LinearMap.ker φ := sorry

theorem chebotarev_prescribed_dual_kernels [IsLocalRing R] [IsArtinianRing R]
    [IsPrincipalIdealRing R] [Finite R]
    (T : Rep ℚ R) [Module.Free R T] [Module.Finite R T]
    (S : SelmerTriple ℚ R T) (p : ℕ) (h : MR04Hypotheses T S p)
    (hcoeff : CoefficientsFromGalois T p) (h4a : ResidualHomVanishing T)
    (C : Submodule R (H ℚ R T 1)) [Finite C] (φ : C →ₗ[R] R)
    (Cdual : Submodule R (H ℚ R (dualRep T) 1)) [Finite Cdual] (ψ : Cdual →ₗ[R] R)
    (k : ℕ) (hk : 0 < k) :
    ∃ Q : Set (Prime ℚ), Q ⊆ mr04PrimesAt T S k ∧ HasPositiveDirichletDensity Q ∧
      ∀ q ∈ Q, LinearMap.ker (restrictedLocalization T C q) = LinearMap.ker φ ∧
        LinearMap.ker (restrictedLocalization (dualRep T) Cdual q) = LinearMap.ker ψ := sorry

-- Blueprint node: EulerSystemsAndKolyvaginSystems:ES.0/core-rank-formula
/-- The corank is the rank of the character dual of the discrete H⁰ carrier. -/
def localDualCorank (T : Rep K R) (v : Place K) : ℕ :=
  Module.finrank R (pontryaginDual (R := R) (LocalH K R (dualRep T) v 0))
def minusLattice (T : Rep K R) (c : GK K) : Submodule R T :=
  LinearMap.ker ((T.ρ c).toLinearMap + LinearMap.id)

theorem canonical_core_rank_formula [IsLocalRing R] [IsDomain R] [IsDiscreteValuationRing R]
    (T : Rep ℚ R) [Module.Free R T] [Module.Finite R T]
    (p : ℕ) (S : SelmerTriple ℚ R T) (h : MR04Hypotheses T S p)
    (q : Prime ℚ) (hq : isAboveP p q)
    (hF : S.F = canonicalStructure T S.F.sigma (pInfinity (K := ℚ) p)
      S.F.ramification (by sorry))
    (v : NumberField.InfinitePlace ℚ) (c : GK ℚ)
    (hc : decomposition ℚ (Sum.inl v) = Subgroup.zpowers c) (hc2 : orderOf c = 2) :
    latticeCoreRank T S.F = Module.finrank R (minusLattice T c) + localDualCorank T (Sum.inr q) := sorry

theorem unramified_core_rank_formula [IsLocalRing R] [IsDomain R] [IsDiscreteValuationRing R]
    (T : Rep K R) [Module.Free R T] [Module.Finite R T]
    (sigma : Finset (Place K)) (hu : ∀ v ∉ sigma, IsUnramified K R T v)
    (h0 : NoResidualInvariants T (IsLocalRing.maximalIdeal R)) :
    latticeCoreRank T (unramifiedStructure T sigma hu) =
      ∑ v : NumberField.InfinitePlace K, localDualCorank T (Sum.inl v) := sorry

-- Blueprint node: EulerSystemsAndKolyvaginSystems:ES.4/leading-vertices
/-- MR04 Theorem 4.1.15. The containment compares actual H¹ submodules. -/
theorem leading_vertices_through_submodule [IsLocalRing R] [IsArtinianRing R]
    [IsPrincipalIdealRing R] (T : Rep ℚ R) [Module.Free R T] [Module.Finite R T]
    (S : SelmerTriple ℚ R T) (p : ℕ) (D : KolyvaginData T S p)
    (h : MR04Hypotheses T S p) (hP : AtLevel S p)
    (h4a : ResidualHomVanishing T) (hcoeff : CoefficientsFromGalois T p)
    (hr : 0 < latticeCoreRank T S.F) (h1 : ¬ IsCoreVertex D (initialVertex S))
    (L : Submodule R (H ℚ R T 1)) (hL : L ≤ S.F.selmer)
    (hdim : len R (torsionBy (IsLocalRing.maximalIdeal R) L) = latticeCoreRank T S.F) :
    {n : Vertices S | IsLeadingVertex D n ∧
      L.map (TauCeti.ContinuousCohomology.coeffMap (quotientMap T (conductorIdeal T p n.val)) 1).hom.toLinearMap
        ≤ (modified D n).selmer}.Infinite := sorry
end TauCeti.KolyvaginSystems

namespace TauCeti.EulerSystems
open TauCeti.KolyvaginSystems
variable {K R : Type} [Field K] [NumberField K] [CommRing R] [TopologicalSpace R]
variable {T : GaloisRep K R} [Module.Free R T] [Module.Finite R T] {A : Tower T}

-- Blueprint node: EulerSystemsAndKolyvaginSystems:ES.2/conductor-presentation
/-- The cofinal ray-product presentation, Rubin II Remark 1.4. -/
abbrev RayProductIndex (hA : IsAdmissibleTower T A) :=
  (F : {F : FiniteLayer A // hA.direction.subgroup ≤ F.val.group}) ×
    {n : Conductor K // ∀ q ∈ n, Sum.inr q ∉ A.bad}
def rayProductLayer (hA : IsAdmissibleTower T A) (i : RayProductIndex hA) : FiniteLayer A :=
  auxiliaryFiniteLayer hA i.1.val i.2.val i.2.property

def ConductorNormFamily (E : EulerFactors T A) (hA : IsAdmissibleTower T A) :
    Submodule R (∀ i : RayProductIndex hA, HAt K R T (rayProductLayer hA i).val 1) :=
  {carrier := {c | ∀ (i j : RayProductIndex hA)
      (h : (rayProductLayer hA j).val.group ≤ (rayProductLayer hA i).val.group),
      corAt T (rayProductLayer hA i).val (rayProductLayer hA j).val h (c j) =
        factorOperator T E (rayProductLayer hA i) (rayProductLayer hA j) (c i)},
    zero_mem' := sorry, add_mem' := sorry, smul_mem' := sorry}
/-- The minimal tower condition is cofinality of actual auxiliary fields. -/
def MinimalRayTower (hA : IsAdmissibleTower T A) : Prop :=
  ∀ L : FiniteLayer A, ∃ i : RayProductIndex hA, (rayProductLayer hA i).val.group ≤ L.val.group

def conductorPresentation (E : EulerFactors T A) (hA : IsAdmissibleTower T A)
    (hmin : MinimalRayTower hA) : EulerSystem T E ≃ₗ[R] ConductorNormFamily E hA := sorry
lemma conductorPresentation_eval (E : EulerFactors T A) (hA : IsAdmissibleTower T A)
    (hmin : MinimalRayTower hA) (c : EulerSystem T E) (i : RayProductIndex hA) :
    (conductorPresentation E hA hmin c).val i = c.val (rayProductLayer hA i) := sorry

-- Blueprint node: EulerSystemsAndKolyvaginSystems:ES.2/euler-factor-change
/-- Rubin IX Lemma 6.1 applies to arbitrary congruent factor families, rather than
asserting equality of the two Euler-system conventions. -/
abbrev FactorFamily (A : Tower T) := (q : Prime K) → Sum.inr q ∉ A.bad → R[X]
def polynomialFactor (f : FactorFamily A) (F F' : FiniteLayer A) :
    Module.End R (HAt K R T F.val 1) := sorry
lemma polynomialFactor_formula (f : FactorFamily A) (F F' : FiniteLayer A) :
    polynomialFactor f F F' =
      ((ramifiedDifference A F F').attach.toList.map (fun q =>
        aeval (cohomologyAction T F.val (QuotientGroup.mk (frobenius K q.val).val⁻¹))
          (f q.val (by sorry)))).prod := sorry

def PolynomialNormFamily (f : FactorFamily A) : Submodule R (∀ F : FiniteLayer A, HAt K R T F.val 1) :=
  {carrier := {c | ∀ (F F' : FiniteLayer A) (h : F'.val.group ≤ F.val.group),
      corAt T F.val F'.val h (c F') = polynomialFactor f F F' (c F)},
    zero_mem' := sorry, add_mem' := sorry, smul_mem' := sorry}
def changeEulerFactors (hA : IsAdmissibleTower T A) (f g : FactorFamily A)
    (hfg : ∀ q hq, (f q hq - g q hq).map
      (Ideal.Quotient.mk (Ideal.span {(primeNorm K q : R)-1})) = 0) :
    PolynomialNormFamily f →ₗ[R] PolynomialNormFamily g := sorry
lemma changeEulerFactors_unramified (hA : IsAdmissibleTower T A) (f g : FactorFamily A)
    (hfg : ∀ q hq, (f q hq - g q hq).map
      (Ideal.Quotient.mk (Ideal.span {(primeNorm K q : R)-1})) = 0)
    (c : PolynomialNormFamily f) (F : FiniteLayer A)
    (hu : ∀ q : Prime K, Sum.inr q ∉ A.bad → IsUnramifiedLayer F.val q) :
    (changeEulerFactors hA f g hfg c).val F = c.val F := sorry

-- Blueprint node: EulerSystemsAndKolyvaginSystems:ES.3/congruence
/-- Rubin IV Corollary 8.1. At a nonsplit p-adic direction this is a consequence
of norm compatibility, while the rigid finite-direction carrier assumes it. -/
theorem kolyvagin_congruence (E : EulerFactors T A) (hA : IsAdmissibleTower T A)
    (hE : E.normalization = .rubin) (c : EulerSystem T E) (N : Conductor K)
    (hN : ∀ q, q ∈ N ↔ Sum.inr q ∈ A.bad) : RayFamilyCongruent E c N := sorry

-- Blueprint node: EulerSystemsAndKolyvaginSystems:ES.3/derivative-local-properties
variable [Fact (IsContinuous K R T)]
theorem derivative_local_unramified (E : EulerFactors T A) (hA : IsAdmissibleTower T A)
    (F : FiniteLayer A) (M : R) (n : Conductor K) (h : DerivativeAdmissible E F M n)
    (σ : ∀ q : n, gammaPrime K A.p q)
    (hσ : ∀ (q : n) (g : gammaPrime K A.p q), g ∈ Subgroup.zpowers (σ q))
    (c : EulerSystem T E) (q : Prime K) (hq : q ∉ n) (hp : ¬ isAboveP A.p q)
    (w : Prime F.val.field) (hw : w ∈ primesAbove F.val q) :
    locAt (quotientRep T (Ideal.span {M})) F.val (Sum.inr w)
      (derivativeClass E hA F M n h σ hσ c) ∈
        unramified F.val.field R (layerRep (quotientRep T (Ideal.span {M})) F.val) (Sum.inr w) := sorry

-- Blueprint node: EulerSystemsAndKolyvaginSystems:ES.1/rubin-prime-selection
/-- Rubin V Lemma 2.3(a): evaluation modulo τ−1 dominates the order after
restriction. Both primal and dual classes are selected with one γ. -/
theorem rubin_prime_evaluation_selection [IsDomain R] [IsDiscreteValuationRing R]
    (p : ℕ) (hp : 2 < p) (h : HypKT T p) (M π : R) (hM : M ≠ 0)
    (hπ : IsLocalRing.maximalIdeal R = Ideal.span {π})
    (L : Layer K) (hL : L.group ≤ representationKernel (quotientRep T (Ideal.span {M})))
    (hLd : L.group ≤ representationKernel (dualRep (quotientRep T (Ideal.span {M}))))
    (z : Cocycle (quotientRep T (Ideal.span {M})) (⊤ : Subgroup (GK K)))
    (zd : Cocycle (dualRep (quotientRep T (Ideal.span {M}))) (⊤ : Subgroup (GK K))) :
    ∃ γ : L.group,
      TauCeti.ErrorTolerant.expAt π (resAt (quotientRep T (Ideal.span {M})) (baseLayer K) L (by sorry)
        ((baseEquiv _).symm (TauCeti.ErrorTolerant.globalCocycleClass _ z))) ≤
        TauCeti.ErrorTolerant.expAt π
          (Submodule.Quotient.mk (z.val ⟨γ.val*h.tau,by simp⟩) :
            quotientRep T (Ideal.span {M}) ⧸ LinearMap.range
              (((quotientRep T (Ideal.span {M})).ρ h.tau).toLinearMap-LinearMap.id)) ∧
      TauCeti.ErrorTolerant.expAt π (resAt (dualRep (quotientRep T (Ideal.span {M}))) (baseLayer K) L (by sorry)
        ((baseEquiv _).symm (TauCeti.ErrorTolerant.globalCocycleClass _ zd))) ≤
        TauCeti.ErrorTolerant.expAt π
          (Submodule.Quotient.mk (zd.val ⟨γ.val*h.tau,by simp⟩) :
            dualRep (quotientRep T (Ideal.span {M})) ⧸ LinearMap.range
              (((dualRep (quotientRep T (Ideal.span {M}))).ρ h.tau).toLinearMap-LinearMap.id)) := sorry
end TauCeti.EulerSystems

namespace TauCeti.KolyvaginSystems
open TauCeti.EulerSystems
variable {K R : Type} [Field K] [NumberField K] [CommRing R] [TopologicalSpace R]
variable [IsDomain R] [IsDiscreteValuationRing R]
variable {T : Rep K R} [Module.Free R T] [Module.Finite R T]
variable {S : SelmerTriple K R T} {A : Tower T}
-- Blueprint node: EulerSystemsAndKolyvaginSystems:ES.3/finite-part-formula
/-- Raw norm-compatible derivatives, before the permutation correction. -/
def rawEulerDerivative (E : EulerFactors T A) (hA : IsAdmissibleTower T A)
    (h : EulerKolyvaginHypotheses E S) (c : EulerSystem T E) (n : Vertices S) :
    RawStalk T A.p n.val := sorry
/-- The raw family has relaxed local conditions at its conductor. -/
def rawEulerToWeak (E : EulerFactors T A) (hA : IsAdmissibleTower T A)
    (h : EulerKolyvaginHypotheses E S) (D : KolyvaginData T S A.p)
    (hdiv : pDualInvariantsDivisible T A.p) :
    EulerSystem T E →ₗ[R] WeakKolyvaginSystem D := sorry

def weakAmbientInclusion (D : KolyvaginData T S A.p) (n : Vertices S) :
    WeakStalk D n →ₗ[R] RawStalk T A.p n.val := sorry
lemma rawEulerToWeak_dictionary (E : EulerFactors T A) (hA : IsAdmissibleTower T A)
    (h : EulerKolyvaginHypotheses E S) (D : KolyvaginData T S A.p)
    (hdiv : pDualInvariantsDivisible T A.p) (c : EulerSystem T E) (n : Vertices S) :
    weakAmbientInclusion D n ((rawEulerToWeak E hA h D hdiv c).val n) =
      rawEulerDerivative E hA h c n := sorry

def rawFinitePart (D : KolyvaginData T S A.p) (n : Vertices S) (q : Prime K) (hq : q ∈ n.val) :
    RawStalk T A.p n.val →ₗ[R]
      (unramified K R (quotientRep T (conductorIdeal T A.p n.val)) (Sum.inr q) ⊗[ℤ]
        tameGroup K A.p n.val) := sorry
/-- The nonfixed primes form exactly one nonempty permutation orbit. -/
def SingleMovedOrbit {n : Conductor K} (π : Equiv.Perm n) : Prop :=
  (∃ x : n, π x ≠ x) ∧ ∀ x y : n, π x ≠ x → π y ≠ y → ∃ a : ℕ, (π^a) x = y

theorem rawEulerDerivative_finite_part (E : EulerFactors T A) (hA : IsAdmissibleTower T A)
    (h : EulerKolyvaginHypotheses E S) (D : KolyvaginData T S A.p)
    (c : EulerSystem T E) (n : Vertices S) (q : Prime K) (hq : q ∈ n.val) :
    rawFinitePart D n q hq (rawEulerDerivative E hA h c n) =
      ∑ π ∈ Finset.univ.filter (fun π : Equiv.Perm n.val =>
        SingleMovedOrbit π ∧ (π ⟨q,hq⟩).val ≠ q),
        ((-1 : ℤ)^(n.val.card - (fixedPart n.val π).card)) •
          rawFinitePart D n q hq
            (correctionTensor E n π h.support
              (rawEulerDerivative E hA h c ⟨fixedPart n.val π,by sorry⟩)) := sorry

-- Blueprint node: EulerSystemsAndKolyvaginSystems:ES.3/two-prime-test
/-- At one prime there is no moving orbit, so the raw finite part vanishes. -/
lemma rawEulerDerivative_prime_finite (E : EulerFactors T A) (hA : IsAdmissibleTower T A)
    (h : EulerKolyvaginHypotheses E S) (D : KolyvaginData T S A.p)
    (c : EulerSystem T E) (q : Prime K) (hq : q ∈ S.primes) :
    rawFinitePart D ⟨{q},by sorry⟩ q (by simp)
      (rawEulerDerivative E hA h c ⟨{q},by sorry⟩) = 0 := sorry
/-- After subtraction both finite parts vanish. The formula above fixes the
opposite signs of the raw finite term and the transposition correction. -/
lemma two_prime_corrected_finite (E : EulerFactors T A) (hA : IsAdmissibleTower T A)
    (h : EulerKolyvaginHypotheses E S) (D : KolyvaginData T S A.p)
    (c : EulerSystem T E) (q l : Prime K) (hne : q ≠ l)
    (hq : q ∈ S.primes) (hl : l ∈ S.primes) :
    weakFinitePart D ⟨{q,l},by sorry⟩ q (by simp)
      ((eulerToWeakKolyvagin E hA h D c).val ⟨{q,l},by sorry⟩) = 0 ∧
    weakFinitePart D ⟨{q,l},by sorry⟩ l (by simp)
      ((eulerToWeakKolyvagin E hA h D c).val ⟨{q,l},by sorry⟩) = 0 := sorry
end TauCeti.KolyvaginSystems

namespace TauCeti.EulerSystems
open TauCeti.KolyvaginSystems
variable {K O : Type} [Field K] [NumberField K] [CommRing O] [TopologicalSpace O]
variable [IsDomain O] [IsDiscreteValuationRing O]
variable {T : GaloisRep K O} [Module.Free O T] [Module.Finite O T]
variable {p : ℕ} [Fact p.Prime] [Algebra (PadicInt p) O]
-- Blueprint node: EulerSystemsAndKolyvaginSystems:ES.3/anticyclotomic-derivative
/-- Admissibility uses the χ-ray relative degree, not the cyclotomic ray degree. -/
def AntiDerivativeAdmissible (D : AnticyclotomicData T p) (M : O) (n : Conductor K) : Prop :=
  (∃ k : ℕ, 0 < k ∧ M = (p^k : O)) ∧ ∀ q ∈ n, q ∉ D.bad ∧
    (Fintype.card (relativeGal (antiRayLayer D ∅) (antiRayLayer D {q}) (by sorry)) : O) ∈
      Ideal.span {M} ∧
    ∀ (u : Oˣ) (_ : (u : O) = primeNorm K q), (eulerPoly T q u (by assumption)).eval 1 ∈ Ideal.span {M}
def antiDerivative (D : AnticyclotomicData T p) (hD : AntiRayContract D)
    (M : O) (n : Conductor K) (hn : AntiDerivativeAdmissible D M n)
    (c : AnticyclotomicEulerSystem D) : HAt K O (quotientRep T (Ideal.span {M})) D.base 1 := sorry

theorem antiDerivative_unramified (D : AnticyclotomicData T p) (hD : AntiRayContract D)
    (M : O) (n : Conductor K) (hn : AntiDerivativeAdmissible D M n)
    (c : AnticyclotomicEulerSystem D) (w : Prime D.base.field)
    (hp : ¬ isAboveP p w) (hq : ∀ q ∈ n, w ∉ primesAbove D.base q) :
    locAt _ D.base (Sum.inr w) (antiDerivative D hD M n hn c) ∈
      unramified D.base.field O (layerRep (quotientRep T (Ideal.span {M})) D.base) (Sum.inr w) := sorry

-- Blueprint node: EulerSystemsAndKolyvaginSystems:ES.4/variant-bounds
/-- The finite character descends through the field defined by its kernel. -/
def antiCharacter (D : AnticyclotomicData T p) : Layer.Gal K D.base →* (PadicInt p)ˣ := sorry
lemma antiCharacter_mk (D : AnticyclotomicData T p) (g : GK K) :
    antiCharacter D (QuotientGroup.mk g) = D.chi g := sorry
/-- The eigenpart here is over K'; the exponent bound pairs χ^i with χ^(1-i). -/
def chiPart (D : AnticyclotomicData T p) (i : ℤ) (V : GaloisRep K O) :
    Submodule O (HAt K O V D.base 1) :=
  {carrier := {x | ∀ g : Layer.Gal K D.base,
      cohomologyAction V D.base g x =
        (algebraMap (PadicInt p) O (((antiCharacter D g)^i).val)) • x},
    zero_mem' := sorry, add_mem' := sorry, smul_mem' := sorry}
def antiBaseLayer (D : AnticyclotomicData T p) : AntiLayer D := ⟨D.base,D.overBase,le_rfl⟩
/-- For the index, project to χ^i rather than measure distance to that eigenpart. -/
def chiProject (D : AnticyclotomicData T p) (i : ℤ) (V : GaloisRep K O) :
    HAt K O V D.base 1 →ₗ[O] HAt K O V D.base 1 := sorry
lemma chiProject_formula (D : AnticyclotomicData T p) (i : ℤ) (V : GaloisRep K O)
    (u : Oˣ) (hu : (u : O) = D.d) (x : HAt K O V D.base 1) :
    chiProject D i V x = (u⁻¹ : Oˣ).val •
      ∑ g : Layer.Gal K D.base,
        algebraMap (PadicInt p) O (((antiCharacter D g)^(-i)).val) •
          cohomologyAction V D.base g x := sorry

def antiOmega (D : AnticyclotomicData T p) : Subgroup (GK D.base.field) :=
  (antiHM D ⊓ representationKernel (Discrete T)).comap (layerGalois D.base)
instance antiOmega_normal (D : AnticyclotomicData T p) : (antiOmega D).Normal := sorry

theorem anticyclotomic_exponent_bound (D : AnticyclotomicData T p) (hD : AntiRayContract D)
    (c : AnticyclotomicEulerSystem D) (hodd : 2 < p)
    (hV : ResiduallyIrreducible (layerRep T D.base))
    (τ : GK K) (hτ : cyclotomicCharacter K p τ = D.chi τ)
    (hfixed : τ^D.d ∈ antiHM D) (hcoinv : RankOneCoinvariants T τ)
    (hker : antiOmega D ≤ representationKernel (layerRep (dualRep T) D.base))
    (hvan : Subsingleton (continuousCohomology 1
      (descentRep (layerRep (Discrete T) D.base) (antiOmega D) (by sorry))) ∧
      Subsingleton (continuousCohomology 1
        (descentRep (layerRep (dualRep T) D.base) (antiOmega D) hker)))
    (F : SelmerStructure D.base.field O (layerRep T D.base))
    (hF : ∀ v : Place D.base.field, F.condition v =
      finiteLatticeCondition (layerRep T D.base) v)
    (P : Conductor D.base.field) (hP : ∀ w, w ∈ P ↔ isAboveP p w)
    (dualDictionary : dualRep (layerRep T D.base) ≅ layerRep (dualRep T) D.base)
    (π : O) (hπ : IsLocalRing.maximalIdeal O = Ideal.span {π}) (i : ℤ) (j : ℕ)
    (hj : divisibilityIndex (R := O) (chiProject D i T (c.val.val (antiBaseLayer D))) = j) :
    ∀ s : (strict (dualRep (layerRep T D.base)) (dualStructure _ F) P).selmer,
      (TauCeti.ContinuousCohomology.coeffMap dualDictionary.hom 1).hom.toLinearMap s.val ∈
        LinearMap.range ((layerCohomology (dualRep T) D.base 1).toLinearMap.comp
          (chiPart D (1-i) (dualRep T)).subtype) → π^j • s = 0 := sorry
end TauCeti.EulerSystems

namespace TauCeti.KolyvaginSystems
open scoped DirectSum
variable {K R : Type} [Field K] [NumberField K] [CommRing R] [TopologicalSpace R]
variable [IsLocalRing R]
variable {T : Rep K R} [Module.Free R T] [Module.Finite R T]
variable {S : SelmerTriple K R T} {p : ℕ}
-- Blueprint node: EulerSystemsAndKolyvaginSystems:ES.5/rank-one-module-theorem
/-- MR04 Theorem 5.2.10 at an artinian coefficient level. -/
theorem rank_one_module_artinian (D : KolyvaginData T S p)
    (h : MR04Hypotheses T S p) (hR : PrincipalArtinian (R := R))
    (hP : AtLevel S p) (hr : latticeCoreRank T S.F = 1) :
    Nonempty (KolyvaginSystem D ≃ₗ[R] R) := sorry

theorem core_vertex_evaluation_bijective (D : KolyvaginData T S p)
    (h : MR04Hypotheses T S p) (hR : PrincipalArtinian (R := R))
    (hP : AtLevel S p) (hr : latticeCoreRank T S.F = 1)
    (n : Vertices S) (hn : IsCoreVertex D n) :
    Function.Bijective (KolyvaginSystem.eval D n) := sorry

-- Blueprint node: EulerSystemsAndKolyvaginSystems:ES.5/structure-theorem
/-- The elementary exponents are successive differences, not the partial indices. -/
def elementaryExponent (D : KolyvaginData T S p) (κ : KolyvaginSystem D) (i : ℕ) : ℕ :=
  (partialInvariant D κ i - partialInvariant D κ (i+1)).toNat

theorem structure_finite_quotient [IsDomain R] [IsDiscreteValuationRing R]
    (D : KolyvaginData T S p) (h : MR04Hypotheses T S p)
    (hr : latticeCoreRank T S.F = 1)
    (hsat : ∀ v ∈ S.F.sigma, Module.IsTorsionFree R (LocalH K R T v 1 ⧸ S.F.condition v))
    (hP : S.primes = {q | Sum.inr q ∉ S.F.sigma ∧ conductorIdeal04 T q ≤ IsLocalRing.maximalIdeal R})
    (κ : KolyvaginSystem D) (hκ : κ ≠ 0) :
    Nonempty (((dualStructure T S.F).selmer ⧸ divisiblePart (dualRep T) (dualStructure T S.F)) ≃ₗ[R]
      (⨁ i : ℕ, R ⧸ IsLocalRing.maximalIdeal R^
        (elementaryExponent D κ (i+(KolyvaginSystem.ord D κ).toNat)))) := sorry

-- Blueprint node: EulerSystemsAndKolyvaginSystems:ES.5/sharpness-examples
/-- A nonzero system whose first class is zero has an infinite dual Selmer group. -/
theorem nonzero_zero_initial_infinite [IsDomain R] [IsDiscreteValuationRing R]
    (D : KolyvaginData T S p) (h : MR04Hypotheses T S p)
    (hr : latticeCoreRank T S.F = 1)
    (hsat : ∀ v ∈ S.F.sigma, Module.IsTorsionFree R (LocalH K R T v 1 ⧸ S.F.condition v))
    (hP : S.primes = {q | Sum.inr q ∉ S.F.sigma ∧ conductorIdeal04 T q ≤ IsLocalRing.maximalIdeal R})
    (κ : KolyvaginSystem D) (hκ : κ ≠ 0) (h1 : κ.val (initialVertex S) = 0) :
    Module.length R (dualStructure T S.F).selmer = ⊤ := sorry

theorem scaling_strict_bound [IsDomain R] [IsDiscreteValuationRing R]
    (D : KolyvaginData T S p) (h : MR04Hypotheses T S p)
    (hr : latticeCoreRank T S.F = 1)
    (hsat : ∀ v ∈ S.F.sigma, Module.IsTorsionFree R (LocalH K R T v 1 ⧸ S.F.condition v))
    (hP : S.primes = {q | Sum.inr q ∉ S.F.sigma ∧ conductorIdeal04 T q ≤ IsLocalRing.maximalIdeal R})
    (κ : KolyvaginSystem D) (hκ : IsPrimitive D κ) (h1 : κ.val (initialVertex S) ≠ 0)
    (π : R) (hπ : IsLocalRing.maximalIdeal R = Ideal.span {π}) :
    Module.length R (dualStructure T S.F).selmer = partialInvariant D κ 0 ∧
    partialInvariant D (π • κ) 0 = partialInvariant D κ 0 + 1 ∧
    Module.length R (dualStructure T S.F).selmer < partialInvariant D (π • κ) 0 ∧
    ¬ IsPrimitive D (π • κ) := sorry
end TauCeti.KolyvaginSystems

namespace TauCeti.EulerSystems
open TauCeti.KolyvaginSystems TauCeti.StarkSystems
variable {K R : Type} [Field K] [NumberField K] [CommRing R] [TopologicalSpace R]
variable {T : HigherRep K R} [Module.Free R T] [Module.Finite R T] {A : Tower T}
-- Blueprint node: EulerSystemsAndKolyvaginSystems:ES.7/fitting-bounds
/-- Corollary 6.15 retains the full finite group-ring coefficients h.C. -/
theorem higherEuler_fitting_bound (E : EulerFactors T A) (M : R) (r : ℕ) (hr : 0 < r)
    (h : HigherDerivativeData E M r) (h611 : BSSHypothesis611 T A.p h.S.primes)
    (hf : BSSFiniteData h.S A.p r) (hp : 3 < A.p) (c : HigherEulerSystem E r) (i : ℕ) :
    KolyvaginSystemRank.ideal h.comparison r hr hf (higherDerivative E M r hr h h611 c) i ≤
      fittingIdeal (finiteDualSelmer h.S) i := sorry

theorem higherEuler_fitting_equality_zero (E : EulerFactors T A) (M : R) (r : ℕ) (hr : 0 < r)
    (h : HigherDerivativeData E M r) (h611 : BSSHypothesis611 T A.p h.S.primes)
    (hf : BSSFiniteData h.S A.p r) (hp : 3 < A.p) (c : HigherEulerSystem E r)
    (hκ : Submodule.span h.C {higherDerivative E M r hr h h611 c} = ⊤) :
    KolyvaginSystemRank.ideal h.comparison r hr hf (higherDerivative E M r hr h h611 c) 0 =
      fittingIdeal (finiteDualSelmer h.S) 0 := sorry
end TauCeti.EulerSystems

namespace TauCeti.StarkSystems
open TauCeti.KolyvaginSystems
variable {K R : Type} [Field K] [NumberField K] [CommRing R] [TopologicalSpace R]
variable {T : SelmerRep K R} [Module.Free R T] [Module.Finite R T]
-- Blueprint node: EulerSystemsAndKolyvaginSystems:ES.6/bidual-functoriality
/-- The local-condition comparison is a concrete kernel square in arithmetic H¹. -/
structure LocalConditionSquare (F' F : SelmerStructure K R T) (s : ℕ) where
  le : ∀ v, F'.condition v ≤ F.condition v
  localMap : F.selmer →ₗ[R] (Fin s → R)
  kernel : (LinearMap.ker localMap).map F.selmer.subtype = F'.selmer

def selmerBidualInclusion (F' F : SelmerStructure K R T)
    (h : ∀ v, F'.condition v ≤ F.condition v) (r : ℕ) :
    selmerBidual F' r →ₗ[R] selmerBidual F r := sorry
/-- Ordered contraction lands in the bidual of the smaller Selmer condition. -/
def contractLocalConditions [IsNoetherianRing R] [Module.Injective R R]
    (F' F : SelmerStructure K R T) [Module.Finite R F'.selmer] [Module.Finite R F.selmer]
    (s r : ℕ) (D : LocalConditionSquare F' F s) :
    selmerBidual F (r+s) →ₗ[R] selmerBidual F' r := sorry

/-- For one localization, the kernel of contraction is the smaller bidual image. -/
def contractLocalComponent (F : SelmerStructure K R T) (r : ℕ) (hr : 0 < r)
    (v : Module.Dual R F.selmer) : selmerBidual F r →ₗ[R] selmerBidual F (r-1) := sorry

theorem bidual_local_kernel [IsNoetherianRing R] [Module.Injective R R]
    (F' F : SelmerStructure K R T) [Module.Finite R F'.selmer] [Module.Finite R F.selmer]
    (r : ℕ) (hr : 0 < r) (D : LocalConditionSquare F' F 1) :
    LinearMap.range (selmerBidualInclusion F' F D.le r) =
      LinearMap.ker (contractLocalComponent F r hr (LinearMap.proj 0 |>.comp D.localMap)) := sorry
end TauCeti.StarkSystems

namespace TauCeti.KolyvaginSystems
open TauCeti.EulerSystems
variable {p : ℕ} [Fact p.Prime]
local instance : TopologicalSpace (IsLocalRing.ResidueField (PadicInt p)) := ⊥
-- Blueprint nodes: EulerSystemsAndKolyvaginSystems:ES.0/example-cyclotomic-twist
-- and EulerSystemsAndKolyvaginSystems:ES.0/non-example-inadmissible
/-- The Tate twist has its cyclotomic action on the actual rank-one p-adic carrier. -/
def tateOne : Rep ℚ (PadicInt p) := sorry
def tateOneEquiv : tateOne (p := p) ≃ₗ[PadicInt p] PadicInt p := sorry
lemma tateOne_action (g : GK ℚ) (x : tateOne (p := p)) :
    tateOneEquiv ((tateOne (p := p)).ρ g x) =
      (cyclotomicCharacter ℚ p g : PadicInt p) * tateOneEquiv x := sorry
instance tateOne_free : Module.Free (PadicInt p) (tateOne (p := p)) := sorry
instance tateOne_finite : Module.Finite (PadicInt p) (tateOne (p := p)) := sorry

def cyclotomicTwist (χ : GK ℚ →* (PadicInt p)ˣ) : Rep ℚ (PadicInt p) :=
  twistRep (tateOne (p := p)) χ⁻¹

theorem cyclotomicTwist_basic_hypotheses (hp : 2 < p)
    (χ : GK ℚ →* (PadicInt p)ˣ) (hχ : Continuous χ)
    (hf : IsOfFinOrder χ) (hcop : Nat.Coprime (orderOf χ) p) (hne : χ ≠ 1)
    (hω : χ ≠ TauCeti.RubinStark.ClassGroups.teichmullerCharacter (K := ℚ) (O := PadicInt p) p) :
    Nonempty (MR04BasicHypotheses (cyclotomicTwist χ) p) ∧
      ResidualHomVanishing (cyclotomicTwist χ) := sorry

theorem tateOne_dual_residual_invariants (hp : 2 < p) :
    Nontrivial (H ℚ (PadicInt p)
      (dualRep (quotientRep (tateOne (p := p)) (IsLocalRing.maximalIdeal (PadicInt p)))) 0) := sorry

theorem tateOne_not_mr04 (hp : 2 < p) (S : SelmerTriple ℚ (PadicInt p) (tateOne (p := p))) :
    IsEmpty (MR04Hypotheses (tateOne (p := p)) S p) := sorry

-- Blueprint node: EulerSystemsAndKolyvaginSystems:ES.0/example-elliptic
/-- The mod-p action is on the residue vector space, so its automorphisms are GL₂(F_p).
The Tate carrier and point-action dictionary are defined above in CGLS. -/
theorem elliptic_basic_hypotheses (E : WeierstrassCurve ℚ) [E.IsElliptic] (hp : 5 ≤ p)
    (hsurj : Function.Surjective (residualRep (CGLS.tateRep (p := p) E)).ρ) :
    Nonempty (MR04BasicHypotheses (CGLS.tateRep (p := p) E) p) := sorry
/- HE.7 supplies the local Kummer image and the Weil-pairing comparison needed
for the classical-structure and core-rank part of this example. Their full
geometry is stated in the packet; it is deliberately omitted from this prototype
until the HE.7 local-points dictionaries can be stated at the pinned baseline. -/
end TauCeti.KolyvaginSystems

namespace TauCeti.ErrorTolerant
open TauCeti.KolyvaginSystems
variable {K O : Type} [Field K] [NumberField K] [CommRing O] [TopologicalSpace O]
variable [IsDomain O] [IsDiscreteValuationRing O]
-- Blueprint node: EulerSystemsAndKolyvaginSystems:ES.4/abundant-localization
/-- Uniform local loss is independent of the modulus and of the saturated Selmer
submodule. The source's purity/polarization hypotheses imply the displayed local
finite-torsion criterion; their geometric realization is a supplier obligation. -/
theorem uniform_finite_local_annihilation (T : ErrorRep K O) [Module.Free O T] [Module.Finite O T]
    (hT : IsContinuous K O T) (π : O) (hπ : IsLocalRing.maximalIdeal O = Ideal.span {π})
    (F : SelmerStructure K O T) (places : Finset (Prime K)) (ell : ℕ)
    (hF : ∀ q ∈ places, ¬ isAboveP ell q → F.condition (Sum.inr q) = finiteLatticeCondition T (Sum.inr q))
    (hfin : ∀ q ∈ places, ¬ isAboveP ell q → Module.Finite O (finiteLatticeCondition T (Sum.inr q)))
    (htor : ∀ q ∈ places, ¬ isAboveP ell q → ∀ x : finiteLatticeCondition T (Sum.inr q),
      ∃ a : O, a ≠ 0 ∧ a • x = 0) :
    ∃ c : ℕ, ∀ (m : ℕ) (_ : c < m) (x : F.selmer) (q : Prime K) (_ : q ∈ places) (_ : ¬ isAboveP ell q),
      π^c • loc K O (quotientRep T (Ideal.span {π^m})) (Sum.inr q)
        ((TauCeti.ContinuousCohomology.coeffMap (quotientMap T (Ideal.span {π^m})) 1).hom.toLinearMap x.val) = 0 := sorry

/-- The diagonalization conclusion uses evaluation in an actual arithmetic
unramified local module. It yields a scaled spanning submodule at positive loss. -/
theorem abundant_local_diagonalization (T : ErrorRep K O) [Module.Free O T] [Module.Finite O T]
    (π : O) (hπ : IsLocalRing.maximalIdeal O = Ideal.span {π}) (m c r : ℕ)
    (S : Submodule O (H K O (quotientRep T (Ideal.span {π^m})) 1))
    (eS : S ≃ₗ[O] (Fin r → O ⧸ Ideal.span {π^m}))
    (w : Fin r → Prime K)
    (unram : ∀ (i : Fin r) (s : S), loc K O _ (Sum.inr (w i)) s.val ∈
      unramified K O (quotientRep T (Ideal.span {π^m})) (Sum.inr (w i)))
    (eval : ∀ i, unramified K O (quotientRep T (Ideal.span {π^m})) (Sum.inr (w i)) ≃ₗ[O]
      O ⧸ Ideal.span {π^m})
    (A : Matrix (Fin r) (Fin r) (O ⧸ Ideal.span {π^m}))
    (hA : ∀ (s : S) i, A.mulVec (eS s) i =
      eval i ⟨loc K O _ (Sum.inr (w i)) s.val,unram i s⟩)
    (hab : Ideal.span {(Ideal.Quotient.mk (Ideal.span {π^m}) π)^c} •
      (⊤ : Submodule (O ⧸ Ideal.span {π^m}) (Fin r → O ⧸ Ideal.span {π^m})) ≤
        LinearMap.range A.mulVecLin) :
    ∃ s : Fin r → S,
      (∀ i j, i ≠ j → loc K O _ (Sum.inr (w i)) (s j).val = 0) ∧
      (∀ i, (m-c : ℕ∞) ≤ expAt π (loc K O _ (Sum.inr (w i)) (s i).val)) ∧
      Ideal.span {π^c} • (⊤ : Submodule O S) ≤ Submodule.span O (Set.range s) := sorry
end TauCeti.ErrorTolerant

namespace TauCeti.RubinStark
open TauCeti.KolyvaginSystems
variable {K : Type} [Field K] [NumberField K]
variable {F : Layer K} [IsMulCommutative (Layer.Gal K F)]
variable {S T : Finset (Prime K)} {r : ℕ}
-- Blueprint node: EulerSystemsAndKolyvaginSystems:ES.7/rubin-stark-minus-comparison
/-- A CM minus extension over a totally real base cannot satisfy the archimedean
splitting hypothesis of the BSS even-character application. -/
theorem cm_not_archimedean_split (D : Data F S T r) (v : NumberField.InfinitePlace K) :
    ¬ decomposition K (Sum.inl v) ≤ F.group := sorry
/-- Even characters kill the minus component after scalar extension with 2 invertible. -/
theorem even_character_kills_minus (D : Data F S T r)
    (E : Type) [Field E] [CharZero E] [Algebra ℚ E] (χ : AbelianGal F →* Eˣ)
    (hχ : χ D.c = 1) (x : minusGroupRing D) :
    MonoidAlgebra.lift ℚ E (AbelianGal F) ((Units.coeHom E).comp χ) x.val = 0 := sorry
end TauCeti.RubinStark
