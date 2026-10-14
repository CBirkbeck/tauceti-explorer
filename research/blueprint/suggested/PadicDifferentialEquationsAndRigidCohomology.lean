import Mathlib.Algebra.Algebra.Rat
import Mathlib.Algebra.Category.FGModuleCat.Basic
import Mathlib.Algebra.Field.Rat
import Mathlib.Algebra.Field.ZMod
import Mathlib.Algebra.Group.AddChar
import Mathlib.Algebra.GroupWithZero.Basic
import Mathlib.Algebra.Homology.DerivedCategory.Basic
import Mathlib.Algebra.Homology.HomologicalComplex
import Mathlib.Algebra.Homology.ShortComplex.HomologicalComplex
import Mathlib.Algebra.Homology.ShortComplex.SnakeLemma
import Mathlib.Algebra.Lie.CartanCriterion
import Mathlib.Algebra.Lie.Engel
import Mathlib.Algebra.Lie.TraceForm
import Mathlib.Algebra.Module.LinearMap.Defs
import Mathlib.Algebra.Module.Projective
import Mathlib.Algebra.Module.Submodule.Ker
import Mathlib.Algebra.Module.Submodule.Range
import Mathlib.Algebra.Polynomial.Basic
import Mathlib.Algebra.Polynomial.Derivative
import Mathlib.Algebra.Polynomial.Div
import Mathlib.Algebra.Polynomial.Eval.Defs
import Mathlib.Algebra.Polynomial.Reverse
import Mathlib.Algebra.Polynomial.Roots
import Mathlib.Algebra.SkewPolynomial.Basic
import Mathlib.AlgebraicGeometry.Morphisms.ClosedImmersion
import Mathlib.AlgebraicGeometry.Morphisms.Etale
import Mathlib.AlgebraicGeometry.Morphisms.FiniteType
import Mathlib.AlgebraicGeometry.Morphisms.Proper
import Mathlib.AlgebraicGeometry.Morphisms.Separated
import Mathlib.AlgebraicGeometry.Morphisms.Smooth
import Mathlib.AlgebraicGeometry.OpenImmersion
import Mathlib.AlgebraicGeometry.Scheme
import Mathlib.Analysis.Complex.Basic
import Mathlib.Analysis.InnerProductSpace.PiL2
import Mathlib.Analysis.LocallyConvex.WithSeminorms
import Mathlib.Analysis.Normed.Field.Approximation
import Mathlib.Analysis.Normed.Field.Basic
import Mathlib.Analysis.Normed.Field.Dense
import Mathlib.Analysis.Normed.Field.Krasner
import Mathlib.Analysis.Normed.Unbundled.SpectralNorm
import Mathlib.Analysis.SpecialFunctions.Log.Base
import Mathlib.Analysis.SpecialFunctions.Pow.Real
import Mathlib.CategoryTheory.Abelian.Basic
import Mathlib.CategoryTheory.Abelian.DiagramLemmas.Four
import Mathlib.CategoryTheory.Equivalence
import Mathlib.CategoryTheory.Functor.FullyFaithful
import Mathlib.CategoryTheory.Linear.LinearFunctor
import Mathlib.CategoryTheory.Monoidal.Braided.Basic
import Mathlib.CategoryTheory.Monoidal.Category
import Mathlib.CategoryTheory.Monoidal.Linear
import Mathlib.CategoryTheory.Monoidal.Rigid.Basic
import Mathlib.CategoryTheory.Sites.Sheaf
import Mathlib.CategoryTheory.Triangulated.Pretriangulated
import Mathlib.Data.Nat.Choose.Basic
import Mathlib.Data.Nat.Factorial.Basic
import Mathlib.Data.Nat.Log
import Mathlib.Data.Nat.Sqrt
import Mathlib.Data.ZMod.Basic
import Mathlib.FieldTheory.AbsoluteGaloisGroup
import Mathlib.FieldTheory.Finite.GaloisField
import Mathlib.FieldTheory.Galois.Basic
import Mathlib.FieldTheory.IsAlgClosed.Basic
import Mathlib.FieldTheory.IsAlgClosed.Classification
import Mathlib.FieldTheory.Minpoly.Basic
import Mathlib.FieldTheory.Perfect
import Mathlib.FieldTheory.RatFunc.Defs
import Mathlib.FieldTheory.Separable
import Mathlib.LinearAlgebra.Basis.Defs
import Mathlib.LinearAlgebra.Basis.SMul
import Mathlib.LinearAlgebra.Charpoly.Basic
import Mathlib.LinearAlgebra.Dual.Defs
import Mathlib.LinearAlgebra.Eigenspace.Basic
import Mathlib.LinearAlgebra.ExteriorAlgebra.Basic
import Mathlib.LinearAlgebra.FiniteDimensional.Defs
import Mathlib.LinearAlgebra.FreeModule.Basic
import Mathlib.LinearAlgebra.Matrix.Charpoly.Basic
import Mathlib.LinearAlgebra.Matrix.Charpoly.Coeff
import Mathlib.LinearAlgebra.Matrix.Determinant.Basic
import Mathlib.LinearAlgebra.PerfectPairing.Basic
import Mathlib.LinearAlgebra.Quotient.Defs
import Mathlib.LinearAlgebra.TensorProduct.Defs
import Mathlib.LinearAlgebra.Trace
import Mathlib.NumberTheory.LegendreSymbol.AddCharacter
import Mathlib.NumberTheory.Padics.Complex
import Mathlib.NumberTheory.Padics.PadicIntegers
import Mathlib.NumberTheory.Padics.PadicNumbers
import Mathlib.NumberTheory.Padics.PadicVal.Basic
import Mathlib.RepresentationTheory.Basic
import Mathlib.RepresentationTheory.FDRep
import Mathlib.RingTheory.Derivation.Basic
import Mathlib.RingTheory.Derivation.DifferentialRing
import Mathlib.RingTheory.DiscreteValuationRing.Basic
import Mathlib.RingTheory.Etale.Basic
import Mathlib.RingTheory.Finiteness.Defs
import Mathlib.RingTheory.Flat.FaithfullyFlat.Basic
import Mathlib.RingTheory.Flat.TorsionFree
import Mathlib.RingTheory.Frobenius
import Mathlib.RingTheory.HahnSeries.Basic
import Mathlib.RingTheory.Henselian
import Mathlib.RingTheory.Ideal.Span
import Mathlib.RingTheory.LaurentSeries
import Mathlib.RingTheory.Noetherian.Defs
import Mathlib.RingTheory.Norm.Defs
import Mathlib.RingTheory.Polynomial.GaussLemma
import Mathlib.RingTheory.PowerSeries.Basic
import Mathlib.RingTheory.PowerSeries.Derivative
import Mathlib.RingTheory.PowerSeries.Exp
import Mathlib.RingTheory.PowerSeries.Substitution
import Mathlib.RingTheory.PrincipalIdealDomain
import Mathlib.RingTheory.RootsOfUnity.PrimitiveRoots
import Mathlib.RingTheory.Smooth.Basic
import Mathlib.RingTheory.Trace.Defs
import Mathlib.RingTheory.Valuation.Basic
import Mathlib.RingTheory.WittVector.Basic
import Mathlib.RingTheory.WittVector.Defs
import Mathlib.RingTheory.WittVector.Frobenius
import Mathlib.RingTheory.WittVector.Isocrystal
import Mathlib.RingTheory.WittVector.Teichmuller
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.NormNum
import Mathlib.Tactic.NormNum.Prime
import Mathlib.Tactic.Ring
import Mathlib.Topology.Algebra.InfiniteSum.DiscreteConvolution
import Mathlib.Topology.Algebra.Module.FiniteDimension
import Mathlib.Topology.MetricSpace.Ultra.Basic
import Mathlib.Topology.UniformSpace.Completion
import TauCeti.Algebra.AlgebraicGroup.Representation.Tannaka.GroupFunctor
import TauCeti.Algebra.Coalgebra.Comodule.Finite.Rigid
import TauCeti.Algebra.Coalgebra.Comodule.Finite.Symmetric
import TauCeti.AlgebraicGeometry.EllipticCurve.PointCount
import TauCeti.RepresentationTheory.GaloisDescent.Injective
import TauCeti.RepresentationTheory.GaloisDescent.Span

/-!
# P-adic differential equations, rigid cohomology and p-adic weights

This file is not the roadmap and is not exhaustive. The definitive specification is
`research/blueprint/readmes/PadicDifferentialEquationsAndRigidCohomology.md`.
These signatures suggest Lean forms for contributors and reviewers, using only
carriers present at Mathlib 082e2d3 and Tau Ceti f790474. Light definitions have real
bodies; `sorry` marks proposed theorem proofs. Analytic coefficient rings, tubes,
isocrystal categories and their cohomology remain targets in the reader.

Frobenius is semilinear until the coefficient automorphism is trivial. Invertibility
means invertibility of its linearisation. Tate twists multiply linear q-Frobenius by
q^(-n), lowering weights by 2n. Reverse characteristic polynomials use det(1 - T F).
The finite linear and formal-series checks below do not replace the analytic
convergence, topology, descent or comparison conditions of the full targets.
-/

/-! ## Representative milestones across the layers -/

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

/-! ## RD.0 signatures -/

namespace TauCetiRoadmap.PadicDifferentialEquationsAndRigidCohomology.RD0

section ValuationBasis

