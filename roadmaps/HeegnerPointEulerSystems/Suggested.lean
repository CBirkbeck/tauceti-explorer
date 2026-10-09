/-
This file is not the roadmap and is not exhaustive. The roadmap document is definitive.
These statements suggest Lean forms so contributors converge on names and signatures.
Proofs and examples are admitted; elaboration checks interface shapes only.

Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. No Tau Ceti module is imported.

Missing arithmetic supplier interfaces are explicitly omitted conditions, not
replacement definitions: CM moduli and canonical models, continuous Galois
cohomology and Selmer conditions, completed arithmetic Iwasawa algebras and
characteristic ideals, crystalline characters, perfect Selmer complexes and
integral determinant lattices. Existing algebraic types carry supplied values,
modules and maps. Production statements must include the exact arithmetic
identifications, source hypotheses and local conditions in README.md and below.
A formal identity on those carriers does not prove its arithmetic realization.
-/
import Mathlib.Algebra.Ring.Subring.Basic
import Mathlib.RingTheory.PicardGroup
import Mathlib.NumberTheory.Padics.PadicIntegers
import Mathlib.AlgebraicGeometry.EllipticCurve.Affine.Point
import Mathlib.RingTheory.Length
import Mathlib.LinearAlgebra.Dimension.Finrank
import Mathlib.Data.Nat.Factors
import Mathlib.GroupTheory.SpecificGroups.Dihedral
import Mathlib.Algebra.MonoidAlgebra.Basic
import Mathlib.Algebra.Group.Hom.Basic
import Mathlib.LinearAlgebra.Span.Basic
import Mathlib.LinearAlgebra.TensorProduct.Basic
import Mathlib.Data.ENat.Lattice
import Mathlib.RingTheory.Ideal.Operations
import Mathlib.LinearAlgebra.Quotient.Basic
import Mathlib.Topology.Instances.Real.Lemmas
import Mathlib.Topology.Compactness.Compact
import Mathlib.Topology.Instances.ZMod
import Mathlib.Topology.Algebra.Group.Basic

noncomputable section
open scoped TensorProduct

namespace TauCeti.Heegner

local instance (α : Type*) : DecidableEq α := Classical.decEq α

local instance : Fact (Nat.Prime 5) := ⟨by decide⟩

/- HE.1: the map includes the integral Jacobian/basepoint construction.
Omitted: CM descent, exact level, Hodge denominator, fixed quotient and its degree.
The map and CM point family are supplied data, not fabricated Prop witnesses. -/
/- HE.1: heegner-points-of-conductor-m-and-the-modular-parametrisation
Mathematical statement: Fix the descended CM family x_c, the level orientation, the integral cusp or d-cleared Hodge construction, and an actual fixed modular quotient φ:J→A defined over the base. Define P_c=φ([d x_c−d ξ])∈A(K[c]); the modular cusp branch has d=1. Keep deg φ and any Manin constant as data. Define y_K=Tr_{K[1]/K}P_1 separately: P_1 is generally not K-rational. In Lean the supplier geometry is an explicitly missing condition on the supplied CM points and map, not an invented CM-point carrier.
-/
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
/- HE.4: heegner-coefficient-ideal
Mathematical statement: Fix an odd prime p and an actual Hecke eigenvalue function a_ℓ. Set I_ℓ=(a_ℓ,ℓ+1)⊂Z_p and I_n=Σ_{ℓ|n}I_ℓ for squarefree n of admissible inert primes. The quotient is Z_p/I_n. For n=1 the empty sum is zero, so the coefficient module is the full Tate lattice, not its residual reduction. If n>1 then I_n=(p^M(n)) with M(n)=min_{ℓ|n}min(v_p(a_ℓ),v_p(ℓ+1)). An intersection/product would give the wrong modulus.
-/
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
/- HE.4: kolyvagin-derivative-classes-and-descent-to-K
Mathematical statement: Under the proved torsion-invariant vanishing, inflation–restriction gives res:H¹_cont(K,E[p^m])≃H¹_cont(K[n],E[p^m])^𝒢_n for m≤M(n). Define c_m(n) as res⁻¹ of the Kummer class of ˜P_n. For integral conductor-one use the T_pE Kummer class of y_K. Without invariant vanishing, keep the H¹/H² kernel/cokernel terms and use the separate error-tolerant ES3/4 construction; there is no unrestricted unique inverse.
-/
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
/- HE.5: finite-singular-comparison-and-the-corrected-kolyvagin-system
Mathematical statement: For the actual descended Heegner family κ_n, construct commuting global cohomology automorphisms χ_ℓ inducing the specified local Howard correction. Let χ_n=∏_{ℓ|n}χ_ℓ. Define κ′_n=χ_n⁻¹(κ_n)⊗σ_n in the cyclic tensor target. Then κ′ satisfies the strong ES1/3 edge relation and κ′_1=κ_1, so κ′ is a Kolyvagin system for the Selmer triple (T,F,𝓛) in the sense of EulerSystemsAndKolyvaginSystems:ES.5/howard-hypotheses (Howard Definition1.2.3 and Theorem1.7.5). A local non-G_K-linear coefficient automorphism alone cannot be postcomposed with global cocycles; a legitimate change-of-group action and its localization comparison must be supplied.
-/
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

/- HE.0: local-toral-order
For a specified embedding ι:E_v↪B_v of a quadratic étale Q_v-algebra, a maximal Z_v-order O_v⊂B_v and g_v∈B_v×, the Heegner local order is ι⁻¹(g_v O_v g_v⁻¹). It is a full Z_v-order of the form Z_v+f_v O_{E_v}, is stable under quadratic conjugation, and is maximal away from finitely many places for a rational embedding and restricted adelic g.
Prototype boundary: The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement. -/
theorem local_toral_order {K : Type*} [CommRing K] (Λ : Subring K) (orders : ℕ → Subring K) : ∃ n, Λ = orders n := by
  sorry

/- HE.0: transported-global-order
For a rational quadratic embedding E↪B and a restricted adelic g, Λ=E∩∏_v Λ_v is a finite-index Z-order in O_E, with Λ⊗Z_v≃Λ_v. Its Picard group is the existing CommRing.Pic Λ, equivalently ClassGroup Λ; only invertible proper fractional ideals occur.
Prototype boundary: The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement. -/
theorem transported_global_order {K L : Type*} [CommRing K] [CommRing L] (Λ : Subring K) (Λv : Subring L) (localize : Subring K → Subring L) : localize Λ = Λv := by
  sorry

/- HE.0: idele-ideal-class-comparison
For the imaginary quadratic transported order Λ, map a finite invertible idele t to the locally principal fractional ideal E∩t∏_v Λ_v. This induces the ordinary finite idele-class quotient the left quotient of A_E,f× by E× and the right quotient by Λ̂×≃Pic Λ and the S={∞} toral packet quotient C_S≃Pic Λ. The torus covering E×→E×/Q× is used explicitly; kernel triviality uses the class number one of Q.
Prototype boundary: The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement. -/
theorem idele_ideal_class_comparison {O G : Type*} [CommRing O] [CommGroup G] : Nonempty (G ≃* CommRing.Pic O) := by
  sorry

