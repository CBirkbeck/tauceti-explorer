/-
This file is not the roadmap and is not exhaustive. The roadmap reader document
is definitive. These statements suggest Lean forms so that contributors and
reviewers converge on names and signatures. Every theorem/example is admitted,
and no implementation or closure is claimed.
-/
import Mathlib.LinearAlgebra.Matrix.NonsingularInverse
import Mathlib.Data.Matrix.Block
import Mathlib.Analysis.Complex.Basic
import Mathlib.Analysis.Calculus.Deriv.Basic
import Mathlib.Topology.Algebra.InfiniteSum.Basic
import Mathlib.Algebra.Polynomial.Eval.Defs

/-
Native typing guidance for DESIGN-AbelianVarietiesIsogenousToNoJacobian.
Only the three explicitly named native nodes are represented by declarations.
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

/- Omitted AbelianVarietiesIsogenousToNoJacobian:MZ0/jacobian-locus
The actual Siegel/PEL moduli, classical reduction or algebraic descent interfaces are open; no synthetic geometric carrier is used.
Planned definition: For g≥2, define T_g⊆A_g as the image of the smooth genus-g curve moduli stack under the canonical principally polarized relative Jacobian morphism. Take its reduced Zariski closure inside A_g, not inside a Satake compactification. Isogenies in the avoidance problem need not preserve polarizations.
Prerequisites: JacobianChallengePartII:JC1/relative-jacobian, JacobianChallengePartII:JC1/principal-polarization, StableReductionPartII:MC.2/pointed-dm-theorem, PELModuli:M5
API TauCeti.NoJacobian.torelliLocus.mem_iff: x∈T_g iff x is the canonically polarized Jacobian of a smooth genus-g curve over an algebraically closed field of characteristic zero.
API TauCeti.NoJacobian.torelliLocus.subset_closure: T_g⊆closure(T_g), with closure in A_g.
API TauCeti.NoJacobian.torelliLocus.baseChange: The relative Jacobian moduli morphism commutes with extension of characteristic-zero algebraically closed fields.
API TauCeti.NoJacobian.torelliLocus.jacobianComparison: For a single curve the relative Jacobian specializes to the JacobianChallenge Jacobian with its theta polarization.
Test TauCeti.NoJacobian.torelliLocus.genusTwoClosure (degenerate): The closure of T_2 is A_2; it is not a proper hypersurface.
Test TauCeti.NoJacobian.torelliLocus.genusFourDimension (computation): dim T_4=9 whereas dim A_4=10.
Test TauCeti.NoJacobian.torelliLocus.productBoundary (non-example): A product of two elliptic curves belongs to closure(T_2) and is not a smooth genus-two Jacobian with its product principal polarization.
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:MZ0/torelli-dimension
The actual Siegel/PEL moduli, classical reduction or algebraic descent interfaces are open; no synthetic geometric carrier is used.
Planned theorem: For g≥2 in characteristic zero, dim T_g=3g−3. In particular 3g−3<g(g+1)/2 for g≥4.
Prerequisites: AbelianVarietiesIsogenousToNoJacobian:MZ0/jacobian-locus
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:MZ0/compact-type-closure
The actual Siegel/PEL moduli, classical reduction or algebraic descent interfaces are open; no synthetic geometric carrier is used.
Planned theorem: Over C, closure(T_g) inside A_g is the locus of principally polarized Jacobians of stable compact-type genus-g curves. Its product factors come from the smooth components; non-compact-type generalized Jacobians have toric parts and are not A_g-points.
Prerequisites: AbelianVarietiesIsogenousToNoJacobian:MZ0/jacobian-locus, StableReductionPartII:MC.2/pointed-dm-theorem
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:MZ0/jacobian-hypersurface
The actual Siegel/PEL moduli, classical reduction or algebraic descent interfaces are open; no synthetic geometric carrier is used.
Planned construction: For g≥4 over C, choose a proper algebraic hypersurface H_g⊆A_g containing closure(T_g). The choice is an algebraic hypersurface in a quasi-projective moduli space; it need not be defined over Q.
Prerequisites: AbelianVarietiesIsogenousToNoJacobian:MZ0/torelli-dimension, AbelianVarietiesIsogenousToNoJacobian:MZ0/compact-type-closure, ShimuraCompactifications:C5
API TauCeti.NoJacobian.jacobianHypersurface.contains: Every canonically polarized compact-type Jacobian lies in the chosen H_g.
API TauCeti.NoJacobian.jacobianHypersurface.proper: H_g is a proper algebraic subset of pure codimension one after adding any needed hypersurface components.
API TauCeti.NoJacobian.jacobianHypersurface.dimension: dim H_g=G−1 on its nonempty components.
API TauCeti.NoJacobian.jacobianHypersurface.ambient: The containment is inside PELModuli A_g and is independent of a chosen level lift.
Test TauCeti.NoJacobian.jacobianHypersurface.genusFour (computation): For g=4 the Jacobian closure itself is the Schottky hypersurface.
Test TauCeti.NoJacobian.jacobianHypersurface.genusThree (non-example): The construction requires g≥4: closure(T_3)=A_3.
Test TauCeti.NoJacobian.jacobianHypersurface.levelForgetful (compatibility): Every fine-level lift of a Jacobian maps into H_g under the forgetful map.
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:MZ0/minkowski-domain
The actual Siegel/PEL moduli, classical reduction or algebraic descent interfaces are open; no synthetic geometric carrier is used.
Planned definition: For g≥1, F_g is the set of symmetric τ=x+iy in H_g for which y is Minkowski reduced, every |x_ij|≤1/2, and |det(cτ+d)|≥1 for every block matrix in Sp_{2g}(Z). Pin the classical reduction inequalities, including the ordered diagonal, and retain boundary equalities.
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

