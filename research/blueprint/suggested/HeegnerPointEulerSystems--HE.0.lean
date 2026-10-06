/-
This file is not the roadmap and is not exhaustive. The roadmap document is definitive.
These statements suggest Lean forms so contributors and reviewers converge on names
and signatures. Every admission is a prototype, not an implementation.
The arithmetic source hypotheses and carrier identifications listed in comments
remain omitted where the pinned supplier APIs cannot express them (protocol §13).
Read these as arithmetic signature prototypes under those hypotheses. The packet
and reader contain the complete statements, not implementation claims. The prior
independent review is preserved; this revision awaits a new review.

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
import Mathlib.GroupTheory.SpecificGroups.Dihedral

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
Prototype boundary: The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement. -/
theorem local_toral_order {K : Type*} [CommRing K] (Λ : Subring K) (orders : ℕ → Subring K) : ∃ n, Λ = orders n := by
  sorry

/- HeegnerPointEulerSystems:HE.0/transported-global-order
For a rational quadratic embedding E↪B and a restricted adelic g, Λ=E∩∏_v Λ_v is a finite-index Z-order in O_E, with Λ⊗Z_v≃Λ_v. Its Picard group is the existing CommRing.Pic Λ, equivalently ClassGroup Λ; only invertible proper fractional ideals occur.
Prototype boundary: The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement. -/
theorem transported_global_order {K L : Type*} [CommRing K] [CommRing L] (Λ : Subring K) (Λv : Subring L) (localize : Subring K → Subring L) : localize Λ = Λv := by
  sorry

/- HeegnerPointEulerSystems:HE.0/idele-ideal-class-comparison
For the imaginary quadratic transported order Λ, map a finite invertible idele t to the locally principal fractional ideal E∩t∏_v Λ_v. This induces the ordinary finite idele-class quotient the left quotient of A_E,f× by E× and the right quotient by Λ̂×≃Pic Λ and the S={∞} toral packet quotient C_S≃Pic Λ. The torus covering E×→E×/Q× is used explicitly; kernel triviality uses the class number one of Q.
Prototype boundary: The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement. -/
theorem idele_ideal_class_comparison {O G : Type*} [CommRing O] [CommGroup G] : Nonempty (G ≃* CommRing.Pic O) := by
  sorry

