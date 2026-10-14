import Mathlib

/-!
# P-adic differential equations and rigid cohomology: representative target signatures

The roadmap is `research/blueprint/readmes/PadicDifferentialEquationsAndRigidCohomology.md`.
This file is not exhaustive. It records signatures expressible with the pinned APIs
(Mathlib 082e2d3, Tau Ceti f790474), using existing coefficient and linear-algebra
carriers. The roadmap gives the full statements, suppliers, APIs and checks.

Frobenius is semilinear until the coefficient automorphism is trivial. Invertibility
means invertibility of its linearisation; a semilinear map need not be a bijection
when the coefficient endomorphism is not surjective. The linear signatures below
specialise to the q-power Frobenius over a finite residue field. Tate twists multiply
Frobenius by q^(-n), so they change weights by -2n. Reverse characteristic
polynomials use det(1 - T F).

Robba and dagger analytic structures, coefficient categories, cohomology and
comparison functors remain roadmap targets. No placeholder carrier represents them.
-/

namespace TauCetiRoadmap.PadicDifferentialEquationsAndRigidCohomology

noncomputable section

/-! ## Layer 0: coefficient rings and analytic foundations -/

/- The existing Witt Frobenius is the p-power coefficient map. It is distinct
from q-power Frobenius when q is a proper power of p. -/
#check WittVector.frobenius

/- The algebraic convolution operation requires summability and analytic closure
before it can define multiplication on a Robba carrier. -/
#check DiscreteConvolution.ringConvolution

/-! ## Layer 1: differential and Frobenius modules -/

section Semilinear

variable {K V W : Type*} [Field K] [AddCommGroup V] [Module K V]
  [AddCommGroup W] [Module K W] {σ : K →+* K}

/-- The equivariance condition on a coefficient-linear morphism between
Frobenius modules. Scalar multiples of such morphisms
commute with Frobenius only for scalars fixed by σ. -/
def FrobeniusEquivariant (φ : V →ₛₗ[σ] V) (ψ : W →ₛₗ[σ] W)
    (f : V →ₗ[K] W) : Prop :=
  ∀ v, f (φ v) = ψ (f v)

/-- The identity is Frobenius-equivariant. -/
example (φ : V →ₛₗ[σ] V) : FrobeniusEquivariant φ φ LinearMap.id := by
  intro v
  rfl

/-- Zero is an equivariant morphism, including in rank zero. -/
example (φ : V →ₛₗ[σ] V) (ψ : W →ₛₗ[σ] W) :
    FrobeniusEquivariant φ ψ (0 : V →ₗ[K] W) := by
  intro v
  simp

/-- Multiplication by a coefficient fixed by σ respects equivariance. -/
theorem frobeniusEquivariant_smul (φ : V →ₛₗ[σ] V) (ψ : W →ₛₗ[σ] W)
    (f : V →ₗ[K] W) (hf : FrobeniusEquivariant φ ψ f)
    (a : K) (ha : σ a = a) : FrobeniusEquivariant φ ψ (a • f) := by
  sorry

end Semilinear

/-! ## Layer 2: local monodromy -/

section Monodromy

variable {K V : Type*} [Field K] [AddCommGroup V] [Module K V]

/-- The monodromy convention is Nφ = qφN. The Frobenius used here is linear,
as for the q-power action over a finite residue field.
The logarithmic solution carrier is a separate roadmap target. -/
def FrobeniusMonodromyRelation (q : K) (φ N : V →ₗ[K] V) : Prop :=
  N.comp φ = q • (φ.comp N)

/-- Zero monodromy is allowed for every Frobenius. -/
example (q : K) (φ : V →ₗ[K] V) : FrobeniusMonodromyRelation q φ 0 := by
  simp [FrobeniusMonodromyRelation]

/-- With identity Frobenius and q ≠ 1, the relation forces zero monodromy. -/
theorem monodromy_zero_of_identity (q : K) (hq : q ≠ 1) (N : V →ₗ[K] V)
    (h : FrobeniusMonodromyRelation q LinearMap.id N) : N = 0 := by
  sorry