/- Omitted AbelianVarietiesIsogenousToNoJacobian:MZ0/igusa-diagonal-estimates
The actual Siegel/PEL moduli, classical reduction or algebraic descent interfaces are open; no synthetic geometric carrier is used.
Planned theorem: For each g≥1 there exists δ_g∈(0,1] such that every τ=x+iy∈F_g satisfies δ_g y^(0)≤y≤δ_g⁻¹y^(0), y^(0)≥δ_g I, and √3/2≤y_1≤⋯≤y_g. Matrix order means positive semidefinite difference.
Prerequisites: AbelianVarietiesIsogenousToNoJacobian:MZ0/minkowski-domain
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:MZ0/block-product-domain
The actual Siegel/PEL moduli, classical reduction or algebraic descent interfaces are open; no synthetic geometric carrier is used.
Planned lemma: If two genus-g matrices satisfy the diagonal comparisons with the same δ∈(0,1] and |x_ij|≤δ⁻¹, their block diagonal matrix in H_{2g} satisfies the same comparisons and real-entry bound. No ordered diagonal hypothesis is retained.
Prerequisites: AbelianVarietiesIsogenousToNoJacobian:MZ0/igusa-diagonal-estimates, mathlib:Matrix.fromBlocks
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:E0/elliptic-matrix
The actual elliptic lattice/isogeny, subgroup count and quantitative arithmetic interfaces are required; no unverified imported theorem is restated as a native assertion.
Planned theorem: If E, Ẽ are related by an isogeny of degree m and τ, τ̃ ∈ F satisfy j(τ) = j(E), j(τ̃) = j(Ẽ), then τ̃ = (aτ + b)/(cτ + d) with a, b, c, d ∈ Z, ad − bc = m and max{|a|, |b|, |c|, |d|} ≤ 2m^{3/2}.
Prerequisites: AbelianVarietiesIsogenousToNoJacobian:MZ0/minkowski-domain, ModularCurvesPartII:R12.1
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:E0/finite-subgroup-count
The actual elliptic lattice/isogeny, subgroup count and quantitative arithmetic interfaces are required; no unverified imported theorem is restated as a native assertion.
Planned theorem: For g≥1 there exists C_g>0 such that the number of finite subgroups Γ⊆(Q/Z)^{2g} of order at most m is ≤C_g m^{2g} for every integer m≥1. For g=1 the bound m² suffices.
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:E0/elliptic-many-classes
The actual elliptic lattice/isogeny, subgroup count and quantitative arithmetic interfaces are required; no unverified imported theorem is restated as a native assertion.
Planned theorem: For every integer N≥2, the curves E_j, j = n1 + in2 with 1 ≤ n1, n2 ≤ N, represent at least C_0^{-1} N²/(log N)⁴ isogeny classes, C_0 > 0 absolute.
Prerequisites: AbelianVarietiesIsogenousToNoJacobian:E0/finite-subgroup-count
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:E1/iterated-elimination
The modular polynomial and definable block/counting interfaces, with their guarded hypotheses, are not available in the checked native import cone.
Planned construction: Given f ≠ 0 in C[y1, y2] there is c = c(f) such that for every integer m≥1 there is G_m ≠ 0 in C[x1, x2] of degree at most cψ(m)² with G_m(ξ1, ξ2) = 0 whenever Φ_m(ξ1, η1) = Φ_m(ξ2, η2) = f(η1, η2) = 0.
Prerequisites: mathlib:Polynomial.resultant, mathlib:Polynomial.resultant_eq_zero_iff, ModularCurvesPartII:R13.4
API TauCeti.NoJacobian.eliminationPolynomial.nonzero: For f≠0 and m≥1 the chosen G_m is nonzero.
API TauCeti.NoJacobian.eliminationPolynomial.vanishes: A common solution of the two modular equations and f=0 maps to G_m=0.
API TauCeti.NoJacobian.eliminationPolynomial.degree: deg G_m≤c(f)ψ(m)².
API TauCeti.NoJacobian.eliminationPolynomial.constant: For nonzero constant f choose G_m=1.
API TauCeti.NoJacobian.eliminationPolynomial.resultantComparison: Each elimination uses Polynomial.resultant at the fixed source degree bounds, with its specialization law.
Test TauCeti.NoJacobian.eliminationPolynomial.constantOne (degenerate): For f=1 there are no common solutions and G_m=1 works.
Test TauCeti.NoJacobian.eliminationPolynomial.identityCorrespondence (computation): For m=1 and f(y1,y2)=y1−y2 one may choose G_1=x1−x2 up to a nonzero scalar.
Test TauCeti.NoJacobian.eliminationPolynomial.zeroExcluded (non-example): f=0 is excluded: a nonzero polynomial cannot vanish on every pair under the identity correspondence.
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:E1/psi-square-sum
The modular polynomial and definable block/counting interfaces, with their guarded hypotheses, are not available in the checked native import cone.
Planned lemma: For ψ(m)=m∏_{p|m}(1+1/p), ∑_{1≤m≤M}ψ(m)²≪M³ log M for integers M≥2. Also ∑_{m≤M}ψ(m)≤M² using ∑_{d≤M}d⌊M/d⌋, not the incorrectly printed ∑_{d≤M}d.
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:E1/small-isogeny-candidates
The modular polynomial and definable block/counting interfaces, with their guarded hypotheses, are not available in the checked native import cone.
Planned theorem: Fix a nonzero polynomial f∈Q̄[y1,y2] and the real algebraic curve C={c∈C:f(c,c̄)=0}, with constants depending on f. Given integers M ≥ 2 and N ≥ 1, there are only ≪_f N M³ log M pairs n = (n1, n2) with 1 ≤ n1, n2 ≤ N such that E_n (j = n1 + in2) is isogenous to its complex conjugate or to some E_c with c ∈ C via an isogeny of degree at most M.
Prerequisites: AbelianVarietiesIsogenousToNoJacobian:E1/iterated-elimination, AbelianVarietiesIsogenousToNoJacobian:E1/psi-square-sum, mathlib:MvPolynomial.schwartz_zippel_totalDegree, ModularCurvesPartII:R13.4
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:E1/elliptic-large-field
The modular polynomial and definable block/counting interfaces, with their guarded hypotheses, are not available in the checked native import cone.
Planned theorem: For N sufficiently large depending on the fixed f, with M=floor((log N)³)≥2, suppose E_n is isogenous to Ẽ=E_c with c∈C and n is outside the exceptions of Lemma 3.2 at this M. If Ẽ has a model over a number field of degree at most D̃≥2, then there is an isogeny of degree m̃≪D̃⁷ and log N≪D̃²(log D̃)². Constants depend only on the fixed curve.
Prerequisites: AbelianVarietiesIsogenousToNoJacobian:E1/small-isogeny-candidates
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:E1/elliptic-double-correspondence
The modular polynomial and definable block/counting interfaces, with their guarded hypotheses, are not available in the checked native import cone.
Planned construction: For τ,τ′∈H_1 and a non-modular absolutely irreducible C_f⊆C², put Z=F_1²∩(j×j)⁻¹(C_f). Let W_{τ,τ′}⊆R^8 be the pairs of real 2×2 fractional-linear matrices with both denominators nonzero and both outputs in Z. Its projection π sends a pair to those two periods; no determinant=m restriction is part of the ambient definable family.
Prerequisites: AbelianVarietiesIsogenousToNoJacobian:E0/elliptic-matrix, AbelianVarietiesIsogenousToNoJacobian:MZ0/period-matrix-correspondence, AbelianVarietiesIsogenousToNoJacobian:MZ0/minkowski-domain, ModularCurvesPartII:R12.1, LogicAndDefinabilityInNumberTheory:LD.6
API TauCeti.NoJacobian.ellipticDoubleCorrespondence.mem_iff: Membership requires both nonzero denominators and f(j(output1),j(output2))=0 with both outputs in F_1.
API TauCeti.NoJacobian.ellipticDoubleCorrespondence.projection: π(X,X′) is the ordered pair of fractional-linear images.
API TauCeti.NoJacobian.ellipticDoubleCorrespondence.height: The integral matrices arising from degree m isogenies have all eight entries at most 2m^{3/2}.
API TauCeti.NoJacobian.ellipticDoubleCorrespondence.productCompatibility: The two outputs agree with the genus-one specialization of periodMatrixCorrespondence.
Test TauCeti.NoJacobian.ellipticDoubleCorrespondence.identityPair (computation): For identity matrices membership is exactly (τ,τ′)∈Z.
Test TauCeti.NoJacobian.ellipticDoubleCorrespondence.oneZeroDenominator (non-example): A zero denominator in either factor excludes the pair even if the other factor is valid.
Test TauCeti.NoJacobian.ellipticDoubleCorrespondence.pairedNeeded (non-example): A single R^4 correspondence does not encode both conjugate modular equations used in this proof.
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:E1/elliptic-block-images
The modular polynomial and definable block/counting interfaces, with their guarded hypotheses, are not available in the checked native import cone.
Planned lemma: If C_f⊆C² is absolutely irreducible, involves both variables, and is neither a modular correspondence nor vertical/horizontal, then Z=F_1²∩(j×j)⁻¹(C_f) has empty algebraic part. Every connected Pila-block image under π is a point.
Prerequisites: AbelianVarietiesIsogenousToNoJacobian:E1/elliptic-double-correspondence, LogicAndDefinabilityInNumberTheory:LD.6
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:E1/elliptic-orbit-collapse
The modular polynomial and definable block/counting interfaces, with their guarded hypotheses, are not available in the checked native import cone.
Planned lemma: Outside the small-isogeny exceptional set, the paired periods of the conjugates of c have cardinality ≫D̃ and lie among ≤C_ε T^ε point images with T≤2m̃^{3/2}. Hence D̃≪m̃^{3ε/2}; choosing 0<ε<2/21 and m̃≪D̃^7 forces D̃≪1.
Prerequisites: AbelianVarietiesIsogenousToNoJacobian:E1/elliptic-block-images, AbelianVarietiesIsogenousToNoJacobian:E1/elliptic-large-field, LogicAndDefinabilityInNumberTheory:LD.6
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:E1/elliptic-modular-case
The modular polynomial and definable block/counting interfaces, with their guarded hypotheses, are not available in the checked native import cone.
Planned lemma: If the real algebraic curve becomes a modular correspondence Φ_m(j,j̄)=0, any E_n isogenous to a curve on it is isogenous to its own complex conjugate. The number of such n is ≪N(log N)^7; the fixed m changes the implied constant.
Prerequisites: AbelianVarietiesIsogenousToNoJacobian:E1/small-isogeny-candidates, AbelianVarietiesIsogenousToNoJacobian:E1/elliptic-large-field
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:E1/elliptic-avoidance
The modular polynomial and definable block/counting interfaces, with their guarded hypotheses, are not available in the checked native import cone.
Planned theorem: Given a real algebraic curve C in A_1(C) = R², there is C = C(C) such that for every integer N ≥ 2 there are at most C N(log N)^{10} pairs of integers 1 ≤ n1, n2 ≤ N for which E_j, j = n1 + in2, either has complex multiplication or is isogenous to some E_c with c ∈ C.
Prerequisites: AbelianVarietiesIsogenousToNoJacobian:E1/elliptic-orbit-collapse, AbelianVarietiesIsogenousToNoJacobian:E1/elliptic-modular-case, AbelianVarietiesIsogenousToNoJacobian:E1/small-isogeny-candidates, AbelianVarietiesIsogenousToNoJacobian:MZ0/coefficient-descent, AbelianVarietiesIsogenousToNoJacobian:E1/elliptic-large-field
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:E1/one-parameter-obstruction
The modular polynomial and definable block/counting interfaces, with their guarded hypotheses, are not available in the checked native import cone.
Planned lemma: Let d≥1 bound each variable degree of f. For n0≠0, if G_m(x+in0,x−in0) is identically zero, the modular function-field argument forces ψ(m)≤d. For each such m at most 2dψ(m)² integer offsets are exceptional.
Prerequisites: AbelianVarietiesIsogenousToNoJacobian:E1/iterated-elimination, ModularCurvesPartII:R13.4
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:E1/one-parameter-offset
The modular polynomial and definable block/counting interfaces, with their guarded hypotheses, are not available in the checked native import cone.
Planned theorem: Under the preceding obstruction lemma, some integer 1≤n0≤2d^4+1 avoids all identically vanishing G_m specializations simultaneously. The printed 2d³+1 and an explicit exceptional-count statement for the one-parameter family remain unestablished targets.
Prerequisites: AbelianVarietiesIsogenousToNoJacobian:E1/one-parameter-obstruction
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:I0/rational-analytic-trace
The actual abelian Hom/Rosati/lattice carriers and quantitative supplier refinements are open; only the independent native denominator theorem is typed.
Planned comparison: For a principally polarized complex A of dimension g≥1, a symplectic integral homology basis with polarization matrix ε and period τ=x+iy∈H_g, and endomorphisms v,w, the rational Rosati Gram entry tr_Q(ρ(v)ερ(w)^tε⁻¹) equals 2 Re tr_C(κ(v)yκ(w)̄^t y⁻¹). In particular ℓ(v)² is the rational expression and is twice the complex self-expression. D(A) is the determinant of the real rational Gram matrix, never of the complex Hermitian matrix.
Prerequisites: AbelianSchemesAndArithmeticModuli:A2/rosati-involution, AbelianSchemesAndArithmeticModuli:A6/rosati-positivity, AbelianSchemesAndArithmeticModuli:A6/characteristic-polynomial-on-tate-module, AbelianSchemesAndArithmeticModuli:A5
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:I0/entry-c-bounds
The actual abelian Hom/Rosati/lattice carriers and quantitative supplier refinements are open; only the independent native denominator theorem is typed.
Planned lemma: Let g≥1, 0<δ≤1 and τ=x+iy∈H_g be a period of a principally polarized complex A in a symplectic integral basis. Put D_y=diag(y_1,…,y_g), y_i=y_ii, and require δD_y≤y≤δ⁻¹D_y, D_y≥δI and |x_ij|≤δ⁻¹. For v∈End(A) let ρ(v)=(a,−b;−c,d) be its signed integral representation and let ℓ be the rational Rosati length of I0/rational-analytic-trace. Then |c_ij|≤C(g,δ)ℓ(v)/√(y_i y_j).
Prerequisites: AbelianVarietiesIsogenousToNoJacobian:I0/rational-analytic-trace, AbelianVarietiesIsogenousToNoJacobian:MZ0/block-product-domain
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:I0/entry-a-bounds
The actual abelian Hom/Rosati/lattice carriers and quantitative supplier refinements are open; only the independent native denominator theorem is typed.
Planned lemma: Let g≥1, 0<δ≤1 and τ=x+iy∈H_g be a period of a principally polarized complex A in a symplectic integral basis. Put D_y=diag(y_1,…,y_g), y_i=y_ii, and require δD_y≤y≤δ⁻¹D_y, D_y≥δI and |x_ij|≤δ⁻¹. For v∈End(A) let ρ(v)=(a,−b;−c,d) be its signed integral representation and let ℓ be the rational Rosati length of I0/rational-analytic-trace. Then |a_ij|≤C(g,δ)√(y_i/y_j)ℓ(v).
Prerequisites: AbelianVarietiesIsogenousToNoJacobian:I0/entry-c-bounds, AbelianVarietiesIsogenousToNoJacobian:I0/rational-analytic-trace
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:I0/entry-d-bounds
The actual abelian Hom/Rosati/lattice carriers and quantitative supplier refinements are open; only the independent native denominator theorem is typed.
Planned lemma: Let g≥1, 0<δ≤1 and τ=x+iy∈H_g be a period of a principally polarized complex A in a symplectic integral basis. Put D_y=diag(y_1,…,y_g), y_i=y_ii, and require δD_y≤y≤δ⁻¹D_y, D_y≥δI and |x_ij|≤δ⁻¹. For v∈End(A) let ρ(v)=(a,−b;−c,d) be its signed integral representation and let ℓ be the rational Rosati length of I0/rational-analytic-trace. Then |d_ij|≤C(g,δ)√(y_j/y_i)ℓ(v).
Prerequisites: AbelianVarietiesIsogenousToNoJacobian:I0/entry-c-bounds, AbelianVarietiesIsogenousToNoJacobian:I0/entry-a-bounds
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:I0/entry-b-bounds
The actual abelian Hom/Rosati/lattice carriers and quantitative supplier refinements are open; only the independent native denominator theorem is typed.
Planned lemma: Let g≥1, 0<δ≤1 and τ=x+iy∈H_g be a period of a principally polarized complex A in a symplectic integral basis. Put D_y=diag(y_1,…,y_g), y_i=y_ii, and require δD_y≤y≤δ⁻¹D_y, D_y≥δI and |x_ij|≤δ⁻¹. For v∈End(A) let ρ(v)=(a,−b;−c,d) be its signed integral representation and let ℓ be the rational Rosati length of I0/rational-analytic-trace. Then |b_ij|≤C(g,δ)√(y_i y_j)ℓ(v).
Prerequisites: AbelianVarietiesIsogenousToNoJacobian:I0/entry-d-bounds, AbelianVarietiesIsogenousToNoJacobian:I0/entry-a-bounds
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:I0/off-diagonal-extraction
The actual abelian Hom/Rosati/lattice carriers and quantitative supplier refinements are open; only the independent native denominator theorem is typed.
Planned construction: For B=A×Ã let e,ẽ be the two factor projections as endomorphisms. The additive Z-linear operator v↦v#=e v ẽ+ẽ v e sends a block Hom matrix to (α,α̃)↦(f̃(α̃),f(α)), with zero diagonal blocks. Its Rosati length is ≤C_gℓ(v).
Prerequisites: AbelianSchemesAndArithmeticModuli:A6/hom-is-free-of-finite-rank, AbelianVarietiesIsogenousToNoJacobian:I0/rational-analytic-trace
API TauCeti.NoJacobian.offDiagonal.apply: offDiagonal(v)(α,α̃)=(f̃(α̃),f(α)) in the source block decomposition.
API TauCeti.NoJacobian.offDiagonal.add: offDiagonal(v+w)=offDiagonal(v)+offDiagonal(w).
API TauCeti.NoJacobian.offDiagonal.idempotent: offDiagonal(offDiagonal(v))=offDiagonal(v).
API TauCeti.NoJacobian.offDiagonal.homComparison: The two off-diagonal entries are exactly the native product-Hom projections and not chosen maps.
Test TauCeti.NoJacobian.offDiagonal.identityZero (degenerate): offDiagonal(id_{A×Ã})=0.
Test TauCeti.NoJacobian.offDiagonal.alreadyOffDiagonal (characterisation): A block matrix with zero diagonal is unchanged.
Test TauCeti.NoJacobian.offDiagonal.sameFactorEndomorphism (non-example): An endomorphism acting only on A is sent to zero, not preserved.
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:I0/short-independent-family
The actual abelian Hom/Rosati/lattice carriers and quantitative supplier refinements are open; only the independent native denominator theorem is typed.
Planned lemma: For E=End(A×Ã) of rank r≤(4g)² and rational Rosati discriminant D, there are Z-linearly independent v_1,…,v_r with ∏ℓ(v_i)≤C_g√D. Each nonzero integral endomorphism has ℓ≥1, hence max_iℓ(v_i)≤C_g√D.
Prerequisites: AbelianVarietiesIsogenousToNoJacobian:I0/rational-analytic-trace, AbelianSchemesAndArithmeticModuli:A6/hom-is-free-of-finite-rank, GeometryOfNumbersAndQuadraticArithmetic:GN.1/successive-minimum-witnesses, GeometryOfNumbersAndQuadraticArithmetic:GN.1/minkowski-second-upper
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:I0/controlled-length-isogeny
The actual abelian Hom/Rosati/lattice carriers and quantitative supplier refinements are open; only the independent native denominator theorem is typed.
Planned theorem: There is c = c(g) such that for isogenous principally polarized A, Ã of dimension g there are isogenies f : A → Ã and f̃ : Ã → A such that v(α, α̃) = (f̃(α̃), f(α)) on A × Ã has ℓ(v) ≤ c D(A × Ã)^{1/2}; consequently (deg f)(deg f̃) = deg v ≤ ℓ(v)^{4g} (31).
Prerequisites: AbelianVarietiesIsogenousToNoJacobian:I0/short-independent-family, AbelianVarietiesIsogenousToNoJacobian:I0/off-diagonal-extraction, AbelianSchemesAndArithmeticModuli:A6/degree-is-a-polynomial-function, mathlib:MvPolynomial.eq_zero_of_eval_zero_at_prod_finset
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:I0/period-height
The actual abelian Hom/Rosati/lattice carriers and quantitative supplier refinements are open; only the independent native denominator theorem is typed.
Planned theorem: Given g ≥ 1 and 0 < δ ≤ 1 there is C = C(g, δ) such that if τ = x + iy∈H_g represents principally polarized A in a symplectic integral basis, defined over a number field of degree at most D, satisfies y ≥ δy^{(0)} and y^{(0)} ≥ δι, then y_i ≤ C D max{1, h(A)} for i = 1, …, g.
Prerequisites: AbelianVarietiesIsogenousToNoJacobian:MZ0/block-product-domain, ArakelovGeometryAndAbelianHeights:R35.3, AutomorphicBundles:B4, AutomorphicBundles:B5
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:G0/p-generic-isogeny
The actual arithmetic Galois and Mumford–Tate representations and quantitative specialization interfaces are open.
Planned comparison: For a number-field principally polarized A of dimension g and a prime p, openness of its p-adic division-field image in GSp_{2g}(Z_p) is invariant under geometric isogeny and Galois conjugation. Extend fields to define the isogeny, use finite-index restrictions, and compare integral lattices up to commensurability; do not assert equality of integral images.
Prerequisites: ArithmeticGaloisRepresentations:R01.6, AbelianSchemesAndArithmeticModuli:A3
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:G0/p-to-adelic
The actual arithmetic Galois and Mumford–Tate representations and quantitative specialization interfaces are open.
Planned theorem: For a principally polarized abelian variety of positive dimension over a number field, p-Galois genericity for a single prime p implies the Galois-generic property in Pink’s convention, using the precise adelic open-image theorem of Cadoret. No Mumford–Tate conjecture is assumed.
Prerequisites: ArithmeticGaloisRepresentations:R01.6, FaltingsFinitenessAndIsogenyTheorems:R28.4
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:G0/galois-to-hodge
The actual arithmetic Galois and Mumford–Tate representations and quantitative specialization interfaces are open.
Planned theorem: For a principally polarized number-field A, Galois genericity implies MT(H_1(A,Q))=GSp_{2g}, hence Hodge genericity of its A_g-point. The implication uses the absolute-Hodge theorem for abelian varieties; End(A)=Z alone is not a substitute.
Prerequisites: AbelianVarietiesIsogenousToNoJacobian:G0/p-to-adelic, ShimuraData:D1, ShimuraData:D4, ShimuraData:D5
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:G0/serre-open-image
The actual arithmetic Galois and Mumford–Tate representations and quantitative specialization interfaces are open.
Planned theorem: Let A be a dimension-g principally polarized abelian variety over a number field, with geometric End(A)=Z. If g is odd or g∈{2,6}, A is p-Galois generic for every prime p. No corresponding inference is made for g=4.
Prerequisites: ArithmeticGaloisRepresentations:R01.6, FaltingsFinitenessAndIsogenyTheorems:R28.4
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:G0/universal-open-monodromy
The actual arithmetic Galois and Mumford–Tate representations and quantitative specialization interfaces are open.
Planned theorem: For generic x of A^G and A_x in the projection of Ψ^{-1}(x), defined over a finite extension k_x of Q(x), the Galois group of k_x(A_x[p^∞])/k_x contains an open subgroup of Sp_{2g}(Z_p) (Deligne, Hodge II, Lemma 4.4.16), and is therefore open in GSp_{2g}(Z_p) by the Weil pairing.
Prerequisites: PELModuli:M2, PELModuli:M5, AbelianSchemesAndArithmeticModuli:A5, ArithmeticGaloisRepresentations:R01.6
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:G0/endomorphism-specialization
The actual arithmetic Galois and Mumford–Tate representations and quantitative specialization interfaces are open.
Planned theorem: For the fixed arithmetic finite cover π:Ã⇢A_g and dominant generically finite parameter map Ψ:Ã⇢A^G used in the candidate setup, take the associated polarized family on a specified common regular finite-fibre domain, with generic geometric endomorphism ring Z. For every N≥2, the number of integral n∈[1,N]^G for which some regular projected fibre has geometric End≠Z is ≪N^{G−1}(log N)^µ, µ=µ(g), with constants depending on the fixed family. The fixed algebraic bad locus contributes O(N^{G−1}) separately. This is the source-scoped application of Masser [23], not an assertion for an arbitrary complex family.
Prerequisites: PELModuli:M5, AbelianSchemesAndArithmeticModuli:A6/hom-is-free-of-finite-rank
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:G0/frattini-specialization
The actual arithmetic Galois and Mumford–Tate representations and quantitative specialization interfaces are open.
Planned lemma: For the open compact p-adic image G of the universal family, its Frattini subgroup Φ(G) is open. A specialized closed subgroup G_y with full image in G/Φ(G) equals G. Hilbert irreducibility excludes a thin set so that this full image holds outside it.
Prerequisites: AbelianVarietiesIsogenousToNoJacobian:G0/universal-open-monodromy, InverseGaloisAndArithmeticFundamentalGroups:IG.2
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:G0/genericity-grid-count
The actual arithmetic Galois and Mumford–Tate representations and quantitative specialization interfaces are open.
Planned theorem: For the fixed finite cover and generically finite parameter map, at most C[N^{G−1}(log N)^μ+N^{G−1/2}log N] integral n∈[1,N]^G have a projected fibre point which is not p-Galois generic, with fixed p and N≥2. If g is odd or g∈{2,6}, omit the half-saving term.
Prerequisites: AbelianVarietiesIsogenousToNoJacobian:G0/frattini-specialization, AbelianVarietiesIsogenousToNoJacobian:G0/endomorphism-specialization, AbelianVarietiesIsogenousToNoJacobian:G0/serre-open-image, mathlib:MvPolynomial.schwartz_zippel_totalDegree, InverseGaloisAndArithmeticFundamentalGroups:IG.2
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:MZ0/coefficient-descent
The actual Siegel/PEL moduli, classical reduction or algebraic descent interfaces are open; no synthetic geometric carrier is used.
Planned lemma: For a proper complex algebraic hypersurface H in a geometrically integral quasi-projective variety X defined over Q̄, its Q̄-points are contained in a proper Q̄-defined algebraic hypersurface H′. On a finite affine/projective cover, expand defining equations against a finite Q̄-linearly independent coefficient basis; all resulting coefficient equations vanish at algebraic points.
Prerequisites: AlgebraicModuliForArithmeticGeometry:R09.1, PELModuli:M5
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:C0/fibre-field-bound
The actual model fields, moduli rational maps, heights and quantitative isogeny interfaces are open.
Planned lemma: Let π:Ã⇢A_g and Ψ:Ã⇢A^G be dominant generically finite rational maps over number fields F̃,F_Ψ, with degree D_Ψ for Ψ. Outside a fixed algebraic exceptional locus, every projected fibre point over an integral n has a field of definition of degree ≤D=[F̃:Q][F_Ψ:Q]D_Ψ in the source’s moduli/model interpretation. Indeterminacy, nonfinite fibres and model descent are separate hypotheses.
Prerequisites: PELModuli:M2, PELModuli:M5, AlgebraicModuliForArithmeticGeometry:R09.1
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:C0/bounded-model-moduli
The actual model fields, moduli rational maps, heights and quantitative isogeny interfaces are open.
Planned theorem: For a principally polarized abelian variety Ã over Q̄ with moduli point x ∈ A_g(Q̄) and field of moduli Q(x), there is a field of definition K̃ ⊇ Q(x) of Ã with [K̃ : Q(x)] ≤ c(g): lift x to the fine moduli space A_{g,3} of principally polarized abelian varieties with full level-3 structure and take the residue field of the lift.
Prerequisites: PELModuli:M2, PELModuli:M5, AbelianSchemesAndArithmeticModuli:A3
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:C0/dual-small-isogeny-correspondence
The actual model fields, moduli rational maps, heights and quantitative isogeny interfaces are open.
Planned lemma: For principally polarized A,Ã and an isogeny f:A→Ã of degree m, identify the dual isogeny Ã∨→A∨ with an isogeny Ã→A of the same degree m using the principal polarizations. Thus A≅Ã/ker(f∨), without requiring f to preserve the polarizations.
Prerequisites: AbelianSchemesAndArithmeticModuli:A3, AbelianVarietiesIsogenousToNoJacobian:E0/finite-subgroup-count
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:C0/small-isogeny-hypersurfaces
The actual model fields, moduli rational maps, heights and quantitative isogeny interfaces are open.
Planned lemma: For the fixed algebraic hypersurface H⊂A_g and integer M≥1, the points A with geometric End(A)=Z connected to H by an isogeny of degree at most M are contained in an algebraic hypersurface whose degree in the fixed parameter model is ≤C M^{2g}. Nongeneric points are counted separately in G0/genericity-grid-count. The constant depends on the cover, parameter map, embedding and H, not on M,N. The projective correspondence-degree estimate is the explicit proof obligation in gap Isogeny correspondence degree refinement.
Prerequisites: AbelianVarietiesIsogenousToNoJacobian:C0/dual-small-isogeny-correspondence, AbelianVarietiesIsogenousToNoJacobian:E0/finite-subgroup-count, AlgebraicModuliForArithmeticGeometry:R09.1, PELModuli:M5, AbelianVarietiesIsogenousToNoJacobian:G0/galois-to-hodge
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:C0/candidate-count
The actual model fields, moduli rational maps, heights and quantitative isogeny interfaces are open.
Planned theorem: There is µ = µ(g) such that for integers M ≥ 1 and N ≥ 2 there are only ≪ N^{G−1}M^{2g} + N^{G−1}(log N)^µ + N^{G−1/2} log N elements n ∈ [1, N]^G such that some A_n in the projection of Ψ^{-1}(n) is (a) not defined over an extension of Q of degree at most D (1), (b) isogenous to some Ã in H via an isogeny to Ã of degree at most M, or (c) not p-Galois generic, for a fixed prime p (p = 2 will do); the implied constant depends only on Ã, Ψ, H. For g odd or g = 2, 6 the last term can be omitted.
Prerequisites: AbelianVarietiesIsogenousToNoJacobian:C0/fibre-field-bound, AbelianVarietiesIsogenousToNoJacobian:C0/small-isogeny-hypersurfaces, AbelianVarietiesIsogenousToNoJacobian:G0/genericity-grid-count, mathlib:MvPolynomial.schwartz_zippel_totalDegree
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:C0/height-discriminant
The actual model fields, moduli rational maps, heights and quantitative isogeny interfaces are open.
Planned lemma: For a candidate A=A_n and an isogenous Ã defined over a degree-D̃ field, with D̃≥2, D(A×Ã)≪max{D̃,log N+h(Ã)}^λ and max{1,h(A),h(Ã)}≪log N+log m̃ for the selected isogeny of degree m̃. The stable Faltings height may be negative.
Prerequisites: AbelianVarietiesIsogenousToNoJacobian:I0/controlled-length-isogeny, ArakelovGeometryAndAbelianHeights:R35.3, ArakelovGeometryAndAbelianHeights:R35.4
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:C0/isogeny-degree-height
The actual model fields, moduli rational maps, heights and quantitative isogeny interfaces are open.
Planned lemma: For λ=λ(g)>0, the selected isogeny f:A_n→Ã has degree m̃≪max{D̃,log N}^{2gλ}. Constants depend only on the fixed family and H.
Prerequisites: AbelianVarietiesIsogenousToNoJacobian:C0/height-discriminant, AbelianVarietiesIsogenousToNoJacobian:I0/controlled-length-isogeny, mathlib:isLittleO_log_rpow_rpow_atTop
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:C0/log-threshold
The actual model fields, moduli rational maps, heights and quantitative isogeny interfaces are open.
Planned lemma: Choose ν>2gλ and M=floor((log N)^ν). For sufficiently large N, a candidate avoiding all degree≤M isogenies but isogenous to Ã has (log N)^ν≪m̃≪D̃^{2gλ}.
Prerequisites: AbelianVarietiesIsogenousToNoJacobian:C0/isogeny-degree-height, AbelianVarietiesIsogenousToNoJacobian:C0/candidate-count
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:C1/correspondence-definability
The actual restricted uniformization, definable blocks, weakly-special and arithmetic orbit interfaces are open.
Planned lemma: If restricted J on F_g is definable and H is algebraic, Z=F_g∩J⁻¹(H) and the family W_τ(Z), with τ as a real parameter, are definable. On det(cτ+d)≠0 the projection π_τ(X)=(aτ+b)(cτ+d)⁻¹ is semialgebraic.
Prerequisites: AbelianVarietiesIsogenousToNoJacobian:MZ0/period-matrix-correspondence, AbelianVarietiesIsogenousToNoJacobian:MZ0/minkowski-domain, LogicAndDefinabilityInNumberTheory:LD.6
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:C1/galois-period-height
The actual restricted uniformization, definable blocks, weakly-special and arithmetic orbit interfaces are open.
Planned lemma: For the Galois conjugates Ã^σ fixing the fields of A and H, choose controlled-length isogenies and F_g period representatives. Their signed rational blocks ρ_σ are integral, project to τ̃_σ∈Z, and have sup norm ≤C D̃^λ after enlarging λ≥4.
Prerequisites: AbelianVarietiesIsogenousToNoJacobian:I0/denominator-invertible, AbelianVarietiesIsogenousToNoJacobian:I0/entry-c-bounds, AbelianVarietiesIsogenousToNoJacobian:I0/entry-a-bounds, AbelianVarietiesIsogenousToNoJacobian:I0/entry-d-bounds, AbelianVarietiesIsogenousToNoJacobian:I0/entry-b-bounds, AbelianVarietiesIsogenousToNoJacobian:I0/period-height, AbelianVarietiesIsogenousToNoJacobian:C0/height-discriminant, AbelianVarietiesIsogenousToNoJacobian:C0/log-threshold, AbelianVarietiesIsogenousToNoJacobian:MZ0/period-matrix-correspondence
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:C1/hodge-generic-zero-images
The actual restricted uniformization, definable blocks, weakly-special and arithmetic orbit interfaces are open.
Planned lemma: Every Pila block B containing a relevant integral ρ_σ has zero-dimensional connected image π_τ(B). A positive-dimensional image would give a positive-dimensional weakly-special K⊂H through the Hodge-generic Ã^σ, contradicting the point-or-whole-A_g dichotomy.
Prerequisites: AbelianVarietiesIsogenousToNoJacobian:C1/correspondence-definability, AbelianVarietiesIsogenousToNoJacobian:G0/p-generic-isogeny, AbelianVarietiesIsogenousToNoJacobian:G0/galois-to-hodge, LogicAndDefinabilityInNumberTheory:LD.6, ShimuraData:D4, ShimuraData:D5
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:C1/orbit-degree-collapse
The actual restricted uniformization, definable blocks, weakly-special and arithmetic orbit interfaces are open.
Planned lemma: Take a model field K̃ with [K̃:Q(x̃)]≤c(g) and D̃=max(2,[K̃:Q]). Distinct periods of conjugates fixing the fixed fields have cardinality ≥c′D̃. Uniform point-block counting and T≤C D̃^λ give D̃≤C_ε D̃^{λε}; choose 0<ε<1/λ to conclude D̃≤C.
Prerequisites: AbelianVarietiesIsogenousToNoJacobian:C0/bounded-model-moduli, AbelianVarietiesIsogenousToNoJacobian:C1/galois-period-height, AbelianVarietiesIsogenousToNoJacobian:C1/hodge-generic-zero-images, LogicAndDefinabilityInNumberTheory:LD.6
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:C1/counting-theorem
The actual restricted uniformization, definable blocks, weakly-special and arithmetic orbit interfaces are open.
Planned theorem: For g ≥ 2, a finite cover Ã of A_g, a finite map Ψ : Ã → A^G, an algebraic hypersurface H ⊂ A_g and γ < 1/2, there are C = C(Ã, Ψ, H, γ) and D = D(Ã, Ψ) = [F̃ : Q][F_Ψ : Q]D_Ψ (1) such that for every N ≥ 1 at most C N^{G−γ} elements n ∈ [1, N]^G have a point of Ψ^{-1}(n) whose projection to A_g is (a) not defined over an extension of Q of degree at most D, or (b) isogenous to some B in H; the remaining ones can be taken Galois (hence Hodge) generic ('strong Theorem 1.3'); for g odd or g = 2, 6 any γ < 1 works; and there are Ã, Ψ over Q with D(Ã, Ψ) = 2^{16g⁴}. Interpret covers and finite maps as dominant generically finite rational maps on their specified nonempty regular domains. The exceptional event is existential in a fibre; all regular projected points of each remaining fibre satisfy the conclusions.
Prerequisites: AbelianVarietiesIsogenousToNoJacobian:C0/candidate-count, AbelianVarietiesIsogenousToNoJacobian:C0/log-threshold, AbelianVarietiesIsogenousToNoJacobian:C1/orbit-degree-collapse, AbelianVarietiesIsogenousToNoJacobian:G0/p-to-adelic, AbelianVarietiesIsogenousToNoJacobian:G0/galois-to-hodge, mathlib:isLittleO_log_rpow_rpow_atTop, AbelianVarietiesIsogenousToNoJacobian:T0/theta-degree-map
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:T0/fourier-order
The actual automorphic form, Fourier/theta, projective-degree and arithmetic descent interfaces are open.
Planned definition: For a nonzero Λ-form ϕ of nonnegative integer weight, g≥2, with Fourier expansion indexed by positive-semidefinite symmetric rational M satisfying dM half-integral, define ord(ϕ)=min{tr M:a(M)≠0}. Half-integral means integral diagonal and half-integral off-diagonal. The trace support is a discrete nonnegative subset of (1/d)Z. Extend ord(0)=+∞ explicitly.
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

