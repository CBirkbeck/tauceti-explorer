/-
This file is not the roadmap and is not exhaustive. The roadmap document is definitive.
These statements suggest Lean forms so contributors and reviewers converge on names
and signatures. Every admission is a prototype, not an implementation.

Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174; Tau Ceti
f790474821cf4256814db967cb154e7af3d0c369.

Supplier geometry and continuous-cohomology conditions are explicitly omitted where
the pinned interface cannot state them. See the packet's prototype gaps. X is the
supplied CM moduli object; C and I are the supplied continuous cohomology carriers,
not newly defined substitute objects. This file never chooses algebraic cohomology
in place of continuous cohomology and never defines an opaque mathematical carrier.
The Tau Ceti continuous modules were inspected but their oleans are not available
in the existing build, so these interfaces remain unbundled parameters.
-/
import Mathlib.Algebra.Ring.Subring.Basic
import Mathlib.RingTheory.PicardGroup
import Mathlib.NumberTheory.Padics.PadicIntegers
import Mathlib.AlgebraicGeometry.EllipticCurve.Affine.Point
import Mathlib.RingTheory.Length
import Mathlib.LinearAlgebra.Dimension.Finrank
import Mathlib.Data.Nat.Factors

noncomputable section
namespace TauCeti.Heegner

local instance (α : Type*) : DecidableEq α := Classical.decEq α

local instance : Fact (Nat.Prime 5) := ⟨by decide⟩

/- HE.1: the map includes the integral Jacobian/basepoint construction.
Omitted: CM descent, exact level, Hodge denominator, fixed quotient and its degree.
The map and CM point family are supplied data, not fabricated Prop witnesses. -/
def conductorPoint {X M : Type*} (φ : X → M) (x : ℕ → X) (c : ℕ) : M := by
  sorry

theorem conductorPoint_apply {X M : Type*} (φ : X → M) (x : ℕ → X) (c : ℕ) :
    conductorPoint φ x c = φ (x c) := by
  sorry

