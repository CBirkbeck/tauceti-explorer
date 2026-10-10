/-
This file is not the roadmap and is not exhaustive. The `README.md`
is definitive. These statements suggest Lean forms so that contributors and
reviewers converge on names and signatures. Every theorem/example is admitted,
and no implementation is claimed.
-/
import Mathlib.LinearAlgebra.Matrix.NonsingularInverse
import Mathlib.Data.Matrix.Block
import Mathlib.Analysis.Complex.Basic
import Mathlib.Analysis.Calculus.Deriv.Basic
import Mathlib.Topology.Algebra.InfiniteSum.Basic
import Mathlib.Algebra.Polynomial.Eval.Defs

/-
The native prototypes below use the actual matrix, derivative and infinite-sum APIs.
The remaining milestones are explicitly omitted until their genuine supplier interfaces
are available; their mathematical contracts, API names and tests remain recorded below.
The theorem and example bodies are admissions, not formalized proofs.
No Siegel space, moduli stack, Galois-genericity, theta map or arithmetic
hypersurface is encoded by a synthetic carrier or replacement Prop field.
-/
namespace TauCeti.NoJacobian
open scoped BigOperators

abbrev CMatrix (g : ℕ) := Matrix (Fin g) (Fin g) ℂ
abbrev RMatrix (g : ℕ) := Matrix (Fin g) (Fin g) ℝ
abbrev RBlocks (g : ℕ) := Matrix (Fin 2) (Fin 2) (RMatrix g)

/-- AbelianVarietiesIsogenousToNoJacobian:MZ0/period-matrix-correspondence.
Real block coordinates are ordered a,b,c,d and cast entrywise to complex.
This actual native set precedes all geometric specialization of the target. -/
def periodMatrixCorrespondence {g : ℕ} (τ : CMatrix g) (Z : Set (CMatrix g)) :
    Set (RBlocks g) :=
  {X | ((X 1 0).map Complex.ofReal * τ + (X 1 1).map Complex.ofReal).det ≠ 0 ∧
    ((X 0 0).map Complex.ofReal * τ + (X 0 1).map Complex.ofReal) *
      ((X 1 0).map Complex.ofReal * τ + (X 1 1).map Complex.ofReal)⁻¹ ∈ Z}
namespace periodMatrixCorrespondence

theorem mem_iff {g : ℕ} (τ : CMatrix g) (Z : Set (CMatrix g)) (X : RBlocks g) :
    X ∈ periodMatrixCorrespondence τ Z ↔
      ((X 1 0).map Complex.ofReal * τ + (X 1 1).map Complex.ofReal).det ≠ 0 ∧
      ((X 0 0).map Complex.ofReal * τ + (X 0 1).map Complex.ofReal) *
        ((X 1 0).map Complex.ofReal * τ + (X 1 1).map Complex.ofReal)⁻¹ ∈ Z := by
  sorry

theorem mono {g : ℕ} (τ : CMatrix g) {Z Z' : Set (CMatrix g)} (h : Z ⊆ Z') :
    periodMatrixCorrespondence τ Z ⊆ periodMatrixCorrespondence τ Z' := by
  sorry