/- Omitted AbelianVarietiesIsogenousToNoJacobian:T0/order-superadditive
The actual automorphic form, Fourier/theta, projective-degree and arithmetic descent interfaces are open.
Planned lemma: For nonzero compatible Λ-forms ϕ_1,ϕ_2, ord(ϕ_1ϕ_2)≥ord(ϕ_1)+ord(ϕ_2). No equality is required; cancellation at the lowest trace cannot reduce the order.
Prerequisites: AbelianVarietiesIsogenousToNoJacobian:T0/fourier-order, AutomorphicBundles:B5
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:T0/norm-form
The actual automorphic form, Fourier/theta, projective-degree and arithmetic descent interfaces are open.
Planned construction: Let g≥2 and Λ◁Γ=Sp_{2g}(Z) have finite index n. For a Λ-form ϕ of weight k≥0 and representatives γ_1=1,…,γ_n, define Φ=∏_i ϕ(γ_iτ)/Δ(γ_i,τ)^k and Φ_1=∏_{i≥2}ϕ(γ_iτ)/Δ(γ_i,τ)^k. Then Φ is a Γ-form of weight nk and Φ_1 is a Λ-form of weight (n−1)k. For ϕ≠0 both are nonzero.
Prerequisites: AutomorphicBundles:B4, AbelianVarietiesIsogenousToNoJacobian:T0/fourier-order
API TauCeti.NoJacobian.normForm.product: The norm equals the stated finite product of slash transforms.
API TauCeti.NoJacobian.normForm.weight: Its Γ weight is index(Λ) times the original weight.
API TauCeti.NoJacobian.normForm.factorization: Φ=ϕΦ_1 with Φ_1 analytic of weight (n−1)k.
API TauCeti.NoJacobian.normForm.representativeIndependent: Changing the coset representatives does not change Φ, by the Λ law and the cocycle.
API TauCeti.NoJacobian.normForm.slashCompatibility: Each factor is the imported left-action slash transform in the AutomorphicBundles convention.
Test TauCeti.NoJacobian.normForm.indexOne (degenerate): For Λ=Γ, Φ=ϕ and Φ_1=1.
Test TauCeti.NoJacobian.normForm.constantOne (computation): The norm of the weight-zero constant form 1 is 1.
Test TauCeti.NoJacobian.normForm.wrongWeight (non-example): For n>1 and k>0 the norm has weight nk, not k.
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:T0/igusa-order-bound
The actual automorphic form, Fourier/theta, projective-degree and arithmetic descent interfaces are open.
Planned theorem: A nonzero Γ-form of weight k has ord ≤ κ_g k/(4π), with κ_g ≤ (2g/√3)c_g for the Minkowski constant c_g ≤ (4/π)^g Γ((g+1)/2)² (3/2)^{(g−1)(g−2)} (Igusa [18, Th. 7 p. 206, p. 197]; Lekkerkerker [22, p. 63]). Here g≥2, k≥0 and the form is nonzero; Γ((g+1)/2) in the constant is the Euler gamma function, not the symplectic group.
Prerequisites: AbelianVarietiesIsogenousToNoJacobian:T0/fourier-order, AutomorphicBundles:B4, AutomorphicBundles:B5, AbelianVarietiesIsogenousToNoJacobian:MZ0/igusa-diagonal-estimates
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:T0/finite-level-order-bound
The actual automorphic form, Fourier/theta, projective-degree and arithmetic descent interfaces are open.
Planned theorem: Let g≥2, k≥0 be an integer and Λ◁Γ=Sp_{2g}(Z) have finite index n=[Γ:Λ]. A nonzero Λ-form ϕ of weight k satisfies ord(ϕ)≤κ_g n k/(4π), with Fourier order and κ_g as in the preceding nodes.
Prerequisites: AbelianVarietiesIsogenousToNoJacobian:T0/norm-form, AbelianVarietiesIsogenousToNoJacobian:T0/order-superadditive, AbelianVarietiesIsogenousToNoJacobian:T0/igusa-order-bound
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:T0/theta-constants
The actual automorphic form, Fourier/theta, projective-degree and arithmetic descent interfaces are open.
Planned definition: For symmetric τ∈H_g and real row characteristics m,m*, define θ_{m,m*}(τ)=∑_{h∈Z^g}exp(πi(h+m)τ(h+m)^t+2πi(h+m)m*^t). For positive even integer e, define Γ(e,2e)={γ=(a,b;c,d)∈Sp_{2g}(Z):γ≡I mod e, diag(ab^t)≡diag(cd^t)≡0 mod 2e}. Equivalently use diag(a^tc),diag(b^td) in the second condition. The blocks here have the usual symplectic signs, independent of the signed endomorphism convention. Use the theta family θ_{m,0}(eτ), with m∈e⁻¹Z^g/Z^g and canonical representatives. For the projective model require 8|e and e a square.
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