theorem conductorPoint_postcompose {X M M' : Type*} (φ : X → M) (x : ℕ → X)
    (f : M → M') (c : ℕ) : conductorPoint (f ∘ φ) x c = f (conductorPoint φ x c) := by
  sorry

theorem conductorPoint_galois {X M : Type*} (φ : X → M) (x : ℕ → X)
    (gX : X → X) (gM : M → M) (hφ : ∀ z, φ (gX z) = gM (φ z)) (c : ℕ) :
    conductorPoint φ (gX ∘ x) c = gM (conductorPoint φ x c) := by
  sorry

-- TauCeti.Heegner.conductorPoint_cusp: φ is the supplied x ↦ φ_J([x−∞]).
example {X M : Type*} (cuspMap : X → M) (x : ℕ → X) (c : ℕ) :
    conductorPoint cuspMap x c = cuspMap (x c) := by
  sorry

-- TauCeti.Heegner.conductorPoint_zero_quotient
example {X M : Type*} [Zero M] (x : ℕ → X) (c : ℕ) :
    conductorPoint (fun _ : X => (0 : M)) x c = 0 := by
  sorry

-- TauCeti.Heegner.conductorPoint_trace_not_basepoint: C₂ acts on ℤ by negation.
example : conductorPoint (id : ℤ → ℤ) (fun _ => (1 : ℤ)) 1 ≠
    ((1 : ℤ) + (-1)) := by
  sorry

/- HE.4: the eigenvalues are supplied; no generic derivative operator is replanned. -/
def coefficientIdeal (p : ℕ) [Fact p.Prime] (a : ℕ → ℤ) (s : Finset ℕ) :
    Ideal ℤ_[p] := by
  sorry

theorem coefficientIdeal_empty (p : ℕ) [Fact p.Prime] (a : ℕ → ℤ) :
    coefficientIdeal p a ∅ = ⊥ := by
  sorry

theorem coefficientIdeal_insert (p : ℕ) [Fact p.Prime] (a : ℕ → ℤ)
    (s : Finset ℕ) (ℓ : ℕ) (hℓ : ℓ ∉ s) :
    coefficientIdeal p a (insert ℓ s) =
      Ideal.span ({(a ℓ : ℤ_[p]), ((ℓ : ℤ_[p]) + 1)} : Set ℤ_[p]) +
      coefficientIdeal p a s := by
  sorry

theorem coefficientIdeal_le_of_subset (p : ℕ) [Fact p.Prime] (a : ℕ → ℤ)
    (s t : Finset ℕ) (hst : s ⊆ t) : coefficientIdeal p a s ≤ coefficientIdeal p a t := by
  sorry

-- TauCeti.Heegner.coefficientIdeal_conductor_one
example (p : ℕ) [Fact p.Prime] (a : ℕ → ℤ) : coefficientIdeal p a ∅ = ⊥ := by
  sorry

-- TauCeti.Heegner.coefficientIdeal_prime_five
example : coefficientIdeal 5 (fun _ => 10) {19} =
    Ideal.span ({(5 : ℤ_[5])} : Set ℤ_[5]) := by
  sorry

-- TauCeti.Heegner.coefficientIdeal_min_not_max
example : coefficientIdeal 5 (fun ℓ => if ℓ = 19 then 10 else 25) {19, 149} =
    Ideal.span ({(5 : ℤ_[5])} : Set ℤ_[5]) := by
  sorry

/- resInv is the actual restriction equivalence after torsion-invariant vanishing.
Omitted: the continuous Galois field/coefficient carrier contract. -/
def descendedClass {C I : Type*} [AddCommGroup C] [AddCommGroup I]
    (resInv : C ≃+ I) (z : I) : C := by
  sorry

theorem descendedClass_restrict {C I : Type*} [AddCommGroup C] [AddCommGroup I]
    (resInv : C ≃+ I) (z : I) : resInv (descendedClass resInv z) = z := by
  sorry

theorem descendedClass_unique {C I : Type*} [AddCommGroup C] [AddCommGroup I]
    (resInv : C ≃+ I) (z : I) (c : C) (hc : resInv c = z) :
    c = descendedClass resInv z := by
  sorry

theorem descendedClass_natural {C I C' I' : Type*}
    [AddCommGroup C] [AddCommGroup I] [AddCommGroup C'] [AddCommGroup I']
    (resInv : C ≃+ I) (resInv' : C' ≃+ I') (f : C →+ C') (g : I →+ I')
    (h : ∀ c, resInv' (f c) = g (resInv c)) (z : I) :
    f (descendedClass resInv z) = descendedClass resInv' (g z) := by
  sorry

-- TauCeti.Heegner.descendedClass_zero
example {C I : Type*} [AddCommGroup C] [AddCommGroup I] (e : C ≃+ I) :
    descendedClass e 0 = 0 := by
  sorry

-- TauCeti.Heegner.descendedClass_identity
example {C : Type*} [AddCommGroup C] (z : C) :
    descendedClass (AddEquiv.refl C) z = z := by
  sorry

-- TauCeti.Heegner.descendedClass_noninjective_obstruction
example : (0 : ℤ) ≠ 1 ∧ (0 : ℤ →+ ℤ) 0 = (0 : ℤ →+ ℤ) 1 := by
  sorry

/- HE.5: χ must be a proved global action, not merely a local coefficient matrix.
Omitted: the Heegner χ localization/change-of-group comparison and tensor carrier. -/
def correctedClass {C : Type*} [AddCommGroup C] (χ : C ≃+ C) (κ : C) : C := by
  sorry

theorem correctedClass_apply {C : Type*} [AddCommGroup C] (χ : C ≃+ C) (κ : C) :
    correctedClass χ κ = χ.symm κ := by
  sorry

theorem correctedClass_uncorrect {C : Type*} [AddCommGroup C] (χ : C ≃+ C) (κ : C) :
    χ (correctedClass χ κ) = κ := by
  sorry

theorem correctedClass_comp {C : Type*} [AddCommGroup C] (χ ψ : C ≃+ C) (κ : C) :
    correctedClass (χ.trans ψ) κ = correctedClass χ (correctedClass ψ κ) := by
  sorry

-- TauCeti.Heegner.correctedClass_bottom
example {C : Type*} [AddCommGroup C] (κ : C) :
    correctedClass (AddEquiv.refl C) κ = κ := by
  sorry

-- TauCeti.Heegner.correctedClass_zero
example {C : Type*} [AddCommGroup C] (χ : C ≃+ C) : correctedClass χ 0 = 0 := by
  sorry

-- TauCeti.Heegner.correctedClass_involution
example {C : Type*} [AddCommGroup C] (χ : C ≃+ C)
    (hχ : ∀ z, χ z = -z) (κ : C) : correctedClass χ κ = -κ := by
  sorry



-- Named arithmetic theorem prototypes.
-- Each comment gives its full mathematical node. Arithmetic identification and
-- unavailable supplier hypotheses are omitted, not represented by fake Prop fields.

/- HeegnerPointEulerSystems:HE.0/local-toral-order
For a specified embedding ι:E_v↪B_v of a quadratic étale Q_v-algebra, a maximal Z_v-order O_v⊂B_v and g_v∈B_v×, the Heegner local order is ι⁻¹(g_v O_v g_v⁻¹). It is a full Z_v-order of the form Z_v+f_v O_{E_v}, is stable under quadratic conjugation, and is maximal away from finitely many places for a rational embedding and restricted adelic g.
Omitted conditions: the exact arithmetic object/field/level/local-condition
identifications and all source-qualified hypotheses in this node. The signature
expresses its indicated algebraic conclusion only; see the packet prototype gap. -/
theorem local_toral_order {K : Type*} [CommRing K] (Λ : Subring K) (orders : ℕ → Subring K) : ∃ n, Λ = orders n := by
  sorry

/- HeegnerPointEulerSystems:HE.0/transported-global-order
For a rational quadratic embedding E↪B and a restricted adelic g, Λ=E∩∏_v Λ_v is a finite-index Z-order in O_E, with Λ⊗Z_v≃Λ_v. Its Picard group is the existing CommRing.Pic Λ, equivalently ClassGroup Λ; only invertible proper fractional ideals occur.
Omitted conditions: the exact arithmetic object/field/level/local-condition
identifications and all source-qualified hypotheses in this node. The signature
expresses its indicated algebraic conclusion only; see the packet prototype gap. -/
theorem transported_global_order {K L : Type*} [CommRing K] [CommRing L] (Λ : Subring K) (Λv : Subring L) (localize : Subring K → Subring L) : localize Λ = Λv := by
  sorry

/- HeegnerPointEulerSystems:HE.0/idele-ideal-class-comparison
For the imaginary quadratic transported order Λ, map a finite invertible idele t to the locally principal fractional ideal E∩t∏_v Λ_v. This induces the ordinary finite idele-class quotient the left quotient of A_E,f× by E× and the right quotient by Λ̂×≃Pic Λ and the S={∞} toral packet quotient C_S≃Pic Λ. The torus covering E×→E×/Q× is used explicitly; kernel triviality uses the class number one of Q.
Omitted conditions: the exact arithmetic object/field/level/local-condition
identifications and all source-qualified hypotheses in this node. The signature
expresses its indicated algebraic conclusion only; see the packet prototype gap. -/
theorem idele_ideal_class_comparison {O G : Type*} [CommRing O] [CommGroup G] : Nonempty (G ≃* CommRing.Pic O) := by
  sorry

/- HeegnerPointEulerSystems:HE.0/conductor-change-kernel
Let K/Q be imaginary quadratic, c≥1 and ℓ prime. Extension of invertible ideals gives Pic(O_cℓ)→Pic(O_c), surjectively. If ℓ∤c, its kernel is (O_c/ℓO_c)×/((Z/ℓZ)×·image(O_c×)); thus u_c,ℓ·#ker=ℓ−χ_K(ℓ), where u_c,ℓ=[O_c×:O_cℓ×]. If ℓ|c, u_c,ℓ·#ker=ℓ. χ takes −1,0,1 in inert, ramified, split cases. Every quotient and map is induced by the actual inclusions of orders.
Omitted conditions: the exact arithmetic object/field/level/local-condition
identifications and all source-qualified hypotheses in this node. The signature
expresses its indicated algebraic conclusion only; see the packet prototype gap. -/
theorem conductor_change_kernel {O O' : Type*} [CommRing O] [CommRing O'] (f : CommRing.Pic O' →* CommRing.Pic O) (ℓ u : ℕ) (χ : ℤ) : Function.Surjective f ∧ (u : ℤ) * (Nat.card f.ker : ℤ) = (ℓ : ℤ) - χ := by
  sorry

/- HeegnerPointEulerSystems:HE.0/ring-class-tower-quotients
Using the ring-class existence theorem imported from CFT13, realize every K[c] in a fixed separable closure of K. For c|d, O_d⊂O_c gives K[c]⊂K[d] and restriction Gal(K[d]/K)→Gal(K[c]/K), compatible under composition and with ideal extension under Artin. Its kernel is Gal(K[d]/K[c]), and [K[cℓ]:K[c]] equals the kernel cardinal computed in conductor-change-kernel. Splitting of a prime away from the conductor is equivalent to its invertible ideal class being trivial; K[c]/K is unramified outside c and the exact local ramification is supplied by local unit reciprocity.
Omitted conditions: the exact arithmetic object/field/level/local-condition
identifications and all source-qualified hypotheses in this node. The signature
expresses its indicated algebraic conclusion only; see the packet prototype gap. -/
theorem ring_class_tower_quotients {G H : Type*} [Group G] [Group H] (restriction : G →* H) (degree : ℕ) : Function.Surjective restriction ∧ Nat.card restriction.ker = degree := by
  sorry

/- HeegnerPointEulerSystems:HE.0/dihedral-conjugation
For imaginary quadratic K/Q, K[c]/Q is Galois and a chosen complex conjugation τ satisfies τστ⁻¹=σ⁻¹ for σ∈Gal(K[c]/K). The conjugation is attached to an archimedean embedding and compatible throughout the tower. Do not equip a general ring class field with IsCMField: it need not be a CM field.
Omitted conditions: the exact arithmetic object/field/level/local-condition
identifications and all source-qualified hypotheses in this node. The signature
expresses its indicated algebraic conclusion only; see the packet prototype gap. -/
theorem dihedral_conjugation {G : Type*} [Group G] (τ σ : G) : τ * σ * τ⁻¹ = σ⁻¹ := by
  sorry

/- HeegnerPointEulerSystems:HE.0/relative-cm-conductor-tower
Let F be totally real, K/F totally imaginary quadratic and P a finite prime of F. The imported orders O_Pn=O_F+PⁿO_K and class fields K[Pⁿ] have a compatible Galois inverse limit G∞. The finite idele/unit quotient realizes this limit; G∞ has finite torsion subgroup G0 and G∞/G0≃Z_p^[F_P:Q_p]. For sufficiently large n, [K[Pⁿ⁺¹]:K[Pⁿ]]=N(P), with the finite initial global-unit indices retained. The admissible level subgroup is the intersection with the specified quaternionic level, not an arbitrary replacement.
Omitted conditions: the exact arithmetic object/field/level/local-condition
identifications and all source-qualified hypotheses in this node. The signature
expresses its indicated algebraic conclusion only; see the packet prototype gap. -/
theorem relative_cm_conductor_tower (degrees : ℕ → ℕ) (residueCard : ℕ) : ∃ n₀, ∀ n, n₀ ≤ n → degrees n = residueCard := by
  sorry

/- HeegnerPointEulerSystems:HE.0/norm-reciprocity-level-compatibility
For the relative CM towers and an inclusion of admissible finite-level subgroups, field restriction, finite idele quotient projection and order ideal extension commute under Artin. For a finite extension of CM bases, field norm and ideal norm agree with the imported functorial Artin map on the relevant finite quotient. Cornut–Vatsal uses geometric Frobenius: the arithmetic-Frobenius version in this packet inverts the reciprocity/Frobenius arguments before using any pointwise identity.
Omitted conditions: the exact arithmetic object/field/level/local-condition
identifications and all source-qualified hypotheses in this node. The signature
expresses its indicated algebraic conclusion only; see the packet prototype gap. -/
theorem norm_reciprocity_level_compatibility {A B C D : Type*} (norm : A → B) (recA : A → C) (recB : B → D) (restriction : C → D) : recB ∘ norm = restriction ∘ recA := by
  sorry

/- HeegnerPointEulerSystems:HE.0/local-different-discriminant
For the local quadratic étale order Λ_v, define its trace dual Λ_v∨={a∈E_v:Tr(aΛ_v)⊆Z_v} using the imported lattice/trace pairing. Its inverse different is a principal invertible fractional Λ_v-ideal; the different is its inverse. The ideal norm (equivalently the absolute local discriminant valuation) agrees with the order discriminant. This does not identify the signed field norm of a generator with a positive discriminant; in a split conductor-π order a generator (π,−π) has norm −π².
Omitted conditions: the exact arithmetic object/field/level/local-condition
identifications and all source-qualified hypotheses in this node. The signature
expresses its indicated algebraic conclusion only; see the packet prototype gap. -/
theorem local_different_discriminant {K : Type*} [CommRing K] (different : Ideal K) : different.IsPrincipal := by
  sorry

/- HeegnerPointEulerSystems:HE.1/cm-cyclic-isogeny-pair
Assume K imaginary quadratic of discriminant different from −3,−4, N≥1 with every prime dividing N split, c prime to N, and an invertible O_c-ideal 𝔑_c with O_c/𝔑_c≃Z/NZ. For a proper invertible fractional ideal a, the pair C/a→C/(𝔑_c⁻¹a) is cyclic of degree N and gives the corresponding existing X₀(N) moduli point. The endomorphism ring is O_c; replacing a by αa gives the same level pair. Changing 𝔑 or its orientation is an explicitly recorded Galois/Fricke action, not literal equality.
Omitted conditions: the exact arithmetic object/field/level/local-condition
identifications and all source-qualified hypotheses in this node. The signature
expresses its indicated algebraic conclusion only; see the packet prototype gap. -/
theorem cm_cyclic_isogeny_pair {F : Type*} [Field F] (W : WeierstrassCurve.Affine F) (kernel : AddSubgroup W.Point) (N : ℕ) : Nat.card kernel = N := by
  sorry

/- HeegnerPointEulerSystems:HE.1/optimal-embedding-cm-points
For F totally real, K/F CM, B ramified at all but one real place and specified finite places, and Eichler order R, an optimal embedding O_C↪R is an F-algebra embedding K↪B satisfying K∩R=O_C. K splits B iff K_v is a field at every ramified finite place (and the archimedean embedding condition holds). The CM double-coset description K×\B̂×/R̂× with a specified archimedean CM type identifies the complex CM points, with local optimal-embedding conditions required by the chosen Eichler level. It has not yet asserted rationality.
Omitted conditions: the exact arithmetic object/field/level/local-condition
identifications and all source-qualified hypotheses in this node. The signature
expresses its indicated algebraic conclusion only; see the packet prototype gap. -/
theorem optimal_embedding_cm_points {K B : Type*} [Field K] [Ring B] (ι : K →+* B) (O : Subring K) (R : Subring B) : R.comap ι = O := by
  sorry

/- HeegnerPointEulerSystems:HE.1/canonical-model-cm-descent
For the CM level points above, the imported main CM theorem/canonical model reciprocity shows x_C∈X(K[C]) in the actual HE.0 tower. Its stabilizer is K× times the intersection of the finite torus with the chosen level; σ=rec_K(t) acts by x(g)↦x(t^εg) in Cornut–Vatsal’s geometric convention. Convert to arithmetic reciprocity with the inverse convention before comparison. The statement concerns the cyclic-isogeny pair or optimal embedding, not only j(E).
Omitted conditions: the exact arithmetic object/field/level/local-condition
identifications and all source-qualified hypotheses in this node. The signature
expresses its indicated algebraic conclusion only; see the packet prototype gap. -/
theorem canonical_model_cm_descent {F L : Type*} [Field F] [Field L] (W : WeierstrassCurve.Affine F) (W' : WeierstrassCurve.Affine L) (baseChange : W.Point → W'.Point) (P : W'.Point) : ∃ Q, baseChange Q = P := by
  sorry

/- HeegnerPointEulerSystems:HE.1/jacobian-basepoint-denominators
For X₀(N) use the rational cusp ∞ to form [x−∞]. For a compact quaternionic curve use the imported normalized rational Hodge class ξ=(K_X+B_X)/deg(K_X+B_X), componentwise of degree one; x↦[x−ξ] lies in J⊗Q. Choose a nonzero integer d clearing the denominators to obtain the integral class [d x−d ξ]. Do not erase d. For an auxiliary ℓ₀, (ℓ₀+1−Tℓ₀)x is degree zero; after quotienting by an eigenform g, division by ℓ₀+1−aℓ₀ is valid integrally at p only if it is a p-adic unit.
Omitted conditions: the exact arithmetic object/field/level/local-condition
identifications and all source-qualified hypotheses in this node. The signature
expresses its indicated algebraic conclusion only; see the packet prototype gap. -/
theorem jacobian_basepoint_denominators {J : Type*} [AddCommGroup J] [Module ℚ J] (degree : J →ₗ[ℚ] ℚ) (ξ : J) : degree ξ = 1 := by
  sorry

/- HeegnerPointEulerSystems:HE.1/parameter-choice-and-degree
For the fixed Heegner family, ideal-class translation gives the corresponding Galois translation; a Fricke/orientation change acts by the recorded eigenvalue and rational cusp-torsion translation. Multiplying the modular parametrization or clearing Hodge denominators scales P_c and the bottom trace by that integer. For Gross’s rational optimal curve, φ*ω_E=c_φ·(2πif(z)dz), with positive integral Manin constant c_φ; the index I_K/c_φ is invariant under the appropriate isogeny change, not I_K alone.
Omitted conditions: the exact arithmetic object/field/level/local-condition
identifications and all source-qualified hypotheses in this node. The signature
expresses its indicated algebraic conclusion only; see the packet prototype gap. -/
theorem parameter_choice_and_degree {F : Type*} [Field F] (W : WeierstrassCurve.Affine F) (P Q torsionTranslation : W.Point) (u : ℤ) : Q = u • P + torsionTranslation := by
  sorry

/- HeegnerPointEulerSystems:HE.2/cm-hecke-conductor-classification
At a finite prime P where B is split and the Eichler level is maximal, let ε_P=−1,0,1 for inert, ramified, split K/F. A level-zero CM lattice has 1+ε_P horizontal neighbors and N(P)−ε_P ascending neighbors of conductor P. At positive conductor n it has one predecessor of conductor n−1 and N(P) ascending neighbors of conductor n+1. The ascending set is a torsor for O_n×/O_n+1×. Global unit stabilizers must be divided out when converting this local sum into a field trace.
Omitted conditions: the exact arithmetic object/field/level/local-condition
identifications and all source-qualified hypotheses in this node. The signature
expresses its indicated algebraic conclusion only; see the packet prototype gap. -/
theorem cm_hecke_conductor_classification (q horizontal ascending : ℕ) (ε : ℤ) : (horizontal : ℤ) = 1 + ε ∧ (ascending : ℤ) = (q : ℤ) - ε := by
  sorry

/- HeegnerPointEulerSystems:HE.2/norm-relation-and-reduction-congruence
Under the classical Heegner hypothesis, ℓ prime with ℓ∤cN and inert in K, the compatible cusp-normalized family satisfies u_c,ℓ·Tr_{K[cℓ]/K[c]}P_cℓ=a_ℓP_c. With ordinary units u=1 this is the Gross/Howard equality. For a d-cleared Hodge family, first prove that the chosen basepoint is a Hecke eigenclass and transport the divisor relation; retain any integral torsion difference if only a rational eigenclass identity is known.
Omitted conditions: the exact arithmetic object/field/level/local-condition
identifications and all source-qualified hypotheses in this node. The signature
expresses its indicated algebraic conclusion only; see the packet prototype gap. -/
theorem norm_relation_and_reduction_congruence {F : Type*} [Field F] (W : WeierstrassCurve.Affine F) (P : W.Point) (trace : W.Point) (u : ℕ) (aℓ : ℤ) : u • trace = aℓ • P := by
  sorry

/- HeegnerPointEulerSystems:HE.2/split-ramified-first-step-recurrence
For ℓ∤cN, the local divisor trace with u_c,ℓ retained equals T_ℓx_c−(σ_ℓ+σ_ℓbar)x_c in the split case and T_ℓx_c−σ_ℓx_c in the ramified case. Here Frobenius on the lower-conductor field is unramified at ℓ; the ramified case refers to K/Q ramification, not ramification of K[c]/K away from c. Use the specified reciprocity convention. After the fixed eigenquotient replace T_ℓ by a_ℓ only with the exact Jacobian basepoint corrections.
Omitted conditions: the exact arithmetic object/field/level/local-condition
identifications and all source-qualified hypotheses in this node. The signature
expresses its indicated algebraic conclusion only; see the packet prototype gap. -/
theorem split_ramified_first_step_recurrence {F : Type*} [Field F] (W : WeierstrassCurve.Affine F) (P trace : W.Point) (u : ℕ) (aℓ : ℤ) (horizontal : W.Point) : u • trace = aℓ • P - horizontal := by
  sorry

/- HeegnerPointEulerSystems:HE.2/repeated-conductor-predecessor-recurrence
At maximal local quaternionic level and conductor exponent n≥2, the local unit trace of a CM point x of conductor n is T_P^lower(pr^upper x)−pr^lower(pr^upper x). On a coherent chosen chain this gives the repeated-conductor recurrence, with predecessor and central scaling specified. Passing to the global field trace divides the orbit by the actual global-unit stabilizer; it must not simply copy the first-step inert ℓ+1 formula.
Omitted conditions: the exact arithmetic object/field/level/local-condition
identifications and all source-qualified hypotheses in this node. The signature
expresses its indicated algebraic conclusion only; see the packet prototype gap. -/
theorem repeated_conductor_predecessor_recurrence {M : Type*} [AddCommGroup M] (trace predecessor secondPredecessor : M) (hecke : M →+ M) : trace = hecke predecessor - secondPredecessor := by
  sorry

/- HeegnerPointEulerSystems:HE.2/nonmaximal-level-distribution
For a prime P with Eichler level exponent δ=1, orient the lattice pair and its type I/II. For conductor ≥2, its unit trace equals the appropriate upper/lower Hecke operator on its predecessor and becomes −pr(x) in the P-new quotient. For δ≥2, type I/II points have zero trace in the P-new quotient; type III is excluded. Reversing the orientation exchanges types I and II. These are divisor-module statements before any abelian quotient.
Omitted conditions: the exact arithmetic object/field/level/local-condition
identifications and all source-qualified hypotheses in this node. The signature
expresses its indicated algebraic conclusion only; see the packet prototype gap. -/
theorem nonmaximal_level_distribution {M : Type*} [AddCommGroup M] (trace predecessor : M) : trace = -predecessor := by
  sorry

/- HeegnerPointEulerSystems:HE.2/inert-reduction-frobenius-congruence
For the classical compatible family, ℓ∤cND inert, choose compatible primes λ_cℓ|λ_c over ℓ and the actual good-reduction specialization maps. Then red_λcℓ(P_cℓ)=Frob_λc(red_λc(P_c)) after the specified residue-field identifications; Frobenius is the ℓ-power geometric endomorphism on the reduction of the modular/elliptic curve as fixed in Gross’s convention. State separately the Artin arithmetic-Frobenius conversion. This is pointwise, not merely an equality of traces.
Omitted conditions: the exact arithmetic object/field/level/local-condition
identifications and all source-qualified hypotheses in this node. The signature
expresses its indicated algebraic conclusion only; see the packet prototype gap. -/
theorem inert_reduction_frobenius_congruence {F k : Type*} [Field F] [Field k] (W : WeierstrassCurve.Affine F) (Wk : WeierstrassCurve.Affine k) (red : W.Point → Wk.Point) (frobenius : Wk.Point → Wk.Point) (P Pℓ : W.Point) : red Pℓ = frobenius (red P) := by
  sorry

/- HeegnerPointEulerSystems:HE.2/quaternionic-reduction-specialization
For Zhang’s m∈Λ′+ and an admissible q∤m, reduction of x_m(n) at q is x_mq(n) in the definite Shimura set, using the matched optimal embedding and supersingular identification. For q|m, specialization is x_m/q(n) on the chosen vertex copy of the semistable reduction graph. Both formulas require the same CM/basepoint identifications and q splitting completely in the fields of definition used.
Omitted conditions: the exact arithmetic object/field/level/local-condition
identifications and all source-qualified hypotheses in this node. The signature
expresses its indicated algebraic conclusion only; see the packet prototype gap. -/
theorem quaternionic_reduction_specialization {X Xq : Type*} (reduction : X → Xq) (x : ℕ → X) (xq : ℕ → Xq) (n : ℕ) : reduction (x n) = xq n := by
  sorry

/- HeegnerPointEulerSystems:HE.3/kummer-classes-and-the-modified-selmer-conditions
Apply the imported finite Kummer injection E(K[c])/p^mE(K[c])→H¹_cont(K[c],E[p^m]) to P_c. Apply the imported p-adic Kummer map to the compatible p-completion to obtain the integral T_pE class. The finite classes are its actual coefficient reductions, and restriction/corestriction commute with the field maps/point trace, including all trace/unit constants from HE.2. The Tate module has its inverse-limit topology and finite torsion coefficients their discrete topology.
Omitted conditions: the exact arithmetic object/field/level/local-condition
identifications and all source-qualified hypotheses in this node. The signature
expresses its indicated algebraic conclusion only; see the packet prototype gap. -/
theorem kummer_classes_and_the_modified_selmer_conditions {M C C' : Type*} [AddCommGroup M] [AddCommGroup C] [AddCommGroup C'] (kummer : M →+ C) (kummer' : M →+ C') (reduction : C →+ C') : reduction.comp kummer = kummer' := by
  sorry

/- HeegnerPointEulerSystems:HE.3/good-place-kummer-unramified
For ℓ≠p of good reduction, the finite Kummer image E(K_v)/p^m agrees with H¹_unr(K_v,E[p^m]); in particular P_c’s Kummer class is unramified at such v, after transfer to the relevant field. The proof uses the Néron model and unramified torsion, not a claim that all local cohomology is unramified.
Omitted conditions: the exact arithmetic object/field/level/local-condition
identifications and all source-qualified hypotheses in this node. The signature
expresses its indicated algebraic conclusion only; see the packet prototype gap. -/
theorem good_place_kummer_unramified {M C : Type*} [AddCommGroup M] [AddCommGroup C] (kummer : M →+ C) (unramified : AddSubgroup C) : kummer.range = unramified := by
  sorry

/- HeegnerPointEulerSystems:HE.3/bad-place-component-obstruction
For finite v∤p, compare the local point Kummer image with the propagated rational unramified condition. The discrepancy factors through the p-primary component group of the Néron model, together with the precise local invariants/quotient torsion terms. Equality requires the appropriate obstruction to vanish; residual irreducibility alone does not remove it. For Gross’s derived d(n), the cusp-divisor and connected-Néron-model argument proves local triviality away from n even at primes dividing N.
Omitted conditions: the exact arithmetic object/field/level/local-condition
identifications and all source-qualified hypotheses in this node. The signature
expresses its indicated algebraic conclusion only; see the packet prototype gap. -/
theorem bad_place_component_obstruction {M C Φ : Type*} [AddCommGroup M] [AddCommGroup C] [AddCommGroup Φ] (kummerDefect : M →+ C) (component : M →+ Φ) : ∃ obstruction : Φ →+ C, kummerDefect = obstruction.comp component := by
  sorry

/- HeegnerPointEulerSystems:HE.3/coefficient-prime-local-condition
At v|p with good reduction, the actual Kummer class of P_c satisfies the finite/crystalline rational condition and its integral propagated Kummer condition. In the good ordinary branch compare with the Greenberg filtration only under the exact ordinary/crystalline comparison hypotheses and retain local-torsion error terms. A rational equality after tensoring with Q_p is not an equality of integral lattices.
Omitted conditions: the exact arithmetic object/field/level/local-condition
identifications and all source-qualified hypotheses in this node. The signature
expresses its indicated algebraic conclusion only; see the packet prototype gap. -/
theorem coefficient_prime_local_condition {M C : Type*} [AddCommGroup M] [AddCommGroup C] (kummer : M →+ C) (finiteCondition : AddSubgroup C) (P : M) : kummer P ∈ finiteCondition := by
  sorry

/- HeegnerPointEulerSystems:HE.3/saturated-integral-kummer-lattice
Compare the actual finite/p-adic Heegner Kummer classes in the Selmer lattice with E(K)⊗Z_p, V_pE, and E[p∞]. Use the Kummer exact sequence to identify the quotient by the Mordell–Weil lattice with the appropriate Sha group. Saturation is a separate integral assertion; the finite cokernel and local component-group defects must be retained before rationalizing.
Omitted conditions: the exact arithmetic object/field/level/local-condition
identifications and all source-qualified hypotheses in this node. The signature
expresses its indicated algebraic conclusion only; see the packet prototype gap. -/
theorem saturated_integral_kummer_lattice {M C S : Type*} [AddCommGroup M] [AddCommGroup C] [AddCommGroup S] (kummer : M →+ C) (shaMap : C →+ S) : kummer.range = shaMap.ker := by
  sorry

/- HeegnerPointEulerSystems:HE.3/archimedean-tate-correction
Over imaginary quadratic K all archimedean completions are C, so the relevant local H¹ vanishes. In descent to Q at a real place use the real/Tate local condition on the actual E[p^m] module. Odd p permits the usual conjugation eigenspace splitting; at p=2 its kernel/cokernel must be retained and one cannot divide by two on an integral Z₂ lattice.
Omitted conditions: the exact arithmetic object/field/level/local-condition
identifications and all source-qualified hypotheses in this node. The signature
expresses its indicated algebraic conclusion only; see the packet prototype gap. -/
theorem archimedean_tate_correction {C : Type*} [AddCommGroup C] (realPlaceClass : C) : (2 : ℕ) • realPlaceClass = 0 := by
  sorry

/- HeegnerPointEulerSystems:HE.4/differentiated-point-invariance
For the actual squarefree ring-class conductor n, let G_n=Gal(K[n]/K[1]) be the product of its cyclic inert factors and 𝒢_n=Gal(K[n]/K). Under ordinary units and the clean torsion-image hypotheses, choose generators σ_ℓ and coset representatives S for 𝒢_n/G_n. Use ES3’s D_n=∏D_ℓ and set the differentiated point ˜P_n=Σ_{s∈S}sD_nP_n. Its class modulo I_n is 𝒢_n-invariant and independent of S. Use the full 𝒢_n action, not merely invariance under G_n. Exceptional-unit factors require a modified bounded-denominator construction, not an assumed direct product.
Omitted conditions: the exact arithmetic object/field/level/local-condition
identifications and all source-qualified hypotheses in this node. The signature
expresses its indicated algebraic conclusion only; see the packet prototype gap. -/
theorem differentiated_point_invariance {M : Type*} [AddCommGroup M] (action : M →+ M) (derived : M) (modulus : ℕ) : ∃ Q, action derived - derived = modulus • Q := by
  sorry

/- HeegnerPointEulerSystems:HE.4/ring-class-torsion-invariants
Under Gross’s odd-p full residual image hypothesis or Howard’s full G_K Tate-image hypothesis, E[p^m](K[n])=0 for the relevant ring-class towers and all m≥1. The residual case uses the generalized-dihedral nature of K[n]/Q and the irreducible two-dimensional image; bootstrap finite exponent using multiplication by p. This statement is not implied by residual irreducibility for arbitrary field extensions.
Omitted conditions: the exact arithmetic object/field/level/local-condition
identifications and all source-qualified hypotheses in this node. The signature
expresses its indicated algebraic conclusion only; see the packet prototype gap. -/
theorem ring_class_torsion_invariants {F : Type*} [Field F] (W : WeierstrassCurve.Affine F) (p m : ℕ) (hm : 0 < m) : ∀ P : W.Point, p ^ m • P = 0 → P = 0 := by
  sorry

/- HeegnerPointEulerSystems:HE.4/explicit-cocycle-divisibility
Choose p^mQ=˜P_n over the separable closure. The class c_m(n) is represented by σQ−Q−(σ˜P_n−˜P_n)/p^m, where the last quotient is the uniquely specified K[n]-rational division term under torsion vanishing. Hence c_m(n)=0 iff ˜P_n∈p^mE(K[n]); its image d_m(n) in H¹(K,E)[p^m] vanishes iff ˜P_n∈p^mE(K[n])+E(K), with descent interpreted through the actual restriction map.
Omitted conditions: the exact arithmetic object/field/level/local-condition
identifications and all source-qualified hypotheses in this node. The signature
expresses its indicated algebraic conclusion only; see the packet prototype gap. -/
theorem explicit_cocycle_divisibility {M C : Type*} [AddCommGroup M] [AddCommGroup C] (derived : M) (κ : C) (q : ℕ) : κ = 0 ↔ ∃ Q : M, q • Q = derived := by
  sorry

/- HeegnerPointEulerSystems:HE.4/bottom-trace-class
At n=1, D_1=1 and the sum over 𝒢_1 gives y_K=Tr_{K[1]/K}P_1. Thus c_m(1)=δ_m(y_K) and the integral bottom class κ_1=δ_T(y_K), while d_m(1)=0. This is not δ(P_1) over K unless P_1 already descends.
Omitted conditions: the exact arithmetic object/field/level/local-condition
identifications and all source-qualified hypotheses in this node. The signature
expresses its indicated algebraic conclusion only; see the packet prototype gap. -/
theorem bottom_trace_class {M C : Type*} [AddCommGroup M] [AddCommGroup C] (kummer : M →+ C) (trace : M) (bottom : C) : bottom = kummer trace := by
  sorry

/- HeegnerPointEulerSystems:HE.4/generator-tensor-choice-independence
After tensoring with G(n)=⊗_{ℓ|n}Gal(K[ℓ]/K[1]), the Heegner derivative class has the prescribed ES3 generator-change transformation law; changing σ_ℓ to σ_ℓ^u changes the derivative class by the inverse unit factor modulo I_n and the cyclic tensor generator by the compensating factor. State compatibility with lift/coset choices separately. Do not assert raw scalar classes are generator-independent.
Omitted conditions: the exact arithmetic object/field/level/local-condition
identifications and all source-qualified hypotheses in this node. The signature
expresses its indicated algebraic conclusion only; see the packet prototype gap. -/
theorem generator_tensor_choice_independence {C : Type*} [AddCommGroup C] (κ κ' : C) (u : ℤ) : u • κ' = κ := by
  sorry

/- HeegnerPointEulerSystems:HE.4/coefficient-and-prime-set-compatibility
For m′≤m≤M(n), reduction E[p^m]→E[p^m′] takes c_m(n) to c_m′(n) under the exact chosen division/Kummer conventions. Restricting the permitted auxiliary-prime set restricts the same family; adding primes extends the family only when the conductor/norm/reduction hypotheses and tensor factors are proved for them. No map removing a prime factor of n is assumed without the local system relation.
Omitted conditions: the exact arithmetic object/field/level/local-condition
identifications and all source-qualified hypotheses in this node. The signature
expresses its indicated algebraic conclusion only; see the packet prototype gap. -/
theorem coefficient_and_prime_set_compatibility {C C' : Type*} [AddCommGroup C] [AddCommGroup C'] (reduce : C →+ C') (κ : ℕ → C) (κ' : ℕ → C') : ∀ n, reduce (κ n) = κ' n := by
  sorry

/- HeegnerPointEulerSystems:HE.4/complex-conjugation-parity
For odd p and the clean classical branch, if ε is the Fricke eigenvalue of the eigenquotient, τc_m(n)=ε(−1)^ν(n)c_m(n); equivalently using the global root number w=−ε, this is w(−1)^ν(n)+1. The torsion term from the basepoint/Fricke relation is removed only after its prime-to-p proof. At p=2 this formula does not yield an integral direct-sum eigenspace decomposition.
Omitted conditions: the exact arithmetic object/field/level/local-condition
identifications and all source-qualified hypotheses in this node. The signature
expresses its indicated algebraic conclusion only; see the packet prototype gap. -/
theorem complex_conjugation_parity {C : Type*} [AddCommGroup C] (τ : C →+ C) (κ : C) (ε : ℤ) (ν : ℕ) : τ κ = (ε * (-1) ^ ν) • κ := by
  sorry

/- HeegnerPointEulerSystems:HE.5/heegner-transverse-local-condition
For ℓ|n an inert auxiliary prime under Howard’s odd-p clean hypotheses, the localization of c(n) restricts to zero over the specified totally ramified local ring-class extension K[n]_λ/K_λ. Thus it lies in the transverse condition used by ES1. Away from n it lies in the propagated finite local condition established in HE3. The p-odd identity Σ_{i=1}^{ℓ}i=ℓ(ℓ+1)/2 enters the transverse proof and cannot be copied integrally at p=2.
Omitted conditions: the exact arithmetic object/field/level/local-condition
identifications and all source-qualified hypotheses in this node. The signature
expresses its indicated algebraic conclusion only; see the packet prototype gap. -/
theorem heegner_transverse_local_condition {C L : Type*} [AddCommGroup C] [AddCommGroup L] (restriction : C →+ L) (κ : C) : restriction κ = 0 := by
  sorry

/- HeegnerPointEulerSystems:HE.5/local-heegner-chi-automorphism
At inert ℓ, define Howard’s automorphism χ_ℓ on T/I_ℓT through local reduction, projection to the p-primary subgroup, p^−M(a_ℓ−(ℓ+1)Fr_ℓ), and the canonical torsion lift. The valuation/cyclic Frobenius-eigenspace calculation proves it is invertible. With all chosen cyclic generators retained, χ_ℓ(κ_n(Fr_λ))=κ_nℓ(σ_ℓ) is the actual Heegner finite–singular relation. This is an arithmetic correction to ES1’s generic comparison, not an assertion that raw classes already form a strong system.
Omitted conditions: the exact arithmetic object/field/level/local-condition
identifications and all source-qualified hypotheses in this node. The signature
expresses its indicated algebraic conclusion only; see the packet prototype gap. -/
theorem local_heegner_chi_automorphism {C : Type*} [AddCommGroup C] (χ : C ≃+ C) (finite singular : C) : χ finite = singular := by
  sorry

/- HeegnerPointEulerSystems:HE.5/actual-tate-hypotheses-h0-h2
Under Howard TheoremA’s full G_K→GL₂(Z_p) surjectivity, p odd and p∤DN, T=T_pE is free rank two (H0), T/pT is absolutely irreducible (H1), and the auxiliary extension F/Q containing K used in H2 trivializes T and has H¹(F(μ_p∞)/K,T/pT)=0. The central scalar subgroup of order p−1 kills this cohomology. Full Tate-image surjectivity is stronger than residual irreducibility or residual surjectivity and is stated separately.
Omitted conditions: the exact arithmetic object/field/level/local-condition
identifications and all source-qualified hypotheses in this node. The signature
expresses its indicated algebraic conclusion only; see the packet prototype gap. -/
theorem actual_tate_hypotheses_h0_h2 (p : ℕ) [Fact p.Prime] {T : Type*} [AddCommGroup T] [Module ℤ_[p] T] : Module.finrank ℤ_[p] T = 2 := by
  sorry

/- HeegnerPointEulerSystems:HE.5/actual-local-hypotheses-h3-h5
For the same actual T, verify H3 cartesian propagation at every quotient of the DVR, H4 the symmetric twisted Weil pairing (s,t)=e(s,τt) and exact orthogonality at conjugate places, and H5 extension of the residual representation to G_Q with one-dimensional τ± eigenspaces, G_Q-stability of local conditions and the required pairing/conjugation identity. Use the rational finite local conditions and their exact integral/torsion propagation; this does not define or reprove Howard’s abstract H0–H5 theorem.
Omitted conditions: the exact arithmetic object/field/level/local-condition
identifications and all source-qualified hypotheses in this node. The signature
expresses its indicated algebraic conclusion only; see the packet prototype gap. -/
theorem actual_local_hypotheses_h3_h5 (p : ℕ) [Fact p.Prime] {T : Type*} [AddCommGroup T] [Module ℤ_[p] T] (twisted : T →ₗ[ℤ_[p]] T →ₗ[ℤ_[p]] ℤ_[p]) : ∀ s t, twisted s t = twisted t s := by
  sorry

/- HeegnerPointEulerSystems:HE.5/residual-kummer-field-pairing
In Gross’s odd-p full residual-image setting let L=K(E[p]). For a finite F_p-subspace S⊂H¹(K,E[p]), let L_S be the fixed field of the intersection of the kernels of the restricted homomorphisms G_L→E[p]. Restriction identifies classes with the equivariant Hom space, and the evaluation pairing gives Gal(L_S/L)≃Hom_Fp(S,E[p]) compatibly with the residual Galois action. The proof uses that the subquotients of the direct sum E[p]^r are sums of this simple module, not general semisimplicity of arbitrary F_p[GL₂(F_p)]-modules.
Omitted conditions: the exact arithmetic object/field/level/local-condition
identifications and all source-qualified hypotheses in this node. The signature
expresses its indicated algebraic conclusion only; see the packet prototype gap. -/
theorem residual_kummer_field_pairing (p : ℕ) [Fact p.Prime] {H S V : Type*} [AddCommGroup H] [AddCommGroup S] [AddCommGroup V] [Module (ZMod p) S] [Module (ZMod p) V] : Nonempty (H ≃+ (S →ₗ[ZMod p] V)) := by
  sorry

/- HeegnerPointEulerSystems:HE.5/chebotarev-heegner-class-detection
Let M=L_S for a finite Selmer subspace S and let I fix the Kummer field generated by a pth division point of y_K. For τ acting on Gal(M/L), the square (τh)² detects the positive component used by Gross. Chebotarev primes whose Frobenius is the prescribed class of τh are inert auxiliary primes, avoid any specified finite set, and their localizations detect the corresponding evaluation annihilator. To detect a second independent class, use the correctly formed composite and the proved disjointness of its Kummer field.
Omitted conditions: the exact arithmetic object/field/level/local-condition
identifications and all source-qualified hypotheses in this node. The signature
expresses its indicated algebraic conclusion only; see the packet prototype gap. -/
theorem chebotarev_heegner_class_detection {C L : Type*} [Zero C] [Zero L] (loc : ℕ → C → L) (κ : C) (hκ : κ ≠ 0) (excluded : Finset ℕ) : ∃ ℓ : ℕ, ℓ.Prime ∧ ℓ ∉ excluded ∧ loc ℓ κ ≠ 0 := by
  sorry

/- HeegnerPointEulerSystems:HE.5/arithmetic-local-error-comparison
For the actual Heegner Tate representation, compare ES4’s restriction/invariant/local-condition errors with p-primary local torsion, the p-part of the Néron component group, and the index of the integral finite/ordinary lattice. Record each finite kernel/cokernel as a separate length or annihilator constant. Equality with an error-free theorem requires the relevant quantities to vanish, not just the global residual image hypothesis.
Omitted conditions: the exact arithmetic object/field/level/local-condition
identifications and all source-qualified hypotheses in this node. The signature
expresses its indicated algebraic conclusion only; see the packet prototype gap. -/
theorem arithmetic_local_error_comparison {R C : Type*} [CommRing R] [AddCommGroup C] [Module R C] (defect component : Submodule R C) : Module.length R defect ≤ Module.length R component := by
  sorry

/- HeegnerPointEulerSystems:HE.5/tamagawa-and-local-torsion-tests
For a split Tate curve over a local field of residue characteristic ℓ≠p with parameter q, its component group has order v(q); choose v(q)=p to get a nonzero p-component defect. If the same local field contains μ_p, the Tate uniformization supplies nonzero local E[p] even with a prime-to-p component order (for example v(q)=1). These distinct examples must fail the corresponding error-free local hypotheses. Neither local phenomenon follows or disappears from a global residual-irreducibility label.
Omitted conditions: the exact arithmetic object/field/level/local-condition
identifications and all source-qualified hypotheses in this node. The signature
expresses its indicated algebraic conclusion only; see the packet prototype gap. -/
theorem tamagawa_and_local_torsion_tests (p : ℕ) [Fact p.Prime] {Φ : Type*} [AddCommGroup Φ] (hcard : Nat.card Φ = p) : ¬ Subsingleton Φ := by
  sorry

/- HeegnerPointEulerSystems:HE.6/clean-rank-one-descent-theorem-A
Assume E/Q conductor N, imaginary quadratic K discriminant D≠−3,−4 with all N-primes split, p odd, p,D,N pairwise coprime, and full Tate representation G_K→GL₂(Z_p) surjective. If the actual bottom Heegner Kummer class κ_1≠0, the compact Selmer group is free rank one and the discrete Selmer group is Q_p/Z_p⊕M⊕M for a finite Z_p-module M with length M≤length(H¹_F(K,T_pE)/Z_pκ_1). This is Howard TheoremA after the actual arithmetic H0–H5 checks and corrected system construction; the abstract self-dual theorem is ES5’s responsibility.
Omitted conditions: the exact arithmetic object/field/level/local-condition
identifications and all source-qualified hypotheses in this node. The signature
expresses its indicated algebraic conclusion only; see the packet prototype gap. -/
theorem clean_rank_one_descent_theorem_A (p : ℕ) [Fact p.Prime] {C D : Type*} [AddCommGroup C] [AddCommGroup D] [Module ℤ_[p] C] [Module ℤ_[p] D] (κ : C) (hκ : κ ≠ 0) : Nonempty (C ≃ₗ[ℤ_[p]] ℤ_[p]) ∧ ∃ M : Submodule ℤ_[p] D, Finite M ∧ Nonempty (D ≃+ ((ℚ_[p] ⧸ (PadicInt.Coe.ringHom (p := p)).toAddMonoidHom.range) × M × M)) ∧ Module.length ℤ_[p] M ≤ Module.length ℤ_[p] (C ⧸ Submodule.span ℤ_[p] ({κ} : Set C)) := by
  sorry

/- HeegnerPointEulerSystems:HE.6/gross-clean-mod-p-descent
Assume Gross’s classical standing hypotheses and non-CM E, p odd, Q(E[p])/Q has full GL₂(F_p) group, and y_K∉pE(K). Then Sel_p(E/K) is the cyclic F_p-space generated by δ(y_K), rank E(K)=1 and Sha(E/K)[p]=0. This clean theorem requires neither p∤N nor full p-adic surjectivity as an extra hypothesis; do not replace its hypothesis table with Howard’s.
Omitted conditions: the exact arithmetic object/field/level/local-condition
identifications and all source-qualified hypotheses in this node. The signature
expresses its indicated algebraic conclusion only; see the packet prototype gap. -/
theorem gross_clean_mod_p_descent (p : ℕ) [Fact p.Prime] {S Sha V : Type*} [AddCommGroup S] [AddCommGroup Sha] [AddCommGroup V] [Module (ZMod p) S] [Module ℚ V] (κ : S) : Submodule.span (ZMod p) ({κ} : Set S) = ⊤ ∧ Module.finrank ℚ V = 1 ∧ Subsingleton {x : Sha // p • x = 0} := by
  sorry

/- HeegnerPointEulerSystems:HE.6/gross-opposite-eigenspace-vanishing
Under Gross’s clean mod-p hypotheses, the ε-opposite Selmer eigenspace is zero. Choose a prime using the actual Kummer field M and positive component outside I. Its d(ℓ) is locally nonzero and supported only at λ; global reciprocity forces every Selmer class in that eigenspace to localize to zero. The Kummer-field annihilator calculation then forces the global eigenspace to vanish.
Omitted conditions: the exact arithmetic object/field/level/local-condition
identifications and all source-qualified hypotheses in this node. The signature
expresses its indicated algebraic conclusion only; see the packet prototype gap. -/
theorem gross_opposite_eigenspace_vanishing {C : Type*} [AddCommGroup C] (τ : C →+ C) (ε : ℤ) (opposite : AddSubgroup C) : ∀ x : opposite, (x : C) = 0 := by
  sorry

/- HeegnerPointEulerSystems:HE.6/gross-same-eigenspace-generation
Under the same clean hypotheses, the remaining Selmer eigenspace equals F_p·δ(y_K). If a second independent class existed, choose the first auxiliary prime with nonzero local Heegner derivative and form its Kummer extension L′. Prove L′ is disjoint from the Selmer field over L in the relevant character, then choose a second simultaneous Frobenius in the composite. The finite/singular relation and reciprocity force incompatible localizations, so the second class cannot exist.
Omitted conditions: the exact arithmetic object/field/level/local-condition
identifications and all source-qualified hypotheses in this node. The signature
expresses its indicated algebraic conclusion only; see the packet prototype gap. -/
theorem gross_same_eigenspace_generation (p : ℕ) [Fact p.Prime] {C : Type*} [AddCommGroup C] [Module (ZMod p) C] (same : Submodule (ZMod p) C) (bottom : C) : same = Submodule.span (ZMod p) ({bottom} : Set C) := by
  sorry

/- HeegnerPointEulerSystems:HE.6/sha-square-index-bound
Under HowardA with non-torsion y_K, the finite p-primary Sha group is the paired finite part of the discrete Selmer group. Thus length_Zp Sha[p∞]≤2·length_Zp(E(K)⊗Z_p/Z_py_K), after proving the exact integral Kummer-lattice identification. Equivalently its order divides the p-part of the square of the corresponding finite index. If a local or parametrization defect is present, insert its proved error term before this comparison.
Omitted conditions: the exact arithmetic object/field/level/local-condition
identifications and all source-qualified hypotheses in this node. The signature
expresses its indicated algebraic conclusion only; see the packet prototype gap. -/
theorem sha_square_index_bound (p : ℕ) [Fact p.Prime] {Sha Q : Type*} [AddCommGroup Sha] [AddCommGroup Q] [Module ℤ_[p] Sha] [Module ℤ_[p] Q] : Module.length ℤ_[p] Sha ≤ 2 * Module.length ℤ_[p] Q := by
  sorry

/- HeegnerPointEulerSystems:HE.6/primitivity-versus-nonzero
A nonzero κ_1 yields an upper bound, not equality. Residual primitivity of the actual corrected system, together with the imported ES5 core/self-duality/local hypotheses, gives the corresponding equality of finite length and corrected index. Scaling the parametrization/system by p preserves non-torsion but increases the leading-class index, so cannot preserve an unsupported sharpness assertion. Zhang’s indivisibility conclusion proves a stronger property only under its enumerated hypotheses.
Omitted conditions: the exact arithmetic object/field/level/local-condition
identifications and all source-qualified hypotheses in this node. The signature
expresses its indicated algebraic conclusion only; see the packet prototype gap. -/
theorem primitivity_versus_nonzero (p : ℕ) [Fact p.Prime] {M Q : Type*} [AddCommGroup M] [AddCommGroup Q] [Module ℤ_[p] M] [Module ℤ_[p] Q] : Module.length ℤ_[p] M = Module.length ℤ_[p] Q := by
  sorry

/- HeegnerPointEulerSystems:HE.6/zhang-cohomological-congruence
Let g,K,p satisfy Zhang’s Notations and Hypothesis♥, with m∈Λ′+ and distinct admissible q₁,q₂∤m. Fix the residual V over k₀, matched optimal embeddings and derivative generators. Then loc_q₁ c(n,m) lies in H¹(K_q₁,k₀) and loc_q₂ c(n,mq₁q₂) in H¹(K_q₂,k₀(1)); under fixed identifications with k₀ the two are equal up to a fixed nonzero scalar. The generic level-raising, definite/indefinite Jacquet–Langlands, multiplicity-one and Ihara statements are imported.
Omitted conditions: the exact arithmetic object/field/level/local-condition
identifications and all source-qualified hypotheses in this node. The signature
expresses its indicated algebraic conclusion only; see the packet prototype gap. -/
theorem zhang_cohomological_congruence (p : ℕ) [Fact p.Prime] (left right : ZMod p) : ∃ u : (ZMod p)ˣ, left = u * right := by
  sorry

/- HeegnerPointEulerSystems:HE.6/zhang-local-conditions-rank-lowering
Under Zhang Hypothesis♥, local Selmer conditions for g and its admissible level-raised g′ have k₀-rational structures agreeing away from q. At q they are the finite k₀ line and the singular k₀(1) line respectively. If loc_q on the rational residual Selmer group is nonzero, it is surjective and the raised Selmer group is its kernel, so its dimension decreases by one. Hypothesis♥(3) requires H¹(Q_ℓ,V)=V^GQℓ=0 at ℓ²|N+; for elliptic E and p≥5 the additive-reduction argument verifies this. Do not apply the ℓ≠p Euler characteristic formula at ℓ=p.
Omitted conditions: the exact arithmetic object/field/level/local-condition
identifications and all source-qualified hypotheses in this node. The signature
expresses its indicated algebraic conclusion only; see the packet prototype gap. -/
theorem zhang_local_conditions_rank_lowering {k C : Type*} [Field k] [AddCommGroup C] [Module k C] (before after : Submodule k C) (loc : C →ₗ[k] k) : after = before ⊓ loc.ker ∧ Module.finrank k before = Module.finrank k after + 1 := by
  sorry

/- HeegnerPointEulerSystems:HE.6/zhang-rank-zero-over-K
For a weight-two newform g and its GL₂-type A_g/Q with coefficient prime 𝔭|p≥3, K as in Zhang’s Notations, good ordinary p, residual image containing SL₂(F_p), and a residually ramified ℓ||N, L(g/K,1)≠0 iff Sel_𝔭∞(A_g/K) is finite. When finite, v_𝔭(L(g/K,1)/Ω_g^can)=length_O𝔭 Sel_𝔭∞(A_g/K)+Σ_{ℓ|N}t_g(ℓ). This is over A_g/K, not E/Q. Derive it using the separately imported ordinary main-conjecture and Kato divisibilities for g and its quadratic twist, with the GL₂-type control/period comparison.
Omitted conditions: the exact arithmetic object/field/level/local-condition
identifications and all source-qualified hypotheses in this node. The signature
expresses its indicated algebraic conclusion only; see the packet prototype gap. -/
theorem zhang_rank_zero_over_K (p : ℕ) [Fact p.Prime] {R S : Type*} [CommRing R] [AddCommGroup S] [Module R S] (normalizedValue : ℚ_[p]) (valuation : ℚ_[p] → ℕ∞) (tamagawaLength : ℕ∞) : (normalizedValue ≠ 0 ↔ Finite S) ∧ valuation normalizedValue = Module.length R S + tamagawaLength := by
  sorry

/- HeegnerPointEulerSystems:HE.6/zhang-jochnowitz-special-value
For g satisfying Hypothesis♥ and an admissible q, the Heegner bottom class is locally nonzero at q iff L^alg(g′/K,1) is a 𝔭′-adic unit. Here g′ is the chosen raised form, Ω_g′^can=〈g′,g′〉_Pet/η_g′(Nq), ξ_g′ is the norm of the integral primitive definite eigenfunction, η_g′,N+,N−q=η_g′(Nq)/ξ_g′, and L^alg=L/Ω^can·η_ratio⁻¹. Its integrality/unit status is proved by the explicit Waldspurger/Gross formula, not built into a definition.
Omitted conditions: the exact arithmetic object/field/level/local-condition
identifications and all source-qualified hypotheses in this node. The signature
expresses its indicated algebraic conclusion only; see the packet prototype gap. -/
theorem zhang_jochnowitz_special_value {R C : Type*} [CommRing R] [AddCommGroup C] (localClass : C) (normalizedValue : R) : localClass ≠ 0 ↔ IsUnit normalizedValue := by
  sorry

/- HeegnerPointEulerSystems:HE.6/ribet-takahashi-tamagawa-comparison
For definite g with N− squarefree of odd length and full Hypothesis♥, v_𝔭(η_g,N+,N−)=Σ_{ℓ|N−}length_O𝔭 Φ(A_g/K_ℓ)_𝔭. In the nonsquarefree case retain a nonempty residually ramified ℓ||N set and either a ramified ℓ||N− or at least two factors ℓ||N+. These are the precise period/Tamagawa conditions used to cancel the auxiliary form’s local terms. For additive split ℓ²|N+, use V^GKℓ=0 and the finite-residue cohomology argument to prove the component-group invariant vanishes; do not infer inertia invariants vanish from decomposition invariants.
Omitted conditions: the exact arithmetic object/field/level/local-condition
identifications and all source-qualified hypotheses in this node. The signature
expresses its indicated algebraic conclusion only; see the packet prototype gap. -/
theorem ribet_takahashi_tamagawa_comparison {R : Type*} [CommRing R] (periodRatio : R) (valuation : R → ℕ∞) (tamagawaLength : ℕ∞) : valuation periodRatio = tamagawaLength := by
  sorry

/- HeegnerPointEulerSystems:HE.6/zhang-triangular-selmer-basis
For a nonzero residual Heegner system κ_g satisfying Zhang Hypothesis♥, let ν=min{ν(n):c(n)≠0}, ε_ν=w_g(−1)^ν+1 and B(κ) its base locus of vanishing localizations away from DKNp. The ε_ν Selmer eigenspace has dimension ν+1 and a triangular basis of ν+1 actual c(n_i), detected at selected 2ν+1 auxiliary primes. The opposite eigenspace has dimension ≤ν. Relaxing at the base locus does not enlarge the first eigenspace and preserves that opposite bound.
Omitted conditions: the exact arithmetic object/field/level/local-condition
identifications and all source-qualified hypotheses in this node. The signature
expresses its indicated algebraic conclusion only; see the packet prototype gap. -/
theorem zhang_triangular_selmer_basis {k C : Type*} [Field k] [AddCommGroup C] [Module k C] (same opposite : Submodule k C) (ν : ℕ) : Module.finrank k same = ν + 1 ∧ Module.finrank k opposite ≤ ν := by
  sorry

/- HeegnerPointEulerSystems:HE.6/zhang-indivisibility
Assume E/Q conductor N, K imaginary quadratic with gcd(D_K,N)=1, N− squarefree with even number of prime factors, full residual GL₂(F_p) image, p≥5 good ordinary and p∤D_KN. Hypothesis♠ requires residual ramification at every ℓ||N+ and every ℓ|N− with ℓ≡±1 mod p; if N is nonsquarefree require a nonempty Ram set and either a ramified ℓ||N− or at least two factors ℓ||N+. Then c_1(n)≠0 for some squarefree Kolyvagin conductor n, so M∞=0. For the auxiliary GL₂-type forms use the stronger Hypothesis♥, including the additive-prime local invariant vanishing.
Omitted conditions: the exact arithmetic object/field/level/local-condition
identifications and all source-qualified hypotheses in this node. The signature
expresses its indicated algebraic conclusion only; see the packet prototype gap. -/
theorem zhang_indivisibility {C : Type*} [Zero C] (classes : ℕ → C) : ∃ n, classes n ≠ 0 := by
  sorry

/- HeegnerPointEulerSystems:HE.7/non-torsion-point-prime-divisibility
For non-torsion y_K∈E(K), Mordell–Weil finite generation implies y_K∉pE(K) for every prime outside a finite set. This is proved before assuming rank one or a finite Heegner index: project to the free Mordell–Weil quotient and use a nonzero coordinate. Once rank one has been proved, the index of Z·y_K in the free quotient is finite; it is distinct from an index in E(K) that includes rational torsion.
Omitted conditions: the exact arithmetic object/field/level/local-condition
identifications and all source-qualified hypotheses in this node. The signature
expresses its indicated algebraic conclusion only; see the packet prototype gap. -/
theorem non_torsion_point_prime_divisibility {M : Type*} [AddCommGroup M] (y : M) : ∃ excluded : Finset ℕ, ∀ p : ℕ, p.Prime → p ∉ excluded → ¬ ∃ z : M, p • z = y := by
  sorry

/- HeegnerPointEulerSystems:HE.7/non-cm-open-image-application
For non-CM E/Q, import Serre’s open-image theorem to conclude that Q(E[p])/Q has full GL₂(F_p) image for all but finitely many p, and apply it to the actual Heegner setting. More generally obtain the required uniform cohomological restriction/invariant bounds from the open adelic/Tate image over a number field, retaining the cyclotomic determinant and base-field index. For admissible GL₂-type RM quotients import the precise Ribet big-image variant; do not replan either generic theorem in HE.7.
Omitted conditions: the exact arithmetic object/field/level/local-condition
identifications and all source-qualified hypotheses in this node. The signature
expresses its indicated algebraic conclusion only; see the packet prototype gap. -/
theorem non_cm_open_image_application {G : Type*} (image : ℕ → Set G) : ∃ excluded : Finset ℕ, ∀ p : ℕ, p.Prime → p ∉ excluded → image p = Set.univ := by
  sorry

/- HeegnerPointEulerSystems:HE.7/almost-all-primary-sha-vanishing
For the classical non-CM non-torsion Heegner setting, outside a finite set of primes the Gross clean theorem gives Sha(E/K)[p]=0. Since Sha is torsion, this implies Sha(E/K)[p∞]=0: any nonzero p-primary element would yield nonzero p-torsion after taking a suitable p-power multiple. This does not require proving finite p-primary groups first.
Omitted conditions: the exact arithmetic object/field/level/local-condition
identifications and all source-qualified hypotheses in this node. The signature
expresses its indicated algebraic conclusion only; see the packet prototype gap. -/
theorem almost_all_primary_sha_vanishing {Sha : Type*} [AddCommGroup Sha] : ∃ excluded : Finset ℕ, ∀ p : ℕ, p.Prime → p ∉ excluded → ∀ m : ℕ, ∀ x : Sha, p ^ m • x = 0 → x = 0 := by
  sorry

/- HeegnerPointEulerSystems:HE.7/bounded-arithmetic-derivative-denominators
For the actual classical ring-class tower, prove the bounded-denominator derivative construction at each exceptional p, retaining nonzero restriction/inflation kernels, torsion invariants, unit factors, local component and parametrization/Hodge denominators. Its annihilator constants must be uniform in the finite torsion exponent m. Bound the bad-reduction and fixed parametrization contributions by a fixed nonzero integer, rather than increasing an unexplained denominator with m. ES3/4 supplies the general error-tolerant construction; HE.7 must supply these arithmetic bounds.
Omitted conditions: the exact arithmetic object/field/level/local-condition
identifications and all source-qualified hypotheses in this node. The signature
expresses its indicated algebraic conclusion only; see the packet prototype gap. -/
theorem bounded_arithmetic_derivative_denominators {C : Type*} [AddCommGroup C] (errors : ℕ → AddSubgroup C) : ∃ d : ℕ, 0 < d ∧ ∀ m : ℕ, ∀ x : errors m, d • (x : C) = 0 := by
  sorry

/- HeegnerPointEulerSystems:HE.7/dyadic-integral-conjugation-descent
At p=2 in the actual Heegner setting, use restriction/corestriction, integral 1±τ maps and real-place Tate cohomology to bound the invariant and local-condition errors uniformly in m. Keep the kernels/cokernels of the integral maps; do not split the Z₂ module by (1±τ)/2. Combine these bounds with the actual bounded-denominator derivative classes and the general ES4 descent engine.
Omitted conditions: the exact arithmetic object/field/level/local-condition
identifications and all source-qualified hypotheses in this node. The signature
expresses its indicated algebraic conclusion only; see the packet prototype gap. -/
theorem dyadic_integral_conjugation_descent {C : Type*} [AddCommGroup C] (errors : ℕ → AddSubgroup C) : ∃ b : ℕ, ∀ m : ℕ, ∀ x : errors m, (2 ^ b : ℕ) • (x : C) = 0 := by
  sorry

/- HeegnerPointEulerSystems:HE.7/cm-character-error-descent
For CM E in the exact classical modular Heegner setting, pass to a base containing the CM field and use the imported CM character/Tate decomposition to prove the actual restriction, local and derivative error bounds uniformly in m. Descend back with the explicit base-extension degree and real/dyadic corrections. The non-CM GL₂-image theorem cannot be applied to this branch.
Omitted conditions: the exact arithmetic object/field/level/local-condition
identifications and all source-qualified hypotheses in this node. The signature
expresses its indicated algebraic conclusion only; see the packet prototype gap. -/
theorem cm_character_error_descent {C : Type*} [AddCommGroup C] (errors : ℕ → AddSubgroup C) : ∃ d : ℕ, 0 < d ∧ ∀ m : ℕ, ∀ x : errors m, d • (x : C) = 0 := by
  sorry

/- HeegnerPointEulerSystems:HE.7/exceptional-primary-sha-bound
For each remaining exceptional p, after proving its uniform arithmetic error constants, apply ES4 to obtain a fixed bound p^b annihilating Sha(E/K)[p∞], with b depending on the finite Heegner index and proved arithmetic constants. The finite p^b-Selmer group then contains the p-primary Sha quotient and proves it finite. Uniformity in m is required before passing to p∞; separate finiteness of each Sha[p^m] is insufficient.
Omitted conditions: the exact arithmetic object/field/level/local-condition
identifications and all source-qualified hypotheses in this node. The signature
expresses its indicated algebraic conclusion only; see the packet prototype gap. -/
theorem exceptional_primary_sha_bound {Sha : Type*} [AddCommGroup Sha] (p : ℕ) : ∃ b : ℕ, ∀ m : ℕ, ∀ x : Sha, p ^ m • x = 0 → p ^ b • x = 0 := by
  sorry

/- HeegnerPointEulerSystems:HE.7/classical-full-sha-finiteness
In Gross’s stated classical modular Heegner setting, if y_K has infinite order, rank E(K)=1 and the entire Sha(E/K) is finite. In the formulation Gross quotes, its order divides t_E/K·I_K², where the positive integer t_E/K has prime factors only 2 and odd exceptional residual-image primes. Do not assign an explicit value to t from the clean theorem. To prove full finiteness combine almost-all p-primary vanishing with finite exceptional p-primary groups and the torsion-primary decomposition; finiteness at one or every separately considered prime is not enough.
Omitted conditions: the exact arithmetic object/field/level/local-condition
identifications and all source-qualified hypotheses in this node. The signature
expresses its indicated algebraic conclusion only; see the packet prototype gap. -/
theorem classical_full_sha_finiteness {V Sha : Type*} [AddCommGroup V] [Module ℚ V] [AddCommGroup Sha] : Module.finrank ℚ V = 1 ∧ Finite Sha := by
  sorry

/- HeegnerPointEulerSystems:HE.7/admissible-rm-kolyvagin-logachev
Let A/Q be a simple admissible RM quotient of J₀(N), End_Q(A)⊗Q totally real of degree dim A=d, with the specified Heegner modular quotient and analytic rank d. The appropriate higher Gross–Zagier height nonvanishing and Kolyvagin–Logachev descent give rank A(K)=d and finite entire Sha(A/K), under the exact arithmetic/local hypotheses of that theorem. Quaternionic/RM variants require the named field, level, integral quotient and Hecke compatibility and a source that establishes that extension; no unrestricted statement for all abelian varieties over all totally real fields is intended.
Omitted conditions: the exact arithmetic object/field/level/local-condition
identifications and all source-qualified hypotheses in this node. The signature
expresses its indicated algebraic conclusion only; see the packet prototype gap. -/
theorem admissible_rm_kolyvagin_logachev {V Sha : Type*} [AddCommGroup V] [Module ℚ V] [AddCommGroup Sha] (d : ℕ) : Module.finrank ℚ V = d ∧ Finite Sha := by
  sorry

/- HeegnerPointEulerSystems:HE.6/heegner-vanishing-order
For the actual residual Heegner family indexed by Λ, the vanishing order is
its minimum number of distinct conductor primes, with empty support valued ∞.
Omitted: arithmetic identification of Λ and the residual cohomology family. -/
def vanishingOrder {C : Type*} [Zero C] (Λ : Set ℕ) (κ : ℕ → C) : ℕ∞ := by
  sorry

theorem vanishingOrder_formula {C : Type*} [Zero C] (Λ : Set ℕ) (κ : ℕ → C) :
    vanishingOrder Λ κ = sInf {v : ℕ∞ | ∃ n ∈ Λ, κ n ≠ 0 ∧
      v = (n.primeFactorsList.toFinset.card : ℕ∞)} := by
  sorry

theorem vanishingOrder_bottom {C : Type*} [Zero C] (Λ : Set ℕ) (κ : ℕ → C)
    (h₁ : 1 ∈ Λ) (hκ : κ 1 ≠ 0) : vanishingOrder Λ κ = 0 := by
  sorry

theorem vanishingOrder_support_congr {C C' : Type*} [Zero C] [Zero C']
    (Λ : Set ℕ) (κ : ℕ → C) (κ' : ℕ → C')
    (h : ∀ n ∈ Λ, κ n ≠ 0 ↔ κ' n ≠ 0) :
    vanishingOrder Λ κ = vanishingOrder Λ κ' := by
  sorry

-- TauCeti.Heegner.vanishingOrder_empty: empty conductor support has value ∞.
example {C : Type*} [Zero C] (κ : ℕ → C) :
    vanishingOrder (∅ : Set ℕ) κ = ⊤ := by
  sorry

-- TauCeti.Heegner.vanishingOrder_bottom_nonzero: the conductor-one class is nonzero.
example : vanishingOrder ({1} : Set ℕ) (fun _ => (1 : ℤ)) = 0 := by
  sorry

-- TauCeti.Heegner.vanishingOrder_conductor_six: 6 has two distinct prime divisors.
example : vanishingOrder ({6} : Set ℕ) (fun _ => (1 : ℤ)) = 2 := by
  sorry

/- HeegnerPointEulerSystems:HE.6/heegner-base-locus
The base locus consists of primes outside D_K N p at which every class in Λ
has zero localization. Local carriers depend on the prime. Omitted: their
identification with the actual residual continuous cohomology/localization. -/
def baseLocus {C : Type*} [AddCommGroup C] {L : ℕ → Type*}
    [∀ ℓ, AddCommGroup (L ℓ)] (D N p : ℕ) (Λ : Set ℕ)
    (loc : (ℓ : ℕ) → C →+ L ℓ) (κ : ℕ → C) : Set ℕ := by
  sorry

theorem baseLocus_mem {C : Type*} [AddCommGroup C] {L : ℕ → Type*}
    [∀ ℓ, AddCommGroup (L ℓ)] (D N p : ℕ) (Λ : Set ℕ)
    (loc : (ℓ : ℕ) → C →+ L ℓ) (κ : ℕ → C) (ℓ : ℕ) :
    ℓ ∈ baseLocus D N p Λ loc κ ↔
      ℓ.Prime ∧ ¬ ℓ ∣ D * N * p ∧ ∀ n ∈ Λ, loc ℓ (κ n) = 0 := by
  sorry

theorem baseLocus_support_congr {C : Type*} [AddCommGroup C] {L : ℕ → Type*}
    [∀ ℓ, AddCommGroup (L ℓ)] (D N p : ℕ) (Λ : Set ℕ)
    (loc : (ℓ : ℕ) → C →+ L ℓ) (κ κ' : ℕ → C)
    (h : ∀ ℓ, ℓ.Prime → ¬ ℓ ∣ D * N * p →
      ∀ n ∈ Λ, loc ℓ (κ n) = loc ℓ (κ' n)) :
    baseLocus D N p Λ loc κ = baseLocus D N p Λ loc κ' := by
  sorry

theorem baseLocus_zero {C : Type*} [AddCommGroup C] {L : ℕ → Type*}
    [∀ ℓ, AddCommGroup (L ℓ)] (D N p : ℕ) (Λ : Set ℕ)
    (loc : (ℓ : ℕ) → C →+ L ℓ) :
    baseLocus D N p Λ loc (fun _ => (0 : C)) =
      {ℓ | ℓ.Prime ∧ ¬ ℓ ∣ D * N * p} := by
  sorry

-- TauCeti.Heegner.baseLocus_zero_system: zero classes vanish at all good primes.
example {C : Type*} [AddCommGroup C] {L : ℕ → Type*}
    [∀ ℓ, AddCommGroup (L ℓ)] (D N p ℓ : ℕ) (Λ : Set ℕ)
    (loc : (ℓ : ℕ) → C →+ L ℓ) :
    ℓ ∈ baseLocus D N p Λ loc (fun _ => (0 : C)) ↔
      ℓ.Prime ∧ ¬ ℓ ∣ D * N * p := by
  sorry

-- TauCeti.Heegner.baseLocus_nonzero_localization: one nonzero value excludes ℓ.
example {C : Type*} [AddCommGroup C] {L : ℕ → Type*}
    [∀ ℓ, AddCommGroup (L ℓ)] (D N p ℓ n : ℕ) (Λ : Set ℕ)
    (loc : (ℓ : ℕ) → C →+ L ℓ) (κ : ℕ → C)
    (hn : n ∈ Λ) (h : loc ℓ (κ n) ≠ 0) : ℓ ∉ baseLocus D N p Λ loc κ := by
  sorry

-- TauCeti.Heegner.baseLocus_coefficient_prime: 5 is excluded even for a zero family.
example {C : Type*} [AddCommGroup C] {L : ℕ → Type*}
    [∀ ℓ, AddCommGroup (L ℓ)] (D N : ℕ) (Λ : Set ℕ)
    (loc : (ℓ : ℕ) → C →+ L ℓ) :
    5 ∉ baseLocus D N 5 Λ loc (fun _ => (0 : C)) := by
  sorry

end TauCeti.Heegner