/-- The logarithmic Frobenius relation implies nilpotence in finite dimension
when its scalar has complex absolute value greater than one. This is the
linear-algebra milestone underlying the nilpotent residue target. -/
theorem monodromy_nilpotent {V : Type*} [AddCommGroup V] [Module ℂ V]
    [FiniteDimensional ℂ V] (q : ℂ) (hq : 1 < ‖q‖) (φ : V ≃ₗ[ℂ] V)
    (N : V →ₗ[ℂ] V) (h : FrobeniusMonodromyRelation q φ.toLinearMap N) :
    IsNilpotent N := by
  sorry

end Monodromy

/-! ## Layer 3: overconvergent coefficients -/

/- The point-category baseline uses a perfect residue field. Algebraic closure
is an additional hypothesis of rank-one classification, not of this carrier. -/
#check WittVector.Isocrystal

/-! ## Layer 4: rigid cohomology and compact support -/

section Twists

variable {K V : Type*} [Field K] [AddCommGroup V] [Module K V]

/-- The linear Frobenius on V(n) is q^(-n)φ. The nonzero hypothesis on q belongs
to applications. This is only the coefficient-space part of the categorical Tate twist. -/
def TateTwistedFrobenius (q : K) (n : ℤ) (φ : V →ₗ[K] V) : V →ₗ[K] V :=
  q ^ (-n) • φ

/-- Twisting by zero preserves Frobenius. -/
example (q : K) (φ : V →ₗ[K] V) : TateTwistedFrobenius q 0 φ = φ := by
  simp [TateTwistedFrobenius]

/-- A twist by one divides Frobenius by q. -/
example (q : K) (φ : V →ₗ[K] V) : TateTwistedFrobenius q 1 φ = q⁻¹ • φ := by
  simp [TateTwistedFrobenius]

/-- Twists add; nonzero q is necessary for negative integral exponents. -/
theorem tateTwistedFrobenius_add (q : K) (hq : q ≠ 0) (m n : ℤ)
    (φ : V →ₗ[K] V) :
    TateTwistedFrobenius q m (TateTwistedFrobenius q n φ) =
      TateTwistedFrobenius q (m + n) φ := by
  sorry

end Twists

/-! ## Layer 5: finiteness and duality -/

/- The algebraic coefficient dual supplies finite-dimensional duality. A strong
continuous dual, its topology and strictness require their separate roadmap targets. -/
#check Module.Dual

/-! ## Layer 6: traces, Fourier transform and weights -/

/-- Numerical purity after choosing a complex realisation of an eigenvalue. Applications require q > 1. This predicate includes no
algebraicity, integrality or assumption about other embeddings. -/
def HasIotaWeight (q w : ℝ) (α : ℂ) : Prop :=
  ‖α‖ = q ^ (w / 2)

/-- The constant coefficient has weight zero. -/
example (q : ℝ) : HasIotaWeight q 0 (1 : ℂ) := by
  simp [HasIotaWeight]

/-- Purity at one embedding need not make the trace real. -/
example (q : ℝ) : HasIotaWeight q 0 Complex.I ∧ Complex.I.im ≠ 0 := by
  simp [HasIotaWeight]

/-- Zero is not pure of any real weight over q > 1. -/
theorem zero_not_pure (q w : ℝ) (hq : 1 < q) : ¬ HasIotaWeight q w 0 := by
  sorry

/-- Products add weights; q is positive so real powers multiply. -/
theorem iotaWeight_mul (q w₁ w₂ : ℝ) (hq : 1 < q) (α β : ℂ)
    (hα : HasIotaWeight q w₁ α) (hβ : HasIotaWeight q w₂ β) :
    HasIotaWeight q (w₁ + w₂) (α * β) := by
  sorry

/-- An integral Tate twist changes weight by -2n. There is no integer Tate twist
by an arbitrary real number. -/
theorem iotaWeight_tateTwist (q w : ℝ) (hq : 1 < q) (n : ℤ) (α : ℂ)
    (hα : HasIotaWeight q w α) :
    HasIotaWeight q (w - 2 * (n : ℝ)) ((q : ℂ) ^ (-n) * α) := by
  sorry