/- HE.0: conductor-change-kernel
Let K/Q be imaginary quadratic, c≥1 and ℓ prime. Extension of invertible ideals gives Pic(O_cℓ)→Pic(O_c), surjectively. If ℓ∤c, its kernel is (O_c/ℓO_c)×/((Z/ℓZ)×·image(O_c×)); thus u_c,ℓ·#ker=ℓ−χ_K(ℓ), where u_c,ℓ=[O_c×:O_cℓ×]. If ℓ|c, u_c,ℓ·#ker=ℓ. χ takes −1,0,1 in inert, ramified, split cases. Every quotient and map is induced by the actual inclusions of orders.
Prototype boundary: The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement. -/
theorem conductor_change_kernel {O O' : Type*} [CommRing O] [CommRing O'] (f : CommRing.Pic O' →* CommRing.Pic O) (ℓ u : ℕ) (χ : ℤ) : Function.Surjective f ∧ (u : ℤ) * (Nat.card f.ker : ℤ) = (ℓ : ℤ) - χ := by
  sorry

/- HE.0: ring-class-tower-quotients
Using the ring-class existence theorem imported from CFT13, realize every K[c] in a fixed separable closure of K. For c|d, O_d⊂O_c gives K[c]⊂K[d] and restriction Gal(K[d]/K)→Gal(K[c]/K), compatible under composition and with ideal extension under Artin. Its kernel is Gal(K[d]/K[c]), and [K[cℓ]:K[c]] equals the kernel cardinal computed in conductor-change-kernel. Splitting of a prime away from the conductor is equivalent to its invertible ideal class being trivial; K[c]/K is unramified outside c and the exact local ramification is supplied by local unit reciprocity.
Prototype boundary: The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement. -/
theorem ring_class_tower_quotients {G H : Type*} [Group G] [Group H] (restriction : G →* H) (degree : ℕ) : Function.Surjective restriction ∧ Nat.card restriction.ker = degree := by
  sorry

/- HE.0: dihedral-conjugation
For imaginary quadratic K/Q, K[c]/Q is Galois and a chosen complex conjugation τ satisfies τστ⁻¹=σ⁻¹ for σ∈Gal(K[c]/K). The conjugation is attached to an archimedean embedding and compatible throughout the tower. Do not equip a general ring class field with IsCMField: it need not be a CM field.
Prototype boundary: The suggested signature transports the existing DihedralGroup rotation/reflection identity through a supplied homomorphism into the arithmetic group. It is the cyclic-quotient component of the tower action. The class-field identification and general abelian-class-group inversion remain omitted supplier conditions; no arbitrary group elements are asserted to satisfy the identity. -/
theorem dihedral_conjugation {G : Type*} [Group G] (n : ℕ)
    (f : DihedralGroup n →* G) (i : ZMod n) :
    f (DihedralGroup.sr 0) * f (DihedralGroup.r i) * (f (DihedralGroup.sr 0))⁻¹ =
      (f (DihedralGroup.r i))⁻¹ := by
  sorry

/- HE.0: relative-cm-conductor-tower
Let F be totally real, K/F totally imaginary quadratic and P a finite prime of F of residue characteristic p. The imported orders O_Pn=O_F+PⁿO_K and class fields K[Pⁿ] have a compatible Galois inverse limit G∞. The finite idele/unit quotient realizes this limit; G∞ has finite torsion subgroup G0 and G∞/G0≃Z_p^[F_P:Q_p]. For sufficiently large n, [K[Pⁿ⁺¹]:K[Pⁿ]]=N(P), with the finite initial global-unit indices retained. The admissible level subgroup is the intersection with the specified quaternionic level, not an arbitrary replacement.
Prototype boundary: The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement. -/
theorem relative_cm_conductor_tower (degrees : ℕ → ℕ) (residueCard : ℕ) : ∃ n₀, ∀ n, n₀ ≤ n → degrees n = residueCard := by
  sorry

/- HE.0: norm-reciprocity-level-compatibility
For the relative CM towers and an inclusion of admissible finite-level subgroups, field restriction, finite idele quotient projection and order ideal extension commute under Artin. For a finite extension of CM bases, field norm and ideal norm agree with the imported functorial Artin map on the relevant finite quotient. Cornut–Vatsal uses geometric Frobenius: the arithmetic-Frobenius convention here inverts the reciprocity/Frobenius arguments before using any pointwise identity.
Prototype boundary: The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement. -/
theorem norm_reciprocity_level_compatibility {A B C D : Type*} (norm : A → B) (recA : A → C) (recB : B → D) (restriction : C → D) : recB ∘ norm = restriction ∘ recA := by
  sorry

/- HE.0: local-different-discriminant
For the local quadratic étale order Λ_v, define its trace dual Λ_v∨={a∈E_v:Tr(aΛ_v)⊆Z_v} using the imported lattice/trace pairing. Its inverse different is a principal invertible fractional Λ_v-ideal; the different is its inverse. The ideal norm (equivalently the absolute local discriminant valuation) agrees with the order discriminant. This does not identify the signed field norm of a generator with a positive discriminant; in a split conductor-π order a generator (π,−π) has norm −π².
Prototype boundary: The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement. -/
theorem local_different_discriminant {K : Type*} [CommRing K] (different : Ideal K) : different.IsPrincipal := by
  sorry

/- HE.1: cm-cyclic-isogeny-pair
Assume K imaginary quadratic of discriminant different from −3,−4, N≥1 with every prime dividing N split, c prime to N, and an invertible O_c-ideal 𝔑_c with O_c/𝔑_c≃Z/NZ. For a proper invertible fractional ideal a, the pair C/a→C/(𝔑_c⁻¹a) is cyclic of degree N and gives the corresponding existing X₀(N) moduli point. The endomorphism ring is O_c; replacing a by αa gives the same level pair. Changing 𝔑 or its orientation is an explicitly recorded Galois/Fricke action, not literal equality.
Prototype boundary: The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement. -/
theorem cm_cyclic_isogeny_pair {F : Type*} [Field F] (W : WeierstrassCurve.Affine F) (kernel : AddSubgroup W.Point) (N : ℕ) : Nat.card kernel = N := by
  sorry

/- HE.1: optimal-embedding-cm-points
For F totally real, K/F CM, B ramified at all but one real place and specified finite places, and Eichler order R, an optimal embedding O_C↪R is an F-algebra embedding K↪B satisfying K∩R=O_C. K splits B iff K_v is a field at every ramified finite place (and the archimedean embedding condition holds). The CM double-coset description K×\B̂×/R̂× with a specified archimedean CM type identifies the complex CM points, with local optimal-embedding conditions required by the chosen Eichler level. It has not yet asserted rationality.
Prototype boundary: The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement. -/
theorem optimal_embedding_cm_points {K B : Type*} [Field K] [Ring B] (ι : K →+* B) (O : Subring K) (R : Subring B) : R.comap ι = O := by
  sorry

/- HE.1: canonical-model-cm-descent
For the CM level points above, the imported main CM theorem/canonical model reciprocity shows x_C∈X(K[C]) in the actual HE.0 tower. Its stabilizer is K× times the intersection of the finite torus with the chosen level; σ=rec_K(t) acts by x(g)↦x(t^εg) in Cornut–Vatsal’s geometric convention. Convert to arithmetic reciprocity with the inverse convention before comparison. The statement concerns the cyclic-isogeny pair or optimal embedding, not only j(E).
Prototype boundary: The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement. -/
theorem canonical_model_cm_descent {F L : Type*} [Field F] [Field L] (W : WeierstrassCurve.Affine F) (W' : WeierstrassCurve.Affine L) (baseChange : W.Point → W'.Point) (P : W'.Point) : ∃ Q, baseChange Q = P := by
  sorry

/- HE.1: jacobian-basepoint-denominators
For X₀(N) use the rational cusp ∞ to form [x−∞]. For a compact quaternionic curve use the imported normalized rational Hodge class ξ=(K_X+B_X)/deg(K_X+B_X), componentwise of degree one; x↦[x−ξ] lies in J⊗Q. Choose a nonzero integer d clearing the denominators to obtain the integral class [d x−d ξ]. Do not erase d. For an auxiliary ℓ₀, (ℓ₀+1−Tℓ₀)x is degree zero; after quotienting by an eigenform g, division by ℓ₀+1−aℓ₀ is valid integrally at p only if it is a p-adic unit.
Prototype boundary: The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement. -/
theorem jacobian_basepoint_denominators {J : Type*} [AddCommGroup J] [Module ℚ J] (degree : J →ₗ[ℚ] ℚ) (ξ : J) : degree ξ = 1 := by
  sorry

/- HE.1: parameter-choice-and-degree
For the fixed Heegner family, ideal-class translation gives the corresponding Galois translation; a Fricke/orientation change acts by the recorded eigenvalue and rational cusp-torsion translation. Multiplying the modular parametrization or clearing Hodge denominators scales P_c and the bottom trace by that integer. For Gross’s rational optimal curve, φ*ω_E=c_φ·(2πif(z)dz), with positive integral Manin constant c_φ; the index I_K/c_φ is invariant under the appropriate isogeny change, not I_K alone.
Prototype boundary: The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement. -/
theorem parameter_choice_and_degree {F : Type*} [Field F] (W : WeierstrassCurve.Affine F) (P Q torsionTranslation : W.Point) (u : ℤ) : Q = u • P + torsionTranslation := by
  sorry

/- HE.2: cm-hecke-conductor-classification
At a finite prime P where B is split and the Eichler level is maximal, let ε_P=−1,0,1 for inert, ramified, split K/F. A level-zero CM lattice has 1+ε_P horizontal neighbors and N(P)−ε_P ascending neighbors of conductor P. At positive conductor n it has one predecessor of conductor n−1 and N(P) ascending neighbors of conductor n+1. The ascending set is a torsor for O_n×/O_n+1×. Global unit stabilizers must be divided out when converting this local sum into a field trace.
Prototype boundary: The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement. -/
theorem cm_hecke_conductor_classification (q horizontal ascending : ℕ) (ε : ℤ) : (horizontal : ℤ) = 1 + ε ∧ (ascending : ℤ) = (q : ℤ) - ε := by
  sorry

/- HE.2: norm-relation-and-reduction-congruence
Under the classical Heegner hypothesis, ℓ prime with ℓ∤cN and inert in K, the compatible cusp-normalized family satisfies u_c,ℓ·Tr_{K[cℓ]/K[c]}P_cℓ=a_ℓP_c. With ordinary units u=1 this is the Gross/Howard equality. For a d-cleared Hodge family, first prove that the chosen basepoint is a Hecke eigenclass and transport the divisor relation; retain any integral torsion difference if only a rational eigenclass identity is known.
Prototype boundary: The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement. -/
theorem norm_relation_and_reduction_congruence {F : Type*} [Field F] (W : WeierstrassCurve.Affine F) (P : W.Point) (trace : W.Point) (u : ℕ) (aℓ : ℤ) : u • trace = aℓ • P := by
  sorry

/- HE.2: split-ramified-first-step-recurrence
For ℓ∤cN, the local divisor trace with u_c,ℓ retained equals T_ℓx_c−(σ_ℓ+σ_ℓbar)x_c in the split case and T_ℓx_c−σ_ℓx_c in the ramified case. Here Frobenius on the lower-conductor field is unramified at ℓ; the ramified case refers to K/Q ramification, not ramification of K[c]/K away from c. Use the specified reciprocity convention. After the fixed eigenquotient replace T_ℓ by a_ℓ only with the exact Jacobian basepoint corrections.
Prototype boundary: The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement. -/
theorem split_ramified_first_step_recurrence {F : Type*} [Field F] (W : WeierstrassCurve.Affine F) (P trace : W.Point) (u : ℕ) (aℓ : ℤ) (horizontal : W.Point) : u • trace = aℓ • P - horizontal := by
  sorry

/- HE.2: repeated-conductor-predecessor-recurrence
At maximal local quaternionic level and conductor exponent n≥2, the local unit trace of a CM point x of conductor n is T_P^lower(pr^upper x)−pr^lower(pr^upper x). On a coherent chosen chain this gives the repeated-conductor recurrence, with predecessor and central scaling specified. Passing to the global field trace divides the orbit by the actual global-unit stabilizer; it must not simply copy the first-step inert ℓ+1 formula.
Prototype boundary: The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement. -/
theorem repeated_conductor_predecessor_recurrence {M : Type*} [AddCommGroup M] (trace predecessor secondPredecessor : M) (hecke : M →+ M) : trace = hecke predecessor - secondPredecessor := by
  sorry

/- HE.2: nonmaximal-level-distribution
For a prime P with Eichler level exponent δ=1, orient the lattice pair and its type I/II. For conductor ≥2, its unit trace equals the appropriate upper/lower Hecke operator on its predecessor and becomes −pr(x) in the P-new quotient. For δ≥2, type I/II points have zero trace in the P-new quotient; type III is excluded. Reversing the orientation exchanges types I and II. These are divisor-module statements before any abelian quotient.
Prototype boundary: The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement. -/
theorem nonmaximal_level_distribution {M : Type*} [AddCommGroup M] (trace predecessor : M) : trace = -predecessor := by
  sorry

/- HE.2: inert-reduction-frobenius-congruence
For the classical compatible family, ℓ∤cND inert, choose compatible primes λ_cℓ|λ_c over ℓ and the actual good-reduction specialization maps. Then red_λcℓ(P_cℓ)=Frob_λc(red_λc(P_c)) after the specified residue-field identifications; Frobenius is the ℓ-power geometric endomorphism on the reduction of the modular/elliptic curve as fixed in Gross’s convention. State separately the Artin arithmetic-Frobenius conversion. This is pointwise, not merely an equality of traces.
Prototype boundary: The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement. -/
theorem inert_reduction_frobenius_congruence {F k : Type*} [Field F] [Field k] (W : WeierstrassCurve.Affine F) (Wk : WeierstrassCurve.Affine k) (red : W.Point → Wk.Point) (frobenius : Wk.Point → Wk.Point) (P Pℓ : W.Point) : red Pℓ = frobenius (red P) := by
  sorry

/- HE.2: quaternionic-reduction-specialization
For Zhang’s m∈𝒩′⁺ and an admissible q∤m, reduction of x_m(n) at q is x_mq(n) in the definite Shimura set, using the matched optimal embedding and supersingular identification. For q|m, specialization is x_m/q(n) on the chosen vertex copy of the semistable reduction graph. Both formulas require the same CM/basepoint identifications and the prime λ=qO_K splitting completely in the CM fields of definition over K (in particular K[n]/K, since q∤n). Rational q is inert in K/Q; reduction uses residue field F_q².
Prototype boundary: The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement. -/
theorem quaternionic_reduction_specialization {X Xq : Type*} (reduction : X → Xq) (x : ℕ → X) (xq : ℕ → Xq) (n : ℕ) : reduction (x n) = xq n := by
  sorry

/- HE.3: kummer-classes-and-the-modified-selmer-conditions
Apply the imported finite Kummer injection E(K[c])/p^mE(K[c])→H¹_cont(K[c],E[p^m]) to P_c. Apply the imported p-adic Kummer map to the compatible p-completion to obtain the integral T_pE class. The finite classes are its actual coefficient reductions, and restriction/corestriction commute with the field maps/point trace, including all trace/unit constants from HE.2. The Tate module has its inverse-limit topology and finite torsion coefficients their discrete topology.
Prototype boundary: The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement. -/
theorem kummer_classes_and_the_modified_selmer_conditions {M C C' : Type*} [AddCommGroup M] [AddCommGroup C] [AddCommGroup C'] (kummer : M →+ C) (kummer' : M →+ C') (reduction : C →+ C') : reduction.comp kummer = kummer' := by
  sorry

/- HE.3: good-place-kummer-unramified
For ℓ≠p of good reduction, the finite Kummer image E(K_v)/p^m agrees with H¹_unr(K_v,E[p^m]); in particular P_c’s Kummer class is unramified at such v, after transfer to the relevant field. The proof uses the Néron model and unramified torsion, not a claim that all local cohomology is unramified.
Prototype boundary: The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement. -/
theorem good_place_kummer_unramified {M C : Type*} [AddCommGroup M] [AddCommGroup C] (kummer : M →+ C) (unramified : AddSubgroup C) : kummer.range = unramified := by
  sorry

/- HE.3: bad-place-component-obstruction
For finite v∤p, compare the local point Kummer image with the propagated rational unramified condition. The discrepancy factors through the p-primary component group of the Néron model, together with the precise local invariants/quotient torsion terms. Equality requires the appropriate obstruction to vanish; residual irreducibility alone does not remove it. For Gross’s derived d(n), the cusp-divisor and connected-Néron-model argument proves local triviality away from n even at primes dividing N.
Prototype boundary: The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement. -/
theorem bad_place_component_obstruction {M C Φ : Type*} [AddCommGroup M] [AddCommGroup C] [AddCommGroup Φ] (kummerDefect : M →+ C) (component : M →+ Φ) : ∃ obstruction : Φ →+ C, kummerDefect = obstruction.comp component := by
  sorry

/- HE.3: coefficient-prime-local-condition
At v|p with good reduction, the actual Kummer class of P_c satisfies the finite/crystalline rational condition and its integral propagated Kummer condition. In the good ordinary branch compare with the Greenberg filtration only under the exact ordinary/crystalline comparison hypotheses and retain local-torsion error terms. A rational equality after tensoring with Q_p is not an equality of integral lattices.
Prototype boundary: The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement. -/
theorem coefficient_prime_local_condition {M C : Type*} [AddCommGroup M] [AddCommGroup C] (kummer : M →+ C) (finiteCondition : AddSubgroup C) (P : M) : kummer P ∈ finiteCondition := by
  sorry

/- HE.3: saturated-integral-kummer-lattice
Compare the actual finite/p-adic Heegner Kummer classes in the Selmer lattice with E(K)⊗Z_p, V_pE, and E[p∞]. Use the Kummer exact sequence to identify the quotient by the Mordell–Weil lattice with the appropriate Sha group. Saturation is a separate integral assertion; the finite cokernel and local component-group defects must be retained before rationalizing.
Prototype boundary: The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement. -/
theorem saturated_integral_kummer_lattice {M C S : Type*} [AddCommGroup M] [AddCommGroup C] [AddCommGroup S] (kummer : M →+ C) (shaMap : C →+ S) : kummer.range = shaMap.ker := by
  sorry

/- HE.3: archimedean-tate-correction
Over imaginary quadratic K all archimedean completions are C, so the relevant local H¹ vanishes. In descent to Q at a real place use the real/Tate local condition on the actual E[p^m] module. Odd p permits the usual conjugation eigenspace splitting; at p=2 its kernel/cokernel must be retained and one cannot divide by two on an integral Z₂ lattice.
Prototype boundary: The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement. -/
theorem archimedean_tate_correction {C : Type*} [AddCommGroup C] (realPlaceClass : C) : (2 : ℕ) • realPlaceClass = 0 := by
  sorry

/- HE.4: differentiated-point-invariance
For the actual squarefree ring-class conductor n, let G_n=Gal(K[n]/K[1]) be the product of its cyclic inert factors and 𝒢_n=Gal(K[n]/K). Under ordinary units and the clean torsion-image hypotheses, choose generators σ_ℓ and coset representatives S for 𝒢_n/G_n. Use ES3’s D_n=∏D_ℓ and set the differentiated point ˜P_n=Σ_{s∈S}sD_nP_n. Its class modulo I_n is 𝒢_n-invariant and independent of S. Use the full 𝒢_n action, not merely invariance under G_n. Exceptional-unit factors require a modified bounded-denominator construction, not an assumed direct product.
Prototype boundary: The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement. -/
theorem differentiated_point_invariance {M : Type*} [AddCommGroup M] (action : M →+ M) (derived : M) (modulus : ℕ) : ∃ Q, action derived - derived = modulus • Q := by
  sorry

/- HE.4: ring-class-torsion-invariants
Under Gross’s odd-p full residual image hypothesis or Howard’s full G_K Tate-image hypothesis, E[p^m](K[n])=0 for the relevant ring-class towers and all m≥1. The residual case uses the generalized-dihedral nature of K[n]/Q and the irreducible two-dimensional image; bootstrap finite exponent using multiplication by p. This statement is not implied by residual irreducibility for arbitrary field extensions.
Prototype boundary: The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement. -/
theorem ring_class_torsion_invariants {F : Type*} [Field F] (W : WeierstrassCurve.Affine F) (p m : ℕ) (hm : 0 < m) : ∀ P : W.Point, p ^ m • P = 0 → P = 0 := by
  sorry

/- HE.4: explicit-cocycle-divisibility
Choose p^mQ=˜P_n over the separable closure. The class c_m(n) is represented by σQ−Q−(σ˜P_n−˜P_n)/p^m, where the last quotient is the uniquely specified K[n]-rational division term under torsion vanishing. Hence c_m(n)=0 iff ˜P_n∈p^mE(K[n]); its image d_m(n) in H¹(K,E)[p^m] vanishes iff ˜P_n∈p^mE(K[n])+E(K), with descent interpreted through the actual restriction map.
Prototype boundary: The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement. -/
theorem explicit_cocycle_divisibility {M C : Type*} [AddCommGroup M] [AddCommGroup C] (derived : M) (κ : C) (q : ℕ) : κ = 0 ↔ ∃ Q : M, q • Q = derived := by
  sorry

/- HE.4: bottom-trace-class
At n=1, D_1=1 and the sum over 𝒢_1 gives y_K=Tr_{K[1]/K}P_1. Thus c_m(1)=δ_m(y_K) and the integral bottom class κ_1=δ_T(y_K), while d_m(1)=0. This is not δ(P_1) over K unless P_1 already descends.
Prototype boundary: The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement. -/
theorem bottom_trace_class {M C : Type*} [AddCommGroup M] [AddCommGroup C] (kummer : M →+ C) (trace : M) (bottom : C) : bottom = kummer trace := by
  sorry

/- HE.4: generator-tensor-choice-independence
After tensoring with G(n)=⊗_{ℓ|n}Gal(K[ℓ]/K[1]), the Heegner derivative class has the prescribed ES3 generator-change transformation law; changing σ_ℓ to σ_ℓ^u changes the derivative class by the inverse unit factor modulo I_n and the cyclic tensor generator by the compensating factor. State compatibility with lift/coset choices separately. Do not assert raw scalar classes are generator-independent.
Prototype boundary: The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement. -/
theorem generator_tensor_choice_independence {C : Type*} [AddCommGroup C] (κ κ' : C) (u : ℤ) : u • κ' = κ := by
  sorry

/- HE.4: coefficient-and-prime-set-compatibility
For m′≤m≤M(n), reduction E[p^m]→E[p^m′] takes c_m(n) to c_m′(n) under the exact chosen division/Kummer conventions. Restricting the permitted auxiliary-prime set restricts the same family; adding primes extends the family only when the conductor/norm/reduction hypotheses and tensor factors are proved for them. No map removing a prime factor of n is assumed without the local system relation.
Prototype boundary: The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement. -/
theorem coefficient_and_prime_set_compatibility {C C' : Type*} [AddCommGroup C] [AddCommGroup C'] (reduce : C →+ C') (κ : ℕ → C) (κ' : ℕ → C') : ∀ n, reduce (κ n) = κ' n := by
  sorry

/- HE.4: complex-conjugation-parity
For odd p and the clean classical branch, if ε is the Fricke eigenvalue of the eigenquotient, τc_m(n)=ε(−1)^ν(n)c_m(n); equivalently using the global root number w=−ε, this is w(−1)^(ν(n)+1). The torsion term from the basepoint/Fricke relation is removed only after its prime-to-p proof. At p=2 this formula does not yield an integral direct-sum eigenspace decomposition.
Prototype boundary: The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement. -/
theorem complex_conjugation_parity {C : Type*} [AddCommGroup C] (τ : C →+ C) (κ : C) (ε : ℤ) (ν : ℕ) : τ κ = (ε * (-1) ^ ν) • κ := by
  sorry

/- HE.5: heegner-transverse-local-condition
For ℓ|n an inert auxiliary prime under Howard’s odd-p clean hypotheses, the localization of c(n) restricts to zero over the specified totally ramified local ring-class extension K[n]_λ/K_λ. Thus it lies in the transverse condition used by ES1. Away from n it lies in the propagated finite local condition established in HE3. The p-odd identity Σ_{i=1}^{ℓ}i=ℓ(ℓ+1)/2 enters the transverse proof and cannot be copied integrally at p=2.
Prototype boundary: The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement. -/
theorem heegner_transverse_local_condition {C L : Type*} [AddCommGroup C] [AddCommGroup L] (restriction : C →+ L) (κ : C) : restriction κ = 0 := by
  sorry

/- HE.5: local-heegner-chi-automorphism
At inert ℓ, define Howard’s automorphism χ_ℓ on T/I_ℓT through local reduction, projection to the p-primary subgroup, p^−M(a_ℓ−(ℓ+1)Fr_ℓ), and the canonical torsion lift. The valuation/cyclic Frobenius-eigenspace calculation proves it is invertible. With all chosen cyclic generators retained, χ_ℓ(κ_n(Fr_λ))=κ_nℓ(σ_ℓ) is the actual Heegner finite–singular relation. This is an arithmetic correction to ES1’s generic comparison, not an assertion that raw classes already form a strong system.
Prototype boundary: The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement. -/
theorem local_heegner_chi_automorphism {C : Type*} [AddCommGroup C] (χ : C ≃+ C) (finite singular : C) : χ finite = singular := by
  sorry

/- HE.5: actual-tate-hypotheses-h0-h2
Under Howard TheoremA’s full G_K→GL₂(Z_p) surjectivity, p odd and p∤DN, T=T_pE is free rank two (H0), T/pT is absolutely irreducible (H1), and the auxiliary extension F/Q containing K used in H2 trivializes T and has H¹(F(μ_p∞)/K,T/pT)=0. The central scalar subgroup of order p−1 kills this cohomology. Full Tate-image surjectivity is stronger than residual irreducibility or residual surjectivity and is stated separately. H.0–H.2 are those of the hypothesis record EulerSystemsAndKolyvaginSystems:ES.5/howard-hypotheses.
Prototype boundary: The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement. -/
theorem actual_tate_hypotheses_h0_h2 (p : ℕ) [Fact p.Prime] {T : Type*} [AddCommGroup T] [Module ℤ_[p] T] : Module.finrank ℤ_[p] T = 2 := by
  sorry

/- HE.5: actual-local-hypotheses-h3-h5
For the same actual T, verify H3 cartesian propagation at every quotient of the DVR, H4 the symmetric twisted Weil pairing (s,t)=e(s,τt) and exact orthogonality at conjugate places, and H5 extension of the residual representation to G_Q with one-dimensional τ± eigenspaces, G_Q-stability of local conditions and the required pairing/conjugation identity. Use the rational finite local conditions and their exact integral/torsion propagation; the hypothesis record H.0–H.5 is EulerSystemsAndKolyvaginSystems:ES.5/howard-hypotheses, and Howard’s abstract theorem is not defined or reproved here.
Prototype boundary: The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement. -/
theorem actual_local_hypotheses_h3_h5 (p : ℕ) [Fact p.Prime] {T : Type*} [AddCommGroup T] [Module ℤ_[p] T] (twisted : T →ₗ[ℤ_[p]] T →ₗ[ℤ_[p]] ℤ_[p]) : ∀ s t, twisted s t = twisted t s := by
  sorry

/- HE.5: residual-kummer-field-pairing
In Gross’s odd-p full residual-image setting let L=K(E[p]). For a finite F_p-subspace S⊂H¹(K,E[p]), let L_S be the fixed field of the intersection of the kernels of the restricted homomorphisms G_L→E[p]. Restriction identifies classes with the equivariant Hom space, and the evaluation pairing gives Gal(L_S/L)≃Hom_Fp(S,E[p]) compatibly with the residual Galois action. The proof uses that the subquotients of the direct sum E[p]^r are sums of this simple module, not general semisimplicity of arbitrary F_p[GL₂(F_p)]-modules.
Prototype boundary: The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement. -/
theorem residual_kummer_field_pairing (p : ℕ) [Fact p.Prime] {H S V : Type*} [AddCommGroup H] [AddCommGroup S] [AddCommGroup V] [Module (ZMod p) S] [Module (ZMod p) V] : Nonempty (H ≃+ (S →ₗ[ZMod p] V)) := by
  sorry

/- HE.5: chebotarev-heegner-class-detection
Let M=L_S for a finite Selmer subspace S and let I fix the Kummer field generated by a pth division point of y_K. For τ acting on Gal(M/L), the square (τh)² detects the positive component used by Gross. Chebotarev primes whose Frobenius is the prescribed class of τh are inert auxiliary primes, avoid any specified finite set, and their localizations detect the corresponding evaluation annihilator. To detect a second independent class, use the correctly formed composite and the proved disjointness of its Kummer field.
Prototype boundary: The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement. -/
theorem chebotarev_heegner_class_detection {C L : Type*} [Zero C] [Zero L] (loc : ℕ → C → L) (κ : C) (hκ : κ ≠ 0) (excluded : Finset ℕ) : ∃ ℓ : ℕ, ℓ.Prime ∧ ℓ ∉ excluded ∧ loc ℓ κ ≠ 0 := by
  sorry

/- HE.5: arithmetic-local-error-comparison
For the actual Heegner Tate representation, compare ES4’s restriction/invariant/local-condition errors with p-primary local torsion, the p-part of the Néron component group, and the index of the integral finite/ordinary lattice. Record each finite kernel/cokernel as a separate length or annihilator constant. Equality with an error-free theorem requires the relevant quantities to vanish, not just the global residual image hypothesis.
Prototype boundary: The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement. -/
theorem arithmetic_local_error_comparison {R C : Type*} [CommRing R] [AddCommGroup C] [Module R C] (defect component : Submodule R C) : Module.length R defect ≤ Module.length R component := by
  sorry

/- HE.5: tamagawa-and-local-torsion-tests
For a split Tate curve over a local field of residue characteristic ℓ≠p with parameter q, its component group has order v(q); choose v(q)=p to get a nonzero p-component defect. If the same local field contains μ_p, the Tate uniformization supplies nonzero local E[p] even with a prime-to-p component order (for example v(q)=1). These distinct examples must fail the corresponding error-free local hypotheses. Neither local phenomenon follows or disappears from a global residual-irreducibility label.
Prototype boundary: The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement. -/
theorem tamagawa_and_local_torsion_tests (p : ℕ) [Fact p.Prime] {Φ : Type*} [AddCommGroup Φ] (hcard : Nat.card Φ = p) : ¬ Subsingleton Φ := by
  sorry

/- HE.6: clean-rank-one-descent-theorem-A
Assume E/Q conductor N, imaginary quadratic K discriminant D≠−3,−4 with all N-primes split, p odd, p,D,N pairwise coprime, and full Tate representation G_K→GL₂(Z_p) surjective. If the actual bottom Heegner Kummer class κ_1≠0, the compact Selmer group is free rank one and the discrete Selmer group is Q_p/Z_p⊕M⊕M for a finite Z_p-module M with length M≤length(H¹_F(K,T_pE)/Z_pκ_1). This is Howard TheoremA after the actual arithmetic H0–H5 checks and corrected system construction; the abstract self-dual theorem is EulerSystemsAndKolyvaginSystems:ES.5/howard-dvr-theorem (Howard Theorem1.6.1), imported and not reproved here.
Prototype boundary: The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement. -/
theorem clean_rank_one_descent_theorem_A (p : ℕ) [Fact p.Prime] {C D : Type*} [AddCommGroup C] [AddCommGroup D] [Module ℤ_[p] C] [Module ℤ_[p] D] (κ : C) (hκ : κ ≠ 0) : Nonempty (C ≃ₗ[ℤ_[p]] ℤ_[p]) ∧ ∃ M : Submodule ℤ_[p] D, Finite M ∧ Nonempty (D ≃+ ((ℚ_[p] ⧸ (PadicInt.Coe.ringHom (p := p)).toAddMonoidHom.range) × M × M)) ∧ Module.length ℤ_[p] M ≤ Module.length ℤ_[p] (C ⧸ Submodule.span ℤ_[p] ({κ} : Set C)) := by
  sorry

/- HE.6: gross-clean-mod-p-descent
Assume Gross’s classical standing hypotheses and non-CM E, p odd, Q(E[p])/Q has full GL₂(F_p) group, and y_K∉pE(K). Then Sel_p(E/K) is the cyclic F_p-space generated by δ(y_K), rank E(K)=1 and Sha(E/K)[p]=0. This clean theorem requires neither p∤N nor full p-adic surjectivity as an extra hypothesis; do not replace its hypothesis table with Howard’s.
Prototype boundary: The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement. -/
theorem gross_clean_mod_p_descent (p : ℕ) [Fact p.Prime] {S Sha V : Type*} [AddCommGroup S] [AddCommGroup Sha] [AddCommGroup V] [Module (ZMod p) S] [Module ℚ V] (κ : S) : Submodule.span (ZMod p) ({κ} : Set S) = ⊤ ∧ Module.finrank ℚ V = 1 ∧ Subsingleton {x : Sha // p • x = 0} := by
  sorry

/- HE.6: gross-opposite-eigenspace-vanishing
Under Gross’s clean mod-p hypotheses, the ε-opposite Selmer eigenspace is zero. Choose a prime using the actual Kummer field M and positive component outside I. Its d(ℓ) is locally nonzero and supported only at λ; global reciprocity forces every Selmer class in that eigenspace to localize to zero. The Kummer-field annihilator calculation then forces the global eigenspace to vanish.
Prototype boundary: The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement. -/
theorem gross_opposite_eigenspace_vanishing {C : Type*} [AddCommGroup C] (τ : C →+ C) (ε : ℤ) (opposite : AddSubgroup C) : ∀ x : opposite, (x : C) = 0 := by
  sorry

/- HE.6: gross-same-eigenspace-generation
Under the same clean hypotheses, the remaining Selmer eigenspace equals F_p·δ(y_K). If a second independent class existed, choose the first auxiliary prime with nonzero local Heegner derivative and form its Kummer extension L′. Prove L′ is disjoint from the Selmer field over L in the relevant character, then choose a second simultaneous Frobenius in the composite. The finite/singular relation and reciprocity force incompatible localizations, so the second class cannot exist.
Prototype boundary: The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement. -/
theorem gross_same_eigenspace_generation (p : ℕ) [Fact p.Prime] {C : Type*} [AddCommGroup C] [Module (ZMod p) C] (same : Submodule (ZMod p) C) (bottom : C) : same = Submodule.span (ZMod p) ({bottom} : Set C) := by
  sorry

/- HE.6: sha-square-index-bound
Under HowardA with non-torsion y_K, the finite p-primary Sha group is the paired finite part of the discrete Selmer group. Thus length_Zp Sha[p∞]≤2·length_Zp(E(K)⊗Z_p/Z_py_K), after proving the exact integral Kummer-lattice identification. Equivalently its order divides the p-part of the square of the corresponding finite index. If a local or parametrization defect is present, insert its proved error term before this comparison.
Prototype boundary: The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement. -/
theorem sha_square_index_bound (p : ℕ) [Fact p.Prime] {Sha Q : Type*} [AddCommGroup Sha] [AddCommGroup Q] [Module ℤ_[p] Sha] [Module ℤ_[p] Q] : Module.length ℤ_[p] Sha ≤ 2 * Module.length ℤ_[p] Q := by
  sorry

/- HE.6: primitivity-versus-nonzero
A nonzero κ_1 yields an upper bound, not equality. Residual primitivity of the actual corrected system, under the self-dual hypotheses H.0–H.5 and for p≥5, gives the corresponding equality of finite length and corrected index (Zanarella Theorem2.3.6). Scaling the parametrization/system by p preserves non-torsion but increases the leading-class index, so cannot preserve an unsupported sharpness assertion. Zhang’s indivisibility conclusion proves a stronger property only under its enumerated hypotheses.
Prototype boundary: The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement. -/
theorem primitivity_versus_nonzero (p : ℕ) [Fact p.Prime] {M Q : Type*} [AddCommGroup M] [AddCommGroup Q] [Module ℤ_[p] M] [Module ℤ_[p] Q] : Module.length ℤ_[p] M = Module.length ℤ_[p] Q := by
  sorry

/- HE.6: zhang-cohomological-congruence
Let g,K,p satisfy Zhang’s Notations and Hypothesis♥, with m∈𝒩′⁺ and distinct admissible q₁,q₂∤m. Fix the residual V over k₀, matched optimal embeddings and derivative generators. Then loc_q₁ c(n,m) lies in H¹(K_q₁,k₀) and loc_q₂ c(n,mq₁q₂) in H¹(K_q₂,k₀(1)); under fixed identifications with k₀ the two are equal up to a fixed nonzero scalar. The generic level-raising, definite/indefinite Jacquet–Langlands, multiplicity-one and Ihara statements are imported.
Prototype boundary: The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement. -/
theorem zhang_cohomological_congruence {k₀ ι : Type*} [Field k₀]
    (left right : ι → k₀) : ∃ u : k₀ˣ, ∀ n, left n = (u : k₀) * right n := by
  sorry

/- HE.6: zhang-local-conditions-rank-lowering
Under Zhang Hypothesis♥, local Selmer conditions for g and its admissible level-raised g′ have k₀-rational structures agreeing away from q. At q they are the finite k₀ line and the singular k₀(1) line respectively. If loc_q on the rational residual Selmer group is nonzero, it is surjective and the raised Selmer group is its kernel, so its dimension decreases by one. Hypothesis♥(3) requires H¹(Q_ℓ,V)=V^GQℓ=0 at ℓ²|N+; for elliptic E and p≥5 the additive-reduction argument verifies this. Do not apply the ℓ≠p Euler characteristic formula at ℓ=p.
Prototype boundary: The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement. -/
theorem zhang_local_conditions_rank_lowering {k C : Type*} [Field k] [AddCommGroup C] [Module k C] (before after : Submodule k C) (loc : C →ₗ[k] k) : after = before ⊓ loc.ker ∧ Module.finrank k before = Module.finrank k after + 1 := by
  sorry

/- HE.6: zhang-rank-zero-over-K
For a weight-two newform g and its GL₂-type A_g/Q with coefficient prime 𝔭|p≥3, K as in Zhang’s Notations with p∤D_K, good ordinary p, residual image containing SL₂(F_p), and a residually ramified ℓ||N, L(g/K,1)≠0 iff Sel_𝔭∞(A_g/K) is finite. When finite, v_𝔭(L(g/K,1)/Ω_g^can)=length_O𝔭 Sel_𝔭∞(A_g/K)+Σ_{ℓ|N}t_g(ℓ). This is over A_g/K, not E/Q. It is derived from the rank-zero formula over Q for g and for its quadratic twist g_K (Skinner TheoremB) and the GL₂-type period comparison. That formula follows, by control at the trivial character, from the ordinary main conjecture in its Skinner–Urban form with Kato’s divisibility. These inputs need residual irreducibility and the residually ramified ℓ||N, and no image containing SL₂(Z_p).
Prototype boundary: The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement. -/
theorem zhang_rank_zero_over_K (p : ℕ) [Fact p.Prime] {R S : Type*} [CommRing R] [AddCommGroup S] [Module R S] (normalizedValue : ℚ_[p]) (valuation : ℚ_[p] → ℕ∞) (tamagawaLength : ℕ∞) : (normalizedValue ≠ 0 ↔ Finite S) ∧ (normalizedValue ≠ 0 → valuation normalizedValue = Module.length R S + tamagawaLength) := by
  sorry

/- HE.6: zhang-jochnowitz-special-value
For g as in Zhang’s Notations satisfying Hypothesis♥, with N− squarefree and ν(N−) even, and an admissible q, the Heegner bottom class is locally nonzero at q iff L^alg(g′/K,1) is a 𝔭′-adic unit. Here g′ is the chosen raised form, Ω_g′^can=〈g′,g′〉_Pet/η_g′(Nq), ξ_g′ is the norm of the integral primitive definite eigenfunction, η_g′,N+,N−q=η_g′(Nq)/ξ_g′, and L^alg=L/Ω^can·η_ratio⁻¹. Its integrality/unit status is proved by the explicit Waldspurger/Gross formula, not built into a definition.
Prototype boundary: The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement. -/
theorem zhang_jochnowitz_special_value {R C : Type*} [CommRing R] [AddCommGroup C] (localClass : C) (normalizedValue : R) : localClass ≠ 0 ↔ IsUnit normalizedValue := by
  sorry

/- HE.6: ribet-takahashi-tamagawa-comparison
For g of weight2 and trivial nebentypus, p≥5 with p∤ND_K and surjective ρ_g,𝔭:G_Q→GL₂(k₀), K as in Zhang’s Notations, N⁻ squarefree of odd prime count, and all three clauses of Hypothesis♥, let η_g(N) be the full-level Hecke congruence ideal generator and ξ_g(N⁺,N⁻) the pairing norm of a primitive integral definite quaternionic eigenfunction. The period ratio is η_g,N⁺,N⁻=η_g(N)/ξ_g(N⁺,N⁻), not the raw congruence ideal. Then v_𝔭(η_g,N⁺,N⁻)=Σ_{ℓ|N⁻}t_g(ℓ), where t_g(ℓ)=length_O𝔭 Φ(A_g/K_ℓ)_𝔭. The identity is RankZeroOneBSD:BSD.3a/definite-congruence-period and is imported. K_ℓ is the unramified quadratic extension of Q_ℓ, since ℓ|N⁻ is inert in K, so t_g(ℓ) is the length of the geometric component group and not of its Q_ℓ-rational points. For nonsquarefree N require Ram(ρ)≠∅ and either a ramified ℓ||N⁻ or at least two primes ℓ||N⁺, as in ♥(2). The last clause does not itself assert residual ramification of both primes. At split additive ℓ²|N⁺, ♥(3) and finite-residue cohomology eliminate the rational component factor; decomposition-invariant vanishing is not inertia-invariant vanishing.
Prototype boundary: The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement. -/
theorem ribet_takahashi_tamagawa_comparison {R : Type*} [CommRing R] (periodRatio : R) (valuation : R → ℕ∞) (tamagawaLength : ℕ∞) : valuation periodRatio = tamagawaLength := by
  sorry

/- HE.6: zhang-triangular-selmer-basis
For g as in Zhang’s Notations with N− squarefree and ν(N−) even, and a nonzero residual Heegner system κ_g satisfying Hypothesis♥, let ν=min{ν(n):c(n)≠0}, ε_ν=w_g(−1)^(ν+1) and B(κ) its base locus of vanishing localizations away from DKNp. The ε_ν Selmer eigenspace has dimension ν+1 and a triangular basis of ν+1 actual c(n_i), detected at selected 2ν+1 auxiliary primes. The opposite eigenspace has dimension ≤ν. Relaxing at the base locus does not enlarge the first eigenspace and preserves that opposite bound.
Prototype boundary: The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement. -/
theorem zhang_triangular_selmer_basis {k C : Type*} [Field k] [AddCommGroup C] [Module k C] (same opposite : Submodule k C) (ν : ℕ) : Module.finrank k same = ν + 1 ∧ Module.finrank k opposite ≤ ν := by
  sorry

/- HE.6: zhang-indivisibility
Assume E/Q conductor N, K imaginary quadratic with gcd(D_K,N)=1, N− squarefree with even number of prime factors, full residual GL₂(F_p) image, p≥5 good ordinary and p∤D_KN. Hypothesis♠ requires residual ramification at every ℓ||N+ and every ℓ|N− with ℓ≡±1 mod p; if N is nonsquarefree require a nonempty Ram set and either a ramified ℓ||N− or at least two factors ℓ||N+. Then c_1(n)≠0 for some squarefree Kolyvagin conductor n, so M∞=0. For the auxiliary GL₂-type forms use the stronger Hypothesis♥, including the additive-prime local invariant vanishing.
Prototype boundary: The suggested signature states the final transport of a nonzero auxiliary localization to the original class family through a supplied localization homomorphism and congruence. Source hypotheses, the level-raised arithmetic carriers and the preceding rank-lowering/nonvanishing induction are omitted. A zero arbitrary class family cannot satisfy those expressible transport hypotheses. The full theorem remains the mathematical target in this statement. -/
theorem zhang_indivisibility {C L : Type*} [AddCommGroup C] [AddCommGroup L]
    (Λ : Set ℕ) (classes : ℕ → C) (loc : C →+ L) (auxiliary : ℕ → L)
    (hcongruence : ∀ n ∈ Λ, loc (classes n) = auxiliary n)
    (hauxiliary : ∃ n ∈ Λ, auxiliary n ≠ 0) : ∃ n ∈ Λ, classes n ≠ 0 := by
  sorry

/- HE.7: non-torsion-point-prime-divisibility
For non-torsion y_K∈E(K), Mordell–Weil finite generation implies y_K∉pE(K) for every prime outside a finite set. This is proved before assuming rank one or a finite Heegner index: project to the free Mordell–Weil quotient and use a nonzero coordinate. Once rank one has been proved, the index of Z·y_K in the free quotient is finite; it is distinct from an index in E(K) that includes rational torsion.
Prototype boundary: The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement. -/
theorem non_torsion_point_prime_divisibility {M : Type*} [AddCommGroup M]
    [AddGroup.FG M] (y : M) (hy : ∀ n : ℕ, 0 < n → n • y ≠ 0) : ∃ excluded : Finset ℕ, ∀ p : ℕ, p.Prime → p ∉ excluded → ¬ ∃ z : M, p • z = y := by
  sorry

/- HE.7: non-cm-open-image-application
For non-CM E/Q, import Serre’s open-image theorem to conclude that Q(E[p])/Q has full GL₂(F_p) image for all but finitely many p, and apply it to the actual Heegner setting. More generally obtain the required uniform cohomological restriction/invariant bounds from the open adelic/Tate image over a number field, retaining the cyclotomic determinant and base-field index. For admissible GL₂-type RM quotients import the precise Ribet big-image variant; do not replan either generic theorem in HE.7.
Prototype boundary: The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement. -/
theorem non_cm_open_image_application {G : Type*} (image : ℕ → Set G) : ∃ excluded : Finset ℕ, ∀ p : ℕ, p.Prime → p ∉ excluded → image p = Set.univ := by
  sorry

/- HE.7: almost-all-primary-sha-vanishing
For the classical non-CM non-torsion Heegner setting, outside a finite set of primes the Gross clean theorem gives Sha(E/K)[p]=0. Since Sha is torsion, this implies Sha(E/K)[p∞]=0: any nonzero p-primary element would yield nonzero p-torsion after taking a suitable p-power multiple. This does not require proving finite p-primary groups first. For CM E use the separate CM-character branch: the uniform integral constants vanish outside a finite set and the finite-level Kummer quotient then forces Sha[p∞]=0. For the specified RM quotients the same reasoning applies at coefficient primes 𝔭; there are finitely many exceptional coefficient primes, not a tacit residual-surjectivity assumption.
Prototype boundary: The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement. -/
theorem almost_all_primary_sha_vanishing {Sha : Type*} [AddCommGroup Sha] : ∃ excluded : Finset ℕ, ∀ p : ℕ, p.Prime → p ∉ excluded → ∀ m : ℕ, ∀ x : Sha, p ^ m • x = 0 → x = 0 := by
  sorry

/- HE.7: bounded-arithmetic-derivative-denominators
Fix F totally real of degree d, B/F ramified at all real places except a chosen τ₁ and at a finite set S_B with #S_B≡d−1 mod2, and an open compact level U⊂B̂×. Let A/F be an F-simple Hecke-linear quotient of J(N_U*) with End_F(A)=O_L, L totally real and [L:Q]=dim A, and fix its nonzero integral quotient map. Let K/F be totally imaginary quadratic, every v∈S_B inert or ramified in K, fix t:K↪B and a CM point x of the specified level over K(x). Use the central quotient N_U*, modular compactification when B=M₂(Q), and the integral cusp/Hodge map ι(P)=m[P]−mδ of Nekovář1.19, with fixed m. Put y=Tr_K(x)/K ι_A(x). Assume y non-torsion and A does not acquire CM over K (Nekovář’s no-CM condition for α=1). For each 𝔭 and each M≫0 with 𝔭^M principal, the actual CM tower supplies integral c(n)∈H¹(K(x),A[𝔭^M]) without requiring vanishing of torsion invariants. At v∤n its image in H¹(K(x)_v,A)[𝔭^M] is an unramified component-group class, killed by 𝔭^C₁,v where C₁,v kills the geometric 𝔭-primary Néron component group. With C₁=max_v C₁,v, κ_n=𝔭^C₁ cor_K(x)/K c(n) satisfies the actual finite Kummer conditions outside n, κ₁=𝔭^C₁δ(y), and its singular localization at ℓ is −Φ_ℓ Fr(ℓ)κ_n/ℓ. C₁ is independent of M,n and zero for almost all 𝔭; cusp/Hodge and quotient denominators are fixed in ι_A. For classical E use its given modular quotient, absorbing the fixed cusp annihilator and isogeny degree. C₂,C₃ bound evaluation errors, not an inverse of restriction.
Prototype boundary: The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement. -/
theorem bounded_arithmetic_derivative_denominators {C : Type*} [AddCommGroup C] (errors : ℕ → AddSubgroup C) : ∃ d : ℕ, 0 < d ∧ ∀ m : ℕ, ∀ x : errors m, d • (x : C) = 0 := by
  sorry

/- HE.7: dyadic-integral-conjugation-descent
Fix F totally real of degree d, B/F ramified at all real places except a chosen τ₁ and at a finite set S_B with #S_B≡d−1 mod2, and an open compact level U⊂B̂×. Let A/F be an F-simple Hecke-linear quotient of J(N_U*) with End_F(A)=O_L, L totally real and [L:Q]=dim A, and fix its nonzero integral quotient map. Let K/F be totally imaginary quadratic, every v∈S_B inert or ramified in K, fix t:K↪B and a CM point x of the specified level over K(x). Use the central quotient N_U*, modular compactification when B=M₂(Q), and the integral cusp/Hodge map ι(P)=m[P]−mδ of Nekovář1.19, with fixed m. Put y=Tr_K(x)/K ι_A(x). Assume y non-torsion and A does not acquire CM over K (Nekovář’s no-CM condition for α=1). The integral two-prime descent applies at every coefficient prime, including 𝔭|2. Write C₀=max{c:y∈A(K)_tors+𝔭^cA(K)}, C₆=v_𝔭(degφ) for a fixed F-polarization, and C₁,C₂,C₃ as above; C₅=v_𝔭[K:K]=0 in this trivial-character part. For M≫0, 2²¹𝔭^(2C₀+2C₁+4C₂+4C₃+C₅+C₆) annihilates Sel(A/K,𝔭^M)/O_𝔭κ₁. Thus B=2C₀+2C₁+4C₂+4C₃+C₆+21v_𝔭(2) is independent of M. Integral (1±ρ) is retained; no decomposition using (1±ρ)/2 is made. All archimedean places of K are complex, so their local H¹ is zero. Any comparison back to a real place of F uses the fixed Tate correction killed by2, as specified in HE.3, rather than an odd-prime invariant argument.
Prototype boundary: The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement. -/
theorem dyadic_integral_conjugation_descent {C : Type*} [AddCommGroup C] (errors : ℕ → AddSubgroup C) : ∃ b : ℕ, ∀ m : ℕ, ∀ x : errors m, (2 ^ b : ℕ) • (x : C) = 0 := by
  sorry

/- HE.7: cm-character-error-descent
For a classical CM E/Q, K as in the CM/Heegner-field node, and non-torsion bottom Heegner point, the two conjugate CM Tate characters over KM verify the integral matrix-algebra and homothety bounds over K. The explicit cocycle classes and the integral two-prime descent give the same uniform exponent B at all rational primes, including 2. C₀,C₁,C₂,C₃,C₆ and v_p2 are zero outside a finite set, so Sha(E/K)[p∞]=0 there. This branch uses the semilinear CM character representation, not Serre’s non-CM GL₂ surjectivity.
Prototype boundary: The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement. -/
theorem cm_character_error_descent {C : Type*} [AddCommGroup C] (errors : ℕ → AddSubgroup C) : ∃ d : ℕ, 0 < d ∧ ∀ m : ℕ, ∀ x : errors m, d • (x : C) = 0 := by
  sorry

/- HE.7: exceptional-primary-sha-bound
Fix F totally real of degree d, B/F ramified at all real places except a chosen τ₁ and at a finite set S_B with #S_B≡d−1 mod2, and an open compact level U⊂B̂×. Let A/F be an F-simple Hecke-linear quotient of J(N_U*) with End_F(A)=O_L, L totally real and [L:Q]=dim A, and fix its nonzero integral quotient map. Let K/F be totally imaginary quadratic, every v∈S_B inert or ramified in K, fix t:K↪B and a CM point x of the specified level over K(x). Use the central quotient N_U*, modular compactification when B=M₂(Q), and the integral cusp/Hodge map ι(P)=m[P]−mδ of Nekovář1.19, with fixed m. Put y=Tr_K(x)/K ι_A(x). Assume y non-torsion and A does not acquire CM over K (Nekovář’s no-CM condition for α=1). For each 𝔭 the finite-level Selmer quotient by κ₁ is killed uniformly by 𝔭^B, with B=2C₀+2C₁+4C₂+4C₃+C₆+21v_𝔭2. Since κ₁ lies in the Kummer image, Sha(A/K)[𝔭^M] is killed by 𝔭^B for every sufficiently large principal M, hence the entire 𝔭-primary group is killed by 𝔭^B. Finite-level Selmer finiteness at this fixed bound makes the primary group finite. The cofinal principal exponents are sufficient; separate finiteness at each M without a uniform B is insufficient.
Prototype boundary: The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement. -/
theorem exceptional_primary_sha_bound {Sha : Type*} [AddCommGroup Sha] (p : ℕ) : ∃ b : ℕ, ∀ m : ℕ, ∀ x : Sha, p ^ m • x = 0 → p ^ b • x = 0 := by
  sorry

/- HE.7: classical-full-sha-finiteness
Let E/Q have a fixed modular quotient X₀(N)→E, K imaginary quadratic with D_K≠−3,−4 and all N-primes split, and y_K=Tr_K[1]/K P₁ of infinite order. Then rank E(K)=1 and the entire Sha(E/K) is finite, including CM E and p=2. The uniform integral Selmer bound gives rank1: the non-torsion Kummer line has finite-index quotient at any coefficient prime; it also gives finite exceptional primary groups and almost-all primary vanishing. The quantitative square-index order theorem is stated separately and is not inferred from this exponent argument.
Prototype boundary: The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement. -/
theorem classical_full_sha_finiteness {V Sha : Type*} [AddCommGroup V] [Module ℚ V] [AddCommGroup Sha] : Module.finrank ℚ V = 1 ∧ Finite Sha := by
  sorry

/- HE.7: admissible-rm-kolyvagin-logachev
Fix F totally real of degree d, B/F ramified at all real places except a chosen τ₁ and at a finite set S_B with #S_B≡d−1 mod2, and an open compact level U⊂B̂×. Let A/F be an F-simple Hecke-linear quotient of J(N_U*) with End_F(A)=O_L, L totally real and [L:Q]=dim A, and fix its nonzero integral quotient map. Let K/F be totally imaginary quadratic, every v∈S_B inert or ramified in K, fix t:K↪B and a CM point x of the specified level over K(x). Use the central quotient N_U*, modular compactification when B=M₂(Q), and the integral cusp/Hodge map ι(P)=m[P]−mδ of Nekovář1.19, with fixed m. Put y=Tr_K(x)/K ι_A(x). Assume y non-torsion and A does not acquire CM over K (Nekovář’s no-CM condition for α=1). Then A(K)/O_Ly is finite, rank_Z A(K)=[L:Q]=dim A, and the entire Sha(A/K) is finite. This is the trivial-character specialization of Nekovář3.2 and includes the specified quaternionic/RM quotients, with field, ramification, central quotient, maximal endomorphism order, Hecke map and integral Hodge normalization stated above. An analytic rank-d conclusion additionally requires a supplier height formula proving this particular y is non-torsion from ord_s=1 L(A/K,s)=d; analytic rank alone is not an input to descent.
Prototype boundary: The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement. -/
theorem admissible_rm_kolyvagin_logachev {V Sha : Type*} [AddCommGroup V] [Module ℚ V] [AddCommGroup Sha] (d : ℕ) : Module.finrank ℚ V = d ∧ Finite Sha := by
  sorry

/- HE.6: heegner-vanishing-order
For the actual residual Heegner family κ={c(n):n∈𝒩}, define ν(κ)=min{#prime divisors of n:n∈𝒩,c(n)≠0}, valued in ℕ∪{∞}, with ν(0)=∞. The count is of distinct primes in the squarefree conductor, not multiplicity or number of nonzero classes. This is Zhang’s finite-residual support invariant, distinguished from the p-adic divisibility sequence M_r and its M∞.
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

/- HE.6: heegner-base-locus
For the actual family and localization maps, B(κ) is the set of primes ℓ∤D_KNp such that loc_ℓc(n)=0 for every n∈𝒩. These are arbitrary good primes, not only Kolyvagin primes. The dependent local cohomology carriers may vary with ℓ. This locus determines exactly which local conditions are relaxed in Zhang Lemma8.4.
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


/- HE.6: zhang-residual-local-pairing
Let g be a weight-two newform of trivial nebentypus, K imaginary quadratic with (D_K,N)=1, N=N⁺N⁻ with N⁻ squarefree of even prime count, and p≥5, p∤ND_K, good ordinary for g. Let k₀ be the finite field generated by the residual Hecke eigenvalues, V its two-dimensional representation, with ρ:G_Q→GL₂(k₀) surjective and A_g[𝔭]≃V⊗k₀k; impose all three clauses of Hypothesis♥. For each inert Kolyvagin prime ℓ∤ND_Kp with a_ℓ≡ℓ+1≡0 mod𝔭, H¹(K_ℓ,V) has dimension4 over k₀, with finite and transverse two-dimensional maximal isotropic subspaces. Each ± conjugation component of either subspace has dimension1, and local Tate duality pairs the same signs perfectly. The pairing V×V→k₀(1) is alternating, G_Q-equivariant; conjugation acts by −1 on its values.
Omitted: the exact CM-point or V/k₀ arithmetic carriers, local conditions and
source-qualified image hypotheses in the full statement above. Existing groups,
modules and linear maps below supply only its indicated algebraic conclusion. -/
theorem zhang_residual_local_pairing {k H : Type*} [Field k]
    [AddCommGroup H] [Module k H] (finite transverse : Submodule k H) :
    Module.finrank k H = 4 ∧ Module.finrank k finite = 2 ∧
      Module.finrank k transverse = 2 := by
  sorry


/- HE.6: zhang-residual-heegner-relations
Let g be a weight-two newform of trivial nebentypus, K imaginary quadratic with (D_K,N)=1, N=N⁺N⁻ with N⁻ squarefree of even prime count, and p≥5, p∤ND_K, good ordinary for g. Let k₀ be the finite field generated by the residual Hecke eigenvalues, V its two-dimensional representation, with ρ:G_Q→GL₂(k₀) surjective and A_g[𝔭]≃V⊗k₀k; impose all three clauses of Hypothesis♥. The actual k₀-rational derivative classes c(n) satisfy c(n)_v∈H¹_fin(K_v,V) for v∤n, c(n)_ℓ∈H¹_tr(K_ℓ,V) for ℓ|n, and c(nℓ)_ℓ=ψ_ℓ(c(n)_ℓ) when ℓ∤n, where ψ_ℓ:H¹_fin≃H¹_tr is the normalized finite/transverse comparison. Conjugation acts on c(n) by ε_n=w_g(−1)^(ν(n)+1), where w_g is Zhang’s root number convention. All bad places and v|p use the actual Kummer condition; the relation is not inferred from Howard’s elliptic full-Tate-image correction.
Omitted: the exact CM-point or V/k₀ arithmetic carriers, local conditions and
source-qualified image hypotheses in the full statement above. Existing groups,
modules and linear maps below supply only its indicated algebraic conclusion. -/
theorem zhang_residual_heegner_relations {C F S : Type*}
    [AddCommGroup C] [AddCommGroup F] [AddCommGroup S]
    (classes : ℕ → C) (locFin : C →+ F) (locSing : C →+ S)
    (ψ : F ≃+ S) (n ℓ : ℕ) : locSing (classes (n * ℓ)) = ψ (locFin (classes n)) := by
  sorry


/- HE.6: zhang-two-class-prime-detection
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


/- HE.6: zhang-prescribed-ramification-class
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


/- HE.7: integral-tate-image-errors
Fix F totally real of degree d, B/F ramified at all real places except a chosen τ₁ and at a finite set S_B with #S_B≡d−1 mod2, and an open compact level U⊂B̂×. Let A/F be an F-simple Hecke-linear quotient of J(N_U*) with End_F(A)=O_L, L totally real and [L:Q]=dim A, and fix its nonzero integral quotient map. Let K/F be totally imaginary quadratic, every v∈S_B inert or ramified in K, fix t:K↪B and a CM point x of the specified level over K(x). Use the central quotient N_U*, modular compactification when B=M₂(Q), and the integral cusp/Hodge map ι(P)=m[P]−mδ of Nekovář1.19, with fixed m. Put y=Tr_K(x)/K ι_A(x). Assume y non-torsion and A does not acquire CM over K (Nekovář’s no-CM condition for α=1). For each coefficient prime 𝔭 of O_L, T=T_𝔭A is free rank2 over O_𝔭. For H_M=K(A[𝔭^M]), there are C₂(𝔭),C₃(𝔭)≥0 independent of M such that restriction H¹(K,A[𝔭^M])→H¹(H_M,A[𝔭^M]) has kernel killed by 𝔭^C₂ and the image of O_𝔭[G_K] in End_O𝔭(T) contains 𝔭^C₃ End_O𝔭(T). Both constants vanish for all but finitely many 𝔭. The image assertion uses absence of CM over K, not absence of geometric CM.
Omitted: the exact CM-point or V/k₀ arithmetic carriers, local conditions and
source-qualified image hypotheses in the full statement above. Existing groups,
modules and linear maps below supply only its indicated algebraic conclusion. -/
theorem integral_tate_image_errors {C : Type*} [AddCommGroup C]
    (p : ℕ) [Fact p.Prime] (restrictionKernels : ℕ → AddSubgroup C)
    (evaluationCokernels : ℕ → AddSubgroup C) :
    ∃ C₂ C₃ : ℕ, (∀ M, ∀ x : restrictionKernels M, (p ^ C₂ : ℕ) • (x : C) = 0) ∧
      (∀ M, ∀ x : evaluationCokernels M, (p ^ C₃ : ℕ) • (x : C) = 0) := by
  sorry


/- HE.7: integral-cm-prime-detection
Fix F totally real of degree d, B/F ramified at all real places except a chosen τ₁ and at a finite set S_B with #S_B≡d−1 mod2, and an open compact level U⊂B̂×. Let A/F be an F-simple Hecke-linear quotient of J(N_U*) with End_F(A)=O_L, L totally real and [L:Q]=dim A, and fix its nonzero integral quotient map. Let K/F be totally imaginary quadratic, every v∈S_B inert or ramified in K, fix t:K↪B and a CM point x of the specified level over K(x). Use the central quotient N_U*, modular compactification when B=M₂(Q), and the integral cusp/Hodge map ι(P)=m[P]−mδ of Nekovář1.19, with fixed m. Put y=Tr_K(x)/K ι_A(x). Assume y non-torsion and A does not acquire CM over K (Nekovář’s no-CM condition for α=1). For M≫0 with 𝔭^M principal, and a finite O_𝔭/𝔭^M-submodule W₀ of H¹(K,A[𝔭^M]), the actual finite Kummer extension over H_M has an evaluation map whose kernel loss is bounded by C₂ and whose evaluation cokernel is killed by 𝔭^C₃. For ρ-stable W₀, conjugation-compatible detection uses integral 1±ρ and factors2,4,16, with loss C₂+C₃+4v_𝔭(2). It supplies inert good primes in S₁(M), excluding any fixed finite set, with the prescribed detections. S₁(M) requires Frobenius conjugate to ρ in K(x)(A[𝔭^(M+M₀)])/F, M₀=v_𝔭(u₀), hence a_ℓ≡0 and Nℓ+1≡0 mod𝔭^(M+M₀).
Omitted: the exact CM-point or V/k₀ arithmetic carriers, local conditions and
source-qualified image hypotheses in the full statement above. Existing groups,
modules and linear maps below supply only its indicated algebraic conclusion. -/
theorem integral_cm_prime_detection {C : Type*} [AddCommGroup C]
    (p M c₀ loss : ℕ) [Fact p.Prime] (c : C)
    (hc : (p ^ (c₀ + loss) : ℕ) • c ≠ 0)
    (Λ : Set ℕ) (excluded : Finset ℕ) (loc : ℕ → C →+ C) :
    ∃ ℓ ∈ Λ, ℓ ∉ excluded ∧ (p ^ c₀ : ℕ) • loc ℓ c ≠ 0 := by
  sorry


/- HE.7: cm-heegner-field-disjointness
Let E/Q have CM by an imaginary quadratic field M, conductor N, and let K be a classical Heegner field in which every prime dividing N splits. Then M≠K, M∩K=Q, and E does not acquire its CM endomorphisms over K. Over KM the coefficient-extension Tate representation splits into the two conjugate CM characters; G_K exchanges them through Gal(KM/K), so the rational representation over K is absolutely irreducible. This verifies Nekovář’s no-CM condition for the trivial character and the matrix-algebra hypothesis of integral descent, although its residual image need not be full GL₂.
Omitted: the exact CM-point or V/k₀ arithmetic carriers, local conditions and
source-qualified image hypotheses in the full statement above. Existing groups,
modules and linear maps below supply only its indicated algebraic conclusion. -/
theorem cm_heegner_field_disjointness (cmDiscriminant heegnerDiscriminant N : ℕ)
    (hcm : cmDiscriminant ∣ N) (hcoprime : Nat.Coprime heegnerDiscriminant N)
    (hramified : 1 < cmDiscriminant) : cmDiscriminant ≠ heegnerDiscriminant := by
  sorry


/- HE.7: classical-square-index-error-bound
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

set_option autoImplicit false

namespace TauCeti.Heegner.Anticyclotomic

-- initial-euler-factor: use σ,σ* as actual group-ring Artin elements. The Boolean
-- chooses the split case; it does not replace the arithmetic splitting condition.
/- HE.8: initial-euler-factor
Mathematical statement: For every permitted n, in ℤ_p[G(n)] with G(n)=Gal(K[n]/K), define Φ=(p+1)²−a_p² if p is inert; if p splits define Φ=(p−a_pσ+σ²)(p−a_pσ*+σ*²), with σ,σ* the specified Artin elements. The augmentation is (p+1−a_p)² in the split case, not necessarily a unit. Keep the finite ring-class group, its Artin action and the initial unit index; it differs from Howard’s first-step degree group Δ=(O_K/pO_K)×/(ℤ/pℤ)×.
Hypotheses: E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p. T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used.
The actual arithmetic identifications and hypotheses above are omitted in this prototype. Supplied maps, modules, ideals and indices must be those of the stated arithmetic suppliers; this is an admitted interface, not a formal proof. -/
def initialFactor {R : Type*} [CommRing R] (split : Bool) (p : ℕ)
    (ap σ σstar : R) : R := by
  sorry

theorem initialFactor_inert {R : Type*} [CommRing R] (p : ℕ) (ap σ σstar : R) :
    initialFactor false p ap σ σstar = ((p : R) + 1)^2 - ap^2 := by
  sorry

theorem initialFactor_split {R : Type*} [CommRing R] (p : ℕ) (ap σ σstar : R) :
    initialFactor true p ap σ σstar =
      ((p : R) - ap * σ + σ^2) * ((p : R) - ap * σstar + σstar^2) := by
  sorry

theorem initialFactor_augmentation {R : Type*} [CommRing R] (p : ℕ) (ap : R) :
    initialFactor true p ap 1 1 = ((p : R) + 1 - ap)^2 := by
  sorry

theorem initialFactor_natural {R R' : Type*} [CommRing R] [CommRing R']
    (f : R →+* R') (split : Bool) (p : ℕ) (ap σ σstar : R) :
    f (initialFactor split p ap σ σstar) =
      initialFactor split p (f ap) (f σ) (f σstar) := by
  sorry

-- initialFactor_split_anomalous
example [Fact (Nat.Prime 5)] : initialFactor true 5 (1 : ℤ_[5]) 1 1 = 25 ∧
    ¬ IsUnit (initialFactor true 5 (1 : ℤ_[5]) 1 1) := by
  sorry
-- initialFactor_inert_value
example : initialFactor false 5 (1 : ℤ) 1 1 = 35 ∧
    initialFactor false 5 (1 : ℤ) 1 1 ≠ initialFactor true 5 (1 : ℤ) 1 1 := by
  sorry
-- initialFactor_reciprocity: compatible involution on the actual group ring.
example {R : Type*} [CommRing R] (ι : R ≃+* R) (p : ℕ) (ap σ σstar : R)
    (hap : ι ap = ap) :
    ι (initialFactor true p ap σ σstar) = initialFactor true p ap (ι σ) (ι σstar) := by
  sorry

-- ordinary-stabilized-point: raw[k] is supplied P[p^k] after compatible maps into
-- the chosen ambient point-completion. initial is the separate corrected P[1].
/- HE.8: ordinary-stabilized-point
Mathematical statement: Let α_p∈ℤ_p× be the unit root of X²−a_pX+p and β_p=p/α_p. For k≥1 put P[p^k]_α=P[p^k]−α_p⁻¹P[p^(k−1)] and scale by α_p⁻k. At k=0 use u_K⁻¹(1−α_p⁻¹σ)(1−α_p⁻¹σ*)P[1] in the split case and u_K⁻¹(1−α_p⁻²)P[1] in the inert case. Trace to K_k with the actual smallest d(k) such that K_k⊂K[p^d(k)], including p-primary class-number shifts.
Hypotheses: E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p. T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used. E(K)[p]=0.
The actual arithmetic identifications and hypotheses above are omitted in this prototype. Supplied maps, modules, ideals and indices must be those of the stated arithmetic suppliers; this is an admitted interface, not a formal proof. -/
def stabilizedPoint {R M : Type*} [CommRing R] [AddCommGroup M] [Module R M]
    (α : Rˣ) (raw : ℕ → M) (initial : M) (k : ℕ) : M := by
  sorry

theorem stabilizedPoint_succ {R M : Type*} [CommRing R] [AddCommGroup M] [Module R M]
    (α : Rˣ) (raw : ℕ → M) (initial : M) (k : ℕ) :
    stabilizedPoint α raw initial (k+1) =
      ((↑(α⁻¹) : R)^(k+1)) • (raw (k+1) - (↑(α⁻¹) : R) • raw k) := by
  sorry

theorem stabilizedPoint_map {R M M' : Type*} [CommRing R] [AddCommGroup M]
    [AddCommGroup M'] [Module R M] [Module R M'] (f : M →ₗ[R] M')
    (α : Rˣ) (raw : ℕ → M) (initial : M) (k : ℕ) :
    f (stabilizedPoint α raw initial k) =
      stabilizedPoint α (fun j => f (raw j)) (f initial) k := by
  sorry

theorem stabilizedPoint_change_unit {R M : Type*} [CommRing R] [AddCommGroup M]
    [Module R M] (a α : Rˣ) (raw : ℕ → M) (initial : M) (k : ℕ) :
    stabilizedPoint α (fun j => (a : R) • raw j) ((a : R) • initial) k =
      (a : R) • stabilizedPoint α raw initial k := by
  sorry

theorem stabilizedPoint_initial {R M : Type*} [CommRing R] [AddCommGroup M]
    [Module R M] (α : Rˣ) (raw : ℕ → M) (initial : M) :
    stabilizedPoint α raw initial 0 = initial := by
  sorry

-- stabilizedPoint_zero
example {R M : Type*} [CommRing R] [AddCommGroup M] [Module R M] (α : Rˣ) (k : ℕ) :
    stabilizedPoint α (fun _ => (0 : M)) 0 k = 0 := by
  sorry
-- stabilizedPoint_predecessor
example : stabilizedPoint (Units.mk0 (2 : ℚ) (by sorry))
    (fun k => if k = 0 then (2 : ℚ) else 4) 0 1 = (3/2 : ℚ) := by
  sorry
-- stabilizedPoint_first_level
example {R M : Type*} [CommRing R] [AddCommGroup M] [Module R M]
    (α : Rˣ) (raw : ℕ → M) (corrected : M) :
    stabilizedPoint α raw corrected 0 = corrected := by
  sorry

-- The conductor index I and permitted-edge index J come from the arithmetic
-- supplier. An edge j has source n and target nℓ; it is not an arbitrary prime.
-- L i is the supplier's actual compact inverse-limit group at conductor i.
-- Finite solvability is a concrete hypothesis, to be proved using Howard's
-- common free presentation. No global lift or desired theorem is a Prop field.
section UniversalNormFamily
variable {I J : Type*} {P L : I → Type*}
    [∀ i, AddCommGroup (P i)] [∀ i, AddCommGroup (L i)]
    [∀ i, TopologicalSpace (P i)] [instPT2 : ∀ i, T2Space (P i)]
    [∀ i, TopologicalSpace (L i)] [instLT2 : ∀ i, T2Space (L i)]
    [instLTopAdd : ∀ i, IsTopologicalAddGroup (L i)] [instLCompact : ∀ i, CompactSpace (L i)]
variable (source target : J → I) (Φ : ∀ i, P i →+ P i) (point : ∀ i, P i)
    (π : ∀ i, L i →+ P i) (tr : ∀ j, L (target j) →+ L (source j)) (a : J → ℤ)
    (hπ : ∀ i, Continuous (π i)) (htr : ∀ j, Continuous (tr j))
    (hfinite : ∀ s : Finset I, ∀ t : Finset J, ∃ q : ∀ i, L i,
      (∀ i ∈ s, π i (q i) = Φ i (point i)) ∧
      (∀ j ∈ t, tr j (q (target j)) = a j • q (source j)))

/- HE.8: compact-universal-norm-lift
Mathematical statement: For the actual compact Hausdorff inverse-limit groups L[n], fix the continuous bottom projections π[n], prescribed values Φ[n]P[n], permitted conductor edges j, continuous auxiliary traces tr[j] and integer scalars a[j]. If every finite list of bottom equations π[n]q[n]=Φ[n]P[n] and auxiliary equations tr[j]q[target j]=a[j]q[source j] has a common solution, there is a family q satisfying every equation. This packages the arithmetic constraint application of existing compactness; it does not re-plan the generic inverse-limit or Tychonoff theory.
Hypotheses: The indices and actual groups/maps are those of the ordinary Heegner tower; all L[n] are compact Hausdorff topological additive groups, all initial groups P[n] are Hausdorff, and π[n] and tr[j] are continuous. Every finite list of the two kinds of constraints is simultaneously solvable. Howard’s common free presentation and its compatible conductor maps establish this arithmetic input; CGLS uses the actual class-number shifts.
The actual arithmetic identifications are omitted in this prototype. The displayed topology, finite constraint solvability, transition square and raw norm recurrence, where applicable, are retained as explicit hypotheses. -/
include instPT2 instLT2 instLTopAdd instLCompact hπ htr hfinite in
theorem universalNormFamily_exists : ∃ q : ∀ i, L i,
    (∀ i, π i (q i) = Φ i (point i)) ∧
    (∀ j, tr j (q (target j)) = a j • q (source j)) := by
  sorry

/- HE.8: universal-norm-heegner-family
Mathematical statement: Under the ordinary Heegner conditions and E(K)[p]=0, construct Q[n] in lim_k H_k[n], the inverse limit of the ℤ_p[Gal(K_k[n]/K)]-modules generated by P[n] and P_j[n]. Its level-zero projection is ΦP[n], and Cor_(K∞[nℓ]/K∞[n])Q[nℓ]=a_ℓQ[n] for every permitted auxiliary ℓ. Choices arise from compactness, not uniqueness. Howard proves this under full G_K image and p∤h_K; CGLS Theorem 4.1.1 gives the weaker construction with the actual class-number conductor shifts, without extending Howard’s divisibility theorem. The construction takes these fixed maps and scalars together with finite solvability; its APIs use the same data. For actual level projections pr[n,k] and transitions cor[n,k], require cor[n,k]∘pr[n,k+1]=pr[n,k]. Differences between two choices with these same bottom and auxiliary constraints have zero bottom projection and obey tr[j](Q[target j]−Q′[target j])=a[j](Q[source j]−Q′[source j]).
Hypotheses: E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p. T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used. E(K)[p]=0. The conductor index I and permitted auxiliary-edge index J, their source/target maps, actual compact Hausdorff inverse-limit groups L[n], initial groups P[n], continuous bottom projections π[n], Artin-factor actions Φ[n], points P[n], continuous auxiliary traces tr[j], and scalars a[j] are fixed before choosing the family. Every finite list of bottom and auxiliary constraints has a simultaneous solution, as established by the common free-presentation argument; no uniqueness or surjectivity of arbitrary projections is assumed.
The actual arithmetic identifications are omitted in this prototype. The displayed topology, finite constraint solvability, transition square and raw norm recurrence, where applicable, are retained as explicit hypotheses. -/
def universalNormFamily : ∀ i, L i :=
  Classical.choose (universalNormFamily_exists source target Φ point π tr a hπ htr hfinite)

theorem universalNormFamily_level_zero (i : I) :
    π i (universalNormFamily source target Φ point π tr a hπ htr hfinite i) =
      Φ i (point i) := by
  sorry

/- HE.8: universal-norm-auxiliary-trace
Auxiliary constraint of the same chosen family, shared with the construction API.
Howard Lemma 2.3.3, PDF pp.29–30; CGLS Theorem 4.1.1, PDF pp.27–28. -/
theorem universalNormFamily_trace (j : J) :
    tr j (universalNormFamily source target Φ point π tr a hπ htr hfinite (target j)) =
      a j • universalNormFamily source target Φ point π tr a hπ htr hfinite (source j) := by
  sorry

theorem universalNormFamily_corestriction {M : I → ℕ → Type*}
    [∀ i k, AddCommGroup (M i k)]
    (proj : ∀ i k, L i →+ M i k) (cor : ∀ i k, M i (k+1) →+ M i k)
    (htransition : ∀ i k, (cor i k).comp (proj i (k+1)) = proj i k) (i : I) (k : ℕ) :
    cor i k (proj i (k+1)
      (universalNormFamily source target Φ point π tr a hπ htr hfinite i)) =
      proj i k (universalNormFamily source target Φ point π tr a hπ htr hfinite i) := by
  sorry
end UniversalNormFamily

-- Differences satisfy BOTH homogeneous constraints, for the same fixed data.
theorem universalNormFamily_choice {I J : Type*} {P L : I → Type*}
    [∀ i, AddCommGroup (P i)] [∀ i, AddCommGroup (L i)]
    (source target : J → I) (π : ∀ i, L i →+ P i)
    (tr : ∀ j, L (target j) →+ L (source j)) (a : J → ℤ) (q q' : ∀ i, L i)
    (hbottom : ∀ i, π i (q i) = π i (q' i))
    (hq : ∀ j, tr j (q (target j)) = a j • q (source j))
    (hq' : ∀ j, tr j (q' (target j)) = a j • q' (source j)) :
    (∀ i, π i (q i - q' i) = 0) ∧
    (∀ j, tr j (q (target j) - q' (target j)) = a j • (q (source j) - q' (source j))) := by
  sorry

-- universalNormFamily_bottom: a finite compact example with Φ=5, π=id.
example : universalNormFamily (I := Unit) (P := fun _ => ZMod 7) (L := fun _ => ZMod 7)
    (fun j : Empty => j.elim) (fun j : Empty => j.elim)
    (fun _ => 5 • AddMonoidHom.id (ZMod 7)) (fun _ => 1)
    (fun _ => AddMonoidHom.id (ZMod 7)) (fun j : Empty => j.elim)
    (fun j : Empty => j.elim) (by sorry) (by sorry) (by sorry) () = 5 := by
  sorry

-- universalNormFamily_auxiliary: fixed permitted edge, with its scalar zero.
example {I J : Type*} {P L : I → Type*}
    [∀ i, AddCommGroup (P i)] [∀ i, AddCommGroup (L i)]
    [∀ i, TopologicalSpace (P i)] [∀ i, T2Space (P i)]
    [∀ i, TopologicalSpace (L i)] [∀ i, T2Space (L i)]
    [∀ i, IsTopologicalAddGroup (L i)] [∀ i, CompactSpace (L i)]
    (source target : J → I) (Φ : ∀ i, P i →+ P i) (point : ∀ i, P i)
    (π : ∀ i, L i →+ P i) (tr : ∀ j, L (target j) →+ L (source j)) (a : J → ℤ)
    (hπ : ∀ i, Continuous (π i)) (htr : ∀ j, Continuous (tr j))
    (hfinite : ∀ s : Finset I, ∀ t : Finset J, ∃ q : ∀ i, L i,
      (∀ i ∈ s, π i (q i) = Φ i (point i)) ∧
      (∀ j ∈ t, tr j (q (target j)) = a j • q (source j)))
    (j : J) (ha : a j = 0) :
    tr j (universalNormFamily source target Φ point π tr a hπ htr hfinite (target j)) = 0 := by
  sorry

-- universalNormFamily_nonunique: two actual feasible families in a compact group;
-- π=0, bottom=0, tr=id, a=1, with one self-edge. Their difference obeys both laws.
example : let q : Unit → ZMod 2 := fun _ => 0
    let q' : Unit → ZMod 2 := fun _ => 1
    q ≠ q' ∧
    ((∀ i, (0 : ZMod 2 →+ ZMod 2) (q i) = 0) ∧ (∀ i, q i = (1 : ℤ) • q i)) ∧
    ((∀ i, (0 : ZMod 2 →+ ZMod 2) (q' i) = 0) ∧ (∀ i, q' i = (1 : ℤ) • q' i)) ∧
    ((∀ i, (0 : ZMod 2 →+ ZMod 2) (q i - q' i) = 0) ∧
      (∀ i, q i - q' i = (1 : ℤ) • (q i - q' i))) := by
  sorry

-- universalNormFamily_impossible_bottom: π=0, ΦP=1 data fail even
-- the one-bottom finite-solvability obligation, so the constructor cannot take them.
example : ¬ ∃ q : Unit → ZMod 7,
    ∀ i ∈ ({()} : Finset Unit), (0 : ZMod 7 →+ ZMod 7) (q i) = 1 := by
  sorry

-- universalNormFamily_incompatible_auxiliary: the one-bottom/one-edge finite
-- constraints fail for π=id, bottom=1, tr=id and a=0.
example : ¬ ∃ q : Unit → ZMod 7,
    (∀ i ∈ ({()} : Finset Unit), (AddMonoidHom.id (ZMod 7)) (q i) = 1) ∧
    (∀ j ∈ ({()} : Finset Unit), (AddMonoidHom.id (ZMod 7)) (q j) = (0 : ℤ) • q j) := by
  sorry

-- anticyclotomic-heegner-class: L is the actual norm-compatible Kummer limit,
-- C is actual continuous Iwasawa cohomology and shapiro the supplier comparison.
/- HE.8: anticyclotomic-heegner-class
Mathematical statement: Apply the integral Kummer map to the stabilized norm-compatible points and the imported Iwasawa–Shapiro comparison to obtain y∞∈H¹_Iw(K∞/K,T)=H¹_cont(K,T⊗Λ(tautological inverse)). The actual tower class lies in the specified ordinary Selmer structure. Its projection to level k is the Kummer class of y_k. There is no assertion that each character specialization is nonzero.
Hypotheses: E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p. T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used. E(K)[p]=0.
The actual arithmetic identifications and hypotheses above are omitted in this prototype. Supplied maps, modules, ideals and indices must be those of the stated arithmetic suppliers; this is an admitted interface, not a formal proof. -/
def heegnerIwasawaClass {L C : Type*} [AddCommGroup L] [AddCommGroup C]
    (shapiro : L ≃+ C) (q : L) : C := by
  sorry

theorem heegnerIwasawaClass_level {L C Ck : Type*} [AddCommGroup L]
    [AddCommGroup C] [AddCommGroup Ck] (e : L ≃+ C) (q : L)
    (proj : C →+ Ck) (level : L →+ Ck) (h : ∀ x, proj (e x) = level x) :
    proj (heegnerIwasawaClass e q) = level q := by
  sorry

theorem heegnerIwasawaClass_scalar {R L C : Type*} [CommRing R]
    [AddCommGroup L] [AddCommGroup C] [Module R L] [Module R C]
    (e : L ≃ₗ[R] C) (a : R) (q : L) :
    heegnerIwasawaClass e.toAddEquiv (a • q) = a • heegnerIwasawaClass e.toAddEquiv q := by
  sorry

theorem heegnerIwasawaClass_restrict {L C L' C' : Type*}
    [AddCommGroup L] [AddCommGroup C] [AddCommGroup L'] [AddCommGroup C']
    (e : L ≃+ C) (e' : L' ≃+ C') (norm : L →+ L') (cor : C →+ C')
    (h : ∀ x, cor (e x) = e' (norm x)) (q : L) :
    cor (heegnerIwasawaClass e q) = heegnerIwasawaClass e' (norm q) := by
  sorry

theorem heegnerIwasawaClass_zero {L C : Type*} [AddCommGroup L] [AddCommGroup C]
    (e : L ≃+ C) : heegnerIwasawaClass e 0 = 0 := by
  sorry

-- heegnerIwasawaClass_trace: level projection is supplied by the actual trace.
example {L C M : Type*} [AddCommGroup L] [AddCommGroup C] [AddCommGroup M]
    (e : L ≃+ C) (q : L) (trace : L →+ M) (proj : C →+ M)
    (h : ∀ x, proj (e x) = trace x) : proj (heegnerIwasawaClass e q) = trace q := by
  sorry
-- heegnerIwasawaClass_isogeny
example : heegnerIwasawaClass (AddEquiv.refl ℤ) (5 * 1) = 5 ∧
    heegnerIwasawaClass (AddEquiv.refl ℤ) (5 * 1) ≠ heegnerIwasawaClass (AddEquiv.refl ℤ) 1 := by
  sorry
-- heegnerIwasawaClass_nonzero_not_all_specializations
example :
    heegnerIwasawaClass (AddEquiv.refl (ℤ × ℤ)) (1, 0) ≠ 0 ∧
    (heegnerIwasawaClass (AddEquiv.refl (ℤ × ℤ)) (1, 0)).2 = 0 := by
  sorry

-- cm-character-stratum: A is the supplied character-value group, generally ℂˣ.
-- π is the preceding quotient, tors embeds G₀, χ₀ is the fixed torsion type.
/- HE.8: cm-character-stratum
Mathematical statement: For the imported relative ring-class tower G∞ with finite torsion G₀, define P(n,χ₀) as the finite-order characters of G(n) restricting to χ₀ on G₀ and not factoring through G(n−1). The character satisfies χ₀ω=1 on the embedded A_F×. Conductor is the largest F-ideal in the order, and primitivity is exact level, not merely conductor dividing P^n. Small n before G₀ embeds are excluded.
Hypotheses: F totally real, K/F CM, P a finite prime; n is large enough to identify G₀ in G(n).
The actual arithmetic identifications and hypotheses above are omitted in this prototype. Supplied maps, modules, ideals and indices must be those of the stated arithmetic suppliers; this is an admitted interface, not a formal proof. -/
def cmCharacterStratum {G H G0 A : Type*} [Group G] [Group H] [Group G0] [CommGroup A]
    (π : G →* H) (tors : G0 →* G) (χ0 : G0 →* A) : Set (G →* A) := by
  sorry

theorem cmCharacterStratum_mem {G H G0 A : Type*}
    [Group G] [Group H] [Group G0] [CommGroup A]
    (π : G →* H) (tors : G0 →* G) (χ0 : G0 →* A) (χ : G →* A) :
    χ ∈ cmCharacterStratum π tors χ0 ↔ χ.comp tors = χ0 ∧
      ¬ ∃ ψ : H →* A, ψ.comp π = χ := by
  sorry

theorem cmCharacterStratum_torsion {G H G0 A : Type*}
    [Group G] [Group H] [Group G0] [CommGroup A]
    (π : G →* H) (tors : G0 →* G) (χ0 : G0 →* A) (χ : G →* A)
    (h : χ ∈ cmCharacterStratum π tors χ0) : χ.comp tors = χ0 := by
  sorry

theorem cmCharacterStratum_not_old {G H G0 A : Type*}
    [Group G] [Group H] [Group G0] [CommGroup A]
    (π : G →* H) (tors : G0 →* G) (χ0 : G0 →* A) (ψ : H →* A) :
    ψ.comp π ∉ cmCharacterStratum π tors χ0 := by
  sorry

theorem cmCharacterStratum_transport {G H G0 G' H' G0' A : Type*}
    [Group G] [Group H] [Group G0] [Group G'] [Group H'] [Group G0'] [CommGroup A]
    (π : G →* H) (tors : G0 →* G) (χ0 : G0 →* A)
    (π' : G' →* H') (tors' : G0' →* G') (eG : G ≃* G') (eH : H ≃* H')
    (e0 : G0 ≃* G0') (hπ : ∀ g, π' (eG g) = eH (π g))
    (htors : ∀ g, tors' (e0 g) = eG (tors g)) (χ : G →* A) :
    χ.comp eG.symm.toMonoidHom ∈ cmCharacterStratum π' tors'
      (χ0.comp e0.symm.toMonoidHom) ↔ χ ∈ cmCharacterStratum π tors χ0 := by
  sorry

-- cmCharacterStratum_identity_quotient
example {G G0 A : Type*} [Group G] [Group G0] [CommGroup A]
    (tors : G0 →* G) (χ0 : G0 →* A) :
    cmCharacterStratum (MonoidHom.id G) tors χ0 = ∅ := by
  sorry
-- cmCharacterStratum_wrong_torsion
example {G H G0 A : Type*} [Group G] [Group H] [Group G0] [CommGroup A]
    (π : G →* H) (tors : G0 →* G) (χ0 : G0 →* A) (χ : G →* A)
    (h : χ.comp tors ≠ χ0) : χ ∉ cmCharacterStratum π tors χ0 := by
  sorry
-- cmCharacterStratum_first_nontrivial: use C₂=the units of ℤ, {±1}.
example : (MonoidHom.id ℤˣ) ∈ cmCharacterStratum (1 : ℤˣ →* Unit)
    (1 : Unit →* ℤˣ) (1 : Unit →* ℤˣ) := by
  sorry

-- lambda-heegner-derivative-class: no general derivative definition is recreated.
-- D is the actual ES.3 arithmetic derivative+Kummer map; resInv is the actual
-- continuous-cohomology restriction equivalence, after invariant vanishing.
/- HE.8: lambda-heegner-derivative-class
Mathematical statement: For each squarefree allowed n, apply the imported derivative operator to Q[n] (or the normalized ordinary family), sum the finite ring-class torsion orbit, and descend its invariant Kummer class through the actual restriction isomorphism. Obtain κ^Λ_n in the generic Λ-adic Kolyvagin-system coefficient. Preserve the cyclic-Galois tensor and the finite/singular correction maps; the bottom is the specified Heegner Λ-line.
Hypotheses: E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p. T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used. E(K)[p]=0.
The actual arithmetic identifications and hypotheses above are omitted in this prototype. Supplied maps, modules, ideals and indices must be those of the stated arithmetic suppliers; this is an admitted interface, not a formal proof. -/
def lambdaDerivativeClass {L C I : Type*} [AddCommGroup L] [AddCommGroup C]
    [AddCommGroup I] (resInv : C ≃+ I) (D : L →+ I) (q : L) : C := by
  sorry

theorem lambdaDerivativeClass_restrict {L C I : Type*} [AddCommGroup L]
    [AddCommGroup C] [AddCommGroup I] (e : C ≃+ I) (D : L →+ I) (q : L) :
    e (lambdaDerivativeClass e D q) = D q := by
  sorry

theorem lambdaDerivativeClass_generator {R L C I : Type*} [CommRing R]
    [AddCommGroup L] [AddCommGroup C] [AddCommGroup I]
    [Module R L] [Module R C] [Module R I]
    (e : C ≃ₗ[R] I) (D : L →ₗ[R] I) (a : Rˣ) (q : L) :
    lambdaDerivativeClass e.toAddEquiv (((a : R) • D).toAddMonoidHom) q =
      (a : R) • lambdaDerivativeClass e.toAddEquiv D.toAddMonoidHom q := by
  sorry

theorem lambdaDerivativeClass_coefficients {L C I C' I' : Type*}
    [AddCommGroup L] [AddCommGroup C] [AddCommGroup I]
    [AddCommGroup C'] [AddCommGroup I'] (e : C ≃+ I) (e' : C' ≃+ I')
    (D : L →+ I) (D' : L →+ I') (f : C →+ C') (g : I →+ I')
    (he : ∀ c, e' (f c) = g (e c)) (hD : ∀ q, D' q = g (D q)) (q : L) :
    f (lambdaDerivativeClass e D q) = lambdaDerivativeClass e' D' q := by
  sorry

theorem lambdaDerivativeClass_bottom {C : Type*} [AddCommGroup C] (q : C) :
    lambdaDerivativeClass (AddEquiv.refl C) (AddMonoidHom.id C) q = q := by
  sorry

-- lambdaDerivativeClass_empty
example {C : Type*} [AddCommGroup C] (q : C) :
    lambdaDerivativeClass (AddEquiv.refl C) (AddMonoidHom.id C) q = q := by
  sorry
-- lambdaDerivativeClass_zero
example {L C I : Type*} [AddCommGroup L] [AddCommGroup C] [AddCommGroup I]
    (e : C ≃+ I) (D : L →+ I) : lambdaDerivativeClass e D 0 = 0 := by
  sorry
-- lambdaDerivativeClass_restriction_obstruction
example : (0 : ℤ) ≠ 1 ∧ (0 : ℤ →+ ℤ) 0 = (0 : ℤ →+ ℤ) 1 := by
  sorry

-- crystalline-near-trivial-character: ξ is supplied with ξ(γ)=u and infinity
-- type(h,−h). Continuity, crystallinity, congruence and non-torsion are omitted.
/- HE.8: crystalline-near-trivial-character
Mathematical statement: Choose γ∈Γ, a p-adic unit u generating the prescribed subgroup, and h with γ^h equal to its Artin image. Let ξ_n(γ)=u^n have infinity type (hn,−hn). For m≥1 define α_m=ξ_(p−1)p^(m−1); these are nontrivial crystalline anticyclotomic characters congruent to1 modulo p^m and approach1. Retain h and the chosen embeddings. No finite-order character is substituted for these crystalline twists.
Hypotheses: E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p. T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used. E(K)[p]=0. p splits as v v̄ in K.
The actual arithmetic identifications and hypotheses above are omitted in this prototype. Supplied maps, modules, ideals and indices must be those of the stated arithmetic suppliers; this is an admitted interface, not a formal proof. -/
def nearTrivialCharacter {G A : Type*} [Group G] [CommGroup A]
    (ξ : G →* A) (p m : ℕ) : G →* A := by
  sorry

theorem nearTrivialCharacter_apply {G A : Type*} [Group G] [CommGroup A]
    (ξ : G →* A) (p m : ℕ) (g : G) :
    nearTrivialCharacter ξ p m g = ξ g ^ ((p-1)*p^(m-1)) := by
  sorry

theorem nearTrivialCharacter_succ {G A : Type*} [Group G] [CommGroup A]
    (ξ : G →* A) (p m : ℕ) (hm : 1 ≤ m) :
    nearTrivialCharacter ξ p (m+1) = nearTrivialCharacter ξ p m ^ p := by
  sorry

theorem nearTrivialCharacter_congruent (p m : ℕ) [Fact p.Prime]
    (ξ : Multiplicative ℤ →* (ℤ_[p])ˣ) (hm : 1 ≤ m) :
    (↑(nearTrivialCharacter ξ p m (Multiplicative.ofAdd 1)) : ℤ_[p]) - 1 ∈
      Ideal.span ({((p : ℤ_[p])^m)} : Set ℤ_[p]) := by
  sorry

theorem nearTrivialCharacter_nontrivial {G A : Type*} [Group G] [CommGroup A]
    (ξ : G →* A) (g : G) (h : ∀ n : ℕ, 0 < n → ξ g ^ n ≠ 1)
    (p m : ℕ) (hp : 1 < p) (hm : 1 ≤ m) : nearTrivialCharacter ξ p m ≠ 1 := by
  sorry

-- nearTrivialCharacter_first
example {G A : Type*} [Group G] [CommGroup A] (ξ : G →* A) :
    nearTrivialCharacter ξ 5 1 = ξ^4 := by
  sorry
-- nearTrivialCharacter_next
example {G A : Type*} [Group G] [CommGroup A] (ξ : G →* A) :
    nearTrivialCharacter ξ 5 2 = ξ^20 := by
  sorry
-- nearTrivialCharacter_torsion_counterexample
example {G A : Type*} [Group G] [CommGroup A] (ξ : G →* A)
    (h : ξ^4 = 1) : nearTrivialCharacter ξ 5 1 = 1 := by
  sorry

-- heegner-divisibility-profile: supplied index is the ES.4 index on actual
-- coefficient classes, with zero↦∞; degree counts auxiliary prime support.
/- HE.8: heegner-divisibility-profile
Mathematical statement: For the actual finite Heegner derivative system define M_r=min_(ν(n)=r) ind(κ_n), with values in ℕ∪{∞}; ind is the largest allowed p-divisibility in the coefficient module, and ind(0)=∞. Set M∞=inf_r M_r. Prime restrictions, coefficient ideals I_n and p-optimal parametrization are part of the data. M_0 is the bottom Heegner index and need not equal M∞.
Hypotheses: E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p. T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used. E(K)[p]=0.
The actual arithmetic identifications and hypotheses above are omitted in this prototype. Supplied maps, modules, ideals and indices must be those of the stated arithmetic suppliers; this is an admitted interface, not a formal proof. -/
def heegnerDivisibilityProfile (index : ℕ → ℕ∞) (degree : ℕ → ℕ)
    (allowed : Set ℕ) (r : ℕ) : ℕ∞ := by
  sorry

theorem heegnerDivisibilityProfile_at (index : ℕ → ℕ∞) (degree : ℕ → ℕ)
    (allowed : Set ℕ) (r : ℕ) :
    heegnerDivisibilityProfile index degree allowed r =
      sInf {v | ∃ n ∈ allowed, degree n = r ∧ index n = v} := by
  sorry

theorem heegnerDivisibilityProfile_bottom (index : ℕ → ℕ∞) (degree : ℕ → ℕ)
    (allowed : Set ℕ) (h1 : 1 ∈ allowed) (hdeg : degree 1 = 0)
    (h : ∀ n ∈ allowed, degree n = 0 → n = 1) :
    heegnerDivisibilityProfile index degree allowed 0 = index 1 := by
  sorry

theorem heegnerDivisibilityProfile_top (index : ℕ → ℕ∞) (degree : ℕ → ℕ)
    (allowed : Set ℕ) (r : ℕ) :
    heegnerDivisibilityProfile index degree allowed r = ⊤ ↔
      ∀ n ∈ allowed, degree n = r → index n = ⊤ := by
  sorry

theorem heegnerDivisibilityProfile_rescale (index : ℕ → ℕ∞) (degree : ℕ → ℕ)
    (allowed : Set ℕ) (r t : ℕ) (hne : ∃ n ∈ allowed, degree n = r) :
    heegnerDivisibilityProfile (fun n => (t : ℕ∞) + index n) degree allowed r =
      (t : ℕ∞) + heegnerDivisibilityProfile index degree allowed r := by
  sorry

-- heegnerDivisibilityProfile_zero
example (degree : ℕ → ℕ) (allowed : Set ℕ) (r : ℕ) :
    heegnerDivisibilityProfile (fun _ => ⊤) degree allowed r = ⊤ := by
  sorry
-- heegnerDivisibilityProfile_bottom_vs_infimum
example : heegnerDivisibilityProfile (fun n => if n = 1 then 3 else 1)
    (fun n => if n = 1 then 0 else 1) {1,2} 0 = 3 ∧
    heegnerDivisibilityProfile (fun n => if n = 1 then 3 else 1)
    (fun n => if n = 1 then 0 else 1) {1,2} 1 = 1 := by
  sorry
-- heegnerDivisibilityProfile_sum_not_max
example : heegnerDivisibilityProfile (fun n => if n = 1 then 2 else 5)
    (fun _ => 1) {1,2} 1 = 2 := by
  sorry

-- determinantal-heegner-element: D is the supplier's RATIONAL determinant line;
-- the second module is already the ι-twist and iy is its transported Heegner point.
/- HE.8: determinantal-heegner-element
Mathematical statement: Under the source’s rank-one and perfectness assumptions, use the canonical rational isomorphism Q(Λ)⊗det_Λ⁻¹ RΓ̃_f(K,T⊗Λ) ≃ Q(Λ)⊗(S⊗_Λ S^ι). Define z̃∞ as the inverse image of y∞⊗y∞ under this isomorphism. The main conjecture asserts z̃∞ generates the integral determinant lattice, not merely its rationalization.
Hypotheses: E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p. T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used. E(K)[p]=0. p unramified in K; the source’s rational determinant comparison.
The actual arithmetic identifications and hypotheses above are omitted in this prototype. Supplied maps, modules, ideals and indices must be those of the stated arithmetic suppliers; this is an admitted interface, not a formal proof. -/
def determinantalHeegnerElement {R D S Sι : Type*} [CommRing R]
    [AddCommGroup D] [AddCommGroup S] [AddCommGroup Sι]
    [Module R D] [Module R S] [Module R Sι]
    (e : D ≃ₗ[R] (S ⊗[R] Sι)) (y : S) (iy : Sι) : D := by
  sorry

theorem determinantalHeegnerElement_image {R D S Sι : Type*} [CommRing R]
    [AddCommGroup D] [AddCommGroup S] [AddCommGroup Sι]
    [Module R D] [Module R S] [Module R Sι]
    (e : D ≃ₗ[R] (S ⊗[R] Sι)) (y : S) (iy : Sι) :
    e (determinantalHeegnerElement e y iy) = y ⊗ₜ[R] iy := by
  sorry

theorem determinantalHeegnerElement_unique {R D S Sι : Type*} [CommRing R]
    [AddCommGroup D] [AddCommGroup S] [AddCommGroup Sι]
    [Module R D] [Module R S] [Module R Sι]
    (e : D ≃ₗ[R] (S ⊗[R] Sι)) (y : S) (iy : Sι) (z : D)
    (h : e z = y ⊗ₜ[R] iy) : z = determinantalHeegnerElement e y iy := by
  sorry

theorem determinantalHeegnerElement_rescale {R D S Sι : Type*} [CommRing R]
    [AddCommGroup D] [AddCommGroup S] [AddCommGroup Sι]
    [Module R D] [Module R S] [Module R Sι]
    (e : D ≃ₗ[R] (S ⊗[R] Sι)) (y : S) (iy : Sι) (a : R) (ι : R ≃+* R) :
    determinantalHeegnerElement e (a • y) ((ι a) • iy) =
      (a * ι a) • determinantalHeegnerElement e y iy := by
  sorry

theorem determinantalHeegnerElement_baseChange {R D S Sι D' S' Sι' : Type*}
    [CommRing R] [AddCommGroup D] [AddCommGroup S] [AddCommGroup Sι]
    [AddCommGroup D'] [AddCommGroup S'] [AddCommGroup Sι']
    [Module R D] [Module R S] [Module R Sι]
    [Module R D'] [Module R S'] [Module R Sι']
    (e : D ≃ₗ[R] (S ⊗[R] Sι)) (e' : D' ≃ₗ[R] (S' ⊗[R] Sι'))
    (f : D →ₗ[R] D') (g : S →ₗ[R] S') (gi : Sι →ₗ[R] Sι')
    (compat : ∀ y iy, e' (f (e.symm (y ⊗ₜ[R] iy))) = g y ⊗ₜ[R] gi iy)
    (y : S) (iy : Sι) :
    f (determinantalHeegnerElement e y iy) = determinantalHeegnerElement e' (g y) (gi iy) := by
  sorry

-- determinantalHeegnerElement_zero
example {R D S Sι : Type*} [CommRing R] [AddCommGroup D] [AddCommGroup S]
    [AddCommGroup Sι] [Module R D] [Module R S] [Module R Sι]
    (e : D ≃ₗ[R] (S ⊗[R] Sι)) : determinantalHeegnerElement e 0 0 = 0 := by
  sorry
-- determinantalHeegnerElement_scalar_square
example {R D S : Type*} [CommRing R] [AddCommGroup D] [AddCommGroup S]
    [Module R D] [Module R S] (e : D ≃ₗ[R] (S ⊗[R] S)) (y : S) (p : ℕ) :
    determinantalHeegnerElement e ((p : R) • y) ((p : R) • y) =
      ((p : R)^2) • determinantalHeegnerElement e y y := by
  sorry
-- determinantalHeegnerElement_rational_not_basis: test the actual output tensor,
-- identify ℤ ⊗[ℤ] ℤ with ℤ and retain its nonunit coefficient.
example :
    TensorProduct.lid ℤ ℤ
      (determinantalHeegnerElement (LinearEquiv.refl ℤ (ℤ ⊗[ℤ] ℤ)) 5 1) = 5 ∧
    ¬ IsUnit (TensorProduct.lid ℤ ℤ
      (determinantalHeegnerElement (LinearEquiv.refl ℤ (ℤ ⊗[ℤ] ℤ)) 5 1)) := by
  sorry

/- HE.8: stabilized-corestriction
Mathematical statement: The stabilized points traced to the anticyclotomic layers satisfy Cor_(K_(k+1)/K_k)y_(k+1)=y_k. The first trace uses the initial correction in ordinary-stabilized-point; a shift d(k) is required when p divides h_K. This construction does not assert Howard Theorem B under the weakened class-number hypothesis.
Hypotheses: E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p. T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used. E(K)[p]=0. Use the actual linear trace maps on the common ambient point-completion and the compatibly included raw points. The unit root α satisfies α²−a_pα+p=0; at positive level cor[k+1](raw[k+2])=a_p raw[k+1]−raw[k] and cor[k+1](raw[k+1])=p raw[k+1]. At the first step cor[0](raw[1])−α⁻¹cor[0](raw[0])=α·initial, with initial the separately corrected point. Identify anticyclotomic traces using the actual d(k).
The actual arithmetic identifications are omitted in this prototype. The displayed topology, finite constraint solvability, transition square and raw norm recurrence, where applicable, are retained as explicit hypotheses. -/
-- The same ambient module contains the compatibly included raw points. At
-- positive levels cor sends the included predecessor to p times that point.
-- The first equation retains the separate initial Euler correction.
theorem stabilized_corestriction {R M : Type*} [CommRing R] [AddCommGroup M]
    [Module R M] (α : Rˣ) (ap : R) (p : ℕ) (raw : ℕ → M) (initial : M)
    (cor : ℕ → M →ₗ[R] M)
    (hroot : (α : R)^2 - ap * (α : R) + (p : R) = 0)
    (hrecurrence : ∀ k, cor (k+1) (raw (k+2)) = ap • raw (k+1) - raw k)
    (hdegree : ∀ k, cor (k+1) (raw (k+1)) = (p : R) • raw (k+1))
    (hfirst : cor 0 (raw 1) - (↑(α⁻¹) : R) • cor 0 (raw 0) = (α : R) • initial)
    (k : ℕ) :
    cor k (stabilizedPoint α raw initial (k+1)) = stabilizedPoint α raw initial k := by
  sorry

/- HE.8: cm-generic-root-number
Mathematical statement: For cuspidal parallel-weight-two π over F with finite-order everywhere-unramified central character ω, and prime-to-P conductor N′ coprime to D_(K/F), let S be all real places and the finite inert Q≠P for which ord_Q(N) is odd. For sufficiently ramified compatible ring-class χ, ε(π,χ)=(-1)^|S|. The source’s S_χ equals S at every level if P∤N or P splits in K. Even |S| is definite and odd |S| indefinite.
Hypotheses: π cuspidal parallel weight two; ω finite-order everywhere unramified; N′ and D_(K/F) coprime.
The actual arithmetic identifications and hypotheses above are omitted in this prototype. Supplied maps, modules, ideals and indices must be those of the stated arithmetic suppliers; this is an admitted interface, not a formal proof. -/
theorem cm_generic_root_number {G A : Type*} [Group G] [CommGroup A] (ε : (G →* A) → ℤ)
    (S : Finset ℕ) (strata : ℕ → Set (G →* A)) :
    ∃ n0 : ℕ, ∀ n ≥ n0, ∀ χ ∈ strata n, ε χ = (-1 : ℤ)^S.card := by
  sorry

/- HE.8: joint-cm-equidistribution
Mathematical statement: Let F be totally real, K/F CM, and B/F a quaternion algebra split by K and at P, with a fixed K-embedding. Choose a nonempty finite collection 𝒮 of finite sets S of finite places v≠P with B_v split, K_v a field, and |S|+|Ram_f(B)|+[F:ℚ] even; fix the source’s totally definite B_S and compatible local embeddings. Let R⊂Gal(K^ab/K) be nonempty finite and pairwise distinct modulo P-rational elements rec_K(λ), characterized by λ_P∈K×·F_P×. Form the actual simultaneous Red:CM→X(𝒮,R) and component map C with fibre probability measures μ_z. For compact-open G⊂Gal(K^ab/K) with probability Haar dg, a P-isogeny class ℋ, and continuous f:X(𝒮,R)→ℂ, the difference ∫_G f(Red(gx))dg−∫_G∫_(C⁻¹(gx̄))f dμ_(gx̄)dg tends to zero as x escapes compact subsets of ℋ. Here x̄=C(Red(x)); prohibited components are retained.
Hypotheses: B split by K and at P; each auxiliary set satisfies S1–S3 and excludes P, as specified in the statement. R is nonempty and pairwise P-irrational; G is compact open. Artin reciprocity sends uniformizers to geometric Frobenius.
The actual arithmetic identifications and hypotheses above are omitted in this prototype. Supplied maps, modules, ideals and indices must be those of the stated arithmetic suppliers; this is an admitted interface, not a formal proof. -/
theorem joint_cm_equidistribution {X : Type*} (average fibreAverage : ℕ → ℝ) :
    Filter.Tendsto (fun n => average n - fibreAverage n) Filter.atTop (nhds 0) := by
  sorry

/- HE.8: joint-cm-orbit-surjectivity
Mathematical statement: At fixed finite level and with the joint CM distribution hypotheses, Red(Gx) equals the fibre C⁻¹(Gx̄) for every x outside a finite subset of its P-isogeny class. The right side retains the component map C and does not assert independent reductions in forbidden components.
Hypotheses: Conditions are included in the statement.
The actual arithmetic identifications and hypotheses above are omitted in this prototype. Supplied maps, modules, ideals and indices must be those of the stated arithmetic suppliers; this is an admitted interface, not a formal proof. -/
theorem joint_cm_orbit_surjectivity {X Y : Type*} (orbit fibre : X → Set Y) :
    Set.Finite {x | orbit x ≠ fibre x} := by
  sorry

/- HE.8: indefinite-cm-character-point
Mathematical statement: In CV §4, require (H1) an Eichler order at P in a split B_P, (H2) maximal split level at primes ramifying in K, a P-new nonzero ω-isotypic quotient α:J_H→A, and good CM points x of conductor P^n. For n sufficiently large and fixed admissible χ₀, some χ∈P(n,χ₀) has e_χα(x)≠0 in the Mordell–Weil space tensored with the character field. Weighted traces are non-torsion, not merely nonzero torsion points.
Hypotheses: CV(H1),(H2), P-new quotient and good CM point; χ₀ω=1 on A_F×.
The actual arithmetic identifications and hypotheses above are omitted in this prototype. Supplied maps, modules, ideals and indices must be those of the stated arithmetic suppliers; this is an admitted interface, not a formal proof. -/
theorem indefinite_cm_character_point {G H G0 A M : Type*} [Group G] [Group H] [Group G0]
    [CommGroup A] [AddCommGroup M] (π : G →* H) (tors : G0 →* G)
    (χ0 : G0 →* A) (point : (G →* A) → M) :
    ∃ χ ∈ cmCharacterStratum π tors χ0, point χ ≠ 0 := by
  sorry

/- HE.8: definite-cm-character-period
Mathematical statement: For the definite quaternion algebra and CV(H1),(H2), a nonzero P-new vector θ in the Jacquet–Langlands representation of a nonexceptional pair (π,K), and a good CM point x at large conductor, some χ∈P(n,χ₀) has Σ_(σ∈G(n))χ(σ)θ(σx)≠0. Nonexceptionality is π≇π⊗η_(K/F); it cannot be suppressed.
Hypotheses: Definite parity, CV(H1),(H2), nonexceptional π, P-new θ, admissible χ₀ and good CM points.
The actual arithmetic identifications and hypotheses above are omitted in this prototype. Supplied maps, modules, ideals and indices must be those of the stated arithmetic suppliers; this is an admitted interface, not a formal proof. -/
theorem definite_cm_character_period {G H G0 A F : Type*} [Group G] [Group H] [Group G0]
    [CommGroup A] [Field F] (π : G →* H) (tors : G0 →* G)
    (χ0 : G0 →* A) (period : (G →* A) → F) :
    ∃ χ ∈ cmCharacterStratum π tors χ0, period χ ≠ 0 := by
  sorry

/- HE.8: definite-rankin-nonvanishing
Mathematical statement: With F,K,π,ω,P,N′,D as in cm-generic-root-number, |S| even and (π,K) nonexceptional, for every sufficiently large n there exists χ∈P(n,χ₀) with L(π,χ,1/2)≠0. This is existence within each fixed-torsion conductor stratum; it is not nonvanishing of all characters.
Hypotheses: Conditions are included in the statement.
The actual arithmetic identifications and hypotheses above are omitted in this prototype. Supplied maps, modules, ideals and indices must be those of the stated arithmetic suppliers; this is an admitted interface, not a formal proof. -/
theorem definite_rankin_nonvanishing {G A F : Type*} [Group G] [CommGroup A] [Field F]
    (strata : ℕ → Set (G →* A)) (L : (G →* A) → F) :
    ∃ n0 : ℕ, ∀ n ≥ n0, ∃ χ ∈ strata n, L χ ≠ 0 := by
  sorry

/- HE.8: cornut-vatsal-nonvanishing-with-its-exact-hypotheses
Mathematical statement: Under the same initial CV data, assume |S| odd, ω=1, and N,D_(K/F),P pairwise coprime. For every sufficiently large n there exists χ∈P(n,χ₀) such that L′(π,χ,1/2)≠0. Use the geometric character-point theorem and the precise generalized Gross–Zagier identity. The definite branch has a separate node.
Hypotheses: ω=1; N,D,P pairwise coprime; |S| odd; χ₀ compatible with central character.
The actual arithmetic identifications and hypotheses above are omitted in this prototype. Supplied maps, modules, ideals and indices must be those of the stated arithmetic suppliers; this is an admitted interface, not a formal proof. -/
theorem cornut_vatsal_indefinite_nonvanishing {G A F : Type*} [Group G]
    [CommGroup A] [Field F] (strata : ℕ → Set (G →* A)) (Lderiv : (G →* A) → F) :
    ∃ n0 : ℕ, ∀ n ≥ n0, ∃ χ ∈ strata n, Lderiv χ ≠ 0 := by
  sorry

/- HE.8: cornut-tower-trace-nontorsion
Mathematical statement: In the classical modular Heegner setting with p∤N, the ring-class p-power tower contains a conductor for which the appropriate trace of the modular Heegner point to the anticyclotomic layer is non-torsion. Keep the finite torsion/trace quotient in Cornut’s statement. This does not require the Heegner point of conductor one to be non-torsion and does not say every trace is non-torsion.
Hypotheses: E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p. T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used.
The actual arithmetic identifications and hypotheses above are omitted in this prototype. Supplied maps, modules, ideals and indices must be those of the stated arithmetic suppliers; this is an admitted interface, not a formal proof. -/
theorem cornut_tower_trace_nontorsion {M : Type*} [AddCommGroup M] (trace : ℕ → M) :
    ∃ n : ℕ, ∀ k : ℕ, 0 < k → k • trace n ≠ 0 := by
  sorry

/- HE.8: lambda-bottom-class-nontorsion
Mathematical statement: For the actual ordinary Heegner family y∞ under E(K)[p]=0, Λy∞ is free of rank one and y∞ is not Λ-torsion. CGLS gives this nonzero family with the actual class-number conductor shifts. No completed main conjecture, full integral image or p∤h_K assumption is used for this assertion.
Hypotheses: E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p. T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used. E(K)[p]=0.
The actual arithmetic identifications and hypotheses above are omitted in this prototype. Supplied maps, modules, ideals and indices must be those of the stated arithmetic suppliers; this is an admitted interface, not a formal proof. -/
theorem lambda_bottom_class_nontorsion {R S : Type*} [CommRing R] [AddCommGroup S]
    [Module R S] (y : S) : ∀ a : R, a • y = 0 → a = 0 := by
  sorry

/- HE.8: lambda-heegner-local-conditions
Mathematical statement: The constructed derivative classes satisfy the transverse condition at ℓ|n, unramified condition away from pNn, and the prescribed propagated condition at bad primes. At v|p the image lies in the ordinary Fil⁺ condition. The proof treats finite decomposition at bad primes and finite ordinary-reduction torsion; it does not replace integral Kummer conditions by rational ones.
Hypotheses: E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p. T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used. Howard’s clean image hypothesis for the direct proof; weaker local verification uses the exact CGLS Theorem 4.1.1 adaptation.
The actual arithmetic identifications and hypotheses above are omitted in this prototype. Supplied maps, modules, ideals and indices must be those of the stated arithmetic suppliers; this is an admitted interface, not a formal proof. -/
theorem lambda_heegner_local_conditions {C Cp CN Caux : Type*} [AddCommGroup C]
    [AddCommGroup Cp] [AddCommGroup CN] [AddCommGroup Caux]
    (locp : C →+ Cp) (locN : C →+ CN) (locaux : C →+ Caux)
    (ordinary : AddSubgroup Cp) (finite : AddSubgroup CN) (transverse : AddSubgroup Caux)
    (κ : ℕ → C) (n : ℕ) : locp (κ n) ∈ ordinary ∧ locN (κ n) ∈ finite ∧
      locaux (κ n) ∈ transverse := by
  sorry

/- HE.8: lambda-finite-singular-relation
Mathematical statement: The corrected Λ-adic derivative system satisfies the generic finite/singular comparison at each allowed ℓ. Its arithmetic reduction congruence and the local χ_ℓ identification must commute with localization through the actual Galois change-of-group action. A merely local matrix is not a global G_K-equivariant coefficient endomorphism.
Hypotheses: Conditions are included in the statement.
The actual arithmetic identifications and hypotheses above are omitted in this prototype. Supplied maps, modules, ideals and indices must be those of the stated arithmetic suppliers; this is an admitted interface, not a formal proof. -/
theorem lambda_finite_singular_relation {C F S : Type*} [AddCommGroup C]
    [AddCommGroup F] [AddCommGroup S] (locf : C →+ F) (locs : C →+ S)
    (compare : F ≃+ S) (κ : ℕ → C) (n ℓ : ℕ) :
    compare (locf (κ n)) = locs (κ (n*ℓ)) := by
  sorry

/- HE.8: howard-stabilization-unit-comparison
Mathematical statement: Howard’s universal-norm bottom and the ordinary stabilized family generate the same Λ-line: the comparison factor is u_Kα_p²(β_p−1)² when p splits, and u_Kα_p²(β_p²−1) when p is inert. Since β_p∈pℤ_p and u_K is a p-unit in the allowed discriminants, the factor is a unit. This comparison does not make Φ a unit.
Hypotheses: E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p. T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used. E(K)[p]=0.
The actual arithmetic identifications and hypotheses above are omitted in this prototype. Supplied maps, modules, ideals and indices must be those of the stated arithmetic suppliers; this is an admitted interface, not a formal proof. -/
theorem howard_stabilization_unit_comparison {R S : Type*} [CommRing R] [AddCommGroup S]
    [Module R S] (a : Rˣ) (howard ordinary : S) :
    howard = (a : R) • ordinary ∧
      Submodule.span R {howard} = Submodule.span R {ordinary} := by
  sorry

/- HE.8: lambda-adic-heegner-kolyvagin-system-and-theorem-B
Mathematical statement: Under Howard’s TheoremA hypotheses, p odd good ordinary, p∤h_K, p,N,D_K pairwise coprime and G_K→GL₂(ℤ_p) surjective, S=H¹_FΛ(K,T⊗Λ) is Λ-torsion-free of rank one, and its discrete dual X is pseudo-isomorphic to Λ⊕M⊕M for a finitely generated torsion Λ-module M with char(M)=char(M)^ι. Moreover char(M) divides char(S/H), H the actual Heegner Λ-line. Equality and integral primitivity are not conclusions.
Hypotheses: E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p. T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used. G_K→GL₂(ℤ_p) surjective; p∤h_K; p,D_K,N pairwise coprime.
The actual arithmetic identifications and hypotheses above are omitted in this prototype. Supplied maps, modules, ideals and indices must be those of the stated arithmetic suppliers; this is an admitted interface, not a formal proof. -/
theorem lambda_adic_heegner_kolyvagin_system_and_theorem_B {R F Sfrac X M : Type*}
    [CommRing R] [Field F] [AddCommGroup Sfrac] [Module F Sfrac]
    [AddCommGroup X] [AddCommGroup M] [Module R X] [Module R M]
    (charM charMi charIndex : Ideal R) : Module.finrank F Sfrac = 1 ∧
    (∃ f : X →ₗ[R] (R × M × M), Finite f.ker ∧ Finite ((R × M × M) ⧸ f.range)) ∧
    charM = charMi ∧ ∃ J : Ideal R, charIndex = charM * J := by
  sorry

/- HE.8: weak-torsion-localized-divisibility
Mathematical statement: Under ordinary Heegner conditions and E(K)[p]=0, the CGLS Heegner family exists and the rank-one paired-torsion bound holds over Λ[1/p,1/(γ−1)]. The augmentation inversion can be removed under the source’s extra corank-one condition. The BCS/CGS error-controlled bounds supply stronger assertions in their stated branches; class-number retention alone does not do so.
Hypotheses: E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p. T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used. E(K)[p]=0.
The actual arithmetic identifications and hypotheses above are omitted in this prototype. Supplied maps, modules, ideals and indices must be those of the stated arithmetic suppliers; this is an admitted interface, not a formal proof. -/
theorem weak_torsion_localized_divisibility {R F Sfrac : Type*} [CommRing R]
    [Field F] [AddCommGroup Sfrac] [Module F Sfrac]
    (charM charIndex : Ideal R) : Module.finrank F Sfrac = 1 ∧
      ∃ J : Ideal R, charIndex = charM * J := by
  sorry

/- HE.8: near-trivial-heegner-specialization
Mathematical statement: If α≡1 modulo p^m and M(n)≥m, then κ^Λ_n(α)≡C_pκ_n^Heeg modulo p^m. Here C_p=(α_p−1)²(β_p−1)² for split p and C_p=Φ=(p+1)²−a_p² for inert p, in the prescribed normalization. The reduction exists because I_n⊂p^mℤ_p. C_p can be a nonunit; at split p its valuation is twice v_p(#Ẽ(𝔽_p)).
Hypotheses: E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p. T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used. E(K)[p]=0. α is an anticyclotomic twist sufficiently close to1; M(n)≥m.
The actual arithmetic identifications and hypotheses above are omitted in this prototype. Supplied maps, modules, ideals and indices must be those of the stated arithmetic suppliers; this is an admitted interface, not a formal proof. -/
theorem near_trivial_heegner_specialization {R C Cmod : Type*} [CommRing R]
    [AddCommGroup C] [AddCommGroup Cmod] [Module R C] [Module R Cmod]
    (red : C →ₗ[R] Cmod) (κspec κfinite : C) (Cp : R) (Mdepth m : ℕ)
    (hm : m ≤ Mdepth) : red κspec = Cp • red κfinite := by
  sorry

/- HE.8: near-trivial-bottom-nonvanishing
Mathematical statement: There is a neighbourhood of1 such that every nontrivial α in it has κ^Heeg_1(α)≠0. This follows from a non-Λ-torsion family and the finite zero set of a nonzero one-variable series. The specialization at α=1 is not included: its nonvanishing is equivalent to the appropriate analytic-rank-one condition.
Hypotheses: E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p. T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used. E(K)[p]=0.
The actual arithmetic identifications and hypotheses above are omitted in this prototype. Supplied maps, modules, ideals and indices must be those of the stated arithmetic suppliers; this is an admitted interface, not a formal proof. -/
theorem near_trivial_bottom_nonvanishing {C : Type*} [AddCommGroup C] (κ : ℕ → C) :
    ∃ m0 : ℕ, ∀ m ≥ m0, κ m ≠ 0 := by
  sorry

/- HE.8: optimal-lattice-isogeny-comparison
Mathematical statement: For E₀ optimal on X₀(N), E₁ optimal on X₁(N), and the distinguished E_• with T_f identified integrally with T_pE_•, the prescribed isogeny E₀→E_• is étale at odd p. For crystalline α as in BCGS Lemma 1.2.3 with L_BDP(α⁻¹)≠0 and α sufficiently near1, I_•(α)C_•(α)=I₀(α)C₀(α), where I is the bottom-class index and C the finite-cokernel local index modulo torsion. Neither factor is individually asserted equal under arbitrary isogeny.
Hypotheses: E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p. T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used. E(K)[p]=0. p splits as v v̄ in K. α is crystalline at both primes above p and comes from a Hecke character of infinity type (n,−n), with n≥0 and n divisible by p−1, as in BCGS Theorem 1.2.1 and Lemma 1.2.3. Assume L_BDP(α⁻¹)≠0; for the displayed near-identity formulas take α≡1 modulo p^m with m sufficiently large.
The actual arithmetic identifications and hypotheses above are omitted in this prototype. Supplied maps, modules, ideals and indices must be those of the stated arithmetic suppliers; this is an admitted interface, not a formal proof. -/
theorem optimal_lattice_isogeny_comparison (Ibullet Cbullet I0 C0 : ℕ) :
    Ibullet * Cbullet = I0 * C0 := by
  sorry

/- HE.8: twisted-logarithm-index-formula
Mathematical statement: With E_• and crystalline α as in BCGS Lemma 1.2.3 sufficiently close to1, L_BDP(α⁻¹)≠0 and κ_1^•(α)≠0, let t_α=length_(ℤ_p^ur)(ℤ_p^ur/L_BDP(α⁻¹)), q_•=#H⁰(ℚ_p,E_•[p∞]), I_•=#(S_α/ℤ_pκ_1^•(α)), and C_•=#coker(loc_v) modulo torsion. Then p^tα q_•=I_•C_•. Use the source’s coefficient extension and square-root BDP normalization.
Hypotheses: E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p. T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used. E(K)[p]=0. p splits as v v̄ in K. α is crystalline at both primes above p and comes from a Hecke character of infinity type (n,−n), with n≥0 and n divisible by p−1, as in BCGS Theorem 1.2.1 and Lemma 1.2.3. Assume L_BDP(α⁻¹)≠0; for the displayed near-identity formulas take α≡1 modulo p^m with m sufficiently large.
The actual arithmetic identifications and hypotheses above are omitted in this prototype. Supplied maps, modules, ideals and indices must be those of the stated arithmetic suppliers; this is an admitted interface, not a formal proof. -/
theorem twisted_logarithm_index_formula (p t q I C : ℕ) : p^t * q = I * C := by
  sorry

/- HE.8: twisted-anticyclotomic-control
Mathematical statement: For m≫0, crystalline α=α_m and L_BDP(α⁻¹)≠0, a characteristic generator F_E of the strict-at-v, unrestricted-at-v̄ Greenberg dual satisfies #(ℤ_p/F_E(α⁻¹))=#Sha(W_α⁻¹/K)·C_α²·∏_(w|N)c_w^(p)(α⁻¹)·q_E². The finite Sha is the source’s propagated Selmer quotient. The formula is integral and uses all K-primes over N and the finite/torsion local cokernel.
Hypotheses: E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p. T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used. E(K)[p]=0. p splits as v v̄ in K. α is crystalline at both primes above p and comes from a Hecke character of infinity type (n,−n), with n≥0 and n divisible by p−1, as in BCGS Theorem 1.2.1 and Lemma 1.2.3. Assume L_BDP(α⁻¹)≠0; for the displayed near-identity formulas take α≡1 modulo p^m with m sufficiently large.
The actual arithmetic identifications and hypotheses above are omitted in this prototype. Supplied maps, modules, ideals and indices must be those of the stated arithmetic suppliers; this is an admitted interface, not a formal proof. -/
theorem twisted_anticyclotomic_control (fIndex sha C tam q : ℕ) :
    fIndex = sha * C^2 * tam * q^2 := by
  sorry

/- HE.8: near-trivial-tamagawa-stability
Mathematical statement: For α≡1 modulo p^m the twisted local Tamagawa p-factor c_w^(p)(α) is congruent to the untwisted c_w^(p) modulo p^m. For m greater than the total relevant valuations this gives equality of the product of p-parts. Keep w|N over K; under the Heegner hypothesis its untwisted product is the square of the rational Tamagawa p-part.
Hypotheses: E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p. T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used. E(K)[p]=0.
The actual arithmetic identifications and hypotheses above are omitted in this prototype. Supplied maps, modules, ideals and indices must be those of the stated arithmetic suppliers; this is an admitted interface, not a formal proof. -/
theorem near_trivial_tamagawa_stability (twisted untwisted : ℕ) : twisted = untwisted := by
  sorry

/- HE.8: arithmetic-rescaled-kolyvagin-bound
Mathematical statement: There exist M and E depending only on T_pE such that, for α≡1 modulo p^m with m≥M and a collection κ̃_n∈H¹(K,T_α/I_nT_α) on a permitted prime set containing every sufficiently deep L_e, with κ̃₁≠0 and one fixed t≥0 for which {p^tκ̃_n}_n is an ordinary Kolyvagin system, H¹_Ford(K,T_α) has ℤ_p-rank one and the discrete ordinary Selmer group H¹_Ford(K,W_α⁻¹) is ℚ_p/ℤ_p⊕M_α⊕M_α, with length M_α≤ind(κ̃₁)+E. The constants are independent of m, the prime set and t. The divided collection itself need not be an integral Kolyvagin system. Under the source’s surjectivity hypothesis E=0.
Hypotheses: E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p. T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used. E(K)[p]=0. The allowed prime set contains L_e for all sufficiently large e. The collection has nonzero bottom class and one common multiple p^tκ̃ satisfying every Kolyvagin-system relation, with t independent of n.
The actual arithmetic identifications and hypotheses above are omitted in this prototype. Supplied maps, modules, ideals and indices must be those of the stated arithmetic suppliers; this is an admitted interface, not a formal proof. -/
theorem arithmetic_rescaled_kolyvagin_bound {R Sel DP M : Type*} [CommRing R]
    [AddCommGroup Sel] [AddCommGroup DP] [AddCommGroup M]
    [Module R Sel] [Module R DP] [Module R M] (lengthM index E : ℕ) :
    Nonempty (Sel ≃ₗ[R] (DP × M × M)) ∧ lengthM ≤ index + E := by
  sorry

/- HE.8: heegner-exact-sha-length
Mathematical statement: For p>3, a surjective residual representation and the generic self-dual rank-one hypotheses, the specialized actual anticyclotomic Heegner system over a finite DVR R with κ₁≠0 gives length_R Sha(W_α/K)=2(M₀(α)−M∞(α)). No near-triviality is needed in the generic theorem; near-trivial α is used in the arithmetic application. The deep-prime restriction and rigidity hypotheses remain explicit. BCGS states Theorem 2.2.2 for p≥3 through Proposition 2.2.1, but its proof invokes Lemma 2.2.4, stated only for p>3. The p=3 proof extension remains a source gap.
Hypotheses: E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p. T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used. E(K)[p]=0. Residual G_Q representation surjective; R finite DVR; the source’s self-dual/cartesian hypotheses and κ₁≠0. p>3 for the verified proof route.
The actual arithmetic identifications and hypotheses above are omitted in this prototype. Supplied maps, modules, ideals and indices must be those of the stated arithmetic suppliers; this is an admitted interface, not a formal proof. -/
theorem heegner_exact_sha_length (shaLength M0 Minfty : ℕ) :
    Minfty ≤ M0 ∧ shaLength = 2 * (M0 - Minfty) := by
  sorry

/- HE.8: integral-main-conjecture-index-square
Mathematical statement: Assume the integral anticyclotomic Greenberg main conjecture in Λ^ur with the BCGS square-root convention. For crystalline α_m sufficiently close to1 with L_BDP(α_m⁻¹)≠0, the p-optimal curve satisfies I₀(α)²=#Sha(W_α⁻¹/K)·∏_(w|N)c_w^(p)(α⁻¹)·q₀⁴. A rational main conjecture supplies only a bounded p-power error; it does not supply this exact equality.
Hypotheses: E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p. T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used. E(K)[p]=0. p splits as v v̄ in K. Integral anticyclotomic Greenberg main conjecture and the p-optimal lattice. α is crystalline at both primes above p and comes from a Hecke character of infinity type (n,−n), with n≥0 and n divisible by p−1, as in BCGS Theorem 1.2.1 and Lemma 1.2.3. Assume L_BDP(α⁻¹)≠0; for the displayed near-identity formulas take α≡1 modulo p^m with m sufficiently large.
The actual arithmetic identifications and hypotheses above are omitted in this prototype. Supplied maps, modules, ideals and indices must be those of the stated arithmetic suppliers; this is an admitted interface, not a formal proof. -/
theorem integral_main_conjecture_index_square (I sha tam q : ℕ) :
    I^2 = sha * tam * q^4 := by
  sorry

/- HE.8: bcgs-conditional-kolyvagin-nonvanishing
Mathematical statement: Under (Heeg),(disc),(tor), p odd good ordinary and split in K, the rational anticyclotomic main conjecture (indeed its required lower divisibility after inverting p) implies κ_n^Heeg≠0 for some squarefree n of allowed Kolyvagin primes. No analytic-rank-one hypothesis is made and κ₁ may vanish.
Hypotheses: E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p. T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used. E(K)[p]=0. p splits as v v̄ in K. Rational anticyclotomic main conjecture, kept as a theorem hypothesis.
The actual arithmetic identifications and hypotheses above are omitted in this prototype. Supplied maps, modules, ideals and indices must be those of the stated arithmetic suppliers; this is an admitted interface, not a formal proof. -/
theorem bcgs_conditional_kolyvagin_nonvanishing {C : Type*} [AddCommGroup C]
    (κ : ℕ → C) (allowed : Set ℕ) : ∃ n ∈ allowed, κ n ≠ 0 := by
  sorry

/- HE.8: bcgs-conditional-refined-divisibility
Mathematical statement: Assume p>3, surjective residual G_Q→GL₂(𝔽_p), good ordinary p split in K, (Heeg),(disc),(tor), a p-optimal parametrization, and the integral anticyclotomic main conjecture. Then M∞ of the finite Heegner system is finite and equals Σ_(ℓ|N)v_p(c_ℓ(E/ℚ)). This is half the sum over K-primes; it is neither M₀ nor the order of Sha.
Hypotheses: E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p. T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used. E(K)[p]=0. p splits as v v̄ in K. p>3; residual surjectivity; p-optimal parametrization; integral main conjecture.
The actual arithmetic identifications and hypotheses above are omitted in this prototype. Supplied maps, modules, ideals and indices must be those of the stated arithmetic suppliers; this is an admitted interface, not a formal proof. -/
theorem bcgs_conditional_refined_divisibility (index : ℕ → ℕ∞) (degree : ℕ → ℕ)
    (allowed : Set ℕ) (tamVal : ℕ) :
    (⨅ r : ℕ, heegnerDivisibilityProfile index degree allowed r) = (tamVal : ℕ∞) := by
  sorry

/- HE.8: strict-ordinary-selmer-complex
Mathematical statement: For CS coefficients X=T⊗Λ and twists T_α, instantiate the imported Selmer complex as the cone of global cochains mapping to ⊕_(v|p)RΓ(K_v,X/X_v⁺) and ⊕_(v|N)Cone(RΓ_ur→RΓ). Its H¹ is the strict ordinary Selmer lattice S; its H² is related by Poitou–Tate to the all-p ordinary discrete dual X_Gr(A). This rank-one dual is distinct from BCS’s torsion (0,empty) Greenberg module.
Hypotheses: E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p. T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used. E(K)[p]=0. p unramified in K.
The actual arithmetic identifications and hypotheses above are omitted in this prototype. Supplied maps, modules, ideals and indices must be those of the stated arithmetic suppliers; this is an admitted interface, not a formal proof. -/
theorem strict_ordinary_selmer_complex {R H1 S : Type*} [CommRing R]
    [AddCommGroup H1] [AddCommGroup S] [Module R H1] [Module R S] :
    Nonempty (H1 ≃ₗ[R] S) := by
  sorry

/- HE.8: determinant-characteristic-ideal-comparison
Mathematical statement: The assertion that z̃∞ is an integral determinant basis is equivalent to char_Λ(S/Λy∞)·char_Λ(S/Λy∞)^ι=char_Λ(X_Gr(A)_tors) for the CS all-p ordinary dual. Writing a square requires the source’s ι-invariance; rational equality cannot certify an integral basis.
Hypotheses: E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p. T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used. E(K)[p]=0.
The actual arithmetic identifications and hypotheses above are omitted in this prototype. Supplied maps, modules, ideals and indices must be those of the stated arithmetic suppliers; this is an admitted interface, not a formal proof. -/
theorem determinant_characteristic_ideal_comparison {R D : Type*} [CommRing R]
    [AddCommGroup D] [Module R D] (z : D) (charIndex charIndexi charX : Ideal R) :
    (Function.Bijective (fun a : R => a • z)) ↔ charIndex * charIndexi = charX := by
  sorry

/- HE.8: ordinary-local-specialization-defect
Mathematical statement: For near-trivial nontrivial α, the local finite/ordinary comparison at v|p contributes the p-part of #Ẽ(𝔽_v), identified with the corresponding H⁰(K_v,A_v⁻(α±)). Set L_p=∏_(v|p)#Ẽ(𝔽_v). For split p v_p(Φ)=v_p(L_p)=2v_p(#Ẽ(𝔽_p)); for inert p use #Ẽ(𝔽_(p²))=(p+1)²−a_p². Retain both signs of the twist.
Hypotheses: E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p. T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used. E(K)[p]=0. p unramified in K; α sufficiently near1.
The actual arithmetic identifications and hypotheses above are omitted in this prototype. Supplied maps, modules, ideals and indices must be those of the stated arithmetic suppliers; this is an admitted interface, not a formal proof. -/
theorem ordinary_local_specialization_defect (Φval Lpval : ℕ) : Φval = Lpval := by
  sorry

/- HE.8: determinant-specialization-lattice
Mathematical statement: For a continuous α:Γ→ℤ_p× with α≡1 modulo p^m, m≫0 and κ₁,Λ^Heeg(α)≠0, the source proves that both S_(α±1) are free of rank one. Then the specialized rational determinant map to S_α⊗S_α⁻¹ sends the integral determinant lattice, up to a ℤ_p-unit, to L_p²·Tam_E²·#X_BK(T_α*/K) times that tensor lattice. Here X_BK is the finite quotient of the propagated Selmer group in CS; for a general twist it need not be the Bloch–Kato group. Tam_E=∏_(ℓ|N)c_ℓ over ℚ.
Hypotheses: E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p. T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used. E(K)[p]=0. p unramified in K; α continuous with α≡1 modulo p^m; κ₁,Λ^Heeg(α)≠0; m sufficiently large.
The actual arithmetic identifications and hypotheses above are omitted in this prototype. Supplied maps, modules, ideals and indices must be those of the stated arithmetic suppliers; this is an admitted interface, not a formal proof. -/
theorem determinant_specialization_lattice {R P : Type*} [CommRing R]
    [AddCommGroup P] [Module R P] (image full : Submodule R P) (Lp tam sha : ℕ) :
    image = full.map ((((Lp^2 * tam^2 * sha : ℕ) : R)) • (LinearMap.id : P →ₗ[R] P)) := by
  sorry

/- HE.8: determinantal-twisted-index-square
Mathematical statement: If z̃∞ generates the integral Selmer determinant and α is sufficiently close to1 but nontrivial, then the square of the Heegner bottom index equals L_p² Tam_E² #X_BK(T_α*/K), up to a ℤ_p-unit (equivalently as p-valuations). The transported Φ comparison and unit normalization remain explicit.
Hypotheses: E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p. T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used. E(K)[p]=0. Integral determinantal main conjecture; p unramified in K.
The actual arithmetic identifications and hypotheses above are omitted in this prototype. Supplied maps, modules, ideals and indices must be those of the stated arithmetic suppliers; this is an admitted interface, not a formal proof. -/
theorem determinantal_twisted_index_square (indexVal Lpval tamVal shaVal : ℕ) :
    2 * indexVal = 2 * Lpval + 2 * tamVal + shaVal := by
  sorry

/- HE.8: castella-sano-refined-equivalence
Mathematical statement: For p>3, residual G_Q surjectivity, good ordinary p unramified in K, (Heeg),(disc), and a parametrization whose Manin constant is prime to p, M∞=v_p(Tam_E) holds if and only if the integral determinantal Heegner main conjecture of CS3.2.2 holds. The theorem permits inert p; it does not prove that conjecture at inert p.
Hypotheses: E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p. T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used. E(K)[p]=0. p>3; residual G_Q surjectivity; p unramified in K; p∤Manin constant.
The actual arithmetic identifications and hypotheses above are omitted in this prototype. Supplied maps, modules, ideals and indices must be those of the stated arithmetic suppliers; this is an admitted interface, not a formal proof. -/
theorem castella_sano_refined_equivalence {R D : Type*} [CommRing R]
    [AddCommGroup D] [Module R D] (z : D) (index : ℕ → ℕ∞)
    (degree : ℕ → ℕ) (allowed : Set ℕ) (tamVal : ℕ) :
    ((⨅ r : ℕ, heegnerDivisibilityProfile index degree allowed r) = (tamVal : ℕ∞)) ↔
      Function.Bijective (fun a : R => a • z) := by
  sorry

/- HE.8b: bdp-function-convention-comparison
Mathematical statement: After the same coefficient extension and primitive/imprimitive local normalizations, BCS’s single-power anticyclotomic L-function generates the same ideal as (L_BDP^BCGS)² in Λ^ur. Period/unit conventions are compared as ideals, not by arbitrary exact equality of functions. All nonunit Euler factors in changes of local condition remain visible.
Hypotheses: Conditions are included in the statement.
The actual arithmetic identifications and hypotheses above are omitted in this prototype. Supplied maps, modules, ideals and indices must be those of the stated arithmetic suppliers; this is an admitted interface, not a formal proof. -/
theorem bdp_function_convention_comparison {R : Type*} [CommRing R]
    (bcs bdp : R) : Ideal.span {bcs} = Ideal.span {bdp^2} := by
  sorry

/- HE.8b: anticyclotomic-formulation-comparison
Mathematical statement: In the classical N⁻=1 split ordinary setting with p>3 and H⁰(G_K,E[p])=0, the integral Heegner-index divisibility char(X_tors) ⊃ char(S/Λy∞)² is equivalent to the corresponding Greenberg/BDP divisibility char(X_(0,empty))Λ^ur ⊃ (L_BDP²), with the reverse divisibilities also equivalent (BCK Theorem 5.2). Retain the coefficient extension, finite local cokernels, ι and nonunit Euler factors. This comparison does not itself prove either divisibility. Separately, CGLS Proposition 4.2.1 proves the analogous comparison after inverting p under E(K)[p]=0 for odd p. The general weak-torsion p=3 integral extension is not certified; an exact integral comparison must be supplied before using that extension.
Hypotheses: E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p. T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used. E(K)[p]=0. p splits as v v̄ in K. For the integral statement p>3; for the rational CGLS variant p is odd and both characteristic ideals are extended to Λ⊗ℚ_p.
The actual arithmetic identifications and hypotheses above are omitted in this prototype. Supplied maps, modules, ideals and indices must be those of the stated arithmetic suppliers; this is an admitted interface, not a formal proof. -/
theorem anticyclotomic_formulation_comparison {R : Type*} [CommRing R]
    (charX charIndex charGreenberg bdpSquare : Ideal R) :
    (charIndex^2 ≤ charX) ↔ (bdpSquare ≤ charGreenberg) := by
  sorry

/- HE.8b: auxiliary-quadratic-field-verification
Mathematical statement: For the BCS irreducible branch, choose the auxiliary real quadratic F with p inert, D_F odd and every D_F-prime split in K; for ℓ|N choose ℓ inert in F when ℓ≡−1 modulo p and split otherwise. Retain irreducibility after restricting to G_(FK) and G_(F(ζ_p)), the p=5 exceptional real field exclusion and finite discriminant avoidance. These are the precise hypotheses used by the Hilbert/quartic-CM supplier.
Hypotheses: E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p. T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used. E(K)[p]=0. p splits as v v̄ in K. p>3; E[p] irreducible over G_Q; the source’s auxiliary-field and Fujiwara(H1)–(H3) assumptions.
The actual arithmetic identifications and hypotheses above are omitted in this prototype. Supplied maps, modules, ideals and indices must be those of the stated arithmetic suppliers; this is an admitted interface, not a formal proof. -/
theorem auxiliary_quadratic_field_verification (candidates : Set ℤ) (avoid : Finset ℤ) :
    ∃ d ∈ candidates, d ∉ avoid := by
  sorry

/- HE.8b: anticyclotomic-euler-system-divisibility
Mathematical statement: Under p odd ordinary, (Heeg),(disc) and E[p] irreducible over G_K, the actual Heegner family gives rank one and char(X_tors) ⊃ char(S/Λy∞)² after inverting p. In the split case the equivalent Greenberg/BDP bound holds. Under residual G_Q surjectivity the bounds are integral. This is the weak-hypothesis CGS/BCS bound, not Howard B with its hypotheses silently removed.
Hypotheses: E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p. T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used. E[p] irreducible over G_K; integral branch additionally has G_Q residual surjectivity.
The actual arithmetic identifications and hypotheses above are omitted in this prototype. Supplied maps, modules, ideals and indices must be those of the stated arithmetic suppliers; this is an admitted interface, not a formal proof. -/
theorem anticyclotomic_euler_system_divisibility {R : Type*} [CommRing R]
    (charX charIndex : Ideal R) : charIndex^2 ≤ charX := by
  sorry

/- HE.8b: anticyclotomic-reverse-product-divisibility
Mathematical statement: For the chosen auxiliary F, the imported Wan/Fujiwara quartic-CM theorem, shared two-variable restriction/factorization, and anticyclotomic projection imply the reverse product divisibility for E/K and E^F/K against their BDP functions. Specialize the Greenberg local conditions exactly as in BCS §5, and obtain individual reverse divisibilities by combining the opposite Euler-system bounds and cancelling nonzero factors. Integral cancellation uses μ=0 and the source’s period/regulator hypotheses.
Hypotheses: E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p. T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used. E(K)[p]=0. p splits as v v̄ in K. p>3; irreducible residual G_Q representation; all auxiliary-field and period hypotheses of the suppliers.
The actual arithmetic identifications and hypotheses above are omitted in this prototype. Supplied maps, modules, ideals and indices must be those of the stated arithmetic suppliers; this is an admitted interface, not a formal proof. -/
theorem anticyclotomic_reverse_product_divisibility {R : Type*} [CommRing R]
    (charX charXF bdp bdpF : Ideal R) : charX * charXF ≤ bdp * bdpF := by
  sorry

/- HE.8b: rational-heegner-main-conjecture
Mathematical statement: For p>3 good ordinary, (disc),(Heeg),(spl), and E[p] irreducible over G_Q, S and X have Λ-rank one and char_Λ(X_tors)=char_Λ(S/Λy∞)² in Λ[1/p]. No analytic-rank condition, p∤h_K assumption or residual surjectivity is added; integrality is a different branch.
Hypotheses: E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p. T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used. E(K)[p]=0. p splits as v v̄ in K. p>3; E[p] irreducible over G_Q.
The actual arithmetic identifications and hypotheses above are omitted in this prototype. Supplied maps, modules, ideals and indices must be those of the stated arithmetic suppliers; this is an admitted interface, not a formal proof. -/
theorem rational_heegner_main_conjecture {R F Sfrac Xfrac : Type*}
    [CommRing R] [Field F] [AddCommGroup Sfrac] [AddCommGroup Xfrac]
    [Module F Sfrac] [Module F Xfrac] (charX charIndex : Ideal R) :
    Module.finrank F Sfrac = 1 ∧ Module.finrank F Xfrac = 1 ∧ charX = charIndex^2 := by
  sorry

/- HE.8b: integral-heegner-main-conjecture
Mathematical statement: For the same ordinary split setting with p>3 and residual G_Q→GL₂(𝔽_p) surjective, S and X have Λ-rank one and char_Λ(X_tors)=char_Λ(S/Λy∞)² integrally in Λ. The integral period, μ and generic descent hypotheses are those verified in the BCS supplier chain.
Hypotheses: E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p. T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used. E(K)[p]=0. p splits as v v̄ in K. p>3; residual G_Q representation surjective.
The actual arithmetic identifications and hypotheses above are omitted in this prototype. Supplied maps, modules, ideals and indices must be those of the stated arithmetic suppliers; this is an admitted interface, not a formal proof. -/
theorem integral_heegner_main_conjecture {R F Sfrac Xfrac : Type*}
    [CommRing R] [Field F] [AddCommGroup Sfrac] [AddCommGroup Xfrac]
    [Module F Sfrac] [Module F Xfrac] (charX charIndex : Ideal R) :
    Module.finrank F Sfrac = 1 ∧ Module.finrank F Xfrac = 1 ∧ charX = charIndex^2 := by
  sorry

/- HE.8b: rational-greenberg-bdp-main-conjecture
Mathematical statement: Under the rational Heegner main-conjecture hypotheses, X_(0,empty) is Λ-torsion and char_Λ(X_(0,empty))Λ^ur=(L_BDP²) in Λ^ur[1/p], where L_BDP is BCGS’s square-root function. This torsion module is not CS’s all-p ordinary rank-one dual.
Hypotheses: E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p. T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used. E(K)[p]=0. p splits as v v̄ in K. p>3; residual irreducibility over G_Q.
The actual arithmetic identifications and hypotheses above are omitted in this prototype. Supplied maps, modules, ideals and indices must be those of the stated arithmetic suppliers; this is an admitted interface, not a formal proof. -/
theorem rational_greenberg_bdp_main_conjecture {R X : Type*} [CommRing R]
    [AddCommGroup X] [Module R X] (charX : Ideal R) (bdp : R) :
    (∀ x : X, ∃ a : R, a ≠ 0 ∧ a • x = 0) ∧ charX = Ideal.span {bdp^2} := by
  sorry

/- HE.8b: integral-greenberg-bdp-main-conjecture
Mathematical statement: Under the integral Heegner main-conjecture hypotheses, X_(0,empty) is Λ-torsion and char_Λ(X_(0,empty))Λ^ur=(L_BDP²) integrally. The coefficient ring Λ^ur and p-primary content are retained.
Hypotheses: E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p. T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used. E(K)[p]=0. p splits as v v̄ in K. p>3; residual G_Q surjectivity.
The actual arithmetic identifications and hypotheses above are omitted in this prototype. Supplied maps, modules, ideals and indices must be those of the stated arithmetic suppliers; this is an admitted interface, not a formal proof. -/
theorem integral_greenberg_bdp_main_conjecture {R X : Type*} [CommRing R]
    [AddCommGroup X] [Module R X] (charX : Ideal R) (bdp : R) :
    (∀ x : X, ∃ a : R, a ≠ 0 ∧ a • x = 0) ∧ charX = Ideal.span {bdp^2} := by
  sorry

/- HE.8b: eisenstein-main-conjecture-adapter
Mathematical statement: For CGS Theorem C, E/ℚ has a rational p-isogeny with kernel character φ, p∤2N, K satisfies (disc),(Heeg),(spl), and φ|_(G_p)≠1,ω. Its integral Heegner/Greenberg equality, in the agreed coefficient and BDP conventions, supplies BCGS Theorem 1.2.13(i). This is an adapter of the independently supplied theorem, not a duplicate proof or an extension to excluded local characters.
Hypotheses: E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p. T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used. E(K)[p]=0. p splits as v v̄ in K. A rational p-isogeny with kernel character φ and φ|G_p≠1,ω; p∤2N and (disc),(Heeg),(spl). No analytic-rank-one (Sel) hypothesis is added.
The actual arithmetic identifications and hypotheses above are omitted in this prototype. Supplied maps, modules, ideals and indices must be those of the stated arithmetic suppliers; this is an admitted interface, not a formal proof. -/
theorem eisenstein_main_conjecture_adapter {R : Type*} [CommRing R]
    (charX : Ideal R) (bdp : R) : charX = Ideal.span {bdp^2} := by
  sorry

/- HE.8b: split-kolyvagin-nonvanishing-branches
Mathematical statement: BCGS finite-system nonvanishing is unconditional in each acquired main-conjecture branch: (i) the requested CGS Eisenstein local-character branch; (ii) p>3 and residual G_Q irreducibility; (iii) p>3 and residual surjectivity. In each case apply the conditional TheoremA with the exact branch hypotheses. No p=3 irreducible branch is inferred from BCS.
Hypotheses: E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p. T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used. E(K)[p]=0. p splits as v v̄ in K.
The actual arithmetic identifications and hypotheses above are omitted in this prototype. Supplied maps, modules, ideals and indices must be those of the stated arithmetic suppliers; this is an admitted interface, not a formal proof. -/
theorem split_kolyvagin_nonvanishing_branches {C : Type*} [AddCommGroup C]
    (κ : ℕ → C) (allowed : Set ℕ) : ∃ n ∈ allowed, κ n ≠ 0 := by
  sorry

/- HE.8b: split-refined-kolyvagin-divisibility
Mathematical statement: For p>3 residual G_Q surjective, ordinary split Heegner setting and p-optimal parametrization, M∞=Σ_(ℓ|N)v_p(c_ℓ(E/ℚ)). The integral BCS theorem discharges the conditional TheoremB; rational irreducibility alone does not discharge it.
Hypotheses: E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p. T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used. E(K)[p]=0. p splits as v v̄ in K. p>3; residual surjectivity; p-optimal parametrization.
The actual arithmetic identifications and hypotheses above are omitted in this prototype. Supplied maps, modules, ideals and indices must be those of the stated arithmetic suppliers; this is an admitted interface, not a formal proof. -/
theorem split_refined_kolyvagin_divisibility (index : ℕ → ℕ∞) (degree : ℕ → ℕ)
    (allowed : Set ℕ) (tamVal : ℕ) :
    (⨅ r : ℕ, heegnerDivisibilityProfile index degree allowed r) = (tamVal : ℕ∞) := by
  sorry

/- HE.8b: split-determinantal-heegner-main-conjecture
Mathematical statement: In the CS TheoremC setting with p split in K, the integral BCS Heegner main conjecture and determinant/characteristic comparison show z̃∞ generates its integral Selmer determinant. Consequently the refined finite Heegner index equals v_p(Tam_E). For inert p the main-conjecture hypothesis is still unproved by this chain.
Hypotheses: E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p. T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used. E(K)[p]=0. p splits as v v̄ in K. p>3; residual surjectivity; p∤Manin constant.
The actual arithmetic identifications and hypotheses above are omitted in this prototype. Supplied maps, modules, ideals and indices must be those of the stated arithmetic suppliers; this is an admitted interface, not a formal proof. -/
theorem split_determinantal_heegner_main_conjecture {R D : Type*} [CommRing R]
    [AddCommGroup D] [Module R D] (z : D) : Function.Bijective (fun a : R => a • z) := by
  sorry

/- HE.8: relative-ring-class-tower-torsion-finite
Mathematical statement: For the CV relative CM tower K[P^∞]/K and an abelian variety A/K, A(K[P^∞])_tors is finite. Choose two good-reduction places of K above distinct residue characteristics and primes Q≠P of F that do not split in K. CV Lemma 2.7 bounds their local extension degrees in the tower; prime-to-residue-characteristic reduction injectivity at these two places bounds all torsion. This is a statement about this tower, not torsion over every abelian extension.
Hypotheses: F totally real, K/F CM, P a fixed finite prime, and the relative ring-class tower and its reciprocity identification of HE.0. A/K an abelian variety; choose two distinct residue characteristics away from P and the bad reduction set.
The actual arithmetic identifications and hypotheses above are omitted in this prototype. Supplied maps, modules, ideals and indices must be those of the stated arithmetic suppliers; this is an admitted interface, not a formal proof. -/
theorem relative_ring_class_tower_torsion_finite {A B : Type*}
    [AddCommGroup A] [Fintype B] (tors : AddSubgroup A)
    (red : tors → B) (hinj : Function.Injective red) : Set.Finite (tors : Set A) := by
  sorry

end TauCeti.Heegner.Anticyclotomic