/- Omitted AbelianVarietiesIsogenousToNoJacobian:T0/theta-linear-combinations
The actual automorphic form, Fourier/theta, projective-degree and arithmetic descent interfaces are open.
Planned lemma: For the specified positive even level e, the theta constants θ_{m,0}(eτ) have the common multiplier needed so that every complex linear combination χ has χ² a Γ(e,2e)-form of weight 1, with Fourier denominator e. For the geometric application use e=16.
Prerequisites: AbelianVarietiesIsogenousToNoJacobian:T0/theta-constants, AutomorphicBundles:B4
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:T0/fourier-index-count
The actual automorphic form, Fourier/theta, projective-degree and arithmetic descent interfaces are open.
Planned lemma: For W≥0 and e≥1, the number of positive-semidefinite symmetric rational g×g matrices M with eM half-integral and tr M≤W is at most (4eW+1)^G, where G=g(g+1)/2. Use the real bound as stated, or its correctly rounded integer version.
Prerequisites: AbelianVarietiesIsogenousToNoJacobian:T0/theta-constants, mathlib:Matrix.PosSemidef
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:T0/theta-coefficient-kernel
The actual automorphic form, Fourier/theta, projective-degree and arithmetic descent interfaces are open.
Planned theorem: Given C-linear combinations χ_1, …, χ_{G+2} of the θ_{m0}(eτ), a real W ≥ 0 and an integer D ≥ 0 with (D + 1)^{G+1} > (G + 1)!(4eW + 1)^G (48), there is a nonzero homogeneous P ∈ C[X_1, …, X_{G+2}] of degree D such that ϕ = P(χ_1², …, χ_{G+2}²), if nonzero, has ord(ϕ) > W: its coefficients a(M) vanish for every M with eM half-integral and tr(M) ≤ W, of which there are at most (4eW + 1)^G. The paper prints "ord(ϕ) ≥ W", which is too weak for the application with W = Nk; the proof gives the strict form (E11).
Prerequisites: AbelianVarietiesIsogenousToNoJacobian:T0/fourier-index-count, AbelianVarietiesIsogenousToNoJacobian:T0/theta-linear-combinations, AbelianVarietiesIsogenousToNoJacobian:T0/fourier-order
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:T0/theta-relation-vanishing
The actual automorphic form, Fourier/theta, projective-degree and arithmetic descent interfaces are open.
Planned lemma: Let n=[Γ:Γ(e,2e)] and β=κ_g n/(4π). If (D+1)^{G+1}>(G+1)!(4eβD+1)^G, the relation from the coefficient-kernel theorem with W=βD satisfies P(χ_1²,…,χ_{G+2}²)=0 identically. Its degree in the unsquared χ variables is 2D.
Prerequisites: AbelianVarietiesIsogenousToNoJacobian:T0/theta-coefficient-kernel, AbelianVarietiesIsogenousToNoJacobian:T0/finite-level-order-bound
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:T0/theta-projective-model
The actual automorphic form, Fourier/theta, projective-degree and arithmetic descent interfaces are open.
Planned construction: For e=16, form the quasi-projective image V_e of H_g under [θ_{m,0}(eτ)]_m and its irreducible projective closure. Its complex analytic quotient is the quotient of H_g by Γ(e,2e) in the exact source level interpretation. Its Q-coordinate model and Q-defined forgetful morphism to A_g require the arithmetic descent theorem, independently of any universal full-torsion family.
Prerequisites: AbelianVarietiesIsogenousToNoJacobian:T0/theta-constants, PELModuli:M5, ShimuraVarieties:V2, AlgebraicModuliForArithmeticGeometry:R09.1
API TauCeti.NoJacobian.thetaModel.coordinateMap: The coordinate map uses the family θ_{m,0}(16τ) in projective space.
API TauCeti.NoJacobian.thetaModel.dimension: dim V_16=G.
API TauCeti.NoJacobian.thetaModel.quotientComparison: The complex quotient comparison preserves the source’s exact congruence subgroup and coordinate ratios.
API TauCeti.NoJacobian.thetaModel.forgetful: The arithmetic theta model has its proved algebraic forgetful map to the PEL A_g.
API TauCeti.NoJacobian.thetaModel.levelDistinction: A full arithmetic symplectic-level model with universal scheme requires a separately proved comparison; it is not this coordinate model by definition.
Test TauCeti.NoJacobian.thetaModel.realThetaRatios (computation): At τ=iI_g the defined theta ratios are positive real.
Test TauCeti.NoJacobian.thetaModel.projectiveScaling (characterisation): A common nonzero scalar on all theta coordinates leaves the projective point unchanged.
Test TauCeti.NoJacobian.thetaModel.torsionField (non-example): The coordinate field and projective degree alone do not split A[16].
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:T0/generic-projection-degree
The actual automorphic form, Fourier/theta, projective-degree and arithmetic descent interfaces are open.
Planned theorem: Let V ⊂ P^r_C be an irreducible projective variety of dimension G < r. For generic linear forms χ_1, …, χ_{G+2}, the projection V ⇢ P^{G+1} is birational onto a hypersurface of degree deg V, so if the image lies in the zero set of a nonzero homogeneous polynomial of degree δ, then deg V ≤ δ. A generically finite projection V ⇢ P^G has degree at most deg V.
Prerequisites: AlgebraicModuliForArithmeticGeometry:R09.1, AlgebraicModuliForArithmeticGeometry:R09.2
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:T0/theta-numerical-degree
The actual automorphic form, Fourier/theta, projective-degree and arithmetic descent interfaces are open.
Planned theorem: For g≥2 and G=g(g+1)/2, deg V̄_16≤2(G+1)!((32g/(π√3))512^{2g²}c_g)^G≤2^{16g^4−1}, with c_g bounded by the source gamma/Minkowski expression. The index bound is [Γ:Γ(e,2e)]≤e^{2g²}(2e)^{2g²}.
Prerequisites: AbelianVarietiesIsogenousToNoJacobian:T0/theta-projective-model, AbelianVarietiesIsogenousToNoJacobian:T0/theta-relation-vanishing, AbelianVarietiesIsogenousToNoJacobian:T0/generic-projection-degree, AbelianVarietiesIsogenousToNoJacobian:T0/igusa-order-bound
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:T0/theta-degree-map
The actual automorphic form, Fourier/theta, projective-degree and arithmetic descent interfaces are open.
Planned construction: Choose a suitable subset of θ_{m,0}(16τ)/θ_{0,0}(16τ) as a dominant generically finite rational map Ψ:V_16⇢A^G. On its regular nonempty domain D_Ψ≤deg V̄_16≤2^{16g^4−1}. The source arithmetic descent gives F_Ψ=F̃=Q; the main bound can be enlarged to 2^{16g^4}. This statement contains no rational 16-torsion clause.
Prerequisites: AbelianVarietiesIsogenousToNoJacobian:T0/theta-projective-model, AbelianVarietiesIsogenousToNoJacobian:T0/theta-numerical-degree, AbelianVarietiesIsogenousToNoJacobian:T0/generic-projection-degree
API TauCeti.NoJacobian.thetaParameter.genericDegree: The generic degree is at most 2^{16g^4−1}.
API TauCeti.NoJacobian.thetaParameter.regularDomain: The coordinate ratios define a rational map on a nonempty open where denominators and finite-fibre conditions hold.
API TauCeti.NoJacobian.thetaParameter.fieldFormula: D=[F̃:Q][F_Ψ:Q]D_Ψ with the actual forgetful and parameter fields.
API TauCeti.NoJacobian.thetaParameter.projectionComparison: The degree bound is the generic linear/coordinate projection degree of the same projective theta model.
Test TauCeti.NoJacobian.thetaParameter.degreeVersusTorsion (non-example): A projective-degree estimate is not a bound for a torsion splitting extension.
Test TauCeti.NoJacobian.thetaParameter.quadraticAllowance (computation): If D_Ψ≤2^{16g^4−1}, then 2D_Ψ≤2^{16g^4}.
Test TauCeti.NoJacobian.thetaParameter.zeroDenominator (degenerate): A ratio with θ_{0,0}=0 lies outside that chart; it is not assigned an artificial parameter value.
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:A0/hypersurface-avoidance
The arithmetic avoidance, family and Jacobian/CM suppliers require their actual native interfaces; the source-correct statements remain in the definitive packet/reader.
Planned theorem: Given an algebraic hypersurface H in A_g with g ≥ 2, there is A in A_g, defined over an extension of Q of degree at most 2^{16g⁴} and Hodge generic, that is not isogenous to any B in H.
Prerequisites: AbelianVarietiesIsogenousToNoJacobian:C1/counting-theorem, AbelianVarietiesIsogenousToNoJacobian:T0/theta-degree-map, AbelianVarietiesIsogenousToNoJacobian:MZ0/coefficient-descent
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:A0/no-jacobian
The arithmetic avoidance, family and Jacobian/CM suppliers require their actual native interfaces; the source-correct statements remain in the definitive packet/reader.
Planned theorem: For every g ≥ 4 there is a principally polarized abelian variety of dimension g, defined over an extension of Q of degree at most 2^{16g⁴} and Hodge generic, that is not isogenous to any Jacobian. This excludes canonically principally polarized Jacobians of stable compact-type curves as well as smooth curves; isogenies need not respect polarizations.
Prerequisites: AbelianVarietiesIsogenousToNoJacobian:A0/hypersurface-avoidance, AbelianVarietiesIsogenousToNoJacobian:MZ0/jacobian-hypersurface
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:A0/many-classes
The arithmetic avoidance, family and Jacobian/CM suppliers require their actual native interfaces; the source-correct statements remain in the definitive packet/reader.
Planned theorem: For every ε>0 there are C_0=C_0(Ψ,ε)>0 and N_0 such that for every N≥N_0, the regular projected points from Ψ^{-1}(n), n∈[1,N]^G, represent at least C_0^{-1}N^{G−ε} isogeny classes. Work on a fixed common nonempty open where Ψ is regular with finite fibres and the forgetful map π is finite, so the parameter-to-moduli multiplicity is uniformly bounded. The bad algebraic domain is discarded separately, not counted with finite multiplicity.
Prerequisites: AbelianVarietiesIsogenousToNoJacobian:E0/finite-subgroup-count, AbelianVarietiesIsogenousToNoJacobian:C0/fibre-field-bound, ArakelovGeometryAndAbelianHeights:R35.3, AbelianVarietiesIsogenousToNoJacobian:G0/genericity-grid-count, AbelianVarietiesIsogenousToNoJacobian:G0/galois-to-hodge
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:A0/quadratic-approximation
The arithmetic avoidance, family and Jacobian/CM suppliers require their actual native interfaces; the source-correct statements remain in the definitive packet/reader.
Planned lemma: For every nonempty Euclidean open U⊆A_g(C), there is a Hodge-generic hypersurface-avoiding point in U with model degree≤2^{16g^4}. Lift a regular point to V_16, approximate its Ψ-image by ξ∈Q(i)^G and apply the counting theorem to Λ_d∘Ψ, where Λ_d(x)_j=1/[d(x_j−ξ_j)].
Prerequisites: AbelianVarietiesIsogenousToNoJacobian:C1/counting-theorem, AbelianVarietiesIsogenousToNoJacobian:T0/theta-degree-map, PELModuli:M5
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:A0/avoid-finite-isogeny-classes
The arithmetic avoidance, family and Jacobian/CM suppliers require their actual native interfaces; the source-correct statements remain in the definitive packet/reader.
Planned lemma: Each nonempty Euclidean open contains bounded-degree Hodge-generic hypersurface-avoiding points outside any prescribed finite set of isogeny classes.
Prerequisites: AbelianVarietiesIsogenousToNoJacobian:A0/quadratic-approximation, AbelianVarietiesIsogenousToNoJacobian:A0/many-classes, AbelianVarietiesIsogenousToNoJacobian:C1/counting-theorem
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:A0/dense-independent-set
The arithmetic avoidance, family and Jacobian/CM suppliers require their actual native interfaces; the source-correct statements remain in the definitive packet/reader.
Planned theorem: For every g ≥ 4 there is a set of principally polarized abelian varieties of dimension g, dense in the euclidean topology, each defined over an extension of Q of degree at most 2^{16g⁴} and not isogenous to any of the others or to any Jacobian.
Prerequisites: AbelianVarietiesIsogenousToNoJacobian:A0/no-jacobian, AbelianVarietiesIsogenousToNoJacobian:A0/avoid-finite-isogeny-classes
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:A0/unirational-count
The arithmetic avoidance, family and Jacobian/CM suppliers require their actual native interfaces; the source-correct statements remain in the definitive packet/reader.
Planned theorem: For g = 2, 3, 4, 5, assume a dominant rational map Ξ : A^G → A_g over Q. For every hypersurface H ⊂ A_g and γ < 1/2 there is C = C(Ξ, H, γ) such that for every N ≥ 1 at most C N^{G−γ} elements n ∈ [1, N]^G have Ξ(n) (a) not defined over Q or (b) isogenous to some B in H; the others can be taken Hodge generic, and for g = 2, 3, 5 any γ < 1 works.
Prerequisites: AbelianVarietiesIsogenousToNoJacobian:C0/candidate-count, AbelianVarietiesIsogenousToNoJacobian:C1/orbit-degree-collapse, AbelianVarietiesIsogenousToNoJacobian:G0/galois-to-hodge
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:A0/rational-fourfold
The arithmetic avoidance, family and Jacobian/CM suppliers require their actual native interfaces; the source-correct statements remain in the definitive packet/reader.
Planned theorem: If A_4 is unirational over Q, there is a principally polarized abelian fourfold defined over Q and Hodge generic that is not isogenous to any Jacobian.
Prerequisites: AbelianVarietiesIsogenousToNoJacobian:A0/unirational-count, AbelianVarietiesIsogenousToNoJacobian:MZ0/jacobian-hypersurface
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:A0/bounded-cm-count
The arithmetic avoidance, family and Jacobian/CM suppliers require their actual native interfaces; the source-correct statements remain in the definitive packet/reader.
Planned theorem: For a fixed arithmetic family of points whose model-field degrees have a common bound, the number of distinct CM projected moduli points in A_g is bounded independently of N, using the shared CM orbit lower bound and bounded-discriminant finiteness. A bound on parameter tuples follows only after restriction to a specified common open where Ψ is regular with finite fibres and π is finite; exceptional positive-dimensional fibres are excluded, not included in an O(1) count. For the 2012 orbit-bound route retain 1≤g≤6 unconditionally and GRH for larger g; the accepted averaged-Colmez/Tsimerman Part II supplies the unconditional all-g replacement once proved.
Prerequisites: AbelianVarietiesIsogenousToNoJacobian:C0/fibre-field-bound, ComplexMultiplicationAndExplicitReciprocity:CM.0, ComplexMultiplicationAndExplicitReciprocity:CM.2
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:A0/igusa-schottky
The arithmetic avoidance, family and Jacobian/CM suppliers require their actual native interfaces; the source-correct statements remain in the definitive packet/reader.
Planned theorem: F_g(τ) = 2^g U_g(τ) − V_g(τ)² with U_g = Σ θ_{mm*}(τ)^{16}, V_g = Σ θ_{mm*}(τ)^8 over m, m* ∈ 2^{-1}Z^g/Z^g is a Γ-form of weight 8; it vanishes identically on A_g for 1≤g≤3, and for g = 4 its zero locus is the closure of the Jacobian locus (Grushevsky [16, Th. 3.8]).
Prerequisites: AbelianVarietiesIsogenousToNoJacobian:T0/theta-constants, AutomorphicBundles:B4, AbelianVarietiesIsogenousToNoJacobian:MZ0/compact-type-closure
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:A0/theta-product-factorization
The arithmetic avoidance, family and Jacobian/CM suppliers require their actual native interfaces; the source-correct statements remain in the definitive packet/reader.
Planned lemma: For block-diagonal τ=diag(τ′,τ″), θ_{m,m*}(τ) factors as the product of the two block theta constants. Hence U_{g′+g″}=U_{g′}U_{g″} and V_{g′+g″}=V_{g′}V_{g″} in the source’s sixteenth/eighth-power sums.
Prerequisites: AbelianVarietiesIsogenousToNoJacobian:T0/theta-constants
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:A0/products-in-torelli-closure
The arithmetic avoidance, family and Jacobian/CM suppliers require their actual native interfaces; the source-correct statements remain in the definitive packet/reader.
Planned theorem: For block-diagonal τ, U_g and V_g factor as products; hence F_4 vanishes on products of two principally polarized abelian surfaces and on products of an elliptic curve with a principally polarized abelian threefold, which therefore lie in the closure of the Jacobian locus of A_4.
Prerequisites: AbelianVarietiesIsogenousToNoJacobian:A0/igusa-schottky, AbelianVarietiesIsogenousToNoJacobian:A0/theta-product-factorization
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:X0/coefficient-envelope
The analytic period and moduli maps and representative-selection interfaces are open; the scalar Newton construction is the separately typed native component.
Planned lemma: For any injective real sequence t_n∈[1,2], there are positive ε_n such that |a_n|≤ε_n for every n implies the coefficient envelope of X0/newton-series. Choosing target values s_n so that the triangular Newton coefficient a_n lies in that disk gives F(t_n)=s_n.
Prerequisites: AbelianVarietiesIsogenousToNoJacobian:X0/newton-series
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:X0/elliptic-period-selection
The analytic period and moduli maps and representative-selection interfaces are open; the scalar Newton construction is the separately typed native component.
Planned lemma: Enumerate algebraic j-invariants and choose representative periods. Positive rational scaling and rational translation preserve elliptic isogeny classes. They allow distinct imaginary parts t_n∈[1,2] and real parts s_n that meet each successive Newton coefficient tolerance.
Prerequisites: AbelianVarietiesIsogenousToNoJacobian:X0/coefficient-envelope, ModularCurvesPartII:R12.1
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:X0/elliptic-interpolation-image
The analytic period and moduli maps and representative-selection interfaces are open; the scalar Newton construction is the separately typed native component.
Planned construction: The image Z={j(F(y)+iy):1≤y≤2}, with the coefficient-tolerant F from the elliptic selection, is compact and real-analytically parametrized, has |j|≤2079+e^{4π}, and meets every algebraic elliptic isogeny class. By the real-curve avoidance theorem it is not contained in any real algebraic curve. No embeddedness assertion is made.
Prerequisites: AbelianVarietiesIsogenousToNoJacobian:X0/elliptic-period-selection, AbelianVarietiesIsogenousToNoJacobian:X0/newton-series, AbelianVarietiesIsogenousToNoJacobian:E1/elliptic-avoidance, ModularCurvesPartII:R12.1
API TauCeti.NoJacobian.ellipticInterpolationImage.image: Z is the image of [1,2] under y↦j(F(y)+iy).
API TauCeti.NoJacobian.ellipticInterpolationImage.compact: Z is compact in C.
API TauCeti.NoJacobian.ellipticInterpolationImage.meetsClass: Every elliptic curve over Q̄ is isogenous to a curve with j∈Z.
API TauCeti.NoJacobian.ellipticInterpolationImage.periodCompatibility: Its isogeny relation is the imported rational lattice relation, not a private equivalence on j-values.
Test TauCeti.NoJacobian.ellipticInterpolationImage.imaginaryBounds (computation): Every period used has imaginary part between 1 and 2.
Test TauCeti.NoJacobian.ellipticInterpolationImage.algebraicCurve (non-example): Z cannot be contained in a real algebraic curve.
Test TauCeti.NoJacobian.ellipticInterpolationImage.complexContinuation (degenerate): The positivity assertion concerns real y∈[1,2]; arbitrary complex parameters are not asserted to lie in H_1.
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:X0/symplectic-dense-selection
The analytic period and moduli maps and representative-selection interfaces are open; the scalar Newton construction is the separately typed native component.
Planned lemma: The action of Sp_{2g}(Q) on H_g has dense orbit through every τ, and each rational symplectic translate represents an isogenous principally polarized abelian variety. Thus each enumerated algebraic class can meet a prescribed nonempty period neighbourhood.
Prerequisites: ShimuraData:D5, AbelianSchemesAndArithmeticModuli:A5
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:X0/matrix-interpolation-image
The analytic period and moduli maps and representative-selection interfaces are open; the scalar Newton construction is the separately typed native component.
Planned construction: For g≥2, choose distinct interpolation parameters t_n∈[1,2] and representatives τ_n of all algebraic moduli points, modified by Sp_{2g}(ℚ) within their isogeny classes. Newton interpolation constructs matrices F_x,F_w of entire functions, real on the real line, with F_x(t_n)=x_n and F_w(t_n)=w_n, such that F(t)=F_x(t)+i(I+F_w(t)F_w(t)^t) lies in H_g for real t∈[1,2]. Its compact real-analytic parametrized image K=J(F([1,2])) meets every isogeny class represented by A_g(ℚ̄). No embedded-curve or global closed analytic hypersurface assertion is part of this construction.
Prerequisites: AbelianVarietiesIsogenousToNoJacobian:X0/newton-series, AbelianVarietiesIsogenousToNoJacobian:X0/coefficient-envelope, AbelianVarietiesIsogenousToNoJacobian:X0/symplectic-dense-selection, tauceti:TauCeti.cholesky, tauceti:TauCeti.continuous_cholesky, mathlib:Matrix.PosDef.one, mathlib:Matrix.PosDef.add_posSemidef, mathlib:Matrix.posSemidef_self_mul_conjTranspose, PELModuli:M5, AbelianSchemesAndArithmeticModuli:A5
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

