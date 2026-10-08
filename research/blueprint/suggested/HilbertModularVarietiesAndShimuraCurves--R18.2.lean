/-
This file is not the roadmap and is not exhaustive. The roadmap document is definitive.
The statements suggest Lean forms so contributors and reviewers converge on names and
signatures. Every proof is a placeholder; no implementation is claimed.

Baseline: Tau Ceti f790474821cf4256814db967cb154e7af3d0c369;
Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174.
The typed prototypes import only Mathlib modules. The full quaternionic statements need
supplier carriers absent at this baseline. Their precise signatures are omitted and
recorded in the declaration ledger below, following PROTOCOL §13; they are not replaced
by arbitrary propositions or predicate fields. In particular no adelic topology,
crystalline filtration, formal-moduli functor or étale cohomology is fabricated here.
-/
import Mathlib.GroupTheory.DoubleCoset
import Mathlib.GroupTheory.QuotientGroup.Basic
import Mathlib.Algebra.Module.Equiv.Basic
import Mathlib.Algebra.MvPolynomial.Eval
import Mathlib.RingTheory.Ideal.Maps
import Mathlib.RingTheory.Ideal.Quotient.Defs
import Mathlib.Data.ZMod.Basic
import Mathlib.Basic.Complex.Basic
import Mathlib.RingTheory.MvPolynomial.Homogeneous
import Mathlib.LinearAlgebra.PiTensorProduct.Basic
import Mathlib.LinearAlgebra.Projectivization.Cardinality
import Mathlib.Algebra.Quaternion
import Mathlib.LinearAlgebra.TensorProduct.Basic
import Mathlib.LinearAlgebra.Dimension.Finrank

noncomputable section
namespace TauCeti.Blueprint.Quaternionic

section ClassSet
variable {G : Type*} [Group G]

/-- The existing double-coset carrier with supplied rational and central-level subgroups.
The arithmetic specialization Γ=D× and R=UZ is a supplier obligation, not a new quotient. -/
def DefiniteClassSet (Γ R : Subgroup G) : Type _ := by
  exact DoubleCoset.Quotient (Γ : Set G) (R : Set G)

lemma DefiniteClassSet.quotient (Γ R : Subgroup G) :
    DefiniteClassSet Γ R = DoubleCoset.Quotient (Γ : Set G) (R : Set G) := by
  sorry