/-- Purity of all roots of a matrix characteristic polynomial at one complex
realisation. It imposes no reality condition on traces. -/
def HasPureSpectrum {ι : Type*} [Fintype ι] [DecidableEq ι]
    (q w : ℝ) (F : Matrix ι ι ℂ) : Prop :=
  ∀ α : ℂ, F.charpoly.IsRoot α → HasIotaWeight q w α

/-- A weight spectrum on the zero-dimensional space is empty. -/
example (q w : ℝ) : HasPureSpectrum q w (1 : Matrix (Fin 0) (Fin 0) ℂ) := by
  sorry

/-- The scalar one has weight zero in dimension one. -/
example (q : ℝ) : HasPureSpectrum q 0 (1 : Matrix (Fin 1) (Fin 1) ℂ) := by
  sorry

/-! ## Layer 7: crystalline comparison and Weil factors -/

/- The reverse polynomial has the required det(1 - T F) convention. -/
#check Matrix.charpolyRev

/-- Factors of distinct pure weights have no common eigenvalue, so their ordinary
characteristic polynomials are coprime. This is the separation milestone, not
a claim of rational or integral coefficients. -/
theorem pure_charpolys_coprime {ι κ : Type*} [Fintype ι] [DecidableEq ι]
    [Fintype κ] [DecidableEq κ] (q w₁ w₂ : ℝ) (hq : 1 < q) (hw : w₁ ≠ w₂)
    (F : Matrix ι ι ℂ) (G : Matrix κ κ ℂ)
    (hF : HasPureSpectrum q w₁ F) (hG : HasPureSpectrum q w₂ G) :
    IsCoprime F.charpoly G.charpoly := by
  sorry

/-!
## Roadmap targets requiring additional carriers

The following definitions and constructions live in the roadmap, with their
full signatures, API outlines and discriminating checks. They are absent from
this file because their carriers or analytic operations are not at the pins.