/- Omitted AbelianVarietiesIsogenousToNoJacobian:T1/arithmetic-comparison-cover
The arithmetic theta/fine-level comparison, cyclotomic/torsion descent and total degree estimate remain the unresolved E14 gate.
Planned construction: Specify a finite arithmetic cover Y→V_16, a universal principally polarized abelian scheme on Y and a full symplectic/similitude 16-level trivialization, together with its comparison to the analytic theta quotient. Its number-field base, cyclotomic component, polarization and degree are part of the required data. Existence with the target numerical degree remains the /73 gate.
Prerequisites: AbelianVarietiesIsogenousToNoJacobian:T0/theta-projective-model, PELModuli:M2, PELModuli:M5, AbelianSchemesAndArithmeticModuli:A3, AbelianSchemesAndArithmeticModuli:A5
API TauCeti.NoJacobian.arithmeticComparisonCover.projection: Y has its finite comparison map to the theta coordinate model.
API TauCeti.NoJacobian.arithmeticComparisonCover.universalFamily: The pullback of the PEL universal polarized scheme carries the specified complete level trivialization.
API TauCeti.NoJacobian.arithmeticComparisonCover.degree: The coefficient fields and generic comparison-cover degree are explicit.
API TauCeti.NoJacobian.arithmeticComparisonCover.analyticComparison: Its analytification comparison preserves polarization and the exact congruence-level interpretation.
Test TauCeti.NoJacobian.arithmeticComparisonCover.realBase (non-example): A real residue field cannot carry a principally polarized family with all sixteen-torsion rational.
Test TauCeti.NoJacobian.arithmeticComparisonCover.cyclotomicOnly (non-example): Containing ζ_16 does not itself trivialize the entire Galois module.
Test TauCeti.NoJacobian.arithmeticComparisonCover.degreeOne (degenerate): Even a geometrically degree-one comparison needs proof of its arithmetic descent field.
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:T1/rational-torsion-cyclotomic
The arithmetic theta/fine-level comparison, cyclotomic/torsion descent and total degree estimate remain the unresolved E14 gate.
Planned lemma: Let (A,λ)/K be principally polarized of dimension g≥1 in characteristic zero. If all A[16](K̄) are K-rational, then μ_16⊆K: choose an exact-order-16 point and use perfection of the alternating Weil pairing to find a partner pairing to a primitive sixteenth root.
Prerequisites: AbelianSchemesAndArithmeticModuli:A3, ArithmeticGaloisRepresentations:R01.6, mathlib:NumberField.InfinitePlace.IsPrimitiveRoot.nrRealPlaces_eq_zero_of_two_lt
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:T1/full-degree-bookkeeping
The arithmetic theta/fine-level comparison, cyclotomic/torsion descent and total degree estimate remain the unresolved E14 gate.
Planned lemma: For a proved comparison cover Y and Ψ_Y=Ψ∘π, use D(Y,Ψ_Y)=[F_Y:Q][F_{Ψ_Y}:Q]D_{Ψ_Y}, including the comparison degree. Alternatively for a residue-field tower K_θ⊆K_A⊆K_cyc=K_A(ζ_16)⊆K_tor, [K_tor:Q] is the product of all four successive degrees and [K_cyc:K_A]≤8. The two descriptions must not count the same extension twice.
Prerequisites: AbelianVarietiesIsogenousToNoJacobian:T1/arithmetic-comparison-cover, AbelianVarietiesIsogenousToNoJacobian:T1/rational-torsion-cyclotomic, AbelianVarietiesIsogenousToNoJacobian:T0/theta-degree-map
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:T1/supplementary-torsion-target
The arithmetic theta/fine-level comparison, cyclotomic/torsion descent and total degree estimate remain the unresolved E14 gate.
Planned theorem: Unresolved supplementary target, not part of Theorem 1.1: construct the hypersurface-avoiding principally polarized A over a number field K of degree ≤2^{16g⁴} with every point of A[16] K-rational. The printed inference from Γ(16,32) to its theta coordinate field is insufficient. This conclusion is gated until the arithmetic fine-level comparison and its complete degree bound are proved.
Prerequisites: AbelianVarietiesIsogenousToNoJacobian:A0/hypersurface-avoidance, AbelianVarietiesIsogenousToNoJacobian:T1/arithmetic-comparison-cover, AbelianVarietiesIsogenousToNoJacobian:T1/full-degree-bookkeeping
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:X1/satake-dimension-obstruction
The singular analytic-space/Satake boundary adapters and local-domain replacement remain open; the false globally closed endpoint is not asserted.
Planned lemma: For g≥2 and G=g(g+1)/2, the projective Siegel Satake boundary has dimension G−g and every pure analytic hypersurface in the open A_g has local dimension G−1>G−g. At g=1 the inequality becomes equality and this obstruction argument does not apply.
Prerequisites: ShimuraCompactifications:C5, ShimuraVarieties:V2
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:X1/closed-hypersurface-algebraic
The singular analytic-space/Satake boundary adapters and local-domain replacement remain open; the false globally closed endpoint is not asserted.
Planned theorem: For g≥2, every globally closed pure analytic hypersurface W⊂A_g(C) is algebraic. Its closure in the projective Satake compactification is analytic by the singular-space Remmert–Stein extension across the lower-dimensional boundary, then algebraic by Chow; restriction returns W because W is closed in A_g.
Prerequisites: AbelianVarietiesIsogenousToNoJacobian:X1/satake-dimension-obstruction, ComplexComparisonPartII:C0, ComplexComparisonPartII:C4
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:X1/no-global-interpolation-hypersurface
The singular analytic-space/Satake boundary adapters and local-domain replacement remain open; the false globally closed endpoint is not asserted.
Planned theorem: For g≥2 there is no globally closed pure analytic hypersurface W⊂A_g(C) that meets every algebraic isogeny class. In particular the compact interpolation image K cannot be promoted to the globally closed transcendental hypersurface asserted in the printed §5.4 endpoint.
Prerequisites: AbelianVarietiesIsogenousToNoJacobian:X1/closed-hypersurface-algebraic, AbelianVarietiesIsogenousToNoJacobian:A0/hypersurface-avoidance, AbelianVarietiesIsogenousToNoJacobian:X0/matrix-interpolation-image
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:X1/local-hypersurface-specification
The singular analytic-space/Satake boundary adapters and local-domain replacement remain open; the false globally closed endpoint is not asserted.
Planned definition: A local replacement consists of an explicitly chosen open U⊆A_g(C) containing K and a pure codimension-one analytic subset W_U closed relative to U, containing K. Local defining equations must be defined on specified domains and have proved compatibility/extensions on overlaps. A germwise or nonclosed replacement has its own separately stated conclusion; no existence is supplied by this specification.
Prerequisites: ComplexComparisonPartII:C0, AbelianVarietiesIsogenousToNoJacobian:X0/matrix-interpolation-image
API TauCeti.NoJacobian.localHypersurfaceSpec.ambient: The specification exports an actual open U and the inclusion K⊆U.
API TauCeti.NoJacobian.localHypersurfaceSpec.relativeClosed: W_U is closed as an analytic subset of U, not asserted closed in all A_g.
API TauCeti.NoJacobian.localHypersurfaceSpec.contains: K⊆W_U.
API TauCeti.NoJacobian.localHypersurfaceSpec.overlap: The specified local analytic ideals/equations restrict compatibly on every stated overlap.
Test TauCeti.NoJacobian.localHypersurfaceSpec.genusTwoGlobal (non-example): Taking U=A_2 would force a class-covering closed hypersurface to be algebraic and contradict avoidance.
Test TauCeti.NoJacobian.localHypersurfaceSpec.differentDomains (non-example): A finite product of functions on different open sets is not a global equation without compatible extensions.
Test TauCeti.NoJacobian.localHypersurfaceSpec.sameDomainProduct (compatibility): On a common domain, a finite product of holomorphic equations is holomorphic and its zero set is their union.
-/