theorem inter {g : ℕ} (τ : CMatrix g) (Z Z' : Set (CMatrix g)) :
    periodMatrixCorrespondence τ (Z ∩ Z') =
      periodMatrixCorrespondence τ Z ∩ periodMatrixCorrespondence τ Z' := by
  sorry

theorem empty {g : ℕ} (τ : CMatrix g) :
    periodMatrixCorrespondence τ ∅ = ∅ := by
  sorry

theorem identity {g : ℕ} (τ : CMatrix g) (Z : Set (CMatrix g)) :
    (1 : RBlocks g) ∈ periodMatrixCorrespondence τ Z ↔ τ ∈ Z := by
  sorry

/-- TauCeti.NoJacobian.periodMatrixCorrespondence.emptyTarget -/
example {g : ℕ} (_hg : 1 ≤ g) (τ : CMatrix g) :
    periodMatrixCorrespondence τ ∅ = ∅ := by
  sorry

/-- TauCeti.NoJacobian.periodMatrixCorrespondence.identityGenusOne -/
example : (1 : RBlocks 1) ∈
    periodMatrixCorrespondence (fun _ _ => Complex.I)
      ({(fun _ _ => Complex.I)} : Set (CMatrix 1)) := by
  sorry

/-- TauCeti.NoJacobian.periodMatrixCorrespondence.singularExcluded -/
example {g : ℕ} (hg : 1 ≤ g) (τ : CMatrix g) :
    (0 : RBlocks g) ∉ periodMatrixCorrespondence τ Set.univ := by
  sorry
end periodMatrixCorrespondence

/-- AbelianVarietiesIsogenousToNoJacobian:I0/denominator-invertible.
The integer representation sign convention is a,-b;-c,d.
No polarization preservation or fabricated period-space predicate is needed. -/
theorem denominator_invertible {g : ℕ} (a b c d τ η : CMatrix g)
    (hdet : (Matrix.fromBlocks a (-b) (-c) d).det ≠ 0)
    (hrel : η * (c * τ + d) = a * τ + b) :
    (c * τ + d).det ≠ 0 ∧ η = (a * τ + b) * (c * τ + d)⁻¹ := by
  sorry

/-- AbelianVarietiesIsogenousToNoJacobian:X0/newton-series.
The native total sum is defined for any t,a; its interpolation API requires
injective t, and its entire-function API requires the displayed envelope. -/
noncomputable def newtonSeries (t : ℕ → ℝ) (a : ℕ → ℂ) (z : ℂ) : ℂ :=
  ∑' n, a n * ∏ m ∈ Finset.range n, (z - (t m : ℂ)) / ((t n : ℂ) - (t m : ℂ))
namespace newtonSeries

theorem at_parameter (t : ℕ → ℝ) (a : ℕ → ℂ) (ht : Function.Injective t) (k : ℕ) :
    newtonSeries t a (t k) =
      ∑ n ∈ Finset.range (k + 1), a n *
        ∏ m ∈ Finset.range n, ((t k : ℂ) - (t m : ℂ)) / ((t n : ℂ) - (t m : ℂ)) := by
  sorry

theorem finite_support (t : ℕ → ℝ) (a : ℕ → ℂ) (s : Finset ℕ)
    (ha : ∀ n, n ∉ s → a n = 0) (z : ℂ) :
    newtonSeries t a z = ∑ n ∈ s, a n *
      ∏ m ∈ Finset.range n, (z - (t m : ℂ)) / ((t n : ℂ) - (t m : ℂ)) := by
  sorry

theorem summable_at (t : ℕ → ℝ) (a : ℕ → ℂ) (ht : Function.Injective t)
    (henv : ∀ R : ℝ, 0 < R → Summable (fun n => ‖a n‖ *
      ∏ m ∈ Finset.range n, (R + |t m|) / |t n - t m|)) (z : ℂ) :
    Summable (fun n => a n *
      ∏ m ∈ Finset.range n, (z - (t m : ℂ)) / ((t n : ℂ) - (t m : ℂ))) := by
  sorry

theorem holomorphic (t : ℕ → ℝ) (a : ℕ → ℂ) (ht : Function.Injective t)
    (henv : ∀ R : ℝ, 0 < R → Summable (fun n => ‖a n‖ *
      ∏ m ∈ Finset.range n, (R + |t m|) / |t n - t m|)) :
    Differentiable ℂ (newtonSeries t a) := by
  sorry

theorem polynomial_compatibility (t : ℕ → ℝ) (a : ℕ → ℂ) (s : Finset ℕ)
    (ha : ∀ n, n ∉ s → a n = 0) (z : ℂ) :
    newtonSeries t a z = Polynomial.eval z
      (∑ n ∈ s, Polynomial.C (a n) *
        ∏ m ∈ Finset.range n, Polynomial.C (((t n : ℂ) - (t m : ℂ))⁻¹) *
          (Polynomial.X - Polynomial.C (t m : ℂ))) := by
  sorry

/-- TauCeti.NoJacobian.newtonSeries.zero_coefficients -/
example (t : ℕ → ℝ) (z : ℂ) : newtonSeries t (fun _ => 0) z = 0 := by
  sorry

/-- TauCeti.NoJacobian.newtonSeries.constant_coefficients -/
example (t : ℕ → ℝ) (c z : ℂ) :
    newtonSeries t (fun n => if n = 0 then c else 0) z = c := by
  sorry

/-- TauCeti.NoJacobian.newtonSeries.linear_basis -/
example (z : ℂ) :
    newtonSeries (fun n => (n : ℝ) + 1) (fun n => if n = 1 then 1 else 0) z = z - 1 := by
  sorry
end newtonSeries
end TauCeti.NoJacobian

/-! Layer 0: Moduli, the Torelli locus and period conventions (MZ0). -/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:MZ0/jacobian-locus (0A)
The genuine Siegel/PEL, Torelli, classical reduction and descent interfaces are prerequisites.
Definition: For g≥2, define T_g⊆A_g as the image of the smooth genus-g curve moduli stack under the canonical principally polarized relative Jacobian morphism. Take its reduced Zariski closure inside A_g, not inside a Satake compactification. Isogenies in the avoidance problem need not preserve polarizations.
Prerequisites: JacobianChallengePartII:JC1/relative-jacobian, JacobianChallengePartII:JC1/principal-polarization, StableReductionPartII:MC.2/pointed-dm-theorem, PELModuli:M5
API TauCeti.NoJacobian.torelliLocus.mem_iff: x∈T_g iff x is the canonically polarized Jacobian of a smooth genus-g curve over an algebraically closed field of characteristic zero.
API TauCeti.NoJacobian.torelliLocus.subset_closure: T_g⊆closure(T_g), with closure in A_g.
API TauCeti.NoJacobian.torelliLocus.baseChange: The relative Jacobian moduli morphism commutes with extension of characteristic-zero algebraically closed fields.
API TauCeti.NoJacobian.torelliLocus.jacobianComparison: For a single curve the relative Jacobian specializes to the JacobianChallenge Jacobian with its theta polarization.
Test TauCeti.NoJacobian.torelliLocus.genusTwoClosure (degenerate): The closure of T_2 is A_2; it is not a proper hypersurface.
Test TauCeti.NoJacobian.torelliLocus.genusFourDimension (computation): dim T_4=9 whereas dim A_4=10.
Test TauCeti.NoJacobian.torelliLocus.productBoundary (non-example): A product of two elliptic curves belongs to closure(T_2) and is not a smooth genus-two Jacobian with its product principal polarization.
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:MZ0/torelli-dimension (0B)
The genuine Siegel/PEL, Torelli, classical reduction and descent interfaces are prerequisites.
Theorem: For g≥2 in characteristic zero, dim T_g=3g−3. In particular 3g−3<g(g+1)/2 for g≥4.
Prerequisites: 0A
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:MZ0/compact-type-closure (0C)
The genuine Siegel/PEL, Torelli, classical reduction and descent interfaces are prerequisites.
Theorem: Over C, closure(T_g) inside A_g is the locus of principally polarized Jacobians of stable compact-type genus-g curves. Its product factors come from the smooth components; non-compact-type generalized Jacobians have toric parts and are not A_g-points.
Prerequisites: 0A, StableReductionPartII:MC.2/pointed-dm-theorem
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:MZ0/jacobian-hypersurface (0D)
The genuine Siegel/PEL, Torelli, classical reduction and descent interfaces are prerequisites.
Construction: For g≥4 over C, choose a proper algebraic hypersurface H_g⊆A_g containing closure(T_g). The choice is an algebraic hypersurface in a quasi-projective moduli space; it need not be defined over Q.
Prerequisites: 0B, 0C, ShimuraCompactifications:C5
API TauCeti.NoJacobian.jacobianHypersurface.contains: Every canonically polarized compact-type Jacobian lies in the chosen H_g.
API TauCeti.NoJacobian.jacobianHypersurface.proper: H_g is a proper algebraic subset of pure codimension one after adding any needed hypersurface components.
API TauCeti.NoJacobian.jacobianHypersurface.dimension: dim H_g=G−1 on its nonempty components.
API TauCeti.NoJacobian.jacobianHypersurface.ambient: The containment is inside PELModuli A_g and is independent of a chosen level lift.
Test TauCeti.NoJacobian.jacobianHypersurface.genusFour (computation): For g=4 the Jacobian closure itself is the Schottky hypersurface.
Test TauCeti.NoJacobian.jacobianHypersurface.genusThree (non-example): The construction requires g≥4: closure(T_3)=A_3.
Test TauCeti.NoJacobian.jacobianHypersurface.levelForgetful (compatibility): Every fine-level lift of a Jacobian maps into H_g under the forgetful map.
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:MZ0/minkowski-domain (0E)
The genuine Siegel/PEL, Torelli, classical reduction and descent interfaces are prerequisites.
Definition: For g≥1, F_g is the set of symmetric τ=x+iy in H_g for which y is Minkowski reduced, every |x_ij|≤1/2, and |det(cτ+d)|≥1 for every block matrix in Sp_{2g}(Z). Pin the classical reduction inequalities, including the ordered diagonal, and retain boundary equalities.
Prerequisites: ShimuraData:D5, AdelicAlgebraicGroups:AA.3, ShimuraVarieties:V0
API TauCeti.NoJacobian.minkowskiDomain.mem_iff: For τ∈H_g, membership in F_g is equivalent to Minkowski reduction of Im τ, all |Re τ_ij|≤1/2, and all symplectic-block determinant inequalities |det(cτ+d)|≥1; these retain equality on the boundary.
API TauCeti.NoJacobian.minkowskiDomain.orbitMeets: Every Sp_{2g}(Z)-orbit in H_g meets F_g.
API TauCeti.NoJacobian.minkowskiDomain.realPart: τ∈F_g implies |Re τ_ij|≤1/2 for all i,j.
API TauCeti.NoJacobian.minkowskiDomain.semialgebraic: F_g is semialgebraic after the source reduction to finitely many polynomial inequalities.
API TauCeti.NoJacobian.minkowskiDomain.genusOne: F_1 agrees with the closed SL_2(Z) domain |Re τ|≤1/2 and |τ|≥1.
Test TauCeti.NoJacobian.minkowskiDomain.i (computation): τ=i lies in F_1 and has y=1.
Test TauCeti.NoJacobian.minkowskiDomain.smallImaginary (non-example): τ=i/2 is in H_1 but not in F_1.
Test TauCeti.NoJacobian.minkowskiDomain.diagonalOrder (non-example): The block product diag(2i,i) need not lie in F_2 because its imaginary diagonal is not ordered.
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:MZ0/igusa-diagonal-estimates (0F)
The genuine Siegel/PEL, Torelli, classical reduction and descent interfaces are prerequisites.
Theorem: For each g≥1 there exists δ_g∈(0,1] such that every τ=x+iy∈F_g satisfies δ_g y^(0)≤y≤δ_g⁻¹y^(0), y^(0)≥δ_g I, and √3/2≤y_1≤⋯≤y_g. Matrix order means positive semidefinite difference.
Prerequisites: 0E
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:MZ0/block-product-domain (0G)
The genuine Siegel/PEL, Torelli, classical reduction and descent interfaces are prerequisites.
Lemma: If two genus-g matrices satisfy the diagonal comparisons with the same δ∈(0,1] and |x_ij|≤δ⁻¹, their block diagonal matrix in H_{2g} satisfies the same comparisons and real-entry bound. No ordered diagonal hypothesis is retained.
Prerequisites: 0F, Mathlib Matrix.fromBlocks
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:MZ0/coefficient-descent (0H)
The genuine Siegel/PEL, Torelli, classical reduction and descent interfaces are prerequisites.
Lemma: For a proper complex algebraic hypersurface H in a geometrically integral quasi-projective variety X defined over Q̄, its Q̄-points are contained in a proper Q̄-defined algebraic hypersurface H′. On a finite affine/projective cover, expand defining equations against a finite Q̄-linearly independent coefficient basis; all resulting coefficient equations vanish at algebraic points.
Prerequisites: AlgebraicModuliForArithmeticGeometry:R09.1, PELModuli:M5
-/

/- 0I. AbelianVarietiesIsogenousToNoJacobian:MZ0/period-matrix-correspondence: native declarations above. -/

/-! Layer 1: Elliptic matrices and isogeny-class counts (E0). -/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:E0/elliptic-matrix (1A)
The genuine elliptic lattice, isogeny-degree and quantitative counting interfaces are prerequisites.
Theorem: If E, Ẽ are related by an isogeny of degree m and τ, τ̃ ∈ F satisfy j(τ) = j(E), j(τ̃) = j(Ẽ), then τ̃ = (aτ + b)/(cτ + d) with a, b, c, d ∈ Z, ad − bc = m and max{|a|, |b|, |c|, |d|} ≤ 2m^{3/2}.
Prerequisites: 0E, ModularCurvesPartII:R12.1
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:E0/finite-subgroup-count (1B)
The genuine elliptic lattice, isogeny-degree and quantitative counting interfaces are prerequisites.
Theorem: For g≥1 there exists C_g>0 such that the number of finite subgroups Γ⊆(Q/Z)^{2g} of order at most m is ≤C_g m^{2g} for every integer m≥1. For g=1 the bound m² suffices.
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:E0/elliptic-many-classes (1C)
The genuine elliptic lattice, isogeny-degree and quantitative counting interfaces are prerequisites.
Theorem: For every integer N≥2, the curves E_j, j = n1 + in2 with 1 ≤ n1, n2 ≤ N, represent at least C_0^{-1} N²/(log N)⁴ isogeny classes, C_0 > 0 absolute.
Prerequisites: 1B
-/

/-! Layer 2: Elimination and elliptic real-curve avoidance (E1). -/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:E1/iterated-elimination (2A)
The modular-polynomial and uniform projected-block interfaces are prerequisites.
Construction: Fix a nonzero polynomial f∈ℂ[y₁,y₂]. One can choose a constant c(f)>0 and, for each integer m≥1, a nonzero G_m∈ℂ[x₁,x₂] of total degree ≤c(f)ψ(m)². Every simultaneous solution (ξ₁,ξ₂,η₁,η₂) of Φ_m(ξ₁,η₁)=0, Φ_m(ξ₂,η₂)=0 and f(η₁,η₂)=0 satisfies G_m(ξ₁,ξ₂)=0.
Prerequisites: Mathlib Polynomial.resultant, Mathlib Polynomial.resultant_eq_zero_iff, ModularCurvesPartII:R13.4
API TauCeti.NoJacobian.eliminationPolynomial.nonzero: For f≠0 and m≥1 the chosen G_m is nonzero.
API TauCeti.NoJacobian.eliminationPolynomial.vanishes: A common solution of the two modular equations and f=0 maps to G_m=0.
API TauCeti.NoJacobian.eliminationPolynomial.degree: deg G_m≤c(f)ψ(m)².
API TauCeti.NoJacobian.eliminationPolynomial.constant: For nonzero constant f choose G_m=1.
API TauCeti.NoJacobian.eliminationPolynomial.resultantComparison: Each elimination uses Polynomial.resultant at the fixed source degree bounds, with its specialization law.
Test TauCeti.NoJacobian.eliminationPolynomial.constantOne (degenerate): For f=1 there are no common solutions and G_m=1 works.
Test TauCeti.NoJacobian.eliminationPolynomial.identityCorrespondence (computation): For m=1 and f(y1,y2)=y1−y2 one may choose G_1=x1−x2 up to a nonzero scalar.
Test TauCeti.NoJacobian.eliminationPolynomial.zeroExcluded (non-example): f=0 is excluded: a nonzero polynomial cannot vanish on every pair under the identity correspondence.
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:E1/psi-square-sum (2B)
The modular-polynomial and uniform projected-block interfaces are prerequisites.
Lemma: For ψ(m)=m∏_{p∣m}(1+1/p) and integers M≥2, ∑_{1≤m≤M}ψ(m)²≪M³ log M. The companion bound is ∑_{m≤M}ψ(m)≤∑_{d≤M}d⌊M/d⌋≤M²; keeping the floor factor is necessary for the divisor-sum argument.
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:E1/small-isogeny-candidates (2C)
The modular-polynomial and uniform projected-block interfaces are prerequisites.
Theorem: Fix a nonzero polynomial f∈Q̄[y1,y2] and the real algebraic curve C={c∈C:f(c,c̄)=0}, with constants depending on f. Given integers M ≥ 2 and N ≥ 1, there are only ≪_f N M³ log M pairs n = (n1, n2) with 1 ≤ n1, n2 ≤ N such that E_n (j = n1 + in2) is isogenous to its complex conjugate or to some E_c with c ∈ C via an isogeny of degree at most M.
Prerequisites: 2A, 2B, Mathlib MvPolynomial.schwartz_zippel_totalDegree, ModularCurvesPartII:R13.4
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:E1/elliptic-large-field (2D)
The modular-polynomial and uniform projected-block interfaces are prerequisites.
Theorem: For N sufficiently large depending on the fixed f, with M=floor((log N)³)≥2, suppose E_n is isogenous to Ẽ=E_c with c∈C and n is outside the exceptions of 2C at this M. If Ẽ has a model over a number field of degree at most D̃≥2, then there is an isogeny of degree m̃≪D̃⁷ and log N≪D̃²(log D̃)². Constants depend only on the fixed curve.
Prerequisites: 2C
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:E1/elliptic-double-correspondence (2E)
The modular-polynomial and uniform projected-block interfaces are prerequisites.
Construction: For τ,τ′∈H_1 and a non-modular absolutely irreducible C_f⊆C², put Z=F_1²∩(j×j)⁻¹(C_f). Let W_{τ,τ′}⊆R^8 be the pairs of real 2×2 fractional-linear matrices with both denominators nonzero and both outputs in Z. Its projection π sends a pair to those two periods; no determinant=m restriction is part of the ambient definable family.
Prerequisites: 1A, 0I, 0E, ModularCurvesPartII:R12.1, LogicAndDefinabilityInNumberTheory:LD.6
API TauCeti.NoJacobian.ellipticDoubleCorrespondence.mem_iff: Membership requires both nonzero denominators and f(j(output1),j(output2))=0 with both outputs in F_1.
API TauCeti.NoJacobian.ellipticDoubleCorrespondence.projection: π(X,X′) is the ordered pair of fractional-linear images.
API TauCeti.NoJacobian.ellipticDoubleCorrespondence.height: The integral matrices arising from degree m isogenies have all eight entries at most 2m^{3/2}.
API TauCeti.NoJacobian.ellipticDoubleCorrespondence.productCompatibility: The two outputs agree with the genus-one specialization of periodMatrixCorrespondence.
Test TauCeti.NoJacobian.ellipticDoubleCorrespondence.identityPair (computation): For identity matrices membership is exactly (τ,τ′)∈Z.
Test TauCeti.NoJacobian.ellipticDoubleCorrespondence.oneZeroDenominator (non-example): A zero denominator in either factor excludes the pair even if the other factor is valid.
Test TauCeti.NoJacobian.ellipticDoubleCorrespondence.pairedNeeded (non-example): A single R^4 correspondence does not encode both conjugate modular equations used in this proof.
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:E1/elliptic-block-images (2F)
The modular-polynomial and uniform projected-block interfaces are prerequisites.
Lemma: If C_f⊆C² is absolutely irreducible, involves both variables, and is neither a modular correspondence nor vertical/horizontal, then Z=F_1²∩(j×j)⁻¹(C_f) has empty algebraic part. Every connected Pila-block image under π is a point.
Prerequisites: 2E, LogicAndDefinabilityInNumberTheory:LD.6
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:E1/elliptic-orbit-collapse (2G)
The modular-polynomial and uniform projected-block interfaces are prerequisites.
Lemma: Outside the small-isogeny exceptional set, the paired periods of the conjugates of c have cardinality ≫D̃ and lie among ≤C_ε T^ε point images with T≤2m̃^{3/2}. Hence D̃≪m̃^{3ε/2}; choosing 0<ε<2/21 and m̃≪D̃^7 forces D̃≪1.
Prerequisites: 2F, 2D, LogicAndDefinabilityInNumberTheory:LD.6
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:E1/elliptic-modular-case (2H)
The modular-polynomial and uniform projected-block interfaces are prerequisites.
Lemma: If the real algebraic curve becomes a modular correspondence Φ_m(j,j̄)=0, any E_n isogenous to a curve on it is isogenous to its own complex conjugate. The number of such n is ≪N(log N)^7; the fixed m changes the implied constant.
Prerequisites: 2C, 2D
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:E1/elliptic-avoidance (2I)
The modular-polynomial and uniform projected-block interfaces are prerequisites.
Theorem: Given a real algebraic curve C in A_1(C) = R², there is C = C(C) such that for every integer N ≥ 2 there are at most C N(log N)^{10} pairs of integers 1 ≤ n1, n2 ≤ N for which E_j, j = n1 + in2, either has complex multiplication or is isogenous to some E_c with c ∈ C.
Prerequisites: 2G, 2H, 2C, 0H, 2D
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:E1/one-parameter-obstruction (2J)
The modular-polynomial and uniform projected-block interfaces are prerequisites.
Lemma: Let d≥1 bound each variable degree of f. For n0≠0, if G_m(x+in0,x−in0) is identically zero, the modular function-field argument forces ψ(m)≤d. For each such m at most 2dψ(m)² integer offsets are exceptional.
Prerequisites: 2A, ModularCurvesPartII:R13.4
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:E1/one-parameter-offset (2K)
The modular-polynomial and uniform projected-block interfaces are prerequisites.
Theorem: With the variable-degree bound d≥1 and obstruction in 2J, there is an integer 1≤n₀≤2d⁴+1 such that every specialization G_m(x+in₀,x−in₀) is nonzero. The elementary proof uses ψ(m)≥m, hence m≤d, and sums at most 2dψ(m)²≤2d³ forbidden offsets for each of at most d degrees. The sharper bound 2d³+1 and a quantitative exceptional-count theorem on the selected horizontal line are additional problems; they are not consequences of this union bound.
Prerequisites: 2J
-/

/-! Layer 3: Rosati geometry and controlled period matrices (I0). -/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:I0/rational-analytic-trace (3A)
The actual polarized abelian variety, rational Rosati form and arithmetic period interfaces are prerequisites.
Comparison: For a principally polarized complex A of dimension g≥1, a symplectic integral homology basis with polarization matrix ε and period τ=x+iy∈H_g, and endomorphisms v,w, the rational Rosati Gram entry tr_Q(ρ(v)ερ(w)^tε⁻¹) equals 2 Re tr_C(κ(v)yκ(w)̄^t y⁻¹). In particular ℓ(v)² is the rational expression and is twice the complex self-expression. D(A) is the determinant of the real rational Gram matrix, never of the complex Hermitian matrix.
Prerequisites: AbelianSchemesAndArithmeticModuli:A2/rosati-involution, AbelianSchemesAndArithmeticModuli:A6/rosati-positivity, AbelianSchemesAndArithmeticModuli:A6/characteristic-polynomial-on-tate-module, AbelianSchemesAndArithmeticModuli:A5
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:I0/entry-c-bounds (3B)
The actual polarized abelian variety, rational Rosati form and arithmetic period interfaces are prerequisites.
Lemma: Let g≥1, 0<δ≤1 and τ=x+iy∈H_g be a period of a principally polarized complex A in a symplectic integral basis. Put D_y=diag(y_1,…,y_g), y_i=y_ii, and require δD_y≤y≤δ⁻¹D_y, D_y≥δI and |x_ij|≤δ⁻¹. For v∈End(A) let ρ(v)=(a,−b;−c,d) be its signed integral representation and let ℓ be the rational Rosati length of 3A. Then |c_ij|≤C(g,δ)ℓ(v)/√(y_i y_j).
Prerequisites: 3A, 0G
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:I0/entry-a-bounds (3C)
The actual polarized abelian variety, rational Rosati form and arithmetic period interfaces are prerequisites.
Lemma: Let g≥1, 0<δ≤1 and τ=x+iy∈H_g be a period of a principally polarized complex A in a symplectic integral basis. Put D_y=diag(y_1,…,y_g), y_i=y_ii, and require δD_y≤y≤δ⁻¹D_y, D_y≥δI and |x_ij|≤δ⁻¹. For v∈End(A) let ρ(v)=(a,−b;−c,d) be its signed integral representation and let ℓ be the rational Rosati length of 3A. Then |a_ij|≤C(g,δ)√(y_i/y_j)ℓ(v).
Prerequisites: 3B, 3A
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:I0/entry-d-bounds (3D)
The actual polarized abelian variety, rational Rosati form and arithmetic period interfaces are prerequisites.
Lemma: Let g≥1, 0<δ≤1 and τ=x+iy∈H_g be a period of a principally polarized complex A in a symplectic integral basis. Put D_y=diag(y_1,…,y_g), y_i=y_ii, and require δD_y≤y≤δ⁻¹D_y, D_y≥δI and |x_ij|≤δ⁻¹. For v∈End(A) let ρ(v)=(a,−b;−c,d) be its signed integral representation and let ℓ be the rational Rosati length of 3A. Then |d_ij|≤C(g,δ)√(y_j/y_i)ℓ(v).
Prerequisites: 3B, 3C
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:I0/entry-b-bounds (3E)
The actual polarized abelian variety, rational Rosati form and arithmetic period interfaces are prerequisites.
Lemma: Let g≥1, 0<δ≤1 and τ=x+iy∈H_g be a period of a principally polarized complex A in a symplectic integral basis. Put D_y=diag(y_1,…,y_g), y_i=y_ii, and require δD_y≤y≤δ⁻¹D_y, D_y≥δI and |x_ij|≤δ⁻¹. For v∈End(A) let ρ(v)=(a,−b;−c,d) be its signed integral representation and let ℓ be the rational Rosati length of 3A. Then |b_ij|≤C(g,δ)√(y_i y_j)ℓ(v).
Prerequisites: 3D, 3C
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:I0/off-diagonal-extraction (3F)
The actual polarized abelian variety, rational Rosati form and arithmetic period interfaces are prerequisites.
Construction: For B=A×Ã let e,ẽ be the two factor projections as endomorphisms. The additive Z-linear operator v↦v#=e v ẽ+ẽ v e sends a block Hom matrix to (α,α̃)↦(f̃(α̃),f(α)), with zero diagonal blocks. Its Rosati length is ≤C_gℓ(v).
Prerequisites: AbelianSchemesAndArithmeticModuli:A6/hom-is-free-of-finite-rank, 3A
API TauCeti.NoJacobian.offDiagonal.apply: offDiagonal(v)(α,α̃)=(f̃(α̃),f(α)) in the source block decomposition.
API TauCeti.NoJacobian.offDiagonal.add: offDiagonal(v+w)=offDiagonal(v)+offDiagonal(w).
API TauCeti.NoJacobian.offDiagonal.idempotent: offDiagonal(offDiagonal(v))=offDiagonal(v).
API TauCeti.NoJacobian.offDiagonal.homComparison: The two off-diagonal entries are exactly the native product-Hom projections and not chosen maps.
Test TauCeti.NoJacobian.offDiagonal.identityZero (degenerate): offDiagonal(id_{A×Ã})=0.
Test TauCeti.NoJacobian.offDiagonal.alreadyOffDiagonal (characterisation): A block matrix with zero diagonal is unchanged.
Test TauCeti.NoJacobian.offDiagonal.sameFactorEndomorphism (non-example): An endomorphism acting only on A is sent to zero, not preserved.
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:I0/short-independent-family (3G)
The actual polarized abelian variety, rational Rosati form and arithmetic period interfaces are prerequisites.
Lemma: For E=End(A×Ã) of rank r≤(4g)² and rational Rosati discriminant D, there are Z-linearly independent v_1,…,v_r with ∏ℓ(v_i)≤C_g√D. Each nonzero integral endomorphism has ℓ≥1, hence max_iℓ(v_i)≤C_g√D.
Prerequisites: 3A, AbelianSchemesAndArithmeticModuli:A6/hom-is-free-of-finite-rank, Integral Lattices, Layer 2F (successive minima and Minkowski’s second theorem), Integral Lattices, Layer 2F (successive minima and Minkowski’s second theorem)
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:I0/controlled-length-isogeny (3H)
The actual polarized abelian variety, rational Rosati form and arithmetic period interfaces are prerequisites.
Theorem: There is c = c(g) such that for isogenous principally polarized A, Ã of dimension g there are isogenies f : A → Ã and f̃ : Ã → A such that v(α, α̃) = (f̃(α̃), f(α)) on A × Ã has ℓ(v) ≤ c D(A × Ã)^{1/2}; consequently (deg f)(deg f̃) = deg v ≤ ℓ(v)^{4g} (31).
Prerequisites: 3G, 3F, AbelianSchemesAndArithmeticModuli:A6/degree-is-a-polynomial-function, Mathlib MvPolynomial.eq_zero_of_eval_zero_at_prod_finset
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:I0/period-height (3I)
The actual polarized abelian variety, rational Rosati form and arithmetic period interfaces are prerequisites.
Theorem: Given g ≥ 1 and 0 < δ ≤ 1 there is C = C(g, δ) such that if τ = x + iy∈H_g represents principally polarized A in a symplectic integral basis, defined over a number field of degree at most D, satisfies y ≥ δy^{(0)} and y^{(0)} ≥ δι, then y_i ≤ C D max{1, h(A)} for i = 1, …, g.
Prerequisites: 0G, ArakelovGeometryAndAbelianHeights:R35.3, AutomorphicBundles:B4, AutomorphicBundles:B5
-/

/- 3J. AbelianVarietiesIsogenousToNoJacobian:I0/denominator-invertible: native declarations above. -/

/-! Layer 4: Galois genericity and arithmetic specialization (G0). -/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:G0/p-generic-isogeny (4A)
The genuine Tate-module, adelic genericity and arithmetic specialization interfaces are prerequisites.
Comparison: For a number-field principally polarized A of dimension g and a prime p, openness of its p-adic division-field image in GSp_{2g}(Z_p) is invariant under geometric isogeny and Galois conjugation. Extend fields to define the isogeny, use finite-index restrictions, and compare integral lattices up to commensurability; do not assert equality of integral images.
Prerequisites: ArithmeticGaloisRepresentations:R01.6, AbelianSchemesAndArithmeticModuli:A3
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:G0/p-to-adelic (4B)
The genuine Tate-module, adelic genericity and arithmetic specialization interfaces are prerequisites.
Theorem: For a principally polarized abelian variety of positive dimension over a number field, p-Galois genericity for a single prime p implies the Galois-generic property in Pink’s convention, using the precise adelic open-image theorem of Cadoret. No Mumford–Tate conjecture is assumed.
Prerequisites: ArithmeticGaloisRepresentations:R01.6, FaltingsFinitenessAndIsogenyTheorems:R28.4
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:G0/galois-to-hodge (4C)
The genuine Tate-module, adelic genericity and arithmetic specialization interfaces are prerequisites.
Theorem: For a principally polarized number-field A, Galois genericity implies MT(H_1(A,Q))=GSp_{2g}, hence Hodge genericity of its A_g-point. The implication uses the absolute-Hodge theorem for abelian varieties; End(A)=Z alone is not a substitute.
Prerequisites: 4B, ShimuraData:D1, ShimuraData:D4, ShimuraData:D5
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:G0/serre-open-image (4D)
The genuine Tate-module, adelic genericity and arithmetic specialization interfaces are prerequisites.
Theorem: Let A be a dimension-g principally polarized abelian variety over a number field, with geometric End(A)=Z. If g is odd or g∈{2,6}, A is p-Galois generic for every prime p. No corresponding inference is made for g=4.
Prerequisites: ArithmeticGaloisRepresentations:R01.6, FaltingsFinitenessAndIsogenyTheorems:R28.4
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:G0/universal-open-monodromy (4E)
The genuine Tate-module, adelic genericity and arithmetic specialization interfaces are prerequisites.
Theorem: For generic x of A^G and A_x in the projection of Ψ^{-1}(x), defined over a finite extension k_x of Q(x), the Galois group of k_x(A_x[p^∞])/k_x contains an open subgroup of Sp_{2g}(Z_p) (Deligne, Hodge II, Lemma 4.4.16), and is therefore open in GSp_{2g}(Z_p) by the Weil pairing.
Prerequisites: PELModuli:M2, PELModuli:M5, AbelianSchemesAndArithmeticModuli:A5, ArithmeticGaloisRepresentations:R01.6
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:G0/endomorphism-specialization (4F)
The genuine Tate-module, adelic genericity and arithmetic specialization interfaces are prerequisites.
Theorem: For the fixed arithmetic finite cover π:Ã⇢A_g and dominant generically finite parameter map Ψ:Ã⇢A^G used in the candidate setup, take the associated polarized family on a specified common regular finite-fibre domain, with generic geometric endomorphism ring Z. For every N≥2, the number of integral n∈[1,N]^G for which some regular projected fibre has geometric End≠Z is ≪N^{G−1}(log N)^µ, µ=µ(g), with constants depending on the fixed family. The fixed algebraic bad locus contributes O(N^{G−1}) separately. This is the source-scoped application of Masser [23], not an assertion for an arbitrary complex family.
Prerequisites: PELModuli:M5, AbelianSchemesAndArithmeticModuli:A6/hom-is-free-of-finite-rank
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:G0/frattini-specialization (4G)
The genuine Tate-module, adelic genericity and arithmetic specialization interfaces are prerequisites.
Lemma: For the open compact p-adic image G of the universal family, its Frattini subgroup Φ(G) is open. A specialized closed subgroup G_y with full image in G/Φ(G) equals G. Hilbert irreducibility excludes a thin set so that this full image holds outside it.
Prerequisites: 4E, InverseGaloisAndArithmeticFundamentalGroups:IG.2
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:G0/genericity-grid-count (4H)
The genuine Tate-module, adelic genericity and arithmetic specialization interfaces are prerequisites.
Theorem: For the fixed finite cover and generically finite parameter map, at most C[N^{G−1}(log N)^μ+N^{G−1/2}log N] integral n∈[1,N]^G have a projected fibre point which is not p-Galois generic, with fixed p and N≥2. If g is odd or g∈{2,6}, omit the half-saving term.
Prerequisites: 4G, 4F, 4D, Mathlib MvPolynomial.schwartz_zippel_totalDegree, InverseGaloisAndArithmeticFundamentalGroups:IG.2
-/

/-! Layer 5: Candidate families and large-isogeny estimates (C0). -/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:C0/fibre-field-bound (5A)
The genuine arithmetic moduli/model descent and quantitative isogeny interfaces are prerequisites.
Lemma: Let π:Ã⇢A_g and Ψ:Ã⇢A^G be dominant generically finite rational maps over number fields F̃,F_Ψ, with degree D_Ψ for Ψ. Outside a fixed algebraic exceptional locus, every projected fibre point over an integral n has a field of definition of degree ≤D=[F̃:Q][F_Ψ:Q]D_Ψ in the source’s moduli/model interpretation. Indeterminacy, nonfinite fibres and model descent are separate hypotheses.
Prerequisites: PELModuli:M2, PELModuli:M5, AlgebraicModuliForArithmeticGeometry:R09.1
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:C0/bounded-model-moduli (5B)
The genuine arithmetic moduli/model descent and quantitative isogeny interfaces are prerequisites.
Theorem: For a principally polarized abelian variety Ã over Q̄ with moduli point x ∈ A_g(Q̄) and field of moduli Q(x), there is a field of definition K̃ ⊇ Q(x) of Ã with [K̃ : Q(x)] ≤ c(g): lift x to the fine moduli space A_{g,3} of principally polarized abelian varieties with full level-3 structure and take the residue field of the lift.
Prerequisites: PELModuli:M2, PELModuli:M5, AbelianSchemesAndArithmeticModuli:A3
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:C0/dual-small-isogeny-correspondence (5C)
The genuine arithmetic moduli/model descent and quantitative isogeny interfaces are prerequisites.
Lemma: For principally polarized A,Ã and an isogeny f:A→Ã of degree m, identify the dual isogeny Ã∨→A∨ with an isogeny Ã→A of the same degree m using the principal polarizations. Thus A≅Ã/ker(f∨), without requiring f to preserve the polarizations.
Prerequisites: AbelianSchemesAndArithmeticModuli:A3, 1B
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:C0/small-isogeny-hypersurfaces (5D)
The genuine arithmetic moduli/model descent and quantitative isogeny interfaces are prerequisites.
Lemma: Fix an algebraic hypersurface H⊂A_g and integer M≥1. The points A with geometric End(A)=ℤ that are connected to H by an unpolarized isogeny of degree at most M lie in an algebraic hypersurface of degree at most C M^{2g} in the fixed parameter model. The constant depends on H, the cover, parameter map and embedding, and is independent of M and N. This target requires the correspondence-degree estimate as well as the subgroup count. End(A)=ℤ is needed to control the principal polarizations; all other points are included in the separate genericity exceptional set.
Prerequisites: 5C, 1B, AlgebraicModuliForArithmeticGeometry:R09.1, PELModuli:M5, 4C
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:C0/candidate-count (5E)
The genuine arithmetic moduli/model descent and quantitative isogeny interfaces are prerequisites.
Theorem: Fix the cover Ã, the parameter map Ψ, the hypersurface H and a prime p; p=2 is allowed. There is an exponent µ(g) such that, for all integers M≥1 and N≥2, the number of bad integral parameters n∈[1,N]^G is bounded by a fixed constant times N^{G−1}M^{2g}+N^{G−1}(log N)^µ+N^{G−1/2}log N. A parameter is bad when at least one projected point A_n of Ψ^{-1}(n) lacks a model over a field of degree ≤D from (1), admits an isogeny of degree ≤M to a point of H, or fails p-Galois genericity. The constant depends on the fixed cover, Ψ and H. In odd dimension, and in dimensions 2 and 6, the same bound holds after removing the final summand.
Prerequisites: 5A, 5D, 4H, Mathlib MvPolynomial.schwartz_zippel_totalDegree
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:C0/height-discriminant (5F)
The genuine arithmetic moduli/model descent and quantitative isogeny interfaces are prerequisites.
Lemma: For a candidate A=A_n and an isogenous Ã defined over a degree-D̃ field, with D̃≥2, D(A×Ã)≪max{D̃,log N+h(Ã)}^λ and max{1,h(A),h(Ã)}≪log N+log m̃ for the selected isogeny of degree m̃. The stable Faltings height may be negative.
Prerequisites: 3H, ArakelovGeometryAndAbelianHeights:R35.3, ArakelovGeometryAndAbelianHeights:R35.4
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:C0/isogeny-degree-height (5G)
The genuine arithmetic moduli/model descent and quantitative isogeny interfaces are prerequisites.
Lemma: For λ=λ(g)>0, the selected isogeny f:A_n→Ã has degree m̃≪max{D̃,log N}^{2gλ}. Constants depend only on the fixed family and H.
Prerequisites: 5F, 3H, Mathlib isLittleO_log_rpow_rpow_atTop
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:C0/log-threshold (5H)
The genuine arithmetic moduli/model descent and quantitative isogeny interfaces are prerequisites.
Lemma: Choose ν>2gλ and M=floor((log N)^ν). For sufficiently large N, a candidate avoiding all degree≤M isogenies but isogenous to Ã has (log N)^ν≪m̃≪D̃^{2gλ}.
Prerequisites: 5G, 5E
-/

/-! Layer 6: Fourier order, theta coordinates and explicit degree (T0). -/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:T0/fourier-order (6A)
The genuine Siegel-form, common theta multiplier, projective-degree and arithmetic descent interfaces are prerequisites.
Definition: For a nonzero Λ-form ϕ of nonnegative integer weight, g≥2, with Fourier expansion indexed by positive-semidefinite symmetric rational M satisfying dM half-integral, define ord(ϕ)=min{tr M:a(M)≠0}. Half-integral means integral diagonal and half-integral off-diagonal. The trace support is a discrete nonnegative subset of (1/d)Z. Extend ord(0)=+∞ explicitly.
Prerequisites: AutomorphicBundles:B4, AutomorphicBundles:B5, ShimuraVarieties:V2
API TauCeti.NoJacobian.fourierOrder.supportMinimum: For ϕ≠0, ord(ϕ) is attained and every nonzero coefficient has trace at least ord(ϕ).
API TauCeti.NoJacobian.fourierOrder.zero: ord(0)=+∞ in the extended nonnegative order carrier.
API TauCeti.NoJacobian.fourierOrder.scalar: For c∈C with c≠0, ord(cϕ)=ord(ϕ).
API TauCeti.NoJacobian.fourierOrder.vanishingCutoff: For ϕ≠0, all coefficients with tr M≤W vanish iff ord(ϕ)>W.
API TauCeti.NoJacobian.fourierOrder.expansionCompatibility: The coefficients are precisely the AutomorphicBundles Fourier coefficients in the same exp(πi tr(Mτ)) normalization; changing to 2πi rescales the index.
Test TauCeti.NoJacobian.fourierOrder.constant (computation): For a nonzero constant weight-zero form the order is 0.
Test TauCeti.NoJacobian.fourierOrder.zeroForm (degenerate): The zero form has order +∞ and is excluded from finite order bounds.
Test TauCeti.NoJacobian.fourierOrder.cutoffEquality (non-example): If the first nonzero trace is W, the assertion that every coefficient with trace≤W vanishes is false.
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:T0/order-superadditive (6B)
The genuine Siegel-form, common theta multiplier, projective-degree and arithmetic descent interfaces are prerequisites.
Lemma: For nonzero compatible Λ-forms ϕ_1,ϕ_2, ord(ϕ_1ϕ_2)≥ord(ϕ_1)+ord(ϕ_2). No equality is required; cancellation at the lowest trace cannot reduce the order.
Prerequisites: 6A, AutomorphicBundles:B5
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:T0/norm-form (6C)
The genuine Siegel-form, common theta multiplier, projective-degree and arithmetic descent interfaces are prerequisites.
Construction: Let g≥2 and Λ◁Γ=Sp_{2g}(Z) have finite index n. For a Λ-form ϕ of weight k≥0 and representatives γ_1=1,…,γ_n, define Φ=∏_i ϕ(γ_iτ)/Δ(γ_i,τ)^k and Φ_1=∏_{i≥2}ϕ(γ_iτ)/Δ(γ_i,τ)^k. Then Φ is a Γ-form of weight nk and Φ_1 is a Λ-form of weight (n−1)k. For ϕ≠0 both are nonzero.
Prerequisites: AutomorphicBundles:B4, 6A
API TauCeti.NoJacobian.normForm.product: The norm equals the stated finite product of slash transforms.
API TauCeti.NoJacobian.normForm.weight: Its Γ weight is index(Λ) times the original weight.
API TauCeti.NoJacobian.normForm.factorization: Φ=ϕΦ_1 with Φ_1 analytic of weight (n−1)k.
API TauCeti.NoJacobian.normForm.representativeIndependent: Changing the coset representatives does not change Φ, by the Λ law and the cocycle.
API TauCeti.NoJacobian.normForm.slashCompatibility: Each factor is the imported left-action slash transform in the AutomorphicBundles convention.
Test TauCeti.NoJacobian.normForm.indexOne (degenerate): For Λ=Γ, Φ=ϕ and Φ_1=1.
Test TauCeti.NoJacobian.normForm.constantOne (computation): The norm of the weight-zero constant form 1 is 1.
Test TauCeti.NoJacobian.normForm.wrongWeight (non-example): For n>1 and k>0 the norm has weight nk, not k.
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:T0/igusa-order-bound (6D)
The genuine Siegel-form, common theta multiplier, projective-degree and arithmetic descent interfaces are prerequisites.
Theorem: A nonzero Γ-form of weight k has ord ≤ κ_g k/(4π), with κ_g ≤ (2g/√3)c_g for the Minkowski constant c_g ≤ (4/π)^g Γ((g+1)/2)² (3/2)^{(g−1)(g−2)} (Igusa [18, Th. 7 p. 206, p. 197]; Lekkerkerker [22, p. 63]). Here g≥2, k≥0 and the form is nonzero; Γ((g+1)/2) in the constant is the Euler gamma function, not the symplectic group.
Prerequisites: 6A, AutomorphicBundles:B4, AutomorphicBundles:B5, 0F
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:T0/finite-level-order-bound (6E)
The genuine Siegel-form, common theta multiplier, projective-degree and arithmetic descent interfaces are prerequisites.
Theorem: Let g≥2, k≥0 be an integer and Λ◁Γ=Sp_{2g}(Z) have finite index n=[Γ:Λ]. A nonzero Λ-form ϕ of weight k satisfies ord(ϕ)≤κ_g n k/(4π), with Fourier order and κ_g as in the preceding milestones.
Prerequisites: 6C, 6B, 6D
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:T0/theta-constants (6F)
The genuine Siegel-form, common theta multiplier, projective-degree and arithmetic descent interfaces are prerequisites.
Definition: For symmetric τ∈H_g and real row characteristics m,m*, define θ_{m,m*}(τ)=∑_{h∈Z^g}exp(πi(h+m)τ(h+m)^t+2πi(h+m)m*^t). For positive even integer e, define Γ(e,2e)={γ=(a,b;c,d)∈Sp_{2g}(Z):γ≡I mod e, diag(ab^t)≡diag(cd^t)≡0 mod 2e}. Equivalently use diag(a^tc),diag(b^td) in the second condition. The blocks here have the usual symplectic signs, independent of the signed endomorphism convention. Use the theta family θ_{m,0}(eτ), with m∈e⁻¹Z^g/Z^g and canonical representatives. For the projective model require 8|e and e a square.
Prerequisites: ShimuraData:D5, AutomorphicBundles:B4, AutomorphicBundles:B5, AbelianSchemesAndArithmeticModuli:A5
API TauCeti.NoJacobian.thetaConstant.series: The theta constant is the normally convergent series in the displayed row-vector convention.
API TauCeti.NoJacobian.thetaConstant.shiftFirst: θ_{m+k,m*}=θ_{m,m*} for k∈Z^g by reindexing.
API TauCeti.NoJacobian.thetaConstant.shiftSecond: θ_{m,m*+k}=exp(2πi m k^t)θ_{m,m*} for k∈Z^g.
API TauCeti.NoJacobian.thetaConstant.squaredWeight: θ_{m,0}(eτ)² is a Γ(e,2e)-form of weight 1 with half-integral Fourier denominator d=e.
API TauCeti.NoJacobian.thetaConstant.analyticCompatibility: Its holomorphy and slash law are statements in the imported Siegel/AutomorphicBundles types, not a private analytic carrier.
API TauCeti.NoJacobian.thetaLevel.mem_iff: A symplectic integer matrix belongs to Γ(e,2e) iff it is I mod e and both diag(ab^t),diag(cd^t) vanish mod 2e.
API TauCeti.NoJacobian.thetaLevel.subgroup: The congruence conditions define a subgroup of Sp_{2g}(Z); for positive even e it is normal and has finite index.
API TauCeti.NoJacobian.thetaLevel.inclusions: Γ(2e)⊆Γ(e,2e)⊆Γ(e), with every level positive.
API TauCeti.NoJacobian.thetaLevel.transposeCompatibility: The diagonal conditions are equivalent to diag(a^tc),diag(b^td)≡0 mod 2e, in the same principal-congruence subgroup.
Test TauCeti.NoJacobian.thetaConstant.zeroCharacteristicImaginary (computation): θ_{0,0}(it I_g) is positive real for t>0.
Test TauCeti.NoJacobian.thetaConstant.oddElliptic (degenerate): For g=1, θ_{1/2,1/2}(τ)=0 by the odd-characteristic cancellation.
Test TauCeti.NoJacobian.thetaConstant.secondShiftPhase (non-example): For m=1/2 in genus one, shifting m* by 1 multiplies the value by −1 and is not ordinary periodicity.
Test TauCeti.NoJacobian.thetaLevel.identity (degenerate): The identity belongs to Γ(e,2e) for every positive even e.
Test TauCeti.NoJacobian.thetaLevel.principalDoubleLevel (compatibility): Every matrix congruent to I mod 2e satisfies both diagonal conditions and lies in Γ(e,2e).
Test TauCeti.NoJacobian.thetaLevel.ellipticShear (non-example): For g=1 and positive even e, the shear (1,e;0,1) lies in Γ(e) but not Γ(e,2e), since diag(ab^t)=e is not zero mod 2e.
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:T0/theta-linear-combinations (6G)
The genuine Siegel-form, common theta multiplier, projective-degree and arithmetic descent interfaces are prerequisites.
Lemma: For the specified positive even level e, the theta constants θ_{m,0}(eτ) have the common multiplier needed so that every complex linear combination χ has χ² a Γ(e,2e)-form of weight 1, with Fourier denominator e. For the geometric application use e=16.
Prerequisites: 6F, AutomorphicBundles:B4
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:T0/fourier-index-count (6H)
The genuine Siegel-form, common theta multiplier, projective-degree and arithmetic descent interfaces are prerequisites.
Lemma: For W≥0 and e≥1, the number of positive-semidefinite symmetric rational g×g matrices M with eM half-integral and tr M≤W is at most (4eW+1)^G, where G=g(g+1)/2. Use the real bound as stated, or its correctly rounded integer version.
Prerequisites: 6F, Mathlib Matrix.PosSemidef
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:T0/theta-coefficient-kernel (6I)
The genuine Siegel-form, common theta multiplier, projective-degree and arithmetic descent interfaces are prerequisites.
Theorem: Let χ₁,…,χ_{G+2} be complex linear combinations of θ_{m,0}(eτ), let W≥0 be real and D≥0 an integer. If (D+1)^{G+1}>(G+1)!(4eW+1)^G, there is a nonzero homogeneous P∈ℂ[X₁,…,X_{G+2}] of degree D for which every Fourier coefficient of ϕ=P(χ₁²,…,χ_{G+2}²) with tr M≤W vanishes. Thus ϕ≠0 implies ord(ϕ)>W. The strict inequality is the conclusion required in the next milestone; vanishing of all coefficients with trace at most W proves it directly.
Prerequisites: 6H, 6G, 6A
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:T0/theta-relation-vanishing (6J)
The genuine Siegel-form, common theta multiplier, projective-degree and arithmetic descent interfaces are prerequisites.
Lemma: Let n=[Γ:Γ(e,2e)] and β=κ_g n/(4π). If (D+1)^{G+1}>(G+1)!(4eβD+1)^G, the relation from the coefficient-kernel theorem with W=βD satisfies P(χ_1²,…,χ_{G+2}²)=0 identically. Its degree in the unsquared χ variables is 2D.
Prerequisites: 6I, 6E
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:T0/theta-projective-model (6K)
The genuine Siegel-form, common theta multiplier, projective-degree and arithmetic descent interfaces are prerequisites.
Construction: For e=16, form the quasi-projective image V_e of H_g under [θ_{m,0}(eτ)]_m and its irreducible projective closure. Its complex analytic quotient is the quotient of H_g by Γ(e,2e) in the exact source level interpretation. Its Q-coordinate model and Q-defined forgetful morphism to A_g require the arithmetic descent theorem, independently of any universal full-torsion family.
Prerequisites: 6F, PELModuli:M5, ShimuraVarieties:V2, AlgebraicModuliForArithmeticGeometry:R09.1
API TauCeti.NoJacobian.thetaModel.coordinateMap: The coordinate map uses the family θ_{m,0}(16τ) in projective space.
API TauCeti.NoJacobian.thetaModel.dimension: dim V_16=G.
API TauCeti.NoJacobian.thetaModel.quotientComparison: The complex quotient comparison preserves the source’s exact congruence subgroup and coordinate ratios.
API TauCeti.NoJacobian.thetaModel.forgetful: The arithmetic theta model has its proved algebraic forgetful map to the PEL A_g.
API TauCeti.NoJacobian.thetaModel.levelDistinction: A full arithmetic symplectic-level model with universal scheme requires a separately proved comparison; it is not this coordinate model by definition.
Test TauCeti.NoJacobian.thetaModel.realThetaRatios (computation): At τ=iI_g the defined theta ratios are positive real.
Test TauCeti.NoJacobian.thetaModel.projectiveScaling (characterisation): A common nonzero scalar on all theta coordinates leaves the projective point unchanged.
Test TauCeti.NoJacobian.thetaModel.torsionField (non-example): The coordinate field and projective degree alone do not split A[16].
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:T0/generic-projection-degree (6L)
The genuine Siegel-form, common theta multiplier, projective-degree and arithmetic descent interfaces are prerequisites.
Theorem: Let V ⊂ P^r_C be an irreducible projective variety of dimension G < r. For generic linear forms χ_1, …, χ_{G+2}, the projection V ⇢ P^{G+1} is birational onto a hypersurface of degree deg V, so if the image lies in the zero set of a nonzero homogeneous polynomial of degree δ, then deg V ≤ δ. A generically finite projection V ⇢ P^G has degree at most deg V.
Prerequisites: AlgebraicModuliForArithmeticGeometry:R09.1, AlgebraicModuliForArithmeticGeometry:R09.2
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:T0/theta-numerical-degree (6M)
The genuine Siegel-form, common theta multiplier, projective-degree and arithmetic descent interfaces are prerequisites.
Theorem: For g≥2 and G=g(g+1)/2, deg V̄_16≤2(G+1)!((32g/(π√3))512^{2g²}c_g)^G≤2^{16g^4−1}, with c_g bounded by the source gamma/Minkowski expression. The index bound is [Γ:Γ(e,2e)]≤e^{2g²}(2e)^{2g²}.
Prerequisites: 6K, 6J, 6L, 6D
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:T0/theta-degree-map (6N)
The genuine Siegel-form, common theta multiplier, projective-degree and arithmetic descent interfaces are prerequisites.
Construction: Choose a suitable subset of θ_{m,0}(16τ)/θ_{0,0}(16τ) as a dominant generically finite rational map Ψ:V_16⇢A^G. On its regular nonempty domain D_Ψ≤deg V̄_16≤2^{16g^4−1}. The source arithmetic descent gives F_Ψ=F̃=Q; the main bound can be enlarged to 2^{16g^4}. This statement contains no rational 16-torsion clause.
Prerequisites: 6K, 6M, 6L
API TauCeti.NoJacobian.thetaParameter.genericDegree: The generic degree is at most 2^{16g^4−1}.
API TauCeti.NoJacobian.thetaParameter.regularDomain: The coordinate ratios define a rational map on a nonempty open where denominators and finite-fibre conditions hold.
API TauCeti.NoJacobian.thetaParameter.fieldFormula: D=[F̃:Q][F_Ψ:Q]D_Ψ with the actual forgetful and parameter fields.
API TauCeti.NoJacobian.thetaParameter.projectionComparison: The degree bound is the generic linear/coordinate projection degree of the same projective theta model.
Test TauCeti.NoJacobian.thetaParameter.degreeVersusTorsion (non-example): A projective-degree estimate is not a bound for a torsion splitting extension.
Test TauCeti.NoJacobian.thetaParameter.quadraticAllowance (computation): If D_Ψ≤2^{16g^4−1}, then 2D_Ψ≤2^{16g^4}.
Test TauCeti.NoJacobian.thetaParameter.zeroDenominator (degenerate): A ratio with θ_{0,0}=0 lies outside that chart; it is not assigned an artificial parameter value.
-/

/-! Layer 7: Projected blocks and quantitative avoidance (C1). -/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:C1/correspondence-definability (7A)
The genuine uniform Pila-block, weakly-special image and arithmetic moduli interfaces are prerequisites.
Lemma: If restricted J on F_g is definable and H is algebraic, Z=F_g∩J⁻¹(H) and the family W_τ(Z), with τ as a real parameter, are definable. On det(cτ+d)≠0 the projection π_τ(X)=(aτ+b)(cτ+d)⁻¹ is semialgebraic.
Prerequisites: 0I, 0E, LogicAndDefinabilityInNumberTheory:LD.6
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:C1/galois-period-height (7B)
The genuine uniform Pila-block, weakly-special image and arithmetic moduli interfaces are prerequisites.
Lemma: For the Galois conjugates Ã^σ fixing the fields of A and H, choose controlled-length isogenies and F_g period representatives. Their signed rational blocks ρ_σ are integral, project to τ̃_σ∈Z, and have sup norm ≤C D̃^λ after enlarging λ≥4.
Prerequisites: 3J, 3B, 3C, 3D, 3E, 3I, 5F, 5H, 0I
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:C1/hodge-generic-zero-images (7C)
The genuine uniform Pila-block, weakly-special image and arithmetic moduli interfaces are prerequisites.
Lemma: Every Pila block B containing a relevant integral ρ_σ has zero-dimensional connected image π_τ(B). A positive-dimensional image would give a positive-dimensional weakly-special K⊂H through the Hodge-generic Ã^σ, contradicting the point-or-whole-A_g dichotomy.
Prerequisites: 7A, 4A, 4C, LogicAndDefinabilityInNumberTheory:LD.6, ShimuraData:D4, ShimuraData:D5
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:C1/orbit-degree-collapse (7D)
The genuine uniform Pila-block, weakly-special image and arithmetic moduli interfaces are prerequisites.
Lemma: Take a model field K̃ with [K̃:Q(x̃)]≤c(g) and D̃=max(2,[K̃:Q]). Distinct periods of conjugates fixing the fixed fields have cardinality ≥c′D̃. Uniform point-block counting and T≤C D̃^λ give D̃≤C_ε D̃^{λε}; choose 0<ε<1/λ to conclude D̃≤C.
Prerequisites: 5B, 7B, 7C, LogicAndDefinabilityInNumberTheory:LD.6
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:C1/counting-theorem (7E)
The genuine uniform Pila-block, weakly-special image and arithmetic moduli interfaces are prerequisites.
Theorem: Fix g≥2, a cover Ã⇢A_g, a parameter map Ψ:Ã⇢A^G and an algebraic hypersurface H⊂A_g. Both maps are dominant and generically finite, with specified nonempty regular domains. Write D=[F̃:Q][F_Ψ:Q]D_Ψ as in (1). For each γ<1/2 there is a constant C(Ã,Ψ,H,γ) such that, for every integer N≥1, at most C N^{G−γ} integral parameters n∈[1,N]^G are exceptional. Outside this exceptional set, every projected point in the regular fibre Ψ^{-1}(n) has a model over a field of degree ≤D, is Galois generic and is geometrically isogenous to no point of H. Thus genericity is Galois genericity, which implies Hodge genericity. When g is odd or g∈{2,6}, the exponent may be any γ<1. There is a choice of Ã and Ψ over Q for which the field-degree allowance is 2^{16g⁴}. An exceptional fibre is one with at least one failing projected point.
Prerequisites: 5E, 5H, 7D, 4B, 4C, Mathlib isLittleO_log_rpow_rpow_atTop, 6N
-/

/-! Layer 8: Arithmetic consequences and the Schottky application (A0). -/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:A0/hypersurface-avoidance (8A)
The genuine arithmetic Siegel moduli, avoidance and model-degree interfaces are prerequisites.
Theorem: For each g≥2 and proper algebraic hypersurface H⊂A_g, one can find a number field K and a Hodge-generic principally polarized g-dimensional abelian variety A/K satisfying [K:Q]≤2^{16g⁴}. No abelian variety represented by a point of H is geometrically isogenous to A.
Prerequisites: 7E, 6N, 0H
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:A0/no-jacobian (8B)
The genuine arithmetic Siegel moduli, avoidance and model-degree interfaces are prerequisites.
Theorem: In each dimension g≥4 there is a number field K of degree [K:Q]≤2^{16g⁴} and a Hodge-generic principally polarized abelian variety A/K of dimension g whose geometric isogeny class contains no Jacobian. This excludes canonically principally polarized Jacobians of stable compact-type curves as well as smooth curves; the isogenies need not respect polarizations.
Prerequisites: 8A, 0D
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:A0/many-classes (8C)
The genuine arithmetic Siegel moduli, avoidance and model-degree interfaces are prerequisites.
Theorem: For every ε>0 there are C_0=C_0(Ψ,ε)>0 and N_0 such that for every N≥N_0, the regular projected points from Ψ^{-1}(n), n∈[1,N]^G, represent at least C_0^{-1}N^{G−ε} isogeny classes. Work on a fixed common nonempty open where Ψ is regular with finite fibres and the forgetful map π is finite, so the parameter-to-moduli multiplicity is uniformly bounded. The bad algebraic domain is discarded separately, not counted with finite multiplicity.
Prerequisites: 1B, 5A, ArakelovGeometryAndAbelianHeights:R35.3, 4H, 4C
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:A0/quadratic-approximation (8D)
The genuine arithmetic Siegel moduli, avoidance and model-degree interfaces are prerequisites.
Lemma: For every nonempty Euclidean open U⊆A_g(C), there is a Hodge-generic hypersurface-avoiding point in U with model degree≤2^{16g^4}. Lift a regular point to V_16, approximate its Ψ-image by ξ∈Q(i)^G and apply the counting theorem to Λ_d∘Ψ, where Λ_d(x)_j=1/[d(x_j−ξ_j)].
Prerequisites: 7E, 6N, PELModuli:M5
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:A0/avoid-finite-isogeny-classes (8E)
The genuine arithmetic Siegel moduli, avoidance and model-degree interfaces are prerequisites.
Lemma: Each nonempty Euclidean open contains bounded-degree Hodge-generic hypersurface-avoiding points outside any prescribed finite set of isogeny classes.
Prerequisites: 8D, 8C, 7E
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:A0/dense-independent-set (8F)
The genuine arithmetic Siegel moduli, avoidance and model-degree interfaces are prerequisites.
Theorem: For g≥4, choose a Euclidean dense subset S⊂A_g(C) consisting of principally polarized abelian varieties with model fields of degree ≤2^{16g⁴}. The choices can be made so that distinct members of S have distinct geometric isogeny classes, and none of these classes contains a Jacobian.
Prerequisites: 8B, 8E
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:A0/unirational-count (8G)
The genuine arithmetic Siegel moduli, avoidance and model-degree interfaces are prerequisites.
Theorem: Let g∈{2,3,4,5} and fix a dominant rational parametrization Ξ:A^G⇢A_g over Q. For a fixed hypersurface H⊂A_g and γ<1/2, a constant C(Ξ,H,γ) bounds the exceptional integral parameters in every box [1,N]^G, N≥1, by C N^{G−γ}. Every nonexceptional parameter has a Q-defined, Hodge-generic image whose geometric isogeny class avoids H; undefined images belong to the exceptional set. For g∈{2,3,5} the bound permits every γ<1.
Prerequisites: 5E, 7D, 4C
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:A0/rational-fourfold (8H)
The genuine arithmetic Siegel moduli, avoidance and model-degree interfaces are prerequisites.
Theorem: Assuming a Q-defined unirational parametrization of A_4, one can choose a Hodge-generic principally polarized four-dimensional abelian variety over Q whose geometric isogeny class contains no Jacobian.
Prerequisites: 8G, 0D
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:A0/bounded-cm-count (8I)
The genuine arithmetic Siegel moduli, avoidance and model-degree interfaces are prerequisites.
Theorem: For a fixed arithmetic family with a uniform bound on its model-field degrees, the number of distinct CM moduli points in A_g is bounded independently of N, assuming the quantitative CM orbit lower bound and bounded-discriminant finiteness. To bound parameter tuples, also restrict to a fixed common open where Ψ has finite fibres and π is finite; exceptional positive-dimensional fibres are excluded. The 2012 orbit-bound route is unconditional for 1≤g≤6 and assumes GRH for larger g. An unconditional all-genus route requires the averaged-Colmez/Tsimerman quantitative input from Complex Multiplication and Explicit Reciprocity, Part II; qualitative reciprocity alone does not provide it.
Prerequisites: 5A, ComplexMultiplicationAndExplicitReciprocity:CM.0, ComplexMultiplicationAndExplicitReciprocity:CM.2
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:A0/igusa-schottky (8J)
The genuine arithmetic Siegel moduli, avoidance and model-degree interfaces are prerequisites.
Theorem: F_g(τ) = 2^g U_g(τ) − V_g(τ)² with U_g = Σ θ_{mm*}(τ)^{16}, V_g = Σ θ_{mm*}(τ)^8 over m, m* ∈ 2^{-1}Z^g/Z^g is a Γ-form of weight 8; it vanishes identically on A_g for 1≤g≤3, and for g = 4 its zero locus is the closure of the Jacobian locus (Grushevsky [16, Th. 3.8]).
Prerequisites: 6F, AutomorphicBundles:B4, 0C
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:A0/theta-product-factorization (8K)
The genuine arithmetic Siegel moduli, avoidance and model-degree interfaces are prerequisites.
Lemma: For block-diagonal τ=diag(τ′,τ″), θ_{m,m*}(τ) factors as the product of the two block theta constants. Hence U_{g′+g″}=U_{g′}U_{g″} and V_{g′+g″}=V_{g′}V_{g″} in the source’s sixteenth/eighth-power sums.
Prerequisites: 6F
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:A0/products-in-torelli-closure (8L)
The genuine arithmetic Siegel moduli, avoidance and model-degree interfaces are prerequisites.
Theorem: For block-diagonal τ, U_g and V_g factor as products; hence F_4 vanishes on products of two principally polarized abelian surfaces and on products of an elliptic curve with a principally polarized abelian threefold, which therefore lie in the closure of the Jacobian locus of A_4.
Prerequisites: 8J, 8K
-/

/-! Layer 9: Newton interpolation within isogeny classes (X0). -/

/- 9A. AbelianVarietiesIsogenousToNoJacobian:X0/newton-series: native declarations above. -/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:X0/coefficient-envelope (9B)
The genuine elliptic/Siegel uniformization and geometric isogeny interfaces are prerequisites.
Lemma: For any injective real sequence t_n∈[1,2], there are positive ε_n such that |a_n|≤ε_n for every n implies the coefficient envelope of 9A. Choosing target values s_n so that the triangular Newton coefficient a_n lies in that disk gives F(t_n)=s_n.
Prerequisites: 9A
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:X0/elliptic-period-selection (9C)
The genuine elliptic/Siegel uniformization and geometric isogeny interfaces are prerequisites.
Lemma: Enumerate algebraic j-invariants and choose representative periods. Positive rational scaling and rational translation preserve elliptic isogeny classes. They allow distinct imaginary parts t_n∈[1,2] and real parts s_n that meet each successive Newton coefficient tolerance.
Prerequisites: 9B, ModularCurvesPartII:R12.1
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:X0/elliptic-interpolation-image (9D)
The genuine elliptic/Siegel uniformization and geometric isogeny interfaces are prerequisites.
Construction: The image Z={j(F(y)+iy):1≤y≤2}, with the coefficient-tolerant F from the elliptic selection, is compact and real-analytically parametrized, has |j|≤2079+e^{4π}, and meets every algebraic elliptic isogeny class. By the real-curve avoidance theorem it is not contained in any real algebraic curve. No embeddedness assertion is made.
Prerequisites: 9C, 9A, 2I, ModularCurvesPartII:R12.1
API TauCeti.NoJacobian.ellipticInterpolationImage.image: Z is the image of [1,2] under y↦j(F(y)+iy).
API TauCeti.NoJacobian.ellipticInterpolationImage.compact: Z is compact in C.
API TauCeti.NoJacobian.ellipticInterpolationImage.meetsClass: Every elliptic curve over Q̄ is isogenous to a curve with j∈Z.
API TauCeti.NoJacobian.ellipticInterpolationImage.periodCompatibility: Its isogeny relation is the imported rational lattice relation, not a private equivalence on j-values.
Test TauCeti.NoJacobian.ellipticInterpolationImage.imaginaryBounds (computation): Every period used has imaginary part between 1 and 2.
Test TauCeti.NoJacobian.ellipticInterpolationImage.algebraicCurve (non-example): Z cannot be contained in a real algebraic curve.
Test TauCeti.NoJacobian.ellipticInterpolationImage.complexContinuation (degenerate): The positivity assertion concerns real y∈[1,2]; arbitrary complex parameters are not asserted to lie in H_1.
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:X0/symplectic-dense-selection (9E)
The genuine elliptic/Siegel uniformization and geometric isogeny interfaces are prerequisites.
Lemma: The action of Sp_{2g}(Q) on H_g has dense orbit through every τ, and each rational symplectic translate represents an isogenous principally polarized abelian variety. Thus each enumerated algebraic class can meet a prescribed nonempty period neighbourhood.
Prerequisites: ShimuraData:D5, AbelianSchemesAndArithmeticModuli:A5
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:X0/matrix-interpolation-image (9F)
The genuine elliptic/Siegel uniformization and geometric isogeny interfaces are prerequisites.
Construction: For g≥2, choose distinct interpolation parameters t_n∈[1,2] and representatives τ_n of all algebraic moduli points, modified by Sp_{2g}(ℚ) within their isogeny classes. Newton interpolation constructs matrices F_x,F_w of entire functions, real on the real line, with F_x(t_n)=x_n and F_w(t_n)=w_n, such that F(t)=F_x(t)+i(I+F_w(t)F_w(t)^t) lies in H_g for real t∈[1,2]. Its compact real-analytic parametrized image K=J(F([1,2])) meets every isogeny class represented by A_g(ℚ̄). No embedded-curve or global closed analytic hypersurface assertion is part of this construction.
Prerequisites: 9A, 9B, 9E, Tau Ceti TauCeti.cholesky, Tau Ceti TauCeti.continuous_cholesky, Mathlib Matrix.PosDef.one, Mathlib Matrix.PosDef.add_posSemidef, Mathlib Matrix.posSemidef_self_mul_conjTranspose, PELModuli:M5, AbelianSchemesAndArithmeticModuli:A5
API TauCeti.NoJacobian.matrixInterpolationImage.interpolation: F_x(t_n)=x_n and F_w(t_n)=w_n entrywise.
API TauCeti.NoJacobian.matrixInterpolationImage.symmetricRealPart: F_x(t) is real symmetric for real t.
API TauCeti.NoJacobian.matrixInterpolationImage.positiveImaginaryPart: I+F_w(t)F_w(t)^t is positive definite for real t, by the native Gram-matrix positivity API.
API TauCeti.NoJacobian.matrixInterpolationImage.compactImage: K=J(F([1,2])) is compact.
API TauCeti.NoJacobian.matrixInterpolationImage.meetsClass: Each algebraic A_g isogeny class meets K.
API TauCeti.NoJacobian.matrixInterpolationImage.choleskyCompatibility: The factor for each selected positive-definite y−I is the existing TauCeti.cholesky, whose continuity preserves the source tolerance.
Test TauCeti.NoJacobian.matrixInterpolationImage.zeroFactor (degenerate): At w=0 the imaginary part is I, still positive definite.
Test TauCeti.NoJacobian.matrixInterpolationImage.energyIdentity (computation): For real v≠0, v^t(I+ww^t)v=‖v‖²+‖w^t v‖²>0.
Test TauCeti.NoJacobian.matrixInterpolationImage.closedComplexHypersurface (non-example): Compactness and real-analytic parametrization of K do not make it a globally closed complex analytic hypersurface.
-/

/-! Layer 10: The full sixteen-torsion comparison problem (T1). -/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:T1/arithmetic-comparison-cover (10A)
The arithmetic fine-level comparison is a separate construction; its bounded-degree existence is not asserted.
Construction: The required arithmetic comparison consists of a finite cover π:Y→V₁₆ over a specified number field, a universal principally polarized abelian scheme on Y, and a full symplectic or similitude sixteen-level trivialization with its exact cyclotomic-component convention. Include an analytification comparison with the theta quotient that preserves both polarization and level. The coefficient fields and generic comparison degree are data of the construction. Obtaining such data with the numerical bound needed in 10D is an existence problem, not a consequence of the complex analytic level alone.
Prerequisites: 6K, PELModuli:M2, PELModuli:M5, AbelianSchemesAndArithmeticModuli:A3, AbelianSchemesAndArithmeticModuli:A5
API TauCeti.NoJacobian.arithmeticComparisonCover.projection: Y has its finite comparison map to the theta coordinate model.
API TauCeti.NoJacobian.arithmeticComparisonCover.universalFamily: The pullback of the PEL universal polarized scheme carries the specified complete level trivialization.
API TauCeti.NoJacobian.arithmeticComparisonCover.degree: The coefficient fields and generic comparison-cover degree are explicit.
API TauCeti.NoJacobian.arithmeticComparisonCover.analyticComparison: Its analytification comparison preserves polarization and the exact congruence-level interpretation.
Test TauCeti.NoJacobian.arithmeticComparisonCover.realBase (non-example): A real residue field cannot carry a principally polarized family with all sixteen-torsion rational.
Test TauCeti.NoJacobian.arithmeticComparisonCover.cyclotomicOnly (non-example): Containing ζ_16 does not itself trivialize the entire Galois module.
Test TauCeti.NoJacobian.arithmeticComparisonCover.degreeOne (degenerate): Even a geometrically degree-one comparison needs proof of its arithmetic descent field.
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:T1/rational-torsion-cyclotomic (10B)
The arithmetic fine-level comparison is a separate construction; its bounded-degree existence is not asserted.
Lemma: Let (A,λ)/K be principally polarized of dimension g≥1 in characteristic zero. If all A[16](K̄) are K-rational, then μ_16⊆K: choose an exact-order-16 point and use perfection of the alternating Weil pairing to find a partner pairing to a primitive sixteenth root.
Prerequisites: AbelianSchemesAndArithmeticModuli:A3, ArithmeticGaloisRepresentations:R01.6, Mathlib NumberField.InfinitePlace.IsPrimitiveRoot.nrRealPlaces_eq_zero_of_two_lt
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:T1/full-degree-bookkeeping (10C)
The arithmetic fine-level comparison is a separate construction; its bounded-degree existence is not asserted.
Lemma: For a proved comparison cover Y and Ψ_Y=Ψ∘π, use D(Y,Ψ_Y)=[F_Y:Q][F_{Ψ_Y}:Q]D_{Ψ_Y}, including the comparison degree. Alternatively for a residue-field tower K_θ⊆K_A⊆K_cyc=K_A(ζ_16)⊆K_tor, [K_tor:Q] is the product of all four successive degrees and [K_cyc:K_A]≤8. The two descriptions must not count the same extension twice.
Prerequisites: 10A, 10B, 6N
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:T1/supplementary-torsion-target (10D)
The arithmetic fine-level comparison is a separate construction; its bounded-degree existence is not asserted.
Theorem: Research problem, for g≥2: find a principally polarized hypersurface-avoiding A/K with [K:ℚ]≤2^{16g⁴} and all A[16](K̄) rational over K. A solution must prove the arithmetic comparison of 10A and its complete degree estimate in 10C. Describing the complex quotient by Γ(16,32) or defining its theta ratios over ℚ does not establish this stronger conclusion. This problem is separate from Masser–Zannier Theorem 1.1.
Prerequisites: 8A, 10A, 10C
-/

/-! Layer 11: Global analytic obstructions and a local existence problem (X1). -/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:X1/satake-dimension-obstruction (11A)
The genuine singular analytic-space, Satake and local-equation interfaces are prerequisites; local existence is a research problem.
Lemma: For g≥2 and G=g(g+1)/2, the projective Siegel Satake boundary has dimension G−g and every pure analytic hypersurface in the open A_g has local dimension G−1>G−g. At g=1 the inequality becomes equality and this obstruction argument does not apply.
Prerequisites: ShimuraCompactifications:C5, ShimuraVarieties:V2
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:X1/closed-hypersurface-algebraic (11B)
The genuine singular analytic-space, Satake and local-equation interfaces are prerequisites; local existence is a research problem.
Theorem: For g≥2, every globally closed pure analytic hypersurface W⊂A_g(C) is algebraic. Its closure in the projective Satake compactification is analytic by the singular-space Remmert–Stein extension across the lower-dimensional boundary, then algebraic by Chow; restriction returns W because W is closed in A_g.
Prerequisites: 11A, ComplexComparisonPartII:C0, ComplexComparisonPartII:C4
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:X1/no-global-interpolation-hypersurface (11C)
The genuine singular analytic-space, Satake and local-equation interfaces are prerequisites; local existence is a research problem.
Theorem: For g≥2, no globally closed pure analytic hypersurface W⊂A_g(ℂ) meets every isogeny class represented by A_g(ℚ̄). Indeed 11B makes W algebraic, and 8A gives an algebraic point whose whole isogeny class avoids W. In particular the compact class-covering image K of 9F cannot lie in such a hypersurface.
Prerequisites: 11B, 8A, 9F
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:X1/local-hypersurface-specification (11D)
The genuine singular analytic-space, Satake and local-equation interfaces are prerequisites; local existence is a research problem.
Definition: A local replacement consists of an explicitly chosen open U⊆A_g(C) containing K and a pure codimension-one analytic subset W_U closed relative to U, containing K. Local defining equations must be defined on specified domains and have proved compatibility/extensions on overlaps. A germwise or nonclosed replacement has its own separately stated conclusion; no existence is supplied by this specification.
Prerequisites: ComplexComparisonPartII:C0, 9F
API TauCeti.NoJacobian.localHypersurfaceSpec.ambient: The specification exports an actual open U and the inclusion K⊆U.
API TauCeti.NoJacobian.localHypersurfaceSpec.relativeClosed: W_U is closed as an analytic subset of U, not asserted closed in all A_g.
API TauCeti.NoJacobian.localHypersurfaceSpec.contains: K⊆W_U.
API TauCeti.NoJacobian.localHypersurfaceSpec.overlap: The specified local analytic ideals/equations restrict compatibly on every stated overlap.
Test TauCeti.NoJacobian.localHypersurfaceSpec.genusTwoGlobal (non-example): Taking U=A_2 would force a class-covering closed hypersurface to be algebraic and contradict avoidance.
Test TauCeti.NoJacobian.localHypersurfaceSpec.differentDomains (non-example): A finite product of functions on different open sets is not a global equation without compatible extensions.
Test TauCeti.NoJacobian.localHypersurfaceSpec.sameDomainProduct (compatibility): On a common domain, a finite product of holomorphic equations is holomorphic and its zero set is their union.
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:X1/local-replacement-target (11E)
The genuine singular analytic-space, Satake and local-equation interfaces are prerequisites; local existence is a research problem.
Construction: Research problem: construct an open U⊆A_g(ℂ) and a relatively closed pure codimension-one analytic subset W_U satisfying 11D for the compact image K, or formulate and prove a precise germwise or nonclosed alternative. A construction must give the domains of all equations and their overlap compatibility. A finite chart cover of K does not by itself extend those equations to a common domain, so the compactness argument does not prove existence.
Prerequisites: 11D
API TauCeti.NoJacobian.localReplacement.specification: A successful construction returns the actual specified U,W_U and containment of K.
API TauCeti.NoJacobian.localReplacement.equations: All equation domains and their compatibility proofs are identified.
API TauCeti.NoJacobian.localReplacement.analyticComparison: The constructed analytic subset uses the existing singular analytic-space supplier and not only smooth-chart functions.
Test TauCeti.NoJacobian.localReplacement.globalImpossible (non-example): A globally closed class-covering hypersurface in A_g is ruled out for g≥2.
Test TauCeti.NoJacobian.localReplacement.compactnessInsufficient (non-example): A finite cover of K by charts alone does not extend their equations to a common ambient domain.
Test TauCeti.NoJacobian.localReplacement.restriction (compatibility): A valid relative analytic hypersurface restricts to one on every smaller open containing the required part of K.
-/