-- DefiniteClassSet.doubleCosetEquality: the arithmetic centre is supplied as Z.
-- The factorisation hypothesis specifies R=UZ without confusing product with a union.
example (Γ U Z R : Subgroup G)
    (hR : ∀ r : G, r ∈ R ↔ ∃ u ∈ U, ∃ z ∈ Z, r = u * z) (t t' : G) :
    DoubleCoset.mk Γ R t = DoubleCoset.mk Γ R t' ↔
      ∃ d ∈ Γ, ∃ u ∈ U, ∃ z ∈ Z, t' = d * t * (u * z) := by
  sorry
end ClassSet

namespace QuaternionTWLevel
/-- Only the diamond factor is typed here. Δ' must already be the maximal residue
p-quotient; existence of residue fields, adelic U and its ratio map is not restated. -/
def torsionSubgroup (Δ' : Type*) [CommGroup Δ'] (N : ℕ) : Subgroup Δ' := by
  refine { carrier := {g | g ^ N = 1}, one_mem' := ?_, mul_mem' := ?_, inv_mem' := ?_ }
  all_goals sorry

lemma mem_torsionSubgroup (Δ' : Type*) [CommGroup Δ'] (N : ℕ) (g : Δ') :
    g ∈ torsionSubgroup Δ' N ↔ g ^ N = 1 := by
  sorry

/-- QuaternionTWLevel.diamondGroup: factor of the full product Δ_Q, rather than
claiming that a bare quotient group defines the complete quaternionic level. -/
def diamondFactor (Δ' : Type*) [CommGroup Δ'] (N : ℕ) : Type _ := by
  exact Δ' ⧸ torsionSubgroup Δ' N

def diamondGroup {Q : Type*} (Δ' : Q → Type*) [∀ v, CommGroup (Δ' v)]
    (N : ℕ) : Type _ := by
  exact ∀ v, diamondFactor (Δ' v) N

-- QuaternionTWLevel.empty: the group factor is trivial at the empty index;
-- equality U_Q=U requires the omitted adelic level carrier.
example : Subsingleton (diamondGroup (Q := Empty) (fun _ => ℤˣ) 2) := by
  sorry
end QuaternionTWLevel

section NormTwist
variable {G A O W : Type*} [Group G] [CommGroup A] [CommRing O]
  [AddCommGroup W] [Module O W]

/-- The actual O-linear norm multiplier on coefficient functions. Its restriction to
AF.5 forms is omitted until the central-character function carrier is supplied. -/
def DyadicNormTwist (nr : G →* A) (χ : A →* Oˣ) : (G → W) ≃ₗ[O] (G → W) := by
  refine
    { toFun := fun f g => (χ (nr g) : O) • f g
      invFun := fun f g => (((χ (nr g))⁻¹ : Oˣ) : O) • f g
      left_inv := ?_
      right_inv := ?_
      map_add' := ?_
      map_smul' := ?_ }
  all_goals sorry

lemma DyadicNormTwist.apply (nr : G →* A) (χ : A →* Oˣ) (f : G → W) (g : G) :
    DyadicNormTwist nr χ f g = (χ (nr g) : O) • f g := by
  sorry

lemma DyadicNormTwist.involutive (nr : G →* A) (χ : A →* Oˣ)
    (hχ : ∀ a, χ a * χ a = 1) : Function.Involutive (DyadicNormTwist (W := W) nr χ) := by
  sorry

-- The centre part of DyadicNormTwist.centralCharacter. Actual central embeddings and
-- the AF.5 equation f(gz)=ψ(z)f(g) are omitted supplier inputs.
lemma DyadicNormTwist.centralCharacter (nr : G →* A) (χ : A →* Oˣ)
    (hχ : ∀ a, χ a * χ a = 1) (g z : G) (a : A) (hz : nr z = a ^ 2)
    (f : G → W) (ψ : O) (hf : f (g * z) = ψ • f g) :
    DyadicNormTwist nr χ f (g * z) = ψ • DyadicNormTwist nr χ f g := by
  sorry

lemma DyadicNormTwist.reduction {k : Type*} [Field k] [CharP k 2]
    (red : O →+* k) (nr : G →* A) (χ : A →* Oˣ)
    (hχ : ∀ a, χ a * χ a = 1) (f : G → O) (g : G) :
    red (DyadicNormTwist nr χ f g) = red (f g) := by
  sorry

-- DyadicNormTwist.trivial
example (nr : G →* A) (f : G → W) : DyadicNormTwist (O := O) nr 1 f = f := by
  sorry
-- DyadicNormTwist.scalar
example (χ : A →* Oˣ) (hχ : ∀ a, χ a * χ a = 1) (z : A) :
    (χ (z ^ 2) : O) = 1 := by
  sorry
-- DyadicNormTwist.nonquadratic: the scalar square of the order-four value i.
example : Complex.I ^ 2 = (-1 : ℂ) ∧ Complex.I ^ 2 ≠ 1 := by
  sorry
end NormTwist

section ResidualKernel
variable {V O k : Type*} [CommRing O] [Field k]

/-- Arithmetic trace/determinant values are given as data. The inverse norm is a unit.
This does not assert existence of a Galois eigensystem in the acting Hecke algebra. -/
def residualEvaluation (red : O →+* k) (q : V → kˣ)
    (tr det : V → k) : MvPolynomial (V × Fin 2) O →+* k := by
  exact MvPolynomial.eval₂Hom red (fun i => if i.2 = 0 then tr i.1 else
    ((q i.1)⁻¹ : kˣ) * det i.1)

def ResidualHeckeIdeal (red : O →+* k) (q : V → kˣ)
    (tr det : V → k) : Ideal (MvPolynomial (V × Fin 2) O) := by
  exact RingHom.ker (residualEvaluation red q tr det)

lemma ResidualHeckeIdeal.evalT (red : O →+* k) (q : V → kˣ)
    (tr det : V → k) (v : V) :
    residualEvaluation red q tr det (MvPolynomial.X (v, 0)) = tr v := by
  sorry
lemma ResidualHeckeIdeal.evalS (red : O →+* k) (q : V → kˣ)
    (tr det : V → k) (v : V) :
    residualEvaluation red q tr det (MvPolynomial.X (v, 1)) =
      ((q v)⁻¹ : kˣ) * det v := by
  sorry
lemma ResidualHeckeIdeal.maximal (red : O →+* k) (hred : Function.Surjective red)
    (q : V → kˣ) (tr det : V → k) : (ResidualHeckeIdeal red q tr det).IsMaximal := by
  sorry
-- ResidualHeckeIdeal.actingFactor: genuine algebraic quotient factor once the acting
-- relations are known to be killed. R19 must supply this inclusion for its eigensystem.
lemma ResidualHeckeIdeal.actingFactor (red : O →+* k) (q : V → kˣ) (tr det : V → k)
    (I : Ideal (MvPolynomial (V × Fin 2) O))
    (hI : I ≤ ResidualHeckeIdeal red q tr det) :
    ∃ f : (MvPolynomial (V × Fin 2) O ⧸ I) →+* k,
      f.comp (Ideal.Quotient.mk I) = residualEvaluation red q tr det := by
  sorry

-- ResidualHeckeIdeal.normThree
example : (3 : ZMod 7)⁻¹ * 6 = 2 := by
  sorry
-- ResidualHeckeIdeal.scalarDeterminant
example (q : kˣ) (d : k) : (q : k) * ((q⁻¹ : kˣ) * d) = d := by
  sorry
-- ResidualHeckeIdeal.nonsurjective
example : ¬ (RingHom.ker (Int.castRingHom ℚ)).IsMaximal := by
  sorry
end ResidualKernel

section CoefficientsAndCounts
/-! Prototypes added by the independent review: the parts of the packet's weight,
point-set and counting statements that the pinned Mathlib can already express. The
group actions, analytic structure and moduli interpretations stay in the ledger. -/

open scoped TensorProduct LinearAlgebra.Projectivization

/-- Sym^{k−2}(O²) as the homogeneous polynomials of degree k−2 in two variables, the model
of the coefficient factor in QuaternionWeight. The U_p-action through the chosen
splittings is the AF.4 coefficient-lattice input and is not restated here. -/
abbrev SymWeight (O : Type*) [CommRing O] (k : ℕ) : Submodule O (MvPolynomial (Fin 2) O) :=
  MvPolynomial.homogeneousSubmodule (Fin 2) O (k - 2)

/-- QuaternionWeight, underlying module only: parallel weight k over d embeddings,
⊗_{σ} Sym^{k−2}(O²). -/
abbrev QuaternionWeight (O : Type*) [CommRing O] (d k : ℕ) : Type _ :=
  ⨂[O] (_ : Fin d), SymWeight O k

lemma QuaternionWeight.rank (O : Type*) [CommRing O] [Nontrivial O] (d k : ℕ) (hk : 2 ≤ k) :
    Module.finrank O (QuaternionWeight O d k) = (k - 1) ^ d := by
  sorry

-- QuaternionWeight.weightTwoRank
example (O : Type*) [CommRing O] [Nontrivial O] (d : ℕ) :
    Module.finrank O (QuaternionWeight O d 2) = 1 := by
  sorry
-- QuaternionWeight.quadraticWeightFour
example (O : Type*) [CommRing O] [Nontrivial O] :
    Module.finrank O (QuaternionWeight O 2 4) = 9 := by
  sorry

/-- DrinfeldHalfPlane.points: the C-points P¹(C) ∖ P¹(K) of Ω_K. Only the point set is
typed; the rigid-analytic open and its affinoid exhaustion need an analytic carrier that
the pinned libraries lack. -/
def DrinfeldHalfPlane.points (K C : Type*) [Field K] [Field C] [Algebra K C] :
    Set (ℙ C (Fin 2 → C)) :=
  {x | ∀ (v : Fin 2 → K) (hv : (fun i => algebraMap K C (v i)) ≠ 0),
    x ≠ Projectivization.mk C (fun i => algebraMap K C (v i)) hv}

lemma DrinfeldHalfPlane.affineChart (K C : Type*) [Field K] [Field C] [Algebra K C] (z : C)
    (h : (![z, 1] : Fin 2 → C) ≠ 0) :
    Projectivization.mk C ![z, 1] h ∈ DrinfeldHalfPlane.points K C ↔
      z ∉ Set.range (algebraMap K C) := by
  sorry

-- DrinfeldHalfPlane.infinity
example (K C : Type*) [Field K] [Field C] [Algebra K C] (h : (![1, 0] : Fin 2 → C) ≠ 0) :
    Projectivization.mk C ![1, 0] h ∉ DrinfeldHalfPlane.points K C := by
  sorry
-- DrinfeldHalfPlane.quadraticPoint: a point of a quadratic extension outside K.
example (K C : Type*) [Field K] [Field C] [Algebra K C] (z : C)
    (hz : z ∉ Set.range (algebraMap K C)) (h : (![z, 1] : Fin 2 → C) ≠ 0) :
    Projectivization.mk C ![z, 1] h ∈ DrinfeldHalfPlane.points K C := by
  sorry

-- DrinfeldExhaustion.residueTwo, DrinfeldFormalModel.qTwo and QuaternionDegeneracy.qTwo:
-- the edges at a vertex, the branches through a component and the index
-- [GL₂(O_w) : U₀(w)] are all counted by P¹(k); for k = F₂ there are three.
example (k : Type*) [Field k] [Fintype k] (hk : Fintype.card k = 2) :
    Nat.card (ℙ k (Fin 2 → k)) = 3 := by
  sorry
-- DrinfeldExhaustion.firstSphere: the central vertex and its q+1 neighbours.
example (k : Type*) [Field k] [Fintype k] :
    Nat.card (ℙ k (Fin 2 → k)) + 1 = Fintype.card k + 2 := by
  sorry

-- QuaternionTWLevel.cyclicOrder: C₈ modulo its 2-torsion is C₄.
example : Nat.card (QuaternionTWLevel.diamondFactor (Multiplicative (ZMod 8)) 2) = 4 := by
  sorry
-- QuaternionTWLevel.torsionNotPowers: C₈ modulo its squares has order 2.
example : Nat.card (Multiplicative (ZMod 8) ⧸
    (powMonoidHom 2 : Multiplicative (ZMod 8) →* Multiplicative (ZMod 8)).range) = 2 := by
  sorry

-- QuaternionPDiv.splitRank: for B_v = M₂(Q_p), H_v[p] ≅ M₂(F_p) and e₁₁H_v[p] ≅ F_p².
example (p : ℕ) [Fact p.Prime] :
    Fintype.card (Fin 2 → Fin 2 → ZMod p) = p ^ 4 ∧ Fintype.card (Fin 2 → ZMod p) = p ^ 2 := by
  sorry

-- QuaternionPELInstance.regularDimension: for F = Q, dim_Q (B ⊗ E) = 8, so the abelian
-- variety with H₁ ≅ B′ has dimension 4, not 2.
open Quaternion in
example (E : Type*) [Field E] [Algebra ℚ E] (hE : Module.finrank ℚ E = 2) (a b : ℚ) :
    Module.finrank ℚ (ℍ[ℚ,a,b] ⊗[ℚ] E) / 2 = 4 := by
  sorry

/-- QuaternionHodgeLine.metric: the archimedean norm of dz at z in the upper half-plane,
‖dz‖ = 2 Im z (YZ Theorem 4.7(3)). -/
def QuaternionHodgeLine.metric (z : ℂ) : ℝ := 2 * z.im

-- QuaternionHodgeLine.imaginaryUnit
example : QuaternionHodgeLine.metric Complex.I = 2 := by
  sorry
end CoefficientsAndCounts

end TauCeti.Blueprint.Quaternionic

/-!
# Declaration ledger: full targets and omitted signatures

Only the elementary prototypes above are typed declarations. The section
`CoefficientsAndCounts` types the underlying weight module, the point set of Ω_K and the
counting tests; the full entries below remain the definitive statements. Each entry below gives
the exact packet target, hypotheses, API and tests; none is a hidden Lean declaration.
The geometry requires supplied formal objects; the adelic specializations require
AF.5 and AA carriers. Replace the corresponding entries with actual signatures when
those carriers exist, without changing their hypotheses.

HilbertModularVarietiesAndShimuraCurves:R18.2/quaternion-pel-instance
QuaternionPELInstance [construction]: For E=F(√λ), λ<0 rational with p split in Q(√λ), specialize the shared PEL datum to B′=B⊗F E, V′=B′, ψ′(x,y)=Tr_E/Q Trd_B′/E(γ′xȳ), and involution b*=γ′⁻¹ b̄γ′. At p use O_B′,p=O_B,p*⊕O_B,p and the self-dual lattice O_B,p^∨⊕O_B,p. Verify the special O_B,v Lie condition and zero Lie component away from v. This full regular representation has abelian dimension 4[F:Q]; the Morita-reduced E-representation has dimension 2[F:Q]. Generic PEL moduli and representability are imports.
Hypotheses: F totally real; B/F a division quaternion algebra split at exactly one real place τ; canonical compact curve X_U/F supplied by R18.1. A maximal finite-adelic order O_B and its local split identifications are fixed; v|p and K=completion of F_v^ur. γ′ chosen with the required positivity; sufficiently small tame level; integral trace/different factors retained.
QuaternionPELInstance.tracePairing [data]: The specialized pairing is Tr_E/Q Trd(γ′xȳ), with its induced involution.
QuaternionPELInstance.selfDual [characterisation]: The chosen p-lattice equals its pairing dual.
QuaternionPELInstance.lieCondition [characterisation]: The active v-part is special of rank one over the unramified quadratic order, and the complementary Lie part is zero.
QuaternionPELInstance.genericComparison [compatibility]: The represented generic curve is the auxiliary canonical X′ at the specified level.
QuaternionPELInstance.regularDimension [example, computation]: For F=Q the full B′ regular representation yields abelian dimension 4, not 2.
QuaternionPELInstance.moritaDimension [example, compatibility]: For F=Q the Morita-reduced E-instance yields abelian dimension 2.
QuaternionPELInstance.dualLattice [example, non-example]: If the trace lattice is not self-dual, O_B,p⊕O_B,p fails the perfect-pairing test; replacing the first factor by its dual passes.

HilbertModularVarietiesAndShimuraCurves:R18.2/effective-small-level
EffectiveSmallLevel [theorem]: If U⊂(1+N O_B)^× with integer N≥3, each geometric connected component of X_U has genus at least 2 and its arithmetic group acts freely on the upper half-plane after quotienting by F×. The effective tower action divides out the closure of F× in B_f×; for F≠Q the closure must not be replaced by the discrete rational centre.
Hypotheses: F totally real; B/F a division quaternion algebra split at exactly one real place τ; canonical compact curve X_U/F supplied by R18.1. A maximal finite-adelic order O_B and its local split identifications are fixed; v|p and K=completion of F_v^ur. Compact curve hypothesis; principal level N≥3.

HilbertModularVarietiesAndShimuraCurves:R18.2/quaternion-pdiv-tower
QuaternionPDiv [definition]: On the pro-level canonical curve define H_n=(B_p/O_B,p×X)/U_p(n), with U_p(n)=(1+n O_B,p)^× acting on the fibre by right multiplication and n supported above p. For each fixed torsion level m, shrink tame level until U_p(1)/U_p(m) acts freely; H_n[m] then descends as a finite étale O_B,p-module on that finite generic level. Do not assert a common finite tame level for the entire p-divisible group without proof.
Hypotheses: F totally real; B/F a division quaternion algebra split at exactly one real place τ; canonical compact curve X_U/F supplied by R18.1. A maximal finite-adelic order O_B and its local split identifications are fixed; v|p and K=completion of F_v^ur. The effective free pro-level action and all fibre actions are specified; n may be 1.
QuaternionPDiv.torsion [projection]: H_n[m] has fibre m⁻¹O_B,p/O_B,p.
QuaternionPDiv.changeLevel [functoriality]: Pullback along n′-level to n-level identifies H_n with H_n′.
QuaternionPDiv.splitMorita [compatibility]: At split v, e11H_v identifies with Carayol E∞.
QuaternionPDiv.finiteDescent [structure]: For each m a sufficiently small tame level supports its descended finite étale sheaf.
QuaternionPDiv.unitTorsion [example, degenerate]: H_n[O_F]=0.
QuaternionPDiv.splitRank [example, computation]: For F_v=Q_p and B_v=M₂(Q_p), H_v[p] has geometric cardinality p^4; e11H_v[p] has cardinality p^2.
QuaternionPDiv.rightAction [example, characterisation]: A local unit u sends a fibre element x to xu; replacing it by ux generally gives a different action.

HilbertModularVarietiesAndShimuraCurves:R18.2/connected-pel-comparison
ConnectedPelComparison [comparison]: Over F̄ identify the identity pro-components X⁰ and X′⁰ equivariantly for the norm-positive effective groups Δ̄≅Δ̄′. After quotient by O_B,p^1, whose identity components X₁⁰ and X′₁⁰ are defined over K, identify H|X₁⁰ with H′|X′₁⁰ with the transported effective group action. The comparison is of connected components with specified descent, not an isomorphism of the full unrelated global towers.
Hypotheses: F totally real; B/F a division quaternion algebra split at exactly one real place τ; canonical compact curve X_U/F supplied by R18.1. A maximal finite-adelic order O_B and its local split identifications are fixed; v|p and K=completion of F_v^ur. The auxiliary split CM choice and effective central kernels are fixed.

HilbertModularVarietiesAndShimuraCurves:R18.2/finite-pel-comparison
FinitePelComparison [comparison]: For n supported above p and coprime to d_B, and tame U^p sufficiently small depending on n, choose U′^p so that the connected n-level quaternionic and auxiliary PEL curves are isomorphic over K; the maps and coefficient sheaves agree under this isomorphism.
Hypotheses: F totally real; B/F a division quaternion algebra split at exactly one real place τ; canonical compact curve X_U/F supplied by R18.1. A maximal finite-adelic order O_B and its local split identifications are fixed; v|p and K=completion of F_v^ur. n prime to the quaternion discriminant; smallness depends on n.

HilbertModularVarietiesAndShimuraCurves:R18.2/carayol-split-model
CarayolSplitModel [theorem]: If B_v is split, U_v=GL₂(O_v) and tame level is sufficiently small, X_U has a proper smooth model over O_v with canonical generic fibre; at principal v^n level the normalised cover is the regular model representing the Drinfeld-basis level problem on the special one-dimensional height-two O_v-divisible group. Transition and tame Hecke maps extend over O_v. Higher v-level models are not asserted smooth or semistable.
Hypotheses: F totally real; B/F a division quaternion algebra split at exactly one real place τ; canonical compact curve X_U/F supplied by R18.1. A maximal finite-adelic order O_B and its local split identifications are fixed; v|p and K=completion of F_v^ur. Carayol assumes [F:Q]>1; for Q use the modular or fake-elliptic supplier separately. The p-components away from v meet the source’s fixed-level hypotheses.

HilbertModularVarietiesAndShimuraCurves:R18.2/regular-model-tower
RegularModelTower [theorem]: Let n be coprime to d_B and U^p⊂U^p(N) for an integer N≥3 prime to p. The minimal regular models X_{n,U^p}/O_v form a projective system extending canonical level maps. At v∤n the model is smooth if B_v splits and a semistable relative Mumford curve if B_v is division. The division case has maximal local level.
Hypotheses: F totally real; B/F a division quaternion algebra split at exactly one real place τ; canonical compact curve X_U/F supplied by R18.1. A maximal finite-adelic order O_B and its local split identifications are fixed; v|p and K=completion of F_v^ur. Fine principal tame level as stated; no assertion for arbitrary level at d_B.

HilbertModularVarietiesAndShimuraCurves:R18.2/coarse-model
CoarseModel [theorem]: For any decomposed compact open U maximal at each prime dividing d_B, construct X_U as the effective finite quotient of a sufficiently small normal fine model. It is normal, projective and flat over O_F, independent of the auxiliary prime used to rigidify level, and has canonical generic fibre. The quotient map is finite of degree the effective group order; it need not be flat everywhere or have regular target.
Hypotheses: F totally real; B/F a division quaternion algebra split at exactly one real place τ; canonical compact curve X_U/F supplied by R18.1. A maximal finite-adelic order O_B and its local split identifications are fixed; v|p and K=completion of F_v^ur. Fine normal cover U′⊂U and effective group Ū/Ū′; maximality at d_B.

HilbertModularVarietiesAndShimuraCurves:R18.2/hecke-integral-extension
HeckeIntegralExtension [theorem]: For admissible levels maximal at d_B, a finite generic level map extends to the model tower. Tame Hecke correspondences whose local v-component preserves the specified model problem extend via the two finite maps from the common intersection level, with composition and generic-fibre agreement. Finite étaleness over O_v is asserted only when local p-level/lattice data are unchanged and the relevant PEL deformation criterion applies.
Hypotheses: F totally real; B/F a division quaternion algebra split at exactly one real place τ; canonical compact curve X_U/F supplied by R18.1. A maximal finite-adelic order O_B and its local split identifications are fixed; v|p and K=completion of F_v^ur. Both source, target and intersection levels satisfy the model hypotheses. No unqualified extension of every p-isogeny as an étale map.

HilbertModularVarietiesAndShimuraCurves:R18.2/qfactorial-model
QfactorialModel [theorem]: If L/F is finite and unramified at all finite places where B ramifies or U is not maximal, X_U⊗O_L is Q-factorial: every Weil divisor has a positive multiple Cartier. This does not assert regularity of the coarse model.
Hypotheses: F totally real; B/F a division quaternion algebra split at exactly one real place τ; canonical compact curve X_U/F supplied by R18.1. A maximal finite-adelic order O_B and its local split identifications are fixed; v|p and K=completion of F_v^ur. U maximal at d_B; unramified base change at the bad set.

HilbertModularVarietiesAndShimuraCurves:R18.2/arithmetic-hodge-line
QuaternionHodgeLine [construction]: Specialize the imported rational line-bundle and metric theory to the unique hermitian Q-line L_U on X_U: compatible under level pullback, equal locally to the relative dualizing line at fine level and maximal U_v, with archimedean norm |dz|=2 Im z. On the coarse generic fibre L_U=ω_{X_U/F}+Σ_Q(1−1/e_Q)[Q]. Extend by norms from fine models and glue away from two auxiliary primes.
Hypotheses: F totally real; B/F a division quaternion algebra split at exactly one real place τ; canonical compact curve X_U/F supplied by R18.1. A maximal finite-adelic order O_B and its local split identifications are fixed; v|p and K=completion of F_v^ur. U maximal at d_B; fine models and rational line bundles supplied; e_Q is the effective ramification index.
QuaternionHodgeLine.pullback [functoriality]: Every admissible level map pulls L_target back to L_source.
QuaternionHodgeLine.fineDualizing [compatibility]: At fine maximal local level L_U|O_v is the relative dualizing line.
QuaternionHodgeLine.coarseCorrection [characterisation]: At branch point Q the correction coefficient is 1−1/e_Q.
QuaternionHodgeLine.metric [data]: Under uniformisation the differential dz has norm 2 Im z.
QuaternionHodgeLine.unique [characterisation]: Any system of hermitian Q-line bundles on the models X_U (U maximal at d_B) that is compatible with level pullback, equals the relative dualizing line at fine level and maximal U_v, and has archimedean metric |dz|=2 Im z, is canonically isomorphic to L_U (YZ Theorem 4.7, uniqueness).
QuaternionHodgeLine.unramified [example, degenerate]: When every e_Q=1, the generic L_U equals ω.
QuaternionHodgeLine.indexTwo [example, computation]: At an effective ramification point of index 2, the correction is [Q]/2.
QuaternionHodgeLine.imaginaryUnit [example, computation]: At z=i, |dz|=2.

HilbertModularVarietiesAndShimuraCurves:R18.2/integral-pdiv
IntegralPdiv [theorem]: For n prime to d_B the generic H_n extends over the pro-limit of fine models over O_K. Its v-factor is a strict special formal O_B,v-module and the factors away from v are étale. The completed maximal-local-level model is the deformation space with the prescribed O_B-action; n=v^a n′ level classifies a Drinfeld v^a-basis and a full étale n′-level structure. At division v the allowed n has a=0.
Hypotheses: F totally real; B/F a division quaternion algebra split at exactly one real place τ; canonical compact curve X_U/F supplied by R18.1. A maximal finite-adelic order O_B and its local split identifications are fixed; v|p and K=completion of F_v^ur. Strict O_v-module convention; active relative Lie rank 2 and O_v-height 4; absolute p-height 4[F_v:Q_p].

HilbertModularVarietiesAndShimuraCurves:R18.2/integral-kodaira-spencer
IntegralKodairaSpencer [theorem]: Using the strict O_v-relative crystal with rank-2 Hodge pieces W,W^t, set N=det W⊗det W^t. The determinant of the Kodaira–Spencer map identifies N with ω^{⊗2}(−d_B,v), where d_B,v=0 at split v and the reduced special fibre at division v. At ramified F_v/Q_p this target requires the relative/saturated filtration, not the raw τ-quotient of the absolute crystal.
Hypotheses: F totally real; B/F a division quaternion algebra split at exactly one real place τ; canonical compact curve X_U/F supplied by R18.1. A maximal finite-adelic order O_B and its local split identifications are fixed; v|p and K=completion of F_v^ur. Fine regular finite-level models; maximal v-level; relative Dieudonné filtration and Cartier dual convention explicitly supplied.

HilbertModularVarietiesAndShimuraCurves:R18.2/bridge-tate-comparison
BridgeTateComparison [comparison]: Import the canonical torus Y and datum morphism (X×Y)/Δ(A_F,f×)≅X″ from R18.1, with Δ(z)=(z,z⁻¹) and effective rational-central closures. On X₁×Y₁, identify f₁*T(H″) with π₁*T(H)⊗O_E,p π₂*T(I), where I=(E_p/O_E,p×Y)/O_E,p×. The two centre actions cancel and H″|X′=H′.
Hypotheses: F totally real; B/F a division quaternion algebra split at exactly one real place τ; canonical compact curve X_U/F supplied by R18.1. A maximal finite-adelic order O_B and its local split identifications are fixed; v|p and K=completion of F_v^ur. E embeds in B; the maximal order contains O_E,p, not merely its units; prescribed nearby CM types.

HilbertModularVarietiesAndShimuraCurves:R18.2/bridge-integral-model
BridgeIntegralModel [theorem]: Over K′, the completed maximal unramified reflex extension at v′, the bridge identifies X″₁ with the quotient of X₁×Y₁. Extending Y₁ by copies of Spec O_K′ transports the model of X₁ to a flat model of X″₁ and its open-and-closed X′₁ components. It is smooth if B_v splits and has stable Mumford fibres if B_v is division; ramified K′/K base change need not preserve regularity.
Hypotheses: F totally real; B/F a division quaternion algebra split at exactly one real place τ; canonical compact curve X_U/F supplied by R18.1. A maximal finite-adelic order O_B and its local split identifications are fixed; v|p and K=completion of F_v^ur. The bridge’s effective quotient and descent data are supplied.

HilbertModularVarietiesAndShimuraCurves:R18.2/bridge-point-extension
BridgePointExtension [theorem]: For a finite L/K′ and points y∈Y₁(L), x′∈X′₁(L), x″∈X″₁(L), the corresponding I_y,H′_x′,H″_x″ extend uniquely over O_L. For H″ use the Tate tensor, checking that at each embedding only one factor contributes weight −1 so that no weight −2 occurs. The p=2 case requires the integral Barsotti–Tate classification including the dyadic theorem. This is pointwise and does not by itself construct a global universal abelian scheme.
Hypotheses: F totally real; B/F a division quaternion algebra split at exactly one real place τ; canonical compact curve X_U/F supplied by R18.1. A maximal finite-adelic order O_B and its local split identifications are fixed; v|p and K=completion of F_v^ur. Integral crystalline lattice functor and full faithfulness over O_L; a finite extension may be used to lift the bridge point.

HilbertModularVarietiesAndShimuraCurves:R18.2/bridge-filtered-crystal
BridgeFilteredCrystal [comparison]: The covariant filtered integral crystal of H″_x″ is the coefficient tensor of those of H_x and I_y over O_E,p, with base change to O_L. This is a structured crystalline tensor comparison supplied by the integral p-adic Hodge owner. On the τ-part the resulting Hodge-piece tensor formulas hold as direct-summand formulas when F_v/Q_p is unramified; at ramified v raw τ-quotients are not exact.
Hypotheses: F totally real; B/F a division quaternion algebra split at exactly one real place τ; canonical compact curve X_U/F supplied by R18.1. A maximal finite-adelic order O_B and its local split identifications are fixed; v|p and K=completion of F_v^ur. Chosen integral crystalline functor, compatible tensor and Hodge filtration; local p=2 coverage supplied.

HilbertModularVarietiesAndShimuraCurves:R18.2/bridge-determinant
BridgeDeterminant [theorem]: At unramified F_v/Q_p, the rank-one torus Hodge factor twists W(H″) by its dual and W(H″^t) by itself. Thus det W(H″)⊗det W(H″^t)≅(det W(H)⊗det W(H^t))⊗O_L, as lattices in the generic square-canonical line. The same intended ramified-prime export must use a proved saturated determinant comparison; it is an explicit source-repair gap. No equality Hom_OE=Hom_OB or unrestricted OE-linear universal deformation is claimed.
Hypotheses: F totally real; B/F a division quaternion algebra split at exactly one real place τ; canonical compact curve X_U/F supplied by R18.1. A maximal finite-adelic order O_B and its local split identifications are fixed; v|p and K=completion of F_v^ur. For the established direct-summand proof F_v/Q_p is unramified; retain the ramified target as a gap.

HilbertModularVarietiesAndShimuraCurves:R18.3/definite-class-set
DefiniteClassSet [definition]: Specialize the existing double-coset quotient to C_U=D×\D_f×/(U A_F,f×). Its effective stabiliser at t is Γ_t=(U A_F,f×∩t⁻¹D×t)/F×. Use the quotient by the rational centre before asserting finiteness. Changing t by dtu z transports the stabiliser and its coefficient action by conjugation.
Hypotheses: F totally real of even degree; D/F ramified at every real place, split at the finite places under discussion; O the integers of a sufficiently large finite extension of Q_p, with residue field k. U is compact open unless the dyadic division-place variant is explicitly invoked; τ is a finite free coefficient representation and ψ:A_F,f×/F×→O× a continuous idele-class character with τ(z)=ψ(z)⁻¹ on U∩A_F,f×.
DefiniteClassSet.quotient [compatibility]: The carrier is DoubleCoset.Quotient D× (U A_F,f×).
DefiniteClassSet.finite [instance]: For definite D and admissible U the class set is finite.
DefiniteClassSet.stabiliser [data]: At t the acting finite group is (UZ∩t⁻¹D×t)/F×.
DefiniteClassSet.changeRepresentative [equivalence]: Equivalent representatives give conjugate stabilisers and canonically transported invariant modules.
DefiniteClassSet.centralUnits [example, non-example]: For a real quadratic F, quotienting by F× removes its infinite central units; the unquotiented arithmetic group is not finite.
DefiniteClassSet.trivialOrbit [example, degenerate]: A class with Γ_t=1 contributes exactly W, with no averaging denominator.
DefiniteClassSet.doubleCosetEquality [example, compatibility]: Two representatives agree exactly when t′=dtu z for d∈D×, u∈U and z∈A_F,f×.

HilbertModularVarietiesAndShimuraCurves:R18.3/quaternion-weight
QuaternionWeight [construction]: Specialize AF.4 coefficient lattices to parallel weight k≥2: W_k=⊗_{σ:F→E} Sym^{k−2} O², using chosen splittings at v|p and the restricted U_p action. The centre acts by N_{F/Q}(z)^{k−2}; hence ψ near p must have inverse this action. For p=2 KW uses k=2. At a dyadic ramified division place use its discrete order-two quotient and one of the two sign characters, rather than a nonexistent GL₂ splitting.
Hypotheses: F totally real of even degree; D/F ramified at every real place, split at the finite places under discussion; O the integers of a sufficiently large finite extension of Q_p, with residue field k. U is compact open unless the dyadic division-place variant is explicitly invoked; τ is a finite free coefficient representation and ψ:A_F,f×/F×→O× a continuous idele-class character with τ(z)=ψ(z)⁻¹ on U∩A_F,f×. p unramified in F for the KW weight construction; D split at each active p-adic weight place.
QuaternionWeight.rank [structure]: Parallel weight k over a degree-d field has rank (k−1)^d.
QuaternionWeight.centralAction [characterisation]: A scalar z acts by N(z)^{k−2}.
QuaternionWeight.baseChange [functoriality]: Scalar extension commutes with the tensor of symmetric-power lattices.
QuaternionWeight.weightTwo [compatibility]: At k=2 the lattice is the trivial rank-one O-representation.
QuaternionWeight.weightTwoRank [example, degenerate]: For any d, weight 2 has rank 1.
QuaternionWeight.quadraticWeightFour [example, computation]: For d=2 and k=4 the rank is 9.
QuaternionWeight.factorialObstruction [example, non-example]: At p=2 and k=4 the natural pairing on Sym²(Z₂²) pairs X² with Y² to ±2 and XY with itself to ±1, so its Gram matrix has determinant ±4 and it is not perfect over Z₂.

HilbertModularVarietiesAndShimuraCurves:R18.3/definite-specialisation
DefiniteSpecialisation [comparison]: Use the extended AF.5 carrier, not a new generic definition, for functions f:D_f×→W_A satisfying f(dgu)=τ(u)⁻¹f(g), f(gz)=ψ(z)f(g). Evaluation at class representatives identifies S_{τ,ψ}(U,A) with ⊕_{t∈C_U} W_A^{Γ_t}. This requires AF.5 to admit the adelic central quotient: its current discrete-centre hypothesis does not cover O_F× of positive rank.
Hypotheses: F totally real of even degree; D/F ramified at every real place, split at the finite places under discussion; O the integers of a sufficiently large finite extension of Q_p, with residue field k. U is compact open unless the dyadic division-place variant is explicitly invoked; τ is a finite free coefficient representation and ψ:A_F,f×/F×→O× a continuous idele-class character with τ(z)=ψ(z)⁻¹ on U∩A_F,f×. A is an O-algebra; τ and ψ extend by scalars.

HilbertModularVarietiesAndShimuraCurves:R18.3/neatness-base-change
NeatnessBaseChange [theorem]: If every effective Γ_t has order invertible in O, S_{τ,ψ}(U,O) is finite free and base change to every O-algebra A identifies S(U,O)⊗A with S(U,A). Thus reduction modulo the uniformizer is surjective. Taylor Lemma 1.1 ensures this when p>3 is unramified in F in its stated compact definite setup. For p=2 or 3 use a specified auxiliary torsion-free level, not the automatic p>3 argument.
Hypotheses: F totally real of even degree; D/F ramified at every real place, split at the finite places under discussion; O the integers of a sufficiently large finite extension of Q_p, with residue field k. U is compact open unless the dyadic division-place variant is explicitly invoked; τ is a finite free coefficient representation and ψ:A_F,f×/F×→O× a continuous idele-class character with τ(z)=ψ(z)⁻¹ on U∩A_F,f×. All stabiliser orders prime to p, or an explicitly constructed auxiliary effective torsion-free level.

HilbertModularVarietiesAndShimuraCurves:R18.3/integral-pairing
IntegralPairing [theorem]: For a perfect τ-pairing satisfying the determinant/central-character similitude law and prime-to-p effective stabilisers, the sum over class representatives, weighted by |Γ_t|⁻¹ and ψ(Nrd t)⁻¹, is a perfect O-pairing on S(U,O). For the standard differential pairing on Sym^{k−2}, require its factorial entries to be units (Taylor uses 2≤k≤p+1). The adjoint of [UgU] is ψ(Nrd g)[Ug⁻¹U] with the matching coefficient action.
Hypotheses: F totally real of even degree; D/F ramified at every real place, split at the finite places under discussion; O the integers of a sufficiently large finite extension of Q_p, with residue field k. U is compact open unless the dyadic division-place variant is explicitly invoked; τ is a finite free coefficient representation and ψ:A_F,f×/F×→O× a continuous idele-class character with τ(z)=ψ(z)⁻¹ on U∩A_F,f×. A perfect integral coefficient pairing and unit isotropy denominators; Taylor weight range only where invoked.

HilbertModularVarietiesAndShimuraCurves:R18.3/split-hecke-normalisation
SplitHeckeNormalisation [comparison]: At v∉S with D_v=M₂(F_v), U_v=GL₂(O_v) and unramified coefficients, specialize AF.5 double-coset Hecke action: T_v=[U diag(π_v,1)U], S_v=[U diag(π_v,π_v)U]=ψ(π_v). The arithmetic Satake polynomial is X²−T_vX+q_vS_v. All change-of-level and commuting away-place actions are imported and checked with these local and coefficient conventions.
Hypotheses: F totally real of even degree; D/F ramified at every real place, split at the finite places under discussion; O the integers of a sufficiently large finite extension of Q_p, with residue field k. U is compact open unless the dyadic division-place variant is explicitly invoked; τ is a finite free coefficient representation and ψ:A_F,f×/F×→O× a continuous idele-class character with τ(z)=ψ(z)⁻¹ on U∩A_F,f×.

HilbertModularVarietiesAndShimuraCurves:R18.3/norm-branch
NormBranch [theorem]: For parallel weight 2 and compatible finite character, and equally for residual k-valued forms whose finite coefficient action is killed by the level, the forms factoring through Nrd are exactly the SL₂-invariant local branch under the strong-approximation hypotheses of KW §7.1. Their good-place Hecke eigenvalues give sums of characters, so their localization at a non-Eisenstein maximal ideal vanishes. Following KW §7, a maximal ideal m of T_ψ(U) is Eisenstein if T_v−2 and S_v−1 lie in m for all but finitely many places v split in a fixed finite abelian extension of F; non-Eisenstein means not Eisenstein. No Galois representation is constructed here.
Hypotheses: F totally real of even degree; D/F ramified at every real place, split at the finite places under discussion; O the integers of a sufficiently large finite extension of Q_p, with residue field k. U is compact open unless the dyadic division-place variant is explicitly invoked; τ is a finite free coefficient representation and ψ:A_F,f×/F×→O× a continuous idele-class character with τ(z)=ψ(z)⁻¹ on U∩A_F,f×; or, for the residual use in R18.3/definite-degeneracy, τ̄ is a finite-dimensional representation over k on which U acts trivially and ψ̄:A_F,f×/F×→k× satisfies τ̄(z)=ψ̄(z)⁻¹ on U∩A_F,f×. Weight 2; strong approximation for D¹ at a chosen split finite place.

HilbertModularVarietiesAndShimuraCurves:R18.3/definite-degeneracy
DefiniteDegeneracy [theorem]: At a finite place w∉Σ (so D is split at w), with w added to S for the Hecke algebra, compact U with hyperspecial U_w and a finite-dimensional residual coefficient module W̄_τ over k on which U_w acts trivially, the degeneracy map S_{W̄_τ,ψ̄}(U,k)²→S_{W̄_τ,ψ̄}(U₀(w),k), (f₁,f₂)↦f₁+diag(1,π_w)f₂, has kernel supported on the norm-factor Eisenstein branch. Hence it is injective after non-Eisenstein localization (KW Lemma 7.1). This node supplies the residual input to KW Corollary 7.5; arbitrary coefficient-algebra base change and an integral indefinite Ihara theorem are not consequences of Lemma 7.1.
Hypotheses: F is totally real of even degree, p is unramified in F, and D/F is totally definite, with finite ramification set Σ as in KW §7. U is compact open. W̄_τ is a finite-dimensional continuous representation over the finite residue field k, with ψ̄:A_F,f×/F×→k× and τ̄(z)=ψ̄(z)⁻¹ on U∩A_F,f×. The residual action factors through a finite quotient. w∉Σ, U_w=GL₂(O_w), U_w acts trivially on W̄_τ, and the smaller level changes only its w-component to the Iwahori U₀(w). The Hecke algebra omits w.

HilbertModularVarietiesAndShimuraCurves:R18.3/definite-jl
DefiniteJl [comparison]: Apply R17.3 global Jacquet–Langlands to the characteristic-zero cuspidal definite module after removing χ∘Nrd. At split finite places the Hecke eigensystems agree; at ramified places the GL₂ component is discrete series. Parallel Sym^{k−2} corresponds to holomorphic discrete series of weight k at every real place. Rational realization requires actual compatible coefficient-field models, not merely equality of rationality fields.
Hypotheses: F totally real of even degree; D/F ramified at every real place, split at the finite places under discussion; O the integers of a sufficiently large finite extension of Q_p, with residue field k. U is compact open unless the dyadic division-place variant is explicitly invoked; τ is a finite free coefficient representation and ψ:A_F,f×/F×→O× a continuous idele-class character with τ(z)=ψ(z)⁻¹ on U∩A_F,f×. Characteristic zero; exclude one-dimensional norm characters and fix embeddings/splittings.

HilbertModularVarietiesAndShimuraCurves:R18.3/isotropy-exponent
IsotropyExponent [theorem]: For an auxiliary split place w∤p with hyperspecial local control, write N_w=|GL₂(k_w)|. The Sylow-p subgroups of all Γ_t have exponent dividing 2N_w in the compact-level case and 4N_w in KW’s allowed noncompact dyadic division-factor case. The norm maps to ((A_F,f×)²V∩F×)/(F×)²; this final map need not be surjective. Its target has exact sequence 0→O_F×/(O_F×)²→target→Cl(O_F)[2]→0.
Hypotheses: F totally real of even degree; D/F ramified at every real place, split at the finite places under discussion; O the integers of a sufficiently large finite extension of Q_p, with residue field k. U is compact open unless the dyadic division-place variant is explicitly invoked; τ is a finite free coefficient representation and ψ:A_F,f×/F×→O× a continuous idele-class character with τ(z)=ψ(z)⁻¹ on U∩A_F,f×. U,V and the distinguished w satisfy KW §7.2; in the noncompact case U⁰ is used for local compactness.

HilbertModularVarietiesAndShimuraCurves:R18.3/base-change-annihilator
BaseChangeAnnihilator [theorem]: Let F′/F be totally real with w split and impose KW Lemma 7.3 residue-field divisibility at the chosen Iwahori places. Choose χ₀ of p-power order equal to the p-part of 2p(4N_w), and χ=χ₀^{4N_w}. Then χ kills every effective stabiliser; it is nontrivial, and when p=2 has order 4. Its local action is through the ratio a/d of the triangular reduction. This statement concerns a given F′ and local characters; choosing global auxiliary fields is R23 work.
Hypotheses: F totally real of even degree; D/F ramified at every real place, split at the finite places under discussion; O the integers of a sufficiently large finite extension of Q_p, with residue field k. U is compact open unless the dyadic division-place variant is explicitly invoked; τ is a finite free coefficient representation and ψ:A_F,f×/F×→O× a continuous idele-class character with τ(z)=ψ(z)⁻¹ on U∩A_F,f×. The prescribed residue fields admit χ₀, and all isotropy exponents divide 4N_w.

HilbertModularVarietiesAndShimuraCurves:R18.3/tw-level
QuaternionTWLevel [construction]: For any finite Q away S with D split, q_v≡1 mod p^n, and fixed p-power N divisible by all Sylow-p isotropy exponents, let Δ′_v be the maximal p-quotient of k_v× and Δ_v=Δ′_v/Δ′_v[N]. Put U′_v=Iwahori and U_v=ker(a/d:U′_v→Δ_v), with unchanged factors away Q. Then U′_Q/U_Q=Δ_Q=∏_vΔ_v. The quotient kills N-torsion; it is not the quotient by Nth powers.
Hypotheses: F totally real of even degree; D/F ramified at every real place, split at the finite places under discussion; O the integers of a sufficiently large finite extension of Q_p, with residue field k. U is compact open unless the dyadic division-place variant is explicitly invoked; τ is a finite free coefficient representation and ψ:A_F,f×/F×→O× a continuous idele-class character with τ(z)=ψ(z)⁻¹ on U∩A_F,f×. N and Q are inputs; no existence or selection of Taylor–Wiles primes is claimed.
QuaternionTWLevel.diamondGroup [data]: Δ_Q is the product of the maximal residue p-quotients modulo their N-torsion.
QuaternionTWLevel.levelQuotient [equivalence]: U′_Q/U_Q≅Δ_Q via the product diagonal ratios.
QuaternionTWLevel.normal [structure]: U_Q is open normal in U′_Q.
QuaternionTWLevel.changeQ [functoriality]: For Q′⊂Q the level and diamond quotient forget the factors Q\Q′.
QuaternionTWLevel.empty [example, degenerate]: At Q=∅, Δ_Q=1 and U_Q=U.
QuaternionTWLevel.cyclicOrder [example, computation]: For Δ′=C₈ and N=2, Δ=C₄.
QuaternionTWLevel.torsionNotPowers [example, non-example]: For Δ′=C₈ and N=2 the quotient by Nth powers has order 2, and is the wrong quotient.

HilbertModularVarietiesAndShimuraCurves:R18.3/tw-stabilisers
TwStabilisers [theorem]: For the level above, every character of Δ_Q kills the effective isotropy at U′_Q; the effective stabilisers at U_Q and U′_Q agree. Consequently Δ_Q acts freely on the class-set fibres C_{U_Q}→C_{U′_Q}. The invariant coefficient modules attached to all twists have equal O-rank; modulo the uniformizer their identifications are Hecke-equivariant, while arbitrary integral twist identifications need not be.
Hypotheses: F totally real of even degree; D/F ramified at every real place, split at the finite places under discussion; O the integers of a sufficiently large finite extension of Q_p, with residue field k. U is compact open unless the dyadic division-place variant is explicitly invoked; τ is a finite free coefficient representation and ψ:A_F,f×/F×→O× a continuous idele-class character with τ(z)=ψ(z)⁻¹ on U∩A_F,f×. N kills all p-isotropy exponents; Δ_Q is the quotient by Δ′[N].

HilbertModularVarietiesAndShimuraCurves:R18.3/tw-freeness
TwFreeness [theorem]: Under KW Lemma 7.4’s coefficient and level hypotheses, S_{τ,ψ}(U_Q,O) is finite free over O[Δ_Q], of rank rank_O S_{τ,ψ}(U′_Q,O). On each free Δ_Q-orbit, the common finite-free invariant coefficient summand gives a regular O[Δ_Q] factor. The localized non-Eisenstein direct factors inherit freeness when the Hecke idempotent is Δ_Q-equivariant.
Hypotheses: F totally real of even degree; D/F ramified at every real place, split at the finite places under discussion; O the integers of a sufficiently large finite extension of Q_p, with residue field k. U is compact open unless the dyadic division-place variant is explicitly invoked; τ is a finite free coefficient representation and ψ:A_F,f×/F×→O× a continuous idele-class character with τ(z)=ψ(z)⁻¹ on U∩A_F,f×. Invariant coefficient summands finite free as established in the KW setting; an arbitrary representation without this condition is not covered.

HilbertModularVarietiesAndShimuraCurves:R18.3/tw-localised-control
TwLocalisedControl [theorem]: Given a non-Eisenstein residual system unramified at Q with two distinct Frobenius eigenvalues α_v,β_v, choose the Hensel lift A_v of α_v in X²−T_vX+q_vψ(π_v). Localizing at U_v−α_v selects a finite-free O[Δ_Q] module with rank rank_O S(U,O)_m; its Δ_Q-coinvariants identify with S(U,O)_m via ξ_v(f)=A_vf−diag(1,π_v)f. The Steinberg exclusion used in KW’s proof requires the stated R19 local–global compatibility; geometric Lemma 7.4 is independent of that input.
Hypotheses: F totally real of even degree; D/F ramified at every real place, split at the finite places under discussion; O the integers of a sufficiently large finite extension of Q_p, with residue field k. U is compact open unless the dyadic division-place variant is explicitly invoked; τ is a finite free coefficient representation and ψ:A_F,f×/F×→O× a continuous idele-class character with τ(z)=ψ(z)⁻¹ on U∩A_F,f×. Residual irreducibility/non-Eisenstein localization; q_v≡1 mod p, distinct α_v,β_v; actual characteristic-zero local–global compatibility supplied.

HilbertModularVarietiesAndShimuraCurves:R18.3/dyadic-norm-twist
DyadicNormTwist [construction]: For p=2 and a given quadratic character χ:G_n/2G_n→O×, split at S and infinity and unramified outside Q, with 2^n>N ensuring χ(Nrd U_Q)=1, define T_χf(g)=χ(Nrd g)f(g). This O-linear involution preserves the weight, level and central character because Nrd(z)=z². Existence of χ and selection of Q belong to R22/R04, not to this construction.
Hypotheses: F totally real of even degree; D/F ramified at every real place, split at the finite places under discussion; O the integers of a sufficiently large finite extension of Q_p, with residue field k. U is compact open unless the dyadic division-place variant is explicitly invoked; τ is a finite free coefficient representation and ψ:A_F,f×/F×→O× a continuous idele-class character with τ(z)=ψ(z)⁻¹ on U∩A_F,f×. p=2; χ²=1; prescribed χ is trivial on the level norms.
DyadicNormTwist.apply [projection]: T_χf(g)=χ(Nrd g)f(g).
DyadicNormTwist.involutive [characterisation]: T_χ∘T_χ=id for χ²=1.
DyadicNormTwist.centralCharacter [compatibility]: The central character remains ψ since χ(z²)=1.
DyadicNormTwist.reduction [compatibility]: At residue characteristic two the reduction of T_χ is the identity.
DyadicNormTwist.trivial [example, degenerate]: The trivial χ gives the identity.
DyadicNormTwist.scalar [example, computation]: A central scalar z contributes χ(z²)=1.
DyadicNormTwist.nonquadratic [example, non-example]: An order-four character with χ(z)=i changes the scalar action by −1 and does not preserve ψ.

HilbertModularVarietiesAndShimuraCurves:R18.3/dyadic-hecke-twist
DyadicHeckeTwist [theorem]: For the norm twist, T_v and U_v are multiplied by χ(π_v), S_v is fixed, and (f|⟨h⟩)_χ=χ(h)⁻¹(f_χ|⟨h⟩). Since χ≡1 modulo the dyadic uniformizer, the residual maximal ideal is preserved. These equations transport the localized Taylor–Wiles modules and their ranks and coinvariants as in Proposition 7.6, conditional on the given auxiliary character.
Hypotheses: F totally real of even degree; D/F ramified at every real place, split at the finite places under discussion; O the integers of a sufficiently large finite extension of Q_p, with residue field k. U is compact open unless the dyadic division-place variant is explicitly invoked; τ is a finite free coefficient representation and ψ:A_F,f×/F×→O× a continuous idele-class character with τ(z)=ψ(z)⁻¹ on U∩A_F,f×. The dyadic norm-twist hypotheses and compatible local diamond lifts.

HilbertModularVarietiesAndShimuraCurves:R18.3/dyadic-sign-extension
DyadicSignExtension [theorem]: At a dyadic division place with U_v=D_v×, its maximal compact U_v⁰ has quotient U_vF_v×/(U_v⁰F_v×) of order two. For weight two, each choice of sign extends the compact coefficient action; over characteristic two the two reductions agree. With a set Σ₀ of such places there are 2^{|Σ₀|} sign choices. Compactness-based arguments must use U⁰ and retain this quotient.
Hypotheses: F totally real of even degree; D/F ramified at every real place, split at the finite places under discussion; O the integers of a sufficiently large finite extension of Q_p, with residue field k. U is compact open unless the dyadic division-place variant is explicitly invoked; τ is a finite free coefficient representation and ψ:A_F,f×/F×→O× a continuous idele-class character with τ(z)=ψ(z)⁻¹ on U∩A_F,f×. KW noncompact variant allowed only at the specified dyadic division factors; weight two.

HilbertModularVarietiesAndShimuraCurves:R18.3/residual-hecke-ideal
ResidualHeckeIdeal [construction]: In the CDN §4.1.3 setup, let T^S=O[T_v,S_v:v∉S] be the shared abstract good-place Hecke algebra. Given a continuous residual ρ̄:G_E→GL₂(k) unramified outside S, evaluate T_v↦tr ρ̄(Frob_v), S_v↦q_v⁻¹ det ρ̄(Frob_v), and coefficients by O→k. Define m_ρ̄ as the kernel. The coefficient reduction is surjective, hence this is a maximal ideal. Factoring this evaluation through the acting quotient Hecke algebra requires the eigen-system existence theorem supplied by R19.
Hypotheses: F totally real of even degree; D/F ramified at every real place, split at the finite places under discussion; O the integers of a sufficiently large finite extension of Q_p, with residue field k. U is compact open unless the dyadic division-place variant is explicitly invoked; τ is a finite free coefficient representation and ψ:A_F,f×/F×→O× a continuous idele-class character with τ(z)=ψ(z)⁻¹ on U∩A_F,f×. For the CDN application p>2, local F=Q_p, global E even degree with p completely split, D₀ definite and finite-unramified; keep E distinct from the earlier auxiliary CM field. q_v is a unit in k; arithmetic Frobenius convention fixed.
ResidualHeckeIdeal.evalT [simp]: T_v evaluates to tr ρ̄(Frob_v).
ResidualHeckeIdeal.evalS [simp]: S_v evaluates to q_v⁻¹ det ρ̄(Frob_v).
ResidualHeckeIdeal.maximal [structure]: Surjective O→k makes the evaluation kernel maximal.
ResidualHeckeIdeal.actingFactor [compatibility]: When R19 supplies the eigen-system, the abstract evaluation factors through the acting Hecke quotient.
ResidualHeckeIdeal.normThree [example, computation]: In k=F₇, q=3 and determinant=6 give S=2.
ResidualHeckeIdeal.scalarDeterminant [example, compatibility]: The arithmetic polynomial has constant term qS=det ρ̄(Frob).
ResidualHeckeIdeal.nonsurjective [example, non-example]: The kernel of Z→Q is zero and not maximal; surjectivity cannot be dropped.

HilbertModularVarietiesAndShimuraCurves:R18.4/quaternion-local-systems
QuaternionLocalSystem [construction]: Specialize the shared automorphic local-system construction to X_U and an algebraic B×-representation W. On each complex component Γ\H, the Betti system is (H×W)/Γ; on the canonical curve the étale O/l^n systems descend the matching finite-level torsors, compatibly in n. Identify their pullbacks to the complex analytic curve using the fixed coefficient/dual convention. At split quaternionic p-level the rank-two Morita factor of H supplies the standard geometric representation of weight one. Parallel automorphic weight k uses its tensor of Sym^{k−2} constituents; automorphic weight two has the trivial rank-one coefficient system.
Hypotheses: B/F division quaternion algebra split at exactly one real place; U sufficiently small and effective so X_U/F is a smooth proper curve with no cusp boundary. O is a finite extension of Z_l, and the algebraic coefficient lattice is U-stable with a specified central character and an integral coefficient pairing where duality is used.
QuaternionLocalSystem.betti [projection]: On Γ\H the system is the Γ-associated W-bundle.
QuaternionLocalSystem.etaleReduction [data]: Reduction modulo l^n is the descended finite-level torsor coefficient system.
QuaternionLocalSystem.changeLevel [functoriality]: Level pullback identifies the corresponding local systems.
QuaternionLocalSystem.trivial [compatibility]: Trivial W gives the constant local system in both realizations.
QuaternionLocalSystem.constant [example, degenerate]: The trivial rank-one representation gives the constant O-system.
QuaternionLocalSystem.rank [example, computation]: A rank-r lattice gives fibre rank r, not r times the covering degree.
QuaternionLocalSystem.monodromy [example, non-example]: On a loop acting by −1 on W, parallel transport is −1; the constant system is wrong when 2 is invertible.

HilbertModularVarietiesAndShimuraCurves:R18.4/finite-cohomology
QuaternionCohomology [construction]: Apply the imported cohomology functors to define M_U=H¹_et(X_U,Fbar,L_O) and M_U^B=H¹_B(X_U(C),L_O), with continuous G_F action on the étale side and finite O-modules. The good-place and change-level Hecke correspondences act by coefficient transport followed by pullback and trace. The Betti–étale comparison is Hecke-equivariant; integral O-freeness is a separate theorem, not part of the definition.
Hypotheses: B/F division quaternion algebra split at exactly one real place; U sufficiently small and effective so X_U/F is a smooth proper curve with no cusp boundary. O is a finite extension of Z_l, and the algebraic coefficient lattice is U-stable with a specified central character and an integral coefficient pairing where duality is used.
QuaternionCohomology.hecke [data]: A correspondence acts by p₂,*∘coefficientTransport∘p₁*.
QuaternionCohomology.changeLevel [functoriality]: Level pullback and trace compose with the degree on a finite étale cover.
QuaternionCohomology.comparison [compatibility]: Betti–étale comparison intertwines the Hecke actions.
QuaternionCohomology.galoisCommutes [relation]: G_F commutes with correspondences defined over F.
QuaternionCohomology.genusTwo [example, computation]: Constant rational coefficients on a connected genus-two curve give dimension 4.
QuaternionCohomology.identityCorrespondence [example, degenerate]: The identity correspondence acts as the identity.
QuaternionCohomology.coverDegree [example, compatibility]: For a finite étale cover of degree d, trace∘pullback=d on cohomology.

HilbertModularVarietiesAndShimuraCurves:R18.4/integral-cohomology-control
IntegralCohomologyControl [theorem]: For a maximal ideal m of the good-place Hecke algebra, if H⁰(X,L_k)_m and H⁰(X,L_k∨(1))_m vanish, then the localized H¹(X,L_O)_m is finite free over O, H²(X,L_O)_m has no O-torsion, and H¹(X,L_O)_m⊗k→H¹(X,L_k)_m is an isomorphism. Proving these vanishings for the intended non-Eisenstein systems is an explicit quaternionic coefficient-system obligation; arbitrary non-Eisenstein language alone is not substituted for them.
Hypotheses: B/F division quaternion algebra split at exactly one real place; U sufficiently small and effective so X_U/F is a smooth proper curve with no cusp boundary. O is a finite extension of Z_l, and the algebraic coefficient lattice is U-stable with a specified central character and an integral coefficient pairing where duality is used. Generic integral coefficient long exact sequences, Poincaré duality, and compatible Hecke localization.

HilbertModularVarietiesAndShimuraCurves:R18.4/cohomology-pairing
CohomologyPairing [comparison]: Specialize Poincaré duality to obtain the perfect rational pairing H¹(X,L_E)×H¹(X,L_E∨(1))→E. At integral level the duality is a derived duality; it gives a perfect O-pairing on localized H¹ only under the preceding torsion/vanishing criteria and a chosen perfect coefficient lattice pairing. Pullback is adjoint to trace, and Hecke adjoints reverse the correspondence with its coefficient similitude factor.
Hypotheses: B/F division quaternion algebra split at exactly one real place; U sufficiently small and effective so X_U/F is a smooth proper curve with no cusp boundary. O is a finite extension of Z_l, and the algebraic coefficient lattice is U-stable with a specified central character and an integral coefficient pairing where duality is used.

HilbertModularVarietiesAndShimuraCurves:R18.4/cohomological-eigenspaces
CohomologicalEigenspaces [comparison]: Over a splitting characteristic-zero field, identify the cuspidal Hecke eigenspaces of the algebraic coefficient H¹ of X_U with the automorphic representations cohomological at the split real place and of the specified algebraic type at the other real places. For trivial coefficients the split real component has weight-two discrete series. Galois action on the multiplicity space is retained, but identifying it with a two-dimensional ρ_π and proving local–global compatibility are R19 statements.
Hypotheses: B/F division quaternion algebra split at exactly one real place; U sufficiently small and effective so X_U/F is a smooth proper curve with no cusp boundary. O is a finite extension of Z_l, and the algebraic coefficient lattice is U-stable with a specified central character and an integral coefficient pairing where duality is used. Characteristic zero; actual coefficient-field models; generic Matsushima/cohomological decomposition and strong multiplicity one imported.

HilbertModularVarietiesAndShimuraCurves:R18.4/definite-indefinite-comparison
DefiniteIndefiniteComparison [comparison]: For quaternion algebras D⁰ and B with invariants exchanged at a finite place v and the designated real place, and a cuspidal GL₂ representation discrete series at every ramified place of either algebra, apply the two global JL correspondences. At levels transported away {v,τ}, identify their away-place Hecke eigensystems and multiplicity factors over actual common rational models. At v the split GL₂ representation and its division JL partner remain different carriers; the full definite functions and the full curve H¹ are not isomorphic.
Hypotheses: B/F division quaternion algebra split at exactly one real place; U sufficiently small and effective so X_U/F is a smooth proper curve with no cusp boundary. O is a finite extension of Z_l, and the algebraic coefficient lattice is U-stable with a specified central character and an integral coefficient pairing where duality is used. The transfer domain and infinity weights match; actual common coefficient field as in R17.3 rational-models.

HilbertModularVarietiesAndShimuraCurves:R18.4/cohomological-degeneracy
QuaternionDegeneracy [construction]: At w with B split, hyperspecial level and coefficient system unramified at w, the two canonical maps X_{U₀(w)}→X_U induce δ=(δ₁*,δ₂*):M_U²→M_{U₀(w)}. Their trace maps give the dual degeneracy map. They commute with G_F and away-w Hecke operators; the pullback/trace composition matrix is obtained from the local double-coset computation with degree q_w+1. Integral injectivity and saturated image require an Ihara theorem with explicit hypotheses, and are not inferred from the definite Lemma 7.1.
Hypotheses: B/F division quaternion algebra split at exactly one real place; U sufficiently small and effective so X_U/F is a smooth proper curve with no cusp boundary. O is a finite extension of Z_l, and the algebraic coefficient lattice is U-stable with a specified central character and an integral coefficient pairing where duality is used. The coefficient action extends to the local semigroup; the two level morphisms use a specified diag(1,π_w).
QuaternionDegeneracy.pullback [data]: δ maps (a,b) to δ₁*a+δ₂*b with transported coefficients.
QuaternionDegeneracy.trace [data]: The reverse map is the pair of coefficient-compatible traces.
QuaternionDegeneracy.awayHecke [compatibility]: Both maps intertwine all Hecke correspondences away w.
QuaternionDegeneracy.degree [characterisation]: Each hyperspecial-to-Iwahori map has degree q_w+1.
QuaternionDegeneracy.qTwo [example, computation]: For residue field F₂ the covering degree is 3.
QuaternionDegeneracy.tracePullback [example, compatibility]: The diagonal trace–pullback composition is q_w+1.
QuaternionDegeneracy.badPlace [example, non-example]: At a division place there is no hyperspecial GL₂-to-Iwahori map of this shape.

HilbertModularVarietiesAndShimuraCurves:R18.4/quaternion-purity
QuaternionPurity [theorem]: At a finite good place away l, a specified algebraic projector on the auxiliary abelian scheme gives a rank-two lisse coefficient constituent pure of weight one. An algebraic symmetric/tensor coefficient system of total geometric weight r is pure of weight r; since X is proper smooth, H¹(X,L) is pure of weight r+1 for geometric Frobenius. The quaternionic rank-two constituent and its projector must be verified; the current R34.5 elliptic-family node alone is insufficient for this higher-dimensional auxiliary PEL family.
Hypotheses: B/F division quaternion algebra split at exactly one real place; U sufficiently small and effective so X_U/F is a smooth proper curve with no cusp boundary. O is a finite extension of Z_l, and the algebraic coefficient lattice is U-stable with a specified central character and an integral coefficient pairing where duality is used. Good smooth fibre; l invertible; compatible Frobenius-commuting projectors and actual pure coefficient constituents.

HilbertModularVarietiesAndShimuraCurves:R18.4/finite-level-descent
FiniteLevelDescent [theorem]: For a finite effective étale Galois level cover X_{U′}→X_U with group Δ of order invertible in the coefficient ring and compatible local systems, pullback identifies H¹(X_U,L) with H¹(X_{U′},L)^Δ and |Δ|⁻¹trace is its inverse on invariants. When p divides |Δ|, replace this assertion by the Hochschild–Serre spectral sequence and coefficient torsion terms; no unconditional integral invariants equality is asserted.
Hypotheses: B/F division quaternion algebra split at exactly one real place; U sufficiently small and effective so X_U/F is a smooth proper curve with no cusp boundary. O is a finite extension of Z_l, and the algebraic coefficient lattice is U-stable with a specified central character and an integral coefficient pairing where duality is used. Cover finite étale on the generic fibre and genuinely effective; |Δ| invertible for the displayed equality.

HilbertModularVarietiesAndShimuraCurves:R18.5/drinfeld-half-plane
DrinfeldHalfPlane [definition]: The Drinfeld half-plane Ω_K is the rigid analytic open P¹_K\P¹(K), formed by removing the K-rational analytic points. Ω_K(C)=P¹(C)\P¹(K)=C\K in the affine chart with infinity removed. PGL₂(K) acts by homographies. This is not the algebraic complement of a Zariski-closed subscheme P¹(K). The affinoid exhaustion supplies its actual analytic open structure.
Hypotheses: K/Q_p finite, O_K its integers, uniformizer π, residue field k of cardinality q, and C the completed algebraic closure; Ǩ is the completed maximal unramified extension. Formal schemes and generic-fibre functor are supplied by AdicSpacesPartII:R2; all actions and quotient groups are effective.
DrinfeldHalfPlane.points [characterisation]: Its C-points are P¹(C) minus P¹(K).
DrinfeldHalfPlane.homography [data]: PGL₂(K) acts through the usual fractional linear formula.
DrinfeldHalfPlane.affineChart [compatibility]: The affine chart identifies the C-points with C minus K.
DrinfeldHalfPlane.baseChange [functoriality]: Scalar extension identifies the Ω_K affinoid exhaustion with its C-exhaustion; it does not replace the removed set by P¹(C).
DrinfeldHalfPlane.infinity [example, degenerate]: The point infinity is excluded.
DrinfeldHalfPlane.quadraticPoint [example, example]: For z∈K₂\K in a quadratic extension, z lies in Ω_K(C).
DrinfeldHalfPlane.scalarAction [example, compatibility]: Every central scalar in GL₂(K) acts trivially.
DrinfeldHalfPlane.algebraicComplement [example, non-example]: Removing finitely many K-rational points is insufficient: all P¹(K) must be excluded.

HilbertModularVarietiesAndShimuraCurves:R18.5/affinoid-reduction
DrinfeldExhaustion [construction]: For n≥1, set P_n=P¹(O_K/π^n) and U_n=P¹_C minus the union of open balls centered at P_n of radius |π|^n in the standard projective metric. These affinoids increase to Ω_C. The norm-class reduction r:Ω_C→|T_K| is PGL₂(K)-equivariant, and U_n is the inverse image of the closed tree ball of radius n about the standard vertex. Tree vertices are homothety classes of rank-two lattices; adjacent representatives satisfy πL⊊L′⊊L.
Hypotheses: K/Q_p finite, O_K its integers, uniformizer π, residue field k of cardinality q, and C the completed algebraic closure; Ǩ is the completed maximal unramified extension. Formal schemes and generic-fibre functor are supplied by AdicSpacesPartII:R2; all actions and quotient groups are effective.
DrinfeldExhaustion.affinoid [structure]: Each U_n descends from an affinoid over K.
DrinfeldExhaustion.increasing [relation]: U_n⊂U_{n+1} and their union is Ω_C.
DrinfeldExhaustion.treeBall [characterisation]: U_n=r⁻¹ of the radius-n tree ball.
DrinfeldExhaustion.equivariant [compatibility]: r(gz)=g r(z) for g∈PGL₂(K).
DrinfeldExhaustion.residueTwo [example, computation]: For q=2 a vertex has 3 incident edges.
DrinfeldExhaustion.firstSphere [example, computation]: The radius-one tree ball has q+2 vertices.
DrinfeldExhaustion.centralScalar [example, compatibility]: Scaling a lattice changes neither its vertex nor the reduction class.

HilbertModularVarietiesAndShimuraCurves:R18.5/drinfeld-formal-model
DrinfeldFormalModel [construction]: Start with X₀=P¹_O_K and form X_n by blowing up every smooth k-rational special-fibre point of X_{n−1}; take the π-adic completions. Remove the smooth k-rational points from X_n to form the formal open Ũ_n. Then Ũ_n⊂Ũ_{n+1}, its generic fibre is U_n,K, and Ω̂=⋃Ũ_n is a flat regular semistable formal model of Ω_K. Its components are P¹_k indexed by tree vertices and its nodes by tree edges, locally xy=π. The full GL₂(K) action factors through PGL₂(K).
Hypotheses: K/Q_p finite, O_K its integers, uniformizer π, residue field k of cardinality q, and C the completed algebraic closure; Ǩ is the completed maximal unramified extension. Formal schemes and generic-fibre functor are supplied by AdicSpacesPartII:R2; all actions and quotient groups are effective.
DrinfeldFormalModel.genericFibre [compatibility]: The generic fibre of Ω̂ is Ω_K.
DrinfeldFormalModel.nodeChart [data]: At an edge the completed local equation is xy=π.
DrinfeldFormalModel.components [equivalence]: Special-fibre components and nodes identify with tree vertices and edges.
DrinfeldFormalModel.action [functoriality]: The PGL₂(K) action extends the analytic homography action.
DrinfeldFormalModel.centralComponent [example, compatibility]: The initial vertex component is P¹_k with its q+1 rational attaching points.
DrinfeldFormalModel.qTwo [example, computation]: For q=2 each component meets three branches in the full model.
DrinfeldFormalModel.ramifiedNode [example, non-example]: For e=2, xy=π′² is a singular total-space local ring; regularity is not preserved.

HilbertModularVarietiesAndShimuraCurves:R18.5/special-formal-moduli
SpecialFormalModuli [definition]: Let D/K be the local division quaternion algebra, O_D its maximal order containing the unramified quadratic order O₂. A strict special formal O_D-module X over a π-nilpotent O_Ǩ-scheme has O_K-height 4 and Lie(X) locally free of rank one over O₂⊗O_K O_S (hence rank two over O_S), with strict O_K action. Fix a framing Φ over kbar. The functor M_Dr(0) classifies (X,ρ) where ρ:X_Sbar→Φ_Sbar is an O_D-linear quasi-isogeny of relative height zero, modulo compatible isomorphism. M̃ allows heights 2m, m∈Z. BC uses the inverse framing arrow; invert it when comparing conventions.
Hypotheses: K/Q_p finite, O_K its integers, uniformizer π, residue field k of cardinality q, and C the completed algebraic closure; Ǩ is the completed maximal unramified extension. Formal schemes and generic-fibre functor are supplied by AdicSpacesPartII:R2; all actions and quotient groups are effective. The strict formal-module and relative height carriers are supplied by R07.1–R07.2.
SpecialFormalModuli.specialLie [characterisation]: Lie is rank one over O₂⊗O_S.
SpecialFormalModuli.baseChange [functoriality]: Pull back X and its special-fibre framing along every nilpotent-base map.
SpecialFormalModuli.framingAction [data]: A framing quasi-isogeny δ acts by δ∘ρ.
SpecialFormalModuli.heightComponents [structure]: The arbitrary-height functor decomposes into the height-2m components.
SpecialFormalModuli.heightZero [example, degenerate]: The framing object with identity ρ lies in M_Dr(0).
SpecialFormalModuli.absoluteHeight [example, computation]: When [K:Q_p]=2 the absolute p-height is 8.
SpecialFormalModuli.wrongLie [example, non-example]: An O_D-module whose Lie O₂ action has ranks (2,0) is not special.

HilbertModularVarietiesAndShimuraCurves:R18.5/drinfeld-representability
DrinfeldRepresentability [theorem]: The special formal O_D-module functor M_Dr(0) is represented by Ω̂⊗O_K O_Ǩ. The equivalence is functorial on π-nilpotent bases, not just a bijection on geometric points, and identifies the universal special formal module. The group of framing quasi-isogenies is GL₂(K); on height zero the normalized action factors through PGL₂(K).
Hypotheses: K/Q_p finite, O_K its integers, uniformizer π, residue field k of cardinality q, and C the completed algebraic closure; Ǩ is the completed maximal unramified extension. Formal schemes and generic-fibre functor are supplied by AdicSpacesPartII:R2; all actions and quotient groups are effective. Strict special modules, fixed frame and arrow convention as above.

HilbertModularVarietiesAndShimuraCurves:R18.5/height-and-descent
HeightAndDescent [comparison]: Normalize arbitrary-height M̃_Dr≅M_Dr(0)×Z by a division uniformizer Π and its Hecke shift h(Π). Under BZ §5.9, δ∈GL₂(K) acts by (ω,m)↦(pr(δ)ω,m+ord_K det δ), where pr(δ)=h(Π)^{−ord det δ}δ on height zero. The product identification is independent of Π. For arithmetic descent use τ_c=Spf τ⁻¹ and the separate right Π⁻¹ Hecke translation in Theorem 6.7; do not conflate this translation with the normalized PGL₂ action.
Hypotheses: K/Q_p finite, O_K its integers, uniformizer π, residue field k of cardinality q, and C the completed algebraic closure; Ǩ is the completed maximal unramified extension. Formal schemes and generic-fibre functor are supplied by AdicSpacesPartII:R2; all actions and quotient groups are effective.

HilbertModularVarietiesAndShimuraCurves:R18.5/arithmetic-quotient
ArithmeticDrinfeldQuotient [construction]: For B/F division split at τ only and division at v, let B̌ exchange invariants at {τ,v}, so it is totally definite and split at v. For compact level U with U_v=O_B,v× and small U^v, form B̌×\[(Ω̂⊗O_Fv O_Fv̌)×B_f×/U], using fixed away-v identifications; B̌_v× acts by homography and the local valuation component ord_v Nrd. Its finite component decomposition uses Γ_g={b∈B̌×∩gU^v g⁻¹:ord_v det b=0}, projected to PGL₂(F_v). These projected groups are discrete cocompact and become torsion-free with sufficiently small tame level.
Hypotheses: K/Q_p finite, O_K its integers, uniformizer π, residue field k of cardinality q, and C the completed algebraic closure; Ǩ is the completed maximal unramified extension. Formal schemes and generic-fibre functor are supplied by AdicSpacesPartII:R2; all actions and quotient groups are effective. Global B/F, τ,v and level as stated; effective central quotient and finite component representatives fixed.
ArithmeticDrinfeldQuotient.components [data]: Connected pieces are the specified projective Γ_g quotients after unramified base change.
ArithmeticDrinfeldQuotient.cocompact [structure]: Each effective Γ_g is discrete and cocompact in PGL₂(F_v).
ArithmeticDrinfeldQuotient.changeLevel [functoriality]: Nested tame levels give the corresponding finite quotient maps.
ArithmeticDrinfeldQuotient.algebraisation [compatibility]: At sufficiently small level the proper formal curve algebraizes with the same generic fibre.
ArithmeticDrinfeldQuotient.scalar [example, compatibility]: Central scalar homographies are ineffective; their valuation effect is retained separately.
ArithmeticDrinfeldQuotient.node [example, computation]: At free level an edge orbit has node chart xy=π.
ArithmeticDrinfeldQuotient.nonfree [example, non-example]: A quotient with a nontrivial effective vertex stabiliser cannot use the free-action regularity argument.

HilbertModularVarietiesAndShimuraCurves:R18.5/totally-real-uniformisation
TotallyRealUniformisation [theorem]: For totally real F, B division split only at τ, v with B_v division, U_v=O_B,v× and the other p-adic factors and tame level as in BZ (6.31), the completion of the canonical integral Shimura curve over O_Eν identifies with B̌×\[(Ω̂_Fv⊗O_Fv O_Eν̌)×B_f×/U]. Here E=τ(F), E_ν=F_v. It is compatible with level transitions and Hecke operators at the permitted levels. With τ_c=Spf τ⁻¹, natural descent corresponds on the quotient to id_Ω×|Π⁻¹×τ_c. For small tame level the model is regular semistable and stable.
Hypotheses: K/Q_p finite, O_K its integers, uniformizer π, residue field k of cardinality q, and C the completed algebraic closure; Ǩ is the completed maximal unramified extension. Formal schemes and generic-fibre functor are supplied by AdicSpacesPartII:R2; all actions and quotient groups are effective. All local factors match BZ (6.31); sufficiently small U^v for the final stable/regular claim.

HilbertModularVarietiesAndShimuraCurves:R18.5/rational-uniformisation
RationalUniformisation [comparison]: For F=Q, a division quaternion algebra ramified at p and split at infinity, and maximal p-level with sufficiently small tame U^p, specialize the uniformisation to BC III Theorem 5.2. Match its left/right actions via the chosen algebra anti-isomorphism and its Frobenius–determinant twist with the BZ convention. The isomorphism also compares the universal special formal O_D modules. The split B=M₂(Q) modular curve is outside this division-prime assertion.
Hypotheses: K/Q_p finite, O_K its integers, uniformizer π, residue field k of cardinality q, and C the completed algebraic closure; Ǩ is the completed maximal unramified extension. Formal schemes and generic-fibre functor are supplied by AdicSpacesPartII:R2; all actions and quotient groups are effective.

HilbertModularVarietiesAndShimuraCurves:R18.5/tower-uniformisation
TowerUniformisation [theorem]: In CDN20 §5.2.1, E is totally real with E_𝔭=K; B̌ is split only at ∞₀ and division at 𝔭; B exchanges these invariants and is definite. With the fixed identifications of local and away-𝔭 groups, sufficiently small tame U and the exact congruence subgroups Ǧ_n at 𝔭, there are rigid isomorphisms Sh_n(U)^an≅B×\[M_n×B(A_f^𝔭)×/U] for every n≥1, compatible in n,U. M_n is the corresponding Drinfeld cover defined by the universal special formal module’s level structure. The theorem is on rigid generic fibres; it does not assert every high-level integral cover is semistable without alteration.
Hypotheses: K/Q_p finite, O_K its integers, uniformizer π, residue field k of cardinality q, and C the completed algebraic closure; Ǩ is the completed maximal unramified extension. Formal schemes and generic-fibre functor are supplied by AdicSpacesPartII:R2; all actions and quotient groups are effective. Exact CDN20 tower convention Ǧ_n retained; U sufficiently small.

HilbertModularVarietiesAndShimuraCurves:R18.5/tree-dual-graph
TreeDualGraph [comparison]: At small maximal division-prime level, the geometric special-fibre dual graph is the finite disjoint union of Γ_g\T_K corresponding to the arithmetic quotient components. Vertices index rational components and edges index nodes, with loops and repeated edges retained in the quotient graph. The graph carries the Frobenius permutation induced by the Π⁻¹ descent, and Hecke/level maps are the transported adelic correspondences on vertex/edge orbits.
Hypotheses: K/Q_p finite, O_K its integers, uniformizer π, residue field k of cardinality q, and C the completed algebraic closure; Ǩ is the completed maximal unramified extension. Formal schemes and generic-fibre functor are supplied by AdicSpacesPartII:R2; all actions and quotient groups are effective. Tame level sufficiently small for free local charts; generic dual multigraph supplied by StableReduction.

HilbertModularVarietiesAndShimuraCurves:R18.5/character-monodromy
CharacterMonodromy [comparison]: For the Jacobian of a small-level semistable uniformized curve, identify the toric character lattice with H₁(Γ_g\T_K,Z), compatibly with Hecke and descent. Under the generic semistable-Jacobian monodromy theorem the pairing is the oriented cycle edge pairing Σ_e thickness(e)a_e b_e. At the unramified regular maximal-level model thickness is 1. Its cokernel presents the geometric component group using the dual lattice; Frobenius descent determines the arithmetic group.
Hypotheses: K/Q_p finite, O_K its integers, uniformizer π, residue field k of cardinality q, and C the completed algebraic closure; Ǩ is the completed maximal unramified extension. Formal schemes and generic-fibre functor are supplied by AdicSpacesPartII:R2; all actions and quotient groups are effective. Generic semistable Jacobian/Néron and graph monodromy theorem supplied; connected component handled separately.

-/

/-
Residual-to-integral control boundary (KW Lemma 7.1 and Corollary 7.5):
DefiniteDegeneracy uses the finite residual coefficient module and mod-p map.
TwLocalisedControl first obtains equal ranks/characteristic-zero comparison from
the actual local-global compatibility, then uses residual degeneracy injectivity
to prove the integral comparison. No arbitrary-A or indefinite Ihara theorem is
inferred from Lemma 7.1.
AF.5 LevelAlgebraicModularForm supplies the coefficient-function-space convention;
its fixed-central-character/effective-stabilizer extension remains explicitly
requested for the quotient by the adelic centre and positive-rank rational units.
-/