/- Omitted AbelianVarietiesIsogenousToNoJacobian:X1/local-replacement-target
The singular analytic-space/Satake boundary adapters and local-domain replacement remain open; the false globally closed endpoint is not asserted.
Planned construction: Construct and prove a local-hypersurface specification for the compact K, or a precisely stated germwise/nonclosed replacement, with its actual ambient domain and equation compatibility. The paper’s compactness argument does not establish this existence; no replacement is activated in this planning pass.
Prerequisites: AbelianVarietiesIsogenousToNoJacobian:X1/local-hypersurface-specification
API TauCeti.NoJacobian.localReplacement.specification: A successful construction returns the actual specified U,W_U and containment of K.
API TauCeti.NoJacobian.localReplacement.equations: All equation domains and their compatibility proofs are identified.
API TauCeti.NoJacobian.localReplacement.analyticComparison: The constructed analytic subset uses the existing singular analytic-space supplier and not only smooth-chart functions.
Test TauCeti.NoJacobian.localReplacement.globalImpossible (non-example): A globally closed class-covering hypersurface in A_g is ruled out for g≥2.
Test TauCeti.NoJacobian.localReplacement.compactnessInsufficient (non-example): A finite cover of K by charts alone does not extend their equations to a common ambient domain.
Test TauCeti.NoJacobian.localReplacement.restriction (compatibility): A valid relative analytic hypersurface restricts to one on every smaller open containing the required part of K.
-/