variable {K V ι ι' : Type*} [NormedField K]
  [NormedAddCommGroup V] [NormedSpace K V]

/-- Weighted finite-coordinate maximum on an existing algebraic basis. -/
def IsValuationBasis (b : Module.Basis ι K V) : Prop :=
  ∀ c : ι →₀ K, ‖b.repr.symm c‖₊ =
    c.support.sup (fun i => ‖c i • b i‖₊)

-- Reader target valuation-basis: coordinates cannot cancel their maximum.
theorem IsValuationBasis.coordinate_le (b : Module.Basis ι K V)
    (hb : IsValuationBasis b) (x : V) (i : ι) :
    ‖(b.repr x) i‖ * ‖b i‖ ≤ ‖x‖ := by
  sorry

-- Reindexing changes labels, not the weighted maximum.
theorem IsValuationBasis.reindex_iff (b : Module.Basis ι K V) (e : ι ≃ ι') :
    IsValuationBasis (b.reindex e) ↔ IsValuationBasis b := by
  sorry

-- Rescaling the vectors by units divides the coordinates and keeps the property.
theorem IsValuationBasis.rescale_iff (b : Module.Basis ι K V) (w : ι → Kˣ) :
    IsValuationBasis (b.unitsSMul w) ↔ IsValuationBasis b := by
  sorry

-- Test valuationBasis_zero: empty support gives zero, even for an infinite index set.
example (b : Module.Basis ι K V) :
    ‖b.repr.symm (0 : ι →₀ K)‖₊ =
      (0 : ι →₀ K).support.sup (fun i => ‖(0 : ι →₀ K) i • b i‖₊) := by
  simp

-- Test valuationBasis_singleton: the singleton basis has the expected weighted norm.
example : IsValuationBasis (Module.Basis.singleton PUnit K) := by
  sorry

-- Test valuationBasis_bad_change: under the sup norm, (1,0),(1,π) is not a
-- valuation basis, since the difference of the two vectors has norm ‖π‖ < 1.
example (π : K) (hπ0 : 0 < ‖π‖) (hπ1 : ‖π‖ < 1)
    (b : Module.Basis (Fin 2) K (Fin 2 → K)) (h0 : b 0 = ![1, 0]) (h1 : b 1 = ![1, π]) :
    ¬ IsValuationBasis b := by
  sorry

-- Test valuationBasis_archimedean: the Euclidean basis of R² fails at (1,1).
example : ¬ IsValuationBasis (EuclideanSpace.basisFun (Fin 2) ℝ).toBasis := by
  sorry

end ValuationBasis

section Endpoints

variable {R : Type*} [CommRing R]

-- Reader target endpoint-preserving-weak-homotopy: the kernel over any ring.
theorem polynomial_endpoints_kernel (f : Polynomial R) :
    (f.eval 0 = 0 ∧ f.eval 1 = 0) ↔
      (Polynomial.X * (Polynomial.X - 1) : Polynomial R) ∣ f := by
  sorry

-- No domain or reducedness hypothesis is needed for joint surjectivity.
theorem polynomial_endpoints_surjective (x y : R) :
    ∃ f : Polynomial R, f.eval 0 = x ∧ f.eval 1 = y := by
  sorry

-- A fixed-endpoint perturbation is zero at both endpoints.
example (g : Polynomial R) :
    ((Polynomial.X * (Polynomial.X - 1)) * g).eval 0 = 0 ∧
      ((Polynomial.X * (Polynomial.X - 1)) * g).eval 1 = 0 := by
  simp

-- Linear interpolation of the values of X and X² cannot be an algebra map.
example : (Polynomial.X : Polynomial ℚ)^2 ≠ Polynomial.X := by
  sorry

end Endpoints

section Denominators

-- Reader target rational-dagger-interval-integration: polynomial growth.
theorem padic_integral_denominator_bound (p : ℕ) [Fact p.Prime] (n : ℕ) :
    ‖((n + 1 : ℚ_[p])⁻¹)‖ ≤ (n + 1 : ℝ) := by
  sorry

-- Test integrate_not_integral, numerical core: 1/p is not integral.
example (p : ℕ) [Fact p.Prime] : ‖((p : ℚ_[p])⁻¹)‖ > 1 := by
  sorry

end Denominators

end TauCetiRoadmap.PadicDifferentialEquationsAndRigidCohomology.RD0

/-! ## RD.1 signatures -/

/-
This file is not the roadmap and is not exhaustive. The roadmap document is
definitive. These suggested Lean forms help contributors and reviewers converge
on names and signatures; they are proposed targets, not formalised results. Proof placeholders are intentional. The README gives the full scope,
source locators, dependencies, analytic gaps, API and acceptance checks.

WORKERS.md's fixed shape is used: real-bodied light definitions on pinned
carriers, terminal statements and a few examples. No analytic ring, connection
category, isocrystal, quotient-cohomology or Frobenius-bundle carrier is invented
here. The predicate CyclicFor is only an adapter for the existing main packet's
cyclicity target. The natural-number basis input lets the finite candidate be
written without dependent indexing; the theorem pins its first n entries to a
finite basis. IsRationalType states Kedlaya–Xiao's rational-type condition on a
normed field with a derivation, both of which exist at the pins.
-/

noncomputable section

namespace TauCetiRoadmap.PadicDifferentialEquationsAndRigidCohomology.RD1

open scoped BigOperators

variable {K V : Type*} [Field K] [AddCommGroup V] [Module K V]

/-- The explicit finite Katz candidate. Its body uses only pinned carriers. -/
def katzCandidate (D : V → V) (e : ℕ → V) (n : ℕ) (x : K) : V :=
  ∑ j ∈ Finset.range n,
    (x ^ j / (Nat.factorial j : K)) •
      ∑ k ∈ Finset.range (j + 1),
        (((-1 : K) ^ k) * (Nat.choose j k : K)) • (D^[k]) (e (j - k))

/-- A signature adapter to cyclicity, which the accepted main packet owns. -/
def CyclicFor (D : V → V) (n : ℕ) (v : V) : Prop :=
  ∃ b : Module.Basis (Fin n) K V, ∀ i, b i = (D^[i.val]) v

/-- The empty candidate tests the finite-sum convention. -/
example (D : V → V) (e : ℕ → V) (x : K) :
    katzCandidate D e 0 x = 0 := by
  sorry

/-- Rank one does not require a condition on x. -/
example (D : V → V) (e : ℕ → V) (x : K) :
    katzCandidate D e 1 x = e 0 := by
  sorry

/-- A horizontal rank-two basis fixes the sign of the Taylor correction. -/
example (D : V → V) (e : ℕ → V) (x : K)
    (h₀ : D (e 0) = 0) :
    katzCandidate D e 2 x = e 0 + x • e 1 := by
  sorry

/-- Naturality is one of the explicit candidate's API targets. -/
theorem katzCandidate_naturality {W : Type*} [AddCommGroup W] [Module K W]
    (D : V → V) (E : W → W) (f : V →ₗ[K] W) (e : ℕ → V)
    (n : ℕ) (x : K) (h : ∀ v, f (D v) = E (f v)) :
    f (katzCandidate D e n x) = katzCandidate E (fun i => f (e i)) n x := by
  sorry

section CharacteristicZero

variable [CharZero K] [Algebra ℚ K] [Module ℚ V] [IsScalarTower ℚ K V]

/-- Katz's field algorithm, restricted to the statable characteristic-zero case.
The D operator is rational-linear and satisfies the connection Leibniz rule. -/
theorem katz_cyclic_vector_algorithm
    (δ : Derivation ℚ K K) (D : V →ₗ[ℚ] V)
    (hD : ∀ (a : K) (v : V), D (a • v) = δ a • v + a • D v)
    (n : ℕ) (hn : 0 < n) (b : Module.Basis (Fin n) K V)
    (e : ℕ → V) (he : ∀ i : Fin n, e i.val = b i)
    (t : K) (ht : δ t = 1) :
    ∃ a : ℚ, CyclicFor (K := K) D n (katzCandidate D e n (t - algebraMap ℚ K a)) := by
  sorry

/-- Cyclicity is preserved when a nonzero field derivation is normalised.
This is an end comparison, not a chain developing differential-module theory. -/
theorem cyclic_rescaling
    (δ : Derivation ℚ K K) (D : V →ₗ[ℚ] V)
    (hD : ∀ (a : K) (v : V), D (a • v) = δ a • v + a • D v)
    (s : K) (hs : s ≠ 0) (n : ℕ) (v : V) :
    CyclicFor (K := K) (fun w => s⁻¹ • D w) n v ↔ CyclicFor (K := K) D n v := by
  sorry

end CharacteristicZero

section RationalType

variable {F : Type*} [NormedField F] [IsUltrametricDist F] [CharZero F]

/-- Kedlaya–Xiao rational type (Definition 1.4.1), in an equivalent form: `∂u = 1` and
`‖∂ⁿx / n!‖ ≤ ‖u‖⁻ⁿ ‖x‖` for `n ≥ 1`. With `∂u = 1`, the case `n = 1` gives `‖∂‖ = ‖u‖⁻¹`.
The intrinsic radii built on it need spectral norms of modules and stay README targets. -/
def IsRationalType (D : Derivation ℚ F F) (u : F) : Prop :=
  D u = 1 ∧ ∀ n : ℕ, 1 ≤ n → ∀ x : F,
    ‖(D^[n] x) / (Nat.factorial n : F)‖ ≤ ‖u‖⁻¹ ^ n * ‖x‖

/-- A rational parameter is nonzero, since a derivation kills `0`. -/
example (D : Derivation ℚ F F) (u : F) (h : IsRationalType D u) : u ≠ 0 := by
  sorry

/-- Moving the parameter by a constant of no larger norm keeps rational type
(Kedlaya–Xiao, Remark 1.4.3). -/
theorem IsRationalType.add_const (D : Derivation ℚ F F) (u c : F)
    (h : IsRationalType D u) (hc : D c = 0) (hcu : ‖c‖ ≤ ‖u‖) :
    IsRationalType D (u + c) := by
  sorry

end RationalType
end TauCetiRoadmap.PadicDifferentialEquationsAndRigidCohomology.RD1

/-! ## RD.2 signatures -/

namespace TauCetiRoadmap.PadicDifferentialEquationsAndRigidCohomology.RD2

noncomputable section

/-! ## RD.0/completed-algebraic-closure-is-algebraically-closed -/

/-- The completion of an algebraically closed nonarchimedean field is algebraically closed, in
every characteristic: Mathlib's `IsAlgClosed.of_denseRange` without its `CharZero` hypothesis.
The proof replaces Krasner's lemma by continuity of roots
(`Polynomial.exists_aroots_norm_sub_lt_of_norm_coeff_sub_lt`) and a Cauchy subsequence. -/
theorem isAlgClosed_of_denseRange {K L : Type*} [Field K] [NontriviallyNormedField L]
    [CompleteSpace L] [IsUltrametricDist L] [Algebra K L]
    (hi : DenseRange (algebraMap K L)) [IsAlgClosed K] : IsAlgClosed L := by
  sorry

/-- In characteristic zero the statement is Mathlib's. -/
example {K L : Type*} [Field K] [NontriviallyNormedField L] [CompleteSpace L] [CharZero L]
    [IsUltrametricDist L] [Algebra K L] (hi : DenseRange (algebraMap K L)) [IsAlgClosed K] :
    IsAlgClosed L :=
  IsAlgClosed.of_denseRange hi

/-- Test: `ℂ_[p]`, the completion of an algebraic closure of `ℚ_[p]`. -/
example (p : ℕ) [Fact p.Prime] : IsAlgClosed ℂ_[p] :=
  isAlgClosed_of_denseRange (K := PadicAlgCl p) UniformSpace.Completion.denseRange_coe

/-! ## RD.2/c-constant-unit-root-module: the matrix condition

A unit-root module is c-constant when some basis has Frobenius matrix `A` with `‖A − 1‖ ≤ c`
entrywise for the 1-Gauss norm. The module carrier is a roadmap target; the matrix condition is
stated over any normed ring. -/

section CConstant

variable {R : Type*} [NormedRing R]

/-- The Frobenius-matrix condition of c-constancy: every entry of `A − 1` has norm at most `c`. -/
def IsWithinOfOne {n : Type*} [DecidableEq n] (c : ℝ) (A : Matrix n n R) : Prop :=
  ∀ i j, ‖(A - 1) i j‖ ≤ c

/-- The identity matrix satisfies the condition for every `c ≥ 0` (the trivial module). -/
example {n : Type*} [DecidableEq n] (c : ℝ) (hc : 0 ≤ c) :
    IsWithinOfOne c (1 : Matrix n n R) := by
  intro i j
  simpa using hc

/-- Monotonicity in `c`. -/
theorem IsWithinOfOne.mono {n : Type*} [DecidableEq n] {c c' : ℝ} {A : Matrix n n R}
    (hA : IsWithinOfOne c A) (h : c ≤ c') : IsWithinOfOne c' A :=
  fun i j => (hA i j).trans h

/-- Tensor products of c-constant modules are c-constant: over an ultrametric normed ring, the
Kronecker product of two integral matrices within `c` of the identity is within `c` of the
identity (`A ⊗ B − 1 = (A − 1) ⊗ B + 1 ⊗ (B − 1)`). -/
theorem IsWithinOfOne.kronecker [IsUltrametricDist R] [NormOneClass R]
    {m n : Type*} [DecidableEq m] [DecidableEq n] {c : ℝ}
    {A : Matrix m m R} {B : Matrix n n R} (hA : IsWithinOfOne c A) (hB : IsWithinOfOne c B)
    (hB1 : ∀ i j, ‖B i j‖ ≤ 1) :
    IsWithinOfOne c (Matrix.kronecker A B) := by
  sorry

end CConstant

/-! ## RD.2/small-constant-unit-root-module-is-trivial: where `p^(−1/(p−1))` enters

In the key lemma, interpolating `|N|₁ ≤ c` and `|N|_{α^p} ≤ p` by log-convexity improves the
radius `α` to `β` with `log β = (p log c / (log c − log p)) · log α`. The improvement is strict
exactly when `c < p^(−1/(p−1))`. -/

/-- The exponent of Tsuzuki's key lemma exceeds one below the threshold. -/
theorem tsuzuki_exponent_gt_one (p c : ℝ) (hp : 1 < p) (hc0 : 0 < c)
    (hc : c < p ^ (-(1 / (p - 1)))) :
    1 < p * Real.log c / (Real.log c - Real.log p) := by
  sorry

/-- At the threshold `c = p^(−1/(p−1))` the exponent is exactly one, matching the sharpness of
the bound (Dwork's module is `p^(−1/(p−1))`-constant but not trivial). -/
theorem tsuzuki_exponent_eq_one (p : ℝ) (hp : 1 < p) :
    p * Real.log (p ^ (-(1 / (p - 1)))) /
      (Real.log (p ^ (-(1 / (p - 1)))) - Real.log p) = 1 := by
  sorry

/-! ## RD.2/quasi-unipotent-modules-admit-frobenius-structures: the residue under Frobenius

Pulling a unipotent module with residue `N` back along `t ↦ t^q` multiplies the residue by `q`.
A Frobenius structure exists because `q • N` is conjugate to `N`. -/

/-- A nilpotent matrix is conjugate to each of its nonzero multiples. -/
theorem exists_conj_eq_smul_of_isNilpotent {K : Type*} [Field K] {n : Type*} [Fintype n]
    [DecidableEq n] (N : Matrix n n K) (hN : IsNilpotent N) (q : K) (hq : q ≠ 0) :
    ∃ P : GL n K, (P : Matrix n n K) * N * ((P⁻¹ : GL n K) : Matrix n n K) = q • N := by
  sorry

/-- Test: the Jordan block of size two, conjugated by `diag(1, q⁻¹)`. -/
example {K : Type*} [Field K] (q : K) (hq : q ≠ 0) :
    ∃ P : GL (Fin 2) K, (P : Matrix (Fin 2) (Fin 2) K) * !![0, 1; 0, 0] *
      ((P⁻¹ : GL (Fin 2) K) : Matrix (Fin 2) (Fin 2) K) = q • !![0, 1; 0, 0] := by
  sorry

/-- The Kummer module `∇v = (1/m) v dt/t` has a Frobenius structure of order `h` as soon as
`m ∣ p^h − 1`; such an `h ≥ 1` exists when `p` and `m` are coprime. -/
theorem exists_dvd_pow_sub_one (p m : ℕ) (hm : 0 < m) (hpm : Nat.Coprime p m) :
    ∃ h, 0 < h ∧ m ∣ p ^ h - 1 := by
  sorry

/-! ## RD.2/highest-break-under-finite-etale-pullback: the Artin–Schreier Herbrand function -/

/-- The Herbrand function of an Artin–Schreier extension with break `d`
(Kedlaya, overview, Example 2.1.10): `m` up to `d`, then `d + (m − d)/p`. -/
def artinSchreierHerbrand (p d m : ℝ) : ℝ :=
  if m ≤ d then m else d + (m - d) / p

/-- Below the break the function is the identity. -/
example (p d m : ℝ) (h : m ≤ d) : artinSchreierHerbrand p d m = m := by
  simp [artinSchreierHerbrand, h]

/-- Its inverse sends `β ≥ d` to `pβ − (p − 1)d`: a break `β` of a module becomes the break
`pβ − (p − 1)d` after pulling back along an Artin–Schreier cover of break `d`. -/
theorem artinSchreierHerbrand_apply_inv (p d β : ℝ) (hp : 1 < p) (hβ : d ≤ β) :
    artinSchreierHerbrand p d (p * β - (p - 1) * d) = β := by
  sorry

/-! ## RD.2/unipotent-solutions-and-residues: formal solutions of a unipotent connection

On `V ⊗ K⟦x⟧` with `x d/dx` acting by the nilpotent `N`, a horizontal homomorphism to
`(K⟦x⟧, x d/dx)` is constant and kills the image of `N`: the solution space is `(coker N)^∨`.
The analytic version on the open unit disc is the roadmap target. -/

open PowerSeries in
/-- Horizontal homomorphisms into formal power series are constant and vanish on `range N`. -/
theorem horizontal_formal_solutions {K V : Type*} [Field K] [CharZero K] [AddCommGroup V]
    [Module K V] (N : V →ₗ[K] V) (hN : IsNilpotent N) (φ : V →ₗ[K] PowerSeries K)
    (h : ∀ v, φ (N v) = X * d⁄dX K (φ v)) :
    (∀ v, φ v = C (constantCoeff (φ v))) ∧ ∀ v, φ (N v) = 0 := by
  sorry

/-! ## Tau Ceti inputs used by the roadmap targets of this part -/

/- Semilinear Galois descent (Hilbert–Noether), used for `D(V)`, `D†(V)` and quasi-constant
modules. -/
#check @TauCeti.GaloisDescent.span_invariants_eq_top
#check @TauCeti.GaloisDescent.liftBaseChange_injective_of_invariant

/- Comodule reconstruction, used for the Tannakian group `I × G_a` of `MCF(R_K̄/K̄)`. -/
#check @TauCeti.Tannaka.pointsFunctorIsoTensorAutFunctor

/-!
## Roadmap targets requiring additional carriers

The following targets of this part are stated in the roadmap with their hypotheses, APIs and
checks. Their carriers (Amice and Robba rings with Frobenius lifts, differential modules,
Galois actions on unramified extensions, Tannakian categories of differential modules) are not
at the pins, so they are not declared here.

* `RD.2/unramified-extensions-of-amice-rings` — `AmiceRing.unramifiedExt`,
  `AmiceRing.boundedUnramifiedExt`, `AmiceRing.completedMaxUnramified`, `AmiceRing.galoisAction`,
  `AmiceRing.fixedPoints`, `AmiceRing.ker_derivation`, `AmiceRing.frobenius_invariants`.
* `RD.2/c-constant-unit-root-module` — `IsCConstant` (its matrix condition is
  `IsWithinOfOne` above), `IsCConstant.tensor`, `IsCConstant.changeFrobenius`,
  `IsCConstant.iff_galois`.
* `RD.2/lang-trivialisation-of-unit-root-modules` — fixed bases over `Ẽ` and c-constancy over a
  finite separable extension.
* `RD.2/galois-representation-to-differential-module` — `unitRootModule` (`D(V)`),
  `overconvergentUnitRootModule` (`D†(V)`), `HasFiniteLocalMonodromy`.
* `RD.2/fontaine-katz-unit-root-equivalence` — the equivalence `V₀ ↦ D(V)`.
* `RD.2/unit-root-matrix-normal-form`, `RD.2/dwork-transfer-to-the-centre-of-a-disc`,
  `RD.2/small-constant-unit-root-module-is-trivial` (numerical core above),
  `RD.2/tsuzuki-equivalence-finite-local-monodromy`.
* `RD.2/quasi-constant-modules-are-semilinear-representations`, `RD.2/matsuda-decomposition`.
* `RD.2/highest-break-under-finite-etale-pullback` (Herbrand function above),
  `RD.2/matsuda-highest-break-theorem`, `RD.2/irregularity-equals-swan-conductor`.
* `RD.2/quasi-unipotent-modules-admit-frobenius-structures` (residue twist above),
  `RD.2/differential-modules-with-algebraic-constants` — `RobbaAlgConst`, `DiffModCat`, `MCS`,
  `MCF`, `MCF.eq_quasiUnipotent`, `unipotentEquiv`, `logFiberFunctor`.
* `RD.2/unipotent-solutions-and-residues` (formal core above), `RD.2/andre-local-monodromy-group`.
* `RD.2/local-monodromy-over-finite-etale-robba-extensions`.
-/

end

end TauCetiRoadmap.PadicDifferentialEquationsAndRigidCohomology.RD2

/-! ## RD.3 signatures -/

namespace TauCetiRoadmap.PadicDifferentialEquationsAndRigidCohomology.RD3

open Filter Topology

noncomputable section

/-! ## Layer RD.3: convergent versus overconvergent coefficient growth -/

section Growth

variable {K : Type*} [NormedField K]

/-- The coefficients of a one-variable power series `∑ aₙ tⁿ` converging on the closed unit disc,
i.e. of an element of the Tate algebra `K⟨t⟩`: the norms tend to zero. These are the functions on
the tube `]A¹[` of the affine line in the frame `(A¹, P¹, P̂¹)`. -/
def IsConvergentCoeffs (a : ℕ → K) : Prop :=
  Tendsto (fun n => ‖a n‖) atTop (𝓝 0)

/-- The coefficients of an overconvergent power series, i.e. of an element of `K⟨t⟩†`: the series
converges on a disc of some radius `ρ > 1` (Berthelot 96-03 (2.1.2.2), (2.1.2.3)). These are the
global sections of `j†O` on the frame `(A¹, P¹, P̂¹)`. -/
def IsOverconvergentCoeffs (a : ℕ → K) : Prop :=
  ∃ ρ : ℝ, 1 < ρ ∧ Tendsto (fun n => ‖a n‖ * ρ ^ n) atTop (𝓝 0)

/-- Degenerate case: the zero series is overconvergent. -/
example : IsOverconvergentCoeffs (fun _ : ℕ => (0 : K)) :=
  ⟨2, by norm_num, by simp⟩

/-- Overconvergent series converge on the closed unit disc: `K⟨t⟩† ⊆ K⟨t⟩`. -/
theorem IsOverconvergentCoeffs.isConvergentCoeffs {a : ℕ → K} (h : IsOverconvergentCoeffs a) :
    IsConvergentCoeffs a := by
  obtain ⟨ρ, hρ, h⟩ := h
  refine squeeze_zero (fun n => norm_nonneg _) (fun n => ?_) h
  calc ‖a n‖ = ‖a n‖ * 1 := (mul_one _).symm
    _ ≤ ‖a n‖ * ρ ^ n := mul_le_mul_of_nonneg_left (one_le_pow₀ hρ.le) (norm_nonneg _)

end Growth

section PadicGrowth

variable (p : ℕ) [Fact p.Prime]

/-- Geometric decay: the coefficients `pⁿ` are overconvergent (the series converges for `|t| < p`). -/
example : IsOverconvergentCoeffs (fun n : ℕ => (p : ℚ_[p]) ^ n) := by
  sorry

/-- Non-example separating the two rings: the coefficients `p^⌊√n⌋` tend to zero, but not
geometrically, so `∑ p^⌊√n⌋ tⁿ` lies in `ℚ_p⟨t⟩` and not in `ℚ_p⟨t⟩†`. -/
example : IsConvergentCoeffs (fun n : ℕ => (p : ℚ_[p]) ^ Nat.sqrt n) ∧
    ¬ IsOverconvergentCoeffs (fun n : ℕ => (p : ℚ_[p]) ^ Nat.sqrt n) := by
  sorry

/-- A `p`-adic Liouville-type exponent (`liouville-exponent-sequence`): there is a non-integral
`a ∈ ℤ_p` for which `pⁿ / (n + a)` tends to zero but not geometrically. It produces the extension of
the unit object by the Kummer isocrystal `K_a` on `G_m` whose splitting is convergent but not
overconvergent (`liouville-extension-counterexample`). One may take `a = -∑ p^{m_k}` with
`m₁ = 2` and `m_{k+1} = N_k - k`, `N_k = ∑_{j ≤ k} p^{m_j}`. -/
theorem exists_liouville_exponent :
    ∃ a : ℤ_[p], (∀ n : ℤ, (a : ℚ_[p]) ≠ n) ∧
      IsConvergentCoeffs (fun n : ℕ => (p : ℚ_[p]) ^ (n + 1) / (((n + 1 : ℕ) : ℚ_[p]) + a)) ∧
      ¬ IsOverconvergentCoeffs
        (fun n : ℕ => (p : ℚ_[p]) ^ (n + 1) / (((n + 1 : ℕ) : ℚ_[p]) + a)) := by
  sorry

/-- Contrast: a rational exponent gives overconvergent coefficients. For `p` odd,
`v_p(n - 1/2) = v_p(2n - 1) ≤ log_p (2n)`, so `‖pⁿ / (n - 1/2)‖ ≤ 2n p⁻ⁿ` decays geometrically.
The numbers `n - 1/2` are not all units (`p ∣ 2n - 1` for `n = (p + 1)/2`); what matters is that
`v_p(n + a)` grows only logarithmically, whereas the Liouville exponent has
`limsup v_p(n + a)/n = 1`. -/
example (hp : p ≠ 2) :
    IsOverconvergentCoeffs (fun n : ℕ => (p : ℚ_[p]) ^ n / ((n : ℚ_[p]) - 1 / 2)) := by
  sorry

end PadicGrowth

/-! ## Layer RD.3: the convergence condition on a connection -/

section Taylor

variable {K M : Type*} [NormedField K] [NormedAddCommGroup M] [NormedSpace K M]

/-- The one-variable convergence condition on a connection, written for the operator `θ = ∇_{d/dt}`
acting on a normed module of sections over a closed tube: for every section `e` and every `η < 1`,
the divided derivatives `θᵏ e / k!` decay faster than `η⁻ᵏ` (Berthelot 96-03 (2.2.14);
Guo–Reinecke, Definition 2.12). Characteristic zero is implicit in inverting `k!`. -/
def IsConvergentOperator (θ : M →ₗ[K] M) : Prop :=
  ∀ e : M, ∀ η : ℝ, 0 ≤ η → η < 1 →
    Tendsto (fun k : ℕ => ‖((k.factorial : K)⁻¹) • (θ ^ k) e‖ * η ^ k) atTop (𝓝 0)

/-- Degenerate case: the trivial connection (`θ = 0`) is convergent. -/
example : IsConvergentOperator (0 : M →ₗ[K] M) := by
  intro e η _ _
  refine tendsto_const_nhds.congr' ?_
  filter_upwards [eventually_ge_atTop 1] with k hk
  obtain ⟨j, rfl⟩ : ∃ j, k = j + 1 := ⟨k - 1, by omega⟩
  simp [pow_succ]

end Taylor

section PadicTaylor

variable (p : ℕ) [Fact p.Prime]

/-- Dwork-type bound: `∇(1) = p dt` on the unit disc over `ℚ_p` is convergent, since
`|pᵏ / k!| ≤ 1`. -/
example : IsConvergentOperator ((p : ℚ_[p]) • LinearMap.id : ℚ_[p] →ₗ[ℚ_[p]] ℚ_[p]) := by
  sorry

/-- Non-example: `∇(1) = dt` (the exponential) is not convergent, because `|1 / k!| ηᵏ` is
unbounded once `η > p^{-1/(p-1)}`; no Frobenius structure can exist on it. -/
example : ¬ IsConvergentOperator (LinearMap.id : ℚ_[p] →ₗ[ℚ_[p]] ℚ_[p]) := by
  sorry

end PadicTaylor

/-! ## Layer RD.3: unit-root fibres of F-isocrystals -/

section UnitRoot

open WittVector

variable (p : ℕ) [Fact p.Prime] (k : Type*) [CommRing k] [IsDomain k] [CharP k p] [PerfectRing k p]

/- Applying Mathlib's Frobenius of an isocrystal needs the same transparency setting that
`Mathlib/RingTheory/WittVector/Isocrystal.lean` uses for `Φ(p, k) x`. -/
set_option backward.isDefEq.respectTransparency.types false in
/-- An isocrystal over a perfect field `k` (the fibre of an F-isocrystal at a perfect point) is
unit-root when, in some basis, the matrix of Frobenius has Witt-vector entries and invertible
determinant: Frobenius preserves a `W(k)`-lattice and is bijective on it. Over an algebraically
closed field this means that all slopes are zero (Étesse 2002, §5.1; Kedlaya, Notes, Definition 3.3). -/
def IsUnitRootIsocrystal (V : Type*) [AddCommGroup V] [Isocrystal p k V] : Prop :=
  ∃ (n : ℕ) (b : Module.Basis (Fin n) (FractionRing (WittVector p k)) V)
    (A : Matrix (Fin n) (Fin n) (WittVector p k)),
    IsUnit A.det ∧
      ∀ j, Isocrystal.frobenius p k (V := V) (b j) =
        ∑ i, algebraMap (WittVector p k) (FractionRing (WittVector p k)) (A i j) • b i

/-- The standard isocrystal of slope `0` (Frobenius `x ↦ φ(x)`) is unit-root. -/
example : IsUnitRootIsocrystal p k (StandardOneDimIsocrystal p k 0) := by
  sorry

/-- Non-example: the standard isocrystal of slope `1` (Frobenius `x ↦ p φ(x)`) is not unit-root:
every lattice `L` satisfies `Φ(L) = pL ≠ L`. -/
example : ¬ IsUnitRootIsocrystal p k (StandardOneDimIsocrystal p k 1) := by
  sorry

/- The classification of one-dimensional isocrystals over an algebraically closed field, on which
the slope theory of fibres is built. -/
#check WittVector.isocrystal_classification

/-- Rank one over an algebraically closed field: a one-dimensional isocrystal is unit-root exactly
when it is isomorphic to the standard isocrystal of slope `0`. -/
theorem isUnitRootIsocrystal_iff_of_finrank_eq_one (k : Type*) [Field k] [IsAlgClosed k] [CharP k p]
    (V : Type*) [AddCommGroup V] [Isocrystal p k V]
    (h : Module.finrank (FractionRing (WittVector p k)) V = 1) :
    IsUnitRootIsocrystal p k V ↔
      Nonempty (WittVector.IsocrystalEquiv p k (StandardOneDimIsocrystal p k 0) V) := by
  sorry

end UnitRoot

/-
Statements of this layer that need carriers absent at the pins, stated in the roadmap document:
the étale tube and strict-neighbourhood isomorphisms and the fibration theorems; the `j†` calculus and
coherent `j†O`-modules; overconvergence as a property and Berthelot's coordinate criterion; the gluing
construction and Zariski stack of overconvergent isocrystals; the Monsky–Washnitzer description and
the theorem that a Frobenius structure forces overconvergence; the henselian property of weak
completions with Elkik descent and the lifting of étale algebras; convergent isocrystals and
F-isocrystals, Dwork's construction from F-crystals and the comparison with crystals up to isogeny;
the underlying bundle on a smooth formal scheme; unit-root F-isocrystals and the Katz–Crew
correspondence; Étesse's direct-summand and étale-descent theorems; Kummer isocrystals and the
Liouville extension.
-/

end

end TauCetiRoadmap.PadicDifferentialEquationsAndRigidCohomology.RD3

/-! ## RD.4 signatures -/

noncomputable section

namespace TauCetiRoadmap.PadicDifferentialEquationsAndRigidCohomology.RD4

variable {K V W T : Type*} [Field K]
  [AddCommGroup V] [Module K V]
  [AddCommGroup W] [Module K W]
  [AddCommGroup T] [Module K T]

/-- A section-level illustration of the support condition: restriction is zero. -/
abbrev SupportedSections (restriction : V →ₗ[K] W) : Submodule K V :=
  LinearMap.ker restriction

/-- The existing module quotient used in a supplied theta presentation. -/
abbrev ThetaCokernel (theta : V →ₗ[K] W) :=
  W ⧸ LinearMap.range theta

/-- The existing quotient map sends a supplied target form to its theta class. -/
abbrev thetaClass (theta : V →ₗ[K] W) : W →ₗ[K] ThetaCokernel theta :=
  (LinearMap.range theta).mkQ

/-- The support kernel detects vanishing of the actual restriction. -/
theorem supportedSections_mem (restriction : V →ₗ[K] W) (v : V) :
    v ∈ SupportedSections restriction ↔ restriction v = 0 := by
  sorry

/-- Empty complement: restriction to zero has every section in its kernel. -/
theorem supportedSections_zero :
    SupportedSections (0 : V →ₗ[K] W) = ⊤ := by
  sorry

/-- Full complement: identity restriction has no nonzero supported section. -/
theorem supportedSections_id :
    SupportedSections (LinearMap.id : V →ₗ[K] V) = ⊥ := by
  sorry

/-- The quotient uses the image, not the kernel, of theta. -/
theorem thetaClass_eq_zero (theta : V →ₗ[K] W) (w : W) :
    thetaClass theta w = 0 ↔ ∃ v : V, theta v = w := by
  sorry

/-- The end universal property of a theta presentation over existing modules. -/
theorem thetaCokernel_desc (theta : V →ₗ[K] W) (l : W →ₗ[K] T)
    (h : l.comp theta = 0) :
    ∃! q : ThetaCokernel theta →ₗ[K] T, q.comp (thetaClass theta) = l := by
  sorry

/-- A surjective presentation has a zero quotient. -/
theorem thetaCokernel_of_surjective (theta : V →ₗ[K] W)
    (h : Function.Surjective theta) : Subsingleton (ThetaCokernel theta) := by
  sorry

example : SupportedSections (0 : ℚ →ₗ[ℚ] ℚ) = ⊤ := by
  sorry

example : SupportedSections (LinearMap.id : ℚ →ₗ[ℚ] ℚ) = ⊥ := by
  sorry

example (theta : V →ₗ[K] W) (v : V) : thetaClass theta (theta v) = 0 := by
  sorry

example : Subsingleton (ThetaCokernel (LinearMap.id : ℚ →ₗ[ℚ] ℚ)) := by
  sorry

end TauCetiRoadmap.PadicDifferentialEquationsAndRigidCohomology.RD4

/-
Heavy target inventory. These are reader targets, not Lean declarations with
placeholder carriers. All node suffixes below have the prefix
PadicDifferentialEquationsAndRigidCohomology:RD.4/.

relative-overconvergent-poincare — relativeOverconvergentPoincare:
  E ≃ Ru_* DR†_relative(u†E), under the proper/smooth frame hypotheses.
etale-proper-de-rham-descent — etaleProperDeRhamDescent:
  The augmented overconvergent coefficient de Rham hypercover totalization descends.
coefficient-long-exact-sequence — rigidCoefficientLongExactSequence:
  Coefficient triangles for ordinary, closed-support and compact cohomology.
general-rigid-gysin — rigidGysin:
  RΓ_Z(X,E) ≃ RΓ(Z,i*E)(−c)[−2c], with the twist only in the F-equivariant version.
quasi-etale-specialization — TubeSpecialization:
  Tube quasi-étale site → formal-completion étale site → special-fibre étale site.
tube-proper-support-functor — TubeProperSupport:
  ker(id → g_*g*), exact, before Rs_*; special-fibre comparison is only a map.
supported-log-de-rham-complexes — SupportedLogComplex:
  ω, tildeω and their supported versions from an admissible log embedding system;
  the degree-q shifted injection is (−1)^(q−1) beta wedge dlog t, for shift differential −d.
log-monodromy-localization — logMonodromyLocalization:
  Localization triangles commute with the connecting operator N.
log-rigid-proper-support-cohomology — LogProperCohomology:
  H^q(X_ét,ω_(U,X)), with the proper X retained as a parameter.
log-residue-double-complex — LogResidueComplex:
  A^(i,j)=Ω_log^(i+j+1)/P_j, horizontal (−1)^j d, vertical right wedge dlog t.
supported-log-weight-spectral-sequence — supportedLogWeightSpectralSequence:
  Underlying vector-space page E1^(−k,q+k) has j≥max(0,−k) strata terms.
positive-log-support-complex — PositiveLogComplex:
  Ξ^i=Ω_log^(i+1)/Ω_regular^(i+1), the zeroth residue column, with proper support;
  the absolute map to Ξ[−1] has degree-q sign (−1)^(q−1).
positive-support-spectral-sequence — positiveSupportSpectralSequence:
  E1^(−k,q+k)=H_c^(q−k)(U^(k+1)) for k≥0, and zero for k<0.
high-degree-log-support-comparison — highDegreeLogSupportComparison:
  Dimension bounds on every boundary stratum give the three DL B.5 comparisons.
dagger-berthelot-comparison — daggerBerthelotComparison:
  GK 5.1: coherent dagger tube cohomology ↔ j† cohomology on its closure tube.
dagger-supported-comparison — daggerSupportedComparison:
  Closed support is a localization fibre; compact support uses ambient supports.
log-dagger-comparison — logDaggerComparison:
  On specified proper formal frames, coherent dagger log terms compare in derived
  cohomology with j† terms. Their completed DL support adapter is separately G2;
  the unsupported constant-coefficient proper adapter uses GK05 Theorem 5.3(ii).
algebraic-rigid-specialization-maps — Specialization:
  ρ: algebraic dR → rigid; ρ_c: compact rigid → compact algebraic dR.
specialization-forget-supports-square — specializationForgetSupportsSquare:
  ι_rig = ρ ∘ ι_dR ∘ ρ_c.
igusa-theta-cokernel — IgusaThetaCohomology:
  Quotient of M†_(k+2)⊗D0^(−k−1) by the image of θ_(k+1) on M†_(−k).
rigid-support-cohomological-bounds — rigidSupportCohomologicalBounds:
  H^q_Z,rig(X,E)=0 for q<2 codim Z and q>2 dim X, without coefficient Frobenius.
proper-log-rigid-convergent-comparison — properLogRigidConvergentComparison:
  Constant-coefficient log rigid → log convergent is an equivalence for proper semistable X.
log-rigid-realization — LogRigidRealization:
  Exactified embedding-product dagger tubes with finite-rank Zariski locally constant E.

Every API name in the reader belongs to its corresponding heavy target. The
three light names in this sketch illustrate the existing kernel/quotient carriers
only. They do not define tube sheaves, dagger forms, Igusa curves or rigid groups.
-/

/-! ## RD.5 signatures -/

namespace TauCetiRoadmap.PadicDifferentialEquationsAndRigidCohomology.RD5

noncomputable section

/-! ## Indices of maps with finite-dimensional kernel and cokernel (RD.5b)

The dimension formula `dim H¹_rig = 2g + d − 1` for an affine curve is an index computation:
`ind(d) + ind(dρ) = ind(ρ) + ind(d_loc)` for the square of principal-part maps. -/

section Index

variable {K : Type*} [Field K]
variable {U V W : Type*} [AddCommGroup U] [Module K U] [AddCommGroup V] [Module K V]
  [AddCommGroup W] [Module K W]

/-- A linear map has finite index when its kernel and cokernel are finite dimensional. -/
def HasFiniteIndex (f : V →ₗ[K] W) : Prop :=
  FiniteDimensional K (LinearMap.ker f) ∧ FiniteDimensional K (W ⧸ LinearMap.range f)

/-- The index `dim ker f − dim coker f`. It is only meaningful under `HasFiniteIndex f`,
since `Module.finrank` of an infinite-dimensional space is `0`. -/
def finiteIndex (f : V →ₗ[K] W) : ℤ :=
  (Module.finrank K (LinearMap.ker f) : ℤ) - (Module.finrank K (W ⧸ LinearMap.range f) : ℤ)

/-- Index additivity for a composite of finite-index maps. -/
theorem finiteIndex_comp (f : U →ₗ[K] V) (g : V →ₗ[K] W)
    (hf : HasFiniteIndex f) (hg : HasFiniteIndex g) :
    HasFiniteIndex (g ∘ₗ f) ∧ finiteIndex (g ∘ₗ f) = finiteIndex f + finiteIndex g := by
  sorry

/-- The square identity used for curves: if `b ∘ a = d ∘ c` and all four maps have finite
index, then `ind a + ind b = ind c + ind d`. -/
theorem finiteIndex_square {X : Type*} [AddCommGroup X] [Module K X]
    (a : U →ₗ[K] V) (b : V →ₗ[K] X) (c : U →ₗ[K] W) (d : W →ₗ[K] X)
    (hsq : b ∘ₗ a = d ∘ₗ c) (ha : HasFiniteIndex a) (hb : HasFiniteIndex b)
    (hc : HasFiniteIndex c) (hd : HasFiniteIndex d) :
    finiteIndex a + finiteIndex b = finiteIndex c + finiteIndex d := by
  sorry

/-- An isomorphism has index zero. -/
example (e : V ≃ₗ[K] W) : finiteIndex (e : V →ₗ[K] W) = 0 := by
  sorry

/-- The zero map `K² → K` has kernel of dimension 2 and cokernel of dimension 1. -/
example : finiteIndex (0 : (Fin 2 → K) →ₗ[K] K) = 1 := by
  sorry

end Index

/-! ## The dimension formula for affine curves (RD.5b) -/

/-- `dim H¹_rig` of a smooth geometrically irreducible affine curve whose smooth
compactification has genus `g` and whose boundary has degree `d ≥ 1`. -/
def affineCurveH1Dim (g d : ℕ) : ℕ := 2 * g + d - 1

/-- The affine line. -/
example : affineCurveH1Dim 0 1 = 0 := rfl

/-- The multiplicative group. -/
example : affineCurveH1Dim 0 2 = 1 := rfl

/-- An elliptic curve minus its origin. -/
example : affineCurveH1Dim 1 1 = 2 := rfl

/-- The index bookkeeping: `ind ρ = 1 − g`, `ind d_loc = −d`, `ind dρ = g − 1` and
`H⁰ = K` give `1 − dim H¹ = (1 − g) + (−d) − (g − 1)`. -/
theorem affineCurve_index_identity (g d : ℕ) (hd : 1 ≤ d) :
    (1 : ℤ) - affineCurveH1Dim g d = (1 - g) + (-(d : ℤ)) - ((g : ℤ) - 1) := by
  sorry

/-! ## The local residue pairing (RD.5c)

On the Robba ring the pairing `⟨f, g⟩ = Res(f g dx/x)` is the constant term of `f g`. Formal
Laurent series (finite principal part) are the algebraic model available at the pins; the
analytic duality (`robbaResidueDuality`) needs the Robba ring with its LF topology. -/

section LocalPairing

variable (K : Type*) [Field K]

/-- The constant-term pairing on formal Laurent series. -/
def localPairing (f g : LaurentSeries K) : K := (f * g).coeff 0

variable {K}

/-- The pairing is symmetric. -/
theorem localPairing_comm (f g : LaurentSeries K) : localPairing K f g = localPairing K g f := by
  sorry

/-- Dual monomials: `⟨x^n, x^{-n}⟩ = 1`. -/
example (n : ℤ) :
    localPairing K (HahnSeries.single n (1 : K)) (HahnSeries.single (-n) 1) = 1 := by
  sorry

/-- Non-example: the constant-term pairing is not the coefficient of `x⁻¹`; the monomial
`x⁻¹` pairs to zero with `1`. -/
example : localPairing K (HahnSeries.single (-1) (1 : K)) 1 = 0 := by
  sorry

end LocalPairing

/-! ## Residues of rank-one logarithmic connections and nilpotence (RD.5e) -/

section Residues

/-- The arithmetic residue criterion for a rank-one overconvergent log connection.
The README imposes convergence; this rational predicate alone does not supply it. -/
def RankOneResidueUnipotent (a : ℚ) : Prop := ∃ n : ℤ, a = n

example : RankOneResidueUnipotent 0 := ⟨0, by simp⟩

/-- The Kummer residue `1/2` is not unipotent. -/
example : ¬ RankOneResidueUnipotent (1 / 2) := by
  sorry

/-- Pulling back along `s ↦ s^m` multiplies the residue by `m`; for `a ∈ (1/m)ℤ` the pullback
is unipotent (semistable reduction of a Kummer isocrystal). -/
theorem rankOneResidueUnipotent_pullback (a : ℚ) (m : ℕ) (hm : 0 < m)
    (ha : ∃ n : ℤ, a = n / m) : RankOneResidueUnipotent (m * a) := by
  sorry

variable {K V : Type*} [Field K] [CharZero K] [AddCommGroup V] [Module K V]
  [FiniteDimensional K V]

/-- A residue conjugate to `q` times itself, with `q ≥ 2`, is nilpotent. This is the
linear Frobenius special case; the README gives the isometric semilinear argument. -/
theorem isNilpotent_of_conj_eq_smul (q : ℕ) (hq : 2 ≤ q) (N : Module.End K V)
    (e : V ≃ₗ[K] V) (h : e.conj N = (q : K) • N) : IsNilpotent N := by
  sorry

end Residues

/-! ## Strict maps (RD.5c) -/

section Strict

variable {K : Type*} [NontriviallyNormedField K]
variable {V W : Type*} [AddCommGroup V] [Module K V] [TopologicalSpace V]
  [AddCommGroup W] [Module K W] [TopologicalSpace W]

/-- A continuous linear map is strict when it is open onto its image. -/
def IsStrictMap (f : V →L[K] W) : Prop :=
  IsOpenMap (fun v : V => (⟨f v, ⟨v, rfl⟩⟩ : LinearMap.range (f : V →ₗ[K] W)))

/-- The identity is strict. -/
example : IsStrictMap (ContinuousLinearMap.id K V) := by
  sorry

/-- Strictness of a surjection is openness. -/
theorem isStrictMap_of_surjective_iff (f : V →L[K] W) (hf : Function.Surjective f) :
    IsStrictMap f ↔ IsOpenMap f := by
  sorry

end Strict

/-! ## Graded dimensions under Künneth (RD.5c) -/

/-- The degree-`n` dimension of a tensor product of graded spaces with dimensions `a`, `b`. -/
def gradedTensorDim (a b : ℕ → ℕ) (n : ℕ) : ℕ :=
  ∑ i ∈ Finset.range (n + 1), a i * b (n - i)

/-- `H*_rig(G_m) = (1, 1)`, so `H*_rig(G_m × G_m) = (1, 2, 1)`. -/
example : gradedTensorDim (fun i => if i ≤ 1 then 1 else 0)
    (fun i => if i ≤ 1 then 1 else 0) 1 = 2 := by
  decide

example : gradedTensorDim (fun i => if i ≤ 1 then 1 else 0)
    (fun i => if i ≤ 1 then 1 else 0) 2 = 1 := by
  decide

end

/-!
## Roadmap targets requiring additional carriers

The reader specifies the analytic coefficient and supplier interfaces.
Shiho comparison uses crystalline isocrystals without an assumed integral lattice. Pan finiteness
is C-valued and levelwise. The source issues E501 and E502 are specified in the reader;
no statement in this file depends on the uncorrected source formulas.

The following definitions and constructions of this part live in the roadmap, with their full
statements, API outlines and checks. Their carriers (rigid cohomology, overconvergent and
convergent (log-)isocrystals, Le Stum's overconvergent site, tubes and dagger spaces) are not at
the pins, so no placeholder carrier represents them here. The API and check names are the ones
the roadmap uses.

* Le Stum's overconvergent site of a variety (RD.5/overconvergent-site).
  API: OverconvergentSite, OverconvergentSite.realization, OverconvergentSite.functorial,
  OverconvergentSite.crystal_iff_realisations, OverconvergentSite.crystals_on_variety,
  OverconvergentSite.restriction_closed, OverconvergentSite.crystal_pullback_id_comp,
  OverconvergentSite.crystal_tensor_dual, OverconvergentSite.realization_ext.
  Module transition maps use ringed pullback with extension of scalars.
  Checks: overconvergentSite_point_sections, overconvergentSite_affineLine_sections,
  overconvergentSite_not_etale_site, overconvergentSite_realisation_covers,
  overconvergentSite_ringed_pullback.
* Berthelot's trace morphism on top-degree compact-support rigid cohomology
(RD.5/rigid-trace-morphism).
  API: rigidTrace, rigidTrace_frobenius, rigidTrace_openImmersion, rigidTrace_finiteEtale,
  rigidTrace_gysin, rigidTrace_crystalline, rigidTrace_baseChange,
  rigidTrace_isIso_of_geomIrreducible.
  Checks: rigidTrace_point, rigidTrace_affineLine, rigidTrace_twoPoints,
  rigidTrace_untwisted_nonexample, rigidTrace_proper_crystalline,
  rigidTrace_finiteScalar_normalisation.
  Scalar descent uses normalised field trace; crystalline compatibility assumes perfect k.
* The duality morphism ψ_{Z,X} and its morphism of distinguished triangles
(RD.5/supported-duality-morphism).
  API: dualityMorphism, dualityMorphism_triangle, dualityMorphism_finiteEtale,
  dualityMorphism_gysin, gysin_dual_of_restriction, dualityMorphism_crystalline,
  dualityMorphism_frobenius, dualityMorphism_cupProduct.
  Finite etale adjunction uses compact-support pullback; Gysin uses shift 2r and twist (-r).
  Checks: dualityMorphism_point, dualityMorphism_affineLine_degree0,
  dualityMorphism_gm_triangle, dualityMorphism_no_shift_nonexample.
* Künneth pairings on product tubes and the Künneth morphisms with supports
(RD.5/kunneth-pairing-on-tubes).
  API: kunnethPairingTube, kunnethMorphismSupports, kunnethMorphismCompact,
  kunnethMorphism_triangle, kunnethMorphism_trace, kunnethMorphism_gysin,
  kunnethMorphism_frobenius, kunnethMorphism_rigidTrace.
  Checks: kunnethMorphism_point, kunnethMorphism_affinePlane_top, kunnethMorphism_gm_square,
  kunnethMorphism_supports_nonexample.
* Constant and unipotent monodromy along a boundary divisor; docile isocrystals
(RD.5/unipotent-monodromy-along-boundary).
  API: HasUnipotentMonodromy, HasUnipotentMonodromy.subquotient,
  HasUnipotentMonodromy.tensor_dual, HasUnipotentMonodromy.zariski_local,
  HasUnipotentMonodromy.of_dense_open_boundary, HasConstantMonodromy.of_convergent_extension,
  HasUnipotentMonodromy.baseField, Docile.rankOne_unramified.
  Checks: docile_constant, docile_kummer_nonexample, docile_kummer_pullback,
  docile_dwork_nonexample, docile_tensor.
* Convergent log-isocrystals on a smooth pair (RD.5/convergent-log-isocrystal).
  API: ConvergentLogIsocrystal, ConvergentLogIsocrystal.toLogNablaModule,
  ConvergentLogIsocrystal.residue, ConvergentLogIsocrystal.restrict,
  ConvergentLogIsocrystal.noBoundary, ConvergentLogIsocrystal.nilpotentResidues,
  ConvergentLogIsocrystal.pullback_id_comp, ConvergentLogIsocrystal.tensor_unit_dual,
  ConvergentLogIsocrystal.ofStratification.
  Checks: convergentLogIsocrystal_empty_boundary, convergentLogIsocrystal_residue_computation,
  convergentLogFIsocrystal_nilpotent, convergentLogIsocrystal_not_overconvergent_nonexample,
  convergentLogIsocrystal_integrable_not_convergent.
  Rank-one log convergence is checked for residues in Z_p; integrability alone is insufficient.

The theorems of this part, stated in the roadmap and not expressible at the pins:

* Overconvergent isocrystals are crystals on the overconvergent site, with the same cohomology
(RD.5/overconvergent-site-comparison).
* Modifications are universally of cohomological descent for overconvergent crystals
(RD.5/modification-cohomological-descent).
* Finite flat and fppf coverings are universally of cohomological descent for finitely presented
crystals (RD.5/fppf-cohomological-descent).
* Proper surjections are universally of cohomological descent for finitely presented crystals
(RD.5/proper-surjection-cohomological-descent).
* The descent spectral sequence of rigid cohomology for proper hypercoverings
(Chiarellotto–Tsuzuki, Tsuzuki) (RD.5/proper-hypercover-descent-spectral-sequence).
* Homomorphisms out of overconvergent germs are sections supported on the tube (Berthelot, Lemme
2.1) (RD.5/overconvergent-germ-hom-lemma).
* Compact-support Gysin maps and their compatibility with the lift-dependent traces
(RD.5/compact-support-gysin-and-trace).
* Top compact-support cohomology of a geometrically irreducible variety is one-dimensional
(RD.5/top-degree-dimension-one).
* Traces along finite étale maps and the averaging projector
(RD.5/finite-etale-trace-projector).
* Rigid cohomology commutes with arbitrary extension of the base field
(RD.5/rigid-cohomology-base-field-extension).
* Lifting a smooth projective curve with its boundary points, and the algebraic generic fibre
(RD.5/curve-lift-with-boundary).
* Mayer–Vietoris sequences for a dagger curve and its boundary discs
(RD.5/dagger-curve-mayer-vietoris).
* The indices of the principal-part maps and the dimension of H^1 of an affine curve
(RD.5/principal-parts-index-computation).
* Kedlaya's finite projections to projective space étale off the hyperplane at infinity
(RD.5/projection-etale-off-hyperplane).
* Log-rigid cohomology of a curve with unipotent monodromy equals rigid cohomology of the
complement (RD.5/log-rigid-comparison-for-curves).
* Acceptance: finite-level Igusa rigid cohomology with Sym^k coefficients is finite dimensional
(RD.5/igusa-theta-cokernel-finite).
* A space that is both Fréchet and the strong dual of a reflexive Fréchet space is finite
dimensional (RD.5/frechet-and-dual-frechet-finite).
* Strictness of a linear map and of its transpose (RD.5/strictness-transpose-criteria).
* Topological local duality: the Robba ring is the strong dual of its differentials under the
residue pairing (RD.5/robba-topological-residue-duality).
* The plus and minus parts of the Robba ring and their mutual duality
(RD.5/robba-plus-minus-duality).
* Finite rigid and dagger cohomology for smooth quasi-projective integral models and their
boundary strata (RD.5/finiteness-for-smooth-quasi-projective-models).
* Relative convergent cohomology equals rational relative crystalline cohomology, and is perfect
(RD.5/relative-convergent-crystalline-comparison).
* Higher direct images of convergent F-isocrystals under smooth proper morphisms (Xu)
(RD.5/convergent-direct-image-smooth-proper).
* Smooth proper direct images of crystals in perfect complexes underlying F-isocrystals
(Guo–Reinecke) (RD.5/convergent-direct-image-perfect-complexes).
* Kedlaya's extension theorem: constant monodromy is the obstruction to extending an
overconvergent isocrystal (RD.5/extension-across-boundary).
* Restriction of F-isocrystals to a dense open is fully faithful, and closed under subquotients
in the overconvergent case (RD.5/dense-open-restriction-fully-faithful).
* Logarithmic extension of isocrystals with unipotent monodromy
(RD.5/log-extension-of-unipotent-isocrystal).
* Kedlaya's semistable reduction theorem for overconvergent F-isocrystals
(RD.5/global-semistable-reduction).
* Acceptance: docility of the Kummer and Dwork isocrystals and their semistable reduction
(RD.5/docility-acceptance).
-/

end TauCetiRoadmap.PadicDifferentialEquationsAndRigidCohomology.RD5

/-! ## RD.6 signatures -/

namespace TauCetiRoadmap.PadicDifferentialEquationsAndRigidCohomology.RD6

noncomputable section

/-! ## Dwork's additive character (RD.6/dwork-additive-character) -/

section DworkCharacter

variable (p : ℕ) [NeZero p] {K : Type*} [Field K]

/-- Dwork's additive character `ψ_π : 𝔽_p → K`, `a ↦ ζ^a`, attached to the `p`-th root of unity
`ζ = θ(1)` given by Dwork's splitting function. The analytic origin of `ζ` is a roadmap target;
the character itself only needs `ζ ^ p = 1`. -/
def dworkCharacter {ζ : K} (hζ : ζ ^ p = 1) : AddChar (ZMod p) K :=
  AddChar.zmodChar p hζ

/-- `ψ_{π,q'} = ψ_π ∘ Tr_{𝔽_{q'}/𝔽_p}` on the finite field with `p ^ n` elements. -/
def dworkCharacterOfField [Fact p.Prime] (n : ℕ) {ζ : K} (hζ : ζ ^ p = 1) :
    AddChar (GaloisField p n) K :=
  (dworkCharacter p hζ).compAddMonoidHom
    (Algebra.trace (ZMod p) (GaloisField p n)).toAddMonoidHom

variable {p}

/-- API `dworkCharacter_eq_zmodChar`: the character is Mathlib's `AddChar.zmodChar`. -/
theorem dworkCharacter_eq_zmodChar {ζ : K} (hζ : ζ ^ p = 1) :
    dworkCharacter p hζ = AddChar.zmodChar p hζ := rfl

/-- API: evaluation on residues. -/
theorem dworkCharacter_apply {ζ : K} (hζ : ζ ^ p = 1) (a : ZMod p) :
    dworkCharacter p hζ a = ζ ^ a.val := sorry

/-- API `dworkCharacter_ne_one`: a primitive root gives a nontrivial character. -/
theorem dworkCharacter_ne_one {ζ : K} (hζ : ζ ^ p = 1) (hprim : IsPrimitiveRoot ζ p)
    (hp : 1 < p) : dworkCharacter p hζ ≠ 1 := sorry

/-- API: the character sum over `𝔽_p` vanishes for a primitive root. -/
theorem dworkCharacter_sum {ζ : K} (hζ : ζ ^ p = 1) (hprim : IsPrimitiveRoot ζ p)
    (hp : 1 < p) : ∑ a : ZMod p, dworkCharacter p hζ a = 0 := sorry

/-- API `dworkCharacter_neg`: replacing `ζ` by `ζ⁻¹` (that is, `π` by `-π` for odd `p`)
inverts the character. -/
theorem dworkCharacter_neg {ζ : K} (hζ : ζ ^ p = 1) (hζ' : ζ⁻¹ ^ p = 1) (a : ZMod p) :
    dworkCharacter p hζ' a * dworkCharacter p hζ a = 1 := sorry

/-- API: evaluation of the field version `dworkCharacterOfField` through the trace. -/
theorem dworkCharacterOfField_apply [Fact p.Prime] (n : ℕ) {ζ : K} (hζ : ζ ^ p = 1)
    (x : GaloisField p n) :
    dworkCharacterOfField p n hζ x =
      dworkCharacter p hζ (Algebra.trace (ZMod p) (GaloisField p n) x) := rfl

/-- Unit test `dworkCharacter_zero`. -/
example {ζ : K} (hζ : ζ ^ p = 1) : dworkCharacter p hζ 0 = 1 := sorry

/-- Unit test `dworkCharacter_sum` for `p = 3`: `1 + ζ + ζ ^ 2 = 0`. -/
example {ζ : K} (hζ : ζ ^ 3 = 1) (hprim : IsPrimitiveRoot ζ 3) :
    dworkCharacter 3 hζ 0 + dworkCharacter 3 hζ 1 + dworkCharacter 3 hζ 2 = 0 := sorry

/-- Unit test `dworkCharacter_not_identity_root`: the character at `1` is `ζ`, which is not `1`
for a primitive root. -/
example {ζ : K} (hζ : ζ ^ 3 = 1) (hprim : IsPrimitiveRoot ζ 3) :
    dworkCharacter 3 hζ 1 ≠ 1 := sorry

end DworkCharacter

/-! ## Trace function of the Kummer F-isocrystal (RD.6/kummer-isocrystal) -/

section Kummer

variable {F L K : Type*} [Field F] [Field L] [Algebra F L] [Field K]

/-- The Frobenius trace function of `K_a` at a point with residue field `L ⊇ F = 𝔽_q`:
`x ↦ χ(N_{L/F} x)`, for the multiplicative character `χ = χ_a`. -/
def kummerTraceFunction (χ : Fˣ →* Kˣ) (x : Lˣ) : K :=
  (χ (Units.map (Algebra.norm F : L →* F) x) : K)

/-- API: the trace function is multiplicative (`K_a` has rank one). -/
theorem kummerTraceFunction_mul (χ : Fˣ →* Kˣ) (x y : Lˣ) :
    kummerTraceFunction χ (x * y) = kummerTraceFunction χ x * kummerTraceFunction χ y := sorry

/-- API `kummerIsocrystal_tensor`: `K_a ⊗ K_{a'} = K_{a+a'}` on trace functions. -/
theorem kummerTraceFunction_mul_char (χ χ' : Fˣ →* Kˣ) (x : Lˣ) :
    kummerTraceFunction (χ * χ') x = kummerTraceFunction χ x * kummerTraceFunction χ' x := sorry

/-- Unit test `kummerIsocrystal_zero`: the trivial character gives the constant coefficient. -/
example (x : Lˣ) : kummerTraceFunction (1 : Fˣ →* Kˣ) x = 1 := sorry

/-- Unit test: at a rational point (`L = F`) the trace is the character itself. -/
example (χ : Fˣ →* Kˣ) (x : Fˣ) : kummerTraceFunction (L := F) χ x = χ x := sorry

end Kummer

/-! ## Kloosterman sums (RD.6/kloosterman-f-isocrystal, RD.6/kloosterman-local-monodromy-and-purity) -/

section Kloosterman

variable {F K : Type*} [Field F] [Fintype F] [DecidableEq F] [CommRing K]

/-- The Kloosterman sum `Kl_{n+1}(z) = ∑_{x₁,…,xₙ ∈ Fˣ} ψ(x₁ + ⋯ + xₙ + z/(x₁⋯xₙ))`. The trace of
Frobenius of the Kloosterman F-isocrystal `Kl_{n+1}` at `z` is `(-1)^n` times this sum for
`ψ = ψ_π⁻¹`. -/
def kloostermanSum (ψ : AddChar F K) (n : ℕ) (z : Fˣ) : K :=
  ∑ x : Fin n → Fˣ, ψ ((∑ i, (x i : F)) + (z : F) * (((∏ i, x i)⁻¹ : Fˣ) : F))

/-- Unit test `kloostermanIsocrystal_degenerate`: `Kl_1(z) = ψ(z)`. -/
example (ψ : AddChar F K) (z : Fˣ) : kloostermanSum ψ 0 z = ψ z := sorry

/-- Unit test `kloostermanIsocrystal_rank_two`: the classical Kloosterman sum. -/
example (ψ : AddChar F K) (z : Fˣ) :
    kloostermanSum ψ 1 z = ∑ x : Fˣ, ψ ((x : F) + (z : F) * ((x⁻¹ : Fˣ) : F)) := sorry

/-- Weil's bound, the consequence of purity of weight `1` of `Kl_2`. (Over the quadratic extension
the sums satisfy `Kl_2(z; q^2) = 2q - Kl_2(z; q)^2`, the eigenvalue relation of
RD.6/kloosterman-f-isocrystal; that statement needs a pair of nested finite fields and is a
document target.) -/
theorem kloostermanSum_one_bound (ψ : AddChar F ℂ) (hψ : ψ ≠ 1) (z : Fˣ) :
    ‖kloostermanSum ψ 1 z‖ ≤ 2 * Real.sqrt (Fintype.card F) := sorry

/-- Deligne's bound, the consequence of purity of weight `n` of the rank-`(n+1)` coefficient
`Kl_{n+1}` (RD.6/kloosterman-local-monodromy-and-purity (d)). -/
theorem kloostermanSum_bound (ψ : AddChar F ℂ) (hψ : ψ ≠ 1) (n : ℕ) (z : Fˣ) :
    ‖kloostermanSum ψ n z‖ ≤ (n + 1) * Real.sqrt (Fintype.card F) ^ n := sorry

end Kloosterman

/-! ## Rational descent of power series (RD.6/rational-descent-of-power-series) -/

/-- A power series over `k` that is rational over an extension field `L` is rational over `k`
(Kronecker–Hankel; ClassicalArithmeticCompletion CA.6). -/
theorem rational_descent {k L : Type*} [Field k] [Field L] [Algebra k L] (f : PowerSeries k)
    (h : ∃ P Q : Polynomial L, Q.coeff 0 = 1 ∧
      (Q : PowerSeries L) * PowerSeries.map (algebraMap k L) f = (P : PowerSeries L)) :
    ∃ P Q : Polynomial k, Q.coeff 0 = 1 ∧ (Q : PowerSeries k) * f = (P : PowerSeries k) :=
  sorry

/-- Test: the zeta function of `ℙ¹` over `𝔽_q`, `∑ (1 + q^r) t^r`, is rational over `ℚ`. -/
example (q : ℕ) :
    (((Polynomial.C (1 : ℚ) - Polynomial.X) *
        (Polynomial.C 1 - Polynomial.C (q : ℚ) * Polynomial.X) : Polynomial ℚ) : PowerSeries ℚ) *
        PowerSeries.mk (fun r => (1 + (q : ℚ) ^ r)) =
      ((Polynomial.C 2 - Polynomial.C (1 + (q : ℚ)) * Polynomial.X : Polynomial ℚ) :
        PowerSeries ℚ) := sorry

/-! ## The Dwork multiplier (RD.6/dwork-kummer-sign-dictionary (i)) -/

/-- The multiplier `θ = exp(π(x^q - x))` satisfies `θ' = π(q x^(q-1) - 1) θ`: this is the
horizontality of `F(σ^*e) = θ e` for the connection `∇e = π e dx` with `σ(x) = x^q`. The opposite
multiplier `exp(π(x - x^q))` (printed by Kedlaya and by Xu–Zhu) fails this identity. -/
theorem dwork_multiplier_horizontal {K : Type*} [Field K] [CharZero K] (π : K) (q : ℕ) :
    PowerSeries.derivative K
        ((PowerSeries.exp K).subst (PowerSeries.C π * (PowerSeries.X ^ q - PowerSeries.X))) =
      PowerSeries.C π * (PowerSeries.C (q : K) * PowerSeries.X ^ (q - 1) - 1) *
        (PowerSeries.exp K).subst (PowerSeries.C π * (PowerSeries.X ^ q - PowerSeries.X)) :=
  sorry

/-! ## Neutral Tannakian recognition (RD.6/neutral-tannakian-recognition) -/

section Tannakian

open CategoryTheory MonoidalCategory

universe u

/-- The neutral Tannakian recognition theorem (Deligne–Milne Theorem 2.11): a `K`-linear abelian
rigid symmetric monoidal category with `End(𝟙) = K` and an exact faithful `K`-linear symmetric
monoidal functor to finite-dimensional vector spaces is equivalent to the finite-dimensional
comodules over a commutative Hopf algebra (Tau Ceti's `FGComoduleCat`, whose rigid and symmetric
structures are `TauCeti.FGComoduleCat.instRigidCategory` and `instSymmetricCategory`).
Omitted: that the equivalence is symmetric monoidal and carries `ω` to the forgetful functor, and
part (c) (a tensor generator gives a Hopf algebra of finite type); these are document targets. -/
theorem neutralTannakian_recognition (K : Type u) [Field K]
    (C : Type (u + 1)) [Category.{u} C] [Abelian C] [Linear K C]
    [MonoidalCategory C] [MonoidalPreadditive C] [MonoidalLinear K C] [SymmetricCategory C]
    [RigidCategory C]
    (hEnd : Function.Bijective (fun c : K => c • 𝟙 (𝟙_ C)))
    (ω : C ⥤ FGModuleCat K) [ω.Braided] [ω.Additive] [ω.Linear K] [ω.Faithful]
    [Limits.PreservesFiniteLimits ω] [Limits.PreservesFiniteColimits ω] :
    ∃ (H : Type u) (_ : CommRing H) (_ : HopfAlgebra K H),
      Nonempty (C ≌ TauCeti.FGComoduleCat.{u, u, u} K H) := sorry

end Tannakian

/-! ## Weights (RD.6/weight-normalising-constant-line, RD.6/middle-cohomology-is-pure) -/

/-- A `d`-th root of a Frobenius eigenvalue of `ι`-weight `w` at a point of degree `d` has
absolute value `q^(w/2)`; twisting by the constant line it spans normalises the weight to `0`. -/
theorem weight_normalising_root {K : Type*} [Field K] (ι : K →+* ℂ) {q w : ℝ} (hq : 1 < q)
    {d : ℕ} (hd : 0 < d) {α c : K} (hc : c ^ d = α) (hα : ‖ι α‖ = q ^ (w * d / 2)) :
    ‖ι c‖ = q ^ (w / 2) := sorry

/-- The linear-algebra core of purity of middle cohomology: if a Frobenius-equivariant map goes
from a space whose eigenvalues have absolute value at most `r` to one whose eigenvalues have
absolute value at least `r`, every eigenvalue on its image has absolute value `r`. -/
theorem eigenvalue_norm_eq_on_image {V W : Type*} [AddCommGroup V] [Module ℂ V]
    [AddCommGroup W] [Module ℂ W] [FiniteDimensional ℂ V] [FiniteDimensional ℂ W]
    (FV : Module.End ℂ V) (FW : Module.End ℂ W) (f : V →ₗ[ℂ] W) (hf : f ∘ₗ FV = FW ∘ₗ f)
    (r : ℝ) (hV : ∀ μ, Module.End.HasEigenvalue FV μ → ‖μ‖ ≤ r)
    (hW : ∀ μ, Module.End.HasEigenvalue FW μ → r ≤ ‖μ‖)
    (μ : ℂ) (v : V) (hv : f v ≠ 0) (hμ : FW (f v) = μ • f v) : ‖μ‖ = r := sorry

end

end TauCetiRoadmap.PadicDifferentialEquationsAndRigidCohomology.RD6

/-! ## RD.7 signatures -/

namespace TauCetiRoadmap.PadicDifferentialEquationsAndRigidCohomology.RD7

open Polynomial

/-! ## Weight separation (README §2) -/

section WeightSeparation

/-- **Descent of rationality** (`RD.7/rational-zeta-descent-and-fatou` (a)): a power series
over `k` that is rational over an extension field `L` is rational over `k`
(Hankel determinants; Deligne, Weil I, p. 276; Milne, Lemma 27.9). -/
theorem rationalSeries_descent {k L : Type*} [Field k] [Field L] [Algebra k L]
    (f : PowerSeries k) (A B : L[X]) (hB : B.coeff 0 ≠ 0)
    (h : (B : PowerSeries L) * PowerSeries.map (algebraMap k L) f = (A : PowerSeries L)) :
    ∃ A' B' : k[X], B'.coeff 0 ≠ 0 ∧ (B' : PowerSeries k) * f = (A' : PowerSeries k) := by
  sorry

/-- **Local Fatou lemma** (`RD.7/rational-zeta-descent-and-fatou` (b)): the coprime
normalised numerator and denominator of an `ℓ`-adically integral rational series are
`ℓ`-adically integral (Milne, Lemma 27.10, with `≤ 1` at the boundary). -/
theorem fatou_local (ℓ : ℕ) [Fact ℓ.Prime] (f : PowerSeries ℤ_[ℓ])
    (hf : PowerSeries.constantCoeff f = 1) (G H : ℚ_[ℓ][X]) (hcop : IsCoprime G H)
    (hG : G.coeff 0 = 1) (hH : H.coeff 0 = 1)
    (h : (H : PowerSeries ℚ_[ℓ]) * PowerSeries.map (algebraMap ℤ_[ℓ] ℚ_[ℓ]) f =
      (G : PowerSeries ℚ_[ℓ])) :
    (∀ n, ‖G.coeff n‖ ≤ 1) ∧ ∀ n, ‖H.coeff n‖ ≤ 1 := by
  sorry

/-- **Fatou's lemma** (`RD.7/rational-zeta-descent-and-fatou` (c)): an integral power series
with constant term `1` that is rational over `ℚ` is `A/B` with `A, B ∈ 1 + tℤ[t]` coprime. -/
theorem fatou (f : PowerSeries ℤ) (hf : PowerSeries.constantCoeff f = 1) (A B : ℚ[X])
    (hB : B.coeff 0 ≠ 0)
    (h : (B : PowerSeries ℚ) * PowerSeries.map (Int.castRingHom ℚ) f = (A : PowerSeries ℚ)) :
    ∃ A' B' : ℤ[X], A'.coeff 0 = 1 ∧ B'.coeff 0 = 1 ∧
      IsCoprime (A'.map (Int.castRingHom ℚ)) (B'.map (Int.castRingHom ℚ)) ∧
      ((B'.map (Int.castRingHom ℚ) : ℚ[X]) : PowerSeries ℚ) *
          PowerSeries.map (Int.castRingHom ℚ) f =
        ((A'.map (Int.castRingHom ℚ) : ℚ[X]) : PowerSeries ℚ) := by
  sorry

/-- Unit test `fatou` (non-example: integrality cannot be dropped). The rational series
`1/(1 − t/2)` has the coprime normalised presentation `1/(1 − t/2)`, whose denominator is not
integral; its expansion `Σ t^n/2^n` is not in `ℤ⟦t⟧`. -/
example : ((1 - C (1 / 2 : ℚ) * X : ℚ[X]) : PowerSeries ℚ) *
    PowerSeries.mk (fun n => (1 / 2 : ℚ) ^ n) = 1 := by
  sorry

/-- **Weight separation** (`RD.7/weight-separated-factor-extraction`), with the family realised
in `ℂ`: if `∏ P_i^{(−1)^{i+1}} = A/B` with `A, B ∈ 1 + tℤ[t]` coprime, and every reciprocal
root of `P_i` (a root of its reverse) is a Weil `q`-number of weight `i` (all conjugates of
absolute value `q^{i/2}`; the inline condition stands for
`DeligneWeightsAndPurity:DWP.0/weil-q-number`), then every `P_i` comes from a unique
polynomial in `1 + tℤ[t]`. -/
theorem weightSeparated_factor_extraction (q : ℕ) (hq : 1 < q) (N : ℕ)
    (A B : ℤ[X]) (hA : A.coeff 0 = 1) (hB : B.coeff 0 = 1)
    (hcop : IsCoprime (A.map (Int.castRingHom ℚ)) (B.map (Int.castRingHom ℚ)))
    (P : Fin (N + 1) → ℂ[X]) (hP0 : ∀ i, (P i).coeff 0 = 1)
    (hprod : (∏ i ∈ Finset.univ.filter (fun i : Fin (N + 1) => Odd (i : ℕ)), P i) *
        B.map (Int.castRingHom ℂ) =
      (∏ i ∈ Finset.univ.filter (fun i : Fin (N + 1) => Even (i : ℕ)), P i) *
        A.map (Int.castRingHom ℂ))
    (hpure : ∀ i, ∀ α ∈ (P i).reverse.roots, IsAlgebraic ℚ α ∧
      ∀ β ∈ (minpoly ℚ α).aroots ℂ, ‖β‖ = (q : ℝ) ^ (((i : ℕ) : ℝ) / 2)) :
    ∃ Fac : Fin (N + 1) → ℤ[X], ∀ i, (Fac i).coeff 0 = 1 ∧
      (Fac i).map (Int.castRingHom ℂ) = P i := by
  sorry

/-- Unit test of weight separation on `ℙ¹` over `𝔽_q`: the factors `1 − t`, `1`, `1 − qt`
satisfy the product relation with `A = 1`, `B = (1 − t)(1 − qt)`. -/
example (q : ℕ) :
    ((1 : ℂ[X]) : ℂ[X]) * ((1 - X) * (1 - C (q : ℂ) * X)) =
      ((1 - X) * (1 - C (q : ℂ) * X)) * 1 := by
  ring

end WeightSeparation

/-! ## Elliptic curves (README §3) -/

section Elliptic

/-- `𝔽₇ = ZMod 7` is a field. -/
local instance : Fact (Nat.Prime 7) := ⟨by norm_num⟩

variable {F : Type*} [Field F] [Finite F]

/-- The Weil factor `1 − a t + q t²` of a Weierstrass model over a finite field with `q`
elements, with `a = q + 1 − #W(F)` Tau Ceti's `frobeniusTrace`. For an elliptic model it is
`P_1(E, t)` of `RD.7/abelian-variety-crystalline-frobenius-polynomial` (3). -/
noncomputable def ellipticWeilFactor (W : WeierstrassCurve F) : ℤ[X] :=
  1 - C W.frobeniusTrace * X + C (Nat.card F : ℤ) * X ^ 2

theorem ellipticWeilFactor_coeff_zero (W : WeierstrassCurve F) :
    (ellipticWeilFactor W).coeff 0 = 1 := by
  sorry

theorem ellipticWeilFactor_natDegree (W : WeierstrassCurve F) :
    (ellipticWeilFactor W).natDegree = 2 := by
  sorry

/-- Unit test (computation): `y² = x³ + x + 1` over `𝔽₇` has `5` points, `a = 3`, and Weil
factor `1 − 3t + 7t²`. -/
example : ellipticWeilFactor (⟨0, 0, 0, 1, 1⟩ : WeierstrassCurve (ZMod 7)) =
    1 - 3 * X + 7 * X ^ 2 := by
  sorry

/-- Unit test (supersingular): `y² = x³ + x` over `𝔽₇` has `8` points, `a = 0`, and Weil
factor `1 + 7t²`. -/
example : ellipticWeilFactor (⟨0, 0, 0, 1, 0⟩ : WeierstrassCurve (ZMod 7)) = 1 + 7 * X ^ 2 := by
  sorry

end Elliptic

/-! ## Point-counting certificates (README §4) -/

section PointCounting

/-- The exponent `⌊log_p(2m + 1)⌋` of Kedlaya's Lemma 2 (`RD.7/kedlaya-reduction-denominators` (a)). -/
def kedlayaNegativeExponent (p m : ℕ) : ℕ := Nat.log p (2 * m + 1)

/-- The exponent `⌊log_p((2g + 1)(2m + 3) − 2)⌋` of the corrected Lemma 3
(`RD.7/kedlaya-reduction-denominators` (b); Edixhoven, Lemma 4.3.5). -/
def kedlayaPositiveExponent (p g m : ℕ) : ℕ := Nat.log p ((2 * g + 1) * (2 * m + 3) - 2)

/-- The exponent `c = ⌊log_p(2g − 1)⌋` bounding the index of the crystalline lattice
(`RD.7/hyperelliptic-integral-frobenius-lattice` (2); Edixhoven, Proposition 5.3.1). -/
def latticeDefectExponent (p g : ℕ) : ℕ := Nat.log p (2 * g - 1)

/-- Tuitman's reconstruction precision `max_{1 ≤ i ≤ g} (⌊log_p binom(4g, i) + ni/2⌋ + 1)`
(`RD.7/tuitman-precision-certification` (1); Tuitman, Proposition 4.2). -/
noncomputable def tuitmanReconstructionPrecision (p g n : ℕ) : ℕ :=
  (Finset.Icc 1 g).sup fun i =>
    (⌊Real.logb p ((4 * g).choose i) + ((n * i : ℕ) : ℝ) / 2⌋).toNat + 1

/-- Unit test: for `Q = x³ + x + 1` and `p = 5`, `m = 0`, the corrected exponent is `1`. -/
example : kedlayaPositiveExponent 5 1 0 = 1 := by
  sorry

/-- Unit test (non-example for the printed Lemma 3 and the literal errata formula):
both give the exponent `⌊log_5 1⌋ = 0` here. -/
example : Nat.log 5 (2 * 0 + 1) = 0 ∧ Nat.log 5 ((2 * 1 + 1) * (0 + 1) - 2) = 0 := by
  sorry

/-- Unit test: the reduction of `y dx = Q dx/y` for `Q = x³ + x + 1` uses
`d((2/5)xy) = (2/5)(Q + xQ'/2) dx/y` and leaves `(2/5)x + 3/5`, whose denominators are `5`. -/
example :
    let Q : ℚ[X] := X ^ 3 + X + 1
    Q - C (2 / 5) * (Q + C (1 / 2) * (X * derivative Q)) = C (2 / 5) * X + C (3 / 5) := by
  sorry

/-- Unit test: genus two over `𝔽_3` has lattice defect exponent `1`; genus one has `0`. -/
example : latticeDefectExponent 3 2 = 1 ∧ latticeDefectExponent 3 1 = 0 := by
  sorry

/-- Unit test: genus two over `𝔽_7` (`n = 1`) needs precision `3`. -/
example : tuitmanReconstructionPrecision 7 2 1 = 3 := by
  sorry

/-- Unit test: the Weil factor of `y² = x⁵ + x + 3` over `𝔽₇` is the reverse characteristic
polynomial convention of Mathlib (`Matrix.charpolyRev`): its reverse is the monic
`T⁴ + 3T³ + 7T² + 21T + 49`. -/
example : (1 + 3 * X + 7 * X ^ 2 + 21 * X ^ 3 + 49 * X ^ 4 : ℤ[X]).reverse =
    X ^ 4 + 3 * X ^ 3 + 7 * X ^ 2 + 21 * X + 49 := by
  sorry

end PointCounting

/-! ## Unstated interfaces

The following packet names need carriers that the pinned libraries do not have (rigid and
crystalline cohomology, tubes, divided power envelopes of formal schemes, convergent
isocrystals, dagger algebras of curves, Tate realisations of abelian varieties, period rings).
They are README targets, not Lean declarations:

* `RD.7/tube-to-envelope-comparison-map`: `RigidCohomology.tubeToEnvelope`,
  `tubeToEnvelope_affine`, `tubeToEnvelope_unique`, `tubeToEnvelope_comm_deriv`,
  `tubeToEnvelope_naturality`, `tubeToEnvelope_lift`, `tubeToEnvelope_coeff`,
  `tubeToEnvelope_cohomology`; tests `tubeToEnvelope_point_in_disc`,
  `tubeToEnvelope_lift_eq_id`, `tubeToEnvelope_not_surjective`,
  `tubeToEnvelope_compat_crystalline` (need tubes, `sp_*` and completed PD envelopes).
* `RD.7/comparison-map-quasi-isomorphism` and
  `RD.7/crystalline-rigid-comparison-with-coefficients` (need rigid and crystalline cohomology).
* `RD.7/abelian-variety-crystalline-frobenius-polynomial` (needs crystalline `H¹` and the
  étale Tate realisation; its elliptic case (3) is `ellipticWeilFactor` above).
* `RD.7/kedlaya-reduction-denominators` and `RD.7/hyperelliptic-integral-frobenius-lattice`
  (need the dagger algebra `A†` and its Monsky–Washnitzer cohomology; their exponents are
  `kedlayaNegativeExponent`, `kedlayaPositiveExponent` and `latticeDefectExponent` above).
* `RD.7/tuitman-frobenius-structure-algorithm`: `RigidCohomology.Tuitman.Assumption1`,
  `goodCompactification`, `frobeniusLift`, `reduce`, `reduce_unique`, `frobeniusMatrix`,
  `frobeniusMatrix_eq_rigid`, `charpolyRev_eq_weilFactor`, `hyperelliptic`; tests
  `hyperelliptic_genus_two`, `genus_zero`, `assumption_printed_too_strong`, `lift_independent`,
  `frobeniusPower_order` (need weakly complete algebras and their de Rham cohomology; the
  Frobenius matrix is in the row convention, so the `q`-power matrix is `F^{σ^{n−1}} ⋯ F^σ F`); and
  `RD.7/tuitman-precision-certification`, whose numerical part is
  `tuitmanReconstructionPrecision` above.
* `RD.7/mieda-p-adic-picard-lefschetz`, `RD.7/kloosterman-semistable-realization` and
  `RD.7/kloosterman-newton-above-hodge` (need rigid and log-crystalline cohomology, the
  Kloosterman F-isocrystal and the period rings `B_st`, `B_cris`).
-/

end TauCetiRoadmap.PadicDifferentialEquationsAndRigidCohomology.RD7