* Robba coefficient rings and their Frobenius lifts.
* Partial valuations v_n, w_r on Witt vectors and the overconvergent Witt vectors W_con.
* Kedlaya's analytic rings Γ^ℓ_I, Γ^ℓ_an,r and Γ^ℓ_an,con.
* The extended Robba ring R^alg = Γ^alg_an,con over the completed algebraic closure of k((t)).
* The σ-equivariant embedding of R^int, R^bd, E, R into Γ^alg_con, Γ^alg_con[π^{-1}], Γ^alg[π^{-1}], R^alg.
* The derivation d/dt on annulus rings, R, R^bd, R^int, O_E and E, its norm bounds and Ω^1 = R dt.
* Differential (∇-)modules over annuli, the Robba ring and differential fields.
* Twisted polynomials F{T} and cyclic vectors.
* Spectral norm of ∂ on a differential module over a complete nonarchimedean differential field.
* Generic radius of convergence R(E, ρ), intrinsic radius T(E, ρ) and subsidiary radii.
* ∇-modules solvable at the boundary (overconvergent, 'soluble en 1').
* Highest break b(E) of a solvable ∇-module (differential irregularity).
* Break multiset and differential Swan conductor of a solvable ∇-module.
* Frobenius modules (σ-modules, φ-modules) over R^int, R^bd, R, O_E, E, R^alg and their Witt-vector analogues.
* Restriction and induction of Frobenius ([a]_*, [a]^*) and Frobenius pullback.
* Degree, rank and slope μ(M) = deg(M)/rank(M) of a σ-module.
* Semistable and stable σ-modules, HN filtrations, HN polygons and descent of subobjects.
* Standard σ-modules M_{c,d} and their tensor products, twists, duals, H^0, H^1, Hom and Ext.
* Frobenius slopes and Newton (HN) polygons of σ-modules: generic slopes over E and R^bd, special slopes over R.
* Pure (isoclinic) and unit-root σ-modules over R, R^bd and E.
* (σ,∇)-modules (φ,∇)-modules over R, R^bd, R^int, E and dagger algebras; Frobenius structures.
* Finite étale extensions of R^int and the Robba rings R^L of finite separable extensions of k((t)).
* Constant and quasi-constant ∇-modules over the Robba ring.
* Unipotent ∇-modules over the Robba ring.
* Quasi-unipotent ∇-modules and (σ,∇)-modules.
* The logarithmic Robba ring R^L_log = R^L[log u] with Frobenius, derivation and monodromy operator.
* The (φ, N, Gal)-module of logarithmic solutions (local monodromy representation).
* Frames (X ⊂ Y ⊂ P).
* The tube ]T[_P of a locally closed subscheme.
* Strict neighbourhoods of ]X[ in ]Y[.
* Berthelot's functor j† of overconvergent sections.
* Overconvergent isocrystals on a frame.
* Pullback of overconvergent isocrystals along morphisms of frames.
* The category Isoc†(X/K) of a separated finite type k-scheme.
* Overconvergent F-isocrystals.
* (σ,∇)-modules over a dagger algebra of Monsky–Washnitzer type.
* Restriction from overconvergent to convergent F-isocrystals.
* Pushforward of (overconvergent) F-isocrystals along finite étale morphisms.
* Monsky–Washnitzer cohomology of a (σ,∇)-module.
* The trace map on de Rham complexes for a finite flat morphism of dagger algebras.
* Berthelot's functor j† and the overconvergent de Rham complex of a frame.
* Rigid cohomology H^i_rig(X/K, E).
* Functoriality of rigid cohomology in the variety and the coefficient.
* Rigid cohomology with compact supports H^i_{c,rig}(X/K, E).
* Functoriality of compact-support cohomology: proper pullback and extension by zero.
* The forget-supports map H^i_{c,rig} → H^i_rig, an isomorphism for proper X.
* F-spaces: vector spaces with a semilinear Frobenius.
* The Frobenius on rigid cohomology.
* Rigid cohomology with supports in a closed subscheme H^i_{Z,rig}(X/K, E).
* Tate twists of F-spaces.
* The Robba ring over a reduced dagger algebra.
* (σ,∇)-modules over the Robba ring of a dagger algebra, relative to the base.
* Unipotent and strongly unipotent bases over a relative Robba ring.
* Near-injections, near-surjections and near-isomorphisms of K-vector spaces.
* Local Robba algebras at the missing points of an affine curve.
* Strict maps and the LF, Fréchet and Montel conditions over a discretely valued field.
* The generic higher direct images of a (σ,∇)-module along A → A⟨x⟩†.
* Proper hypercoverings by smooth schemes over purely inseparable extensions.
* The trace map on top-degree compact-support cohomology.
* The Poincaré pairing between rigid cohomology and compact-support cohomology.
* The Künneth morphisms.
* The linear q-power Frobenius on rigid cohomology over F_q.
* Fibres and the linear Frobenius at a closed point.
* Tate twists of overconvergent F-isocrystals.
* The L-function of an overconvergent F-isocrystal.
* Dwork operators.
* Galois Frobenius lifts.
* The canonical Dwork operator ψ.
* Pointwise ι-weights of overconvergent F-isocrystals.
* The overconvergent Weyl algebra D†.
* The Fourier automorphism ρ of D†.
* The p-adic Fourier transform of a D†-module.
* The Dwork (Artin–Schreier) isocrystal L_π.
* The naive geometric Fourier transform.
* Local monodromy representation and Swan conductor of an overconvergent F-isocrystal.
* ι-real and ι-realizable overconvergent F-isocrystals.
* ι-determinantal weights.
* The global monodromy group G_M.
* p-adic slopes of Frobenius eigenvalues and slope intervals.
* The Weil factors P_i of a smooth proper variety over F_q.

The coefficient-linear Frobenius morphism condition, linear monodromy relation,
linear Tate twists, and complex numerical weights have representative signatures
above; their full analytic and categorical versions remain these roadmap targets.
-/

end

end TauCetiRoadmap.PadicDifferentialEquationsAndRigidCohomology