/- HeegnerPointEulerSystems:HE.0/conductor-change-kernel
Let K/Q be imaginary quadratic, c≥1 and ℓ prime. Extension of invertible ideals gives Pic(O_cℓ)→Pic(O_c), surjectively. If ℓ∤c, its kernel is (O_c/ℓO_c)×/((Z/ℓZ)×·image(O_c×)); thus u_c,ℓ·#ker=ℓ−χ_K(ℓ), where u_c,ℓ=[O_c×:O_cℓ×]. If ℓ|c, u_c,ℓ·#ker=ℓ. χ takes −1,0,1 in inert, ramified, split cases. Every quotient and map is induced by the actual inclusions of orders.
Prototype boundary: The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement. -/
theorem conductor_change_kernel {O O' : Type*} [CommRing O] [CommRing O'] (f : CommRing.Pic O' →* CommRing.Pic O) (ℓ u : ℕ) (χ : ℤ) : Function.Surjective f ∧ (u : ℤ) * (Nat.card f.ker : ℤ) = (ℓ : ℤ) - χ := by
  sorry

/- HeegnerPointEulerSystems:HE.0/ring-class-tower-quotients
Using the ring-class existence theorem imported from CFT13, realize every K[c] in a fixed separable closure of K. For c|d, O_d⊂O_c gives K[c]⊂K[d] and restriction Gal(K[d]/K)→Gal(K[c]/K), compatible under composition and with ideal extension under Artin. Its kernel is Gal(K[d]/K[c]), and [K[cℓ]:K[c]] equals the kernel cardinal computed in conductor-change-kernel. Splitting of a prime away from the conductor is equivalent to its invertible ideal class being trivial; K[c]/K is unramified outside c and the exact local ramification is supplied by local unit reciprocity.
Prototype boundary: The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement. -/
theorem ring_class_tower_quotients {G H : Type*} [Group G] [Group H] (restriction : G →* H) (degree : ℕ) : Function.Surjective restriction ∧ Nat.card restriction.ker = degree := by
  sorry

/- HeegnerPointEulerSystems:HE.0/dihedral-conjugation
For imaginary quadratic K/Q, K[c]/Q is Galois and a chosen complex conjugation τ satisfies τστ⁻¹=σ⁻¹ for σ∈Gal(K[c]/K). The conjugation is attached to an archimedean embedding and compatible throughout the tower. Do not equip a general ring class field with IsCMField: it need not be a CM field.
Prototype boundary: The suggested signature transports the existing DihedralGroup rotation/reflection identity through a supplied homomorphism into the arithmetic group. It is the cyclic-quotient component of the tower action. The class-field identification and general abelian-class-group inversion remain omitted supplier conditions; no arbitrary group elements are asserted to satisfy the identity. -/
theorem dihedral_conjugation {G : Type*} [Group G] (n : ℕ)
    (f : DihedralGroup n →* G) (i : ZMod n) :
    f (DihedralGroup.sr 0) * f (DihedralGroup.r i) * (f (DihedralGroup.sr 0))⁻¹ =
      (f (DihedralGroup.r i))⁻¹ := by
  sorry

/- HeegnerPointEulerSystems:HE.0/relative-cm-conductor-tower
Let F be totally real, K/F totally imaginary quadratic and P a finite prime of F of residue characteristic p. The imported orders O_Pn=O_F+PⁿO_K and class fields K[Pⁿ] have a compatible Galois inverse limit G∞. The finite idele/unit quotient realizes this limit; G∞ has finite torsion subgroup G0 and G∞/G0≃Z_p^[F_P:Q_p]. For sufficiently large n, [K[Pⁿ⁺¹]:K[Pⁿ]]=N(P), with the finite initial global-unit indices retained. The admissible level subgroup is the intersection with the specified quaternionic level, not an arbitrary replacement.
Prototype boundary: The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement. -/
theorem relative_cm_conductor_tower (degrees : ℕ → ℕ) (residueCard : ℕ) : ∃ n₀, ∀ n, n₀ ≤ n → degrees n = residueCard := by
  sorry

/- HeegnerPointEulerSystems:HE.0/norm-reciprocity-level-compatibility
For the relative CM towers and an inclusion of admissible finite-level subgroups, field restriction, finite idele quotient projection and order ideal extension commute under Artin. For a finite extension of CM bases, field norm and ideal norm agree with the imported functorial Artin map on the relevant finite quotient. Cornut–Vatsal uses geometric Frobenius: the arithmetic-Frobenius version in this packet inverts the reciprocity/Frobenius arguments before using any pointwise identity.
Prototype boundary: The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement. -/
theorem norm_reciprocity_level_compatibility {A B C D : Type*} (norm : A → B) (recA : A → C) (recB : B → D) (restriction : C → D) : recB ∘ norm = restriction ∘ recA := by
  sorry

/- HeegnerPointEulerSystems:HE.0/local-different-discriminant
For the local quadratic étale order Λ_v, define its trace dual Λ_v∨={a∈E_v:Tr(aΛ_v)⊆Z_v} using the imported lattice/trace pairing. Its inverse different is a principal invertible fractional Λ_v-ideal; the different is its inverse. The ideal norm (equivalently the absolute local discriminant valuation) agrees with the order discriminant. This does not identify the signed field norm of a generator with a positive discriminant; in a split conductor-π order a generator (π,−π) has norm −π².
Prototype boundary: The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement. -/
theorem local_different_discriminant {K : Type*} [CommRing K] (different : Ideal K) : different.IsPrincipal := by
  sorry

/- HeegnerPointEulerSystems:HE.1/cm-cyclic-isogeny-pair
Assume K imaginary quadratic of discriminant different from −3,−4, N≥1 with every prime dividing N split, c prime to N, and an invertible O_c-ideal 𝔑_c with O_c/𝔑_c≃Z/NZ. For a proper invertible fractional ideal a, the pair C/a→C/(𝔑_c⁻¹a) is cyclic of degree N and gives the corresponding existing X₀(N) moduli point. The endomorphism ring is O_c; replacing a by αa gives the same level pair. Changing 𝔑 or its orientation is an explicitly recorded Galois/Fricke action, not literal equality.
Prototype boundary: The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement. -/
theorem cm_cyclic_isogeny_pair {F : Type*} [Field F] (W : WeierstrassCurve.Affine F) (kernel : AddSubgroup W.Point) (N : ℕ) : Nat.card kernel = N := by
  sorry

/- HeegnerPointEulerSystems:HE.1/optimal-embedding-cm-points
For F totally real, K/F CM, B ramified at all but one real place and specified finite places, and Eichler order R, an optimal embedding O_C↪R is an F-algebra embedding K↪B satisfying K∩R=O_C. K splits B iff K_v is a field at every ramified finite place (and the archimedean embedding condition holds). The CM double-coset description K×\B̂×/R̂× with a specified archimedean CM type identifies the complex CM points, with local optimal-embedding conditions required by the chosen Eichler level. It has not yet asserted rationality.
Prototype boundary: The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement. -/
theorem optimal_embedding_cm_points {K B : Type*} [Field K] [Ring B] (ι : K →+* B) (O : Subring K) (R : Subring B) : R.comap ι = O := by
  sorry

/- HeegnerPointEulerSystems:HE.1/canonical-model-cm-descent
For the CM level points above, the imported main CM theorem/canonical model reciprocity shows x_C∈X(K[C]) in the actual HE.0 tower. Its stabilizer is K× times the intersection of the finite torus with the chosen level; σ=rec_K(t) acts by x(g)↦x(t^εg) in Cornut–Vatsal’s geometric convention. Convert to arithmetic reciprocity with the inverse convention before comparison. The statement concerns the cyclic-isogeny pair or optimal embedding, not only j(E).
Prototype boundary: The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement. -/
theorem canonical_model_cm_descent {F L : Type*} [Field F] [Field L] (W : WeierstrassCurve.Affine F) (W' : WeierstrassCurve.Affine L) (baseChange : W.Point → W'.Point) (P : W'.Point) : ∃ Q, baseChange Q = P := by
  sorry

/- HeegnerPointEulerSystems:HE.1/jacobian-basepoint-denominators
For X₀(N) use the rational cusp ∞ to form [x−∞]. For a compact quaternionic curve use the imported normalized rational Hodge class ξ=(K_X+B_X)/deg(K_X+B_X), componentwise of degree one; x↦[x−ξ] lies in J⊗Q. Choose a nonzero integer d clearing the denominators to obtain the integral class [d x−d ξ]. Do not erase d. For an auxiliary ℓ₀, (ℓ₀+1−Tℓ₀)x is degree zero; after quotienting by an eigenform g, division by ℓ₀+1−aℓ₀ is valid integrally at p only if it is a p-adic unit.
Prototype boundary: The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement. -/
theorem jacobian_basepoint_denominators {J : Type*} [AddCommGroup J] [Module ℚ J] (degree : J →ₗ[ℚ] ℚ) (ξ : J) : degree ξ = 1 := by
  sorry

/- HeegnerPointEulerSystems:HE.1/parameter-choice-and-degree
For the fixed Heegner family, ideal-class translation gives the corresponding Galois translation; a Fricke/orientation change acts by the recorded eigenvalue and rational cusp-torsion translation. Multiplying the modular parametrization or clearing Hodge denominators scales P_c and the bottom trace by that integer. For Gross’s rational optimal curve, φ*ω_E=c_φ·(2πif(z)dz), with positive integral Manin constant c_φ; the index I_K/c_φ is invariant under the appropriate isogeny change, not I_K alone.
Prototype boundary: The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement. -/
theorem parameter_choice_and_degree {F : Type*} [Field F] (W : WeierstrassCurve.Affine F) (P Q torsionTranslation : W.Point) (u : ℤ) : Q = u • P + torsionTranslation := by
  sorry

/- HeegnerPointEulerSystems:HE.2/cm-hecke-conductor-classification
At a finite prime P where B is split and the Eichler level is maximal, let ε_P=−1,0,1 for inert, ramified, split K/F. A level-zero CM lattice has 1+ε_P horizontal neighbors and N(P)−ε_P ascending neighbors of conductor P. At positive conductor n it has one predecessor of conductor n−1 and N(P) ascending neighbors of conductor n+1. The ascending set is a torsor for O_n×/O_n+1×. Global unit stabilizers must be divided out when converting this local sum into a field trace.
Prototype boundary: The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement. -/
theorem cm_hecke_conductor_classification (q horizontal ascending : ℕ) (ε : ℤ) : (horizontal : ℤ) = 1 + ε ∧ (ascending : ℤ) = (q : ℤ) - ε := by
  sorry

/- HeegnerPointEulerSystems:HE.2/norm-relation-and-reduction-congruence
Under the classical Heegner hypothesis, ℓ prime with ℓ∤cN and inert in K, the compatible cusp-normalized family satisfies u_c,ℓ·Tr_{K[cℓ]/K[c]}P_cℓ=a_ℓP_c. With ordinary units u=1 this is the Gross/Howard equality. For a d-cleared Hodge family, first prove that the chosen basepoint is a Hecke eigenclass and transport the divisor relation; retain any integral torsion difference if only a rational eigenclass identity is known.
Prototype boundary: The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement. -/
theorem norm_relation_and_reduction_congruence {F : Type*} [Field F] (W : WeierstrassCurve.Affine F) (P : W.Point) (trace : W.Point) (u : ℕ) (aℓ : ℤ) : u • trace = aℓ • P := by
  sorry

/- HeegnerPointEulerSystems:HE.2/split-ramified-first-step-recurrence
For ℓ∤cN, the local divisor trace with u_c,ℓ retained equals T_ℓx_c−(σ_ℓ+σ_ℓbar)x_c in the split case and T_ℓx_c−σ_ℓx_c in the ramified case. Here Frobenius on the lower-conductor field is unramified at ℓ; the ramified case refers to K/Q ramification, not ramification of K[c]/K away from c. Use the specified reciprocity convention. After the fixed eigenquotient replace T_ℓ by a_ℓ only with the exact Jacobian basepoint corrections.
Prototype boundary: The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement. -/
theorem split_ramified_first_step_recurrence {F : Type*} [Field F] (W : WeierstrassCurve.Affine F) (P trace : W.Point) (u : ℕ) (aℓ : ℤ) (horizontal : W.Point) : u • trace = aℓ • P - horizontal := by
  sorry

/- HeegnerPointEulerSystems:HE.2/repeated-conductor-predecessor-recurrence
At maximal local quaternionic level and conductor exponent n≥2, the local unit trace of a CM point x of conductor n is T_P^lower(pr^upper x)−pr^lower(pr^upper x). On a coherent chosen chain this gives the repeated-conductor recurrence, with predecessor and central scaling specified. Passing to the global field trace divides the orbit by the actual global-unit stabilizer; it must not simply copy the first-step inert ℓ+1 formula.
Prototype boundary: The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement. -/
theorem repeated_conductor_predecessor_recurrence {M : Type*} [AddCommGroup M] (trace predecessor secondPredecessor : M) (hecke : M →+ M) : trace = hecke predecessor - secondPredecessor := by
  sorry

/- HeegnerPointEulerSystems:HE.2/nonmaximal-level-distribution
For a prime P with Eichler level exponent δ=1, orient the lattice pair and its type I/II. For conductor ≥2, its unit trace equals the appropriate upper/lower Hecke operator on its predecessor and becomes −pr(x) in the P-new quotient. For δ≥2, type I/II points have zero trace in the P-new quotient; type III is excluded. Reversing the orientation exchanges types I and II. These are divisor-module statements before any abelian quotient.
Prototype boundary: The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement. -/
theorem nonmaximal_level_distribution {M : Type*} [AddCommGroup M] (trace predecessor : M) : trace = -predecessor := by
  sorry

/- HeegnerPointEulerSystems:HE.2/inert-reduction-frobenius-congruence
For the classical compatible family, ℓ∤cND inert, choose compatible primes λ_cℓ|λ_c over ℓ and the actual good-reduction specialization maps. Then red_λcℓ(P_cℓ)=Frob_λc(red_λc(P_c)) after the specified residue-field identifications; Frobenius is the ℓ-power geometric endomorphism on the reduction of the modular/elliptic curve as fixed in Gross’s convention. State separately the Artin arithmetic-Frobenius conversion. This is pointwise, not merely an equality of traces.
Prototype boundary: The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement. -/
theorem inert_reduction_frobenius_congruence {F k : Type*} [Field F] [Field k] (W : WeierstrassCurve.Affine F) (Wk : WeierstrassCurve.Affine k) (red : W.Point → Wk.Point) (frobenius : Wk.Point → Wk.Point) (P Pℓ : W.Point) : red Pℓ = frobenius (red P) := by
  sorry

/- HeegnerPointEulerSystems:HE.2/quaternionic-reduction-specialization
For Zhang’s m∈Λ′+ and an admissible q∤m, reduction of x_m(n) at q is x_mq(n) in the definite Shimura set, using the matched optimal embedding and supersingular identification. For q|m, specialization is x_m/q(n) on the chosen vertex copy of the semistable reduction graph. Both formulas require the same CM/basepoint identifications and q splitting completely in the fields of definition used.
Prototype boundary: The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement. -/
theorem quaternionic_reduction_specialization {X Xq : Type*} (reduction : X → Xq) (x : ℕ → X) (xq : ℕ → Xq) (n : ℕ) : reduction (x n) = xq n := by
  sorry

/- HeegnerPointEulerSystems:HE.3/kummer-classes-and-the-modified-selmer-conditions
Apply the imported finite Kummer injection E(K[c])/p^mE(K[c])→H¹_cont(K[c],E[p^m]) to P_c. Apply the imported p-adic Kummer map to the compatible p-completion to obtain the integral T_pE class. The finite classes are its actual coefficient reductions, and restriction/corestriction commute with the field maps/point trace, including all trace/unit constants from HE.2. The Tate module has its inverse-limit topology and finite torsion coefficients their discrete topology.
Prototype boundary: The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement. -/
theorem kummer_classes_and_the_modified_selmer_conditions {M C C' : Type*} [AddCommGroup M] [AddCommGroup C] [AddCommGroup C'] (kummer : M →+ C) (kummer' : M →+ C') (reduction : C →+ C') : reduction.comp kummer = kummer' := by
  sorry

/- HeegnerPointEulerSystems:HE.3/good-place-kummer-unramified
For ℓ≠p of good reduction, the finite Kummer image E(K_v)/p^m agrees with H¹_unr(K_v,E[p^m]); in particular P_c’s Kummer class is unramified at such v, after transfer to the relevant field. The proof uses the Néron model and unramified torsion, not a claim that all local cohomology is unramified.
Prototype boundary: The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement. -/
theorem good_place_kummer_unramified {M C : Type*} [AddCommGroup M] [AddCommGroup C] (kummer : M →+ C) (unramified : AddSubgroup C) : kummer.range = unramified := by
  sorry

/- HeegnerPointEulerSystems:HE.3/bad-place-component-obstruction
For finite v∤p, compare the local point Kummer image with the propagated rational unramified condition. The discrepancy factors through the p-primary component group of the Néron model, together with the precise local invariants/quotient torsion terms. Equality requires the appropriate obstruction to vanish; residual irreducibility alone does not remove it. For Gross’s derived d(n), the cusp-divisor and connected-Néron-model argument proves local triviality away from n even at primes dividing N.
Prototype boundary: The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement. -/
theorem bad_place_component_obstruction {M C Φ : Type*} [AddCommGroup M] [AddCommGroup C] [AddCommGroup Φ] (kummerDefect : M →+ C) (component : M →+ Φ) : ∃ obstruction : Φ →+ C, kummerDefect = obstruction.comp component := by
  sorry

/- HeegnerPointEulerSystems:HE.3/coefficient-prime-local-condition
At v|p with good reduction, the actual Kummer class of P_c satisfies the finite/crystalline rational condition and its integral propagated Kummer condition. In the good ordinary branch compare with the Greenberg filtration only under the exact ordinary/crystalline comparison hypotheses and retain local-torsion error terms. A rational equality after tensoring with Q_p is not an equality of integral lattices.
Prototype boundary: The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement. -/
theorem coefficient_prime_local_condition {M C : Type*} [AddCommGroup M] [AddCommGroup C] (kummer : M →+ C) (finiteCondition : AddSubgroup C) (P : M) : kummer P ∈ finiteCondition := by
  sorry

/- HeegnerPointEulerSystems:HE.3/saturated-integral-kummer-lattice
Compare the actual finite/p-adic Heegner Kummer classes in the Selmer lattice with E(K)⊗Z_p, V_pE, and E[p∞]. Use the Kummer exact sequence to identify the quotient by the Mordell–Weil lattice with the appropriate Sha group. Saturation is a separate integral assertion; the finite cokernel and local component-group defects must be retained before rationalizing.
Prototype boundary: The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement. -/
theorem saturated_integral_kummer_lattice {M C S : Type*} [AddCommGroup M] [AddCommGroup C] [AddCommGroup S] (kummer : M →+ C) (shaMap : C →+ S) : kummer.range = shaMap.ker := by
  sorry

/- HeegnerPointEulerSystems:HE.3/archimedean-tate-correction
Over imaginary quadratic K all archimedean completions are C, so the relevant local H¹ vanishes. In descent to Q at a real place use the real/Tate local condition on the actual E[p^m] module. Odd p permits the usual conjugation eigenspace splitting; at p=2 its kernel/cokernel must be retained and one cannot divide by two on an integral Z₂ lattice.
Prototype boundary: The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement. -/
theorem archimedean_tate_correction {C : Type*} [AddCommGroup C] (realPlaceClass : C) : (2 : ℕ) • realPlaceClass = 0 := by
  sorry

/- HeegnerPointEulerSystems:HE.4/differentiated-point-invariance
For the actual squarefree ring-class conductor n, let G_n=Gal(K[n]/K[1]) be the product of its cyclic inert factors and 𝒢_n=Gal(K[n]/K). Under ordinary units and the clean torsion-image hypotheses, choose generators σ_ℓ and coset representatives S for 𝒢_n/G_n. Use ES3’s D_n=∏D_ℓ and set the differentiated point ˜P_n=Σ_{s∈S}sD_nP_n. Its class modulo I_n is 𝒢_n-invariant and independent of S. Use the full 𝒢_n action, not merely invariance under G_n. Exceptional-unit factors require a modified bounded-denominator construction, not an assumed direct product.
Prototype boundary: The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement. -/
theorem differentiated_point_invariance {M : Type*} [AddCommGroup M] (action : M →+ M) (derived : M) (modulus : ℕ) : ∃ Q, action derived - derived = modulus • Q := by
  sorry

/- HeegnerPointEulerSystems:HE.4/ring-class-torsion-invariants
Under Gross’s odd-p full residual image hypothesis or Howard’s full G_K Tate-image hypothesis, E[p^m](K[n])=0 for the relevant ring-class towers and all m≥1. The residual case uses the generalized-dihedral nature of K[n]/Q and the irreducible two-dimensional image; bootstrap finite exponent using multiplication by p. This statement is not implied by residual irreducibility for arbitrary field extensions.
Prototype boundary: The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement. -/
theorem ring_class_torsion_invariants {F : Type*} [Field F] (W : WeierstrassCurve.Affine F) (p m : ℕ) (hm : 0 < m) : ∀ P : W.Point, p ^ m • P = 0 → P = 0 := by
  sorry

/- HeegnerPointEulerSystems:HE.4/explicit-cocycle-divisibility
Choose p^mQ=˜P_n over the separable closure. The class c_m(n) is represented by σQ−Q−(σ˜P_n−˜P_n)/p^m, where the last quotient is the uniquely specified K[n]-rational division term under torsion vanishing. Hence c_m(n)=0 iff ˜P_n∈p^mE(K[n]); its image d_m(n) in H¹(K,E)[p^m] vanishes iff ˜P_n∈p^mE(K[n])+E(K), with descent interpreted through the actual restriction map.
Prototype boundary: The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement. -/
theorem explicit_cocycle_divisibility {M C : Type*} [AddCommGroup M] [AddCommGroup C] (derived : M) (κ : C) (q : ℕ) : κ = 0 ↔ ∃ Q : M, q • Q = derived := by
  sorry

/- HeegnerPointEulerSystems:HE.4/bottom-trace-class
At n=1, D_1=1 and the sum over 𝒢_1 gives y_K=Tr_{K[1]/K}P_1. Thus c_m(1)=δ_m(y_K) and the integral bottom class κ_1=δ_T(y_K), while d_m(1)=0. This is not δ(P_1) over K unless P_1 already descends.
Prototype boundary: The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement. -/
theorem bottom_trace_class {M C : Type*} [AddCommGroup M] [AddCommGroup C] (kummer : M →+ C) (trace : M) (bottom : C) : bottom = kummer trace := by
  sorry

/- HeegnerPointEulerSystems:HE.4/generator-tensor-choice-independence
After tensoring with G(n)=⊗_{ℓ|n}Gal(K[ℓ]/K[1]), the Heegner derivative class has the prescribed ES3 generator-change transformation law; changing σ_ℓ to σ_ℓ^u changes the derivative class by the inverse unit factor modulo I_n and the cyclic tensor generator by the compensating factor. State compatibility with lift/coset choices separately. Do not assert raw scalar classes are generator-independent.
Prototype boundary: The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement. -/
theorem generator_tensor_choice_independence {C : Type*} [AddCommGroup C] (κ κ' : C) (u : ℤ) : u • κ' = κ := by
  sorry

/- HeegnerPointEulerSystems:HE.4/coefficient-and-prime-set-compatibility
For m′≤m≤M(n), reduction E[p^m]→E[p^m′] takes c_m(n) to c_m′(n) under the exact chosen division/Kummer conventions. Restricting the permitted auxiliary-prime set restricts the same family; adding primes extends the family only when the conductor/norm/reduction hypotheses and tensor factors are proved for them. No map removing a prime factor of n is assumed without the local system relation.
Prototype boundary: The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement. -/
theorem coefficient_and_prime_set_compatibility {C C' : Type*} [AddCommGroup C] [AddCommGroup C'] (reduce : C →+ C') (κ : ℕ → C) (κ' : ℕ → C') : ∀ n, reduce (κ n) = κ' n := by
  sorry

/- HeegnerPointEulerSystems:HE.4/complex-conjugation-parity
For odd p and the clean classical branch, if ε is the Fricke eigenvalue of the eigenquotient, τc_m(n)=ε(−1)^ν(n)c_m(n); equivalently using the global root number w=−ε, this is w(−1)^(ν(n)+1). The torsion term from the basepoint/Fricke relation is removed only after its prime-to-p proof. At p=2 this formula does not yield an integral direct-sum eigenspace decomposition.
Prototype boundary: The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement. -/
theorem complex_conjugation_parity {C : Type*} [AddCommGroup C] (τ : C →+ C) (κ : C) (ε : ℤ) (ν : ℕ) : τ κ = (ε * (-1) ^ ν) • κ := by
  sorry

/- HeegnerPointEulerSystems:HE.5/heegner-transverse-local-condition
For ℓ|n an inert auxiliary prime under Howard’s odd-p clean hypotheses, the localization of c(n) restricts to zero over the specified totally ramified local ring-class extension K[n]_λ/K_λ. Thus it lies in the transverse condition used by ES1. Away from n it lies in the propagated finite local condition established in HE3. The p-odd identity Σ_{i=1}^{ℓ}i=ℓ(ℓ+1)/2 enters the transverse proof and cannot be copied integrally at p=2.
Prototype boundary: The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement. -/
theorem heegner_transverse_local_condition {C L : Type*} [AddCommGroup C] [AddCommGroup L] (restriction : C →+ L) (κ : C) : restriction κ = 0 := by
  sorry

/- HeegnerPointEulerSystems:HE.5/local-heegner-chi-automorphism
At inert ℓ, define Howard’s automorphism χ_ℓ on T/I_ℓT through local reduction, projection to the p-primary subgroup, p^−M(a_ℓ−(ℓ+1)Fr_ℓ), and the canonical torsion lift. The valuation/cyclic Frobenius-eigenspace calculation proves it is invertible. With all chosen cyclic generators retained, χ_ℓ(κ_n(Fr_λ))=κ_nℓ(σ_ℓ) is the actual Heegner finite–singular relation. This is an arithmetic correction to ES1’s generic comparison, not an assertion that raw classes already form a strong system.
Prototype boundary: The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement. -/
theorem local_heegner_chi_automorphism {C : Type*} [AddCommGroup C] (χ : C ≃+ C) (finite singular : C) : χ finite = singular := by
  sorry

/- HeegnerPointEulerSystems:HE.5/actual-tate-hypotheses-h0-h2
Under Howard TheoremA’s full G_K→GL₂(Z_p) surjectivity, p odd and p∤DN, T=T_pE is free rank two (H0), T/pT is absolutely irreducible (H1), and the auxiliary extension F/Q containing K used in H2 trivializes T and has H¹(F(μ_p∞)/K,T/pT)=0. The central scalar subgroup of order p−1 kills this cohomology. Full Tate-image surjectivity is stronger than residual irreducibility or residual surjectivity and is stated separately.
Prototype boundary: The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement. -/
theorem actual_tate_hypotheses_h0_h2 (p : ℕ) [Fact p.Prime] {T : Type*} [AddCommGroup T] [Module ℤ_[p] T] : Module.finrank ℤ_[p] T = 2 := by
  sorry

/- HeegnerPointEulerSystems:HE.5/actual-local-hypotheses-h3-h5
For the same actual T, verify H3 cartesian propagation at every quotient of the DVR, H4 the symmetric twisted Weil pairing (s,t)=e(s,τt) and exact orthogonality at conjugate places, and H5 extension of the residual representation to G_Q with one-dimensional τ± eigenspaces, G_Q-stability of local conditions and the required pairing/conjugation identity. Use the rational finite local conditions and their exact integral/torsion propagation; this does not define or reprove Howard’s abstract H0–H5 theorem.
Prototype boundary: The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement. -/
theorem actual_local_hypotheses_h3_h5 (p : ℕ) [Fact p.Prime] {T : Type*} [AddCommGroup T] [Module ℤ_[p] T] (twisted : T →ₗ[ℤ_[p]] T →ₗ[ℤ_[p]] ℤ_[p]) : ∀ s t, twisted s t = twisted t s := by
  sorry

/- HeegnerPointEulerSystems:HE.5/residual-kummer-field-pairing
In Gross’s odd-p full residual-image setting let L=K(E[p]). For a finite F_p-subspace S⊂H¹(K,E[p]), let L_S be the fixed field of the intersection of the kernels of the restricted homomorphisms G_L→E[p]. Restriction identifies classes with the equivariant Hom space, and the evaluation pairing gives Gal(L_S/L)≃Hom_Fp(S,E[p]) compatibly with the residual Galois action. The proof uses that the subquotients of the direct sum E[p]^r are sums of this simple module, not general semisimplicity of arbitrary F_p[GL₂(F_p)]-modules.
Prototype boundary: The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement. -/
theorem residual_kummer_field_pairing (p : ℕ) [Fact p.Prime] {H S V : Type*} [AddCommGroup H] [AddCommGroup S] [AddCommGroup V] [Module (ZMod p) S] [Module (ZMod p) V] : Nonempty (H ≃+ (S →ₗ[ZMod p] V)) := by
  sorry

/- HeegnerPointEulerSystems:HE.5/chebotarev-heegner-class-detection
Let M=L_S for a finite Selmer subspace S and let I fix the Kummer field generated by a pth division point of y_K. For τ acting on Gal(M/L), the square (τh)² detects the positive component used by Gross. Chebotarev primes whose Frobenius is the prescribed class of τh are inert auxiliary primes, avoid any specified finite set, and their localizations detect the corresponding evaluation annihilator. To detect a second independent class, use the correctly formed composite and the proved disjointness of its Kummer field.
Prototype boundary: The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement. -/
theorem chebotarev_heegner_class_detection {C L : Type*} [Zero C] [Zero L] (loc : ℕ → C → L) (κ : C) (hκ : κ ≠ 0) (excluded : Finset ℕ) : ∃ ℓ : ℕ, ℓ.Prime ∧ ℓ ∉ excluded ∧ loc ℓ κ ≠ 0 := by
  sorry

/- HeegnerPointEulerSystems:HE.5/arithmetic-local-error-comparison
For the actual Heegner Tate representation, compare ES4’s restriction/invariant/local-condition errors with p-primary local torsion, the p-part of the Néron component group, and the index of the integral finite/ordinary lattice. Record each finite kernel/cokernel as a separate length or annihilator constant. Equality with an error-free theorem requires the relevant quantities to vanish, not just the global residual image hypothesis.
Prototype boundary: The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement. -/
theorem arithmetic_local_error_comparison {R C : Type*} [CommRing R] [AddCommGroup C] [Module R C] (defect component : Submodule R C) : Module.length R defect ≤ Module.length R component := by
  sorry

/- HeegnerPointEulerSystems:HE.5/tamagawa-and-local-torsion-tests
For a split Tate curve over a local field of residue characteristic ℓ≠p with parameter q, its component group has order v(q); choose v(q)=p to get a nonzero p-component defect. If the same local field contains μ_p, the Tate uniformization supplies nonzero local E[p] even with a prime-to-p component order (for example v(q)=1). These distinct examples must fail the corresponding error-free local hypotheses. Neither local phenomenon follows or disappears from a global residual-irreducibility label.
Prototype boundary: The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement. -/
theorem tamagawa_and_local_torsion_tests (p : ℕ) [Fact p.Prime] {Φ : Type*} [AddCommGroup Φ] (hcard : Nat.card Φ = p) : ¬ Subsingleton Φ := by
  sorry

/- HeegnerPointEulerSystems:HE.6/clean-rank-one-descent-theorem-A
Assume E/Q conductor N, imaginary quadratic K discriminant D≠−3,−4 with all N-primes split, p odd, p,D,N pairwise coprime, and full Tate representation G_K→GL₂(Z_p) surjective. If the actual bottom Heegner Kummer class κ_1≠0, the compact Selmer group is free rank one and the discrete Selmer group is Q_p/Z_p⊕M⊕M for a finite Z_p-module M with length M≤length(H¹_F(K,T_pE)/Z_pκ_1). This is Howard TheoremA after the actual arithmetic H0–H5 checks and corrected system construction; the abstract self-dual theorem is ES5’s responsibility.
Prototype boundary: The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement. -/
theorem clean_rank_one_descent_theorem_A (p : ℕ) [Fact p.Prime] {C D : Type*} [AddCommGroup C] [AddCommGroup D] [Module ℤ_[p] C] [Module ℤ_[p] D] (κ : C) (hκ : κ ≠ 0) : Nonempty (C ≃ₗ[ℤ_[p]] ℤ_[p]) ∧ ∃ M : Submodule ℤ_[p] D, Finite M ∧ Nonempty (D ≃+ ((ℚ_[p] ⧸ (PadicInt.Coe.ringHom (p := p)).toAddMonoidHom.range) × M × M)) ∧ Module.length ℤ_[p] M ≤ Module.length ℤ_[p] (C ⧸ Submodule.span ℤ_[p] ({κ} : Set C)) := by
  sorry

/- HeegnerPointEulerSystems:HE.6/gross-clean-mod-p-descent
Assume Gross’s classical standing hypotheses and non-CM E, p odd, Q(E[p])/Q has full GL₂(F_p) group, and y_K∉pE(K). Then Sel_p(E/K) is the cyclic F_p-space generated by δ(y_K), rank E(K)=1 and Sha(E/K)[p]=0. This clean theorem requires neither p∤N nor full p-adic surjectivity as an extra hypothesis; do not replace its hypothesis table with Howard’s.
Prototype boundary: The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement. -/
theorem gross_clean_mod_p_descent (p : ℕ) [Fact p.Prime] {S Sha V : Type*} [AddCommGroup S] [AddCommGroup Sha] [AddCommGroup V] [Module (ZMod p) S] [Module ℚ V] (κ : S) : Submodule.span (ZMod p) ({κ} : Set S) = ⊤ ∧ Module.finrank ℚ V = 1 ∧ Subsingleton {x : Sha // p • x = 0} := by
  sorry

/- HeegnerPointEulerSystems:HE.6/gross-opposite-eigenspace-vanishing
Under Gross’s clean mod-p hypotheses, the ε-opposite Selmer eigenspace is zero. Choose a prime using the actual Kummer field M and positive component outside I. Its d(ℓ) is locally nonzero and supported only at λ; global reciprocity forces every Selmer class in that eigenspace to localize to zero. The Kummer-field annihilator calculation then forces the global eigenspace to vanish.
Prototype boundary: The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement. -/
theorem gross_opposite_eigenspace_vanishing {C : Type*} [AddCommGroup C] (τ : C →+ C) (ε : ℤ) (opposite : AddSubgroup C) : ∀ x : opposite, (x : C) = 0 := by
  sorry

/- HeegnerPointEulerSystems:HE.6/gross-same-eigenspace-generation
Under the same clean hypotheses, the remaining Selmer eigenspace equals F_p·δ(y_K). If a second independent class existed, choose the first auxiliary prime with nonzero local Heegner derivative and form its Kummer extension L′. Prove L′ is disjoint from the Selmer field over L in the relevant character, then choose a second simultaneous Frobenius in the composite. The finite/singular relation and reciprocity force incompatible localizations, so the second class cannot exist.
Prototype boundary: The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement. -/
theorem gross_same_eigenspace_generation (p : ℕ) [Fact p.Prime] {C : Type*} [AddCommGroup C] [Module (ZMod p) C] (same : Submodule (ZMod p) C) (bottom : C) : same = Submodule.span (ZMod p) ({bottom} : Set C) := by
  sorry

/- HeegnerPointEulerSystems:HE.6/sha-square-index-bound
Under HowardA with non-torsion y_K, the finite p-primary Sha group is the paired finite part of the discrete Selmer group. Thus length_Zp Sha[p∞]≤2·length_Zp(E(K)⊗Z_p/Z_py_K), after proving the exact integral Kummer-lattice identification. Equivalently its order divides the p-part of the square of the corresponding finite index. If a local or parametrization defect is present, insert its proved error term before this comparison.
Prototype boundary: The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement. -/
theorem sha_square_index_bound (p : ℕ) [Fact p.Prime] {Sha Q : Type*} [AddCommGroup Sha] [AddCommGroup Q] [Module ℤ_[p] Sha] [Module ℤ_[p] Q] : Module.length ℤ_[p] Sha ≤ 2 * Module.length ℤ_[p] Q := by
  sorry

/- HeegnerPointEulerSystems:HE.6/primitivity-versus-nonzero
A nonzero κ_1 yields an upper bound, not equality. Residual primitivity of the actual corrected system, together with the imported ES5 core/self-duality/local hypotheses, gives the corresponding equality of finite length and corrected index. Scaling the parametrization/system by p preserves non-torsion but increases the leading-class index, so cannot preserve an unsupported sharpness assertion. Zhang’s indivisibility conclusion proves a stronger property only under its enumerated hypotheses.
Prototype boundary: The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement. -/
theorem primitivity_versus_nonzero (p : ℕ) [Fact p.Prime] {M Q : Type*} [AddCommGroup M] [AddCommGroup Q] [Module ℤ_[p] M] [Module ℤ_[p] Q] : Module.length ℤ_[p] M = Module.length ℤ_[p] Q := by
  sorry

/- HeegnerPointEulerSystems:HE.6/zhang-cohomological-congruence
Let g,K,p satisfy Zhang’s Notations and Hypothesis♥, with m∈Λ′+ and distinct admissible q₁,q₂∤m. Fix the residual V over k₀, matched optimal embeddings and derivative generators. Then loc_q₁ c(n,m) lies in H¹(K_q₁,k₀) and loc_q₂ c(n,mq₁q₂) in H¹(K_q₂,k₀(1)); under fixed identifications with k₀ the two are equal up to a fixed nonzero scalar. The generic level-raising, definite/indefinite Jacquet–Langlands, multiplicity-one and Ihara statements are imported.
Prototype boundary: The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement. -/
theorem zhang_cohomological_congruence (p : ℕ) [Fact p.Prime] (left right : ZMod p) : ∃ u : (ZMod p)ˣ, left = u * right := by
  sorry

/- HeegnerPointEulerSystems:HE.6/zhang-local-conditions-rank-lowering
Under Zhang Hypothesis♥, local Selmer conditions for g and its admissible level-raised g′ have k₀-rational structures agreeing away from q. At q they are the finite k₀ line and the singular k₀(1) line respectively. If loc_q on the rational residual Selmer group is nonzero, it is surjective and the raised Selmer group is its kernel, so its dimension decreases by one. Hypothesis♥(3) requires H¹(Q_ℓ,V)=V^GQℓ=0 at ℓ²|N+; for elliptic E and p≥5 the additive-reduction argument verifies this. Do not apply the ℓ≠p Euler characteristic formula at ℓ=p.
Prototype boundary: The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement. -/
theorem zhang_local_conditions_rank_lowering {k C : Type*} [Field k] [AddCommGroup C] [Module k C] (before after : Submodule k C) (loc : C →ₗ[k] k) : after = before ⊓ loc.ker ∧ Module.finrank k before = Module.finrank k after + 1 := by
  sorry

/- HeegnerPointEulerSystems:HE.6/zhang-rank-zero-over-K
For a weight-two newform g and its GL₂-type A_g/Q with coefficient prime 𝔭|p≥3, K as in Zhang’s Notations, good ordinary p, residual image containing SL₂(F_p), and a residually ramified ℓ||N, L(g/K,1)≠0 iff Sel_𝔭∞(A_g/K) is finite. When finite, v_𝔭(L(g/K,1)/Ω_g^can)=length_O𝔭 Sel_𝔭∞(A_g/K)+Σ_{ℓ|N}t_g(ℓ). This is over A_g/K, not E/Q. Derive it using the separately imported ordinary main-conjecture and Kato divisibilities for g and its quadratic twist, with the GL₂-type control/period comparison.
Prototype boundary: The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement. -/
theorem zhang_rank_zero_over_K (p : ℕ) [Fact p.Prime] {R S : Type*} [CommRing R] [AddCommGroup S] [Module R S] (normalizedValue : ℚ_[p]) (valuation : ℚ_[p] → ℕ∞) (tamagawaLength : ℕ∞) : (normalizedValue ≠ 0 ↔ Finite S) ∧ (normalizedValue ≠ 0 → valuation normalizedValue = Module.length R S + tamagawaLength) := by
  sorry

/- HeegnerPointEulerSystems:HE.6/zhang-jochnowitz-special-value
For g as in Zhang’s Notations satisfying Hypothesis♥, with N− squarefree and ν(N−) even, and an admissible q, the Heegner bottom class is locally nonzero at q iff L^alg(g′/K,1) is a 𝔭′-adic unit. Here g′ is the chosen raised form, Ω_g′^can=〈g′,g′〉_Pet/η_g′(Nq), ξ_g′ is the norm of the integral primitive definite eigenfunction, η_g′,N+,N−q=η_g′(Nq)/ξ_g′, and L^alg=L/Ω^can·η_ratio⁻¹. Its integrality/unit status is proved by the explicit Waldspurger/Gross formula, not built into a definition.
Prototype boundary: The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement. -/
theorem zhang_jochnowitz_special_value {R C : Type*} [CommRing R] [AddCommGroup C] (localClass : C) (normalizedValue : R) : localClass ≠ 0 ↔ IsUnit normalizedValue := by
  sorry

/- HeegnerPointEulerSystems:HE.6/ribet-takahashi-tamagawa-comparison
For g of weight2 and trivial nebentypus, p≥5 with p∤ND_K and surjective ρ_g,𝔭:G_Q→GL₂(k₀), K as in Zhang’s Notations, N⁻ squarefree of odd prime count, and all three clauses of Hypothesis♥, let η_g(N) be the full-level Hecke congruence ideal generator and ξ_g(N⁺,N⁻) the pairing norm of a primitive integral definite quaternionic eigenfunction. The period ratio is η_g,N⁺,N⁻=η_g(N)/ξ_g(N⁺,N⁻), not the raw congruence ideal. Then v_𝔭(η_g,N⁺,N⁻)=Σ_{ℓ|N⁻}t_g(ℓ), where t_g(ℓ)=length_O𝔭 Φ(A_g/K_ℓ)_𝔭. For nonsquarefree N require Ram(ρ)≠∅ and either a ramified ℓ||N⁻ or at least two primes ℓ||N⁺, as in ♥(2). The last clause does not itself assert residual ramification of both primes. At split additive ℓ²|N⁺, ♥(3) and finite-residue cohomology eliminate the rational component factor; decomposition-invariant vanishing is not inertia-invariant vanishing.
Prototype boundary: The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement. -/
theorem ribet_takahashi_tamagawa_comparison {R : Type*} [CommRing R] (periodRatio : R) (valuation : R → ℕ∞) (tamagawaLength : ℕ∞) : valuation periodRatio = tamagawaLength := by
  sorry

/- HeegnerPointEulerSystems:HE.6/zhang-triangular-selmer-basis
For g as in Zhang’s Notations with N− squarefree and ν(N−) even, and a nonzero residual Heegner system κ_g satisfying Hypothesis♥, let ν=min{ν(n):c(n)≠0}, ε_ν=w_g(−1)^(ν+1) and B(κ) its base locus of vanishing localizations away from DKNp. The ε_ν Selmer eigenspace has dimension ν+1 and a triangular basis of ν+1 actual c(n_i), detected at selected 2ν+1 auxiliary primes. The opposite eigenspace has dimension ≤ν. Relaxing at the base locus does not enlarge the first eigenspace and preserves that opposite bound.
Prototype boundary: The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement. -/
theorem zhang_triangular_selmer_basis {k C : Type*} [Field k] [AddCommGroup C] [Module k C] (same opposite : Submodule k C) (ν : ℕ) : Module.finrank k same = ν + 1 ∧ Module.finrank k opposite ≤ ν := by
  sorry

/- HeegnerPointEulerSystems:HE.6/zhang-indivisibility
Assume E/Q conductor N, K imaginary quadratic with gcd(D_K,N)=1, N− squarefree with even number of prime factors, full residual GL₂(F_p) image, p≥5 good ordinary and p∤D_KN. Hypothesis♠ requires residual ramification at every ℓ||N+ and every ℓ|N− with ℓ≡±1 mod p; if N is nonsquarefree require a nonempty Ram set and either a ramified ℓ||N− or at least two factors ℓ||N+. Then c_1(n)≠0 for some squarefree Kolyvagin conductor n, so M∞=0. For the auxiliary GL₂-type forms use the stronger Hypothesis♥, including the additive-prime local invariant vanishing.
Prototype boundary: The suggested signature states the final transport of a nonzero auxiliary localization to the original class family through a supplied localization homomorphism and congruence. Source hypotheses, the level-raised arithmetic carriers and the preceding rank-lowering/nonvanishing induction are omitted. A zero arbitrary class family cannot satisfy those expressible transport hypotheses. The full theorem remains the mathematical target in this statement. -/
theorem zhang_indivisibility {C L : Type*} [AddCommGroup C] [AddCommGroup L]
    (Λ : Set ℕ) (classes : ℕ → C) (loc : C →+ L) (auxiliary : ℕ → L)
    (hcongruence : ∀ n ∈ Λ, loc (classes n) = auxiliary n)
    (hauxiliary : ∃ n ∈ Λ, auxiliary n ≠ 0) : ∃ n ∈ Λ, classes n ≠ 0 := by
  sorry

/- HeegnerPointEulerSystems:HE.7/non-torsion-point-prime-divisibility
For non-torsion y_K∈E(K), Mordell–Weil finite generation implies y_K∉pE(K) for every prime outside a finite set. This is proved before assuming rank one or a finite Heegner index: project to the free Mordell–Weil quotient and use a nonzero coordinate. Once rank one has been proved, the index of Z·y_K in the free quotient is finite; it is distinct from an index in E(K) that includes rational torsion.
Prototype boundary: The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement. -/
theorem non_torsion_point_prime_divisibility {M : Type*} [AddCommGroup M]
    [AddGroup.FG M] (y : M) (hy : ∀ n : ℕ, 0 < n → n • y ≠ 0) : ∃ excluded : Finset ℕ, ∀ p : ℕ, p.Prime → p ∉ excluded → ¬ ∃ z : M, p • z = y := by
  sorry

/- HeegnerPointEulerSystems:HE.7/non-cm-open-image-application
For non-CM E/Q, import Serre’s open-image theorem to conclude that Q(E[p])/Q has full GL₂(F_p) image for all but finitely many p, and apply it to the actual Heegner setting. More generally obtain the required uniform cohomological restriction/invariant bounds from the open adelic/Tate image over a number field, retaining the cyclotomic determinant and base-field index. For admissible GL₂-type RM quotients import the precise Ribet big-image variant; do not replan either generic theorem in HE.7.
Prototype boundary: The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement. -/
theorem non_cm_open_image_application {G : Type*} (image : ℕ → Set G) : ∃ excluded : Finset ℕ, ∀ p : ℕ, p.Prime → p ∉ excluded → image p = Set.univ := by
  sorry

/- HeegnerPointEulerSystems:HE.7/almost-all-primary-sha-vanishing
For the classical non-CM non-torsion Heegner setting, outside a finite set of primes the Gross clean theorem gives Sha(E/K)[p]=0. Since Sha is torsion, this implies Sha(E/K)[p∞]=0: any nonzero p-primary element would yield nonzero p-torsion after taking a suitable p-power multiple. This does not require proving finite p-primary groups first. For CM E use the separate CM-character branch: the uniform integral constants vanish outside a finite set and the finite-level Kummer quotient then forces Sha[p∞]=0. For the specified RM quotients the same reasoning applies at coefficient primes 𝔭; there are finitely many exceptional coefficient primes, not a tacit residual-surjectivity assumption.
Prototype boundary: The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement. -/
theorem almost_all_primary_sha_vanishing {Sha : Type*} [AddCommGroup Sha] : ∃ excluded : Finset ℕ, ∀ p : ℕ, p.Prime → p ∉ excluded → ∀ m : ℕ, ∀ x : Sha, p ^ m • x = 0 → x = 0 := by
  sorry

/- HeegnerPointEulerSystems:HE.7/bounded-arithmetic-derivative-denominators
Fix F totally real of degree d, B/F ramified at all real places except a chosen τ₁ and at a finite set S_B with #S_B≡d−1 mod2, and an open compact level U⊂B̂×. Let A/F be an F-simple Hecke-linear quotient of J(N_U*) with End_F(A)=O_L, L totally real and [L:Q]=dim A, and fix its nonzero integral quotient map. Let K/F be totally imaginary quadratic, every v∈S_B inert or ramified in K, fix t:K↪B and a CM point x of the specified level over K(x). Use the central quotient N_U*, modular compactification when B=M₂(Q), and the integral cusp/Hodge map ι(P)=m[P]−mδ of Nekovář1.19, with fixed m. Put y=Tr_K(x)/K ι_A(x). Assume y non-torsion and A does not acquire CM over K (Nekovář’s condition(?) for α=1). For each 𝔭 and each M≫0 with 𝔭^M principal, the actual CM tower supplies integral c(n)∈H¹(K(x),A[𝔭^M]) without requiring vanishing of torsion invariants. At v∤n its image in H¹(K(x)_v,A)[𝔭^M] is an unramified component-group class, killed by 𝔭^C₁,v where C₁,v kills the geometric 𝔭-primary Néron component group. With C₁=max_v C₁,v, κ_n=𝔭^C₁ cor_K(x)/K c(n) satisfies the actual finite Kummer conditions outside n, κ₁=𝔭^C₁δ(y), and its singular localization at ℓ is −Φ_ℓ Fr(ℓ)κ_n/ℓ. C₁ is independent of M,n and zero for almost all 𝔭; cusp/Hodge and quotient denominators are fixed in ι_A. For classical E use its given modular quotient, absorbing the fixed cusp annihilator and isogeny degree. C₂,C₃ bound evaluation errors, not an inverse of restriction.
Prototype boundary: The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement. -/
theorem bounded_arithmetic_derivative_denominators {C : Type*} [AddCommGroup C] (errors : ℕ → AddSubgroup C) : ∃ d : ℕ, 0 < d ∧ ∀ m : ℕ, ∀ x : errors m, d • (x : C) = 0 := by
  sorry

/- HeegnerPointEulerSystems:HE.7/dyadic-integral-conjugation-descent
Fix F totally real of degree d, B/F ramified at all real places except a chosen τ₁ and at a finite set S_B with #S_B≡d−1 mod2, and an open compact level U⊂B̂×. Let A/F be an F-simple Hecke-linear quotient of J(N_U*) with End_F(A)=O_L, L totally real and [L:Q]=dim A, and fix its nonzero integral quotient map. Let K/F be totally imaginary quadratic, every v∈S_B inert or ramified in K, fix t:K↪B and a CM point x of the specified level over K(x). Use the central quotient N_U*, modular compactification when B=M₂(Q), and the integral cusp/Hodge map ι(P)=m[P]−mδ of Nekovář1.19, with fixed m. Put y=Tr_K(x)/K ι_A(x). Assume y non-torsion and A does not acquire CM over K (Nekovář’s condition(?) for α=1). The integral two-prime descent applies at every coefficient prime, including 𝔭|2. Write C₀=max{c:y∈A(K)_tors+𝔭^cA(K)}, C₆=v_𝔭(degφ) for a fixed F-polarization, and C₁,C₂,C₃ as above; C₅=v_𝔭[K:K]=0 in this trivial-character part. For M≫0, 2²¹𝔭^(2C₀+2C₁+4C₂+4C₃+C₅+C₆) annihilates Sel(A/K,𝔭^M)/O_𝔭κ₁. Thus B=2C₀+2C₁+4C₂+4C₃+C₆+21v_𝔭(2) is independent of M. Integral (1±ρ) is retained; no decomposition using (1±ρ)/2 is made. All archimedean places of K are complex, so their local H¹ is zero. Any comparison back to a real place of F uses the fixed Tate correction killed by2, as specified in HE.3, rather than an odd-prime invariant argument.
Prototype boundary: The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement. -/
theorem dyadic_integral_conjugation_descent {C : Type*} [AddCommGroup C] (errors : ℕ → AddSubgroup C) : ∃ b : ℕ, ∀ m : ℕ, ∀ x : errors m, (2 ^ b : ℕ) • (x : C) = 0 := by
  sorry

/- HeegnerPointEulerSystems:HE.7/cm-character-error-descent
For a classical CM E/Q, K as in the CM/Heegner-field node, and non-torsion bottom Heegner point, the two conjugate CM Tate characters over KM verify the integral matrix-algebra and homothety bounds over K. The explicit cocycle classes and the integral two-prime descent give the same uniform exponent B at all rational primes, including 2. C₀,C₁,C₂,C₃,C₆ and v_p2 are zero outside a finite set, so Sha(E/K)[p∞]=0 there. This branch uses the semilinear CM character representation, not Serre’s non-CM GL₂ surjectivity.
Prototype boundary: The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement. -/
theorem cm_character_error_descent {C : Type*} [AddCommGroup C] (errors : ℕ → AddSubgroup C) : ∃ d : ℕ, 0 < d ∧ ∀ m : ℕ, ∀ x : errors m, d • (x : C) = 0 := by
  sorry

/- HeegnerPointEulerSystems:HE.7/exceptional-primary-sha-bound
Fix F totally real of degree d, B/F ramified at all real places except a chosen τ₁ and at a finite set S_B with #S_B≡d−1 mod2, and an open compact level U⊂B̂×. Let A/F be an F-simple Hecke-linear quotient of J(N_U*) with End_F(A)=O_L, L totally real and [L:Q]=dim A, and fix its nonzero integral quotient map. Let K/F be totally imaginary quadratic, every v∈S_B inert or ramified in K, fix t:K↪B and a CM point x of the specified level over K(x). Use the central quotient N_U*, modular compactification when B=M₂(Q), and the integral cusp/Hodge map ι(P)=m[P]−mδ of Nekovář1.19, with fixed m. Put y=Tr_K(x)/K ι_A(x). Assume y non-torsion and A does not acquire CM over K (Nekovář’s condition(?) for α=1). For each 𝔭 the finite-level Selmer quotient by κ₁ is killed uniformly by 𝔭^B, with B=2C₀+2C₁+4C₂+4C₃+C₆+21v_𝔭2. Since κ₁ lies in the Kummer image, Sha(A/K)[𝔭^M] is killed by 𝔭^B for every sufficiently large principal M, hence the entire 𝔭-primary group is killed by 𝔭^B. Finite-level Selmer finiteness at this fixed bound makes the primary group finite. The cofinal principal exponents are sufficient; separate finiteness at each M without a uniform B is insufficient.
Prototype boundary: The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement. -/
theorem exceptional_primary_sha_bound {Sha : Type*} [AddCommGroup Sha] (p : ℕ) : ∃ b : ℕ, ∀ m : ℕ, ∀ x : Sha, p ^ m • x = 0 → p ^ b • x = 0 := by
  sorry

/- HeegnerPointEulerSystems:HE.7/classical-full-sha-finiteness
Let E/Q have a fixed modular quotient X₀(N)→E, K imaginary quadratic with D_K≠−3,−4 and all N-primes split, and y_K=Tr_K[1]/K P₁ of infinite order. Then rank E(K)=1 and the entire Sha(E/K) is finite, including CM E and p=2. The uniform integral Selmer bound gives rank1: the non-torsion Kummer line has finite-index quotient at any coefficient prime; it also gives finite exceptional primary groups and almost-all primary vanishing. The quantitative square-index order theorem is stated separately and is not inferred from this exponent argument.
Prototype boundary: The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement. -/
theorem classical_full_sha_finiteness {V Sha : Type*} [AddCommGroup V] [Module ℚ V] [AddCommGroup Sha] : Module.finrank ℚ V = 1 ∧ Finite Sha := by
  sorry

/- HeegnerPointEulerSystems:HE.7/admissible-rm-kolyvagin-logachev
Fix F totally real of degree d, B/F ramified at all real places except a chosen τ₁ and at a finite set S_B with #S_B≡d−1 mod2, and an open compact level U⊂B̂×. Let A/F be an F-simple Hecke-linear quotient of J(N_U*) with End_F(A)=O_L, L totally real and [L:Q]=dim A, and fix its nonzero integral quotient map. Let K/F be totally imaginary quadratic, every v∈S_B inert or ramified in K, fix t:K↪B and a CM point x of the specified level over K(x). Use the central quotient N_U*, modular compactification when B=M₂(Q), and the integral cusp/Hodge map ι(P)=m[P]−mδ of Nekovář1.19, with fixed m. Put y=Tr_K(x)/K ι_A(x). Assume y non-torsion and A does not acquire CM over K (Nekovář’s condition(?) for α=1). Then A(K)/O_Ly is finite, rank_Z A(K)=[L:Q]=dim A, and the entire Sha(A/K) is finite. This is the trivial-character specialization of Nekovář3.2 and includes the specified quaternionic/RM quotients, with field, ramification, central quotient, maximal endomorphism order, Hecke map and integral Hodge normalization stated above. An analytic rank-d conclusion additionally requires a supplier height formula proving this particular y is non-torsion from ord_s=1 L(A/K,s)=d; analytic rank alone is not an input to descent.
Prototype boundary: The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement. -/
theorem admissible_rm_kolyvagin_logachev {V Sha : Type*} [AddCommGroup V] [Module ℚ V] [AddCommGroup Sha] (d : ℕ) : Module.finrank ℚ V = d ∧ Finite Sha := by
  sorry

/- HeegnerPointEulerSystems:HE.6/heegner-vanishing-order
For the actual residual Heegner family κ={c(n):n∈Λ}, define ν(κ)=min{#prime divisors of n:n∈Λ,c(n)≠0}, valued in ℕ∪{∞}, with ν(0)=∞. The count is of distinct primes in the squarefree conductor, not multiplicity or number of nonzero classes. This is Zhang’s finite-residual support invariant, distinguished from the p-adic divisibility sequence M_r and its M∞.
Prototype boundary: The supplied Λ, residual class family and actual local cohomology localization maps are unbundled data. Their arithmetic/continuous-cohomology identification is omitted; the support definition and its exact algebraic formula are stated. -/
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
For the actual family and localization maps, B(κ) is the set of primes ℓ∤D_KNp such that loc_ℓc(n)=0 for every n∈Λ. These are arbitrary good primes, not only Kolyvagin primes. The dependent local cohomology carriers may vary with ℓ. This locus determines exactly which local conditions are relaxed in Zhang Lemma8.4.
Prototype boundary: The supplied Λ, residual class family and actual local cohomology localization maps are unbundled data. Their arithmetic/continuous-cohomology identification is omitted; the support definition and its exact algebraic formula are stated. -/
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


/- HeegnerPointEulerSystems:HE.6/zhang-residual-local-pairing
Let g be a weight-two newform of trivial nebentypus, K imaginary quadratic with (D_K,N)=1, N=N⁺N⁻ with N⁻ squarefree of even prime count, and p≥5, p∤ND_K, good ordinary for g. Let k₀ be the finite field generated by the residual Hecke eigenvalues, V its two-dimensional representation, with ρ:G_Q→GL₂(k₀) surjective and A_g[𝔭]≃V⊗k₀k; impose all three clauses of Hypothesis♥. For each inert Kolyvagin prime ℓ∤ND_Kp with a_ℓ≡ℓ+1≡0 mod𝔭, H¹(K_ℓ,V) has dimension4 over k₀, with finite and transverse two-dimensional maximal isotropic subspaces. Each ± conjugation component of either subspace has dimension1, and local Tate duality pairs the same signs perfectly. The pairing V×V→k₀(1) is alternating, G_Q-equivariant; conjugation acts by −1 on its values.
Omitted: the exact CM-point or V/k₀ arithmetic carriers, local conditions and
source-qualified image hypotheses in the full statement above. Existing groups,
modules and linear maps below supply only its indicated algebraic conclusion. -/
theorem zhang_residual_local_pairing {k H : Type*} [Field k]
    [AddCommGroup H] [Module k H] (finite transverse : Submodule k H) :
    Module.finrank k H = 4 ∧ Module.finrank k finite = 2 ∧
      Module.finrank k transverse = 2 := by
  sorry


/- HeegnerPointEulerSystems:HE.6/zhang-residual-heegner-relations
Let g be a weight-two newform of trivial nebentypus, K imaginary quadratic with (D_K,N)=1, N=N⁺N⁻ with N⁻ squarefree of even prime count, and p≥5, p∤ND_K, good ordinary for g. Let k₀ be the finite field generated by the residual Hecke eigenvalues, V its two-dimensional representation, with ρ:G_Q→GL₂(k₀) surjective and A_g[𝔭]≃V⊗k₀k; impose all three clauses of Hypothesis♥. The actual k₀-rational derivative classes c(n) satisfy c(n)_v∈H¹_fin(K_v,V) for v∤n, c(n)_ℓ∈H¹_tr(K_ℓ,V) for ℓ|n, and c(nℓ)_ℓ=ψ_ℓ(c(n)_ℓ) when ℓ∤n, where ψ_ℓ:H¹_fin≃H¹_tr is the normalized finite/transverse comparison. Conjugation acts on c(n) by ε_n=w_g(−1)^(ν(n)+1), where w_g is Zhang’s root number convention. All bad places and v|p use the actual Kummer condition; the relation is not inferred from Howard’s elliptic full-Tate-image correction.
Omitted: the exact CM-point or V/k₀ arithmetic carriers, local conditions and
source-qualified image hypotheses in the full statement above. Existing groups,
modules and linear maps below supply only its indicated algebraic conclusion. -/
theorem zhang_residual_heegner_relations {C F S : Type*}
    [AddCommGroup C] [AddCommGroup F] [AddCommGroup S]
    (classes : ℕ → C) (locFin : C →+ F) (locSing : C →+ S)
    (ψ : F ≃+ S) (n ℓ : ℕ) : locSing (classes (n * ℓ)) = ψ (locFin (classes n)) := by
  sorry


/- HeegnerPointEulerSystems:HE.6/zhang-two-class-prime-detection
Let g be a weight-two newform of trivial nebentypus, K imaginary quadratic with (D_K,N)=1, N=N⁺N⁻ with N⁻ squarefree of even prime count, and p≥5, p∤ND_K, good ordinary for g. Let k₀ be the finite field generated by the residual Hecke eigenvalues, V its two-dimensional representation, with ρ:G_Q→GL₂(k₀) surjective and A_g[𝔭]≃V⊗k₀k; impose all three clauses of Hypothesis♥. For two k₀-linearly independent classes c₁,c₂∈H¹(K,V) and any finite excluded set, there is a positive-density set of inert Kolyvagin primes ℓ outside it with loc_ℓ(c₁)≠0 and loc_ℓ(c₂)≠0. In particular nonzero classes in opposite conjugation eigenspaces can be detected simultaneously.
Omitted: the exact CM-point or V/k₀ arithmetic carriers, local conditions and
source-qualified image hypotheses in the full statement above. Existing groups,
modules and linear maps below supply only its indicated algebraic conclusion. -/
theorem zhang_two_class_prime_detection {k C L : Type*}
    [Field k] [AddCommGroup C] [Module k C] [AddCommGroup L]
    (c₁ c₂ : C) (h₁ : c₁ ≠ 0)
    (hind : ∀ a : k, c₂ ≠ a • c₁) (Λ : Set ℕ) (excluded : Finset ℕ)
    (loc : ℕ → C →+ L) :
    ∃ ℓ ∈ Λ, ℓ ∉ excluded ∧ loc ℓ c₁ ≠ 0 ∧ loc ℓ c₂ ≠ 0 := by
  sorry


/- HeegnerPointEulerSystems:HE.6/zhang-prescribed-ramification-class
Let g be a weight-two newform of trivial nebentypus, K imaginary quadratic with (D_K,N)=1, N=N⁺N⁻ with N⁻ squarefree of even prime count, and p≥5, p∤ND_K, good ordinary for g. Let k₀ be the finite field generated by the residual Hecke eigenvalues, V its two-dimensional representation, with ρ:G_Q→GL₂(k₀) surjective and A_g[𝔭]≃V⊗k₀k; impose all three clauses of Hypothesis♥. For a Kolyvagin prime ℓ and a finite set S of other Kolyvagin primes, each conjugation eigenspace contains a nonzero global class with finite local condition outside S∪{ℓ}, transverse condition at S, and no condition at ℓ. This existence statement does not assert that its singular localization at ℓ is nonzero.
Omitted: the exact CM-point or V/k₀ arithmetic carriers, local conditions and
source-qualified image hypotheses in the full statement above. Existing groups,
modules and linear maps below supply only its indicated algebraic conclusion. -/
theorem zhang_prescribed_ramification_class {k C : Type*}
    [Field k] [AddCommGroup C] [Module k C] (ρ : C →ₗ[k] C)
    (conditions : ℕ → Submodule k C) (S : Finset ℕ) (ℓ : ℕ) (hℓ : ℓ ∉ S)
    (ε : k) (hε : ε = 1 ∨ ε = -1) :
    ∃ c : C, c ≠ 0 ∧ ρ c = ε • c ∧ ∀ v, v ≠ ℓ → c ∈ conditions v := by
  sorry


/- HeegnerPointEulerSystems:HE.7/integral-tate-image-errors
Fix F totally real of degree d, B/F ramified at all real places except a chosen τ₁ and at a finite set S_B with #S_B≡d−1 mod2, and an open compact level U⊂B̂×. Let A/F be an F-simple Hecke-linear quotient of J(N_U*) with End_F(A)=O_L, L totally real and [L:Q]=dim A, and fix its nonzero integral quotient map. Let K/F be totally imaginary quadratic, every v∈S_B inert or ramified in K, fix t:K↪B and a CM point x of the specified level over K(x). Use the central quotient N_U*, modular compactification when B=M₂(Q), and the integral cusp/Hodge map ι(P)=m[P]−mδ of Nekovář1.19, with fixed m. Put y=Tr_K(x)/K ι_A(x). Assume y non-torsion and A does not acquire CM over K (Nekovář’s condition(?) for α=1). For each coefficient prime 𝔭 of O_L, T=T_𝔭A is free rank2 over O_𝔭. For H_M=K(A[𝔭^M]), there are C₂(𝔭),C₃(𝔭)≥0 independent of M such that restriction H¹(K,A[𝔭^M])→H¹(H_M,A[𝔭^M]) has kernel killed by 𝔭^C₂ and the image of O_𝔭[G_K] in End_O𝔭(T) contains 𝔭^C₃ End_O𝔭(T). Both constants vanish for all but finitely many 𝔭. The image assertion uses absence of CM over K, not absence of geometric CM.
Omitted: the exact CM-point or V/k₀ arithmetic carriers, local conditions and
source-qualified image hypotheses in the full statement above. Existing groups,
modules and linear maps below supply only its indicated algebraic conclusion. -/
theorem integral_tate_image_errors {C : Type*} [AddCommGroup C]
    (p : ℕ) [Fact p.Prime] (restrictionKernels : ℕ → AddSubgroup C)
    (evaluationCokernels : ℕ → AddSubgroup C) :
    ∃ C₂ C₃ : ℕ, (∀ M, ∀ x : restrictionKernels M, (p ^ C₂ : ℕ) • (x : C) = 0) ∧
      (∀ M, ∀ x : evaluationCokernels M, (p ^ C₃ : ℕ) • (x : C) = 0) := by
  sorry


/- HeegnerPointEulerSystems:HE.7/integral-cm-prime-detection
Fix F totally real of degree d, B/F ramified at all real places except a chosen τ₁ and at a finite set S_B with #S_B≡d−1 mod2, and an open compact level U⊂B̂×. Let A/F be an F-simple Hecke-linear quotient of J(N_U*) with End_F(A)=O_L, L totally real and [L:Q]=dim A, and fix its nonzero integral quotient map. Let K/F be totally imaginary quadratic, every v∈S_B inert or ramified in K, fix t:K↪B and a CM point x of the specified level over K(x). Use the central quotient N_U*, modular compactification when B=M₂(Q), and the integral cusp/Hodge map ι(P)=m[P]−mδ of Nekovář1.19, with fixed m. Put y=Tr_K(x)/K ι_A(x). Assume y non-torsion and A does not acquire CM over K (Nekovář’s condition(?) for α=1). For M≫0 with 𝔭^M principal, and a finite O_𝔭/𝔭^M-submodule W₀ of H¹(K,A[𝔭^M]), the actual finite Kummer extension over H_M has an evaluation map whose kernel loss is bounded by C₂ and whose evaluation cokernel is killed by 𝔭^C₃. For ρ-stable W₀, conjugation-compatible detection uses integral 1±ρ and factors2,4,16, with loss C₂+C₃+4v_𝔭(2). It supplies inert good primes in S₁(M), excluding any fixed finite set, with the prescribed detections. S₁(M) requires Frobenius conjugate to ρ in K(x)(A[𝔭^(M+M₀)])/F, M₀=v_𝔭(u₀), hence a_ℓ≡0 and Nℓ+1≡0 mod𝔭^(M+M₀).
Omitted: the exact CM-point or V/k₀ arithmetic carriers, local conditions and
source-qualified image hypotheses in the full statement above. Existing groups,
modules and linear maps below supply only its indicated algebraic conclusion. -/
theorem integral_cm_prime_detection {C : Type*} [AddCommGroup C]
    (p M c₀ loss : ℕ) [Fact p.Prime] (c : C)
    (hc : (p ^ (c₀ + loss) : ℕ) • c ≠ 0)
    (Λ : Set ℕ) (excluded : Finset ℕ) (loc : ℕ → C →+ C) :
    ∃ ℓ ∈ Λ, ℓ ∉ excluded ∧ (p ^ c₀ : ℕ) • loc ℓ c ≠ 0 := by
  sorry


/- HeegnerPointEulerSystems:HE.7/cm-heegner-field-disjointness
Let E/Q have CM by an imaginary quadratic field M, conductor N, and let K be a classical Heegner field in which every prime dividing N splits. Then M≠K, M∩K=Q, and E does not acquire its CM endomorphisms over K. Over KM the coefficient-extension Tate representation splits into the two conjugate CM characters; G_K exchanges them through Gal(KM/K), so the rational representation over K is absolutely irreducible. This verifies the α=1 condition(?) and matrix-algebra hypothesis of the integral descent, although its residual image need not be full GL₂.
Omitted: the exact CM-point or V/k₀ arithmetic carriers, local conditions and
source-qualified image hypotheses in the full statement above. Existing groups,
modules and linear maps below supply only its indicated algebraic conclusion. -/
theorem cm_heegner_field_disjointness (cmDiscriminant heegnerDiscriminant N : ℕ)
    (hcm : cmDiscriminant ∣ N) (hcoprime : Nat.Coprime heegnerDiscriminant N)
    (hramified : 1 < cmDiscriminant) : cmDiscriminant ≠ heegnerDiscriminant := by
  sorry


/- HeegnerPointEulerSystems:HE.7/classical-square-index-error-bound
In the classical setting of the full-finiteness node, put O=End_overlineQ(E), Q_O=O⊗Q, embedded in overlineQ through the chosen CM type when O≠Z. Let B(E) consist of odd primes ℓ∤disc(O) such that the O_ℓ-linear representation G_Q_O→Aut_Oℓ(T_ℓE) is surjective. There is a positive integer d_E independent of K with v_ℓ(d_E)=0 for ℓ∈B(E) and #Sha(E/K) dividing d_E I_K², where I_K=[E(K):Zy_K] includes rational torsion and is defined after rank1 is proved. For non-CM E, Q_O=Q and Aut_Oℓ=GL₂(Z_ℓ); for CM E use the linear Cartan action over Q_O, not full GL₂ over Q. B(E) is a full Tate-image criterion and is not silently replaced by a residual-image criterion at the small primes. Gross writes the related error bound as t_E/K I_K²; no explicit value or optimality of either constant is asserted.
Omitted: the exact CM-point or V/k₀ arithmetic carriers, local conditions and
source-qualified image hypotheses in the full statement above. Existing groups,
modules and linear maps below supply only its indicated algebraic conclusion. -/
theorem classical_square_index_error_bound (shaOrder fullIndex : ℕ)
    (goodPrimes : Set ℕ) :
    ∃ d : ℕ, 0 < d ∧ shaOrder ∣ d * fullIndex ^ 2 ∧
      ∀ ℓ ∈ goodPrimes, ℓ.Prime → ¬ ℓ ∣ d := by
  sorry

end TauCeti.Heegner
